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
-3.072203, 0.04773716, -0.8770707, 1, 0, 0, 1,
-2.868131, 0.907263, 0.0742499, 1, 0.007843138, 0, 1,
-2.543037, 0.4936998, -1.913151, 1, 0.01176471, 0, 1,
-2.453724, 1.049279, -2.358964, 1, 0.01960784, 0, 1,
-2.419707, -0.2112101, -1.875836, 1, 0.02352941, 0, 1,
-2.378449, 1.274832, -2.224297, 1, 0.03137255, 0, 1,
-2.374931, -0.2369304, -0.9278322, 1, 0.03529412, 0, 1,
-2.312856, -1.377254, -1.277298, 1, 0.04313726, 0, 1,
-2.301327, 1.092176, -0.371558, 1, 0.04705882, 0, 1,
-2.280234, 1.54245, -1.162256, 1, 0.05490196, 0, 1,
-2.270603, 0.4960227, 0.06022503, 1, 0.05882353, 0, 1,
-2.270047, -1.111481, -2.288883, 1, 0.06666667, 0, 1,
-2.174964, -0.03682247, -2.020681, 1, 0.07058824, 0, 1,
-2.165325, -0.4083223, -0.170512, 1, 0.07843138, 0, 1,
-2.133323, -1.287274, -1.707477, 1, 0.08235294, 0, 1,
-2.117573, 0.07650586, -1.820983, 1, 0.09019608, 0, 1,
-2.112437, -0.4335127, -2.711678, 1, 0.09411765, 0, 1,
-2.069918, -1.560805, -2.925229, 1, 0.1019608, 0, 1,
-2.055881, 1.408738, -1.939738, 1, 0.1098039, 0, 1,
-2.037745, 0.9306964, -1.163572, 1, 0.1137255, 0, 1,
-2.026981, 1.254311, -1.880939, 1, 0.1215686, 0, 1,
-2.025385, -1.16724, -2.773877, 1, 0.1254902, 0, 1,
-2.020182, -1.006229, -2.212327, 1, 0.1333333, 0, 1,
-2.014856, -0.4259837, -1.390589, 1, 0.1372549, 0, 1,
-1.99685, 1.472297, -2.213048, 1, 0.145098, 0, 1,
-1.996216, 0.9320408, -2.798298, 1, 0.1490196, 0, 1,
-1.990554, -1.805433, -3.548022, 1, 0.1568628, 0, 1,
-1.977636, -0.2118931, -1.851786, 1, 0.1607843, 0, 1,
-1.93595, -0.7449511, -0.4663625, 1, 0.1686275, 0, 1,
-1.925816, 0.7138194, 0.1027211, 1, 0.172549, 0, 1,
-1.923568, -0.5072405, -1.395183, 1, 0.1803922, 0, 1,
-1.922846, 0.9966456, -0.8740341, 1, 0.1843137, 0, 1,
-1.916738, -1.703208, -1.086953, 1, 0.1921569, 0, 1,
-1.871567, -0.5657775, -2.654086, 1, 0.1960784, 0, 1,
-1.829216, -0.255887, -1.0918, 1, 0.2039216, 0, 1,
-1.828403, -2.337444, -2.406993, 1, 0.2117647, 0, 1,
-1.816614, -1.071258, -0.6032037, 1, 0.2156863, 0, 1,
-1.806809, -0.3964394, -1.019328, 1, 0.2235294, 0, 1,
-1.789974, -0.4555413, -1.202932, 1, 0.227451, 0, 1,
-1.787885, 0.1427268, -2.331003, 1, 0.2352941, 0, 1,
-1.76038, 1.128485, 0.04451084, 1, 0.2392157, 0, 1,
-1.754681, -0.07294644, -1.764763, 1, 0.2470588, 0, 1,
-1.754178, 0.204866, -1.701081, 1, 0.2509804, 0, 1,
-1.748323, 1.211315, -0.6316777, 1, 0.2588235, 0, 1,
-1.743331, -0.8922217, -1.433513, 1, 0.2627451, 0, 1,
-1.734241, -0.1742631, -1.67376, 1, 0.2705882, 0, 1,
-1.715135, -1.475938, -4.58132, 1, 0.2745098, 0, 1,
-1.701378, 0.6709692, -1.317648, 1, 0.282353, 0, 1,
-1.701153, -1.508288, -2.834102, 1, 0.2862745, 0, 1,
-1.696744, -0.5222303, -2.489361, 1, 0.2941177, 0, 1,
-1.696138, -1.269889, -0.8700052, 1, 0.3019608, 0, 1,
-1.695644, 0.9546615, 0.3970606, 1, 0.3058824, 0, 1,
-1.684995, 1.402482, -1.011724, 1, 0.3137255, 0, 1,
-1.652027, 0.7988999, -0.7169548, 1, 0.3176471, 0, 1,
-1.64192, 1.209844, -2.627346, 1, 0.3254902, 0, 1,
-1.623102, -0.1711955, -2.367434, 1, 0.3294118, 0, 1,
-1.618321, 0.3555867, -0.2216871, 1, 0.3372549, 0, 1,
-1.605786, -0.4389161, -1.443153, 1, 0.3411765, 0, 1,
-1.59469, -0.5941289, -0.5356945, 1, 0.3490196, 0, 1,
-1.59377, -0.1719267, -0.6337492, 1, 0.3529412, 0, 1,
-1.592938, -1.079857, -1.162495, 1, 0.3607843, 0, 1,
-1.591322, -1.789714, -2.897991, 1, 0.3647059, 0, 1,
-1.587038, 1.281515, -1.779824, 1, 0.372549, 0, 1,
-1.582065, 0.3218161, -1.695323, 1, 0.3764706, 0, 1,
-1.558582, 0.3578933, -0.9428391, 1, 0.3843137, 0, 1,
-1.547935, -0.911968, -2.440002, 1, 0.3882353, 0, 1,
-1.539285, 0.3615717, -1.107854, 1, 0.3960784, 0, 1,
-1.536649, 1.246544, -0.1909036, 1, 0.4039216, 0, 1,
-1.527938, -0.3990941, -0.4809968, 1, 0.4078431, 0, 1,
-1.513942, -0.264894, -2.076659, 1, 0.4156863, 0, 1,
-1.496119, 0.4597885, -1.540075, 1, 0.4196078, 0, 1,
-1.488125, -1.101188, -1.135399, 1, 0.427451, 0, 1,
-1.466803, 1.041048, 1.350632, 1, 0.4313726, 0, 1,
-1.464336, 0.5311354, -2.516646, 1, 0.4392157, 0, 1,
-1.462933, -1.11082, -4.793431, 1, 0.4431373, 0, 1,
-1.462351, 0.4928428, -3.003906, 1, 0.4509804, 0, 1,
-1.4506, 0.5031732, -1.911805, 1, 0.454902, 0, 1,
-1.42637, 0.1023283, -0.8331599, 1, 0.4627451, 0, 1,
-1.421039, -0.1592016, -1.396055, 1, 0.4666667, 0, 1,
-1.416215, 0.004188929, -1.674721, 1, 0.4745098, 0, 1,
-1.408001, -0.8301243, -3.633766, 1, 0.4784314, 0, 1,
-1.403283, 2.130677, -0.451275, 1, 0.4862745, 0, 1,
-1.401301, -0.4863277, -1.028516, 1, 0.4901961, 0, 1,
-1.388773, 1.802029, -0.370888, 1, 0.4980392, 0, 1,
-1.38725, 1.11543, -0.1820654, 1, 0.5058824, 0, 1,
-1.384937, 0.4734815, 0.03674804, 1, 0.509804, 0, 1,
-1.384738, 0.9823878, -0.3816104, 1, 0.5176471, 0, 1,
-1.37302, -1.247338, -3.501436, 1, 0.5215687, 0, 1,
-1.367675, 0.1546179, -1.52699, 1, 0.5294118, 0, 1,
-1.366409, -0.2065448, 0.1048009, 1, 0.5333334, 0, 1,
-1.362779, 2.021739, -1.038486, 1, 0.5411765, 0, 1,
-1.361363, 0.5515099, -0.9102778, 1, 0.5450981, 0, 1,
-1.35861, -0.1683953, -2.713349, 1, 0.5529412, 0, 1,
-1.341685, -0.3216922, -1.665566, 1, 0.5568628, 0, 1,
-1.337752, -0.005101457, -2.223605, 1, 0.5647059, 0, 1,
-1.330808, 1.544183, -2.564358, 1, 0.5686275, 0, 1,
-1.329773, -0.6227986, -0.7887174, 1, 0.5764706, 0, 1,
-1.328732, -0.328048, -3.49188, 1, 0.5803922, 0, 1,
-1.323961, 0.8067768, -0.09943594, 1, 0.5882353, 0, 1,
-1.314669, 1.825252, -0.2290091, 1, 0.5921569, 0, 1,
-1.313126, 0.5502667, -1.649231, 1, 0.6, 0, 1,
-1.303519, 0.1983611, -1.985015, 1, 0.6078432, 0, 1,
-1.301938, 0.3395387, -2.063333, 1, 0.6117647, 0, 1,
-1.298386, 2.150132, -0.8284851, 1, 0.6196079, 0, 1,
-1.286455, 2.342219, -0.8749599, 1, 0.6235294, 0, 1,
-1.285397, -0.7256218, -2.775938, 1, 0.6313726, 0, 1,
-1.283765, 1.349481, -0.3486737, 1, 0.6352941, 0, 1,
-1.266582, -1.452254, -2.737935, 1, 0.6431373, 0, 1,
-1.266176, 1.689344, -1.335645, 1, 0.6470588, 0, 1,
-1.26417, 0.2285991, -3.010894, 1, 0.654902, 0, 1,
-1.257412, -0.2275203, -1.566827, 1, 0.6588235, 0, 1,
-1.251908, 0.900827, -1.332503, 1, 0.6666667, 0, 1,
-1.236015, 0.2864153, -1.46175, 1, 0.6705883, 0, 1,
-1.235934, -0.1050887, -1.305303, 1, 0.6784314, 0, 1,
-1.232845, -0.4114651, -3.140341, 1, 0.682353, 0, 1,
-1.216914, -0.4628528, -2.018715, 1, 0.6901961, 0, 1,
-1.213153, 0.4088596, -1.509839, 1, 0.6941177, 0, 1,
-1.210672, -0.6092569, -2.17371, 1, 0.7019608, 0, 1,
-1.20672, -1.054615, -1.390897, 1, 0.7098039, 0, 1,
-1.201064, -1.216677, -2.906039, 1, 0.7137255, 0, 1,
-1.186024, 0.4651904, -0.3238911, 1, 0.7215686, 0, 1,
-1.182303, -1.110618, -1.87913, 1, 0.7254902, 0, 1,
-1.175604, -0.2442434, -1.708366, 1, 0.7333333, 0, 1,
-1.174136, 0.2282141, -0.2298888, 1, 0.7372549, 0, 1,
-1.170874, 0.404866, -0.8702611, 1, 0.7450981, 0, 1,
-1.1697, -0.2429778, -2.786857, 1, 0.7490196, 0, 1,
-1.160584, -0.2130734, -3.715235, 1, 0.7568628, 0, 1,
-1.144341, -1.225056, -2.074831, 1, 0.7607843, 0, 1,
-1.141898, -0.06015191, -0.1881692, 1, 0.7686275, 0, 1,
-1.138624, 0.7435911, -0.6747295, 1, 0.772549, 0, 1,
-1.137863, 0.4021688, -0.9675236, 1, 0.7803922, 0, 1,
-1.133224, -0.9086998, -3.388682, 1, 0.7843137, 0, 1,
-1.123939, -1.490304, -3.257763, 1, 0.7921569, 0, 1,
-1.123256, -0.2102161, -1.963411, 1, 0.7960784, 0, 1,
-1.114406, -1.05736, -2.680734, 1, 0.8039216, 0, 1,
-1.107036, -0.341192, -0.3258237, 1, 0.8117647, 0, 1,
-1.106251, 0.2621439, -2.140575, 1, 0.8156863, 0, 1,
-1.103606, -0.001683851, -1.401452, 1, 0.8235294, 0, 1,
-1.103397, -0.5458871, -3.104546, 1, 0.827451, 0, 1,
-1.103274, -0.9968675, -3.636761, 1, 0.8352941, 0, 1,
-1.098744, -1.194792, -2.723437, 1, 0.8392157, 0, 1,
-1.093024, -0.3620992, -0.3105814, 1, 0.8470588, 0, 1,
-1.091991, -1.644774, -3.828909, 1, 0.8509804, 0, 1,
-1.076336, -0.1103149, -2.834713, 1, 0.8588235, 0, 1,
-1.075029, -0.2236487, -1.539032, 1, 0.8627451, 0, 1,
-1.059452, 0.9221494, -0.2719582, 1, 0.8705882, 0, 1,
-1.054543, 1.304274, 0.4413202, 1, 0.8745098, 0, 1,
-1.054465, -1.604867, -3.472102, 1, 0.8823529, 0, 1,
-1.049324, 0.4800563, -0.8452168, 1, 0.8862745, 0, 1,
-1.04906, 0.02139995, -2.242159, 1, 0.8941177, 0, 1,
-1.034998, 0.6093094, -1.184312, 1, 0.8980392, 0, 1,
-1.027479, 1.329102, -3.228087, 1, 0.9058824, 0, 1,
-1.026348, -1.562446, -1.510073, 1, 0.9137255, 0, 1,
-1.026212, 1.349756, 0.7701298, 1, 0.9176471, 0, 1,
-1.024249, 0.5508151, -0.8864962, 1, 0.9254902, 0, 1,
-1.020365, 0.8405931, -1.564842, 1, 0.9294118, 0, 1,
-1.020237, 0.6601427, -1.564447, 1, 0.9372549, 0, 1,
-1.013218, 0.6971378, -2.657882, 1, 0.9411765, 0, 1,
-1.010121, -0.01368513, -1.858606, 1, 0.9490196, 0, 1,
-1.006098, 0.04155914, -0.1021224, 1, 0.9529412, 0, 1,
-1.00577, 0.1602598, -0.401753, 1, 0.9607843, 0, 1,
-0.9960086, 1.386098, 0.9220829, 1, 0.9647059, 0, 1,
-0.9926968, 2.767033, 1.344419, 1, 0.972549, 0, 1,
-0.9913577, -0.948133, -1.129976, 1, 0.9764706, 0, 1,
-0.987126, 0.4299259, 0.80829, 1, 0.9843137, 0, 1,
-0.97658, 1.003921, -1.285086, 1, 0.9882353, 0, 1,
-0.966814, -0.2777363, -1.132376, 1, 0.9960784, 0, 1,
-0.9635258, 0.1711888, -1.829924, 0.9960784, 1, 0, 1,
-0.9627789, 1.318828, -0.1355737, 0.9921569, 1, 0, 1,
-0.9626216, 0.4500552, -1.471596, 0.9843137, 1, 0, 1,
-0.9625973, -2.757028, -2.186601, 0.9803922, 1, 0, 1,
-0.9600804, -0.02073021, -0.8899674, 0.972549, 1, 0, 1,
-0.9487072, 0.4735276, -0.3029215, 0.9686275, 1, 0, 1,
-0.9401869, -1.211414, -2.041721, 0.9607843, 1, 0, 1,
-0.9347305, 1.13522, 1.846817, 0.9568627, 1, 0, 1,
-0.9343112, 0.4763808, -0.1418346, 0.9490196, 1, 0, 1,
-0.933144, -2.179524, -3.320882, 0.945098, 1, 0, 1,
-0.9323236, -0.4486278, -2.36507, 0.9372549, 1, 0, 1,
-0.9312737, 0.9031422, -0.8682442, 0.9333333, 1, 0, 1,
-0.9292356, -0.9321741, -1.984838, 0.9254902, 1, 0, 1,
-0.9291489, -0.2337006, -2.061459, 0.9215686, 1, 0, 1,
-0.9287139, 0.2645383, -1.77251, 0.9137255, 1, 0, 1,
-0.9193556, 1.008868, -0.286922, 0.9098039, 1, 0, 1,
-0.9144964, 1.82381, -0.9303936, 0.9019608, 1, 0, 1,
-0.9140953, -1.748296, -1.632771, 0.8941177, 1, 0, 1,
-0.9063496, -1.205975, -2.313085, 0.8901961, 1, 0, 1,
-0.9006096, 0.3102719, -0.5754685, 0.8823529, 1, 0, 1,
-0.9000796, 0.3060319, -0.4884892, 0.8784314, 1, 0, 1,
-0.8920355, -1.459491, -2.908721, 0.8705882, 1, 0, 1,
-0.8780979, 0.3353122, -2.482192, 0.8666667, 1, 0, 1,
-0.8766304, -1.096923, -2.213465, 0.8588235, 1, 0, 1,
-0.8743652, -0.8172501, -2.575178, 0.854902, 1, 0, 1,
-0.8630547, -0.3153331, -2.073355, 0.8470588, 1, 0, 1,
-0.8613533, -0.6721936, -1.480498, 0.8431373, 1, 0, 1,
-0.8604366, 0.4826574, -1.624687, 0.8352941, 1, 0, 1,
-0.8547676, -1.872255, -1.587965, 0.8313726, 1, 0, 1,
-0.8546852, 0.8129598, -0.9339228, 0.8235294, 1, 0, 1,
-0.8537039, -1.222657, -1.838217, 0.8196079, 1, 0, 1,
-0.8466101, -0.8298486, -2.36142, 0.8117647, 1, 0, 1,
-0.832687, -2.510169, -2.869311, 0.8078431, 1, 0, 1,
-0.8320479, 0.8384021, -0.1919674, 0.8, 1, 0, 1,
-0.8263153, 0.0652601, -2.010262, 0.7921569, 1, 0, 1,
-0.8225277, 2.170605, -0.2485088, 0.7882353, 1, 0, 1,
-0.8179587, -0.2375915, -4.302505, 0.7803922, 1, 0, 1,
-0.8178962, -2.296962, -2.6119, 0.7764706, 1, 0, 1,
-0.8175075, 2.122488, -0.7986771, 0.7686275, 1, 0, 1,
-0.8139908, 2.364034, -0.07316497, 0.7647059, 1, 0, 1,
-0.8109531, 0.7774813, -1.655253, 0.7568628, 1, 0, 1,
-0.809177, -1.919802, -2.648581, 0.7529412, 1, 0, 1,
-0.8048855, -0.556551, -1.236966, 0.7450981, 1, 0, 1,
-0.796303, -0.1266996, -2.785903, 0.7411765, 1, 0, 1,
-0.7926024, 0.1255645, -1.828081, 0.7333333, 1, 0, 1,
-0.7915014, 1.02644, 0.8521876, 0.7294118, 1, 0, 1,
-0.7914966, 1.553107, -0.1623899, 0.7215686, 1, 0, 1,
-0.7885831, 0.2142506, -0.06370153, 0.7176471, 1, 0, 1,
-0.7834854, -0.2318759, -2.295853, 0.7098039, 1, 0, 1,
-0.7778072, 0.3726785, -0.9589009, 0.7058824, 1, 0, 1,
-0.7641619, -0.1285582, -1.519574, 0.6980392, 1, 0, 1,
-0.7638403, -0.7785106, -3.070392, 0.6901961, 1, 0, 1,
-0.7620212, 0.4631498, 0.4725224, 0.6862745, 1, 0, 1,
-0.7586645, 1.066973, -0.1975617, 0.6784314, 1, 0, 1,
-0.7570686, 0.5075655, -1.00589, 0.6745098, 1, 0, 1,
-0.7513824, 1.79565, -0.1257546, 0.6666667, 1, 0, 1,
-0.7506707, 0.5691957, -2.308603, 0.6627451, 1, 0, 1,
-0.7420571, -0.1703673, -1.63269, 0.654902, 1, 0, 1,
-0.7400831, 0.6977877, -0.6381683, 0.6509804, 1, 0, 1,
-0.7378371, 0.934964, 0.8077906, 0.6431373, 1, 0, 1,
-0.7351819, 0.5629935, -1.881806, 0.6392157, 1, 0, 1,
-0.7330573, -1.241854, -1.982374, 0.6313726, 1, 0, 1,
-0.7240881, 1.836238, -0.7284932, 0.627451, 1, 0, 1,
-0.7210731, 0.01622893, -0.0423574, 0.6196079, 1, 0, 1,
-0.7200359, -2.491507, -1.158477, 0.6156863, 1, 0, 1,
-0.7041033, -0.7552078, -3.443197, 0.6078432, 1, 0, 1,
-0.7040551, 0.2430076, -2.639633, 0.6039216, 1, 0, 1,
-0.7026629, -1.090024, -1.334954, 0.5960785, 1, 0, 1,
-0.7024336, -2.339683, -3.121741, 0.5882353, 1, 0, 1,
-0.6935987, -0.2415218, -4.168373, 0.5843138, 1, 0, 1,
-0.691217, 1.035244, -1.946933, 0.5764706, 1, 0, 1,
-0.6865677, -0.9791219, -2.228252, 0.572549, 1, 0, 1,
-0.685758, 1.896073, 0.04902844, 0.5647059, 1, 0, 1,
-0.6794124, -0.1532199, -1.888867, 0.5607843, 1, 0, 1,
-0.6785349, -0.7641029, -1.654837, 0.5529412, 1, 0, 1,
-0.6754081, -0.4093955, -0.9533362, 0.5490196, 1, 0, 1,
-0.6700065, -1.404474, -2.826763, 0.5411765, 1, 0, 1,
-0.661928, 0.9647483, 2.351103, 0.5372549, 1, 0, 1,
-0.6577833, -0.3233293, -2.395444, 0.5294118, 1, 0, 1,
-0.6563769, 0.4064874, -2.325897, 0.5254902, 1, 0, 1,
-0.6540902, -0.06509287, -2.102659, 0.5176471, 1, 0, 1,
-0.6540084, -0.3352773, -2.078292, 0.5137255, 1, 0, 1,
-0.6483514, -1.371586, -2.485106, 0.5058824, 1, 0, 1,
-0.6423898, -0.3203619, -2.514018, 0.5019608, 1, 0, 1,
-0.6361039, -0.2920349, -1.571588, 0.4941176, 1, 0, 1,
-0.6341804, -0.04980179, -1.832984, 0.4862745, 1, 0, 1,
-0.6195278, 0.2357274, -1.183958, 0.4823529, 1, 0, 1,
-0.6189891, -0.1661511, -0.4799391, 0.4745098, 1, 0, 1,
-0.6171662, -0.893853, -3.299037, 0.4705882, 1, 0, 1,
-0.6161459, 0.007643465, -2.899981, 0.4627451, 1, 0, 1,
-0.6152404, 0.2396432, -1.836831, 0.4588235, 1, 0, 1,
-0.5967273, 0.3439354, 0.4092653, 0.4509804, 1, 0, 1,
-0.5905952, 0.7557812, -0.9316584, 0.4470588, 1, 0, 1,
-0.5897125, -1.834876, -3.118186, 0.4392157, 1, 0, 1,
-0.5894094, 0.049732, -2.50176, 0.4352941, 1, 0, 1,
-0.5861933, -0.168617, -3.428699, 0.427451, 1, 0, 1,
-0.582507, -1.093966, -3.689782, 0.4235294, 1, 0, 1,
-0.5798412, -0.0485467, -3.181258, 0.4156863, 1, 0, 1,
-0.577885, -0.8308231, -3.154472, 0.4117647, 1, 0, 1,
-0.5770912, 0.4375776, -1.69426, 0.4039216, 1, 0, 1,
-0.5758967, 0.6524243, -0.9843341, 0.3960784, 1, 0, 1,
-0.5726174, 1.21849, -2.151633, 0.3921569, 1, 0, 1,
-0.5725221, -0.2977167, -2.065434, 0.3843137, 1, 0, 1,
-0.5687479, -0.6952484, -2.403277, 0.3803922, 1, 0, 1,
-0.5685648, -1.656341, -1.427141, 0.372549, 1, 0, 1,
-0.568396, -0.6197055, -1.288338, 0.3686275, 1, 0, 1,
-0.5639927, 0.1535992, -0.3939187, 0.3607843, 1, 0, 1,
-0.5633576, 0.45529, -0.3838538, 0.3568628, 1, 0, 1,
-0.5623617, 0.8461661, -0.1274396, 0.3490196, 1, 0, 1,
-0.5620012, -1.729375, -1.222154, 0.345098, 1, 0, 1,
-0.5615315, 0.4571541, -0.6410858, 0.3372549, 1, 0, 1,
-0.5567346, -1.03325, -3.193435, 0.3333333, 1, 0, 1,
-0.5556901, -1.248836, -2.797494, 0.3254902, 1, 0, 1,
-0.554765, 1.36552, -0.9866851, 0.3215686, 1, 0, 1,
-0.5526773, 0.01196441, -1.854051, 0.3137255, 1, 0, 1,
-0.5509341, 0.9012175, 0.3069295, 0.3098039, 1, 0, 1,
-0.5484415, 0.2449037, -1.78654, 0.3019608, 1, 0, 1,
-0.5384971, 0.6803423, 0.2541443, 0.2941177, 1, 0, 1,
-0.5383333, -0.1493837, -0.895774, 0.2901961, 1, 0, 1,
-0.5372294, -0.8978729, -3.176523, 0.282353, 1, 0, 1,
-0.5364669, -0.4781501, -1.913396, 0.2784314, 1, 0, 1,
-0.5347178, 0.3730382, -1.434995, 0.2705882, 1, 0, 1,
-0.5332407, -1.783953, -2.399858, 0.2666667, 1, 0, 1,
-0.5309997, -0.7376729, -3.107554, 0.2588235, 1, 0, 1,
-0.529694, 1.046444, -0.2856777, 0.254902, 1, 0, 1,
-0.5282602, 0.06957946, -0.5327311, 0.2470588, 1, 0, 1,
-0.5265215, -1.488173, -2.311035, 0.2431373, 1, 0, 1,
-0.5254714, -0.6182286, -1.390739, 0.2352941, 1, 0, 1,
-0.5242227, -0.8869968, -3.070729, 0.2313726, 1, 0, 1,
-0.5232534, -0.1592064, -1.014701, 0.2235294, 1, 0, 1,
-0.5189894, -0.5412062, -1.236232, 0.2196078, 1, 0, 1,
-0.5178142, -2.143472, -4.068213, 0.2117647, 1, 0, 1,
-0.515114, -0.6712898, -1.539752, 0.2078431, 1, 0, 1,
-0.5060861, -0.7234462, -2.973535, 0.2, 1, 0, 1,
-0.5045477, -0.2518329, -1.996874, 0.1921569, 1, 0, 1,
-0.504072, 0.2122706, -0.8504708, 0.1882353, 1, 0, 1,
-0.5024773, -0.4842582, -2.500061, 0.1803922, 1, 0, 1,
-0.5009732, 0.886086, -0.3618779, 0.1764706, 1, 0, 1,
-0.4991359, -0.6013932, -2.494504, 0.1686275, 1, 0, 1,
-0.4930435, 0.1871188, -0.5564395, 0.1647059, 1, 0, 1,
-0.4917537, 0.8900989, -1.241048, 0.1568628, 1, 0, 1,
-0.4892739, 0.7663265, 1.349141, 0.1529412, 1, 0, 1,
-0.4875261, -1.354313, -1.977726, 0.145098, 1, 0, 1,
-0.4854478, 1.401143, -0.4369939, 0.1411765, 1, 0, 1,
-0.4845909, -0.2276436, -2.730313, 0.1333333, 1, 0, 1,
-0.4805577, -0.4817838, -0.7426696, 0.1294118, 1, 0, 1,
-0.4746814, -1.082492, -3.297908, 0.1215686, 1, 0, 1,
-0.4636677, -0.3144339, -1.608054, 0.1176471, 1, 0, 1,
-0.4628441, 0.04835957, -1.087091, 0.1098039, 1, 0, 1,
-0.4628205, -0.2203263, -2.555905, 0.1058824, 1, 0, 1,
-0.4626828, -0.9206339, -1.36122, 0.09803922, 1, 0, 1,
-0.4617183, -0.9438926, -2.090914, 0.09019608, 1, 0, 1,
-0.4547661, -0.6662688, -2.440288, 0.08627451, 1, 0, 1,
-0.450776, 0.1009722, -0.5033373, 0.07843138, 1, 0, 1,
-0.4505443, -0.2748335, -0.50188, 0.07450981, 1, 0, 1,
-0.4449441, -0.2264906, -3.660263, 0.06666667, 1, 0, 1,
-0.4424322, 0.6139418, -0.8157052, 0.0627451, 1, 0, 1,
-0.4422538, 0.197797, 0.5291743, 0.05490196, 1, 0, 1,
-0.4401494, 0.2875207, -2.243137, 0.05098039, 1, 0, 1,
-0.4394555, -0.5492433, -4.228493, 0.04313726, 1, 0, 1,
-0.4387803, -0.373717, -1.769551, 0.03921569, 1, 0, 1,
-0.4375508, -1.443926, -1.64057, 0.03137255, 1, 0, 1,
-0.4308616, 0.1782337, -1.442312, 0.02745098, 1, 0, 1,
-0.4280228, 0.7248545, -1.615059, 0.01960784, 1, 0, 1,
-0.420234, 0.482734, -0.5842335, 0.01568628, 1, 0, 1,
-0.4168225, -1.205199, -3.294587, 0.007843138, 1, 0, 1,
-0.4162044, 1.551451, 0.7335811, 0.003921569, 1, 0, 1,
-0.4122573, -0.3491452, -1.895046, 0, 1, 0.003921569, 1,
-0.4117886, 0.2059235, -0.799152, 0, 1, 0.01176471, 1,
-0.4089791, 0.267893, -1.310702, 0, 1, 0.01568628, 1,
-0.4070498, -0.889491, -3.436423, 0, 1, 0.02352941, 1,
-0.4041271, 0.7148017, -2.210838, 0, 1, 0.02745098, 1,
-0.4040216, -0.8741919, -2.668525, 0, 1, 0.03529412, 1,
-0.4036664, 0.5141757, -1.382455, 0, 1, 0.03921569, 1,
-0.3977322, -1.003516, -3.698795, 0, 1, 0.04705882, 1,
-0.3974799, -0.4735047, -2.690983, 0, 1, 0.05098039, 1,
-0.3969508, 0.03191014, -2.25722, 0, 1, 0.05882353, 1,
-0.3961122, 0.8521056, -2.06034, 0, 1, 0.0627451, 1,
-0.3949431, -0.6540693, -3.110056, 0, 1, 0.07058824, 1,
-0.3908217, -0.259689, -2.606399, 0, 1, 0.07450981, 1,
-0.3871139, 1.089258, -0.03421933, 0, 1, 0.08235294, 1,
-0.3870245, 1.027764, -0.01730152, 0, 1, 0.08627451, 1,
-0.3869961, -0.7199132, -4.704483, 0, 1, 0.09411765, 1,
-0.3836116, -1.258011, -2.99322, 0, 1, 0.1019608, 1,
-0.3828735, -0.2914991, -1.754851, 0, 1, 0.1058824, 1,
-0.3828113, -1.483992, -1.468613, 0, 1, 0.1137255, 1,
-0.3809754, 0.02320543, 0.575441, 0, 1, 0.1176471, 1,
-0.3796102, 0.180925, -2.112722, 0, 1, 0.1254902, 1,
-0.3777517, -0.960887, -2.087118, 0, 1, 0.1294118, 1,
-0.3725783, -0.511384, -2.578388, 0, 1, 0.1372549, 1,
-0.3711857, 0.286522, -1.896628, 0, 1, 0.1411765, 1,
-0.3636426, 1.327312, 0.02462685, 0, 1, 0.1490196, 1,
-0.3610323, 0.8945603, 0.5638732, 0, 1, 0.1529412, 1,
-0.3589235, 2.746586, -1.945494, 0, 1, 0.1607843, 1,
-0.3551891, 1.699833, -0.8143895, 0, 1, 0.1647059, 1,
-0.3544659, -0.398704, -2.034769, 0, 1, 0.172549, 1,
-0.352312, 0.6823601, -0.2272228, 0, 1, 0.1764706, 1,
-0.3341144, -0.805271, -5.135299, 0, 1, 0.1843137, 1,
-0.3326651, 0.8153889, -0.7988405, 0, 1, 0.1882353, 1,
-0.3267415, 0.4599626, -0.4387158, 0, 1, 0.1960784, 1,
-0.3262671, 0.2884555, -1.156677, 0, 1, 0.2039216, 1,
-0.3254378, -0.8398914, -2.539069, 0, 1, 0.2078431, 1,
-0.3228851, -0.1404173, -0.4044024, 0, 1, 0.2156863, 1,
-0.3166769, -0.2182418, -2.078421, 0, 1, 0.2196078, 1,
-0.3150403, 0.5096722, -1.10183, 0, 1, 0.227451, 1,
-0.3096329, -0.8714923, -2.970588, 0, 1, 0.2313726, 1,
-0.3095662, 0.1907259, -0.6716532, 0, 1, 0.2392157, 1,
-0.3059015, -0.7445219, -0.8018934, 0, 1, 0.2431373, 1,
-0.3037215, -0.2297551, -1.754543, 0, 1, 0.2509804, 1,
-0.3019143, -0.2170063, -3.063063, 0, 1, 0.254902, 1,
-0.2965806, -2.145445, -3.373345, 0, 1, 0.2627451, 1,
-0.2957034, -0.9842309, -4.354657, 0, 1, 0.2666667, 1,
-0.2933951, -0.6989264, -2.128209, 0, 1, 0.2745098, 1,
-0.2925788, -0.6589674, -1.610794, 0, 1, 0.2784314, 1,
-0.2833094, -0.4218179, -1.964429, 0, 1, 0.2862745, 1,
-0.2823587, -0.9913467, -3.17557, 0, 1, 0.2901961, 1,
-0.2809108, 0.1049415, -2.904915, 0, 1, 0.2980392, 1,
-0.278138, -0.456331, -0.4671772, 0, 1, 0.3058824, 1,
-0.2646677, -1.156817, -3.312243, 0, 1, 0.3098039, 1,
-0.2621378, 1.29724, 0.1698337, 0, 1, 0.3176471, 1,
-0.2605718, 0.2048668, -2.697538, 0, 1, 0.3215686, 1,
-0.256194, 1.33301, -0.8019148, 0, 1, 0.3294118, 1,
-0.2559653, 0.9640116, -1.238324, 0, 1, 0.3333333, 1,
-0.252647, -0.461933, -3.250813, 0, 1, 0.3411765, 1,
-0.2526444, 1.182557, -1.323009, 0, 1, 0.345098, 1,
-0.25202, -0.2717072, -2.04032, 0, 1, 0.3529412, 1,
-0.247712, -0.01074967, -1.484834, 0, 1, 0.3568628, 1,
-0.2471908, -0.8846234, -2.602951, 0, 1, 0.3647059, 1,
-0.2413316, -0.4135678, -4.018723, 0, 1, 0.3686275, 1,
-0.240722, 0.2156778, -0.4541427, 0, 1, 0.3764706, 1,
-0.2401012, 0.3844662, -1.893091, 0, 1, 0.3803922, 1,
-0.239799, -0.7029493, -3.77006, 0, 1, 0.3882353, 1,
-0.2357179, -0.6660443, -1.436195, 0, 1, 0.3921569, 1,
-0.2334625, -1.869068, -3.623707, 0, 1, 0.4, 1,
-0.2320018, 1.857152, -1.282748, 0, 1, 0.4078431, 1,
-0.2312572, 0.6386049, -0.03229851, 0, 1, 0.4117647, 1,
-0.2307594, 1.006131, 0.6643986, 0, 1, 0.4196078, 1,
-0.2287089, -0.8572993, -1.947674, 0, 1, 0.4235294, 1,
-0.2263284, -1.16085, -1.645637, 0, 1, 0.4313726, 1,
-0.2242072, -0.1603758, -1.085615, 0, 1, 0.4352941, 1,
-0.2210718, 0.6778021, 0.1740445, 0, 1, 0.4431373, 1,
-0.2189825, -0.7579608, -3.401569, 0, 1, 0.4470588, 1,
-0.2144815, -0.9417266, -4.451015, 0, 1, 0.454902, 1,
-0.2123964, -0.1234888, -2.240676, 0, 1, 0.4588235, 1,
-0.2091191, -1.232207, -1.962206, 0, 1, 0.4666667, 1,
-0.202604, -0.4386758, -3.866446, 0, 1, 0.4705882, 1,
-0.2024357, 1.017636, 1.642408, 0, 1, 0.4784314, 1,
-0.2015962, 0.9328424, 1.27435, 0, 1, 0.4823529, 1,
-0.2004464, 0.2300869, -0.5660774, 0, 1, 0.4901961, 1,
-0.1983625, 0.9157712, -0.971655, 0, 1, 0.4941176, 1,
-0.1976098, 1.865077, 0.8265277, 0, 1, 0.5019608, 1,
-0.193498, -0.6805521, -2.330108, 0, 1, 0.509804, 1,
-0.1921514, -0.2912141, -2.609974, 0, 1, 0.5137255, 1,
-0.1898888, -0.3767945, -2.134526, 0, 1, 0.5215687, 1,
-0.1880346, 0.8222795, -0.9732248, 0, 1, 0.5254902, 1,
-0.1876515, 0.3622026, 0.1676285, 0, 1, 0.5333334, 1,
-0.1870761, -2.689149, -2.198506, 0, 1, 0.5372549, 1,
-0.1858713, 0.1056129, -1.823669, 0, 1, 0.5450981, 1,
-0.1841491, -0.1788554, -3.195528, 0, 1, 0.5490196, 1,
-0.1733399, -2.100281, -1.227514, 0, 1, 0.5568628, 1,
-0.166149, 0.2097873, -0.3396135, 0, 1, 0.5607843, 1,
-0.1656455, 1.74342, -1.867598, 0, 1, 0.5686275, 1,
-0.1640608, -0.4668829, -2.811416, 0, 1, 0.572549, 1,
-0.1580633, 0.4318843, 0.2139835, 0, 1, 0.5803922, 1,
-0.1557864, -0.6812245, -3.885242, 0, 1, 0.5843138, 1,
-0.1528853, -0.2862375, -1.887107, 0, 1, 0.5921569, 1,
-0.1494367, -0.7752234, -2.941988, 0, 1, 0.5960785, 1,
-0.1469291, 0.1902353, -0.8368006, 0, 1, 0.6039216, 1,
-0.1445187, -1.349995, -4.607822, 0, 1, 0.6117647, 1,
-0.142172, 0.6826592, 0.5213141, 0, 1, 0.6156863, 1,
-0.1416037, -0.9829282, -3.589646, 0, 1, 0.6235294, 1,
-0.1390401, 0.5247188, -1.471188, 0, 1, 0.627451, 1,
-0.1365169, 1.256578, 1.637183, 0, 1, 0.6352941, 1,
-0.1357315, 0.03576977, -1.983341, 0, 1, 0.6392157, 1,
-0.1326384, 0.2615288, -1.032049, 0, 1, 0.6470588, 1,
-0.1299979, 0.0596722, -1.378848, 0, 1, 0.6509804, 1,
-0.1288263, 1.510135, -2.124486, 0, 1, 0.6588235, 1,
-0.1265208, 1.188834, -0.1227129, 0, 1, 0.6627451, 1,
-0.1264344, -0.623946, -3.743475, 0, 1, 0.6705883, 1,
-0.1256344, -1.310856, -2.06694, 0, 1, 0.6745098, 1,
-0.1254164, 0.3747264, -2.173306, 0, 1, 0.682353, 1,
-0.1220809, -0.6515778, -4.729169, 0, 1, 0.6862745, 1,
-0.1200633, 0.129349, 1.233933, 0, 1, 0.6941177, 1,
-0.1171645, 1.52167, -0.4021122, 0, 1, 0.7019608, 1,
-0.1158159, -1.943275, -3.483479, 0, 1, 0.7058824, 1,
-0.1151497, 0.3647634, 0.7099868, 0, 1, 0.7137255, 1,
-0.1122824, -1.667763, -1.835585, 0, 1, 0.7176471, 1,
-0.1121687, 0.5756201, 0.5973687, 0, 1, 0.7254902, 1,
-0.1118192, -0.1838201, -2.779799, 0, 1, 0.7294118, 1,
-0.1093357, 1.174533, -0.01769014, 0, 1, 0.7372549, 1,
-0.1055677, -0.4109251, -1.344697, 0, 1, 0.7411765, 1,
-0.1052401, 1.367901, 0.1918842, 0, 1, 0.7490196, 1,
-0.1024564, -0.2569663, -3.806279, 0, 1, 0.7529412, 1,
-0.09739029, 1.297516, 0.4954076, 0, 1, 0.7607843, 1,
-0.09625522, 0.1745631, -2.185227, 0, 1, 0.7647059, 1,
-0.09611757, 0.06623717, -1.640631, 0, 1, 0.772549, 1,
-0.09410713, -2.331139, -3.13974, 0, 1, 0.7764706, 1,
-0.0935594, 0.700467, -1.278815, 0, 1, 0.7843137, 1,
-0.09201442, -2.093814, -2.354511, 0, 1, 0.7882353, 1,
-0.0906096, -0.1684024, -4.957639, 0, 1, 0.7960784, 1,
-0.0889053, 0.7019538, 0.4032643, 0, 1, 0.8039216, 1,
-0.08714865, 0.2676109, -1.103851, 0, 1, 0.8078431, 1,
-0.08028807, -1.130239, -2.508329, 0, 1, 0.8156863, 1,
-0.07884856, 0.9797527, -1.52606, 0, 1, 0.8196079, 1,
-0.07542145, 1.372024, 2.109157, 0, 1, 0.827451, 1,
-0.0707026, 1.895832, -1.800045, 0, 1, 0.8313726, 1,
-0.06529488, -0.02977118, -2.566874, 0, 1, 0.8392157, 1,
-0.05952637, 0.1384239, -1.160092, 0, 1, 0.8431373, 1,
-0.05419898, 0.6451952, -1.241002, 0, 1, 0.8509804, 1,
-0.05334531, 1.438194, 1.391094, 0, 1, 0.854902, 1,
-0.05070634, 1.769555, 0.009055369, 0, 1, 0.8627451, 1,
-0.04725672, -0.09052011, -4.765279, 0, 1, 0.8666667, 1,
-0.04723433, -1.865044, -2.143546, 0, 1, 0.8745098, 1,
-0.04712223, -1.048802, -3.232321, 0, 1, 0.8784314, 1,
-0.04261138, 1.353212, -0.216347, 0, 1, 0.8862745, 1,
-0.03732489, 1.009409, 1.511058, 0, 1, 0.8901961, 1,
-0.03113969, 1.415361, 1.564777, 0, 1, 0.8980392, 1,
-0.02789888, -1.9699, -2.888183, 0, 1, 0.9058824, 1,
-0.02654904, -0.5698625, -3.432146, 0, 1, 0.9098039, 1,
-0.02611863, -0.677244, -3.32332, 0, 1, 0.9176471, 1,
-0.02284268, -0.3568379, -4.50627, 0, 1, 0.9215686, 1,
-0.02089051, 0.05266185, -0.5673041, 0, 1, 0.9294118, 1,
-0.01983785, -1.115702, -3.035489, 0, 1, 0.9333333, 1,
-0.01914928, 0.03589334, -1.073464, 0, 1, 0.9411765, 1,
-0.01623537, -1.311778, -4.659208, 0, 1, 0.945098, 1,
-0.0160709, -1.000124, -3.517302, 0, 1, 0.9529412, 1,
-0.01553782, 0.7553579, 0.07952874, 0, 1, 0.9568627, 1,
-0.01538599, -0.3757581, -4.075047, 0, 1, 0.9647059, 1,
-0.005834776, 0.5076397, -1.38445, 0, 1, 0.9686275, 1,
-0.00303376, -1.700646, -3.708826, 0, 1, 0.9764706, 1,
-0.000653876, 1.389454, -0.5461735, 0, 1, 0.9803922, 1,
0.002523686, 2.320863, -0.6503494, 0, 1, 0.9882353, 1,
0.004351997, -0.1223115, 3.724136, 0, 1, 0.9921569, 1,
0.006291904, 0.03103592, -0.1217162, 0, 1, 1, 1,
0.006728926, -0.6768967, 2.240701, 0, 0.9921569, 1, 1,
0.01600932, 1.51038, 0.1233659, 0, 0.9882353, 1, 1,
0.01674854, 0.642574, -0.1239391, 0, 0.9803922, 1, 1,
0.02004794, 1.833359, 0.2430319, 0, 0.9764706, 1, 1,
0.02386864, -0.40451, 2.10261, 0, 0.9686275, 1, 1,
0.02409201, -2.330412, 3.421382, 0, 0.9647059, 1, 1,
0.02779805, 1.031375, 0.6053334, 0, 0.9568627, 1, 1,
0.02993145, 0.3163908, -0.1899566, 0, 0.9529412, 1, 1,
0.03018249, -0.1740909, 2.808766, 0, 0.945098, 1, 1,
0.04204433, -1.363153, 3.022336, 0, 0.9411765, 1, 1,
0.04216364, -0.8404493, 5.055609, 0, 0.9333333, 1, 1,
0.04474091, 0.2308485, -0.4000776, 0, 0.9294118, 1, 1,
0.04481866, -1.408285, 4.210217, 0, 0.9215686, 1, 1,
0.05388803, -1.618972, 4.174665, 0, 0.9176471, 1, 1,
0.05760525, 1.420312, -0.1953964, 0, 0.9098039, 1, 1,
0.05854139, -1.668373, 1.849952, 0, 0.9058824, 1, 1,
0.0586373, -1.42929, 2.666734, 0, 0.8980392, 1, 1,
0.05880245, -0.6209682, 3.164495, 0, 0.8901961, 1, 1,
0.05910071, -0.4840037, 2.634715, 0, 0.8862745, 1, 1,
0.06040432, -0.3356525, 4.27916, 0, 0.8784314, 1, 1,
0.0604835, -1.565389, 3.001698, 0, 0.8745098, 1, 1,
0.06370821, 0.486258, 0.458158, 0, 0.8666667, 1, 1,
0.06573771, 0.1323021, 0.7577247, 0, 0.8627451, 1, 1,
0.06800422, 0.8797517, 0.4683605, 0, 0.854902, 1, 1,
0.07475729, -0.4740045, 2.952153, 0, 0.8509804, 1, 1,
0.08489018, 1.46571, -0.4027614, 0, 0.8431373, 1, 1,
0.08999826, -0.001023866, 1.541575, 0, 0.8392157, 1, 1,
0.0962074, -0.05567803, 1.950647, 0, 0.8313726, 1, 1,
0.09846281, 0.2189647, 0.8246009, 0, 0.827451, 1, 1,
0.1005752, -0.8428716, 5.43954, 0, 0.8196079, 1, 1,
0.1080285, -0.3276639, 1.953008, 0, 0.8156863, 1, 1,
0.1119695, 0.6965013, 0.3248047, 0, 0.8078431, 1, 1,
0.1183243, -0.3815941, 0.9310735, 0, 0.8039216, 1, 1,
0.1194556, -0.7900627, 3.940304, 0, 0.7960784, 1, 1,
0.1237879, -1.695975, 4.26754, 0, 0.7882353, 1, 1,
0.1263608, 0.1679557, -0.009284376, 0, 0.7843137, 1, 1,
0.1264786, 1.334758, -1.957046, 0, 0.7764706, 1, 1,
0.1299564, 0.9304355, -0.6205724, 0, 0.772549, 1, 1,
0.1313123, 0.2307576, 0.2582717, 0, 0.7647059, 1, 1,
0.133182, 1.622499, 1.928516, 0, 0.7607843, 1, 1,
0.134406, -1.828405, 2.160364, 0, 0.7529412, 1, 1,
0.1350986, -0.1860605, 1.416617, 0, 0.7490196, 1, 1,
0.1381044, -1.457472, 3.103019, 0, 0.7411765, 1, 1,
0.1399391, -0.5371321, 2.102763, 0, 0.7372549, 1, 1,
0.1405634, 1.488792, -1.254102, 0, 0.7294118, 1, 1,
0.1421869, -0.1966311, 2.866317, 0, 0.7254902, 1, 1,
0.1427165, 0.1349245, -0.3193306, 0, 0.7176471, 1, 1,
0.1431398, 0.01199688, 2.022311, 0, 0.7137255, 1, 1,
0.1438604, 0.08610043, 1.050948, 0, 0.7058824, 1, 1,
0.144744, -0.3528932, 1.9993, 0, 0.6980392, 1, 1,
0.1461912, 0.1232292, -0.340293, 0, 0.6941177, 1, 1,
0.1542083, -0.5370232, 3.270115, 0, 0.6862745, 1, 1,
0.1554155, 0.6201692, 0.5871038, 0, 0.682353, 1, 1,
0.1587814, -0.1568738, 1.95086, 0, 0.6745098, 1, 1,
0.159037, 0.5641206, 0.2785321, 0, 0.6705883, 1, 1,
0.1593549, 0.6129555, 1.859072, 0, 0.6627451, 1, 1,
0.161693, 1.165921, 0.3763197, 0, 0.6588235, 1, 1,
0.1635112, 0.5557593, 0.2334154, 0, 0.6509804, 1, 1,
0.1651059, -1.072292, 3.933553, 0, 0.6470588, 1, 1,
0.1659822, -0.2541833, 2.289294, 0, 0.6392157, 1, 1,
0.1665833, 0.2003642, 0.6023989, 0, 0.6352941, 1, 1,
0.1701529, 1.549078, 1.737262, 0, 0.627451, 1, 1,
0.171428, -0.3838735, 2.495531, 0, 0.6235294, 1, 1,
0.1743456, 1.251641, 0.231101, 0, 0.6156863, 1, 1,
0.1747539, -0.9497425, 4.40596, 0, 0.6117647, 1, 1,
0.1770603, 0.682376, -0.285947, 0, 0.6039216, 1, 1,
0.177723, -1.187988, 3.323539, 0, 0.5960785, 1, 1,
0.1799765, -0.7470276, 3.694109, 0, 0.5921569, 1, 1,
0.1841371, -0.3453889, 3.140593, 0, 0.5843138, 1, 1,
0.1863253, 0.4242907, -0.5550106, 0, 0.5803922, 1, 1,
0.1886728, 0.5050647, 0.7427592, 0, 0.572549, 1, 1,
0.1904096, 0.896556, 0.01450993, 0, 0.5686275, 1, 1,
0.1909007, -0.6868808, 4.797333, 0, 0.5607843, 1, 1,
0.1948108, -1.160594, 3.645045, 0, 0.5568628, 1, 1,
0.1950734, 1.08433, 0.001758082, 0, 0.5490196, 1, 1,
0.1952219, 0.003747519, 1.067732, 0, 0.5450981, 1, 1,
0.2043289, 1.511655, -1.24347, 0, 0.5372549, 1, 1,
0.2069192, -0.4847471, 4.067585, 0, 0.5333334, 1, 1,
0.2076441, 0.06740185, 0.2973325, 0, 0.5254902, 1, 1,
0.2083347, -0.9726866, 2.132488, 0, 0.5215687, 1, 1,
0.2129071, -1.389482, 2.477788, 0, 0.5137255, 1, 1,
0.2136924, -0.3392787, 2.655735, 0, 0.509804, 1, 1,
0.2158721, 0.5145383, 2.868899, 0, 0.5019608, 1, 1,
0.2187769, -0.6066818, 3.322337, 0, 0.4941176, 1, 1,
0.2219881, -0.9353849, 3.464484, 0, 0.4901961, 1, 1,
0.2269609, 3.21905, -1.791347, 0, 0.4823529, 1, 1,
0.2315077, -0.6445695, 2.818358, 0, 0.4784314, 1, 1,
0.234437, 1.134353, 0.01486017, 0, 0.4705882, 1, 1,
0.2344851, -0.7327706, 0.6049702, 0, 0.4666667, 1, 1,
0.2362657, -0.1238777, 0.9171623, 0, 0.4588235, 1, 1,
0.2366078, 0.5358093, 2.045841, 0, 0.454902, 1, 1,
0.2384021, 0.2118142, 1.429163, 0, 0.4470588, 1, 1,
0.2400154, -0.1078271, 1.328885, 0, 0.4431373, 1, 1,
0.2423809, -0.3906021, 1.33421, 0, 0.4352941, 1, 1,
0.2435717, -0.05659854, 1.295564, 0, 0.4313726, 1, 1,
0.2437915, -0.6363171, 3.21632, 0, 0.4235294, 1, 1,
0.2449114, 0.4615801, 0.6519181, 0, 0.4196078, 1, 1,
0.2458516, 0.2658354, 0.4040523, 0, 0.4117647, 1, 1,
0.2485414, 1.181934, -0.2137651, 0, 0.4078431, 1, 1,
0.2491593, 0.04989116, 2.007671, 0, 0.4, 1, 1,
0.2514663, 0.4707051, 0.4236921, 0, 0.3921569, 1, 1,
0.2533219, -2.116061, 4.98566, 0, 0.3882353, 1, 1,
0.2565224, 0.1260402, 2.801466, 0, 0.3803922, 1, 1,
0.2569542, 0.07974868, 0.9472093, 0, 0.3764706, 1, 1,
0.2612929, -2.368507, 2.564482, 0, 0.3686275, 1, 1,
0.262058, -1.290009, 3.569802, 0, 0.3647059, 1, 1,
0.2621275, 0.09936613, 2.047819, 0, 0.3568628, 1, 1,
0.2742087, 2.188236, -0.4017501, 0, 0.3529412, 1, 1,
0.2750895, -0.216686, 0.6849659, 0, 0.345098, 1, 1,
0.2759179, -0.4254385, 1.230513, 0, 0.3411765, 1, 1,
0.2791624, 0.8484002, -0.01735771, 0, 0.3333333, 1, 1,
0.2803326, -0.5798642, 4.094705, 0, 0.3294118, 1, 1,
0.2812699, -1.550815, 2.398569, 0, 0.3215686, 1, 1,
0.2823736, 0.7874897, 1.347988, 0, 0.3176471, 1, 1,
0.2845867, 1.151277, 1.344619, 0, 0.3098039, 1, 1,
0.2875848, -0.5092632, 0.8454164, 0, 0.3058824, 1, 1,
0.289458, 0.5286106, 0.1977493, 0, 0.2980392, 1, 1,
0.2896804, -1.116954, 1.524139, 0, 0.2901961, 1, 1,
0.2938724, 0.9769378, 0.1075191, 0, 0.2862745, 1, 1,
0.2965458, 0.2241907, -0.4934444, 0, 0.2784314, 1, 1,
0.2983009, -0.2044492, 0.3759589, 0, 0.2745098, 1, 1,
0.3001848, 0.2949404, 2.298896, 0, 0.2666667, 1, 1,
0.3014536, 0.143816, 2.142555, 0, 0.2627451, 1, 1,
0.3024964, -0.2651609, 3.630622, 0, 0.254902, 1, 1,
0.3040663, 0.7696989, 1.154223, 0, 0.2509804, 1, 1,
0.3056048, -0.2867721, 0.02946731, 0, 0.2431373, 1, 1,
0.3081221, 0.2142464, -0.7972834, 0, 0.2392157, 1, 1,
0.3096156, 0.1205438, 0.8550248, 0, 0.2313726, 1, 1,
0.3200549, 1.843931, 1.950365, 0, 0.227451, 1, 1,
0.3206322, -0.5154197, 1.886672, 0, 0.2196078, 1, 1,
0.3217963, 1.61241, 0.1199013, 0, 0.2156863, 1, 1,
0.3231497, -1.188483, 4.289282, 0, 0.2078431, 1, 1,
0.3238657, 1.796456, 0.9301673, 0, 0.2039216, 1, 1,
0.3250576, 0.5517513, 1.57029, 0, 0.1960784, 1, 1,
0.3275927, -0.08416488, 1.581929, 0, 0.1882353, 1, 1,
0.3289165, 0.2496867, 0.1043366, 0, 0.1843137, 1, 1,
0.329913, -1.933589, 2.446262, 0, 0.1764706, 1, 1,
0.3319554, -0.4345532, 2.872421, 0, 0.172549, 1, 1,
0.3347066, 0.9444129, 1.219035, 0, 0.1647059, 1, 1,
0.3371065, 0.6998143, 0.7002907, 0, 0.1607843, 1, 1,
0.3434182, -0.5098883, 2.307555, 0, 0.1529412, 1, 1,
0.3515464, 2.011484, 0.2741584, 0, 0.1490196, 1, 1,
0.357633, -0.02827857, 2.799442, 0, 0.1411765, 1, 1,
0.360088, 0.1242912, 0.1859253, 0, 0.1372549, 1, 1,
0.3611603, 1.167448, 0.5924733, 0, 0.1294118, 1, 1,
0.361445, -0.1398795, 1.83773, 0, 0.1254902, 1, 1,
0.3618001, 0.1810626, 0.2230083, 0, 0.1176471, 1, 1,
0.3622245, -0.2679943, 2.365886, 0, 0.1137255, 1, 1,
0.363796, -1.120466, 3.699364, 0, 0.1058824, 1, 1,
0.3646034, -0.8347628, 0.7991726, 0, 0.09803922, 1, 1,
0.3654559, -0.5152159, 2.207703, 0, 0.09411765, 1, 1,
0.3661103, -0.287592, 3.73221, 0, 0.08627451, 1, 1,
0.368282, -0.6970726, 3.408588, 0, 0.08235294, 1, 1,
0.3685949, -0.7105212, 2.814328, 0, 0.07450981, 1, 1,
0.369632, -0.8486688, -0.201985, 0, 0.07058824, 1, 1,
0.3719411, -1.438805, 2.787586, 0, 0.0627451, 1, 1,
0.3730147, 0.707642, -0.736392, 0, 0.05882353, 1, 1,
0.3731745, 2.409416, -0.05878757, 0, 0.05098039, 1, 1,
0.3748139, 1.33111, -0.7713703, 0, 0.04705882, 1, 1,
0.3753671, -0.1260081, 2.692364, 0, 0.03921569, 1, 1,
0.376141, -0.8148297, 2.363265, 0, 0.03529412, 1, 1,
0.3767128, -0.2495042, 1.226565, 0, 0.02745098, 1, 1,
0.3775222, 0.422204, 0.8842767, 0, 0.02352941, 1, 1,
0.3784693, -0.3384725, 2.745532, 0, 0.01568628, 1, 1,
0.3786371, 0.2806028, 0.8648311, 0, 0.01176471, 1, 1,
0.3788696, -1.086994, 0.3133062, 0, 0.003921569, 1, 1,
0.3802446, -0.01325884, 1.543959, 0.003921569, 0, 1, 1,
0.3810052, 0.9118757, 2.262917, 0.007843138, 0, 1, 1,
0.3842981, -0.8124614, 2.311898, 0.01568628, 0, 1, 1,
0.3859418, -1.17925, 2.412038, 0.01960784, 0, 1, 1,
0.3899676, -0.5656688, 2.130045, 0.02745098, 0, 1, 1,
0.3913311, 0.3082895, 1.279207, 0.03137255, 0, 1, 1,
0.3919542, 1.090963, 0.927864, 0.03921569, 0, 1, 1,
0.3926284, -0.8370851, 0.2838757, 0.04313726, 0, 1, 1,
0.3957744, 1.325298, 0.5634513, 0.05098039, 0, 1, 1,
0.3964908, 0.5075702, 0.899687, 0.05490196, 0, 1, 1,
0.3973764, -0.1288757, 2.548969, 0.0627451, 0, 1, 1,
0.3980709, 0.9755831, 0.6542367, 0.06666667, 0, 1, 1,
0.3995027, 0.02571735, 0.1002812, 0.07450981, 0, 1, 1,
0.3995603, -1.199962, 3.158101, 0.07843138, 0, 1, 1,
0.4031362, -0.6267374, 1.291579, 0.08627451, 0, 1, 1,
0.4055537, 0.3034768, 0.2605099, 0.09019608, 0, 1, 1,
0.4062469, 0.9772066, 0.8753263, 0.09803922, 0, 1, 1,
0.4094974, -0.742308, 2.729603, 0.1058824, 0, 1, 1,
0.4117551, -0.8288978, 1.29465, 0.1098039, 0, 1, 1,
0.4165385, -0.1107949, 0.9894694, 0.1176471, 0, 1, 1,
0.4187368, -0.3801368, 3.915286, 0.1215686, 0, 1, 1,
0.4202439, -0.8739081, 1.077692, 0.1294118, 0, 1, 1,
0.4207954, -0.07197972, 2.804936, 0.1333333, 0, 1, 1,
0.4270287, -0.6339942, 1.961323, 0.1411765, 0, 1, 1,
0.4284653, -0.3299157, -0.1808066, 0.145098, 0, 1, 1,
0.4294722, -0.892548, 3.003262, 0.1529412, 0, 1, 1,
0.4316838, -1.831741, 2.128054, 0.1568628, 0, 1, 1,
0.4344636, -1.187336, 2.198807, 0.1647059, 0, 1, 1,
0.4352142, 1.032931, -1.547825, 0.1686275, 0, 1, 1,
0.4356241, -0.4287326, 2.736511, 0.1764706, 0, 1, 1,
0.4376467, 1.457799, 1.515063, 0.1803922, 0, 1, 1,
0.4436727, -1.655626, 3.721574, 0.1882353, 0, 1, 1,
0.4459836, -0.3543904, 0.5715535, 0.1921569, 0, 1, 1,
0.4487176, -0.4814398, 2.354817, 0.2, 0, 1, 1,
0.4635185, 1.061244, 0.8729785, 0.2078431, 0, 1, 1,
0.4637365, 0.505943, 1.181588, 0.2117647, 0, 1, 1,
0.4661024, 1.304717, 1.53222, 0.2196078, 0, 1, 1,
0.4668345, 0.7500729, 0.01199476, 0.2235294, 0, 1, 1,
0.4718356, 0.757411, 0.8280227, 0.2313726, 0, 1, 1,
0.4727751, 0.5293586, 0.3682725, 0.2352941, 0, 1, 1,
0.4738694, -1.394251, 1.746568, 0.2431373, 0, 1, 1,
0.475083, 0.5820778, 0.9457778, 0.2470588, 0, 1, 1,
0.4787753, 1.761319, -1.375687, 0.254902, 0, 1, 1,
0.4816659, -2.067588, 4.277275, 0.2588235, 0, 1, 1,
0.4848773, 1.030415, 1.445507, 0.2666667, 0, 1, 1,
0.488026, 0.4675549, 1.612363, 0.2705882, 0, 1, 1,
0.489436, -0.2763122, 1.85258, 0.2784314, 0, 1, 1,
0.4897883, 0.004765963, 2.729865, 0.282353, 0, 1, 1,
0.4924675, 0.2306839, 1.455155, 0.2901961, 0, 1, 1,
0.494518, 0.6028337, 0.8587502, 0.2941177, 0, 1, 1,
0.4971036, 0.9158348, -1.663993, 0.3019608, 0, 1, 1,
0.4974034, 0.84762, 1.371414, 0.3098039, 0, 1, 1,
0.499047, 0.4363863, -0.3609793, 0.3137255, 0, 1, 1,
0.501845, -0.7444244, 1.557687, 0.3215686, 0, 1, 1,
0.5074748, -0.06724627, 0.1345246, 0.3254902, 0, 1, 1,
0.5090795, 1.175372, -0.2274385, 0.3333333, 0, 1, 1,
0.51341, 0.2534024, 1.615623, 0.3372549, 0, 1, 1,
0.5142729, -1.392854, 1.523965, 0.345098, 0, 1, 1,
0.5166873, -1.019836, 1.243886, 0.3490196, 0, 1, 1,
0.5221866, 0.1583334, 1.375965, 0.3568628, 0, 1, 1,
0.5291467, -1.31084, 1.814682, 0.3607843, 0, 1, 1,
0.5294542, 0.3720675, 2.58497, 0.3686275, 0, 1, 1,
0.5342512, -0.4729523, 1.97563, 0.372549, 0, 1, 1,
0.5381032, 0.08730554, 1.631104, 0.3803922, 0, 1, 1,
0.5412863, -0.2393609, 1.652731, 0.3843137, 0, 1, 1,
0.5415925, 0.08042327, 1.658155, 0.3921569, 0, 1, 1,
0.5417686, 0.6133372, 0.7726343, 0.3960784, 0, 1, 1,
0.5470129, -0.2891769, 3.08752, 0.4039216, 0, 1, 1,
0.5474265, -0.3848766, 3.314771, 0.4117647, 0, 1, 1,
0.5482596, -0.3423573, 1.998546, 0.4156863, 0, 1, 1,
0.5502767, -0.06108328, 0.5371913, 0.4235294, 0, 1, 1,
0.5539917, 0.2237204, -0.08330836, 0.427451, 0, 1, 1,
0.5561612, 0.8834574, -1.339902, 0.4352941, 0, 1, 1,
0.5575072, -0.6105281, 1.394939, 0.4392157, 0, 1, 1,
0.5645009, -0.6772821, 3.065057, 0.4470588, 0, 1, 1,
0.5669907, -0.615553, 3.326906, 0.4509804, 0, 1, 1,
0.5709866, 0.5913053, 1.192613, 0.4588235, 0, 1, 1,
0.5717177, -0.9663048, 3.523308, 0.4627451, 0, 1, 1,
0.5780808, -0.06689178, 0.9450445, 0.4705882, 0, 1, 1,
0.5841966, 0.01356886, 2.21066, 0.4745098, 0, 1, 1,
0.585844, -1.395925, 2.379364, 0.4823529, 0, 1, 1,
0.5890222, 0.3892834, 1.077985, 0.4862745, 0, 1, 1,
0.5910712, -0.5739415, 3.348258, 0.4941176, 0, 1, 1,
0.5917997, 1.513052, 0.1033647, 0.5019608, 0, 1, 1,
0.5921875, -2.130515, 4.267313, 0.5058824, 0, 1, 1,
0.5924171, 0.07556213, 2.168051, 0.5137255, 0, 1, 1,
0.6014752, 1.055986, 0.08467537, 0.5176471, 0, 1, 1,
0.6021011, -0.1296151, 2.135796, 0.5254902, 0, 1, 1,
0.6031311, -0.04292351, 0.775548, 0.5294118, 0, 1, 1,
0.604504, -0.5302352, 1.751429, 0.5372549, 0, 1, 1,
0.6139112, 0.7997681, 0.8572773, 0.5411765, 0, 1, 1,
0.6141267, 0.210281, 0.4652842, 0.5490196, 0, 1, 1,
0.6149208, -0.6067182, 0.504853, 0.5529412, 0, 1, 1,
0.6187692, -1.463549, 2.667385, 0.5607843, 0, 1, 1,
0.6246436, 0.3820868, 2.84282, 0.5647059, 0, 1, 1,
0.6256901, -0.3411242, 2.304124, 0.572549, 0, 1, 1,
0.6294243, -0.7039562, 1.711065, 0.5764706, 0, 1, 1,
0.6385261, -0.5593589, 2.500804, 0.5843138, 0, 1, 1,
0.6405059, 0.3642522, 1.394077, 0.5882353, 0, 1, 1,
0.6440747, 0.5057644, -0.1446898, 0.5960785, 0, 1, 1,
0.6528327, -0.2237792, 1.852653, 0.6039216, 0, 1, 1,
0.6555198, 1.125301, 1.083317, 0.6078432, 0, 1, 1,
0.6575543, -1.41561, 1.460099, 0.6156863, 0, 1, 1,
0.6644138, 0.1443815, 1.536544, 0.6196079, 0, 1, 1,
0.6644295, 1.343398, 1.830464, 0.627451, 0, 1, 1,
0.6705018, -0.6072654, 2.497871, 0.6313726, 0, 1, 1,
0.6706239, 2.430595, 0.6924962, 0.6392157, 0, 1, 1,
0.6710234, -0.2703154, 2.112809, 0.6431373, 0, 1, 1,
0.6811706, -1.748884, 4.667567, 0.6509804, 0, 1, 1,
0.682729, 2.049947, -0.4826973, 0.654902, 0, 1, 1,
0.6866069, -0.0780199, 1.717802, 0.6627451, 0, 1, 1,
0.6899517, -1.727221, 4.548286, 0.6666667, 0, 1, 1,
0.6904829, 0.2467521, 1.950474, 0.6745098, 0, 1, 1,
0.6914402, -0.9428684, 4.257776, 0.6784314, 0, 1, 1,
0.7060876, 0.003518443, 3.091981, 0.6862745, 0, 1, 1,
0.7087898, -0.1023151, 1.912247, 0.6901961, 0, 1, 1,
0.7183247, -1.037755, 3.852989, 0.6980392, 0, 1, 1,
0.7261611, 0.003924537, 0.5011266, 0.7058824, 0, 1, 1,
0.7300048, 0.1422731, 1.322526, 0.7098039, 0, 1, 1,
0.7314942, 0.6659719, 1.078073, 0.7176471, 0, 1, 1,
0.7361125, -0.1976821, 1.71243, 0.7215686, 0, 1, 1,
0.7385103, 1.489565, 1.597382, 0.7294118, 0, 1, 1,
0.7394239, -0.02086891, 0.914436, 0.7333333, 0, 1, 1,
0.7441108, -1.767733, 3.421001, 0.7411765, 0, 1, 1,
0.7442669, -0.7785373, 1.260029, 0.7450981, 0, 1, 1,
0.7493507, -1.202297, 3.487808, 0.7529412, 0, 1, 1,
0.757645, 0.4661657, 0.4331346, 0.7568628, 0, 1, 1,
0.7677367, 1.384349, -0.7809047, 0.7647059, 0, 1, 1,
0.7692536, 0.8156029, 0.7070937, 0.7686275, 0, 1, 1,
0.772539, -0.5776367, 2.101057, 0.7764706, 0, 1, 1,
0.7726835, 1.147243, 1.875694, 0.7803922, 0, 1, 1,
0.7773624, -0.138701, 2.085943, 0.7882353, 0, 1, 1,
0.783475, 0.2442155, 2.517415, 0.7921569, 0, 1, 1,
0.7913951, -0.4485992, 2.797496, 0.8, 0, 1, 1,
0.7925731, 0.05676726, -0.160668, 0.8078431, 0, 1, 1,
0.7928675, 0.5532815, 1.654556, 0.8117647, 0, 1, 1,
0.7947942, -2.143478, 4.026923, 0.8196079, 0, 1, 1,
0.7980131, 0.3049631, 2.501076, 0.8235294, 0, 1, 1,
0.800086, 1.388622, 1.197985, 0.8313726, 0, 1, 1,
0.8044124, 0.07065582, 0.6416383, 0.8352941, 0, 1, 1,
0.8055056, 1.50666, -0.3745473, 0.8431373, 0, 1, 1,
0.8063303, 0.7935762, 1.856389, 0.8470588, 0, 1, 1,
0.8078895, 0.009199081, 3.074366, 0.854902, 0, 1, 1,
0.8153962, 0.1330548, 2.875685, 0.8588235, 0, 1, 1,
0.8165924, 0.1411065, 2.705297, 0.8666667, 0, 1, 1,
0.8205831, -0.5699944, 3.677396, 0.8705882, 0, 1, 1,
0.8231804, -0.07171109, 0.4521237, 0.8784314, 0, 1, 1,
0.8249047, -0.07478903, 0.7477369, 0.8823529, 0, 1, 1,
0.8267542, 0.3725399, 0.5713438, 0.8901961, 0, 1, 1,
0.8312128, -0.553872, 1.444142, 0.8941177, 0, 1, 1,
0.8328274, -2.241495, 3.924451, 0.9019608, 0, 1, 1,
0.8369603, 0.3088632, 0.6163138, 0.9098039, 0, 1, 1,
0.8434703, 0.3389058, 1.163271, 0.9137255, 0, 1, 1,
0.8470979, 0.2902852, 1.115337, 0.9215686, 0, 1, 1,
0.8509368, -0.3610074, 1.438661, 0.9254902, 0, 1, 1,
0.854525, -0.8078755, 3.239772, 0.9333333, 0, 1, 1,
0.8631618, -1.164894, 1.720464, 0.9372549, 0, 1, 1,
0.8652271, -1.57383, 4.79231, 0.945098, 0, 1, 1,
0.8719655, 1.02262, 0.6983758, 0.9490196, 0, 1, 1,
0.8737227, -2.633307, 2.888443, 0.9568627, 0, 1, 1,
0.8740593, 0.5612451, 0.8024126, 0.9607843, 0, 1, 1,
0.8788233, 1.101916, 0.4599296, 0.9686275, 0, 1, 1,
0.8793107, 1.460781, 0.2780288, 0.972549, 0, 1, 1,
0.8843024, -0.5903026, 1.689323, 0.9803922, 0, 1, 1,
0.8871694, 0.3301027, 0.2616039, 0.9843137, 0, 1, 1,
0.8872281, 0.06514529, 3.258453, 0.9921569, 0, 1, 1,
0.8893267, 0.05837664, 2.933918, 0.9960784, 0, 1, 1,
0.8919153, -1.098283, 2.134912, 1, 0, 0.9960784, 1,
0.8966026, -0.3319675, 2.768454, 1, 0, 0.9882353, 1,
0.9023704, -0.5707023, 2.442203, 1, 0, 0.9843137, 1,
0.9051226, -0.1704964, 2.727498, 1, 0, 0.9764706, 1,
0.9092641, -0.06401695, 1.714539, 1, 0, 0.972549, 1,
0.9092996, -0.5023274, 0.9719211, 1, 0, 0.9647059, 1,
0.9166624, -0.4005424, 2.664057, 1, 0, 0.9607843, 1,
0.9192005, -0.579281, 2.754447, 1, 0, 0.9529412, 1,
0.9192094, 1.515031, 1.004773, 1, 0, 0.9490196, 1,
0.920218, 0.0921596, 2.860544, 1, 0, 0.9411765, 1,
0.9317591, -1.320244, 2.333311, 1, 0, 0.9372549, 1,
0.9321964, -2.375181, 5.368291, 1, 0, 0.9294118, 1,
0.9329908, -2.176925, 2.895585, 1, 0, 0.9254902, 1,
0.9349533, 1.114924, 1.889644, 1, 0, 0.9176471, 1,
0.9359114, 0.2208025, 0.2272807, 1, 0, 0.9137255, 1,
0.936492, -0.02873859, 1.479293, 1, 0, 0.9058824, 1,
0.9367688, -0.6499199, 1.142933, 1, 0, 0.9019608, 1,
0.9388891, 0.8069133, -0.1471099, 1, 0, 0.8941177, 1,
0.939938, -0.4722414, 1.252292, 1, 0, 0.8862745, 1,
0.9408579, 1.716459, 1.181389, 1, 0, 0.8823529, 1,
0.9430608, -1.183639, 4.011946, 1, 0, 0.8745098, 1,
0.9508191, -0.306779, 2.334386, 1, 0, 0.8705882, 1,
0.9535814, -0.4246361, 1.943508, 1, 0, 0.8627451, 1,
0.9546213, -0.2242521, 3.00729, 1, 0, 0.8588235, 1,
0.9608995, -0.3196819, 1.992214, 1, 0, 0.8509804, 1,
0.9635308, -0.4514399, 2.609644, 1, 0, 0.8470588, 1,
0.9659585, -0.2240074, 1.078126, 1, 0, 0.8392157, 1,
0.9751074, 0.8179092, 0.5153338, 1, 0, 0.8352941, 1,
0.9846723, 2.475827, -0.2770381, 1, 0, 0.827451, 1,
0.996091, -0.2776907, 0.6551012, 1, 0, 0.8235294, 1,
0.9982905, -0.9598374, 2.184017, 1, 0, 0.8156863, 1,
1.004101, -1.453704, 2.818364, 1, 0, 0.8117647, 1,
1.005158, -0.5314165, 2.149971, 1, 0, 0.8039216, 1,
1.019271, -0.03956758, 1.279209, 1, 0, 0.7960784, 1,
1.031087, -1.101646, 3.801883, 1, 0, 0.7921569, 1,
1.034854, 1.395902, 0.6520295, 1, 0, 0.7843137, 1,
1.036313, 0.9499832, -0.7382019, 1, 0, 0.7803922, 1,
1.046205, 0.2093461, 1.68272, 1, 0, 0.772549, 1,
1.053236, 0.4101044, 1.714761, 1, 0, 0.7686275, 1,
1.060123, 1.322544, 0.7306195, 1, 0, 0.7607843, 1,
1.067493, 0.5174409, 1.721807, 1, 0, 0.7568628, 1,
1.06884, 0.04430868, 2.98012, 1, 0, 0.7490196, 1,
1.07305, -0.1645092, 2.52332, 1, 0, 0.7450981, 1,
1.076995, -1.563335, 2.046469, 1, 0, 0.7372549, 1,
1.08818, -0.4659706, 0.3706454, 1, 0, 0.7333333, 1,
1.091653, -0.8058554, 0.6055694, 1, 0, 0.7254902, 1,
1.114665, 0.7292569, -0.204039, 1, 0, 0.7215686, 1,
1.114668, -0.3991911, 0.783792, 1, 0, 0.7137255, 1,
1.118013, -0.1741932, 1.583818, 1, 0, 0.7098039, 1,
1.121527, -0.8258715, 2.980975, 1, 0, 0.7019608, 1,
1.125016, -0.3709982, 2.548006, 1, 0, 0.6941177, 1,
1.135969, -2.898108, 2.1587, 1, 0, 0.6901961, 1,
1.138109, -0.2813272, 2.402268, 1, 0, 0.682353, 1,
1.148856, 0.7160796, 1.489255, 1, 0, 0.6784314, 1,
1.159548, 0.2219038, 2.335182, 1, 0, 0.6705883, 1,
1.162083, -1.609153, 2.970557, 1, 0, 0.6666667, 1,
1.165715, -0.3353907, 2.480717, 1, 0, 0.6588235, 1,
1.17711, -1.886526, 0.8642976, 1, 0, 0.654902, 1,
1.185067, -0.2738283, 0.2542064, 1, 0, 0.6470588, 1,
1.185504, 0.1061561, 0.3879404, 1, 0, 0.6431373, 1,
1.187292, 0.3925368, 1.077334, 1, 0, 0.6352941, 1,
1.197397, 0.4261647, 1.360115, 1, 0, 0.6313726, 1,
1.19875, 0.4575963, 0.962867, 1, 0, 0.6235294, 1,
1.209106, 0.04812027, 3.329494, 1, 0, 0.6196079, 1,
1.213382, -1.176608, 2.379227, 1, 0, 0.6117647, 1,
1.21901, 2.176686, -0.7253771, 1, 0, 0.6078432, 1,
1.219327, 0.6479776, 0.3432756, 1, 0, 0.6, 1,
1.221308, 0.8676002, -0.3324756, 1, 0, 0.5921569, 1,
1.228222, -0.5690272, 2.02171, 1, 0, 0.5882353, 1,
1.235013, -0.7649401, 1.720778, 1, 0, 0.5803922, 1,
1.235776, -0.6446351, 0.9541624, 1, 0, 0.5764706, 1,
1.253971, -1.641442, 3.004267, 1, 0, 0.5686275, 1,
1.256703, 1.306851, 1.539112, 1, 0, 0.5647059, 1,
1.265217, -2.116053, 2.328394, 1, 0, 0.5568628, 1,
1.266436, 1.823707, 1.085552, 1, 0, 0.5529412, 1,
1.26662, 1.346816, 1.876901, 1, 0, 0.5450981, 1,
1.28354, 0.0498906, 2.007622, 1, 0, 0.5411765, 1,
1.286556, -1.370289, 4.048223, 1, 0, 0.5333334, 1,
1.290055, 0.27176, 1.044793, 1, 0, 0.5294118, 1,
1.293671, 0.8669186, -0.3967116, 1, 0, 0.5215687, 1,
1.297822, 1.303588, 0.2886056, 1, 0, 0.5176471, 1,
1.305661, -1.01361, 2.068658, 1, 0, 0.509804, 1,
1.309732, 1.531849, -0.5443057, 1, 0, 0.5058824, 1,
1.31529, -0.06095294, 2.207567, 1, 0, 0.4980392, 1,
1.35729, -0.2444281, 0.262095, 1, 0, 0.4901961, 1,
1.359998, 0.4488079, 1.730489, 1, 0, 0.4862745, 1,
1.375905, 2.029075, 0.403893, 1, 0, 0.4784314, 1,
1.381671, 0.4621374, 0.4145809, 1, 0, 0.4745098, 1,
1.384083, -0.6369439, 0.9750515, 1, 0, 0.4666667, 1,
1.385764, -0.6832089, 2.997226, 1, 0, 0.4627451, 1,
1.40002, -0.378032, 2.720081, 1, 0, 0.454902, 1,
1.402271, -0.7579411, 0.444737, 1, 0, 0.4509804, 1,
1.406273, 0.3025781, 2.84239, 1, 0, 0.4431373, 1,
1.41163, -0.8742351, 2.27331, 1, 0, 0.4392157, 1,
1.423444, -0.5792241, 2.208423, 1, 0, 0.4313726, 1,
1.42441, 0.9448915, 2.069918, 1, 0, 0.427451, 1,
1.427454, -1.090241, 2.960876, 1, 0, 0.4196078, 1,
1.42874, 0.1366362, -0.1098839, 1, 0, 0.4156863, 1,
1.43156, 0.2952557, 0.9132752, 1, 0, 0.4078431, 1,
1.436104, -2.667218, 1.538935, 1, 0, 0.4039216, 1,
1.437137, 1.998121, 0.3308351, 1, 0, 0.3960784, 1,
1.438097, -0.4371462, 0.2075916, 1, 0, 0.3882353, 1,
1.451478, -0.1373414, 1.70297, 1, 0, 0.3843137, 1,
1.452172, 0.6050864, 1.323227, 1, 0, 0.3764706, 1,
1.454642, -1.528305, 2.079252, 1, 0, 0.372549, 1,
1.47918, 0.512247, 1.919398, 1, 0, 0.3647059, 1,
1.481684, -0.8997051, 1.161698, 1, 0, 0.3607843, 1,
1.483215, -0.9203965, -0.4243472, 1, 0, 0.3529412, 1,
1.491489, 1.93239, -0.1210758, 1, 0, 0.3490196, 1,
1.495873, 0.2054089, 2.201802, 1, 0, 0.3411765, 1,
1.498473, 0.2849796, 0.01571927, 1, 0, 0.3372549, 1,
1.547555, -0.2756607, 2.015562, 1, 0, 0.3294118, 1,
1.555856, 1.470233, 0.2289314, 1, 0, 0.3254902, 1,
1.562927, 0.1997718, 0.5510859, 1, 0, 0.3176471, 1,
1.563254, -0.6397786, 2.483495, 1, 0, 0.3137255, 1,
1.565911, 1.210053, 1.138038, 1, 0, 0.3058824, 1,
1.580597, 0.3079454, 1.542271, 1, 0, 0.2980392, 1,
1.611371, 1.705762, -0.4816399, 1, 0, 0.2941177, 1,
1.619376, 0.3606914, 3.097486, 1, 0, 0.2862745, 1,
1.631365, 0.2755494, 1.220784, 1, 0, 0.282353, 1,
1.636824, 1.440066, -0.1587726, 1, 0, 0.2745098, 1,
1.650986, -0.5739586, 1.623339, 1, 0, 0.2705882, 1,
1.660454, -0.9166347, 2.330231, 1, 0, 0.2627451, 1,
1.661437, 1.790721, 0.8933993, 1, 0, 0.2588235, 1,
1.66466, -0.1824182, 0.1256142, 1, 0, 0.2509804, 1,
1.672505, -0.1185376, 2.38427, 1, 0, 0.2470588, 1,
1.681161, -0.009853806, 0.3257242, 1, 0, 0.2392157, 1,
1.70952, 0.3284332, 2.37146, 1, 0, 0.2352941, 1,
1.719332, 0.004987146, 1.760268, 1, 0, 0.227451, 1,
1.724294, 1.886924, 0.2631634, 1, 0, 0.2235294, 1,
1.730922, -1.465606, 3.296921, 1, 0, 0.2156863, 1,
1.734837, -0.08331138, 1.383422, 1, 0, 0.2117647, 1,
1.748744, 0.6390172, 2.85406, 1, 0, 0.2039216, 1,
1.752675, -0.2171055, 2.40644, 1, 0, 0.1960784, 1,
1.762985, 0.8939052, 2.165892, 1, 0, 0.1921569, 1,
1.763793, -0.439746, 1.451326, 1, 0, 0.1843137, 1,
1.766604, 1.305407, 2.402719, 1, 0, 0.1803922, 1,
1.839072, 0.4572467, 1.046931, 1, 0, 0.172549, 1,
1.848615, -0.4890346, 2.872377, 1, 0, 0.1686275, 1,
1.857232, -1.194333, 1.971847, 1, 0, 0.1607843, 1,
1.875056, 2.434758, 2.111651, 1, 0, 0.1568628, 1,
1.876048, 0.09390094, 2.419203, 1, 0, 0.1490196, 1,
1.904094, -0.5041329, 2.116771, 1, 0, 0.145098, 1,
1.904546, -1.144447, 2.230094, 1, 0, 0.1372549, 1,
1.920053, -0.7930187, 1.215491, 1, 0, 0.1333333, 1,
1.933244, 0.3679641, -0.8371833, 1, 0, 0.1254902, 1,
1.959041, -1.492787, 2.513043, 1, 0, 0.1215686, 1,
2.043848, 0.5019689, 0.9075388, 1, 0, 0.1137255, 1,
2.047687, 0.7974761, 1.404792, 1, 0, 0.1098039, 1,
2.077085, 1.584202, 1.41249, 1, 0, 0.1019608, 1,
2.143569, -0.1791399, 0.7445044, 1, 0, 0.09411765, 1,
2.21902, -2.909007, 1.978666, 1, 0, 0.09019608, 1,
2.288047, 0.9285239, 1.466173, 1, 0, 0.08235294, 1,
2.290068, -1.135941, 1.748354, 1, 0, 0.07843138, 1,
2.339962, -1.058329, 1.805218, 1, 0, 0.07058824, 1,
2.358819, 2.383972, 2.642551, 1, 0, 0.06666667, 1,
2.371337, 0.5399967, 0.2462964, 1, 0, 0.05882353, 1,
2.41241, 0.5616097, 1.169186, 1, 0, 0.05490196, 1,
2.430466, -0.9326875, 2.923935, 1, 0, 0.04705882, 1,
2.459431, 0.9915237, -0.1376566, 1, 0, 0.04313726, 1,
2.470471, -0.9659377, 0.5312417, 1, 0, 0.03529412, 1,
2.481778, -0.2454202, 1.662977, 1, 0, 0.03137255, 1,
2.598079, -0.9391016, 2.531961, 1, 0, 0.02352941, 1,
2.680257, 1.743793, 1.062253, 1, 0, 0.01960784, 1,
2.829839, 1.507062, 1.006994, 1, 0, 0.01176471, 1,
2.833045, -2.803252, 1.157224, 1, 0, 0.007843138, 1
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
-0.1195786, -3.947712, -6.927734, 0, -0.5, 0.5, 0.5,
-0.1195786, -3.947712, -6.927734, 1, -0.5, 0.5, 0.5,
-0.1195786, -3.947712, -6.927734, 1, 1.5, 0.5, 0.5,
-0.1195786, -3.947712, -6.927734, 0, 1.5, 0.5, 0.5
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
-4.073142, 0.1550215, -6.927734, 0, -0.5, 0.5, 0.5,
-4.073142, 0.1550215, -6.927734, 1, -0.5, 0.5, 0.5,
-4.073142, 0.1550215, -6.927734, 1, 1.5, 0.5, 0.5,
-4.073142, 0.1550215, -6.927734, 0, 1.5, 0.5, 0.5
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
-4.073142, -3.947712, 0.1521206, 0, -0.5, 0.5, 0.5,
-4.073142, -3.947712, 0.1521206, 1, -0.5, 0.5, 0.5,
-4.073142, -3.947712, 0.1521206, 1, 1.5, 0.5, 0.5,
-4.073142, -3.947712, 0.1521206, 0, 1.5, 0.5, 0.5
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
-3, -3.000927, -5.293921,
2, -3.000927, -5.293921,
-3, -3.000927, -5.293921,
-3, -3.158725, -5.566224,
-2, -3.000927, -5.293921,
-2, -3.158725, -5.566224,
-1, -3.000927, -5.293921,
-1, -3.158725, -5.566224,
0, -3.000927, -5.293921,
0, -3.158725, -5.566224,
1, -3.000927, -5.293921,
1, -3.158725, -5.566224,
2, -3.000927, -5.293921,
2, -3.158725, -5.566224
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
-3, -3.47432, -6.110827, 0, -0.5, 0.5, 0.5,
-3, -3.47432, -6.110827, 1, -0.5, 0.5, 0.5,
-3, -3.47432, -6.110827, 1, 1.5, 0.5, 0.5,
-3, -3.47432, -6.110827, 0, 1.5, 0.5, 0.5,
-2, -3.47432, -6.110827, 0, -0.5, 0.5, 0.5,
-2, -3.47432, -6.110827, 1, -0.5, 0.5, 0.5,
-2, -3.47432, -6.110827, 1, 1.5, 0.5, 0.5,
-2, -3.47432, -6.110827, 0, 1.5, 0.5, 0.5,
-1, -3.47432, -6.110827, 0, -0.5, 0.5, 0.5,
-1, -3.47432, -6.110827, 1, -0.5, 0.5, 0.5,
-1, -3.47432, -6.110827, 1, 1.5, 0.5, 0.5,
-1, -3.47432, -6.110827, 0, 1.5, 0.5, 0.5,
0, -3.47432, -6.110827, 0, -0.5, 0.5, 0.5,
0, -3.47432, -6.110827, 1, -0.5, 0.5, 0.5,
0, -3.47432, -6.110827, 1, 1.5, 0.5, 0.5,
0, -3.47432, -6.110827, 0, 1.5, 0.5, 0.5,
1, -3.47432, -6.110827, 0, -0.5, 0.5, 0.5,
1, -3.47432, -6.110827, 1, -0.5, 0.5, 0.5,
1, -3.47432, -6.110827, 1, 1.5, 0.5, 0.5,
1, -3.47432, -6.110827, 0, 1.5, 0.5, 0.5,
2, -3.47432, -6.110827, 0, -0.5, 0.5, 0.5,
2, -3.47432, -6.110827, 1, -0.5, 0.5, 0.5,
2, -3.47432, -6.110827, 1, 1.5, 0.5, 0.5,
2, -3.47432, -6.110827, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<6; i++) 
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
20, 21, 22, 20, 22, 23
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
-3.160781, -2, -5.293921,
-3.160781, 3, -5.293921,
-3.160781, -2, -5.293921,
-3.312842, -2, -5.566224,
-3.160781, -1, -5.293921,
-3.312842, -1, -5.566224,
-3.160781, 0, -5.293921,
-3.312842, 0, -5.566224,
-3.160781, 1, -5.293921,
-3.312842, 1, -5.566224,
-3.160781, 2, -5.293921,
-3.312842, 2, -5.566224,
-3.160781, 3, -5.293921,
-3.312842, 3, -5.566224
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
-3.616962, -2, -6.110827, 0, -0.5, 0.5, 0.5,
-3.616962, -2, -6.110827, 1, -0.5, 0.5, 0.5,
-3.616962, -2, -6.110827, 1, 1.5, 0.5, 0.5,
-3.616962, -2, -6.110827, 0, 1.5, 0.5, 0.5,
-3.616962, -1, -6.110827, 0, -0.5, 0.5, 0.5,
-3.616962, -1, -6.110827, 1, -0.5, 0.5, 0.5,
-3.616962, -1, -6.110827, 1, 1.5, 0.5, 0.5,
-3.616962, -1, -6.110827, 0, 1.5, 0.5, 0.5,
-3.616962, 0, -6.110827, 0, -0.5, 0.5, 0.5,
-3.616962, 0, -6.110827, 1, -0.5, 0.5, 0.5,
-3.616962, 0, -6.110827, 1, 1.5, 0.5, 0.5,
-3.616962, 0, -6.110827, 0, 1.5, 0.5, 0.5,
-3.616962, 1, -6.110827, 0, -0.5, 0.5, 0.5,
-3.616962, 1, -6.110827, 1, -0.5, 0.5, 0.5,
-3.616962, 1, -6.110827, 1, 1.5, 0.5, 0.5,
-3.616962, 1, -6.110827, 0, 1.5, 0.5, 0.5,
-3.616962, 2, -6.110827, 0, -0.5, 0.5, 0.5,
-3.616962, 2, -6.110827, 1, -0.5, 0.5, 0.5,
-3.616962, 2, -6.110827, 1, 1.5, 0.5, 0.5,
-3.616962, 2, -6.110827, 0, 1.5, 0.5, 0.5,
-3.616962, 3, -6.110827, 0, -0.5, 0.5, 0.5,
-3.616962, 3, -6.110827, 1, -0.5, 0.5, 0.5,
-3.616962, 3, -6.110827, 1, 1.5, 0.5, 0.5,
-3.616962, 3, -6.110827, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<6; i++) 
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
20, 21, 22, 20, 22, 23
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
-3.160781, -3.000927, -4,
-3.160781, -3.000927, 4,
-3.160781, -3.000927, -4,
-3.312842, -3.158725, -4,
-3.160781, -3.000927, -2,
-3.312842, -3.158725, -2,
-3.160781, -3.000927, 0,
-3.312842, -3.158725, 0,
-3.160781, -3.000927, 2,
-3.312842, -3.158725, 2,
-3.160781, -3.000927, 4,
-3.312842, -3.158725, 4
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
-3.616962, -3.47432, -4, 0, -0.5, 0.5, 0.5,
-3.616962, -3.47432, -4, 1, -0.5, 0.5, 0.5,
-3.616962, -3.47432, -4, 1, 1.5, 0.5, 0.5,
-3.616962, -3.47432, -4, 0, 1.5, 0.5, 0.5,
-3.616962, -3.47432, -2, 0, -0.5, 0.5, 0.5,
-3.616962, -3.47432, -2, 1, -0.5, 0.5, 0.5,
-3.616962, -3.47432, -2, 1, 1.5, 0.5, 0.5,
-3.616962, -3.47432, -2, 0, 1.5, 0.5, 0.5,
-3.616962, -3.47432, 0, 0, -0.5, 0.5, 0.5,
-3.616962, -3.47432, 0, 1, -0.5, 0.5, 0.5,
-3.616962, -3.47432, 0, 1, 1.5, 0.5, 0.5,
-3.616962, -3.47432, 0, 0, 1.5, 0.5, 0.5,
-3.616962, -3.47432, 2, 0, -0.5, 0.5, 0.5,
-3.616962, -3.47432, 2, 1, -0.5, 0.5, 0.5,
-3.616962, -3.47432, 2, 1, 1.5, 0.5, 0.5,
-3.616962, -3.47432, 2, 0, 1.5, 0.5, 0.5,
-3.616962, -3.47432, 4, 0, -0.5, 0.5, 0.5,
-3.616962, -3.47432, 4, 1, -0.5, 0.5, 0.5,
-3.616962, -3.47432, 4, 1, 1.5, 0.5, 0.5,
-3.616962, -3.47432, 4, 0, 1.5, 0.5, 0.5
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
-3.160781, -3.000927, -5.293921,
-3.160781, 3.310971, -5.293921,
-3.160781, -3.000927, 5.598163,
-3.160781, 3.310971, 5.598163,
-3.160781, -3.000927, -5.293921,
-3.160781, -3.000927, 5.598163,
-3.160781, 3.310971, -5.293921,
-3.160781, 3.310971, 5.598163,
-3.160781, -3.000927, -5.293921,
2.921624, -3.000927, -5.293921,
-3.160781, -3.000927, 5.598163,
2.921624, -3.000927, 5.598163,
-3.160781, 3.310971, -5.293921,
2.921624, 3.310971, -5.293921,
-3.160781, 3.310971, 5.598163,
2.921624, 3.310971, 5.598163,
2.921624, -3.000927, -5.293921,
2.921624, 3.310971, -5.293921,
2.921624, -3.000927, 5.598163,
2.921624, 3.310971, 5.598163,
2.921624, -3.000927, -5.293921,
2.921624, -3.000927, 5.598163,
2.921624, 3.310971, -5.293921,
2.921624, 3.310971, 5.598163
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
var radius = 7.465675;
var distance = 33.21563;
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
mvMatrix.translate( 0.1195786, -0.1550215, -0.1521206 );
mvMatrix.scale( 1.327112, 1.27886, 0.7410918 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.21563);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
Methyloxiran<-read.table("Methyloxiran.xyz")
```

```
## Error in read.table("Methyloxiran.xyz"): no lines available in input
```

```r
x<-Methyloxiran$V2
```

```
## Error in eval(expr, envir, enclos): object 'Methyloxiran' not found
```

```r
y<-Methyloxiran$V3
```

```
## Error in eval(expr, envir, enclos): object 'Methyloxiran' not found
```

```r
z<-Methyloxiran$V4
```

```
## Error in eval(expr, envir, enclos): object 'Methyloxiran' not found
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
-3.072203, 0.04773716, -0.8770707, 0, 0, 1, 1, 1,
-2.868131, 0.907263, 0.0742499, 1, 0, 0, 1, 1,
-2.543037, 0.4936998, -1.913151, 1, 0, 0, 1, 1,
-2.453724, 1.049279, -2.358964, 1, 0, 0, 1, 1,
-2.419707, -0.2112101, -1.875836, 1, 0, 0, 1, 1,
-2.378449, 1.274832, -2.224297, 1, 0, 0, 1, 1,
-2.374931, -0.2369304, -0.9278322, 0, 0, 0, 1, 1,
-2.312856, -1.377254, -1.277298, 0, 0, 0, 1, 1,
-2.301327, 1.092176, -0.371558, 0, 0, 0, 1, 1,
-2.280234, 1.54245, -1.162256, 0, 0, 0, 1, 1,
-2.270603, 0.4960227, 0.06022503, 0, 0, 0, 1, 1,
-2.270047, -1.111481, -2.288883, 0, 0, 0, 1, 1,
-2.174964, -0.03682247, -2.020681, 0, 0, 0, 1, 1,
-2.165325, -0.4083223, -0.170512, 1, 1, 1, 1, 1,
-2.133323, -1.287274, -1.707477, 1, 1, 1, 1, 1,
-2.117573, 0.07650586, -1.820983, 1, 1, 1, 1, 1,
-2.112437, -0.4335127, -2.711678, 1, 1, 1, 1, 1,
-2.069918, -1.560805, -2.925229, 1, 1, 1, 1, 1,
-2.055881, 1.408738, -1.939738, 1, 1, 1, 1, 1,
-2.037745, 0.9306964, -1.163572, 1, 1, 1, 1, 1,
-2.026981, 1.254311, -1.880939, 1, 1, 1, 1, 1,
-2.025385, -1.16724, -2.773877, 1, 1, 1, 1, 1,
-2.020182, -1.006229, -2.212327, 1, 1, 1, 1, 1,
-2.014856, -0.4259837, -1.390589, 1, 1, 1, 1, 1,
-1.99685, 1.472297, -2.213048, 1, 1, 1, 1, 1,
-1.996216, 0.9320408, -2.798298, 1, 1, 1, 1, 1,
-1.990554, -1.805433, -3.548022, 1, 1, 1, 1, 1,
-1.977636, -0.2118931, -1.851786, 1, 1, 1, 1, 1,
-1.93595, -0.7449511, -0.4663625, 0, 0, 1, 1, 1,
-1.925816, 0.7138194, 0.1027211, 1, 0, 0, 1, 1,
-1.923568, -0.5072405, -1.395183, 1, 0, 0, 1, 1,
-1.922846, 0.9966456, -0.8740341, 1, 0, 0, 1, 1,
-1.916738, -1.703208, -1.086953, 1, 0, 0, 1, 1,
-1.871567, -0.5657775, -2.654086, 1, 0, 0, 1, 1,
-1.829216, -0.255887, -1.0918, 0, 0, 0, 1, 1,
-1.828403, -2.337444, -2.406993, 0, 0, 0, 1, 1,
-1.816614, -1.071258, -0.6032037, 0, 0, 0, 1, 1,
-1.806809, -0.3964394, -1.019328, 0, 0, 0, 1, 1,
-1.789974, -0.4555413, -1.202932, 0, 0, 0, 1, 1,
-1.787885, 0.1427268, -2.331003, 0, 0, 0, 1, 1,
-1.76038, 1.128485, 0.04451084, 0, 0, 0, 1, 1,
-1.754681, -0.07294644, -1.764763, 1, 1, 1, 1, 1,
-1.754178, 0.204866, -1.701081, 1, 1, 1, 1, 1,
-1.748323, 1.211315, -0.6316777, 1, 1, 1, 1, 1,
-1.743331, -0.8922217, -1.433513, 1, 1, 1, 1, 1,
-1.734241, -0.1742631, -1.67376, 1, 1, 1, 1, 1,
-1.715135, -1.475938, -4.58132, 1, 1, 1, 1, 1,
-1.701378, 0.6709692, -1.317648, 1, 1, 1, 1, 1,
-1.701153, -1.508288, -2.834102, 1, 1, 1, 1, 1,
-1.696744, -0.5222303, -2.489361, 1, 1, 1, 1, 1,
-1.696138, -1.269889, -0.8700052, 1, 1, 1, 1, 1,
-1.695644, 0.9546615, 0.3970606, 1, 1, 1, 1, 1,
-1.684995, 1.402482, -1.011724, 1, 1, 1, 1, 1,
-1.652027, 0.7988999, -0.7169548, 1, 1, 1, 1, 1,
-1.64192, 1.209844, -2.627346, 1, 1, 1, 1, 1,
-1.623102, -0.1711955, -2.367434, 1, 1, 1, 1, 1,
-1.618321, 0.3555867, -0.2216871, 0, 0, 1, 1, 1,
-1.605786, -0.4389161, -1.443153, 1, 0, 0, 1, 1,
-1.59469, -0.5941289, -0.5356945, 1, 0, 0, 1, 1,
-1.59377, -0.1719267, -0.6337492, 1, 0, 0, 1, 1,
-1.592938, -1.079857, -1.162495, 1, 0, 0, 1, 1,
-1.591322, -1.789714, -2.897991, 1, 0, 0, 1, 1,
-1.587038, 1.281515, -1.779824, 0, 0, 0, 1, 1,
-1.582065, 0.3218161, -1.695323, 0, 0, 0, 1, 1,
-1.558582, 0.3578933, -0.9428391, 0, 0, 0, 1, 1,
-1.547935, -0.911968, -2.440002, 0, 0, 0, 1, 1,
-1.539285, 0.3615717, -1.107854, 0, 0, 0, 1, 1,
-1.536649, 1.246544, -0.1909036, 0, 0, 0, 1, 1,
-1.527938, -0.3990941, -0.4809968, 0, 0, 0, 1, 1,
-1.513942, -0.264894, -2.076659, 1, 1, 1, 1, 1,
-1.496119, 0.4597885, -1.540075, 1, 1, 1, 1, 1,
-1.488125, -1.101188, -1.135399, 1, 1, 1, 1, 1,
-1.466803, 1.041048, 1.350632, 1, 1, 1, 1, 1,
-1.464336, 0.5311354, -2.516646, 1, 1, 1, 1, 1,
-1.462933, -1.11082, -4.793431, 1, 1, 1, 1, 1,
-1.462351, 0.4928428, -3.003906, 1, 1, 1, 1, 1,
-1.4506, 0.5031732, -1.911805, 1, 1, 1, 1, 1,
-1.42637, 0.1023283, -0.8331599, 1, 1, 1, 1, 1,
-1.421039, -0.1592016, -1.396055, 1, 1, 1, 1, 1,
-1.416215, 0.004188929, -1.674721, 1, 1, 1, 1, 1,
-1.408001, -0.8301243, -3.633766, 1, 1, 1, 1, 1,
-1.403283, 2.130677, -0.451275, 1, 1, 1, 1, 1,
-1.401301, -0.4863277, -1.028516, 1, 1, 1, 1, 1,
-1.388773, 1.802029, -0.370888, 1, 1, 1, 1, 1,
-1.38725, 1.11543, -0.1820654, 0, 0, 1, 1, 1,
-1.384937, 0.4734815, 0.03674804, 1, 0, 0, 1, 1,
-1.384738, 0.9823878, -0.3816104, 1, 0, 0, 1, 1,
-1.37302, -1.247338, -3.501436, 1, 0, 0, 1, 1,
-1.367675, 0.1546179, -1.52699, 1, 0, 0, 1, 1,
-1.366409, -0.2065448, 0.1048009, 1, 0, 0, 1, 1,
-1.362779, 2.021739, -1.038486, 0, 0, 0, 1, 1,
-1.361363, 0.5515099, -0.9102778, 0, 0, 0, 1, 1,
-1.35861, -0.1683953, -2.713349, 0, 0, 0, 1, 1,
-1.341685, -0.3216922, -1.665566, 0, 0, 0, 1, 1,
-1.337752, -0.005101457, -2.223605, 0, 0, 0, 1, 1,
-1.330808, 1.544183, -2.564358, 0, 0, 0, 1, 1,
-1.329773, -0.6227986, -0.7887174, 0, 0, 0, 1, 1,
-1.328732, -0.328048, -3.49188, 1, 1, 1, 1, 1,
-1.323961, 0.8067768, -0.09943594, 1, 1, 1, 1, 1,
-1.314669, 1.825252, -0.2290091, 1, 1, 1, 1, 1,
-1.313126, 0.5502667, -1.649231, 1, 1, 1, 1, 1,
-1.303519, 0.1983611, -1.985015, 1, 1, 1, 1, 1,
-1.301938, 0.3395387, -2.063333, 1, 1, 1, 1, 1,
-1.298386, 2.150132, -0.8284851, 1, 1, 1, 1, 1,
-1.286455, 2.342219, -0.8749599, 1, 1, 1, 1, 1,
-1.285397, -0.7256218, -2.775938, 1, 1, 1, 1, 1,
-1.283765, 1.349481, -0.3486737, 1, 1, 1, 1, 1,
-1.266582, -1.452254, -2.737935, 1, 1, 1, 1, 1,
-1.266176, 1.689344, -1.335645, 1, 1, 1, 1, 1,
-1.26417, 0.2285991, -3.010894, 1, 1, 1, 1, 1,
-1.257412, -0.2275203, -1.566827, 1, 1, 1, 1, 1,
-1.251908, 0.900827, -1.332503, 1, 1, 1, 1, 1,
-1.236015, 0.2864153, -1.46175, 0, 0, 1, 1, 1,
-1.235934, -0.1050887, -1.305303, 1, 0, 0, 1, 1,
-1.232845, -0.4114651, -3.140341, 1, 0, 0, 1, 1,
-1.216914, -0.4628528, -2.018715, 1, 0, 0, 1, 1,
-1.213153, 0.4088596, -1.509839, 1, 0, 0, 1, 1,
-1.210672, -0.6092569, -2.17371, 1, 0, 0, 1, 1,
-1.20672, -1.054615, -1.390897, 0, 0, 0, 1, 1,
-1.201064, -1.216677, -2.906039, 0, 0, 0, 1, 1,
-1.186024, 0.4651904, -0.3238911, 0, 0, 0, 1, 1,
-1.182303, -1.110618, -1.87913, 0, 0, 0, 1, 1,
-1.175604, -0.2442434, -1.708366, 0, 0, 0, 1, 1,
-1.174136, 0.2282141, -0.2298888, 0, 0, 0, 1, 1,
-1.170874, 0.404866, -0.8702611, 0, 0, 0, 1, 1,
-1.1697, -0.2429778, -2.786857, 1, 1, 1, 1, 1,
-1.160584, -0.2130734, -3.715235, 1, 1, 1, 1, 1,
-1.144341, -1.225056, -2.074831, 1, 1, 1, 1, 1,
-1.141898, -0.06015191, -0.1881692, 1, 1, 1, 1, 1,
-1.138624, 0.7435911, -0.6747295, 1, 1, 1, 1, 1,
-1.137863, 0.4021688, -0.9675236, 1, 1, 1, 1, 1,
-1.133224, -0.9086998, -3.388682, 1, 1, 1, 1, 1,
-1.123939, -1.490304, -3.257763, 1, 1, 1, 1, 1,
-1.123256, -0.2102161, -1.963411, 1, 1, 1, 1, 1,
-1.114406, -1.05736, -2.680734, 1, 1, 1, 1, 1,
-1.107036, -0.341192, -0.3258237, 1, 1, 1, 1, 1,
-1.106251, 0.2621439, -2.140575, 1, 1, 1, 1, 1,
-1.103606, -0.001683851, -1.401452, 1, 1, 1, 1, 1,
-1.103397, -0.5458871, -3.104546, 1, 1, 1, 1, 1,
-1.103274, -0.9968675, -3.636761, 1, 1, 1, 1, 1,
-1.098744, -1.194792, -2.723437, 0, 0, 1, 1, 1,
-1.093024, -0.3620992, -0.3105814, 1, 0, 0, 1, 1,
-1.091991, -1.644774, -3.828909, 1, 0, 0, 1, 1,
-1.076336, -0.1103149, -2.834713, 1, 0, 0, 1, 1,
-1.075029, -0.2236487, -1.539032, 1, 0, 0, 1, 1,
-1.059452, 0.9221494, -0.2719582, 1, 0, 0, 1, 1,
-1.054543, 1.304274, 0.4413202, 0, 0, 0, 1, 1,
-1.054465, -1.604867, -3.472102, 0, 0, 0, 1, 1,
-1.049324, 0.4800563, -0.8452168, 0, 0, 0, 1, 1,
-1.04906, 0.02139995, -2.242159, 0, 0, 0, 1, 1,
-1.034998, 0.6093094, -1.184312, 0, 0, 0, 1, 1,
-1.027479, 1.329102, -3.228087, 0, 0, 0, 1, 1,
-1.026348, -1.562446, -1.510073, 0, 0, 0, 1, 1,
-1.026212, 1.349756, 0.7701298, 1, 1, 1, 1, 1,
-1.024249, 0.5508151, -0.8864962, 1, 1, 1, 1, 1,
-1.020365, 0.8405931, -1.564842, 1, 1, 1, 1, 1,
-1.020237, 0.6601427, -1.564447, 1, 1, 1, 1, 1,
-1.013218, 0.6971378, -2.657882, 1, 1, 1, 1, 1,
-1.010121, -0.01368513, -1.858606, 1, 1, 1, 1, 1,
-1.006098, 0.04155914, -0.1021224, 1, 1, 1, 1, 1,
-1.00577, 0.1602598, -0.401753, 1, 1, 1, 1, 1,
-0.9960086, 1.386098, 0.9220829, 1, 1, 1, 1, 1,
-0.9926968, 2.767033, 1.344419, 1, 1, 1, 1, 1,
-0.9913577, -0.948133, -1.129976, 1, 1, 1, 1, 1,
-0.987126, 0.4299259, 0.80829, 1, 1, 1, 1, 1,
-0.97658, 1.003921, -1.285086, 1, 1, 1, 1, 1,
-0.966814, -0.2777363, -1.132376, 1, 1, 1, 1, 1,
-0.9635258, 0.1711888, -1.829924, 1, 1, 1, 1, 1,
-0.9627789, 1.318828, -0.1355737, 0, 0, 1, 1, 1,
-0.9626216, 0.4500552, -1.471596, 1, 0, 0, 1, 1,
-0.9625973, -2.757028, -2.186601, 1, 0, 0, 1, 1,
-0.9600804, -0.02073021, -0.8899674, 1, 0, 0, 1, 1,
-0.9487072, 0.4735276, -0.3029215, 1, 0, 0, 1, 1,
-0.9401869, -1.211414, -2.041721, 1, 0, 0, 1, 1,
-0.9347305, 1.13522, 1.846817, 0, 0, 0, 1, 1,
-0.9343112, 0.4763808, -0.1418346, 0, 0, 0, 1, 1,
-0.933144, -2.179524, -3.320882, 0, 0, 0, 1, 1,
-0.9323236, -0.4486278, -2.36507, 0, 0, 0, 1, 1,
-0.9312737, 0.9031422, -0.8682442, 0, 0, 0, 1, 1,
-0.9292356, -0.9321741, -1.984838, 0, 0, 0, 1, 1,
-0.9291489, -0.2337006, -2.061459, 0, 0, 0, 1, 1,
-0.9287139, 0.2645383, -1.77251, 1, 1, 1, 1, 1,
-0.9193556, 1.008868, -0.286922, 1, 1, 1, 1, 1,
-0.9144964, 1.82381, -0.9303936, 1, 1, 1, 1, 1,
-0.9140953, -1.748296, -1.632771, 1, 1, 1, 1, 1,
-0.9063496, -1.205975, -2.313085, 1, 1, 1, 1, 1,
-0.9006096, 0.3102719, -0.5754685, 1, 1, 1, 1, 1,
-0.9000796, 0.3060319, -0.4884892, 1, 1, 1, 1, 1,
-0.8920355, -1.459491, -2.908721, 1, 1, 1, 1, 1,
-0.8780979, 0.3353122, -2.482192, 1, 1, 1, 1, 1,
-0.8766304, -1.096923, -2.213465, 1, 1, 1, 1, 1,
-0.8743652, -0.8172501, -2.575178, 1, 1, 1, 1, 1,
-0.8630547, -0.3153331, -2.073355, 1, 1, 1, 1, 1,
-0.8613533, -0.6721936, -1.480498, 1, 1, 1, 1, 1,
-0.8604366, 0.4826574, -1.624687, 1, 1, 1, 1, 1,
-0.8547676, -1.872255, -1.587965, 1, 1, 1, 1, 1,
-0.8546852, 0.8129598, -0.9339228, 0, 0, 1, 1, 1,
-0.8537039, -1.222657, -1.838217, 1, 0, 0, 1, 1,
-0.8466101, -0.8298486, -2.36142, 1, 0, 0, 1, 1,
-0.832687, -2.510169, -2.869311, 1, 0, 0, 1, 1,
-0.8320479, 0.8384021, -0.1919674, 1, 0, 0, 1, 1,
-0.8263153, 0.0652601, -2.010262, 1, 0, 0, 1, 1,
-0.8225277, 2.170605, -0.2485088, 0, 0, 0, 1, 1,
-0.8179587, -0.2375915, -4.302505, 0, 0, 0, 1, 1,
-0.8178962, -2.296962, -2.6119, 0, 0, 0, 1, 1,
-0.8175075, 2.122488, -0.7986771, 0, 0, 0, 1, 1,
-0.8139908, 2.364034, -0.07316497, 0, 0, 0, 1, 1,
-0.8109531, 0.7774813, -1.655253, 0, 0, 0, 1, 1,
-0.809177, -1.919802, -2.648581, 0, 0, 0, 1, 1,
-0.8048855, -0.556551, -1.236966, 1, 1, 1, 1, 1,
-0.796303, -0.1266996, -2.785903, 1, 1, 1, 1, 1,
-0.7926024, 0.1255645, -1.828081, 1, 1, 1, 1, 1,
-0.7915014, 1.02644, 0.8521876, 1, 1, 1, 1, 1,
-0.7914966, 1.553107, -0.1623899, 1, 1, 1, 1, 1,
-0.7885831, 0.2142506, -0.06370153, 1, 1, 1, 1, 1,
-0.7834854, -0.2318759, -2.295853, 1, 1, 1, 1, 1,
-0.7778072, 0.3726785, -0.9589009, 1, 1, 1, 1, 1,
-0.7641619, -0.1285582, -1.519574, 1, 1, 1, 1, 1,
-0.7638403, -0.7785106, -3.070392, 1, 1, 1, 1, 1,
-0.7620212, 0.4631498, 0.4725224, 1, 1, 1, 1, 1,
-0.7586645, 1.066973, -0.1975617, 1, 1, 1, 1, 1,
-0.7570686, 0.5075655, -1.00589, 1, 1, 1, 1, 1,
-0.7513824, 1.79565, -0.1257546, 1, 1, 1, 1, 1,
-0.7506707, 0.5691957, -2.308603, 1, 1, 1, 1, 1,
-0.7420571, -0.1703673, -1.63269, 0, 0, 1, 1, 1,
-0.7400831, 0.6977877, -0.6381683, 1, 0, 0, 1, 1,
-0.7378371, 0.934964, 0.8077906, 1, 0, 0, 1, 1,
-0.7351819, 0.5629935, -1.881806, 1, 0, 0, 1, 1,
-0.7330573, -1.241854, -1.982374, 1, 0, 0, 1, 1,
-0.7240881, 1.836238, -0.7284932, 1, 0, 0, 1, 1,
-0.7210731, 0.01622893, -0.0423574, 0, 0, 0, 1, 1,
-0.7200359, -2.491507, -1.158477, 0, 0, 0, 1, 1,
-0.7041033, -0.7552078, -3.443197, 0, 0, 0, 1, 1,
-0.7040551, 0.2430076, -2.639633, 0, 0, 0, 1, 1,
-0.7026629, -1.090024, -1.334954, 0, 0, 0, 1, 1,
-0.7024336, -2.339683, -3.121741, 0, 0, 0, 1, 1,
-0.6935987, -0.2415218, -4.168373, 0, 0, 0, 1, 1,
-0.691217, 1.035244, -1.946933, 1, 1, 1, 1, 1,
-0.6865677, -0.9791219, -2.228252, 1, 1, 1, 1, 1,
-0.685758, 1.896073, 0.04902844, 1, 1, 1, 1, 1,
-0.6794124, -0.1532199, -1.888867, 1, 1, 1, 1, 1,
-0.6785349, -0.7641029, -1.654837, 1, 1, 1, 1, 1,
-0.6754081, -0.4093955, -0.9533362, 1, 1, 1, 1, 1,
-0.6700065, -1.404474, -2.826763, 1, 1, 1, 1, 1,
-0.661928, 0.9647483, 2.351103, 1, 1, 1, 1, 1,
-0.6577833, -0.3233293, -2.395444, 1, 1, 1, 1, 1,
-0.6563769, 0.4064874, -2.325897, 1, 1, 1, 1, 1,
-0.6540902, -0.06509287, -2.102659, 1, 1, 1, 1, 1,
-0.6540084, -0.3352773, -2.078292, 1, 1, 1, 1, 1,
-0.6483514, -1.371586, -2.485106, 1, 1, 1, 1, 1,
-0.6423898, -0.3203619, -2.514018, 1, 1, 1, 1, 1,
-0.6361039, -0.2920349, -1.571588, 1, 1, 1, 1, 1,
-0.6341804, -0.04980179, -1.832984, 0, 0, 1, 1, 1,
-0.6195278, 0.2357274, -1.183958, 1, 0, 0, 1, 1,
-0.6189891, -0.1661511, -0.4799391, 1, 0, 0, 1, 1,
-0.6171662, -0.893853, -3.299037, 1, 0, 0, 1, 1,
-0.6161459, 0.007643465, -2.899981, 1, 0, 0, 1, 1,
-0.6152404, 0.2396432, -1.836831, 1, 0, 0, 1, 1,
-0.5967273, 0.3439354, 0.4092653, 0, 0, 0, 1, 1,
-0.5905952, 0.7557812, -0.9316584, 0, 0, 0, 1, 1,
-0.5897125, -1.834876, -3.118186, 0, 0, 0, 1, 1,
-0.5894094, 0.049732, -2.50176, 0, 0, 0, 1, 1,
-0.5861933, -0.168617, -3.428699, 0, 0, 0, 1, 1,
-0.582507, -1.093966, -3.689782, 0, 0, 0, 1, 1,
-0.5798412, -0.0485467, -3.181258, 0, 0, 0, 1, 1,
-0.577885, -0.8308231, -3.154472, 1, 1, 1, 1, 1,
-0.5770912, 0.4375776, -1.69426, 1, 1, 1, 1, 1,
-0.5758967, 0.6524243, -0.9843341, 1, 1, 1, 1, 1,
-0.5726174, 1.21849, -2.151633, 1, 1, 1, 1, 1,
-0.5725221, -0.2977167, -2.065434, 1, 1, 1, 1, 1,
-0.5687479, -0.6952484, -2.403277, 1, 1, 1, 1, 1,
-0.5685648, -1.656341, -1.427141, 1, 1, 1, 1, 1,
-0.568396, -0.6197055, -1.288338, 1, 1, 1, 1, 1,
-0.5639927, 0.1535992, -0.3939187, 1, 1, 1, 1, 1,
-0.5633576, 0.45529, -0.3838538, 1, 1, 1, 1, 1,
-0.5623617, 0.8461661, -0.1274396, 1, 1, 1, 1, 1,
-0.5620012, -1.729375, -1.222154, 1, 1, 1, 1, 1,
-0.5615315, 0.4571541, -0.6410858, 1, 1, 1, 1, 1,
-0.5567346, -1.03325, -3.193435, 1, 1, 1, 1, 1,
-0.5556901, -1.248836, -2.797494, 1, 1, 1, 1, 1,
-0.554765, 1.36552, -0.9866851, 0, 0, 1, 1, 1,
-0.5526773, 0.01196441, -1.854051, 1, 0, 0, 1, 1,
-0.5509341, 0.9012175, 0.3069295, 1, 0, 0, 1, 1,
-0.5484415, 0.2449037, -1.78654, 1, 0, 0, 1, 1,
-0.5384971, 0.6803423, 0.2541443, 1, 0, 0, 1, 1,
-0.5383333, -0.1493837, -0.895774, 1, 0, 0, 1, 1,
-0.5372294, -0.8978729, -3.176523, 0, 0, 0, 1, 1,
-0.5364669, -0.4781501, -1.913396, 0, 0, 0, 1, 1,
-0.5347178, 0.3730382, -1.434995, 0, 0, 0, 1, 1,
-0.5332407, -1.783953, -2.399858, 0, 0, 0, 1, 1,
-0.5309997, -0.7376729, -3.107554, 0, 0, 0, 1, 1,
-0.529694, 1.046444, -0.2856777, 0, 0, 0, 1, 1,
-0.5282602, 0.06957946, -0.5327311, 0, 0, 0, 1, 1,
-0.5265215, -1.488173, -2.311035, 1, 1, 1, 1, 1,
-0.5254714, -0.6182286, -1.390739, 1, 1, 1, 1, 1,
-0.5242227, -0.8869968, -3.070729, 1, 1, 1, 1, 1,
-0.5232534, -0.1592064, -1.014701, 1, 1, 1, 1, 1,
-0.5189894, -0.5412062, -1.236232, 1, 1, 1, 1, 1,
-0.5178142, -2.143472, -4.068213, 1, 1, 1, 1, 1,
-0.515114, -0.6712898, -1.539752, 1, 1, 1, 1, 1,
-0.5060861, -0.7234462, -2.973535, 1, 1, 1, 1, 1,
-0.5045477, -0.2518329, -1.996874, 1, 1, 1, 1, 1,
-0.504072, 0.2122706, -0.8504708, 1, 1, 1, 1, 1,
-0.5024773, -0.4842582, -2.500061, 1, 1, 1, 1, 1,
-0.5009732, 0.886086, -0.3618779, 1, 1, 1, 1, 1,
-0.4991359, -0.6013932, -2.494504, 1, 1, 1, 1, 1,
-0.4930435, 0.1871188, -0.5564395, 1, 1, 1, 1, 1,
-0.4917537, 0.8900989, -1.241048, 1, 1, 1, 1, 1,
-0.4892739, 0.7663265, 1.349141, 0, 0, 1, 1, 1,
-0.4875261, -1.354313, -1.977726, 1, 0, 0, 1, 1,
-0.4854478, 1.401143, -0.4369939, 1, 0, 0, 1, 1,
-0.4845909, -0.2276436, -2.730313, 1, 0, 0, 1, 1,
-0.4805577, -0.4817838, -0.7426696, 1, 0, 0, 1, 1,
-0.4746814, -1.082492, -3.297908, 1, 0, 0, 1, 1,
-0.4636677, -0.3144339, -1.608054, 0, 0, 0, 1, 1,
-0.4628441, 0.04835957, -1.087091, 0, 0, 0, 1, 1,
-0.4628205, -0.2203263, -2.555905, 0, 0, 0, 1, 1,
-0.4626828, -0.9206339, -1.36122, 0, 0, 0, 1, 1,
-0.4617183, -0.9438926, -2.090914, 0, 0, 0, 1, 1,
-0.4547661, -0.6662688, -2.440288, 0, 0, 0, 1, 1,
-0.450776, 0.1009722, -0.5033373, 0, 0, 0, 1, 1,
-0.4505443, -0.2748335, -0.50188, 1, 1, 1, 1, 1,
-0.4449441, -0.2264906, -3.660263, 1, 1, 1, 1, 1,
-0.4424322, 0.6139418, -0.8157052, 1, 1, 1, 1, 1,
-0.4422538, 0.197797, 0.5291743, 1, 1, 1, 1, 1,
-0.4401494, 0.2875207, -2.243137, 1, 1, 1, 1, 1,
-0.4394555, -0.5492433, -4.228493, 1, 1, 1, 1, 1,
-0.4387803, -0.373717, -1.769551, 1, 1, 1, 1, 1,
-0.4375508, -1.443926, -1.64057, 1, 1, 1, 1, 1,
-0.4308616, 0.1782337, -1.442312, 1, 1, 1, 1, 1,
-0.4280228, 0.7248545, -1.615059, 1, 1, 1, 1, 1,
-0.420234, 0.482734, -0.5842335, 1, 1, 1, 1, 1,
-0.4168225, -1.205199, -3.294587, 1, 1, 1, 1, 1,
-0.4162044, 1.551451, 0.7335811, 1, 1, 1, 1, 1,
-0.4122573, -0.3491452, -1.895046, 1, 1, 1, 1, 1,
-0.4117886, 0.2059235, -0.799152, 1, 1, 1, 1, 1,
-0.4089791, 0.267893, -1.310702, 0, 0, 1, 1, 1,
-0.4070498, -0.889491, -3.436423, 1, 0, 0, 1, 1,
-0.4041271, 0.7148017, -2.210838, 1, 0, 0, 1, 1,
-0.4040216, -0.8741919, -2.668525, 1, 0, 0, 1, 1,
-0.4036664, 0.5141757, -1.382455, 1, 0, 0, 1, 1,
-0.3977322, -1.003516, -3.698795, 1, 0, 0, 1, 1,
-0.3974799, -0.4735047, -2.690983, 0, 0, 0, 1, 1,
-0.3969508, 0.03191014, -2.25722, 0, 0, 0, 1, 1,
-0.3961122, 0.8521056, -2.06034, 0, 0, 0, 1, 1,
-0.3949431, -0.6540693, -3.110056, 0, 0, 0, 1, 1,
-0.3908217, -0.259689, -2.606399, 0, 0, 0, 1, 1,
-0.3871139, 1.089258, -0.03421933, 0, 0, 0, 1, 1,
-0.3870245, 1.027764, -0.01730152, 0, 0, 0, 1, 1,
-0.3869961, -0.7199132, -4.704483, 1, 1, 1, 1, 1,
-0.3836116, -1.258011, -2.99322, 1, 1, 1, 1, 1,
-0.3828735, -0.2914991, -1.754851, 1, 1, 1, 1, 1,
-0.3828113, -1.483992, -1.468613, 1, 1, 1, 1, 1,
-0.3809754, 0.02320543, 0.575441, 1, 1, 1, 1, 1,
-0.3796102, 0.180925, -2.112722, 1, 1, 1, 1, 1,
-0.3777517, -0.960887, -2.087118, 1, 1, 1, 1, 1,
-0.3725783, -0.511384, -2.578388, 1, 1, 1, 1, 1,
-0.3711857, 0.286522, -1.896628, 1, 1, 1, 1, 1,
-0.3636426, 1.327312, 0.02462685, 1, 1, 1, 1, 1,
-0.3610323, 0.8945603, 0.5638732, 1, 1, 1, 1, 1,
-0.3589235, 2.746586, -1.945494, 1, 1, 1, 1, 1,
-0.3551891, 1.699833, -0.8143895, 1, 1, 1, 1, 1,
-0.3544659, -0.398704, -2.034769, 1, 1, 1, 1, 1,
-0.352312, 0.6823601, -0.2272228, 1, 1, 1, 1, 1,
-0.3341144, -0.805271, -5.135299, 0, 0, 1, 1, 1,
-0.3326651, 0.8153889, -0.7988405, 1, 0, 0, 1, 1,
-0.3267415, 0.4599626, -0.4387158, 1, 0, 0, 1, 1,
-0.3262671, 0.2884555, -1.156677, 1, 0, 0, 1, 1,
-0.3254378, -0.8398914, -2.539069, 1, 0, 0, 1, 1,
-0.3228851, -0.1404173, -0.4044024, 1, 0, 0, 1, 1,
-0.3166769, -0.2182418, -2.078421, 0, 0, 0, 1, 1,
-0.3150403, 0.5096722, -1.10183, 0, 0, 0, 1, 1,
-0.3096329, -0.8714923, -2.970588, 0, 0, 0, 1, 1,
-0.3095662, 0.1907259, -0.6716532, 0, 0, 0, 1, 1,
-0.3059015, -0.7445219, -0.8018934, 0, 0, 0, 1, 1,
-0.3037215, -0.2297551, -1.754543, 0, 0, 0, 1, 1,
-0.3019143, -0.2170063, -3.063063, 0, 0, 0, 1, 1,
-0.2965806, -2.145445, -3.373345, 1, 1, 1, 1, 1,
-0.2957034, -0.9842309, -4.354657, 1, 1, 1, 1, 1,
-0.2933951, -0.6989264, -2.128209, 1, 1, 1, 1, 1,
-0.2925788, -0.6589674, -1.610794, 1, 1, 1, 1, 1,
-0.2833094, -0.4218179, -1.964429, 1, 1, 1, 1, 1,
-0.2823587, -0.9913467, -3.17557, 1, 1, 1, 1, 1,
-0.2809108, 0.1049415, -2.904915, 1, 1, 1, 1, 1,
-0.278138, -0.456331, -0.4671772, 1, 1, 1, 1, 1,
-0.2646677, -1.156817, -3.312243, 1, 1, 1, 1, 1,
-0.2621378, 1.29724, 0.1698337, 1, 1, 1, 1, 1,
-0.2605718, 0.2048668, -2.697538, 1, 1, 1, 1, 1,
-0.256194, 1.33301, -0.8019148, 1, 1, 1, 1, 1,
-0.2559653, 0.9640116, -1.238324, 1, 1, 1, 1, 1,
-0.252647, -0.461933, -3.250813, 1, 1, 1, 1, 1,
-0.2526444, 1.182557, -1.323009, 1, 1, 1, 1, 1,
-0.25202, -0.2717072, -2.04032, 0, 0, 1, 1, 1,
-0.247712, -0.01074967, -1.484834, 1, 0, 0, 1, 1,
-0.2471908, -0.8846234, -2.602951, 1, 0, 0, 1, 1,
-0.2413316, -0.4135678, -4.018723, 1, 0, 0, 1, 1,
-0.240722, 0.2156778, -0.4541427, 1, 0, 0, 1, 1,
-0.2401012, 0.3844662, -1.893091, 1, 0, 0, 1, 1,
-0.239799, -0.7029493, -3.77006, 0, 0, 0, 1, 1,
-0.2357179, -0.6660443, -1.436195, 0, 0, 0, 1, 1,
-0.2334625, -1.869068, -3.623707, 0, 0, 0, 1, 1,
-0.2320018, 1.857152, -1.282748, 0, 0, 0, 1, 1,
-0.2312572, 0.6386049, -0.03229851, 0, 0, 0, 1, 1,
-0.2307594, 1.006131, 0.6643986, 0, 0, 0, 1, 1,
-0.2287089, -0.8572993, -1.947674, 0, 0, 0, 1, 1,
-0.2263284, -1.16085, -1.645637, 1, 1, 1, 1, 1,
-0.2242072, -0.1603758, -1.085615, 1, 1, 1, 1, 1,
-0.2210718, 0.6778021, 0.1740445, 1, 1, 1, 1, 1,
-0.2189825, -0.7579608, -3.401569, 1, 1, 1, 1, 1,
-0.2144815, -0.9417266, -4.451015, 1, 1, 1, 1, 1,
-0.2123964, -0.1234888, -2.240676, 1, 1, 1, 1, 1,
-0.2091191, -1.232207, -1.962206, 1, 1, 1, 1, 1,
-0.202604, -0.4386758, -3.866446, 1, 1, 1, 1, 1,
-0.2024357, 1.017636, 1.642408, 1, 1, 1, 1, 1,
-0.2015962, 0.9328424, 1.27435, 1, 1, 1, 1, 1,
-0.2004464, 0.2300869, -0.5660774, 1, 1, 1, 1, 1,
-0.1983625, 0.9157712, -0.971655, 1, 1, 1, 1, 1,
-0.1976098, 1.865077, 0.8265277, 1, 1, 1, 1, 1,
-0.193498, -0.6805521, -2.330108, 1, 1, 1, 1, 1,
-0.1921514, -0.2912141, -2.609974, 1, 1, 1, 1, 1,
-0.1898888, -0.3767945, -2.134526, 0, 0, 1, 1, 1,
-0.1880346, 0.8222795, -0.9732248, 1, 0, 0, 1, 1,
-0.1876515, 0.3622026, 0.1676285, 1, 0, 0, 1, 1,
-0.1870761, -2.689149, -2.198506, 1, 0, 0, 1, 1,
-0.1858713, 0.1056129, -1.823669, 1, 0, 0, 1, 1,
-0.1841491, -0.1788554, -3.195528, 1, 0, 0, 1, 1,
-0.1733399, -2.100281, -1.227514, 0, 0, 0, 1, 1,
-0.166149, 0.2097873, -0.3396135, 0, 0, 0, 1, 1,
-0.1656455, 1.74342, -1.867598, 0, 0, 0, 1, 1,
-0.1640608, -0.4668829, -2.811416, 0, 0, 0, 1, 1,
-0.1580633, 0.4318843, 0.2139835, 0, 0, 0, 1, 1,
-0.1557864, -0.6812245, -3.885242, 0, 0, 0, 1, 1,
-0.1528853, -0.2862375, -1.887107, 0, 0, 0, 1, 1,
-0.1494367, -0.7752234, -2.941988, 1, 1, 1, 1, 1,
-0.1469291, 0.1902353, -0.8368006, 1, 1, 1, 1, 1,
-0.1445187, -1.349995, -4.607822, 1, 1, 1, 1, 1,
-0.142172, 0.6826592, 0.5213141, 1, 1, 1, 1, 1,
-0.1416037, -0.9829282, -3.589646, 1, 1, 1, 1, 1,
-0.1390401, 0.5247188, -1.471188, 1, 1, 1, 1, 1,
-0.1365169, 1.256578, 1.637183, 1, 1, 1, 1, 1,
-0.1357315, 0.03576977, -1.983341, 1, 1, 1, 1, 1,
-0.1326384, 0.2615288, -1.032049, 1, 1, 1, 1, 1,
-0.1299979, 0.0596722, -1.378848, 1, 1, 1, 1, 1,
-0.1288263, 1.510135, -2.124486, 1, 1, 1, 1, 1,
-0.1265208, 1.188834, -0.1227129, 1, 1, 1, 1, 1,
-0.1264344, -0.623946, -3.743475, 1, 1, 1, 1, 1,
-0.1256344, -1.310856, -2.06694, 1, 1, 1, 1, 1,
-0.1254164, 0.3747264, -2.173306, 1, 1, 1, 1, 1,
-0.1220809, -0.6515778, -4.729169, 0, 0, 1, 1, 1,
-0.1200633, 0.129349, 1.233933, 1, 0, 0, 1, 1,
-0.1171645, 1.52167, -0.4021122, 1, 0, 0, 1, 1,
-0.1158159, -1.943275, -3.483479, 1, 0, 0, 1, 1,
-0.1151497, 0.3647634, 0.7099868, 1, 0, 0, 1, 1,
-0.1122824, -1.667763, -1.835585, 1, 0, 0, 1, 1,
-0.1121687, 0.5756201, 0.5973687, 0, 0, 0, 1, 1,
-0.1118192, -0.1838201, -2.779799, 0, 0, 0, 1, 1,
-0.1093357, 1.174533, -0.01769014, 0, 0, 0, 1, 1,
-0.1055677, -0.4109251, -1.344697, 0, 0, 0, 1, 1,
-0.1052401, 1.367901, 0.1918842, 0, 0, 0, 1, 1,
-0.1024564, -0.2569663, -3.806279, 0, 0, 0, 1, 1,
-0.09739029, 1.297516, 0.4954076, 0, 0, 0, 1, 1,
-0.09625522, 0.1745631, -2.185227, 1, 1, 1, 1, 1,
-0.09611757, 0.06623717, -1.640631, 1, 1, 1, 1, 1,
-0.09410713, -2.331139, -3.13974, 1, 1, 1, 1, 1,
-0.0935594, 0.700467, -1.278815, 1, 1, 1, 1, 1,
-0.09201442, -2.093814, -2.354511, 1, 1, 1, 1, 1,
-0.0906096, -0.1684024, -4.957639, 1, 1, 1, 1, 1,
-0.0889053, 0.7019538, 0.4032643, 1, 1, 1, 1, 1,
-0.08714865, 0.2676109, -1.103851, 1, 1, 1, 1, 1,
-0.08028807, -1.130239, -2.508329, 1, 1, 1, 1, 1,
-0.07884856, 0.9797527, -1.52606, 1, 1, 1, 1, 1,
-0.07542145, 1.372024, 2.109157, 1, 1, 1, 1, 1,
-0.0707026, 1.895832, -1.800045, 1, 1, 1, 1, 1,
-0.06529488, -0.02977118, -2.566874, 1, 1, 1, 1, 1,
-0.05952637, 0.1384239, -1.160092, 1, 1, 1, 1, 1,
-0.05419898, 0.6451952, -1.241002, 1, 1, 1, 1, 1,
-0.05334531, 1.438194, 1.391094, 0, 0, 1, 1, 1,
-0.05070634, 1.769555, 0.009055369, 1, 0, 0, 1, 1,
-0.04725672, -0.09052011, -4.765279, 1, 0, 0, 1, 1,
-0.04723433, -1.865044, -2.143546, 1, 0, 0, 1, 1,
-0.04712223, -1.048802, -3.232321, 1, 0, 0, 1, 1,
-0.04261138, 1.353212, -0.216347, 1, 0, 0, 1, 1,
-0.03732489, 1.009409, 1.511058, 0, 0, 0, 1, 1,
-0.03113969, 1.415361, 1.564777, 0, 0, 0, 1, 1,
-0.02789888, -1.9699, -2.888183, 0, 0, 0, 1, 1,
-0.02654904, -0.5698625, -3.432146, 0, 0, 0, 1, 1,
-0.02611863, -0.677244, -3.32332, 0, 0, 0, 1, 1,
-0.02284268, -0.3568379, -4.50627, 0, 0, 0, 1, 1,
-0.02089051, 0.05266185, -0.5673041, 0, 0, 0, 1, 1,
-0.01983785, -1.115702, -3.035489, 1, 1, 1, 1, 1,
-0.01914928, 0.03589334, -1.073464, 1, 1, 1, 1, 1,
-0.01623537, -1.311778, -4.659208, 1, 1, 1, 1, 1,
-0.0160709, -1.000124, -3.517302, 1, 1, 1, 1, 1,
-0.01553782, 0.7553579, 0.07952874, 1, 1, 1, 1, 1,
-0.01538599, -0.3757581, -4.075047, 1, 1, 1, 1, 1,
-0.005834776, 0.5076397, -1.38445, 1, 1, 1, 1, 1,
-0.00303376, -1.700646, -3.708826, 1, 1, 1, 1, 1,
-0.000653876, 1.389454, -0.5461735, 1, 1, 1, 1, 1,
0.002523686, 2.320863, -0.6503494, 1, 1, 1, 1, 1,
0.004351997, -0.1223115, 3.724136, 1, 1, 1, 1, 1,
0.006291904, 0.03103592, -0.1217162, 1, 1, 1, 1, 1,
0.006728926, -0.6768967, 2.240701, 1, 1, 1, 1, 1,
0.01600932, 1.51038, 0.1233659, 1, 1, 1, 1, 1,
0.01674854, 0.642574, -0.1239391, 1, 1, 1, 1, 1,
0.02004794, 1.833359, 0.2430319, 0, 0, 1, 1, 1,
0.02386864, -0.40451, 2.10261, 1, 0, 0, 1, 1,
0.02409201, -2.330412, 3.421382, 1, 0, 0, 1, 1,
0.02779805, 1.031375, 0.6053334, 1, 0, 0, 1, 1,
0.02993145, 0.3163908, -0.1899566, 1, 0, 0, 1, 1,
0.03018249, -0.1740909, 2.808766, 1, 0, 0, 1, 1,
0.04204433, -1.363153, 3.022336, 0, 0, 0, 1, 1,
0.04216364, -0.8404493, 5.055609, 0, 0, 0, 1, 1,
0.04474091, 0.2308485, -0.4000776, 0, 0, 0, 1, 1,
0.04481866, -1.408285, 4.210217, 0, 0, 0, 1, 1,
0.05388803, -1.618972, 4.174665, 0, 0, 0, 1, 1,
0.05760525, 1.420312, -0.1953964, 0, 0, 0, 1, 1,
0.05854139, -1.668373, 1.849952, 0, 0, 0, 1, 1,
0.0586373, -1.42929, 2.666734, 1, 1, 1, 1, 1,
0.05880245, -0.6209682, 3.164495, 1, 1, 1, 1, 1,
0.05910071, -0.4840037, 2.634715, 1, 1, 1, 1, 1,
0.06040432, -0.3356525, 4.27916, 1, 1, 1, 1, 1,
0.0604835, -1.565389, 3.001698, 1, 1, 1, 1, 1,
0.06370821, 0.486258, 0.458158, 1, 1, 1, 1, 1,
0.06573771, 0.1323021, 0.7577247, 1, 1, 1, 1, 1,
0.06800422, 0.8797517, 0.4683605, 1, 1, 1, 1, 1,
0.07475729, -0.4740045, 2.952153, 1, 1, 1, 1, 1,
0.08489018, 1.46571, -0.4027614, 1, 1, 1, 1, 1,
0.08999826, -0.001023866, 1.541575, 1, 1, 1, 1, 1,
0.0962074, -0.05567803, 1.950647, 1, 1, 1, 1, 1,
0.09846281, 0.2189647, 0.8246009, 1, 1, 1, 1, 1,
0.1005752, -0.8428716, 5.43954, 1, 1, 1, 1, 1,
0.1080285, -0.3276639, 1.953008, 1, 1, 1, 1, 1,
0.1119695, 0.6965013, 0.3248047, 0, 0, 1, 1, 1,
0.1183243, -0.3815941, 0.9310735, 1, 0, 0, 1, 1,
0.1194556, -0.7900627, 3.940304, 1, 0, 0, 1, 1,
0.1237879, -1.695975, 4.26754, 1, 0, 0, 1, 1,
0.1263608, 0.1679557, -0.009284376, 1, 0, 0, 1, 1,
0.1264786, 1.334758, -1.957046, 1, 0, 0, 1, 1,
0.1299564, 0.9304355, -0.6205724, 0, 0, 0, 1, 1,
0.1313123, 0.2307576, 0.2582717, 0, 0, 0, 1, 1,
0.133182, 1.622499, 1.928516, 0, 0, 0, 1, 1,
0.134406, -1.828405, 2.160364, 0, 0, 0, 1, 1,
0.1350986, -0.1860605, 1.416617, 0, 0, 0, 1, 1,
0.1381044, -1.457472, 3.103019, 0, 0, 0, 1, 1,
0.1399391, -0.5371321, 2.102763, 0, 0, 0, 1, 1,
0.1405634, 1.488792, -1.254102, 1, 1, 1, 1, 1,
0.1421869, -0.1966311, 2.866317, 1, 1, 1, 1, 1,
0.1427165, 0.1349245, -0.3193306, 1, 1, 1, 1, 1,
0.1431398, 0.01199688, 2.022311, 1, 1, 1, 1, 1,
0.1438604, 0.08610043, 1.050948, 1, 1, 1, 1, 1,
0.144744, -0.3528932, 1.9993, 1, 1, 1, 1, 1,
0.1461912, 0.1232292, -0.340293, 1, 1, 1, 1, 1,
0.1542083, -0.5370232, 3.270115, 1, 1, 1, 1, 1,
0.1554155, 0.6201692, 0.5871038, 1, 1, 1, 1, 1,
0.1587814, -0.1568738, 1.95086, 1, 1, 1, 1, 1,
0.159037, 0.5641206, 0.2785321, 1, 1, 1, 1, 1,
0.1593549, 0.6129555, 1.859072, 1, 1, 1, 1, 1,
0.161693, 1.165921, 0.3763197, 1, 1, 1, 1, 1,
0.1635112, 0.5557593, 0.2334154, 1, 1, 1, 1, 1,
0.1651059, -1.072292, 3.933553, 1, 1, 1, 1, 1,
0.1659822, -0.2541833, 2.289294, 0, 0, 1, 1, 1,
0.1665833, 0.2003642, 0.6023989, 1, 0, 0, 1, 1,
0.1701529, 1.549078, 1.737262, 1, 0, 0, 1, 1,
0.171428, -0.3838735, 2.495531, 1, 0, 0, 1, 1,
0.1743456, 1.251641, 0.231101, 1, 0, 0, 1, 1,
0.1747539, -0.9497425, 4.40596, 1, 0, 0, 1, 1,
0.1770603, 0.682376, -0.285947, 0, 0, 0, 1, 1,
0.177723, -1.187988, 3.323539, 0, 0, 0, 1, 1,
0.1799765, -0.7470276, 3.694109, 0, 0, 0, 1, 1,
0.1841371, -0.3453889, 3.140593, 0, 0, 0, 1, 1,
0.1863253, 0.4242907, -0.5550106, 0, 0, 0, 1, 1,
0.1886728, 0.5050647, 0.7427592, 0, 0, 0, 1, 1,
0.1904096, 0.896556, 0.01450993, 0, 0, 0, 1, 1,
0.1909007, -0.6868808, 4.797333, 1, 1, 1, 1, 1,
0.1948108, -1.160594, 3.645045, 1, 1, 1, 1, 1,
0.1950734, 1.08433, 0.001758082, 1, 1, 1, 1, 1,
0.1952219, 0.003747519, 1.067732, 1, 1, 1, 1, 1,
0.2043289, 1.511655, -1.24347, 1, 1, 1, 1, 1,
0.2069192, -0.4847471, 4.067585, 1, 1, 1, 1, 1,
0.2076441, 0.06740185, 0.2973325, 1, 1, 1, 1, 1,
0.2083347, -0.9726866, 2.132488, 1, 1, 1, 1, 1,
0.2129071, -1.389482, 2.477788, 1, 1, 1, 1, 1,
0.2136924, -0.3392787, 2.655735, 1, 1, 1, 1, 1,
0.2158721, 0.5145383, 2.868899, 1, 1, 1, 1, 1,
0.2187769, -0.6066818, 3.322337, 1, 1, 1, 1, 1,
0.2219881, -0.9353849, 3.464484, 1, 1, 1, 1, 1,
0.2269609, 3.21905, -1.791347, 1, 1, 1, 1, 1,
0.2315077, -0.6445695, 2.818358, 1, 1, 1, 1, 1,
0.234437, 1.134353, 0.01486017, 0, 0, 1, 1, 1,
0.2344851, -0.7327706, 0.6049702, 1, 0, 0, 1, 1,
0.2362657, -0.1238777, 0.9171623, 1, 0, 0, 1, 1,
0.2366078, 0.5358093, 2.045841, 1, 0, 0, 1, 1,
0.2384021, 0.2118142, 1.429163, 1, 0, 0, 1, 1,
0.2400154, -0.1078271, 1.328885, 1, 0, 0, 1, 1,
0.2423809, -0.3906021, 1.33421, 0, 0, 0, 1, 1,
0.2435717, -0.05659854, 1.295564, 0, 0, 0, 1, 1,
0.2437915, -0.6363171, 3.21632, 0, 0, 0, 1, 1,
0.2449114, 0.4615801, 0.6519181, 0, 0, 0, 1, 1,
0.2458516, 0.2658354, 0.4040523, 0, 0, 0, 1, 1,
0.2485414, 1.181934, -0.2137651, 0, 0, 0, 1, 1,
0.2491593, 0.04989116, 2.007671, 0, 0, 0, 1, 1,
0.2514663, 0.4707051, 0.4236921, 1, 1, 1, 1, 1,
0.2533219, -2.116061, 4.98566, 1, 1, 1, 1, 1,
0.2565224, 0.1260402, 2.801466, 1, 1, 1, 1, 1,
0.2569542, 0.07974868, 0.9472093, 1, 1, 1, 1, 1,
0.2612929, -2.368507, 2.564482, 1, 1, 1, 1, 1,
0.262058, -1.290009, 3.569802, 1, 1, 1, 1, 1,
0.2621275, 0.09936613, 2.047819, 1, 1, 1, 1, 1,
0.2742087, 2.188236, -0.4017501, 1, 1, 1, 1, 1,
0.2750895, -0.216686, 0.6849659, 1, 1, 1, 1, 1,
0.2759179, -0.4254385, 1.230513, 1, 1, 1, 1, 1,
0.2791624, 0.8484002, -0.01735771, 1, 1, 1, 1, 1,
0.2803326, -0.5798642, 4.094705, 1, 1, 1, 1, 1,
0.2812699, -1.550815, 2.398569, 1, 1, 1, 1, 1,
0.2823736, 0.7874897, 1.347988, 1, 1, 1, 1, 1,
0.2845867, 1.151277, 1.344619, 1, 1, 1, 1, 1,
0.2875848, -0.5092632, 0.8454164, 0, 0, 1, 1, 1,
0.289458, 0.5286106, 0.1977493, 1, 0, 0, 1, 1,
0.2896804, -1.116954, 1.524139, 1, 0, 0, 1, 1,
0.2938724, 0.9769378, 0.1075191, 1, 0, 0, 1, 1,
0.2965458, 0.2241907, -0.4934444, 1, 0, 0, 1, 1,
0.2983009, -0.2044492, 0.3759589, 1, 0, 0, 1, 1,
0.3001848, 0.2949404, 2.298896, 0, 0, 0, 1, 1,
0.3014536, 0.143816, 2.142555, 0, 0, 0, 1, 1,
0.3024964, -0.2651609, 3.630622, 0, 0, 0, 1, 1,
0.3040663, 0.7696989, 1.154223, 0, 0, 0, 1, 1,
0.3056048, -0.2867721, 0.02946731, 0, 0, 0, 1, 1,
0.3081221, 0.2142464, -0.7972834, 0, 0, 0, 1, 1,
0.3096156, 0.1205438, 0.8550248, 0, 0, 0, 1, 1,
0.3200549, 1.843931, 1.950365, 1, 1, 1, 1, 1,
0.3206322, -0.5154197, 1.886672, 1, 1, 1, 1, 1,
0.3217963, 1.61241, 0.1199013, 1, 1, 1, 1, 1,
0.3231497, -1.188483, 4.289282, 1, 1, 1, 1, 1,
0.3238657, 1.796456, 0.9301673, 1, 1, 1, 1, 1,
0.3250576, 0.5517513, 1.57029, 1, 1, 1, 1, 1,
0.3275927, -0.08416488, 1.581929, 1, 1, 1, 1, 1,
0.3289165, 0.2496867, 0.1043366, 1, 1, 1, 1, 1,
0.329913, -1.933589, 2.446262, 1, 1, 1, 1, 1,
0.3319554, -0.4345532, 2.872421, 1, 1, 1, 1, 1,
0.3347066, 0.9444129, 1.219035, 1, 1, 1, 1, 1,
0.3371065, 0.6998143, 0.7002907, 1, 1, 1, 1, 1,
0.3434182, -0.5098883, 2.307555, 1, 1, 1, 1, 1,
0.3515464, 2.011484, 0.2741584, 1, 1, 1, 1, 1,
0.357633, -0.02827857, 2.799442, 1, 1, 1, 1, 1,
0.360088, 0.1242912, 0.1859253, 0, 0, 1, 1, 1,
0.3611603, 1.167448, 0.5924733, 1, 0, 0, 1, 1,
0.361445, -0.1398795, 1.83773, 1, 0, 0, 1, 1,
0.3618001, 0.1810626, 0.2230083, 1, 0, 0, 1, 1,
0.3622245, -0.2679943, 2.365886, 1, 0, 0, 1, 1,
0.363796, -1.120466, 3.699364, 1, 0, 0, 1, 1,
0.3646034, -0.8347628, 0.7991726, 0, 0, 0, 1, 1,
0.3654559, -0.5152159, 2.207703, 0, 0, 0, 1, 1,
0.3661103, -0.287592, 3.73221, 0, 0, 0, 1, 1,
0.368282, -0.6970726, 3.408588, 0, 0, 0, 1, 1,
0.3685949, -0.7105212, 2.814328, 0, 0, 0, 1, 1,
0.369632, -0.8486688, -0.201985, 0, 0, 0, 1, 1,
0.3719411, -1.438805, 2.787586, 0, 0, 0, 1, 1,
0.3730147, 0.707642, -0.736392, 1, 1, 1, 1, 1,
0.3731745, 2.409416, -0.05878757, 1, 1, 1, 1, 1,
0.3748139, 1.33111, -0.7713703, 1, 1, 1, 1, 1,
0.3753671, -0.1260081, 2.692364, 1, 1, 1, 1, 1,
0.376141, -0.8148297, 2.363265, 1, 1, 1, 1, 1,
0.3767128, -0.2495042, 1.226565, 1, 1, 1, 1, 1,
0.3775222, 0.422204, 0.8842767, 1, 1, 1, 1, 1,
0.3784693, -0.3384725, 2.745532, 1, 1, 1, 1, 1,
0.3786371, 0.2806028, 0.8648311, 1, 1, 1, 1, 1,
0.3788696, -1.086994, 0.3133062, 1, 1, 1, 1, 1,
0.3802446, -0.01325884, 1.543959, 1, 1, 1, 1, 1,
0.3810052, 0.9118757, 2.262917, 1, 1, 1, 1, 1,
0.3842981, -0.8124614, 2.311898, 1, 1, 1, 1, 1,
0.3859418, -1.17925, 2.412038, 1, 1, 1, 1, 1,
0.3899676, -0.5656688, 2.130045, 1, 1, 1, 1, 1,
0.3913311, 0.3082895, 1.279207, 0, 0, 1, 1, 1,
0.3919542, 1.090963, 0.927864, 1, 0, 0, 1, 1,
0.3926284, -0.8370851, 0.2838757, 1, 0, 0, 1, 1,
0.3957744, 1.325298, 0.5634513, 1, 0, 0, 1, 1,
0.3964908, 0.5075702, 0.899687, 1, 0, 0, 1, 1,
0.3973764, -0.1288757, 2.548969, 1, 0, 0, 1, 1,
0.3980709, 0.9755831, 0.6542367, 0, 0, 0, 1, 1,
0.3995027, 0.02571735, 0.1002812, 0, 0, 0, 1, 1,
0.3995603, -1.199962, 3.158101, 0, 0, 0, 1, 1,
0.4031362, -0.6267374, 1.291579, 0, 0, 0, 1, 1,
0.4055537, 0.3034768, 0.2605099, 0, 0, 0, 1, 1,
0.4062469, 0.9772066, 0.8753263, 0, 0, 0, 1, 1,
0.4094974, -0.742308, 2.729603, 0, 0, 0, 1, 1,
0.4117551, -0.8288978, 1.29465, 1, 1, 1, 1, 1,
0.4165385, -0.1107949, 0.9894694, 1, 1, 1, 1, 1,
0.4187368, -0.3801368, 3.915286, 1, 1, 1, 1, 1,
0.4202439, -0.8739081, 1.077692, 1, 1, 1, 1, 1,
0.4207954, -0.07197972, 2.804936, 1, 1, 1, 1, 1,
0.4270287, -0.6339942, 1.961323, 1, 1, 1, 1, 1,
0.4284653, -0.3299157, -0.1808066, 1, 1, 1, 1, 1,
0.4294722, -0.892548, 3.003262, 1, 1, 1, 1, 1,
0.4316838, -1.831741, 2.128054, 1, 1, 1, 1, 1,
0.4344636, -1.187336, 2.198807, 1, 1, 1, 1, 1,
0.4352142, 1.032931, -1.547825, 1, 1, 1, 1, 1,
0.4356241, -0.4287326, 2.736511, 1, 1, 1, 1, 1,
0.4376467, 1.457799, 1.515063, 1, 1, 1, 1, 1,
0.4436727, -1.655626, 3.721574, 1, 1, 1, 1, 1,
0.4459836, -0.3543904, 0.5715535, 1, 1, 1, 1, 1,
0.4487176, -0.4814398, 2.354817, 0, 0, 1, 1, 1,
0.4635185, 1.061244, 0.8729785, 1, 0, 0, 1, 1,
0.4637365, 0.505943, 1.181588, 1, 0, 0, 1, 1,
0.4661024, 1.304717, 1.53222, 1, 0, 0, 1, 1,
0.4668345, 0.7500729, 0.01199476, 1, 0, 0, 1, 1,
0.4718356, 0.757411, 0.8280227, 1, 0, 0, 1, 1,
0.4727751, 0.5293586, 0.3682725, 0, 0, 0, 1, 1,
0.4738694, -1.394251, 1.746568, 0, 0, 0, 1, 1,
0.475083, 0.5820778, 0.9457778, 0, 0, 0, 1, 1,
0.4787753, 1.761319, -1.375687, 0, 0, 0, 1, 1,
0.4816659, -2.067588, 4.277275, 0, 0, 0, 1, 1,
0.4848773, 1.030415, 1.445507, 0, 0, 0, 1, 1,
0.488026, 0.4675549, 1.612363, 0, 0, 0, 1, 1,
0.489436, -0.2763122, 1.85258, 1, 1, 1, 1, 1,
0.4897883, 0.004765963, 2.729865, 1, 1, 1, 1, 1,
0.4924675, 0.2306839, 1.455155, 1, 1, 1, 1, 1,
0.494518, 0.6028337, 0.8587502, 1, 1, 1, 1, 1,
0.4971036, 0.9158348, -1.663993, 1, 1, 1, 1, 1,
0.4974034, 0.84762, 1.371414, 1, 1, 1, 1, 1,
0.499047, 0.4363863, -0.3609793, 1, 1, 1, 1, 1,
0.501845, -0.7444244, 1.557687, 1, 1, 1, 1, 1,
0.5074748, -0.06724627, 0.1345246, 1, 1, 1, 1, 1,
0.5090795, 1.175372, -0.2274385, 1, 1, 1, 1, 1,
0.51341, 0.2534024, 1.615623, 1, 1, 1, 1, 1,
0.5142729, -1.392854, 1.523965, 1, 1, 1, 1, 1,
0.5166873, -1.019836, 1.243886, 1, 1, 1, 1, 1,
0.5221866, 0.1583334, 1.375965, 1, 1, 1, 1, 1,
0.5291467, -1.31084, 1.814682, 1, 1, 1, 1, 1,
0.5294542, 0.3720675, 2.58497, 0, 0, 1, 1, 1,
0.5342512, -0.4729523, 1.97563, 1, 0, 0, 1, 1,
0.5381032, 0.08730554, 1.631104, 1, 0, 0, 1, 1,
0.5412863, -0.2393609, 1.652731, 1, 0, 0, 1, 1,
0.5415925, 0.08042327, 1.658155, 1, 0, 0, 1, 1,
0.5417686, 0.6133372, 0.7726343, 1, 0, 0, 1, 1,
0.5470129, -0.2891769, 3.08752, 0, 0, 0, 1, 1,
0.5474265, -0.3848766, 3.314771, 0, 0, 0, 1, 1,
0.5482596, -0.3423573, 1.998546, 0, 0, 0, 1, 1,
0.5502767, -0.06108328, 0.5371913, 0, 0, 0, 1, 1,
0.5539917, 0.2237204, -0.08330836, 0, 0, 0, 1, 1,
0.5561612, 0.8834574, -1.339902, 0, 0, 0, 1, 1,
0.5575072, -0.6105281, 1.394939, 0, 0, 0, 1, 1,
0.5645009, -0.6772821, 3.065057, 1, 1, 1, 1, 1,
0.5669907, -0.615553, 3.326906, 1, 1, 1, 1, 1,
0.5709866, 0.5913053, 1.192613, 1, 1, 1, 1, 1,
0.5717177, -0.9663048, 3.523308, 1, 1, 1, 1, 1,
0.5780808, -0.06689178, 0.9450445, 1, 1, 1, 1, 1,
0.5841966, 0.01356886, 2.21066, 1, 1, 1, 1, 1,
0.585844, -1.395925, 2.379364, 1, 1, 1, 1, 1,
0.5890222, 0.3892834, 1.077985, 1, 1, 1, 1, 1,
0.5910712, -0.5739415, 3.348258, 1, 1, 1, 1, 1,
0.5917997, 1.513052, 0.1033647, 1, 1, 1, 1, 1,
0.5921875, -2.130515, 4.267313, 1, 1, 1, 1, 1,
0.5924171, 0.07556213, 2.168051, 1, 1, 1, 1, 1,
0.6014752, 1.055986, 0.08467537, 1, 1, 1, 1, 1,
0.6021011, -0.1296151, 2.135796, 1, 1, 1, 1, 1,
0.6031311, -0.04292351, 0.775548, 1, 1, 1, 1, 1,
0.604504, -0.5302352, 1.751429, 0, 0, 1, 1, 1,
0.6139112, 0.7997681, 0.8572773, 1, 0, 0, 1, 1,
0.6141267, 0.210281, 0.4652842, 1, 0, 0, 1, 1,
0.6149208, -0.6067182, 0.504853, 1, 0, 0, 1, 1,
0.6187692, -1.463549, 2.667385, 1, 0, 0, 1, 1,
0.6246436, 0.3820868, 2.84282, 1, 0, 0, 1, 1,
0.6256901, -0.3411242, 2.304124, 0, 0, 0, 1, 1,
0.6294243, -0.7039562, 1.711065, 0, 0, 0, 1, 1,
0.6385261, -0.5593589, 2.500804, 0, 0, 0, 1, 1,
0.6405059, 0.3642522, 1.394077, 0, 0, 0, 1, 1,
0.6440747, 0.5057644, -0.1446898, 0, 0, 0, 1, 1,
0.6528327, -0.2237792, 1.852653, 0, 0, 0, 1, 1,
0.6555198, 1.125301, 1.083317, 0, 0, 0, 1, 1,
0.6575543, -1.41561, 1.460099, 1, 1, 1, 1, 1,
0.6644138, 0.1443815, 1.536544, 1, 1, 1, 1, 1,
0.6644295, 1.343398, 1.830464, 1, 1, 1, 1, 1,
0.6705018, -0.6072654, 2.497871, 1, 1, 1, 1, 1,
0.6706239, 2.430595, 0.6924962, 1, 1, 1, 1, 1,
0.6710234, -0.2703154, 2.112809, 1, 1, 1, 1, 1,
0.6811706, -1.748884, 4.667567, 1, 1, 1, 1, 1,
0.682729, 2.049947, -0.4826973, 1, 1, 1, 1, 1,
0.6866069, -0.0780199, 1.717802, 1, 1, 1, 1, 1,
0.6899517, -1.727221, 4.548286, 1, 1, 1, 1, 1,
0.6904829, 0.2467521, 1.950474, 1, 1, 1, 1, 1,
0.6914402, -0.9428684, 4.257776, 1, 1, 1, 1, 1,
0.7060876, 0.003518443, 3.091981, 1, 1, 1, 1, 1,
0.7087898, -0.1023151, 1.912247, 1, 1, 1, 1, 1,
0.7183247, -1.037755, 3.852989, 1, 1, 1, 1, 1,
0.7261611, 0.003924537, 0.5011266, 0, 0, 1, 1, 1,
0.7300048, 0.1422731, 1.322526, 1, 0, 0, 1, 1,
0.7314942, 0.6659719, 1.078073, 1, 0, 0, 1, 1,
0.7361125, -0.1976821, 1.71243, 1, 0, 0, 1, 1,
0.7385103, 1.489565, 1.597382, 1, 0, 0, 1, 1,
0.7394239, -0.02086891, 0.914436, 1, 0, 0, 1, 1,
0.7441108, -1.767733, 3.421001, 0, 0, 0, 1, 1,
0.7442669, -0.7785373, 1.260029, 0, 0, 0, 1, 1,
0.7493507, -1.202297, 3.487808, 0, 0, 0, 1, 1,
0.757645, 0.4661657, 0.4331346, 0, 0, 0, 1, 1,
0.7677367, 1.384349, -0.7809047, 0, 0, 0, 1, 1,
0.7692536, 0.8156029, 0.7070937, 0, 0, 0, 1, 1,
0.772539, -0.5776367, 2.101057, 0, 0, 0, 1, 1,
0.7726835, 1.147243, 1.875694, 1, 1, 1, 1, 1,
0.7773624, -0.138701, 2.085943, 1, 1, 1, 1, 1,
0.783475, 0.2442155, 2.517415, 1, 1, 1, 1, 1,
0.7913951, -0.4485992, 2.797496, 1, 1, 1, 1, 1,
0.7925731, 0.05676726, -0.160668, 1, 1, 1, 1, 1,
0.7928675, 0.5532815, 1.654556, 1, 1, 1, 1, 1,
0.7947942, -2.143478, 4.026923, 1, 1, 1, 1, 1,
0.7980131, 0.3049631, 2.501076, 1, 1, 1, 1, 1,
0.800086, 1.388622, 1.197985, 1, 1, 1, 1, 1,
0.8044124, 0.07065582, 0.6416383, 1, 1, 1, 1, 1,
0.8055056, 1.50666, -0.3745473, 1, 1, 1, 1, 1,
0.8063303, 0.7935762, 1.856389, 1, 1, 1, 1, 1,
0.8078895, 0.009199081, 3.074366, 1, 1, 1, 1, 1,
0.8153962, 0.1330548, 2.875685, 1, 1, 1, 1, 1,
0.8165924, 0.1411065, 2.705297, 1, 1, 1, 1, 1,
0.8205831, -0.5699944, 3.677396, 0, 0, 1, 1, 1,
0.8231804, -0.07171109, 0.4521237, 1, 0, 0, 1, 1,
0.8249047, -0.07478903, 0.7477369, 1, 0, 0, 1, 1,
0.8267542, 0.3725399, 0.5713438, 1, 0, 0, 1, 1,
0.8312128, -0.553872, 1.444142, 1, 0, 0, 1, 1,
0.8328274, -2.241495, 3.924451, 1, 0, 0, 1, 1,
0.8369603, 0.3088632, 0.6163138, 0, 0, 0, 1, 1,
0.8434703, 0.3389058, 1.163271, 0, 0, 0, 1, 1,
0.8470979, 0.2902852, 1.115337, 0, 0, 0, 1, 1,
0.8509368, -0.3610074, 1.438661, 0, 0, 0, 1, 1,
0.854525, -0.8078755, 3.239772, 0, 0, 0, 1, 1,
0.8631618, -1.164894, 1.720464, 0, 0, 0, 1, 1,
0.8652271, -1.57383, 4.79231, 0, 0, 0, 1, 1,
0.8719655, 1.02262, 0.6983758, 1, 1, 1, 1, 1,
0.8737227, -2.633307, 2.888443, 1, 1, 1, 1, 1,
0.8740593, 0.5612451, 0.8024126, 1, 1, 1, 1, 1,
0.8788233, 1.101916, 0.4599296, 1, 1, 1, 1, 1,
0.8793107, 1.460781, 0.2780288, 1, 1, 1, 1, 1,
0.8843024, -0.5903026, 1.689323, 1, 1, 1, 1, 1,
0.8871694, 0.3301027, 0.2616039, 1, 1, 1, 1, 1,
0.8872281, 0.06514529, 3.258453, 1, 1, 1, 1, 1,
0.8893267, 0.05837664, 2.933918, 1, 1, 1, 1, 1,
0.8919153, -1.098283, 2.134912, 1, 1, 1, 1, 1,
0.8966026, -0.3319675, 2.768454, 1, 1, 1, 1, 1,
0.9023704, -0.5707023, 2.442203, 1, 1, 1, 1, 1,
0.9051226, -0.1704964, 2.727498, 1, 1, 1, 1, 1,
0.9092641, -0.06401695, 1.714539, 1, 1, 1, 1, 1,
0.9092996, -0.5023274, 0.9719211, 1, 1, 1, 1, 1,
0.9166624, -0.4005424, 2.664057, 0, 0, 1, 1, 1,
0.9192005, -0.579281, 2.754447, 1, 0, 0, 1, 1,
0.9192094, 1.515031, 1.004773, 1, 0, 0, 1, 1,
0.920218, 0.0921596, 2.860544, 1, 0, 0, 1, 1,
0.9317591, -1.320244, 2.333311, 1, 0, 0, 1, 1,
0.9321964, -2.375181, 5.368291, 1, 0, 0, 1, 1,
0.9329908, -2.176925, 2.895585, 0, 0, 0, 1, 1,
0.9349533, 1.114924, 1.889644, 0, 0, 0, 1, 1,
0.9359114, 0.2208025, 0.2272807, 0, 0, 0, 1, 1,
0.936492, -0.02873859, 1.479293, 0, 0, 0, 1, 1,
0.9367688, -0.6499199, 1.142933, 0, 0, 0, 1, 1,
0.9388891, 0.8069133, -0.1471099, 0, 0, 0, 1, 1,
0.939938, -0.4722414, 1.252292, 0, 0, 0, 1, 1,
0.9408579, 1.716459, 1.181389, 1, 1, 1, 1, 1,
0.9430608, -1.183639, 4.011946, 1, 1, 1, 1, 1,
0.9508191, -0.306779, 2.334386, 1, 1, 1, 1, 1,
0.9535814, -0.4246361, 1.943508, 1, 1, 1, 1, 1,
0.9546213, -0.2242521, 3.00729, 1, 1, 1, 1, 1,
0.9608995, -0.3196819, 1.992214, 1, 1, 1, 1, 1,
0.9635308, -0.4514399, 2.609644, 1, 1, 1, 1, 1,
0.9659585, -0.2240074, 1.078126, 1, 1, 1, 1, 1,
0.9751074, 0.8179092, 0.5153338, 1, 1, 1, 1, 1,
0.9846723, 2.475827, -0.2770381, 1, 1, 1, 1, 1,
0.996091, -0.2776907, 0.6551012, 1, 1, 1, 1, 1,
0.9982905, -0.9598374, 2.184017, 1, 1, 1, 1, 1,
1.004101, -1.453704, 2.818364, 1, 1, 1, 1, 1,
1.005158, -0.5314165, 2.149971, 1, 1, 1, 1, 1,
1.019271, -0.03956758, 1.279209, 1, 1, 1, 1, 1,
1.031087, -1.101646, 3.801883, 0, 0, 1, 1, 1,
1.034854, 1.395902, 0.6520295, 1, 0, 0, 1, 1,
1.036313, 0.9499832, -0.7382019, 1, 0, 0, 1, 1,
1.046205, 0.2093461, 1.68272, 1, 0, 0, 1, 1,
1.053236, 0.4101044, 1.714761, 1, 0, 0, 1, 1,
1.060123, 1.322544, 0.7306195, 1, 0, 0, 1, 1,
1.067493, 0.5174409, 1.721807, 0, 0, 0, 1, 1,
1.06884, 0.04430868, 2.98012, 0, 0, 0, 1, 1,
1.07305, -0.1645092, 2.52332, 0, 0, 0, 1, 1,
1.076995, -1.563335, 2.046469, 0, 0, 0, 1, 1,
1.08818, -0.4659706, 0.3706454, 0, 0, 0, 1, 1,
1.091653, -0.8058554, 0.6055694, 0, 0, 0, 1, 1,
1.114665, 0.7292569, -0.204039, 0, 0, 0, 1, 1,
1.114668, -0.3991911, 0.783792, 1, 1, 1, 1, 1,
1.118013, -0.1741932, 1.583818, 1, 1, 1, 1, 1,
1.121527, -0.8258715, 2.980975, 1, 1, 1, 1, 1,
1.125016, -0.3709982, 2.548006, 1, 1, 1, 1, 1,
1.135969, -2.898108, 2.1587, 1, 1, 1, 1, 1,
1.138109, -0.2813272, 2.402268, 1, 1, 1, 1, 1,
1.148856, 0.7160796, 1.489255, 1, 1, 1, 1, 1,
1.159548, 0.2219038, 2.335182, 1, 1, 1, 1, 1,
1.162083, -1.609153, 2.970557, 1, 1, 1, 1, 1,
1.165715, -0.3353907, 2.480717, 1, 1, 1, 1, 1,
1.17711, -1.886526, 0.8642976, 1, 1, 1, 1, 1,
1.185067, -0.2738283, 0.2542064, 1, 1, 1, 1, 1,
1.185504, 0.1061561, 0.3879404, 1, 1, 1, 1, 1,
1.187292, 0.3925368, 1.077334, 1, 1, 1, 1, 1,
1.197397, 0.4261647, 1.360115, 1, 1, 1, 1, 1,
1.19875, 0.4575963, 0.962867, 0, 0, 1, 1, 1,
1.209106, 0.04812027, 3.329494, 1, 0, 0, 1, 1,
1.213382, -1.176608, 2.379227, 1, 0, 0, 1, 1,
1.21901, 2.176686, -0.7253771, 1, 0, 0, 1, 1,
1.219327, 0.6479776, 0.3432756, 1, 0, 0, 1, 1,
1.221308, 0.8676002, -0.3324756, 1, 0, 0, 1, 1,
1.228222, -0.5690272, 2.02171, 0, 0, 0, 1, 1,
1.235013, -0.7649401, 1.720778, 0, 0, 0, 1, 1,
1.235776, -0.6446351, 0.9541624, 0, 0, 0, 1, 1,
1.253971, -1.641442, 3.004267, 0, 0, 0, 1, 1,
1.256703, 1.306851, 1.539112, 0, 0, 0, 1, 1,
1.265217, -2.116053, 2.328394, 0, 0, 0, 1, 1,
1.266436, 1.823707, 1.085552, 0, 0, 0, 1, 1,
1.26662, 1.346816, 1.876901, 1, 1, 1, 1, 1,
1.28354, 0.0498906, 2.007622, 1, 1, 1, 1, 1,
1.286556, -1.370289, 4.048223, 1, 1, 1, 1, 1,
1.290055, 0.27176, 1.044793, 1, 1, 1, 1, 1,
1.293671, 0.8669186, -0.3967116, 1, 1, 1, 1, 1,
1.297822, 1.303588, 0.2886056, 1, 1, 1, 1, 1,
1.305661, -1.01361, 2.068658, 1, 1, 1, 1, 1,
1.309732, 1.531849, -0.5443057, 1, 1, 1, 1, 1,
1.31529, -0.06095294, 2.207567, 1, 1, 1, 1, 1,
1.35729, -0.2444281, 0.262095, 1, 1, 1, 1, 1,
1.359998, 0.4488079, 1.730489, 1, 1, 1, 1, 1,
1.375905, 2.029075, 0.403893, 1, 1, 1, 1, 1,
1.381671, 0.4621374, 0.4145809, 1, 1, 1, 1, 1,
1.384083, -0.6369439, 0.9750515, 1, 1, 1, 1, 1,
1.385764, -0.6832089, 2.997226, 1, 1, 1, 1, 1,
1.40002, -0.378032, 2.720081, 0, 0, 1, 1, 1,
1.402271, -0.7579411, 0.444737, 1, 0, 0, 1, 1,
1.406273, 0.3025781, 2.84239, 1, 0, 0, 1, 1,
1.41163, -0.8742351, 2.27331, 1, 0, 0, 1, 1,
1.423444, -0.5792241, 2.208423, 1, 0, 0, 1, 1,
1.42441, 0.9448915, 2.069918, 1, 0, 0, 1, 1,
1.427454, -1.090241, 2.960876, 0, 0, 0, 1, 1,
1.42874, 0.1366362, -0.1098839, 0, 0, 0, 1, 1,
1.43156, 0.2952557, 0.9132752, 0, 0, 0, 1, 1,
1.436104, -2.667218, 1.538935, 0, 0, 0, 1, 1,
1.437137, 1.998121, 0.3308351, 0, 0, 0, 1, 1,
1.438097, -0.4371462, 0.2075916, 0, 0, 0, 1, 1,
1.451478, -0.1373414, 1.70297, 0, 0, 0, 1, 1,
1.452172, 0.6050864, 1.323227, 1, 1, 1, 1, 1,
1.454642, -1.528305, 2.079252, 1, 1, 1, 1, 1,
1.47918, 0.512247, 1.919398, 1, 1, 1, 1, 1,
1.481684, -0.8997051, 1.161698, 1, 1, 1, 1, 1,
1.483215, -0.9203965, -0.4243472, 1, 1, 1, 1, 1,
1.491489, 1.93239, -0.1210758, 1, 1, 1, 1, 1,
1.495873, 0.2054089, 2.201802, 1, 1, 1, 1, 1,
1.498473, 0.2849796, 0.01571927, 1, 1, 1, 1, 1,
1.547555, -0.2756607, 2.015562, 1, 1, 1, 1, 1,
1.555856, 1.470233, 0.2289314, 1, 1, 1, 1, 1,
1.562927, 0.1997718, 0.5510859, 1, 1, 1, 1, 1,
1.563254, -0.6397786, 2.483495, 1, 1, 1, 1, 1,
1.565911, 1.210053, 1.138038, 1, 1, 1, 1, 1,
1.580597, 0.3079454, 1.542271, 1, 1, 1, 1, 1,
1.611371, 1.705762, -0.4816399, 1, 1, 1, 1, 1,
1.619376, 0.3606914, 3.097486, 0, 0, 1, 1, 1,
1.631365, 0.2755494, 1.220784, 1, 0, 0, 1, 1,
1.636824, 1.440066, -0.1587726, 1, 0, 0, 1, 1,
1.650986, -0.5739586, 1.623339, 1, 0, 0, 1, 1,
1.660454, -0.9166347, 2.330231, 1, 0, 0, 1, 1,
1.661437, 1.790721, 0.8933993, 1, 0, 0, 1, 1,
1.66466, -0.1824182, 0.1256142, 0, 0, 0, 1, 1,
1.672505, -0.1185376, 2.38427, 0, 0, 0, 1, 1,
1.681161, -0.009853806, 0.3257242, 0, 0, 0, 1, 1,
1.70952, 0.3284332, 2.37146, 0, 0, 0, 1, 1,
1.719332, 0.004987146, 1.760268, 0, 0, 0, 1, 1,
1.724294, 1.886924, 0.2631634, 0, 0, 0, 1, 1,
1.730922, -1.465606, 3.296921, 0, 0, 0, 1, 1,
1.734837, -0.08331138, 1.383422, 1, 1, 1, 1, 1,
1.748744, 0.6390172, 2.85406, 1, 1, 1, 1, 1,
1.752675, -0.2171055, 2.40644, 1, 1, 1, 1, 1,
1.762985, 0.8939052, 2.165892, 1, 1, 1, 1, 1,
1.763793, -0.439746, 1.451326, 1, 1, 1, 1, 1,
1.766604, 1.305407, 2.402719, 1, 1, 1, 1, 1,
1.839072, 0.4572467, 1.046931, 1, 1, 1, 1, 1,
1.848615, -0.4890346, 2.872377, 1, 1, 1, 1, 1,
1.857232, -1.194333, 1.971847, 1, 1, 1, 1, 1,
1.875056, 2.434758, 2.111651, 1, 1, 1, 1, 1,
1.876048, 0.09390094, 2.419203, 1, 1, 1, 1, 1,
1.904094, -0.5041329, 2.116771, 1, 1, 1, 1, 1,
1.904546, -1.144447, 2.230094, 1, 1, 1, 1, 1,
1.920053, -0.7930187, 1.215491, 1, 1, 1, 1, 1,
1.933244, 0.3679641, -0.8371833, 1, 1, 1, 1, 1,
1.959041, -1.492787, 2.513043, 0, 0, 1, 1, 1,
2.043848, 0.5019689, 0.9075388, 1, 0, 0, 1, 1,
2.047687, 0.7974761, 1.404792, 1, 0, 0, 1, 1,
2.077085, 1.584202, 1.41249, 1, 0, 0, 1, 1,
2.143569, -0.1791399, 0.7445044, 1, 0, 0, 1, 1,
2.21902, -2.909007, 1.978666, 1, 0, 0, 1, 1,
2.288047, 0.9285239, 1.466173, 0, 0, 0, 1, 1,
2.290068, -1.135941, 1.748354, 0, 0, 0, 1, 1,
2.339962, -1.058329, 1.805218, 0, 0, 0, 1, 1,
2.358819, 2.383972, 2.642551, 0, 0, 0, 1, 1,
2.371337, 0.5399967, 0.2462964, 0, 0, 0, 1, 1,
2.41241, 0.5616097, 1.169186, 0, 0, 0, 1, 1,
2.430466, -0.9326875, 2.923935, 0, 0, 0, 1, 1,
2.459431, 0.9915237, -0.1376566, 1, 1, 1, 1, 1,
2.470471, -0.9659377, 0.5312417, 1, 1, 1, 1, 1,
2.481778, -0.2454202, 1.662977, 1, 1, 1, 1, 1,
2.598079, -0.9391016, 2.531961, 1, 1, 1, 1, 1,
2.680257, 1.743793, 1.062253, 1, 1, 1, 1, 1,
2.829839, 1.507062, 1.006994, 1, 1, 1, 1, 1,
2.833045, -2.803252, 1.157224, 1, 1, 1, 1, 1
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
var radius = 9.312473;
var distance = 32.70967;
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
mvMatrix.translate( 0.1195786, -0.1550214, -0.1521206 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.70967);
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
