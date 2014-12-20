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
-3.169431, -1.163371, -2.693393, 1, 0, 0, 1,
-2.736726, -0.1224544, -1.978669, 1, 0.007843138, 0, 1,
-2.690065, -0.4651937, -4.235073, 1, 0.01176471, 0, 1,
-2.609713, -1.703365, -2.306514, 1, 0.01960784, 0, 1,
-2.60583, 1.715768, -1.51807, 1, 0.02352941, 0, 1,
-2.494676, 2.460141, 0.6145611, 1, 0.03137255, 0, 1,
-2.424659, 0.7312068, 0.399866, 1, 0.03529412, 0, 1,
-2.411, -1.611797, -2.880154, 1, 0.04313726, 0, 1,
-2.403482, 1.237919, -2.125564, 1, 0.04705882, 0, 1,
-2.364714, -1.170801, -0.5073834, 1, 0.05490196, 0, 1,
-2.346626, 0.5873984, -0.6411623, 1, 0.05882353, 0, 1,
-2.33216, -0.4602938, -1.939146, 1, 0.06666667, 0, 1,
-2.332033, 1.292418, -0.8221366, 1, 0.07058824, 0, 1,
-2.274916, 1.062782, -0.5671583, 1, 0.07843138, 0, 1,
-2.231771, -0.02219069, -2.498441, 1, 0.08235294, 0, 1,
-2.189441, -0.5263621, -1.091257, 1, 0.09019608, 0, 1,
-2.149302, -1.911658, -3.971726, 1, 0.09411765, 0, 1,
-2.13894, 2.43964, -0.2173504, 1, 0.1019608, 0, 1,
-2.131303, 0.8084621, -2.778862, 1, 0.1098039, 0, 1,
-2.039482, -0.4971112, -3.551012, 1, 0.1137255, 0, 1,
-2.023777, -1.938292, -1.15029, 1, 0.1215686, 0, 1,
-2.005413, -0.1692487, -1.116591, 1, 0.1254902, 0, 1,
-2.005325, -1.214995, -0.2161018, 1, 0.1333333, 0, 1,
-2.002578, 0.9666852, -0.668387, 1, 0.1372549, 0, 1,
-1.980434, 0.4849814, -0.5935741, 1, 0.145098, 0, 1,
-1.966249, -1.072806, -2.477478, 1, 0.1490196, 0, 1,
-1.934422, -0.4608988, -1.012726, 1, 0.1568628, 0, 1,
-1.89415, -0.9722722, -2.651039, 1, 0.1607843, 0, 1,
-1.894115, -0.9697975, 0.5088705, 1, 0.1686275, 0, 1,
-1.874573, 0.6157089, -0.933898, 1, 0.172549, 0, 1,
-1.859794, -1.349784, -3.219704, 1, 0.1803922, 0, 1,
-1.846466, 1.017538, -2.717854, 1, 0.1843137, 0, 1,
-1.836191, 2.292421, 1.519154, 1, 0.1921569, 0, 1,
-1.830605, -1.019531, -2.553328, 1, 0.1960784, 0, 1,
-1.816543, 0.696004, -1.746183, 1, 0.2039216, 0, 1,
-1.80228, 1.122118, 0.1858044, 1, 0.2117647, 0, 1,
-1.791628, 1.869825, 0.3916546, 1, 0.2156863, 0, 1,
-1.79091, 0.596347, -2.072646, 1, 0.2235294, 0, 1,
-1.785447, 0.03634734, -1.76247, 1, 0.227451, 0, 1,
-1.742878, -1.361572, -3.711925, 1, 0.2352941, 0, 1,
-1.730828, 1.411959, -1.90236, 1, 0.2392157, 0, 1,
-1.727747, 0.6576943, -2.138089, 1, 0.2470588, 0, 1,
-1.717776, -0.2973847, -1.271621, 1, 0.2509804, 0, 1,
-1.695406, -0.4260055, -3.531436, 1, 0.2588235, 0, 1,
-1.688351, 0.3604247, -2.805317, 1, 0.2627451, 0, 1,
-1.678329, -0.1644322, -1.050607, 1, 0.2705882, 0, 1,
-1.672051, 0.269361, -1.785084, 1, 0.2745098, 0, 1,
-1.655878, -0.8050821, -0.6931072, 1, 0.282353, 0, 1,
-1.626501, 0.766072, -1.2645, 1, 0.2862745, 0, 1,
-1.625666, 1.464418, -1.588604, 1, 0.2941177, 0, 1,
-1.608063, 0.3096128, -2.432427, 1, 0.3019608, 0, 1,
-1.5974, -0.7550995, -3.99009, 1, 0.3058824, 0, 1,
-1.589133, 0.5328324, -1.901288, 1, 0.3137255, 0, 1,
-1.560677, 1.603278, -0.5821876, 1, 0.3176471, 0, 1,
-1.548559, -0.3241202, -1.239631, 1, 0.3254902, 0, 1,
-1.543773, -1.176928, -2.828601, 1, 0.3294118, 0, 1,
-1.534847, 0.3674144, -1.069262, 1, 0.3372549, 0, 1,
-1.519254, -0.04388275, -0.8374168, 1, 0.3411765, 0, 1,
-1.514573, 1.452378, -0.5437193, 1, 0.3490196, 0, 1,
-1.512835, 0.8755312, -2.817971, 1, 0.3529412, 0, 1,
-1.509421, 0.0369552, -1.865709, 1, 0.3607843, 0, 1,
-1.508662, 0.8116837, 1.334838, 1, 0.3647059, 0, 1,
-1.506083, 1.407857, 0.5170129, 1, 0.372549, 0, 1,
-1.479609, 0.5079708, -0.8313457, 1, 0.3764706, 0, 1,
-1.4519, 1.260457, -0.8003412, 1, 0.3843137, 0, 1,
-1.446541, -0.04315345, -1.173028, 1, 0.3882353, 0, 1,
-1.439848, 0.5486466, -1.573537, 1, 0.3960784, 0, 1,
-1.428221, -0.8323523, -1.939068, 1, 0.4039216, 0, 1,
-1.414081, 0.6229472, -1.968052, 1, 0.4078431, 0, 1,
-1.409951, 0.525789, 0.06314504, 1, 0.4156863, 0, 1,
-1.406978, 0.7037573, -1.473071, 1, 0.4196078, 0, 1,
-1.396413, 2.561968, -0.03759493, 1, 0.427451, 0, 1,
-1.387806, -0.3429607, -3.297305, 1, 0.4313726, 0, 1,
-1.386462, 1.29342, 1.278577, 1, 0.4392157, 0, 1,
-1.386205, -0.5556738, -2.836632, 1, 0.4431373, 0, 1,
-1.384819, -1.427416, -0.97891, 1, 0.4509804, 0, 1,
-1.377091, -0.4907515, -2.070572, 1, 0.454902, 0, 1,
-1.373447, 0.6239842, 0.670495, 1, 0.4627451, 0, 1,
-1.369322, -1.006502, -3.442584, 1, 0.4666667, 0, 1,
-1.360542, 0.2403152, -0.07006707, 1, 0.4745098, 0, 1,
-1.345798, -1.021986, -0.9994284, 1, 0.4784314, 0, 1,
-1.343928, -1.942486, -1.212999, 1, 0.4862745, 0, 1,
-1.342231, 0.5164661, -2.259976, 1, 0.4901961, 0, 1,
-1.339412, -0.5018209, -2.457787, 1, 0.4980392, 0, 1,
-1.332041, 1.095149, -1.23358, 1, 0.5058824, 0, 1,
-1.317369, 0.7667909, 0.2258283, 1, 0.509804, 0, 1,
-1.314036, 0.5887658, -1.595223, 1, 0.5176471, 0, 1,
-1.306879, -0.8706789, -1.808834, 1, 0.5215687, 0, 1,
-1.297512, 0.3953973, 0.6696474, 1, 0.5294118, 0, 1,
-1.277837, -0.8819185, -2.799992, 1, 0.5333334, 0, 1,
-1.277035, 0.8481111, -1.825006, 1, 0.5411765, 0, 1,
-1.26488, 0.9948097, -0.6874522, 1, 0.5450981, 0, 1,
-1.264049, -1.745627, -1.811115, 1, 0.5529412, 0, 1,
-1.263737, -1.269144, -2.093898, 1, 0.5568628, 0, 1,
-1.257874, -0.3769602, -2.297173, 1, 0.5647059, 0, 1,
-1.257832, -0.03556262, -2.48743, 1, 0.5686275, 0, 1,
-1.255252, 0.3412349, -0.3447319, 1, 0.5764706, 0, 1,
-1.253659, -0.5960239, -2.616264, 1, 0.5803922, 0, 1,
-1.241332, 1.460895, -1.505747, 1, 0.5882353, 0, 1,
-1.238056, -1.733069, -1.484676, 1, 0.5921569, 0, 1,
-1.23379, -0.5005113, -3.016474, 1, 0.6, 0, 1,
-1.224991, 0.3838432, -0.3618557, 1, 0.6078432, 0, 1,
-1.213493, 0.2057234, -2.493792, 1, 0.6117647, 0, 1,
-1.191856, 1.782129, 0.2624113, 1, 0.6196079, 0, 1,
-1.19082, -0.6837225, -1.155255, 1, 0.6235294, 0, 1,
-1.190105, 0.3938193, -2.325381, 1, 0.6313726, 0, 1,
-1.186201, -1.924576, -2.77668, 1, 0.6352941, 0, 1,
-1.179966, 0.1732875, -1.671213, 1, 0.6431373, 0, 1,
-1.178564, 1.875312, 1.501872, 1, 0.6470588, 0, 1,
-1.175841, -0.5571826, -1.556125, 1, 0.654902, 0, 1,
-1.172742, 1.260844, -0.7596947, 1, 0.6588235, 0, 1,
-1.171533, -0.9287262, -2.395353, 1, 0.6666667, 0, 1,
-1.170501, 0.1663103, -2.911515, 1, 0.6705883, 0, 1,
-1.163241, -0.1462178, -0.3384002, 1, 0.6784314, 0, 1,
-1.155816, -0.482754, -4.191439, 1, 0.682353, 0, 1,
-1.153487, -0.04836352, -0.2720293, 1, 0.6901961, 0, 1,
-1.1448, 2.48832, -2.323456, 1, 0.6941177, 0, 1,
-1.142531, 0.8002788, -2.524597, 1, 0.7019608, 0, 1,
-1.133574, -0.9966052, -2.369102, 1, 0.7098039, 0, 1,
-1.132856, -0.2308122, -1.839813, 1, 0.7137255, 0, 1,
-1.125479, 0.7312743, 0.5416844, 1, 0.7215686, 0, 1,
-1.118495, 0.5133901, -1.060797, 1, 0.7254902, 0, 1,
-1.112386, -1.497765, -2.27452, 1, 0.7333333, 0, 1,
-1.101162, 2.309911, -0.01170665, 1, 0.7372549, 0, 1,
-1.098144, -1.120001, -1.670748, 1, 0.7450981, 0, 1,
-1.095448, -0.2583547, -2.771658, 1, 0.7490196, 0, 1,
-1.09132, 1.332175, -0.4504223, 1, 0.7568628, 0, 1,
-1.091306, 0.5268284, -1.413182, 1, 0.7607843, 0, 1,
-1.090921, -0.4619131, -1.027612, 1, 0.7686275, 0, 1,
-1.084175, 0.1956544, -2.499606, 1, 0.772549, 0, 1,
-1.083458, -1.3877, -2.819501, 1, 0.7803922, 0, 1,
-1.083447, 0.9898509, -0.4980674, 1, 0.7843137, 0, 1,
-1.079579, -0.6739773, -3.123244, 1, 0.7921569, 0, 1,
-1.078744, -0.3656854, -2.531953, 1, 0.7960784, 0, 1,
-1.073752, -1.04892, -2.3426, 1, 0.8039216, 0, 1,
-1.072076, -0.074018, -0.4137263, 1, 0.8117647, 0, 1,
-1.068102, 0.8497033, -1.725456, 1, 0.8156863, 0, 1,
-1.065021, -1.071279, -1.646362, 1, 0.8235294, 0, 1,
-1.062016, -1.054774, -3.808715, 1, 0.827451, 0, 1,
-1.060543, -0.6108771, -1.837974, 1, 0.8352941, 0, 1,
-1.059071, 0.3748153, -1.790382, 1, 0.8392157, 0, 1,
-1.041235, 0.3993495, -0.7369406, 1, 0.8470588, 0, 1,
-1.028132, -1.17888, -1.843668, 1, 0.8509804, 0, 1,
-1.02789, -0.7186249, -3.336561, 1, 0.8588235, 0, 1,
-1.020141, -0.1155568, -1.45865, 1, 0.8627451, 0, 1,
-1.0189, -0.8410854, -1.645949, 1, 0.8705882, 0, 1,
-0.9997547, 0.2699279, -1.205068, 1, 0.8745098, 0, 1,
-0.9931676, -1.495814, -3.224553, 1, 0.8823529, 0, 1,
-0.9894579, -0.09643617, -1.258078, 1, 0.8862745, 0, 1,
-0.9870849, 1.056101, 2.218725, 1, 0.8941177, 0, 1,
-0.981169, -0.6428059, -2.618427, 1, 0.8980392, 0, 1,
-0.9770224, -0.8471127, -2.809672, 1, 0.9058824, 0, 1,
-0.9622734, 1.162271, -2.390864, 1, 0.9137255, 0, 1,
-0.958975, 0.3859791, -2.701533, 1, 0.9176471, 0, 1,
-0.9575981, -0.1226512, -3.138584, 1, 0.9254902, 0, 1,
-0.9560521, -0.4114887, -2.19049, 1, 0.9294118, 0, 1,
-0.9458008, -0.6800588, -0.9710537, 1, 0.9372549, 0, 1,
-0.9266422, -1.186017, -2.752123, 1, 0.9411765, 0, 1,
-0.9264973, -1.538734, -3.026458, 1, 0.9490196, 0, 1,
-0.9239063, -0.7329944, -2.696391, 1, 0.9529412, 0, 1,
-0.9230727, -0.3049931, -2.398443, 1, 0.9607843, 0, 1,
-0.9192888, 0.2218019, -0.1908843, 1, 0.9647059, 0, 1,
-0.9158561, -0.09159001, -2.16221, 1, 0.972549, 0, 1,
-0.9156065, 0.7180024, -1.899749, 1, 0.9764706, 0, 1,
-0.9139618, -0.876956, -3.427199, 1, 0.9843137, 0, 1,
-0.9133416, -0.5513492, -2.961976, 1, 0.9882353, 0, 1,
-0.9125359, 1.752919, -0.1660359, 1, 0.9960784, 0, 1,
-0.908525, 1.713245, -0.6418958, 0.9960784, 1, 0, 1,
-0.9055136, -0.2159944, 0.05932345, 0.9921569, 1, 0, 1,
-0.9052953, 0.2608229, -1.240909, 0.9843137, 1, 0, 1,
-0.9050956, -0.7617611, -2.762842, 0.9803922, 1, 0, 1,
-0.9034604, 0.7743665, -1.890784, 0.972549, 1, 0, 1,
-0.9019303, 0.2275232, -1.562024, 0.9686275, 1, 0, 1,
-0.90106, 0.1466824, -1.496982, 0.9607843, 1, 0, 1,
-0.8994659, 1.170314, -3.071715, 0.9568627, 1, 0, 1,
-0.8973185, -0.2244137, -2.151436, 0.9490196, 1, 0, 1,
-0.8964593, 0.3056726, -1.329498, 0.945098, 1, 0, 1,
-0.8875712, 0.0807173, -1.694115, 0.9372549, 1, 0, 1,
-0.8861911, -0.7696623, -1.060653, 0.9333333, 1, 0, 1,
-0.8827996, 0.1035404, -0.9264466, 0.9254902, 1, 0, 1,
-0.8800826, -0.5789832, -0.6127464, 0.9215686, 1, 0, 1,
-0.8759726, -0.2202097, -1.978202, 0.9137255, 1, 0, 1,
-0.8729596, 1.306197, -2.120303, 0.9098039, 1, 0, 1,
-0.8692517, -1.453957, -3.961303, 0.9019608, 1, 0, 1,
-0.8691545, 0.01919357, -0.7978393, 0.8941177, 1, 0, 1,
-0.8685483, -2.236821, -3.163673, 0.8901961, 1, 0, 1,
-0.8677644, -1.094119, -3.523946, 0.8823529, 1, 0, 1,
-0.86658, 0.0536034, -2.063006, 0.8784314, 1, 0, 1,
-0.861714, -0.20659, -1.349956, 0.8705882, 1, 0, 1,
-0.8612943, -0.7760182, -1.63021, 0.8666667, 1, 0, 1,
-0.8596398, -1.579681, -0.78931, 0.8588235, 1, 0, 1,
-0.8579767, -0.4218979, -4.02369, 0.854902, 1, 0, 1,
-0.8566129, 1.356959, -1.456549, 0.8470588, 1, 0, 1,
-0.8453804, 0.4807726, -2.369258, 0.8431373, 1, 0, 1,
-0.8453248, 0.824886, -0.7386112, 0.8352941, 1, 0, 1,
-0.8381746, 0.7768721, -0.18992, 0.8313726, 1, 0, 1,
-0.8376619, 0.7139614, -0.5228832, 0.8235294, 1, 0, 1,
-0.837574, 0.3623227, -1.615156, 0.8196079, 1, 0, 1,
-0.8338174, -0.8455774, -3.235321, 0.8117647, 1, 0, 1,
-0.832331, 0.4896709, -0.1402588, 0.8078431, 1, 0, 1,
-0.8279845, 1.039943, -0.8266626, 0.8, 1, 0, 1,
-0.8268742, 0.2117464, -1.966558, 0.7921569, 1, 0, 1,
-0.8243554, -0.3915023, -1.129289, 0.7882353, 1, 0, 1,
-0.8215232, 0.2258808, -1.696041, 0.7803922, 1, 0, 1,
-0.817828, 0.1607874, -0.687105, 0.7764706, 1, 0, 1,
-0.8156738, 1.692342, -0.06408142, 0.7686275, 1, 0, 1,
-0.7981623, 1.286089, -0.003580667, 0.7647059, 1, 0, 1,
-0.7932795, 0.8501289, -1.591242, 0.7568628, 1, 0, 1,
-0.7886563, 0.8148736, -0.1820974, 0.7529412, 1, 0, 1,
-0.7884305, -1.299054, -2.641978, 0.7450981, 1, 0, 1,
-0.7862135, 0.3746026, -2.056741, 0.7411765, 1, 0, 1,
-0.7812175, 1.839642, -0.03021771, 0.7333333, 1, 0, 1,
-0.7803263, 1.019233, -0.6733261, 0.7294118, 1, 0, 1,
-0.7801265, 0.6677068, -2.289919, 0.7215686, 1, 0, 1,
-0.7727306, 0.4741981, -0.663408, 0.7176471, 1, 0, 1,
-0.7656724, 1.460677, -1.57919, 0.7098039, 1, 0, 1,
-0.7615866, 1.27188, -1.621468, 0.7058824, 1, 0, 1,
-0.7549919, -1.585759, -1.391032, 0.6980392, 1, 0, 1,
-0.7525936, 0.4338399, -1.651277, 0.6901961, 1, 0, 1,
-0.7523211, 0.9454551, -0.8359022, 0.6862745, 1, 0, 1,
-0.7472719, 0.5635526, 0.1499481, 0.6784314, 1, 0, 1,
-0.7446548, -1.453964, -1.107803, 0.6745098, 1, 0, 1,
-0.7431822, 0.627948, -2.171611, 0.6666667, 1, 0, 1,
-0.7393125, -0.7750869, -1.793627, 0.6627451, 1, 0, 1,
-0.7392644, -1.119696, -1.353438, 0.654902, 1, 0, 1,
-0.7374454, -2.118986, -3.467052, 0.6509804, 1, 0, 1,
-0.736986, 0.1842661, -1.484989, 0.6431373, 1, 0, 1,
-0.733444, 0.3396564, -1.19611, 0.6392157, 1, 0, 1,
-0.7234446, 0.5346258, -1.7676, 0.6313726, 1, 0, 1,
-0.7232911, 0.778924, -1.178868, 0.627451, 1, 0, 1,
-0.7152348, 1.457455, -2.097361, 0.6196079, 1, 0, 1,
-0.7141147, 0.3850214, -1.401474, 0.6156863, 1, 0, 1,
-0.7130347, 0.2290087, -2.113445, 0.6078432, 1, 0, 1,
-0.7087703, -0.5565838, -1.418812, 0.6039216, 1, 0, 1,
-0.7081981, 0.3342898, -1.246403, 0.5960785, 1, 0, 1,
-0.7071455, 0.9555777, -2.720047, 0.5882353, 1, 0, 1,
-0.7004821, 0.1131788, -0.802156, 0.5843138, 1, 0, 1,
-0.7002405, -0.6069713, -0.6958956, 0.5764706, 1, 0, 1,
-0.6972327, -0.3001132, -1.76935, 0.572549, 1, 0, 1,
-0.6909111, 0.1776915, -2.002641, 0.5647059, 1, 0, 1,
-0.6902537, -0.9022149, -3.949314, 0.5607843, 1, 0, 1,
-0.6891294, -1.877899, -2.212082, 0.5529412, 1, 0, 1,
-0.6843681, 1.393387, -2.058685, 0.5490196, 1, 0, 1,
-0.6832693, 0.9668022, -2.689689, 0.5411765, 1, 0, 1,
-0.6827701, -0.005114097, -1.625577, 0.5372549, 1, 0, 1,
-0.6824953, -0.3325887, -0.5574327, 0.5294118, 1, 0, 1,
-0.6711528, 0.9282994, -0.3910561, 0.5254902, 1, 0, 1,
-0.6701704, -0.7459823, -1.984105, 0.5176471, 1, 0, 1,
-0.6686566, 1.304572, -1.634529, 0.5137255, 1, 0, 1,
-0.6685706, 1.217792, -2.070148, 0.5058824, 1, 0, 1,
-0.6683707, 0.3919316, -1.011768, 0.5019608, 1, 0, 1,
-0.6647927, -1.381763, -3.112595, 0.4941176, 1, 0, 1,
-0.6604576, 0.2735668, -0.0422603, 0.4862745, 1, 0, 1,
-0.6594684, 0.4533608, -2.197553, 0.4823529, 1, 0, 1,
-0.6560059, 1.618386, -1.044299, 0.4745098, 1, 0, 1,
-0.654569, 0.5678427, -1.214926, 0.4705882, 1, 0, 1,
-0.6541101, 0.4467776, -1.136014, 0.4627451, 1, 0, 1,
-0.6528464, 2.29844, 0.1917051, 0.4588235, 1, 0, 1,
-0.6469631, 1.067506, -1.365811, 0.4509804, 1, 0, 1,
-0.6435864, -0.9637479, -3.327093, 0.4470588, 1, 0, 1,
-0.639441, 1.886918, -0.5776867, 0.4392157, 1, 0, 1,
-0.6377838, 0.7280005, -0.898595, 0.4352941, 1, 0, 1,
-0.637723, 0.6755388, 0.3249681, 0.427451, 1, 0, 1,
-0.6314256, -0.8641683, -3.49968, 0.4235294, 1, 0, 1,
-0.6310506, 0.8411558, -0.908082, 0.4156863, 1, 0, 1,
-0.63025, 0.01364393, -2.405726, 0.4117647, 1, 0, 1,
-0.6248106, -1.29828, -3.25421, 0.4039216, 1, 0, 1,
-0.6230202, -0.9115936, -2.837994, 0.3960784, 1, 0, 1,
-0.6208012, -0.5833161, -0.7574506, 0.3921569, 1, 0, 1,
-0.620538, -0.7321647, -1.865037, 0.3843137, 1, 0, 1,
-0.6200594, -1.218794, -2.152336, 0.3803922, 1, 0, 1,
-0.6137304, -0.6228369, -1.488467, 0.372549, 1, 0, 1,
-0.6126099, -1.139999, -4.496317, 0.3686275, 1, 0, 1,
-0.6115467, 0.1718301, 0.5667188, 0.3607843, 1, 0, 1,
-0.6084939, -2.395882, -2.528013, 0.3568628, 1, 0, 1,
-0.6007555, -0.5620911, -4.463312, 0.3490196, 1, 0, 1,
-0.5980217, -0.3484617, -1.906942, 0.345098, 1, 0, 1,
-0.5977759, -1.515773, -2.544406, 0.3372549, 1, 0, 1,
-0.5950862, 2.146659, 0.6051845, 0.3333333, 1, 0, 1,
-0.5948479, 0.06778028, -2.509642, 0.3254902, 1, 0, 1,
-0.5945089, 1.007703, -0.6707165, 0.3215686, 1, 0, 1,
-0.5943972, 0.4595662, -1.230878, 0.3137255, 1, 0, 1,
-0.5943263, 0.08331703, -2.336581, 0.3098039, 1, 0, 1,
-0.5929878, -0.1738854, -1.798503, 0.3019608, 1, 0, 1,
-0.5907573, -1.28963, -3.770933, 0.2941177, 1, 0, 1,
-0.5870906, 0.2764249, -2.764655, 0.2901961, 1, 0, 1,
-0.5842482, 0.003118417, -2.563905, 0.282353, 1, 0, 1,
-0.5767061, -1.027571, -4.059413, 0.2784314, 1, 0, 1,
-0.5742745, 1.16401, -1.736935, 0.2705882, 1, 0, 1,
-0.5720426, -1.099026, -2.087517, 0.2666667, 1, 0, 1,
-0.5684366, -2.001382, -2.988403, 0.2588235, 1, 0, 1,
-0.5676194, -0.02011771, -1.125629, 0.254902, 1, 0, 1,
-0.5662512, 0.4961055, -2.129675, 0.2470588, 1, 0, 1,
-0.5635375, -1.139311, -2.549719, 0.2431373, 1, 0, 1,
-0.5619933, -0.2820735, -2.469256, 0.2352941, 1, 0, 1,
-0.560158, 0.2537457, -0.3767415, 0.2313726, 1, 0, 1,
-0.5575308, 0.3127834, -1.801772, 0.2235294, 1, 0, 1,
-0.5535429, 0.4299996, 0.6295428, 0.2196078, 1, 0, 1,
-0.5532777, 1.621688, 0.5557938, 0.2117647, 1, 0, 1,
-0.5496281, -0.7147951, -2.50235, 0.2078431, 1, 0, 1,
-0.5486523, 0.2820066, 0.4058072, 0.2, 1, 0, 1,
-0.5450779, 1.778668, -0.6957332, 0.1921569, 1, 0, 1,
-0.5437009, 0.3638202, -2.138278, 0.1882353, 1, 0, 1,
-0.5386215, -0.5884863, -0.7614225, 0.1803922, 1, 0, 1,
-0.5315214, 0.8697853, -1.00409, 0.1764706, 1, 0, 1,
-0.5188131, 1.663094, 0.9248945, 0.1686275, 1, 0, 1,
-0.5142886, -0.3366661, -0.6699162, 0.1647059, 1, 0, 1,
-0.513574, -0.4572145, -2.84963, 0.1568628, 1, 0, 1,
-0.5131931, -0.1665953, -0.3659364, 0.1529412, 1, 0, 1,
-0.5127077, 1.585813, -0.02588899, 0.145098, 1, 0, 1,
-0.5123493, 0.8832428, -0.8886225, 0.1411765, 1, 0, 1,
-0.5121896, 0.6566622, -0.9084873, 0.1333333, 1, 0, 1,
-0.5098616, -0.2292213, -2.186091, 0.1294118, 1, 0, 1,
-0.509214, -0.1908739, -2.014998, 0.1215686, 1, 0, 1,
-0.5060434, 1.8125, -0.9531205, 0.1176471, 1, 0, 1,
-0.5052354, -1.301936, -1.132265, 0.1098039, 1, 0, 1,
-0.5045271, 0.8457995, 0.7126732, 0.1058824, 1, 0, 1,
-0.5039495, -1.920866, -4.70368, 0.09803922, 1, 0, 1,
-0.5006228, -0.272159, -3.609258, 0.09019608, 1, 0, 1,
-0.4954587, 2.033025, -0.7087628, 0.08627451, 1, 0, 1,
-0.4929309, 0.5535138, -0.1811804, 0.07843138, 1, 0, 1,
-0.4907274, -0.8537356, -2.03891, 0.07450981, 1, 0, 1,
-0.4839814, 1.166648, 0.8504761, 0.06666667, 1, 0, 1,
-0.474771, -0.1441288, -2.102599, 0.0627451, 1, 0, 1,
-0.4739154, -1.230661, -3.543406, 0.05490196, 1, 0, 1,
-0.4715534, 0.2318879, -0.6507836, 0.05098039, 1, 0, 1,
-0.4687144, -2.729662, -4.1544, 0.04313726, 1, 0, 1,
-0.4643214, -0.4886216, -1.944459, 0.03921569, 1, 0, 1,
-0.4637036, -0.4059558, -3.02819, 0.03137255, 1, 0, 1,
-0.463305, -0.01576624, -0.7944465, 0.02745098, 1, 0, 1,
-0.4594332, -0.2396047, -0.4734745, 0.01960784, 1, 0, 1,
-0.4548571, -0.5548778, -0.7190787, 0.01568628, 1, 0, 1,
-0.4534746, 0.2372237, -0.7623829, 0.007843138, 1, 0, 1,
-0.4465423, 1.169459, 0.7153406, 0.003921569, 1, 0, 1,
-0.4406547, 0.4691608, 0.709675, 0, 1, 0.003921569, 1,
-0.4406514, 0.7747052, 1.362607, 0, 1, 0.01176471, 1,
-0.4402091, 2.17691, -0.8252459, 0, 1, 0.01568628, 1,
-0.4375716, 1.011797, -0.4239064, 0, 1, 0.02352941, 1,
-0.4353377, -1.005577, -3.562145, 0, 1, 0.02745098, 1,
-0.4338427, -0.9603351, -0.811988, 0, 1, 0.03529412, 1,
-0.4306779, 0.2825722, -0.9445156, 0, 1, 0.03921569, 1,
-0.4290941, 1.208945, -0.6742693, 0, 1, 0.04705882, 1,
-0.4287601, 1.494599, -0.2944157, 0, 1, 0.05098039, 1,
-0.4236699, -0.9055179, -3.627795, 0, 1, 0.05882353, 1,
-0.4185154, 0.3559517, -0.3075284, 0, 1, 0.0627451, 1,
-0.4169285, -2.004704, -3.511193, 0, 1, 0.07058824, 1,
-0.4167536, 1.048472, -0.4470895, 0, 1, 0.07450981, 1,
-0.416419, 0.4955247, -1.374535, 0, 1, 0.08235294, 1,
-0.4139147, -1.341294, -3.824574, 0, 1, 0.08627451, 1,
-0.4118581, 0.7602161, -0.7103953, 0, 1, 0.09411765, 1,
-0.4096355, 0.402181, -1.491389, 0, 1, 0.1019608, 1,
-0.4070967, -0.291278, -1.180338, 0, 1, 0.1058824, 1,
-0.4039453, -0.967049, -4.01691, 0, 1, 0.1137255, 1,
-0.400226, -0.818416, -4.155991, 0, 1, 0.1176471, 1,
-0.3953376, 0.7311854, -0.3837841, 0, 1, 0.1254902, 1,
-0.3951776, 0.9409013, 0.2502095, 0, 1, 0.1294118, 1,
-0.3929928, -0.6095886, -3.291803, 0, 1, 0.1372549, 1,
-0.3864311, -0.5359685, -1.732701, 0, 1, 0.1411765, 1,
-0.386297, -1.468537, -3.600499, 0, 1, 0.1490196, 1,
-0.3862197, -1.209914, -4.347077, 0, 1, 0.1529412, 1,
-0.3800078, 0.1779001, -2.102465, 0, 1, 0.1607843, 1,
-0.3668841, 0.750764, 1.031316, 0, 1, 0.1647059, 1,
-0.365905, 0.2498749, -3.626421, 0, 1, 0.172549, 1,
-0.3616814, 0.9870181, -1.876755, 0, 1, 0.1764706, 1,
-0.3575415, -0.1971439, -1.137652, 0, 1, 0.1843137, 1,
-0.3559796, 2.338743, 0.3333107, 0, 1, 0.1882353, 1,
-0.3528892, -0.3636156, -1.559686, 0, 1, 0.1960784, 1,
-0.3492812, -0.5160627, -1.904587, 0, 1, 0.2039216, 1,
-0.34903, 1.131781, -0.111936, 0, 1, 0.2078431, 1,
-0.3479981, -1.086435, -3.861839, 0, 1, 0.2156863, 1,
-0.347317, 1.302137, -0.3731711, 0, 1, 0.2196078, 1,
-0.3431116, -2.515384, -1.850256, 0, 1, 0.227451, 1,
-0.3419304, 1.38347, -1.627372, 0, 1, 0.2313726, 1,
-0.3411141, -0.01049528, -1.958395, 0, 1, 0.2392157, 1,
-0.3371984, 0.894211, -0.6559947, 0, 1, 0.2431373, 1,
-0.3352915, 0.7631588, 1.103889, 0, 1, 0.2509804, 1,
-0.3336363, 1.699877, -0.06258162, 0, 1, 0.254902, 1,
-0.3335609, -0.233978, -1.622101, 0, 1, 0.2627451, 1,
-0.3278526, 1.203382, -0.3405527, 0, 1, 0.2666667, 1,
-0.3248944, 2.627073, 0.2033547, 0, 1, 0.2745098, 1,
-0.3219328, 1.46936, 0.2984497, 0, 1, 0.2784314, 1,
-0.3158437, 0.1017396, -1.474668, 0, 1, 0.2862745, 1,
-0.3095849, -0.8775025, -2.309697, 0, 1, 0.2901961, 1,
-0.3089314, -1.073676, -3.828755, 0, 1, 0.2980392, 1,
-0.3072092, -0.08129296, -2.955621, 0, 1, 0.3058824, 1,
-0.3064919, 0.7396653, -1.498541, 0, 1, 0.3098039, 1,
-0.3062456, 0.5161895, -1.472618, 0, 1, 0.3176471, 1,
-0.3027294, -0.01901577, 0.6290413, 0, 1, 0.3215686, 1,
-0.3003001, -2.405124, -3.164706, 0, 1, 0.3294118, 1,
-0.2918773, -1.035949, -2.097035, 0, 1, 0.3333333, 1,
-0.2918433, 0.4682747, 0.05260623, 0, 1, 0.3411765, 1,
-0.2895574, -1.395693, -4.511434, 0, 1, 0.345098, 1,
-0.289063, -1.44456, -3.373973, 0, 1, 0.3529412, 1,
-0.28787, 0.4144432, -0.404807, 0, 1, 0.3568628, 1,
-0.272934, 0.03149451, -1.037523, 0, 1, 0.3647059, 1,
-0.2683302, -0.3628519, -2.09554, 0, 1, 0.3686275, 1,
-0.2611092, -0.3383874, -1.89795, 0, 1, 0.3764706, 1,
-0.258643, 0.02940125, -0.4028787, 0, 1, 0.3803922, 1,
-0.258174, -1.582239, -1.470726, 0, 1, 0.3882353, 1,
-0.2554612, 0.4416808, 1.242963, 0, 1, 0.3921569, 1,
-0.2472838, 1.406579, -0.7410963, 0, 1, 0.4, 1,
-0.2432709, -0.7235515, -2.944358, 0, 1, 0.4078431, 1,
-0.243075, 0.3255299, -0.5024393, 0, 1, 0.4117647, 1,
-0.2417845, 1.656278, -0.7255455, 0, 1, 0.4196078, 1,
-0.2410731, 0.3198538, -0.6432052, 0, 1, 0.4235294, 1,
-0.2400675, 0.767679, -0.3380835, 0, 1, 0.4313726, 1,
-0.2396896, 0.6673545, 0.5610495, 0, 1, 0.4352941, 1,
-0.2382223, 0.7852651, 0.1540403, 0, 1, 0.4431373, 1,
-0.236064, -1.076521, -1.336808, 0, 1, 0.4470588, 1,
-0.234405, 0.1845032, -0.6284779, 0, 1, 0.454902, 1,
-0.2333977, 1.135162, -0.2408065, 0, 1, 0.4588235, 1,
-0.2305832, -0.122775, -1.792334, 0, 1, 0.4666667, 1,
-0.229235, -0.3820367, -3.674071, 0, 1, 0.4705882, 1,
-0.2288878, 1.156967, -0.596658, 0, 1, 0.4784314, 1,
-0.2245381, -0.04093862, -2.127704, 0, 1, 0.4823529, 1,
-0.2191268, -0.4611126, -3.755417, 0, 1, 0.4901961, 1,
-0.2184966, 0.8152792, -0.2901227, 0, 1, 0.4941176, 1,
-0.2177752, 0.5207526, -0.114838, 0, 1, 0.5019608, 1,
-0.2117034, -1.700166, -4.155423, 0, 1, 0.509804, 1,
-0.1987706, -1.834811, -1.620176, 0, 1, 0.5137255, 1,
-0.1970449, 1.434636, -1.067612, 0, 1, 0.5215687, 1,
-0.1952231, 1.43464, -0.5880159, 0, 1, 0.5254902, 1,
-0.1948294, 0.0208561, -1.140417, 0, 1, 0.5333334, 1,
-0.1921305, -1.225218, -2.344348, 0, 1, 0.5372549, 1,
-0.188415, -0.3037655, -2.507851, 0, 1, 0.5450981, 1,
-0.1872964, 0.570313, 1.35909, 0, 1, 0.5490196, 1,
-0.1827127, 2.043668, -0.7155712, 0, 1, 0.5568628, 1,
-0.1796079, -1.110931, -3.739382, 0, 1, 0.5607843, 1,
-0.1763247, -0.09445952, -2.011776, 0, 1, 0.5686275, 1,
-0.1731346, 0.5325461, 0.2996765, 0, 1, 0.572549, 1,
-0.1727791, 0.6135362, -0.04226602, 0, 1, 0.5803922, 1,
-0.1672241, 0.490445, 0.5742369, 0, 1, 0.5843138, 1,
-0.1660857, -0.9899254, -5.180202, 0, 1, 0.5921569, 1,
-0.1610207, 0.7265948, -0.4251945, 0, 1, 0.5960785, 1,
-0.155847, -0.9920527, -1.28247, 0, 1, 0.6039216, 1,
-0.1527632, 0.8916041, 0.8768587, 0, 1, 0.6117647, 1,
-0.1474036, -0.08915349, -0.4352384, 0, 1, 0.6156863, 1,
-0.1373014, 1.262164, -0.9566264, 0, 1, 0.6235294, 1,
-0.1303023, -0.7938679, -4.619194, 0, 1, 0.627451, 1,
-0.1286463, 1.286929, 0.6491973, 0, 1, 0.6352941, 1,
-0.1281341, 0.1362967, 0.3658478, 0, 1, 0.6392157, 1,
-0.1281175, 1.979648, -0.2284007, 0, 1, 0.6470588, 1,
-0.1254946, -0.08535167, -3.109733, 0, 1, 0.6509804, 1,
-0.123411, -0.3414987, -2.90315, 0, 1, 0.6588235, 1,
-0.1216667, -1.376972, -3.691036, 0, 1, 0.6627451, 1,
-0.1195131, 1.250463, -0.4913408, 0, 1, 0.6705883, 1,
-0.1177338, 0.6149454, -1.591746, 0, 1, 0.6745098, 1,
-0.1164003, -0.1473798, -1.869511, 0, 1, 0.682353, 1,
-0.1161544, 1.048832, 0.5822696, 0, 1, 0.6862745, 1,
-0.1130961, 0.7377021, 0.4914329, 0, 1, 0.6941177, 1,
-0.1113043, -0.9315155, -1.844786, 0, 1, 0.7019608, 1,
-0.1097713, -1.028673, -4.282748, 0, 1, 0.7058824, 1,
-0.1088935, 0.3068651, -1.33744, 0, 1, 0.7137255, 1,
-0.1086415, 0.4062898, -0.6743824, 0, 1, 0.7176471, 1,
-0.1076399, 0.2606609, -2.087181, 0, 1, 0.7254902, 1,
-0.1059778, 0.2711323, -0.2341941, 0, 1, 0.7294118, 1,
-0.1051392, -0.1147465, -2.950326, 0, 1, 0.7372549, 1,
-0.1023201, -0.163658, -2.288244, 0, 1, 0.7411765, 1,
-0.100988, -0.3316034, -3.758327, 0, 1, 0.7490196, 1,
-0.09820703, 0.9927406, 0.5795188, 0, 1, 0.7529412, 1,
-0.09117623, 0.3976623, 0.6769126, 0, 1, 0.7607843, 1,
-0.0855598, -0.9159766, -3.24125, 0, 1, 0.7647059, 1,
-0.08506175, -0.7643763, -1.458567, 0, 1, 0.772549, 1,
-0.08252562, 0.05918424, -0.5669917, 0, 1, 0.7764706, 1,
-0.08194667, -0.2179814, -2.868535, 0, 1, 0.7843137, 1,
-0.08171455, 0.2423616, -1.010817, 0, 1, 0.7882353, 1,
-0.08114822, -0.4043912, -3.074762, 0, 1, 0.7960784, 1,
-0.07843252, 0.8312255, -1.42382, 0, 1, 0.8039216, 1,
-0.07515763, -1.447575, -4.839708, 0, 1, 0.8078431, 1,
-0.07467563, 0.3906243, 0.6646573, 0, 1, 0.8156863, 1,
-0.06590215, 0.6729031, 1.7429, 0, 1, 0.8196079, 1,
-0.0620665, -1.027388, -4.213599, 0, 1, 0.827451, 1,
-0.06101828, -0.7646382, -2.218633, 0, 1, 0.8313726, 1,
-0.05930725, -1.500463, -2.737231, 0, 1, 0.8392157, 1,
-0.05930398, 0.4701689, 0.4249116, 0, 1, 0.8431373, 1,
-0.05902892, -0.9630232, -4.065719, 0, 1, 0.8509804, 1,
-0.05786566, 0.3055668, 0.4514866, 0, 1, 0.854902, 1,
-0.05706428, 1.934709, 0.5979693, 0, 1, 0.8627451, 1,
-0.05030516, 0.03700459, 0.1180941, 0, 1, 0.8666667, 1,
-0.04898266, -0.3709183, -2.261293, 0, 1, 0.8745098, 1,
-0.04702545, 1.026564, 2.478687, 0, 1, 0.8784314, 1,
-0.04688608, -1.080683, -2.715396, 0, 1, 0.8862745, 1,
-0.04664998, -1.235869, -3.091686, 0, 1, 0.8901961, 1,
-0.04328272, -0.2758531, -1.68482, 0, 1, 0.8980392, 1,
-0.04038095, -1.082311, -2.621695, 0, 1, 0.9058824, 1,
-0.03524854, -0.0950607, -2.939074, 0, 1, 0.9098039, 1,
-0.02969893, 0.4076372, -1.262262, 0, 1, 0.9176471, 1,
-0.02932462, -0.2565236, -3.4469, 0, 1, 0.9215686, 1,
-0.02668048, -2.03226, -4.276023, 0, 1, 0.9294118, 1,
-0.02606724, 0.4972576, 1.014788, 0, 1, 0.9333333, 1,
-0.02386569, -1.011454, -6.254199, 0, 1, 0.9411765, 1,
-0.02266307, -1.741006, -1.929112, 0, 1, 0.945098, 1,
-0.01960983, -0.3815188, -2.79355, 0, 1, 0.9529412, 1,
-0.01935464, -0.1838403, -1.871741, 0, 1, 0.9568627, 1,
-0.01474981, 0.3541098, -0.1426946, 0, 1, 0.9647059, 1,
-0.01042637, 0.152439, 1.025735, 0, 1, 0.9686275, 1,
-0.005999615, -1.613983, -3.312207, 0, 1, 0.9764706, 1,
-0.001833622, 1.43297, -0.5250081, 0, 1, 0.9803922, 1,
-0.0001882952, -0.1663393, -4.498978, 0, 1, 0.9882353, 1,
0.005138399, 1.132187, -0.6032231, 0, 1, 0.9921569, 1,
0.00583166, -0.7716446, 4.428145, 0, 1, 1, 1,
0.00781189, 0.7842606, -0.6096012, 0, 0.9921569, 1, 1,
0.009926568, -1.213173, 2.258558, 0, 0.9882353, 1, 1,
0.01007803, -1.011231, 4.070713, 0, 0.9803922, 1, 1,
0.0129305, -1.304848, 3.616985, 0, 0.9764706, 1, 1,
0.01314363, -0.3854534, 2.452778, 0, 0.9686275, 1, 1,
0.01433835, 0.02563504, 1.537481, 0, 0.9647059, 1, 1,
0.01485026, 1.592878, 1.031116, 0, 0.9568627, 1, 1,
0.01888464, 0.6544057, -0.78983, 0, 0.9529412, 1, 1,
0.01981337, -0.6860082, 4.231326, 0, 0.945098, 1, 1,
0.02329166, 0.2713296, 0.5953371, 0, 0.9411765, 1, 1,
0.02490766, 0.3482058, 0.6440719, 0, 0.9333333, 1, 1,
0.02663304, 0.8005679, 1.287393, 0, 0.9294118, 1, 1,
0.02724353, -0.553849, 3.05081, 0, 0.9215686, 1, 1,
0.03190348, 0.122776, 1.009743, 0, 0.9176471, 1, 1,
0.03256308, 1.069453, -0.4542411, 0, 0.9098039, 1, 1,
0.0330564, 2.191315, 0.3762826, 0, 0.9058824, 1, 1,
0.03324096, -0.4582565, 1.642276, 0, 0.8980392, 1, 1,
0.03734365, 0.4796117, 0.3975737, 0, 0.8901961, 1, 1,
0.03776389, -1.279316, 2.961317, 0, 0.8862745, 1, 1,
0.04066458, -1.071139, 4.315224, 0, 0.8784314, 1, 1,
0.04081426, 0.7570297, 2.200302, 0, 0.8745098, 1, 1,
0.04188795, 0.5772074, -1.007629, 0, 0.8666667, 1, 1,
0.0430191, -0.2212374, 2.281241, 0, 0.8627451, 1, 1,
0.04627726, -1.655375, 5.192166, 0, 0.854902, 1, 1,
0.04859376, 2.521084, 0.4912475, 0, 0.8509804, 1, 1,
0.04900107, 0.6552752, 2.055243, 0, 0.8431373, 1, 1,
0.04945583, 0.4887003, 0.3801818, 0, 0.8392157, 1, 1,
0.0506842, 0.2338817, 0.02667412, 0, 0.8313726, 1, 1,
0.05212576, -0.7311524, 3.450209, 0, 0.827451, 1, 1,
0.05545483, 1.258584, -0.1835952, 0, 0.8196079, 1, 1,
0.05592077, 0.2794996, -0.4731678, 0, 0.8156863, 1, 1,
0.05851524, 0.1055788, -1.055617, 0, 0.8078431, 1, 1,
0.0592061, -0.4052429, 2.227061, 0, 0.8039216, 1, 1,
0.05953862, 1.199779, -1.473403, 0, 0.7960784, 1, 1,
0.06019216, 0.9888589, 1.493601, 0, 0.7882353, 1, 1,
0.06286103, 0.6380525, -0.3426768, 0, 0.7843137, 1, 1,
0.0628782, -1.230673, 1.220532, 0, 0.7764706, 1, 1,
0.06426455, 0.1817144, -0.3781261, 0, 0.772549, 1, 1,
0.06639115, -0.4750767, 3.223277, 0, 0.7647059, 1, 1,
0.06794719, -0.339139, 3.866153, 0, 0.7607843, 1, 1,
0.07074174, 0.3448462, 0.5656265, 0, 0.7529412, 1, 1,
0.0734826, -0.7638977, 4.823633, 0, 0.7490196, 1, 1,
0.07411791, 0.7565766, -0.123951, 0, 0.7411765, 1, 1,
0.07862131, 2.306445, 2.425966, 0, 0.7372549, 1, 1,
0.08478285, 1.744147, -0.2957542, 0, 0.7294118, 1, 1,
0.08554502, 1.652116, -0.7336233, 0, 0.7254902, 1, 1,
0.08574485, 1.09052, -0.4849647, 0, 0.7176471, 1, 1,
0.08630797, -0.6399195, 3.267291, 0, 0.7137255, 1, 1,
0.09203412, 0.00268863, 1.814482, 0, 0.7058824, 1, 1,
0.09427608, 1.357569, 0.7416124, 0, 0.6980392, 1, 1,
0.09468049, -1.766606, 3.081069, 0, 0.6941177, 1, 1,
0.09669808, 0.4060634, -1.769618, 0, 0.6862745, 1, 1,
0.09892472, 0.8121597, -0.4948238, 0, 0.682353, 1, 1,
0.1020363, -1.538448, 0.8999341, 0, 0.6745098, 1, 1,
0.1022121, -1.531134, 4.949496, 0, 0.6705883, 1, 1,
0.1057428, -1.661551, 1.989674, 0, 0.6627451, 1, 1,
0.1070883, -0.2213931, 3.115756, 0, 0.6588235, 1, 1,
0.1090227, 0.3966211, -1.302994, 0, 0.6509804, 1, 1,
0.1122593, -1.206209, 1.172292, 0, 0.6470588, 1, 1,
0.1127084, 1.059572, -0.4460158, 0, 0.6392157, 1, 1,
0.1129021, 0.5179577, -0.8979896, 0, 0.6352941, 1, 1,
0.1142344, -2.267074, 1.913043, 0, 0.627451, 1, 1,
0.119908, 0.4349881, 0.555001, 0, 0.6235294, 1, 1,
0.1241353, 0.6024265, -0.07530012, 0, 0.6156863, 1, 1,
0.1268775, 0.4568635, 1.048392, 0, 0.6117647, 1, 1,
0.1286463, 1.280838, 1.003986, 0, 0.6039216, 1, 1,
0.1338433, -1.680124, 3.47044, 0, 0.5960785, 1, 1,
0.1388415, 0.4462995, 0.8505548, 0, 0.5921569, 1, 1,
0.1406049, 1.841215, 0.1205302, 0, 0.5843138, 1, 1,
0.1539709, 1.402231, 1.420278, 0, 0.5803922, 1, 1,
0.1541303, 1.56285, -0.8343844, 0, 0.572549, 1, 1,
0.1547191, -1.629958, 4.484718, 0, 0.5686275, 1, 1,
0.1552202, 1.035974, 0.3402185, 0, 0.5607843, 1, 1,
0.1554143, 1.757439, 0.7573059, 0, 0.5568628, 1, 1,
0.1565391, -1.079609, 3.349626, 0, 0.5490196, 1, 1,
0.1577976, 0.4956329, 0.8566552, 0, 0.5450981, 1, 1,
0.1631524, 0.7101998, -0.1100694, 0, 0.5372549, 1, 1,
0.1712548, -0.7077473, 2.633304, 0, 0.5333334, 1, 1,
0.1712579, 0.18392, 0.6752625, 0, 0.5254902, 1, 1,
0.1715412, 1.167663, 0.178568, 0, 0.5215687, 1, 1,
0.174945, 0.2471331, 0.6911485, 0, 0.5137255, 1, 1,
0.1761355, 0.7293757, 0.7484483, 0, 0.509804, 1, 1,
0.177352, -1.146732, 2.600864, 0, 0.5019608, 1, 1,
0.1777702, 0.6196476, 0.9118608, 0, 0.4941176, 1, 1,
0.1810755, -0.1661951, 2.481152, 0, 0.4901961, 1, 1,
0.1900546, -1.938927, 2.589701, 0, 0.4823529, 1, 1,
0.1909825, -0.3283183, 3.415349, 0, 0.4784314, 1, 1,
0.1948968, -0.9651572, 3.081011, 0, 0.4705882, 1, 1,
0.1955027, 0.9038282, 0.1208432, 0, 0.4666667, 1, 1,
0.2030849, -0.06318558, 0.5186896, 0, 0.4588235, 1, 1,
0.2036736, 0.8485852, -0.3459291, 0, 0.454902, 1, 1,
0.2074085, 0.1659709, 1.821345, 0, 0.4470588, 1, 1,
0.208443, 1.069266, -0.3248819, 0, 0.4431373, 1, 1,
0.2093158, -0.5807969, 3.686576, 0, 0.4352941, 1, 1,
0.2113577, 1.283742, 0.4021719, 0, 0.4313726, 1, 1,
0.2122708, 0.1236973, -0.2532407, 0, 0.4235294, 1, 1,
0.2138949, -0.1351838, 1.372191, 0, 0.4196078, 1, 1,
0.2195528, -0.9593529, 2.715041, 0, 0.4117647, 1, 1,
0.2218799, -0.2791662, 1.857923, 0, 0.4078431, 1, 1,
0.2297645, 0.4975868, 0.8814488, 0, 0.4, 1, 1,
0.2297708, 1.450964, 1.00622, 0, 0.3921569, 1, 1,
0.2313249, 0.7889193, -1.313057, 0, 0.3882353, 1, 1,
0.2348863, -0.04384987, 1.790674, 0, 0.3803922, 1, 1,
0.2382568, 0.629217, 2.649527, 0, 0.3764706, 1, 1,
0.2418786, 0.8213529, 0.04176918, 0, 0.3686275, 1, 1,
0.2427329, -0.4811038, 2.030329, 0, 0.3647059, 1, 1,
0.245226, 0.6211983, -0.07466685, 0, 0.3568628, 1, 1,
0.2566589, 0.06675121, 0.2986633, 0, 0.3529412, 1, 1,
0.2594132, 1.664286, -0.9419023, 0, 0.345098, 1, 1,
0.2603852, 0.9905298, -0.05349982, 0, 0.3411765, 1, 1,
0.2605629, -0.830444, 1.746279, 0, 0.3333333, 1, 1,
0.2626936, 0.09219617, 0.8878928, 0, 0.3294118, 1, 1,
0.263442, 0.1516505, 1.290451, 0, 0.3215686, 1, 1,
0.2640429, 1.043513, -0.3119674, 0, 0.3176471, 1, 1,
0.2644137, 1.619794, 0.5350698, 0, 0.3098039, 1, 1,
0.2649956, 0.9346648, 0.1178006, 0, 0.3058824, 1, 1,
0.2650419, -0.2626125, 2.454038, 0, 0.2980392, 1, 1,
0.2711187, 0.3300404, 1.380268, 0, 0.2901961, 1, 1,
0.2719589, -0.595776, 2.772114, 0, 0.2862745, 1, 1,
0.27556, 0.259842, -0.3391004, 0, 0.2784314, 1, 1,
0.2797457, 0.05479867, 0.2210594, 0, 0.2745098, 1, 1,
0.2837453, -0.358391, 2.269261, 0, 0.2666667, 1, 1,
0.2895553, -1.374125, 1.370483, 0, 0.2627451, 1, 1,
0.2918442, 1.527552, 0.5864385, 0, 0.254902, 1, 1,
0.2926444, -0.1231793, 1.594041, 0, 0.2509804, 1, 1,
0.2934039, -0.03419915, 0.3094731, 0, 0.2431373, 1, 1,
0.2948661, -0.5145004, 2.997758, 0, 0.2392157, 1, 1,
0.2961901, 1.915929, 1.540061, 0, 0.2313726, 1, 1,
0.2996466, -2.543226, -0.20517, 0, 0.227451, 1, 1,
0.3046368, -0.5077416, 2.74103, 0, 0.2196078, 1, 1,
0.3087543, 2.14013, -1.653776, 0, 0.2156863, 1, 1,
0.3140737, 0.1315723, 2.584307, 0, 0.2078431, 1, 1,
0.3198031, -1.443808, 2.875418, 0, 0.2039216, 1, 1,
0.3210626, 0.7464032, 0.9605222, 0, 0.1960784, 1, 1,
0.3210899, -1.511689, 2.175175, 0, 0.1882353, 1, 1,
0.3211769, 0.8288646, 1.510024, 0, 0.1843137, 1, 1,
0.3231689, 1.134336, 0.8597877, 0, 0.1764706, 1, 1,
0.3242798, 1.118397, -2.552732, 0, 0.172549, 1, 1,
0.3279105, -0.3534442, 1.551578, 0, 0.1647059, 1, 1,
0.3331299, 1.517006, 0.8367383, 0, 0.1607843, 1, 1,
0.333972, 0.06289924, 0.2410914, 0, 0.1529412, 1, 1,
0.3351477, 0.566344, -0.6937218, 0, 0.1490196, 1, 1,
0.3401042, -0.4492769, 2.840261, 0, 0.1411765, 1, 1,
0.3413995, 0.4747264, -1.270083, 0, 0.1372549, 1, 1,
0.3427617, 1.668917, 1.300195, 0, 0.1294118, 1, 1,
0.3444094, -0.5009366, 0.9901265, 0, 0.1254902, 1, 1,
0.3458647, -1.776826, 3.030698, 0, 0.1176471, 1, 1,
0.3461956, -0.9271494, 3.200515, 0, 0.1137255, 1, 1,
0.3512626, -1.734994, 3.134681, 0, 0.1058824, 1, 1,
0.3540556, 1.073643, -0.5650166, 0, 0.09803922, 1, 1,
0.3553766, 0.1571734, 0.01930192, 0, 0.09411765, 1, 1,
0.3588434, 2.603615, 0.8850799, 0, 0.08627451, 1, 1,
0.3595582, -0.01452016, 3.594662, 0, 0.08235294, 1, 1,
0.362675, 0.07216481, 0.07408173, 0, 0.07450981, 1, 1,
0.3629535, -1.479711, 2.021188, 0, 0.07058824, 1, 1,
0.3654903, 0.5102687, 0.663698, 0, 0.0627451, 1, 1,
0.3668294, 1.249509, -1.83096, 0, 0.05882353, 1, 1,
0.3687517, 1.189872, 0.1990122, 0, 0.05098039, 1, 1,
0.3689238, 0.4779441, -0.4630094, 0, 0.04705882, 1, 1,
0.3694501, -0.5159273, 4.156728, 0, 0.03921569, 1, 1,
0.3729275, -0.9903467, 1.962426, 0, 0.03529412, 1, 1,
0.374623, -0.9938655, 3.697711, 0, 0.02745098, 1, 1,
0.3757676, -0.8840843, 0.9520816, 0, 0.02352941, 1, 1,
0.3758403, 0.2604837, 0.2772883, 0, 0.01568628, 1, 1,
0.3795488, -0.4512737, 2.579592, 0, 0.01176471, 1, 1,
0.3842888, 0.8775628, 0.8076639, 0, 0.003921569, 1, 1,
0.3940146, 0.6859236, -0.129138, 0.003921569, 0, 1, 1,
0.4009474, -0.2510085, 2.803399, 0.007843138, 0, 1, 1,
0.4028297, -0.5016963, 3.991167, 0.01568628, 0, 1, 1,
0.4092018, 0.11267, 0.2842397, 0.01960784, 0, 1, 1,
0.4103903, -1.478403, 1.996293, 0.02745098, 0, 1, 1,
0.4109792, -0.7892082, 2.893051, 0.03137255, 0, 1, 1,
0.4125184, 1.732968, -0.3937529, 0.03921569, 0, 1, 1,
0.4242011, 0.4559968, 0.4227414, 0.04313726, 0, 1, 1,
0.4276751, 1.582067, -0.2873337, 0.05098039, 0, 1, 1,
0.4354467, -0.5431983, 2.706598, 0.05490196, 0, 1, 1,
0.4423726, 1.727914, -0.4100923, 0.0627451, 0, 1, 1,
0.446297, -0.3442841, 1.410719, 0.06666667, 0, 1, 1,
0.4485431, 0.7743044, 0.3123396, 0.07450981, 0, 1, 1,
0.4509679, 0.2418974, 0.9961296, 0.07843138, 0, 1, 1,
0.4568047, -0.8549888, 4.128655, 0.08627451, 0, 1, 1,
0.4610699, 0.1113054, 1.474909, 0.09019608, 0, 1, 1,
0.4615264, -1.71199, 1.293679, 0.09803922, 0, 1, 1,
0.4669471, -0.3334382, 2.920871, 0.1058824, 0, 1, 1,
0.4720275, 0.4613894, 1.579238, 0.1098039, 0, 1, 1,
0.47412, 0.2947692, 1.854088, 0.1176471, 0, 1, 1,
0.4773691, -0.03314292, 2.195441, 0.1215686, 0, 1, 1,
0.4792039, -2.136712, 2.104927, 0.1294118, 0, 1, 1,
0.4798595, -1.205093, 2.189071, 0.1333333, 0, 1, 1,
0.4808796, -1.136838, 3.255242, 0.1411765, 0, 1, 1,
0.4811262, 3.062654, -1.539255, 0.145098, 0, 1, 1,
0.4819418, -1.18695, 2.997474, 0.1529412, 0, 1, 1,
0.4821557, -1.387021, 2.699421, 0.1568628, 0, 1, 1,
0.4826482, 0.03820994, 2.331018, 0.1647059, 0, 1, 1,
0.4842526, 0.763399, 0.2722095, 0.1686275, 0, 1, 1,
0.4857328, 0.1476742, 1.925726, 0.1764706, 0, 1, 1,
0.4872734, 0.2209938, 0.2356359, 0.1803922, 0, 1, 1,
0.4883668, -0.0874534, 1.466801, 0.1882353, 0, 1, 1,
0.4968446, 2.596915, 0.4063266, 0.1921569, 0, 1, 1,
0.5007654, 0.4931066, 2.279999, 0.2, 0, 1, 1,
0.5074083, 0.8166708, 1.886034, 0.2078431, 0, 1, 1,
0.5080177, -0.2302716, 1.342383, 0.2117647, 0, 1, 1,
0.5100579, -0.6623073, 4.479821, 0.2196078, 0, 1, 1,
0.511219, 1.000548, -0.1769639, 0.2235294, 0, 1, 1,
0.5130629, -0.5852188, 2.373722, 0.2313726, 0, 1, 1,
0.5218387, 0.168565, 2.144953, 0.2352941, 0, 1, 1,
0.5239008, -0.6715959, 2.660694, 0.2431373, 0, 1, 1,
0.5240502, -1.132329, 4.154294, 0.2470588, 0, 1, 1,
0.5254281, -0.1253396, 2.052334, 0.254902, 0, 1, 1,
0.5308438, -0.03880271, 1.9407, 0.2588235, 0, 1, 1,
0.5328803, -1.624256, 2.614087, 0.2666667, 0, 1, 1,
0.5362349, 1.151813, 1.421287, 0.2705882, 0, 1, 1,
0.5365571, 0.9790979, -1.553829, 0.2784314, 0, 1, 1,
0.5376402, 0.1489422, 3.174053, 0.282353, 0, 1, 1,
0.538809, 1.829889, 0.777118, 0.2901961, 0, 1, 1,
0.5502053, -0.7247442, 3.163838, 0.2941177, 0, 1, 1,
0.5518337, -0.7230365, 1.912425, 0.3019608, 0, 1, 1,
0.5531377, 1.901621, -0.7925317, 0.3098039, 0, 1, 1,
0.5545136, -0.6461779, 2.003513, 0.3137255, 0, 1, 1,
0.5610807, 0.2530385, 0.8125281, 0.3215686, 0, 1, 1,
0.5621766, 0.06726732, 0.4691406, 0.3254902, 0, 1, 1,
0.5684574, -2.591352, 2.843083, 0.3333333, 0, 1, 1,
0.5697574, -1.134545, 2.986845, 0.3372549, 0, 1, 1,
0.5756807, 0.1752795, -0.2002321, 0.345098, 0, 1, 1,
0.5770074, 0.478494, 0.315435, 0.3490196, 0, 1, 1,
0.577749, 0.661567, -0.09176007, 0.3568628, 0, 1, 1,
0.5779248, -0.06210671, 1.179937, 0.3607843, 0, 1, 1,
0.5796278, -0.502221, 3.7006, 0.3686275, 0, 1, 1,
0.5801922, 0.5702626, 1.714544, 0.372549, 0, 1, 1,
0.5834287, 1.278904, -1.174012, 0.3803922, 0, 1, 1,
0.5849304, -1.695995, 1.745071, 0.3843137, 0, 1, 1,
0.5865339, 0.6739241, 2.300309, 0.3921569, 0, 1, 1,
0.5943037, 0.1935192, 1.011953, 0.3960784, 0, 1, 1,
0.5987755, 1.129875, 2.521457, 0.4039216, 0, 1, 1,
0.6051167, -1.273208, 1.54616, 0.4117647, 0, 1, 1,
0.6144097, -1.329959, 1.958106, 0.4156863, 0, 1, 1,
0.6146456, -0.2746671, 3.460152, 0.4235294, 0, 1, 1,
0.6155925, 0.7996725, -1.330502, 0.427451, 0, 1, 1,
0.6183882, 0.3916817, 2.703825, 0.4352941, 0, 1, 1,
0.6218336, 0.8827434, 1.69458, 0.4392157, 0, 1, 1,
0.6279565, 1.00856, -0.9166873, 0.4470588, 0, 1, 1,
0.6317014, 1.223296, -1.73703, 0.4509804, 0, 1, 1,
0.6325995, -0.8563632, 2.763798, 0.4588235, 0, 1, 1,
0.6363492, 1.386404, -0.2974063, 0.4627451, 0, 1, 1,
0.64391, -2.553634, 2.897666, 0.4705882, 0, 1, 1,
0.6483852, -0.7559741, 4.132902, 0.4745098, 0, 1, 1,
0.649882, 0.7341002, 0.01973299, 0.4823529, 0, 1, 1,
0.6516988, 0.08340854, 0.8025941, 0.4862745, 0, 1, 1,
0.6584892, 0.512747, 0.6912832, 0.4941176, 0, 1, 1,
0.6647059, -0.9443715, 2.289778, 0.5019608, 0, 1, 1,
0.6688101, -1.148731, 1.306324, 0.5058824, 0, 1, 1,
0.6688714, -0.5036715, 4.000929, 0.5137255, 0, 1, 1,
0.6746338, 0.9520651, 1.298152, 0.5176471, 0, 1, 1,
0.6792298, 0.4830554, -0.5240617, 0.5254902, 0, 1, 1,
0.6831405, 0.7380774, 0.4733162, 0.5294118, 0, 1, 1,
0.6857724, 0.5465592, 1.07237, 0.5372549, 0, 1, 1,
0.687594, -1.516963, 2.326702, 0.5411765, 0, 1, 1,
0.6976705, -1.006719, 3.443164, 0.5490196, 0, 1, 1,
0.6999244, -0.3847525, 2.33291, 0.5529412, 0, 1, 1,
0.7028331, 0.6107923, -0.3612978, 0.5607843, 0, 1, 1,
0.7086799, -0.4372873, 2.991639, 0.5647059, 0, 1, 1,
0.7108175, 0.4095012, 0.6920654, 0.572549, 0, 1, 1,
0.7109174, -1.765758, 1.616066, 0.5764706, 0, 1, 1,
0.7168474, -1.562319, 4.287861, 0.5843138, 0, 1, 1,
0.7171595, -1.504313, 2.031627, 0.5882353, 0, 1, 1,
0.7224495, -0.5709857, 1.818359, 0.5960785, 0, 1, 1,
0.7247753, -0.9845756, 2.116045, 0.6039216, 0, 1, 1,
0.7279312, 1.067181, 1.316762, 0.6078432, 0, 1, 1,
0.7316575, 1.175368, -1.550272, 0.6156863, 0, 1, 1,
0.7371241, 0.4642043, 1.742628, 0.6196079, 0, 1, 1,
0.7382392, -0.1197535, 1.402974, 0.627451, 0, 1, 1,
0.7384568, -0.4211794, 2.752631, 0.6313726, 0, 1, 1,
0.7472765, 1.340761, -1.547959, 0.6392157, 0, 1, 1,
0.748053, -0.5257251, 2.508545, 0.6431373, 0, 1, 1,
0.755969, 1.295917, 1.180673, 0.6509804, 0, 1, 1,
0.7578723, -0.1880319, 1.228817, 0.654902, 0, 1, 1,
0.7584234, 0.09295768, 1.42273, 0.6627451, 0, 1, 1,
0.7585648, 1.095374, 0.3881292, 0.6666667, 0, 1, 1,
0.7687894, 1.242521, -0.5155975, 0.6745098, 0, 1, 1,
0.7716039, -0.5428121, 2.909057, 0.6784314, 0, 1, 1,
0.7787076, -0.1615714, 1.252799, 0.6862745, 0, 1, 1,
0.7798786, 0.6512493, -0.2127356, 0.6901961, 0, 1, 1,
0.7809089, 0.4173576, 0.6525146, 0.6980392, 0, 1, 1,
0.7811904, -0.5003515, 0.9201695, 0.7058824, 0, 1, 1,
0.7812926, 0.1826014, 9.122366e-05, 0.7098039, 0, 1, 1,
0.7821155, -0.4223279, 1.312482, 0.7176471, 0, 1, 1,
0.786163, 0.7982216, 1.31944, 0.7215686, 0, 1, 1,
0.7909067, -0.2110089, 1.837081, 0.7294118, 0, 1, 1,
0.7974685, 0.6652624, 0.1094735, 0.7333333, 0, 1, 1,
0.7988833, -1.152379, 0.8660588, 0.7411765, 0, 1, 1,
0.8038579, 0.2366223, 2.733293, 0.7450981, 0, 1, 1,
0.8090314, -0.01761882, 2.570649, 0.7529412, 0, 1, 1,
0.8142785, -0.6019409, 2.180257, 0.7568628, 0, 1, 1,
0.8151323, 0.4538379, 2.383914, 0.7647059, 0, 1, 1,
0.8308606, 0.8798335, 1.609677, 0.7686275, 0, 1, 1,
0.836966, 0.03768116, 1.81666, 0.7764706, 0, 1, 1,
0.8441423, -0.2235313, 1.037752, 0.7803922, 0, 1, 1,
0.8474545, 0.9344625, 2.668565, 0.7882353, 0, 1, 1,
0.848399, -0.1639118, 1.589468, 0.7921569, 0, 1, 1,
0.856057, 0.3450436, 0.8078362, 0.8, 0, 1, 1,
0.8583838, 1.577839, -0.6526546, 0.8078431, 0, 1, 1,
0.8641562, 0.2453933, 1.990861, 0.8117647, 0, 1, 1,
0.8677823, -0.2231169, 2.302772, 0.8196079, 0, 1, 1,
0.8698241, 1.733807, 2.326643, 0.8235294, 0, 1, 1,
0.873741, 1.955861, -0.4152473, 0.8313726, 0, 1, 1,
0.8786865, 0.9267245, 1.613957, 0.8352941, 0, 1, 1,
0.8838634, 0.3030139, 1.073463, 0.8431373, 0, 1, 1,
0.8849791, 0.7909604, 0.2675196, 0.8470588, 0, 1, 1,
0.8881053, 1.635832, 1.73193, 0.854902, 0, 1, 1,
0.9041235, 1.049747, -0.02742502, 0.8588235, 0, 1, 1,
0.9136678, -0.4225905, 2.658514, 0.8666667, 0, 1, 1,
0.9185035, -0.2006748, 1.458805, 0.8705882, 0, 1, 1,
0.9228716, 0.395089, 1.140953, 0.8784314, 0, 1, 1,
0.9234855, -0.796954, 1.728618, 0.8823529, 0, 1, 1,
0.9248648, 0.01394076, 2.409238, 0.8901961, 0, 1, 1,
0.9263165, -1.826667, 4.228829, 0.8941177, 0, 1, 1,
0.9268309, -0.09833391, 1.88251, 0.9019608, 0, 1, 1,
0.9411753, 3.476764, -0.06446422, 0.9098039, 0, 1, 1,
0.9416174, -0.4065787, 3.35361, 0.9137255, 0, 1, 1,
0.9476404, 1.128745, 0.332182, 0.9215686, 0, 1, 1,
0.947661, 0.4745435, 1.403411, 0.9254902, 0, 1, 1,
0.9497316, 0.7245209, 1.532324, 0.9333333, 0, 1, 1,
0.9508457, -0.876193, 2.165128, 0.9372549, 0, 1, 1,
0.9527858, -1.425217, 2.514137, 0.945098, 0, 1, 1,
0.9530254, -1.618625, 2.056688, 0.9490196, 0, 1, 1,
0.9552099, -0.9408352, 1.178062, 0.9568627, 0, 1, 1,
0.9612411, 0.7993666, 0.609701, 0.9607843, 0, 1, 1,
0.9632244, 1.764945, 0.009747158, 0.9686275, 0, 1, 1,
0.9668398, -1.467696, 2.15415, 0.972549, 0, 1, 1,
0.9695715, -0.4912152, 1.71417, 0.9803922, 0, 1, 1,
0.9732568, 0.4157862, 0.8350527, 0.9843137, 0, 1, 1,
0.9750913, 0.7538043, 2.058908, 0.9921569, 0, 1, 1,
0.9773052, 0.3855751, 1.119524, 0.9960784, 0, 1, 1,
0.9867905, -1.321539, 2.979028, 1, 0, 0.9960784, 1,
0.9941884, 0.6141814, 0.5881939, 1, 0, 0.9882353, 1,
0.9965389, -0.2863431, 1.416336, 1, 0, 0.9843137, 1,
0.9978455, -0.4784488, 0.8362926, 1, 0, 0.9764706, 1,
1.00265, 0.07312758, 1.908076, 1, 0, 0.972549, 1,
1.002859, -1.927511, 1.430801, 1, 0, 0.9647059, 1,
1.004804, 0.4751517, 0.4677181, 1, 0, 0.9607843, 1,
1.006627, 0.09996834, 1.586381, 1, 0, 0.9529412, 1,
1.008304, -0.1436705, 2.093128, 1, 0, 0.9490196, 1,
1.013176, 0.398529, -0.02323168, 1, 0, 0.9411765, 1,
1.014915, 0.4383757, 1.600412, 1, 0, 0.9372549, 1,
1.017048, 1.181842, 0.8685762, 1, 0, 0.9294118, 1,
1.019439, 1.472432, -0.2262894, 1, 0, 0.9254902, 1,
1.019614, 0.688123, -0.08322698, 1, 0, 0.9176471, 1,
1.021384, 0.9756719, -0.2664162, 1, 0, 0.9137255, 1,
1.022881, 1.11352, -1.819098, 1, 0, 0.9058824, 1,
1.032912, 1.674185, 1.751422, 1, 0, 0.9019608, 1,
1.03326, 0.2725348, 4.003924, 1, 0, 0.8941177, 1,
1.035941, 0.5257065, 0.3618518, 1, 0, 0.8862745, 1,
1.050041, -0.1050215, 1.751109, 1, 0, 0.8823529, 1,
1.050126, -0.4395538, 2.700657, 1, 0, 0.8745098, 1,
1.051061, -0.8681304, 3.280659, 1, 0, 0.8705882, 1,
1.052267, 0.1349159, 2.190331, 1, 0, 0.8627451, 1,
1.055328, -0.3489016, 2.358352, 1, 0, 0.8588235, 1,
1.057214, -0.4176001, 1.544277, 1, 0, 0.8509804, 1,
1.058823, 0.267586, 1.714646, 1, 0, 0.8470588, 1,
1.063637, 1.662379, -0.551686, 1, 0, 0.8392157, 1,
1.073088, -0.9662611, 2.216746, 1, 0, 0.8352941, 1,
1.073428, -1.749583, 3.156984, 1, 0, 0.827451, 1,
1.079396, -1.116778, 0.350052, 1, 0, 0.8235294, 1,
1.08713, 0.9619727, 1.072861, 1, 0, 0.8156863, 1,
1.09219, 0.4382014, 3.222902, 1, 0, 0.8117647, 1,
1.098079, -0.2142285, 1.600735, 1, 0, 0.8039216, 1,
1.109337, -1.508063, 2.826351, 1, 0, 0.7960784, 1,
1.112518, 0.7040609, 0.9889544, 1, 0, 0.7921569, 1,
1.113619, -1.462434, 3.624363, 1, 0, 0.7843137, 1,
1.114309, 2.331334, 0.2698773, 1, 0, 0.7803922, 1,
1.114401, 0.2233174, 0.1916781, 1, 0, 0.772549, 1,
1.117376, 1.253679, 0.05474665, 1, 0, 0.7686275, 1,
1.129776, 2.946366, 0.4039392, 1, 0, 0.7607843, 1,
1.13437, 1.044031, 1.390975, 1, 0, 0.7568628, 1,
1.143294, 2.168749, 0.8287837, 1, 0, 0.7490196, 1,
1.149478, 0.3992944, 2.774434, 1, 0, 0.7450981, 1,
1.149764, 1.098576, -0.719575, 1, 0, 0.7372549, 1,
1.16531, 0.4927178, 1.408821, 1, 0, 0.7333333, 1,
1.166025, 1.683639, 1.357954, 1, 0, 0.7254902, 1,
1.176334, 0.3614511, 1.508183, 1, 0, 0.7215686, 1,
1.179735, 0.9272463, 0.2186733, 1, 0, 0.7137255, 1,
1.192463, -0.1155246, 0.5603604, 1, 0, 0.7098039, 1,
1.193165, -0.08441885, 0.8723634, 1, 0, 0.7019608, 1,
1.195135, -0.1950436, 1.88296, 1, 0, 0.6941177, 1,
1.197905, -0.1546485, 3.039625, 1, 0, 0.6901961, 1,
1.205141, -0.3604991, 2.616764, 1, 0, 0.682353, 1,
1.207758, 0.4579251, 1.973721, 1, 0, 0.6784314, 1,
1.210338, -1.61104, 2.329782, 1, 0, 0.6705883, 1,
1.211512, -1.384079, 1.810499, 1, 0, 0.6666667, 1,
1.218385, -0.3998029, 2.992059, 1, 0, 0.6588235, 1,
1.226976, 1.431895, 0.3146079, 1, 0, 0.654902, 1,
1.227186, -0.2499958, 1.81816, 1, 0, 0.6470588, 1,
1.234061, -1.524834, 1.385161, 1, 0, 0.6431373, 1,
1.23532, -1.419731, 3.402997, 1, 0, 0.6352941, 1,
1.235814, -0.5657732, 1.764336, 1, 0, 0.6313726, 1,
1.237978, 0.1507889, 2.294866, 1, 0, 0.6235294, 1,
1.240905, -0.1273675, 0.9617704, 1, 0, 0.6196079, 1,
1.249155, 0.6974823, 0.8548076, 1, 0, 0.6117647, 1,
1.252192, 1.238413, 0.4986918, 1, 0, 0.6078432, 1,
1.25379, 1.071317, 0.9180034, 1, 0, 0.6, 1,
1.25407, 0.4309822, 0.3941511, 1, 0, 0.5921569, 1,
1.261064, 0.2883424, 1.197975, 1, 0, 0.5882353, 1,
1.263785, 1.351367, 0.8288392, 1, 0, 0.5803922, 1,
1.265737, -1.073066, 2.31814, 1, 0, 0.5764706, 1,
1.287875, 1.261076, 1.058239, 1, 0, 0.5686275, 1,
1.29588, -1.35006, 3.016009, 1, 0, 0.5647059, 1,
1.301353, -0.3670155, 3.474199, 1, 0, 0.5568628, 1,
1.313667, 0.5173457, 0.8514389, 1, 0, 0.5529412, 1,
1.315205, -0.9904023, 2.228125, 1, 0, 0.5450981, 1,
1.324171, 0.378387, 2.46801, 1, 0, 0.5411765, 1,
1.325787, -1.477333, 3.760616, 1, 0, 0.5333334, 1,
1.327413, -0.3988978, 3.589995, 1, 0, 0.5294118, 1,
1.336779, -0.3153861, 3.16511, 1, 0, 0.5215687, 1,
1.339244, -0.7788475, 2.76906, 1, 0, 0.5176471, 1,
1.36473, 0.7660285, 0.2563525, 1, 0, 0.509804, 1,
1.369533, -1.982517, 3.327694, 1, 0, 0.5058824, 1,
1.374255, 0.9166226, 2.674582, 1, 0, 0.4980392, 1,
1.38546, 0.1469679, 1.188303, 1, 0, 0.4901961, 1,
1.390822, -0.9398127, 1.825141, 1, 0, 0.4862745, 1,
1.40339, 0.9291961, 1.772722, 1, 0, 0.4784314, 1,
1.404251, 0.9030274, 0.1782668, 1, 0, 0.4745098, 1,
1.412793, 0.9574845, 1.65181, 1, 0, 0.4666667, 1,
1.431905, -0.5969723, 2.545458, 1, 0, 0.4627451, 1,
1.435033, -0.4671143, 2.820866, 1, 0, 0.454902, 1,
1.446579, 1.903091, 1.039038, 1, 0, 0.4509804, 1,
1.460506, -0.7008346, 1.132333, 1, 0, 0.4431373, 1,
1.464331, 0.5951099, 0.5317639, 1, 0, 0.4392157, 1,
1.48147, 0.1452334, 0.3275499, 1, 0, 0.4313726, 1,
1.482181, 1.349493, 1.51713, 1, 0, 0.427451, 1,
1.488114, -0.3006879, 3.441824, 1, 0, 0.4196078, 1,
1.489875, 0.6562133, 1.592655, 1, 0, 0.4156863, 1,
1.489996, 1.465866, 1.343023, 1, 0, 0.4078431, 1,
1.492587, 1.910877, 0.5895075, 1, 0, 0.4039216, 1,
1.500971, -0.2381499, 2.346095, 1, 0, 0.3960784, 1,
1.503523, -0.6740734, 1.53656, 1, 0, 0.3882353, 1,
1.504079, -0.5028794, 3.065614, 1, 0, 0.3843137, 1,
1.506346, -1.006345, 2.576265, 1, 0, 0.3764706, 1,
1.512222, -0.8792381, 0.842482, 1, 0, 0.372549, 1,
1.529999, -2.213144, 3.407618, 1, 0, 0.3647059, 1,
1.537422, 0.1008583, 3.074245, 1, 0, 0.3607843, 1,
1.545847, 0.551103, 0.8589157, 1, 0, 0.3529412, 1,
1.546436, 0.3374598, 2.226604, 1, 0, 0.3490196, 1,
1.548881, 0.1803901, -1.489775, 1, 0, 0.3411765, 1,
1.564186, 0.0006121636, 1.24856, 1, 0, 0.3372549, 1,
1.570982, -0.055559, 0.6830628, 1, 0, 0.3294118, 1,
1.572702, -1.480089, 2.902018, 1, 0, 0.3254902, 1,
1.586116, -1.272701, 1.872528, 1, 0, 0.3176471, 1,
1.604632, 1.071426, 0.4249464, 1, 0, 0.3137255, 1,
1.607263, -0.7713791, 1.891541, 1, 0, 0.3058824, 1,
1.628103, 1.229042, 0.9816698, 1, 0, 0.2980392, 1,
1.633018, 0.6981073, 2.179748, 1, 0, 0.2941177, 1,
1.635095, -0.7545498, 2.391758, 1, 0, 0.2862745, 1,
1.635312, 1.683832, 2.308063, 1, 0, 0.282353, 1,
1.643439, 1.124982, 1.716111, 1, 0, 0.2745098, 1,
1.644517, -0.6428265, 1.769922, 1, 0, 0.2705882, 1,
1.646103, -0.1311102, 1.878712, 1, 0, 0.2627451, 1,
1.64831, -1.067681, 3.093626, 1, 0, 0.2588235, 1,
1.652699, -0.3138108, 2.806843, 1, 0, 0.2509804, 1,
1.65828, 1.616637, 0.9571108, 1, 0, 0.2470588, 1,
1.667804, 0.1135415, 2.219728, 1, 0, 0.2392157, 1,
1.672676, -0.3039875, 0.7229627, 1, 0, 0.2352941, 1,
1.673846, 1.361255, 2.38676, 1, 0, 0.227451, 1,
1.682208, -0.5123051, 1.641688, 1, 0, 0.2235294, 1,
1.718783, 0.2970207, 1.110666, 1, 0, 0.2156863, 1,
1.733775, 1.258982, 1.911874, 1, 0, 0.2117647, 1,
1.739685, -0.3175385, 2.535171, 1, 0, 0.2039216, 1,
1.789533, 1.058695, 0.6612794, 1, 0, 0.1960784, 1,
1.806476, -0.2364076, 0.6075367, 1, 0, 0.1921569, 1,
1.810629, -0.1016904, 1.925564, 1, 0, 0.1843137, 1,
1.818998, 0.4911535, 2.332018, 1, 0, 0.1803922, 1,
1.846022, 0.06243163, 1.09863, 1, 0, 0.172549, 1,
1.847066, 2.22746, 0.2961709, 1, 0, 0.1686275, 1,
1.852632, -1.539655, 1.08228, 1, 0, 0.1607843, 1,
1.904774, -1.840798, 3.693498, 1, 0, 0.1568628, 1,
1.927856, 3.081647, 0.005747995, 1, 0, 0.1490196, 1,
1.942796, 0.7756472, 0.7905117, 1, 0, 0.145098, 1,
1.946469, 0.8152902, 1.1696, 1, 0, 0.1372549, 1,
1.989022, 0.6819323, -0.570101, 1, 0, 0.1333333, 1,
2.003677, 0.1893904, 2.111238, 1, 0, 0.1254902, 1,
2.006147, 1.252396, 2.075618, 1, 0, 0.1215686, 1,
2.053546, 0.1276352, 0.7702909, 1, 0, 0.1137255, 1,
2.076533, -0.1678363, 1.712771, 1, 0, 0.1098039, 1,
2.114717, -0.4651414, 1.44226, 1, 0, 0.1019608, 1,
2.139719, 1.238612, 0.6769624, 1, 0, 0.09411765, 1,
2.148214, 0.5496079, 0.4122826, 1, 0, 0.09019608, 1,
2.150094, -0.8499238, 2.57454, 1, 0, 0.08235294, 1,
2.160325, -1.114068, 3.550582, 1, 0, 0.07843138, 1,
2.221206, 0.5593188, 1.607826, 1, 0, 0.07058824, 1,
2.225061, 1.427918, 1.113647, 1, 0, 0.06666667, 1,
2.264441, -0.159403, 0.5997031, 1, 0, 0.05882353, 1,
2.326959, -0.7757925, -1.940139, 1, 0, 0.05490196, 1,
2.327333, 0.1101739, 0.4277309, 1, 0, 0.04705882, 1,
2.340944, 1.777597, -1.428812, 1, 0, 0.04313726, 1,
2.391493, 0.6694107, 1.522053, 1, 0, 0.03529412, 1,
2.396353, -1.15086, 2.510877, 1, 0, 0.03137255, 1,
2.452219, 0.3820217, 1.446571, 1, 0, 0.02352941, 1,
2.541837, -0.3415735, 0.3450398, 1, 0, 0.01960784, 1,
2.552522, -0.856131, 2.089036, 1, 0, 0.01176471, 1,
2.682301, -0.2021662, 0.4684885, 1, 0, 0.007843138, 1
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
-0.2435651, -3.781652, -8.194358, 0, -0.5, 0.5, 0.5,
-0.2435651, -3.781652, -8.194358, 1, -0.5, 0.5, 0.5,
-0.2435651, -3.781652, -8.194358, 1, 1.5, 0.5, 0.5,
-0.2435651, -3.781652, -8.194358, 0, 1.5, 0.5, 0.5
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
-4.1613, 0.3735507, -8.194358, 0, -0.5, 0.5, 0.5,
-4.1613, 0.3735507, -8.194358, 1, -0.5, 0.5, 0.5,
-4.1613, 0.3735507, -8.194358, 1, 1.5, 0.5, 0.5,
-4.1613, 0.3735507, -8.194358, 0, 1.5, 0.5, 0.5
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
-4.1613, -3.781652, -0.5310163, 0, -0.5, 0.5, 0.5,
-4.1613, -3.781652, -0.5310163, 1, -0.5, 0.5, 0.5,
-4.1613, -3.781652, -0.5310163, 1, 1.5, 0.5, 0.5,
-4.1613, -3.781652, -0.5310163, 0, 1.5, 0.5, 0.5
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
-3, -2.822759, -6.425895,
2, -2.822759, -6.425895,
-3, -2.822759, -6.425895,
-3, -2.982574, -6.720638,
-2, -2.822759, -6.425895,
-2, -2.982574, -6.720638,
-1, -2.822759, -6.425895,
-1, -2.982574, -6.720638,
0, -2.822759, -6.425895,
0, -2.982574, -6.720638,
1, -2.822759, -6.425895,
1, -2.982574, -6.720638,
2, -2.822759, -6.425895,
2, -2.982574, -6.720638
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
-3, -3.302205, -7.310126, 0, -0.5, 0.5, 0.5,
-3, -3.302205, -7.310126, 1, -0.5, 0.5, 0.5,
-3, -3.302205, -7.310126, 1, 1.5, 0.5, 0.5,
-3, -3.302205, -7.310126, 0, 1.5, 0.5, 0.5,
-2, -3.302205, -7.310126, 0, -0.5, 0.5, 0.5,
-2, -3.302205, -7.310126, 1, -0.5, 0.5, 0.5,
-2, -3.302205, -7.310126, 1, 1.5, 0.5, 0.5,
-2, -3.302205, -7.310126, 0, 1.5, 0.5, 0.5,
-1, -3.302205, -7.310126, 0, -0.5, 0.5, 0.5,
-1, -3.302205, -7.310126, 1, -0.5, 0.5, 0.5,
-1, -3.302205, -7.310126, 1, 1.5, 0.5, 0.5,
-1, -3.302205, -7.310126, 0, 1.5, 0.5, 0.5,
0, -3.302205, -7.310126, 0, -0.5, 0.5, 0.5,
0, -3.302205, -7.310126, 1, -0.5, 0.5, 0.5,
0, -3.302205, -7.310126, 1, 1.5, 0.5, 0.5,
0, -3.302205, -7.310126, 0, 1.5, 0.5, 0.5,
1, -3.302205, -7.310126, 0, -0.5, 0.5, 0.5,
1, -3.302205, -7.310126, 1, -0.5, 0.5, 0.5,
1, -3.302205, -7.310126, 1, 1.5, 0.5, 0.5,
1, -3.302205, -7.310126, 0, 1.5, 0.5, 0.5,
2, -3.302205, -7.310126, 0, -0.5, 0.5, 0.5,
2, -3.302205, -7.310126, 1, -0.5, 0.5, 0.5,
2, -3.302205, -7.310126, 1, 1.5, 0.5, 0.5,
2, -3.302205, -7.310126, 0, 1.5, 0.5, 0.5
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
-3.257207, -2, -6.425895,
-3.257207, 3, -6.425895,
-3.257207, -2, -6.425895,
-3.40789, -2, -6.720638,
-3.257207, -1, -6.425895,
-3.40789, -1, -6.720638,
-3.257207, 0, -6.425895,
-3.40789, 0, -6.720638,
-3.257207, 1, -6.425895,
-3.40789, 1, -6.720638,
-3.257207, 2, -6.425895,
-3.40789, 2, -6.720638,
-3.257207, 3, -6.425895,
-3.40789, 3, -6.720638
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
-3.709254, -2, -7.310126, 0, -0.5, 0.5, 0.5,
-3.709254, -2, -7.310126, 1, -0.5, 0.5, 0.5,
-3.709254, -2, -7.310126, 1, 1.5, 0.5, 0.5,
-3.709254, -2, -7.310126, 0, 1.5, 0.5, 0.5,
-3.709254, -1, -7.310126, 0, -0.5, 0.5, 0.5,
-3.709254, -1, -7.310126, 1, -0.5, 0.5, 0.5,
-3.709254, -1, -7.310126, 1, 1.5, 0.5, 0.5,
-3.709254, -1, -7.310126, 0, 1.5, 0.5, 0.5,
-3.709254, 0, -7.310126, 0, -0.5, 0.5, 0.5,
-3.709254, 0, -7.310126, 1, -0.5, 0.5, 0.5,
-3.709254, 0, -7.310126, 1, 1.5, 0.5, 0.5,
-3.709254, 0, -7.310126, 0, 1.5, 0.5, 0.5,
-3.709254, 1, -7.310126, 0, -0.5, 0.5, 0.5,
-3.709254, 1, -7.310126, 1, -0.5, 0.5, 0.5,
-3.709254, 1, -7.310126, 1, 1.5, 0.5, 0.5,
-3.709254, 1, -7.310126, 0, 1.5, 0.5, 0.5,
-3.709254, 2, -7.310126, 0, -0.5, 0.5, 0.5,
-3.709254, 2, -7.310126, 1, -0.5, 0.5, 0.5,
-3.709254, 2, -7.310126, 1, 1.5, 0.5, 0.5,
-3.709254, 2, -7.310126, 0, 1.5, 0.5, 0.5,
-3.709254, 3, -7.310126, 0, -0.5, 0.5, 0.5,
-3.709254, 3, -7.310126, 1, -0.5, 0.5, 0.5,
-3.709254, 3, -7.310126, 1, 1.5, 0.5, 0.5,
-3.709254, 3, -7.310126, 0, 1.5, 0.5, 0.5
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
-3.257207, -2.822759, -6,
-3.257207, -2.822759, 4,
-3.257207, -2.822759, -6,
-3.40789, -2.982574, -6,
-3.257207, -2.822759, -4,
-3.40789, -2.982574, -4,
-3.257207, -2.822759, -2,
-3.40789, -2.982574, -2,
-3.257207, -2.822759, 0,
-3.40789, -2.982574, 0,
-3.257207, -2.822759, 2,
-3.40789, -2.982574, 2,
-3.257207, -2.822759, 4,
-3.40789, -2.982574, 4
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
"-6",
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
-3.709254, -3.302205, -6, 0, -0.5, 0.5, 0.5,
-3.709254, -3.302205, -6, 1, -0.5, 0.5, 0.5,
-3.709254, -3.302205, -6, 1, 1.5, 0.5, 0.5,
-3.709254, -3.302205, -6, 0, 1.5, 0.5, 0.5,
-3.709254, -3.302205, -4, 0, -0.5, 0.5, 0.5,
-3.709254, -3.302205, -4, 1, -0.5, 0.5, 0.5,
-3.709254, -3.302205, -4, 1, 1.5, 0.5, 0.5,
-3.709254, -3.302205, -4, 0, 1.5, 0.5, 0.5,
-3.709254, -3.302205, -2, 0, -0.5, 0.5, 0.5,
-3.709254, -3.302205, -2, 1, -0.5, 0.5, 0.5,
-3.709254, -3.302205, -2, 1, 1.5, 0.5, 0.5,
-3.709254, -3.302205, -2, 0, 1.5, 0.5, 0.5,
-3.709254, -3.302205, 0, 0, -0.5, 0.5, 0.5,
-3.709254, -3.302205, 0, 1, -0.5, 0.5, 0.5,
-3.709254, -3.302205, 0, 1, 1.5, 0.5, 0.5,
-3.709254, -3.302205, 0, 0, 1.5, 0.5, 0.5,
-3.709254, -3.302205, 2, 0, -0.5, 0.5, 0.5,
-3.709254, -3.302205, 2, 1, -0.5, 0.5, 0.5,
-3.709254, -3.302205, 2, 1, 1.5, 0.5, 0.5,
-3.709254, -3.302205, 2, 0, 1.5, 0.5, 0.5,
-3.709254, -3.302205, 4, 0, -0.5, 0.5, 0.5,
-3.709254, -3.302205, 4, 1, -0.5, 0.5, 0.5,
-3.709254, -3.302205, 4, 1, 1.5, 0.5, 0.5,
-3.709254, -3.302205, 4, 0, 1.5, 0.5, 0.5
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
-3.257207, -2.822759, -6.425895,
-3.257207, 3.56986, -6.425895,
-3.257207, -2.822759, 5.363862,
-3.257207, 3.56986, 5.363862,
-3.257207, -2.822759, -6.425895,
-3.257207, -2.822759, 5.363862,
-3.257207, 3.56986, -6.425895,
-3.257207, 3.56986, 5.363862,
-3.257207, -2.822759, -6.425895,
2.770077, -2.822759, -6.425895,
-3.257207, -2.822759, 5.363862,
2.770077, -2.822759, 5.363862,
-3.257207, 3.56986, -6.425895,
2.770077, 3.56986, -6.425895,
-3.257207, 3.56986, 5.363862,
2.770077, 3.56986, 5.363862,
2.770077, -2.822759, -6.425895,
2.770077, 3.56986, -6.425895,
2.770077, -2.822759, 5.363862,
2.770077, 3.56986, 5.363862,
2.770077, -2.822759, -6.425895,
2.770077, -2.822759, 5.363862,
2.770077, 3.56986, -6.425895,
2.770077, 3.56986, 5.363862
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
var radius = 7.851369;
var distance = 34.93163;
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
mvMatrix.translate( 0.2435651, -0.3735507, 0.5310163 );
mvMatrix.scale( 1.408437, 1.327946, 0.7200364 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.93163);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
O-2-methoxycarbonylp<-read.table("O-2-methoxycarbonylp.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 2 did not have 5 elements
```

```r
x<-O-2-methoxycarbonylp$V2
```

```
## Error in eval(expr, envir, enclos): object 'O' not found
```

```r
y<-O-2-methoxycarbonylp$V3
```

```
## Error in eval(expr, envir, enclos): object 'O' not found
```

```r
z<-O-2-methoxycarbonylp$V4
```

```
## Error in eval(expr, envir, enclos): object 'O' not found
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
-3.169431, -1.163371, -2.693393, 0, 0, 1, 1, 1,
-2.736726, -0.1224544, -1.978669, 1, 0, 0, 1, 1,
-2.690065, -0.4651937, -4.235073, 1, 0, 0, 1, 1,
-2.609713, -1.703365, -2.306514, 1, 0, 0, 1, 1,
-2.60583, 1.715768, -1.51807, 1, 0, 0, 1, 1,
-2.494676, 2.460141, 0.6145611, 1, 0, 0, 1, 1,
-2.424659, 0.7312068, 0.399866, 0, 0, 0, 1, 1,
-2.411, -1.611797, -2.880154, 0, 0, 0, 1, 1,
-2.403482, 1.237919, -2.125564, 0, 0, 0, 1, 1,
-2.364714, -1.170801, -0.5073834, 0, 0, 0, 1, 1,
-2.346626, 0.5873984, -0.6411623, 0, 0, 0, 1, 1,
-2.33216, -0.4602938, -1.939146, 0, 0, 0, 1, 1,
-2.332033, 1.292418, -0.8221366, 0, 0, 0, 1, 1,
-2.274916, 1.062782, -0.5671583, 1, 1, 1, 1, 1,
-2.231771, -0.02219069, -2.498441, 1, 1, 1, 1, 1,
-2.189441, -0.5263621, -1.091257, 1, 1, 1, 1, 1,
-2.149302, -1.911658, -3.971726, 1, 1, 1, 1, 1,
-2.13894, 2.43964, -0.2173504, 1, 1, 1, 1, 1,
-2.131303, 0.8084621, -2.778862, 1, 1, 1, 1, 1,
-2.039482, -0.4971112, -3.551012, 1, 1, 1, 1, 1,
-2.023777, -1.938292, -1.15029, 1, 1, 1, 1, 1,
-2.005413, -0.1692487, -1.116591, 1, 1, 1, 1, 1,
-2.005325, -1.214995, -0.2161018, 1, 1, 1, 1, 1,
-2.002578, 0.9666852, -0.668387, 1, 1, 1, 1, 1,
-1.980434, 0.4849814, -0.5935741, 1, 1, 1, 1, 1,
-1.966249, -1.072806, -2.477478, 1, 1, 1, 1, 1,
-1.934422, -0.4608988, -1.012726, 1, 1, 1, 1, 1,
-1.89415, -0.9722722, -2.651039, 1, 1, 1, 1, 1,
-1.894115, -0.9697975, 0.5088705, 0, 0, 1, 1, 1,
-1.874573, 0.6157089, -0.933898, 1, 0, 0, 1, 1,
-1.859794, -1.349784, -3.219704, 1, 0, 0, 1, 1,
-1.846466, 1.017538, -2.717854, 1, 0, 0, 1, 1,
-1.836191, 2.292421, 1.519154, 1, 0, 0, 1, 1,
-1.830605, -1.019531, -2.553328, 1, 0, 0, 1, 1,
-1.816543, 0.696004, -1.746183, 0, 0, 0, 1, 1,
-1.80228, 1.122118, 0.1858044, 0, 0, 0, 1, 1,
-1.791628, 1.869825, 0.3916546, 0, 0, 0, 1, 1,
-1.79091, 0.596347, -2.072646, 0, 0, 0, 1, 1,
-1.785447, 0.03634734, -1.76247, 0, 0, 0, 1, 1,
-1.742878, -1.361572, -3.711925, 0, 0, 0, 1, 1,
-1.730828, 1.411959, -1.90236, 0, 0, 0, 1, 1,
-1.727747, 0.6576943, -2.138089, 1, 1, 1, 1, 1,
-1.717776, -0.2973847, -1.271621, 1, 1, 1, 1, 1,
-1.695406, -0.4260055, -3.531436, 1, 1, 1, 1, 1,
-1.688351, 0.3604247, -2.805317, 1, 1, 1, 1, 1,
-1.678329, -0.1644322, -1.050607, 1, 1, 1, 1, 1,
-1.672051, 0.269361, -1.785084, 1, 1, 1, 1, 1,
-1.655878, -0.8050821, -0.6931072, 1, 1, 1, 1, 1,
-1.626501, 0.766072, -1.2645, 1, 1, 1, 1, 1,
-1.625666, 1.464418, -1.588604, 1, 1, 1, 1, 1,
-1.608063, 0.3096128, -2.432427, 1, 1, 1, 1, 1,
-1.5974, -0.7550995, -3.99009, 1, 1, 1, 1, 1,
-1.589133, 0.5328324, -1.901288, 1, 1, 1, 1, 1,
-1.560677, 1.603278, -0.5821876, 1, 1, 1, 1, 1,
-1.548559, -0.3241202, -1.239631, 1, 1, 1, 1, 1,
-1.543773, -1.176928, -2.828601, 1, 1, 1, 1, 1,
-1.534847, 0.3674144, -1.069262, 0, 0, 1, 1, 1,
-1.519254, -0.04388275, -0.8374168, 1, 0, 0, 1, 1,
-1.514573, 1.452378, -0.5437193, 1, 0, 0, 1, 1,
-1.512835, 0.8755312, -2.817971, 1, 0, 0, 1, 1,
-1.509421, 0.0369552, -1.865709, 1, 0, 0, 1, 1,
-1.508662, 0.8116837, 1.334838, 1, 0, 0, 1, 1,
-1.506083, 1.407857, 0.5170129, 0, 0, 0, 1, 1,
-1.479609, 0.5079708, -0.8313457, 0, 0, 0, 1, 1,
-1.4519, 1.260457, -0.8003412, 0, 0, 0, 1, 1,
-1.446541, -0.04315345, -1.173028, 0, 0, 0, 1, 1,
-1.439848, 0.5486466, -1.573537, 0, 0, 0, 1, 1,
-1.428221, -0.8323523, -1.939068, 0, 0, 0, 1, 1,
-1.414081, 0.6229472, -1.968052, 0, 0, 0, 1, 1,
-1.409951, 0.525789, 0.06314504, 1, 1, 1, 1, 1,
-1.406978, 0.7037573, -1.473071, 1, 1, 1, 1, 1,
-1.396413, 2.561968, -0.03759493, 1, 1, 1, 1, 1,
-1.387806, -0.3429607, -3.297305, 1, 1, 1, 1, 1,
-1.386462, 1.29342, 1.278577, 1, 1, 1, 1, 1,
-1.386205, -0.5556738, -2.836632, 1, 1, 1, 1, 1,
-1.384819, -1.427416, -0.97891, 1, 1, 1, 1, 1,
-1.377091, -0.4907515, -2.070572, 1, 1, 1, 1, 1,
-1.373447, 0.6239842, 0.670495, 1, 1, 1, 1, 1,
-1.369322, -1.006502, -3.442584, 1, 1, 1, 1, 1,
-1.360542, 0.2403152, -0.07006707, 1, 1, 1, 1, 1,
-1.345798, -1.021986, -0.9994284, 1, 1, 1, 1, 1,
-1.343928, -1.942486, -1.212999, 1, 1, 1, 1, 1,
-1.342231, 0.5164661, -2.259976, 1, 1, 1, 1, 1,
-1.339412, -0.5018209, -2.457787, 1, 1, 1, 1, 1,
-1.332041, 1.095149, -1.23358, 0, 0, 1, 1, 1,
-1.317369, 0.7667909, 0.2258283, 1, 0, 0, 1, 1,
-1.314036, 0.5887658, -1.595223, 1, 0, 0, 1, 1,
-1.306879, -0.8706789, -1.808834, 1, 0, 0, 1, 1,
-1.297512, 0.3953973, 0.6696474, 1, 0, 0, 1, 1,
-1.277837, -0.8819185, -2.799992, 1, 0, 0, 1, 1,
-1.277035, 0.8481111, -1.825006, 0, 0, 0, 1, 1,
-1.26488, 0.9948097, -0.6874522, 0, 0, 0, 1, 1,
-1.264049, -1.745627, -1.811115, 0, 0, 0, 1, 1,
-1.263737, -1.269144, -2.093898, 0, 0, 0, 1, 1,
-1.257874, -0.3769602, -2.297173, 0, 0, 0, 1, 1,
-1.257832, -0.03556262, -2.48743, 0, 0, 0, 1, 1,
-1.255252, 0.3412349, -0.3447319, 0, 0, 0, 1, 1,
-1.253659, -0.5960239, -2.616264, 1, 1, 1, 1, 1,
-1.241332, 1.460895, -1.505747, 1, 1, 1, 1, 1,
-1.238056, -1.733069, -1.484676, 1, 1, 1, 1, 1,
-1.23379, -0.5005113, -3.016474, 1, 1, 1, 1, 1,
-1.224991, 0.3838432, -0.3618557, 1, 1, 1, 1, 1,
-1.213493, 0.2057234, -2.493792, 1, 1, 1, 1, 1,
-1.191856, 1.782129, 0.2624113, 1, 1, 1, 1, 1,
-1.19082, -0.6837225, -1.155255, 1, 1, 1, 1, 1,
-1.190105, 0.3938193, -2.325381, 1, 1, 1, 1, 1,
-1.186201, -1.924576, -2.77668, 1, 1, 1, 1, 1,
-1.179966, 0.1732875, -1.671213, 1, 1, 1, 1, 1,
-1.178564, 1.875312, 1.501872, 1, 1, 1, 1, 1,
-1.175841, -0.5571826, -1.556125, 1, 1, 1, 1, 1,
-1.172742, 1.260844, -0.7596947, 1, 1, 1, 1, 1,
-1.171533, -0.9287262, -2.395353, 1, 1, 1, 1, 1,
-1.170501, 0.1663103, -2.911515, 0, 0, 1, 1, 1,
-1.163241, -0.1462178, -0.3384002, 1, 0, 0, 1, 1,
-1.155816, -0.482754, -4.191439, 1, 0, 0, 1, 1,
-1.153487, -0.04836352, -0.2720293, 1, 0, 0, 1, 1,
-1.1448, 2.48832, -2.323456, 1, 0, 0, 1, 1,
-1.142531, 0.8002788, -2.524597, 1, 0, 0, 1, 1,
-1.133574, -0.9966052, -2.369102, 0, 0, 0, 1, 1,
-1.132856, -0.2308122, -1.839813, 0, 0, 0, 1, 1,
-1.125479, 0.7312743, 0.5416844, 0, 0, 0, 1, 1,
-1.118495, 0.5133901, -1.060797, 0, 0, 0, 1, 1,
-1.112386, -1.497765, -2.27452, 0, 0, 0, 1, 1,
-1.101162, 2.309911, -0.01170665, 0, 0, 0, 1, 1,
-1.098144, -1.120001, -1.670748, 0, 0, 0, 1, 1,
-1.095448, -0.2583547, -2.771658, 1, 1, 1, 1, 1,
-1.09132, 1.332175, -0.4504223, 1, 1, 1, 1, 1,
-1.091306, 0.5268284, -1.413182, 1, 1, 1, 1, 1,
-1.090921, -0.4619131, -1.027612, 1, 1, 1, 1, 1,
-1.084175, 0.1956544, -2.499606, 1, 1, 1, 1, 1,
-1.083458, -1.3877, -2.819501, 1, 1, 1, 1, 1,
-1.083447, 0.9898509, -0.4980674, 1, 1, 1, 1, 1,
-1.079579, -0.6739773, -3.123244, 1, 1, 1, 1, 1,
-1.078744, -0.3656854, -2.531953, 1, 1, 1, 1, 1,
-1.073752, -1.04892, -2.3426, 1, 1, 1, 1, 1,
-1.072076, -0.074018, -0.4137263, 1, 1, 1, 1, 1,
-1.068102, 0.8497033, -1.725456, 1, 1, 1, 1, 1,
-1.065021, -1.071279, -1.646362, 1, 1, 1, 1, 1,
-1.062016, -1.054774, -3.808715, 1, 1, 1, 1, 1,
-1.060543, -0.6108771, -1.837974, 1, 1, 1, 1, 1,
-1.059071, 0.3748153, -1.790382, 0, 0, 1, 1, 1,
-1.041235, 0.3993495, -0.7369406, 1, 0, 0, 1, 1,
-1.028132, -1.17888, -1.843668, 1, 0, 0, 1, 1,
-1.02789, -0.7186249, -3.336561, 1, 0, 0, 1, 1,
-1.020141, -0.1155568, -1.45865, 1, 0, 0, 1, 1,
-1.0189, -0.8410854, -1.645949, 1, 0, 0, 1, 1,
-0.9997547, 0.2699279, -1.205068, 0, 0, 0, 1, 1,
-0.9931676, -1.495814, -3.224553, 0, 0, 0, 1, 1,
-0.9894579, -0.09643617, -1.258078, 0, 0, 0, 1, 1,
-0.9870849, 1.056101, 2.218725, 0, 0, 0, 1, 1,
-0.981169, -0.6428059, -2.618427, 0, 0, 0, 1, 1,
-0.9770224, -0.8471127, -2.809672, 0, 0, 0, 1, 1,
-0.9622734, 1.162271, -2.390864, 0, 0, 0, 1, 1,
-0.958975, 0.3859791, -2.701533, 1, 1, 1, 1, 1,
-0.9575981, -0.1226512, -3.138584, 1, 1, 1, 1, 1,
-0.9560521, -0.4114887, -2.19049, 1, 1, 1, 1, 1,
-0.9458008, -0.6800588, -0.9710537, 1, 1, 1, 1, 1,
-0.9266422, -1.186017, -2.752123, 1, 1, 1, 1, 1,
-0.9264973, -1.538734, -3.026458, 1, 1, 1, 1, 1,
-0.9239063, -0.7329944, -2.696391, 1, 1, 1, 1, 1,
-0.9230727, -0.3049931, -2.398443, 1, 1, 1, 1, 1,
-0.9192888, 0.2218019, -0.1908843, 1, 1, 1, 1, 1,
-0.9158561, -0.09159001, -2.16221, 1, 1, 1, 1, 1,
-0.9156065, 0.7180024, -1.899749, 1, 1, 1, 1, 1,
-0.9139618, -0.876956, -3.427199, 1, 1, 1, 1, 1,
-0.9133416, -0.5513492, -2.961976, 1, 1, 1, 1, 1,
-0.9125359, 1.752919, -0.1660359, 1, 1, 1, 1, 1,
-0.908525, 1.713245, -0.6418958, 1, 1, 1, 1, 1,
-0.9055136, -0.2159944, 0.05932345, 0, 0, 1, 1, 1,
-0.9052953, 0.2608229, -1.240909, 1, 0, 0, 1, 1,
-0.9050956, -0.7617611, -2.762842, 1, 0, 0, 1, 1,
-0.9034604, 0.7743665, -1.890784, 1, 0, 0, 1, 1,
-0.9019303, 0.2275232, -1.562024, 1, 0, 0, 1, 1,
-0.90106, 0.1466824, -1.496982, 1, 0, 0, 1, 1,
-0.8994659, 1.170314, -3.071715, 0, 0, 0, 1, 1,
-0.8973185, -0.2244137, -2.151436, 0, 0, 0, 1, 1,
-0.8964593, 0.3056726, -1.329498, 0, 0, 0, 1, 1,
-0.8875712, 0.0807173, -1.694115, 0, 0, 0, 1, 1,
-0.8861911, -0.7696623, -1.060653, 0, 0, 0, 1, 1,
-0.8827996, 0.1035404, -0.9264466, 0, 0, 0, 1, 1,
-0.8800826, -0.5789832, -0.6127464, 0, 0, 0, 1, 1,
-0.8759726, -0.2202097, -1.978202, 1, 1, 1, 1, 1,
-0.8729596, 1.306197, -2.120303, 1, 1, 1, 1, 1,
-0.8692517, -1.453957, -3.961303, 1, 1, 1, 1, 1,
-0.8691545, 0.01919357, -0.7978393, 1, 1, 1, 1, 1,
-0.8685483, -2.236821, -3.163673, 1, 1, 1, 1, 1,
-0.8677644, -1.094119, -3.523946, 1, 1, 1, 1, 1,
-0.86658, 0.0536034, -2.063006, 1, 1, 1, 1, 1,
-0.861714, -0.20659, -1.349956, 1, 1, 1, 1, 1,
-0.8612943, -0.7760182, -1.63021, 1, 1, 1, 1, 1,
-0.8596398, -1.579681, -0.78931, 1, 1, 1, 1, 1,
-0.8579767, -0.4218979, -4.02369, 1, 1, 1, 1, 1,
-0.8566129, 1.356959, -1.456549, 1, 1, 1, 1, 1,
-0.8453804, 0.4807726, -2.369258, 1, 1, 1, 1, 1,
-0.8453248, 0.824886, -0.7386112, 1, 1, 1, 1, 1,
-0.8381746, 0.7768721, -0.18992, 1, 1, 1, 1, 1,
-0.8376619, 0.7139614, -0.5228832, 0, 0, 1, 1, 1,
-0.837574, 0.3623227, -1.615156, 1, 0, 0, 1, 1,
-0.8338174, -0.8455774, -3.235321, 1, 0, 0, 1, 1,
-0.832331, 0.4896709, -0.1402588, 1, 0, 0, 1, 1,
-0.8279845, 1.039943, -0.8266626, 1, 0, 0, 1, 1,
-0.8268742, 0.2117464, -1.966558, 1, 0, 0, 1, 1,
-0.8243554, -0.3915023, -1.129289, 0, 0, 0, 1, 1,
-0.8215232, 0.2258808, -1.696041, 0, 0, 0, 1, 1,
-0.817828, 0.1607874, -0.687105, 0, 0, 0, 1, 1,
-0.8156738, 1.692342, -0.06408142, 0, 0, 0, 1, 1,
-0.7981623, 1.286089, -0.003580667, 0, 0, 0, 1, 1,
-0.7932795, 0.8501289, -1.591242, 0, 0, 0, 1, 1,
-0.7886563, 0.8148736, -0.1820974, 0, 0, 0, 1, 1,
-0.7884305, -1.299054, -2.641978, 1, 1, 1, 1, 1,
-0.7862135, 0.3746026, -2.056741, 1, 1, 1, 1, 1,
-0.7812175, 1.839642, -0.03021771, 1, 1, 1, 1, 1,
-0.7803263, 1.019233, -0.6733261, 1, 1, 1, 1, 1,
-0.7801265, 0.6677068, -2.289919, 1, 1, 1, 1, 1,
-0.7727306, 0.4741981, -0.663408, 1, 1, 1, 1, 1,
-0.7656724, 1.460677, -1.57919, 1, 1, 1, 1, 1,
-0.7615866, 1.27188, -1.621468, 1, 1, 1, 1, 1,
-0.7549919, -1.585759, -1.391032, 1, 1, 1, 1, 1,
-0.7525936, 0.4338399, -1.651277, 1, 1, 1, 1, 1,
-0.7523211, 0.9454551, -0.8359022, 1, 1, 1, 1, 1,
-0.7472719, 0.5635526, 0.1499481, 1, 1, 1, 1, 1,
-0.7446548, -1.453964, -1.107803, 1, 1, 1, 1, 1,
-0.7431822, 0.627948, -2.171611, 1, 1, 1, 1, 1,
-0.7393125, -0.7750869, -1.793627, 1, 1, 1, 1, 1,
-0.7392644, -1.119696, -1.353438, 0, 0, 1, 1, 1,
-0.7374454, -2.118986, -3.467052, 1, 0, 0, 1, 1,
-0.736986, 0.1842661, -1.484989, 1, 0, 0, 1, 1,
-0.733444, 0.3396564, -1.19611, 1, 0, 0, 1, 1,
-0.7234446, 0.5346258, -1.7676, 1, 0, 0, 1, 1,
-0.7232911, 0.778924, -1.178868, 1, 0, 0, 1, 1,
-0.7152348, 1.457455, -2.097361, 0, 0, 0, 1, 1,
-0.7141147, 0.3850214, -1.401474, 0, 0, 0, 1, 1,
-0.7130347, 0.2290087, -2.113445, 0, 0, 0, 1, 1,
-0.7087703, -0.5565838, -1.418812, 0, 0, 0, 1, 1,
-0.7081981, 0.3342898, -1.246403, 0, 0, 0, 1, 1,
-0.7071455, 0.9555777, -2.720047, 0, 0, 0, 1, 1,
-0.7004821, 0.1131788, -0.802156, 0, 0, 0, 1, 1,
-0.7002405, -0.6069713, -0.6958956, 1, 1, 1, 1, 1,
-0.6972327, -0.3001132, -1.76935, 1, 1, 1, 1, 1,
-0.6909111, 0.1776915, -2.002641, 1, 1, 1, 1, 1,
-0.6902537, -0.9022149, -3.949314, 1, 1, 1, 1, 1,
-0.6891294, -1.877899, -2.212082, 1, 1, 1, 1, 1,
-0.6843681, 1.393387, -2.058685, 1, 1, 1, 1, 1,
-0.6832693, 0.9668022, -2.689689, 1, 1, 1, 1, 1,
-0.6827701, -0.005114097, -1.625577, 1, 1, 1, 1, 1,
-0.6824953, -0.3325887, -0.5574327, 1, 1, 1, 1, 1,
-0.6711528, 0.9282994, -0.3910561, 1, 1, 1, 1, 1,
-0.6701704, -0.7459823, -1.984105, 1, 1, 1, 1, 1,
-0.6686566, 1.304572, -1.634529, 1, 1, 1, 1, 1,
-0.6685706, 1.217792, -2.070148, 1, 1, 1, 1, 1,
-0.6683707, 0.3919316, -1.011768, 1, 1, 1, 1, 1,
-0.6647927, -1.381763, -3.112595, 1, 1, 1, 1, 1,
-0.6604576, 0.2735668, -0.0422603, 0, 0, 1, 1, 1,
-0.6594684, 0.4533608, -2.197553, 1, 0, 0, 1, 1,
-0.6560059, 1.618386, -1.044299, 1, 0, 0, 1, 1,
-0.654569, 0.5678427, -1.214926, 1, 0, 0, 1, 1,
-0.6541101, 0.4467776, -1.136014, 1, 0, 0, 1, 1,
-0.6528464, 2.29844, 0.1917051, 1, 0, 0, 1, 1,
-0.6469631, 1.067506, -1.365811, 0, 0, 0, 1, 1,
-0.6435864, -0.9637479, -3.327093, 0, 0, 0, 1, 1,
-0.639441, 1.886918, -0.5776867, 0, 0, 0, 1, 1,
-0.6377838, 0.7280005, -0.898595, 0, 0, 0, 1, 1,
-0.637723, 0.6755388, 0.3249681, 0, 0, 0, 1, 1,
-0.6314256, -0.8641683, -3.49968, 0, 0, 0, 1, 1,
-0.6310506, 0.8411558, -0.908082, 0, 0, 0, 1, 1,
-0.63025, 0.01364393, -2.405726, 1, 1, 1, 1, 1,
-0.6248106, -1.29828, -3.25421, 1, 1, 1, 1, 1,
-0.6230202, -0.9115936, -2.837994, 1, 1, 1, 1, 1,
-0.6208012, -0.5833161, -0.7574506, 1, 1, 1, 1, 1,
-0.620538, -0.7321647, -1.865037, 1, 1, 1, 1, 1,
-0.6200594, -1.218794, -2.152336, 1, 1, 1, 1, 1,
-0.6137304, -0.6228369, -1.488467, 1, 1, 1, 1, 1,
-0.6126099, -1.139999, -4.496317, 1, 1, 1, 1, 1,
-0.6115467, 0.1718301, 0.5667188, 1, 1, 1, 1, 1,
-0.6084939, -2.395882, -2.528013, 1, 1, 1, 1, 1,
-0.6007555, -0.5620911, -4.463312, 1, 1, 1, 1, 1,
-0.5980217, -0.3484617, -1.906942, 1, 1, 1, 1, 1,
-0.5977759, -1.515773, -2.544406, 1, 1, 1, 1, 1,
-0.5950862, 2.146659, 0.6051845, 1, 1, 1, 1, 1,
-0.5948479, 0.06778028, -2.509642, 1, 1, 1, 1, 1,
-0.5945089, 1.007703, -0.6707165, 0, 0, 1, 1, 1,
-0.5943972, 0.4595662, -1.230878, 1, 0, 0, 1, 1,
-0.5943263, 0.08331703, -2.336581, 1, 0, 0, 1, 1,
-0.5929878, -0.1738854, -1.798503, 1, 0, 0, 1, 1,
-0.5907573, -1.28963, -3.770933, 1, 0, 0, 1, 1,
-0.5870906, 0.2764249, -2.764655, 1, 0, 0, 1, 1,
-0.5842482, 0.003118417, -2.563905, 0, 0, 0, 1, 1,
-0.5767061, -1.027571, -4.059413, 0, 0, 0, 1, 1,
-0.5742745, 1.16401, -1.736935, 0, 0, 0, 1, 1,
-0.5720426, -1.099026, -2.087517, 0, 0, 0, 1, 1,
-0.5684366, -2.001382, -2.988403, 0, 0, 0, 1, 1,
-0.5676194, -0.02011771, -1.125629, 0, 0, 0, 1, 1,
-0.5662512, 0.4961055, -2.129675, 0, 0, 0, 1, 1,
-0.5635375, -1.139311, -2.549719, 1, 1, 1, 1, 1,
-0.5619933, -0.2820735, -2.469256, 1, 1, 1, 1, 1,
-0.560158, 0.2537457, -0.3767415, 1, 1, 1, 1, 1,
-0.5575308, 0.3127834, -1.801772, 1, 1, 1, 1, 1,
-0.5535429, 0.4299996, 0.6295428, 1, 1, 1, 1, 1,
-0.5532777, 1.621688, 0.5557938, 1, 1, 1, 1, 1,
-0.5496281, -0.7147951, -2.50235, 1, 1, 1, 1, 1,
-0.5486523, 0.2820066, 0.4058072, 1, 1, 1, 1, 1,
-0.5450779, 1.778668, -0.6957332, 1, 1, 1, 1, 1,
-0.5437009, 0.3638202, -2.138278, 1, 1, 1, 1, 1,
-0.5386215, -0.5884863, -0.7614225, 1, 1, 1, 1, 1,
-0.5315214, 0.8697853, -1.00409, 1, 1, 1, 1, 1,
-0.5188131, 1.663094, 0.9248945, 1, 1, 1, 1, 1,
-0.5142886, -0.3366661, -0.6699162, 1, 1, 1, 1, 1,
-0.513574, -0.4572145, -2.84963, 1, 1, 1, 1, 1,
-0.5131931, -0.1665953, -0.3659364, 0, 0, 1, 1, 1,
-0.5127077, 1.585813, -0.02588899, 1, 0, 0, 1, 1,
-0.5123493, 0.8832428, -0.8886225, 1, 0, 0, 1, 1,
-0.5121896, 0.6566622, -0.9084873, 1, 0, 0, 1, 1,
-0.5098616, -0.2292213, -2.186091, 1, 0, 0, 1, 1,
-0.509214, -0.1908739, -2.014998, 1, 0, 0, 1, 1,
-0.5060434, 1.8125, -0.9531205, 0, 0, 0, 1, 1,
-0.5052354, -1.301936, -1.132265, 0, 0, 0, 1, 1,
-0.5045271, 0.8457995, 0.7126732, 0, 0, 0, 1, 1,
-0.5039495, -1.920866, -4.70368, 0, 0, 0, 1, 1,
-0.5006228, -0.272159, -3.609258, 0, 0, 0, 1, 1,
-0.4954587, 2.033025, -0.7087628, 0, 0, 0, 1, 1,
-0.4929309, 0.5535138, -0.1811804, 0, 0, 0, 1, 1,
-0.4907274, -0.8537356, -2.03891, 1, 1, 1, 1, 1,
-0.4839814, 1.166648, 0.8504761, 1, 1, 1, 1, 1,
-0.474771, -0.1441288, -2.102599, 1, 1, 1, 1, 1,
-0.4739154, -1.230661, -3.543406, 1, 1, 1, 1, 1,
-0.4715534, 0.2318879, -0.6507836, 1, 1, 1, 1, 1,
-0.4687144, -2.729662, -4.1544, 1, 1, 1, 1, 1,
-0.4643214, -0.4886216, -1.944459, 1, 1, 1, 1, 1,
-0.4637036, -0.4059558, -3.02819, 1, 1, 1, 1, 1,
-0.463305, -0.01576624, -0.7944465, 1, 1, 1, 1, 1,
-0.4594332, -0.2396047, -0.4734745, 1, 1, 1, 1, 1,
-0.4548571, -0.5548778, -0.7190787, 1, 1, 1, 1, 1,
-0.4534746, 0.2372237, -0.7623829, 1, 1, 1, 1, 1,
-0.4465423, 1.169459, 0.7153406, 1, 1, 1, 1, 1,
-0.4406547, 0.4691608, 0.709675, 1, 1, 1, 1, 1,
-0.4406514, 0.7747052, 1.362607, 1, 1, 1, 1, 1,
-0.4402091, 2.17691, -0.8252459, 0, 0, 1, 1, 1,
-0.4375716, 1.011797, -0.4239064, 1, 0, 0, 1, 1,
-0.4353377, -1.005577, -3.562145, 1, 0, 0, 1, 1,
-0.4338427, -0.9603351, -0.811988, 1, 0, 0, 1, 1,
-0.4306779, 0.2825722, -0.9445156, 1, 0, 0, 1, 1,
-0.4290941, 1.208945, -0.6742693, 1, 0, 0, 1, 1,
-0.4287601, 1.494599, -0.2944157, 0, 0, 0, 1, 1,
-0.4236699, -0.9055179, -3.627795, 0, 0, 0, 1, 1,
-0.4185154, 0.3559517, -0.3075284, 0, 0, 0, 1, 1,
-0.4169285, -2.004704, -3.511193, 0, 0, 0, 1, 1,
-0.4167536, 1.048472, -0.4470895, 0, 0, 0, 1, 1,
-0.416419, 0.4955247, -1.374535, 0, 0, 0, 1, 1,
-0.4139147, -1.341294, -3.824574, 0, 0, 0, 1, 1,
-0.4118581, 0.7602161, -0.7103953, 1, 1, 1, 1, 1,
-0.4096355, 0.402181, -1.491389, 1, 1, 1, 1, 1,
-0.4070967, -0.291278, -1.180338, 1, 1, 1, 1, 1,
-0.4039453, -0.967049, -4.01691, 1, 1, 1, 1, 1,
-0.400226, -0.818416, -4.155991, 1, 1, 1, 1, 1,
-0.3953376, 0.7311854, -0.3837841, 1, 1, 1, 1, 1,
-0.3951776, 0.9409013, 0.2502095, 1, 1, 1, 1, 1,
-0.3929928, -0.6095886, -3.291803, 1, 1, 1, 1, 1,
-0.3864311, -0.5359685, -1.732701, 1, 1, 1, 1, 1,
-0.386297, -1.468537, -3.600499, 1, 1, 1, 1, 1,
-0.3862197, -1.209914, -4.347077, 1, 1, 1, 1, 1,
-0.3800078, 0.1779001, -2.102465, 1, 1, 1, 1, 1,
-0.3668841, 0.750764, 1.031316, 1, 1, 1, 1, 1,
-0.365905, 0.2498749, -3.626421, 1, 1, 1, 1, 1,
-0.3616814, 0.9870181, -1.876755, 1, 1, 1, 1, 1,
-0.3575415, -0.1971439, -1.137652, 0, 0, 1, 1, 1,
-0.3559796, 2.338743, 0.3333107, 1, 0, 0, 1, 1,
-0.3528892, -0.3636156, -1.559686, 1, 0, 0, 1, 1,
-0.3492812, -0.5160627, -1.904587, 1, 0, 0, 1, 1,
-0.34903, 1.131781, -0.111936, 1, 0, 0, 1, 1,
-0.3479981, -1.086435, -3.861839, 1, 0, 0, 1, 1,
-0.347317, 1.302137, -0.3731711, 0, 0, 0, 1, 1,
-0.3431116, -2.515384, -1.850256, 0, 0, 0, 1, 1,
-0.3419304, 1.38347, -1.627372, 0, 0, 0, 1, 1,
-0.3411141, -0.01049528, -1.958395, 0, 0, 0, 1, 1,
-0.3371984, 0.894211, -0.6559947, 0, 0, 0, 1, 1,
-0.3352915, 0.7631588, 1.103889, 0, 0, 0, 1, 1,
-0.3336363, 1.699877, -0.06258162, 0, 0, 0, 1, 1,
-0.3335609, -0.233978, -1.622101, 1, 1, 1, 1, 1,
-0.3278526, 1.203382, -0.3405527, 1, 1, 1, 1, 1,
-0.3248944, 2.627073, 0.2033547, 1, 1, 1, 1, 1,
-0.3219328, 1.46936, 0.2984497, 1, 1, 1, 1, 1,
-0.3158437, 0.1017396, -1.474668, 1, 1, 1, 1, 1,
-0.3095849, -0.8775025, -2.309697, 1, 1, 1, 1, 1,
-0.3089314, -1.073676, -3.828755, 1, 1, 1, 1, 1,
-0.3072092, -0.08129296, -2.955621, 1, 1, 1, 1, 1,
-0.3064919, 0.7396653, -1.498541, 1, 1, 1, 1, 1,
-0.3062456, 0.5161895, -1.472618, 1, 1, 1, 1, 1,
-0.3027294, -0.01901577, 0.6290413, 1, 1, 1, 1, 1,
-0.3003001, -2.405124, -3.164706, 1, 1, 1, 1, 1,
-0.2918773, -1.035949, -2.097035, 1, 1, 1, 1, 1,
-0.2918433, 0.4682747, 0.05260623, 1, 1, 1, 1, 1,
-0.2895574, -1.395693, -4.511434, 1, 1, 1, 1, 1,
-0.289063, -1.44456, -3.373973, 0, 0, 1, 1, 1,
-0.28787, 0.4144432, -0.404807, 1, 0, 0, 1, 1,
-0.272934, 0.03149451, -1.037523, 1, 0, 0, 1, 1,
-0.2683302, -0.3628519, -2.09554, 1, 0, 0, 1, 1,
-0.2611092, -0.3383874, -1.89795, 1, 0, 0, 1, 1,
-0.258643, 0.02940125, -0.4028787, 1, 0, 0, 1, 1,
-0.258174, -1.582239, -1.470726, 0, 0, 0, 1, 1,
-0.2554612, 0.4416808, 1.242963, 0, 0, 0, 1, 1,
-0.2472838, 1.406579, -0.7410963, 0, 0, 0, 1, 1,
-0.2432709, -0.7235515, -2.944358, 0, 0, 0, 1, 1,
-0.243075, 0.3255299, -0.5024393, 0, 0, 0, 1, 1,
-0.2417845, 1.656278, -0.7255455, 0, 0, 0, 1, 1,
-0.2410731, 0.3198538, -0.6432052, 0, 0, 0, 1, 1,
-0.2400675, 0.767679, -0.3380835, 1, 1, 1, 1, 1,
-0.2396896, 0.6673545, 0.5610495, 1, 1, 1, 1, 1,
-0.2382223, 0.7852651, 0.1540403, 1, 1, 1, 1, 1,
-0.236064, -1.076521, -1.336808, 1, 1, 1, 1, 1,
-0.234405, 0.1845032, -0.6284779, 1, 1, 1, 1, 1,
-0.2333977, 1.135162, -0.2408065, 1, 1, 1, 1, 1,
-0.2305832, -0.122775, -1.792334, 1, 1, 1, 1, 1,
-0.229235, -0.3820367, -3.674071, 1, 1, 1, 1, 1,
-0.2288878, 1.156967, -0.596658, 1, 1, 1, 1, 1,
-0.2245381, -0.04093862, -2.127704, 1, 1, 1, 1, 1,
-0.2191268, -0.4611126, -3.755417, 1, 1, 1, 1, 1,
-0.2184966, 0.8152792, -0.2901227, 1, 1, 1, 1, 1,
-0.2177752, 0.5207526, -0.114838, 1, 1, 1, 1, 1,
-0.2117034, -1.700166, -4.155423, 1, 1, 1, 1, 1,
-0.1987706, -1.834811, -1.620176, 1, 1, 1, 1, 1,
-0.1970449, 1.434636, -1.067612, 0, 0, 1, 1, 1,
-0.1952231, 1.43464, -0.5880159, 1, 0, 0, 1, 1,
-0.1948294, 0.0208561, -1.140417, 1, 0, 0, 1, 1,
-0.1921305, -1.225218, -2.344348, 1, 0, 0, 1, 1,
-0.188415, -0.3037655, -2.507851, 1, 0, 0, 1, 1,
-0.1872964, 0.570313, 1.35909, 1, 0, 0, 1, 1,
-0.1827127, 2.043668, -0.7155712, 0, 0, 0, 1, 1,
-0.1796079, -1.110931, -3.739382, 0, 0, 0, 1, 1,
-0.1763247, -0.09445952, -2.011776, 0, 0, 0, 1, 1,
-0.1731346, 0.5325461, 0.2996765, 0, 0, 0, 1, 1,
-0.1727791, 0.6135362, -0.04226602, 0, 0, 0, 1, 1,
-0.1672241, 0.490445, 0.5742369, 0, 0, 0, 1, 1,
-0.1660857, -0.9899254, -5.180202, 0, 0, 0, 1, 1,
-0.1610207, 0.7265948, -0.4251945, 1, 1, 1, 1, 1,
-0.155847, -0.9920527, -1.28247, 1, 1, 1, 1, 1,
-0.1527632, 0.8916041, 0.8768587, 1, 1, 1, 1, 1,
-0.1474036, -0.08915349, -0.4352384, 1, 1, 1, 1, 1,
-0.1373014, 1.262164, -0.9566264, 1, 1, 1, 1, 1,
-0.1303023, -0.7938679, -4.619194, 1, 1, 1, 1, 1,
-0.1286463, 1.286929, 0.6491973, 1, 1, 1, 1, 1,
-0.1281341, 0.1362967, 0.3658478, 1, 1, 1, 1, 1,
-0.1281175, 1.979648, -0.2284007, 1, 1, 1, 1, 1,
-0.1254946, -0.08535167, -3.109733, 1, 1, 1, 1, 1,
-0.123411, -0.3414987, -2.90315, 1, 1, 1, 1, 1,
-0.1216667, -1.376972, -3.691036, 1, 1, 1, 1, 1,
-0.1195131, 1.250463, -0.4913408, 1, 1, 1, 1, 1,
-0.1177338, 0.6149454, -1.591746, 1, 1, 1, 1, 1,
-0.1164003, -0.1473798, -1.869511, 1, 1, 1, 1, 1,
-0.1161544, 1.048832, 0.5822696, 0, 0, 1, 1, 1,
-0.1130961, 0.7377021, 0.4914329, 1, 0, 0, 1, 1,
-0.1113043, -0.9315155, -1.844786, 1, 0, 0, 1, 1,
-0.1097713, -1.028673, -4.282748, 1, 0, 0, 1, 1,
-0.1088935, 0.3068651, -1.33744, 1, 0, 0, 1, 1,
-0.1086415, 0.4062898, -0.6743824, 1, 0, 0, 1, 1,
-0.1076399, 0.2606609, -2.087181, 0, 0, 0, 1, 1,
-0.1059778, 0.2711323, -0.2341941, 0, 0, 0, 1, 1,
-0.1051392, -0.1147465, -2.950326, 0, 0, 0, 1, 1,
-0.1023201, -0.163658, -2.288244, 0, 0, 0, 1, 1,
-0.100988, -0.3316034, -3.758327, 0, 0, 0, 1, 1,
-0.09820703, 0.9927406, 0.5795188, 0, 0, 0, 1, 1,
-0.09117623, 0.3976623, 0.6769126, 0, 0, 0, 1, 1,
-0.0855598, -0.9159766, -3.24125, 1, 1, 1, 1, 1,
-0.08506175, -0.7643763, -1.458567, 1, 1, 1, 1, 1,
-0.08252562, 0.05918424, -0.5669917, 1, 1, 1, 1, 1,
-0.08194667, -0.2179814, -2.868535, 1, 1, 1, 1, 1,
-0.08171455, 0.2423616, -1.010817, 1, 1, 1, 1, 1,
-0.08114822, -0.4043912, -3.074762, 1, 1, 1, 1, 1,
-0.07843252, 0.8312255, -1.42382, 1, 1, 1, 1, 1,
-0.07515763, -1.447575, -4.839708, 1, 1, 1, 1, 1,
-0.07467563, 0.3906243, 0.6646573, 1, 1, 1, 1, 1,
-0.06590215, 0.6729031, 1.7429, 1, 1, 1, 1, 1,
-0.0620665, -1.027388, -4.213599, 1, 1, 1, 1, 1,
-0.06101828, -0.7646382, -2.218633, 1, 1, 1, 1, 1,
-0.05930725, -1.500463, -2.737231, 1, 1, 1, 1, 1,
-0.05930398, 0.4701689, 0.4249116, 1, 1, 1, 1, 1,
-0.05902892, -0.9630232, -4.065719, 1, 1, 1, 1, 1,
-0.05786566, 0.3055668, 0.4514866, 0, 0, 1, 1, 1,
-0.05706428, 1.934709, 0.5979693, 1, 0, 0, 1, 1,
-0.05030516, 0.03700459, 0.1180941, 1, 0, 0, 1, 1,
-0.04898266, -0.3709183, -2.261293, 1, 0, 0, 1, 1,
-0.04702545, 1.026564, 2.478687, 1, 0, 0, 1, 1,
-0.04688608, -1.080683, -2.715396, 1, 0, 0, 1, 1,
-0.04664998, -1.235869, -3.091686, 0, 0, 0, 1, 1,
-0.04328272, -0.2758531, -1.68482, 0, 0, 0, 1, 1,
-0.04038095, -1.082311, -2.621695, 0, 0, 0, 1, 1,
-0.03524854, -0.0950607, -2.939074, 0, 0, 0, 1, 1,
-0.02969893, 0.4076372, -1.262262, 0, 0, 0, 1, 1,
-0.02932462, -0.2565236, -3.4469, 0, 0, 0, 1, 1,
-0.02668048, -2.03226, -4.276023, 0, 0, 0, 1, 1,
-0.02606724, 0.4972576, 1.014788, 1, 1, 1, 1, 1,
-0.02386569, -1.011454, -6.254199, 1, 1, 1, 1, 1,
-0.02266307, -1.741006, -1.929112, 1, 1, 1, 1, 1,
-0.01960983, -0.3815188, -2.79355, 1, 1, 1, 1, 1,
-0.01935464, -0.1838403, -1.871741, 1, 1, 1, 1, 1,
-0.01474981, 0.3541098, -0.1426946, 1, 1, 1, 1, 1,
-0.01042637, 0.152439, 1.025735, 1, 1, 1, 1, 1,
-0.005999615, -1.613983, -3.312207, 1, 1, 1, 1, 1,
-0.001833622, 1.43297, -0.5250081, 1, 1, 1, 1, 1,
-0.0001882952, -0.1663393, -4.498978, 1, 1, 1, 1, 1,
0.005138399, 1.132187, -0.6032231, 1, 1, 1, 1, 1,
0.00583166, -0.7716446, 4.428145, 1, 1, 1, 1, 1,
0.00781189, 0.7842606, -0.6096012, 1, 1, 1, 1, 1,
0.009926568, -1.213173, 2.258558, 1, 1, 1, 1, 1,
0.01007803, -1.011231, 4.070713, 1, 1, 1, 1, 1,
0.0129305, -1.304848, 3.616985, 0, 0, 1, 1, 1,
0.01314363, -0.3854534, 2.452778, 1, 0, 0, 1, 1,
0.01433835, 0.02563504, 1.537481, 1, 0, 0, 1, 1,
0.01485026, 1.592878, 1.031116, 1, 0, 0, 1, 1,
0.01888464, 0.6544057, -0.78983, 1, 0, 0, 1, 1,
0.01981337, -0.6860082, 4.231326, 1, 0, 0, 1, 1,
0.02329166, 0.2713296, 0.5953371, 0, 0, 0, 1, 1,
0.02490766, 0.3482058, 0.6440719, 0, 0, 0, 1, 1,
0.02663304, 0.8005679, 1.287393, 0, 0, 0, 1, 1,
0.02724353, -0.553849, 3.05081, 0, 0, 0, 1, 1,
0.03190348, 0.122776, 1.009743, 0, 0, 0, 1, 1,
0.03256308, 1.069453, -0.4542411, 0, 0, 0, 1, 1,
0.0330564, 2.191315, 0.3762826, 0, 0, 0, 1, 1,
0.03324096, -0.4582565, 1.642276, 1, 1, 1, 1, 1,
0.03734365, 0.4796117, 0.3975737, 1, 1, 1, 1, 1,
0.03776389, -1.279316, 2.961317, 1, 1, 1, 1, 1,
0.04066458, -1.071139, 4.315224, 1, 1, 1, 1, 1,
0.04081426, 0.7570297, 2.200302, 1, 1, 1, 1, 1,
0.04188795, 0.5772074, -1.007629, 1, 1, 1, 1, 1,
0.0430191, -0.2212374, 2.281241, 1, 1, 1, 1, 1,
0.04627726, -1.655375, 5.192166, 1, 1, 1, 1, 1,
0.04859376, 2.521084, 0.4912475, 1, 1, 1, 1, 1,
0.04900107, 0.6552752, 2.055243, 1, 1, 1, 1, 1,
0.04945583, 0.4887003, 0.3801818, 1, 1, 1, 1, 1,
0.0506842, 0.2338817, 0.02667412, 1, 1, 1, 1, 1,
0.05212576, -0.7311524, 3.450209, 1, 1, 1, 1, 1,
0.05545483, 1.258584, -0.1835952, 1, 1, 1, 1, 1,
0.05592077, 0.2794996, -0.4731678, 1, 1, 1, 1, 1,
0.05851524, 0.1055788, -1.055617, 0, 0, 1, 1, 1,
0.0592061, -0.4052429, 2.227061, 1, 0, 0, 1, 1,
0.05953862, 1.199779, -1.473403, 1, 0, 0, 1, 1,
0.06019216, 0.9888589, 1.493601, 1, 0, 0, 1, 1,
0.06286103, 0.6380525, -0.3426768, 1, 0, 0, 1, 1,
0.0628782, -1.230673, 1.220532, 1, 0, 0, 1, 1,
0.06426455, 0.1817144, -0.3781261, 0, 0, 0, 1, 1,
0.06639115, -0.4750767, 3.223277, 0, 0, 0, 1, 1,
0.06794719, -0.339139, 3.866153, 0, 0, 0, 1, 1,
0.07074174, 0.3448462, 0.5656265, 0, 0, 0, 1, 1,
0.0734826, -0.7638977, 4.823633, 0, 0, 0, 1, 1,
0.07411791, 0.7565766, -0.123951, 0, 0, 0, 1, 1,
0.07862131, 2.306445, 2.425966, 0, 0, 0, 1, 1,
0.08478285, 1.744147, -0.2957542, 1, 1, 1, 1, 1,
0.08554502, 1.652116, -0.7336233, 1, 1, 1, 1, 1,
0.08574485, 1.09052, -0.4849647, 1, 1, 1, 1, 1,
0.08630797, -0.6399195, 3.267291, 1, 1, 1, 1, 1,
0.09203412, 0.00268863, 1.814482, 1, 1, 1, 1, 1,
0.09427608, 1.357569, 0.7416124, 1, 1, 1, 1, 1,
0.09468049, -1.766606, 3.081069, 1, 1, 1, 1, 1,
0.09669808, 0.4060634, -1.769618, 1, 1, 1, 1, 1,
0.09892472, 0.8121597, -0.4948238, 1, 1, 1, 1, 1,
0.1020363, -1.538448, 0.8999341, 1, 1, 1, 1, 1,
0.1022121, -1.531134, 4.949496, 1, 1, 1, 1, 1,
0.1057428, -1.661551, 1.989674, 1, 1, 1, 1, 1,
0.1070883, -0.2213931, 3.115756, 1, 1, 1, 1, 1,
0.1090227, 0.3966211, -1.302994, 1, 1, 1, 1, 1,
0.1122593, -1.206209, 1.172292, 1, 1, 1, 1, 1,
0.1127084, 1.059572, -0.4460158, 0, 0, 1, 1, 1,
0.1129021, 0.5179577, -0.8979896, 1, 0, 0, 1, 1,
0.1142344, -2.267074, 1.913043, 1, 0, 0, 1, 1,
0.119908, 0.4349881, 0.555001, 1, 0, 0, 1, 1,
0.1241353, 0.6024265, -0.07530012, 1, 0, 0, 1, 1,
0.1268775, 0.4568635, 1.048392, 1, 0, 0, 1, 1,
0.1286463, 1.280838, 1.003986, 0, 0, 0, 1, 1,
0.1338433, -1.680124, 3.47044, 0, 0, 0, 1, 1,
0.1388415, 0.4462995, 0.8505548, 0, 0, 0, 1, 1,
0.1406049, 1.841215, 0.1205302, 0, 0, 0, 1, 1,
0.1539709, 1.402231, 1.420278, 0, 0, 0, 1, 1,
0.1541303, 1.56285, -0.8343844, 0, 0, 0, 1, 1,
0.1547191, -1.629958, 4.484718, 0, 0, 0, 1, 1,
0.1552202, 1.035974, 0.3402185, 1, 1, 1, 1, 1,
0.1554143, 1.757439, 0.7573059, 1, 1, 1, 1, 1,
0.1565391, -1.079609, 3.349626, 1, 1, 1, 1, 1,
0.1577976, 0.4956329, 0.8566552, 1, 1, 1, 1, 1,
0.1631524, 0.7101998, -0.1100694, 1, 1, 1, 1, 1,
0.1712548, -0.7077473, 2.633304, 1, 1, 1, 1, 1,
0.1712579, 0.18392, 0.6752625, 1, 1, 1, 1, 1,
0.1715412, 1.167663, 0.178568, 1, 1, 1, 1, 1,
0.174945, 0.2471331, 0.6911485, 1, 1, 1, 1, 1,
0.1761355, 0.7293757, 0.7484483, 1, 1, 1, 1, 1,
0.177352, -1.146732, 2.600864, 1, 1, 1, 1, 1,
0.1777702, 0.6196476, 0.9118608, 1, 1, 1, 1, 1,
0.1810755, -0.1661951, 2.481152, 1, 1, 1, 1, 1,
0.1900546, -1.938927, 2.589701, 1, 1, 1, 1, 1,
0.1909825, -0.3283183, 3.415349, 1, 1, 1, 1, 1,
0.1948968, -0.9651572, 3.081011, 0, 0, 1, 1, 1,
0.1955027, 0.9038282, 0.1208432, 1, 0, 0, 1, 1,
0.2030849, -0.06318558, 0.5186896, 1, 0, 0, 1, 1,
0.2036736, 0.8485852, -0.3459291, 1, 0, 0, 1, 1,
0.2074085, 0.1659709, 1.821345, 1, 0, 0, 1, 1,
0.208443, 1.069266, -0.3248819, 1, 0, 0, 1, 1,
0.2093158, -0.5807969, 3.686576, 0, 0, 0, 1, 1,
0.2113577, 1.283742, 0.4021719, 0, 0, 0, 1, 1,
0.2122708, 0.1236973, -0.2532407, 0, 0, 0, 1, 1,
0.2138949, -0.1351838, 1.372191, 0, 0, 0, 1, 1,
0.2195528, -0.9593529, 2.715041, 0, 0, 0, 1, 1,
0.2218799, -0.2791662, 1.857923, 0, 0, 0, 1, 1,
0.2297645, 0.4975868, 0.8814488, 0, 0, 0, 1, 1,
0.2297708, 1.450964, 1.00622, 1, 1, 1, 1, 1,
0.2313249, 0.7889193, -1.313057, 1, 1, 1, 1, 1,
0.2348863, -0.04384987, 1.790674, 1, 1, 1, 1, 1,
0.2382568, 0.629217, 2.649527, 1, 1, 1, 1, 1,
0.2418786, 0.8213529, 0.04176918, 1, 1, 1, 1, 1,
0.2427329, -0.4811038, 2.030329, 1, 1, 1, 1, 1,
0.245226, 0.6211983, -0.07466685, 1, 1, 1, 1, 1,
0.2566589, 0.06675121, 0.2986633, 1, 1, 1, 1, 1,
0.2594132, 1.664286, -0.9419023, 1, 1, 1, 1, 1,
0.2603852, 0.9905298, -0.05349982, 1, 1, 1, 1, 1,
0.2605629, -0.830444, 1.746279, 1, 1, 1, 1, 1,
0.2626936, 0.09219617, 0.8878928, 1, 1, 1, 1, 1,
0.263442, 0.1516505, 1.290451, 1, 1, 1, 1, 1,
0.2640429, 1.043513, -0.3119674, 1, 1, 1, 1, 1,
0.2644137, 1.619794, 0.5350698, 1, 1, 1, 1, 1,
0.2649956, 0.9346648, 0.1178006, 0, 0, 1, 1, 1,
0.2650419, -0.2626125, 2.454038, 1, 0, 0, 1, 1,
0.2711187, 0.3300404, 1.380268, 1, 0, 0, 1, 1,
0.2719589, -0.595776, 2.772114, 1, 0, 0, 1, 1,
0.27556, 0.259842, -0.3391004, 1, 0, 0, 1, 1,
0.2797457, 0.05479867, 0.2210594, 1, 0, 0, 1, 1,
0.2837453, -0.358391, 2.269261, 0, 0, 0, 1, 1,
0.2895553, -1.374125, 1.370483, 0, 0, 0, 1, 1,
0.2918442, 1.527552, 0.5864385, 0, 0, 0, 1, 1,
0.2926444, -0.1231793, 1.594041, 0, 0, 0, 1, 1,
0.2934039, -0.03419915, 0.3094731, 0, 0, 0, 1, 1,
0.2948661, -0.5145004, 2.997758, 0, 0, 0, 1, 1,
0.2961901, 1.915929, 1.540061, 0, 0, 0, 1, 1,
0.2996466, -2.543226, -0.20517, 1, 1, 1, 1, 1,
0.3046368, -0.5077416, 2.74103, 1, 1, 1, 1, 1,
0.3087543, 2.14013, -1.653776, 1, 1, 1, 1, 1,
0.3140737, 0.1315723, 2.584307, 1, 1, 1, 1, 1,
0.3198031, -1.443808, 2.875418, 1, 1, 1, 1, 1,
0.3210626, 0.7464032, 0.9605222, 1, 1, 1, 1, 1,
0.3210899, -1.511689, 2.175175, 1, 1, 1, 1, 1,
0.3211769, 0.8288646, 1.510024, 1, 1, 1, 1, 1,
0.3231689, 1.134336, 0.8597877, 1, 1, 1, 1, 1,
0.3242798, 1.118397, -2.552732, 1, 1, 1, 1, 1,
0.3279105, -0.3534442, 1.551578, 1, 1, 1, 1, 1,
0.3331299, 1.517006, 0.8367383, 1, 1, 1, 1, 1,
0.333972, 0.06289924, 0.2410914, 1, 1, 1, 1, 1,
0.3351477, 0.566344, -0.6937218, 1, 1, 1, 1, 1,
0.3401042, -0.4492769, 2.840261, 1, 1, 1, 1, 1,
0.3413995, 0.4747264, -1.270083, 0, 0, 1, 1, 1,
0.3427617, 1.668917, 1.300195, 1, 0, 0, 1, 1,
0.3444094, -0.5009366, 0.9901265, 1, 0, 0, 1, 1,
0.3458647, -1.776826, 3.030698, 1, 0, 0, 1, 1,
0.3461956, -0.9271494, 3.200515, 1, 0, 0, 1, 1,
0.3512626, -1.734994, 3.134681, 1, 0, 0, 1, 1,
0.3540556, 1.073643, -0.5650166, 0, 0, 0, 1, 1,
0.3553766, 0.1571734, 0.01930192, 0, 0, 0, 1, 1,
0.3588434, 2.603615, 0.8850799, 0, 0, 0, 1, 1,
0.3595582, -0.01452016, 3.594662, 0, 0, 0, 1, 1,
0.362675, 0.07216481, 0.07408173, 0, 0, 0, 1, 1,
0.3629535, -1.479711, 2.021188, 0, 0, 0, 1, 1,
0.3654903, 0.5102687, 0.663698, 0, 0, 0, 1, 1,
0.3668294, 1.249509, -1.83096, 1, 1, 1, 1, 1,
0.3687517, 1.189872, 0.1990122, 1, 1, 1, 1, 1,
0.3689238, 0.4779441, -0.4630094, 1, 1, 1, 1, 1,
0.3694501, -0.5159273, 4.156728, 1, 1, 1, 1, 1,
0.3729275, -0.9903467, 1.962426, 1, 1, 1, 1, 1,
0.374623, -0.9938655, 3.697711, 1, 1, 1, 1, 1,
0.3757676, -0.8840843, 0.9520816, 1, 1, 1, 1, 1,
0.3758403, 0.2604837, 0.2772883, 1, 1, 1, 1, 1,
0.3795488, -0.4512737, 2.579592, 1, 1, 1, 1, 1,
0.3842888, 0.8775628, 0.8076639, 1, 1, 1, 1, 1,
0.3940146, 0.6859236, -0.129138, 1, 1, 1, 1, 1,
0.4009474, -0.2510085, 2.803399, 1, 1, 1, 1, 1,
0.4028297, -0.5016963, 3.991167, 1, 1, 1, 1, 1,
0.4092018, 0.11267, 0.2842397, 1, 1, 1, 1, 1,
0.4103903, -1.478403, 1.996293, 1, 1, 1, 1, 1,
0.4109792, -0.7892082, 2.893051, 0, 0, 1, 1, 1,
0.4125184, 1.732968, -0.3937529, 1, 0, 0, 1, 1,
0.4242011, 0.4559968, 0.4227414, 1, 0, 0, 1, 1,
0.4276751, 1.582067, -0.2873337, 1, 0, 0, 1, 1,
0.4354467, -0.5431983, 2.706598, 1, 0, 0, 1, 1,
0.4423726, 1.727914, -0.4100923, 1, 0, 0, 1, 1,
0.446297, -0.3442841, 1.410719, 0, 0, 0, 1, 1,
0.4485431, 0.7743044, 0.3123396, 0, 0, 0, 1, 1,
0.4509679, 0.2418974, 0.9961296, 0, 0, 0, 1, 1,
0.4568047, -0.8549888, 4.128655, 0, 0, 0, 1, 1,
0.4610699, 0.1113054, 1.474909, 0, 0, 0, 1, 1,
0.4615264, -1.71199, 1.293679, 0, 0, 0, 1, 1,
0.4669471, -0.3334382, 2.920871, 0, 0, 0, 1, 1,
0.4720275, 0.4613894, 1.579238, 1, 1, 1, 1, 1,
0.47412, 0.2947692, 1.854088, 1, 1, 1, 1, 1,
0.4773691, -0.03314292, 2.195441, 1, 1, 1, 1, 1,
0.4792039, -2.136712, 2.104927, 1, 1, 1, 1, 1,
0.4798595, -1.205093, 2.189071, 1, 1, 1, 1, 1,
0.4808796, -1.136838, 3.255242, 1, 1, 1, 1, 1,
0.4811262, 3.062654, -1.539255, 1, 1, 1, 1, 1,
0.4819418, -1.18695, 2.997474, 1, 1, 1, 1, 1,
0.4821557, -1.387021, 2.699421, 1, 1, 1, 1, 1,
0.4826482, 0.03820994, 2.331018, 1, 1, 1, 1, 1,
0.4842526, 0.763399, 0.2722095, 1, 1, 1, 1, 1,
0.4857328, 0.1476742, 1.925726, 1, 1, 1, 1, 1,
0.4872734, 0.2209938, 0.2356359, 1, 1, 1, 1, 1,
0.4883668, -0.0874534, 1.466801, 1, 1, 1, 1, 1,
0.4968446, 2.596915, 0.4063266, 1, 1, 1, 1, 1,
0.5007654, 0.4931066, 2.279999, 0, 0, 1, 1, 1,
0.5074083, 0.8166708, 1.886034, 1, 0, 0, 1, 1,
0.5080177, -0.2302716, 1.342383, 1, 0, 0, 1, 1,
0.5100579, -0.6623073, 4.479821, 1, 0, 0, 1, 1,
0.511219, 1.000548, -0.1769639, 1, 0, 0, 1, 1,
0.5130629, -0.5852188, 2.373722, 1, 0, 0, 1, 1,
0.5218387, 0.168565, 2.144953, 0, 0, 0, 1, 1,
0.5239008, -0.6715959, 2.660694, 0, 0, 0, 1, 1,
0.5240502, -1.132329, 4.154294, 0, 0, 0, 1, 1,
0.5254281, -0.1253396, 2.052334, 0, 0, 0, 1, 1,
0.5308438, -0.03880271, 1.9407, 0, 0, 0, 1, 1,
0.5328803, -1.624256, 2.614087, 0, 0, 0, 1, 1,
0.5362349, 1.151813, 1.421287, 0, 0, 0, 1, 1,
0.5365571, 0.9790979, -1.553829, 1, 1, 1, 1, 1,
0.5376402, 0.1489422, 3.174053, 1, 1, 1, 1, 1,
0.538809, 1.829889, 0.777118, 1, 1, 1, 1, 1,
0.5502053, -0.7247442, 3.163838, 1, 1, 1, 1, 1,
0.5518337, -0.7230365, 1.912425, 1, 1, 1, 1, 1,
0.5531377, 1.901621, -0.7925317, 1, 1, 1, 1, 1,
0.5545136, -0.6461779, 2.003513, 1, 1, 1, 1, 1,
0.5610807, 0.2530385, 0.8125281, 1, 1, 1, 1, 1,
0.5621766, 0.06726732, 0.4691406, 1, 1, 1, 1, 1,
0.5684574, -2.591352, 2.843083, 1, 1, 1, 1, 1,
0.5697574, -1.134545, 2.986845, 1, 1, 1, 1, 1,
0.5756807, 0.1752795, -0.2002321, 1, 1, 1, 1, 1,
0.5770074, 0.478494, 0.315435, 1, 1, 1, 1, 1,
0.577749, 0.661567, -0.09176007, 1, 1, 1, 1, 1,
0.5779248, -0.06210671, 1.179937, 1, 1, 1, 1, 1,
0.5796278, -0.502221, 3.7006, 0, 0, 1, 1, 1,
0.5801922, 0.5702626, 1.714544, 1, 0, 0, 1, 1,
0.5834287, 1.278904, -1.174012, 1, 0, 0, 1, 1,
0.5849304, -1.695995, 1.745071, 1, 0, 0, 1, 1,
0.5865339, 0.6739241, 2.300309, 1, 0, 0, 1, 1,
0.5943037, 0.1935192, 1.011953, 1, 0, 0, 1, 1,
0.5987755, 1.129875, 2.521457, 0, 0, 0, 1, 1,
0.6051167, -1.273208, 1.54616, 0, 0, 0, 1, 1,
0.6144097, -1.329959, 1.958106, 0, 0, 0, 1, 1,
0.6146456, -0.2746671, 3.460152, 0, 0, 0, 1, 1,
0.6155925, 0.7996725, -1.330502, 0, 0, 0, 1, 1,
0.6183882, 0.3916817, 2.703825, 0, 0, 0, 1, 1,
0.6218336, 0.8827434, 1.69458, 0, 0, 0, 1, 1,
0.6279565, 1.00856, -0.9166873, 1, 1, 1, 1, 1,
0.6317014, 1.223296, -1.73703, 1, 1, 1, 1, 1,
0.6325995, -0.8563632, 2.763798, 1, 1, 1, 1, 1,
0.6363492, 1.386404, -0.2974063, 1, 1, 1, 1, 1,
0.64391, -2.553634, 2.897666, 1, 1, 1, 1, 1,
0.6483852, -0.7559741, 4.132902, 1, 1, 1, 1, 1,
0.649882, 0.7341002, 0.01973299, 1, 1, 1, 1, 1,
0.6516988, 0.08340854, 0.8025941, 1, 1, 1, 1, 1,
0.6584892, 0.512747, 0.6912832, 1, 1, 1, 1, 1,
0.6647059, -0.9443715, 2.289778, 1, 1, 1, 1, 1,
0.6688101, -1.148731, 1.306324, 1, 1, 1, 1, 1,
0.6688714, -0.5036715, 4.000929, 1, 1, 1, 1, 1,
0.6746338, 0.9520651, 1.298152, 1, 1, 1, 1, 1,
0.6792298, 0.4830554, -0.5240617, 1, 1, 1, 1, 1,
0.6831405, 0.7380774, 0.4733162, 1, 1, 1, 1, 1,
0.6857724, 0.5465592, 1.07237, 0, 0, 1, 1, 1,
0.687594, -1.516963, 2.326702, 1, 0, 0, 1, 1,
0.6976705, -1.006719, 3.443164, 1, 0, 0, 1, 1,
0.6999244, -0.3847525, 2.33291, 1, 0, 0, 1, 1,
0.7028331, 0.6107923, -0.3612978, 1, 0, 0, 1, 1,
0.7086799, -0.4372873, 2.991639, 1, 0, 0, 1, 1,
0.7108175, 0.4095012, 0.6920654, 0, 0, 0, 1, 1,
0.7109174, -1.765758, 1.616066, 0, 0, 0, 1, 1,
0.7168474, -1.562319, 4.287861, 0, 0, 0, 1, 1,
0.7171595, -1.504313, 2.031627, 0, 0, 0, 1, 1,
0.7224495, -0.5709857, 1.818359, 0, 0, 0, 1, 1,
0.7247753, -0.9845756, 2.116045, 0, 0, 0, 1, 1,
0.7279312, 1.067181, 1.316762, 0, 0, 0, 1, 1,
0.7316575, 1.175368, -1.550272, 1, 1, 1, 1, 1,
0.7371241, 0.4642043, 1.742628, 1, 1, 1, 1, 1,
0.7382392, -0.1197535, 1.402974, 1, 1, 1, 1, 1,
0.7384568, -0.4211794, 2.752631, 1, 1, 1, 1, 1,
0.7472765, 1.340761, -1.547959, 1, 1, 1, 1, 1,
0.748053, -0.5257251, 2.508545, 1, 1, 1, 1, 1,
0.755969, 1.295917, 1.180673, 1, 1, 1, 1, 1,
0.7578723, -0.1880319, 1.228817, 1, 1, 1, 1, 1,
0.7584234, 0.09295768, 1.42273, 1, 1, 1, 1, 1,
0.7585648, 1.095374, 0.3881292, 1, 1, 1, 1, 1,
0.7687894, 1.242521, -0.5155975, 1, 1, 1, 1, 1,
0.7716039, -0.5428121, 2.909057, 1, 1, 1, 1, 1,
0.7787076, -0.1615714, 1.252799, 1, 1, 1, 1, 1,
0.7798786, 0.6512493, -0.2127356, 1, 1, 1, 1, 1,
0.7809089, 0.4173576, 0.6525146, 1, 1, 1, 1, 1,
0.7811904, -0.5003515, 0.9201695, 0, 0, 1, 1, 1,
0.7812926, 0.1826014, 9.122366e-05, 1, 0, 0, 1, 1,
0.7821155, -0.4223279, 1.312482, 1, 0, 0, 1, 1,
0.786163, 0.7982216, 1.31944, 1, 0, 0, 1, 1,
0.7909067, -0.2110089, 1.837081, 1, 0, 0, 1, 1,
0.7974685, 0.6652624, 0.1094735, 1, 0, 0, 1, 1,
0.7988833, -1.152379, 0.8660588, 0, 0, 0, 1, 1,
0.8038579, 0.2366223, 2.733293, 0, 0, 0, 1, 1,
0.8090314, -0.01761882, 2.570649, 0, 0, 0, 1, 1,
0.8142785, -0.6019409, 2.180257, 0, 0, 0, 1, 1,
0.8151323, 0.4538379, 2.383914, 0, 0, 0, 1, 1,
0.8308606, 0.8798335, 1.609677, 0, 0, 0, 1, 1,
0.836966, 0.03768116, 1.81666, 0, 0, 0, 1, 1,
0.8441423, -0.2235313, 1.037752, 1, 1, 1, 1, 1,
0.8474545, 0.9344625, 2.668565, 1, 1, 1, 1, 1,
0.848399, -0.1639118, 1.589468, 1, 1, 1, 1, 1,
0.856057, 0.3450436, 0.8078362, 1, 1, 1, 1, 1,
0.8583838, 1.577839, -0.6526546, 1, 1, 1, 1, 1,
0.8641562, 0.2453933, 1.990861, 1, 1, 1, 1, 1,
0.8677823, -0.2231169, 2.302772, 1, 1, 1, 1, 1,
0.8698241, 1.733807, 2.326643, 1, 1, 1, 1, 1,
0.873741, 1.955861, -0.4152473, 1, 1, 1, 1, 1,
0.8786865, 0.9267245, 1.613957, 1, 1, 1, 1, 1,
0.8838634, 0.3030139, 1.073463, 1, 1, 1, 1, 1,
0.8849791, 0.7909604, 0.2675196, 1, 1, 1, 1, 1,
0.8881053, 1.635832, 1.73193, 1, 1, 1, 1, 1,
0.9041235, 1.049747, -0.02742502, 1, 1, 1, 1, 1,
0.9136678, -0.4225905, 2.658514, 1, 1, 1, 1, 1,
0.9185035, -0.2006748, 1.458805, 0, 0, 1, 1, 1,
0.9228716, 0.395089, 1.140953, 1, 0, 0, 1, 1,
0.9234855, -0.796954, 1.728618, 1, 0, 0, 1, 1,
0.9248648, 0.01394076, 2.409238, 1, 0, 0, 1, 1,
0.9263165, -1.826667, 4.228829, 1, 0, 0, 1, 1,
0.9268309, -0.09833391, 1.88251, 1, 0, 0, 1, 1,
0.9411753, 3.476764, -0.06446422, 0, 0, 0, 1, 1,
0.9416174, -0.4065787, 3.35361, 0, 0, 0, 1, 1,
0.9476404, 1.128745, 0.332182, 0, 0, 0, 1, 1,
0.947661, 0.4745435, 1.403411, 0, 0, 0, 1, 1,
0.9497316, 0.7245209, 1.532324, 0, 0, 0, 1, 1,
0.9508457, -0.876193, 2.165128, 0, 0, 0, 1, 1,
0.9527858, -1.425217, 2.514137, 0, 0, 0, 1, 1,
0.9530254, -1.618625, 2.056688, 1, 1, 1, 1, 1,
0.9552099, -0.9408352, 1.178062, 1, 1, 1, 1, 1,
0.9612411, 0.7993666, 0.609701, 1, 1, 1, 1, 1,
0.9632244, 1.764945, 0.009747158, 1, 1, 1, 1, 1,
0.9668398, -1.467696, 2.15415, 1, 1, 1, 1, 1,
0.9695715, -0.4912152, 1.71417, 1, 1, 1, 1, 1,
0.9732568, 0.4157862, 0.8350527, 1, 1, 1, 1, 1,
0.9750913, 0.7538043, 2.058908, 1, 1, 1, 1, 1,
0.9773052, 0.3855751, 1.119524, 1, 1, 1, 1, 1,
0.9867905, -1.321539, 2.979028, 1, 1, 1, 1, 1,
0.9941884, 0.6141814, 0.5881939, 1, 1, 1, 1, 1,
0.9965389, -0.2863431, 1.416336, 1, 1, 1, 1, 1,
0.9978455, -0.4784488, 0.8362926, 1, 1, 1, 1, 1,
1.00265, 0.07312758, 1.908076, 1, 1, 1, 1, 1,
1.002859, -1.927511, 1.430801, 1, 1, 1, 1, 1,
1.004804, 0.4751517, 0.4677181, 0, 0, 1, 1, 1,
1.006627, 0.09996834, 1.586381, 1, 0, 0, 1, 1,
1.008304, -0.1436705, 2.093128, 1, 0, 0, 1, 1,
1.013176, 0.398529, -0.02323168, 1, 0, 0, 1, 1,
1.014915, 0.4383757, 1.600412, 1, 0, 0, 1, 1,
1.017048, 1.181842, 0.8685762, 1, 0, 0, 1, 1,
1.019439, 1.472432, -0.2262894, 0, 0, 0, 1, 1,
1.019614, 0.688123, -0.08322698, 0, 0, 0, 1, 1,
1.021384, 0.9756719, -0.2664162, 0, 0, 0, 1, 1,
1.022881, 1.11352, -1.819098, 0, 0, 0, 1, 1,
1.032912, 1.674185, 1.751422, 0, 0, 0, 1, 1,
1.03326, 0.2725348, 4.003924, 0, 0, 0, 1, 1,
1.035941, 0.5257065, 0.3618518, 0, 0, 0, 1, 1,
1.050041, -0.1050215, 1.751109, 1, 1, 1, 1, 1,
1.050126, -0.4395538, 2.700657, 1, 1, 1, 1, 1,
1.051061, -0.8681304, 3.280659, 1, 1, 1, 1, 1,
1.052267, 0.1349159, 2.190331, 1, 1, 1, 1, 1,
1.055328, -0.3489016, 2.358352, 1, 1, 1, 1, 1,
1.057214, -0.4176001, 1.544277, 1, 1, 1, 1, 1,
1.058823, 0.267586, 1.714646, 1, 1, 1, 1, 1,
1.063637, 1.662379, -0.551686, 1, 1, 1, 1, 1,
1.073088, -0.9662611, 2.216746, 1, 1, 1, 1, 1,
1.073428, -1.749583, 3.156984, 1, 1, 1, 1, 1,
1.079396, -1.116778, 0.350052, 1, 1, 1, 1, 1,
1.08713, 0.9619727, 1.072861, 1, 1, 1, 1, 1,
1.09219, 0.4382014, 3.222902, 1, 1, 1, 1, 1,
1.098079, -0.2142285, 1.600735, 1, 1, 1, 1, 1,
1.109337, -1.508063, 2.826351, 1, 1, 1, 1, 1,
1.112518, 0.7040609, 0.9889544, 0, 0, 1, 1, 1,
1.113619, -1.462434, 3.624363, 1, 0, 0, 1, 1,
1.114309, 2.331334, 0.2698773, 1, 0, 0, 1, 1,
1.114401, 0.2233174, 0.1916781, 1, 0, 0, 1, 1,
1.117376, 1.253679, 0.05474665, 1, 0, 0, 1, 1,
1.129776, 2.946366, 0.4039392, 1, 0, 0, 1, 1,
1.13437, 1.044031, 1.390975, 0, 0, 0, 1, 1,
1.143294, 2.168749, 0.8287837, 0, 0, 0, 1, 1,
1.149478, 0.3992944, 2.774434, 0, 0, 0, 1, 1,
1.149764, 1.098576, -0.719575, 0, 0, 0, 1, 1,
1.16531, 0.4927178, 1.408821, 0, 0, 0, 1, 1,
1.166025, 1.683639, 1.357954, 0, 0, 0, 1, 1,
1.176334, 0.3614511, 1.508183, 0, 0, 0, 1, 1,
1.179735, 0.9272463, 0.2186733, 1, 1, 1, 1, 1,
1.192463, -0.1155246, 0.5603604, 1, 1, 1, 1, 1,
1.193165, -0.08441885, 0.8723634, 1, 1, 1, 1, 1,
1.195135, -0.1950436, 1.88296, 1, 1, 1, 1, 1,
1.197905, -0.1546485, 3.039625, 1, 1, 1, 1, 1,
1.205141, -0.3604991, 2.616764, 1, 1, 1, 1, 1,
1.207758, 0.4579251, 1.973721, 1, 1, 1, 1, 1,
1.210338, -1.61104, 2.329782, 1, 1, 1, 1, 1,
1.211512, -1.384079, 1.810499, 1, 1, 1, 1, 1,
1.218385, -0.3998029, 2.992059, 1, 1, 1, 1, 1,
1.226976, 1.431895, 0.3146079, 1, 1, 1, 1, 1,
1.227186, -0.2499958, 1.81816, 1, 1, 1, 1, 1,
1.234061, -1.524834, 1.385161, 1, 1, 1, 1, 1,
1.23532, -1.419731, 3.402997, 1, 1, 1, 1, 1,
1.235814, -0.5657732, 1.764336, 1, 1, 1, 1, 1,
1.237978, 0.1507889, 2.294866, 0, 0, 1, 1, 1,
1.240905, -0.1273675, 0.9617704, 1, 0, 0, 1, 1,
1.249155, 0.6974823, 0.8548076, 1, 0, 0, 1, 1,
1.252192, 1.238413, 0.4986918, 1, 0, 0, 1, 1,
1.25379, 1.071317, 0.9180034, 1, 0, 0, 1, 1,
1.25407, 0.4309822, 0.3941511, 1, 0, 0, 1, 1,
1.261064, 0.2883424, 1.197975, 0, 0, 0, 1, 1,
1.263785, 1.351367, 0.8288392, 0, 0, 0, 1, 1,
1.265737, -1.073066, 2.31814, 0, 0, 0, 1, 1,
1.287875, 1.261076, 1.058239, 0, 0, 0, 1, 1,
1.29588, -1.35006, 3.016009, 0, 0, 0, 1, 1,
1.301353, -0.3670155, 3.474199, 0, 0, 0, 1, 1,
1.313667, 0.5173457, 0.8514389, 0, 0, 0, 1, 1,
1.315205, -0.9904023, 2.228125, 1, 1, 1, 1, 1,
1.324171, 0.378387, 2.46801, 1, 1, 1, 1, 1,
1.325787, -1.477333, 3.760616, 1, 1, 1, 1, 1,
1.327413, -0.3988978, 3.589995, 1, 1, 1, 1, 1,
1.336779, -0.3153861, 3.16511, 1, 1, 1, 1, 1,
1.339244, -0.7788475, 2.76906, 1, 1, 1, 1, 1,
1.36473, 0.7660285, 0.2563525, 1, 1, 1, 1, 1,
1.369533, -1.982517, 3.327694, 1, 1, 1, 1, 1,
1.374255, 0.9166226, 2.674582, 1, 1, 1, 1, 1,
1.38546, 0.1469679, 1.188303, 1, 1, 1, 1, 1,
1.390822, -0.9398127, 1.825141, 1, 1, 1, 1, 1,
1.40339, 0.9291961, 1.772722, 1, 1, 1, 1, 1,
1.404251, 0.9030274, 0.1782668, 1, 1, 1, 1, 1,
1.412793, 0.9574845, 1.65181, 1, 1, 1, 1, 1,
1.431905, -0.5969723, 2.545458, 1, 1, 1, 1, 1,
1.435033, -0.4671143, 2.820866, 0, 0, 1, 1, 1,
1.446579, 1.903091, 1.039038, 1, 0, 0, 1, 1,
1.460506, -0.7008346, 1.132333, 1, 0, 0, 1, 1,
1.464331, 0.5951099, 0.5317639, 1, 0, 0, 1, 1,
1.48147, 0.1452334, 0.3275499, 1, 0, 0, 1, 1,
1.482181, 1.349493, 1.51713, 1, 0, 0, 1, 1,
1.488114, -0.3006879, 3.441824, 0, 0, 0, 1, 1,
1.489875, 0.6562133, 1.592655, 0, 0, 0, 1, 1,
1.489996, 1.465866, 1.343023, 0, 0, 0, 1, 1,
1.492587, 1.910877, 0.5895075, 0, 0, 0, 1, 1,
1.500971, -0.2381499, 2.346095, 0, 0, 0, 1, 1,
1.503523, -0.6740734, 1.53656, 0, 0, 0, 1, 1,
1.504079, -0.5028794, 3.065614, 0, 0, 0, 1, 1,
1.506346, -1.006345, 2.576265, 1, 1, 1, 1, 1,
1.512222, -0.8792381, 0.842482, 1, 1, 1, 1, 1,
1.529999, -2.213144, 3.407618, 1, 1, 1, 1, 1,
1.537422, 0.1008583, 3.074245, 1, 1, 1, 1, 1,
1.545847, 0.551103, 0.8589157, 1, 1, 1, 1, 1,
1.546436, 0.3374598, 2.226604, 1, 1, 1, 1, 1,
1.548881, 0.1803901, -1.489775, 1, 1, 1, 1, 1,
1.564186, 0.0006121636, 1.24856, 1, 1, 1, 1, 1,
1.570982, -0.055559, 0.6830628, 1, 1, 1, 1, 1,
1.572702, -1.480089, 2.902018, 1, 1, 1, 1, 1,
1.586116, -1.272701, 1.872528, 1, 1, 1, 1, 1,
1.604632, 1.071426, 0.4249464, 1, 1, 1, 1, 1,
1.607263, -0.7713791, 1.891541, 1, 1, 1, 1, 1,
1.628103, 1.229042, 0.9816698, 1, 1, 1, 1, 1,
1.633018, 0.6981073, 2.179748, 1, 1, 1, 1, 1,
1.635095, -0.7545498, 2.391758, 0, 0, 1, 1, 1,
1.635312, 1.683832, 2.308063, 1, 0, 0, 1, 1,
1.643439, 1.124982, 1.716111, 1, 0, 0, 1, 1,
1.644517, -0.6428265, 1.769922, 1, 0, 0, 1, 1,
1.646103, -0.1311102, 1.878712, 1, 0, 0, 1, 1,
1.64831, -1.067681, 3.093626, 1, 0, 0, 1, 1,
1.652699, -0.3138108, 2.806843, 0, 0, 0, 1, 1,
1.65828, 1.616637, 0.9571108, 0, 0, 0, 1, 1,
1.667804, 0.1135415, 2.219728, 0, 0, 0, 1, 1,
1.672676, -0.3039875, 0.7229627, 0, 0, 0, 1, 1,
1.673846, 1.361255, 2.38676, 0, 0, 0, 1, 1,
1.682208, -0.5123051, 1.641688, 0, 0, 0, 1, 1,
1.718783, 0.2970207, 1.110666, 0, 0, 0, 1, 1,
1.733775, 1.258982, 1.911874, 1, 1, 1, 1, 1,
1.739685, -0.3175385, 2.535171, 1, 1, 1, 1, 1,
1.789533, 1.058695, 0.6612794, 1, 1, 1, 1, 1,
1.806476, -0.2364076, 0.6075367, 1, 1, 1, 1, 1,
1.810629, -0.1016904, 1.925564, 1, 1, 1, 1, 1,
1.818998, 0.4911535, 2.332018, 1, 1, 1, 1, 1,
1.846022, 0.06243163, 1.09863, 1, 1, 1, 1, 1,
1.847066, 2.22746, 0.2961709, 1, 1, 1, 1, 1,
1.852632, -1.539655, 1.08228, 1, 1, 1, 1, 1,
1.904774, -1.840798, 3.693498, 1, 1, 1, 1, 1,
1.927856, 3.081647, 0.005747995, 1, 1, 1, 1, 1,
1.942796, 0.7756472, 0.7905117, 1, 1, 1, 1, 1,
1.946469, 0.8152902, 1.1696, 1, 1, 1, 1, 1,
1.989022, 0.6819323, -0.570101, 1, 1, 1, 1, 1,
2.003677, 0.1893904, 2.111238, 1, 1, 1, 1, 1,
2.006147, 1.252396, 2.075618, 0, 0, 1, 1, 1,
2.053546, 0.1276352, 0.7702909, 1, 0, 0, 1, 1,
2.076533, -0.1678363, 1.712771, 1, 0, 0, 1, 1,
2.114717, -0.4651414, 1.44226, 1, 0, 0, 1, 1,
2.139719, 1.238612, 0.6769624, 1, 0, 0, 1, 1,
2.148214, 0.5496079, 0.4122826, 1, 0, 0, 1, 1,
2.150094, -0.8499238, 2.57454, 0, 0, 0, 1, 1,
2.160325, -1.114068, 3.550582, 0, 0, 0, 1, 1,
2.221206, 0.5593188, 1.607826, 0, 0, 0, 1, 1,
2.225061, 1.427918, 1.113647, 0, 0, 0, 1, 1,
2.264441, -0.159403, 0.5997031, 0, 0, 0, 1, 1,
2.326959, -0.7757925, -1.940139, 0, 0, 0, 1, 1,
2.327333, 0.1101739, 0.4277309, 0, 0, 0, 1, 1,
2.340944, 1.777597, -1.428812, 1, 1, 1, 1, 1,
2.391493, 0.6694107, 1.522053, 1, 1, 1, 1, 1,
2.396353, -1.15086, 2.510877, 1, 1, 1, 1, 1,
2.452219, 0.3820217, 1.446571, 1, 1, 1, 1, 1,
2.541837, -0.3415735, 0.3450398, 1, 1, 1, 1, 1,
2.552522, -0.856131, 2.089036, 1, 1, 1, 1, 1,
2.682301, -0.2021662, 0.4684885, 1, 1, 1, 1, 1
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
var radius = 9.680623;
var distance = 34.00278;
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
mvMatrix.translate( 0.2435652, -0.3735507, 0.5310163 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.00278);
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
