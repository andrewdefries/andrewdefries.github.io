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
-3.423331, 0.2639611, -2.292736, 1, 0, 0, 1,
-2.566377, -0.1246772, -3.046829, 1, 0.007843138, 0, 1,
-2.514235, -1.311796, -2.782913, 1, 0.01176471, 0, 1,
-2.50299, -1.137314, -0.9644145, 1, 0.01960784, 0, 1,
-2.383212, 1.050722, -1.389396, 1, 0.02352941, 0, 1,
-2.378411, 0.9838671, -0.9783022, 1, 0.03137255, 0, 1,
-2.294776, -1.012733, -3.759866, 1, 0.03529412, 0, 1,
-2.275762, -0.6042978, -0.8225223, 1, 0.04313726, 0, 1,
-2.204149, -1.126888, -1.32874, 1, 0.04705882, 0, 1,
-2.162395, 2.294073, 0.7182105, 1, 0.05490196, 0, 1,
-2.132384, 1.042183, -0.9446908, 1, 0.05882353, 0, 1,
-2.115496, 1.517342, -1.308366, 1, 0.06666667, 0, 1,
-2.107033, -1.376572, -1.033966, 1, 0.07058824, 0, 1,
-2.092963, 1.079253, -1.22898, 1, 0.07843138, 0, 1,
-2.070111, 0.8204901, -0.8038541, 1, 0.08235294, 0, 1,
-2.04634, -0.7591116, -1.408378, 1, 0.09019608, 0, 1,
-2.037911, -0.297176, -3.285024, 1, 0.09411765, 0, 1,
-2.028626, -1.072472, -3.76698, 1, 0.1019608, 0, 1,
-2.021808, 0.1695244, -1.660967, 1, 0.1098039, 0, 1,
-1.984141, 0.8725889, -1.129087, 1, 0.1137255, 0, 1,
-1.960159, 1.272237, -2.192155, 1, 0.1215686, 0, 1,
-1.944591, -0.7778545, -1.529788, 1, 0.1254902, 0, 1,
-1.891334, -0.458392, -1.1473, 1, 0.1333333, 0, 1,
-1.876672, -0.4901919, -3.161379, 1, 0.1372549, 0, 1,
-1.854644, 1.162802, -0.6846451, 1, 0.145098, 0, 1,
-1.840079, 1.069577, -0.8481462, 1, 0.1490196, 0, 1,
-1.82957, 0.5289293, -1.737698, 1, 0.1568628, 0, 1,
-1.826817, -1.396654, -2.379053, 1, 0.1607843, 0, 1,
-1.823631, 0.6995751, -0.4749023, 1, 0.1686275, 0, 1,
-1.818869, -1.265789, -2.883979, 1, 0.172549, 0, 1,
-1.81366, -0.7192468, -1.97673, 1, 0.1803922, 0, 1,
-1.81351, -1.424253, -2.489792, 1, 0.1843137, 0, 1,
-1.797652, -1.144289, 0.1048961, 1, 0.1921569, 0, 1,
-1.783758, -1.083103, -2.342782, 1, 0.1960784, 0, 1,
-1.777235, -1.40509, -1.630675, 1, 0.2039216, 0, 1,
-1.765919, 0.7654278, -1.526104, 1, 0.2117647, 0, 1,
-1.758896, -0.008320091, -1.26845, 1, 0.2156863, 0, 1,
-1.757077, -0.2883214, 0.2039453, 1, 0.2235294, 0, 1,
-1.751314, 0.3078096, -1.505393, 1, 0.227451, 0, 1,
-1.742274, -0.04178528, -1.489815, 1, 0.2352941, 0, 1,
-1.72798, -0.5110562, -2.69075, 1, 0.2392157, 0, 1,
-1.714376, -1.080458, -1.651973, 1, 0.2470588, 0, 1,
-1.712841, -0.2976066, -2.015188, 1, 0.2509804, 0, 1,
-1.69853, 1.103405, -1.013268, 1, 0.2588235, 0, 1,
-1.680789, -1.760875, -2.783684, 1, 0.2627451, 0, 1,
-1.671801, 0.007821596, -2.608875, 1, 0.2705882, 0, 1,
-1.669279, 1.840684, 0.09139927, 1, 0.2745098, 0, 1,
-1.655942, -0.3081168, -1.355037, 1, 0.282353, 0, 1,
-1.652851, -0.7813577, -1.302628, 1, 0.2862745, 0, 1,
-1.646847, -0.9602256, -1.585223, 1, 0.2941177, 0, 1,
-1.645878, 0.2897714, -0.05780054, 1, 0.3019608, 0, 1,
-1.64175, -1.507836, -1.976839, 1, 0.3058824, 0, 1,
-1.625127, 1.4655, -3.261062, 1, 0.3137255, 0, 1,
-1.581679, 3.42583, -0.9376628, 1, 0.3176471, 0, 1,
-1.578601, 1.44155, -1.462479, 1, 0.3254902, 0, 1,
-1.578556, -0.8573309, -2.790287, 1, 0.3294118, 0, 1,
-1.560453, 0.2691576, -2.616012, 1, 0.3372549, 0, 1,
-1.552692, 0.5408342, -0.3359595, 1, 0.3411765, 0, 1,
-1.545294, 2.408034, -0.584955, 1, 0.3490196, 0, 1,
-1.526504, 0.07445433, 0.2981644, 1, 0.3529412, 0, 1,
-1.524173, 0.06266135, 0.05140958, 1, 0.3607843, 0, 1,
-1.523291, 1.498213, -1.040878, 1, 0.3647059, 0, 1,
-1.518357, -2.492798, -4.321573, 1, 0.372549, 0, 1,
-1.513453, 1.900761, -1.414755, 1, 0.3764706, 0, 1,
-1.504524, -0.5845087, -0.7593571, 1, 0.3843137, 0, 1,
-1.502404, -0.3398546, -1.823849, 1, 0.3882353, 0, 1,
-1.500938, -0.1134062, -1.810868, 1, 0.3960784, 0, 1,
-1.500767, -1.036218, -2.19394, 1, 0.4039216, 0, 1,
-1.496481, -2.054034, -2.973062, 1, 0.4078431, 0, 1,
-1.495739, -0.2783749, -2.222857, 1, 0.4156863, 0, 1,
-1.492332, -0.3650492, -2.499036, 1, 0.4196078, 0, 1,
-1.490821, 0.04635729, -3.629261, 1, 0.427451, 0, 1,
-1.482636, -0.5162612, -2.634438, 1, 0.4313726, 0, 1,
-1.481964, -0.6817384, -2.180054, 1, 0.4392157, 0, 1,
-1.48087, -1.163232, -1.638026, 1, 0.4431373, 0, 1,
-1.480605, 1.363573, -0.6379848, 1, 0.4509804, 0, 1,
-1.479358, -0.1092944, -1.652369, 1, 0.454902, 0, 1,
-1.461087, -0.6982395, -2.754965, 1, 0.4627451, 0, 1,
-1.460208, 1.219161, -1.768399, 1, 0.4666667, 0, 1,
-1.456137, -1.717176, -2.005126, 1, 0.4745098, 0, 1,
-1.450648, 0.3576698, -0.7227011, 1, 0.4784314, 0, 1,
-1.449042, 1.372751, -1.364561, 1, 0.4862745, 0, 1,
-1.442074, 1.411762, -1.794598, 1, 0.4901961, 0, 1,
-1.434619, -0.9597976, -2.925718, 1, 0.4980392, 0, 1,
-1.431029, -0.5923989, -1.32081, 1, 0.5058824, 0, 1,
-1.420625, -0.311581, -1.900014, 1, 0.509804, 0, 1,
-1.404625, 0.04482658, -1.993821, 1, 0.5176471, 0, 1,
-1.403226, -0.6312834, -1.117359, 1, 0.5215687, 0, 1,
-1.401591, -2.421235, -3.261738, 1, 0.5294118, 0, 1,
-1.399389, -0.1528351, -0.9223102, 1, 0.5333334, 0, 1,
-1.392177, -0.9369607, -1.562966, 1, 0.5411765, 0, 1,
-1.390889, -2.908123, -4.707488, 1, 0.5450981, 0, 1,
-1.381719, 0.02408076, -1.429813, 1, 0.5529412, 0, 1,
-1.381708, 0.2876104, -1.455774, 1, 0.5568628, 0, 1,
-1.373691, 1.678766, 0.7270166, 1, 0.5647059, 0, 1,
-1.366604, -1.179422, -2.642318, 1, 0.5686275, 0, 1,
-1.363517, -0.6142938, -0.5083206, 1, 0.5764706, 0, 1,
-1.354383, 0.2000202, -1.599768, 1, 0.5803922, 0, 1,
-1.353546, 1.189952, 0.05444658, 1, 0.5882353, 0, 1,
-1.352264, 1.233883, -0.1671173, 1, 0.5921569, 0, 1,
-1.345167, 0.3694805, -0.3874976, 1, 0.6, 0, 1,
-1.342848, 0.3393498, -0.6267424, 1, 0.6078432, 0, 1,
-1.342431, 0.09515544, -1.929703, 1, 0.6117647, 0, 1,
-1.341673, 1.098778, -0.7233524, 1, 0.6196079, 0, 1,
-1.337994, -0.3606904, -4.700327, 1, 0.6235294, 0, 1,
-1.337275, 1.12073, -1.989717, 1, 0.6313726, 0, 1,
-1.330281, -0.1711602, -0.4631864, 1, 0.6352941, 0, 1,
-1.326738, 1.595622, -0.1454687, 1, 0.6431373, 0, 1,
-1.313874, 1.906013, 0.1842963, 1, 0.6470588, 0, 1,
-1.312923, 1.675664, -1.61663, 1, 0.654902, 0, 1,
-1.312466, -1.501086, -1.74441, 1, 0.6588235, 0, 1,
-1.312414, 0.5263273, -2.567695, 1, 0.6666667, 0, 1,
-1.31043, 0.188974, -1.918314, 1, 0.6705883, 0, 1,
-1.288417, 0.3834893, -1.493286, 1, 0.6784314, 0, 1,
-1.287851, 0.4532121, -2.606483, 1, 0.682353, 0, 1,
-1.268157, -0.4215386, -3.059018, 1, 0.6901961, 0, 1,
-1.26614, 0.2424446, -1.338269, 1, 0.6941177, 0, 1,
-1.265972, 1.295957, 0.7242384, 1, 0.7019608, 0, 1,
-1.265038, -0.0397007, -1.874309, 1, 0.7098039, 0, 1,
-1.254293, 0.3538378, -2.711668, 1, 0.7137255, 0, 1,
-1.248935, -0.8429105, -1.802217, 1, 0.7215686, 0, 1,
-1.243688, 1.59688, -0.3618149, 1, 0.7254902, 0, 1,
-1.240978, -0.3109705, -0.2762002, 1, 0.7333333, 0, 1,
-1.23264, 1.640818, -1.139076, 1, 0.7372549, 0, 1,
-1.225533, 0.7554386, -1.514143, 1, 0.7450981, 0, 1,
-1.216262, 0.4316829, -2.05045, 1, 0.7490196, 0, 1,
-1.212566, 0.3426313, -0.18041, 1, 0.7568628, 0, 1,
-1.205814, 1.370401, 1.389176, 1, 0.7607843, 0, 1,
-1.187392, -0.162315, -1.703987, 1, 0.7686275, 0, 1,
-1.186904, 2.315921, -0.01613627, 1, 0.772549, 0, 1,
-1.185208, 0.439429, -1.203808, 1, 0.7803922, 0, 1,
-1.184148, -3.535498, -4.665392, 1, 0.7843137, 0, 1,
-1.181271, -1.069824, -2.923897, 1, 0.7921569, 0, 1,
-1.173151, 0.323072, -1.281186, 1, 0.7960784, 0, 1,
-1.169023, -0.645335, -2.361811, 1, 0.8039216, 0, 1,
-1.157448, 0.1731965, -2.104215, 1, 0.8117647, 0, 1,
-1.14473, -0.02216597, -1.673797, 1, 0.8156863, 0, 1,
-1.138003, -0.8011372, -1.476221, 1, 0.8235294, 0, 1,
-1.131061, 0.219523, -2.358388, 1, 0.827451, 0, 1,
-1.129931, 0.8445868, -0.4479891, 1, 0.8352941, 0, 1,
-1.127043, -1.413122, -1.514916, 1, 0.8392157, 0, 1,
-1.124286, 0.7073538, -0.3374751, 1, 0.8470588, 0, 1,
-1.122204, -1.003256, -2.340679, 1, 0.8509804, 0, 1,
-1.121777, -0.3052831, -1.903693, 1, 0.8588235, 0, 1,
-1.119197, 0.6174798, -1.358164, 1, 0.8627451, 0, 1,
-1.118991, 0.1506052, -1.921442, 1, 0.8705882, 0, 1,
-1.114969, 0.529175, 0.5320742, 1, 0.8745098, 0, 1,
-1.111033, -2.013001, -3.954684, 1, 0.8823529, 0, 1,
-1.10749, 2.638015, -1.479756, 1, 0.8862745, 0, 1,
-1.103749, -0.9592747, -1.934944, 1, 0.8941177, 0, 1,
-1.095787, 0.3342678, 0.06240092, 1, 0.8980392, 0, 1,
-1.095496, 0.4822634, -2.083641, 1, 0.9058824, 0, 1,
-1.093835, -0.4230658, -3.370283, 1, 0.9137255, 0, 1,
-1.091162, -2.837035, -2.043545, 1, 0.9176471, 0, 1,
-1.081245, 0.0440477, -2.669059, 1, 0.9254902, 0, 1,
-1.080678, -0.5320941, -2.169097, 1, 0.9294118, 0, 1,
-1.056243, 2.906416, -1.39359, 1, 0.9372549, 0, 1,
-1.042976, 0.9695995, -1.081629, 1, 0.9411765, 0, 1,
-1.037578, -0.9269696, -3.312719, 1, 0.9490196, 0, 1,
-1.036402, -0.4639162, -2.968629, 1, 0.9529412, 0, 1,
-1.031915, -0.6766617, -2.743078, 1, 0.9607843, 0, 1,
-1.024952, -1.8327, -3.478246, 1, 0.9647059, 0, 1,
-1.020394, -0.2792151, -0.9519166, 1, 0.972549, 0, 1,
-1.016603, -1.458104, -2.452292, 1, 0.9764706, 0, 1,
-1.015989, -1.14211, -1.374645, 1, 0.9843137, 0, 1,
-1.00981, 0.8873426, 0.2999031, 1, 0.9882353, 0, 1,
-1.008951, 0.03896988, -0.07777974, 1, 0.9960784, 0, 1,
-0.9974433, 0.4748476, -1.674855, 0.9960784, 1, 0, 1,
-0.9972876, -0.4423114, -1.277656, 0.9921569, 1, 0, 1,
-0.995214, -0.4093243, -3.655117, 0.9843137, 1, 0, 1,
-0.9917408, -0.1320987, -2.13058, 0.9803922, 1, 0, 1,
-0.9898617, -0.5367498, -3.116057, 0.972549, 1, 0, 1,
-0.9829579, 0.4839715, 0.0754979, 0.9686275, 1, 0, 1,
-0.9719737, 0.5495992, -2.369516, 0.9607843, 1, 0, 1,
-0.9675384, 1.090359, -1.707065, 0.9568627, 1, 0, 1,
-0.9518947, -0.01352696, -0.4030616, 0.9490196, 1, 0, 1,
-0.9369038, -2.642486, -1.854806, 0.945098, 1, 0, 1,
-0.9367511, 0.5918833, -0.8491529, 0.9372549, 1, 0, 1,
-0.9319713, -0.09108127, -1.67985, 0.9333333, 1, 0, 1,
-0.9312718, 0.8088252, 0.03775787, 0.9254902, 1, 0, 1,
-0.9312654, -0.03693117, -2.124078, 0.9215686, 1, 0, 1,
-0.9233336, 0.7787336, -2.267843, 0.9137255, 1, 0, 1,
-0.922492, -0.8669545, -2.998602, 0.9098039, 1, 0, 1,
-0.921779, 0.7861644, -1.223213, 0.9019608, 1, 0, 1,
-0.9187221, 0.3036464, -1.720746, 0.8941177, 1, 0, 1,
-0.9127772, 0.1593233, -1.361151, 0.8901961, 1, 0, 1,
-0.9031749, -1.006333, -1.686979, 0.8823529, 1, 0, 1,
-0.8990837, -1.034249, -1.981015, 0.8784314, 1, 0, 1,
-0.895671, -0.3464602, -0.7306231, 0.8705882, 1, 0, 1,
-0.8929276, 0.9388773, -1.778819, 0.8666667, 1, 0, 1,
-0.8886288, 1.633563, -0.9741631, 0.8588235, 1, 0, 1,
-0.8805431, -1.159587, -3.082249, 0.854902, 1, 0, 1,
-0.8722692, 0.6045673, -0.5034623, 0.8470588, 1, 0, 1,
-0.8711799, -0.397251, -1.118376, 0.8431373, 1, 0, 1,
-0.8684876, -0.1392923, -1.178427, 0.8352941, 1, 0, 1,
-0.8651924, -0.5082304, -2.316477, 0.8313726, 1, 0, 1,
-0.8630149, -1.242536, -2.734833, 0.8235294, 1, 0, 1,
-0.8613318, -2.035905, -3.296808, 0.8196079, 1, 0, 1,
-0.8612023, -1.60588, -2.962271, 0.8117647, 1, 0, 1,
-0.8584683, -0.5243325, -2.816262, 0.8078431, 1, 0, 1,
-0.8536268, -0.1185551, -3.031553, 0.8, 1, 0, 1,
-0.8510997, 1.67539, 1.052281, 0.7921569, 1, 0, 1,
-0.8490887, 0.6611599, -0.3677135, 0.7882353, 1, 0, 1,
-0.8418284, -0.4173889, -2.475399, 0.7803922, 1, 0, 1,
-0.8403445, -0.1584042, -0.2264919, 0.7764706, 1, 0, 1,
-0.8343966, 2.425397, -0.5323379, 0.7686275, 1, 0, 1,
-0.8295668, -1.42663, -4.969258, 0.7647059, 1, 0, 1,
-0.8248985, -0.1494527, -0.8563093, 0.7568628, 1, 0, 1,
-0.8233073, 0.2884065, -2.111758, 0.7529412, 1, 0, 1,
-0.8216578, -0.2466279, -1.726106, 0.7450981, 1, 0, 1,
-0.8203731, -1.479368, -2.489989, 0.7411765, 1, 0, 1,
-0.8142948, 0.4525644, -1.890057, 0.7333333, 1, 0, 1,
-0.8123415, -0.4199688, -2.65541, 0.7294118, 1, 0, 1,
-0.8107556, -0.9030625, -1.898849, 0.7215686, 1, 0, 1,
-0.8029678, 0.612695, -1.031728, 0.7176471, 1, 0, 1,
-0.8025813, 0.7811585, -0.3507958, 0.7098039, 1, 0, 1,
-0.7979439, -0.5489482, -3.755476, 0.7058824, 1, 0, 1,
-0.7979327, -1.346011, -0.4218343, 0.6980392, 1, 0, 1,
-0.7951806, 1.635612, 0.05572221, 0.6901961, 1, 0, 1,
-0.7891719, 0.6546947, -1.968697, 0.6862745, 1, 0, 1,
-0.788641, -0.7918559, -2.340094, 0.6784314, 1, 0, 1,
-0.788416, -1.031796, -2.850224, 0.6745098, 1, 0, 1,
-0.7810265, -1.404275, -1.830134, 0.6666667, 1, 0, 1,
-0.7785466, 0.2818382, -0.6372162, 0.6627451, 1, 0, 1,
-0.7780907, 1.110621, -1.678033, 0.654902, 1, 0, 1,
-0.7745119, -0.05370118, -0.1914097, 0.6509804, 1, 0, 1,
-0.7733631, -1.057446, -2.869085, 0.6431373, 1, 0, 1,
-0.7695016, -0.960162, -0.8636506, 0.6392157, 1, 0, 1,
-0.7687183, 0.5310245, -1.876817, 0.6313726, 1, 0, 1,
-0.7670017, 1.845931, -0.4832947, 0.627451, 1, 0, 1,
-0.7668849, 0.2566478, -2.095506, 0.6196079, 1, 0, 1,
-0.7654097, 1.125365, -0.135054, 0.6156863, 1, 0, 1,
-0.7643419, 0.3351577, -1.342296, 0.6078432, 1, 0, 1,
-0.7619919, 1.442295, -1.068779, 0.6039216, 1, 0, 1,
-0.7472576, -1.563897, -3.298963, 0.5960785, 1, 0, 1,
-0.7440128, 0.7068255, -1.33125, 0.5882353, 1, 0, 1,
-0.7405995, 0.7211065, 0.8712233, 0.5843138, 1, 0, 1,
-0.7353141, 1.267625, -2.091162, 0.5764706, 1, 0, 1,
-0.7346839, 1.155961, -0.6965492, 0.572549, 1, 0, 1,
-0.7340147, 0.9352232, 0.08303221, 0.5647059, 1, 0, 1,
-0.7326467, -0.4704171, -2.050575, 0.5607843, 1, 0, 1,
-0.7315704, -1.776057, -2.518757, 0.5529412, 1, 0, 1,
-0.7314172, -2.346759, -1.835876, 0.5490196, 1, 0, 1,
-0.7293355, 0.6962163, -1.364188, 0.5411765, 1, 0, 1,
-0.7282369, 0.1282216, -3.027006, 0.5372549, 1, 0, 1,
-0.718329, 0.3341416, -2.153126, 0.5294118, 1, 0, 1,
-0.7144735, 0.0945364, -0.8104895, 0.5254902, 1, 0, 1,
-0.7131115, 0.4495233, -0.8638908, 0.5176471, 1, 0, 1,
-0.712202, -0.1980171, -1.761309, 0.5137255, 1, 0, 1,
-0.7109929, -1.358942, -2.524905, 0.5058824, 1, 0, 1,
-0.7103257, 1.179277, -0.8586069, 0.5019608, 1, 0, 1,
-0.7056001, -0.0503332, -0.1487971, 0.4941176, 1, 0, 1,
-0.703747, 0.7869481, -1.702118, 0.4862745, 1, 0, 1,
-0.6973783, -0.2673539, -4.153204, 0.4823529, 1, 0, 1,
-0.6933452, 1.158733, 0.1166112, 0.4745098, 1, 0, 1,
-0.691615, 0.5342672, -1.285062, 0.4705882, 1, 0, 1,
-0.6899231, 1.136592, 0.1417162, 0.4627451, 1, 0, 1,
-0.6721269, -0.4152228, -2.454621, 0.4588235, 1, 0, 1,
-0.6669139, -0.3950492, -3.644967, 0.4509804, 1, 0, 1,
-0.6665173, -1.062321, -2.782596, 0.4470588, 1, 0, 1,
-0.6590413, 1.943473, -0.6621888, 0.4392157, 1, 0, 1,
-0.6584499, 1.521407, 0.7314249, 0.4352941, 1, 0, 1,
-0.6546623, -0.447097, -2.293769, 0.427451, 1, 0, 1,
-0.6545339, -0.03698308, -1.058581, 0.4235294, 1, 0, 1,
-0.648999, 0.2483992, -2.096367, 0.4156863, 1, 0, 1,
-0.6443678, -0.7708521, -2.445675, 0.4117647, 1, 0, 1,
-0.6434777, -0.8703924, -2.130097, 0.4039216, 1, 0, 1,
-0.6398572, 0.3995084, -1.559456, 0.3960784, 1, 0, 1,
-0.6360303, -0.3967912, -2.649688, 0.3921569, 1, 0, 1,
-0.6326288, -0.05714018, -2.271737, 0.3843137, 1, 0, 1,
-0.632395, -1.425799, -2.308193, 0.3803922, 1, 0, 1,
-0.631314, -1.386588, -3.857664, 0.372549, 1, 0, 1,
-0.6309311, -0.7039853, -1.677851, 0.3686275, 1, 0, 1,
-0.6307573, -1.05499, -3.433023, 0.3607843, 1, 0, 1,
-0.6303667, 0.5048854, 0.3581778, 0.3568628, 1, 0, 1,
-0.6197305, 0.6983756, 0.1850713, 0.3490196, 1, 0, 1,
-0.6179692, 1.53065, -0.06114927, 0.345098, 1, 0, 1,
-0.614772, 1.134843, -2.062043, 0.3372549, 1, 0, 1,
-0.6089913, 1.148276, -0.1033247, 0.3333333, 1, 0, 1,
-0.605283, -0.6278862, -3.108284, 0.3254902, 1, 0, 1,
-0.6042415, -1.257512, -1.223467, 0.3215686, 1, 0, 1,
-0.603394, -0.7057045, -2.168198, 0.3137255, 1, 0, 1,
-0.6022042, 0.7216082, 1.54456, 0.3098039, 1, 0, 1,
-0.5994233, 1.482285, -0.4580227, 0.3019608, 1, 0, 1,
-0.597136, 0.3895259, 0.2893812, 0.2941177, 1, 0, 1,
-0.5931087, 0.5694382, -1.27176, 0.2901961, 1, 0, 1,
-0.5919718, 2.100717, -0.2399628, 0.282353, 1, 0, 1,
-0.5915856, 0.07498039, -0.8769729, 0.2784314, 1, 0, 1,
-0.5915791, 0.1898078, -1.392511, 0.2705882, 1, 0, 1,
-0.5914729, -0.05578401, -0.9245304, 0.2666667, 1, 0, 1,
-0.5865771, -0.07924073, -1.493857, 0.2588235, 1, 0, 1,
-0.5846108, -0.1599485, -2.086803, 0.254902, 1, 0, 1,
-0.5832657, 0.6189376, -2.177314, 0.2470588, 1, 0, 1,
-0.5827553, 1.172724, -0.1841537, 0.2431373, 1, 0, 1,
-0.5814992, 0.0338123, -1.442245, 0.2352941, 1, 0, 1,
-0.5788606, -0.3152927, -1.527219, 0.2313726, 1, 0, 1,
-0.5772821, 0.4978134, -0.7809041, 0.2235294, 1, 0, 1,
-0.5742173, -0.4300314, -2.614754, 0.2196078, 1, 0, 1,
-0.57299, -1.186406, -2.843453, 0.2117647, 1, 0, 1,
-0.5705839, -0.2617725, -2.266142, 0.2078431, 1, 0, 1,
-0.5621582, 0.5713519, -1.453063, 0.2, 1, 0, 1,
-0.5541314, 1.2891, -0.04595338, 0.1921569, 1, 0, 1,
-0.5535586, 1.524001, -2.66634, 0.1882353, 1, 0, 1,
-0.5500071, -0.9206194, -3.574955, 0.1803922, 1, 0, 1,
-0.5473962, 1.322652, -0.1754443, 0.1764706, 1, 0, 1,
-0.5453762, -2.018824, -3.348383, 0.1686275, 1, 0, 1,
-0.5448134, 0.2192133, -2.213131, 0.1647059, 1, 0, 1,
-0.5436718, 1.174227, -0.5920652, 0.1568628, 1, 0, 1,
-0.5405789, 0.4655767, -1.747814, 0.1529412, 1, 0, 1,
-0.5404218, 0.4056831, -2.32907, 0.145098, 1, 0, 1,
-0.5394266, 0.1410859, 0.7306978, 0.1411765, 1, 0, 1,
-0.5269023, 1.155636, -0.3764234, 0.1333333, 1, 0, 1,
-0.5243188, 0.7207772, -0.9528711, 0.1294118, 1, 0, 1,
-0.5096187, 0.2806221, 0.8306439, 0.1215686, 1, 0, 1,
-0.5056271, 1.228921, -0.1189329, 0.1176471, 1, 0, 1,
-0.5048516, -0.6230112, -3.558499, 0.1098039, 1, 0, 1,
-0.5007352, 0.4668449, -0.1556067, 0.1058824, 1, 0, 1,
-0.4991153, -0.284551, -1.462975, 0.09803922, 1, 0, 1,
-0.4982343, 0.5993468, -0.9061626, 0.09019608, 1, 0, 1,
-0.497888, -1.09904, -1.37173, 0.08627451, 1, 0, 1,
-0.4971937, 0.2044057, -1.483805, 0.07843138, 1, 0, 1,
-0.4958681, -0.5881965, -2.721904, 0.07450981, 1, 0, 1,
-0.4921454, -0.5585686, -2.722371, 0.06666667, 1, 0, 1,
-0.4877689, 0.1564577, -2.405515, 0.0627451, 1, 0, 1,
-0.4804067, -0.4298482, -3.401624, 0.05490196, 1, 0, 1,
-0.4796944, 0.9301671, 0.01724829, 0.05098039, 1, 0, 1,
-0.4758971, -0.482857, -2.66095, 0.04313726, 1, 0, 1,
-0.4749624, 0.4843005, -1.482525, 0.03921569, 1, 0, 1,
-0.4648603, 1.7832, 0.8158906, 0.03137255, 1, 0, 1,
-0.4617646, -0.9236514, -1.543757, 0.02745098, 1, 0, 1,
-0.461244, -0.9331185, -3.479138, 0.01960784, 1, 0, 1,
-0.4577279, 0.3007872, -1.287873, 0.01568628, 1, 0, 1,
-0.4552465, 0.2880097, -1.979133, 0.007843138, 1, 0, 1,
-0.4540088, 1.122176, -0.9968441, 0.003921569, 1, 0, 1,
-0.4532966, 0.8459777, 0.8487727, 0, 1, 0.003921569, 1,
-0.446836, 0.1803253, -1.087145, 0, 1, 0.01176471, 1,
-0.4466335, -0.3922511, -1.18618, 0, 1, 0.01568628, 1,
-0.4442858, -0.3047541, -3.572121, 0, 1, 0.02352941, 1,
-0.4435816, -0.809674, -3.880933, 0, 1, 0.02745098, 1,
-0.4422619, -0.9430484, -3.495504, 0, 1, 0.03529412, 1,
-0.4403129, 1.781033, -0.690558, 0, 1, 0.03921569, 1,
-0.4341576, -2.826054, -2.439489, 0, 1, 0.04705882, 1,
-0.4338881, 1.148205, -1.225797, 0, 1, 0.05098039, 1,
-0.428624, -2.087522, -3.064003, 0, 1, 0.05882353, 1,
-0.4259249, -1.820264, -2.658548, 0, 1, 0.0627451, 1,
-0.4236336, -1.298291, -3.035252, 0, 1, 0.07058824, 1,
-0.4214396, 0.1013432, -1.318807, 0, 1, 0.07450981, 1,
-0.4202689, 0.4994639, -0.9055216, 0, 1, 0.08235294, 1,
-0.4149441, -0.3561019, -2.674588, 0, 1, 0.08627451, 1,
-0.4122341, 1.858316, 1.793652, 0, 1, 0.09411765, 1,
-0.4080833, 0.257716, -0.9253636, 0, 1, 0.1019608, 1,
-0.4025853, -0.4805115, -1.590029, 0, 1, 0.1058824, 1,
-0.3946671, -0.3444269, -3.250226, 0, 1, 0.1137255, 1,
-0.3935572, -0.0715609, -0.4733118, 0, 1, 0.1176471, 1,
-0.3924491, 0.1035192, -1.548381, 0, 1, 0.1254902, 1,
-0.3913463, 0.7912269, -1.633553, 0, 1, 0.1294118, 1,
-0.3910922, 0.3067076, -2.301232, 0, 1, 0.1372549, 1,
-0.3909431, -0.2723632, -2.8211, 0, 1, 0.1411765, 1,
-0.3886127, -1.623182, -3.353494, 0, 1, 0.1490196, 1,
-0.385782, 0.5732295, -0.8723338, 0, 1, 0.1529412, 1,
-0.3805149, 0.4350488, -0.5417643, 0, 1, 0.1607843, 1,
-0.3759016, 0.4519268, -0.5872833, 0, 1, 0.1647059, 1,
-0.3757954, -0.06757169, -2.268179, 0, 1, 0.172549, 1,
-0.3734213, 2.201645, 1.768726, 0, 1, 0.1764706, 1,
-0.3712825, 0.1094319, -2.761049, 0, 1, 0.1843137, 1,
-0.3709567, 2.019232, -0.2467997, 0, 1, 0.1882353, 1,
-0.3685472, -0.5904611, -2.409428, 0, 1, 0.1960784, 1,
-0.3670627, -1.090738, -1.580875, 0, 1, 0.2039216, 1,
-0.3641647, 0.6175546, -1.313549, 0, 1, 0.2078431, 1,
-0.3641115, 2.218816, 1.220441, 0, 1, 0.2156863, 1,
-0.3637914, 0.1055436, 0.4482768, 0, 1, 0.2196078, 1,
-0.3627693, 0.02367371, -0.9094084, 0, 1, 0.227451, 1,
-0.3611215, -0.1587808, -1.302648, 0, 1, 0.2313726, 1,
-0.3602979, 1.044424, 0.4757629, 0, 1, 0.2392157, 1,
-0.3599716, -0.1483294, -0.4427291, 0, 1, 0.2431373, 1,
-0.3528972, -1.15857, -3.660543, 0, 1, 0.2509804, 1,
-0.3511429, -0.65518, -2.805521, 0, 1, 0.254902, 1,
-0.3494534, 0.4462089, -0.7035536, 0, 1, 0.2627451, 1,
-0.3480166, 0.5718175, -0.8918568, 0, 1, 0.2666667, 1,
-0.3451619, -0.4184146, -1.954511, 0, 1, 0.2745098, 1,
-0.342384, 0.5620826, -0.643438, 0, 1, 0.2784314, 1,
-0.3379544, -0.3363286, -1.590493, 0, 1, 0.2862745, 1,
-0.3212415, -0.9292749, -3.98979, 0, 1, 0.2901961, 1,
-0.3189723, -0.7022941, -3.867967, 0, 1, 0.2980392, 1,
-0.3150422, -0.192509, -0.1974886, 0, 1, 0.3058824, 1,
-0.3148027, -0.5770078, -3.188027, 0, 1, 0.3098039, 1,
-0.3067459, -0.3335989, -3.097777, 0, 1, 0.3176471, 1,
-0.3024285, -2.949654, -2.899168, 0, 1, 0.3215686, 1,
-0.3006666, -0.2348786, -0.5250112, 0, 1, 0.3294118, 1,
-0.3003945, -0.9947095, -2.995018, 0, 1, 0.3333333, 1,
-0.2908702, 0.427917, -2.04776, 0, 1, 0.3411765, 1,
-0.290641, -0.1301011, -2.411769, 0, 1, 0.345098, 1,
-0.2889925, -0.06474002, -1.003589, 0, 1, 0.3529412, 1,
-0.2875232, -0.6691498, -2.781231, 0, 1, 0.3568628, 1,
-0.2863826, -0.7724895, -3.864087, 0, 1, 0.3647059, 1,
-0.283137, 0.8609744, 0.9597769, 0, 1, 0.3686275, 1,
-0.2822409, 2.617036, -0.4901671, 0, 1, 0.3764706, 1,
-0.2766578, 1.307038, -1.329922, 0, 1, 0.3803922, 1,
-0.2752765, -1.861817, -2.568879, 0, 1, 0.3882353, 1,
-0.2749956, -0.3123639, -2.952492, 0, 1, 0.3921569, 1,
-0.2708452, 0.4094231, -1.288017, 0, 1, 0.4, 1,
-0.2657101, 0.1195422, 0.1592161, 0, 1, 0.4078431, 1,
-0.2629446, 0.4612683, -0.7342138, 0, 1, 0.4117647, 1,
-0.260493, -0.544445, -4.397251, 0, 1, 0.4196078, 1,
-0.2601683, 0.9912545, -1.838537, 0, 1, 0.4235294, 1,
-0.2573237, 0.6444441, 0.5057302, 0, 1, 0.4313726, 1,
-0.2555423, 1.061167, -0.4189709, 0, 1, 0.4352941, 1,
-0.2528268, -0.2951937, -2.780901, 0, 1, 0.4431373, 1,
-0.2450841, -0.2149578, -2.134067, 0, 1, 0.4470588, 1,
-0.2445266, 0.5022889, 0.6526501, 0, 1, 0.454902, 1,
-0.2374469, -0.1709962, -1.46395, 0, 1, 0.4588235, 1,
-0.234218, -0.6728312, -2.134698, 0, 1, 0.4666667, 1,
-0.2309851, 0.0457476, -3.079864, 0, 1, 0.4705882, 1,
-0.2301523, 0.1309537, -1.817538, 0, 1, 0.4784314, 1,
-0.227413, 0.7921636, -1.396535, 0, 1, 0.4823529, 1,
-0.2234195, -0.4222803, -4.455225, 0, 1, 0.4901961, 1,
-0.2199959, -0.08988201, -2.250097, 0, 1, 0.4941176, 1,
-0.2120139, 0.7057689, -0.3085667, 0, 1, 0.5019608, 1,
-0.2114479, -0.02885486, -1.007856, 0, 1, 0.509804, 1,
-0.2104109, 0.8754269, -0.1623514, 0, 1, 0.5137255, 1,
-0.2078846, -0.2590835, -2.600701, 0, 1, 0.5215687, 1,
-0.2078653, -0.3659961, -2.621775, 0, 1, 0.5254902, 1,
-0.2077655, -0.114092, -2.435986, 0, 1, 0.5333334, 1,
-0.2072202, 0.6610954, 0.965355, 0, 1, 0.5372549, 1,
-0.2071242, -0.05669158, -1.799164, 0, 1, 0.5450981, 1,
-0.2060214, -0.6123705, -2.95663, 0, 1, 0.5490196, 1,
-0.2018314, -1.524623, -1.230944, 0, 1, 0.5568628, 1,
-0.1934479, -0.6128505, -5.007397, 0, 1, 0.5607843, 1,
-0.1911871, 1.048054, -0.2174844, 0, 1, 0.5686275, 1,
-0.1883866, 0.119762, -2.127793, 0, 1, 0.572549, 1,
-0.1870556, -0.2666584, -3.441031, 0, 1, 0.5803922, 1,
-0.1792619, -0.6041055, -2.677404, 0, 1, 0.5843138, 1,
-0.1775226, -0.2263368, -3.593027, 0, 1, 0.5921569, 1,
-0.1767575, -2.075076, -1.795423, 0, 1, 0.5960785, 1,
-0.1751073, -0.07136616, -2.678575, 0, 1, 0.6039216, 1,
-0.1748992, -0.0653372, -2.347929, 0, 1, 0.6117647, 1,
-0.1712975, -1.464564, -1.721727, 0, 1, 0.6156863, 1,
-0.1708296, 0.8442042, -0.001231858, 0, 1, 0.6235294, 1,
-0.1684203, -0.280356, -1.499426, 0, 1, 0.627451, 1,
-0.1679577, 0.04815109, 0.05909244, 0, 1, 0.6352941, 1,
-0.1652069, 0.6495469, -1.700888, 0, 1, 0.6392157, 1,
-0.1631469, 1.292634, -1.254244, 0, 1, 0.6470588, 1,
-0.1623378, -2.046372, -2.117888, 0, 1, 0.6509804, 1,
-0.1589173, -1.721702, -3.322047, 0, 1, 0.6588235, 1,
-0.1588939, -0.9138739, -2.578106, 0, 1, 0.6627451, 1,
-0.1583668, 1.099146, -1.853609, 0, 1, 0.6705883, 1,
-0.1573191, -0.3391787, -2.268343, 0, 1, 0.6745098, 1,
-0.1565956, 0.5821757, -0.729187, 0, 1, 0.682353, 1,
-0.1530833, -0.1256542, -3.249858, 0, 1, 0.6862745, 1,
-0.152289, 1.022551, 0.1638429, 0, 1, 0.6941177, 1,
-0.1510183, -0.793362, -2.903705, 0, 1, 0.7019608, 1,
-0.1508518, 0.3589681, -2.141148, 0, 1, 0.7058824, 1,
-0.1507149, -0.7439857, -2.772098, 0, 1, 0.7137255, 1,
-0.1500859, -0.7434127, -2.580336, 0, 1, 0.7176471, 1,
-0.1469949, 0.2606834, 0.6472521, 0, 1, 0.7254902, 1,
-0.1451843, -1.918919, -3.248873, 0, 1, 0.7294118, 1,
-0.1447642, -0.7780483, -3.888046, 0, 1, 0.7372549, 1,
-0.1442285, 0.2778975, 1.166606, 0, 1, 0.7411765, 1,
-0.1411748, -0.0155621, -0.5034211, 0, 1, 0.7490196, 1,
-0.1389939, -3.519625, -3.479002, 0, 1, 0.7529412, 1,
-0.1374893, -0.5586679, -2.73972, 0, 1, 0.7607843, 1,
-0.1365751, -0.7757952, -4.951359, 0, 1, 0.7647059, 1,
-0.1359473, -0.309384, -2.770134, 0, 1, 0.772549, 1,
-0.1301041, 0.3407969, -1.236798, 0, 1, 0.7764706, 1,
-0.1273524, -1.553212, -1.302191, 0, 1, 0.7843137, 1,
-0.1263352, -1.755029, -2.79208, 0, 1, 0.7882353, 1,
-0.1262938, 0.902826, 1.130857, 0, 1, 0.7960784, 1,
-0.1229186, -0.5058274, -2.570445, 0, 1, 0.8039216, 1,
-0.1216129, 0.6780859, -0.0436172, 0, 1, 0.8078431, 1,
-0.1201809, 1.963119, -0.008204223, 0, 1, 0.8156863, 1,
-0.1199549, -0.2889844, -2.52228, 0, 1, 0.8196079, 1,
-0.119606, -0.1211306, -3.004238, 0, 1, 0.827451, 1,
-0.1120198, -1.024593, -4.734861, 0, 1, 0.8313726, 1,
-0.1086422, 1.019026, 0.2804226, 0, 1, 0.8392157, 1,
-0.1084756, 1.061296, -0.7307739, 0, 1, 0.8431373, 1,
-0.1082304, -0.4784712, -2.649791, 0, 1, 0.8509804, 1,
-0.1034026, -3.18686, -2.300797, 0, 1, 0.854902, 1,
-0.0990342, 0.3874949, 1.525308, 0, 1, 0.8627451, 1,
-0.09423248, -0.8126798, -3.513125, 0, 1, 0.8666667, 1,
-0.09356523, 0.9429784, -0.6932261, 0, 1, 0.8745098, 1,
-0.0907414, -1.102707, -2.773602, 0, 1, 0.8784314, 1,
-0.0904517, 0.1250567, -0.2734162, 0, 1, 0.8862745, 1,
-0.0869607, -0.5809195, -2.534214, 0, 1, 0.8901961, 1,
-0.08328546, 0.9908062, 0.4951985, 0, 1, 0.8980392, 1,
-0.08031319, -0.9231035, -3.644257, 0, 1, 0.9058824, 1,
-0.0790919, 0.5694558, -0.4018493, 0, 1, 0.9098039, 1,
-0.07761335, 0.8681775, -0.493955, 0, 1, 0.9176471, 1,
-0.07641149, 1.411854, -0.7469037, 0, 1, 0.9215686, 1,
-0.06556389, 0.7880087, 0.1367315, 0, 1, 0.9294118, 1,
-0.05774292, -0.2571463, -3.935389, 0, 1, 0.9333333, 1,
-0.057112, 1.258903, 1.24482, 0, 1, 0.9411765, 1,
-0.05441034, -0.4781163, -1.072024, 0, 1, 0.945098, 1,
-0.05354614, -0.9589554, -3.554123, 0, 1, 0.9529412, 1,
-0.05338225, 0.9032384, 2.062279, 0, 1, 0.9568627, 1,
-0.05025676, 0.6508503, 1.585972, 0, 1, 0.9647059, 1,
-0.04706018, -0.1798855, -2.427037, 0, 1, 0.9686275, 1,
-0.04672993, -1.6125, -3.224425, 0, 1, 0.9764706, 1,
-0.04584451, -0.2147869, -2.134195, 0, 1, 0.9803922, 1,
-0.0453809, 1.336018, -0.7037203, 0, 1, 0.9882353, 1,
-0.043786, -2.155921, -1.695941, 0, 1, 0.9921569, 1,
-0.04218522, 0.5197409, 2.004176, 0, 1, 1, 1,
-0.0410293, -0.6811718, -1.164844, 0, 0.9921569, 1, 1,
-0.04016125, -0.1474856, 0.1113807, 0, 0.9882353, 1, 1,
-0.03902832, -0.5085599, -3.069528, 0, 0.9803922, 1, 1,
-0.03727612, 0.2029897, 1.439524, 0, 0.9764706, 1, 1,
-0.03709622, -0.858156, -3.037979, 0, 0.9686275, 1, 1,
-0.03338256, -0.1503386, -1.153974, 0, 0.9647059, 1, 1,
-0.03298752, -0.6755467, -2.676067, 0, 0.9568627, 1, 1,
-0.03201435, 0.1373619, 0.2596488, 0, 0.9529412, 1, 1,
-0.03144777, 0.5801053, -0.4182852, 0, 0.945098, 1, 1,
-0.02996521, 1.38908, -0.5244546, 0, 0.9411765, 1, 1,
-0.0274457, -1.23744, -2.802144, 0, 0.9333333, 1, 1,
-0.0249605, 0.4333295, -1.227749, 0, 0.9294118, 1, 1,
-0.02321571, 0.2660187, 1.209277, 0, 0.9215686, 1, 1,
-0.02287137, 0.5429229, 0.9004915, 0, 0.9176471, 1, 1,
-0.01878906, 0.5469751, 0.648813, 0, 0.9098039, 1, 1,
-0.01559114, -0.9852464, -3.282402, 0, 0.9058824, 1, 1,
-0.01402385, -1.283705, -2.773278, 0, 0.8980392, 1, 1,
-0.01353576, 1.523462, -0.1882322, 0, 0.8901961, 1, 1,
-0.01043514, -0.1294044, -3.249544, 0, 0.8862745, 1, 1,
-0.004470225, -0.737453, -2.609831, 0, 0.8784314, 1, 1,
0.0003729743, -0.8035808, 3.534629, 0, 0.8745098, 1, 1,
0.004093741, 0.84284, -0.5433019, 0, 0.8666667, 1, 1,
0.00491671, 0.2614079, 0.9440245, 0, 0.8627451, 1, 1,
0.005363861, 0.8523681, -1.196313, 0, 0.854902, 1, 1,
0.005790221, 0.5088558, -1.366066, 0, 0.8509804, 1, 1,
0.00734164, 0.4139405, 0.1496071, 0, 0.8431373, 1, 1,
0.01079362, 0.160679, 0.9373821, 0, 0.8392157, 1, 1,
0.01462102, -1.980961, 1.550404, 0, 0.8313726, 1, 1,
0.01561998, 0.1255008, 1.405747, 0, 0.827451, 1, 1,
0.01742662, 0.1415423, 0.4137991, 0, 0.8196079, 1, 1,
0.01817783, 0.290957, 1.88513, 0, 0.8156863, 1, 1,
0.02190379, 0.6326103, 1.235307, 0, 0.8078431, 1, 1,
0.02236394, -1.180845, 3.108626, 0, 0.8039216, 1, 1,
0.02261853, 0.1745041, -0.4603115, 0, 0.7960784, 1, 1,
0.02274431, 1.105011, 0.3905368, 0, 0.7882353, 1, 1,
0.02350009, 0.5218551, 0.1361199, 0, 0.7843137, 1, 1,
0.02644406, 0.5560234, -0.3385409, 0, 0.7764706, 1, 1,
0.02794457, -0.9631495, 2.974238, 0, 0.772549, 1, 1,
0.02804756, 1.055579, -0.806807, 0, 0.7647059, 1, 1,
0.0306574, -0.05742236, 1.677594, 0, 0.7607843, 1, 1,
0.0310755, -0.577544, 2.820413, 0, 0.7529412, 1, 1,
0.04045334, 0.5072596, -0.2886572, 0, 0.7490196, 1, 1,
0.04253393, -1.190524, 0.9158792, 0, 0.7411765, 1, 1,
0.04703288, 0.007237784, 3.287056, 0, 0.7372549, 1, 1,
0.04976983, 0.02019363, 2.724715, 0, 0.7294118, 1, 1,
0.06277235, 1.086757, -1.297585, 0, 0.7254902, 1, 1,
0.07010668, -2.219213, 3.535416, 0, 0.7176471, 1, 1,
0.07247103, 2.274628, -0.4485904, 0, 0.7137255, 1, 1,
0.07360108, 0.2811038, 2.048359, 0, 0.7058824, 1, 1,
0.0784257, -0.6033109, 2.877726, 0, 0.6980392, 1, 1,
0.07913096, -1.337554, 1.602921, 0, 0.6941177, 1, 1,
0.08105128, 0.6949464, 2.145792, 0, 0.6862745, 1, 1,
0.0819265, -0.6660834, 3.035037, 0, 0.682353, 1, 1,
0.08259405, 1.065584, 0.2865584, 0, 0.6745098, 1, 1,
0.08710328, 0.4923079, -0.8093781, 0, 0.6705883, 1, 1,
0.0883688, -2.399026, 2.89085, 0, 0.6627451, 1, 1,
0.09000434, -0.7107534, 3.686406, 0, 0.6588235, 1, 1,
0.09206098, -0.5117702, 2.309932, 0, 0.6509804, 1, 1,
0.09253054, 1.739605, -0.6196378, 0, 0.6470588, 1, 1,
0.09575078, -0.1334265, 3.565623, 0, 0.6392157, 1, 1,
0.0973804, -0.1626475, 1.282399, 0, 0.6352941, 1, 1,
0.1035041, 0.2460828, -0.2694195, 0, 0.627451, 1, 1,
0.1052198, 0.5489452, 1.8142, 0, 0.6235294, 1, 1,
0.1062538, -0.5492079, 3.194092, 0, 0.6156863, 1, 1,
0.1081477, 0.4548354, -0.7001567, 0, 0.6117647, 1, 1,
0.1105591, 0.8231982, -1.116394, 0, 0.6039216, 1, 1,
0.1182747, -0.4289536, 2.159379, 0, 0.5960785, 1, 1,
0.1226849, 0.7130767, 0.5747896, 0, 0.5921569, 1, 1,
0.1271182, -1.079255, 2.025104, 0, 0.5843138, 1, 1,
0.1297843, 0.2413505, 0.3448505, 0, 0.5803922, 1, 1,
0.134051, -1.444148, 3.338928, 0, 0.572549, 1, 1,
0.1357814, -0.8204702, 2.532912, 0, 0.5686275, 1, 1,
0.1377676, -0.100635, 1.437524, 0, 0.5607843, 1, 1,
0.1394663, -1.509522, 1.731198, 0, 0.5568628, 1, 1,
0.1424939, 0.2643187, 1.295804, 0, 0.5490196, 1, 1,
0.1430359, -2.003831, 3.334168, 0, 0.5450981, 1, 1,
0.1513826, 0.3062707, -0.946815, 0, 0.5372549, 1, 1,
0.1586487, 0.9692345, -0.02597199, 0, 0.5333334, 1, 1,
0.1657296, -0.7989255, 3.12947, 0, 0.5254902, 1, 1,
0.1673821, -0.4985249, 2.399292, 0, 0.5215687, 1, 1,
0.1680124, 1.65388, -0.1393265, 0, 0.5137255, 1, 1,
0.1764768, -0.1248244, 4.388205, 0, 0.509804, 1, 1,
0.1778509, -0.3724988, 2.840013, 0, 0.5019608, 1, 1,
0.1778632, 1.454172, 0.2141806, 0, 0.4941176, 1, 1,
0.1792354, 0.4914138, 0.9847568, 0, 0.4901961, 1, 1,
0.186561, -1.2568, 3.467204, 0, 0.4823529, 1, 1,
0.1874759, 0.1287989, -0.7963092, 0, 0.4784314, 1, 1,
0.1890879, -1.18058, 2.680492, 0, 0.4705882, 1, 1,
0.1956014, -0.7707841, 1.90599, 0, 0.4666667, 1, 1,
0.199545, 0.5253879, 0.420085, 0, 0.4588235, 1, 1,
0.2088229, -0.5995366, 3.127401, 0, 0.454902, 1, 1,
0.208984, -0.9504058, 2.7727, 0, 0.4470588, 1, 1,
0.2098139, -1.631035, 4.269189, 0, 0.4431373, 1, 1,
0.2134029, -0.8713914, 0.1983381, 0, 0.4352941, 1, 1,
0.2153746, -1.973203, 1.595003, 0, 0.4313726, 1, 1,
0.2174302, -0.5694915, 2.296521, 0, 0.4235294, 1, 1,
0.2195879, -1.879146, 3.25418, 0, 0.4196078, 1, 1,
0.2201254, -1.138234, 1.321832, 0, 0.4117647, 1, 1,
0.2208246, 1.172375, 0.1152669, 0, 0.4078431, 1, 1,
0.2218257, -0.7420195, 2.926625, 0, 0.4, 1, 1,
0.2222597, 0.6574094, 0.455708, 0, 0.3921569, 1, 1,
0.2305179, 0.5327183, 1.84602, 0, 0.3882353, 1, 1,
0.2386627, 3.144913, -0.3519416, 0, 0.3803922, 1, 1,
0.2387716, -1.074498, 3.534137, 0, 0.3764706, 1, 1,
0.2399694, 1.941953, 0.06216775, 0, 0.3686275, 1, 1,
0.2456458, 1.804078, -0.7108153, 0, 0.3647059, 1, 1,
0.2539889, -0.2309466, 0.3902897, 0, 0.3568628, 1, 1,
0.2544348, -1.485421, 4.574345, 0, 0.3529412, 1, 1,
0.2558751, 0.3319597, 3.225994, 0, 0.345098, 1, 1,
0.2572822, 1.718756, 1.797732, 0, 0.3411765, 1, 1,
0.2575396, 0.311324, 1.12235, 0, 0.3333333, 1, 1,
0.2607429, -0.4603188, 2.470541, 0, 0.3294118, 1, 1,
0.2624331, 0.7336264, 0.3098463, 0, 0.3215686, 1, 1,
0.2630137, 1.70541, -1.443091, 0, 0.3176471, 1, 1,
0.2664033, -0.6216757, 0.927842, 0, 0.3098039, 1, 1,
0.2666146, -1.621811, 2.78982, 0, 0.3058824, 1, 1,
0.2673931, -1.432772, 1.922572, 0, 0.2980392, 1, 1,
0.2693247, 0.5359625, 0.2175784, 0, 0.2901961, 1, 1,
0.2693257, -1.713524, 4.187754, 0, 0.2862745, 1, 1,
0.269658, -0.4803668, 3.240142, 0, 0.2784314, 1, 1,
0.2800142, -1.874048, 4.250876, 0, 0.2745098, 1, 1,
0.2813405, 1.098663, -1.339617, 0, 0.2666667, 1, 1,
0.2852697, -1.160976, 4.013886, 0, 0.2627451, 1, 1,
0.2864186, 0.02926148, 2.372624, 0, 0.254902, 1, 1,
0.2917749, 1.474529, -0.7361422, 0, 0.2509804, 1, 1,
0.2959045, -0.767017, 1.310681, 0, 0.2431373, 1, 1,
0.2959543, -1.12804, 2.28031, 0, 0.2392157, 1, 1,
0.3008553, -1.900808, 3.957105, 0, 0.2313726, 1, 1,
0.3011, 0.04276258, -0.1637966, 0, 0.227451, 1, 1,
0.3048235, 0.4316644, 0.4263293, 0, 0.2196078, 1, 1,
0.3049872, 0.7379407, 0.06689525, 0, 0.2156863, 1, 1,
0.3069328, -2.614276, 2.752458, 0, 0.2078431, 1, 1,
0.3069792, -0.7598659, 2.244854, 0, 0.2039216, 1, 1,
0.3097788, -0.4215047, 3.2816, 0, 0.1960784, 1, 1,
0.3134818, 0.06143668, 0.5452397, 0, 0.1882353, 1, 1,
0.3163855, -0.07874379, 0.9134413, 0, 0.1843137, 1, 1,
0.3178927, 1.735197, 0.4896624, 0, 0.1764706, 1, 1,
0.3201198, -1.503357, 3.339063, 0, 0.172549, 1, 1,
0.3225766, -0.4781249, 4.585957, 0, 0.1647059, 1, 1,
0.3263158, -0.6292163, 2.888093, 0, 0.1607843, 1, 1,
0.334005, 1.66874, -1.30303, 0, 0.1529412, 1, 1,
0.3341572, -0.476443, 3.697513, 0, 0.1490196, 1, 1,
0.3354604, 0.1246724, 0.3638735, 0, 0.1411765, 1, 1,
0.3371212, 1.354641, -1.507082, 0, 0.1372549, 1, 1,
0.3401955, 2.194545, 1.629864, 0, 0.1294118, 1, 1,
0.3409551, -0.3540829, 4.109496, 0, 0.1254902, 1, 1,
0.3494854, 0.4498776, -0.723883, 0, 0.1176471, 1, 1,
0.3515298, -2.060276, 3.269689, 0, 0.1137255, 1, 1,
0.3638751, -2.643244, 3.601187, 0, 0.1058824, 1, 1,
0.3681042, -0.3821546, 1.404747, 0, 0.09803922, 1, 1,
0.3701721, -1.079281, 0.08784942, 0, 0.09411765, 1, 1,
0.3706984, 1.14222, -0.1616654, 0, 0.08627451, 1, 1,
0.3732057, -1.12287, 3.519109, 0, 0.08235294, 1, 1,
0.3744726, 0.8943673, 0.914681, 0, 0.07450981, 1, 1,
0.3753835, -0.4677878, 1.663489, 0, 0.07058824, 1, 1,
0.377693, -1.655408, 3.740738, 0, 0.0627451, 1, 1,
0.3792677, -0.5359669, 2.621662, 0, 0.05882353, 1, 1,
0.3798963, -1.182991, 3.194319, 0, 0.05098039, 1, 1,
0.3799373, 1.232032, 0.8165271, 0, 0.04705882, 1, 1,
0.381713, -0.1734843, 2.356649, 0, 0.03921569, 1, 1,
0.3829778, 0.4098835, 0.1862034, 0, 0.03529412, 1, 1,
0.3831266, -0.6523241, 2.362901, 0, 0.02745098, 1, 1,
0.3858781, 1.427205, 0.4676682, 0, 0.02352941, 1, 1,
0.3886597, 1.025359, -1.38784, 0, 0.01568628, 1, 1,
0.3901764, -2.788704, 2.395563, 0, 0.01176471, 1, 1,
0.3925689, -3.042485, 4.062787, 0, 0.003921569, 1, 1,
0.3962027, -0.5551183, 3.465586, 0.003921569, 0, 1, 1,
0.4073948, -0.8384314, 1.651573, 0.007843138, 0, 1, 1,
0.4075652, -1.575911, 3.198458, 0.01568628, 0, 1, 1,
0.413315, 0.2990355, 2.576759, 0.01960784, 0, 1, 1,
0.4139118, 0.4408635, -0.7945048, 0.02745098, 0, 1, 1,
0.4149592, 0.9816319, -0.7168267, 0.03137255, 0, 1, 1,
0.4151203, -0.2946417, 2.142237, 0.03921569, 0, 1, 1,
0.4203798, -1.080438, 2.444613, 0.04313726, 0, 1, 1,
0.4207742, -0.278635, 3.531583, 0.05098039, 0, 1, 1,
0.4238839, 0.9280486, -1.341552, 0.05490196, 0, 1, 1,
0.4259257, 0.01273505, 0.2774368, 0.0627451, 0, 1, 1,
0.4271012, 0.8444239, 2.380381, 0.06666667, 0, 1, 1,
0.4300365, 0.4956956, 0.8620666, 0.07450981, 0, 1, 1,
0.4344163, 0.5116622, -0.6524847, 0.07843138, 0, 1, 1,
0.4379891, 0.1291369, 0.6276571, 0.08627451, 0, 1, 1,
0.4389575, 0.9169838, 2.388127, 0.09019608, 0, 1, 1,
0.4460506, 0.9154158, 0.239316, 0.09803922, 0, 1, 1,
0.4462269, -0.262042, 2.710077, 0.1058824, 0, 1, 1,
0.4479438, -0.5414004, 2.266859, 0.1098039, 0, 1, 1,
0.4494028, 0.4093015, 0.2994372, 0.1176471, 0, 1, 1,
0.4498084, -0.746205, 1.965674, 0.1215686, 0, 1, 1,
0.4501872, -0.2341563, 2.648804, 0.1294118, 0, 1, 1,
0.4554728, -0.2961526, 3.000416, 0.1333333, 0, 1, 1,
0.4561172, 0.613, -0.6110898, 0.1411765, 0, 1, 1,
0.4563804, -0.2491729, 1.765086, 0.145098, 0, 1, 1,
0.4589944, 0.4123404, -1.771098, 0.1529412, 0, 1, 1,
0.4632151, 1.100216, 0.8297477, 0.1568628, 0, 1, 1,
0.4693102, -0.1660589, 2.636702, 0.1647059, 0, 1, 1,
0.4724404, -0.539578, 1.625109, 0.1686275, 0, 1, 1,
0.472562, -1.320855, 4.795511, 0.1764706, 0, 1, 1,
0.4752447, 0.2558178, -0.02646021, 0.1803922, 0, 1, 1,
0.4861075, -1.029389, 3.114727, 0.1882353, 0, 1, 1,
0.489622, 2.394631, 0.1483189, 0.1921569, 0, 1, 1,
0.4909099, -0.04814171, 2.389533, 0.2, 0, 1, 1,
0.4944242, -0.0982812, 3.213567, 0.2078431, 0, 1, 1,
0.4966582, 0.2837883, 0.9825603, 0.2117647, 0, 1, 1,
0.4970588, 0.5940858, 0.661043, 0.2196078, 0, 1, 1,
0.498417, -0.3104474, 2.991498, 0.2235294, 0, 1, 1,
0.5009252, -0.6089343, 2.754304, 0.2313726, 0, 1, 1,
0.5160438, -0.9836289, 1.672269, 0.2352941, 0, 1, 1,
0.5168842, -0.1991623, 2.979201, 0.2431373, 0, 1, 1,
0.5229584, 1.482034, 0.2582432, 0.2470588, 0, 1, 1,
0.524603, 1.684414, -0.2907417, 0.254902, 0, 1, 1,
0.5253128, -0.3230589, 1.860455, 0.2588235, 0, 1, 1,
0.5255744, 0.2729426, 1.313345, 0.2666667, 0, 1, 1,
0.5268205, 0.1795609, 2.238084, 0.2705882, 0, 1, 1,
0.5335014, 1.480324, 1.333668, 0.2784314, 0, 1, 1,
0.5407166, 0.483608, 0.9164596, 0.282353, 0, 1, 1,
0.5424858, -2.970008, 4.077599, 0.2901961, 0, 1, 1,
0.5429617, -0.603493, 1.781536, 0.2941177, 0, 1, 1,
0.5541889, -1.887591, 2.835708, 0.3019608, 0, 1, 1,
0.5564951, 0.3097518, 0.6779124, 0.3098039, 0, 1, 1,
0.5583246, 2.332972, 0.7759748, 0.3137255, 0, 1, 1,
0.5596833, 1.134133, 1.257723, 0.3215686, 0, 1, 1,
0.5645195, 0.9320084, 1.398857, 0.3254902, 0, 1, 1,
0.5687237, -0.9141104, 1.210051, 0.3333333, 0, 1, 1,
0.5701481, 0.6649938, 2.34898, 0.3372549, 0, 1, 1,
0.5785091, 0.4791926, 0.6674679, 0.345098, 0, 1, 1,
0.579703, -0.8119271, 2.012806, 0.3490196, 0, 1, 1,
0.5869818, 0.4547811, 1.068295, 0.3568628, 0, 1, 1,
0.5935799, 0.451757, 0.9784588, 0.3607843, 0, 1, 1,
0.5963046, -0.63446, 3.056422, 0.3686275, 0, 1, 1,
0.6018199, -1.607413, 3.633981, 0.372549, 0, 1, 1,
0.6031319, 0.4750704, 1.342968, 0.3803922, 0, 1, 1,
0.6108552, 0.1087665, 1.390912, 0.3843137, 0, 1, 1,
0.6158794, -0.8626832, 3.308534, 0.3921569, 0, 1, 1,
0.6161482, 0.7084242, 0.7249641, 0.3960784, 0, 1, 1,
0.6183025, -1.276817, 2.495477, 0.4039216, 0, 1, 1,
0.6213978, -1.961587, 2.662469, 0.4117647, 0, 1, 1,
0.6253332, -0.520402, 2.839342, 0.4156863, 0, 1, 1,
0.6261497, 1.267677, 0.9128217, 0.4235294, 0, 1, 1,
0.6306506, 0.5285526, -0.08370324, 0.427451, 0, 1, 1,
0.6379108, 1.199086, 0.7152072, 0.4352941, 0, 1, 1,
0.6380863, -0.8994199, 2.746415, 0.4392157, 0, 1, 1,
0.6388078, -0.7859015, 2.251401, 0.4470588, 0, 1, 1,
0.6429621, 0.4409902, 2.443298, 0.4509804, 0, 1, 1,
0.6451139, 0.9222212, 1.017417, 0.4588235, 0, 1, 1,
0.646996, -0.5892071, 0.9582378, 0.4627451, 0, 1, 1,
0.6503333, -0.700017, 2.328905, 0.4705882, 0, 1, 1,
0.6541898, -1.451065, 3.994542, 0.4745098, 0, 1, 1,
0.6544572, 0.6900211, 0.6372044, 0.4823529, 0, 1, 1,
0.6561311, 0.710422, 2.014306, 0.4862745, 0, 1, 1,
0.6595379, 0.7297384, 0.5941567, 0.4941176, 0, 1, 1,
0.6605098, -0.149799, 2.077347, 0.5019608, 0, 1, 1,
0.664012, -0.4714854, 2.977562, 0.5058824, 0, 1, 1,
0.6744385, 1.191501, -0.275321, 0.5137255, 0, 1, 1,
0.6775999, 0.2947787, 2.223701, 0.5176471, 0, 1, 1,
0.680284, 0.9028701, 0.1834626, 0.5254902, 0, 1, 1,
0.6822638, 0.5532729, -0.2162152, 0.5294118, 0, 1, 1,
0.6860222, -0.5434984, 0.6635957, 0.5372549, 0, 1, 1,
0.6912279, -0.2502176, 2.872222, 0.5411765, 0, 1, 1,
0.6961312, 0.5075216, 2.054392, 0.5490196, 0, 1, 1,
0.698606, 0.5083423, 0.898632, 0.5529412, 0, 1, 1,
0.699351, -0.1557276, 1.128195, 0.5607843, 0, 1, 1,
0.7025889, -0.7317146, 2.474675, 0.5647059, 0, 1, 1,
0.7073433, 0.1290732, 2.966615, 0.572549, 0, 1, 1,
0.7077376, 1.258181, 0.7563946, 0.5764706, 0, 1, 1,
0.7087669, -0.2542239, 2.102558, 0.5843138, 0, 1, 1,
0.7146387, 1.486067, -1.80325, 0.5882353, 0, 1, 1,
0.7156988, 0.2203714, 0.4024116, 0.5960785, 0, 1, 1,
0.7196993, -0.59045, 0.8580001, 0.6039216, 0, 1, 1,
0.7213843, 0.8553495, -1.918462, 0.6078432, 0, 1, 1,
0.7242246, 0.060892, 1.241992, 0.6156863, 0, 1, 1,
0.7258048, -1.564887, 2.565199, 0.6196079, 0, 1, 1,
0.7282166, 0.6082634, 0.3779583, 0.627451, 0, 1, 1,
0.7344843, 2.180849, 2.165295, 0.6313726, 0, 1, 1,
0.7428557, -0.1311938, 1.09451, 0.6392157, 0, 1, 1,
0.7454898, -0.5263633, 1.715142, 0.6431373, 0, 1, 1,
0.7456525, 0.6544992, 1.713434, 0.6509804, 0, 1, 1,
0.7490969, -0.6554095, 2.429378, 0.654902, 0, 1, 1,
0.7505581, -1.061884, 1.940995, 0.6627451, 0, 1, 1,
0.7527127, 1.555787, -0.02452339, 0.6666667, 0, 1, 1,
0.758838, -0.4912262, 1.47972, 0.6745098, 0, 1, 1,
0.7641856, 1.381245, 0.2982196, 0.6784314, 0, 1, 1,
0.776659, 0.1842035, 0.4305879, 0.6862745, 0, 1, 1,
0.7837909, -0.3782627, 3.057647, 0.6901961, 0, 1, 1,
0.7889504, -0.4984944, 3.970531, 0.6980392, 0, 1, 1,
0.7924455, -0.2673887, 1.346076, 0.7058824, 0, 1, 1,
0.7950939, -1.889467, 4.458108, 0.7098039, 0, 1, 1,
0.7976683, -0.2954856, 1.076572, 0.7176471, 0, 1, 1,
0.799877, 1.269534, 0.7634264, 0.7215686, 0, 1, 1,
0.8028126, 1.509861, -0.9622869, 0.7294118, 0, 1, 1,
0.8042167, -0.9970902, 3.036661, 0.7333333, 0, 1, 1,
0.8208855, 0.1998962, 1.562006, 0.7411765, 0, 1, 1,
0.8311266, 0.1028278, 2.221791, 0.7450981, 0, 1, 1,
0.8368217, -0.4007253, 3.226891, 0.7529412, 0, 1, 1,
0.8383263, 0.5201167, 0.7502456, 0.7568628, 0, 1, 1,
0.8423504, 0.5913754, -1.976749, 0.7647059, 0, 1, 1,
0.8459094, 0.3790727, 1.532623, 0.7686275, 0, 1, 1,
0.8482625, 0.09847713, 0.6327756, 0.7764706, 0, 1, 1,
0.8534329, -2.727026, 3.196728, 0.7803922, 0, 1, 1,
0.8543207, 0.1055867, 3.107493, 0.7882353, 0, 1, 1,
0.8587744, 0.6521819, 0.4588288, 0.7921569, 0, 1, 1,
0.865833, -0.5818497, 3.619592, 0.8, 0, 1, 1,
0.8661992, 0.180523, 2.496879, 0.8078431, 0, 1, 1,
0.8670295, 0.8497093, -0.02629771, 0.8117647, 0, 1, 1,
0.8671028, 0.0998083, 2.967561, 0.8196079, 0, 1, 1,
0.8677787, -0.8882377, 2.933673, 0.8235294, 0, 1, 1,
0.8747061, -1.164921, 4.56464, 0.8313726, 0, 1, 1,
0.8747124, -1.710682, 1.441661, 0.8352941, 0, 1, 1,
0.8773542, -0.1547276, 1.803758, 0.8431373, 0, 1, 1,
0.8804735, 0.9742573, -0.0973297, 0.8470588, 0, 1, 1,
0.8855065, -0.208165, 1.503624, 0.854902, 0, 1, 1,
0.8935651, -2.495055, 4.323675, 0.8588235, 0, 1, 1,
0.8936644, 0.7753648, 0.8649495, 0.8666667, 0, 1, 1,
0.8958579, -0.2041528, -0.3045922, 0.8705882, 0, 1, 1,
0.9111557, 0.09688054, 2.608094, 0.8784314, 0, 1, 1,
0.912646, -0.7376919, 1.496147, 0.8823529, 0, 1, 1,
0.9133352, 0.1963126, 2.538974, 0.8901961, 0, 1, 1,
0.9133624, 1.716786, 0.8735787, 0.8941177, 0, 1, 1,
0.9136016, 0.8592098, 2.006095, 0.9019608, 0, 1, 1,
0.9182383, -0.462984, 2.359416, 0.9098039, 0, 1, 1,
0.9242011, -0.4576446, 0.3056839, 0.9137255, 0, 1, 1,
0.9334891, 1.214193, 0.475985, 0.9215686, 0, 1, 1,
0.9402478, -0.4042248, 2.524071, 0.9254902, 0, 1, 1,
0.9476857, 0.3390679, 1.702456, 0.9333333, 0, 1, 1,
0.9605039, -0.7287819, 3.450383, 0.9372549, 0, 1, 1,
0.9665345, -0.8809729, 2.372196, 0.945098, 0, 1, 1,
0.9698293, 0.7018112, 2.133409, 0.9490196, 0, 1, 1,
0.97945, 1.262528, 0.2307408, 0.9568627, 0, 1, 1,
0.9816931, -0.7940134, 1.736982, 0.9607843, 0, 1, 1,
0.9882496, 0.08977499, 0.3089076, 0.9686275, 0, 1, 1,
0.996635, 0.2041565, 1.581271, 0.972549, 0, 1, 1,
1.002373, 0.06264713, 1.489009, 0.9803922, 0, 1, 1,
1.003553, 0.06869446, 0.7670131, 0.9843137, 0, 1, 1,
1.009331, 1.076123, -0.1070022, 0.9921569, 0, 1, 1,
1.009528, -0.8951723, 3.817627, 0.9960784, 0, 1, 1,
1.019105, 0.5485075, -0.4671807, 1, 0, 0.9960784, 1,
1.020999, -0.3702086, -0.1301153, 1, 0, 0.9882353, 1,
1.033494, 0.5123511, 1.815804, 1, 0, 0.9843137, 1,
1.03367, 0.1916156, 1.095139, 1, 0, 0.9764706, 1,
1.043138, -0.06578231, 1.378387, 1, 0, 0.972549, 1,
1.047408, -2.166686, 3.824709, 1, 0, 0.9647059, 1,
1.049329, 0.5629926, 2.340447, 1, 0, 0.9607843, 1,
1.054812, -0.2618585, 0.3765104, 1, 0, 0.9529412, 1,
1.056817, -0.03071912, 1.13496, 1, 0, 0.9490196, 1,
1.059916, -1.723302, 0.8914616, 1, 0, 0.9411765, 1,
1.061561, -0.3724212, 0.146531, 1, 0, 0.9372549, 1,
1.068665, -1.508768, 2.590429, 1, 0, 0.9294118, 1,
1.071415, 0.4946495, 2.231508, 1, 0, 0.9254902, 1,
1.071838, 0.7025005, 2.438693, 1, 0, 0.9176471, 1,
1.089007, -0.372658, 1.331824, 1, 0, 0.9137255, 1,
1.100298, 0.1993759, 2.243263, 1, 0, 0.9058824, 1,
1.102868, 0.9816683, 0.6681908, 1, 0, 0.9019608, 1,
1.103022, -1.642624, 2.412527, 1, 0, 0.8941177, 1,
1.103445, 0.3575852, 2.13478, 1, 0, 0.8862745, 1,
1.122562, 1.400328, 1.12053, 1, 0, 0.8823529, 1,
1.124255, -0.7770371, 3.022366, 1, 0, 0.8745098, 1,
1.125203, -0.06754196, 0.1917776, 1, 0, 0.8705882, 1,
1.128016, 0.5183208, 2.826508, 1, 0, 0.8627451, 1,
1.129927, 2.242312, 1.351967, 1, 0, 0.8588235, 1,
1.130776, -0.6035132, 1.270793, 1, 0, 0.8509804, 1,
1.133069, 1.486552, 1.465085, 1, 0, 0.8470588, 1,
1.138163, -1.040414, 1.750702, 1, 0, 0.8392157, 1,
1.140388, -0.03193028, 1.552634, 1, 0, 0.8352941, 1,
1.152201, -0.8251362, 1.866899, 1, 0, 0.827451, 1,
1.158067, -1.699789, 3.180799, 1, 0, 0.8235294, 1,
1.160133, -0.4273549, 2.576046, 1, 0, 0.8156863, 1,
1.160632, -1.726251, 2.170545, 1, 0, 0.8117647, 1,
1.16672, -1.05838, 2.036062, 1, 0, 0.8039216, 1,
1.169817, 1.241925, 0.5408992, 1, 0, 0.7960784, 1,
1.173345, -0.1799507, 2.611974, 1, 0, 0.7921569, 1,
1.185036, -0.9331042, 2.197648, 1, 0, 0.7843137, 1,
1.188767, 0.5529033, -0.6890579, 1, 0, 0.7803922, 1,
1.199568, -0.6358135, 2.966214, 1, 0, 0.772549, 1,
1.206402, -0.1477366, 1.616461, 1, 0, 0.7686275, 1,
1.21142, -1.037559, 1.773856, 1, 0, 0.7607843, 1,
1.213291, -1.233976, 1.624777, 1, 0, 0.7568628, 1,
1.215595, -0.1849228, 0.5617334, 1, 0, 0.7490196, 1,
1.215841, 1.446152, 0.1001184, 1, 0, 0.7450981, 1,
1.222074, 1.209578, 1.367573, 1, 0, 0.7372549, 1,
1.244389, 0.09475159, 3.476678, 1, 0, 0.7333333, 1,
1.252956, 0.2380463, 0.7460421, 1, 0, 0.7254902, 1,
1.256733, -0.1671716, 0.6219044, 1, 0, 0.7215686, 1,
1.266363, 1.508245, 1.521877, 1, 0, 0.7137255, 1,
1.26927, 0.143003, 1.716637, 1, 0, 0.7098039, 1,
1.282215, 0.3578713, 2.89186, 1, 0, 0.7019608, 1,
1.284281, 0.4888535, 1.848452, 1, 0, 0.6941177, 1,
1.290014, -0.3300263, 1.042308, 1, 0, 0.6901961, 1,
1.293141, 0.6407257, -0.1281555, 1, 0, 0.682353, 1,
1.295274, -0.4419316, 1.922708, 1, 0, 0.6784314, 1,
1.302336, -1.532005, 3.198221, 1, 0, 0.6705883, 1,
1.309411, 1.572462, -0.1900989, 1, 0, 0.6666667, 1,
1.31217, 0.1855234, 2.10553, 1, 0, 0.6588235, 1,
1.315004, -0.9012383, 0.4971701, 1, 0, 0.654902, 1,
1.322252, -0.9676235, 3.420938, 1, 0, 0.6470588, 1,
1.322287, 0.8893269, 0.3704893, 1, 0, 0.6431373, 1,
1.323894, 1.643936, -0.5884755, 1, 0, 0.6352941, 1,
1.324436, 0.225427, 1.210243, 1, 0, 0.6313726, 1,
1.327761, 1.705254, 2.876674, 1, 0, 0.6235294, 1,
1.331296, -0.3594875, 3.818903, 1, 0, 0.6196079, 1,
1.334733, 0.4073216, 3.470156, 1, 0, 0.6117647, 1,
1.34214, -0.6229311, -0.2367994, 1, 0, 0.6078432, 1,
1.342978, 0.865807, -0.05030133, 1, 0, 0.6, 1,
1.348467, -0.6673404, 2.78074, 1, 0, 0.5921569, 1,
1.34871, 0.2558508, 1.744101, 1, 0, 0.5882353, 1,
1.352545, -1.465421, 2.953653, 1, 0, 0.5803922, 1,
1.355383, 0.3821792, 1.582808, 1, 0, 0.5764706, 1,
1.35762, -0.03037065, 1.542301, 1, 0, 0.5686275, 1,
1.360093, -0.7048292, 2.760803, 1, 0, 0.5647059, 1,
1.378405, 1.632302, -0.8770146, 1, 0, 0.5568628, 1,
1.384642, -0.09170096, 1.247079, 1, 0, 0.5529412, 1,
1.385859, -0.8783966, 2.521111, 1, 0, 0.5450981, 1,
1.393765, -0.2286457, 2.428186, 1, 0, 0.5411765, 1,
1.402184, -0.2466896, 2.680291, 1, 0, 0.5333334, 1,
1.402964, 2.643981, 0.8910167, 1, 0, 0.5294118, 1,
1.407998, 1.053269, 2.213335, 1, 0, 0.5215687, 1,
1.415007, -1.273518, 3.755719, 1, 0, 0.5176471, 1,
1.421843, -0.3044659, 2.733806, 1, 0, 0.509804, 1,
1.424664, -2.513347, 2.560755, 1, 0, 0.5058824, 1,
1.426737, -0.06858465, 3.115537, 1, 0, 0.4980392, 1,
1.433084, -0.2123818, 2.05171, 1, 0, 0.4901961, 1,
1.44746, 0.5611581, 0.9616601, 1, 0, 0.4862745, 1,
1.452668, 0.8204226, 0.5330836, 1, 0, 0.4784314, 1,
1.468123, 0.9021232, 1.597591, 1, 0, 0.4745098, 1,
1.473048, -1.630912, 4.201443, 1, 0, 0.4666667, 1,
1.478714, 0.4688005, 0.084249, 1, 0, 0.4627451, 1,
1.480383, 1.675374, 1.186768, 1, 0, 0.454902, 1,
1.491203, -1.053257, 4.567474, 1, 0, 0.4509804, 1,
1.498569, -1.15156, 1.41975, 1, 0, 0.4431373, 1,
1.509486, 0.1716406, 2.300345, 1, 0, 0.4392157, 1,
1.517855, -0.5938047, 2.341931, 1, 0, 0.4313726, 1,
1.532783, -0.3628621, 1.718428, 1, 0, 0.427451, 1,
1.535931, 0.4297052, 2.294934, 1, 0, 0.4196078, 1,
1.536005, -1.242467, 2.503316, 1, 0, 0.4156863, 1,
1.552009, 0.7296211, 0.5541548, 1, 0, 0.4078431, 1,
1.570742, -0.9217249, 2.846249, 1, 0, 0.4039216, 1,
1.572613, 0.4919555, 2.27945, 1, 0, 0.3960784, 1,
1.584864, 0.7583387, 2.278872, 1, 0, 0.3882353, 1,
1.596913, 0.6836897, 0.5742388, 1, 0, 0.3843137, 1,
1.598049, 0.2946103, 1.230317, 1, 0, 0.3764706, 1,
1.605546, 0.2944124, 1.174764, 1, 0, 0.372549, 1,
1.607254, -0.9416755, 3.247586, 1, 0, 0.3647059, 1,
1.607949, -1.421575, 2.526993, 1, 0, 0.3607843, 1,
1.613797, 0.6375632, 0.4190812, 1, 0, 0.3529412, 1,
1.621667, -1.860518, 2.206751, 1, 0, 0.3490196, 1,
1.622468, 2.344986, 0.04917315, 1, 0, 0.3411765, 1,
1.627587, -1.158489, 4.70658, 1, 0, 0.3372549, 1,
1.629892, -1.313817, 1.451346, 1, 0, 0.3294118, 1,
1.630201, -0.3434534, 2.777351, 1, 0, 0.3254902, 1,
1.633401, 1.107204, 0.2184354, 1, 0, 0.3176471, 1,
1.639751, -1.155859, 4.165296, 1, 0, 0.3137255, 1,
1.649145, -0.1477846, -0.02874133, 1, 0, 0.3058824, 1,
1.652107, 0.3626818, -0.1668964, 1, 0, 0.2980392, 1,
1.671252, 1.190142, 0.9462249, 1, 0, 0.2941177, 1,
1.685844, -0.4718904, 1.400099, 1, 0, 0.2862745, 1,
1.692426, -0.01969499, 0.3060554, 1, 0, 0.282353, 1,
1.692504, -1.31, 3.119156, 1, 0, 0.2745098, 1,
1.695768, 1.462425, -0.3854635, 1, 0, 0.2705882, 1,
1.703698, -0.2197618, 1.210165, 1, 0, 0.2627451, 1,
1.705576, -0.638561, 1.472535, 1, 0, 0.2588235, 1,
1.707877, -0.06739088, 0.9964745, 1, 0, 0.2509804, 1,
1.715158, -1.058099, 1.540814, 1, 0, 0.2470588, 1,
1.737682, -0.4625497, 1.832693, 1, 0, 0.2392157, 1,
1.738832, 0.8730506, 1.279422, 1, 0, 0.2352941, 1,
1.741382, -0.007326947, -0.4227859, 1, 0, 0.227451, 1,
1.752956, -1.264975, 0.4799338, 1, 0, 0.2235294, 1,
1.755042, 0.9644887, 1.811718, 1, 0, 0.2156863, 1,
1.765829, 0.6444083, 2.088655, 1, 0, 0.2117647, 1,
1.787544, -0.3073603, 1.039065, 1, 0, 0.2039216, 1,
1.802639, -0.9794182, 3.028194, 1, 0, 0.1960784, 1,
1.80458, -0.2988681, 2.558718, 1, 0, 0.1921569, 1,
1.813387, 1.150972, 0.559932, 1, 0, 0.1843137, 1,
1.844961, 0.3063719, 1.220854, 1, 0, 0.1803922, 1,
1.84513, 0.7777486, -0.7450576, 1, 0, 0.172549, 1,
1.872209, 0.7625186, 0.7625893, 1, 0, 0.1686275, 1,
1.89744, 0.6111931, 2.672186, 1, 0, 0.1607843, 1,
1.90095, 1.465588, 1.555178, 1, 0, 0.1568628, 1,
1.9139, 1.056985, 2.833768, 1, 0, 0.1490196, 1,
1.95054, 1.456465, 1.913175, 1, 0, 0.145098, 1,
1.971724, -0.2272716, 0.646531, 1, 0, 0.1372549, 1,
1.976316, -0.9402812, 1.4781, 1, 0, 0.1333333, 1,
1.991001, 0.875033, 0.2364997, 1, 0, 0.1254902, 1,
1.995009, 1.444779, 1.570511, 1, 0, 0.1215686, 1,
2.010055, -0.08971737, 0.4406766, 1, 0, 0.1137255, 1,
2.043181, -0.7324457, 3.624395, 1, 0, 0.1098039, 1,
2.049505, -0.6296799, -0.5856774, 1, 0, 0.1019608, 1,
2.146538, 0.7584127, 0.778713, 1, 0, 0.09411765, 1,
2.177612, -0.4552591, 2.399269, 1, 0, 0.09019608, 1,
2.209917, 0.3192923, 1.251812, 1, 0, 0.08235294, 1,
2.211576, -0.3580522, 1.370991, 1, 0, 0.07843138, 1,
2.222198, 0.3424367, 1.220565, 1, 0, 0.07058824, 1,
2.222968, 0.6734143, 1.803043, 1, 0, 0.06666667, 1,
2.266582, -0.1411437, 0.4083086, 1, 0, 0.05882353, 1,
2.274353, 0.1530122, 2.592445, 1, 0, 0.05490196, 1,
2.274773, 1.974785, 1.392528, 1, 0, 0.04705882, 1,
2.279998, 0.4633103, 0.3489904, 1, 0, 0.04313726, 1,
2.286183, 0.6919525, 1.384005, 1, 0, 0.03529412, 1,
2.307697, 1.287713, 1.146293, 1, 0, 0.03137255, 1,
2.416635, 1.003474, 1.129806, 1, 0, 0.02352941, 1,
2.435649, 0.6418548, 1.812893, 1, 0, 0.01960784, 1,
2.635825, 0.02828785, -0.567077, 1, 0, 0.01176471, 1,
2.661248, -0.3898476, 2.597924, 1, 0, 0.007843138, 1
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
-0.3810415, -4.715443, -6.66899, 0, -0.5, 0.5, 0.5,
-0.3810415, -4.715443, -6.66899, 1, -0.5, 0.5, 0.5,
-0.3810415, -4.715443, -6.66899, 1, 1.5, 0.5, 0.5,
-0.3810415, -4.715443, -6.66899, 0, 1.5, 0.5, 0.5
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
-4.454668, -0.05483425, -6.66899, 0, -0.5, 0.5, 0.5,
-4.454668, -0.05483425, -6.66899, 1, -0.5, 0.5, 0.5,
-4.454668, -0.05483425, -6.66899, 1, 1.5, 0.5, 0.5,
-4.454668, -0.05483425, -6.66899, 0, 1.5, 0.5, 0.5
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
-4.454668, -4.715443, -0.105943, 0, -0.5, 0.5, 0.5,
-4.454668, -4.715443, -0.105943, 1, -0.5, 0.5, 0.5,
-4.454668, -4.715443, -0.105943, 1, 1.5, 0.5, 0.5,
-4.454668, -4.715443, -0.105943, 0, 1.5, 0.5, 0.5
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
-3, -3.639918, -5.154441,
2, -3.639918, -5.154441,
-3, -3.639918, -5.154441,
-3, -3.819172, -5.406866,
-2, -3.639918, -5.154441,
-2, -3.819172, -5.406866,
-1, -3.639918, -5.154441,
-1, -3.819172, -5.406866,
0, -3.639918, -5.154441,
0, -3.819172, -5.406866,
1, -3.639918, -5.154441,
1, -3.819172, -5.406866,
2, -3.639918, -5.154441,
2, -3.819172, -5.406866
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
-3, -4.17768, -5.911716, 0, -0.5, 0.5, 0.5,
-3, -4.17768, -5.911716, 1, -0.5, 0.5, 0.5,
-3, -4.17768, -5.911716, 1, 1.5, 0.5, 0.5,
-3, -4.17768, -5.911716, 0, 1.5, 0.5, 0.5,
-2, -4.17768, -5.911716, 0, -0.5, 0.5, 0.5,
-2, -4.17768, -5.911716, 1, -0.5, 0.5, 0.5,
-2, -4.17768, -5.911716, 1, 1.5, 0.5, 0.5,
-2, -4.17768, -5.911716, 0, 1.5, 0.5, 0.5,
-1, -4.17768, -5.911716, 0, -0.5, 0.5, 0.5,
-1, -4.17768, -5.911716, 1, -0.5, 0.5, 0.5,
-1, -4.17768, -5.911716, 1, 1.5, 0.5, 0.5,
-1, -4.17768, -5.911716, 0, 1.5, 0.5, 0.5,
0, -4.17768, -5.911716, 0, -0.5, 0.5, 0.5,
0, -4.17768, -5.911716, 1, -0.5, 0.5, 0.5,
0, -4.17768, -5.911716, 1, 1.5, 0.5, 0.5,
0, -4.17768, -5.911716, 0, 1.5, 0.5, 0.5,
1, -4.17768, -5.911716, 0, -0.5, 0.5, 0.5,
1, -4.17768, -5.911716, 1, -0.5, 0.5, 0.5,
1, -4.17768, -5.911716, 1, 1.5, 0.5, 0.5,
1, -4.17768, -5.911716, 0, 1.5, 0.5, 0.5,
2, -4.17768, -5.911716, 0, -0.5, 0.5, 0.5,
2, -4.17768, -5.911716, 1, -0.5, 0.5, 0.5,
2, -4.17768, -5.911716, 1, 1.5, 0.5, 0.5,
2, -4.17768, -5.911716, 0, 1.5, 0.5, 0.5
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
-3.5146, -3, -5.154441,
-3.5146, 3, -5.154441,
-3.5146, -3, -5.154441,
-3.671278, -3, -5.406866,
-3.5146, -2, -5.154441,
-3.671278, -2, -5.406866,
-3.5146, -1, -5.154441,
-3.671278, -1, -5.406866,
-3.5146, 0, -5.154441,
-3.671278, 0, -5.406866,
-3.5146, 1, -5.154441,
-3.671278, 1, -5.406866,
-3.5146, 2, -5.154441,
-3.671278, 2, -5.406866,
-3.5146, 3, -5.154441,
-3.671278, 3, -5.406866
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
-3.984634, -3, -5.911716, 0, -0.5, 0.5, 0.5,
-3.984634, -3, -5.911716, 1, -0.5, 0.5, 0.5,
-3.984634, -3, -5.911716, 1, 1.5, 0.5, 0.5,
-3.984634, -3, -5.911716, 0, 1.5, 0.5, 0.5,
-3.984634, -2, -5.911716, 0, -0.5, 0.5, 0.5,
-3.984634, -2, -5.911716, 1, -0.5, 0.5, 0.5,
-3.984634, -2, -5.911716, 1, 1.5, 0.5, 0.5,
-3.984634, -2, -5.911716, 0, 1.5, 0.5, 0.5,
-3.984634, -1, -5.911716, 0, -0.5, 0.5, 0.5,
-3.984634, -1, -5.911716, 1, -0.5, 0.5, 0.5,
-3.984634, -1, -5.911716, 1, 1.5, 0.5, 0.5,
-3.984634, -1, -5.911716, 0, 1.5, 0.5, 0.5,
-3.984634, 0, -5.911716, 0, -0.5, 0.5, 0.5,
-3.984634, 0, -5.911716, 1, -0.5, 0.5, 0.5,
-3.984634, 0, -5.911716, 1, 1.5, 0.5, 0.5,
-3.984634, 0, -5.911716, 0, 1.5, 0.5, 0.5,
-3.984634, 1, -5.911716, 0, -0.5, 0.5, 0.5,
-3.984634, 1, -5.911716, 1, -0.5, 0.5, 0.5,
-3.984634, 1, -5.911716, 1, 1.5, 0.5, 0.5,
-3.984634, 1, -5.911716, 0, 1.5, 0.5, 0.5,
-3.984634, 2, -5.911716, 0, -0.5, 0.5, 0.5,
-3.984634, 2, -5.911716, 1, -0.5, 0.5, 0.5,
-3.984634, 2, -5.911716, 1, 1.5, 0.5, 0.5,
-3.984634, 2, -5.911716, 0, 1.5, 0.5, 0.5,
-3.984634, 3, -5.911716, 0, -0.5, 0.5, 0.5,
-3.984634, 3, -5.911716, 1, -0.5, 0.5, 0.5,
-3.984634, 3, -5.911716, 1, 1.5, 0.5, 0.5,
-3.984634, 3, -5.911716, 0, 1.5, 0.5, 0.5
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
-3.5146, -3.639918, -4,
-3.5146, -3.639918, 4,
-3.5146, -3.639918, -4,
-3.671278, -3.819172, -4,
-3.5146, -3.639918, -2,
-3.671278, -3.819172, -2,
-3.5146, -3.639918, 0,
-3.671278, -3.819172, 0,
-3.5146, -3.639918, 2,
-3.671278, -3.819172, 2,
-3.5146, -3.639918, 4,
-3.671278, -3.819172, 4
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
-3.984634, -4.17768, -4, 0, -0.5, 0.5, 0.5,
-3.984634, -4.17768, -4, 1, -0.5, 0.5, 0.5,
-3.984634, -4.17768, -4, 1, 1.5, 0.5, 0.5,
-3.984634, -4.17768, -4, 0, 1.5, 0.5, 0.5,
-3.984634, -4.17768, -2, 0, -0.5, 0.5, 0.5,
-3.984634, -4.17768, -2, 1, -0.5, 0.5, 0.5,
-3.984634, -4.17768, -2, 1, 1.5, 0.5, 0.5,
-3.984634, -4.17768, -2, 0, 1.5, 0.5, 0.5,
-3.984634, -4.17768, 0, 0, -0.5, 0.5, 0.5,
-3.984634, -4.17768, 0, 1, -0.5, 0.5, 0.5,
-3.984634, -4.17768, 0, 1, 1.5, 0.5, 0.5,
-3.984634, -4.17768, 0, 0, 1.5, 0.5, 0.5,
-3.984634, -4.17768, 2, 0, -0.5, 0.5, 0.5,
-3.984634, -4.17768, 2, 1, -0.5, 0.5, 0.5,
-3.984634, -4.17768, 2, 1, 1.5, 0.5, 0.5,
-3.984634, -4.17768, 2, 0, 1.5, 0.5, 0.5,
-3.984634, -4.17768, 4, 0, -0.5, 0.5, 0.5,
-3.984634, -4.17768, 4, 1, -0.5, 0.5, 0.5,
-3.984634, -4.17768, 4, 1, 1.5, 0.5, 0.5,
-3.984634, -4.17768, 4, 0, 1.5, 0.5, 0.5
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
-3.5146, -3.639918, -5.154441,
-3.5146, 3.53025, -5.154441,
-3.5146, -3.639918, 4.942555,
-3.5146, 3.53025, 4.942555,
-3.5146, -3.639918, -5.154441,
-3.5146, -3.639918, 4.942555,
-3.5146, 3.53025, -5.154441,
-3.5146, 3.53025, 4.942555,
-3.5146, -3.639918, -5.154441,
2.752517, -3.639918, -5.154441,
-3.5146, -3.639918, 4.942555,
2.752517, -3.639918, 4.942555,
-3.5146, 3.53025, -5.154441,
2.752517, 3.53025, -5.154441,
-3.5146, 3.53025, 4.942555,
2.752517, 3.53025, 4.942555,
2.752517, -3.639918, -5.154441,
2.752517, 3.53025, -5.154441,
2.752517, -3.639918, 4.942555,
2.752517, 3.53025, 4.942555,
2.752517, -3.639918, -5.154441,
2.752517, -3.639918, 4.942555,
2.752517, 3.53025, -5.154441,
2.752517, 3.53025, 4.942555
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
var radius = 7.411323;
var distance = 32.97381;
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
mvMatrix.translate( 0.3810415, 0.05483425, 0.105943 );
mvMatrix.scale( 1.278621, 1.117584, 0.7936289 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.97381);
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
Sevin<-read.table("Sevin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Sevin$V2
```

```
## Error in eval(expr, envir, enclos): object 'Sevin' not found
```

```r
y<-Sevin$V3
```

```
## Error in eval(expr, envir, enclos): object 'Sevin' not found
```

```r
z<-Sevin$V4
```

```
## Error in eval(expr, envir, enclos): object 'Sevin' not found
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
-3.423331, 0.2639611, -2.292736, 0, 0, 1, 1, 1,
-2.566377, -0.1246772, -3.046829, 1, 0, 0, 1, 1,
-2.514235, -1.311796, -2.782913, 1, 0, 0, 1, 1,
-2.50299, -1.137314, -0.9644145, 1, 0, 0, 1, 1,
-2.383212, 1.050722, -1.389396, 1, 0, 0, 1, 1,
-2.378411, 0.9838671, -0.9783022, 1, 0, 0, 1, 1,
-2.294776, -1.012733, -3.759866, 0, 0, 0, 1, 1,
-2.275762, -0.6042978, -0.8225223, 0, 0, 0, 1, 1,
-2.204149, -1.126888, -1.32874, 0, 0, 0, 1, 1,
-2.162395, 2.294073, 0.7182105, 0, 0, 0, 1, 1,
-2.132384, 1.042183, -0.9446908, 0, 0, 0, 1, 1,
-2.115496, 1.517342, -1.308366, 0, 0, 0, 1, 1,
-2.107033, -1.376572, -1.033966, 0, 0, 0, 1, 1,
-2.092963, 1.079253, -1.22898, 1, 1, 1, 1, 1,
-2.070111, 0.8204901, -0.8038541, 1, 1, 1, 1, 1,
-2.04634, -0.7591116, -1.408378, 1, 1, 1, 1, 1,
-2.037911, -0.297176, -3.285024, 1, 1, 1, 1, 1,
-2.028626, -1.072472, -3.76698, 1, 1, 1, 1, 1,
-2.021808, 0.1695244, -1.660967, 1, 1, 1, 1, 1,
-1.984141, 0.8725889, -1.129087, 1, 1, 1, 1, 1,
-1.960159, 1.272237, -2.192155, 1, 1, 1, 1, 1,
-1.944591, -0.7778545, -1.529788, 1, 1, 1, 1, 1,
-1.891334, -0.458392, -1.1473, 1, 1, 1, 1, 1,
-1.876672, -0.4901919, -3.161379, 1, 1, 1, 1, 1,
-1.854644, 1.162802, -0.6846451, 1, 1, 1, 1, 1,
-1.840079, 1.069577, -0.8481462, 1, 1, 1, 1, 1,
-1.82957, 0.5289293, -1.737698, 1, 1, 1, 1, 1,
-1.826817, -1.396654, -2.379053, 1, 1, 1, 1, 1,
-1.823631, 0.6995751, -0.4749023, 0, 0, 1, 1, 1,
-1.818869, -1.265789, -2.883979, 1, 0, 0, 1, 1,
-1.81366, -0.7192468, -1.97673, 1, 0, 0, 1, 1,
-1.81351, -1.424253, -2.489792, 1, 0, 0, 1, 1,
-1.797652, -1.144289, 0.1048961, 1, 0, 0, 1, 1,
-1.783758, -1.083103, -2.342782, 1, 0, 0, 1, 1,
-1.777235, -1.40509, -1.630675, 0, 0, 0, 1, 1,
-1.765919, 0.7654278, -1.526104, 0, 0, 0, 1, 1,
-1.758896, -0.008320091, -1.26845, 0, 0, 0, 1, 1,
-1.757077, -0.2883214, 0.2039453, 0, 0, 0, 1, 1,
-1.751314, 0.3078096, -1.505393, 0, 0, 0, 1, 1,
-1.742274, -0.04178528, -1.489815, 0, 0, 0, 1, 1,
-1.72798, -0.5110562, -2.69075, 0, 0, 0, 1, 1,
-1.714376, -1.080458, -1.651973, 1, 1, 1, 1, 1,
-1.712841, -0.2976066, -2.015188, 1, 1, 1, 1, 1,
-1.69853, 1.103405, -1.013268, 1, 1, 1, 1, 1,
-1.680789, -1.760875, -2.783684, 1, 1, 1, 1, 1,
-1.671801, 0.007821596, -2.608875, 1, 1, 1, 1, 1,
-1.669279, 1.840684, 0.09139927, 1, 1, 1, 1, 1,
-1.655942, -0.3081168, -1.355037, 1, 1, 1, 1, 1,
-1.652851, -0.7813577, -1.302628, 1, 1, 1, 1, 1,
-1.646847, -0.9602256, -1.585223, 1, 1, 1, 1, 1,
-1.645878, 0.2897714, -0.05780054, 1, 1, 1, 1, 1,
-1.64175, -1.507836, -1.976839, 1, 1, 1, 1, 1,
-1.625127, 1.4655, -3.261062, 1, 1, 1, 1, 1,
-1.581679, 3.42583, -0.9376628, 1, 1, 1, 1, 1,
-1.578601, 1.44155, -1.462479, 1, 1, 1, 1, 1,
-1.578556, -0.8573309, -2.790287, 1, 1, 1, 1, 1,
-1.560453, 0.2691576, -2.616012, 0, 0, 1, 1, 1,
-1.552692, 0.5408342, -0.3359595, 1, 0, 0, 1, 1,
-1.545294, 2.408034, -0.584955, 1, 0, 0, 1, 1,
-1.526504, 0.07445433, 0.2981644, 1, 0, 0, 1, 1,
-1.524173, 0.06266135, 0.05140958, 1, 0, 0, 1, 1,
-1.523291, 1.498213, -1.040878, 1, 0, 0, 1, 1,
-1.518357, -2.492798, -4.321573, 0, 0, 0, 1, 1,
-1.513453, 1.900761, -1.414755, 0, 0, 0, 1, 1,
-1.504524, -0.5845087, -0.7593571, 0, 0, 0, 1, 1,
-1.502404, -0.3398546, -1.823849, 0, 0, 0, 1, 1,
-1.500938, -0.1134062, -1.810868, 0, 0, 0, 1, 1,
-1.500767, -1.036218, -2.19394, 0, 0, 0, 1, 1,
-1.496481, -2.054034, -2.973062, 0, 0, 0, 1, 1,
-1.495739, -0.2783749, -2.222857, 1, 1, 1, 1, 1,
-1.492332, -0.3650492, -2.499036, 1, 1, 1, 1, 1,
-1.490821, 0.04635729, -3.629261, 1, 1, 1, 1, 1,
-1.482636, -0.5162612, -2.634438, 1, 1, 1, 1, 1,
-1.481964, -0.6817384, -2.180054, 1, 1, 1, 1, 1,
-1.48087, -1.163232, -1.638026, 1, 1, 1, 1, 1,
-1.480605, 1.363573, -0.6379848, 1, 1, 1, 1, 1,
-1.479358, -0.1092944, -1.652369, 1, 1, 1, 1, 1,
-1.461087, -0.6982395, -2.754965, 1, 1, 1, 1, 1,
-1.460208, 1.219161, -1.768399, 1, 1, 1, 1, 1,
-1.456137, -1.717176, -2.005126, 1, 1, 1, 1, 1,
-1.450648, 0.3576698, -0.7227011, 1, 1, 1, 1, 1,
-1.449042, 1.372751, -1.364561, 1, 1, 1, 1, 1,
-1.442074, 1.411762, -1.794598, 1, 1, 1, 1, 1,
-1.434619, -0.9597976, -2.925718, 1, 1, 1, 1, 1,
-1.431029, -0.5923989, -1.32081, 0, 0, 1, 1, 1,
-1.420625, -0.311581, -1.900014, 1, 0, 0, 1, 1,
-1.404625, 0.04482658, -1.993821, 1, 0, 0, 1, 1,
-1.403226, -0.6312834, -1.117359, 1, 0, 0, 1, 1,
-1.401591, -2.421235, -3.261738, 1, 0, 0, 1, 1,
-1.399389, -0.1528351, -0.9223102, 1, 0, 0, 1, 1,
-1.392177, -0.9369607, -1.562966, 0, 0, 0, 1, 1,
-1.390889, -2.908123, -4.707488, 0, 0, 0, 1, 1,
-1.381719, 0.02408076, -1.429813, 0, 0, 0, 1, 1,
-1.381708, 0.2876104, -1.455774, 0, 0, 0, 1, 1,
-1.373691, 1.678766, 0.7270166, 0, 0, 0, 1, 1,
-1.366604, -1.179422, -2.642318, 0, 0, 0, 1, 1,
-1.363517, -0.6142938, -0.5083206, 0, 0, 0, 1, 1,
-1.354383, 0.2000202, -1.599768, 1, 1, 1, 1, 1,
-1.353546, 1.189952, 0.05444658, 1, 1, 1, 1, 1,
-1.352264, 1.233883, -0.1671173, 1, 1, 1, 1, 1,
-1.345167, 0.3694805, -0.3874976, 1, 1, 1, 1, 1,
-1.342848, 0.3393498, -0.6267424, 1, 1, 1, 1, 1,
-1.342431, 0.09515544, -1.929703, 1, 1, 1, 1, 1,
-1.341673, 1.098778, -0.7233524, 1, 1, 1, 1, 1,
-1.337994, -0.3606904, -4.700327, 1, 1, 1, 1, 1,
-1.337275, 1.12073, -1.989717, 1, 1, 1, 1, 1,
-1.330281, -0.1711602, -0.4631864, 1, 1, 1, 1, 1,
-1.326738, 1.595622, -0.1454687, 1, 1, 1, 1, 1,
-1.313874, 1.906013, 0.1842963, 1, 1, 1, 1, 1,
-1.312923, 1.675664, -1.61663, 1, 1, 1, 1, 1,
-1.312466, -1.501086, -1.74441, 1, 1, 1, 1, 1,
-1.312414, 0.5263273, -2.567695, 1, 1, 1, 1, 1,
-1.31043, 0.188974, -1.918314, 0, 0, 1, 1, 1,
-1.288417, 0.3834893, -1.493286, 1, 0, 0, 1, 1,
-1.287851, 0.4532121, -2.606483, 1, 0, 0, 1, 1,
-1.268157, -0.4215386, -3.059018, 1, 0, 0, 1, 1,
-1.26614, 0.2424446, -1.338269, 1, 0, 0, 1, 1,
-1.265972, 1.295957, 0.7242384, 1, 0, 0, 1, 1,
-1.265038, -0.0397007, -1.874309, 0, 0, 0, 1, 1,
-1.254293, 0.3538378, -2.711668, 0, 0, 0, 1, 1,
-1.248935, -0.8429105, -1.802217, 0, 0, 0, 1, 1,
-1.243688, 1.59688, -0.3618149, 0, 0, 0, 1, 1,
-1.240978, -0.3109705, -0.2762002, 0, 0, 0, 1, 1,
-1.23264, 1.640818, -1.139076, 0, 0, 0, 1, 1,
-1.225533, 0.7554386, -1.514143, 0, 0, 0, 1, 1,
-1.216262, 0.4316829, -2.05045, 1, 1, 1, 1, 1,
-1.212566, 0.3426313, -0.18041, 1, 1, 1, 1, 1,
-1.205814, 1.370401, 1.389176, 1, 1, 1, 1, 1,
-1.187392, -0.162315, -1.703987, 1, 1, 1, 1, 1,
-1.186904, 2.315921, -0.01613627, 1, 1, 1, 1, 1,
-1.185208, 0.439429, -1.203808, 1, 1, 1, 1, 1,
-1.184148, -3.535498, -4.665392, 1, 1, 1, 1, 1,
-1.181271, -1.069824, -2.923897, 1, 1, 1, 1, 1,
-1.173151, 0.323072, -1.281186, 1, 1, 1, 1, 1,
-1.169023, -0.645335, -2.361811, 1, 1, 1, 1, 1,
-1.157448, 0.1731965, -2.104215, 1, 1, 1, 1, 1,
-1.14473, -0.02216597, -1.673797, 1, 1, 1, 1, 1,
-1.138003, -0.8011372, -1.476221, 1, 1, 1, 1, 1,
-1.131061, 0.219523, -2.358388, 1, 1, 1, 1, 1,
-1.129931, 0.8445868, -0.4479891, 1, 1, 1, 1, 1,
-1.127043, -1.413122, -1.514916, 0, 0, 1, 1, 1,
-1.124286, 0.7073538, -0.3374751, 1, 0, 0, 1, 1,
-1.122204, -1.003256, -2.340679, 1, 0, 0, 1, 1,
-1.121777, -0.3052831, -1.903693, 1, 0, 0, 1, 1,
-1.119197, 0.6174798, -1.358164, 1, 0, 0, 1, 1,
-1.118991, 0.1506052, -1.921442, 1, 0, 0, 1, 1,
-1.114969, 0.529175, 0.5320742, 0, 0, 0, 1, 1,
-1.111033, -2.013001, -3.954684, 0, 0, 0, 1, 1,
-1.10749, 2.638015, -1.479756, 0, 0, 0, 1, 1,
-1.103749, -0.9592747, -1.934944, 0, 0, 0, 1, 1,
-1.095787, 0.3342678, 0.06240092, 0, 0, 0, 1, 1,
-1.095496, 0.4822634, -2.083641, 0, 0, 0, 1, 1,
-1.093835, -0.4230658, -3.370283, 0, 0, 0, 1, 1,
-1.091162, -2.837035, -2.043545, 1, 1, 1, 1, 1,
-1.081245, 0.0440477, -2.669059, 1, 1, 1, 1, 1,
-1.080678, -0.5320941, -2.169097, 1, 1, 1, 1, 1,
-1.056243, 2.906416, -1.39359, 1, 1, 1, 1, 1,
-1.042976, 0.9695995, -1.081629, 1, 1, 1, 1, 1,
-1.037578, -0.9269696, -3.312719, 1, 1, 1, 1, 1,
-1.036402, -0.4639162, -2.968629, 1, 1, 1, 1, 1,
-1.031915, -0.6766617, -2.743078, 1, 1, 1, 1, 1,
-1.024952, -1.8327, -3.478246, 1, 1, 1, 1, 1,
-1.020394, -0.2792151, -0.9519166, 1, 1, 1, 1, 1,
-1.016603, -1.458104, -2.452292, 1, 1, 1, 1, 1,
-1.015989, -1.14211, -1.374645, 1, 1, 1, 1, 1,
-1.00981, 0.8873426, 0.2999031, 1, 1, 1, 1, 1,
-1.008951, 0.03896988, -0.07777974, 1, 1, 1, 1, 1,
-0.9974433, 0.4748476, -1.674855, 1, 1, 1, 1, 1,
-0.9972876, -0.4423114, -1.277656, 0, 0, 1, 1, 1,
-0.995214, -0.4093243, -3.655117, 1, 0, 0, 1, 1,
-0.9917408, -0.1320987, -2.13058, 1, 0, 0, 1, 1,
-0.9898617, -0.5367498, -3.116057, 1, 0, 0, 1, 1,
-0.9829579, 0.4839715, 0.0754979, 1, 0, 0, 1, 1,
-0.9719737, 0.5495992, -2.369516, 1, 0, 0, 1, 1,
-0.9675384, 1.090359, -1.707065, 0, 0, 0, 1, 1,
-0.9518947, -0.01352696, -0.4030616, 0, 0, 0, 1, 1,
-0.9369038, -2.642486, -1.854806, 0, 0, 0, 1, 1,
-0.9367511, 0.5918833, -0.8491529, 0, 0, 0, 1, 1,
-0.9319713, -0.09108127, -1.67985, 0, 0, 0, 1, 1,
-0.9312718, 0.8088252, 0.03775787, 0, 0, 0, 1, 1,
-0.9312654, -0.03693117, -2.124078, 0, 0, 0, 1, 1,
-0.9233336, 0.7787336, -2.267843, 1, 1, 1, 1, 1,
-0.922492, -0.8669545, -2.998602, 1, 1, 1, 1, 1,
-0.921779, 0.7861644, -1.223213, 1, 1, 1, 1, 1,
-0.9187221, 0.3036464, -1.720746, 1, 1, 1, 1, 1,
-0.9127772, 0.1593233, -1.361151, 1, 1, 1, 1, 1,
-0.9031749, -1.006333, -1.686979, 1, 1, 1, 1, 1,
-0.8990837, -1.034249, -1.981015, 1, 1, 1, 1, 1,
-0.895671, -0.3464602, -0.7306231, 1, 1, 1, 1, 1,
-0.8929276, 0.9388773, -1.778819, 1, 1, 1, 1, 1,
-0.8886288, 1.633563, -0.9741631, 1, 1, 1, 1, 1,
-0.8805431, -1.159587, -3.082249, 1, 1, 1, 1, 1,
-0.8722692, 0.6045673, -0.5034623, 1, 1, 1, 1, 1,
-0.8711799, -0.397251, -1.118376, 1, 1, 1, 1, 1,
-0.8684876, -0.1392923, -1.178427, 1, 1, 1, 1, 1,
-0.8651924, -0.5082304, -2.316477, 1, 1, 1, 1, 1,
-0.8630149, -1.242536, -2.734833, 0, 0, 1, 1, 1,
-0.8613318, -2.035905, -3.296808, 1, 0, 0, 1, 1,
-0.8612023, -1.60588, -2.962271, 1, 0, 0, 1, 1,
-0.8584683, -0.5243325, -2.816262, 1, 0, 0, 1, 1,
-0.8536268, -0.1185551, -3.031553, 1, 0, 0, 1, 1,
-0.8510997, 1.67539, 1.052281, 1, 0, 0, 1, 1,
-0.8490887, 0.6611599, -0.3677135, 0, 0, 0, 1, 1,
-0.8418284, -0.4173889, -2.475399, 0, 0, 0, 1, 1,
-0.8403445, -0.1584042, -0.2264919, 0, 0, 0, 1, 1,
-0.8343966, 2.425397, -0.5323379, 0, 0, 0, 1, 1,
-0.8295668, -1.42663, -4.969258, 0, 0, 0, 1, 1,
-0.8248985, -0.1494527, -0.8563093, 0, 0, 0, 1, 1,
-0.8233073, 0.2884065, -2.111758, 0, 0, 0, 1, 1,
-0.8216578, -0.2466279, -1.726106, 1, 1, 1, 1, 1,
-0.8203731, -1.479368, -2.489989, 1, 1, 1, 1, 1,
-0.8142948, 0.4525644, -1.890057, 1, 1, 1, 1, 1,
-0.8123415, -0.4199688, -2.65541, 1, 1, 1, 1, 1,
-0.8107556, -0.9030625, -1.898849, 1, 1, 1, 1, 1,
-0.8029678, 0.612695, -1.031728, 1, 1, 1, 1, 1,
-0.8025813, 0.7811585, -0.3507958, 1, 1, 1, 1, 1,
-0.7979439, -0.5489482, -3.755476, 1, 1, 1, 1, 1,
-0.7979327, -1.346011, -0.4218343, 1, 1, 1, 1, 1,
-0.7951806, 1.635612, 0.05572221, 1, 1, 1, 1, 1,
-0.7891719, 0.6546947, -1.968697, 1, 1, 1, 1, 1,
-0.788641, -0.7918559, -2.340094, 1, 1, 1, 1, 1,
-0.788416, -1.031796, -2.850224, 1, 1, 1, 1, 1,
-0.7810265, -1.404275, -1.830134, 1, 1, 1, 1, 1,
-0.7785466, 0.2818382, -0.6372162, 1, 1, 1, 1, 1,
-0.7780907, 1.110621, -1.678033, 0, 0, 1, 1, 1,
-0.7745119, -0.05370118, -0.1914097, 1, 0, 0, 1, 1,
-0.7733631, -1.057446, -2.869085, 1, 0, 0, 1, 1,
-0.7695016, -0.960162, -0.8636506, 1, 0, 0, 1, 1,
-0.7687183, 0.5310245, -1.876817, 1, 0, 0, 1, 1,
-0.7670017, 1.845931, -0.4832947, 1, 0, 0, 1, 1,
-0.7668849, 0.2566478, -2.095506, 0, 0, 0, 1, 1,
-0.7654097, 1.125365, -0.135054, 0, 0, 0, 1, 1,
-0.7643419, 0.3351577, -1.342296, 0, 0, 0, 1, 1,
-0.7619919, 1.442295, -1.068779, 0, 0, 0, 1, 1,
-0.7472576, -1.563897, -3.298963, 0, 0, 0, 1, 1,
-0.7440128, 0.7068255, -1.33125, 0, 0, 0, 1, 1,
-0.7405995, 0.7211065, 0.8712233, 0, 0, 0, 1, 1,
-0.7353141, 1.267625, -2.091162, 1, 1, 1, 1, 1,
-0.7346839, 1.155961, -0.6965492, 1, 1, 1, 1, 1,
-0.7340147, 0.9352232, 0.08303221, 1, 1, 1, 1, 1,
-0.7326467, -0.4704171, -2.050575, 1, 1, 1, 1, 1,
-0.7315704, -1.776057, -2.518757, 1, 1, 1, 1, 1,
-0.7314172, -2.346759, -1.835876, 1, 1, 1, 1, 1,
-0.7293355, 0.6962163, -1.364188, 1, 1, 1, 1, 1,
-0.7282369, 0.1282216, -3.027006, 1, 1, 1, 1, 1,
-0.718329, 0.3341416, -2.153126, 1, 1, 1, 1, 1,
-0.7144735, 0.0945364, -0.8104895, 1, 1, 1, 1, 1,
-0.7131115, 0.4495233, -0.8638908, 1, 1, 1, 1, 1,
-0.712202, -0.1980171, -1.761309, 1, 1, 1, 1, 1,
-0.7109929, -1.358942, -2.524905, 1, 1, 1, 1, 1,
-0.7103257, 1.179277, -0.8586069, 1, 1, 1, 1, 1,
-0.7056001, -0.0503332, -0.1487971, 1, 1, 1, 1, 1,
-0.703747, 0.7869481, -1.702118, 0, 0, 1, 1, 1,
-0.6973783, -0.2673539, -4.153204, 1, 0, 0, 1, 1,
-0.6933452, 1.158733, 0.1166112, 1, 0, 0, 1, 1,
-0.691615, 0.5342672, -1.285062, 1, 0, 0, 1, 1,
-0.6899231, 1.136592, 0.1417162, 1, 0, 0, 1, 1,
-0.6721269, -0.4152228, -2.454621, 1, 0, 0, 1, 1,
-0.6669139, -0.3950492, -3.644967, 0, 0, 0, 1, 1,
-0.6665173, -1.062321, -2.782596, 0, 0, 0, 1, 1,
-0.6590413, 1.943473, -0.6621888, 0, 0, 0, 1, 1,
-0.6584499, 1.521407, 0.7314249, 0, 0, 0, 1, 1,
-0.6546623, -0.447097, -2.293769, 0, 0, 0, 1, 1,
-0.6545339, -0.03698308, -1.058581, 0, 0, 0, 1, 1,
-0.648999, 0.2483992, -2.096367, 0, 0, 0, 1, 1,
-0.6443678, -0.7708521, -2.445675, 1, 1, 1, 1, 1,
-0.6434777, -0.8703924, -2.130097, 1, 1, 1, 1, 1,
-0.6398572, 0.3995084, -1.559456, 1, 1, 1, 1, 1,
-0.6360303, -0.3967912, -2.649688, 1, 1, 1, 1, 1,
-0.6326288, -0.05714018, -2.271737, 1, 1, 1, 1, 1,
-0.632395, -1.425799, -2.308193, 1, 1, 1, 1, 1,
-0.631314, -1.386588, -3.857664, 1, 1, 1, 1, 1,
-0.6309311, -0.7039853, -1.677851, 1, 1, 1, 1, 1,
-0.6307573, -1.05499, -3.433023, 1, 1, 1, 1, 1,
-0.6303667, 0.5048854, 0.3581778, 1, 1, 1, 1, 1,
-0.6197305, 0.6983756, 0.1850713, 1, 1, 1, 1, 1,
-0.6179692, 1.53065, -0.06114927, 1, 1, 1, 1, 1,
-0.614772, 1.134843, -2.062043, 1, 1, 1, 1, 1,
-0.6089913, 1.148276, -0.1033247, 1, 1, 1, 1, 1,
-0.605283, -0.6278862, -3.108284, 1, 1, 1, 1, 1,
-0.6042415, -1.257512, -1.223467, 0, 0, 1, 1, 1,
-0.603394, -0.7057045, -2.168198, 1, 0, 0, 1, 1,
-0.6022042, 0.7216082, 1.54456, 1, 0, 0, 1, 1,
-0.5994233, 1.482285, -0.4580227, 1, 0, 0, 1, 1,
-0.597136, 0.3895259, 0.2893812, 1, 0, 0, 1, 1,
-0.5931087, 0.5694382, -1.27176, 1, 0, 0, 1, 1,
-0.5919718, 2.100717, -0.2399628, 0, 0, 0, 1, 1,
-0.5915856, 0.07498039, -0.8769729, 0, 0, 0, 1, 1,
-0.5915791, 0.1898078, -1.392511, 0, 0, 0, 1, 1,
-0.5914729, -0.05578401, -0.9245304, 0, 0, 0, 1, 1,
-0.5865771, -0.07924073, -1.493857, 0, 0, 0, 1, 1,
-0.5846108, -0.1599485, -2.086803, 0, 0, 0, 1, 1,
-0.5832657, 0.6189376, -2.177314, 0, 0, 0, 1, 1,
-0.5827553, 1.172724, -0.1841537, 1, 1, 1, 1, 1,
-0.5814992, 0.0338123, -1.442245, 1, 1, 1, 1, 1,
-0.5788606, -0.3152927, -1.527219, 1, 1, 1, 1, 1,
-0.5772821, 0.4978134, -0.7809041, 1, 1, 1, 1, 1,
-0.5742173, -0.4300314, -2.614754, 1, 1, 1, 1, 1,
-0.57299, -1.186406, -2.843453, 1, 1, 1, 1, 1,
-0.5705839, -0.2617725, -2.266142, 1, 1, 1, 1, 1,
-0.5621582, 0.5713519, -1.453063, 1, 1, 1, 1, 1,
-0.5541314, 1.2891, -0.04595338, 1, 1, 1, 1, 1,
-0.5535586, 1.524001, -2.66634, 1, 1, 1, 1, 1,
-0.5500071, -0.9206194, -3.574955, 1, 1, 1, 1, 1,
-0.5473962, 1.322652, -0.1754443, 1, 1, 1, 1, 1,
-0.5453762, -2.018824, -3.348383, 1, 1, 1, 1, 1,
-0.5448134, 0.2192133, -2.213131, 1, 1, 1, 1, 1,
-0.5436718, 1.174227, -0.5920652, 1, 1, 1, 1, 1,
-0.5405789, 0.4655767, -1.747814, 0, 0, 1, 1, 1,
-0.5404218, 0.4056831, -2.32907, 1, 0, 0, 1, 1,
-0.5394266, 0.1410859, 0.7306978, 1, 0, 0, 1, 1,
-0.5269023, 1.155636, -0.3764234, 1, 0, 0, 1, 1,
-0.5243188, 0.7207772, -0.9528711, 1, 0, 0, 1, 1,
-0.5096187, 0.2806221, 0.8306439, 1, 0, 0, 1, 1,
-0.5056271, 1.228921, -0.1189329, 0, 0, 0, 1, 1,
-0.5048516, -0.6230112, -3.558499, 0, 0, 0, 1, 1,
-0.5007352, 0.4668449, -0.1556067, 0, 0, 0, 1, 1,
-0.4991153, -0.284551, -1.462975, 0, 0, 0, 1, 1,
-0.4982343, 0.5993468, -0.9061626, 0, 0, 0, 1, 1,
-0.497888, -1.09904, -1.37173, 0, 0, 0, 1, 1,
-0.4971937, 0.2044057, -1.483805, 0, 0, 0, 1, 1,
-0.4958681, -0.5881965, -2.721904, 1, 1, 1, 1, 1,
-0.4921454, -0.5585686, -2.722371, 1, 1, 1, 1, 1,
-0.4877689, 0.1564577, -2.405515, 1, 1, 1, 1, 1,
-0.4804067, -0.4298482, -3.401624, 1, 1, 1, 1, 1,
-0.4796944, 0.9301671, 0.01724829, 1, 1, 1, 1, 1,
-0.4758971, -0.482857, -2.66095, 1, 1, 1, 1, 1,
-0.4749624, 0.4843005, -1.482525, 1, 1, 1, 1, 1,
-0.4648603, 1.7832, 0.8158906, 1, 1, 1, 1, 1,
-0.4617646, -0.9236514, -1.543757, 1, 1, 1, 1, 1,
-0.461244, -0.9331185, -3.479138, 1, 1, 1, 1, 1,
-0.4577279, 0.3007872, -1.287873, 1, 1, 1, 1, 1,
-0.4552465, 0.2880097, -1.979133, 1, 1, 1, 1, 1,
-0.4540088, 1.122176, -0.9968441, 1, 1, 1, 1, 1,
-0.4532966, 0.8459777, 0.8487727, 1, 1, 1, 1, 1,
-0.446836, 0.1803253, -1.087145, 1, 1, 1, 1, 1,
-0.4466335, -0.3922511, -1.18618, 0, 0, 1, 1, 1,
-0.4442858, -0.3047541, -3.572121, 1, 0, 0, 1, 1,
-0.4435816, -0.809674, -3.880933, 1, 0, 0, 1, 1,
-0.4422619, -0.9430484, -3.495504, 1, 0, 0, 1, 1,
-0.4403129, 1.781033, -0.690558, 1, 0, 0, 1, 1,
-0.4341576, -2.826054, -2.439489, 1, 0, 0, 1, 1,
-0.4338881, 1.148205, -1.225797, 0, 0, 0, 1, 1,
-0.428624, -2.087522, -3.064003, 0, 0, 0, 1, 1,
-0.4259249, -1.820264, -2.658548, 0, 0, 0, 1, 1,
-0.4236336, -1.298291, -3.035252, 0, 0, 0, 1, 1,
-0.4214396, 0.1013432, -1.318807, 0, 0, 0, 1, 1,
-0.4202689, 0.4994639, -0.9055216, 0, 0, 0, 1, 1,
-0.4149441, -0.3561019, -2.674588, 0, 0, 0, 1, 1,
-0.4122341, 1.858316, 1.793652, 1, 1, 1, 1, 1,
-0.4080833, 0.257716, -0.9253636, 1, 1, 1, 1, 1,
-0.4025853, -0.4805115, -1.590029, 1, 1, 1, 1, 1,
-0.3946671, -0.3444269, -3.250226, 1, 1, 1, 1, 1,
-0.3935572, -0.0715609, -0.4733118, 1, 1, 1, 1, 1,
-0.3924491, 0.1035192, -1.548381, 1, 1, 1, 1, 1,
-0.3913463, 0.7912269, -1.633553, 1, 1, 1, 1, 1,
-0.3910922, 0.3067076, -2.301232, 1, 1, 1, 1, 1,
-0.3909431, -0.2723632, -2.8211, 1, 1, 1, 1, 1,
-0.3886127, -1.623182, -3.353494, 1, 1, 1, 1, 1,
-0.385782, 0.5732295, -0.8723338, 1, 1, 1, 1, 1,
-0.3805149, 0.4350488, -0.5417643, 1, 1, 1, 1, 1,
-0.3759016, 0.4519268, -0.5872833, 1, 1, 1, 1, 1,
-0.3757954, -0.06757169, -2.268179, 1, 1, 1, 1, 1,
-0.3734213, 2.201645, 1.768726, 1, 1, 1, 1, 1,
-0.3712825, 0.1094319, -2.761049, 0, 0, 1, 1, 1,
-0.3709567, 2.019232, -0.2467997, 1, 0, 0, 1, 1,
-0.3685472, -0.5904611, -2.409428, 1, 0, 0, 1, 1,
-0.3670627, -1.090738, -1.580875, 1, 0, 0, 1, 1,
-0.3641647, 0.6175546, -1.313549, 1, 0, 0, 1, 1,
-0.3641115, 2.218816, 1.220441, 1, 0, 0, 1, 1,
-0.3637914, 0.1055436, 0.4482768, 0, 0, 0, 1, 1,
-0.3627693, 0.02367371, -0.9094084, 0, 0, 0, 1, 1,
-0.3611215, -0.1587808, -1.302648, 0, 0, 0, 1, 1,
-0.3602979, 1.044424, 0.4757629, 0, 0, 0, 1, 1,
-0.3599716, -0.1483294, -0.4427291, 0, 0, 0, 1, 1,
-0.3528972, -1.15857, -3.660543, 0, 0, 0, 1, 1,
-0.3511429, -0.65518, -2.805521, 0, 0, 0, 1, 1,
-0.3494534, 0.4462089, -0.7035536, 1, 1, 1, 1, 1,
-0.3480166, 0.5718175, -0.8918568, 1, 1, 1, 1, 1,
-0.3451619, -0.4184146, -1.954511, 1, 1, 1, 1, 1,
-0.342384, 0.5620826, -0.643438, 1, 1, 1, 1, 1,
-0.3379544, -0.3363286, -1.590493, 1, 1, 1, 1, 1,
-0.3212415, -0.9292749, -3.98979, 1, 1, 1, 1, 1,
-0.3189723, -0.7022941, -3.867967, 1, 1, 1, 1, 1,
-0.3150422, -0.192509, -0.1974886, 1, 1, 1, 1, 1,
-0.3148027, -0.5770078, -3.188027, 1, 1, 1, 1, 1,
-0.3067459, -0.3335989, -3.097777, 1, 1, 1, 1, 1,
-0.3024285, -2.949654, -2.899168, 1, 1, 1, 1, 1,
-0.3006666, -0.2348786, -0.5250112, 1, 1, 1, 1, 1,
-0.3003945, -0.9947095, -2.995018, 1, 1, 1, 1, 1,
-0.2908702, 0.427917, -2.04776, 1, 1, 1, 1, 1,
-0.290641, -0.1301011, -2.411769, 1, 1, 1, 1, 1,
-0.2889925, -0.06474002, -1.003589, 0, 0, 1, 1, 1,
-0.2875232, -0.6691498, -2.781231, 1, 0, 0, 1, 1,
-0.2863826, -0.7724895, -3.864087, 1, 0, 0, 1, 1,
-0.283137, 0.8609744, 0.9597769, 1, 0, 0, 1, 1,
-0.2822409, 2.617036, -0.4901671, 1, 0, 0, 1, 1,
-0.2766578, 1.307038, -1.329922, 1, 0, 0, 1, 1,
-0.2752765, -1.861817, -2.568879, 0, 0, 0, 1, 1,
-0.2749956, -0.3123639, -2.952492, 0, 0, 0, 1, 1,
-0.2708452, 0.4094231, -1.288017, 0, 0, 0, 1, 1,
-0.2657101, 0.1195422, 0.1592161, 0, 0, 0, 1, 1,
-0.2629446, 0.4612683, -0.7342138, 0, 0, 0, 1, 1,
-0.260493, -0.544445, -4.397251, 0, 0, 0, 1, 1,
-0.2601683, 0.9912545, -1.838537, 0, 0, 0, 1, 1,
-0.2573237, 0.6444441, 0.5057302, 1, 1, 1, 1, 1,
-0.2555423, 1.061167, -0.4189709, 1, 1, 1, 1, 1,
-0.2528268, -0.2951937, -2.780901, 1, 1, 1, 1, 1,
-0.2450841, -0.2149578, -2.134067, 1, 1, 1, 1, 1,
-0.2445266, 0.5022889, 0.6526501, 1, 1, 1, 1, 1,
-0.2374469, -0.1709962, -1.46395, 1, 1, 1, 1, 1,
-0.234218, -0.6728312, -2.134698, 1, 1, 1, 1, 1,
-0.2309851, 0.0457476, -3.079864, 1, 1, 1, 1, 1,
-0.2301523, 0.1309537, -1.817538, 1, 1, 1, 1, 1,
-0.227413, 0.7921636, -1.396535, 1, 1, 1, 1, 1,
-0.2234195, -0.4222803, -4.455225, 1, 1, 1, 1, 1,
-0.2199959, -0.08988201, -2.250097, 1, 1, 1, 1, 1,
-0.2120139, 0.7057689, -0.3085667, 1, 1, 1, 1, 1,
-0.2114479, -0.02885486, -1.007856, 1, 1, 1, 1, 1,
-0.2104109, 0.8754269, -0.1623514, 1, 1, 1, 1, 1,
-0.2078846, -0.2590835, -2.600701, 0, 0, 1, 1, 1,
-0.2078653, -0.3659961, -2.621775, 1, 0, 0, 1, 1,
-0.2077655, -0.114092, -2.435986, 1, 0, 0, 1, 1,
-0.2072202, 0.6610954, 0.965355, 1, 0, 0, 1, 1,
-0.2071242, -0.05669158, -1.799164, 1, 0, 0, 1, 1,
-0.2060214, -0.6123705, -2.95663, 1, 0, 0, 1, 1,
-0.2018314, -1.524623, -1.230944, 0, 0, 0, 1, 1,
-0.1934479, -0.6128505, -5.007397, 0, 0, 0, 1, 1,
-0.1911871, 1.048054, -0.2174844, 0, 0, 0, 1, 1,
-0.1883866, 0.119762, -2.127793, 0, 0, 0, 1, 1,
-0.1870556, -0.2666584, -3.441031, 0, 0, 0, 1, 1,
-0.1792619, -0.6041055, -2.677404, 0, 0, 0, 1, 1,
-0.1775226, -0.2263368, -3.593027, 0, 0, 0, 1, 1,
-0.1767575, -2.075076, -1.795423, 1, 1, 1, 1, 1,
-0.1751073, -0.07136616, -2.678575, 1, 1, 1, 1, 1,
-0.1748992, -0.0653372, -2.347929, 1, 1, 1, 1, 1,
-0.1712975, -1.464564, -1.721727, 1, 1, 1, 1, 1,
-0.1708296, 0.8442042, -0.001231858, 1, 1, 1, 1, 1,
-0.1684203, -0.280356, -1.499426, 1, 1, 1, 1, 1,
-0.1679577, 0.04815109, 0.05909244, 1, 1, 1, 1, 1,
-0.1652069, 0.6495469, -1.700888, 1, 1, 1, 1, 1,
-0.1631469, 1.292634, -1.254244, 1, 1, 1, 1, 1,
-0.1623378, -2.046372, -2.117888, 1, 1, 1, 1, 1,
-0.1589173, -1.721702, -3.322047, 1, 1, 1, 1, 1,
-0.1588939, -0.9138739, -2.578106, 1, 1, 1, 1, 1,
-0.1583668, 1.099146, -1.853609, 1, 1, 1, 1, 1,
-0.1573191, -0.3391787, -2.268343, 1, 1, 1, 1, 1,
-0.1565956, 0.5821757, -0.729187, 1, 1, 1, 1, 1,
-0.1530833, -0.1256542, -3.249858, 0, 0, 1, 1, 1,
-0.152289, 1.022551, 0.1638429, 1, 0, 0, 1, 1,
-0.1510183, -0.793362, -2.903705, 1, 0, 0, 1, 1,
-0.1508518, 0.3589681, -2.141148, 1, 0, 0, 1, 1,
-0.1507149, -0.7439857, -2.772098, 1, 0, 0, 1, 1,
-0.1500859, -0.7434127, -2.580336, 1, 0, 0, 1, 1,
-0.1469949, 0.2606834, 0.6472521, 0, 0, 0, 1, 1,
-0.1451843, -1.918919, -3.248873, 0, 0, 0, 1, 1,
-0.1447642, -0.7780483, -3.888046, 0, 0, 0, 1, 1,
-0.1442285, 0.2778975, 1.166606, 0, 0, 0, 1, 1,
-0.1411748, -0.0155621, -0.5034211, 0, 0, 0, 1, 1,
-0.1389939, -3.519625, -3.479002, 0, 0, 0, 1, 1,
-0.1374893, -0.5586679, -2.73972, 0, 0, 0, 1, 1,
-0.1365751, -0.7757952, -4.951359, 1, 1, 1, 1, 1,
-0.1359473, -0.309384, -2.770134, 1, 1, 1, 1, 1,
-0.1301041, 0.3407969, -1.236798, 1, 1, 1, 1, 1,
-0.1273524, -1.553212, -1.302191, 1, 1, 1, 1, 1,
-0.1263352, -1.755029, -2.79208, 1, 1, 1, 1, 1,
-0.1262938, 0.902826, 1.130857, 1, 1, 1, 1, 1,
-0.1229186, -0.5058274, -2.570445, 1, 1, 1, 1, 1,
-0.1216129, 0.6780859, -0.0436172, 1, 1, 1, 1, 1,
-0.1201809, 1.963119, -0.008204223, 1, 1, 1, 1, 1,
-0.1199549, -0.2889844, -2.52228, 1, 1, 1, 1, 1,
-0.119606, -0.1211306, -3.004238, 1, 1, 1, 1, 1,
-0.1120198, -1.024593, -4.734861, 1, 1, 1, 1, 1,
-0.1086422, 1.019026, 0.2804226, 1, 1, 1, 1, 1,
-0.1084756, 1.061296, -0.7307739, 1, 1, 1, 1, 1,
-0.1082304, -0.4784712, -2.649791, 1, 1, 1, 1, 1,
-0.1034026, -3.18686, -2.300797, 0, 0, 1, 1, 1,
-0.0990342, 0.3874949, 1.525308, 1, 0, 0, 1, 1,
-0.09423248, -0.8126798, -3.513125, 1, 0, 0, 1, 1,
-0.09356523, 0.9429784, -0.6932261, 1, 0, 0, 1, 1,
-0.0907414, -1.102707, -2.773602, 1, 0, 0, 1, 1,
-0.0904517, 0.1250567, -0.2734162, 1, 0, 0, 1, 1,
-0.0869607, -0.5809195, -2.534214, 0, 0, 0, 1, 1,
-0.08328546, 0.9908062, 0.4951985, 0, 0, 0, 1, 1,
-0.08031319, -0.9231035, -3.644257, 0, 0, 0, 1, 1,
-0.0790919, 0.5694558, -0.4018493, 0, 0, 0, 1, 1,
-0.07761335, 0.8681775, -0.493955, 0, 0, 0, 1, 1,
-0.07641149, 1.411854, -0.7469037, 0, 0, 0, 1, 1,
-0.06556389, 0.7880087, 0.1367315, 0, 0, 0, 1, 1,
-0.05774292, -0.2571463, -3.935389, 1, 1, 1, 1, 1,
-0.057112, 1.258903, 1.24482, 1, 1, 1, 1, 1,
-0.05441034, -0.4781163, -1.072024, 1, 1, 1, 1, 1,
-0.05354614, -0.9589554, -3.554123, 1, 1, 1, 1, 1,
-0.05338225, 0.9032384, 2.062279, 1, 1, 1, 1, 1,
-0.05025676, 0.6508503, 1.585972, 1, 1, 1, 1, 1,
-0.04706018, -0.1798855, -2.427037, 1, 1, 1, 1, 1,
-0.04672993, -1.6125, -3.224425, 1, 1, 1, 1, 1,
-0.04584451, -0.2147869, -2.134195, 1, 1, 1, 1, 1,
-0.0453809, 1.336018, -0.7037203, 1, 1, 1, 1, 1,
-0.043786, -2.155921, -1.695941, 1, 1, 1, 1, 1,
-0.04218522, 0.5197409, 2.004176, 1, 1, 1, 1, 1,
-0.0410293, -0.6811718, -1.164844, 1, 1, 1, 1, 1,
-0.04016125, -0.1474856, 0.1113807, 1, 1, 1, 1, 1,
-0.03902832, -0.5085599, -3.069528, 1, 1, 1, 1, 1,
-0.03727612, 0.2029897, 1.439524, 0, 0, 1, 1, 1,
-0.03709622, -0.858156, -3.037979, 1, 0, 0, 1, 1,
-0.03338256, -0.1503386, -1.153974, 1, 0, 0, 1, 1,
-0.03298752, -0.6755467, -2.676067, 1, 0, 0, 1, 1,
-0.03201435, 0.1373619, 0.2596488, 1, 0, 0, 1, 1,
-0.03144777, 0.5801053, -0.4182852, 1, 0, 0, 1, 1,
-0.02996521, 1.38908, -0.5244546, 0, 0, 0, 1, 1,
-0.0274457, -1.23744, -2.802144, 0, 0, 0, 1, 1,
-0.0249605, 0.4333295, -1.227749, 0, 0, 0, 1, 1,
-0.02321571, 0.2660187, 1.209277, 0, 0, 0, 1, 1,
-0.02287137, 0.5429229, 0.9004915, 0, 0, 0, 1, 1,
-0.01878906, 0.5469751, 0.648813, 0, 0, 0, 1, 1,
-0.01559114, -0.9852464, -3.282402, 0, 0, 0, 1, 1,
-0.01402385, -1.283705, -2.773278, 1, 1, 1, 1, 1,
-0.01353576, 1.523462, -0.1882322, 1, 1, 1, 1, 1,
-0.01043514, -0.1294044, -3.249544, 1, 1, 1, 1, 1,
-0.004470225, -0.737453, -2.609831, 1, 1, 1, 1, 1,
0.0003729743, -0.8035808, 3.534629, 1, 1, 1, 1, 1,
0.004093741, 0.84284, -0.5433019, 1, 1, 1, 1, 1,
0.00491671, 0.2614079, 0.9440245, 1, 1, 1, 1, 1,
0.005363861, 0.8523681, -1.196313, 1, 1, 1, 1, 1,
0.005790221, 0.5088558, -1.366066, 1, 1, 1, 1, 1,
0.00734164, 0.4139405, 0.1496071, 1, 1, 1, 1, 1,
0.01079362, 0.160679, 0.9373821, 1, 1, 1, 1, 1,
0.01462102, -1.980961, 1.550404, 1, 1, 1, 1, 1,
0.01561998, 0.1255008, 1.405747, 1, 1, 1, 1, 1,
0.01742662, 0.1415423, 0.4137991, 1, 1, 1, 1, 1,
0.01817783, 0.290957, 1.88513, 1, 1, 1, 1, 1,
0.02190379, 0.6326103, 1.235307, 0, 0, 1, 1, 1,
0.02236394, -1.180845, 3.108626, 1, 0, 0, 1, 1,
0.02261853, 0.1745041, -0.4603115, 1, 0, 0, 1, 1,
0.02274431, 1.105011, 0.3905368, 1, 0, 0, 1, 1,
0.02350009, 0.5218551, 0.1361199, 1, 0, 0, 1, 1,
0.02644406, 0.5560234, -0.3385409, 1, 0, 0, 1, 1,
0.02794457, -0.9631495, 2.974238, 0, 0, 0, 1, 1,
0.02804756, 1.055579, -0.806807, 0, 0, 0, 1, 1,
0.0306574, -0.05742236, 1.677594, 0, 0, 0, 1, 1,
0.0310755, -0.577544, 2.820413, 0, 0, 0, 1, 1,
0.04045334, 0.5072596, -0.2886572, 0, 0, 0, 1, 1,
0.04253393, -1.190524, 0.9158792, 0, 0, 0, 1, 1,
0.04703288, 0.007237784, 3.287056, 0, 0, 0, 1, 1,
0.04976983, 0.02019363, 2.724715, 1, 1, 1, 1, 1,
0.06277235, 1.086757, -1.297585, 1, 1, 1, 1, 1,
0.07010668, -2.219213, 3.535416, 1, 1, 1, 1, 1,
0.07247103, 2.274628, -0.4485904, 1, 1, 1, 1, 1,
0.07360108, 0.2811038, 2.048359, 1, 1, 1, 1, 1,
0.0784257, -0.6033109, 2.877726, 1, 1, 1, 1, 1,
0.07913096, -1.337554, 1.602921, 1, 1, 1, 1, 1,
0.08105128, 0.6949464, 2.145792, 1, 1, 1, 1, 1,
0.0819265, -0.6660834, 3.035037, 1, 1, 1, 1, 1,
0.08259405, 1.065584, 0.2865584, 1, 1, 1, 1, 1,
0.08710328, 0.4923079, -0.8093781, 1, 1, 1, 1, 1,
0.0883688, -2.399026, 2.89085, 1, 1, 1, 1, 1,
0.09000434, -0.7107534, 3.686406, 1, 1, 1, 1, 1,
0.09206098, -0.5117702, 2.309932, 1, 1, 1, 1, 1,
0.09253054, 1.739605, -0.6196378, 1, 1, 1, 1, 1,
0.09575078, -0.1334265, 3.565623, 0, 0, 1, 1, 1,
0.0973804, -0.1626475, 1.282399, 1, 0, 0, 1, 1,
0.1035041, 0.2460828, -0.2694195, 1, 0, 0, 1, 1,
0.1052198, 0.5489452, 1.8142, 1, 0, 0, 1, 1,
0.1062538, -0.5492079, 3.194092, 1, 0, 0, 1, 1,
0.1081477, 0.4548354, -0.7001567, 1, 0, 0, 1, 1,
0.1105591, 0.8231982, -1.116394, 0, 0, 0, 1, 1,
0.1182747, -0.4289536, 2.159379, 0, 0, 0, 1, 1,
0.1226849, 0.7130767, 0.5747896, 0, 0, 0, 1, 1,
0.1271182, -1.079255, 2.025104, 0, 0, 0, 1, 1,
0.1297843, 0.2413505, 0.3448505, 0, 0, 0, 1, 1,
0.134051, -1.444148, 3.338928, 0, 0, 0, 1, 1,
0.1357814, -0.8204702, 2.532912, 0, 0, 0, 1, 1,
0.1377676, -0.100635, 1.437524, 1, 1, 1, 1, 1,
0.1394663, -1.509522, 1.731198, 1, 1, 1, 1, 1,
0.1424939, 0.2643187, 1.295804, 1, 1, 1, 1, 1,
0.1430359, -2.003831, 3.334168, 1, 1, 1, 1, 1,
0.1513826, 0.3062707, -0.946815, 1, 1, 1, 1, 1,
0.1586487, 0.9692345, -0.02597199, 1, 1, 1, 1, 1,
0.1657296, -0.7989255, 3.12947, 1, 1, 1, 1, 1,
0.1673821, -0.4985249, 2.399292, 1, 1, 1, 1, 1,
0.1680124, 1.65388, -0.1393265, 1, 1, 1, 1, 1,
0.1764768, -0.1248244, 4.388205, 1, 1, 1, 1, 1,
0.1778509, -0.3724988, 2.840013, 1, 1, 1, 1, 1,
0.1778632, 1.454172, 0.2141806, 1, 1, 1, 1, 1,
0.1792354, 0.4914138, 0.9847568, 1, 1, 1, 1, 1,
0.186561, -1.2568, 3.467204, 1, 1, 1, 1, 1,
0.1874759, 0.1287989, -0.7963092, 1, 1, 1, 1, 1,
0.1890879, -1.18058, 2.680492, 0, 0, 1, 1, 1,
0.1956014, -0.7707841, 1.90599, 1, 0, 0, 1, 1,
0.199545, 0.5253879, 0.420085, 1, 0, 0, 1, 1,
0.2088229, -0.5995366, 3.127401, 1, 0, 0, 1, 1,
0.208984, -0.9504058, 2.7727, 1, 0, 0, 1, 1,
0.2098139, -1.631035, 4.269189, 1, 0, 0, 1, 1,
0.2134029, -0.8713914, 0.1983381, 0, 0, 0, 1, 1,
0.2153746, -1.973203, 1.595003, 0, 0, 0, 1, 1,
0.2174302, -0.5694915, 2.296521, 0, 0, 0, 1, 1,
0.2195879, -1.879146, 3.25418, 0, 0, 0, 1, 1,
0.2201254, -1.138234, 1.321832, 0, 0, 0, 1, 1,
0.2208246, 1.172375, 0.1152669, 0, 0, 0, 1, 1,
0.2218257, -0.7420195, 2.926625, 0, 0, 0, 1, 1,
0.2222597, 0.6574094, 0.455708, 1, 1, 1, 1, 1,
0.2305179, 0.5327183, 1.84602, 1, 1, 1, 1, 1,
0.2386627, 3.144913, -0.3519416, 1, 1, 1, 1, 1,
0.2387716, -1.074498, 3.534137, 1, 1, 1, 1, 1,
0.2399694, 1.941953, 0.06216775, 1, 1, 1, 1, 1,
0.2456458, 1.804078, -0.7108153, 1, 1, 1, 1, 1,
0.2539889, -0.2309466, 0.3902897, 1, 1, 1, 1, 1,
0.2544348, -1.485421, 4.574345, 1, 1, 1, 1, 1,
0.2558751, 0.3319597, 3.225994, 1, 1, 1, 1, 1,
0.2572822, 1.718756, 1.797732, 1, 1, 1, 1, 1,
0.2575396, 0.311324, 1.12235, 1, 1, 1, 1, 1,
0.2607429, -0.4603188, 2.470541, 1, 1, 1, 1, 1,
0.2624331, 0.7336264, 0.3098463, 1, 1, 1, 1, 1,
0.2630137, 1.70541, -1.443091, 1, 1, 1, 1, 1,
0.2664033, -0.6216757, 0.927842, 1, 1, 1, 1, 1,
0.2666146, -1.621811, 2.78982, 0, 0, 1, 1, 1,
0.2673931, -1.432772, 1.922572, 1, 0, 0, 1, 1,
0.2693247, 0.5359625, 0.2175784, 1, 0, 0, 1, 1,
0.2693257, -1.713524, 4.187754, 1, 0, 0, 1, 1,
0.269658, -0.4803668, 3.240142, 1, 0, 0, 1, 1,
0.2800142, -1.874048, 4.250876, 1, 0, 0, 1, 1,
0.2813405, 1.098663, -1.339617, 0, 0, 0, 1, 1,
0.2852697, -1.160976, 4.013886, 0, 0, 0, 1, 1,
0.2864186, 0.02926148, 2.372624, 0, 0, 0, 1, 1,
0.2917749, 1.474529, -0.7361422, 0, 0, 0, 1, 1,
0.2959045, -0.767017, 1.310681, 0, 0, 0, 1, 1,
0.2959543, -1.12804, 2.28031, 0, 0, 0, 1, 1,
0.3008553, -1.900808, 3.957105, 0, 0, 0, 1, 1,
0.3011, 0.04276258, -0.1637966, 1, 1, 1, 1, 1,
0.3048235, 0.4316644, 0.4263293, 1, 1, 1, 1, 1,
0.3049872, 0.7379407, 0.06689525, 1, 1, 1, 1, 1,
0.3069328, -2.614276, 2.752458, 1, 1, 1, 1, 1,
0.3069792, -0.7598659, 2.244854, 1, 1, 1, 1, 1,
0.3097788, -0.4215047, 3.2816, 1, 1, 1, 1, 1,
0.3134818, 0.06143668, 0.5452397, 1, 1, 1, 1, 1,
0.3163855, -0.07874379, 0.9134413, 1, 1, 1, 1, 1,
0.3178927, 1.735197, 0.4896624, 1, 1, 1, 1, 1,
0.3201198, -1.503357, 3.339063, 1, 1, 1, 1, 1,
0.3225766, -0.4781249, 4.585957, 1, 1, 1, 1, 1,
0.3263158, -0.6292163, 2.888093, 1, 1, 1, 1, 1,
0.334005, 1.66874, -1.30303, 1, 1, 1, 1, 1,
0.3341572, -0.476443, 3.697513, 1, 1, 1, 1, 1,
0.3354604, 0.1246724, 0.3638735, 1, 1, 1, 1, 1,
0.3371212, 1.354641, -1.507082, 0, 0, 1, 1, 1,
0.3401955, 2.194545, 1.629864, 1, 0, 0, 1, 1,
0.3409551, -0.3540829, 4.109496, 1, 0, 0, 1, 1,
0.3494854, 0.4498776, -0.723883, 1, 0, 0, 1, 1,
0.3515298, -2.060276, 3.269689, 1, 0, 0, 1, 1,
0.3638751, -2.643244, 3.601187, 1, 0, 0, 1, 1,
0.3681042, -0.3821546, 1.404747, 0, 0, 0, 1, 1,
0.3701721, -1.079281, 0.08784942, 0, 0, 0, 1, 1,
0.3706984, 1.14222, -0.1616654, 0, 0, 0, 1, 1,
0.3732057, -1.12287, 3.519109, 0, 0, 0, 1, 1,
0.3744726, 0.8943673, 0.914681, 0, 0, 0, 1, 1,
0.3753835, -0.4677878, 1.663489, 0, 0, 0, 1, 1,
0.377693, -1.655408, 3.740738, 0, 0, 0, 1, 1,
0.3792677, -0.5359669, 2.621662, 1, 1, 1, 1, 1,
0.3798963, -1.182991, 3.194319, 1, 1, 1, 1, 1,
0.3799373, 1.232032, 0.8165271, 1, 1, 1, 1, 1,
0.381713, -0.1734843, 2.356649, 1, 1, 1, 1, 1,
0.3829778, 0.4098835, 0.1862034, 1, 1, 1, 1, 1,
0.3831266, -0.6523241, 2.362901, 1, 1, 1, 1, 1,
0.3858781, 1.427205, 0.4676682, 1, 1, 1, 1, 1,
0.3886597, 1.025359, -1.38784, 1, 1, 1, 1, 1,
0.3901764, -2.788704, 2.395563, 1, 1, 1, 1, 1,
0.3925689, -3.042485, 4.062787, 1, 1, 1, 1, 1,
0.3962027, -0.5551183, 3.465586, 1, 1, 1, 1, 1,
0.4073948, -0.8384314, 1.651573, 1, 1, 1, 1, 1,
0.4075652, -1.575911, 3.198458, 1, 1, 1, 1, 1,
0.413315, 0.2990355, 2.576759, 1, 1, 1, 1, 1,
0.4139118, 0.4408635, -0.7945048, 1, 1, 1, 1, 1,
0.4149592, 0.9816319, -0.7168267, 0, 0, 1, 1, 1,
0.4151203, -0.2946417, 2.142237, 1, 0, 0, 1, 1,
0.4203798, -1.080438, 2.444613, 1, 0, 0, 1, 1,
0.4207742, -0.278635, 3.531583, 1, 0, 0, 1, 1,
0.4238839, 0.9280486, -1.341552, 1, 0, 0, 1, 1,
0.4259257, 0.01273505, 0.2774368, 1, 0, 0, 1, 1,
0.4271012, 0.8444239, 2.380381, 0, 0, 0, 1, 1,
0.4300365, 0.4956956, 0.8620666, 0, 0, 0, 1, 1,
0.4344163, 0.5116622, -0.6524847, 0, 0, 0, 1, 1,
0.4379891, 0.1291369, 0.6276571, 0, 0, 0, 1, 1,
0.4389575, 0.9169838, 2.388127, 0, 0, 0, 1, 1,
0.4460506, 0.9154158, 0.239316, 0, 0, 0, 1, 1,
0.4462269, -0.262042, 2.710077, 0, 0, 0, 1, 1,
0.4479438, -0.5414004, 2.266859, 1, 1, 1, 1, 1,
0.4494028, 0.4093015, 0.2994372, 1, 1, 1, 1, 1,
0.4498084, -0.746205, 1.965674, 1, 1, 1, 1, 1,
0.4501872, -0.2341563, 2.648804, 1, 1, 1, 1, 1,
0.4554728, -0.2961526, 3.000416, 1, 1, 1, 1, 1,
0.4561172, 0.613, -0.6110898, 1, 1, 1, 1, 1,
0.4563804, -0.2491729, 1.765086, 1, 1, 1, 1, 1,
0.4589944, 0.4123404, -1.771098, 1, 1, 1, 1, 1,
0.4632151, 1.100216, 0.8297477, 1, 1, 1, 1, 1,
0.4693102, -0.1660589, 2.636702, 1, 1, 1, 1, 1,
0.4724404, -0.539578, 1.625109, 1, 1, 1, 1, 1,
0.472562, -1.320855, 4.795511, 1, 1, 1, 1, 1,
0.4752447, 0.2558178, -0.02646021, 1, 1, 1, 1, 1,
0.4861075, -1.029389, 3.114727, 1, 1, 1, 1, 1,
0.489622, 2.394631, 0.1483189, 1, 1, 1, 1, 1,
0.4909099, -0.04814171, 2.389533, 0, 0, 1, 1, 1,
0.4944242, -0.0982812, 3.213567, 1, 0, 0, 1, 1,
0.4966582, 0.2837883, 0.9825603, 1, 0, 0, 1, 1,
0.4970588, 0.5940858, 0.661043, 1, 0, 0, 1, 1,
0.498417, -0.3104474, 2.991498, 1, 0, 0, 1, 1,
0.5009252, -0.6089343, 2.754304, 1, 0, 0, 1, 1,
0.5160438, -0.9836289, 1.672269, 0, 0, 0, 1, 1,
0.5168842, -0.1991623, 2.979201, 0, 0, 0, 1, 1,
0.5229584, 1.482034, 0.2582432, 0, 0, 0, 1, 1,
0.524603, 1.684414, -0.2907417, 0, 0, 0, 1, 1,
0.5253128, -0.3230589, 1.860455, 0, 0, 0, 1, 1,
0.5255744, 0.2729426, 1.313345, 0, 0, 0, 1, 1,
0.5268205, 0.1795609, 2.238084, 0, 0, 0, 1, 1,
0.5335014, 1.480324, 1.333668, 1, 1, 1, 1, 1,
0.5407166, 0.483608, 0.9164596, 1, 1, 1, 1, 1,
0.5424858, -2.970008, 4.077599, 1, 1, 1, 1, 1,
0.5429617, -0.603493, 1.781536, 1, 1, 1, 1, 1,
0.5541889, -1.887591, 2.835708, 1, 1, 1, 1, 1,
0.5564951, 0.3097518, 0.6779124, 1, 1, 1, 1, 1,
0.5583246, 2.332972, 0.7759748, 1, 1, 1, 1, 1,
0.5596833, 1.134133, 1.257723, 1, 1, 1, 1, 1,
0.5645195, 0.9320084, 1.398857, 1, 1, 1, 1, 1,
0.5687237, -0.9141104, 1.210051, 1, 1, 1, 1, 1,
0.5701481, 0.6649938, 2.34898, 1, 1, 1, 1, 1,
0.5785091, 0.4791926, 0.6674679, 1, 1, 1, 1, 1,
0.579703, -0.8119271, 2.012806, 1, 1, 1, 1, 1,
0.5869818, 0.4547811, 1.068295, 1, 1, 1, 1, 1,
0.5935799, 0.451757, 0.9784588, 1, 1, 1, 1, 1,
0.5963046, -0.63446, 3.056422, 0, 0, 1, 1, 1,
0.6018199, -1.607413, 3.633981, 1, 0, 0, 1, 1,
0.6031319, 0.4750704, 1.342968, 1, 0, 0, 1, 1,
0.6108552, 0.1087665, 1.390912, 1, 0, 0, 1, 1,
0.6158794, -0.8626832, 3.308534, 1, 0, 0, 1, 1,
0.6161482, 0.7084242, 0.7249641, 1, 0, 0, 1, 1,
0.6183025, -1.276817, 2.495477, 0, 0, 0, 1, 1,
0.6213978, -1.961587, 2.662469, 0, 0, 0, 1, 1,
0.6253332, -0.520402, 2.839342, 0, 0, 0, 1, 1,
0.6261497, 1.267677, 0.9128217, 0, 0, 0, 1, 1,
0.6306506, 0.5285526, -0.08370324, 0, 0, 0, 1, 1,
0.6379108, 1.199086, 0.7152072, 0, 0, 0, 1, 1,
0.6380863, -0.8994199, 2.746415, 0, 0, 0, 1, 1,
0.6388078, -0.7859015, 2.251401, 1, 1, 1, 1, 1,
0.6429621, 0.4409902, 2.443298, 1, 1, 1, 1, 1,
0.6451139, 0.9222212, 1.017417, 1, 1, 1, 1, 1,
0.646996, -0.5892071, 0.9582378, 1, 1, 1, 1, 1,
0.6503333, -0.700017, 2.328905, 1, 1, 1, 1, 1,
0.6541898, -1.451065, 3.994542, 1, 1, 1, 1, 1,
0.6544572, 0.6900211, 0.6372044, 1, 1, 1, 1, 1,
0.6561311, 0.710422, 2.014306, 1, 1, 1, 1, 1,
0.6595379, 0.7297384, 0.5941567, 1, 1, 1, 1, 1,
0.6605098, -0.149799, 2.077347, 1, 1, 1, 1, 1,
0.664012, -0.4714854, 2.977562, 1, 1, 1, 1, 1,
0.6744385, 1.191501, -0.275321, 1, 1, 1, 1, 1,
0.6775999, 0.2947787, 2.223701, 1, 1, 1, 1, 1,
0.680284, 0.9028701, 0.1834626, 1, 1, 1, 1, 1,
0.6822638, 0.5532729, -0.2162152, 1, 1, 1, 1, 1,
0.6860222, -0.5434984, 0.6635957, 0, 0, 1, 1, 1,
0.6912279, -0.2502176, 2.872222, 1, 0, 0, 1, 1,
0.6961312, 0.5075216, 2.054392, 1, 0, 0, 1, 1,
0.698606, 0.5083423, 0.898632, 1, 0, 0, 1, 1,
0.699351, -0.1557276, 1.128195, 1, 0, 0, 1, 1,
0.7025889, -0.7317146, 2.474675, 1, 0, 0, 1, 1,
0.7073433, 0.1290732, 2.966615, 0, 0, 0, 1, 1,
0.7077376, 1.258181, 0.7563946, 0, 0, 0, 1, 1,
0.7087669, -0.2542239, 2.102558, 0, 0, 0, 1, 1,
0.7146387, 1.486067, -1.80325, 0, 0, 0, 1, 1,
0.7156988, 0.2203714, 0.4024116, 0, 0, 0, 1, 1,
0.7196993, -0.59045, 0.8580001, 0, 0, 0, 1, 1,
0.7213843, 0.8553495, -1.918462, 0, 0, 0, 1, 1,
0.7242246, 0.060892, 1.241992, 1, 1, 1, 1, 1,
0.7258048, -1.564887, 2.565199, 1, 1, 1, 1, 1,
0.7282166, 0.6082634, 0.3779583, 1, 1, 1, 1, 1,
0.7344843, 2.180849, 2.165295, 1, 1, 1, 1, 1,
0.7428557, -0.1311938, 1.09451, 1, 1, 1, 1, 1,
0.7454898, -0.5263633, 1.715142, 1, 1, 1, 1, 1,
0.7456525, 0.6544992, 1.713434, 1, 1, 1, 1, 1,
0.7490969, -0.6554095, 2.429378, 1, 1, 1, 1, 1,
0.7505581, -1.061884, 1.940995, 1, 1, 1, 1, 1,
0.7527127, 1.555787, -0.02452339, 1, 1, 1, 1, 1,
0.758838, -0.4912262, 1.47972, 1, 1, 1, 1, 1,
0.7641856, 1.381245, 0.2982196, 1, 1, 1, 1, 1,
0.776659, 0.1842035, 0.4305879, 1, 1, 1, 1, 1,
0.7837909, -0.3782627, 3.057647, 1, 1, 1, 1, 1,
0.7889504, -0.4984944, 3.970531, 1, 1, 1, 1, 1,
0.7924455, -0.2673887, 1.346076, 0, 0, 1, 1, 1,
0.7950939, -1.889467, 4.458108, 1, 0, 0, 1, 1,
0.7976683, -0.2954856, 1.076572, 1, 0, 0, 1, 1,
0.799877, 1.269534, 0.7634264, 1, 0, 0, 1, 1,
0.8028126, 1.509861, -0.9622869, 1, 0, 0, 1, 1,
0.8042167, -0.9970902, 3.036661, 1, 0, 0, 1, 1,
0.8208855, 0.1998962, 1.562006, 0, 0, 0, 1, 1,
0.8311266, 0.1028278, 2.221791, 0, 0, 0, 1, 1,
0.8368217, -0.4007253, 3.226891, 0, 0, 0, 1, 1,
0.8383263, 0.5201167, 0.7502456, 0, 0, 0, 1, 1,
0.8423504, 0.5913754, -1.976749, 0, 0, 0, 1, 1,
0.8459094, 0.3790727, 1.532623, 0, 0, 0, 1, 1,
0.8482625, 0.09847713, 0.6327756, 0, 0, 0, 1, 1,
0.8534329, -2.727026, 3.196728, 1, 1, 1, 1, 1,
0.8543207, 0.1055867, 3.107493, 1, 1, 1, 1, 1,
0.8587744, 0.6521819, 0.4588288, 1, 1, 1, 1, 1,
0.865833, -0.5818497, 3.619592, 1, 1, 1, 1, 1,
0.8661992, 0.180523, 2.496879, 1, 1, 1, 1, 1,
0.8670295, 0.8497093, -0.02629771, 1, 1, 1, 1, 1,
0.8671028, 0.0998083, 2.967561, 1, 1, 1, 1, 1,
0.8677787, -0.8882377, 2.933673, 1, 1, 1, 1, 1,
0.8747061, -1.164921, 4.56464, 1, 1, 1, 1, 1,
0.8747124, -1.710682, 1.441661, 1, 1, 1, 1, 1,
0.8773542, -0.1547276, 1.803758, 1, 1, 1, 1, 1,
0.8804735, 0.9742573, -0.0973297, 1, 1, 1, 1, 1,
0.8855065, -0.208165, 1.503624, 1, 1, 1, 1, 1,
0.8935651, -2.495055, 4.323675, 1, 1, 1, 1, 1,
0.8936644, 0.7753648, 0.8649495, 1, 1, 1, 1, 1,
0.8958579, -0.2041528, -0.3045922, 0, 0, 1, 1, 1,
0.9111557, 0.09688054, 2.608094, 1, 0, 0, 1, 1,
0.912646, -0.7376919, 1.496147, 1, 0, 0, 1, 1,
0.9133352, 0.1963126, 2.538974, 1, 0, 0, 1, 1,
0.9133624, 1.716786, 0.8735787, 1, 0, 0, 1, 1,
0.9136016, 0.8592098, 2.006095, 1, 0, 0, 1, 1,
0.9182383, -0.462984, 2.359416, 0, 0, 0, 1, 1,
0.9242011, -0.4576446, 0.3056839, 0, 0, 0, 1, 1,
0.9334891, 1.214193, 0.475985, 0, 0, 0, 1, 1,
0.9402478, -0.4042248, 2.524071, 0, 0, 0, 1, 1,
0.9476857, 0.3390679, 1.702456, 0, 0, 0, 1, 1,
0.9605039, -0.7287819, 3.450383, 0, 0, 0, 1, 1,
0.9665345, -0.8809729, 2.372196, 0, 0, 0, 1, 1,
0.9698293, 0.7018112, 2.133409, 1, 1, 1, 1, 1,
0.97945, 1.262528, 0.2307408, 1, 1, 1, 1, 1,
0.9816931, -0.7940134, 1.736982, 1, 1, 1, 1, 1,
0.9882496, 0.08977499, 0.3089076, 1, 1, 1, 1, 1,
0.996635, 0.2041565, 1.581271, 1, 1, 1, 1, 1,
1.002373, 0.06264713, 1.489009, 1, 1, 1, 1, 1,
1.003553, 0.06869446, 0.7670131, 1, 1, 1, 1, 1,
1.009331, 1.076123, -0.1070022, 1, 1, 1, 1, 1,
1.009528, -0.8951723, 3.817627, 1, 1, 1, 1, 1,
1.019105, 0.5485075, -0.4671807, 1, 1, 1, 1, 1,
1.020999, -0.3702086, -0.1301153, 1, 1, 1, 1, 1,
1.033494, 0.5123511, 1.815804, 1, 1, 1, 1, 1,
1.03367, 0.1916156, 1.095139, 1, 1, 1, 1, 1,
1.043138, -0.06578231, 1.378387, 1, 1, 1, 1, 1,
1.047408, -2.166686, 3.824709, 1, 1, 1, 1, 1,
1.049329, 0.5629926, 2.340447, 0, 0, 1, 1, 1,
1.054812, -0.2618585, 0.3765104, 1, 0, 0, 1, 1,
1.056817, -0.03071912, 1.13496, 1, 0, 0, 1, 1,
1.059916, -1.723302, 0.8914616, 1, 0, 0, 1, 1,
1.061561, -0.3724212, 0.146531, 1, 0, 0, 1, 1,
1.068665, -1.508768, 2.590429, 1, 0, 0, 1, 1,
1.071415, 0.4946495, 2.231508, 0, 0, 0, 1, 1,
1.071838, 0.7025005, 2.438693, 0, 0, 0, 1, 1,
1.089007, -0.372658, 1.331824, 0, 0, 0, 1, 1,
1.100298, 0.1993759, 2.243263, 0, 0, 0, 1, 1,
1.102868, 0.9816683, 0.6681908, 0, 0, 0, 1, 1,
1.103022, -1.642624, 2.412527, 0, 0, 0, 1, 1,
1.103445, 0.3575852, 2.13478, 0, 0, 0, 1, 1,
1.122562, 1.400328, 1.12053, 1, 1, 1, 1, 1,
1.124255, -0.7770371, 3.022366, 1, 1, 1, 1, 1,
1.125203, -0.06754196, 0.1917776, 1, 1, 1, 1, 1,
1.128016, 0.5183208, 2.826508, 1, 1, 1, 1, 1,
1.129927, 2.242312, 1.351967, 1, 1, 1, 1, 1,
1.130776, -0.6035132, 1.270793, 1, 1, 1, 1, 1,
1.133069, 1.486552, 1.465085, 1, 1, 1, 1, 1,
1.138163, -1.040414, 1.750702, 1, 1, 1, 1, 1,
1.140388, -0.03193028, 1.552634, 1, 1, 1, 1, 1,
1.152201, -0.8251362, 1.866899, 1, 1, 1, 1, 1,
1.158067, -1.699789, 3.180799, 1, 1, 1, 1, 1,
1.160133, -0.4273549, 2.576046, 1, 1, 1, 1, 1,
1.160632, -1.726251, 2.170545, 1, 1, 1, 1, 1,
1.16672, -1.05838, 2.036062, 1, 1, 1, 1, 1,
1.169817, 1.241925, 0.5408992, 1, 1, 1, 1, 1,
1.173345, -0.1799507, 2.611974, 0, 0, 1, 1, 1,
1.185036, -0.9331042, 2.197648, 1, 0, 0, 1, 1,
1.188767, 0.5529033, -0.6890579, 1, 0, 0, 1, 1,
1.199568, -0.6358135, 2.966214, 1, 0, 0, 1, 1,
1.206402, -0.1477366, 1.616461, 1, 0, 0, 1, 1,
1.21142, -1.037559, 1.773856, 1, 0, 0, 1, 1,
1.213291, -1.233976, 1.624777, 0, 0, 0, 1, 1,
1.215595, -0.1849228, 0.5617334, 0, 0, 0, 1, 1,
1.215841, 1.446152, 0.1001184, 0, 0, 0, 1, 1,
1.222074, 1.209578, 1.367573, 0, 0, 0, 1, 1,
1.244389, 0.09475159, 3.476678, 0, 0, 0, 1, 1,
1.252956, 0.2380463, 0.7460421, 0, 0, 0, 1, 1,
1.256733, -0.1671716, 0.6219044, 0, 0, 0, 1, 1,
1.266363, 1.508245, 1.521877, 1, 1, 1, 1, 1,
1.26927, 0.143003, 1.716637, 1, 1, 1, 1, 1,
1.282215, 0.3578713, 2.89186, 1, 1, 1, 1, 1,
1.284281, 0.4888535, 1.848452, 1, 1, 1, 1, 1,
1.290014, -0.3300263, 1.042308, 1, 1, 1, 1, 1,
1.293141, 0.6407257, -0.1281555, 1, 1, 1, 1, 1,
1.295274, -0.4419316, 1.922708, 1, 1, 1, 1, 1,
1.302336, -1.532005, 3.198221, 1, 1, 1, 1, 1,
1.309411, 1.572462, -0.1900989, 1, 1, 1, 1, 1,
1.31217, 0.1855234, 2.10553, 1, 1, 1, 1, 1,
1.315004, -0.9012383, 0.4971701, 1, 1, 1, 1, 1,
1.322252, -0.9676235, 3.420938, 1, 1, 1, 1, 1,
1.322287, 0.8893269, 0.3704893, 1, 1, 1, 1, 1,
1.323894, 1.643936, -0.5884755, 1, 1, 1, 1, 1,
1.324436, 0.225427, 1.210243, 1, 1, 1, 1, 1,
1.327761, 1.705254, 2.876674, 0, 0, 1, 1, 1,
1.331296, -0.3594875, 3.818903, 1, 0, 0, 1, 1,
1.334733, 0.4073216, 3.470156, 1, 0, 0, 1, 1,
1.34214, -0.6229311, -0.2367994, 1, 0, 0, 1, 1,
1.342978, 0.865807, -0.05030133, 1, 0, 0, 1, 1,
1.348467, -0.6673404, 2.78074, 1, 0, 0, 1, 1,
1.34871, 0.2558508, 1.744101, 0, 0, 0, 1, 1,
1.352545, -1.465421, 2.953653, 0, 0, 0, 1, 1,
1.355383, 0.3821792, 1.582808, 0, 0, 0, 1, 1,
1.35762, -0.03037065, 1.542301, 0, 0, 0, 1, 1,
1.360093, -0.7048292, 2.760803, 0, 0, 0, 1, 1,
1.378405, 1.632302, -0.8770146, 0, 0, 0, 1, 1,
1.384642, -0.09170096, 1.247079, 0, 0, 0, 1, 1,
1.385859, -0.8783966, 2.521111, 1, 1, 1, 1, 1,
1.393765, -0.2286457, 2.428186, 1, 1, 1, 1, 1,
1.402184, -0.2466896, 2.680291, 1, 1, 1, 1, 1,
1.402964, 2.643981, 0.8910167, 1, 1, 1, 1, 1,
1.407998, 1.053269, 2.213335, 1, 1, 1, 1, 1,
1.415007, -1.273518, 3.755719, 1, 1, 1, 1, 1,
1.421843, -0.3044659, 2.733806, 1, 1, 1, 1, 1,
1.424664, -2.513347, 2.560755, 1, 1, 1, 1, 1,
1.426737, -0.06858465, 3.115537, 1, 1, 1, 1, 1,
1.433084, -0.2123818, 2.05171, 1, 1, 1, 1, 1,
1.44746, 0.5611581, 0.9616601, 1, 1, 1, 1, 1,
1.452668, 0.8204226, 0.5330836, 1, 1, 1, 1, 1,
1.468123, 0.9021232, 1.597591, 1, 1, 1, 1, 1,
1.473048, -1.630912, 4.201443, 1, 1, 1, 1, 1,
1.478714, 0.4688005, 0.084249, 1, 1, 1, 1, 1,
1.480383, 1.675374, 1.186768, 0, 0, 1, 1, 1,
1.491203, -1.053257, 4.567474, 1, 0, 0, 1, 1,
1.498569, -1.15156, 1.41975, 1, 0, 0, 1, 1,
1.509486, 0.1716406, 2.300345, 1, 0, 0, 1, 1,
1.517855, -0.5938047, 2.341931, 1, 0, 0, 1, 1,
1.532783, -0.3628621, 1.718428, 1, 0, 0, 1, 1,
1.535931, 0.4297052, 2.294934, 0, 0, 0, 1, 1,
1.536005, -1.242467, 2.503316, 0, 0, 0, 1, 1,
1.552009, 0.7296211, 0.5541548, 0, 0, 0, 1, 1,
1.570742, -0.9217249, 2.846249, 0, 0, 0, 1, 1,
1.572613, 0.4919555, 2.27945, 0, 0, 0, 1, 1,
1.584864, 0.7583387, 2.278872, 0, 0, 0, 1, 1,
1.596913, 0.6836897, 0.5742388, 0, 0, 0, 1, 1,
1.598049, 0.2946103, 1.230317, 1, 1, 1, 1, 1,
1.605546, 0.2944124, 1.174764, 1, 1, 1, 1, 1,
1.607254, -0.9416755, 3.247586, 1, 1, 1, 1, 1,
1.607949, -1.421575, 2.526993, 1, 1, 1, 1, 1,
1.613797, 0.6375632, 0.4190812, 1, 1, 1, 1, 1,
1.621667, -1.860518, 2.206751, 1, 1, 1, 1, 1,
1.622468, 2.344986, 0.04917315, 1, 1, 1, 1, 1,
1.627587, -1.158489, 4.70658, 1, 1, 1, 1, 1,
1.629892, -1.313817, 1.451346, 1, 1, 1, 1, 1,
1.630201, -0.3434534, 2.777351, 1, 1, 1, 1, 1,
1.633401, 1.107204, 0.2184354, 1, 1, 1, 1, 1,
1.639751, -1.155859, 4.165296, 1, 1, 1, 1, 1,
1.649145, -0.1477846, -0.02874133, 1, 1, 1, 1, 1,
1.652107, 0.3626818, -0.1668964, 1, 1, 1, 1, 1,
1.671252, 1.190142, 0.9462249, 1, 1, 1, 1, 1,
1.685844, -0.4718904, 1.400099, 0, 0, 1, 1, 1,
1.692426, -0.01969499, 0.3060554, 1, 0, 0, 1, 1,
1.692504, -1.31, 3.119156, 1, 0, 0, 1, 1,
1.695768, 1.462425, -0.3854635, 1, 0, 0, 1, 1,
1.703698, -0.2197618, 1.210165, 1, 0, 0, 1, 1,
1.705576, -0.638561, 1.472535, 1, 0, 0, 1, 1,
1.707877, -0.06739088, 0.9964745, 0, 0, 0, 1, 1,
1.715158, -1.058099, 1.540814, 0, 0, 0, 1, 1,
1.737682, -0.4625497, 1.832693, 0, 0, 0, 1, 1,
1.738832, 0.8730506, 1.279422, 0, 0, 0, 1, 1,
1.741382, -0.007326947, -0.4227859, 0, 0, 0, 1, 1,
1.752956, -1.264975, 0.4799338, 0, 0, 0, 1, 1,
1.755042, 0.9644887, 1.811718, 0, 0, 0, 1, 1,
1.765829, 0.6444083, 2.088655, 1, 1, 1, 1, 1,
1.787544, -0.3073603, 1.039065, 1, 1, 1, 1, 1,
1.802639, -0.9794182, 3.028194, 1, 1, 1, 1, 1,
1.80458, -0.2988681, 2.558718, 1, 1, 1, 1, 1,
1.813387, 1.150972, 0.559932, 1, 1, 1, 1, 1,
1.844961, 0.3063719, 1.220854, 1, 1, 1, 1, 1,
1.84513, 0.7777486, -0.7450576, 1, 1, 1, 1, 1,
1.872209, 0.7625186, 0.7625893, 1, 1, 1, 1, 1,
1.89744, 0.6111931, 2.672186, 1, 1, 1, 1, 1,
1.90095, 1.465588, 1.555178, 1, 1, 1, 1, 1,
1.9139, 1.056985, 2.833768, 1, 1, 1, 1, 1,
1.95054, 1.456465, 1.913175, 1, 1, 1, 1, 1,
1.971724, -0.2272716, 0.646531, 1, 1, 1, 1, 1,
1.976316, -0.9402812, 1.4781, 1, 1, 1, 1, 1,
1.991001, 0.875033, 0.2364997, 1, 1, 1, 1, 1,
1.995009, 1.444779, 1.570511, 0, 0, 1, 1, 1,
2.010055, -0.08971737, 0.4406766, 1, 0, 0, 1, 1,
2.043181, -0.7324457, 3.624395, 1, 0, 0, 1, 1,
2.049505, -0.6296799, -0.5856774, 1, 0, 0, 1, 1,
2.146538, 0.7584127, 0.778713, 1, 0, 0, 1, 1,
2.177612, -0.4552591, 2.399269, 1, 0, 0, 1, 1,
2.209917, 0.3192923, 1.251812, 0, 0, 0, 1, 1,
2.211576, -0.3580522, 1.370991, 0, 0, 0, 1, 1,
2.222198, 0.3424367, 1.220565, 0, 0, 0, 1, 1,
2.222968, 0.6734143, 1.803043, 0, 0, 0, 1, 1,
2.266582, -0.1411437, 0.4083086, 0, 0, 0, 1, 1,
2.274353, 0.1530122, 2.592445, 0, 0, 0, 1, 1,
2.274773, 1.974785, 1.392528, 0, 0, 0, 1, 1,
2.279998, 0.4633103, 0.3489904, 1, 1, 1, 1, 1,
2.286183, 0.6919525, 1.384005, 1, 1, 1, 1, 1,
2.307697, 1.287713, 1.146293, 1, 1, 1, 1, 1,
2.416635, 1.003474, 1.129806, 1, 1, 1, 1, 1,
2.435649, 0.6418548, 1.812893, 1, 1, 1, 1, 1,
2.635825, 0.02828785, -0.567077, 1, 1, 1, 1, 1,
2.661248, -0.3898476, 2.597924, 1, 1, 1, 1, 1
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
var radius = 9.284653;
var distance = 32.61195;
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
mvMatrix.translate( 0.3810414, 0.05483413, 0.105943 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.61195);
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
