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
-3.559293, -0.2444664, -1.547532, 1, 0, 0, 1,
-3.179336, -0.5226731, -0.3564791, 1, 0.007843138, 0, 1,
-3.093643, 1.301602, -0.9585173, 1, 0.01176471, 0, 1,
-3.071067, -0.2314718, -1.210655, 1, 0.01960784, 0, 1,
-2.860487, -0.8480396, -2.522996, 1, 0.02352941, 0, 1,
-2.836628, 0.7480176, -3.935699, 1, 0.03137255, 0, 1,
-2.703863, 1.474032, -1.10726, 1, 0.03529412, 0, 1,
-2.649061, -0.5681635, -1.236476, 1, 0.04313726, 0, 1,
-2.534261, 1.374182, -3.030803, 1, 0.04705882, 0, 1,
-2.453108, 1.383413, -1.9217, 1, 0.05490196, 0, 1,
-2.383351, -0.547751, -2.710269, 1, 0.05882353, 0, 1,
-2.366374, -0.6441423, -1.639238, 1, 0.06666667, 0, 1,
-2.2772, 1.089677, -1.944016, 1, 0.07058824, 0, 1,
-2.243435, -1.498817, -3.141209, 1, 0.07843138, 0, 1,
-2.243151, 0.3982756, -1.936947, 1, 0.08235294, 0, 1,
-2.181477, -0.3079418, -1.900778, 1, 0.09019608, 0, 1,
-2.171711, -0.3326773, -2.378712, 1, 0.09411765, 0, 1,
-2.147487, 0.7839308, -0.01340872, 1, 0.1019608, 0, 1,
-2.142758, 0.5631351, -2.62353, 1, 0.1098039, 0, 1,
-2.117179, -0.5332987, -1.24388, 1, 0.1137255, 0, 1,
-2.086695, 1.003539, -0.1405542, 1, 0.1215686, 0, 1,
-2.083531, -1.277667, -1.437977, 1, 0.1254902, 0, 1,
-2.076197, -1.095968, -3.113853, 1, 0.1333333, 0, 1,
-2.068823, 0.7697294, -1.994133, 1, 0.1372549, 0, 1,
-2.02925, 0.7010282, 0.6229308, 1, 0.145098, 0, 1,
-2.0225, 0.3857774, -2.529758, 1, 0.1490196, 0, 1,
-2.008295, 1.044344, -1.513764, 1, 0.1568628, 0, 1,
-1.965764, 1.520763, -2.198627, 1, 0.1607843, 0, 1,
-1.899088, -1.345517, -4.696359, 1, 0.1686275, 0, 1,
-1.865497, -0.9860249, -4.017462, 1, 0.172549, 0, 1,
-1.861968, -0.2255229, -1.087726, 1, 0.1803922, 0, 1,
-1.843622, 0.914224, -0.7106727, 1, 0.1843137, 0, 1,
-1.830949, -1.601767, -3.65171, 1, 0.1921569, 0, 1,
-1.828398, -1.853379, -2.123146, 1, 0.1960784, 0, 1,
-1.824634, -1.728445, -2.204309, 1, 0.2039216, 0, 1,
-1.777755, 0.7767231, -2.220658, 1, 0.2117647, 0, 1,
-1.771868, 0.01371124, -1.262807, 1, 0.2156863, 0, 1,
-1.771329, 1.307221, -0.5866204, 1, 0.2235294, 0, 1,
-1.747984, -0.03145455, -1.783737, 1, 0.227451, 0, 1,
-1.693757, -0.2870779, 0.4161848, 1, 0.2352941, 0, 1,
-1.679189, 1.011439, -0.8982497, 1, 0.2392157, 0, 1,
-1.676243, -0.2827966, -2.666662, 1, 0.2470588, 0, 1,
-1.659489, -0.5733054, -1.087689, 1, 0.2509804, 0, 1,
-1.654824, 0.4315259, -2.340282, 1, 0.2588235, 0, 1,
-1.642498, 0.779834, -1.97545, 1, 0.2627451, 0, 1,
-1.638272, 1.054893, -0.7920866, 1, 0.2705882, 0, 1,
-1.636229, 0.2667949, -1.503453, 1, 0.2745098, 0, 1,
-1.634834, -1.371051, -1.068065, 1, 0.282353, 0, 1,
-1.63136, 1.255125, -0.767838, 1, 0.2862745, 0, 1,
-1.626237, -0.2460393, -3.31893, 1, 0.2941177, 0, 1,
-1.612715, 0.9190646, -1.61265, 1, 0.3019608, 0, 1,
-1.608914, 0.3796896, -1.38939, 1, 0.3058824, 0, 1,
-1.60403, 0.8641687, -1.036557, 1, 0.3137255, 0, 1,
-1.575055, 1.560219, -0.6365224, 1, 0.3176471, 0, 1,
-1.558907, 0.6263884, -0.9966315, 1, 0.3254902, 0, 1,
-1.55459, 0.3741428, -2.643567, 1, 0.3294118, 0, 1,
-1.518959, -1.295334, -2.988488, 1, 0.3372549, 0, 1,
-1.503702, -0.2009387, -0.7804524, 1, 0.3411765, 0, 1,
-1.482632, 0.1271339, -0.432589, 1, 0.3490196, 0, 1,
-1.481459, -1.549817, -1.743298, 1, 0.3529412, 0, 1,
-1.480148, 0.1290602, -3.123984, 1, 0.3607843, 0, 1,
-1.47178, 0.4352762, -3.029793, 1, 0.3647059, 0, 1,
-1.46881, 1.0379, -1.498328, 1, 0.372549, 0, 1,
-1.466665, 0.8987924, -1.641053, 1, 0.3764706, 0, 1,
-1.464718, -1.552412, -2.637572, 1, 0.3843137, 0, 1,
-1.457418, 0.8393837, -0.736579, 1, 0.3882353, 0, 1,
-1.455142, -0.5964661, -4.224273, 1, 0.3960784, 0, 1,
-1.452689, -0.4011323, -1.55891, 1, 0.4039216, 0, 1,
-1.451951, 1.101358, -1.519795, 1, 0.4078431, 0, 1,
-1.451299, 1.441356, -1.534602, 1, 0.4156863, 0, 1,
-1.446037, 0.8903173, -0.4571052, 1, 0.4196078, 0, 1,
-1.445086, 0.7770075, -2.086873, 1, 0.427451, 0, 1,
-1.441507, 0.3165076, -1.09591, 1, 0.4313726, 0, 1,
-1.43985, -1.755477, -1.010133, 1, 0.4392157, 0, 1,
-1.424743, -1.608084, -1.833987, 1, 0.4431373, 0, 1,
-1.410399, 0.9666662, -2.879635, 1, 0.4509804, 0, 1,
-1.404788, 1.20316, -2.066188, 1, 0.454902, 0, 1,
-1.401424, 2.688322, -1.744923, 1, 0.4627451, 0, 1,
-1.391063, -1.781889, -2.954615, 1, 0.4666667, 0, 1,
-1.388518, -0.6404214, -3.098219, 1, 0.4745098, 0, 1,
-1.381791, 1.432292, -0.524889, 1, 0.4784314, 0, 1,
-1.375711, 2.362941, -0.9012304, 1, 0.4862745, 0, 1,
-1.374061, -0.9832997, -1.529398, 1, 0.4901961, 0, 1,
-1.373086, -0.01309702, -1.917792, 1, 0.4980392, 0, 1,
-1.357475, 0.08013997, -3.14363, 1, 0.5058824, 0, 1,
-1.350492, -1.75258, -3.853061, 1, 0.509804, 0, 1,
-1.338518, 0.08181535, -0.8359078, 1, 0.5176471, 0, 1,
-1.336842, 0.4588493, -0.739631, 1, 0.5215687, 0, 1,
-1.332893, -1.625532, -2.856198, 1, 0.5294118, 0, 1,
-1.318377, 0.5029563, -0.9747885, 1, 0.5333334, 0, 1,
-1.312371, -0.4282471, -2.376716, 1, 0.5411765, 0, 1,
-1.306735, 1.390107, -1.551053, 1, 0.5450981, 0, 1,
-1.29976, 0.8451695, 0.2618871, 1, 0.5529412, 0, 1,
-1.278787, 2.442479, -0.04892411, 1, 0.5568628, 0, 1,
-1.275352, -0.7242407, -3.354085, 1, 0.5647059, 0, 1,
-1.266403, 0.2949899, -1.266116, 1, 0.5686275, 0, 1,
-1.255567, -0.6373154, -1.52569, 1, 0.5764706, 0, 1,
-1.250268, -1.130156, -2.775394, 1, 0.5803922, 0, 1,
-1.241783, -0.0009132603, 0.3251346, 1, 0.5882353, 0, 1,
-1.241777, 1.07759, 0.5250515, 1, 0.5921569, 0, 1,
-1.239383, -0.3778268, -1.821607, 1, 0.6, 0, 1,
-1.232276, 1.351883, 0.7793424, 1, 0.6078432, 0, 1,
-1.227186, -0.2982025, -0.842792, 1, 0.6117647, 0, 1,
-1.216691, -1.624741, -1.080686, 1, 0.6196079, 0, 1,
-1.216457, 1.128258, -1.436845, 1, 0.6235294, 0, 1,
-1.208912, -0.09538114, -2.245226, 1, 0.6313726, 0, 1,
-1.205647, 0.9434768, -0.3724441, 1, 0.6352941, 0, 1,
-1.203419, -0.899848, -1.86335, 1, 0.6431373, 0, 1,
-1.199313, -0.7165048, -2.440242, 1, 0.6470588, 0, 1,
-1.198835, 0.3577691, -3.27743, 1, 0.654902, 0, 1,
-1.194982, -2.429358, -3.505342, 1, 0.6588235, 0, 1,
-1.194823, -0.6266221, -1.59386, 1, 0.6666667, 0, 1,
-1.188313, -0.1536857, -0.9647912, 1, 0.6705883, 0, 1,
-1.18631, -0.8561572, -1.787858, 1, 0.6784314, 0, 1,
-1.182132, -0.0232974, -1.773244, 1, 0.682353, 0, 1,
-1.180365, -1.267543, -1.645788, 1, 0.6901961, 0, 1,
-1.17268, 1.812847, -0.8109292, 1, 0.6941177, 0, 1,
-1.163525, -0.9395753, -2.510816, 1, 0.7019608, 0, 1,
-1.163302, -1.075597, -3.91681, 1, 0.7098039, 0, 1,
-1.162955, -0.1013797, -1.214348, 1, 0.7137255, 0, 1,
-1.157547, 0.1963227, -0.5731904, 1, 0.7215686, 0, 1,
-1.156637, -1.132768, -2.13505, 1, 0.7254902, 0, 1,
-1.153055, 0.9888158, -0.8439965, 1, 0.7333333, 0, 1,
-1.150256, -0.4944085, -3.812883, 1, 0.7372549, 0, 1,
-1.140375, -0.4215927, -0.6686772, 1, 0.7450981, 0, 1,
-1.140368, -0.7951638, -1.666487, 1, 0.7490196, 0, 1,
-1.140243, -1.36856, -3.057097, 1, 0.7568628, 0, 1,
-1.134992, 0.2666341, 0.3646128, 1, 0.7607843, 0, 1,
-1.129883, 0.05680846, -2.351127, 1, 0.7686275, 0, 1,
-1.128313, -0.2704065, -2.656669, 1, 0.772549, 0, 1,
-1.120775, 0.4345822, -1.094655, 1, 0.7803922, 0, 1,
-1.117645, 0.3638334, 0.3610451, 1, 0.7843137, 0, 1,
-1.102734, 2.192843, -0.01773395, 1, 0.7921569, 0, 1,
-1.089259, -1.317952, -2.210611, 1, 0.7960784, 0, 1,
-1.085641, 0.9677572, -1.717767, 1, 0.8039216, 0, 1,
-1.079085, -0.4811244, -1.995875, 1, 0.8117647, 0, 1,
-1.072007, -2.026557, -3.303889, 1, 0.8156863, 0, 1,
-1.067537, 0.2845812, -2.533863, 1, 0.8235294, 0, 1,
-1.064137, 1.187628, -1.561471, 1, 0.827451, 0, 1,
-1.060127, 2.16613, -2.614057, 1, 0.8352941, 0, 1,
-1.047406, -2.0784, -3.216477, 1, 0.8392157, 0, 1,
-1.033283, -0.8312432, -1.064564, 1, 0.8470588, 0, 1,
-1.032697, -0.3057804, -2.433985, 1, 0.8509804, 0, 1,
-1.031181, -1.780899, -3.384253, 1, 0.8588235, 0, 1,
-1.024889, 0.8908927, -1.704726, 1, 0.8627451, 0, 1,
-1.023589, 0.7556655, 1.334654, 1, 0.8705882, 0, 1,
-1.022538, -0.5619704, -4.385529, 1, 0.8745098, 0, 1,
-1.02247, 0.3070454, -2.16108, 1, 0.8823529, 0, 1,
-1.022329, -1.061122, -3.932176, 1, 0.8862745, 0, 1,
-1.010509, 0.593558, 1.409637, 1, 0.8941177, 0, 1,
-1.00969, -0.4633485, -1.638225, 1, 0.8980392, 0, 1,
-1.00156, -0.48253, -0.5719842, 1, 0.9058824, 0, 1,
-0.9966536, 1.038388, -0.1773661, 1, 0.9137255, 0, 1,
-0.9781128, 1.149358, 0.5432673, 1, 0.9176471, 0, 1,
-0.9774769, 1.164939, -2.283005, 1, 0.9254902, 0, 1,
-0.9760144, -0.6383117, -5.060359, 1, 0.9294118, 0, 1,
-0.9750656, -0.6089193, -0.4206879, 1, 0.9372549, 0, 1,
-0.974627, -1.445086, -3.545944, 1, 0.9411765, 0, 1,
-0.9740904, -0.8628408, -2.104044, 1, 0.9490196, 0, 1,
-0.960916, 0.7566404, -0.4487249, 1, 0.9529412, 0, 1,
-0.9590208, 0.5703911, 0.03338993, 1, 0.9607843, 0, 1,
-0.957451, -1.438467, -1.15266, 1, 0.9647059, 0, 1,
-0.9516605, -1.07303, -2.360015, 1, 0.972549, 0, 1,
-0.950008, 0.4622104, -1.319666, 1, 0.9764706, 0, 1,
-0.9495604, -0.04056686, -3.181596, 1, 0.9843137, 0, 1,
-0.9475342, 0.199654, -2.30158, 1, 0.9882353, 0, 1,
-0.9439594, -0.9797925, -2.135831, 1, 0.9960784, 0, 1,
-0.9423692, -0.255783, -3.465797, 0.9960784, 1, 0, 1,
-0.9400189, 0.2030855, -1.155558, 0.9921569, 1, 0, 1,
-0.9357187, -0.8777333, -2.733947, 0.9843137, 1, 0, 1,
-0.9356989, 0.06711486, -3.632265, 0.9803922, 1, 0, 1,
-0.9335615, 0.309373, -1.491792, 0.972549, 1, 0, 1,
-0.9295048, -0.6579053, -2.035356, 0.9686275, 1, 0, 1,
-0.9288996, -1.587889, -2.176447, 0.9607843, 1, 0, 1,
-0.9288154, 1.409509, -0.007616763, 0.9568627, 1, 0, 1,
-0.9217563, 1.205058, -1.070116, 0.9490196, 1, 0, 1,
-0.9159482, 0.4976049, -1.38311, 0.945098, 1, 0, 1,
-0.9117422, 0.2540184, -0.8364524, 0.9372549, 1, 0, 1,
-0.9065098, -1.220912, -2.646111, 0.9333333, 1, 0, 1,
-0.9050028, 0.1380792, -3.003542, 0.9254902, 1, 0, 1,
-0.8992391, 1.071197, -1.62403, 0.9215686, 1, 0, 1,
-0.8987914, -0.08677879, -1.889832, 0.9137255, 1, 0, 1,
-0.8932989, -0.4066333, -1.25694, 0.9098039, 1, 0, 1,
-0.8789838, -0.6759558, -3.515591, 0.9019608, 1, 0, 1,
-0.8776513, 0.8559471, -0.5296011, 0.8941177, 1, 0, 1,
-0.8738009, 0.9994646, 0.4618145, 0.8901961, 1, 0, 1,
-0.8687908, -0.6258882, -1.667366, 0.8823529, 1, 0, 1,
-0.8684172, -0.7161014, -2.5724, 0.8784314, 1, 0, 1,
-0.8674963, -0.1675731, -3.623635, 0.8705882, 1, 0, 1,
-0.8664684, -1.787796, -3.966769, 0.8666667, 1, 0, 1,
-0.8643658, 0.6813192, -2.288589, 0.8588235, 1, 0, 1,
-0.8617154, 0.9774951, -2.122705, 0.854902, 1, 0, 1,
-0.8529675, -1.024685, -2.963784, 0.8470588, 1, 0, 1,
-0.8523556, -0.07956, -1.731196, 0.8431373, 1, 0, 1,
-0.8487916, 0.3682984, 0.8099802, 0.8352941, 1, 0, 1,
-0.8451326, -0.4899827, -1.365544, 0.8313726, 1, 0, 1,
-0.8398903, -1.792153, -4.014453, 0.8235294, 1, 0, 1,
-0.8299114, -1.003419, -3.248434, 0.8196079, 1, 0, 1,
-0.8278372, -1.336084, -2.189138, 0.8117647, 1, 0, 1,
-0.8275675, 0.2932787, -3.130394, 0.8078431, 1, 0, 1,
-0.825546, 0.5118809, -1.096506, 0.8, 1, 0, 1,
-0.8188831, -0.2533608, -0.90035, 0.7921569, 1, 0, 1,
-0.8129327, -0.5268984, -3.307539, 0.7882353, 1, 0, 1,
-0.8036721, 0.3013386, -1.670623, 0.7803922, 1, 0, 1,
-0.7998997, -2.07683, -2.802476, 0.7764706, 1, 0, 1,
-0.799244, 1.018154, 0.5699204, 0.7686275, 1, 0, 1,
-0.790801, -0.05801452, -1.944698, 0.7647059, 1, 0, 1,
-0.7901349, 0.6039654, 0.2558896, 0.7568628, 1, 0, 1,
-0.7896083, 0.757187, -0.8364562, 0.7529412, 1, 0, 1,
-0.7884285, 1.177885, 0.5526596, 0.7450981, 1, 0, 1,
-0.7826619, 0.6831123, -1.66142, 0.7411765, 1, 0, 1,
-0.7780574, -1.696893, -3.450018, 0.7333333, 1, 0, 1,
-0.774483, -1.382276, -1.621339, 0.7294118, 1, 0, 1,
-0.7720247, 0.9575384, -0.9330963, 0.7215686, 1, 0, 1,
-0.7637193, 0.3466282, -2.174417, 0.7176471, 1, 0, 1,
-0.7562958, 0.1571856, 0.3247484, 0.7098039, 1, 0, 1,
-0.7508163, 1.671195, -0.3829339, 0.7058824, 1, 0, 1,
-0.7467051, -0.9538692, -1.207958, 0.6980392, 1, 0, 1,
-0.7466115, -0.9231182, -2.199638, 0.6901961, 1, 0, 1,
-0.740788, -0.2520747, -4.230334, 0.6862745, 1, 0, 1,
-0.7400302, 0.2941843, -0.626698, 0.6784314, 1, 0, 1,
-0.7396828, 0.917777, 1.657349, 0.6745098, 1, 0, 1,
-0.7367299, -1.648543, -2.08316, 0.6666667, 1, 0, 1,
-0.7327628, -0.9864879, -1.992805, 0.6627451, 1, 0, 1,
-0.7265881, -0.9807377, -1.611928, 0.654902, 1, 0, 1,
-0.7139668, 0.2410787, -2.633096, 0.6509804, 1, 0, 1,
-0.7124535, 0.2756989, -0.9422354, 0.6431373, 1, 0, 1,
-0.7124175, -1.852924, -2.386663, 0.6392157, 1, 0, 1,
-0.7114615, 0.5056821, -1.269198, 0.6313726, 1, 0, 1,
-0.7099139, 0.2057795, -0.6063617, 0.627451, 1, 0, 1,
-0.6958316, -0.7568418, -2.054491, 0.6196079, 1, 0, 1,
-0.6946591, 1.056187, -1.712844, 0.6156863, 1, 0, 1,
-0.6915707, -0.4610024, -1.062324, 0.6078432, 1, 0, 1,
-0.6903164, -0.3817295, -3.968782, 0.6039216, 1, 0, 1,
-0.6821941, -0.9217475, -3.421956, 0.5960785, 1, 0, 1,
-0.6803926, 0.4521374, -2.424001, 0.5882353, 1, 0, 1,
-0.6779833, -2.389506, -2.528253, 0.5843138, 1, 0, 1,
-0.6743799, -0.5265447, -3.081854, 0.5764706, 1, 0, 1,
-0.6738575, -0.05796938, -3.412307, 0.572549, 1, 0, 1,
-0.6714607, -0.6600737, -3.954303, 0.5647059, 1, 0, 1,
-0.6660832, -0.68325, -3.343142, 0.5607843, 1, 0, 1,
-0.6634898, 0.9367335, 0.9401668, 0.5529412, 1, 0, 1,
-0.6624925, -0.7232447, -2.20183, 0.5490196, 1, 0, 1,
-0.6618562, 0.0248496, -1.465577, 0.5411765, 1, 0, 1,
-0.661079, 0.9345254, -1.282602, 0.5372549, 1, 0, 1,
-0.6583582, -0.6173562, -3.577772, 0.5294118, 1, 0, 1,
-0.6527028, 0.9097163, -0.4822361, 0.5254902, 1, 0, 1,
-0.650402, -0.5341265, -2.625273, 0.5176471, 1, 0, 1,
-0.6452397, -1.210428, -2.429548, 0.5137255, 1, 0, 1,
-0.6437384, 0.5328727, -0.6864653, 0.5058824, 1, 0, 1,
-0.6404016, -0.1426691, -1.63481, 0.5019608, 1, 0, 1,
-0.6366004, -0.4883737, -3.27308, 0.4941176, 1, 0, 1,
-0.6346436, -1.421631, -2.377342, 0.4862745, 1, 0, 1,
-0.6332377, -0.7178288, -1.721364, 0.4823529, 1, 0, 1,
-0.6298378, 0.06404625, -2.868725, 0.4745098, 1, 0, 1,
-0.6290463, 0.3969161, -1.283141, 0.4705882, 1, 0, 1,
-0.6285551, -0.6892659, -2.196428, 0.4627451, 1, 0, 1,
-0.622788, 0.1504734, -0.3490361, 0.4588235, 1, 0, 1,
-0.6161835, 1.781477, -0.3998738, 0.4509804, 1, 0, 1,
-0.6154002, -0.4866839, -2.793932, 0.4470588, 1, 0, 1,
-0.6124548, -1.24165, -1.318673, 0.4392157, 1, 0, 1,
-0.6095741, 0.4411038, -2.945707, 0.4352941, 1, 0, 1,
-0.6046422, -0.6656185, -2.599782, 0.427451, 1, 0, 1,
-0.6026554, -0.4812365, -3.485339, 0.4235294, 1, 0, 1,
-0.5953361, 1.090592, 0.009210808, 0.4156863, 1, 0, 1,
-0.5929013, -0.3858776, -1.571072, 0.4117647, 1, 0, 1,
-0.5924596, 1.600356, -0.95714, 0.4039216, 1, 0, 1,
-0.5906794, 0.854543, -0.2985632, 0.3960784, 1, 0, 1,
-0.5865042, 0.2974518, -1.470467, 0.3921569, 1, 0, 1,
-0.5814916, 0.5455427, -1.370539, 0.3843137, 1, 0, 1,
-0.5749128, 2.201558, -1.557357, 0.3803922, 1, 0, 1,
-0.574573, 1.358442, -0.6540457, 0.372549, 1, 0, 1,
-0.5727603, 0.7722108, -0.4377991, 0.3686275, 1, 0, 1,
-0.5649647, 0.06244696, -2.37455, 0.3607843, 1, 0, 1,
-0.561142, -0.03544414, 0.3627211, 0.3568628, 1, 0, 1,
-0.5598848, 1.383872, -1.34069, 0.3490196, 1, 0, 1,
-0.5591801, 1.066272, -0.7632224, 0.345098, 1, 0, 1,
-0.5578398, 0.0840569, -0.7247841, 0.3372549, 1, 0, 1,
-0.5569991, -0.312434, -3.552525, 0.3333333, 1, 0, 1,
-0.5552309, 0.8057945, -2.538907, 0.3254902, 1, 0, 1,
-0.5499017, -2.253837, -4.142969, 0.3215686, 1, 0, 1,
-0.5488204, 0.7970841, -1.744957, 0.3137255, 1, 0, 1,
-0.5463359, 2.549043, -0.2912147, 0.3098039, 1, 0, 1,
-0.545893, 1.158652, 0.1829254, 0.3019608, 1, 0, 1,
-0.5456804, 0.4455993, -0.6463627, 0.2941177, 1, 0, 1,
-0.5431015, -0.1746768, -0.4295099, 0.2901961, 1, 0, 1,
-0.5425122, 1.299602, -1.140737, 0.282353, 1, 0, 1,
-0.5424981, 0.4240392, -1.755343, 0.2784314, 1, 0, 1,
-0.5402818, -0.7004661, -1.995405, 0.2705882, 1, 0, 1,
-0.5356445, -0.4920414, -1.920517, 0.2666667, 1, 0, 1,
-0.5351415, 0.5997565, -0.4109718, 0.2588235, 1, 0, 1,
-0.5309777, 0.7543337, 0.2032253, 0.254902, 1, 0, 1,
-0.5255362, 0.8356081, -1.322906, 0.2470588, 1, 0, 1,
-0.5225368, -1.096232, -2.698715, 0.2431373, 1, 0, 1,
-0.5216136, -1.579636, -1.839096, 0.2352941, 1, 0, 1,
-0.5209642, 0.3027344, -2.707049, 0.2313726, 1, 0, 1,
-0.5148589, -0.5589558, -1.46689, 0.2235294, 1, 0, 1,
-0.514733, -0.1928754, -1.711572, 0.2196078, 1, 0, 1,
-0.5138271, 0.7577257, -0.1820593, 0.2117647, 1, 0, 1,
-0.5105321, -0.3542996, -1.345758, 0.2078431, 1, 0, 1,
-0.5084227, -0.9704163, -3.466611, 0.2, 1, 0, 1,
-0.5031921, -1.4785, -2.938797, 0.1921569, 1, 0, 1,
-0.5009347, 0.4995657, -0.6559753, 0.1882353, 1, 0, 1,
-0.4929501, 0.4104003, -1.385217, 0.1803922, 1, 0, 1,
-0.4927347, 0.08581427, -2.411603, 0.1764706, 1, 0, 1,
-0.4900511, 0.1120962, -2.008109, 0.1686275, 1, 0, 1,
-0.4892244, -1.728229, -4.293824, 0.1647059, 1, 0, 1,
-0.4869421, -0.8169975, -0.6403203, 0.1568628, 1, 0, 1,
-0.4855846, 0.8018537, -0.5244273, 0.1529412, 1, 0, 1,
-0.4849067, 0.2781248, -0.4864605, 0.145098, 1, 0, 1,
-0.483711, 1.338396, -0.7190654, 0.1411765, 1, 0, 1,
-0.4825456, 0.8024433, 0.9285088, 0.1333333, 1, 0, 1,
-0.4823919, 1.143245, -0.931667, 0.1294118, 1, 0, 1,
-0.4791414, -1.707661, -2.859179, 0.1215686, 1, 0, 1,
-0.4748472, -0.08280556, -3.028434, 0.1176471, 1, 0, 1,
-0.4702518, -0.04648241, 0.3601571, 0.1098039, 1, 0, 1,
-0.467999, -0.8353478, -3.175205, 0.1058824, 1, 0, 1,
-0.4665797, -0.8157055, -0.01356146, 0.09803922, 1, 0, 1,
-0.4660597, -1.284947, -4.433356, 0.09019608, 1, 0, 1,
-0.4659226, 0.3744969, -0.4953834, 0.08627451, 1, 0, 1,
-0.4658912, -1.70735, -3.67177, 0.07843138, 1, 0, 1,
-0.4655662, -0.1674594, -1.566943, 0.07450981, 1, 0, 1,
-0.464248, 0.2906587, -1.205382, 0.06666667, 1, 0, 1,
-0.4603164, 0.1430041, -2.82014, 0.0627451, 1, 0, 1,
-0.4597586, -0.4042135, -1.856298, 0.05490196, 1, 0, 1,
-0.459729, 0.182477, -2.041484, 0.05098039, 1, 0, 1,
-0.4585508, -2.253398, -2.744689, 0.04313726, 1, 0, 1,
-0.4525602, 0.3576789, -1.210428, 0.03921569, 1, 0, 1,
-0.452146, 0.3317884, -0.2636966, 0.03137255, 1, 0, 1,
-0.4476334, 1.760464, -0.08421775, 0.02745098, 1, 0, 1,
-0.4417318, 0.1465031, -1.783714, 0.01960784, 1, 0, 1,
-0.4412415, -0.5420856, -2.189291, 0.01568628, 1, 0, 1,
-0.4392721, -1.59379, -3.153153, 0.007843138, 1, 0, 1,
-0.4371592, -1.472418, -3.338475, 0.003921569, 1, 0, 1,
-0.4348896, -0.7659959, -3.406741, 0, 1, 0.003921569, 1,
-0.4345398, 1.341296, -0.3312749, 0, 1, 0.01176471, 1,
-0.4329289, 0.5943282, -0.9143724, 0, 1, 0.01568628, 1,
-0.4314322, 1.061253, -0.2867896, 0, 1, 0.02352941, 1,
-0.4313846, -1.963022, -2.329927, 0, 1, 0.02745098, 1,
-0.4292644, -1.225803, -4.631366, 0, 1, 0.03529412, 1,
-0.4286524, 0.2426796, -2.841428, 0, 1, 0.03921569, 1,
-0.4276783, 0.4917676, -1.516059, 0, 1, 0.04705882, 1,
-0.4268427, -0.881258, -1.644742, 0, 1, 0.05098039, 1,
-0.4254602, -0.7364654, -3.580317, 0, 1, 0.05882353, 1,
-0.4235531, 1.199521, 0.4697096, 0, 1, 0.0627451, 1,
-0.4176493, 0.4282679, -1.883771, 0, 1, 0.07058824, 1,
-0.4128374, -0.2343397, -2.364411, 0, 1, 0.07450981, 1,
-0.4107776, 0.7548673, -1.673601, 0, 1, 0.08235294, 1,
-0.4070266, -1.346463, -3.396598, 0, 1, 0.08627451, 1,
-0.4058061, -0.01253946, -1.644707, 0, 1, 0.09411765, 1,
-0.4045858, -0.2778376, -1.949516, 0, 1, 0.1019608, 1,
-0.4031263, -1.55461, -1.760256, 0, 1, 0.1058824, 1,
-0.4011573, -0.7043058, -1.30808, 0, 1, 0.1137255, 1,
-0.4004988, -0.02561639, -1.668774, 0, 1, 0.1176471, 1,
-0.3957295, -0.4936892, -2.34111, 0, 1, 0.1254902, 1,
-0.3956622, 2.578814, -0.3653908, 0, 1, 0.1294118, 1,
-0.3923818, 0.6594738, 0.744592, 0, 1, 0.1372549, 1,
-0.391992, -0.06051882, -2.968313, 0, 1, 0.1411765, 1,
-0.389862, 1.173105, 0.4086781, 0, 1, 0.1490196, 1,
-0.3838489, 0.4893546, -0.8175498, 0, 1, 0.1529412, 1,
-0.3838437, 0.1393329, -0.6392322, 0, 1, 0.1607843, 1,
-0.3828163, 0.1418691, 0.219584, 0, 1, 0.1647059, 1,
-0.3786564, -0.09921998, -2.468979, 0, 1, 0.172549, 1,
-0.3739504, 0.6211142, -0.8255134, 0, 1, 0.1764706, 1,
-0.3700352, 1.353251, 0.1690661, 0, 1, 0.1843137, 1,
-0.3682101, 1.211895, 0.05134806, 0, 1, 0.1882353, 1,
-0.3651141, 0.04461514, -0.72962, 0, 1, 0.1960784, 1,
-0.3645489, -1.467206, -0.5980828, 0, 1, 0.2039216, 1,
-0.3628342, -0.822434, -3.050448, 0, 1, 0.2078431, 1,
-0.3625519, 0.9031465, -0.5896847, 0, 1, 0.2156863, 1,
-0.3609945, 1.12566, -0.6315301, 0, 1, 0.2196078, 1,
-0.3510135, 1.211199, -1.646094, 0, 1, 0.227451, 1,
-0.350682, 1.132202, 0.2260387, 0, 1, 0.2313726, 1,
-0.3496607, 1.720801, -0.3586449, 0, 1, 0.2392157, 1,
-0.3469527, -0.2305278, -2.391267, 0, 1, 0.2431373, 1,
-0.3460275, 1.249881, -0.3849559, 0, 1, 0.2509804, 1,
-0.3444806, 1.190461, -1.545605, 0, 1, 0.254902, 1,
-0.3436777, -1.196514, -5.490393, 0, 1, 0.2627451, 1,
-0.3434548, 0.8363701, 0.8583719, 0, 1, 0.2666667, 1,
-0.3425416, -0.1929792, -1.346122, 0, 1, 0.2745098, 1,
-0.3424987, 0.5877998, 1.257284, 0, 1, 0.2784314, 1,
-0.3415545, 0.9684787, -1.233574, 0, 1, 0.2862745, 1,
-0.3400656, -0.4912958, -3.006281, 0, 1, 0.2901961, 1,
-0.3324718, -0.09645033, -2.043689, 0, 1, 0.2980392, 1,
-0.3253087, 0.9839373, -1.921785, 0, 1, 0.3058824, 1,
-0.3209046, -0.575739, -3.279375, 0, 1, 0.3098039, 1,
-0.3197353, 0.1512505, -1.044767, 0, 1, 0.3176471, 1,
-0.3165306, 0.4127606, 0.8568015, 0, 1, 0.3215686, 1,
-0.312479, 1.115992, -0.7066646, 0, 1, 0.3294118, 1,
-0.3032564, 0.03860817, -2.239611, 0, 1, 0.3333333, 1,
-0.3022864, -0.3055097, -2.56966, 0, 1, 0.3411765, 1,
-0.2993928, 1.141, -0.4504991, 0, 1, 0.345098, 1,
-0.2901035, -2.163071, -1.951236, 0, 1, 0.3529412, 1,
-0.2824347, 0.8787425, -0.2645628, 0, 1, 0.3568628, 1,
-0.279464, -0.418153, -1.783357, 0, 1, 0.3647059, 1,
-0.2766924, -0.1456134, -1.826424, 0, 1, 0.3686275, 1,
-0.2715886, -0.02688859, -2.042073, 0, 1, 0.3764706, 1,
-0.2707831, -0.9226623, -4.257861, 0, 1, 0.3803922, 1,
-0.2622636, 1.431255, 0.2647352, 0, 1, 0.3882353, 1,
-0.2621822, -0.3753732, -2.556537, 0, 1, 0.3921569, 1,
-0.2609028, -0.4369053, -5.403312, 0, 1, 0.4, 1,
-0.2537267, -0.5192937, -1.030789, 0, 1, 0.4078431, 1,
-0.2485025, 0.1737739, 0.4032093, 0, 1, 0.4117647, 1,
-0.2391053, 1.17715, -0.3156714, 0, 1, 0.4196078, 1,
-0.2345491, -0.4916517, -2.039886, 0, 1, 0.4235294, 1,
-0.2331253, -1.773007, -3.375947, 0, 1, 0.4313726, 1,
-0.2323374, 0.4938824, 1.631494, 0, 1, 0.4352941, 1,
-0.230348, 1.960676, 0.8382569, 0, 1, 0.4431373, 1,
-0.227562, 0.2595744, -2.207596, 0, 1, 0.4470588, 1,
-0.2268124, 0.1946863, -1.00225, 0, 1, 0.454902, 1,
-0.2256469, -2.33568, -2.699769, 0, 1, 0.4588235, 1,
-0.2248733, 0.2514682, -1.902841, 0, 1, 0.4666667, 1,
-0.2224793, -0.5817879, -2.122695, 0, 1, 0.4705882, 1,
-0.2195857, 1.603429, 0.2926628, 0, 1, 0.4784314, 1,
-0.2126417, 0.5834647, -2.017542, 0, 1, 0.4823529, 1,
-0.2102921, 1.941304, 0.2592292, 0, 1, 0.4901961, 1,
-0.2046018, -1.747854, -3.534936, 0, 1, 0.4941176, 1,
-0.2010112, -1.550972, -2.212909, 0, 1, 0.5019608, 1,
-0.1939515, -0.6752863, -3.011964, 0, 1, 0.509804, 1,
-0.1938081, 0.4100736, -0.5473972, 0, 1, 0.5137255, 1,
-0.1902379, 3.138336, -1.47818, 0, 1, 0.5215687, 1,
-0.1893682, -1.919213, -3.615214, 0, 1, 0.5254902, 1,
-0.1798173, 0.2289371, -0.8975902, 0, 1, 0.5333334, 1,
-0.1796721, -0.7196748, -1.663201, 0, 1, 0.5372549, 1,
-0.1764908, 1.232722, 0.4365198, 0, 1, 0.5450981, 1,
-0.1741745, -1.175687, -2.835384, 0, 1, 0.5490196, 1,
-0.1740803, -0.1875184, -2.570988, 0, 1, 0.5568628, 1,
-0.1716538, 1.31792, 1.035877, 0, 1, 0.5607843, 1,
-0.1712072, -1.086434, -4.129345, 0, 1, 0.5686275, 1,
-0.1691141, 0.8155693, -0.5474196, 0, 1, 0.572549, 1,
-0.168558, 0.8006653, -0.2706046, 0, 1, 0.5803922, 1,
-0.1605912, -0.9174673, -3.053725, 0, 1, 0.5843138, 1,
-0.1577425, 1.34146, -0.327022, 0, 1, 0.5921569, 1,
-0.15749, 1.839258, 0.5200899, 0, 1, 0.5960785, 1,
-0.1560936, -0.1644521, -1.774012, 0, 1, 0.6039216, 1,
-0.1537712, -0.409633, -1.837512, 0, 1, 0.6117647, 1,
-0.1502379, -0.1002755, -3.18944, 0, 1, 0.6156863, 1,
-0.1468367, -0.3630291, -1.848734, 0, 1, 0.6235294, 1,
-0.1389735, -1.152579, -3.384643, 0, 1, 0.627451, 1,
-0.138055, 0.3778502, -0.2167955, 0, 1, 0.6352941, 1,
-0.1348702, 1.792382, 0.1442339, 0, 1, 0.6392157, 1,
-0.1336403, 0.1903404, -0.8484191, 0, 1, 0.6470588, 1,
-0.1318898, -1.005601, -3.80534, 0, 1, 0.6509804, 1,
-0.1304386, -0.7679209, -3.775136, 0, 1, 0.6588235, 1,
-0.1295205, 0.6366422, -0.552798, 0, 1, 0.6627451, 1,
-0.1290647, -1.716844, -3.292971, 0, 1, 0.6705883, 1,
-0.1252981, 1.126345, -0.1109728, 0, 1, 0.6745098, 1,
-0.1166973, -1.374249, -2.770328, 0, 1, 0.682353, 1,
-0.1129488, 3.020953, 0.6663973, 0, 1, 0.6862745, 1,
-0.1129217, 1.450215, 0.4885923, 0, 1, 0.6941177, 1,
-0.1128934, -0.642231, -3.756468, 0, 1, 0.7019608, 1,
-0.1077005, 0.7927312, 0.09816123, 0, 1, 0.7058824, 1,
-0.1061997, -1.438817, -2.5351, 0, 1, 0.7137255, 1,
-0.1050762, -1.92006, -3.461271, 0, 1, 0.7176471, 1,
-0.09906998, 0.4136958, 0.9618698, 0, 1, 0.7254902, 1,
-0.09468456, -0.09045714, -0.9537421, 0, 1, 0.7294118, 1,
-0.09361668, 0.2240916, 0.108413, 0, 1, 0.7372549, 1,
-0.09352443, 0.04619377, -1.19663, 0, 1, 0.7411765, 1,
-0.08998788, 0.2749889, 0.8364194, 0, 1, 0.7490196, 1,
-0.08844093, 0.7941228, 0.9048082, 0, 1, 0.7529412, 1,
-0.0810315, -0.3617409, -3.341064, 0, 1, 0.7607843, 1,
-0.0760824, 0.281083, 0.5598291, 0, 1, 0.7647059, 1,
-0.07447883, -0.3880076, -2.972277, 0, 1, 0.772549, 1,
-0.07291368, 0.2954817, -1.100768, 0, 1, 0.7764706, 1,
-0.06780092, -0.7976701, -2.925793, 0, 1, 0.7843137, 1,
-0.06646837, -0.284702, -4.013499, 0, 1, 0.7882353, 1,
-0.06559952, 1.937827, -1.159458, 0, 1, 0.7960784, 1,
-0.06544007, -0.8317758, -3.170827, 0, 1, 0.8039216, 1,
-0.06478766, 0.5488122, -0.9333726, 0, 1, 0.8078431, 1,
-0.06376503, -0.617991, -3.20067, 0, 1, 0.8156863, 1,
-0.06220496, -0.8521739, -2.49389, 0, 1, 0.8196079, 1,
-0.05249579, -1.889079, -3.923222, 0, 1, 0.827451, 1,
-0.05133097, -1.553747, -4.870805, 0, 1, 0.8313726, 1,
-0.04664619, 0.3779301, -1.052484, 0, 1, 0.8392157, 1,
-0.04317243, 0.8396696, 1.02318, 0, 1, 0.8431373, 1,
-0.04247084, -1.926482, -4.107938, 0, 1, 0.8509804, 1,
-0.04155804, -1.011896, -3.236026, 0, 1, 0.854902, 1,
-0.04047935, 0.1796588, -0.2499999, 0, 1, 0.8627451, 1,
-0.03607322, 0.9630869, -1.246663, 0, 1, 0.8666667, 1,
-0.03471702, -1.008803, -2.766967, 0, 1, 0.8745098, 1,
-0.02834865, -2.164267, -2.278287, 0, 1, 0.8784314, 1,
-0.02805539, -1.376042, -2.496317, 0, 1, 0.8862745, 1,
-0.02753728, 0.007955943, -1.654538, 0, 1, 0.8901961, 1,
-0.02725893, 0.1310606, -1.058628, 0, 1, 0.8980392, 1,
-0.02472136, 0.8730297, -0.5071279, 0, 1, 0.9058824, 1,
-0.02420834, -1.090788, -4.206845, 0, 1, 0.9098039, 1,
-0.02352714, 0.05827491, -1.33112, 0, 1, 0.9176471, 1,
-0.02294174, -0.3724605, -2.429163, 0, 1, 0.9215686, 1,
-0.02139499, 1.859093, 0.04871175, 0, 1, 0.9294118, 1,
-0.02082479, -2.722915, -1.842634, 0, 1, 0.9333333, 1,
-0.01788399, 0.5871812, 0.0953482, 0, 1, 0.9411765, 1,
-0.01485586, 0.6938408, -1.354078, 0, 1, 0.945098, 1,
-0.009488733, 1.016738, 0.1731709, 0, 1, 0.9529412, 1,
-0.008407444, 0.5470664, -1.677676, 0, 1, 0.9568627, 1,
-0.006945047, -0.6097968, -2.746638, 0, 1, 0.9647059, 1,
-0.003506228, -0.6644975, -2.864167, 0, 1, 0.9686275, 1,
0.00200757, -1.223555, 4.151267, 0, 1, 0.9764706, 1,
0.002339422, -1.272775, 3.848215, 0, 1, 0.9803922, 1,
0.0029902, 0.8330079, -0.5054812, 0, 1, 0.9882353, 1,
0.003676818, -0.5417222, 1.666369, 0, 1, 0.9921569, 1,
0.008222689, 0.4042231, -0.01752171, 0, 1, 1, 1,
0.01251192, 1.426033, 0.6639415, 0, 0.9921569, 1, 1,
0.0131487, 0.6911057, 1.849463, 0, 0.9882353, 1, 1,
0.01441788, -1.035835, 3.253557, 0, 0.9803922, 1, 1,
0.01542411, 0.6091889, -0.1800958, 0, 0.9764706, 1, 1,
0.02075097, -0.03871844, 2.827692, 0, 0.9686275, 1, 1,
0.02535455, -1.034887, 4.994273, 0, 0.9647059, 1, 1,
0.02826962, 0.9063842, -0.4052746, 0, 0.9568627, 1, 1,
0.03026125, 0.02720976, 1.779151, 0, 0.9529412, 1, 1,
0.03109961, 1.70776, -1.602712, 0, 0.945098, 1, 1,
0.03700546, 0.4247835, 1.225925, 0, 0.9411765, 1, 1,
0.03868538, -0.2363665, 2.495406, 0, 0.9333333, 1, 1,
0.04220394, -2.1295, 2.340794, 0, 0.9294118, 1, 1,
0.04428068, 0.1089503, -0.8954051, 0, 0.9215686, 1, 1,
0.04480278, 0.4624234, 1.610874, 0, 0.9176471, 1, 1,
0.04627627, -0.419322, 3.871559, 0, 0.9098039, 1, 1,
0.04658489, -0.8312634, 3.420079, 0, 0.9058824, 1, 1,
0.04831995, -2.311353, 3.180495, 0, 0.8980392, 1, 1,
0.0492418, -0.2192004, 4.376946, 0, 0.8901961, 1, 1,
0.05266038, -2.100069, 3.418245, 0, 0.8862745, 1, 1,
0.05475029, 0.9761986, 0.4688351, 0, 0.8784314, 1, 1,
0.05606975, 1.016761, 1.465276, 0, 0.8745098, 1, 1,
0.05609631, 0.4324547, 1.598793, 0, 0.8666667, 1, 1,
0.05941587, 0.3982528, 1.499549, 0, 0.8627451, 1, 1,
0.06774554, -0.9889981, 2.170126, 0, 0.854902, 1, 1,
0.06952934, 1.848207, 0.6740369, 0, 0.8509804, 1, 1,
0.071266, 1.02672, -2.500751, 0, 0.8431373, 1, 1,
0.07144867, -0.3085123, 4.737636, 0, 0.8392157, 1, 1,
0.07439384, 3.076549, -0.5516654, 0, 0.8313726, 1, 1,
0.07439777, -0.8872185, 3.640971, 0, 0.827451, 1, 1,
0.07598269, 0.5852932, 1.027449, 0, 0.8196079, 1, 1,
0.08224568, -0.5521992, 2.08047, 0, 0.8156863, 1, 1,
0.08333639, -2.319565, 3.336927, 0, 0.8078431, 1, 1,
0.08336599, 0.8436434, 0.5972223, 0, 0.8039216, 1, 1,
0.08338565, 2.108664, 0.9739799, 0, 0.7960784, 1, 1,
0.08355682, -1.61119, 1.622169, 0, 0.7882353, 1, 1,
0.08450457, 0.197496, 0.315006, 0, 0.7843137, 1, 1,
0.08576433, 0.4736675, -0.470211, 0, 0.7764706, 1, 1,
0.08624639, -0.09189468, 0.01510592, 0, 0.772549, 1, 1,
0.08763987, -0.5314943, 3.809505, 0, 0.7647059, 1, 1,
0.08822299, 0.2309697, -0.606439, 0, 0.7607843, 1, 1,
0.09073249, 0.05147354, 0.7036234, 0, 0.7529412, 1, 1,
0.09682406, -1.057139, 4.383829, 0, 0.7490196, 1, 1,
0.1017872, 0.01120408, 2.001372, 0, 0.7411765, 1, 1,
0.1031809, 0.02051975, 2.370722, 0, 0.7372549, 1, 1,
0.1120303, 0.5711362, -0.3348545, 0, 0.7294118, 1, 1,
0.1150931, 0.5833454, 1.833041, 0, 0.7254902, 1, 1,
0.1161548, 0.4313419, 0.5428823, 0, 0.7176471, 1, 1,
0.1170984, 0.3903505, 0.743762, 0, 0.7137255, 1, 1,
0.1171401, 0.8019341, 0.9117028, 0, 0.7058824, 1, 1,
0.1193397, -0.5887689, 0.7694873, 0, 0.6980392, 1, 1,
0.1205195, -1.231305, 3.253274, 0, 0.6941177, 1, 1,
0.1233561, -0.5229025, 2.113248, 0, 0.6862745, 1, 1,
0.1243569, 0.2782355, 1.863378, 0, 0.682353, 1, 1,
0.1258474, 0.2443672, 0.6412889, 0, 0.6745098, 1, 1,
0.1278609, -1.385353, 4.001256, 0, 0.6705883, 1, 1,
0.1284223, -0.3091883, 1.760772, 0, 0.6627451, 1, 1,
0.1291216, -1.276496, 3.496548, 0, 0.6588235, 1, 1,
0.1293456, -0.3504716, 4.788298, 0, 0.6509804, 1, 1,
0.1312299, 0.03150412, 3.095869, 0, 0.6470588, 1, 1,
0.1367967, 0.3004536, 0.8611144, 0, 0.6392157, 1, 1,
0.1368511, -2.079297, 2.970921, 0, 0.6352941, 1, 1,
0.1402986, 1.012314, 0.6791673, 0, 0.627451, 1, 1,
0.1423692, -0.5033709, 2.292628, 0, 0.6235294, 1, 1,
0.1481517, -0.05493038, 1.980044, 0, 0.6156863, 1, 1,
0.1491804, -0.356778, 2.801083, 0, 0.6117647, 1, 1,
0.1520663, 0.5697576, 1.553272, 0, 0.6039216, 1, 1,
0.1528281, 0.6846983, 1.246774, 0, 0.5960785, 1, 1,
0.1556162, -0.3567701, 1.166736, 0, 0.5921569, 1, 1,
0.1561837, 0.3180467, 1.061162, 0, 0.5843138, 1, 1,
0.1573595, -0.6776621, 3.003277, 0, 0.5803922, 1, 1,
0.1579406, -0.1451327, 3.343325, 0, 0.572549, 1, 1,
0.1598361, -0.8804183, 1.581935, 0, 0.5686275, 1, 1,
0.1605903, -0.0305334, 1.482137, 0, 0.5607843, 1, 1,
0.1607029, 0.5353648, 0.03125458, 0, 0.5568628, 1, 1,
0.1635947, 0.9632276, 0.6356984, 0, 0.5490196, 1, 1,
0.1640999, -0.1943008, 0.7470297, 0, 0.5450981, 1, 1,
0.165338, 0.1158274, 3.890805, 0, 0.5372549, 1, 1,
0.1684639, -1.243383, 2.964247, 0, 0.5333334, 1, 1,
0.1699669, -1.451634, 2.075196, 0, 0.5254902, 1, 1,
0.1721192, 0.4890411, 1.208109, 0, 0.5215687, 1, 1,
0.1723726, 0.5082608, 1.030543, 0, 0.5137255, 1, 1,
0.1737265, 0.0288038, 1.382999, 0, 0.509804, 1, 1,
0.1761157, -0.4179715, 1.376794, 0, 0.5019608, 1, 1,
0.1784618, -1.369019, 1.718804, 0, 0.4941176, 1, 1,
0.1817773, 1.107294, 0.6004874, 0, 0.4901961, 1, 1,
0.1875035, -1.690278, 1.943362, 0, 0.4823529, 1, 1,
0.1945113, -1.500585, 2.814525, 0, 0.4784314, 1, 1,
0.1982529, 0.126604, -0.7478586, 0, 0.4705882, 1, 1,
0.2045708, -2.773062, 2.913024, 0, 0.4666667, 1, 1,
0.2054981, 0.1309671, 1.075214, 0, 0.4588235, 1, 1,
0.2059403, -0.253869, 1.557285, 0, 0.454902, 1, 1,
0.2103172, 0.2806317, 0.481165, 0, 0.4470588, 1, 1,
0.2108679, 2.337029, -0.9536432, 0, 0.4431373, 1, 1,
0.2132303, 0.4190426, -0.3036943, 0, 0.4352941, 1, 1,
0.2140517, 0.3727126, 2.194735, 0, 0.4313726, 1, 1,
0.2156232, 1.722004, 0.1421739, 0, 0.4235294, 1, 1,
0.2208863, -1.656541, 4.33942, 0, 0.4196078, 1, 1,
0.227581, -1.311015, 0.7009985, 0, 0.4117647, 1, 1,
0.227823, 0.6278397, 0.8525813, 0, 0.4078431, 1, 1,
0.2278849, 0.5043694, 0.7996239, 0, 0.4, 1, 1,
0.2320661, -0.4893422, 3.810966, 0, 0.3921569, 1, 1,
0.239964, -0.2387611, 3.840615, 0, 0.3882353, 1, 1,
0.2431593, -0.5821726, 3.111485, 0, 0.3803922, 1, 1,
0.2446158, 0.9792567, 0.6519258, 0, 0.3764706, 1, 1,
0.2618856, -1.077871, 0.6428935, 0, 0.3686275, 1, 1,
0.2643687, 1.74979, -0.5150216, 0, 0.3647059, 1, 1,
0.2665704, 0.7855679, -1.038435, 0, 0.3568628, 1, 1,
0.2667035, 0.382933, 1.5798, 0, 0.3529412, 1, 1,
0.2784191, -0.6861058, 5.078519, 0, 0.345098, 1, 1,
0.2786717, 2.056318, -0.4977054, 0, 0.3411765, 1, 1,
0.2798544, -0.6342235, 3.269888, 0, 0.3333333, 1, 1,
0.2811391, 0.1307444, 1.779034, 0, 0.3294118, 1, 1,
0.2831198, 1.712428, 1.230693, 0, 0.3215686, 1, 1,
0.285785, -0.6893022, 4.437227, 0, 0.3176471, 1, 1,
0.2867881, -0.04527652, 0.3167479, 0, 0.3098039, 1, 1,
0.3033015, -1.432786, 2.849147, 0, 0.3058824, 1, 1,
0.3062265, -0.6906356, 3.339233, 0, 0.2980392, 1, 1,
0.3072878, 0.2251779, -1.577317, 0, 0.2901961, 1, 1,
0.3125221, -0.1977792, 2.42463, 0, 0.2862745, 1, 1,
0.3132327, 0.06368805, 1.770708, 0, 0.2784314, 1, 1,
0.3168479, -0.8237107, 2.000807, 0, 0.2745098, 1, 1,
0.3243916, 0.8786221, 0.2584444, 0, 0.2666667, 1, 1,
0.3277754, 1.377772, 1.631828, 0, 0.2627451, 1, 1,
0.328105, 0.1001002, 2.58171, 0, 0.254902, 1, 1,
0.3358085, 0.8569953, 0.8958769, 0, 0.2509804, 1, 1,
0.3413001, -0.9965374, 1.844417, 0, 0.2431373, 1, 1,
0.3416589, -0.8185973, 1.529015, 0, 0.2392157, 1, 1,
0.3446915, 0.09251531, 1.934793, 0, 0.2313726, 1, 1,
0.3518765, -0.695816, 3.347472, 0, 0.227451, 1, 1,
0.3533802, -0.3723201, 1.801407, 0, 0.2196078, 1, 1,
0.3535286, 0.07539505, 1.612165, 0, 0.2156863, 1, 1,
0.3564872, -0.7188491, 1.704978, 0, 0.2078431, 1, 1,
0.358678, -0.1132846, 0.6242524, 0, 0.2039216, 1, 1,
0.3596621, -0.6021686, 2.399643, 0, 0.1960784, 1, 1,
0.3603936, -0.6993694, 2.666676, 0, 0.1882353, 1, 1,
0.3655274, -1.051237, 3.084853, 0, 0.1843137, 1, 1,
0.3680867, 2.115807, -0.04947535, 0, 0.1764706, 1, 1,
0.3689986, 0.814476, -0.4204645, 0, 0.172549, 1, 1,
0.3764711, -0.05662043, 0.7830118, 0, 0.1647059, 1, 1,
0.3792535, 0.7337556, -0.2939324, 0, 0.1607843, 1, 1,
0.3794116, 1.612484, -1.430966, 0, 0.1529412, 1, 1,
0.3813241, 0.2976684, 2.166306, 0, 0.1490196, 1, 1,
0.3826042, 1.035109, 1.3306, 0, 0.1411765, 1, 1,
0.3874072, -0.4363658, 1.589641, 0, 0.1372549, 1, 1,
0.3876418, 1.73542, 1.740134, 0, 0.1294118, 1, 1,
0.3935676, -1.792701, 3.495043, 0, 0.1254902, 1, 1,
0.3984142, 1.467826, -0.3554285, 0, 0.1176471, 1, 1,
0.4036371, 0.1328422, 1.846617, 0, 0.1137255, 1, 1,
0.4042378, 1.114462, 1.807108, 0, 0.1058824, 1, 1,
0.4053871, -0.07617116, 1.785005, 0, 0.09803922, 1, 1,
0.4100141, -1.245793, 2.149927, 0, 0.09411765, 1, 1,
0.4155532, -1.131065, 2.022306, 0, 0.08627451, 1, 1,
0.4201386, -0.5033982, 2.135943, 0, 0.08235294, 1, 1,
0.4235854, -0.9312514, 2.538931, 0, 0.07450981, 1, 1,
0.4277759, -0.119405, 3.200772, 0, 0.07058824, 1, 1,
0.4324713, -1.021, 0.2398661, 0, 0.0627451, 1, 1,
0.4328372, -0.2024097, 1.594712, 0, 0.05882353, 1, 1,
0.4368859, 0.8869778, -0.6363711, 0, 0.05098039, 1, 1,
0.4381561, 1.119065, 2.160223, 0, 0.04705882, 1, 1,
0.4414209, 0.6842546, 0.1769595, 0, 0.03921569, 1, 1,
0.4436592, 2.106011, -0.9953097, 0, 0.03529412, 1, 1,
0.4481496, -2.422032, 2.670518, 0, 0.02745098, 1, 1,
0.4484698, -0.3722243, 0.9566367, 0, 0.02352941, 1, 1,
0.4490455, 0.2282003, 0.5889947, 0, 0.01568628, 1, 1,
0.4507347, 0.0425383, 0.956808, 0, 0.01176471, 1, 1,
0.4545933, 0.3864263, 0.7299953, 0, 0.003921569, 1, 1,
0.4606279, -0.1901419, 2.592728, 0.003921569, 0, 1, 1,
0.4613458, 0.7533711, 0.8841041, 0.007843138, 0, 1, 1,
0.4614332, 1.405658, 0.3634789, 0.01568628, 0, 1, 1,
0.4695273, -0.214514, 0.9094709, 0.01960784, 0, 1, 1,
0.4802237, 1.672693, -1.48079, 0.02745098, 0, 1, 1,
0.4838715, 0.2284919, 2.959492, 0.03137255, 0, 1, 1,
0.4840497, -0.5886175, 1.940907, 0.03921569, 0, 1, 1,
0.4854136, -1.520328, 1.64654, 0.04313726, 0, 1, 1,
0.4866283, 0.3781582, 0.1600388, 0.05098039, 0, 1, 1,
0.4871565, 0.6466688, 0.4592128, 0.05490196, 0, 1, 1,
0.4888003, 0.02156253, 1.555515, 0.0627451, 0, 1, 1,
0.4908054, -0.5469804, 3.001312, 0.06666667, 0, 1, 1,
0.4929526, 0.413521, 1.460076, 0.07450981, 0, 1, 1,
0.4940262, -0.2601966, 1.86746, 0.07843138, 0, 1, 1,
0.4976273, -0.8847501, 3.505104, 0.08627451, 0, 1, 1,
0.499, -1.780127, 1.688364, 0.09019608, 0, 1, 1,
0.5010073, 0.2117972, 0.4296941, 0.09803922, 0, 1, 1,
0.5096704, -0.4786167, 2.249065, 0.1058824, 0, 1, 1,
0.5139261, -0.1661034, 1.638434, 0.1098039, 0, 1, 1,
0.5171394, 0.6365101, 1.085714, 0.1176471, 0, 1, 1,
0.5202491, -0.112728, 3.466908, 0.1215686, 0, 1, 1,
0.5205289, -1.483478, 2.867248, 0.1294118, 0, 1, 1,
0.5252742, -1.243535, 4.027474, 0.1333333, 0, 1, 1,
0.5278673, -2.700432, 1.334334, 0.1411765, 0, 1, 1,
0.5304629, 0.1012916, -0.1641234, 0.145098, 0, 1, 1,
0.5311531, -0.3728656, 1.499328, 0.1529412, 0, 1, 1,
0.5313886, -3.389142, 3.316774, 0.1568628, 0, 1, 1,
0.5327212, 1.105986, -1.150172, 0.1647059, 0, 1, 1,
0.5348036, 0.95162, 1.310759, 0.1686275, 0, 1, 1,
0.5365983, -0.6793504, 1.920862, 0.1764706, 0, 1, 1,
0.5440689, -0.637035, 3.251623, 0.1803922, 0, 1, 1,
0.5443181, -0.3446333, 3.607557, 0.1882353, 0, 1, 1,
0.5477346, 3.046711, -1.547407, 0.1921569, 0, 1, 1,
0.5482698, -0.9375929, 1.040677, 0.2, 0, 1, 1,
0.5491952, -0.5697522, 2.161842, 0.2078431, 0, 1, 1,
0.5496061, -0.2789415, 1.924798, 0.2117647, 0, 1, 1,
0.5504047, 0.7626878, 1.261679, 0.2196078, 0, 1, 1,
0.5533263, -0.3741423, 2.521968, 0.2235294, 0, 1, 1,
0.5540454, -1.12968, 3.975912, 0.2313726, 0, 1, 1,
0.5563331, -1.599826, 2.748681, 0.2352941, 0, 1, 1,
0.5611872, -1.320538, 3.191798, 0.2431373, 0, 1, 1,
0.5658757, 1.455729, -0.7937984, 0.2470588, 0, 1, 1,
0.5755382, -1.449264, 1.605425, 0.254902, 0, 1, 1,
0.5820329, -0.7402683, 1.457825, 0.2588235, 0, 1, 1,
0.5825306, 0.1694898, 0.01208284, 0.2666667, 0, 1, 1,
0.5841008, -1.564364, 4.52498, 0.2705882, 0, 1, 1,
0.5857475, 1.203926, 0.1753241, 0.2784314, 0, 1, 1,
0.5889306, -0.5560167, 1.326361, 0.282353, 0, 1, 1,
0.5951648, 0.3616101, -0.494411, 0.2901961, 0, 1, 1,
0.6121404, 0.5620692, 1.343657, 0.2941177, 0, 1, 1,
0.6144379, -0.03639918, 1.657058, 0.3019608, 0, 1, 1,
0.6149774, 2.208111, 0.6501451, 0.3098039, 0, 1, 1,
0.6192248, 1.872513, 1.301148, 0.3137255, 0, 1, 1,
0.6192719, -0.6828297, 1.52154, 0.3215686, 0, 1, 1,
0.6197054, 0.9523694, 0.447235, 0.3254902, 0, 1, 1,
0.6314589, -1.34204, 3.978952, 0.3333333, 0, 1, 1,
0.6364755, -0.6614136, 2.914648, 0.3372549, 0, 1, 1,
0.6377929, 1.317066, 1.395875, 0.345098, 0, 1, 1,
0.6386296, -1.35546, 1.51532, 0.3490196, 0, 1, 1,
0.6395746, -1.125006, 1.899119, 0.3568628, 0, 1, 1,
0.6433816, -0.699211, 2.841614, 0.3607843, 0, 1, 1,
0.6488929, -1.571312, 2.607068, 0.3686275, 0, 1, 1,
0.6517749, 0.4131988, 1.032665, 0.372549, 0, 1, 1,
0.6537969, 1.115575, -0.3911957, 0.3803922, 0, 1, 1,
0.6561238, -0.9654653, 3.56365, 0.3843137, 0, 1, 1,
0.6578075, 0.2335688, 2.839465, 0.3921569, 0, 1, 1,
0.6592631, 0.2166505, 1.113361, 0.3960784, 0, 1, 1,
0.6596622, -0.03617613, 2.125275, 0.4039216, 0, 1, 1,
0.6672011, 0.4792399, 0.9550487, 0.4117647, 0, 1, 1,
0.6688147, -1.699878, 2.732959, 0.4156863, 0, 1, 1,
0.6709464, -0.2308427, 3.233504, 0.4235294, 0, 1, 1,
0.6763594, -1.490103, 2.270437, 0.427451, 0, 1, 1,
0.681805, 2.21053, 0.981315, 0.4352941, 0, 1, 1,
0.6872715, -0.1718516, 1.569709, 0.4392157, 0, 1, 1,
0.6937452, -0.5561008, 1.071467, 0.4470588, 0, 1, 1,
0.6962361, -1.037345, 3.484566, 0.4509804, 0, 1, 1,
0.697078, -1.425116, 2.132812, 0.4588235, 0, 1, 1,
0.6975096, 1.106857, 0.516363, 0.4627451, 0, 1, 1,
0.6984673, -0.02797945, 2.079697, 0.4705882, 0, 1, 1,
0.7090541, -0.8770785, 3.254614, 0.4745098, 0, 1, 1,
0.7098389, -0.5168987, 2.473039, 0.4823529, 0, 1, 1,
0.7100551, -0.2657247, 4.303542, 0.4862745, 0, 1, 1,
0.7116369, 1.555721, 1.562478, 0.4941176, 0, 1, 1,
0.7146535, 1.670785, -0.634634, 0.5019608, 0, 1, 1,
0.7170334, 1.797417, -0.4030156, 0.5058824, 0, 1, 1,
0.717939, -0.9133794, 0.528597, 0.5137255, 0, 1, 1,
0.7180445, 0.1834166, 2.040814, 0.5176471, 0, 1, 1,
0.7209734, 1.218053, -0.7031413, 0.5254902, 0, 1, 1,
0.7213891, -0.2178201, 1.233672, 0.5294118, 0, 1, 1,
0.7243593, 0.7330165, -0.1416804, 0.5372549, 0, 1, 1,
0.7267313, 1.314533, 1.51552, 0.5411765, 0, 1, 1,
0.7325449, -0.6319644, 3.343386, 0.5490196, 0, 1, 1,
0.7344489, -0.6177218, 2.898652, 0.5529412, 0, 1, 1,
0.7394513, 1.66813, 0.6224149, 0.5607843, 0, 1, 1,
0.7414654, -0.9586393, 2.760871, 0.5647059, 0, 1, 1,
0.7465532, 0.08624264, 0.2208982, 0.572549, 0, 1, 1,
0.7493305, -0.7341951, 1.989735, 0.5764706, 0, 1, 1,
0.7572338, -2.517971, 3.320131, 0.5843138, 0, 1, 1,
0.7648413, 2.359256, -0.5905693, 0.5882353, 0, 1, 1,
0.7742342, -1.36131, 1.720282, 0.5960785, 0, 1, 1,
0.7744929, 0.04419401, 0.8343466, 0.6039216, 0, 1, 1,
0.7751867, 0.1346541, 1.027034, 0.6078432, 0, 1, 1,
0.7768351, -0.6809438, 1.029004, 0.6156863, 0, 1, 1,
0.7783171, -0.3334807, 0.9793742, 0.6196079, 0, 1, 1,
0.7805949, 0.563711, 1.334374, 0.627451, 0, 1, 1,
0.783792, -1.474502, 0.9301444, 0.6313726, 0, 1, 1,
0.7846891, -0.01863723, 0.8718494, 0.6392157, 0, 1, 1,
0.7850851, -0.6350495, 2.301065, 0.6431373, 0, 1, 1,
0.7872738, -0.99239, 1.077506, 0.6509804, 0, 1, 1,
0.7878643, -0.7662189, 1.944058, 0.654902, 0, 1, 1,
0.7887219, 1.195959, -0.2635209, 0.6627451, 0, 1, 1,
0.7928357, 1.573755, 1.056428, 0.6666667, 0, 1, 1,
0.7942595, -2.046655, 3.398779, 0.6745098, 0, 1, 1,
0.7995707, -0.7820876, 1.158221, 0.6784314, 0, 1, 1,
0.8019565, 0.5242819, 2.367715, 0.6862745, 0, 1, 1,
0.8029356, -0.751742, 2.564195, 0.6901961, 0, 1, 1,
0.8047857, 1.071409, 0.5977854, 0.6980392, 0, 1, 1,
0.807771, -0.1557525, 1.988419, 0.7058824, 0, 1, 1,
0.8079415, -0.05658382, 0.6633559, 0.7098039, 0, 1, 1,
0.8085748, -0.341254, 2.167661, 0.7176471, 0, 1, 1,
0.8172366, 0.1564171, 2.241711, 0.7215686, 0, 1, 1,
0.8189167, 1.66132, 0.6288477, 0.7294118, 0, 1, 1,
0.825563, -0.28481, 2.933735, 0.7333333, 0, 1, 1,
0.8322843, -0.05319042, 2.505817, 0.7411765, 0, 1, 1,
0.8355027, 0.6760013, 0.5394036, 0.7450981, 0, 1, 1,
0.8391895, -1.014952, 3.146979, 0.7529412, 0, 1, 1,
0.8441319, -1.564796, 1.958119, 0.7568628, 0, 1, 1,
0.8455039, 0.7034705, 1.864824, 0.7647059, 0, 1, 1,
0.8474115, -1.013647, 1.778692, 0.7686275, 0, 1, 1,
0.8480443, 1.019817, 1.284782, 0.7764706, 0, 1, 1,
0.8502771, -0.209035, 3.101456, 0.7803922, 0, 1, 1,
0.8600797, -0.7028704, 0.9278634, 0.7882353, 0, 1, 1,
0.8671016, -0.6395295, 2.865262, 0.7921569, 0, 1, 1,
0.8717305, 2.918822, 1.209323, 0.8, 0, 1, 1,
0.8720514, 1.315691, 0.2210226, 0.8078431, 0, 1, 1,
0.8736554, -0.8842975, 3.543166, 0.8117647, 0, 1, 1,
0.8763629, 1.173426, 1.773399, 0.8196079, 0, 1, 1,
0.8768544, 1.008226, 0.428951, 0.8235294, 0, 1, 1,
0.8773732, 0.3628893, -0.05003615, 0.8313726, 0, 1, 1,
0.8814475, 0.744579, 1.195624, 0.8352941, 0, 1, 1,
0.8872742, -0.01717076, 3.079657, 0.8431373, 0, 1, 1,
0.88903, -1.207244, 2.701464, 0.8470588, 0, 1, 1,
0.8927172, -1.548782, 3.520361, 0.854902, 0, 1, 1,
0.9035611, 0.8450742, 0.2349308, 0.8588235, 0, 1, 1,
0.9073616, -0.7511091, 1.464911, 0.8666667, 0, 1, 1,
0.9176276, 0.5092466, 3.007856, 0.8705882, 0, 1, 1,
0.9218272, 0.8515674, 1.001427, 0.8784314, 0, 1, 1,
0.9259815, -0.1618128, 1.070642, 0.8823529, 0, 1, 1,
0.9327094, -0.1320654, 2.647373, 0.8901961, 0, 1, 1,
0.9387504, 0.4813046, -0.620492, 0.8941177, 0, 1, 1,
0.939518, 1.892339, 0.711889, 0.9019608, 0, 1, 1,
0.9398215, 1.064959, 0.5185307, 0.9098039, 0, 1, 1,
0.9422765, -1.056097, 2.16197, 0.9137255, 0, 1, 1,
0.9463412, -0.2776701, 2.196998, 0.9215686, 0, 1, 1,
0.946448, -1.179762, 1.600101, 0.9254902, 0, 1, 1,
0.9467155, 0.9293075, 1.009752, 0.9333333, 0, 1, 1,
0.9469309, -1.243426, 2.531108, 0.9372549, 0, 1, 1,
0.9505262, 2.267441, 1.109712, 0.945098, 0, 1, 1,
0.9566563, -0.5145572, 1.110625, 0.9490196, 0, 1, 1,
0.9591739, 0.5714763, 1.254365, 0.9568627, 0, 1, 1,
0.9615346, 0.5933704, 0.585337, 0.9607843, 0, 1, 1,
0.9704358, 1.088514, 0.8486589, 0.9686275, 0, 1, 1,
0.9751656, -0.09305255, 0.6139776, 0.972549, 0, 1, 1,
0.9847687, -0.1285661, -0.2479501, 0.9803922, 0, 1, 1,
0.9938509, -0.3835675, 0.02235851, 0.9843137, 0, 1, 1,
1.004933, 0.8772337, 1.61028, 0.9921569, 0, 1, 1,
1.005036, -2.89221, 2.970071, 0.9960784, 0, 1, 1,
1.005095, -1.110549, 3.895346, 1, 0, 0.9960784, 1,
1.011902, 1.661976, 0.3341052, 1, 0, 0.9882353, 1,
1.012248, -1.342734, 3.641079, 1, 0, 0.9843137, 1,
1.015818, -1.54677, 1.643774, 1, 0, 0.9764706, 1,
1.019642, 0.7095816, 1.789958, 1, 0, 0.972549, 1,
1.020028, 0.8084397, 0.8228629, 1, 0, 0.9647059, 1,
1.03433, 2.290654, 0.7229764, 1, 0, 0.9607843, 1,
1.034845, -1.055703, 2.771222, 1, 0, 0.9529412, 1,
1.035226, 0.5003878, 0.98559, 1, 0, 0.9490196, 1,
1.040607, -0.1044088, -0.9408523, 1, 0, 0.9411765, 1,
1.041518, 1.125887, 2.1725, 1, 0, 0.9372549, 1,
1.057519, -1.215191, 2.843015, 1, 0, 0.9294118, 1,
1.059729, -0.5170537, 2.410153, 1, 0, 0.9254902, 1,
1.059997, -1.485875, 3.434204, 1, 0, 0.9176471, 1,
1.069668, 1.379048, 0.6609776, 1, 0, 0.9137255, 1,
1.074668, -0.6732852, 2.43357, 1, 0, 0.9058824, 1,
1.075694, 0.5411376, 0.7967896, 1, 0, 0.9019608, 1,
1.076339, 0.9421504, 1.149217, 1, 0, 0.8941177, 1,
1.081707, -0.3535905, 3.737828, 1, 0, 0.8862745, 1,
1.082355, -0.5429127, 1.681622, 1, 0, 0.8823529, 1,
1.087502, 0.6537746, -0.02936985, 1, 0, 0.8745098, 1,
1.094729, 0.2090041, 0.4108342, 1, 0, 0.8705882, 1,
1.095754, -3.171886, 2.801614, 1, 0, 0.8627451, 1,
1.09868, 1.06065, 1.455548, 1, 0, 0.8588235, 1,
1.098734, 0.1598871, 0.0001975085, 1, 0, 0.8509804, 1,
1.108676, -0.5580752, 2.56563, 1, 0, 0.8470588, 1,
1.116924, -1.802348, 2.824989, 1, 0, 0.8392157, 1,
1.120007, 0.09960995, -0.5981011, 1, 0, 0.8352941, 1,
1.128786, -1.061618, 3.381452, 1, 0, 0.827451, 1,
1.134781, -0.03667982, 3.18714, 1, 0, 0.8235294, 1,
1.143552, 0.7076154, 1.150136, 1, 0, 0.8156863, 1,
1.145677, 0.0560799, 2.113841, 1, 0, 0.8117647, 1,
1.149348, 1.128291, 1.027706, 1, 0, 0.8039216, 1,
1.156119, -1.79696, 3.110243, 1, 0, 0.7960784, 1,
1.159424, -0.1252079, 0.5038202, 1, 0, 0.7921569, 1,
1.173102, -0.5088376, 2.606731, 1, 0, 0.7843137, 1,
1.180228, 0.6566827, 2.347238, 1, 0, 0.7803922, 1,
1.184728, 0.1418621, 3.020648, 1, 0, 0.772549, 1,
1.186175, -0.7481198, 1.661601, 1, 0, 0.7686275, 1,
1.193186, -0.05710598, 0.898558, 1, 0, 0.7607843, 1,
1.19408, -0.01924588, 2.812443, 1, 0, 0.7568628, 1,
1.201949, -1.779168, 3.929244, 1, 0, 0.7490196, 1,
1.203901, -0.9655972, -0.5114064, 1, 0, 0.7450981, 1,
1.208022, -1.656788, 2.016618, 1, 0, 0.7372549, 1,
1.21655, -0.3753018, 0.2182908, 1, 0, 0.7333333, 1,
1.231017, 0.3387061, 2.113896, 1, 0, 0.7254902, 1,
1.232765, 0.7158412, 0.3272829, 1, 0, 0.7215686, 1,
1.232835, 0.4689403, -0.841174, 1, 0, 0.7137255, 1,
1.235575, -2.209864, 4.619458, 1, 0, 0.7098039, 1,
1.238679, 1.813275, 1.018464, 1, 0, 0.7019608, 1,
1.248591, 0.8935329, 1.155302, 1, 0, 0.6941177, 1,
1.253418, 0.7198533, 1.841718, 1, 0, 0.6901961, 1,
1.257156, -0.1062429, 2.303065, 1, 0, 0.682353, 1,
1.267527, 0.918527, 1.409405, 1, 0, 0.6784314, 1,
1.268958, -2.871021, 2.063391, 1, 0, 0.6705883, 1,
1.274719, 0.6376269, 0.08849679, 1, 0, 0.6666667, 1,
1.276343, 0.3411505, 1.483393, 1, 0, 0.6588235, 1,
1.278379, -0.2357775, 0.9829457, 1, 0, 0.654902, 1,
1.30242, 1.209944, 0.2539994, 1, 0, 0.6470588, 1,
1.310885, -0.3928424, 3.339575, 1, 0, 0.6431373, 1,
1.312926, -1.486163, 1.17628, 1, 0, 0.6352941, 1,
1.320312, 0.392399, 2.348346, 1, 0, 0.6313726, 1,
1.328187, -1.062647, 1.418683, 1, 0, 0.6235294, 1,
1.343765, -0.9451312, 3.410188, 1, 0, 0.6196079, 1,
1.350957, 0.4915082, 1.653408, 1, 0, 0.6117647, 1,
1.357907, 0.2951086, 0.2227413, 1, 0, 0.6078432, 1,
1.35905, 1.246962, 2.485641, 1, 0, 0.6, 1,
1.368567, -2.013663, 4.055482, 1, 0, 0.5921569, 1,
1.368968, 0.2908304, 0.4973953, 1, 0, 0.5882353, 1,
1.372757, 0.7912531, 1.864028, 1, 0, 0.5803922, 1,
1.375122, 1.100767, 1.827767, 1, 0, 0.5764706, 1,
1.375543, 0.8909354, 0.7301882, 1, 0, 0.5686275, 1,
1.376652, -0.5567688, 3.16135, 1, 0, 0.5647059, 1,
1.380369, -1.441244, 2.911094, 1, 0, 0.5568628, 1,
1.388557, 0.7496162, 1.218729, 1, 0, 0.5529412, 1,
1.396012, 0.2820636, 0.7222585, 1, 0, 0.5450981, 1,
1.402234, -0.9703848, 3.822025, 1, 0, 0.5411765, 1,
1.402551, -0.5586627, 2.447571, 1, 0, 0.5333334, 1,
1.408023, -0.006577273, 1.175496, 1, 0, 0.5294118, 1,
1.412504, 0.03528345, 0.2391042, 1, 0, 0.5215687, 1,
1.415204, -0.7073817, 1.715135, 1, 0, 0.5176471, 1,
1.418254, -0.7347656, 1.768783, 1, 0, 0.509804, 1,
1.420921, -0.9257354, 1.381273, 1, 0, 0.5058824, 1,
1.437759, -0.9450895, 4.220828, 1, 0, 0.4980392, 1,
1.450925, -1.4911, 3.835387, 1, 0, 0.4901961, 1,
1.452747, 2.342681, -0.05481991, 1, 0, 0.4862745, 1,
1.453711, 1.057525, -0.01310251, 1, 0, 0.4784314, 1,
1.456241, 0.2711317, 0.3360197, 1, 0, 0.4745098, 1,
1.48291, -1.737943, 2.776819, 1, 0, 0.4666667, 1,
1.486975, -0.3270257, 0.1173311, 1, 0, 0.4627451, 1,
1.493075, -0.9420804, 0.6504773, 1, 0, 0.454902, 1,
1.494681, 0.2052662, 2.290651, 1, 0, 0.4509804, 1,
1.506737, -1.665204, 3.83355, 1, 0, 0.4431373, 1,
1.50881, 1.703356, -1.046691, 1, 0, 0.4392157, 1,
1.530347, -0.4897648, 1.517176, 1, 0, 0.4313726, 1,
1.533915, -1.397054, 3.364035, 1, 0, 0.427451, 1,
1.534769, -0.7376319, 2.520154, 1, 0, 0.4196078, 1,
1.548944, -1.187959, 3.335053, 1, 0, 0.4156863, 1,
1.549142, 1.625809, 2.430422, 1, 0, 0.4078431, 1,
1.554247, -0.09173727, 1.703915, 1, 0, 0.4039216, 1,
1.57108, 1.192131, 2.043331, 1, 0, 0.3960784, 1,
1.582678, 0.07688655, 1.090552, 1, 0, 0.3882353, 1,
1.586482, 0.9931454, 0.7938288, 1, 0, 0.3843137, 1,
1.597113, -1.38993, 1.894943, 1, 0, 0.3764706, 1,
1.602142, 2.391191, 0.7770697, 1, 0, 0.372549, 1,
1.619065, -2.097181, 3.719252, 1, 0, 0.3647059, 1,
1.64094, -0.7328355, 1.655679, 1, 0, 0.3607843, 1,
1.642421, -0.2614572, 1.387208, 1, 0, 0.3529412, 1,
1.644416, -0.3071735, 1.116615, 1, 0, 0.3490196, 1,
1.651402, 2.747593, 0.0808719, 1, 0, 0.3411765, 1,
1.661104, -0.7843899, 2.406958, 1, 0, 0.3372549, 1,
1.673672, 3.01031, 0.8738697, 1, 0, 0.3294118, 1,
1.683591, -1.056291, 1.703175, 1, 0, 0.3254902, 1,
1.691111, -0.2491833, 2.36011, 1, 0, 0.3176471, 1,
1.70873, 0.6326606, 0.5341452, 1, 0, 0.3137255, 1,
1.715092, 1.028874, 1.218723, 1, 0, 0.3058824, 1,
1.733954, -0.05517495, 2.669982, 1, 0, 0.2980392, 1,
1.743575, 0.4447372, 1.306843, 1, 0, 0.2941177, 1,
1.744756, 0.9347493, 1.568634, 1, 0, 0.2862745, 1,
1.76281, -0.6311781, 1.605909, 1, 0, 0.282353, 1,
1.765358, -0.9213988, 3.037031, 1, 0, 0.2745098, 1,
1.776118, 0.7843553, 0.7112967, 1, 0, 0.2705882, 1,
1.778489, 0.4467228, 1.702733, 1, 0, 0.2627451, 1,
1.7857, -1.210386, 2.313844, 1, 0, 0.2588235, 1,
1.787437, -0.09180559, 0.7513908, 1, 0, 0.2509804, 1,
1.803812, -0.8533294, 2.543415, 1, 0, 0.2470588, 1,
1.808377, 0.8082919, 1.05544, 1, 0, 0.2392157, 1,
1.836331, 1.63172, 0.7936792, 1, 0, 0.2352941, 1,
1.840304, -0.5865257, 1.109983, 1, 0, 0.227451, 1,
1.846745, -0.7853456, -0.4227944, 1, 0, 0.2235294, 1,
1.855804, -0.07156121, 1.989822, 1, 0, 0.2156863, 1,
1.875828, 1.891289, 0.3865055, 1, 0, 0.2117647, 1,
1.876183, 0.4474902, 0.6896969, 1, 0, 0.2039216, 1,
1.894429, 0.4761921, 0.8292893, 1, 0, 0.1960784, 1,
1.925369, -0.6645456, 0.8010507, 1, 0, 0.1921569, 1,
1.948953, 1.724793, 2.042068, 1, 0, 0.1843137, 1,
1.97356, 1.097699, -1.168308, 1, 0, 0.1803922, 1,
1.976781, -1.18061, 0.1709124, 1, 0, 0.172549, 1,
1.984028, 0.874022, 0.7194433, 1, 0, 0.1686275, 1,
1.995994, -0.7309349, 1.887533, 1, 0, 0.1607843, 1,
2.011225, 0.3160228, 2.456379, 1, 0, 0.1568628, 1,
2.042868, -1.282903, 2.40229, 1, 0, 0.1490196, 1,
2.058047, -0.3701975, 2.290249, 1, 0, 0.145098, 1,
2.069834, -2.319045, 0.857675, 1, 0, 0.1372549, 1,
2.072538, 0.9243683, 1.845663, 1, 0, 0.1333333, 1,
2.104006, 0.906557, 1.449245, 1, 0, 0.1254902, 1,
2.109531, -0.7707217, 2.383261, 1, 0, 0.1215686, 1,
2.111478, -0.8939654, 1.709954, 1, 0, 0.1137255, 1,
2.1168, 0.3526774, 0.4993374, 1, 0, 0.1098039, 1,
2.167108, 0.05924984, 2.474617, 1, 0, 0.1019608, 1,
2.221312, 1.748276, 0.5314437, 1, 0, 0.09411765, 1,
2.229892, -1.045671, 2.284558, 1, 0, 0.09019608, 1,
2.275126, -1.211974, 2.584882, 1, 0, 0.08235294, 1,
2.283513, 0.8120214, 1.806527, 1, 0, 0.07843138, 1,
2.311347, 0.253843, 1.553744, 1, 0, 0.07058824, 1,
2.353365, -0.1816902, 0.6707228, 1, 0, 0.06666667, 1,
2.355387, 1.513974, 0.2725256, 1, 0, 0.05882353, 1,
2.397094, -0.3635259, 0.7857955, 1, 0, 0.05490196, 1,
2.414907, -0.553192, 2.370585, 1, 0, 0.04705882, 1,
2.416984, 0.244063, 1.263693, 1, 0, 0.04313726, 1,
2.489337, -0.9811919, 1.400893, 1, 0, 0.03529412, 1,
2.512976, 0.2697528, 0.7247835, 1, 0, 0.03137255, 1,
2.537048, 0.6683708, 0.556141, 1, 0, 0.02352941, 1,
2.547311, -1.737117, 1.745168, 1, 0, 0.01960784, 1,
3.004364, 0.6264581, 0.1562864, 1, 0, 0.01176471, 1,
3.092214, -1.177273, 2.801904, 1, 0, 0.007843138, 1
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
-0.2335393, -4.49555, -7.281823, 0, -0.5, 0.5, 0.5,
-0.2335393, -4.49555, -7.281823, 1, -0.5, 0.5, 0.5,
-0.2335393, -4.49555, -7.281823, 1, 1.5, 0.5, 0.5,
-0.2335393, -4.49555, -7.281823, 0, 1.5, 0.5, 0.5
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
-4.686723, -0.1254033, -7.281823, 0, -0.5, 0.5, 0.5,
-4.686723, -0.1254033, -7.281823, 1, -0.5, 0.5, 0.5,
-4.686723, -0.1254033, -7.281823, 1, 1.5, 0.5, 0.5,
-4.686723, -0.1254033, -7.281823, 0, 1.5, 0.5, 0.5
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
-4.686723, -4.49555, -0.2059369, 0, -0.5, 0.5, 0.5,
-4.686723, -4.49555, -0.2059369, 1, -0.5, 0.5, 0.5,
-4.686723, -4.49555, -0.2059369, 1, 1.5, 0.5, 0.5,
-4.686723, -4.49555, -0.2059369, 0, 1.5, 0.5, 0.5
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
-3, -3.487054, -5.648926,
3, -3.487054, -5.648926,
-3, -3.487054, -5.648926,
-3, -3.655137, -5.921076,
-2, -3.487054, -5.648926,
-2, -3.655137, -5.921076,
-1, -3.487054, -5.648926,
-1, -3.655137, -5.921076,
0, -3.487054, -5.648926,
0, -3.655137, -5.921076,
1, -3.487054, -5.648926,
1, -3.655137, -5.921076,
2, -3.487054, -5.648926,
2, -3.655137, -5.921076,
3, -3.487054, -5.648926,
3, -3.655137, -5.921076
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
-3, -3.991302, -6.465375, 0, -0.5, 0.5, 0.5,
-3, -3.991302, -6.465375, 1, -0.5, 0.5, 0.5,
-3, -3.991302, -6.465375, 1, 1.5, 0.5, 0.5,
-3, -3.991302, -6.465375, 0, 1.5, 0.5, 0.5,
-2, -3.991302, -6.465375, 0, -0.5, 0.5, 0.5,
-2, -3.991302, -6.465375, 1, -0.5, 0.5, 0.5,
-2, -3.991302, -6.465375, 1, 1.5, 0.5, 0.5,
-2, -3.991302, -6.465375, 0, 1.5, 0.5, 0.5,
-1, -3.991302, -6.465375, 0, -0.5, 0.5, 0.5,
-1, -3.991302, -6.465375, 1, -0.5, 0.5, 0.5,
-1, -3.991302, -6.465375, 1, 1.5, 0.5, 0.5,
-1, -3.991302, -6.465375, 0, 1.5, 0.5, 0.5,
0, -3.991302, -6.465375, 0, -0.5, 0.5, 0.5,
0, -3.991302, -6.465375, 1, -0.5, 0.5, 0.5,
0, -3.991302, -6.465375, 1, 1.5, 0.5, 0.5,
0, -3.991302, -6.465375, 0, 1.5, 0.5, 0.5,
1, -3.991302, -6.465375, 0, -0.5, 0.5, 0.5,
1, -3.991302, -6.465375, 1, -0.5, 0.5, 0.5,
1, -3.991302, -6.465375, 1, 1.5, 0.5, 0.5,
1, -3.991302, -6.465375, 0, 1.5, 0.5, 0.5,
2, -3.991302, -6.465375, 0, -0.5, 0.5, 0.5,
2, -3.991302, -6.465375, 1, -0.5, 0.5, 0.5,
2, -3.991302, -6.465375, 1, 1.5, 0.5, 0.5,
2, -3.991302, -6.465375, 0, 1.5, 0.5, 0.5,
3, -3.991302, -6.465375, 0, -0.5, 0.5, 0.5,
3, -3.991302, -6.465375, 1, -0.5, 0.5, 0.5,
3, -3.991302, -6.465375, 1, 1.5, 0.5, 0.5,
3, -3.991302, -6.465375, 0, 1.5, 0.5, 0.5
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
-3.659065, -3, -5.648926,
-3.659065, 3, -5.648926,
-3.659065, -3, -5.648926,
-3.830342, -3, -5.921076,
-3.659065, -2, -5.648926,
-3.830342, -2, -5.921076,
-3.659065, -1, -5.648926,
-3.830342, -1, -5.921076,
-3.659065, 0, -5.648926,
-3.830342, 0, -5.921076,
-3.659065, 1, -5.648926,
-3.830342, 1, -5.921076,
-3.659065, 2, -5.648926,
-3.830342, 2, -5.921076,
-3.659065, 3, -5.648926,
-3.830342, 3, -5.921076
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
-4.172894, -3, -6.465375, 0, -0.5, 0.5, 0.5,
-4.172894, -3, -6.465375, 1, -0.5, 0.5, 0.5,
-4.172894, -3, -6.465375, 1, 1.5, 0.5, 0.5,
-4.172894, -3, -6.465375, 0, 1.5, 0.5, 0.5,
-4.172894, -2, -6.465375, 0, -0.5, 0.5, 0.5,
-4.172894, -2, -6.465375, 1, -0.5, 0.5, 0.5,
-4.172894, -2, -6.465375, 1, 1.5, 0.5, 0.5,
-4.172894, -2, -6.465375, 0, 1.5, 0.5, 0.5,
-4.172894, -1, -6.465375, 0, -0.5, 0.5, 0.5,
-4.172894, -1, -6.465375, 1, -0.5, 0.5, 0.5,
-4.172894, -1, -6.465375, 1, 1.5, 0.5, 0.5,
-4.172894, -1, -6.465375, 0, 1.5, 0.5, 0.5,
-4.172894, 0, -6.465375, 0, -0.5, 0.5, 0.5,
-4.172894, 0, -6.465375, 1, -0.5, 0.5, 0.5,
-4.172894, 0, -6.465375, 1, 1.5, 0.5, 0.5,
-4.172894, 0, -6.465375, 0, 1.5, 0.5, 0.5,
-4.172894, 1, -6.465375, 0, -0.5, 0.5, 0.5,
-4.172894, 1, -6.465375, 1, -0.5, 0.5, 0.5,
-4.172894, 1, -6.465375, 1, 1.5, 0.5, 0.5,
-4.172894, 1, -6.465375, 0, 1.5, 0.5, 0.5,
-4.172894, 2, -6.465375, 0, -0.5, 0.5, 0.5,
-4.172894, 2, -6.465375, 1, -0.5, 0.5, 0.5,
-4.172894, 2, -6.465375, 1, 1.5, 0.5, 0.5,
-4.172894, 2, -6.465375, 0, 1.5, 0.5, 0.5,
-4.172894, 3, -6.465375, 0, -0.5, 0.5, 0.5,
-4.172894, 3, -6.465375, 1, -0.5, 0.5, 0.5,
-4.172894, 3, -6.465375, 1, 1.5, 0.5, 0.5,
-4.172894, 3, -6.465375, 0, 1.5, 0.5, 0.5
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
-3.659065, -3.487054, -4,
-3.659065, -3.487054, 4,
-3.659065, -3.487054, -4,
-3.830342, -3.655137, -4,
-3.659065, -3.487054, -2,
-3.830342, -3.655137, -2,
-3.659065, -3.487054, 0,
-3.830342, -3.655137, 0,
-3.659065, -3.487054, 2,
-3.830342, -3.655137, 2,
-3.659065, -3.487054, 4,
-3.830342, -3.655137, 4
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
-4.172894, -3.991302, -4, 0, -0.5, 0.5, 0.5,
-4.172894, -3.991302, -4, 1, -0.5, 0.5, 0.5,
-4.172894, -3.991302, -4, 1, 1.5, 0.5, 0.5,
-4.172894, -3.991302, -4, 0, 1.5, 0.5, 0.5,
-4.172894, -3.991302, -2, 0, -0.5, 0.5, 0.5,
-4.172894, -3.991302, -2, 1, -0.5, 0.5, 0.5,
-4.172894, -3.991302, -2, 1, 1.5, 0.5, 0.5,
-4.172894, -3.991302, -2, 0, 1.5, 0.5, 0.5,
-4.172894, -3.991302, 0, 0, -0.5, 0.5, 0.5,
-4.172894, -3.991302, 0, 1, -0.5, 0.5, 0.5,
-4.172894, -3.991302, 0, 1, 1.5, 0.5, 0.5,
-4.172894, -3.991302, 0, 0, 1.5, 0.5, 0.5,
-4.172894, -3.991302, 2, 0, -0.5, 0.5, 0.5,
-4.172894, -3.991302, 2, 1, -0.5, 0.5, 0.5,
-4.172894, -3.991302, 2, 1, 1.5, 0.5, 0.5,
-4.172894, -3.991302, 2, 0, 1.5, 0.5, 0.5,
-4.172894, -3.991302, 4, 0, -0.5, 0.5, 0.5,
-4.172894, -3.991302, 4, 1, -0.5, 0.5, 0.5,
-4.172894, -3.991302, 4, 1, 1.5, 0.5, 0.5,
-4.172894, -3.991302, 4, 0, 1.5, 0.5, 0.5
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
-3.659065, -3.487054, -5.648926,
-3.659065, 3.236248, -5.648926,
-3.659065, -3.487054, 5.237052,
-3.659065, 3.236248, 5.237052,
-3.659065, -3.487054, -5.648926,
-3.659065, -3.487054, 5.237052,
-3.659065, 3.236248, -5.648926,
-3.659065, 3.236248, 5.237052,
-3.659065, -3.487054, -5.648926,
3.191987, -3.487054, -5.648926,
-3.659065, -3.487054, 5.237052,
3.191987, -3.487054, 5.237052,
-3.659065, 3.236248, -5.648926,
3.191987, 3.236248, -5.648926,
-3.659065, 3.236248, 5.237052,
3.191987, 3.236248, 5.237052,
3.191987, -3.487054, -5.648926,
3.191987, 3.236248, -5.648926,
3.191987, -3.487054, 5.237052,
3.191987, 3.236248, 5.237052,
3.191987, -3.487054, -5.648926,
3.191987, -3.487054, 5.237052,
3.191987, 3.236248, -5.648926,
3.191987, 3.236248, 5.237052
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
var radius = 7.749974;
var distance = 34.48051;
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
mvMatrix.translate( 0.2335393, 0.1254033, 0.2059369 );
mvMatrix.scale( 1.223086, 1.246326, 0.7697446 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.48051);
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
Trichlorfon<-read.table("Trichlorfon.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Trichlorfon$V2
```

```
## Error in eval(expr, envir, enclos): object 'Trichlorfon' not found
```

```r
y<-Trichlorfon$V3
```

```
## Error in eval(expr, envir, enclos): object 'Trichlorfon' not found
```

```r
z<-Trichlorfon$V4
```

```
## Error in eval(expr, envir, enclos): object 'Trichlorfon' not found
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
-3.559293, -0.2444664, -1.547532, 0, 0, 1, 1, 1,
-3.179336, -0.5226731, -0.3564791, 1, 0, 0, 1, 1,
-3.093643, 1.301602, -0.9585173, 1, 0, 0, 1, 1,
-3.071067, -0.2314718, -1.210655, 1, 0, 0, 1, 1,
-2.860487, -0.8480396, -2.522996, 1, 0, 0, 1, 1,
-2.836628, 0.7480176, -3.935699, 1, 0, 0, 1, 1,
-2.703863, 1.474032, -1.10726, 0, 0, 0, 1, 1,
-2.649061, -0.5681635, -1.236476, 0, 0, 0, 1, 1,
-2.534261, 1.374182, -3.030803, 0, 0, 0, 1, 1,
-2.453108, 1.383413, -1.9217, 0, 0, 0, 1, 1,
-2.383351, -0.547751, -2.710269, 0, 0, 0, 1, 1,
-2.366374, -0.6441423, -1.639238, 0, 0, 0, 1, 1,
-2.2772, 1.089677, -1.944016, 0, 0, 0, 1, 1,
-2.243435, -1.498817, -3.141209, 1, 1, 1, 1, 1,
-2.243151, 0.3982756, -1.936947, 1, 1, 1, 1, 1,
-2.181477, -0.3079418, -1.900778, 1, 1, 1, 1, 1,
-2.171711, -0.3326773, -2.378712, 1, 1, 1, 1, 1,
-2.147487, 0.7839308, -0.01340872, 1, 1, 1, 1, 1,
-2.142758, 0.5631351, -2.62353, 1, 1, 1, 1, 1,
-2.117179, -0.5332987, -1.24388, 1, 1, 1, 1, 1,
-2.086695, 1.003539, -0.1405542, 1, 1, 1, 1, 1,
-2.083531, -1.277667, -1.437977, 1, 1, 1, 1, 1,
-2.076197, -1.095968, -3.113853, 1, 1, 1, 1, 1,
-2.068823, 0.7697294, -1.994133, 1, 1, 1, 1, 1,
-2.02925, 0.7010282, 0.6229308, 1, 1, 1, 1, 1,
-2.0225, 0.3857774, -2.529758, 1, 1, 1, 1, 1,
-2.008295, 1.044344, -1.513764, 1, 1, 1, 1, 1,
-1.965764, 1.520763, -2.198627, 1, 1, 1, 1, 1,
-1.899088, -1.345517, -4.696359, 0, 0, 1, 1, 1,
-1.865497, -0.9860249, -4.017462, 1, 0, 0, 1, 1,
-1.861968, -0.2255229, -1.087726, 1, 0, 0, 1, 1,
-1.843622, 0.914224, -0.7106727, 1, 0, 0, 1, 1,
-1.830949, -1.601767, -3.65171, 1, 0, 0, 1, 1,
-1.828398, -1.853379, -2.123146, 1, 0, 0, 1, 1,
-1.824634, -1.728445, -2.204309, 0, 0, 0, 1, 1,
-1.777755, 0.7767231, -2.220658, 0, 0, 0, 1, 1,
-1.771868, 0.01371124, -1.262807, 0, 0, 0, 1, 1,
-1.771329, 1.307221, -0.5866204, 0, 0, 0, 1, 1,
-1.747984, -0.03145455, -1.783737, 0, 0, 0, 1, 1,
-1.693757, -0.2870779, 0.4161848, 0, 0, 0, 1, 1,
-1.679189, 1.011439, -0.8982497, 0, 0, 0, 1, 1,
-1.676243, -0.2827966, -2.666662, 1, 1, 1, 1, 1,
-1.659489, -0.5733054, -1.087689, 1, 1, 1, 1, 1,
-1.654824, 0.4315259, -2.340282, 1, 1, 1, 1, 1,
-1.642498, 0.779834, -1.97545, 1, 1, 1, 1, 1,
-1.638272, 1.054893, -0.7920866, 1, 1, 1, 1, 1,
-1.636229, 0.2667949, -1.503453, 1, 1, 1, 1, 1,
-1.634834, -1.371051, -1.068065, 1, 1, 1, 1, 1,
-1.63136, 1.255125, -0.767838, 1, 1, 1, 1, 1,
-1.626237, -0.2460393, -3.31893, 1, 1, 1, 1, 1,
-1.612715, 0.9190646, -1.61265, 1, 1, 1, 1, 1,
-1.608914, 0.3796896, -1.38939, 1, 1, 1, 1, 1,
-1.60403, 0.8641687, -1.036557, 1, 1, 1, 1, 1,
-1.575055, 1.560219, -0.6365224, 1, 1, 1, 1, 1,
-1.558907, 0.6263884, -0.9966315, 1, 1, 1, 1, 1,
-1.55459, 0.3741428, -2.643567, 1, 1, 1, 1, 1,
-1.518959, -1.295334, -2.988488, 0, 0, 1, 1, 1,
-1.503702, -0.2009387, -0.7804524, 1, 0, 0, 1, 1,
-1.482632, 0.1271339, -0.432589, 1, 0, 0, 1, 1,
-1.481459, -1.549817, -1.743298, 1, 0, 0, 1, 1,
-1.480148, 0.1290602, -3.123984, 1, 0, 0, 1, 1,
-1.47178, 0.4352762, -3.029793, 1, 0, 0, 1, 1,
-1.46881, 1.0379, -1.498328, 0, 0, 0, 1, 1,
-1.466665, 0.8987924, -1.641053, 0, 0, 0, 1, 1,
-1.464718, -1.552412, -2.637572, 0, 0, 0, 1, 1,
-1.457418, 0.8393837, -0.736579, 0, 0, 0, 1, 1,
-1.455142, -0.5964661, -4.224273, 0, 0, 0, 1, 1,
-1.452689, -0.4011323, -1.55891, 0, 0, 0, 1, 1,
-1.451951, 1.101358, -1.519795, 0, 0, 0, 1, 1,
-1.451299, 1.441356, -1.534602, 1, 1, 1, 1, 1,
-1.446037, 0.8903173, -0.4571052, 1, 1, 1, 1, 1,
-1.445086, 0.7770075, -2.086873, 1, 1, 1, 1, 1,
-1.441507, 0.3165076, -1.09591, 1, 1, 1, 1, 1,
-1.43985, -1.755477, -1.010133, 1, 1, 1, 1, 1,
-1.424743, -1.608084, -1.833987, 1, 1, 1, 1, 1,
-1.410399, 0.9666662, -2.879635, 1, 1, 1, 1, 1,
-1.404788, 1.20316, -2.066188, 1, 1, 1, 1, 1,
-1.401424, 2.688322, -1.744923, 1, 1, 1, 1, 1,
-1.391063, -1.781889, -2.954615, 1, 1, 1, 1, 1,
-1.388518, -0.6404214, -3.098219, 1, 1, 1, 1, 1,
-1.381791, 1.432292, -0.524889, 1, 1, 1, 1, 1,
-1.375711, 2.362941, -0.9012304, 1, 1, 1, 1, 1,
-1.374061, -0.9832997, -1.529398, 1, 1, 1, 1, 1,
-1.373086, -0.01309702, -1.917792, 1, 1, 1, 1, 1,
-1.357475, 0.08013997, -3.14363, 0, 0, 1, 1, 1,
-1.350492, -1.75258, -3.853061, 1, 0, 0, 1, 1,
-1.338518, 0.08181535, -0.8359078, 1, 0, 0, 1, 1,
-1.336842, 0.4588493, -0.739631, 1, 0, 0, 1, 1,
-1.332893, -1.625532, -2.856198, 1, 0, 0, 1, 1,
-1.318377, 0.5029563, -0.9747885, 1, 0, 0, 1, 1,
-1.312371, -0.4282471, -2.376716, 0, 0, 0, 1, 1,
-1.306735, 1.390107, -1.551053, 0, 0, 0, 1, 1,
-1.29976, 0.8451695, 0.2618871, 0, 0, 0, 1, 1,
-1.278787, 2.442479, -0.04892411, 0, 0, 0, 1, 1,
-1.275352, -0.7242407, -3.354085, 0, 0, 0, 1, 1,
-1.266403, 0.2949899, -1.266116, 0, 0, 0, 1, 1,
-1.255567, -0.6373154, -1.52569, 0, 0, 0, 1, 1,
-1.250268, -1.130156, -2.775394, 1, 1, 1, 1, 1,
-1.241783, -0.0009132603, 0.3251346, 1, 1, 1, 1, 1,
-1.241777, 1.07759, 0.5250515, 1, 1, 1, 1, 1,
-1.239383, -0.3778268, -1.821607, 1, 1, 1, 1, 1,
-1.232276, 1.351883, 0.7793424, 1, 1, 1, 1, 1,
-1.227186, -0.2982025, -0.842792, 1, 1, 1, 1, 1,
-1.216691, -1.624741, -1.080686, 1, 1, 1, 1, 1,
-1.216457, 1.128258, -1.436845, 1, 1, 1, 1, 1,
-1.208912, -0.09538114, -2.245226, 1, 1, 1, 1, 1,
-1.205647, 0.9434768, -0.3724441, 1, 1, 1, 1, 1,
-1.203419, -0.899848, -1.86335, 1, 1, 1, 1, 1,
-1.199313, -0.7165048, -2.440242, 1, 1, 1, 1, 1,
-1.198835, 0.3577691, -3.27743, 1, 1, 1, 1, 1,
-1.194982, -2.429358, -3.505342, 1, 1, 1, 1, 1,
-1.194823, -0.6266221, -1.59386, 1, 1, 1, 1, 1,
-1.188313, -0.1536857, -0.9647912, 0, 0, 1, 1, 1,
-1.18631, -0.8561572, -1.787858, 1, 0, 0, 1, 1,
-1.182132, -0.0232974, -1.773244, 1, 0, 0, 1, 1,
-1.180365, -1.267543, -1.645788, 1, 0, 0, 1, 1,
-1.17268, 1.812847, -0.8109292, 1, 0, 0, 1, 1,
-1.163525, -0.9395753, -2.510816, 1, 0, 0, 1, 1,
-1.163302, -1.075597, -3.91681, 0, 0, 0, 1, 1,
-1.162955, -0.1013797, -1.214348, 0, 0, 0, 1, 1,
-1.157547, 0.1963227, -0.5731904, 0, 0, 0, 1, 1,
-1.156637, -1.132768, -2.13505, 0, 0, 0, 1, 1,
-1.153055, 0.9888158, -0.8439965, 0, 0, 0, 1, 1,
-1.150256, -0.4944085, -3.812883, 0, 0, 0, 1, 1,
-1.140375, -0.4215927, -0.6686772, 0, 0, 0, 1, 1,
-1.140368, -0.7951638, -1.666487, 1, 1, 1, 1, 1,
-1.140243, -1.36856, -3.057097, 1, 1, 1, 1, 1,
-1.134992, 0.2666341, 0.3646128, 1, 1, 1, 1, 1,
-1.129883, 0.05680846, -2.351127, 1, 1, 1, 1, 1,
-1.128313, -0.2704065, -2.656669, 1, 1, 1, 1, 1,
-1.120775, 0.4345822, -1.094655, 1, 1, 1, 1, 1,
-1.117645, 0.3638334, 0.3610451, 1, 1, 1, 1, 1,
-1.102734, 2.192843, -0.01773395, 1, 1, 1, 1, 1,
-1.089259, -1.317952, -2.210611, 1, 1, 1, 1, 1,
-1.085641, 0.9677572, -1.717767, 1, 1, 1, 1, 1,
-1.079085, -0.4811244, -1.995875, 1, 1, 1, 1, 1,
-1.072007, -2.026557, -3.303889, 1, 1, 1, 1, 1,
-1.067537, 0.2845812, -2.533863, 1, 1, 1, 1, 1,
-1.064137, 1.187628, -1.561471, 1, 1, 1, 1, 1,
-1.060127, 2.16613, -2.614057, 1, 1, 1, 1, 1,
-1.047406, -2.0784, -3.216477, 0, 0, 1, 1, 1,
-1.033283, -0.8312432, -1.064564, 1, 0, 0, 1, 1,
-1.032697, -0.3057804, -2.433985, 1, 0, 0, 1, 1,
-1.031181, -1.780899, -3.384253, 1, 0, 0, 1, 1,
-1.024889, 0.8908927, -1.704726, 1, 0, 0, 1, 1,
-1.023589, 0.7556655, 1.334654, 1, 0, 0, 1, 1,
-1.022538, -0.5619704, -4.385529, 0, 0, 0, 1, 1,
-1.02247, 0.3070454, -2.16108, 0, 0, 0, 1, 1,
-1.022329, -1.061122, -3.932176, 0, 0, 0, 1, 1,
-1.010509, 0.593558, 1.409637, 0, 0, 0, 1, 1,
-1.00969, -0.4633485, -1.638225, 0, 0, 0, 1, 1,
-1.00156, -0.48253, -0.5719842, 0, 0, 0, 1, 1,
-0.9966536, 1.038388, -0.1773661, 0, 0, 0, 1, 1,
-0.9781128, 1.149358, 0.5432673, 1, 1, 1, 1, 1,
-0.9774769, 1.164939, -2.283005, 1, 1, 1, 1, 1,
-0.9760144, -0.6383117, -5.060359, 1, 1, 1, 1, 1,
-0.9750656, -0.6089193, -0.4206879, 1, 1, 1, 1, 1,
-0.974627, -1.445086, -3.545944, 1, 1, 1, 1, 1,
-0.9740904, -0.8628408, -2.104044, 1, 1, 1, 1, 1,
-0.960916, 0.7566404, -0.4487249, 1, 1, 1, 1, 1,
-0.9590208, 0.5703911, 0.03338993, 1, 1, 1, 1, 1,
-0.957451, -1.438467, -1.15266, 1, 1, 1, 1, 1,
-0.9516605, -1.07303, -2.360015, 1, 1, 1, 1, 1,
-0.950008, 0.4622104, -1.319666, 1, 1, 1, 1, 1,
-0.9495604, -0.04056686, -3.181596, 1, 1, 1, 1, 1,
-0.9475342, 0.199654, -2.30158, 1, 1, 1, 1, 1,
-0.9439594, -0.9797925, -2.135831, 1, 1, 1, 1, 1,
-0.9423692, -0.255783, -3.465797, 1, 1, 1, 1, 1,
-0.9400189, 0.2030855, -1.155558, 0, 0, 1, 1, 1,
-0.9357187, -0.8777333, -2.733947, 1, 0, 0, 1, 1,
-0.9356989, 0.06711486, -3.632265, 1, 0, 0, 1, 1,
-0.9335615, 0.309373, -1.491792, 1, 0, 0, 1, 1,
-0.9295048, -0.6579053, -2.035356, 1, 0, 0, 1, 1,
-0.9288996, -1.587889, -2.176447, 1, 0, 0, 1, 1,
-0.9288154, 1.409509, -0.007616763, 0, 0, 0, 1, 1,
-0.9217563, 1.205058, -1.070116, 0, 0, 0, 1, 1,
-0.9159482, 0.4976049, -1.38311, 0, 0, 0, 1, 1,
-0.9117422, 0.2540184, -0.8364524, 0, 0, 0, 1, 1,
-0.9065098, -1.220912, -2.646111, 0, 0, 0, 1, 1,
-0.9050028, 0.1380792, -3.003542, 0, 0, 0, 1, 1,
-0.8992391, 1.071197, -1.62403, 0, 0, 0, 1, 1,
-0.8987914, -0.08677879, -1.889832, 1, 1, 1, 1, 1,
-0.8932989, -0.4066333, -1.25694, 1, 1, 1, 1, 1,
-0.8789838, -0.6759558, -3.515591, 1, 1, 1, 1, 1,
-0.8776513, 0.8559471, -0.5296011, 1, 1, 1, 1, 1,
-0.8738009, 0.9994646, 0.4618145, 1, 1, 1, 1, 1,
-0.8687908, -0.6258882, -1.667366, 1, 1, 1, 1, 1,
-0.8684172, -0.7161014, -2.5724, 1, 1, 1, 1, 1,
-0.8674963, -0.1675731, -3.623635, 1, 1, 1, 1, 1,
-0.8664684, -1.787796, -3.966769, 1, 1, 1, 1, 1,
-0.8643658, 0.6813192, -2.288589, 1, 1, 1, 1, 1,
-0.8617154, 0.9774951, -2.122705, 1, 1, 1, 1, 1,
-0.8529675, -1.024685, -2.963784, 1, 1, 1, 1, 1,
-0.8523556, -0.07956, -1.731196, 1, 1, 1, 1, 1,
-0.8487916, 0.3682984, 0.8099802, 1, 1, 1, 1, 1,
-0.8451326, -0.4899827, -1.365544, 1, 1, 1, 1, 1,
-0.8398903, -1.792153, -4.014453, 0, 0, 1, 1, 1,
-0.8299114, -1.003419, -3.248434, 1, 0, 0, 1, 1,
-0.8278372, -1.336084, -2.189138, 1, 0, 0, 1, 1,
-0.8275675, 0.2932787, -3.130394, 1, 0, 0, 1, 1,
-0.825546, 0.5118809, -1.096506, 1, 0, 0, 1, 1,
-0.8188831, -0.2533608, -0.90035, 1, 0, 0, 1, 1,
-0.8129327, -0.5268984, -3.307539, 0, 0, 0, 1, 1,
-0.8036721, 0.3013386, -1.670623, 0, 0, 0, 1, 1,
-0.7998997, -2.07683, -2.802476, 0, 0, 0, 1, 1,
-0.799244, 1.018154, 0.5699204, 0, 0, 0, 1, 1,
-0.790801, -0.05801452, -1.944698, 0, 0, 0, 1, 1,
-0.7901349, 0.6039654, 0.2558896, 0, 0, 0, 1, 1,
-0.7896083, 0.757187, -0.8364562, 0, 0, 0, 1, 1,
-0.7884285, 1.177885, 0.5526596, 1, 1, 1, 1, 1,
-0.7826619, 0.6831123, -1.66142, 1, 1, 1, 1, 1,
-0.7780574, -1.696893, -3.450018, 1, 1, 1, 1, 1,
-0.774483, -1.382276, -1.621339, 1, 1, 1, 1, 1,
-0.7720247, 0.9575384, -0.9330963, 1, 1, 1, 1, 1,
-0.7637193, 0.3466282, -2.174417, 1, 1, 1, 1, 1,
-0.7562958, 0.1571856, 0.3247484, 1, 1, 1, 1, 1,
-0.7508163, 1.671195, -0.3829339, 1, 1, 1, 1, 1,
-0.7467051, -0.9538692, -1.207958, 1, 1, 1, 1, 1,
-0.7466115, -0.9231182, -2.199638, 1, 1, 1, 1, 1,
-0.740788, -0.2520747, -4.230334, 1, 1, 1, 1, 1,
-0.7400302, 0.2941843, -0.626698, 1, 1, 1, 1, 1,
-0.7396828, 0.917777, 1.657349, 1, 1, 1, 1, 1,
-0.7367299, -1.648543, -2.08316, 1, 1, 1, 1, 1,
-0.7327628, -0.9864879, -1.992805, 1, 1, 1, 1, 1,
-0.7265881, -0.9807377, -1.611928, 0, 0, 1, 1, 1,
-0.7139668, 0.2410787, -2.633096, 1, 0, 0, 1, 1,
-0.7124535, 0.2756989, -0.9422354, 1, 0, 0, 1, 1,
-0.7124175, -1.852924, -2.386663, 1, 0, 0, 1, 1,
-0.7114615, 0.5056821, -1.269198, 1, 0, 0, 1, 1,
-0.7099139, 0.2057795, -0.6063617, 1, 0, 0, 1, 1,
-0.6958316, -0.7568418, -2.054491, 0, 0, 0, 1, 1,
-0.6946591, 1.056187, -1.712844, 0, 0, 0, 1, 1,
-0.6915707, -0.4610024, -1.062324, 0, 0, 0, 1, 1,
-0.6903164, -0.3817295, -3.968782, 0, 0, 0, 1, 1,
-0.6821941, -0.9217475, -3.421956, 0, 0, 0, 1, 1,
-0.6803926, 0.4521374, -2.424001, 0, 0, 0, 1, 1,
-0.6779833, -2.389506, -2.528253, 0, 0, 0, 1, 1,
-0.6743799, -0.5265447, -3.081854, 1, 1, 1, 1, 1,
-0.6738575, -0.05796938, -3.412307, 1, 1, 1, 1, 1,
-0.6714607, -0.6600737, -3.954303, 1, 1, 1, 1, 1,
-0.6660832, -0.68325, -3.343142, 1, 1, 1, 1, 1,
-0.6634898, 0.9367335, 0.9401668, 1, 1, 1, 1, 1,
-0.6624925, -0.7232447, -2.20183, 1, 1, 1, 1, 1,
-0.6618562, 0.0248496, -1.465577, 1, 1, 1, 1, 1,
-0.661079, 0.9345254, -1.282602, 1, 1, 1, 1, 1,
-0.6583582, -0.6173562, -3.577772, 1, 1, 1, 1, 1,
-0.6527028, 0.9097163, -0.4822361, 1, 1, 1, 1, 1,
-0.650402, -0.5341265, -2.625273, 1, 1, 1, 1, 1,
-0.6452397, -1.210428, -2.429548, 1, 1, 1, 1, 1,
-0.6437384, 0.5328727, -0.6864653, 1, 1, 1, 1, 1,
-0.6404016, -0.1426691, -1.63481, 1, 1, 1, 1, 1,
-0.6366004, -0.4883737, -3.27308, 1, 1, 1, 1, 1,
-0.6346436, -1.421631, -2.377342, 0, 0, 1, 1, 1,
-0.6332377, -0.7178288, -1.721364, 1, 0, 0, 1, 1,
-0.6298378, 0.06404625, -2.868725, 1, 0, 0, 1, 1,
-0.6290463, 0.3969161, -1.283141, 1, 0, 0, 1, 1,
-0.6285551, -0.6892659, -2.196428, 1, 0, 0, 1, 1,
-0.622788, 0.1504734, -0.3490361, 1, 0, 0, 1, 1,
-0.6161835, 1.781477, -0.3998738, 0, 0, 0, 1, 1,
-0.6154002, -0.4866839, -2.793932, 0, 0, 0, 1, 1,
-0.6124548, -1.24165, -1.318673, 0, 0, 0, 1, 1,
-0.6095741, 0.4411038, -2.945707, 0, 0, 0, 1, 1,
-0.6046422, -0.6656185, -2.599782, 0, 0, 0, 1, 1,
-0.6026554, -0.4812365, -3.485339, 0, 0, 0, 1, 1,
-0.5953361, 1.090592, 0.009210808, 0, 0, 0, 1, 1,
-0.5929013, -0.3858776, -1.571072, 1, 1, 1, 1, 1,
-0.5924596, 1.600356, -0.95714, 1, 1, 1, 1, 1,
-0.5906794, 0.854543, -0.2985632, 1, 1, 1, 1, 1,
-0.5865042, 0.2974518, -1.470467, 1, 1, 1, 1, 1,
-0.5814916, 0.5455427, -1.370539, 1, 1, 1, 1, 1,
-0.5749128, 2.201558, -1.557357, 1, 1, 1, 1, 1,
-0.574573, 1.358442, -0.6540457, 1, 1, 1, 1, 1,
-0.5727603, 0.7722108, -0.4377991, 1, 1, 1, 1, 1,
-0.5649647, 0.06244696, -2.37455, 1, 1, 1, 1, 1,
-0.561142, -0.03544414, 0.3627211, 1, 1, 1, 1, 1,
-0.5598848, 1.383872, -1.34069, 1, 1, 1, 1, 1,
-0.5591801, 1.066272, -0.7632224, 1, 1, 1, 1, 1,
-0.5578398, 0.0840569, -0.7247841, 1, 1, 1, 1, 1,
-0.5569991, -0.312434, -3.552525, 1, 1, 1, 1, 1,
-0.5552309, 0.8057945, -2.538907, 1, 1, 1, 1, 1,
-0.5499017, -2.253837, -4.142969, 0, 0, 1, 1, 1,
-0.5488204, 0.7970841, -1.744957, 1, 0, 0, 1, 1,
-0.5463359, 2.549043, -0.2912147, 1, 0, 0, 1, 1,
-0.545893, 1.158652, 0.1829254, 1, 0, 0, 1, 1,
-0.5456804, 0.4455993, -0.6463627, 1, 0, 0, 1, 1,
-0.5431015, -0.1746768, -0.4295099, 1, 0, 0, 1, 1,
-0.5425122, 1.299602, -1.140737, 0, 0, 0, 1, 1,
-0.5424981, 0.4240392, -1.755343, 0, 0, 0, 1, 1,
-0.5402818, -0.7004661, -1.995405, 0, 0, 0, 1, 1,
-0.5356445, -0.4920414, -1.920517, 0, 0, 0, 1, 1,
-0.5351415, 0.5997565, -0.4109718, 0, 0, 0, 1, 1,
-0.5309777, 0.7543337, 0.2032253, 0, 0, 0, 1, 1,
-0.5255362, 0.8356081, -1.322906, 0, 0, 0, 1, 1,
-0.5225368, -1.096232, -2.698715, 1, 1, 1, 1, 1,
-0.5216136, -1.579636, -1.839096, 1, 1, 1, 1, 1,
-0.5209642, 0.3027344, -2.707049, 1, 1, 1, 1, 1,
-0.5148589, -0.5589558, -1.46689, 1, 1, 1, 1, 1,
-0.514733, -0.1928754, -1.711572, 1, 1, 1, 1, 1,
-0.5138271, 0.7577257, -0.1820593, 1, 1, 1, 1, 1,
-0.5105321, -0.3542996, -1.345758, 1, 1, 1, 1, 1,
-0.5084227, -0.9704163, -3.466611, 1, 1, 1, 1, 1,
-0.5031921, -1.4785, -2.938797, 1, 1, 1, 1, 1,
-0.5009347, 0.4995657, -0.6559753, 1, 1, 1, 1, 1,
-0.4929501, 0.4104003, -1.385217, 1, 1, 1, 1, 1,
-0.4927347, 0.08581427, -2.411603, 1, 1, 1, 1, 1,
-0.4900511, 0.1120962, -2.008109, 1, 1, 1, 1, 1,
-0.4892244, -1.728229, -4.293824, 1, 1, 1, 1, 1,
-0.4869421, -0.8169975, -0.6403203, 1, 1, 1, 1, 1,
-0.4855846, 0.8018537, -0.5244273, 0, 0, 1, 1, 1,
-0.4849067, 0.2781248, -0.4864605, 1, 0, 0, 1, 1,
-0.483711, 1.338396, -0.7190654, 1, 0, 0, 1, 1,
-0.4825456, 0.8024433, 0.9285088, 1, 0, 0, 1, 1,
-0.4823919, 1.143245, -0.931667, 1, 0, 0, 1, 1,
-0.4791414, -1.707661, -2.859179, 1, 0, 0, 1, 1,
-0.4748472, -0.08280556, -3.028434, 0, 0, 0, 1, 1,
-0.4702518, -0.04648241, 0.3601571, 0, 0, 0, 1, 1,
-0.467999, -0.8353478, -3.175205, 0, 0, 0, 1, 1,
-0.4665797, -0.8157055, -0.01356146, 0, 0, 0, 1, 1,
-0.4660597, -1.284947, -4.433356, 0, 0, 0, 1, 1,
-0.4659226, 0.3744969, -0.4953834, 0, 0, 0, 1, 1,
-0.4658912, -1.70735, -3.67177, 0, 0, 0, 1, 1,
-0.4655662, -0.1674594, -1.566943, 1, 1, 1, 1, 1,
-0.464248, 0.2906587, -1.205382, 1, 1, 1, 1, 1,
-0.4603164, 0.1430041, -2.82014, 1, 1, 1, 1, 1,
-0.4597586, -0.4042135, -1.856298, 1, 1, 1, 1, 1,
-0.459729, 0.182477, -2.041484, 1, 1, 1, 1, 1,
-0.4585508, -2.253398, -2.744689, 1, 1, 1, 1, 1,
-0.4525602, 0.3576789, -1.210428, 1, 1, 1, 1, 1,
-0.452146, 0.3317884, -0.2636966, 1, 1, 1, 1, 1,
-0.4476334, 1.760464, -0.08421775, 1, 1, 1, 1, 1,
-0.4417318, 0.1465031, -1.783714, 1, 1, 1, 1, 1,
-0.4412415, -0.5420856, -2.189291, 1, 1, 1, 1, 1,
-0.4392721, -1.59379, -3.153153, 1, 1, 1, 1, 1,
-0.4371592, -1.472418, -3.338475, 1, 1, 1, 1, 1,
-0.4348896, -0.7659959, -3.406741, 1, 1, 1, 1, 1,
-0.4345398, 1.341296, -0.3312749, 1, 1, 1, 1, 1,
-0.4329289, 0.5943282, -0.9143724, 0, 0, 1, 1, 1,
-0.4314322, 1.061253, -0.2867896, 1, 0, 0, 1, 1,
-0.4313846, -1.963022, -2.329927, 1, 0, 0, 1, 1,
-0.4292644, -1.225803, -4.631366, 1, 0, 0, 1, 1,
-0.4286524, 0.2426796, -2.841428, 1, 0, 0, 1, 1,
-0.4276783, 0.4917676, -1.516059, 1, 0, 0, 1, 1,
-0.4268427, -0.881258, -1.644742, 0, 0, 0, 1, 1,
-0.4254602, -0.7364654, -3.580317, 0, 0, 0, 1, 1,
-0.4235531, 1.199521, 0.4697096, 0, 0, 0, 1, 1,
-0.4176493, 0.4282679, -1.883771, 0, 0, 0, 1, 1,
-0.4128374, -0.2343397, -2.364411, 0, 0, 0, 1, 1,
-0.4107776, 0.7548673, -1.673601, 0, 0, 0, 1, 1,
-0.4070266, -1.346463, -3.396598, 0, 0, 0, 1, 1,
-0.4058061, -0.01253946, -1.644707, 1, 1, 1, 1, 1,
-0.4045858, -0.2778376, -1.949516, 1, 1, 1, 1, 1,
-0.4031263, -1.55461, -1.760256, 1, 1, 1, 1, 1,
-0.4011573, -0.7043058, -1.30808, 1, 1, 1, 1, 1,
-0.4004988, -0.02561639, -1.668774, 1, 1, 1, 1, 1,
-0.3957295, -0.4936892, -2.34111, 1, 1, 1, 1, 1,
-0.3956622, 2.578814, -0.3653908, 1, 1, 1, 1, 1,
-0.3923818, 0.6594738, 0.744592, 1, 1, 1, 1, 1,
-0.391992, -0.06051882, -2.968313, 1, 1, 1, 1, 1,
-0.389862, 1.173105, 0.4086781, 1, 1, 1, 1, 1,
-0.3838489, 0.4893546, -0.8175498, 1, 1, 1, 1, 1,
-0.3838437, 0.1393329, -0.6392322, 1, 1, 1, 1, 1,
-0.3828163, 0.1418691, 0.219584, 1, 1, 1, 1, 1,
-0.3786564, -0.09921998, -2.468979, 1, 1, 1, 1, 1,
-0.3739504, 0.6211142, -0.8255134, 1, 1, 1, 1, 1,
-0.3700352, 1.353251, 0.1690661, 0, 0, 1, 1, 1,
-0.3682101, 1.211895, 0.05134806, 1, 0, 0, 1, 1,
-0.3651141, 0.04461514, -0.72962, 1, 0, 0, 1, 1,
-0.3645489, -1.467206, -0.5980828, 1, 0, 0, 1, 1,
-0.3628342, -0.822434, -3.050448, 1, 0, 0, 1, 1,
-0.3625519, 0.9031465, -0.5896847, 1, 0, 0, 1, 1,
-0.3609945, 1.12566, -0.6315301, 0, 0, 0, 1, 1,
-0.3510135, 1.211199, -1.646094, 0, 0, 0, 1, 1,
-0.350682, 1.132202, 0.2260387, 0, 0, 0, 1, 1,
-0.3496607, 1.720801, -0.3586449, 0, 0, 0, 1, 1,
-0.3469527, -0.2305278, -2.391267, 0, 0, 0, 1, 1,
-0.3460275, 1.249881, -0.3849559, 0, 0, 0, 1, 1,
-0.3444806, 1.190461, -1.545605, 0, 0, 0, 1, 1,
-0.3436777, -1.196514, -5.490393, 1, 1, 1, 1, 1,
-0.3434548, 0.8363701, 0.8583719, 1, 1, 1, 1, 1,
-0.3425416, -0.1929792, -1.346122, 1, 1, 1, 1, 1,
-0.3424987, 0.5877998, 1.257284, 1, 1, 1, 1, 1,
-0.3415545, 0.9684787, -1.233574, 1, 1, 1, 1, 1,
-0.3400656, -0.4912958, -3.006281, 1, 1, 1, 1, 1,
-0.3324718, -0.09645033, -2.043689, 1, 1, 1, 1, 1,
-0.3253087, 0.9839373, -1.921785, 1, 1, 1, 1, 1,
-0.3209046, -0.575739, -3.279375, 1, 1, 1, 1, 1,
-0.3197353, 0.1512505, -1.044767, 1, 1, 1, 1, 1,
-0.3165306, 0.4127606, 0.8568015, 1, 1, 1, 1, 1,
-0.312479, 1.115992, -0.7066646, 1, 1, 1, 1, 1,
-0.3032564, 0.03860817, -2.239611, 1, 1, 1, 1, 1,
-0.3022864, -0.3055097, -2.56966, 1, 1, 1, 1, 1,
-0.2993928, 1.141, -0.4504991, 1, 1, 1, 1, 1,
-0.2901035, -2.163071, -1.951236, 0, 0, 1, 1, 1,
-0.2824347, 0.8787425, -0.2645628, 1, 0, 0, 1, 1,
-0.279464, -0.418153, -1.783357, 1, 0, 0, 1, 1,
-0.2766924, -0.1456134, -1.826424, 1, 0, 0, 1, 1,
-0.2715886, -0.02688859, -2.042073, 1, 0, 0, 1, 1,
-0.2707831, -0.9226623, -4.257861, 1, 0, 0, 1, 1,
-0.2622636, 1.431255, 0.2647352, 0, 0, 0, 1, 1,
-0.2621822, -0.3753732, -2.556537, 0, 0, 0, 1, 1,
-0.2609028, -0.4369053, -5.403312, 0, 0, 0, 1, 1,
-0.2537267, -0.5192937, -1.030789, 0, 0, 0, 1, 1,
-0.2485025, 0.1737739, 0.4032093, 0, 0, 0, 1, 1,
-0.2391053, 1.17715, -0.3156714, 0, 0, 0, 1, 1,
-0.2345491, -0.4916517, -2.039886, 0, 0, 0, 1, 1,
-0.2331253, -1.773007, -3.375947, 1, 1, 1, 1, 1,
-0.2323374, 0.4938824, 1.631494, 1, 1, 1, 1, 1,
-0.230348, 1.960676, 0.8382569, 1, 1, 1, 1, 1,
-0.227562, 0.2595744, -2.207596, 1, 1, 1, 1, 1,
-0.2268124, 0.1946863, -1.00225, 1, 1, 1, 1, 1,
-0.2256469, -2.33568, -2.699769, 1, 1, 1, 1, 1,
-0.2248733, 0.2514682, -1.902841, 1, 1, 1, 1, 1,
-0.2224793, -0.5817879, -2.122695, 1, 1, 1, 1, 1,
-0.2195857, 1.603429, 0.2926628, 1, 1, 1, 1, 1,
-0.2126417, 0.5834647, -2.017542, 1, 1, 1, 1, 1,
-0.2102921, 1.941304, 0.2592292, 1, 1, 1, 1, 1,
-0.2046018, -1.747854, -3.534936, 1, 1, 1, 1, 1,
-0.2010112, -1.550972, -2.212909, 1, 1, 1, 1, 1,
-0.1939515, -0.6752863, -3.011964, 1, 1, 1, 1, 1,
-0.1938081, 0.4100736, -0.5473972, 1, 1, 1, 1, 1,
-0.1902379, 3.138336, -1.47818, 0, 0, 1, 1, 1,
-0.1893682, -1.919213, -3.615214, 1, 0, 0, 1, 1,
-0.1798173, 0.2289371, -0.8975902, 1, 0, 0, 1, 1,
-0.1796721, -0.7196748, -1.663201, 1, 0, 0, 1, 1,
-0.1764908, 1.232722, 0.4365198, 1, 0, 0, 1, 1,
-0.1741745, -1.175687, -2.835384, 1, 0, 0, 1, 1,
-0.1740803, -0.1875184, -2.570988, 0, 0, 0, 1, 1,
-0.1716538, 1.31792, 1.035877, 0, 0, 0, 1, 1,
-0.1712072, -1.086434, -4.129345, 0, 0, 0, 1, 1,
-0.1691141, 0.8155693, -0.5474196, 0, 0, 0, 1, 1,
-0.168558, 0.8006653, -0.2706046, 0, 0, 0, 1, 1,
-0.1605912, -0.9174673, -3.053725, 0, 0, 0, 1, 1,
-0.1577425, 1.34146, -0.327022, 0, 0, 0, 1, 1,
-0.15749, 1.839258, 0.5200899, 1, 1, 1, 1, 1,
-0.1560936, -0.1644521, -1.774012, 1, 1, 1, 1, 1,
-0.1537712, -0.409633, -1.837512, 1, 1, 1, 1, 1,
-0.1502379, -0.1002755, -3.18944, 1, 1, 1, 1, 1,
-0.1468367, -0.3630291, -1.848734, 1, 1, 1, 1, 1,
-0.1389735, -1.152579, -3.384643, 1, 1, 1, 1, 1,
-0.138055, 0.3778502, -0.2167955, 1, 1, 1, 1, 1,
-0.1348702, 1.792382, 0.1442339, 1, 1, 1, 1, 1,
-0.1336403, 0.1903404, -0.8484191, 1, 1, 1, 1, 1,
-0.1318898, -1.005601, -3.80534, 1, 1, 1, 1, 1,
-0.1304386, -0.7679209, -3.775136, 1, 1, 1, 1, 1,
-0.1295205, 0.6366422, -0.552798, 1, 1, 1, 1, 1,
-0.1290647, -1.716844, -3.292971, 1, 1, 1, 1, 1,
-0.1252981, 1.126345, -0.1109728, 1, 1, 1, 1, 1,
-0.1166973, -1.374249, -2.770328, 1, 1, 1, 1, 1,
-0.1129488, 3.020953, 0.6663973, 0, 0, 1, 1, 1,
-0.1129217, 1.450215, 0.4885923, 1, 0, 0, 1, 1,
-0.1128934, -0.642231, -3.756468, 1, 0, 0, 1, 1,
-0.1077005, 0.7927312, 0.09816123, 1, 0, 0, 1, 1,
-0.1061997, -1.438817, -2.5351, 1, 0, 0, 1, 1,
-0.1050762, -1.92006, -3.461271, 1, 0, 0, 1, 1,
-0.09906998, 0.4136958, 0.9618698, 0, 0, 0, 1, 1,
-0.09468456, -0.09045714, -0.9537421, 0, 0, 0, 1, 1,
-0.09361668, 0.2240916, 0.108413, 0, 0, 0, 1, 1,
-0.09352443, 0.04619377, -1.19663, 0, 0, 0, 1, 1,
-0.08998788, 0.2749889, 0.8364194, 0, 0, 0, 1, 1,
-0.08844093, 0.7941228, 0.9048082, 0, 0, 0, 1, 1,
-0.0810315, -0.3617409, -3.341064, 0, 0, 0, 1, 1,
-0.0760824, 0.281083, 0.5598291, 1, 1, 1, 1, 1,
-0.07447883, -0.3880076, -2.972277, 1, 1, 1, 1, 1,
-0.07291368, 0.2954817, -1.100768, 1, 1, 1, 1, 1,
-0.06780092, -0.7976701, -2.925793, 1, 1, 1, 1, 1,
-0.06646837, -0.284702, -4.013499, 1, 1, 1, 1, 1,
-0.06559952, 1.937827, -1.159458, 1, 1, 1, 1, 1,
-0.06544007, -0.8317758, -3.170827, 1, 1, 1, 1, 1,
-0.06478766, 0.5488122, -0.9333726, 1, 1, 1, 1, 1,
-0.06376503, -0.617991, -3.20067, 1, 1, 1, 1, 1,
-0.06220496, -0.8521739, -2.49389, 1, 1, 1, 1, 1,
-0.05249579, -1.889079, -3.923222, 1, 1, 1, 1, 1,
-0.05133097, -1.553747, -4.870805, 1, 1, 1, 1, 1,
-0.04664619, 0.3779301, -1.052484, 1, 1, 1, 1, 1,
-0.04317243, 0.8396696, 1.02318, 1, 1, 1, 1, 1,
-0.04247084, -1.926482, -4.107938, 1, 1, 1, 1, 1,
-0.04155804, -1.011896, -3.236026, 0, 0, 1, 1, 1,
-0.04047935, 0.1796588, -0.2499999, 1, 0, 0, 1, 1,
-0.03607322, 0.9630869, -1.246663, 1, 0, 0, 1, 1,
-0.03471702, -1.008803, -2.766967, 1, 0, 0, 1, 1,
-0.02834865, -2.164267, -2.278287, 1, 0, 0, 1, 1,
-0.02805539, -1.376042, -2.496317, 1, 0, 0, 1, 1,
-0.02753728, 0.007955943, -1.654538, 0, 0, 0, 1, 1,
-0.02725893, 0.1310606, -1.058628, 0, 0, 0, 1, 1,
-0.02472136, 0.8730297, -0.5071279, 0, 0, 0, 1, 1,
-0.02420834, -1.090788, -4.206845, 0, 0, 0, 1, 1,
-0.02352714, 0.05827491, -1.33112, 0, 0, 0, 1, 1,
-0.02294174, -0.3724605, -2.429163, 0, 0, 0, 1, 1,
-0.02139499, 1.859093, 0.04871175, 0, 0, 0, 1, 1,
-0.02082479, -2.722915, -1.842634, 1, 1, 1, 1, 1,
-0.01788399, 0.5871812, 0.0953482, 1, 1, 1, 1, 1,
-0.01485586, 0.6938408, -1.354078, 1, 1, 1, 1, 1,
-0.009488733, 1.016738, 0.1731709, 1, 1, 1, 1, 1,
-0.008407444, 0.5470664, -1.677676, 1, 1, 1, 1, 1,
-0.006945047, -0.6097968, -2.746638, 1, 1, 1, 1, 1,
-0.003506228, -0.6644975, -2.864167, 1, 1, 1, 1, 1,
0.00200757, -1.223555, 4.151267, 1, 1, 1, 1, 1,
0.002339422, -1.272775, 3.848215, 1, 1, 1, 1, 1,
0.0029902, 0.8330079, -0.5054812, 1, 1, 1, 1, 1,
0.003676818, -0.5417222, 1.666369, 1, 1, 1, 1, 1,
0.008222689, 0.4042231, -0.01752171, 1, 1, 1, 1, 1,
0.01251192, 1.426033, 0.6639415, 1, 1, 1, 1, 1,
0.0131487, 0.6911057, 1.849463, 1, 1, 1, 1, 1,
0.01441788, -1.035835, 3.253557, 1, 1, 1, 1, 1,
0.01542411, 0.6091889, -0.1800958, 0, 0, 1, 1, 1,
0.02075097, -0.03871844, 2.827692, 1, 0, 0, 1, 1,
0.02535455, -1.034887, 4.994273, 1, 0, 0, 1, 1,
0.02826962, 0.9063842, -0.4052746, 1, 0, 0, 1, 1,
0.03026125, 0.02720976, 1.779151, 1, 0, 0, 1, 1,
0.03109961, 1.70776, -1.602712, 1, 0, 0, 1, 1,
0.03700546, 0.4247835, 1.225925, 0, 0, 0, 1, 1,
0.03868538, -0.2363665, 2.495406, 0, 0, 0, 1, 1,
0.04220394, -2.1295, 2.340794, 0, 0, 0, 1, 1,
0.04428068, 0.1089503, -0.8954051, 0, 0, 0, 1, 1,
0.04480278, 0.4624234, 1.610874, 0, 0, 0, 1, 1,
0.04627627, -0.419322, 3.871559, 0, 0, 0, 1, 1,
0.04658489, -0.8312634, 3.420079, 0, 0, 0, 1, 1,
0.04831995, -2.311353, 3.180495, 1, 1, 1, 1, 1,
0.0492418, -0.2192004, 4.376946, 1, 1, 1, 1, 1,
0.05266038, -2.100069, 3.418245, 1, 1, 1, 1, 1,
0.05475029, 0.9761986, 0.4688351, 1, 1, 1, 1, 1,
0.05606975, 1.016761, 1.465276, 1, 1, 1, 1, 1,
0.05609631, 0.4324547, 1.598793, 1, 1, 1, 1, 1,
0.05941587, 0.3982528, 1.499549, 1, 1, 1, 1, 1,
0.06774554, -0.9889981, 2.170126, 1, 1, 1, 1, 1,
0.06952934, 1.848207, 0.6740369, 1, 1, 1, 1, 1,
0.071266, 1.02672, -2.500751, 1, 1, 1, 1, 1,
0.07144867, -0.3085123, 4.737636, 1, 1, 1, 1, 1,
0.07439384, 3.076549, -0.5516654, 1, 1, 1, 1, 1,
0.07439777, -0.8872185, 3.640971, 1, 1, 1, 1, 1,
0.07598269, 0.5852932, 1.027449, 1, 1, 1, 1, 1,
0.08224568, -0.5521992, 2.08047, 1, 1, 1, 1, 1,
0.08333639, -2.319565, 3.336927, 0, 0, 1, 1, 1,
0.08336599, 0.8436434, 0.5972223, 1, 0, 0, 1, 1,
0.08338565, 2.108664, 0.9739799, 1, 0, 0, 1, 1,
0.08355682, -1.61119, 1.622169, 1, 0, 0, 1, 1,
0.08450457, 0.197496, 0.315006, 1, 0, 0, 1, 1,
0.08576433, 0.4736675, -0.470211, 1, 0, 0, 1, 1,
0.08624639, -0.09189468, 0.01510592, 0, 0, 0, 1, 1,
0.08763987, -0.5314943, 3.809505, 0, 0, 0, 1, 1,
0.08822299, 0.2309697, -0.606439, 0, 0, 0, 1, 1,
0.09073249, 0.05147354, 0.7036234, 0, 0, 0, 1, 1,
0.09682406, -1.057139, 4.383829, 0, 0, 0, 1, 1,
0.1017872, 0.01120408, 2.001372, 0, 0, 0, 1, 1,
0.1031809, 0.02051975, 2.370722, 0, 0, 0, 1, 1,
0.1120303, 0.5711362, -0.3348545, 1, 1, 1, 1, 1,
0.1150931, 0.5833454, 1.833041, 1, 1, 1, 1, 1,
0.1161548, 0.4313419, 0.5428823, 1, 1, 1, 1, 1,
0.1170984, 0.3903505, 0.743762, 1, 1, 1, 1, 1,
0.1171401, 0.8019341, 0.9117028, 1, 1, 1, 1, 1,
0.1193397, -0.5887689, 0.7694873, 1, 1, 1, 1, 1,
0.1205195, -1.231305, 3.253274, 1, 1, 1, 1, 1,
0.1233561, -0.5229025, 2.113248, 1, 1, 1, 1, 1,
0.1243569, 0.2782355, 1.863378, 1, 1, 1, 1, 1,
0.1258474, 0.2443672, 0.6412889, 1, 1, 1, 1, 1,
0.1278609, -1.385353, 4.001256, 1, 1, 1, 1, 1,
0.1284223, -0.3091883, 1.760772, 1, 1, 1, 1, 1,
0.1291216, -1.276496, 3.496548, 1, 1, 1, 1, 1,
0.1293456, -0.3504716, 4.788298, 1, 1, 1, 1, 1,
0.1312299, 0.03150412, 3.095869, 1, 1, 1, 1, 1,
0.1367967, 0.3004536, 0.8611144, 0, 0, 1, 1, 1,
0.1368511, -2.079297, 2.970921, 1, 0, 0, 1, 1,
0.1402986, 1.012314, 0.6791673, 1, 0, 0, 1, 1,
0.1423692, -0.5033709, 2.292628, 1, 0, 0, 1, 1,
0.1481517, -0.05493038, 1.980044, 1, 0, 0, 1, 1,
0.1491804, -0.356778, 2.801083, 1, 0, 0, 1, 1,
0.1520663, 0.5697576, 1.553272, 0, 0, 0, 1, 1,
0.1528281, 0.6846983, 1.246774, 0, 0, 0, 1, 1,
0.1556162, -0.3567701, 1.166736, 0, 0, 0, 1, 1,
0.1561837, 0.3180467, 1.061162, 0, 0, 0, 1, 1,
0.1573595, -0.6776621, 3.003277, 0, 0, 0, 1, 1,
0.1579406, -0.1451327, 3.343325, 0, 0, 0, 1, 1,
0.1598361, -0.8804183, 1.581935, 0, 0, 0, 1, 1,
0.1605903, -0.0305334, 1.482137, 1, 1, 1, 1, 1,
0.1607029, 0.5353648, 0.03125458, 1, 1, 1, 1, 1,
0.1635947, 0.9632276, 0.6356984, 1, 1, 1, 1, 1,
0.1640999, -0.1943008, 0.7470297, 1, 1, 1, 1, 1,
0.165338, 0.1158274, 3.890805, 1, 1, 1, 1, 1,
0.1684639, -1.243383, 2.964247, 1, 1, 1, 1, 1,
0.1699669, -1.451634, 2.075196, 1, 1, 1, 1, 1,
0.1721192, 0.4890411, 1.208109, 1, 1, 1, 1, 1,
0.1723726, 0.5082608, 1.030543, 1, 1, 1, 1, 1,
0.1737265, 0.0288038, 1.382999, 1, 1, 1, 1, 1,
0.1761157, -0.4179715, 1.376794, 1, 1, 1, 1, 1,
0.1784618, -1.369019, 1.718804, 1, 1, 1, 1, 1,
0.1817773, 1.107294, 0.6004874, 1, 1, 1, 1, 1,
0.1875035, -1.690278, 1.943362, 1, 1, 1, 1, 1,
0.1945113, -1.500585, 2.814525, 1, 1, 1, 1, 1,
0.1982529, 0.126604, -0.7478586, 0, 0, 1, 1, 1,
0.2045708, -2.773062, 2.913024, 1, 0, 0, 1, 1,
0.2054981, 0.1309671, 1.075214, 1, 0, 0, 1, 1,
0.2059403, -0.253869, 1.557285, 1, 0, 0, 1, 1,
0.2103172, 0.2806317, 0.481165, 1, 0, 0, 1, 1,
0.2108679, 2.337029, -0.9536432, 1, 0, 0, 1, 1,
0.2132303, 0.4190426, -0.3036943, 0, 0, 0, 1, 1,
0.2140517, 0.3727126, 2.194735, 0, 0, 0, 1, 1,
0.2156232, 1.722004, 0.1421739, 0, 0, 0, 1, 1,
0.2208863, -1.656541, 4.33942, 0, 0, 0, 1, 1,
0.227581, -1.311015, 0.7009985, 0, 0, 0, 1, 1,
0.227823, 0.6278397, 0.8525813, 0, 0, 0, 1, 1,
0.2278849, 0.5043694, 0.7996239, 0, 0, 0, 1, 1,
0.2320661, -0.4893422, 3.810966, 1, 1, 1, 1, 1,
0.239964, -0.2387611, 3.840615, 1, 1, 1, 1, 1,
0.2431593, -0.5821726, 3.111485, 1, 1, 1, 1, 1,
0.2446158, 0.9792567, 0.6519258, 1, 1, 1, 1, 1,
0.2618856, -1.077871, 0.6428935, 1, 1, 1, 1, 1,
0.2643687, 1.74979, -0.5150216, 1, 1, 1, 1, 1,
0.2665704, 0.7855679, -1.038435, 1, 1, 1, 1, 1,
0.2667035, 0.382933, 1.5798, 1, 1, 1, 1, 1,
0.2784191, -0.6861058, 5.078519, 1, 1, 1, 1, 1,
0.2786717, 2.056318, -0.4977054, 1, 1, 1, 1, 1,
0.2798544, -0.6342235, 3.269888, 1, 1, 1, 1, 1,
0.2811391, 0.1307444, 1.779034, 1, 1, 1, 1, 1,
0.2831198, 1.712428, 1.230693, 1, 1, 1, 1, 1,
0.285785, -0.6893022, 4.437227, 1, 1, 1, 1, 1,
0.2867881, -0.04527652, 0.3167479, 1, 1, 1, 1, 1,
0.3033015, -1.432786, 2.849147, 0, 0, 1, 1, 1,
0.3062265, -0.6906356, 3.339233, 1, 0, 0, 1, 1,
0.3072878, 0.2251779, -1.577317, 1, 0, 0, 1, 1,
0.3125221, -0.1977792, 2.42463, 1, 0, 0, 1, 1,
0.3132327, 0.06368805, 1.770708, 1, 0, 0, 1, 1,
0.3168479, -0.8237107, 2.000807, 1, 0, 0, 1, 1,
0.3243916, 0.8786221, 0.2584444, 0, 0, 0, 1, 1,
0.3277754, 1.377772, 1.631828, 0, 0, 0, 1, 1,
0.328105, 0.1001002, 2.58171, 0, 0, 0, 1, 1,
0.3358085, 0.8569953, 0.8958769, 0, 0, 0, 1, 1,
0.3413001, -0.9965374, 1.844417, 0, 0, 0, 1, 1,
0.3416589, -0.8185973, 1.529015, 0, 0, 0, 1, 1,
0.3446915, 0.09251531, 1.934793, 0, 0, 0, 1, 1,
0.3518765, -0.695816, 3.347472, 1, 1, 1, 1, 1,
0.3533802, -0.3723201, 1.801407, 1, 1, 1, 1, 1,
0.3535286, 0.07539505, 1.612165, 1, 1, 1, 1, 1,
0.3564872, -0.7188491, 1.704978, 1, 1, 1, 1, 1,
0.358678, -0.1132846, 0.6242524, 1, 1, 1, 1, 1,
0.3596621, -0.6021686, 2.399643, 1, 1, 1, 1, 1,
0.3603936, -0.6993694, 2.666676, 1, 1, 1, 1, 1,
0.3655274, -1.051237, 3.084853, 1, 1, 1, 1, 1,
0.3680867, 2.115807, -0.04947535, 1, 1, 1, 1, 1,
0.3689986, 0.814476, -0.4204645, 1, 1, 1, 1, 1,
0.3764711, -0.05662043, 0.7830118, 1, 1, 1, 1, 1,
0.3792535, 0.7337556, -0.2939324, 1, 1, 1, 1, 1,
0.3794116, 1.612484, -1.430966, 1, 1, 1, 1, 1,
0.3813241, 0.2976684, 2.166306, 1, 1, 1, 1, 1,
0.3826042, 1.035109, 1.3306, 1, 1, 1, 1, 1,
0.3874072, -0.4363658, 1.589641, 0, 0, 1, 1, 1,
0.3876418, 1.73542, 1.740134, 1, 0, 0, 1, 1,
0.3935676, -1.792701, 3.495043, 1, 0, 0, 1, 1,
0.3984142, 1.467826, -0.3554285, 1, 0, 0, 1, 1,
0.4036371, 0.1328422, 1.846617, 1, 0, 0, 1, 1,
0.4042378, 1.114462, 1.807108, 1, 0, 0, 1, 1,
0.4053871, -0.07617116, 1.785005, 0, 0, 0, 1, 1,
0.4100141, -1.245793, 2.149927, 0, 0, 0, 1, 1,
0.4155532, -1.131065, 2.022306, 0, 0, 0, 1, 1,
0.4201386, -0.5033982, 2.135943, 0, 0, 0, 1, 1,
0.4235854, -0.9312514, 2.538931, 0, 0, 0, 1, 1,
0.4277759, -0.119405, 3.200772, 0, 0, 0, 1, 1,
0.4324713, -1.021, 0.2398661, 0, 0, 0, 1, 1,
0.4328372, -0.2024097, 1.594712, 1, 1, 1, 1, 1,
0.4368859, 0.8869778, -0.6363711, 1, 1, 1, 1, 1,
0.4381561, 1.119065, 2.160223, 1, 1, 1, 1, 1,
0.4414209, 0.6842546, 0.1769595, 1, 1, 1, 1, 1,
0.4436592, 2.106011, -0.9953097, 1, 1, 1, 1, 1,
0.4481496, -2.422032, 2.670518, 1, 1, 1, 1, 1,
0.4484698, -0.3722243, 0.9566367, 1, 1, 1, 1, 1,
0.4490455, 0.2282003, 0.5889947, 1, 1, 1, 1, 1,
0.4507347, 0.0425383, 0.956808, 1, 1, 1, 1, 1,
0.4545933, 0.3864263, 0.7299953, 1, 1, 1, 1, 1,
0.4606279, -0.1901419, 2.592728, 1, 1, 1, 1, 1,
0.4613458, 0.7533711, 0.8841041, 1, 1, 1, 1, 1,
0.4614332, 1.405658, 0.3634789, 1, 1, 1, 1, 1,
0.4695273, -0.214514, 0.9094709, 1, 1, 1, 1, 1,
0.4802237, 1.672693, -1.48079, 1, 1, 1, 1, 1,
0.4838715, 0.2284919, 2.959492, 0, 0, 1, 1, 1,
0.4840497, -0.5886175, 1.940907, 1, 0, 0, 1, 1,
0.4854136, -1.520328, 1.64654, 1, 0, 0, 1, 1,
0.4866283, 0.3781582, 0.1600388, 1, 0, 0, 1, 1,
0.4871565, 0.6466688, 0.4592128, 1, 0, 0, 1, 1,
0.4888003, 0.02156253, 1.555515, 1, 0, 0, 1, 1,
0.4908054, -0.5469804, 3.001312, 0, 0, 0, 1, 1,
0.4929526, 0.413521, 1.460076, 0, 0, 0, 1, 1,
0.4940262, -0.2601966, 1.86746, 0, 0, 0, 1, 1,
0.4976273, -0.8847501, 3.505104, 0, 0, 0, 1, 1,
0.499, -1.780127, 1.688364, 0, 0, 0, 1, 1,
0.5010073, 0.2117972, 0.4296941, 0, 0, 0, 1, 1,
0.5096704, -0.4786167, 2.249065, 0, 0, 0, 1, 1,
0.5139261, -0.1661034, 1.638434, 1, 1, 1, 1, 1,
0.5171394, 0.6365101, 1.085714, 1, 1, 1, 1, 1,
0.5202491, -0.112728, 3.466908, 1, 1, 1, 1, 1,
0.5205289, -1.483478, 2.867248, 1, 1, 1, 1, 1,
0.5252742, -1.243535, 4.027474, 1, 1, 1, 1, 1,
0.5278673, -2.700432, 1.334334, 1, 1, 1, 1, 1,
0.5304629, 0.1012916, -0.1641234, 1, 1, 1, 1, 1,
0.5311531, -0.3728656, 1.499328, 1, 1, 1, 1, 1,
0.5313886, -3.389142, 3.316774, 1, 1, 1, 1, 1,
0.5327212, 1.105986, -1.150172, 1, 1, 1, 1, 1,
0.5348036, 0.95162, 1.310759, 1, 1, 1, 1, 1,
0.5365983, -0.6793504, 1.920862, 1, 1, 1, 1, 1,
0.5440689, -0.637035, 3.251623, 1, 1, 1, 1, 1,
0.5443181, -0.3446333, 3.607557, 1, 1, 1, 1, 1,
0.5477346, 3.046711, -1.547407, 1, 1, 1, 1, 1,
0.5482698, -0.9375929, 1.040677, 0, 0, 1, 1, 1,
0.5491952, -0.5697522, 2.161842, 1, 0, 0, 1, 1,
0.5496061, -0.2789415, 1.924798, 1, 0, 0, 1, 1,
0.5504047, 0.7626878, 1.261679, 1, 0, 0, 1, 1,
0.5533263, -0.3741423, 2.521968, 1, 0, 0, 1, 1,
0.5540454, -1.12968, 3.975912, 1, 0, 0, 1, 1,
0.5563331, -1.599826, 2.748681, 0, 0, 0, 1, 1,
0.5611872, -1.320538, 3.191798, 0, 0, 0, 1, 1,
0.5658757, 1.455729, -0.7937984, 0, 0, 0, 1, 1,
0.5755382, -1.449264, 1.605425, 0, 0, 0, 1, 1,
0.5820329, -0.7402683, 1.457825, 0, 0, 0, 1, 1,
0.5825306, 0.1694898, 0.01208284, 0, 0, 0, 1, 1,
0.5841008, -1.564364, 4.52498, 0, 0, 0, 1, 1,
0.5857475, 1.203926, 0.1753241, 1, 1, 1, 1, 1,
0.5889306, -0.5560167, 1.326361, 1, 1, 1, 1, 1,
0.5951648, 0.3616101, -0.494411, 1, 1, 1, 1, 1,
0.6121404, 0.5620692, 1.343657, 1, 1, 1, 1, 1,
0.6144379, -0.03639918, 1.657058, 1, 1, 1, 1, 1,
0.6149774, 2.208111, 0.6501451, 1, 1, 1, 1, 1,
0.6192248, 1.872513, 1.301148, 1, 1, 1, 1, 1,
0.6192719, -0.6828297, 1.52154, 1, 1, 1, 1, 1,
0.6197054, 0.9523694, 0.447235, 1, 1, 1, 1, 1,
0.6314589, -1.34204, 3.978952, 1, 1, 1, 1, 1,
0.6364755, -0.6614136, 2.914648, 1, 1, 1, 1, 1,
0.6377929, 1.317066, 1.395875, 1, 1, 1, 1, 1,
0.6386296, -1.35546, 1.51532, 1, 1, 1, 1, 1,
0.6395746, -1.125006, 1.899119, 1, 1, 1, 1, 1,
0.6433816, -0.699211, 2.841614, 1, 1, 1, 1, 1,
0.6488929, -1.571312, 2.607068, 0, 0, 1, 1, 1,
0.6517749, 0.4131988, 1.032665, 1, 0, 0, 1, 1,
0.6537969, 1.115575, -0.3911957, 1, 0, 0, 1, 1,
0.6561238, -0.9654653, 3.56365, 1, 0, 0, 1, 1,
0.6578075, 0.2335688, 2.839465, 1, 0, 0, 1, 1,
0.6592631, 0.2166505, 1.113361, 1, 0, 0, 1, 1,
0.6596622, -0.03617613, 2.125275, 0, 0, 0, 1, 1,
0.6672011, 0.4792399, 0.9550487, 0, 0, 0, 1, 1,
0.6688147, -1.699878, 2.732959, 0, 0, 0, 1, 1,
0.6709464, -0.2308427, 3.233504, 0, 0, 0, 1, 1,
0.6763594, -1.490103, 2.270437, 0, 0, 0, 1, 1,
0.681805, 2.21053, 0.981315, 0, 0, 0, 1, 1,
0.6872715, -0.1718516, 1.569709, 0, 0, 0, 1, 1,
0.6937452, -0.5561008, 1.071467, 1, 1, 1, 1, 1,
0.6962361, -1.037345, 3.484566, 1, 1, 1, 1, 1,
0.697078, -1.425116, 2.132812, 1, 1, 1, 1, 1,
0.6975096, 1.106857, 0.516363, 1, 1, 1, 1, 1,
0.6984673, -0.02797945, 2.079697, 1, 1, 1, 1, 1,
0.7090541, -0.8770785, 3.254614, 1, 1, 1, 1, 1,
0.7098389, -0.5168987, 2.473039, 1, 1, 1, 1, 1,
0.7100551, -0.2657247, 4.303542, 1, 1, 1, 1, 1,
0.7116369, 1.555721, 1.562478, 1, 1, 1, 1, 1,
0.7146535, 1.670785, -0.634634, 1, 1, 1, 1, 1,
0.7170334, 1.797417, -0.4030156, 1, 1, 1, 1, 1,
0.717939, -0.9133794, 0.528597, 1, 1, 1, 1, 1,
0.7180445, 0.1834166, 2.040814, 1, 1, 1, 1, 1,
0.7209734, 1.218053, -0.7031413, 1, 1, 1, 1, 1,
0.7213891, -0.2178201, 1.233672, 1, 1, 1, 1, 1,
0.7243593, 0.7330165, -0.1416804, 0, 0, 1, 1, 1,
0.7267313, 1.314533, 1.51552, 1, 0, 0, 1, 1,
0.7325449, -0.6319644, 3.343386, 1, 0, 0, 1, 1,
0.7344489, -0.6177218, 2.898652, 1, 0, 0, 1, 1,
0.7394513, 1.66813, 0.6224149, 1, 0, 0, 1, 1,
0.7414654, -0.9586393, 2.760871, 1, 0, 0, 1, 1,
0.7465532, 0.08624264, 0.2208982, 0, 0, 0, 1, 1,
0.7493305, -0.7341951, 1.989735, 0, 0, 0, 1, 1,
0.7572338, -2.517971, 3.320131, 0, 0, 0, 1, 1,
0.7648413, 2.359256, -0.5905693, 0, 0, 0, 1, 1,
0.7742342, -1.36131, 1.720282, 0, 0, 0, 1, 1,
0.7744929, 0.04419401, 0.8343466, 0, 0, 0, 1, 1,
0.7751867, 0.1346541, 1.027034, 0, 0, 0, 1, 1,
0.7768351, -0.6809438, 1.029004, 1, 1, 1, 1, 1,
0.7783171, -0.3334807, 0.9793742, 1, 1, 1, 1, 1,
0.7805949, 0.563711, 1.334374, 1, 1, 1, 1, 1,
0.783792, -1.474502, 0.9301444, 1, 1, 1, 1, 1,
0.7846891, -0.01863723, 0.8718494, 1, 1, 1, 1, 1,
0.7850851, -0.6350495, 2.301065, 1, 1, 1, 1, 1,
0.7872738, -0.99239, 1.077506, 1, 1, 1, 1, 1,
0.7878643, -0.7662189, 1.944058, 1, 1, 1, 1, 1,
0.7887219, 1.195959, -0.2635209, 1, 1, 1, 1, 1,
0.7928357, 1.573755, 1.056428, 1, 1, 1, 1, 1,
0.7942595, -2.046655, 3.398779, 1, 1, 1, 1, 1,
0.7995707, -0.7820876, 1.158221, 1, 1, 1, 1, 1,
0.8019565, 0.5242819, 2.367715, 1, 1, 1, 1, 1,
0.8029356, -0.751742, 2.564195, 1, 1, 1, 1, 1,
0.8047857, 1.071409, 0.5977854, 1, 1, 1, 1, 1,
0.807771, -0.1557525, 1.988419, 0, 0, 1, 1, 1,
0.8079415, -0.05658382, 0.6633559, 1, 0, 0, 1, 1,
0.8085748, -0.341254, 2.167661, 1, 0, 0, 1, 1,
0.8172366, 0.1564171, 2.241711, 1, 0, 0, 1, 1,
0.8189167, 1.66132, 0.6288477, 1, 0, 0, 1, 1,
0.825563, -0.28481, 2.933735, 1, 0, 0, 1, 1,
0.8322843, -0.05319042, 2.505817, 0, 0, 0, 1, 1,
0.8355027, 0.6760013, 0.5394036, 0, 0, 0, 1, 1,
0.8391895, -1.014952, 3.146979, 0, 0, 0, 1, 1,
0.8441319, -1.564796, 1.958119, 0, 0, 0, 1, 1,
0.8455039, 0.7034705, 1.864824, 0, 0, 0, 1, 1,
0.8474115, -1.013647, 1.778692, 0, 0, 0, 1, 1,
0.8480443, 1.019817, 1.284782, 0, 0, 0, 1, 1,
0.8502771, -0.209035, 3.101456, 1, 1, 1, 1, 1,
0.8600797, -0.7028704, 0.9278634, 1, 1, 1, 1, 1,
0.8671016, -0.6395295, 2.865262, 1, 1, 1, 1, 1,
0.8717305, 2.918822, 1.209323, 1, 1, 1, 1, 1,
0.8720514, 1.315691, 0.2210226, 1, 1, 1, 1, 1,
0.8736554, -0.8842975, 3.543166, 1, 1, 1, 1, 1,
0.8763629, 1.173426, 1.773399, 1, 1, 1, 1, 1,
0.8768544, 1.008226, 0.428951, 1, 1, 1, 1, 1,
0.8773732, 0.3628893, -0.05003615, 1, 1, 1, 1, 1,
0.8814475, 0.744579, 1.195624, 1, 1, 1, 1, 1,
0.8872742, -0.01717076, 3.079657, 1, 1, 1, 1, 1,
0.88903, -1.207244, 2.701464, 1, 1, 1, 1, 1,
0.8927172, -1.548782, 3.520361, 1, 1, 1, 1, 1,
0.9035611, 0.8450742, 0.2349308, 1, 1, 1, 1, 1,
0.9073616, -0.7511091, 1.464911, 1, 1, 1, 1, 1,
0.9176276, 0.5092466, 3.007856, 0, 0, 1, 1, 1,
0.9218272, 0.8515674, 1.001427, 1, 0, 0, 1, 1,
0.9259815, -0.1618128, 1.070642, 1, 0, 0, 1, 1,
0.9327094, -0.1320654, 2.647373, 1, 0, 0, 1, 1,
0.9387504, 0.4813046, -0.620492, 1, 0, 0, 1, 1,
0.939518, 1.892339, 0.711889, 1, 0, 0, 1, 1,
0.9398215, 1.064959, 0.5185307, 0, 0, 0, 1, 1,
0.9422765, -1.056097, 2.16197, 0, 0, 0, 1, 1,
0.9463412, -0.2776701, 2.196998, 0, 0, 0, 1, 1,
0.946448, -1.179762, 1.600101, 0, 0, 0, 1, 1,
0.9467155, 0.9293075, 1.009752, 0, 0, 0, 1, 1,
0.9469309, -1.243426, 2.531108, 0, 0, 0, 1, 1,
0.9505262, 2.267441, 1.109712, 0, 0, 0, 1, 1,
0.9566563, -0.5145572, 1.110625, 1, 1, 1, 1, 1,
0.9591739, 0.5714763, 1.254365, 1, 1, 1, 1, 1,
0.9615346, 0.5933704, 0.585337, 1, 1, 1, 1, 1,
0.9704358, 1.088514, 0.8486589, 1, 1, 1, 1, 1,
0.9751656, -0.09305255, 0.6139776, 1, 1, 1, 1, 1,
0.9847687, -0.1285661, -0.2479501, 1, 1, 1, 1, 1,
0.9938509, -0.3835675, 0.02235851, 1, 1, 1, 1, 1,
1.004933, 0.8772337, 1.61028, 1, 1, 1, 1, 1,
1.005036, -2.89221, 2.970071, 1, 1, 1, 1, 1,
1.005095, -1.110549, 3.895346, 1, 1, 1, 1, 1,
1.011902, 1.661976, 0.3341052, 1, 1, 1, 1, 1,
1.012248, -1.342734, 3.641079, 1, 1, 1, 1, 1,
1.015818, -1.54677, 1.643774, 1, 1, 1, 1, 1,
1.019642, 0.7095816, 1.789958, 1, 1, 1, 1, 1,
1.020028, 0.8084397, 0.8228629, 1, 1, 1, 1, 1,
1.03433, 2.290654, 0.7229764, 0, 0, 1, 1, 1,
1.034845, -1.055703, 2.771222, 1, 0, 0, 1, 1,
1.035226, 0.5003878, 0.98559, 1, 0, 0, 1, 1,
1.040607, -0.1044088, -0.9408523, 1, 0, 0, 1, 1,
1.041518, 1.125887, 2.1725, 1, 0, 0, 1, 1,
1.057519, -1.215191, 2.843015, 1, 0, 0, 1, 1,
1.059729, -0.5170537, 2.410153, 0, 0, 0, 1, 1,
1.059997, -1.485875, 3.434204, 0, 0, 0, 1, 1,
1.069668, 1.379048, 0.6609776, 0, 0, 0, 1, 1,
1.074668, -0.6732852, 2.43357, 0, 0, 0, 1, 1,
1.075694, 0.5411376, 0.7967896, 0, 0, 0, 1, 1,
1.076339, 0.9421504, 1.149217, 0, 0, 0, 1, 1,
1.081707, -0.3535905, 3.737828, 0, 0, 0, 1, 1,
1.082355, -0.5429127, 1.681622, 1, 1, 1, 1, 1,
1.087502, 0.6537746, -0.02936985, 1, 1, 1, 1, 1,
1.094729, 0.2090041, 0.4108342, 1, 1, 1, 1, 1,
1.095754, -3.171886, 2.801614, 1, 1, 1, 1, 1,
1.09868, 1.06065, 1.455548, 1, 1, 1, 1, 1,
1.098734, 0.1598871, 0.0001975085, 1, 1, 1, 1, 1,
1.108676, -0.5580752, 2.56563, 1, 1, 1, 1, 1,
1.116924, -1.802348, 2.824989, 1, 1, 1, 1, 1,
1.120007, 0.09960995, -0.5981011, 1, 1, 1, 1, 1,
1.128786, -1.061618, 3.381452, 1, 1, 1, 1, 1,
1.134781, -0.03667982, 3.18714, 1, 1, 1, 1, 1,
1.143552, 0.7076154, 1.150136, 1, 1, 1, 1, 1,
1.145677, 0.0560799, 2.113841, 1, 1, 1, 1, 1,
1.149348, 1.128291, 1.027706, 1, 1, 1, 1, 1,
1.156119, -1.79696, 3.110243, 1, 1, 1, 1, 1,
1.159424, -0.1252079, 0.5038202, 0, 0, 1, 1, 1,
1.173102, -0.5088376, 2.606731, 1, 0, 0, 1, 1,
1.180228, 0.6566827, 2.347238, 1, 0, 0, 1, 1,
1.184728, 0.1418621, 3.020648, 1, 0, 0, 1, 1,
1.186175, -0.7481198, 1.661601, 1, 0, 0, 1, 1,
1.193186, -0.05710598, 0.898558, 1, 0, 0, 1, 1,
1.19408, -0.01924588, 2.812443, 0, 0, 0, 1, 1,
1.201949, -1.779168, 3.929244, 0, 0, 0, 1, 1,
1.203901, -0.9655972, -0.5114064, 0, 0, 0, 1, 1,
1.208022, -1.656788, 2.016618, 0, 0, 0, 1, 1,
1.21655, -0.3753018, 0.2182908, 0, 0, 0, 1, 1,
1.231017, 0.3387061, 2.113896, 0, 0, 0, 1, 1,
1.232765, 0.7158412, 0.3272829, 0, 0, 0, 1, 1,
1.232835, 0.4689403, -0.841174, 1, 1, 1, 1, 1,
1.235575, -2.209864, 4.619458, 1, 1, 1, 1, 1,
1.238679, 1.813275, 1.018464, 1, 1, 1, 1, 1,
1.248591, 0.8935329, 1.155302, 1, 1, 1, 1, 1,
1.253418, 0.7198533, 1.841718, 1, 1, 1, 1, 1,
1.257156, -0.1062429, 2.303065, 1, 1, 1, 1, 1,
1.267527, 0.918527, 1.409405, 1, 1, 1, 1, 1,
1.268958, -2.871021, 2.063391, 1, 1, 1, 1, 1,
1.274719, 0.6376269, 0.08849679, 1, 1, 1, 1, 1,
1.276343, 0.3411505, 1.483393, 1, 1, 1, 1, 1,
1.278379, -0.2357775, 0.9829457, 1, 1, 1, 1, 1,
1.30242, 1.209944, 0.2539994, 1, 1, 1, 1, 1,
1.310885, -0.3928424, 3.339575, 1, 1, 1, 1, 1,
1.312926, -1.486163, 1.17628, 1, 1, 1, 1, 1,
1.320312, 0.392399, 2.348346, 1, 1, 1, 1, 1,
1.328187, -1.062647, 1.418683, 0, 0, 1, 1, 1,
1.343765, -0.9451312, 3.410188, 1, 0, 0, 1, 1,
1.350957, 0.4915082, 1.653408, 1, 0, 0, 1, 1,
1.357907, 0.2951086, 0.2227413, 1, 0, 0, 1, 1,
1.35905, 1.246962, 2.485641, 1, 0, 0, 1, 1,
1.368567, -2.013663, 4.055482, 1, 0, 0, 1, 1,
1.368968, 0.2908304, 0.4973953, 0, 0, 0, 1, 1,
1.372757, 0.7912531, 1.864028, 0, 0, 0, 1, 1,
1.375122, 1.100767, 1.827767, 0, 0, 0, 1, 1,
1.375543, 0.8909354, 0.7301882, 0, 0, 0, 1, 1,
1.376652, -0.5567688, 3.16135, 0, 0, 0, 1, 1,
1.380369, -1.441244, 2.911094, 0, 0, 0, 1, 1,
1.388557, 0.7496162, 1.218729, 0, 0, 0, 1, 1,
1.396012, 0.2820636, 0.7222585, 1, 1, 1, 1, 1,
1.402234, -0.9703848, 3.822025, 1, 1, 1, 1, 1,
1.402551, -0.5586627, 2.447571, 1, 1, 1, 1, 1,
1.408023, -0.006577273, 1.175496, 1, 1, 1, 1, 1,
1.412504, 0.03528345, 0.2391042, 1, 1, 1, 1, 1,
1.415204, -0.7073817, 1.715135, 1, 1, 1, 1, 1,
1.418254, -0.7347656, 1.768783, 1, 1, 1, 1, 1,
1.420921, -0.9257354, 1.381273, 1, 1, 1, 1, 1,
1.437759, -0.9450895, 4.220828, 1, 1, 1, 1, 1,
1.450925, -1.4911, 3.835387, 1, 1, 1, 1, 1,
1.452747, 2.342681, -0.05481991, 1, 1, 1, 1, 1,
1.453711, 1.057525, -0.01310251, 1, 1, 1, 1, 1,
1.456241, 0.2711317, 0.3360197, 1, 1, 1, 1, 1,
1.48291, -1.737943, 2.776819, 1, 1, 1, 1, 1,
1.486975, -0.3270257, 0.1173311, 1, 1, 1, 1, 1,
1.493075, -0.9420804, 0.6504773, 0, 0, 1, 1, 1,
1.494681, 0.2052662, 2.290651, 1, 0, 0, 1, 1,
1.506737, -1.665204, 3.83355, 1, 0, 0, 1, 1,
1.50881, 1.703356, -1.046691, 1, 0, 0, 1, 1,
1.530347, -0.4897648, 1.517176, 1, 0, 0, 1, 1,
1.533915, -1.397054, 3.364035, 1, 0, 0, 1, 1,
1.534769, -0.7376319, 2.520154, 0, 0, 0, 1, 1,
1.548944, -1.187959, 3.335053, 0, 0, 0, 1, 1,
1.549142, 1.625809, 2.430422, 0, 0, 0, 1, 1,
1.554247, -0.09173727, 1.703915, 0, 0, 0, 1, 1,
1.57108, 1.192131, 2.043331, 0, 0, 0, 1, 1,
1.582678, 0.07688655, 1.090552, 0, 0, 0, 1, 1,
1.586482, 0.9931454, 0.7938288, 0, 0, 0, 1, 1,
1.597113, -1.38993, 1.894943, 1, 1, 1, 1, 1,
1.602142, 2.391191, 0.7770697, 1, 1, 1, 1, 1,
1.619065, -2.097181, 3.719252, 1, 1, 1, 1, 1,
1.64094, -0.7328355, 1.655679, 1, 1, 1, 1, 1,
1.642421, -0.2614572, 1.387208, 1, 1, 1, 1, 1,
1.644416, -0.3071735, 1.116615, 1, 1, 1, 1, 1,
1.651402, 2.747593, 0.0808719, 1, 1, 1, 1, 1,
1.661104, -0.7843899, 2.406958, 1, 1, 1, 1, 1,
1.673672, 3.01031, 0.8738697, 1, 1, 1, 1, 1,
1.683591, -1.056291, 1.703175, 1, 1, 1, 1, 1,
1.691111, -0.2491833, 2.36011, 1, 1, 1, 1, 1,
1.70873, 0.6326606, 0.5341452, 1, 1, 1, 1, 1,
1.715092, 1.028874, 1.218723, 1, 1, 1, 1, 1,
1.733954, -0.05517495, 2.669982, 1, 1, 1, 1, 1,
1.743575, 0.4447372, 1.306843, 1, 1, 1, 1, 1,
1.744756, 0.9347493, 1.568634, 0, 0, 1, 1, 1,
1.76281, -0.6311781, 1.605909, 1, 0, 0, 1, 1,
1.765358, -0.9213988, 3.037031, 1, 0, 0, 1, 1,
1.776118, 0.7843553, 0.7112967, 1, 0, 0, 1, 1,
1.778489, 0.4467228, 1.702733, 1, 0, 0, 1, 1,
1.7857, -1.210386, 2.313844, 1, 0, 0, 1, 1,
1.787437, -0.09180559, 0.7513908, 0, 0, 0, 1, 1,
1.803812, -0.8533294, 2.543415, 0, 0, 0, 1, 1,
1.808377, 0.8082919, 1.05544, 0, 0, 0, 1, 1,
1.836331, 1.63172, 0.7936792, 0, 0, 0, 1, 1,
1.840304, -0.5865257, 1.109983, 0, 0, 0, 1, 1,
1.846745, -0.7853456, -0.4227944, 0, 0, 0, 1, 1,
1.855804, -0.07156121, 1.989822, 0, 0, 0, 1, 1,
1.875828, 1.891289, 0.3865055, 1, 1, 1, 1, 1,
1.876183, 0.4474902, 0.6896969, 1, 1, 1, 1, 1,
1.894429, 0.4761921, 0.8292893, 1, 1, 1, 1, 1,
1.925369, -0.6645456, 0.8010507, 1, 1, 1, 1, 1,
1.948953, 1.724793, 2.042068, 1, 1, 1, 1, 1,
1.97356, 1.097699, -1.168308, 1, 1, 1, 1, 1,
1.976781, -1.18061, 0.1709124, 1, 1, 1, 1, 1,
1.984028, 0.874022, 0.7194433, 1, 1, 1, 1, 1,
1.995994, -0.7309349, 1.887533, 1, 1, 1, 1, 1,
2.011225, 0.3160228, 2.456379, 1, 1, 1, 1, 1,
2.042868, -1.282903, 2.40229, 1, 1, 1, 1, 1,
2.058047, -0.3701975, 2.290249, 1, 1, 1, 1, 1,
2.069834, -2.319045, 0.857675, 1, 1, 1, 1, 1,
2.072538, 0.9243683, 1.845663, 1, 1, 1, 1, 1,
2.104006, 0.906557, 1.449245, 1, 1, 1, 1, 1,
2.109531, -0.7707217, 2.383261, 0, 0, 1, 1, 1,
2.111478, -0.8939654, 1.709954, 1, 0, 0, 1, 1,
2.1168, 0.3526774, 0.4993374, 1, 0, 0, 1, 1,
2.167108, 0.05924984, 2.474617, 1, 0, 0, 1, 1,
2.221312, 1.748276, 0.5314437, 1, 0, 0, 1, 1,
2.229892, -1.045671, 2.284558, 1, 0, 0, 1, 1,
2.275126, -1.211974, 2.584882, 0, 0, 0, 1, 1,
2.283513, 0.8120214, 1.806527, 0, 0, 0, 1, 1,
2.311347, 0.253843, 1.553744, 0, 0, 0, 1, 1,
2.353365, -0.1816902, 0.6707228, 0, 0, 0, 1, 1,
2.355387, 1.513974, 0.2725256, 0, 0, 0, 1, 1,
2.397094, -0.3635259, 0.7857955, 0, 0, 0, 1, 1,
2.414907, -0.553192, 2.370585, 0, 0, 0, 1, 1,
2.416984, 0.244063, 1.263693, 1, 1, 1, 1, 1,
2.489337, -0.9811919, 1.400893, 1, 1, 1, 1, 1,
2.512976, 0.2697528, 0.7247835, 1, 1, 1, 1, 1,
2.537048, 0.6683708, 0.556141, 1, 1, 1, 1, 1,
2.547311, -1.737117, 1.745168, 1, 1, 1, 1, 1,
3.004364, 0.6264581, 0.1562864, 1, 1, 1, 1, 1,
3.092214, -1.177273, 2.801904, 1, 1, 1, 1, 1
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
var radius = 9.613899;
var distance = 33.76841;
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
mvMatrix.translate( 0.2335393, 0.1254032, 0.2059369 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.76841);
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
