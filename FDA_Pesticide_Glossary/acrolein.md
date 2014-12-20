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
-3.646919, 1.101994, -0.1874003, 1, 0, 0, 1,
-3.543912, 0.3542411, -1.114419, 1, 0.007843138, 0, 1,
-3.153938, -0.2883984, -0.7854668, 1, 0.01176471, 0, 1,
-2.992283, -0.8462469, -0.8395101, 1, 0.01960784, 0, 1,
-2.937967, 0.5220103, -3.47348, 1, 0.02352941, 0, 1,
-2.818798, 0.5722923, -3.012388, 1, 0.03137255, 0, 1,
-2.744516, 0.1660912, -1.191132, 1, 0.03529412, 0, 1,
-2.716503, -0.4783869, -1.926798, 1, 0.04313726, 0, 1,
-2.677858, -0.53033, -1.454646, 1, 0.04705882, 0, 1,
-2.668601, -0.9200753, -1.532339, 1, 0.05490196, 0, 1,
-2.599796, -0.9648094, -1.57888, 1, 0.05882353, 0, 1,
-2.523646, 0.1026736, -3.600313, 1, 0.06666667, 0, 1,
-2.469773, -0.4905567, -1.737369, 1, 0.07058824, 0, 1,
-2.448085, 1.315023, -2.664926, 1, 0.07843138, 0, 1,
-2.387682, 0.1858734, -1.119134, 1, 0.08235294, 0, 1,
-2.350843, 0.8636655, -2.69687, 1, 0.09019608, 0, 1,
-2.325694, 0.1691514, -0.6655716, 1, 0.09411765, 0, 1,
-2.258442, -1.151054, -2.995366, 1, 0.1019608, 0, 1,
-2.255568, 0.9450946, -3.5211, 1, 0.1098039, 0, 1,
-2.255119, 0.5119886, -3.011754, 1, 0.1137255, 0, 1,
-2.215816, 0.914003, -1.721105, 1, 0.1215686, 0, 1,
-2.204093, 0.883299, -2.123929, 1, 0.1254902, 0, 1,
-2.188394, -2.245248, -0.163418, 1, 0.1333333, 0, 1,
-2.176795, -0.1405216, -2.417021, 1, 0.1372549, 0, 1,
-2.170271, -0.7024989, -3.12382, 1, 0.145098, 0, 1,
-2.151592, -0.7968969, -1.759068, 1, 0.1490196, 0, 1,
-2.122942, 2.071177, -1.531529, 1, 0.1568628, 0, 1,
-2.121954, -0.1706376, 0.4152372, 1, 0.1607843, 0, 1,
-2.091298, 2.319739, 0.1892221, 1, 0.1686275, 0, 1,
-2.052464, -1.82233, -2.405557, 1, 0.172549, 0, 1,
-1.996847, 0.7780151, 0.6250029, 1, 0.1803922, 0, 1,
-1.991044, -0.9306593, -3.24097, 1, 0.1843137, 0, 1,
-1.978614, -0.8799673, -2.927894, 1, 0.1921569, 0, 1,
-1.977804, -0.09107174, -1.914975, 1, 0.1960784, 0, 1,
-1.965863, -0.7731124, 0.3093552, 1, 0.2039216, 0, 1,
-1.961533, 0.7099495, -2.192147, 1, 0.2117647, 0, 1,
-1.957071, 1.61601, -1.521751, 1, 0.2156863, 0, 1,
-1.938355, 1.009927, -1.032481, 1, 0.2235294, 0, 1,
-1.892976, -0.9315882, -2.989183, 1, 0.227451, 0, 1,
-1.886913, 0.5917496, -1.451482, 1, 0.2352941, 0, 1,
-1.878241, 0.2560809, -0.6041536, 1, 0.2392157, 0, 1,
-1.860188, 0.3980899, -0.206536, 1, 0.2470588, 0, 1,
-1.850941, -1.907085, -2.218497, 1, 0.2509804, 0, 1,
-1.847644, 1.189475, -1.234418, 1, 0.2588235, 0, 1,
-1.822989, -0.5637482, -0.6188396, 1, 0.2627451, 0, 1,
-1.816421, 1.075188, -0.5513543, 1, 0.2705882, 0, 1,
-1.810009, -1.502307, -2.550174, 1, 0.2745098, 0, 1,
-1.772724, -0.004368544, -0.9421679, 1, 0.282353, 0, 1,
-1.771595, -0.5634059, -2.069595, 1, 0.2862745, 0, 1,
-1.76831, 0.4680165, -0.9773526, 1, 0.2941177, 0, 1,
-1.755682, 0.4779271, -1.059805, 1, 0.3019608, 0, 1,
-1.744747, -0.7918553, -2.299917, 1, 0.3058824, 0, 1,
-1.7427, -0.667531, -3.323644, 1, 0.3137255, 0, 1,
-1.730729, -1.544888, -2.55142, 1, 0.3176471, 0, 1,
-1.715721, 1.599505, 0.3687571, 1, 0.3254902, 0, 1,
-1.71423, 0.8930394, -1.10231, 1, 0.3294118, 0, 1,
-1.695205, 1.19266, -0.07362796, 1, 0.3372549, 0, 1,
-1.685203, -1.722144, -2.674182, 1, 0.3411765, 0, 1,
-1.672123, -2.131989, -3.370257, 1, 0.3490196, 0, 1,
-1.663291, -1.443188, -3.691344, 1, 0.3529412, 0, 1,
-1.638526, -1.827786, -2.091899, 1, 0.3607843, 0, 1,
-1.636636, 0.3295537, -2.302973, 1, 0.3647059, 0, 1,
-1.636172, 2.004997, -1.871403, 1, 0.372549, 0, 1,
-1.597203, 0.6317022, -0.567799, 1, 0.3764706, 0, 1,
-1.587937, -1.420232, 0.2276465, 1, 0.3843137, 0, 1,
-1.574362, 0.1845319, -0.7344034, 1, 0.3882353, 0, 1,
-1.534845, -1.161974, -1.399085, 1, 0.3960784, 0, 1,
-1.527451, -1.570468, -3.214655, 1, 0.4039216, 0, 1,
-1.526611, -0.3118679, -1.866627, 1, 0.4078431, 0, 1,
-1.518364, -0.4660891, -2.460522, 1, 0.4156863, 0, 1,
-1.509013, 1.248607, -0.5266698, 1, 0.4196078, 0, 1,
-1.508196, -0.1817275, -1.034399, 1, 0.427451, 0, 1,
-1.496755, 0.5452692, -1.95879, 1, 0.4313726, 0, 1,
-1.471675, -0.2853985, -2.430112, 1, 0.4392157, 0, 1,
-1.464664, -0.0790004, -1.714205, 1, 0.4431373, 0, 1,
-1.461604, 0.7856178, -1.788769, 1, 0.4509804, 0, 1,
-1.458565, -0.05646593, -3.046702, 1, 0.454902, 0, 1,
-1.457896, -0.0146405, -1.285584, 1, 0.4627451, 0, 1,
-1.450397, -1.455461, -0.5208042, 1, 0.4666667, 0, 1,
-1.418979, 0.04626239, -2.100752, 1, 0.4745098, 0, 1,
-1.41837, 0.5804089, 0.3711034, 1, 0.4784314, 0, 1,
-1.41689, -0.590921, -0.3048894, 1, 0.4862745, 0, 1,
-1.413833, -0.9685094, -2.063491, 1, 0.4901961, 0, 1,
-1.408453, -0.9029543, -2.093003, 1, 0.4980392, 0, 1,
-1.399266, 0.3414004, -0.321981, 1, 0.5058824, 0, 1,
-1.38356, 0.5493885, 1.574836, 1, 0.509804, 0, 1,
-1.3729, -1.050435, -1.037911, 1, 0.5176471, 0, 1,
-1.370923, -1.188911, -2.720188, 1, 0.5215687, 0, 1,
-1.347309, 0.2151565, -0.6382047, 1, 0.5294118, 0, 1,
-1.34333, -0.4293547, -0.55751, 1, 0.5333334, 0, 1,
-1.340435, 0.69293, -0.6409853, 1, 0.5411765, 0, 1,
-1.334285, -1.612445, -3.115769, 1, 0.5450981, 0, 1,
-1.321321, -1.405131, -2.819018, 1, 0.5529412, 0, 1,
-1.320062, 0.08307499, -2.021399, 1, 0.5568628, 0, 1,
-1.311967, 0.5409108, 1.455949, 1, 0.5647059, 0, 1,
-1.310722, 0.9491565, 0.1236136, 1, 0.5686275, 0, 1,
-1.275302, 0.07230173, -0.9725299, 1, 0.5764706, 0, 1,
-1.269205, 0.1917511, -0.6685888, 1, 0.5803922, 0, 1,
-1.268789, 0.1862818, -2.263229, 1, 0.5882353, 0, 1,
-1.268742, -0.2718737, -3.465172, 1, 0.5921569, 0, 1,
-1.266208, 0.917399, -0.6860645, 1, 0.6, 0, 1,
-1.260508, -0.2716546, -0.9476137, 1, 0.6078432, 0, 1,
-1.247176, -0.3867539, -0.777828, 1, 0.6117647, 0, 1,
-1.245115, 0.1354858, -1.625396, 1, 0.6196079, 0, 1,
-1.24333, 0.4857035, -0.2210815, 1, 0.6235294, 0, 1,
-1.241381, 0.2531359, -3.141121, 1, 0.6313726, 0, 1,
-1.239409, 0.6933861, -0.05887925, 1, 0.6352941, 0, 1,
-1.237827, 0.06917959, -0.6741459, 1, 0.6431373, 0, 1,
-1.23529, -0.5421426, -2.750488, 1, 0.6470588, 0, 1,
-1.23025, -0.3216176, 0.3369185, 1, 0.654902, 0, 1,
-1.224032, -0.4341237, -1.605076, 1, 0.6588235, 0, 1,
-1.216869, -1.9472, -1.119819, 1, 0.6666667, 0, 1,
-1.212876, -1.063195, 0.2499384, 1, 0.6705883, 0, 1,
-1.208591, -0.1245127, 0.629155, 1, 0.6784314, 0, 1,
-1.206619, 0.3442135, -1.905409, 1, 0.682353, 0, 1,
-1.19866, -0.5658532, -2.833938, 1, 0.6901961, 0, 1,
-1.198627, -0.9885895, -2.755718, 1, 0.6941177, 0, 1,
-1.184126, -0.3493141, -1.560433, 1, 0.7019608, 0, 1,
-1.178764, -0.3962209, -3.13624, 1, 0.7098039, 0, 1,
-1.174479, 0.6585946, -1.115454, 1, 0.7137255, 0, 1,
-1.174105, -0.4317647, -3.306017, 1, 0.7215686, 0, 1,
-1.173301, 0.05466013, -1.534804, 1, 0.7254902, 0, 1,
-1.170283, 0.7936492, -0.2711095, 1, 0.7333333, 0, 1,
-1.168707, -1.177036, -2.474845, 1, 0.7372549, 0, 1,
-1.147369, -0.06359242, -2.167757, 1, 0.7450981, 0, 1,
-1.142392, -1.081301, -1.50608, 1, 0.7490196, 0, 1,
-1.125607, 0.07807065, 0.9524682, 1, 0.7568628, 0, 1,
-1.110855, -0.4080461, -0.7488699, 1, 0.7607843, 0, 1,
-1.110559, 0.02919361, -1.282655, 1, 0.7686275, 0, 1,
-1.11044, 1.102236, -0.7138476, 1, 0.772549, 0, 1,
-1.106251, 0.0194963, -1.822004, 1, 0.7803922, 0, 1,
-1.106008, 0.7356427, -1.941566, 1, 0.7843137, 0, 1,
-1.101962, -0.4183771, -0.5254361, 1, 0.7921569, 0, 1,
-1.096074, -0.7543613, -2.481102, 1, 0.7960784, 0, 1,
-1.083717, 1.501594, 0.4417102, 1, 0.8039216, 0, 1,
-1.078811, 1.171862, -0.7546711, 1, 0.8117647, 0, 1,
-1.078308, -1.97865, -2.555244, 1, 0.8156863, 0, 1,
-1.074723, -0.7473472, -2.277711, 1, 0.8235294, 0, 1,
-1.068374, -0.07588844, -3.731024, 1, 0.827451, 0, 1,
-1.065554, 1.015579, 0.3260952, 1, 0.8352941, 0, 1,
-1.064625, -1.968704, -3.270681, 1, 0.8392157, 0, 1,
-1.060871, 0.1082792, -3.047709, 1, 0.8470588, 0, 1,
-1.057487, -1.094937, -1.627903, 1, 0.8509804, 0, 1,
-1.049883, -0.9463201, -2.651992, 1, 0.8588235, 0, 1,
-1.04017, -1.306573, -2.782532, 1, 0.8627451, 0, 1,
-1.03704, 2.020084, -2.170792, 1, 0.8705882, 0, 1,
-1.034686, -0.388322, -2.587941, 1, 0.8745098, 0, 1,
-1.031032, 0.9593544, -0.7908065, 1, 0.8823529, 0, 1,
-1.028179, -1.593467, -3.001654, 1, 0.8862745, 0, 1,
-1.027843, -0.5354048, -0.8708108, 1, 0.8941177, 0, 1,
-1.025559, 0.4918751, -2.037068, 1, 0.8980392, 0, 1,
-1.019923, -1.857126, -3.513245, 1, 0.9058824, 0, 1,
-1.01393, -1.160037, -3.64485, 1, 0.9137255, 0, 1,
-1.012416, -0.06870071, -1.33328, 1, 0.9176471, 0, 1,
-1.011333, 0.8424724, -1.293795, 1, 0.9254902, 0, 1,
-1.007089, -0.1001097, -0.9517294, 1, 0.9294118, 0, 1,
-1.003146, 0.5128602, -1.025281, 1, 0.9372549, 0, 1,
-0.9906178, 1.659488, 1.664366, 1, 0.9411765, 0, 1,
-0.9866794, 0.4313984, -1.388811, 1, 0.9490196, 0, 1,
-0.9842994, -0.5335861, -2.416129, 1, 0.9529412, 0, 1,
-0.9840606, 0.5607549, -3.101104, 1, 0.9607843, 0, 1,
-0.9739671, -0.1447616, -4.086658, 1, 0.9647059, 0, 1,
-0.9682159, -0.7724128, -1.921327, 1, 0.972549, 0, 1,
-0.9674471, 1.299927, -0.001731255, 1, 0.9764706, 0, 1,
-0.9672651, -0.8263884, -2.181623, 1, 0.9843137, 0, 1,
-0.9662386, -1.026709, -2.002358, 1, 0.9882353, 0, 1,
-0.960381, -0.8873125, -3.636633, 1, 0.9960784, 0, 1,
-0.9584908, 0.6535404, -3.854318, 0.9960784, 1, 0, 1,
-0.9541638, 0.2133263, -2.459064, 0.9921569, 1, 0, 1,
-0.9533947, -0.2799446, -1.103323, 0.9843137, 1, 0, 1,
-0.9470335, 0.9570342, -0.6645908, 0.9803922, 1, 0, 1,
-0.946297, 0.1461321, -1.349057, 0.972549, 1, 0, 1,
-0.9454407, 0.7038866, 0.7715048, 0.9686275, 1, 0, 1,
-0.9423854, -1.095068, -2.747174, 0.9607843, 1, 0, 1,
-0.934025, 0.3653219, -1.624112, 0.9568627, 1, 0, 1,
-0.9279149, 0.6397225, -0.9454613, 0.9490196, 1, 0, 1,
-0.9247509, -0.3137752, -1.985788, 0.945098, 1, 0, 1,
-0.9240273, 0.9255937, -1.289739, 0.9372549, 1, 0, 1,
-0.9240265, 0.9674703, -1.088345, 0.9333333, 1, 0, 1,
-0.9227, -0.7561964, -2.81832, 0.9254902, 1, 0, 1,
-0.9209152, 0.9636347, -0.5008831, 0.9215686, 1, 0, 1,
-0.920775, 1.352965, -1.126735, 0.9137255, 1, 0, 1,
-0.9173058, 1.071561, -0.7226511, 0.9098039, 1, 0, 1,
-0.9092022, 0.7538186, -0.704576, 0.9019608, 1, 0, 1,
-0.906514, -0.2947822, -3.941444, 0.8941177, 1, 0, 1,
-0.9058809, 0.3419428, -0.5174814, 0.8901961, 1, 0, 1,
-0.9016376, 1.915729, 0.7517988, 0.8823529, 1, 0, 1,
-0.8988346, 0.03716743, -1.166595, 0.8784314, 1, 0, 1,
-0.8975905, 0.2329743, -0.2663122, 0.8705882, 1, 0, 1,
-0.8924803, 0.7025331, -0.5093881, 0.8666667, 1, 0, 1,
-0.8882523, 1.154297, -0.3061875, 0.8588235, 1, 0, 1,
-0.8790491, -0.3722303, -2.042239, 0.854902, 1, 0, 1,
-0.8766671, 2.021618, -0.3972378, 0.8470588, 1, 0, 1,
-0.8699399, -0.3372493, -1.690103, 0.8431373, 1, 0, 1,
-0.8686521, 0.5976325, 0.8372782, 0.8352941, 1, 0, 1,
-0.8671803, -0.8249126, -1.946378, 0.8313726, 1, 0, 1,
-0.8585262, -0.6008133, -3.497586, 0.8235294, 1, 0, 1,
-0.8577413, 1.67716, 0.7685692, 0.8196079, 1, 0, 1,
-0.8517586, 0.8813242, -2.118558, 0.8117647, 1, 0, 1,
-0.8515344, 1.572749, -1.500037, 0.8078431, 1, 0, 1,
-0.8461607, 0.02386833, -1.647981, 0.8, 1, 0, 1,
-0.8448281, 1.863637, -2.269543, 0.7921569, 1, 0, 1,
-0.8393019, -0.6079915, -2.035747, 0.7882353, 1, 0, 1,
-0.8342937, -0.005763035, -1.349828, 0.7803922, 1, 0, 1,
-0.8309363, 0.319876, -0.7522427, 0.7764706, 1, 0, 1,
-0.8300908, 0.4311189, -1.40604, 0.7686275, 1, 0, 1,
-0.8286099, 0.6364412, -0.2507291, 0.7647059, 1, 0, 1,
-0.8265629, -0.01103149, -2.460595, 0.7568628, 1, 0, 1,
-0.8208634, 0.8220391, 0.003529583, 0.7529412, 1, 0, 1,
-0.8183637, 0.6958233, 0.5889476, 0.7450981, 1, 0, 1,
-0.8156407, -1.474736, -1.992473, 0.7411765, 1, 0, 1,
-0.8134139, 1.179356, -1.042245, 0.7333333, 1, 0, 1,
-0.8130623, 0.494709, -1.972359, 0.7294118, 1, 0, 1,
-0.8119039, 1.353576, -1.812728, 0.7215686, 1, 0, 1,
-0.8089254, 0.1723742, -1.980475, 0.7176471, 1, 0, 1,
-0.8057569, -1.283429, -3.836023, 0.7098039, 1, 0, 1,
-0.8039625, 1.553813, -0.06659769, 0.7058824, 1, 0, 1,
-0.8017585, 0.004889822, -0.8297625, 0.6980392, 1, 0, 1,
-0.7995542, -0.2899664, -2.839153, 0.6901961, 1, 0, 1,
-0.7964116, -0.241628, -1.983595, 0.6862745, 1, 0, 1,
-0.7919973, -0.561857, -1.359806, 0.6784314, 1, 0, 1,
-0.7893338, 1.469735, -1.626871, 0.6745098, 1, 0, 1,
-0.7850336, -0.04856405, -2.170895, 0.6666667, 1, 0, 1,
-0.7798066, 0.7162813, -1.747316, 0.6627451, 1, 0, 1,
-0.7738076, 0.7268087, 1.744692, 0.654902, 1, 0, 1,
-0.7662752, -1.270401, -1.696355, 0.6509804, 1, 0, 1,
-0.7649177, 0.4869654, -0.1632814, 0.6431373, 1, 0, 1,
-0.7631444, 1.609635, -1.176504, 0.6392157, 1, 0, 1,
-0.7497016, -0.1912535, -2.071748, 0.6313726, 1, 0, 1,
-0.7419825, -0.9293814, -2.409277, 0.627451, 1, 0, 1,
-0.7412295, -0.4474455, -1.724804, 0.6196079, 1, 0, 1,
-0.7409003, 0.4661447, -0.4759292, 0.6156863, 1, 0, 1,
-0.7408437, -0.3096912, -2.046039, 0.6078432, 1, 0, 1,
-0.7383052, 0.7087598, -1.13413, 0.6039216, 1, 0, 1,
-0.7376271, 0.9816047, 1.02219, 0.5960785, 1, 0, 1,
-0.7367892, 1.627583, 0.592639, 0.5882353, 1, 0, 1,
-0.7361076, -0.224975, -1.212441, 0.5843138, 1, 0, 1,
-0.7351506, 0.2575157, -0.1178667, 0.5764706, 1, 0, 1,
-0.7343482, 2.470805, -0.2456502, 0.572549, 1, 0, 1,
-0.7315262, 0.8345764, -0.04919937, 0.5647059, 1, 0, 1,
-0.7289249, -0.2830966, -4.022375, 0.5607843, 1, 0, 1,
-0.7288813, 0.8773518, -0.218262, 0.5529412, 1, 0, 1,
-0.7273514, 0.6925115, -1.02737, 0.5490196, 1, 0, 1,
-0.7238477, 0.7297316, -1.483982, 0.5411765, 1, 0, 1,
-0.7133356, -0.06365266, -1.834571, 0.5372549, 1, 0, 1,
-0.7114543, 0.3355839, -3.060324, 0.5294118, 1, 0, 1,
-0.7112615, -0.1474496, -1.228517, 0.5254902, 1, 0, 1,
-0.7047732, 1.176569, -0.4138654, 0.5176471, 1, 0, 1,
-0.7000091, 0.5815517, 0.04963312, 0.5137255, 1, 0, 1,
-0.6997482, 0.6461791, 1.250322, 0.5058824, 1, 0, 1,
-0.6965925, 1.021869, 0.685358, 0.5019608, 1, 0, 1,
-0.6944678, 0.6796064, 1.226239, 0.4941176, 1, 0, 1,
-0.6899463, 0.04650211, -2.316106, 0.4862745, 1, 0, 1,
-0.6787151, -1.149138, -3.764709, 0.4823529, 1, 0, 1,
-0.672105, -0.8397563, -3.734192, 0.4745098, 1, 0, 1,
-0.6696765, -0.8039655, -1.872451, 0.4705882, 1, 0, 1,
-0.6623079, 0.3474865, -1.651652, 0.4627451, 1, 0, 1,
-0.6619383, -0.07861526, -2.148391, 0.4588235, 1, 0, 1,
-0.6588859, 1.509529, 0.1567629, 0.4509804, 1, 0, 1,
-0.6549937, -0.6687638, -2.914194, 0.4470588, 1, 0, 1,
-0.6478258, -1.759861, -3.512757, 0.4392157, 1, 0, 1,
-0.641588, 3.259362, 1.848893, 0.4352941, 1, 0, 1,
-0.6412137, -1.197585, -3.220002, 0.427451, 1, 0, 1,
-0.633881, 0.8447649, -1.231282, 0.4235294, 1, 0, 1,
-0.6326763, 1.729149, -1.645926, 0.4156863, 1, 0, 1,
-0.6249717, -0.5693275, -0.05505797, 0.4117647, 1, 0, 1,
-0.6234761, -0.3702649, -2.852992, 0.4039216, 1, 0, 1,
-0.6223038, 1.288274, -1.30779, 0.3960784, 1, 0, 1,
-0.6151783, 0.1347131, -1.791896, 0.3921569, 1, 0, 1,
-0.614863, -0.9435872, -1.066854, 0.3843137, 1, 0, 1,
-0.6140494, -0.2396741, -2.475788, 0.3803922, 1, 0, 1,
-0.6075193, -1.690518, -3.392215, 0.372549, 1, 0, 1,
-0.6028566, 0.687911, -0.1816916, 0.3686275, 1, 0, 1,
-0.6004921, 0.513679, -2.435845, 0.3607843, 1, 0, 1,
-0.5989339, 0.401263, -1.449111, 0.3568628, 1, 0, 1,
-0.5948043, -0.2167532, -0.4065517, 0.3490196, 1, 0, 1,
-0.5936868, 0.6061622, -1.582329, 0.345098, 1, 0, 1,
-0.5881392, -1.045633, -2.794469, 0.3372549, 1, 0, 1,
-0.5880463, 1.674766, -1.704474, 0.3333333, 1, 0, 1,
-0.5868109, -1.307791, -2.540619, 0.3254902, 1, 0, 1,
-0.5840236, -0.7852755, -1.307852, 0.3215686, 1, 0, 1,
-0.5823324, -0.09808572, -2.122916, 0.3137255, 1, 0, 1,
-0.5744547, -0.1172374, -0.8960382, 0.3098039, 1, 0, 1,
-0.564006, 0.9418206, -0.1813133, 0.3019608, 1, 0, 1,
-0.562283, -0.7096534, -1.728213, 0.2941177, 1, 0, 1,
-0.5588372, 0.8764199, 1.511461, 0.2901961, 1, 0, 1,
-0.5568839, 0.6753824, -0.9818484, 0.282353, 1, 0, 1,
-0.5558994, 0.07917041, -0.5931283, 0.2784314, 1, 0, 1,
-0.5554634, -1.042978, -3.090674, 0.2705882, 1, 0, 1,
-0.5532893, -0.6775652, -3.635228, 0.2666667, 1, 0, 1,
-0.5527455, -1.018838, -2.586323, 0.2588235, 1, 0, 1,
-0.550705, 1.168115, -0.5121366, 0.254902, 1, 0, 1,
-0.5500266, 1.639532, -0.9681062, 0.2470588, 1, 0, 1,
-0.5497345, -1.989221, -1.895674, 0.2431373, 1, 0, 1,
-0.5468559, 0.03454715, -1.083984, 0.2352941, 1, 0, 1,
-0.5421636, -1.546763, -2.59079, 0.2313726, 1, 0, 1,
-0.5385352, 0.9035414, -1.063416, 0.2235294, 1, 0, 1,
-0.5351634, -1.895509, -2.119995, 0.2196078, 1, 0, 1,
-0.534305, 0.03286702, -1.024186, 0.2117647, 1, 0, 1,
-0.5311512, -2.101614, -2.625502, 0.2078431, 1, 0, 1,
-0.5294705, 0.7611365, 0.513523, 0.2, 1, 0, 1,
-0.5270488, 1.259673, -0.2983854, 0.1921569, 1, 0, 1,
-0.5221395, 1.433228, -0.4611851, 0.1882353, 1, 0, 1,
-0.5214484, -0.8104018, -2.089743, 0.1803922, 1, 0, 1,
-0.5198324, -0.0171547, -1.316931, 0.1764706, 1, 0, 1,
-0.5140617, -0.239871, -3.011893, 0.1686275, 1, 0, 1,
-0.5122629, 0.05319966, -2.375525, 0.1647059, 1, 0, 1,
-0.5121888, -1.310287, -3.814926, 0.1568628, 1, 0, 1,
-0.507473, 0.03971342, -1.392497, 0.1529412, 1, 0, 1,
-0.505846, -0.9284925, 0.1512787, 0.145098, 1, 0, 1,
-0.5001757, 2.029237, 1.325003, 0.1411765, 1, 0, 1,
-0.4974105, 0.8829922, -0.09822983, 0.1333333, 1, 0, 1,
-0.4964772, -1.078097, -2.349978, 0.1294118, 1, 0, 1,
-0.4931895, 0.9647307, -1.194067, 0.1215686, 1, 0, 1,
-0.488672, -1.498291, -3.002421, 0.1176471, 1, 0, 1,
-0.4847158, 1.916666, 0.4283708, 0.1098039, 1, 0, 1,
-0.480112, 1.625464, -1.080342, 0.1058824, 1, 0, 1,
-0.4775167, 0.8024707, -0.4806226, 0.09803922, 1, 0, 1,
-0.4746285, 0.2266497, -1.384047, 0.09019608, 1, 0, 1,
-0.4697081, -1.300163, -4.155085, 0.08627451, 1, 0, 1,
-0.4689221, -0.7031658, -1.897009, 0.07843138, 1, 0, 1,
-0.4664995, -0.9495656, -0.06168124, 0.07450981, 1, 0, 1,
-0.4623228, -0.4153658, -2.328364, 0.06666667, 1, 0, 1,
-0.46092, 0.8138545, 1.843605, 0.0627451, 1, 0, 1,
-0.4513507, -0.8819007, -4.374787, 0.05490196, 1, 0, 1,
-0.4486135, 0.9308923, -0.06556816, 0.05098039, 1, 0, 1,
-0.4452648, 1.020327, -0.5569865, 0.04313726, 1, 0, 1,
-0.4445295, 0.4709175, -1.412245, 0.03921569, 1, 0, 1,
-0.4409453, 0.9994463, -1.377641, 0.03137255, 1, 0, 1,
-0.440085, 2.169892, -0.8668393, 0.02745098, 1, 0, 1,
-0.4395844, -0.133977, -2.780056, 0.01960784, 1, 0, 1,
-0.4392874, 0.8374258, -1.10546, 0.01568628, 1, 0, 1,
-0.43913, -0.4324613, -0.1690023, 0.007843138, 1, 0, 1,
-0.438934, 0.1283074, -2.276407, 0.003921569, 1, 0, 1,
-0.4367784, -0.3262143, -2.718072, 0, 1, 0.003921569, 1,
-0.4366529, -1.287848, -1.992755, 0, 1, 0.01176471, 1,
-0.4337117, 0.3906622, -2.136468, 0, 1, 0.01568628, 1,
-0.4278955, 0.7883134, -0.1988479, 0, 1, 0.02352941, 1,
-0.4259028, 2.011163, -0.5177607, 0, 1, 0.02745098, 1,
-0.425196, -0.2272527, -1.141304, 0, 1, 0.03529412, 1,
-0.4248905, -0.5443884, -1.368795, 0, 1, 0.03921569, 1,
-0.4245693, 0.5817838, -0.3422888, 0, 1, 0.04705882, 1,
-0.4244854, -0.9096249, -0.7372512, 0, 1, 0.05098039, 1,
-0.4143111, -0.09636869, -1.064819, 0, 1, 0.05882353, 1,
-0.4105767, -1.188699, -2.21049, 0, 1, 0.0627451, 1,
-0.4094644, -1.059255, -4.422711, 0, 1, 0.07058824, 1,
-0.4069239, -1.783008, -2.161253, 0, 1, 0.07450981, 1,
-0.4011271, -1.420452, -3.877905, 0, 1, 0.08235294, 1,
-0.4000473, 0.3129178, -1.950564, 0, 1, 0.08627451, 1,
-0.398737, 0.691544, -0.5247064, 0, 1, 0.09411765, 1,
-0.3977143, 1.903539, -0.2710429, 0, 1, 0.1019608, 1,
-0.392973, -0.8566009, -2.988129, 0, 1, 0.1058824, 1,
-0.3849995, 0.3602559, -1.578433, 0, 1, 0.1137255, 1,
-0.3837632, 0.08177962, -3.188163, 0, 1, 0.1176471, 1,
-0.382313, 0.5608502, -1.842216, 0, 1, 0.1254902, 1,
-0.3820319, -0.4737003, -0.5509539, 0, 1, 0.1294118, 1,
-0.3818668, -0.8871794, -3.624301, 0, 1, 0.1372549, 1,
-0.3778523, -2.25878, -2.321194, 0, 1, 0.1411765, 1,
-0.3763371, -0.09947394, -1.394326, 0, 1, 0.1490196, 1,
-0.3715484, -0.2466817, -2.535718, 0, 1, 0.1529412, 1,
-0.3678147, -1.084258, -1.797749, 0, 1, 0.1607843, 1,
-0.3669944, -1.385991, -3.567627, 0, 1, 0.1647059, 1,
-0.3649182, 1.572591, -1.313377, 0, 1, 0.172549, 1,
-0.3643707, -0.3461831, -1.789173, 0, 1, 0.1764706, 1,
-0.3579457, 0.9305416, -0.1926444, 0, 1, 0.1843137, 1,
-0.3550654, -0.6019238, -3.343667, 0, 1, 0.1882353, 1,
-0.3532015, 0.5490889, -0.3596798, 0, 1, 0.1960784, 1,
-0.3519776, 0.01358742, -1.952107, 0, 1, 0.2039216, 1,
-0.3474286, 1.789289, 0.1435583, 0, 1, 0.2078431, 1,
-0.3443274, 0.2998414, -0.8569368, 0, 1, 0.2156863, 1,
-0.3429681, 0.1396124, -0.9373067, 0, 1, 0.2196078, 1,
-0.3404826, 0.2250931, -0.1525826, 0, 1, 0.227451, 1,
-0.3365938, 1.331482, 0.5107135, 0, 1, 0.2313726, 1,
-0.3363327, -0.5126233, -3.099869, 0, 1, 0.2392157, 1,
-0.3354487, -1.568974, -1.604408, 0, 1, 0.2431373, 1,
-0.3253543, 0.1250385, -1.611244, 0, 1, 0.2509804, 1,
-0.3232374, 0.7451383, 0.7676867, 0, 1, 0.254902, 1,
-0.3197957, 0.02985792, -1.251632, 0, 1, 0.2627451, 1,
-0.3196472, -0.1591742, -1.503685, 0, 1, 0.2666667, 1,
-0.3191861, -0.02299691, -1.401132, 0, 1, 0.2745098, 1,
-0.3187246, -0.1198083, -1.145156, 0, 1, 0.2784314, 1,
-0.3186067, -2.023406, -4.560626, 0, 1, 0.2862745, 1,
-0.3139078, 0.09792712, 1.227748, 0, 1, 0.2901961, 1,
-0.3136291, 1.41054, -0.5661476, 0, 1, 0.2980392, 1,
-0.3064795, 0.59096, -1.272883, 0, 1, 0.3058824, 1,
-0.3049629, 1.012759, 0.6337472, 0, 1, 0.3098039, 1,
-0.3035013, -1.895913, -3.984249, 0, 1, 0.3176471, 1,
-0.3008763, 0.3956583, -0.3313647, 0, 1, 0.3215686, 1,
-0.2980888, 1.547416, -0.7058293, 0, 1, 0.3294118, 1,
-0.2977251, -0.251133, -2.547163, 0, 1, 0.3333333, 1,
-0.2973482, -0.7676311, -2.089334, 0, 1, 0.3411765, 1,
-0.2970127, -0.2160344, -2.248019, 0, 1, 0.345098, 1,
-0.2957161, 0.1032923, -0.2668853, 0, 1, 0.3529412, 1,
-0.2956196, 0.6842372, -0.9112061, 0, 1, 0.3568628, 1,
-0.2944414, 2.047516, -0.1362645, 0, 1, 0.3647059, 1,
-0.29435, 0.2916386, -0.9254763, 0, 1, 0.3686275, 1,
-0.2889504, -0.08825345, -0.8889807, 0, 1, 0.3764706, 1,
-0.2888402, -0.9266053, -3.741517, 0, 1, 0.3803922, 1,
-0.2884539, 0.1039504, -2.15984, 0, 1, 0.3882353, 1,
-0.2879293, 0.9900845, -1.204062, 0, 1, 0.3921569, 1,
-0.2862026, 0.6524797, -2.441796, 0, 1, 0.4, 1,
-0.2847715, -1.166906, -4.304171, 0, 1, 0.4078431, 1,
-0.2803751, 0.1732231, -2.031139, 0, 1, 0.4117647, 1,
-0.2803363, 1.18179, -0.9109433, 0, 1, 0.4196078, 1,
-0.2792413, -2.145068, -1.707724, 0, 1, 0.4235294, 1,
-0.2772003, 0.9200565, 0.05152741, 0, 1, 0.4313726, 1,
-0.2765673, 0.5241671, -0.1735849, 0, 1, 0.4352941, 1,
-0.2758428, 1.535811, 0.3014057, 0, 1, 0.4431373, 1,
-0.2701614, 2.042758, -0.5432725, 0, 1, 0.4470588, 1,
-0.2630912, 0.5500205, 1.589492, 0, 1, 0.454902, 1,
-0.2611637, -2.211442, -3.559263, 0, 1, 0.4588235, 1,
-0.2606277, -1.969835, -3.288683, 0, 1, 0.4666667, 1,
-0.2600078, -1.517292, -3.547706, 0, 1, 0.4705882, 1,
-0.2531218, 1.935851, -0.990148, 0, 1, 0.4784314, 1,
-0.2481187, -0.8621602, -3.288554, 0, 1, 0.4823529, 1,
-0.2460396, 0.2176934, -3.048299, 0, 1, 0.4901961, 1,
-0.2397365, 0.7425002, -1.237221, 0, 1, 0.4941176, 1,
-0.2384932, -0.766422, -3.43912, 0, 1, 0.5019608, 1,
-0.234456, 1.520817, 0.9492832, 0, 1, 0.509804, 1,
-0.2330743, -0.4817381, -2.493531, 0, 1, 0.5137255, 1,
-0.2283649, -0.1781377, -2.492247, 0, 1, 0.5215687, 1,
-0.2214721, -1.179388, -3.160867, 0, 1, 0.5254902, 1,
-0.2186678, -0.3754732, -2.855737, 0, 1, 0.5333334, 1,
-0.2141934, 0.1196889, -1.33742, 0, 1, 0.5372549, 1,
-0.2136053, 0.4764317, 0.7888543, 0, 1, 0.5450981, 1,
-0.1954912, 0.2716013, 0.2347374, 0, 1, 0.5490196, 1,
-0.1951166, -1.475345, -3.520922, 0, 1, 0.5568628, 1,
-0.1935494, -0.4531029, -1.398109, 0, 1, 0.5607843, 1,
-0.1922625, -0.3459594, -3.196408, 0, 1, 0.5686275, 1,
-0.1916195, 0.3858847, 0.8653714, 0, 1, 0.572549, 1,
-0.1889046, -1.138293, -5.021176, 0, 1, 0.5803922, 1,
-0.1795695, -1.166388, -1.600517, 0, 1, 0.5843138, 1,
-0.179235, 0.5579442, 1.138992, 0, 1, 0.5921569, 1,
-0.1776644, 0.08752301, -1.702598, 0, 1, 0.5960785, 1,
-0.1775174, -0.6974615, -5.084867, 0, 1, 0.6039216, 1,
-0.1770072, -0.03746731, -1.996498, 0, 1, 0.6117647, 1,
-0.1745819, 0.5458204, 0.1880306, 0, 1, 0.6156863, 1,
-0.1714689, 0.3567349, -0.8643285, 0, 1, 0.6235294, 1,
-0.1711846, -0.3375641, -1.541816, 0, 1, 0.627451, 1,
-0.1704188, -0.2867829, -1.508929, 0, 1, 0.6352941, 1,
-0.1688344, 1.02731, 0.5490078, 0, 1, 0.6392157, 1,
-0.1677061, 0.1510883, 0.08113996, 0, 1, 0.6470588, 1,
-0.1646283, 2.007932, -1.495338, 0, 1, 0.6509804, 1,
-0.1583886, -1.717592, -3.918406, 0, 1, 0.6588235, 1,
-0.1560706, -0.1912607, -4.97466, 0, 1, 0.6627451, 1,
-0.1557316, 0.6585882, -1.67009, 0, 1, 0.6705883, 1,
-0.1549052, -0.3287954, -2.082088, 0, 1, 0.6745098, 1,
-0.151384, -1.491075, -2.993325, 0, 1, 0.682353, 1,
-0.1512152, 0.6473432, -1.98233, 0, 1, 0.6862745, 1,
-0.1507925, 0.5082499, 0.4777693, 0, 1, 0.6941177, 1,
-0.1487769, -0.1053166, -2.436659, 0, 1, 0.7019608, 1,
-0.1412758, 0.9178156, -0.3654531, 0, 1, 0.7058824, 1,
-0.1409022, 1.038197, -1.780712, 0, 1, 0.7137255, 1,
-0.1406298, -0.7926719, -3.137891, 0, 1, 0.7176471, 1,
-0.1313656, -1.720721, -4.582837, 0, 1, 0.7254902, 1,
-0.1225277, 0.2805997, 0.5475164, 0, 1, 0.7294118, 1,
-0.1187168, 0.8613894, -1.689978, 0, 1, 0.7372549, 1,
-0.1126201, 0.1010645, -1.80424, 0, 1, 0.7411765, 1,
-0.1124422, 0.4948703, 1.193192, 0, 1, 0.7490196, 1,
-0.1060497, 0.5739064, 1.135994, 0, 1, 0.7529412, 1,
-0.1028661, -0.7757043, -2.83555, 0, 1, 0.7607843, 1,
-0.09970765, 0.6502424, 0.434362, 0, 1, 0.7647059, 1,
-0.09941442, 0.6416404, -1.417966, 0, 1, 0.772549, 1,
-0.09457578, -1.287227, -3.016405, 0, 1, 0.7764706, 1,
-0.09358516, 0.9230871, -0.5213652, 0, 1, 0.7843137, 1,
-0.09344881, -0.62181, -3.585297, 0, 1, 0.7882353, 1,
-0.09235191, 0.03294055, 0.1259233, 0, 1, 0.7960784, 1,
-0.08957537, -0.9617453, -2.383605, 0, 1, 0.8039216, 1,
-0.08498946, 1.039116, -0.5208203, 0, 1, 0.8078431, 1,
-0.08470719, 0.4344693, -1.607378, 0, 1, 0.8156863, 1,
-0.07999223, 2.359769, 0.9143088, 0, 1, 0.8196079, 1,
-0.07942342, 1.011494, -0.8834106, 0, 1, 0.827451, 1,
-0.07628414, 0.5147101, -1.105646, 0, 1, 0.8313726, 1,
-0.07482256, 2.538335, -0.9811534, 0, 1, 0.8392157, 1,
-0.07295772, -0.8777174, -3.907071, 0, 1, 0.8431373, 1,
-0.0662481, 1.70442, -0.4797645, 0, 1, 0.8509804, 1,
-0.06516366, -0.001819563, -1.702616, 0, 1, 0.854902, 1,
-0.06360066, 0.06242817, -1.788995, 0, 1, 0.8627451, 1,
-0.06072939, -0.3628473, -3.15737, 0, 1, 0.8666667, 1,
-0.05411905, 0.990724, -0.5537703, 0, 1, 0.8745098, 1,
-0.05327889, -1.266696, -4.131659, 0, 1, 0.8784314, 1,
-0.05087698, 2.494144, 0.3341803, 0, 1, 0.8862745, 1,
-0.04766291, -0.4066958, -3.41168, 0, 1, 0.8901961, 1,
-0.04180054, -0.1470001, -2.30476, 0, 1, 0.8980392, 1,
-0.03989786, 0.5679669, -0.9941857, 0, 1, 0.9058824, 1,
-0.0398378, -1.004032, -3.653037, 0, 1, 0.9098039, 1,
-0.03948122, -0.9003856, -1.766948, 0, 1, 0.9176471, 1,
-0.03828927, -3.33862, -3.099659, 0, 1, 0.9215686, 1,
-0.03751231, -0.8741938, -2.811622, 0, 1, 0.9294118, 1,
-0.03723995, -0.8915737, -4.243899, 0, 1, 0.9333333, 1,
-0.03135473, -0.3826516, -2.912501, 0, 1, 0.9411765, 1,
-0.02996748, 0.2647313, -1.374419, 0, 1, 0.945098, 1,
-0.0295673, -0.02769632, -3.087791, 0, 1, 0.9529412, 1,
-0.02425425, -0.2011071, -4.667093, 0, 1, 0.9568627, 1,
-0.01578472, -0.7997492, -3.703052, 0, 1, 0.9647059, 1,
-0.009089031, 0.6043471, 0.2627277, 0, 1, 0.9686275, 1,
-0.005010978, 0.4824476, -1.293877, 0, 1, 0.9764706, 1,
-0.0008494232, 1.028161, 0.0922067, 0, 1, 0.9803922, 1,
0.0007237971, 0.3156397, -0.480173, 0, 1, 0.9882353, 1,
0.002566732, -0.7567068, 2.986534, 0, 1, 0.9921569, 1,
0.004075573, -0.3429323, 2.877583, 0, 1, 1, 1,
0.008426043, -0.188272, 2.221803, 0, 0.9921569, 1, 1,
0.009262748, -0.6151373, 3.031293, 0, 0.9882353, 1, 1,
0.01087504, -0.6725473, 2.979244, 0, 0.9803922, 1, 1,
0.01324608, 0.2311502, 2.184976, 0, 0.9764706, 1, 1,
0.01488986, 0.2917609, -0.595925, 0, 0.9686275, 1, 1,
0.01900762, 0.3197964, 2.150309, 0, 0.9647059, 1, 1,
0.02166566, 0.08594348, -0.1895379, 0, 0.9568627, 1, 1,
0.02815294, 1.779713, -1.498922, 0, 0.9529412, 1, 1,
0.02861507, -0.7118577, 2.799812, 0, 0.945098, 1, 1,
0.03021724, 0.7701833, -0.03643039, 0, 0.9411765, 1, 1,
0.03129125, -0.604585, 2.546837, 0, 0.9333333, 1, 1,
0.03371773, 0.7183608, 0.1944922, 0, 0.9294118, 1, 1,
0.03422766, 1.04744, -0.4984848, 0, 0.9215686, 1, 1,
0.03555067, 0.2997571, -0.379532, 0, 0.9176471, 1, 1,
0.03655755, -0.3603649, 3.513727, 0, 0.9098039, 1, 1,
0.03900002, 0.1957668, 1.953395, 0, 0.9058824, 1, 1,
0.0394011, 0.5386438, 1.397364, 0, 0.8980392, 1, 1,
0.04629657, 2.137998, 0.7906011, 0, 0.8901961, 1, 1,
0.05400723, 1.031741, 0.7613047, 0, 0.8862745, 1, 1,
0.05954826, 1.188431, -1.164166, 0, 0.8784314, 1, 1,
0.06113234, 0.3131461, 2.881373, 0, 0.8745098, 1, 1,
0.06384351, -0.07874222, 1.91274, 0, 0.8666667, 1, 1,
0.06485045, -0.5039091, 4.3275, 0, 0.8627451, 1, 1,
0.06559274, 0.6408924, 0.6476803, 0, 0.854902, 1, 1,
0.0704575, 1.508675, 0.06366554, 0, 0.8509804, 1, 1,
0.07935933, 0.8620263, 1.883709, 0, 0.8431373, 1, 1,
0.07953366, -0.5648591, 4.368839, 0, 0.8392157, 1, 1,
0.07996575, -0.2235403, 2.529154, 0, 0.8313726, 1, 1,
0.08955333, 0.09152357, 0.4368643, 0, 0.827451, 1, 1,
0.09801973, -0.8032172, 1.869132, 0, 0.8196079, 1, 1,
0.09894615, -0.1234661, 0.393922, 0, 0.8156863, 1, 1,
0.09977275, -0.5095515, 4.487804, 0, 0.8078431, 1, 1,
0.1013967, 0.9733624, -0.8097732, 0, 0.8039216, 1, 1,
0.1056882, 0.3282247, -0.08067779, 0, 0.7960784, 1, 1,
0.1057556, -0.2409724, 1.341077, 0, 0.7882353, 1, 1,
0.1058362, -2.041833, 2.694447, 0, 0.7843137, 1, 1,
0.1097034, 2.273841, 0.7267279, 0, 0.7764706, 1, 1,
0.1222665, 1.014615, 0.3605413, 0, 0.772549, 1, 1,
0.1263122, 1.627509, -0.4029047, 0, 0.7647059, 1, 1,
0.1272383, -1.109771, 2.502002, 0, 0.7607843, 1, 1,
0.1314636, -0.03161694, 1.77912, 0, 0.7529412, 1, 1,
0.132133, -0.8352104, 3.304076, 0, 0.7490196, 1, 1,
0.1332154, -0.2491603, 2.412749, 0, 0.7411765, 1, 1,
0.1342753, 0.7131441, -1.585164, 0, 0.7372549, 1, 1,
0.13744, -0.06579654, 3.293669, 0, 0.7294118, 1, 1,
0.1389941, 0.6029862, -0.7794837, 0, 0.7254902, 1, 1,
0.1393556, 0.7128381, 1.874583, 0, 0.7176471, 1, 1,
0.1424079, -0.1323963, 2.737776, 0, 0.7137255, 1, 1,
0.1463501, 1.083079, 0.2906888, 0, 0.7058824, 1, 1,
0.1474538, 0.7836509, 1.387164, 0, 0.6980392, 1, 1,
0.1478657, -0.288819, 2.396325, 0, 0.6941177, 1, 1,
0.1525961, -0.2237577, 3.288487, 0, 0.6862745, 1, 1,
0.1541955, -1.327336, 4.316952, 0, 0.682353, 1, 1,
0.1590752, -0.07339134, 3.449117, 0, 0.6745098, 1, 1,
0.1598886, -0.5727161, 2.100296, 0, 0.6705883, 1, 1,
0.1601314, 0.3931071, 0.843803, 0, 0.6627451, 1, 1,
0.1620027, -0.5449347, 1.88027, 0, 0.6588235, 1, 1,
0.1631478, -0.9784409, 1.246782, 0, 0.6509804, 1, 1,
0.1652497, -2.528386, 4.112502, 0, 0.6470588, 1, 1,
0.1671387, -0.4397325, 2.59999, 0, 0.6392157, 1, 1,
0.1675787, -0.8217778, 2.966377, 0, 0.6352941, 1, 1,
0.1710705, -0.003692575, 1.16367, 0, 0.627451, 1, 1,
0.1716319, 0.1258469, 0.006151655, 0, 0.6235294, 1, 1,
0.1725802, -0.744156, 1.402135, 0, 0.6156863, 1, 1,
0.1744156, -1.012419, 2.039056, 0, 0.6117647, 1, 1,
0.1746701, -0.3554278, -0.9733305, 0, 0.6039216, 1, 1,
0.1772398, 0.1749492, 1.529251, 0, 0.5960785, 1, 1,
0.1795048, -0.9261802, 2.106824, 0, 0.5921569, 1, 1,
0.1821018, 2.37464, 1.279635, 0, 0.5843138, 1, 1,
0.1898362, 1.122306, 0.1559014, 0, 0.5803922, 1, 1,
0.1941573, -0.8055244, 3.267569, 0, 0.572549, 1, 1,
0.1947904, 0.6608431, 0.4714048, 0, 0.5686275, 1, 1,
0.196261, 1.272058, -0.8252257, 0, 0.5607843, 1, 1,
0.1979004, 0.3802942, 2.739005, 0, 0.5568628, 1, 1,
0.1986743, 1.229995, -0.7122704, 0, 0.5490196, 1, 1,
0.2077418, 1.715484, 1.053672, 0, 0.5450981, 1, 1,
0.214519, 1.275984, -1.274278, 0, 0.5372549, 1, 1,
0.2238013, 0.457109, 0.7144951, 0, 0.5333334, 1, 1,
0.2278738, -0.8586448, 2.056884, 0, 0.5254902, 1, 1,
0.2281633, 0.2062887, 0.5444002, 0, 0.5215687, 1, 1,
0.2340216, -0.7610055, 2.131012, 0, 0.5137255, 1, 1,
0.2367488, -1.18666, 2.208992, 0, 0.509804, 1, 1,
0.2375228, 0.09970969, 0.005317345, 0, 0.5019608, 1, 1,
0.24004, -0.3185662, 2.723894, 0, 0.4941176, 1, 1,
0.2429773, -0.3194253, 2.167069, 0, 0.4901961, 1, 1,
0.247958, -0.2602848, 2.452813, 0, 0.4823529, 1, 1,
0.2516606, 0.1350674, 3.025425, 0, 0.4784314, 1, 1,
0.2516898, -0.7572639, 4.926504, 0, 0.4705882, 1, 1,
0.2555432, 1.616417, 0.1890851, 0, 0.4666667, 1, 1,
0.2574016, -0.639725, 3.18523, 0, 0.4588235, 1, 1,
0.2614764, -1.300718, 4.235428, 0, 0.454902, 1, 1,
0.2670357, -2.016586, 2.103434, 0, 0.4470588, 1, 1,
0.2747209, 0.07685697, 0.9091482, 0, 0.4431373, 1, 1,
0.2750394, -0.1398148, 3.765848, 0, 0.4352941, 1, 1,
0.2761272, 0.9848958, 0.7000718, 0, 0.4313726, 1, 1,
0.2761477, 0.5342253, 0.02124947, 0, 0.4235294, 1, 1,
0.276352, 0.06359271, 1.809552, 0, 0.4196078, 1, 1,
0.2767498, 0.01810032, 2.363137, 0, 0.4117647, 1, 1,
0.2814012, 1.494637, -1.653695, 0, 0.4078431, 1, 1,
0.2831993, -1.141383, 2.814107, 0, 0.4, 1, 1,
0.2873366, 0.7099037, -0.8098253, 0, 0.3921569, 1, 1,
0.2909721, 1.430104, 0.9086975, 0, 0.3882353, 1, 1,
0.2927425, 1.442403, 0.09667748, 0, 0.3803922, 1, 1,
0.2944469, 0.5028054, 0.4378935, 0, 0.3764706, 1, 1,
0.2945895, 0.3830791, 0.2898789, 0, 0.3686275, 1, 1,
0.2972501, -0.5698622, 3.643546, 0, 0.3647059, 1, 1,
0.303896, -0.3399117, 3.615616, 0, 0.3568628, 1, 1,
0.3057814, 0.9337265, 0.1897431, 0, 0.3529412, 1, 1,
0.3072233, 0.490294, 0.7861136, 0, 0.345098, 1, 1,
0.3112051, 1.939437, 0.06227612, 0, 0.3411765, 1, 1,
0.3121009, 1.437667, -1.457378, 0, 0.3333333, 1, 1,
0.3140967, -2.04726, 3.778021, 0, 0.3294118, 1, 1,
0.3142078, -1.482723, 2.798277, 0, 0.3215686, 1, 1,
0.3154606, -0.8636527, 3.038711, 0, 0.3176471, 1, 1,
0.3159857, 0.7932895, 0.1786048, 0, 0.3098039, 1, 1,
0.3226812, 1.261976, 1.680344, 0, 0.3058824, 1, 1,
0.3228278, 1.428425, 1.765014, 0, 0.2980392, 1, 1,
0.3229282, 0.6346827, 1.668834, 0, 0.2901961, 1, 1,
0.3243832, -0.2400313, 1.013397, 0, 0.2862745, 1, 1,
0.3249364, 1.492506, -0.4496628, 0, 0.2784314, 1, 1,
0.329616, 0.1956266, 1.630384, 0, 0.2745098, 1, 1,
0.330466, 0.6303728, 1.72185, 0, 0.2666667, 1, 1,
0.3319718, -0.07324009, 0.4587063, 0, 0.2627451, 1, 1,
0.3323369, 0.3635969, 0.5658491, 0, 0.254902, 1, 1,
0.3341827, 1.188342, 1.397571, 0, 0.2509804, 1, 1,
0.3382027, 1.271864, -1.205331, 0, 0.2431373, 1, 1,
0.3393714, 0.9894744, 0.9734329, 0, 0.2392157, 1, 1,
0.3430732, -0.1271309, 2.828384, 0, 0.2313726, 1, 1,
0.3462764, 0.04869239, 1.562752, 0, 0.227451, 1, 1,
0.3491623, 0.777581, 1.108853, 0, 0.2196078, 1, 1,
0.354148, 0.6674509, 3.349927, 0, 0.2156863, 1, 1,
0.3558835, 1.223221, -0.6152656, 0, 0.2078431, 1, 1,
0.3559253, 1.558195, 0.7799891, 0, 0.2039216, 1, 1,
0.3562947, -1.593741, 3.026583, 0, 0.1960784, 1, 1,
0.3608345, -0.1263421, 3.571848, 0, 0.1882353, 1, 1,
0.3652261, 1.687743, -0.4033163, 0, 0.1843137, 1, 1,
0.3675491, -2.016055, 1.449783, 0, 0.1764706, 1, 1,
0.3686097, 0.6096224, 1.32469, 0, 0.172549, 1, 1,
0.369116, -0.9825716, 2.401611, 0, 0.1647059, 1, 1,
0.3724619, 1.508841, -0.3168001, 0, 0.1607843, 1, 1,
0.3740085, 0.9330296, 1.891244, 0, 0.1529412, 1, 1,
0.3743619, 1.519914, -0.9791939, 0, 0.1490196, 1, 1,
0.3788521, -2.00221, 1.9661, 0, 0.1411765, 1, 1,
0.3808314, -0.7713699, 3.587786, 0, 0.1372549, 1, 1,
0.3828461, 0.9684064, -0.2840366, 0, 0.1294118, 1, 1,
0.384109, 0.862856, -0.07356232, 0, 0.1254902, 1, 1,
0.3881351, 0.1574323, 2.964248, 0, 0.1176471, 1, 1,
0.3900095, 2.086404, 0.2253397, 0, 0.1137255, 1, 1,
0.3940139, 1.388254, -0.8839836, 0, 0.1058824, 1, 1,
0.3946095, -0.8412123, 2.743354, 0, 0.09803922, 1, 1,
0.3968268, 0.9340003, 1.941579, 0, 0.09411765, 1, 1,
0.3974807, -1.221765, 3.293262, 0, 0.08627451, 1, 1,
0.3990427, 1.91784, -0.7770552, 0, 0.08235294, 1, 1,
0.4031523, 0.4211263, -0.2757128, 0, 0.07450981, 1, 1,
0.4065229, -0.8501734, 3.945859, 0, 0.07058824, 1, 1,
0.4113483, 1.325824, -0.2332926, 0, 0.0627451, 1, 1,
0.4186594, -1.434819, 3.090047, 0, 0.05882353, 1, 1,
0.419643, 0.2640021, -0.7698742, 0, 0.05098039, 1, 1,
0.4231448, -0.2114829, 2.84634, 0, 0.04705882, 1, 1,
0.4237611, -2.382114, 1.648867, 0, 0.03921569, 1, 1,
0.4242236, 0.2225248, -0.1333992, 0, 0.03529412, 1, 1,
0.4264337, 0.752634, 0.06447942, 0, 0.02745098, 1, 1,
0.4292495, -1.603832, 1.807102, 0, 0.02352941, 1, 1,
0.4296976, -0.7988354, 2.914359, 0, 0.01568628, 1, 1,
0.4303101, 0.7181133, -0.08759677, 0, 0.01176471, 1, 1,
0.433459, -0.2953801, 1.832532, 0, 0.003921569, 1, 1,
0.4352707, 0.7463936, -0.1131117, 0.003921569, 0, 1, 1,
0.4369503, -1.008863, 3.441524, 0.007843138, 0, 1, 1,
0.4394199, -0.6734141, 0.7662662, 0.01568628, 0, 1, 1,
0.4404922, -0.3738976, 1.016051, 0.01960784, 0, 1, 1,
0.4406187, 0.1171706, 0.1617304, 0.02745098, 0, 1, 1,
0.4470021, -0.5285087, 2.800777, 0.03137255, 0, 1, 1,
0.4536636, 0.3851227, 1.213891, 0.03921569, 0, 1, 1,
0.4563134, -1.09309, 2.339625, 0.04313726, 0, 1, 1,
0.4583258, 0.846864, 0.5124161, 0.05098039, 0, 1, 1,
0.4589265, 0.08807886, 0.1608073, 0.05490196, 0, 1, 1,
0.4646266, 0.8374633, 0.009144251, 0.0627451, 0, 1, 1,
0.4696625, -0.1389607, 2.322527, 0.06666667, 0, 1, 1,
0.4702196, 0.8256821, 1.244768, 0.07450981, 0, 1, 1,
0.4704998, 0.7606044, 1.031518, 0.07843138, 0, 1, 1,
0.4708489, -1.025312, 2.659948, 0.08627451, 0, 1, 1,
0.4719971, -1.802505, 3.246054, 0.09019608, 0, 1, 1,
0.4776805, -0.123425, 1.460591, 0.09803922, 0, 1, 1,
0.4776837, -0.3554198, 2.903126, 0.1058824, 0, 1, 1,
0.4791637, 1.731753, -1.221141, 0.1098039, 0, 1, 1,
0.4811128, 0.3076978, 1.826383, 0.1176471, 0, 1, 1,
0.4819158, 0.323379, 0.5621265, 0.1215686, 0, 1, 1,
0.4847081, -0.6293545, 2.706881, 0.1294118, 0, 1, 1,
0.4898024, -0.3955826, 2.681116, 0.1333333, 0, 1, 1,
0.4912303, 1.448089, 0.5413288, 0.1411765, 0, 1, 1,
0.4920223, -0.8591938, 1.125465, 0.145098, 0, 1, 1,
0.492808, -0.1240477, 3.064838, 0.1529412, 0, 1, 1,
0.4932266, 1.313204, -0.5741668, 0.1568628, 0, 1, 1,
0.4966826, -1.121444, 2.605248, 0.1647059, 0, 1, 1,
0.4983466, -0.3734075, 1.426848, 0.1686275, 0, 1, 1,
0.5021742, 0.04554528, -0.1505527, 0.1764706, 0, 1, 1,
0.5063626, -2.703177, 2.964333, 0.1803922, 0, 1, 1,
0.5095852, 1.085637, 0.9291411, 0.1882353, 0, 1, 1,
0.5124474, 1.038071, -1.46782, 0.1921569, 0, 1, 1,
0.5160403, 0.2678297, 2.131499, 0.2, 0, 1, 1,
0.5182299, 0.443543, 0.2026145, 0.2078431, 0, 1, 1,
0.5201222, -1.43509, 1.075206, 0.2117647, 0, 1, 1,
0.5243732, 0.4019334, 1.100034, 0.2196078, 0, 1, 1,
0.5251989, 1.549589, 0.2819697, 0.2235294, 0, 1, 1,
0.5302728, -0.1596899, 2.60666, 0.2313726, 0, 1, 1,
0.5315298, -0.9888814, 2.780151, 0.2352941, 0, 1, 1,
0.5361245, -0.8246185, 2.925814, 0.2431373, 0, 1, 1,
0.5411707, -1.236067, 1.948158, 0.2470588, 0, 1, 1,
0.542245, -1.254578, 2.699742, 0.254902, 0, 1, 1,
0.5443006, -0.2891182, 2.645784, 0.2588235, 0, 1, 1,
0.5450355, 0.8373771, -0.06688999, 0.2666667, 0, 1, 1,
0.5455829, 0.1174807, 1.914706, 0.2705882, 0, 1, 1,
0.5476106, -0.3883261, 0.7742282, 0.2784314, 0, 1, 1,
0.5483913, 1.250242, 0.482901, 0.282353, 0, 1, 1,
0.5501331, -0.1912234, 0.6914487, 0.2901961, 0, 1, 1,
0.5503046, 0.8930043, 0.02227543, 0.2941177, 0, 1, 1,
0.5515079, -1.007776, 1.86506, 0.3019608, 0, 1, 1,
0.5532048, -0.1951906, 0.5711752, 0.3098039, 0, 1, 1,
0.55361, -0.2960002, 3.253486, 0.3137255, 0, 1, 1,
0.5596473, -0.0491045, 1.167062, 0.3215686, 0, 1, 1,
0.5600517, -1.554553, 2.398422, 0.3254902, 0, 1, 1,
0.5720717, 0.6350276, 0.8858746, 0.3333333, 0, 1, 1,
0.5722947, 0.3032809, 2.053474, 0.3372549, 0, 1, 1,
0.5780492, -0.6893805, 3.256659, 0.345098, 0, 1, 1,
0.5803584, 0.1912271, 2.912843, 0.3490196, 0, 1, 1,
0.581214, 1.247618, 2.007992, 0.3568628, 0, 1, 1,
0.5837156, 0.747529, 1.535178, 0.3607843, 0, 1, 1,
0.5860794, 0.8067116, 0.0641272, 0.3686275, 0, 1, 1,
0.5927769, 0.9392355, 1.316743, 0.372549, 0, 1, 1,
0.5944893, -0.01034118, 1.115777, 0.3803922, 0, 1, 1,
0.5958753, -0.01895632, 0.370202, 0.3843137, 0, 1, 1,
0.5962242, 0.02519246, 1.457944, 0.3921569, 0, 1, 1,
0.5991487, 0.05086054, 3.216526, 0.3960784, 0, 1, 1,
0.6002947, -1.861343, 3.124106, 0.4039216, 0, 1, 1,
0.6017318, -0.382251, 1.037962, 0.4117647, 0, 1, 1,
0.607733, 2.376276, 1.972525, 0.4156863, 0, 1, 1,
0.6080133, 0.6908536, 0.5777779, 0.4235294, 0, 1, 1,
0.6082025, -1.3523, 2.366207, 0.427451, 0, 1, 1,
0.6098052, 0.5066924, 0.8591535, 0.4352941, 0, 1, 1,
0.6159539, -1.293819, 2.730569, 0.4392157, 0, 1, 1,
0.6222557, 0.653365, -0.5408323, 0.4470588, 0, 1, 1,
0.6228871, 1.146087, 0.3622036, 0.4509804, 0, 1, 1,
0.6249689, -0.8328993, 3.470595, 0.4588235, 0, 1, 1,
0.6278449, -0.425053, 1.095754, 0.4627451, 0, 1, 1,
0.6346272, -1.651755, 0.1283266, 0.4705882, 0, 1, 1,
0.6353304, -2.409907, 2.835298, 0.4745098, 0, 1, 1,
0.6407038, -0.5777212, 2.570153, 0.4823529, 0, 1, 1,
0.6413946, -1.112056, 4.028822, 0.4862745, 0, 1, 1,
0.6427781, -0.2680858, 3.581868, 0.4941176, 0, 1, 1,
0.6435533, 1.100567, -0.3635637, 0.5019608, 0, 1, 1,
0.6438823, 0.6184267, -0.7989942, 0.5058824, 0, 1, 1,
0.6440037, -1.084466, 2.083642, 0.5137255, 0, 1, 1,
0.6444868, 0.9760211, 0.6300216, 0.5176471, 0, 1, 1,
0.6458417, -0.3203939, 2.095296, 0.5254902, 0, 1, 1,
0.6471383, 0.3960257, -0.5301218, 0.5294118, 0, 1, 1,
0.6492378, -0.5075079, 1.467605, 0.5372549, 0, 1, 1,
0.6493503, -0.2850925, 2.387858, 0.5411765, 0, 1, 1,
0.6535252, -1.058968, 3.039639, 0.5490196, 0, 1, 1,
0.6549944, -1.418326, 0.8272182, 0.5529412, 0, 1, 1,
0.6551077, 0.6677921, 0.8666949, 0.5607843, 0, 1, 1,
0.6597628, 0.9382382, 0.9743298, 0.5647059, 0, 1, 1,
0.6610553, -0.6379868, 2.26698, 0.572549, 0, 1, 1,
0.6615244, -0.1370158, 3.874817, 0.5764706, 0, 1, 1,
0.6657031, 1.809393, 1.21114, 0.5843138, 0, 1, 1,
0.6695164, 0.2198163, 0.1081791, 0.5882353, 0, 1, 1,
0.6706956, -0.7737702, 2.598863, 0.5960785, 0, 1, 1,
0.6727846, 1.72136, -0.482884, 0.6039216, 0, 1, 1,
0.6745627, -2.041327, 3.903097, 0.6078432, 0, 1, 1,
0.6765773, 0.630054, 2.179027, 0.6156863, 0, 1, 1,
0.6787475, 0.6475183, 1.235999, 0.6196079, 0, 1, 1,
0.6806092, -0.4750781, 3.750402, 0.627451, 0, 1, 1,
0.683314, 0.3493334, -0.2782303, 0.6313726, 0, 1, 1,
0.6850111, -0.2796634, 2.374583, 0.6392157, 0, 1, 1,
0.6878108, -0.003657051, 2.089541, 0.6431373, 0, 1, 1,
0.6892151, 1.112284, 0.5695803, 0.6509804, 0, 1, 1,
0.6941193, 0.05115884, 1.968575, 0.654902, 0, 1, 1,
0.6945902, 0.9177624, 0.1317771, 0.6627451, 0, 1, 1,
0.7032872, -0.8377941, 2.775007, 0.6666667, 0, 1, 1,
0.7091728, 0.5685083, 2.075355, 0.6745098, 0, 1, 1,
0.7161181, 0.6749465, 0.796219, 0.6784314, 0, 1, 1,
0.7179298, 1.316186, 0.4720546, 0.6862745, 0, 1, 1,
0.7245671, 0.7416967, 0.2431647, 0.6901961, 0, 1, 1,
0.7279313, 0.0413121, 1.365663, 0.6980392, 0, 1, 1,
0.7306827, -2.198705, 1.693877, 0.7058824, 0, 1, 1,
0.7332597, 0.2183589, 3.601998, 0.7098039, 0, 1, 1,
0.733285, -0.6739676, 1.991967, 0.7176471, 0, 1, 1,
0.7369066, 0.8200814, 0.9448437, 0.7215686, 0, 1, 1,
0.7438791, -1.146747, 2.474149, 0.7294118, 0, 1, 1,
0.7522663, -2.531676, 3.927249, 0.7333333, 0, 1, 1,
0.7556701, -0.6223759, 4.401202, 0.7411765, 0, 1, 1,
0.7561626, 0.9743553, 2.82239, 0.7450981, 0, 1, 1,
0.7738941, 1.619159, -0.2159634, 0.7529412, 0, 1, 1,
0.7808623, -0.6186365, 1.987391, 0.7568628, 0, 1, 1,
0.7878475, 2.161368, 0.07059576, 0.7647059, 0, 1, 1,
0.7903765, 0.2335684, -0.2632256, 0.7686275, 0, 1, 1,
0.7952136, 0.364156, 1.692106, 0.7764706, 0, 1, 1,
0.7984722, 2.41936, 0.1971669, 0.7803922, 0, 1, 1,
0.801262, -1.682915, 2.153203, 0.7882353, 0, 1, 1,
0.8053591, 0.8245898, 1.261464, 0.7921569, 0, 1, 1,
0.8068956, -1.946412, 3.879052, 0.8, 0, 1, 1,
0.807627, 0.08028747, 3.674675, 0.8078431, 0, 1, 1,
0.8141117, -0.2054771, 0.7902364, 0.8117647, 0, 1, 1,
0.8143771, -0.5246697, 0.9968992, 0.8196079, 0, 1, 1,
0.8281022, -0.2538176, 2.580829, 0.8235294, 0, 1, 1,
0.8346291, 0.08032537, 1.628031, 0.8313726, 0, 1, 1,
0.836211, 0.375535, 0.3765287, 0.8352941, 0, 1, 1,
0.8375847, -1.827259, 1.09134, 0.8431373, 0, 1, 1,
0.8423527, -0.03724189, 1.840907, 0.8470588, 0, 1, 1,
0.8433684, -0.2184512, 2.02786, 0.854902, 0, 1, 1,
0.8481003, -0.9910724, 3.477909, 0.8588235, 0, 1, 1,
0.8562589, -0.1258613, 1.427262, 0.8666667, 0, 1, 1,
0.8647737, -0.1781932, 1.595766, 0.8705882, 0, 1, 1,
0.8668585, 0.852535, -0.06341789, 0.8784314, 0, 1, 1,
0.8676581, 1.0757, 1.626152, 0.8823529, 0, 1, 1,
0.8713526, -0.6759469, 3.689611, 0.8901961, 0, 1, 1,
0.8745233, 1.338106, 1.664368, 0.8941177, 0, 1, 1,
0.8828475, -0.6905504, 2.043855, 0.9019608, 0, 1, 1,
0.8843499, -3.159789, 3.947143, 0.9098039, 0, 1, 1,
0.8849367, -0.06608124, 2.584049, 0.9137255, 0, 1, 1,
0.8872816, -0.07392835, 0.8062478, 0.9215686, 0, 1, 1,
0.8884994, -0.1761996, 3.143932, 0.9254902, 0, 1, 1,
0.8943182, 0.8892244, 0.7538653, 0.9333333, 0, 1, 1,
0.8956564, -1.841914, 2.812284, 0.9372549, 0, 1, 1,
0.8961515, 0.09682346, 3.566251, 0.945098, 0, 1, 1,
0.8966646, 0.4879783, 2.412637, 0.9490196, 0, 1, 1,
0.9057348, -0.912739, 3.127941, 0.9568627, 0, 1, 1,
0.9063777, -0.3550581, 1.81011, 0.9607843, 0, 1, 1,
0.9074378, 0.9301218, 0.4523766, 0.9686275, 0, 1, 1,
0.9113877, 0.6397963, 0.9056395, 0.972549, 0, 1, 1,
0.9119992, -1.131163, 1.069572, 0.9803922, 0, 1, 1,
0.9133858, 1.904656, -0.8119902, 0.9843137, 0, 1, 1,
0.9151736, -0.9471192, 2.430561, 0.9921569, 0, 1, 1,
0.9164497, 0.005810587, 1.000061, 0.9960784, 0, 1, 1,
0.9177408, -0.4186442, 1.069951, 1, 0, 0.9960784, 1,
0.918327, 1.327324, 1.620928, 1, 0, 0.9882353, 1,
0.9202643, 1.196539, 0.05190847, 1, 0, 0.9843137, 1,
0.9272362, -1.311211, 1.813894, 1, 0, 0.9764706, 1,
0.9295562, -1.006793, 4.137702, 1, 0, 0.972549, 1,
0.9325982, 1.73024, 0.5956442, 1, 0, 0.9647059, 1,
0.9379335, 1.397763, 1.638002, 1, 0, 0.9607843, 1,
0.9484217, -0.2020123, 3.210398, 1, 0, 0.9529412, 1,
0.9528963, -0.9300227, 2.567847, 1, 0, 0.9490196, 1,
0.9591745, -0.4906029, 1.643646, 1, 0, 0.9411765, 1,
0.9609717, 0.8143924, 0.9860494, 1, 0, 0.9372549, 1,
0.9669383, -0.3468924, 0.2701529, 1, 0, 0.9294118, 1,
0.967176, -0.1455228, 0.4146048, 1, 0, 0.9254902, 1,
0.9684431, -0.1265189, 2.52585, 1, 0, 0.9176471, 1,
0.969534, 1.791235, 0.09372941, 1, 0, 0.9137255, 1,
0.9771245, -0.1314368, 0.703865, 1, 0, 0.9058824, 1,
0.9780298, -1.094656, 4.003331, 1, 0, 0.9019608, 1,
0.9784147, -0.1370543, 1.87368, 1, 0, 0.8941177, 1,
0.9829952, 1.510366, 0.4389062, 1, 0, 0.8862745, 1,
0.9855102, -0.8575057, 2.244595, 1, 0, 0.8823529, 1,
0.9892166, 0.586047, 0.1903617, 1, 0, 0.8745098, 1,
0.9937639, -0.2842093, 1.895084, 1, 0, 0.8705882, 1,
0.996559, -0.8861175, 3.142661, 1, 0, 0.8627451, 1,
1.001766, 1.629173, 1.13702, 1, 0, 0.8588235, 1,
1.002093, -0.9589854, 2.883656, 1, 0, 0.8509804, 1,
1.008155, -0.7966915, 2.284441, 1, 0, 0.8470588, 1,
1.016134, 0.2145122, -0.2469302, 1, 0, 0.8392157, 1,
1.019242, 0.07100587, 2.386458, 1, 0, 0.8352941, 1,
1.024004, 0.5199605, 1.169702, 1, 0, 0.827451, 1,
1.025595, 1.907327, 0.6563985, 1, 0, 0.8235294, 1,
1.031162, 0.1562922, 0.9229239, 1, 0, 0.8156863, 1,
1.034047, 0.5280959, 1.710016, 1, 0, 0.8117647, 1,
1.03503, 0.09538728, 1.542863, 1, 0, 0.8039216, 1,
1.035749, -0.6549409, 2.307167, 1, 0, 0.7960784, 1,
1.036866, 0.459435, 1.110398, 1, 0, 0.7921569, 1,
1.051368, 0.9919564, 0.4625531, 1, 0, 0.7843137, 1,
1.051439, -1.727399, 1.864718, 1, 0, 0.7803922, 1,
1.053739, -0.1752408, 2.136492, 1, 0, 0.772549, 1,
1.058997, 2.221021, 0.007678524, 1, 0, 0.7686275, 1,
1.059137, 0.07215774, 0.3534169, 1, 0, 0.7607843, 1,
1.061696, 0.5595858, -1.76891, 1, 0, 0.7568628, 1,
1.066842, 0.09700128, 0.5711525, 1, 0, 0.7490196, 1,
1.073679, 0.4095415, 2.471342, 1, 0, 0.7450981, 1,
1.074413, 0.055336, 2.478782, 1, 0, 0.7372549, 1,
1.090886, 0.098572, 0.9866559, 1, 0, 0.7333333, 1,
1.091524, -0.5326909, 1.467188, 1, 0, 0.7254902, 1,
1.105751, -1.186501, 2.906832, 1, 0, 0.7215686, 1,
1.108877, -1.615071, 3.661795, 1, 0, 0.7137255, 1,
1.110149, 1.425909, 1.260184, 1, 0, 0.7098039, 1,
1.115644, -0.6947396, 2.290544, 1, 0, 0.7019608, 1,
1.115681, 1.04424, 1.743605, 1, 0, 0.6941177, 1,
1.119828, 1.553284, 0.1508425, 1, 0, 0.6901961, 1,
1.123346, -0.3614261, 2.375784, 1, 0, 0.682353, 1,
1.128759, -0.4044825, 2.924484, 1, 0, 0.6784314, 1,
1.132146, 0.1520314, 1.42472, 1, 0, 0.6705883, 1,
1.139876, 0.8600134, 0.6786563, 1, 0, 0.6666667, 1,
1.14583, -0.7119898, 1.677501, 1, 0, 0.6588235, 1,
1.147635, 0.4173661, 1.694961, 1, 0, 0.654902, 1,
1.149069, -0.1309405, 2.274243, 1, 0, 0.6470588, 1,
1.165102, 0.6205472, 1.903922, 1, 0, 0.6431373, 1,
1.166521, 0.8254781, 0.9805936, 1, 0, 0.6352941, 1,
1.169483, -0.4959561, 1.845775, 1, 0, 0.6313726, 1,
1.186505, 1.702186, -0.4061445, 1, 0, 0.6235294, 1,
1.190002, -0.1747254, 0.433845, 1, 0, 0.6196079, 1,
1.199401, -0.1745825, 0.7638453, 1, 0, 0.6117647, 1,
1.210368, -1.098959, 1.600549, 1, 0, 0.6078432, 1,
1.211288, 0.04258646, 1.696037, 1, 0, 0.6, 1,
1.220816, -0.6289948, 3.234974, 1, 0, 0.5921569, 1,
1.238927, 1.118157, 4.394431, 1, 0, 0.5882353, 1,
1.242417, 0.2613605, 2.386399, 1, 0, 0.5803922, 1,
1.243675, -0.1777558, 2.520696, 1, 0, 0.5764706, 1,
1.245545, -0.82113, 1.11263, 1, 0, 0.5686275, 1,
1.252941, 0.2451782, 2.134837, 1, 0, 0.5647059, 1,
1.258014, 0.0169982, 0.5568476, 1, 0, 0.5568628, 1,
1.25839, 0.5870025, 1.233537, 1, 0, 0.5529412, 1,
1.261217, -1.613231, 3.455447, 1, 0, 0.5450981, 1,
1.266286, -0.6793574, 2.115891, 1, 0, 0.5411765, 1,
1.267957, 0.6593618, -0.6644612, 1, 0, 0.5333334, 1,
1.283501, 0.08672392, 0.04559352, 1, 0, 0.5294118, 1,
1.287376, -0.2085191, 0.9082545, 1, 0, 0.5215687, 1,
1.287425, -0.5975946, 1.225621, 1, 0, 0.5176471, 1,
1.290383, 0.5799525, 1.231075, 1, 0, 0.509804, 1,
1.292, 1.18811, 0.244697, 1, 0, 0.5058824, 1,
1.295761, 1.015928, 0.7062106, 1, 0, 0.4980392, 1,
1.31196, 0.6030812, 0.9206914, 1, 0, 0.4901961, 1,
1.316496, 0.3942589, 3.368684, 1, 0, 0.4862745, 1,
1.335984, 2.051003, 1.285195, 1, 0, 0.4784314, 1,
1.343265, 0.05445526, 1.334157, 1, 0, 0.4745098, 1,
1.352654, -0.7572076, 1.30509, 1, 0, 0.4666667, 1,
1.36321, 1.399917, 0.4776596, 1, 0, 0.4627451, 1,
1.365358, -0.01775679, 0.9000146, 1, 0, 0.454902, 1,
1.378092, -0.282916, 3.43869, 1, 0, 0.4509804, 1,
1.379296, -1.24997, 1.628135, 1, 0, 0.4431373, 1,
1.38016, -1.228207, 2.992392, 1, 0, 0.4392157, 1,
1.387146, 0.6129009, -0.5459988, 1, 0, 0.4313726, 1,
1.39291, 0.6327417, 2.818752, 1, 0, 0.427451, 1,
1.394261, -0.3587265, 3.456758, 1, 0, 0.4196078, 1,
1.39731, 0.6280388, 1.088883, 1, 0, 0.4156863, 1,
1.404452, 0.0003493901, 2.016407, 1, 0, 0.4078431, 1,
1.408085, -0.6438888, 2.661213, 1, 0, 0.4039216, 1,
1.41297, -0.5694529, 1.474367, 1, 0, 0.3960784, 1,
1.433984, 1.964726, 2.407101, 1, 0, 0.3882353, 1,
1.455319, 0.5639681, 0.6148531, 1, 0, 0.3843137, 1,
1.464517, -1.013365, 0.8235605, 1, 0, 0.3764706, 1,
1.472704, -0.4187856, 1.206035, 1, 0, 0.372549, 1,
1.489229, -0.2355848, 2.341473, 1, 0, 0.3647059, 1,
1.49135, 0.218925, 1.402715, 1, 0, 0.3607843, 1,
1.504225, -0.6644525, 2.619901, 1, 0, 0.3529412, 1,
1.511438, 0.2325579, 1.131467, 1, 0, 0.3490196, 1,
1.531688, -1.827867, 2.372785, 1, 0, 0.3411765, 1,
1.536261, -1.197181, 2.177222, 1, 0, 0.3372549, 1,
1.538024, -0.3733419, 1.933953, 1, 0, 0.3294118, 1,
1.542307, -0.3177301, 0.9449847, 1, 0, 0.3254902, 1,
1.545261, -0.9120253, 1.462741, 1, 0, 0.3176471, 1,
1.549533, -0.5594296, 2.209301, 1, 0, 0.3137255, 1,
1.578705, 0.5818259, -0.3377038, 1, 0, 0.3058824, 1,
1.579979, -0.1611383, 2.108452, 1, 0, 0.2980392, 1,
1.58833, 0.1819604, 0.9600621, 1, 0, 0.2941177, 1,
1.605902, 2.05572, -1.017727, 1, 0, 0.2862745, 1,
1.616344, 0.5993662, 1.837389, 1, 0, 0.282353, 1,
1.620595, -0.6364155, 1.528219, 1, 0, 0.2745098, 1,
1.623339, 0.1880494, 2.142895, 1, 0, 0.2705882, 1,
1.644824, 1.491644, 1.178497, 1, 0, 0.2627451, 1,
1.648814, -0.8866628, 0.8900899, 1, 0, 0.2588235, 1,
1.650912, -0.6668178, 2.471175, 1, 0, 0.2509804, 1,
1.655874, -0.1062486, 2.469343, 1, 0, 0.2470588, 1,
1.657743, -0.3652193, 2.008599, 1, 0, 0.2392157, 1,
1.697631, 0.8406689, -1.183695, 1, 0, 0.2352941, 1,
1.738685, 0.4690025, 0.7379386, 1, 0, 0.227451, 1,
1.740005, -0.4120685, 1.518662, 1, 0, 0.2235294, 1,
1.740279, -0.3381012, 0.8770954, 1, 0, 0.2156863, 1,
1.749714, -0.689069, -0.618908, 1, 0, 0.2117647, 1,
1.800093, -1.836663, 2.350657, 1, 0, 0.2039216, 1,
1.809475, 0.4784547, 3.497122, 1, 0, 0.1960784, 1,
1.812546, -1.004673, 1.508846, 1, 0, 0.1921569, 1,
1.828315, 1.073379, 0.7735315, 1, 0, 0.1843137, 1,
1.867153, -0.5897995, 1.493322, 1, 0, 0.1803922, 1,
1.876881, -0.6911938, 4.644517, 1, 0, 0.172549, 1,
1.880519, 1.00831, 0.8644204, 1, 0, 0.1686275, 1,
1.91194, 0.03397642, 0.7603698, 1, 0, 0.1607843, 1,
1.920562, 0.08490182, 0.8676205, 1, 0, 0.1568628, 1,
1.937115, -1.136205, 1.101947, 1, 0, 0.1490196, 1,
1.937372, 0.8539869, 3.139517, 1, 0, 0.145098, 1,
1.954866, -0.1024311, 1.144674, 1, 0, 0.1372549, 1,
1.972104, 0.6949263, 2.300122, 1, 0, 0.1333333, 1,
1.981876, -0.1233985, 1.424604, 1, 0, 0.1254902, 1,
1.991483, 0.5781714, 1.437777, 1, 0, 0.1215686, 1,
2.005383, 0.2280426, 3.11857, 1, 0, 0.1137255, 1,
2.007962, -0.7117797, 0.06156053, 1, 0, 0.1098039, 1,
2.022955, 1.969401, 1.011368, 1, 0, 0.1019608, 1,
2.055241, -1.212271, 3.46714, 1, 0, 0.09411765, 1,
2.074718, -0.9681289, 4.877236, 1, 0, 0.09019608, 1,
2.098982, 0.4214827, 1.458842, 1, 0, 0.08235294, 1,
2.099336, -0.4014836, 1.960404, 1, 0, 0.07843138, 1,
2.107397, -1.669466, 2.609605, 1, 0, 0.07058824, 1,
2.118192, 1.196043, 1.887087, 1, 0, 0.06666667, 1,
2.230344, -1.092456, 3.827825, 1, 0, 0.05882353, 1,
2.283565, 1.966813, 1.203311, 1, 0, 0.05490196, 1,
2.309314, 0.4580427, 2.677491, 1, 0, 0.04705882, 1,
2.321351, 1.624844, -0.2177132, 1, 0, 0.04313726, 1,
2.368962, -1.587661, 2.218689, 1, 0, 0.03529412, 1,
2.466682, 0.9439299, 3.085375, 1, 0, 0.03137255, 1,
2.494407, 1.542279, 2.160609, 1, 0, 0.02352941, 1,
2.547741, 0.9238143, 1.324913, 1, 0, 0.01960784, 1,
2.784663, 0.4062865, -0.1785913, 1, 0, 0.01176471, 1,
2.83899, -0.1540789, 0.534503, 1, 0, 0.007843138, 1
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
-0.4039645, -4.456978, -6.781795, 0, -0.5, 0.5, 0.5,
-0.4039645, -4.456978, -6.781795, 1, -0.5, 0.5, 0.5,
-0.4039645, -4.456978, -6.781795, 1, 1.5, 0.5, 0.5,
-0.4039645, -4.456978, -6.781795, 0, 1.5, 0.5, 0.5
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
-4.746281, -0.03962862, -6.781795, 0, -0.5, 0.5, 0.5,
-4.746281, -0.03962862, -6.781795, 1, -0.5, 0.5, 0.5,
-4.746281, -0.03962862, -6.781795, 1, 1.5, 0.5, 0.5,
-4.746281, -0.03962862, -6.781795, 0, 1.5, 0.5, 0.5
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
-4.746281, -4.456978, -0.07918167, 0, -0.5, 0.5, 0.5,
-4.746281, -4.456978, -0.07918167, 1, -0.5, 0.5, 0.5,
-4.746281, -4.456978, -0.07918167, 1, 1.5, 0.5, 0.5,
-4.746281, -4.456978, -0.07918167, 0, 1.5, 0.5, 0.5
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
-3, -3.437589, -5.235037,
2, -3.437589, -5.235037,
-3, -3.437589, -5.235037,
-3, -3.607487, -5.49283,
-2, -3.437589, -5.235037,
-2, -3.607487, -5.49283,
-1, -3.437589, -5.235037,
-1, -3.607487, -5.49283,
0, -3.437589, -5.235037,
0, -3.607487, -5.49283,
1, -3.437589, -5.235037,
1, -3.607487, -5.49283,
2, -3.437589, -5.235037,
2, -3.607487, -5.49283
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
-3, -3.947284, -6.008416, 0, -0.5, 0.5, 0.5,
-3, -3.947284, -6.008416, 1, -0.5, 0.5, 0.5,
-3, -3.947284, -6.008416, 1, 1.5, 0.5, 0.5,
-3, -3.947284, -6.008416, 0, 1.5, 0.5, 0.5,
-2, -3.947284, -6.008416, 0, -0.5, 0.5, 0.5,
-2, -3.947284, -6.008416, 1, -0.5, 0.5, 0.5,
-2, -3.947284, -6.008416, 1, 1.5, 0.5, 0.5,
-2, -3.947284, -6.008416, 0, 1.5, 0.5, 0.5,
-1, -3.947284, -6.008416, 0, -0.5, 0.5, 0.5,
-1, -3.947284, -6.008416, 1, -0.5, 0.5, 0.5,
-1, -3.947284, -6.008416, 1, 1.5, 0.5, 0.5,
-1, -3.947284, -6.008416, 0, 1.5, 0.5, 0.5,
0, -3.947284, -6.008416, 0, -0.5, 0.5, 0.5,
0, -3.947284, -6.008416, 1, -0.5, 0.5, 0.5,
0, -3.947284, -6.008416, 1, 1.5, 0.5, 0.5,
0, -3.947284, -6.008416, 0, 1.5, 0.5, 0.5,
1, -3.947284, -6.008416, 0, -0.5, 0.5, 0.5,
1, -3.947284, -6.008416, 1, -0.5, 0.5, 0.5,
1, -3.947284, -6.008416, 1, 1.5, 0.5, 0.5,
1, -3.947284, -6.008416, 0, 1.5, 0.5, 0.5,
2, -3.947284, -6.008416, 0, -0.5, 0.5, 0.5,
2, -3.947284, -6.008416, 1, -0.5, 0.5, 0.5,
2, -3.947284, -6.008416, 1, 1.5, 0.5, 0.5,
2, -3.947284, -6.008416, 0, 1.5, 0.5, 0.5
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
-3.744208, -3, -5.235037,
-3.744208, 3, -5.235037,
-3.744208, -3, -5.235037,
-3.91122, -3, -5.49283,
-3.744208, -2, -5.235037,
-3.91122, -2, -5.49283,
-3.744208, -1, -5.235037,
-3.91122, -1, -5.49283,
-3.744208, 0, -5.235037,
-3.91122, 0, -5.49283,
-3.744208, 1, -5.235037,
-3.91122, 1, -5.49283,
-3.744208, 2, -5.235037,
-3.91122, 2, -5.49283,
-3.744208, 3, -5.235037,
-3.91122, 3, -5.49283
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
-4.245245, -3, -6.008416, 0, -0.5, 0.5, 0.5,
-4.245245, -3, -6.008416, 1, -0.5, 0.5, 0.5,
-4.245245, -3, -6.008416, 1, 1.5, 0.5, 0.5,
-4.245245, -3, -6.008416, 0, 1.5, 0.5, 0.5,
-4.245245, -2, -6.008416, 0, -0.5, 0.5, 0.5,
-4.245245, -2, -6.008416, 1, -0.5, 0.5, 0.5,
-4.245245, -2, -6.008416, 1, 1.5, 0.5, 0.5,
-4.245245, -2, -6.008416, 0, 1.5, 0.5, 0.5,
-4.245245, -1, -6.008416, 0, -0.5, 0.5, 0.5,
-4.245245, -1, -6.008416, 1, -0.5, 0.5, 0.5,
-4.245245, -1, -6.008416, 1, 1.5, 0.5, 0.5,
-4.245245, -1, -6.008416, 0, 1.5, 0.5, 0.5,
-4.245245, 0, -6.008416, 0, -0.5, 0.5, 0.5,
-4.245245, 0, -6.008416, 1, -0.5, 0.5, 0.5,
-4.245245, 0, -6.008416, 1, 1.5, 0.5, 0.5,
-4.245245, 0, -6.008416, 0, 1.5, 0.5, 0.5,
-4.245245, 1, -6.008416, 0, -0.5, 0.5, 0.5,
-4.245245, 1, -6.008416, 1, -0.5, 0.5, 0.5,
-4.245245, 1, -6.008416, 1, 1.5, 0.5, 0.5,
-4.245245, 1, -6.008416, 0, 1.5, 0.5, 0.5,
-4.245245, 2, -6.008416, 0, -0.5, 0.5, 0.5,
-4.245245, 2, -6.008416, 1, -0.5, 0.5, 0.5,
-4.245245, 2, -6.008416, 1, 1.5, 0.5, 0.5,
-4.245245, 2, -6.008416, 0, 1.5, 0.5, 0.5,
-4.245245, 3, -6.008416, 0, -0.5, 0.5, 0.5,
-4.245245, 3, -6.008416, 1, -0.5, 0.5, 0.5,
-4.245245, 3, -6.008416, 1, 1.5, 0.5, 0.5,
-4.245245, 3, -6.008416, 0, 1.5, 0.5, 0.5
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
-3.744208, -3.437589, -4,
-3.744208, -3.437589, 4,
-3.744208, -3.437589, -4,
-3.91122, -3.607487, -4,
-3.744208, -3.437589, -2,
-3.91122, -3.607487, -2,
-3.744208, -3.437589, 0,
-3.91122, -3.607487, 0,
-3.744208, -3.437589, 2,
-3.91122, -3.607487, 2,
-3.744208, -3.437589, 4,
-3.91122, -3.607487, 4
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
-4.245245, -3.947284, -4, 0, -0.5, 0.5, 0.5,
-4.245245, -3.947284, -4, 1, -0.5, 0.5, 0.5,
-4.245245, -3.947284, -4, 1, 1.5, 0.5, 0.5,
-4.245245, -3.947284, -4, 0, 1.5, 0.5, 0.5,
-4.245245, -3.947284, -2, 0, -0.5, 0.5, 0.5,
-4.245245, -3.947284, -2, 1, -0.5, 0.5, 0.5,
-4.245245, -3.947284, -2, 1, 1.5, 0.5, 0.5,
-4.245245, -3.947284, -2, 0, 1.5, 0.5, 0.5,
-4.245245, -3.947284, 0, 0, -0.5, 0.5, 0.5,
-4.245245, -3.947284, 0, 1, -0.5, 0.5, 0.5,
-4.245245, -3.947284, 0, 1, 1.5, 0.5, 0.5,
-4.245245, -3.947284, 0, 0, 1.5, 0.5, 0.5,
-4.245245, -3.947284, 2, 0, -0.5, 0.5, 0.5,
-4.245245, -3.947284, 2, 1, -0.5, 0.5, 0.5,
-4.245245, -3.947284, 2, 1, 1.5, 0.5, 0.5,
-4.245245, -3.947284, 2, 0, 1.5, 0.5, 0.5,
-4.245245, -3.947284, 4, 0, -0.5, 0.5, 0.5,
-4.245245, -3.947284, 4, 1, -0.5, 0.5, 0.5,
-4.245245, -3.947284, 4, 1, 1.5, 0.5, 0.5,
-4.245245, -3.947284, 4, 0, 1.5, 0.5, 0.5
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
-3.744208, -3.437589, -5.235037,
-3.744208, 3.358332, -5.235037,
-3.744208, -3.437589, 5.076674,
-3.744208, 3.358332, 5.076674,
-3.744208, -3.437589, -5.235037,
-3.744208, -3.437589, 5.076674,
-3.744208, 3.358332, -5.235037,
-3.744208, 3.358332, 5.076674,
-3.744208, -3.437589, -5.235037,
2.936279, -3.437589, -5.235037,
-3.744208, -3.437589, 5.076674,
2.936279, -3.437589, 5.076674,
-3.744208, 3.358332, -5.235037,
2.936279, 3.358332, -5.235037,
-3.744208, 3.358332, 5.076674,
2.936279, 3.358332, 5.076674,
2.936279, -3.437589, -5.235037,
2.936279, 3.358332, -5.235037,
2.936279, -3.437589, 5.076674,
2.936279, 3.358332, 5.076674,
2.936279, -3.437589, -5.235037,
2.936279, -3.437589, 5.076674,
2.936279, 3.358332, -5.235037,
2.936279, 3.358332, 5.076674
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
var radius = 7.49753;
var distance = 33.35736;
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
mvMatrix.translate( 0.4039645, 0.03962862, 0.07918167 );
mvMatrix.scale( 1.213456, 1.192844, 0.7861426 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.35736);
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
acrolein<-read.table("acrolein.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-acrolein$V2
```

```
## Error in eval(expr, envir, enclos): object 'acrolein' not found
```

```r
y<-acrolein$V3
```

```
## Error in eval(expr, envir, enclos): object 'acrolein' not found
```

```r
z<-acrolein$V4
```

```
## Error in eval(expr, envir, enclos): object 'acrolein' not found
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
-3.646919, 1.101994, -0.1874003, 0, 0, 1, 1, 1,
-3.543912, 0.3542411, -1.114419, 1, 0, 0, 1, 1,
-3.153938, -0.2883984, -0.7854668, 1, 0, 0, 1, 1,
-2.992283, -0.8462469, -0.8395101, 1, 0, 0, 1, 1,
-2.937967, 0.5220103, -3.47348, 1, 0, 0, 1, 1,
-2.818798, 0.5722923, -3.012388, 1, 0, 0, 1, 1,
-2.744516, 0.1660912, -1.191132, 0, 0, 0, 1, 1,
-2.716503, -0.4783869, -1.926798, 0, 0, 0, 1, 1,
-2.677858, -0.53033, -1.454646, 0, 0, 0, 1, 1,
-2.668601, -0.9200753, -1.532339, 0, 0, 0, 1, 1,
-2.599796, -0.9648094, -1.57888, 0, 0, 0, 1, 1,
-2.523646, 0.1026736, -3.600313, 0, 0, 0, 1, 1,
-2.469773, -0.4905567, -1.737369, 0, 0, 0, 1, 1,
-2.448085, 1.315023, -2.664926, 1, 1, 1, 1, 1,
-2.387682, 0.1858734, -1.119134, 1, 1, 1, 1, 1,
-2.350843, 0.8636655, -2.69687, 1, 1, 1, 1, 1,
-2.325694, 0.1691514, -0.6655716, 1, 1, 1, 1, 1,
-2.258442, -1.151054, -2.995366, 1, 1, 1, 1, 1,
-2.255568, 0.9450946, -3.5211, 1, 1, 1, 1, 1,
-2.255119, 0.5119886, -3.011754, 1, 1, 1, 1, 1,
-2.215816, 0.914003, -1.721105, 1, 1, 1, 1, 1,
-2.204093, 0.883299, -2.123929, 1, 1, 1, 1, 1,
-2.188394, -2.245248, -0.163418, 1, 1, 1, 1, 1,
-2.176795, -0.1405216, -2.417021, 1, 1, 1, 1, 1,
-2.170271, -0.7024989, -3.12382, 1, 1, 1, 1, 1,
-2.151592, -0.7968969, -1.759068, 1, 1, 1, 1, 1,
-2.122942, 2.071177, -1.531529, 1, 1, 1, 1, 1,
-2.121954, -0.1706376, 0.4152372, 1, 1, 1, 1, 1,
-2.091298, 2.319739, 0.1892221, 0, 0, 1, 1, 1,
-2.052464, -1.82233, -2.405557, 1, 0, 0, 1, 1,
-1.996847, 0.7780151, 0.6250029, 1, 0, 0, 1, 1,
-1.991044, -0.9306593, -3.24097, 1, 0, 0, 1, 1,
-1.978614, -0.8799673, -2.927894, 1, 0, 0, 1, 1,
-1.977804, -0.09107174, -1.914975, 1, 0, 0, 1, 1,
-1.965863, -0.7731124, 0.3093552, 0, 0, 0, 1, 1,
-1.961533, 0.7099495, -2.192147, 0, 0, 0, 1, 1,
-1.957071, 1.61601, -1.521751, 0, 0, 0, 1, 1,
-1.938355, 1.009927, -1.032481, 0, 0, 0, 1, 1,
-1.892976, -0.9315882, -2.989183, 0, 0, 0, 1, 1,
-1.886913, 0.5917496, -1.451482, 0, 0, 0, 1, 1,
-1.878241, 0.2560809, -0.6041536, 0, 0, 0, 1, 1,
-1.860188, 0.3980899, -0.206536, 1, 1, 1, 1, 1,
-1.850941, -1.907085, -2.218497, 1, 1, 1, 1, 1,
-1.847644, 1.189475, -1.234418, 1, 1, 1, 1, 1,
-1.822989, -0.5637482, -0.6188396, 1, 1, 1, 1, 1,
-1.816421, 1.075188, -0.5513543, 1, 1, 1, 1, 1,
-1.810009, -1.502307, -2.550174, 1, 1, 1, 1, 1,
-1.772724, -0.004368544, -0.9421679, 1, 1, 1, 1, 1,
-1.771595, -0.5634059, -2.069595, 1, 1, 1, 1, 1,
-1.76831, 0.4680165, -0.9773526, 1, 1, 1, 1, 1,
-1.755682, 0.4779271, -1.059805, 1, 1, 1, 1, 1,
-1.744747, -0.7918553, -2.299917, 1, 1, 1, 1, 1,
-1.7427, -0.667531, -3.323644, 1, 1, 1, 1, 1,
-1.730729, -1.544888, -2.55142, 1, 1, 1, 1, 1,
-1.715721, 1.599505, 0.3687571, 1, 1, 1, 1, 1,
-1.71423, 0.8930394, -1.10231, 1, 1, 1, 1, 1,
-1.695205, 1.19266, -0.07362796, 0, 0, 1, 1, 1,
-1.685203, -1.722144, -2.674182, 1, 0, 0, 1, 1,
-1.672123, -2.131989, -3.370257, 1, 0, 0, 1, 1,
-1.663291, -1.443188, -3.691344, 1, 0, 0, 1, 1,
-1.638526, -1.827786, -2.091899, 1, 0, 0, 1, 1,
-1.636636, 0.3295537, -2.302973, 1, 0, 0, 1, 1,
-1.636172, 2.004997, -1.871403, 0, 0, 0, 1, 1,
-1.597203, 0.6317022, -0.567799, 0, 0, 0, 1, 1,
-1.587937, -1.420232, 0.2276465, 0, 0, 0, 1, 1,
-1.574362, 0.1845319, -0.7344034, 0, 0, 0, 1, 1,
-1.534845, -1.161974, -1.399085, 0, 0, 0, 1, 1,
-1.527451, -1.570468, -3.214655, 0, 0, 0, 1, 1,
-1.526611, -0.3118679, -1.866627, 0, 0, 0, 1, 1,
-1.518364, -0.4660891, -2.460522, 1, 1, 1, 1, 1,
-1.509013, 1.248607, -0.5266698, 1, 1, 1, 1, 1,
-1.508196, -0.1817275, -1.034399, 1, 1, 1, 1, 1,
-1.496755, 0.5452692, -1.95879, 1, 1, 1, 1, 1,
-1.471675, -0.2853985, -2.430112, 1, 1, 1, 1, 1,
-1.464664, -0.0790004, -1.714205, 1, 1, 1, 1, 1,
-1.461604, 0.7856178, -1.788769, 1, 1, 1, 1, 1,
-1.458565, -0.05646593, -3.046702, 1, 1, 1, 1, 1,
-1.457896, -0.0146405, -1.285584, 1, 1, 1, 1, 1,
-1.450397, -1.455461, -0.5208042, 1, 1, 1, 1, 1,
-1.418979, 0.04626239, -2.100752, 1, 1, 1, 1, 1,
-1.41837, 0.5804089, 0.3711034, 1, 1, 1, 1, 1,
-1.41689, -0.590921, -0.3048894, 1, 1, 1, 1, 1,
-1.413833, -0.9685094, -2.063491, 1, 1, 1, 1, 1,
-1.408453, -0.9029543, -2.093003, 1, 1, 1, 1, 1,
-1.399266, 0.3414004, -0.321981, 0, 0, 1, 1, 1,
-1.38356, 0.5493885, 1.574836, 1, 0, 0, 1, 1,
-1.3729, -1.050435, -1.037911, 1, 0, 0, 1, 1,
-1.370923, -1.188911, -2.720188, 1, 0, 0, 1, 1,
-1.347309, 0.2151565, -0.6382047, 1, 0, 0, 1, 1,
-1.34333, -0.4293547, -0.55751, 1, 0, 0, 1, 1,
-1.340435, 0.69293, -0.6409853, 0, 0, 0, 1, 1,
-1.334285, -1.612445, -3.115769, 0, 0, 0, 1, 1,
-1.321321, -1.405131, -2.819018, 0, 0, 0, 1, 1,
-1.320062, 0.08307499, -2.021399, 0, 0, 0, 1, 1,
-1.311967, 0.5409108, 1.455949, 0, 0, 0, 1, 1,
-1.310722, 0.9491565, 0.1236136, 0, 0, 0, 1, 1,
-1.275302, 0.07230173, -0.9725299, 0, 0, 0, 1, 1,
-1.269205, 0.1917511, -0.6685888, 1, 1, 1, 1, 1,
-1.268789, 0.1862818, -2.263229, 1, 1, 1, 1, 1,
-1.268742, -0.2718737, -3.465172, 1, 1, 1, 1, 1,
-1.266208, 0.917399, -0.6860645, 1, 1, 1, 1, 1,
-1.260508, -0.2716546, -0.9476137, 1, 1, 1, 1, 1,
-1.247176, -0.3867539, -0.777828, 1, 1, 1, 1, 1,
-1.245115, 0.1354858, -1.625396, 1, 1, 1, 1, 1,
-1.24333, 0.4857035, -0.2210815, 1, 1, 1, 1, 1,
-1.241381, 0.2531359, -3.141121, 1, 1, 1, 1, 1,
-1.239409, 0.6933861, -0.05887925, 1, 1, 1, 1, 1,
-1.237827, 0.06917959, -0.6741459, 1, 1, 1, 1, 1,
-1.23529, -0.5421426, -2.750488, 1, 1, 1, 1, 1,
-1.23025, -0.3216176, 0.3369185, 1, 1, 1, 1, 1,
-1.224032, -0.4341237, -1.605076, 1, 1, 1, 1, 1,
-1.216869, -1.9472, -1.119819, 1, 1, 1, 1, 1,
-1.212876, -1.063195, 0.2499384, 0, 0, 1, 1, 1,
-1.208591, -0.1245127, 0.629155, 1, 0, 0, 1, 1,
-1.206619, 0.3442135, -1.905409, 1, 0, 0, 1, 1,
-1.19866, -0.5658532, -2.833938, 1, 0, 0, 1, 1,
-1.198627, -0.9885895, -2.755718, 1, 0, 0, 1, 1,
-1.184126, -0.3493141, -1.560433, 1, 0, 0, 1, 1,
-1.178764, -0.3962209, -3.13624, 0, 0, 0, 1, 1,
-1.174479, 0.6585946, -1.115454, 0, 0, 0, 1, 1,
-1.174105, -0.4317647, -3.306017, 0, 0, 0, 1, 1,
-1.173301, 0.05466013, -1.534804, 0, 0, 0, 1, 1,
-1.170283, 0.7936492, -0.2711095, 0, 0, 0, 1, 1,
-1.168707, -1.177036, -2.474845, 0, 0, 0, 1, 1,
-1.147369, -0.06359242, -2.167757, 0, 0, 0, 1, 1,
-1.142392, -1.081301, -1.50608, 1, 1, 1, 1, 1,
-1.125607, 0.07807065, 0.9524682, 1, 1, 1, 1, 1,
-1.110855, -0.4080461, -0.7488699, 1, 1, 1, 1, 1,
-1.110559, 0.02919361, -1.282655, 1, 1, 1, 1, 1,
-1.11044, 1.102236, -0.7138476, 1, 1, 1, 1, 1,
-1.106251, 0.0194963, -1.822004, 1, 1, 1, 1, 1,
-1.106008, 0.7356427, -1.941566, 1, 1, 1, 1, 1,
-1.101962, -0.4183771, -0.5254361, 1, 1, 1, 1, 1,
-1.096074, -0.7543613, -2.481102, 1, 1, 1, 1, 1,
-1.083717, 1.501594, 0.4417102, 1, 1, 1, 1, 1,
-1.078811, 1.171862, -0.7546711, 1, 1, 1, 1, 1,
-1.078308, -1.97865, -2.555244, 1, 1, 1, 1, 1,
-1.074723, -0.7473472, -2.277711, 1, 1, 1, 1, 1,
-1.068374, -0.07588844, -3.731024, 1, 1, 1, 1, 1,
-1.065554, 1.015579, 0.3260952, 1, 1, 1, 1, 1,
-1.064625, -1.968704, -3.270681, 0, 0, 1, 1, 1,
-1.060871, 0.1082792, -3.047709, 1, 0, 0, 1, 1,
-1.057487, -1.094937, -1.627903, 1, 0, 0, 1, 1,
-1.049883, -0.9463201, -2.651992, 1, 0, 0, 1, 1,
-1.04017, -1.306573, -2.782532, 1, 0, 0, 1, 1,
-1.03704, 2.020084, -2.170792, 1, 0, 0, 1, 1,
-1.034686, -0.388322, -2.587941, 0, 0, 0, 1, 1,
-1.031032, 0.9593544, -0.7908065, 0, 0, 0, 1, 1,
-1.028179, -1.593467, -3.001654, 0, 0, 0, 1, 1,
-1.027843, -0.5354048, -0.8708108, 0, 0, 0, 1, 1,
-1.025559, 0.4918751, -2.037068, 0, 0, 0, 1, 1,
-1.019923, -1.857126, -3.513245, 0, 0, 0, 1, 1,
-1.01393, -1.160037, -3.64485, 0, 0, 0, 1, 1,
-1.012416, -0.06870071, -1.33328, 1, 1, 1, 1, 1,
-1.011333, 0.8424724, -1.293795, 1, 1, 1, 1, 1,
-1.007089, -0.1001097, -0.9517294, 1, 1, 1, 1, 1,
-1.003146, 0.5128602, -1.025281, 1, 1, 1, 1, 1,
-0.9906178, 1.659488, 1.664366, 1, 1, 1, 1, 1,
-0.9866794, 0.4313984, -1.388811, 1, 1, 1, 1, 1,
-0.9842994, -0.5335861, -2.416129, 1, 1, 1, 1, 1,
-0.9840606, 0.5607549, -3.101104, 1, 1, 1, 1, 1,
-0.9739671, -0.1447616, -4.086658, 1, 1, 1, 1, 1,
-0.9682159, -0.7724128, -1.921327, 1, 1, 1, 1, 1,
-0.9674471, 1.299927, -0.001731255, 1, 1, 1, 1, 1,
-0.9672651, -0.8263884, -2.181623, 1, 1, 1, 1, 1,
-0.9662386, -1.026709, -2.002358, 1, 1, 1, 1, 1,
-0.960381, -0.8873125, -3.636633, 1, 1, 1, 1, 1,
-0.9584908, 0.6535404, -3.854318, 1, 1, 1, 1, 1,
-0.9541638, 0.2133263, -2.459064, 0, 0, 1, 1, 1,
-0.9533947, -0.2799446, -1.103323, 1, 0, 0, 1, 1,
-0.9470335, 0.9570342, -0.6645908, 1, 0, 0, 1, 1,
-0.946297, 0.1461321, -1.349057, 1, 0, 0, 1, 1,
-0.9454407, 0.7038866, 0.7715048, 1, 0, 0, 1, 1,
-0.9423854, -1.095068, -2.747174, 1, 0, 0, 1, 1,
-0.934025, 0.3653219, -1.624112, 0, 0, 0, 1, 1,
-0.9279149, 0.6397225, -0.9454613, 0, 0, 0, 1, 1,
-0.9247509, -0.3137752, -1.985788, 0, 0, 0, 1, 1,
-0.9240273, 0.9255937, -1.289739, 0, 0, 0, 1, 1,
-0.9240265, 0.9674703, -1.088345, 0, 0, 0, 1, 1,
-0.9227, -0.7561964, -2.81832, 0, 0, 0, 1, 1,
-0.9209152, 0.9636347, -0.5008831, 0, 0, 0, 1, 1,
-0.920775, 1.352965, -1.126735, 1, 1, 1, 1, 1,
-0.9173058, 1.071561, -0.7226511, 1, 1, 1, 1, 1,
-0.9092022, 0.7538186, -0.704576, 1, 1, 1, 1, 1,
-0.906514, -0.2947822, -3.941444, 1, 1, 1, 1, 1,
-0.9058809, 0.3419428, -0.5174814, 1, 1, 1, 1, 1,
-0.9016376, 1.915729, 0.7517988, 1, 1, 1, 1, 1,
-0.8988346, 0.03716743, -1.166595, 1, 1, 1, 1, 1,
-0.8975905, 0.2329743, -0.2663122, 1, 1, 1, 1, 1,
-0.8924803, 0.7025331, -0.5093881, 1, 1, 1, 1, 1,
-0.8882523, 1.154297, -0.3061875, 1, 1, 1, 1, 1,
-0.8790491, -0.3722303, -2.042239, 1, 1, 1, 1, 1,
-0.8766671, 2.021618, -0.3972378, 1, 1, 1, 1, 1,
-0.8699399, -0.3372493, -1.690103, 1, 1, 1, 1, 1,
-0.8686521, 0.5976325, 0.8372782, 1, 1, 1, 1, 1,
-0.8671803, -0.8249126, -1.946378, 1, 1, 1, 1, 1,
-0.8585262, -0.6008133, -3.497586, 0, 0, 1, 1, 1,
-0.8577413, 1.67716, 0.7685692, 1, 0, 0, 1, 1,
-0.8517586, 0.8813242, -2.118558, 1, 0, 0, 1, 1,
-0.8515344, 1.572749, -1.500037, 1, 0, 0, 1, 1,
-0.8461607, 0.02386833, -1.647981, 1, 0, 0, 1, 1,
-0.8448281, 1.863637, -2.269543, 1, 0, 0, 1, 1,
-0.8393019, -0.6079915, -2.035747, 0, 0, 0, 1, 1,
-0.8342937, -0.005763035, -1.349828, 0, 0, 0, 1, 1,
-0.8309363, 0.319876, -0.7522427, 0, 0, 0, 1, 1,
-0.8300908, 0.4311189, -1.40604, 0, 0, 0, 1, 1,
-0.8286099, 0.6364412, -0.2507291, 0, 0, 0, 1, 1,
-0.8265629, -0.01103149, -2.460595, 0, 0, 0, 1, 1,
-0.8208634, 0.8220391, 0.003529583, 0, 0, 0, 1, 1,
-0.8183637, 0.6958233, 0.5889476, 1, 1, 1, 1, 1,
-0.8156407, -1.474736, -1.992473, 1, 1, 1, 1, 1,
-0.8134139, 1.179356, -1.042245, 1, 1, 1, 1, 1,
-0.8130623, 0.494709, -1.972359, 1, 1, 1, 1, 1,
-0.8119039, 1.353576, -1.812728, 1, 1, 1, 1, 1,
-0.8089254, 0.1723742, -1.980475, 1, 1, 1, 1, 1,
-0.8057569, -1.283429, -3.836023, 1, 1, 1, 1, 1,
-0.8039625, 1.553813, -0.06659769, 1, 1, 1, 1, 1,
-0.8017585, 0.004889822, -0.8297625, 1, 1, 1, 1, 1,
-0.7995542, -0.2899664, -2.839153, 1, 1, 1, 1, 1,
-0.7964116, -0.241628, -1.983595, 1, 1, 1, 1, 1,
-0.7919973, -0.561857, -1.359806, 1, 1, 1, 1, 1,
-0.7893338, 1.469735, -1.626871, 1, 1, 1, 1, 1,
-0.7850336, -0.04856405, -2.170895, 1, 1, 1, 1, 1,
-0.7798066, 0.7162813, -1.747316, 1, 1, 1, 1, 1,
-0.7738076, 0.7268087, 1.744692, 0, 0, 1, 1, 1,
-0.7662752, -1.270401, -1.696355, 1, 0, 0, 1, 1,
-0.7649177, 0.4869654, -0.1632814, 1, 0, 0, 1, 1,
-0.7631444, 1.609635, -1.176504, 1, 0, 0, 1, 1,
-0.7497016, -0.1912535, -2.071748, 1, 0, 0, 1, 1,
-0.7419825, -0.9293814, -2.409277, 1, 0, 0, 1, 1,
-0.7412295, -0.4474455, -1.724804, 0, 0, 0, 1, 1,
-0.7409003, 0.4661447, -0.4759292, 0, 0, 0, 1, 1,
-0.7408437, -0.3096912, -2.046039, 0, 0, 0, 1, 1,
-0.7383052, 0.7087598, -1.13413, 0, 0, 0, 1, 1,
-0.7376271, 0.9816047, 1.02219, 0, 0, 0, 1, 1,
-0.7367892, 1.627583, 0.592639, 0, 0, 0, 1, 1,
-0.7361076, -0.224975, -1.212441, 0, 0, 0, 1, 1,
-0.7351506, 0.2575157, -0.1178667, 1, 1, 1, 1, 1,
-0.7343482, 2.470805, -0.2456502, 1, 1, 1, 1, 1,
-0.7315262, 0.8345764, -0.04919937, 1, 1, 1, 1, 1,
-0.7289249, -0.2830966, -4.022375, 1, 1, 1, 1, 1,
-0.7288813, 0.8773518, -0.218262, 1, 1, 1, 1, 1,
-0.7273514, 0.6925115, -1.02737, 1, 1, 1, 1, 1,
-0.7238477, 0.7297316, -1.483982, 1, 1, 1, 1, 1,
-0.7133356, -0.06365266, -1.834571, 1, 1, 1, 1, 1,
-0.7114543, 0.3355839, -3.060324, 1, 1, 1, 1, 1,
-0.7112615, -0.1474496, -1.228517, 1, 1, 1, 1, 1,
-0.7047732, 1.176569, -0.4138654, 1, 1, 1, 1, 1,
-0.7000091, 0.5815517, 0.04963312, 1, 1, 1, 1, 1,
-0.6997482, 0.6461791, 1.250322, 1, 1, 1, 1, 1,
-0.6965925, 1.021869, 0.685358, 1, 1, 1, 1, 1,
-0.6944678, 0.6796064, 1.226239, 1, 1, 1, 1, 1,
-0.6899463, 0.04650211, -2.316106, 0, 0, 1, 1, 1,
-0.6787151, -1.149138, -3.764709, 1, 0, 0, 1, 1,
-0.672105, -0.8397563, -3.734192, 1, 0, 0, 1, 1,
-0.6696765, -0.8039655, -1.872451, 1, 0, 0, 1, 1,
-0.6623079, 0.3474865, -1.651652, 1, 0, 0, 1, 1,
-0.6619383, -0.07861526, -2.148391, 1, 0, 0, 1, 1,
-0.6588859, 1.509529, 0.1567629, 0, 0, 0, 1, 1,
-0.6549937, -0.6687638, -2.914194, 0, 0, 0, 1, 1,
-0.6478258, -1.759861, -3.512757, 0, 0, 0, 1, 1,
-0.641588, 3.259362, 1.848893, 0, 0, 0, 1, 1,
-0.6412137, -1.197585, -3.220002, 0, 0, 0, 1, 1,
-0.633881, 0.8447649, -1.231282, 0, 0, 0, 1, 1,
-0.6326763, 1.729149, -1.645926, 0, 0, 0, 1, 1,
-0.6249717, -0.5693275, -0.05505797, 1, 1, 1, 1, 1,
-0.6234761, -0.3702649, -2.852992, 1, 1, 1, 1, 1,
-0.6223038, 1.288274, -1.30779, 1, 1, 1, 1, 1,
-0.6151783, 0.1347131, -1.791896, 1, 1, 1, 1, 1,
-0.614863, -0.9435872, -1.066854, 1, 1, 1, 1, 1,
-0.6140494, -0.2396741, -2.475788, 1, 1, 1, 1, 1,
-0.6075193, -1.690518, -3.392215, 1, 1, 1, 1, 1,
-0.6028566, 0.687911, -0.1816916, 1, 1, 1, 1, 1,
-0.6004921, 0.513679, -2.435845, 1, 1, 1, 1, 1,
-0.5989339, 0.401263, -1.449111, 1, 1, 1, 1, 1,
-0.5948043, -0.2167532, -0.4065517, 1, 1, 1, 1, 1,
-0.5936868, 0.6061622, -1.582329, 1, 1, 1, 1, 1,
-0.5881392, -1.045633, -2.794469, 1, 1, 1, 1, 1,
-0.5880463, 1.674766, -1.704474, 1, 1, 1, 1, 1,
-0.5868109, -1.307791, -2.540619, 1, 1, 1, 1, 1,
-0.5840236, -0.7852755, -1.307852, 0, 0, 1, 1, 1,
-0.5823324, -0.09808572, -2.122916, 1, 0, 0, 1, 1,
-0.5744547, -0.1172374, -0.8960382, 1, 0, 0, 1, 1,
-0.564006, 0.9418206, -0.1813133, 1, 0, 0, 1, 1,
-0.562283, -0.7096534, -1.728213, 1, 0, 0, 1, 1,
-0.5588372, 0.8764199, 1.511461, 1, 0, 0, 1, 1,
-0.5568839, 0.6753824, -0.9818484, 0, 0, 0, 1, 1,
-0.5558994, 0.07917041, -0.5931283, 0, 0, 0, 1, 1,
-0.5554634, -1.042978, -3.090674, 0, 0, 0, 1, 1,
-0.5532893, -0.6775652, -3.635228, 0, 0, 0, 1, 1,
-0.5527455, -1.018838, -2.586323, 0, 0, 0, 1, 1,
-0.550705, 1.168115, -0.5121366, 0, 0, 0, 1, 1,
-0.5500266, 1.639532, -0.9681062, 0, 0, 0, 1, 1,
-0.5497345, -1.989221, -1.895674, 1, 1, 1, 1, 1,
-0.5468559, 0.03454715, -1.083984, 1, 1, 1, 1, 1,
-0.5421636, -1.546763, -2.59079, 1, 1, 1, 1, 1,
-0.5385352, 0.9035414, -1.063416, 1, 1, 1, 1, 1,
-0.5351634, -1.895509, -2.119995, 1, 1, 1, 1, 1,
-0.534305, 0.03286702, -1.024186, 1, 1, 1, 1, 1,
-0.5311512, -2.101614, -2.625502, 1, 1, 1, 1, 1,
-0.5294705, 0.7611365, 0.513523, 1, 1, 1, 1, 1,
-0.5270488, 1.259673, -0.2983854, 1, 1, 1, 1, 1,
-0.5221395, 1.433228, -0.4611851, 1, 1, 1, 1, 1,
-0.5214484, -0.8104018, -2.089743, 1, 1, 1, 1, 1,
-0.5198324, -0.0171547, -1.316931, 1, 1, 1, 1, 1,
-0.5140617, -0.239871, -3.011893, 1, 1, 1, 1, 1,
-0.5122629, 0.05319966, -2.375525, 1, 1, 1, 1, 1,
-0.5121888, -1.310287, -3.814926, 1, 1, 1, 1, 1,
-0.507473, 0.03971342, -1.392497, 0, 0, 1, 1, 1,
-0.505846, -0.9284925, 0.1512787, 1, 0, 0, 1, 1,
-0.5001757, 2.029237, 1.325003, 1, 0, 0, 1, 1,
-0.4974105, 0.8829922, -0.09822983, 1, 0, 0, 1, 1,
-0.4964772, -1.078097, -2.349978, 1, 0, 0, 1, 1,
-0.4931895, 0.9647307, -1.194067, 1, 0, 0, 1, 1,
-0.488672, -1.498291, -3.002421, 0, 0, 0, 1, 1,
-0.4847158, 1.916666, 0.4283708, 0, 0, 0, 1, 1,
-0.480112, 1.625464, -1.080342, 0, 0, 0, 1, 1,
-0.4775167, 0.8024707, -0.4806226, 0, 0, 0, 1, 1,
-0.4746285, 0.2266497, -1.384047, 0, 0, 0, 1, 1,
-0.4697081, -1.300163, -4.155085, 0, 0, 0, 1, 1,
-0.4689221, -0.7031658, -1.897009, 0, 0, 0, 1, 1,
-0.4664995, -0.9495656, -0.06168124, 1, 1, 1, 1, 1,
-0.4623228, -0.4153658, -2.328364, 1, 1, 1, 1, 1,
-0.46092, 0.8138545, 1.843605, 1, 1, 1, 1, 1,
-0.4513507, -0.8819007, -4.374787, 1, 1, 1, 1, 1,
-0.4486135, 0.9308923, -0.06556816, 1, 1, 1, 1, 1,
-0.4452648, 1.020327, -0.5569865, 1, 1, 1, 1, 1,
-0.4445295, 0.4709175, -1.412245, 1, 1, 1, 1, 1,
-0.4409453, 0.9994463, -1.377641, 1, 1, 1, 1, 1,
-0.440085, 2.169892, -0.8668393, 1, 1, 1, 1, 1,
-0.4395844, -0.133977, -2.780056, 1, 1, 1, 1, 1,
-0.4392874, 0.8374258, -1.10546, 1, 1, 1, 1, 1,
-0.43913, -0.4324613, -0.1690023, 1, 1, 1, 1, 1,
-0.438934, 0.1283074, -2.276407, 1, 1, 1, 1, 1,
-0.4367784, -0.3262143, -2.718072, 1, 1, 1, 1, 1,
-0.4366529, -1.287848, -1.992755, 1, 1, 1, 1, 1,
-0.4337117, 0.3906622, -2.136468, 0, 0, 1, 1, 1,
-0.4278955, 0.7883134, -0.1988479, 1, 0, 0, 1, 1,
-0.4259028, 2.011163, -0.5177607, 1, 0, 0, 1, 1,
-0.425196, -0.2272527, -1.141304, 1, 0, 0, 1, 1,
-0.4248905, -0.5443884, -1.368795, 1, 0, 0, 1, 1,
-0.4245693, 0.5817838, -0.3422888, 1, 0, 0, 1, 1,
-0.4244854, -0.9096249, -0.7372512, 0, 0, 0, 1, 1,
-0.4143111, -0.09636869, -1.064819, 0, 0, 0, 1, 1,
-0.4105767, -1.188699, -2.21049, 0, 0, 0, 1, 1,
-0.4094644, -1.059255, -4.422711, 0, 0, 0, 1, 1,
-0.4069239, -1.783008, -2.161253, 0, 0, 0, 1, 1,
-0.4011271, -1.420452, -3.877905, 0, 0, 0, 1, 1,
-0.4000473, 0.3129178, -1.950564, 0, 0, 0, 1, 1,
-0.398737, 0.691544, -0.5247064, 1, 1, 1, 1, 1,
-0.3977143, 1.903539, -0.2710429, 1, 1, 1, 1, 1,
-0.392973, -0.8566009, -2.988129, 1, 1, 1, 1, 1,
-0.3849995, 0.3602559, -1.578433, 1, 1, 1, 1, 1,
-0.3837632, 0.08177962, -3.188163, 1, 1, 1, 1, 1,
-0.382313, 0.5608502, -1.842216, 1, 1, 1, 1, 1,
-0.3820319, -0.4737003, -0.5509539, 1, 1, 1, 1, 1,
-0.3818668, -0.8871794, -3.624301, 1, 1, 1, 1, 1,
-0.3778523, -2.25878, -2.321194, 1, 1, 1, 1, 1,
-0.3763371, -0.09947394, -1.394326, 1, 1, 1, 1, 1,
-0.3715484, -0.2466817, -2.535718, 1, 1, 1, 1, 1,
-0.3678147, -1.084258, -1.797749, 1, 1, 1, 1, 1,
-0.3669944, -1.385991, -3.567627, 1, 1, 1, 1, 1,
-0.3649182, 1.572591, -1.313377, 1, 1, 1, 1, 1,
-0.3643707, -0.3461831, -1.789173, 1, 1, 1, 1, 1,
-0.3579457, 0.9305416, -0.1926444, 0, 0, 1, 1, 1,
-0.3550654, -0.6019238, -3.343667, 1, 0, 0, 1, 1,
-0.3532015, 0.5490889, -0.3596798, 1, 0, 0, 1, 1,
-0.3519776, 0.01358742, -1.952107, 1, 0, 0, 1, 1,
-0.3474286, 1.789289, 0.1435583, 1, 0, 0, 1, 1,
-0.3443274, 0.2998414, -0.8569368, 1, 0, 0, 1, 1,
-0.3429681, 0.1396124, -0.9373067, 0, 0, 0, 1, 1,
-0.3404826, 0.2250931, -0.1525826, 0, 0, 0, 1, 1,
-0.3365938, 1.331482, 0.5107135, 0, 0, 0, 1, 1,
-0.3363327, -0.5126233, -3.099869, 0, 0, 0, 1, 1,
-0.3354487, -1.568974, -1.604408, 0, 0, 0, 1, 1,
-0.3253543, 0.1250385, -1.611244, 0, 0, 0, 1, 1,
-0.3232374, 0.7451383, 0.7676867, 0, 0, 0, 1, 1,
-0.3197957, 0.02985792, -1.251632, 1, 1, 1, 1, 1,
-0.3196472, -0.1591742, -1.503685, 1, 1, 1, 1, 1,
-0.3191861, -0.02299691, -1.401132, 1, 1, 1, 1, 1,
-0.3187246, -0.1198083, -1.145156, 1, 1, 1, 1, 1,
-0.3186067, -2.023406, -4.560626, 1, 1, 1, 1, 1,
-0.3139078, 0.09792712, 1.227748, 1, 1, 1, 1, 1,
-0.3136291, 1.41054, -0.5661476, 1, 1, 1, 1, 1,
-0.3064795, 0.59096, -1.272883, 1, 1, 1, 1, 1,
-0.3049629, 1.012759, 0.6337472, 1, 1, 1, 1, 1,
-0.3035013, -1.895913, -3.984249, 1, 1, 1, 1, 1,
-0.3008763, 0.3956583, -0.3313647, 1, 1, 1, 1, 1,
-0.2980888, 1.547416, -0.7058293, 1, 1, 1, 1, 1,
-0.2977251, -0.251133, -2.547163, 1, 1, 1, 1, 1,
-0.2973482, -0.7676311, -2.089334, 1, 1, 1, 1, 1,
-0.2970127, -0.2160344, -2.248019, 1, 1, 1, 1, 1,
-0.2957161, 0.1032923, -0.2668853, 0, 0, 1, 1, 1,
-0.2956196, 0.6842372, -0.9112061, 1, 0, 0, 1, 1,
-0.2944414, 2.047516, -0.1362645, 1, 0, 0, 1, 1,
-0.29435, 0.2916386, -0.9254763, 1, 0, 0, 1, 1,
-0.2889504, -0.08825345, -0.8889807, 1, 0, 0, 1, 1,
-0.2888402, -0.9266053, -3.741517, 1, 0, 0, 1, 1,
-0.2884539, 0.1039504, -2.15984, 0, 0, 0, 1, 1,
-0.2879293, 0.9900845, -1.204062, 0, 0, 0, 1, 1,
-0.2862026, 0.6524797, -2.441796, 0, 0, 0, 1, 1,
-0.2847715, -1.166906, -4.304171, 0, 0, 0, 1, 1,
-0.2803751, 0.1732231, -2.031139, 0, 0, 0, 1, 1,
-0.2803363, 1.18179, -0.9109433, 0, 0, 0, 1, 1,
-0.2792413, -2.145068, -1.707724, 0, 0, 0, 1, 1,
-0.2772003, 0.9200565, 0.05152741, 1, 1, 1, 1, 1,
-0.2765673, 0.5241671, -0.1735849, 1, 1, 1, 1, 1,
-0.2758428, 1.535811, 0.3014057, 1, 1, 1, 1, 1,
-0.2701614, 2.042758, -0.5432725, 1, 1, 1, 1, 1,
-0.2630912, 0.5500205, 1.589492, 1, 1, 1, 1, 1,
-0.2611637, -2.211442, -3.559263, 1, 1, 1, 1, 1,
-0.2606277, -1.969835, -3.288683, 1, 1, 1, 1, 1,
-0.2600078, -1.517292, -3.547706, 1, 1, 1, 1, 1,
-0.2531218, 1.935851, -0.990148, 1, 1, 1, 1, 1,
-0.2481187, -0.8621602, -3.288554, 1, 1, 1, 1, 1,
-0.2460396, 0.2176934, -3.048299, 1, 1, 1, 1, 1,
-0.2397365, 0.7425002, -1.237221, 1, 1, 1, 1, 1,
-0.2384932, -0.766422, -3.43912, 1, 1, 1, 1, 1,
-0.234456, 1.520817, 0.9492832, 1, 1, 1, 1, 1,
-0.2330743, -0.4817381, -2.493531, 1, 1, 1, 1, 1,
-0.2283649, -0.1781377, -2.492247, 0, 0, 1, 1, 1,
-0.2214721, -1.179388, -3.160867, 1, 0, 0, 1, 1,
-0.2186678, -0.3754732, -2.855737, 1, 0, 0, 1, 1,
-0.2141934, 0.1196889, -1.33742, 1, 0, 0, 1, 1,
-0.2136053, 0.4764317, 0.7888543, 1, 0, 0, 1, 1,
-0.1954912, 0.2716013, 0.2347374, 1, 0, 0, 1, 1,
-0.1951166, -1.475345, -3.520922, 0, 0, 0, 1, 1,
-0.1935494, -0.4531029, -1.398109, 0, 0, 0, 1, 1,
-0.1922625, -0.3459594, -3.196408, 0, 0, 0, 1, 1,
-0.1916195, 0.3858847, 0.8653714, 0, 0, 0, 1, 1,
-0.1889046, -1.138293, -5.021176, 0, 0, 0, 1, 1,
-0.1795695, -1.166388, -1.600517, 0, 0, 0, 1, 1,
-0.179235, 0.5579442, 1.138992, 0, 0, 0, 1, 1,
-0.1776644, 0.08752301, -1.702598, 1, 1, 1, 1, 1,
-0.1775174, -0.6974615, -5.084867, 1, 1, 1, 1, 1,
-0.1770072, -0.03746731, -1.996498, 1, 1, 1, 1, 1,
-0.1745819, 0.5458204, 0.1880306, 1, 1, 1, 1, 1,
-0.1714689, 0.3567349, -0.8643285, 1, 1, 1, 1, 1,
-0.1711846, -0.3375641, -1.541816, 1, 1, 1, 1, 1,
-0.1704188, -0.2867829, -1.508929, 1, 1, 1, 1, 1,
-0.1688344, 1.02731, 0.5490078, 1, 1, 1, 1, 1,
-0.1677061, 0.1510883, 0.08113996, 1, 1, 1, 1, 1,
-0.1646283, 2.007932, -1.495338, 1, 1, 1, 1, 1,
-0.1583886, -1.717592, -3.918406, 1, 1, 1, 1, 1,
-0.1560706, -0.1912607, -4.97466, 1, 1, 1, 1, 1,
-0.1557316, 0.6585882, -1.67009, 1, 1, 1, 1, 1,
-0.1549052, -0.3287954, -2.082088, 1, 1, 1, 1, 1,
-0.151384, -1.491075, -2.993325, 1, 1, 1, 1, 1,
-0.1512152, 0.6473432, -1.98233, 0, 0, 1, 1, 1,
-0.1507925, 0.5082499, 0.4777693, 1, 0, 0, 1, 1,
-0.1487769, -0.1053166, -2.436659, 1, 0, 0, 1, 1,
-0.1412758, 0.9178156, -0.3654531, 1, 0, 0, 1, 1,
-0.1409022, 1.038197, -1.780712, 1, 0, 0, 1, 1,
-0.1406298, -0.7926719, -3.137891, 1, 0, 0, 1, 1,
-0.1313656, -1.720721, -4.582837, 0, 0, 0, 1, 1,
-0.1225277, 0.2805997, 0.5475164, 0, 0, 0, 1, 1,
-0.1187168, 0.8613894, -1.689978, 0, 0, 0, 1, 1,
-0.1126201, 0.1010645, -1.80424, 0, 0, 0, 1, 1,
-0.1124422, 0.4948703, 1.193192, 0, 0, 0, 1, 1,
-0.1060497, 0.5739064, 1.135994, 0, 0, 0, 1, 1,
-0.1028661, -0.7757043, -2.83555, 0, 0, 0, 1, 1,
-0.09970765, 0.6502424, 0.434362, 1, 1, 1, 1, 1,
-0.09941442, 0.6416404, -1.417966, 1, 1, 1, 1, 1,
-0.09457578, -1.287227, -3.016405, 1, 1, 1, 1, 1,
-0.09358516, 0.9230871, -0.5213652, 1, 1, 1, 1, 1,
-0.09344881, -0.62181, -3.585297, 1, 1, 1, 1, 1,
-0.09235191, 0.03294055, 0.1259233, 1, 1, 1, 1, 1,
-0.08957537, -0.9617453, -2.383605, 1, 1, 1, 1, 1,
-0.08498946, 1.039116, -0.5208203, 1, 1, 1, 1, 1,
-0.08470719, 0.4344693, -1.607378, 1, 1, 1, 1, 1,
-0.07999223, 2.359769, 0.9143088, 1, 1, 1, 1, 1,
-0.07942342, 1.011494, -0.8834106, 1, 1, 1, 1, 1,
-0.07628414, 0.5147101, -1.105646, 1, 1, 1, 1, 1,
-0.07482256, 2.538335, -0.9811534, 1, 1, 1, 1, 1,
-0.07295772, -0.8777174, -3.907071, 1, 1, 1, 1, 1,
-0.0662481, 1.70442, -0.4797645, 1, 1, 1, 1, 1,
-0.06516366, -0.001819563, -1.702616, 0, 0, 1, 1, 1,
-0.06360066, 0.06242817, -1.788995, 1, 0, 0, 1, 1,
-0.06072939, -0.3628473, -3.15737, 1, 0, 0, 1, 1,
-0.05411905, 0.990724, -0.5537703, 1, 0, 0, 1, 1,
-0.05327889, -1.266696, -4.131659, 1, 0, 0, 1, 1,
-0.05087698, 2.494144, 0.3341803, 1, 0, 0, 1, 1,
-0.04766291, -0.4066958, -3.41168, 0, 0, 0, 1, 1,
-0.04180054, -0.1470001, -2.30476, 0, 0, 0, 1, 1,
-0.03989786, 0.5679669, -0.9941857, 0, 0, 0, 1, 1,
-0.0398378, -1.004032, -3.653037, 0, 0, 0, 1, 1,
-0.03948122, -0.9003856, -1.766948, 0, 0, 0, 1, 1,
-0.03828927, -3.33862, -3.099659, 0, 0, 0, 1, 1,
-0.03751231, -0.8741938, -2.811622, 0, 0, 0, 1, 1,
-0.03723995, -0.8915737, -4.243899, 1, 1, 1, 1, 1,
-0.03135473, -0.3826516, -2.912501, 1, 1, 1, 1, 1,
-0.02996748, 0.2647313, -1.374419, 1, 1, 1, 1, 1,
-0.0295673, -0.02769632, -3.087791, 1, 1, 1, 1, 1,
-0.02425425, -0.2011071, -4.667093, 1, 1, 1, 1, 1,
-0.01578472, -0.7997492, -3.703052, 1, 1, 1, 1, 1,
-0.009089031, 0.6043471, 0.2627277, 1, 1, 1, 1, 1,
-0.005010978, 0.4824476, -1.293877, 1, 1, 1, 1, 1,
-0.0008494232, 1.028161, 0.0922067, 1, 1, 1, 1, 1,
0.0007237971, 0.3156397, -0.480173, 1, 1, 1, 1, 1,
0.002566732, -0.7567068, 2.986534, 1, 1, 1, 1, 1,
0.004075573, -0.3429323, 2.877583, 1, 1, 1, 1, 1,
0.008426043, -0.188272, 2.221803, 1, 1, 1, 1, 1,
0.009262748, -0.6151373, 3.031293, 1, 1, 1, 1, 1,
0.01087504, -0.6725473, 2.979244, 1, 1, 1, 1, 1,
0.01324608, 0.2311502, 2.184976, 0, 0, 1, 1, 1,
0.01488986, 0.2917609, -0.595925, 1, 0, 0, 1, 1,
0.01900762, 0.3197964, 2.150309, 1, 0, 0, 1, 1,
0.02166566, 0.08594348, -0.1895379, 1, 0, 0, 1, 1,
0.02815294, 1.779713, -1.498922, 1, 0, 0, 1, 1,
0.02861507, -0.7118577, 2.799812, 1, 0, 0, 1, 1,
0.03021724, 0.7701833, -0.03643039, 0, 0, 0, 1, 1,
0.03129125, -0.604585, 2.546837, 0, 0, 0, 1, 1,
0.03371773, 0.7183608, 0.1944922, 0, 0, 0, 1, 1,
0.03422766, 1.04744, -0.4984848, 0, 0, 0, 1, 1,
0.03555067, 0.2997571, -0.379532, 0, 0, 0, 1, 1,
0.03655755, -0.3603649, 3.513727, 0, 0, 0, 1, 1,
0.03900002, 0.1957668, 1.953395, 0, 0, 0, 1, 1,
0.0394011, 0.5386438, 1.397364, 1, 1, 1, 1, 1,
0.04629657, 2.137998, 0.7906011, 1, 1, 1, 1, 1,
0.05400723, 1.031741, 0.7613047, 1, 1, 1, 1, 1,
0.05954826, 1.188431, -1.164166, 1, 1, 1, 1, 1,
0.06113234, 0.3131461, 2.881373, 1, 1, 1, 1, 1,
0.06384351, -0.07874222, 1.91274, 1, 1, 1, 1, 1,
0.06485045, -0.5039091, 4.3275, 1, 1, 1, 1, 1,
0.06559274, 0.6408924, 0.6476803, 1, 1, 1, 1, 1,
0.0704575, 1.508675, 0.06366554, 1, 1, 1, 1, 1,
0.07935933, 0.8620263, 1.883709, 1, 1, 1, 1, 1,
0.07953366, -0.5648591, 4.368839, 1, 1, 1, 1, 1,
0.07996575, -0.2235403, 2.529154, 1, 1, 1, 1, 1,
0.08955333, 0.09152357, 0.4368643, 1, 1, 1, 1, 1,
0.09801973, -0.8032172, 1.869132, 1, 1, 1, 1, 1,
0.09894615, -0.1234661, 0.393922, 1, 1, 1, 1, 1,
0.09977275, -0.5095515, 4.487804, 0, 0, 1, 1, 1,
0.1013967, 0.9733624, -0.8097732, 1, 0, 0, 1, 1,
0.1056882, 0.3282247, -0.08067779, 1, 0, 0, 1, 1,
0.1057556, -0.2409724, 1.341077, 1, 0, 0, 1, 1,
0.1058362, -2.041833, 2.694447, 1, 0, 0, 1, 1,
0.1097034, 2.273841, 0.7267279, 1, 0, 0, 1, 1,
0.1222665, 1.014615, 0.3605413, 0, 0, 0, 1, 1,
0.1263122, 1.627509, -0.4029047, 0, 0, 0, 1, 1,
0.1272383, -1.109771, 2.502002, 0, 0, 0, 1, 1,
0.1314636, -0.03161694, 1.77912, 0, 0, 0, 1, 1,
0.132133, -0.8352104, 3.304076, 0, 0, 0, 1, 1,
0.1332154, -0.2491603, 2.412749, 0, 0, 0, 1, 1,
0.1342753, 0.7131441, -1.585164, 0, 0, 0, 1, 1,
0.13744, -0.06579654, 3.293669, 1, 1, 1, 1, 1,
0.1389941, 0.6029862, -0.7794837, 1, 1, 1, 1, 1,
0.1393556, 0.7128381, 1.874583, 1, 1, 1, 1, 1,
0.1424079, -0.1323963, 2.737776, 1, 1, 1, 1, 1,
0.1463501, 1.083079, 0.2906888, 1, 1, 1, 1, 1,
0.1474538, 0.7836509, 1.387164, 1, 1, 1, 1, 1,
0.1478657, -0.288819, 2.396325, 1, 1, 1, 1, 1,
0.1525961, -0.2237577, 3.288487, 1, 1, 1, 1, 1,
0.1541955, -1.327336, 4.316952, 1, 1, 1, 1, 1,
0.1590752, -0.07339134, 3.449117, 1, 1, 1, 1, 1,
0.1598886, -0.5727161, 2.100296, 1, 1, 1, 1, 1,
0.1601314, 0.3931071, 0.843803, 1, 1, 1, 1, 1,
0.1620027, -0.5449347, 1.88027, 1, 1, 1, 1, 1,
0.1631478, -0.9784409, 1.246782, 1, 1, 1, 1, 1,
0.1652497, -2.528386, 4.112502, 1, 1, 1, 1, 1,
0.1671387, -0.4397325, 2.59999, 0, 0, 1, 1, 1,
0.1675787, -0.8217778, 2.966377, 1, 0, 0, 1, 1,
0.1710705, -0.003692575, 1.16367, 1, 0, 0, 1, 1,
0.1716319, 0.1258469, 0.006151655, 1, 0, 0, 1, 1,
0.1725802, -0.744156, 1.402135, 1, 0, 0, 1, 1,
0.1744156, -1.012419, 2.039056, 1, 0, 0, 1, 1,
0.1746701, -0.3554278, -0.9733305, 0, 0, 0, 1, 1,
0.1772398, 0.1749492, 1.529251, 0, 0, 0, 1, 1,
0.1795048, -0.9261802, 2.106824, 0, 0, 0, 1, 1,
0.1821018, 2.37464, 1.279635, 0, 0, 0, 1, 1,
0.1898362, 1.122306, 0.1559014, 0, 0, 0, 1, 1,
0.1941573, -0.8055244, 3.267569, 0, 0, 0, 1, 1,
0.1947904, 0.6608431, 0.4714048, 0, 0, 0, 1, 1,
0.196261, 1.272058, -0.8252257, 1, 1, 1, 1, 1,
0.1979004, 0.3802942, 2.739005, 1, 1, 1, 1, 1,
0.1986743, 1.229995, -0.7122704, 1, 1, 1, 1, 1,
0.2077418, 1.715484, 1.053672, 1, 1, 1, 1, 1,
0.214519, 1.275984, -1.274278, 1, 1, 1, 1, 1,
0.2238013, 0.457109, 0.7144951, 1, 1, 1, 1, 1,
0.2278738, -0.8586448, 2.056884, 1, 1, 1, 1, 1,
0.2281633, 0.2062887, 0.5444002, 1, 1, 1, 1, 1,
0.2340216, -0.7610055, 2.131012, 1, 1, 1, 1, 1,
0.2367488, -1.18666, 2.208992, 1, 1, 1, 1, 1,
0.2375228, 0.09970969, 0.005317345, 1, 1, 1, 1, 1,
0.24004, -0.3185662, 2.723894, 1, 1, 1, 1, 1,
0.2429773, -0.3194253, 2.167069, 1, 1, 1, 1, 1,
0.247958, -0.2602848, 2.452813, 1, 1, 1, 1, 1,
0.2516606, 0.1350674, 3.025425, 1, 1, 1, 1, 1,
0.2516898, -0.7572639, 4.926504, 0, 0, 1, 1, 1,
0.2555432, 1.616417, 0.1890851, 1, 0, 0, 1, 1,
0.2574016, -0.639725, 3.18523, 1, 0, 0, 1, 1,
0.2614764, -1.300718, 4.235428, 1, 0, 0, 1, 1,
0.2670357, -2.016586, 2.103434, 1, 0, 0, 1, 1,
0.2747209, 0.07685697, 0.9091482, 1, 0, 0, 1, 1,
0.2750394, -0.1398148, 3.765848, 0, 0, 0, 1, 1,
0.2761272, 0.9848958, 0.7000718, 0, 0, 0, 1, 1,
0.2761477, 0.5342253, 0.02124947, 0, 0, 0, 1, 1,
0.276352, 0.06359271, 1.809552, 0, 0, 0, 1, 1,
0.2767498, 0.01810032, 2.363137, 0, 0, 0, 1, 1,
0.2814012, 1.494637, -1.653695, 0, 0, 0, 1, 1,
0.2831993, -1.141383, 2.814107, 0, 0, 0, 1, 1,
0.2873366, 0.7099037, -0.8098253, 1, 1, 1, 1, 1,
0.2909721, 1.430104, 0.9086975, 1, 1, 1, 1, 1,
0.2927425, 1.442403, 0.09667748, 1, 1, 1, 1, 1,
0.2944469, 0.5028054, 0.4378935, 1, 1, 1, 1, 1,
0.2945895, 0.3830791, 0.2898789, 1, 1, 1, 1, 1,
0.2972501, -0.5698622, 3.643546, 1, 1, 1, 1, 1,
0.303896, -0.3399117, 3.615616, 1, 1, 1, 1, 1,
0.3057814, 0.9337265, 0.1897431, 1, 1, 1, 1, 1,
0.3072233, 0.490294, 0.7861136, 1, 1, 1, 1, 1,
0.3112051, 1.939437, 0.06227612, 1, 1, 1, 1, 1,
0.3121009, 1.437667, -1.457378, 1, 1, 1, 1, 1,
0.3140967, -2.04726, 3.778021, 1, 1, 1, 1, 1,
0.3142078, -1.482723, 2.798277, 1, 1, 1, 1, 1,
0.3154606, -0.8636527, 3.038711, 1, 1, 1, 1, 1,
0.3159857, 0.7932895, 0.1786048, 1, 1, 1, 1, 1,
0.3226812, 1.261976, 1.680344, 0, 0, 1, 1, 1,
0.3228278, 1.428425, 1.765014, 1, 0, 0, 1, 1,
0.3229282, 0.6346827, 1.668834, 1, 0, 0, 1, 1,
0.3243832, -0.2400313, 1.013397, 1, 0, 0, 1, 1,
0.3249364, 1.492506, -0.4496628, 1, 0, 0, 1, 1,
0.329616, 0.1956266, 1.630384, 1, 0, 0, 1, 1,
0.330466, 0.6303728, 1.72185, 0, 0, 0, 1, 1,
0.3319718, -0.07324009, 0.4587063, 0, 0, 0, 1, 1,
0.3323369, 0.3635969, 0.5658491, 0, 0, 0, 1, 1,
0.3341827, 1.188342, 1.397571, 0, 0, 0, 1, 1,
0.3382027, 1.271864, -1.205331, 0, 0, 0, 1, 1,
0.3393714, 0.9894744, 0.9734329, 0, 0, 0, 1, 1,
0.3430732, -0.1271309, 2.828384, 0, 0, 0, 1, 1,
0.3462764, 0.04869239, 1.562752, 1, 1, 1, 1, 1,
0.3491623, 0.777581, 1.108853, 1, 1, 1, 1, 1,
0.354148, 0.6674509, 3.349927, 1, 1, 1, 1, 1,
0.3558835, 1.223221, -0.6152656, 1, 1, 1, 1, 1,
0.3559253, 1.558195, 0.7799891, 1, 1, 1, 1, 1,
0.3562947, -1.593741, 3.026583, 1, 1, 1, 1, 1,
0.3608345, -0.1263421, 3.571848, 1, 1, 1, 1, 1,
0.3652261, 1.687743, -0.4033163, 1, 1, 1, 1, 1,
0.3675491, -2.016055, 1.449783, 1, 1, 1, 1, 1,
0.3686097, 0.6096224, 1.32469, 1, 1, 1, 1, 1,
0.369116, -0.9825716, 2.401611, 1, 1, 1, 1, 1,
0.3724619, 1.508841, -0.3168001, 1, 1, 1, 1, 1,
0.3740085, 0.9330296, 1.891244, 1, 1, 1, 1, 1,
0.3743619, 1.519914, -0.9791939, 1, 1, 1, 1, 1,
0.3788521, -2.00221, 1.9661, 1, 1, 1, 1, 1,
0.3808314, -0.7713699, 3.587786, 0, 0, 1, 1, 1,
0.3828461, 0.9684064, -0.2840366, 1, 0, 0, 1, 1,
0.384109, 0.862856, -0.07356232, 1, 0, 0, 1, 1,
0.3881351, 0.1574323, 2.964248, 1, 0, 0, 1, 1,
0.3900095, 2.086404, 0.2253397, 1, 0, 0, 1, 1,
0.3940139, 1.388254, -0.8839836, 1, 0, 0, 1, 1,
0.3946095, -0.8412123, 2.743354, 0, 0, 0, 1, 1,
0.3968268, 0.9340003, 1.941579, 0, 0, 0, 1, 1,
0.3974807, -1.221765, 3.293262, 0, 0, 0, 1, 1,
0.3990427, 1.91784, -0.7770552, 0, 0, 0, 1, 1,
0.4031523, 0.4211263, -0.2757128, 0, 0, 0, 1, 1,
0.4065229, -0.8501734, 3.945859, 0, 0, 0, 1, 1,
0.4113483, 1.325824, -0.2332926, 0, 0, 0, 1, 1,
0.4186594, -1.434819, 3.090047, 1, 1, 1, 1, 1,
0.419643, 0.2640021, -0.7698742, 1, 1, 1, 1, 1,
0.4231448, -0.2114829, 2.84634, 1, 1, 1, 1, 1,
0.4237611, -2.382114, 1.648867, 1, 1, 1, 1, 1,
0.4242236, 0.2225248, -0.1333992, 1, 1, 1, 1, 1,
0.4264337, 0.752634, 0.06447942, 1, 1, 1, 1, 1,
0.4292495, -1.603832, 1.807102, 1, 1, 1, 1, 1,
0.4296976, -0.7988354, 2.914359, 1, 1, 1, 1, 1,
0.4303101, 0.7181133, -0.08759677, 1, 1, 1, 1, 1,
0.433459, -0.2953801, 1.832532, 1, 1, 1, 1, 1,
0.4352707, 0.7463936, -0.1131117, 1, 1, 1, 1, 1,
0.4369503, -1.008863, 3.441524, 1, 1, 1, 1, 1,
0.4394199, -0.6734141, 0.7662662, 1, 1, 1, 1, 1,
0.4404922, -0.3738976, 1.016051, 1, 1, 1, 1, 1,
0.4406187, 0.1171706, 0.1617304, 1, 1, 1, 1, 1,
0.4470021, -0.5285087, 2.800777, 0, 0, 1, 1, 1,
0.4536636, 0.3851227, 1.213891, 1, 0, 0, 1, 1,
0.4563134, -1.09309, 2.339625, 1, 0, 0, 1, 1,
0.4583258, 0.846864, 0.5124161, 1, 0, 0, 1, 1,
0.4589265, 0.08807886, 0.1608073, 1, 0, 0, 1, 1,
0.4646266, 0.8374633, 0.009144251, 1, 0, 0, 1, 1,
0.4696625, -0.1389607, 2.322527, 0, 0, 0, 1, 1,
0.4702196, 0.8256821, 1.244768, 0, 0, 0, 1, 1,
0.4704998, 0.7606044, 1.031518, 0, 0, 0, 1, 1,
0.4708489, -1.025312, 2.659948, 0, 0, 0, 1, 1,
0.4719971, -1.802505, 3.246054, 0, 0, 0, 1, 1,
0.4776805, -0.123425, 1.460591, 0, 0, 0, 1, 1,
0.4776837, -0.3554198, 2.903126, 0, 0, 0, 1, 1,
0.4791637, 1.731753, -1.221141, 1, 1, 1, 1, 1,
0.4811128, 0.3076978, 1.826383, 1, 1, 1, 1, 1,
0.4819158, 0.323379, 0.5621265, 1, 1, 1, 1, 1,
0.4847081, -0.6293545, 2.706881, 1, 1, 1, 1, 1,
0.4898024, -0.3955826, 2.681116, 1, 1, 1, 1, 1,
0.4912303, 1.448089, 0.5413288, 1, 1, 1, 1, 1,
0.4920223, -0.8591938, 1.125465, 1, 1, 1, 1, 1,
0.492808, -0.1240477, 3.064838, 1, 1, 1, 1, 1,
0.4932266, 1.313204, -0.5741668, 1, 1, 1, 1, 1,
0.4966826, -1.121444, 2.605248, 1, 1, 1, 1, 1,
0.4983466, -0.3734075, 1.426848, 1, 1, 1, 1, 1,
0.5021742, 0.04554528, -0.1505527, 1, 1, 1, 1, 1,
0.5063626, -2.703177, 2.964333, 1, 1, 1, 1, 1,
0.5095852, 1.085637, 0.9291411, 1, 1, 1, 1, 1,
0.5124474, 1.038071, -1.46782, 1, 1, 1, 1, 1,
0.5160403, 0.2678297, 2.131499, 0, 0, 1, 1, 1,
0.5182299, 0.443543, 0.2026145, 1, 0, 0, 1, 1,
0.5201222, -1.43509, 1.075206, 1, 0, 0, 1, 1,
0.5243732, 0.4019334, 1.100034, 1, 0, 0, 1, 1,
0.5251989, 1.549589, 0.2819697, 1, 0, 0, 1, 1,
0.5302728, -0.1596899, 2.60666, 1, 0, 0, 1, 1,
0.5315298, -0.9888814, 2.780151, 0, 0, 0, 1, 1,
0.5361245, -0.8246185, 2.925814, 0, 0, 0, 1, 1,
0.5411707, -1.236067, 1.948158, 0, 0, 0, 1, 1,
0.542245, -1.254578, 2.699742, 0, 0, 0, 1, 1,
0.5443006, -0.2891182, 2.645784, 0, 0, 0, 1, 1,
0.5450355, 0.8373771, -0.06688999, 0, 0, 0, 1, 1,
0.5455829, 0.1174807, 1.914706, 0, 0, 0, 1, 1,
0.5476106, -0.3883261, 0.7742282, 1, 1, 1, 1, 1,
0.5483913, 1.250242, 0.482901, 1, 1, 1, 1, 1,
0.5501331, -0.1912234, 0.6914487, 1, 1, 1, 1, 1,
0.5503046, 0.8930043, 0.02227543, 1, 1, 1, 1, 1,
0.5515079, -1.007776, 1.86506, 1, 1, 1, 1, 1,
0.5532048, -0.1951906, 0.5711752, 1, 1, 1, 1, 1,
0.55361, -0.2960002, 3.253486, 1, 1, 1, 1, 1,
0.5596473, -0.0491045, 1.167062, 1, 1, 1, 1, 1,
0.5600517, -1.554553, 2.398422, 1, 1, 1, 1, 1,
0.5720717, 0.6350276, 0.8858746, 1, 1, 1, 1, 1,
0.5722947, 0.3032809, 2.053474, 1, 1, 1, 1, 1,
0.5780492, -0.6893805, 3.256659, 1, 1, 1, 1, 1,
0.5803584, 0.1912271, 2.912843, 1, 1, 1, 1, 1,
0.581214, 1.247618, 2.007992, 1, 1, 1, 1, 1,
0.5837156, 0.747529, 1.535178, 1, 1, 1, 1, 1,
0.5860794, 0.8067116, 0.0641272, 0, 0, 1, 1, 1,
0.5927769, 0.9392355, 1.316743, 1, 0, 0, 1, 1,
0.5944893, -0.01034118, 1.115777, 1, 0, 0, 1, 1,
0.5958753, -0.01895632, 0.370202, 1, 0, 0, 1, 1,
0.5962242, 0.02519246, 1.457944, 1, 0, 0, 1, 1,
0.5991487, 0.05086054, 3.216526, 1, 0, 0, 1, 1,
0.6002947, -1.861343, 3.124106, 0, 0, 0, 1, 1,
0.6017318, -0.382251, 1.037962, 0, 0, 0, 1, 1,
0.607733, 2.376276, 1.972525, 0, 0, 0, 1, 1,
0.6080133, 0.6908536, 0.5777779, 0, 0, 0, 1, 1,
0.6082025, -1.3523, 2.366207, 0, 0, 0, 1, 1,
0.6098052, 0.5066924, 0.8591535, 0, 0, 0, 1, 1,
0.6159539, -1.293819, 2.730569, 0, 0, 0, 1, 1,
0.6222557, 0.653365, -0.5408323, 1, 1, 1, 1, 1,
0.6228871, 1.146087, 0.3622036, 1, 1, 1, 1, 1,
0.6249689, -0.8328993, 3.470595, 1, 1, 1, 1, 1,
0.6278449, -0.425053, 1.095754, 1, 1, 1, 1, 1,
0.6346272, -1.651755, 0.1283266, 1, 1, 1, 1, 1,
0.6353304, -2.409907, 2.835298, 1, 1, 1, 1, 1,
0.6407038, -0.5777212, 2.570153, 1, 1, 1, 1, 1,
0.6413946, -1.112056, 4.028822, 1, 1, 1, 1, 1,
0.6427781, -0.2680858, 3.581868, 1, 1, 1, 1, 1,
0.6435533, 1.100567, -0.3635637, 1, 1, 1, 1, 1,
0.6438823, 0.6184267, -0.7989942, 1, 1, 1, 1, 1,
0.6440037, -1.084466, 2.083642, 1, 1, 1, 1, 1,
0.6444868, 0.9760211, 0.6300216, 1, 1, 1, 1, 1,
0.6458417, -0.3203939, 2.095296, 1, 1, 1, 1, 1,
0.6471383, 0.3960257, -0.5301218, 1, 1, 1, 1, 1,
0.6492378, -0.5075079, 1.467605, 0, 0, 1, 1, 1,
0.6493503, -0.2850925, 2.387858, 1, 0, 0, 1, 1,
0.6535252, -1.058968, 3.039639, 1, 0, 0, 1, 1,
0.6549944, -1.418326, 0.8272182, 1, 0, 0, 1, 1,
0.6551077, 0.6677921, 0.8666949, 1, 0, 0, 1, 1,
0.6597628, 0.9382382, 0.9743298, 1, 0, 0, 1, 1,
0.6610553, -0.6379868, 2.26698, 0, 0, 0, 1, 1,
0.6615244, -0.1370158, 3.874817, 0, 0, 0, 1, 1,
0.6657031, 1.809393, 1.21114, 0, 0, 0, 1, 1,
0.6695164, 0.2198163, 0.1081791, 0, 0, 0, 1, 1,
0.6706956, -0.7737702, 2.598863, 0, 0, 0, 1, 1,
0.6727846, 1.72136, -0.482884, 0, 0, 0, 1, 1,
0.6745627, -2.041327, 3.903097, 0, 0, 0, 1, 1,
0.6765773, 0.630054, 2.179027, 1, 1, 1, 1, 1,
0.6787475, 0.6475183, 1.235999, 1, 1, 1, 1, 1,
0.6806092, -0.4750781, 3.750402, 1, 1, 1, 1, 1,
0.683314, 0.3493334, -0.2782303, 1, 1, 1, 1, 1,
0.6850111, -0.2796634, 2.374583, 1, 1, 1, 1, 1,
0.6878108, -0.003657051, 2.089541, 1, 1, 1, 1, 1,
0.6892151, 1.112284, 0.5695803, 1, 1, 1, 1, 1,
0.6941193, 0.05115884, 1.968575, 1, 1, 1, 1, 1,
0.6945902, 0.9177624, 0.1317771, 1, 1, 1, 1, 1,
0.7032872, -0.8377941, 2.775007, 1, 1, 1, 1, 1,
0.7091728, 0.5685083, 2.075355, 1, 1, 1, 1, 1,
0.7161181, 0.6749465, 0.796219, 1, 1, 1, 1, 1,
0.7179298, 1.316186, 0.4720546, 1, 1, 1, 1, 1,
0.7245671, 0.7416967, 0.2431647, 1, 1, 1, 1, 1,
0.7279313, 0.0413121, 1.365663, 1, 1, 1, 1, 1,
0.7306827, -2.198705, 1.693877, 0, 0, 1, 1, 1,
0.7332597, 0.2183589, 3.601998, 1, 0, 0, 1, 1,
0.733285, -0.6739676, 1.991967, 1, 0, 0, 1, 1,
0.7369066, 0.8200814, 0.9448437, 1, 0, 0, 1, 1,
0.7438791, -1.146747, 2.474149, 1, 0, 0, 1, 1,
0.7522663, -2.531676, 3.927249, 1, 0, 0, 1, 1,
0.7556701, -0.6223759, 4.401202, 0, 0, 0, 1, 1,
0.7561626, 0.9743553, 2.82239, 0, 0, 0, 1, 1,
0.7738941, 1.619159, -0.2159634, 0, 0, 0, 1, 1,
0.7808623, -0.6186365, 1.987391, 0, 0, 0, 1, 1,
0.7878475, 2.161368, 0.07059576, 0, 0, 0, 1, 1,
0.7903765, 0.2335684, -0.2632256, 0, 0, 0, 1, 1,
0.7952136, 0.364156, 1.692106, 0, 0, 0, 1, 1,
0.7984722, 2.41936, 0.1971669, 1, 1, 1, 1, 1,
0.801262, -1.682915, 2.153203, 1, 1, 1, 1, 1,
0.8053591, 0.8245898, 1.261464, 1, 1, 1, 1, 1,
0.8068956, -1.946412, 3.879052, 1, 1, 1, 1, 1,
0.807627, 0.08028747, 3.674675, 1, 1, 1, 1, 1,
0.8141117, -0.2054771, 0.7902364, 1, 1, 1, 1, 1,
0.8143771, -0.5246697, 0.9968992, 1, 1, 1, 1, 1,
0.8281022, -0.2538176, 2.580829, 1, 1, 1, 1, 1,
0.8346291, 0.08032537, 1.628031, 1, 1, 1, 1, 1,
0.836211, 0.375535, 0.3765287, 1, 1, 1, 1, 1,
0.8375847, -1.827259, 1.09134, 1, 1, 1, 1, 1,
0.8423527, -0.03724189, 1.840907, 1, 1, 1, 1, 1,
0.8433684, -0.2184512, 2.02786, 1, 1, 1, 1, 1,
0.8481003, -0.9910724, 3.477909, 1, 1, 1, 1, 1,
0.8562589, -0.1258613, 1.427262, 1, 1, 1, 1, 1,
0.8647737, -0.1781932, 1.595766, 0, 0, 1, 1, 1,
0.8668585, 0.852535, -0.06341789, 1, 0, 0, 1, 1,
0.8676581, 1.0757, 1.626152, 1, 0, 0, 1, 1,
0.8713526, -0.6759469, 3.689611, 1, 0, 0, 1, 1,
0.8745233, 1.338106, 1.664368, 1, 0, 0, 1, 1,
0.8828475, -0.6905504, 2.043855, 1, 0, 0, 1, 1,
0.8843499, -3.159789, 3.947143, 0, 0, 0, 1, 1,
0.8849367, -0.06608124, 2.584049, 0, 0, 0, 1, 1,
0.8872816, -0.07392835, 0.8062478, 0, 0, 0, 1, 1,
0.8884994, -0.1761996, 3.143932, 0, 0, 0, 1, 1,
0.8943182, 0.8892244, 0.7538653, 0, 0, 0, 1, 1,
0.8956564, -1.841914, 2.812284, 0, 0, 0, 1, 1,
0.8961515, 0.09682346, 3.566251, 0, 0, 0, 1, 1,
0.8966646, 0.4879783, 2.412637, 1, 1, 1, 1, 1,
0.9057348, -0.912739, 3.127941, 1, 1, 1, 1, 1,
0.9063777, -0.3550581, 1.81011, 1, 1, 1, 1, 1,
0.9074378, 0.9301218, 0.4523766, 1, 1, 1, 1, 1,
0.9113877, 0.6397963, 0.9056395, 1, 1, 1, 1, 1,
0.9119992, -1.131163, 1.069572, 1, 1, 1, 1, 1,
0.9133858, 1.904656, -0.8119902, 1, 1, 1, 1, 1,
0.9151736, -0.9471192, 2.430561, 1, 1, 1, 1, 1,
0.9164497, 0.005810587, 1.000061, 1, 1, 1, 1, 1,
0.9177408, -0.4186442, 1.069951, 1, 1, 1, 1, 1,
0.918327, 1.327324, 1.620928, 1, 1, 1, 1, 1,
0.9202643, 1.196539, 0.05190847, 1, 1, 1, 1, 1,
0.9272362, -1.311211, 1.813894, 1, 1, 1, 1, 1,
0.9295562, -1.006793, 4.137702, 1, 1, 1, 1, 1,
0.9325982, 1.73024, 0.5956442, 1, 1, 1, 1, 1,
0.9379335, 1.397763, 1.638002, 0, 0, 1, 1, 1,
0.9484217, -0.2020123, 3.210398, 1, 0, 0, 1, 1,
0.9528963, -0.9300227, 2.567847, 1, 0, 0, 1, 1,
0.9591745, -0.4906029, 1.643646, 1, 0, 0, 1, 1,
0.9609717, 0.8143924, 0.9860494, 1, 0, 0, 1, 1,
0.9669383, -0.3468924, 0.2701529, 1, 0, 0, 1, 1,
0.967176, -0.1455228, 0.4146048, 0, 0, 0, 1, 1,
0.9684431, -0.1265189, 2.52585, 0, 0, 0, 1, 1,
0.969534, 1.791235, 0.09372941, 0, 0, 0, 1, 1,
0.9771245, -0.1314368, 0.703865, 0, 0, 0, 1, 1,
0.9780298, -1.094656, 4.003331, 0, 0, 0, 1, 1,
0.9784147, -0.1370543, 1.87368, 0, 0, 0, 1, 1,
0.9829952, 1.510366, 0.4389062, 0, 0, 0, 1, 1,
0.9855102, -0.8575057, 2.244595, 1, 1, 1, 1, 1,
0.9892166, 0.586047, 0.1903617, 1, 1, 1, 1, 1,
0.9937639, -0.2842093, 1.895084, 1, 1, 1, 1, 1,
0.996559, -0.8861175, 3.142661, 1, 1, 1, 1, 1,
1.001766, 1.629173, 1.13702, 1, 1, 1, 1, 1,
1.002093, -0.9589854, 2.883656, 1, 1, 1, 1, 1,
1.008155, -0.7966915, 2.284441, 1, 1, 1, 1, 1,
1.016134, 0.2145122, -0.2469302, 1, 1, 1, 1, 1,
1.019242, 0.07100587, 2.386458, 1, 1, 1, 1, 1,
1.024004, 0.5199605, 1.169702, 1, 1, 1, 1, 1,
1.025595, 1.907327, 0.6563985, 1, 1, 1, 1, 1,
1.031162, 0.1562922, 0.9229239, 1, 1, 1, 1, 1,
1.034047, 0.5280959, 1.710016, 1, 1, 1, 1, 1,
1.03503, 0.09538728, 1.542863, 1, 1, 1, 1, 1,
1.035749, -0.6549409, 2.307167, 1, 1, 1, 1, 1,
1.036866, 0.459435, 1.110398, 0, 0, 1, 1, 1,
1.051368, 0.9919564, 0.4625531, 1, 0, 0, 1, 1,
1.051439, -1.727399, 1.864718, 1, 0, 0, 1, 1,
1.053739, -0.1752408, 2.136492, 1, 0, 0, 1, 1,
1.058997, 2.221021, 0.007678524, 1, 0, 0, 1, 1,
1.059137, 0.07215774, 0.3534169, 1, 0, 0, 1, 1,
1.061696, 0.5595858, -1.76891, 0, 0, 0, 1, 1,
1.066842, 0.09700128, 0.5711525, 0, 0, 0, 1, 1,
1.073679, 0.4095415, 2.471342, 0, 0, 0, 1, 1,
1.074413, 0.055336, 2.478782, 0, 0, 0, 1, 1,
1.090886, 0.098572, 0.9866559, 0, 0, 0, 1, 1,
1.091524, -0.5326909, 1.467188, 0, 0, 0, 1, 1,
1.105751, -1.186501, 2.906832, 0, 0, 0, 1, 1,
1.108877, -1.615071, 3.661795, 1, 1, 1, 1, 1,
1.110149, 1.425909, 1.260184, 1, 1, 1, 1, 1,
1.115644, -0.6947396, 2.290544, 1, 1, 1, 1, 1,
1.115681, 1.04424, 1.743605, 1, 1, 1, 1, 1,
1.119828, 1.553284, 0.1508425, 1, 1, 1, 1, 1,
1.123346, -0.3614261, 2.375784, 1, 1, 1, 1, 1,
1.128759, -0.4044825, 2.924484, 1, 1, 1, 1, 1,
1.132146, 0.1520314, 1.42472, 1, 1, 1, 1, 1,
1.139876, 0.8600134, 0.6786563, 1, 1, 1, 1, 1,
1.14583, -0.7119898, 1.677501, 1, 1, 1, 1, 1,
1.147635, 0.4173661, 1.694961, 1, 1, 1, 1, 1,
1.149069, -0.1309405, 2.274243, 1, 1, 1, 1, 1,
1.165102, 0.6205472, 1.903922, 1, 1, 1, 1, 1,
1.166521, 0.8254781, 0.9805936, 1, 1, 1, 1, 1,
1.169483, -0.4959561, 1.845775, 1, 1, 1, 1, 1,
1.186505, 1.702186, -0.4061445, 0, 0, 1, 1, 1,
1.190002, -0.1747254, 0.433845, 1, 0, 0, 1, 1,
1.199401, -0.1745825, 0.7638453, 1, 0, 0, 1, 1,
1.210368, -1.098959, 1.600549, 1, 0, 0, 1, 1,
1.211288, 0.04258646, 1.696037, 1, 0, 0, 1, 1,
1.220816, -0.6289948, 3.234974, 1, 0, 0, 1, 1,
1.238927, 1.118157, 4.394431, 0, 0, 0, 1, 1,
1.242417, 0.2613605, 2.386399, 0, 0, 0, 1, 1,
1.243675, -0.1777558, 2.520696, 0, 0, 0, 1, 1,
1.245545, -0.82113, 1.11263, 0, 0, 0, 1, 1,
1.252941, 0.2451782, 2.134837, 0, 0, 0, 1, 1,
1.258014, 0.0169982, 0.5568476, 0, 0, 0, 1, 1,
1.25839, 0.5870025, 1.233537, 0, 0, 0, 1, 1,
1.261217, -1.613231, 3.455447, 1, 1, 1, 1, 1,
1.266286, -0.6793574, 2.115891, 1, 1, 1, 1, 1,
1.267957, 0.6593618, -0.6644612, 1, 1, 1, 1, 1,
1.283501, 0.08672392, 0.04559352, 1, 1, 1, 1, 1,
1.287376, -0.2085191, 0.9082545, 1, 1, 1, 1, 1,
1.287425, -0.5975946, 1.225621, 1, 1, 1, 1, 1,
1.290383, 0.5799525, 1.231075, 1, 1, 1, 1, 1,
1.292, 1.18811, 0.244697, 1, 1, 1, 1, 1,
1.295761, 1.015928, 0.7062106, 1, 1, 1, 1, 1,
1.31196, 0.6030812, 0.9206914, 1, 1, 1, 1, 1,
1.316496, 0.3942589, 3.368684, 1, 1, 1, 1, 1,
1.335984, 2.051003, 1.285195, 1, 1, 1, 1, 1,
1.343265, 0.05445526, 1.334157, 1, 1, 1, 1, 1,
1.352654, -0.7572076, 1.30509, 1, 1, 1, 1, 1,
1.36321, 1.399917, 0.4776596, 1, 1, 1, 1, 1,
1.365358, -0.01775679, 0.9000146, 0, 0, 1, 1, 1,
1.378092, -0.282916, 3.43869, 1, 0, 0, 1, 1,
1.379296, -1.24997, 1.628135, 1, 0, 0, 1, 1,
1.38016, -1.228207, 2.992392, 1, 0, 0, 1, 1,
1.387146, 0.6129009, -0.5459988, 1, 0, 0, 1, 1,
1.39291, 0.6327417, 2.818752, 1, 0, 0, 1, 1,
1.394261, -0.3587265, 3.456758, 0, 0, 0, 1, 1,
1.39731, 0.6280388, 1.088883, 0, 0, 0, 1, 1,
1.404452, 0.0003493901, 2.016407, 0, 0, 0, 1, 1,
1.408085, -0.6438888, 2.661213, 0, 0, 0, 1, 1,
1.41297, -0.5694529, 1.474367, 0, 0, 0, 1, 1,
1.433984, 1.964726, 2.407101, 0, 0, 0, 1, 1,
1.455319, 0.5639681, 0.6148531, 0, 0, 0, 1, 1,
1.464517, -1.013365, 0.8235605, 1, 1, 1, 1, 1,
1.472704, -0.4187856, 1.206035, 1, 1, 1, 1, 1,
1.489229, -0.2355848, 2.341473, 1, 1, 1, 1, 1,
1.49135, 0.218925, 1.402715, 1, 1, 1, 1, 1,
1.504225, -0.6644525, 2.619901, 1, 1, 1, 1, 1,
1.511438, 0.2325579, 1.131467, 1, 1, 1, 1, 1,
1.531688, -1.827867, 2.372785, 1, 1, 1, 1, 1,
1.536261, -1.197181, 2.177222, 1, 1, 1, 1, 1,
1.538024, -0.3733419, 1.933953, 1, 1, 1, 1, 1,
1.542307, -0.3177301, 0.9449847, 1, 1, 1, 1, 1,
1.545261, -0.9120253, 1.462741, 1, 1, 1, 1, 1,
1.549533, -0.5594296, 2.209301, 1, 1, 1, 1, 1,
1.578705, 0.5818259, -0.3377038, 1, 1, 1, 1, 1,
1.579979, -0.1611383, 2.108452, 1, 1, 1, 1, 1,
1.58833, 0.1819604, 0.9600621, 1, 1, 1, 1, 1,
1.605902, 2.05572, -1.017727, 0, 0, 1, 1, 1,
1.616344, 0.5993662, 1.837389, 1, 0, 0, 1, 1,
1.620595, -0.6364155, 1.528219, 1, 0, 0, 1, 1,
1.623339, 0.1880494, 2.142895, 1, 0, 0, 1, 1,
1.644824, 1.491644, 1.178497, 1, 0, 0, 1, 1,
1.648814, -0.8866628, 0.8900899, 1, 0, 0, 1, 1,
1.650912, -0.6668178, 2.471175, 0, 0, 0, 1, 1,
1.655874, -0.1062486, 2.469343, 0, 0, 0, 1, 1,
1.657743, -0.3652193, 2.008599, 0, 0, 0, 1, 1,
1.697631, 0.8406689, -1.183695, 0, 0, 0, 1, 1,
1.738685, 0.4690025, 0.7379386, 0, 0, 0, 1, 1,
1.740005, -0.4120685, 1.518662, 0, 0, 0, 1, 1,
1.740279, -0.3381012, 0.8770954, 0, 0, 0, 1, 1,
1.749714, -0.689069, -0.618908, 1, 1, 1, 1, 1,
1.800093, -1.836663, 2.350657, 1, 1, 1, 1, 1,
1.809475, 0.4784547, 3.497122, 1, 1, 1, 1, 1,
1.812546, -1.004673, 1.508846, 1, 1, 1, 1, 1,
1.828315, 1.073379, 0.7735315, 1, 1, 1, 1, 1,
1.867153, -0.5897995, 1.493322, 1, 1, 1, 1, 1,
1.876881, -0.6911938, 4.644517, 1, 1, 1, 1, 1,
1.880519, 1.00831, 0.8644204, 1, 1, 1, 1, 1,
1.91194, 0.03397642, 0.7603698, 1, 1, 1, 1, 1,
1.920562, 0.08490182, 0.8676205, 1, 1, 1, 1, 1,
1.937115, -1.136205, 1.101947, 1, 1, 1, 1, 1,
1.937372, 0.8539869, 3.139517, 1, 1, 1, 1, 1,
1.954866, -0.1024311, 1.144674, 1, 1, 1, 1, 1,
1.972104, 0.6949263, 2.300122, 1, 1, 1, 1, 1,
1.981876, -0.1233985, 1.424604, 1, 1, 1, 1, 1,
1.991483, 0.5781714, 1.437777, 0, 0, 1, 1, 1,
2.005383, 0.2280426, 3.11857, 1, 0, 0, 1, 1,
2.007962, -0.7117797, 0.06156053, 1, 0, 0, 1, 1,
2.022955, 1.969401, 1.011368, 1, 0, 0, 1, 1,
2.055241, -1.212271, 3.46714, 1, 0, 0, 1, 1,
2.074718, -0.9681289, 4.877236, 1, 0, 0, 1, 1,
2.098982, 0.4214827, 1.458842, 0, 0, 0, 1, 1,
2.099336, -0.4014836, 1.960404, 0, 0, 0, 1, 1,
2.107397, -1.669466, 2.609605, 0, 0, 0, 1, 1,
2.118192, 1.196043, 1.887087, 0, 0, 0, 1, 1,
2.230344, -1.092456, 3.827825, 0, 0, 0, 1, 1,
2.283565, 1.966813, 1.203311, 0, 0, 0, 1, 1,
2.309314, 0.4580427, 2.677491, 0, 0, 0, 1, 1,
2.321351, 1.624844, -0.2177132, 1, 1, 1, 1, 1,
2.368962, -1.587661, 2.218689, 1, 1, 1, 1, 1,
2.466682, 0.9439299, 3.085375, 1, 1, 1, 1, 1,
2.494407, 1.542279, 2.160609, 1, 1, 1, 1, 1,
2.547741, 0.9238143, 1.324913, 1, 1, 1, 1, 1,
2.784663, 0.4062865, -0.1785913, 1, 1, 1, 1, 1,
2.83899, -0.1540789, 0.534503, 1, 1, 1, 1, 1
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
var radius = 9.369537;
var distance = 32.9101;
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
mvMatrix.translate( 0.4039644, 0.03962874, 0.07918167 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.9101);
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
