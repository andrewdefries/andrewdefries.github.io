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
-3.488614, 1.026729, -1.984609, 1, 0, 0, 1,
-3.250641, -0.7461381, -2.46069, 1, 0.007843138, 0, 1,
-2.964175, -1.935566, -3.223795, 1, 0.01176471, 0, 1,
-2.841784, -0.4599702, -1.4822, 1, 0.01960784, 0, 1,
-2.632014, 2.561943, -1.672727, 1, 0.02352941, 0, 1,
-2.621299, 0.9700702, -2.140657, 1, 0.03137255, 0, 1,
-2.575563, -0.7445334, -2.457883, 1, 0.03529412, 0, 1,
-2.505726, 0.3123142, -2.919609, 1, 0.04313726, 0, 1,
-2.501343, 0.5899634, 0.3362467, 1, 0.04705882, 0, 1,
-2.220987, 0.003164733, -2.681599, 1, 0.05490196, 0, 1,
-2.202015, -0.06745926, -2.267014, 1, 0.05882353, 0, 1,
-2.200343, -1.798457, -2.155328, 1, 0.06666667, 0, 1,
-2.108971, -0.4113497, -1.617177, 1, 0.07058824, 0, 1,
-2.091879, -0.9138675, -3.248767, 1, 0.07843138, 0, 1,
-2.077596, 1.309714, -0.01482097, 1, 0.08235294, 0, 1,
-2.074818, 0.4797093, -0.1100908, 1, 0.09019608, 0, 1,
-2.056906, 2.031714, -0.6883779, 1, 0.09411765, 0, 1,
-2.04118, -0.9362817, -2.327572, 1, 0.1019608, 0, 1,
-1.939144, -0.374754, -2.820024, 1, 0.1098039, 0, 1,
-1.921408, 0.01830552, -1.097356, 1, 0.1137255, 0, 1,
-1.910975, -0.3246316, -3.05464, 1, 0.1215686, 0, 1,
-1.90788, 1.755023, -0.03790348, 1, 0.1254902, 0, 1,
-1.906518, -0.6468086, -2.706755, 1, 0.1333333, 0, 1,
-1.898489, -2.576816, -2.492195, 1, 0.1372549, 0, 1,
-1.889231, -0.1714784, -1.625472, 1, 0.145098, 0, 1,
-1.887503, -0.7397732, -0.6315307, 1, 0.1490196, 0, 1,
-1.86469, 1.83132, -0.3604916, 1, 0.1568628, 0, 1,
-1.83278, 0.8813204, -1.086624, 1, 0.1607843, 0, 1,
-1.80438, -0.4843838, -2.924127, 1, 0.1686275, 0, 1,
-1.757113, 0.5161997, -1.545031, 1, 0.172549, 0, 1,
-1.754872, -0.01411062, -0.3456392, 1, 0.1803922, 0, 1,
-1.754349, -0.9222723, -2.186498, 1, 0.1843137, 0, 1,
-1.72259, -0.7090452, -3.481917, 1, 0.1921569, 0, 1,
-1.707049, 0.1149189, -0.2265691, 1, 0.1960784, 0, 1,
-1.69976, -0.5724407, -2.278501, 1, 0.2039216, 0, 1,
-1.695398, -0.4345894, -0.7254315, 1, 0.2117647, 0, 1,
-1.663543, 2.998971, -0.3663876, 1, 0.2156863, 0, 1,
-1.66139, -0.3645374, -0.6380404, 1, 0.2235294, 0, 1,
-1.65637, -2.015041, -1.672416, 1, 0.227451, 0, 1,
-1.653365, 0.1852643, -1.475936, 1, 0.2352941, 0, 1,
-1.648521, 0.9901, -1.938993, 1, 0.2392157, 0, 1,
-1.645476, 0.2381901, -0.2898457, 1, 0.2470588, 0, 1,
-1.635903, -0.9819562, -2.509579, 1, 0.2509804, 0, 1,
-1.627534, -1.465992, -3.124177, 1, 0.2588235, 0, 1,
-1.61851, 1.834925, -1.24208, 1, 0.2627451, 0, 1,
-1.609043, 1.187232, -0.1353322, 1, 0.2705882, 0, 1,
-1.598687, -0.4814932, -0.8672099, 1, 0.2745098, 0, 1,
-1.59493, 0.2036311, -1.874187, 1, 0.282353, 0, 1,
-1.589111, 0.623208, -0.9205903, 1, 0.2862745, 0, 1,
-1.587129, -1.957491, -1.931249, 1, 0.2941177, 0, 1,
-1.585147, -1.421254, -2.111293, 1, 0.3019608, 0, 1,
-1.577578, 0.2357637, -0.9995086, 1, 0.3058824, 0, 1,
-1.570701, -0.4898575, -1.572135, 1, 0.3137255, 0, 1,
-1.563365, 0.1944714, -0.5589221, 1, 0.3176471, 0, 1,
-1.562945, 0.3932499, -0.931115, 1, 0.3254902, 0, 1,
-1.562694, -2.271309, -2.14713, 1, 0.3294118, 0, 1,
-1.561713, 0.5955344, -1.755289, 1, 0.3372549, 0, 1,
-1.54895, -0.2277942, 1.059878, 1, 0.3411765, 0, 1,
-1.54134, 0.1563982, -1.765756, 1, 0.3490196, 0, 1,
-1.54096, 1.347434, -1.411908, 1, 0.3529412, 0, 1,
-1.539867, -0.2192148, -0.7239742, 1, 0.3607843, 0, 1,
-1.538128, -1.671851, -2.162853, 1, 0.3647059, 0, 1,
-1.523324, -1.180745, -1.957376, 1, 0.372549, 0, 1,
-1.489955, -0.4351406, -1.547703, 1, 0.3764706, 0, 1,
-1.480724, 1.09177, -0.9542559, 1, 0.3843137, 0, 1,
-1.469161, 0.8895587, -1.757218, 1, 0.3882353, 0, 1,
-1.458149, 1.231067, -0.2799138, 1, 0.3960784, 0, 1,
-1.448906, 1.39295, -0.04642665, 1, 0.4039216, 0, 1,
-1.431641, 1.134091, -0.07036854, 1, 0.4078431, 0, 1,
-1.412181, 0.5989661, -2.22366, 1, 0.4156863, 0, 1,
-1.405481, -1.909708, -4.086554, 1, 0.4196078, 0, 1,
-1.401083, 0.2077324, -2.093502, 1, 0.427451, 0, 1,
-1.397466, -0.1559614, -2.927083, 1, 0.4313726, 0, 1,
-1.390884, 0.833062, -1.97221, 1, 0.4392157, 0, 1,
-1.369784, 1.391447, -1.153049, 1, 0.4431373, 0, 1,
-1.365009, -1.586319, -3.322345, 1, 0.4509804, 0, 1,
-1.357104, -0.2105398, -0.5512063, 1, 0.454902, 0, 1,
-1.349607, 1.711924, 0.7266054, 1, 0.4627451, 0, 1,
-1.347666, 1.759783, -0.03919167, 1, 0.4666667, 0, 1,
-1.331886, 1.352881, -0.5783714, 1, 0.4745098, 0, 1,
-1.319734, 0.4535049, -1.072901, 1, 0.4784314, 0, 1,
-1.313977, 0.3078586, -1.880387, 1, 0.4862745, 0, 1,
-1.306043, -2.133341, -2.495375, 1, 0.4901961, 0, 1,
-1.299509, -0.06705964, -1.019424, 1, 0.4980392, 0, 1,
-1.298002, -1.416344, -2.808105, 1, 0.5058824, 0, 1,
-1.296341, -1.14155, -1.708639, 1, 0.509804, 0, 1,
-1.295688, -1.290632, -3.795376, 1, 0.5176471, 0, 1,
-1.290635, 0.9916531, -0.5138863, 1, 0.5215687, 0, 1,
-1.289932, 2.227944, -1.086991, 1, 0.5294118, 0, 1,
-1.279726, -0.2798774, -2.406656, 1, 0.5333334, 0, 1,
-1.272144, -0.7265895, -2.278324, 1, 0.5411765, 0, 1,
-1.269605, -0.4196154, -2.347639, 1, 0.5450981, 0, 1,
-1.26467, -0.3702493, -1.050563, 1, 0.5529412, 0, 1,
-1.260246, 0.2833292, 0.4545457, 1, 0.5568628, 0, 1,
-1.258542, -1.06159, -1.750234, 1, 0.5647059, 0, 1,
-1.253594, 0.5194779, -1.591211, 1, 0.5686275, 0, 1,
-1.246198, 0.7548859, 0.05467659, 1, 0.5764706, 0, 1,
-1.240888, 0.4699102, -1.7435, 1, 0.5803922, 0, 1,
-1.236266, -0.5914068, -0.4060825, 1, 0.5882353, 0, 1,
-1.235293, 0.7942731, 0.367331, 1, 0.5921569, 0, 1,
-1.227786, 0.5821413, -0.75739, 1, 0.6, 0, 1,
-1.217019, -1.241392, -3.024015, 1, 0.6078432, 0, 1,
-1.212725, 0.966804, -0.7685453, 1, 0.6117647, 0, 1,
-1.206976, 0.5305345, -0.2637735, 1, 0.6196079, 0, 1,
-1.204956, -0.7934288, -1.056428, 1, 0.6235294, 0, 1,
-1.197537, -1.256138, -3.066707, 1, 0.6313726, 0, 1,
-1.187387, -0.9342486, -1.747307, 1, 0.6352941, 0, 1,
-1.182418, 0.9960248, -2.453463, 1, 0.6431373, 0, 1,
-1.172434, 0.8929095, 0.07065576, 1, 0.6470588, 0, 1,
-1.169098, 1.896433, -0.001281597, 1, 0.654902, 0, 1,
-1.158018, -0.7567732, -1.736492, 1, 0.6588235, 0, 1,
-1.154306, -1.497416, 0.2151324, 1, 0.6666667, 0, 1,
-1.153969, -0.8350381, -1.935711, 1, 0.6705883, 0, 1,
-1.144501, 1.212753, -2.689173, 1, 0.6784314, 0, 1,
-1.143334, -0.5186191, -3.875158, 1, 0.682353, 0, 1,
-1.13733, 1.194759, -0.3266735, 1, 0.6901961, 0, 1,
-1.132105, -0.03698449, -1.602112, 1, 0.6941177, 0, 1,
-1.129519, -0.03971296, -2.670698, 1, 0.7019608, 0, 1,
-1.127279, -0.5099342, -0.7069331, 1, 0.7098039, 0, 1,
-1.125585, -0.318173, -1.438659, 1, 0.7137255, 0, 1,
-1.118815, 0.6740408, -2.191079, 1, 0.7215686, 0, 1,
-1.116258, -0.9131953, -0.6681819, 1, 0.7254902, 0, 1,
-1.116032, -1.712304, -3.207312, 1, 0.7333333, 0, 1,
-1.113418, 1.86253, -2.411363, 1, 0.7372549, 0, 1,
-1.104357, -0.2384818, -1.858883, 1, 0.7450981, 0, 1,
-1.103079, 0.163486, 0.579162, 1, 0.7490196, 0, 1,
-1.093763, -0.3159703, -1.648227, 1, 0.7568628, 0, 1,
-1.088241, -0.403859, -1.163269, 1, 0.7607843, 0, 1,
-1.08585, -0.3378249, -2.043614, 1, 0.7686275, 0, 1,
-1.074185, -0.5990268, -3.845093, 1, 0.772549, 0, 1,
-1.070592, 0.01648529, -1.754151, 1, 0.7803922, 0, 1,
-1.068278, -0.3559566, -0.2300615, 1, 0.7843137, 0, 1,
-1.061191, -1.292166, -2.27706, 1, 0.7921569, 0, 1,
-1.049828, 0.6450869, -1.911642, 1, 0.7960784, 0, 1,
-1.049817, -1.367563, -2.18493, 1, 0.8039216, 0, 1,
-1.04826, 0.2840421, -1.873139, 1, 0.8117647, 0, 1,
-1.047556, -0.9667242, -0.6546361, 1, 0.8156863, 0, 1,
-1.047432, -0.6585095, -2.45706, 1, 0.8235294, 0, 1,
-1.030364, 1.073943, 0.3169428, 1, 0.827451, 0, 1,
-1.023797, 0.06646737, -3.664053, 1, 0.8352941, 0, 1,
-1.023022, -0.8349109, -2.171375, 1, 0.8392157, 0, 1,
-1.021817, -0.6846909, -1.848358, 1, 0.8470588, 0, 1,
-1.005697, 0.767409, -0.02818466, 1, 0.8509804, 0, 1,
-1.005658, 0.7823324, -2.15407, 1, 0.8588235, 0, 1,
-1.002472, 0.4583611, -2.850936, 1, 0.8627451, 0, 1,
-0.9940019, -0.4458582, -1.203997, 1, 0.8705882, 0, 1,
-0.9914702, 0.7079834, -1.312853, 1, 0.8745098, 0, 1,
-0.9848676, 1.811472, -1.813609, 1, 0.8823529, 0, 1,
-0.9828727, 1.2779, 0.8494741, 1, 0.8862745, 0, 1,
-0.9816683, 1.372172, -0.5375301, 1, 0.8941177, 0, 1,
-0.9770875, -0.4401896, -1.09986, 1, 0.8980392, 0, 1,
-0.9667822, -0.394568, -2.905156, 1, 0.9058824, 0, 1,
-0.9608266, 0.07431874, 0.7354088, 1, 0.9137255, 0, 1,
-0.9539776, 1.872514, 0.7023658, 1, 0.9176471, 0, 1,
-0.9512665, -0.8269884, -0.9673278, 1, 0.9254902, 0, 1,
-0.950051, -0.317891, -2.47819, 1, 0.9294118, 0, 1,
-0.9436312, -1.232413, -1.224028, 1, 0.9372549, 0, 1,
-0.9390857, 0.8555573, -0.3623496, 1, 0.9411765, 0, 1,
-0.9389817, 2.26539, -2.277642, 1, 0.9490196, 0, 1,
-0.9376491, 0.4513211, -0.8079771, 1, 0.9529412, 0, 1,
-0.9375564, 0.2185682, -1.500641, 1, 0.9607843, 0, 1,
-0.9373197, 1.900699, -0.253722, 1, 0.9647059, 0, 1,
-0.9349353, -0.4817566, -1.980768, 1, 0.972549, 0, 1,
-0.9341581, -0.4191225, -3.34888, 1, 0.9764706, 0, 1,
-0.9323735, 0.5744324, -1.630191, 1, 0.9843137, 0, 1,
-0.9312138, -0.7254675, -1.256123, 1, 0.9882353, 0, 1,
-0.9261891, 0.4258977, -2.821939, 1, 0.9960784, 0, 1,
-0.9212669, -0.5124629, -1.906386, 0.9960784, 1, 0, 1,
-0.9163966, -0.8660727, -2.166426, 0.9921569, 1, 0, 1,
-0.9105802, -0.1642653, -1.019512, 0.9843137, 1, 0, 1,
-0.9086766, -0.04469325, -1.188305, 0.9803922, 1, 0, 1,
-0.9065975, -1.012923, -1.128855, 0.972549, 1, 0, 1,
-0.9055717, -0.6016089, -2.827038, 0.9686275, 1, 0, 1,
-0.904429, -0.6524377, -1.938259, 0.9607843, 1, 0, 1,
-0.9025986, 1.377907, -1.294734, 0.9568627, 1, 0, 1,
-0.9018592, -0.1792404, -1.813124, 0.9490196, 1, 0, 1,
-0.901091, -1.936612, -2.031034, 0.945098, 1, 0, 1,
-0.896735, 2.368672, -0.2395082, 0.9372549, 1, 0, 1,
-0.8922762, -0.2783771, -1.32629, 0.9333333, 1, 0, 1,
-0.8911926, 0.1366322, -1.417388, 0.9254902, 1, 0, 1,
-0.8905871, -0.4712408, -0.9697809, 0.9215686, 1, 0, 1,
-0.889191, -0.5258761, -1.10619, 0.9137255, 1, 0, 1,
-0.8869502, -2.047313, -3.23719, 0.9098039, 1, 0, 1,
-0.8854855, -0.5556896, -1.926295, 0.9019608, 1, 0, 1,
-0.8746758, 0.2923928, -2.295997, 0.8941177, 1, 0, 1,
-0.8719739, -0.4528984, -0.6674139, 0.8901961, 1, 0, 1,
-0.8716533, 0.7718299, 0.02523313, 0.8823529, 1, 0, 1,
-0.8573253, -0.3803183, -2.085836, 0.8784314, 1, 0, 1,
-0.8546642, -0.7013949, -1.86552, 0.8705882, 1, 0, 1,
-0.8425002, -1.397569, -3.429574, 0.8666667, 1, 0, 1,
-0.8387141, -0.6962359, -0.2336174, 0.8588235, 1, 0, 1,
-0.8344381, 1.202653, -2.927398, 0.854902, 1, 0, 1,
-0.8298776, -1.207056, -3.129799, 0.8470588, 1, 0, 1,
-0.8298196, -1.041762, -1.63524, 0.8431373, 1, 0, 1,
-0.828241, -0.06391285, -3.10032, 0.8352941, 1, 0, 1,
-0.8278806, 0.5885813, -1.521916, 0.8313726, 1, 0, 1,
-0.8276191, -0.00379997, -2.778348, 0.8235294, 1, 0, 1,
-0.8173648, 1.276086, 0.2541914, 0.8196079, 1, 0, 1,
-0.8132762, 1.174054, 0.09075548, 0.8117647, 1, 0, 1,
-0.8110126, 0.3237411, -1.44458, 0.8078431, 1, 0, 1,
-0.8096356, -0.7497907, -3.488269, 0.8, 1, 0, 1,
-0.7980199, 0.611062, 0.3747347, 0.7921569, 1, 0, 1,
-0.7979887, 1.20301, 0.6770275, 0.7882353, 1, 0, 1,
-0.7969602, -0.04913419, -3.075853, 0.7803922, 1, 0, 1,
-0.7945846, -1.325407, -2.935647, 0.7764706, 1, 0, 1,
-0.788424, -1.071273, -3.493047, 0.7686275, 1, 0, 1,
-0.7874293, 2.120921, -1.978204, 0.7647059, 1, 0, 1,
-0.7856982, -0.3562003, -3.538809, 0.7568628, 1, 0, 1,
-0.7847937, -1.305179, 0.9724286, 0.7529412, 1, 0, 1,
-0.7844919, -0.8348757, -0.8461266, 0.7450981, 1, 0, 1,
-0.7794963, 0.3123772, -0.03838594, 0.7411765, 1, 0, 1,
-0.7794656, 1.273934, -0.729884, 0.7333333, 1, 0, 1,
-0.7783177, 0.1790528, -1.605576, 0.7294118, 1, 0, 1,
-0.7745512, 1.149951, -0.8810679, 0.7215686, 1, 0, 1,
-0.7718309, -0.6253883, -0.953042, 0.7176471, 1, 0, 1,
-0.7708521, -0.8994633, -1.912828, 0.7098039, 1, 0, 1,
-0.7691806, -0.4120018, -2.092464, 0.7058824, 1, 0, 1,
-0.7685357, -0.02992889, -1.352612, 0.6980392, 1, 0, 1,
-0.7644619, 0.208651, -2.157311, 0.6901961, 1, 0, 1,
-0.7621738, -0.671942, -2.850906, 0.6862745, 1, 0, 1,
-0.7611699, 1.168678, -0.7016288, 0.6784314, 1, 0, 1,
-0.7561162, 1.169193, -1.198632, 0.6745098, 1, 0, 1,
-0.7537628, -0.01931238, -1.045249, 0.6666667, 1, 0, 1,
-0.7522934, 0.2401157, -3.558366, 0.6627451, 1, 0, 1,
-0.7515693, -0.5553835, -1.796685, 0.654902, 1, 0, 1,
-0.7470862, 0.4060539, 1.005031, 0.6509804, 1, 0, 1,
-0.7465774, -0.006694801, -2.857836, 0.6431373, 1, 0, 1,
-0.7452399, -0.3108449, -3.338799, 0.6392157, 1, 0, 1,
-0.7372696, 0.533675, -1.897118, 0.6313726, 1, 0, 1,
-0.7340124, 0.1983474, -2.628983, 0.627451, 1, 0, 1,
-0.7302807, -1.477672, -2.511461, 0.6196079, 1, 0, 1,
-0.7289991, 1.879858, 1.079625, 0.6156863, 1, 0, 1,
-0.7283987, 0.0556072, -1.232441, 0.6078432, 1, 0, 1,
-0.7283456, 0.05966721, -0.1903317, 0.6039216, 1, 0, 1,
-0.7221432, 0.9987043, -0.3683908, 0.5960785, 1, 0, 1,
-0.7216272, 0.3871468, -2.018957, 0.5882353, 1, 0, 1,
-0.7207828, 0.8683783, -1.722565, 0.5843138, 1, 0, 1,
-0.7197788, -0.8577987, -3.643823, 0.5764706, 1, 0, 1,
-0.7196671, 0.08352195, -1.637263, 0.572549, 1, 0, 1,
-0.7193666, -0.2887013, -1.736152, 0.5647059, 1, 0, 1,
-0.7176415, -1.367802, -3.074506, 0.5607843, 1, 0, 1,
-0.7152369, -0.5502025, 0.4569376, 0.5529412, 1, 0, 1,
-0.7134873, -0.4711602, -4.745155, 0.5490196, 1, 0, 1,
-0.7080206, -0.2109872, -3.214967, 0.5411765, 1, 0, 1,
-0.7072896, 0.902289, -0.2657509, 0.5372549, 1, 0, 1,
-0.7054898, 1.504831, -1.027839, 0.5294118, 1, 0, 1,
-0.6981126, 0.0606912, -1.089205, 0.5254902, 1, 0, 1,
-0.693004, -0.2496701, -3.154288, 0.5176471, 1, 0, 1,
-0.6904989, -2.634675, 0.5836579, 0.5137255, 1, 0, 1,
-0.6903377, -0.6645821, -3.196607, 0.5058824, 1, 0, 1,
-0.6837756, 0.9731502, -0.9158784, 0.5019608, 1, 0, 1,
-0.674336, -0.2900548, -1.255071, 0.4941176, 1, 0, 1,
-0.670022, 0.36078, 0.04964984, 0.4862745, 1, 0, 1,
-0.6683019, 0.7561027, -3.076156, 0.4823529, 1, 0, 1,
-0.667834, 0.8103752, 0.8853072, 0.4745098, 1, 0, 1,
-0.6643454, -0.3667054, -3.042804, 0.4705882, 1, 0, 1,
-0.6626581, -1.210725, -3.275099, 0.4627451, 1, 0, 1,
-0.6612808, -0.2224056, -1.805282, 0.4588235, 1, 0, 1,
-0.6610362, 0.1430794, 0.5164455, 0.4509804, 1, 0, 1,
-0.6605123, 0.286415, -1.92942, 0.4470588, 1, 0, 1,
-0.6577919, -0.207365, -1.254016, 0.4392157, 1, 0, 1,
-0.6576522, 0.6852493, -0.05785011, 0.4352941, 1, 0, 1,
-0.6532387, 0.7112622, -0.4127704, 0.427451, 1, 0, 1,
-0.652091, -0.01895784, -1.477693, 0.4235294, 1, 0, 1,
-0.6474901, 0.6995497, -1.084168, 0.4156863, 1, 0, 1,
-0.6443903, -0.8416582, -1.836441, 0.4117647, 1, 0, 1,
-0.6392872, 0.664587, 0.7953843, 0.4039216, 1, 0, 1,
-0.6365259, 1.573414, -0.6860735, 0.3960784, 1, 0, 1,
-0.6358242, 0.05656596, -0.9799726, 0.3921569, 1, 0, 1,
-0.6354622, 1.107143, -2.064049, 0.3843137, 1, 0, 1,
-0.6308085, 1.192229, -0.183772, 0.3803922, 1, 0, 1,
-0.6289583, 1.126052, 1.478131, 0.372549, 1, 0, 1,
-0.6187016, -1.276667, -1.962105, 0.3686275, 1, 0, 1,
-0.60818, -1.305513, -3.235192, 0.3607843, 1, 0, 1,
-0.6041503, 1.295, -1.773826, 0.3568628, 1, 0, 1,
-0.5992107, -1.794344, -1.440738, 0.3490196, 1, 0, 1,
-0.597102, 1.359527, -1.551648, 0.345098, 1, 0, 1,
-0.5938548, 0.9711594, 0.06978453, 0.3372549, 1, 0, 1,
-0.5922759, -1.212378, -2.31037, 0.3333333, 1, 0, 1,
-0.5919022, 0.461374, -1.592142, 0.3254902, 1, 0, 1,
-0.5910398, -0.6998165, -2.967866, 0.3215686, 1, 0, 1,
-0.5909357, -0.1916311, -2.297262, 0.3137255, 1, 0, 1,
-0.5887048, -0.3486435, -1.905804, 0.3098039, 1, 0, 1,
-0.5876336, 0.321765, -0.69363, 0.3019608, 1, 0, 1,
-0.5874318, 0.8835042, 0.972506, 0.2941177, 1, 0, 1,
-0.5829352, 0.999185, -0.3981953, 0.2901961, 1, 0, 1,
-0.5803832, 0.7767012, 0.3185061, 0.282353, 1, 0, 1,
-0.5667846, -1.427503, -4.236311, 0.2784314, 1, 0, 1,
-0.5621821, -0.3945531, -2.327164, 0.2705882, 1, 0, 1,
-0.5618992, 1.284022, 0.6276604, 0.2666667, 1, 0, 1,
-0.5618426, -1.538892, -1.896952, 0.2588235, 1, 0, 1,
-0.5607073, -0.6102268, -1.834092, 0.254902, 1, 0, 1,
-0.5606017, 0.8289666, -1.958732, 0.2470588, 1, 0, 1,
-0.5605916, 0.5821727, 0.3789032, 0.2431373, 1, 0, 1,
-0.5533533, -3.309094, -0.3093727, 0.2352941, 1, 0, 1,
-0.5484981, -0.1562073, -1.104204, 0.2313726, 1, 0, 1,
-0.5473159, 0.7569825, -1.446759, 0.2235294, 1, 0, 1,
-0.5408704, 0.3926582, -0.6852766, 0.2196078, 1, 0, 1,
-0.5401449, 0.8724518, -1.260091, 0.2117647, 1, 0, 1,
-0.5380902, -0.9532623, -2.738734, 0.2078431, 1, 0, 1,
-0.5343833, -0.8806064, -2.180897, 0.2, 1, 0, 1,
-0.5337766, 0.1145108, -2.999153, 0.1921569, 1, 0, 1,
-0.5332456, 1.277761, -1.995992, 0.1882353, 1, 0, 1,
-0.5330184, 0.2251783, -0.3378628, 0.1803922, 1, 0, 1,
-0.5313473, 1.268483, 0.851236, 0.1764706, 1, 0, 1,
-0.5294756, -0.4733518, 0.05867015, 0.1686275, 1, 0, 1,
-0.5257124, -1.034655, -3.860922, 0.1647059, 1, 0, 1,
-0.5248902, 1.329796, -0.1106978, 0.1568628, 1, 0, 1,
-0.5241928, -0.9142469, -1.498445, 0.1529412, 1, 0, 1,
-0.5240966, 0.7144542, 1.609091, 0.145098, 1, 0, 1,
-0.521914, -0.9884183, -2.347054, 0.1411765, 1, 0, 1,
-0.5202356, -0.3220451, -3.372213, 0.1333333, 1, 0, 1,
-0.5194504, -0.8422486, -2.368407, 0.1294118, 1, 0, 1,
-0.5175489, -0.2845325, -2.955508, 0.1215686, 1, 0, 1,
-0.5162941, 0.1542801, -0.7714062, 0.1176471, 1, 0, 1,
-0.5160061, 1.063187, -2.782966, 0.1098039, 1, 0, 1,
-0.5128453, -1.589955, -2.186958, 0.1058824, 1, 0, 1,
-0.5126732, -0.7320508, -3.5235, 0.09803922, 1, 0, 1,
-0.5093902, -0.7794051, -3.178216, 0.09019608, 1, 0, 1,
-0.5089542, 0.6807943, 0.6263493, 0.08627451, 1, 0, 1,
-0.5071603, -0.8237617, -4.299912, 0.07843138, 1, 0, 1,
-0.4984637, 0.1045817, -0.5685619, 0.07450981, 1, 0, 1,
-0.4971419, 1.444311, -0.4547348, 0.06666667, 1, 0, 1,
-0.496967, -0.3262491, -3.56391, 0.0627451, 1, 0, 1,
-0.4917715, -1.385937, -2.365026, 0.05490196, 1, 0, 1,
-0.4854027, -1.536942, -4.750357, 0.05098039, 1, 0, 1,
-0.4827568, -0.3675122, -1.605298, 0.04313726, 1, 0, 1,
-0.4815222, -0.1254514, -1.102215, 0.03921569, 1, 0, 1,
-0.4766681, 1.109022, 0.9396628, 0.03137255, 1, 0, 1,
-0.4738739, 0.7840343, 0.5156989, 0.02745098, 1, 0, 1,
-0.472095, -1.733276, -0.4306733, 0.01960784, 1, 0, 1,
-0.4712197, 0.5633407, 0.3977136, 0.01568628, 1, 0, 1,
-0.470339, 1.046193, 0.1291651, 0.007843138, 1, 0, 1,
-0.4658226, 1.71716, -0.1442303, 0.003921569, 1, 0, 1,
-0.4657759, -2.955583, -1.191481, 0, 1, 0.003921569, 1,
-0.4593409, 1.228537, -0.229365, 0, 1, 0.01176471, 1,
-0.4553956, 1.108705, -0.7498667, 0, 1, 0.01568628, 1,
-0.4552725, -0.199637, -2.265824, 0, 1, 0.02352941, 1,
-0.4541567, -1.154733, -1.013985, 0, 1, 0.02745098, 1,
-0.4537314, 0.3627251, -1.337979, 0, 1, 0.03529412, 1,
-0.4513326, 1.51418, 2.009132, 0, 1, 0.03921569, 1,
-0.4508938, -0.7780779, -1.298848, 0, 1, 0.04705882, 1,
-0.4499758, 0.4753973, -1.162678, 0, 1, 0.05098039, 1,
-0.4488418, 0.6830345, -0.1841588, 0, 1, 0.05882353, 1,
-0.448014, 1.425729, -0.1065294, 0, 1, 0.0627451, 1,
-0.4477278, 1.700675, -1.153809, 0, 1, 0.07058824, 1,
-0.4455568, -0.09697311, -0.6304436, 0, 1, 0.07450981, 1,
-0.443066, 1.663814, -1.399388, 0, 1, 0.08235294, 1,
-0.442428, -2.122314, -3.241351, 0, 1, 0.08627451, 1,
-0.4397422, 1.543528, -1.936372, 0, 1, 0.09411765, 1,
-0.4393397, 0.2315547, -1.791308, 0, 1, 0.1019608, 1,
-0.4378861, -0.2309927, -1.604188, 0, 1, 0.1058824, 1,
-0.437205, -1.369307, -1.444362, 0, 1, 0.1137255, 1,
-0.4320739, 1.157316, -1.511803, 0, 1, 0.1176471, 1,
-0.4310792, 1.169669, -1.278489, 0, 1, 0.1254902, 1,
-0.4291114, 0.7927231, -0.4717972, 0, 1, 0.1294118, 1,
-0.4284237, -0.7426803, -3.381563, 0, 1, 0.1372549, 1,
-0.4209301, 0.2203915, -2.228373, 0, 1, 0.1411765, 1,
-0.4188007, 1.95496, -0.5138019, 0, 1, 0.1490196, 1,
-0.4169766, -0.05524776, -2.995117, 0, 1, 0.1529412, 1,
-0.4154176, 0.5719688, -0.5534378, 0, 1, 0.1607843, 1,
-0.4145228, -1.494433, -3.075278, 0, 1, 0.1647059, 1,
-0.4000732, -0.5577218, -2.08636, 0, 1, 0.172549, 1,
-0.3930661, -0.7638666, -2.302893, 0, 1, 0.1764706, 1,
-0.3885798, -0.005846671, -1.405716, 0, 1, 0.1843137, 1,
-0.3867724, 0.9492363, -0.0185426, 0, 1, 0.1882353, 1,
-0.3829765, 0.5518703, -0.2689232, 0, 1, 0.1960784, 1,
-0.3826692, 0.8954251, 2.222244, 0, 1, 0.2039216, 1,
-0.3816205, 0.6925774, 0.2924857, 0, 1, 0.2078431, 1,
-0.3810661, 0.5182791, -0.4302988, 0, 1, 0.2156863, 1,
-0.3802293, 0.2470441, -2.53167, 0, 1, 0.2196078, 1,
-0.3784709, 0.6609824, -0.3840975, 0, 1, 0.227451, 1,
-0.3770323, -1.034406, -3.452425, 0, 1, 0.2313726, 1,
-0.3618067, -0.4064952, -2.760761, 0, 1, 0.2392157, 1,
-0.3616798, -0.4913154, -3.4061, 0, 1, 0.2431373, 1,
-0.3579046, -0.8694488, -2.480064, 0, 1, 0.2509804, 1,
-0.3572604, 0.4597325, -0.2844099, 0, 1, 0.254902, 1,
-0.3569641, -0.9299377, -2.938948, 0, 1, 0.2627451, 1,
-0.3544163, 2.04727, -0.4130554, 0, 1, 0.2666667, 1,
-0.3488691, -0.9255626, -3.50701, 0, 1, 0.2745098, 1,
-0.346191, -0.1864118, -2.336553, 0, 1, 0.2784314, 1,
-0.3407487, -0.2960982, -3.609382, 0, 1, 0.2862745, 1,
-0.33185, -1.860482, -1.729885, 0, 1, 0.2901961, 1,
-0.3090233, 0.05927493, -2.518353, 0, 1, 0.2980392, 1,
-0.307618, 0.377372, -0.5939645, 0, 1, 0.3058824, 1,
-0.3067101, -0.4351337, -2.873369, 0, 1, 0.3098039, 1,
-0.3064849, 1.028426, -1.905698, 0, 1, 0.3176471, 1,
-0.3021126, -1.321405, -3.649344, 0, 1, 0.3215686, 1,
-0.2987586, -0.8285723, -2.290212, 0, 1, 0.3294118, 1,
-0.2944668, 0.3411385, -0.6711082, 0, 1, 0.3333333, 1,
-0.2920631, -1.190528, -2.80145, 0, 1, 0.3411765, 1,
-0.2875594, 0.4410758, 1.531935, 0, 1, 0.345098, 1,
-0.2867333, -0.4893428, -3.525196, 0, 1, 0.3529412, 1,
-0.2864932, 0.6554183, 0.4435666, 0, 1, 0.3568628, 1,
-0.2812903, 0.9843891, -3.096302, 0, 1, 0.3647059, 1,
-0.2700321, -0.3003107, -3.219496, 0, 1, 0.3686275, 1,
-0.2674881, -1.087807, -2.183454, 0, 1, 0.3764706, 1,
-0.2668619, -0.5029683, -3.044284, 0, 1, 0.3803922, 1,
-0.2664805, 1.98195, -0.007128241, 0, 1, 0.3882353, 1,
-0.2645156, -1.316708, -2.374496, 0, 1, 0.3921569, 1,
-0.2598277, 2.038595, 1.116627, 0, 1, 0.4, 1,
-0.2587141, -0.4626642, -1.186021, 0, 1, 0.4078431, 1,
-0.2582087, -0.8324625, -3.94491, 0, 1, 0.4117647, 1,
-0.2575777, 0.4364607, 0.1872219, 0, 1, 0.4196078, 1,
-0.2567781, 1.891564, -0.2137702, 0, 1, 0.4235294, 1,
-0.2566095, -1.581564, -3.908025, 0, 1, 0.4313726, 1,
-0.2552381, -0.6634707, -2.948503, 0, 1, 0.4352941, 1,
-0.2517385, 0.5275731, 0.9067747, 0, 1, 0.4431373, 1,
-0.251458, -0.1958963, -1.222373, 0, 1, 0.4470588, 1,
-0.2503141, 1.035351, -1.466305, 0, 1, 0.454902, 1,
-0.2497359, -0.3327676, -1.043767, 0, 1, 0.4588235, 1,
-0.2454782, -0.5384666, -4.074854, 0, 1, 0.4666667, 1,
-0.2437203, 0.01929411, -2.456135, 0, 1, 0.4705882, 1,
-0.2389038, -0.1022482, -2.757, 0, 1, 0.4784314, 1,
-0.2376892, -1.242695, -1.519695, 0, 1, 0.4823529, 1,
-0.2330659, -0.6476434, -2.439609, 0, 1, 0.4901961, 1,
-0.2330557, -2.790301, -4.528169, 0, 1, 0.4941176, 1,
-0.2324201, -0.4868406, -2.096699, 0, 1, 0.5019608, 1,
-0.2290029, 0.8463777, 0.4549983, 0, 1, 0.509804, 1,
-0.2276557, 0.2090356, -0.2662819, 0, 1, 0.5137255, 1,
-0.2237925, -2.192392, -4.900774, 0, 1, 0.5215687, 1,
-0.2237006, -0.6647175, -1.331559, 0, 1, 0.5254902, 1,
-0.2134282, -0.5327545, -1.042896, 0, 1, 0.5333334, 1,
-0.2082371, -1.320913, -1.788671, 0, 1, 0.5372549, 1,
-0.2081681, 0.3225949, 0.02797644, 0, 1, 0.5450981, 1,
-0.2058298, -1.796229, -2.09265, 0, 1, 0.5490196, 1,
-0.2039627, 0.212246, -0.6999783, 0, 1, 0.5568628, 1,
-0.2034337, -0.6034916, -1.12969, 0, 1, 0.5607843, 1,
-0.1941779, 0.7765152, -0.3328784, 0, 1, 0.5686275, 1,
-0.1915551, 1.122884, 0.4964978, 0, 1, 0.572549, 1,
-0.1907411, -0.8275011, -2.108929, 0, 1, 0.5803922, 1,
-0.1899522, -1.344582, -2.055444, 0, 1, 0.5843138, 1,
-0.189205, 0.6896839, 0.2560749, 0, 1, 0.5921569, 1,
-0.1858819, 1.799616, 1.358809, 0, 1, 0.5960785, 1,
-0.1842326, -0.3837872, -3.319485, 0, 1, 0.6039216, 1,
-0.1840824, -1.622677, -1.659017, 0, 1, 0.6117647, 1,
-0.1838131, 2.547023, 0.880994, 0, 1, 0.6156863, 1,
-0.1822704, -1.363397, -3.339954, 0, 1, 0.6235294, 1,
-0.1722843, -0.3057549, -3.965495, 0, 1, 0.627451, 1,
-0.1716136, -1.050501, -2.78061, 0, 1, 0.6352941, 1,
-0.1684226, 1.470001, 0.09722934, 0, 1, 0.6392157, 1,
-0.1652937, -0.3247804, -3.72693, 0, 1, 0.6470588, 1,
-0.1629054, -0.987797, -1.59991, 0, 1, 0.6509804, 1,
-0.1603724, -1.393338, -1.742161, 0, 1, 0.6588235, 1,
-0.1539319, -0.2762264, -3.100297, 0, 1, 0.6627451, 1,
-0.1524792, 1.048555, -0.7905254, 0, 1, 0.6705883, 1,
-0.1498561, -0.3684863, -2.533941, 0, 1, 0.6745098, 1,
-0.1496028, -0.7333246, -2.378339, 0, 1, 0.682353, 1,
-0.1486716, -0.4083081, -1.368542, 0, 1, 0.6862745, 1,
-0.1456948, 2.699685, -3.124596, 0, 1, 0.6941177, 1,
-0.1447019, -0.05908239, -2.027349, 0, 1, 0.7019608, 1,
-0.1433082, -0.6657456, -1.633327, 0, 1, 0.7058824, 1,
-0.1419816, -0.4466932, -4.511158, 0, 1, 0.7137255, 1,
-0.1402633, -0.8777417, -1.970147, 0, 1, 0.7176471, 1,
-0.1401239, 0.5014532, -0.2916835, 0, 1, 0.7254902, 1,
-0.1383848, 0.3335712, 0.4049115, 0, 1, 0.7294118, 1,
-0.1370285, -1.798012, -3.627838, 0, 1, 0.7372549, 1,
-0.135937, -0.5827253, -2.194929, 0, 1, 0.7411765, 1,
-0.1352845, 0.03517344, -2.825106, 0, 1, 0.7490196, 1,
-0.1290094, -0.2038595, -3.258223, 0, 1, 0.7529412, 1,
-0.123614, -1.02166, -4.517393, 0, 1, 0.7607843, 1,
-0.1182285, -0.4672711, -4.526541, 0, 1, 0.7647059, 1,
-0.1154348, -0.4365672, -3.091061, 0, 1, 0.772549, 1,
-0.1103949, 1.822753, -0.7470894, 0, 1, 0.7764706, 1,
-0.104028, -0.935477, -1.364791, 0, 1, 0.7843137, 1,
-0.09798375, -0.1980905, -2.330166, 0, 1, 0.7882353, 1,
-0.0896694, -1.220237, -0.4770831, 0, 1, 0.7960784, 1,
-0.08885439, 0.2561167, 1.364708, 0, 1, 0.8039216, 1,
-0.08686972, -0.01059952, -1.983632, 0, 1, 0.8078431, 1,
-0.08646479, -0.6951281, -2.673931, 0, 1, 0.8156863, 1,
-0.08627461, -0.1115389, -3.300852, 0, 1, 0.8196079, 1,
-0.08389436, 1.099728, -1.447663, 0, 1, 0.827451, 1,
-0.08206277, 0.5639622, -2.951701, 0, 1, 0.8313726, 1,
-0.0796985, 2.077721, -0.879634, 0, 1, 0.8392157, 1,
-0.07617613, 0.001349749, -0.6461956, 0, 1, 0.8431373, 1,
-0.07609408, -0.1469256, -1.671911, 0, 1, 0.8509804, 1,
-0.07254731, 0.1968365, 0.8791509, 0, 1, 0.854902, 1,
-0.07084119, 0.5100369, -2.596885, 0, 1, 0.8627451, 1,
-0.06748161, 0.53395, 0.7640427, 0, 1, 0.8666667, 1,
-0.06672817, -0.8719385, -2.673599, 0, 1, 0.8745098, 1,
-0.06629772, 0.05881247, -0.8151167, 0, 1, 0.8784314, 1,
-0.0652852, -0.528081, -2.560538, 0, 1, 0.8862745, 1,
-0.06357372, -0.2583706, -3.731384, 0, 1, 0.8901961, 1,
-0.06314912, -0.2113184, -1.335011, 0, 1, 0.8980392, 1,
-0.05893673, -0.2108311, -2.787965, 0, 1, 0.9058824, 1,
-0.05691132, 0.3217163, -1.002128, 0, 1, 0.9098039, 1,
-0.05487898, -0.1294845, -3.58742, 0, 1, 0.9176471, 1,
-0.05367908, 1.648618, -0.3345019, 0, 1, 0.9215686, 1,
-0.05062359, 1.459558, 1.25075, 0, 1, 0.9294118, 1,
-0.05005961, 0.4918807, -0.6755374, 0, 1, 0.9333333, 1,
-0.04961298, -1.544304, -4.019435, 0, 1, 0.9411765, 1,
-0.04240116, 2.846067, -1.180944, 0, 1, 0.945098, 1,
-0.04239225, -0.8514532, -3.484665, 0, 1, 0.9529412, 1,
-0.03877621, 0.03321748, -0.2660394, 0, 1, 0.9568627, 1,
-0.03597919, 0.06231352, -1.878168, 0, 1, 0.9647059, 1,
-0.03517969, 0.7064773, 2.272894, 0, 1, 0.9686275, 1,
-0.03377649, 1.041031, 1.002854, 0, 1, 0.9764706, 1,
-0.03329512, -1.182102, -3.302469, 0, 1, 0.9803922, 1,
-0.03100366, -1.637756, -2.473734, 0, 1, 0.9882353, 1,
-0.02957845, -0.4049412, -2.055422, 0, 1, 0.9921569, 1,
-0.0287385, -0.672457, -2.657647, 0, 1, 1, 1,
-0.02690545, -1.151313, -2.190618, 0, 0.9921569, 1, 1,
-0.02346392, -0.2999142, -2.488001, 0, 0.9882353, 1, 1,
-0.0220767, -0.2597271, -4.001874, 0, 0.9803922, 1, 1,
-0.01689327, 0.5270224, -0.1358974, 0, 0.9764706, 1, 1,
-0.01633783, -0.2870752, -3.865017, 0, 0.9686275, 1, 1,
-0.008558854, -0.3784063, -4.230875, 0, 0.9647059, 1, 1,
-0.006218665, 2.063334, 1.36084, 0, 0.9568627, 1, 1,
0.001616448, 0.2522178, 1.228667, 0, 0.9529412, 1, 1,
0.002774482, -0.5717853, 3.064934, 0, 0.945098, 1, 1,
0.003058308, -1.305509, 1.778382, 0, 0.9411765, 1, 1,
0.005425035, 0.3182458, 0.1222677, 0, 0.9333333, 1, 1,
0.006583695, -0.7123359, 2.815389, 0, 0.9294118, 1, 1,
0.01163772, 0.2924355, -0.1779411, 0, 0.9215686, 1, 1,
0.01417848, 0.2523475, 0.6148319, 0, 0.9176471, 1, 1,
0.0154053, 0.5528885, -0.3930169, 0, 0.9098039, 1, 1,
0.01818715, -0.9177213, 2.424449, 0, 0.9058824, 1, 1,
0.02035684, -0.07037617, 2.826368, 0, 0.8980392, 1, 1,
0.02193237, -0.2038042, 4.705063, 0, 0.8901961, 1, 1,
0.03255874, -0.2814051, 4.282191, 0, 0.8862745, 1, 1,
0.03291125, -0.2917895, 2.973412, 0, 0.8784314, 1, 1,
0.03699041, -0.265043, 4.543915, 0, 0.8745098, 1, 1,
0.03936833, 0.1803884, -0.8341292, 0, 0.8666667, 1, 1,
0.04229402, 1.184122, -0.2081376, 0, 0.8627451, 1, 1,
0.04481023, -1.043928, 3.81728, 0, 0.854902, 1, 1,
0.04603523, 1.033343, 0.5515872, 0, 0.8509804, 1, 1,
0.04625903, -0.612371, 0.9031406, 0, 0.8431373, 1, 1,
0.05275193, -0.4531102, 3.145738, 0, 0.8392157, 1, 1,
0.0537906, -0.8509653, 3.506036, 0, 0.8313726, 1, 1,
0.05388201, -1.163351, 3.553111, 0, 0.827451, 1, 1,
0.0588132, 1.138135, -0.5869653, 0, 0.8196079, 1, 1,
0.06187633, -0.5212596, 1.722771, 0, 0.8156863, 1, 1,
0.07042339, 1.983102, 0.9612556, 0, 0.8078431, 1, 1,
0.07047525, 1.637018, -0.4626079, 0, 0.8039216, 1, 1,
0.07264474, 0.7763962, -1.295459, 0, 0.7960784, 1, 1,
0.07283406, -0.3781564, 2.745736, 0, 0.7882353, 1, 1,
0.07426106, -1.151833, 2.229152, 0, 0.7843137, 1, 1,
0.07528514, 0.08761277, 1.097717, 0, 0.7764706, 1, 1,
0.07613984, 0.6505244, -0.7474782, 0, 0.772549, 1, 1,
0.07627647, -0.8910065, 2.349663, 0, 0.7647059, 1, 1,
0.07674568, 0.6142607, -1.043043, 0, 0.7607843, 1, 1,
0.07825647, 0.4846384, 0.09086212, 0, 0.7529412, 1, 1,
0.07868071, -0.5326262, 2.289804, 0, 0.7490196, 1, 1,
0.08289764, -1.124644, 3.368774, 0, 0.7411765, 1, 1,
0.08349326, 0.7435642, 0.7302228, 0, 0.7372549, 1, 1,
0.08812605, -0.2389114, 2.325208, 0, 0.7294118, 1, 1,
0.09218567, 1.840178, -1.927946, 0, 0.7254902, 1, 1,
0.1034188, -0.4666789, 2.597145, 0, 0.7176471, 1, 1,
0.1037594, 0.4332542, 1.634478, 0, 0.7137255, 1, 1,
0.10385, 1.196345, 0.643681, 0, 0.7058824, 1, 1,
0.1066129, -0.6215017, 1.838998, 0, 0.6980392, 1, 1,
0.1076573, 0.6818416, -0.4697884, 0, 0.6941177, 1, 1,
0.1097467, 1.024892, -0.5255318, 0, 0.6862745, 1, 1,
0.1102035, -0.8953583, 2.599095, 0, 0.682353, 1, 1,
0.1143578, 0.8098284, 0.329308, 0, 0.6745098, 1, 1,
0.1143823, -0.0756348, 0.2886271, 0, 0.6705883, 1, 1,
0.1181839, 0.1918603, -1.884701, 0, 0.6627451, 1, 1,
0.1203952, 0.07562229, 1.075868, 0, 0.6588235, 1, 1,
0.1224413, 0.9184503, -0.7936496, 0, 0.6509804, 1, 1,
0.124075, -0.5658714, 2.87566, 0, 0.6470588, 1, 1,
0.1250957, 0.567426, 1.228454, 0, 0.6392157, 1, 1,
0.1262667, -0.7048327, 4.036994, 0, 0.6352941, 1, 1,
0.1277104, 0.05225878, 2.737927, 0, 0.627451, 1, 1,
0.1320751, 1.35635, -0.3706214, 0, 0.6235294, 1, 1,
0.1344475, 2.256685, 0.7949614, 0, 0.6156863, 1, 1,
0.1371097, -0.6844196, 3.8106, 0, 0.6117647, 1, 1,
0.1388589, 0.6913522, 1.277418, 0, 0.6039216, 1, 1,
0.1422935, 1.419701, 0.8479972, 0, 0.5960785, 1, 1,
0.1446316, -0.2614565, 2.215984, 0, 0.5921569, 1, 1,
0.145371, 0.08049462, 1.854666, 0, 0.5843138, 1, 1,
0.1516211, 1.422554, -0.6440549, 0, 0.5803922, 1, 1,
0.1541305, -0.06391206, 1.94787, 0, 0.572549, 1, 1,
0.1545624, -0.658286, 1.464396, 0, 0.5686275, 1, 1,
0.156872, -0.3488334, 4.301331, 0, 0.5607843, 1, 1,
0.1590912, 0.8690584, -0.3332895, 0, 0.5568628, 1, 1,
0.1606735, -0.2577858, 4.143516, 0, 0.5490196, 1, 1,
0.1656852, -0.6893072, 3.541142, 0, 0.5450981, 1, 1,
0.1657804, -1.030332, 1.547173, 0, 0.5372549, 1, 1,
0.1751955, 0.8845126, -0.3661852, 0, 0.5333334, 1, 1,
0.1758542, -0.2768426, 1.776542, 0, 0.5254902, 1, 1,
0.1790704, 2.00306, 0.9042652, 0, 0.5215687, 1, 1,
0.1816908, 2.263352, -1.527657, 0, 0.5137255, 1, 1,
0.1842048, 0.4599963, 0.9665436, 0, 0.509804, 1, 1,
0.1870462, 1.308997, -0.7992678, 0, 0.5019608, 1, 1,
0.1899547, 0.2972597, 0.78897, 0, 0.4941176, 1, 1,
0.1926195, 0.4399261, 0.2444016, 0, 0.4901961, 1, 1,
0.1928346, 0.1660794, 0.9214278, 0, 0.4823529, 1, 1,
0.193481, 0.2561283, -1.262848, 0, 0.4784314, 1, 1,
0.1970997, 0.5077611, -0.7093206, 0, 0.4705882, 1, 1,
0.2029987, -0.5702509, 3.408607, 0, 0.4666667, 1, 1,
0.2059246, -0.08529402, 2.72824, 0, 0.4588235, 1, 1,
0.2063349, -1.325086, 3.90338, 0, 0.454902, 1, 1,
0.2129256, -0.5879501, 4.292879, 0, 0.4470588, 1, 1,
0.2149461, 0.9460043, 0.7395867, 0, 0.4431373, 1, 1,
0.2182001, -1.403309, 4.122462, 0, 0.4352941, 1, 1,
0.2191123, -0.5235931, 3.496713, 0, 0.4313726, 1, 1,
0.2264046, -0.1445877, 1.929245, 0, 0.4235294, 1, 1,
0.2273606, -0.9522437, 2.928396, 0, 0.4196078, 1, 1,
0.227807, -0.8314408, 3.53056, 0, 0.4117647, 1, 1,
0.227909, 0.8207541, -0.07868237, 0, 0.4078431, 1, 1,
0.2280505, 0.1420335, -0.1844041, 0, 0.4, 1, 1,
0.2295391, 0.4547397, 0.8825424, 0, 0.3921569, 1, 1,
0.2311117, 0.0809256, 1.450127, 0, 0.3882353, 1, 1,
0.235817, 0.2908598, 0.5250039, 0, 0.3803922, 1, 1,
0.2379389, -0.04394344, 1.754259, 0, 0.3764706, 1, 1,
0.2393018, -0.2456617, 2.775103, 0, 0.3686275, 1, 1,
0.2395725, -0.7556526, 2.449092, 0, 0.3647059, 1, 1,
0.244322, -0.1188117, 1.43198, 0, 0.3568628, 1, 1,
0.2449294, 1.217061, 1.099176, 0, 0.3529412, 1, 1,
0.2453673, -0.5279748, 2.746224, 0, 0.345098, 1, 1,
0.2470221, -1.094991, 3.43073, 0, 0.3411765, 1, 1,
0.2559, 1.30216, 0.2801854, 0, 0.3333333, 1, 1,
0.2584994, 0.95228, 1.118176, 0, 0.3294118, 1, 1,
0.2589253, 1.022203, -0.1481608, 0, 0.3215686, 1, 1,
0.2595877, -0.786062, 1.69573, 0, 0.3176471, 1, 1,
0.2626681, -0.6643863, 3.143912, 0, 0.3098039, 1, 1,
0.2633002, -0.05933562, 3.501367, 0, 0.3058824, 1, 1,
0.2691281, -1.301211, 4.730776, 0, 0.2980392, 1, 1,
0.2708847, -0.7709746, 2.164835, 0, 0.2901961, 1, 1,
0.2761359, 0.5347465, -1.268935, 0, 0.2862745, 1, 1,
0.2788525, 0.02909928, 0.7669262, 0, 0.2784314, 1, 1,
0.2845418, -0.7834113, 2.662897, 0, 0.2745098, 1, 1,
0.2857746, 0.2045123, 1.130627, 0, 0.2666667, 1, 1,
0.2878315, -2.333502, 4.9267, 0, 0.2627451, 1, 1,
0.2909438, 1.570386, 1.105571, 0, 0.254902, 1, 1,
0.2915964, -1.100255, 0.3653565, 0, 0.2509804, 1, 1,
0.2976382, 0.586431, -0.7216361, 0, 0.2431373, 1, 1,
0.2992435, 1.098133, 0.4074029, 0, 0.2392157, 1, 1,
0.3014466, 0.8597931, 0.4039296, 0, 0.2313726, 1, 1,
0.3027793, 0.1686204, 1.593532, 0, 0.227451, 1, 1,
0.3031128, -0.5518986, 3.349939, 0, 0.2196078, 1, 1,
0.3033182, -0.2089019, 1.291074, 0, 0.2156863, 1, 1,
0.3092846, -0.5117992, 3.103459, 0, 0.2078431, 1, 1,
0.3167123, -0.4443193, 3.241358, 0, 0.2039216, 1, 1,
0.31765, 0.3334847, 1.140779, 0, 0.1960784, 1, 1,
0.3238143, -0.1787771, 2.376551, 0, 0.1882353, 1, 1,
0.3250126, 0.5100106, 1.873229, 0, 0.1843137, 1, 1,
0.3282957, -0.4946076, 2.624748, 0, 0.1764706, 1, 1,
0.3336062, 1.593215, 0.7527438, 0, 0.172549, 1, 1,
0.3405258, -0.03112216, 0.5871205, 0, 0.1647059, 1, 1,
0.348007, -0.9362197, 1.735351, 0, 0.1607843, 1, 1,
0.3493945, -0.4440165, 0.2866464, 0, 0.1529412, 1, 1,
0.3495015, -1.141246, 3.819766, 0, 0.1490196, 1, 1,
0.3507189, 0.8879399, -0.3830488, 0, 0.1411765, 1, 1,
0.3526016, -0.2908311, 0.2213503, 0, 0.1372549, 1, 1,
0.3599595, 0.1266471, 1.896066, 0, 0.1294118, 1, 1,
0.3673492, 0.3832388, 1.648567, 0, 0.1254902, 1, 1,
0.3730579, -0.5570086, 2.221514, 0, 0.1176471, 1, 1,
0.3744392, 0.1069312, 1.314994, 0, 0.1137255, 1, 1,
0.3767504, -0.3999129, 1.95642, 0, 0.1058824, 1, 1,
0.3772618, 0.7425427, 0.7202792, 0, 0.09803922, 1, 1,
0.3798504, 0.3697016, 1.012353, 0, 0.09411765, 1, 1,
0.3812564, -0.6807356, 1.624645, 0, 0.08627451, 1, 1,
0.3830228, -0.1487688, 1.800823, 0, 0.08235294, 1, 1,
0.3851093, 1.206501, 0.005554977, 0, 0.07450981, 1, 1,
0.3868383, 1.371964, -1.112733, 0, 0.07058824, 1, 1,
0.3875743, -0.6715861, 2.893049, 0, 0.0627451, 1, 1,
0.3900837, 1.125101, 0.4242043, 0, 0.05882353, 1, 1,
0.3925504, -1.393377, 2.964671, 0, 0.05098039, 1, 1,
0.3968014, -1.374622, 2.468367, 0, 0.04705882, 1, 1,
0.3971538, -0.7150136, 2.958427, 0, 0.03921569, 1, 1,
0.3990891, -1.11231, 1.904388, 0, 0.03529412, 1, 1,
0.4106724, -0.8227364, 2.101839, 0, 0.02745098, 1, 1,
0.4146382, -1.092545, 2.689376, 0, 0.02352941, 1, 1,
0.4149793, 0.0146816, 0.4878929, 0, 0.01568628, 1, 1,
0.4177892, 0.1005981, 0.8509883, 0, 0.01176471, 1, 1,
0.4209285, 0.4024245, 1.940699, 0, 0.003921569, 1, 1,
0.4226772, -0.7589872, 4.050865, 0.003921569, 0, 1, 1,
0.426666, 1.517273, 1.138228, 0.007843138, 0, 1, 1,
0.4280394, 0.8727494, -0.1552674, 0.01568628, 0, 1, 1,
0.4305595, 0.5945061, 0.5503682, 0.01960784, 0, 1, 1,
0.4332502, -0.1350736, 2.951606, 0.02745098, 0, 1, 1,
0.4337262, -0.4355555, 2.553372, 0.03137255, 0, 1, 1,
0.4342597, -1.451616, 2.114533, 0.03921569, 0, 1, 1,
0.45098, 1.28024, 0.9265382, 0.04313726, 0, 1, 1,
0.4533521, -0.2059339, 4.272114, 0.05098039, 0, 1, 1,
0.4560608, -0.8754954, 0.6082107, 0.05490196, 0, 1, 1,
0.4589689, 0.02038444, 0.9958705, 0.0627451, 0, 1, 1,
0.4590637, -1.909252, 4.632932, 0.06666667, 0, 1, 1,
0.4609116, 1.491591, 0.2515816, 0.07450981, 0, 1, 1,
0.4657827, 1.269241, 1.846055, 0.07843138, 0, 1, 1,
0.4674342, 0.3422767, 1.586711, 0.08627451, 0, 1, 1,
0.4678508, 0.9902695, 0.9280386, 0.09019608, 0, 1, 1,
0.4696979, -0.7901295, -0.09872654, 0.09803922, 0, 1, 1,
0.4735651, -1.803355, 2.252567, 0.1058824, 0, 1, 1,
0.4817592, -0.2370332, 2.068245, 0.1098039, 0, 1, 1,
0.4845769, 0.315923, 0.9214773, 0.1176471, 0, 1, 1,
0.4887942, -1.949814, 3.250046, 0.1215686, 0, 1, 1,
0.4895874, 0.3700033, -1.232117, 0.1294118, 0, 1, 1,
0.4950553, 0.8153005, 0.9608943, 0.1333333, 0, 1, 1,
0.5042688, 3.340579, -1.581314, 0.1411765, 0, 1, 1,
0.5050684, -1.248473, 1.315685, 0.145098, 0, 1, 1,
0.5079078, 0.745524, 0.4191841, 0.1529412, 0, 1, 1,
0.50945, -0.3253062, 2.641596, 0.1568628, 0, 1, 1,
0.509765, 0.3354421, 1.024595, 0.1647059, 0, 1, 1,
0.5131779, 1.214818, 1.259366, 0.1686275, 0, 1, 1,
0.5172772, -0.2239948, 3.061166, 0.1764706, 0, 1, 1,
0.5197942, 0.377897, -0.3536287, 0.1803922, 0, 1, 1,
0.5316022, -0.8800399, 3.977344, 0.1882353, 0, 1, 1,
0.5319595, 0.1392063, 0.3194883, 0.1921569, 0, 1, 1,
0.5352304, -0.9003134, 3.530005, 0.2, 0, 1, 1,
0.5352504, -0.1697009, 3.129291, 0.2078431, 0, 1, 1,
0.5360002, 0.33929, 1.196786, 0.2117647, 0, 1, 1,
0.5362778, -0.4665111, 2.021596, 0.2196078, 0, 1, 1,
0.5385299, -0.6470598, 2.500565, 0.2235294, 0, 1, 1,
0.5398321, 0.1356757, 0.3358037, 0.2313726, 0, 1, 1,
0.5445684, 1.308196, 0.3880335, 0.2352941, 0, 1, 1,
0.5457256, 0.4326815, 2.098508, 0.2431373, 0, 1, 1,
0.5499684, -1.462892, 1.448235, 0.2470588, 0, 1, 1,
0.5546524, 0.1971098, 1.970794, 0.254902, 0, 1, 1,
0.5556395, 1.026002, 1.312455, 0.2588235, 0, 1, 1,
0.5558726, -0.8597734, 2.428689, 0.2666667, 0, 1, 1,
0.5626938, -1.826805, 2.081149, 0.2705882, 0, 1, 1,
0.563333, 2.051772, -0.1395361, 0.2784314, 0, 1, 1,
0.5661755, 0.1510963, 2.010492, 0.282353, 0, 1, 1,
0.5744377, -2.016398, 3.060567, 0.2901961, 0, 1, 1,
0.5793507, -0.4859595, 1.780349, 0.2941177, 0, 1, 1,
0.5799492, 1.150805, 1.188001, 0.3019608, 0, 1, 1,
0.5827366, -1.316309, 2.095118, 0.3098039, 0, 1, 1,
0.5874758, 0.1992562, 0.3513585, 0.3137255, 0, 1, 1,
0.5885668, 0.0009495526, 0.169512, 0.3215686, 0, 1, 1,
0.5901027, 0.929196, -1.186484, 0.3254902, 0, 1, 1,
0.5926515, 1.553071, -0.747613, 0.3333333, 0, 1, 1,
0.5935926, -1.175693, 3.583217, 0.3372549, 0, 1, 1,
0.5943127, -0.052838, 2.246494, 0.345098, 0, 1, 1,
0.5996333, 0.03063715, 1.870437, 0.3490196, 0, 1, 1,
0.6019408, -0.06915732, 1.244414, 0.3568628, 0, 1, 1,
0.6036265, -0.8155994, 2.753091, 0.3607843, 0, 1, 1,
0.6060313, -0.6392893, 3.967374, 0.3686275, 0, 1, 1,
0.6081422, -2.189227, 2.097886, 0.372549, 0, 1, 1,
0.6121879, 2.126431, -0.1402173, 0.3803922, 0, 1, 1,
0.6131036, 0.1372205, 2.544925, 0.3843137, 0, 1, 1,
0.6150635, -0.3045045, 2.902723, 0.3921569, 0, 1, 1,
0.6157848, 1.045049, 0.05791257, 0.3960784, 0, 1, 1,
0.6169371, 0.01984828, 1.460868, 0.4039216, 0, 1, 1,
0.6185269, 0.8169022, 1.408625, 0.4117647, 0, 1, 1,
0.6219935, 0.5082484, 0.7453895, 0.4156863, 0, 1, 1,
0.6225561, 0.9236119, 0.9505066, 0.4235294, 0, 1, 1,
0.6231502, -0.5414445, 2.749361, 0.427451, 0, 1, 1,
0.6233217, 0.8843221, 1.045029, 0.4352941, 0, 1, 1,
0.6236846, 1.590397, 1.150779, 0.4392157, 0, 1, 1,
0.6241862, -0.1731282, 1.269313, 0.4470588, 0, 1, 1,
0.6300356, -1.465875, 3.94927, 0.4509804, 0, 1, 1,
0.6311347, -0.5624481, 1.399241, 0.4588235, 0, 1, 1,
0.6319696, -0.63875, 3.45698, 0.4627451, 0, 1, 1,
0.6356853, -0.808156, 3.755932, 0.4705882, 0, 1, 1,
0.6359388, -0.4223706, 2.556568, 0.4745098, 0, 1, 1,
0.639812, -2.440677, 3.38377, 0.4823529, 0, 1, 1,
0.6400548, 0.1108059, 0.06377641, 0.4862745, 0, 1, 1,
0.6411321, -0.943495, 2.781292, 0.4941176, 0, 1, 1,
0.6441697, -0.3822067, 2.540837, 0.5019608, 0, 1, 1,
0.6481043, 0.529996, 1.084765, 0.5058824, 0, 1, 1,
0.654824, 0.850397, -0.8054806, 0.5137255, 0, 1, 1,
0.6603631, 0.4749909, -0.5350831, 0.5176471, 0, 1, 1,
0.6608851, 0.606831, 2.100293, 0.5254902, 0, 1, 1,
0.6624483, -0.5750102, 1.265752, 0.5294118, 0, 1, 1,
0.6657095, 2.04351, -0.2147793, 0.5372549, 0, 1, 1,
0.6723835, 0.8353708, 1.912087, 0.5411765, 0, 1, 1,
0.6724547, -0.9469007, 2.09348, 0.5490196, 0, 1, 1,
0.6725073, 0.3061777, -0.2840553, 0.5529412, 0, 1, 1,
0.6731238, 0.2617103, 1.347185, 0.5607843, 0, 1, 1,
0.6734169, -1.94664, 3.199776, 0.5647059, 0, 1, 1,
0.6807486, 0.871043, 0.6063904, 0.572549, 0, 1, 1,
0.6837617, -0.5608233, 1.185731, 0.5764706, 0, 1, 1,
0.6840231, -1.476437, 1.802058, 0.5843138, 0, 1, 1,
0.6926916, -0.469714, 1.992141, 0.5882353, 0, 1, 1,
0.7009802, -0.2725331, 1.004417, 0.5960785, 0, 1, 1,
0.7043977, -0.1872318, 3.09796, 0.6039216, 0, 1, 1,
0.7049204, -0.3881716, 2.121316, 0.6078432, 0, 1, 1,
0.7159898, -0.6361498, 2.254873, 0.6156863, 0, 1, 1,
0.7264943, 2.440468, 1.739556, 0.6196079, 0, 1, 1,
0.727556, -2.043124, 2.957648, 0.627451, 0, 1, 1,
0.7310938, -0.695294, 0.4985678, 0.6313726, 0, 1, 1,
0.7311493, -2.984145, 1.560096, 0.6392157, 0, 1, 1,
0.7349328, 0.3843136, 1.423742, 0.6431373, 0, 1, 1,
0.7351632, -2.132974, 2.850572, 0.6509804, 0, 1, 1,
0.7357367, -0.2162403, 1.383154, 0.654902, 0, 1, 1,
0.7374634, 1.771049, 0.4607995, 0.6627451, 0, 1, 1,
0.7408011, 0.1347386, 3.458238, 0.6666667, 0, 1, 1,
0.7417201, -0.2423609, -0.1652387, 0.6745098, 0, 1, 1,
0.7457379, -1.489275, 2.48132, 0.6784314, 0, 1, 1,
0.7507499, -1.018447, 0.7516071, 0.6862745, 0, 1, 1,
0.7515116, -0.5097726, 2.640164, 0.6901961, 0, 1, 1,
0.7546005, -0.2729949, -0.6347387, 0.6980392, 0, 1, 1,
0.7671962, 0.3776223, 0.3044006, 0.7058824, 0, 1, 1,
0.7728968, 0.484194, -0.7137676, 0.7098039, 0, 1, 1,
0.7741753, -0.1379876, 0.5590112, 0.7176471, 0, 1, 1,
0.7794514, 0.2432433, 3.067551, 0.7215686, 0, 1, 1,
0.7815878, -0.654, 1.860615, 0.7294118, 0, 1, 1,
0.7845588, 0.4558357, 2.421843, 0.7333333, 0, 1, 1,
0.792107, 0.8844885, -0.7905457, 0.7411765, 0, 1, 1,
0.7996646, 0.3410113, 0.3876674, 0.7450981, 0, 1, 1,
0.8025245, -0.8882062, 2.567913, 0.7529412, 0, 1, 1,
0.8071882, -0.04204173, 2.095209, 0.7568628, 0, 1, 1,
0.8111925, -1.300384, 2.202126, 0.7647059, 0, 1, 1,
0.8133133, 0.2638229, 2.603746, 0.7686275, 0, 1, 1,
0.8162855, -0.7855779, 3.000754, 0.7764706, 0, 1, 1,
0.8186937, -0.1164426, 0.9167221, 0.7803922, 0, 1, 1,
0.8214764, -1.870469, 2.295864, 0.7882353, 0, 1, 1,
0.8216536, 0.1477549, 2.831345, 0.7921569, 0, 1, 1,
0.8246394, 0.708617, 0.3885019, 0.8, 0, 1, 1,
0.8255213, -0.4222509, 4.1508, 0.8078431, 0, 1, 1,
0.8285618, 0.6537334, 0.772786, 0.8117647, 0, 1, 1,
0.834329, -0.3873201, 0.02490672, 0.8196079, 0, 1, 1,
0.8381184, -0.6499646, 1.075453, 0.8235294, 0, 1, 1,
0.8392975, -0.223824, 0.7667704, 0.8313726, 0, 1, 1,
0.8458201, -1.021206, 1.510153, 0.8352941, 0, 1, 1,
0.8480943, 0.145737, 1.320349, 0.8431373, 0, 1, 1,
0.8511539, -0.2430484, 2.122695, 0.8470588, 0, 1, 1,
0.8657084, 0.009940998, 1.861788, 0.854902, 0, 1, 1,
0.8692883, -0.01285593, 1.073271, 0.8588235, 0, 1, 1,
0.8709042, -0.625962, 1.580315, 0.8666667, 0, 1, 1,
0.8752822, -0.7583455, 0.5756589, 0.8705882, 0, 1, 1,
0.878952, 1.305763, 0.3106786, 0.8784314, 0, 1, 1,
0.8924235, -0.0340411, 1.335917, 0.8823529, 0, 1, 1,
0.8961582, 0.06857562, 1.724445, 0.8901961, 0, 1, 1,
0.8993309, 0.3580888, 1.942029, 0.8941177, 0, 1, 1,
0.9013475, -0.1805725, 2.765967, 0.9019608, 0, 1, 1,
0.9037418, 0.463901, 0.3254425, 0.9098039, 0, 1, 1,
0.912716, -1.04249, 4.02855, 0.9137255, 0, 1, 1,
0.9133632, -1.391412, 1.571584, 0.9215686, 0, 1, 1,
0.9172789, 1.906536, -0.2120562, 0.9254902, 0, 1, 1,
0.920884, -1.11401, 1.70468, 0.9333333, 0, 1, 1,
0.9266839, -0.8101492, 1.114507, 0.9372549, 0, 1, 1,
0.9328151, -0.9585831, 1.616508, 0.945098, 0, 1, 1,
0.9480876, 1.041824, 0.1004212, 0.9490196, 0, 1, 1,
0.9525305, -0.7858359, 1.221619, 0.9568627, 0, 1, 1,
0.957998, -0.5964, 3.293553, 0.9607843, 0, 1, 1,
0.9592782, 0.6270288, 2.27245, 0.9686275, 0, 1, 1,
0.9609635, 0.5738685, -0.3271832, 0.972549, 0, 1, 1,
0.967204, 0.7613435, 0.450141, 0.9803922, 0, 1, 1,
0.9682962, 0.9929682, 0.728556, 0.9843137, 0, 1, 1,
0.9684551, 2.727465, 0.2511525, 0.9921569, 0, 1, 1,
0.9756188, -0.09774633, 1.069312, 0.9960784, 0, 1, 1,
0.9783458, -1.073172, 2.347149, 1, 0, 0.9960784, 1,
0.9788111, -0.6046595, 1.156099, 1, 0, 0.9882353, 1,
0.9799398, 0.2384295, 3.28076, 1, 0, 0.9843137, 1,
0.9883809, 0.4664349, 0.2691507, 1, 0, 0.9764706, 1,
0.9901375, -0.1568346, 2.99018, 1, 0, 0.972549, 1,
0.9970384, -0.4412288, 1.190709, 1, 0, 0.9647059, 1,
0.9998091, -1.120148, 5.383861, 1, 0, 0.9607843, 1,
1.000685, -1.724992, 2.83278, 1, 0, 0.9529412, 1,
1.014008, 0.05360234, 2.431479, 1, 0, 0.9490196, 1,
1.022818, 0.5077665, -0.9571816, 1, 0, 0.9411765, 1,
1.024641, -0.293596, 4.36503, 1, 0, 0.9372549, 1,
1.028044, 1.015706, -0.5906158, 1, 0, 0.9294118, 1,
1.029376, 0.7065305, 1.029515, 1, 0, 0.9254902, 1,
1.034288, -0.8783516, 2.542745, 1, 0, 0.9176471, 1,
1.045226, -0.2184549, 4.057326, 1, 0, 0.9137255, 1,
1.049841, -1.021883, 1.671443, 1, 0, 0.9058824, 1,
1.052964, 1.860821, 0.4906034, 1, 0, 0.9019608, 1,
1.064911, 0.1434619, 1.787675, 1, 0, 0.8941177, 1,
1.069518, 0.1083816, 1.835319, 1, 0, 0.8862745, 1,
1.072036, -0.980938, 3.132073, 1, 0, 0.8823529, 1,
1.072065, 0.4380829, 2.221266, 1, 0, 0.8745098, 1,
1.072488, 0.263665, 3.433891, 1, 0, 0.8705882, 1,
1.072634, 1.532151, 1.312469, 1, 0, 0.8627451, 1,
1.079657, -0.1000435, 1.212765, 1, 0, 0.8588235, 1,
1.079693, -1.027451, 2.822559, 1, 0, 0.8509804, 1,
1.089671, 1.071167, 0.506868, 1, 0, 0.8470588, 1,
1.092461, -1.371706, 1.587169, 1, 0, 0.8392157, 1,
1.096154, -2.901453, 3.2372, 1, 0, 0.8352941, 1,
1.099069, -1.240134, 3.741114, 1, 0, 0.827451, 1,
1.100199, -0.5170408, 1.259018, 1, 0, 0.8235294, 1,
1.10229, 0.9206657, 0.488667, 1, 0, 0.8156863, 1,
1.11892, -0.62135, 0.6189819, 1, 0, 0.8117647, 1,
1.119807, -0.3584613, 2.157734, 1, 0, 0.8039216, 1,
1.126154, -0.6242616, 2.38902, 1, 0, 0.7960784, 1,
1.127368, 0.1225482, 3.244416, 1, 0, 0.7921569, 1,
1.132706, 0.2580221, 1.708906, 1, 0, 0.7843137, 1,
1.132992, -0.8606306, 2.406116, 1, 0, 0.7803922, 1,
1.144643, 0.3675071, 2.478847, 1, 0, 0.772549, 1,
1.15061, 1.042044, 2.204829, 1, 0, 0.7686275, 1,
1.165616, -0.002061974, 0.8728297, 1, 0, 0.7607843, 1,
1.176547, 1.681841, 0.2991993, 1, 0, 0.7568628, 1,
1.177082, -0.6215042, 1.0581, 1, 0, 0.7490196, 1,
1.181143, 1.000792, 2.695258, 1, 0, 0.7450981, 1,
1.185331, 1.563161, 0.064564, 1, 0, 0.7372549, 1,
1.185719, 0.4553669, 1.736843, 1, 0, 0.7333333, 1,
1.1859, 0.09278473, 2.060436, 1, 0, 0.7254902, 1,
1.196227, -1.464847, 3.195574, 1, 0, 0.7215686, 1,
1.216846, -2.271684, 1.643245, 1, 0, 0.7137255, 1,
1.219055, -0.5511306, 1.437863, 1, 0, 0.7098039, 1,
1.224389, 0.2271909, 0.3622805, 1, 0, 0.7019608, 1,
1.238299, 0.7609769, 0.8641292, 1, 0, 0.6941177, 1,
1.239766, -1.472194, 1.483975, 1, 0, 0.6901961, 1,
1.252115, -0.8135187, 2.999673, 1, 0, 0.682353, 1,
1.253803, 2.479402, 1.212572, 1, 0, 0.6784314, 1,
1.256587, 0.9441288, 0.1448447, 1, 0, 0.6705883, 1,
1.258366, 1.051219, 1.192496, 1, 0, 0.6666667, 1,
1.260531, 1.931704, -0.1577307, 1, 0, 0.6588235, 1,
1.260956, 0.5788517, 1.698488, 1, 0, 0.654902, 1,
1.264191, 0.9144667, 2.490573, 1, 0, 0.6470588, 1,
1.285331, 2.162284, 1.534436, 1, 0, 0.6431373, 1,
1.305268, -0.5115612, 4.395331, 1, 0, 0.6352941, 1,
1.312341, 0.1684935, 1.712013, 1, 0, 0.6313726, 1,
1.312565, 0.0782738, 1.512734, 1, 0, 0.6235294, 1,
1.316732, -1.009415, 2.824225, 1, 0, 0.6196079, 1,
1.321643, -0.4698881, 1.563501, 1, 0, 0.6117647, 1,
1.325005, -1.47381, 2.697397, 1, 0, 0.6078432, 1,
1.328662, -0.4315887, 2.021526, 1, 0, 0.6, 1,
1.33711, -1.120088, 2.054226, 1, 0, 0.5921569, 1,
1.339983, -1.176328, 1.388531, 1, 0, 0.5882353, 1,
1.343624, -1.449591, 2.483435, 1, 0, 0.5803922, 1,
1.344786, 0.8546576, 0.9291454, 1, 0, 0.5764706, 1,
1.349956, 1.317909, 0.4729234, 1, 0, 0.5686275, 1,
1.350421, -0.4209451, -0.5749725, 1, 0, 0.5647059, 1,
1.356833, 2.172346, 1.373926, 1, 0, 0.5568628, 1,
1.360846, 0.8423778, 0.5347744, 1, 0, 0.5529412, 1,
1.386347, -0.3397781, 2.335995, 1, 0, 0.5450981, 1,
1.38887, 0.9713533, 0.2763108, 1, 0, 0.5411765, 1,
1.399247, -1.963378, 2.563162, 1, 0, 0.5333334, 1,
1.411133, 0.8142759, 0.2879882, 1, 0, 0.5294118, 1,
1.413207, -0.5004281, 1.630973, 1, 0, 0.5215687, 1,
1.415402, -0.7621257, 1.035729, 1, 0, 0.5176471, 1,
1.419864, 0.7697851, 1.214084, 1, 0, 0.509804, 1,
1.424502, -1.678098, 3.334668, 1, 0, 0.5058824, 1,
1.426653, 1.594798, 0.1917149, 1, 0, 0.4980392, 1,
1.427442, 0.9145126, 1.860519, 1, 0, 0.4901961, 1,
1.431646, 1.374037, 0.1872236, 1, 0, 0.4862745, 1,
1.445038, -0.4197232, 3.667457, 1, 0, 0.4784314, 1,
1.45122, 0.4916939, 1.62742, 1, 0, 0.4745098, 1,
1.463871, 1.608176, 0.9240944, 1, 0, 0.4666667, 1,
1.464849, 0.2106003, 0.938227, 1, 0, 0.4627451, 1,
1.473707, 0.9600013, 1.275716, 1, 0, 0.454902, 1,
1.474237, 0.7407756, 4.021907, 1, 0, 0.4509804, 1,
1.475609, -0.6277255, 1.147309, 1, 0, 0.4431373, 1,
1.480981, 0.8192105, -1.207779, 1, 0, 0.4392157, 1,
1.495412, 1.388916, 1.302938, 1, 0, 0.4313726, 1,
1.496357, 0.1763937, 2.120362, 1, 0, 0.427451, 1,
1.501849, 0.766363, 0.5245721, 1, 0, 0.4196078, 1,
1.521273, 1.248088, 0.002456655, 1, 0, 0.4156863, 1,
1.536453, -0.9056582, 3.559349, 1, 0, 0.4078431, 1,
1.541769, 0.1495496, 1.465104, 1, 0, 0.4039216, 1,
1.544431, -0.5891792, 2.274507, 1, 0, 0.3960784, 1,
1.561377, 0.8385752, 0.2275567, 1, 0, 0.3882353, 1,
1.568641, 0.08459351, 0.9401826, 1, 0, 0.3843137, 1,
1.568843, 0.3710247, 1.34078, 1, 0, 0.3764706, 1,
1.570951, -1.677027, 1.835642, 1, 0, 0.372549, 1,
1.578467, 0.8172391, 1.511326, 1, 0, 0.3647059, 1,
1.59283, 0.2627457, 3.635014, 1, 0, 0.3607843, 1,
1.595202, 1.002908, -0.2758203, 1, 0, 0.3529412, 1,
1.607218, 0.9877666, 3.225287, 1, 0, 0.3490196, 1,
1.609667, -0.7528154, 2.89765, 1, 0, 0.3411765, 1,
1.625766, -0.688745, 0.8667387, 1, 0, 0.3372549, 1,
1.646165, 1.814727, 1.856004, 1, 0, 0.3294118, 1,
1.653384, 0.06594209, 0.3600122, 1, 0, 0.3254902, 1,
1.66103, -0.5052937, 2.137687, 1, 0, 0.3176471, 1,
1.66388, -0.3020375, 0.2487471, 1, 0, 0.3137255, 1,
1.676777, -0.2691075, 3.032725, 1, 0, 0.3058824, 1,
1.685786, 0.9375183, 2.17415, 1, 0, 0.2980392, 1,
1.691269, 0.6067904, 2.472459, 1, 0, 0.2941177, 1,
1.701985, 1.094823, 0.3380555, 1, 0, 0.2862745, 1,
1.709553, -2.123912, 2.447296, 1, 0, 0.282353, 1,
1.713295, -0.6906613, 2.849523, 1, 0, 0.2745098, 1,
1.738782, 0.7362489, 1.62273, 1, 0, 0.2705882, 1,
1.739719, -0.3338295, 1.153161, 1, 0, 0.2627451, 1,
1.742262, 0.7685771, 1.515299, 1, 0, 0.2588235, 1,
1.761393, 1.12475, 2.505557, 1, 0, 0.2509804, 1,
1.761815, -0.5464637, 1.71844, 1, 0, 0.2470588, 1,
1.819449, -0.2015413, 0.6460061, 1, 0, 0.2392157, 1,
1.819749, -1.137743, 4.3113, 1, 0, 0.2352941, 1,
1.820801, 2.139219, 1.20254, 1, 0, 0.227451, 1,
1.837408, -0.6716782, 0.7971922, 1, 0, 0.2235294, 1,
1.838493, 0.2887876, 1.976014, 1, 0, 0.2156863, 1,
1.848474, -0.8916295, 0.7367046, 1, 0, 0.2117647, 1,
1.853353, -1.389662, 1.541049, 1, 0, 0.2039216, 1,
1.85614, -1.558468, 1.686859, 1, 0, 0.1960784, 1,
1.879814, -0.9375443, 1.752958, 1, 0, 0.1921569, 1,
1.881868, 0.1502562, 2.641099, 1, 0, 0.1843137, 1,
1.88536, 0.1818859, 2.842527, 1, 0, 0.1803922, 1,
1.892649, -0.853968, 0.4803708, 1, 0, 0.172549, 1,
1.912468, 0.4330818, 2.163669, 1, 0, 0.1686275, 1,
1.915082, -0.5064267, 2.255535, 1, 0, 0.1607843, 1,
1.937528, 0.4824764, -0.1300814, 1, 0, 0.1568628, 1,
1.941068, -0.7023428, 3.982427, 1, 0, 0.1490196, 1,
1.942211, -1.020535, 2.863834, 1, 0, 0.145098, 1,
1.974661, -3.094533, 3.069337, 1, 0, 0.1372549, 1,
1.980467, 0.3700773, 1.67557, 1, 0, 0.1333333, 1,
1.992404, -1.70904, 3.7111, 1, 0, 0.1254902, 1,
1.995009, -0.8161622, 1.38719, 1, 0, 0.1215686, 1,
2.058949, -1.052326, 3.322212, 1, 0, 0.1137255, 1,
2.061829, -1.27794, 1.063466, 1, 0, 0.1098039, 1,
2.075482, 0.4531309, 3.448797, 1, 0, 0.1019608, 1,
2.081024, 0.1826697, 2.470062, 1, 0, 0.09411765, 1,
2.090481, -0.5680812, 0.7631654, 1, 0, 0.09019608, 1,
2.110371, 0.1246282, 2.347579, 1, 0, 0.08235294, 1,
2.194096, 0.5662137, 2.201605, 1, 0, 0.07843138, 1,
2.231449, 0.19407, 2.044593, 1, 0, 0.07058824, 1,
2.274244, -0.2285218, 1.124346, 1, 0, 0.06666667, 1,
2.354655, 0.03465165, 2.255861, 1, 0, 0.05882353, 1,
2.481188, 0.1889929, 0.7982336, 1, 0, 0.05490196, 1,
2.481358, -0.7751161, 2.134978, 1, 0, 0.04705882, 1,
2.526579, -0.3802626, 0.8114998, 1, 0, 0.04313726, 1,
2.585214, 0.6412796, 1.935643, 1, 0, 0.03529412, 1,
2.624712, 0.5106739, 1.017433, 1, 0, 0.03137255, 1,
2.693212, 0.1738757, 2.144925, 1, 0, 0.02352941, 1,
2.770254, 0.3395277, 1.988485, 1, 0, 0.01960784, 1,
3.07176, 0.1953935, 1.274188, 1, 0, 0.01176471, 1,
3.312008, 0.3533427, 0.3893007, 1, 0, 0.007843138, 1
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
-0.08830297, -4.436214, -6.64402, 0, -0.5, 0.5, 0.5,
-0.08830297, -4.436214, -6.64402, 1, -0.5, 0.5, 0.5,
-0.08830297, -4.436214, -6.64402, 1, 1.5, 0.5, 0.5,
-0.08830297, -4.436214, -6.64402, 0, 1.5, 0.5, 0.5
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
-4.641319, 0.0157423, -6.64402, 0, -0.5, 0.5, 0.5,
-4.641319, 0.0157423, -6.64402, 1, -0.5, 0.5, 0.5,
-4.641319, 0.0157423, -6.64402, 1, 1.5, 0.5, 0.5,
-4.641319, 0.0157423, -6.64402, 0, 1.5, 0.5, 0.5
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
-4.641319, -4.436214, 0.2415433, 0, -0.5, 0.5, 0.5,
-4.641319, -4.436214, 0.2415433, 1, -0.5, 0.5, 0.5,
-4.641319, -4.436214, 0.2415433, 1, 1.5, 0.5, 0.5,
-4.641319, -4.436214, 0.2415433, 0, 1.5, 0.5, 0.5
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
-3, -3.408839, -5.055044,
3, -3.408839, -5.055044,
-3, -3.408839, -5.055044,
-3, -3.580068, -5.319873,
-2, -3.408839, -5.055044,
-2, -3.580068, -5.319873,
-1, -3.408839, -5.055044,
-1, -3.580068, -5.319873,
0, -3.408839, -5.055044,
0, -3.580068, -5.319873,
1, -3.408839, -5.055044,
1, -3.580068, -5.319873,
2, -3.408839, -5.055044,
2, -3.580068, -5.319873,
3, -3.408839, -5.055044,
3, -3.580068, -5.319873
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
-3, -3.922527, -5.849532, 0, -0.5, 0.5, 0.5,
-3, -3.922527, -5.849532, 1, -0.5, 0.5, 0.5,
-3, -3.922527, -5.849532, 1, 1.5, 0.5, 0.5,
-3, -3.922527, -5.849532, 0, 1.5, 0.5, 0.5,
-2, -3.922527, -5.849532, 0, -0.5, 0.5, 0.5,
-2, -3.922527, -5.849532, 1, -0.5, 0.5, 0.5,
-2, -3.922527, -5.849532, 1, 1.5, 0.5, 0.5,
-2, -3.922527, -5.849532, 0, 1.5, 0.5, 0.5,
-1, -3.922527, -5.849532, 0, -0.5, 0.5, 0.5,
-1, -3.922527, -5.849532, 1, -0.5, 0.5, 0.5,
-1, -3.922527, -5.849532, 1, 1.5, 0.5, 0.5,
-1, -3.922527, -5.849532, 0, 1.5, 0.5, 0.5,
0, -3.922527, -5.849532, 0, -0.5, 0.5, 0.5,
0, -3.922527, -5.849532, 1, -0.5, 0.5, 0.5,
0, -3.922527, -5.849532, 1, 1.5, 0.5, 0.5,
0, -3.922527, -5.849532, 0, 1.5, 0.5, 0.5,
1, -3.922527, -5.849532, 0, -0.5, 0.5, 0.5,
1, -3.922527, -5.849532, 1, -0.5, 0.5, 0.5,
1, -3.922527, -5.849532, 1, 1.5, 0.5, 0.5,
1, -3.922527, -5.849532, 0, 1.5, 0.5, 0.5,
2, -3.922527, -5.849532, 0, -0.5, 0.5, 0.5,
2, -3.922527, -5.849532, 1, -0.5, 0.5, 0.5,
2, -3.922527, -5.849532, 1, 1.5, 0.5, 0.5,
2, -3.922527, -5.849532, 0, 1.5, 0.5, 0.5,
3, -3.922527, -5.849532, 0, -0.5, 0.5, 0.5,
3, -3.922527, -5.849532, 1, -0.5, 0.5, 0.5,
3, -3.922527, -5.849532, 1, 1.5, 0.5, 0.5,
3, -3.922527, -5.849532, 0, 1.5, 0.5, 0.5
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
-3.590623, -3, -5.055044,
-3.590623, 3, -5.055044,
-3.590623, -3, -5.055044,
-3.765739, -3, -5.319873,
-3.590623, -2, -5.055044,
-3.765739, -2, -5.319873,
-3.590623, -1, -5.055044,
-3.765739, -1, -5.319873,
-3.590623, 0, -5.055044,
-3.765739, 0, -5.319873,
-3.590623, 1, -5.055044,
-3.765739, 1, -5.319873,
-3.590623, 2, -5.055044,
-3.765739, 2, -5.319873,
-3.590623, 3, -5.055044,
-3.765739, 3, -5.319873
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
-4.115971, -3, -5.849532, 0, -0.5, 0.5, 0.5,
-4.115971, -3, -5.849532, 1, -0.5, 0.5, 0.5,
-4.115971, -3, -5.849532, 1, 1.5, 0.5, 0.5,
-4.115971, -3, -5.849532, 0, 1.5, 0.5, 0.5,
-4.115971, -2, -5.849532, 0, -0.5, 0.5, 0.5,
-4.115971, -2, -5.849532, 1, -0.5, 0.5, 0.5,
-4.115971, -2, -5.849532, 1, 1.5, 0.5, 0.5,
-4.115971, -2, -5.849532, 0, 1.5, 0.5, 0.5,
-4.115971, -1, -5.849532, 0, -0.5, 0.5, 0.5,
-4.115971, -1, -5.849532, 1, -0.5, 0.5, 0.5,
-4.115971, -1, -5.849532, 1, 1.5, 0.5, 0.5,
-4.115971, -1, -5.849532, 0, 1.5, 0.5, 0.5,
-4.115971, 0, -5.849532, 0, -0.5, 0.5, 0.5,
-4.115971, 0, -5.849532, 1, -0.5, 0.5, 0.5,
-4.115971, 0, -5.849532, 1, 1.5, 0.5, 0.5,
-4.115971, 0, -5.849532, 0, 1.5, 0.5, 0.5,
-4.115971, 1, -5.849532, 0, -0.5, 0.5, 0.5,
-4.115971, 1, -5.849532, 1, -0.5, 0.5, 0.5,
-4.115971, 1, -5.849532, 1, 1.5, 0.5, 0.5,
-4.115971, 1, -5.849532, 0, 1.5, 0.5, 0.5,
-4.115971, 2, -5.849532, 0, -0.5, 0.5, 0.5,
-4.115971, 2, -5.849532, 1, -0.5, 0.5, 0.5,
-4.115971, 2, -5.849532, 1, 1.5, 0.5, 0.5,
-4.115971, 2, -5.849532, 0, 1.5, 0.5, 0.5,
-4.115971, 3, -5.849532, 0, -0.5, 0.5, 0.5,
-4.115971, 3, -5.849532, 1, -0.5, 0.5, 0.5,
-4.115971, 3, -5.849532, 1, 1.5, 0.5, 0.5,
-4.115971, 3, -5.849532, 0, 1.5, 0.5, 0.5
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
-3.590623, -3.408839, -4,
-3.590623, -3.408839, 4,
-3.590623, -3.408839, -4,
-3.765739, -3.580068, -4,
-3.590623, -3.408839, -2,
-3.765739, -3.580068, -2,
-3.590623, -3.408839, 0,
-3.765739, -3.580068, 0,
-3.590623, -3.408839, 2,
-3.765739, -3.580068, 2,
-3.590623, -3.408839, 4,
-3.765739, -3.580068, 4
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
-4.115971, -3.922527, -4, 0, -0.5, 0.5, 0.5,
-4.115971, -3.922527, -4, 1, -0.5, 0.5, 0.5,
-4.115971, -3.922527, -4, 1, 1.5, 0.5, 0.5,
-4.115971, -3.922527, -4, 0, 1.5, 0.5, 0.5,
-4.115971, -3.922527, -2, 0, -0.5, 0.5, 0.5,
-4.115971, -3.922527, -2, 1, -0.5, 0.5, 0.5,
-4.115971, -3.922527, -2, 1, 1.5, 0.5, 0.5,
-4.115971, -3.922527, -2, 0, 1.5, 0.5, 0.5,
-4.115971, -3.922527, 0, 0, -0.5, 0.5, 0.5,
-4.115971, -3.922527, 0, 1, -0.5, 0.5, 0.5,
-4.115971, -3.922527, 0, 1, 1.5, 0.5, 0.5,
-4.115971, -3.922527, 0, 0, 1.5, 0.5, 0.5,
-4.115971, -3.922527, 2, 0, -0.5, 0.5, 0.5,
-4.115971, -3.922527, 2, 1, -0.5, 0.5, 0.5,
-4.115971, -3.922527, 2, 1, 1.5, 0.5, 0.5,
-4.115971, -3.922527, 2, 0, 1.5, 0.5, 0.5,
-4.115971, -3.922527, 4, 0, -0.5, 0.5, 0.5,
-4.115971, -3.922527, 4, 1, -0.5, 0.5, 0.5,
-4.115971, -3.922527, 4, 1, 1.5, 0.5, 0.5,
-4.115971, -3.922527, 4, 0, 1.5, 0.5, 0.5
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
-3.590623, -3.408839, -5.055044,
-3.590623, 3.440324, -5.055044,
-3.590623, -3.408839, 5.538131,
-3.590623, 3.440324, 5.538131,
-3.590623, -3.408839, -5.055044,
-3.590623, -3.408839, 5.538131,
-3.590623, 3.440324, -5.055044,
-3.590623, 3.440324, 5.538131,
-3.590623, -3.408839, -5.055044,
3.414017, -3.408839, -5.055044,
-3.590623, -3.408839, 5.538131,
3.414017, -3.408839, 5.538131,
-3.590623, 3.440324, -5.055044,
3.414017, 3.440324, -5.055044,
-3.590623, 3.440324, 5.538131,
3.414017, 3.440324, 5.538131,
3.414017, -3.408839, -5.055044,
3.414017, 3.440324, -5.055044,
3.414017, -3.408839, 5.538131,
3.414017, 3.440324, 5.538131,
3.414017, -3.408839, -5.055044,
3.414017, -3.408839, 5.538131,
3.414017, 3.440324, -5.055044,
3.414017, 3.440324, 5.538131
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
var radius = 7.704719;
var distance = 34.27917;
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
mvMatrix.translate( 0.08830297, -0.0157423, -0.2415433 );
mvMatrix.scale( 1.189282, 1.216279, 0.786402 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.27917);
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
Padan<-read.table("Padan.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Padan$V2
```

```
## Error in eval(expr, envir, enclos): object 'Padan' not found
```

```r
y<-Padan$V3
```

```
## Error in eval(expr, envir, enclos): object 'Padan' not found
```

```r
z<-Padan$V4
```

```
## Error in eval(expr, envir, enclos): object 'Padan' not found
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
-3.488614, 1.026729, -1.984609, 0, 0, 1, 1, 1,
-3.250641, -0.7461381, -2.46069, 1, 0, 0, 1, 1,
-2.964175, -1.935566, -3.223795, 1, 0, 0, 1, 1,
-2.841784, -0.4599702, -1.4822, 1, 0, 0, 1, 1,
-2.632014, 2.561943, -1.672727, 1, 0, 0, 1, 1,
-2.621299, 0.9700702, -2.140657, 1, 0, 0, 1, 1,
-2.575563, -0.7445334, -2.457883, 0, 0, 0, 1, 1,
-2.505726, 0.3123142, -2.919609, 0, 0, 0, 1, 1,
-2.501343, 0.5899634, 0.3362467, 0, 0, 0, 1, 1,
-2.220987, 0.003164733, -2.681599, 0, 0, 0, 1, 1,
-2.202015, -0.06745926, -2.267014, 0, 0, 0, 1, 1,
-2.200343, -1.798457, -2.155328, 0, 0, 0, 1, 1,
-2.108971, -0.4113497, -1.617177, 0, 0, 0, 1, 1,
-2.091879, -0.9138675, -3.248767, 1, 1, 1, 1, 1,
-2.077596, 1.309714, -0.01482097, 1, 1, 1, 1, 1,
-2.074818, 0.4797093, -0.1100908, 1, 1, 1, 1, 1,
-2.056906, 2.031714, -0.6883779, 1, 1, 1, 1, 1,
-2.04118, -0.9362817, -2.327572, 1, 1, 1, 1, 1,
-1.939144, -0.374754, -2.820024, 1, 1, 1, 1, 1,
-1.921408, 0.01830552, -1.097356, 1, 1, 1, 1, 1,
-1.910975, -0.3246316, -3.05464, 1, 1, 1, 1, 1,
-1.90788, 1.755023, -0.03790348, 1, 1, 1, 1, 1,
-1.906518, -0.6468086, -2.706755, 1, 1, 1, 1, 1,
-1.898489, -2.576816, -2.492195, 1, 1, 1, 1, 1,
-1.889231, -0.1714784, -1.625472, 1, 1, 1, 1, 1,
-1.887503, -0.7397732, -0.6315307, 1, 1, 1, 1, 1,
-1.86469, 1.83132, -0.3604916, 1, 1, 1, 1, 1,
-1.83278, 0.8813204, -1.086624, 1, 1, 1, 1, 1,
-1.80438, -0.4843838, -2.924127, 0, 0, 1, 1, 1,
-1.757113, 0.5161997, -1.545031, 1, 0, 0, 1, 1,
-1.754872, -0.01411062, -0.3456392, 1, 0, 0, 1, 1,
-1.754349, -0.9222723, -2.186498, 1, 0, 0, 1, 1,
-1.72259, -0.7090452, -3.481917, 1, 0, 0, 1, 1,
-1.707049, 0.1149189, -0.2265691, 1, 0, 0, 1, 1,
-1.69976, -0.5724407, -2.278501, 0, 0, 0, 1, 1,
-1.695398, -0.4345894, -0.7254315, 0, 0, 0, 1, 1,
-1.663543, 2.998971, -0.3663876, 0, 0, 0, 1, 1,
-1.66139, -0.3645374, -0.6380404, 0, 0, 0, 1, 1,
-1.65637, -2.015041, -1.672416, 0, 0, 0, 1, 1,
-1.653365, 0.1852643, -1.475936, 0, 0, 0, 1, 1,
-1.648521, 0.9901, -1.938993, 0, 0, 0, 1, 1,
-1.645476, 0.2381901, -0.2898457, 1, 1, 1, 1, 1,
-1.635903, -0.9819562, -2.509579, 1, 1, 1, 1, 1,
-1.627534, -1.465992, -3.124177, 1, 1, 1, 1, 1,
-1.61851, 1.834925, -1.24208, 1, 1, 1, 1, 1,
-1.609043, 1.187232, -0.1353322, 1, 1, 1, 1, 1,
-1.598687, -0.4814932, -0.8672099, 1, 1, 1, 1, 1,
-1.59493, 0.2036311, -1.874187, 1, 1, 1, 1, 1,
-1.589111, 0.623208, -0.9205903, 1, 1, 1, 1, 1,
-1.587129, -1.957491, -1.931249, 1, 1, 1, 1, 1,
-1.585147, -1.421254, -2.111293, 1, 1, 1, 1, 1,
-1.577578, 0.2357637, -0.9995086, 1, 1, 1, 1, 1,
-1.570701, -0.4898575, -1.572135, 1, 1, 1, 1, 1,
-1.563365, 0.1944714, -0.5589221, 1, 1, 1, 1, 1,
-1.562945, 0.3932499, -0.931115, 1, 1, 1, 1, 1,
-1.562694, -2.271309, -2.14713, 1, 1, 1, 1, 1,
-1.561713, 0.5955344, -1.755289, 0, 0, 1, 1, 1,
-1.54895, -0.2277942, 1.059878, 1, 0, 0, 1, 1,
-1.54134, 0.1563982, -1.765756, 1, 0, 0, 1, 1,
-1.54096, 1.347434, -1.411908, 1, 0, 0, 1, 1,
-1.539867, -0.2192148, -0.7239742, 1, 0, 0, 1, 1,
-1.538128, -1.671851, -2.162853, 1, 0, 0, 1, 1,
-1.523324, -1.180745, -1.957376, 0, 0, 0, 1, 1,
-1.489955, -0.4351406, -1.547703, 0, 0, 0, 1, 1,
-1.480724, 1.09177, -0.9542559, 0, 0, 0, 1, 1,
-1.469161, 0.8895587, -1.757218, 0, 0, 0, 1, 1,
-1.458149, 1.231067, -0.2799138, 0, 0, 0, 1, 1,
-1.448906, 1.39295, -0.04642665, 0, 0, 0, 1, 1,
-1.431641, 1.134091, -0.07036854, 0, 0, 0, 1, 1,
-1.412181, 0.5989661, -2.22366, 1, 1, 1, 1, 1,
-1.405481, -1.909708, -4.086554, 1, 1, 1, 1, 1,
-1.401083, 0.2077324, -2.093502, 1, 1, 1, 1, 1,
-1.397466, -0.1559614, -2.927083, 1, 1, 1, 1, 1,
-1.390884, 0.833062, -1.97221, 1, 1, 1, 1, 1,
-1.369784, 1.391447, -1.153049, 1, 1, 1, 1, 1,
-1.365009, -1.586319, -3.322345, 1, 1, 1, 1, 1,
-1.357104, -0.2105398, -0.5512063, 1, 1, 1, 1, 1,
-1.349607, 1.711924, 0.7266054, 1, 1, 1, 1, 1,
-1.347666, 1.759783, -0.03919167, 1, 1, 1, 1, 1,
-1.331886, 1.352881, -0.5783714, 1, 1, 1, 1, 1,
-1.319734, 0.4535049, -1.072901, 1, 1, 1, 1, 1,
-1.313977, 0.3078586, -1.880387, 1, 1, 1, 1, 1,
-1.306043, -2.133341, -2.495375, 1, 1, 1, 1, 1,
-1.299509, -0.06705964, -1.019424, 1, 1, 1, 1, 1,
-1.298002, -1.416344, -2.808105, 0, 0, 1, 1, 1,
-1.296341, -1.14155, -1.708639, 1, 0, 0, 1, 1,
-1.295688, -1.290632, -3.795376, 1, 0, 0, 1, 1,
-1.290635, 0.9916531, -0.5138863, 1, 0, 0, 1, 1,
-1.289932, 2.227944, -1.086991, 1, 0, 0, 1, 1,
-1.279726, -0.2798774, -2.406656, 1, 0, 0, 1, 1,
-1.272144, -0.7265895, -2.278324, 0, 0, 0, 1, 1,
-1.269605, -0.4196154, -2.347639, 0, 0, 0, 1, 1,
-1.26467, -0.3702493, -1.050563, 0, 0, 0, 1, 1,
-1.260246, 0.2833292, 0.4545457, 0, 0, 0, 1, 1,
-1.258542, -1.06159, -1.750234, 0, 0, 0, 1, 1,
-1.253594, 0.5194779, -1.591211, 0, 0, 0, 1, 1,
-1.246198, 0.7548859, 0.05467659, 0, 0, 0, 1, 1,
-1.240888, 0.4699102, -1.7435, 1, 1, 1, 1, 1,
-1.236266, -0.5914068, -0.4060825, 1, 1, 1, 1, 1,
-1.235293, 0.7942731, 0.367331, 1, 1, 1, 1, 1,
-1.227786, 0.5821413, -0.75739, 1, 1, 1, 1, 1,
-1.217019, -1.241392, -3.024015, 1, 1, 1, 1, 1,
-1.212725, 0.966804, -0.7685453, 1, 1, 1, 1, 1,
-1.206976, 0.5305345, -0.2637735, 1, 1, 1, 1, 1,
-1.204956, -0.7934288, -1.056428, 1, 1, 1, 1, 1,
-1.197537, -1.256138, -3.066707, 1, 1, 1, 1, 1,
-1.187387, -0.9342486, -1.747307, 1, 1, 1, 1, 1,
-1.182418, 0.9960248, -2.453463, 1, 1, 1, 1, 1,
-1.172434, 0.8929095, 0.07065576, 1, 1, 1, 1, 1,
-1.169098, 1.896433, -0.001281597, 1, 1, 1, 1, 1,
-1.158018, -0.7567732, -1.736492, 1, 1, 1, 1, 1,
-1.154306, -1.497416, 0.2151324, 1, 1, 1, 1, 1,
-1.153969, -0.8350381, -1.935711, 0, 0, 1, 1, 1,
-1.144501, 1.212753, -2.689173, 1, 0, 0, 1, 1,
-1.143334, -0.5186191, -3.875158, 1, 0, 0, 1, 1,
-1.13733, 1.194759, -0.3266735, 1, 0, 0, 1, 1,
-1.132105, -0.03698449, -1.602112, 1, 0, 0, 1, 1,
-1.129519, -0.03971296, -2.670698, 1, 0, 0, 1, 1,
-1.127279, -0.5099342, -0.7069331, 0, 0, 0, 1, 1,
-1.125585, -0.318173, -1.438659, 0, 0, 0, 1, 1,
-1.118815, 0.6740408, -2.191079, 0, 0, 0, 1, 1,
-1.116258, -0.9131953, -0.6681819, 0, 0, 0, 1, 1,
-1.116032, -1.712304, -3.207312, 0, 0, 0, 1, 1,
-1.113418, 1.86253, -2.411363, 0, 0, 0, 1, 1,
-1.104357, -0.2384818, -1.858883, 0, 0, 0, 1, 1,
-1.103079, 0.163486, 0.579162, 1, 1, 1, 1, 1,
-1.093763, -0.3159703, -1.648227, 1, 1, 1, 1, 1,
-1.088241, -0.403859, -1.163269, 1, 1, 1, 1, 1,
-1.08585, -0.3378249, -2.043614, 1, 1, 1, 1, 1,
-1.074185, -0.5990268, -3.845093, 1, 1, 1, 1, 1,
-1.070592, 0.01648529, -1.754151, 1, 1, 1, 1, 1,
-1.068278, -0.3559566, -0.2300615, 1, 1, 1, 1, 1,
-1.061191, -1.292166, -2.27706, 1, 1, 1, 1, 1,
-1.049828, 0.6450869, -1.911642, 1, 1, 1, 1, 1,
-1.049817, -1.367563, -2.18493, 1, 1, 1, 1, 1,
-1.04826, 0.2840421, -1.873139, 1, 1, 1, 1, 1,
-1.047556, -0.9667242, -0.6546361, 1, 1, 1, 1, 1,
-1.047432, -0.6585095, -2.45706, 1, 1, 1, 1, 1,
-1.030364, 1.073943, 0.3169428, 1, 1, 1, 1, 1,
-1.023797, 0.06646737, -3.664053, 1, 1, 1, 1, 1,
-1.023022, -0.8349109, -2.171375, 0, 0, 1, 1, 1,
-1.021817, -0.6846909, -1.848358, 1, 0, 0, 1, 1,
-1.005697, 0.767409, -0.02818466, 1, 0, 0, 1, 1,
-1.005658, 0.7823324, -2.15407, 1, 0, 0, 1, 1,
-1.002472, 0.4583611, -2.850936, 1, 0, 0, 1, 1,
-0.9940019, -0.4458582, -1.203997, 1, 0, 0, 1, 1,
-0.9914702, 0.7079834, -1.312853, 0, 0, 0, 1, 1,
-0.9848676, 1.811472, -1.813609, 0, 0, 0, 1, 1,
-0.9828727, 1.2779, 0.8494741, 0, 0, 0, 1, 1,
-0.9816683, 1.372172, -0.5375301, 0, 0, 0, 1, 1,
-0.9770875, -0.4401896, -1.09986, 0, 0, 0, 1, 1,
-0.9667822, -0.394568, -2.905156, 0, 0, 0, 1, 1,
-0.9608266, 0.07431874, 0.7354088, 0, 0, 0, 1, 1,
-0.9539776, 1.872514, 0.7023658, 1, 1, 1, 1, 1,
-0.9512665, -0.8269884, -0.9673278, 1, 1, 1, 1, 1,
-0.950051, -0.317891, -2.47819, 1, 1, 1, 1, 1,
-0.9436312, -1.232413, -1.224028, 1, 1, 1, 1, 1,
-0.9390857, 0.8555573, -0.3623496, 1, 1, 1, 1, 1,
-0.9389817, 2.26539, -2.277642, 1, 1, 1, 1, 1,
-0.9376491, 0.4513211, -0.8079771, 1, 1, 1, 1, 1,
-0.9375564, 0.2185682, -1.500641, 1, 1, 1, 1, 1,
-0.9373197, 1.900699, -0.253722, 1, 1, 1, 1, 1,
-0.9349353, -0.4817566, -1.980768, 1, 1, 1, 1, 1,
-0.9341581, -0.4191225, -3.34888, 1, 1, 1, 1, 1,
-0.9323735, 0.5744324, -1.630191, 1, 1, 1, 1, 1,
-0.9312138, -0.7254675, -1.256123, 1, 1, 1, 1, 1,
-0.9261891, 0.4258977, -2.821939, 1, 1, 1, 1, 1,
-0.9212669, -0.5124629, -1.906386, 1, 1, 1, 1, 1,
-0.9163966, -0.8660727, -2.166426, 0, 0, 1, 1, 1,
-0.9105802, -0.1642653, -1.019512, 1, 0, 0, 1, 1,
-0.9086766, -0.04469325, -1.188305, 1, 0, 0, 1, 1,
-0.9065975, -1.012923, -1.128855, 1, 0, 0, 1, 1,
-0.9055717, -0.6016089, -2.827038, 1, 0, 0, 1, 1,
-0.904429, -0.6524377, -1.938259, 1, 0, 0, 1, 1,
-0.9025986, 1.377907, -1.294734, 0, 0, 0, 1, 1,
-0.9018592, -0.1792404, -1.813124, 0, 0, 0, 1, 1,
-0.901091, -1.936612, -2.031034, 0, 0, 0, 1, 1,
-0.896735, 2.368672, -0.2395082, 0, 0, 0, 1, 1,
-0.8922762, -0.2783771, -1.32629, 0, 0, 0, 1, 1,
-0.8911926, 0.1366322, -1.417388, 0, 0, 0, 1, 1,
-0.8905871, -0.4712408, -0.9697809, 0, 0, 0, 1, 1,
-0.889191, -0.5258761, -1.10619, 1, 1, 1, 1, 1,
-0.8869502, -2.047313, -3.23719, 1, 1, 1, 1, 1,
-0.8854855, -0.5556896, -1.926295, 1, 1, 1, 1, 1,
-0.8746758, 0.2923928, -2.295997, 1, 1, 1, 1, 1,
-0.8719739, -0.4528984, -0.6674139, 1, 1, 1, 1, 1,
-0.8716533, 0.7718299, 0.02523313, 1, 1, 1, 1, 1,
-0.8573253, -0.3803183, -2.085836, 1, 1, 1, 1, 1,
-0.8546642, -0.7013949, -1.86552, 1, 1, 1, 1, 1,
-0.8425002, -1.397569, -3.429574, 1, 1, 1, 1, 1,
-0.8387141, -0.6962359, -0.2336174, 1, 1, 1, 1, 1,
-0.8344381, 1.202653, -2.927398, 1, 1, 1, 1, 1,
-0.8298776, -1.207056, -3.129799, 1, 1, 1, 1, 1,
-0.8298196, -1.041762, -1.63524, 1, 1, 1, 1, 1,
-0.828241, -0.06391285, -3.10032, 1, 1, 1, 1, 1,
-0.8278806, 0.5885813, -1.521916, 1, 1, 1, 1, 1,
-0.8276191, -0.00379997, -2.778348, 0, 0, 1, 1, 1,
-0.8173648, 1.276086, 0.2541914, 1, 0, 0, 1, 1,
-0.8132762, 1.174054, 0.09075548, 1, 0, 0, 1, 1,
-0.8110126, 0.3237411, -1.44458, 1, 0, 0, 1, 1,
-0.8096356, -0.7497907, -3.488269, 1, 0, 0, 1, 1,
-0.7980199, 0.611062, 0.3747347, 1, 0, 0, 1, 1,
-0.7979887, 1.20301, 0.6770275, 0, 0, 0, 1, 1,
-0.7969602, -0.04913419, -3.075853, 0, 0, 0, 1, 1,
-0.7945846, -1.325407, -2.935647, 0, 0, 0, 1, 1,
-0.788424, -1.071273, -3.493047, 0, 0, 0, 1, 1,
-0.7874293, 2.120921, -1.978204, 0, 0, 0, 1, 1,
-0.7856982, -0.3562003, -3.538809, 0, 0, 0, 1, 1,
-0.7847937, -1.305179, 0.9724286, 0, 0, 0, 1, 1,
-0.7844919, -0.8348757, -0.8461266, 1, 1, 1, 1, 1,
-0.7794963, 0.3123772, -0.03838594, 1, 1, 1, 1, 1,
-0.7794656, 1.273934, -0.729884, 1, 1, 1, 1, 1,
-0.7783177, 0.1790528, -1.605576, 1, 1, 1, 1, 1,
-0.7745512, 1.149951, -0.8810679, 1, 1, 1, 1, 1,
-0.7718309, -0.6253883, -0.953042, 1, 1, 1, 1, 1,
-0.7708521, -0.8994633, -1.912828, 1, 1, 1, 1, 1,
-0.7691806, -0.4120018, -2.092464, 1, 1, 1, 1, 1,
-0.7685357, -0.02992889, -1.352612, 1, 1, 1, 1, 1,
-0.7644619, 0.208651, -2.157311, 1, 1, 1, 1, 1,
-0.7621738, -0.671942, -2.850906, 1, 1, 1, 1, 1,
-0.7611699, 1.168678, -0.7016288, 1, 1, 1, 1, 1,
-0.7561162, 1.169193, -1.198632, 1, 1, 1, 1, 1,
-0.7537628, -0.01931238, -1.045249, 1, 1, 1, 1, 1,
-0.7522934, 0.2401157, -3.558366, 1, 1, 1, 1, 1,
-0.7515693, -0.5553835, -1.796685, 0, 0, 1, 1, 1,
-0.7470862, 0.4060539, 1.005031, 1, 0, 0, 1, 1,
-0.7465774, -0.006694801, -2.857836, 1, 0, 0, 1, 1,
-0.7452399, -0.3108449, -3.338799, 1, 0, 0, 1, 1,
-0.7372696, 0.533675, -1.897118, 1, 0, 0, 1, 1,
-0.7340124, 0.1983474, -2.628983, 1, 0, 0, 1, 1,
-0.7302807, -1.477672, -2.511461, 0, 0, 0, 1, 1,
-0.7289991, 1.879858, 1.079625, 0, 0, 0, 1, 1,
-0.7283987, 0.0556072, -1.232441, 0, 0, 0, 1, 1,
-0.7283456, 0.05966721, -0.1903317, 0, 0, 0, 1, 1,
-0.7221432, 0.9987043, -0.3683908, 0, 0, 0, 1, 1,
-0.7216272, 0.3871468, -2.018957, 0, 0, 0, 1, 1,
-0.7207828, 0.8683783, -1.722565, 0, 0, 0, 1, 1,
-0.7197788, -0.8577987, -3.643823, 1, 1, 1, 1, 1,
-0.7196671, 0.08352195, -1.637263, 1, 1, 1, 1, 1,
-0.7193666, -0.2887013, -1.736152, 1, 1, 1, 1, 1,
-0.7176415, -1.367802, -3.074506, 1, 1, 1, 1, 1,
-0.7152369, -0.5502025, 0.4569376, 1, 1, 1, 1, 1,
-0.7134873, -0.4711602, -4.745155, 1, 1, 1, 1, 1,
-0.7080206, -0.2109872, -3.214967, 1, 1, 1, 1, 1,
-0.7072896, 0.902289, -0.2657509, 1, 1, 1, 1, 1,
-0.7054898, 1.504831, -1.027839, 1, 1, 1, 1, 1,
-0.6981126, 0.0606912, -1.089205, 1, 1, 1, 1, 1,
-0.693004, -0.2496701, -3.154288, 1, 1, 1, 1, 1,
-0.6904989, -2.634675, 0.5836579, 1, 1, 1, 1, 1,
-0.6903377, -0.6645821, -3.196607, 1, 1, 1, 1, 1,
-0.6837756, 0.9731502, -0.9158784, 1, 1, 1, 1, 1,
-0.674336, -0.2900548, -1.255071, 1, 1, 1, 1, 1,
-0.670022, 0.36078, 0.04964984, 0, 0, 1, 1, 1,
-0.6683019, 0.7561027, -3.076156, 1, 0, 0, 1, 1,
-0.667834, 0.8103752, 0.8853072, 1, 0, 0, 1, 1,
-0.6643454, -0.3667054, -3.042804, 1, 0, 0, 1, 1,
-0.6626581, -1.210725, -3.275099, 1, 0, 0, 1, 1,
-0.6612808, -0.2224056, -1.805282, 1, 0, 0, 1, 1,
-0.6610362, 0.1430794, 0.5164455, 0, 0, 0, 1, 1,
-0.6605123, 0.286415, -1.92942, 0, 0, 0, 1, 1,
-0.6577919, -0.207365, -1.254016, 0, 0, 0, 1, 1,
-0.6576522, 0.6852493, -0.05785011, 0, 0, 0, 1, 1,
-0.6532387, 0.7112622, -0.4127704, 0, 0, 0, 1, 1,
-0.652091, -0.01895784, -1.477693, 0, 0, 0, 1, 1,
-0.6474901, 0.6995497, -1.084168, 0, 0, 0, 1, 1,
-0.6443903, -0.8416582, -1.836441, 1, 1, 1, 1, 1,
-0.6392872, 0.664587, 0.7953843, 1, 1, 1, 1, 1,
-0.6365259, 1.573414, -0.6860735, 1, 1, 1, 1, 1,
-0.6358242, 0.05656596, -0.9799726, 1, 1, 1, 1, 1,
-0.6354622, 1.107143, -2.064049, 1, 1, 1, 1, 1,
-0.6308085, 1.192229, -0.183772, 1, 1, 1, 1, 1,
-0.6289583, 1.126052, 1.478131, 1, 1, 1, 1, 1,
-0.6187016, -1.276667, -1.962105, 1, 1, 1, 1, 1,
-0.60818, -1.305513, -3.235192, 1, 1, 1, 1, 1,
-0.6041503, 1.295, -1.773826, 1, 1, 1, 1, 1,
-0.5992107, -1.794344, -1.440738, 1, 1, 1, 1, 1,
-0.597102, 1.359527, -1.551648, 1, 1, 1, 1, 1,
-0.5938548, 0.9711594, 0.06978453, 1, 1, 1, 1, 1,
-0.5922759, -1.212378, -2.31037, 1, 1, 1, 1, 1,
-0.5919022, 0.461374, -1.592142, 1, 1, 1, 1, 1,
-0.5910398, -0.6998165, -2.967866, 0, 0, 1, 1, 1,
-0.5909357, -0.1916311, -2.297262, 1, 0, 0, 1, 1,
-0.5887048, -0.3486435, -1.905804, 1, 0, 0, 1, 1,
-0.5876336, 0.321765, -0.69363, 1, 0, 0, 1, 1,
-0.5874318, 0.8835042, 0.972506, 1, 0, 0, 1, 1,
-0.5829352, 0.999185, -0.3981953, 1, 0, 0, 1, 1,
-0.5803832, 0.7767012, 0.3185061, 0, 0, 0, 1, 1,
-0.5667846, -1.427503, -4.236311, 0, 0, 0, 1, 1,
-0.5621821, -0.3945531, -2.327164, 0, 0, 0, 1, 1,
-0.5618992, 1.284022, 0.6276604, 0, 0, 0, 1, 1,
-0.5618426, -1.538892, -1.896952, 0, 0, 0, 1, 1,
-0.5607073, -0.6102268, -1.834092, 0, 0, 0, 1, 1,
-0.5606017, 0.8289666, -1.958732, 0, 0, 0, 1, 1,
-0.5605916, 0.5821727, 0.3789032, 1, 1, 1, 1, 1,
-0.5533533, -3.309094, -0.3093727, 1, 1, 1, 1, 1,
-0.5484981, -0.1562073, -1.104204, 1, 1, 1, 1, 1,
-0.5473159, 0.7569825, -1.446759, 1, 1, 1, 1, 1,
-0.5408704, 0.3926582, -0.6852766, 1, 1, 1, 1, 1,
-0.5401449, 0.8724518, -1.260091, 1, 1, 1, 1, 1,
-0.5380902, -0.9532623, -2.738734, 1, 1, 1, 1, 1,
-0.5343833, -0.8806064, -2.180897, 1, 1, 1, 1, 1,
-0.5337766, 0.1145108, -2.999153, 1, 1, 1, 1, 1,
-0.5332456, 1.277761, -1.995992, 1, 1, 1, 1, 1,
-0.5330184, 0.2251783, -0.3378628, 1, 1, 1, 1, 1,
-0.5313473, 1.268483, 0.851236, 1, 1, 1, 1, 1,
-0.5294756, -0.4733518, 0.05867015, 1, 1, 1, 1, 1,
-0.5257124, -1.034655, -3.860922, 1, 1, 1, 1, 1,
-0.5248902, 1.329796, -0.1106978, 1, 1, 1, 1, 1,
-0.5241928, -0.9142469, -1.498445, 0, 0, 1, 1, 1,
-0.5240966, 0.7144542, 1.609091, 1, 0, 0, 1, 1,
-0.521914, -0.9884183, -2.347054, 1, 0, 0, 1, 1,
-0.5202356, -0.3220451, -3.372213, 1, 0, 0, 1, 1,
-0.5194504, -0.8422486, -2.368407, 1, 0, 0, 1, 1,
-0.5175489, -0.2845325, -2.955508, 1, 0, 0, 1, 1,
-0.5162941, 0.1542801, -0.7714062, 0, 0, 0, 1, 1,
-0.5160061, 1.063187, -2.782966, 0, 0, 0, 1, 1,
-0.5128453, -1.589955, -2.186958, 0, 0, 0, 1, 1,
-0.5126732, -0.7320508, -3.5235, 0, 0, 0, 1, 1,
-0.5093902, -0.7794051, -3.178216, 0, 0, 0, 1, 1,
-0.5089542, 0.6807943, 0.6263493, 0, 0, 0, 1, 1,
-0.5071603, -0.8237617, -4.299912, 0, 0, 0, 1, 1,
-0.4984637, 0.1045817, -0.5685619, 1, 1, 1, 1, 1,
-0.4971419, 1.444311, -0.4547348, 1, 1, 1, 1, 1,
-0.496967, -0.3262491, -3.56391, 1, 1, 1, 1, 1,
-0.4917715, -1.385937, -2.365026, 1, 1, 1, 1, 1,
-0.4854027, -1.536942, -4.750357, 1, 1, 1, 1, 1,
-0.4827568, -0.3675122, -1.605298, 1, 1, 1, 1, 1,
-0.4815222, -0.1254514, -1.102215, 1, 1, 1, 1, 1,
-0.4766681, 1.109022, 0.9396628, 1, 1, 1, 1, 1,
-0.4738739, 0.7840343, 0.5156989, 1, 1, 1, 1, 1,
-0.472095, -1.733276, -0.4306733, 1, 1, 1, 1, 1,
-0.4712197, 0.5633407, 0.3977136, 1, 1, 1, 1, 1,
-0.470339, 1.046193, 0.1291651, 1, 1, 1, 1, 1,
-0.4658226, 1.71716, -0.1442303, 1, 1, 1, 1, 1,
-0.4657759, -2.955583, -1.191481, 1, 1, 1, 1, 1,
-0.4593409, 1.228537, -0.229365, 1, 1, 1, 1, 1,
-0.4553956, 1.108705, -0.7498667, 0, 0, 1, 1, 1,
-0.4552725, -0.199637, -2.265824, 1, 0, 0, 1, 1,
-0.4541567, -1.154733, -1.013985, 1, 0, 0, 1, 1,
-0.4537314, 0.3627251, -1.337979, 1, 0, 0, 1, 1,
-0.4513326, 1.51418, 2.009132, 1, 0, 0, 1, 1,
-0.4508938, -0.7780779, -1.298848, 1, 0, 0, 1, 1,
-0.4499758, 0.4753973, -1.162678, 0, 0, 0, 1, 1,
-0.4488418, 0.6830345, -0.1841588, 0, 0, 0, 1, 1,
-0.448014, 1.425729, -0.1065294, 0, 0, 0, 1, 1,
-0.4477278, 1.700675, -1.153809, 0, 0, 0, 1, 1,
-0.4455568, -0.09697311, -0.6304436, 0, 0, 0, 1, 1,
-0.443066, 1.663814, -1.399388, 0, 0, 0, 1, 1,
-0.442428, -2.122314, -3.241351, 0, 0, 0, 1, 1,
-0.4397422, 1.543528, -1.936372, 1, 1, 1, 1, 1,
-0.4393397, 0.2315547, -1.791308, 1, 1, 1, 1, 1,
-0.4378861, -0.2309927, -1.604188, 1, 1, 1, 1, 1,
-0.437205, -1.369307, -1.444362, 1, 1, 1, 1, 1,
-0.4320739, 1.157316, -1.511803, 1, 1, 1, 1, 1,
-0.4310792, 1.169669, -1.278489, 1, 1, 1, 1, 1,
-0.4291114, 0.7927231, -0.4717972, 1, 1, 1, 1, 1,
-0.4284237, -0.7426803, -3.381563, 1, 1, 1, 1, 1,
-0.4209301, 0.2203915, -2.228373, 1, 1, 1, 1, 1,
-0.4188007, 1.95496, -0.5138019, 1, 1, 1, 1, 1,
-0.4169766, -0.05524776, -2.995117, 1, 1, 1, 1, 1,
-0.4154176, 0.5719688, -0.5534378, 1, 1, 1, 1, 1,
-0.4145228, -1.494433, -3.075278, 1, 1, 1, 1, 1,
-0.4000732, -0.5577218, -2.08636, 1, 1, 1, 1, 1,
-0.3930661, -0.7638666, -2.302893, 1, 1, 1, 1, 1,
-0.3885798, -0.005846671, -1.405716, 0, 0, 1, 1, 1,
-0.3867724, 0.9492363, -0.0185426, 1, 0, 0, 1, 1,
-0.3829765, 0.5518703, -0.2689232, 1, 0, 0, 1, 1,
-0.3826692, 0.8954251, 2.222244, 1, 0, 0, 1, 1,
-0.3816205, 0.6925774, 0.2924857, 1, 0, 0, 1, 1,
-0.3810661, 0.5182791, -0.4302988, 1, 0, 0, 1, 1,
-0.3802293, 0.2470441, -2.53167, 0, 0, 0, 1, 1,
-0.3784709, 0.6609824, -0.3840975, 0, 0, 0, 1, 1,
-0.3770323, -1.034406, -3.452425, 0, 0, 0, 1, 1,
-0.3618067, -0.4064952, -2.760761, 0, 0, 0, 1, 1,
-0.3616798, -0.4913154, -3.4061, 0, 0, 0, 1, 1,
-0.3579046, -0.8694488, -2.480064, 0, 0, 0, 1, 1,
-0.3572604, 0.4597325, -0.2844099, 0, 0, 0, 1, 1,
-0.3569641, -0.9299377, -2.938948, 1, 1, 1, 1, 1,
-0.3544163, 2.04727, -0.4130554, 1, 1, 1, 1, 1,
-0.3488691, -0.9255626, -3.50701, 1, 1, 1, 1, 1,
-0.346191, -0.1864118, -2.336553, 1, 1, 1, 1, 1,
-0.3407487, -0.2960982, -3.609382, 1, 1, 1, 1, 1,
-0.33185, -1.860482, -1.729885, 1, 1, 1, 1, 1,
-0.3090233, 0.05927493, -2.518353, 1, 1, 1, 1, 1,
-0.307618, 0.377372, -0.5939645, 1, 1, 1, 1, 1,
-0.3067101, -0.4351337, -2.873369, 1, 1, 1, 1, 1,
-0.3064849, 1.028426, -1.905698, 1, 1, 1, 1, 1,
-0.3021126, -1.321405, -3.649344, 1, 1, 1, 1, 1,
-0.2987586, -0.8285723, -2.290212, 1, 1, 1, 1, 1,
-0.2944668, 0.3411385, -0.6711082, 1, 1, 1, 1, 1,
-0.2920631, -1.190528, -2.80145, 1, 1, 1, 1, 1,
-0.2875594, 0.4410758, 1.531935, 1, 1, 1, 1, 1,
-0.2867333, -0.4893428, -3.525196, 0, 0, 1, 1, 1,
-0.2864932, 0.6554183, 0.4435666, 1, 0, 0, 1, 1,
-0.2812903, 0.9843891, -3.096302, 1, 0, 0, 1, 1,
-0.2700321, -0.3003107, -3.219496, 1, 0, 0, 1, 1,
-0.2674881, -1.087807, -2.183454, 1, 0, 0, 1, 1,
-0.2668619, -0.5029683, -3.044284, 1, 0, 0, 1, 1,
-0.2664805, 1.98195, -0.007128241, 0, 0, 0, 1, 1,
-0.2645156, -1.316708, -2.374496, 0, 0, 0, 1, 1,
-0.2598277, 2.038595, 1.116627, 0, 0, 0, 1, 1,
-0.2587141, -0.4626642, -1.186021, 0, 0, 0, 1, 1,
-0.2582087, -0.8324625, -3.94491, 0, 0, 0, 1, 1,
-0.2575777, 0.4364607, 0.1872219, 0, 0, 0, 1, 1,
-0.2567781, 1.891564, -0.2137702, 0, 0, 0, 1, 1,
-0.2566095, -1.581564, -3.908025, 1, 1, 1, 1, 1,
-0.2552381, -0.6634707, -2.948503, 1, 1, 1, 1, 1,
-0.2517385, 0.5275731, 0.9067747, 1, 1, 1, 1, 1,
-0.251458, -0.1958963, -1.222373, 1, 1, 1, 1, 1,
-0.2503141, 1.035351, -1.466305, 1, 1, 1, 1, 1,
-0.2497359, -0.3327676, -1.043767, 1, 1, 1, 1, 1,
-0.2454782, -0.5384666, -4.074854, 1, 1, 1, 1, 1,
-0.2437203, 0.01929411, -2.456135, 1, 1, 1, 1, 1,
-0.2389038, -0.1022482, -2.757, 1, 1, 1, 1, 1,
-0.2376892, -1.242695, -1.519695, 1, 1, 1, 1, 1,
-0.2330659, -0.6476434, -2.439609, 1, 1, 1, 1, 1,
-0.2330557, -2.790301, -4.528169, 1, 1, 1, 1, 1,
-0.2324201, -0.4868406, -2.096699, 1, 1, 1, 1, 1,
-0.2290029, 0.8463777, 0.4549983, 1, 1, 1, 1, 1,
-0.2276557, 0.2090356, -0.2662819, 1, 1, 1, 1, 1,
-0.2237925, -2.192392, -4.900774, 0, 0, 1, 1, 1,
-0.2237006, -0.6647175, -1.331559, 1, 0, 0, 1, 1,
-0.2134282, -0.5327545, -1.042896, 1, 0, 0, 1, 1,
-0.2082371, -1.320913, -1.788671, 1, 0, 0, 1, 1,
-0.2081681, 0.3225949, 0.02797644, 1, 0, 0, 1, 1,
-0.2058298, -1.796229, -2.09265, 1, 0, 0, 1, 1,
-0.2039627, 0.212246, -0.6999783, 0, 0, 0, 1, 1,
-0.2034337, -0.6034916, -1.12969, 0, 0, 0, 1, 1,
-0.1941779, 0.7765152, -0.3328784, 0, 0, 0, 1, 1,
-0.1915551, 1.122884, 0.4964978, 0, 0, 0, 1, 1,
-0.1907411, -0.8275011, -2.108929, 0, 0, 0, 1, 1,
-0.1899522, -1.344582, -2.055444, 0, 0, 0, 1, 1,
-0.189205, 0.6896839, 0.2560749, 0, 0, 0, 1, 1,
-0.1858819, 1.799616, 1.358809, 1, 1, 1, 1, 1,
-0.1842326, -0.3837872, -3.319485, 1, 1, 1, 1, 1,
-0.1840824, -1.622677, -1.659017, 1, 1, 1, 1, 1,
-0.1838131, 2.547023, 0.880994, 1, 1, 1, 1, 1,
-0.1822704, -1.363397, -3.339954, 1, 1, 1, 1, 1,
-0.1722843, -0.3057549, -3.965495, 1, 1, 1, 1, 1,
-0.1716136, -1.050501, -2.78061, 1, 1, 1, 1, 1,
-0.1684226, 1.470001, 0.09722934, 1, 1, 1, 1, 1,
-0.1652937, -0.3247804, -3.72693, 1, 1, 1, 1, 1,
-0.1629054, -0.987797, -1.59991, 1, 1, 1, 1, 1,
-0.1603724, -1.393338, -1.742161, 1, 1, 1, 1, 1,
-0.1539319, -0.2762264, -3.100297, 1, 1, 1, 1, 1,
-0.1524792, 1.048555, -0.7905254, 1, 1, 1, 1, 1,
-0.1498561, -0.3684863, -2.533941, 1, 1, 1, 1, 1,
-0.1496028, -0.7333246, -2.378339, 1, 1, 1, 1, 1,
-0.1486716, -0.4083081, -1.368542, 0, 0, 1, 1, 1,
-0.1456948, 2.699685, -3.124596, 1, 0, 0, 1, 1,
-0.1447019, -0.05908239, -2.027349, 1, 0, 0, 1, 1,
-0.1433082, -0.6657456, -1.633327, 1, 0, 0, 1, 1,
-0.1419816, -0.4466932, -4.511158, 1, 0, 0, 1, 1,
-0.1402633, -0.8777417, -1.970147, 1, 0, 0, 1, 1,
-0.1401239, 0.5014532, -0.2916835, 0, 0, 0, 1, 1,
-0.1383848, 0.3335712, 0.4049115, 0, 0, 0, 1, 1,
-0.1370285, -1.798012, -3.627838, 0, 0, 0, 1, 1,
-0.135937, -0.5827253, -2.194929, 0, 0, 0, 1, 1,
-0.1352845, 0.03517344, -2.825106, 0, 0, 0, 1, 1,
-0.1290094, -0.2038595, -3.258223, 0, 0, 0, 1, 1,
-0.123614, -1.02166, -4.517393, 0, 0, 0, 1, 1,
-0.1182285, -0.4672711, -4.526541, 1, 1, 1, 1, 1,
-0.1154348, -0.4365672, -3.091061, 1, 1, 1, 1, 1,
-0.1103949, 1.822753, -0.7470894, 1, 1, 1, 1, 1,
-0.104028, -0.935477, -1.364791, 1, 1, 1, 1, 1,
-0.09798375, -0.1980905, -2.330166, 1, 1, 1, 1, 1,
-0.0896694, -1.220237, -0.4770831, 1, 1, 1, 1, 1,
-0.08885439, 0.2561167, 1.364708, 1, 1, 1, 1, 1,
-0.08686972, -0.01059952, -1.983632, 1, 1, 1, 1, 1,
-0.08646479, -0.6951281, -2.673931, 1, 1, 1, 1, 1,
-0.08627461, -0.1115389, -3.300852, 1, 1, 1, 1, 1,
-0.08389436, 1.099728, -1.447663, 1, 1, 1, 1, 1,
-0.08206277, 0.5639622, -2.951701, 1, 1, 1, 1, 1,
-0.0796985, 2.077721, -0.879634, 1, 1, 1, 1, 1,
-0.07617613, 0.001349749, -0.6461956, 1, 1, 1, 1, 1,
-0.07609408, -0.1469256, -1.671911, 1, 1, 1, 1, 1,
-0.07254731, 0.1968365, 0.8791509, 0, 0, 1, 1, 1,
-0.07084119, 0.5100369, -2.596885, 1, 0, 0, 1, 1,
-0.06748161, 0.53395, 0.7640427, 1, 0, 0, 1, 1,
-0.06672817, -0.8719385, -2.673599, 1, 0, 0, 1, 1,
-0.06629772, 0.05881247, -0.8151167, 1, 0, 0, 1, 1,
-0.0652852, -0.528081, -2.560538, 1, 0, 0, 1, 1,
-0.06357372, -0.2583706, -3.731384, 0, 0, 0, 1, 1,
-0.06314912, -0.2113184, -1.335011, 0, 0, 0, 1, 1,
-0.05893673, -0.2108311, -2.787965, 0, 0, 0, 1, 1,
-0.05691132, 0.3217163, -1.002128, 0, 0, 0, 1, 1,
-0.05487898, -0.1294845, -3.58742, 0, 0, 0, 1, 1,
-0.05367908, 1.648618, -0.3345019, 0, 0, 0, 1, 1,
-0.05062359, 1.459558, 1.25075, 0, 0, 0, 1, 1,
-0.05005961, 0.4918807, -0.6755374, 1, 1, 1, 1, 1,
-0.04961298, -1.544304, -4.019435, 1, 1, 1, 1, 1,
-0.04240116, 2.846067, -1.180944, 1, 1, 1, 1, 1,
-0.04239225, -0.8514532, -3.484665, 1, 1, 1, 1, 1,
-0.03877621, 0.03321748, -0.2660394, 1, 1, 1, 1, 1,
-0.03597919, 0.06231352, -1.878168, 1, 1, 1, 1, 1,
-0.03517969, 0.7064773, 2.272894, 1, 1, 1, 1, 1,
-0.03377649, 1.041031, 1.002854, 1, 1, 1, 1, 1,
-0.03329512, -1.182102, -3.302469, 1, 1, 1, 1, 1,
-0.03100366, -1.637756, -2.473734, 1, 1, 1, 1, 1,
-0.02957845, -0.4049412, -2.055422, 1, 1, 1, 1, 1,
-0.0287385, -0.672457, -2.657647, 1, 1, 1, 1, 1,
-0.02690545, -1.151313, -2.190618, 1, 1, 1, 1, 1,
-0.02346392, -0.2999142, -2.488001, 1, 1, 1, 1, 1,
-0.0220767, -0.2597271, -4.001874, 1, 1, 1, 1, 1,
-0.01689327, 0.5270224, -0.1358974, 0, 0, 1, 1, 1,
-0.01633783, -0.2870752, -3.865017, 1, 0, 0, 1, 1,
-0.008558854, -0.3784063, -4.230875, 1, 0, 0, 1, 1,
-0.006218665, 2.063334, 1.36084, 1, 0, 0, 1, 1,
0.001616448, 0.2522178, 1.228667, 1, 0, 0, 1, 1,
0.002774482, -0.5717853, 3.064934, 1, 0, 0, 1, 1,
0.003058308, -1.305509, 1.778382, 0, 0, 0, 1, 1,
0.005425035, 0.3182458, 0.1222677, 0, 0, 0, 1, 1,
0.006583695, -0.7123359, 2.815389, 0, 0, 0, 1, 1,
0.01163772, 0.2924355, -0.1779411, 0, 0, 0, 1, 1,
0.01417848, 0.2523475, 0.6148319, 0, 0, 0, 1, 1,
0.0154053, 0.5528885, -0.3930169, 0, 0, 0, 1, 1,
0.01818715, -0.9177213, 2.424449, 0, 0, 0, 1, 1,
0.02035684, -0.07037617, 2.826368, 1, 1, 1, 1, 1,
0.02193237, -0.2038042, 4.705063, 1, 1, 1, 1, 1,
0.03255874, -0.2814051, 4.282191, 1, 1, 1, 1, 1,
0.03291125, -0.2917895, 2.973412, 1, 1, 1, 1, 1,
0.03699041, -0.265043, 4.543915, 1, 1, 1, 1, 1,
0.03936833, 0.1803884, -0.8341292, 1, 1, 1, 1, 1,
0.04229402, 1.184122, -0.2081376, 1, 1, 1, 1, 1,
0.04481023, -1.043928, 3.81728, 1, 1, 1, 1, 1,
0.04603523, 1.033343, 0.5515872, 1, 1, 1, 1, 1,
0.04625903, -0.612371, 0.9031406, 1, 1, 1, 1, 1,
0.05275193, -0.4531102, 3.145738, 1, 1, 1, 1, 1,
0.0537906, -0.8509653, 3.506036, 1, 1, 1, 1, 1,
0.05388201, -1.163351, 3.553111, 1, 1, 1, 1, 1,
0.0588132, 1.138135, -0.5869653, 1, 1, 1, 1, 1,
0.06187633, -0.5212596, 1.722771, 1, 1, 1, 1, 1,
0.07042339, 1.983102, 0.9612556, 0, 0, 1, 1, 1,
0.07047525, 1.637018, -0.4626079, 1, 0, 0, 1, 1,
0.07264474, 0.7763962, -1.295459, 1, 0, 0, 1, 1,
0.07283406, -0.3781564, 2.745736, 1, 0, 0, 1, 1,
0.07426106, -1.151833, 2.229152, 1, 0, 0, 1, 1,
0.07528514, 0.08761277, 1.097717, 1, 0, 0, 1, 1,
0.07613984, 0.6505244, -0.7474782, 0, 0, 0, 1, 1,
0.07627647, -0.8910065, 2.349663, 0, 0, 0, 1, 1,
0.07674568, 0.6142607, -1.043043, 0, 0, 0, 1, 1,
0.07825647, 0.4846384, 0.09086212, 0, 0, 0, 1, 1,
0.07868071, -0.5326262, 2.289804, 0, 0, 0, 1, 1,
0.08289764, -1.124644, 3.368774, 0, 0, 0, 1, 1,
0.08349326, 0.7435642, 0.7302228, 0, 0, 0, 1, 1,
0.08812605, -0.2389114, 2.325208, 1, 1, 1, 1, 1,
0.09218567, 1.840178, -1.927946, 1, 1, 1, 1, 1,
0.1034188, -0.4666789, 2.597145, 1, 1, 1, 1, 1,
0.1037594, 0.4332542, 1.634478, 1, 1, 1, 1, 1,
0.10385, 1.196345, 0.643681, 1, 1, 1, 1, 1,
0.1066129, -0.6215017, 1.838998, 1, 1, 1, 1, 1,
0.1076573, 0.6818416, -0.4697884, 1, 1, 1, 1, 1,
0.1097467, 1.024892, -0.5255318, 1, 1, 1, 1, 1,
0.1102035, -0.8953583, 2.599095, 1, 1, 1, 1, 1,
0.1143578, 0.8098284, 0.329308, 1, 1, 1, 1, 1,
0.1143823, -0.0756348, 0.2886271, 1, 1, 1, 1, 1,
0.1181839, 0.1918603, -1.884701, 1, 1, 1, 1, 1,
0.1203952, 0.07562229, 1.075868, 1, 1, 1, 1, 1,
0.1224413, 0.9184503, -0.7936496, 1, 1, 1, 1, 1,
0.124075, -0.5658714, 2.87566, 1, 1, 1, 1, 1,
0.1250957, 0.567426, 1.228454, 0, 0, 1, 1, 1,
0.1262667, -0.7048327, 4.036994, 1, 0, 0, 1, 1,
0.1277104, 0.05225878, 2.737927, 1, 0, 0, 1, 1,
0.1320751, 1.35635, -0.3706214, 1, 0, 0, 1, 1,
0.1344475, 2.256685, 0.7949614, 1, 0, 0, 1, 1,
0.1371097, -0.6844196, 3.8106, 1, 0, 0, 1, 1,
0.1388589, 0.6913522, 1.277418, 0, 0, 0, 1, 1,
0.1422935, 1.419701, 0.8479972, 0, 0, 0, 1, 1,
0.1446316, -0.2614565, 2.215984, 0, 0, 0, 1, 1,
0.145371, 0.08049462, 1.854666, 0, 0, 0, 1, 1,
0.1516211, 1.422554, -0.6440549, 0, 0, 0, 1, 1,
0.1541305, -0.06391206, 1.94787, 0, 0, 0, 1, 1,
0.1545624, -0.658286, 1.464396, 0, 0, 0, 1, 1,
0.156872, -0.3488334, 4.301331, 1, 1, 1, 1, 1,
0.1590912, 0.8690584, -0.3332895, 1, 1, 1, 1, 1,
0.1606735, -0.2577858, 4.143516, 1, 1, 1, 1, 1,
0.1656852, -0.6893072, 3.541142, 1, 1, 1, 1, 1,
0.1657804, -1.030332, 1.547173, 1, 1, 1, 1, 1,
0.1751955, 0.8845126, -0.3661852, 1, 1, 1, 1, 1,
0.1758542, -0.2768426, 1.776542, 1, 1, 1, 1, 1,
0.1790704, 2.00306, 0.9042652, 1, 1, 1, 1, 1,
0.1816908, 2.263352, -1.527657, 1, 1, 1, 1, 1,
0.1842048, 0.4599963, 0.9665436, 1, 1, 1, 1, 1,
0.1870462, 1.308997, -0.7992678, 1, 1, 1, 1, 1,
0.1899547, 0.2972597, 0.78897, 1, 1, 1, 1, 1,
0.1926195, 0.4399261, 0.2444016, 1, 1, 1, 1, 1,
0.1928346, 0.1660794, 0.9214278, 1, 1, 1, 1, 1,
0.193481, 0.2561283, -1.262848, 1, 1, 1, 1, 1,
0.1970997, 0.5077611, -0.7093206, 0, 0, 1, 1, 1,
0.2029987, -0.5702509, 3.408607, 1, 0, 0, 1, 1,
0.2059246, -0.08529402, 2.72824, 1, 0, 0, 1, 1,
0.2063349, -1.325086, 3.90338, 1, 0, 0, 1, 1,
0.2129256, -0.5879501, 4.292879, 1, 0, 0, 1, 1,
0.2149461, 0.9460043, 0.7395867, 1, 0, 0, 1, 1,
0.2182001, -1.403309, 4.122462, 0, 0, 0, 1, 1,
0.2191123, -0.5235931, 3.496713, 0, 0, 0, 1, 1,
0.2264046, -0.1445877, 1.929245, 0, 0, 0, 1, 1,
0.2273606, -0.9522437, 2.928396, 0, 0, 0, 1, 1,
0.227807, -0.8314408, 3.53056, 0, 0, 0, 1, 1,
0.227909, 0.8207541, -0.07868237, 0, 0, 0, 1, 1,
0.2280505, 0.1420335, -0.1844041, 0, 0, 0, 1, 1,
0.2295391, 0.4547397, 0.8825424, 1, 1, 1, 1, 1,
0.2311117, 0.0809256, 1.450127, 1, 1, 1, 1, 1,
0.235817, 0.2908598, 0.5250039, 1, 1, 1, 1, 1,
0.2379389, -0.04394344, 1.754259, 1, 1, 1, 1, 1,
0.2393018, -0.2456617, 2.775103, 1, 1, 1, 1, 1,
0.2395725, -0.7556526, 2.449092, 1, 1, 1, 1, 1,
0.244322, -0.1188117, 1.43198, 1, 1, 1, 1, 1,
0.2449294, 1.217061, 1.099176, 1, 1, 1, 1, 1,
0.2453673, -0.5279748, 2.746224, 1, 1, 1, 1, 1,
0.2470221, -1.094991, 3.43073, 1, 1, 1, 1, 1,
0.2559, 1.30216, 0.2801854, 1, 1, 1, 1, 1,
0.2584994, 0.95228, 1.118176, 1, 1, 1, 1, 1,
0.2589253, 1.022203, -0.1481608, 1, 1, 1, 1, 1,
0.2595877, -0.786062, 1.69573, 1, 1, 1, 1, 1,
0.2626681, -0.6643863, 3.143912, 1, 1, 1, 1, 1,
0.2633002, -0.05933562, 3.501367, 0, 0, 1, 1, 1,
0.2691281, -1.301211, 4.730776, 1, 0, 0, 1, 1,
0.2708847, -0.7709746, 2.164835, 1, 0, 0, 1, 1,
0.2761359, 0.5347465, -1.268935, 1, 0, 0, 1, 1,
0.2788525, 0.02909928, 0.7669262, 1, 0, 0, 1, 1,
0.2845418, -0.7834113, 2.662897, 1, 0, 0, 1, 1,
0.2857746, 0.2045123, 1.130627, 0, 0, 0, 1, 1,
0.2878315, -2.333502, 4.9267, 0, 0, 0, 1, 1,
0.2909438, 1.570386, 1.105571, 0, 0, 0, 1, 1,
0.2915964, -1.100255, 0.3653565, 0, 0, 0, 1, 1,
0.2976382, 0.586431, -0.7216361, 0, 0, 0, 1, 1,
0.2992435, 1.098133, 0.4074029, 0, 0, 0, 1, 1,
0.3014466, 0.8597931, 0.4039296, 0, 0, 0, 1, 1,
0.3027793, 0.1686204, 1.593532, 1, 1, 1, 1, 1,
0.3031128, -0.5518986, 3.349939, 1, 1, 1, 1, 1,
0.3033182, -0.2089019, 1.291074, 1, 1, 1, 1, 1,
0.3092846, -0.5117992, 3.103459, 1, 1, 1, 1, 1,
0.3167123, -0.4443193, 3.241358, 1, 1, 1, 1, 1,
0.31765, 0.3334847, 1.140779, 1, 1, 1, 1, 1,
0.3238143, -0.1787771, 2.376551, 1, 1, 1, 1, 1,
0.3250126, 0.5100106, 1.873229, 1, 1, 1, 1, 1,
0.3282957, -0.4946076, 2.624748, 1, 1, 1, 1, 1,
0.3336062, 1.593215, 0.7527438, 1, 1, 1, 1, 1,
0.3405258, -0.03112216, 0.5871205, 1, 1, 1, 1, 1,
0.348007, -0.9362197, 1.735351, 1, 1, 1, 1, 1,
0.3493945, -0.4440165, 0.2866464, 1, 1, 1, 1, 1,
0.3495015, -1.141246, 3.819766, 1, 1, 1, 1, 1,
0.3507189, 0.8879399, -0.3830488, 1, 1, 1, 1, 1,
0.3526016, -0.2908311, 0.2213503, 0, 0, 1, 1, 1,
0.3599595, 0.1266471, 1.896066, 1, 0, 0, 1, 1,
0.3673492, 0.3832388, 1.648567, 1, 0, 0, 1, 1,
0.3730579, -0.5570086, 2.221514, 1, 0, 0, 1, 1,
0.3744392, 0.1069312, 1.314994, 1, 0, 0, 1, 1,
0.3767504, -0.3999129, 1.95642, 1, 0, 0, 1, 1,
0.3772618, 0.7425427, 0.7202792, 0, 0, 0, 1, 1,
0.3798504, 0.3697016, 1.012353, 0, 0, 0, 1, 1,
0.3812564, -0.6807356, 1.624645, 0, 0, 0, 1, 1,
0.3830228, -0.1487688, 1.800823, 0, 0, 0, 1, 1,
0.3851093, 1.206501, 0.005554977, 0, 0, 0, 1, 1,
0.3868383, 1.371964, -1.112733, 0, 0, 0, 1, 1,
0.3875743, -0.6715861, 2.893049, 0, 0, 0, 1, 1,
0.3900837, 1.125101, 0.4242043, 1, 1, 1, 1, 1,
0.3925504, -1.393377, 2.964671, 1, 1, 1, 1, 1,
0.3968014, -1.374622, 2.468367, 1, 1, 1, 1, 1,
0.3971538, -0.7150136, 2.958427, 1, 1, 1, 1, 1,
0.3990891, -1.11231, 1.904388, 1, 1, 1, 1, 1,
0.4106724, -0.8227364, 2.101839, 1, 1, 1, 1, 1,
0.4146382, -1.092545, 2.689376, 1, 1, 1, 1, 1,
0.4149793, 0.0146816, 0.4878929, 1, 1, 1, 1, 1,
0.4177892, 0.1005981, 0.8509883, 1, 1, 1, 1, 1,
0.4209285, 0.4024245, 1.940699, 1, 1, 1, 1, 1,
0.4226772, -0.7589872, 4.050865, 1, 1, 1, 1, 1,
0.426666, 1.517273, 1.138228, 1, 1, 1, 1, 1,
0.4280394, 0.8727494, -0.1552674, 1, 1, 1, 1, 1,
0.4305595, 0.5945061, 0.5503682, 1, 1, 1, 1, 1,
0.4332502, -0.1350736, 2.951606, 1, 1, 1, 1, 1,
0.4337262, -0.4355555, 2.553372, 0, 0, 1, 1, 1,
0.4342597, -1.451616, 2.114533, 1, 0, 0, 1, 1,
0.45098, 1.28024, 0.9265382, 1, 0, 0, 1, 1,
0.4533521, -0.2059339, 4.272114, 1, 0, 0, 1, 1,
0.4560608, -0.8754954, 0.6082107, 1, 0, 0, 1, 1,
0.4589689, 0.02038444, 0.9958705, 1, 0, 0, 1, 1,
0.4590637, -1.909252, 4.632932, 0, 0, 0, 1, 1,
0.4609116, 1.491591, 0.2515816, 0, 0, 0, 1, 1,
0.4657827, 1.269241, 1.846055, 0, 0, 0, 1, 1,
0.4674342, 0.3422767, 1.586711, 0, 0, 0, 1, 1,
0.4678508, 0.9902695, 0.9280386, 0, 0, 0, 1, 1,
0.4696979, -0.7901295, -0.09872654, 0, 0, 0, 1, 1,
0.4735651, -1.803355, 2.252567, 0, 0, 0, 1, 1,
0.4817592, -0.2370332, 2.068245, 1, 1, 1, 1, 1,
0.4845769, 0.315923, 0.9214773, 1, 1, 1, 1, 1,
0.4887942, -1.949814, 3.250046, 1, 1, 1, 1, 1,
0.4895874, 0.3700033, -1.232117, 1, 1, 1, 1, 1,
0.4950553, 0.8153005, 0.9608943, 1, 1, 1, 1, 1,
0.5042688, 3.340579, -1.581314, 1, 1, 1, 1, 1,
0.5050684, -1.248473, 1.315685, 1, 1, 1, 1, 1,
0.5079078, 0.745524, 0.4191841, 1, 1, 1, 1, 1,
0.50945, -0.3253062, 2.641596, 1, 1, 1, 1, 1,
0.509765, 0.3354421, 1.024595, 1, 1, 1, 1, 1,
0.5131779, 1.214818, 1.259366, 1, 1, 1, 1, 1,
0.5172772, -0.2239948, 3.061166, 1, 1, 1, 1, 1,
0.5197942, 0.377897, -0.3536287, 1, 1, 1, 1, 1,
0.5316022, -0.8800399, 3.977344, 1, 1, 1, 1, 1,
0.5319595, 0.1392063, 0.3194883, 1, 1, 1, 1, 1,
0.5352304, -0.9003134, 3.530005, 0, 0, 1, 1, 1,
0.5352504, -0.1697009, 3.129291, 1, 0, 0, 1, 1,
0.5360002, 0.33929, 1.196786, 1, 0, 0, 1, 1,
0.5362778, -0.4665111, 2.021596, 1, 0, 0, 1, 1,
0.5385299, -0.6470598, 2.500565, 1, 0, 0, 1, 1,
0.5398321, 0.1356757, 0.3358037, 1, 0, 0, 1, 1,
0.5445684, 1.308196, 0.3880335, 0, 0, 0, 1, 1,
0.5457256, 0.4326815, 2.098508, 0, 0, 0, 1, 1,
0.5499684, -1.462892, 1.448235, 0, 0, 0, 1, 1,
0.5546524, 0.1971098, 1.970794, 0, 0, 0, 1, 1,
0.5556395, 1.026002, 1.312455, 0, 0, 0, 1, 1,
0.5558726, -0.8597734, 2.428689, 0, 0, 0, 1, 1,
0.5626938, -1.826805, 2.081149, 0, 0, 0, 1, 1,
0.563333, 2.051772, -0.1395361, 1, 1, 1, 1, 1,
0.5661755, 0.1510963, 2.010492, 1, 1, 1, 1, 1,
0.5744377, -2.016398, 3.060567, 1, 1, 1, 1, 1,
0.5793507, -0.4859595, 1.780349, 1, 1, 1, 1, 1,
0.5799492, 1.150805, 1.188001, 1, 1, 1, 1, 1,
0.5827366, -1.316309, 2.095118, 1, 1, 1, 1, 1,
0.5874758, 0.1992562, 0.3513585, 1, 1, 1, 1, 1,
0.5885668, 0.0009495526, 0.169512, 1, 1, 1, 1, 1,
0.5901027, 0.929196, -1.186484, 1, 1, 1, 1, 1,
0.5926515, 1.553071, -0.747613, 1, 1, 1, 1, 1,
0.5935926, -1.175693, 3.583217, 1, 1, 1, 1, 1,
0.5943127, -0.052838, 2.246494, 1, 1, 1, 1, 1,
0.5996333, 0.03063715, 1.870437, 1, 1, 1, 1, 1,
0.6019408, -0.06915732, 1.244414, 1, 1, 1, 1, 1,
0.6036265, -0.8155994, 2.753091, 1, 1, 1, 1, 1,
0.6060313, -0.6392893, 3.967374, 0, 0, 1, 1, 1,
0.6081422, -2.189227, 2.097886, 1, 0, 0, 1, 1,
0.6121879, 2.126431, -0.1402173, 1, 0, 0, 1, 1,
0.6131036, 0.1372205, 2.544925, 1, 0, 0, 1, 1,
0.6150635, -0.3045045, 2.902723, 1, 0, 0, 1, 1,
0.6157848, 1.045049, 0.05791257, 1, 0, 0, 1, 1,
0.6169371, 0.01984828, 1.460868, 0, 0, 0, 1, 1,
0.6185269, 0.8169022, 1.408625, 0, 0, 0, 1, 1,
0.6219935, 0.5082484, 0.7453895, 0, 0, 0, 1, 1,
0.6225561, 0.9236119, 0.9505066, 0, 0, 0, 1, 1,
0.6231502, -0.5414445, 2.749361, 0, 0, 0, 1, 1,
0.6233217, 0.8843221, 1.045029, 0, 0, 0, 1, 1,
0.6236846, 1.590397, 1.150779, 0, 0, 0, 1, 1,
0.6241862, -0.1731282, 1.269313, 1, 1, 1, 1, 1,
0.6300356, -1.465875, 3.94927, 1, 1, 1, 1, 1,
0.6311347, -0.5624481, 1.399241, 1, 1, 1, 1, 1,
0.6319696, -0.63875, 3.45698, 1, 1, 1, 1, 1,
0.6356853, -0.808156, 3.755932, 1, 1, 1, 1, 1,
0.6359388, -0.4223706, 2.556568, 1, 1, 1, 1, 1,
0.639812, -2.440677, 3.38377, 1, 1, 1, 1, 1,
0.6400548, 0.1108059, 0.06377641, 1, 1, 1, 1, 1,
0.6411321, -0.943495, 2.781292, 1, 1, 1, 1, 1,
0.6441697, -0.3822067, 2.540837, 1, 1, 1, 1, 1,
0.6481043, 0.529996, 1.084765, 1, 1, 1, 1, 1,
0.654824, 0.850397, -0.8054806, 1, 1, 1, 1, 1,
0.6603631, 0.4749909, -0.5350831, 1, 1, 1, 1, 1,
0.6608851, 0.606831, 2.100293, 1, 1, 1, 1, 1,
0.6624483, -0.5750102, 1.265752, 1, 1, 1, 1, 1,
0.6657095, 2.04351, -0.2147793, 0, 0, 1, 1, 1,
0.6723835, 0.8353708, 1.912087, 1, 0, 0, 1, 1,
0.6724547, -0.9469007, 2.09348, 1, 0, 0, 1, 1,
0.6725073, 0.3061777, -0.2840553, 1, 0, 0, 1, 1,
0.6731238, 0.2617103, 1.347185, 1, 0, 0, 1, 1,
0.6734169, -1.94664, 3.199776, 1, 0, 0, 1, 1,
0.6807486, 0.871043, 0.6063904, 0, 0, 0, 1, 1,
0.6837617, -0.5608233, 1.185731, 0, 0, 0, 1, 1,
0.6840231, -1.476437, 1.802058, 0, 0, 0, 1, 1,
0.6926916, -0.469714, 1.992141, 0, 0, 0, 1, 1,
0.7009802, -0.2725331, 1.004417, 0, 0, 0, 1, 1,
0.7043977, -0.1872318, 3.09796, 0, 0, 0, 1, 1,
0.7049204, -0.3881716, 2.121316, 0, 0, 0, 1, 1,
0.7159898, -0.6361498, 2.254873, 1, 1, 1, 1, 1,
0.7264943, 2.440468, 1.739556, 1, 1, 1, 1, 1,
0.727556, -2.043124, 2.957648, 1, 1, 1, 1, 1,
0.7310938, -0.695294, 0.4985678, 1, 1, 1, 1, 1,
0.7311493, -2.984145, 1.560096, 1, 1, 1, 1, 1,
0.7349328, 0.3843136, 1.423742, 1, 1, 1, 1, 1,
0.7351632, -2.132974, 2.850572, 1, 1, 1, 1, 1,
0.7357367, -0.2162403, 1.383154, 1, 1, 1, 1, 1,
0.7374634, 1.771049, 0.4607995, 1, 1, 1, 1, 1,
0.7408011, 0.1347386, 3.458238, 1, 1, 1, 1, 1,
0.7417201, -0.2423609, -0.1652387, 1, 1, 1, 1, 1,
0.7457379, -1.489275, 2.48132, 1, 1, 1, 1, 1,
0.7507499, -1.018447, 0.7516071, 1, 1, 1, 1, 1,
0.7515116, -0.5097726, 2.640164, 1, 1, 1, 1, 1,
0.7546005, -0.2729949, -0.6347387, 1, 1, 1, 1, 1,
0.7671962, 0.3776223, 0.3044006, 0, 0, 1, 1, 1,
0.7728968, 0.484194, -0.7137676, 1, 0, 0, 1, 1,
0.7741753, -0.1379876, 0.5590112, 1, 0, 0, 1, 1,
0.7794514, 0.2432433, 3.067551, 1, 0, 0, 1, 1,
0.7815878, -0.654, 1.860615, 1, 0, 0, 1, 1,
0.7845588, 0.4558357, 2.421843, 1, 0, 0, 1, 1,
0.792107, 0.8844885, -0.7905457, 0, 0, 0, 1, 1,
0.7996646, 0.3410113, 0.3876674, 0, 0, 0, 1, 1,
0.8025245, -0.8882062, 2.567913, 0, 0, 0, 1, 1,
0.8071882, -0.04204173, 2.095209, 0, 0, 0, 1, 1,
0.8111925, -1.300384, 2.202126, 0, 0, 0, 1, 1,
0.8133133, 0.2638229, 2.603746, 0, 0, 0, 1, 1,
0.8162855, -0.7855779, 3.000754, 0, 0, 0, 1, 1,
0.8186937, -0.1164426, 0.9167221, 1, 1, 1, 1, 1,
0.8214764, -1.870469, 2.295864, 1, 1, 1, 1, 1,
0.8216536, 0.1477549, 2.831345, 1, 1, 1, 1, 1,
0.8246394, 0.708617, 0.3885019, 1, 1, 1, 1, 1,
0.8255213, -0.4222509, 4.1508, 1, 1, 1, 1, 1,
0.8285618, 0.6537334, 0.772786, 1, 1, 1, 1, 1,
0.834329, -0.3873201, 0.02490672, 1, 1, 1, 1, 1,
0.8381184, -0.6499646, 1.075453, 1, 1, 1, 1, 1,
0.8392975, -0.223824, 0.7667704, 1, 1, 1, 1, 1,
0.8458201, -1.021206, 1.510153, 1, 1, 1, 1, 1,
0.8480943, 0.145737, 1.320349, 1, 1, 1, 1, 1,
0.8511539, -0.2430484, 2.122695, 1, 1, 1, 1, 1,
0.8657084, 0.009940998, 1.861788, 1, 1, 1, 1, 1,
0.8692883, -0.01285593, 1.073271, 1, 1, 1, 1, 1,
0.8709042, -0.625962, 1.580315, 1, 1, 1, 1, 1,
0.8752822, -0.7583455, 0.5756589, 0, 0, 1, 1, 1,
0.878952, 1.305763, 0.3106786, 1, 0, 0, 1, 1,
0.8924235, -0.0340411, 1.335917, 1, 0, 0, 1, 1,
0.8961582, 0.06857562, 1.724445, 1, 0, 0, 1, 1,
0.8993309, 0.3580888, 1.942029, 1, 0, 0, 1, 1,
0.9013475, -0.1805725, 2.765967, 1, 0, 0, 1, 1,
0.9037418, 0.463901, 0.3254425, 0, 0, 0, 1, 1,
0.912716, -1.04249, 4.02855, 0, 0, 0, 1, 1,
0.9133632, -1.391412, 1.571584, 0, 0, 0, 1, 1,
0.9172789, 1.906536, -0.2120562, 0, 0, 0, 1, 1,
0.920884, -1.11401, 1.70468, 0, 0, 0, 1, 1,
0.9266839, -0.8101492, 1.114507, 0, 0, 0, 1, 1,
0.9328151, -0.9585831, 1.616508, 0, 0, 0, 1, 1,
0.9480876, 1.041824, 0.1004212, 1, 1, 1, 1, 1,
0.9525305, -0.7858359, 1.221619, 1, 1, 1, 1, 1,
0.957998, -0.5964, 3.293553, 1, 1, 1, 1, 1,
0.9592782, 0.6270288, 2.27245, 1, 1, 1, 1, 1,
0.9609635, 0.5738685, -0.3271832, 1, 1, 1, 1, 1,
0.967204, 0.7613435, 0.450141, 1, 1, 1, 1, 1,
0.9682962, 0.9929682, 0.728556, 1, 1, 1, 1, 1,
0.9684551, 2.727465, 0.2511525, 1, 1, 1, 1, 1,
0.9756188, -0.09774633, 1.069312, 1, 1, 1, 1, 1,
0.9783458, -1.073172, 2.347149, 1, 1, 1, 1, 1,
0.9788111, -0.6046595, 1.156099, 1, 1, 1, 1, 1,
0.9799398, 0.2384295, 3.28076, 1, 1, 1, 1, 1,
0.9883809, 0.4664349, 0.2691507, 1, 1, 1, 1, 1,
0.9901375, -0.1568346, 2.99018, 1, 1, 1, 1, 1,
0.9970384, -0.4412288, 1.190709, 1, 1, 1, 1, 1,
0.9998091, -1.120148, 5.383861, 0, 0, 1, 1, 1,
1.000685, -1.724992, 2.83278, 1, 0, 0, 1, 1,
1.014008, 0.05360234, 2.431479, 1, 0, 0, 1, 1,
1.022818, 0.5077665, -0.9571816, 1, 0, 0, 1, 1,
1.024641, -0.293596, 4.36503, 1, 0, 0, 1, 1,
1.028044, 1.015706, -0.5906158, 1, 0, 0, 1, 1,
1.029376, 0.7065305, 1.029515, 0, 0, 0, 1, 1,
1.034288, -0.8783516, 2.542745, 0, 0, 0, 1, 1,
1.045226, -0.2184549, 4.057326, 0, 0, 0, 1, 1,
1.049841, -1.021883, 1.671443, 0, 0, 0, 1, 1,
1.052964, 1.860821, 0.4906034, 0, 0, 0, 1, 1,
1.064911, 0.1434619, 1.787675, 0, 0, 0, 1, 1,
1.069518, 0.1083816, 1.835319, 0, 0, 0, 1, 1,
1.072036, -0.980938, 3.132073, 1, 1, 1, 1, 1,
1.072065, 0.4380829, 2.221266, 1, 1, 1, 1, 1,
1.072488, 0.263665, 3.433891, 1, 1, 1, 1, 1,
1.072634, 1.532151, 1.312469, 1, 1, 1, 1, 1,
1.079657, -0.1000435, 1.212765, 1, 1, 1, 1, 1,
1.079693, -1.027451, 2.822559, 1, 1, 1, 1, 1,
1.089671, 1.071167, 0.506868, 1, 1, 1, 1, 1,
1.092461, -1.371706, 1.587169, 1, 1, 1, 1, 1,
1.096154, -2.901453, 3.2372, 1, 1, 1, 1, 1,
1.099069, -1.240134, 3.741114, 1, 1, 1, 1, 1,
1.100199, -0.5170408, 1.259018, 1, 1, 1, 1, 1,
1.10229, 0.9206657, 0.488667, 1, 1, 1, 1, 1,
1.11892, -0.62135, 0.6189819, 1, 1, 1, 1, 1,
1.119807, -0.3584613, 2.157734, 1, 1, 1, 1, 1,
1.126154, -0.6242616, 2.38902, 1, 1, 1, 1, 1,
1.127368, 0.1225482, 3.244416, 0, 0, 1, 1, 1,
1.132706, 0.2580221, 1.708906, 1, 0, 0, 1, 1,
1.132992, -0.8606306, 2.406116, 1, 0, 0, 1, 1,
1.144643, 0.3675071, 2.478847, 1, 0, 0, 1, 1,
1.15061, 1.042044, 2.204829, 1, 0, 0, 1, 1,
1.165616, -0.002061974, 0.8728297, 1, 0, 0, 1, 1,
1.176547, 1.681841, 0.2991993, 0, 0, 0, 1, 1,
1.177082, -0.6215042, 1.0581, 0, 0, 0, 1, 1,
1.181143, 1.000792, 2.695258, 0, 0, 0, 1, 1,
1.185331, 1.563161, 0.064564, 0, 0, 0, 1, 1,
1.185719, 0.4553669, 1.736843, 0, 0, 0, 1, 1,
1.1859, 0.09278473, 2.060436, 0, 0, 0, 1, 1,
1.196227, -1.464847, 3.195574, 0, 0, 0, 1, 1,
1.216846, -2.271684, 1.643245, 1, 1, 1, 1, 1,
1.219055, -0.5511306, 1.437863, 1, 1, 1, 1, 1,
1.224389, 0.2271909, 0.3622805, 1, 1, 1, 1, 1,
1.238299, 0.7609769, 0.8641292, 1, 1, 1, 1, 1,
1.239766, -1.472194, 1.483975, 1, 1, 1, 1, 1,
1.252115, -0.8135187, 2.999673, 1, 1, 1, 1, 1,
1.253803, 2.479402, 1.212572, 1, 1, 1, 1, 1,
1.256587, 0.9441288, 0.1448447, 1, 1, 1, 1, 1,
1.258366, 1.051219, 1.192496, 1, 1, 1, 1, 1,
1.260531, 1.931704, -0.1577307, 1, 1, 1, 1, 1,
1.260956, 0.5788517, 1.698488, 1, 1, 1, 1, 1,
1.264191, 0.9144667, 2.490573, 1, 1, 1, 1, 1,
1.285331, 2.162284, 1.534436, 1, 1, 1, 1, 1,
1.305268, -0.5115612, 4.395331, 1, 1, 1, 1, 1,
1.312341, 0.1684935, 1.712013, 1, 1, 1, 1, 1,
1.312565, 0.0782738, 1.512734, 0, 0, 1, 1, 1,
1.316732, -1.009415, 2.824225, 1, 0, 0, 1, 1,
1.321643, -0.4698881, 1.563501, 1, 0, 0, 1, 1,
1.325005, -1.47381, 2.697397, 1, 0, 0, 1, 1,
1.328662, -0.4315887, 2.021526, 1, 0, 0, 1, 1,
1.33711, -1.120088, 2.054226, 1, 0, 0, 1, 1,
1.339983, -1.176328, 1.388531, 0, 0, 0, 1, 1,
1.343624, -1.449591, 2.483435, 0, 0, 0, 1, 1,
1.344786, 0.8546576, 0.9291454, 0, 0, 0, 1, 1,
1.349956, 1.317909, 0.4729234, 0, 0, 0, 1, 1,
1.350421, -0.4209451, -0.5749725, 0, 0, 0, 1, 1,
1.356833, 2.172346, 1.373926, 0, 0, 0, 1, 1,
1.360846, 0.8423778, 0.5347744, 0, 0, 0, 1, 1,
1.386347, -0.3397781, 2.335995, 1, 1, 1, 1, 1,
1.38887, 0.9713533, 0.2763108, 1, 1, 1, 1, 1,
1.399247, -1.963378, 2.563162, 1, 1, 1, 1, 1,
1.411133, 0.8142759, 0.2879882, 1, 1, 1, 1, 1,
1.413207, -0.5004281, 1.630973, 1, 1, 1, 1, 1,
1.415402, -0.7621257, 1.035729, 1, 1, 1, 1, 1,
1.419864, 0.7697851, 1.214084, 1, 1, 1, 1, 1,
1.424502, -1.678098, 3.334668, 1, 1, 1, 1, 1,
1.426653, 1.594798, 0.1917149, 1, 1, 1, 1, 1,
1.427442, 0.9145126, 1.860519, 1, 1, 1, 1, 1,
1.431646, 1.374037, 0.1872236, 1, 1, 1, 1, 1,
1.445038, -0.4197232, 3.667457, 1, 1, 1, 1, 1,
1.45122, 0.4916939, 1.62742, 1, 1, 1, 1, 1,
1.463871, 1.608176, 0.9240944, 1, 1, 1, 1, 1,
1.464849, 0.2106003, 0.938227, 1, 1, 1, 1, 1,
1.473707, 0.9600013, 1.275716, 0, 0, 1, 1, 1,
1.474237, 0.7407756, 4.021907, 1, 0, 0, 1, 1,
1.475609, -0.6277255, 1.147309, 1, 0, 0, 1, 1,
1.480981, 0.8192105, -1.207779, 1, 0, 0, 1, 1,
1.495412, 1.388916, 1.302938, 1, 0, 0, 1, 1,
1.496357, 0.1763937, 2.120362, 1, 0, 0, 1, 1,
1.501849, 0.766363, 0.5245721, 0, 0, 0, 1, 1,
1.521273, 1.248088, 0.002456655, 0, 0, 0, 1, 1,
1.536453, -0.9056582, 3.559349, 0, 0, 0, 1, 1,
1.541769, 0.1495496, 1.465104, 0, 0, 0, 1, 1,
1.544431, -0.5891792, 2.274507, 0, 0, 0, 1, 1,
1.561377, 0.8385752, 0.2275567, 0, 0, 0, 1, 1,
1.568641, 0.08459351, 0.9401826, 0, 0, 0, 1, 1,
1.568843, 0.3710247, 1.34078, 1, 1, 1, 1, 1,
1.570951, -1.677027, 1.835642, 1, 1, 1, 1, 1,
1.578467, 0.8172391, 1.511326, 1, 1, 1, 1, 1,
1.59283, 0.2627457, 3.635014, 1, 1, 1, 1, 1,
1.595202, 1.002908, -0.2758203, 1, 1, 1, 1, 1,
1.607218, 0.9877666, 3.225287, 1, 1, 1, 1, 1,
1.609667, -0.7528154, 2.89765, 1, 1, 1, 1, 1,
1.625766, -0.688745, 0.8667387, 1, 1, 1, 1, 1,
1.646165, 1.814727, 1.856004, 1, 1, 1, 1, 1,
1.653384, 0.06594209, 0.3600122, 1, 1, 1, 1, 1,
1.66103, -0.5052937, 2.137687, 1, 1, 1, 1, 1,
1.66388, -0.3020375, 0.2487471, 1, 1, 1, 1, 1,
1.676777, -0.2691075, 3.032725, 1, 1, 1, 1, 1,
1.685786, 0.9375183, 2.17415, 1, 1, 1, 1, 1,
1.691269, 0.6067904, 2.472459, 1, 1, 1, 1, 1,
1.701985, 1.094823, 0.3380555, 0, 0, 1, 1, 1,
1.709553, -2.123912, 2.447296, 1, 0, 0, 1, 1,
1.713295, -0.6906613, 2.849523, 1, 0, 0, 1, 1,
1.738782, 0.7362489, 1.62273, 1, 0, 0, 1, 1,
1.739719, -0.3338295, 1.153161, 1, 0, 0, 1, 1,
1.742262, 0.7685771, 1.515299, 1, 0, 0, 1, 1,
1.761393, 1.12475, 2.505557, 0, 0, 0, 1, 1,
1.761815, -0.5464637, 1.71844, 0, 0, 0, 1, 1,
1.819449, -0.2015413, 0.6460061, 0, 0, 0, 1, 1,
1.819749, -1.137743, 4.3113, 0, 0, 0, 1, 1,
1.820801, 2.139219, 1.20254, 0, 0, 0, 1, 1,
1.837408, -0.6716782, 0.7971922, 0, 0, 0, 1, 1,
1.838493, 0.2887876, 1.976014, 0, 0, 0, 1, 1,
1.848474, -0.8916295, 0.7367046, 1, 1, 1, 1, 1,
1.853353, -1.389662, 1.541049, 1, 1, 1, 1, 1,
1.85614, -1.558468, 1.686859, 1, 1, 1, 1, 1,
1.879814, -0.9375443, 1.752958, 1, 1, 1, 1, 1,
1.881868, 0.1502562, 2.641099, 1, 1, 1, 1, 1,
1.88536, 0.1818859, 2.842527, 1, 1, 1, 1, 1,
1.892649, -0.853968, 0.4803708, 1, 1, 1, 1, 1,
1.912468, 0.4330818, 2.163669, 1, 1, 1, 1, 1,
1.915082, -0.5064267, 2.255535, 1, 1, 1, 1, 1,
1.937528, 0.4824764, -0.1300814, 1, 1, 1, 1, 1,
1.941068, -0.7023428, 3.982427, 1, 1, 1, 1, 1,
1.942211, -1.020535, 2.863834, 1, 1, 1, 1, 1,
1.974661, -3.094533, 3.069337, 1, 1, 1, 1, 1,
1.980467, 0.3700773, 1.67557, 1, 1, 1, 1, 1,
1.992404, -1.70904, 3.7111, 1, 1, 1, 1, 1,
1.995009, -0.8161622, 1.38719, 0, 0, 1, 1, 1,
2.058949, -1.052326, 3.322212, 1, 0, 0, 1, 1,
2.061829, -1.27794, 1.063466, 1, 0, 0, 1, 1,
2.075482, 0.4531309, 3.448797, 1, 0, 0, 1, 1,
2.081024, 0.1826697, 2.470062, 1, 0, 0, 1, 1,
2.090481, -0.5680812, 0.7631654, 1, 0, 0, 1, 1,
2.110371, 0.1246282, 2.347579, 0, 0, 0, 1, 1,
2.194096, 0.5662137, 2.201605, 0, 0, 0, 1, 1,
2.231449, 0.19407, 2.044593, 0, 0, 0, 1, 1,
2.274244, -0.2285218, 1.124346, 0, 0, 0, 1, 1,
2.354655, 0.03465165, 2.255861, 0, 0, 0, 1, 1,
2.481188, 0.1889929, 0.7982336, 0, 0, 0, 1, 1,
2.481358, -0.7751161, 2.134978, 0, 0, 0, 1, 1,
2.526579, -0.3802626, 0.8114998, 1, 1, 1, 1, 1,
2.585214, 0.6412796, 1.935643, 1, 1, 1, 1, 1,
2.624712, 0.5106739, 1.017433, 1, 1, 1, 1, 1,
2.693212, 0.1738757, 2.144925, 1, 1, 1, 1, 1,
2.770254, 0.3395277, 1.988485, 1, 1, 1, 1, 1,
3.07176, 0.1953935, 1.274188, 1, 1, 1, 1, 1,
3.312008, 0.3533427, 0.3893007, 1, 1, 1, 1, 1
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
var radius = 9.576637;
var distance = 33.63753;
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
mvMatrix.translate( 0.08830285, -0.0157423, -0.2415433 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.63753);
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
