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
-3.005013, -1.837022, -2.080106, 1, 0, 0, 1,
-2.817061, -0.5364181, -0.6571742, 1, 0.007843138, 0, 1,
-2.633648, -0.3152134, 0.8300769, 1, 0.01176471, 0, 1,
-2.572385, 0.2981497, -0.7264867, 1, 0.01960784, 0, 1,
-2.540775, -1.720008, -1.231107, 1, 0.02352941, 0, 1,
-2.484742, -0.8586851, -2.650737, 1, 0.03137255, 0, 1,
-2.419873, 0.6756576, -2.116628, 1, 0.03529412, 0, 1,
-2.334928, 0.5898008, -2.513366, 1, 0.04313726, 0, 1,
-2.237897, 0.8928315, -2.21921, 1, 0.04705882, 0, 1,
-2.206653, -0.3182893, -2.780292, 1, 0.05490196, 0, 1,
-2.178456, -0.02124337, -1.871522, 1, 0.05882353, 0, 1,
-2.14649, -0.04928489, -0.3556625, 1, 0.06666667, 0, 1,
-2.120858, 1.450876, 0.8472491, 1, 0.07058824, 0, 1,
-2.117903, -0.2033616, -2.279512, 1, 0.07843138, 0, 1,
-2.116634, -0.396237, -2.856758, 1, 0.08235294, 0, 1,
-2.107237, -0.08035324, -0.05871056, 1, 0.09019608, 0, 1,
-2.069451, 0.1955746, -1.583389, 1, 0.09411765, 0, 1,
-2.068621, -1.375883, -1.691639, 1, 0.1019608, 0, 1,
-2.034618, 0.4503375, -1.89696, 1, 0.1098039, 0, 1,
-2.010593, -0.4848026, -2.041383, 1, 0.1137255, 0, 1,
-1.996111, -0.01778044, -3.383424, 1, 0.1215686, 0, 1,
-1.987803, 0.4445385, -2.476123, 1, 0.1254902, 0, 1,
-1.971678, 1.240473, -1.955582, 1, 0.1333333, 0, 1,
-1.939077, -0.0606766, -0.6510125, 1, 0.1372549, 0, 1,
-1.881265, -0.1363845, -1.302657, 1, 0.145098, 0, 1,
-1.874647, -0.3826588, -1.578954, 1, 0.1490196, 0, 1,
-1.835835, 0.9032214, -2.489573, 1, 0.1568628, 0, 1,
-1.82584, 1.591582, -1.841202, 1, 0.1607843, 0, 1,
-1.825353, -0.7841316, -3.599906, 1, 0.1686275, 0, 1,
-1.823434, 0.2644189, -1.226001, 1, 0.172549, 0, 1,
-1.823348, 0.600501, -1.68511, 1, 0.1803922, 0, 1,
-1.823001, -1.160876, -2.542238, 1, 0.1843137, 0, 1,
-1.785341, 0.575349, -1.260269, 1, 0.1921569, 0, 1,
-1.778046, -1.629239, -3.131879, 1, 0.1960784, 0, 1,
-1.770543, 1.750385, -2.799318, 1, 0.2039216, 0, 1,
-1.760801, 0.9073827, -0.4973398, 1, 0.2117647, 0, 1,
-1.751642, -1.168251, -2.141268, 1, 0.2156863, 0, 1,
-1.740477, -1.57069, -1.213534, 1, 0.2235294, 0, 1,
-1.725215, -0.9520705, -3.06622, 1, 0.227451, 0, 1,
-1.724108, 0.1793389, -2.493913, 1, 0.2352941, 0, 1,
-1.723287, -0.6042637, -1.633092, 1, 0.2392157, 0, 1,
-1.717102, -1.8828, -2.238507, 1, 0.2470588, 0, 1,
-1.703788, -0.7558147, -1.533148, 1, 0.2509804, 0, 1,
-1.685163, -1.461311, -3.273752, 1, 0.2588235, 0, 1,
-1.684019, -0.0003132286, -3.468495, 1, 0.2627451, 0, 1,
-1.671571, 1.439018, -0.563131, 1, 0.2705882, 0, 1,
-1.669664, -0.6688157, -0.6595913, 1, 0.2745098, 0, 1,
-1.650584, -0.7302743, -4.496918, 1, 0.282353, 0, 1,
-1.649838, 1.599789, -2.952343, 1, 0.2862745, 0, 1,
-1.638817, 0.8844041, -1.458222, 1, 0.2941177, 0, 1,
-1.637389, 0.4582703, -2.906797, 1, 0.3019608, 0, 1,
-1.631903, 1.30425, -0.268362, 1, 0.3058824, 0, 1,
-1.612155, 0.04851135, -2.41293, 1, 0.3137255, 0, 1,
-1.599511, 1.836128, -2.133047, 1, 0.3176471, 0, 1,
-1.589063, 0.3353074, -0.2751714, 1, 0.3254902, 0, 1,
-1.584608, -1.054442, -2.317009, 1, 0.3294118, 0, 1,
-1.582725, -0.3640056, -1.824405, 1, 0.3372549, 0, 1,
-1.577753, -0.8330145, -1.684102, 1, 0.3411765, 0, 1,
-1.551397, -0.1563275, 0.2581849, 1, 0.3490196, 0, 1,
-1.549683, 0.3052782, -1.986536, 1, 0.3529412, 0, 1,
-1.543526, 0.4869803, -2.200818, 1, 0.3607843, 0, 1,
-1.542306, 0.4680488, -0.8759885, 1, 0.3647059, 0, 1,
-1.535946, 1.581383, -3.351228, 1, 0.372549, 0, 1,
-1.533596, 0.3775072, -2.993582, 1, 0.3764706, 0, 1,
-1.532598, 0.9996885, -2.190322, 1, 0.3843137, 0, 1,
-1.519336, -0.7841844, -2.623761, 1, 0.3882353, 0, 1,
-1.502323, 1.505224, -2.382154, 1, 0.3960784, 0, 1,
-1.496418, -0.5798363, -0.4463143, 1, 0.4039216, 0, 1,
-1.491517, 0.7824352, -1.295742, 1, 0.4078431, 0, 1,
-1.46753, -0.3118494, -1.786379, 1, 0.4156863, 0, 1,
-1.467386, -1.158522, -1.924863, 1, 0.4196078, 0, 1,
-1.460523, -0.181414, -2.571804, 1, 0.427451, 0, 1,
-1.459177, 1.486015, 0.7697114, 1, 0.4313726, 0, 1,
-1.417382, -0.3453046, -3.334494, 1, 0.4392157, 0, 1,
-1.396952, 0.1732607, -1.385132, 1, 0.4431373, 0, 1,
-1.394975, -0.0558815, -2.343994, 1, 0.4509804, 0, 1,
-1.393433, -0.4726984, -2.24487, 1, 0.454902, 0, 1,
-1.391129, -1.62102, -1.811823, 1, 0.4627451, 0, 1,
-1.385568, -0.1898821, -0.9955669, 1, 0.4666667, 0, 1,
-1.383992, -0.4488821, -1.122426, 1, 0.4745098, 0, 1,
-1.364313, 0.9192375, 0.0344813, 1, 0.4784314, 0, 1,
-1.354212, -0.3656736, -1.653585, 1, 0.4862745, 0, 1,
-1.346354, -0.04942105, -2.496213, 1, 0.4901961, 0, 1,
-1.346345, -0.6012627, -1.525578, 1, 0.4980392, 0, 1,
-1.345978, 0.0268678, -1.104778, 1, 0.5058824, 0, 1,
-1.340233, -0.6122771, -0.9323372, 1, 0.509804, 0, 1,
-1.32818, 1.181928, -1.713452, 1, 0.5176471, 0, 1,
-1.324602, -0.4919817, -1.155792, 1, 0.5215687, 0, 1,
-1.324593, -0.2426817, -2.965029, 1, 0.5294118, 0, 1,
-1.320232, -0.1498568, -0.6857719, 1, 0.5333334, 0, 1,
-1.318072, 0.2681605, -2.960247, 1, 0.5411765, 0, 1,
-1.317562, 0.3960493, -2.076458, 1, 0.5450981, 0, 1,
-1.315287, -0.6510615, -1.852857, 1, 0.5529412, 0, 1,
-1.31483, 1.102516, -1.235177, 1, 0.5568628, 0, 1,
-1.306943, 0.5279549, -1.795921, 1, 0.5647059, 0, 1,
-1.288296, -1.031062, -1.999829, 1, 0.5686275, 0, 1,
-1.282295, -0.3204482, -2.330106, 1, 0.5764706, 0, 1,
-1.28088, -1.824622, -2.577868, 1, 0.5803922, 0, 1,
-1.279582, -0.7023741, -1.986182, 1, 0.5882353, 0, 1,
-1.266221, 0.1908523, -1.581547, 1, 0.5921569, 0, 1,
-1.265285, -0.5001567, -0.2463939, 1, 0.6, 0, 1,
-1.264563, -0.6055981, -1.028089, 1, 0.6078432, 0, 1,
-1.257741, -1.70144, -1.904964, 1, 0.6117647, 0, 1,
-1.246363, 0.01710932, -1.23439, 1, 0.6196079, 0, 1,
-1.238904, 1.349018, 0.6916735, 1, 0.6235294, 0, 1,
-1.237154, 1.913958, -0.8818214, 1, 0.6313726, 0, 1,
-1.228583, -1.382713, -3.983095, 1, 0.6352941, 0, 1,
-1.226322, -1.086364, -2.056338, 1, 0.6431373, 0, 1,
-1.225822, -0.38999, -2.009879, 1, 0.6470588, 0, 1,
-1.223663, -0.3686305, -1.133377, 1, 0.654902, 0, 1,
-1.223639, 0.6939602, 1.918189, 1, 0.6588235, 0, 1,
-1.218936, 0.5459059, -0.5337652, 1, 0.6666667, 0, 1,
-1.218647, 0.003708056, -0.3518485, 1, 0.6705883, 0, 1,
-1.211608, -0.6403602, -2.039256, 1, 0.6784314, 0, 1,
-1.208992, 0.6101396, -0.7206802, 1, 0.682353, 0, 1,
-1.200964, 0.3812053, -1.515053, 1, 0.6901961, 0, 1,
-1.200755, 1.140616, -1.139368, 1, 0.6941177, 0, 1,
-1.194192, -2.021709, -1.403903, 1, 0.7019608, 0, 1,
-1.186309, 0.3840818, -0.3393716, 1, 0.7098039, 0, 1,
-1.183986, 0.4931975, -1.567443, 1, 0.7137255, 0, 1,
-1.177665, -1.745551, -3.480738, 1, 0.7215686, 0, 1,
-1.176884, 1.108699, -1.871132, 1, 0.7254902, 0, 1,
-1.170336, -0.1465749, -3.723994, 1, 0.7333333, 0, 1,
-1.169065, -1.991605, -1.087425, 1, 0.7372549, 0, 1,
-1.162874, -1.098765, -1.025934, 1, 0.7450981, 0, 1,
-1.160825, -0.9070921, -0.8577859, 1, 0.7490196, 0, 1,
-1.154594, -0.4270459, -1.542053, 1, 0.7568628, 0, 1,
-1.148616, 0.3356078, -1.238111, 1, 0.7607843, 0, 1,
-1.145222, 0.5349916, -1.092279, 1, 0.7686275, 0, 1,
-1.145193, 0.001163512, -2.587159, 1, 0.772549, 0, 1,
-1.128302, -0.7900825, -1.84485, 1, 0.7803922, 0, 1,
-1.125437, 0.22361, -0.3423874, 1, 0.7843137, 0, 1,
-1.118981, 0.9712479, -0.5426777, 1, 0.7921569, 0, 1,
-1.112415, 1.829412, 0.645739, 1, 0.7960784, 0, 1,
-1.101718, 0.562948, -0.3454513, 1, 0.8039216, 0, 1,
-1.100491, -0.487135, -1.557396, 1, 0.8117647, 0, 1,
-1.098869, -0.09937239, -0.9257091, 1, 0.8156863, 0, 1,
-1.098458, 0.1495309, 0.3282342, 1, 0.8235294, 0, 1,
-1.091478, 1.120902, -0.2522152, 1, 0.827451, 0, 1,
-1.082922, 0.1193848, -1.03941, 1, 0.8352941, 0, 1,
-1.082301, -0.4756425, -1.620367, 1, 0.8392157, 0, 1,
-1.082047, 0.5257469, -0.4941895, 1, 0.8470588, 0, 1,
-1.075313, -0.4365496, -3.038292, 1, 0.8509804, 0, 1,
-1.074585, -0.2464048, -1.695827, 1, 0.8588235, 0, 1,
-1.07374, 0.3568664, -1.111932, 1, 0.8627451, 0, 1,
-1.073576, -0.3278734, -2.989916, 1, 0.8705882, 0, 1,
-1.073483, -0.8811209, -2.064138, 1, 0.8745098, 0, 1,
-1.073173, -0.1162085, -0.9604167, 1, 0.8823529, 0, 1,
-1.062114, -0.1930352, -2.648238, 1, 0.8862745, 0, 1,
-1.060793, -1.306764, -1.243119, 1, 0.8941177, 0, 1,
-1.049936, 0.9679793, -1.689537, 1, 0.8980392, 0, 1,
-1.049114, 1.416087, -0.2099615, 1, 0.9058824, 0, 1,
-1.036981, -0.8735931, -4.067, 1, 0.9137255, 0, 1,
-1.034109, 1.003287, 0.4050899, 1, 0.9176471, 0, 1,
-1.024385, 0.05806296, -1.451993, 1, 0.9254902, 0, 1,
-1.024291, -1.134965, -1.366495, 1, 0.9294118, 0, 1,
-1.021657, -0.5576261, -1.833637, 1, 0.9372549, 0, 1,
-1.021085, -0.503713, -1.41063, 1, 0.9411765, 0, 1,
-1.020855, 2.266148, -0.5296384, 1, 0.9490196, 0, 1,
-1.010698, 0.8689107, 0.1937502, 1, 0.9529412, 0, 1,
-1.008646, -0.6073557, -2.261502, 1, 0.9607843, 0, 1,
-1.005681, -0.8700016, -2.71602, 1, 0.9647059, 0, 1,
-1.005074, -0.4923617, -2.244428, 1, 0.972549, 0, 1,
-1.001965, -0.676702, -1.92407, 1, 0.9764706, 0, 1,
-1.00173, -0.1931697, -3.687432, 1, 0.9843137, 0, 1,
-1.000608, -1.929765, 0.1053543, 1, 0.9882353, 0, 1,
-0.9867646, 0.9250126, -0.7765919, 1, 0.9960784, 0, 1,
-0.9806851, 0.8413846, -2.96169, 0.9960784, 1, 0, 1,
-0.9746275, 0.2655204, -2.016909, 0.9921569, 1, 0, 1,
-0.9716635, -0.3849339, -0.4293388, 0.9843137, 1, 0, 1,
-0.9667094, -1.64312, -2.149652, 0.9803922, 1, 0, 1,
-0.9642301, 0.8715227, 0.5261837, 0.972549, 1, 0, 1,
-0.9578704, -0.9273514, -3.032612, 0.9686275, 1, 0, 1,
-0.9503477, 0.5335252, -1.546181, 0.9607843, 1, 0, 1,
-0.9477167, -1.40887, -3.008728, 0.9568627, 1, 0, 1,
-0.931188, -0.426104, -2.952478, 0.9490196, 1, 0, 1,
-0.9251922, 0.695564, -0.852329, 0.945098, 1, 0, 1,
-0.92358, 0.2032907, -3.585233, 0.9372549, 1, 0, 1,
-0.9134117, 1.492387, 0.2357476, 0.9333333, 1, 0, 1,
-0.9128913, -1.012421, -1.714689, 0.9254902, 1, 0, 1,
-0.9123722, 0.1410295, -0.9002919, 0.9215686, 1, 0, 1,
-0.9107294, 0.594883, -1.464911, 0.9137255, 1, 0, 1,
-0.9080019, -0.747797, -1.721002, 0.9098039, 1, 0, 1,
-0.9025386, 0.2827113, -0.3508001, 0.9019608, 1, 0, 1,
-0.8959994, -0.2362982, -0.6624655, 0.8941177, 1, 0, 1,
-0.8911527, -0.4447917, -2.950211, 0.8901961, 1, 0, 1,
-0.8814157, -0.1348014, -0.1517428, 0.8823529, 1, 0, 1,
-0.8676943, -0.03999892, -1.700875, 0.8784314, 1, 0, 1,
-0.867447, 0.1195002, 0.2760533, 0.8705882, 1, 0, 1,
-0.8655846, 0.5204211, -1.072632, 0.8666667, 1, 0, 1,
-0.8640255, 0.8304014, -0.9872652, 0.8588235, 1, 0, 1,
-0.8640092, 0.3795371, -0.7731082, 0.854902, 1, 0, 1,
-0.8580631, 0.2133705, -2.022055, 0.8470588, 1, 0, 1,
-0.8554701, -0.626183, -3.552665, 0.8431373, 1, 0, 1,
-0.8490582, 0.997297, -0.5219278, 0.8352941, 1, 0, 1,
-0.8479057, 0.05722125, -0.5330335, 0.8313726, 1, 0, 1,
-0.8390136, 0.6788495, -1.653202, 0.8235294, 1, 0, 1,
-0.8372838, -1.318624, -4.196527, 0.8196079, 1, 0, 1,
-0.8305395, -1.34451, -2.261388, 0.8117647, 1, 0, 1,
-0.8272223, 0.4586081, -0.5465356, 0.8078431, 1, 0, 1,
-0.8271308, -1.584358, -2.671583, 0.8, 1, 0, 1,
-0.8261409, 0.1044518, -0.4890337, 0.7921569, 1, 0, 1,
-0.8195359, -1.523631, -3.064787, 0.7882353, 1, 0, 1,
-0.8029379, 0.4336032, -0.3024587, 0.7803922, 1, 0, 1,
-0.8001732, -0.2840506, -2.83861, 0.7764706, 1, 0, 1,
-0.794709, 1.948755, 0.7333737, 0.7686275, 1, 0, 1,
-0.7920948, 0.2476918, -1.988471, 0.7647059, 1, 0, 1,
-0.7895614, 0.1048089, -2.142949, 0.7568628, 1, 0, 1,
-0.789143, 1.019428, 0.9389406, 0.7529412, 1, 0, 1,
-0.7888247, 0.2102178, -2.0116, 0.7450981, 1, 0, 1,
-0.7868655, 0.06716823, -1.529175, 0.7411765, 1, 0, 1,
-0.7862968, 0.1585866, -0.8621165, 0.7333333, 1, 0, 1,
-0.7827646, -0.7851438, -3.885058, 0.7294118, 1, 0, 1,
-0.7702962, 0.1972472, -0.7369037, 0.7215686, 1, 0, 1,
-0.7672579, -0.4799336, -2.023146, 0.7176471, 1, 0, 1,
-0.7624763, -0.4737508, -1.027715, 0.7098039, 1, 0, 1,
-0.7596667, -0.5216645, -1.855778, 0.7058824, 1, 0, 1,
-0.7541226, -2.964057, -5.030908, 0.6980392, 1, 0, 1,
-0.7532958, -0.0620822, -1.28868, 0.6901961, 1, 0, 1,
-0.7526501, -0.2310291, -1.959084, 0.6862745, 1, 0, 1,
-0.751982, 2.282661, 0.118132, 0.6784314, 1, 0, 1,
-0.7487911, -0.4605727, -1.983422, 0.6745098, 1, 0, 1,
-0.7421151, -1.329572, -1.878816, 0.6666667, 1, 0, 1,
-0.7416412, -0.174168, -1.636842, 0.6627451, 1, 0, 1,
-0.7399784, 1.064152, -1.171651, 0.654902, 1, 0, 1,
-0.7375376, -1.818122, -2.585911, 0.6509804, 1, 0, 1,
-0.7342021, -2.199867, -3.354152, 0.6431373, 1, 0, 1,
-0.7340251, -0.1770454, -3.285423, 0.6392157, 1, 0, 1,
-0.7333614, 0.8139893, -0.4027713, 0.6313726, 1, 0, 1,
-0.728649, -0.67775, -2.847604, 0.627451, 1, 0, 1,
-0.7239696, -1.118771, -2.782007, 0.6196079, 1, 0, 1,
-0.723177, 0.3930016, 1.084028, 0.6156863, 1, 0, 1,
-0.7163096, 0.5318958, -1.753675, 0.6078432, 1, 0, 1,
-0.7135248, -0.2689267, -2.211884, 0.6039216, 1, 0, 1,
-0.7135192, -0.2993815, -2.185035, 0.5960785, 1, 0, 1,
-0.7123851, 1.510413, -0.2153389, 0.5882353, 1, 0, 1,
-0.7089921, 0.8224505, -1.534568, 0.5843138, 1, 0, 1,
-0.7078665, -1.103813, -1.793369, 0.5764706, 1, 0, 1,
-0.7068689, 0.2806847, -1.149093, 0.572549, 1, 0, 1,
-0.7062272, 0.6874266, -1.495514, 0.5647059, 1, 0, 1,
-0.7018632, -1.982895, -2.495627, 0.5607843, 1, 0, 1,
-0.6926371, 0.6721658, -0.01889741, 0.5529412, 1, 0, 1,
-0.6922063, 0.3759608, -2.023482, 0.5490196, 1, 0, 1,
-0.680638, 1.800482, -1.773951, 0.5411765, 1, 0, 1,
-0.6784793, -0.5616738, -2.355131, 0.5372549, 1, 0, 1,
-0.6755308, -0.05073677, -1.475708, 0.5294118, 1, 0, 1,
-0.6685585, -2.0805, -3.052841, 0.5254902, 1, 0, 1,
-0.6667603, 0.5762582, -0.1638807, 0.5176471, 1, 0, 1,
-0.665549, 1.259442, 0.3381905, 0.5137255, 1, 0, 1,
-0.6633701, -0.1449598, -0.7938568, 0.5058824, 1, 0, 1,
-0.6596317, 0.2645844, -0.9871805, 0.5019608, 1, 0, 1,
-0.6548403, -0.7182468, -3.900705, 0.4941176, 1, 0, 1,
-0.650947, -0.8841259, -3.573049, 0.4862745, 1, 0, 1,
-0.6496564, 0.3377246, -0.5096967, 0.4823529, 1, 0, 1,
-0.6454611, 0.4769312, 0.2940874, 0.4745098, 1, 0, 1,
-0.642114, 0.7230361, -1.193152, 0.4705882, 1, 0, 1,
-0.6401231, 0.8794155, 0.4418199, 0.4627451, 1, 0, 1,
-0.6369678, 1.658979, 0.246606, 0.4588235, 1, 0, 1,
-0.6320921, -0.8477971, -2.038832, 0.4509804, 1, 0, 1,
-0.6283483, 0.8087971, -1.702334, 0.4470588, 1, 0, 1,
-0.6265889, -0.03491184, -0.4713756, 0.4392157, 1, 0, 1,
-0.6265526, 0.682047, -0.961186, 0.4352941, 1, 0, 1,
-0.6221055, -1.928121, -2.811091, 0.427451, 1, 0, 1,
-0.614831, -0.4046659, -2.243692, 0.4235294, 1, 0, 1,
-0.6055841, -1.44535, 0.6032345, 0.4156863, 1, 0, 1,
-0.6045064, 0.01341785, -1.224567, 0.4117647, 1, 0, 1,
-0.6041897, -0.7468854, -3.321426, 0.4039216, 1, 0, 1,
-0.6036117, -0.3013709, -3.170855, 0.3960784, 1, 0, 1,
-0.6014956, -2.058361, -2.706908, 0.3921569, 1, 0, 1,
-0.6006716, 0.9139194, -0.353889, 0.3843137, 1, 0, 1,
-0.6005121, 0.6478688, 0.09280498, 0.3803922, 1, 0, 1,
-0.599437, -0.1408641, -0.7089349, 0.372549, 1, 0, 1,
-0.5990289, 0.1602401, -1.261522, 0.3686275, 1, 0, 1,
-0.597753, -0.3192275, -1.733134, 0.3607843, 1, 0, 1,
-0.5942028, 0.8426356, 0.351092, 0.3568628, 1, 0, 1,
-0.5925441, -0.2450932, -2.374974, 0.3490196, 1, 0, 1,
-0.5918261, 0.4011042, -0.5987319, 0.345098, 1, 0, 1,
-0.5915111, 0.6746584, -1.125894, 0.3372549, 1, 0, 1,
-0.5882614, 1.560429, 1.019995, 0.3333333, 1, 0, 1,
-0.5868174, 1.00036, -0.1321784, 0.3254902, 1, 0, 1,
-0.5846963, -1.362039, -3.652173, 0.3215686, 1, 0, 1,
-0.5834913, 0.2516049, -0.09859204, 0.3137255, 1, 0, 1,
-0.5719668, 0.7085323, 0.2977506, 0.3098039, 1, 0, 1,
-0.5655867, -0.09649419, -1.596873, 0.3019608, 1, 0, 1,
-0.5628791, 0.7098484, 0.8070966, 0.2941177, 1, 0, 1,
-0.5601451, -0.1829152, -1.820043, 0.2901961, 1, 0, 1,
-0.5598699, -0.1383498, -1.345217, 0.282353, 1, 0, 1,
-0.5561474, 1.648488, -0.2424516, 0.2784314, 1, 0, 1,
-0.5474135, -0.2699437, -2.968004, 0.2705882, 1, 0, 1,
-0.5470133, -1.534944, -4.617441, 0.2666667, 1, 0, 1,
-0.546919, 0.279874, -2.289405, 0.2588235, 1, 0, 1,
-0.5445564, -0.175995, -2.21909, 0.254902, 1, 0, 1,
-0.5422454, 2.92472, -0.1435687, 0.2470588, 1, 0, 1,
-0.5412768, -0.002745873, -2.329809, 0.2431373, 1, 0, 1,
-0.5344601, -1.93865, -3.304062, 0.2352941, 1, 0, 1,
-0.5323963, 0.4878472, -0.6376716, 0.2313726, 1, 0, 1,
-0.5315243, -0.7998713, -2.919614, 0.2235294, 1, 0, 1,
-0.5261829, -0.2671507, -1.715315, 0.2196078, 1, 0, 1,
-0.5252796, -1.57707, -3.046206, 0.2117647, 1, 0, 1,
-0.5234489, -0.3095672, -1.464445, 0.2078431, 1, 0, 1,
-0.5203764, 0.9090381, 0.3852222, 0.2, 1, 0, 1,
-0.5195459, -0.3361909, -3.315249, 0.1921569, 1, 0, 1,
-0.5101118, 1.384016, -1.748363, 0.1882353, 1, 0, 1,
-0.5090168, -1.187526, -2.08199, 0.1803922, 1, 0, 1,
-0.5061138, -0.1842613, -0.04547722, 0.1764706, 1, 0, 1,
-0.5060471, -1.677255, -1.600501, 0.1686275, 1, 0, 1,
-0.5032631, 1.401833, -2.481551, 0.1647059, 1, 0, 1,
-0.5028335, 0.7285812, 0.1740111, 0.1568628, 1, 0, 1,
-0.5017321, 0.2148678, -1.342467, 0.1529412, 1, 0, 1,
-0.4982912, -0.09966498, -2.591735, 0.145098, 1, 0, 1,
-0.4870625, 1.431536, -0.6100468, 0.1411765, 1, 0, 1,
-0.4868253, 0.03851904, -1.750426, 0.1333333, 1, 0, 1,
-0.484231, -0.04808573, 0.09151185, 0.1294118, 1, 0, 1,
-0.481555, 1.311766, 0.8536032, 0.1215686, 1, 0, 1,
-0.4808451, 0.5523103, -0.7878947, 0.1176471, 1, 0, 1,
-0.4777574, 0.300055, 0.7324196, 0.1098039, 1, 0, 1,
-0.4768223, -0.2652714, -1.151876, 0.1058824, 1, 0, 1,
-0.4762331, 0.5240616, -1.559977, 0.09803922, 1, 0, 1,
-0.4703835, -0.7718396, -2.205033, 0.09019608, 1, 0, 1,
-0.4700616, 1.477027, 0.004281348, 0.08627451, 1, 0, 1,
-0.4694407, -1.421735, -3.237756, 0.07843138, 1, 0, 1,
-0.4651136, 0.2878981, -1.095209, 0.07450981, 1, 0, 1,
-0.4628864, -0.7090631, -2.523855, 0.06666667, 1, 0, 1,
-0.4627634, -1.245206, -5.125615, 0.0627451, 1, 0, 1,
-0.4576748, 0.4258401, -2.193848, 0.05490196, 1, 0, 1,
-0.4569218, -0.1476511, -2.024225, 0.05098039, 1, 0, 1,
-0.454232, -0.4992638, -0.1412518, 0.04313726, 1, 0, 1,
-0.4511189, 1.602165, -1.237685, 0.03921569, 1, 0, 1,
-0.4501541, -0.198326, -3.320431, 0.03137255, 1, 0, 1,
-0.4453973, -0.003434645, -1.899517, 0.02745098, 1, 0, 1,
-0.4448894, -0.6091748, -2.477302, 0.01960784, 1, 0, 1,
-0.444365, -0.458706, -2.488528, 0.01568628, 1, 0, 1,
-0.4395588, -0.5118598, -3.272178, 0.007843138, 1, 0, 1,
-0.4365828, 1.021301, -1.424986, 0.003921569, 1, 0, 1,
-0.4302759, 0.07277436, -0.9233297, 0, 1, 0.003921569, 1,
-0.4216637, 1.313747, 0.03194013, 0, 1, 0.01176471, 1,
-0.42127, 0.2314539, -2.055701, 0, 1, 0.01568628, 1,
-0.3985811, -2.210336, -2.19455, 0, 1, 0.02352941, 1,
-0.3973469, 0.6349942, -1.708342, 0, 1, 0.02745098, 1,
-0.3955167, 1.525759, 0.6863806, 0, 1, 0.03529412, 1,
-0.3943443, 1.388359, -0.07000874, 0, 1, 0.03921569, 1,
-0.3907712, 0.5112999, -1.031681, 0, 1, 0.04705882, 1,
-0.3884596, -2.467747, -2.31132, 0, 1, 0.05098039, 1,
-0.3851539, -0.7695354, -1.985464, 0, 1, 0.05882353, 1,
-0.3847171, -0.3469741, -2.533934, 0, 1, 0.0627451, 1,
-0.3841915, -0.04840955, -0.3139428, 0, 1, 0.07058824, 1,
-0.3839377, -1.012588, -4.293568, 0, 1, 0.07450981, 1,
-0.3797977, -1.105942, -0.6385224, 0, 1, 0.08235294, 1,
-0.3747018, 0.4633861, -0.9878954, 0, 1, 0.08627451, 1,
-0.3722557, 1.116965, -0.452055, 0, 1, 0.09411765, 1,
-0.3721558, -1.426243, -2.834242, 0, 1, 0.1019608, 1,
-0.3718428, 0.4637105, -1.001713, 0, 1, 0.1058824, 1,
-0.3700659, -1.215292, -2.559886, 0, 1, 0.1137255, 1,
-0.3697461, 0.3581805, -2.75027, 0, 1, 0.1176471, 1,
-0.3613344, 0.9304617, -1.061451, 0, 1, 0.1254902, 1,
-0.3608965, -0.2083751, -1.19125, 0, 1, 0.1294118, 1,
-0.3587081, 0.3441971, -1.86391, 0, 1, 0.1372549, 1,
-0.357149, 1.466434, 1.536189, 0, 1, 0.1411765, 1,
-0.3554337, -0.5231952, -3.770462, 0, 1, 0.1490196, 1,
-0.3491161, -1.800536, -5.211466, 0, 1, 0.1529412, 1,
-0.3471771, -1.19794, -2.124534, 0, 1, 0.1607843, 1,
-0.342158, 0.2355467, -1.541178, 0, 1, 0.1647059, 1,
-0.3389621, -1.245503, -3.841037, 0, 1, 0.172549, 1,
-0.3363809, 0.8088778, 0.2176325, 0, 1, 0.1764706, 1,
-0.3345215, -1.880824, -2.693842, 0, 1, 0.1843137, 1,
-0.3308535, -0.8639227, -2.858962, 0, 1, 0.1882353, 1,
-0.3260016, 0.4397632, -0.08974037, 0, 1, 0.1960784, 1,
-0.3240705, -2.016715, -3.960545, 0, 1, 0.2039216, 1,
-0.3174953, 0.8715252, -1.046945, 0, 1, 0.2078431, 1,
-0.3158317, 0.06991994, -3.268819, 0, 1, 0.2156863, 1,
-0.3100385, -0.6281052, -3.753147, 0, 1, 0.2196078, 1,
-0.3099133, -0.9570975, -3.816198, 0, 1, 0.227451, 1,
-0.3035247, -0.1292112, -2.559857, 0, 1, 0.2313726, 1,
-0.3022067, -0.8333511, -2.263393, 0, 1, 0.2392157, 1,
-0.299939, -0.3935133, -4.060979, 0, 1, 0.2431373, 1,
-0.2952939, 0.1074974, -2.241908, 0, 1, 0.2509804, 1,
-0.2927613, 2.658664, -1.938777, 0, 1, 0.254902, 1,
-0.2896415, -1.786107, -3.350286, 0, 1, 0.2627451, 1,
-0.2846531, 0.8885773, -1.553205, 0, 1, 0.2666667, 1,
-0.2841772, 0.2065024, -0.8402718, 0, 1, 0.2745098, 1,
-0.2812243, 0.8573637, -0.6234124, 0, 1, 0.2784314, 1,
-0.2772876, -0.4229721, -2.098872, 0, 1, 0.2862745, 1,
-0.2753559, 1.730274, -0.706651, 0, 1, 0.2901961, 1,
-0.272866, 0.2952006, 1.176149, 0, 1, 0.2980392, 1,
-0.2721083, -0.2978927, -1.748869, 0, 1, 0.3058824, 1,
-0.2693301, -0.678657, -2.744707, 0, 1, 0.3098039, 1,
-0.269216, -0.3530708, -1.215572, 0, 1, 0.3176471, 1,
-0.2674613, 0.1204526, -0.8849623, 0, 1, 0.3215686, 1,
-0.2558248, -0.9568248, -3.66408, 0, 1, 0.3294118, 1,
-0.2550476, -0.9874892, -1.972256, 0, 1, 0.3333333, 1,
-0.25236, 0.7815177, -0.9322654, 0, 1, 0.3411765, 1,
-0.250935, -0.1534437, -1.390728, 0, 1, 0.345098, 1,
-0.2477274, 0.7289277, -2.150764, 0, 1, 0.3529412, 1,
-0.2474845, 0.1220492, -1.12079, 0, 1, 0.3568628, 1,
-0.2430487, 0.6002582, -1.380287, 0, 1, 0.3647059, 1,
-0.2396817, 0.2015957, 0.7206066, 0, 1, 0.3686275, 1,
-0.2374338, -0.09339292, -3.299925, 0, 1, 0.3764706, 1,
-0.2359509, -1.092213, -2.303262, 0, 1, 0.3803922, 1,
-0.2332152, 0.5070965, -0.4761624, 0, 1, 0.3882353, 1,
-0.2305019, 1.306691, 0.7097796, 0, 1, 0.3921569, 1,
-0.2264562, -3.053178, -2.644572, 0, 1, 0.4, 1,
-0.2246688, 1.600928, -0.1136221, 0, 1, 0.4078431, 1,
-0.221991, -0.9157129, -2.749337, 0, 1, 0.4117647, 1,
-0.2184285, 0.1961056, -0.822222, 0, 1, 0.4196078, 1,
-0.2172536, -0.1958532, -2.379348, 0, 1, 0.4235294, 1,
-0.213485, -1.246298, -2.424817, 0, 1, 0.4313726, 1,
-0.2103995, 1.715077, 0.8150554, 0, 1, 0.4352941, 1,
-0.2074696, -0.3493451, -2.195861, 0, 1, 0.4431373, 1,
-0.206818, -1.195883, -3.115626, 0, 1, 0.4470588, 1,
-0.2055617, -2.181898, -2.526989, 0, 1, 0.454902, 1,
-0.2043173, 1.678004, -1.05226, 0, 1, 0.4588235, 1,
-0.2027718, -0.4858174, -3.630961, 0, 1, 0.4666667, 1,
-0.2018625, -0.5406892, -0.7473596, 0, 1, 0.4705882, 1,
-0.2015759, 0.5905173, -0.2304906, 0, 1, 0.4784314, 1,
-0.197512, 0.5154132, 0.202255, 0, 1, 0.4823529, 1,
-0.1964374, 1.36017, 1.889871, 0, 1, 0.4901961, 1,
-0.1963407, -0.5203212, -1.313163, 0, 1, 0.4941176, 1,
-0.1935253, -0.2828588, -3.011812, 0, 1, 0.5019608, 1,
-0.1908462, -0.002412394, -1.524646, 0, 1, 0.509804, 1,
-0.1878257, -0.6654189, -3.3007, 0, 1, 0.5137255, 1,
-0.1873986, -0.7119399, -3.47379, 0, 1, 0.5215687, 1,
-0.1847638, -1.738304, -1.686043, 0, 1, 0.5254902, 1,
-0.1838165, 0.7619647, -1.16167, 0, 1, 0.5333334, 1,
-0.1763093, 1.110486, -0.7335684, 0, 1, 0.5372549, 1,
-0.1739192, 0.9495139, -1.76497, 0, 1, 0.5450981, 1,
-0.1694573, -0.3511304, -3.237413, 0, 1, 0.5490196, 1,
-0.1686413, -0.7697065, -3.913379, 0, 1, 0.5568628, 1,
-0.1636445, -0.9187598, -3.314035, 0, 1, 0.5607843, 1,
-0.1597682, -0.5163465, -1.835163, 0, 1, 0.5686275, 1,
-0.1587619, 0.856706, -1.004659, 0, 1, 0.572549, 1,
-0.1510173, -0.1023662, -1.600387, 0, 1, 0.5803922, 1,
-0.1508619, 1.149207, 0.1474857, 0, 1, 0.5843138, 1,
-0.1488228, 0.6624797, -1.10378, 0, 1, 0.5921569, 1,
-0.1469286, -0.1318187, -2.180478, 0, 1, 0.5960785, 1,
-0.1467172, -0.006553949, -2.831062, 0, 1, 0.6039216, 1,
-0.1466582, -1.531517, -3.598373, 0, 1, 0.6117647, 1,
-0.1410689, 0.4748459, 0.1544759, 0, 1, 0.6156863, 1,
-0.1398052, 1.816316, -0.4272589, 0, 1, 0.6235294, 1,
-0.1367958, 0.4523126, -0.7656282, 0, 1, 0.627451, 1,
-0.1258003, 0.278698, -1.247357, 0, 1, 0.6352941, 1,
-0.1252645, -0.2582115, -1.844384, 0, 1, 0.6392157, 1,
-0.1245751, -0.2558317, -3.705174, 0, 1, 0.6470588, 1,
-0.119212, -1.377314, -2.992991, 0, 1, 0.6509804, 1,
-0.1173818, 0.4191276, 0.2211787, 0, 1, 0.6588235, 1,
-0.1151017, 0.244032, -3.049274, 0, 1, 0.6627451, 1,
-0.1139784, 1.624605, 0.8831666, 0, 1, 0.6705883, 1,
-0.1104415, 0.9839543, 0.5368357, 0, 1, 0.6745098, 1,
-0.1079507, -1.89225, -3.922166, 0, 1, 0.682353, 1,
-0.1065374, -0.7867551, -3.70779, 0, 1, 0.6862745, 1,
-0.1048767, 0.2193045, -0.0001897359, 0, 1, 0.6941177, 1,
-0.1008259, -1.328613, -2.563383, 0, 1, 0.7019608, 1,
-0.1002342, 0.8321621, 0.3199767, 0, 1, 0.7058824, 1,
-0.08906379, -1.259541, -2.307442, 0, 1, 0.7137255, 1,
-0.0888435, -0.1615741, -2.185211, 0, 1, 0.7176471, 1,
-0.08861695, -0.195494, -1.012348, 0, 1, 0.7254902, 1,
-0.08562026, -1.060373, -3.183003, 0, 1, 0.7294118, 1,
-0.08375926, 0.8235613, -0.5117537, 0, 1, 0.7372549, 1,
-0.08158962, 0.3090078, 1.214852, 0, 1, 0.7411765, 1,
-0.08056838, 0.54638, -0.09419216, 0, 1, 0.7490196, 1,
-0.07541988, -1.504241, -3.976472, 0, 1, 0.7529412, 1,
-0.07333692, -0.3466849, -2.298961, 0, 1, 0.7607843, 1,
-0.06859705, 0.2727424, -1.021473, 0, 1, 0.7647059, 1,
-0.06787117, -0.4663873, -0.5447749, 0, 1, 0.772549, 1,
-0.06735683, 0.7577337, 0.2495298, 0, 1, 0.7764706, 1,
-0.06608889, -0.8427677, -2.490259, 0, 1, 0.7843137, 1,
-0.06569702, -1.929078, -3.580812, 0, 1, 0.7882353, 1,
-0.0631, 0.9741232, -0.1610921, 0, 1, 0.7960784, 1,
-0.05963282, -0.2235886, -2.559789, 0, 1, 0.8039216, 1,
-0.05788497, 1.335773, -1.463827, 0, 1, 0.8078431, 1,
-0.05719895, -1.315075, -2.230193, 0, 1, 0.8156863, 1,
-0.05677561, -0.3298285, -3.96444, 0, 1, 0.8196079, 1,
-0.05625973, 1.585969, 0.5752631, 0, 1, 0.827451, 1,
-0.05566894, -0.5032913, -3.107742, 0, 1, 0.8313726, 1,
-0.05168949, 1.841402, 0.167311, 0, 1, 0.8392157, 1,
-0.0489521, -0.9297762, -2.620605, 0, 1, 0.8431373, 1,
-0.04403249, -0.29638, -2.925977, 0, 1, 0.8509804, 1,
-0.04209691, -1.073708, -2.388078, 0, 1, 0.854902, 1,
-0.04115413, -0.6798608, -3.301995, 0, 1, 0.8627451, 1,
-0.04063394, -1.001177, -3.092888, 0, 1, 0.8666667, 1,
-0.04024374, 0.3381321, -1.850952, 0, 1, 0.8745098, 1,
-0.03805133, 2.048457, -1.43884, 0, 1, 0.8784314, 1,
-0.0292583, -0.5195735, -2.736333, 0, 1, 0.8862745, 1,
-0.02615382, 0.6227413, -0.02474719, 0, 1, 0.8901961, 1,
-0.02572522, -0.5892399, -4.958135, 0, 1, 0.8980392, 1,
-0.02539826, -0.9906683, -3.235447, 0, 1, 0.9058824, 1,
-0.02445187, -0.6910249, -3.190426, 0, 1, 0.9098039, 1,
-0.0232595, -1.387497, -3.695955, 0, 1, 0.9176471, 1,
-0.02040492, 0.3259418, -1.142281, 0, 1, 0.9215686, 1,
-0.01984408, -0.9860076, -3.413758, 0, 1, 0.9294118, 1,
-0.01830521, 0.4579189, 0.7687372, 0, 1, 0.9333333, 1,
-0.01775571, -0.04729399, -3.84405, 0, 1, 0.9411765, 1,
-0.01470102, -1.077663, -3.421668, 0, 1, 0.945098, 1,
-0.01428946, -0.6098679, -4.323315, 0, 1, 0.9529412, 1,
-0.01341807, -0.6695287, -3.550529, 0, 1, 0.9568627, 1,
-0.01100925, -2.528779, -2.554023, 0, 1, 0.9647059, 1,
-0.01048241, -1.046967, -1.64243, 0, 1, 0.9686275, 1,
-0.008876213, -1.126887, -2.041593, 0, 1, 0.9764706, 1,
-0.002329258, -1.528759, -1.258899, 0, 1, 0.9803922, 1,
-0.001664532, 2.06862, 1.051105, 0, 1, 0.9882353, 1,
-0.0006633774, 0.7372884, -2.162759, 0, 1, 0.9921569, 1,
-0.0006312538, -0.230387, -2.358664, 0, 1, 1, 1,
0.007113639, -0.1569752, 3.726452, 0, 0.9921569, 1, 1,
0.008170382, 0.01588823, 0.2596613, 0, 0.9882353, 1, 1,
0.01044483, 0.6355381, 0.935142, 0, 0.9803922, 1, 1,
0.0140399, -0.5092624, 4.263685, 0, 0.9764706, 1, 1,
0.02042034, 0.7719215, -0.5856467, 0, 0.9686275, 1, 1,
0.02914681, -0.1800494, 4.258012, 0, 0.9647059, 1, 1,
0.02942049, 0.8335875, 2.54525, 0, 0.9568627, 1, 1,
0.02953899, 1.721298, -0.183452, 0, 0.9529412, 1, 1,
0.03754056, 0.3428364, -0.9408523, 0, 0.945098, 1, 1,
0.03807452, 0.4374776, -0.112811, 0, 0.9411765, 1, 1,
0.03935163, -0.6060565, 1.798981, 0, 0.9333333, 1, 1,
0.04222851, 1.420535, 0.4739972, 0, 0.9294118, 1, 1,
0.04458057, 1.564396, -0.001106655, 0, 0.9215686, 1, 1,
0.05190811, -2.006253, 3.372831, 0, 0.9176471, 1, 1,
0.06257834, 1.124731, -0.4534605, 0, 0.9098039, 1, 1,
0.06749237, -0.1076635, 2.498229, 0, 0.9058824, 1, 1,
0.07149857, -1.856215, 3.196089, 0, 0.8980392, 1, 1,
0.071957, 1.035465, 0.4364899, 0, 0.8901961, 1, 1,
0.07236098, -0.8099051, 3.137254, 0, 0.8862745, 1, 1,
0.07508797, 0.1072064, -0.1139632, 0, 0.8784314, 1, 1,
0.07680092, 0.1120608, 0.1238238, 0, 0.8745098, 1, 1,
0.07688759, 0.4232791, 0.4929507, 0, 0.8666667, 1, 1,
0.07877269, -0.5682964, 4.840493, 0, 0.8627451, 1, 1,
0.09008692, -0.8941077, 1.484354, 0, 0.854902, 1, 1,
0.09043543, 0.7609043, 2.245162, 0, 0.8509804, 1, 1,
0.09248751, 0.01942673, 1.059433, 0, 0.8431373, 1, 1,
0.1020214, -0.01554522, 4.079322, 0, 0.8392157, 1, 1,
0.1072219, -0.5980498, 2.365931, 0, 0.8313726, 1, 1,
0.1086291, 0.01297764, 1.339752, 0, 0.827451, 1, 1,
0.1144686, -0.8909486, 3.928253, 0, 0.8196079, 1, 1,
0.1160201, 1.230748, -0.06448028, 0, 0.8156863, 1, 1,
0.1164629, 0.5028893, 0.6002437, 0, 0.8078431, 1, 1,
0.1205736, -1.58021, 4.239885, 0, 0.8039216, 1, 1,
0.134019, -0.2075519, 2.042955, 0, 0.7960784, 1, 1,
0.1364648, -0.5920446, 2.983317, 0, 0.7882353, 1, 1,
0.1417106, 1.046755, -0.2387303, 0, 0.7843137, 1, 1,
0.1427071, -0.3792289, 2.981437, 0, 0.7764706, 1, 1,
0.143408, 1.420358, -0.292849, 0, 0.772549, 1, 1,
0.1494891, 0.1513259, 0.9175356, 0, 0.7647059, 1, 1,
0.1504927, 0.2546916, -0.3159017, 0, 0.7607843, 1, 1,
0.1535415, -0.06785601, 3.382146, 0, 0.7529412, 1, 1,
0.1541217, -0.5639718, 2.402713, 0, 0.7490196, 1, 1,
0.1615068, -2.427373, 2.408193, 0, 0.7411765, 1, 1,
0.1635831, 0.7730658, -1.226257, 0, 0.7372549, 1, 1,
0.1641585, 0.6466039, -0.663244, 0, 0.7294118, 1, 1,
0.1653232, -1.315987, 3.677658, 0, 0.7254902, 1, 1,
0.1657541, -1.380183, 3.811605, 0, 0.7176471, 1, 1,
0.1684998, -1.245136, 3.234113, 0, 0.7137255, 1, 1,
0.1706087, -2.599784, 4.301379, 0, 0.7058824, 1, 1,
0.1727087, 2.272002, 0.1475542, 0, 0.6980392, 1, 1,
0.1729154, -0.6740739, 0.7579504, 0, 0.6941177, 1, 1,
0.173079, 0.0531854, 2.592929, 0, 0.6862745, 1, 1,
0.1733341, 0.01683958, 3.054367, 0, 0.682353, 1, 1,
0.1741119, 0.3646515, -0.883797, 0, 0.6745098, 1, 1,
0.1770169, 0.1963258, 0.5490655, 0, 0.6705883, 1, 1,
0.1795972, 0.08212184, -0.08459689, 0, 0.6627451, 1, 1,
0.1809226, -0.8911734, 4.832979, 0, 0.6588235, 1, 1,
0.1812697, 0.3444095, -0.1583275, 0, 0.6509804, 1, 1,
0.1821352, 0.1640109, 1.142209, 0, 0.6470588, 1, 1,
0.1897467, -1.752058, 3.850134, 0, 0.6392157, 1, 1,
0.1904902, 0.5180629, -0.8002011, 0, 0.6352941, 1, 1,
0.1968981, -0.1195437, 1.422273, 0, 0.627451, 1, 1,
0.1974755, -0.701098, 2.700681, 0, 0.6235294, 1, 1,
0.2022479, -0.4893316, 1.745738, 0, 0.6156863, 1, 1,
0.2053954, 1.218579, 1.131763, 0, 0.6117647, 1, 1,
0.2085935, -1.930623, 2.061661, 0, 0.6039216, 1, 1,
0.2092379, -0.01010644, 1.722223, 0, 0.5960785, 1, 1,
0.2128611, 1.545396, 0.191596, 0, 0.5921569, 1, 1,
0.2139831, -0.4316379, 2.295511, 0, 0.5843138, 1, 1,
0.2161124, 0.5762734, 0.9994286, 0, 0.5803922, 1, 1,
0.2212531, 1.217758, -0.514177, 0, 0.572549, 1, 1,
0.2243414, 1.264089, 0.2185961, 0, 0.5686275, 1, 1,
0.2297011, -0.3396924, 2.915219, 0, 0.5607843, 1, 1,
0.2317026, 1.97783, -0.6655119, 0, 0.5568628, 1, 1,
0.2352051, -0.1069722, 2.744293, 0, 0.5490196, 1, 1,
0.2397306, 0.9243975, 1.020548, 0, 0.5450981, 1, 1,
0.2433635, -0.3726948, 2.095476, 0, 0.5372549, 1, 1,
0.244042, -0.6084396, 3.375172, 0, 0.5333334, 1, 1,
0.2457734, -1.533187, 1.458314, 0, 0.5254902, 1, 1,
0.2486151, -0.2033746, 1.583453, 0, 0.5215687, 1, 1,
0.2502137, -0.1759838, 3.162807, 0, 0.5137255, 1, 1,
0.2510023, 1.101353, 1.965084, 0, 0.509804, 1, 1,
0.2567883, 1.841912, -0.164276, 0, 0.5019608, 1, 1,
0.2569881, 1.170125, 0.7466733, 0, 0.4941176, 1, 1,
0.2571829, 1.37771, -0.2459085, 0, 0.4901961, 1, 1,
0.2590566, 0.07342645, 2.1546, 0, 0.4823529, 1, 1,
0.2615441, 1.182479, -0.2776647, 0, 0.4784314, 1, 1,
0.2634015, -0.2752063, 2.810992, 0, 0.4705882, 1, 1,
0.2646272, -0.1232603, 4.142262, 0, 0.4666667, 1, 1,
0.2666394, 1.219639, -0.4941877, 0, 0.4588235, 1, 1,
0.267084, 0.1400737, 2.63266, 0, 0.454902, 1, 1,
0.2694043, -0.03965521, 2.014375, 0, 0.4470588, 1, 1,
0.2704528, 1.390336, -0.913048, 0, 0.4431373, 1, 1,
0.2721433, -0.6125172, 4.00642, 0, 0.4352941, 1, 1,
0.2775827, -0.4770014, 1.576884, 0, 0.4313726, 1, 1,
0.2825605, 1.146904, 1.252629, 0, 0.4235294, 1, 1,
0.2826271, 0.1120697, 1.888741, 0, 0.4196078, 1, 1,
0.2836651, -1.121745, 2.949457, 0, 0.4117647, 1, 1,
0.2842452, 0.3477471, 0.0163359, 0, 0.4078431, 1, 1,
0.2871051, 0.378344, 0.2319387, 0, 0.4, 1, 1,
0.2881499, -0.7408072, 2.547014, 0, 0.3921569, 1, 1,
0.2916361, -0.4058779, 3.418321, 0, 0.3882353, 1, 1,
0.2952586, 0.8312421, 0.09475148, 0, 0.3803922, 1, 1,
0.2999078, 0.6522014, 0.9617193, 0, 0.3764706, 1, 1,
0.3016825, -2.689238, 1.567673, 0, 0.3686275, 1, 1,
0.3052259, -0.1803047, 2.469933, 0, 0.3647059, 1, 1,
0.3078122, 0.3949652, -0.2652158, 0, 0.3568628, 1, 1,
0.3079744, 1.031255, 0.1344589, 0, 0.3529412, 1, 1,
0.3092571, 1.020054, -0.7034211, 0, 0.345098, 1, 1,
0.3120933, -0.8501788, 1.236518, 0, 0.3411765, 1, 1,
0.3121629, -0.8402216, 3.383282, 0, 0.3333333, 1, 1,
0.3135054, 0.4742683, 2.037966, 0, 0.3294118, 1, 1,
0.3135943, 0.8524475, -1.599313, 0, 0.3215686, 1, 1,
0.3179791, -0.3115445, 2.435833, 0, 0.3176471, 1, 1,
0.3184259, -0.1654827, 4.035927, 0, 0.3098039, 1, 1,
0.3219593, -2.054809, 2.540624, 0, 0.3058824, 1, 1,
0.3272118, 0.5971732, 0.506003, 0, 0.2980392, 1, 1,
0.3272931, 1.51231, -0.2599394, 0, 0.2901961, 1, 1,
0.3279839, -0.08353196, 2.374476, 0, 0.2862745, 1, 1,
0.3304057, -1.193599, 3.740237, 0, 0.2784314, 1, 1,
0.3349258, -0.9882276, 3.251304, 0, 0.2745098, 1, 1,
0.3357676, -0.6230974, 1.582075, 0, 0.2666667, 1, 1,
0.339685, -0.4320523, 0.2892778, 0, 0.2627451, 1, 1,
0.3427063, -0.6977568, 2.030507, 0, 0.254902, 1, 1,
0.3447597, 1.145669, -0.2131696, 0, 0.2509804, 1, 1,
0.3447889, -0.2147171, 3.93526, 0, 0.2431373, 1, 1,
0.3461398, -0.3383802, 2.39313, 0, 0.2392157, 1, 1,
0.3478444, 1.328955, 0.3546794, 0, 0.2313726, 1, 1,
0.3511371, -0.6876665, 3.279664, 0, 0.227451, 1, 1,
0.3572577, 0.5233282, 1.543289, 0, 0.2196078, 1, 1,
0.3600452, 0.325631, 0.3954852, 0, 0.2156863, 1, 1,
0.3634335, -0.6310281, 3.599815, 0, 0.2078431, 1, 1,
0.3638551, -0.4229677, 0.326038, 0, 0.2039216, 1, 1,
0.3671981, -0.1900581, 3.10938, 0, 0.1960784, 1, 1,
0.3709729, -1.472795, 2.115792, 0, 0.1882353, 1, 1,
0.3782973, 1.528841, 2.113196, 0, 0.1843137, 1, 1,
0.3807117, 1.059739, -0.03780789, 0, 0.1764706, 1, 1,
0.3864864, -1.233784, 4.586775, 0, 0.172549, 1, 1,
0.3947154, 0.07106423, 0.8107905, 0, 0.1647059, 1, 1,
0.3956333, -0.1534859, 1.109117, 0, 0.1607843, 1, 1,
0.3983703, 0.2410636, -0.6363512, 0, 0.1529412, 1, 1,
0.3988933, -0.02538706, 0.8494556, 0, 0.1490196, 1, 1,
0.3989567, 0.3750511, 1.647388, 0, 0.1411765, 1, 1,
0.4008035, -0.03324455, 2.338226, 0, 0.1372549, 1, 1,
0.4011547, -0.2593546, 4.132669, 0, 0.1294118, 1, 1,
0.4041874, 1.472333, 0.003325523, 0, 0.1254902, 1, 1,
0.4065082, -0.5162848, 0.8992869, 0, 0.1176471, 1, 1,
0.4080517, 0.7067145, 0.296083, 0, 0.1137255, 1, 1,
0.4170169, 0.3396119, 0.546636, 0, 0.1058824, 1, 1,
0.4181531, -0.520262, 2.686892, 0, 0.09803922, 1, 1,
0.419379, 0.4129313, -0.4824647, 0, 0.09411765, 1, 1,
0.4198973, -0.9076864, 3.413191, 0, 0.08627451, 1, 1,
0.4231018, 2.136986, 0.1538848, 0, 0.08235294, 1, 1,
0.423863, -0.8125144, 2.438526, 0, 0.07450981, 1, 1,
0.4243646, -0.01020535, 1.591201, 0, 0.07058824, 1, 1,
0.425101, -1.366082, 2.913037, 0, 0.0627451, 1, 1,
0.4536858, 1.468762, -0.5502477, 0, 0.05882353, 1, 1,
0.4545211, -0.1725725, 2.261867, 0, 0.05098039, 1, 1,
0.4546091, -1.731936, 3.314526, 0, 0.04705882, 1, 1,
0.4569157, 0.2590701, 1.010127, 0, 0.03921569, 1, 1,
0.4624242, -0.8819962, 4.518862, 0, 0.03529412, 1, 1,
0.4648514, -0.7613147, 1.232627, 0, 0.02745098, 1, 1,
0.4649309, 0.5679834, -0.2575385, 0, 0.02352941, 1, 1,
0.4654293, 0.731664, 0.6548067, 0, 0.01568628, 1, 1,
0.4689236, 0.4868008, 0.2311054, 0, 0.01176471, 1, 1,
0.4734509, 0.2864374, 1.979129, 0, 0.003921569, 1, 1,
0.4735113, -1.414655, 2.129918, 0.003921569, 0, 1, 1,
0.4766394, -0.3862682, 1.540209, 0.007843138, 0, 1, 1,
0.4805529, 0.1641038, 2.217794, 0.01568628, 0, 1, 1,
0.485473, 0.02783911, 1.555801, 0.01960784, 0, 1, 1,
0.486089, -1.396815, 4.784117, 0.02745098, 0, 1, 1,
0.4907105, 2.2469, 0.01485562, 0.03137255, 0, 1, 1,
0.493446, -1.20852, 2.681709, 0.03921569, 0, 1, 1,
0.4943849, -1.494899, 4.106917, 0.04313726, 0, 1, 1,
0.4967459, -0.4438067, 2.595119, 0.05098039, 0, 1, 1,
0.4982617, -0.2912356, 1.722483, 0.05490196, 0, 1, 1,
0.498861, 1.955759, 0.3048515, 0.0627451, 0, 1, 1,
0.502228, 0.4466148, 1.559667, 0.06666667, 0, 1, 1,
0.5057098, 0.6603889, 1.08566, 0.07450981, 0, 1, 1,
0.5078114, 0.8170717, 0.6489916, 0.07843138, 0, 1, 1,
0.5110162, 0.4775048, 0.1328113, 0.08627451, 0, 1, 1,
0.5160649, 0.8083498, -0.4708473, 0.09019608, 0, 1, 1,
0.5183607, 0.8325769, 0.02727343, 0.09803922, 0, 1, 1,
0.5216911, -0.4041688, 4.629749, 0.1058824, 0, 1, 1,
0.5255801, -1.192959, -0.1645433, 0.1098039, 0, 1, 1,
0.5274943, -0.6745158, 3.078174, 0.1176471, 0, 1, 1,
0.5299767, 1.294007, 1.165775, 0.1215686, 0, 1, 1,
0.5307326, -1.200188, 3.078902, 0.1294118, 0, 1, 1,
0.5317056, -0.4685466, 2.001374, 0.1333333, 0, 1, 1,
0.53487, 1.435305, 0.8049427, 0.1411765, 0, 1, 1,
0.5488124, 0.00437365, 3.255624, 0.145098, 0, 1, 1,
0.5488998, -0.8204981, 3.595334, 0.1529412, 0, 1, 1,
0.5501747, -0.5238498, 0.9435106, 0.1568628, 0, 1, 1,
0.551732, -2.098199, 2.687081, 0.1647059, 0, 1, 1,
0.5563801, 0.9986299, 1.507477, 0.1686275, 0, 1, 1,
0.5572204, -0.7336807, 2.289011, 0.1764706, 0, 1, 1,
0.5579866, -1.007687, 2.745349, 0.1803922, 0, 1, 1,
0.5594985, 0.06417437, 2.838637, 0.1882353, 0, 1, 1,
0.5611553, 0.1300171, 0.6500708, 0.1921569, 0, 1, 1,
0.5653695, 0.5585467, 0.296992, 0.2, 0, 1, 1,
0.5675851, 0.2808702, 0.3436054, 0.2078431, 0, 1, 1,
0.5685527, 0.3172488, -0.7871861, 0.2117647, 0, 1, 1,
0.5704105, -0.4524178, 3.544471, 0.2196078, 0, 1, 1,
0.577567, 0.9189877, 0.7878148, 0.2235294, 0, 1, 1,
0.578104, -0.7928164, 1.84379, 0.2313726, 0, 1, 1,
0.5783402, -1.529578, 1.599792, 0.2352941, 0, 1, 1,
0.5793331, 0.005381585, 1.582955, 0.2431373, 0, 1, 1,
0.5835735, 0.1663608, 3.129426, 0.2470588, 0, 1, 1,
0.5871395, -0.6267679, 1.232244, 0.254902, 0, 1, 1,
0.5925059, 0.6437697, 2.02145, 0.2588235, 0, 1, 1,
0.5950423, 0.7085696, 1.72166, 0.2666667, 0, 1, 1,
0.5955673, 0.07129238, 0.705922, 0.2705882, 0, 1, 1,
0.5982274, 0.5946235, -0.4213023, 0.2784314, 0, 1, 1,
0.6010085, -0.5682929, 2.645233, 0.282353, 0, 1, 1,
0.6023816, 0.4860005, 2.398931, 0.2901961, 0, 1, 1,
0.6057339, 0.3742535, 1.887198, 0.2941177, 0, 1, 1,
0.6128201, 0.3645857, 0.9019908, 0.3019608, 0, 1, 1,
0.6187514, -0.3368548, 0.9309552, 0.3098039, 0, 1, 1,
0.6212981, -0.04265508, 2.03145, 0.3137255, 0, 1, 1,
0.6226739, -0.6374748, 1.737643, 0.3215686, 0, 1, 1,
0.6377318, 0.2138496, 1.172037, 0.3254902, 0, 1, 1,
0.6504881, 0.6968927, 0.2914779, 0.3333333, 0, 1, 1,
0.6506032, -0.7071332, 3.60919, 0.3372549, 0, 1, 1,
0.6640439, -0.6573038, 0.8368543, 0.345098, 0, 1, 1,
0.6660078, 2.976328, 0.4337861, 0.3490196, 0, 1, 1,
0.6664525, 0.2464944, -0.5682193, 0.3568628, 0, 1, 1,
0.6664661, -0.480437, 2.503561, 0.3607843, 0, 1, 1,
0.6712674, -0.2067935, 2.660033, 0.3686275, 0, 1, 1,
0.6795073, -0.08025222, 1.39896, 0.372549, 0, 1, 1,
0.6803415, 0.4817007, 0.3408079, 0.3803922, 0, 1, 1,
0.6841882, 0.7174215, 2.564933, 0.3843137, 0, 1, 1,
0.6867278, -1.469826, 2.646713, 0.3921569, 0, 1, 1,
0.6900215, 1.042903, 3.53573, 0.3960784, 0, 1, 1,
0.6904957, 0.3173916, 0.9133249, 0.4039216, 0, 1, 1,
0.6925923, -0.5149237, 2.183967, 0.4117647, 0, 1, 1,
0.7014469, 0.2425391, 3.123168, 0.4156863, 0, 1, 1,
0.7041724, -1.05737, 0.9791117, 0.4235294, 0, 1, 1,
0.7051181, 0.3172827, 1.126727, 0.427451, 0, 1, 1,
0.7081015, -1.00669, 3.002627, 0.4352941, 0, 1, 1,
0.7129401, 0.06919923, 1.83283, 0.4392157, 0, 1, 1,
0.7195504, 0.4485244, 0.685607, 0.4470588, 0, 1, 1,
0.7207999, -1.667165, 1.304024, 0.4509804, 0, 1, 1,
0.7294283, -0.4340598, 2.134589, 0.4588235, 0, 1, 1,
0.7314019, -0.3961575, 2.897715, 0.4627451, 0, 1, 1,
0.7316331, -0.8950019, 2.614946, 0.4705882, 0, 1, 1,
0.7338882, -0.2059121, 1.896994, 0.4745098, 0, 1, 1,
0.7401623, -1.381407, 1.914291, 0.4823529, 0, 1, 1,
0.7472311, 1.101659, -0.2395499, 0.4862745, 0, 1, 1,
0.7486575, -0.5965319, 3.12353, 0.4941176, 0, 1, 1,
0.7525125, -0.07466603, 2.144605, 0.5019608, 0, 1, 1,
0.7568059, 0.6714104, 1.313533, 0.5058824, 0, 1, 1,
0.7593911, 1.091035, 1.585158, 0.5137255, 0, 1, 1,
0.7620083, -1.325886, 2.646478, 0.5176471, 0, 1, 1,
0.7676298, 0.08373003, 3.595907, 0.5254902, 0, 1, 1,
0.7709278, -0.0962311, 3.050052, 0.5294118, 0, 1, 1,
0.7760031, 0.2224276, 2.094124, 0.5372549, 0, 1, 1,
0.7790112, -0.8065889, 3.141238, 0.5411765, 0, 1, 1,
0.7796032, -0.2383914, 2.246139, 0.5490196, 0, 1, 1,
0.779794, -0.008130037, 1.680676, 0.5529412, 0, 1, 1,
0.7834969, -1.876271, 1.372629, 0.5607843, 0, 1, 1,
0.7842869, -1.43369, 1.980187, 0.5647059, 0, 1, 1,
0.7849016, -0.2158651, 0.5655636, 0.572549, 0, 1, 1,
0.7877154, 0.2910822, 1.314038, 0.5764706, 0, 1, 1,
0.795559, 1.067739, 0.1787326, 0.5843138, 0, 1, 1,
0.7973031, 0.8491661, -1.832693, 0.5882353, 0, 1, 1,
0.798647, 1.601142, 0.5130534, 0.5960785, 0, 1, 1,
0.8005838, -0.642848, 2.991764, 0.6039216, 0, 1, 1,
0.8100414, -0.2914619, 1.276663, 0.6078432, 0, 1, 1,
0.8101844, 1.556615, -1.73695, 0.6156863, 0, 1, 1,
0.8159693, -0.5681227, 1.546273, 0.6196079, 0, 1, 1,
0.8198751, -0.434987, 2.234662, 0.627451, 0, 1, 1,
0.8206493, 0.5725762, -0.5119362, 0.6313726, 0, 1, 1,
0.8232786, 0.05665665, 2.538687, 0.6392157, 0, 1, 1,
0.8262197, -0.06894784, 1.622668, 0.6431373, 0, 1, 1,
0.8266745, 1.362141, -1.23789, 0.6509804, 0, 1, 1,
0.8273152, -0.4839052, 1.312902, 0.654902, 0, 1, 1,
0.8329651, -1.188318, 2.381485, 0.6627451, 0, 1, 1,
0.8391879, 0.3689028, 1.895473, 0.6666667, 0, 1, 1,
0.8441843, 0.5364181, 0.6313635, 0.6745098, 0, 1, 1,
0.8442801, -0.1779033, 2.750304, 0.6784314, 0, 1, 1,
0.8535306, 0.06362335, 3.966315, 0.6862745, 0, 1, 1,
0.8593579, 1.131305, 1.385533, 0.6901961, 0, 1, 1,
0.8599092, -0.6926664, 2.595277, 0.6980392, 0, 1, 1,
0.8736767, -0.499488, 0.4253287, 0.7058824, 0, 1, 1,
0.8784029, -1.581679, 1.479074, 0.7098039, 0, 1, 1,
0.8789224, -0.3689622, 1.219372, 0.7176471, 0, 1, 1,
0.8815488, -1.173198, 3.961836, 0.7215686, 0, 1, 1,
0.8846419, -0.1198675, 2.339939, 0.7294118, 0, 1, 1,
0.8862277, 0.7081361, 2.162786, 0.7333333, 0, 1, 1,
0.8863092, -0.4637651, 2.784007, 0.7411765, 0, 1, 1,
0.8864242, 0.8110752, 1.047749, 0.7450981, 0, 1, 1,
0.8874312, 0.5528663, 1.427963, 0.7529412, 0, 1, 1,
0.8904945, -0.01909889, 2.084869, 0.7568628, 0, 1, 1,
0.8916961, -0.2213757, -0.05423653, 0.7647059, 0, 1, 1,
0.8954986, 0.9134377, -0.2168241, 0.7686275, 0, 1, 1,
0.8959321, -0.6022947, 1.841757, 0.7764706, 0, 1, 1,
0.9011041, -0.6823768, 1.890701, 0.7803922, 0, 1, 1,
0.9018394, 0.4884656, 1.753879, 0.7882353, 0, 1, 1,
0.9121005, 0.2306153, 0.5626354, 0.7921569, 0, 1, 1,
0.9141227, 1.126368, -0.6677019, 0.8, 0, 1, 1,
0.9152502, 0.1043058, 1.037161, 0.8078431, 0, 1, 1,
0.9159566, -0.8112131, 1.837781, 0.8117647, 0, 1, 1,
0.918615, 2.220259, 1.556022, 0.8196079, 0, 1, 1,
0.9195697, -0.3606522, 2.454826, 0.8235294, 0, 1, 1,
0.92162, 2.276723, 1.53027, 0.8313726, 0, 1, 1,
0.9289704, 0.8249716, 0.08065059, 0.8352941, 0, 1, 1,
0.9401543, 1.391811, -0.4465661, 0.8431373, 0, 1, 1,
0.943482, -0.792537, 1.395228, 0.8470588, 0, 1, 1,
0.9435548, -0.0512409, 0.6378947, 0.854902, 0, 1, 1,
0.9446343, -1.153876, 2.631379, 0.8588235, 0, 1, 1,
0.9456418, -2.951823, 2.106987, 0.8666667, 0, 1, 1,
0.945721, 0.8031817, 1.753753, 0.8705882, 0, 1, 1,
0.9467004, 0.7693961, 1.607758, 0.8784314, 0, 1, 1,
0.9553965, 1.020838, 1.679105, 0.8823529, 0, 1, 1,
0.9719154, -0.4361194, 2.843056, 0.8901961, 0, 1, 1,
0.9758773, 0.5712474, 0.1079511, 0.8941177, 0, 1, 1,
0.9781685, 1.062096, 1.1035, 0.9019608, 0, 1, 1,
0.9797184, -0.8938725, 2.271359, 0.9098039, 0, 1, 1,
0.9801888, -0.002894716, 0.9163077, 0.9137255, 0, 1, 1,
0.9822031, -1.008833, 2.721727, 0.9215686, 0, 1, 1,
0.9837905, 0.2164742, 2.539419, 0.9254902, 0, 1, 1,
0.9842322, -0.3985687, 1.240434, 0.9333333, 0, 1, 1,
0.9853023, 1.509524, -1.437598, 0.9372549, 0, 1, 1,
0.9944898, 0.4282353, -1.154609, 0.945098, 0, 1, 1,
0.995333, -1.619568, 2.884463, 0.9490196, 0, 1, 1,
0.9976325, -2.141833, 3.066843, 0.9568627, 0, 1, 1,
0.9980903, 0.8944466, 0.3573536, 0.9607843, 0, 1, 1,
0.998937, 0.02647731, 2.268949, 0.9686275, 0, 1, 1,
1.001615, -2.050124, 2.510643, 0.972549, 0, 1, 1,
1.020119, 1.0482, 0.2140993, 0.9803922, 0, 1, 1,
1.022804, 0.3259555, -0.1041314, 0.9843137, 0, 1, 1,
1.025188, -0.2632483, 3.720924, 0.9921569, 0, 1, 1,
1.028728, 0.09093987, 0.812303, 0.9960784, 0, 1, 1,
1.029351, -0.5287047, 2.128477, 1, 0, 0.9960784, 1,
1.032529, 1.005968, 1.366704, 1, 0, 0.9882353, 1,
1.035478, 0.2520798, 0.7956192, 1, 0, 0.9843137, 1,
1.036134, 0.7434306, 0.9327792, 1, 0, 0.9764706, 1,
1.041614, -0.03711734, -0.692791, 1, 0, 0.972549, 1,
1.051941, -0.5729524, 1.766584, 1, 0, 0.9647059, 1,
1.053316, -1.611898, 3.808854, 1, 0, 0.9607843, 1,
1.060125, -0.0282049, 2.560375, 1, 0, 0.9529412, 1,
1.085197, 0.5994255, 0.9822388, 1, 0, 0.9490196, 1,
1.089425, 0.2863941, 1.700393, 1, 0, 0.9411765, 1,
1.091806, -1.078605, 2.687871, 1, 0, 0.9372549, 1,
1.094112, 1.57829, -0.8042758, 1, 0, 0.9294118, 1,
1.098728, 0.7668471, 1.590893, 1, 0, 0.9254902, 1,
1.101403, -2.142754, 1.932377, 1, 0, 0.9176471, 1,
1.101956, -0.4919479, 1.486261, 1, 0, 0.9137255, 1,
1.102845, 0.9095158, -0.141705, 1, 0, 0.9058824, 1,
1.106901, 1.406486, 0.0715028, 1, 0, 0.9019608, 1,
1.10712, -1.787737, 2.488903, 1, 0, 0.8941177, 1,
1.107229, -0.3528719, 0.8767037, 1, 0, 0.8862745, 1,
1.107982, 0.6089749, -0.6356714, 1, 0, 0.8823529, 1,
1.111036, 1.285308, 1.399551, 1, 0, 0.8745098, 1,
1.113219, 1.594603, 0.9789931, 1, 0, 0.8705882, 1,
1.113565, -0.1003812, 2.904112, 1, 0, 0.8627451, 1,
1.117667, 1.140903, 0.2043173, 1, 0, 0.8588235, 1,
1.121253, 0.2562693, 0.4153141, 1, 0, 0.8509804, 1,
1.129586, -0.1906027, 1.256967, 1, 0, 0.8470588, 1,
1.132228, 0.1009966, 1.667842, 1, 0, 0.8392157, 1,
1.136709, -0.3269907, 2.924174, 1, 0, 0.8352941, 1,
1.149667, -1.254957, 2.61079, 1, 0, 0.827451, 1,
1.150941, -0.9959456, 1.51451, 1, 0, 0.8235294, 1,
1.154547, -0.3758071, 0.6784796, 1, 0, 0.8156863, 1,
1.156995, -0.4827915, 2.855344, 1, 0, 0.8117647, 1,
1.166268, -0.003492436, 3.057155, 1, 0, 0.8039216, 1,
1.182299, -0.223852, 1.740148, 1, 0, 0.7960784, 1,
1.183643, -0.6823979, 0.5511132, 1, 0, 0.7921569, 1,
1.185066, -1.211648, 2.347534, 1, 0, 0.7843137, 1,
1.186682, 0.4493848, 1.537656, 1, 0, 0.7803922, 1,
1.19229, -0.686111, 2.985087, 1, 0, 0.772549, 1,
1.192616, -0.4836802, 0.7340826, 1, 0, 0.7686275, 1,
1.198516, 0.03579022, 1.281487, 1, 0, 0.7607843, 1,
1.200683, 0.7859805, 1.201211, 1, 0, 0.7568628, 1,
1.202422, -1.046825, 3.182531, 1, 0, 0.7490196, 1,
1.217371, -0.5515386, 2.400046, 1, 0, 0.7450981, 1,
1.217651, 0.3461713, 2.002122, 1, 0, 0.7372549, 1,
1.218259, -0.2040173, 2.473136, 1, 0, 0.7333333, 1,
1.223205, 0.7108498, 1.312241, 1, 0, 0.7254902, 1,
1.223222, 0.2768839, 1.995159, 1, 0, 0.7215686, 1,
1.226001, 1.122751, 2.245259, 1, 0, 0.7137255, 1,
1.227514, 0.01962641, 0.5826315, 1, 0, 0.7098039, 1,
1.233849, -0.9289645, 1.936375, 1, 0, 0.7019608, 1,
1.233893, -0.04305192, 1.675599, 1, 0, 0.6941177, 1,
1.23674, 0.05302351, 0.787255, 1, 0, 0.6901961, 1,
1.248234, 0.5442671, 2.23287, 1, 0, 0.682353, 1,
1.252663, -0.1770604, 1.163352, 1, 0, 0.6784314, 1,
1.252697, -0.5922696, 1.479882, 1, 0, 0.6705883, 1,
1.258789, 1.179403, 0.6706049, 1, 0, 0.6666667, 1,
1.260983, 0.1218999, 3.896761, 1, 0, 0.6588235, 1,
1.261641, 0.8686869, 0.5833696, 1, 0, 0.654902, 1,
1.276913, -0.3485985, 2.472478, 1, 0, 0.6470588, 1,
1.288156, 0.5242662, 0.8258356, 1, 0, 0.6431373, 1,
1.299712, 0.4102058, 1.804746, 1, 0, 0.6352941, 1,
1.302569, 0.200426, 0.9301698, 1, 0, 0.6313726, 1,
1.305918, -0.08060394, 1.96397, 1, 0, 0.6235294, 1,
1.306261, -1.577423, 2.880881, 1, 0, 0.6196079, 1,
1.31056, -0.05327957, 2.970458, 1, 0, 0.6117647, 1,
1.320033, 1.120429, 0.8659146, 1, 0, 0.6078432, 1,
1.321284, 0.126499, 1.028351, 1, 0, 0.6, 1,
1.326663, -1.134516, 4.165307, 1, 0, 0.5921569, 1,
1.341608, 0.08132625, -0.2854288, 1, 0, 0.5882353, 1,
1.354631, -2.539668, 2.539561, 1, 0, 0.5803922, 1,
1.354989, -2.005652, 2.85593, 1, 0, 0.5764706, 1,
1.357269, -0.1228791, 0.3208597, 1, 0, 0.5686275, 1,
1.365566, 0.02266916, 2.842208, 1, 0, 0.5647059, 1,
1.372834, -0.5347003, 1.8425, 1, 0, 0.5568628, 1,
1.373892, 0.4908805, 0.4744925, 1, 0, 0.5529412, 1,
1.376159, -0.5903456, 1.028716, 1, 0, 0.5450981, 1,
1.379358, -1.638285, 3.704157, 1, 0, 0.5411765, 1,
1.393202, -0.2395304, 0.6217536, 1, 0, 0.5333334, 1,
1.396057, -1.080586, 1.287175, 1, 0, 0.5294118, 1,
1.410066, 0.0235022, 0.2219242, 1, 0, 0.5215687, 1,
1.419916, 1.243217, 0.5061595, 1, 0, 0.5176471, 1,
1.437613, -0.6309084, 2.807867, 1, 0, 0.509804, 1,
1.44219, 0.5832217, -0.5365023, 1, 0, 0.5058824, 1,
1.450896, -0.6058955, 2.192048, 1, 0, 0.4980392, 1,
1.459452, -0.1333569, 2.046226, 1, 0, 0.4901961, 1,
1.467195, 1.299047, 1.083105, 1, 0, 0.4862745, 1,
1.470261, 1.507598, -0.5272332, 1, 0, 0.4784314, 1,
1.483171, 0.983251, -0.2128998, 1, 0, 0.4745098, 1,
1.48421, 0.1668455, 2.368083, 1, 0, 0.4666667, 1,
1.491176, 0.932965, 1.788695, 1, 0, 0.4627451, 1,
1.493068, 0.008072534, 2.447799, 1, 0, 0.454902, 1,
1.519067, -0.4699623, 1.2532, 1, 0, 0.4509804, 1,
1.521651, 0.0445563, 0.3331668, 1, 0, 0.4431373, 1,
1.523854, 0.9947106, 1.586216, 1, 0, 0.4392157, 1,
1.526789, 0.4120719, 1.663881, 1, 0, 0.4313726, 1,
1.530464, -1.277215, 2.393226, 1, 0, 0.427451, 1,
1.536875, 0.9559349, -1.043789, 1, 0, 0.4196078, 1,
1.539714, 2.218419, -0.9654513, 1, 0, 0.4156863, 1,
1.551051, -2.396714, 2.605911, 1, 0, 0.4078431, 1,
1.564356, -0.6579677, 1.348056, 1, 0, 0.4039216, 1,
1.566612, 0.5860214, 1.996827, 1, 0, 0.3960784, 1,
1.568753, 0.5517914, 2.093622, 1, 0, 0.3882353, 1,
1.57012, -0.4354783, 0.5573089, 1, 0, 0.3843137, 1,
1.575625, 0.665426, 1.775971, 1, 0, 0.3764706, 1,
1.581036, -0.05864726, 1.794263, 1, 0, 0.372549, 1,
1.611175, 0.5386161, 0.6224806, 1, 0, 0.3647059, 1,
1.618742, -0.03013107, 2.184808, 1, 0, 0.3607843, 1,
1.620195, 0.7017835, 1.347476, 1, 0, 0.3529412, 1,
1.627257, 0.7404324, 2.817234, 1, 0, 0.3490196, 1,
1.644646, 0.842694, 1.373886, 1, 0, 0.3411765, 1,
1.644874, -2.186455, 2.068781, 1, 0, 0.3372549, 1,
1.655683, 2.198498, 1.887048, 1, 0, 0.3294118, 1,
1.658755, 0.3311269, 2.359785, 1, 0, 0.3254902, 1,
1.672694, 0.751283, 1.920702, 1, 0, 0.3176471, 1,
1.702673, -0.3700815, 0.7368422, 1, 0, 0.3137255, 1,
1.721669, 0.4691759, 0.849789, 1, 0, 0.3058824, 1,
1.724009, 0.7696673, 2.178816, 1, 0, 0.2980392, 1,
1.733009, 0.09698206, 1.535965, 1, 0, 0.2941177, 1,
1.748345, -0.7654518, 2.119636, 1, 0, 0.2862745, 1,
1.773021, 0.5217386, 1.512966, 1, 0, 0.282353, 1,
1.790598, 0.4704933, -1.004255, 1, 0, 0.2745098, 1,
1.792072, -0.0787394, 0.6380382, 1, 0, 0.2705882, 1,
1.797513, 1.071236, 0.8232506, 1, 0, 0.2627451, 1,
1.818692, -0.4435161, 1.877129, 1, 0, 0.2588235, 1,
1.830246, 0.7653644, 1.058745, 1, 0, 0.2509804, 1,
1.834954, 0.4229375, -0.3708434, 1, 0, 0.2470588, 1,
1.844871, -1.426729, 2.341651, 1, 0, 0.2392157, 1,
1.845389, -0.9376804, 1.482694, 1, 0, 0.2352941, 1,
1.850065, -0.3120542, 2.374038, 1, 0, 0.227451, 1,
1.850162, -0.4958798, 1.830734, 1, 0, 0.2235294, 1,
1.850336, 0.1031633, 2.062485, 1, 0, 0.2156863, 1,
1.865078, -0.9729047, 1.726991, 1, 0, 0.2117647, 1,
1.866011, -0.5855619, 2.090541, 1, 0, 0.2039216, 1,
1.872425, 0.4790052, 0.9868804, 1, 0, 0.1960784, 1,
1.896302, 0.07833473, -0.07582082, 1, 0, 0.1921569, 1,
1.900635, 1.68372, 0.05374969, 1, 0, 0.1843137, 1,
1.918496, 2.300472, 0.2604362, 1, 0, 0.1803922, 1,
1.931383, 0.5051335, 1.866876, 1, 0, 0.172549, 1,
1.940499, 0.267486, -0.5915273, 1, 0, 0.1686275, 1,
1.954902, -0.842243, 0.4859201, 1, 0, 0.1607843, 1,
1.955206, 0.5700426, 0.3239035, 1, 0, 0.1568628, 1,
1.966066, 1.589591, 2.241374, 1, 0, 0.1490196, 1,
1.966628, 0.181707, 1.268132, 1, 0, 0.145098, 1,
1.967255, -0.6502627, 2.279726, 1, 0, 0.1372549, 1,
1.982265, -0.8256094, 0.2277077, 1, 0, 0.1333333, 1,
1.985946, -2.430601, 6.159911, 1, 0, 0.1254902, 1,
2.015671, -1.685724, 2.514137, 1, 0, 0.1215686, 1,
2.021943, 0.8997239, 1.485796, 1, 0, 0.1137255, 1,
2.065959, 0.9629618, 0.814786, 1, 0, 0.1098039, 1,
2.085521, 2.582689, 0.8490952, 1, 0, 0.1019608, 1,
2.095979, -0.1841851, 1.290848, 1, 0, 0.09411765, 1,
2.099901, 0.1813521, -0.1236876, 1, 0, 0.09019608, 1,
2.107057, 1.000951, 1.565231, 1, 0, 0.08235294, 1,
2.108081, -0.381581, 1.469492, 1, 0, 0.07843138, 1,
2.173812, 1.001039, 1.369273, 1, 0, 0.07058824, 1,
2.25508, -0.1696635, 3.190582, 1, 0, 0.06666667, 1,
2.291501, 0.4985605, 0.110905, 1, 0, 0.05882353, 1,
2.358713, -1.310555, 2.486249, 1, 0, 0.05490196, 1,
2.397145, 0.4474626, 0.2854937, 1, 0, 0.04705882, 1,
2.511296, -0.1468965, 0.9558108, 1, 0, 0.04313726, 1,
2.529634, -0.8249065, 2.507921, 1, 0, 0.03529412, 1,
2.608135, 1.962433, -0.2890273, 1, 0, 0.03137255, 1,
2.878938, 1.950551, 1.813463, 1, 0, 0.02352941, 1,
2.997164, 2.038789, 0.3012901, 1, 0, 0.01960784, 1,
3.017436, -0.7251548, 2.684767, 1, 0, 0.01176471, 1,
3.89283, -0.6655095, 2.747577, 1, 0, 0.007843138, 1
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
0.4439086, -4.075179, -7.138914, 0, -0.5, 0.5, 0.5,
0.4439086, -4.075179, -7.138914, 1, -0.5, 0.5, 0.5,
0.4439086, -4.075179, -7.138914, 1, 1.5, 0.5, 0.5,
0.4439086, -4.075179, -7.138914, 0, 1.5, 0.5, 0.5
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
-4.174197, -0.03842497, -7.138914, 0, -0.5, 0.5, 0.5,
-4.174197, -0.03842497, -7.138914, 1, -0.5, 0.5, 0.5,
-4.174197, -0.03842497, -7.138914, 1, 1.5, 0.5, 0.5,
-4.174197, -0.03842497, -7.138914, 0, 1.5, 0.5, 0.5
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
-4.174197, -4.075179, 0.4742227, 0, -0.5, 0.5, 0.5,
-4.174197, -4.075179, 0.4742227, 1, -0.5, 0.5, 0.5,
-4.174197, -4.075179, 0.4742227, 1, 1.5, 0.5, 0.5,
-4.174197, -4.075179, 0.4742227, 0, 1.5, 0.5, 0.5
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
-3, -3.14362, -5.382037,
3, -3.14362, -5.382037,
-3, -3.14362, -5.382037,
-3, -3.29888, -5.67485,
-2, -3.14362, -5.382037,
-2, -3.29888, -5.67485,
-1, -3.14362, -5.382037,
-1, -3.29888, -5.67485,
0, -3.14362, -5.382037,
0, -3.29888, -5.67485,
1, -3.14362, -5.382037,
1, -3.29888, -5.67485,
2, -3.14362, -5.382037,
2, -3.29888, -5.67485,
3, -3.14362, -5.382037,
3, -3.29888, -5.67485
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
-3, -3.6094, -6.260475, 0, -0.5, 0.5, 0.5,
-3, -3.6094, -6.260475, 1, -0.5, 0.5, 0.5,
-3, -3.6094, -6.260475, 1, 1.5, 0.5, 0.5,
-3, -3.6094, -6.260475, 0, 1.5, 0.5, 0.5,
-2, -3.6094, -6.260475, 0, -0.5, 0.5, 0.5,
-2, -3.6094, -6.260475, 1, -0.5, 0.5, 0.5,
-2, -3.6094, -6.260475, 1, 1.5, 0.5, 0.5,
-2, -3.6094, -6.260475, 0, 1.5, 0.5, 0.5,
-1, -3.6094, -6.260475, 0, -0.5, 0.5, 0.5,
-1, -3.6094, -6.260475, 1, -0.5, 0.5, 0.5,
-1, -3.6094, -6.260475, 1, 1.5, 0.5, 0.5,
-1, -3.6094, -6.260475, 0, 1.5, 0.5, 0.5,
0, -3.6094, -6.260475, 0, -0.5, 0.5, 0.5,
0, -3.6094, -6.260475, 1, -0.5, 0.5, 0.5,
0, -3.6094, -6.260475, 1, 1.5, 0.5, 0.5,
0, -3.6094, -6.260475, 0, 1.5, 0.5, 0.5,
1, -3.6094, -6.260475, 0, -0.5, 0.5, 0.5,
1, -3.6094, -6.260475, 1, -0.5, 0.5, 0.5,
1, -3.6094, -6.260475, 1, 1.5, 0.5, 0.5,
1, -3.6094, -6.260475, 0, 1.5, 0.5, 0.5,
2, -3.6094, -6.260475, 0, -0.5, 0.5, 0.5,
2, -3.6094, -6.260475, 1, -0.5, 0.5, 0.5,
2, -3.6094, -6.260475, 1, 1.5, 0.5, 0.5,
2, -3.6094, -6.260475, 0, 1.5, 0.5, 0.5,
3, -3.6094, -6.260475, 0, -0.5, 0.5, 0.5,
3, -3.6094, -6.260475, 1, -0.5, 0.5, 0.5,
3, -3.6094, -6.260475, 1, 1.5, 0.5, 0.5,
3, -3.6094, -6.260475, 0, 1.5, 0.5, 0.5
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
-3.10848, -3, -5.382037,
-3.10848, 2, -5.382037,
-3.10848, -3, -5.382037,
-3.2861, -3, -5.67485,
-3.10848, -2, -5.382037,
-3.2861, -2, -5.67485,
-3.10848, -1, -5.382037,
-3.2861, -1, -5.67485,
-3.10848, 0, -5.382037,
-3.2861, 0, -5.67485,
-3.10848, 1, -5.382037,
-3.2861, 1, -5.67485,
-3.10848, 2, -5.382037,
-3.2861, 2, -5.67485
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
-3.641338, -3, -6.260475, 0, -0.5, 0.5, 0.5,
-3.641338, -3, -6.260475, 1, -0.5, 0.5, 0.5,
-3.641338, -3, -6.260475, 1, 1.5, 0.5, 0.5,
-3.641338, -3, -6.260475, 0, 1.5, 0.5, 0.5,
-3.641338, -2, -6.260475, 0, -0.5, 0.5, 0.5,
-3.641338, -2, -6.260475, 1, -0.5, 0.5, 0.5,
-3.641338, -2, -6.260475, 1, 1.5, 0.5, 0.5,
-3.641338, -2, -6.260475, 0, 1.5, 0.5, 0.5,
-3.641338, -1, -6.260475, 0, -0.5, 0.5, 0.5,
-3.641338, -1, -6.260475, 1, -0.5, 0.5, 0.5,
-3.641338, -1, -6.260475, 1, 1.5, 0.5, 0.5,
-3.641338, -1, -6.260475, 0, 1.5, 0.5, 0.5,
-3.641338, 0, -6.260475, 0, -0.5, 0.5, 0.5,
-3.641338, 0, -6.260475, 1, -0.5, 0.5, 0.5,
-3.641338, 0, -6.260475, 1, 1.5, 0.5, 0.5,
-3.641338, 0, -6.260475, 0, 1.5, 0.5, 0.5,
-3.641338, 1, -6.260475, 0, -0.5, 0.5, 0.5,
-3.641338, 1, -6.260475, 1, -0.5, 0.5, 0.5,
-3.641338, 1, -6.260475, 1, 1.5, 0.5, 0.5,
-3.641338, 1, -6.260475, 0, 1.5, 0.5, 0.5,
-3.641338, 2, -6.260475, 0, -0.5, 0.5, 0.5,
-3.641338, 2, -6.260475, 1, -0.5, 0.5, 0.5,
-3.641338, 2, -6.260475, 1, 1.5, 0.5, 0.5,
-3.641338, 2, -6.260475, 0, 1.5, 0.5, 0.5
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
-3.10848, -3.14362, -4,
-3.10848, -3.14362, 6,
-3.10848, -3.14362, -4,
-3.2861, -3.29888, -4,
-3.10848, -3.14362, -2,
-3.2861, -3.29888, -2,
-3.10848, -3.14362, 0,
-3.2861, -3.29888, 0,
-3.10848, -3.14362, 2,
-3.2861, -3.29888, 2,
-3.10848, -3.14362, 4,
-3.2861, -3.29888, 4,
-3.10848, -3.14362, 6,
-3.2861, -3.29888, 6
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
"4",
"6"
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
-3.641338, -3.6094, -4, 0, -0.5, 0.5, 0.5,
-3.641338, -3.6094, -4, 1, -0.5, 0.5, 0.5,
-3.641338, -3.6094, -4, 1, 1.5, 0.5, 0.5,
-3.641338, -3.6094, -4, 0, 1.5, 0.5, 0.5,
-3.641338, -3.6094, -2, 0, -0.5, 0.5, 0.5,
-3.641338, -3.6094, -2, 1, -0.5, 0.5, 0.5,
-3.641338, -3.6094, -2, 1, 1.5, 0.5, 0.5,
-3.641338, -3.6094, -2, 0, 1.5, 0.5, 0.5,
-3.641338, -3.6094, 0, 0, -0.5, 0.5, 0.5,
-3.641338, -3.6094, 0, 1, -0.5, 0.5, 0.5,
-3.641338, -3.6094, 0, 1, 1.5, 0.5, 0.5,
-3.641338, -3.6094, 0, 0, 1.5, 0.5, 0.5,
-3.641338, -3.6094, 2, 0, -0.5, 0.5, 0.5,
-3.641338, -3.6094, 2, 1, -0.5, 0.5, 0.5,
-3.641338, -3.6094, 2, 1, 1.5, 0.5, 0.5,
-3.641338, -3.6094, 2, 0, 1.5, 0.5, 0.5,
-3.641338, -3.6094, 4, 0, -0.5, 0.5, 0.5,
-3.641338, -3.6094, 4, 1, -0.5, 0.5, 0.5,
-3.641338, -3.6094, 4, 1, 1.5, 0.5, 0.5,
-3.641338, -3.6094, 4, 0, 1.5, 0.5, 0.5,
-3.641338, -3.6094, 6, 0, -0.5, 0.5, 0.5,
-3.641338, -3.6094, 6, 1, -0.5, 0.5, 0.5,
-3.641338, -3.6094, 6, 1, 1.5, 0.5, 0.5,
-3.641338, -3.6094, 6, 0, 1.5, 0.5, 0.5
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
-3.10848, -3.14362, -5.382037,
-3.10848, 3.066771, -5.382037,
-3.10848, -3.14362, 6.330482,
-3.10848, 3.066771, 6.330482,
-3.10848, -3.14362, -5.382037,
-3.10848, -3.14362, 6.330482,
-3.10848, 3.066771, -5.382037,
-3.10848, 3.066771, 6.330482,
-3.10848, -3.14362, -5.382037,
3.996297, -3.14362, -5.382037,
-3.10848, -3.14362, 6.330482,
3.996297, -3.14362, 6.330482,
-3.10848, 3.066771, -5.382037,
3.996297, 3.066771, -5.382037,
-3.10848, 3.066771, 6.330482,
3.996297, 3.066771, 6.330482,
3.996297, -3.14362, -5.382037,
3.996297, 3.066771, -5.382037,
3.996297, -3.14362, 6.330482,
3.996297, 3.066771, 6.330482,
3.996297, -3.14362, -5.382037,
3.996297, -3.14362, 6.330482,
3.996297, 3.066771, -5.382037,
3.996297, 3.066771, 6.330482
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
var radius = 8.03157;
var distance = 35.73336;
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
mvMatrix.translate( -0.4439086, 0.03842497, -0.4742227 );
mvMatrix.scale( 1.222261, 1.398284, 0.7414197 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.73336);
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
Talstar<-read.table("Talstar.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Talstar$V2
```

```
## Error in eval(expr, envir, enclos): object 'Talstar' not found
```

```r
y<-Talstar$V3
```

```
## Error in eval(expr, envir, enclos): object 'Talstar' not found
```

```r
z<-Talstar$V4
```

```
## Error in eval(expr, envir, enclos): object 'Talstar' not found
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
-3.005013, -1.837022, -2.080106, 0, 0, 1, 1, 1,
-2.817061, -0.5364181, -0.6571742, 1, 0, 0, 1, 1,
-2.633648, -0.3152134, 0.8300769, 1, 0, 0, 1, 1,
-2.572385, 0.2981497, -0.7264867, 1, 0, 0, 1, 1,
-2.540775, -1.720008, -1.231107, 1, 0, 0, 1, 1,
-2.484742, -0.8586851, -2.650737, 1, 0, 0, 1, 1,
-2.419873, 0.6756576, -2.116628, 0, 0, 0, 1, 1,
-2.334928, 0.5898008, -2.513366, 0, 0, 0, 1, 1,
-2.237897, 0.8928315, -2.21921, 0, 0, 0, 1, 1,
-2.206653, -0.3182893, -2.780292, 0, 0, 0, 1, 1,
-2.178456, -0.02124337, -1.871522, 0, 0, 0, 1, 1,
-2.14649, -0.04928489, -0.3556625, 0, 0, 0, 1, 1,
-2.120858, 1.450876, 0.8472491, 0, 0, 0, 1, 1,
-2.117903, -0.2033616, -2.279512, 1, 1, 1, 1, 1,
-2.116634, -0.396237, -2.856758, 1, 1, 1, 1, 1,
-2.107237, -0.08035324, -0.05871056, 1, 1, 1, 1, 1,
-2.069451, 0.1955746, -1.583389, 1, 1, 1, 1, 1,
-2.068621, -1.375883, -1.691639, 1, 1, 1, 1, 1,
-2.034618, 0.4503375, -1.89696, 1, 1, 1, 1, 1,
-2.010593, -0.4848026, -2.041383, 1, 1, 1, 1, 1,
-1.996111, -0.01778044, -3.383424, 1, 1, 1, 1, 1,
-1.987803, 0.4445385, -2.476123, 1, 1, 1, 1, 1,
-1.971678, 1.240473, -1.955582, 1, 1, 1, 1, 1,
-1.939077, -0.0606766, -0.6510125, 1, 1, 1, 1, 1,
-1.881265, -0.1363845, -1.302657, 1, 1, 1, 1, 1,
-1.874647, -0.3826588, -1.578954, 1, 1, 1, 1, 1,
-1.835835, 0.9032214, -2.489573, 1, 1, 1, 1, 1,
-1.82584, 1.591582, -1.841202, 1, 1, 1, 1, 1,
-1.825353, -0.7841316, -3.599906, 0, 0, 1, 1, 1,
-1.823434, 0.2644189, -1.226001, 1, 0, 0, 1, 1,
-1.823348, 0.600501, -1.68511, 1, 0, 0, 1, 1,
-1.823001, -1.160876, -2.542238, 1, 0, 0, 1, 1,
-1.785341, 0.575349, -1.260269, 1, 0, 0, 1, 1,
-1.778046, -1.629239, -3.131879, 1, 0, 0, 1, 1,
-1.770543, 1.750385, -2.799318, 0, 0, 0, 1, 1,
-1.760801, 0.9073827, -0.4973398, 0, 0, 0, 1, 1,
-1.751642, -1.168251, -2.141268, 0, 0, 0, 1, 1,
-1.740477, -1.57069, -1.213534, 0, 0, 0, 1, 1,
-1.725215, -0.9520705, -3.06622, 0, 0, 0, 1, 1,
-1.724108, 0.1793389, -2.493913, 0, 0, 0, 1, 1,
-1.723287, -0.6042637, -1.633092, 0, 0, 0, 1, 1,
-1.717102, -1.8828, -2.238507, 1, 1, 1, 1, 1,
-1.703788, -0.7558147, -1.533148, 1, 1, 1, 1, 1,
-1.685163, -1.461311, -3.273752, 1, 1, 1, 1, 1,
-1.684019, -0.0003132286, -3.468495, 1, 1, 1, 1, 1,
-1.671571, 1.439018, -0.563131, 1, 1, 1, 1, 1,
-1.669664, -0.6688157, -0.6595913, 1, 1, 1, 1, 1,
-1.650584, -0.7302743, -4.496918, 1, 1, 1, 1, 1,
-1.649838, 1.599789, -2.952343, 1, 1, 1, 1, 1,
-1.638817, 0.8844041, -1.458222, 1, 1, 1, 1, 1,
-1.637389, 0.4582703, -2.906797, 1, 1, 1, 1, 1,
-1.631903, 1.30425, -0.268362, 1, 1, 1, 1, 1,
-1.612155, 0.04851135, -2.41293, 1, 1, 1, 1, 1,
-1.599511, 1.836128, -2.133047, 1, 1, 1, 1, 1,
-1.589063, 0.3353074, -0.2751714, 1, 1, 1, 1, 1,
-1.584608, -1.054442, -2.317009, 1, 1, 1, 1, 1,
-1.582725, -0.3640056, -1.824405, 0, 0, 1, 1, 1,
-1.577753, -0.8330145, -1.684102, 1, 0, 0, 1, 1,
-1.551397, -0.1563275, 0.2581849, 1, 0, 0, 1, 1,
-1.549683, 0.3052782, -1.986536, 1, 0, 0, 1, 1,
-1.543526, 0.4869803, -2.200818, 1, 0, 0, 1, 1,
-1.542306, 0.4680488, -0.8759885, 1, 0, 0, 1, 1,
-1.535946, 1.581383, -3.351228, 0, 0, 0, 1, 1,
-1.533596, 0.3775072, -2.993582, 0, 0, 0, 1, 1,
-1.532598, 0.9996885, -2.190322, 0, 0, 0, 1, 1,
-1.519336, -0.7841844, -2.623761, 0, 0, 0, 1, 1,
-1.502323, 1.505224, -2.382154, 0, 0, 0, 1, 1,
-1.496418, -0.5798363, -0.4463143, 0, 0, 0, 1, 1,
-1.491517, 0.7824352, -1.295742, 0, 0, 0, 1, 1,
-1.46753, -0.3118494, -1.786379, 1, 1, 1, 1, 1,
-1.467386, -1.158522, -1.924863, 1, 1, 1, 1, 1,
-1.460523, -0.181414, -2.571804, 1, 1, 1, 1, 1,
-1.459177, 1.486015, 0.7697114, 1, 1, 1, 1, 1,
-1.417382, -0.3453046, -3.334494, 1, 1, 1, 1, 1,
-1.396952, 0.1732607, -1.385132, 1, 1, 1, 1, 1,
-1.394975, -0.0558815, -2.343994, 1, 1, 1, 1, 1,
-1.393433, -0.4726984, -2.24487, 1, 1, 1, 1, 1,
-1.391129, -1.62102, -1.811823, 1, 1, 1, 1, 1,
-1.385568, -0.1898821, -0.9955669, 1, 1, 1, 1, 1,
-1.383992, -0.4488821, -1.122426, 1, 1, 1, 1, 1,
-1.364313, 0.9192375, 0.0344813, 1, 1, 1, 1, 1,
-1.354212, -0.3656736, -1.653585, 1, 1, 1, 1, 1,
-1.346354, -0.04942105, -2.496213, 1, 1, 1, 1, 1,
-1.346345, -0.6012627, -1.525578, 1, 1, 1, 1, 1,
-1.345978, 0.0268678, -1.104778, 0, 0, 1, 1, 1,
-1.340233, -0.6122771, -0.9323372, 1, 0, 0, 1, 1,
-1.32818, 1.181928, -1.713452, 1, 0, 0, 1, 1,
-1.324602, -0.4919817, -1.155792, 1, 0, 0, 1, 1,
-1.324593, -0.2426817, -2.965029, 1, 0, 0, 1, 1,
-1.320232, -0.1498568, -0.6857719, 1, 0, 0, 1, 1,
-1.318072, 0.2681605, -2.960247, 0, 0, 0, 1, 1,
-1.317562, 0.3960493, -2.076458, 0, 0, 0, 1, 1,
-1.315287, -0.6510615, -1.852857, 0, 0, 0, 1, 1,
-1.31483, 1.102516, -1.235177, 0, 0, 0, 1, 1,
-1.306943, 0.5279549, -1.795921, 0, 0, 0, 1, 1,
-1.288296, -1.031062, -1.999829, 0, 0, 0, 1, 1,
-1.282295, -0.3204482, -2.330106, 0, 0, 0, 1, 1,
-1.28088, -1.824622, -2.577868, 1, 1, 1, 1, 1,
-1.279582, -0.7023741, -1.986182, 1, 1, 1, 1, 1,
-1.266221, 0.1908523, -1.581547, 1, 1, 1, 1, 1,
-1.265285, -0.5001567, -0.2463939, 1, 1, 1, 1, 1,
-1.264563, -0.6055981, -1.028089, 1, 1, 1, 1, 1,
-1.257741, -1.70144, -1.904964, 1, 1, 1, 1, 1,
-1.246363, 0.01710932, -1.23439, 1, 1, 1, 1, 1,
-1.238904, 1.349018, 0.6916735, 1, 1, 1, 1, 1,
-1.237154, 1.913958, -0.8818214, 1, 1, 1, 1, 1,
-1.228583, -1.382713, -3.983095, 1, 1, 1, 1, 1,
-1.226322, -1.086364, -2.056338, 1, 1, 1, 1, 1,
-1.225822, -0.38999, -2.009879, 1, 1, 1, 1, 1,
-1.223663, -0.3686305, -1.133377, 1, 1, 1, 1, 1,
-1.223639, 0.6939602, 1.918189, 1, 1, 1, 1, 1,
-1.218936, 0.5459059, -0.5337652, 1, 1, 1, 1, 1,
-1.218647, 0.003708056, -0.3518485, 0, 0, 1, 1, 1,
-1.211608, -0.6403602, -2.039256, 1, 0, 0, 1, 1,
-1.208992, 0.6101396, -0.7206802, 1, 0, 0, 1, 1,
-1.200964, 0.3812053, -1.515053, 1, 0, 0, 1, 1,
-1.200755, 1.140616, -1.139368, 1, 0, 0, 1, 1,
-1.194192, -2.021709, -1.403903, 1, 0, 0, 1, 1,
-1.186309, 0.3840818, -0.3393716, 0, 0, 0, 1, 1,
-1.183986, 0.4931975, -1.567443, 0, 0, 0, 1, 1,
-1.177665, -1.745551, -3.480738, 0, 0, 0, 1, 1,
-1.176884, 1.108699, -1.871132, 0, 0, 0, 1, 1,
-1.170336, -0.1465749, -3.723994, 0, 0, 0, 1, 1,
-1.169065, -1.991605, -1.087425, 0, 0, 0, 1, 1,
-1.162874, -1.098765, -1.025934, 0, 0, 0, 1, 1,
-1.160825, -0.9070921, -0.8577859, 1, 1, 1, 1, 1,
-1.154594, -0.4270459, -1.542053, 1, 1, 1, 1, 1,
-1.148616, 0.3356078, -1.238111, 1, 1, 1, 1, 1,
-1.145222, 0.5349916, -1.092279, 1, 1, 1, 1, 1,
-1.145193, 0.001163512, -2.587159, 1, 1, 1, 1, 1,
-1.128302, -0.7900825, -1.84485, 1, 1, 1, 1, 1,
-1.125437, 0.22361, -0.3423874, 1, 1, 1, 1, 1,
-1.118981, 0.9712479, -0.5426777, 1, 1, 1, 1, 1,
-1.112415, 1.829412, 0.645739, 1, 1, 1, 1, 1,
-1.101718, 0.562948, -0.3454513, 1, 1, 1, 1, 1,
-1.100491, -0.487135, -1.557396, 1, 1, 1, 1, 1,
-1.098869, -0.09937239, -0.9257091, 1, 1, 1, 1, 1,
-1.098458, 0.1495309, 0.3282342, 1, 1, 1, 1, 1,
-1.091478, 1.120902, -0.2522152, 1, 1, 1, 1, 1,
-1.082922, 0.1193848, -1.03941, 1, 1, 1, 1, 1,
-1.082301, -0.4756425, -1.620367, 0, 0, 1, 1, 1,
-1.082047, 0.5257469, -0.4941895, 1, 0, 0, 1, 1,
-1.075313, -0.4365496, -3.038292, 1, 0, 0, 1, 1,
-1.074585, -0.2464048, -1.695827, 1, 0, 0, 1, 1,
-1.07374, 0.3568664, -1.111932, 1, 0, 0, 1, 1,
-1.073576, -0.3278734, -2.989916, 1, 0, 0, 1, 1,
-1.073483, -0.8811209, -2.064138, 0, 0, 0, 1, 1,
-1.073173, -0.1162085, -0.9604167, 0, 0, 0, 1, 1,
-1.062114, -0.1930352, -2.648238, 0, 0, 0, 1, 1,
-1.060793, -1.306764, -1.243119, 0, 0, 0, 1, 1,
-1.049936, 0.9679793, -1.689537, 0, 0, 0, 1, 1,
-1.049114, 1.416087, -0.2099615, 0, 0, 0, 1, 1,
-1.036981, -0.8735931, -4.067, 0, 0, 0, 1, 1,
-1.034109, 1.003287, 0.4050899, 1, 1, 1, 1, 1,
-1.024385, 0.05806296, -1.451993, 1, 1, 1, 1, 1,
-1.024291, -1.134965, -1.366495, 1, 1, 1, 1, 1,
-1.021657, -0.5576261, -1.833637, 1, 1, 1, 1, 1,
-1.021085, -0.503713, -1.41063, 1, 1, 1, 1, 1,
-1.020855, 2.266148, -0.5296384, 1, 1, 1, 1, 1,
-1.010698, 0.8689107, 0.1937502, 1, 1, 1, 1, 1,
-1.008646, -0.6073557, -2.261502, 1, 1, 1, 1, 1,
-1.005681, -0.8700016, -2.71602, 1, 1, 1, 1, 1,
-1.005074, -0.4923617, -2.244428, 1, 1, 1, 1, 1,
-1.001965, -0.676702, -1.92407, 1, 1, 1, 1, 1,
-1.00173, -0.1931697, -3.687432, 1, 1, 1, 1, 1,
-1.000608, -1.929765, 0.1053543, 1, 1, 1, 1, 1,
-0.9867646, 0.9250126, -0.7765919, 1, 1, 1, 1, 1,
-0.9806851, 0.8413846, -2.96169, 1, 1, 1, 1, 1,
-0.9746275, 0.2655204, -2.016909, 0, 0, 1, 1, 1,
-0.9716635, -0.3849339, -0.4293388, 1, 0, 0, 1, 1,
-0.9667094, -1.64312, -2.149652, 1, 0, 0, 1, 1,
-0.9642301, 0.8715227, 0.5261837, 1, 0, 0, 1, 1,
-0.9578704, -0.9273514, -3.032612, 1, 0, 0, 1, 1,
-0.9503477, 0.5335252, -1.546181, 1, 0, 0, 1, 1,
-0.9477167, -1.40887, -3.008728, 0, 0, 0, 1, 1,
-0.931188, -0.426104, -2.952478, 0, 0, 0, 1, 1,
-0.9251922, 0.695564, -0.852329, 0, 0, 0, 1, 1,
-0.92358, 0.2032907, -3.585233, 0, 0, 0, 1, 1,
-0.9134117, 1.492387, 0.2357476, 0, 0, 0, 1, 1,
-0.9128913, -1.012421, -1.714689, 0, 0, 0, 1, 1,
-0.9123722, 0.1410295, -0.9002919, 0, 0, 0, 1, 1,
-0.9107294, 0.594883, -1.464911, 1, 1, 1, 1, 1,
-0.9080019, -0.747797, -1.721002, 1, 1, 1, 1, 1,
-0.9025386, 0.2827113, -0.3508001, 1, 1, 1, 1, 1,
-0.8959994, -0.2362982, -0.6624655, 1, 1, 1, 1, 1,
-0.8911527, -0.4447917, -2.950211, 1, 1, 1, 1, 1,
-0.8814157, -0.1348014, -0.1517428, 1, 1, 1, 1, 1,
-0.8676943, -0.03999892, -1.700875, 1, 1, 1, 1, 1,
-0.867447, 0.1195002, 0.2760533, 1, 1, 1, 1, 1,
-0.8655846, 0.5204211, -1.072632, 1, 1, 1, 1, 1,
-0.8640255, 0.8304014, -0.9872652, 1, 1, 1, 1, 1,
-0.8640092, 0.3795371, -0.7731082, 1, 1, 1, 1, 1,
-0.8580631, 0.2133705, -2.022055, 1, 1, 1, 1, 1,
-0.8554701, -0.626183, -3.552665, 1, 1, 1, 1, 1,
-0.8490582, 0.997297, -0.5219278, 1, 1, 1, 1, 1,
-0.8479057, 0.05722125, -0.5330335, 1, 1, 1, 1, 1,
-0.8390136, 0.6788495, -1.653202, 0, 0, 1, 1, 1,
-0.8372838, -1.318624, -4.196527, 1, 0, 0, 1, 1,
-0.8305395, -1.34451, -2.261388, 1, 0, 0, 1, 1,
-0.8272223, 0.4586081, -0.5465356, 1, 0, 0, 1, 1,
-0.8271308, -1.584358, -2.671583, 1, 0, 0, 1, 1,
-0.8261409, 0.1044518, -0.4890337, 1, 0, 0, 1, 1,
-0.8195359, -1.523631, -3.064787, 0, 0, 0, 1, 1,
-0.8029379, 0.4336032, -0.3024587, 0, 0, 0, 1, 1,
-0.8001732, -0.2840506, -2.83861, 0, 0, 0, 1, 1,
-0.794709, 1.948755, 0.7333737, 0, 0, 0, 1, 1,
-0.7920948, 0.2476918, -1.988471, 0, 0, 0, 1, 1,
-0.7895614, 0.1048089, -2.142949, 0, 0, 0, 1, 1,
-0.789143, 1.019428, 0.9389406, 0, 0, 0, 1, 1,
-0.7888247, 0.2102178, -2.0116, 1, 1, 1, 1, 1,
-0.7868655, 0.06716823, -1.529175, 1, 1, 1, 1, 1,
-0.7862968, 0.1585866, -0.8621165, 1, 1, 1, 1, 1,
-0.7827646, -0.7851438, -3.885058, 1, 1, 1, 1, 1,
-0.7702962, 0.1972472, -0.7369037, 1, 1, 1, 1, 1,
-0.7672579, -0.4799336, -2.023146, 1, 1, 1, 1, 1,
-0.7624763, -0.4737508, -1.027715, 1, 1, 1, 1, 1,
-0.7596667, -0.5216645, -1.855778, 1, 1, 1, 1, 1,
-0.7541226, -2.964057, -5.030908, 1, 1, 1, 1, 1,
-0.7532958, -0.0620822, -1.28868, 1, 1, 1, 1, 1,
-0.7526501, -0.2310291, -1.959084, 1, 1, 1, 1, 1,
-0.751982, 2.282661, 0.118132, 1, 1, 1, 1, 1,
-0.7487911, -0.4605727, -1.983422, 1, 1, 1, 1, 1,
-0.7421151, -1.329572, -1.878816, 1, 1, 1, 1, 1,
-0.7416412, -0.174168, -1.636842, 1, 1, 1, 1, 1,
-0.7399784, 1.064152, -1.171651, 0, 0, 1, 1, 1,
-0.7375376, -1.818122, -2.585911, 1, 0, 0, 1, 1,
-0.7342021, -2.199867, -3.354152, 1, 0, 0, 1, 1,
-0.7340251, -0.1770454, -3.285423, 1, 0, 0, 1, 1,
-0.7333614, 0.8139893, -0.4027713, 1, 0, 0, 1, 1,
-0.728649, -0.67775, -2.847604, 1, 0, 0, 1, 1,
-0.7239696, -1.118771, -2.782007, 0, 0, 0, 1, 1,
-0.723177, 0.3930016, 1.084028, 0, 0, 0, 1, 1,
-0.7163096, 0.5318958, -1.753675, 0, 0, 0, 1, 1,
-0.7135248, -0.2689267, -2.211884, 0, 0, 0, 1, 1,
-0.7135192, -0.2993815, -2.185035, 0, 0, 0, 1, 1,
-0.7123851, 1.510413, -0.2153389, 0, 0, 0, 1, 1,
-0.7089921, 0.8224505, -1.534568, 0, 0, 0, 1, 1,
-0.7078665, -1.103813, -1.793369, 1, 1, 1, 1, 1,
-0.7068689, 0.2806847, -1.149093, 1, 1, 1, 1, 1,
-0.7062272, 0.6874266, -1.495514, 1, 1, 1, 1, 1,
-0.7018632, -1.982895, -2.495627, 1, 1, 1, 1, 1,
-0.6926371, 0.6721658, -0.01889741, 1, 1, 1, 1, 1,
-0.6922063, 0.3759608, -2.023482, 1, 1, 1, 1, 1,
-0.680638, 1.800482, -1.773951, 1, 1, 1, 1, 1,
-0.6784793, -0.5616738, -2.355131, 1, 1, 1, 1, 1,
-0.6755308, -0.05073677, -1.475708, 1, 1, 1, 1, 1,
-0.6685585, -2.0805, -3.052841, 1, 1, 1, 1, 1,
-0.6667603, 0.5762582, -0.1638807, 1, 1, 1, 1, 1,
-0.665549, 1.259442, 0.3381905, 1, 1, 1, 1, 1,
-0.6633701, -0.1449598, -0.7938568, 1, 1, 1, 1, 1,
-0.6596317, 0.2645844, -0.9871805, 1, 1, 1, 1, 1,
-0.6548403, -0.7182468, -3.900705, 1, 1, 1, 1, 1,
-0.650947, -0.8841259, -3.573049, 0, 0, 1, 1, 1,
-0.6496564, 0.3377246, -0.5096967, 1, 0, 0, 1, 1,
-0.6454611, 0.4769312, 0.2940874, 1, 0, 0, 1, 1,
-0.642114, 0.7230361, -1.193152, 1, 0, 0, 1, 1,
-0.6401231, 0.8794155, 0.4418199, 1, 0, 0, 1, 1,
-0.6369678, 1.658979, 0.246606, 1, 0, 0, 1, 1,
-0.6320921, -0.8477971, -2.038832, 0, 0, 0, 1, 1,
-0.6283483, 0.8087971, -1.702334, 0, 0, 0, 1, 1,
-0.6265889, -0.03491184, -0.4713756, 0, 0, 0, 1, 1,
-0.6265526, 0.682047, -0.961186, 0, 0, 0, 1, 1,
-0.6221055, -1.928121, -2.811091, 0, 0, 0, 1, 1,
-0.614831, -0.4046659, -2.243692, 0, 0, 0, 1, 1,
-0.6055841, -1.44535, 0.6032345, 0, 0, 0, 1, 1,
-0.6045064, 0.01341785, -1.224567, 1, 1, 1, 1, 1,
-0.6041897, -0.7468854, -3.321426, 1, 1, 1, 1, 1,
-0.6036117, -0.3013709, -3.170855, 1, 1, 1, 1, 1,
-0.6014956, -2.058361, -2.706908, 1, 1, 1, 1, 1,
-0.6006716, 0.9139194, -0.353889, 1, 1, 1, 1, 1,
-0.6005121, 0.6478688, 0.09280498, 1, 1, 1, 1, 1,
-0.599437, -0.1408641, -0.7089349, 1, 1, 1, 1, 1,
-0.5990289, 0.1602401, -1.261522, 1, 1, 1, 1, 1,
-0.597753, -0.3192275, -1.733134, 1, 1, 1, 1, 1,
-0.5942028, 0.8426356, 0.351092, 1, 1, 1, 1, 1,
-0.5925441, -0.2450932, -2.374974, 1, 1, 1, 1, 1,
-0.5918261, 0.4011042, -0.5987319, 1, 1, 1, 1, 1,
-0.5915111, 0.6746584, -1.125894, 1, 1, 1, 1, 1,
-0.5882614, 1.560429, 1.019995, 1, 1, 1, 1, 1,
-0.5868174, 1.00036, -0.1321784, 1, 1, 1, 1, 1,
-0.5846963, -1.362039, -3.652173, 0, 0, 1, 1, 1,
-0.5834913, 0.2516049, -0.09859204, 1, 0, 0, 1, 1,
-0.5719668, 0.7085323, 0.2977506, 1, 0, 0, 1, 1,
-0.5655867, -0.09649419, -1.596873, 1, 0, 0, 1, 1,
-0.5628791, 0.7098484, 0.8070966, 1, 0, 0, 1, 1,
-0.5601451, -0.1829152, -1.820043, 1, 0, 0, 1, 1,
-0.5598699, -0.1383498, -1.345217, 0, 0, 0, 1, 1,
-0.5561474, 1.648488, -0.2424516, 0, 0, 0, 1, 1,
-0.5474135, -0.2699437, -2.968004, 0, 0, 0, 1, 1,
-0.5470133, -1.534944, -4.617441, 0, 0, 0, 1, 1,
-0.546919, 0.279874, -2.289405, 0, 0, 0, 1, 1,
-0.5445564, -0.175995, -2.21909, 0, 0, 0, 1, 1,
-0.5422454, 2.92472, -0.1435687, 0, 0, 0, 1, 1,
-0.5412768, -0.002745873, -2.329809, 1, 1, 1, 1, 1,
-0.5344601, -1.93865, -3.304062, 1, 1, 1, 1, 1,
-0.5323963, 0.4878472, -0.6376716, 1, 1, 1, 1, 1,
-0.5315243, -0.7998713, -2.919614, 1, 1, 1, 1, 1,
-0.5261829, -0.2671507, -1.715315, 1, 1, 1, 1, 1,
-0.5252796, -1.57707, -3.046206, 1, 1, 1, 1, 1,
-0.5234489, -0.3095672, -1.464445, 1, 1, 1, 1, 1,
-0.5203764, 0.9090381, 0.3852222, 1, 1, 1, 1, 1,
-0.5195459, -0.3361909, -3.315249, 1, 1, 1, 1, 1,
-0.5101118, 1.384016, -1.748363, 1, 1, 1, 1, 1,
-0.5090168, -1.187526, -2.08199, 1, 1, 1, 1, 1,
-0.5061138, -0.1842613, -0.04547722, 1, 1, 1, 1, 1,
-0.5060471, -1.677255, -1.600501, 1, 1, 1, 1, 1,
-0.5032631, 1.401833, -2.481551, 1, 1, 1, 1, 1,
-0.5028335, 0.7285812, 0.1740111, 1, 1, 1, 1, 1,
-0.5017321, 0.2148678, -1.342467, 0, 0, 1, 1, 1,
-0.4982912, -0.09966498, -2.591735, 1, 0, 0, 1, 1,
-0.4870625, 1.431536, -0.6100468, 1, 0, 0, 1, 1,
-0.4868253, 0.03851904, -1.750426, 1, 0, 0, 1, 1,
-0.484231, -0.04808573, 0.09151185, 1, 0, 0, 1, 1,
-0.481555, 1.311766, 0.8536032, 1, 0, 0, 1, 1,
-0.4808451, 0.5523103, -0.7878947, 0, 0, 0, 1, 1,
-0.4777574, 0.300055, 0.7324196, 0, 0, 0, 1, 1,
-0.4768223, -0.2652714, -1.151876, 0, 0, 0, 1, 1,
-0.4762331, 0.5240616, -1.559977, 0, 0, 0, 1, 1,
-0.4703835, -0.7718396, -2.205033, 0, 0, 0, 1, 1,
-0.4700616, 1.477027, 0.004281348, 0, 0, 0, 1, 1,
-0.4694407, -1.421735, -3.237756, 0, 0, 0, 1, 1,
-0.4651136, 0.2878981, -1.095209, 1, 1, 1, 1, 1,
-0.4628864, -0.7090631, -2.523855, 1, 1, 1, 1, 1,
-0.4627634, -1.245206, -5.125615, 1, 1, 1, 1, 1,
-0.4576748, 0.4258401, -2.193848, 1, 1, 1, 1, 1,
-0.4569218, -0.1476511, -2.024225, 1, 1, 1, 1, 1,
-0.454232, -0.4992638, -0.1412518, 1, 1, 1, 1, 1,
-0.4511189, 1.602165, -1.237685, 1, 1, 1, 1, 1,
-0.4501541, -0.198326, -3.320431, 1, 1, 1, 1, 1,
-0.4453973, -0.003434645, -1.899517, 1, 1, 1, 1, 1,
-0.4448894, -0.6091748, -2.477302, 1, 1, 1, 1, 1,
-0.444365, -0.458706, -2.488528, 1, 1, 1, 1, 1,
-0.4395588, -0.5118598, -3.272178, 1, 1, 1, 1, 1,
-0.4365828, 1.021301, -1.424986, 1, 1, 1, 1, 1,
-0.4302759, 0.07277436, -0.9233297, 1, 1, 1, 1, 1,
-0.4216637, 1.313747, 0.03194013, 1, 1, 1, 1, 1,
-0.42127, 0.2314539, -2.055701, 0, 0, 1, 1, 1,
-0.3985811, -2.210336, -2.19455, 1, 0, 0, 1, 1,
-0.3973469, 0.6349942, -1.708342, 1, 0, 0, 1, 1,
-0.3955167, 1.525759, 0.6863806, 1, 0, 0, 1, 1,
-0.3943443, 1.388359, -0.07000874, 1, 0, 0, 1, 1,
-0.3907712, 0.5112999, -1.031681, 1, 0, 0, 1, 1,
-0.3884596, -2.467747, -2.31132, 0, 0, 0, 1, 1,
-0.3851539, -0.7695354, -1.985464, 0, 0, 0, 1, 1,
-0.3847171, -0.3469741, -2.533934, 0, 0, 0, 1, 1,
-0.3841915, -0.04840955, -0.3139428, 0, 0, 0, 1, 1,
-0.3839377, -1.012588, -4.293568, 0, 0, 0, 1, 1,
-0.3797977, -1.105942, -0.6385224, 0, 0, 0, 1, 1,
-0.3747018, 0.4633861, -0.9878954, 0, 0, 0, 1, 1,
-0.3722557, 1.116965, -0.452055, 1, 1, 1, 1, 1,
-0.3721558, -1.426243, -2.834242, 1, 1, 1, 1, 1,
-0.3718428, 0.4637105, -1.001713, 1, 1, 1, 1, 1,
-0.3700659, -1.215292, -2.559886, 1, 1, 1, 1, 1,
-0.3697461, 0.3581805, -2.75027, 1, 1, 1, 1, 1,
-0.3613344, 0.9304617, -1.061451, 1, 1, 1, 1, 1,
-0.3608965, -0.2083751, -1.19125, 1, 1, 1, 1, 1,
-0.3587081, 0.3441971, -1.86391, 1, 1, 1, 1, 1,
-0.357149, 1.466434, 1.536189, 1, 1, 1, 1, 1,
-0.3554337, -0.5231952, -3.770462, 1, 1, 1, 1, 1,
-0.3491161, -1.800536, -5.211466, 1, 1, 1, 1, 1,
-0.3471771, -1.19794, -2.124534, 1, 1, 1, 1, 1,
-0.342158, 0.2355467, -1.541178, 1, 1, 1, 1, 1,
-0.3389621, -1.245503, -3.841037, 1, 1, 1, 1, 1,
-0.3363809, 0.8088778, 0.2176325, 1, 1, 1, 1, 1,
-0.3345215, -1.880824, -2.693842, 0, 0, 1, 1, 1,
-0.3308535, -0.8639227, -2.858962, 1, 0, 0, 1, 1,
-0.3260016, 0.4397632, -0.08974037, 1, 0, 0, 1, 1,
-0.3240705, -2.016715, -3.960545, 1, 0, 0, 1, 1,
-0.3174953, 0.8715252, -1.046945, 1, 0, 0, 1, 1,
-0.3158317, 0.06991994, -3.268819, 1, 0, 0, 1, 1,
-0.3100385, -0.6281052, -3.753147, 0, 0, 0, 1, 1,
-0.3099133, -0.9570975, -3.816198, 0, 0, 0, 1, 1,
-0.3035247, -0.1292112, -2.559857, 0, 0, 0, 1, 1,
-0.3022067, -0.8333511, -2.263393, 0, 0, 0, 1, 1,
-0.299939, -0.3935133, -4.060979, 0, 0, 0, 1, 1,
-0.2952939, 0.1074974, -2.241908, 0, 0, 0, 1, 1,
-0.2927613, 2.658664, -1.938777, 0, 0, 0, 1, 1,
-0.2896415, -1.786107, -3.350286, 1, 1, 1, 1, 1,
-0.2846531, 0.8885773, -1.553205, 1, 1, 1, 1, 1,
-0.2841772, 0.2065024, -0.8402718, 1, 1, 1, 1, 1,
-0.2812243, 0.8573637, -0.6234124, 1, 1, 1, 1, 1,
-0.2772876, -0.4229721, -2.098872, 1, 1, 1, 1, 1,
-0.2753559, 1.730274, -0.706651, 1, 1, 1, 1, 1,
-0.272866, 0.2952006, 1.176149, 1, 1, 1, 1, 1,
-0.2721083, -0.2978927, -1.748869, 1, 1, 1, 1, 1,
-0.2693301, -0.678657, -2.744707, 1, 1, 1, 1, 1,
-0.269216, -0.3530708, -1.215572, 1, 1, 1, 1, 1,
-0.2674613, 0.1204526, -0.8849623, 1, 1, 1, 1, 1,
-0.2558248, -0.9568248, -3.66408, 1, 1, 1, 1, 1,
-0.2550476, -0.9874892, -1.972256, 1, 1, 1, 1, 1,
-0.25236, 0.7815177, -0.9322654, 1, 1, 1, 1, 1,
-0.250935, -0.1534437, -1.390728, 1, 1, 1, 1, 1,
-0.2477274, 0.7289277, -2.150764, 0, 0, 1, 1, 1,
-0.2474845, 0.1220492, -1.12079, 1, 0, 0, 1, 1,
-0.2430487, 0.6002582, -1.380287, 1, 0, 0, 1, 1,
-0.2396817, 0.2015957, 0.7206066, 1, 0, 0, 1, 1,
-0.2374338, -0.09339292, -3.299925, 1, 0, 0, 1, 1,
-0.2359509, -1.092213, -2.303262, 1, 0, 0, 1, 1,
-0.2332152, 0.5070965, -0.4761624, 0, 0, 0, 1, 1,
-0.2305019, 1.306691, 0.7097796, 0, 0, 0, 1, 1,
-0.2264562, -3.053178, -2.644572, 0, 0, 0, 1, 1,
-0.2246688, 1.600928, -0.1136221, 0, 0, 0, 1, 1,
-0.221991, -0.9157129, -2.749337, 0, 0, 0, 1, 1,
-0.2184285, 0.1961056, -0.822222, 0, 0, 0, 1, 1,
-0.2172536, -0.1958532, -2.379348, 0, 0, 0, 1, 1,
-0.213485, -1.246298, -2.424817, 1, 1, 1, 1, 1,
-0.2103995, 1.715077, 0.8150554, 1, 1, 1, 1, 1,
-0.2074696, -0.3493451, -2.195861, 1, 1, 1, 1, 1,
-0.206818, -1.195883, -3.115626, 1, 1, 1, 1, 1,
-0.2055617, -2.181898, -2.526989, 1, 1, 1, 1, 1,
-0.2043173, 1.678004, -1.05226, 1, 1, 1, 1, 1,
-0.2027718, -0.4858174, -3.630961, 1, 1, 1, 1, 1,
-0.2018625, -0.5406892, -0.7473596, 1, 1, 1, 1, 1,
-0.2015759, 0.5905173, -0.2304906, 1, 1, 1, 1, 1,
-0.197512, 0.5154132, 0.202255, 1, 1, 1, 1, 1,
-0.1964374, 1.36017, 1.889871, 1, 1, 1, 1, 1,
-0.1963407, -0.5203212, -1.313163, 1, 1, 1, 1, 1,
-0.1935253, -0.2828588, -3.011812, 1, 1, 1, 1, 1,
-0.1908462, -0.002412394, -1.524646, 1, 1, 1, 1, 1,
-0.1878257, -0.6654189, -3.3007, 1, 1, 1, 1, 1,
-0.1873986, -0.7119399, -3.47379, 0, 0, 1, 1, 1,
-0.1847638, -1.738304, -1.686043, 1, 0, 0, 1, 1,
-0.1838165, 0.7619647, -1.16167, 1, 0, 0, 1, 1,
-0.1763093, 1.110486, -0.7335684, 1, 0, 0, 1, 1,
-0.1739192, 0.9495139, -1.76497, 1, 0, 0, 1, 1,
-0.1694573, -0.3511304, -3.237413, 1, 0, 0, 1, 1,
-0.1686413, -0.7697065, -3.913379, 0, 0, 0, 1, 1,
-0.1636445, -0.9187598, -3.314035, 0, 0, 0, 1, 1,
-0.1597682, -0.5163465, -1.835163, 0, 0, 0, 1, 1,
-0.1587619, 0.856706, -1.004659, 0, 0, 0, 1, 1,
-0.1510173, -0.1023662, -1.600387, 0, 0, 0, 1, 1,
-0.1508619, 1.149207, 0.1474857, 0, 0, 0, 1, 1,
-0.1488228, 0.6624797, -1.10378, 0, 0, 0, 1, 1,
-0.1469286, -0.1318187, -2.180478, 1, 1, 1, 1, 1,
-0.1467172, -0.006553949, -2.831062, 1, 1, 1, 1, 1,
-0.1466582, -1.531517, -3.598373, 1, 1, 1, 1, 1,
-0.1410689, 0.4748459, 0.1544759, 1, 1, 1, 1, 1,
-0.1398052, 1.816316, -0.4272589, 1, 1, 1, 1, 1,
-0.1367958, 0.4523126, -0.7656282, 1, 1, 1, 1, 1,
-0.1258003, 0.278698, -1.247357, 1, 1, 1, 1, 1,
-0.1252645, -0.2582115, -1.844384, 1, 1, 1, 1, 1,
-0.1245751, -0.2558317, -3.705174, 1, 1, 1, 1, 1,
-0.119212, -1.377314, -2.992991, 1, 1, 1, 1, 1,
-0.1173818, 0.4191276, 0.2211787, 1, 1, 1, 1, 1,
-0.1151017, 0.244032, -3.049274, 1, 1, 1, 1, 1,
-0.1139784, 1.624605, 0.8831666, 1, 1, 1, 1, 1,
-0.1104415, 0.9839543, 0.5368357, 1, 1, 1, 1, 1,
-0.1079507, -1.89225, -3.922166, 1, 1, 1, 1, 1,
-0.1065374, -0.7867551, -3.70779, 0, 0, 1, 1, 1,
-0.1048767, 0.2193045, -0.0001897359, 1, 0, 0, 1, 1,
-0.1008259, -1.328613, -2.563383, 1, 0, 0, 1, 1,
-0.1002342, 0.8321621, 0.3199767, 1, 0, 0, 1, 1,
-0.08906379, -1.259541, -2.307442, 1, 0, 0, 1, 1,
-0.0888435, -0.1615741, -2.185211, 1, 0, 0, 1, 1,
-0.08861695, -0.195494, -1.012348, 0, 0, 0, 1, 1,
-0.08562026, -1.060373, -3.183003, 0, 0, 0, 1, 1,
-0.08375926, 0.8235613, -0.5117537, 0, 0, 0, 1, 1,
-0.08158962, 0.3090078, 1.214852, 0, 0, 0, 1, 1,
-0.08056838, 0.54638, -0.09419216, 0, 0, 0, 1, 1,
-0.07541988, -1.504241, -3.976472, 0, 0, 0, 1, 1,
-0.07333692, -0.3466849, -2.298961, 0, 0, 0, 1, 1,
-0.06859705, 0.2727424, -1.021473, 1, 1, 1, 1, 1,
-0.06787117, -0.4663873, -0.5447749, 1, 1, 1, 1, 1,
-0.06735683, 0.7577337, 0.2495298, 1, 1, 1, 1, 1,
-0.06608889, -0.8427677, -2.490259, 1, 1, 1, 1, 1,
-0.06569702, -1.929078, -3.580812, 1, 1, 1, 1, 1,
-0.0631, 0.9741232, -0.1610921, 1, 1, 1, 1, 1,
-0.05963282, -0.2235886, -2.559789, 1, 1, 1, 1, 1,
-0.05788497, 1.335773, -1.463827, 1, 1, 1, 1, 1,
-0.05719895, -1.315075, -2.230193, 1, 1, 1, 1, 1,
-0.05677561, -0.3298285, -3.96444, 1, 1, 1, 1, 1,
-0.05625973, 1.585969, 0.5752631, 1, 1, 1, 1, 1,
-0.05566894, -0.5032913, -3.107742, 1, 1, 1, 1, 1,
-0.05168949, 1.841402, 0.167311, 1, 1, 1, 1, 1,
-0.0489521, -0.9297762, -2.620605, 1, 1, 1, 1, 1,
-0.04403249, -0.29638, -2.925977, 1, 1, 1, 1, 1,
-0.04209691, -1.073708, -2.388078, 0, 0, 1, 1, 1,
-0.04115413, -0.6798608, -3.301995, 1, 0, 0, 1, 1,
-0.04063394, -1.001177, -3.092888, 1, 0, 0, 1, 1,
-0.04024374, 0.3381321, -1.850952, 1, 0, 0, 1, 1,
-0.03805133, 2.048457, -1.43884, 1, 0, 0, 1, 1,
-0.0292583, -0.5195735, -2.736333, 1, 0, 0, 1, 1,
-0.02615382, 0.6227413, -0.02474719, 0, 0, 0, 1, 1,
-0.02572522, -0.5892399, -4.958135, 0, 0, 0, 1, 1,
-0.02539826, -0.9906683, -3.235447, 0, 0, 0, 1, 1,
-0.02445187, -0.6910249, -3.190426, 0, 0, 0, 1, 1,
-0.0232595, -1.387497, -3.695955, 0, 0, 0, 1, 1,
-0.02040492, 0.3259418, -1.142281, 0, 0, 0, 1, 1,
-0.01984408, -0.9860076, -3.413758, 0, 0, 0, 1, 1,
-0.01830521, 0.4579189, 0.7687372, 1, 1, 1, 1, 1,
-0.01775571, -0.04729399, -3.84405, 1, 1, 1, 1, 1,
-0.01470102, -1.077663, -3.421668, 1, 1, 1, 1, 1,
-0.01428946, -0.6098679, -4.323315, 1, 1, 1, 1, 1,
-0.01341807, -0.6695287, -3.550529, 1, 1, 1, 1, 1,
-0.01100925, -2.528779, -2.554023, 1, 1, 1, 1, 1,
-0.01048241, -1.046967, -1.64243, 1, 1, 1, 1, 1,
-0.008876213, -1.126887, -2.041593, 1, 1, 1, 1, 1,
-0.002329258, -1.528759, -1.258899, 1, 1, 1, 1, 1,
-0.001664532, 2.06862, 1.051105, 1, 1, 1, 1, 1,
-0.0006633774, 0.7372884, -2.162759, 1, 1, 1, 1, 1,
-0.0006312538, -0.230387, -2.358664, 1, 1, 1, 1, 1,
0.007113639, -0.1569752, 3.726452, 1, 1, 1, 1, 1,
0.008170382, 0.01588823, 0.2596613, 1, 1, 1, 1, 1,
0.01044483, 0.6355381, 0.935142, 1, 1, 1, 1, 1,
0.0140399, -0.5092624, 4.263685, 0, 0, 1, 1, 1,
0.02042034, 0.7719215, -0.5856467, 1, 0, 0, 1, 1,
0.02914681, -0.1800494, 4.258012, 1, 0, 0, 1, 1,
0.02942049, 0.8335875, 2.54525, 1, 0, 0, 1, 1,
0.02953899, 1.721298, -0.183452, 1, 0, 0, 1, 1,
0.03754056, 0.3428364, -0.9408523, 1, 0, 0, 1, 1,
0.03807452, 0.4374776, -0.112811, 0, 0, 0, 1, 1,
0.03935163, -0.6060565, 1.798981, 0, 0, 0, 1, 1,
0.04222851, 1.420535, 0.4739972, 0, 0, 0, 1, 1,
0.04458057, 1.564396, -0.001106655, 0, 0, 0, 1, 1,
0.05190811, -2.006253, 3.372831, 0, 0, 0, 1, 1,
0.06257834, 1.124731, -0.4534605, 0, 0, 0, 1, 1,
0.06749237, -0.1076635, 2.498229, 0, 0, 0, 1, 1,
0.07149857, -1.856215, 3.196089, 1, 1, 1, 1, 1,
0.071957, 1.035465, 0.4364899, 1, 1, 1, 1, 1,
0.07236098, -0.8099051, 3.137254, 1, 1, 1, 1, 1,
0.07508797, 0.1072064, -0.1139632, 1, 1, 1, 1, 1,
0.07680092, 0.1120608, 0.1238238, 1, 1, 1, 1, 1,
0.07688759, 0.4232791, 0.4929507, 1, 1, 1, 1, 1,
0.07877269, -0.5682964, 4.840493, 1, 1, 1, 1, 1,
0.09008692, -0.8941077, 1.484354, 1, 1, 1, 1, 1,
0.09043543, 0.7609043, 2.245162, 1, 1, 1, 1, 1,
0.09248751, 0.01942673, 1.059433, 1, 1, 1, 1, 1,
0.1020214, -0.01554522, 4.079322, 1, 1, 1, 1, 1,
0.1072219, -0.5980498, 2.365931, 1, 1, 1, 1, 1,
0.1086291, 0.01297764, 1.339752, 1, 1, 1, 1, 1,
0.1144686, -0.8909486, 3.928253, 1, 1, 1, 1, 1,
0.1160201, 1.230748, -0.06448028, 1, 1, 1, 1, 1,
0.1164629, 0.5028893, 0.6002437, 0, 0, 1, 1, 1,
0.1205736, -1.58021, 4.239885, 1, 0, 0, 1, 1,
0.134019, -0.2075519, 2.042955, 1, 0, 0, 1, 1,
0.1364648, -0.5920446, 2.983317, 1, 0, 0, 1, 1,
0.1417106, 1.046755, -0.2387303, 1, 0, 0, 1, 1,
0.1427071, -0.3792289, 2.981437, 1, 0, 0, 1, 1,
0.143408, 1.420358, -0.292849, 0, 0, 0, 1, 1,
0.1494891, 0.1513259, 0.9175356, 0, 0, 0, 1, 1,
0.1504927, 0.2546916, -0.3159017, 0, 0, 0, 1, 1,
0.1535415, -0.06785601, 3.382146, 0, 0, 0, 1, 1,
0.1541217, -0.5639718, 2.402713, 0, 0, 0, 1, 1,
0.1615068, -2.427373, 2.408193, 0, 0, 0, 1, 1,
0.1635831, 0.7730658, -1.226257, 0, 0, 0, 1, 1,
0.1641585, 0.6466039, -0.663244, 1, 1, 1, 1, 1,
0.1653232, -1.315987, 3.677658, 1, 1, 1, 1, 1,
0.1657541, -1.380183, 3.811605, 1, 1, 1, 1, 1,
0.1684998, -1.245136, 3.234113, 1, 1, 1, 1, 1,
0.1706087, -2.599784, 4.301379, 1, 1, 1, 1, 1,
0.1727087, 2.272002, 0.1475542, 1, 1, 1, 1, 1,
0.1729154, -0.6740739, 0.7579504, 1, 1, 1, 1, 1,
0.173079, 0.0531854, 2.592929, 1, 1, 1, 1, 1,
0.1733341, 0.01683958, 3.054367, 1, 1, 1, 1, 1,
0.1741119, 0.3646515, -0.883797, 1, 1, 1, 1, 1,
0.1770169, 0.1963258, 0.5490655, 1, 1, 1, 1, 1,
0.1795972, 0.08212184, -0.08459689, 1, 1, 1, 1, 1,
0.1809226, -0.8911734, 4.832979, 1, 1, 1, 1, 1,
0.1812697, 0.3444095, -0.1583275, 1, 1, 1, 1, 1,
0.1821352, 0.1640109, 1.142209, 1, 1, 1, 1, 1,
0.1897467, -1.752058, 3.850134, 0, 0, 1, 1, 1,
0.1904902, 0.5180629, -0.8002011, 1, 0, 0, 1, 1,
0.1968981, -0.1195437, 1.422273, 1, 0, 0, 1, 1,
0.1974755, -0.701098, 2.700681, 1, 0, 0, 1, 1,
0.2022479, -0.4893316, 1.745738, 1, 0, 0, 1, 1,
0.2053954, 1.218579, 1.131763, 1, 0, 0, 1, 1,
0.2085935, -1.930623, 2.061661, 0, 0, 0, 1, 1,
0.2092379, -0.01010644, 1.722223, 0, 0, 0, 1, 1,
0.2128611, 1.545396, 0.191596, 0, 0, 0, 1, 1,
0.2139831, -0.4316379, 2.295511, 0, 0, 0, 1, 1,
0.2161124, 0.5762734, 0.9994286, 0, 0, 0, 1, 1,
0.2212531, 1.217758, -0.514177, 0, 0, 0, 1, 1,
0.2243414, 1.264089, 0.2185961, 0, 0, 0, 1, 1,
0.2297011, -0.3396924, 2.915219, 1, 1, 1, 1, 1,
0.2317026, 1.97783, -0.6655119, 1, 1, 1, 1, 1,
0.2352051, -0.1069722, 2.744293, 1, 1, 1, 1, 1,
0.2397306, 0.9243975, 1.020548, 1, 1, 1, 1, 1,
0.2433635, -0.3726948, 2.095476, 1, 1, 1, 1, 1,
0.244042, -0.6084396, 3.375172, 1, 1, 1, 1, 1,
0.2457734, -1.533187, 1.458314, 1, 1, 1, 1, 1,
0.2486151, -0.2033746, 1.583453, 1, 1, 1, 1, 1,
0.2502137, -0.1759838, 3.162807, 1, 1, 1, 1, 1,
0.2510023, 1.101353, 1.965084, 1, 1, 1, 1, 1,
0.2567883, 1.841912, -0.164276, 1, 1, 1, 1, 1,
0.2569881, 1.170125, 0.7466733, 1, 1, 1, 1, 1,
0.2571829, 1.37771, -0.2459085, 1, 1, 1, 1, 1,
0.2590566, 0.07342645, 2.1546, 1, 1, 1, 1, 1,
0.2615441, 1.182479, -0.2776647, 1, 1, 1, 1, 1,
0.2634015, -0.2752063, 2.810992, 0, 0, 1, 1, 1,
0.2646272, -0.1232603, 4.142262, 1, 0, 0, 1, 1,
0.2666394, 1.219639, -0.4941877, 1, 0, 0, 1, 1,
0.267084, 0.1400737, 2.63266, 1, 0, 0, 1, 1,
0.2694043, -0.03965521, 2.014375, 1, 0, 0, 1, 1,
0.2704528, 1.390336, -0.913048, 1, 0, 0, 1, 1,
0.2721433, -0.6125172, 4.00642, 0, 0, 0, 1, 1,
0.2775827, -0.4770014, 1.576884, 0, 0, 0, 1, 1,
0.2825605, 1.146904, 1.252629, 0, 0, 0, 1, 1,
0.2826271, 0.1120697, 1.888741, 0, 0, 0, 1, 1,
0.2836651, -1.121745, 2.949457, 0, 0, 0, 1, 1,
0.2842452, 0.3477471, 0.0163359, 0, 0, 0, 1, 1,
0.2871051, 0.378344, 0.2319387, 0, 0, 0, 1, 1,
0.2881499, -0.7408072, 2.547014, 1, 1, 1, 1, 1,
0.2916361, -0.4058779, 3.418321, 1, 1, 1, 1, 1,
0.2952586, 0.8312421, 0.09475148, 1, 1, 1, 1, 1,
0.2999078, 0.6522014, 0.9617193, 1, 1, 1, 1, 1,
0.3016825, -2.689238, 1.567673, 1, 1, 1, 1, 1,
0.3052259, -0.1803047, 2.469933, 1, 1, 1, 1, 1,
0.3078122, 0.3949652, -0.2652158, 1, 1, 1, 1, 1,
0.3079744, 1.031255, 0.1344589, 1, 1, 1, 1, 1,
0.3092571, 1.020054, -0.7034211, 1, 1, 1, 1, 1,
0.3120933, -0.8501788, 1.236518, 1, 1, 1, 1, 1,
0.3121629, -0.8402216, 3.383282, 1, 1, 1, 1, 1,
0.3135054, 0.4742683, 2.037966, 1, 1, 1, 1, 1,
0.3135943, 0.8524475, -1.599313, 1, 1, 1, 1, 1,
0.3179791, -0.3115445, 2.435833, 1, 1, 1, 1, 1,
0.3184259, -0.1654827, 4.035927, 1, 1, 1, 1, 1,
0.3219593, -2.054809, 2.540624, 0, 0, 1, 1, 1,
0.3272118, 0.5971732, 0.506003, 1, 0, 0, 1, 1,
0.3272931, 1.51231, -0.2599394, 1, 0, 0, 1, 1,
0.3279839, -0.08353196, 2.374476, 1, 0, 0, 1, 1,
0.3304057, -1.193599, 3.740237, 1, 0, 0, 1, 1,
0.3349258, -0.9882276, 3.251304, 1, 0, 0, 1, 1,
0.3357676, -0.6230974, 1.582075, 0, 0, 0, 1, 1,
0.339685, -0.4320523, 0.2892778, 0, 0, 0, 1, 1,
0.3427063, -0.6977568, 2.030507, 0, 0, 0, 1, 1,
0.3447597, 1.145669, -0.2131696, 0, 0, 0, 1, 1,
0.3447889, -0.2147171, 3.93526, 0, 0, 0, 1, 1,
0.3461398, -0.3383802, 2.39313, 0, 0, 0, 1, 1,
0.3478444, 1.328955, 0.3546794, 0, 0, 0, 1, 1,
0.3511371, -0.6876665, 3.279664, 1, 1, 1, 1, 1,
0.3572577, 0.5233282, 1.543289, 1, 1, 1, 1, 1,
0.3600452, 0.325631, 0.3954852, 1, 1, 1, 1, 1,
0.3634335, -0.6310281, 3.599815, 1, 1, 1, 1, 1,
0.3638551, -0.4229677, 0.326038, 1, 1, 1, 1, 1,
0.3671981, -0.1900581, 3.10938, 1, 1, 1, 1, 1,
0.3709729, -1.472795, 2.115792, 1, 1, 1, 1, 1,
0.3782973, 1.528841, 2.113196, 1, 1, 1, 1, 1,
0.3807117, 1.059739, -0.03780789, 1, 1, 1, 1, 1,
0.3864864, -1.233784, 4.586775, 1, 1, 1, 1, 1,
0.3947154, 0.07106423, 0.8107905, 1, 1, 1, 1, 1,
0.3956333, -0.1534859, 1.109117, 1, 1, 1, 1, 1,
0.3983703, 0.2410636, -0.6363512, 1, 1, 1, 1, 1,
0.3988933, -0.02538706, 0.8494556, 1, 1, 1, 1, 1,
0.3989567, 0.3750511, 1.647388, 1, 1, 1, 1, 1,
0.4008035, -0.03324455, 2.338226, 0, 0, 1, 1, 1,
0.4011547, -0.2593546, 4.132669, 1, 0, 0, 1, 1,
0.4041874, 1.472333, 0.003325523, 1, 0, 0, 1, 1,
0.4065082, -0.5162848, 0.8992869, 1, 0, 0, 1, 1,
0.4080517, 0.7067145, 0.296083, 1, 0, 0, 1, 1,
0.4170169, 0.3396119, 0.546636, 1, 0, 0, 1, 1,
0.4181531, -0.520262, 2.686892, 0, 0, 0, 1, 1,
0.419379, 0.4129313, -0.4824647, 0, 0, 0, 1, 1,
0.4198973, -0.9076864, 3.413191, 0, 0, 0, 1, 1,
0.4231018, 2.136986, 0.1538848, 0, 0, 0, 1, 1,
0.423863, -0.8125144, 2.438526, 0, 0, 0, 1, 1,
0.4243646, -0.01020535, 1.591201, 0, 0, 0, 1, 1,
0.425101, -1.366082, 2.913037, 0, 0, 0, 1, 1,
0.4536858, 1.468762, -0.5502477, 1, 1, 1, 1, 1,
0.4545211, -0.1725725, 2.261867, 1, 1, 1, 1, 1,
0.4546091, -1.731936, 3.314526, 1, 1, 1, 1, 1,
0.4569157, 0.2590701, 1.010127, 1, 1, 1, 1, 1,
0.4624242, -0.8819962, 4.518862, 1, 1, 1, 1, 1,
0.4648514, -0.7613147, 1.232627, 1, 1, 1, 1, 1,
0.4649309, 0.5679834, -0.2575385, 1, 1, 1, 1, 1,
0.4654293, 0.731664, 0.6548067, 1, 1, 1, 1, 1,
0.4689236, 0.4868008, 0.2311054, 1, 1, 1, 1, 1,
0.4734509, 0.2864374, 1.979129, 1, 1, 1, 1, 1,
0.4735113, -1.414655, 2.129918, 1, 1, 1, 1, 1,
0.4766394, -0.3862682, 1.540209, 1, 1, 1, 1, 1,
0.4805529, 0.1641038, 2.217794, 1, 1, 1, 1, 1,
0.485473, 0.02783911, 1.555801, 1, 1, 1, 1, 1,
0.486089, -1.396815, 4.784117, 1, 1, 1, 1, 1,
0.4907105, 2.2469, 0.01485562, 0, 0, 1, 1, 1,
0.493446, -1.20852, 2.681709, 1, 0, 0, 1, 1,
0.4943849, -1.494899, 4.106917, 1, 0, 0, 1, 1,
0.4967459, -0.4438067, 2.595119, 1, 0, 0, 1, 1,
0.4982617, -0.2912356, 1.722483, 1, 0, 0, 1, 1,
0.498861, 1.955759, 0.3048515, 1, 0, 0, 1, 1,
0.502228, 0.4466148, 1.559667, 0, 0, 0, 1, 1,
0.5057098, 0.6603889, 1.08566, 0, 0, 0, 1, 1,
0.5078114, 0.8170717, 0.6489916, 0, 0, 0, 1, 1,
0.5110162, 0.4775048, 0.1328113, 0, 0, 0, 1, 1,
0.5160649, 0.8083498, -0.4708473, 0, 0, 0, 1, 1,
0.5183607, 0.8325769, 0.02727343, 0, 0, 0, 1, 1,
0.5216911, -0.4041688, 4.629749, 0, 0, 0, 1, 1,
0.5255801, -1.192959, -0.1645433, 1, 1, 1, 1, 1,
0.5274943, -0.6745158, 3.078174, 1, 1, 1, 1, 1,
0.5299767, 1.294007, 1.165775, 1, 1, 1, 1, 1,
0.5307326, -1.200188, 3.078902, 1, 1, 1, 1, 1,
0.5317056, -0.4685466, 2.001374, 1, 1, 1, 1, 1,
0.53487, 1.435305, 0.8049427, 1, 1, 1, 1, 1,
0.5488124, 0.00437365, 3.255624, 1, 1, 1, 1, 1,
0.5488998, -0.8204981, 3.595334, 1, 1, 1, 1, 1,
0.5501747, -0.5238498, 0.9435106, 1, 1, 1, 1, 1,
0.551732, -2.098199, 2.687081, 1, 1, 1, 1, 1,
0.5563801, 0.9986299, 1.507477, 1, 1, 1, 1, 1,
0.5572204, -0.7336807, 2.289011, 1, 1, 1, 1, 1,
0.5579866, -1.007687, 2.745349, 1, 1, 1, 1, 1,
0.5594985, 0.06417437, 2.838637, 1, 1, 1, 1, 1,
0.5611553, 0.1300171, 0.6500708, 1, 1, 1, 1, 1,
0.5653695, 0.5585467, 0.296992, 0, 0, 1, 1, 1,
0.5675851, 0.2808702, 0.3436054, 1, 0, 0, 1, 1,
0.5685527, 0.3172488, -0.7871861, 1, 0, 0, 1, 1,
0.5704105, -0.4524178, 3.544471, 1, 0, 0, 1, 1,
0.577567, 0.9189877, 0.7878148, 1, 0, 0, 1, 1,
0.578104, -0.7928164, 1.84379, 1, 0, 0, 1, 1,
0.5783402, -1.529578, 1.599792, 0, 0, 0, 1, 1,
0.5793331, 0.005381585, 1.582955, 0, 0, 0, 1, 1,
0.5835735, 0.1663608, 3.129426, 0, 0, 0, 1, 1,
0.5871395, -0.6267679, 1.232244, 0, 0, 0, 1, 1,
0.5925059, 0.6437697, 2.02145, 0, 0, 0, 1, 1,
0.5950423, 0.7085696, 1.72166, 0, 0, 0, 1, 1,
0.5955673, 0.07129238, 0.705922, 0, 0, 0, 1, 1,
0.5982274, 0.5946235, -0.4213023, 1, 1, 1, 1, 1,
0.6010085, -0.5682929, 2.645233, 1, 1, 1, 1, 1,
0.6023816, 0.4860005, 2.398931, 1, 1, 1, 1, 1,
0.6057339, 0.3742535, 1.887198, 1, 1, 1, 1, 1,
0.6128201, 0.3645857, 0.9019908, 1, 1, 1, 1, 1,
0.6187514, -0.3368548, 0.9309552, 1, 1, 1, 1, 1,
0.6212981, -0.04265508, 2.03145, 1, 1, 1, 1, 1,
0.6226739, -0.6374748, 1.737643, 1, 1, 1, 1, 1,
0.6377318, 0.2138496, 1.172037, 1, 1, 1, 1, 1,
0.6504881, 0.6968927, 0.2914779, 1, 1, 1, 1, 1,
0.6506032, -0.7071332, 3.60919, 1, 1, 1, 1, 1,
0.6640439, -0.6573038, 0.8368543, 1, 1, 1, 1, 1,
0.6660078, 2.976328, 0.4337861, 1, 1, 1, 1, 1,
0.6664525, 0.2464944, -0.5682193, 1, 1, 1, 1, 1,
0.6664661, -0.480437, 2.503561, 1, 1, 1, 1, 1,
0.6712674, -0.2067935, 2.660033, 0, 0, 1, 1, 1,
0.6795073, -0.08025222, 1.39896, 1, 0, 0, 1, 1,
0.6803415, 0.4817007, 0.3408079, 1, 0, 0, 1, 1,
0.6841882, 0.7174215, 2.564933, 1, 0, 0, 1, 1,
0.6867278, -1.469826, 2.646713, 1, 0, 0, 1, 1,
0.6900215, 1.042903, 3.53573, 1, 0, 0, 1, 1,
0.6904957, 0.3173916, 0.9133249, 0, 0, 0, 1, 1,
0.6925923, -0.5149237, 2.183967, 0, 0, 0, 1, 1,
0.7014469, 0.2425391, 3.123168, 0, 0, 0, 1, 1,
0.7041724, -1.05737, 0.9791117, 0, 0, 0, 1, 1,
0.7051181, 0.3172827, 1.126727, 0, 0, 0, 1, 1,
0.7081015, -1.00669, 3.002627, 0, 0, 0, 1, 1,
0.7129401, 0.06919923, 1.83283, 0, 0, 0, 1, 1,
0.7195504, 0.4485244, 0.685607, 1, 1, 1, 1, 1,
0.7207999, -1.667165, 1.304024, 1, 1, 1, 1, 1,
0.7294283, -0.4340598, 2.134589, 1, 1, 1, 1, 1,
0.7314019, -0.3961575, 2.897715, 1, 1, 1, 1, 1,
0.7316331, -0.8950019, 2.614946, 1, 1, 1, 1, 1,
0.7338882, -0.2059121, 1.896994, 1, 1, 1, 1, 1,
0.7401623, -1.381407, 1.914291, 1, 1, 1, 1, 1,
0.7472311, 1.101659, -0.2395499, 1, 1, 1, 1, 1,
0.7486575, -0.5965319, 3.12353, 1, 1, 1, 1, 1,
0.7525125, -0.07466603, 2.144605, 1, 1, 1, 1, 1,
0.7568059, 0.6714104, 1.313533, 1, 1, 1, 1, 1,
0.7593911, 1.091035, 1.585158, 1, 1, 1, 1, 1,
0.7620083, -1.325886, 2.646478, 1, 1, 1, 1, 1,
0.7676298, 0.08373003, 3.595907, 1, 1, 1, 1, 1,
0.7709278, -0.0962311, 3.050052, 1, 1, 1, 1, 1,
0.7760031, 0.2224276, 2.094124, 0, 0, 1, 1, 1,
0.7790112, -0.8065889, 3.141238, 1, 0, 0, 1, 1,
0.7796032, -0.2383914, 2.246139, 1, 0, 0, 1, 1,
0.779794, -0.008130037, 1.680676, 1, 0, 0, 1, 1,
0.7834969, -1.876271, 1.372629, 1, 0, 0, 1, 1,
0.7842869, -1.43369, 1.980187, 1, 0, 0, 1, 1,
0.7849016, -0.2158651, 0.5655636, 0, 0, 0, 1, 1,
0.7877154, 0.2910822, 1.314038, 0, 0, 0, 1, 1,
0.795559, 1.067739, 0.1787326, 0, 0, 0, 1, 1,
0.7973031, 0.8491661, -1.832693, 0, 0, 0, 1, 1,
0.798647, 1.601142, 0.5130534, 0, 0, 0, 1, 1,
0.8005838, -0.642848, 2.991764, 0, 0, 0, 1, 1,
0.8100414, -0.2914619, 1.276663, 0, 0, 0, 1, 1,
0.8101844, 1.556615, -1.73695, 1, 1, 1, 1, 1,
0.8159693, -0.5681227, 1.546273, 1, 1, 1, 1, 1,
0.8198751, -0.434987, 2.234662, 1, 1, 1, 1, 1,
0.8206493, 0.5725762, -0.5119362, 1, 1, 1, 1, 1,
0.8232786, 0.05665665, 2.538687, 1, 1, 1, 1, 1,
0.8262197, -0.06894784, 1.622668, 1, 1, 1, 1, 1,
0.8266745, 1.362141, -1.23789, 1, 1, 1, 1, 1,
0.8273152, -0.4839052, 1.312902, 1, 1, 1, 1, 1,
0.8329651, -1.188318, 2.381485, 1, 1, 1, 1, 1,
0.8391879, 0.3689028, 1.895473, 1, 1, 1, 1, 1,
0.8441843, 0.5364181, 0.6313635, 1, 1, 1, 1, 1,
0.8442801, -0.1779033, 2.750304, 1, 1, 1, 1, 1,
0.8535306, 0.06362335, 3.966315, 1, 1, 1, 1, 1,
0.8593579, 1.131305, 1.385533, 1, 1, 1, 1, 1,
0.8599092, -0.6926664, 2.595277, 1, 1, 1, 1, 1,
0.8736767, -0.499488, 0.4253287, 0, 0, 1, 1, 1,
0.8784029, -1.581679, 1.479074, 1, 0, 0, 1, 1,
0.8789224, -0.3689622, 1.219372, 1, 0, 0, 1, 1,
0.8815488, -1.173198, 3.961836, 1, 0, 0, 1, 1,
0.8846419, -0.1198675, 2.339939, 1, 0, 0, 1, 1,
0.8862277, 0.7081361, 2.162786, 1, 0, 0, 1, 1,
0.8863092, -0.4637651, 2.784007, 0, 0, 0, 1, 1,
0.8864242, 0.8110752, 1.047749, 0, 0, 0, 1, 1,
0.8874312, 0.5528663, 1.427963, 0, 0, 0, 1, 1,
0.8904945, -0.01909889, 2.084869, 0, 0, 0, 1, 1,
0.8916961, -0.2213757, -0.05423653, 0, 0, 0, 1, 1,
0.8954986, 0.9134377, -0.2168241, 0, 0, 0, 1, 1,
0.8959321, -0.6022947, 1.841757, 0, 0, 0, 1, 1,
0.9011041, -0.6823768, 1.890701, 1, 1, 1, 1, 1,
0.9018394, 0.4884656, 1.753879, 1, 1, 1, 1, 1,
0.9121005, 0.2306153, 0.5626354, 1, 1, 1, 1, 1,
0.9141227, 1.126368, -0.6677019, 1, 1, 1, 1, 1,
0.9152502, 0.1043058, 1.037161, 1, 1, 1, 1, 1,
0.9159566, -0.8112131, 1.837781, 1, 1, 1, 1, 1,
0.918615, 2.220259, 1.556022, 1, 1, 1, 1, 1,
0.9195697, -0.3606522, 2.454826, 1, 1, 1, 1, 1,
0.92162, 2.276723, 1.53027, 1, 1, 1, 1, 1,
0.9289704, 0.8249716, 0.08065059, 1, 1, 1, 1, 1,
0.9401543, 1.391811, -0.4465661, 1, 1, 1, 1, 1,
0.943482, -0.792537, 1.395228, 1, 1, 1, 1, 1,
0.9435548, -0.0512409, 0.6378947, 1, 1, 1, 1, 1,
0.9446343, -1.153876, 2.631379, 1, 1, 1, 1, 1,
0.9456418, -2.951823, 2.106987, 1, 1, 1, 1, 1,
0.945721, 0.8031817, 1.753753, 0, 0, 1, 1, 1,
0.9467004, 0.7693961, 1.607758, 1, 0, 0, 1, 1,
0.9553965, 1.020838, 1.679105, 1, 0, 0, 1, 1,
0.9719154, -0.4361194, 2.843056, 1, 0, 0, 1, 1,
0.9758773, 0.5712474, 0.1079511, 1, 0, 0, 1, 1,
0.9781685, 1.062096, 1.1035, 1, 0, 0, 1, 1,
0.9797184, -0.8938725, 2.271359, 0, 0, 0, 1, 1,
0.9801888, -0.002894716, 0.9163077, 0, 0, 0, 1, 1,
0.9822031, -1.008833, 2.721727, 0, 0, 0, 1, 1,
0.9837905, 0.2164742, 2.539419, 0, 0, 0, 1, 1,
0.9842322, -0.3985687, 1.240434, 0, 0, 0, 1, 1,
0.9853023, 1.509524, -1.437598, 0, 0, 0, 1, 1,
0.9944898, 0.4282353, -1.154609, 0, 0, 0, 1, 1,
0.995333, -1.619568, 2.884463, 1, 1, 1, 1, 1,
0.9976325, -2.141833, 3.066843, 1, 1, 1, 1, 1,
0.9980903, 0.8944466, 0.3573536, 1, 1, 1, 1, 1,
0.998937, 0.02647731, 2.268949, 1, 1, 1, 1, 1,
1.001615, -2.050124, 2.510643, 1, 1, 1, 1, 1,
1.020119, 1.0482, 0.2140993, 1, 1, 1, 1, 1,
1.022804, 0.3259555, -0.1041314, 1, 1, 1, 1, 1,
1.025188, -0.2632483, 3.720924, 1, 1, 1, 1, 1,
1.028728, 0.09093987, 0.812303, 1, 1, 1, 1, 1,
1.029351, -0.5287047, 2.128477, 1, 1, 1, 1, 1,
1.032529, 1.005968, 1.366704, 1, 1, 1, 1, 1,
1.035478, 0.2520798, 0.7956192, 1, 1, 1, 1, 1,
1.036134, 0.7434306, 0.9327792, 1, 1, 1, 1, 1,
1.041614, -0.03711734, -0.692791, 1, 1, 1, 1, 1,
1.051941, -0.5729524, 1.766584, 1, 1, 1, 1, 1,
1.053316, -1.611898, 3.808854, 0, 0, 1, 1, 1,
1.060125, -0.0282049, 2.560375, 1, 0, 0, 1, 1,
1.085197, 0.5994255, 0.9822388, 1, 0, 0, 1, 1,
1.089425, 0.2863941, 1.700393, 1, 0, 0, 1, 1,
1.091806, -1.078605, 2.687871, 1, 0, 0, 1, 1,
1.094112, 1.57829, -0.8042758, 1, 0, 0, 1, 1,
1.098728, 0.7668471, 1.590893, 0, 0, 0, 1, 1,
1.101403, -2.142754, 1.932377, 0, 0, 0, 1, 1,
1.101956, -0.4919479, 1.486261, 0, 0, 0, 1, 1,
1.102845, 0.9095158, -0.141705, 0, 0, 0, 1, 1,
1.106901, 1.406486, 0.0715028, 0, 0, 0, 1, 1,
1.10712, -1.787737, 2.488903, 0, 0, 0, 1, 1,
1.107229, -0.3528719, 0.8767037, 0, 0, 0, 1, 1,
1.107982, 0.6089749, -0.6356714, 1, 1, 1, 1, 1,
1.111036, 1.285308, 1.399551, 1, 1, 1, 1, 1,
1.113219, 1.594603, 0.9789931, 1, 1, 1, 1, 1,
1.113565, -0.1003812, 2.904112, 1, 1, 1, 1, 1,
1.117667, 1.140903, 0.2043173, 1, 1, 1, 1, 1,
1.121253, 0.2562693, 0.4153141, 1, 1, 1, 1, 1,
1.129586, -0.1906027, 1.256967, 1, 1, 1, 1, 1,
1.132228, 0.1009966, 1.667842, 1, 1, 1, 1, 1,
1.136709, -0.3269907, 2.924174, 1, 1, 1, 1, 1,
1.149667, -1.254957, 2.61079, 1, 1, 1, 1, 1,
1.150941, -0.9959456, 1.51451, 1, 1, 1, 1, 1,
1.154547, -0.3758071, 0.6784796, 1, 1, 1, 1, 1,
1.156995, -0.4827915, 2.855344, 1, 1, 1, 1, 1,
1.166268, -0.003492436, 3.057155, 1, 1, 1, 1, 1,
1.182299, -0.223852, 1.740148, 1, 1, 1, 1, 1,
1.183643, -0.6823979, 0.5511132, 0, 0, 1, 1, 1,
1.185066, -1.211648, 2.347534, 1, 0, 0, 1, 1,
1.186682, 0.4493848, 1.537656, 1, 0, 0, 1, 1,
1.19229, -0.686111, 2.985087, 1, 0, 0, 1, 1,
1.192616, -0.4836802, 0.7340826, 1, 0, 0, 1, 1,
1.198516, 0.03579022, 1.281487, 1, 0, 0, 1, 1,
1.200683, 0.7859805, 1.201211, 0, 0, 0, 1, 1,
1.202422, -1.046825, 3.182531, 0, 0, 0, 1, 1,
1.217371, -0.5515386, 2.400046, 0, 0, 0, 1, 1,
1.217651, 0.3461713, 2.002122, 0, 0, 0, 1, 1,
1.218259, -0.2040173, 2.473136, 0, 0, 0, 1, 1,
1.223205, 0.7108498, 1.312241, 0, 0, 0, 1, 1,
1.223222, 0.2768839, 1.995159, 0, 0, 0, 1, 1,
1.226001, 1.122751, 2.245259, 1, 1, 1, 1, 1,
1.227514, 0.01962641, 0.5826315, 1, 1, 1, 1, 1,
1.233849, -0.9289645, 1.936375, 1, 1, 1, 1, 1,
1.233893, -0.04305192, 1.675599, 1, 1, 1, 1, 1,
1.23674, 0.05302351, 0.787255, 1, 1, 1, 1, 1,
1.248234, 0.5442671, 2.23287, 1, 1, 1, 1, 1,
1.252663, -0.1770604, 1.163352, 1, 1, 1, 1, 1,
1.252697, -0.5922696, 1.479882, 1, 1, 1, 1, 1,
1.258789, 1.179403, 0.6706049, 1, 1, 1, 1, 1,
1.260983, 0.1218999, 3.896761, 1, 1, 1, 1, 1,
1.261641, 0.8686869, 0.5833696, 1, 1, 1, 1, 1,
1.276913, -0.3485985, 2.472478, 1, 1, 1, 1, 1,
1.288156, 0.5242662, 0.8258356, 1, 1, 1, 1, 1,
1.299712, 0.4102058, 1.804746, 1, 1, 1, 1, 1,
1.302569, 0.200426, 0.9301698, 1, 1, 1, 1, 1,
1.305918, -0.08060394, 1.96397, 0, 0, 1, 1, 1,
1.306261, -1.577423, 2.880881, 1, 0, 0, 1, 1,
1.31056, -0.05327957, 2.970458, 1, 0, 0, 1, 1,
1.320033, 1.120429, 0.8659146, 1, 0, 0, 1, 1,
1.321284, 0.126499, 1.028351, 1, 0, 0, 1, 1,
1.326663, -1.134516, 4.165307, 1, 0, 0, 1, 1,
1.341608, 0.08132625, -0.2854288, 0, 0, 0, 1, 1,
1.354631, -2.539668, 2.539561, 0, 0, 0, 1, 1,
1.354989, -2.005652, 2.85593, 0, 0, 0, 1, 1,
1.357269, -0.1228791, 0.3208597, 0, 0, 0, 1, 1,
1.365566, 0.02266916, 2.842208, 0, 0, 0, 1, 1,
1.372834, -0.5347003, 1.8425, 0, 0, 0, 1, 1,
1.373892, 0.4908805, 0.4744925, 0, 0, 0, 1, 1,
1.376159, -0.5903456, 1.028716, 1, 1, 1, 1, 1,
1.379358, -1.638285, 3.704157, 1, 1, 1, 1, 1,
1.393202, -0.2395304, 0.6217536, 1, 1, 1, 1, 1,
1.396057, -1.080586, 1.287175, 1, 1, 1, 1, 1,
1.410066, 0.0235022, 0.2219242, 1, 1, 1, 1, 1,
1.419916, 1.243217, 0.5061595, 1, 1, 1, 1, 1,
1.437613, -0.6309084, 2.807867, 1, 1, 1, 1, 1,
1.44219, 0.5832217, -0.5365023, 1, 1, 1, 1, 1,
1.450896, -0.6058955, 2.192048, 1, 1, 1, 1, 1,
1.459452, -0.1333569, 2.046226, 1, 1, 1, 1, 1,
1.467195, 1.299047, 1.083105, 1, 1, 1, 1, 1,
1.470261, 1.507598, -0.5272332, 1, 1, 1, 1, 1,
1.483171, 0.983251, -0.2128998, 1, 1, 1, 1, 1,
1.48421, 0.1668455, 2.368083, 1, 1, 1, 1, 1,
1.491176, 0.932965, 1.788695, 1, 1, 1, 1, 1,
1.493068, 0.008072534, 2.447799, 0, 0, 1, 1, 1,
1.519067, -0.4699623, 1.2532, 1, 0, 0, 1, 1,
1.521651, 0.0445563, 0.3331668, 1, 0, 0, 1, 1,
1.523854, 0.9947106, 1.586216, 1, 0, 0, 1, 1,
1.526789, 0.4120719, 1.663881, 1, 0, 0, 1, 1,
1.530464, -1.277215, 2.393226, 1, 0, 0, 1, 1,
1.536875, 0.9559349, -1.043789, 0, 0, 0, 1, 1,
1.539714, 2.218419, -0.9654513, 0, 0, 0, 1, 1,
1.551051, -2.396714, 2.605911, 0, 0, 0, 1, 1,
1.564356, -0.6579677, 1.348056, 0, 0, 0, 1, 1,
1.566612, 0.5860214, 1.996827, 0, 0, 0, 1, 1,
1.568753, 0.5517914, 2.093622, 0, 0, 0, 1, 1,
1.57012, -0.4354783, 0.5573089, 0, 0, 0, 1, 1,
1.575625, 0.665426, 1.775971, 1, 1, 1, 1, 1,
1.581036, -0.05864726, 1.794263, 1, 1, 1, 1, 1,
1.611175, 0.5386161, 0.6224806, 1, 1, 1, 1, 1,
1.618742, -0.03013107, 2.184808, 1, 1, 1, 1, 1,
1.620195, 0.7017835, 1.347476, 1, 1, 1, 1, 1,
1.627257, 0.7404324, 2.817234, 1, 1, 1, 1, 1,
1.644646, 0.842694, 1.373886, 1, 1, 1, 1, 1,
1.644874, -2.186455, 2.068781, 1, 1, 1, 1, 1,
1.655683, 2.198498, 1.887048, 1, 1, 1, 1, 1,
1.658755, 0.3311269, 2.359785, 1, 1, 1, 1, 1,
1.672694, 0.751283, 1.920702, 1, 1, 1, 1, 1,
1.702673, -0.3700815, 0.7368422, 1, 1, 1, 1, 1,
1.721669, 0.4691759, 0.849789, 1, 1, 1, 1, 1,
1.724009, 0.7696673, 2.178816, 1, 1, 1, 1, 1,
1.733009, 0.09698206, 1.535965, 1, 1, 1, 1, 1,
1.748345, -0.7654518, 2.119636, 0, 0, 1, 1, 1,
1.773021, 0.5217386, 1.512966, 1, 0, 0, 1, 1,
1.790598, 0.4704933, -1.004255, 1, 0, 0, 1, 1,
1.792072, -0.0787394, 0.6380382, 1, 0, 0, 1, 1,
1.797513, 1.071236, 0.8232506, 1, 0, 0, 1, 1,
1.818692, -0.4435161, 1.877129, 1, 0, 0, 1, 1,
1.830246, 0.7653644, 1.058745, 0, 0, 0, 1, 1,
1.834954, 0.4229375, -0.3708434, 0, 0, 0, 1, 1,
1.844871, -1.426729, 2.341651, 0, 0, 0, 1, 1,
1.845389, -0.9376804, 1.482694, 0, 0, 0, 1, 1,
1.850065, -0.3120542, 2.374038, 0, 0, 0, 1, 1,
1.850162, -0.4958798, 1.830734, 0, 0, 0, 1, 1,
1.850336, 0.1031633, 2.062485, 0, 0, 0, 1, 1,
1.865078, -0.9729047, 1.726991, 1, 1, 1, 1, 1,
1.866011, -0.5855619, 2.090541, 1, 1, 1, 1, 1,
1.872425, 0.4790052, 0.9868804, 1, 1, 1, 1, 1,
1.896302, 0.07833473, -0.07582082, 1, 1, 1, 1, 1,
1.900635, 1.68372, 0.05374969, 1, 1, 1, 1, 1,
1.918496, 2.300472, 0.2604362, 1, 1, 1, 1, 1,
1.931383, 0.5051335, 1.866876, 1, 1, 1, 1, 1,
1.940499, 0.267486, -0.5915273, 1, 1, 1, 1, 1,
1.954902, -0.842243, 0.4859201, 1, 1, 1, 1, 1,
1.955206, 0.5700426, 0.3239035, 1, 1, 1, 1, 1,
1.966066, 1.589591, 2.241374, 1, 1, 1, 1, 1,
1.966628, 0.181707, 1.268132, 1, 1, 1, 1, 1,
1.967255, -0.6502627, 2.279726, 1, 1, 1, 1, 1,
1.982265, -0.8256094, 0.2277077, 1, 1, 1, 1, 1,
1.985946, -2.430601, 6.159911, 1, 1, 1, 1, 1,
2.015671, -1.685724, 2.514137, 0, 0, 1, 1, 1,
2.021943, 0.8997239, 1.485796, 1, 0, 0, 1, 1,
2.065959, 0.9629618, 0.814786, 1, 0, 0, 1, 1,
2.085521, 2.582689, 0.8490952, 1, 0, 0, 1, 1,
2.095979, -0.1841851, 1.290848, 1, 0, 0, 1, 1,
2.099901, 0.1813521, -0.1236876, 1, 0, 0, 1, 1,
2.107057, 1.000951, 1.565231, 0, 0, 0, 1, 1,
2.108081, -0.381581, 1.469492, 0, 0, 0, 1, 1,
2.173812, 1.001039, 1.369273, 0, 0, 0, 1, 1,
2.25508, -0.1696635, 3.190582, 0, 0, 0, 1, 1,
2.291501, 0.4985605, 0.110905, 0, 0, 0, 1, 1,
2.358713, -1.310555, 2.486249, 0, 0, 0, 1, 1,
2.397145, 0.4474626, 0.2854937, 0, 0, 0, 1, 1,
2.511296, -0.1468965, 0.9558108, 1, 1, 1, 1, 1,
2.529634, -0.8249065, 2.507921, 1, 1, 1, 1, 1,
2.608135, 1.962433, -0.2890273, 1, 1, 1, 1, 1,
2.878938, 1.950551, 1.813463, 1, 1, 1, 1, 1,
2.997164, 2.038789, 0.3012901, 1, 1, 1, 1, 1,
3.017436, -0.7251548, 2.684767, 1, 1, 1, 1, 1,
3.89283, -0.6655095, 2.747577, 1, 1, 1, 1, 1
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
var radius = 9.876112;
var distance = 34.68943;
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
mvMatrix.translate( -0.4439087, 0.03842497, -0.4742227 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.68943);
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