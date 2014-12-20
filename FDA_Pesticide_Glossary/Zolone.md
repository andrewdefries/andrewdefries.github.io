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
-3.171633, -1.16148, -3.222859, 1, 0, 0, 1,
-3.010786, 0.3938668, -2.263187, 1, 0.007843138, 0, 1,
-2.939437, 0.2143154, -4.108776, 1, 0.01176471, 0, 1,
-2.597223, -0.02886161, -1.717353, 1, 0.01960784, 0, 1,
-2.561868, -2.160445, -2.641285, 1, 0.02352941, 0, 1,
-2.540383, -0.3970329, -3.089103, 1, 0.03137255, 0, 1,
-2.383601, 0.458624, -2.414977, 1, 0.03529412, 0, 1,
-2.355871, 1.056924, -0.5357412, 1, 0.04313726, 0, 1,
-2.35405, 1.842871, -2.291777, 1, 0.04705882, 0, 1,
-2.292546, 1.678523, -3.579038, 1, 0.05490196, 0, 1,
-2.279929, -0.3082199, -0.5837117, 1, 0.05882353, 0, 1,
-2.201139, 0.7436798, -1.271187, 1, 0.06666667, 0, 1,
-2.162312, 1.126857, -1.027409, 1, 0.07058824, 0, 1,
-2.064266, 0.8343825, -0.9687402, 1, 0.07843138, 0, 1,
-2.049726, -0.04032674, -0.4437357, 1, 0.08235294, 0, 1,
-2.019642, 0.9375752, -2.161328, 1, 0.09019608, 0, 1,
-1.999426, -0.301359, -1.091748, 1, 0.09411765, 0, 1,
-1.967057, 0.8825905, 0.4622212, 1, 0.1019608, 0, 1,
-1.957506, -0.8690385, -2.154657, 1, 0.1098039, 0, 1,
-1.942558, 1.428861, -0.659312, 1, 0.1137255, 0, 1,
-1.890749, 0.8175417, -0.6205747, 1, 0.1215686, 0, 1,
-1.887111, -0.7373559, -3.280827, 1, 0.1254902, 0, 1,
-1.883883, -0.4417679, -2.073286, 1, 0.1333333, 0, 1,
-1.852765, -0.1084298, -2.033684, 1, 0.1372549, 0, 1,
-1.794015, -0.03295708, -1.862261, 1, 0.145098, 0, 1,
-1.792818, 0.9579398, 0.2983197, 1, 0.1490196, 0, 1,
-1.754684, 1.043442, -1.075742, 1, 0.1568628, 0, 1,
-1.748771, -1.809021, -2.471857, 1, 0.1607843, 0, 1,
-1.742127, -0.6529045, -2.963204, 1, 0.1686275, 0, 1,
-1.725117, -0.7588677, -1.996682, 1, 0.172549, 0, 1,
-1.721521, 0.3614186, -1.990496, 1, 0.1803922, 0, 1,
-1.716946, 0.5978326, 0.01723218, 1, 0.1843137, 0, 1,
-1.711582, 0.2457383, -1.243844, 1, 0.1921569, 0, 1,
-1.703607, -1.533929, -1.944759, 1, 0.1960784, 0, 1,
-1.697828, 1.263551, -0.4523077, 1, 0.2039216, 0, 1,
-1.695892, 0.1558696, -1.258634, 1, 0.2117647, 0, 1,
-1.691051, 0.7643546, -1.558505, 1, 0.2156863, 0, 1,
-1.679445, -0.4617645, -1.103441, 1, 0.2235294, 0, 1,
-1.640086, -1.377877, -2.605338, 1, 0.227451, 0, 1,
-1.627394, 0.6640719, -0.8401139, 1, 0.2352941, 0, 1,
-1.625038, -0.5638737, -2.199748, 1, 0.2392157, 0, 1,
-1.617441, 0.4988458, -0.7722833, 1, 0.2470588, 0, 1,
-1.596929, 1.760637, -0.783223, 1, 0.2509804, 0, 1,
-1.591762, -1.844488, -2.038915, 1, 0.2588235, 0, 1,
-1.587499, 0.849839, -0.5562206, 1, 0.2627451, 0, 1,
-1.586273, -0.1722006, -0.4551474, 1, 0.2705882, 0, 1,
-1.581083, 0.4748167, -1.58152, 1, 0.2745098, 0, 1,
-1.577219, 0.4884805, -1.612544, 1, 0.282353, 0, 1,
-1.564708, -0.2334896, -0.3772045, 1, 0.2862745, 0, 1,
-1.554938, 1.132463, -2.67963, 1, 0.2941177, 0, 1,
-1.548942, -0.09729378, -1.578868, 1, 0.3019608, 0, 1,
-1.546413, 1.156623, 0.3269346, 1, 0.3058824, 0, 1,
-1.53178, 0.4850489, -0.7686586, 1, 0.3137255, 0, 1,
-1.513759, -0.2446992, -1.523758, 1, 0.3176471, 0, 1,
-1.487785, -0.5194219, -2.235249, 1, 0.3254902, 0, 1,
-1.48401, 0.7421001, -2.186979, 1, 0.3294118, 0, 1,
-1.472741, -1.355633, -1.982927, 1, 0.3372549, 0, 1,
-1.463265, 0.4711366, -1.114012, 1, 0.3411765, 0, 1,
-1.44738, -0.2835506, -2.872026, 1, 0.3490196, 0, 1,
-1.429424, 2.307778, -2.694183, 1, 0.3529412, 0, 1,
-1.420841, 0.06508654, -2.32253, 1, 0.3607843, 0, 1,
-1.407401, 1.924277, 0.8921258, 1, 0.3647059, 0, 1,
-1.401947, -1.97052, -1.909352, 1, 0.372549, 0, 1,
-1.38673, 0.3354151, -2.533478, 1, 0.3764706, 0, 1,
-1.38384, 0.6166304, 0.4548801, 1, 0.3843137, 0, 1,
-1.376506, -0.1325162, -1.904307, 1, 0.3882353, 0, 1,
-1.368918, 0.8970037, -1.568309, 1, 0.3960784, 0, 1,
-1.368161, 1.340187, -1.149335, 1, 0.4039216, 0, 1,
-1.365952, 0.7817822, -1.180324, 1, 0.4078431, 0, 1,
-1.362169, 0.3452809, -1.547757, 1, 0.4156863, 0, 1,
-1.331923, 0.8065665, 0.02194233, 1, 0.4196078, 0, 1,
-1.330768, 0.7135457, -0.3106565, 1, 0.427451, 0, 1,
-1.323165, -0.9171945, -4.040516, 1, 0.4313726, 0, 1,
-1.316074, -0.5489118, 0.4681498, 1, 0.4392157, 0, 1,
-1.306077, 0.5020021, -0.1518387, 1, 0.4431373, 0, 1,
-1.304346, 1.319291, 0.01474996, 1, 0.4509804, 0, 1,
-1.30156, -0.2273132, -1.842806, 1, 0.454902, 0, 1,
-1.299421, 0.4357196, -1.255512, 1, 0.4627451, 0, 1,
-1.299022, -0.6552098, -0.7331505, 1, 0.4666667, 0, 1,
-1.291712, 0.2188177, -1.086212, 1, 0.4745098, 0, 1,
-1.290776, -0.3274027, 0.1231706, 1, 0.4784314, 0, 1,
-1.274418, 0.003594395, -1.750661, 1, 0.4862745, 0, 1,
-1.270487, 0.1144902, -2.063626, 1, 0.4901961, 0, 1,
-1.261899, 1.172845, 0.1812705, 1, 0.4980392, 0, 1,
-1.25465, -0.01643501, -2.67545, 1, 0.5058824, 0, 1,
-1.247307, 0.5761636, -2.353237, 1, 0.509804, 0, 1,
-1.242434, -0.4048574, -1.353567, 1, 0.5176471, 0, 1,
-1.225618, -1.263244, -3.194101, 1, 0.5215687, 0, 1,
-1.223285, -0.767647, -3.073788, 1, 0.5294118, 0, 1,
-1.209151, -0.7044787, -3.474004, 1, 0.5333334, 0, 1,
-1.204117, -0.7829475, -2.445928, 1, 0.5411765, 0, 1,
-1.203106, -1.045693, -3.665523, 1, 0.5450981, 0, 1,
-1.195135, -1.734572, -4.12676, 1, 0.5529412, 0, 1,
-1.194026, 1.02076, -0.712589, 1, 0.5568628, 0, 1,
-1.192854, -0.5619444, -2.473903, 1, 0.5647059, 0, 1,
-1.191608, -1.030831, -1.214681, 1, 0.5686275, 0, 1,
-1.185889, -0.1219939, -1.062545, 1, 0.5764706, 0, 1,
-1.180926, -1.489387, -3.199691, 1, 0.5803922, 0, 1,
-1.178116, 1.284644, -0.1757915, 1, 0.5882353, 0, 1,
-1.176803, -1.384781, -0.9004404, 1, 0.5921569, 0, 1,
-1.175222, 0.07503384, -2.17081, 1, 0.6, 0, 1,
-1.16567, -0.9413399, -3.050503, 1, 0.6078432, 0, 1,
-1.15811, 0.1406978, -2.189133, 1, 0.6117647, 0, 1,
-1.151632, 1.086535, -0.8415252, 1, 0.6196079, 0, 1,
-1.143693, -1.801545, -2.377058, 1, 0.6235294, 0, 1,
-1.138934, 1.190614, -1.878271, 1, 0.6313726, 0, 1,
-1.133638, -0.7188864, -1.838188, 1, 0.6352941, 0, 1,
-1.127547, 0.8714894, -0.8687362, 1, 0.6431373, 0, 1,
-1.124969, -0.5319218, -3.644423, 1, 0.6470588, 0, 1,
-1.114228, -0.1652094, -1.44629, 1, 0.654902, 0, 1,
-1.101128, 0.2406886, -0.4917966, 1, 0.6588235, 0, 1,
-1.09386, -0.2590637, -1.101994, 1, 0.6666667, 0, 1,
-1.062422, -0.4308956, 0.001945693, 1, 0.6705883, 0, 1,
-1.062146, -1.080425, -3.867978, 1, 0.6784314, 0, 1,
-1.053407, -0.8257334, -2.161404, 1, 0.682353, 0, 1,
-1.050006, -0.1482352, -1.110306, 1, 0.6901961, 0, 1,
-1.04882, 1.294251, -1.047435, 1, 0.6941177, 0, 1,
-1.048702, 2.227803, 0.2597181, 1, 0.7019608, 0, 1,
-1.048041, -1.343177, -1.826424, 1, 0.7098039, 0, 1,
-1.047191, -1.643573, -2.409319, 1, 0.7137255, 0, 1,
-1.04577, -1.825583, -2.259466, 1, 0.7215686, 0, 1,
-1.036253, 0.4446856, 0.1006158, 1, 0.7254902, 0, 1,
-1.032519, -0.4409689, -1.51654, 1, 0.7333333, 0, 1,
-1.032228, 0.840196, -1.734614, 1, 0.7372549, 0, 1,
-1.030169, 0.268425, -3.1764, 1, 0.7450981, 0, 1,
-1.029663, -0.09076272, -1.33241, 1, 0.7490196, 0, 1,
-1.028286, 0.2786391, -0.5478388, 1, 0.7568628, 0, 1,
-1.021162, 1.007733, -1.157057, 1, 0.7607843, 0, 1,
-0.9972428, -0.63544, -2.621043, 1, 0.7686275, 0, 1,
-0.9969512, 0.9802644, -1.090203, 1, 0.772549, 0, 1,
-0.9936993, -0.02462811, -4.171263, 1, 0.7803922, 0, 1,
-0.9901956, -0.4553166, -1.236362, 1, 0.7843137, 0, 1,
-0.9877657, 0.836131, -2.216032, 1, 0.7921569, 0, 1,
-0.9872636, 0.9424584, -0.2073327, 1, 0.7960784, 0, 1,
-0.9838682, 0.8611467, -1.018409, 1, 0.8039216, 0, 1,
-0.9830027, 0.5334229, -0.1664198, 1, 0.8117647, 0, 1,
-0.9818994, -0.3653016, -2.672115, 1, 0.8156863, 0, 1,
-0.9814595, 1.195642, 0.9760788, 1, 0.8235294, 0, 1,
-0.96994, -0.4636606, -1.476834, 1, 0.827451, 0, 1,
-0.9683784, -1.304301, -2.962111, 1, 0.8352941, 0, 1,
-0.9672589, 0.5552133, -2.029589, 1, 0.8392157, 0, 1,
-0.9523341, 0.1503899, -1.986333, 1, 0.8470588, 0, 1,
-0.9488736, 1.829528, 0.1923496, 1, 0.8509804, 0, 1,
-0.937693, 0.8949449, -0.0197741, 1, 0.8588235, 0, 1,
-0.9370355, -0.1900073, -2.944613, 1, 0.8627451, 0, 1,
-0.9362978, 1.915694, 0.02053559, 1, 0.8705882, 0, 1,
-0.933897, -0.4200564, -3.236795, 1, 0.8745098, 0, 1,
-0.9268241, 1.059501, -0.6438227, 1, 0.8823529, 0, 1,
-0.9265507, -0.4070168, -3.407327, 1, 0.8862745, 0, 1,
-0.9141096, -0.4714096, -2.096097, 1, 0.8941177, 0, 1,
-0.9104566, 0.254951, -2.127532, 1, 0.8980392, 0, 1,
-0.9080474, 0.9915309, 0.4563648, 1, 0.9058824, 0, 1,
-0.9075761, 0.3285967, -0.9701753, 1, 0.9137255, 0, 1,
-0.906598, -0.9960375, -1.238305, 1, 0.9176471, 0, 1,
-0.9046119, 0.2266231, -2.559654, 1, 0.9254902, 0, 1,
-0.8983934, -0.003173062, -0.7455446, 1, 0.9294118, 0, 1,
-0.8869845, 0.387584, -0.5814948, 1, 0.9372549, 0, 1,
-0.8741144, -1.316096, -3.345917, 1, 0.9411765, 0, 1,
-0.8694175, -0.9069656, -4.556371, 1, 0.9490196, 0, 1,
-0.868395, -0.07325436, -0.4579915, 1, 0.9529412, 0, 1,
-0.8677019, -2.442248, -2.667695, 1, 0.9607843, 0, 1,
-0.8674576, 0.1732619, -0.7882481, 1, 0.9647059, 0, 1,
-0.863966, 0.9966075, -2.175076, 1, 0.972549, 0, 1,
-0.863072, 0.5035197, -1.861305, 1, 0.9764706, 0, 1,
-0.8542514, 0.9060784, 0.5968965, 1, 0.9843137, 0, 1,
-0.8540276, -1.397793, -2.181165, 1, 0.9882353, 0, 1,
-0.850706, -1.790247, -1.989824, 1, 0.9960784, 0, 1,
-0.8495374, -0.5602223, -3.013874, 0.9960784, 1, 0, 1,
-0.8459542, 0.2371431, -2.42845, 0.9921569, 1, 0, 1,
-0.8427223, -1.065084, -1.536228, 0.9843137, 1, 0, 1,
-0.8389239, -0.654739, -0.5276248, 0.9803922, 1, 0, 1,
-0.8384171, 0.3725363, -0.3666262, 0.972549, 1, 0, 1,
-0.8368757, 0.8153239, -0.1805101, 0.9686275, 1, 0, 1,
-0.8297048, 2.034495, -1.918368, 0.9607843, 1, 0, 1,
-0.8291574, 1.909676, 0.9248084, 0.9568627, 1, 0, 1,
-0.8199581, 1.110726, 0.04331492, 0.9490196, 1, 0, 1,
-0.8198127, -1.930029, -3.291265, 0.945098, 1, 0, 1,
-0.8146638, -0.5197154, -2.3186, 0.9372549, 1, 0, 1,
-0.8110939, -0.07129464, -2.172456, 0.9333333, 1, 0, 1,
-0.8100641, 2.357322, -2.140868, 0.9254902, 1, 0, 1,
-0.8073574, -0.3260254, -0.3945544, 0.9215686, 1, 0, 1,
-0.8059186, 0.2379161, 0.07395875, 0.9137255, 1, 0, 1,
-0.8047438, 0.1188212, -2.12872, 0.9098039, 1, 0, 1,
-0.8010637, -0.380664, -1.859477, 0.9019608, 1, 0, 1,
-0.7968602, 1.500909, -0.4887145, 0.8941177, 1, 0, 1,
-0.7946962, -2.363413, -4.200433, 0.8901961, 1, 0, 1,
-0.7938352, 0.1490439, -0.9679425, 0.8823529, 1, 0, 1,
-0.7898435, 0.2597094, -1.691402, 0.8784314, 1, 0, 1,
-0.7880181, 1.404081, -0.4720367, 0.8705882, 1, 0, 1,
-0.7860019, -1.878117, -3.886261, 0.8666667, 1, 0, 1,
-0.7815579, 0.6554235, -1.879776, 0.8588235, 1, 0, 1,
-0.7732619, 0.5740777, -0.5388644, 0.854902, 1, 0, 1,
-0.772306, -0.4452489, -0.566348, 0.8470588, 1, 0, 1,
-0.7697346, -0.6812256, -1.902974, 0.8431373, 1, 0, 1,
-0.7694639, 1.114249, -0.05943516, 0.8352941, 1, 0, 1,
-0.7622678, -0.1903268, -3.103454, 0.8313726, 1, 0, 1,
-0.7609335, -1.294362, -2.92016, 0.8235294, 1, 0, 1,
-0.7576333, 0.392287, -1.603036, 0.8196079, 1, 0, 1,
-0.7453308, 1.334303, -0.3941063, 0.8117647, 1, 0, 1,
-0.7427397, -1.818688, -2.603409, 0.8078431, 1, 0, 1,
-0.740779, 1.028326, 0.07620373, 0.8, 1, 0, 1,
-0.7394007, 1.009216, -1.270394, 0.7921569, 1, 0, 1,
-0.7383385, 0.999634, 0.2762138, 0.7882353, 1, 0, 1,
-0.7379523, 1.975658, -0.248405, 0.7803922, 1, 0, 1,
-0.7361431, 1.212415, -1.642048, 0.7764706, 1, 0, 1,
-0.7351472, 1.265144, -0.3828857, 0.7686275, 1, 0, 1,
-0.7270892, -0.2075001, -2.179657, 0.7647059, 1, 0, 1,
-0.7218897, 0.4797002, -1.467297, 0.7568628, 1, 0, 1,
-0.7158688, -0.9674109, -3.86196, 0.7529412, 1, 0, 1,
-0.7127002, 0.6928437, -0.7882115, 0.7450981, 1, 0, 1,
-0.7110568, -0.6212505, -2.408584, 0.7411765, 1, 0, 1,
-0.7054679, -0.2264259, -0.8953863, 0.7333333, 1, 0, 1,
-0.7031196, 0.6761482, -1.692034, 0.7294118, 1, 0, 1,
-0.6997235, -0.4705901, -3.970686, 0.7215686, 1, 0, 1,
-0.6992416, -1.725094, -3.498215, 0.7176471, 1, 0, 1,
-0.6961263, 0.08800631, -0.6645277, 0.7098039, 1, 0, 1,
-0.6911993, -0.6153421, -1.959344, 0.7058824, 1, 0, 1,
-0.6890358, -0.9458421, -5.216971, 0.6980392, 1, 0, 1,
-0.6825633, 0.3212935, -0.06135761, 0.6901961, 1, 0, 1,
-0.6790465, -1.023168, -4.338106, 0.6862745, 1, 0, 1,
-0.6745538, 1.323172, -0.619128, 0.6784314, 1, 0, 1,
-0.6706142, -0.7168237, -2.785115, 0.6745098, 1, 0, 1,
-0.6625459, -0.7350571, -2.914125, 0.6666667, 1, 0, 1,
-0.6620969, -0.1677405, -1.523633, 0.6627451, 1, 0, 1,
-0.6613122, 0.4968952, 1.055898, 0.654902, 1, 0, 1,
-0.6612853, 0.4669447, -2.710939, 0.6509804, 1, 0, 1,
-0.6600184, -0.9173197, -3.367373, 0.6431373, 1, 0, 1,
-0.6596041, -1.455474, -2.259121, 0.6392157, 1, 0, 1,
-0.6574352, 0.01793885, -2.505671, 0.6313726, 1, 0, 1,
-0.6562566, 0.09496377, -1.693642, 0.627451, 1, 0, 1,
-0.6551079, 0.2300831, 0.4054512, 0.6196079, 1, 0, 1,
-0.6533382, -1.45695, -3.612024, 0.6156863, 1, 0, 1,
-0.6528481, -0.965305, -1.504301, 0.6078432, 1, 0, 1,
-0.648618, -2.328199, -5.359427, 0.6039216, 1, 0, 1,
-0.6382282, 1.879959, 0.4131739, 0.5960785, 1, 0, 1,
-0.6335454, -0.6151198, -1.157271, 0.5882353, 1, 0, 1,
-0.6260048, -0.27437, -3.367157, 0.5843138, 1, 0, 1,
-0.6207109, 0.6903446, 1.057224, 0.5764706, 1, 0, 1,
-0.6131287, 0.4042824, -2.12436, 0.572549, 1, 0, 1,
-0.6127568, -0.3230569, -1.964129, 0.5647059, 1, 0, 1,
-0.6110156, 1.085756, -1.055129, 0.5607843, 1, 0, 1,
-0.6088991, 0.1049958, -2.025904, 0.5529412, 1, 0, 1,
-0.6078147, 1.516506, -0.2171329, 0.5490196, 1, 0, 1,
-0.6069601, 0.6321692, -1.955836, 0.5411765, 1, 0, 1,
-0.6048652, -0.3658457, -1.471257, 0.5372549, 1, 0, 1,
-0.6046278, 0.3781253, -0.2359268, 0.5294118, 1, 0, 1,
-0.604102, -1.148557, -1.956546, 0.5254902, 1, 0, 1,
-0.6009742, 0.06279702, -2.677524, 0.5176471, 1, 0, 1,
-0.598895, -1.624081, -4.211248, 0.5137255, 1, 0, 1,
-0.5915191, 1.900655, -1.517009, 0.5058824, 1, 0, 1,
-0.5773596, 0.3842928, -0.2351996, 0.5019608, 1, 0, 1,
-0.5767348, -0.01094406, -3.196987, 0.4941176, 1, 0, 1,
-0.5749671, -0.2164915, -0.4340821, 0.4862745, 1, 0, 1,
-0.5748506, 0.03271852, 0.1425966, 0.4823529, 1, 0, 1,
-0.5736165, -0.08251037, -0.1921705, 0.4745098, 1, 0, 1,
-0.5732706, -0.8081838, -2.681082, 0.4705882, 1, 0, 1,
-0.571363, 0.6147287, -0.4474302, 0.4627451, 1, 0, 1,
-0.5695442, -0.8713472, -3.23153, 0.4588235, 1, 0, 1,
-0.5695384, 0.3180366, -0.424949, 0.4509804, 1, 0, 1,
-0.5688022, -0.6033442, -2.626754, 0.4470588, 1, 0, 1,
-0.564733, 0.3204188, -2.184252, 0.4392157, 1, 0, 1,
-0.5644244, -0.9785107, -3.228706, 0.4352941, 1, 0, 1,
-0.5639057, 0.01056889, -1.844358, 0.427451, 1, 0, 1,
-0.5633056, 0.4073334, -1.502789, 0.4235294, 1, 0, 1,
-0.5629341, 0.6788795, -3.402265, 0.4156863, 1, 0, 1,
-0.5608459, -0.8104765, -2.177529, 0.4117647, 1, 0, 1,
-0.5591081, 1.519396, -0.7613263, 0.4039216, 1, 0, 1,
-0.5531257, 0.1606951, -1.341185, 0.3960784, 1, 0, 1,
-0.5418025, -0.238523, -3.310673, 0.3921569, 1, 0, 1,
-0.5368184, 0.9463839, -1.34058, 0.3843137, 1, 0, 1,
-0.5328469, -1.449402, -1.291962, 0.3803922, 1, 0, 1,
-0.5316349, -0.06288166, -0.5124043, 0.372549, 1, 0, 1,
-0.5292079, 0.4165177, -1.031209, 0.3686275, 1, 0, 1,
-0.5284779, -0.5657399, -3.582069, 0.3607843, 1, 0, 1,
-0.5245609, 0.720336, -0.8948871, 0.3568628, 1, 0, 1,
-0.5244704, 0.09244851, -0.3197468, 0.3490196, 1, 0, 1,
-0.5170407, 0.2319316, -0.7048417, 0.345098, 1, 0, 1,
-0.5153418, -0.1591397, -2.096414, 0.3372549, 1, 0, 1,
-0.5119215, 0.9133838, -1.245775, 0.3333333, 1, 0, 1,
-0.5104359, -1.354147, -2.977988, 0.3254902, 1, 0, 1,
-0.5069695, -0.3439378, -1.279929, 0.3215686, 1, 0, 1,
-0.5039108, -0.2914477, -1.751544, 0.3137255, 1, 0, 1,
-0.4986995, 0.6592262, 0.9027994, 0.3098039, 1, 0, 1,
-0.4972667, -1.373113, -2.246438, 0.3019608, 1, 0, 1,
-0.4920026, -0.7541801, -3.555716, 0.2941177, 1, 0, 1,
-0.4878761, -0.3977789, -3.549987, 0.2901961, 1, 0, 1,
-0.4874812, 1.069308, -0.4347133, 0.282353, 1, 0, 1,
-0.4862382, -1.189127, -3.221904, 0.2784314, 1, 0, 1,
-0.4832687, 0.6563141, -2.123019, 0.2705882, 1, 0, 1,
-0.4742038, 0.04236208, -2.897677, 0.2666667, 1, 0, 1,
-0.4724461, 0.1716672, 0.3411602, 0.2588235, 1, 0, 1,
-0.4716072, 2.224747, -0.5175707, 0.254902, 1, 0, 1,
-0.4697111, 0.1022461, -4.000132, 0.2470588, 1, 0, 1,
-0.4691603, 0.4044726, 0.85877, 0.2431373, 1, 0, 1,
-0.4690729, 0.1303684, 0.8329562, 0.2352941, 1, 0, 1,
-0.4664207, -0.112059, -3.310997, 0.2313726, 1, 0, 1,
-0.4651478, 1.044094, -1.131818, 0.2235294, 1, 0, 1,
-0.4525642, -0.08534207, -1.018732, 0.2196078, 1, 0, 1,
-0.450515, 0.9185309, -0.6255879, 0.2117647, 1, 0, 1,
-0.4446535, 0.3728536, -1.782318, 0.2078431, 1, 0, 1,
-0.4446051, 1.556506, -0.8393657, 0.2, 1, 0, 1,
-0.4444088, -1.140574, -2.277587, 0.1921569, 1, 0, 1,
-0.4435108, 1.007874, -1.393486, 0.1882353, 1, 0, 1,
-0.4427472, 1.207151, -0.3548432, 0.1803922, 1, 0, 1,
-0.440823, 0.9246316, 0.1006508, 0.1764706, 1, 0, 1,
-0.4378774, 0.8530658, -1.95985, 0.1686275, 1, 0, 1,
-0.4331602, -0.5251642, -3.917334, 0.1647059, 1, 0, 1,
-0.4329062, 0.3839939, 0.1107729, 0.1568628, 1, 0, 1,
-0.4316659, -0.7757843, -1.570336, 0.1529412, 1, 0, 1,
-0.4280223, -1.428642, -3.716742, 0.145098, 1, 0, 1,
-0.4266591, -1.566007, -3.295714, 0.1411765, 1, 0, 1,
-0.4241567, -0.2290381, -3.490162, 0.1333333, 1, 0, 1,
-0.421091, -0.8084159, -4.785322, 0.1294118, 1, 0, 1,
-0.4197957, 0.3886709, -1.315919, 0.1215686, 1, 0, 1,
-0.418173, -1.239514, -2.507608, 0.1176471, 1, 0, 1,
-0.4146156, -0.1289439, -1.057984, 0.1098039, 1, 0, 1,
-0.4134651, -0.2994228, -3.57321, 0.1058824, 1, 0, 1,
-0.4124626, 1.255268, -0.5861683, 0.09803922, 1, 0, 1,
-0.4101137, -0.04905442, -2.127409, 0.09019608, 1, 0, 1,
-0.409159, -0.8712565, -4.440692, 0.08627451, 1, 0, 1,
-0.4027519, 0.5055127, -0.831257, 0.07843138, 1, 0, 1,
-0.4023641, -0.6138634, -0.5149739, 0.07450981, 1, 0, 1,
-0.4004034, -0.9293764, -1.674959, 0.06666667, 1, 0, 1,
-0.3952811, -0.3147027, -1.407783, 0.0627451, 1, 0, 1,
-0.3880107, -0.9120073, -2.437398, 0.05490196, 1, 0, 1,
-0.3878944, 0.9089008, -0.8342926, 0.05098039, 1, 0, 1,
-0.375495, 1.105219, -1.39341, 0.04313726, 1, 0, 1,
-0.3753629, -2.029053, -0.6231242, 0.03921569, 1, 0, 1,
-0.374373, 1.318222, 0.9517695, 0.03137255, 1, 0, 1,
-0.3731081, 0.4623681, -0.2801492, 0.02745098, 1, 0, 1,
-0.3649257, 0.5676948, -0.8072151, 0.01960784, 1, 0, 1,
-0.3515077, -1.52202, -4.226925, 0.01568628, 1, 0, 1,
-0.346605, 1.168866, -1.612296, 0.007843138, 1, 0, 1,
-0.344966, -1.275801, -1.63367, 0.003921569, 1, 0, 1,
-0.3405035, 2.730271, 0.6148316, 0, 1, 0.003921569, 1,
-0.3387454, -0.0376692, -0.3210947, 0, 1, 0.01176471, 1,
-0.3373073, -2.848074, -2.464872, 0, 1, 0.01568628, 1,
-0.3343717, -2.130858, -3.859648, 0, 1, 0.02352941, 1,
-0.3313309, 1.102969, -1.155224, 0, 1, 0.02745098, 1,
-0.3305349, 0.767541, -2.11361, 0, 1, 0.03529412, 1,
-0.3284054, -2.209788, -2.900987, 0, 1, 0.03921569, 1,
-0.3223955, 1.09223, 1.361125, 0, 1, 0.04705882, 1,
-0.3121125, 0.1504368, -1.324328, 0, 1, 0.05098039, 1,
-0.3071572, 0.846, 0.1576833, 0, 1, 0.05882353, 1,
-0.306981, 0.04423463, 0.4049831, 0, 1, 0.0627451, 1,
-0.3044302, -1.189098, -3.49405, 0, 1, 0.07058824, 1,
-0.3040828, -0.2233056, -2.546896, 0, 1, 0.07450981, 1,
-0.2987518, -0.06664188, -2.881412, 0, 1, 0.08235294, 1,
-0.2978952, 0.1811366, 0.4732, 0, 1, 0.08627451, 1,
-0.2952931, -0.6633661, -2.063672, 0, 1, 0.09411765, 1,
-0.2924949, 0.2469669, -1.384459, 0, 1, 0.1019608, 1,
-0.2917149, 1.678378, 1.12564, 0, 1, 0.1058824, 1,
-0.2867726, 0.08740854, -1.394772, 0, 1, 0.1137255, 1,
-0.2824211, -0.01839114, -0.017895, 0, 1, 0.1176471, 1,
-0.2821101, 0.9927014, 0.3238911, 0, 1, 0.1254902, 1,
-0.2784514, 0.7102539, 0.1966852, 0, 1, 0.1294118, 1,
-0.2783273, 0.2211688, -2.874675, 0, 1, 0.1372549, 1,
-0.2767289, 0.9545555, -1.57489, 0, 1, 0.1411765, 1,
-0.2723365, 0.1780602, -0.8261701, 0, 1, 0.1490196, 1,
-0.2676149, -1.030609, -3.154455, 0, 1, 0.1529412, 1,
-0.2657359, 0.07832296, -0.9329954, 0, 1, 0.1607843, 1,
-0.2596446, 1.250386, 0.2621395, 0, 1, 0.1647059, 1,
-0.2592635, 0.8400002, 0.9910934, 0, 1, 0.172549, 1,
-0.2587051, -0.5694648, -3.30466, 0, 1, 0.1764706, 1,
-0.2551942, -0.2246688, -3.309089, 0, 1, 0.1843137, 1,
-0.2545708, 1.561142, -0.7182959, 0, 1, 0.1882353, 1,
-0.2526416, 0.305691, 1.329849, 0, 1, 0.1960784, 1,
-0.2516021, -1.161761, -4.681956, 0, 1, 0.2039216, 1,
-0.2489281, -0.1006573, -3.300901, 0, 1, 0.2078431, 1,
-0.2483938, -1.830277, -3.652997, 0, 1, 0.2156863, 1,
-0.2469271, 0.3119462, -1.689192, 0, 1, 0.2196078, 1,
-0.2460452, 0.2948349, -1.603845, 0, 1, 0.227451, 1,
-0.2433479, -0.6529434, -2.168377, 0, 1, 0.2313726, 1,
-0.2418427, -1.685475, -3.945133, 0, 1, 0.2392157, 1,
-0.2254712, -0.285288, -0.7273387, 0, 1, 0.2431373, 1,
-0.2246494, -1.444753, -2.43227, 0, 1, 0.2509804, 1,
-0.2216772, -0.499001, -2.41564, 0, 1, 0.254902, 1,
-0.2207813, -0.6923391, -1.097445, 0, 1, 0.2627451, 1,
-0.218675, -1.420773, -3.685097, 0, 1, 0.2666667, 1,
-0.2176451, -2.179315, -2.474564, 0, 1, 0.2745098, 1,
-0.2173773, -0.568733, -1.757702, 0, 1, 0.2784314, 1,
-0.2159571, -0.1570126, -0.4114715, 0, 1, 0.2862745, 1,
-0.2149284, -1.102356, -1.428449, 0, 1, 0.2901961, 1,
-0.2095705, -1.212507, -3.245318, 0, 1, 0.2980392, 1,
-0.2092777, 0.1454096, -0.6599411, 0, 1, 0.3058824, 1,
-0.2083834, 0.604986, -1.151563, 0, 1, 0.3098039, 1,
-0.2011426, -0.6510022, -1.729462, 0, 1, 0.3176471, 1,
-0.195282, 0.3430049, -0.8675047, 0, 1, 0.3215686, 1,
-0.1938795, 0.4848447, -0.8980385, 0, 1, 0.3294118, 1,
-0.1893303, 1.772849, -0.8609683, 0, 1, 0.3333333, 1,
-0.1882264, -0.969127, -2.05742, 0, 1, 0.3411765, 1,
-0.1848791, -0.1249769, -2.948565, 0, 1, 0.345098, 1,
-0.1842219, -0.4970641, -1.725567, 0, 1, 0.3529412, 1,
-0.1770831, 0.3409472, -0.5009454, 0, 1, 0.3568628, 1,
-0.1758516, 0.1800468, -1.214672, 0, 1, 0.3647059, 1,
-0.1751707, 0.7179614, -0.4356964, 0, 1, 0.3686275, 1,
-0.1747436, 0.3798711, 1.882937, 0, 1, 0.3764706, 1,
-0.1740457, 1.890945, -0.2807093, 0, 1, 0.3803922, 1,
-0.1674411, 1.961551, -0.2359432, 0, 1, 0.3882353, 1,
-0.1541881, 0.3289821, -0.9714565, 0, 1, 0.3921569, 1,
-0.1496206, -1.090895, -2.869364, 0, 1, 0.4, 1,
-0.1491397, 0.9939819, 0.8308779, 0, 1, 0.4078431, 1,
-0.1490192, -1.487495, -3.926369, 0, 1, 0.4117647, 1,
-0.1485078, -0.9416769, -3.535231, 0, 1, 0.4196078, 1,
-0.1465665, -0.5122018, -2.084594, 0, 1, 0.4235294, 1,
-0.1463783, -0.9540977, -2.685279, 0, 1, 0.4313726, 1,
-0.1396977, -0.8997182, -3.47305, 0, 1, 0.4352941, 1,
-0.1383537, -0.5527747, -2.297352, 0, 1, 0.4431373, 1,
-0.1381574, 0.187748, 0.2160569, 0, 1, 0.4470588, 1,
-0.1363253, -0.1495082, -1.580429, 0, 1, 0.454902, 1,
-0.1359744, 1.741427, -0.4679562, 0, 1, 0.4588235, 1,
-0.1342424, -0.7826805, -2.212259, 0, 1, 0.4666667, 1,
-0.1319653, -2.024913, -0.6459166, 0, 1, 0.4705882, 1,
-0.1319225, 0.02940629, -0.2350531, 0, 1, 0.4784314, 1,
-0.131327, -0.5195174, -4.627012, 0, 1, 0.4823529, 1,
-0.122542, -1.888142, -2.585819, 0, 1, 0.4901961, 1,
-0.1193395, -1.888348, -3.290381, 0, 1, 0.4941176, 1,
-0.1185857, 1.526834, 0.3222643, 0, 1, 0.5019608, 1,
-0.1146556, 0.9656743, 0.1910802, 0, 1, 0.509804, 1,
-0.1139233, -0.5858647, -2.804579, 0, 1, 0.5137255, 1,
-0.1109353, -0.09828253, -2.104866, 0, 1, 0.5215687, 1,
-0.1106162, 0.6622331, 0.7376342, 0, 1, 0.5254902, 1,
-0.106767, -0.260826, -3.220645, 0, 1, 0.5333334, 1,
-0.1059071, 1.089544, 0.8111147, 0, 1, 0.5372549, 1,
-0.1045006, -0.1829227, -1.053821, 0, 1, 0.5450981, 1,
-0.1040848, 1.646529, 0.6148052, 0, 1, 0.5490196, 1,
-0.09932355, -0.04412563, -1.31362, 0, 1, 0.5568628, 1,
-0.09634011, -1.689809, -1.734726, 0, 1, 0.5607843, 1,
-0.0915564, 0.06057889, -0.202028, 0, 1, 0.5686275, 1,
-0.08913218, 1.200908, 0.6090365, 0, 1, 0.572549, 1,
-0.08900028, 0.248452, -1.21039, 0, 1, 0.5803922, 1,
-0.08393221, -0.8546603, -4.211246, 0, 1, 0.5843138, 1,
-0.08330555, 2.573797, 0.2119258, 0, 1, 0.5921569, 1,
-0.07887941, 0.5036919, -0.981135, 0, 1, 0.5960785, 1,
-0.07851156, 2.150423, -0.3256601, 0, 1, 0.6039216, 1,
-0.07530658, 0.008546054, 0.327161, 0, 1, 0.6117647, 1,
-0.07455995, -0.7474824, -3.009337, 0, 1, 0.6156863, 1,
-0.07168864, 0.09418155, 0.1745789, 0, 1, 0.6235294, 1,
-0.07153065, 0.4738491, 1.813496, 0, 1, 0.627451, 1,
-0.06796736, 0.4953766, 1.006542, 0, 1, 0.6352941, 1,
-0.06368044, 0.7994288, -0.452031, 0, 1, 0.6392157, 1,
-0.06292887, -0.5794904, -2.260604, 0, 1, 0.6470588, 1,
-0.06263246, 1.244189, -0.1475238, 0, 1, 0.6509804, 1,
-0.05458025, -1.041463, -4.933751, 0, 1, 0.6588235, 1,
-0.05222579, 0.6569772, 0.5908391, 0, 1, 0.6627451, 1,
-0.05208988, 1.244942, 0.251196, 0, 1, 0.6705883, 1,
-0.04912245, -1.272551, -4.327015, 0, 1, 0.6745098, 1,
-0.04868256, -1.853468, -2.642694, 0, 1, 0.682353, 1,
-0.04847428, 1.047554, 1.152393, 0, 1, 0.6862745, 1,
-0.04721307, -1.439291, -3.441062, 0, 1, 0.6941177, 1,
-0.04434218, -1.460699, -1.316823, 0, 1, 0.7019608, 1,
-0.0382814, -0.8892623, -1.452431, 0, 1, 0.7058824, 1,
-0.03675395, -0.2317741, -2.526319, 0, 1, 0.7137255, 1,
-0.03471803, 0.9539815, -0.7601891, 0, 1, 0.7176471, 1,
-0.0306362, 0.3494762, 0.5307204, 0, 1, 0.7254902, 1,
-0.02027525, -0.1774256, -3.732975, 0, 1, 0.7294118, 1,
-0.01988715, 0.00794844, -0.9297981, 0, 1, 0.7372549, 1,
-0.01961898, 0.4238448, -0.6663256, 0, 1, 0.7411765, 1,
-0.01885002, 1.94161, -0.4069806, 0, 1, 0.7490196, 1,
-0.01651721, 0.03971891, -1.816018, 0, 1, 0.7529412, 1,
-0.01367524, 0.290496, 1.011177, 0, 1, 0.7607843, 1,
-0.01080725, -1.271142, -2.507467, 0, 1, 0.7647059, 1,
-0.01061021, 0.1693725, -0.2725394, 0, 1, 0.772549, 1,
-0.01057415, 0.340399, -1.708514, 0, 1, 0.7764706, 1,
-0.009442566, -0.4402785, -3.294514, 0, 1, 0.7843137, 1,
-0.00910957, 0.6243836, 1.024571, 0, 1, 0.7882353, 1,
-0.00850792, 1.0032, 0.6334127, 0, 1, 0.7960784, 1,
-0.007453444, -0.1119742, -2.496197, 0, 1, 0.8039216, 1,
-0.003308285, 0.2657261, 1.291734, 0, 1, 0.8078431, 1,
0.002340483, -0.7626841, 3.603477, 0, 1, 0.8156863, 1,
0.003167628, 1.510515, 0.01844676, 0, 1, 0.8196079, 1,
0.004464671, 0.3385982, 0.2414438, 0, 1, 0.827451, 1,
0.005925014, -1.004287, 2.590462, 0, 1, 0.8313726, 1,
0.0103089, 0.06961661, -0.4211084, 0, 1, 0.8392157, 1,
0.01520403, 1.135974, 0.9714327, 0, 1, 0.8431373, 1,
0.01971907, 0.913663, 0.876089, 0, 1, 0.8509804, 1,
0.02191708, 0.6289691, 0.9369177, 0, 1, 0.854902, 1,
0.02284519, -0.7794951, 4.20546, 0, 1, 0.8627451, 1,
0.02360056, 0.894678, 0.4971604, 0, 1, 0.8666667, 1,
0.02601537, -0.9940751, 4.140222, 0, 1, 0.8745098, 1,
0.02983684, -0.3997234, 1.498357, 0, 1, 0.8784314, 1,
0.03006469, -0.6320692, 3.627843, 0, 1, 0.8862745, 1,
0.0334085, -1.675008, 3.066256, 0, 1, 0.8901961, 1,
0.03514862, 1.664281, -1.306494, 0, 1, 0.8980392, 1,
0.03816153, -0.7095727, 4.596895, 0, 1, 0.9058824, 1,
0.03841135, -1.118613, 3.977239, 0, 1, 0.9098039, 1,
0.04102182, 0.4954498, -0.4993799, 0, 1, 0.9176471, 1,
0.04242932, 0.1894249, 0.450319, 0, 1, 0.9215686, 1,
0.04307522, -0.5338257, 3.008363, 0, 1, 0.9294118, 1,
0.04337198, -0.3979836, 1.228155, 0, 1, 0.9333333, 1,
0.04793849, -0.4501537, 4.638988, 0, 1, 0.9411765, 1,
0.04798351, -1.376971, 3.817791, 0, 1, 0.945098, 1,
0.05645604, 1.210003, 0.7165489, 0, 1, 0.9529412, 1,
0.05780002, -0.381713, 2.253764, 0, 1, 0.9568627, 1,
0.058908, 0.7051528, 0.3609378, 0, 1, 0.9647059, 1,
0.06242123, 0.1024642, -0.09689023, 0, 1, 0.9686275, 1,
0.0637865, 0.1106517, 2.294701, 0, 1, 0.9764706, 1,
0.06404898, 1.568278, 0.3838641, 0, 1, 0.9803922, 1,
0.06532843, 0.01693997, -0.408896, 0, 1, 0.9882353, 1,
0.06627961, -1.623879, 3.01052, 0, 1, 0.9921569, 1,
0.06992663, -1.795622, 2.126768, 0, 1, 1, 1,
0.07787967, -0.1428979, 3.416719, 0, 0.9921569, 1, 1,
0.0818874, 0.6965207, 0.1639034, 0, 0.9882353, 1, 1,
0.08372794, 0.05874568, 1.566344, 0, 0.9803922, 1, 1,
0.08633002, 0.7825035, -0.1346184, 0, 0.9764706, 1, 1,
0.08711014, -1.320608, 3.989744, 0, 0.9686275, 1, 1,
0.08856586, -0.3856539, 2.949442, 0, 0.9647059, 1, 1,
0.08872756, -0.4106122, 2.142904, 0, 0.9568627, 1, 1,
0.09056976, -0.6576083, 1.20438, 0, 0.9529412, 1, 1,
0.09282742, -0.7221851, 3.20302, 0, 0.945098, 1, 1,
0.09888362, 0.1203295, 1.101907, 0, 0.9411765, 1, 1,
0.1012979, -0.3065342, 4.003662, 0, 0.9333333, 1, 1,
0.1013401, 1.368324, 0.4303385, 0, 0.9294118, 1, 1,
0.1061968, -0.3757476, 1.797745, 0, 0.9215686, 1, 1,
0.1086443, -1.681112, 4.370163, 0, 0.9176471, 1, 1,
0.1125088, -0.5840689, 2.618562, 0, 0.9098039, 1, 1,
0.1127707, -0.2340712, 3.48659, 0, 0.9058824, 1, 1,
0.1172753, 0.5621237, -1.322728, 0, 0.8980392, 1, 1,
0.1174009, 1.322407, -0.4497366, 0, 0.8901961, 1, 1,
0.1222634, 1.797067, 0.2893854, 0, 0.8862745, 1, 1,
0.1237867, 0.9113925, 0.1611746, 0, 0.8784314, 1, 1,
0.1244762, 0.3402621, -0.6196318, 0, 0.8745098, 1, 1,
0.1247116, 0.3938779, -0.01010902, 0, 0.8666667, 1, 1,
0.1285205, -0.8603436, 3.303333, 0, 0.8627451, 1, 1,
0.1287055, 0.05402523, 1.298324, 0, 0.854902, 1, 1,
0.1316972, -1.58583, 2.540049, 0, 0.8509804, 1, 1,
0.1329678, -0.3341205, 3.037024, 0, 0.8431373, 1, 1,
0.139589, -0.6471868, 2.675553, 0, 0.8392157, 1, 1,
0.1419683, 0.0219572, 2.439916, 0, 0.8313726, 1, 1,
0.1426737, -0.2143756, 3.424109, 0, 0.827451, 1, 1,
0.143839, -0.4641448, 3.074443, 0, 0.8196079, 1, 1,
0.147556, 1.686527, 3.06543, 0, 0.8156863, 1, 1,
0.1489176, -1.732347, 3.082607, 0, 0.8078431, 1, 1,
0.1524069, 1.217829, 0.9042571, 0, 0.8039216, 1, 1,
0.1529561, -0.2485899, 2.774729, 0, 0.7960784, 1, 1,
0.1588125, 0.5783723, -0.7640173, 0, 0.7882353, 1, 1,
0.1590896, 0.2646426, 0.6725811, 0, 0.7843137, 1, 1,
0.1595709, -0.2864017, 2.585007, 0, 0.7764706, 1, 1,
0.1614114, 0.4511986, 0.5059712, 0, 0.772549, 1, 1,
0.1616968, -0.48247, 3.50683, 0, 0.7647059, 1, 1,
0.1622616, 1.285677, -1.288142, 0, 0.7607843, 1, 1,
0.1681594, -1.01207, 3.04599, 0, 0.7529412, 1, 1,
0.1695766, 0.7707125, -0.05660052, 0, 0.7490196, 1, 1,
0.1752065, 1.082478, -0.7165904, 0, 0.7411765, 1, 1,
0.1846533, 0.5337996, 1.834712, 0, 0.7372549, 1, 1,
0.185564, 0.3541149, 0.5839658, 0, 0.7294118, 1, 1,
0.190775, -0.9562505, 3.578316, 0, 0.7254902, 1, 1,
0.1917634, 0.4200014, -0.5488358, 0, 0.7176471, 1, 1,
0.1924716, 1.089079, 0.8750663, 0, 0.7137255, 1, 1,
0.2012057, 1.825049, 0.5754479, 0, 0.7058824, 1, 1,
0.2023911, 2.477336, -1.088757, 0, 0.6980392, 1, 1,
0.2044912, 1.846253, -1.427395, 0, 0.6941177, 1, 1,
0.2081028, -0.4424117, 2.532589, 0, 0.6862745, 1, 1,
0.2095667, -0.1167675, 1.758091, 0, 0.682353, 1, 1,
0.2117569, 1.15871, 0.2031639, 0, 0.6745098, 1, 1,
0.2182249, 1.098407, 0.6583731, 0, 0.6705883, 1, 1,
0.2204562, 1.181249, 0.451928, 0, 0.6627451, 1, 1,
0.2229674, 1.418138, 1.12627, 0, 0.6588235, 1, 1,
0.2237982, 0.1215444, 0.4249933, 0, 0.6509804, 1, 1,
0.226327, 0.5305705, 0.2868482, 0, 0.6470588, 1, 1,
0.2274302, -1.396732, 2.065222, 0, 0.6392157, 1, 1,
0.2286435, 1.566154, 0.1397549, 0, 0.6352941, 1, 1,
0.2307435, 0.9387147, 1.285864, 0, 0.627451, 1, 1,
0.2320515, -0.6316692, 1.738329, 0, 0.6235294, 1, 1,
0.2326602, 0.07475171, 2.711292, 0, 0.6156863, 1, 1,
0.2387183, 1.066633, 0.3766272, 0, 0.6117647, 1, 1,
0.2400726, 1.486184, -1.911228, 0, 0.6039216, 1, 1,
0.2417511, -0.674434, 2.364593, 0, 0.5960785, 1, 1,
0.2512152, 1.06673, -1.017759, 0, 0.5921569, 1, 1,
0.2524993, 0.6965517, -0.2092666, 0, 0.5843138, 1, 1,
0.255589, 0.5505714, 0.518785, 0, 0.5803922, 1, 1,
0.2559028, -1.228458, 2.367387, 0, 0.572549, 1, 1,
0.2570744, 0.7332401, -0.03984253, 0, 0.5686275, 1, 1,
0.2647475, -0.8529162, 2.841611, 0, 0.5607843, 1, 1,
0.2652149, 0.03569999, 2.06556, 0, 0.5568628, 1, 1,
0.2675675, -0.5041127, 3.084958, 0, 0.5490196, 1, 1,
0.268189, -0.7082849, 2.156213, 0, 0.5450981, 1, 1,
0.268355, 0.1301845, 2.192511, 0, 0.5372549, 1, 1,
0.2686912, -1.484075, 3.514707, 0, 0.5333334, 1, 1,
0.2723965, 2.007764, -2.037345, 0, 0.5254902, 1, 1,
0.2764544, 0.3078086, 1.412942, 0, 0.5215687, 1, 1,
0.2770087, 2.905012, 1.16748, 0, 0.5137255, 1, 1,
0.2778565, -0.5887314, 1.932414, 0, 0.509804, 1, 1,
0.2782033, -0.8087534, 2.039645, 0, 0.5019608, 1, 1,
0.2809683, -2.158215, 3.297214, 0, 0.4941176, 1, 1,
0.2834864, 0.9148225, 1.811603, 0, 0.4901961, 1, 1,
0.2877471, 1.024123, 2.546245, 0, 0.4823529, 1, 1,
0.2908963, 0.5975059, -0.773921, 0, 0.4784314, 1, 1,
0.2917303, 0.0111188, 1.989971, 0, 0.4705882, 1, 1,
0.2944177, -0.8195593, 2.280233, 0, 0.4666667, 1, 1,
0.2982516, -1.310657, 4.383811, 0, 0.4588235, 1, 1,
0.3006055, -0.997117, 3.627563, 0, 0.454902, 1, 1,
0.3032407, -0.9990301, 3.456071, 0, 0.4470588, 1, 1,
0.3044372, -0.2346857, 1.844889, 0, 0.4431373, 1, 1,
0.3060082, -2.450913, 3.790007, 0, 0.4352941, 1, 1,
0.3087168, 0.162621, -0.4698042, 0, 0.4313726, 1, 1,
0.3089128, 0.9217985, -0.2391359, 0, 0.4235294, 1, 1,
0.3109379, -0.5532199, 2.284605, 0, 0.4196078, 1, 1,
0.3165129, 1.004347, -0.2601571, 0, 0.4117647, 1, 1,
0.3180861, -0.9639157, 1.690953, 0, 0.4078431, 1, 1,
0.3182244, -1.073385, 2.694798, 0, 0.4, 1, 1,
0.3257113, -0.906589, 3.735778, 0, 0.3921569, 1, 1,
0.3261724, 2.011033, -0.8302072, 0, 0.3882353, 1, 1,
0.3263907, 0.3009025, 0.3687142, 0, 0.3803922, 1, 1,
0.327117, 0.7414728, 1.235627, 0, 0.3764706, 1, 1,
0.3341373, -1.675555, 4.16351, 0, 0.3686275, 1, 1,
0.3399685, 2.391503, 1.859032, 0, 0.3647059, 1, 1,
0.3437979, 1.354945, 1.125154, 0, 0.3568628, 1, 1,
0.343913, -0.7938527, 2.553651, 0, 0.3529412, 1, 1,
0.3456573, -1.10564, 3.51952, 0, 0.345098, 1, 1,
0.3474298, -1.307793, 1.837091, 0, 0.3411765, 1, 1,
0.3607697, 0.7590309, 0.5097579, 0, 0.3333333, 1, 1,
0.3632048, -0.5312151, 2.571203, 0, 0.3294118, 1, 1,
0.3652939, -0.1383025, 4.378271, 0, 0.3215686, 1, 1,
0.3674384, -0.1716004, 1.56041, 0, 0.3176471, 1, 1,
0.3738429, 0.4793674, 0.1995047, 0, 0.3098039, 1, 1,
0.3749843, 1.133447, 1.225595, 0, 0.3058824, 1, 1,
0.3766189, 1.341146, -0.9700784, 0, 0.2980392, 1, 1,
0.3784025, 0.3227011, 1.345954, 0, 0.2901961, 1, 1,
0.3818009, 2.268478, 0.4083527, 0, 0.2862745, 1, 1,
0.3837251, 1.309286, -0.2949041, 0, 0.2784314, 1, 1,
0.384646, 0.0876709, 1.448658, 0, 0.2745098, 1, 1,
0.3869069, 0.5586337, 2.735765, 0, 0.2666667, 1, 1,
0.3872696, -0.1986116, 1.042392, 0, 0.2627451, 1, 1,
0.390822, 0.3456792, 0.5053239, 0, 0.254902, 1, 1,
0.3923756, 0.1335709, 0.384961, 0, 0.2509804, 1, 1,
0.3923946, 0.07678872, 1.599718, 0, 0.2431373, 1, 1,
0.3932928, -1.04334, 2.51612, 0, 0.2392157, 1, 1,
0.3962704, 0.5002776, 1.198963, 0, 0.2313726, 1, 1,
0.400042, 0.4764347, 0.02160125, 0, 0.227451, 1, 1,
0.4094197, 1.647939, 1.597267, 0, 0.2196078, 1, 1,
0.4117689, -0.56474, 3.37928, 0, 0.2156863, 1, 1,
0.4152944, -0.1245774, 0.471315, 0, 0.2078431, 1, 1,
0.4170807, -0.4075347, 0.1803409, 0, 0.2039216, 1, 1,
0.4175606, -2.097385, 2.034658, 0, 0.1960784, 1, 1,
0.4192934, -1.203535, 3.357529, 0, 0.1882353, 1, 1,
0.4234616, -2.231744, 3.318129, 0, 0.1843137, 1, 1,
0.4286101, 0.3599537, -0.1106578, 0, 0.1764706, 1, 1,
0.4306488, -1.062077, 3.89467, 0, 0.172549, 1, 1,
0.4356419, -1.309546, 2.605022, 0, 0.1647059, 1, 1,
0.4364393, -1.975479, 2.278853, 0, 0.1607843, 1, 1,
0.4364693, -1.821574, 3.253549, 0, 0.1529412, 1, 1,
0.4365499, 1.577764, 0.200256, 0, 0.1490196, 1, 1,
0.4453511, -1.941706, 2.541098, 0, 0.1411765, 1, 1,
0.4458591, -0.4030806, 2.152255, 0, 0.1372549, 1, 1,
0.448392, -1.99795, 2.997895, 0, 0.1294118, 1, 1,
0.4490619, -0.5850759, 3.363478, 0, 0.1254902, 1, 1,
0.452612, 1.34376, -1.13093, 0, 0.1176471, 1, 1,
0.4543078, 0.02589478, 1.480283, 0, 0.1137255, 1, 1,
0.4559798, -0.2851853, 2.548388, 0, 0.1058824, 1, 1,
0.4564111, 1.156393, 0.03061051, 0, 0.09803922, 1, 1,
0.461794, 0.6355149, 1.355722, 0, 0.09411765, 1, 1,
0.4648282, -0.09528385, 0.2449198, 0, 0.08627451, 1, 1,
0.4653203, -1.704946, 4.67889, 0, 0.08235294, 1, 1,
0.4698003, -0.2903503, 2.599453, 0, 0.07450981, 1, 1,
0.473119, 0.9318379, 2.336122, 0, 0.07058824, 1, 1,
0.4766814, -0.5941675, 2.91178, 0, 0.0627451, 1, 1,
0.4777786, 0.04644733, 1.898741, 0, 0.05882353, 1, 1,
0.4783971, -1.099039, 2.004658, 0, 0.05098039, 1, 1,
0.4800985, -0.8879992, 2.683223, 0, 0.04705882, 1, 1,
0.4827726, -1.183764, 1.916474, 0, 0.03921569, 1, 1,
0.4828295, 0.4114795, 1.093098, 0, 0.03529412, 1, 1,
0.484598, 0.167771, 0.8209835, 0, 0.02745098, 1, 1,
0.4849043, -0.7250847, 1.587813, 0, 0.02352941, 1, 1,
0.4870839, -0.3087435, 3.685926, 0, 0.01568628, 1, 1,
0.4888014, 0.8284411, 0.06217165, 0, 0.01176471, 1, 1,
0.4980336, -0.1654386, 1.709891, 0, 0.003921569, 1, 1,
0.4998016, 0.2712824, 0.5048639, 0.003921569, 0, 1, 1,
0.5028569, 1.240938, 1.924468, 0.007843138, 0, 1, 1,
0.503676, -0.12151, 2.839625, 0.01568628, 0, 1, 1,
0.5086533, 1.678433, 1.124188, 0.01960784, 0, 1, 1,
0.51556, 1.234433, 0.6080898, 0.02745098, 0, 1, 1,
0.515977, -1.609077, 3.261674, 0.03137255, 0, 1, 1,
0.5162882, 1.728705, -0.8399857, 0.03921569, 0, 1, 1,
0.5188119, -1.976225, 3.469129, 0.04313726, 0, 1, 1,
0.5233605, -1.889146, 2.286769, 0.05098039, 0, 1, 1,
0.5289252, 1.935628, -1.347001, 0.05490196, 0, 1, 1,
0.528961, -1.789306, 2.89179, 0.0627451, 0, 1, 1,
0.5302415, -1.225253, 1.65401, 0.06666667, 0, 1, 1,
0.5304708, -0.2804144, 3.283464, 0.07450981, 0, 1, 1,
0.5314431, -0.2877487, 2.78996, 0.07843138, 0, 1, 1,
0.5321741, 0.7361651, 1.682475, 0.08627451, 0, 1, 1,
0.5330572, 0.5937136, -0.2205508, 0.09019608, 0, 1, 1,
0.5352078, -0.4298632, 1.746551, 0.09803922, 0, 1, 1,
0.5367433, -0.1935492, 2.258596, 0.1058824, 0, 1, 1,
0.5368261, 1.044251, 1.890436, 0.1098039, 0, 1, 1,
0.5499456, -0.3900799, 2.106823, 0.1176471, 0, 1, 1,
0.556664, -1.220539, 1.867855, 0.1215686, 0, 1, 1,
0.557867, 1.401372, 0.5580152, 0.1294118, 0, 1, 1,
0.5603508, 0.7383809, -0.9623824, 0.1333333, 0, 1, 1,
0.5635381, 0.03593951, 1.176796, 0.1411765, 0, 1, 1,
0.5675518, -0.8208064, 1.232759, 0.145098, 0, 1, 1,
0.5675613, 1.626502, -0.07167974, 0.1529412, 0, 1, 1,
0.570581, 0.9308141, 1.122047, 0.1568628, 0, 1, 1,
0.5716092, 1.741806, 0.242916, 0.1647059, 0, 1, 1,
0.5729815, -0.5884453, 1.694324, 0.1686275, 0, 1, 1,
0.5772734, 0.3376524, -0.6963821, 0.1764706, 0, 1, 1,
0.5779206, -1.124922, 3.530748, 0.1803922, 0, 1, 1,
0.5805382, -0.5683665, 1.797088, 0.1882353, 0, 1, 1,
0.5828215, -0.06089237, 1.660766, 0.1921569, 0, 1, 1,
0.5917926, 0.03074459, 0.8669995, 0.2, 0, 1, 1,
0.5929676, 0.5946795, 0.951441, 0.2078431, 0, 1, 1,
0.5939108, -0.0839425, 1.422505, 0.2117647, 0, 1, 1,
0.5974621, -0.01607707, 0.9395273, 0.2196078, 0, 1, 1,
0.5992934, 0.169071, 1.452646, 0.2235294, 0, 1, 1,
0.599546, -1.066408, 2.546338, 0.2313726, 0, 1, 1,
0.603576, 0.7696076, 0.4197015, 0.2352941, 0, 1, 1,
0.6050045, -1.071375, 2.704541, 0.2431373, 0, 1, 1,
0.6079777, -0.6166737, 1.53124, 0.2470588, 0, 1, 1,
0.6083086, 0.5602059, 1.493634, 0.254902, 0, 1, 1,
0.6091881, 1.082007, 0.04766528, 0.2588235, 0, 1, 1,
0.6183386, 0.2364027, 1.120753, 0.2666667, 0, 1, 1,
0.6214548, -1.895812, 3.135084, 0.2705882, 0, 1, 1,
0.6221784, 0.8929907, 1.312411, 0.2784314, 0, 1, 1,
0.6277945, 0.9411778, 3.196397, 0.282353, 0, 1, 1,
0.6286352, 0.2075526, 0.2089579, 0.2901961, 0, 1, 1,
0.6302621, 1.009515, -0.1381103, 0.2941177, 0, 1, 1,
0.6305031, -0.2902694, 3.220931, 0.3019608, 0, 1, 1,
0.6388568, 1.546582, -1.138077, 0.3098039, 0, 1, 1,
0.6415836, 1.148248, 0.03901191, 0.3137255, 0, 1, 1,
0.6434291, -1.083661, 3.106685, 0.3215686, 0, 1, 1,
0.6509998, -0.2026531, 2.273088, 0.3254902, 0, 1, 1,
0.6510082, -0.8181961, 4.00032, 0.3333333, 0, 1, 1,
0.6517618, 0.3574161, 2.11551, 0.3372549, 0, 1, 1,
0.6582568, -0.2579643, 0.910017, 0.345098, 0, 1, 1,
0.6583281, -0.1109338, 0.6926447, 0.3490196, 0, 1, 1,
0.667857, -0.04587179, 3.468136, 0.3568628, 0, 1, 1,
0.6720016, -0.419949, 2.561253, 0.3607843, 0, 1, 1,
0.681857, 0.2200693, 3.486848, 0.3686275, 0, 1, 1,
0.6835406, -0.8039589, 2.956369, 0.372549, 0, 1, 1,
0.6853325, 0.2742322, 0.9609954, 0.3803922, 0, 1, 1,
0.6871894, -0.7542698, 2.734856, 0.3843137, 0, 1, 1,
0.6894026, 0.4023422, 0.7557262, 0.3921569, 0, 1, 1,
0.6928673, 0.9265574, -0.0361973, 0.3960784, 0, 1, 1,
0.694876, 0.179899, 1.29617, 0.4039216, 0, 1, 1,
0.6985458, -0.8265318, 1.248865, 0.4117647, 0, 1, 1,
0.7002677, -0.5802236, 2.535366, 0.4156863, 0, 1, 1,
0.7013271, 1.490046, 0.2402321, 0.4235294, 0, 1, 1,
0.7027852, -0.2833374, 2.647155, 0.427451, 0, 1, 1,
0.7044068, -0.7000926, 2.928629, 0.4352941, 0, 1, 1,
0.7120463, 0.2034296, 2.946252, 0.4392157, 0, 1, 1,
0.7164973, 0.5920489, -0.9837278, 0.4470588, 0, 1, 1,
0.7171511, -0.7450637, 3.025856, 0.4509804, 0, 1, 1,
0.7176197, -0.2601208, 3.038963, 0.4588235, 0, 1, 1,
0.7274771, -1.025364, 0.405786, 0.4627451, 0, 1, 1,
0.7289508, -0.1547218, 3.082172, 0.4705882, 0, 1, 1,
0.7309437, -0.2194571, -0.6372658, 0.4745098, 0, 1, 1,
0.7316307, 0.782407, 1.738379, 0.4823529, 0, 1, 1,
0.7356856, 0.6932098, 0.8512474, 0.4862745, 0, 1, 1,
0.7395879, -0.06244863, 3.641175, 0.4941176, 0, 1, 1,
0.7478243, -0.7079535, 1.085846, 0.5019608, 0, 1, 1,
0.7497742, -0.5394805, 2.403167, 0.5058824, 0, 1, 1,
0.7502785, 1.446561, 0.7277843, 0.5137255, 0, 1, 1,
0.7506039, 0.89507, 0.4491569, 0.5176471, 0, 1, 1,
0.7522706, -0.5864326, 1.733256, 0.5254902, 0, 1, 1,
0.7567157, -2.445024, 3.278698, 0.5294118, 0, 1, 1,
0.7578288, 1.363293, -0.1951945, 0.5372549, 0, 1, 1,
0.7590026, -0.009538117, 3.457319, 0.5411765, 0, 1, 1,
0.7651243, 1.249677, 0.6924409, 0.5490196, 0, 1, 1,
0.7687702, -0.4586648, 0.9093441, 0.5529412, 0, 1, 1,
0.7701608, -0.6752637, 2.59331, 0.5607843, 0, 1, 1,
0.7721314, 1.674971, 0.6847899, 0.5647059, 0, 1, 1,
0.7728654, -1.292361, 2.927967, 0.572549, 0, 1, 1,
0.7728709, 0.3150004, 0.1845745, 0.5764706, 0, 1, 1,
0.7793898, -0.6076125, -1.501805, 0.5843138, 0, 1, 1,
0.7814606, -0.6248476, -0.1175704, 0.5882353, 0, 1, 1,
0.7836457, -2.00629, 2.050928, 0.5960785, 0, 1, 1,
0.7841205, 0.6870936, 1.913382, 0.6039216, 0, 1, 1,
0.7866052, 2.136662, 0.0008954579, 0.6078432, 0, 1, 1,
0.7891191, -0.6059617, 4.58159, 0.6156863, 0, 1, 1,
0.7898067, 0.8237314, 1.848512, 0.6196079, 0, 1, 1,
0.7961458, -0.8869635, 1.305971, 0.627451, 0, 1, 1,
0.7975797, 1.087567, 0.1247112, 0.6313726, 0, 1, 1,
0.7993737, -1.363259, 0.9540938, 0.6392157, 0, 1, 1,
0.812345, 0.3582005, 2.006616, 0.6431373, 0, 1, 1,
0.8140979, 1.000525, -0.2903339, 0.6509804, 0, 1, 1,
0.818646, 1.932017, 0.901316, 0.654902, 0, 1, 1,
0.8189049, -0.1269008, 4.265652, 0.6627451, 0, 1, 1,
0.8191177, 1.240382, -0.01498687, 0.6666667, 0, 1, 1,
0.8229819, 0.2763168, 2.462476, 0.6745098, 0, 1, 1,
0.8250095, -0.3312057, 1.263553, 0.6784314, 0, 1, 1,
0.8256713, -0.0625695, 0.7345927, 0.6862745, 0, 1, 1,
0.8261684, -1.355627, 1.616433, 0.6901961, 0, 1, 1,
0.8262408, 0.4295233, 0.511156, 0.6980392, 0, 1, 1,
0.8288665, 0.01205913, 1.0173, 0.7058824, 0, 1, 1,
0.8301181, 0.8067139, 1.499036, 0.7098039, 0, 1, 1,
0.833999, -1.352375, 2.941114, 0.7176471, 0, 1, 1,
0.8415335, 0.9805835, 3.303241, 0.7215686, 0, 1, 1,
0.8418384, 0.85145, -0.6419232, 0.7294118, 0, 1, 1,
0.8462916, -0.7007339, 0.8902722, 0.7333333, 0, 1, 1,
0.8467517, 0.2480188, 1.369488, 0.7411765, 0, 1, 1,
0.8514317, -0.2812719, 2.059321, 0.7450981, 0, 1, 1,
0.855786, 2.668737, -1.426837, 0.7529412, 0, 1, 1,
0.8685214, 0.7273609, 0.3005325, 0.7568628, 0, 1, 1,
0.8724267, -0.3954303, 2.886204, 0.7647059, 0, 1, 1,
0.8757312, 0.2357055, 1.7411, 0.7686275, 0, 1, 1,
0.8825448, -0.655305, 1.483581, 0.7764706, 0, 1, 1,
0.8839487, 0.2756914, 0.4425569, 0.7803922, 0, 1, 1,
0.8924894, -0.8762308, 2.967271, 0.7882353, 0, 1, 1,
0.8974135, -0.4420317, 0.6104738, 0.7921569, 0, 1, 1,
0.9025103, 1.927477, 0.2751167, 0.8, 0, 1, 1,
0.9026663, -1.670091, 3.306086, 0.8078431, 0, 1, 1,
0.9110628, -0.6863998, 1.572478, 0.8117647, 0, 1, 1,
0.9165834, -0.2974565, 2.290688, 0.8196079, 0, 1, 1,
0.9199706, 1.496221, 2.984525, 0.8235294, 0, 1, 1,
0.9219033, 1.301877, 2.933957, 0.8313726, 0, 1, 1,
0.9221345, -1.367273, 1.181544, 0.8352941, 0, 1, 1,
0.9311956, -0.8253769, 1.207087, 0.8431373, 0, 1, 1,
0.9318613, 0.9733393, 1.269267, 0.8470588, 0, 1, 1,
0.932858, 0.9585934, 1.779376, 0.854902, 0, 1, 1,
0.9338831, -0.2728674, 1.812957, 0.8588235, 0, 1, 1,
0.9342796, -0.6766897, 1.327188, 0.8666667, 0, 1, 1,
0.9355186, -0.543622, 2.168849, 0.8705882, 0, 1, 1,
0.9363018, 0.3823941, -0.5968636, 0.8784314, 0, 1, 1,
0.9369856, -1.58215, 1.119204, 0.8823529, 0, 1, 1,
0.9438894, -0.7152065, 3.250756, 0.8901961, 0, 1, 1,
0.9487459, -0.5574926, 0.05073796, 0.8941177, 0, 1, 1,
0.9490176, 0.3383633, 1.159032, 0.9019608, 0, 1, 1,
0.9590738, 0.8369494, 1.566592, 0.9098039, 0, 1, 1,
0.960849, 1.071717, 0.1295557, 0.9137255, 0, 1, 1,
0.9720973, -0.7447411, 3.277804, 0.9215686, 0, 1, 1,
0.9758783, 0.7585893, 2.794247, 0.9254902, 0, 1, 1,
0.9858006, -1.739312, 3.363818, 0.9333333, 0, 1, 1,
1.000637, -1.17323, 3.394686, 0.9372549, 0, 1, 1,
1.004141, -0.5794787, 2.125217, 0.945098, 0, 1, 1,
1.010585, 2.882022, -1.224307, 0.9490196, 0, 1, 1,
1.014235, -1.407213, 3.472799, 0.9568627, 0, 1, 1,
1.015925, -0.9133774, 1.310219, 0.9607843, 0, 1, 1,
1.018332, 0.2929787, 0.9254839, 0.9686275, 0, 1, 1,
1.025431, 0.5558282, 3.480333, 0.972549, 0, 1, 1,
1.026826, 0.3813536, 2.425973, 0.9803922, 0, 1, 1,
1.030684, 0.09674107, 2.642054, 0.9843137, 0, 1, 1,
1.032052, -1.790643, 3.598593, 0.9921569, 0, 1, 1,
1.032137, 1.533366, -0.3668589, 0.9960784, 0, 1, 1,
1.033525, -0.4743823, 2.813221, 1, 0, 0.9960784, 1,
1.036964, -0.7207224, 3.011636, 1, 0, 0.9882353, 1,
1.037423, 0.4972302, 1.632217, 1, 0, 0.9843137, 1,
1.042388, -0.8373417, 1.869101, 1, 0, 0.9764706, 1,
1.042717, -0.05538219, 0.8563408, 1, 0, 0.972549, 1,
1.046351, -0.9476218, 0.8015048, 1, 0, 0.9647059, 1,
1.056831, 0.4672638, 0.8982856, 1, 0, 0.9607843, 1,
1.056991, 1.078944, 0.1537197, 1, 0, 0.9529412, 1,
1.057509, -0.3409706, 2.134217, 1, 0, 0.9490196, 1,
1.058978, 0.07846259, 1.970615, 1, 0, 0.9411765, 1,
1.065958, 1.261236, 0.2609394, 1, 0, 0.9372549, 1,
1.0669, 0.2612058, 1.98221, 1, 0, 0.9294118, 1,
1.068683, -0.4543215, 2.913126, 1, 0, 0.9254902, 1,
1.074084, 0.4434853, -0.04484245, 1, 0, 0.9176471, 1,
1.084949, -0.8340301, 1.74116, 1, 0, 0.9137255, 1,
1.087769, 0.3604177, 1.123309, 1, 0, 0.9058824, 1,
1.091609, 0.4352752, 2.295773, 1, 0, 0.9019608, 1,
1.105571, -1.253489, 1.203968, 1, 0, 0.8941177, 1,
1.1066, -0.5989344, 2.92964, 1, 0, 0.8862745, 1,
1.108861, 0.2803087, 0.2837684, 1, 0, 0.8823529, 1,
1.119538, 0.7254708, 1.374197, 1, 0, 0.8745098, 1,
1.124671, 0.1354674, 1.303203, 1, 0, 0.8705882, 1,
1.129126, -0.5235498, 2.864214, 1, 0, 0.8627451, 1,
1.13219, -1.649442, 2.022867, 1, 0, 0.8588235, 1,
1.133118, 0.1761251, 0.6288812, 1, 0, 0.8509804, 1,
1.13448, 1.948279, -0.1521572, 1, 0, 0.8470588, 1,
1.139337, -0.296485, 1.756002, 1, 0, 0.8392157, 1,
1.140901, 1.304576, -1.485525, 1, 0, 0.8352941, 1,
1.142329, 0.05345745, 2.559214, 1, 0, 0.827451, 1,
1.142692, 0.4275789, 1.801334, 1, 0, 0.8235294, 1,
1.14295, -0.9423401, 2.715105, 1, 0, 0.8156863, 1,
1.143374, -1.071567, 3.474676, 1, 0, 0.8117647, 1,
1.146569, -0.9522093, 2.950222, 1, 0, 0.8039216, 1,
1.150549, -0.05788841, 3.491267, 1, 0, 0.7960784, 1,
1.151329, 1.426642, 1.449252, 1, 0, 0.7921569, 1,
1.158092, -0.4539142, 0.1170293, 1, 0, 0.7843137, 1,
1.159914, 0.9786265, 0.9119149, 1, 0, 0.7803922, 1,
1.170974, 0.25353, 0.4741631, 1, 0, 0.772549, 1,
1.184724, -0.1446394, 1.70677, 1, 0, 0.7686275, 1,
1.189848, 0.5464061, 1.263552, 1, 0, 0.7607843, 1,
1.1932, -1.622504, 3.929483, 1, 0, 0.7568628, 1,
1.195591, -1.206486, 0.5322265, 1, 0, 0.7490196, 1,
1.19642, 0.8524485, 0.6096303, 1, 0, 0.7450981, 1,
1.196546, -0.1837635, 0.9384701, 1, 0, 0.7372549, 1,
1.196986, 0.7028295, 1.117644, 1, 0, 0.7333333, 1,
1.204433, -0.4628766, 2.71383, 1, 0, 0.7254902, 1,
1.207382, 0.7229297, 0.4749717, 1, 0, 0.7215686, 1,
1.214363, -0.4555897, 1.564055, 1, 0, 0.7137255, 1,
1.214477, 0.8709338, 0.8110302, 1, 0, 0.7098039, 1,
1.21633, -0.6885866, 1.402701, 1, 0, 0.7019608, 1,
1.226866, -1.312711, 2.86708, 1, 0, 0.6941177, 1,
1.228256, 1.036051, -0.9650365, 1, 0, 0.6901961, 1,
1.231644, -0.2551628, 0.755212, 1, 0, 0.682353, 1,
1.239583, 0.1906447, 1.662262, 1, 0, 0.6784314, 1,
1.242697, -0.2052448, -0.5757559, 1, 0, 0.6705883, 1,
1.251925, -0.6673679, 3.951355, 1, 0, 0.6666667, 1,
1.254985, -0.1885034, 3.21608, 1, 0, 0.6588235, 1,
1.256352, -0.1663374, 2.192026, 1, 0, 0.654902, 1,
1.266191, 0.01362447, 0.5880828, 1, 0, 0.6470588, 1,
1.270862, -0.8602564, 3.48867, 1, 0, 0.6431373, 1,
1.272934, -0.3844687, 2.156606, 1, 0, 0.6352941, 1,
1.28277, 1.67044, 0.9746411, 1, 0, 0.6313726, 1,
1.287364, -1.91487, 2.230712, 1, 0, 0.6235294, 1,
1.28901, -0.6589212, 0.8469647, 1, 0, 0.6196079, 1,
1.292915, 1.66376, 3.055594, 1, 0, 0.6117647, 1,
1.295665, -0.245318, 3.237718, 1, 0, 0.6078432, 1,
1.302332, 0.2867541, 3.071371, 1, 0, 0.6, 1,
1.303038, 1.315754, -0.375831, 1, 0, 0.5921569, 1,
1.305829, -0.4704079, 2.191988, 1, 0, 0.5882353, 1,
1.312412, 0.4011843, 1.442023, 1, 0, 0.5803922, 1,
1.314304, 0.4624811, 1.032784, 1, 0, 0.5764706, 1,
1.323607, 0.047477, 0.3616371, 1, 0, 0.5686275, 1,
1.334495, 0.1020501, 2.015563, 1, 0, 0.5647059, 1,
1.340169, 0.1449728, 0.6898369, 1, 0, 0.5568628, 1,
1.342004, 0.05541957, 3.040601, 1, 0, 0.5529412, 1,
1.343788, -0.3954176, 2.312277, 1, 0, 0.5450981, 1,
1.348996, -0.0002685224, 3.853614, 1, 0, 0.5411765, 1,
1.34941, -0.6945897, 1.477512, 1, 0, 0.5333334, 1,
1.359407, 0.1802727, -0.5513269, 1, 0, 0.5294118, 1,
1.359616, 1.819791, 0.8263485, 1, 0, 0.5215687, 1,
1.361755, -0.8572177, 3.356389, 1, 0, 0.5176471, 1,
1.36608, 0.9333676, 0.09431088, 1, 0, 0.509804, 1,
1.371114, -2.138863, 3.083507, 1, 0, 0.5058824, 1,
1.375282, 0.236249, 3.060596, 1, 0, 0.4980392, 1,
1.391702, 0.4594618, 0.4026218, 1, 0, 0.4901961, 1,
1.406623, -0.04529355, 1.332751, 1, 0, 0.4862745, 1,
1.414332, 0.7359999, 2.971577, 1, 0, 0.4784314, 1,
1.415679, -0.5983124, 0.6608851, 1, 0, 0.4745098, 1,
1.426921, 0.3642855, 0.8269069, 1, 0, 0.4666667, 1,
1.427053, -0.5059085, 0.6369683, 1, 0, 0.4627451, 1,
1.428327, 0.6826057, 1.629797, 1, 0, 0.454902, 1,
1.435548, -0.5319034, 1.593753, 1, 0, 0.4509804, 1,
1.443937, 0.5604731, -0.4239576, 1, 0, 0.4431373, 1,
1.448982, -0.4907917, 1.874761, 1, 0, 0.4392157, 1,
1.449638, -0.3958534, 2.483919, 1, 0, 0.4313726, 1,
1.459355, -0.4972667, 2.269083, 1, 0, 0.427451, 1,
1.478379, -0.2384723, 0.881991, 1, 0, 0.4196078, 1,
1.479835, -0.8937349, 0.8595706, 1, 0, 0.4156863, 1,
1.481416, -1.28413, 3.270169, 1, 0, 0.4078431, 1,
1.494397, 1.051966, 0.7197059, 1, 0, 0.4039216, 1,
1.499019, -0.9203894, 1.209043, 1, 0, 0.3960784, 1,
1.499598, -0.4222652, 0.7617724, 1, 0, 0.3882353, 1,
1.503075, -0.06882386, 1.954318, 1, 0, 0.3843137, 1,
1.503343, -2.376337, 1.122061, 1, 0, 0.3764706, 1,
1.505667, -0.2578353, 2.743862, 1, 0, 0.372549, 1,
1.510094, -0.1717049, 1.735044, 1, 0, 0.3647059, 1,
1.534743, 0.5685301, 2.381431, 1, 0, 0.3607843, 1,
1.538406, -1.840818, 3.380993, 1, 0, 0.3529412, 1,
1.545637, -0.01202229, 1.303578, 1, 0, 0.3490196, 1,
1.566854, -1.576472, 2.454041, 1, 0, 0.3411765, 1,
1.602072, -1.293524, 1.502754, 1, 0, 0.3372549, 1,
1.625724, 0.81049, 1.290595, 1, 0, 0.3294118, 1,
1.642389, -0.3157798, 0.2987662, 1, 0, 0.3254902, 1,
1.649087, 0.05850931, 1.958941, 1, 0, 0.3176471, 1,
1.653938, 1.036562, -0.7595545, 1, 0, 0.3137255, 1,
1.659874, 0.1394472, 1.131621, 1, 0, 0.3058824, 1,
1.660505, -0.4023639, 2.413395, 1, 0, 0.2980392, 1,
1.661938, -0.8873304, 2.089054, 1, 0, 0.2941177, 1,
1.666062, 0.8780121, 0.5385171, 1, 0, 0.2862745, 1,
1.700386, 1.258255, 1.053581, 1, 0, 0.282353, 1,
1.701819, 0.08263901, 1.63024, 1, 0, 0.2745098, 1,
1.714805, -1.136783, 2.736077, 1, 0, 0.2705882, 1,
1.728681, -0.2155452, 1.998263, 1, 0, 0.2627451, 1,
1.731242, 2.372165, -0.3429537, 1, 0, 0.2588235, 1,
1.732146, 0.9995155, 1.261586, 1, 0, 0.2509804, 1,
1.749926, 1.409433, 2.000721, 1, 0, 0.2470588, 1,
1.759172, -1.849643, 1.144474, 1, 0, 0.2392157, 1,
1.774773, -0.6127506, 3.298681, 1, 0, 0.2352941, 1,
1.781353, 0.7137434, 0.5824262, 1, 0, 0.227451, 1,
1.80367, -0.236228, 2.287917, 1, 0, 0.2235294, 1,
1.828362, -0.181172, 0.7685029, 1, 0, 0.2156863, 1,
1.832327, -0.1879091, 2.994603, 1, 0, 0.2117647, 1,
1.845635, -0.1566779, 2.136512, 1, 0, 0.2039216, 1,
1.845907, 0.4694233, -0.9856405, 1, 0, 0.1960784, 1,
1.857782, 0.8879846, 1.507157, 1, 0, 0.1921569, 1,
1.877867, -0.4216464, 1.85627, 1, 0, 0.1843137, 1,
1.894363, 0.9825249, -0.2242031, 1, 0, 0.1803922, 1,
1.897608, -0.5712679, 1.128911, 1, 0, 0.172549, 1,
1.906094, -0.7425395, -0.9860251, 1, 0, 0.1686275, 1,
1.91641, -0.1515459, 1.041042, 1, 0, 0.1607843, 1,
1.917614, 1.032806, -0.6187193, 1, 0, 0.1568628, 1,
1.91847, 0.0638941, -0.135016, 1, 0, 0.1490196, 1,
1.927243, 0.3579024, 1.395195, 1, 0, 0.145098, 1,
1.943082, -0.7579783, 2.270604, 1, 0, 0.1372549, 1,
1.973125, -1.046528, 3.145479, 1, 0, 0.1333333, 1,
1.975009, -0.8823874, 1.44886, 1, 0, 0.1254902, 1,
1.989367, 0.6329077, 1.926863, 1, 0, 0.1215686, 1,
2.002437, -1.294042, 2.674555, 1, 0, 0.1137255, 1,
2.031821, 0.4999183, 2.723868, 1, 0, 0.1098039, 1,
2.050963, -0.8152395, 2.056236, 1, 0, 0.1019608, 1,
2.065277, -0.3905171, 3.193324, 1, 0, 0.09411765, 1,
2.089392, 1.376492, 1.684754, 1, 0, 0.09019608, 1,
2.127947, -2.286417, 2.518261, 1, 0, 0.08235294, 1,
2.154223, -0.5711818, 2.313869, 1, 0, 0.07843138, 1,
2.158546, -0.3329615, 0.8116511, 1, 0, 0.07058824, 1,
2.178614, 1.611636, 1.2096, 1, 0, 0.06666667, 1,
2.188411, -0.2909641, 1.198075, 1, 0, 0.05882353, 1,
2.222671, -1.274902, 2.309945, 1, 0, 0.05490196, 1,
2.280655, -1.333487, 4.631061, 1, 0, 0.04705882, 1,
2.376897, -0.9369882, 4.035052, 1, 0, 0.04313726, 1,
2.45042, 0.469454, 1.109951, 1, 0, 0.03529412, 1,
2.526283, -0.0175199, 0.4966729, 1, 0, 0.03137255, 1,
2.531965, 0.8783979, 0.950295, 1, 0, 0.02352941, 1,
2.938603, -0.8200293, 3.981735, 1, 0, 0.01960784, 1,
3.21964, 0.7618045, 2.336027, 1, 0, 0.01176471, 1,
3.441634, -0.6979587, 2.389905, 1, 0, 0.007843138, 1
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
0.1350008, -3.823222, -7.060922, 0, -0.5, 0.5, 0.5,
0.1350008, -3.823222, -7.060922, 1, -0.5, 0.5, 0.5,
0.1350008, -3.823222, -7.060922, 1, 1.5, 0.5, 0.5,
0.1350008, -3.823222, -7.060922, 0, 1.5, 0.5, 0.5
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
-4.292581, 0.02846932, -7.060922, 0, -0.5, 0.5, 0.5,
-4.292581, 0.02846932, -7.060922, 1, -0.5, 0.5, 0.5,
-4.292581, 0.02846932, -7.060922, 1, 1.5, 0.5, 0.5,
-4.292581, 0.02846932, -7.060922, 0, 1.5, 0.5, 0.5
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
-4.292581, -3.823222, -0.3402689, 0, -0.5, 0.5, 0.5,
-4.292581, -3.823222, -0.3402689, 1, -0.5, 0.5, 0.5,
-4.292581, -3.823222, -0.3402689, 1, 1.5, 0.5, 0.5,
-4.292581, -3.823222, -0.3402689, 0, 1.5, 0.5, 0.5
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
-3, -2.93437, -5.510002,
3, -2.93437, -5.510002,
-3, -2.93437, -5.510002,
-3, -3.082512, -5.768489,
-2, -2.93437, -5.510002,
-2, -3.082512, -5.768489,
-1, -2.93437, -5.510002,
-1, -3.082512, -5.768489,
0, -2.93437, -5.510002,
0, -3.082512, -5.768489,
1, -2.93437, -5.510002,
1, -3.082512, -5.768489,
2, -2.93437, -5.510002,
2, -3.082512, -5.768489,
3, -2.93437, -5.510002,
3, -3.082512, -5.768489
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
-3, -3.378796, -6.285462, 0, -0.5, 0.5, 0.5,
-3, -3.378796, -6.285462, 1, -0.5, 0.5, 0.5,
-3, -3.378796, -6.285462, 1, 1.5, 0.5, 0.5,
-3, -3.378796, -6.285462, 0, 1.5, 0.5, 0.5,
-2, -3.378796, -6.285462, 0, -0.5, 0.5, 0.5,
-2, -3.378796, -6.285462, 1, -0.5, 0.5, 0.5,
-2, -3.378796, -6.285462, 1, 1.5, 0.5, 0.5,
-2, -3.378796, -6.285462, 0, 1.5, 0.5, 0.5,
-1, -3.378796, -6.285462, 0, -0.5, 0.5, 0.5,
-1, -3.378796, -6.285462, 1, -0.5, 0.5, 0.5,
-1, -3.378796, -6.285462, 1, 1.5, 0.5, 0.5,
-1, -3.378796, -6.285462, 0, 1.5, 0.5, 0.5,
0, -3.378796, -6.285462, 0, -0.5, 0.5, 0.5,
0, -3.378796, -6.285462, 1, -0.5, 0.5, 0.5,
0, -3.378796, -6.285462, 1, 1.5, 0.5, 0.5,
0, -3.378796, -6.285462, 0, 1.5, 0.5, 0.5,
1, -3.378796, -6.285462, 0, -0.5, 0.5, 0.5,
1, -3.378796, -6.285462, 1, -0.5, 0.5, 0.5,
1, -3.378796, -6.285462, 1, 1.5, 0.5, 0.5,
1, -3.378796, -6.285462, 0, 1.5, 0.5, 0.5,
2, -3.378796, -6.285462, 0, -0.5, 0.5, 0.5,
2, -3.378796, -6.285462, 1, -0.5, 0.5, 0.5,
2, -3.378796, -6.285462, 1, 1.5, 0.5, 0.5,
2, -3.378796, -6.285462, 0, 1.5, 0.5, 0.5,
3, -3.378796, -6.285462, 0, -0.5, 0.5, 0.5,
3, -3.378796, -6.285462, 1, -0.5, 0.5, 0.5,
3, -3.378796, -6.285462, 1, 1.5, 0.5, 0.5,
3, -3.378796, -6.285462, 0, 1.5, 0.5, 0.5
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
-3.270832, -2, -5.510002,
-3.270832, 2, -5.510002,
-3.270832, -2, -5.510002,
-3.441123, -2, -5.768489,
-3.270832, -1, -5.510002,
-3.441123, -1, -5.768489,
-3.270832, 0, -5.510002,
-3.441123, 0, -5.768489,
-3.270832, 1, -5.510002,
-3.441123, 1, -5.768489,
-3.270832, 2, -5.510002,
-3.441123, 2, -5.768489
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
-3.781706, -2, -6.285462, 0, -0.5, 0.5, 0.5,
-3.781706, -2, -6.285462, 1, -0.5, 0.5, 0.5,
-3.781706, -2, -6.285462, 1, 1.5, 0.5, 0.5,
-3.781706, -2, -6.285462, 0, 1.5, 0.5, 0.5,
-3.781706, -1, -6.285462, 0, -0.5, 0.5, 0.5,
-3.781706, -1, -6.285462, 1, -0.5, 0.5, 0.5,
-3.781706, -1, -6.285462, 1, 1.5, 0.5, 0.5,
-3.781706, -1, -6.285462, 0, 1.5, 0.5, 0.5,
-3.781706, 0, -6.285462, 0, -0.5, 0.5, 0.5,
-3.781706, 0, -6.285462, 1, -0.5, 0.5, 0.5,
-3.781706, 0, -6.285462, 1, 1.5, 0.5, 0.5,
-3.781706, 0, -6.285462, 0, 1.5, 0.5, 0.5,
-3.781706, 1, -6.285462, 0, -0.5, 0.5, 0.5,
-3.781706, 1, -6.285462, 1, -0.5, 0.5, 0.5,
-3.781706, 1, -6.285462, 1, 1.5, 0.5, 0.5,
-3.781706, 1, -6.285462, 0, 1.5, 0.5, 0.5,
-3.781706, 2, -6.285462, 0, -0.5, 0.5, 0.5,
-3.781706, 2, -6.285462, 1, -0.5, 0.5, 0.5,
-3.781706, 2, -6.285462, 1, 1.5, 0.5, 0.5,
-3.781706, 2, -6.285462, 0, 1.5, 0.5, 0.5
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
-3.270832, -2.93437, -4,
-3.270832, -2.93437, 4,
-3.270832, -2.93437, -4,
-3.441123, -3.082512, -4,
-3.270832, -2.93437, -2,
-3.441123, -3.082512, -2,
-3.270832, -2.93437, 0,
-3.441123, -3.082512, 0,
-3.270832, -2.93437, 2,
-3.441123, -3.082512, 2,
-3.270832, -2.93437, 4,
-3.441123, -3.082512, 4
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
-3.781706, -3.378796, -4, 0, -0.5, 0.5, 0.5,
-3.781706, -3.378796, -4, 1, -0.5, 0.5, 0.5,
-3.781706, -3.378796, -4, 1, 1.5, 0.5, 0.5,
-3.781706, -3.378796, -4, 0, 1.5, 0.5, 0.5,
-3.781706, -3.378796, -2, 0, -0.5, 0.5, 0.5,
-3.781706, -3.378796, -2, 1, -0.5, 0.5, 0.5,
-3.781706, -3.378796, -2, 1, 1.5, 0.5, 0.5,
-3.781706, -3.378796, -2, 0, 1.5, 0.5, 0.5,
-3.781706, -3.378796, 0, 0, -0.5, 0.5, 0.5,
-3.781706, -3.378796, 0, 1, -0.5, 0.5, 0.5,
-3.781706, -3.378796, 0, 1, 1.5, 0.5, 0.5,
-3.781706, -3.378796, 0, 0, 1.5, 0.5, 0.5,
-3.781706, -3.378796, 2, 0, -0.5, 0.5, 0.5,
-3.781706, -3.378796, 2, 1, -0.5, 0.5, 0.5,
-3.781706, -3.378796, 2, 1, 1.5, 0.5, 0.5,
-3.781706, -3.378796, 2, 0, 1.5, 0.5, 0.5,
-3.781706, -3.378796, 4, 0, -0.5, 0.5, 0.5,
-3.781706, -3.378796, 4, 1, -0.5, 0.5, 0.5,
-3.781706, -3.378796, 4, 1, 1.5, 0.5, 0.5,
-3.781706, -3.378796, 4, 0, 1.5, 0.5, 0.5
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
-3.270832, -2.93437, -5.510002,
-3.270832, 2.991309, -5.510002,
-3.270832, -2.93437, 4.829464,
-3.270832, 2.991309, 4.829464,
-3.270832, -2.93437, -5.510002,
-3.270832, -2.93437, 4.829464,
-3.270832, 2.991309, -5.510002,
-3.270832, 2.991309, 4.829464,
-3.270832, -2.93437, -5.510002,
3.540833, -2.93437, -5.510002,
-3.270832, -2.93437, 4.829464,
3.540833, -2.93437, 4.829464,
-3.270832, 2.991309, -5.510002,
3.540833, 2.991309, -5.510002,
-3.270832, 2.991309, 4.829464,
3.540833, 2.991309, 4.829464,
3.540833, -2.93437, -5.510002,
3.540833, 2.991309, -5.510002,
3.540833, -2.93437, 4.829464,
3.540833, 2.991309, 4.829464,
3.540833, -2.93437, -5.510002,
3.540833, -2.93437, 4.829464,
3.540833, 2.991309, -5.510002,
3.540833, 2.991309, 4.829464
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
var radius = 7.329689;
var distance = 32.61061;
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
mvMatrix.translate( -0.1350008, -0.02846932, 0.3402689 );
mvMatrix.scale( 1.163446, 1.3374, 0.7664808 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.61061);
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
Zolone<-read.table("Zolone.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Zolone$V2
```

```
## Error in eval(expr, envir, enclos): object 'Zolone' not found
```

```r
y<-Zolone$V3
```

```
## Error in eval(expr, envir, enclos): object 'Zolone' not found
```

```r
z<-Zolone$V4
```

```
## Error in eval(expr, envir, enclos): object 'Zolone' not found
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
-3.171633, -1.16148, -3.222859, 0, 0, 1, 1, 1,
-3.010786, 0.3938668, -2.263187, 1, 0, 0, 1, 1,
-2.939437, 0.2143154, -4.108776, 1, 0, 0, 1, 1,
-2.597223, -0.02886161, -1.717353, 1, 0, 0, 1, 1,
-2.561868, -2.160445, -2.641285, 1, 0, 0, 1, 1,
-2.540383, -0.3970329, -3.089103, 1, 0, 0, 1, 1,
-2.383601, 0.458624, -2.414977, 0, 0, 0, 1, 1,
-2.355871, 1.056924, -0.5357412, 0, 0, 0, 1, 1,
-2.35405, 1.842871, -2.291777, 0, 0, 0, 1, 1,
-2.292546, 1.678523, -3.579038, 0, 0, 0, 1, 1,
-2.279929, -0.3082199, -0.5837117, 0, 0, 0, 1, 1,
-2.201139, 0.7436798, -1.271187, 0, 0, 0, 1, 1,
-2.162312, 1.126857, -1.027409, 0, 0, 0, 1, 1,
-2.064266, 0.8343825, -0.9687402, 1, 1, 1, 1, 1,
-2.049726, -0.04032674, -0.4437357, 1, 1, 1, 1, 1,
-2.019642, 0.9375752, -2.161328, 1, 1, 1, 1, 1,
-1.999426, -0.301359, -1.091748, 1, 1, 1, 1, 1,
-1.967057, 0.8825905, 0.4622212, 1, 1, 1, 1, 1,
-1.957506, -0.8690385, -2.154657, 1, 1, 1, 1, 1,
-1.942558, 1.428861, -0.659312, 1, 1, 1, 1, 1,
-1.890749, 0.8175417, -0.6205747, 1, 1, 1, 1, 1,
-1.887111, -0.7373559, -3.280827, 1, 1, 1, 1, 1,
-1.883883, -0.4417679, -2.073286, 1, 1, 1, 1, 1,
-1.852765, -0.1084298, -2.033684, 1, 1, 1, 1, 1,
-1.794015, -0.03295708, -1.862261, 1, 1, 1, 1, 1,
-1.792818, 0.9579398, 0.2983197, 1, 1, 1, 1, 1,
-1.754684, 1.043442, -1.075742, 1, 1, 1, 1, 1,
-1.748771, -1.809021, -2.471857, 1, 1, 1, 1, 1,
-1.742127, -0.6529045, -2.963204, 0, 0, 1, 1, 1,
-1.725117, -0.7588677, -1.996682, 1, 0, 0, 1, 1,
-1.721521, 0.3614186, -1.990496, 1, 0, 0, 1, 1,
-1.716946, 0.5978326, 0.01723218, 1, 0, 0, 1, 1,
-1.711582, 0.2457383, -1.243844, 1, 0, 0, 1, 1,
-1.703607, -1.533929, -1.944759, 1, 0, 0, 1, 1,
-1.697828, 1.263551, -0.4523077, 0, 0, 0, 1, 1,
-1.695892, 0.1558696, -1.258634, 0, 0, 0, 1, 1,
-1.691051, 0.7643546, -1.558505, 0, 0, 0, 1, 1,
-1.679445, -0.4617645, -1.103441, 0, 0, 0, 1, 1,
-1.640086, -1.377877, -2.605338, 0, 0, 0, 1, 1,
-1.627394, 0.6640719, -0.8401139, 0, 0, 0, 1, 1,
-1.625038, -0.5638737, -2.199748, 0, 0, 0, 1, 1,
-1.617441, 0.4988458, -0.7722833, 1, 1, 1, 1, 1,
-1.596929, 1.760637, -0.783223, 1, 1, 1, 1, 1,
-1.591762, -1.844488, -2.038915, 1, 1, 1, 1, 1,
-1.587499, 0.849839, -0.5562206, 1, 1, 1, 1, 1,
-1.586273, -0.1722006, -0.4551474, 1, 1, 1, 1, 1,
-1.581083, 0.4748167, -1.58152, 1, 1, 1, 1, 1,
-1.577219, 0.4884805, -1.612544, 1, 1, 1, 1, 1,
-1.564708, -0.2334896, -0.3772045, 1, 1, 1, 1, 1,
-1.554938, 1.132463, -2.67963, 1, 1, 1, 1, 1,
-1.548942, -0.09729378, -1.578868, 1, 1, 1, 1, 1,
-1.546413, 1.156623, 0.3269346, 1, 1, 1, 1, 1,
-1.53178, 0.4850489, -0.7686586, 1, 1, 1, 1, 1,
-1.513759, -0.2446992, -1.523758, 1, 1, 1, 1, 1,
-1.487785, -0.5194219, -2.235249, 1, 1, 1, 1, 1,
-1.48401, 0.7421001, -2.186979, 1, 1, 1, 1, 1,
-1.472741, -1.355633, -1.982927, 0, 0, 1, 1, 1,
-1.463265, 0.4711366, -1.114012, 1, 0, 0, 1, 1,
-1.44738, -0.2835506, -2.872026, 1, 0, 0, 1, 1,
-1.429424, 2.307778, -2.694183, 1, 0, 0, 1, 1,
-1.420841, 0.06508654, -2.32253, 1, 0, 0, 1, 1,
-1.407401, 1.924277, 0.8921258, 1, 0, 0, 1, 1,
-1.401947, -1.97052, -1.909352, 0, 0, 0, 1, 1,
-1.38673, 0.3354151, -2.533478, 0, 0, 0, 1, 1,
-1.38384, 0.6166304, 0.4548801, 0, 0, 0, 1, 1,
-1.376506, -0.1325162, -1.904307, 0, 0, 0, 1, 1,
-1.368918, 0.8970037, -1.568309, 0, 0, 0, 1, 1,
-1.368161, 1.340187, -1.149335, 0, 0, 0, 1, 1,
-1.365952, 0.7817822, -1.180324, 0, 0, 0, 1, 1,
-1.362169, 0.3452809, -1.547757, 1, 1, 1, 1, 1,
-1.331923, 0.8065665, 0.02194233, 1, 1, 1, 1, 1,
-1.330768, 0.7135457, -0.3106565, 1, 1, 1, 1, 1,
-1.323165, -0.9171945, -4.040516, 1, 1, 1, 1, 1,
-1.316074, -0.5489118, 0.4681498, 1, 1, 1, 1, 1,
-1.306077, 0.5020021, -0.1518387, 1, 1, 1, 1, 1,
-1.304346, 1.319291, 0.01474996, 1, 1, 1, 1, 1,
-1.30156, -0.2273132, -1.842806, 1, 1, 1, 1, 1,
-1.299421, 0.4357196, -1.255512, 1, 1, 1, 1, 1,
-1.299022, -0.6552098, -0.7331505, 1, 1, 1, 1, 1,
-1.291712, 0.2188177, -1.086212, 1, 1, 1, 1, 1,
-1.290776, -0.3274027, 0.1231706, 1, 1, 1, 1, 1,
-1.274418, 0.003594395, -1.750661, 1, 1, 1, 1, 1,
-1.270487, 0.1144902, -2.063626, 1, 1, 1, 1, 1,
-1.261899, 1.172845, 0.1812705, 1, 1, 1, 1, 1,
-1.25465, -0.01643501, -2.67545, 0, 0, 1, 1, 1,
-1.247307, 0.5761636, -2.353237, 1, 0, 0, 1, 1,
-1.242434, -0.4048574, -1.353567, 1, 0, 0, 1, 1,
-1.225618, -1.263244, -3.194101, 1, 0, 0, 1, 1,
-1.223285, -0.767647, -3.073788, 1, 0, 0, 1, 1,
-1.209151, -0.7044787, -3.474004, 1, 0, 0, 1, 1,
-1.204117, -0.7829475, -2.445928, 0, 0, 0, 1, 1,
-1.203106, -1.045693, -3.665523, 0, 0, 0, 1, 1,
-1.195135, -1.734572, -4.12676, 0, 0, 0, 1, 1,
-1.194026, 1.02076, -0.712589, 0, 0, 0, 1, 1,
-1.192854, -0.5619444, -2.473903, 0, 0, 0, 1, 1,
-1.191608, -1.030831, -1.214681, 0, 0, 0, 1, 1,
-1.185889, -0.1219939, -1.062545, 0, 0, 0, 1, 1,
-1.180926, -1.489387, -3.199691, 1, 1, 1, 1, 1,
-1.178116, 1.284644, -0.1757915, 1, 1, 1, 1, 1,
-1.176803, -1.384781, -0.9004404, 1, 1, 1, 1, 1,
-1.175222, 0.07503384, -2.17081, 1, 1, 1, 1, 1,
-1.16567, -0.9413399, -3.050503, 1, 1, 1, 1, 1,
-1.15811, 0.1406978, -2.189133, 1, 1, 1, 1, 1,
-1.151632, 1.086535, -0.8415252, 1, 1, 1, 1, 1,
-1.143693, -1.801545, -2.377058, 1, 1, 1, 1, 1,
-1.138934, 1.190614, -1.878271, 1, 1, 1, 1, 1,
-1.133638, -0.7188864, -1.838188, 1, 1, 1, 1, 1,
-1.127547, 0.8714894, -0.8687362, 1, 1, 1, 1, 1,
-1.124969, -0.5319218, -3.644423, 1, 1, 1, 1, 1,
-1.114228, -0.1652094, -1.44629, 1, 1, 1, 1, 1,
-1.101128, 0.2406886, -0.4917966, 1, 1, 1, 1, 1,
-1.09386, -0.2590637, -1.101994, 1, 1, 1, 1, 1,
-1.062422, -0.4308956, 0.001945693, 0, 0, 1, 1, 1,
-1.062146, -1.080425, -3.867978, 1, 0, 0, 1, 1,
-1.053407, -0.8257334, -2.161404, 1, 0, 0, 1, 1,
-1.050006, -0.1482352, -1.110306, 1, 0, 0, 1, 1,
-1.04882, 1.294251, -1.047435, 1, 0, 0, 1, 1,
-1.048702, 2.227803, 0.2597181, 1, 0, 0, 1, 1,
-1.048041, -1.343177, -1.826424, 0, 0, 0, 1, 1,
-1.047191, -1.643573, -2.409319, 0, 0, 0, 1, 1,
-1.04577, -1.825583, -2.259466, 0, 0, 0, 1, 1,
-1.036253, 0.4446856, 0.1006158, 0, 0, 0, 1, 1,
-1.032519, -0.4409689, -1.51654, 0, 0, 0, 1, 1,
-1.032228, 0.840196, -1.734614, 0, 0, 0, 1, 1,
-1.030169, 0.268425, -3.1764, 0, 0, 0, 1, 1,
-1.029663, -0.09076272, -1.33241, 1, 1, 1, 1, 1,
-1.028286, 0.2786391, -0.5478388, 1, 1, 1, 1, 1,
-1.021162, 1.007733, -1.157057, 1, 1, 1, 1, 1,
-0.9972428, -0.63544, -2.621043, 1, 1, 1, 1, 1,
-0.9969512, 0.9802644, -1.090203, 1, 1, 1, 1, 1,
-0.9936993, -0.02462811, -4.171263, 1, 1, 1, 1, 1,
-0.9901956, -0.4553166, -1.236362, 1, 1, 1, 1, 1,
-0.9877657, 0.836131, -2.216032, 1, 1, 1, 1, 1,
-0.9872636, 0.9424584, -0.2073327, 1, 1, 1, 1, 1,
-0.9838682, 0.8611467, -1.018409, 1, 1, 1, 1, 1,
-0.9830027, 0.5334229, -0.1664198, 1, 1, 1, 1, 1,
-0.9818994, -0.3653016, -2.672115, 1, 1, 1, 1, 1,
-0.9814595, 1.195642, 0.9760788, 1, 1, 1, 1, 1,
-0.96994, -0.4636606, -1.476834, 1, 1, 1, 1, 1,
-0.9683784, -1.304301, -2.962111, 1, 1, 1, 1, 1,
-0.9672589, 0.5552133, -2.029589, 0, 0, 1, 1, 1,
-0.9523341, 0.1503899, -1.986333, 1, 0, 0, 1, 1,
-0.9488736, 1.829528, 0.1923496, 1, 0, 0, 1, 1,
-0.937693, 0.8949449, -0.0197741, 1, 0, 0, 1, 1,
-0.9370355, -0.1900073, -2.944613, 1, 0, 0, 1, 1,
-0.9362978, 1.915694, 0.02053559, 1, 0, 0, 1, 1,
-0.933897, -0.4200564, -3.236795, 0, 0, 0, 1, 1,
-0.9268241, 1.059501, -0.6438227, 0, 0, 0, 1, 1,
-0.9265507, -0.4070168, -3.407327, 0, 0, 0, 1, 1,
-0.9141096, -0.4714096, -2.096097, 0, 0, 0, 1, 1,
-0.9104566, 0.254951, -2.127532, 0, 0, 0, 1, 1,
-0.9080474, 0.9915309, 0.4563648, 0, 0, 0, 1, 1,
-0.9075761, 0.3285967, -0.9701753, 0, 0, 0, 1, 1,
-0.906598, -0.9960375, -1.238305, 1, 1, 1, 1, 1,
-0.9046119, 0.2266231, -2.559654, 1, 1, 1, 1, 1,
-0.8983934, -0.003173062, -0.7455446, 1, 1, 1, 1, 1,
-0.8869845, 0.387584, -0.5814948, 1, 1, 1, 1, 1,
-0.8741144, -1.316096, -3.345917, 1, 1, 1, 1, 1,
-0.8694175, -0.9069656, -4.556371, 1, 1, 1, 1, 1,
-0.868395, -0.07325436, -0.4579915, 1, 1, 1, 1, 1,
-0.8677019, -2.442248, -2.667695, 1, 1, 1, 1, 1,
-0.8674576, 0.1732619, -0.7882481, 1, 1, 1, 1, 1,
-0.863966, 0.9966075, -2.175076, 1, 1, 1, 1, 1,
-0.863072, 0.5035197, -1.861305, 1, 1, 1, 1, 1,
-0.8542514, 0.9060784, 0.5968965, 1, 1, 1, 1, 1,
-0.8540276, -1.397793, -2.181165, 1, 1, 1, 1, 1,
-0.850706, -1.790247, -1.989824, 1, 1, 1, 1, 1,
-0.8495374, -0.5602223, -3.013874, 1, 1, 1, 1, 1,
-0.8459542, 0.2371431, -2.42845, 0, 0, 1, 1, 1,
-0.8427223, -1.065084, -1.536228, 1, 0, 0, 1, 1,
-0.8389239, -0.654739, -0.5276248, 1, 0, 0, 1, 1,
-0.8384171, 0.3725363, -0.3666262, 1, 0, 0, 1, 1,
-0.8368757, 0.8153239, -0.1805101, 1, 0, 0, 1, 1,
-0.8297048, 2.034495, -1.918368, 1, 0, 0, 1, 1,
-0.8291574, 1.909676, 0.9248084, 0, 0, 0, 1, 1,
-0.8199581, 1.110726, 0.04331492, 0, 0, 0, 1, 1,
-0.8198127, -1.930029, -3.291265, 0, 0, 0, 1, 1,
-0.8146638, -0.5197154, -2.3186, 0, 0, 0, 1, 1,
-0.8110939, -0.07129464, -2.172456, 0, 0, 0, 1, 1,
-0.8100641, 2.357322, -2.140868, 0, 0, 0, 1, 1,
-0.8073574, -0.3260254, -0.3945544, 0, 0, 0, 1, 1,
-0.8059186, 0.2379161, 0.07395875, 1, 1, 1, 1, 1,
-0.8047438, 0.1188212, -2.12872, 1, 1, 1, 1, 1,
-0.8010637, -0.380664, -1.859477, 1, 1, 1, 1, 1,
-0.7968602, 1.500909, -0.4887145, 1, 1, 1, 1, 1,
-0.7946962, -2.363413, -4.200433, 1, 1, 1, 1, 1,
-0.7938352, 0.1490439, -0.9679425, 1, 1, 1, 1, 1,
-0.7898435, 0.2597094, -1.691402, 1, 1, 1, 1, 1,
-0.7880181, 1.404081, -0.4720367, 1, 1, 1, 1, 1,
-0.7860019, -1.878117, -3.886261, 1, 1, 1, 1, 1,
-0.7815579, 0.6554235, -1.879776, 1, 1, 1, 1, 1,
-0.7732619, 0.5740777, -0.5388644, 1, 1, 1, 1, 1,
-0.772306, -0.4452489, -0.566348, 1, 1, 1, 1, 1,
-0.7697346, -0.6812256, -1.902974, 1, 1, 1, 1, 1,
-0.7694639, 1.114249, -0.05943516, 1, 1, 1, 1, 1,
-0.7622678, -0.1903268, -3.103454, 1, 1, 1, 1, 1,
-0.7609335, -1.294362, -2.92016, 0, 0, 1, 1, 1,
-0.7576333, 0.392287, -1.603036, 1, 0, 0, 1, 1,
-0.7453308, 1.334303, -0.3941063, 1, 0, 0, 1, 1,
-0.7427397, -1.818688, -2.603409, 1, 0, 0, 1, 1,
-0.740779, 1.028326, 0.07620373, 1, 0, 0, 1, 1,
-0.7394007, 1.009216, -1.270394, 1, 0, 0, 1, 1,
-0.7383385, 0.999634, 0.2762138, 0, 0, 0, 1, 1,
-0.7379523, 1.975658, -0.248405, 0, 0, 0, 1, 1,
-0.7361431, 1.212415, -1.642048, 0, 0, 0, 1, 1,
-0.7351472, 1.265144, -0.3828857, 0, 0, 0, 1, 1,
-0.7270892, -0.2075001, -2.179657, 0, 0, 0, 1, 1,
-0.7218897, 0.4797002, -1.467297, 0, 0, 0, 1, 1,
-0.7158688, -0.9674109, -3.86196, 0, 0, 0, 1, 1,
-0.7127002, 0.6928437, -0.7882115, 1, 1, 1, 1, 1,
-0.7110568, -0.6212505, -2.408584, 1, 1, 1, 1, 1,
-0.7054679, -0.2264259, -0.8953863, 1, 1, 1, 1, 1,
-0.7031196, 0.6761482, -1.692034, 1, 1, 1, 1, 1,
-0.6997235, -0.4705901, -3.970686, 1, 1, 1, 1, 1,
-0.6992416, -1.725094, -3.498215, 1, 1, 1, 1, 1,
-0.6961263, 0.08800631, -0.6645277, 1, 1, 1, 1, 1,
-0.6911993, -0.6153421, -1.959344, 1, 1, 1, 1, 1,
-0.6890358, -0.9458421, -5.216971, 1, 1, 1, 1, 1,
-0.6825633, 0.3212935, -0.06135761, 1, 1, 1, 1, 1,
-0.6790465, -1.023168, -4.338106, 1, 1, 1, 1, 1,
-0.6745538, 1.323172, -0.619128, 1, 1, 1, 1, 1,
-0.6706142, -0.7168237, -2.785115, 1, 1, 1, 1, 1,
-0.6625459, -0.7350571, -2.914125, 1, 1, 1, 1, 1,
-0.6620969, -0.1677405, -1.523633, 1, 1, 1, 1, 1,
-0.6613122, 0.4968952, 1.055898, 0, 0, 1, 1, 1,
-0.6612853, 0.4669447, -2.710939, 1, 0, 0, 1, 1,
-0.6600184, -0.9173197, -3.367373, 1, 0, 0, 1, 1,
-0.6596041, -1.455474, -2.259121, 1, 0, 0, 1, 1,
-0.6574352, 0.01793885, -2.505671, 1, 0, 0, 1, 1,
-0.6562566, 0.09496377, -1.693642, 1, 0, 0, 1, 1,
-0.6551079, 0.2300831, 0.4054512, 0, 0, 0, 1, 1,
-0.6533382, -1.45695, -3.612024, 0, 0, 0, 1, 1,
-0.6528481, -0.965305, -1.504301, 0, 0, 0, 1, 1,
-0.648618, -2.328199, -5.359427, 0, 0, 0, 1, 1,
-0.6382282, 1.879959, 0.4131739, 0, 0, 0, 1, 1,
-0.6335454, -0.6151198, -1.157271, 0, 0, 0, 1, 1,
-0.6260048, -0.27437, -3.367157, 0, 0, 0, 1, 1,
-0.6207109, 0.6903446, 1.057224, 1, 1, 1, 1, 1,
-0.6131287, 0.4042824, -2.12436, 1, 1, 1, 1, 1,
-0.6127568, -0.3230569, -1.964129, 1, 1, 1, 1, 1,
-0.6110156, 1.085756, -1.055129, 1, 1, 1, 1, 1,
-0.6088991, 0.1049958, -2.025904, 1, 1, 1, 1, 1,
-0.6078147, 1.516506, -0.2171329, 1, 1, 1, 1, 1,
-0.6069601, 0.6321692, -1.955836, 1, 1, 1, 1, 1,
-0.6048652, -0.3658457, -1.471257, 1, 1, 1, 1, 1,
-0.6046278, 0.3781253, -0.2359268, 1, 1, 1, 1, 1,
-0.604102, -1.148557, -1.956546, 1, 1, 1, 1, 1,
-0.6009742, 0.06279702, -2.677524, 1, 1, 1, 1, 1,
-0.598895, -1.624081, -4.211248, 1, 1, 1, 1, 1,
-0.5915191, 1.900655, -1.517009, 1, 1, 1, 1, 1,
-0.5773596, 0.3842928, -0.2351996, 1, 1, 1, 1, 1,
-0.5767348, -0.01094406, -3.196987, 1, 1, 1, 1, 1,
-0.5749671, -0.2164915, -0.4340821, 0, 0, 1, 1, 1,
-0.5748506, 0.03271852, 0.1425966, 1, 0, 0, 1, 1,
-0.5736165, -0.08251037, -0.1921705, 1, 0, 0, 1, 1,
-0.5732706, -0.8081838, -2.681082, 1, 0, 0, 1, 1,
-0.571363, 0.6147287, -0.4474302, 1, 0, 0, 1, 1,
-0.5695442, -0.8713472, -3.23153, 1, 0, 0, 1, 1,
-0.5695384, 0.3180366, -0.424949, 0, 0, 0, 1, 1,
-0.5688022, -0.6033442, -2.626754, 0, 0, 0, 1, 1,
-0.564733, 0.3204188, -2.184252, 0, 0, 0, 1, 1,
-0.5644244, -0.9785107, -3.228706, 0, 0, 0, 1, 1,
-0.5639057, 0.01056889, -1.844358, 0, 0, 0, 1, 1,
-0.5633056, 0.4073334, -1.502789, 0, 0, 0, 1, 1,
-0.5629341, 0.6788795, -3.402265, 0, 0, 0, 1, 1,
-0.5608459, -0.8104765, -2.177529, 1, 1, 1, 1, 1,
-0.5591081, 1.519396, -0.7613263, 1, 1, 1, 1, 1,
-0.5531257, 0.1606951, -1.341185, 1, 1, 1, 1, 1,
-0.5418025, -0.238523, -3.310673, 1, 1, 1, 1, 1,
-0.5368184, 0.9463839, -1.34058, 1, 1, 1, 1, 1,
-0.5328469, -1.449402, -1.291962, 1, 1, 1, 1, 1,
-0.5316349, -0.06288166, -0.5124043, 1, 1, 1, 1, 1,
-0.5292079, 0.4165177, -1.031209, 1, 1, 1, 1, 1,
-0.5284779, -0.5657399, -3.582069, 1, 1, 1, 1, 1,
-0.5245609, 0.720336, -0.8948871, 1, 1, 1, 1, 1,
-0.5244704, 0.09244851, -0.3197468, 1, 1, 1, 1, 1,
-0.5170407, 0.2319316, -0.7048417, 1, 1, 1, 1, 1,
-0.5153418, -0.1591397, -2.096414, 1, 1, 1, 1, 1,
-0.5119215, 0.9133838, -1.245775, 1, 1, 1, 1, 1,
-0.5104359, -1.354147, -2.977988, 1, 1, 1, 1, 1,
-0.5069695, -0.3439378, -1.279929, 0, 0, 1, 1, 1,
-0.5039108, -0.2914477, -1.751544, 1, 0, 0, 1, 1,
-0.4986995, 0.6592262, 0.9027994, 1, 0, 0, 1, 1,
-0.4972667, -1.373113, -2.246438, 1, 0, 0, 1, 1,
-0.4920026, -0.7541801, -3.555716, 1, 0, 0, 1, 1,
-0.4878761, -0.3977789, -3.549987, 1, 0, 0, 1, 1,
-0.4874812, 1.069308, -0.4347133, 0, 0, 0, 1, 1,
-0.4862382, -1.189127, -3.221904, 0, 0, 0, 1, 1,
-0.4832687, 0.6563141, -2.123019, 0, 0, 0, 1, 1,
-0.4742038, 0.04236208, -2.897677, 0, 0, 0, 1, 1,
-0.4724461, 0.1716672, 0.3411602, 0, 0, 0, 1, 1,
-0.4716072, 2.224747, -0.5175707, 0, 0, 0, 1, 1,
-0.4697111, 0.1022461, -4.000132, 0, 0, 0, 1, 1,
-0.4691603, 0.4044726, 0.85877, 1, 1, 1, 1, 1,
-0.4690729, 0.1303684, 0.8329562, 1, 1, 1, 1, 1,
-0.4664207, -0.112059, -3.310997, 1, 1, 1, 1, 1,
-0.4651478, 1.044094, -1.131818, 1, 1, 1, 1, 1,
-0.4525642, -0.08534207, -1.018732, 1, 1, 1, 1, 1,
-0.450515, 0.9185309, -0.6255879, 1, 1, 1, 1, 1,
-0.4446535, 0.3728536, -1.782318, 1, 1, 1, 1, 1,
-0.4446051, 1.556506, -0.8393657, 1, 1, 1, 1, 1,
-0.4444088, -1.140574, -2.277587, 1, 1, 1, 1, 1,
-0.4435108, 1.007874, -1.393486, 1, 1, 1, 1, 1,
-0.4427472, 1.207151, -0.3548432, 1, 1, 1, 1, 1,
-0.440823, 0.9246316, 0.1006508, 1, 1, 1, 1, 1,
-0.4378774, 0.8530658, -1.95985, 1, 1, 1, 1, 1,
-0.4331602, -0.5251642, -3.917334, 1, 1, 1, 1, 1,
-0.4329062, 0.3839939, 0.1107729, 1, 1, 1, 1, 1,
-0.4316659, -0.7757843, -1.570336, 0, 0, 1, 1, 1,
-0.4280223, -1.428642, -3.716742, 1, 0, 0, 1, 1,
-0.4266591, -1.566007, -3.295714, 1, 0, 0, 1, 1,
-0.4241567, -0.2290381, -3.490162, 1, 0, 0, 1, 1,
-0.421091, -0.8084159, -4.785322, 1, 0, 0, 1, 1,
-0.4197957, 0.3886709, -1.315919, 1, 0, 0, 1, 1,
-0.418173, -1.239514, -2.507608, 0, 0, 0, 1, 1,
-0.4146156, -0.1289439, -1.057984, 0, 0, 0, 1, 1,
-0.4134651, -0.2994228, -3.57321, 0, 0, 0, 1, 1,
-0.4124626, 1.255268, -0.5861683, 0, 0, 0, 1, 1,
-0.4101137, -0.04905442, -2.127409, 0, 0, 0, 1, 1,
-0.409159, -0.8712565, -4.440692, 0, 0, 0, 1, 1,
-0.4027519, 0.5055127, -0.831257, 0, 0, 0, 1, 1,
-0.4023641, -0.6138634, -0.5149739, 1, 1, 1, 1, 1,
-0.4004034, -0.9293764, -1.674959, 1, 1, 1, 1, 1,
-0.3952811, -0.3147027, -1.407783, 1, 1, 1, 1, 1,
-0.3880107, -0.9120073, -2.437398, 1, 1, 1, 1, 1,
-0.3878944, 0.9089008, -0.8342926, 1, 1, 1, 1, 1,
-0.375495, 1.105219, -1.39341, 1, 1, 1, 1, 1,
-0.3753629, -2.029053, -0.6231242, 1, 1, 1, 1, 1,
-0.374373, 1.318222, 0.9517695, 1, 1, 1, 1, 1,
-0.3731081, 0.4623681, -0.2801492, 1, 1, 1, 1, 1,
-0.3649257, 0.5676948, -0.8072151, 1, 1, 1, 1, 1,
-0.3515077, -1.52202, -4.226925, 1, 1, 1, 1, 1,
-0.346605, 1.168866, -1.612296, 1, 1, 1, 1, 1,
-0.344966, -1.275801, -1.63367, 1, 1, 1, 1, 1,
-0.3405035, 2.730271, 0.6148316, 1, 1, 1, 1, 1,
-0.3387454, -0.0376692, -0.3210947, 1, 1, 1, 1, 1,
-0.3373073, -2.848074, -2.464872, 0, 0, 1, 1, 1,
-0.3343717, -2.130858, -3.859648, 1, 0, 0, 1, 1,
-0.3313309, 1.102969, -1.155224, 1, 0, 0, 1, 1,
-0.3305349, 0.767541, -2.11361, 1, 0, 0, 1, 1,
-0.3284054, -2.209788, -2.900987, 1, 0, 0, 1, 1,
-0.3223955, 1.09223, 1.361125, 1, 0, 0, 1, 1,
-0.3121125, 0.1504368, -1.324328, 0, 0, 0, 1, 1,
-0.3071572, 0.846, 0.1576833, 0, 0, 0, 1, 1,
-0.306981, 0.04423463, 0.4049831, 0, 0, 0, 1, 1,
-0.3044302, -1.189098, -3.49405, 0, 0, 0, 1, 1,
-0.3040828, -0.2233056, -2.546896, 0, 0, 0, 1, 1,
-0.2987518, -0.06664188, -2.881412, 0, 0, 0, 1, 1,
-0.2978952, 0.1811366, 0.4732, 0, 0, 0, 1, 1,
-0.2952931, -0.6633661, -2.063672, 1, 1, 1, 1, 1,
-0.2924949, 0.2469669, -1.384459, 1, 1, 1, 1, 1,
-0.2917149, 1.678378, 1.12564, 1, 1, 1, 1, 1,
-0.2867726, 0.08740854, -1.394772, 1, 1, 1, 1, 1,
-0.2824211, -0.01839114, -0.017895, 1, 1, 1, 1, 1,
-0.2821101, 0.9927014, 0.3238911, 1, 1, 1, 1, 1,
-0.2784514, 0.7102539, 0.1966852, 1, 1, 1, 1, 1,
-0.2783273, 0.2211688, -2.874675, 1, 1, 1, 1, 1,
-0.2767289, 0.9545555, -1.57489, 1, 1, 1, 1, 1,
-0.2723365, 0.1780602, -0.8261701, 1, 1, 1, 1, 1,
-0.2676149, -1.030609, -3.154455, 1, 1, 1, 1, 1,
-0.2657359, 0.07832296, -0.9329954, 1, 1, 1, 1, 1,
-0.2596446, 1.250386, 0.2621395, 1, 1, 1, 1, 1,
-0.2592635, 0.8400002, 0.9910934, 1, 1, 1, 1, 1,
-0.2587051, -0.5694648, -3.30466, 1, 1, 1, 1, 1,
-0.2551942, -0.2246688, -3.309089, 0, 0, 1, 1, 1,
-0.2545708, 1.561142, -0.7182959, 1, 0, 0, 1, 1,
-0.2526416, 0.305691, 1.329849, 1, 0, 0, 1, 1,
-0.2516021, -1.161761, -4.681956, 1, 0, 0, 1, 1,
-0.2489281, -0.1006573, -3.300901, 1, 0, 0, 1, 1,
-0.2483938, -1.830277, -3.652997, 1, 0, 0, 1, 1,
-0.2469271, 0.3119462, -1.689192, 0, 0, 0, 1, 1,
-0.2460452, 0.2948349, -1.603845, 0, 0, 0, 1, 1,
-0.2433479, -0.6529434, -2.168377, 0, 0, 0, 1, 1,
-0.2418427, -1.685475, -3.945133, 0, 0, 0, 1, 1,
-0.2254712, -0.285288, -0.7273387, 0, 0, 0, 1, 1,
-0.2246494, -1.444753, -2.43227, 0, 0, 0, 1, 1,
-0.2216772, -0.499001, -2.41564, 0, 0, 0, 1, 1,
-0.2207813, -0.6923391, -1.097445, 1, 1, 1, 1, 1,
-0.218675, -1.420773, -3.685097, 1, 1, 1, 1, 1,
-0.2176451, -2.179315, -2.474564, 1, 1, 1, 1, 1,
-0.2173773, -0.568733, -1.757702, 1, 1, 1, 1, 1,
-0.2159571, -0.1570126, -0.4114715, 1, 1, 1, 1, 1,
-0.2149284, -1.102356, -1.428449, 1, 1, 1, 1, 1,
-0.2095705, -1.212507, -3.245318, 1, 1, 1, 1, 1,
-0.2092777, 0.1454096, -0.6599411, 1, 1, 1, 1, 1,
-0.2083834, 0.604986, -1.151563, 1, 1, 1, 1, 1,
-0.2011426, -0.6510022, -1.729462, 1, 1, 1, 1, 1,
-0.195282, 0.3430049, -0.8675047, 1, 1, 1, 1, 1,
-0.1938795, 0.4848447, -0.8980385, 1, 1, 1, 1, 1,
-0.1893303, 1.772849, -0.8609683, 1, 1, 1, 1, 1,
-0.1882264, -0.969127, -2.05742, 1, 1, 1, 1, 1,
-0.1848791, -0.1249769, -2.948565, 1, 1, 1, 1, 1,
-0.1842219, -0.4970641, -1.725567, 0, 0, 1, 1, 1,
-0.1770831, 0.3409472, -0.5009454, 1, 0, 0, 1, 1,
-0.1758516, 0.1800468, -1.214672, 1, 0, 0, 1, 1,
-0.1751707, 0.7179614, -0.4356964, 1, 0, 0, 1, 1,
-0.1747436, 0.3798711, 1.882937, 1, 0, 0, 1, 1,
-0.1740457, 1.890945, -0.2807093, 1, 0, 0, 1, 1,
-0.1674411, 1.961551, -0.2359432, 0, 0, 0, 1, 1,
-0.1541881, 0.3289821, -0.9714565, 0, 0, 0, 1, 1,
-0.1496206, -1.090895, -2.869364, 0, 0, 0, 1, 1,
-0.1491397, 0.9939819, 0.8308779, 0, 0, 0, 1, 1,
-0.1490192, -1.487495, -3.926369, 0, 0, 0, 1, 1,
-0.1485078, -0.9416769, -3.535231, 0, 0, 0, 1, 1,
-0.1465665, -0.5122018, -2.084594, 0, 0, 0, 1, 1,
-0.1463783, -0.9540977, -2.685279, 1, 1, 1, 1, 1,
-0.1396977, -0.8997182, -3.47305, 1, 1, 1, 1, 1,
-0.1383537, -0.5527747, -2.297352, 1, 1, 1, 1, 1,
-0.1381574, 0.187748, 0.2160569, 1, 1, 1, 1, 1,
-0.1363253, -0.1495082, -1.580429, 1, 1, 1, 1, 1,
-0.1359744, 1.741427, -0.4679562, 1, 1, 1, 1, 1,
-0.1342424, -0.7826805, -2.212259, 1, 1, 1, 1, 1,
-0.1319653, -2.024913, -0.6459166, 1, 1, 1, 1, 1,
-0.1319225, 0.02940629, -0.2350531, 1, 1, 1, 1, 1,
-0.131327, -0.5195174, -4.627012, 1, 1, 1, 1, 1,
-0.122542, -1.888142, -2.585819, 1, 1, 1, 1, 1,
-0.1193395, -1.888348, -3.290381, 1, 1, 1, 1, 1,
-0.1185857, 1.526834, 0.3222643, 1, 1, 1, 1, 1,
-0.1146556, 0.9656743, 0.1910802, 1, 1, 1, 1, 1,
-0.1139233, -0.5858647, -2.804579, 1, 1, 1, 1, 1,
-0.1109353, -0.09828253, -2.104866, 0, 0, 1, 1, 1,
-0.1106162, 0.6622331, 0.7376342, 1, 0, 0, 1, 1,
-0.106767, -0.260826, -3.220645, 1, 0, 0, 1, 1,
-0.1059071, 1.089544, 0.8111147, 1, 0, 0, 1, 1,
-0.1045006, -0.1829227, -1.053821, 1, 0, 0, 1, 1,
-0.1040848, 1.646529, 0.6148052, 1, 0, 0, 1, 1,
-0.09932355, -0.04412563, -1.31362, 0, 0, 0, 1, 1,
-0.09634011, -1.689809, -1.734726, 0, 0, 0, 1, 1,
-0.0915564, 0.06057889, -0.202028, 0, 0, 0, 1, 1,
-0.08913218, 1.200908, 0.6090365, 0, 0, 0, 1, 1,
-0.08900028, 0.248452, -1.21039, 0, 0, 0, 1, 1,
-0.08393221, -0.8546603, -4.211246, 0, 0, 0, 1, 1,
-0.08330555, 2.573797, 0.2119258, 0, 0, 0, 1, 1,
-0.07887941, 0.5036919, -0.981135, 1, 1, 1, 1, 1,
-0.07851156, 2.150423, -0.3256601, 1, 1, 1, 1, 1,
-0.07530658, 0.008546054, 0.327161, 1, 1, 1, 1, 1,
-0.07455995, -0.7474824, -3.009337, 1, 1, 1, 1, 1,
-0.07168864, 0.09418155, 0.1745789, 1, 1, 1, 1, 1,
-0.07153065, 0.4738491, 1.813496, 1, 1, 1, 1, 1,
-0.06796736, 0.4953766, 1.006542, 1, 1, 1, 1, 1,
-0.06368044, 0.7994288, -0.452031, 1, 1, 1, 1, 1,
-0.06292887, -0.5794904, -2.260604, 1, 1, 1, 1, 1,
-0.06263246, 1.244189, -0.1475238, 1, 1, 1, 1, 1,
-0.05458025, -1.041463, -4.933751, 1, 1, 1, 1, 1,
-0.05222579, 0.6569772, 0.5908391, 1, 1, 1, 1, 1,
-0.05208988, 1.244942, 0.251196, 1, 1, 1, 1, 1,
-0.04912245, -1.272551, -4.327015, 1, 1, 1, 1, 1,
-0.04868256, -1.853468, -2.642694, 1, 1, 1, 1, 1,
-0.04847428, 1.047554, 1.152393, 0, 0, 1, 1, 1,
-0.04721307, -1.439291, -3.441062, 1, 0, 0, 1, 1,
-0.04434218, -1.460699, -1.316823, 1, 0, 0, 1, 1,
-0.0382814, -0.8892623, -1.452431, 1, 0, 0, 1, 1,
-0.03675395, -0.2317741, -2.526319, 1, 0, 0, 1, 1,
-0.03471803, 0.9539815, -0.7601891, 1, 0, 0, 1, 1,
-0.0306362, 0.3494762, 0.5307204, 0, 0, 0, 1, 1,
-0.02027525, -0.1774256, -3.732975, 0, 0, 0, 1, 1,
-0.01988715, 0.00794844, -0.9297981, 0, 0, 0, 1, 1,
-0.01961898, 0.4238448, -0.6663256, 0, 0, 0, 1, 1,
-0.01885002, 1.94161, -0.4069806, 0, 0, 0, 1, 1,
-0.01651721, 0.03971891, -1.816018, 0, 0, 0, 1, 1,
-0.01367524, 0.290496, 1.011177, 0, 0, 0, 1, 1,
-0.01080725, -1.271142, -2.507467, 1, 1, 1, 1, 1,
-0.01061021, 0.1693725, -0.2725394, 1, 1, 1, 1, 1,
-0.01057415, 0.340399, -1.708514, 1, 1, 1, 1, 1,
-0.009442566, -0.4402785, -3.294514, 1, 1, 1, 1, 1,
-0.00910957, 0.6243836, 1.024571, 1, 1, 1, 1, 1,
-0.00850792, 1.0032, 0.6334127, 1, 1, 1, 1, 1,
-0.007453444, -0.1119742, -2.496197, 1, 1, 1, 1, 1,
-0.003308285, 0.2657261, 1.291734, 1, 1, 1, 1, 1,
0.002340483, -0.7626841, 3.603477, 1, 1, 1, 1, 1,
0.003167628, 1.510515, 0.01844676, 1, 1, 1, 1, 1,
0.004464671, 0.3385982, 0.2414438, 1, 1, 1, 1, 1,
0.005925014, -1.004287, 2.590462, 1, 1, 1, 1, 1,
0.0103089, 0.06961661, -0.4211084, 1, 1, 1, 1, 1,
0.01520403, 1.135974, 0.9714327, 1, 1, 1, 1, 1,
0.01971907, 0.913663, 0.876089, 1, 1, 1, 1, 1,
0.02191708, 0.6289691, 0.9369177, 0, 0, 1, 1, 1,
0.02284519, -0.7794951, 4.20546, 1, 0, 0, 1, 1,
0.02360056, 0.894678, 0.4971604, 1, 0, 0, 1, 1,
0.02601537, -0.9940751, 4.140222, 1, 0, 0, 1, 1,
0.02983684, -0.3997234, 1.498357, 1, 0, 0, 1, 1,
0.03006469, -0.6320692, 3.627843, 1, 0, 0, 1, 1,
0.0334085, -1.675008, 3.066256, 0, 0, 0, 1, 1,
0.03514862, 1.664281, -1.306494, 0, 0, 0, 1, 1,
0.03816153, -0.7095727, 4.596895, 0, 0, 0, 1, 1,
0.03841135, -1.118613, 3.977239, 0, 0, 0, 1, 1,
0.04102182, 0.4954498, -0.4993799, 0, 0, 0, 1, 1,
0.04242932, 0.1894249, 0.450319, 0, 0, 0, 1, 1,
0.04307522, -0.5338257, 3.008363, 0, 0, 0, 1, 1,
0.04337198, -0.3979836, 1.228155, 1, 1, 1, 1, 1,
0.04793849, -0.4501537, 4.638988, 1, 1, 1, 1, 1,
0.04798351, -1.376971, 3.817791, 1, 1, 1, 1, 1,
0.05645604, 1.210003, 0.7165489, 1, 1, 1, 1, 1,
0.05780002, -0.381713, 2.253764, 1, 1, 1, 1, 1,
0.058908, 0.7051528, 0.3609378, 1, 1, 1, 1, 1,
0.06242123, 0.1024642, -0.09689023, 1, 1, 1, 1, 1,
0.0637865, 0.1106517, 2.294701, 1, 1, 1, 1, 1,
0.06404898, 1.568278, 0.3838641, 1, 1, 1, 1, 1,
0.06532843, 0.01693997, -0.408896, 1, 1, 1, 1, 1,
0.06627961, -1.623879, 3.01052, 1, 1, 1, 1, 1,
0.06992663, -1.795622, 2.126768, 1, 1, 1, 1, 1,
0.07787967, -0.1428979, 3.416719, 1, 1, 1, 1, 1,
0.0818874, 0.6965207, 0.1639034, 1, 1, 1, 1, 1,
0.08372794, 0.05874568, 1.566344, 1, 1, 1, 1, 1,
0.08633002, 0.7825035, -0.1346184, 0, 0, 1, 1, 1,
0.08711014, -1.320608, 3.989744, 1, 0, 0, 1, 1,
0.08856586, -0.3856539, 2.949442, 1, 0, 0, 1, 1,
0.08872756, -0.4106122, 2.142904, 1, 0, 0, 1, 1,
0.09056976, -0.6576083, 1.20438, 1, 0, 0, 1, 1,
0.09282742, -0.7221851, 3.20302, 1, 0, 0, 1, 1,
0.09888362, 0.1203295, 1.101907, 0, 0, 0, 1, 1,
0.1012979, -0.3065342, 4.003662, 0, 0, 0, 1, 1,
0.1013401, 1.368324, 0.4303385, 0, 0, 0, 1, 1,
0.1061968, -0.3757476, 1.797745, 0, 0, 0, 1, 1,
0.1086443, -1.681112, 4.370163, 0, 0, 0, 1, 1,
0.1125088, -0.5840689, 2.618562, 0, 0, 0, 1, 1,
0.1127707, -0.2340712, 3.48659, 0, 0, 0, 1, 1,
0.1172753, 0.5621237, -1.322728, 1, 1, 1, 1, 1,
0.1174009, 1.322407, -0.4497366, 1, 1, 1, 1, 1,
0.1222634, 1.797067, 0.2893854, 1, 1, 1, 1, 1,
0.1237867, 0.9113925, 0.1611746, 1, 1, 1, 1, 1,
0.1244762, 0.3402621, -0.6196318, 1, 1, 1, 1, 1,
0.1247116, 0.3938779, -0.01010902, 1, 1, 1, 1, 1,
0.1285205, -0.8603436, 3.303333, 1, 1, 1, 1, 1,
0.1287055, 0.05402523, 1.298324, 1, 1, 1, 1, 1,
0.1316972, -1.58583, 2.540049, 1, 1, 1, 1, 1,
0.1329678, -0.3341205, 3.037024, 1, 1, 1, 1, 1,
0.139589, -0.6471868, 2.675553, 1, 1, 1, 1, 1,
0.1419683, 0.0219572, 2.439916, 1, 1, 1, 1, 1,
0.1426737, -0.2143756, 3.424109, 1, 1, 1, 1, 1,
0.143839, -0.4641448, 3.074443, 1, 1, 1, 1, 1,
0.147556, 1.686527, 3.06543, 1, 1, 1, 1, 1,
0.1489176, -1.732347, 3.082607, 0, 0, 1, 1, 1,
0.1524069, 1.217829, 0.9042571, 1, 0, 0, 1, 1,
0.1529561, -0.2485899, 2.774729, 1, 0, 0, 1, 1,
0.1588125, 0.5783723, -0.7640173, 1, 0, 0, 1, 1,
0.1590896, 0.2646426, 0.6725811, 1, 0, 0, 1, 1,
0.1595709, -0.2864017, 2.585007, 1, 0, 0, 1, 1,
0.1614114, 0.4511986, 0.5059712, 0, 0, 0, 1, 1,
0.1616968, -0.48247, 3.50683, 0, 0, 0, 1, 1,
0.1622616, 1.285677, -1.288142, 0, 0, 0, 1, 1,
0.1681594, -1.01207, 3.04599, 0, 0, 0, 1, 1,
0.1695766, 0.7707125, -0.05660052, 0, 0, 0, 1, 1,
0.1752065, 1.082478, -0.7165904, 0, 0, 0, 1, 1,
0.1846533, 0.5337996, 1.834712, 0, 0, 0, 1, 1,
0.185564, 0.3541149, 0.5839658, 1, 1, 1, 1, 1,
0.190775, -0.9562505, 3.578316, 1, 1, 1, 1, 1,
0.1917634, 0.4200014, -0.5488358, 1, 1, 1, 1, 1,
0.1924716, 1.089079, 0.8750663, 1, 1, 1, 1, 1,
0.2012057, 1.825049, 0.5754479, 1, 1, 1, 1, 1,
0.2023911, 2.477336, -1.088757, 1, 1, 1, 1, 1,
0.2044912, 1.846253, -1.427395, 1, 1, 1, 1, 1,
0.2081028, -0.4424117, 2.532589, 1, 1, 1, 1, 1,
0.2095667, -0.1167675, 1.758091, 1, 1, 1, 1, 1,
0.2117569, 1.15871, 0.2031639, 1, 1, 1, 1, 1,
0.2182249, 1.098407, 0.6583731, 1, 1, 1, 1, 1,
0.2204562, 1.181249, 0.451928, 1, 1, 1, 1, 1,
0.2229674, 1.418138, 1.12627, 1, 1, 1, 1, 1,
0.2237982, 0.1215444, 0.4249933, 1, 1, 1, 1, 1,
0.226327, 0.5305705, 0.2868482, 1, 1, 1, 1, 1,
0.2274302, -1.396732, 2.065222, 0, 0, 1, 1, 1,
0.2286435, 1.566154, 0.1397549, 1, 0, 0, 1, 1,
0.2307435, 0.9387147, 1.285864, 1, 0, 0, 1, 1,
0.2320515, -0.6316692, 1.738329, 1, 0, 0, 1, 1,
0.2326602, 0.07475171, 2.711292, 1, 0, 0, 1, 1,
0.2387183, 1.066633, 0.3766272, 1, 0, 0, 1, 1,
0.2400726, 1.486184, -1.911228, 0, 0, 0, 1, 1,
0.2417511, -0.674434, 2.364593, 0, 0, 0, 1, 1,
0.2512152, 1.06673, -1.017759, 0, 0, 0, 1, 1,
0.2524993, 0.6965517, -0.2092666, 0, 0, 0, 1, 1,
0.255589, 0.5505714, 0.518785, 0, 0, 0, 1, 1,
0.2559028, -1.228458, 2.367387, 0, 0, 0, 1, 1,
0.2570744, 0.7332401, -0.03984253, 0, 0, 0, 1, 1,
0.2647475, -0.8529162, 2.841611, 1, 1, 1, 1, 1,
0.2652149, 0.03569999, 2.06556, 1, 1, 1, 1, 1,
0.2675675, -0.5041127, 3.084958, 1, 1, 1, 1, 1,
0.268189, -0.7082849, 2.156213, 1, 1, 1, 1, 1,
0.268355, 0.1301845, 2.192511, 1, 1, 1, 1, 1,
0.2686912, -1.484075, 3.514707, 1, 1, 1, 1, 1,
0.2723965, 2.007764, -2.037345, 1, 1, 1, 1, 1,
0.2764544, 0.3078086, 1.412942, 1, 1, 1, 1, 1,
0.2770087, 2.905012, 1.16748, 1, 1, 1, 1, 1,
0.2778565, -0.5887314, 1.932414, 1, 1, 1, 1, 1,
0.2782033, -0.8087534, 2.039645, 1, 1, 1, 1, 1,
0.2809683, -2.158215, 3.297214, 1, 1, 1, 1, 1,
0.2834864, 0.9148225, 1.811603, 1, 1, 1, 1, 1,
0.2877471, 1.024123, 2.546245, 1, 1, 1, 1, 1,
0.2908963, 0.5975059, -0.773921, 1, 1, 1, 1, 1,
0.2917303, 0.0111188, 1.989971, 0, 0, 1, 1, 1,
0.2944177, -0.8195593, 2.280233, 1, 0, 0, 1, 1,
0.2982516, -1.310657, 4.383811, 1, 0, 0, 1, 1,
0.3006055, -0.997117, 3.627563, 1, 0, 0, 1, 1,
0.3032407, -0.9990301, 3.456071, 1, 0, 0, 1, 1,
0.3044372, -0.2346857, 1.844889, 1, 0, 0, 1, 1,
0.3060082, -2.450913, 3.790007, 0, 0, 0, 1, 1,
0.3087168, 0.162621, -0.4698042, 0, 0, 0, 1, 1,
0.3089128, 0.9217985, -0.2391359, 0, 0, 0, 1, 1,
0.3109379, -0.5532199, 2.284605, 0, 0, 0, 1, 1,
0.3165129, 1.004347, -0.2601571, 0, 0, 0, 1, 1,
0.3180861, -0.9639157, 1.690953, 0, 0, 0, 1, 1,
0.3182244, -1.073385, 2.694798, 0, 0, 0, 1, 1,
0.3257113, -0.906589, 3.735778, 1, 1, 1, 1, 1,
0.3261724, 2.011033, -0.8302072, 1, 1, 1, 1, 1,
0.3263907, 0.3009025, 0.3687142, 1, 1, 1, 1, 1,
0.327117, 0.7414728, 1.235627, 1, 1, 1, 1, 1,
0.3341373, -1.675555, 4.16351, 1, 1, 1, 1, 1,
0.3399685, 2.391503, 1.859032, 1, 1, 1, 1, 1,
0.3437979, 1.354945, 1.125154, 1, 1, 1, 1, 1,
0.343913, -0.7938527, 2.553651, 1, 1, 1, 1, 1,
0.3456573, -1.10564, 3.51952, 1, 1, 1, 1, 1,
0.3474298, -1.307793, 1.837091, 1, 1, 1, 1, 1,
0.3607697, 0.7590309, 0.5097579, 1, 1, 1, 1, 1,
0.3632048, -0.5312151, 2.571203, 1, 1, 1, 1, 1,
0.3652939, -0.1383025, 4.378271, 1, 1, 1, 1, 1,
0.3674384, -0.1716004, 1.56041, 1, 1, 1, 1, 1,
0.3738429, 0.4793674, 0.1995047, 1, 1, 1, 1, 1,
0.3749843, 1.133447, 1.225595, 0, 0, 1, 1, 1,
0.3766189, 1.341146, -0.9700784, 1, 0, 0, 1, 1,
0.3784025, 0.3227011, 1.345954, 1, 0, 0, 1, 1,
0.3818009, 2.268478, 0.4083527, 1, 0, 0, 1, 1,
0.3837251, 1.309286, -0.2949041, 1, 0, 0, 1, 1,
0.384646, 0.0876709, 1.448658, 1, 0, 0, 1, 1,
0.3869069, 0.5586337, 2.735765, 0, 0, 0, 1, 1,
0.3872696, -0.1986116, 1.042392, 0, 0, 0, 1, 1,
0.390822, 0.3456792, 0.5053239, 0, 0, 0, 1, 1,
0.3923756, 0.1335709, 0.384961, 0, 0, 0, 1, 1,
0.3923946, 0.07678872, 1.599718, 0, 0, 0, 1, 1,
0.3932928, -1.04334, 2.51612, 0, 0, 0, 1, 1,
0.3962704, 0.5002776, 1.198963, 0, 0, 0, 1, 1,
0.400042, 0.4764347, 0.02160125, 1, 1, 1, 1, 1,
0.4094197, 1.647939, 1.597267, 1, 1, 1, 1, 1,
0.4117689, -0.56474, 3.37928, 1, 1, 1, 1, 1,
0.4152944, -0.1245774, 0.471315, 1, 1, 1, 1, 1,
0.4170807, -0.4075347, 0.1803409, 1, 1, 1, 1, 1,
0.4175606, -2.097385, 2.034658, 1, 1, 1, 1, 1,
0.4192934, -1.203535, 3.357529, 1, 1, 1, 1, 1,
0.4234616, -2.231744, 3.318129, 1, 1, 1, 1, 1,
0.4286101, 0.3599537, -0.1106578, 1, 1, 1, 1, 1,
0.4306488, -1.062077, 3.89467, 1, 1, 1, 1, 1,
0.4356419, -1.309546, 2.605022, 1, 1, 1, 1, 1,
0.4364393, -1.975479, 2.278853, 1, 1, 1, 1, 1,
0.4364693, -1.821574, 3.253549, 1, 1, 1, 1, 1,
0.4365499, 1.577764, 0.200256, 1, 1, 1, 1, 1,
0.4453511, -1.941706, 2.541098, 1, 1, 1, 1, 1,
0.4458591, -0.4030806, 2.152255, 0, 0, 1, 1, 1,
0.448392, -1.99795, 2.997895, 1, 0, 0, 1, 1,
0.4490619, -0.5850759, 3.363478, 1, 0, 0, 1, 1,
0.452612, 1.34376, -1.13093, 1, 0, 0, 1, 1,
0.4543078, 0.02589478, 1.480283, 1, 0, 0, 1, 1,
0.4559798, -0.2851853, 2.548388, 1, 0, 0, 1, 1,
0.4564111, 1.156393, 0.03061051, 0, 0, 0, 1, 1,
0.461794, 0.6355149, 1.355722, 0, 0, 0, 1, 1,
0.4648282, -0.09528385, 0.2449198, 0, 0, 0, 1, 1,
0.4653203, -1.704946, 4.67889, 0, 0, 0, 1, 1,
0.4698003, -0.2903503, 2.599453, 0, 0, 0, 1, 1,
0.473119, 0.9318379, 2.336122, 0, 0, 0, 1, 1,
0.4766814, -0.5941675, 2.91178, 0, 0, 0, 1, 1,
0.4777786, 0.04644733, 1.898741, 1, 1, 1, 1, 1,
0.4783971, -1.099039, 2.004658, 1, 1, 1, 1, 1,
0.4800985, -0.8879992, 2.683223, 1, 1, 1, 1, 1,
0.4827726, -1.183764, 1.916474, 1, 1, 1, 1, 1,
0.4828295, 0.4114795, 1.093098, 1, 1, 1, 1, 1,
0.484598, 0.167771, 0.8209835, 1, 1, 1, 1, 1,
0.4849043, -0.7250847, 1.587813, 1, 1, 1, 1, 1,
0.4870839, -0.3087435, 3.685926, 1, 1, 1, 1, 1,
0.4888014, 0.8284411, 0.06217165, 1, 1, 1, 1, 1,
0.4980336, -0.1654386, 1.709891, 1, 1, 1, 1, 1,
0.4998016, 0.2712824, 0.5048639, 1, 1, 1, 1, 1,
0.5028569, 1.240938, 1.924468, 1, 1, 1, 1, 1,
0.503676, -0.12151, 2.839625, 1, 1, 1, 1, 1,
0.5086533, 1.678433, 1.124188, 1, 1, 1, 1, 1,
0.51556, 1.234433, 0.6080898, 1, 1, 1, 1, 1,
0.515977, -1.609077, 3.261674, 0, 0, 1, 1, 1,
0.5162882, 1.728705, -0.8399857, 1, 0, 0, 1, 1,
0.5188119, -1.976225, 3.469129, 1, 0, 0, 1, 1,
0.5233605, -1.889146, 2.286769, 1, 0, 0, 1, 1,
0.5289252, 1.935628, -1.347001, 1, 0, 0, 1, 1,
0.528961, -1.789306, 2.89179, 1, 0, 0, 1, 1,
0.5302415, -1.225253, 1.65401, 0, 0, 0, 1, 1,
0.5304708, -0.2804144, 3.283464, 0, 0, 0, 1, 1,
0.5314431, -0.2877487, 2.78996, 0, 0, 0, 1, 1,
0.5321741, 0.7361651, 1.682475, 0, 0, 0, 1, 1,
0.5330572, 0.5937136, -0.2205508, 0, 0, 0, 1, 1,
0.5352078, -0.4298632, 1.746551, 0, 0, 0, 1, 1,
0.5367433, -0.1935492, 2.258596, 0, 0, 0, 1, 1,
0.5368261, 1.044251, 1.890436, 1, 1, 1, 1, 1,
0.5499456, -0.3900799, 2.106823, 1, 1, 1, 1, 1,
0.556664, -1.220539, 1.867855, 1, 1, 1, 1, 1,
0.557867, 1.401372, 0.5580152, 1, 1, 1, 1, 1,
0.5603508, 0.7383809, -0.9623824, 1, 1, 1, 1, 1,
0.5635381, 0.03593951, 1.176796, 1, 1, 1, 1, 1,
0.5675518, -0.8208064, 1.232759, 1, 1, 1, 1, 1,
0.5675613, 1.626502, -0.07167974, 1, 1, 1, 1, 1,
0.570581, 0.9308141, 1.122047, 1, 1, 1, 1, 1,
0.5716092, 1.741806, 0.242916, 1, 1, 1, 1, 1,
0.5729815, -0.5884453, 1.694324, 1, 1, 1, 1, 1,
0.5772734, 0.3376524, -0.6963821, 1, 1, 1, 1, 1,
0.5779206, -1.124922, 3.530748, 1, 1, 1, 1, 1,
0.5805382, -0.5683665, 1.797088, 1, 1, 1, 1, 1,
0.5828215, -0.06089237, 1.660766, 1, 1, 1, 1, 1,
0.5917926, 0.03074459, 0.8669995, 0, 0, 1, 1, 1,
0.5929676, 0.5946795, 0.951441, 1, 0, 0, 1, 1,
0.5939108, -0.0839425, 1.422505, 1, 0, 0, 1, 1,
0.5974621, -0.01607707, 0.9395273, 1, 0, 0, 1, 1,
0.5992934, 0.169071, 1.452646, 1, 0, 0, 1, 1,
0.599546, -1.066408, 2.546338, 1, 0, 0, 1, 1,
0.603576, 0.7696076, 0.4197015, 0, 0, 0, 1, 1,
0.6050045, -1.071375, 2.704541, 0, 0, 0, 1, 1,
0.6079777, -0.6166737, 1.53124, 0, 0, 0, 1, 1,
0.6083086, 0.5602059, 1.493634, 0, 0, 0, 1, 1,
0.6091881, 1.082007, 0.04766528, 0, 0, 0, 1, 1,
0.6183386, 0.2364027, 1.120753, 0, 0, 0, 1, 1,
0.6214548, -1.895812, 3.135084, 0, 0, 0, 1, 1,
0.6221784, 0.8929907, 1.312411, 1, 1, 1, 1, 1,
0.6277945, 0.9411778, 3.196397, 1, 1, 1, 1, 1,
0.6286352, 0.2075526, 0.2089579, 1, 1, 1, 1, 1,
0.6302621, 1.009515, -0.1381103, 1, 1, 1, 1, 1,
0.6305031, -0.2902694, 3.220931, 1, 1, 1, 1, 1,
0.6388568, 1.546582, -1.138077, 1, 1, 1, 1, 1,
0.6415836, 1.148248, 0.03901191, 1, 1, 1, 1, 1,
0.6434291, -1.083661, 3.106685, 1, 1, 1, 1, 1,
0.6509998, -0.2026531, 2.273088, 1, 1, 1, 1, 1,
0.6510082, -0.8181961, 4.00032, 1, 1, 1, 1, 1,
0.6517618, 0.3574161, 2.11551, 1, 1, 1, 1, 1,
0.6582568, -0.2579643, 0.910017, 1, 1, 1, 1, 1,
0.6583281, -0.1109338, 0.6926447, 1, 1, 1, 1, 1,
0.667857, -0.04587179, 3.468136, 1, 1, 1, 1, 1,
0.6720016, -0.419949, 2.561253, 1, 1, 1, 1, 1,
0.681857, 0.2200693, 3.486848, 0, 0, 1, 1, 1,
0.6835406, -0.8039589, 2.956369, 1, 0, 0, 1, 1,
0.6853325, 0.2742322, 0.9609954, 1, 0, 0, 1, 1,
0.6871894, -0.7542698, 2.734856, 1, 0, 0, 1, 1,
0.6894026, 0.4023422, 0.7557262, 1, 0, 0, 1, 1,
0.6928673, 0.9265574, -0.0361973, 1, 0, 0, 1, 1,
0.694876, 0.179899, 1.29617, 0, 0, 0, 1, 1,
0.6985458, -0.8265318, 1.248865, 0, 0, 0, 1, 1,
0.7002677, -0.5802236, 2.535366, 0, 0, 0, 1, 1,
0.7013271, 1.490046, 0.2402321, 0, 0, 0, 1, 1,
0.7027852, -0.2833374, 2.647155, 0, 0, 0, 1, 1,
0.7044068, -0.7000926, 2.928629, 0, 0, 0, 1, 1,
0.7120463, 0.2034296, 2.946252, 0, 0, 0, 1, 1,
0.7164973, 0.5920489, -0.9837278, 1, 1, 1, 1, 1,
0.7171511, -0.7450637, 3.025856, 1, 1, 1, 1, 1,
0.7176197, -0.2601208, 3.038963, 1, 1, 1, 1, 1,
0.7274771, -1.025364, 0.405786, 1, 1, 1, 1, 1,
0.7289508, -0.1547218, 3.082172, 1, 1, 1, 1, 1,
0.7309437, -0.2194571, -0.6372658, 1, 1, 1, 1, 1,
0.7316307, 0.782407, 1.738379, 1, 1, 1, 1, 1,
0.7356856, 0.6932098, 0.8512474, 1, 1, 1, 1, 1,
0.7395879, -0.06244863, 3.641175, 1, 1, 1, 1, 1,
0.7478243, -0.7079535, 1.085846, 1, 1, 1, 1, 1,
0.7497742, -0.5394805, 2.403167, 1, 1, 1, 1, 1,
0.7502785, 1.446561, 0.7277843, 1, 1, 1, 1, 1,
0.7506039, 0.89507, 0.4491569, 1, 1, 1, 1, 1,
0.7522706, -0.5864326, 1.733256, 1, 1, 1, 1, 1,
0.7567157, -2.445024, 3.278698, 1, 1, 1, 1, 1,
0.7578288, 1.363293, -0.1951945, 0, 0, 1, 1, 1,
0.7590026, -0.009538117, 3.457319, 1, 0, 0, 1, 1,
0.7651243, 1.249677, 0.6924409, 1, 0, 0, 1, 1,
0.7687702, -0.4586648, 0.9093441, 1, 0, 0, 1, 1,
0.7701608, -0.6752637, 2.59331, 1, 0, 0, 1, 1,
0.7721314, 1.674971, 0.6847899, 1, 0, 0, 1, 1,
0.7728654, -1.292361, 2.927967, 0, 0, 0, 1, 1,
0.7728709, 0.3150004, 0.1845745, 0, 0, 0, 1, 1,
0.7793898, -0.6076125, -1.501805, 0, 0, 0, 1, 1,
0.7814606, -0.6248476, -0.1175704, 0, 0, 0, 1, 1,
0.7836457, -2.00629, 2.050928, 0, 0, 0, 1, 1,
0.7841205, 0.6870936, 1.913382, 0, 0, 0, 1, 1,
0.7866052, 2.136662, 0.0008954579, 0, 0, 0, 1, 1,
0.7891191, -0.6059617, 4.58159, 1, 1, 1, 1, 1,
0.7898067, 0.8237314, 1.848512, 1, 1, 1, 1, 1,
0.7961458, -0.8869635, 1.305971, 1, 1, 1, 1, 1,
0.7975797, 1.087567, 0.1247112, 1, 1, 1, 1, 1,
0.7993737, -1.363259, 0.9540938, 1, 1, 1, 1, 1,
0.812345, 0.3582005, 2.006616, 1, 1, 1, 1, 1,
0.8140979, 1.000525, -0.2903339, 1, 1, 1, 1, 1,
0.818646, 1.932017, 0.901316, 1, 1, 1, 1, 1,
0.8189049, -0.1269008, 4.265652, 1, 1, 1, 1, 1,
0.8191177, 1.240382, -0.01498687, 1, 1, 1, 1, 1,
0.8229819, 0.2763168, 2.462476, 1, 1, 1, 1, 1,
0.8250095, -0.3312057, 1.263553, 1, 1, 1, 1, 1,
0.8256713, -0.0625695, 0.7345927, 1, 1, 1, 1, 1,
0.8261684, -1.355627, 1.616433, 1, 1, 1, 1, 1,
0.8262408, 0.4295233, 0.511156, 1, 1, 1, 1, 1,
0.8288665, 0.01205913, 1.0173, 0, 0, 1, 1, 1,
0.8301181, 0.8067139, 1.499036, 1, 0, 0, 1, 1,
0.833999, -1.352375, 2.941114, 1, 0, 0, 1, 1,
0.8415335, 0.9805835, 3.303241, 1, 0, 0, 1, 1,
0.8418384, 0.85145, -0.6419232, 1, 0, 0, 1, 1,
0.8462916, -0.7007339, 0.8902722, 1, 0, 0, 1, 1,
0.8467517, 0.2480188, 1.369488, 0, 0, 0, 1, 1,
0.8514317, -0.2812719, 2.059321, 0, 0, 0, 1, 1,
0.855786, 2.668737, -1.426837, 0, 0, 0, 1, 1,
0.8685214, 0.7273609, 0.3005325, 0, 0, 0, 1, 1,
0.8724267, -0.3954303, 2.886204, 0, 0, 0, 1, 1,
0.8757312, 0.2357055, 1.7411, 0, 0, 0, 1, 1,
0.8825448, -0.655305, 1.483581, 0, 0, 0, 1, 1,
0.8839487, 0.2756914, 0.4425569, 1, 1, 1, 1, 1,
0.8924894, -0.8762308, 2.967271, 1, 1, 1, 1, 1,
0.8974135, -0.4420317, 0.6104738, 1, 1, 1, 1, 1,
0.9025103, 1.927477, 0.2751167, 1, 1, 1, 1, 1,
0.9026663, -1.670091, 3.306086, 1, 1, 1, 1, 1,
0.9110628, -0.6863998, 1.572478, 1, 1, 1, 1, 1,
0.9165834, -0.2974565, 2.290688, 1, 1, 1, 1, 1,
0.9199706, 1.496221, 2.984525, 1, 1, 1, 1, 1,
0.9219033, 1.301877, 2.933957, 1, 1, 1, 1, 1,
0.9221345, -1.367273, 1.181544, 1, 1, 1, 1, 1,
0.9311956, -0.8253769, 1.207087, 1, 1, 1, 1, 1,
0.9318613, 0.9733393, 1.269267, 1, 1, 1, 1, 1,
0.932858, 0.9585934, 1.779376, 1, 1, 1, 1, 1,
0.9338831, -0.2728674, 1.812957, 1, 1, 1, 1, 1,
0.9342796, -0.6766897, 1.327188, 1, 1, 1, 1, 1,
0.9355186, -0.543622, 2.168849, 0, 0, 1, 1, 1,
0.9363018, 0.3823941, -0.5968636, 1, 0, 0, 1, 1,
0.9369856, -1.58215, 1.119204, 1, 0, 0, 1, 1,
0.9438894, -0.7152065, 3.250756, 1, 0, 0, 1, 1,
0.9487459, -0.5574926, 0.05073796, 1, 0, 0, 1, 1,
0.9490176, 0.3383633, 1.159032, 1, 0, 0, 1, 1,
0.9590738, 0.8369494, 1.566592, 0, 0, 0, 1, 1,
0.960849, 1.071717, 0.1295557, 0, 0, 0, 1, 1,
0.9720973, -0.7447411, 3.277804, 0, 0, 0, 1, 1,
0.9758783, 0.7585893, 2.794247, 0, 0, 0, 1, 1,
0.9858006, -1.739312, 3.363818, 0, 0, 0, 1, 1,
1.000637, -1.17323, 3.394686, 0, 0, 0, 1, 1,
1.004141, -0.5794787, 2.125217, 0, 0, 0, 1, 1,
1.010585, 2.882022, -1.224307, 1, 1, 1, 1, 1,
1.014235, -1.407213, 3.472799, 1, 1, 1, 1, 1,
1.015925, -0.9133774, 1.310219, 1, 1, 1, 1, 1,
1.018332, 0.2929787, 0.9254839, 1, 1, 1, 1, 1,
1.025431, 0.5558282, 3.480333, 1, 1, 1, 1, 1,
1.026826, 0.3813536, 2.425973, 1, 1, 1, 1, 1,
1.030684, 0.09674107, 2.642054, 1, 1, 1, 1, 1,
1.032052, -1.790643, 3.598593, 1, 1, 1, 1, 1,
1.032137, 1.533366, -0.3668589, 1, 1, 1, 1, 1,
1.033525, -0.4743823, 2.813221, 1, 1, 1, 1, 1,
1.036964, -0.7207224, 3.011636, 1, 1, 1, 1, 1,
1.037423, 0.4972302, 1.632217, 1, 1, 1, 1, 1,
1.042388, -0.8373417, 1.869101, 1, 1, 1, 1, 1,
1.042717, -0.05538219, 0.8563408, 1, 1, 1, 1, 1,
1.046351, -0.9476218, 0.8015048, 1, 1, 1, 1, 1,
1.056831, 0.4672638, 0.8982856, 0, 0, 1, 1, 1,
1.056991, 1.078944, 0.1537197, 1, 0, 0, 1, 1,
1.057509, -0.3409706, 2.134217, 1, 0, 0, 1, 1,
1.058978, 0.07846259, 1.970615, 1, 0, 0, 1, 1,
1.065958, 1.261236, 0.2609394, 1, 0, 0, 1, 1,
1.0669, 0.2612058, 1.98221, 1, 0, 0, 1, 1,
1.068683, -0.4543215, 2.913126, 0, 0, 0, 1, 1,
1.074084, 0.4434853, -0.04484245, 0, 0, 0, 1, 1,
1.084949, -0.8340301, 1.74116, 0, 0, 0, 1, 1,
1.087769, 0.3604177, 1.123309, 0, 0, 0, 1, 1,
1.091609, 0.4352752, 2.295773, 0, 0, 0, 1, 1,
1.105571, -1.253489, 1.203968, 0, 0, 0, 1, 1,
1.1066, -0.5989344, 2.92964, 0, 0, 0, 1, 1,
1.108861, 0.2803087, 0.2837684, 1, 1, 1, 1, 1,
1.119538, 0.7254708, 1.374197, 1, 1, 1, 1, 1,
1.124671, 0.1354674, 1.303203, 1, 1, 1, 1, 1,
1.129126, -0.5235498, 2.864214, 1, 1, 1, 1, 1,
1.13219, -1.649442, 2.022867, 1, 1, 1, 1, 1,
1.133118, 0.1761251, 0.6288812, 1, 1, 1, 1, 1,
1.13448, 1.948279, -0.1521572, 1, 1, 1, 1, 1,
1.139337, -0.296485, 1.756002, 1, 1, 1, 1, 1,
1.140901, 1.304576, -1.485525, 1, 1, 1, 1, 1,
1.142329, 0.05345745, 2.559214, 1, 1, 1, 1, 1,
1.142692, 0.4275789, 1.801334, 1, 1, 1, 1, 1,
1.14295, -0.9423401, 2.715105, 1, 1, 1, 1, 1,
1.143374, -1.071567, 3.474676, 1, 1, 1, 1, 1,
1.146569, -0.9522093, 2.950222, 1, 1, 1, 1, 1,
1.150549, -0.05788841, 3.491267, 1, 1, 1, 1, 1,
1.151329, 1.426642, 1.449252, 0, 0, 1, 1, 1,
1.158092, -0.4539142, 0.1170293, 1, 0, 0, 1, 1,
1.159914, 0.9786265, 0.9119149, 1, 0, 0, 1, 1,
1.170974, 0.25353, 0.4741631, 1, 0, 0, 1, 1,
1.184724, -0.1446394, 1.70677, 1, 0, 0, 1, 1,
1.189848, 0.5464061, 1.263552, 1, 0, 0, 1, 1,
1.1932, -1.622504, 3.929483, 0, 0, 0, 1, 1,
1.195591, -1.206486, 0.5322265, 0, 0, 0, 1, 1,
1.19642, 0.8524485, 0.6096303, 0, 0, 0, 1, 1,
1.196546, -0.1837635, 0.9384701, 0, 0, 0, 1, 1,
1.196986, 0.7028295, 1.117644, 0, 0, 0, 1, 1,
1.204433, -0.4628766, 2.71383, 0, 0, 0, 1, 1,
1.207382, 0.7229297, 0.4749717, 0, 0, 0, 1, 1,
1.214363, -0.4555897, 1.564055, 1, 1, 1, 1, 1,
1.214477, 0.8709338, 0.8110302, 1, 1, 1, 1, 1,
1.21633, -0.6885866, 1.402701, 1, 1, 1, 1, 1,
1.226866, -1.312711, 2.86708, 1, 1, 1, 1, 1,
1.228256, 1.036051, -0.9650365, 1, 1, 1, 1, 1,
1.231644, -0.2551628, 0.755212, 1, 1, 1, 1, 1,
1.239583, 0.1906447, 1.662262, 1, 1, 1, 1, 1,
1.242697, -0.2052448, -0.5757559, 1, 1, 1, 1, 1,
1.251925, -0.6673679, 3.951355, 1, 1, 1, 1, 1,
1.254985, -0.1885034, 3.21608, 1, 1, 1, 1, 1,
1.256352, -0.1663374, 2.192026, 1, 1, 1, 1, 1,
1.266191, 0.01362447, 0.5880828, 1, 1, 1, 1, 1,
1.270862, -0.8602564, 3.48867, 1, 1, 1, 1, 1,
1.272934, -0.3844687, 2.156606, 1, 1, 1, 1, 1,
1.28277, 1.67044, 0.9746411, 1, 1, 1, 1, 1,
1.287364, -1.91487, 2.230712, 0, 0, 1, 1, 1,
1.28901, -0.6589212, 0.8469647, 1, 0, 0, 1, 1,
1.292915, 1.66376, 3.055594, 1, 0, 0, 1, 1,
1.295665, -0.245318, 3.237718, 1, 0, 0, 1, 1,
1.302332, 0.2867541, 3.071371, 1, 0, 0, 1, 1,
1.303038, 1.315754, -0.375831, 1, 0, 0, 1, 1,
1.305829, -0.4704079, 2.191988, 0, 0, 0, 1, 1,
1.312412, 0.4011843, 1.442023, 0, 0, 0, 1, 1,
1.314304, 0.4624811, 1.032784, 0, 0, 0, 1, 1,
1.323607, 0.047477, 0.3616371, 0, 0, 0, 1, 1,
1.334495, 0.1020501, 2.015563, 0, 0, 0, 1, 1,
1.340169, 0.1449728, 0.6898369, 0, 0, 0, 1, 1,
1.342004, 0.05541957, 3.040601, 0, 0, 0, 1, 1,
1.343788, -0.3954176, 2.312277, 1, 1, 1, 1, 1,
1.348996, -0.0002685224, 3.853614, 1, 1, 1, 1, 1,
1.34941, -0.6945897, 1.477512, 1, 1, 1, 1, 1,
1.359407, 0.1802727, -0.5513269, 1, 1, 1, 1, 1,
1.359616, 1.819791, 0.8263485, 1, 1, 1, 1, 1,
1.361755, -0.8572177, 3.356389, 1, 1, 1, 1, 1,
1.36608, 0.9333676, 0.09431088, 1, 1, 1, 1, 1,
1.371114, -2.138863, 3.083507, 1, 1, 1, 1, 1,
1.375282, 0.236249, 3.060596, 1, 1, 1, 1, 1,
1.391702, 0.4594618, 0.4026218, 1, 1, 1, 1, 1,
1.406623, -0.04529355, 1.332751, 1, 1, 1, 1, 1,
1.414332, 0.7359999, 2.971577, 1, 1, 1, 1, 1,
1.415679, -0.5983124, 0.6608851, 1, 1, 1, 1, 1,
1.426921, 0.3642855, 0.8269069, 1, 1, 1, 1, 1,
1.427053, -0.5059085, 0.6369683, 1, 1, 1, 1, 1,
1.428327, 0.6826057, 1.629797, 0, 0, 1, 1, 1,
1.435548, -0.5319034, 1.593753, 1, 0, 0, 1, 1,
1.443937, 0.5604731, -0.4239576, 1, 0, 0, 1, 1,
1.448982, -0.4907917, 1.874761, 1, 0, 0, 1, 1,
1.449638, -0.3958534, 2.483919, 1, 0, 0, 1, 1,
1.459355, -0.4972667, 2.269083, 1, 0, 0, 1, 1,
1.478379, -0.2384723, 0.881991, 0, 0, 0, 1, 1,
1.479835, -0.8937349, 0.8595706, 0, 0, 0, 1, 1,
1.481416, -1.28413, 3.270169, 0, 0, 0, 1, 1,
1.494397, 1.051966, 0.7197059, 0, 0, 0, 1, 1,
1.499019, -0.9203894, 1.209043, 0, 0, 0, 1, 1,
1.499598, -0.4222652, 0.7617724, 0, 0, 0, 1, 1,
1.503075, -0.06882386, 1.954318, 0, 0, 0, 1, 1,
1.503343, -2.376337, 1.122061, 1, 1, 1, 1, 1,
1.505667, -0.2578353, 2.743862, 1, 1, 1, 1, 1,
1.510094, -0.1717049, 1.735044, 1, 1, 1, 1, 1,
1.534743, 0.5685301, 2.381431, 1, 1, 1, 1, 1,
1.538406, -1.840818, 3.380993, 1, 1, 1, 1, 1,
1.545637, -0.01202229, 1.303578, 1, 1, 1, 1, 1,
1.566854, -1.576472, 2.454041, 1, 1, 1, 1, 1,
1.602072, -1.293524, 1.502754, 1, 1, 1, 1, 1,
1.625724, 0.81049, 1.290595, 1, 1, 1, 1, 1,
1.642389, -0.3157798, 0.2987662, 1, 1, 1, 1, 1,
1.649087, 0.05850931, 1.958941, 1, 1, 1, 1, 1,
1.653938, 1.036562, -0.7595545, 1, 1, 1, 1, 1,
1.659874, 0.1394472, 1.131621, 1, 1, 1, 1, 1,
1.660505, -0.4023639, 2.413395, 1, 1, 1, 1, 1,
1.661938, -0.8873304, 2.089054, 1, 1, 1, 1, 1,
1.666062, 0.8780121, 0.5385171, 0, 0, 1, 1, 1,
1.700386, 1.258255, 1.053581, 1, 0, 0, 1, 1,
1.701819, 0.08263901, 1.63024, 1, 0, 0, 1, 1,
1.714805, -1.136783, 2.736077, 1, 0, 0, 1, 1,
1.728681, -0.2155452, 1.998263, 1, 0, 0, 1, 1,
1.731242, 2.372165, -0.3429537, 1, 0, 0, 1, 1,
1.732146, 0.9995155, 1.261586, 0, 0, 0, 1, 1,
1.749926, 1.409433, 2.000721, 0, 0, 0, 1, 1,
1.759172, -1.849643, 1.144474, 0, 0, 0, 1, 1,
1.774773, -0.6127506, 3.298681, 0, 0, 0, 1, 1,
1.781353, 0.7137434, 0.5824262, 0, 0, 0, 1, 1,
1.80367, -0.236228, 2.287917, 0, 0, 0, 1, 1,
1.828362, -0.181172, 0.7685029, 0, 0, 0, 1, 1,
1.832327, -0.1879091, 2.994603, 1, 1, 1, 1, 1,
1.845635, -0.1566779, 2.136512, 1, 1, 1, 1, 1,
1.845907, 0.4694233, -0.9856405, 1, 1, 1, 1, 1,
1.857782, 0.8879846, 1.507157, 1, 1, 1, 1, 1,
1.877867, -0.4216464, 1.85627, 1, 1, 1, 1, 1,
1.894363, 0.9825249, -0.2242031, 1, 1, 1, 1, 1,
1.897608, -0.5712679, 1.128911, 1, 1, 1, 1, 1,
1.906094, -0.7425395, -0.9860251, 1, 1, 1, 1, 1,
1.91641, -0.1515459, 1.041042, 1, 1, 1, 1, 1,
1.917614, 1.032806, -0.6187193, 1, 1, 1, 1, 1,
1.91847, 0.0638941, -0.135016, 1, 1, 1, 1, 1,
1.927243, 0.3579024, 1.395195, 1, 1, 1, 1, 1,
1.943082, -0.7579783, 2.270604, 1, 1, 1, 1, 1,
1.973125, -1.046528, 3.145479, 1, 1, 1, 1, 1,
1.975009, -0.8823874, 1.44886, 1, 1, 1, 1, 1,
1.989367, 0.6329077, 1.926863, 0, 0, 1, 1, 1,
2.002437, -1.294042, 2.674555, 1, 0, 0, 1, 1,
2.031821, 0.4999183, 2.723868, 1, 0, 0, 1, 1,
2.050963, -0.8152395, 2.056236, 1, 0, 0, 1, 1,
2.065277, -0.3905171, 3.193324, 1, 0, 0, 1, 1,
2.089392, 1.376492, 1.684754, 1, 0, 0, 1, 1,
2.127947, -2.286417, 2.518261, 0, 0, 0, 1, 1,
2.154223, -0.5711818, 2.313869, 0, 0, 0, 1, 1,
2.158546, -0.3329615, 0.8116511, 0, 0, 0, 1, 1,
2.178614, 1.611636, 1.2096, 0, 0, 0, 1, 1,
2.188411, -0.2909641, 1.198075, 0, 0, 0, 1, 1,
2.222671, -1.274902, 2.309945, 0, 0, 0, 1, 1,
2.280655, -1.333487, 4.631061, 0, 0, 0, 1, 1,
2.376897, -0.9369882, 4.035052, 1, 1, 1, 1, 1,
2.45042, 0.469454, 1.109951, 1, 1, 1, 1, 1,
2.526283, -0.0175199, 0.4966729, 1, 1, 1, 1, 1,
2.531965, 0.8783979, 0.950295, 1, 1, 1, 1, 1,
2.938603, -0.8200293, 3.981735, 1, 1, 1, 1, 1,
3.21964, 0.7618045, 2.336027, 1, 1, 1, 1, 1,
3.441634, -0.6979587, 2.389905, 1, 1, 1, 1, 1
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
var radius = 9.190429;
var distance = 32.28099;
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
mvMatrix.translate( -0.1350007, -0.02846932, 0.3402689 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.28099);
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
