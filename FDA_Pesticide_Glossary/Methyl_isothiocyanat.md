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
-3.310249, 0.3389933, -0.8829569, 1, 0, 0, 1,
-3.176902, 0.3432862, -0.5095056, 1, 0.007843138, 0, 1,
-2.928414, 1.399019, -0.812841, 1, 0.01176471, 0, 1,
-2.721895, 1.468747, 0.2493002, 1, 0.01960784, 0, 1,
-2.679766, 0.4932796, -1.395554, 1, 0.02352941, 0, 1,
-2.659537, 0.7187411, -0.202494, 1, 0.03137255, 0, 1,
-2.644985, -0.7812852, -1.497797, 1, 0.03529412, 0, 1,
-2.642544, 0.2990601, -2.699424, 1, 0.04313726, 0, 1,
-2.588875, -0.1958533, -1.836508, 1, 0.04705882, 0, 1,
-2.498099, 1.271778, -1.804965, 1, 0.05490196, 0, 1,
-2.45916, 1.949981, -0.03204731, 1, 0.05882353, 0, 1,
-2.430782, 0.7413625, -0.1037422, 1, 0.06666667, 0, 1,
-2.429012, -1.099283, -2.243327, 1, 0.07058824, 0, 1,
-2.387532, -0.5180638, -2.824286, 1, 0.07843138, 0, 1,
-2.36559, -0.9737641, -0.9529968, 1, 0.08235294, 0, 1,
-2.340026, 1.366282, -2.308188, 1, 0.09019608, 0, 1,
-2.305263, 0.5232822, -0.3501687, 1, 0.09411765, 0, 1,
-2.265752, -0.5905628, -2.966484, 1, 0.1019608, 0, 1,
-2.253457, -0.8760411, -1.886297, 1, 0.1098039, 0, 1,
-2.231327, 0.04533742, -2.088604, 1, 0.1137255, 0, 1,
-2.186098, 0.3445237, -1.465393, 1, 0.1215686, 0, 1,
-2.178909, 0.1776996, -3.981177, 1, 0.1254902, 0, 1,
-2.165553, -1.343906, -3.369624, 1, 0.1333333, 0, 1,
-2.146988, -1.794217, -1.986718, 1, 0.1372549, 0, 1,
-2.067617, 0.1184021, -1.928821, 1, 0.145098, 0, 1,
-2.036898, -0.3379526, -2.428386, 1, 0.1490196, 0, 1,
-2.030202, 0.0423049, -2.630152, 1, 0.1568628, 0, 1,
-2.0097, 0.6943027, 0.7206112, 1, 0.1607843, 0, 1,
-2.008137, -0.3623969, -3.282174, 1, 0.1686275, 0, 1,
-1.992692, -0.01774236, -1.794685, 1, 0.172549, 0, 1,
-1.971384, 1.524681, -1.45105, 1, 0.1803922, 0, 1,
-1.946366, 1.893261, -0.449823, 1, 0.1843137, 0, 1,
-1.931612, -0.7609732, -2.430899, 1, 0.1921569, 0, 1,
-1.879677, 0.2663451, -0.7582232, 1, 0.1960784, 0, 1,
-1.871524, -0.438548, -2.397546, 1, 0.2039216, 0, 1,
-1.847952, -0.3961991, -1.969087, 1, 0.2117647, 0, 1,
-1.817216, -1.596594, -0.8899391, 1, 0.2156863, 0, 1,
-1.780518, -0.1296372, -2.392516, 1, 0.2235294, 0, 1,
-1.780281, 1.337128, -1.312733, 1, 0.227451, 0, 1,
-1.771456, -1.644775, -2.18459, 1, 0.2352941, 0, 1,
-1.767825, -1.213175, -3.339862, 1, 0.2392157, 0, 1,
-1.76456, 0.8079452, 0.4344275, 1, 0.2470588, 0, 1,
-1.718409, -0.1436048, -4.159503, 1, 0.2509804, 0, 1,
-1.715379, -1.022898, -2.482942, 1, 0.2588235, 0, 1,
-1.713886, -1.696008, -0.8639722, 1, 0.2627451, 0, 1,
-1.708939, 0.4279751, -2.450495, 1, 0.2705882, 0, 1,
-1.696979, 0.6622164, -0.9293714, 1, 0.2745098, 0, 1,
-1.696874, -0.4002296, -2.096246, 1, 0.282353, 0, 1,
-1.666655, -0.2187255, -1.614487, 1, 0.2862745, 0, 1,
-1.656866, 0.9320735, -0.9521913, 1, 0.2941177, 0, 1,
-1.613832, -0.3866481, -3.042993, 1, 0.3019608, 0, 1,
-1.606064, 0.8341534, -3.337305, 1, 0.3058824, 0, 1,
-1.603127, 2.7555, -1.639075, 1, 0.3137255, 0, 1,
-1.602446, 0.5272845, -0.2838633, 1, 0.3176471, 0, 1,
-1.59956, 0.8840695, -1.049969, 1, 0.3254902, 0, 1,
-1.58996, 1.670322, -0.7399794, 1, 0.3294118, 0, 1,
-1.58806, 1.081702, -2.539271, 1, 0.3372549, 0, 1,
-1.549544, -0.4424408, -3.929755, 1, 0.3411765, 0, 1,
-1.548194, -0.0682532, -1.835116, 1, 0.3490196, 0, 1,
-1.538233, -0.2117024, -2.985487, 1, 0.3529412, 0, 1,
-1.533749, 0.7526447, -2.263796, 1, 0.3607843, 0, 1,
-1.522295, -0.4764756, -0.2579989, 1, 0.3647059, 0, 1,
-1.516041, -0.2095643, -2.508697, 1, 0.372549, 0, 1,
-1.514738, -0.3389356, -0.873062, 1, 0.3764706, 0, 1,
-1.507106, 0.9367216, -0.8304871, 1, 0.3843137, 0, 1,
-1.502398, -0.8048899, -2.042325, 1, 0.3882353, 0, 1,
-1.495922, 0.5652167, -1.399978, 1, 0.3960784, 0, 1,
-1.491107, 0.1877676, -1.95009, 1, 0.4039216, 0, 1,
-1.47453, -1.733428, -3.422121, 1, 0.4078431, 0, 1,
-1.446746, -1.861693, -1.464773, 1, 0.4156863, 0, 1,
-1.440201, -0.3161554, -0.9923239, 1, 0.4196078, 0, 1,
-1.439777, -1.667527, -3.724167, 1, 0.427451, 0, 1,
-1.431434, 0.4639982, 0.6953842, 1, 0.4313726, 0, 1,
-1.421719, 0.3363274, 0.08645993, 1, 0.4392157, 0, 1,
-1.42128, 0.8907978, -0.4195176, 1, 0.4431373, 0, 1,
-1.417338, 0.01757977, -1.520729, 1, 0.4509804, 0, 1,
-1.416446, 1.079122, -1.472727, 1, 0.454902, 0, 1,
-1.414069, -2.024035, -2.302325, 1, 0.4627451, 0, 1,
-1.406914, 0.3794158, -0.2619226, 1, 0.4666667, 0, 1,
-1.389776, 0.3795778, -0.7522352, 1, 0.4745098, 0, 1,
-1.388488, -0.8897105, -1.490132, 1, 0.4784314, 0, 1,
-1.387537, 0.0001948217, -1.472185, 1, 0.4862745, 0, 1,
-1.374072, -2.048654, -4.040337, 1, 0.4901961, 0, 1,
-1.372522, 1.656971, -1.39131, 1, 0.4980392, 0, 1,
-1.362793, -1.934146, -3.311368, 1, 0.5058824, 0, 1,
-1.362036, -1.663284, -1.879023, 1, 0.509804, 0, 1,
-1.36087, 0.2530092, -1.583008, 1, 0.5176471, 0, 1,
-1.359012, 0.1937774, -2.525609, 1, 0.5215687, 0, 1,
-1.355869, 0.5472136, -2.435079, 1, 0.5294118, 0, 1,
-1.352184, 0.8158896, -0.8840685, 1, 0.5333334, 0, 1,
-1.352093, -0.5648739, -2.31196, 1, 0.5411765, 0, 1,
-1.350284, -0.1296328, -2.615884, 1, 0.5450981, 0, 1,
-1.348194, 0.1116849, -2.536213, 1, 0.5529412, 0, 1,
-1.341037, -1.072514, -1.853376, 1, 0.5568628, 0, 1,
-1.333231, -0.3212629, -0.7522786, 1, 0.5647059, 0, 1,
-1.326204, -1.056406, -3.96458, 1, 0.5686275, 0, 1,
-1.305669, -0.1510455, -0.9579668, 1, 0.5764706, 0, 1,
-1.298627, -0.26102, -1.81641, 1, 0.5803922, 0, 1,
-1.290645, 0.1688165, -2.579788, 1, 0.5882353, 0, 1,
-1.283175, 0.3126889, -1.136455, 1, 0.5921569, 0, 1,
-1.281945, 0.628511, -1.269254, 1, 0.6, 0, 1,
-1.266941, -0.2577678, -2.847088, 1, 0.6078432, 0, 1,
-1.265943, -0.7134662, -2.24311, 1, 0.6117647, 0, 1,
-1.263797, -0.1174365, -2.101393, 1, 0.6196079, 0, 1,
-1.259747, -0.501444, -3.774164, 1, 0.6235294, 0, 1,
-1.241593, 0.6681237, -0.440774, 1, 0.6313726, 0, 1,
-1.2241, -0.01589444, -3.539851, 1, 0.6352941, 0, 1,
-1.223452, 0.258641, -2.4207, 1, 0.6431373, 0, 1,
-1.220565, 1.466462, -2.955553, 1, 0.6470588, 0, 1,
-1.217929, -0.1202003, -2.779651, 1, 0.654902, 0, 1,
-1.217856, 0.6406614, -0.6989815, 1, 0.6588235, 0, 1,
-1.205674, -0.9400778, -3.318565, 1, 0.6666667, 0, 1,
-1.202292, -0.736882, -3.02265, 1, 0.6705883, 0, 1,
-1.200569, 0.3647326, -2.934789, 1, 0.6784314, 0, 1,
-1.199227, 2.227152, -1.667668, 1, 0.682353, 0, 1,
-1.198187, -0.3274174, -2.667901, 1, 0.6901961, 0, 1,
-1.186878, 0.01505389, -1.648249, 1, 0.6941177, 0, 1,
-1.184993, 0.2587793, 0.5613972, 1, 0.7019608, 0, 1,
-1.174055, 0.3955826, 1.320709, 1, 0.7098039, 0, 1,
-1.166663, 0.1347104, -0.7006484, 1, 0.7137255, 0, 1,
-1.160731, 0.4484251, -0.1064833, 1, 0.7215686, 0, 1,
-1.157722, 0.6705589, -1.146564, 1, 0.7254902, 0, 1,
-1.157664, -1.546793, -2.367484, 1, 0.7333333, 0, 1,
-1.140967, 2.593997, -2.022127, 1, 0.7372549, 0, 1,
-1.138098, -1.556022, -1.631136, 1, 0.7450981, 0, 1,
-1.136279, -0.7648184, -2.48901, 1, 0.7490196, 0, 1,
-1.134491, -0.4606312, -1.532669, 1, 0.7568628, 0, 1,
-1.134166, -0.543005, -3.632134, 1, 0.7607843, 0, 1,
-1.129131, -0.4520652, -1.755765, 1, 0.7686275, 0, 1,
-1.122692, -0.07504508, -2.321323, 1, 0.772549, 0, 1,
-1.104525, 1.045323, -1.689905, 1, 0.7803922, 0, 1,
-1.098983, -1.971467, -3.251768, 1, 0.7843137, 0, 1,
-1.090259, -0.3452879, -1.955751, 1, 0.7921569, 0, 1,
-1.085966, -0.1281895, -1.039386, 1, 0.7960784, 0, 1,
-1.081522, 0.3359212, -0.2220171, 1, 0.8039216, 0, 1,
-1.080048, 0.1880218, -0.4736956, 1, 0.8117647, 0, 1,
-1.079554, 1.384956, 0.7146132, 1, 0.8156863, 0, 1,
-1.07469, 0.3654151, -1.618258, 1, 0.8235294, 0, 1,
-1.069274, -0.8107997, -2.163279, 1, 0.827451, 0, 1,
-1.067439, 1.149761, -0.9723701, 1, 0.8352941, 0, 1,
-1.067372, 0.1928112, -1.456696, 1, 0.8392157, 0, 1,
-1.061409, -0.8651174, -3.09822, 1, 0.8470588, 0, 1,
-1.05363, -0.1132136, -1.443743, 1, 0.8509804, 0, 1,
-1.041182, 0.5881264, -0.9066618, 1, 0.8588235, 0, 1,
-1.030699, -1.370377, -3.326714, 1, 0.8627451, 0, 1,
-1.025399, -0.6258282, -4.013022, 1, 0.8705882, 0, 1,
-1.025367, -0.4341886, -2.547263, 1, 0.8745098, 0, 1,
-1.020702, -2.152087, -3.047849, 1, 0.8823529, 0, 1,
-1.01388, 0.8595443, -0.5348414, 1, 0.8862745, 0, 1,
-1.013135, 0.6002328, -2.235127, 1, 0.8941177, 0, 1,
-1.001633, 0.1713026, -1.319343, 1, 0.8980392, 0, 1,
-1.001182, -1.492297, -2.140042, 1, 0.9058824, 0, 1,
-0.9996029, -0.4573712, -1.473932, 1, 0.9137255, 0, 1,
-0.9937041, 0.8315673, -2.567027, 1, 0.9176471, 0, 1,
-0.9885722, 1.260502, -1.207945, 1, 0.9254902, 0, 1,
-0.9808567, -0.6556582, -2.486265, 1, 0.9294118, 0, 1,
-0.974377, -1.540467, -2.468446, 1, 0.9372549, 0, 1,
-0.970521, 0.5723742, -0.9075997, 1, 0.9411765, 0, 1,
-0.9695379, 2.564878, -2.373581, 1, 0.9490196, 0, 1,
-0.9684319, 1.257456, 1.022003, 1, 0.9529412, 0, 1,
-0.9576737, 0.6949559, 0.3258025, 1, 0.9607843, 0, 1,
-0.9543824, -0.9540842, -2.813239, 1, 0.9647059, 0, 1,
-0.9522404, -0.4961536, -2.126151, 1, 0.972549, 0, 1,
-0.9522318, -1.171232, -3.399039, 1, 0.9764706, 0, 1,
-0.9488155, 0.5363198, -1.626034, 1, 0.9843137, 0, 1,
-0.9460462, -0.5883365, -2.380665, 1, 0.9882353, 0, 1,
-0.9434499, 3.087711, -2.325071, 1, 0.9960784, 0, 1,
-0.9368122, 0.4641528, -1.579542, 0.9960784, 1, 0, 1,
-0.9351826, -1.289873, -2.121674, 0.9921569, 1, 0, 1,
-0.9302009, 0.03690847, -1.839652, 0.9843137, 1, 0, 1,
-0.9289029, -1.691456, -3.361407, 0.9803922, 1, 0, 1,
-0.9207036, -0.8727908, -1.391699, 0.972549, 1, 0, 1,
-0.9192642, 1.654561, 0.04400481, 0.9686275, 1, 0, 1,
-0.9190741, 0.2733806, -1.25238, 0.9607843, 1, 0, 1,
-0.9188908, -1.284851, -3.50622, 0.9568627, 1, 0, 1,
-0.9184043, 1.441319, -0.4802059, 0.9490196, 1, 0, 1,
-0.9100482, 1.580323, 0.151482, 0.945098, 1, 0, 1,
-0.9089453, 0.4781678, -3.303515, 0.9372549, 1, 0, 1,
-0.9038258, -0.07101921, -3.704609, 0.9333333, 1, 0, 1,
-0.9016547, -1.479251, -0.8362741, 0.9254902, 1, 0, 1,
-0.8969096, -2.613822, -3.494305, 0.9215686, 1, 0, 1,
-0.8934739, -0.09615313, -2.032275, 0.9137255, 1, 0, 1,
-0.8919545, -0.06191318, -0.7773244, 0.9098039, 1, 0, 1,
-0.8903063, -0.8448351, -2.560089, 0.9019608, 1, 0, 1,
-0.8873625, 2.148659, 0.02450368, 0.8941177, 1, 0, 1,
-0.8824068, 0.1191751, -2.799847, 0.8901961, 1, 0, 1,
-0.8813714, -0.5740023, -2.036507, 0.8823529, 1, 0, 1,
-0.8776454, 0.1414199, -1.104694, 0.8784314, 1, 0, 1,
-0.8730626, 0.08918843, -1.781318, 0.8705882, 1, 0, 1,
-0.8657722, -0.006759484, -1.223173, 0.8666667, 1, 0, 1,
-0.8646889, 0.1675006, 0.02688785, 0.8588235, 1, 0, 1,
-0.8577685, 1.114902, -1.072579, 0.854902, 1, 0, 1,
-0.8568653, 1.380792, -0.9127174, 0.8470588, 1, 0, 1,
-0.8428633, -1.559271, -3.47108, 0.8431373, 1, 0, 1,
-0.8423762, 0.2848288, 0.5223755, 0.8352941, 1, 0, 1,
-0.8401039, 2.308042, 0.1932216, 0.8313726, 1, 0, 1,
-0.834708, -0.4558134, -1.495257, 0.8235294, 1, 0, 1,
-0.8343616, 0.4229018, -0.8711627, 0.8196079, 1, 0, 1,
-0.8290298, -0.364311, -1.079323, 0.8117647, 1, 0, 1,
-0.8275913, 0.9635444, -1.48613, 0.8078431, 1, 0, 1,
-0.8270442, -2.073262, -3.93839, 0.8, 1, 0, 1,
-0.821965, 0.108104, -1.543571, 0.7921569, 1, 0, 1,
-0.8199657, -1.04352, -3.61101, 0.7882353, 1, 0, 1,
-0.8146063, -1.338672, -1.564317, 0.7803922, 1, 0, 1,
-0.8138219, 1.381335, -0.7183428, 0.7764706, 1, 0, 1,
-0.812332, 0.1862936, -2.710297, 0.7686275, 1, 0, 1,
-0.8059161, 0.1263414, -1.974201, 0.7647059, 1, 0, 1,
-0.7981437, -0.09336301, 0.3168128, 0.7568628, 1, 0, 1,
-0.7968546, -0.3107052, -1.796267, 0.7529412, 1, 0, 1,
-0.7901239, 1.464715, 0.3251509, 0.7450981, 1, 0, 1,
-0.7864187, -0.9175158, -3.290936, 0.7411765, 1, 0, 1,
-0.7842829, -0.2400733, -1.988387, 0.7333333, 1, 0, 1,
-0.7806165, -0.05973973, -2.419871, 0.7294118, 1, 0, 1,
-0.78021, 0.5112766, -0.8008126, 0.7215686, 1, 0, 1,
-0.7788931, 0.9321674, -2.234999, 0.7176471, 1, 0, 1,
-0.7778047, 0.9544694, -2.552296, 0.7098039, 1, 0, 1,
-0.7761661, -1.501863, -4.168875, 0.7058824, 1, 0, 1,
-0.7712816, 0.1478081, -3.639228, 0.6980392, 1, 0, 1,
-0.768733, -0.8160235, -1.403988, 0.6901961, 1, 0, 1,
-0.7624794, -0.08323412, -1.356161, 0.6862745, 1, 0, 1,
-0.7457033, 0.4902649, -0.8353444, 0.6784314, 1, 0, 1,
-0.7428366, 0.2333856, -3.441894, 0.6745098, 1, 0, 1,
-0.7361625, 0.00782442, -0.305252, 0.6666667, 1, 0, 1,
-0.7360402, -0.5539184, -2.489744, 0.6627451, 1, 0, 1,
-0.7353103, 0.2307887, -2.002192, 0.654902, 1, 0, 1,
-0.7300802, -1.916759, -2.803399, 0.6509804, 1, 0, 1,
-0.7291805, 1.772999, -0.4458636, 0.6431373, 1, 0, 1,
-0.7262987, 0.5670958, -1.510976, 0.6392157, 1, 0, 1,
-0.7163216, -0.5025293, -1.438801, 0.6313726, 1, 0, 1,
-0.7162555, -0.95293, -2.874016, 0.627451, 1, 0, 1,
-0.7076859, 0.7427577, -0.431099, 0.6196079, 1, 0, 1,
-0.7059199, 0.5462969, -1.861423, 0.6156863, 1, 0, 1,
-0.7035559, 1.297489, 0.9042996, 0.6078432, 1, 0, 1,
-0.7035365, 0.9204482, 0.4184228, 0.6039216, 1, 0, 1,
-0.7019927, 1.113736, -0.1251054, 0.5960785, 1, 0, 1,
-0.6977005, 0.07521153, -1.651469, 0.5882353, 1, 0, 1,
-0.6968157, 1.176614, -1.155621, 0.5843138, 1, 0, 1,
-0.6907566, 1.190572, 0.1080667, 0.5764706, 1, 0, 1,
-0.6880757, -0.2159631, -2.028199, 0.572549, 1, 0, 1,
-0.6829022, -1.026922, -2.312999, 0.5647059, 1, 0, 1,
-0.6823238, -2.153382, -2.988451, 0.5607843, 1, 0, 1,
-0.6818338, -1.097319, -2.771303, 0.5529412, 1, 0, 1,
-0.6765539, 0.3324147, -1.694549, 0.5490196, 1, 0, 1,
-0.673633, -0.377127, -0.4085318, 0.5411765, 1, 0, 1,
-0.6707116, -0.1190947, -4.15763, 0.5372549, 1, 0, 1,
-0.6685053, 1.441138, -1.39511, 0.5294118, 1, 0, 1,
-0.6656755, 0.8268564, 0.6090761, 0.5254902, 1, 0, 1,
-0.6606136, -0.04093527, -0.4963618, 0.5176471, 1, 0, 1,
-0.6596959, 0.8861789, -1.271513, 0.5137255, 1, 0, 1,
-0.6590313, -0.6272747, -4.336984, 0.5058824, 1, 0, 1,
-0.6565397, 0.2341505, -2.149883, 0.5019608, 1, 0, 1,
-0.6562506, -0.318797, -1.111274, 0.4941176, 1, 0, 1,
-0.6471776, 0.1274343, -1.582516, 0.4862745, 1, 0, 1,
-0.6452032, -0.94381, -2.124882, 0.4823529, 1, 0, 1,
-0.641547, 0.8429165, -2.034265, 0.4745098, 1, 0, 1,
-0.6357361, 1.239701, -0.2913658, 0.4705882, 1, 0, 1,
-0.6290335, -2.033348, -1.779571, 0.4627451, 1, 0, 1,
-0.6232451, -0.5202388, -1.341788, 0.4588235, 1, 0, 1,
-0.6227894, 0.4701089, -1.202444, 0.4509804, 1, 0, 1,
-0.6192453, -0.408307, -2.975222, 0.4470588, 1, 0, 1,
-0.6185955, 0.9727451, -2.494255, 0.4392157, 1, 0, 1,
-0.6145809, 0.7017739, -0.6370948, 0.4352941, 1, 0, 1,
-0.610381, -0.1729783, -1.320902, 0.427451, 1, 0, 1,
-0.6011958, -0.8030301, -1.458175, 0.4235294, 1, 0, 1,
-0.6010117, 0.2252337, -1.898624, 0.4156863, 1, 0, 1,
-0.5970732, 2.357699, 0.2739723, 0.4117647, 1, 0, 1,
-0.596426, 1.439179, 0.9523083, 0.4039216, 1, 0, 1,
-0.5964115, 0.03638466, -1.627905, 0.3960784, 1, 0, 1,
-0.5963551, -1.329255, -2.213727, 0.3921569, 1, 0, 1,
-0.5962916, 0.2180531, -3.178774, 0.3843137, 1, 0, 1,
-0.5954137, -0.7462111, -2.041036, 0.3803922, 1, 0, 1,
-0.5864209, 0.7611791, -0.8233886, 0.372549, 1, 0, 1,
-0.5844451, 0.9216348, -0.8379659, 0.3686275, 1, 0, 1,
-0.5842493, -0.63954, -0.8831816, 0.3607843, 1, 0, 1,
-0.5802414, 0.6105137, -2.272983, 0.3568628, 1, 0, 1,
-0.5796942, -2.081125, -2.229647, 0.3490196, 1, 0, 1,
-0.5784142, 0.3963397, -2.801229, 0.345098, 1, 0, 1,
-0.575299, -0.2880562, -3.987937, 0.3372549, 1, 0, 1,
-0.5722506, -0.1856588, -2.153251, 0.3333333, 1, 0, 1,
-0.56178, 1.414439, -0.02708879, 0.3254902, 1, 0, 1,
-0.5559945, -0.6199777, -1.553193, 0.3215686, 1, 0, 1,
-0.5555552, -0.1212996, -2.94699, 0.3137255, 1, 0, 1,
-0.5526238, -0.6721386, -2.522857, 0.3098039, 1, 0, 1,
-0.5515618, 0.7641235, 0.8390425, 0.3019608, 1, 0, 1,
-0.551494, -2.695003, -2.627302, 0.2941177, 1, 0, 1,
-0.5510591, -0.721017, -1.54126, 0.2901961, 1, 0, 1,
-0.5432804, 0.1903758, -1.564204, 0.282353, 1, 0, 1,
-0.5408561, -0.3017844, -3.228004, 0.2784314, 1, 0, 1,
-0.5407603, 0.08617022, -1.988028, 0.2705882, 1, 0, 1,
-0.5385327, 1.216449, -1.374071, 0.2666667, 1, 0, 1,
-0.5377259, 1.071131, 0.6105276, 0.2588235, 1, 0, 1,
-0.5372151, -0.07862332, -2.062774, 0.254902, 1, 0, 1,
-0.5355904, -0.8950542, -2.040519, 0.2470588, 1, 0, 1,
-0.5343345, 0.3819205, -1.655373, 0.2431373, 1, 0, 1,
-0.5301605, -1.347774, -2.912638, 0.2352941, 1, 0, 1,
-0.5295317, -0.2593702, -1.397836, 0.2313726, 1, 0, 1,
-0.5287878, -0.8967099, -3.224765, 0.2235294, 1, 0, 1,
-0.5224932, -0.04865384, -2.610785, 0.2196078, 1, 0, 1,
-0.5212376, 0.7285573, -2.150508, 0.2117647, 1, 0, 1,
-0.5205927, 0.7714359, -0.3602377, 0.2078431, 1, 0, 1,
-0.5193283, -0.6836958, -2.250572, 0.2, 1, 0, 1,
-0.5187379, 0.3607506, 0.3740146, 0.1921569, 1, 0, 1,
-0.5162287, 0.5346817, 0.3834575, 0.1882353, 1, 0, 1,
-0.5130518, 1.682665, 1.185028, 0.1803922, 1, 0, 1,
-0.5103152, 0.6110038, -1.711244, 0.1764706, 1, 0, 1,
-0.5081819, 1.950868, 0.2869101, 0.1686275, 1, 0, 1,
-0.5019962, -0.6305065, -2.401788, 0.1647059, 1, 0, 1,
-0.4991008, -1.370488, -2.226866, 0.1568628, 1, 0, 1,
-0.4979555, -1.374421, -3.429682, 0.1529412, 1, 0, 1,
-0.4954625, 1.238431, 0.8614769, 0.145098, 1, 0, 1,
-0.4949883, 1.737639, -0.8488308, 0.1411765, 1, 0, 1,
-0.4939003, 0.544144, -1.942464, 0.1333333, 1, 0, 1,
-0.4913373, -1.298956, -2.009593, 0.1294118, 1, 0, 1,
-0.4901321, -0.1843445, -0.7359247, 0.1215686, 1, 0, 1,
-0.4837682, -1.624076, -2.444798, 0.1176471, 1, 0, 1,
-0.482219, 0.8980732, -1.069663, 0.1098039, 1, 0, 1,
-0.4797282, 1.288466, 1.034442, 0.1058824, 1, 0, 1,
-0.4714423, 0.2189208, -0.5132492, 0.09803922, 1, 0, 1,
-0.470861, -0.8788202, -2.59176, 0.09019608, 1, 0, 1,
-0.4708553, 0.3619745, -0.3413035, 0.08627451, 1, 0, 1,
-0.4707818, 0.9847397, -1.744515, 0.07843138, 1, 0, 1,
-0.4680518, 1.457251, 0.004951681, 0.07450981, 1, 0, 1,
-0.4645492, 0.3928559, -3.782988, 0.06666667, 1, 0, 1,
-0.4598328, -0.4571136, -2.330099, 0.0627451, 1, 0, 1,
-0.4595633, -0.8258066, -2.148023, 0.05490196, 1, 0, 1,
-0.4587923, 0.9817479, 0.2856656, 0.05098039, 1, 0, 1,
-0.4578571, 0.02778953, -1.890887, 0.04313726, 1, 0, 1,
-0.4571075, -0.5860229, -1.912272, 0.03921569, 1, 0, 1,
-0.4505973, -1.067713, -3.146754, 0.03137255, 1, 0, 1,
-0.4502569, -0.3097052, -1.769543, 0.02745098, 1, 0, 1,
-0.4499174, 1.154378, 0.4819716, 0.01960784, 1, 0, 1,
-0.4476234, -2.505352, -2.144639, 0.01568628, 1, 0, 1,
-0.4466162, 0.7238926, -1.266317, 0.007843138, 1, 0, 1,
-0.4462295, 1.423908, 0.08775293, 0.003921569, 1, 0, 1,
-0.4454944, -0.7105706, -2.44697, 0, 1, 0.003921569, 1,
-0.4441189, -0.3040738, -3.045731, 0, 1, 0.01176471, 1,
-0.4440925, 1.387599, 0.1162337, 0, 1, 0.01568628, 1,
-0.442904, -0.02811264, -0.2220017, 0, 1, 0.02352941, 1,
-0.4295976, -0.8050637, -1.555974, 0, 1, 0.02745098, 1,
-0.4278735, -1.83741, -2.016902, 0, 1, 0.03529412, 1,
-0.4234939, -0.5282037, -1.344104, 0, 1, 0.03921569, 1,
-0.4213817, 0.8629057, -0.6995631, 0, 1, 0.04705882, 1,
-0.4189925, -1.292534, -3.696658, 0, 1, 0.05098039, 1,
-0.416956, 1.511371, 0.03352174, 0, 1, 0.05882353, 1,
-0.4155672, -0.7310879, -2.45494, 0, 1, 0.0627451, 1,
-0.4135576, -0.5888519, -2.819099, 0, 1, 0.07058824, 1,
-0.412506, 0.5314459, -2.704935, 0, 1, 0.07450981, 1,
-0.4072263, 0.3888917, 0.8692872, 0, 1, 0.08235294, 1,
-0.4052598, 1.077166, 1.523535, 0, 1, 0.08627451, 1,
-0.4032213, -0.6253096, -3.687196, 0, 1, 0.09411765, 1,
-0.400014, 1.891775, 0.09485543, 0, 1, 0.1019608, 1,
-0.3999504, -1.471818, -2.770606, 0, 1, 0.1058824, 1,
-0.3997087, 0.7048953, 0.1307434, 0, 1, 0.1137255, 1,
-0.3911565, 1.135913, -0.99848, 0, 1, 0.1176471, 1,
-0.388533, 0.5179617, -0.6884231, 0, 1, 0.1254902, 1,
-0.3865481, -0.2861897, -2.732913, 0, 1, 0.1294118, 1,
-0.3802332, 0.115671, -1.52266, 0, 1, 0.1372549, 1,
-0.3765486, 1.648633, -1.474092, 0, 1, 0.1411765, 1,
-0.3698844, 1.332291, -2.224072, 0, 1, 0.1490196, 1,
-0.367849, -0.3202218, -2.986838, 0, 1, 0.1529412, 1,
-0.3657432, 1.203405, -0.3557983, 0, 1, 0.1607843, 1,
-0.3650917, -0.1645515, -2.704997, 0, 1, 0.1647059, 1,
-0.3599133, 0.4328498, -0.670747, 0, 1, 0.172549, 1,
-0.3588676, 1.389662, 0.1047805, 0, 1, 0.1764706, 1,
-0.3485765, -0.1311319, -1.277681, 0, 1, 0.1843137, 1,
-0.3482212, -1.336678, -2.813151, 0, 1, 0.1882353, 1,
-0.3438072, -1.245037, -1.953676, 0, 1, 0.1960784, 1,
-0.3394707, 0.506529, -0.5720846, 0, 1, 0.2039216, 1,
-0.3355092, -0.15758, -0.799767, 0, 1, 0.2078431, 1,
-0.3306061, -0.9979542, -2.936798, 0, 1, 0.2156863, 1,
-0.330539, 0.3078008, -0.8267677, 0, 1, 0.2196078, 1,
-0.3299956, 0.1656315, -0.06313722, 0, 1, 0.227451, 1,
-0.3292565, -0.7382672, -3.517973, 0, 1, 0.2313726, 1,
-0.327423, -1.031752, -4.601053, 0, 1, 0.2392157, 1,
-0.3204818, -0.4255685, -2.57392, 0, 1, 0.2431373, 1,
-0.319156, 0.3946065, -0.9298465, 0, 1, 0.2509804, 1,
-0.3162932, -0.2419093, -1.624456, 0, 1, 0.254902, 1,
-0.310487, 0.367127, -0.6317449, 0, 1, 0.2627451, 1,
-0.3079145, -0.1426326, -1.899934, 0, 1, 0.2666667, 1,
-0.3042202, 1.428951, -2.391284, 0, 1, 0.2745098, 1,
-0.3001882, 0.3975022, -0.8832429, 0, 1, 0.2784314, 1,
-0.2985701, 1.435014, 1.466603, 0, 1, 0.2862745, 1,
-0.2967507, 0.7152167, 0.1680627, 0, 1, 0.2901961, 1,
-0.2966667, -0.0110459, -1.342928, 0, 1, 0.2980392, 1,
-0.2961928, 0.07026077, 0.4389376, 0, 1, 0.3058824, 1,
-0.2952393, 1.581482, -0.008235132, 0, 1, 0.3098039, 1,
-0.2933294, 1.267168, 1.581491, 0, 1, 0.3176471, 1,
-0.2932095, -0.7523481, -3.288206, 0, 1, 0.3215686, 1,
-0.2927395, 1.58976, -0.3017257, 0, 1, 0.3294118, 1,
-0.292378, -0.0457135, -1.432418, 0, 1, 0.3333333, 1,
-0.2755818, -1.150995, -1.66603, 0, 1, 0.3411765, 1,
-0.2731627, -2.134704, -0.4840312, 0, 1, 0.345098, 1,
-0.2703748, -0.5049876, -2.505543, 0, 1, 0.3529412, 1,
-0.2701124, -0.2387552, -2.527864, 0, 1, 0.3568628, 1,
-0.2682557, -0.1919004, -2.120692, 0, 1, 0.3647059, 1,
-0.2651652, -0.03480021, -1.302597, 0, 1, 0.3686275, 1,
-0.2649572, -0.9619687, -3.442359, 0, 1, 0.3764706, 1,
-0.2636205, 1.518928, -2.068994, 0, 1, 0.3803922, 1,
-0.2613437, -0.8913407, -2.533905, 0, 1, 0.3882353, 1,
-0.2565671, -1.298953, -3.780013, 0, 1, 0.3921569, 1,
-0.2563281, -0.5959315, -3.951266, 0, 1, 0.4, 1,
-0.251649, -0.598796, -3.436154, 0, 1, 0.4078431, 1,
-0.2463831, 0.4944429, -0.1374013, 0, 1, 0.4117647, 1,
-0.2449917, -0.1657227, -1.696726, 0, 1, 0.4196078, 1,
-0.2425514, -0.3468683, -1.467052, 0, 1, 0.4235294, 1,
-0.2425125, -0.2137698, -2.633318, 0, 1, 0.4313726, 1,
-0.2407956, -1.689345, -2.221478, 0, 1, 0.4352941, 1,
-0.2399471, -0.6905283, -3.869263, 0, 1, 0.4431373, 1,
-0.2394773, 1.20129, 0.7802851, 0, 1, 0.4470588, 1,
-0.2390255, -0.922864, -3.344678, 0, 1, 0.454902, 1,
-0.2344231, 0.6108929, 0.6351832, 0, 1, 0.4588235, 1,
-0.2326108, 0.5208617, -0.7209862, 0, 1, 0.4666667, 1,
-0.2313787, -1.201035, -3.916049, 0, 1, 0.4705882, 1,
-0.2269954, -0.376225, -2.780782, 0, 1, 0.4784314, 1,
-0.2220447, 1.507141, 0.4120694, 0, 1, 0.4823529, 1,
-0.2202796, 0.1119369, 2.172025, 0, 1, 0.4901961, 1,
-0.2190625, 0.3267183, 1.645396, 0, 1, 0.4941176, 1,
-0.2153508, -1.912375, -3.261287, 0, 1, 0.5019608, 1,
-0.2144644, 0.5137107, 1.289079, 0, 1, 0.509804, 1,
-0.2141273, 0.81364, 1.015896, 0, 1, 0.5137255, 1,
-0.2141154, -0.3684722, -2.634961, 0, 1, 0.5215687, 1,
-0.2135289, -0.1215874, -1.996611, 0, 1, 0.5254902, 1,
-0.2134093, 0.5130044, 0.2694522, 0, 1, 0.5333334, 1,
-0.2128958, 0.5040578, -1.299392, 0, 1, 0.5372549, 1,
-0.2111869, -2.748214, -3.147085, 0, 1, 0.5450981, 1,
-0.2111825, -1.49584, -3.849336, 0, 1, 0.5490196, 1,
-0.2093003, 1.29619, 2.383043, 0, 1, 0.5568628, 1,
-0.2053322, 0.397371, -1.025207, 0, 1, 0.5607843, 1,
-0.2046312, -2.177427, -4.618686, 0, 1, 0.5686275, 1,
-0.2035566, 2.250802, -1.739803, 0, 1, 0.572549, 1,
-0.2034088, -0.8085843, -2.790721, 0, 1, 0.5803922, 1,
-0.2026566, -0.1862743, -0.9537833, 0, 1, 0.5843138, 1,
-0.2009413, 0.8254392, -0.5319631, 0, 1, 0.5921569, 1,
-0.1959724, -1.57282, -2.176578, 0, 1, 0.5960785, 1,
-0.1949172, -0.3838389, -3.620459, 0, 1, 0.6039216, 1,
-0.1902716, -0.2249392, -2.786146, 0, 1, 0.6117647, 1,
-0.1872398, 1.112092, 0.9461911, 0, 1, 0.6156863, 1,
-0.1869354, -2.310142, -3.883599, 0, 1, 0.6235294, 1,
-0.1835419, -0.4085958, -2.286954, 0, 1, 0.627451, 1,
-0.1824017, 0.7492117, -1.036587, 0, 1, 0.6352941, 1,
-0.1819551, -0.5767648, -3.383268, 0, 1, 0.6392157, 1,
-0.1744046, -1.345641, -3.971973, 0, 1, 0.6470588, 1,
-0.1726174, -1.672493, -3.655632, 0, 1, 0.6509804, 1,
-0.1725935, -0.092148, -1.09947, 0, 1, 0.6588235, 1,
-0.1718816, 0.3149643, -0.1241237, 0, 1, 0.6627451, 1,
-0.1714901, 0.83269, -0.2159702, 0, 1, 0.6705883, 1,
-0.1708507, 1.195271, -1.237348, 0, 1, 0.6745098, 1,
-0.1705646, -1.447512, -2.660846, 0, 1, 0.682353, 1,
-0.1589716, 0.53873, -0.3517319, 0, 1, 0.6862745, 1,
-0.1589457, -1.409713, -3.164812, 0, 1, 0.6941177, 1,
-0.157519, -0.08510374, -1.039531, 0, 1, 0.7019608, 1,
-0.1562039, -0.6006063, -4.228878, 0, 1, 0.7058824, 1,
-0.1475404, 1.874521, -1.629681, 0, 1, 0.7137255, 1,
-0.1469892, 0.02403789, -0.5739564, 0, 1, 0.7176471, 1,
-0.1409849, -1.347284, -4.758598, 0, 1, 0.7254902, 1,
-0.13969, 0.4916411, -1.731233, 0, 1, 0.7294118, 1,
-0.1396332, -1.45097, -3.246862, 0, 1, 0.7372549, 1,
-0.1393281, -1.966217, -3.649186, 0, 1, 0.7411765, 1,
-0.1354158, 0.5522295, -0.03056624, 0, 1, 0.7490196, 1,
-0.1333874, -0.5748415, -3.793126, 0, 1, 0.7529412, 1,
-0.1266104, -0.9281672, -4.883432, 0, 1, 0.7607843, 1,
-0.1220439, -0.5403291, -4.180285, 0, 1, 0.7647059, 1,
-0.1202235, -1.177845, -3.597447, 0, 1, 0.772549, 1,
-0.1178033, -1.916881, -3.386977, 0, 1, 0.7764706, 1,
-0.1148751, -0.1975666, -2.335642, 0, 1, 0.7843137, 1,
-0.1123879, -1.854352, -2.624285, 0, 1, 0.7882353, 1,
-0.1119447, 0.9078957, 1.561642, 0, 1, 0.7960784, 1,
-0.1119033, -0.0004952716, -1.952032, 0, 1, 0.8039216, 1,
-0.1112907, 1.075602, 0.2565781, 0, 1, 0.8078431, 1,
-0.1088962, 0.4148361, 0.2149573, 0, 1, 0.8156863, 1,
-0.1075256, 0.2504412, -0.4544094, 0, 1, 0.8196079, 1,
-0.1030916, -0.7025809, -2.917387, 0, 1, 0.827451, 1,
-0.101573, 0.9296963, -2.305566, 0, 1, 0.8313726, 1,
-0.09783602, 0.6742884, -1.291698, 0, 1, 0.8392157, 1,
-0.09619194, 1.212383, -0.8459648, 0, 1, 0.8431373, 1,
-0.09451406, 1.941824, 0.9231746, 0, 1, 0.8509804, 1,
-0.09341437, 0.05958459, -0.05175247, 0, 1, 0.854902, 1,
-0.08752269, 0.5991446, 0.9276292, 0, 1, 0.8627451, 1,
-0.08618186, 1.373061, -1.084526, 0, 1, 0.8666667, 1,
-0.08431943, -1.055915, -2.53968, 0, 1, 0.8745098, 1,
-0.0839745, -0.7847512, -2.548975, 0, 1, 0.8784314, 1,
-0.08224559, -0.3854551, -3.325887, 0, 1, 0.8862745, 1,
-0.07692662, -1.002585, -1.880545, 0, 1, 0.8901961, 1,
-0.07265171, -0.989233, -3.817519, 0, 1, 0.8980392, 1,
-0.07264072, 0.9622871, 3.171429, 0, 1, 0.9058824, 1,
-0.07157294, 0.1243128, -0.09587682, 0, 1, 0.9098039, 1,
-0.07104953, 0.408924, 0.7974579, 0, 1, 0.9176471, 1,
-0.07034539, -0.606365, -1.156474, 0, 1, 0.9215686, 1,
-0.07026574, -0.109911, -3.297642, 0, 1, 0.9294118, 1,
-0.06642334, 2.198929, -0.4712669, 0, 1, 0.9333333, 1,
-0.06504257, -0.8912844, -3.645183, 0, 1, 0.9411765, 1,
-0.06478265, 0.0859644, 1.338288, 0, 1, 0.945098, 1,
-0.06431742, -1.731355, -3.372826, 0, 1, 0.9529412, 1,
-0.06305719, -0.08166754, -2.611124, 0, 1, 0.9568627, 1,
-0.06169795, -0.2101896, -3.071027, 0, 1, 0.9647059, 1,
-0.05792463, -1.092939, -3.36889, 0, 1, 0.9686275, 1,
-0.05632148, -0.1000464, -0.3346754, 0, 1, 0.9764706, 1,
-0.05514717, -0.9071257, -2.667304, 0, 1, 0.9803922, 1,
-0.05340052, -0.06921866, -1.697842, 0, 1, 0.9882353, 1,
-0.048781, -0.09078921, -2.764808, 0, 1, 0.9921569, 1,
-0.04792115, -1.427805, -4.062974, 0, 1, 1, 1,
-0.04580581, -0.968088, -4.580589, 0, 0.9921569, 1, 1,
-0.04104206, -1.125415, -4.068045, 0, 0.9882353, 1, 1,
-0.04076521, 0.3639156, 0.2559378, 0, 0.9803922, 1, 1,
-0.04050621, 0.6507326, 0.7572207, 0, 0.9764706, 1, 1,
-0.03764931, 1.90548, -1.461034, 0, 0.9686275, 1, 1,
-0.03399641, 0.3753611, -0.4237481, 0, 0.9647059, 1, 1,
-0.03067279, 0.1539403, 0.4260413, 0, 0.9568627, 1, 1,
-0.02901491, 0.366726, -0.5100623, 0, 0.9529412, 1, 1,
-0.0234576, -1.203769, 0.3990299, 0, 0.945098, 1, 1,
-0.02331237, -0.03898967, -4.434894, 0, 0.9411765, 1, 1,
-0.02306738, -1.47206, -3.341782, 0, 0.9333333, 1, 1,
-0.01948983, 1.073773, 0.7353418, 0, 0.9294118, 1, 1,
-0.01927856, -0.3305124, -4.055897, 0, 0.9215686, 1, 1,
-0.0152853, 0.7353443, -1.519369, 0, 0.9176471, 1, 1,
-0.008964732, -0.8466365, -1.068012, 0, 0.9098039, 1, 1,
-0.007425108, 0.3569551, -0.9225063, 0, 0.9058824, 1, 1,
-0.005606114, 1.224726, -0.9523524, 0, 0.8980392, 1, 1,
-0.005180371, 1.8995, -0.6840725, 0, 0.8901961, 1, 1,
-0.003821766, -1.354825, -0.9124295, 0, 0.8862745, 1, 1,
-0.0002558169, -0.8427352, -3.605931, 0, 0.8784314, 1, 1,
7.576441e-05, 0.4620197, 0.254027, 0, 0.8745098, 1, 1,
0.0004046517, -0.5315443, 3.50552, 0, 0.8666667, 1, 1,
0.0008939843, 0.4323077, -0.6018216, 0, 0.8627451, 1, 1,
0.0009459076, -0.3178774, 3.338283, 0, 0.854902, 1, 1,
0.001945604, 1.180097, -0.8672553, 0, 0.8509804, 1, 1,
0.002956192, -1.263087, 4.091271, 0, 0.8431373, 1, 1,
0.005853654, 1.512327, 0.8701156, 0, 0.8392157, 1, 1,
0.01192209, -0.7782959, 3.44226, 0, 0.8313726, 1, 1,
0.01281961, 0.7770535, -0.2471638, 0, 0.827451, 1, 1,
0.01452404, 1.275812, -1.048892, 0, 0.8196079, 1, 1,
0.02440432, -0.4712019, 3.029615, 0, 0.8156863, 1, 1,
0.02583396, -0.0142821, 2.143894, 0, 0.8078431, 1, 1,
0.02741798, 0.2873438, 0.7576228, 0, 0.8039216, 1, 1,
0.02895063, 0.3281358, 1.014341, 0, 0.7960784, 1, 1,
0.02921617, 0.8569323, 1.107313, 0, 0.7882353, 1, 1,
0.03727913, -0.4121267, 1.955153, 0, 0.7843137, 1, 1,
0.03757306, 0.153006, -0.4163625, 0, 0.7764706, 1, 1,
0.0430624, -0.3451346, 2.587277, 0, 0.772549, 1, 1,
0.0443849, -0.3191525, 2.253236, 0, 0.7647059, 1, 1,
0.0445938, 1.673947, -0.297933, 0, 0.7607843, 1, 1,
0.04862386, -0.7892544, 4.145789, 0, 0.7529412, 1, 1,
0.0530072, 1.48177, 0.02282736, 0, 0.7490196, 1, 1,
0.05384509, -0.7451179, 4.26739, 0, 0.7411765, 1, 1,
0.06105857, -0.4267188, 2.370264, 0, 0.7372549, 1, 1,
0.06386584, -0.8871264, 2.558479, 0, 0.7294118, 1, 1,
0.06575239, -0.4281381, 4.76163, 0, 0.7254902, 1, 1,
0.06630538, -2.479656, 4.73737, 0, 0.7176471, 1, 1,
0.07096849, 1.476426, -1.326305, 0, 0.7137255, 1, 1,
0.07207554, 0.838967, -0.726696, 0, 0.7058824, 1, 1,
0.07328424, -1.082625, 3.002411, 0, 0.6980392, 1, 1,
0.07395844, 1.732403, 0.7106616, 0, 0.6941177, 1, 1,
0.07518038, 0.6730631, 0.5896911, 0, 0.6862745, 1, 1,
0.07654408, 1.071381, 0.02088145, 0, 0.682353, 1, 1,
0.08039683, -0.8405274, 2.791742, 0, 0.6745098, 1, 1,
0.08257471, 1.046297, -1.790539, 0, 0.6705883, 1, 1,
0.0866992, -0.3063522, 3.708803, 0, 0.6627451, 1, 1,
0.09130394, 0.8004712, -2.307903, 0, 0.6588235, 1, 1,
0.09141087, -0.7071693, 3.891334, 0, 0.6509804, 1, 1,
0.09239913, 0.2602544, 0.4434094, 0, 0.6470588, 1, 1,
0.09393866, -0.03405881, 1.97375, 0, 0.6392157, 1, 1,
0.09499907, -0.262546, 2.39772, 0, 0.6352941, 1, 1,
0.09740259, 0.2132447, 0.5082778, 0, 0.627451, 1, 1,
0.09856313, 0.09535721, 0.04644543, 0, 0.6235294, 1, 1,
0.1002906, 0.160417, 0.1265018, 0, 0.6156863, 1, 1,
0.1030798, 0.112195, -0.686665, 0, 0.6117647, 1, 1,
0.1031232, 0.6558809, 2.716694, 0, 0.6039216, 1, 1,
0.1088238, 0.8796078, 0.6203651, 0, 0.5960785, 1, 1,
0.1110845, -0.3236777, 2.869672, 0, 0.5921569, 1, 1,
0.1161646, -0.7650906, 2.526303, 0, 0.5843138, 1, 1,
0.1203482, -1.934563, 2.109645, 0, 0.5803922, 1, 1,
0.12125, 0.06003025, 0.3571644, 0, 0.572549, 1, 1,
0.1229546, -0.4983343, 4.398917, 0, 0.5686275, 1, 1,
0.126632, 0.8901681, 0.6763345, 0, 0.5607843, 1, 1,
0.1326219, -1.173134, 2.435878, 0, 0.5568628, 1, 1,
0.13585, 0.4369174, 0.899543, 0, 0.5490196, 1, 1,
0.1396717, -0.4801819, 2.076607, 0, 0.5450981, 1, 1,
0.150666, 1.029198, -0.3092422, 0, 0.5372549, 1, 1,
0.1537378, 0.1202803, 2.073104, 0, 0.5333334, 1, 1,
0.1546853, -0.3339101, 2.495423, 0, 0.5254902, 1, 1,
0.1552652, 0.05646658, 1.006118, 0, 0.5215687, 1, 1,
0.1563546, -0.8770764, 3.365712, 0, 0.5137255, 1, 1,
0.159107, 0.1604379, 0.5748364, 0, 0.509804, 1, 1,
0.1644537, 0.2909076, -0.1857952, 0, 0.5019608, 1, 1,
0.1645936, 0.3286111, 1.360298, 0, 0.4941176, 1, 1,
0.1690779, -1.030416, 3.170765, 0, 0.4901961, 1, 1,
0.1723194, -0.7204372, 3.063914, 0, 0.4823529, 1, 1,
0.1737483, 1.303543, 0.2242299, 0, 0.4784314, 1, 1,
0.1752843, -0.9567577, 3.645486, 0, 0.4705882, 1, 1,
0.1791081, 2.445642, 0.7727204, 0, 0.4666667, 1, 1,
0.1818374, -0.2386826, 3.173531, 0, 0.4588235, 1, 1,
0.1849585, -1.790205, 3.363858, 0, 0.454902, 1, 1,
0.1855344, 0.4298185, -0.2055775, 0, 0.4470588, 1, 1,
0.1863687, -0.4699802, 3.886179, 0, 0.4431373, 1, 1,
0.1868495, 0.4934082, 1.116327, 0, 0.4352941, 1, 1,
0.1883308, 0.1031064, -0.6285851, 0, 0.4313726, 1, 1,
0.1900777, -0.8665322, 3.004664, 0, 0.4235294, 1, 1,
0.1912457, 1.072936, -0.4886281, 0, 0.4196078, 1, 1,
0.1982002, 1.19259, 0.04925097, 0, 0.4117647, 1, 1,
0.2004159, -1.073526, 2.910069, 0, 0.4078431, 1, 1,
0.2026733, 0.2025187, 1.357167, 0, 0.4, 1, 1,
0.2032442, 0.1318523, 1.795341, 0, 0.3921569, 1, 1,
0.2044801, -0.3992271, 2.831164, 0, 0.3882353, 1, 1,
0.206166, -1.795049, 4.924634, 0, 0.3803922, 1, 1,
0.2067189, -0.9673164, 2.318713, 0, 0.3764706, 1, 1,
0.2073422, 1.647017, -0.8353187, 0, 0.3686275, 1, 1,
0.2074457, -1.892439, 3.023071, 0, 0.3647059, 1, 1,
0.2084902, 1.064594, -0.1330454, 0, 0.3568628, 1, 1,
0.2094278, -0.07518285, 1.790597, 0, 0.3529412, 1, 1,
0.2143406, 2.275255, 0.1699488, 0, 0.345098, 1, 1,
0.2156566, 1.814781, 0.334597, 0, 0.3411765, 1, 1,
0.2157963, -1.129263, 3.13162, 0, 0.3333333, 1, 1,
0.216528, -0.1685511, 0.6225569, 0, 0.3294118, 1, 1,
0.216997, -0.9417009, 2.524848, 0, 0.3215686, 1, 1,
0.2170339, -0.8513017, 5.050968, 0, 0.3176471, 1, 1,
0.220777, -0.124351, 2.421444, 0, 0.3098039, 1, 1,
0.2224085, 1.161664, 0.05278387, 0, 0.3058824, 1, 1,
0.2237082, -0.4012237, 2.251999, 0, 0.2980392, 1, 1,
0.2288879, 1.227352, 0.3517843, 0, 0.2901961, 1, 1,
0.2311831, -0.1774271, 3.292885, 0, 0.2862745, 1, 1,
0.2316969, 0.4819272, -1.058572, 0, 0.2784314, 1, 1,
0.2410702, 0.1213329, 2.688899, 0, 0.2745098, 1, 1,
0.2468183, 0.7297994, 1.459726, 0, 0.2666667, 1, 1,
0.24853, 0.2086506, 1.468999, 0, 0.2627451, 1, 1,
0.253426, -1.341511, 2.36565, 0, 0.254902, 1, 1,
0.2537156, -1.553029, 4.621558, 0, 0.2509804, 1, 1,
0.256937, -0.03734149, 2.332432, 0, 0.2431373, 1, 1,
0.2589659, 1.360398, -0.6278514, 0, 0.2392157, 1, 1,
0.2590751, -1.469215, 2.494304, 0, 0.2313726, 1, 1,
0.2599491, -2.301285, 2.987211, 0, 0.227451, 1, 1,
0.26401, 0.1707504, 2.017703, 0, 0.2196078, 1, 1,
0.264937, 0.108992, -0.4837937, 0, 0.2156863, 1, 1,
0.2649643, 0.8017912, -0.4770361, 0, 0.2078431, 1, 1,
0.2653945, 0.1053855, 1.869766, 0, 0.2039216, 1, 1,
0.265832, -0.7749125, 4.253826, 0, 0.1960784, 1, 1,
0.2668816, -0.5197627, 1.353692, 0, 0.1882353, 1, 1,
0.2675392, 2.115625, 0.2829076, 0, 0.1843137, 1, 1,
0.2695369, -0.005783283, 2.88675, 0, 0.1764706, 1, 1,
0.2705518, 1.47484, 0.4172019, 0, 0.172549, 1, 1,
0.2851958, 0.005039521, 0.5997251, 0, 0.1647059, 1, 1,
0.2858349, -0.2163311, 3.03197, 0, 0.1607843, 1, 1,
0.2916681, -0.1091327, 2.315006, 0, 0.1529412, 1, 1,
0.3004053, -2.344204, 2.233067, 0, 0.1490196, 1, 1,
0.3018623, -0.8343183, 3.215181, 0, 0.1411765, 1, 1,
0.3075314, 0.4487848, 1.732454, 0, 0.1372549, 1, 1,
0.3100733, 0.4563295, 0.4347362, 0, 0.1294118, 1, 1,
0.3195635, -0.9789992, 2.713335, 0, 0.1254902, 1, 1,
0.3220063, 1.551604, -0.6784962, 0, 0.1176471, 1, 1,
0.3232917, -0.07536828, 1.072711, 0, 0.1137255, 1, 1,
0.3289264, -0.6002818, 1.637359, 0, 0.1058824, 1, 1,
0.3299809, -1.067878, 3.439385, 0, 0.09803922, 1, 1,
0.3311746, 0.9063282, 1.008244, 0, 0.09411765, 1, 1,
0.3335998, 0.49032, 0.09581404, 0, 0.08627451, 1, 1,
0.3337629, 0.7161106, 0.5883774, 0, 0.08235294, 1, 1,
0.3343002, 1.237356, -0.1655772, 0, 0.07450981, 1, 1,
0.3394592, -0.3353592, 2.725589, 0, 0.07058824, 1, 1,
0.339732, -0.03746675, 1.156903, 0, 0.0627451, 1, 1,
0.3397594, 1.216706, 0.4740178, 0, 0.05882353, 1, 1,
0.3401658, -0.2533799, 2.374821, 0, 0.05098039, 1, 1,
0.3404241, 0.2367658, 0.3212803, 0, 0.04705882, 1, 1,
0.3447766, -0.3403656, 3.987106, 0, 0.03921569, 1, 1,
0.3538237, -0.7562944, 2.237812, 0, 0.03529412, 1, 1,
0.3555838, -2.092368, 2.912365, 0, 0.02745098, 1, 1,
0.3589053, 0.496128, 0.967228, 0, 0.02352941, 1, 1,
0.3740299, -1.119477, 3.382715, 0, 0.01568628, 1, 1,
0.3743434, 0.7194653, 1.579385, 0, 0.01176471, 1, 1,
0.3782881, -1.087014, 3.211041, 0, 0.003921569, 1, 1,
0.3790566, 1.050929, 0.1788779, 0.003921569, 0, 1, 1,
0.3790914, -0.6676891, 4.161341, 0.007843138, 0, 1, 1,
0.3802948, 0.2411996, 1.393474, 0.01568628, 0, 1, 1,
0.3824704, 0.237396, 1.576078, 0.01960784, 0, 1, 1,
0.3834935, -0.6362693, 1.380914, 0.02745098, 0, 1, 1,
0.3835455, 1.263693, 0.918368, 0.03137255, 0, 1, 1,
0.3855839, 0.8896965, 1.189086, 0.03921569, 0, 1, 1,
0.3869781, 0.1569428, 1.486696, 0.04313726, 0, 1, 1,
0.3976783, 1.629965, 0.4156311, 0.05098039, 0, 1, 1,
0.3995138, -0.1892809, 1.305079, 0.05490196, 0, 1, 1,
0.4005333, -0.5685323, 1.672067, 0.0627451, 0, 1, 1,
0.4013881, -0.4094408, 2.907493, 0.06666667, 0, 1, 1,
0.4024595, 0.5637481, 1.196639, 0.07450981, 0, 1, 1,
0.4061923, -0.4764481, 1.984474, 0.07843138, 0, 1, 1,
0.4080451, 0.6338539, 2.155789, 0.08627451, 0, 1, 1,
0.4129755, 0.2891745, 0.3935053, 0.09019608, 0, 1, 1,
0.4166539, 0.8867885, 2.370959, 0.09803922, 0, 1, 1,
0.4195594, 0.7493734, -0.6417491, 0.1058824, 0, 1, 1,
0.4220445, 0.8430291, 0.2598576, 0.1098039, 0, 1, 1,
0.4228586, 0.03924593, 1.921968, 0.1176471, 0, 1, 1,
0.4243244, 0.5828655, 1.55097, 0.1215686, 0, 1, 1,
0.4307421, -0.06376761, 1.838065, 0.1294118, 0, 1, 1,
0.4316022, 0.2399892, 1.651224, 0.1333333, 0, 1, 1,
0.4349076, -0.5205141, 3.955923, 0.1411765, 0, 1, 1,
0.4365365, 0.008840633, 2.139238, 0.145098, 0, 1, 1,
0.4421003, 1.56665, -0.8827721, 0.1529412, 0, 1, 1,
0.4432591, 0.453352, 0.7521572, 0.1568628, 0, 1, 1,
0.4466649, 2.178328, 0.6287394, 0.1647059, 0, 1, 1,
0.4524766, 0.9415761, 0.4167797, 0.1686275, 0, 1, 1,
0.4525757, 0.8336456, 0.782912, 0.1764706, 0, 1, 1,
0.4527018, -0.5488294, 3.133073, 0.1803922, 0, 1, 1,
0.4560608, -1.634053, 2.064363, 0.1882353, 0, 1, 1,
0.4572386, 0.09260792, 1.632262, 0.1921569, 0, 1, 1,
0.4628741, 0.4042688, 2.485845, 0.2, 0, 1, 1,
0.4676974, 1.522479, 0.337772, 0.2078431, 0, 1, 1,
0.4777593, 0.1692575, 1.068873, 0.2117647, 0, 1, 1,
0.486453, 0.2211332, 1.369513, 0.2196078, 0, 1, 1,
0.4870899, 2.001711, 1.036499, 0.2235294, 0, 1, 1,
0.4894511, -0.07061788, 1.152976, 0.2313726, 0, 1, 1,
0.4909331, 0.3905974, 2.324541, 0.2352941, 0, 1, 1,
0.4928176, -0.8106523, 2.931855, 0.2431373, 0, 1, 1,
0.4988654, -0.3732297, 3.534423, 0.2470588, 0, 1, 1,
0.5052466, 0.09029599, 2.291909, 0.254902, 0, 1, 1,
0.5161025, -1.271351, 3.985222, 0.2588235, 0, 1, 1,
0.5161108, -1.00147, 1.791227, 0.2666667, 0, 1, 1,
0.5162132, -0.1524123, 2.183733, 0.2705882, 0, 1, 1,
0.519667, 0.1166657, 0.5517796, 0.2784314, 0, 1, 1,
0.5244163, -1.57039, 3.675127, 0.282353, 0, 1, 1,
0.5256618, 0.4503465, 2.826651, 0.2901961, 0, 1, 1,
0.533101, 0.3278814, 0.6183431, 0.2941177, 0, 1, 1,
0.5332875, -0.2059744, 1.037257, 0.3019608, 0, 1, 1,
0.5366822, 1.125847, 1.557126, 0.3098039, 0, 1, 1,
0.5415094, -0.3243739, 1.072427, 0.3137255, 0, 1, 1,
0.5489281, 0.8435199, 2.180186, 0.3215686, 0, 1, 1,
0.5507253, 0.4031841, 0.8695493, 0.3254902, 0, 1, 1,
0.5588351, 0.2700056, 2.02762, 0.3333333, 0, 1, 1,
0.5621223, 1.28321, 0.5556431, 0.3372549, 0, 1, 1,
0.5642544, 0.6153738, 1.119025, 0.345098, 0, 1, 1,
0.5725074, 0.3316986, 0.8946261, 0.3490196, 0, 1, 1,
0.5741537, -1.51322, 1.780449, 0.3568628, 0, 1, 1,
0.5765129, -0.5082362, 2.555452, 0.3607843, 0, 1, 1,
0.5799797, -1.154525, 1.621521, 0.3686275, 0, 1, 1,
0.5836079, -0.2810015, 1.383103, 0.372549, 0, 1, 1,
0.5875267, 0.7259698, -0.617837, 0.3803922, 0, 1, 1,
0.5887929, 0.5847707, 1.723166, 0.3843137, 0, 1, 1,
0.59156, 1.398068, -1.94093, 0.3921569, 0, 1, 1,
0.6104751, -1.155946, 3.158075, 0.3960784, 0, 1, 1,
0.6191615, 1.730232, 0.03637994, 0.4039216, 0, 1, 1,
0.6204775, -0.07079701, 0.3783331, 0.4117647, 0, 1, 1,
0.6221272, -0.06370012, 0.984325, 0.4156863, 0, 1, 1,
0.6303198, -3.667827, 1.567785, 0.4235294, 0, 1, 1,
0.633305, -0.7587859, 1.846555, 0.427451, 0, 1, 1,
0.636044, 1.179011, -1.032259, 0.4352941, 0, 1, 1,
0.6375114, -1.653412, 2.91027, 0.4392157, 0, 1, 1,
0.642909, -0.1051166, 3.188828, 0.4470588, 0, 1, 1,
0.6483359, 0.4183356, 1.748579, 0.4509804, 0, 1, 1,
0.6548777, -0.0482229, 1.633483, 0.4588235, 0, 1, 1,
0.6611164, -0.4765314, 2.827061, 0.4627451, 0, 1, 1,
0.6617655, 1.134377, 0.492492, 0.4705882, 0, 1, 1,
0.6625459, -1.08968, 0.6801184, 0.4745098, 0, 1, 1,
0.6668636, -1.527115, 3.683942, 0.4823529, 0, 1, 1,
0.6669618, -0.5181153, 2.108378, 0.4862745, 0, 1, 1,
0.6695522, -0.95441, 1.385569, 0.4941176, 0, 1, 1,
0.6735619, -0.5181459, 2.052484, 0.5019608, 0, 1, 1,
0.6741186, -0.08599626, 2.568086, 0.5058824, 0, 1, 1,
0.6798657, -1.091011, 3.184063, 0.5137255, 0, 1, 1,
0.6813035, -2.278585, 3.401787, 0.5176471, 0, 1, 1,
0.685626, 0.8768076, 2.062738, 0.5254902, 0, 1, 1,
0.6874548, -0.5545425, 1.901287, 0.5294118, 0, 1, 1,
0.6891816, -1.49085, 3.255907, 0.5372549, 0, 1, 1,
0.689863, -0.455964, 2.411239, 0.5411765, 0, 1, 1,
0.690393, -0.7851781, 2.24415, 0.5490196, 0, 1, 1,
0.6957931, -0.3996375, 1.555346, 0.5529412, 0, 1, 1,
0.696815, -1.860475, 2.913704, 0.5607843, 0, 1, 1,
0.6987073, 0.09092586, -0.08707341, 0.5647059, 0, 1, 1,
0.7001786, -1.760165, 2.735736, 0.572549, 0, 1, 1,
0.7028436, 2.502493, -0.6466247, 0.5764706, 0, 1, 1,
0.7099869, -0.09233014, 1.533081, 0.5843138, 0, 1, 1,
0.7105699, -0.417226, 2.235339, 0.5882353, 0, 1, 1,
0.7137656, -1.065318, 1.616232, 0.5960785, 0, 1, 1,
0.7211177, 0.08217233, 2.033654, 0.6039216, 0, 1, 1,
0.7227148, 0.6285477, 0.07435286, 0.6078432, 0, 1, 1,
0.7231977, -0.5685417, 0.6829995, 0.6156863, 0, 1, 1,
0.7286755, -1.266647, 2.655697, 0.6196079, 0, 1, 1,
0.7301136, -0.1619532, 1.998806, 0.627451, 0, 1, 1,
0.7309362, -0.8187047, 2.873603, 0.6313726, 0, 1, 1,
0.738848, -0.153616, 1.371836, 0.6392157, 0, 1, 1,
0.7413595, -0.5465567, 1.706972, 0.6431373, 0, 1, 1,
0.7425271, 0.6228222, 1.02549, 0.6509804, 0, 1, 1,
0.7470108, -0.2967229, 2.054504, 0.654902, 0, 1, 1,
0.7496645, -1.993964, 4.599288, 0.6627451, 0, 1, 1,
0.7570216, -1.327231, 3.430979, 0.6666667, 0, 1, 1,
0.768572, 1.060421, 0.7759471, 0.6745098, 0, 1, 1,
0.7818068, 0.5425335, 0.8650087, 0.6784314, 0, 1, 1,
0.7850617, 1.130311, 0.8094198, 0.6862745, 0, 1, 1,
0.7861444, 0.2111636, -0.05210064, 0.6901961, 0, 1, 1,
0.7870036, 0.3388198, 1.819898, 0.6980392, 0, 1, 1,
0.7875524, 1.763977, -2.492389, 0.7058824, 0, 1, 1,
0.7926056, -0.6017857, 4.292688, 0.7098039, 0, 1, 1,
0.7946289, -1.699158, 2.338706, 0.7176471, 0, 1, 1,
0.7994982, 1.162809, 0.05289376, 0.7215686, 0, 1, 1,
0.8059949, -0.6381821, 2.357784, 0.7294118, 0, 1, 1,
0.8099647, -0.9451183, 4.060972, 0.7333333, 0, 1, 1,
0.8115434, 1.47807, 1.226899, 0.7411765, 0, 1, 1,
0.8121608, 0.2589352, 1.954072, 0.7450981, 0, 1, 1,
0.8151735, 0.4614804, 1.900774, 0.7529412, 0, 1, 1,
0.8194779, -0.2227484, 2.89613, 0.7568628, 0, 1, 1,
0.8198612, -0.02413428, 2.879026, 0.7647059, 0, 1, 1,
0.8267701, -0.08938093, 0.2642287, 0.7686275, 0, 1, 1,
0.8319349, 0.5292587, 0.8449432, 0.7764706, 0, 1, 1,
0.8359728, -1.187898, 2.783876, 0.7803922, 0, 1, 1,
0.8360989, -0.834574, 3.266888, 0.7882353, 0, 1, 1,
0.8431094, -0.6094772, 3.055233, 0.7921569, 0, 1, 1,
0.8436211, 0.4555916, -1.157402, 0.8, 0, 1, 1,
0.8449884, 0.1425305, 1.355399, 0.8078431, 0, 1, 1,
0.8463808, 0.6258179, 1.252914, 0.8117647, 0, 1, 1,
0.8463901, 1.325813, -0.9576968, 0.8196079, 0, 1, 1,
0.8475564, -0.1924308, 0.8201178, 0.8235294, 0, 1, 1,
0.8515785, -0.5393037, 1.939553, 0.8313726, 0, 1, 1,
0.8632337, 0.6527779, 1.393474, 0.8352941, 0, 1, 1,
0.8658928, 0.1716701, 1.322797, 0.8431373, 0, 1, 1,
0.8665251, 0.3797106, 2.040246, 0.8470588, 0, 1, 1,
0.8676146, -0.1882938, 1.552192, 0.854902, 0, 1, 1,
0.868551, 0.7815567, 1.038564, 0.8588235, 0, 1, 1,
0.8707649, 0.1619928, 1.056091, 0.8666667, 0, 1, 1,
0.8727005, 0.9969555, -0.5246415, 0.8705882, 0, 1, 1,
0.8733239, 0.01101969, 2.334277, 0.8784314, 0, 1, 1,
0.8740544, -0.7115983, 2.50365, 0.8823529, 0, 1, 1,
0.8778982, 1.654738, -0.2490174, 0.8901961, 0, 1, 1,
0.8805204, -0.7971631, 1.865207, 0.8941177, 0, 1, 1,
0.8827265, 0.4146166, 1.813085, 0.9019608, 0, 1, 1,
0.8855653, 1.092922, 1.808878, 0.9098039, 0, 1, 1,
0.8895126, -1.458178, 2.562632, 0.9137255, 0, 1, 1,
0.8917446, 0.1088995, 2.167612, 0.9215686, 0, 1, 1,
0.8938861, 1.135993, 1.303887, 0.9254902, 0, 1, 1,
0.899152, 0.3465555, 2.102463, 0.9333333, 0, 1, 1,
0.8998345, 0.6885941, 1.581438, 0.9372549, 0, 1, 1,
0.9015312, 0.01145368, 1.365281, 0.945098, 0, 1, 1,
0.9034579, 1.229769, -0.1621918, 0.9490196, 0, 1, 1,
0.9044521, -1.05431, 3.655236, 0.9568627, 0, 1, 1,
0.9049875, -0.03138907, 0.8726044, 0.9607843, 0, 1, 1,
0.9064553, 1.069584, 1.924309, 0.9686275, 0, 1, 1,
0.9071506, -1.382931, 1.504461, 0.972549, 0, 1, 1,
0.9256663, -0.01890171, 2.159852, 0.9803922, 0, 1, 1,
0.929204, 0.01400344, -0.9629255, 0.9843137, 0, 1, 1,
0.9325247, -1.880212, 2.613766, 0.9921569, 0, 1, 1,
0.9328045, -0.2063462, 1.022925, 0.9960784, 0, 1, 1,
0.9349681, 0.5196446, -0.2057311, 1, 0, 0.9960784, 1,
0.9350592, 0.9162682, 0.7505613, 1, 0, 0.9882353, 1,
0.9353252, 0.2755404, 1.623641, 1, 0, 0.9843137, 1,
0.9399377, -1.955753, 3.580765, 1, 0, 0.9764706, 1,
0.9426873, -0.379148, 3.052812, 1, 0, 0.972549, 1,
0.9583817, -0.6807709, 3.878691, 1, 0, 0.9647059, 1,
0.964065, 0.7776588, 1.357662, 1, 0, 0.9607843, 1,
0.9653401, -1.187944, 3.122216, 1, 0, 0.9529412, 1,
0.9653633, 0.1468549, -0.4988777, 1, 0, 0.9490196, 1,
0.9748161, 2.124502, -1.233997, 1, 0, 0.9411765, 1,
0.9795229, 0.7980009, 1.224696, 1, 0, 0.9372549, 1,
1.004048, 0.04090136, 1.501208, 1, 0, 0.9294118, 1,
1.008147, -1.750911, 2.255003, 1, 0, 0.9254902, 1,
1.011776, 0.6279572, 1.504863, 1, 0, 0.9176471, 1,
1.015589, 0.4733687, 0.4753447, 1, 0, 0.9137255, 1,
1.017071, 1.216052, 1.516931, 1, 0, 0.9058824, 1,
1.021647, 0.2474979, 1.910467, 1, 0, 0.9019608, 1,
1.021973, 0.4422141, 2.352567, 1, 0, 0.8941177, 1,
1.039387, 0.5450007, 1.431038, 1, 0, 0.8862745, 1,
1.040152, -0.7449807, 2.609099, 1, 0, 0.8823529, 1,
1.051568, -0.2658853, 0.9703228, 1, 0, 0.8745098, 1,
1.053298, 0.164679, 0.2279115, 1, 0, 0.8705882, 1,
1.053909, -0.4808374, 3.146373, 1, 0, 0.8627451, 1,
1.055505, -0.8825375, 2.401754, 1, 0, 0.8588235, 1,
1.056293, -2.327609, 3.358034, 1, 0, 0.8509804, 1,
1.057455, -0.3838183, 0.2842396, 1, 0, 0.8470588, 1,
1.068471, 0.05226101, 3.612618, 1, 0, 0.8392157, 1,
1.077337, 0.05113403, 1.880051, 1, 0, 0.8352941, 1,
1.079324, -0.6538277, 0.3924296, 1, 0, 0.827451, 1,
1.088527, -0.1571489, 1.510135, 1, 0, 0.8235294, 1,
1.091239, -1.764192, 3.964864, 1, 0, 0.8156863, 1,
1.091363, 1.652564, 0.1120499, 1, 0, 0.8117647, 1,
1.092029, -0.6229946, 1.233535, 1, 0, 0.8039216, 1,
1.100504, -0.6429891, 2.072211, 1, 0, 0.7960784, 1,
1.100507, -1.002918, 3.457763, 1, 0, 0.7921569, 1,
1.113451, 0.3911703, 2.493976, 1, 0, 0.7843137, 1,
1.117075, 0.4487811, 2.256797, 1, 0, 0.7803922, 1,
1.134382, 0.6270603, 3.005239, 1, 0, 0.772549, 1,
1.134979, 0.7758901, 1.489882, 1, 0, 0.7686275, 1,
1.139906, 0.8899202, -0.2009128, 1, 0, 0.7607843, 1,
1.151082, 0.1764438, 1.16535, 1, 0, 0.7568628, 1,
1.152394, 0.1817888, 2.649487, 1, 0, 0.7490196, 1,
1.152793, 2.106924, 0.8913172, 1, 0, 0.7450981, 1,
1.154577, -1.162721, 1.757664, 1, 0, 0.7372549, 1,
1.157697, -0.4714358, 0.9077553, 1, 0, 0.7333333, 1,
1.162568, -0.006386564, 2.163491, 1, 0, 0.7254902, 1,
1.165605, 1.477963, 1.489184, 1, 0, 0.7215686, 1,
1.166403, 0.293825, 0.5026725, 1, 0, 0.7137255, 1,
1.167143, 1.055909, 3.096035, 1, 0, 0.7098039, 1,
1.17796, 1.258348, -1.761867, 1, 0, 0.7019608, 1,
1.187597, -0.04959518, 1.785716, 1, 0, 0.6941177, 1,
1.19171, 1.169525, 0.5056303, 1, 0, 0.6901961, 1,
1.192578, 1.155185, 0.8581302, 1, 0, 0.682353, 1,
1.195289, -0.1353997, 1.742075, 1, 0, 0.6784314, 1,
1.196565, 1.462501, -0.08557298, 1, 0, 0.6705883, 1,
1.198789, 0.5388409, 0.7815795, 1, 0, 0.6666667, 1,
1.199836, -1.458164, 1.264509, 1, 0, 0.6588235, 1,
1.207658, 1.329122, 0.3740063, 1, 0, 0.654902, 1,
1.221209, 0.764164, 0.9251634, 1, 0, 0.6470588, 1,
1.230704, 1.554669, -0.4713694, 1, 0, 0.6431373, 1,
1.236091, 0.8478966, 0.795335, 1, 0, 0.6352941, 1,
1.238106, -0.7590276, 3.323536, 1, 0, 0.6313726, 1,
1.244838, -1.219324, 1.959578, 1, 0, 0.6235294, 1,
1.247573, 0.2327057, 2.551688, 1, 0, 0.6196079, 1,
1.250192, -0.9476301, 2.414157, 1, 0, 0.6117647, 1,
1.255368, -2.611315, 3.128017, 1, 0, 0.6078432, 1,
1.279683, 0.5145901, 1.718989, 1, 0, 0.6, 1,
1.295548, -1.429, 4.167808, 1, 0, 0.5921569, 1,
1.296547, -1.471174, 0.6599043, 1, 0, 0.5882353, 1,
1.300143, 1.026578, 0.4340543, 1, 0, 0.5803922, 1,
1.304278, -1.312893, 2.315511, 1, 0, 0.5764706, 1,
1.305069, -0.1363224, 0.4153228, 1, 0, 0.5686275, 1,
1.31455, -1.542216, 2.97695, 1, 0, 0.5647059, 1,
1.318867, -1.272586, 3.313589, 1, 0, 0.5568628, 1,
1.328205, -2.090682, 2.633593, 1, 0, 0.5529412, 1,
1.332204, -1.680417, 2.308778, 1, 0, 0.5450981, 1,
1.334817, -0.09850602, 2.460678, 1, 0, 0.5411765, 1,
1.335922, -0.05313051, 1.306857, 1, 0, 0.5333334, 1,
1.348574, 0.139786, 1.665977, 1, 0, 0.5294118, 1,
1.35284, -0.4287713, 2.200829, 1, 0, 0.5215687, 1,
1.35329, 2.076023, 0.7103102, 1, 0, 0.5176471, 1,
1.355362, 0.1870387, 0.2961577, 1, 0, 0.509804, 1,
1.366404, -1.150288, 2.636372, 1, 0, 0.5058824, 1,
1.367896, -0.112128, 2.271814, 1, 0, 0.4980392, 1,
1.369473, -1.516119, 1.564229, 1, 0, 0.4901961, 1,
1.372443, -0.1323701, 3.447619, 1, 0, 0.4862745, 1,
1.383518, -0.8211666, 1.887721, 1, 0, 0.4784314, 1,
1.385308, 0.5819671, 0.3647581, 1, 0, 0.4745098, 1,
1.386598, -1.958197, 2.951571, 1, 0, 0.4666667, 1,
1.38743, 0.3163667, 1.574605, 1, 0, 0.4627451, 1,
1.388068, -1.097045, 2.620114, 1, 0, 0.454902, 1,
1.39565, 0.06078244, 1.148146, 1, 0, 0.4509804, 1,
1.403227, -0.5839064, 2.131262, 1, 0, 0.4431373, 1,
1.403875, 2.9171, -0.0337817, 1, 0, 0.4392157, 1,
1.430432, -0.5250834, 1.328588, 1, 0, 0.4313726, 1,
1.446753, 0.07184885, 0.9275796, 1, 0, 0.427451, 1,
1.447956, 0.6213772, 0.5158383, 1, 0, 0.4196078, 1,
1.448795, -0.8196627, 1.729178, 1, 0, 0.4156863, 1,
1.449061, 0.286303, 2.24008, 1, 0, 0.4078431, 1,
1.452469, -0.4768949, 2.274386, 1, 0, 0.4039216, 1,
1.459249, 0.2322885, 0.8429238, 1, 0, 0.3960784, 1,
1.459906, 1.397692, 0.4897164, 1, 0, 0.3882353, 1,
1.461587, -0.044931, 1.790495, 1, 0, 0.3843137, 1,
1.471508, -1.127335, 2.511773, 1, 0, 0.3764706, 1,
1.478369, -1.043659, 1.343627, 1, 0, 0.372549, 1,
1.479604, 0.1189846, 1.368244, 1, 0, 0.3647059, 1,
1.480507, -1.179089, 2.275678, 1, 0, 0.3607843, 1,
1.480545, -0.3581634, 0.2815536, 1, 0, 0.3529412, 1,
1.498066, 1.166528, 0.6215962, 1, 0, 0.3490196, 1,
1.504404, -2.022301, 2.340491, 1, 0, 0.3411765, 1,
1.506887, -0.5061653, 1.985449, 1, 0, 0.3372549, 1,
1.516105, 0.722545, 2.461135, 1, 0, 0.3294118, 1,
1.52019, -0.2928278, 0.7948093, 1, 0, 0.3254902, 1,
1.551089, 1.295487, 1.824449, 1, 0, 0.3176471, 1,
1.608706, -2.388928, 2.096625, 1, 0, 0.3137255, 1,
1.608914, -0.03238874, 2.175049, 1, 0, 0.3058824, 1,
1.618784, -0.8015156, 0.6331476, 1, 0, 0.2980392, 1,
1.638834, 0.8243429, 0.6118981, 1, 0, 0.2941177, 1,
1.645665, 1.183971, 1.033224, 1, 0, 0.2862745, 1,
1.653246, 0.6851059, 2.251015, 1, 0, 0.282353, 1,
1.657959, -0.5016573, 1.133299, 1, 0, 0.2745098, 1,
1.667191, 0.06930111, 2.013268, 1, 0, 0.2705882, 1,
1.678996, -0.6147561, 1.811168, 1, 0, 0.2627451, 1,
1.692688, -0.02873775, 0.2780524, 1, 0, 0.2588235, 1,
1.70584, 0.01550263, 1.310054, 1, 0, 0.2509804, 1,
1.715893, 1.381755, 0.8804713, 1, 0, 0.2470588, 1,
1.731169, 1.210737, 2.157687, 1, 0, 0.2392157, 1,
1.750867, -0.2832452, 3.098148, 1, 0, 0.2352941, 1,
1.767952, -0.8838416, 3.882514, 1, 0, 0.227451, 1,
1.771414, -1.558428, 3.276729, 1, 0, 0.2235294, 1,
1.782296, 1.430029, 0.413818, 1, 0, 0.2156863, 1,
1.803711, -1.138267, 2.033427, 1, 0, 0.2117647, 1,
1.825346, 0.3931445, 3.171937, 1, 0, 0.2039216, 1,
1.840215, -2.211599, 2.269694, 1, 0, 0.1960784, 1,
1.861122, 0.8047214, 2.066706, 1, 0, 0.1921569, 1,
1.876381, 2.095292, 0.1596453, 1, 0, 0.1843137, 1,
1.887787, 0.01057646, 0.8275622, 1, 0, 0.1803922, 1,
1.891443, 0.08147902, 1.450912, 1, 0, 0.172549, 1,
1.906406, 0.9046844, -0.4430358, 1, 0, 0.1686275, 1,
1.919329, 1.324426, 0.5701644, 1, 0, 0.1607843, 1,
1.939094, -0.7818552, 3.395736, 1, 0, 0.1568628, 1,
1.944729, 0.3539444, 3.215689, 1, 0, 0.1490196, 1,
1.959827, -0.3323134, 1.774217, 1, 0, 0.145098, 1,
2.047225, -0.5826809, 3.064741, 1, 0, 0.1372549, 1,
2.084892, 0.6665422, -1.769929, 1, 0, 0.1333333, 1,
2.090735, 0.36627, 1.152984, 1, 0, 0.1254902, 1,
2.097865, 0.735489, 1.325176, 1, 0, 0.1215686, 1,
2.131898, -0.5720167, 2.266149, 1, 0, 0.1137255, 1,
2.134807, -0.3136605, 2.386121, 1, 0, 0.1098039, 1,
2.150987, 1.078219, 2.406872, 1, 0, 0.1019608, 1,
2.156092, 0.2992594, 0.951381, 1, 0, 0.09411765, 1,
2.177892, 0.2814214, 2.434741, 1, 0, 0.09019608, 1,
2.182654, 0.6477642, 1.388237, 1, 0, 0.08235294, 1,
2.194769, 1.150944, 2.702626, 1, 0, 0.07843138, 1,
2.23716, -0.02054099, 1.207991, 1, 0, 0.07058824, 1,
2.293672, -0.2628487, 0.704956, 1, 0, 0.06666667, 1,
2.38753, 0.9939706, 1.215924, 1, 0, 0.05882353, 1,
2.394396, 0.412663, 1.889262, 1, 0, 0.05490196, 1,
2.448183, -0.2569222, 1.048596, 1, 0, 0.04705882, 1,
2.46738, 0.184026, 1.004379, 1, 0, 0.04313726, 1,
2.524439, -0.1380377, 0.8580714, 1, 0, 0.03529412, 1,
2.526211, -0.2566202, 1.442608, 1, 0, 0.03137255, 1,
2.619427, -0.0126788, 1.819569, 1, 0, 0.02352941, 1,
2.988774, 0.3899155, 1.812003, 1, 0, 0.01960784, 1,
3.174955, 0.2276834, 0.3548726, 1, 0, 0.01176471, 1,
3.37172, -0.4689519, 1.297421, 1, 0, 0.007843138, 1
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
0.03073514, -4.812891, -6.567313, 0, -0.5, 0.5, 0.5,
0.03073514, -4.812891, -6.567313, 1, -0.5, 0.5, 0.5,
0.03073514, -4.812891, -6.567313, 1, 1.5, 0.5, 0.5,
0.03073514, -4.812891, -6.567313, 0, 1.5, 0.5, 0.5
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
-4.442843, -0.2900579, -6.567313, 0, -0.5, 0.5, 0.5,
-4.442843, -0.2900579, -6.567313, 1, -0.5, 0.5, 0.5,
-4.442843, -0.2900579, -6.567313, 1, 1.5, 0.5, 0.5,
-4.442843, -0.2900579, -6.567313, 0, 1.5, 0.5, 0.5
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
-4.442843, -4.812891, 0.08376813, 0, -0.5, 0.5, 0.5,
-4.442843, -4.812891, 0.08376813, 1, -0.5, 0.5, 0.5,
-4.442843, -4.812891, 0.08376813, 1, 1.5, 0.5, 0.5,
-4.442843, -4.812891, 0.08376813, 0, 1.5, 0.5, 0.5
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
-3, -3.76916, -5.032448,
3, -3.76916, -5.032448,
-3, -3.76916, -5.032448,
-3, -3.943115, -5.288259,
-2, -3.76916, -5.032448,
-2, -3.943115, -5.288259,
-1, -3.76916, -5.032448,
-1, -3.943115, -5.288259,
0, -3.76916, -5.032448,
0, -3.943115, -5.288259,
1, -3.76916, -5.032448,
1, -3.943115, -5.288259,
2, -3.76916, -5.032448,
2, -3.943115, -5.288259,
3, -3.76916, -5.032448,
3, -3.943115, -5.288259
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
"-3",
"-2",
"-1",
"0",
"1",
"2",
"3"
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
-3, -4.291025, -5.799881, 0, -0.5, 0.5, 0.5,
-3, -4.291025, -5.799881, 1, -0.5, 0.5, 0.5,
-3, -4.291025, -5.799881, 1, 1.5, 0.5, 0.5,
-3, -4.291025, -5.799881, 0, 1.5, 0.5, 0.5,
-2, -4.291025, -5.799881, 0, -0.5, 0.5, 0.5,
-2, -4.291025, -5.799881, 1, -0.5, 0.5, 0.5,
-2, -4.291025, -5.799881, 1, 1.5, 0.5, 0.5,
-2, -4.291025, -5.799881, 0, 1.5, 0.5, 0.5,
-1, -4.291025, -5.799881, 0, -0.5, 0.5, 0.5,
-1, -4.291025, -5.799881, 1, -0.5, 0.5, 0.5,
-1, -4.291025, -5.799881, 1, 1.5, 0.5, 0.5,
-1, -4.291025, -5.799881, 0, 1.5, 0.5, 0.5,
0, -4.291025, -5.799881, 0, -0.5, 0.5, 0.5,
0, -4.291025, -5.799881, 1, -0.5, 0.5, 0.5,
0, -4.291025, -5.799881, 1, 1.5, 0.5, 0.5,
0, -4.291025, -5.799881, 0, 1.5, 0.5, 0.5,
1, -4.291025, -5.799881, 0, -0.5, 0.5, 0.5,
1, -4.291025, -5.799881, 1, -0.5, 0.5, 0.5,
1, -4.291025, -5.799881, 1, 1.5, 0.5, 0.5,
1, -4.291025, -5.799881, 0, 1.5, 0.5, 0.5,
2, -4.291025, -5.799881, 0, -0.5, 0.5, 0.5,
2, -4.291025, -5.799881, 1, -0.5, 0.5, 0.5,
2, -4.291025, -5.799881, 1, 1.5, 0.5, 0.5,
2, -4.291025, -5.799881, 0, 1.5, 0.5, 0.5,
3, -4.291025, -5.799881, 0, -0.5, 0.5, 0.5,
3, -4.291025, -5.799881, 1, -0.5, 0.5, 0.5,
3, -4.291025, -5.799881, 1, 1.5, 0.5, 0.5,
3, -4.291025, -5.799881, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<7; i++) 
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
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23,
24, 25, 26, 24, 26, 27
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
-3.410479, -3, -5.032448,
-3.410479, 3, -5.032448,
-3.410479, -3, -5.032448,
-3.58254, -3, -5.288259,
-3.410479, -2, -5.032448,
-3.58254, -2, -5.288259,
-3.410479, -1, -5.032448,
-3.58254, -1, -5.288259,
-3.410479, 0, -5.032448,
-3.58254, 0, -5.288259,
-3.410479, 1, -5.032448,
-3.58254, 1, -5.288259,
-3.410479, 2, -5.032448,
-3.58254, 2, -5.288259,
-3.410479, 3, -5.032448,
-3.58254, 3, -5.288259
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
"-3",
"-2",
"-1",
"0",
"1",
"2",
"3"
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
-3.926661, -3, -5.799881, 0, -0.5, 0.5, 0.5,
-3.926661, -3, -5.799881, 1, -0.5, 0.5, 0.5,
-3.926661, -3, -5.799881, 1, 1.5, 0.5, 0.5,
-3.926661, -3, -5.799881, 0, 1.5, 0.5, 0.5,
-3.926661, -2, -5.799881, 0, -0.5, 0.5, 0.5,
-3.926661, -2, -5.799881, 1, -0.5, 0.5, 0.5,
-3.926661, -2, -5.799881, 1, 1.5, 0.5, 0.5,
-3.926661, -2, -5.799881, 0, 1.5, 0.5, 0.5,
-3.926661, -1, -5.799881, 0, -0.5, 0.5, 0.5,
-3.926661, -1, -5.799881, 1, -0.5, 0.5, 0.5,
-3.926661, -1, -5.799881, 1, 1.5, 0.5, 0.5,
-3.926661, -1, -5.799881, 0, 1.5, 0.5, 0.5,
-3.926661, 0, -5.799881, 0, -0.5, 0.5, 0.5,
-3.926661, 0, -5.799881, 1, -0.5, 0.5, 0.5,
-3.926661, 0, -5.799881, 1, 1.5, 0.5, 0.5,
-3.926661, 0, -5.799881, 0, 1.5, 0.5, 0.5,
-3.926661, 1, -5.799881, 0, -0.5, 0.5, 0.5,
-3.926661, 1, -5.799881, 1, -0.5, 0.5, 0.5,
-3.926661, 1, -5.799881, 1, 1.5, 0.5, 0.5,
-3.926661, 1, -5.799881, 0, 1.5, 0.5, 0.5,
-3.926661, 2, -5.799881, 0, -0.5, 0.5, 0.5,
-3.926661, 2, -5.799881, 1, -0.5, 0.5, 0.5,
-3.926661, 2, -5.799881, 1, 1.5, 0.5, 0.5,
-3.926661, 2, -5.799881, 0, 1.5, 0.5, 0.5,
-3.926661, 3, -5.799881, 0, -0.5, 0.5, 0.5,
-3.926661, 3, -5.799881, 1, -0.5, 0.5, 0.5,
-3.926661, 3, -5.799881, 1, 1.5, 0.5, 0.5,
-3.926661, 3, -5.799881, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<7; i++) 
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
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23,
24, 25, 26, 24, 26, 27
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
-3.410479, -3.76916, -4,
-3.410479, -3.76916, 4,
-3.410479, -3.76916, -4,
-3.58254, -3.943115, -4,
-3.410479, -3.76916, -2,
-3.58254, -3.943115, -2,
-3.410479, -3.76916, 0,
-3.58254, -3.943115, 0,
-3.410479, -3.76916, 2,
-3.58254, -3.943115, 2,
-3.410479, -3.76916, 4,
-3.58254, -3.943115, 4
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
-3.926661, -4.291025, -4, 0, -0.5, 0.5, 0.5,
-3.926661, -4.291025, -4, 1, -0.5, 0.5, 0.5,
-3.926661, -4.291025, -4, 1, 1.5, 0.5, 0.5,
-3.926661, -4.291025, -4, 0, 1.5, 0.5, 0.5,
-3.926661, -4.291025, -2, 0, -0.5, 0.5, 0.5,
-3.926661, -4.291025, -2, 1, -0.5, 0.5, 0.5,
-3.926661, -4.291025, -2, 1, 1.5, 0.5, 0.5,
-3.926661, -4.291025, -2, 0, 1.5, 0.5, 0.5,
-3.926661, -4.291025, 0, 0, -0.5, 0.5, 0.5,
-3.926661, -4.291025, 0, 1, -0.5, 0.5, 0.5,
-3.926661, -4.291025, 0, 1, 1.5, 0.5, 0.5,
-3.926661, -4.291025, 0, 0, 1.5, 0.5, 0.5,
-3.926661, -4.291025, 2, 0, -0.5, 0.5, 0.5,
-3.926661, -4.291025, 2, 1, -0.5, 0.5, 0.5,
-3.926661, -4.291025, 2, 1, 1.5, 0.5, 0.5,
-3.926661, -4.291025, 2, 0, 1.5, 0.5, 0.5,
-3.926661, -4.291025, 4, 0, -0.5, 0.5, 0.5,
-3.926661, -4.291025, 4, 1, -0.5, 0.5, 0.5,
-3.926661, -4.291025, 4, 1, 1.5, 0.5, 0.5,
-3.926661, -4.291025, 4, 0, 1.5, 0.5, 0.5
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
-3.410479, -3.76916, -5.032448,
-3.410479, 3.189044, -5.032448,
-3.410479, -3.76916, 5.199984,
-3.410479, 3.189044, 5.199984,
-3.410479, -3.76916, -5.032448,
-3.410479, -3.76916, 5.199984,
-3.410479, 3.189044, -5.032448,
-3.410479, 3.189044, 5.199984,
-3.410479, -3.76916, -5.032448,
3.471949, -3.76916, -5.032448,
-3.410479, -3.76916, 5.199984,
3.471949, -3.76916, 5.199984,
-3.410479, 3.189044, -5.032448,
3.471949, 3.189044, -5.032448,
-3.410479, 3.189044, 5.199984,
3.471949, 3.189044, 5.199984,
3.471949, -3.76916, -5.032448,
3.471949, 3.189044, -5.032448,
3.471949, -3.76916, 5.199984,
3.471949, 3.189044, 5.199984,
3.471949, -3.76916, -5.032448,
3.471949, -3.76916, 5.199984,
3.471949, 3.189044, -5.032448,
3.471949, 3.189044, 5.199984
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
var radius = 7.560816;
var distance = 33.63892;
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
mvMatrix.translate( -0.03073514, 0.2900579, -0.08376813 );
mvMatrix.scale( 1.187793, 1.174858, 0.7989208 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.63892);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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
Methyl_isothiocyanat<-read.table("Methyl_isothiocyanat.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Methyl_isothiocyanat$V2
```

```
## Error in eval(expr, envir, enclos): object 'Methyl_isothiocyanat' not found
```

```r
y<-Methyl_isothiocyanat$V3
```

```
## Error in eval(expr, envir, enclos): object 'Methyl_isothiocyanat' not found
```

```r
z<-Methyl_isothiocyanat$V4
```

```
## Error in eval(expr, envir, enclos): object 'Methyl_isothiocyanat' not found
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
-3.310249, 0.3389933, -0.8829569, 0, 0, 1, 1, 1,
-3.176902, 0.3432862, -0.5095056, 1, 0, 0, 1, 1,
-2.928414, 1.399019, -0.812841, 1, 0, 0, 1, 1,
-2.721895, 1.468747, 0.2493002, 1, 0, 0, 1, 1,
-2.679766, 0.4932796, -1.395554, 1, 0, 0, 1, 1,
-2.659537, 0.7187411, -0.202494, 1, 0, 0, 1, 1,
-2.644985, -0.7812852, -1.497797, 0, 0, 0, 1, 1,
-2.642544, 0.2990601, -2.699424, 0, 0, 0, 1, 1,
-2.588875, -0.1958533, -1.836508, 0, 0, 0, 1, 1,
-2.498099, 1.271778, -1.804965, 0, 0, 0, 1, 1,
-2.45916, 1.949981, -0.03204731, 0, 0, 0, 1, 1,
-2.430782, 0.7413625, -0.1037422, 0, 0, 0, 1, 1,
-2.429012, -1.099283, -2.243327, 0, 0, 0, 1, 1,
-2.387532, -0.5180638, -2.824286, 1, 1, 1, 1, 1,
-2.36559, -0.9737641, -0.9529968, 1, 1, 1, 1, 1,
-2.340026, 1.366282, -2.308188, 1, 1, 1, 1, 1,
-2.305263, 0.5232822, -0.3501687, 1, 1, 1, 1, 1,
-2.265752, -0.5905628, -2.966484, 1, 1, 1, 1, 1,
-2.253457, -0.8760411, -1.886297, 1, 1, 1, 1, 1,
-2.231327, 0.04533742, -2.088604, 1, 1, 1, 1, 1,
-2.186098, 0.3445237, -1.465393, 1, 1, 1, 1, 1,
-2.178909, 0.1776996, -3.981177, 1, 1, 1, 1, 1,
-2.165553, -1.343906, -3.369624, 1, 1, 1, 1, 1,
-2.146988, -1.794217, -1.986718, 1, 1, 1, 1, 1,
-2.067617, 0.1184021, -1.928821, 1, 1, 1, 1, 1,
-2.036898, -0.3379526, -2.428386, 1, 1, 1, 1, 1,
-2.030202, 0.0423049, -2.630152, 1, 1, 1, 1, 1,
-2.0097, 0.6943027, 0.7206112, 1, 1, 1, 1, 1,
-2.008137, -0.3623969, -3.282174, 0, 0, 1, 1, 1,
-1.992692, -0.01774236, -1.794685, 1, 0, 0, 1, 1,
-1.971384, 1.524681, -1.45105, 1, 0, 0, 1, 1,
-1.946366, 1.893261, -0.449823, 1, 0, 0, 1, 1,
-1.931612, -0.7609732, -2.430899, 1, 0, 0, 1, 1,
-1.879677, 0.2663451, -0.7582232, 1, 0, 0, 1, 1,
-1.871524, -0.438548, -2.397546, 0, 0, 0, 1, 1,
-1.847952, -0.3961991, -1.969087, 0, 0, 0, 1, 1,
-1.817216, -1.596594, -0.8899391, 0, 0, 0, 1, 1,
-1.780518, -0.1296372, -2.392516, 0, 0, 0, 1, 1,
-1.780281, 1.337128, -1.312733, 0, 0, 0, 1, 1,
-1.771456, -1.644775, -2.18459, 0, 0, 0, 1, 1,
-1.767825, -1.213175, -3.339862, 0, 0, 0, 1, 1,
-1.76456, 0.8079452, 0.4344275, 1, 1, 1, 1, 1,
-1.718409, -0.1436048, -4.159503, 1, 1, 1, 1, 1,
-1.715379, -1.022898, -2.482942, 1, 1, 1, 1, 1,
-1.713886, -1.696008, -0.8639722, 1, 1, 1, 1, 1,
-1.708939, 0.4279751, -2.450495, 1, 1, 1, 1, 1,
-1.696979, 0.6622164, -0.9293714, 1, 1, 1, 1, 1,
-1.696874, -0.4002296, -2.096246, 1, 1, 1, 1, 1,
-1.666655, -0.2187255, -1.614487, 1, 1, 1, 1, 1,
-1.656866, 0.9320735, -0.9521913, 1, 1, 1, 1, 1,
-1.613832, -0.3866481, -3.042993, 1, 1, 1, 1, 1,
-1.606064, 0.8341534, -3.337305, 1, 1, 1, 1, 1,
-1.603127, 2.7555, -1.639075, 1, 1, 1, 1, 1,
-1.602446, 0.5272845, -0.2838633, 1, 1, 1, 1, 1,
-1.59956, 0.8840695, -1.049969, 1, 1, 1, 1, 1,
-1.58996, 1.670322, -0.7399794, 1, 1, 1, 1, 1,
-1.58806, 1.081702, -2.539271, 0, 0, 1, 1, 1,
-1.549544, -0.4424408, -3.929755, 1, 0, 0, 1, 1,
-1.548194, -0.0682532, -1.835116, 1, 0, 0, 1, 1,
-1.538233, -0.2117024, -2.985487, 1, 0, 0, 1, 1,
-1.533749, 0.7526447, -2.263796, 1, 0, 0, 1, 1,
-1.522295, -0.4764756, -0.2579989, 1, 0, 0, 1, 1,
-1.516041, -0.2095643, -2.508697, 0, 0, 0, 1, 1,
-1.514738, -0.3389356, -0.873062, 0, 0, 0, 1, 1,
-1.507106, 0.9367216, -0.8304871, 0, 0, 0, 1, 1,
-1.502398, -0.8048899, -2.042325, 0, 0, 0, 1, 1,
-1.495922, 0.5652167, -1.399978, 0, 0, 0, 1, 1,
-1.491107, 0.1877676, -1.95009, 0, 0, 0, 1, 1,
-1.47453, -1.733428, -3.422121, 0, 0, 0, 1, 1,
-1.446746, -1.861693, -1.464773, 1, 1, 1, 1, 1,
-1.440201, -0.3161554, -0.9923239, 1, 1, 1, 1, 1,
-1.439777, -1.667527, -3.724167, 1, 1, 1, 1, 1,
-1.431434, 0.4639982, 0.6953842, 1, 1, 1, 1, 1,
-1.421719, 0.3363274, 0.08645993, 1, 1, 1, 1, 1,
-1.42128, 0.8907978, -0.4195176, 1, 1, 1, 1, 1,
-1.417338, 0.01757977, -1.520729, 1, 1, 1, 1, 1,
-1.416446, 1.079122, -1.472727, 1, 1, 1, 1, 1,
-1.414069, -2.024035, -2.302325, 1, 1, 1, 1, 1,
-1.406914, 0.3794158, -0.2619226, 1, 1, 1, 1, 1,
-1.389776, 0.3795778, -0.7522352, 1, 1, 1, 1, 1,
-1.388488, -0.8897105, -1.490132, 1, 1, 1, 1, 1,
-1.387537, 0.0001948217, -1.472185, 1, 1, 1, 1, 1,
-1.374072, -2.048654, -4.040337, 1, 1, 1, 1, 1,
-1.372522, 1.656971, -1.39131, 1, 1, 1, 1, 1,
-1.362793, -1.934146, -3.311368, 0, 0, 1, 1, 1,
-1.362036, -1.663284, -1.879023, 1, 0, 0, 1, 1,
-1.36087, 0.2530092, -1.583008, 1, 0, 0, 1, 1,
-1.359012, 0.1937774, -2.525609, 1, 0, 0, 1, 1,
-1.355869, 0.5472136, -2.435079, 1, 0, 0, 1, 1,
-1.352184, 0.8158896, -0.8840685, 1, 0, 0, 1, 1,
-1.352093, -0.5648739, -2.31196, 0, 0, 0, 1, 1,
-1.350284, -0.1296328, -2.615884, 0, 0, 0, 1, 1,
-1.348194, 0.1116849, -2.536213, 0, 0, 0, 1, 1,
-1.341037, -1.072514, -1.853376, 0, 0, 0, 1, 1,
-1.333231, -0.3212629, -0.7522786, 0, 0, 0, 1, 1,
-1.326204, -1.056406, -3.96458, 0, 0, 0, 1, 1,
-1.305669, -0.1510455, -0.9579668, 0, 0, 0, 1, 1,
-1.298627, -0.26102, -1.81641, 1, 1, 1, 1, 1,
-1.290645, 0.1688165, -2.579788, 1, 1, 1, 1, 1,
-1.283175, 0.3126889, -1.136455, 1, 1, 1, 1, 1,
-1.281945, 0.628511, -1.269254, 1, 1, 1, 1, 1,
-1.266941, -0.2577678, -2.847088, 1, 1, 1, 1, 1,
-1.265943, -0.7134662, -2.24311, 1, 1, 1, 1, 1,
-1.263797, -0.1174365, -2.101393, 1, 1, 1, 1, 1,
-1.259747, -0.501444, -3.774164, 1, 1, 1, 1, 1,
-1.241593, 0.6681237, -0.440774, 1, 1, 1, 1, 1,
-1.2241, -0.01589444, -3.539851, 1, 1, 1, 1, 1,
-1.223452, 0.258641, -2.4207, 1, 1, 1, 1, 1,
-1.220565, 1.466462, -2.955553, 1, 1, 1, 1, 1,
-1.217929, -0.1202003, -2.779651, 1, 1, 1, 1, 1,
-1.217856, 0.6406614, -0.6989815, 1, 1, 1, 1, 1,
-1.205674, -0.9400778, -3.318565, 1, 1, 1, 1, 1,
-1.202292, -0.736882, -3.02265, 0, 0, 1, 1, 1,
-1.200569, 0.3647326, -2.934789, 1, 0, 0, 1, 1,
-1.199227, 2.227152, -1.667668, 1, 0, 0, 1, 1,
-1.198187, -0.3274174, -2.667901, 1, 0, 0, 1, 1,
-1.186878, 0.01505389, -1.648249, 1, 0, 0, 1, 1,
-1.184993, 0.2587793, 0.5613972, 1, 0, 0, 1, 1,
-1.174055, 0.3955826, 1.320709, 0, 0, 0, 1, 1,
-1.166663, 0.1347104, -0.7006484, 0, 0, 0, 1, 1,
-1.160731, 0.4484251, -0.1064833, 0, 0, 0, 1, 1,
-1.157722, 0.6705589, -1.146564, 0, 0, 0, 1, 1,
-1.157664, -1.546793, -2.367484, 0, 0, 0, 1, 1,
-1.140967, 2.593997, -2.022127, 0, 0, 0, 1, 1,
-1.138098, -1.556022, -1.631136, 0, 0, 0, 1, 1,
-1.136279, -0.7648184, -2.48901, 1, 1, 1, 1, 1,
-1.134491, -0.4606312, -1.532669, 1, 1, 1, 1, 1,
-1.134166, -0.543005, -3.632134, 1, 1, 1, 1, 1,
-1.129131, -0.4520652, -1.755765, 1, 1, 1, 1, 1,
-1.122692, -0.07504508, -2.321323, 1, 1, 1, 1, 1,
-1.104525, 1.045323, -1.689905, 1, 1, 1, 1, 1,
-1.098983, -1.971467, -3.251768, 1, 1, 1, 1, 1,
-1.090259, -0.3452879, -1.955751, 1, 1, 1, 1, 1,
-1.085966, -0.1281895, -1.039386, 1, 1, 1, 1, 1,
-1.081522, 0.3359212, -0.2220171, 1, 1, 1, 1, 1,
-1.080048, 0.1880218, -0.4736956, 1, 1, 1, 1, 1,
-1.079554, 1.384956, 0.7146132, 1, 1, 1, 1, 1,
-1.07469, 0.3654151, -1.618258, 1, 1, 1, 1, 1,
-1.069274, -0.8107997, -2.163279, 1, 1, 1, 1, 1,
-1.067439, 1.149761, -0.9723701, 1, 1, 1, 1, 1,
-1.067372, 0.1928112, -1.456696, 0, 0, 1, 1, 1,
-1.061409, -0.8651174, -3.09822, 1, 0, 0, 1, 1,
-1.05363, -0.1132136, -1.443743, 1, 0, 0, 1, 1,
-1.041182, 0.5881264, -0.9066618, 1, 0, 0, 1, 1,
-1.030699, -1.370377, -3.326714, 1, 0, 0, 1, 1,
-1.025399, -0.6258282, -4.013022, 1, 0, 0, 1, 1,
-1.025367, -0.4341886, -2.547263, 0, 0, 0, 1, 1,
-1.020702, -2.152087, -3.047849, 0, 0, 0, 1, 1,
-1.01388, 0.8595443, -0.5348414, 0, 0, 0, 1, 1,
-1.013135, 0.6002328, -2.235127, 0, 0, 0, 1, 1,
-1.001633, 0.1713026, -1.319343, 0, 0, 0, 1, 1,
-1.001182, -1.492297, -2.140042, 0, 0, 0, 1, 1,
-0.9996029, -0.4573712, -1.473932, 0, 0, 0, 1, 1,
-0.9937041, 0.8315673, -2.567027, 1, 1, 1, 1, 1,
-0.9885722, 1.260502, -1.207945, 1, 1, 1, 1, 1,
-0.9808567, -0.6556582, -2.486265, 1, 1, 1, 1, 1,
-0.974377, -1.540467, -2.468446, 1, 1, 1, 1, 1,
-0.970521, 0.5723742, -0.9075997, 1, 1, 1, 1, 1,
-0.9695379, 2.564878, -2.373581, 1, 1, 1, 1, 1,
-0.9684319, 1.257456, 1.022003, 1, 1, 1, 1, 1,
-0.9576737, 0.6949559, 0.3258025, 1, 1, 1, 1, 1,
-0.9543824, -0.9540842, -2.813239, 1, 1, 1, 1, 1,
-0.9522404, -0.4961536, -2.126151, 1, 1, 1, 1, 1,
-0.9522318, -1.171232, -3.399039, 1, 1, 1, 1, 1,
-0.9488155, 0.5363198, -1.626034, 1, 1, 1, 1, 1,
-0.9460462, -0.5883365, -2.380665, 1, 1, 1, 1, 1,
-0.9434499, 3.087711, -2.325071, 1, 1, 1, 1, 1,
-0.9368122, 0.4641528, -1.579542, 1, 1, 1, 1, 1,
-0.9351826, -1.289873, -2.121674, 0, 0, 1, 1, 1,
-0.9302009, 0.03690847, -1.839652, 1, 0, 0, 1, 1,
-0.9289029, -1.691456, -3.361407, 1, 0, 0, 1, 1,
-0.9207036, -0.8727908, -1.391699, 1, 0, 0, 1, 1,
-0.9192642, 1.654561, 0.04400481, 1, 0, 0, 1, 1,
-0.9190741, 0.2733806, -1.25238, 1, 0, 0, 1, 1,
-0.9188908, -1.284851, -3.50622, 0, 0, 0, 1, 1,
-0.9184043, 1.441319, -0.4802059, 0, 0, 0, 1, 1,
-0.9100482, 1.580323, 0.151482, 0, 0, 0, 1, 1,
-0.9089453, 0.4781678, -3.303515, 0, 0, 0, 1, 1,
-0.9038258, -0.07101921, -3.704609, 0, 0, 0, 1, 1,
-0.9016547, -1.479251, -0.8362741, 0, 0, 0, 1, 1,
-0.8969096, -2.613822, -3.494305, 0, 0, 0, 1, 1,
-0.8934739, -0.09615313, -2.032275, 1, 1, 1, 1, 1,
-0.8919545, -0.06191318, -0.7773244, 1, 1, 1, 1, 1,
-0.8903063, -0.8448351, -2.560089, 1, 1, 1, 1, 1,
-0.8873625, 2.148659, 0.02450368, 1, 1, 1, 1, 1,
-0.8824068, 0.1191751, -2.799847, 1, 1, 1, 1, 1,
-0.8813714, -0.5740023, -2.036507, 1, 1, 1, 1, 1,
-0.8776454, 0.1414199, -1.104694, 1, 1, 1, 1, 1,
-0.8730626, 0.08918843, -1.781318, 1, 1, 1, 1, 1,
-0.8657722, -0.006759484, -1.223173, 1, 1, 1, 1, 1,
-0.8646889, 0.1675006, 0.02688785, 1, 1, 1, 1, 1,
-0.8577685, 1.114902, -1.072579, 1, 1, 1, 1, 1,
-0.8568653, 1.380792, -0.9127174, 1, 1, 1, 1, 1,
-0.8428633, -1.559271, -3.47108, 1, 1, 1, 1, 1,
-0.8423762, 0.2848288, 0.5223755, 1, 1, 1, 1, 1,
-0.8401039, 2.308042, 0.1932216, 1, 1, 1, 1, 1,
-0.834708, -0.4558134, -1.495257, 0, 0, 1, 1, 1,
-0.8343616, 0.4229018, -0.8711627, 1, 0, 0, 1, 1,
-0.8290298, -0.364311, -1.079323, 1, 0, 0, 1, 1,
-0.8275913, 0.9635444, -1.48613, 1, 0, 0, 1, 1,
-0.8270442, -2.073262, -3.93839, 1, 0, 0, 1, 1,
-0.821965, 0.108104, -1.543571, 1, 0, 0, 1, 1,
-0.8199657, -1.04352, -3.61101, 0, 0, 0, 1, 1,
-0.8146063, -1.338672, -1.564317, 0, 0, 0, 1, 1,
-0.8138219, 1.381335, -0.7183428, 0, 0, 0, 1, 1,
-0.812332, 0.1862936, -2.710297, 0, 0, 0, 1, 1,
-0.8059161, 0.1263414, -1.974201, 0, 0, 0, 1, 1,
-0.7981437, -0.09336301, 0.3168128, 0, 0, 0, 1, 1,
-0.7968546, -0.3107052, -1.796267, 0, 0, 0, 1, 1,
-0.7901239, 1.464715, 0.3251509, 1, 1, 1, 1, 1,
-0.7864187, -0.9175158, -3.290936, 1, 1, 1, 1, 1,
-0.7842829, -0.2400733, -1.988387, 1, 1, 1, 1, 1,
-0.7806165, -0.05973973, -2.419871, 1, 1, 1, 1, 1,
-0.78021, 0.5112766, -0.8008126, 1, 1, 1, 1, 1,
-0.7788931, 0.9321674, -2.234999, 1, 1, 1, 1, 1,
-0.7778047, 0.9544694, -2.552296, 1, 1, 1, 1, 1,
-0.7761661, -1.501863, -4.168875, 1, 1, 1, 1, 1,
-0.7712816, 0.1478081, -3.639228, 1, 1, 1, 1, 1,
-0.768733, -0.8160235, -1.403988, 1, 1, 1, 1, 1,
-0.7624794, -0.08323412, -1.356161, 1, 1, 1, 1, 1,
-0.7457033, 0.4902649, -0.8353444, 1, 1, 1, 1, 1,
-0.7428366, 0.2333856, -3.441894, 1, 1, 1, 1, 1,
-0.7361625, 0.00782442, -0.305252, 1, 1, 1, 1, 1,
-0.7360402, -0.5539184, -2.489744, 1, 1, 1, 1, 1,
-0.7353103, 0.2307887, -2.002192, 0, 0, 1, 1, 1,
-0.7300802, -1.916759, -2.803399, 1, 0, 0, 1, 1,
-0.7291805, 1.772999, -0.4458636, 1, 0, 0, 1, 1,
-0.7262987, 0.5670958, -1.510976, 1, 0, 0, 1, 1,
-0.7163216, -0.5025293, -1.438801, 1, 0, 0, 1, 1,
-0.7162555, -0.95293, -2.874016, 1, 0, 0, 1, 1,
-0.7076859, 0.7427577, -0.431099, 0, 0, 0, 1, 1,
-0.7059199, 0.5462969, -1.861423, 0, 0, 0, 1, 1,
-0.7035559, 1.297489, 0.9042996, 0, 0, 0, 1, 1,
-0.7035365, 0.9204482, 0.4184228, 0, 0, 0, 1, 1,
-0.7019927, 1.113736, -0.1251054, 0, 0, 0, 1, 1,
-0.6977005, 0.07521153, -1.651469, 0, 0, 0, 1, 1,
-0.6968157, 1.176614, -1.155621, 0, 0, 0, 1, 1,
-0.6907566, 1.190572, 0.1080667, 1, 1, 1, 1, 1,
-0.6880757, -0.2159631, -2.028199, 1, 1, 1, 1, 1,
-0.6829022, -1.026922, -2.312999, 1, 1, 1, 1, 1,
-0.6823238, -2.153382, -2.988451, 1, 1, 1, 1, 1,
-0.6818338, -1.097319, -2.771303, 1, 1, 1, 1, 1,
-0.6765539, 0.3324147, -1.694549, 1, 1, 1, 1, 1,
-0.673633, -0.377127, -0.4085318, 1, 1, 1, 1, 1,
-0.6707116, -0.1190947, -4.15763, 1, 1, 1, 1, 1,
-0.6685053, 1.441138, -1.39511, 1, 1, 1, 1, 1,
-0.6656755, 0.8268564, 0.6090761, 1, 1, 1, 1, 1,
-0.6606136, -0.04093527, -0.4963618, 1, 1, 1, 1, 1,
-0.6596959, 0.8861789, -1.271513, 1, 1, 1, 1, 1,
-0.6590313, -0.6272747, -4.336984, 1, 1, 1, 1, 1,
-0.6565397, 0.2341505, -2.149883, 1, 1, 1, 1, 1,
-0.6562506, -0.318797, -1.111274, 1, 1, 1, 1, 1,
-0.6471776, 0.1274343, -1.582516, 0, 0, 1, 1, 1,
-0.6452032, -0.94381, -2.124882, 1, 0, 0, 1, 1,
-0.641547, 0.8429165, -2.034265, 1, 0, 0, 1, 1,
-0.6357361, 1.239701, -0.2913658, 1, 0, 0, 1, 1,
-0.6290335, -2.033348, -1.779571, 1, 0, 0, 1, 1,
-0.6232451, -0.5202388, -1.341788, 1, 0, 0, 1, 1,
-0.6227894, 0.4701089, -1.202444, 0, 0, 0, 1, 1,
-0.6192453, -0.408307, -2.975222, 0, 0, 0, 1, 1,
-0.6185955, 0.9727451, -2.494255, 0, 0, 0, 1, 1,
-0.6145809, 0.7017739, -0.6370948, 0, 0, 0, 1, 1,
-0.610381, -0.1729783, -1.320902, 0, 0, 0, 1, 1,
-0.6011958, -0.8030301, -1.458175, 0, 0, 0, 1, 1,
-0.6010117, 0.2252337, -1.898624, 0, 0, 0, 1, 1,
-0.5970732, 2.357699, 0.2739723, 1, 1, 1, 1, 1,
-0.596426, 1.439179, 0.9523083, 1, 1, 1, 1, 1,
-0.5964115, 0.03638466, -1.627905, 1, 1, 1, 1, 1,
-0.5963551, -1.329255, -2.213727, 1, 1, 1, 1, 1,
-0.5962916, 0.2180531, -3.178774, 1, 1, 1, 1, 1,
-0.5954137, -0.7462111, -2.041036, 1, 1, 1, 1, 1,
-0.5864209, 0.7611791, -0.8233886, 1, 1, 1, 1, 1,
-0.5844451, 0.9216348, -0.8379659, 1, 1, 1, 1, 1,
-0.5842493, -0.63954, -0.8831816, 1, 1, 1, 1, 1,
-0.5802414, 0.6105137, -2.272983, 1, 1, 1, 1, 1,
-0.5796942, -2.081125, -2.229647, 1, 1, 1, 1, 1,
-0.5784142, 0.3963397, -2.801229, 1, 1, 1, 1, 1,
-0.575299, -0.2880562, -3.987937, 1, 1, 1, 1, 1,
-0.5722506, -0.1856588, -2.153251, 1, 1, 1, 1, 1,
-0.56178, 1.414439, -0.02708879, 1, 1, 1, 1, 1,
-0.5559945, -0.6199777, -1.553193, 0, 0, 1, 1, 1,
-0.5555552, -0.1212996, -2.94699, 1, 0, 0, 1, 1,
-0.5526238, -0.6721386, -2.522857, 1, 0, 0, 1, 1,
-0.5515618, 0.7641235, 0.8390425, 1, 0, 0, 1, 1,
-0.551494, -2.695003, -2.627302, 1, 0, 0, 1, 1,
-0.5510591, -0.721017, -1.54126, 1, 0, 0, 1, 1,
-0.5432804, 0.1903758, -1.564204, 0, 0, 0, 1, 1,
-0.5408561, -0.3017844, -3.228004, 0, 0, 0, 1, 1,
-0.5407603, 0.08617022, -1.988028, 0, 0, 0, 1, 1,
-0.5385327, 1.216449, -1.374071, 0, 0, 0, 1, 1,
-0.5377259, 1.071131, 0.6105276, 0, 0, 0, 1, 1,
-0.5372151, -0.07862332, -2.062774, 0, 0, 0, 1, 1,
-0.5355904, -0.8950542, -2.040519, 0, 0, 0, 1, 1,
-0.5343345, 0.3819205, -1.655373, 1, 1, 1, 1, 1,
-0.5301605, -1.347774, -2.912638, 1, 1, 1, 1, 1,
-0.5295317, -0.2593702, -1.397836, 1, 1, 1, 1, 1,
-0.5287878, -0.8967099, -3.224765, 1, 1, 1, 1, 1,
-0.5224932, -0.04865384, -2.610785, 1, 1, 1, 1, 1,
-0.5212376, 0.7285573, -2.150508, 1, 1, 1, 1, 1,
-0.5205927, 0.7714359, -0.3602377, 1, 1, 1, 1, 1,
-0.5193283, -0.6836958, -2.250572, 1, 1, 1, 1, 1,
-0.5187379, 0.3607506, 0.3740146, 1, 1, 1, 1, 1,
-0.5162287, 0.5346817, 0.3834575, 1, 1, 1, 1, 1,
-0.5130518, 1.682665, 1.185028, 1, 1, 1, 1, 1,
-0.5103152, 0.6110038, -1.711244, 1, 1, 1, 1, 1,
-0.5081819, 1.950868, 0.2869101, 1, 1, 1, 1, 1,
-0.5019962, -0.6305065, -2.401788, 1, 1, 1, 1, 1,
-0.4991008, -1.370488, -2.226866, 1, 1, 1, 1, 1,
-0.4979555, -1.374421, -3.429682, 0, 0, 1, 1, 1,
-0.4954625, 1.238431, 0.8614769, 1, 0, 0, 1, 1,
-0.4949883, 1.737639, -0.8488308, 1, 0, 0, 1, 1,
-0.4939003, 0.544144, -1.942464, 1, 0, 0, 1, 1,
-0.4913373, -1.298956, -2.009593, 1, 0, 0, 1, 1,
-0.4901321, -0.1843445, -0.7359247, 1, 0, 0, 1, 1,
-0.4837682, -1.624076, -2.444798, 0, 0, 0, 1, 1,
-0.482219, 0.8980732, -1.069663, 0, 0, 0, 1, 1,
-0.4797282, 1.288466, 1.034442, 0, 0, 0, 1, 1,
-0.4714423, 0.2189208, -0.5132492, 0, 0, 0, 1, 1,
-0.470861, -0.8788202, -2.59176, 0, 0, 0, 1, 1,
-0.4708553, 0.3619745, -0.3413035, 0, 0, 0, 1, 1,
-0.4707818, 0.9847397, -1.744515, 0, 0, 0, 1, 1,
-0.4680518, 1.457251, 0.004951681, 1, 1, 1, 1, 1,
-0.4645492, 0.3928559, -3.782988, 1, 1, 1, 1, 1,
-0.4598328, -0.4571136, -2.330099, 1, 1, 1, 1, 1,
-0.4595633, -0.8258066, -2.148023, 1, 1, 1, 1, 1,
-0.4587923, 0.9817479, 0.2856656, 1, 1, 1, 1, 1,
-0.4578571, 0.02778953, -1.890887, 1, 1, 1, 1, 1,
-0.4571075, -0.5860229, -1.912272, 1, 1, 1, 1, 1,
-0.4505973, -1.067713, -3.146754, 1, 1, 1, 1, 1,
-0.4502569, -0.3097052, -1.769543, 1, 1, 1, 1, 1,
-0.4499174, 1.154378, 0.4819716, 1, 1, 1, 1, 1,
-0.4476234, -2.505352, -2.144639, 1, 1, 1, 1, 1,
-0.4466162, 0.7238926, -1.266317, 1, 1, 1, 1, 1,
-0.4462295, 1.423908, 0.08775293, 1, 1, 1, 1, 1,
-0.4454944, -0.7105706, -2.44697, 1, 1, 1, 1, 1,
-0.4441189, -0.3040738, -3.045731, 1, 1, 1, 1, 1,
-0.4440925, 1.387599, 0.1162337, 0, 0, 1, 1, 1,
-0.442904, -0.02811264, -0.2220017, 1, 0, 0, 1, 1,
-0.4295976, -0.8050637, -1.555974, 1, 0, 0, 1, 1,
-0.4278735, -1.83741, -2.016902, 1, 0, 0, 1, 1,
-0.4234939, -0.5282037, -1.344104, 1, 0, 0, 1, 1,
-0.4213817, 0.8629057, -0.6995631, 1, 0, 0, 1, 1,
-0.4189925, -1.292534, -3.696658, 0, 0, 0, 1, 1,
-0.416956, 1.511371, 0.03352174, 0, 0, 0, 1, 1,
-0.4155672, -0.7310879, -2.45494, 0, 0, 0, 1, 1,
-0.4135576, -0.5888519, -2.819099, 0, 0, 0, 1, 1,
-0.412506, 0.5314459, -2.704935, 0, 0, 0, 1, 1,
-0.4072263, 0.3888917, 0.8692872, 0, 0, 0, 1, 1,
-0.4052598, 1.077166, 1.523535, 0, 0, 0, 1, 1,
-0.4032213, -0.6253096, -3.687196, 1, 1, 1, 1, 1,
-0.400014, 1.891775, 0.09485543, 1, 1, 1, 1, 1,
-0.3999504, -1.471818, -2.770606, 1, 1, 1, 1, 1,
-0.3997087, 0.7048953, 0.1307434, 1, 1, 1, 1, 1,
-0.3911565, 1.135913, -0.99848, 1, 1, 1, 1, 1,
-0.388533, 0.5179617, -0.6884231, 1, 1, 1, 1, 1,
-0.3865481, -0.2861897, -2.732913, 1, 1, 1, 1, 1,
-0.3802332, 0.115671, -1.52266, 1, 1, 1, 1, 1,
-0.3765486, 1.648633, -1.474092, 1, 1, 1, 1, 1,
-0.3698844, 1.332291, -2.224072, 1, 1, 1, 1, 1,
-0.367849, -0.3202218, -2.986838, 1, 1, 1, 1, 1,
-0.3657432, 1.203405, -0.3557983, 1, 1, 1, 1, 1,
-0.3650917, -0.1645515, -2.704997, 1, 1, 1, 1, 1,
-0.3599133, 0.4328498, -0.670747, 1, 1, 1, 1, 1,
-0.3588676, 1.389662, 0.1047805, 1, 1, 1, 1, 1,
-0.3485765, -0.1311319, -1.277681, 0, 0, 1, 1, 1,
-0.3482212, -1.336678, -2.813151, 1, 0, 0, 1, 1,
-0.3438072, -1.245037, -1.953676, 1, 0, 0, 1, 1,
-0.3394707, 0.506529, -0.5720846, 1, 0, 0, 1, 1,
-0.3355092, -0.15758, -0.799767, 1, 0, 0, 1, 1,
-0.3306061, -0.9979542, -2.936798, 1, 0, 0, 1, 1,
-0.330539, 0.3078008, -0.8267677, 0, 0, 0, 1, 1,
-0.3299956, 0.1656315, -0.06313722, 0, 0, 0, 1, 1,
-0.3292565, -0.7382672, -3.517973, 0, 0, 0, 1, 1,
-0.327423, -1.031752, -4.601053, 0, 0, 0, 1, 1,
-0.3204818, -0.4255685, -2.57392, 0, 0, 0, 1, 1,
-0.319156, 0.3946065, -0.9298465, 0, 0, 0, 1, 1,
-0.3162932, -0.2419093, -1.624456, 0, 0, 0, 1, 1,
-0.310487, 0.367127, -0.6317449, 1, 1, 1, 1, 1,
-0.3079145, -0.1426326, -1.899934, 1, 1, 1, 1, 1,
-0.3042202, 1.428951, -2.391284, 1, 1, 1, 1, 1,
-0.3001882, 0.3975022, -0.8832429, 1, 1, 1, 1, 1,
-0.2985701, 1.435014, 1.466603, 1, 1, 1, 1, 1,
-0.2967507, 0.7152167, 0.1680627, 1, 1, 1, 1, 1,
-0.2966667, -0.0110459, -1.342928, 1, 1, 1, 1, 1,
-0.2961928, 0.07026077, 0.4389376, 1, 1, 1, 1, 1,
-0.2952393, 1.581482, -0.008235132, 1, 1, 1, 1, 1,
-0.2933294, 1.267168, 1.581491, 1, 1, 1, 1, 1,
-0.2932095, -0.7523481, -3.288206, 1, 1, 1, 1, 1,
-0.2927395, 1.58976, -0.3017257, 1, 1, 1, 1, 1,
-0.292378, -0.0457135, -1.432418, 1, 1, 1, 1, 1,
-0.2755818, -1.150995, -1.66603, 1, 1, 1, 1, 1,
-0.2731627, -2.134704, -0.4840312, 1, 1, 1, 1, 1,
-0.2703748, -0.5049876, -2.505543, 0, 0, 1, 1, 1,
-0.2701124, -0.2387552, -2.527864, 1, 0, 0, 1, 1,
-0.2682557, -0.1919004, -2.120692, 1, 0, 0, 1, 1,
-0.2651652, -0.03480021, -1.302597, 1, 0, 0, 1, 1,
-0.2649572, -0.9619687, -3.442359, 1, 0, 0, 1, 1,
-0.2636205, 1.518928, -2.068994, 1, 0, 0, 1, 1,
-0.2613437, -0.8913407, -2.533905, 0, 0, 0, 1, 1,
-0.2565671, -1.298953, -3.780013, 0, 0, 0, 1, 1,
-0.2563281, -0.5959315, -3.951266, 0, 0, 0, 1, 1,
-0.251649, -0.598796, -3.436154, 0, 0, 0, 1, 1,
-0.2463831, 0.4944429, -0.1374013, 0, 0, 0, 1, 1,
-0.2449917, -0.1657227, -1.696726, 0, 0, 0, 1, 1,
-0.2425514, -0.3468683, -1.467052, 0, 0, 0, 1, 1,
-0.2425125, -0.2137698, -2.633318, 1, 1, 1, 1, 1,
-0.2407956, -1.689345, -2.221478, 1, 1, 1, 1, 1,
-0.2399471, -0.6905283, -3.869263, 1, 1, 1, 1, 1,
-0.2394773, 1.20129, 0.7802851, 1, 1, 1, 1, 1,
-0.2390255, -0.922864, -3.344678, 1, 1, 1, 1, 1,
-0.2344231, 0.6108929, 0.6351832, 1, 1, 1, 1, 1,
-0.2326108, 0.5208617, -0.7209862, 1, 1, 1, 1, 1,
-0.2313787, -1.201035, -3.916049, 1, 1, 1, 1, 1,
-0.2269954, -0.376225, -2.780782, 1, 1, 1, 1, 1,
-0.2220447, 1.507141, 0.4120694, 1, 1, 1, 1, 1,
-0.2202796, 0.1119369, 2.172025, 1, 1, 1, 1, 1,
-0.2190625, 0.3267183, 1.645396, 1, 1, 1, 1, 1,
-0.2153508, -1.912375, -3.261287, 1, 1, 1, 1, 1,
-0.2144644, 0.5137107, 1.289079, 1, 1, 1, 1, 1,
-0.2141273, 0.81364, 1.015896, 1, 1, 1, 1, 1,
-0.2141154, -0.3684722, -2.634961, 0, 0, 1, 1, 1,
-0.2135289, -0.1215874, -1.996611, 1, 0, 0, 1, 1,
-0.2134093, 0.5130044, 0.2694522, 1, 0, 0, 1, 1,
-0.2128958, 0.5040578, -1.299392, 1, 0, 0, 1, 1,
-0.2111869, -2.748214, -3.147085, 1, 0, 0, 1, 1,
-0.2111825, -1.49584, -3.849336, 1, 0, 0, 1, 1,
-0.2093003, 1.29619, 2.383043, 0, 0, 0, 1, 1,
-0.2053322, 0.397371, -1.025207, 0, 0, 0, 1, 1,
-0.2046312, -2.177427, -4.618686, 0, 0, 0, 1, 1,
-0.2035566, 2.250802, -1.739803, 0, 0, 0, 1, 1,
-0.2034088, -0.8085843, -2.790721, 0, 0, 0, 1, 1,
-0.2026566, -0.1862743, -0.9537833, 0, 0, 0, 1, 1,
-0.2009413, 0.8254392, -0.5319631, 0, 0, 0, 1, 1,
-0.1959724, -1.57282, -2.176578, 1, 1, 1, 1, 1,
-0.1949172, -0.3838389, -3.620459, 1, 1, 1, 1, 1,
-0.1902716, -0.2249392, -2.786146, 1, 1, 1, 1, 1,
-0.1872398, 1.112092, 0.9461911, 1, 1, 1, 1, 1,
-0.1869354, -2.310142, -3.883599, 1, 1, 1, 1, 1,
-0.1835419, -0.4085958, -2.286954, 1, 1, 1, 1, 1,
-0.1824017, 0.7492117, -1.036587, 1, 1, 1, 1, 1,
-0.1819551, -0.5767648, -3.383268, 1, 1, 1, 1, 1,
-0.1744046, -1.345641, -3.971973, 1, 1, 1, 1, 1,
-0.1726174, -1.672493, -3.655632, 1, 1, 1, 1, 1,
-0.1725935, -0.092148, -1.09947, 1, 1, 1, 1, 1,
-0.1718816, 0.3149643, -0.1241237, 1, 1, 1, 1, 1,
-0.1714901, 0.83269, -0.2159702, 1, 1, 1, 1, 1,
-0.1708507, 1.195271, -1.237348, 1, 1, 1, 1, 1,
-0.1705646, -1.447512, -2.660846, 1, 1, 1, 1, 1,
-0.1589716, 0.53873, -0.3517319, 0, 0, 1, 1, 1,
-0.1589457, -1.409713, -3.164812, 1, 0, 0, 1, 1,
-0.157519, -0.08510374, -1.039531, 1, 0, 0, 1, 1,
-0.1562039, -0.6006063, -4.228878, 1, 0, 0, 1, 1,
-0.1475404, 1.874521, -1.629681, 1, 0, 0, 1, 1,
-0.1469892, 0.02403789, -0.5739564, 1, 0, 0, 1, 1,
-0.1409849, -1.347284, -4.758598, 0, 0, 0, 1, 1,
-0.13969, 0.4916411, -1.731233, 0, 0, 0, 1, 1,
-0.1396332, -1.45097, -3.246862, 0, 0, 0, 1, 1,
-0.1393281, -1.966217, -3.649186, 0, 0, 0, 1, 1,
-0.1354158, 0.5522295, -0.03056624, 0, 0, 0, 1, 1,
-0.1333874, -0.5748415, -3.793126, 0, 0, 0, 1, 1,
-0.1266104, -0.9281672, -4.883432, 0, 0, 0, 1, 1,
-0.1220439, -0.5403291, -4.180285, 1, 1, 1, 1, 1,
-0.1202235, -1.177845, -3.597447, 1, 1, 1, 1, 1,
-0.1178033, -1.916881, -3.386977, 1, 1, 1, 1, 1,
-0.1148751, -0.1975666, -2.335642, 1, 1, 1, 1, 1,
-0.1123879, -1.854352, -2.624285, 1, 1, 1, 1, 1,
-0.1119447, 0.9078957, 1.561642, 1, 1, 1, 1, 1,
-0.1119033, -0.0004952716, -1.952032, 1, 1, 1, 1, 1,
-0.1112907, 1.075602, 0.2565781, 1, 1, 1, 1, 1,
-0.1088962, 0.4148361, 0.2149573, 1, 1, 1, 1, 1,
-0.1075256, 0.2504412, -0.4544094, 1, 1, 1, 1, 1,
-0.1030916, -0.7025809, -2.917387, 1, 1, 1, 1, 1,
-0.101573, 0.9296963, -2.305566, 1, 1, 1, 1, 1,
-0.09783602, 0.6742884, -1.291698, 1, 1, 1, 1, 1,
-0.09619194, 1.212383, -0.8459648, 1, 1, 1, 1, 1,
-0.09451406, 1.941824, 0.9231746, 1, 1, 1, 1, 1,
-0.09341437, 0.05958459, -0.05175247, 0, 0, 1, 1, 1,
-0.08752269, 0.5991446, 0.9276292, 1, 0, 0, 1, 1,
-0.08618186, 1.373061, -1.084526, 1, 0, 0, 1, 1,
-0.08431943, -1.055915, -2.53968, 1, 0, 0, 1, 1,
-0.0839745, -0.7847512, -2.548975, 1, 0, 0, 1, 1,
-0.08224559, -0.3854551, -3.325887, 1, 0, 0, 1, 1,
-0.07692662, -1.002585, -1.880545, 0, 0, 0, 1, 1,
-0.07265171, -0.989233, -3.817519, 0, 0, 0, 1, 1,
-0.07264072, 0.9622871, 3.171429, 0, 0, 0, 1, 1,
-0.07157294, 0.1243128, -0.09587682, 0, 0, 0, 1, 1,
-0.07104953, 0.408924, 0.7974579, 0, 0, 0, 1, 1,
-0.07034539, -0.606365, -1.156474, 0, 0, 0, 1, 1,
-0.07026574, -0.109911, -3.297642, 0, 0, 0, 1, 1,
-0.06642334, 2.198929, -0.4712669, 1, 1, 1, 1, 1,
-0.06504257, -0.8912844, -3.645183, 1, 1, 1, 1, 1,
-0.06478265, 0.0859644, 1.338288, 1, 1, 1, 1, 1,
-0.06431742, -1.731355, -3.372826, 1, 1, 1, 1, 1,
-0.06305719, -0.08166754, -2.611124, 1, 1, 1, 1, 1,
-0.06169795, -0.2101896, -3.071027, 1, 1, 1, 1, 1,
-0.05792463, -1.092939, -3.36889, 1, 1, 1, 1, 1,
-0.05632148, -0.1000464, -0.3346754, 1, 1, 1, 1, 1,
-0.05514717, -0.9071257, -2.667304, 1, 1, 1, 1, 1,
-0.05340052, -0.06921866, -1.697842, 1, 1, 1, 1, 1,
-0.048781, -0.09078921, -2.764808, 1, 1, 1, 1, 1,
-0.04792115, -1.427805, -4.062974, 1, 1, 1, 1, 1,
-0.04580581, -0.968088, -4.580589, 1, 1, 1, 1, 1,
-0.04104206, -1.125415, -4.068045, 1, 1, 1, 1, 1,
-0.04076521, 0.3639156, 0.2559378, 1, 1, 1, 1, 1,
-0.04050621, 0.6507326, 0.7572207, 0, 0, 1, 1, 1,
-0.03764931, 1.90548, -1.461034, 1, 0, 0, 1, 1,
-0.03399641, 0.3753611, -0.4237481, 1, 0, 0, 1, 1,
-0.03067279, 0.1539403, 0.4260413, 1, 0, 0, 1, 1,
-0.02901491, 0.366726, -0.5100623, 1, 0, 0, 1, 1,
-0.0234576, -1.203769, 0.3990299, 1, 0, 0, 1, 1,
-0.02331237, -0.03898967, -4.434894, 0, 0, 0, 1, 1,
-0.02306738, -1.47206, -3.341782, 0, 0, 0, 1, 1,
-0.01948983, 1.073773, 0.7353418, 0, 0, 0, 1, 1,
-0.01927856, -0.3305124, -4.055897, 0, 0, 0, 1, 1,
-0.0152853, 0.7353443, -1.519369, 0, 0, 0, 1, 1,
-0.008964732, -0.8466365, -1.068012, 0, 0, 0, 1, 1,
-0.007425108, 0.3569551, -0.9225063, 0, 0, 0, 1, 1,
-0.005606114, 1.224726, -0.9523524, 1, 1, 1, 1, 1,
-0.005180371, 1.8995, -0.6840725, 1, 1, 1, 1, 1,
-0.003821766, -1.354825, -0.9124295, 1, 1, 1, 1, 1,
-0.0002558169, -0.8427352, -3.605931, 1, 1, 1, 1, 1,
7.576441e-05, 0.4620197, 0.254027, 1, 1, 1, 1, 1,
0.0004046517, -0.5315443, 3.50552, 1, 1, 1, 1, 1,
0.0008939843, 0.4323077, -0.6018216, 1, 1, 1, 1, 1,
0.0009459076, -0.3178774, 3.338283, 1, 1, 1, 1, 1,
0.001945604, 1.180097, -0.8672553, 1, 1, 1, 1, 1,
0.002956192, -1.263087, 4.091271, 1, 1, 1, 1, 1,
0.005853654, 1.512327, 0.8701156, 1, 1, 1, 1, 1,
0.01192209, -0.7782959, 3.44226, 1, 1, 1, 1, 1,
0.01281961, 0.7770535, -0.2471638, 1, 1, 1, 1, 1,
0.01452404, 1.275812, -1.048892, 1, 1, 1, 1, 1,
0.02440432, -0.4712019, 3.029615, 1, 1, 1, 1, 1,
0.02583396, -0.0142821, 2.143894, 0, 0, 1, 1, 1,
0.02741798, 0.2873438, 0.7576228, 1, 0, 0, 1, 1,
0.02895063, 0.3281358, 1.014341, 1, 0, 0, 1, 1,
0.02921617, 0.8569323, 1.107313, 1, 0, 0, 1, 1,
0.03727913, -0.4121267, 1.955153, 1, 0, 0, 1, 1,
0.03757306, 0.153006, -0.4163625, 1, 0, 0, 1, 1,
0.0430624, -0.3451346, 2.587277, 0, 0, 0, 1, 1,
0.0443849, -0.3191525, 2.253236, 0, 0, 0, 1, 1,
0.0445938, 1.673947, -0.297933, 0, 0, 0, 1, 1,
0.04862386, -0.7892544, 4.145789, 0, 0, 0, 1, 1,
0.0530072, 1.48177, 0.02282736, 0, 0, 0, 1, 1,
0.05384509, -0.7451179, 4.26739, 0, 0, 0, 1, 1,
0.06105857, -0.4267188, 2.370264, 0, 0, 0, 1, 1,
0.06386584, -0.8871264, 2.558479, 1, 1, 1, 1, 1,
0.06575239, -0.4281381, 4.76163, 1, 1, 1, 1, 1,
0.06630538, -2.479656, 4.73737, 1, 1, 1, 1, 1,
0.07096849, 1.476426, -1.326305, 1, 1, 1, 1, 1,
0.07207554, 0.838967, -0.726696, 1, 1, 1, 1, 1,
0.07328424, -1.082625, 3.002411, 1, 1, 1, 1, 1,
0.07395844, 1.732403, 0.7106616, 1, 1, 1, 1, 1,
0.07518038, 0.6730631, 0.5896911, 1, 1, 1, 1, 1,
0.07654408, 1.071381, 0.02088145, 1, 1, 1, 1, 1,
0.08039683, -0.8405274, 2.791742, 1, 1, 1, 1, 1,
0.08257471, 1.046297, -1.790539, 1, 1, 1, 1, 1,
0.0866992, -0.3063522, 3.708803, 1, 1, 1, 1, 1,
0.09130394, 0.8004712, -2.307903, 1, 1, 1, 1, 1,
0.09141087, -0.7071693, 3.891334, 1, 1, 1, 1, 1,
0.09239913, 0.2602544, 0.4434094, 1, 1, 1, 1, 1,
0.09393866, -0.03405881, 1.97375, 0, 0, 1, 1, 1,
0.09499907, -0.262546, 2.39772, 1, 0, 0, 1, 1,
0.09740259, 0.2132447, 0.5082778, 1, 0, 0, 1, 1,
0.09856313, 0.09535721, 0.04644543, 1, 0, 0, 1, 1,
0.1002906, 0.160417, 0.1265018, 1, 0, 0, 1, 1,
0.1030798, 0.112195, -0.686665, 1, 0, 0, 1, 1,
0.1031232, 0.6558809, 2.716694, 0, 0, 0, 1, 1,
0.1088238, 0.8796078, 0.6203651, 0, 0, 0, 1, 1,
0.1110845, -0.3236777, 2.869672, 0, 0, 0, 1, 1,
0.1161646, -0.7650906, 2.526303, 0, 0, 0, 1, 1,
0.1203482, -1.934563, 2.109645, 0, 0, 0, 1, 1,
0.12125, 0.06003025, 0.3571644, 0, 0, 0, 1, 1,
0.1229546, -0.4983343, 4.398917, 0, 0, 0, 1, 1,
0.126632, 0.8901681, 0.6763345, 1, 1, 1, 1, 1,
0.1326219, -1.173134, 2.435878, 1, 1, 1, 1, 1,
0.13585, 0.4369174, 0.899543, 1, 1, 1, 1, 1,
0.1396717, -0.4801819, 2.076607, 1, 1, 1, 1, 1,
0.150666, 1.029198, -0.3092422, 1, 1, 1, 1, 1,
0.1537378, 0.1202803, 2.073104, 1, 1, 1, 1, 1,
0.1546853, -0.3339101, 2.495423, 1, 1, 1, 1, 1,
0.1552652, 0.05646658, 1.006118, 1, 1, 1, 1, 1,
0.1563546, -0.8770764, 3.365712, 1, 1, 1, 1, 1,
0.159107, 0.1604379, 0.5748364, 1, 1, 1, 1, 1,
0.1644537, 0.2909076, -0.1857952, 1, 1, 1, 1, 1,
0.1645936, 0.3286111, 1.360298, 1, 1, 1, 1, 1,
0.1690779, -1.030416, 3.170765, 1, 1, 1, 1, 1,
0.1723194, -0.7204372, 3.063914, 1, 1, 1, 1, 1,
0.1737483, 1.303543, 0.2242299, 1, 1, 1, 1, 1,
0.1752843, -0.9567577, 3.645486, 0, 0, 1, 1, 1,
0.1791081, 2.445642, 0.7727204, 1, 0, 0, 1, 1,
0.1818374, -0.2386826, 3.173531, 1, 0, 0, 1, 1,
0.1849585, -1.790205, 3.363858, 1, 0, 0, 1, 1,
0.1855344, 0.4298185, -0.2055775, 1, 0, 0, 1, 1,
0.1863687, -0.4699802, 3.886179, 1, 0, 0, 1, 1,
0.1868495, 0.4934082, 1.116327, 0, 0, 0, 1, 1,
0.1883308, 0.1031064, -0.6285851, 0, 0, 0, 1, 1,
0.1900777, -0.8665322, 3.004664, 0, 0, 0, 1, 1,
0.1912457, 1.072936, -0.4886281, 0, 0, 0, 1, 1,
0.1982002, 1.19259, 0.04925097, 0, 0, 0, 1, 1,
0.2004159, -1.073526, 2.910069, 0, 0, 0, 1, 1,
0.2026733, 0.2025187, 1.357167, 0, 0, 0, 1, 1,
0.2032442, 0.1318523, 1.795341, 1, 1, 1, 1, 1,
0.2044801, -0.3992271, 2.831164, 1, 1, 1, 1, 1,
0.206166, -1.795049, 4.924634, 1, 1, 1, 1, 1,
0.2067189, -0.9673164, 2.318713, 1, 1, 1, 1, 1,
0.2073422, 1.647017, -0.8353187, 1, 1, 1, 1, 1,
0.2074457, -1.892439, 3.023071, 1, 1, 1, 1, 1,
0.2084902, 1.064594, -0.1330454, 1, 1, 1, 1, 1,
0.2094278, -0.07518285, 1.790597, 1, 1, 1, 1, 1,
0.2143406, 2.275255, 0.1699488, 1, 1, 1, 1, 1,
0.2156566, 1.814781, 0.334597, 1, 1, 1, 1, 1,
0.2157963, -1.129263, 3.13162, 1, 1, 1, 1, 1,
0.216528, -0.1685511, 0.6225569, 1, 1, 1, 1, 1,
0.216997, -0.9417009, 2.524848, 1, 1, 1, 1, 1,
0.2170339, -0.8513017, 5.050968, 1, 1, 1, 1, 1,
0.220777, -0.124351, 2.421444, 1, 1, 1, 1, 1,
0.2224085, 1.161664, 0.05278387, 0, 0, 1, 1, 1,
0.2237082, -0.4012237, 2.251999, 1, 0, 0, 1, 1,
0.2288879, 1.227352, 0.3517843, 1, 0, 0, 1, 1,
0.2311831, -0.1774271, 3.292885, 1, 0, 0, 1, 1,
0.2316969, 0.4819272, -1.058572, 1, 0, 0, 1, 1,
0.2410702, 0.1213329, 2.688899, 1, 0, 0, 1, 1,
0.2468183, 0.7297994, 1.459726, 0, 0, 0, 1, 1,
0.24853, 0.2086506, 1.468999, 0, 0, 0, 1, 1,
0.253426, -1.341511, 2.36565, 0, 0, 0, 1, 1,
0.2537156, -1.553029, 4.621558, 0, 0, 0, 1, 1,
0.256937, -0.03734149, 2.332432, 0, 0, 0, 1, 1,
0.2589659, 1.360398, -0.6278514, 0, 0, 0, 1, 1,
0.2590751, -1.469215, 2.494304, 0, 0, 0, 1, 1,
0.2599491, -2.301285, 2.987211, 1, 1, 1, 1, 1,
0.26401, 0.1707504, 2.017703, 1, 1, 1, 1, 1,
0.264937, 0.108992, -0.4837937, 1, 1, 1, 1, 1,
0.2649643, 0.8017912, -0.4770361, 1, 1, 1, 1, 1,
0.2653945, 0.1053855, 1.869766, 1, 1, 1, 1, 1,
0.265832, -0.7749125, 4.253826, 1, 1, 1, 1, 1,
0.2668816, -0.5197627, 1.353692, 1, 1, 1, 1, 1,
0.2675392, 2.115625, 0.2829076, 1, 1, 1, 1, 1,
0.2695369, -0.005783283, 2.88675, 1, 1, 1, 1, 1,
0.2705518, 1.47484, 0.4172019, 1, 1, 1, 1, 1,
0.2851958, 0.005039521, 0.5997251, 1, 1, 1, 1, 1,
0.2858349, -0.2163311, 3.03197, 1, 1, 1, 1, 1,
0.2916681, -0.1091327, 2.315006, 1, 1, 1, 1, 1,
0.3004053, -2.344204, 2.233067, 1, 1, 1, 1, 1,
0.3018623, -0.8343183, 3.215181, 1, 1, 1, 1, 1,
0.3075314, 0.4487848, 1.732454, 0, 0, 1, 1, 1,
0.3100733, 0.4563295, 0.4347362, 1, 0, 0, 1, 1,
0.3195635, -0.9789992, 2.713335, 1, 0, 0, 1, 1,
0.3220063, 1.551604, -0.6784962, 1, 0, 0, 1, 1,
0.3232917, -0.07536828, 1.072711, 1, 0, 0, 1, 1,
0.3289264, -0.6002818, 1.637359, 1, 0, 0, 1, 1,
0.3299809, -1.067878, 3.439385, 0, 0, 0, 1, 1,
0.3311746, 0.9063282, 1.008244, 0, 0, 0, 1, 1,
0.3335998, 0.49032, 0.09581404, 0, 0, 0, 1, 1,
0.3337629, 0.7161106, 0.5883774, 0, 0, 0, 1, 1,
0.3343002, 1.237356, -0.1655772, 0, 0, 0, 1, 1,
0.3394592, -0.3353592, 2.725589, 0, 0, 0, 1, 1,
0.339732, -0.03746675, 1.156903, 0, 0, 0, 1, 1,
0.3397594, 1.216706, 0.4740178, 1, 1, 1, 1, 1,
0.3401658, -0.2533799, 2.374821, 1, 1, 1, 1, 1,
0.3404241, 0.2367658, 0.3212803, 1, 1, 1, 1, 1,
0.3447766, -0.3403656, 3.987106, 1, 1, 1, 1, 1,
0.3538237, -0.7562944, 2.237812, 1, 1, 1, 1, 1,
0.3555838, -2.092368, 2.912365, 1, 1, 1, 1, 1,
0.3589053, 0.496128, 0.967228, 1, 1, 1, 1, 1,
0.3740299, -1.119477, 3.382715, 1, 1, 1, 1, 1,
0.3743434, 0.7194653, 1.579385, 1, 1, 1, 1, 1,
0.3782881, -1.087014, 3.211041, 1, 1, 1, 1, 1,
0.3790566, 1.050929, 0.1788779, 1, 1, 1, 1, 1,
0.3790914, -0.6676891, 4.161341, 1, 1, 1, 1, 1,
0.3802948, 0.2411996, 1.393474, 1, 1, 1, 1, 1,
0.3824704, 0.237396, 1.576078, 1, 1, 1, 1, 1,
0.3834935, -0.6362693, 1.380914, 1, 1, 1, 1, 1,
0.3835455, 1.263693, 0.918368, 0, 0, 1, 1, 1,
0.3855839, 0.8896965, 1.189086, 1, 0, 0, 1, 1,
0.3869781, 0.1569428, 1.486696, 1, 0, 0, 1, 1,
0.3976783, 1.629965, 0.4156311, 1, 0, 0, 1, 1,
0.3995138, -0.1892809, 1.305079, 1, 0, 0, 1, 1,
0.4005333, -0.5685323, 1.672067, 1, 0, 0, 1, 1,
0.4013881, -0.4094408, 2.907493, 0, 0, 0, 1, 1,
0.4024595, 0.5637481, 1.196639, 0, 0, 0, 1, 1,
0.4061923, -0.4764481, 1.984474, 0, 0, 0, 1, 1,
0.4080451, 0.6338539, 2.155789, 0, 0, 0, 1, 1,
0.4129755, 0.2891745, 0.3935053, 0, 0, 0, 1, 1,
0.4166539, 0.8867885, 2.370959, 0, 0, 0, 1, 1,
0.4195594, 0.7493734, -0.6417491, 0, 0, 0, 1, 1,
0.4220445, 0.8430291, 0.2598576, 1, 1, 1, 1, 1,
0.4228586, 0.03924593, 1.921968, 1, 1, 1, 1, 1,
0.4243244, 0.5828655, 1.55097, 1, 1, 1, 1, 1,
0.4307421, -0.06376761, 1.838065, 1, 1, 1, 1, 1,
0.4316022, 0.2399892, 1.651224, 1, 1, 1, 1, 1,
0.4349076, -0.5205141, 3.955923, 1, 1, 1, 1, 1,
0.4365365, 0.008840633, 2.139238, 1, 1, 1, 1, 1,
0.4421003, 1.56665, -0.8827721, 1, 1, 1, 1, 1,
0.4432591, 0.453352, 0.7521572, 1, 1, 1, 1, 1,
0.4466649, 2.178328, 0.6287394, 1, 1, 1, 1, 1,
0.4524766, 0.9415761, 0.4167797, 1, 1, 1, 1, 1,
0.4525757, 0.8336456, 0.782912, 1, 1, 1, 1, 1,
0.4527018, -0.5488294, 3.133073, 1, 1, 1, 1, 1,
0.4560608, -1.634053, 2.064363, 1, 1, 1, 1, 1,
0.4572386, 0.09260792, 1.632262, 1, 1, 1, 1, 1,
0.4628741, 0.4042688, 2.485845, 0, 0, 1, 1, 1,
0.4676974, 1.522479, 0.337772, 1, 0, 0, 1, 1,
0.4777593, 0.1692575, 1.068873, 1, 0, 0, 1, 1,
0.486453, 0.2211332, 1.369513, 1, 0, 0, 1, 1,
0.4870899, 2.001711, 1.036499, 1, 0, 0, 1, 1,
0.4894511, -0.07061788, 1.152976, 1, 0, 0, 1, 1,
0.4909331, 0.3905974, 2.324541, 0, 0, 0, 1, 1,
0.4928176, -0.8106523, 2.931855, 0, 0, 0, 1, 1,
0.4988654, -0.3732297, 3.534423, 0, 0, 0, 1, 1,
0.5052466, 0.09029599, 2.291909, 0, 0, 0, 1, 1,
0.5161025, -1.271351, 3.985222, 0, 0, 0, 1, 1,
0.5161108, -1.00147, 1.791227, 0, 0, 0, 1, 1,
0.5162132, -0.1524123, 2.183733, 0, 0, 0, 1, 1,
0.519667, 0.1166657, 0.5517796, 1, 1, 1, 1, 1,
0.5244163, -1.57039, 3.675127, 1, 1, 1, 1, 1,
0.5256618, 0.4503465, 2.826651, 1, 1, 1, 1, 1,
0.533101, 0.3278814, 0.6183431, 1, 1, 1, 1, 1,
0.5332875, -0.2059744, 1.037257, 1, 1, 1, 1, 1,
0.5366822, 1.125847, 1.557126, 1, 1, 1, 1, 1,
0.5415094, -0.3243739, 1.072427, 1, 1, 1, 1, 1,
0.5489281, 0.8435199, 2.180186, 1, 1, 1, 1, 1,
0.5507253, 0.4031841, 0.8695493, 1, 1, 1, 1, 1,
0.5588351, 0.2700056, 2.02762, 1, 1, 1, 1, 1,
0.5621223, 1.28321, 0.5556431, 1, 1, 1, 1, 1,
0.5642544, 0.6153738, 1.119025, 1, 1, 1, 1, 1,
0.5725074, 0.3316986, 0.8946261, 1, 1, 1, 1, 1,
0.5741537, -1.51322, 1.780449, 1, 1, 1, 1, 1,
0.5765129, -0.5082362, 2.555452, 1, 1, 1, 1, 1,
0.5799797, -1.154525, 1.621521, 0, 0, 1, 1, 1,
0.5836079, -0.2810015, 1.383103, 1, 0, 0, 1, 1,
0.5875267, 0.7259698, -0.617837, 1, 0, 0, 1, 1,
0.5887929, 0.5847707, 1.723166, 1, 0, 0, 1, 1,
0.59156, 1.398068, -1.94093, 1, 0, 0, 1, 1,
0.6104751, -1.155946, 3.158075, 1, 0, 0, 1, 1,
0.6191615, 1.730232, 0.03637994, 0, 0, 0, 1, 1,
0.6204775, -0.07079701, 0.3783331, 0, 0, 0, 1, 1,
0.6221272, -0.06370012, 0.984325, 0, 0, 0, 1, 1,
0.6303198, -3.667827, 1.567785, 0, 0, 0, 1, 1,
0.633305, -0.7587859, 1.846555, 0, 0, 0, 1, 1,
0.636044, 1.179011, -1.032259, 0, 0, 0, 1, 1,
0.6375114, -1.653412, 2.91027, 0, 0, 0, 1, 1,
0.642909, -0.1051166, 3.188828, 1, 1, 1, 1, 1,
0.6483359, 0.4183356, 1.748579, 1, 1, 1, 1, 1,
0.6548777, -0.0482229, 1.633483, 1, 1, 1, 1, 1,
0.6611164, -0.4765314, 2.827061, 1, 1, 1, 1, 1,
0.6617655, 1.134377, 0.492492, 1, 1, 1, 1, 1,
0.6625459, -1.08968, 0.6801184, 1, 1, 1, 1, 1,
0.6668636, -1.527115, 3.683942, 1, 1, 1, 1, 1,
0.6669618, -0.5181153, 2.108378, 1, 1, 1, 1, 1,
0.6695522, -0.95441, 1.385569, 1, 1, 1, 1, 1,
0.6735619, -0.5181459, 2.052484, 1, 1, 1, 1, 1,
0.6741186, -0.08599626, 2.568086, 1, 1, 1, 1, 1,
0.6798657, -1.091011, 3.184063, 1, 1, 1, 1, 1,
0.6813035, -2.278585, 3.401787, 1, 1, 1, 1, 1,
0.685626, 0.8768076, 2.062738, 1, 1, 1, 1, 1,
0.6874548, -0.5545425, 1.901287, 1, 1, 1, 1, 1,
0.6891816, -1.49085, 3.255907, 0, 0, 1, 1, 1,
0.689863, -0.455964, 2.411239, 1, 0, 0, 1, 1,
0.690393, -0.7851781, 2.24415, 1, 0, 0, 1, 1,
0.6957931, -0.3996375, 1.555346, 1, 0, 0, 1, 1,
0.696815, -1.860475, 2.913704, 1, 0, 0, 1, 1,
0.6987073, 0.09092586, -0.08707341, 1, 0, 0, 1, 1,
0.7001786, -1.760165, 2.735736, 0, 0, 0, 1, 1,
0.7028436, 2.502493, -0.6466247, 0, 0, 0, 1, 1,
0.7099869, -0.09233014, 1.533081, 0, 0, 0, 1, 1,
0.7105699, -0.417226, 2.235339, 0, 0, 0, 1, 1,
0.7137656, -1.065318, 1.616232, 0, 0, 0, 1, 1,
0.7211177, 0.08217233, 2.033654, 0, 0, 0, 1, 1,
0.7227148, 0.6285477, 0.07435286, 0, 0, 0, 1, 1,
0.7231977, -0.5685417, 0.6829995, 1, 1, 1, 1, 1,
0.7286755, -1.266647, 2.655697, 1, 1, 1, 1, 1,
0.7301136, -0.1619532, 1.998806, 1, 1, 1, 1, 1,
0.7309362, -0.8187047, 2.873603, 1, 1, 1, 1, 1,
0.738848, -0.153616, 1.371836, 1, 1, 1, 1, 1,
0.7413595, -0.5465567, 1.706972, 1, 1, 1, 1, 1,
0.7425271, 0.6228222, 1.02549, 1, 1, 1, 1, 1,
0.7470108, -0.2967229, 2.054504, 1, 1, 1, 1, 1,
0.7496645, -1.993964, 4.599288, 1, 1, 1, 1, 1,
0.7570216, -1.327231, 3.430979, 1, 1, 1, 1, 1,
0.768572, 1.060421, 0.7759471, 1, 1, 1, 1, 1,
0.7818068, 0.5425335, 0.8650087, 1, 1, 1, 1, 1,
0.7850617, 1.130311, 0.8094198, 1, 1, 1, 1, 1,
0.7861444, 0.2111636, -0.05210064, 1, 1, 1, 1, 1,
0.7870036, 0.3388198, 1.819898, 1, 1, 1, 1, 1,
0.7875524, 1.763977, -2.492389, 0, 0, 1, 1, 1,
0.7926056, -0.6017857, 4.292688, 1, 0, 0, 1, 1,
0.7946289, -1.699158, 2.338706, 1, 0, 0, 1, 1,
0.7994982, 1.162809, 0.05289376, 1, 0, 0, 1, 1,
0.8059949, -0.6381821, 2.357784, 1, 0, 0, 1, 1,
0.8099647, -0.9451183, 4.060972, 1, 0, 0, 1, 1,
0.8115434, 1.47807, 1.226899, 0, 0, 0, 1, 1,
0.8121608, 0.2589352, 1.954072, 0, 0, 0, 1, 1,
0.8151735, 0.4614804, 1.900774, 0, 0, 0, 1, 1,
0.8194779, -0.2227484, 2.89613, 0, 0, 0, 1, 1,
0.8198612, -0.02413428, 2.879026, 0, 0, 0, 1, 1,
0.8267701, -0.08938093, 0.2642287, 0, 0, 0, 1, 1,
0.8319349, 0.5292587, 0.8449432, 0, 0, 0, 1, 1,
0.8359728, -1.187898, 2.783876, 1, 1, 1, 1, 1,
0.8360989, -0.834574, 3.266888, 1, 1, 1, 1, 1,
0.8431094, -0.6094772, 3.055233, 1, 1, 1, 1, 1,
0.8436211, 0.4555916, -1.157402, 1, 1, 1, 1, 1,
0.8449884, 0.1425305, 1.355399, 1, 1, 1, 1, 1,
0.8463808, 0.6258179, 1.252914, 1, 1, 1, 1, 1,
0.8463901, 1.325813, -0.9576968, 1, 1, 1, 1, 1,
0.8475564, -0.1924308, 0.8201178, 1, 1, 1, 1, 1,
0.8515785, -0.5393037, 1.939553, 1, 1, 1, 1, 1,
0.8632337, 0.6527779, 1.393474, 1, 1, 1, 1, 1,
0.8658928, 0.1716701, 1.322797, 1, 1, 1, 1, 1,
0.8665251, 0.3797106, 2.040246, 1, 1, 1, 1, 1,
0.8676146, -0.1882938, 1.552192, 1, 1, 1, 1, 1,
0.868551, 0.7815567, 1.038564, 1, 1, 1, 1, 1,
0.8707649, 0.1619928, 1.056091, 1, 1, 1, 1, 1,
0.8727005, 0.9969555, -0.5246415, 0, 0, 1, 1, 1,
0.8733239, 0.01101969, 2.334277, 1, 0, 0, 1, 1,
0.8740544, -0.7115983, 2.50365, 1, 0, 0, 1, 1,
0.8778982, 1.654738, -0.2490174, 1, 0, 0, 1, 1,
0.8805204, -0.7971631, 1.865207, 1, 0, 0, 1, 1,
0.8827265, 0.4146166, 1.813085, 1, 0, 0, 1, 1,
0.8855653, 1.092922, 1.808878, 0, 0, 0, 1, 1,
0.8895126, -1.458178, 2.562632, 0, 0, 0, 1, 1,
0.8917446, 0.1088995, 2.167612, 0, 0, 0, 1, 1,
0.8938861, 1.135993, 1.303887, 0, 0, 0, 1, 1,
0.899152, 0.3465555, 2.102463, 0, 0, 0, 1, 1,
0.8998345, 0.6885941, 1.581438, 0, 0, 0, 1, 1,
0.9015312, 0.01145368, 1.365281, 0, 0, 0, 1, 1,
0.9034579, 1.229769, -0.1621918, 1, 1, 1, 1, 1,
0.9044521, -1.05431, 3.655236, 1, 1, 1, 1, 1,
0.9049875, -0.03138907, 0.8726044, 1, 1, 1, 1, 1,
0.9064553, 1.069584, 1.924309, 1, 1, 1, 1, 1,
0.9071506, -1.382931, 1.504461, 1, 1, 1, 1, 1,
0.9256663, -0.01890171, 2.159852, 1, 1, 1, 1, 1,
0.929204, 0.01400344, -0.9629255, 1, 1, 1, 1, 1,
0.9325247, -1.880212, 2.613766, 1, 1, 1, 1, 1,
0.9328045, -0.2063462, 1.022925, 1, 1, 1, 1, 1,
0.9349681, 0.5196446, -0.2057311, 1, 1, 1, 1, 1,
0.9350592, 0.9162682, 0.7505613, 1, 1, 1, 1, 1,
0.9353252, 0.2755404, 1.623641, 1, 1, 1, 1, 1,
0.9399377, -1.955753, 3.580765, 1, 1, 1, 1, 1,
0.9426873, -0.379148, 3.052812, 1, 1, 1, 1, 1,
0.9583817, -0.6807709, 3.878691, 1, 1, 1, 1, 1,
0.964065, 0.7776588, 1.357662, 0, 0, 1, 1, 1,
0.9653401, -1.187944, 3.122216, 1, 0, 0, 1, 1,
0.9653633, 0.1468549, -0.4988777, 1, 0, 0, 1, 1,
0.9748161, 2.124502, -1.233997, 1, 0, 0, 1, 1,
0.9795229, 0.7980009, 1.224696, 1, 0, 0, 1, 1,
1.004048, 0.04090136, 1.501208, 1, 0, 0, 1, 1,
1.008147, -1.750911, 2.255003, 0, 0, 0, 1, 1,
1.011776, 0.6279572, 1.504863, 0, 0, 0, 1, 1,
1.015589, 0.4733687, 0.4753447, 0, 0, 0, 1, 1,
1.017071, 1.216052, 1.516931, 0, 0, 0, 1, 1,
1.021647, 0.2474979, 1.910467, 0, 0, 0, 1, 1,
1.021973, 0.4422141, 2.352567, 0, 0, 0, 1, 1,
1.039387, 0.5450007, 1.431038, 0, 0, 0, 1, 1,
1.040152, -0.7449807, 2.609099, 1, 1, 1, 1, 1,
1.051568, -0.2658853, 0.9703228, 1, 1, 1, 1, 1,
1.053298, 0.164679, 0.2279115, 1, 1, 1, 1, 1,
1.053909, -0.4808374, 3.146373, 1, 1, 1, 1, 1,
1.055505, -0.8825375, 2.401754, 1, 1, 1, 1, 1,
1.056293, -2.327609, 3.358034, 1, 1, 1, 1, 1,
1.057455, -0.3838183, 0.2842396, 1, 1, 1, 1, 1,
1.068471, 0.05226101, 3.612618, 1, 1, 1, 1, 1,
1.077337, 0.05113403, 1.880051, 1, 1, 1, 1, 1,
1.079324, -0.6538277, 0.3924296, 1, 1, 1, 1, 1,
1.088527, -0.1571489, 1.510135, 1, 1, 1, 1, 1,
1.091239, -1.764192, 3.964864, 1, 1, 1, 1, 1,
1.091363, 1.652564, 0.1120499, 1, 1, 1, 1, 1,
1.092029, -0.6229946, 1.233535, 1, 1, 1, 1, 1,
1.100504, -0.6429891, 2.072211, 1, 1, 1, 1, 1,
1.100507, -1.002918, 3.457763, 0, 0, 1, 1, 1,
1.113451, 0.3911703, 2.493976, 1, 0, 0, 1, 1,
1.117075, 0.4487811, 2.256797, 1, 0, 0, 1, 1,
1.134382, 0.6270603, 3.005239, 1, 0, 0, 1, 1,
1.134979, 0.7758901, 1.489882, 1, 0, 0, 1, 1,
1.139906, 0.8899202, -0.2009128, 1, 0, 0, 1, 1,
1.151082, 0.1764438, 1.16535, 0, 0, 0, 1, 1,
1.152394, 0.1817888, 2.649487, 0, 0, 0, 1, 1,
1.152793, 2.106924, 0.8913172, 0, 0, 0, 1, 1,
1.154577, -1.162721, 1.757664, 0, 0, 0, 1, 1,
1.157697, -0.4714358, 0.9077553, 0, 0, 0, 1, 1,
1.162568, -0.006386564, 2.163491, 0, 0, 0, 1, 1,
1.165605, 1.477963, 1.489184, 0, 0, 0, 1, 1,
1.166403, 0.293825, 0.5026725, 1, 1, 1, 1, 1,
1.167143, 1.055909, 3.096035, 1, 1, 1, 1, 1,
1.17796, 1.258348, -1.761867, 1, 1, 1, 1, 1,
1.187597, -0.04959518, 1.785716, 1, 1, 1, 1, 1,
1.19171, 1.169525, 0.5056303, 1, 1, 1, 1, 1,
1.192578, 1.155185, 0.8581302, 1, 1, 1, 1, 1,
1.195289, -0.1353997, 1.742075, 1, 1, 1, 1, 1,
1.196565, 1.462501, -0.08557298, 1, 1, 1, 1, 1,
1.198789, 0.5388409, 0.7815795, 1, 1, 1, 1, 1,
1.199836, -1.458164, 1.264509, 1, 1, 1, 1, 1,
1.207658, 1.329122, 0.3740063, 1, 1, 1, 1, 1,
1.221209, 0.764164, 0.9251634, 1, 1, 1, 1, 1,
1.230704, 1.554669, -0.4713694, 1, 1, 1, 1, 1,
1.236091, 0.8478966, 0.795335, 1, 1, 1, 1, 1,
1.238106, -0.7590276, 3.323536, 1, 1, 1, 1, 1,
1.244838, -1.219324, 1.959578, 0, 0, 1, 1, 1,
1.247573, 0.2327057, 2.551688, 1, 0, 0, 1, 1,
1.250192, -0.9476301, 2.414157, 1, 0, 0, 1, 1,
1.255368, -2.611315, 3.128017, 1, 0, 0, 1, 1,
1.279683, 0.5145901, 1.718989, 1, 0, 0, 1, 1,
1.295548, -1.429, 4.167808, 1, 0, 0, 1, 1,
1.296547, -1.471174, 0.6599043, 0, 0, 0, 1, 1,
1.300143, 1.026578, 0.4340543, 0, 0, 0, 1, 1,
1.304278, -1.312893, 2.315511, 0, 0, 0, 1, 1,
1.305069, -0.1363224, 0.4153228, 0, 0, 0, 1, 1,
1.31455, -1.542216, 2.97695, 0, 0, 0, 1, 1,
1.318867, -1.272586, 3.313589, 0, 0, 0, 1, 1,
1.328205, -2.090682, 2.633593, 0, 0, 0, 1, 1,
1.332204, -1.680417, 2.308778, 1, 1, 1, 1, 1,
1.334817, -0.09850602, 2.460678, 1, 1, 1, 1, 1,
1.335922, -0.05313051, 1.306857, 1, 1, 1, 1, 1,
1.348574, 0.139786, 1.665977, 1, 1, 1, 1, 1,
1.35284, -0.4287713, 2.200829, 1, 1, 1, 1, 1,
1.35329, 2.076023, 0.7103102, 1, 1, 1, 1, 1,
1.355362, 0.1870387, 0.2961577, 1, 1, 1, 1, 1,
1.366404, -1.150288, 2.636372, 1, 1, 1, 1, 1,
1.367896, -0.112128, 2.271814, 1, 1, 1, 1, 1,
1.369473, -1.516119, 1.564229, 1, 1, 1, 1, 1,
1.372443, -0.1323701, 3.447619, 1, 1, 1, 1, 1,
1.383518, -0.8211666, 1.887721, 1, 1, 1, 1, 1,
1.385308, 0.5819671, 0.3647581, 1, 1, 1, 1, 1,
1.386598, -1.958197, 2.951571, 1, 1, 1, 1, 1,
1.38743, 0.3163667, 1.574605, 1, 1, 1, 1, 1,
1.388068, -1.097045, 2.620114, 0, 0, 1, 1, 1,
1.39565, 0.06078244, 1.148146, 1, 0, 0, 1, 1,
1.403227, -0.5839064, 2.131262, 1, 0, 0, 1, 1,
1.403875, 2.9171, -0.0337817, 1, 0, 0, 1, 1,
1.430432, -0.5250834, 1.328588, 1, 0, 0, 1, 1,
1.446753, 0.07184885, 0.9275796, 1, 0, 0, 1, 1,
1.447956, 0.6213772, 0.5158383, 0, 0, 0, 1, 1,
1.448795, -0.8196627, 1.729178, 0, 0, 0, 1, 1,
1.449061, 0.286303, 2.24008, 0, 0, 0, 1, 1,
1.452469, -0.4768949, 2.274386, 0, 0, 0, 1, 1,
1.459249, 0.2322885, 0.8429238, 0, 0, 0, 1, 1,
1.459906, 1.397692, 0.4897164, 0, 0, 0, 1, 1,
1.461587, -0.044931, 1.790495, 0, 0, 0, 1, 1,
1.471508, -1.127335, 2.511773, 1, 1, 1, 1, 1,
1.478369, -1.043659, 1.343627, 1, 1, 1, 1, 1,
1.479604, 0.1189846, 1.368244, 1, 1, 1, 1, 1,
1.480507, -1.179089, 2.275678, 1, 1, 1, 1, 1,
1.480545, -0.3581634, 0.2815536, 1, 1, 1, 1, 1,
1.498066, 1.166528, 0.6215962, 1, 1, 1, 1, 1,
1.504404, -2.022301, 2.340491, 1, 1, 1, 1, 1,
1.506887, -0.5061653, 1.985449, 1, 1, 1, 1, 1,
1.516105, 0.722545, 2.461135, 1, 1, 1, 1, 1,
1.52019, -0.2928278, 0.7948093, 1, 1, 1, 1, 1,
1.551089, 1.295487, 1.824449, 1, 1, 1, 1, 1,
1.608706, -2.388928, 2.096625, 1, 1, 1, 1, 1,
1.608914, -0.03238874, 2.175049, 1, 1, 1, 1, 1,
1.618784, -0.8015156, 0.6331476, 1, 1, 1, 1, 1,
1.638834, 0.8243429, 0.6118981, 1, 1, 1, 1, 1,
1.645665, 1.183971, 1.033224, 0, 0, 1, 1, 1,
1.653246, 0.6851059, 2.251015, 1, 0, 0, 1, 1,
1.657959, -0.5016573, 1.133299, 1, 0, 0, 1, 1,
1.667191, 0.06930111, 2.013268, 1, 0, 0, 1, 1,
1.678996, -0.6147561, 1.811168, 1, 0, 0, 1, 1,
1.692688, -0.02873775, 0.2780524, 1, 0, 0, 1, 1,
1.70584, 0.01550263, 1.310054, 0, 0, 0, 1, 1,
1.715893, 1.381755, 0.8804713, 0, 0, 0, 1, 1,
1.731169, 1.210737, 2.157687, 0, 0, 0, 1, 1,
1.750867, -0.2832452, 3.098148, 0, 0, 0, 1, 1,
1.767952, -0.8838416, 3.882514, 0, 0, 0, 1, 1,
1.771414, -1.558428, 3.276729, 0, 0, 0, 1, 1,
1.782296, 1.430029, 0.413818, 0, 0, 0, 1, 1,
1.803711, -1.138267, 2.033427, 1, 1, 1, 1, 1,
1.825346, 0.3931445, 3.171937, 1, 1, 1, 1, 1,
1.840215, -2.211599, 2.269694, 1, 1, 1, 1, 1,
1.861122, 0.8047214, 2.066706, 1, 1, 1, 1, 1,
1.876381, 2.095292, 0.1596453, 1, 1, 1, 1, 1,
1.887787, 0.01057646, 0.8275622, 1, 1, 1, 1, 1,
1.891443, 0.08147902, 1.450912, 1, 1, 1, 1, 1,
1.906406, 0.9046844, -0.4430358, 1, 1, 1, 1, 1,
1.919329, 1.324426, 0.5701644, 1, 1, 1, 1, 1,
1.939094, -0.7818552, 3.395736, 1, 1, 1, 1, 1,
1.944729, 0.3539444, 3.215689, 1, 1, 1, 1, 1,
1.959827, -0.3323134, 1.774217, 1, 1, 1, 1, 1,
2.047225, -0.5826809, 3.064741, 1, 1, 1, 1, 1,
2.084892, 0.6665422, -1.769929, 1, 1, 1, 1, 1,
2.090735, 0.36627, 1.152984, 1, 1, 1, 1, 1,
2.097865, 0.735489, 1.325176, 0, 0, 1, 1, 1,
2.131898, -0.5720167, 2.266149, 1, 0, 0, 1, 1,
2.134807, -0.3136605, 2.386121, 1, 0, 0, 1, 1,
2.150987, 1.078219, 2.406872, 1, 0, 0, 1, 1,
2.156092, 0.2992594, 0.951381, 1, 0, 0, 1, 1,
2.177892, 0.2814214, 2.434741, 1, 0, 0, 1, 1,
2.182654, 0.6477642, 1.388237, 0, 0, 0, 1, 1,
2.194769, 1.150944, 2.702626, 0, 0, 0, 1, 1,
2.23716, -0.02054099, 1.207991, 0, 0, 0, 1, 1,
2.293672, -0.2628487, 0.704956, 0, 0, 0, 1, 1,
2.38753, 0.9939706, 1.215924, 0, 0, 0, 1, 1,
2.394396, 0.412663, 1.889262, 0, 0, 0, 1, 1,
2.448183, -0.2569222, 1.048596, 0, 0, 0, 1, 1,
2.46738, 0.184026, 1.004379, 1, 1, 1, 1, 1,
2.524439, -0.1380377, 0.8580714, 1, 1, 1, 1, 1,
2.526211, -0.2566202, 1.442608, 1, 1, 1, 1, 1,
2.619427, -0.0126788, 1.819569, 1, 1, 1, 1, 1,
2.988774, 0.3899155, 1.812003, 1, 1, 1, 1, 1,
3.174955, 0.2276834, 0.3548726, 1, 1, 1, 1, 1,
3.37172, -0.4689519, 1.297421, 1, 1, 1, 1, 1
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
var radius = 9.438005;
var distance = 33.15059;
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
mvMatrix.translate( -0.03073502, 0.2900577, -0.08376813 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.15059);
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
