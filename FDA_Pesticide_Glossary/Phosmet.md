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
-3.009927, 1.97889, -1.581191, 1, 0, 0, 1,
-2.771513, 2.01109, -0.08846714, 1, 0.007843138, 0, 1,
-2.715508, -1.178816, -3.457655, 1, 0.01176471, 0, 1,
-2.627706, 0.4159375, -1.716325, 1, 0.01960784, 0, 1,
-2.593563, 0.2482046, -1.582774, 1, 0.02352941, 0, 1,
-2.527424, -0.10126, -0.8322893, 1, 0.03137255, 0, 1,
-2.506521, 0.1267462, -1.357451, 1, 0.03529412, 0, 1,
-2.490334, 1.515886, -2.626594, 1, 0.04313726, 0, 1,
-2.430565, 0.5347844, -0.7248249, 1, 0.04705882, 0, 1,
-2.407394, 0.6219358, -2.207908, 1, 0.05490196, 0, 1,
-2.311126, -0.2158293, -3.462695, 1, 0.05882353, 0, 1,
-2.307722, 0.06008219, -2.094383, 1, 0.06666667, 0, 1,
-2.239704, -0.1705621, -0.9647961, 1, 0.07058824, 0, 1,
-2.235894, -1.383497, -0.07452179, 1, 0.07843138, 0, 1,
-2.235365, -0.3144046, 0.03706131, 1, 0.08235294, 0, 1,
-2.212412, -0.7953712, 0.1912014, 1, 0.09019608, 0, 1,
-2.192634, 0.08192527, -2.066553, 1, 0.09411765, 0, 1,
-2.132647, 1.793384, -0.5664604, 1, 0.1019608, 0, 1,
-2.130871, 1.424538, -1.412314, 1, 0.1098039, 0, 1,
-2.125812, 0.8759582, 0.5279682, 1, 0.1137255, 0, 1,
-2.11388, -0.3576313, -1.266359, 1, 0.1215686, 0, 1,
-2.100522, 0.8822302, -2.111016, 1, 0.1254902, 0, 1,
-2.064699, 0.3994681, -1.969613, 1, 0.1333333, 0, 1,
-2.048212, 0.08211559, -1.894479, 1, 0.1372549, 0, 1,
-2.013456, -0.04778675, -2.14091, 1, 0.145098, 0, 1,
-2.011248, 0.05864279, -1.302523, 1, 0.1490196, 0, 1,
-2.00428, 0.8026662, -1.269524, 1, 0.1568628, 0, 1,
-1.989553, -1.468316, -2.32684, 1, 0.1607843, 0, 1,
-1.965744, 0.08631554, -3.23572, 1, 0.1686275, 0, 1,
-1.957201, 0.2197286, -0.9485261, 1, 0.172549, 0, 1,
-1.936301, 0.414729, -1.818617, 1, 0.1803922, 0, 1,
-1.931723, -0.2335335, -2.239615, 1, 0.1843137, 0, 1,
-1.915143, -0.8169295, -2.678118, 1, 0.1921569, 0, 1,
-1.915092, 1.143861, -1.898002, 1, 0.1960784, 0, 1,
-1.840576, 0.2241858, -1.153491, 1, 0.2039216, 0, 1,
-1.811174, -1.761514, -2.500546, 1, 0.2117647, 0, 1,
-1.799345, 0.03632237, -2.396036, 1, 0.2156863, 0, 1,
-1.797031, -0.4993322, -1.756487, 1, 0.2235294, 0, 1,
-1.793686, -0.6340966, -1.132113, 1, 0.227451, 0, 1,
-1.787038, 0.7524447, -0.604014, 1, 0.2352941, 0, 1,
-1.781688, -0.4574824, -0.7286482, 1, 0.2392157, 0, 1,
-1.780038, 0.08584445, -1.546343, 1, 0.2470588, 0, 1,
-1.770415, 0.4311388, -2.658082, 1, 0.2509804, 0, 1,
-1.766322, 0.2661022, -1.388293, 1, 0.2588235, 0, 1,
-1.759486, -0.5445938, -1.73614, 1, 0.2627451, 0, 1,
-1.732868, 1.126506, -1.633708, 1, 0.2705882, 0, 1,
-1.723705, 0.4265815, -1.623509, 1, 0.2745098, 0, 1,
-1.709689, -0.02844987, -0.8444576, 1, 0.282353, 0, 1,
-1.702612, 0.4392223, -1.356575, 1, 0.2862745, 0, 1,
-1.699678, 0.09142776, -2.126584, 1, 0.2941177, 0, 1,
-1.688245, -1.134639, -2.63436, 1, 0.3019608, 0, 1,
-1.658708, -0.9045886, -3.615571, 1, 0.3058824, 0, 1,
-1.649857, -0.6834177, -0.2183311, 1, 0.3137255, 0, 1,
-1.636623, 0.30123, -0.7353678, 1, 0.3176471, 0, 1,
-1.633181, -0.9146989, -1.375496, 1, 0.3254902, 0, 1,
-1.618332, 0.5992059, -2.794618, 1, 0.3294118, 0, 1,
-1.516227, -0.650699, -2.182814, 1, 0.3372549, 0, 1,
-1.493507, 0.4388407, 0.09279713, 1, 0.3411765, 0, 1,
-1.485575, -0.8204576, -1.315999, 1, 0.3490196, 0, 1,
-1.470162, 2.11792, -1.432459, 1, 0.3529412, 0, 1,
-1.45498, -0.09308212, -0.724686, 1, 0.3607843, 0, 1,
-1.453372, 0.9123152, -0.3254102, 1, 0.3647059, 0, 1,
-1.452841, 0.4973329, -1.29581, 1, 0.372549, 0, 1,
-1.447473, 1.26147, 0.7391188, 1, 0.3764706, 0, 1,
-1.445518, 1.046319, -0.5974311, 1, 0.3843137, 0, 1,
-1.437105, 0.3013322, -1.840992, 1, 0.3882353, 0, 1,
-1.43166, 1.63529, -1.33614, 1, 0.3960784, 0, 1,
-1.428213, 1.164009, -2.230245, 1, 0.4039216, 0, 1,
-1.425875, 0.6569591, -1.11329, 1, 0.4078431, 0, 1,
-1.403714, -1.169835, -4.536422, 1, 0.4156863, 0, 1,
-1.39307, -1.053975, -2.827204, 1, 0.4196078, 0, 1,
-1.39149, 1.427308, -0.2580769, 1, 0.427451, 0, 1,
-1.387031, 0.543772, -1.65803, 1, 0.4313726, 0, 1,
-1.374243, 0.1126217, -1.170326, 1, 0.4392157, 0, 1,
-1.372942, 1.337582, -1.884111, 1, 0.4431373, 0, 1,
-1.36653, 1.856877, -1.253393, 1, 0.4509804, 0, 1,
-1.356251, 1.150862, -1.701069, 1, 0.454902, 0, 1,
-1.348962, -1.596911, -4.922196, 1, 0.4627451, 0, 1,
-1.339252, 0.8527328, -2.454327, 1, 0.4666667, 0, 1,
-1.331457, 0.4695591, -1.228063, 1, 0.4745098, 0, 1,
-1.32956, 0.02389403, -2.229459, 1, 0.4784314, 0, 1,
-1.323079, 0.6916516, -0.1035391, 1, 0.4862745, 0, 1,
-1.314471, -0.8288423, -1.825677, 1, 0.4901961, 0, 1,
-1.311122, -0.9981163, -2.741622, 1, 0.4980392, 0, 1,
-1.305306, -0.2499448, -1.362478, 1, 0.5058824, 0, 1,
-1.282749, 1.493191, 0.9879214, 1, 0.509804, 0, 1,
-1.277129, 1.91979, -0.7925703, 1, 0.5176471, 0, 1,
-1.274008, 0.5232862, -2.93663, 1, 0.5215687, 0, 1,
-1.268668, 0.9236125, -1.329522, 1, 0.5294118, 0, 1,
-1.267584, -0.3332298, -2.42191, 1, 0.5333334, 0, 1,
-1.267107, -1.399564, -1.780544, 1, 0.5411765, 0, 1,
-1.265705, 0.2310113, -1.559278, 1, 0.5450981, 0, 1,
-1.253292, 0.5008199, 0.1613159, 1, 0.5529412, 0, 1,
-1.252673, -0.2099694, -1.941815, 1, 0.5568628, 0, 1,
-1.251628, -0.01660708, -1.600657, 1, 0.5647059, 0, 1,
-1.251367, 1.275695, -2.075333, 1, 0.5686275, 0, 1,
-1.2509, 1.063739, 0.2556396, 1, 0.5764706, 0, 1,
-1.248696, -0.7772041, -2.256733, 1, 0.5803922, 0, 1,
-1.247049, -1.046322, -0.9379177, 1, 0.5882353, 0, 1,
-1.240675, -1.395075, -2.342827, 1, 0.5921569, 0, 1,
-1.237003, 2.331424, 1.625697, 1, 0.6, 0, 1,
-1.224072, 0.6090392, -0.005394808, 1, 0.6078432, 0, 1,
-1.216304, -1.60983, -2.20681, 1, 0.6117647, 0, 1,
-1.212523, 0.4015894, -0.8596751, 1, 0.6196079, 0, 1,
-1.210703, 0.4892255, -0.7789587, 1, 0.6235294, 0, 1,
-1.197599, 0.500904, -2.307648, 1, 0.6313726, 0, 1,
-1.195205, -0.9832221, -2.460673, 1, 0.6352941, 0, 1,
-1.189585, 0.4607522, -1.261112, 1, 0.6431373, 0, 1,
-1.18583, -0.2462302, -2.755801, 1, 0.6470588, 0, 1,
-1.185518, 1.585286, -0.4393868, 1, 0.654902, 0, 1,
-1.184796, -0.1227475, -0.3844625, 1, 0.6588235, 0, 1,
-1.18471, 0.7631433, -2.889759, 1, 0.6666667, 0, 1,
-1.182518, 0.1848802, -1.517897, 1, 0.6705883, 0, 1,
-1.169776, 0.5310187, -2.040274, 1, 0.6784314, 0, 1,
-1.154161, 1.660815, -1.033964, 1, 0.682353, 0, 1,
-1.140274, -0.3791472, -1.472566, 1, 0.6901961, 0, 1,
-1.134898, 2.477268, -0.1685226, 1, 0.6941177, 0, 1,
-1.126503, -0.01209517, 0.6897764, 1, 0.7019608, 0, 1,
-1.117923, -0.8097499, 0.2052336, 1, 0.7098039, 0, 1,
-1.112984, 0.5199792, -1.332432, 1, 0.7137255, 0, 1,
-1.112387, -0.7637128, -3.455792, 1, 0.7215686, 0, 1,
-1.098261, 3.651451e-05, -0.1927366, 1, 0.7254902, 0, 1,
-1.086168, -0.2304167, -0.9092808, 1, 0.7333333, 0, 1,
-1.083035, -1.194669, -2.719383, 1, 0.7372549, 0, 1,
-1.077115, 0.7272226, -0.8689007, 1, 0.7450981, 0, 1,
-1.076471, -0.4991665, -1.88444, 1, 0.7490196, 0, 1,
-1.071905, 0.4360487, -2.238271, 1, 0.7568628, 0, 1,
-1.06828, 1.293212, -1.618549, 1, 0.7607843, 0, 1,
-1.06791, -0.09707048, -1.62758, 1, 0.7686275, 0, 1,
-1.06085, 1.187833, 0.6068621, 1, 0.772549, 0, 1,
-1.054483, -1.497275, -2.719333, 1, 0.7803922, 0, 1,
-1.053784, -0.9119939, -2.627121, 1, 0.7843137, 0, 1,
-1.046992, 1.315697, -1.302832, 1, 0.7921569, 0, 1,
-1.040038, 0.9165828, 1.346402, 1, 0.7960784, 0, 1,
-1.036218, 0.07767445, -0.8070961, 1, 0.8039216, 0, 1,
-1.034104, 0.06844343, -2.204478, 1, 0.8117647, 0, 1,
-1.029221, 0.3874402, -2.043725, 1, 0.8156863, 0, 1,
-1.027502, 0.2944005, -0.7445304, 1, 0.8235294, 0, 1,
-1.023719, -0.9645236, -2.211779, 1, 0.827451, 0, 1,
-1.019667, 0.622445, -1.904881, 1, 0.8352941, 0, 1,
-1.017437, 0.7863983, -0.4054982, 1, 0.8392157, 0, 1,
-1.009548, 0.6102741, -0.6686046, 1, 0.8470588, 0, 1,
-1.006848, -0.9902925, -2.285126, 1, 0.8509804, 0, 1,
-1.004231, 0.07344092, -0.4776194, 1, 0.8588235, 0, 1,
-1.00357, -0.8463121, -1.93348, 1, 0.8627451, 0, 1,
-1.00168, 0.3926315, -0.7410774, 1, 0.8705882, 0, 1,
-1.000541, 0.578432, -0.2997852, 1, 0.8745098, 0, 1,
-0.9995951, -0.6216329, -1.407216, 1, 0.8823529, 0, 1,
-0.9902361, 0.5960471, -0.9098028, 1, 0.8862745, 0, 1,
-0.9868373, 0.5438546, -0.124177, 1, 0.8941177, 0, 1,
-0.9836143, -1.137506, -1.77289, 1, 0.8980392, 0, 1,
-0.980715, 0.726459, -0.7446546, 1, 0.9058824, 0, 1,
-0.9761709, 1.615425, 0.2425717, 1, 0.9137255, 0, 1,
-0.9748503, -0.2192722, -2.402766, 1, 0.9176471, 0, 1,
-0.973749, -0.2187625, -1.291671, 1, 0.9254902, 0, 1,
-0.9737247, -2.577462, -1.998922, 1, 0.9294118, 0, 1,
-0.9733324, -0.2735633, -1.376067, 1, 0.9372549, 0, 1,
-0.9670597, -0.634498, -1.028064, 1, 0.9411765, 0, 1,
-0.9655992, 0.447709, -0.6959731, 1, 0.9490196, 0, 1,
-0.9655606, -1.616716, -2.153663, 1, 0.9529412, 0, 1,
-0.9604909, 0.1147562, -2.314615, 1, 0.9607843, 0, 1,
-0.958267, 0.2589048, -0.6061162, 1, 0.9647059, 0, 1,
-0.9559208, 0.2649444, -1.684708, 1, 0.972549, 0, 1,
-0.9553519, -0.3713305, -3.490292, 1, 0.9764706, 0, 1,
-0.9536263, 0.6889807, -0.3275566, 1, 0.9843137, 0, 1,
-0.9505233, 1.307082, -0.3649622, 1, 0.9882353, 0, 1,
-0.9487205, 0.7902752, -0.9469255, 1, 0.9960784, 0, 1,
-0.9457439, 0.1567931, -1.683606, 0.9960784, 1, 0, 1,
-0.9346958, -0.7441455, -1.723806, 0.9921569, 1, 0, 1,
-0.9322501, -1.353492, -2.865483, 0.9843137, 1, 0, 1,
-0.9303085, 0.3484744, -1.170894, 0.9803922, 1, 0, 1,
-0.9299048, -1.551259, -1.377185, 0.972549, 1, 0, 1,
-0.9249274, -1.658341, -2.791484, 0.9686275, 1, 0, 1,
-0.9191924, -0.1904116, -2.160045, 0.9607843, 1, 0, 1,
-0.9143625, 0.1236601, -2.070008, 0.9568627, 1, 0, 1,
-0.9123934, -0.5348833, -2.495489, 0.9490196, 1, 0, 1,
-0.9077791, 1.029735, -1.756534, 0.945098, 1, 0, 1,
-0.9002149, -1.003628, -2.027073, 0.9372549, 1, 0, 1,
-0.8952619, -0.9591041, -3.652714, 0.9333333, 1, 0, 1,
-0.8937809, 0.2200787, -2.791274, 0.9254902, 1, 0, 1,
-0.8874027, 0.1368041, -2.07573, 0.9215686, 1, 0, 1,
-0.8851569, -0.2324423, -0.987239, 0.9137255, 1, 0, 1,
-0.8826658, -1.192315, -3.720819, 0.9098039, 1, 0, 1,
-0.8719263, 1.272984, 1.810386, 0.9019608, 1, 0, 1,
-0.8686445, 0.4326447, -1.944684, 0.8941177, 1, 0, 1,
-0.8622729, 0.2770303, -2.833971, 0.8901961, 1, 0, 1,
-0.8612994, -0.686596, -2.344365, 0.8823529, 1, 0, 1,
-0.8587213, 0.01385578, -1.377246, 0.8784314, 1, 0, 1,
-0.8533087, -0.5805869, -1.887557, 0.8705882, 1, 0, 1,
-0.8531177, 0.4900626, 0.3137579, 0.8666667, 1, 0, 1,
-0.8512652, 0.1209577, -0.599314, 0.8588235, 1, 0, 1,
-0.8457129, -0.5221406, -3.533183, 0.854902, 1, 0, 1,
-0.8451314, -0.2427148, -0.3202572, 0.8470588, 1, 0, 1,
-0.8435919, -0.7379807, -0.3607914, 0.8431373, 1, 0, 1,
-0.8360441, -0.4674682, -1.296843, 0.8352941, 1, 0, 1,
-0.8356892, 0.01073878, -2.265564, 0.8313726, 1, 0, 1,
-0.824421, 0.07361335, -0.3272594, 0.8235294, 1, 0, 1,
-0.8155952, -0.3558082, -2.034353, 0.8196079, 1, 0, 1,
-0.8074931, -0.01845178, -0.6284598, 0.8117647, 1, 0, 1,
-0.8057284, -1.086637, -3.412596, 0.8078431, 1, 0, 1,
-0.8017691, -0.4215145, -1.978693, 0.8, 1, 0, 1,
-0.7998393, 0.1201414, -1.509949, 0.7921569, 1, 0, 1,
-0.7992573, 0.8217587, 0.06707446, 0.7882353, 1, 0, 1,
-0.7991654, 2.590072, -0.1568627, 0.7803922, 1, 0, 1,
-0.7926981, -0.09907477, -1.836624, 0.7764706, 1, 0, 1,
-0.7912612, 0.8778508, 0.2807542, 0.7686275, 1, 0, 1,
-0.7897554, 0.359054, -0.6003494, 0.7647059, 1, 0, 1,
-0.7896332, -0.2425389, -4.34012, 0.7568628, 1, 0, 1,
-0.787388, -0.9652967, -2.991154, 0.7529412, 1, 0, 1,
-0.7838335, -0.2082314, -1.538144, 0.7450981, 1, 0, 1,
-0.7788478, 0.3896242, -1.32371, 0.7411765, 1, 0, 1,
-0.7780505, -0.4004139, -1.19388, 0.7333333, 1, 0, 1,
-0.7773721, 2.842784, -0.6353409, 0.7294118, 1, 0, 1,
-0.7757856, -1.032551, -2.642253, 0.7215686, 1, 0, 1,
-0.7734804, 1.712673, -0.1686361, 0.7176471, 1, 0, 1,
-0.7589027, 1.452676, -1.313663, 0.7098039, 1, 0, 1,
-0.756707, 0.4368846, -1.258234, 0.7058824, 1, 0, 1,
-0.7515995, -0.3417273, -2.008976, 0.6980392, 1, 0, 1,
-0.7420892, -1.636504, -2.940473, 0.6901961, 1, 0, 1,
-0.7336155, -0.3040815, -1.143705, 0.6862745, 1, 0, 1,
-0.7231308, 0.4197339, 0.4001152, 0.6784314, 1, 0, 1,
-0.7214007, 0.1494038, -2.621463, 0.6745098, 1, 0, 1,
-0.7168424, 1.098288, -1.704674, 0.6666667, 1, 0, 1,
-0.7138106, 0.8317333, 0.6487845, 0.6627451, 1, 0, 1,
-0.7100762, 0.7819249, -0.9596218, 0.654902, 1, 0, 1,
-0.7100371, 2.06622, -0.4236951, 0.6509804, 1, 0, 1,
-0.7087262, -0.6041912, -2.607698, 0.6431373, 1, 0, 1,
-0.7013947, 1.56739, -1.820706, 0.6392157, 1, 0, 1,
-0.6953724, 0.2411362, -1.3605, 0.6313726, 1, 0, 1,
-0.6906883, -0.3796673, -0.9725419, 0.627451, 1, 0, 1,
-0.6901286, 0.1567719, -0.6886733, 0.6196079, 1, 0, 1,
-0.6840436, -0.05787695, -1.344259, 0.6156863, 1, 0, 1,
-0.678676, -0.2746504, -1.28229, 0.6078432, 1, 0, 1,
-0.6755983, 0.3765505, -1.561432, 0.6039216, 1, 0, 1,
-0.6659982, -0.07814395, -1.502337, 0.5960785, 1, 0, 1,
-0.6644179, 1.99221, 0.004793254, 0.5882353, 1, 0, 1,
-0.6568806, -0.9932162, -1.548412, 0.5843138, 1, 0, 1,
-0.6532593, -1.41036, -5.010826, 0.5764706, 1, 0, 1,
-0.6458278, 1.20888, -0.3645934, 0.572549, 1, 0, 1,
-0.637915, 0.1675363, -2.328836, 0.5647059, 1, 0, 1,
-0.63205, -1.632772, -1.667561, 0.5607843, 1, 0, 1,
-0.6307628, 0.5380777, -1.280887, 0.5529412, 1, 0, 1,
-0.6234902, -0.7066095, -1.555953, 0.5490196, 1, 0, 1,
-0.6085101, -0.2315625, -1.463551, 0.5411765, 1, 0, 1,
-0.6017919, -0.481487, -2.729156, 0.5372549, 1, 0, 1,
-0.6005866, 0.8543069, -2.167461, 0.5294118, 1, 0, 1,
-0.595791, 0.2206745, -1.194051, 0.5254902, 1, 0, 1,
-0.5954691, 0.09066394, -0.1176314, 0.5176471, 1, 0, 1,
-0.5952226, 1.83386, 0.1874735, 0.5137255, 1, 0, 1,
-0.5951771, 0.5203593, -0.4300697, 0.5058824, 1, 0, 1,
-0.5933281, -0.8334852, -2.76727, 0.5019608, 1, 0, 1,
-0.5914537, 0.2183721, -1.916284, 0.4941176, 1, 0, 1,
-0.5911818, -1.180966, -1.485666, 0.4862745, 1, 0, 1,
-0.5897862, -0.2042891, -1.629761, 0.4823529, 1, 0, 1,
-0.5867934, 0.2660053, 1.068715, 0.4745098, 1, 0, 1,
-0.5860612, -0.7388047, -2.023519, 0.4705882, 1, 0, 1,
-0.5764213, -1.438351, -2.307421, 0.4627451, 1, 0, 1,
-0.5731317, 0.7664145, -1.854145, 0.4588235, 1, 0, 1,
-0.5721849, -1.18591, -3.22461, 0.4509804, 1, 0, 1,
-0.5718918, -0.059154, -2.304945, 0.4470588, 1, 0, 1,
-0.5694025, -2.028264, -2.509444, 0.4392157, 1, 0, 1,
-0.5675973, 0.4562477, -1.724596, 0.4352941, 1, 0, 1,
-0.5671132, -0.09577629, -2.199164, 0.427451, 1, 0, 1,
-0.564727, 0.09045263, -2.145288, 0.4235294, 1, 0, 1,
-0.5623887, -1.2387, -3.495477, 0.4156863, 1, 0, 1,
-0.5590043, -0.5220048, -3.765303, 0.4117647, 1, 0, 1,
-0.5513316, 0.5733364, 0.3594317, 0.4039216, 1, 0, 1,
-0.550883, 2.480935, -1.26701, 0.3960784, 1, 0, 1,
-0.5499133, -1.628827, -2.232325, 0.3921569, 1, 0, 1,
-0.5484089, -0.205583, -3.266575, 0.3843137, 1, 0, 1,
-0.5410116, -0.7093748, -2.874896, 0.3803922, 1, 0, 1,
-0.5365061, -0.9090712, -0.590977, 0.372549, 1, 0, 1,
-0.5315254, 1.306542, -0.7000644, 0.3686275, 1, 0, 1,
-0.5289176, 0.3160708, -1.841549, 0.3607843, 1, 0, 1,
-0.52848, -0.03932824, -2.194468, 0.3568628, 1, 0, 1,
-0.5268258, 0.8172684, 2.053139, 0.3490196, 1, 0, 1,
-0.5259612, 0.6208196, -0.08774274, 0.345098, 1, 0, 1,
-0.5253949, 0.2148498, -3.032294, 0.3372549, 1, 0, 1,
-0.5250486, 0.2378777, -1.546682, 0.3333333, 1, 0, 1,
-0.5248831, -2.537221, -3.843798, 0.3254902, 1, 0, 1,
-0.5242682, 0.2147634, -1.159855, 0.3215686, 1, 0, 1,
-0.524147, -0.07198817, -0.4215827, 0.3137255, 1, 0, 1,
-0.5203309, 0.6247492, -0.4619822, 0.3098039, 1, 0, 1,
-0.5184286, 0.2908645, -2.037956, 0.3019608, 1, 0, 1,
-0.5172547, -0.1218162, -2.972582, 0.2941177, 1, 0, 1,
-0.5170117, -0.2087849, -0.6726578, 0.2901961, 1, 0, 1,
-0.5162429, -0.02075757, -1.25535, 0.282353, 1, 0, 1,
-0.5143862, 0.1899678, -0.5125049, 0.2784314, 1, 0, 1,
-0.5037826, -0.7887468, -3.058649, 0.2705882, 1, 0, 1,
-0.5017402, 0.6126785, 0.2644368, 0.2666667, 1, 0, 1,
-0.4990183, 0.7966439, -0.2067586, 0.2588235, 1, 0, 1,
-0.4989392, 0.1790911, -1.494951, 0.254902, 1, 0, 1,
-0.4981757, -0.0127966, -2.092154, 0.2470588, 1, 0, 1,
-0.49782, 1.208529, 0.3378793, 0.2431373, 1, 0, 1,
-0.4978154, 0.252465, -0.05390493, 0.2352941, 1, 0, 1,
-0.4938627, -0.2047802, -1.432936, 0.2313726, 1, 0, 1,
-0.4931133, 0.6413014, -0.864439, 0.2235294, 1, 0, 1,
-0.4854735, 0.9524122, -3.614801, 0.2196078, 1, 0, 1,
-0.4836148, 0.02377472, -1.094307, 0.2117647, 1, 0, 1,
-0.4816143, 1.903986, 0.01476585, 0.2078431, 1, 0, 1,
-0.4793639, -1.435163, -3.468219, 0.2, 1, 0, 1,
-0.4742924, -0.5011381, -1.129023, 0.1921569, 1, 0, 1,
-0.4722146, 0.6497913, -0.2505504, 0.1882353, 1, 0, 1,
-0.4693728, 0.4234625, -1.835342, 0.1803922, 1, 0, 1,
-0.4673067, -0.5565707, -1.96573, 0.1764706, 1, 0, 1,
-0.4636821, 0.004443381, -2.088261, 0.1686275, 1, 0, 1,
-0.4584232, 0.5358645, -1.31875, 0.1647059, 1, 0, 1,
-0.4579601, -1.97318, -1.903218, 0.1568628, 1, 0, 1,
-0.4554336, 0.2529413, -1.364891, 0.1529412, 1, 0, 1,
-0.4542186, 1.691603, 0.8206029, 0.145098, 1, 0, 1,
-0.453264, 0.1905533, -1.863757, 0.1411765, 1, 0, 1,
-0.450107, 0.451802, -0.2947193, 0.1333333, 1, 0, 1,
-0.4470144, 0.9170545, -1.669416, 0.1294118, 1, 0, 1,
-0.4469706, 0.2548105, -1.5575, 0.1215686, 1, 0, 1,
-0.4347769, 0.3226842, -1.512087, 0.1176471, 1, 0, 1,
-0.4313637, 0.1941088, -1.54665, 0.1098039, 1, 0, 1,
-0.4306035, 1.695993, -1.055615, 0.1058824, 1, 0, 1,
-0.4255497, 0.5633394, -1.086444, 0.09803922, 1, 0, 1,
-0.4179852, 0.0981674, -0.9714491, 0.09019608, 1, 0, 1,
-0.417906, 1.991247, -0.04390736, 0.08627451, 1, 0, 1,
-0.4170321, -2.265977, -3.439867, 0.07843138, 1, 0, 1,
-0.4086527, 2.351723, 0.09197225, 0.07450981, 1, 0, 1,
-0.403121, -0.07268775, -2.041731, 0.06666667, 1, 0, 1,
-0.3974938, -0.3102332, -4.096241, 0.0627451, 1, 0, 1,
-0.3965131, 1.621634, 0.7213073, 0.05490196, 1, 0, 1,
-0.392234, -1.570455, -2.876658, 0.05098039, 1, 0, 1,
-0.3906946, 0.7350416, 0.002525439, 0.04313726, 1, 0, 1,
-0.3881319, 0.8042225, -1.515355, 0.03921569, 1, 0, 1,
-0.3865506, -1.128042, -1.26885, 0.03137255, 1, 0, 1,
-0.385805, 0.7761725, -1.605877, 0.02745098, 1, 0, 1,
-0.3853579, 0.5149528, 0.006604059, 0.01960784, 1, 0, 1,
-0.3841099, 1.157224, -0.5762279, 0.01568628, 1, 0, 1,
-0.3660462, -0.6140269, -3.494327, 0.007843138, 1, 0, 1,
-0.3657582, -0.6091789, -2.472939, 0.003921569, 1, 0, 1,
-0.3633782, -0.4089218, -3.325965, 0, 1, 0.003921569, 1,
-0.3541769, -1.638638, -3.30306, 0, 1, 0.01176471, 1,
-0.3530878, -0.9909605, -1.708082, 0, 1, 0.01568628, 1,
-0.3520076, 0.5544398, 0.2481686, 0, 1, 0.02352941, 1,
-0.3489888, -0.7484283, -3.96912, 0, 1, 0.02745098, 1,
-0.34873, 1.263465, -0.70309, 0, 1, 0.03529412, 1,
-0.3413482, 1.034466, -0.7233921, 0, 1, 0.03921569, 1,
-0.3409602, 0.2786449, -1.337749, 0, 1, 0.04705882, 1,
-0.3340548, -2.177058, -1.826589, 0, 1, 0.05098039, 1,
-0.3338167, -0.6306399, -2.711865, 0, 1, 0.05882353, 1,
-0.3336163, 1.446054, -1.950338, 0, 1, 0.0627451, 1,
-0.3237086, 0.2198924, -3.670078, 0, 1, 0.07058824, 1,
-0.3211634, -0.1083466, -2.246206, 0, 1, 0.07450981, 1,
-0.3205383, 0.7807667, 0.04497286, 0, 1, 0.08235294, 1,
-0.3187981, 0.3230005, -1.074986, 0, 1, 0.08627451, 1,
-0.3161817, 0.03015129, -2.171926, 0, 1, 0.09411765, 1,
-0.3146307, -0.6372797, -2.201316, 0, 1, 0.1019608, 1,
-0.3105297, 0.874903, -0.5393695, 0, 1, 0.1058824, 1,
-0.3100704, -1.03336, -2.131189, 0, 1, 0.1137255, 1,
-0.3100106, 0.4379766, -0.3984229, 0, 1, 0.1176471, 1,
-0.3044753, 0.6481275, -1.372732, 0, 1, 0.1254902, 1,
-0.304031, -0.6512328, -2.002887, 0, 1, 0.1294118, 1,
-0.3033755, -0.07906126, -2.109977, 0, 1, 0.1372549, 1,
-0.3033592, -0.1347496, -2.186614, 0, 1, 0.1411765, 1,
-0.3033341, -1.045018, -1.844416, 0, 1, 0.1490196, 1,
-0.3003522, -0.9388071, -3.765431, 0, 1, 0.1529412, 1,
-0.2999065, 0.2288249, -1.903962, 0, 1, 0.1607843, 1,
-0.29874, -0.83167, -2.690053, 0, 1, 0.1647059, 1,
-0.2929007, 0.870882, -0.4593585, 0, 1, 0.172549, 1,
-0.2923131, 0.7489179, -0.06820853, 0, 1, 0.1764706, 1,
-0.2918392, -0.9331979, -1.602252, 0, 1, 0.1843137, 1,
-0.2909377, -1.317495, -2.667723, 0, 1, 0.1882353, 1,
-0.2884338, -1.368253, -3.67065, 0, 1, 0.1960784, 1,
-0.2848355, 0.9358265, -1.814096, 0, 1, 0.2039216, 1,
-0.2797898, 0.01498276, -1.559384, 0, 1, 0.2078431, 1,
-0.277329, -0.7336707, -2.918147, 0, 1, 0.2156863, 1,
-0.2740499, 0.4639702, 1.293799, 0, 1, 0.2196078, 1,
-0.269443, -0.7167528, -3.236, 0, 1, 0.227451, 1,
-0.2673464, 0.493427, -0.3070654, 0, 1, 0.2313726, 1,
-0.264565, -0.8815713, -3.581656, 0, 1, 0.2392157, 1,
-0.2535318, 0.2362031, 0.2623789, 0, 1, 0.2431373, 1,
-0.252414, 0.4031346, -0.672882, 0, 1, 0.2509804, 1,
-0.2512806, -0.45575, -2.568844, 0, 1, 0.254902, 1,
-0.248588, 1.417482, 0.049462, 0, 1, 0.2627451, 1,
-0.2449294, 0.07812677, 0.1063571, 0, 1, 0.2666667, 1,
-0.2430812, -1.910676, -2.614683, 0, 1, 0.2745098, 1,
-0.2421035, -0.307548, -0.4372187, 0, 1, 0.2784314, 1,
-0.2419642, 1.879997, -1.003176, 0, 1, 0.2862745, 1,
-0.2409219, 1.096281, 1.539696, 0, 1, 0.2901961, 1,
-0.2371323, -0.9873077, -2.97178, 0, 1, 0.2980392, 1,
-0.2346607, 0.334904, -0.0906041, 0, 1, 0.3058824, 1,
-0.2303252, 0.1336861, -0.1946512, 0, 1, 0.3098039, 1,
-0.2267838, -0.2922679, -3.157253, 0, 1, 0.3176471, 1,
-0.2167584, -0.8836548, -3.515087, 0, 1, 0.3215686, 1,
-0.2137336, 0.4853771, 1.006466, 0, 1, 0.3294118, 1,
-0.2093855, 0.6708282, 0.5003644, 0, 1, 0.3333333, 1,
-0.2089003, 0.7090232, -1.144866, 0, 1, 0.3411765, 1,
-0.2023798, 0.4624022, 0.9627274, 0, 1, 0.345098, 1,
-0.2022629, -0.874705, -4.213043, 0, 1, 0.3529412, 1,
-0.1997491, -0.120296, -2.194557, 0, 1, 0.3568628, 1,
-0.1959863, 1.170453, -0.02840175, 0, 1, 0.3647059, 1,
-0.1954356, 0.07444578, -1.122914, 0, 1, 0.3686275, 1,
-0.1886447, -0.2774553, -4.08672, 0, 1, 0.3764706, 1,
-0.1869168, 0.08236066, -1.643311, 0, 1, 0.3803922, 1,
-0.1842611, 0.501333, -0.746739, 0, 1, 0.3882353, 1,
-0.1824272, -1.573074, -3.16164, 0, 1, 0.3921569, 1,
-0.1813704, -0.5584889, -3.078716, 0, 1, 0.4, 1,
-0.1807739, -0.00799403, -1.230054, 0, 1, 0.4078431, 1,
-0.1804821, 0.2111913, -0.9237148, 0, 1, 0.4117647, 1,
-0.1792737, -1.288399, -4.680383, 0, 1, 0.4196078, 1,
-0.1771107, -0.8524628, -1.232742, 0, 1, 0.4235294, 1,
-0.1758989, -0.5580887, -3.318003, 0, 1, 0.4313726, 1,
-0.1756668, -0.8748081, -3.860859, 0, 1, 0.4352941, 1,
-0.1716897, 0.07910274, -1.831671, 0, 1, 0.4431373, 1,
-0.1706537, 1.087451, -1.153134, 0, 1, 0.4470588, 1,
-0.1643766, -0.007785528, -2.30391, 0, 1, 0.454902, 1,
-0.1632888, 0.5210406, -0.6499965, 0, 1, 0.4588235, 1,
-0.1533395, -0.08922726, -2.126571, 0, 1, 0.4666667, 1,
-0.1507755, 0.2678915, -2.598962, 0, 1, 0.4705882, 1,
-0.150494, -0.3172446, -3.153316, 0, 1, 0.4784314, 1,
-0.1501541, -0.7720505, -4.184227, 0, 1, 0.4823529, 1,
-0.1479151, -1.758963, -2.780756, 0, 1, 0.4901961, 1,
-0.145788, 0.7682543, -1.398702, 0, 1, 0.4941176, 1,
-0.1450004, -0.08937339, -3.077949, 0, 1, 0.5019608, 1,
-0.1446811, -1.81012, -3.362964, 0, 1, 0.509804, 1,
-0.1439984, -0.5025593, -2.298999, 0, 1, 0.5137255, 1,
-0.1415643, -0.09337372, -0.2464057, 0, 1, 0.5215687, 1,
-0.1406802, 1.491928, 2.050068, 0, 1, 0.5254902, 1,
-0.1400683, -1.577207, -1.645442, 0, 1, 0.5333334, 1,
-0.1375865, 1.482969, 2.278856, 0, 1, 0.5372549, 1,
-0.1339616, -0.08842743, -1.408934, 0, 1, 0.5450981, 1,
-0.1296752, -1.627758, -4.021023, 0, 1, 0.5490196, 1,
-0.1293001, -3.036323, -4.105739, 0, 1, 0.5568628, 1,
-0.1252765, -0.06546734, -2.64352, 0, 1, 0.5607843, 1,
-0.1247221, -1.622735, -3.143362, 0, 1, 0.5686275, 1,
-0.1200627, 0.8621653, -1.1143, 0, 1, 0.572549, 1,
-0.1197177, -0.5516713, -3.026464, 0, 1, 0.5803922, 1,
-0.1188062, -0.2567727, -2.921339, 0, 1, 0.5843138, 1,
-0.1164379, -0.0212413, -3.193393, 0, 1, 0.5921569, 1,
-0.1160904, 1.007322, -0.9734618, 0, 1, 0.5960785, 1,
-0.1158873, 0.2774702, -1.29354, 0, 1, 0.6039216, 1,
-0.115526, 0.264645, -2.349173, 0, 1, 0.6117647, 1,
-0.1124933, -1.375277, -4.423593, 0, 1, 0.6156863, 1,
-0.1067635, -1.462536, -4.292549, 0, 1, 0.6235294, 1,
-0.1050886, 1.107, 0.6448877, 0, 1, 0.627451, 1,
-0.1013501, -2.68576, -1.285198, 0, 1, 0.6352941, 1,
-0.1010774, 0.7014157, -0.4225033, 0, 1, 0.6392157, 1,
-0.09849771, 0.3094082, -1.030352, 0, 1, 0.6470588, 1,
-0.09657112, -0.9365883, -3.436915, 0, 1, 0.6509804, 1,
-0.09540064, -0.7832662, -3.16648, 0, 1, 0.6588235, 1,
-0.09507053, -2.105108, -4.107587, 0, 1, 0.6627451, 1,
-0.09279263, 0.1920467, -0.2125566, 0, 1, 0.6705883, 1,
-0.09264451, 0.5931181, -1.176258, 0, 1, 0.6745098, 1,
-0.09245557, -0.3177122, -2.326761, 0, 1, 0.682353, 1,
-0.09161879, 0.05670992, -1.130307, 0, 1, 0.6862745, 1,
-0.09109043, 2.111817, -0.5843197, 0, 1, 0.6941177, 1,
-0.09069779, -1.485676, -3.664805, 0, 1, 0.7019608, 1,
-0.08876687, -2.706226, -1.957546, 0, 1, 0.7058824, 1,
-0.08445153, 0.7629724, 0.4442019, 0, 1, 0.7137255, 1,
-0.0837591, -0.42647, -2.374494, 0, 1, 0.7176471, 1,
-0.07977428, 1.065169, 0.5987648, 0, 1, 0.7254902, 1,
-0.07936731, -0.5888262, -2.512419, 0, 1, 0.7294118, 1,
-0.07106742, -0.3296826, -3.536935, 0, 1, 0.7372549, 1,
-0.06743326, 0.931716, -0.1060706, 0, 1, 0.7411765, 1,
-0.06656816, -0.8146842, -2.5085, 0, 1, 0.7490196, 1,
-0.06631763, -1.662634, -3.359348, 0, 1, 0.7529412, 1,
-0.05714762, 0.2552494, 0.3076227, 0, 1, 0.7607843, 1,
-0.0563538, -0.2161675, -3.923224, 0, 1, 0.7647059, 1,
-0.05612345, -0.6132544, -2.318188, 0, 1, 0.772549, 1,
-0.0550929, 0.6163324, -0.3176955, 0, 1, 0.7764706, 1,
-0.05147146, 0.3672034, 0.9387049, 0, 1, 0.7843137, 1,
-0.0500679, 0.3206576, 0.852156, 0, 1, 0.7882353, 1,
-0.04579201, 0.3108308, -0.9338441, 0, 1, 0.7960784, 1,
-0.0392439, 1.595744, -0.479391, 0, 1, 0.8039216, 1,
-0.03868446, 0.9257728, 2.353342, 0, 1, 0.8078431, 1,
-0.03866332, 1.608847, 0.7764807, 0, 1, 0.8156863, 1,
-0.03791386, -0.6388339, -3.511546, 0, 1, 0.8196079, 1,
-0.03399415, -0.3829651, -5.05309, 0, 1, 0.827451, 1,
-0.03269328, -0.3750697, -2.647139, 0, 1, 0.8313726, 1,
-0.03166158, -0.7089982, -3.237543, 0, 1, 0.8392157, 1,
-0.03049787, -1.091282, -3.131935, 0, 1, 0.8431373, 1,
-0.02758224, -1.261601, -2.987904, 0, 1, 0.8509804, 1,
-0.02701411, 0.5801963, -1.031315, 0, 1, 0.854902, 1,
-0.02329554, 0.08665302, -1.155168, 0, 1, 0.8627451, 1,
-0.02231335, -1.300666, -2.827864, 0, 1, 0.8666667, 1,
-0.02220444, 0.3545691, -0.4637686, 0, 1, 0.8745098, 1,
-0.01930459, 0.3083128, 0.9559248, 0, 1, 0.8784314, 1,
-0.0179624, -0.06582712, -3.103971, 0, 1, 0.8862745, 1,
-0.01409769, -0.438474, -4.455898, 0, 1, 0.8901961, 1,
-0.003770017, -0.405375, -1.12521, 0, 1, 0.8980392, 1,
-0.00234644, -1.213054, -3.371226, 0, 1, 0.9058824, 1,
0.004597913, 1.358667, 0.6678457, 0, 1, 0.9098039, 1,
0.005172272, -0.3408751, 3.477522, 0, 1, 0.9176471, 1,
0.01005148, 1.84121, -0.05681421, 0, 1, 0.9215686, 1,
0.01494177, -0.5314631, 3.623423, 0, 1, 0.9294118, 1,
0.01852689, -1.423984, 2.975981, 0, 1, 0.9333333, 1,
0.02457027, -1.096126, 2.957137, 0, 1, 0.9411765, 1,
0.02470906, -0.3847691, 3.086175, 0, 1, 0.945098, 1,
0.02854913, -1.831649, 1.070168, 0, 1, 0.9529412, 1,
0.0337167, -1.016937, 3.653206, 0, 1, 0.9568627, 1,
0.03660509, -0.6619501, 2.593874, 0, 1, 0.9647059, 1,
0.03819557, -0.804351, 3.990737, 0, 1, 0.9686275, 1,
0.04071055, 1.425911, -1.902937, 0, 1, 0.9764706, 1,
0.04105383, -0.420971, 1.116313, 0, 1, 0.9803922, 1,
0.04155758, 0.4031429, 0.6911716, 0, 1, 0.9882353, 1,
0.04298063, -0.7930651, 2.435699, 0, 1, 0.9921569, 1,
0.04454625, -0.327593, 4.193046, 0, 1, 1, 1,
0.04491424, 0.05819888, 0.1869456, 0, 0.9921569, 1, 1,
0.04589577, -0.5934069, 2.369469, 0, 0.9882353, 1, 1,
0.04850768, 1.785702, 0.965102, 0, 0.9803922, 1, 1,
0.04892397, -0.100974, 2.126014, 0, 0.9764706, 1, 1,
0.0506468, -0.3064719, 4.479255, 0, 0.9686275, 1, 1,
0.05161626, 0.2433798, 0.7034599, 0, 0.9647059, 1, 1,
0.05264405, 0.3813798, -0.7005557, 0, 0.9568627, 1, 1,
0.05413351, -0.5849833, 2.636258, 0, 0.9529412, 1, 1,
0.05489413, -1.252631, 3.020342, 0, 0.945098, 1, 1,
0.05520662, -1.929535, 2.422766, 0, 0.9411765, 1, 1,
0.05659103, -0.8369283, 3.590993, 0, 0.9333333, 1, 1,
0.05942073, -0.229955, 1.701079, 0, 0.9294118, 1, 1,
0.06049589, -0.2344049, 2.095488, 0, 0.9215686, 1, 1,
0.06178525, 1.193925, 0.1122838, 0, 0.9176471, 1, 1,
0.06256703, 0.9938188, -0.08423084, 0, 0.9098039, 1, 1,
0.06347062, 0.5806502, 0.9081841, 0, 0.9058824, 1, 1,
0.0672437, -1.014152, 2.209499, 0, 0.8980392, 1, 1,
0.07173169, 1.026497, -0.5074571, 0, 0.8901961, 1, 1,
0.07389043, -0.9576155, 2.716525, 0, 0.8862745, 1, 1,
0.07410343, 1.312073, 2.658138, 0, 0.8784314, 1, 1,
0.07453965, -0.2609496, 4.877583, 0, 0.8745098, 1, 1,
0.07989497, -0.8859292, 4.089107, 0, 0.8666667, 1, 1,
0.08122697, -0.8699067, 3.880784, 0, 0.8627451, 1, 1,
0.08448101, -0.2186135, 3.243194, 0, 0.854902, 1, 1,
0.08928916, 0.3189679, -1.439803, 0, 0.8509804, 1, 1,
0.09115589, 0.6889693, -1.723388, 0, 0.8431373, 1, 1,
0.09656096, 0.6052482, -0.6593549, 0, 0.8392157, 1, 1,
0.1027207, -0.1811271, 2.670254, 0, 0.8313726, 1, 1,
0.1122738, 0.699659, 0.3157429, 0, 0.827451, 1, 1,
0.1135794, 0.08026114, 1.065874, 0, 0.8196079, 1, 1,
0.1185897, 0.2371316, 0.8746717, 0, 0.8156863, 1, 1,
0.1191237, -1.988244, 3.041849, 0, 0.8078431, 1, 1,
0.1225901, -1.199584, 2.57778, 0, 0.8039216, 1, 1,
0.1230139, -1.001162, 5.552496, 0, 0.7960784, 1, 1,
0.1235038, 0.754274, -0.1672569, 0, 0.7882353, 1, 1,
0.126264, 0.2600538, -0.4977952, 0, 0.7843137, 1, 1,
0.1269837, -0.7915469, 2.452904, 0, 0.7764706, 1, 1,
0.1279167, 1.705462, 0.8385253, 0, 0.772549, 1, 1,
0.1312642, 0.03592842, 0.736778, 0, 0.7647059, 1, 1,
0.1331742, 1.471656, -0.3938965, 0, 0.7607843, 1, 1,
0.1338217, 0.7936552, -0.5998616, 0, 0.7529412, 1, 1,
0.1340979, -0.8248628, 1.165163, 0, 0.7490196, 1, 1,
0.1375471, 0.893734, -0.02807674, 0, 0.7411765, 1, 1,
0.1397343, -0.702947, 2.151587, 0, 0.7372549, 1, 1,
0.1408256, -0.7049845, 3.791666, 0, 0.7294118, 1, 1,
0.1451323, -0.5266587, 1.799, 0, 0.7254902, 1, 1,
0.1474549, 0.04069497, 2.669428, 0, 0.7176471, 1, 1,
0.1485259, 0.2467691, -1.254566, 0, 0.7137255, 1, 1,
0.1505545, 2.015756, -0.9186468, 0, 0.7058824, 1, 1,
0.1512752, -0.6711761, 4.053907, 0, 0.6980392, 1, 1,
0.1529536, 0.01195535, 1.08809, 0, 0.6941177, 1, 1,
0.1580502, -0.7590739, 2.821196, 0, 0.6862745, 1, 1,
0.1607606, 0.05477731, 0.184895, 0, 0.682353, 1, 1,
0.1629587, -0.8316056, 1.850041, 0, 0.6745098, 1, 1,
0.1630059, -0.8795302, 3.719374, 0, 0.6705883, 1, 1,
0.1660661, -0.4081853, 2.731825, 0, 0.6627451, 1, 1,
0.1679088, -0.8787585, 2.47297, 0, 0.6588235, 1, 1,
0.1721864, -0.2160086, 2.249673, 0, 0.6509804, 1, 1,
0.1756748, 2.129208, -1.501737, 0, 0.6470588, 1, 1,
0.1759231, 1.484084, 0.463404, 0, 0.6392157, 1, 1,
0.1801424, 0.07465085, 1.771959, 0, 0.6352941, 1, 1,
0.1806847, 0.4432361, 1.684284, 0, 0.627451, 1, 1,
0.1813026, -1.037948, 2.937495, 0, 0.6235294, 1, 1,
0.1837256, -0.5734301, 3.28318, 0, 0.6156863, 1, 1,
0.1849642, 0.7770563, -0.3139764, 0, 0.6117647, 1, 1,
0.1882628, 2.301364, 0.07651318, 0, 0.6039216, 1, 1,
0.188613, -0.4645473, 1.998288, 0, 0.5960785, 1, 1,
0.1953925, -0.7228667, 3.225858, 0, 0.5921569, 1, 1,
0.1962597, 1.724177, -1.921794, 0, 0.5843138, 1, 1,
0.2027541, 1.248023, -0.1901882, 0, 0.5803922, 1, 1,
0.20336, -1.528198, 0.417412, 0, 0.572549, 1, 1,
0.2044661, 0.8821481, 0.3158354, 0, 0.5686275, 1, 1,
0.2089207, 1.906252, 0.01599273, 0, 0.5607843, 1, 1,
0.2092137, 1.854588, 0.6579627, 0, 0.5568628, 1, 1,
0.211455, 2.29877, 0.1590693, 0, 0.5490196, 1, 1,
0.2133549, -0.9198053, 3.744813, 0, 0.5450981, 1, 1,
0.2156154, -0.1924379, 0.3802642, 0, 0.5372549, 1, 1,
0.2176939, -1.288574, 2.884618, 0, 0.5333334, 1, 1,
0.2177448, -1.028519, 2.757537, 0, 0.5254902, 1, 1,
0.2187065, -0.151618, 1.646234, 0, 0.5215687, 1, 1,
0.2222651, 0.2997844, 1.03589, 0, 0.5137255, 1, 1,
0.2239181, -2.371339, 3.914958, 0, 0.509804, 1, 1,
0.2240935, 0.05106447, 1.470498, 0, 0.5019608, 1, 1,
0.2288347, -1.333723, 3.357565, 0, 0.4941176, 1, 1,
0.2298077, -0.4545885, 2.753365, 0, 0.4901961, 1, 1,
0.2326615, -0.1077918, 0.05030492, 0, 0.4823529, 1, 1,
0.2375346, -0.08040302, 0.1498885, 0, 0.4784314, 1, 1,
0.2375372, -0.6611892, 2.099715, 0, 0.4705882, 1, 1,
0.2428946, 0.5327175, -0.3625927, 0, 0.4666667, 1, 1,
0.2495002, -0.6847425, 3.679779, 0, 0.4588235, 1, 1,
0.2523057, -0.7486345, 2.712395, 0, 0.454902, 1, 1,
0.2589524, -0.7003326, 3.980478, 0, 0.4470588, 1, 1,
0.2653168, 1.683069, 0.1742942, 0, 0.4431373, 1, 1,
0.2706123, 2.180266, -0.5712527, 0, 0.4352941, 1, 1,
0.2768936, -0.8975571, 1.045012, 0, 0.4313726, 1, 1,
0.2846589, -0.0919496, 1.884139, 0, 0.4235294, 1, 1,
0.2868653, 1.782599, 1.537374, 0, 0.4196078, 1, 1,
0.2897336, 0.536394, 0.8065538, 0, 0.4117647, 1, 1,
0.2903762, -0.1088357, 1.755499, 0, 0.4078431, 1, 1,
0.2904878, -0.09918842, 2.765233, 0, 0.4, 1, 1,
0.2949249, -0.9766064, 4.440417, 0, 0.3921569, 1, 1,
0.2958211, -1.243504, 1.857298, 0, 0.3882353, 1, 1,
0.3028586, -0.9692268, 1.416897, 0, 0.3803922, 1, 1,
0.3054906, 1.034038, -1.528911, 0, 0.3764706, 1, 1,
0.3069694, 0.7652814, -0.3156291, 0, 0.3686275, 1, 1,
0.307142, 1.392853, 0.3794371, 0, 0.3647059, 1, 1,
0.3076404, -0.8710147, 0.2427337, 0, 0.3568628, 1, 1,
0.3077933, -0.07774545, 2.071757, 0, 0.3529412, 1, 1,
0.307867, -0.574742, 4.346425, 0, 0.345098, 1, 1,
0.3102777, -0.5949996, 2.286452, 0, 0.3411765, 1, 1,
0.3115813, 0.3430836, 0.213718, 0, 0.3333333, 1, 1,
0.3125655, -0.732675, 1.794219, 0, 0.3294118, 1, 1,
0.3126213, -0.1678435, 0.6543337, 0, 0.3215686, 1, 1,
0.3175442, -0.7010398, 3.295514, 0, 0.3176471, 1, 1,
0.3187927, 0.1562249, 1.895205, 0, 0.3098039, 1, 1,
0.3213702, 0.2515549, -0.5303857, 0, 0.3058824, 1, 1,
0.3220091, -0.7888715, 2.765309, 0, 0.2980392, 1, 1,
0.3223226, -0.8645405, 3.392776, 0, 0.2901961, 1, 1,
0.3235788, -0.667614, 2.452372, 0, 0.2862745, 1, 1,
0.3297604, -0.7722697, 3.567937, 0, 0.2784314, 1, 1,
0.3298671, -1.237904, 3.362689, 0, 0.2745098, 1, 1,
0.3350061, 0.410008, 1.187343, 0, 0.2666667, 1, 1,
0.3359105, -0.3072073, 2.58618, 0, 0.2627451, 1, 1,
0.3381948, -1.480454, 4.369243, 0, 0.254902, 1, 1,
0.3399542, -1.866522, 3.664519, 0, 0.2509804, 1, 1,
0.3405139, 0.8891401, 1.47824, 0, 0.2431373, 1, 1,
0.341327, -0.906498, 3.48719, 0, 0.2392157, 1, 1,
0.3425264, 1.43703, 0.1469483, 0, 0.2313726, 1, 1,
0.3449509, 0.8232274, 1.542785, 0, 0.227451, 1, 1,
0.3496644, -0.3539796, 3.619856, 0, 0.2196078, 1, 1,
0.349744, -0.7788029, 3.9279, 0, 0.2156863, 1, 1,
0.3568451, -1.396377, 2.971406, 0, 0.2078431, 1, 1,
0.3605725, -0.07529961, 1.895463, 0, 0.2039216, 1, 1,
0.3622124, 1.647274, -0.06547402, 0, 0.1960784, 1, 1,
0.3625772, -0.02635997, 3.251319, 0, 0.1882353, 1, 1,
0.3643538, 1.79133, -1.365268, 0, 0.1843137, 1, 1,
0.3643946, 0.9201351, 0.5775121, 0, 0.1764706, 1, 1,
0.3645646, 0.9128146, 0.3797728, 0, 0.172549, 1, 1,
0.3666748, -0.9560025, 1.956847, 0, 0.1647059, 1, 1,
0.3732443, 1.753641, 0.8273588, 0, 0.1607843, 1, 1,
0.3742272, -0.3112059, 2.218297, 0, 0.1529412, 1, 1,
0.3754998, -1.477256, 3.245472, 0, 0.1490196, 1, 1,
0.3757193, 0.4716302, -1.254284, 0, 0.1411765, 1, 1,
0.3762673, 0.6137396, -0.5255626, 0, 0.1372549, 1, 1,
0.3777716, 0.3465153, 1.077408, 0, 0.1294118, 1, 1,
0.3804201, -0.9620761, 1.135758, 0, 0.1254902, 1, 1,
0.3873012, 0.6997431, 0.3283865, 0, 0.1176471, 1, 1,
0.3895027, -1.112009, 3.335197, 0, 0.1137255, 1, 1,
0.3895693, -0.8045148, 0.9746494, 0, 0.1058824, 1, 1,
0.401904, 0.9169466, 0.5312152, 0, 0.09803922, 1, 1,
0.4071912, -0.8444291, 2.095517, 0, 0.09411765, 1, 1,
0.4124161, 0.5346175, -0.02473614, 0, 0.08627451, 1, 1,
0.4183358, 0.04225137, 1.239048, 0, 0.08235294, 1, 1,
0.4191583, -0.5147483, 1.321404, 0, 0.07450981, 1, 1,
0.4211598, 1.526175, -0.02103123, 0, 0.07058824, 1, 1,
0.4218586, 0.1277599, 0.06064123, 0, 0.0627451, 1, 1,
0.4269582, -0.7712691, 3.156101, 0, 0.05882353, 1, 1,
0.4273077, -0.857636, 2.910437, 0, 0.05098039, 1, 1,
0.4336061, -0.09259158, 3.604651, 0, 0.04705882, 1, 1,
0.4336853, -0.1733879, 1.164206, 0, 0.03921569, 1, 1,
0.4355192, -1.394394, 2.450009, 0, 0.03529412, 1, 1,
0.4407551, 1.155201, 0.05035485, 0, 0.02745098, 1, 1,
0.4412022, 1.026047, 0.5109093, 0, 0.02352941, 1, 1,
0.4432906, 0.05878406, 2.811312, 0, 0.01568628, 1, 1,
0.4448219, 0.329594, 1.000625, 0, 0.01176471, 1, 1,
0.4450063, -0.6618244, 1.753223, 0, 0.003921569, 1, 1,
0.450766, -0.4962857, -0.186326, 0.003921569, 0, 1, 1,
0.4606392, -0.2787415, 1.523978, 0.007843138, 0, 1, 1,
0.4615843, 0.8232187, 0.2083349, 0.01568628, 0, 1, 1,
0.4639795, -0.1345699, 0.4882365, 0.01960784, 0, 1, 1,
0.4688201, -1.013011, 2.623188, 0.02745098, 0, 1, 1,
0.4731171, 0.8186622, 1.460457, 0.03137255, 0, 1, 1,
0.4734919, 0.5984665, 0.350604, 0.03921569, 0, 1, 1,
0.4761302, 0.9378864, -0.06606705, 0.04313726, 0, 1, 1,
0.4851716, -1.122362, 4.298998, 0.05098039, 0, 1, 1,
0.4858604, 0.5672159, 0.3401586, 0.05490196, 0, 1, 1,
0.4864946, -0.8910747, 4.444089, 0.0627451, 0, 1, 1,
0.489257, -1.62938, 4.318769, 0.06666667, 0, 1, 1,
0.4949632, 0.2935294, 1.509135, 0.07450981, 0, 1, 1,
0.4981271, -0.3448191, 0.1916237, 0.07843138, 0, 1, 1,
0.5050468, 0.8811737, -0.9473088, 0.08627451, 0, 1, 1,
0.5096629, -0.5257787, 3.018675, 0.09019608, 0, 1, 1,
0.5103514, 0.1789023, 0.6703317, 0.09803922, 0, 1, 1,
0.5129811, -0.0343974, 2.170858, 0.1058824, 0, 1, 1,
0.513802, 1.009957, 0.6978612, 0.1098039, 0, 1, 1,
0.5164077, 1.093454, -0.2866838, 0.1176471, 0, 1, 1,
0.5225505, 1.058816, 0.7805399, 0.1215686, 0, 1, 1,
0.5243142, 0.1373851, 0.05757514, 0.1294118, 0, 1, 1,
0.5266584, 1.718364, 2.276672, 0.1333333, 0, 1, 1,
0.5285554, -0.4716855, 1.569706, 0.1411765, 0, 1, 1,
0.5350824, 0.7197343, 1.081969, 0.145098, 0, 1, 1,
0.5362157, 0.7611145, 0.5201412, 0.1529412, 0, 1, 1,
0.5383665, 0.2118963, 1.363549, 0.1568628, 0, 1, 1,
0.5422736, 0.3357679, 0.288304, 0.1647059, 0, 1, 1,
0.5439653, -0.1374815, 2.284772, 0.1686275, 0, 1, 1,
0.5462708, -1.463045, 3.59055, 0.1764706, 0, 1, 1,
0.5479053, -0.6520018, -1.348061, 0.1803922, 0, 1, 1,
0.5484617, -0.3455805, 3.565685, 0.1882353, 0, 1, 1,
0.5551532, 1.379148, -0.2272915, 0.1921569, 0, 1, 1,
0.556429, 1.431021, 0.5825721, 0.2, 0, 1, 1,
0.5581528, -0.8324332, 3.271501, 0.2078431, 0, 1, 1,
0.558192, 0.5964655, 0.9290824, 0.2117647, 0, 1, 1,
0.5582279, -0.3869288, 2.223251, 0.2196078, 0, 1, 1,
0.5607708, -0.3856024, 2.124613, 0.2235294, 0, 1, 1,
0.5627499, -0.4815017, 1.88275, 0.2313726, 0, 1, 1,
0.5640801, 0.9247024, 1.547783, 0.2352941, 0, 1, 1,
0.5655468, -1.526937, 2.703828, 0.2431373, 0, 1, 1,
0.5685843, 1.243269, 0.726352, 0.2470588, 0, 1, 1,
0.5688742, -0.7297992, 2.727066, 0.254902, 0, 1, 1,
0.5691149, 0.1702827, 2.296897, 0.2588235, 0, 1, 1,
0.5697128, 0.2862295, 0.6933448, 0.2666667, 0, 1, 1,
0.5732855, -0.1177135, 1.587801, 0.2705882, 0, 1, 1,
0.573678, -0.4327948, 4.030443, 0.2784314, 0, 1, 1,
0.5765735, -0.07872117, 2.317043, 0.282353, 0, 1, 1,
0.5767772, 1.281796, 0.5824507, 0.2901961, 0, 1, 1,
0.5772819, -0.7007083, 1.838559, 0.2941177, 0, 1, 1,
0.5785847, 1.253732, -0.5739484, 0.3019608, 0, 1, 1,
0.5811288, -0.4338553, 1.922256, 0.3098039, 0, 1, 1,
0.5822358, 0.6777375, 1.568435, 0.3137255, 0, 1, 1,
0.5835385, -0.9285036, 1.325419, 0.3215686, 0, 1, 1,
0.5981066, -0.02301893, 0.8471526, 0.3254902, 0, 1, 1,
0.5982437, -0.002676661, 2.524244, 0.3333333, 0, 1, 1,
0.5993091, -1.446885, 3.859523, 0.3372549, 0, 1, 1,
0.6024665, -0.5705997, 1.330422, 0.345098, 0, 1, 1,
0.6032694, 1.272724, 0.1193336, 0.3490196, 0, 1, 1,
0.6043552, -1.467155, 3.418872, 0.3568628, 0, 1, 1,
0.6071292, 0.0442474, 1.526342, 0.3607843, 0, 1, 1,
0.6075557, -0.5493145, 2.935297, 0.3686275, 0, 1, 1,
0.6084357, -0.1368821, 0.09711568, 0.372549, 0, 1, 1,
0.6113585, 0.4518753, 1.160007, 0.3803922, 0, 1, 1,
0.6135952, -2.971064, 2.414195, 0.3843137, 0, 1, 1,
0.6154673, 0.9274247, 1.205421, 0.3921569, 0, 1, 1,
0.6169898, 0.9580295, -0.368178, 0.3960784, 0, 1, 1,
0.6190144, 0.4405519, 0.1825617, 0.4039216, 0, 1, 1,
0.6254882, 0.9675485, 2.277242, 0.4117647, 0, 1, 1,
0.625587, -0.1362655, 2.389198, 0.4156863, 0, 1, 1,
0.6315249, -1.267915, 4.769649, 0.4235294, 0, 1, 1,
0.6327925, -0.933701, 1.73055, 0.427451, 0, 1, 1,
0.6374303, 0.8941424, 1.53302, 0.4352941, 0, 1, 1,
0.6412415, 0.4531521, -0.3317231, 0.4392157, 0, 1, 1,
0.651444, 0.3719131, 1.347866, 0.4470588, 0, 1, 1,
0.6531995, 0.2523576, -0.008749895, 0.4509804, 0, 1, 1,
0.6556726, -0.3396189, 3.596261, 0.4588235, 0, 1, 1,
0.6578808, 1.645535, -0.457006, 0.4627451, 0, 1, 1,
0.6603587, -0.09548981, 1.196581, 0.4705882, 0, 1, 1,
0.661109, -1.023075, 2.718937, 0.4745098, 0, 1, 1,
0.6649665, 0.3313614, -0.1045302, 0.4823529, 0, 1, 1,
0.6660676, 1.512924, -1.205912, 0.4862745, 0, 1, 1,
0.6689799, -0.3812404, 1.48262, 0.4941176, 0, 1, 1,
0.6693124, -0.1578777, 2.370051, 0.5019608, 0, 1, 1,
0.6701716, -2.340636, 4.218787, 0.5058824, 0, 1, 1,
0.6707727, 0.4657608, 0.8260548, 0.5137255, 0, 1, 1,
0.6733544, -0.09269398, 1.552074, 0.5176471, 0, 1, 1,
0.6765511, -0.02920023, 0.5267742, 0.5254902, 0, 1, 1,
0.6767693, 0.242541, 1.072258, 0.5294118, 0, 1, 1,
0.681006, -0.2176742, 1.92465, 0.5372549, 0, 1, 1,
0.6823162, -0.2607177, 2.647889, 0.5411765, 0, 1, 1,
0.6880906, 1.537071, 0.5697302, 0.5490196, 0, 1, 1,
0.6922492, 1.588374, -0.6793051, 0.5529412, 0, 1, 1,
0.6997177, 0.784019, 1.029198, 0.5607843, 0, 1, 1,
0.7013974, 0.007596245, 1.951089, 0.5647059, 0, 1, 1,
0.7024001, 1.210829, 1.213983, 0.572549, 0, 1, 1,
0.7208029, 0.1168674, 1.298502, 0.5764706, 0, 1, 1,
0.7221146, 1.625467, 0.4061613, 0.5843138, 0, 1, 1,
0.722155, -1.375459, 4.016611, 0.5882353, 0, 1, 1,
0.7235866, 0.2406041, 2.85214, 0.5960785, 0, 1, 1,
0.7253987, 0.4870414, 0.5324445, 0.6039216, 0, 1, 1,
0.7293116, -1.013404, 1.291497, 0.6078432, 0, 1, 1,
0.7320811, -0.7113272, 2.32845, 0.6156863, 0, 1, 1,
0.7336888, 0.6101636, 1.924767, 0.6196079, 0, 1, 1,
0.7381448, -0.5512291, 1.961094, 0.627451, 0, 1, 1,
0.7436692, 0.4814925, 1.617723, 0.6313726, 0, 1, 1,
0.7450548, 1.678935, -0.9832855, 0.6392157, 0, 1, 1,
0.7503105, 0.7523697, 0.1850492, 0.6431373, 0, 1, 1,
0.7517783, -1.139442, 2.436323, 0.6509804, 0, 1, 1,
0.7531701, -0.2223092, 3.058751, 0.654902, 0, 1, 1,
0.7554449, 0.04348499, 0.7040587, 0.6627451, 0, 1, 1,
0.7556135, 0.05371082, 2.886784, 0.6666667, 0, 1, 1,
0.7568136, 0.4361514, 1.122643, 0.6745098, 0, 1, 1,
0.7572534, -0.3807683, 1.194174, 0.6784314, 0, 1, 1,
0.7588689, -0.1659014, 0.3694188, 0.6862745, 0, 1, 1,
0.7697451, 0.9379529, 1.085526, 0.6901961, 0, 1, 1,
0.7718154, -1.664912, 1.849922, 0.6980392, 0, 1, 1,
0.7734147, 0.03856974, 2.27525, 0.7058824, 0, 1, 1,
0.7791208, 0.6406753, 2.164422, 0.7098039, 0, 1, 1,
0.7832015, 0.4255949, 0.2872497, 0.7176471, 0, 1, 1,
0.7860696, -1.186888, 2.986321, 0.7215686, 0, 1, 1,
0.787762, 0.9686515, 1.297055, 0.7294118, 0, 1, 1,
0.8014985, -0.4083665, 2.478787, 0.7333333, 0, 1, 1,
0.8022513, 0.1201008, 1.838259, 0.7411765, 0, 1, 1,
0.8062142, -0.8818665, 2.62812, 0.7450981, 0, 1, 1,
0.8086255, 0.183193, 1.409318, 0.7529412, 0, 1, 1,
0.81709, 0.2382382, 2.943933, 0.7568628, 0, 1, 1,
0.8224787, -1.87734, 2.934806, 0.7647059, 0, 1, 1,
0.8290971, -1.302636, 3.031534, 0.7686275, 0, 1, 1,
0.8298558, 2.089272, 2.001256, 0.7764706, 0, 1, 1,
0.8315879, -0.7886049, 2.907879, 0.7803922, 0, 1, 1,
0.8321853, 0.0490621, 2.281469, 0.7882353, 0, 1, 1,
0.8339866, -1.659626, 3.789251, 0.7921569, 0, 1, 1,
0.8346011, -0.1005176, 1.229574, 0.8, 0, 1, 1,
0.8355749, -0.459785, 1.429115, 0.8078431, 0, 1, 1,
0.8359644, -0.8263901, 2.608339, 0.8117647, 0, 1, 1,
0.8403261, -0.2918123, 2.688864, 0.8196079, 0, 1, 1,
0.8444896, 2.47181, 0.9640131, 0.8235294, 0, 1, 1,
0.8467781, -0.4375399, 3.099841, 0.8313726, 0, 1, 1,
0.846804, 0.02374424, 1.976856, 0.8352941, 0, 1, 1,
0.8468764, -0.9841321, 2.688938, 0.8431373, 0, 1, 1,
0.8677934, 0.3097303, 0.8522412, 0.8470588, 0, 1, 1,
0.8682681, 0.8730816, 1.355242, 0.854902, 0, 1, 1,
0.8683243, -0.1442452, 3.162666, 0.8588235, 0, 1, 1,
0.8722453, -1.488948, 1.77001, 0.8666667, 0, 1, 1,
0.8733089, -1.051196, 2.655928, 0.8705882, 0, 1, 1,
0.8741465, 0.1300031, 1.996366, 0.8784314, 0, 1, 1,
0.8742315, -0.5582358, 2.539008, 0.8823529, 0, 1, 1,
0.8743986, 0.3420832, 0.7031364, 0.8901961, 0, 1, 1,
0.8819243, 0.8933785, 1.714762, 0.8941177, 0, 1, 1,
0.8860294, -0.4171827, 3.997266, 0.9019608, 0, 1, 1,
0.8913622, 0.6678723, 2.230004, 0.9098039, 0, 1, 1,
0.8934288, -0.6428692, 2.774691, 0.9137255, 0, 1, 1,
0.8954023, 0.8301754, 2.246329, 0.9215686, 0, 1, 1,
0.8970606, 0.2750984, 1.181494, 0.9254902, 0, 1, 1,
0.9000345, -1.875368, 3.711408, 0.9333333, 0, 1, 1,
0.9025986, -1.308719, 4.692556, 0.9372549, 0, 1, 1,
0.9039595, 1.277388, 0.5685736, 0.945098, 0, 1, 1,
0.9051523, 0.8233954, 1.412302, 0.9490196, 0, 1, 1,
0.9110388, 1.161788, 0.6851625, 0.9568627, 0, 1, 1,
0.9120625, 0.1304191, 0.431715, 0.9607843, 0, 1, 1,
0.9140208, 0.9435416, -0.3628008, 0.9686275, 0, 1, 1,
0.9268358, 1.286572, 0.7972282, 0.972549, 0, 1, 1,
0.9430203, 0.8688307, 0.4547569, 0.9803922, 0, 1, 1,
0.9446577, 1.540693, 0.39829, 0.9843137, 0, 1, 1,
0.950313, 0.3913255, 3.276057, 0.9921569, 0, 1, 1,
0.9550459, 0.2631071, 3.109635, 0.9960784, 0, 1, 1,
0.955083, 0.4170892, 4.079899, 1, 0, 0.9960784, 1,
0.9577628, 0.2566665, 1.446156, 1, 0, 0.9882353, 1,
0.9695709, -0.3578956, 2.262169, 1, 0, 0.9843137, 1,
0.9770726, 0.2781301, 1.010082, 1, 0, 0.9764706, 1,
0.9832168, -0.1148113, 1.085756, 1, 0, 0.972549, 1,
0.9835538, -0.7560715, 1.849669, 1, 0, 0.9647059, 1,
0.9866999, 0.9622437, 1.970079, 1, 0, 0.9607843, 1,
0.9870703, -1.267347, 1.118026, 1, 0, 0.9529412, 1,
0.9875197, -0.2164525, 1.476552, 1, 0, 0.9490196, 1,
0.9903622, 1.584147, -0.1827243, 1, 0, 0.9411765, 1,
0.9979826, -0.54588, 3.783489, 1, 0, 0.9372549, 1,
1.002621, 0.1905722, 2.622068, 1, 0, 0.9294118, 1,
1.007606, -0.3464005, 3.383384, 1, 0, 0.9254902, 1,
1.009563, -0.7309729, 1.070133, 1, 0, 0.9176471, 1,
1.012136, 0.2790034, 0.4175605, 1, 0, 0.9137255, 1,
1.013313, -0.4554078, 1.413937, 1, 0, 0.9058824, 1,
1.016283, -2.004071, 1.791168, 1, 0, 0.9019608, 1,
1.017149, 0.3306422, 2.093149, 1, 0, 0.8941177, 1,
1.017645, -0.8198324, 4.366177, 1, 0, 0.8862745, 1,
1.02241, -0.8527154, 2.622978, 1, 0, 0.8823529, 1,
1.024609, 0.4220111, 1.579897, 1, 0, 0.8745098, 1,
1.027968, 1.878613, 0.7007575, 1, 0, 0.8705882, 1,
1.030978, 0.756394, 0.9195191, 1, 0, 0.8627451, 1,
1.032713, -2.396148, 1.945414, 1, 0, 0.8588235, 1,
1.034368, 0.8286502, -0.5278619, 1, 0, 0.8509804, 1,
1.0358, 0.8649465, 0.1444449, 1, 0, 0.8470588, 1,
1.042599, -0.2002079, 2.287379, 1, 0, 0.8392157, 1,
1.046787, -0.06568474, 2.499194, 1, 0, 0.8352941, 1,
1.048006, 1.789317, 1.60858, 1, 0, 0.827451, 1,
1.051079, -0.9943393, 1.651625, 1, 0, 0.8235294, 1,
1.059001, -1.248898, 1.950822, 1, 0, 0.8156863, 1,
1.06157, 0.414038, 0.3173145, 1, 0, 0.8117647, 1,
1.062078, -0.003913327, 0.6269341, 1, 0, 0.8039216, 1,
1.062934, 0.1606976, 1.87418, 1, 0, 0.7960784, 1,
1.064895, 0.5344357, 0.9604111, 1, 0, 0.7921569, 1,
1.074039, -0.500885, 2.627132, 1, 0, 0.7843137, 1,
1.082139, 0.5087817, 0.6752183, 1, 0, 0.7803922, 1,
1.083906, 1.442533, 2.858591, 1, 0, 0.772549, 1,
1.087351, 0.5368971, 0.9846222, 1, 0, 0.7686275, 1,
1.087871, 0.8898422, 0.8379838, 1, 0, 0.7607843, 1,
1.091319, -0.1586818, 1.740906, 1, 0, 0.7568628, 1,
1.092908, -0.4065477, -0.006713062, 1, 0, 0.7490196, 1,
1.098182, 0.2844279, 1.444088, 1, 0, 0.7450981, 1,
1.106892, 1.969561, -0.5155213, 1, 0, 0.7372549, 1,
1.10868, -0.5199866, 0.1976497, 1, 0, 0.7333333, 1,
1.110408, -0.01834086, -1.978328, 1, 0, 0.7254902, 1,
1.113994, 0.315147, 1.590054, 1, 0, 0.7215686, 1,
1.122313, -0.7324661, 0.02768238, 1, 0, 0.7137255, 1,
1.123521, 0.2390441, 1.395487, 1, 0, 0.7098039, 1,
1.126524, -1.417882, 3.25588, 1, 0, 0.7019608, 1,
1.12754, 1.57668, 0.1408204, 1, 0, 0.6941177, 1,
1.127576, -0.4464802, 1.409672, 1, 0, 0.6901961, 1,
1.132757, 0.3090054, 1.476086, 1, 0, 0.682353, 1,
1.132894, -0.3403651, 2.303428, 1, 0, 0.6784314, 1,
1.137441, 0.1369293, 0.1122128, 1, 0, 0.6705883, 1,
1.138017, 0.8068179, 1.003656, 1, 0, 0.6666667, 1,
1.13903, 0.9574867, 0.4363094, 1, 0, 0.6588235, 1,
1.145997, -0.5338358, 0.6925958, 1, 0, 0.654902, 1,
1.149376, -0.5644445, 2.887403, 1, 0, 0.6470588, 1,
1.153025, -0.7323706, 1.119238, 1, 0, 0.6431373, 1,
1.155327, -0.08338139, 1.750649, 1, 0, 0.6352941, 1,
1.157709, 0.5942909, 0.06829084, 1, 0, 0.6313726, 1,
1.163586, 0.7892067, 0.1443011, 1, 0, 0.6235294, 1,
1.16677, 2.047246, 2.247143, 1, 0, 0.6196079, 1,
1.167267, 0.562925, -0.2341796, 1, 0, 0.6117647, 1,
1.171688, -0.1185172, 2.342946, 1, 0, 0.6078432, 1,
1.171849, -0.7450069, 1.70819, 1, 0, 0.6, 1,
1.177638, -0.8476475, 1.101567, 1, 0, 0.5921569, 1,
1.181301, 0.05979326, 2.927771, 1, 0, 0.5882353, 1,
1.187565, 1.106429, 0.09250879, 1, 0, 0.5803922, 1,
1.188518, 0.2233447, 1.319934, 1, 0, 0.5764706, 1,
1.206592, 0.7756287, 0.5544407, 1, 0, 0.5686275, 1,
1.217349, -1.316758, 2.111113, 1, 0, 0.5647059, 1,
1.21995, 0.3164124, 1.415792, 1, 0, 0.5568628, 1,
1.220199, -0.4897332, 2.235121, 1, 0, 0.5529412, 1,
1.226181, 0.4139451, 2.261909, 1, 0, 0.5450981, 1,
1.231382, 0.3438352, 1.009925, 1, 0, 0.5411765, 1,
1.235718, -1.159594, 1.866593, 1, 0, 0.5333334, 1,
1.238349, -0.07912943, 1.09351, 1, 0, 0.5294118, 1,
1.239177, 0.8646319, 1.836736, 1, 0, 0.5215687, 1,
1.243533, 1.283209, -0.9033807, 1, 0, 0.5176471, 1,
1.246019, -1.754521, 2.085983, 1, 0, 0.509804, 1,
1.24728, -0.680479, 2.460245, 1, 0, 0.5058824, 1,
1.250137, -0.85095, 2.602644, 1, 0, 0.4980392, 1,
1.256271, 1.89534, 0.4323188, 1, 0, 0.4901961, 1,
1.262363, 2.042128, 0.2504447, 1, 0, 0.4862745, 1,
1.274238, 0.03015314, -0.1711878, 1, 0, 0.4784314, 1,
1.291579, 0.6404158, 2.4803, 1, 0, 0.4745098, 1,
1.294734, 0.3886401, 1.844246, 1, 0, 0.4666667, 1,
1.300666, -1.414613, 1.78112, 1, 0, 0.4627451, 1,
1.301703, -2.503584, 2.163962, 1, 0, 0.454902, 1,
1.303025, 0.8350963, 2.987489, 1, 0, 0.4509804, 1,
1.320236, -0.7956954, 2.569871, 1, 0, 0.4431373, 1,
1.333862, 0.7719709, 1.496561, 1, 0, 0.4392157, 1,
1.348797, -1.309017, 3.097583, 1, 0, 0.4313726, 1,
1.352598, 0.1085185, 0.6566215, 1, 0, 0.427451, 1,
1.354227, 1.259691, 0.9051723, 1, 0, 0.4196078, 1,
1.355318, -0.2712655, 3.838958, 1, 0, 0.4156863, 1,
1.356668, -0.0561669, 0.07910397, 1, 0, 0.4078431, 1,
1.36856, -1.473205, 1.899216, 1, 0, 0.4039216, 1,
1.376171, 0.1433339, 1.183942, 1, 0, 0.3960784, 1,
1.378637, -0.6080813, 0.8969117, 1, 0, 0.3882353, 1,
1.379366, -0.8702927, 3.889343, 1, 0, 0.3843137, 1,
1.381379, -1.613103, 0.7882861, 1, 0, 0.3764706, 1,
1.38336, -0.4261423, 3.611571, 1, 0, 0.372549, 1,
1.391893, 0.09480321, 0.7252515, 1, 0, 0.3647059, 1,
1.394036, 0.5007166, -0.4496697, 1, 0, 0.3607843, 1,
1.400998, -1.041381, 3.183619, 1, 0, 0.3529412, 1,
1.401804, 1.409292, -0.9766249, 1, 0, 0.3490196, 1,
1.429114, -2.087259, 1.444566, 1, 0, 0.3411765, 1,
1.432492, 0.336208, 1.227435, 1, 0, 0.3372549, 1,
1.435594, 0.1631467, 1.377981, 1, 0, 0.3294118, 1,
1.44974, -0.6849403, 2.28106, 1, 0, 0.3254902, 1,
1.45877, 0.5812178, 1.252793, 1, 0, 0.3176471, 1,
1.466416, 0.3285564, 1.17523, 1, 0, 0.3137255, 1,
1.46733, -0.4621613, 2.064942, 1, 0, 0.3058824, 1,
1.470913, 1.217432, 0.4608491, 1, 0, 0.2980392, 1,
1.504437, 0.8664069, 1.244831, 1, 0, 0.2941177, 1,
1.518894, -0.4555753, 1.331117, 1, 0, 0.2862745, 1,
1.542129, 0.3216627, 0.4135775, 1, 0, 0.282353, 1,
1.553031, -0.4387035, 1.352157, 1, 0, 0.2745098, 1,
1.560254, -0.637898, 1.470312, 1, 0, 0.2705882, 1,
1.578905, 1.744475, 0.4680874, 1, 0, 0.2627451, 1,
1.581015, 0.04600267, 2.130488, 1, 0, 0.2588235, 1,
1.592303, -0.19248, 2.180461, 1, 0, 0.2509804, 1,
1.59713, 0.8827735, 0.03943117, 1, 0, 0.2470588, 1,
1.597451, 1.243708, 0.9951757, 1, 0, 0.2392157, 1,
1.609477, 1.020319, 0.4755285, 1, 0, 0.2352941, 1,
1.610941, -0.5582161, 3.109135, 1, 0, 0.227451, 1,
1.61522, -0.049163, -0.6895798, 1, 0, 0.2235294, 1,
1.622477, -0.1815197, 0.6920054, 1, 0, 0.2156863, 1,
1.622785, 0.6920745, 3.11017, 1, 0, 0.2117647, 1,
1.63212, 1.738005, -0.392166, 1, 0, 0.2039216, 1,
1.642152, -0.5730239, 2.489292, 1, 0, 0.1960784, 1,
1.646286, 0.992689, 1.522203, 1, 0, 0.1921569, 1,
1.696599, 1.000621, 1.914241, 1, 0, 0.1843137, 1,
1.711015, -2.576215, 1.666934, 1, 0, 0.1803922, 1,
1.723406, 0.5533514, 0.6998642, 1, 0, 0.172549, 1,
1.747897, 1.224824, 1.351541, 1, 0, 0.1686275, 1,
1.756574, -0.6386947, -0.0612499, 1, 0, 0.1607843, 1,
1.777198, 1.503866, 0.1396904, 1, 0, 0.1568628, 1,
1.801874, -0.1239474, 2.170279, 1, 0, 0.1490196, 1,
1.83475, 0.3275478, 2.298206, 1, 0, 0.145098, 1,
1.848868, -0.4091923, 1.221367, 1, 0, 0.1372549, 1,
1.853394, -0.8644554, 2.048918, 1, 0, 0.1333333, 1,
1.853458, -0.3930312, 2.390621, 1, 0, 0.1254902, 1,
1.867866, 1.283009, 1.155865, 1, 0, 0.1215686, 1,
1.879438, 0.04071279, 0.3200303, 1, 0, 0.1137255, 1,
1.906865, -1.048815, -0.004276057, 1, 0, 0.1098039, 1,
1.918542, -1.114656, 2.003572, 1, 0, 0.1019608, 1,
1.919732, 0.1729147, 2.102599, 1, 0, 0.09411765, 1,
1.933235, -1.046237, 2.387339, 1, 0, 0.09019608, 1,
2.023001, 0.04290237, 2.688017, 1, 0, 0.08235294, 1,
2.048619, -1.578943, 1.948185, 1, 0, 0.07843138, 1,
2.056139, 3.783125, 0.5278921, 1, 0, 0.07058824, 1,
2.077807, 0.1641595, 1.258145, 1, 0, 0.06666667, 1,
2.107741, -0.4561387, 1.870449, 1, 0, 0.05882353, 1,
2.109454, -0.9744164, 2.155272, 1, 0, 0.05490196, 1,
2.132779, 0.8990315, 0.5407678, 1, 0, 0.04705882, 1,
2.163753, -0.3792648, 1.921088, 1, 0, 0.04313726, 1,
2.175581, -0.6294932, 1.399197, 1, 0, 0.03529412, 1,
2.351158, -1.247636, 1.878286, 1, 0, 0.03137255, 1,
2.387172, -2.070407, 1.153944, 1, 0, 0.02352941, 1,
2.411531, 0.9029992, -0.0162938, 1, 0, 0.01960784, 1,
2.512823, -1.579825, 0.784356, 1, 0, 0.01176471, 1,
2.557912, 0.2110312, 2.070478, 1, 0, 0.007843138, 1
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
-0.2260076, -4.192219, -6.850736, 0, -0.5, 0.5, 0.5,
-0.2260076, -4.192219, -6.850736, 1, -0.5, 0.5, 0.5,
-0.2260076, -4.192219, -6.850736, 1, 1.5, 0.5, 0.5,
-0.2260076, -4.192219, -6.850736, 0, 1.5, 0.5, 0.5
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
-3.953676, 0.3734012, -6.850736, 0, -0.5, 0.5, 0.5,
-3.953676, 0.3734012, -6.850736, 1, -0.5, 0.5, 0.5,
-3.953676, 0.3734012, -6.850736, 1, 1.5, 0.5, 0.5,
-3.953676, 0.3734012, -6.850736, 0, 1.5, 0.5, 0.5
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
-3.953676, -4.192219, 0.2497032, 0, -0.5, 0.5, 0.5,
-3.953676, -4.192219, 0.2497032, 1, -0.5, 0.5, 0.5,
-3.953676, -4.192219, 0.2497032, 1, 1.5, 0.5, 0.5,
-3.953676, -4.192219, 0.2497032, 0, 1.5, 0.5, 0.5
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
-3, -3.138614, -5.212173,
2, -3.138614, -5.212173,
-3, -3.138614, -5.212173,
-3, -3.314215, -5.485267,
-2, -3.138614, -5.212173,
-2, -3.314215, -5.485267,
-1, -3.138614, -5.212173,
-1, -3.314215, -5.485267,
0, -3.138614, -5.212173,
0, -3.314215, -5.485267,
1, -3.138614, -5.212173,
1, -3.314215, -5.485267,
2, -3.138614, -5.212173,
2, -3.314215, -5.485267
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
-3, -3.665417, -6.031455, 0, -0.5, 0.5, 0.5,
-3, -3.665417, -6.031455, 1, -0.5, 0.5, 0.5,
-3, -3.665417, -6.031455, 1, 1.5, 0.5, 0.5,
-3, -3.665417, -6.031455, 0, 1.5, 0.5, 0.5,
-2, -3.665417, -6.031455, 0, -0.5, 0.5, 0.5,
-2, -3.665417, -6.031455, 1, -0.5, 0.5, 0.5,
-2, -3.665417, -6.031455, 1, 1.5, 0.5, 0.5,
-2, -3.665417, -6.031455, 0, 1.5, 0.5, 0.5,
-1, -3.665417, -6.031455, 0, -0.5, 0.5, 0.5,
-1, -3.665417, -6.031455, 1, -0.5, 0.5, 0.5,
-1, -3.665417, -6.031455, 1, 1.5, 0.5, 0.5,
-1, -3.665417, -6.031455, 0, 1.5, 0.5, 0.5,
0, -3.665417, -6.031455, 0, -0.5, 0.5, 0.5,
0, -3.665417, -6.031455, 1, -0.5, 0.5, 0.5,
0, -3.665417, -6.031455, 1, 1.5, 0.5, 0.5,
0, -3.665417, -6.031455, 0, 1.5, 0.5, 0.5,
1, -3.665417, -6.031455, 0, -0.5, 0.5, 0.5,
1, -3.665417, -6.031455, 1, -0.5, 0.5, 0.5,
1, -3.665417, -6.031455, 1, 1.5, 0.5, 0.5,
1, -3.665417, -6.031455, 0, 1.5, 0.5, 0.5,
2, -3.665417, -6.031455, 0, -0.5, 0.5, 0.5,
2, -3.665417, -6.031455, 1, -0.5, 0.5, 0.5,
2, -3.665417, -6.031455, 1, 1.5, 0.5, 0.5,
2, -3.665417, -6.031455, 0, 1.5, 0.5, 0.5
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
-3.093444, -3, -5.212173,
-3.093444, 3, -5.212173,
-3.093444, -3, -5.212173,
-3.236816, -3, -5.485267,
-3.093444, -2, -5.212173,
-3.236816, -2, -5.485267,
-3.093444, -1, -5.212173,
-3.236816, -1, -5.485267,
-3.093444, 0, -5.212173,
-3.236816, 0, -5.485267,
-3.093444, 1, -5.212173,
-3.236816, 1, -5.485267,
-3.093444, 2, -5.212173,
-3.236816, 2, -5.485267,
-3.093444, 3, -5.212173,
-3.236816, 3, -5.485267
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
-3.52356, -3, -6.031455, 0, -0.5, 0.5, 0.5,
-3.52356, -3, -6.031455, 1, -0.5, 0.5, 0.5,
-3.52356, -3, -6.031455, 1, 1.5, 0.5, 0.5,
-3.52356, -3, -6.031455, 0, 1.5, 0.5, 0.5,
-3.52356, -2, -6.031455, 0, -0.5, 0.5, 0.5,
-3.52356, -2, -6.031455, 1, -0.5, 0.5, 0.5,
-3.52356, -2, -6.031455, 1, 1.5, 0.5, 0.5,
-3.52356, -2, -6.031455, 0, 1.5, 0.5, 0.5,
-3.52356, -1, -6.031455, 0, -0.5, 0.5, 0.5,
-3.52356, -1, -6.031455, 1, -0.5, 0.5, 0.5,
-3.52356, -1, -6.031455, 1, 1.5, 0.5, 0.5,
-3.52356, -1, -6.031455, 0, 1.5, 0.5, 0.5,
-3.52356, 0, -6.031455, 0, -0.5, 0.5, 0.5,
-3.52356, 0, -6.031455, 1, -0.5, 0.5, 0.5,
-3.52356, 0, -6.031455, 1, 1.5, 0.5, 0.5,
-3.52356, 0, -6.031455, 0, 1.5, 0.5, 0.5,
-3.52356, 1, -6.031455, 0, -0.5, 0.5, 0.5,
-3.52356, 1, -6.031455, 1, -0.5, 0.5, 0.5,
-3.52356, 1, -6.031455, 1, 1.5, 0.5, 0.5,
-3.52356, 1, -6.031455, 0, 1.5, 0.5, 0.5,
-3.52356, 2, -6.031455, 0, -0.5, 0.5, 0.5,
-3.52356, 2, -6.031455, 1, -0.5, 0.5, 0.5,
-3.52356, 2, -6.031455, 1, 1.5, 0.5, 0.5,
-3.52356, 2, -6.031455, 0, 1.5, 0.5, 0.5,
-3.52356, 3, -6.031455, 0, -0.5, 0.5, 0.5,
-3.52356, 3, -6.031455, 1, -0.5, 0.5, 0.5,
-3.52356, 3, -6.031455, 1, 1.5, 0.5, 0.5,
-3.52356, 3, -6.031455, 0, 1.5, 0.5, 0.5
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
-3.093444, -3.138614, -4,
-3.093444, -3.138614, 4,
-3.093444, -3.138614, -4,
-3.236816, -3.314215, -4,
-3.093444, -3.138614, -2,
-3.236816, -3.314215, -2,
-3.093444, -3.138614, 0,
-3.236816, -3.314215, 0,
-3.093444, -3.138614, 2,
-3.236816, -3.314215, 2,
-3.093444, -3.138614, 4,
-3.236816, -3.314215, 4
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
-3.52356, -3.665417, -4, 0, -0.5, 0.5, 0.5,
-3.52356, -3.665417, -4, 1, -0.5, 0.5, 0.5,
-3.52356, -3.665417, -4, 1, 1.5, 0.5, 0.5,
-3.52356, -3.665417, -4, 0, 1.5, 0.5, 0.5,
-3.52356, -3.665417, -2, 0, -0.5, 0.5, 0.5,
-3.52356, -3.665417, -2, 1, -0.5, 0.5, 0.5,
-3.52356, -3.665417, -2, 1, 1.5, 0.5, 0.5,
-3.52356, -3.665417, -2, 0, 1.5, 0.5, 0.5,
-3.52356, -3.665417, 0, 0, -0.5, 0.5, 0.5,
-3.52356, -3.665417, 0, 1, -0.5, 0.5, 0.5,
-3.52356, -3.665417, 0, 1, 1.5, 0.5, 0.5,
-3.52356, -3.665417, 0, 0, 1.5, 0.5, 0.5,
-3.52356, -3.665417, 2, 0, -0.5, 0.5, 0.5,
-3.52356, -3.665417, 2, 1, -0.5, 0.5, 0.5,
-3.52356, -3.665417, 2, 1, 1.5, 0.5, 0.5,
-3.52356, -3.665417, 2, 0, 1.5, 0.5, 0.5,
-3.52356, -3.665417, 4, 0, -0.5, 0.5, 0.5,
-3.52356, -3.665417, 4, 1, -0.5, 0.5, 0.5,
-3.52356, -3.665417, 4, 1, 1.5, 0.5, 0.5,
-3.52356, -3.665417, 4, 0, 1.5, 0.5, 0.5
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
-3.093444, -3.138614, -5.212173,
-3.093444, 3.885417, -5.212173,
-3.093444, -3.138614, 5.71158,
-3.093444, 3.885417, 5.71158,
-3.093444, -3.138614, -5.212173,
-3.093444, -3.138614, 5.71158,
-3.093444, 3.885417, -5.212173,
-3.093444, 3.885417, 5.71158,
-3.093444, -3.138614, -5.212173,
2.641429, -3.138614, -5.212173,
-3.093444, -3.138614, 5.71158,
2.641429, -3.138614, 5.71158,
-3.093444, 3.885417, -5.212173,
2.641429, 3.885417, -5.212173,
-3.093444, 3.885417, 5.71158,
2.641429, 3.885417, 5.71158,
2.641429, -3.138614, -5.212173,
2.641429, 3.885417, -5.212173,
2.641429, -3.138614, 5.71158,
2.641429, 3.885417, 5.71158,
2.641429, -3.138614, -5.212173,
2.641429, -3.138614, 5.71158,
2.641429, 3.885417, -5.212173,
2.641429, 3.885417, 5.71158
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
var radius = 7.58091;
var distance = 33.72832;
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
mvMatrix.translate( 0.2260076, -0.3734012, -0.2497032 );
mvMatrix.scale( 1.429261, 1.166941, 0.7503492 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.72832);
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
Phosmet<-read.table("Phosmet.xyz")
```

```
## Error in read.table("Phosmet.xyz"): no lines available in input
```

```r
x<-Phosmet$V2
```

```
## Error in eval(expr, envir, enclos): object 'Phosmet' not found
```

```r
y<-Phosmet$V3
```

```
## Error in eval(expr, envir, enclos): object 'Phosmet' not found
```

```r
z<-Phosmet$V4
```

```
## Error in eval(expr, envir, enclos): object 'Phosmet' not found
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
-3.009927, 1.97889, -1.581191, 0, 0, 1, 1, 1,
-2.771513, 2.01109, -0.08846714, 1, 0, 0, 1, 1,
-2.715508, -1.178816, -3.457655, 1, 0, 0, 1, 1,
-2.627706, 0.4159375, -1.716325, 1, 0, 0, 1, 1,
-2.593563, 0.2482046, -1.582774, 1, 0, 0, 1, 1,
-2.527424, -0.10126, -0.8322893, 1, 0, 0, 1, 1,
-2.506521, 0.1267462, -1.357451, 0, 0, 0, 1, 1,
-2.490334, 1.515886, -2.626594, 0, 0, 0, 1, 1,
-2.430565, 0.5347844, -0.7248249, 0, 0, 0, 1, 1,
-2.407394, 0.6219358, -2.207908, 0, 0, 0, 1, 1,
-2.311126, -0.2158293, -3.462695, 0, 0, 0, 1, 1,
-2.307722, 0.06008219, -2.094383, 0, 0, 0, 1, 1,
-2.239704, -0.1705621, -0.9647961, 0, 0, 0, 1, 1,
-2.235894, -1.383497, -0.07452179, 1, 1, 1, 1, 1,
-2.235365, -0.3144046, 0.03706131, 1, 1, 1, 1, 1,
-2.212412, -0.7953712, 0.1912014, 1, 1, 1, 1, 1,
-2.192634, 0.08192527, -2.066553, 1, 1, 1, 1, 1,
-2.132647, 1.793384, -0.5664604, 1, 1, 1, 1, 1,
-2.130871, 1.424538, -1.412314, 1, 1, 1, 1, 1,
-2.125812, 0.8759582, 0.5279682, 1, 1, 1, 1, 1,
-2.11388, -0.3576313, -1.266359, 1, 1, 1, 1, 1,
-2.100522, 0.8822302, -2.111016, 1, 1, 1, 1, 1,
-2.064699, 0.3994681, -1.969613, 1, 1, 1, 1, 1,
-2.048212, 0.08211559, -1.894479, 1, 1, 1, 1, 1,
-2.013456, -0.04778675, -2.14091, 1, 1, 1, 1, 1,
-2.011248, 0.05864279, -1.302523, 1, 1, 1, 1, 1,
-2.00428, 0.8026662, -1.269524, 1, 1, 1, 1, 1,
-1.989553, -1.468316, -2.32684, 1, 1, 1, 1, 1,
-1.965744, 0.08631554, -3.23572, 0, 0, 1, 1, 1,
-1.957201, 0.2197286, -0.9485261, 1, 0, 0, 1, 1,
-1.936301, 0.414729, -1.818617, 1, 0, 0, 1, 1,
-1.931723, -0.2335335, -2.239615, 1, 0, 0, 1, 1,
-1.915143, -0.8169295, -2.678118, 1, 0, 0, 1, 1,
-1.915092, 1.143861, -1.898002, 1, 0, 0, 1, 1,
-1.840576, 0.2241858, -1.153491, 0, 0, 0, 1, 1,
-1.811174, -1.761514, -2.500546, 0, 0, 0, 1, 1,
-1.799345, 0.03632237, -2.396036, 0, 0, 0, 1, 1,
-1.797031, -0.4993322, -1.756487, 0, 0, 0, 1, 1,
-1.793686, -0.6340966, -1.132113, 0, 0, 0, 1, 1,
-1.787038, 0.7524447, -0.604014, 0, 0, 0, 1, 1,
-1.781688, -0.4574824, -0.7286482, 0, 0, 0, 1, 1,
-1.780038, 0.08584445, -1.546343, 1, 1, 1, 1, 1,
-1.770415, 0.4311388, -2.658082, 1, 1, 1, 1, 1,
-1.766322, 0.2661022, -1.388293, 1, 1, 1, 1, 1,
-1.759486, -0.5445938, -1.73614, 1, 1, 1, 1, 1,
-1.732868, 1.126506, -1.633708, 1, 1, 1, 1, 1,
-1.723705, 0.4265815, -1.623509, 1, 1, 1, 1, 1,
-1.709689, -0.02844987, -0.8444576, 1, 1, 1, 1, 1,
-1.702612, 0.4392223, -1.356575, 1, 1, 1, 1, 1,
-1.699678, 0.09142776, -2.126584, 1, 1, 1, 1, 1,
-1.688245, -1.134639, -2.63436, 1, 1, 1, 1, 1,
-1.658708, -0.9045886, -3.615571, 1, 1, 1, 1, 1,
-1.649857, -0.6834177, -0.2183311, 1, 1, 1, 1, 1,
-1.636623, 0.30123, -0.7353678, 1, 1, 1, 1, 1,
-1.633181, -0.9146989, -1.375496, 1, 1, 1, 1, 1,
-1.618332, 0.5992059, -2.794618, 1, 1, 1, 1, 1,
-1.516227, -0.650699, -2.182814, 0, 0, 1, 1, 1,
-1.493507, 0.4388407, 0.09279713, 1, 0, 0, 1, 1,
-1.485575, -0.8204576, -1.315999, 1, 0, 0, 1, 1,
-1.470162, 2.11792, -1.432459, 1, 0, 0, 1, 1,
-1.45498, -0.09308212, -0.724686, 1, 0, 0, 1, 1,
-1.453372, 0.9123152, -0.3254102, 1, 0, 0, 1, 1,
-1.452841, 0.4973329, -1.29581, 0, 0, 0, 1, 1,
-1.447473, 1.26147, 0.7391188, 0, 0, 0, 1, 1,
-1.445518, 1.046319, -0.5974311, 0, 0, 0, 1, 1,
-1.437105, 0.3013322, -1.840992, 0, 0, 0, 1, 1,
-1.43166, 1.63529, -1.33614, 0, 0, 0, 1, 1,
-1.428213, 1.164009, -2.230245, 0, 0, 0, 1, 1,
-1.425875, 0.6569591, -1.11329, 0, 0, 0, 1, 1,
-1.403714, -1.169835, -4.536422, 1, 1, 1, 1, 1,
-1.39307, -1.053975, -2.827204, 1, 1, 1, 1, 1,
-1.39149, 1.427308, -0.2580769, 1, 1, 1, 1, 1,
-1.387031, 0.543772, -1.65803, 1, 1, 1, 1, 1,
-1.374243, 0.1126217, -1.170326, 1, 1, 1, 1, 1,
-1.372942, 1.337582, -1.884111, 1, 1, 1, 1, 1,
-1.36653, 1.856877, -1.253393, 1, 1, 1, 1, 1,
-1.356251, 1.150862, -1.701069, 1, 1, 1, 1, 1,
-1.348962, -1.596911, -4.922196, 1, 1, 1, 1, 1,
-1.339252, 0.8527328, -2.454327, 1, 1, 1, 1, 1,
-1.331457, 0.4695591, -1.228063, 1, 1, 1, 1, 1,
-1.32956, 0.02389403, -2.229459, 1, 1, 1, 1, 1,
-1.323079, 0.6916516, -0.1035391, 1, 1, 1, 1, 1,
-1.314471, -0.8288423, -1.825677, 1, 1, 1, 1, 1,
-1.311122, -0.9981163, -2.741622, 1, 1, 1, 1, 1,
-1.305306, -0.2499448, -1.362478, 0, 0, 1, 1, 1,
-1.282749, 1.493191, 0.9879214, 1, 0, 0, 1, 1,
-1.277129, 1.91979, -0.7925703, 1, 0, 0, 1, 1,
-1.274008, 0.5232862, -2.93663, 1, 0, 0, 1, 1,
-1.268668, 0.9236125, -1.329522, 1, 0, 0, 1, 1,
-1.267584, -0.3332298, -2.42191, 1, 0, 0, 1, 1,
-1.267107, -1.399564, -1.780544, 0, 0, 0, 1, 1,
-1.265705, 0.2310113, -1.559278, 0, 0, 0, 1, 1,
-1.253292, 0.5008199, 0.1613159, 0, 0, 0, 1, 1,
-1.252673, -0.2099694, -1.941815, 0, 0, 0, 1, 1,
-1.251628, -0.01660708, -1.600657, 0, 0, 0, 1, 1,
-1.251367, 1.275695, -2.075333, 0, 0, 0, 1, 1,
-1.2509, 1.063739, 0.2556396, 0, 0, 0, 1, 1,
-1.248696, -0.7772041, -2.256733, 1, 1, 1, 1, 1,
-1.247049, -1.046322, -0.9379177, 1, 1, 1, 1, 1,
-1.240675, -1.395075, -2.342827, 1, 1, 1, 1, 1,
-1.237003, 2.331424, 1.625697, 1, 1, 1, 1, 1,
-1.224072, 0.6090392, -0.005394808, 1, 1, 1, 1, 1,
-1.216304, -1.60983, -2.20681, 1, 1, 1, 1, 1,
-1.212523, 0.4015894, -0.8596751, 1, 1, 1, 1, 1,
-1.210703, 0.4892255, -0.7789587, 1, 1, 1, 1, 1,
-1.197599, 0.500904, -2.307648, 1, 1, 1, 1, 1,
-1.195205, -0.9832221, -2.460673, 1, 1, 1, 1, 1,
-1.189585, 0.4607522, -1.261112, 1, 1, 1, 1, 1,
-1.18583, -0.2462302, -2.755801, 1, 1, 1, 1, 1,
-1.185518, 1.585286, -0.4393868, 1, 1, 1, 1, 1,
-1.184796, -0.1227475, -0.3844625, 1, 1, 1, 1, 1,
-1.18471, 0.7631433, -2.889759, 1, 1, 1, 1, 1,
-1.182518, 0.1848802, -1.517897, 0, 0, 1, 1, 1,
-1.169776, 0.5310187, -2.040274, 1, 0, 0, 1, 1,
-1.154161, 1.660815, -1.033964, 1, 0, 0, 1, 1,
-1.140274, -0.3791472, -1.472566, 1, 0, 0, 1, 1,
-1.134898, 2.477268, -0.1685226, 1, 0, 0, 1, 1,
-1.126503, -0.01209517, 0.6897764, 1, 0, 0, 1, 1,
-1.117923, -0.8097499, 0.2052336, 0, 0, 0, 1, 1,
-1.112984, 0.5199792, -1.332432, 0, 0, 0, 1, 1,
-1.112387, -0.7637128, -3.455792, 0, 0, 0, 1, 1,
-1.098261, 3.651451e-05, -0.1927366, 0, 0, 0, 1, 1,
-1.086168, -0.2304167, -0.9092808, 0, 0, 0, 1, 1,
-1.083035, -1.194669, -2.719383, 0, 0, 0, 1, 1,
-1.077115, 0.7272226, -0.8689007, 0, 0, 0, 1, 1,
-1.076471, -0.4991665, -1.88444, 1, 1, 1, 1, 1,
-1.071905, 0.4360487, -2.238271, 1, 1, 1, 1, 1,
-1.06828, 1.293212, -1.618549, 1, 1, 1, 1, 1,
-1.06791, -0.09707048, -1.62758, 1, 1, 1, 1, 1,
-1.06085, 1.187833, 0.6068621, 1, 1, 1, 1, 1,
-1.054483, -1.497275, -2.719333, 1, 1, 1, 1, 1,
-1.053784, -0.9119939, -2.627121, 1, 1, 1, 1, 1,
-1.046992, 1.315697, -1.302832, 1, 1, 1, 1, 1,
-1.040038, 0.9165828, 1.346402, 1, 1, 1, 1, 1,
-1.036218, 0.07767445, -0.8070961, 1, 1, 1, 1, 1,
-1.034104, 0.06844343, -2.204478, 1, 1, 1, 1, 1,
-1.029221, 0.3874402, -2.043725, 1, 1, 1, 1, 1,
-1.027502, 0.2944005, -0.7445304, 1, 1, 1, 1, 1,
-1.023719, -0.9645236, -2.211779, 1, 1, 1, 1, 1,
-1.019667, 0.622445, -1.904881, 1, 1, 1, 1, 1,
-1.017437, 0.7863983, -0.4054982, 0, 0, 1, 1, 1,
-1.009548, 0.6102741, -0.6686046, 1, 0, 0, 1, 1,
-1.006848, -0.9902925, -2.285126, 1, 0, 0, 1, 1,
-1.004231, 0.07344092, -0.4776194, 1, 0, 0, 1, 1,
-1.00357, -0.8463121, -1.93348, 1, 0, 0, 1, 1,
-1.00168, 0.3926315, -0.7410774, 1, 0, 0, 1, 1,
-1.000541, 0.578432, -0.2997852, 0, 0, 0, 1, 1,
-0.9995951, -0.6216329, -1.407216, 0, 0, 0, 1, 1,
-0.9902361, 0.5960471, -0.9098028, 0, 0, 0, 1, 1,
-0.9868373, 0.5438546, -0.124177, 0, 0, 0, 1, 1,
-0.9836143, -1.137506, -1.77289, 0, 0, 0, 1, 1,
-0.980715, 0.726459, -0.7446546, 0, 0, 0, 1, 1,
-0.9761709, 1.615425, 0.2425717, 0, 0, 0, 1, 1,
-0.9748503, -0.2192722, -2.402766, 1, 1, 1, 1, 1,
-0.973749, -0.2187625, -1.291671, 1, 1, 1, 1, 1,
-0.9737247, -2.577462, -1.998922, 1, 1, 1, 1, 1,
-0.9733324, -0.2735633, -1.376067, 1, 1, 1, 1, 1,
-0.9670597, -0.634498, -1.028064, 1, 1, 1, 1, 1,
-0.9655992, 0.447709, -0.6959731, 1, 1, 1, 1, 1,
-0.9655606, -1.616716, -2.153663, 1, 1, 1, 1, 1,
-0.9604909, 0.1147562, -2.314615, 1, 1, 1, 1, 1,
-0.958267, 0.2589048, -0.6061162, 1, 1, 1, 1, 1,
-0.9559208, 0.2649444, -1.684708, 1, 1, 1, 1, 1,
-0.9553519, -0.3713305, -3.490292, 1, 1, 1, 1, 1,
-0.9536263, 0.6889807, -0.3275566, 1, 1, 1, 1, 1,
-0.9505233, 1.307082, -0.3649622, 1, 1, 1, 1, 1,
-0.9487205, 0.7902752, -0.9469255, 1, 1, 1, 1, 1,
-0.9457439, 0.1567931, -1.683606, 1, 1, 1, 1, 1,
-0.9346958, -0.7441455, -1.723806, 0, 0, 1, 1, 1,
-0.9322501, -1.353492, -2.865483, 1, 0, 0, 1, 1,
-0.9303085, 0.3484744, -1.170894, 1, 0, 0, 1, 1,
-0.9299048, -1.551259, -1.377185, 1, 0, 0, 1, 1,
-0.9249274, -1.658341, -2.791484, 1, 0, 0, 1, 1,
-0.9191924, -0.1904116, -2.160045, 1, 0, 0, 1, 1,
-0.9143625, 0.1236601, -2.070008, 0, 0, 0, 1, 1,
-0.9123934, -0.5348833, -2.495489, 0, 0, 0, 1, 1,
-0.9077791, 1.029735, -1.756534, 0, 0, 0, 1, 1,
-0.9002149, -1.003628, -2.027073, 0, 0, 0, 1, 1,
-0.8952619, -0.9591041, -3.652714, 0, 0, 0, 1, 1,
-0.8937809, 0.2200787, -2.791274, 0, 0, 0, 1, 1,
-0.8874027, 0.1368041, -2.07573, 0, 0, 0, 1, 1,
-0.8851569, -0.2324423, -0.987239, 1, 1, 1, 1, 1,
-0.8826658, -1.192315, -3.720819, 1, 1, 1, 1, 1,
-0.8719263, 1.272984, 1.810386, 1, 1, 1, 1, 1,
-0.8686445, 0.4326447, -1.944684, 1, 1, 1, 1, 1,
-0.8622729, 0.2770303, -2.833971, 1, 1, 1, 1, 1,
-0.8612994, -0.686596, -2.344365, 1, 1, 1, 1, 1,
-0.8587213, 0.01385578, -1.377246, 1, 1, 1, 1, 1,
-0.8533087, -0.5805869, -1.887557, 1, 1, 1, 1, 1,
-0.8531177, 0.4900626, 0.3137579, 1, 1, 1, 1, 1,
-0.8512652, 0.1209577, -0.599314, 1, 1, 1, 1, 1,
-0.8457129, -0.5221406, -3.533183, 1, 1, 1, 1, 1,
-0.8451314, -0.2427148, -0.3202572, 1, 1, 1, 1, 1,
-0.8435919, -0.7379807, -0.3607914, 1, 1, 1, 1, 1,
-0.8360441, -0.4674682, -1.296843, 1, 1, 1, 1, 1,
-0.8356892, 0.01073878, -2.265564, 1, 1, 1, 1, 1,
-0.824421, 0.07361335, -0.3272594, 0, 0, 1, 1, 1,
-0.8155952, -0.3558082, -2.034353, 1, 0, 0, 1, 1,
-0.8074931, -0.01845178, -0.6284598, 1, 0, 0, 1, 1,
-0.8057284, -1.086637, -3.412596, 1, 0, 0, 1, 1,
-0.8017691, -0.4215145, -1.978693, 1, 0, 0, 1, 1,
-0.7998393, 0.1201414, -1.509949, 1, 0, 0, 1, 1,
-0.7992573, 0.8217587, 0.06707446, 0, 0, 0, 1, 1,
-0.7991654, 2.590072, -0.1568627, 0, 0, 0, 1, 1,
-0.7926981, -0.09907477, -1.836624, 0, 0, 0, 1, 1,
-0.7912612, 0.8778508, 0.2807542, 0, 0, 0, 1, 1,
-0.7897554, 0.359054, -0.6003494, 0, 0, 0, 1, 1,
-0.7896332, -0.2425389, -4.34012, 0, 0, 0, 1, 1,
-0.787388, -0.9652967, -2.991154, 0, 0, 0, 1, 1,
-0.7838335, -0.2082314, -1.538144, 1, 1, 1, 1, 1,
-0.7788478, 0.3896242, -1.32371, 1, 1, 1, 1, 1,
-0.7780505, -0.4004139, -1.19388, 1, 1, 1, 1, 1,
-0.7773721, 2.842784, -0.6353409, 1, 1, 1, 1, 1,
-0.7757856, -1.032551, -2.642253, 1, 1, 1, 1, 1,
-0.7734804, 1.712673, -0.1686361, 1, 1, 1, 1, 1,
-0.7589027, 1.452676, -1.313663, 1, 1, 1, 1, 1,
-0.756707, 0.4368846, -1.258234, 1, 1, 1, 1, 1,
-0.7515995, -0.3417273, -2.008976, 1, 1, 1, 1, 1,
-0.7420892, -1.636504, -2.940473, 1, 1, 1, 1, 1,
-0.7336155, -0.3040815, -1.143705, 1, 1, 1, 1, 1,
-0.7231308, 0.4197339, 0.4001152, 1, 1, 1, 1, 1,
-0.7214007, 0.1494038, -2.621463, 1, 1, 1, 1, 1,
-0.7168424, 1.098288, -1.704674, 1, 1, 1, 1, 1,
-0.7138106, 0.8317333, 0.6487845, 1, 1, 1, 1, 1,
-0.7100762, 0.7819249, -0.9596218, 0, 0, 1, 1, 1,
-0.7100371, 2.06622, -0.4236951, 1, 0, 0, 1, 1,
-0.7087262, -0.6041912, -2.607698, 1, 0, 0, 1, 1,
-0.7013947, 1.56739, -1.820706, 1, 0, 0, 1, 1,
-0.6953724, 0.2411362, -1.3605, 1, 0, 0, 1, 1,
-0.6906883, -0.3796673, -0.9725419, 1, 0, 0, 1, 1,
-0.6901286, 0.1567719, -0.6886733, 0, 0, 0, 1, 1,
-0.6840436, -0.05787695, -1.344259, 0, 0, 0, 1, 1,
-0.678676, -0.2746504, -1.28229, 0, 0, 0, 1, 1,
-0.6755983, 0.3765505, -1.561432, 0, 0, 0, 1, 1,
-0.6659982, -0.07814395, -1.502337, 0, 0, 0, 1, 1,
-0.6644179, 1.99221, 0.004793254, 0, 0, 0, 1, 1,
-0.6568806, -0.9932162, -1.548412, 0, 0, 0, 1, 1,
-0.6532593, -1.41036, -5.010826, 1, 1, 1, 1, 1,
-0.6458278, 1.20888, -0.3645934, 1, 1, 1, 1, 1,
-0.637915, 0.1675363, -2.328836, 1, 1, 1, 1, 1,
-0.63205, -1.632772, -1.667561, 1, 1, 1, 1, 1,
-0.6307628, 0.5380777, -1.280887, 1, 1, 1, 1, 1,
-0.6234902, -0.7066095, -1.555953, 1, 1, 1, 1, 1,
-0.6085101, -0.2315625, -1.463551, 1, 1, 1, 1, 1,
-0.6017919, -0.481487, -2.729156, 1, 1, 1, 1, 1,
-0.6005866, 0.8543069, -2.167461, 1, 1, 1, 1, 1,
-0.595791, 0.2206745, -1.194051, 1, 1, 1, 1, 1,
-0.5954691, 0.09066394, -0.1176314, 1, 1, 1, 1, 1,
-0.5952226, 1.83386, 0.1874735, 1, 1, 1, 1, 1,
-0.5951771, 0.5203593, -0.4300697, 1, 1, 1, 1, 1,
-0.5933281, -0.8334852, -2.76727, 1, 1, 1, 1, 1,
-0.5914537, 0.2183721, -1.916284, 1, 1, 1, 1, 1,
-0.5911818, -1.180966, -1.485666, 0, 0, 1, 1, 1,
-0.5897862, -0.2042891, -1.629761, 1, 0, 0, 1, 1,
-0.5867934, 0.2660053, 1.068715, 1, 0, 0, 1, 1,
-0.5860612, -0.7388047, -2.023519, 1, 0, 0, 1, 1,
-0.5764213, -1.438351, -2.307421, 1, 0, 0, 1, 1,
-0.5731317, 0.7664145, -1.854145, 1, 0, 0, 1, 1,
-0.5721849, -1.18591, -3.22461, 0, 0, 0, 1, 1,
-0.5718918, -0.059154, -2.304945, 0, 0, 0, 1, 1,
-0.5694025, -2.028264, -2.509444, 0, 0, 0, 1, 1,
-0.5675973, 0.4562477, -1.724596, 0, 0, 0, 1, 1,
-0.5671132, -0.09577629, -2.199164, 0, 0, 0, 1, 1,
-0.564727, 0.09045263, -2.145288, 0, 0, 0, 1, 1,
-0.5623887, -1.2387, -3.495477, 0, 0, 0, 1, 1,
-0.5590043, -0.5220048, -3.765303, 1, 1, 1, 1, 1,
-0.5513316, 0.5733364, 0.3594317, 1, 1, 1, 1, 1,
-0.550883, 2.480935, -1.26701, 1, 1, 1, 1, 1,
-0.5499133, -1.628827, -2.232325, 1, 1, 1, 1, 1,
-0.5484089, -0.205583, -3.266575, 1, 1, 1, 1, 1,
-0.5410116, -0.7093748, -2.874896, 1, 1, 1, 1, 1,
-0.5365061, -0.9090712, -0.590977, 1, 1, 1, 1, 1,
-0.5315254, 1.306542, -0.7000644, 1, 1, 1, 1, 1,
-0.5289176, 0.3160708, -1.841549, 1, 1, 1, 1, 1,
-0.52848, -0.03932824, -2.194468, 1, 1, 1, 1, 1,
-0.5268258, 0.8172684, 2.053139, 1, 1, 1, 1, 1,
-0.5259612, 0.6208196, -0.08774274, 1, 1, 1, 1, 1,
-0.5253949, 0.2148498, -3.032294, 1, 1, 1, 1, 1,
-0.5250486, 0.2378777, -1.546682, 1, 1, 1, 1, 1,
-0.5248831, -2.537221, -3.843798, 1, 1, 1, 1, 1,
-0.5242682, 0.2147634, -1.159855, 0, 0, 1, 1, 1,
-0.524147, -0.07198817, -0.4215827, 1, 0, 0, 1, 1,
-0.5203309, 0.6247492, -0.4619822, 1, 0, 0, 1, 1,
-0.5184286, 0.2908645, -2.037956, 1, 0, 0, 1, 1,
-0.5172547, -0.1218162, -2.972582, 1, 0, 0, 1, 1,
-0.5170117, -0.2087849, -0.6726578, 1, 0, 0, 1, 1,
-0.5162429, -0.02075757, -1.25535, 0, 0, 0, 1, 1,
-0.5143862, 0.1899678, -0.5125049, 0, 0, 0, 1, 1,
-0.5037826, -0.7887468, -3.058649, 0, 0, 0, 1, 1,
-0.5017402, 0.6126785, 0.2644368, 0, 0, 0, 1, 1,
-0.4990183, 0.7966439, -0.2067586, 0, 0, 0, 1, 1,
-0.4989392, 0.1790911, -1.494951, 0, 0, 0, 1, 1,
-0.4981757, -0.0127966, -2.092154, 0, 0, 0, 1, 1,
-0.49782, 1.208529, 0.3378793, 1, 1, 1, 1, 1,
-0.4978154, 0.252465, -0.05390493, 1, 1, 1, 1, 1,
-0.4938627, -0.2047802, -1.432936, 1, 1, 1, 1, 1,
-0.4931133, 0.6413014, -0.864439, 1, 1, 1, 1, 1,
-0.4854735, 0.9524122, -3.614801, 1, 1, 1, 1, 1,
-0.4836148, 0.02377472, -1.094307, 1, 1, 1, 1, 1,
-0.4816143, 1.903986, 0.01476585, 1, 1, 1, 1, 1,
-0.4793639, -1.435163, -3.468219, 1, 1, 1, 1, 1,
-0.4742924, -0.5011381, -1.129023, 1, 1, 1, 1, 1,
-0.4722146, 0.6497913, -0.2505504, 1, 1, 1, 1, 1,
-0.4693728, 0.4234625, -1.835342, 1, 1, 1, 1, 1,
-0.4673067, -0.5565707, -1.96573, 1, 1, 1, 1, 1,
-0.4636821, 0.004443381, -2.088261, 1, 1, 1, 1, 1,
-0.4584232, 0.5358645, -1.31875, 1, 1, 1, 1, 1,
-0.4579601, -1.97318, -1.903218, 1, 1, 1, 1, 1,
-0.4554336, 0.2529413, -1.364891, 0, 0, 1, 1, 1,
-0.4542186, 1.691603, 0.8206029, 1, 0, 0, 1, 1,
-0.453264, 0.1905533, -1.863757, 1, 0, 0, 1, 1,
-0.450107, 0.451802, -0.2947193, 1, 0, 0, 1, 1,
-0.4470144, 0.9170545, -1.669416, 1, 0, 0, 1, 1,
-0.4469706, 0.2548105, -1.5575, 1, 0, 0, 1, 1,
-0.4347769, 0.3226842, -1.512087, 0, 0, 0, 1, 1,
-0.4313637, 0.1941088, -1.54665, 0, 0, 0, 1, 1,
-0.4306035, 1.695993, -1.055615, 0, 0, 0, 1, 1,
-0.4255497, 0.5633394, -1.086444, 0, 0, 0, 1, 1,
-0.4179852, 0.0981674, -0.9714491, 0, 0, 0, 1, 1,
-0.417906, 1.991247, -0.04390736, 0, 0, 0, 1, 1,
-0.4170321, -2.265977, -3.439867, 0, 0, 0, 1, 1,
-0.4086527, 2.351723, 0.09197225, 1, 1, 1, 1, 1,
-0.403121, -0.07268775, -2.041731, 1, 1, 1, 1, 1,
-0.3974938, -0.3102332, -4.096241, 1, 1, 1, 1, 1,
-0.3965131, 1.621634, 0.7213073, 1, 1, 1, 1, 1,
-0.392234, -1.570455, -2.876658, 1, 1, 1, 1, 1,
-0.3906946, 0.7350416, 0.002525439, 1, 1, 1, 1, 1,
-0.3881319, 0.8042225, -1.515355, 1, 1, 1, 1, 1,
-0.3865506, -1.128042, -1.26885, 1, 1, 1, 1, 1,
-0.385805, 0.7761725, -1.605877, 1, 1, 1, 1, 1,
-0.3853579, 0.5149528, 0.006604059, 1, 1, 1, 1, 1,
-0.3841099, 1.157224, -0.5762279, 1, 1, 1, 1, 1,
-0.3660462, -0.6140269, -3.494327, 1, 1, 1, 1, 1,
-0.3657582, -0.6091789, -2.472939, 1, 1, 1, 1, 1,
-0.3633782, -0.4089218, -3.325965, 1, 1, 1, 1, 1,
-0.3541769, -1.638638, -3.30306, 1, 1, 1, 1, 1,
-0.3530878, -0.9909605, -1.708082, 0, 0, 1, 1, 1,
-0.3520076, 0.5544398, 0.2481686, 1, 0, 0, 1, 1,
-0.3489888, -0.7484283, -3.96912, 1, 0, 0, 1, 1,
-0.34873, 1.263465, -0.70309, 1, 0, 0, 1, 1,
-0.3413482, 1.034466, -0.7233921, 1, 0, 0, 1, 1,
-0.3409602, 0.2786449, -1.337749, 1, 0, 0, 1, 1,
-0.3340548, -2.177058, -1.826589, 0, 0, 0, 1, 1,
-0.3338167, -0.6306399, -2.711865, 0, 0, 0, 1, 1,
-0.3336163, 1.446054, -1.950338, 0, 0, 0, 1, 1,
-0.3237086, 0.2198924, -3.670078, 0, 0, 0, 1, 1,
-0.3211634, -0.1083466, -2.246206, 0, 0, 0, 1, 1,
-0.3205383, 0.7807667, 0.04497286, 0, 0, 0, 1, 1,
-0.3187981, 0.3230005, -1.074986, 0, 0, 0, 1, 1,
-0.3161817, 0.03015129, -2.171926, 1, 1, 1, 1, 1,
-0.3146307, -0.6372797, -2.201316, 1, 1, 1, 1, 1,
-0.3105297, 0.874903, -0.5393695, 1, 1, 1, 1, 1,
-0.3100704, -1.03336, -2.131189, 1, 1, 1, 1, 1,
-0.3100106, 0.4379766, -0.3984229, 1, 1, 1, 1, 1,
-0.3044753, 0.6481275, -1.372732, 1, 1, 1, 1, 1,
-0.304031, -0.6512328, -2.002887, 1, 1, 1, 1, 1,
-0.3033755, -0.07906126, -2.109977, 1, 1, 1, 1, 1,
-0.3033592, -0.1347496, -2.186614, 1, 1, 1, 1, 1,
-0.3033341, -1.045018, -1.844416, 1, 1, 1, 1, 1,
-0.3003522, -0.9388071, -3.765431, 1, 1, 1, 1, 1,
-0.2999065, 0.2288249, -1.903962, 1, 1, 1, 1, 1,
-0.29874, -0.83167, -2.690053, 1, 1, 1, 1, 1,
-0.2929007, 0.870882, -0.4593585, 1, 1, 1, 1, 1,
-0.2923131, 0.7489179, -0.06820853, 1, 1, 1, 1, 1,
-0.2918392, -0.9331979, -1.602252, 0, 0, 1, 1, 1,
-0.2909377, -1.317495, -2.667723, 1, 0, 0, 1, 1,
-0.2884338, -1.368253, -3.67065, 1, 0, 0, 1, 1,
-0.2848355, 0.9358265, -1.814096, 1, 0, 0, 1, 1,
-0.2797898, 0.01498276, -1.559384, 1, 0, 0, 1, 1,
-0.277329, -0.7336707, -2.918147, 1, 0, 0, 1, 1,
-0.2740499, 0.4639702, 1.293799, 0, 0, 0, 1, 1,
-0.269443, -0.7167528, -3.236, 0, 0, 0, 1, 1,
-0.2673464, 0.493427, -0.3070654, 0, 0, 0, 1, 1,
-0.264565, -0.8815713, -3.581656, 0, 0, 0, 1, 1,
-0.2535318, 0.2362031, 0.2623789, 0, 0, 0, 1, 1,
-0.252414, 0.4031346, -0.672882, 0, 0, 0, 1, 1,
-0.2512806, -0.45575, -2.568844, 0, 0, 0, 1, 1,
-0.248588, 1.417482, 0.049462, 1, 1, 1, 1, 1,
-0.2449294, 0.07812677, 0.1063571, 1, 1, 1, 1, 1,
-0.2430812, -1.910676, -2.614683, 1, 1, 1, 1, 1,
-0.2421035, -0.307548, -0.4372187, 1, 1, 1, 1, 1,
-0.2419642, 1.879997, -1.003176, 1, 1, 1, 1, 1,
-0.2409219, 1.096281, 1.539696, 1, 1, 1, 1, 1,
-0.2371323, -0.9873077, -2.97178, 1, 1, 1, 1, 1,
-0.2346607, 0.334904, -0.0906041, 1, 1, 1, 1, 1,
-0.2303252, 0.1336861, -0.1946512, 1, 1, 1, 1, 1,
-0.2267838, -0.2922679, -3.157253, 1, 1, 1, 1, 1,
-0.2167584, -0.8836548, -3.515087, 1, 1, 1, 1, 1,
-0.2137336, 0.4853771, 1.006466, 1, 1, 1, 1, 1,
-0.2093855, 0.6708282, 0.5003644, 1, 1, 1, 1, 1,
-0.2089003, 0.7090232, -1.144866, 1, 1, 1, 1, 1,
-0.2023798, 0.4624022, 0.9627274, 1, 1, 1, 1, 1,
-0.2022629, -0.874705, -4.213043, 0, 0, 1, 1, 1,
-0.1997491, -0.120296, -2.194557, 1, 0, 0, 1, 1,
-0.1959863, 1.170453, -0.02840175, 1, 0, 0, 1, 1,
-0.1954356, 0.07444578, -1.122914, 1, 0, 0, 1, 1,
-0.1886447, -0.2774553, -4.08672, 1, 0, 0, 1, 1,
-0.1869168, 0.08236066, -1.643311, 1, 0, 0, 1, 1,
-0.1842611, 0.501333, -0.746739, 0, 0, 0, 1, 1,
-0.1824272, -1.573074, -3.16164, 0, 0, 0, 1, 1,
-0.1813704, -0.5584889, -3.078716, 0, 0, 0, 1, 1,
-0.1807739, -0.00799403, -1.230054, 0, 0, 0, 1, 1,
-0.1804821, 0.2111913, -0.9237148, 0, 0, 0, 1, 1,
-0.1792737, -1.288399, -4.680383, 0, 0, 0, 1, 1,
-0.1771107, -0.8524628, -1.232742, 0, 0, 0, 1, 1,
-0.1758989, -0.5580887, -3.318003, 1, 1, 1, 1, 1,
-0.1756668, -0.8748081, -3.860859, 1, 1, 1, 1, 1,
-0.1716897, 0.07910274, -1.831671, 1, 1, 1, 1, 1,
-0.1706537, 1.087451, -1.153134, 1, 1, 1, 1, 1,
-0.1643766, -0.007785528, -2.30391, 1, 1, 1, 1, 1,
-0.1632888, 0.5210406, -0.6499965, 1, 1, 1, 1, 1,
-0.1533395, -0.08922726, -2.126571, 1, 1, 1, 1, 1,
-0.1507755, 0.2678915, -2.598962, 1, 1, 1, 1, 1,
-0.150494, -0.3172446, -3.153316, 1, 1, 1, 1, 1,
-0.1501541, -0.7720505, -4.184227, 1, 1, 1, 1, 1,
-0.1479151, -1.758963, -2.780756, 1, 1, 1, 1, 1,
-0.145788, 0.7682543, -1.398702, 1, 1, 1, 1, 1,
-0.1450004, -0.08937339, -3.077949, 1, 1, 1, 1, 1,
-0.1446811, -1.81012, -3.362964, 1, 1, 1, 1, 1,
-0.1439984, -0.5025593, -2.298999, 1, 1, 1, 1, 1,
-0.1415643, -0.09337372, -0.2464057, 0, 0, 1, 1, 1,
-0.1406802, 1.491928, 2.050068, 1, 0, 0, 1, 1,
-0.1400683, -1.577207, -1.645442, 1, 0, 0, 1, 1,
-0.1375865, 1.482969, 2.278856, 1, 0, 0, 1, 1,
-0.1339616, -0.08842743, -1.408934, 1, 0, 0, 1, 1,
-0.1296752, -1.627758, -4.021023, 1, 0, 0, 1, 1,
-0.1293001, -3.036323, -4.105739, 0, 0, 0, 1, 1,
-0.1252765, -0.06546734, -2.64352, 0, 0, 0, 1, 1,
-0.1247221, -1.622735, -3.143362, 0, 0, 0, 1, 1,
-0.1200627, 0.8621653, -1.1143, 0, 0, 0, 1, 1,
-0.1197177, -0.5516713, -3.026464, 0, 0, 0, 1, 1,
-0.1188062, -0.2567727, -2.921339, 0, 0, 0, 1, 1,
-0.1164379, -0.0212413, -3.193393, 0, 0, 0, 1, 1,
-0.1160904, 1.007322, -0.9734618, 1, 1, 1, 1, 1,
-0.1158873, 0.2774702, -1.29354, 1, 1, 1, 1, 1,
-0.115526, 0.264645, -2.349173, 1, 1, 1, 1, 1,
-0.1124933, -1.375277, -4.423593, 1, 1, 1, 1, 1,
-0.1067635, -1.462536, -4.292549, 1, 1, 1, 1, 1,
-0.1050886, 1.107, 0.6448877, 1, 1, 1, 1, 1,
-0.1013501, -2.68576, -1.285198, 1, 1, 1, 1, 1,
-0.1010774, 0.7014157, -0.4225033, 1, 1, 1, 1, 1,
-0.09849771, 0.3094082, -1.030352, 1, 1, 1, 1, 1,
-0.09657112, -0.9365883, -3.436915, 1, 1, 1, 1, 1,
-0.09540064, -0.7832662, -3.16648, 1, 1, 1, 1, 1,
-0.09507053, -2.105108, -4.107587, 1, 1, 1, 1, 1,
-0.09279263, 0.1920467, -0.2125566, 1, 1, 1, 1, 1,
-0.09264451, 0.5931181, -1.176258, 1, 1, 1, 1, 1,
-0.09245557, -0.3177122, -2.326761, 1, 1, 1, 1, 1,
-0.09161879, 0.05670992, -1.130307, 0, 0, 1, 1, 1,
-0.09109043, 2.111817, -0.5843197, 1, 0, 0, 1, 1,
-0.09069779, -1.485676, -3.664805, 1, 0, 0, 1, 1,
-0.08876687, -2.706226, -1.957546, 1, 0, 0, 1, 1,
-0.08445153, 0.7629724, 0.4442019, 1, 0, 0, 1, 1,
-0.0837591, -0.42647, -2.374494, 1, 0, 0, 1, 1,
-0.07977428, 1.065169, 0.5987648, 0, 0, 0, 1, 1,
-0.07936731, -0.5888262, -2.512419, 0, 0, 0, 1, 1,
-0.07106742, -0.3296826, -3.536935, 0, 0, 0, 1, 1,
-0.06743326, 0.931716, -0.1060706, 0, 0, 0, 1, 1,
-0.06656816, -0.8146842, -2.5085, 0, 0, 0, 1, 1,
-0.06631763, -1.662634, -3.359348, 0, 0, 0, 1, 1,
-0.05714762, 0.2552494, 0.3076227, 0, 0, 0, 1, 1,
-0.0563538, -0.2161675, -3.923224, 1, 1, 1, 1, 1,
-0.05612345, -0.6132544, -2.318188, 1, 1, 1, 1, 1,
-0.0550929, 0.6163324, -0.3176955, 1, 1, 1, 1, 1,
-0.05147146, 0.3672034, 0.9387049, 1, 1, 1, 1, 1,
-0.0500679, 0.3206576, 0.852156, 1, 1, 1, 1, 1,
-0.04579201, 0.3108308, -0.9338441, 1, 1, 1, 1, 1,
-0.0392439, 1.595744, -0.479391, 1, 1, 1, 1, 1,
-0.03868446, 0.9257728, 2.353342, 1, 1, 1, 1, 1,
-0.03866332, 1.608847, 0.7764807, 1, 1, 1, 1, 1,
-0.03791386, -0.6388339, -3.511546, 1, 1, 1, 1, 1,
-0.03399415, -0.3829651, -5.05309, 1, 1, 1, 1, 1,
-0.03269328, -0.3750697, -2.647139, 1, 1, 1, 1, 1,
-0.03166158, -0.7089982, -3.237543, 1, 1, 1, 1, 1,
-0.03049787, -1.091282, -3.131935, 1, 1, 1, 1, 1,
-0.02758224, -1.261601, -2.987904, 1, 1, 1, 1, 1,
-0.02701411, 0.5801963, -1.031315, 0, 0, 1, 1, 1,
-0.02329554, 0.08665302, -1.155168, 1, 0, 0, 1, 1,
-0.02231335, -1.300666, -2.827864, 1, 0, 0, 1, 1,
-0.02220444, 0.3545691, -0.4637686, 1, 0, 0, 1, 1,
-0.01930459, 0.3083128, 0.9559248, 1, 0, 0, 1, 1,
-0.0179624, -0.06582712, -3.103971, 1, 0, 0, 1, 1,
-0.01409769, -0.438474, -4.455898, 0, 0, 0, 1, 1,
-0.003770017, -0.405375, -1.12521, 0, 0, 0, 1, 1,
-0.00234644, -1.213054, -3.371226, 0, 0, 0, 1, 1,
0.004597913, 1.358667, 0.6678457, 0, 0, 0, 1, 1,
0.005172272, -0.3408751, 3.477522, 0, 0, 0, 1, 1,
0.01005148, 1.84121, -0.05681421, 0, 0, 0, 1, 1,
0.01494177, -0.5314631, 3.623423, 0, 0, 0, 1, 1,
0.01852689, -1.423984, 2.975981, 1, 1, 1, 1, 1,
0.02457027, -1.096126, 2.957137, 1, 1, 1, 1, 1,
0.02470906, -0.3847691, 3.086175, 1, 1, 1, 1, 1,
0.02854913, -1.831649, 1.070168, 1, 1, 1, 1, 1,
0.0337167, -1.016937, 3.653206, 1, 1, 1, 1, 1,
0.03660509, -0.6619501, 2.593874, 1, 1, 1, 1, 1,
0.03819557, -0.804351, 3.990737, 1, 1, 1, 1, 1,
0.04071055, 1.425911, -1.902937, 1, 1, 1, 1, 1,
0.04105383, -0.420971, 1.116313, 1, 1, 1, 1, 1,
0.04155758, 0.4031429, 0.6911716, 1, 1, 1, 1, 1,
0.04298063, -0.7930651, 2.435699, 1, 1, 1, 1, 1,
0.04454625, -0.327593, 4.193046, 1, 1, 1, 1, 1,
0.04491424, 0.05819888, 0.1869456, 1, 1, 1, 1, 1,
0.04589577, -0.5934069, 2.369469, 1, 1, 1, 1, 1,
0.04850768, 1.785702, 0.965102, 1, 1, 1, 1, 1,
0.04892397, -0.100974, 2.126014, 0, 0, 1, 1, 1,
0.0506468, -0.3064719, 4.479255, 1, 0, 0, 1, 1,
0.05161626, 0.2433798, 0.7034599, 1, 0, 0, 1, 1,
0.05264405, 0.3813798, -0.7005557, 1, 0, 0, 1, 1,
0.05413351, -0.5849833, 2.636258, 1, 0, 0, 1, 1,
0.05489413, -1.252631, 3.020342, 1, 0, 0, 1, 1,
0.05520662, -1.929535, 2.422766, 0, 0, 0, 1, 1,
0.05659103, -0.8369283, 3.590993, 0, 0, 0, 1, 1,
0.05942073, -0.229955, 1.701079, 0, 0, 0, 1, 1,
0.06049589, -0.2344049, 2.095488, 0, 0, 0, 1, 1,
0.06178525, 1.193925, 0.1122838, 0, 0, 0, 1, 1,
0.06256703, 0.9938188, -0.08423084, 0, 0, 0, 1, 1,
0.06347062, 0.5806502, 0.9081841, 0, 0, 0, 1, 1,
0.0672437, -1.014152, 2.209499, 1, 1, 1, 1, 1,
0.07173169, 1.026497, -0.5074571, 1, 1, 1, 1, 1,
0.07389043, -0.9576155, 2.716525, 1, 1, 1, 1, 1,
0.07410343, 1.312073, 2.658138, 1, 1, 1, 1, 1,
0.07453965, -0.2609496, 4.877583, 1, 1, 1, 1, 1,
0.07989497, -0.8859292, 4.089107, 1, 1, 1, 1, 1,
0.08122697, -0.8699067, 3.880784, 1, 1, 1, 1, 1,
0.08448101, -0.2186135, 3.243194, 1, 1, 1, 1, 1,
0.08928916, 0.3189679, -1.439803, 1, 1, 1, 1, 1,
0.09115589, 0.6889693, -1.723388, 1, 1, 1, 1, 1,
0.09656096, 0.6052482, -0.6593549, 1, 1, 1, 1, 1,
0.1027207, -0.1811271, 2.670254, 1, 1, 1, 1, 1,
0.1122738, 0.699659, 0.3157429, 1, 1, 1, 1, 1,
0.1135794, 0.08026114, 1.065874, 1, 1, 1, 1, 1,
0.1185897, 0.2371316, 0.8746717, 1, 1, 1, 1, 1,
0.1191237, -1.988244, 3.041849, 0, 0, 1, 1, 1,
0.1225901, -1.199584, 2.57778, 1, 0, 0, 1, 1,
0.1230139, -1.001162, 5.552496, 1, 0, 0, 1, 1,
0.1235038, 0.754274, -0.1672569, 1, 0, 0, 1, 1,
0.126264, 0.2600538, -0.4977952, 1, 0, 0, 1, 1,
0.1269837, -0.7915469, 2.452904, 1, 0, 0, 1, 1,
0.1279167, 1.705462, 0.8385253, 0, 0, 0, 1, 1,
0.1312642, 0.03592842, 0.736778, 0, 0, 0, 1, 1,
0.1331742, 1.471656, -0.3938965, 0, 0, 0, 1, 1,
0.1338217, 0.7936552, -0.5998616, 0, 0, 0, 1, 1,
0.1340979, -0.8248628, 1.165163, 0, 0, 0, 1, 1,
0.1375471, 0.893734, -0.02807674, 0, 0, 0, 1, 1,
0.1397343, -0.702947, 2.151587, 0, 0, 0, 1, 1,
0.1408256, -0.7049845, 3.791666, 1, 1, 1, 1, 1,
0.1451323, -0.5266587, 1.799, 1, 1, 1, 1, 1,
0.1474549, 0.04069497, 2.669428, 1, 1, 1, 1, 1,
0.1485259, 0.2467691, -1.254566, 1, 1, 1, 1, 1,
0.1505545, 2.015756, -0.9186468, 1, 1, 1, 1, 1,
0.1512752, -0.6711761, 4.053907, 1, 1, 1, 1, 1,
0.1529536, 0.01195535, 1.08809, 1, 1, 1, 1, 1,
0.1580502, -0.7590739, 2.821196, 1, 1, 1, 1, 1,
0.1607606, 0.05477731, 0.184895, 1, 1, 1, 1, 1,
0.1629587, -0.8316056, 1.850041, 1, 1, 1, 1, 1,
0.1630059, -0.8795302, 3.719374, 1, 1, 1, 1, 1,
0.1660661, -0.4081853, 2.731825, 1, 1, 1, 1, 1,
0.1679088, -0.8787585, 2.47297, 1, 1, 1, 1, 1,
0.1721864, -0.2160086, 2.249673, 1, 1, 1, 1, 1,
0.1756748, 2.129208, -1.501737, 1, 1, 1, 1, 1,
0.1759231, 1.484084, 0.463404, 0, 0, 1, 1, 1,
0.1801424, 0.07465085, 1.771959, 1, 0, 0, 1, 1,
0.1806847, 0.4432361, 1.684284, 1, 0, 0, 1, 1,
0.1813026, -1.037948, 2.937495, 1, 0, 0, 1, 1,
0.1837256, -0.5734301, 3.28318, 1, 0, 0, 1, 1,
0.1849642, 0.7770563, -0.3139764, 1, 0, 0, 1, 1,
0.1882628, 2.301364, 0.07651318, 0, 0, 0, 1, 1,
0.188613, -0.4645473, 1.998288, 0, 0, 0, 1, 1,
0.1953925, -0.7228667, 3.225858, 0, 0, 0, 1, 1,
0.1962597, 1.724177, -1.921794, 0, 0, 0, 1, 1,
0.2027541, 1.248023, -0.1901882, 0, 0, 0, 1, 1,
0.20336, -1.528198, 0.417412, 0, 0, 0, 1, 1,
0.2044661, 0.8821481, 0.3158354, 0, 0, 0, 1, 1,
0.2089207, 1.906252, 0.01599273, 1, 1, 1, 1, 1,
0.2092137, 1.854588, 0.6579627, 1, 1, 1, 1, 1,
0.211455, 2.29877, 0.1590693, 1, 1, 1, 1, 1,
0.2133549, -0.9198053, 3.744813, 1, 1, 1, 1, 1,
0.2156154, -0.1924379, 0.3802642, 1, 1, 1, 1, 1,
0.2176939, -1.288574, 2.884618, 1, 1, 1, 1, 1,
0.2177448, -1.028519, 2.757537, 1, 1, 1, 1, 1,
0.2187065, -0.151618, 1.646234, 1, 1, 1, 1, 1,
0.2222651, 0.2997844, 1.03589, 1, 1, 1, 1, 1,
0.2239181, -2.371339, 3.914958, 1, 1, 1, 1, 1,
0.2240935, 0.05106447, 1.470498, 1, 1, 1, 1, 1,
0.2288347, -1.333723, 3.357565, 1, 1, 1, 1, 1,
0.2298077, -0.4545885, 2.753365, 1, 1, 1, 1, 1,
0.2326615, -0.1077918, 0.05030492, 1, 1, 1, 1, 1,
0.2375346, -0.08040302, 0.1498885, 1, 1, 1, 1, 1,
0.2375372, -0.6611892, 2.099715, 0, 0, 1, 1, 1,
0.2428946, 0.5327175, -0.3625927, 1, 0, 0, 1, 1,
0.2495002, -0.6847425, 3.679779, 1, 0, 0, 1, 1,
0.2523057, -0.7486345, 2.712395, 1, 0, 0, 1, 1,
0.2589524, -0.7003326, 3.980478, 1, 0, 0, 1, 1,
0.2653168, 1.683069, 0.1742942, 1, 0, 0, 1, 1,
0.2706123, 2.180266, -0.5712527, 0, 0, 0, 1, 1,
0.2768936, -0.8975571, 1.045012, 0, 0, 0, 1, 1,
0.2846589, -0.0919496, 1.884139, 0, 0, 0, 1, 1,
0.2868653, 1.782599, 1.537374, 0, 0, 0, 1, 1,
0.2897336, 0.536394, 0.8065538, 0, 0, 0, 1, 1,
0.2903762, -0.1088357, 1.755499, 0, 0, 0, 1, 1,
0.2904878, -0.09918842, 2.765233, 0, 0, 0, 1, 1,
0.2949249, -0.9766064, 4.440417, 1, 1, 1, 1, 1,
0.2958211, -1.243504, 1.857298, 1, 1, 1, 1, 1,
0.3028586, -0.9692268, 1.416897, 1, 1, 1, 1, 1,
0.3054906, 1.034038, -1.528911, 1, 1, 1, 1, 1,
0.3069694, 0.7652814, -0.3156291, 1, 1, 1, 1, 1,
0.307142, 1.392853, 0.3794371, 1, 1, 1, 1, 1,
0.3076404, -0.8710147, 0.2427337, 1, 1, 1, 1, 1,
0.3077933, -0.07774545, 2.071757, 1, 1, 1, 1, 1,
0.307867, -0.574742, 4.346425, 1, 1, 1, 1, 1,
0.3102777, -0.5949996, 2.286452, 1, 1, 1, 1, 1,
0.3115813, 0.3430836, 0.213718, 1, 1, 1, 1, 1,
0.3125655, -0.732675, 1.794219, 1, 1, 1, 1, 1,
0.3126213, -0.1678435, 0.6543337, 1, 1, 1, 1, 1,
0.3175442, -0.7010398, 3.295514, 1, 1, 1, 1, 1,
0.3187927, 0.1562249, 1.895205, 1, 1, 1, 1, 1,
0.3213702, 0.2515549, -0.5303857, 0, 0, 1, 1, 1,
0.3220091, -0.7888715, 2.765309, 1, 0, 0, 1, 1,
0.3223226, -0.8645405, 3.392776, 1, 0, 0, 1, 1,
0.3235788, -0.667614, 2.452372, 1, 0, 0, 1, 1,
0.3297604, -0.7722697, 3.567937, 1, 0, 0, 1, 1,
0.3298671, -1.237904, 3.362689, 1, 0, 0, 1, 1,
0.3350061, 0.410008, 1.187343, 0, 0, 0, 1, 1,
0.3359105, -0.3072073, 2.58618, 0, 0, 0, 1, 1,
0.3381948, -1.480454, 4.369243, 0, 0, 0, 1, 1,
0.3399542, -1.866522, 3.664519, 0, 0, 0, 1, 1,
0.3405139, 0.8891401, 1.47824, 0, 0, 0, 1, 1,
0.341327, -0.906498, 3.48719, 0, 0, 0, 1, 1,
0.3425264, 1.43703, 0.1469483, 0, 0, 0, 1, 1,
0.3449509, 0.8232274, 1.542785, 1, 1, 1, 1, 1,
0.3496644, -0.3539796, 3.619856, 1, 1, 1, 1, 1,
0.349744, -0.7788029, 3.9279, 1, 1, 1, 1, 1,
0.3568451, -1.396377, 2.971406, 1, 1, 1, 1, 1,
0.3605725, -0.07529961, 1.895463, 1, 1, 1, 1, 1,
0.3622124, 1.647274, -0.06547402, 1, 1, 1, 1, 1,
0.3625772, -0.02635997, 3.251319, 1, 1, 1, 1, 1,
0.3643538, 1.79133, -1.365268, 1, 1, 1, 1, 1,
0.3643946, 0.9201351, 0.5775121, 1, 1, 1, 1, 1,
0.3645646, 0.9128146, 0.3797728, 1, 1, 1, 1, 1,
0.3666748, -0.9560025, 1.956847, 1, 1, 1, 1, 1,
0.3732443, 1.753641, 0.8273588, 1, 1, 1, 1, 1,
0.3742272, -0.3112059, 2.218297, 1, 1, 1, 1, 1,
0.3754998, -1.477256, 3.245472, 1, 1, 1, 1, 1,
0.3757193, 0.4716302, -1.254284, 1, 1, 1, 1, 1,
0.3762673, 0.6137396, -0.5255626, 0, 0, 1, 1, 1,
0.3777716, 0.3465153, 1.077408, 1, 0, 0, 1, 1,
0.3804201, -0.9620761, 1.135758, 1, 0, 0, 1, 1,
0.3873012, 0.6997431, 0.3283865, 1, 0, 0, 1, 1,
0.3895027, -1.112009, 3.335197, 1, 0, 0, 1, 1,
0.3895693, -0.8045148, 0.9746494, 1, 0, 0, 1, 1,
0.401904, 0.9169466, 0.5312152, 0, 0, 0, 1, 1,
0.4071912, -0.8444291, 2.095517, 0, 0, 0, 1, 1,
0.4124161, 0.5346175, -0.02473614, 0, 0, 0, 1, 1,
0.4183358, 0.04225137, 1.239048, 0, 0, 0, 1, 1,
0.4191583, -0.5147483, 1.321404, 0, 0, 0, 1, 1,
0.4211598, 1.526175, -0.02103123, 0, 0, 0, 1, 1,
0.4218586, 0.1277599, 0.06064123, 0, 0, 0, 1, 1,
0.4269582, -0.7712691, 3.156101, 1, 1, 1, 1, 1,
0.4273077, -0.857636, 2.910437, 1, 1, 1, 1, 1,
0.4336061, -0.09259158, 3.604651, 1, 1, 1, 1, 1,
0.4336853, -0.1733879, 1.164206, 1, 1, 1, 1, 1,
0.4355192, -1.394394, 2.450009, 1, 1, 1, 1, 1,
0.4407551, 1.155201, 0.05035485, 1, 1, 1, 1, 1,
0.4412022, 1.026047, 0.5109093, 1, 1, 1, 1, 1,
0.4432906, 0.05878406, 2.811312, 1, 1, 1, 1, 1,
0.4448219, 0.329594, 1.000625, 1, 1, 1, 1, 1,
0.4450063, -0.6618244, 1.753223, 1, 1, 1, 1, 1,
0.450766, -0.4962857, -0.186326, 1, 1, 1, 1, 1,
0.4606392, -0.2787415, 1.523978, 1, 1, 1, 1, 1,
0.4615843, 0.8232187, 0.2083349, 1, 1, 1, 1, 1,
0.4639795, -0.1345699, 0.4882365, 1, 1, 1, 1, 1,
0.4688201, -1.013011, 2.623188, 1, 1, 1, 1, 1,
0.4731171, 0.8186622, 1.460457, 0, 0, 1, 1, 1,
0.4734919, 0.5984665, 0.350604, 1, 0, 0, 1, 1,
0.4761302, 0.9378864, -0.06606705, 1, 0, 0, 1, 1,
0.4851716, -1.122362, 4.298998, 1, 0, 0, 1, 1,
0.4858604, 0.5672159, 0.3401586, 1, 0, 0, 1, 1,
0.4864946, -0.8910747, 4.444089, 1, 0, 0, 1, 1,
0.489257, -1.62938, 4.318769, 0, 0, 0, 1, 1,
0.4949632, 0.2935294, 1.509135, 0, 0, 0, 1, 1,
0.4981271, -0.3448191, 0.1916237, 0, 0, 0, 1, 1,
0.5050468, 0.8811737, -0.9473088, 0, 0, 0, 1, 1,
0.5096629, -0.5257787, 3.018675, 0, 0, 0, 1, 1,
0.5103514, 0.1789023, 0.6703317, 0, 0, 0, 1, 1,
0.5129811, -0.0343974, 2.170858, 0, 0, 0, 1, 1,
0.513802, 1.009957, 0.6978612, 1, 1, 1, 1, 1,
0.5164077, 1.093454, -0.2866838, 1, 1, 1, 1, 1,
0.5225505, 1.058816, 0.7805399, 1, 1, 1, 1, 1,
0.5243142, 0.1373851, 0.05757514, 1, 1, 1, 1, 1,
0.5266584, 1.718364, 2.276672, 1, 1, 1, 1, 1,
0.5285554, -0.4716855, 1.569706, 1, 1, 1, 1, 1,
0.5350824, 0.7197343, 1.081969, 1, 1, 1, 1, 1,
0.5362157, 0.7611145, 0.5201412, 1, 1, 1, 1, 1,
0.5383665, 0.2118963, 1.363549, 1, 1, 1, 1, 1,
0.5422736, 0.3357679, 0.288304, 1, 1, 1, 1, 1,
0.5439653, -0.1374815, 2.284772, 1, 1, 1, 1, 1,
0.5462708, -1.463045, 3.59055, 1, 1, 1, 1, 1,
0.5479053, -0.6520018, -1.348061, 1, 1, 1, 1, 1,
0.5484617, -0.3455805, 3.565685, 1, 1, 1, 1, 1,
0.5551532, 1.379148, -0.2272915, 1, 1, 1, 1, 1,
0.556429, 1.431021, 0.5825721, 0, 0, 1, 1, 1,
0.5581528, -0.8324332, 3.271501, 1, 0, 0, 1, 1,
0.558192, 0.5964655, 0.9290824, 1, 0, 0, 1, 1,
0.5582279, -0.3869288, 2.223251, 1, 0, 0, 1, 1,
0.5607708, -0.3856024, 2.124613, 1, 0, 0, 1, 1,
0.5627499, -0.4815017, 1.88275, 1, 0, 0, 1, 1,
0.5640801, 0.9247024, 1.547783, 0, 0, 0, 1, 1,
0.5655468, -1.526937, 2.703828, 0, 0, 0, 1, 1,
0.5685843, 1.243269, 0.726352, 0, 0, 0, 1, 1,
0.5688742, -0.7297992, 2.727066, 0, 0, 0, 1, 1,
0.5691149, 0.1702827, 2.296897, 0, 0, 0, 1, 1,
0.5697128, 0.2862295, 0.6933448, 0, 0, 0, 1, 1,
0.5732855, -0.1177135, 1.587801, 0, 0, 0, 1, 1,
0.573678, -0.4327948, 4.030443, 1, 1, 1, 1, 1,
0.5765735, -0.07872117, 2.317043, 1, 1, 1, 1, 1,
0.5767772, 1.281796, 0.5824507, 1, 1, 1, 1, 1,
0.5772819, -0.7007083, 1.838559, 1, 1, 1, 1, 1,
0.5785847, 1.253732, -0.5739484, 1, 1, 1, 1, 1,
0.5811288, -0.4338553, 1.922256, 1, 1, 1, 1, 1,
0.5822358, 0.6777375, 1.568435, 1, 1, 1, 1, 1,
0.5835385, -0.9285036, 1.325419, 1, 1, 1, 1, 1,
0.5981066, -0.02301893, 0.8471526, 1, 1, 1, 1, 1,
0.5982437, -0.002676661, 2.524244, 1, 1, 1, 1, 1,
0.5993091, -1.446885, 3.859523, 1, 1, 1, 1, 1,
0.6024665, -0.5705997, 1.330422, 1, 1, 1, 1, 1,
0.6032694, 1.272724, 0.1193336, 1, 1, 1, 1, 1,
0.6043552, -1.467155, 3.418872, 1, 1, 1, 1, 1,
0.6071292, 0.0442474, 1.526342, 1, 1, 1, 1, 1,
0.6075557, -0.5493145, 2.935297, 0, 0, 1, 1, 1,
0.6084357, -0.1368821, 0.09711568, 1, 0, 0, 1, 1,
0.6113585, 0.4518753, 1.160007, 1, 0, 0, 1, 1,
0.6135952, -2.971064, 2.414195, 1, 0, 0, 1, 1,
0.6154673, 0.9274247, 1.205421, 1, 0, 0, 1, 1,
0.6169898, 0.9580295, -0.368178, 1, 0, 0, 1, 1,
0.6190144, 0.4405519, 0.1825617, 0, 0, 0, 1, 1,
0.6254882, 0.9675485, 2.277242, 0, 0, 0, 1, 1,
0.625587, -0.1362655, 2.389198, 0, 0, 0, 1, 1,
0.6315249, -1.267915, 4.769649, 0, 0, 0, 1, 1,
0.6327925, -0.933701, 1.73055, 0, 0, 0, 1, 1,
0.6374303, 0.8941424, 1.53302, 0, 0, 0, 1, 1,
0.6412415, 0.4531521, -0.3317231, 0, 0, 0, 1, 1,
0.651444, 0.3719131, 1.347866, 1, 1, 1, 1, 1,
0.6531995, 0.2523576, -0.008749895, 1, 1, 1, 1, 1,
0.6556726, -0.3396189, 3.596261, 1, 1, 1, 1, 1,
0.6578808, 1.645535, -0.457006, 1, 1, 1, 1, 1,
0.6603587, -0.09548981, 1.196581, 1, 1, 1, 1, 1,
0.661109, -1.023075, 2.718937, 1, 1, 1, 1, 1,
0.6649665, 0.3313614, -0.1045302, 1, 1, 1, 1, 1,
0.6660676, 1.512924, -1.205912, 1, 1, 1, 1, 1,
0.6689799, -0.3812404, 1.48262, 1, 1, 1, 1, 1,
0.6693124, -0.1578777, 2.370051, 1, 1, 1, 1, 1,
0.6701716, -2.340636, 4.218787, 1, 1, 1, 1, 1,
0.6707727, 0.4657608, 0.8260548, 1, 1, 1, 1, 1,
0.6733544, -0.09269398, 1.552074, 1, 1, 1, 1, 1,
0.6765511, -0.02920023, 0.5267742, 1, 1, 1, 1, 1,
0.6767693, 0.242541, 1.072258, 1, 1, 1, 1, 1,
0.681006, -0.2176742, 1.92465, 0, 0, 1, 1, 1,
0.6823162, -0.2607177, 2.647889, 1, 0, 0, 1, 1,
0.6880906, 1.537071, 0.5697302, 1, 0, 0, 1, 1,
0.6922492, 1.588374, -0.6793051, 1, 0, 0, 1, 1,
0.6997177, 0.784019, 1.029198, 1, 0, 0, 1, 1,
0.7013974, 0.007596245, 1.951089, 1, 0, 0, 1, 1,
0.7024001, 1.210829, 1.213983, 0, 0, 0, 1, 1,
0.7208029, 0.1168674, 1.298502, 0, 0, 0, 1, 1,
0.7221146, 1.625467, 0.4061613, 0, 0, 0, 1, 1,
0.722155, -1.375459, 4.016611, 0, 0, 0, 1, 1,
0.7235866, 0.2406041, 2.85214, 0, 0, 0, 1, 1,
0.7253987, 0.4870414, 0.5324445, 0, 0, 0, 1, 1,
0.7293116, -1.013404, 1.291497, 0, 0, 0, 1, 1,
0.7320811, -0.7113272, 2.32845, 1, 1, 1, 1, 1,
0.7336888, 0.6101636, 1.924767, 1, 1, 1, 1, 1,
0.7381448, -0.5512291, 1.961094, 1, 1, 1, 1, 1,
0.7436692, 0.4814925, 1.617723, 1, 1, 1, 1, 1,
0.7450548, 1.678935, -0.9832855, 1, 1, 1, 1, 1,
0.7503105, 0.7523697, 0.1850492, 1, 1, 1, 1, 1,
0.7517783, -1.139442, 2.436323, 1, 1, 1, 1, 1,
0.7531701, -0.2223092, 3.058751, 1, 1, 1, 1, 1,
0.7554449, 0.04348499, 0.7040587, 1, 1, 1, 1, 1,
0.7556135, 0.05371082, 2.886784, 1, 1, 1, 1, 1,
0.7568136, 0.4361514, 1.122643, 1, 1, 1, 1, 1,
0.7572534, -0.3807683, 1.194174, 1, 1, 1, 1, 1,
0.7588689, -0.1659014, 0.3694188, 1, 1, 1, 1, 1,
0.7697451, 0.9379529, 1.085526, 1, 1, 1, 1, 1,
0.7718154, -1.664912, 1.849922, 1, 1, 1, 1, 1,
0.7734147, 0.03856974, 2.27525, 0, 0, 1, 1, 1,
0.7791208, 0.6406753, 2.164422, 1, 0, 0, 1, 1,
0.7832015, 0.4255949, 0.2872497, 1, 0, 0, 1, 1,
0.7860696, -1.186888, 2.986321, 1, 0, 0, 1, 1,
0.787762, 0.9686515, 1.297055, 1, 0, 0, 1, 1,
0.8014985, -0.4083665, 2.478787, 1, 0, 0, 1, 1,
0.8022513, 0.1201008, 1.838259, 0, 0, 0, 1, 1,
0.8062142, -0.8818665, 2.62812, 0, 0, 0, 1, 1,
0.8086255, 0.183193, 1.409318, 0, 0, 0, 1, 1,
0.81709, 0.2382382, 2.943933, 0, 0, 0, 1, 1,
0.8224787, -1.87734, 2.934806, 0, 0, 0, 1, 1,
0.8290971, -1.302636, 3.031534, 0, 0, 0, 1, 1,
0.8298558, 2.089272, 2.001256, 0, 0, 0, 1, 1,
0.8315879, -0.7886049, 2.907879, 1, 1, 1, 1, 1,
0.8321853, 0.0490621, 2.281469, 1, 1, 1, 1, 1,
0.8339866, -1.659626, 3.789251, 1, 1, 1, 1, 1,
0.8346011, -0.1005176, 1.229574, 1, 1, 1, 1, 1,
0.8355749, -0.459785, 1.429115, 1, 1, 1, 1, 1,
0.8359644, -0.8263901, 2.608339, 1, 1, 1, 1, 1,
0.8403261, -0.2918123, 2.688864, 1, 1, 1, 1, 1,
0.8444896, 2.47181, 0.9640131, 1, 1, 1, 1, 1,
0.8467781, -0.4375399, 3.099841, 1, 1, 1, 1, 1,
0.846804, 0.02374424, 1.976856, 1, 1, 1, 1, 1,
0.8468764, -0.9841321, 2.688938, 1, 1, 1, 1, 1,
0.8677934, 0.3097303, 0.8522412, 1, 1, 1, 1, 1,
0.8682681, 0.8730816, 1.355242, 1, 1, 1, 1, 1,
0.8683243, -0.1442452, 3.162666, 1, 1, 1, 1, 1,
0.8722453, -1.488948, 1.77001, 1, 1, 1, 1, 1,
0.8733089, -1.051196, 2.655928, 0, 0, 1, 1, 1,
0.8741465, 0.1300031, 1.996366, 1, 0, 0, 1, 1,
0.8742315, -0.5582358, 2.539008, 1, 0, 0, 1, 1,
0.8743986, 0.3420832, 0.7031364, 1, 0, 0, 1, 1,
0.8819243, 0.8933785, 1.714762, 1, 0, 0, 1, 1,
0.8860294, -0.4171827, 3.997266, 1, 0, 0, 1, 1,
0.8913622, 0.6678723, 2.230004, 0, 0, 0, 1, 1,
0.8934288, -0.6428692, 2.774691, 0, 0, 0, 1, 1,
0.8954023, 0.8301754, 2.246329, 0, 0, 0, 1, 1,
0.8970606, 0.2750984, 1.181494, 0, 0, 0, 1, 1,
0.9000345, -1.875368, 3.711408, 0, 0, 0, 1, 1,
0.9025986, -1.308719, 4.692556, 0, 0, 0, 1, 1,
0.9039595, 1.277388, 0.5685736, 0, 0, 0, 1, 1,
0.9051523, 0.8233954, 1.412302, 1, 1, 1, 1, 1,
0.9110388, 1.161788, 0.6851625, 1, 1, 1, 1, 1,
0.9120625, 0.1304191, 0.431715, 1, 1, 1, 1, 1,
0.9140208, 0.9435416, -0.3628008, 1, 1, 1, 1, 1,
0.9268358, 1.286572, 0.7972282, 1, 1, 1, 1, 1,
0.9430203, 0.8688307, 0.4547569, 1, 1, 1, 1, 1,
0.9446577, 1.540693, 0.39829, 1, 1, 1, 1, 1,
0.950313, 0.3913255, 3.276057, 1, 1, 1, 1, 1,
0.9550459, 0.2631071, 3.109635, 1, 1, 1, 1, 1,
0.955083, 0.4170892, 4.079899, 1, 1, 1, 1, 1,
0.9577628, 0.2566665, 1.446156, 1, 1, 1, 1, 1,
0.9695709, -0.3578956, 2.262169, 1, 1, 1, 1, 1,
0.9770726, 0.2781301, 1.010082, 1, 1, 1, 1, 1,
0.9832168, -0.1148113, 1.085756, 1, 1, 1, 1, 1,
0.9835538, -0.7560715, 1.849669, 1, 1, 1, 1, 1,
0.9866999, 0.9622437, 1.970079, 0, 0, 1, 1, 1,
0.9870703, -1.267347, 1.118026, 1, 0, 0, 1, 1,
0.9875197, -0.2164525, 1.476552, 1, 0, 0, 1, 1,
0.9903622, 1.584147, -0.1827243, 1, 0, 0, 1, 1,
0.9979826, -0.54588, 3.783489, 1, 0, 0, 1, 1,
1.002621, 0.1905722, 2.622068, 1, 0, 0, 1, 1,
1.007606, -0.3464005, 3.383384, 0, 0, 0, 1, 1,
1.009563, -0.7309729, 1.070133, 0, 0, 0, 1, 1,
1.012136, 0.2790034, 0.4175605, 0, 0, 0, 1, 1,
1.013313, -0.4554078, 1.413937, 0, 0, 0, 1, 1,
1.016283, -2.004071, 1.791168, 0, 0, 0, 1, 1,
1.017149, 0.3306422, 2.093149, 0, 0, 0, 1, 1,
1.017645, -0.8198324, 4.366177, 0, 0, 0, 1, 1,
1.02241, -0.8527154, 2.622978, 1, 1, 1, 1, 1,
1.024609, 0.4220111, 1.579897, 1, 1, 1, 1, 1,
1.027968, 1.878613, 0.7007575, 1, 1, 1, 1, 1,
1.030978, 0.756394, 0.9195191, 1, 1, 1, 1, 1,
1.032713, -2.396148, 1.945414, 1, 1, 1, 1, 1,
1.034368, 0.8286502, -0.5278619, 1, 1, 1, 1, 1,
1.0358, 0.8649465, 0.1444449, 1, 1, 1, 1, 1,
1.042599, -0.2002079, 2.287379, 1, 1, 1, 1, 1,
1.046787, -0.06568474, 2.499194, 1, 1, 1, 1, 1,
1.048006, 1.789317, 1.60858, 1, 1, 1, 1, 1,
1.051079, -0.9943393, 1.651625, 1, 1, 1, 1, 1,
1.059001, -1.248898, 1.950822, 1, 1, 1, 1, 1,
1.06157, 0.414038, 0.3173145, 1, 1, 1, 1, 1,
1.062078, -0.003913327, 0.6269341, 1, 1, 1, 1, 1,
1.062934, 0.1606976, 1.87418, 1, 1, 1, 1, 1,
1.064895, 0.5344357, 0.9604111, 0, 0, 1, 1, 1,
1.074039, -0.500885, 2.627132, 1, 0, 0, 1, 1,
1.082139, 0.5087817, 0.6752183, 1, 0, 0, 1, 1,
1.083906, 1.442533, 2.858591, 1, 0, 0, 1, 1,
1.087351, 0.5368971, 0.9846222, 1, 0, 0, 1, 1,
1.087871, 0.8898422, 0.8379838, 1, 0, 0, 1, 1,
1.091319, -0.1586818, 1.740906, 0, 0, 0, 1, 1,
1.092908, -0.4065477, -0.006713062, 0, 0, 0, 1, 1,
1.098182, 0.2844279, 1.444088, 0, 0, 0, 1, 1,
1.106892, 1.969561, -0.5155213, 0, 0, 0, 1, 1,
1.10868, -0.5199866, 0.1976497, 0, 0, 0, 1, 1,
1.110408, -0.01834086, -1.978328, 0, 0, 0, 1, 1,
1.113994, 0.315147, 1.590054, 0, 0, 0, 1, 1,
1.122313, -0.7324661, 0.02768238, 1, 1, 1, 1, 1,
1.123521, 0.2390441, 1.395487, 1, 1, 1, 1, 1,
1.126524, -1.417882, 3.25588, 1, 1, 1, 1, 1,
1.12754, 1.57668, 0.1408204, 1, 1, 1, 1, 1,
1.127576, -0.4464802, 1.409672, 1, 1, 1, 1, 1,
1.132757, 0.3090054, 1.476086, 1, 1, 1, 1, 1,
1.132894, -0.3403651, 2.303428, 1, 1, 1, 1, 1,
1.137441, 0.1369293, 0.1122128, 1, 1, 1, 1, 1,
1.138017, 0.8068179, 1.003656, 1, 1, 1, 1, 1,
1.13903, 0.9574867, 0.4363094, 1, 1, 1, 1, 1,
1.145997, -0.5338358, 0.6925958, 1, 1, 1, 1, 1,
1.149376, -0.5644445, 2.887403, 1, 1, 1, 1, 1,
1.153025, -0.7323706, 1.119238, 1, 1, 1, 1, 1,
1.155327, -0.08338139, 1.750649, 1, 1, 1, 1, 1,
1.157709, 0.5942909, 0.06829084, 1, 1, 1, 1, 1,
1.163586, 0.7892067, 0.1443011, 0, 0, 1, 1, 1,
1.16677, 2.047246, 2.247143, 1, 0, 0, 1, 1,
1.167267, 0.562925, -0.2341796, 1, 0, 0, 1, 1,
1.171688, -0.1185172, 2.342946, 1, 0, 0, 1, 1,
1.171849, -0.7450069, 1.70819, 1, 0, 0, 1, 1,
1.177638, -0.8476475, 1.101567, 1, 0, 0, 1, 1,
1.181301, 0.05979326, 2.927771, 0, 0, 0, 1, 1,
1.187565, 1.106429, 0.09250879, 0, 0, 0, 1, 1,
1.188518, 0.2233447, 1.319934, 0, 0, 0, 1, 1,
1.206592, 0.7756287, 0.5544407, 0, 0, 0, 1, 1,
1.217349, -1.316758, 2.111113, 0, 0, 0, 1, 1,
1.21995, 0.3164124, 1.415792, 0, 0, 0, 1, 1,
1.220199, -0.4897332, 2.235121, 0, 0, 0, 1, 1,
1.226181, 0.4139451, 2.261909, 1, 1, 1, 1, 1,
1.231382, 0.3438352, 1.009925, 1, 1, 1, 1, 1,
1.235718, -1.159594, 1.866593, 1, 1, 1, 1, 1,
1.238349, -0.07912943, 1.09351, 1, 1, 1, 1, 1,
1.239177, 0.8646319, 1.836736, 1, 1, 1, 1, 1,
1.243533, 1.283209, -0.9033807, 1, 1, 1, 1, 1,
1.246019, -1.754521, 2.085983, 1, 1, 1, 1, 1,
1.24728, -0.680479, 2.460245, 1, 1, 1, 1, 1,
1.250137, -0.85095, 2.602644, 1, 1, 1, 1, 1,
1.256271, 1.89534, 0.4323188, 1, 1, 1, 1, 1,
1.262363, 2.042128, 0.2504447, 1, 1, 1, 1, 1,
1.274238, 0.03015314, -0.1711878, 1, 1, 1, 1, 1,
1.291579, 0.6404158, 2.4803, 1, 1, 1, 1, 1,
1.294734, 0.3886401, 1.844246, 1, 1, 1, 1, 1,
1.300666, -1.414613, 1.78112, 1, 1, 1, 1, 1,
1.301703, -2.503584, 2.163962, 0, 0, 1, 1, 1,
1.303025, 0.8350963, 2.987489, 1, 0, 0, 1, 1,
1.320236, -0.7956954, 2.569871, 1, 0, 0, 1, 1,
1.333862, 0.7719709, 1.496561, 1, 0, 0, 1, 1,
1.348797, -1.309017, 3.097583, 1, 0, 0, 1, 1,
1.352598, 0.1085185, 0.6566215, 1, 0, 0, 1, 1,
1.354227, 1.259691, 0.9051723, 0, 0, 0, 1, 1,
1.355318, -0.2712655, 3.838958, 0, 0, 0, 1, 1,
1.356668, -0.0561669, 0.07910397, 0, 0, 0, 1, 1,
1.36856, -1.473205, 1.899216, 0, 0, 0, 1, 1,
1.376171, 0.1433339, 1.183942, 0, 0, 0, 1, 1,
1.378637, -0.6080813, 0.8969117, 0, 0, 0, 1, 1,
1.379366, -0.8702927, 3.889343, 0, 0, 0, 1, 1,
1.381379, -1.613103, 0.7882861, 1, 1, 1, 1, 1,
1.38336, -0.4261423, 3.611571, 1, 1, 1, 1, 1,
1.391893, 0.09480321, 0.7252515, 1, 1, 1, 1, 1,
1.394036, 0.5007166, -0.4496697, 1, 1, 1, 1, 1,
1.400998, -1.041381, 3.183619, 1, 1, 1, 1, 1,
1.401804, 1.409292, -0.9766249, 1, 1, 1, 1, 1,
1.429114, -2.087259, 1.444566, 1, 1, 1, 1, 1,
1.432492, 0.336208, 1.227435, 1, 1, 1, 1, 1,
1.435594, 0.1631467, 1.377981, 1, 1, 1, 1, 1,
1.44974, -0.6849403, 2.28106, 1, 1, 1, 1, 1,
1.45877, 0.5812178, 1.252793, 1, 1, 1, 1, 1,
1.466416, 0.3285564, 1.17523, 1, 1, 1, 1, 1,
1.46733, -0.4621613, 2.064942, 1, 1, 1, 1, 1,
1.470913, 1.217432, 0.4608491, 1, 1, 1, 1, 1,
1.504437, 0.8664069, 1.244831, 1, 1, 1, 1, 1,
1.518894, -0.4555753, 1.331117, 0, 0, 1, 1, 1,
1.542129, 0.3216627, 0.4135775, 1, 0, 0, 1, 1,
1.553031, -0.4387035, 1.352157, 1, 0, 0, 1, 1,
1.560254, -0.637898, 1.470312, 1, 0, 0, 1, 1,
1.578905, 1.744475, 0.4680874, 1, 0, 0, 1, 1,
1.581015, 0.04600267, 2.130488, 1, 0, 0, 1, 1,
1.592303, -0.19248, 2.180461, 0, 0, 0, 1, 1,
1.59713, 0.8827735, 0.03943117, 0, 0, 0, 1, 1,
1.597451, 1.243708, 0.9951757, 0, 0, 0, 1, 1,
1.609477, 1.020319, 0.4755285, 0, 0, 0, 1, 1,
1.610941, -0.5582161, 3.109135, 0, 0, 0, 1, 1,
1.61522, -0.049163, -0.6895798, 0, 0, 0, 1, 1,
1.622477, -0.1815197, 0.6920054, 0, 0, 0, 1, 1,
1.622785, 0.6920745, 3.11017, 1, 1, 1, 1, 1,
1.63212, 1.738005, -0.392166, 1, 1, 1, 1, 1,
1.642152, -0.5730239, 2.489292, 1, 1, 1, 1, 1,
1.646286, 0.992689, 1.522203, 1, 1, 1, 1, 1,
1.696599, 1.000621, 1.914241, 1, 1, 1, 1, 1,
1.711015, -2.576215, 1.666934, 1, 1, 1, 1, 1,
1.723406, 0.5533514, 0.6998642, 1, 1, 1, 1, 1,
1.747897, 1.224824, 1.351541, 1, 1, 1, 1, 1,
1.756574, -0.6386947, -0.0612499, 1, 1, 1, 1, 1,
1.777198, 1.503866, 0.1396904, 1, 1, 1, 1, 1,
1.801874, -0.1239474, 2.170279, 1, 1, 1, 1, 1,
1.83475, 0.3275478, 2.298206, 1, 1, 1, 1, 1,
1.848868, -0.4091923, 1.221367, 1, 1, 1, 1, 1,
1.853394, -0.8644554, 2.048918, 1, 1, 1, 1, 1,
1.853458, -0.3930312, 2.390621, 1, 1, 1, 1, 1,
1.867866, 1.283009, 1.155865, 0, 0, 1, 1, 1,
1.879438, 0.04071279, 0.3200303, 1, 0, 0, 1, 1,
1.906865, -1.048815, -0.004276057, 1, 0, 0, 1, 1,
1.918542, -1.114656, 2.003572, 1, 0, 0, 1, 1,
1.919732, 0.1729147, 2.102599, 1, 0, 0, 1, 1,
1.933235, -1.046237, 2.387339, 1, 0, 0, 1, 1,
2.023001, 0.04290237, 2.688017, 0, 0, 0, 1, 1,
2.048619, -1.578943, 1.948185, 0, 0, 0, 1, 1,
2.056139, 3.783125, 0.5278921, 0, 0, 0, 1, 1,
2.077807, 0.1641595, 1.258145, 0, 0, 0, 1, 1,
2.107741, -0.4561387, 1.870449, 0, 0, 0, 1, 1,
2.109454, -0.9744164, 2.155272, 0, 0, 0, 1, 1,
2.132779, 0.8990315, 0.5407678, 0, 0, 0, 1, 1,
2.163753, -0.3792648, 1.921088, 1, 1, 1, 1, 1,
2.175581, -0.6294932, 1.399197, 1, 1, 1, 1, 1,
2.351158, -1.247636, 1.878286, 1, 1, 1, 1, 1,
2.387172, -2.070407, 1.153944, 1, 1, 1, 1, 1,
2.411531, 0.9029992, -0.0162938, 1, 1, 1, 1, 1,
2.512823, -1.579825, 0.784356, 1, 1, 1, 1, 1,
2.557912, 0.2110312, 2.070478, 1, 1, 1, 1, 1
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
var radius = 9.429824;
var distance = 33.12186;
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
mvMatrix.translate( 0.2260076, -0.3734012, -0.2497032 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.12186);
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
