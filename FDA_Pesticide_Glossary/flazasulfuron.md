---
output:
  html_document:
    self_contained: no
---

```r
library(knitr)
knit_hooks$set(webgl = hook_webgl)
cat('<script type="text/javascript">', readLines(system.file('WebGL', 'CanvasMatrix.js', package = 'rgl')), '</script>', sep = '\n')
```

<script type="text/javascript">
CanvasMatrix4=function(m){if(typeof m=='object'){if("length"in m&&m.length>=16){this.load(m[0],m[1],m[2],m[3],m[4],m[5],m[6],m[7],m[8],m[9],m[10],m[11],m[12],m[13],m[14],m[15]);return}else if(m instanceof CanvasMatrix4){this.load(m);return}}this.makeIdentity()};CanvasMatrix4.prototype.load=function(){if(arguments.length==1&&typeof arguments[0]=='object'){var matrix=arguments[0];if("length"in matrix&&matrix.length==16){this.m11=matrix[0];this.m12=matrix[1];this.m13=matrix[2];this.m14=matrix[3];this.m21=matrix[4];this.m22=matrix[5];this.m23=matrix[6];this.m24=matrix[7];this.m31=matrix[8];this.m32=matrix[9];this.m33=matrix[10];this.m34=matrix[11];this.m41=matrix[12];this.m42=matrix[13];this.m43=matrix[14];this.m44=matrix[15];return}if(arguments[0]instanceof CanvasMatrix4){this.m11=matrix.m11;this.m12=matrix.m12;this.m13=matrix.m13;this.m14=matrix.m14;this.m21=matrix.m21;this.m22=matrix.m22;this.m23=matrix.m23;this.m24=matrix.m24;this.m31=matrix.m31;this.m32=matrix.m32;this.m33=matrix.m33;this.m34=matrix.m34;this.m41=matrix.m41;this.m42=matrix.m42;this.m43=matrix.m43;this.m44=matrix.m44;return}}this.makeIdentity()};CanvasMatrix4.prototype.getAsArray=function(){return[this.m11,this.m12,this.m13,this.m14,this.m21,this.m22,this.m23,this.m24,this.m31,this.m32,this.m33,this.m34,this.m41,this.m42,this.m43,this.m44]};CanvasMatrix4.prototype.getAsWebGLFloatArray=function(){return new WebGLFloatArray(this.getAsArray())};CanvasMatrix4.prototype.makeIdentity=function(){this.m11=1;this.m12=0;this.m13=0;this.m14=0;this.m21=0;this.m22=1;this.m23=0;this.m24=0;this.m31=0;this.m32=0;this.m33=1;this.m34=0;this.m41=0;this.m42=0;this.m43=0;this.m44=1};CanvasMatrix4.prototype.transpose=function(){var tmp=this.m12;this.m12=this.m21;this.m21=tmp;tmp=this.m13;this.m13=this.m31;this.m31=tmp;tmp=this.m14;this.m14=this.m41;this.m41=tmp;tmp=this.m23;this.m23=this.m32;this.m32=tmp;tmp=this.m24;this.m24=this.m42;this.m42=tmp;tmp=this.m34;this.m34=this.m43;this.m43=tmp};CanvasMatrix4.prototype.invert=function(){var det=this._determinant4x4();if(Math.abs(det)<1e-8)return null;this._makeAdjoint();this.m11/=det;this.m12/=det;this.m13/=det;this.m14/=det;this.m21/=det;this.m22/=det;this.m23/=det;this.m24/=det;this.m31/=det;this.m32/=det;this.m33/=det;this.m34/=det;this.m41/=det;this.m42/=det;this.m43/=det;this.m44/=det};CanvasMatrix4.prototype.translate=function(x,y,z){if(x==undefined)x=0;if(y==undefined)y=0;if(z==undefined)z=0;var matrix=new CanvasMatrix4();matrix.m41=x;matrix.m42=y;matrix.m43=z;this.multRight(matrix)};CanvasMatrix4.prototype.scale=function(x,y,z){if(x==undefined)x=1;if(z==undefined){if(y==undefined){y=x;z=x}else z=1}else if(y==undefined)y=x;var matrix=new CanvasMatrix4();matrix.m11=x;matrix.m22=y;matrix.m33=z;this.multRight(matrix)};CanvasMatrix4.prototype.rotate=function(angle,x,y,z){angle=angle/180*Math.PI;angle/=2;var sinA=Math.sin(angle);var cosA=Math.cos(angle);var sinA2=sinA*sinA;var length=Math.sqrt(x*x+y*y+z*z);if(length==0){x=0;y=0;z=1}else if(length!=1){x/=length;y/=length;z/=length}var mat=new CanvasMatrix4();if(x==1&&y==0&&z==0){mat.m11=1;mat.m12=0;mat.m13=0;mat.m21=0;mat.m22=1-2*sinA2;mat.m23=2*sinA*cosA;mat.m31=0;mat.m32=-2*sinA*cosA;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==1&&z==0){mat.m11=1-2*sinA2;mat.m12=0;mat.m13=-2*sinA*cosA;mat.m21=0;mat.m22=1;mat.m23=0;mat.m31=2*sinA*cosA;mat.m32=0;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==0&&z==1){mat.m11=1-2*sinA2;mat.m12=2*sinA*cosA;mat.m13=0;mat.m21=-2*sinA*cosA;mat.m22=1-2*sinA2;mat.m23=0;mat.m31=0;mat.m32=0;mat.m33=1;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else{var x2=x*x;var y2=y*y;var z2=z*z;mat.m11=1-2*(y2+z2)*sinA2;mat.m12=2*(x*y*sinA2+z*sinA*cosA);mat.m13=2*(x*z*sinA2-y*sinA*cosA);mat.m21=2*(y*x*sinA2-z*sinA*cosA);mat.m22=1-2*(z2+x2)*sinA2;mat.m23=2*(y*z*sinA2+x*sinA*cosA);mat.m31=2*(z*x*sinA2+y*sinA*cosA);mat.m32=2*(z*y*sinA2-x*sinA*cosA);mat.m33=1-2*(x2+y2)*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}this.multRight(mat)};CanvasMatrix4.prototype.multRight=function(mat){var m11=(this.m11*mat.m11+this.m12*mat.m21+this.m13*mat.m31+this.m14*mat.m41);var m12=(this.m11*mat.m12+this.m12*mat.m22+this.m13*mat.m32+this.m14*mat.m42);var m13=(this.m11*mat.m13+this.m12*mat.m23+this.m13*mat.m33+this.m14*mat.m43);var m14=(this.m11*mat.m14+this.m12*mat.m24+this.m13*mat.m34+this.m14*mat.m44);var m21=(this.m21*mat.m11+this.m22*mat.m21+this.m23*mat.m31+this.m24*mat.m41);var m22=(this.m21*mat.m12+this.m22*mat.m22+this.m23*mat.m32+this.m24*mat.m42);var m23=(this.m21*mat.m13+this.m22*mat.m23+this.m23*mat.m33+this.m24*mat.m43);var m24=(this.m21*mat.m14+this.m22*mat.m24+this.m23*mat.m34+this.m24*mat.m44);var m31=(this.m31*mat.m11+this.m32*mat.m21+this.m33*mat.m31+this.m34*mat.m41);var m32=(this.m31*mat.m12+this.m32*mat.m22+this.m33*mat.m32+this.m34*mat.m42);var m33=(this.m31*mat.m13+this.m32*mat.m23+this.m33*mat.m33+this.m34*mat.m43);var m34=(this.m31*mat.m14+this.m32*mat.m24+this.m33*mat.m34+this.m34*mat.m44);var m41=(this.m41*mat.m11+this.m42*mat.m21+this.m43*mat.m31+this.m44*mat.m41);var m42=(this.m41*mat.m12+this.m42*mat.m22+this.m43*mat.m32+this.m44*mat.m42);var m43=(this.m41*mat.m13+this.m42*mat.m23+this.m43*mat.m33+this.m44*mat.m43);var m44=(this.m41*mat.m14+this.m42*mat.m24+this.m43*mat.m34+this.m44*mat.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.multLeft=function(mat){var m11=(mat.m11*this.m11+mat.m12*this.m21+mat.m13*this.m31+mat.m14*this.m41);var m12=(mat.m11*this.m12+mat.m12*this.m22+mat.m13*this.m32+mat.m14*this.m42);var m13=(mat.m11*this.m13+mat.m12*this.m23+mat.m13*this.m33+mat.m14*this.m43);var m14=(mat.m11*this.m14+mat.m12*this.m24+mat.m13*this.m34+mat.m14*this.m44);var m21=(mat.m21*this.m11+mat.m22*this.m21+mat.m23*this.m31+mat.m24*this.m41);var m22=(mat.m21*this.m12+mat.m22*this.m22+mat.m23*this.m32+mat.m24*this.m42);var m23=(mat.m21*this.m13+mat.m22*this.m23+mat.m23*this.m33+mat.m24*this.m43);var m24=(mat.m21*this.m14+mat.m22*this.m24+mat.m23*this.m34+mat.m24*this.m44);var m31=(mat.m31*this.m11+mat.m32*this.m21+mat.m33*this.m31+mat.m34*this.m41);var m32=(mat.m31*this.m12+mat.m32*this.m22+mat.m33*this.m32+mat.m34*this.m42);var m33=(mat.m31*this.m13+mat.m32*this.m23+mat.m33*this.m33+mat.m34*this.m43);var m34=(mat.m31*this.m14+mat.m32*this.m24+mat.m33*this.m34+mat.m34*this.m44);var m41=(mat.m41*this.m11+mat.m42*this.m21+mat.m43*this.m31+mat.m44*this.m41);var m42=(mat.m41*this.m12+mat.m42*this.m22+mat.m43*this.m32+mat.m44*this.m42);var m43=(mat.m41*this.m13+mat.m42*this.m23+mat.m43*this.m33+mat.m44*this.m43);var m44=(mat.m41*this.m14+mat.m42*this.m24+mat.m43*this.m34+mat.m44*this.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.ortho=function(left,right,bottom,top,near,far){var tx=(left+right)/(left-right);var ty=(top+bottom)/(top-bottom);var tz=(far+near)/(far-near);var matrix=new CanvasMatrix4();matrix.m11=2/(left-right);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=0;matrix.m32=0;matrix.m33=-2/(far-near);matrix.m34=0;matrix.m41=tx;matrix.m42=ty;matrix.m43=tz;matrix.m44=1;this.multRight(matrix)};CanvasMatrix4.prototype.frustum=function(left,right,bottom,top,near,far){var matrix=new CanvasMatrix4();var A=(right+left)/(right-left);var B=(top+bottom)/(top-bottom);var C=-(far+near)/(far-near);var D=-(2*far*near)/(far-near);matrix.m11=(2*near)/(right-left);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2*near/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=A;matrix.m32=B;matrix.m33=C;matrix.m34=-1;matrix.m41=0;matrix.m42=0;matrix.m43=D;matrix.m44=0;this.multRight(matrix)};CanvasMatrix4.prototype.perspective=function(fovy,aspect,zNear,zFar){var top=Math.tan(fovy*Math.PI/360)*zNear;var bottom=-top;var left=aspect*bottom;var right=aspect*top;this.frustum(left,right,bottom,top,zNear,zFar)};CanvasMatrix4.prototype.lookat=function(eyex,eyey,eyez,centerx,centery,centerz,upx,upy,upz){var matrix=new CanvasMatrix4();var zx=eyex-centerx;var zy=eyey-centery;var zz=eyez-centerz;var mag=Math.sqrt(zx*zx+zy*zy+zz*zz);if(mag){zx/=mag;zy/=mag;zz/=mag}var yx=upx;var yy=upy;var yz=upz;xx=yy*zz-yz*zy;xy=-yx*zz+yz*zx;xz=yx*zy-yy*zx;yx=zy*xz-zz*xy;yy=-zx*xz+zz*xx;yx=zx*xy-zy*xx;mag=Math.sqrt(xx*xx+xy*xy+xz*xz);if(mag){xx/=mag;xy/=mag;xz/=mag}mag=Math.sqrt(yx*yx+yy*yy+yz*yz);if(mag){yx/=mag;yy/=mag;yz/=mag}matrix.m11=xx;matrix.m12=xy;matrix.m13=xz;matrix.m14=0;matrix.m21=yx;matrix.m22=yy;matrix.m23=yz;matrix.m24=0;matrix.m31=zx;matrix.m32=zy;matrix.m33=zz;matrix.m34=0;matrix.m41=0;matrix.m42=0;matrix.m43=0;matrix.m44=1;matrix.translate(-eyex,-eyey,-eyez);this.multRight(matrix)};CanvasMatrix4.prototype._determinant2x2=function(a,b,c,d){return a*d-b*c};CanvasMatrix4.prototype._determinant3x3=function(a1,a2,a3,b1,b2,b3,c1,c2,c3){return a1*this._determinant2x2(b2,b3,c2,c3)-b1*this._determinant2x2(a2,a3,c2,c3)+c1*this._determinant2x2(a2,a3,b2,b3)};CanvasMatrix4.prototype._determinant4x4=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;return a1*this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4)-b1*this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4)+c1*this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4)-d1*this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4)};CanvasMatrix4.prototype._makeAdjoint=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;this.m11=this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4);this.m21=-this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4);this.m31=this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4);this.m41=-this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4);this.m12=-this._determinant3x3(b1,b3,b4,c1,c3,c4,d1,d3,d4);this.m22=this._determinant3x3(a1,a3,a4,c1,c3,c4,d1,d3,d4);this.m32=-this._determinant3x3(a1,a3,a4,b1,b3,b4,d1,d3,d4);this.m42=this._determinant3x3(a1,a3,a4,b1,b3,b4,c1,c3,c4);this.m13=this._determinant3x3(b1,b2,b4,c1,c2,c4,d1,d2,d4);this.m23=-this._determinant3x3(a1,a2,a4,c1,c2,c4,d1,d2,d4);this.m33=this._determinant3x3(a1,a2,a4,b1,b2,b4,d1,d2,d4);this.m43=-this._determinant3x3(a1,a2,a4,b1,b2,b4,c1,c2,c4);this.m14=-this._determinant3x3(b1,b2,b3,c1,c2,c3,d1,d2,d3);this.m24=this._determinant3x3(a1,a2,a3,c1,c2,c3,d1,d2,d3);this.m34=-this._determinant3x3(a1,a2,a3,b1,b2,b3,d1,d2,d3);this.m44=this._determinant3x3(a1,a2,a3,b1,b2,b3,c1,c2,c3)}
</script>

This works fine.


```r
x <- sort(rnorm(1000))
y <- rnorm(1000)
z <- rnorm(1000) + atan2(x,y)
plot3d(x, y, z, col=rainbow(1000))
```

<canvas id="testgltextureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** points object 7 ****** -->
<script id="testglvshader7" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
gl_PointSize = 3.;
vCol = aCol;
}
</script>
<script id="testglfshader7" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 9 ****** -->
<script id="testglvshader9" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader9" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 10 ****** -->
<script id="testglvshader10" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader10" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 11 ****** -->
<script id="testglvshader11" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader11" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 12 ****** -->
<script id="testglvshader12" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader12" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 13 ****** -->
<script id="testglvshader13" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader13" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 14 ****** -->
<script id="testglvshader14" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader14" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 15 ****** -->
<script id="testglvshader15" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader15" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 16 ****** -->
<script id="testglvshader16" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader16" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 17 ****** -->
<script id="testglvshader17" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader17" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 18 ****** -->
<script id="testglvshader18" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader18" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testglwebGLStart() {
var debug = function(msg) {
document.getElementById("testgldebug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testglcanvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 1;
zoom[1] = 1;
fov[1] = 30;
userMatrix[1] = new CanvasMatrix4();
userMatrix[1].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
function drawTextToCanvas(text, cex) {
var canvasX, canvasY;
var textX, textY;
var textHeight = 20 * cex;
var textColour = "white";
var fontFamily = "Arial";
var backgroundColour = "rgba(0,0,0,0)";
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
ctx.font = textHeight+"px "+fontFamily;
canvasX = 1;
var widths = [];
for (var i = 0; i < text.length; i++)  {
widths[i] = ctx.measureText(text[i]).width;
canvasX = (widths[i] > canvasX) ? widths[i] : canvasX;
}	  
canvasX = getPowerOfTwo(canvasX);
var offset = 2*textHeight; // offset to first baseline
var skip = 2*textHeight;   // skip between baselines	  
canvasY = getPowerOfTwo(offset + text.length*skip);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.fillStyle = backgroundColour;
ctx.fillRect(0, 0, ctx.canvas.width, ctx.canvas.height);
ctx.fillStyle = textColour;
ctx.textAlign = "left";
ctx.textBaseline = "alphabetic";
ctx.font = textHeight+"px "+fontFamily;
for(var i = 0; i < text.length; i++) {
textY = i*skip + offset;
ctx.fillText(text[i], 0,  textY);
}
return {canvasX:canvasX, canvasY:canvasY,
widths:widths, textHeight:textHeight,
offset:offset, skip:skip};
}
// ****** points object 7 ******
var prog7  = gl.createProgram();
gl.attachShader(prog7, getShader( gl, "testglvshader7" ));
gl.attachShader(prog7, getShader( gl, "testglfshader7" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog7, 0, "aPos");
gl.bindAttribLocation(prog7, 1, "aCol");
gl.linkProgram(prog7);
var v=new Float32Array([
-4.259531, 0.6682253, -1.686531, 1, 0, 0, 1,
-3.020391, -0.9574913, -1.291363, 1, 0.007843138, 0, 1,
-2.958763, 0.9327829, 0.3994044, 1, 0.01176471, 0, 1,
-2.918836, 0.01396903, 0.313254, 1, 0.01960784, 0, 1,
-2.778629, 0.9594626, -4.214814, 1, 0.02352941, 0, 1,
-2.533737, -1.658151, -1.226174, 1, 0.03137255, 0, 1,
-2.496048, -0.6552382, -2.510781, 1, 0.03529412, 0, 1,
-2.451282, -0.2797433, -3.05746, 1, 0.04313726, 0, 1,
-2.426926, 0.1022048, -2.244715, 1, 0.04705882, 0, 1,
-2.417959, -2.737361, -2.346704, 1, 0.05490196, 0, 1,
-2.41015, -0.3354087, -0.07790615, 1, 0.05882353, 0, 1,
-2.343188, 0.09385704, -2.160563, 1, 0.06666667, 0, 1,
-2.307046, -0.5435919, -4.25338, 1, 0.07058824, 0, 1,
-2.258981, 0.3505424, -1.0328, 1, 0.07843138, 0, 1,
-2.244528, -2.26223, -2.277088, 1, 0.08235294, 0, 1,
-2.243424, -0.07829683, -2.455034, 1, 0.09019608, 0, 1,
-2.235412, 1.16121, -1.361247, 1, 0.09411765, 0, 1,
-2.231565, -1.121819, -1.445843, 1, 0.1019608, 0, 1,
-2.224607, -0.04141677, -1.30776, 1, 0.1098039, 0, 1,
-2.067393, 0.6439219, -2.662626, 1, 0.1137255, 0, 1,
-2.066717, -1.64473, -0.4991197, 1, 0.1215686, 0, 1,
-2.056493, -0.6845499, -2.417099, 1, 0.1254902, 0, 1,
-2.045355, 0.7366106, -2.010268, 1, 0.1333333, 0, 1,
-2.005809, 1.280177, -1.938739, 1, 0.1372549, 0, 1,
-2.000647, 0.06240025, -0.7642359, 1, 0.145098, 0, 1,
-1.984045, 1.714347, 0.4380721, 1, 0.1490196, 0, 1,
-1.939492, 1.268632, -1.471657, 1, 0.1568628, 0, 1,
-1.922937, 0.2305408, -0.5159482, 1, 0.1607843, 0, 1,
-1.920275, 0.1511966, -0.7319615, 1, 0.1686275, 0, 1,
-1.920169, -0.7362015, -1.786751, 1, 0.172549, 0, 1,
-1.904972, 0.2822385, -2.24206, 1, 0.1803922, 0, 1,
-1.902823, -2.147043, -1.844734, 1, 0.1843137, 0, 1,
-1.896778, -0.947937, -1.340977, 1, 0.1921569, 0, 1,
-1.872263, -1.284151, -3.828932, 1, 0.1960784, 0, 1,
-1.872169, 1.628343, -1.775289, 1, 0.2039216, 0, 1,
-1.865222, 0.5396767, -1.706088, 1, 0.2117647, 0, 1,
-1.854198, 2.465584, -0.5189338, 1, 0.2156863, 0, 1,
-1.813382, 0.4611552, -3.435077, 1, 0.2235294, 0, 1,
-1.81045, 0.1277634, -1.672474, 1, 0.227451, 0, 1,
-1.789505, -0.5993877, -3.766018, 1, 0.2352941, 0, 1,
-1.786314, 1.246737, -0.8117953, 1, 0.2392157, 0, 1,
-1.731213, 0.5465967, -1.968088, 1, 0.2470588, 0, 1,
-1.726451, 1.433786, -1.396543, 1, 0.2509804, 0, 1,
-1.725739, 0.7103376, -0.8168384, 1, 0.2588235, 0, 1,
-1.724343, 0.7685829, -1.910933, 1, 0.2627451, 0, 1,
-1.717626, -0.6399716, -3.11321, 1, 0.2705882, 0, 1,
-1.704969, -0.272402, -2.514764, 1, 0.2745098, 0, 1,
-1.677439, 0.1043843, -2.904689, 1, 0.282353, 0, 1,
-1.668039, 1.485989, 1.367199, 1, 0.2862745, 0, 1,
-1.652674, -0.4849862, -1.801108, 1, 0.2941177, 0, 1,
-1.651592, 1.875078, -1.531302, 1, 0.3019608, 0, 1,
-1.65005, -0.3935861, -2.439688, 1, 0.3058824, 0, 1,
-1.64289, 0.3200783, -1.237997, 1, 0.3137255, 0, 1,
-1.640406, 0.6594154, -1.432307, 1, 0.3176471, 0, 1,
-1.631096, -1.435835, -1.803838, 1, 0.3254902, 0, 1,
-1.607923, 0.5615883, -1.738713, 1, 0.3294118, 0, 1,
-1.601033, 1.347777, -2.632564, 1, 0.3372549, 0, 1,
-1.598839, 0.7334021, -0.3013052, 1, 0.3411765, 0, 1,
-1.59626, -1.441387, -1.476046, 1, 0.3490196, 0, 1,
-1.595989, 0.6539033, -1.309638, 1, 0.3529412, 0, 1,
-1.587436, 1.220222, -0.1812994, 1, 0.3607843, 0, 1,
-1.576965, -1.417453, -1.34251, 1, 0.3647059, 0, 1,
-1.566691, 0.1020265, -1.001407, 1, 0.372549, 0, 1,
-1.564465, -0.6534131, -0.9428554, 1, 0.3764706, 0, 1,
-1.563802, -0.1211802, -1.010734, 1, 0.3843137, 0, 1,
-1.561315, 0.8856713, -0.9079019, 1, 0.3882353, 0, 1,
-1.515163, -0.002106995, -1.824976, 1, 0.3960784, 0, 1,
-1.511593, 1.320451, -0.2340941, 1, 0.4039216, 0, 1,
-1.497547, -0.4845378, 0.04579193, 1, 0.4078431, 0, 1,
-1.495694, 1.007111, 1.069156, 1, 0.4156863, 0, 1,
-1.492673, -1.1071, -1.582615, 1, 0.4196078, 0, 1,
-1.488874, 1.536449, -0.6957112, 1, 0.427451, 0, 1,
-1.484068, 0.5386582, -1.538388, 1, 0.4313726, 0, 1,
-1.480819, -0.5941522, -2.262189, 1, 0.4392157, 0, 1,
-1.475468, -0.5899983, -2.187527, 1, 0.4431373, 0, 1,
-1.474957, -0.7499635, -3.656793, 1, 0.4509804, 0, 1,
-1.474654, -0.6064292, -1.99175, 1, 0.454902, 0, 1,
-1.469487, -0.1377277, -2.780548, 1, 0.4627451, 0, 1,
-1.464723, 0.2216993, -0.5777765, 1, 0.4666667, 0, 1,
-1.456417, -0.80229, -2.204183, 1, 0.4745098, 0, 1,
-1.453928, -1.244711, -4.253508, 1, 0.4784314, 0, 1,
-1.450155, 0.2232966, -0.4146568, 1, 0.4862745, 0, 1,
-1.440241, 0.5064693, -0.2717468, 1, 0.4901961, 0, 1,
-1.430468, 0.7380133, -0.4991796, 1, 0.4980392, 0, 1,
-1.43022, 0.3119453, -2.951066, 1, 0.5058824, 0, 1,
-1.426498, -0.9043773, -0.03923856, 1, 0.509804, 0, 1,
-1.419357, 0.2861592, -2.192538, 1, 0.5176471, 0, 1,
-1.410372, 0.06423263, -3.716842, 1, 0.5215687, 0, 1,
-1.40261, 0.2783856, -0.4563737, 1, 0.5294118, 0, 1,
-1.400715, 1.285857, 0.6450308, 1, 0.5333334, 0, 1,
-1.396943, 0.6544483, -1.336429, 1, 0.5411765, 0, 1,
-1.391934, 0.3170611, -2.696767, 1, 0.5450981, 0, 1,
-1.384365, -0.6204649, -3.010159, 1, 0.5529412, 0, 1,
-1.381787, 0.1119529, -0.46104, 1, 0.5568628, 0, 1,
-1.374567, 0.1916065, -1.626742, 1, 0.5647059, 0, 1,
-1.368927, 0.6548983, -1.089023, 1, 0.5686275, 0, 1,
-1.368116, -0.1059477, -2.396008, 1, 0.5764706, 0, 1,
-1.363749, 0.08019145, -2.241981, 1, 0.5803922, 0, 1,
-1.361961, -1.092324, -2.843071, 1, 0.5882353, 0, 1,
-1.352448, -1.680599, -3.371955, 1, 0.5921569, 0, 1,
-1.35157, -1.149036, -1.783054, 1, 0.6, 0, 1,
-1.348894, -0.8499587, -0.3745003, 1, 0.6078432, 0, 1,
-1.346537, 0.0398619, -0.9010642, 1, 0.6117647, 0, 1,
-1.327532, 1.252788, 0.7364038, 1, 0.6196079, 0, 1,
-1.325736, 1.141407, -1.538981, 1, 0.6235294, 0, 1,
-1.32569, -0.8234055, -1.806874, 1, 0.6313726, 0, 1,
-1.325264, -1.405103, -1.435899, 1, 0.6352941, 0, 1,
-1.315945, 1.282071, -2.017885, 1, 0.6431373, 0, 1,
-1.310033, -1.154176, -1.470452, 1, 0.6470588, 0, 1,
-1.308474, -0.6209351, -1.297662, 1, 0.654902, 0, 1,
-1.29985, -0.3008722, -2.095972, 1, 0.6588235, 0, 1,
-1.290417, -2.661872, -3.767466, 1, 0.6666667, 0, 1,
-1.287466, 0.2543525, -2.073718, 1, 0.6705883, 0, 1,
-1.286213, -0.07869837, -1.838631, 1, 0.6784314, 0, 1,
-1.274425, -0.354378, -0.422065, 1, 0.682353, 0, 1,
-1.272348, 0.165225, -1.74295, 1, 0.6901961, 0, 1,
-1.271517, 1.444495, -1.211094, 1, 0.6941177, 0, 1,
-1.271401, -1.413015, -0.4701262, 1, 0.7019608, 0, 1,
-1.265007, 0.05979674, -2.657735, 1, 0.7098039, 0, 1,
-1.261291, -1.150907, -3.256723, 1, 0.7137255, 0, 1,
-1.258006, 1.305348, 0.2540857, 1, 0.7215686, 0, 1,
-1.25174, 0.5031695, -2.517723, 1, 0.7254902, 0, 1,
-1.251452, -1.530661, -1.984756, 1, 0.7333333, 0, 1,
-1.247158, 1.972694, 0.7984647, 1, 0.7372549, 0, 1,
-1.247067, 1.577669, 1.180817, 1, 0.7450981, 0, 1,
-1.241032, 0.4845646, -2.354536, 1, 0.7490196, 0, 1,
-1.229162, -0.6698564, -2.196549, 1, 0.7568628, 0, 1,
-1.229072, -0.2659539, -0.1950219, 1, 0.7607843, 0, 1,
-1.226306, 0.4088995, -0.8929958, 1, 0.7686275, 0, 1,
-1.225311, -1.766202, -2.90024, 1, 0.772549, 0, 1,
-1.22076, -0.8897719, -3.951897, 1, 0.7803922, 0, 1,
-1.216716, 1.425993, -1.385268, 1, 0.7843137, 0, 1,
-1.215561, -0.08789703, -2.394661, 1, 0.7921569, 0, 1,
-1.209392, -0.1318534, 0.4102368, 1, 0.7960784, 0, 1,
-1.207137, -1.578011, -3.739736, 1, 0.8039216, 0, 1,
-1.199493, 1.26666, 0.355471, 1, 0.8117647, 0, 1,
-1.197915, 0.2461434, 0.1047889, 1, 0.8156863, 0, 1,
-1.192434, -0.1359325, -2.353537, 1, 0.8235294, 0, 1,
-1.182874, 0.1231826, -0.802188, 1, 0.827451, 0, 1,
-1.182405, -0.6669456, -1.268248, 1, 0.8352941, 0, 1,
-1.18019, 0.02053629, -1.42991, 1, 0.8392157, 0, 1,
-1.1764, 0.6227171, -1.021502, 1, 0.8470588, 0, 1,
-1.164672, -1.600175, -2.659171, 1, 0.8509804, 0, 1,
-1.155192, -2.220273, -2.026322, 1, 0.8588235, 0, 1,
-1.141792, 0.4589364, -1.382027, 1, 0.8627451, 0, 1,
-1.130809, 0.7886491, 0.6358506, 1, 0.8705882, 0, 1,
-1.128716, -0.03971629, -1.980356, 1, 0.8745098, 0, 1,
-1.127417, -0.4968281, -2.515105, 1, 0.8823529, 0, 1,
-1.126612, 2.152872, -0.5055159, 1, 0.8862745, 0, 1,
-1.120428, 0.2879145, 0.3847627, 1, 0.8941177, 0, 1,
-1.119887, 0.1513819, -0.11339, 1, 0.8980392, 0, 1,
-1.116369, -0.3355589, -3.045532, 1, 0.9058824, 0, 1,
-1.115093, 0.1565633, -2.48402, 1, 0.9137255, 0, 1,
-1.11155, -1.038446, -2.748221, 1, 0.9176471, 0, 1,
-1.101162, -1.752817, -2.760413, 1, 0.9254902, 0, 1,
-1.097502, -0.4582919, -3.751113, 1, 0.9294118, 0, 1,
-1.085542, 1.388524, -0.7743395, 1, 0.9372549, 0, 1,
-1.079165, -0.03854895, -1.157066, 1, 0.9411765, 0, 1,
-1.073839, -1.619048, -2.359078, 1, 0.9490196, 0, 1,
-1.069819, -0.2321213, -3.384595, 1, 0.9529412, 0, 1,
-1.069232, -0.6794682, -1.991853, 1, 0.9607843, 0, 1,
-1.061598, 0.140679, -2.546497, 1, 0.9647059, 0, 1,
-1.055794, 1.088477, -1.98892, 1, 0.972549, 0, 1,
-1.04857, 0.6044521, -0.4635383, 1, 0.9764706, 0, 1,
-1.044994, 0.4966715, -0.6336888, 1, 0.9843137, 0, 1,
-1.037541, 2.234376, -2.344615, 1, 0.9882353, 0, 1,
-1.033852, 0.2142685, -1.011248, 1, 0.9960784, 0, 1,
-1.026763, 1.445226, -1.274221, 0.9960784, 1, 0, 1,
-1.024597, 0.01723544, -3.053735, 0.9921569, 1, 0, 1,
-1.024083, 1.259594, -0.8349459, 0.9843137, 1, 0, 1,
-1.023473, 0.3013442, 1.346203, 0.9803922, 1, 0, 1,
-1.022318, 0.2797527, -1.938789, 0.972549, 1, 0, 1,
-1.012609, 0.1646758, -2.28674, 0.9686275, 1, 0, 1,
-1.005688, 1.174229, -0.1404137, 0.9607843, 1, 0, 1,
-1.004827, 0.9876796, -1.164077, 0.9568627, 1, 0, 1,
-1.003454, 0.2776752, -1.843048, 0.9490196, 1, 0, 1,
-1.001683, -0.7340428, -4.260474, 0.945098, 1, 0, 1,
-0.9881272, 0.3126798, 0.02273695, 0.9372549, 1, 0, 1,
-0.9744743, -1.017063, -2.883202, 0.9333333, 1, 0, 1,
-0.9705629, 0.2117182, -2.380167, 0.9254902, 1, 0, 1,
-0.9700516, 0.09816075, -0.110942, 0.9215686, 1, 0, 1,
-0.969844, -1.319469, -4.862054, 0.9137255, 1, 0, 1,
-0.9647564, -0.9140893, -3.476249, 0.9098039, 1, 0, 1,
-0.9629946, -0.5360818, -1.121336, 0.9019608, 1, 0, 1,
-0.9621781, 0.5044193, 0.3278531, 0.8941177, 1, 0, 1,
-0.96167, -2.074337, -1.962104, 0.8901961, 1, 0, 1,
-0.9582381, 0.1431661, -2.693025, 0.8823529, 1, 0, 1,
-0.9573213, 1.306468, -1.390919, 0.8784314, 1, 0, 1,
-0.9563513, -0.1821888, -1.910929, 0.8705882, 1, 0, 1,
-0.9524834, -1.503149, -1.370557, 0.8666667, 1, 0, 1,
-0.9481781, -0.7149299, -1.76917, 0.8588235, 1, 0, 1,
-0.94363, -0.9311549, -2.504297, 0.854902, 1, 0, 1,
-0.9406238, -0.4718858, 0.6435357, 0.8470588, 1, 0, 1,
-0.9397626, 0.7932516, -0.2187218, 0.8431373, 1, 0, 1,
-0.9390631, -1.986005, -0.9629487, 0.8352941, 1, 0, 1,
-0.9377069, -1.47884, -3.993258, 0.8313726, 1, 0, 1,
-0.9354723, 0.05287174, 0.2676558, 0.8235294, 1, 0, 1,
-0.9272425, -0.2822677, -2.246974, 0.8196079, 1, 0, 1,
-0.9075736, 0.2845011, -1.21739, 0.8117647, 1, 0, 1,
-0.8976614, 0.009933365, -1.685828, 0.8078431, 1, 0, 1,
-0.8896404, 1.046471, -1.010061, 0.8, 1, 0, 1,
-0.8789734, 0.4008448, -2.602747, 0.7921569, 1, 0, 1,
-0.8673054, 0.4623563, -1.058849, 0.7882353, 1, 0, 1,
-0.8645964, 0.001320834, -0.5998871, 0.7803922, 1, 0, 1,
-0.8630266, 0.8568618, -1.347216, 0.7764706, 1, 0, 1,
-0.8594787, 1.697811, -1.169029, 0.7686275, 1, 0, 1,
-0.8579437, 0.8972225, 1.152917, 0.7647059, 1, 0, 1,
-0.8542611, -0.6848678, -2.597626, 0.7568628, 1, 0, 1,
-0.8464502, -1.461528, -2.210208, 0.7529412, 1, 0, 1,
-0.8457868, 0.1267116, -0.5131558, 0.7450981, 1, 0, 1,
-0.8426688, -1.326837, -2.684609, 0.7411765, 1, 0, 1,
-0.8415716, -1.466168, -2.664688, 0.7333333, 1, 0, 1,
-0.8406486, 0.4999849, -0.03182726, 0.7294118, 1, 0, 1,
-0.8402882, -1.66792, -2.361462, 0.7215686, 1, 0, 1,
-0.8401366, 0.7975303, -1.455281, 0.7176471, 1, 0, 1,
-0.8367107, 0.776184, -1.335008, 0.7098039, 1, 0, 1,
-0.8331187, -0.4183719, -3.269585, 0.7058824, 1, 0, 1,
-0.8238053, 1.456128, 0.106857, 0.6980392, 1, 0, 1,
-0.8233948, -0.2951176, -2.724063, 0.6901961, 1, 0, 1,
-0.8218725, -0.3288065, -2.330818, 0.6862745, 1, 0, 1,
-0.8184955, 2.376653, -2.057783, 0.6784314, 1, 0, 1,
-0.814262, -2.192364, -3.472989, 0.6745098, 1, 0, 1,
-0.813629, -1.35829, 0.132942, 0.6666667, 1, 0, 1,
-0.811614, 0.7159347, -0.9854459, 0.6627451, 1, 0, 1,
-0.8106424, -2.173282, -1.257728, 0.654902, 1, 0, 1,
-0.8098664, 0.336484, -0.4842671, 0.6509804, 1, 0, 1,
-0.8035927, 0.4453218, -0.09030014, 0.6431373, 1, 0, 1,
-0.7960762, 0.6761852, -0.01967658, 0.6392157, 1, 0, 1,
-0.7959083, -1.910477, -0.9937216, 0.6313726, 1, 0, 1,
-0.7956061, 0.5365968, -0.7520566, 0.627451, 1, 0, 1,
-0.7842834, 1.005376, -1.798153, 0.6196079, 1, 0, 1,
-0.7837102, 1.088726, 0.03812684, 0.6156863, 1, 0, 1,
-0.7777839, -1.414354, -2.032681, 0.6078432, 1, 0, 1,
-0.7757294, -0.9619099, -2.4858, 0.6039216, 1, 0, 1,
-0.7693411, 1.319355, -1.393688, 0.5960785, 1, 0, 1,
-0.7631018, -0.6779459, -0.1771915, 0.5882353, 1, 0, 1,
-0.7575209, -1.882594, -3.204234, 0.5843138, 1, 0, 1,
-0.7460403, -0.7621115, -1.027761, 0.5764706, 1, 0, 1,
-0.745275, 0.21552, -1.385271, 0.572549, 1, 0, 1,
-0.7420861, 1.626195, -0.1944639, 0.5647059, 1, 0, 1,
-0.7407579, -0.01237706, -1.106069, 0.5607843, 1, 0, 1,
-0.7380836, -1.089212, -2.189629, 0.5529412, 1, 0, 1,
-0.7291338, 0.6145953, -1.416855, 0.5490196, 1, 0, 1,
-0.7252032, 1.132919, -1.588723, 0.5411765, 1, 0, 1,
-0.7209045, -1.079756, -3.205535, 0.5372549, 1, 0, 1,
-0.7191509, -2.426144, -3.620218, 0.5294118, 1, 0, 1,
-0.712329, 0.6367323, -1.165509, 0.5254902, 1, 0, 1,
-0.7100847, 0.9577751, -2.47359, 0.5176471, 1, 0, 1,
-0.7095951, 0.2318923, 0.2900088, 0.5137255, 1, 0, 1,
-0.7073129, -0.1671983, -2.222718, 0.5058824, 1, 0, 1,
-0.7072302, -0.1163843, -1.50377, 0.5019608, 1, 0, 1,
-0.7060002, -1.465854, -3.832701, 0.4941176, 1, 0, 1,
-0.7031679, -0.4927073, -1.404286, 0.4862745, 1, 0, 1,
-0.7021474, 1.710604, 0.5426032, 0.4823529, 1, 0, 1,
-0.701846, -0.6582282, -1.537079, 0.4745098, 1, 0, 1,
-0.6963412, 2.502277, -0.1666932, 0.4705882, 1, 0, 1,
-0.6937481, -0.8242126, -1.714051, 0.4627451, 1, 0, 1,
-0.681571, 0.383748, -1.629689, 0.4588235, 1, 0, 1,
-0.6791967, -1.010272, -2.032202, 0.4509804, 1, 0, 1,
-0.6757996, -1.232152, -2.623463, 0.4470588, 1, 0, 1,
-0.6743186, -0.581986, -0.8622594, 0.4392157, 1, 0, 1,
-0.6734431, 0.818494, 0.0471591, 0.4352941, 1, 0, 1,
-0.6730604, 2.566875, -0.983986, 0.427451, 1, 0, 1,
-0.6725119, -0.7532749, -2.334874, 0.4235294, 1, 0, 1,
-0.666935, 0.4973016, -1.436904, 0.4156863, 1, 0, 1,
-0.6600825, 0.116822, 0.1711749, 0.4117647, 1, 0, 1,
-0.6568798, 1.134795, -0.1210452, 0.4039216, 1, 0, 1,
-0.6546046, -0.2674864, -2.612789, 0.3960784, 1, 0, 1,
-0.6541604, -1.303833, -1.630394, 0.3921569, 1, 0, 1,
-0.6492906, 1.799471, -1.930488, 0.3843137, 1, 0, 1,
-0.6440238, 1.498, -2.237914, 0.3803922, 1, 0, 1,
-0.6431907, 0.4454996, -1.651947, 0.372549, 1, 0, 1,
-0.6370569, -0.2763523, -1.137896, 0.3686275, 1, 0, 1,
-0.6328306, 0.6508973, 0.3745062, 0.3607843, 1, 0, 1,
-0.6296331, 1.459417, -2.930505, 0.3568628, 1, 0, 1,
-0.6272023, -0.6153761, -2.533594, 0.3490196, 1, 0, 1,
-0.6249689, 0.08573692, -1.599247, 0.345098, 1, 0, 1,
-0.6227114, 1.038805, -0.7876882, 0.3372549, 1, 0, 1,
-0.6226045, 1.020975, -0.8603252, 0.3333333, 1, 0, 1,
-0.6181301, -0.9484175, -3.850826, 0.3254902, 1, 0, 1,
-0.6164045, 0.7123196, -2.026078, 0.3215686, 1, 0, 1,
-0.6140824, -1.783626, -2.740341, 0.3137255, 1, 0, 1,
-0.6048774, 0.2528741, -2.646647, 0.3098039, 1, 0, 1,
-0.6039988, 0.7747151, -0.5585262, 0.3019608, 1, 0, 1,
-0.6000966, -1.100506, -3.027267, 0.2941177, 1, 0, 1,
-0.5994607, -0.4401693, -2.482901, 0.2901961, 1, 0, 1,
-0.5981422, -0.1207056, -2.531229, 0.282353, 1, 0, 1,
-0.5974489, 0.3979555, -1.973969, 0.2784314, 1, 0, 1,
-0.5948, 0.3722982, -2.289105, 0.2705882, 1, 0, 1,
-0.5917311, -0.4673654, -2.050985, 0.2666667, 1, 0, 1,
-0.5913317, 0.1113959, -1.979506, 0.2588235, 1, 0, 1,
-0.5894666, 0.4839053, -1.763852, 0.254902, 1, 0, 1,
-0.5850902, 0.1573843, -1.57415, 0.2470588, 1, 0, 1,
-0.5789217, -0.1214276, -4.894319, 0.2431373, 1, 0, 1,
-0.575478, 1.932528, -0.5424875, 0.2352941, 1, 0, 1,
-0.5705182, -0.6614352, -0.1411377, 0.2313726, 1, 0, 1,
-0.5609342, 0.7598358, -0.9735833, 0.2235294, 1, 0, 1,
-0.5600974, 1.111427, -0.564674, 0.2196078, 1, 0, 1,
-0.5597705, -0.08302236, -2.035551, 0.2117647, 1, 0, 1,
-0.555805, 2.16747, -0.1033097, 0.2078431, 1, 0, 1,
-0.5512935, 0.6447595, -1.772509, 0.2, 1, 0, 1,
-0.5509641, 0.055538, -1.523345, 0.1921569, 1, 0, 1,
-0.5483795, 1.879119, 0.2054966, 0.1882353, 1, 0, 1,
-0.5481932, 1.880801, 1.025183, 0.1803922, 1, 0, 1,
-0.5476251, 1.242676, -0.7664059, 0.1764706, 1, 0, 1,
-0.5469384, 0.03488863, -0.278032, 0.1686275, 1, 0, 1,
-0.5455028, 0.3047517, -2.40553, 0.1647059, 1, 0, 1,
-0.5450691, -0.3474778, -1.844155, 0.1568628, 1, 0, 1,
-0.5444434, 0.01042017, -0.9748322, 0.1529412, 1, 0, 1,
-0.5434018, 1.841113, 0.1745542, 0.145098, 1, 0, 1,
-0.5388288, -0.2292369, -0.5028217, 0.1411765, 1, 0, 1,
-0.5385312, -0.3900034, -3.77693, 0.1333333, 1, 0, 1,
-0.5379807, 0.6048851, -1.182425, 0.1294118, 1, 0, 1,
-0.5360225, -0.1310779, -0.4330594, 0.1215686, 1, 0, 1,
-0.5327355, 0.3271592, -1.250318, 0.1176471, 1, 0, 1,
-0.525963, 2.082069, 0.03432054, 0.1098039, 1, 0, 1,
-0.5256248, -1.154362, -3.542438, 0.1058824, 1, 0, 1,
-0.5165672, -0.9643664, -3.617826, 0.09803922, 1, 0, 1,
-0.5164835, 0.4422883, -0.6863299, 0.09019608, 1, 0, 1,
-0.5121956, -1.049859, -4.972071, 0.08627451, 1, 0, 1,
-0.5099653, 1.433762, 0.2942755, 0.07843138, 1, 0, 1,
-0.5075862, 0.2132979, -1.225123, 0.07450981, 1, 0, 1,
-0.5073085, -0.700056, -3.113461, 0.06666667, 1, 0, 1,
-0.5014465, -0.9569471, -1.658685, 0.0627451, 1, 0, 1,
-0.4921425, -1.187552, -2.764186, 0.05490196, 1, 0, 1,
-0.4911081, 1.56247, -0.8079134, 0.05098039, 1, 0, 1,
-0.4833897, 1.04304, -1.221901, 0.04313726, 1, 0, 1,
-0.4806706, -0.9406786, -1.1516, 0.03921569, 1, 0, 1,
-0.4772651, -1.386723, -3.945213, 0.03137255, 1, 0, 1,
-0.4721314, 0.950452, 0.4484663, 0.02745098, 1, 0, 1,
-0.4698525, 1.130642, -0.5024996, 0.01960784, 1, 0, 1,
-0.4695867, 1.007667, 1.979969, 0.01568628, 1, 0, 1,
-0.4648169, 0.1900432, 0.214792, 0.007843138, 1, 0, 1,
-0.4612783, -1.126047, -2.284204, 0.003921569, 1, 0, 1,
-0.4582823, -0.5554345, -2.435506, 0, 1, 0.003921569, 1,
-0.4543146, 1.604599, -0.6928241, 0, 1, 0.01176471, 1,
-0.4463867, 1.256135, 0.1353303, 0, 1, 0.01568628, 1,
-0.441861, -0.2225766, -1.073431, 0, 1, 0.02352941, 1,
-0.4414278, 0.6978216, 1.645726, 0, 1, 0.02745098, 1,
-0.4401291, -1.207387, -5.024583, 0, 1, 0.03529412, 1,
-0.4392963, 2.537902, 0.2666892, 0, 1, 0.03921569, 1,
-0.4391998, -2.468824, -2.189794, 0, 1, 0.04705882, 1,
-0.4338487, 0.2990051, 0.491917, 0, 1, 0.05098039, 1,
-0.4315102, 0.4248488, -1.153438, 0, 1, 0.05882353, 1,
-0.4295258, 0.1267796, -1.46903, 0, 1, 0.0627451, 1,
-0.4251992, 0.1039657, -1.783257, 0, 1, 0.07058824, 1,
-0.4241207, 0.04301174, -2.099976, 0, 1, 0.07450981, 1,
-0.4157445, -0.4602482, -1.403246, 0, 1, 0.08235294, 1,
-0.4109496, 0.1048561, -2.251894, 0, 1, 0.08627451, 1,
-0.4108669, -0.7612206, -5.010688, 0, 1, 0.09411765, 1,
-0.4022688, 0.7990876, -0.07053875, 0, 1, 0.1019608, 1,
-0.4022262, -0.2547955, -3.708964, 0, 1, 0.1058824, 1,
-0.4007779, 0.589221, -0.3873926, 0, 1, 0.1137255, 1,
-0.4004881, 1.355885, -0.9482715, 0, 1, 0.1176471, 1,
-0.3908765, 0.6566913, -2.068867, 0, 1, 0.1254902, 1,
-0.3745138, 1.252942, 0.2441637, 0, 1, 0.1294118, 1,
-0.3713507, -0.5395783, -2.633691, 0, 1, 0.1372549, 1,
-0.3676171, -1.412056, -2.029852, 0, 1, 0.1411765, 1,
-0.3629934, 0.7276745, -0.5309818, 0, 1, 0.1490196, 1,
-0.3571668, -0.8179359, -2.875261, 0, 1, 0.1529412, 1,
-0.3568043, -0.6072119, -2.167036, 0, 1, 0.1607843, 1,
-0.3545496, 1.468089, 2.211464, 0, 1, 0.1647059, 1,
-0.3530149, -0.1118128, -2.053032, 0, 1, 0.172549, 1,
-0.3505926, 0.5820466, -0.06427847, 0, 1, 0.1764706, 1,
-0.349771, -0.8269227, -3.790328, 0, 1, 0.1843137, 1,
-0.3469366, 1.873935, -1.594532, 0, 1, 0.1882353, 1,
-0.3465388, -2.198685, -3.148397, 0, 1, 0.1960784, 1,
-0.3463704, 0.06948589, -1.414718, 0, 1, 0.2039216, 1,
-0.3461278, -0.815743, -2.570855, 0, 1, 0.2078431, 1,
-0.3379431, -0.9161604, -2.300883, 0, 1, 0.2156863, 1,
-0.3378322, 1.257435, -0.947635, 0, 1, 0.2196078, 1,
-0.3358266, 1.093096, -1.62048, 0, 1, 0.227451, 1,
-0.3337192, -1.437115, -2.692973, 0, 1, 0.2313726, 1,
-0.3273061, 0.01897002, -1.330147, 0, 1, 0.2392157, 1,
-0.3270952, 0.01913247, -1.750612, 0, 1, 0.2431373, 1,
-0.3257162, 0.1396383, -1.479919, 0, 1, 0.2509804, 1,
-0.324532, 0.02756953, -2.743729, 0, 1, 0.254902, 1,
-0.3231717, -0.7352406, -1.535786, 0, 1, 0.2627451, 1,
-0.3205622, 0.1817961, 0.5167754, 0, 1, 0.2666667, 1,
-0.3201447, -0.3364078, -3.36085, 0, 1, 0.2745098, 1,
-0.3183815, 1.803401, 1.006749, 0, 1, 0.2784314, 1,
-0.3146732, 0.3028563, -0.06961711, 0, 1, 0.2862745, 1,
-0.3065962, -0.8763575, -3.366344, 0, 1, 0.2901961, 1,
-0.3061536, -0.7319099, -3.241203, 0, 1, 0.2980392, 1,
-0.3036061, -1.176874, -3.931235, 0, 1, 0.3058824, 1,
-0.3007432, -0.3325681, -2.660442, 0, 1, 0.3098039, 1,
-0.2986852, -1.285433, -3.115737, 0, 1, 0.3176471, 1,
-0.2979593, 0.4146528, -1.415706, 0, 1, 0.3215686, 1,
-0.2976164, -1.485591, -2.305618, 0, 1, 0.3294118, 1,
-0.2923429, 0.5809477, -2.069531, 0, 1, 0.3333333, 1,
-0.2845613, 0.2088874, 0.182402, 0, 1, 0.3411765, 1,
-0.2826077, -2.224753, -4.425292, 0, 1, 0.345098, 1,
-0.2813953, 0.3120951, -0.3613455, 0, 1, 0.3529412, 1,
-0.2785967, -1.738139, -2.953086, 0, 1, 0.3568628, 1,
-0.2765167, -0.7101771, -3.815444, 0, 1, 0.3647059, 1,
-0.2763717, -0.02284393, -2.446146, 0, 1, 0.3686275, 1,
-0.2724215, -0.6511387, -1.904783, 0, 1, 0.3764706, 1,
-0.2704966, 1.403067, 0.1019639, 0, 1, 0.3803922, 1,
-0.2699073, 0.8487393, -1.355853, 0, 1, 0.3882353, 1,
-0.2694579, -2.894253, -1.681639, 0, 1, 0.3921569, 1,
-0.267386, 0.1974113, -2.960163, 0, 1, 0.4, 1,
-0.2672407, -0.7896078, -3.979806, 0, 1, 0.4078431, 1,
-0.2603949, -0.4085486, -2.383089, 0, 1, 0.4117647, 1,
-0.2488612, 0.4092422, 0.1475073, 0, 1, 0.4196078, 1,
-0.2486002, 1.935648, 0.05538854, 0, 1, 0.4235294, 1,
-0.248456, -1.335701, -2.299673, 0, 1, 0.4313726, 1,
-0.2472152, 0.8092539, 0.2820289, 0, 1, 0.4352941, 1,
-0.2445354, -1.473368, -2.434342, 0, 1, 0.4431373, 1,
-0.2433786, -0.1077776, -0.908078, 0, 1, 0.4470588, 1,
-0.2415092, 0.6836994, -0.4968702, 0, 1, 0.454902, 1,
-0.2346315, 1.533242, 0.2628662, 0, 1, 0.4588235, 1,
-0.2342542, -1.812755, -3.597047, 0, 1, 0.4666667, 1,
-0.2204204, 0.9458505, 0.50594, 0, 1, 0.4705882, 1,
-0.2149125, 0.7765675, -0.8537259, 0, 1, 0.4784314, 1,
-0.2139705, -0.1700232, -3.792799, 0, 1, 0.4823529, 1,
-0.2105375, -1.620472, -2.057275, 0, 1, 0.4901961, 1,
-0.2084026, -0.9189534, -2.818635, 0, 1, 0.4941176, 1,
-0.2055887, -0.05902797, -0.9877094, 0, 1, 0.5019608, 1,
-0.2021677, 0.1794298, 0.8353533, 0, 1, 0.509804, 1,
-0.1989244, 1.274579, 0.3617149, 0, 1, 0.5137255, 1,
-0.196844, 0.7326877, -1.059886, 0, 1, 0.5215687, 1,
-0.1901124, 0.5514204, -0.4337218, 0, 1, 0.5254902, 1,
-0.1896132, -0.1353336, -1.385947, 0, 1, 0.5333334, 1,
-0.1889909, -1.092025, -3.624012, 0, 1, 0.5372549, 1,
-0.1884951, -1.2325, -3.407583, 0, 1, 0.5450981, 1,
-0.1863218, 1.379146, -0.5481787, 0, 1, 0.5490196, 1,
-0.1855984, 1.018214, -0.0219104, 0, 1, 0.5568628, 1,
-0.1852748, 0.7746388, 0.0965319, 0, 1, 0.5607843, 1,
-0.1839572, 1.538231, -0.3629923, 0, 1, 0.5686275, 1,
-0.1828667, -0.9178351, -1.835343, 0, 1, 0.572549, 1,
-0.1816281, 2.028515, -0.1031502, 0, 1, 0.5803922, 1,
-0.1785949, 0.613294, 0.9830011, 0, 1, 0.5843138, 1,
-0.1757653, -1.024286, -3.837177, 0, 1, 0.5921569, 1,
-0.1755152, 0.7446593, 0.05663744, 0, 1, 0.5960785, 1,
-0.1747909, 0.3658045, -1.04706, 0, 1, 0.6039216, 1,
-0.1731942, -1.123793, -2.547139, 0, 1, 0.6117647, 1,
-0.1698718, -0.8437058, -3.113457, 0, 1, 0.6156863, 1,
-0.1694569, -0.1288674, -2.599587, 0, 1, 0.6235294, 1,
-0.1654062, -1.032399, -2.11034, 0, 1, 0.627451, 1,
-0.1638495, 0.05247348, -0.4677359, 0, 1, 0.6352941, 1,
-0.1637941, 0.2661207, 0.3327968, 0, 1, 0.6392157, 1,
-0.1632954, -0.7121431, -2.548826, 0, 1, 0.6470588, 1,
-0.162203, -0.3657256, -1.97406, 0, 1, 0.6509804, 1,
-0.1618878, -0.9172474, -3.18184, 0, 1, 0.6588235, 1,
-0.1580781, -1.559176, -3.398394, 0, 1, 0.6627451, 1,
-0.1577983, -1.045273, -4.507112, 0, 1, 0.6705883, 1,
-0.1550243, 1.112071, 0.856014, 0, 1, 0.6745098, 1,
-0.1526108, 0.401264, 0.5950347, 0, 1, 0.682353, 1,
-0.1496798, 0.7565799, 0.5518976, 0, 1, 0.6862745, 1,
-0.1492513, -0.4156151, -2.883588, 0, 1, 0.6941177, 1,
-0.1446324, -1.648858, -4.130725, 0, 1, 0.7019608, 1,
-0.1425639, 0.2517234, 0.2420618, 0, 1, 0.7058824, 1,
-0.1414758, 0.08672893, 0.7907096, 0, 1, 0.7137255, 1,
-0.1392555, -1.303004, -1.574551, 0, 1, 0.7176471, 1,
-0.1390987, 1.097403, 0.6708729, 0, 1, 0.7254902, 1,
-0.1384897, -0.3698207, -2.914524, 0, 1, 0.7294118, 1,
-0.1369068, 0.8349056, -0.8731682, 0, 1, 0.7372549, 1,
-0.1343529, -0.7525923, -1.762358, 0, 1, 0.7411765, 1,
-0.1326446, -0.86392, -3.537139, 0, 1, 0.7490196, 1,
-0.1286019, -2.25313, -2.129898, 0, 1, 0.7529412, 1,
-0.1273358, 1.018508, -0.05958674, 0, 1, 0.7607843, 1,
-0.1240201, -1.350258, -3.315561, 0, 1, 0.7647059, 1,
-0.1235081, 0.1742935, -0.2800154, 0, 1, 0.772549, 1,
-0.1182192, 0.3212492, 0.9186435, 0, 1, 0.7764706, 1,
-0.1145385, -0.9927707, -3.976925, 0, 1, 0.7843137, 1,
-0.1093843, 0.7311825, -0.6732551, 0, 1, 0.7882353, 1,
-0.1015068, 1.748415, -1.592614, 0, 1, 0.7960784, 1,
-0.1009497, -0.9648988, -5.153968, 0, 1, 0.8039216, 1,
-0.09979697, -1.001541, -3.74052, 0, 1, 0.8078431, 1,
-0.09638498, 0.9461294, 0.3861859, 0, 1, 0.8156863, 1,
-0.09559018, 1.88207, -1.309233, 0, 1, 0.8196079, 1,
-0.09540845, -2.672185, -2.785016, 0, 1, 0.827451, 1,
-0.09372835, -0.8180492, -4.644141, 0, 1, 0.8313726, 1,
-0.09073329, -0.206178, -3.569468, 0, 1, 0.8392157, 1,
-0.08961254, -0.5539504, -2.652224, 0, 1, 0.8431373, 1,
-0.08886001, 0.3456325, -0.9208586, 0, 1, 0.8509804, 1,
-0.08853008, -0.3430996, -2.366484, 0, 1, 0.854902, 1,
-0.08771202, -0.4572104, -4.45733, 0, 1, 0.8627451, 1,
-0.0816576, -0.5207127, -3.547679, 0, 1, 0.8666667, 1,
-0.08093506, -0.8586792, -3.671096, 0, 1, 0.8745098, 1,
-0.08079963, 1.402646, 0.7579929, 0, 1, 0.8784314, 1,
-0.07707106, 0.5350735, 1.218401, 0, 1, 0.8862745, 1,
-0.07654056, 0.9292651, 0.5246969, 0, 1, 0.8901961, 1,
-0.0693979, 0.5766343, -1.156121, 0, 1, 0.8980392, 1,
-0.06441385, -0.01879136, -1.398627, 0, 1, 0.9058824, 1,
-0.05547016, -0.3185716, -3.18483, 0, 1, 0.9098039, 1,
-0.05289811, -0.5661814, -2.062534, 0, 1, 0.9176471, 1,
-0.05220293, 0.4205629, -0.5997077, 0, 1, 0.9215686, 1,
-0.05184521, 0.9822745, 0.7374611, 0, 1, 0.9294118, 1,
-0.047937, 1.806466, -0.08380169, 0, 1, 0.9333333, 1,
-0.03990785, 1.281887, -1.259441, 0, 1, 0.9411765, 1,
-0.03670381, -0.961607, -3.066012, 0, 1, 0.945098, 1,
-0.02954171, -0.7331336, -3.509038, 0, 1, 0.9529412, 1,
-0.02813015, 0.2070241, -0.3213237, 0, 1, 0.9568627, 1,
-0.02524186, 0.5148127, 0.04218898, 0, 1, 0.9647059, 1,
-0.0250258, -0.5145267, -1.492373, 0, 1, 0.9686275, 1,
-0.02426909, -0.1440643, -3.751967, 0, 1, 0.9764706, 1,
-0.02132704, -0.2034845, -2.624371, 0, 1, 0.9803922, 1,
-0.01955978, 0.5903878, 0.3774883, 0, 1, 0.9882353, 1,
-0.01759719, -0.5399638, -2.765563, 0, 1, 0.9921569, 1,
-0.0170833, -0.6644775, -2.892874, 0, 1, 1, 1,
-0.01584524, -0.7199399, -4.304767, 0, 0.9921569, 1, 1,
-0.005894639, -0.2065467, -2.586641, 0, 0.9882353, 1, 1,
-0.004120854, -1.885644, -2.102134, 0, 0.9803922, 1, 1,
-0.001399934, 0.6067843, -0.2100348, 0, 0.9764706, 1, 1,
0.006037803, 1.156522, 1.232094, 0, 0.9686275, 1, 1,
0.01073451, 0.2554111, 1.417067, 0, 0.9647059, 1, 1,
0.01680871, -2.288021, 1.979125, 0, 0.9568627, 1, 1,
0.01823504, -0.9362612, 2.344458, 0, 0.9529412, 1, 1,
0.0216683, -0.6441724, 3.733111, 0, 0.945098, 1, 1,
0.0232038, -1.159859, 2.882739, 0, 0.9411765, 1, 1,
0.02671149, 0.7954582, -0.5241627, 0, 0.9333333, 1, 1,
0.02721572, -0.7305481, 3.001869, 0, 0.9294118, 1, 1,
0.02751198, 0.2019515, 0.05226468, 0, 0.9215686, 1, 1,
0.03002153, -0.4422434, 3.104453, 0, 0.9176471, 1, 1,
0.03378019, 1.477446, 0.1763631, 0, 0.9098039, 1, 1,
0.03513451, -0.7358294, 3.248637, 0, 0.9058824, 1, 1,
0.03809146, -0.1850316, 3.32508, 0, 0.8980392, 1, 1,
0.0428682, 0.2835308, -1.791622, 0, 0.8901961, 1, 1,
0.04361427, 0.566402, -0.1046991, 0, 0.8862745, 1, 1,
0.04539226, -0.5043685, 3.367984, 0, 0.8784314, 1, 1,
0.04550719, -0.5086784, 2.953007, 0, 0.8745098, 1, 1,
0.04720227, 0.9176295, -0.3138289, 0, 0.8666667, 1, 1,
0.04762351, -0.1056018, 2.179355, 0, 0.8627451, 1, 1,
0.04843624, -2.124076, 3.319849, 0, 0.854902, 1, 1,
0.05086114, 0.7746304, -0.6865846, 0, 0.8509804, 1, 1,
0.05131477, -0.5827054, 2.559317, 0, 0.8431373, 1, 1,
0.05573435, -1.586904, 4.335535, 0, 0.8392157, 1, 1,
0.06281073, 0.9041696, -0.2043383, 0, 0.8313726, 1, 1,
0.06378156, 0.4633539, 0.3003792, 0, 0.827451, 1, 1,
0.07044301, 0.4163059, -0.02134223, 0, 0.8196079, 1, 1,
0.07343257, 0.1992535, 1.62846, 0, 0.8156863, 1, 1,
0.07548073, -0.06493478, 2.313729, 0, 0.8078431, 1, 1,
0.07642174, -0.8050024, 4.48372, 0, 0.8039216, 1, 1,
0.07646731, -0.3207488, 2.644077, 0, 0.7960784, 1, 1,
0.07659879, -0.6815298, 3.828056, 0, 0.7882353, 1, 1,
0.07687152, 1.146242, 2.140469, 0, 0.7843137, 1, 1,
0.07734121, -0.988843, 3.35481, 0, 0.7764706, 1, 1,
0.07934421, -2.610497, 1.508533, 0, 0.772549, 1, 1,
0.08548001, 0.3833392, -0.2383885, 0, 0.7647059, 1, 1,
0.09365691, 0.722253, 0.6514644, 0, 0.7607843, 1, 1,
0.09423622, 0.5287549, 0.8085245, 0, 0.7529412, 1, 1,
0.09689306, 0.4683738, 1.07688, 0, 0.7490196, 1, 1,
0.09782033, -1.114028, 2.601415, 0, 0.7411765, 1, 1,
0.1000311, -0.1509782, 3.308633, 0, 0.7372549, 1, 1,
0.1030201, -1.467976, 2.914668, 0, 0.7294118, 1, 1,
0.1050637, -0.6915292, 2.085679, 0, 0.7254902, 1, 1,
0.1057385, 0.2120562, 0.321212, 0, 0.7176471, 1, 1,
0.1064417, -0.1952794, 2.927137, 0, 0.7137255, 1, 1,
0.109594, -1.245117, 1.713595, 0, 0.7058824, 1, 1,
0.1102538, 0.05360413, 1.442339, 0, 0.6980392, 1, 1,
0.1147754, 0.8497069, 1.055856, 0, 0.6941177, 1, 1,
0.1147786, -0.9252925, 3.474308, 0, 0.6862745, 1, 1,
0.1200439, -0.62445, 2.909755, 0, 0.682353, 1, 1,
0.1216923, -0.945952, 3.341656, 0, 0.6745098, 1, 1,
0.1256723, -0.3127409, 3.187066, 0, 0.6705883, 1, 1,
0.12629, 0.1107026, -0.04615924, 0, 0.6627451, 1, 1,
0.1272145, 1.132134, -1.003893, 0, 0.6588235, 1, 1,
0.1305555, 1.298695, 1.58535, 0, 0.6509804, 1, 1,
0.131415, -0.04875483, 1.656905, 0, 0.6470588, 1, 1,
0.1332556, -0.8017005, 2.738765, 0, 0.6392157, 1, 1,
0.1336002, -0.04159125, 2.53487, 0, 0.6352941, 1, 1,
0.1343001, -0.9805162, 4.355754, 0, 0.627451, 1, 1,
0.1347, -1.186464, 3.318567, 0, 0.6235294, 1, 1,
0.1350242, -0.3143671, 2.852871, 0, 0.6156863, 1, 1,
0.1364634, 0.4372614, 0.3478132, 0, 0.6117647, 1, 1,
0.1367586, 1.391072, -1.205025, 0, 0.6039216, 1, 1,
0.1428351, -0.1975825, 2.914821, 0, 0.5960785, 1, 1,
0.1433002, 1.351023, 0.4157626, 0, 0.5921569, 1, 1,
0.1484113, 0.7647119, 2.373832, 0, 0.5843138, 1, 1,
0.1490653, 1.802986, 0.9390539, 0, 0.5803922, 1, 1,
0.1516268, 0.9398269, 0.1905385, 0, 0.572549, 1, 1,
0.1539411, -0.3961878, 3.973006, 0, 0.5686275, 1, 1,
0.1623074, 1.200582, 0.2754958, 0, 0.5607843, 1, 1,
0.1645266, -1.727758, 2.244791, 0, 0.5568628, 1, 1,
0.1650458, 1.111042, -0.823501, 0, 0.5490196, 1, 1,
0.1699171, -0.2360152, 2.000853, 0, 0.5450981, 1, 1,
0.1701012, -0.9512185, 2.737757, 0, 0.5372549, 1, 1,
0.1707976, -0.8575345, 1.390178, 0, 0.5333334, 1, 1,
0.1712802, 0.3152632, 1.102097, 0, 0.5254902, 1, 1,
0.1731396, 0.4686481, 1.565539, 0, 0.5215687, 1, 1,
0.1763676, -0.008142914, 4.140248, 0, 0.5137255, 1, 1,
0.1785643, -0.8196784, 2.179653, 0, 0.509804, 1, 1,
0.1855405, 0.1173779, 1.36523, 0, 0.5019608, 1, 1,
0.1882199, 0.1684762, -0.9623487, 0, 0.4941176, 1, 1,
0.1883126, -0.1772763, 1.292043, 0, 0.4901961, 1, 1,
0.1884016, -0.1638671, 2.158157, 0, 0.4823529, 1, 1,
0.1897103, 0.2681428, 1.19861, 0, 0.4784314, 1, 1,
0.1906218, 1.200374, 0.8875156, 0, 0.4705882, 1, 1,
0.1935546, 0.4538212, -2.175818, 0, 0.4666667, 1, 1,
0.1956414, -0.01749897, 1.500713, 0, 0.4588235, 1, 1,
0.1962707, 1.79185, 1.301137, 0, 0.454902, 1, 1,
0.1995804, -0.2111721, 1.074896, 0, 0.4470588, 1, 1,
0.2027321, -0.1036664, 1.619089, 0, 0.4431373, 1, 1,
0.2032572, 1.139762, -0.5665677, 0, 0.4352941, 1, 1,
0.2068328, 1.546569, -0.7375342, 0, 0.4313726, 1, 1,
0.2214389, -2.013636, 5.003679, 0, 0.4235294, 1, 1,
0.2239977, -0.8655486, 2.17727, 0, 0.4196078, 1, 1,
0.2300805, -0.6718058, 2.358106, 0, 0.4117647, 1, 1,
0.2309117, -0.09313857, 2.464828, 0, 0.4078431, 1, 1,
0.2392769, 0.7512664, 1.653807, 0, 0.4, 1, 1,
0.2395043, -1.271626, 0.6706876, 0, 0.3921569, 1, 1,
0.2403552, -0.4104636, 3.862566, 0, 0.3882353, 1, 1,
0.2415757, -0.8991736, 2.884994, 0, 0.3803922, 1, 1,
0.2430595, -0.6649869, 2.754099, 0, 0.3764706, 1, 1,
0.2471317, -1.172493, 1.265347, 0, 0.3686275, 1, 1,
0.2510091, -0.3925596, 0.8975434, 0, 0.3647059, 1, 1,
0.2529666, 2.036988, -2.299647, 0, 0.3568628, 1, 1,
0.2537053, 1.545212, 0.07405456, 0, 0.3529412, 1, 1,
0.2594523, 1.008108, -0.9378296, 0, 0.345098, 1, 1,
0.2604888, 0.7008054, -0.5078691, 0, 0.3411765, 1, 1,
0.2612652, -1.447088, 3.038077, 0, 0.3333333, 1, 1,
0.2633316, -2.004416, 3.528991, 0, 0.3294118, 1, 1,
0.263379, 2.346471, -1.387329, 0, 0.3215686, 1, 1,
0.2683461, -1.367417, 3.710522, 0, 0.3176471, 1, 1,
0.2689005, 0.6942817, 0.6725774, 0, 0.3098039, 1, 1,
0.2714388, -0.2385543, 3.613776, 0, 0.3058824, 1, 1,
0.2745529, -0.5552102, 2.00852, 0, 0.2980392, 1, 1,
0.2749588, -1.501372, 3.391237, 0, 0.2901961, 1, 1,
0.2796388, -0.5785618, 2.760705, 0, 0.2862745, 1, 1,
0.2846627, 0.8196359, 0.01696251, 0, 0.2784314, 1, 1,
0.285186, 1.188818, 2.309638, 0, 0.2745098, 1, 1,
0.286847, -1.13696, 3.812089, 0, 0.2666667, 1, 1,
0.2890473, -0.4147504, 1.90911, 0, 0.2627451, 1, 1,
0.289686, -0.3791558, 1.554073, 0, 0.254902, 1, 1,
0.290145, 0.4682076, 0.8192424, 0, 0.2509804, 1, 1,
0.2931037, -1.527727, 2.970778, 0, 0.2431373, 1, 1,
0.2946839, -0.6053386, 2.649606, 0, 0.2392157, 1, 1,
0.295332, -0.4525985, 2.6789, 0, 0.2313726, 1, 1,
0.2956537, -1.58574, 1.894503, 0, 0.227451, 1, 1,
0.2975012, 0.8708578, 1.084117, 0, 0.2196078, 1, 1,
0.2996899, 0.5423429, -0.002207485, 0, 0.2156863, 1, 1,
0.3012032, -0.7442486, 3.249788, 0, 0.2078431, 1, 1,
0.3083086, -0.8865175, 1.519104, 0, 0.2039216, 1, 1,
0.3106891, 0.4031523, 0.2368637, 0, 0.1960784, 1, 1,
0.3122113, 0.3064729, -0.6195641, 0, 0.1882353, 1, 1,
0.3133748, -1.279158, 1.868487, 0, 0.1843137, 1, 1,
0.320939, 0.8316565, -0.5293452, 0, 0.1764706, 1, 1,
0.3213341, 2.172663, 0.425512, 0, 0.172549, 1, 1,
0.3228378, -0.5000597, 3.838154, 0, 0.1647059, 1, 1,
0.3311764, 1.539233, -0.6282071, 0, 0.1607843, 1, 1,
0.3324747, -1.772038, 3.312592, 0, 0.1529412, 1, 1,
0.3365858, 0.5659583, -0.107016, 0, 0.1490196, 1, 1,
0.3370187, -1.284125, 4.876436, 0, 0.1411765, 1, 1,
0.3432651, -0.614747, 2.722288, 0, 0.1372549, 1, 1,
0.3474022, 0.3246197, 1.945154, 0, 0.1294118, 1, 1,
0.3477797, 0.3929869, -0.4234633, 0, 0.1254902, 1, 1,
0.3509754, -0.2671241, 1.296566, 0, 0.1176471, 1, 1,
0.3523726, 0.4500691, 0.07445943, 0, 0.1137255, 1, 1,
0.3530248, -0.2314389, 2.117698, 0, 0.1058824, 1, 1,
0.3558204, 0.01278961, 1.656773, 0, 0.09803922, 1, 1,
0.3572023, -0.5056142, 2.189658, 0, 0.09411765, 1, 1,
0.3584911, -0.4841065, 4.147687, 0, 0.08627451, 1, 1,
0.3592822, -0.453846, 2.405673, 0, 0.08235294, 1, 1,
0.3593947, -0.2044862, 2.841591, 0, 0.07450981, 1, 1,
0.3594953, 0.5839758, -0.5462461, 0, 0.07058824, 1, 1,
0.3605618, -0.9693776, 3.05178, 0, 0.0627451, 1, 1,
0.3610933, 1.384851, 0.6502724, 0, 0.05882353, 1, 1,
0.3680972, 0.3408561, 2.568032, 0, 0.05098039, 1, 1,
0.3693944, -0.9445969, 2.776495, 0, 0.04705882, 1, 1,
0.3706428, -0.1099362, 1.509512, 0, 0.03921569, 1, 1,
0.371397, 0.06995346, 2.708277, 0, 0.03529412, 1, 1,
0.3786823, -0.802501, 2.21434, 0, 0.02745098, 1, 1,
0.3831181, 0.9138229, -0.4136861, 0, 0.02352941, 1, 1,
0.3850829, -1.485239, 3.462157, 0, 0.01568628, 1, 1,
0.388815, -0.6893682, 2.605863, 0, 0.01176471, 1, 1,
0.3949685, 1.493157, -0.3022501, 0, 0.003921569, 1, 1,
0.3994348, -0.3777812, 2.070914, 0.003921569, 0, 1, 1,
0.3995657, 1.160232, 1.204499, 0.007843138, 0, 1, 1,
0.4006966, -1.726642, 2.93724, 0.01568628, 0, 1, 1,
0.4119393, -1.644274, 4.043169, 0.01960784, 0, 1, 1,
0.4120254, 1.491884, 1.754313, 0.02745098, 0, 1, 1,
0.4134744, -0.5498213, 1.438556, 0.03137255, 0, 1, 1,
0.4141666, -0.5024962, 1.715552, 0.03921569, 0, 1, 1,
0.4149595, 1.181923, 1.898095, 0.04313726, 0, 1, 1,
0.4163051, 2.753683, 0.6979471, 0.05098039, 0, 1, 1,
0.418211, -0.3027138, 1.954936, 0.05490196, 0, 1, 1,
0.4186227, 0.7860509, 0.9705449, 0.0627451, 0, 1, 1,
0.4190785, -0.3870544, 1.979649, 0.06666667, 0, 1, 1,
0.4238994, 0.740239, 0.2757148, 0.07450981, 0, 1, 1,
0.4287148, 1.245203, 0.6537764, 0.07843138, 0, 1, 1,
0.4304974, 0.5368865, -0.04796128, 0.08627451, 0, 1, 1,
0.435166, -2.145705, 2.475685, 0.09019608, 0, 1, 1,
0.4359171, -1.325106, 2.662464, 0.09803922, 0, 1, 1,
0.4443965, -1.607067, 3.277868, 0.1058824, 0, 1, 1,
0.4449716, -0.8137208, 2.38226, 0.1098039, 0, 1, 1,
0.4461102, -0.05832556, 0.1499915, 0.1176471, 0, 1, 1,
0.4500275, -0.6392944, 2.212622, 0.1215686, 0, 1, 1,
0.4542942, 0.4030891, -0.9953119, 0.1294118, 0, 1, 1,
0.4557694, -0.7028573, 1.773711, 0.1333333, 0, 1, 1,
0.4611293, 1.456797, 0.1471915, 0.1411765, 0, 1, 1,
0.4651136, 0.313204, 0.4127319, 0.145098, 0, 1, 1,
0.4703885, -0.03731868, 2.319145, 0.1529412, 0, 1, 1,
0.4709454, -1.246275, 2.195239, 0.1568628, 0, 1, 1,
0.472077, 0.6552063, 1.127541, 0.1647059, 0, 1, 1,
0.4745899, -0.4114197, 2.123304, 0.1686275, 0, 1, 1,
0.4766067, -0.901627, 3.227896, 0.1764706, 0, 1, 1,
0.4802446, 0.3536957, 1.157343, 0.1803922, 0, 1, 1,
0.4803852, 0.008965641, 1.040294, 0.1882353, 0, 1, 1,
0.480728, -0.4555872, 2.046306, 0.1921569, 0, 1, 1,
0.4847873, 1.195747, -1.326668, 0.2, 0, 1, 1,
0.4919468, -0.2848325, 2.531016, 0.2078431, 0, 1, 1,
0.492103, -0.2939951, 2.496358, 0.2117647, 0, 1, 1,
0.4990574, 0.2329351, 1.478792, 0.2196078, 0, 1, 1,
0.4991483, 0.645079, 2.049528, 0.2235294, 0, 1, 1,
0.5057134, -0.5678564, 2.375364, 0.2313726, 0, 1, 1,
0.5066809, -1.012466, 1.155377, 0.2352941, 0, 1, 1,
0.5077454, 0.3115603, 0.6240328, 0.2431373, 0, 1, 1,
0.5115913, 0.3651623, 3.986396, 0.2470588, 0, 1, 1,
0.5142795, 1.68575, -0.1190787, 0.254902, 0, 1, 1,
0.5158212, -0.2221612, 2.692936, 0.2588235, 0, 1, 1,
0.5283235, -0.7046459, 2.556507, 0.2666667, 0, 1, 1,
0.5316203, -1.496818, 4.054718, 0.2705882, 0, 1, 1,
0.5320381, 1.001457, 0.3862388, 0.2784314, 0, 1, 1,
0.5353165, 1.50125, -0.2745283, 0.282353, 0, 1, 1,
0.537493, -0.7526169, 2.824569, 0.2901961, 0, 1, 1,
0.5385346, -0.664628, 1.775582, 0.2941177, 0, 1, 1,
0.5385507, -0.8199256, 3.514473, 0.3019608, 0, 1, 1,
0.5404367, -0.1910499, 3.038672, 0.3098039, 0, 1, 1,
0.5457299, 0.944169, 1.713498, 0.3137255, 0, 1, 1,
0.549641, -0.5429788, 1.515899, 0.3215686, 0, 1, 1,
0.5527861, 0.4498516, 0.4180341, 0.3254902, 0, 1, 1,
0.5559944, 0.1778945, 0.9836395, 0.3333333, 0, 1, 1,
0.55879, 0.6632342, 2.565703, 0.3372549, 0, 1, 1,
0.5653043, -0.508061, 3.239957, 0.345098, 0, 1, 1,
0.5677995, 0.5326698, 0.7609137, 0.3490196, 0, 1, 1,
0.5751483, 1.138101, 1.31307, 0.3568628, 0, 1, 1,
0.5757958, -0.5092539, 2.941419, 0.3607843, 0, 1, 1,
0.5764249, -0.2195618, 1.059794, 0.3686275, 0, 1, 1,
0.5831804, -2.2396, 0.6701915, 0.372549, 0, 1, 1,
0.5837783, -0.5693637, 2.998711, 0.3803922, 0, 1, 1,
0.5839943, -0.8183278, 4.134672, 0.3843137, 0, 1, 1,
0.587837, -2.423579, 2.904299, 0.3921569, 0, 1, 1,
0.5882735, -1.752398, 5.599129, 0.3960784, 0, 1, 1,
0.5900775, -0.1392061, 1.077968, 0.4039216, 0, 1, 1,
0.5907909, 0.8335644, 0.04677022, 0.4117647, 0, 1, 1,
0.5950438, 0.1149617, 0.8378216, 0.4156863, 0, 1, 1,
0.6171508, -0.1192534, 2.021078, 0.4235294, 0, 1, 1,
0.6174245, 0.3587834, 1.805688, 0.427451, 0, 1, 1,
0.6191586, 0.021187, 0.5281152, 0.4352941, 0, 1, 1,
0.620032, 1.596533, -0.6987447, 0.4392157, 0, 1, 1,
0.628612, 0.9248062, 1.211607, 0.4470588, 0, 1, 1,
0.6317838, -0.9582543, 2.099815, 0.4509804, 0, 1, 1,
0.6350209, -0.1828025, 2.950323, 0.4588235, 0, 1, 1,
0.6419232, -0.6031537, 3.425944, 0.4627451, 0, 1, 1,
0.6439157, -0.3191884, 1.681806, 0.4705882, 0, 1, 1,
0.6441033, -0.221619, 0.4155174, 0.4745098, 0, 1, 1,
0.644192, -0.5702912, 1.430542, 0.4823529, 0, 1, 1,
0.6506538, 0.8899255, -1.028845, 0.4862745, 0, 1, 1,
0.6547833, 0.4589197, -0.04720738, 0.4941176, 0, 1, 1,
0.6649969, 2.537718, 0.542407, 0.5019608, 0, 1, 1,
0.6721877, 0.7629711, 0.0835913, 0.5058824, 0, 1, 1,
0.6723319, -1.095643, 1.931118, 0.5137255, 0, 1, 1,
0.6732352, 0.4206513, 0.4237151, 0.5176471, 0, 1, 1,
0.6772002, 0.8815929, 0.5610355, 0.5254902, 0, 1, 1,
0.6802967, 0.8291039, 1.148902, 0.5294118, 0, 1, 1,
0.682542, 0.2022645, 1.705447, 0.5372549, 0, 1, 1,
0.683497, 0.6470708, -0.08909976, 0.5411765, 0, 1, 1,
0.687997, -0.1176441, 2.541818, 0.5490196, 0, 1, 1,
0.6915246, 0.9723049, 0.9383591, 0.5529412, 0, 1, 1,
0.6960124, -0.7300243, 1.027038, 0.5607843, 0, 1, 1,
0.7039235, 0.3546765, 1.050227, 0.5647059, 0, 1, 1,
0.7089633, -2.770636, 4.72559, 0.572549, 0, 1, 1,
0.7178228, 1.85367, 0.1634573, 0.5764706, 0, 1, 1,
0.7181206, 1.24834, 0.0132344, 0.5843138, 0, 1, 1,
0.7187846, 0.7253051, 1.472218, 0.5882353, 0, 1, 1,
0.7190254, 0.8309081, -0.4942579, 0.5960785, 0, 1, 1,
0.7205561, -0.3947799, 1.801937, 0.6039216, 0, 1, 1,
0.7254267, -0.3915554, 2.782941, 0.6078432, 0, 1, 1,
0.7275349, -0.5944164, 1.871138, 0.6156863, 0, 1, 1,
0.7286567, -1.269937, 2.344611, 0.6196079, 0, 1, 1,
0.7305886, -0.07998189, 2.954988, 0.627451, 0, 1, 1,
0.7336826, 0.4051922, 1.681133, 0.6313726, 0, 1, 1,
0.7338344, 0.2621771, -1.476135, 0.6392157, 0, 1, 1,
0.7344072, -0.9691297, 2.285226, 0.6431373, 0, 1, 1,
0.7459641, 0.8620642, -0.6496937, 0.6509804, 0, 1, 1,
0.760966, 1.125935, -1.189525, 0.654902, 0, 1, 1,
0.7622187, -0.2540545, 1.530388, 0.6627451, 0, 1, 1,
0.7661571, -0.3964399, 2.365981, 0.6666667, 0, 1, 1,
0.7669547, -1.741353, 1.671879, 0.6745098, 0, 1, 1,
0.7669708, 0.1363456, 0.3216437, 0.6784314, 0, 1, 1,
0.7689818, 2.493922, 0.6349617, 0.6862745, 0, 1, 1,
0.7709174, -0.3057207, 2.768049, 0.6901961, 0, 1, 1,
0.771695, -0.896848, 0.6421953, 0.6980392, 0, 1, 1,
0.7879318, 1.208712, 0.4417363, 0.7058824, 0, 1, 1,
0.7890584, 0.1649219, 1.330893, 0.7098039, 0, 1, 1,
0.7923084, 0.3118802, 1.796179, 0.7176471, 0, 1, 1,
0.7936173, -0.5932779, 2.494461, 0.7215686, 0, 1, 1,
0.7968576, -1.858301, 2.458403, 0.7294118, 0, 1, 1,
0.8006698, -1.417767, 2.644215, 0.7333333, 0, 1, 1,
0.8037744, -1.101626, 0.753391, 0.7411765, 0, 1, 1,
0.8042412, -1.712606, 2.238361, 0.7450981, 0, 1, 1,
0.8108441, 0.03327976, 3.209979, 0.7529412, 0, 1, 1,
0.8148004, 1.64797, 0.9081257, 0.7568628, 0, 1, 1,
0.8197606, 1.306822, 2.042187, 0.7647059, 0, 1, 1,
0.8205695, -0.1478318, 2.406571, 0.7686275, 0, 1, 1,
0.8335077, -1.672258, 1.849408, 0.7764706, 0, 1, 1,
0.8354596, 0.1071215, 0.9527255, 0.7803922, 0, 1, 1,
0.8364454, -0.8721984, 0.9131497, 0.7882353, 0, 1, 1,
0.8389091, 0.7371866, 0.7314246, 0.7921569, 0, 1, 1,
0.8414488, -0.01433515, 2.85938, 0.8, 0, 1, 1,
0.8417338, 1.698264, 0.2151451, 0.8078431, 0, 1, 1,
0.8464769, -0.3149861, 3.898968, 0.8117647, 0, 1, 1,
0.8530841, 1.977946, 1.584005, 0.8196079, 0, 1, 1,
0.8584984, 1.43748, 1.524189, 0.8235294, 0, 1, 1,
0.863377, 0.09279007, 1.025164, 0.8313726, 0, 1, 1,
0.865148, -0.2859586, 2.377498, 0.8352941, 0, 1, 1,
0.8653259, 2.296587, 1.398897, 0.8431373, 0, 1, 1,
0.8662012, 0.3520131, 2.125237, 0.8470588, 0, 1, 1,
0.8727739, -0.193919, 1.963234, 0.854902, 0, 1, 1,
0.8737599, 0.8133714, 1.65797, 0.8588235, 0, 1, 1,
0.8770438, 0.4644862, 1.626117, 0.8666667, 0, 1, 1,
0.8771164, -0.5736728, 2.258216, 0.8705882, 0, 1, 1,
0.8785551, 0.2283475, 0.00741033, 0.8784314, 0, 1, 1,
0.8831063, -0.4473205, 0.92344, 0.8823529, 0, 1, 1,
0.8839175, -0.4323066, 3.007273, 0.8901961, 0, 1, 1,
0.8861674, 1.19052, 0.6728559, 0.8941177, 0, 1, 1,
0.8903881, 0.9826828, 1.567585, 0.9019608, 0, 1, 1,
0.8952953, 0.3268556, -0.06127183, 0.9098039, 0, 1, 1,
0.8969351, -0.5680357, 3.744256, 0.9137255, 0, 1, 1,
0.9010364, -0.4766537, -0.1771595, 0.9215686, 0, 1, 1,
0.9044703, 1.701544, 0.6505992, 0.9254902, 0, 1, 1,
0.9086612, 2.128433, -0.6764321, 0.9333333, 0, 1, 1,
0.9239374, -0.03840693, 0.9236115, 0.9372549, 0, 1, 1,
0.9245297, -0.1721168, 1.282496, 0.945098, 0, 1, 1,
0.9304305, 0.7555108, 0.5316979, 0.9490196, 0, 1, 1,
0.9314629, -0.5018452, 0.6889008, 0.9568627, 0, 1, 1,
0.9321194, 0.03915133, 1.462862, 0.9607843, 0, 1, 1,
0.9363241, -0.713599, 2.585377, 0.9686275, 0, 1, 1,
0.9392379, 0.5221112, 0.09327339, 0.972549, 0, 1, 1,
0.9434521, 1.362676, 0.1020452, 0.9803922, 0, 1, 1,
0.94808, -1.525789, 3.167821, 0.9843137, 0, 1, 1,
0.9494688, 1.369243, 0.1121777, 0.9921569, 0, 1, 1,
0.9496589, -1.111689, 2.787322, 0.9960784, 0, 1, 1,
0.9542105, 0.8805494, 2.44162, 1, 0, 0.9960784, 1,
0.9641428, -2.013783, 2.307422, 1, 0, 0.9882353, 1,
0.9645081, -2.093895, 3.648065, 1, 0, 0.9843137, 1,
0.9647995, 1.06523, 0.1205589, 1, 0, 0.9764706, 1,
0.9669669, 0.2687909, 1.083756, 1, 0, 0.972549, 1,
0.9726353, -0.6619442, 4.465353, 1, 0, 0.9647059, 1,
0.9780443, 0.6395939, -0.1849629, 1, 0, 0.9607843, 1,
0.9794413, -0.3627953, 3.567853, 1, 0, 0.9529412, 1,
0.9815756, -0.3835782, 2.603728, 1, 0, 0.9490196, 1,
0.984594, 0.1323205, 2.882886, 1, 0, 0.9411765, 1,
0.9870059, -1.728645, 2.777993, 1, 0, 0.9372549, 1,
0.9874821, 0.09303845, 2.763437, 1, 0, 0.9294118, 1,
0.9994695, -0.1155784, 2.473893, 1, 0, 0.9254902, 1,
1.003822, -0.1738464, 0.8409606, 1, 0, 0.9176471, 1,
1.011293, -1.126016, 3.544574, 1, 0, 0.9137255, 1,
1.015614, -1.68113, 1.988243, 1, 0, 0.9058824, 1,
1.023031, -2.504082, 1.998902, 1, 0, 0.9019608, 1,
1.024593, 1.565874, 0.6238231, 1, 0, 0.8941177, 1,
1.026106, 0.5710053, 1.522682, 1, 0, 0.8862745, 1,
1.026863, -0.9618996, 2.53923, 1, 0, 0.8823529, 1,
1.056247, 1.122295, -1.070647, 1, 0, 0.8745098, 1,
1.056808, 0.6198123, 1.10681, 1, 0, 0.8705882, 1,
1.064978, 1.492598, 0.5580429, 1, 0, 0.8627451, 1,
1.073362, -1.023291, 1.962882, 1, 0, 0.8588235, 1,
1.073987, 0.9235687, 0.9799186, 1, 0, 0.8509804, 1,
1.076553, -0.3385812, -0.2200347, 1, 0, 0.8470588, 1,
1.085442, -0.3927174, 4.003309, 1, 0, 0.8392157, 1,
1.090279, -2.040781, 4.19798, 1, 0, 0.8352941, 1,
1.096624, -1.324477, 3.104058, 1, 0, 0.827451, 1,
1.108066, -0.3387073, 2.530785, 1, 0, 0.8235294, 1,
1.112254, 0.2166303, 2.676699, 1, 0, 0.8156863, 1,
1.113005, 0.2737029, 1.907971, 1, 0, 0.8117647, 1,
1.120561, -0.5419959, 3.299949, 1, 0, 0.8039216, 1,
1.12116, 0.6653958, 2.110398, 1, 0, 0.7960784, 1,
1.138029, 0.506164, 2.500634, 1, 0, 0.7921569, 1,
1.142404, -0.889165, 2.292344, 1, 0, 0.7843137, 1,
1.143525, -0.3003825, 3.11587, 1, 0, 0.7803922, 1,
1.149081, -0.1646663, 2.586894, 1, 0, 0.772549, 1,
1.149427, -0.4031023, 0.3690467, 1, 0, 0.7686275, 1,
1.161953, -2.056854, 2.125639, 1, 0, 0.7607843, 1,
1.170041, -1.176854, 3.181253, 1, 0, 0.7568628, 1,
1.170479, 1.520481, 1.300502, 1, 0, 0.7490196, 1,
1.174457, -1.854549, 2.51079, 1, 0, 0.7450981, 1,
1.192988, 0.0772851, 0.6786175, 1, 0, 0.7372549, 1,
1.196516, -0.700368, 3.771977, 1, 0, 0.7333333, 1,
1.196614, -0.265387, 0.6068813, 1, 0, 0.7254902, 1,
1.199506, -0.1214505, -0.7356664, 1, 0, 0.7215686, 1,
1.200612, 0.797797, 0.3232146, 1, 0, 0.7137255, 1,
1.201155, 0.9730973, 1.124315, 1, 0, 0.7098039, 1,
1.203266, -0.6073282, 3.914522, 1, 0, 0.7019608, 1,
1.207717, -0.5539654, 3.035877, 1, 0, 0.6941177, 1,
1.217575, -0.09490702, 2.944065, 1, 0, 0.6901961, 1,
1.221208, -0.7621333, 4.924038, 1, 0, 0.682353, 1,
1.230455, 2.26752, -0.02738891, 1, 0, 0.6784314, 1,
1.233409, -0.6890336, 2.172436, 1, 0, 0.6705883, 1,
1.242384, 0.7945737, 2.535373, 1, 0, 0.6666667, 1,
1.244513, 0.3607006, 0.9329616, 1, 0, 0.6588235, 1,
1.24757, 0.6789737, -1.398309, 1, 0, 0.654902, 1,
1.248046, 1.158645, 1.283228, 1, 0, 0.6470588, 1,
1.253202, 0.3360285, 1.615587, 1, 0, 0.6431373, 1,
1.263292, -1.267037, 2.679414, 1, 0, 0.6352941, 1,
1.265378, 1.820907, 1.051059, 1, 0, 0.6313726, 1,
1.27376, -0.1135082, 0.3215948, 1, 0, 0.6235294, 1,
1.2802, -1.748446, 3.989417, 1, 0, 0.6196079, 1,
1.288645, -0.1404266, 1.450824, 1, 0, 0.6117647, 1,
1.289971, -1.997714, 2.964398, 1, 0, 0.6078432, 1,
1.293804, 0.8391863, 0.4839097, 1, 0, 0.6, 1,
1.308782, 0.8619256, 2.125452, 1, 0, 0.5921569, 1,
1.318914, 1.548397, -0.1451344, 1, 0, 0.5882353, 1,
1.32414, 1.413429, 0.580991, 1, 0, 0.5803922, 1,
1.326811, -0.6050522, 0.4201592, 1, 0, 0.5764706, 1,
1.337421, 0.8243064, 1.926335, 1, 0, 0.5686275, 1,
1.337861, -1.229421, 0.7781644, 1, 0, 0.5647059, 1,
1.342112, -1.046617, 2.608366, 1, 0, 0.5568628, 1,
1.342349, 0.3935652, 0.544363, 1, 0, 0.5529412, 1,
1.356967, 0.1482801, 0.5168747, 1, 0, 0.5450981, 1,
1.358912, 1.110905, 0.504881, 1, 0, 0.5411765, 1,
1.381084, 0.9087043, 0.6476571, 1, 0, 0.5333334, 1,
1.382045, 1.221186, 4.169868, 1, 0, 0.5294118, 1,
1.388202, -0.2027613, 2.510092, 1, 0, 0.5215687, 1,
1.392528, -0.6816632, 2.293747, 1, 0, 0.5176471, 1,
1.408734, 0.8654737, 2.851943, 1, 0, 0.509804, 1,
1.41206, -0.1882197, 0.6241933, 1, 0, 0.5058824, 1,
1.41537, -1.505722, 1.629903, 1, 0, 0.4980392, 1,
1.419324, 1.804383, -0.7458224, 1, 0, 0.4901961, 1,
1.422934, -1.322651, 2.175323, 1, 0, 0.4862745, 1,
1.424549, -0.5878333, 1.911656, 1, 0, 0.4784314, 1,
1.433636, -0.8652318, 2.643812, 1, 0, 0.4745098, 1,
1.438067, 0.06096328, 1.536465, 1, 0, 0.4666667, 1,
1.442122, -1.461172, 0.4530554, 1, 0, 0.4627451, 1,
1.443313, -0.873938, 2.405871, 1, 0, 0.454902, 1,
1.462979, 1.132373, 1.121716, 1, 0, 0.4509804, 1,
1.48203, 1.418186, 0.4154215, 1, 0, 0.4431373, 1,
1.489205, -0.5482002, 1.839754, 1, 0, 0.4392157, 1,
1.507566, -1.232924, 2.03067, 1, 0, 0.4313726, 1,
1.507859, -1.407037, 1.79276, 1, 0, 0.427451, 1,
1.515422, 1.01706, -1.632603, 1, 0, 0.4196078, 1,
1.523039, 1.068497, 3.262926, 1, 0, 0.4156863, 1,
1.535397, -0.4291451, 2.644305, 1, 0, 0.4078431, 1,
1.540459, 0.4235544, 3.590778, 1, 0, 0.4039216, 1,
1.540734, -0.02268841, 0.6259414, 1, 0, 0.3960784, 1,
1.541837, 1.419752, 0.5634154, 1, 0, 0.3882353, 1,
1.543737, -0.186406, 2.751776, 1, 0, 0.3843137, 1,
1.555303, -1.027074, 3.633335, 1, 0, 0.3764706, 1,
1.585139, -0.9933385, 3.00393, 1, 0, 0.372549, 1,
1.588073, 1.872594, 2.64329, 1, 0, 0.3647059, 1,
1.599854, 0.3230119, 1.969523, 1, 0, 0.3607843, 1,
1.628432, 0.2689598, 3.560198, 1, 0, 0.3529412, 1,
1.649851, -0.9554809, 1.065451, 1, 0, 0.3490196, 1,
1.660484, -0.949805, 1.828233, 1, 0, 0.3411765, 1,
1.664317, -0.8044514, 1.518313, 1, 0, 0.3372549, 1,
1.677116, -0.5791374, 3.69204, 1, 0, 0.3294118, 1,
1.677642, 0.2509658, 1.962934, 1, 0, 0.3254902, 1,
1.694214, -0.3479049, 0.8563936, 1, 0, 0.3176471, 1,
1.699484, 0.4894773, 2.32144, 1, 0, 0.3137255, 1,
1.706733, 0.5798548, 1.480966, 1, 0, 0.3058824, 1,
1.711235, 0.7238635, -1.091076, 1, 0, 0.2980392, 1,
1.723909, 0.9876271, 0.4841863, 1, 0, 0.2941177, 1,
1.731946, 0.3458174, 2.861172, 1, 0, 0.2862745, 1,
1.73519, -0.2594336, 2.129243, 1, 0, 0.282353, 1,
1.765547, -0.7144932, 3.397745, 1, 0, 0.2745098, 1,
1.780135, -0.03304309, 3.400503, 1, 0, 0.2705882, 1,
1.790243, -0.002952094, 1.630861, 1, 0, 0.2627451, 1,
1.793864, -1.494368, 1.418509, 1, 0, 0.2588235, 1,
1.810968, -0.3349918, 3.297906, 1, 0, 0.2509804, 1,
1.822541, 0.6575349, 1.776646, 1, 0, 0.2470588, 1,
1.823831, 0.1877541, 0.841906, 1, 0, 0.2392157, 1,
1.830896, -2.377649, 0.5727751, 1, 0, 0.2352941, 1,
1.841617, -0.6948493, 1.979223, 1, 0, 0.227451, 1,
1.863813, -0.07564895, 3.172467, 1, 0, 0.2235294, 1,
1.903774, -2.467234, 1.472431, 1, 0, 0.2156863, 1,
1.926289, -0.06836747, 1.793999, 1, 0, 0.2117647, 1,
1.930945, -0.09113486, 1.619337, 1, 0, 0.2039216, 1,
1.933106, 0.857206, 1.610326, 1, 0, 0.1960784, 1,
1.938165, -0.5312605, 4.019129, 1, 0, 0.1921569, 1,
1.946197, 2.026868, -0.7845183, 1, 0, 0.1843137, 1,
1.986996, 1.291789, -0.231287, 1, 0, 0.1803922, 1,
2.000533, 0.5103377, 2.260017, 1, 0, 0.172549, 1,
2.01882, -1.093187, 1.644549, 1, 0, 0.1686275, 1,
2.030425, 0.3993016, 0.8009405, 1, 0, 0.1607843, 1,
2.038936, -0.4246322, 2.177182, 1, 0, 0.1568628, 1,
2.052606, -0.8946086, 3.409827, 1, 0, 0.1490196, 1,
2.070122, -0.5990483, 2.559959, 1, 0, 0.145098, 1,
2.072918, -0.07059429, 0.9996483, 1, 0, 0.1372549, 1,
2.085532, 0.3870321, 2.540868, 1, 0, 0.1333333, 1,
2.13781, 1.014997, 1.605511, 1, 0, 0.1254902, 1,
2.149347, -0.917463, 2.19062, 1, 0, 0.1215686, 1,
2.194261, -1.384476, 1.193243, 1, 0, 0.1137255, 1,
2.233426, -0.02497595, 0.7518634, 1, 0, 0.1098039, 1,
2.234569, -1.103327, 1.903488, 1, 0, 0.1019608, 1,
2.246944, -1.24524, 1.832021, 1, 0, 0.09411765, 1,
2.258326, 0.280846, 2.971908, 1, 0, 0.09019608, 1,
2.25884, -0.7591955, 2.0756, 1, 0, 0.08235294, 1,
2.313779, -0.4644353, 3.692629, 1, 0, 0.07843138, 1,
2.328527, -0.5045004, 1.77564, 1, 0, 0.07058824, 1,
2.366611, 1.56538, 1.207644, 1, 0, 0.06666667, 1,
2.447712, 0.01431595, 0.9322102, 1, 0, 0.05882353, 1,
2.503232, -0.6943218, 1.093758, 1, 0, 0.05490196, 1,
2.507522, -0.97753, 2.26649, 1, 0, 0.04705882, 1,
2.572081, 0.7996863, 1.718738, 1, 0, 0.04313726, 1,
2.579045, 0.06991197, 3.351879, 1, 0, 0.03529412, 1,
2.722705, -0.02407726, 2.830771, 1, 0, 0.03137255, 1,
2.780592, -1.056968, 1.043666, 1, 0, 0.02352941, 1,
2.842825, -0.5715209, 2.067674, 1, 0, 0.01960784, 1,
3.069345, 1.523009, 0.980171, 1, 0, 0.01176471, 1,
3.107828, -0.006972549, 1.017294, 1, 0, 0.007843138, 1
]);
var buf7 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc7 = gl.getUniformLocation(prog7,"mvMatrix");
var prMatLoc7 = gl.getUniformLocation(prog7,"prMatrix");
// ****** text object 9 ******
var prog9  = gl.createProgram();
gl.attachShader(prog9, getShader( gl, "testglvshader9" ));
gl.attachShader(prog9, getShader( gl, "testglfshader9" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog9, 0, "aPos");
gl.bindAttribLocation(prog9, 1, "aCol");
gl.linkProgram(prog9);
var texts = [
"x"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX9 = texinfo.canvasX;
var canvasY9 = texinfo.canvasY;
var ofsLoc9 = gl.getAttribLocation(prog9, "aOfs");
var texture9 = gl.createTexture();
var texLoc9 = gl.getAttribLocation(prog9, "aTexcoord");
var sampler9 = gl.getUniformLocation(prog9,"uSampler");
handleLoadedTexture(texture9, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-0.5758518, -3.851578, -6.976618, 0, -0.5, 0.5, 0.5,
-0.5758518, -3.851578, -6.976618, 1, -0.5, 0.5, 0.5,
-0.5758518, -3.851578, -6.976618, 1, 1.5, 0.5, 0.5,
-0.5758518, -3.851578, -6.976618, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf9 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf9 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc9 = gl.getUniformLocation(prog9,"mvMatrix");
var prMatLoc9 = gl.getUniformLocation(prog9,"prMatrix");
var textScaleLoc9 = gl.getUniformLocation(prog9,"textScale");
// ****** text object 10 ******
var prog10  = gl.createProgram();
gl.attachShader(prog10, getShader( gl, "testglvshader10" ));
gl.attachShader(prog10, getShader( gl, "testglfshader10" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog10, 0, "aPos");
gl.bindAttribLocation(prog10, 1, "aCol");
gl.linkProgram(prog10);
var texts = [
"y"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX10 = texinfo.canvasX;
var canvasY10 = texinfo.canvasY;
var ofsLoc10 = gl.getAttribLocation(prog10, "aOfs");
var texture10 = gl.createTexture();
var texLoc10 = gl.getAttribLocation(prog10, "aTexcoord");
var sampler10 = gl.getUniformLocation(prog10,"uSampler");
handleLoadedTexture(texture10, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-5.508299, -0.07028508, -6.976618, 0, -0.5, 0.5, 0.5,
-5.508299, -0.07028508, -6.976618, 1, -0.5, 0.5, 0.5,
-5.508299, -0.07028508, -6.976618, 1, 1.5, 0.5, 0.5,
-5.508299, -0.07028508, -6.976618, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf10 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf10 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc10 = gl.getUniformLocation(prog10,"mvMatrix");
var prMatLoc10 = gl.getUniformLocation(prog10,"prMatrix");
var textScaleLoc10 = gl.getUniformLocation(prog10,"textScale");
// ****** text object 11 ******
var prog11  = gl.createProgram();
gl.attachShader(prog11, getShader( gl, "testglvshader11" ));
gl.attachShader(prog11, getShader( gl, "testglfshader11" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog11, 0, "aPos");
gl.bindAttribLocation(prog11, 1, "aCol");
gl.linkProgram(prog11);
var texts = [
"z"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX11 = texinfo.canvasX;
var canvasY11 = texinfo.canvasY;
var ofsLoc11 = gl.getAttribLocation(prog11, "aOfs");
var texture11 = gl.createTexture();
var texLoc11 = gl.getAttribLocation(prog11, "aTexcoord");
var sampler11 = gl.getUniformLocation(prog11,"uSampler");
handleLoadedTexture(texture11, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-5.508299, -3.851578, 0.2225807, 0, -0.5, 0.5, 0.5,
-5.508299, -3.851578, 0.2225807, 1, -0.5, 0.5, 0.5,
-5.508299, -3.851578, 0.2225807, 1, 1.5, 0.5, 0.5,
-5.508299, -3.851578, 0.2225807, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf11 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf11 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc11 = gl.getUniformLocation(prog11,"mvMatrix");
var prMatLoc11 = gl.getUniformLocation(prog11,"prMatrix");
var textScaleLoc11 = gl.getUniformLocation(prog11,"textScale");
// ****** lines object 12 ******
var prog12  = gl.createProgram();
gl.attachShader(prog12, getShader( gl, "testglvshader12" ));
gl.attachShader(prog12, getShader( gl, "testglfshader12" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog12, 0, "aPos");
gl.bindAttribLocation(prog12, 1, "aCol");
gl.linkProgram(prog12);
var v=new Float32Array([
-4, -2.978972, -5.315264,
2, -2.978972, -5.315264,
-4, -2.978972, -5.315264,
-4, -3.124406, -5.592156,
-2, -2.978972, -5.315264,
-2, -3.124406, -5.592156,
0, -2.978972, -5.315264,
0, -3.124406, -5.592156,
2, -2.978972, -5.315264,
2, -3.124406, -5.592156
]);
var buf12 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc12 = gl.getUniformLocation(prog12,"mvMatrix");
var prMatLoc12 = gl.getUniformLocation(prog12,"prMatrix");
// ****** text object 13 ******
var prog13  = gl.createProgram();
gl.attachShader(prog13, getShader( gl, "testglvshader13" ));
gl.attachShader(prog13, getShader( gl, "testglfshader13" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog13, 0, "aPos");
gl.bindAttribLocation(prog13, 1, "aCol");
gl.linkProgram(prog13);
var texts = [
"-4",
"-2",
"0",
"2"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX13 = texinfo.canvasX;
var canvasY13 = texinfo.canvasY;
var ofsLoc13 = gl.getAttribLocation(prog13, "aOfs");
var texture13 = gl.createTexture();
var texLoc13 = gl.getAttribLocation(prog13, "aTexcoord");
var sampler13 = gl.getUniformLocation(prog13,"uSampler");
handleLoadedTexture(texture13, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4, -3.415275, -6.145941, 0, -0.5, 0.5, 0.5,
-4, -3.415275, -6.145941, 1, -0.5, 0.5, 0.5,
-4, -3.415275, -6.145941, 1, 1.5, 0.5, 0.5,
-4, -3.415275, -6.145941, 0, 1.5, 0.5, 0.5,
-2, -3.415275, -6.145941, 0, -0.5, 0.5, 0.5,
-2, -3.415275, -6.145941, 1, -0.5, 0.5, 0.5,
-2, -3.415275, -6.145941, 1, 1.5, 0.5, 0.5,
-2, -3.415275, -6.145941, 0, 1.5, 0.5, 0.5,
0, -3.415275, -6.145941, 0, -0.5, 0.5, 0.5,
0, -3.415275, -6.145941, 1, -0.5, 0.5, 0.5,
0, -3.415275, -6.145941, 1, 1.5, 0.5, 0.5,
0, -3.415275, -6.145941, 0, 1.5, 0.5, 0.5,
2, -3.415275, -6.145941, 0, -0.5, 0.5, 0.5,
2, -3.415275, -6.145941, 1, -0.5, 0.5, 0.5,
2, -3.415275, -6.145941, 1, 1.5, 0.5, 0.5,
2, -3.415275, -6.145941, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15
]);
var buf13 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf13 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc13 = gl.getUniformLocation(prog13,"mvMatrix");
var prMatLoc13 = gl.getUniformLocation(prog13,"prMatrix");
var textScaleLoc13 = gl.getUniformLocation(prog13,"textScale");
// ****** lines object 14 ******
var prog14  = gl.createProgram();
gl.attachShader(prog14, getShader( gl, "testglvshader14" ));
gl.attachShader(prog14, getShader( gl, "testglfshader14" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog14, 0, "aPos");
gl.bindAttribLocation(prog14, 1, "aCol");
gl.linkProgram(prog14);
var v=new Float32Array([
-4.370042, -2, -5.315264,
-4.370042, 2, -5.315264,
-4.370042, -2, -5.315264,
-4.559752, -2, -5.592156,
-4.370042, -1, -5.315264,
-4.559752, -1, -5.592156,
-4.370042, 0, -5.315264,
-4.559752, 0, -5.592156,
-4.370042, 1, -5.315264,
-4.559752, 1, -5.592156,
-4.370042, 2, -5.315264,
-4.559752, 2, -5.592156
]);
var buf14 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc14 = gl.getUniformLocation(prog14,"mvMatrix");
var prMatLoc14 = gl.getUniformLocation(prog14,"prMatrix");
// ****** text object 15 ******
var prog15  = gl.createProgram();
gl.attachShader(prog15, getShader( gl, "testglvshader15" ));
gl.attachShader(prog15, getShader( gl, "testglfshader15" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog15, 0, "aPos");
gl.bindAttribLocation(prog15, 1, "aCol");
gl.linkProgram(prog15);
var texts = [
"-2",
"-1",
"0",
"1",
"2"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX15 = texinfo.canvasX;
var canvasY15 = texinfo.canvasY;
var ofsLoc15 = gl.getAttribLocation(prog15, "aOfs");
var texture15 = gl.createTexture();
var texLoc15 = gl.getAttribLocation(prog15, "aTexcoord");
var sampler15 = gl.getUniformLocation(prog15,"uSampler");
handleLoadedTexture(texture15, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.93917, -2, -6.145941, 0, -0.5, 0.5, 0.5,
-4.93917, -2, -6.145941, 1, -0.5, 0.5, 0.5,
-4.93917, -2, -6.145941, 1, 1.5, 0.5, 0.5,
-4.93917, -2, -6.145941, 0, 1.5, 0.5, 0.5,
-4.93917, -1, -6.145941, 0, -0.5, 0.5, 0.5,
-4.93917, -1, -6.145941, 1, -0.5, 0.5, 0.5,
-4.93917, -1, -6.145941, 1, 1.5, 0.5, 0.5,
-4.93917, -1, -6.145941, 0, 1.5, 0.5, 0.5,
-4.93917, 0, -6.145941, 0, -0.5, 0.5, 0.5,
-4.93917, 0, -6.145941, 1, -0.5, 0.5, 0.5,
-4.93917, 0, -6.145941, 1, 1.5, 0.5, 0.5,
-4.93917, 0, -6.145941, 0, 1.5, 0.5, 0.5,
-4.93917, 1, -6.145941, 0, -0.5, 0.5, 0.5,
-4.93917, 1, -6.145941, 1, -0.5, 0.5, 0.5,
-4.93917, 1, -6.145941, 1, 1.5, 0.5, 0.5,
-4.93917, 1, -6.145941, 0, 1.5, 0.5, 0.5,
-4.93917, 2, -6.145941, 0, -0.5, 0.5, 0.5,
-4.93917, 2, -6.145941, 1, -0.5, 0.5, 0.5,
-4.93917, 2, -6.145941, 1, 1.5, 0.5, 0.5,
-4.93917, 2, -6.145941, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<5; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19
]);
var buf15 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf15 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc15 = gl.getUniformLocation(prog15,"mvMatrix");
var prMatLoc15 = gl.getUniformLocation(prog15,"prMatrix");
var textScaleLoc15 = gl.getUniformLocation(prog15,"textScale");
// ****** lines object 16 ******
var prog16  = gl.createProgram();
gl.attachShader(prog16, getShader( gl, "testglvshader16" ));
gl.attachShader(prog16, getShader( gl, "testglfshader16" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog16, 0, "aPos");
gl.bindAttribLocation(prog16, 1, "aCol");
gl.linkProgram(prog16);
var v=new Float32Array([
-4.370042, -2.978972, -4,
-4.370042, -2.978972, 4,
-4.370042, -2.978972, -4,
-4.559752, -3.124406, -4,
-4.370042, -2.978972, -2,
-4.559752, -3.124406, -2,
-4.370042, -2.978972, 0,
-4.559752, -3.124406, 0,
-4.370042, -2.978972, 2,
-4.559752, -3.124406, 2,
-4.370042, -2.978972, 4,
-4.559752, -3.124406, 4
]);
var buf16 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc16 = gl.getUniformLocation(prog16,"mvMatrix");
var prMatLoc16 = gl.getUniformLocation(prog16,"prMatrix");
// ****** text object 17 ******
var prog17  = gl.createProgram();
gl.attachShader(prog17, getShader( gl, "testglvshader17" ));
gl.attachShader(prog17, getShader( gl, "testglfshader17" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog17, 0, "aPos");
gl.bindAttribLocation(prog17, 1, "aCol");
gl.linkProgram(prog17);
var texts = [
"-4",
"-2",
"0",
"2",
"4"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX17 = texinfo.canvasX;
var canvasY17 = texinfo.canvasY;
var ofsLoc17 = gl.getAttribLocation(prog17, "aOfs");
var texture17 = gl.createTexture();
var texLoc17 = gl.getAttribLocation(prog17, "aTexcoord");
var sampler17 = gl.getUniformLocation(prog17,"uSampler");
handleLoadedTexture(texture17, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-4.93917, -3.415275, -4, 0, -0.5, 0.5, 0.5,
-4.93917, -3.415275, -4, 1, -0.5, 0.5, 0.5,
-4.93917, -3.415275, -4, 1, 1.5, 0.5, 0.5,
-4.93917, -3.415275, -4, 0, 1.5, 0.5, 0.5,
-4.93917, -3.415275, -2, 0, -0.5, 0.5, 0.5,
-4.93917, -3.415275, -2, 1, -0.5, 0.5, 0.5,
-4.93917, -3.415275, -2, 1, 1.5, 0.5, 0.5,
-4.93917, -3.415275, -2, 0, 1.5, 0.5, 0.5,
-4.93917, -3.415275, 0, 0, -0.5, 0.5, 0.5,
-4.93917, -3.415275, 0, 1, -0.5, 0.5, 0.5,
-4.93917, -3.415275, 0, 1, 1.5, 0.5, 0.5,
-4.93917, -3.415275, 0, 0, 1.5, 0.5, 0.5,
-4.93917, -3.415275, 2, 0, -0.5, 0.5, 0.5,
-4.93917, -3.415275, 2, 1, -0.5, 0.5, 0.5,
-4.93917, -3.415275, 2, 1, 1.5, 0.5, 0.5,
-4.93917, -3.415275, 2, 0, 1.5, 0.5, 0.5,
-4.93917, -3.415275, 4, 0, -0.5, 0.5, 0.5,
-4.93917, -3.415275, 4, 1, -0.5, 0.5, 0.5,
-4.93917, -3.415275, 4, 1, 1.5, 0.5, 0.5,
-4.93917, -3.415275, 4, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<5; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19
]);
var buf17 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf17 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc17 = gl.getUniformLocation(prog17,"mvMatrix");
var prMatLoc17 = gl.getUniformLocation(prog17,"prMatrix");
var textScaleLoc17 = gl.getUniformLocation(prog17,"textScale");
// ****** lines object 18 ******
var prog18  = gl.createProgram();
gl.attachShader(prog18, getShader( gl, "testglvshader18" ));
gl.attachShader(prog18, getShader( gl, "testglfshader18" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog18, 0, "aPos");
gl.bindAttribLocation(prog18, 1, "aCol");
gl.linkProgram(prog18);
var v=new Float32Array([
-4.370042, -2.978972, -5.315264,
-4.370042, 2.838402, -5.315264,
-4.370042, -2.978972, 5.760426,
-4.370042, 2.838402, 5.760426,
-4.370042, -2.978972, -5.315264,
-4.370042, -2.978972, 5.760426,
-4.370042, 2.838402, -5.315264,
-4.370042, 2.838402, 5.760426,
-4.370042, -2.978972, -5.315264,
3.218338, -2.978972, -5.315264,
-4.370042, -2.978972, 5.760426,
3.218338, -2.978972, 5.760426,
-4.370042, 2.838402, -5.315264,
3.218338, 2.838402, -5.315264,
-4.370042, 2.838402, 5.760426,
3.218338, 2.838402, 5.760426,
3.218338, -2.978972, -5.315264,
3.218338, 2.838402, -5.315264,
3.218338, -2.978972, 5.760426,
3.218338, 2.838402, 5.760426,
3.218338, -2.978972, -5.315264,
3.218338, -2.978972, 5.760426,
3.218338, 2.838402, -5.315264,
3.218338, 2.838402, 5.760426
]);
var buf18 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc18 = gl.getUniformLocation(prog18,"mvMatrix");
var prMatLoc18 = gl.getUniformLocation(prog18,"prMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 1 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 7.813219;
var distance = 34.76189;
var t = tan(fov[1]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[1], hlen*aspect*zoom[1], 
-hlen*zoom[1], hlen*zoom[1], near, far);
else  
prMatrix.frustum(-hlen*zoom[1], hlen*zoom[1], 
-hlen*zoom[1]/aspect, hlen*zoom[1]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( 0.5758518, 0.07028508, -0.2225807 );
mvMatrix.scale( 1.113256, 1.452168, 0.762734 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.76189);
// ****** points object 7 *******
gl.useProgram(prog7);
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.uniformMatrix4fv( prMatLoc7, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc7, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.enableVertexAttribArray( colLoc );
gl.vertexAttribPointer(colLoc, 4, gl.FLOAT, false, 28, 12);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawArrays(gl.POINTS, 0, 1000);
// ****** text object 9 *******
gl.useProgram(prog9);
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.uniformMatrix4fv( prMatLoc9, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc9, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc9, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc9 );
gl.vertexAttribPointer(texLoc9, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture9);
gl.uniform1i( sampler9, 0);
gl.enableVertexAttribArray( ofsLoc9 );
gl.vertexAttribPointer(ofsLoc9, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 10 *******
gl.useProgram(prog10);
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.uniformMatrix4fv( prMatLoc10, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc10, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc10, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc10 );
gl.vertexAttribPointer(texLoc10, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture10);
gl.uniform1i( sampler10, 0);
gl.enableVertexAttribArray( ofsLoc10 );
gl.vertexAttribPointer(ofsLoc10, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 11 *******
gl.useProgram(prog11);
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.uniformMatrix4fv( prMatLoc11, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc11, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc11, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc11 );
gl.vertexAttribPointer(texLoc11, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture11);
gl.uniform1i( sampler11, 0);
gl.enableVertexAttribArray( ofsLoc11 );
gl.vertexAttribPointer(ofsLoc11, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** lines object 12 *******
gl.useProgram(prog12);
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.uniformMatrix4fv( prMatLoc12, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc12, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 10);
// ****** text object 13 *******
gl.useProgram(prog13);
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.uniformMatrix4fv( prMatLoc13, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc13, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc13, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc13 );
gl.vertexAttribPointer(texLoc13, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture13);
gl.uniform1i( sampler13, 0);
gl.enableVertexAttribArray( ofsLoc13 );
gl.vertexAttribPointer(ofsLoc13, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
// ****** lines object 14 *******
gl.useProgram(prog14);
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.uniformMatrix4fv( prMatLoc14, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc14, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 12);
// ****** text object 15 *******
gl.useProgram(prog15);
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.uniformMatrix4fv( prMatLoc15, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc15, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc15, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc15 );
gl.vertexAttribPointer(texLoc15, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture15);
gl.uniform1i( sampler15, 0);
gl.enableVertexAttribArray( ofsLoc15 );
gl.vertexAttribPointer(ofsLoc15, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
// ****** lines object 16 *******
gl.useProgram(prog16);
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.uniformMatrix4fv( prMatLoc16, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc16, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 12);
// ****** text object 17 *******
gl.useProgram(prog17);
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.uniformMatrix4fv( prMatLoc17, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc17, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc17, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc17 );
gl.vertexAttribPointer(texLoc17, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture17);
gl.uniform1i( sampler17, 0);
gl.enableVertexAttribArray( ofsLoc17 );
gl.vertexAttribPointer(ofsLoc17, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
// ****** lines object 18 *******
gl.useProgram(prog18);
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.uniformMatrix4fv( prMatLoc18, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc18, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 24);
gl.flush ();
}
var vpx0 = {
1: 0
};
var vpy0 = {
1: 0
};
var vpWidths = {
1: 504
};
var vpHeights = {
1: 504
};
var activeModel = {
1: 1
};
var activeProjection = {
1: 1
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(1);
return(1);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testglcanvas" width="1" height="1"></canvas> 
<p id="testgldebug">
You must enable Javascript to view this page properly.</p>
<script>testglwebGLStart();</script>

The following a 3D image is of Atrazine rendered from the 3D conformer file derived from here (http://pubchem.ncbi.nlm.nih.gov/compound/2256). The atoms are represented as spheres Nitrogen as blue, carbon as black, hydrogen as white, and chlorine as blue.


```r
open3d()
```

```
## glX 
##   2
```

```r
flazasulfuron<-read.table("flazasulfuron.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-flazasulfuron$V2
```

```
## Error in eval(expr, envir, enclos): object 'flazasulfuron' not found
```

```r
y<-flazasulfuron$V3
```

```
## Error in eval(expr, envir, enclos): object 'flazasulfuron' not found
```

```r
z<-flazasulfuron$V4
```

```
## Error in eval(expr, envir, enclos): object 'flazasulfuron' not found
```

```r
atomcolor=c(rep("blue", 1), rep("red", 5), rep("black", 7), rep("white", 15))
#spheres3d(x, y, z, col=rainbow(1000))
spheres3d(x, y, z, col=atomcolor)
```

<canvas id="testgl2textureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** spheres object 25 ****** -->
<script id="testgl2vshader25" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec3 aNorm;
uniform mat4 normMatrix;
varying vec3 vNormal;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
vNormal = normalize((normMatrix * vec4(aNorm, 1.)).xyz);
}
</script>
<script id="testgl2fshader25" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec3 vNormal;
void main(void) {
vec3 eye = normalize(-vPosition.xyz);
const vec3 emission = vec3(0., 0., 0.);
const vec3 ambient1 = vec3(0., 0., 0.);
const vec3 specular1 = vec3(1., 1., 1.);// light*material
const float shininess1 = 50.;
vec4 colDiff1 = vec4(vCol.rgb * vec3(1., 1., 1.), vCol.a);
const vec3 lightDir1 = vec3(0., 0., 1.);
vec3 halfVec1 = normalize(lightDir1 + eye);
vec4 lighteffect = vec4(emission, 0.);
vec3 n = normalize(vNormal);
n = -faceforward(n, n, eye);
vec3 col1 = ambient1;
float nDotL1 = dot(n, lightDir1);
col1 = col1 + max(nDotL1, 0.) * colDiff1.rgb;
col1 = col1 + pow(max(dot(halfVec1, n), 0.), shininess1) * specular1;
lighteffect = lighteffect + vec4(col1, colDiff1.a);
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testgl2webGLStart() {
var debug = function(msg) {
document.getElementById("testgl2debug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testgl2canvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 19;
zoom[19] = 1;
fov[19] = 30;
userMatrix[19] = new CanvasMatrix4();
userMatrix[19].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgl2textureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
// ****** sphere object ******
var v=new Float32Array([
-1, 0, 0,
1, 0, 0,
0, -1, 0,
0, 1, 0,
0, 0, -1,
0, 0, 1,
-0.7071068, 0, -0.7071068,
-0.7071068, -0.7071068, 0,
0, -0.7071068, -0.7071068,
-0.7071068, 0, 0.7071068,
0, -0.7071068, 0.7071068,
-0.7071068, 0.7071068, 0,
0, 0.7071068, -0.7071068,
0, 0.7071068, 0.7071068,
0.7071068, -0.7071068, 0,
0.7071068, 0, -0.7071068,
0.7071068, 0, 0.7071068,
0.7071068, 0.7071068, 0,
-0.9349975, 0, -0.3546542,
-0.9349975, -0.3546542, 0,
-0.77044, -0.4507894, -0.4507894,
0, -0.3546542, -0.9349975,
-0.3546542, 0, -0.9349975,
-0.4507894, -0.4507894, -0.77044,
-0.3546542, -0.9349975, 0,
0, -0.9349975, -0.3546542,
-0.4507894, -0.77044, -0.4507894,
-0.9349975, 0, 0.3546542,
-0.77044, -0.4507894, 0.4507894,
0, -0.9349975, 0.3546542,
-0.4507894, -0.77044, 0.4507894,
-0.3546542, 0, 0.9349975,
0, -0.3546542, 0.9349975,
-0.4507894, -0.4507894, 0.77044,
-0.9349975, 0.3546542, 0,
-0.77044, 0.4507894, -0.4507894,
0, 0.9349975, -0.3546542,
-0.3546542, 0.9349975, 0,
-0.4507894, 0.77044, -0.4507894,
0, 0.3546542, -0.9349975,
-0.4507894, 0.4507894, -0.77044,
-0.77044, 0.4507894, 0.4507894,
0, 0.3546542, 0.9349975,
-0.4507894, 0.4507894, 0.77044,
0, 0.9349975, 0.3546542,
-0.4507894, 0.77044, 0.4507894,
0.9349975, -0.3546542, 0,
0.9349975, 0, -0.3546542,
0.77044, -0.4507894, -0.4507894,
0.3546542, -0.9349975, 0,
0.4507894, -0.77044, -0.4507894,
0.3546542, 0, -0.9349975,
0.4507894, -0.4507894, -0.77044,
0.9349975, 0, 0.3546542,
0.77044, -0.4507894, 0.4507894,
0.3546542, 0, 0.9349975,
0.4507894, -0.4507894, 0.77044,
0.4507894, -0.77044, 0.4507894,
0.9349975, 0.3546542, 0,
0.77044, 0.4507894, -0.4507894,
0.4507894, 0.4507894, -0.77044,
0.3546542, 0.9349975, 0,
0.4507894, 0.77044, -0.4507894,
0.77044, 0.4507894, 0.4507894,
0.4507894, 0.77044, 0.4507894,
0.4507894, 0.4507894, 0.77044
]);
var f=new Uint16Array([
0, 18, 19,
6, 20, 18,
7, 19, 20,
19, 18, 20,
4, 21, 22,
8, 23, 21,
6, 22, 23,
22, 21, 23,
2, 24, 25,
7, 26, 24,
8, 25, 26,
25, 24, 26,
7, 20, 26,
6, 23, 20,
8, 26, 23,
26, 20, 23,
0, 19, 27,
7, 28, 19,
9, 27, 28,
27, 19, 28,
2, 29, 24,
10, 30, 29,
7, 24, 30,
24, 29, 30,
5, 31, 32,
9, 33, 31,
10, 32, 33,
32, 31, 33,
9, 28, 33,
7, 30, 28,
10, 33, 30,
33, 28, 30,
0, 34, 18,
11, 35, 34,
6, 18, 35,
18, 34, 35,
3, 36, 37,
12, 38, 36,
11, 37, 38,
37, 36, 38,
4, 22, 39,
6, 40, 22,
12, 39, 40,
39, 22, 40,
6, 35, 40,
11, 38, 35,
12, 40, 38,
40, 35, 38,
0, 27, 34,
9, 41, 27,
11, 34, 41,
34, 27, 41,
5, 42, 31,
13, 43, 42,
9, 31, 43,
31, 42, 43,
3, 37, 44,
11, 45, 37,
13, 44, 45,
44, 37, 45,
11, 41, 45,
9, 43, 41,
13, 45, 43,
45, 41, 43,
1, 46, 47,
14, 48, 46,
15, 47, 48,
47, 46, 48,
2, 25, 49,
8, 50, 25,
14, 49, 50,
49, 25, 50,
4, 51, 21,
15, 52, 51,
8, 21, 52,
21, 51, 52,
15, 48, 52,
14, 50, 48,
8, 52, 50,
52, 48, 50,
1, 53, 46,
16, 54, 53,
14, 46, 54,
46, 53, 54,
5, 32, 55,
10, 56, 32,
16, 55, 56,
55, 32, 56,
2, 49, 29,
14, 57, 49,
10, 29, 57,
29, 49, 57,
14, 54, 57,
16, 56, 54,
10, 57, 56,
57, 54, 56,
1, 47, 58,
15, 59, 47,
17, 58, 59,
58, 47, 59,
4, 39, 51,
12, 60, 39,
15, 51, 60,
51, 39, 60,
3, 61, 36,
17, 62, 61,
12, 36, 62,
36, 61, 62,
17, 59, 62,
15, 60, 59,
12, 62, 60,
62, 59, 60,
1, 58, 53,
17, 63, 58,
16, 53, 63,
53, 58, 63,
3, 44, 61,
13, 64, 44,
17, 61, 64,
61, 44, 64,
5, 55, 42,
16, 65, 55,
13, 42, 65,
42, 55, 65,
16, 63, 65,
17, 64, 63,
13, 65, 64,
65, 63, 64
]);
var sphereBuf = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var sphereIbuf = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
// ****** spheres object 25 ******
var prog25  = gl.createProgram();
gl.attachShader(prog25, getShader( gl, "testgl2vshader25" ));
gl.attachShader(prog25, getShader( gl, "testgl2fshader25" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog25, 0, "aPos");
gl.bindAttribLocation(prog25, 1, "aCol");
gl.linkProgram(prog25);
var v=new Float32Array([
-4.259531, 0.6682253, -1.686531, 0, 0, 1, 1, 1,
-3.020391, -0.9574913, -1.291363, 1, 0, 0, 1, 1,
-2.958763, 0.9327829, 0.3994044, 1, 0, 0, 1, 1,
-2.918836, 0.01396903, 0.313254, 1, 0, 0, 1, 1,
-2.778629, 0.9594626, -4.214814, 1, 0, 0, 1, 1,
-2.533737, -1.658151, -1.226174, 1, 0, 0, 1, 1,
-2.496048, -0.6552382, -2.510781, 0, 0, 0, 1, 1,
-2.451282, -0.2797433, -3.05746, 0, 0, 0, 1, 1,
-2.426926, 0.1022048, -2.244715, 0, 0, 0, 1, 1,
-2.417959, -2.737361, -2.346704, 0, 0, 0, 1, 1,
-2.41015, -0.3354087, -0.07790615, 0, 0, 0, 1, 1,
-2.343188, 0.09385704, -2.160563, 0, 0, 0, 1, 1,
-2.307046, -0.5435919, -4.25338, 0, 0, 0, 1, 1,
-2.258981, 0.3505424, -1.0328, 1, 1, 1, 1, 1,
-2.244528, -2.26223, -2.277088, 1, 1, 1, 1, 1,
-2.243424, -0.07829683, -2.455034, 1, 1, 1, 1, 1,
-2.235412, 1.16121, -1.361247, 1, 1, 1, 1, 1,
-2.231565, -1.121819, -1.445843, 1, 1, 1, 1, 1,
-2.224607, -0.04141677, -1.30776, 1, 1, 1, 1, 1,
-2.067393, 0.6439219, -2.662626, 1, 1, 1, 1, 1,
-2.066717, -1.64473, -0.4991197, 1, 1, 1, 1, 1,
-2.056493, -0.6845499, -2.417099, 1, 1, 1, 1, 1,
-2.045355, 0.7366106, -2.010268, 1, 1, 1, 1, 1,
-2.005809, 1.280177, -1.938739, 1, 1, 1, 1, 1,
-2.000647, 0.06240025, -0.7642359, 1, 1, 1, 1, 1,
-1.984045, 1.714347, 0.4380721, 1, 1, 1, 1, 1,
-1.939492, 1.268632, -1.471657, 1, 1, 1, 1, 1,
-1.922937, 0.2305408, -0.5159482, 1, 1, 1, 1, 1,
-1.920275, 0.1511966, -0.7319615, 0, 0, 1, 1, 1,
-1.920169, -0.7362015, -1.786751, 1, 0, 0, 1, 1,
-1.904972, 0.2822385, -2.24206, 1, 0, 0, 1, 1,
-1.902823, -2.147043, -1.844734, 1, 0, 0, 1, 1,
-1.896778, -0.947937, -1.340977, 1, 0, 0, 1, 1,
-1.872263, -1.284151, -3.828932, 1, 0, 0, 1, 1,
-1.872169, 1.628343, -1.775289, 0, 0, 0, 1, 1,
-1.865222, 0.5396767, -1.706088, 0, 0, 0, 1, 1,
-1.854198, 2.465584, -0.5189338, 0, 0, 0, 1, 1,
-1.813382, 0.4611552, -3.435077, 0, 0, 0, 1, 1,
-1.81045, 0.1277634, -1.672474, 0, 0, 0, 1, 1,
-1.789505, -0.5993877, -3.766018, 0, 0, 0, 1, 1,
-1.786314, 1.246737, -0.8117953, 0, 0, 0, 1, 1,
-1.731213, 0.5465967, -1.968088, 1, 1, 1, 1, 1,
-1.726451, 1.433786, -1.396543, 1, 1, 1, 1, 1,
-1.725739, 0.7103376, -0.8168384, 1, 1, 1, 1, 1,
-1.724343, 0.7685829, -1.910933, 1, 1, 1, 1, 1,
-1.717626, -0.6399716, -3.11321, 1, 1, 1, 1, 1,
-1.704969, -0.272402, -2.514764, 1, 1, 1, 1, 1,
-1.677439, 0.1043843, -2.904689, 1, 1, 1, 1, 1,
-1.668039, 1.485989, 1.367199, 1, 1, 1, 1, 1,
-1.652674, -0.4849862, -1.801108, 1, 1, 1, 1, 1,
-1.651592, 1.875078, -1.531302, 1, 1, 1, 1, 1,
-1.65005, -0.3935861, -2.439688, 1, 1, 1, 1, 1,
-1.64289, 0.3200783, -1.237997, 1, 1, 1, 1, 1,
-1.640406, 0.6594154, -1.432307, 1, 1, 1, 1, 1,
-1.631096, -1.435835, -1.803838, 1, 1, 1, 1, 1,
-1.607923, 0.5615883, -1.738713, 1, 1, 1, 1, 1,
-1.601033, 1.347777, -2.632564, 0, 0, 1, 1, 1,
-1.598839, 0.7334021, -0.3013052, 1, 0, 0, 1, 1,
-1.59626, -1.441387, -1.476046, 1, 0, 0, 1, 1,
-1.595989, 0.6539033, -1.309638, 1, 0, 0, 1, 1,
-1.587436, 1.220222, -0.1812994, 1, 0, 0, 1, 1,
-1.576965, -1.417453, -1.34251, 1, 0, 0, 1, 1,
-1.566691, 0.1020265, -1.001407, 0, 0, 0, 1, 1,
-1.564465, -0.6534131, -0.9428554, 0, 0, 0, 1, 1,
-1.563802, -0.1211802, -1.010734, 0, 0, 0, 1, 1,
-1.561315, 0.8856713, -0.9079019, 0, 0, 0, 1, 1,
-1.515163, -0.002106995, -1.824976, 0, 0, 0, 1, 1,
-1.511593, 1.320451, -0.2340941, 0, 0, 0, 1, 1,
-1.497547, -0.4845378, 0.04579193, 0, 0, 0, 1, 1,
-1.495694, 1.007111, 1.069156, 1, 1, 1, 1, 1,
-1.492673, -1.1071, -1.582615, 1, 1, 1, 1, 1,
-1.488874, 1.536449, -0.6957112, 1, 1, 1, 1, 1,
-1.484068, 0.5386582, -1.538388, 1, 1, 1, 1, 1,
-1.480819, -0.5941522, -2.262189, 1, 1, 1, 1, 1,
-1.475468, -0.5899983, -2.187527, 1, 1, 1, 1, 1,
-1.474957, -0.7499635, -3.656793, 1, 1, 1, 1, 1,
-1.474654, -0.6064292, -1.99175, 1, 1, 1, 1, 1,
-1.469487, -0.1377277, -2.780548, 1, 1, 1, 1, 1,
-1.464723, 0.2216993, -0.5777765, 1, 1, 1, 1, 1,
-1.456417, -0.80229, -2.204183, 1, 1, 1, 1, 1,
-1.453928, -1.244711, -4.253508, 1, 1, 1, 1, 1,
-1.450155, 0.2232966, -0.4146568, 1, 1, 1, 1, 1,
-1.440241, 0.5064693, -0.2717468, 1, 1, 1, 1, 1,
-1.430468, 0.7380133, -0.4991796, 1, 1, 1, 1, 1,
-1.43022, 0.3119453, -2.951066, 0, 0, 1, 1, 1,
-1.426498, -0.9043773, -0.03923856, 1, 0, 0, 1, 1,
-1.419357, 0.2861592, -2.192538, 1, 0, 0, 1, 1,
-1.410372, 0.06423263, -3.716842, 1, 0, 0, 1, 1,
-1.40261, 0.2783856, -0.4563737, 1, 0, 0, 1, 1,
-1.400715, 1.285857, 0.6450308, 1, 0, 0, 1, 1,
-1.396943, 0.6544483, -1.336429, 0, 0, 0, 1, 1,
-1.391934, 0.3170611, -2.696767, 0, 0, 0, 1, 1,
-1.384365, -0.6204649, -3.010159, 0, 0, 0, 1, 1,
-1.381787, 0.1119529, -0.46104, 0, 0, 0, 1, 1,
-1.374567, 0.1916065, -1.626742, 0, 0, 0, 1, 1,
-1.368927, 0.6548983, -1.089023, 0, 0, 0, 1, 1,
-1.368116, -0.1059477, -2.396008, 0, 0, 0, 1, 1,
-1.363749, 0.08019145, -2.241981, 1, 1, 1, 1, 1,
-1.361961, -1.092324, -2.843071, 1, 1, 1, 1, 1,
-1.352448, -1.680599, -3.371955, 1, 1, 1, 1, 1,
-1.35157, -1.149036, -1.783054, 1, 1, 1, 1, 1,
-1.348894, -0.8499587, -0.3745003, 1, 1, 1, 1, 1,
-1.346537, 0.0398619, -0.9010642, 1, 1, 1, 1, 1,
-1.327532, 1.252788, 0.7364038, 1, 1, 1, 1, 1,
-1.325736, 1.141407, -1.538981, 1, 1, 1, 1, 1,
-1.32569, -0.8234055, -1.806874, 1, 1, 1, 1, 1,
-1.325264, -1.405103, -1.435899, 1, 1, 1, 1, 1,
-1.315945, 1.282071, -2.017885, 1, 1, 1, 1, 1,
-1.310033, -1.154176, -1.470452, 1, 1, 1, 1, 1,
-1.308474, -0.6209351, -1.297662, 1, 1, 1, 1, 1,
-1.29985, -0.3008722, -2.095972, 1, 1, 1, 1, 1,
-1.290417, -2.661872, -3.767466, 1, 1, 1, 1, 1,
-1.287466, 0.2543525, -2.073718, 0, 0, 1, 1, 1,
-1.286213, -0.07869837, -1.838631, 1, 0, 0, 1, 1,
-1.274425, -0.354378, -0.422065, 1, 0, 0, 1, 1,
-1.272348, 0.165225, -1.74295, 1, 0, 0, 1, 1,
-1.271517, 1.444495, -1.211094, 1, 0, 0, 1, 1,
-1.271401, -1.413015, -0.4701262, 1, 0, 0, 1, 1,
-1.265007, 0.05979674, -2.657735, 0, 0, 0, 1, 1,
-1.261291, -1.150907, -3.256723, 0, 0, 0, 1, 1,
-1.258006, 1.305348, 0.2540857, 0, 0, 0, 1, 1,
-1.25174, 0.5031695, -2.517723, 0, 0, 0, 1, 1,
-1.251452, -1.530661, -1.984756, 0, 0, 0, 1, 1,
-1.247158, 1.972694, 0.7984647, 0, 0, 0, 1, 1,
-1.247067, 1.577669, 1.180817, 0, 0, 0, 1, 1,
-1.241032, 0.4845646, -2.354536, 1, 1, 1, 1, 1,
-1.229162, -0.6698564, -2.196549, 1, 1, 1, 1, 1,
-1.229072, -0.2659539, -0.1950219, 1, 1, 1, 1, 1,
-1.226306, 0.4088995, -0.8929958, 1, 1, 1, 1, 1,
-1.225311, -1.766202, -2.90024, 1, 1, 1, 1, 1,
-1.22076, -0.8897719, -3.951897, 1, 1, 1, 1, 1,
-1.216716, 1.425993, -1.385268, 1, 1, 1, 1, 1,
-1.215561, -0.08789703, -2.394661, 1, 1, 1, 1, 1,
-1.209392, -0.1318534, 0.4102368, 1, 1, 1, 1, 1,
-1.207137, -1.578011, -3.739736, 1, 1, 1, 1, 1,
-1.199493, 1.26666, 0.355471, 1, 1, 1, 1, 1,
-1.197915, 0.2461434, 0.1047889, 1, 1, 1, 1, 1,
-1.192434, -0.1359325, -2.353537, 1, 1, 1, 1, 1,
-1.182874, 0.1231826, -0.802188, 1, 1, 1, 1, 1,
-1.182405, -0.6669456, -1.268248, 1, 1, 1, 1, 1,
-1.18019, 0.02053629, -1.42991, 0, 0, 1, 1, 1,
-1.1764, 0.6227171, -1.021502, 1, 0, 0, 1, 1,
-1.164672, -1.600175, -2.659171, 1, 0, 0, 1, 1,
-1.155192, -2.220273, -2.026322, 1, 0, 0, 1, 1,
-1.141792, 0.4589364, -1.382027, 1, 0, 0, 1, 1,
-1.130809, 0.7886491, 0.6358506, 1, 0, 0, 1, 1,
-1.128716, -0.03971629, -1.980356, 0, 0, 0, 1, 1,
-1.127417, -0.4968281, -2.515105, 0, 0, 0, 1, 1,
-1.126612, 2.152872, -0.5055159, 0, 0, 0, 1, 1,
-1.120428, 0.2879145, 0.3847627, 0, 0, 0, 1, 1,
-1.119887, 0.1513819, -0.11339, 0, 0, 0, 1, 1,
-1.116369, -0.3355589, -3.045532, 0, 0, 0, 1, 1,
-1.115093, 0.1565633, -2.48402, 0, 0, 0, 1, 1,
-1.11155, -1.038446, -2.748221, 1, 1, 1, 1, 1,
-1.101162, -1.752817, -2.760413, 1, 1, 1, 1, 1,
-1.097502, -0.4582919, -3.751113, 1, 1, 1, 1, 1,
-1.085542, 1.388524, -0.7743395, 1, 1, 1, 1, 1,
-1.079165, -0.03854895, -1.157066, 1, 1, 1, 1, 1,
-1.073839, -1.619048, -2.359078, 1, 1, 1, 1, 1,
-1.069819, -0.2321213, -3.384595, 1, 1, 1, 1, 1,
-1.069232, -0.6794682, -1.991853, 1, 1, 1, 1, 1,
-1.061598, 0.140679, -2.546497, 1, 1, 1, 1, 1,
-1.055794, 1.088477, -1.98892, 1, 1, 1, 1, 1,
-1.04857, 0.6044521, -0.4635383, 1, 1, 1, 1, 1,
-1.044994, 0.4966715, -0.6336888, 1, 1, 1, 1, 1,
-1.037541, 2.234376, -2.344615, 1, 1, 1, 1, 1,
-1.033852, 0.2142685, -1.011248, 1, 1, 1, 1, 1,
-1.026763, 1.445226, -1.274221, 1, 1, 1, 1, 1,
-1.024597, 0.01723544, -3.053735, 0, 0, 1, 1, 1,
-1.024083, 1.259594, -0.8349459, 1, 0, 0, 1, 1,
-1.023473, 0.3013442, 1.346203, 1, 0, 0, 1, 1,
-1.022318, 0.2797527, -1.938789, 1, 0, 0, 1, 1,
-1.012609, 0.1646758, -2.28674, 1, 0, 0, 1, 1,
-1.005688, 1.174229, -0.1404137, 1, 0, 0, 1, 1,
-1.004827, 0.9876796, -1.164077, 0, 0, 0, 1, 1,
-1.003454, 0.2776752, -1.843048, 0, 0, 0, 1, 1,
-1.001683, -0.7340428, -4.260474, 0, 0, 0, 1, 1,
-0.9881272, 0.3126798, 0.02273695, 0, 0, 0, 1, 1,
-0.9744743, -1.017063, -2.883202, 0, 0, 0, 1, 1,
-0.9705629, 0.2117182, -2.380167, 0, 0, 0, 1, 1,
-0.9700516, 0.09816075, -0.110942, 0, 0, 0, 1, 1,
-0.969844, -1.319469, -4.862054, 1, 1, 1, 1, 1,
-0.9647564, -0.9140893, -3.476249, 1, 1, 1, 1, 1,
-0.9629946, -0.5360818, -1.121336, 1, 1, 1, 1, 1,
-0.9621781, 0.5044193, 0.3278531, 1, 1, 1, 1, 1,
-0.96167, -2.074337, -1.962104, 1, 1, 1, 1, 1,
-0.9582381, 0.1431661, -2.693025, 1, 1, 1, 1, 1,
-0.9573213, 1.306468, -1.390919, 1, 1, 1, 1, 1,
-0.9563513, -0.1821888, -1.910929, 1, 1, 1, 1, 1,
-0.9524834, -1.503149, -1.370557, 1, 1, 1, 1, 1,
-0.9481781, -0.7149299, -1.76917, 1, 1, 1, 1, 1,
-0.94363, -0.9311549, -2.504297, 1, 1, 1, 1, 1,
-0.9406238, -0.4718858, 0.6435357, 1, 1, 1, 1, 1,
-0.9397626, 0.7932516, -0.2187218, 1, 1, 1, 1, 1,
-0.9390631, -1.986005, -0.9629487, 1, 1, 1, 1, 1,
-0.9377069, -1.47884, -3.993258, 1, 1, 1, 1, 1,
-0.9354723, 0.05287174, 0.2676558, 0, 0, 1, 1, 1,
-0.9272425, -0.2822677, -2.246974, 1, 0, 0, 1, 1,
-0.9075736, 0.2845011, -1.21739, 1, 0, 0, 1, 1,
-0.8976614, 0.009933365, -1.685828, 1, 0, 0, 1, 1,
-0.8896404, 1.046471, -1.010061, 1, 0, 0, 1, 1,
-0.8789734, 0.4008448, -2.602747, 1, 0, 0, 1, 1,
-0.8673054, 0.4623563, -1.058849, 0, 0, 0, 1, 1,
-0.8645964, 0.001320834, -0.5998871, 0, 0, 0, 1, 1,
-0.8630266, 0.8568618, -1.347216, 0, 0, 0, 1, 1,
-0.8594787, 1.697811, -1.169029, 0, 0, 0, 1, 1,
-0.8579437, 0.8972225, 1.152917, 0, 0, 0, 1, 1,
-0.8542611, -0.6848678, -2.597626, 0, 0, 0, 1, 1,
-0.8464502, -1.461528, -2.210208, 0, 0, 0, 1, 1,
-0.8457868, 0.1267116, -0.5131558, 1, 1, 1, 1, 1,
-0.8426688, -1.326837, -2.684609, 1, 1, 1, 1, 1,
-0.8415716, -1.466168, -2.664688, 1, 1, 1, 1, 1,
-0.8406486, 0.4999849, -0.03182726, 1, 1, 1, 1, 1,
-0.8402882, -1.66792, -2.361462, 1, 1, 1, 1, 1,
-0.8401366, 0.7975303, -1.455281, 1, 1, 1, 1, 1,
-0.8367107, 0.776184, -1.335008, 1, 1, 1, 1, 1,
-0.8331187, -0.4183719, -3.269585, 1, 1, 1, 1, 1,
-0.8238053, 1.456128, 0.106857, 1, 1, 1, 1, 1,
-0.8233948, -0.2951176, -2.724063, 1, 1, 1, 1, 1,
-0.8218725, -0.3288065, -2.330818, 1, 1, 1, 1, 1,
-0.8184955, 2.376653, -2.057783, 1, 1, 1, 1, 1,
-0.814262, -2.192364, -3.472989, 1, 1, 1, 1, 1,
-0.813629, -1.35829, 0.132942, 1, 1, 1, 1, 1,
-0.811614, 0.7159347, -0.9854459, 1, 1, 1, 1, 1,
-0.8106424, -2.173282, -1.257728, 0, 0, 1, 1, 1,
-0.8098664, 0.336484, -0.4842671, 1, 0, 0, 1, 1,
-0.8035927, 0.4453218, -0.09030014, 1, 0, 0, 1, 1,
-0.7960762, 0.6761852, -0.01967658, 1, 0, 0, 1, 1,
-0.7959083, -1.910477, -0.9937216, 1, 0, 0, 1, 1,
-0.7956061, 0.5365968, -0.7520566, 1, 0, 0, 1, 1,
-0.7842834, 1.005376, -1.798153, 0, 0, 0, 1, 1,
-0.7837102, 1.088726, 0.03812684, 0, 0, 0, 1, 1,
-0.7777839, -1.414354, -2.032681, 0, 0, 0, 1, 1,
-0.7757294, -0.9619099, -2.4858, 0, 0, 0, 1, 1,
-0.7693411, 1.319355, -1.393688, 0, 0, 0, 1, 1,
-0.7631018, -0.6779459, -0.1771915, 0, 0, 0, 1, 1,
-0.7575209, -1.882594, -3.204234, 0, 0, 0, 1, 1,
-0.7460403, -0.7621115, -1.027761, 1, 1, 1, 1, 1,
-0.745275, 0.21552, -1.385271, 1, 1, 1, 1, 1,
-0.7420861, 1.626195, -0.1944639, 1, 1, 1, 1, 1,
-0.7407579, -0.01237706, -1.106069, 1, 1, 1, 1, 1,
-0.7380836, -1.089212, -2.189629, 1, 1, 1, 1, 1,
-0.7291338, 0.6145953, -1.416855, 1, 1, 1, 1, 1,
-0.7252032, 1.132919, -1.588723, 1, 1, 1, 1, 1,
-0.7209045, -1.079756, -3.205535, 1, 1, 1, 1, 1,
-0.7191509, -2.426144, -3.620218, 1, 1, 1, 1, 1,
-0.712329, 0.6367323, -1.165509, 1, 1, 1, 1, 1,
-0.7100847, 0.9577751, -2.47359, 1, 1, 1, 1, 1,
-0.7095951, 0.2318923, 0.2900088, 1, 1, 1, 1, 1,
-0.7073129, -0.1671983, -2.222718, 1, 1, 1, 1, 1,
-0.7072302, -0.1163843, -1.50377, 1, 1, 1, 1, 1,
-0.7060002, -1.465854, -3.832701, 1, 1, 1, 1, 1,
-0.7031679, -0.4927073, -1.404286, 0, 0, 1, 1, 1,
-0.7021474, 1.710604, 0.5426032, 1, 0, 0, 1, 1,
-0.701846, -0.6582282, -1.537079, 1, 0, 0, 1, 1,
-0.6963412, 2.502277, -0.1666932, 1, 0, 0, 1, 1,
-0.6937481, -0.8242126, -1.714051, 1, 0, 0, 1, 1,
-0.681571, 0.383748, -1.629689, 1, 0, 0, 1, 1,
-0.6791967, -1.010272, -2.032202, 0, 0, 0, 1, 1,
-0.6757996, -1.232152, -2.623463, 0, 0, 0, 1, 1,
-0.6743186, -0.581986, -0.8622594, 0, 0, 0, 1, 1,
-0.6734431, 0.818494, 0.0471591, 0, 0, 0, 1, 1,
-0.6730604, 2.566875, -0.983986, 0, 0, 0, 1, 1,
-0.6725119, -0.7532749, -2.334874, 0, 0, 0, 1, 1,
-0.666935, 0.4973016, -1.436904, 0, 0, 0, 1, 1,
-0.6600825, 0.116822, 0.1711749, 1, 1, 1, 1, 1,
-0.6568798, 1.134795, -0.1210452, 1, 1, 1, 1, 1,
-0.6546046, -0.2674864, -2.612789, 1, 1, 1, 1, 1,
-0.6541604, -1.303833, -1.630394, 1, 1, 1, 1, 1,
-0.6492906, 1.799471, -1.930488, 1, 1, 1, 1, 1,
-0.6440238, 1.498, -2.237914, 1, 1, 1, 1, 1,
-0.6431907, 0.4454996, -1.651947, 1, 1, 1, 1, 1,
-0.6370569, -0.2763523, -1.137896, 1, 1, 1, 1, 1,
-0.6328306, 0.6508973, 0.3745062, 1, 1, 1, 1, 1,
-0.6296331, 1.459417, -2.930505, 1, 1, 1, 1, 1,
-0.6272023, -0.6153761, -2.533594, 1, 1, 1, 1, 1,
-0.6249689, 0.08573692, -1.599247, 1, 1, 1, 1, 1,
-0.6227114, 1.038805, -0.7876882, 1, 1, 1, 1, 1,
-0.6226045, 1.020975, -0.8603252, 1, 1, 1, 1, 1,
-0.6181301, -0.9484175, -3.850826, 1, 1, 1, 1, 1,
-0.6164045, 0.7123196, -2.026078, 0, 0, 1, 1, 1,
-0.6140824, -1.783626, -2.740341, 1, 0, 0, 1, 1,
-0.6048774, 0.2528741, -2.646647, 1, 0, 0, 1, 1,
-0.6039988, 0.7747151, -0.5585262, 1, 0, 0, 1, 1,
-0.6000966, -1.100506, -3.027267, 1, 0, 0, 1, 1,
-0.5994607, -0.4401693, -2.482901, 1, 0, 0, 1, 1,
-0.5981422, -0.1207056, -2.531229, 0, 0, 0, 1, 1,
-0.5974489, 0.3979555, -1.973969, 0, 0, 0, 1, 1,
-0.5948, 0.3722982, -2.289105, 0, 0, 0, 1, 1,
-0.5917311, -0.4673654, -2.050985, 0, 0, 0, 1, 1,
-0.5913317, 0.1113959, -1.979506, 0, 0, 0, 1, 1,
-0.5894666, 0.4839053, -1.763852, 0, 0, 0, 1, 1,
-0.5850902, 0.1573843, -1.57415, 0, 0, 0, 1, 1,
-0.5789217, -0.1214276, -4.894319, 1, 1, 1, 1, 1,
-0.575478, 1.932528, -0.5424875, 1, 1, 1, 1, 1,
-0.5705182, -0.6614352, -0.1411377, 1, 1, 1, 1, 1,
-0.5609342, 0.7598358, -0.9735833, 1, 1, 1, 1, 1,
-0.5600974, 1.111427, -0.564674, 1, 1, 1, 1, 1,
-0.5597705, -0.08302236, -2.035551, 1, 1, 1, 1, 1,
-0.555805, 2.16747, -0.1033097, 1, 1, 1, 1, 1,
-0.5512935, 0.6447595, -1.772509, 1, 1, 1, 1, 1,
-0.5509641, 0.055538, -1.523345, 1, 1, 1, 1, 1,
-0.5483795, 1.879119, 0.2054966, 1, 1, 1, 1, 1,
-0.5481932, 1.880801, 1.025183, 1, 1, 1, 1, 1,
-0.5476251, 1.242676, -0.7664059, 1, 1, 1, 1, 1,
-0.5469384, 0.03488863, -0.278032, 1, 1, 1, 1, 1,
-0.5455028, 0.3047517, -2.40553, 1, 1, 1, 1, 1,
-0.5450691, -0.3474778, -1.844155, 1, 1, 1, 1, 1,
-0.5444434, 0.01042017, -0.9748322, 0, 0, 1, 1, 1,
-0.5434018, 1.841113, 0.1745542, 1, 0, 0, 1, 1,
-0.5388288, -0.2292369, -0.5028217, 1, 0, 0, 1, 1,
-0.5385312, -0.3900034, -3.77693, 1, 0, 0, 1, 1,
-0.5379807, 0.6048851, -1.182425, 1, 0, 0, 1, 1,
-0.5360225, -0.1310779, -0.4330594, 1, 0, 0, 1, 1,
-0.5327355, 0.3271592, -1.250318, 0, 0, 0, 1, 1,
-0.525963, 2.082069, 0.03432054, 0, 0, 0, 1, 1,
-0.5256248, -1.154362, -3.542438, 0, 0, 0, 1, 1,
-0.5165672, -0.9643664, -3.617826, 0, 0, 0, 1, 1,
-0.5164835, 0.4422883, -0.6863299, 0, 0, 0, 1, 1,
-0.5121956, -1.049859, -4.972071, 0, 0, 0, 1, 1,
-0.5099653, 1.433762, 0.2942755, 0, 0, 0, 1, 1,
-0.5075862, 0.2132979, -1.225123, 1, 1, 1, 1, 1,
-0.5073085, -0.700056, -3.113461, 1, 1, 1, 1, 1,
-0.5014465, -0.9569471, -1.658685, 1, 1, 1, 1, 1,
-0.4921425, -1.187552, -2.764186, 1, 1, 1, 1, 1,
-0.4911081, 1.56247, -0.8079134, 1, 1, 1, 1, 1,
-0.4833897, 1.04304, -1.221901, 1, 1, 1, 1, 1,
-0.4806706, -0.9406786, -1.1516, 1, 1, 1, 1, 1,
-0.4772651, -1.386723, -3.945213, 1, 1, 1, 1, 1,
-0.4721314, 0.950452, 0.4484663, 1, 1, 1, 1, 1,
-0.4698525, 1.130642, -0.5024996, 1, 1, 1, 1, 1,
-0.4695867, 1.007667, 1.979969, 1, 1, 1, 1, 1,
-0.4648169, 0.1900432, 0.214792, 1, 1, 1, 1, 1,
-0.4612783, -1.126047, -2.284204, 1, 1, 1, 1, 1,
-0.4582823, -0.5554345, -2.435506, 1, 1, 1, 1, 1,
-0.4543146, 1.604599, -0.6928241, 1, 1, 1, 1, 1,
-0.4463867, 1.256135, 0.1353303, 0, 0, 1, 1, 1,
-0.441861, -0.2225766, -1.073431, 1, 0, 0, 1, 1,
-0.4414278, 0.6978216, 1.645726, 1, 0, 0, 1, 1,
-0.4401291, -1.207387, -5.024583, 1, 0, 0, 1, 1,
-0.4392963, 2.537902, 0.2666892, 1, 0, 0, 1, 1,
-0.4391998, -2.468824, -2.189794, 1, 0, 0, 1, 1,
-0.4338487, 0.2990051, 0.491917, 0, 0, 0, 1, 1,
-0.4315102, 0.4248488, -1.153438, 0, 0, 0, 1, 1,
-0.4295258, 0.1267796, -1.46903, 0, 0, 0, 1, 1,
-0.4251992, 0.1039657, -1.783257, 0, 0, 0, 1, 1,
-0.4241207, 0.04301174, -2.099976, 0, 0, 0, 1, 1,
-0.4157445, -0.4602482, -1.403246, 0, 0, 0, 1, 1,
-0.4109496, 0.1048561, -2.251894, 0, 0, 0, 1, 1,
-0.4108669, -0.7612206, -5.010688, 1, 1, 1, 1, 1,
-0.4022688, 0.7990876, -0.07053875, 1, 1, 1, 1, 1,
-0.4022262, -0.2547955, -3.708964, 1, 1, 1, 1, 1,
-0.4007779, 0.589221, -0.3873926, 1, 1, 1, 1, 1,
-0.4004881, 1.355885, -0.9482715, 1, 1, 1, 1, 1,
-0.3908765, 0.6566913, -2.068867, 1, 1, 1, 1, 1,
-0.3745138, 1.252942, 0.2441637, 1, 1, 1, 1, 1,
-0.3713507, -0.5395783, -2.633691, 1, 1, 1, 1, 1,
-0.3676171, -1.412056, -2.029852, 1, 1, 1, 1, 1,
-0.3629934, 0.7276745, -0.5309818, 1, 1, 1, 1, 1,
-0.3571668, -0.8179359, -2.875261, 1, 1, 1, 1, 1,
-0.3568043, -0.6072119, -2.167036, 1, 1, 1, 1, 1,
-0.3545496, 1.468089, 2.211464, 1, 1, 1, 1, 1,
-0.3530149, -0.1118128, -2.053032, 1, 1, 1, 1, 1,
-0.3505926, 0.5820466, -0.06427847, 1, 1, 1, 1, 1,
-0.349771, -0.8269227, -3.790328, 0, 0, 1, 1, 1,
-0.3469366, 1.873935, -1.594532, 1, 0, 0, 1, 1,
-0.3465388, -2.198685, -3.148397, 1, 0, 0, 1, 1,
-0.3463704, 0.06948589, -1.414718, 1, 0, 0, 1, 1,
-0.3461278, -0.815743, -2.570855, 1, 0, 0, 1, 1,
-0.3379431, -0.9161604, -2.300883, 1, 0, 0, 1, 1,
-0.3378322, 1.257435, -0.947635, 0, 0, 0, 1, 1,
-0.3358266, 1.093096, -1.62048, 0, 0, 0, 1, 1,
-0.3337192, -1.437115, -2.692973, 0, 0, 0, 1, 1,
-0.3273061, 0.01897002, -1.330147, 0, 0, 0, 1, 1,
-0.3270952, 0.01913247, -1.750612, 0, 0, 0, 1, 1,
-0.3257162, 0.1396383, -1.479919, 0, 0, 0, 1, 1,
-0.324532, 0.02756953, -2.743729, 0, 0, 0, 1, 1,
-0.3231717, -0.7352406, -1.535786, 1, 1, 1, 1, 1,
-0.3205622, 0.1817961, 0.5167754, 1, 1, 1, 1, 1,
-0.3201447, -0.3364078, -3.36085, 1, 1, 1, 1, 1,
-0.3183815, 1.803401, 1.006749, 1, 1, 1, 1, 1,
-0.3146732, 0.3028563, -0.06961711, 1, 1, 1, 1, 1,
-0.3065962, -0.8763575, -3.366344, 1, 1, 1, 1, 1,
-0.3061536, -0.7319099, -3.241203, 1, 1, 1, 1, 1,
-0.3036061, -1.176874, -3.931235, 1, 1, 1, 1, 1,
-0.3007432, -0.3325681, -2.660442, 1, 1, 1, 1, 1,
-0.2986852, -1.285433, -3.115737, 1, 1, 1, 1, 1,
-0.2979593, 0.4146528, -1.415706, 1, 1, 1, 1, 1,
-0.2976164, -1.485591, -2.305618, 1, 1, 1, 1, 1,
-0.2923429, 0.5809477, -2.069531, 1, 1, 1, 1, 1,
-0.2845613, 0.2088874, 0.182402, 1, 1, 1, 1, 1,
-0.2826077, -2.224753, -4.425292, 1, 1, 1, 1, 1,
-0.2813953, 0.3120951, -0.3613455, 0, 0, 1, 1, 1,
-0.2785967, -1.738139, -2.953086, 1, 0, 0, 1, 1,
-0.2765167, -0.7101771, -3.815444, 1, 0, 0, 1, 1,
-0.2763717, -0.02284393, -2.446146, 1, 0, 0, 1, 1,
-0.2724215, -0.6511387, -1.904783, 1, 0, 0, 1, 1,
-0.2704966, 1.403067, 0.1019639, 1, 0, 0, 1, 1,
-0.2699073, 0.8487393, -1.355853, 0, 0, 0, 1, 1,
-0.2694579, -2.894253, -1.681639, 0, 0, 0, 1, 1,
-0.267386, 0.1974113, -2.960163, 0, 0, 0, 1, 1,
-0.2672407, -0.7896078, -3.979806, 0, 0, 0, 1, 1,
-0.2603949, -0.4085486, -2.383089, 0, 0, 0, 1, 1,
-0.2488612, 0.4092422, 0.1475073, 0, 0, 0, 1, 1,
-0.2486002, 1.935648, 0.05538854, 0, 0, 0, 1, 1,
-0.248456, -1.335701, -2.299673, 1, 1, 1, 1, 1,
-0.2472152, 0.8092539, 0.2820289, 1, 1, 1, 1, 1,
-0.2445354, -1.473368, -2.434342, 1, 1, 1, 1, 1,
-0.2433786, -0.1077776, -0.908078, 1, 1, 1, 1, 1,
-0.2415092, 0.6836994, -0.4968702, 1, 1, 1, 1, 1,
-0.2346315, 1.533242, 0.2628662, 1, 1, 1, 1, 1,
-0.2342542, -1.812755, -3.597047, 1, 1, 1, 1, 1,
-0.2204204, 0.9458505, 0.50594, 1, 1, 1, 1, 1,
-0.2149125, 0.7765675, -0.8537259, 1, 1, 1, 1, 1,
-0.2139705, -0.1700232, -3.792799, 1, 1, 1, 1, 1,
-0.2105375, -1.620472, -2.057275, 1, 1, 1, 1, 1,
-0.2084026, -0.9189534, -2.818635, 1, 1, 1, 1, 1,
-0.2055887, -0.05902797, -0.9877094, 1, 1, 1, 1, 1,
-0.2021677, 0.1794298, 0.8353533, 1, 1, 1, 1, 1,
-0.1989244, 1.274579, 0.3617149, 1, 1, 1, 1, 1,
-0.196844, 0.7326877, -1.059886, 0, 0, 1, 1, 1,
-0.1901124, 0.5514204, -0.4337218, 1, 0, 0, 1, 1,
-0.1896132, -0.1353336, -1.385947, 1, 0, 0, 1, 1,
-0.1889909, -1.092025, -3.624012, 1, 0, 0, 1, 1,
-0.1884951, -1.2325, -3.407583, 1, 0, 0, 1, 1,
-0.1863218, 1.379146, -0.5481787, 1, 0, 0, 1, 1,
-0.1855984, 1.018214, -0.0219104, 0, 0, 0, 1, 1,
-0.1852748, 0.7746388, 0.0965319, 0, 0, 0, 1, 1,
-0.1839572, 1.538231, -0.3629923, 0, 0, 0, 1, 1,
-0.1828667, -0.9178351, -1.835343, 0, 0, 0, 1, 1,
-0.1816281, 2.028515, -0.1031502, 0, 0, 0, 1, 1,
-0.1785949, 0.613294, 0.9830011, 0, 0, 0, 1, 1,
-0.1757653, -1.024286, -3.837177, 0, 0, 0, 1, 1,
-0.1755152, 0.7446593, 0.05663744, 1, 1, 1, 1, 1,
-0.1747909, 0.3658045, -1.04706, 1, 1, 1, 1, 1,
-0.1731942, -1.123793, -2.547139, 1, 1, 1, 1, 1,
-0.1698718, -0.8437058, -3.113457, 1, 1, 1, 1, 1,
-0.1694569, -0.1288674, -2.599587, 1, 1, 1, 1, 1,
-0.1654062, -1.032399, -2.11034, 1, 1, 1, 1, 1,
-0.1638495, 0.05247348, -0.4677359, 1, 1, 1, 1, 1,
-0.1637941, 0.2661207, 0.3327968, 1, 1, 1, 1, 1,
-0.1632954, -0.7121431, -2.548826, 1, 1, 1, 1, 1,
-0.162203, -0.3657256, -1.97406, 1, 1, 1, 1, 1,
-0.1618878, -0.9172474, -3.18184, 1, 1, 1, 1, 1,
-0.1580781, -1.559176, -3.398394, 1, 1, 1, 1, 1,
-0.1577983, -1.045273, -4.507112, 1, 1, 1, 1, 1,
-0.1550243, 1.112071, 0.856014, 1, 1, 1, 1, 1,
-0.1526108, 0.401264, 0.5950347, 1, 1, 1, 1, 1,
-0.1496798, 0.7565799, 0.5518976, 0, 0, 1, 1, 1,
-0.1492513, -0.4156151, -2.883588, 1, 0, 0, 1, 1,
-0.1446324, -1.648858, -4.130725, 1, 0, 0, 1, 1,
-0.1425639, 0.2517234, 0.2420618, 1, 0, 0, 1, 1,
-0.1414758, 0.08672893, 0.7907096, 1, 0, 0, 1, 1,
-0.1392555, -1.303004, -1.574551, 1, 0, 0, 1, 1,
-0.1390987, 1.097403, 0.6708729, 0, 0, 0, 1, 1,
-0.1384897, -0.3698207, -2.914524, 0, 0, 0, 1, 1,
-0.1369068, 0.8349056, -0.8731682, 0, 0, 0, 1, 1,
-0.1343529, -0.7525923, -1.762358, 0, 0, 0, 1, 1,
-0.1326446, -0.86392, -3.537139, 0, 0, 0, 1, 1,
-0.1286019, -2.25313, -2.129898, 0, 0, 0, 1, 1,
-0.1273358, 1.018508, -0.05958674, 0, 0, 0, 1, 1,
-0.1240201, -1.350258, -3.315561, 1, 1, 1, 1, 1,
-0.1235081, 0.1742935, -0.2800154, 1, 1, 1, 1, 1,
-0.1182192, 0.3212492, 0.9186435, 1, 1, 1, 1, 1,
-0.1145385, -0.9927707, -3.976925, 1, 1, 1, 1, 1,
-0.1093843, 0.7311825, -0.6732551, 1, 1, 1, 1, 1,
-0.1015068, 1.748415, -1.592614, 1, 1, 1, 1, 1,
-0.1009497, -0.9648988, -5.153968, 1, 1, 1, 1, 1,
-0.09979697, -1.001541, -3.74052, 1, 1, 1, 1, 1,
-0.09638498, 0.9461294, 0.3861859, 1, 1, 1, 1, 1,
-0.09559018, 1.88207, -1.309233, 1, 1, 1, 1, 1,
-0.09540845, -2.672185, -2.785016, 1, 1, 1, 1, 1,
-0.09372835, -0.8180492, -4.644141, 1, 1, 1, 1, 1,
-0.09073329, -0.206178, -3.569468, 1, 1, 1, 1, 1,
-0.08961254, -0.5539504, -2.652224, 1, 1, 1, 1, 1,
-0.08886001, 0.3456325, -0.9208586, 1, 1, 1, 1, 1,
-0.08853008, -0.3430996, -2.366484, 0, 0, 1, 1, 1,
-0.08771202, -0.4572104, -4.45733, 1, 0, 0, 1, 1,
-0.0816576, -0.5207127, -3.547679, 1, 0, 0, 1, 1,
-0.08093506, -0.8586792, -3.671096, 1, 0, 0, 1, 1,
-0.08079963, 1.402646, 0.7579929, 1, 0, 0, 1, 1,
-0.07707106, 0.5350735, 1.218401, 1, 0, 0, 1, 1,
-0.07654056, 0.9292651, 0.5246969, 0, 0, 0, 1, 1,
-0.0693979, 0.5766343, -1.156121, 0, 0, 0, 1, 1,
-0.06441385, -0.01879136, -1.398627, 0, 0, 0, 1, 1,
-0.05547016, -0.3185716, -3.18483, 0, 0, 0, 1, 1,
-0.05289811, -0.5661814, -2.062534, 0, 0, 0, 1, 1,
-0.05220293, 0.4205629, -0.5997077, 0, 0, 0, 1, 1,
-0.05184521, 0.9822745, 0.7374611, 0, 0, 0, 1, 1,
-0.047937, 1.806466, -0.08380169, 1, 1, 1, 1, 1,
-0.03990785, 1.281887, -1.259441, 1, 1, 1, 1, 1,
-0.03670381, -0.961607, -3.066012, 1, 1, 1, 1, 1,
-0.02954171, -0.7331336, -3.509038, 1, 1, 1, 1, 1,
-0.02813015, 0.2070241, -0.3213237, 1, 1, 1, 1, 1,
-0.02524186, 0.5148127, 0.04218898, 1, 1, 1, 1, 1,
-0.0250258, -0.5145267, -1.492373, 1, 1, 1, 1, 1,
-0.02426909, -0.1440643, -3.751967, 1, 1, 1, 1, 1,
-0.02132704, -0.2034845, -2.624371, 1, 1, 1, 1, 1,
-0.01955978, 0.5903878, 0.3774883, 1, 1, 1, 1, 1,
-0.01759719, -0.5399638, -2.765563, 1, 1, 1, 1, 1,
-0.0170833, -0.6644775, -2.892874, 1, 1, 1, 1, 1,
-0.01584524, -0.7199399, -4.304767, 1, 1, 1, 1, 1,
-0.005894639, -0.2065467, -2.586641, 1, 1, 1, 1, 1,
-0.004120854, -1.885644, -2.102134, 1, 1, 1, 1, 1,
-0.001399934, 0.6067843, -0.2100348, 0, 0, 1, 1, 1,
0.006037803, 1.156522, 1.232094, 1, 0, 0, 1, 1,
0.01073451, 0.2554111, 1.417067, 1, 0, 0, 1, 1,
0.01680871, -2.288021, 1.979125, 1, 0, 0, 1, 1,
0.01823504, -0.9362612, 2.344458, 1, 0, 0, 1, 1,
0.0216683, -0.6441724, 3.733111, 1, 0, 0, 1, 1,
0.0232038, -1.159859, 2.882739, 0, 0, 0, 1, 1,
0.02671149, 0.7954582, -0.5241627, 0, 0, 0, 1, 1,
0.02721572, -0.7305481, 3.001869, 0, 0, 0, 1, 1,
0.02751198, 0.2019515, 0.05226468, 0, 0, 0, 1, 1,
0.03002153, -0.4422434, 3.104453, 0, 0, 0, 1, 1,
0.03378019, 1.477446, 0.1763631, 0, 0, 0, 1, 1,
0.03513451, -0.7358294, 3.248637, 0, 0, 0, 1, 1,
0.03809146, -0.1850316, 3.32508, 1, 1, 1, 1, 1,
0.0428682, 0.2835308, -1.791622, 1, 1, 1, 1, 1,
0.04361427, 0.566402, -0.1046991, 1, 1, 1, 1, 1,
0.04539226, -0.5043685, 3.367984, 1, 1, 1, 1, 1,
0.04550719, -0.5086784, 2.953007, 1, 1, 1, 1, 1,
0.04720227, 0.9176295, -0.3138289, 1, 1, 1, 1, 1,
0.04762351, -0.1056018, 2.179355, 1, 1, 1, 1, 1,
0.04843624, -2.124076, 3.319849, 1, 1, 1, 1, 1,
0.05086114, 0.7746304, -0.6865846, 1, 1, 1, 1, 1,
0.05131477, -0.5827054, 2.559317, 1, 1, 1, 1, 1,
0.05573435, -1.586904, 4.335535, 1, 1, 1, 1, 1,
0.06281073, 0.9041696, -0.2043383, 1, 1, 1, 1, 1,
0.06378156, 0.4633539, 0.3003792, 1, 1, 1, 1, 1,
0.07044301, 0.4163059, -0.02134223, 1, 1, 1, 1, 1,
0.07343257, 0.1992535, 1.62846, 1, 1, 1, 1, 1,
0.07548073, -0.06493478, 2.313729, 0, 0, 1, 1, 1,
0.07642174, -0.8050024, 4.48372, 1, 0, 0, 1, 1,
0.07646731, -0.3207488, 2.644077, 1, 0, 0, 1, 1,
0.07659879, -0.6815298, 3.828056, 1, 0, 0, 1, 1,
0.07687152, 1.146242, 2.140469, 1, 0, 0, 1, 1,
0.07734121, -0.988843, 3.35481, 1, 0, 0, 1, 1,
0.07934421, -2.610497, 1.508533, 0, 0, 0, 1, 1,
0.08548001, 0.3833392, -0.2383885, 0, 0, 0, 1, 1,
0.09365691, 0.722253, 0.6514644, 0, 0, 0, 1, 1,
0.09423622, 0.5287549, 0.8085245, 0, 0, 0, 1, 1,
0.09689306, 0.4683738, 1.07688, 0, 0, 0, 1, 1,
0.09782033, -1.114028, 2.601415, 0, 0, 0, 1, 1,
0.1000311, -0.1509782, 3.308633, 0, 0, 0, 1, 1,
0.1030201, -1.467976, 2.914668, 1, 1, 1, 1, 1,
0.1050637, -0.6915292, 2.085679, 1, 1, 1, 1, 1,
0.1057385, 0.2120562, 0.321212, 1, 1, 1, 1, 1,
0.1064417, -0.1952794, 2.927137, 1, 1, 1, 1, 1,
0.109594, -1.245117, 1.713595, 1, 1, 1, 1, 1,
0.1102538, 0.05360413, 1.442339, 1, 1, 1, 1, 1,
0.1147754, 0.8497069, 1.055856, 1, 1, 1, 1, 1,
0.1147786, -0.9252925, 3.474308, 1, 1, 1, 1, 1,
0.1200439, -0.62445, 2.909755, 1, 1, 1, 1, 1,
0.1216923, -0.945952, 3.341656, 1, 1, 1, 1, 1,
0.1256723, -0.3127409, 3.187066, 1, 1, 1, 1, 1,
0.12629, 0.1107026, -0.04615924, 1, 1, 1, 1, 1,
0.1272145, 1.132134, -1.003893, 1, 1, 1, 1, 1,
0.1305555, 1.298695, 1.58535, 1, 1, 1, 1, 1,
0.131415, -0.04875483, 1.656905, 1, 1, 1, 1, 1,
0.1332556, -0.8017005, 2.738765, 0, 0, 1, 1, 1,
0.1336002, -0.04159125, 2.53487, 1, 0, 0, 1, 1,
0.1343001, -0.9805162, 4.355754, 1, 0, 0, 1, 1,
0.1347, -1.186464, 3.318567, 1, 0, 0, 1, 1,
0.1350242, -0.3143671, 2.852871, 1, 0, 0, 1, 1,
0.1364634, 0.4372614, 0.3478132, 1, 0, 0, 1, 1,
0.1367586, 1.391072, -1.205025, 0, 0, 0, 1, 1,
0.1428351, -0.1975825, 2.914821, 0, 0, 0, 1, 1,
0.1433002, 1.351023, 0.4157626, 0, 0, 0, 1, 1,
0.1484113, 0.7647119, 2.373832, 0, 0, 0, 1, 1,
0.1490653, 1.802986, 0.9390539, 0, 0, 0, 1, 1,
0.1516268, 0.9398269, 0.1905385, 0, 0, 0, 1, 1,
0.1539411, -0.3961878, 3.973006, 0, 0, 0, 1, 1,
0.1623074, 1.200582, 0.2754958, 1, 1, 1, 1, 1,
0.1645266, -1.727758, 2.244791, 1, 1, 1, 1, 1,
0.1650458, 1.111042, -0.823501, 1, 1, 1, 1, 1,
0.1699171, -0.2360152, 2.000853, 1, 1, 1, 1, 1,
0.1701012, -0.9512185, 2.737757, 1, 1, 1, 1, 1,
0.1707976, -0.8575345, 1.390178, 1, 1, 1, 1, 1,
0.1712802, 0.3152632, 1.102097, 1, 1, 1, 1, 1,
0.1731396, 0.4686481, 1.565539, 1, 1, 1, 1, 1,
0.1763676, -0.008142914, 4.140248, 1, 1, 1, 1, 1,
0.1785643, -0.8196784, 2.179653, 1, 1, 1, 1, 1,
0.1855405, 0.1173779, 1.36523, 1, 1, 1, 1, 1,
0.1882199, 0.1684762, -0.9623487, 1, 1, 1, 1, 1,
0.1883126, -0.1772763, 1.292043, 1, 1, 1, 1, 1,
0.1884016, -0.1638671, 2.158157, 1, 1, 1, 1, 1,
0.1897103, 0.2681428, 1.19861, 1, 1, 1, 1, 1,
0.1906218, 1.200374, 0.8875156, 0, 0, 1, 1, 1,
0.1935546, 0.4538212, -2.175818, 1, 0, 0, 1, 1,
0.1956414, -0.01749897, 1.500713, 1, 0, 0, 1, 1,
0.1962707, 1.79185, 1.301137, 1, 0, 0, 1, 1,
0.1995804, -0.2111721, 1.074896, 1, 0, 0, 1, 1,
0.2027321, -0.1036664, 1.619089, 1, 0, 0, 1, 1,
0.2032572, 1.139762, -0.5665677, 0, 0, 0, 1, 1,
0.2068328, 1.546569, -0.7375342, 0, 0, 0, 1, 1,
0.2214389, -2.013636, 5.003679, 0, 0, 0, 1, 1,
0.2239977, -0.8655486, 2.17727, 0, 0, 0, 1, 1,
0.2300805, -0.6718058, 2.358106, 0, 0, 0, 1, 1,
0.2309117, -0.09313857, 2.464828, 0, 0, 0, 1, 1,
0.2392769, 0.7512664, 1.653807, 0, 0, 0, 1, 1,
0.2395043, -1.271626, 0.6706876, 1, 1, 1, 1, 1,
0.2403552, -0.4104636, 3.862566, 1, 1, 1, 1, 1,
0.2415757, -0.8991736, 2.884994, 1, 1, 1, 1, 1,
0.2430595, -0.6649869, 2.754099, 1, 1, 1, 1, 1,
0.2471317, -1.172493, 1.265347, 1, 1, 1, 1, 1,
0.2510091, -0.3925596, 0.8975434, 1, 1, 1, 1, 1,
0.2529666, 2.036988, -2.299647, 1, 1, 1, 1, 1,
0.2537053, 1.545212, 0.07405456, 1, 1, 1, 1, 1,
0.2594523, 1.008108, -0.9378296, 1, 1, 1, 1, 1,
0.2604888, 0.7008054, -0.5078691, 1, 1, 1, 1, 1,
0.2612652, -1.447088, 3.038077, 1, 1, 1, 1, 1,
0.2633316, -2.004416, 3.528991, 1, 1, 1, 1, 1,
0.263379, 2.346471, -1.387329, 1, 1, 1, 1, 1,
0.2683461, -1.367417, 3.710522, 1, 1, 1, 1, 1,
0.2689005, 0.6942817, 0.6725774, 1, 1, 1, 1, 1,
0.2714388, -0.2385543, 3.613776, 0, 0, 1, 1, 1,
0.2745529, -0.5552102, 2.00852, 1, 0, 0, 1, 1,
0.2749588, -1.501372, 3.391237, 1, 0, 0, 1, 1,
0.2796388, -0.5785618, 2.760705, 1, 0, 0, 1, 1,
0.2846627, 0.8196359, 0.01696251, 1, 0, 0, 1, 1,
0.285186, 1.188818, 2.309638, 1, 0, 0, 1, 1,
0.286847, -1.13696, 3.812089, 0, 0, 0, 1, 1,
0.2890473, -0.4147504, 1.90911, 0, 0, 0, 1, 1,
0.289686, -0.3791558, 1.554073, 0, 0, 0, 1, 1,
0.290145, 0.4682076, 0.8192424, 0, 0, 0, 1, 1,
0.2931037, -1.527727, 2.970778, 0, 0, 0, 1, 1,
0.2946839, -0.6053386, 2.649606, 0, 0, 0, 1, 1,
0.295332, -0.4525985, 2.6789, 0, 0, 0, 1, 1,
0.2956537, -1.58574, 1.894503, 1, 1, 1, 1, 1,
0.2975012, 0.8708578, 1.084117, 1, 1, 1, 1, 1,
0.2996899, 0.5423429, -0.002207485, 1, 1, 1, 1, 1,
0.3012032, -0.7442486, 3.249788, 1, 1, 1, 1, 1,
0.3083086, -0.8865175, 1.519104, 1, 1, 1, 1, 1,
0.3106891, 0.4031523, 0.2368637, 1, 1, 1, 1, 1,
0.3122113, 0.3064729, -0.6195641, 1, 1, 1, 1, 1,
0.3133748, -1.279158, 1.868487, 1, 1, 1, 1, 1,
0.320939, 0.8316565, -0.5293452, 1, 1, 1, 1, 1,
0.3213341, 2.172663, 0.425512, 1, 1, 1, 1, 1,
0.3228378, -0.5000597, 3.838154, 1, 1, 1, 1, 1,
0.3311764, 1.539233, -0.6282071, 1, 1, 1, 1, 1,
0.3324747, -1.772038, 3.312592, 1, 1, 1, 1, 1,
0.3365858, 0.5659583, -0.107016, 1, 1, 1, 1, 1,
0.3370187, -1.284125, 4.876436, 1, 1, 1, 1, 1,
0.3432651, -0.614747, 2.722288, 0, 0, 1, 1, 1,
0.3474022, 0.3246197, 1.945154, 1, 0, 0, 1, 1,
0.3477797, 0.3929869, -0.4234633, 1, 0, 0, 1, 1,
0.3509754, -0.2671241, 1.296566, 1, 0, 0, 1, 1,
0.3523726, 0.4500691, 0.07445943, 1, 0, 0, 1, 1,
0.3530248, -0.2314389, 2.117698, 1, 0, 0, 1, 1,
0.3558204, 0.01278961, 1.656773, 0, 0, 0, 1, 1,
0.3572023, -0.5056142, 2.189658, 0, 0, 0, 1, 1,
0.3584911, -0.4841065, 4.147687, 0, 0, 0, 1, 1,
0.3592822, -0.453846, 2.405673, 0, 0, 0, 1, 1,
0.3593947, -0.2044862, 2.841591, 0, 0, 0, 1, 1,
0.3594953, 0.5839758, -0.5462461, 0, 0, 0, 1, 1,
0.3605618, -0.9693776, 3.05178, 0, 0, 0, 1, 1,
0.3610933, 1.384851, 0.6502724, 1, 1, 1, 1, 1,
0.3680972, 0.3408561, 2.568032, 1, 1, 1, 1, 1,
0.3693944, -0.9445969, 2.776495, 1, 1, 1, 1, 1,
0.3706428, -0.1099362, 1.509512, 1, 1, 1, 1, 1,
0.371397, 0.06995346, 2.708277, 1, 1, 1, 1, 1,
0.3786823, -0.802501, 2.21434, 1, 1, 1, 1, 1,
0.3831181, 0.9138229, -0.4136861, 1, 1, 1, 1, 1,
0.3850829, -1.485239, 3.462157, 1, 1, 1, 1, 1,
0.388815, -0.6893682, 2.605863, 1, 1, 1, 1, 1,
0.3949685, 1.493157, -0.3022501, 1, 1, 1, 1, 1,
0.3994348, -0.3777812, 2.070914, 1, 1, 1, 1, 1,
0.3995657, 1.160232, 1.204499, 1, 1, 1, 1, 1,
0.4006966, -1.726642, 2.93724, 1, 1, 1, 1, 1,
0.4119393, -1.644274, 4.043169, 1, 1, 1, 1, 1,
0.4120254, 1.491884, 1.754313, 1, 1, 1, 1, 1,
0.4134744, -0.5498213, 1.438556, 0, 0, 1, 1, 1,
0.4141666, -0.5024962, 1.715552, 1, 0, 0, 1, 1,
0.4149595, 1.181923, 1.898095, 1, 0, 0, 1, 1,
0.4163051, 2.753683, 0.6979471, 1, 0, 0, 1, 1,
0.418211, -0.3027138, 1.954936, 1, 0, 0, 1, 1,
0.4186227, 0.7860509, 0.9705449, 1, 0, 0, 1, 1,
0.4190785, -0.3870544, 1.979649, 0, 0, 0, 1, 1,
0.4238994, 0.740239, 0.2757148, 0, 0, 0, 1, 1,
0.4287148, 1.245203, 0.6537764, 0, 0, 0, 1, 1,
0.4304974, 0.5368865, -0.04796128, 0, 0, 0, 1, 1,
0.435166, -2.145705, 2.475685, 0, 0, 0, 1, 1,
0.4359171, -1.325106, 2.662464, 0, 0, 0, 1, 1,
0.4443965, -1.607067, 3.277868, 0, 0, 0, 1, 1,
0.4449716, -0.8137208, 2.38226, 1, 1, 1, 1, 1,
0.4461102, -0.05832556, 0.1499915, 1, 1, 1, 1, 1,
0.4500275, -0.6392944, 2.212622, 1, 1, 1, 1, 1,
0.4542942, 0.4030891, -0.9953119, 1, 1, 1, 1, 1,
0.4557694, -0.7028573, 1.773711, 1, 1, 1, 1, 1,
0.4611293, 1.456797, 0.1471915, 1, 1, 1, 1, 1,
0.4651136, 0.313204, 0.4127319, 1, 1, 1, 1, 1,
0.4703885, -0.03731868, 2.319145, 1, 1, 1, 1, 1,
0.4709454, -1.246275, 2.195239, 1, 1, 1, 1, 1,
0.472077, 0.6552063, 1.127541, 1, 1, 1, 1, 1,
0.4745899, -0.4114197, 2.123304, 1, 1, 1, 1, 1,
0.4766067, -0.901627, 3.227896, 1, 1, 1, 1, 1,
0.4802446, 0.3536957, 1.157343, 1, 1, 1, 1, 1,
0.4803852, 0.008965641, 1.040294, 1, 1, 1, 1, 1,
0.480728, -0.4555872, 2.046306, 1, 1, 1, 1, 1,
0.4847873, 1.195747, -1.326668, 0, 0, 1, 1, 1,
0.4919468, -0.2848325, 2.531016, 1, 0, 0, 1, 1,
0.492103, -0.2939951, 2.496358, 1, 0, 0, 1, 1,
0.4990574, 0.2329351, 1.478792, 1, 0, 0, 1, 1,
0.4991483, 0.645079, 2.049528, 1, 0, 0, 1, 1,
0.5057134, -0.5678564, 2.375364, 1, 0, 0, 1, 1,
0.5066809, -1.012466, 1.155377, 0, 0, 0, 1, 1,
0.5077454, 0.3115603, 0.6240328, 0, 0, 0, 1, 1,
0.5115913, 0.3651623, 3.986396, 0, 0, 0, 1, 1,
0.5142795, 1.68575, -0.1190787, 0, 0, 0, 1, 1,
0.5158212, -0.2221612, 2.692936, 0, 0, 0, 1, 1,
0.5283235, -0.7046459, 2.556507, 0, 0, 0, 1, 1,
0.5316203, -1.496818, 4.054718, 0, 0, 0, 1, 1,
0.5320381, 1.001457, 0.3862388, 1, 1, 1, 1, 1,
0.5353165, 1.50125, -0.2745283, 1, 1, 1, 1, 1,
0.537493, -0.7526169, 2.824569, 1, 1, 1, 1, 1,
0.5385346, -0.664628, 1.775582, 1, 1, 1, 1, 1,
0.5385507, -0.8199256, 3.514473, 1, 1, 1, 1, 1,
0.5404367, -0.1910499, 3.038672, 1, 1, 1, 1, 1,
0.5457299, 0.944169, 1.713498, 1, 1, 1, 1, 1,
0.549641, -0.5429788, 1.515899, 1, 1, 1, 1, 1,
0.5527861, 0.4498516, 0.4180341, 1, 1, 1, 1, 1,
0.5559944, 0.1778945, 0.9836395, 1, 1, 1, 1, 1,
0.55879, 0.6632342, 2.565703, 1, 1, 1, 1, 1,
0.5653043, -0.508061, 3.239957, 1, 1, 1, 1, 1,
0.5677995, 0.5326698, 0.7609137, 1, 1, 1, 1, 1,
0.5751483, 1.138101, 1.31307, 1, 1, 1, 1, 1,
0.5757958, -0.5092539, 2.941419, 1, 1, 1, 1, 1,
0.5764249, -0.2195618, 1.059794, 0, 0, 1, 1, 1,
0.5831804, -2.2396, 0.6701915, 1, 0, 0, 1, 1,
0.5837783, -0.5693637, 2.998711, 1, 0, 0, 1, 1,
0.5839943, -0.8183278, 4.134672, 1, 0, 0, 1, 1,
0.587837, -2.423579, 2.904299, 1, 0, 0, 1, 1,
0.5882735, -1.752398, 5.599129, 1, 0, 0, 1, 1,
0.5900775, -0.1392061, 1.077968, 0, 0, 0, 1, 1,
0.5907909, 0.8335644, 0.04677022, 0, 0, 0, 1, 1,
0.5950438, 0.1149617, 0.8378216, 0, 0, 0, 1, 1,
0.6171508, -0.1192534, 2.021078, 0, 0, 0, 1, 1,
0.6174245, 0.3587834, 1.805688, 0, 0, 0, 1, 1,
0.6191586, 0.021187, 0.5281152, 0, 0, 0, 1, 1,
0.620032, 1.596533, -0.6987447, 0, 0, 0, 1, 1,
0.628612, 0.9248062, 1.211607, 1, 1, 1, 1, 1,
0.6317838, -0.9582543, 2.099815, 1, 1, 1, 1, 1,
0.6350209, -0.1828025, 2.950323, 1, 1, 1, 1, 1,
0.6419232, -0.6031537, 3.425944, 1, 1, 1, 1, 1,
0.6439157, -0.3191884, 1.681806, 1, 1, 1, 1, 1,
0.6441033, -0.221619, 0.4155174, 1, 1, 1, 1, 1,
0.644192, -0.5702912, 1.430542, 1, 1, 1, 1, 1,
0.6506538, 0.8899255, -1.028845, 1, 1, 1, 1, 1,
0.6547833, 0.4589197, -0.04720738, 1, 1, 1, 1, 1,
0.6649969, 2.537718, 0.542407, 1, 1, 1, 1, 1,
0.6721877, 0.7629711, 0.0835913, 1, 1, 1, 1, 1,
0.6723319, -1.095643, 1.931118, 1, 1, 1, 1, 1,
0.6732352, 0.4206513, 0.4237151, 1, 1, 1, 1, 1,
0.6772002, 0.8815929, 0.5610355, 1, 1, 1, 1, 1,
0.6802967, 0.8291039, 1.148902, 1, 1, 1, 1, 1,
0.682542, 0.2022645, 1.705447, 0, 0, 1, 1, 1,
0.683497, 0.6470708, -0.08909976, 1, 0, 0, 1, 1,
0.687997, -0.1176441, 2.541818, 1, 0, 0, 1, 1,
0.6915246, 0.9723049, 0.9383591, 1, 0, 0, 1, 1,
0.6960124, -0.7300243, 1.027038, 1, 0, 0, 1, 1,
0.7039235, 0.3546765, 1.050227, 1, 0, 0, 1, 1,
0.7089633, -2.770636, 4.72559, 0, 0, 0, 1, 1,
0.7178228, 1.85367, 0.1634573, 0, 0, 0, 1, 1,
0.7181206, 1.24834, 0.0132344, 0, 0, 0, 1, 1,
0.7187846, 0.7253051, 1.472218, 0, 0, 0, 1, 1,
0.7190254, 0.8309081, -0.4942579, 0, 0, 0, 1, 1,
0.7205561, -0.3947799, 1.801937, 0, 0, 0, 1, 1,
0.7254267, -0.3915554, 2.782941, 0, 0, 0, 1, 1,
0.7275349, -0.5944164, 1.871138, 1, 1, 1, 1, 1,
0.7286567, -1.269937, 2.344611, 1, 1, 1, 1, 1,
0.7305886, -0.07998189, 2.954988, 1, 1, 1, 1, 1,
0.7336826, 0.4051922, 1.681133, 1, 1, 1, 1, 1,
0.7338344, 0.2621771, -1.476135, 1, 1, 1, 1, 1,
0.7344072, -0.9691297, 2.285226, 1, 1, 1, 1, 1,
0.7459641, 0.8620642, -0.6496937, 1, 1, 1, 1, 1,
0.760966, 1.125935, -1.189525, 1, 1, 1, 1, 1,
0.7622187, -0.2540545, 1.530388, 1, 1, 1, 1, 1,
0.7661571, -0.3964399, 2.365981, 1, 1, 1, 1, 1,
0.7669547, -1.741353, 1.671879, 1, 1, 1, 1, 1,
0.7669708, 0.1363456, 0.3216437, 1, 1, 1, 1, 1,
0.7689818, 2.493922, 0.6349617, 1, 1, 1, 1, 1,
0.7709174, -0.3057207, 2.768049, 1, 1, 1, 1, 1,
0.771695, -0.896848, 0.6421953, 1, 1, 1, 1, 1,
0.7879318, 1.208712, 0.4417363, 0, 0, 1, 1, 1,
0.7890584, 0.1649219, 1.330893, 1, 0, 0, 1, 1,
0.7923084, 0.3118802, 1.796179, 1, 0, 0, 1, 1,
0.7936173, -0.5932779, 2.494461, 1, 0, 0, 1, 1,
0.7968576, -1.858301, 2.458403, 1, 0, 0, 1, 1,
0.8006698, -1.417767, 2.644215, 1, 0, 0, 1, 1,
0.8037744, -1.101626, 0.753391, 0, 0, 0, 1, 1,
0.8042412, -1.712606, 2.238361, 0, 0, 0, 1, 1,
0.8108441, 0.03327976, 3.209979, 0, 0, 0, 1, 1,
0.8148004, 1.64797, 0.9081257, 0, 0, 0, 1, 1,
0.8197606, 1.306822, 2.042187, 0, 0, 0, 1, 1,
0.8205695, -0.1478318, 2.406571, 0, 0, 0, 1, 1,
0.8335077, -1.672258, 1.849408, 0, 0, 0, 1, 1,
0.8354596, 0.1071215, 0.9527255, 1, 1, 1, 1, 1,
0.8364454, -0.8721984, 0.9131497, 1, 1, 1, 1, 1,
0.8389091, 0.7371866, 0.7314246, 1, 1, 1, 1, 1,
0.8414488, -0.01433515, 2.85938, 1, 1, 1, 1, 1,
0.8417338, 1.698264, 0.2151451, 1, 1, 1, 1, 1,
0.8464769, -0.3149861, 3.898968, 1, 1, 1, 1, 1,
0.8530841, 1.977946, 1.584005, 1, 1, 1, 1, 1,
0.8584984, 1.43748, 1.524189, 1, 1, 1, 1, 1,
0.863377, 0.09279007, 1.025164, 1, 1, 1, 1, 1,
0.865148, -0.2859586, 2.377498, 1, 1, 1, 1, 1,
0.8653259, 2.296587, 1.398897, 1, 1, 1, 1, 1,
0.8662012, 0.3520131, 2.125237, 1, 1, 1, 1, 1,
0.8727739, -0.193919, 1.963234, 1, 1, 1, 1, 1,
0.8737599, 0.8133714, 1.65797, 1, 1, 1, 1, 1,
0.8770438, 0.4644862, 1.626117, 1, 1, 1, 1, 1,
0.8771164, -0.5736728, 2.258216, 0, 0, 1, 1, 1,
0.8785551, 0.2283475, 0.00741033, 1, 0, 0, 1, 1,
0.8831063, -0.4473205, 0.92344, 1, 0, 0, 1, 1,
0.8839175, -0.4323066, 3.007273, 1, 0, 0, 1, 1,
0.8861674, 1.19052, 0.6728559, 1, 0, 0, 1, 1,
0.8903881, 0.9826828, 1.567585, 1, 0, 0, 1, 1,
0.8952953, 0.3268556, -0.06127183, 0, 0, 0, 1, 1,
0.8969351, -0.5680357, 3.744256, 0, 0, 0, 1, 1,
0.9010364, -0.4766537, -0.1771595, 0, 0, 0, 1, 1,
0.9044703, 1.701544, 0.6505992, 0, 0, 0, 1, 1,
0.9086612, 2.128433, -0.6764321, 0, 0, 0, 1, 1,
0.9239374, -0.03840693, 0.9236115, 0, 0, 0, 1, 1,
0.9245297, -0.1721168, 1.282496, 0, 0, 0, 1, 1,
0.9304305, 0.7555108, 0.5316979, 1, 1, 1, 1, 1,
0.9314629, -0.5018452, 0.6889008, 1, 1, 1, 1, 1,
0.9321194, 0.03915133, 1.462862, 1, 1, 1, 1, 1,
0.9363241, -0.713599, 2.585377, 1, 1, 1, 1, 1,
0.9392379, 0.5221112, 0.09327339, 1, 1, 1, 1, 1,
0.9434521, 1.362676, 0.1020452, 1, 1, 1, 1, 1,
0.94808, -1.525789, 3.167821, 1, 1, 1, 1, 1,
0.9494688, 1.369243, 0.1121777, 1, 1, 1, 1, 1,
0.9496589, -1.111689, 2.787322, 1, 1, 1, 1, 1,
0.9542105, 0.8805494, 2.44162, 1, 1, 1, 1, 1,
0.9641428, -2.013783, 2.307422, 1, 1, 1, 1, 1,
0.9645081, -2.093895, 3.648065, 1, 1, 1, 1, 1,
0.9647995, 1.06523, 0.1205589, 1, 1, 1, 1, 1,
0.9669669, 0.2687909, 1.083756, 1, 1, 1, 1, 1,
0.9726353, -0.6619442, 4.465353, 1, 1, 1, 1, 1,
0.9780443, 0.6395939, -0.1849629, 0, 0, 1, 1, 1,
0.9794413, -0.3627953, 3.567853, 1, 0, 0, 1, 1,
0.9815756, -0.3835782, 2.603728, 1, 0, 0, 1, 1,
0.984594, 0.1323205, 2.882886, 1, 0, 0, 1, 1,
0.9870059, -1.728645, 2.777993, 1, 0, 0, 1, 1,
0.9874821, 0.09303845, 2.763437, 1, 0, 0, 1, 1,
0.9994695, -0.1155784, 2.473893, 0, 0, 0, 1, 1,
1.003822, -0.1738464, 0.8409606, 0, 0, 0, 1, 1,
1.011293, -1.126016, 3.544574, 0, 0, 0, 1, 1,
1.015614, -1.68113, 1.988243, 0, 0, 0, 1, 1,
1.023031, -2.504082, 1.998902, 0, 0, 0, 1, 1,
1.024593, 1.565874, 0.6238231, 0, 0, 0, 1, 1,
1.026106, 0.5710053, 1.522682, 0, 0, 0, 1, 1,
1.026863, -0.9618996, 2.53923, 1, 1, 1, 1, 1,
1.056247, 1.122295, -1.070647, 1, 1, 1, 1, 1,
1.056808, 0.6198123, 1.10681, 1, 1, 1, 1, 1,
1.064978, 1.492598, 0.5580429, 1, 1, 1, 1, 1,
1.073362, -1.023291, 1.962882, 1, 1, 1, 1, 1,
1.073987, 0.9235687, 0.9799186, 1, 1, 1, 1, 1,
1.076553, -0.3385812, -0.2200347, 1, 1, 1, 1, 1,
1.085442, -0.3927174, 4.003309, 1, 1, 1, 1, 1,
1.090279, -2.040781, 4.19798, 1, 1, 1, 1, 1,
1.096624, -1.324477, 3.104058, 1, 1, 1, 1, 1,
1.108066, -0.3387073, 2.530785, 1, 1, 1, 1, 1,
1.112254, 0.2166303, 2.676699, 1, 1, 1, 1, 1,
1.113005, 0.2737029, 1.907971, 1, 1, 1, 1, 1,
1.120561, -0.5419959, 3.299949, 1, 1, 1, 1, 1,
1.12116, 0.6653958, 2.110398, 1, 1, 1, 1, 1,
1.138029, 0.506164, 2.500634, 0, 0, 1, 1, 1,
1.142404, -0.889165, 2.292344, 1, 0, 0, 1, 1,
1.143525, -0.3003825, 3.11587, 1, 0, 0, 1, 1,
1.149081, -0.1646663, 2.586894, 1, 0, 0, 1, 1,
1.149427, -0.4031023, 0.3690467, 1, 0, 0, 1, 1,
1.161953, -2.056854, 2.125639, 1, 0, 0, 1, 1,
1.170041, -1.176854, 3.181253, 0, 0, 0, 1, 1,
1.170479, 1.520481, 1.300502, 0, 0, 0, 1, 1,
1.174457, -1.854549, 2.51079, 0, 0, 0, 1, 1,
1.192988, 0.0772851, 0.6786175, 0, 0, 0, 1, 1,
1.196516, -0.700368, 3.771977, 0, 0, 0, 1, 1,
1.196614, -0.265387, 0.6068813, 0, 0, 0, 1, 1,
1.199506, -0.1214505, -0.7356664, 0, 0, 0, 1, 1,
1.200612, 0.797797, 0.3232146, 1, 1, 1, 1, 1,
1.201155, 0.9730973, 1.124315, 1, 1, 1, 1, 1,
1.203266, -0.6073282, 3.914522, 1, 1, 1, 1, 1,
1.207717, -0.5539654, 3.035877, 1, 1, 1, 1, 1,
1.217575, -0.09490702, 2.944065, 1, 1, 1, 1, 1,
1.221208, -0.7621333, 4.924038, 1, 1, 1, 1, 1,
1.230455, 2.26752, -0.02738891, 1, 1, 1, 1, 1,
1.233409, -0.6890336, 2.172436, 1, 1, 1, 1, 1,
1.242384, 0.7945737, 2.535373, 1, 1, 1, 1, 1,
1.244513, 0.3607006, 0.9329616, 1, 1, 1, 1, 1,
1.24757, 0.6789737, -1.398309, 1, 1, 1, 1, 1,
1.248046, 1.158645, 1.283228, 1, 1, 1, 1, 1,
1.253202, 0.3360285, 1.615587, 1, 1, 1, 1, 1,
1.263292, -1.267037, 2.679414, 1, 1, 1, 1, 1,
1.265378, 1.820907, 1.051059, 1, 1, 1, 1, 1,
1.27376, -0.1135082, 0.3215948, 0, 0, 1, 1, 1,
1.2802, -1.748446, 3.989417, 1, 0, 0, 1, 1,
1.288645, -0.1404266, 1.450824, 1, 0, 0, 1, 1,
1.289971, -1.997714, 2.964398, 1, 0, 0, 1, 1,
1.293804, 0.8391863, 0.4839097, 1, 0, 0, 1, 1,
1.308782, 0.8619256, 2.125452, 1, 0, 0, 1, 1,
1.318914, 1.548397, -0.1451344, 0, 0, 0, 1, 1,
1.32414, 1.413429, 0.580991, 0, 0, 0, 1, 1,
1.326811, -0.6050522, 0.4201592, 0, 0, 0, 1, 1,
1.337421, 0.8243064, 1.926335, 0, 0, 0, 1, 1,
1.337861, -1.229421, 0.7781644, 0, 0, 0, 1, 1,
1.342112, -1.046617, 2.608366, 0, 0, 0, 1, 1,
1.342349, 0.3935652, 0.544363, 0, 0, 0, 1, 1,
1.356967, 0.1482801, 0.5168747, 1, 1, 1, 1, 1,
1.358912, 1.110905, 0.504881, 1, 1, 1, 1, 1,
1.381084, 0.9087043, 0.6476571, 1, 1, 1, 1, 1,
1.382045, 1.221186, 4.169868, 1, 1, 1, 1, 1,
1.388202, -0.2027613, 2.510092, 1, 1, 1, 1, 1,
1.392528, -0.6816632, 2.293747, 1, 1, 1, 1, 1,
1.408734, 0.8654737, 2.851943, 1, 1, 1, 1, 1,
1.41206, -0.1882197, 0.6241933, 1, 1, 1, 1, 1,
1.41537, -1.505722, 1.629903, 1, 1, 1, 1, 1,
1.419324, 1.804383, -0.7458224, 1, 1, 1, 1, 1,
1.422934, -1.322651, 2.175323, 1, 1, 1, 1, 1,
1.424549, -0.5878333, 1.911656, 1, 1, 1, 1, 1,
1.433636, -0.8652318, 2.643812, 1, 1, 1, 1, 1,
1.438067, 0.06096328, 1.536465, 1, 1, 1, 1, 1,
1.442122, -1.461172, 0.4530554, 1, 1, 1, 1, 1,
1.443313, -0.873938, 2.405871, 0, 0, 1, 1, 1,
1.462979, 1.132373, 1.121716, 1, 0, 0, 1, 1,
1.48203, 1.418186, 0.4154215, 1, 0, 0, 1, 1,
1.489205, -0.5482002, 1.839754, 1, 0, 0, 1, 1,
1.507566, -1.232924, 2.03067, 1, 0, 0, 1, 1,
1.507859, -1.407037, 1.79276, 1, 0, 0, 1, 1,
1.515422, 1.01706, -1.632603, 0, 0, 0, 1, 1,
1.523039, 1.068497, 3.262926, 0, 0, 0, 1, 1,
1.535397, -0.4291451, 2.644305, 0, 0, 0, 1, 1,
1.540459, 0.4235544, 3.590778, 0, 0, 0, 1, 1,
1.540734, -0.02268841, 0.6259414, 0, 0, 0, 1, 1,
1.541837, 1.419752, 0.5634154, 0, 0, 0, 1, 1,
1.543737, -0.186406, 2.751776, 0, 0, 0, 1, 1,
1.555303, -1.027074, 3.633335, 1, 1, 1, 1, 1,
1.585139, -0.9933385, 3.00393, 1, 1, 1, 1, 1,
1.588073, 1.872594, 2.64329, 1, 1, 1, 1, 1,
1.599854, 0.3230119, 1.969523, 1, 1, 1, 1, 1,
1.628432, 0.2689598, 3.560198, 1, 1, 1, 1, 1,
1.649851, -0.9554809, 1.065451, 1, 1, 1, 1, 1,
1.660484, -0.949805, 1.828233, 1, 1, 1, 1, 1,
1.664317, -0.8044514, 1.518313, 1, 1, 1, 1, 1,
1.677116, -0.5791374, 3.69204, 1, 1, 1, 1, 1,
1.677642, 0.2509658, 1.962934, 1, 1, 1, 1, 1,
1.694214, -0.3479049, 0.8563936, 1, 1, 1, 1, 1,
1.699484, 0.4894773, 2.32144, 1, 1, 1, 1, 1,
1.706733, 0.5798548, 1.480966, 1, 1, 1, 1, 1,
1.711235, 0.7238635, -1.091076, 1, 1, 1, 1, 1,
1.723909, 0.9876271, 0.4841863, 1, 1, 1, 1, 1,
1.731946, 0.3458174, 2.861172, 0, 0, 1, 1, 1,
1.73519, -0.2594336, 2.129243, 1, 0, 0, 1, 1,
1.765547, -0.7144932, 3.397745, 1, 0, 0, 1, 1,
1.780135, -0.03304309, 3.400503, 1, 0, 0, 1, 1,
1.790243, -0.002952094, 1.630861, 1, 0, 0, 1, 1,
1.793864, -1.494368, 1.418509, 1, 0, 0, 1, 1,
1.810968, -0.3349918, 3.297906, 0, 0, 0, 1, 1,
1.822541, 0.6575349, 1.776646, 0, 0, 0, 1, 1,
1.823831, 0.1877541, 0.841906, 0, 0, 0, 1, 1,
1.830896, -2.377649, 0.5727751, 0, 0, 0, 1, 1,
1.841617, -0.6948493, 1.979223, 0, 0, 0, 1, 1,
1.863813, -0.07564895, 3.172467, 0, 0, 0, 1, 1,
1.903774, -2.467234, 1.472431, 0, 0, 0, 1, 1,
1.926289, -0.06836747, 1.793999, 1, 1, 1, 1, 1,
1.930945, -0.09113486, 1.619337, 1, 1, 1, 1, 1,
1.933106, 0.857206, 1.610326, 1, 1, 1, 1, 1,
1.938165, -0.5312605, 4.019129, 1, 1, 1, 1, 1,
1.946197, 2.026868, -0.7845183, 1, 1, 1, 1, 1,
1.986996, 1.291789, -0.231287, 1, 1, 1, 1, 1,
2.000533, 0.5103377, 2.260017, 1, 1, 1, 1, 1,
2.01882, -1.093187, 1.644549, 1, 1, 1, 1, 1,
2.030425, 0.3993016, 0.8009405, 1, 1, 1, 1, 1,
2.038936, -0.4246322, 2.177182, 1, 1, 1, 1, 1,
2.052606, -0.8946086, 3.409827, 1, 1, 1, 1, 1,
2.070122, -0.5990483, 2.559959, 1, 1, 1, 1, 1,
2.072918, -0.07059429, 0.9996483, 1, 1, 1, 1, 1,
2.085532, 0.3870321, 2.540868, 1, 1, 1, 1, 1,
2.13781, 1.014997, 1.605511, 1, 1, 1, 1, 1,
2.149347, -0.917463, 2.19062, 0, 0, 1, 1, 1,
2.194261, -1.384476, 1.193243, 1, 0, 0, 1, 1,
2.233426, -0.02497595, 0.7518634, 1, 0, 0, 1, 1,
2.234569, -1.103327, 1.903488, 1, 0, 0, 1, 1,
2.246944, -1.24524, 1.832021, 1, 0, 0, 1, 1,
2.258326, 0.280846, 2.971908, 1, 0, 0, 1, 1,
2.25884, -0.7591955, 2.0756, 0, 0, 0, 1, 1,
2.313779, -0.4644353, 3.692629, 0, 0, 0, 1, 1,
2.328527, -0.5045004, 1.77564, 0, 0, 0, 1, 1,
2.366611, 1.56538, 1.207644, 0, 0, 0, 1, 1,
2.447712, 0.01431595, 0.9322102, 0, 0, 0, 1, 1,
2.503232, -0.6943218, 1.093758, 0, 0, 0, 1, 1,
2.507522, -0.97753, 2.26649, 0, 0, 0, 1, 1,
2.572081, 0.7996863, 1.718738, 1, 1, 1, 1, 1,
2.579045, 0.06991197, 3.351879, 1, 1, 1, 1, 1,
2.722705, -0.02407726, 2.830771, 1, 1, 1, 1, 1,
2.780592, -1.056968, 1.043666, 1, 1, 1, 1, 1,
2.842825, -0.5715209, 2.067674, 1, 1, 1, 1, 1,
3.069345, 1.523009, 0.980171, 1, 1, 1, 1, 1,
3.107828, -0.006972549, 1.017294, 1, 1, 1, 1, 1
]);
var values25 = v;
var normLoc25 = gl.getAttribLocation(prog25, "aNorm");
var mvMatLoc25 = gl.getUniformLocation(prog25,"mvMatrix");
var prMatLoc25 = gl.getUniformLocation(prog25,"prMatrix");
var normMatLoc25 = gl.getUniformLocation(prog25,"normMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 19 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 9.666238;
var distance = 33.95225;
var t = tan(fov[19]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[19], hlen*aspect*zoom[19], 
-hlen*zoom[19], hlen*zoom[19], near, far);
else  
prMatrix.frustum(-hlen*zoom[19], hlen*zoom[19], 
-hlen*zoom[19]/aspect, hlen*zoom[19]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( 0.5758517, 0.07028508, -0.2225807 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.95225);
normMatrix.makeIdentity();
normMatrix.scale( 1, 1, 1 );   
normMatrix.multRight( userMatrix[19] );
// ****** spheres object 25 *******
gl.useProgram(prog25);
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.uniformMatrix4fv( prMatLoc25, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(normMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.enableVertexAttribArray(normLoc25 );
gl.vertexAttribPointer(normLoc25,  3, gl.FLOAT, false, 12,  0);
gl.disableVertexAttribArray( colLoc );
var sphereNorm = new CanvasMatrix4();
sphereNorm.scale(1, 1, 1);
sphereNorm.multRight(normMatrix);
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(sphereNorm.getAsArray()) );
for (var i = 0; i < 1000; i++) {
var sphereMV = new CanvasMatrix4();
var baseofs = i*8
var ofs = baseofs + 7;	       
var scale = values25[ofs];
sphereMV.scale(1*scale, 1*scale, 1*scale);
sphereMV.translate(values25[baseofs], 
values25[baseofs+1], 
values25[baseofs+2]);
sphereMV.multRight(mvMatrix);
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(sphereMV.getAsArray()) );
ofs = baseofs + 3;       
gl.vertexAttrib4f( colLoc, values25[ofs], 
values25[ofs+1], 
values25[ofs+2],
values25[ofs+3] );
gl.drawElements(gl.TRIANGLES, 384, gl.UNSIGNED_SHORT, 0);
}
gl.flush ();
}
var vpx0 = {
19: 0
};
var vpy0 = {
19: 0
};
var vpWidths = {
19: 504
};
var vpHeights = {
19: 504
};
var activeModel = {
19: 19
};
var activeProjection = {
19: 19
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(19);
return(19);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testgl2canvas" width="1" height="1"></canvas> 
<p id="testgl2debug">
You must enable Javascript to view this page properly.</p>
<script>testgl2webGLStart();</script>
