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
-3.192333, 1.005666, -1.059556, 1, 0, 0, 1,
-2.947773, 0.2800918, -1.635109, 1, 0.007843138, 0, 1,
-2.816946, -0.3169603, -1.584767, 1, 0.01176471, 0, 1,
-2.801589, -0.7533954, -1.583859, 1, 0.01960784, 0, 1,
-2.798243, -0.4277354, -1.829651, 1, 0.02352941, 0, 1,
-2.562599, 0.8974539, -1.242741, 1, 0.03137255, 0, 1,
-2.428466, 0.5745771, 0.5188791, 1, 0.03529412, 0, 1,
-2.423427, -0.3777898, -2.7795, 1, 0.04313726, 0, 1,
-2.33653, 0.5005258, -0.910236, 1, 0.04705882, 0, 1,
-2.331436, 0.5178143, -2.579949, 1, 0.05490196, 0, 1,
-2.307757, 0.4901298, 0.2995307, 1, 0.05882353, 0, 1,
-2.273946, 0.15138, -2.006562, 1, 0.06666667, 0, 1,
-2.215156, -1.838054, -3.270225, 1, 0.07058824, 0, 1,
-2.211414, 0.7781413, 0.2411809, 1, 0.07843138, 0, 1,
-2.190317, 0.2802211, -1.049323, 1, 0.08235294, 0, 1,
-2.09925, -0.6342968, -1.351402, 1, 0.09019608, 0, 1,
-2.095931, 0.6751894, -0.03675836, 1, 0.09411765, 0, 1,
-2.095449, 0.8720434, 0.02094832, 1, 0.1019608, 0, 1,
-2.077538, 1.022444, -2.557325, 1, 0.1098039, 0, 1,
-2.072497, -0.6229284, -0.6523385, 1, 0.1137255, 0, 1,
-2.039566, -0.5926461, -2.087945, 1, 0.1215686, 0, 1,
-2.036782, 0.1794306, -3.280085, 1, 0.1254902, 0, 1,
-2.036682, 1.375435, -1.445837, 1, 0.1333333, 0, 1,
-2.033874, -0.431908, -1.783239, 1, 0.1372549, 0, 1,
-2.019383, -1.374304, -2.0536, 1, 0.145098, 0, 1,
-1.985709, -0.160936, -1.35794, 1, 0.1490196, 0, 1,
-1.975302, 1.709408, -1.191547, 1, 0.1568628, 0, 1,
-1.95765, -0.6830698, -2.916325, 1, 0.1607843, 0, 1,
-1.925267, -0.1395327, -3.66162, 1, 0.1686275, 0, 1,
-1.894571, -0.2008097, -3.189238, 1, 0.172549, 0, 1,
-1.88402, 0.1252774, -2.81405, 1, 0.1803922, 0, 1,
-1.878247, -1.318763, -2.821229, 1, 0.1843137, 0, 1,
-1.84881, -1.043884, -2.259631, 1, 0.1921569, 0, 1,
-1.844911, 0.0976024, -2.024917, 1, 0.1960784, 0, 1,
-1.830168, 0.7222542, -1.242352, 1, 0.2039216, 0, 1,
-1.822157, -0.3868111, -1.78615, 1, 0.2117647, 0, 1,
-1.818078, 0.9253849, 0.1424485, 1, 0.2156863, 0, 1,
-1.799908, 0.1264475, -2.664788, 1, 0.2235294, 0, 1,
-1.784416, 1.164096, -1.089954, 1, 0.227451, 0, 1,
-1.7839, -0.07655466, -2.018153, 1, 0.2352941, 0, 1,
-1.756218, -0.832347, -1.382178, 1, 0.2392157, 0, 1,
-1.751626, -0.2115618, -2.417269, 1, 0.2470588, 0, 1,
-1.751123, 0.6152179, -0.1752853, 1, 0.2509804, 0, 1,
-1.734202, 0.7490168, -2.667037, 1, 0.2588235, 0, 1,
-1.730823, -2.527705, -3.211168, 1, 0.2627451, 0, 1,
-1.723278, -0.9025045, -2.205202, 1, 0.2705882, 0, 1,
-1.715823, 0.3262323, -2.105985, 1, 0.2745098, 0, 1,
-1.712293, 0.1577393, -3.014676, 1, 0.282353, 0, 1,
-1.703154, -1.134529, -1.796548, 1, 0.2862745, 0, 1,
-1.695921, 0.7442693, -0.3708493, 1, 0.2941177, 0, 1,
-1.693043, 0.06820172, -2.080956, 1, 0.3019608, 0, 1,
-1.690114, 0.8654612, -3.142956, 1, 0.3058824, 0, 1,
-1.689233, 0.1747927, -1.461517, 1, 0.3137255, 0, 1,
-1.66656, 0.2837599, -1.412084, 1, 0.3176471, 0, 1,
-1.652199, 0.4489098, -1.267361, 1, 0.3254902, 0, 1,
-1.632487, 0.005046668, -1.011764, 1, 0.3294118, 0, 1,
-1.618208, -0.2615888, -1.990592, 1, 0.3372549, 0, 1,
-1.601382, 0.4676046, -2.164176, 1, 0.3411765, 0, 1,
-1.596063, -1.550677, -2.7249, 1, 0.3490196, 0, 1,
-1.590586, 0.1580922, -1.905071, 1, 0.3529412, 0, 1,
-1.583236, -0.7320644, -0.4505469, 1, 0.3607843, 0, 1,
-1.566917, 1.543247, -1.674973, 1, 0.3647059, 0, 1,
-1.560097, -1.119995, -3.501234, 1, 0.372549, 0, 1,
-1.558836, -0.02494816, -2.479319, 1, 0.3764706, 0, 1,
-1.554886, -1.880018, -1.221819, 1, 0.3843137, 0, 1,
-1.543949, 0.6224366, -1.027513, 1, 0.3882353, 0, 1,
-1.530277, -0.7679525, -2.101656, 1, 0.3960784, 0, 1,
-1.525712, 0.384734, -3.129138, 1, 0.4039216, 0, 1,
-1.518625, -1.575016, -2.404202, 1, 0.4078431, 0, 1,
-1.516466, -2.2064, -2.189547, 1, 0.4156863, 0, 1,
-1.513184, -0.1744195, -3.090649, 1, 0.4196078, 0, 1,
-1.508938, 0.4042654, -1.590151, 1, 0.427451, 0, 1,
-1.507395, 0.7444577, -0.7566643, 1, 0.4313726, 0, 1,
-1.498129, 0.6615759, 0.6015193, 1, 0.4392157, 0, 1,
-1.495691, 0.3395851, -2.473032, 1, 0.4431373, 0, 1,
-1.492366, 1.795102, 0.4024206, 1, 0.4509804, 0, 1,
-1.479171, -0.3398034, -4.834971, 1, 0.454902, 0, 1,
-1.462202, -1.16806, -1.661361, 1, 0.4627451, 0, 1,
-1.453178, 0.5701106, -1.523946, 1, 0.4666667, 0, 1,
-1.433197, -0.004196737, -1.260166, 1, 0.4745098, 0, 1,
-1.43064, -0.3075644, -2.371511, 1, 0.4784314, 0, 1,
-1.428033, -2.779991, -2.721776, 1, 0.4862745, 0, 1,
-1.427251, -0.7831119, -3.025041, 1, 0.4901961, 0, 1,
-1.410812, -0.3515849, -2.071568, 1, 0.4980392, 0, 1,
-1.394198, -2.726595, -4.144467, 1, 0.5058824, 0, 1,
-1.389575, 0.0614287, -1.05833, 1, 0.509804, 0, 1,
-1.383789, -0.02809829, -2.73281, 1, 0.5176471, 0, 1,
-1.371015, -0.8446379, -2.106437, 1, 0.5215687, 0, 1,
-1.369845, 0.4242169, -1.84682, 1, 0.5294118, 0, 1,
-1.350782, -1.327144, -5.32623, 1, 0.5333334, 0, 1,
-1.344273, 0.7153884, -2.315054, 1, 0.5411765, 0, 1,
-1.331289, 0.1872013, -5.73805, 1, 0.5450981, 0, 1,
-1.31219, 1.009358, -3.413084, 1, 0.5529412, 0, 1,
-1.309116, 0.8201211, -3.858292, 1, 0.5568628, 0, 1,
-1.307464, -0.350373, -1.958377, 1, 0.5647059, 0, 1,
-1.30148, -1.340369, -3.256003, 1, 0.5686275, 0, 1,
-1.298116, 0.9624709, 1.616415, 1, 0.5764706, 0, 1,
-1.289238, 0.5590476, -1.473777, 1, 0.5803922, 0, 1,
-1.274666, 1.367514, -1.933231, 1, 0.5882353, 0, 1,
-1.273888, 0.2930009, 0.9218088, 1, 0.5921569, 0, 1,
-1.267115, -2.012632, -2.907469, 1, 0.6, 0, 1,
-1.257524, -0.3201685, -1.817413, 1, 0.6078432, 0, 1,
-1.252587, -0.755091, -2.927325, 1, 0.6117647, 0, 1,
-1.24866, 1.509426, 0.08394971, 1, 0.6196079, 0, 1,
-1.228652, 0.07662711, -0.9462359, 1, 0.6235294, 0, 1,
-1.227942, 0.1625988, -2.168078, 1, 0.6313726, 0, 1,
-1.221973, -2.621115e-05, -2.324847, 1, 0.6352941, 0, 1,
-1.212081, -0.09803831, -3.42944, 1, 0.6431373, 0, 1,
-1.196882, 1.170679, -1.720627, 1, 0.6470588, 0, 1,
-1.194816, -1.226732, -2.925838, 1, 0.654902, 0, 1,
-1.19325, 0.9457428, -0.3871588, 1, 0.6588235, 0, 1,
-1.184724, 1.398231, -0.2734106, 1, 0.6666667, 0, 1,
-1.183765, -2.561549, -2.472202, 1, 0.6705883, 0, 1,
-1.183347, 0.1036358, -1.046284, 1, 0.6784314, 0, 1,
-1.179246, -0.5995585, -1.28533, 1, 0.682353, 0, 1,
-1.178182, 0.1153424, -0.3974721, 1, 0.6901961, 0, 1,
-1.178146, 0.6198682, -1.61381, 1, 0.6941177, 0, 1,
-1.177219, 0.4672846, -0.6195986, 1, 0.7019608, 0, 1,
-1.175346, -0.7871391, -0.5325316, 1, 0.7098039, 0, 1,
-1.170325, 0.5738341, -0.7938167, 1, 0.7137255, 0, 1,
-1.167597, 1.47683, -1.195873, 1, 0.7215686, 0, 1,
-1.164959, 0.5086946, -1.512595, 1, 0.7254902, 0, 1,
-1.162373, -0.2385892, -2.434685, 1, 0.7333333, 0, 1,
-1.153164, -0.09346914, -0.4977263, 1, 0.7372549, 0, 1,
-1.147488, 0.3971229, -1.496165, 1, 0.7450981, 0, 1,
-1.147362, 0.235814, -2.045751, 1, 0.7490196, 0, 1,
-1.14406, 1.115861, -0.9160691, 1, 0.7568628, 0, 1,
-1.140631, 0.2475781, -1.36171, 1, 0.7607843, 0, 1,
-1.135342, -0.1301258, -1.419351, 1, 0.7686275, 0, 1,
-1.133584, 0.8883017, -0.2617371, 1, 0.772549, 0, 1,
-1.130264, 0.2985354, -3.024359, 1, 0.7803922, 0, 1,
-1.118504, -1.485316, -3.558939, 1, 0.7843137, 0, 1,
-1.115418, -0.07682104, -0.9403867, 1, 0.7921569, 0, 1,
-1.113982, 1.69092, -0.5598536, 1, 0.7960784, 0, 1,
-1.113702, 0.2047083, -1.606318, 1, 0.8039216, 0, 1,
-1.113417, -1.793756, -2.064863, 1, 0.8117647, 0, 1,
-1.107256, -1.770417, -2.57273, 1, 0.8156863, 0, 1,
-1.106011, -1.219734, -3.097967, 1, 0.8235294, 0, 1,
-1.101114, 0.6055962, -0.4313774, 1, 0.827451, 0, 1,
-1.096163, -0.9118544, -3.358858, 1, 0.8352941, 0, 1,
-1.088543, 0.9477186, -0.512574, 1, 0.8392157, 0, 1,
-1.085596, 0.7099214, -1.79423, 1, 0.8470588, 0, 1,
-1.080189, -0.1950416, -1.842967, 1, 0.8509804, 0, 1,
-1.079553, 0.6347767, -1.194728, 1, 0.8588235, 0, 1,
-1.077528, 0.1540655, -2.067625, 1, 0.8627451, 0, 1,
-1.077011, -0.9877082, -2.797013, 1, 0.8705882, 0, 1,
-1.074978, -1.018192, -2.308525, 1, 0.8745098, 0, 1,
-1.062443, 2.102731, -1.982899, 1, 0.8823529, 0, 1,
-1.056103, -0.210295, -3.076276, 1, 0.8862745, 0, 1,
-1.045741, 0.001988522, -0.7981955, 1, 0.8941177, 0, 1,
-1.042398, -2.500004, -1.23433, 1, 0.8980392, 0, 1,
-1.040303, 0.982019, -0.7413036, 1, 0.9058824, 0, 1,
-1.034158, -0.6464056, -3.710425, 1, 0.9137255, 0, 1,
-1.030886, 3.342332, -0.1361714, 1, 0.9176471, 0, 1,
-1.030032, 1.392385, -0.9871156, 1, 0.9254902, 0, 1,
-1.029761, 0.058389, -1.677844, 1, 0.9294118, 0, 1,
-1.024582, -0.1548689, -1.627929, 1, 0.9372549, 0, 1,
-1.024437, -2.153475, -3.353958, 1, 0.9411765, 0, 1,
-1.023064, 1.398677, -1.242666, 1, 0.9490196, 0, 1,
-1.01951, -0.6771281, -1.565762, 1, 0.9529412, 0, 1,
-1.019275, -0.4421116, -3.235326, 1, 0.9607843, 0, 1,
-1.009441, -0.6195706, -0.242032, 1, 0.9647059, 0, 1,
-0.9987062, 0.8937594, -3.17896, 1, 0.972549, 0, 1,
-0.9939188, -0.1182788, -2.387892, 1, 0.9764706, 0, 1,
-0.9935391, -0.991506, -1.281627, 1, 0.9843137, 0, 1,
-0.9904646, 0.1280202, 0.03281972, 1, 0.9882353, 0, 1,
-0.9890915, 0.2563723, -0.9332542, 1, 0.9960784, 0, 1,
-0.9870266, -0.9426553, -4.86596, 0.9960784, 1, 0, 1,
-0.9860673, -1.469928, -2.97776, 0.9921569, 1, 0, 1,
-0.9821289, 3.3922, 0.03807259, 0.9843137, 1, 0, 1,
-0.9808068, 1.640668, -1.006469, 0.9803922, 1, 0, 1,
-0.979332, -0.5992618, -1.741951, 0.972549, 1, 0, 1,
-0.976058, 0.07810593, -2.522948, 0.9686275, 1, 0, 1,
-0.9738044, -0.2995669, -2.348755, 0.9607843, 1, 0, 1,
-0.972615, -1.037397, -3.485356, 0.9568627, 1, 0, 1,
-0.9605544, -0.5879807, -1.274599, 0.9490196, 1, 0, 1,
-0.9557191, 0.6064999, -1.751853, 0.945098, 1, 0, 1,
-0.9502506, 0.1519805, -2.467714, 0.9372549, 1, 0, 1,
-0.9476778, -0.8046536, -1.973048, 0.9333333, 1, 0, 1,
-0.9430788, 0.346864, 0.8275884, 0.9254902, 1, 0, 1,
-0.9426175, 0.4547226, -1.046783, 0.9215686, 1, 0, 1,
-0.9396934, -0.4394638, -3.917327, 0.9137255, 1, 0, 1,
-0.9366389, -1.064644, -3.056648, 0.9098039, 1, 0, 1,
-0.9345973, 1.338787, -2.03137, 0.9019608, 1, 0, 1,
-0.9335721, 0.6456577, -2.161927, 0.8941177, 1, 0, 1,
-0.9322286, -0.4153746, -3.372216, 0.8901961, 1, 0, 1,
-0.9305981, 0.1190827, 0.7909606, 0.8823529, 1, 0, 1,
-0.9275222, 0.6142914, -0.635429, 0.8784314, 1, 0, 1,
-0.9261546, -0.1231649, -2.229453, 0.8705882, 1, 0, 1,
-0.9245408, 0.5964171, -0.7859904, 0.8666667, 1, 0, 1,
-0.9128432, -1.439657, -2.99888, 0.8588235, 1, 0, 1,
-0.90795, 1.007175, -1.882406, 0.854902, 1, 0, 1,
-0.9040312, 1.168274, 0.9212676, 0.8470588, 1, 0, 1,
-0.9033889, -0.7987751, -1.831572, 0.8431373, 1, 0, 1,
-0.901248, -0.1969332, -2.474679, 0.8352941, 1, 0, 1,
-0.895321, -0.06538127, -2.453334, 0.8313726, 1, 0, 1,
-0.8934042, 0.2955439, -1.393192, 0.8235294, 1, 0, 1,
-0.8823823, 1.260821, -1.159147, 0.8196079, 1, 0, 1,
-0.8810961, 0.6656386, -1.423762, 0.8117647, 1, 0, 1,
-0.8699782, -0.06686606, 0.1950126, 0.8078431, 1, 0, 1,
-0.86882, 0.4824569, -2.920739, 0.8, 1, 0, 1,
-0.8677992, -0.1644259, -2.41821, 0.7921569, 1, 0, 1,
-0.8670834, 0.4839049, -2.076448, 0.7882353, 1, 0, 1,
-0.8649439, 0.1033177, 1.109337, 0.7803922, 1, 0, 1,
-0.8603565, -0.9134181, -3.295904, 0.7764706, 1, 0, 1,
-0.8600248, 1.089968, -0.319533, 0.7686275, 1, 0, 1,
-0.8588301, 0.2986853, -1.077378, 0.7647059, 1, 0, 1,
-0.8566743, 0.4973507, -0.9106245, 0.7568628, 1, 0, 1,
-0.8559851, 0.7225705, -2.322226, 0.7529412, 1, 0, 1,
-0.8405699, 0.9742259, -0.5315986, 0.7450981, 1, 0, 1,
-0.8402266, 0.4567613, -1.564814, 0.7411765, 1, 0, 1,
-0.8400052, -0.09336979, -1.742339, 0.7333333, 1, 0, 1,
-0.825754, -1.541831, -1.860465, 0.7294118, 1, 0, 1,
-0.8232101, 0.7599015, -0.8483384, 0.7215686, 1, 0, 1,
-0.8228385, -0.4207718, -1.430909, 0.7176471, 1, 0, 1,
-0.8211026, -0.8518413, -0.4183614, 0.7098039, 1, 0, 1,
-0.8191781, -0.1583359, -1.938402, 0.7058824, 1, 0, 1,
-0.8166249, -0.07711128, -1.896961, 0.6980392, 1, 0, 1,
-0.8086743, 0.1311162, -0.3309783, 0.6901961, 1, 0, 1,
-0.8076314, 0.4271159, -0.1807368, 0.6862745, 1, 0, 1,
-0.8010112, 1.366593, -1.146151, 0.6784314, 1, 0, 1,
-0.798413, -0.7638122, -2.147561, 0.6745098, 1, 0, 1,
-0.7965156, -1.124586, -2.386013, 0.6666667, 1, 0, 1,
-0.7963928, -0.4510505, -1.05511, 0.6627451, 1, 0, 1,
-0.7957954, 0.6865223, 0.05018337, 0.654902, 1, 0, 1,
-0.7956319, -0.5293059, -3.261334, 0.6509804, 1, 0, 1,
-0.7900874, -1.483769, -2.527387, 0.6431373, 1, 0, 1,
-0.7877057, 0.5016226, -0.05176712, 0.6392157, 1, 0, 1,
-0.7862307, 1.211326, -0.1186188, 0.6313726, 1, 0, 1,
-0.7855951, -0.7371364, -2.506617, 0.627451, 1, 0, 1,
-0.7742647, -0.170826, -1.064269, 0.6196079, 1, 0, 1,
-0.7690252, 0.7798932, -0.1177182, 0.6156863, 1, 0, 1,
-0.7673466, -0.01703123, -0.2318358, 0.6078432, 1, 0, 1,
-0.7624531, 0.9363325, -0.5877113, 0.6039216, 1, 0, 1,
-0.7601469, 0.6616603, 2.44941, 0.5960785, 1, 0, 1,
-0.7590774, 0.195117, -0.2961433, 0.5882353, 1, 0, 1,
-0.7586518, -0.1835152, -0.3138297, 0.5843138, 1, 0, 1,
-0.7521418, -1.29909, -1.07499, 0.5764706, 1, 0, 1,
-0.7501655, 0.930169, -2.206691, 0.572549, 1, 0, 1,
-0.7485628, -0.3645314, -2.563391, 0.5647059, 1, 0, 1,
-0.7474557, -0.4730696, -3.868745, 0.5607843, 1, 0, 1,
-0.7340151, -0.5425454, -2.821343, 0.5529412, 1, 0, 1,
-0.7318998, -1.624443, -1.904202, 0.5490196, 1, 0, 1,
-0.728002, 1.619017, -0.4480194, 0.5411765, 1, 0, 1,
-0.7206255, 1.231878, -0.2404012, 0.5372549, 1, 0, 1,
-0.7185354, 0.6522973, 0.2519585, 0.5294118, 1, 0, 1,
-0.7139779, -0.6116644, -2.25278, 0.5254902, 1, 0, 1,
-0.7129911, -1.353391, -2.6862, 0.5176471, 1, 0, 1,
-0.7074654, 0.05849954, -0.1806567, 0.5137255, 1, 0, 1,
-0.7062213, 0.07068043, -1.111784, 0.5058824, 1, 0, 1,
-0.7017918, -0.9036632, -1.166575, 0.5019608, 1, 0, 1,
-0.700474, -0.3824178, -2.890579, 0.4941176, 1, 0, 1,
-0.6957864, -1.978111, -3.562712, 0.4862745, 1, 0, 1,
-0.6917632, 0.1726908, -1.617196, 0.4823529, 1, 0, 1,
-0.6900561, 0.9668497, 0.2486675, 0.4745098, 1, 0, 1,
-0.6896251, -0.3882293, -0.6246666, 0.4705882, 1, 0, 1,
-0.6871607, 0.1328722, -0.7977881, 0.4627451, 1, 0, 1,
-0.6863835, -0.7975713, -2.290604, 0.4588235, 1, 0, 1,
-0.6767249, 0.3780911, -2.528582, 0.4509804, 1, 0, 1,
-0.6719073, 0.3615243, 0.01004352, 0.4470588, 1, 0, 1,
-0.6716235, -1.515186, -1.299, 0.4392157, 1, 0, 1,
-0.6681473, 1.346614, 0.9666129, 0.4352941, 1, 0, 1,
-0.6604988, 1.073058, -0.5833134, 0.427451, 1, 0, 1,
-0.6571572, 0.6019335, -0.5077614, 0.4235294, 1, 0, 1,
-0.6485636, -0.5196497, -2.824893, 0.4156863, 1, 0, 1,
-0.6481632, -0.1760131, -1.928941, 0.4117647, 1, 0, 1,
-0.6475195, 0.1762506, -1.346688, 0.4039216, 1, 0, 1,
-0.6457729, -0.2756387, -0.9561353, 0.3960784, 1, 0, 1,
-0.6451867, -2.211369, -3.491641, 0.3921569, 1, 0, 1,
-0.62594, -0.743295, -2.526394, 0.3843137, 1, 0, 1,
-0.6248689, -0.99944, -3.627576, 0.3803922, 1, 0, 1,
-0.6241853, -0.4452282, -2.249896, 0.372549, 1, 0, 1,
-0.6203392, -0.2007922, -2.720354, 0.3686275, 1, 0, 1,
-0.6172715, 0.1330156, -1.032124, 0.3607843, 1, 0, 1,
-0.6170954, -0.5492368, -1.108232, 0.3568628, 1, 0, 1,
-0.6162003, 0.4366662, -1.450037, 0.3490196, 1, 0, 1,
-0.6159039, 0.6685402, -1.214628, 0.345098, 1, 0, 1,
-0.6152319, -0.05090645, -0.7536489, 0.3372549, 1, 0, 1,
-0.6124921, 0.1237788, -1.501367, 0.3333333, 1, 0, 1,
-0.6066978, 0.2234659, -0.8658913, 0.3254902, 1, 0, 1,
-0.605781, 1.14814, -1.483886, 0.3215686, 1, 0, 1,
-0.6057263, -1.207415, -3.978103, 0.3137255, 1, 0, 1,
-0.6053442, 0.2925356, -1.55948, 0.3098039, 1, 0, 1,
-0.6020488, 0.9693195, -0.0940101, 0.3019608, 1, 0, 1,
-0.6005693, -0.6666679, -2.343538, 0.2941177, 1, 0, 1,
-0.5987864, -2.078286, -2.812838, 0.2901961, 1, 0, 1,
-0.5967659, -0.04167576, -0.7867769, 0.282353, 1, 0, 1,
-0.5966001, -0.03464593, -3.007831, 0.2784314, 1, 0, 1,
-0.5959373, 0.3665779, 0.9100684, 0.2705882, 1, 0, 1,
-0.591985, 1.79043, -1.702419, 0.2666667, 1, 0, 1,
-0.5809111, -0.5234119, -1.833351, 0.2588235, 1, 0, 1,
-0.5778384, -0.6814854, -2.412463, 0.254902, 1, 0, 1,
-0.567026, 0.5568727, -1.13862, 0.2470588, 1, 0, 1,
-0.5618657, 0.9178931, -2.190855, 0.2431373, 1, 0, 1,
-0.5538843, -0.5305156, -0.8535731, 0.2352941, 1, 0, 1,
-0.5528993, -0.4416198, -2.647054, 0.2313726, 1, 0, 1,
-0.5518581, -0.572863, -2.349095, 0.2235294, 1, 0, 1,
-0.5487614, 1.514046, -1.318267, 0.2196078, 1, 0, 1,
-0.5467131, -1.181558, -4.083769, 0.2117647, 1, 0, 1,
-0.5433599, 2.520776, 0.6369615, 0.2078431, 1, 0, 1,
-0.5427347, 0.6225019, -0.6540049, 0.2, 1, 0, 1,
-0.540702, -0.4409639, -0.5069072, 0.1921569, 1, 0, 1,
-0.5341492, -0.7590148, -2.515858, 0.1882353, 1, 0, 1,
-0.5341151, 1.03672, -0.365813, 0.1803922, 1, 0, 1,
-0.5323975, -1.569623, -3.529434, 0.1764706, 1, 0, 1,
-0.5298877, 0.007045863, -0.7915159, 0.1686275, 1, 0, 1,
-0.5237622, 0.6287081, -0.2543, 0.1647059, 1, 0, 1,
-0.5192868, 0.5799852, -1.190993, 0.1568628, 1, 0, 1,
-0.5161875, -0.06506728, -1.997421, 0.1529412, 1, 0, 1,
-0.5152476, -1.0678, -2.891507, 0.145098, 1, 0, 1,
-0.5146616, -0.1063204, -2.306277, 0.1411765, 1, 0, 1,
-0.511335, -0.1515602, 1.528278, 0.1333333, 1, 0, 1,
-0.5049506, -1.439761, -2.265437, 0.1294118, 1, 0, 1,
-0.5007879, 0.3706948, -1.13715, 0.1215686, 1, 0, 1,
-0.4967186, -1.345441, -0.9256799, 0.1176471, 1, 0, 1,
-0.4944606, -1.561922, -2.546293, 0.1098039, 1, 0, 1,
-0.4885449, -0.1011085, -1.179327, 0.1058824, 1, 0, 1,
-0.4849384, 0.5243028, -0.2212296, 0.09803922, 1, 0, 1,
-0.4849367, 2.140703, -2.059054, 0.09019608, 1, 0, 1,
-0.4824595, 0.3424594, -0.7355255, 0.08627451, 1, 0, 1,
-0.4814415, 1.010248, 0.197688, 0.07843138, 1, 0, 1,
-0.4786057, -0.5205208, -1.665952, 0.07450981, 1, 0, 1,
-0.4701174, -0.4789057, -2.133006, 0.06666667, 1, 0, 1,
-0.4691978, 0.827448, -1.14667, 0.0627451, 1, 0, 1,
-0.4621774, 1.061109, -1.193458, 0.05490196, 1, 0, 1,
-0.4564255, 1.812553, -0.8775292, 0.05098039, 1, 0, 1,
-0.4527301, 0.09177445, -1.595047, 0.04313726, 1, 0, 1,
-0.4412823, -0.5066732, -1.364196, 0.03921569, 1, 0, 1,
-0.4404095, 1.067228, -0.8515777, 0.03137255, 1, 0, 1,
-0.4333581, 0.6073961, -1.998967, 0.02745098, 1, 0, 1,
-0.4333093, 0.2929624, -1.974078, 0.01960784, 1, 0, 1,
-0.4318948, -1.236551, -2.498633, 0.01568628, 1, 0, 1,
-0.4306236, 0.0336117, -1.599414, 0.007843138, 1, 0, 1,
-0.4302739, 0.7186807, -1.445176, 0.003921569, 1, 0, 1,
-0.430188, -0.9890153, -1.664147, 0, 1, 0.003921569, 1,
-0.4241827, 0.5859447, -0.05209999, 0, 1, 0.01176471, 1,
-0.4236974, -2.155517, -3.364858, 0, 1, 0.01568628, 1,
-0.4228527, 0.3658872, -1.155312, 0, 1, 0.02352941, 1,
-0.4216999, 1.301276, -1.395027, 0, 1, 0.02745098, 1,
-0.4180934, -1.147074, -3.703537, 0, 1, 0.03529412, 1,
-0.4140946, -1.29592, -2.476337, 0, 1, 0.03921569, 1,
-0.4107675, 0.7366942, 0.575754, 0, 1, 0.04705882, 1,
-0.408688, -0.38061, -3.319368, 0, 1, 0.05098039, 1,
-0.4083798, -0.08643674, -1.676806, 0, 1, 0.05882353, 1,
-0.4052212, 1.368976, 0.04270361, 0, 1, 0.0627451, 1,
-0.3994928, 2.03393, -1.750398, 0, 1, 0.07058824, 1,
-0.3984159, 0.2594513, -0.07493524, 0, 1, 0.07450981, 1,
-0.3959168, -0.4092183, -3.039865, 0, 1, 0.08235294, 1,
-0.3897716, 0.3293269, -1.340102, 0, 1, 0.08627451, 1,
-0.3880129, -1.140619, -1.619001, 0, 1, 0.09411765, 1,
-0.3840299, 0.3185017, -0.4873666, 0, 1, 0.1019608, 1,
-0.3840249, 0.836452, -1.315871, 0, 1, 0.1058824, 1,
-0.3774061, 1.346491, 1.561296, 0, 1, 0.1137255, 1,
-0.3771831, -0.8444551, -1.884573, 0, 1, 0.1176471, 1,
-0.3744134, 0.6707452, -0.6375233, 0, 1, 0.1254902, 1,
-0.373989, -1.027244, -3.172886, 0, 1, 0.1294118, 1,
-0.3720458, 0.3183331, -2.855348, 0, 1, 0.1372549, 1,
-0.3660496, -1.05299, -2.712109, 0, 1, 0.1411765, 1,
-0.3659718, 1.556098, -1.086267, 0, 1, 0.1490196, 1,
-0.362151, -0.1554543, -1.87842, 0, 1, 0.1529412, 1,
-0.3620102, -0.7990667, -3.019625, 0, 1, 0.1607843, 1,
-0.3616413, 0.3985226, -1.41179, 0, 1, 0.1647059, 1,
-0.3598038, 0.6144411, -0.3795661, 0, 1, 0.172549, 1,
-0.3584062, 0.7002537, 1.457277, 0, 1, 0.1764706, 1,
-0.3539539, -0.118388, -2.908402, 0, 1, 0.1843137, 1,
-0.3517017, -0.1737753, -2.202227, 0, 1, 0.1882353, 1,
-0.351406, 1.987536, -0.3023044, 0, 1, 0.1960784, 1,
-0.3506175, -0.2851492, -4.877051, 0, 1, 0.2039216, 1,
-0.3494534, -0.2211476, -4.058831, 0, 1, 0.2078431, 1,
-0.3490457, -2.336853, -3.106538, 0, 1, 0.2156863, 1,
-0.3431356, 1.270415, -0.6796645, 0, 1, 0.2196078, 1,
-0.3410371, 0.6472086, 0.1405406, 0, 1, 0.227451, 1,
-0.3354058, -0.6599036, -4.004478, 0, 1, 0.2313726, 1,
-0.3336058, 0.556797, -0.9180482, 0, 1, 0.2392157, 1,
-0.3330317, -1.055442, -1.732955, 0, 1, 0.2431373, 1,
-0.3307807, -0.9960793, -2.940465, 0, 1, 0.2509804, 1,
-0.3288211, 0.3083078, -0.6515948, 0, 1, 0.254902, 1,
-0.3285466, 0.2608436, -1.592523, 0, 1, 0.2627451, 1,
-0.3270938, 0.2129555, -0.8117577, 0, 1, 0.2666667, 1,
-0.3240515, -1.09432, -3.151779, 0, 1, 0.2745098, 1,
-0.3106648, -0.4844248, -2.941426, 0, 1, 0.2784314, 1,
-0.3104164, -0.5218769, -3.245527, 0, 1, 0.2862745, 1,
-0.3029717, 0.8538799, -0.7082109, 0, 1, 0.2901961, 1,
-0.3010806, -0.311909, -3.068338, 0, 1, 0.2980392, 1,
-0.2958982, -0.5759889, -2.622861, 0, 1, 0.3058824, 1,
-0.2870194, 0.8722627, 0.525434, 0, 1, 0.3098039, 1,
-0.2857234, 0.366195, -1.262193, 0, 1, 0.3176471, 1,
-0.2842879, 0.3317969, 0.5109233, 0, 1, 0.3215686, 1,
-0.2810946, 0.5957051, -0.7823518, 0, 1, 0.3294118, 1,
-0.2793705, -0.3028694, -1.071579, 0, 1, 0.3333333, 1,
-0.2774465, -0.5558388, -4.612808, 0, 1, 0.3411765, 1,
-0.2751818, 1.33978, 0.1273209, 0, 1, 0.345098, 1,
-0.2730758, 0.87275, 0.9727306, 0, 1, 0.3529412, 1,
-0.2726885, -0.5117292, -3.265397, 0, 1, 0.3568628, 1,
-0.2715507, 1.702066, 1.351189, 0, 1, 0.3647059, 1,
-0.2691407, -0.1512983, -2.863777, 0, 1, 0.3686275, 1,
-0.2677336, 0.9876412, 1.137044, 0, 1, 0.3764706, 1,
-0.2677066, -0.3472396, -1.696221, 0, 1, 0.3803922, 1,
-0.2661333, 0.6794229, -0.7384112, 0, 1, 0.3882353, 1,
-0.258161, 1.1106, 1.068673, 0, 1, 0.3921569, 1,
-0.2455987, -0.01874272, -1.318985, 0, 1, 0.4, 1,
-0.2445218, -0.004618917, -2.057277, 0, 1, 0.4078431, 1,
-0.2436448, -0.8537008, -4.146664, 0, 1, 0.4117647, 1,
-0.2417525, 0.7118952, 0.8257651, 0, 1, 0.4196078, 1,
-0.2408332, -0.4338835, -3.924445, 0, 1, 0.4235294, 1,
-0.2401324, -1.549689, -1.762651, 0, 1, 0.4313726, 1,
-0.2341931, 0.751147, -1.46009, 0, 1, 0.4352941, 1,
-0.233052, -1.652231, -1.576082, 0, 1, 0.4431373, 1,
-0.2295079, 1.135907, 0.07633137, 0, 1, 0.4470588, 1,
-0.2289055, 0.4701654, 0.2604211, 0, 1, 0.454902, 1,
-0.2228332, 0.4407085, -2.380125, 0, 1, 0.4588235, 1,
-0.2202937, -0.06673764, -2.336085, 0, 1, 0.4666667, 1,
-0.2180645, -0.6725243, -4.044686, 0, 1, 0.4705882, 1,
-0.2170864, 0.2295026, -0.6333551, 0, 1, 0.4784314, 1,
-0.2167992, -0.4826823, -1.52171, 0, 1, 0.4823529, 1,
-0.2165758, 0.4302231, 1.080992, 0, 1, 0.4901961, 1,
-0.2158937, -2.351116, -3.757793, 0, 1, 0.4941176, 1,
-0.2003902, 0.4248389, 0.1943171, 0, 1, 0.5019608, 1,
-0.1984903, 1.103272, -1.131721, 0, 1, 0.509804, 1,
-0.1961749, -0.7118624, -3.414779, 0, 1, 0.5137255, 1,
-0.1956145, -1.083279, -5.030302, 0, 1, 0.5215687, 1,
-0.1948492, -1.513619, -1.436403, 0, 1, 0.5254902, 1,
-0.1937839, 1.588431, 0.08312093, 0, 1, 0.5333334, 1,
-0.1862362, -1.261781, -2.300643, 0, 1, 0.5372549, 1,
-0.1849859, -0.3235174, -2.739318, 0, 1, 0.5450981, 1,
-0.1826278, -0.1042375, -2.627644, 0, 1, 0.5490196, 1,
-0.1814121, -1.83029, -0.7548645, 0, 1, 0.5568628, 1,
-0.1801217, -1.185311, -2.720935, 0, 1, 0.5607843, 1,
-0.1717677, 0.807052, -0.3741173, 0, 1, 0.5686275, 1,
-0.1707638, -0.4280138, -0.9677752, 0, 1, 0.572549, 1,
-0.167449, -0.8540717, -2.116469, 0, 1, 0.5803922, 1,
-0.1664677, -1.875823, -1.986416, 0, 1, 0.5843138, 1,
-0.1647973, -0.9334309, -2.845838, 0, 1, 0.5921569, 1,
-0.1542382, -0.4284823, -2.466854, 0, 1, 0.5960785, 1,
-0.1522845, 0.7936279, -0.5413389, 0, 1, 0.6039216, 1,
-0.1487018, -0.7731034, -3.023828, 0, 1, 0.6117647, 1,
-0.1443987, -0.09476021, -2.85638, 0, 1, 0.6156863, 1,
-0.1428645, 0.970457, 0.5066679, 0, 1, 0.6235294, 1,
-0.1374523, -1.022538, -2.064842, 0, 1, 0.627451, 1,
-0.1368025, 0.1703871, 0.9489366, 0, 1, 0.6352941, 1,
-0.1325106, -1.765237, -2.800286, 0, 1, 0.6392157, 1,
-0.1235211, 0.3327909, 0.208659, 0, 1, 0.6470588, 1,
-0.1189585, -1.603197, -3.211507, 0, 1, 0.6509804, 1,
-0.1124977, 1.735404, -2.058243, 0, 1, 0.6588235, 1,
-0.1105195, 0.5155567, 1.674684, 0, 1, 0.6627451, 1,
-0.1087011, 1.387674, 0.9500488, 0, 1, 0.6705883, 1,
-0.107982, -1.136643, -1.858468, 0, 1, 0.6745098, 1,
-0.1076251, -0.7030734, -4.78567, 0, 1, 0.682353, 1,
-0.107135, -0.7570719, -4.15369, 0, 1, 0.6862745, 1,
-0.1064716, 0.5269297, -0.2063451, 0, 1, 0.6941177, 1,
-0.1059187, 0.8714471, 0.7232074, 0, 1, 0.7019608, 1,
-0.1050366, 1.230932, -0.6679491, 0, 1, 0.7058824, 1,
-0.09982015, -0.395507, -3.598223, 0, 1, 0.7137255, 1,
-0.09827586, 1.322918, -0.6376663, 0, 1, 0.7176471, 1,
-0.09620851, -0.3536499, -3.431195, 0, 1, 0.7254902, 1,
-0.09151655, 1.761296, -0.09123606, 0, 1, 0.7294118, 1,
-0.09100495, 0.5167404, -0.3781871, 0, 1, 0.7372549, 1,
-0.08850627, -2.204565, -3.001911, 0, 1, 0.7411765, 1,
-0.08277498, 0.573946, -1.315378, 0, 1, 0.7490196, 1,
-0.08049525, 1.459916, 1.219973, 0, 1, 0.7529412, 1,
-0.08017755, 1.771773, -0.37158, 0, 1, 0.7607843, 1,
-0.07251441, 2.047469, -1.606649, 0, 1, 0.7647059, 1,
-0.07166398, -1.633723, -2.380583, 0, 1, 0.772549, 1,
-0.06422115, 0.2523757, 0.4240921, 0, 1, 0.7764706, 1,
-0.0612148, -0.4057675, -3.48924, 0, 1, 0.7843137, 1,
-0.05979526, -1.616462, -3.091912, 0, 1, 0.7882353, 1,
-0.05013383, 1.495659, 0.02866109, 0, 1, 0.7960784, 1,
-0.04846046, 1.824196, -2.275774, 0, 1, 0.8039216, 1,
-0.04631682, -1.327107, -3.104255, 0, 1, 0.8078431, 1,
-0.04435613, -0.03627396, -2.955633, 0, 1, 0.8156863, 1,
-0.04389791, 0.8045844, 0.4386578, 0, 1, 0.8196079, 1,
-0.04329384, 2.897137, -0.04109024, 0, 1, 0.827451, 1,
-0.03887494, -0.1969682, -2.928478, 0, 1, 0.8313726, 1,
-0.03141821, 0.009332622, -1.066252, 0, 1, 0.8392157, 1,
-0.03051583, 1.019636, 2.179776, 0, 1, 0.8431373, 1,
-0.02094512, 0.1313731, -0.2794735, 0, 1, 0.8509804, 1,
-0.01880146, 0.9930147, -2.198998, 0, 1, 0.854902, 1,
-0.0162527, 1.332605, 0.07803244, 0, 1, 0.8627451, 1,
-0.01530202, 1.007598, 0.08431095, 0, 1, 0.8666667, 1,
-0.0151556, 0.0979534, 1.046931, 0, 1, 0.8745098, 1,
-0.0136917, -0.9443755, -4.095953, 0, 1, 0.8784314, 1,
-0.0006534189, -0.764245, -3.825743, 0, 1, 0.8862745, 1,
3.264722e-05, -0.1054161, 2.430695, 0, 1, 0.8901961, 1,
0.001614939, -0.5716558, 2.282056, 0, 1, 0.8980392, 1,
0.003282179, 0.2401834, 0.2193584, 0, 1, 0.9058824, 1,
0.003331326, -0.1854751, 0.52118, 0, 1, 0.9098039, 1,
0.004691833, -0.9491966, 2.920682, 0, 1, 0.9176471, 1,
0.005788642, -0.3491654, 2.761593, 0, 1, 0.9215686, 1,
0.007879843, 0.2849918, -1.256741, 0, 1, 0.9294118, 1,
0.01016523, 0.6988953, 2.21091, 0, 1, 0.9333333, 1,
0.01227, 0.4675116, 2.075533, 0, 1, 0.9411765, 1,
0.01675286, -0.5810848, 4.405577, 0, 1, 0.945098, 1,
0.01783858, -1.653223, 1.53483, 0, 1, 0.9529412, 1,
0.02074322, 1.239957, -0.4970983, 0, 1, 0.9568627, 1,
0.0210418, -1.315561, 4.076964, 0, 1, 0.9647059, 1,
0.02124375, -0.07252765, 2.190398, 0, 1, 0.9686275, 1,
0.02348357, 0.8339937, 0.7178365, 0, 1, 0.9764706, 1,
0.02490093, -0.6685978, 3.630969, 0, 1, 0.9803922, 1,
0.02645717, 0.8416413, 0.7998458, 0, 1, 0.9882353, 1,
0.02852396, -0.34843, 2.488219, 0, 1, 0.9921569, 1,
0.03074623, -0.3914238, 3.520278, 0, 1, 1, 1,
0.03513398, 0.02568477, 1.098993, 0, 0.9921569, 1, 1,
0.03888717, -0.5541123, 2.190318, 0, 0.9882353, 1, 1,
0.0428192, -0.6126311, 3.241386, 0, 0.9803922, 1, 1,
0.04318586, -1.104682, 3.648556, 0, 0.9764706, 1, 1,
0.04401801, 1.435825, -0.2292514, 0, 0.9686275, 1, 1,
0.04506621, -1.002888, 3.602672, 0, 0.9647059, 1, 1,
0.04570831, 0.4600092, 0.4531165, 0, 0.9568627, 1, 1,
0.05911145, 0.6486669, 0.3595878, 0, 0.9529412, 1, 1,
0.06424516, 0.5792827, 0.9417491, 0, 0.945098, 1, 1,
0.06627064, -0.199941, 1.624024, 0, 0.9411765, 1, 1,
0.06760602, -0.6847006, 0.858503, 0, 0.9333333, 1, 1,
0.06773119, 0.9715984, -0.3785093, 0, 0.9294118, 1, 1,
0.07042291, 0.2634328, 0.7191247, 0, 0.9215686, 1, 1,
0.07366844, -0.2106172, 1.189517, 0, 0.9176471, 1, 1,
0.0739474, -0.2418535, 1.682959, 0, 0.9098039, 1, 1,
0.07775601, -1.553479, 3.582075, 0, 0.9058824, 1, 1,
0.08293666, -0.8288554, 2.839911, 0, 0.8980392, 1, 1,
0.08695891, 0.827664, 0.7915686, 0, 0.8901961, 1, 1,
0.08916134, 0.7190721, -0.2434287, 0, 0.8862745, 1, 1,
0.08966174, 0.5693953, 0.5197828, 0, 0.8784314, 1, 1,
0.09073269, 0.8665043, 1.7029, 0, 0.8745098, 1, 1,
0.09270918, 0.8941721, -0.3669608, 0, 0.8666667, 1, 1,
0.09395888, 0.4767562, -0.9567063, 0, 0.8627451, 1, 1,
0.1057415, -0.6269976, 3.607989, 0, 0.854902, 1, 1,
0.1067044, 0.01503653, 1.541864, 0, 0.8509804, 1, 1,
0.1069849, -0.6777343, 0.6817911, 0, 0.8431373, 1, 1,
0.1073355, 0.03035865, 0.9474895, 0, 0.8392157, 1, 1,
0.1115998, -1.16385, 3.664914, 0, 0.8313726, 1, 1,
0.1139688, -0.126474, 3.298582, 0, 0.827451, 1, 1,
0.1196205, 0.1267186, 3.181724, 0, 0.8196079, 1, 1,
0.1215843, 0.5541826, 1.274952, 0, 0.8156863, 1, 1,
0.1274512, 1.504695, 0.7116311, 0, 0.8078431, 1, 1,
0.1327305, 0.6375374, 0.9755881, 0, 0.8039216, 1, 1,
0.1373956, 0.8327284, 1.928467, 0, 0.7960784, 1, 1,
0.1375686, 1.448386, -1.162523, 0, 0.7882353, 1, 1,
0.1401654, -2.225279, 3.957837, 0, 0.7843137, 1, 1,
0.1407256, -0.3346418, 1.791534, 0, 0.7764706, 1, 1,
0.1480921, -0.1106438, 2.422418, 0, 0.772549, 1, 1,
0.1551694, 0.6809792, -0.09076218, 0, 0.7647059, 1, 1,
0.1601951, 2.192839, 0.4163212, 0, 0.7607843, 1, 1,
0.1613085, -1.06615, 3.845086, 0, 0.7529412, 1, 1,
0.1633269, 0.5758427, -0.9463766, 0, 0.7490196, 1, 1,
0.1684394, -0.6504918, 3.613981, 0, 0.7411765, 1, 1,
0.1692317, 1.117095, 0.8478727, 0, 0.7372549, 1, 1,
0.1731736, 0.2554266, 0.4118702, 0, 0.7294118, 1, 1,
0.1763969, -0.4206223, 2.814019, 0, 0.7254902, 1, 1,
0.1771645, 0.5665146, 1.585804, 0, 0.7176471, 1, 1,
0.1819224, -0.1623711, 1.405509, 0, 0.7137255, 1, 1,
0.1820776, -0.2511346, 2.886692, 0, 0.7058824, 1, 1,
0.1824755, -0.9263904, 3.350542, 0, 0.6980392, 1, 1,
0.186654, -1.26226, 2.89095, 0, 0.6941177, 1, 1,
0.1880212, -0.3803068, 2.525671, 0, 0.6862745, 1, 1,
0.1965337, -0.1070053, 2.866455, 0, 0.682353, 1, 1,
0.1974085, -0.02371568, 2.616697, 0, 0.6745098, 1, 1,
0.2021615, -0.3065146, 3.700636, 0, 0.6705883, 1, 1,
0.2061984, -0.4248024, 2.305585, 0, 0.6627451, 1, 1,
0.2072648, -1.419689, 2.364359, 0, 0.6588235, 1, 1,
0.2076626, -0.4756995, 4.379608, 0, 0.6509804, 1, 1,
0.2094239, -0.6662312, 2.50949, 0, 0.6470588, 1, 1,
0.2095831, 1.415208, -1.470052, 0, 0.6392157, 1, 1,
0.224213, -0.04926821, 3.699947, 0, 0.6352941, 1, 1,
0.2280119, 0.7755551, 1.000525, 0, 0.627451, 1, 1,
0.2318445, -1.122081, 4.277924, 0, 0.6235294, 1, 1,
0.2332195, 1.402595, -0.7879068, 0, 0.6156863, 1, 1,
0.2391457, 0.1857474, 3.036854, 0, 0.6117647, 1, 1,
0.2436436, 1.798088, 1.359841, 0, 0.6039216, 1, 1,
0.2437167, -0.3674583, 2.40507, 0, 0.5960785, 1, 1,
0.245056, -0.8353121, 3.88811, 0, 0.5921569, 1, 1,
0.2463016, -0.9908869, 3.608919, 0, 0.5843138, 1, 1,
0.249469, -0.5309104, 1.698414, 0, 0.5803922, 1, 1,
0.2495222, 0.1795568, -0.1480811, 0, 0.572549, 1, 1,
0.250956, 1.692768, 1.697309, 0, 0.5686275, 1, 1,
0.2513537, -0.0363327, 0.2988306, 0, 0.5607843, 1, 1,
0.2605523, 0.3486564, -1.263564, 0, 0.5568628, 1, 1,
0.2624914, -0.905205, 1.920099, 0, 0.5490196, 1, 1,
0.2645617, 0.3795258, -0.5690452, 0, 0.5450981, 1, 1,
0.2718491, -1.83528, 4.271275, 0, 0.5372549, 1, 1,
0.2719302, -0.2325988, 2.551322, 0, 0.5333334, 1, 1,
0.2764295, -1.390539, 2.62251, 0, 0.5254902, 1, 1,
0.2770136, 1.382001, 0.1479688, 0, 0.5215687, 1, 1,
0.2808188, 0.8565123, 2.210931, 0, 0.5137255, 1, 1,
0.2856609, -1.405634, 5.193758, 0, 0.509804, 1, 1,
0.290232, -1.173057, 3.124678, 0, 0.5019608, 1, 1,
0.2915137, -2.559411, 3.582355, 0, 0.4941176, 1, 1,
0.3002505, -0.3062171, 2.162411, 0, 0.4901961, 1, 1,
0.3006196, 0.2160303, 1.833393, 0, 0.4823529, 1, 1,
0.3037364, 0.3563576, 1.875057, 0, 0.4784314, 1, 1,
0.3045331, 0.3996156, -1.102988, 0, 0.4705882, 1, 1,
0.3054059, 0.754483, 0.7244233, 0, 0.4666667, 1, 1,
0.307621, 1.01318, 0.3015245, 0, 0.4588235, 1, 1,
0.3081871, -0.8964808, 2.572731, 0, 0.454902, 1, 1,
0.3102175, -1.634962, 2.340969, 0, 0.4470588, 1, 1,
0.3133046, -0.1279931, 2.844264, 0, 0.4431373, 1, 1,
0.3152058, -0.01634409, 4.761897, 0, 0.4352941, 1, 1,
0.3233007, 0.546539, 1.162945, 0, 0.4313726, 1, 1,
0.3235128, 0.1267652, -1.52313, 0, 0.4235294, 1, 1,
0.323613, -0.9000075, 3.238386, 0, 0.4196078, 1, 1,
0.3280107, -1.784632, 4.380992, 0, 0.4117647, 1, 1,
0.3367504, -1.773296, 2.695998, 0, 0.4078431, 1, 1,
0.337222, -0.4495011, 2.699305, 0, 0.4, 1, 1,
0.3375884, -0.2456546, 3.020392, 0, 0.3921569, 1, 1,
0.3389493, 0.1237147, 1.403971, 0, 0.3882353, 1, 1,
0.3440829, 1.309004, -0.5836627, 0, 0.3803922, 1, 1,
0.3466028, -0.7860925, 3.380325, 0, 0.3764706, 1, 1,
0.351111, -0.6646066, 2.481248, 0, 0.3686275, 1, 1,
0.3517809, -0.1847671, 1.070934, 0, 0.3647059, 1, 1,
0.3532327, 0.1031249, 0.4599242, 0, 0.3568628, 1, 1,
0.3542615, -0.777402, 2.584866, 0, 0.3529412, 1, 1,
0.3555362, 0.3744348, 0.5841004, 0, 0.345098, 1, 1,
0.3583928, 1.155921, 0.5339584, 0, 0.3411765, 1, 1,
0.3584148, 1.018545, 0.3479799, 0, 0.3333333, 1, 1,
0.3615642, -1.190514, 3.677844, 0, 0.3294118, 1, 1,
0.3643315, -2.021398, 3.046429, 0, 0.3215686, 1, 1,
0.3661701, -1.654017, 4.571687, 0, 0.3176471, 1, 1,
0.3669251, 1.112844, -0.2057182, 0, 0.3098039, 1, 1,
0.3684425, -1.726489, 2.140944, 0, 0.3058824, 1, 1,
0.3702695, 0.4205456, 2.901369, 0, 0.2980392, 1, 1,
0.3724295, 0.595004, -0.4680667, 0, 0.2901961, 1, 1,
0.3745105, 1.187604, 0.05339273, 0, 0.2862745, 1, 1,
0.3786715, 1.284535, 0.6766808, 0, 0.2784314, 1, 1,
0.3820123, 1.014439, 0.9521555, 0, 0.2745098, 1, 1,
0.3830582, 0.168226, 1.209596, 0, 0.2666667, 1, 1,
0.3846604, -0.8051015, 2.828706, 0, 0.2627451, 1, 1,
0.3871377, -0.7720334, 5.215604, 0, 0.254902, 1, 1,
0.3912902, -1.116487, 2.615334, 0, 0.2509804, 1, 1,
0.3920157, -0.3739574, 1.139557, 0, 0.2431373, 1, 1,
0.3924378, -0.3789035, 2.461706, 0, 0.2392157, 1, 1,
0.3980195, -1.650462, 3.679497, 0, 0.2313726, 1, 1,
0.408113, -1.049178, 1.263998, 0, 0.227451, 1, 1,
0.4089246, -1.697903, 1.394382, 0, 0.2196078, 1, 1,
0.412357, -0.7335685, 2.867284, 0, 0.2156863, 1, 1,
0.4151281, 0.3575194, 0.8855395, 0, 0.2078431, 1, 1,
0.4167861, 0.1016934, 0.2331927, 0, 0.2039216, 1, 1,
0.4168659, 0.3920261, 1.821484, 0, 0.1960784, 1, 1,
0.4181543, 1.094527, 0.8538681, 0, 0.1882353, 1, 1,
0.4254752, -0.8783939, 3.280097, 0, 0.1843137, 1, 1,
0.4319423, 0.4179674, 2.532658, 0, 0.1764706, 1, 1,
0.4326655, -0.6949229, 2.768373, 0, 0.172549, 1, 1,
0.4419542, 1.387584, -1.281108, 0, 0.1647059, 1, 1,
0.4436887, -0.1486783, 1.382578, 0, 0.1607843, 1, 1,
0.4454286, 0.1647748, 1.640842, 0, 0.1529412, 1, 1,
0.449672, -0.6776707, 1.698825, 0, 0.1490196, 1, 1,
0.4531248, 0.06298737, 1.354181, 0, 0.1411765, 1, 1,
0.4548889, 1.487476, 0.4349688, 0, 0.1372549, 1, 1,
0.4582483, -1.001783, 2.256171, 0, 0.1294118, 1, 1,
0.4600627, 0.5199383, 1.354002, 0, 0.1254902, 1, 1,
0.4606466, 0.5046161, -0.2851402, 0, 0.1176471, 1, 1,
0.4624009, 0.7111989, 0.8791903, 0, 0.1137255, 1, 1,
0.4652299, -0.1289459, 1.018517, 0, 0.1058824, 1, 1,
0.4709791, 0.2550785, -0.1107599, 0, 0.09803922, 1, 1,
0.4730763, -0.4498554, 0.5829321, 0, 0.09411765, 1, 1,
0.4747412, 0.1198954, 0.1950779, 0, 0.08627451, 1, 1,
0.4749094, 0.03205718, 0.2665418, 0, 0.08235294, 1, 1,
0.4775588, 0.5210319, 2.365784, 0, 0.07450981, 1, 1,
0.4777391, -0.7426558, 2.435179, 0, 0.07058824, 1, 1,
0.4883001, 1.565945, 2.375031, 0, 0.0627451, 1, 1,
0.4895481, 0.222416, 0.08568412, 0, 0.05882353, 1, 1,
0.4898268, -0.5423803, 2.757313, 0, 0.05098039, 1, 1,
0.4931584, -0.6056981, 1.754413, 0, 0.04705882, 1, 1,
0.4943516, 1.817013, 1.228376, 0, 0.03921569, 1, 1,
0.4959962, 1.224877, 0.2048391, 0, 0.03529412, 1, 1,
0.4981325, -0.1925645, 2.977312, 0, 0.02745098, 1, 1,
0.4982441, -0.4405451, 3.13893, 0, 0.02352941, 1, 1,
0.499555, 1.060567, 0.7566503, 0, 0.01568628, 1, 1,
0.4996023, 0.9704721, 1.729568, 0, 0.01176471, 1, 1,
0.5101613, 1.154161, 1.549748, 0, 0.003921569, 1, 1,
0.5107683, 0.353514, 1.176865, 0.003921569, 0, 1, 1,
0.5111951, -0.1125654, 2.003437, 0.007843138, 0, 1, 1,
0.515762, 1.578477, -0.5475377, 0.01568628, 0, 1, 1,
0.5158061, 1.128431, -0.6017687, 0.01960784, 0, 1, 1,
0.5165439, 0.5824996, 2.644647, 0.02745098, 0, 1, 1,
0.5180106, -0.9784753, 2.938649, 0.03137255, 0, 1, 1,
0.5196712, -1.616816, 2.625278, 0.03921569, 0, 1, 1,
0.5199472, 0.5723063, -0.6522981, 0.04313726, 0, 1, 1,
0.5206866, -0.5634199, 2.094436, 0.05098039, 0, 1, 1,
0.5228295, 0.7474015, -0.6885766, 0.05490196, 0, 1, 1,
0.5279371, 0.7408708, 0.7441199, 0.0627451, 0, 1, 1,
0.5339829, -0.6466367, 1.493455, 0.06666667, 0, 1, 1,
0.5381761, 0.5735357, 0.3502084, 0.07450981, 0, 1, 1,
0.5400637, 0.1830077, 1.423647, 0.07843138, 0, 1, 1,
0.5448804, -0.2558629, 0.680917, 0.08627451, 0, 1, 1,
0.5494672, 1.651064, 1.176003, 0.09019608, 0, 1, 1,
0.550198, 0.6926164, 1.167871, 0.09803922, 0, 1, 1,
0.5539265, -1.272543, 1.402684, 0.1058824, 0, 1, 1,
0.5596924, 0.0276684, 2.993452, 0.1098039, 0, 1, 1,
0.5603981, 0.2633783, -0.1280834, 0.1176471, 0, 1, 1,
0.562298, 0.09204272, 1.214789, 0.1215686, 0, 1, 1,
0.5668373, -0.7058432, 2.064859, 0.1294118, 0, 1, 1,
0.5668731, 0.7869378, 1.472523, 0.1333333, 0, 1, 1,
0.5759608, 0.5767268, 0.2628622, 0.1411765, 0, 1, 1,
0.5763273, -0.06906229, 1.475977, 0.145098, 0, 1, 1,
0.5769899, 1.019385, 2.097714, 0.1529412, 0, 1, 1,
0.5816732, 1.008492, 0.9932204, 0.1568628, 0, 1, 1,
0.5828355, 0.04886733, 0.9243761, 0.1647059, 0, 1, 1,
0.587164, 0.1080101, 0.5439431, 0.1686275, 0, 1, 1,
0.5906405, 0.3129728, 1.26519, 0.1764706, 0, 1, 1,
0.5914465, 0.6613086, 1.497106, 0.1803922, 0, 1, 1,
0.5999592, -0.5195339, 2.071123, 0.1882353, 0, 1, 1,
0.6004313, -0.5530494, 0.9574205, 0.1921569, 0, 1, 1,
0.6113615, -0.7528307, 2.168084, 0.2, 0, 1, 1,
0.6126153, -1.20346, 1.903373, 0.2078431, 0, 1, 1,
0.6146228, 1.414036, 1.296824, 0.2117647, 0, 1, 1,
0.6165498, -2.215658, 1.278283, 0.2196078, 0, 1, 1,
0.6174996, 0.5242521, 1.850609, 0.2235294, 0, 1, 1,
0.6188371, 0.3562892, 0.7377798, 0.2313726, 0, 1, 1,
0.6202134, -1.724259, 2.335297, 0.2352941, 0, 1, 1,
0.6227951, -0.009675944, -0.1593115, 0.2431373, 0, 1, 1,
0.6288763, -0.3275491, 3.401423, 0.2470588, 0, 1, 1,
0.633919, -0.8553971, 3.166073, 0.254902, 0, 1, 1,
0.6352207, -0.3562216, 1.095552, 0.2588235, 0, 1, 1,
0.647509, -2.506134, 3.170302, 0.2666667, 0, 1, 1,
0.6478184, 2.301432, 1.461251, 0.2705882, 0, 1, 1,
0.6560096, -0.8332114, 1.799387, 0.2784314, 0, 1, 1,
0.6561631, 0.5673963, -0.1571433, 0.282353, 0, 1, 1,
0.6563135, 0.4609029, 1.445336, 0.2901961, 0, 1, 1,
0.6581059, -0.5530357, 2.541121, 0.2941177, 0, 1, 1,
0.6606386, -1.952896, 2.724256, 0.3019608, 0, 1, 1,
0.660836, -0.06310022, 2.885005, 0.3098039, 0, 1, 1,
0.6623472, 0.431106, 0.8454973, 0.3137255, 0, 1, 1,
0.6625853, 0.6300803, 2.394116, 0.3215686, 0, 1, 1,
0.6679996, 0.3521355, 1.868426, 0.3254902, 0, 1, 1,
0.6714863, 2.538871, 0.5176222, 0.3333333, 0, 1, 1,
0.6823169, -0.1427802, 1.061091, 0.3372549, 0, 1, 1,
0.685017, 0.5502995, 2.307688, 0.345098, 0, 1, 1,
0.6864858, 0.6230667, 3.045903, 0.3490196, 0, 1, 1,
0.6888719, -0.1132507, 1.421054, 0.3568628, 0, 1, 1,
0.6960634, -0.5205513, 1.933586, 0.3607843, 0, 1, 1,
0.7000703, -1.037447, 2.188785, 0.3686275, 0, 1, 1,
0.7091936, 1.150382, -0.7008991, 0.372549, 0, 1, 1,
0.7114137, 2.045212, -0.4752683, 0.3803922, 0, 1, 1,
0.7115585, -0.09929793, 2.788166, 0.3843137, 0, 1, 1,
0.7129585, -1.90164, 2.895218, 0.3921569, 0, 1, 1,
0.7173433, -0.3073303, 3.532341, 0.3960784, 0, 1, 1,
0.721924, -1.198675, 3.303217, 0.4039216, 0, 1, 1,
0.726136, -2.037936, 3.418977, 0.4117647, 0, 1, 1,
0.726477, -0.019361, 2.03524, 0.4156863, 0, 1, 1,
0.7284006, -1.340241, 2.597922, 0.4235294, 0, 1, 1,
0.7295815, 0.2020666, 0.4885471, 0.427451, 0, 1, 1,
0.7331107, -0.8287685, 2.391775, 0.4352941, 0, 1, 1,
0.7335275, -0.3176877, 0.8184484, 0.4392157, 0, 1, 1,
0.7386597, 0.7685016, -0.5858224, 0.4470588, 0, 1, 1,
0.7406012, -0.1709494, 2.011114, 0.4509804, 0, 1, 1,
0.7428234, 0.04056734, 1.50132, 0.4588235, 0, 1, 1,
0.7449092, -1.237918, 1.620888, 0.4627451, 0, 1, 1,
0.746742, 1.434006, -1.432651, 0.4705882, 0, 1, 1,
0.7491292, 1.142136, -0.6402783, 0.4745098, 0, 1, 1,
0.7505565, -0.1654273, 1.403621, 0.4823529, 0, 1, 1,
0.7520733, 0.1777114, 2.105232, 0.4862745, 0, 1, 1,
0.7560554, 0.5893991, 0.838187, 0.4941176, 0, 1, 1,
0.7594411, 0.2626466, 0.8702745, 0.5019608, 0, 1, 1,
0.7613077, -0.4740171, 3.143007, 0.5058824, 0, 1, 1,
0.7631931, -0.4736538, 3.038956, 0.5137255, 0, 1, 1,
0.7718274, 0.2089218, 0.9845321, 0.5176471, 0, 1, 1,
0.7719053, 0.1629318, 2.197027, 0.5254902, 0, 1, 1,
0.7793515, 0.9564492, 0.6557709, 0.5294118, 0, 1, 1,
0.7884458, 0.1789769, 2.735903, 0.5372549, 0, 1, 1,
0.7975894, 0.08609027, 1.003708, 0.5411765, 0, 1, 1,
0.8006648, -2.504047, 2.063598, 0.5490196, 0, 1, 1,
0.8014942, 0.1405937, 1.315402, 0.5529412, 0, 1, 1,
0.8057449, -1.049368, 3.153921, 0.5607843, 0, 1, 1,
0.8105747, -0.1662521, 1.027234, 0.5647059, 0, 1, 1,
0.8137182, -0.0897262, 0.3254794, 0.572549, 0, 1, 1,
0.818072, 0.03538137, 2.25809, 0.5764706, 0, 1, 1,
0.8211221, -1.328459, 2.503909, 0.5843138, 0, 1, 1,
0.8232436, -0.3660063, 0.4310687, 0.5882353, 0, 1, 1,
0.8265539, -1.783972, 3.210734, 0.5960785, 0, 1, 1,
0.8280023, -0.3148941, 1.995785, 0.6039216, 0, 1, 1,
0.8366435, -0.4879824, 1.214852, 0.6078432, 0, 1, 1,
0.8374977, -0.2472364, 2.257596, 0.6156863, 0, 1, 1,
0.8428634, 0.5087221, 1.293136, 0.6196079, 0, 1, 1,
0.8509817, -0.7350254, 2.62334, 0.627451, 0, 1, 1,
0.8522237, 0.6837052, 1.661811, 0.6313726, 0, 1, 1,
0.8652453, -0.4034596, 0.8117982, 0.6392157, 0, 1, 1,
0.8664913, 1.368733, 1.750245, 0.6431373, 0, 1, 1,
0.8703383, 0.9116301, 2.484266, 0.6509804, 0, 1, 1,
0.8722611, -0.6918146, 1.140548, 0.654902, 0, 1, 1,
0.874314, 0.4978442, 0.9950128, 0.6627451, 0, 1, 1,
0.877248, 0.7217519, 1.608104, 0.6666667, 0, 1, 1,
0.8838172, 0.5388764, -0.1440016, 0.6745098, 0, 1, 1,
0.8870478, 0.4134569, 0.2789614, 0.6784314, 0, 1, 1,
0.8887938, 0.3073941, 0.3388525, 0.6862745, 0, 1, 1,
0.8908789, 0.1671969, 1.706159, 0.6901961, 0, 1, 1,
0.8909469, 1.458007, 1.578602, 0.6980392, 0, 1, 1,
0.8912485, 0.761968, 1.102977, 0.7058824, 0, 1, 1,
0.8952801, 0.9028276, 2.078527, 0.7098039, 0, 1, 1,
0.8987097, -0.8066083, 1.012433, 0.7176471, 0, 1, 1,
0.8992271, 1.698046, 1.482665, 0.7215686, 0, 1, 1,
0.9015847, 1.038767, 1.191242, 0.7294118, 0, 1, 1,
0.9035774, -0.4417787, 1.300537, 0.7333333, 0, 1, 1,
0.9075859, 1.178981, 0.8330214, 0.7411765, 0, 1, 1,
0.910293, -0.07875584, 1.933116, 0.7450981, 0, 1, 1,
0.911688, 0.8929039, -0.03658726, 0.7529412, 0, 1, 1,
0.9161007, -0.1377215, 2.560338, 0.7568628, 0, 1, 1,
0.9216805, 0.5134271, 2.778022, 0.7647059, 0, 1, 1,
0.9261766, -0.6022955, 4.006915, 0.7686275, 0, 1, 1,
0.9371763, 0.1787009, 1.541384, 0.7764706, 0, 1, 1,
0.9481538, 0.09567939, 0.77451, 0.7803922, 0, 1, 1,
0.9503405, 0.8174207, 1.120074, 0.7882353, 0, 1, 1,
0.9633475, 1.767217, 0.860653, 0.7921569, 0, 1, 1,
0.9645889, -0.007224442, 3.08827, 0.8, 0, 1, 1,
0.9652398, -0.6523572, 2.36658, 0.8078431, 0, 1, 1,
0.9661078, 0.3131163, 1.15524, 0.8117647, 0, 1, 1,
0.967532, -0.8194289, 0.4284956, 0.8196079, 0, 1, 1,
0.9682837, -0.4752629, 1.323995, 0.8235294, 0, 1, 1,
0.9701667, 0.3714721, -1.511155, 0.8313726, 0, 1, 1,
0.9713202, 0.5387057, 1.251943, 0.8352941, 0, 1, 1,
0.9735591, -0.1177623, 2.255343, 0.8431373, 0, 1, 1,
0.9740701, 0.5816944, 0.4414222, 0.8470588, 0, 1, 1,
0.9779165, 0.3148806, 3.341661, 0.854902, 0, 1, 1,
0.9862817, 0.1328275, 3.235426, 0.8588235, 0, 1, 1,
1.007718, 0.7458807, 1.34015, 0.8666667, 0, 1, 1,
1.009295, -0.3551914, 3.108964, 0.8705882, 0, 1, 1,
1.009762, 0.8215308, 1.496703, 0.8784314, 0, 1, 1,
1.00986, 0.7961631, 0.4519714, 0.8823529, 0, 1, 1,
1.016266, -0.6806206, 2.362123, 0.8901961, 0, 1, 1,
1.018006, 0.3159156, -0.1794068, 0.8941177, 0, 1, 1,
1.018197, 0.05572555, 1.088998, 0.9019608, 0, 1, 1,
1.020649, -0.7970666, 2.479811, 0.9098039, 0, 1, 1,
1.022663, -0.4653702, 2.771255, 0.9137255, 0, 1, 1,
1.027287, -0.08800504, -0.9325454, 0.9215686, 0, 1, 1,
1.038502, -1.153937, 2.505717, 0.9254902, 0, 1, 1,
1.039086, -2.422361, 3.52635, 0.9333333, 0, 1, 1,
1.039635, -1.089639, 3.87903, 0.9372549, 0, 1, 1,
1.045551, 0.2019873, 2.1874, 0.945098, 0, 1, 1,
1.046688, -0.9665512, 3.954148, 0.9490196, 0, 1, 1,
1.049647, 0.7082982, 0.2017183, 0.9568627, 0, 1, 1,
1.050352, 0.4312789, -0.8558996, 0.9607843, 0, 1, 1,
1.053864, 0.05921536, 0.4993225, 0.9686275, 0, 1, 1,
1.053976, 0.5565353, 2.621355, 0.972549, 0, 1, 1,
1.056818, 0.2860742, 2.873751, 0.9803922, 0, 1, 1,
1.058693, -0.7091456, 2.539818, 0.9843137, 0, 1, 1,
1.060568, -0.3759888, 2.508699, 0.9921569, 0, 1, 1,
1.061948, -1.398285, 3.911025, 0.9960784, 0, 1, 1,
1.063485, 1.276554, 2.194461, 1, 0, 0.9960784, 1,
1.071803, 0.6779978, 0.5974118, 1, 0, 0.9882353, 1,
1.073835, 0.2267447, 1.305812, 1, 0, 0.9843137, 1,
1.075532, 0.1382748, 3.435331, 1, 0, 0.9764706, 1,
1.077647, 0.3722962, 2.212534, 1, 0, 0.972549, 1,
1.078387, 1.22027, 0.423516, 1, 0, 0.9647059, 1,
1.078719, -0.901526, 3.013197, 1, 0, 0.9607843, 1,
1.084647, -0.3037326, 1.630421, 1, 0, 0.9529412, 1,
1.086001, -0.7673744, 2.612015, 1, 0, 0.9490196, 1,
1.090584, -0.7056907, 3.30486, 1, 0, 0.9411765, 1,
1.104407, 0.6956492, 1.211121, 1, 0, 0.9372549, 1,
1.109724, 0.1865874, 3.188323, 1, 0, 0.9294118, 1,
1.114173, -1.023481, 4.41928, 1, 0, 0.9254902, 1,
1.115087, 1.80419, -0.9236235, 1, 0, 0.9176471, 1,
1.119288, -0.3898664, 1.734131, 1, 0, 0.9137255, 1,
1.121833, -0.1044718, 1.887885, 1, 0, 0.9058824, 1,
1.122917, 0.2187845, 1.856442, 1, 0, 0.9019608, 1,
1.123535, 1.421946, 0.3373438, 1, 0, 0.8941177, 1,
1.147181, -1.522218, 3.307263, 1, 0, 0.8862745, 1,
1.14816, -0.1640489, 1.259033, 1, 0, 0.8823529, 1,
1.148834, 1.696497, 1.312139, 1, 0, 0.8745098, 1,
1.153148, -0.7168412, 1.307546, 1, 0, 0.8705882, 1,
1.155395, -1.949896, 2.942498, 1, 0, 0.8627451, 1,
1.156515, 1.385679, 2.381979, 1, 0, 0.8588235, 1,
1.15792, -0.874935, 3.221148, 1, 0, 0.8509804, 1,
1.161158, 0.9443114, 0.6376719, 1, 0, 0.8470588, 1,
1.161335, -1.204481, 3.473759, 1, 0, 0.8392157, 1,
1.161443, 0.1949694, 1.144273, 1, 0, 0.8352941, 1,
1.17623, 0.5167722, 0.6360523, 1, 0, 0.827451, 1,
1.185347, 0.5795594, 1.924706, 1, 0, 0.8235294, 1,
1.18837, 0.131108, 1.192034, 1, 0, 0.8156863, 1,
1.188579, 1.122326, 2.00348, 1, 0, 0.8117647, 1,
1.193564, 0.1366675, 0.8468081, 1, 0, 0.8039216, 1,
1.194076, 0.2362212, 0.00679057, 1, 0, 0.7960784, 1,
1.200303, -0.8622615, 2.676471, 1, 0, 0.7921569, 1,
1.201992, -0.7792562, 0.8929247, 1, 0, 0.7843137, 1,
1.205354, 0.2912847, 1.4451, 1, 0, 0.7803922, 1,
1.206144, 0.9113324, 1.689586, 1, 0, 0.772549, 1,
1.210677, -0.2306687, 1.48451, 1, 0, 0.7686275, 1,
1.218504, 0.897355, 1.307992, 1, 0, 0.7607843, 1,
1.230311, -0.4707206, 2.680288, 1, 0, 0.7568628, 1,
1.232927, -0.9856485, 0.8090479, 1, 0, 0.7490196, 1,
1.236049, -0.3233727, 1.416924, 1, 0, 0.7450981, 1,
1.240182, -1.68513, 1.052893, 1, 0, 0.7372549, 1,
1.243132, 1.851843, -0.2738865, 1, 0, 0.7333333, 1,
1.251472, -0.5114162, 1.813612, 1, 0, 0.7254902, 1,
1.253019, 0.1128869, 3.000854, 1, 0, 0.7215686, 1,
1.257817, 1.017086, -0.3765989, 1, 0, 0.7137255, 1,
1.259884, -0.4925817, 3.820125, 1, 0, 0.7098039, 1,
1.262111, -0.08359232, 2.47267, 1, 0, 0.7019608, 1,
1.263329, -0.5986843, 2.89424, 1, 0, 0.6941177, 1,
1.272752, 1.048992, 1.572913, 1, 0, 0.6901961, 1,
1.274742, 0.2916883, 1.652395, 1, 0, 0.682353, 1,
1.275616, 0.4045733, 1.8538, 1, 0, 0.6784314, 1,
1.284804, -0.3663938, 1.411564, 1, 0, 0.6705883, 1,
1.292602, 0.6320023, 2.359739, 1, 0, 0.6666667, 1,
1.296035, -0.6325897, 3.596827, 1, 0, 0.6588235, 1,
1.296076, -0.9103346, 1.90626, 1, 0, 0.654902, 1,
1.301845, 0.1208163, 2.679329, 1, 0, 0.6470588, 1,
1.306299, -0.235084, 1.088985, 1, 0, 0.6431373, 1,
1.30688, 1.336129, 0.3296487, 1, 0, 0.6352941, 1,
1.307818, -0.4037663, 1.412426, 1, 0, 0.6313726, 1,
1.312278, -0.9555314, 2.548376, 1, 0, 0.6235294, 1,
1.313913, 0.934114, 1.068311, 1, 0, 0.6196079, 1,
1.318591, 1.552138, 0.429533, 1, 0, 0.6117647, 1,
1.322836, -0.08705568, 1.278797, 1, 0, 0.6078432, 1,
1.326901, -0.5950923, 2.39906, 1, 0, 0.6, 1,
1.332662, -1.162681, 3.126938, 1, 0, 0.5921569, 1,
1.341364, -1.472148, 4.021697, 1, 0, 0.5882353, 1,
1.342737, -0.07128477, 0.4332748, 1, 0, 0.5803922, 1,
1.363377, -0.6436883, 1.773835, 1, 0, 0.5764706, 1,
1.373964, -0.4935229, 2.45016, 1, 0, 0.5686275, 1,
1.387845, -0.2598773, 3.245872, 1, 0, 0.5647059, 1,
1.389247, -1.100189, 1.627374, 1, 0, 0.5568628, 1,
1.393933, 0.02586399, 0.2979648, 1, 0, 0.5529412, 1,
1.405987, -0.1040055, 1.968954, 1, 0, 0.5450981, 1,
1.408325, -0.3120646, 2.528634, 1, 0, 0.5411765, 1,
1.427437, -0.001342791, 3.052926, 1, 0, 0.5333334, 1,
1.443382, -0.8672267, 2.002952, 1, 0, 0.5294118, 1,
1.445528, -0.1433578, -0.4490176, 1, 0, 0.5215687, 1,
1.456184, -0.4128861, 0.7936935, 1, 0, 0.5176471, 1,
1.463348, -0.08015978, 3.102583, 1, 0, 0.509804, 1,
1.465969, 0.7770255, 1.867161, 1, 0, 0.5058824, 1,
1.468707, 0.7752553, -0.03872638, 1, 0, 0.4980392, 1,
1.471313, -1.798061, 1.411694, 1, 0, 0.4901961, 1,
1.473946, -2.235374, 1.525909, 1, 0, 0.4862745, 1,
1.476581, -0.5089861, 0.8910992, 1, 0, 0.4784314, 1,
1.477654, 0.5051237, 0.1891643, 1, 0, 0.4745098, 1,
1.47799, -1.936068, 2.395823, 1, 0, 0.4666667, 1,
1.479473, -0.4538112, 3.79073, 1, 0, 0.4627451, 1,
1.480308, 1.679869, 0.2587252, 1, 0, 0.454902, 1,
1.480816, -0.4093842, 1.165665, 1, 0, 0.4509804, 1,
1.491386, 0.2305369, 2.982244, 1, 0, 0.4431373, 1,
1.501371, 0.4213869, 0.5797234, 1, 0, 0.4392157, 1,
1.503312, -1.193164, 1.615233, 1, 0, 0.4313726, 1,
1.503846, -0.7292926, 1.998311, 1, 0, 0.427451, 1,
1.511977, -0.5659242, 3.917492, 1, 0, 0.4196078, 1,
1.513864, -0.1607144, 1.124317, 1, 0, 0.4156863, 1,
1.559149, 0.6118987, 0.3848549, 1, 0, 0.4078431, 1,
1.564071, -0.2296502, 1.70143, 1, 0, 0.4039216, 1,
1.564993, -1.243048, 1.742284, 1, 0, 0.3960784, 1,
1.572781, 0.5674255, -0.1396234, 1, 0, 0.3882353, 1,
1.576072, 0.4566478, -0.5213134, 1, 0, 0.3843137, 1,
1.587113, 0.5183473, 2.242311, 1, 0, 0.3764706, 1,
1.587867, -0.03922032, 1.818866, 1, 0, 0.372549, 1,
1.591481, -0.3306755, 3.692694, 1, 0, 0.3647059, 1,
1.618951, 0.8789047, -0.5950888, 1, 0, 0.3607843, 1,
1.628163, -1.189343, 2.112171, 1, 0, 0.3529412, 1,
1.643016, -0.6519615, 1.176442, 1, 0, 0.3490196, 1,
1.679212, -0.527386, 2.359193, 1, 0, 0.3411765, 1,
1.679917, 1.378372, 1.081775, 1, 0, 0.3372549, 1,
1.6912, -1.069504, 0.4851732, 1, 0, 0.3294118, 1,
1.732193, 1.029967, 2.07051, 1, 0, 0.3254902, 1,
1.733129, 0.749317, 1.093715, 1, 0, 0.3176471, 1,
1.744252, -0.5212933, 1.402813, 1, 0, 0.3137255, 1,
1.745262, -0.5562046, 1.322485, 1, 0, 0.3058824, 1,
1.749791, -0.2502694, 2.237159, 1, 0, 0.2980392, 1,
1.757865, 0.3504405, 1.373696, 1, 0, 0.2941177, 1,
1.762519, 0.1290223, 3.619422, 1, 0, 0.2862745, 1,
1.781932, -1.220803, 0.7877683, 1, 0, 0.282353, 1,
1.784061, -0.04273588, 2.453974, 1, 0, 0.2745098, 1,
1.810876, 1.098351, 1.270533, 1, 0, 0.2705882, 1,
1.847743, 0.6541599, 0.691021, 1, 0, 0.2627451, 1,
1.869727, 1.369158, -0.1309687, 1, 0, 0.2588235, 1,
1.877409, 1.902065, 0.7487439, 1, 0, 0.2509804, 1,
1.899681, -1.673628, 2.446288, 1, 0, 0.2470588, 1,
1.916263, -0.226088, 0.7862106, 1, 0, 0.2392157, 1,
1.917559, -0.3607168, 1.184415, 1, 0, 0.2352941, 1,
1.922563, -0.799403, 3.601254, 1, 0, 0.227451, 1,
1.947373, -1.056198, 2.015273, 1, 0, 0.2235294, 1,
1.947526, 1.00397, 1.152639, 1, 0, 0.2156863, 1,
1.95024, -0.928956, 0.2033045, 1, 0, 0.2117647, 1,
1.96323, 0.6548768, 2.26711, 1, 0, 0.2039216, 1,
1.969394, -0.472132, 2.943028, 1, 0, 0.1960784, 1,
1.970042, 0.1617682, 0.007080146, 1, 0, 0.1921569, 1,
1.993857, -0.9046325, 1.46128, 1, 0, 0.1843137, 1,
2.035491, 1.254627, 0.5399205, 1, 0, 0.1803922, 1,
2.060655, 0.9521514, 0.7522051, 1, 0, 0.172549, 1,
2.090446, 0.4481613, 1.723075, 1, 0, 0.1686275, 1,
2.122701, -0.5437955, 2.301812, 1, 0, 0.1607843, 1,
2.159198, 1.392455, -1.101083, 1, 0, 0.1568628, 1,
2.19877, 1.58202, 2.055362, 1, 0, 0.1490196, 1,
2.200053, 0.8093269, 0.4567354, 1, 0, 0.145098, 1,
2.201006, -1.137704, 1.059112, 1, 0, 0.1372549, 1,
2.202466, -0.4490079, 1.929039, 1, 0, 0.1333333, 1,
2.209952, -1.46854, 2.975977, 1, 0, 0.1254902, 1,
2.230598, 0.4493971, 0.8517257, 1, 0, 0.1215686, 1,
2.236495, -0.704059, 1.306294, 1, 0, 0.1137255, 1,
2.247874, 0.7724097, 1.417848, 1, 0, 0.1098039, 1,
2.272778, -0.7745945, 1.393661, 1, 0, 0.1019608, 1,
2.282369, -0.7569389, 2.26261, 1, 0, 0.09411765, 1,
2.302007, 0.3386168, 0.8612401, 1, 0, 0.09019608, 1,
2.306469, 0.5259051, 0.4547189, 1, 0, 0.08235294, 1,
2.320985, -1.164495, 1.31563, 1, 0, 0.07843138, 1,
2.323024, 1.586829, 1.603956, 1, 0, 0.07058824, 1,
2.357522, -0.5254895, 1.568706, 1, 0, 0.06666667, 1,
2.380956, -0.8525524, 0.7822016, 1, 0, 0.05882353, 1,
2.388978, 0.6472238, 3.088165, 1, 0, 0.05490196, 1,
2.462277, 1.169807, 1.533386, 1, 0, 0.04705882, 1,
2.528783, 0.682778, 1.700542, 1, 0, 0.04313726, 1,
2.605872, 0.001748573, 2.336289, 1, 0, 0.03529412, 1,
2.63449, 0.697321, 2.033026, 1, 0, 0.03137255, 1,
2.649719, 1.115847, 1.350663, 1, 0, 0.02352941, 1,
2.714326, -1.269724, 0.8780467, 1, 0, 0.01960784, 1,
2.912133, -1.391156, 2.42361, 1, 0, 0.01176471, 1,
3.845627, 1.869799, 0.3563268, 1, 0, 0.007843138, 1
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
0.3266469, -3.826177, -7.594694, 0, -0.5, 0.5, 0.5,
0.3266469, -3.826177, -7.594694, 1, -0.5, 0.5, 0.5,
0.3266469, -3.826177, -7.594694, 1, 1.5, 0.5, 0.5,
0.3266469, -3.826177, -7.594694, 0, 1.5, 0.5, 0.5
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
-4.385267, 0.3061048, -7.594694, 0, -0.5, 0.5, 0.5,
-4.385267, 0.3061048, -7.594694, 1, -0.5, 0.5, 0.5,
-4.385267, 0.3061048, -7.594694, 1, 1.5, 0.5, 0.5,
-4.385267, 0.3061048, -7.594694, 0, 1.5, 0.5, 0.5
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
-4.385267, -3.826177, -0.2612228, 0, -0.5, 0.5, 0.5,
-4.385267, -3.826177, -0.2612228, 1, -0.5, 0.5, 0.5,
-4.385267, -3.826177, -0.2612228, 1, 1.5, 0.5, 0.5,
-4.385267, -3.826177, -0.2612228, 0, 1.5, 0.5, 0.5
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
-2, -2.872574, -5.902354,
2, -2.872574, -5.902354,
-2, -2.872574, -5.902354,
-2, -3.031508, -6.184411,
0, -2.872574, -5.902354,
0, -3.031508, -6.184411,
2, -2.872574, -5.902354,
2, -3.031508, -6.184411
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
-2, -3.349375, -6.748524, 0, -0.5, 0.5, 0.5,
-2, -3.349375, -6.748524, 1, -0.5, 0.5, 0.5,
-2, -3.349375, -6.748524, 1, 1.5, 0.5, 0.5,
-2, -3.349375, -6.748524, 0, 1.5, 0.5, 0.5,
0, -3.349375, -6.748524, 0, -0.5, 0.5, 0.5,
0, -3.349375, -6.748524, 1, -0.5, 0.5, 0.5,
0, -3.349375, -6.748524, 1, 1.5, 0.5, 0.5,
0, -3.349375, -6.748524, 0, 1.5, 0.5, 0.5,
2, -3.349375, -6.748524, 0, -0.5, 0.5, 0.5,
2, -3.349375, -6.748524, 1, -0.5, 0.5, 0.5,
2, -3.349375, -6.748524, 1, 1.5, 0.5, 0.5,
2, -3.349375, -6.748524, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.297903, -2, -5.902354,
-3.297903, 3, -5.902354,
-3.297903, -2, -5.902354,
-3.47913, -2, -6.184411,
-3.297903, -1, -5.902354,
-3.47913, -1, -6.184411,
-3.297903, 0, -5.902354,
-3.47913, 0, -6.184411,
-3.297903, 1, -5.902354,
-3.47913, 1, -6.184411,
-3.297903, 2, -5.902354,
-3.47913, 2, -6.184411,
-3.297903, 3, -5.902354,
-3.47913, 3, -6.184411
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
-3.841585, -2, -6.748524, 0, -0.5, 0.5, 0.5,
-3.841585, -2, -6.748524, 1, -0.5, 0.5, 0.5,
-3.841585, -2, -6.748524, 1, 1.5, 0.5, 0.5,
-3.841585, -2, -6.748524, 0, 1.5, 0.5, 0.5,
-3.841585, -1, -6.748524, 0, -0.5, 0.5, 0.5,
-3.841585, -1, -6.748524, 1, -0.5, 0.5, 0.5,
-3.841585, -1, -6.748524, 1, 1.5, 0.5, 0.5,
-3.841585, -1, -6.748524, 0, 1.5, 0.5, 0.5,
-3.841585, 0, -6.748524, 0, -0.5, 0.5, 0.5,
-3.841585, 0, -6.748524, 1, -0.5, 0.5, 0.5,
-3.841585, 0, -6.748524, 1, 1.5, 0.5, 0.5,
-3.841585, 0, -6.748524, 0, 1.5, 0.5, 0.5,
-3.841585, 1, -6.748524, 0, -0.5, 0.5, 0.5,
-3.841585, 1, -6.748524, 1, -0.5, 0.5, 0.5,
-3.841585, 1, -6.748524, 1, 1.5, 0.5, 0.5,
-3.841585, 1, -6.748524, 0, 1.5, 0.5, 0.5,
-3.841585, 2, -6.748524, 0, -0.5, 0.5, 0.5,
-3.841585, 2, -6.748524, 1, -0.5, 0.5, 0.5,
-3.841585, 2, -6.748524, 1, 1.5, 0.5, 0.5,
-3.841585, 2, -6.748524, 0, 1.5, 0.5, 0.5,
-3.841585, 3, -6.748524, 0, -0.5, 0.5, 0.5,
-3.841585, 3, -6.748524, 1, -0.5, 0.5, 0.5,
-3.841585, 3, -6.748524, 1, 1.5, 0.5, 0.5,
-3.841585, 3, -6.748524, 0, 1.5, 0.5, 0.5
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
-3.297903, -2.872574, -4,
-3.297903, -2.872574, 4,
-3.297903, -2.872574, -4,
-3.47913, -3.031508, -4,
-3.297903, -2.872574, -2,
-3.47913, -3.031508, -2,
-3.297903, -2.872574, 0,
-3.47913, -3.031508, 0,
-3.297903, -2.872574, 2,
-3.47913, -3.031508, 2,
-3.297903, -2.872574, 4,
-3.47913, -3.031508, 4
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
-3.841585, -3.349375, -4, 0, -0.5, 0.5, 0.5,
-3.841585, -3.349375, -4, 1, -0.5, 0.5, 0.5,
-3.841585, -3.349375, -4, 1, 1.5, 0.5, 0.5,
-3.841585, -3.349375, -4, 0, 1.5, 0.5, 0.5,
-3.841585, -3.349375, -2, 0, -0.5, 0.5, 0.5,
-3.841585, -3.349375, -2, 1, -0.5, 0.5, 0.5,
-3.841585, -3.349375, -2, 1, 1.5, 0.5, 0.5,
-3.841585, -3.349375, -2, 0, 1.5, 0.5, 0.5,
-3.841585, -3.349375, 0, 0, -0.5, 0.5, 0.5,
-3.841585, -3.349375, 0, 1, -0.5, 0.5, 0.5,
-3.841585, -3.349375, 0, 1, 1.5, 0.5, 0.5,
-3.841585, -3.349375, 0, 0, 1.5, 0.5, 0.5,
-3.841585, -3.349375, 2, 0, -0.5, 0.5, 0.5,
-3.841585, -3.349375, 2, 1, -0.5, 0.5, 0.5,
-3.841585, -3.349375, 2, 1, 1.5, 0.5, 0.5,
-3.841585, -3.349375, 2, 0, 1.5, 0.5, 0.5,
-3.841585, -3.349375, 4, 0, -0.5, 0.5, 0.5,
-3.841585, -3.349375, 4, 1, -0.5, 0.5, 0.5,
-3.841585, -3.349375, 4, 1, 1.5, 0.5, 0.5,
-3.841585, -3.349375, 4, 0, 1.5, 0.5, 0.5
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
-3.297903, -2.872574, -5.902354,
-3.297903, 3.484783, -5.902354,
-3.297903, -2.872574, 5.379909,
-3.297903, 3.484783, 5.379909,
-3.297903, -2.872574, -5.902354,
-3.297903, -2.872574, 5.379909,
-3.297903, 3.484783, -5.902354,
-3.297903, 3.484783, 5.379909,
-3.297903, -2.872574, -5.902354,
3.951196, -2.872574, -5.902354,
-3.297903, -2.872574, 5.379909,
3.951196, -2.872574, 5.379909,
-3.297903, 3.484783, -5.902354,
3.951196, 3.484783, -5.902354,
-3.297903, 3.484783, 5.379909,
3.951196, 3.484783, 5.379909,
3.951196, -2.872574, -5.902354,
3.951196, 3.484783, -5.902354,
3.951196, -2.872574, 5.379909,
3.951196, 3.484783, 5.379909,
3.951196, -2.872574, -5.902354,
3.951196, -2.872574, 5.379909,
3.951196, 3.484783, -5.902354,
3.951196, 3.484783, 5.379909
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
var radius = 7.924799;
var distance = 35.25832;
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
mvMatrix.translate( -0.3266469, -0.3061048, 0.2612228 );
mvMatrix.scale( 1.182002, 1.3478, 0.7594618 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.25832);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
Propyl_carbamate<-read.table("Propyl_carbamate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Propyl_carbamate$V2
```

```
## Error in eval(expr, envir, enclos): object 'Propyl_carbamate' not found
```

```r
y<-Propyl_carbamate$V3
```

```
## Error in eval(expr, envir, enclos): object 'Propyl_carbamate' not found
```

```r
z<-Propyl_carbamate$V4
```

```
## Error in eval(expr, envir, enclos): object 'Propyl_carbamate' not found
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
-3.192333, 1.005666, -1.059556, 0, 0, 1, 1, 1,
-2.947773, 0.2800918, -1.635109, 1, 0, 0, 1, 1,
-2.816946, -0.3169603, -1.584767, 1, 0, 0, 1, 1,
-2.801589, -0.7533954, -1.583859, 1, 0, 0, 1, 1,
-2.798243, -0.4277354, -1.829651, 1, 0, 0, 1, 1,
-2.562599, 0.8974539, -1.242741, 1, 0, 0, 1, 1,
-2.428466, 0.5745771, 0.5188791, 0, 0, 0, 1, 1,
-2.423427, -0.3777898, -2.7795, 0, 0, 0, 1, 1,
-2.33653, 0.5005258, -0.910236, 0, 0, 0, 1, 1,
-2.331436, 0.5178143, -2.579949, 0, 0, 0, 1, 1,
-2.307757, 0.4901298, 0.2995307, 0, 0, 0, 1, 1,
-2.273946, 0.15138, -2.006562, 0, 0, 0, 1, 1,
-2.215156, -1.838054, -3.270225, 0, 0, 0, 1, 1,
-2.211414, 0.7781413, 0.2411809, 1, 1, 1, 1, 1,
-2.190317, 0.2802211, -1.049323, 1, 1, 1, 1, 1,
-2.09925, -0.6342968, -1.351402, 1, 1, 1, 1, 1,
-2.095931, 0.6751894, -0.03675836, 1, 1, 1, 1, 1,
-2.095449, 0.8720434, 0.02094832, 1, 1, 1, 1, 1,
-2.077538, 1.022444, -2.557325, 1, 1, 1, 1, 1,
-2.072497, -0.6229284, -0.6523385, 1, 1, 1, 1, 1,
-2.039566, -0.5926461, -2.087945, 1, 1, 1, 1, 1,
-2.036782, 0.1794306, -3.280085, 1, 1, 1, 1, 1,
-2.036682, 1.375435, -1.445837, 1, 1, 1, 1, 1,
-2.033874, -0.431908, -1.783239, 1, 1, 1, 1, 1,
-2.019383, -1.374304, -2.0536, 1, 1, 1, 1, 1,
-1.985709, -0.160936, -1.35794, 1, 1, 1, 1, 1,
-1.975302, 1.709408, -1.191547, 1, 1, 1, 1, 1,
-1.95765, -0.6830698, -2.916325, 1, 1, 1, 1, 1,
-1.925267, -0.1395327, -3.66162, 0, 0, 1, 1, 1,
-1.894571, -0.2008097, -3.189238, 1, 0, 0, 1, 1,
-1.88402, 0.1252774, -2.81405, 1, 0, 0, 1, 1,
-1.878247, -1.318763, -2.821229, 1, 0, 0, 1, 1,
-1.84881, -1.043884, -2.259631, 1, 0, 0, 1, 1,
-1.844911, 0.0976024, -2.024917, 1, 0, 0, 1, 1,
-1.830168, 0.7222542, -1.242352, 0, 0, 0, 1, 1,
-1.822157, -0.3868111, -1.78615, 0, 0, 0, 1, 1,
-1.818078, 0.9253849, 0.1424485, 0, 0, 0, 1, 1,
-1.799908, 0.1264475, -2.664788, 0, 0, 0, 1, 1,
-1.784416, 1.164096, -1.089954, 0, 0, 0, 1, 1,
-1.7839, -0.07655466, -2.018153, 0, 0, 0, 1, 1,
-1.756218, -0.832347, -1.382178, 0, 0, 0, 1, 1,
-1.751626, -0.2115618, -2.417269, 1, 1, 1, 1, 1,
-1.751123, 0.6152179, -0.1752853, 1, 1, 1, 1, 1,
-1.734202, 0.7490168, -2.667037, 1, 1, 1, 1, 1,
-1.730823, -2.527705, -3.211168, 1, 1, 1, 1, 1,
-1.723278, -0.9025045, -2.205202, 1, 1, 1, 1, 1,
-1.715823, 0.3262323, -2.105985, 1, 1, 1, 1, 1,
-1.712293, 0.1577393, -3.014676, 1, 1, 1, 1, 1,
-1.703154, -1.134529, -1.796548, 1, 1, 1, 1, 1,
-1.695921, 0.7442693, -0.3708493, 1, 1, 1, 1, 1,
-1.693043, 0.06820172, -2.080956, 1, 1, 1, 1, 1,
-1.690114, 0.8654612, -3.142956, 1, 1, 1, 1, 1,
-1.689233, 0.1747927, -1.461517, 1, 1, 1, 1, 1,
-1.66656, 0.2837599, -1.412084, 1, 1, 1, 1, 1,
-1.652199, 0.4489098, -1.267361, 1, 1, 1, 1, 1,
-1.632487, 0.005046668, -1.011764, 1, 1, 1, 1, 1,
-1.618208, -0.2615888, -1.990592, 0, 0, 1, 1, 1,
-1.601382, 0.4676046, -2.164176, 1, 0, 0, 1, 1,
-1.596063, -1.550677, -2.7249, 1, 0, 0, 1, 1,
-1.590586, 0.1580922, -1.905071, 1, 0, 0, 1, 1,
-1.583236, -0.7320644, -0.4505469, 1, 0, 0, 1, 1,
-1.566917, 1.543247, -1.674973, 1, 0, 0, 1, 1,
-1.560097, -1.119995, -3.501234, 0, 0, 0, 1, 1,
-1.558836, -0.02494816, -2.479319, 0, 0, 0, 1, 1,
-1.554886, -1.880018, -1.221819, 0, 0, 0, 1, 1,
-1.543949, 0.6224366, -1.027513, 0, 0, 0, 1, 1,
-1.530277, -0.7679525, -2.101656, 0, 0, 0, 1, 1,
-1.525712, 0.384734, -3.129138, 0, 0, 0, 1, 1,
-1.518625, -1.575016, -2.404202, 0, 0, 0, 1, 1,
-1.516466, -2.2064, -2.189547, 1, 1, 1, 1, 1,
-1.513184, -0.1744195, -3.090649, 1, 1, 1, 1, 1,
-1.508938, 0.4042654, -1.590151, 1, 1, 1, 1, 1,
-1.507395, 0.7444577, -0.7566643, 1, 1, 1, 1, 1,
-1.498129, 0.6615759, 0.6015193, 1, 1, 1, 1, 1,
-1.495691, 0.3395851, -2.473032, 1, 1, 1, 1, 1,
-1.492366, 1.795102, 0.4024206, 1, 1, 1, 1, 1,
-1.479171, -0.3398034, -4.834971, 1, 1, 1, 1, 1,
-1.462202, -1.16806, -1.661361, 1, 1, 1, 1, 1,
-1.453178, 0.5701106, -1.523946, 1, 1, 1, 1, 1,
-1.433197, -0.004196737, -1.260166, 1, 1, 1, 1, 1,
-1.43064, -0.3075644, -2.371511, 1, 1, 1, 1, 1,
-1.428033, -2.779991, -2.721776, 1, 1, 1, 1, 1,
-1.427251, -0.7831119, -3.025041, 1, 1, 1, 1, 1,
-1.410812, -0.3515849, -2.071568, 1, 1, 1, 1, 1,
-1.394198, -2.726595, -4.144467, 0, 0, 1, 1, 1,
-1.389575, 0.0614287, -1.05833, 1, 0, 0, 1, 1,
-1.383789, -0.02809829, -2.73281, 1, 0, 0, 1, 1,
-1.371015, -0.8446379, -2.106437, 1, 0, 0, 1, 1,
-1.369845, 0.4242169, -1.84682, 1, 0, 0, 1, 1,
-1.350782, -1.327144, -5.32623, 1, 0, 0, 1, 1,
-1.344273, 0.7153884, -2.315054, 0, 0, 0, 1, 1,
-1.331289, 0.1872013, -5.73805, 0, 0, 0, 1, 1,
-1.31219, 1.009358, -3.413084, 0, 0, 0, 1, 1,
-1.309116, 0.8201211, -3.858292, 0, 0, 0, 1, 1,
-1.307464, -0.350373, -1.958377, 0, 0, 0, 1, 1,
-1.30148, -1.340369, -3.256003, 0, 0, 0, 1, 1,
-1.298116, 0.9624709, 1.616415, 0, 0, 0, 1, 1,
-1.289238, 0.5590476, -1.473777, 1, 1, 1, 1, 1,
-1.274666, 1.367514, -1.933231, 1, 1, 1, 1, 1,
-1.273888, 0.2930009, 0.9218088, 1, 1, 1, 1, 1,
-1.267115, -2.012632, -2.907469, 1, 1, 1, 1, 1,
-1.257524, -0.3201685, -1.817413, 1, 1, 1, 1, 1,
-1.252587, -0.755091, -2.927325, 1, 1, 1, 1, 1,
-1.24866, 1.509426, 0.08394971, 1, 1, 1, 1, 1,
-1.228652, 0.07662711, -0.9462359, 1, 1, 1, 1, 1,
-1.227942, 0.1625988, -2.168078, 1, 1, 1, 1, 1,
-1.221973, -2.621115e-05, -2.324847, 1, 1, 1, 1, 1,
-1.212081, -0.09803831, -3.42944, 1, 1, 1, 1, 1,
-1.196882, 1.170679, -1.720627, 1, 1, 1, 1, 1,
-1.194816, -1.226732, -2.925838, 1, 1, 1, 1, 1,
-1.19325, 0.9457428, -0.3871588, 1, 1, 1, 1, 1,
-1.184724, 1.398231, -0.2734106, 1, 1, 1, 1, 1,
-1.183765, -2.561549, -2.472202, 0, 0, 1, 1, 1,
-1.183347, 0.1036358, -1.046284, 1, 0, 0, 1, 1,
-1.179246, -0.5995585, -1.28533, 1, 0, 0, 1, 1,
-1.178182, 0.1153424, -0.3974721, 1, 0, 0, 1, 1,
-1.178146, 0.6198682, -1.61381, 1, 0, 0, 1, 1,
-1.177219, 0.4672846, -0.6195986, 1, 0, 0, 1, 1,
-1.175346, -0.7871391, -0.5325316, 0, 0, 0, 1, 1,
-1.170325, 0.5738341, -0.7938167, 0, 0, 0, 1, 1,
-1.167597, 1.47683, -1.195873, 0, 0, 0, 1, 1,
-1.164959, 0.5086946, -1.512595, 0, 0, 0, 1, 1,
-1.162373, -0.2385892, -2.434685, 0, 0, 0, 1, 1,
-1.153164, -0.09346914, -0.4977263, 0, 0, 0, 1, 1,
-1.147488, 0.3971229, -1.496165, 0, 0, 0, 1, 1,
-1.147362, 0.235814, -2.045751, 1, 1, 1, 1, 1,
-1.14406, 1.115861, -0.9160691, 1, 1, 1, 1, 1,
-1.140631, 0.2475781, -1.36171, 1, 1, 1, 1, 1,
-1.135342, -0.1301258, -1.419351, 1, 1, 1, 1, 1,
-1.133584, 0.8883017, -0.2617371, 1, 1, 1, 1, 1,
-1.130264, 0.2985354, -3.024359, 1, 1, 1, 1, 1,
-1.118504, -1.485316, -3.558939, 1, 1, 1, 1, 1,
-1.115418, -0.07682104, -0.9403867, 1, 1, 1, 1, 1,
-1.113982, 1.69092, -0.5598536, 1, 1, 1, 1, 1,
-1.113702, 0.2047083, -1.606318, 1, 1, 1, 1, 1,
-1.113417, -1.793756, -2.064863, 1, 1, 1, 1, 1,
-1.107256, -1.770417, -2.57273, 1, 1, 1, 1, 1,
-1.106011, -1.219734, -3.097967, 1, 1, 1, 1, 1,
-1.101114, 0.6055962, -0.4313774, 1, 1, 1, 1, 1,
-1.096163, -0.9118544, -3.358858, 1, 1, 1, 1, 1,
-1.088543, 0.9477186, -0.512574, 0, 0, 1, 1, 1,
-1.085596, 0.7099214, -1.79423, 1, 0, 0, 1, 1,
-1.080189, -0.1950416, -1.842967, 1, 0, 0, 1, 1,
-1.079553, 0.6347767, -1.194728, 1, 0, 0, 1, 1,
-1.077528, 0.1540655, -2.067625, 1, 0, 0, 1, 1,
-1.077011, -0.9877082, -2.797013, 1, 0, 0, 1, 1,
-1.074978, -1.018192, -2.308525, 0, 0, 0, 1, 1,
-1.062443, 2.102731, -1.982899, 0, 0, 0, 1, 1,
-1.056103, -0.210295, -3.076276, 0, 0, 0, 1, 1,
-1.045741, 0.001988522, -0.7981955, 0, 0, 0, 1, 1,
-1.042398, -2.500004, -1.23433, 0, 0, 0, 1, 1,
-1.040303, 0.982019, -0.7413036, 0, 0, 0, 1, 1,
-1.034158, -0.6464056, -3.710425, 0, 0, 0, 1, 1,
-1.030886, 3.342332, -0.1361714, 1, 1, 1, 1, 1,
-1.030032, 1.392385, -0.9871156, 1, 1, 1, 1, 1,
-1.029761, 0.058389, -1.677844, 1, 1, 1, 1, 1,
-1.024582, -0.1548689, -1.627929, 1, 1, 1, 1, 1,
-1.024437, -2.153475, -3.353958, 1, 1, 1, 1, 1,
-1.023064, 1.398677, -1.242666, 1, 1, 1, 1, 1,
-1.01951, -0.6771281, -1.565762, 1, 1, 1, 1, 1,
-1.019275, -0.4421116, -3.235326, 1, 1, 1, 1, 1,
-1.009441, -0.6195706, -0.242032, 1, 1, 1, 1, 1,
-0.9987062, 0.8937594, -3.17896, 1, 1, 1, 1, 1,
-0.9939188, -0.1182788, -2.387892, 1, 1, 1, 1, 1,
-0.9935391, -0.991506, -1.281627, 1, 1, 1, 1, 1,
-0.9904646, 0.1280202, 0.03281972, 1, 1, 1, 1, 1,
-0.9890915, 0.2563723, -0.9332542, 1, 1, 1, 1, 1,
-0.9870266, -0.9426553, -4.86596, 1, 1, 1, 1, 1,
-0.9860673, -1.469928, -2.97776, 0, 0, 1, 1, 1,
-0.9821289, 3.3922, 0.03807259, 1, 0, 0, 1, 1,
-0.9808068, 1.640668, -1.006469, 1, 0, 0, 1, 1,
-0.979332, -0.5992618, -1.741951, 1, 0, 0, 1, 1,
-0.976058, 0.07810593, -2.522948, 1, 0, 0, 1, 1,
-0.9738044, -0.2995669, -2.348755, 1, 0, 0, 1, 1,
-0.972615, -1.037397, -3.485356, 0, 0, 0, 1, 1,
-0.9605544, -0.5879807, -1.274599, 0, 0, 0, 1, 1,
-0.9557191, 0.6064999, -1.751853, 0, 0, 0, 1, 1,
-0.9502506, 0.1519805, -2.467714, 0, 0, 0, 1, 1,
-0.9476778, -0.8046536, -1.973048, 0, 0, 0, 1, 1,
-0.9430788, 0.346864, 0.8275884, 0, 0, 0, 1, 1,
-0.9426175, 0.4547226, -1.046783, 0, 0, 0, 1, 1,
-0.9396934, -0.4394638, -3.917327, 1, 1, 1, 1, 1,
-0.9366389, -1.064644, -3.056648, 1, 1, 1, 1, 1,
-0.9345973, 1.338787, -2.03137, 1, 1, 1, 1, 1,
-0.9335721, 0.6456577, -2.161927, 1, 1, 1, 1, 1,
-0.9322286, -0.4153746, -3.372216, 1, 1, 1, 1, 1,
-0.9305981, 0.1190827, 0.7909606, 1, 1, 1, 1, 1,
-0.9275222, 0.6142914, -0.635429, 1, 1, 1, 1, 1,
-0.9261546, -0.1231649, -2.229453, 1, 1, 1, 1, 1,
-0.9245408, 0.5964171, -0.7859904, 1, 1, 1, 1, 1,
-0.9128432, -1.439657, -2.99888, 1, 1, 1, 1, 1,
-0.90795, 1.007175, -1.882406, 1, 1, 1, 1, 1,
-0.9040312, 1.168274, 0.9212676, 1, 1, 1, 1, 1,
-0.9033889, -0.7987751, -1.831572, 1, 1, 1, 1, 1,
-0.901248, -0.1969332, -2.474679, 1, 1, 1, 1, 1,
-0.895321, -0.06538127, -2.453334, 1, 1, 1, 1, 1,
-0.8934042, 0.2955439, -1.393192, 0, 0, 1, 1, 1,
-0.8823823, 1.260821, -1.159147, 1, 0, 0, 1, 1,
-0.8810961, 0.6656386, -1.423762, 1, 0, 0, 1, 1,
-0.8699782, -0.06686606, 0.1950126, 1, 0, 0, 1, 1,
-0.86882, 0.4824569, -2.920739, 1, 0, 0, 1, 1,
-0.8677992, -0.1644259, -2.41821, 1, 0, 0, 1, 1,
-0.8670834, 0.4839049, -2.076448, 0, 0, 0, 1, 1,
-0.8649439, 0.1033177, 1.109337, 0, 0, 0, 1, 1,
-0.8603565, -0.9134181, -3.295904, 0, 0, 0, 1, 1,
-0.8600248, 1.089968, -0.319533, 0, 0, 0, 1, 1,
-0.8588301, 0.2986853, -1.077378, 0, 0, 0, 1, 1,
-0.8566743, 0.4973507, -0.9106245, 0, 0, 0, 1, 1,
-0.8559851, 0.7225705, -2.322226, 0, 0, 0, 1, 1,
-0.8405699, 0.9742259, -0.5315986, 1, 1, 1, 1, 1,
-0.8402266, 0.4567613, -1.564814, 1, 1, 1, 1, 1,
-0.8400052, -0.09336979, -1.742339, 1, 1, 1, 1, 1,
-0.825754, -1.541831, -1.860465, 1, 1, 1, 1, 1,
-0.8232101, 0.7599015, -0.8483384, 1, 1, 1, 1, 1,
-0.8228385, -0.4207718, -1.430909, 1, 1, 1, 1, 1,
-0.8211026, -0.8518413, -0.4183614, 1, 1, 1, 1, 1,
-0.8191781, -0.1583359, -1.938402, 1, 1, 1, 1, 1,
-0.8166249, -0.07711128, -1.896961, 1, 1, 1, 1, 1,
-0.8086743, 0.1311162, -0.3309783, 1, 1, 1, 1, 1,
-0.8076314, 0.4271159, -0.1807368, 1, 1, 1, 1, 1,
-0.8010112, 1.366593, -1.146151, 1, 1, 1, 1, 1,
-0.798413, -0.7638122, -2.147561, 1, 1, 1, 1, 1,
-0.7965156, -1.124586, -2.386013, 1, 1, 1, 1, 1,
-0.7963928, -0.4510505, -1.05511, 1, 1, 1, 1, 1,
-0.7957954, 0.6865223, 0.05018337, 0, 0, 1, 1, 1,
-0.7956319, -0.5293059, -3.261334, 1, 0, 0, 1, 1,
-0.7900874, -1.483769, -2.527387, 1, 0, 0, 1, 1,
-0.7877057, 0.5016226, -0.05176712, 1, 0, 0, 1, 1,
-0.7862307, 1.211326, -0.1186188, 1, 0, 0, 1, 1,
-0.7855951, -0.7371364, -2.506617, 1, 0, 0, 1, 1,
-0.7742647, -0.170826, -1.064269, 0, 0, 0, 1, 1,
-0.7690252, 0.7798932, -0.1177182, 0, 0, 0, 1, 1,
-0.7673466, -0.01703123, -0.2318358, 0, 0, 0, 1, 1,
-0.7624531, 0.9363325, -0.5877113, 0, 0, 0, 1, 1,
-0.7601469, 0.6616603, 2.44941, 0, 0, 0, 1, 1,
-0.7590774, 0.195117, -0.2961433, 0, 0, 0, 1, 1,
-0.7586518, -0.1835152, -0.3138297, 0, 0, 0, 1, 1,
-0.7521418, -1.29909, -1.07499, 1, 1, 1, 1, 1,
-0.7501655, 0.930169, -2.206691, 1, 1, 1, 1, 1,
-0.7485628, -0.3645314, -2.563391, 1, 1, 1, 1, 1,
-0.7474557, -0.4730696, -3.868745, 1, 1, 1, 1, 1,
-0.7340151, -0.5425454, -2.821343, 1, 1, 1, 1, 1,
-0.7318998, -1.624443, -1.904202, 1, 1, 1, 1, 1,
-0.728002, 1.619017, -0.4480194, 1, 1, 1, 1, 1,
-0.7206255, 1.231878, -0.2404012, 1, 1, 1, 1, 1,
-0.7185354, 0.6522973, 0.2519585, 1, 1, 1, 1, 1,
-0.7139779, -0.6116644, -2.25278, 1, 1, 1, 1, 1,
-0.7129911, -1.353391, -2.6862, 1, 1, 1, 1, 1,
-0.7074654, 0.05849954, -0.1806567, 1, 1, 1, 1, 1,
-0.7062213, 0.07068043, -1.111784, 1, 1, 1, 1, 1,
-0.7017918, -0.9036632, -1.166575, 1, 1, 1, 1, 1,
-0.700474, -0.3824178, -2.890579, 1, 1, 1, 1, 1,
-0.6957864, -1.978111, -3.562712, 0, 0, 1, 1, 1,
-0.6917632, 0.1726908, -1.617196, 1, 0, 0, 1, 1,
-0.6900561, 0.9668497, 0.2486675, 1, 0, 0, 1, 1,
-0.6896251, -0.3882293, -0.6246666, 1, 0, 0, 1, 1,
-0.6871607, 0.1328722, -0.7977881, 1, 0, 0, 1, 1,
-0.6863835, -0.7975713, -2.290604, 1, 0, 0, 1, 1,
-0.6767249, 0.3780911, -2.528582, 0, 0, 0, 1, 1,
-0.6719073, 0.3615243, 0.01004352, 0, 0, 0, 1, 1,
-0.6716235, -1.515186, -1.299, 0, 0, 0, 1, 1,
-0.6681473, 1.346614, 0.9666129, 0, 0, 0, 1, 1,
-0.6604988, 1.073058, -0.5833134, 0, 0, 0, 1, 1,
-0.6571572, 0.6019335, -0.5077614, 0, 0, 0, 1, 1,
-0.6485636, -0.5196497, -2.824893, 0, 0, 0, 1, 1,
-0.6481632, -0.1760131, -1.928941, 1, 1, 1, 1, 1,
-0.6475195, 0.1762506, -1.346688, 1, 1, 1, 1, 1,
-0.6457729, -0.2756387, -0.9561353, 1, 1, 1, 1, 1,
-0.6451867, -2.211369, -3.491641, 1, 1, 1, 1, 1,
-0.62594, -0.743295, -2.526394, 1, 1, 1, 1, 1,
-0.6248689, -0.99944, -3.627576, 1, 1, 1, 1, 1,
-0.6241853, -0.4452282, -2.249896, 1, 1, 1, 1, 1,
-0.6203392, -0.2007922, -2.720354, 1, 1, 1, 1, 1,
-0.6172715, 0.1330156, -1.032124, 1, 1, 1, 1, 1,
-0.6170954, -0.5492368, -1.108232, 1, 1, 1, 1, 1,
-0.6162003, 0.4366662, -1.450037, 1, 1, 1, 1, 1,
-0.6159039, 0.6685402, -1.214628, 1, 1, 1, 1, 1,
-0.6152319, -0.05090645, -0.7536489, 1, 1, 1, 1, 1,
-0.6124921, 0.1237788, -1.501367, 1, 1, 1, 1, 1,
-0.6066978, 0.2234659, -0.8658913, 1, 1, 1, 1, 1,
-0.605781, 1.14814, -1.483886, 0, 0, 1, 1, 1,
-0.6057263, -1.207415, -3.978103, 1, 0, 0, 1, 1,
-0.6053442, 0.2925356, -1.55948, 1, 0, 0, 1, 1,
-0.6020488, 0.9693195, -0.0940101, 1, 0, 0, 1, 1,
-0.6005693, -0.6666679, -2.343538, 1, 0, 0, 1, 1,
-0.5987864, -2.078286, -2.812838, 1, 0, 0, 1, 1,
-0.5967659, -0.04167576, -0.7867769, 0, 0, 0, 1, 1,
-0.5966001, -0.03464593, -3.007831, 0, 0, 0, 1, 1,
-0.5959373, 0.3665779, 0.9100684, 0, 0, 0, 1, 1,
-0.591985, 1.79043, -1.702419, 0, 0, 0, 1, 1,
-0.5809111, -0.5234119, -1.833351, 0, 0, 0, 1, 1,
-0.5778384, -0.6814854, -2.412463, 0, 0, 0, 1, 1,
-0.567026, 0.5568727, -1.13862, 0, 0, 0, 1, 1,
-0.5618657, 0.9178931, -2.190855, 1, 1, 1, 1, 1,
-0.5538843, -0.5305156, -0.8535731, 1, 1, 1, 1, 1,
-0.5528993, -0.4416198, -2.647054, 1, 1, 1, 1, 1,
-0.5518581, -0.572863, -2.349095, 1, 1, 1, 1, 1,
-0.5487614, 1.514046, -1.318267, 1, 1, 1, 1, 1,
-0.5467131, -1.181558, -4.083769, 1, 1, 1, 1, 1,
-0.5433599, 2.520776, 0.6369615, 1, 1, 1, 1, 1,
-0.5427347, 0.6225019, -0.6540049, 1, 1, 1, 1, 1,
-0.540702, -0.4409639, -0.5069072, 1, 1, 1, 1, 1,
-0.5341492, -0.7590148, -2.515858, 1, 1, 1, 1, 1,
-0.5341151, 1.03672, -0.365813, 1, 1, 1, 1, 1,
-0.5323975, -1.569623, -3.529434, 1, 1, 1, 1, 1,
-0.5298877, 0.007045863, -0.7915159, 1, 1, 1, 1, 1,
-0.5237622, 0.6287081, -0.2543, 1, 1, 1, 1, 1,
-0.5192868, 0.5799852, -1.190993, 1, 1, 1, 1, 1,
-0.5161875, -0.06506728, -1.997421, 0, 0, 1, 1, 1,
-0.5152476, -1.0678, -2.891507, 1, 0, 0, 1, 1,
-0.5146616, -0.1063204, -2.306277, 1, 0, 0, 1, 1,
-0.511335, -0.1515602, 1.528278, 1, 0, 0, 1, 1,
-0.5049506, -1.439761, -2.265437, 1, 0, 0, 1, 1,
-0.5007879, 0.3706948, -1.13715, 1, 0, 0, 1, 1,
-0.4967186, -1.345441, -0.9256799, 0, 0, 0, 1, 1,
-0.4944606, -1.561922, -2.546293, 0, 0, 0, 1, 1,
-0.4885449, -0.1011085, -1.179327, 0, 0, 0, 1, 1,
-0.4849384, 0.5243028, -0.2212296, 0, 0, 0, 1, 1,
-0.4849367, 2.140703, -2.059054, 0, 0, 0, 1, 1,
-0.4824595, 0.3424594, -0.7355255, 0, 0, 0, 1, 1,
-0.4814415, 1.010248, 0.197688, 0, 0, 0, 1, 1,
-0.4786057, -0.5205208, -1.665952, 1, 1, 1, 1, 1,
-0.4701174, -0.4789057, -2.133006, 1, 1, 1, 1, 1,
-0.4691978, 0.827448, -1.14667, 1, 1, 1, 1, 1,
-0.4621774, 1.061109, -1.193458, 1, 1, 1, 1, 1,
-0.4564255, 1.812553, -0.8775292, 1, 1, 1, 1, 1,
-0.4527301, 0.09177445, -1.595047, 1, 1, 1, 1, 1,
-0.4412823, -0.5066732, -1.364196, 1, 1, 1, 1, 1,
-0.4404095, 1.067228, -0.8515777, 1, 1, 1, 1, 1,
-0.4333581, 0.6073961, -1.998967, 1, 1, 1, 1, 1,
-0.4333093, 0.2929624, -1.974078, 1, 1, 1, 1, 1,
-0.4318948, -1.236551, -2.498633, 1, 1, 1, 1, 1,
-0.4306236, 0.0336117, -1.599414, 1, 1, 1, 1, 1,
-0.4302739, 0.7186807, -1.445176, 1, 1, 1, 1, 1,
-0.430188, -0.9890153, -1.664147, 1, 1, 1, 1, 1,
-0.4241827, 0.5859447, -0.05209999, 1, 1, 1, 1, 1,
-0.4236974, -2.155517, -3.364858, 0, 0, 1, 1, 1,
-0.4228527, 0.3658872, -1.155312, 1, 0, 0, 1, 1,
-0.4216999, 1.301276, -1.395027, 1, 0, 0, 1, 1,
-0.4180934, -1.147074, -3.703537, 1, 0, 0, 1, 1,
-0.4140946, -1.29592, -2.476337, 1, 0, 0, 1, 1,
-0.4107675, 0.7366942, 0.575754, 1, 0, 0, 1, 1,
-0.408688, -0.38061, -3.319368, 0, 0, 0, 1, 1,
-0.4083798, -0.08643674, -1.676806, 0, 0, 0, 1, 1,
-0.4052212, 1.368976, 0.04270361, 0, 0, 0, 1, 1,
-0.3994928, 2.03393, -1.750398, 0, 0, 0, 1, 1,
-0.3984159, 0.2594513, -0.07493524, 0, 0, 0, 1, 1,
-0.3959168, -0.4092183, -3.039865, 0, 0, 0, 1, 1,
-0.3897716, 0.3293269, -1.340102, 0, 0, 0, 1, 1,
-0.3880129, -1.140619, -1.619001, 1, 1, 1, 1, 1,
-0.3840299, 0.3185017, -0.4873666, 1, 1, 1, 1, 1,
-0.3840249, 0.836452, -1.315871, 1, 1, 1, 1, 1,
-0.3774061, 1.346491, 1.561296, 1, 1, 1, 1, 1,
-0.3771831, -0.8444551, -1.884573, 1, 1, 1, 1, 1,
-0.3744134, 0.6707452, -0.6375233, 1, 1, 1, 1, 1,
-0.373989, -1.027244, -3.172886, 1, 1, 1, 1, 1,
-0.3720458, 0.3183331, -2.855348, 1, 1, 1, 1, 1,
-0.3660496, -1.05299, -2.712109, 1, 1, 1, 1, 1,
-0.3659718, 1.556098, -1.086267, 1, 1, 1, 1, 1,
-0.362151, -0.1554543, -1.87842, 1, 1, 1, 1, 1,
-0.3620102, -0.7990667, -3.019625, 1, 1, 1, 1, 1,
-0.3616413, 0.3985226, -1.41179, 1, 1, 1, 1, 1,
-0.3598038, 0.6144411, -0.3795661, 1, 1, 1, 1, 1,
-0.3584062, 0.7002537, 1.457277, 1, 1, 1, 1, 1,
-0.3539539, -0.118388, -2.908402, 0, 0, 1, 1, 1,
-0.3517017, -0.1737753, -2.202227, 1, 0, 0, 1, 1,
-0.351406, 1.987536, -0.3023044, 1, 0, 0, 1, 1,
-0.3506175, -0.2851492, -4.877051, 1, 0, 0, 1, 1,
-0.3494534, -0.2211476, -4.058831, 1, 0, 0, 1, 1,
-0.3490457, -2.336853, -3.106538, 1, 0, 0, 1, 1,
-0.3431356, 1.270415, -0.6796645, 0, 0, 0, 1, 1,
-0.3410371, 0.6472086, 0.1405406, 0, 0, 0, 1, 1,
-0.3354058, -0.6599036, -4.004478, 0, 0, 0, 1, 1,
-0.3336058, 0.556797, -0.9180482, 0, 0, 0, 1, 1,
-0.3330317, -1.055442, -1.732955, 0, 0, 0, 1, 1,
-0.3307807, -0.9960793, -2.940465, 0, 0, 0, 1, 1,
-0.3288211, 0.3083078, -0.6515948, 0, 0, 0, 1, 1,
-0.3285466, 0.2608436, -1.592523, 1, 1, 1, 1, 1,
-0.3270938, 0.2129555, -0.8117577, 1, 1, 1, 1, 1,
-0.3240515, -1.09432, -3.151779, 1, 1, 1, 1, 1,
-0.3106648, -0.4844248, -2.941426, 1, 1, 1, 1, 1,
-0.3104164, -0.5218769, -3.245527, 1, 1, 1, 1, 1,
-0.3029717, 0.8538799, -0.7082109, 1, 1, 1, 1, 1,
-0.3010806, -0.311909, -3.068338, 1, 1, 1, 1, 1,
-0.2958982, -0.5759889, -2.622861, 1, 1, 1, 1, 1,
-0.2870194, 0.8722627, 0.525434, 1, 1, 1, 1, 1,
-0.2857234, 0.366195, -1.262193, 1, 1, 1, 1, 1,
-0.2842879, 0.3317969, 0.5109233, 1, 1, 1, 1, 1,
-0.2810946, 0.5957051, -0.7823518, 1, 1, 1, 1, 1,
-0.2793705, -0.3028694, -1.071579, 1, 1, 1, 1, 1,
-0.2774465, -0.5558388, -4.612808, 1, 1, 1, 1, 1,
-0.2751818, 1.33978, 0.1273209, 1, 1, 1, 1, 1,
-0.2730758, 0.87275, 0.9727306, 0, 0, 1, 1, 1,
-0.2726885, -0.5117292, -3.265397, 1, 0, 0, 1, 1,
-0.2715507, 1.702066, 1.351189, 1, 0, 0, 1, 1,
-0.2691407, -0.1512983, -2.863777, 1, 0, 0, 1, 1,
-0.2677336, 0.9876412, 1.137044, 1, 0, 0, 1, 1,
-0.2677066, -0.3472396, -1.696221, 1, 0, 0, 1, 1,
-0.2661333, 0.6794229, -0.7384112, 0, 0, 0, 1, 1,
-0.258161, 1.1106, 1.068673, 0, 0, 0, 1, 1,
-0.2455987, -0.01874272, -1.318985, 0, 0, 0, 1, 1,
-0.2445218, -0.004618917, -2.057277, 0, 0, 0, 1, 1,
-0.2436448, -0.8537008, -4.146664, 0, 0, 0, 1, 1,
-0.2417525, 0.7118952, 0.8257651, 0, 0, 0, 1, 1,
-0.2408332, -0.4338835, -3.924445, 0, 0, 0, 1, 1,
-0.2401324, -1.549689, -1.762651, 1, 1, 1, 1, 1,
-0.2341931, 0.751147, -1.46009, 1, 1, 1, 1, 1,
-0.233052, -1.652231, -1.576082, 1, 1, 1, 1, 1,
-0.2295079, 1.135907, 0.07633137, 1, 1, 1, 1, 1,
-0.2289055, 0.4701654, 0.2604211, 1, 1, 1, 1, 1,
-0.2228332, 0.4407085, -2.380125, 1, 1, 1, 1, 1,
-0.2202937, -0.06673764, -2.336085, 1, 1, 1, 1, 1,
-0.2180645, -0.6725243, -4.044686, 1, 1, 1, 1, 1,
-0.2170864, 0.2295026, -0.6333551, 1, 1, 1, 1, 1,
-0.2167992, -0.4826823, -1.52171, 1, 1, 1, 1, 1,
-0.2165758, 0.4302231, 1.080992, 1, 1, 1, 1, 1,
-0.2158937, -2.351116, -3.757793, 1, 1, 1, 1, 1,
-0.2003902, 0.4248389, 0.1943171, 1, 1, 1, 1, 1,
-0.1984903, 1.103272, -1.131721, 1, 1, 1, 1, 1,
-0.1961749, -0.7118624, -3.414779, 1, 1, 1, 1, 1,
-0.1956145, -1.083279, -5.030302, 0, 0, 1, 1, 1,
-0.1948492, -1.513619, -1.436403, 1, 0, 0, 1, 1,
-0.1937839, 1.588431, 0.08312093, 1, 0, 0, 1, 1,
-0.1862362, -1.261781, -2.300643, 1, 0, 0, 1, 1,
-0.1849859, -0.3235174, -2.739318, 1, 0, 0, 1, 1,
-0.1826278, -0.1042375, -2.627644, 1, 0, 0, 1, 1,
-0.1814121, -1.83029, -0.7548645, 0, 0, 0, 1, 1,
-0.1801217, -1.185311, -2.720935, 0, 0, 0, 1, 1,
-0.1717677, 0.807052, -0.3741173, 0, 0, 0, 1, 1,
-0.1707638, -0.4280138, -0.9677752, 0, 0, 0, 1, 1,
-0.167449, -0.8540717, -2.116469, 0, 0, 0, 1, 1,
-0.1664677, -1.875823, -1.986416, 0, 0, 0, 1, 1,
-0.1647973, -0.9334309, -2.845838, 0, 0, 0, 1, 1,
-0.1542382, -0.4284823, -2.466854, 1, 1, 1, 1, 1,
-0.1522845, 0.7936279, -0.5413389, 1, 1, 1, 1, 1,
-0.1487018, -0.7731034, -3.023828, 1, 1, 1, 1, 1,
-0.1443987, -0.09476021, -2.85638, 1, 1, 1, 1, 1,
-0.1428645, 0.970457, 0.5066679, 1, 1, 1, 1, 1,
-0.1374523, -1.022538, -2.064842, 1, 1, 1, 1, 1,
-0.1368025, 0.1703871, 0.9489366, 1, 1, 1, 1, 1,
-0.1325106, -1.765237, -2.800286, 1, 1, 1, 1, 1,
-0.1235211, 0.3327909, 0.208659, 1, 1, 1, 1, 1,
-0.1189585, -1.603197, -3.211507, 1, 1, 1, 1, 1,
-0.1124977, 1.735404, -2.058243, 1, 1, 1, 1, 1,
-0.1105195, 0.5155567, 1.674684, 1, 1, 1, 1, 1,
-0.1087011, 1.387674, 0.9500488, 1, 1, 1, 1, 1,
-0.107982, -1.136643, -1.858468, 1, 1, 1, 1, 1,
-0.1076251, -0.7030734, -4.78567, 1, 1, 1, 1, 1,
-0.107135, -0.7570719, -4.15369, 0, 0, 1, 1, 1,
-0.1064716, 0.5269297, -0.2063451, 1, 0, 0, 1, 1,
-0.1059187, 0.8714471, 0.7232074, 1, 0, 0, 1, 1,
-0.1050366, 1.230932, -0.6679491, 1, 0, 0, 1, 1,
-0.09982015, -0.395507, -3.598223, 1, 0, 0, 1, 1,
-0.09827586, 1.322918, -0.6376663, 1, 0, 0, 1, 1,
-0.09620851, -0.3536499, -3.431195, 0, 0, 0, 1, 1,
-0.09151655, 1.761296, -0.09123606, 0, 0, 0, 1, 1,
-0.09100495, 0.5167404, -0.3781871, 0, 0, 0, 1, 1,
-0.08850627, -2.204565, -3.001911, 0, 0, 0, 1, 1,
-0.08277498, 0.573946, -1.315378, 0, 0, 0, 1, 1,
-0.08049525, 1.459916, 1.219973, 0, 0, 0, 1, 1,
-0.08017755, 1.771773, -0.37158, 0, 0, 0, 1, 1,
-0.07251441, 2.047469, -1.606649, 1, 1, 1, 1, 1,
-0.07166398, -1.633723, -2.380583, 1, 1, 1, 1, 1,
-0.06422115, 0.2523757, 0.4240921, 1, 1, 1, 1, 1,
-0.0612148, -0.4057675, -3.48924, 1, 1, 1, 1, 1,
-0.05979526, -1.616462, -3.091912, 1, 1, 1, 1, 1,
-0.05013383, 1.495659, 0.02866109, 1, 1, 1, 1, 1,
-0.04846046, 1.824196, -2.275774, 1, 1, 1, 1, 1,
-0.04631682, -1.327107, -3.104255, 1, 1, 1, 1, 1,
-0.04435613, -0.03627396, -2.955633, 1, 1, 1, 1, 1,
-0.04389791, 0.8045844, 0.4386578, 1, 1, 1, 1, 1,
-0.04329384, 2.897137, -0.04109024, 1, 1, 1, 1, 1,
-0.03887494, -0.1969682, -2.928478, 1, 1, 1, 1, 1,
-0.03141821, 0.009332622, -1.066252, 1, 1, 1, 1, 1,
-0.03051583, 1.019636, 2.179776, 1, 1, 1, 1, 1,
-0.02094512, 0.1313731, -0.2794735, 1, 1, 1, 1, 1,
-0.01880146, 0.9930147, -2.198998, 0, 0, 1, 1, 1,
-0.0162527, 1.332605, 0.07803244, 1, 0, 0, 1, 1,
-0.01530202, 1.007598, 0.08431095, 1, 0, 0, 1, 1,
-0.0151556, 0.0979534, 1.046931, 1, 0, 0, 1, 1,
-0.0136917, -0.9443755, -4.095953, 1, 0, 0, 1, 1,
-0.0006534189, -0.764245, -3.825743, 1, 0, 0, 1, 1,
3.264722e-05, -0.1054161, 2.430695, 0, 0, 0, 1, 1,
0.001614939, -0.5716558, 2.282056, 0, 0, 0, 1, 1,
0.003282179, 0.2401834, 0.2193584, 0, 0, 0, 1, 1,
0.003331326, -0.1854751, 0.52118, 0, 0, 0, 1, 1,
0.004691833, -0.9491966, 2.920682, 0, 0, 0, 1, 1,
0.005788642, -0.3491654, 2.761593, 0, 0, 0, 1, 1,
0.007879843, 0.2849918, -1.256741, 0, 0, 0, 1, 1,
0.01016523, 0.6988953, 2.21091, 1, 1, 1, 1, 1,
0.01227, 0.4675116, 2.075533, 1, 1, 1, 1, 1,
0.01675286, -0.5810848, 4.405577, 1, 1, 1, 1, 1,
0.01783858, -1.653223, 1.53483, 1, 1, 1, 1, 1,
0.02074322, 1.239957, -0.4970983, 1, 1, 1, 1, 1,
0.0210418, -1.315561, 4.076964, 1, 1, 1, 1, 1,
0.02124375, -0.07252765, 2.190398, 1, 1, 1, 1, 1,
0.02348357, 0.8339937, 0.7178365, 1, 1, 1, 1, 1,
0.02490093, -0.6685978, 3.630969, 1, 1, 1, 1, 1,
0.02645717, 0.8416413, 0.7998458, 1, 1, 1, 1, 1,
0.02852396, -0.34843, 2.488219, 1, 1, 1, 1, 1,
0.03074623, -0.3914238, 3.520278, 1, 1, 1, 1, 1,
0.03513398, 0.02568477, 1.098993, 1, 1, 1, 1, 1,
0.03888717, -0.5541123, 2.190318, 1, 1, 1, 1, 1,
0.0428192, -0.6126311, 3.241386, 1, 1, 1, 1, 1,
0.04318586, -1.104682, 3.648556, 0, 0, 1, 1, 1,
0.04401801, 1.435825, -0.2292514, 1, 0, 0, 1, 1,
0.04506621, -1.002888, 3.602672, 1, 0, 0, 1, 1,
0.04570831, 0.4600092, 0.4531165, 1, 0, 0, 1, 1,
0.05911145, 0.6486669, 0.3595878, 1, 0, 0, 1, 1,
0.06424516, 0.5792827, 0.9417491, 1, 0, 0, 1, 1,
0.06627064, -0.199941, 1.624024, 0, 0, 0, 1, 1,
0.06760602, -0.6847006, 0.858503, 0, 0, 0, 1, 1,
0.06773119, 0.9715984, -0.3785093, 0, 0, 0, 1, 1,
0.07042291, 0.2634328, 0.7191247, 0, 0, 0, 1, 1,
0.07366844, -0.2106172, 1.189517, 0, 0, 0, 1, 1,
0.0739474, -0.2418535, 1.682959, 0, 0, 0, 1, 1,
0.07775601, -1.553479, 3.582075, 0, 0, 0, 1, 1,
0.08293666, -0.8288554, 2.839911, 1, 1, 1, 1, 1,
0.08695891, 0.827664, 0.7915686, 1, 1, 1, 1, 1,
0.08916134, 0.7190721, -0.2434287, 1, 1, 1, 1, 1,
0.08966174, 0.5693953, 0.5197828, 1, 1, 1, 1, 1,
0.09073269, 0.8665043, 1.7029, 1, 1, 1, 1, 1,
0.09270918, 0.8941721, -0.3669608, 1, 1, 1, 1, 1,
0.09395888, 0.4767562, -0.9567063, 1, 1, 1, 1, 1,
0.1057415, -0.6269976, 3.607989, 1, 1, 1, 1, 1,
0.1067044, 0.01503653, 1.541864, 1, 1, 1, 1, 1,
0.1069849, -0.6777343, 0.6817911, 1, 1, 1, 1, 1,
0.1073355, 0.03035865, 0.9474895, 1, 1, 1, 1, 1,
0.1115998, -1.16385, 3.664914, 1, 1, 1, 1, 1,
0.1139688, -0.126474, 3.298582, 1, 1, 1, 1, 1,
0.1196205, 0.1267186, 3.181724, 1, 1, 1, 1, 1,
0.1215843, 0.5541826, 1.274952, 1, 1, 1, 1, 1,
0.1274512, 1.504695, 0.7116311, 0, 0, 1, 1, 1,
0.1327305, 0.6375374, 0.9755881, 1, 0, 0, 1, 1,
0.1373956, 0.8327284, 1.928467, 1, 0, 0, 1, 1,
0.1375686, 1.448386, -1.162523, 1, 0, 0, 1, 1,
0.1401654, -2.225279, 3.957837, 1, 0, 0, 1, 1,
0.1407256, -0.3346418, 1.791534, 1, 0, 0, 1, 1,
0.1480921, -0.1106438, 2.422418, 0, 0, 0, 1, 1,
0.1551694, 0.6809792, -0.09076218, 0, 0, 0, 1, 1,
0.1601951, 2.192839, 0.4163212, 0, 0, 0, 1, 1,
0.1613085, -1.06615, 3.845086, 0, 0, 0, 1, 1,
0.1633269, 0.5758427, -0.9463766, 0, 0, 0, 1, 1,
0.1684394, -0.6504918, 3.613981, 0, 0, 0, 1, 1,
0.1692317, 1.117095, 0.8478727, 0, 0, 0, 1, 1,
0.1731736, 0.2554266, 0.4118702, 1, 1, 1, 1, 1,
0.1763969, -0.4206223, 2.814019, 1, 1, 1, 1, 1,
0.1771645, 0.5665146, 1.585804, 1, 1, 1, 1, 1,
0.1819224, -0.1623711, 1.405509, 1, 1, 1, 1, 1,
0.1820776, -0.2511346, 2.886692, 1, 1, 1, 1, 1,
0.1824755, -0.9263904, 3.350542, 1, 1, 1, 1, 1,
0.186654, -1.26226, 2.89095, 1, 1, 1, 1, 1,
0.1880212, -0.3803068, 2.525671, 1, 1, 1, 1, 1,
0.1965337, -0.1070053, 2.866455, 1, 1, 1, 1, 1,
0.1974085, -0.02371568, 2.616697, 1, 1, 1, 1, 1,
0.2021615, -0.3065146, 3.700636, 1, 1, 1, 1, 1,
0.2061984, -0.4248024, 2.305585, 1, 1, 1, 1, 1,
0.2072648, -1.419689, 2.364359, 1, 1, 1, 1, 1,
0.2076626, -0.4756995, 4.379608, 1, 1, 1, 1, 1,
0.2094239, -0.6662312, 2.50949, 1, 1, 1, 1, 1,
0.2095831, 1.415208, -1.470052, 0, 0, 1, 1, 1,
0.224213, -0.04926821, 3.699947, 1, 0, 0, 1, 1,
0.2280119, 0.7755551, 1.000525, 1, 0, 0, 1, 1,
0.2318445, -1.122081, 4.277924, 1, 0, 0, 1, 1,
0.2332195, 1.402595, -0.7879068, 1, 0, 0, 1, 1,
0.2391457, 0.1857474, 3.036854, 1, 0, 0, 1, 1,
0.2436436, 1.798088, 1.359841, 0, 0, 0, 1, 1,
0.2437167, -0.3674583, 2.40507, 0, 0, 0, 1, 1,
0.245056, -0.8353121, 3.88811, 0, 0, 0, 1, 1,
0.2463016, -0.9908869, 3.608919, 0, 0, 0, 1, 1,
0.249469, -0.5309104, 1.698414, 0, 0, 0, 1, 1,
0.2495222, 0.1795568, -0.1480811, 0, 0, 0, 1, 1,
0.250956, 1.692768, 1.697309, 0, 0, 0, 1, 1,
0.2513537, -0.0363327, 0.2988306, 1, 1, 1, 1, 1,
0.2605523, 0.3486564, -1.263564, 1, 1, 1, 1, 1,
0.2624914, -0.905205, 1.920099, 1, 1, 1, 1, 1,
0.2645617, 0.3795258, -0.5690452, 1, 1, 1, 1, 1,
0.2718491, -1.83528, 4.271275, 1, 1, 1, 1, 1,
0.2719302, -0.2325988, 2.551322, 1, 1, 1, 1, 1,
0.2764295, -1.390539, 2.62251, 1, 1, 1, 1, 1,
0.2770136, 1.382001, 0.1479688, 1, 1, 1, 1, 1,
0.2808188, 0.8565123, 2.210931, 1, 1, 1, 1, 1,
0.2856609, -1.405634, 5.193758, 1, 1, 1, 1, 1,
0.290232, -1.173057, 3.124678, 1, 1, 1, 1, 1,
0.2915137, -2.559411, 3.582355, 1, 1, 1, 1, 1,
0.3002505, -0.3062171, 2.162411, 1, 1, 1, 1, 1,
0.3006196, 0.2160303, 1.833393, 1, 1, 1, 1, 1,
0.3037364, 0.3563576, 1.875057, 1, 1, 1, 1, 1,
0.3045331, 0.3996156, -1.102988, 0, 0, 1, 1, 1,
0.3054059, 0.754483, 0.7244233, 1, 0, 0, 1, 1,
0.307621, 1.01318, 0.3015245, 1, 0, 0, 1, 1,
0.3081871, -0.8964808, 2.572731, 1, 0, 0, 1, 1,
0.3102175, -1.634962, 2.340969, 1, 0, 0, 1, 1,
0.3133046, -0.1279931, 2.844264, 1, 0, 0, 1, 1,
0.3152058, -0.01634409, 4.761897, 0, 0, 0, 1, 1,
0.3233007, 0.546539, 1.162945, 0, 0, 0, 1, 1,
0.3235128, 0.1267652, -1.52313, 0, 0, 0, 1, 1,
0.323613, -0.9000075, 3.238386, 0, 0, 0, 1, 1,
0.3280107, -1.784632, 4.380992, 0, 0, 0, 1, 1,
0.3367504, -1.773296, 2.695998, 0, 0, 0, 1, 1,
0.337222, -0.4495011, 2.699305, 0, 0, 0, 1, 1,
0.3375884, -0.2456546, 3.020392, 1, 1, 1, 1, 1,
0.3389493, 0.1237147, 1.403971, 1, 1, 1, 1, 1,
0.3440829, 1.309004, -0.5836627, 1, 1, 1, 1, 1,
0.3466028, -0.7860925, 3.380325, 1, 1, 1, 1, 1,
0.351111, -0.6646066, 2.481248, 1, 1, 1, 1, 1,
0.3517809, -0.1847671, 1.070934, 1, 1, 1, 1, 1,
0.3532327, 0.1031249, 0.4599242, 1, 1, 1, 1, 1,
0.3542615, -0.777402, 2.584866, 1, 1, 1, 1, 1,
0.3555362, 0.3744348, 0.5841004, 1, 1, 1, 1, 1,
0.3583928, 1.155921, 0.5339584, 1, 1, 1, 1, 1,
0.3584148, 1.018545, 0.3479799, 1, 1, 1, 1, 1,
0.3615642, -1.190514, 3.677844, 1, 1, 1, 1, 1,
0.3643315, -2.021398, 3.046429, 1, 1, 1, 1, 1,
0.3661701, -1.654017, 4.571687, 1, 1, 1, 1, 1,
0.3669251, 1.112844, -0.2057182, 1, 1, 1, 1, 1,
0.3684425, -1.726489, 2.140944, 0, 0, 1, 1, 1,
0.3702695, 0.4205456, 2.901369, 1, 0, 0, 1, 1,
0.3724295, 0.595004, -0.4680667, 1, 0, 0, 1, 1,
0.3745105, 1.187604, 0.05339273, 1, 0, 0, 1, 1,
0.3786715, 1.284535, 0.6766808, 1, 0, 0, 1, 1,
0.3820123, 1.014439, 0.9521555, 1, 0, 0, 1, 1,
0.3830582, 0.168226, 1.209596, 0, 0, 0, 1, 1,
0.3846604, -0.8051015, 2.828706, 0, 0, 0, 1, 1,
0.3871377, -0.7720334, 5.215604, 0, 0, 0, 1, 1,
0.3912902, -1.116487, 2.615334, 0, 0, 0, 1, 1,
0.3920157, -0.3739574, 1.139557, 0, 0, 0, 1, 1,
0.3924378, -0.3789035, 2.461706, 0, 0, 0, 1, 1,
0.3980195, -1.650462, 3.679497, 0, 0, 0, 1, 1,
0.408113, -1.049178, 1.263998, 1, 1, 1, 1, 1,
0.4089246, -1.697903, 1.394382, 1, 1, 1, 1, 1,
0.412357, -0.7335685, 2.867284, 1, 1, 1, 1, 1,
0.4151281, 0.3575194, 0.8855395, 1, 1, 1, 1, 1,
0.4167861, 0.1016934, 0.2331927, 1, 1, 1, 1, 1,
0.4168659, 0.3920261, 1.821484, 1, 1, 1, 1, 1,
0.4181543, 1.094527, 0.8538681, 1, 1, 1, 1, 1,
0.4254752, -0.8783939, 3.280097, 1, 1, 1, 1, 1,
0.4319423, 0.4179674, 2.532658, 1, 1, 1, 1, 1,
0.4326655, -0.6949229, 2.768373, 1, 1, 1, 1, 1,
0.4419542, 1.387584, -1.281108, 1, 1, 1, 1, 1,
0.4436887, -0.1486783, 1.382578, 1, 1, 1, 1, 1,
0.4454286, 0.1647748, 1.640842, 1, 1, 1, 1, 1,
0.449672, -0.6776707, 1.698825, 1, 1, 1, 1, 1,
0.4531248, 0.06298737, 1.354181, 1, 1, 1, 1, 1,
0.4548889, 1.487476, 0.4349688, 0, 0, 1, 1, 1,
0.4582483, -1.001783, 2.256171, 1, 0, 0, 1, 1,
0.4600627, 0.5199383, 1.354002, 1, 0, 0, 1, 1,
0.4606466, 0.5046161, -0.2851402, 1, 0, 0, 1, 1,
0.4624009, 0.7111989, 0.8791903, 1, 0, 0, 1, 1,
0.4652299, -0.1289459, 1.018517, 1, 0, 0, 1, 1,
0.4709791, 0.2550785, -0.1107599, 0, 0, 0, 1, 1,
0.4730763, -0.4498554, 0.5829321, 0, 0, 0, 1, 1,
0.4747412, 0.1198954, 0.1950779, 0, 0, 0, 1, 1,
0.4749094, 0.03205718, 0.2665418, 0, 0, 0, 1, 1,
0.4775588, 0.5210319, 2.365784, 0, 0, 0, 1, 1,
0.4777391, -0.7426558, 2.435179, 0, 0, 0, 1, 1,
0.4883001, 1.565945, 2.375031, 0, 0, 0, 1, 1,
0.4895481, 0.222416, 0.08568412, 1, 1, 1, 1, 1,
0.4898268, -0.5423803, 2.757313, 1, 1, 1, 1, 1,
0.4931584, -0.6056981, 1.754413, 1, 1, 1, 1, 1,
0.4943516, 1.817013, 1.228376, 1, 1, 1, 1, 1,
0.4959962, 1.224877, 0.2048391, 1, 1, 1, 1, 1,
0.4981325, -0.1925645, 2.977312, 1, 1, 1, 1, 1,
0.4982441, -0.4405451, 3.13893, 1, 1, 1, 1, 1,
0.499555, 1.060567, 0.7566503, 1, 1, 1, 1, 1,
0.4996023, 0.9704721, 1.729568, 1, 1, 1, 1, 1,
0.5101613, 1.154161, 1.549748, 1, 1, 1, 1, 1,
0.5107683, 0.353514, 1.176865, 1, 1, 1, 1, 1,
0.5111951, -0.1125654, 2.003437, 1, 1, 1, 1, 1,
0.515762, 1.578477, -0.5475377, 1, 1, 1, 1, 1,
0.5158061, 1.128431, -0.6017687, 1, 1, 1, 1, 1,
0.5165439, 0.5824996, 2.644647, 1, 1, 1, 1, 1,
0.5180106, -0.9784753, 2.938649, 0, 0, 1, 1, 1,
0.5196712, -1.616816, 2.625278, 1, 0, 0, 1, 1,
0.5199472, 0.5723063, -0.6522981, 1, 0, 0, 1, 1,
0.5206866, -0.5634199, 2.094436, 1, 0, 0, 1, 1,
0.5228295, 0.7474015, -0.6885766, 1, 0, 0, 1, 1,
0.5279371, 0.7408708, 0.7441199, 1, 0, 0, 1, 1,
0.5339829, -0.6466367, 1.493455, 0, 0, 0, 1, 1,
0.5381761, 0.5735357, 0.3502084, 0, 0, 0, 1, 1,
0.5400637, 0.1830077, 1.423647, 0, 0, 0, 1, 1,
0.5448804, -0.2558629, 0.680917, 0, 0, 0, 1, 1,
0.5494672, 1.651064, 1.176003, 0, 0, 0, 1, 1,
0.550198, 0.6926164, 1.167871, 0, 0, 0, 1, 1,
0.5539265, -1.272543, 1.402684, 0, 0, 0, 1, 1,
0.5596924, 0.0276684, 2.993452, 1, 1, 1, 1, 1,
0.5603981, 0.2633783, -0.1280834, 1, 1, 1, 1, 1,
0.562298, 0.09204272, 1.214789, 1, 1, 1, 1, 1,
0.5668373, -0.7058432, 2.064859, 1, 1, 1, 1, 1,
0.5668731, 0.7869378, 1.472523, 1, 1, 1, 1, 1,
0.5759608, 0.5767268, 0.2628622, 1, 1, 1, 1, 1,
0.5763273, -0.06906229, 1.475977, 1, 1, 1, 1, 1,
0.5769899, 1.019385, 2.097714, 1, 1, 1, 1, 1,
0.5816732, 1.008492, 0.9932204, 1, 1, 1, 1, 1,
0.5828355, 0.04886733, 0.9243761, 1, 1, 1, 1, 1,
0.587164, 0.1080101, 0.5439431, 1, 1, 1, 1, 1,
0.5906405, 0.3129728, 1.26519, 1, 1, 1, 1, 1,
0.5914465, 0.6613086, 1.497106, 1, 1, 1, 1, 1,
0.5999592, -0.5195339, 2.071123, 1, 1, 1, 1, 1,
0.6004313, -0.5530494, 0.9574205, 1, 1, 1, 1, 1,
0.6113615, -0.7528307, 2.168084, 0, 0, 1, 1, 1,
0.6126153, -1.20346, 1.903373, 1, 0, 0, 1, 1,
0.6146228, 1.414036, 1.296824, 1, 0, 0, 1, 1,
0.6165498, -2.215658, 1.278283, 1, 0, 0, 1, 1,
0.6174996, 0.5242521, 1.850609, 1, 0, 0, 1, 1,
0.6188371, 0.3562892, 0.7377798, 1, 0, 0, 1, 1,
0.6202134, -1.724259, 2.335297, 0, 0, 0, 1, 1,
0.6227951, -0.009675944, -0.1593115, 0, 0, 0, 1, 1,
0.6288763, -0.3275491, 3.401423, 0, 0, 0, 1, 1,
0.633919, -0.8553971, 3.166073, 0, 0, 0, 1, 1,
0.6352207, -0.3562216, 1.095552, 0, 0, 0, 1, 1,
0.647509, -2.506134, 3.170302, 0, 0, 0, 1, 1,
0.6478184, 2.301432, 1.461251, 0, 0, 0, 1, 1,
0.6560096, -0.8332114, 1.799387, 1, 1, 1, 1, 1,
0.6561631, 0.5673963, -0.1571433, 1, 1, 1, 1, 1,
0.6563135, 0.4609029, 1.445336, 1, 1, 1, 1, 1,
0.6581059, -0.5530357, 2.541121, 1, 1, 1, 1, 1,
0.6606386, -1.952896, 2.724256, 1, 1, 1, 1, 1,
0.660836, -0.06310022, 2.885005, 1, 1, 1, 1, 1,
0.6623472, 0.431106, 0.8454973, 1, 1, 1, 1, 1,
0.6625853, 0.6300803, 2.394116, 1, 1, 1, 1, 1,
0.6679996, 0.3521355, 1.868426, 1, 1, 1, 1, 1,
0.6714863, 2.538871, 0.5176222, 1, 1, 1, 1, 1,
0.6823169, -0.1427802, 1.061091, 1, 1, 1, 1, 1,
0.685017, 0.5502995, 2.307688, 1, 1, 1, 1, 1,
0.6864858, 0.6230667, 3.045903, 1, 1, 1, 1, 1,
0.6888719, -0.1132507, 1.421054, 1, 1, 1, 1, 1,
0.6960634, -0.5205513, 1.933586, 1, 1, 1, 1, 1,
0.7000703, -1.037447, 2.188785, 0, 0, 1, 1, 1,
0.7091936, 1.150382, -0.7008991, 1, 0, 0, 1, 1,
0.7114137, 2.045212, -0.4752683, 1, 0, 0, 1, 1,
0.7115585, -0.09929793, 2.788166, 1, 0, 0, 1, 1,
0.7129585, -1.90164, 2.895218, 1, 0, 0, 1, 1,
0.7173433, -0.3073303, 3.532341, 1, 0, 0, 1, 1,
0.721924, -1.198675, 3.303217, 0, 0, 0, 1, 1,
0.726136, -2.037936, 3.418977, 0, 0, 0, 1, 1,
0.726477, -0.019361, 2.03524, 0, 0, 0, 1, 1,
0.7284006, -1.340241, 2.597922, 0, 0, 0, 1, 1,
0.7295815, 0.2020666, 0.4885471, 0, 0, 0, 1, 1,
0.7331107, -0.8287685, 2.391775, 0, 0, 0, 1, 1,
0.7335275, -0.3176877, 0.8184484, 0, 0, 0, 1, 1,
0.7386597, 0.7685016, -0.5858224, 1, 1, 1, 1, 1,
0.7406012, -0.1709494, 2.011114, 1, 1, 1, 1, 1,
0.7428234, 0.04056734, 1.50132, 1, 1, 1, 1, 1,
0.7449092, -1.237918, 1.620888, 1, 1, 1, 1, 1,
0.746742, 1.434006, -1.432651, 1, 1, 1, 1, 1,
0.7491292, 1.142136, -0.6402783, 1, 1, 1, 1, 1,
0.7505565, -0.1654273, 1.403621, 1, 1, 1, 1, 1,
0.7520733, 0.1777114, 2.105232, 1, 1, 1, 1, 1,
0.7560554, 0.5893991, 0.838187, 1, 1, 1, 1, 1,
0.7594411, 0.2626466, 0.8702745, 1, 1, 1, 1, 1,
0.7613077, -0.4740171, 3.143007, 1, 1, 1, 1, 1,
0.7631931, -0.4736538, 3.038956, 1, 1, 1, 1, 1,
0.7718274, 0.2089218, 0.9845321, 1, 1, 1, 1, 1,
0.7719053, 0.1629318, 2.197027, 1, 1, 1, 1, 1,
0.7793515, 0.9564492, 0.6557709, 1, 1, 1, 1, 1,
0.7884458, 0.1789769, 2.735903, 0, 0, 1, 1, 1,
0.7975894, 0.08609027, 1.003708, 1, 0, 0, 1, 1,
0.8006648, -2.504047, 2.063598, 1, 0, 0, 1, 1,
0.8014942, 0.1405937, 1.315402, 1, 0, 0, 1, 1,
0.8057449, -1.049368, 3.153921, 1, 0, 0, 1, 1,
0.8105747, -0.1662521, 1.027234, 1, 0, 0, 1, 1,
0.8137182, -0.0897262, 0.3254794, 0, 0, 0, 1, 1,
0.818072, 0.03538137, 2.25809, 0, 0, 0, 1, 1,
0.8211221, -1.328459, 2.503909, 0, 0, 0, 1, 1,
0.8232436, -0.3660063, 0.4310687, 0, 0, 0, 1, 1,
0.8265539, -1.783972, 3.210734, 0, 0, 0, 1, 1,
0.8280023, -0.3148941, 1.995785, 0, 0, 0, 1, 1,
0.8366435, -0.4879824, 1.214852, 0, 0, 0, 1, 1,
0.8374977, -0.2472364, 2.257596, 1, 1, 1, 1, 1,
0.8428634, 0.5087221, 1.293136, 1, 1, 1, 1, 1,
0.8509817, -0.7350254, 2.62334, 1, 1, 1, 1, 1,
0.8522237, 0.6837052, 1.661811, 1, 1, 1, 1, 1,
0.8652453, -0.4034596, 0.8117982, 1, 1, 1, 1, 1,
0.8664913, 1.368733, 1.750245, 1, 1, 1, 1, 1,
0.8703383, 0.9116301, 2.484266, 1, 1, 1, 1, 1,
0.8722611, -0.6918146, 1.140548, 1, 1, 1, 1, 1,
0.874314, 0.4978442, 0.9950128, 1, 1, 1, 1, 1,
0.877248, 0.7217519, 1.608104, 1, 1, 1, 1, 1,
0.8838172, 0.5388764, -0.1440016, 1, 1, 1, 1, 1,
0.8870478, 0.4134569, 0.2789614, 1, 1, 1, 1, 1,
0.8887938, 0.3073941, 0.3388525, 1, 1, 1, 1, 1,
0.8908789, 0.1671969, 1.706159, 1, 1, 1, 1, 1,
0.8909469, 1.458007, 1.578602, 1, 1, 1, 1, 1,
0.8912485, 0.761968, 1.102977, 0, 0, 1, 1, 1,
0.8952801, 0.9028276, 2.078527, 1, 0, 0, 1, 1,
0.8987097, -0.8066083, 1.012433, 1, 0, 0, 1, 1,
0.8992271, 1.698046, 1.482665, 1, 0, 0, 1, 1,
0.9015847, 1.038767, 1.191242, 1, 0, 0, 1, 1,
0.9035774, -0.4417787, 1.300537, 1, 0, 0, 1, 1,
0.9075859, 1.178981, 0.8330214, 0, 0, 0, 1, 1,
0.910293, -0.07875584, 1.933116, 0, 0, 0, 1, 1,
0.911688, 0.8929039, -0.03658726, 0, 0, 0, 1, 1,
0.9161007, -0.1377215, 2.560338, 0, 0, 0, 1, 1,
0.9216805, 0.5134271, 2.778022, 0, 0, 0, 1, 1,
0.9261766, -0.6022955, 4.006915, 0, 0, 0, 1, 1,
0.9371763, 0.1787009, 1.541384, 0, 0, 0, 1, 1,
0.9481538, 0.09567939, 0.77451, 1, 1, 1, 1, 1,
0.9503405, 0.8174207, 1.120074, 1, 1, 1, 1, 1,
0.9633475, 1.767217, 0.860653, 1, 1, 1, 1, 1,
0.9645889, -0.007224442, 3.08827, 1, 1, 1, 1, 1,
0.9652398, -0.6523572, 2.36658, 1, 1, 1, 1, 1,
0.9661078, 0.3131163, 1.15524, 1, 1, 1, 1, 1,
0.967532, -0.8194289, 0.4284956, 1, 1, 1, 1, 1,
0.9682837, -0.4752629, 1.323995, 1, 1, 1, 1, 1,
0.9701667, 0.3714721, -1.511155, 1, 1, 1, 1, 1,
0.9713202, 0.5387057, 1.251943, 1, 1, 1, 1, 1,
0.9735591, -0.1177623, 2.255343, 1, 1, 1, 1, 1,
0.9740701, 0.5816944, 0.4414222, 1, 1, 1, 1, 1,
0.9779165, 0.3148806, 3.341661, 1, 1, 1, 1, 1,
0.9862817, 0.1328275, 3.235426, 1, 1, 1, 1, 1,
1.007718, 0.7458807, 1.34015, 1, 1, 1, 1, 1,
1.009295, -0.3551914, 3.108964, 0, 0, 1, 1, 1,
1.009762, 0.8215308, 1.496703, 1, 0, 0, 1, 1,
1.00986, 0.7961631, 0.4519714, 1, 0, 0, 1, 1,
1.016266, -0.6806206, 2.362123, 1, 0, 0, 1, 1,
1.018006, 0.3159156, -0.1794068, 1, 0, 0, 1, 1,
1.018197, 0.05572555, 1.088998, 1, 0, 0, 1, 1,
1.020649, -0.7970666, 2.479811, 0, 0, 0, 1, 1,
1.022663, -0.4653702, 2.771255, 0, 0, 0, 1, 1,
1.027287, -0.08800504, -0.9325454, 0, 0, 0, 1, 1,
1.038502, -1.153937, 2.505717, 0, 0, 0, 1, 1,
1.039086, -2.422361, 3.52635, 0, 0, 0, 1, 1,
1.039635, -1.089639, 3.87903, 0, 0, 0, 1, 1,
1.045551, 0.2019873, 2.1874, 0, 0, 0, 1, 1,
1.046688, -0.9665512, 3.954148, 1, 1, 1, 1, 1,
1.049647, 0.7082982, 0.2017183, 1, 1, 1, 1, 1,
1.050352, 0.4312789, -0.8558996, 1, 1, 1, 1, 1,
1.053864, 0.05921536, 0.4993225, 1, 1, 1, 1, 1,
1.053976, 0.5565353, 2.621355, 1, 1, 1, 1, 1,
1.056818, 0.2860742, 2.873751, 1, 1, 1, 1, 1,
1.058693, -0.7091456, 2.539818, 1, 1, 1, 1, 1,
1.060568, -0.3759888, 2.508699, 1, 1, 1, 1, 1,
1.061948, -1.398285, 3.911025, 1, 1, 1, 1, 1,
1.063485, 1.276554, 2.194461, 1, 1, 1, 1, 1,
1.071803, 0.6779978, 0.5974118, 1, 1, 1, 1, 1,
1.073835, 0.2267447, 1.305812, 1, 1, 1, 1, 1,
1.075532, 0.1382748, 3.435331, 1, 1, 1, 1, 1,
1.077647, 0.3722962, 2.212534, 1, 1, 1, 1, 1,
1.078387, 1.22027, 0.423516, 1, 1, 1, 1, 1,
1.078719, -0.901526, 3.013197, 0, 0, 1, 1, 1,
1.084647, -0.3037326, 1.630421, 1, 0, 0, 1, 1,
1.086001, -0.7673744, 2.612015, 1, 0, 0, 1, 1,
1.090584, -0.7056907, 3.30486, 1, 0, 0, 1, 1,
1.104407, 0.6956492, 1.211121, 1, 0, 0, 1, 1,
1.109724, 0.1865874, 3.188323, 1, 0, 0, 1, 1,
1.114173, -1.023481, 4.41928, 0, 0, 0, 1, 1,
1.115087, 1.80419, -0.9236235, 0, 0, 0, 1, 1,
1.119288, -0.3898664, 1.734131, 0, 0, 0, 1, 1,
1.121833, -0.1044718, 1.887885, 0, 0, 0, 1, 1,
1.122917, 0.2187845, 1.856442, 0, 0, 0, 1, 1,
1.123535, 1.421946, 0.3373438, 0, 0, 0, 1, 1,
1.147181, -1.522218, 3.307263, 0, 0, 0, 1, 1,
1.14816, -0.1640489, 1.259033, 1, 1, 1, 1, 1,
1.148834, 1.696497, 1.312139, 1, 1, 1, 1, 1,
1.153148, -0.7168412, 1.307546, 1, 1, 1, 1, 1,
1.155395, -1.949896, 2.942498, 1, 1, 1, 1, 1,
1.156515, 1.385679, 2.381979, 1, 1, 1, 1, 1,
1.15792, -0.874935, 3.221148, 1, 1, 1, 1, 1,
1.161158, 0.9443114, 0.6376719, 1, 1, 1, 1, 1,
1.161335, -1.204481, 3.473759, 1, 1, 1, 1, 1,
1.161443, 0.1949694, 1.144273, 1, 1, 1, 1, 1,
1.17623, 0.5167722, 0.6360523, 1, 1, 1, 1, 1,
1.185347, 0.5795594, 1.924706, 1, 1, 1, 1, 1,
1.18837, 0.131108, 1.192034, 1, 1, 1, 1, 1,
1.188579, 1.122326, 2.00348, 1, 1, 1, 1, 1,
1.193564, 0.1366675, 0.8468081, 1, 1, 1, 1, 1,
1.194076, 0.2362212, 0.00679057, 1, 1, 1, 1, 1,
1.200303, -0.8622615, 2.676471, 0, 0, 1, 1, 1,
1.201992, -0.7792562, 0.8929247, 1, 0, 0, 1, 1,
1.205354, 0.2912847, 1.4451, 1, 0, 0, 1, 1,
1.206144, 0.9113324, 1.689586, 1, 0, 0, 1, 1,
1.210677, -0.2306687, 1.48451, 1, 0, 0, 1, 1,
1.218504, 0.897355, 1.307992, 1, 0, 0, 1, 1,
1.230311, -0.4707206, 2.680288, 0, 0, 0, 1, 1,
1.232927, -0.9856485, 0.8090479, 0, 0, 0, 1, 1,
1.236049, -0.3233727, 1.416924, 0, 0, 0, 1, 1,
1.240182, -1.68513, 1.052893, 0, 0, 0, 1, 1,
1.243132, 1.851843, -0.2738865, 0, 0, 0, 1, 1,
1.251472, -0.5114162, 1.813612, 0, 0, 0, 1, 1,
1.253019, 0.1128869, 3.000854, 0, 0, 0, 1, 1,
1.257817, 1.017086, -0.3765989, 1, 1, 1, 1, 1,
1.259884, -0.4925817, 3.820125, 1, 1, 1, 1, 1,
1.262111, -0.08359232, 2.47267, 1, 1, 1, 1, 1,
1.263329, -0.5986843, 2.89424, 1, 1, 1, 1, 1,
1.272752, 1.048992, 1.572913, 1, 1, 1, 1, 1,
1.274742, 0.2916883, 1.652395, 1, 1, 1, 1, 1,
1.275616, 0.4045733, 1.8538, 1, 1, 1, 1, 1,
1.284804, -0.3663938, 1.411564, 1, 1, 1, 1, 1,
1.292602, 0.6320023, 2.359739, 1, 1, 1, 1, 1,
1.296035, -0.6325897, 3.596827, 1, 1, 1, 1, 1,
1.296076, -0.9103346, 1.90626, 1, 1, 1, 1, 1,
1.301845, 0.1208163, 2.679329, 1, 1, 1, 1, 1,
1.306299, -0.235084, 1.088985, 1, 1, 1, 1, 1,
1.30688, 1.336129, 0.3296487, 1, 1, 1, 1, 1,
1.307818, -0.4037663, 1.412426, 1, 1, 1, 1, 1,
1.312278, -0.9555314, 2.548376, 0, 0, 1, 1, 1,
1.313913, 0.934114, 1.068311, 1, 0, 0, 1, 1,
1.318591, 1.552138, 0.429533, 1, 0, 0, 1, 1,
1.322836, -0.08705568, 1.278797, 1, 0, 0, 1, 1,
1.326901, -0.5950923, 2.39906, 1, 0, 0, 1, 1,
1.332662, -1.162681, 3.126938, 1, 0, 0, 1, 1,
1.341364, -1.472148, 4.021697, 0, 0, 0, 1, 1,
1.342737, -0.07128477, 0.4332748, 0, 0, 0, 1, 1,
1.363377, -0.6436883, 1.773835, 0, 0, 0, 1, 1,
1.373964, -0.4935229, 2.45016, 0, 0, 0, 1, 1,
1.387845, -0.2598773, 3.245872, 0, 0, 0, 1, 1,
1.389247, -1.100189, 1.627374, 0, 0, 0, 1, 1,
1.393933, 0.02586399, 0.2979648, 0, 0, 0, 1, 1,
1.405987, -0.1040055, 1.968954, 1, 1, 1, 1, 1,
1.408325, -0.3120646, 2.528634, 1, 1, 1, 1, 1,
1.427437, -0.001342791, 3.052926, 1, 1, 1, 1, 1,
1.443382, -0.8672267, 2.002952, 1, 1, 1, 1, 1,
1.445528, -0.1433578, -0.4490176, 1, 1, 1, 1, 1,
1.456184, -0.4128861, 0.7936935, 1, 1, 1, 1, 1,
1.463348, -0.08015978, 3.102583, 1, 1, 1, 1, 1,
1.465969, 0.7770255, 1.867161, 1, 1, 1, 1, 1,
1.468707, 0.7752553, -0.03872638, 1, 1, 1, 1, 1,
1.471313, -1.798061, 1.411694, 1, 1, 1, 1, 1,
1.473946, -2.235374, 1.525909, 1, 1, 1, 1, 1,
1.476581, -0.5089861, 0.8910992, 1, 1, 1, 1, 1,
1.477654, 0.5051237, 0.1891643, 1, 1, 1, 1, 1,
1.47799, -1.936068, 2.395823, 1, 1, 1, 1, 1,
1.479473, -0.4538112, 3.79073, 1, 1, 1, 1, 1,
1.480308, 1.679869, 0.2587252, 0, 0, 1, 1, 1,
1.480816, -0.4093842, 1.165665, 1, 0, 0, 1, 1,
1.491386, 0.2305369, 2.982244, 1, 0, 0, 1, 1,
1.501371, 0.4213869, 0.5797234, 1, 0, 0, 1, 1,
1.503312, -1.193164, 1.615233, 1, 0, 0, 1, 1,
1.503846, -0.7292926, 1.998311, 1, 0, 0, 1, 1,
1.511977, -0.5659242, 3.917492, 0, 0, 0, 1, 1,
1.513864, -0.1607144, 1.124317, 0, 0, 0, 1, 1,
1.559149, 0.6118987, 0.3848549, 0, 0, 0, 1, 1,
1.564071, -0.2296502, 1.70143, 0, 0, 0, 1, 1,
1.564993, -1.243048, 1.742284, 0, 0, 0, 1, 1,
1.572781, 0.5674255, -0.1396234, 0, 0, 0, 1, 1,
1.576072, 0.4566478, -0.5213134, 0, 0, 0, 1, 1,
1.587113, 0.5183473, 2.242311, 1, 1, 1, 1, 1,
1.587867, -0.03922032, 1.818866, 1, 1, 1, 1, 1,
1.591481, -0.3306755, 3.692694, 1, 1, 1, 1, 1,
1.618951, 0.8789047, -0.5950888, 1, 1, 1, 1, 1,
1.628163, -1.189343, 2.112171, 1, 1, 1, 1, 1,
1.643016, -0.6519615, 1.176442, 1, 1, 1, 1, 1,
1.679212, -0.527386, 2.359193, 1, 1, 1, 1, 1,
1.679917, 1.378372, 1.081775, 1, 1, 1, 1, 1,
1.6912, -1.069504, 0.4851732, 1, 1, 1, 1, 1,
1.732193, 1.029967, 2.07051, 1, 1, 1, 1, 1,
1.733129, 0.749317, 1.093715, 1, 1, 1, 1, 1,
1.744252, -0.5212933, 1.402813, 1, 1, 1, 1, 1,
1.745262, -0.5562046, 1.322485, 1, 1, 1, 1, 1,
1.749791, -0.2502694, 2.237159, 1, 1, 1, 1, 1,
1.757865, 0.3504405, 1.373696, 1, 1, 1, 1, 1,
1.762519, 0.1290223, 3.619422, 0, 0, 1, 1, 1,
1.781932, -1.220803, 0.7877683, 1, 0, 0, 1, 1,
1.784061, -0.04273588, 2.453974, 1, 0, 0, 1, 1,
1.810876, 1.098351, 1.270533, 1, 0, 0, 1, 1,
1.847743, 0.6541599, 0.691021, 1, 0, 0, 1, 1,
1.869727, 1.369158, -0.1309687, 1, 0, 0, 1, 1,
1.877409, 1.902065, 0.7487439, 0, 0, 0, 1, 1,
1.899681, -1.673628, 2.446288, 0, 0, 0, 1, 1,
1.916263, -0.226088, 0.7862106, 0, 0, 0, 1, 1,
1.917559, -0.3607168, 1.184415, 0, 0, 0, 1, 1,
1.922563, -0.799403, 3.601254, 0, 0, 0, 1, 1,
1.947373, -1.056198, 2.015273, 0, 0, 0, 1, 1,
1.947526, 1.00397, 1.152639, 0, 0, 0, 1, 1,
1.95024, -0.928956, 0.2033045, 1, 1, 1, 1, 1,
1.96323, 0.6548768, 2.26711, 1, 1, 1, 1, 1,
1.969394, -0.472132, 2.943028, 1, 1, 1, 1, 1,
1.970042, 0.1617682, 0.007080146, 1, 1, 1, 1, 1,
1.993857, -0.9046325, 1.46128, 1, 1, 1, 1, 1,
2.035491, 1.254627, 0.5399205, 1, 1, 1, 1, 1,
2.060655, 0.9521514, 0.7522051, 1, 1, 1, 1, 1,
2.090446, 0.4481613, 1.723075, 1, 1, 1, 1, 1,
2.122701, -0.5437955, 2.301812, 1, 1, 1, 1, 1,
2.159198, 1.392455, -1.101083, 1, 1, 1, 1, 1,
2.19877, 1.58202, 2.055362, 1, 1, 1, 1, 1,
2.200053, 0.8093269, 0.4567354, 1, 1, 1, 1, 1,
2.201006, -1.137704, 1.059112, 1, 1, 1, 1, 1,
2.202466, -0.4490079, 1.929039, 1, 1, 1, 1, 1,
2.209952, -1.46854, 2.975977, 1, 1, 1, 1, 1,
2.230598, 0.4493971, 0.8517257, 0, 0, 1, 1, 1,
2.236495, -0.704059, 1.306294, 1, 0, 0, 1, 1,
2.247874, 0.7724097, 1.417848, 1, 0, 0, 1, 1,
2.272778, -0.7745945, 1.393661, 1, 0, 0, 1, 1,
2.282369, -0.7569389, 2.26261, 1, 0, 0, 1, 1,
2.302007, 0.3386168, 0.8612401, 1, 0, 0, 1, 1,
2.306469, 0.5259051, 0.4547189, 0, 0, 0, 1, 1,
2.320985, -1.164495, 1.31563, 0, 0, 0, 1, 1,
2.323024, 1.586829, 1.603956, 0, 0, 0, 1, 1,
2.357522, -0.5254895, 1.568706, 0, 0, 0, 1, 1,
2.380956, -0.8525524, 0.7822016, 0, 0, 0, 1, 1,
2.388978, 0.6472238, 3.088165, 0, 0, 0, 1, 1,
2.462277, 1.169807, 1.533386, 0, 0, 0, 1, 1,
2.528783, 0.682778, 1.700542, 1, 1, 1, 1, 1,
2.605872, 0.001748573, 2.336289, 1, 1, 1, 1, 1,
2.63449, 0.697321, 2.033026, 1, 1, 1, 1, 1,
2.649719, 1.115847, 1.350663, 1, 1, 1, 1, 1,
2.714326, -1.269724, 0.8780467, 1, 1, 1, 1, 1,
2.912133, -1.391156, 2.42361, 1, 1, 1, 1, 1,
3.845627, 1.869799, 0.3563268, 1, 1, 1, 1, 1
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
var radius = 9.781137;
var distance = 34.35583;
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
mvMatrix.translate( -0.3266468, -0.3061048, 0.2612228 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.35583);
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