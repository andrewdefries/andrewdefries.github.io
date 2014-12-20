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
-3.268806, 0.9136411, 1.599579, 1, 0, 0, 1,
-3.173648, -1.180237, -2.271558, 1, 0.007843138, 0, 1,
-2.95847, -0.3855864, -2.103848, 1, 0.01176471, 0, 1,
-2.66327, -0.2017042, -2.33355, 1, 0.01960784, 0, 1,
-2.546421, -0.0899139, -1.132697, 1, 0.02352941, 0, 1,
-2.485408, -0.8886938, -1.092477, 1, 0.03137255, 0, 1,
-2.394571, 1.072025, -2.479671, 1, 0.03529412, 0, 1,
-2.378832, 1.281627, -0.7152665, 1, 0.04313726, 0, 1,
-2.367646, 0.7047622, -1.708063, 1, 0.04705882, 0, 1,
-2.350626, 0.75049, -4.232735, 1, 0.05490196, 0, 1,
-2.332679, -0.4776163, -1.307144, 1, 0.05882353, 0, 1,
-2.248572, -0.488145, -3.121578, 1, 0.06666667, 0, 1,
-2.233343, -0.03023865, -1.473043, 1, 0.07058824, 0, 1,
-2.222714, -0.02000172, -1.08623, 1, 0.07843138, 0, 1,
-2.191821, 0.4220144, -1.002218, 1, 0.08235294, 0, 1,
-2.148386, 1.277959, -1.124381, 1, 0.09019608, 0, 1,
-2.138455, 0.1529822, -1.649982, 1, 0.09411765, 0, 1,
-2.102071, 1.118134, -1.096878, 1, 0.1019608, 0, 1,
-2.101397, -1.232737, -2.486752, 1, 0.1098039, 0, 1,
-2.084338, -0.7319981, -3.166398, 1, 0.1137255, 0, 1,
-2.051324, 0.2181817, -0.8494915, 1, 0.1215686, 0, 1,
-2.039796, 1.091564, -2.557122, 1, 0.1254902, 0, 1,
-2.025571, -1.34982, -2.26089, 1, 0.1333333, 0, 1,
-2.025008, -0.5719614, -1.82043, 1, 0.1372549, 0, 1,
-2.024826, -0.007094817, -3.564766, 1, 0.145098, 0, 1,
-2.019491, 0.8020727, -1.762314, 1, 0.1490196, 0, 1,
-1.984935, -2.004759, -2.22912, 1, 0.1568628, 0, 1,
-1.916324, 0.06201947, -0.4218349, 1, 0.1607843, 0, 1,
-1.898192, -0.9977229, -2.494039, 1, 0.1686275, 0, 1,
-1.889765, -0.845636, -2.486252, 1, 0.172549, 0, 1,
-1.868102, 0.2896071, -2.532103, 1, 0.1803922, 0, 1,
-1.845107, -0.4493612, -2.068245, 1, 0.1843137, 0, 1,
-1.843335, 0.5488311, -1.307643, 1, 0.1921569, 0, 1,
-1.843254, 0.6057693, -1.955974, 1, 0.1960784, 0, 1,
-1.837337, 0.7519012, -1.795519, 1, 0.2039216, 0, 1,
-1.825313, -0.2270146, -1.897756, 1, 0.2117647, 0, 1,
-1.824056, 0.591204, -2.27139, 1, 0.2156863, 0, 1,
-1.819283, -0.3825523, -0.7492114, 1, 0.2235294, 0, 1,
-1.796131, -0.1395677, -1.854765, 1, 0.227451, 0, 1,
-1.793007, -0.2965434, -0.8730826, 1, 0.2352941, 0, 1,
-1.791753, -0.9128522, -2.778779, 1, 0.2392157, 0, 1,
-1.764282, -0.004679974, -1.623205, 1, 0.2470588, 0, 1,
-1.739904, -0.0394017, -2.648401, 1, 0.2509804, 0, 1,
-1.736916, 0.3058736, -1.750788, 1, 0.2588235, 0, 1,
-1.732622, -0.653056, -1.436704, 1, 0.2627451, 0, 1,
-1.701852, -0.6510796, -1.4906, 1, 0.2705882, 0, 1,
-1.683819, -1.64201, -1.866893, 1, 0.2745098, 0, 1,
-1.679898, 0.4651714, -1.168276, 1, 0.282353, 0, 1,
-1.676729, -0.2483744, -2.495019, 1, 0.2862745, 0, 1,
-1.671106, -1.621377, -2.558203, 1, 0.2941177, 0, 1,
-1.653652, -1.135473, -3.052525, 1, 0.3019608, 0, 1,
-1.647234, -0.3855633, -1.377002, 1, 0.3058824, 0, 1,
-1.639829, 0.1480885, -0.7805068, 1, 0.3137255, 0, 1,
-1.638085, -0.6510856, -0.9087574, 1, 0.3176471, 0, 1,
-1.628868, -1.143998, -3.104601, 1, 0.3254902, 0, 1,
-1.628535, -1.600527, -2.682208, 1, 0.3294118, 0, 1,
-1.613316, -2.050717, -2.48132, 1, 0.3372549, 0, 1,
-1.602011, -1.043339, -3.006341, 1, 0.3411765, 0, 1,
-1.599188, -0.3095908, -2.795229, 1, 0.3490196, 0, 1,
-1.599127, -0.6999961, -0.4949953, 1, 0.3529412, 0, 1,
-1.589506, -0.02399596, -2.492221, 1, 0.3607843, 0, 1,
-1.582731, -0.03751553, -1.847677, 1, 0.3647059, 0, 1,
-1.567799, 0.8214492, 0.0271657, 1, 0.372549, 0, 1,
-1.562105, -0.1249802, -1.485359, 1, 0.3764706, 0, 1,
-1.547602, 0.1064226, -2.102989, 1, 0.3843137, 0, 1,
-1.543995, 2.248751, -1.699138, 1, 0.3882353, 0, 1,
-1.5415, 0.2709975, 0.1240463, 1, 0.3960784, 0, 1,
-1.540663, -0.7650131, -2.252322, 1, 0.4039216, 0, 1,
-1.534784, -0.3566261, -1.876606, 1, 0.4078431, 0, 1,
-1.507951, -0.7641542, -1.613363, 1, 0.4156863, 0, 1,
-1.50511, -0.6220668, -2.285201, 1, 0.4196078, 0, 1,
-1.50271, 1.910531, -1.292632, 1, 0.427451, 0, 1,
-1.477821, -0.4933233, -1.297243, 1, 0.4313726, 0, 1,
-1.47363, 1.381584, -2.18768, 1, 0.4392157, 0, 1,
-1.470556, 2.136273, -0.6028957, 1, 0.4431373, 0, 1,
-1.470112, -0.5827019, -2.401166, 1, 0.4509804, 0, 1,
-1.460327, 1.098089, -0.1863716, 1, 0.454902, 0, 1,
-1.451572, -1.410553, -1.091084, 1, 0.4627451, 0, 1,
-1.451492, -0.8180699, -0.6483506, 1, 0.4666667, 0, 1,
-1.443556, -0.9860973, -3.744136, 1, 0.4745098, 0, 1,
-1.442707, 1.178713, -1.185142, 1, 0.4784314, 0, 1,
-1.42263, 0.8205604, -0.7734075, 1, 0.4862745, 0, 1,
-1.420999, 0.09014037, -3.757679, 1, 0.4901961, 0, 1,
-1.40484, 0.8081803, -0.4726357, 1, 0.4980392, 0, 1,
-1.404748, -0.00102881, -2.252847, 1, 0.5058824, 0, 1,
-1.4036, 0.1501175, -1.386126, 1, 0.509804, 0, 1,
-1.402583, -0.1716432, -1.514892, 1, 0.5176471, 0, 1,
-1.395159, -1.039751, -2.98128, 1, 0.5215687, 0, 1,
-1.391374, 0.1878208, -1.781308, 1, 0.5294118, 0, 1,
-1.388815, 0.7105868, -0.3367177, 1, 0.5333334, 0, 1,
-1.387312, -0.4206644, -0.6591158, 1, 0.5411765, 0, 1,
-1.385277, 2.864135, -0.5665555, 1, 0.5450981, 0, 1,
-1.369045, 0.705694, -0.5495768, 1, 0.5529412, 0, 1,
-1.359789, -1.168652, -3.150501, 1, 0.5568628, 0, 1,
-1.350004, -1.924079, -4.391557, 1, 0.5647059, 0, 1,
-1.348675, 0.4917361, -1.787719, 1, 0.5686275, 0, 1,
-1.347678, -0.7821432, -1.149256, 1, 0.5764706, 0, 1,
-1.347147, 0.1226733, -2.209918, 1, 0.5803922, 0, 1,
-1.340563, -1.404049, -3.119626, 1, 0.5882353, 0, 1,
-1.332455, 0.4568181, -0.8506054, 1, 0.5921569, 0, 1,
-1.292412, 0.6651129, -1.014119, 1, 0.6, 0, 1,
-1.25776, 1.706575, 0.3051619, 1, 0.6078432, 0, 1,
-1.257691, -1.06208, -3.996414, 1, 0.6117647, 0, 1,
-1.2572, -0.1391594, -2.061699, 1, 0.6196079, 0, 1,
-1.251828, 0.8929185, -1.760652, 1, 0.6235294, 0, 1,
-1.246987, 0.8708929, -0.4811719, 1, 0.6313726, 0, 1,
-1.242336, 0.1908859, -3.271101, 1, 0.6352941, 0, 1,
-1.230187, 1.239049, -2.581077, 1, 0.6431373, 0, 1,
-1.225491, 2.242408, -0.1863637, 1, 0.6470588, 0, 1,
-1.223161, -1.389146, -2.741322, 1, 0.654902, 0, 1,
-1.222877, -2.150464, -4.974228, 1, 0.6588235, 0, 1,
-1.221799, -0.6017847, -2.959213, 1, 0.6666667, 0, 1,
-1.218296, 0.5314492, -1.038381, 1, 0.6705883, 0, 1,
-1.217225, 1.36792, -2.120106, 1, 0.6784314, 0, 1,
-1.213249, 0.4886481, -0.6173266, 1, 0.682353, 0, 1,
-1.213196, -1.353389, -3.2693, 1, 0.6901961, 0, 1,
-1.209038, -0.7197337, -2.497379, 1, 0.6941177, 0, 1,
-1.208158, 0.6818714, -0.2522227, 1, 0.7019608, 0, 1,
-1.202732, -1.122349, -3.48098, 1, 0.7098039, 0, 1,
-1.199999, -0.1079749, -2.481388, 1, 0.7137255, 0, 1,
-1.195742, 0.4847085, -2.191158, 1, 0.7215686, 0, 1,
-1.190447, 0.1096748, -1.070906, 1, 0.7254902, 0, 1,
-1.186363, -1.249432, -1.748008, 1, 0.7333333, 0, 1,
-1.185263, -0.8185118, -2.156483, 1, 0.7372549, 0, 1,
-1.181065, -0.9369118, -3.732624, 1, 0.7450981, 0, 1,
-1.180769, 0.7196777, -0.960343, 1, 0.7490196, 0, 1,
-1.180644, -0.7134318, -2.978924, 1, 0.7568628, 0, 1,
-1.178567, 0.1086191, -0.7571266, 1, 0.7607843, 0, 1,
-1.178045, 0.8749694, -1.572454, 1, 0.7686275, 0, 1,
-1.171504, -0.4241863, -1.639932, 1, 0.772549, 0, 1,
-1.168333, -0.4070418, -2.462614, 1, 0.7803922, 0, 1,
-1.167936, 1.188596, -1.255784, 1, 0.7843137, 0, 1,
-1.167468, -0.4095037, 0.7403331, 1, 0.7921569, 0, 1,
-1.14325, 1.34388, -1.479217, 1, 0.7960784, 0, 1,
-1.140005, 0.9649385, -0.007913233, 1, 0.8039216, 0, 1,
-1.120191, 1.053959, -0.7771354, 1, 0.8117647, 0, 1,
-1.11506, -0.3768975, -0.9470805, 1, 0.8156863, 0, 1,
-1.105518, 0.2268073, -1.040615, 1, 0.8235294, 0, 1,
-1.10407, 1.670994, -0.9874991, 1, 0.827451, 0, 1,
-1.1031, -0.658663, -2.882872, 1, 0.8352941, 0, 1,
-1.095442, 1.109452, 0.2484275, 1, 0.8392157, 0, 1,
-1.092327, 0.1987928, -0.5239945, 1, 0.8470588, 0, 1,
-1.090679, 0.2936029, -2.058658, 1, 0.8509804, 0, 1,
-1.087931, 0.8271726, -0.3324207, 1, 0.8588235, 0, 1,
-1.083205, -1.390041, -2.471743, 1, 0.8627451, 0, 1,
-1.070602, 0.3743687, 1.129272, 1, 0.8705882, 0, 1,
-1.066793, 0.6766163, -1.983585, 1, 0.8745098, 0, 1,
-1.053516, -0.9794976, -4.318134, 1, 0.8823529, 0, 1,
-1.050087, -0.09906568, -1.048567, 1, 0.8862745, 0, 1,
-1.048649, 0.79479, -1.307271, 1, 0.8941177, 0, 1,
-1.048264, 1.993859, 0.5340298, 1, 0.8980392, 0, 1,
-1.037921, -0.4149887, -3.512414, 1, 0.9058824, 0, 1,
-1.031316, 1.638353, -0.2767674, 1, 0.9137255, 0, 1,
-1.029858, -0.03058504, -3.152616, 1, 0.9176471, 0, 1,
-1.02908, -0.008370123, -1.7575, 1, 0.9254902, 0, 1,
-1.028551, -0.4898271, -2.291792, 1, 0.9294118, 0, 1,
-1.02657, 0.4192212, 0.08462935, 1, 0.9372549, 0, 1,
-1.025858, -1.971216, -2.129633, 1, 0.9411765, 0, 1,
-1.024243, -0.3143398, -1.224845, 1, 0.9490196, 0, 1,
-1.008956, -1.71734, -1.925819, 1, 0.9529412, 0, 1,
-1.007234, -0.292987, -2.044234, 1, 0.9607843, 0, 1,
-1.006284, -0.4373415, -1.071811, 1, 0.9647059, 0, 1,
-0.9990394, 0.9531194, 0.4628101, 1, 0.972549, 0, 1,
-0.9944652, 0.8361292, -1.417313, 1, 0.9764706, 0, 1,
-0.991648, 0.3915274, -1.11789, 1, 0.9843137, 0, 1,
-0.9848832, -2.441026, -2.324203, 1, 0.9882353, 0, 1,
-0.9835397, 0.2899107, -1.281893, 1, 0.9960784, 0, 1,
-0.9829665, 1.460084, -0.2375589, 0.9960784, 1, 0, 1,
-0.9825596, 0.6295183, -2.393893, 0.9921569, 1, 0, 1,
-0.9798464, -1.551629, -3.259028, 0.9843137, 1, 0, 1,
-0.9680831, 0.9403843, -1.207611, 0.9803922, 1, 0, 1,
-0.9633754, 0.4590324, -2.156694, 0.972549, 1, 0, 1,
-0.9600031, -0.1176751, 0.04584242, 0.9686275, 1, 0, 1,
-0.9579033, -1.074106, -2.063387, 0.9607843, 1, 0, 1,
-0.9536555, 0.4787427, -0.763889, 0.9568627, 1, 0, 1,
-0.9479123, -0.1598624, -2.218472, 0.9490196, 1, 0, 1,
-0.9431121, 0.5041528, -1.464544, 0.945098, 1, 0, 1,
-0.9342549, 0.1493508, -2.151439, 0.9372549, 1, 0, 1,
-0.9286546, -0.5298189, -0.675186, 0.9333333, 1, 0, 1,
-0.9282904, -1.014475, -2.110868, 0.9254902, 1, 0, 1,
-0.9258592, -1.243262, -3.772658, 0.9215686, 1, 0, 1,
-0.9220646, -1.315443, -2.824456, 0.9137255, 1, 0, 1,
-0.9193721, -1.167174, -3.360676, 0.9098039, 1, 0, 1,
-0.9182868, 0.08073608, -0.406268, 0.9019608, 1, 0, 1,
-0.9158734, -3.24555, -3.411195, 0.8941177, 1, 0, 1,
-0.9138261, -0.05565406, -1.798804, 0.8901961, 1, 0, 1,
-0.9134369, -0.5453833, -1.834625, 0.8823529, 1, 0, 1,
-0.9029622, 0.787368, -0.05760151, 0.8784314, 1, 0, 1,
-0.8987604, 0.04857365, -2.609324, 0.8705882, 1, 0, 1,
-0.894839, -0.9679537, -3.270633, 0.8666667, 1, 0, 1,
-0.8922206, -1.136084, -1.391142, 0.8588235, 1, 0, 1,
-0.8920683, 0.9129075, -0.8937618, 0.854902, 1, 0, 1,
-0.8917663, -1.31344, -2.486796, 0.8470588, 1, 0, 1,
-0.8901719, -0.9662734, -1.901374, 0.8431373, 1, 0, 1,
-0.8831833, -1.292448, -3.159759, 0.8352941, 1, 0, 1,
-0.8817334, 0.2541938, -0.8448732, 0.8313726, 1, 0, 1,
-0.8752394, 2.205539, -1.462759, 0.8235294, 1, 0, 1,
-0.8739413, 0.4390488, -2.177148, 0.8196079, 1, 0, 1,
-0.8732137, -0.3455538, -1.56921, 0.8117647, 1, 0, 1,
-0.8613776, 0.3968927, -0.6969222, 0.8078431, 1, 0, 1,
-0.859212, -1.346608, -2.936683, 0.8, 1, 0, 1,
-0.8522788, 0.1564713, -1.006248, 0.7921569, 1, 0, 1,
-0.8513715, -1.828251, -3.097026, 0.7882353, 1, 0, 1,
-0.8480586, 0.1043598, 0.07836249, 0.7803922, 1, 0, 1,
-0.8429536, -1.734824, -2.6058, 0.7764706, 1, 0, 1,
-0.8411728, 0.9685884, -1.437388, 0.7686275, 1, 0, 1,
-0.8331198, 1.742832, 0.8145228, 0.7647059, 1, 0, 1,
-0.8318915, -0.1640507, -2.725562, 0.7568628, 1, 0, 1,
-0.8314526, 1.261005, -1.98874, 0.7529412, 1, 0, 1,
-0.8297148, -1.079347, -2.548028, 0.7450981, 1, 0, 1,
-0.8278203, 0.2563378, -3.422725, 0.7411765, 1, 0, 1,
-0.8275996, 0.9752142, 0.08675962, 0.7333333, 1, 0, 1,
-0.8265854, -0.6330871, -1.858589, 0.7294118, 1, 0, 1,
-0.8234074, -1.350497, -2.538693, 0.7215686, 1, 0, 1,
-0.823131, -0.549483, -1.795508, 0.7176471, 1, 0, 1,
-0.8217131, -0.06525075, -2.7075, 0.7098039, 1, 0, 1,
-0.8095344, 0.4765659, -1.052402, 0.7058824, 1, 0, 1,
-0.803296, -0.5130233, -1.158407, 0.6980392, 1, 0, 1,
-0.7968438, -0.3235765, -1.548466, 0.6901961, 1, 0, 1,
-0.7878113, -0.6467702, -1.993632, 0.6862745, 1, 0, 1,
-0.7825381, 1.33107, -0.9957995, 0.6784314, 1, 0, 1,
-0.7777009, -2.182324, -3.029727, 0.6745098, 1, 0, 1,
-0.7772743, -0.2549654, -1.446817, 0.6666667, 1, 0, 1,
-0.7765947, -1.259807, -2.53399, 0.6627451, 1, 0, 1,
-0.7763789, -0.7789335, -1.996419, 0.654902, 1, 0, 1,
-0.7756071, -1.157364, -3.045362, 0.6509804, 1, 0, 1,
-0.7666755, 2.09429, 0.8812455, 0.6431373, 1, 0, 1,
-0.7644136, 0.332554, -1.600762, 0.6392157, 1, 0, 1,
-0.7621665, 1.807823, -1.224906, 0.6313726, 1, 0, 1,
-0.7590798, 1.420009, 0.2236508, 0.627451, 1, 0, 1,
-0.7589704, -0.7353117, -3.115759, 0.6196079, 1, 0, 1,
-0.7524822, 0.665491, 0.572291, 0.6156863, 1, 0, 1,
-0.7486224, -1.318901, -2.954999, 0.6078432, 1, 0, 1,
-0.7477649, 1.52494, -0.6247437, 0.6039216, 1, 0, 1,
-0.7468839, -0.7667631, -1.950081, 0.5960785, 1, 0, 1,
-0.7457479, 0.6203039, -2.784595, 0.5882353, 1, 0, 1,
-0.7449471, -0.6552689, -1.085824, 0.5843138, 1, 0, 1,
-0.7378244, -0.7922208, -1.175707, 0.5764706, 1, 0, 1,
-0.7272547, 0.4853491, -1.92386, 0.572549, 1, 0, 1,
-0.726845, 1.30941, -1.323437, 0.5647059, 1, 0, 1,
-0.7247407, -1.19295, -1.236565, 0.5607843, 1, 0, 1,
-0.7230099, 0.5288231, -1.274953, 0.5529412, 1, 0, 1,
-0.7222705, -0.5126259, -0.1688227, 0.5490196, 1, 0, 1,
-0.7181118, -0.2279149, 0.9684327, 0.5411765, 1, 0, 1,
-0.7108679, 0.438122, -0.9410616, 0.5372549, 1, 0, 1,
-0.7095796, -1.015, -3.033864, 0.5294118, 1, 0, 1,
-0.7091279, 1.913098, -0.6778091, 0.5254902, 1, 0, 1,
-0.7040091, -0.1009336, -3.647217, 0.5176471, 1, 0, 1,
-0.6949545, -0.04536955, -3.972731, 0.5137255, 1, 0, 1,
-0.693182, -0.6359202, -4.748278, 0.5058824, 1, 0, 1,
-0.6930632, 0.7427467, -1.811984, 0.5019608, 1, 0, 1,
-0.6925578, -1.922461, -1.281274, 0.4941176, 1, 0, 1,
-0.691193, 0.121277, -2.233422, 0.4862745, 1, 0, 1,
-0.6900908, -0.4574187, -1.633155, 0.4823529, 1, 0, 1,
-0.6790358, -0.5564848, -3.266437, 0.4745098, 1, 0, 1,
-0.6773216, -0.4950545, -1.831671, 0.4705882, 1, 0, 1,
-0.6700571, 0.1488515, -3.18102, 0.4627451, 1, 0, 1,
-0.669546, 1.437269, 0.08908319, 0.4588235, 1, 0, 1,
-0.6686704, 0.4467247, -1.714087, 0.4509804, 1, 0, 1,
-0.6578071, -0.5687112, -2.249751, 0.4470588, 1, 0, 1,
-0.6573586, -1.679924, -3.561394, 0.4392157, 1, 0, 1,
-0.6508089, 0.3394072, -1.399621, 0.4352941, 1, 0, 1,
-0.6469829, -0.4336838, -0.577641, 0.427451, 1, 0, 1,
-0.6461204, -1.499905, -2.154843, 0.4235294, 1, 0, 1,
-0.6383315, 0.9677988, -0.9528816, 0.4156863, 1, 0, 1,
-0.6366403, 0.4010549, -1.530644, 0.4117647, 1, 0, 1,
-0.6340414, -0.8737984, -3.445333, 0.4039216, 1, 0, 1,
-0.6309349, 0.2147659, -1.046496, 0.3960784, 1, 0, 1,
-0.629411, 0.5953899, -1.459573, 0.3921569, 1, 0, 1,
-0.6280017, 0.3387461, -2.718419, 0.3843137, 1, 0, 1,
-0.6276643, 0.3135124, -0.5792516, 0.3803922, 1, 0, 1,
-0.6262567, -0.5796855, -1.98206, 0.372549, 1, 0, 1,
-0.6160269, -1.42088, -3.429328, 0.3686275, 1, 0, 1,
-0.6150163, -0.4092197, -0.9299305, 0.3607843, 1, 0, 1,
-0.6128804, 1.063218, -1.605548, 0.3568628, 1, 0, 1,
-0.605422, 0.6559018, -1.922724, 0.3490196, 1, 0, 1,
-0.6052707, -0.3704418, -4.421434, 0.345098, 1, 0, 1,
-0.5951223, -1.908265, -3.78933, 0.3372549, 1, 0, 1,
-0.5940908, -0.4384545, -1.587754, 0.3333333, 1, 0, 1,
-0.5872255, -0.4550161, -2.237777, 0.3254902, 1, 0, 1,
-0.5863862, -2.382919, -2.798518, 0.3215686, 1, 0, 1,
-0.5853591, -2.043507, -0.03918558, 0.3137255, 1, 0, 1,
-0.5850549, 2.929049, -0.5941486, 0.3098039, 1, 0, 1,
-0.5842538, 1.152833, -1.494367, 0.3019608, 1, 0, 1,
-0.5840579, 1.248559, 0.7607259, 0.2941177, 1, 0, 1,
-0.5828316, -0.9656382, -0.8478425, 0.2901961, 1, 0, 1,
-0.5776848, 0.2820242, -0.4582419, 0.282353, 1, 0, 1,
-0.5772048, 1.202691, 0.06756859, 0.2784314, 1, 0, 1,
-0.5743731, -0.5359395, -4.712294, 0.2705882, 1, 0, 1,
-0.5723369, -0.3575009, -1.559246, 0.2666667, 1, 0, 1,
-0.571951, 0.8149815, 0.4551534, 0.2588235, 1, 0, 1,
-0.5699215, -0.03223149, -2.162012, 0.254902, 1, 0, 1,
-0.5653896, 0.5918609, -0.4444377, 0.2470588, 1, 0, 1,
-0.5644167, -0.6162938, -2.05418, 0.2431373, 1, 0, 1,
-0.5640624, 0.06719737, 0.1537613, 0.2352941, 1, 0, 1,
-0.5616526, 0.3650139, -0.9322768, 0.2313726, 1, 0, 1,
-0.5547771, -1.744605, -2.868908, 0.2235294, 1, 0, 1,
-0.5515767, -0.1139308, -2.873079, 0.2196078, 1, 0, 1,
-0.5508536, -0.3642077, -1.916202, 0.2117647, 1, 0, 1,
-0.549144, 1.118225, -0.4209158, 0.2078431, 1, 0, 1,
-0.5403225, 0.8153081, -0.8428093, 0.2, 1, 0, 1,
-0.529828, 1.218168, 1.533618, 0.1921569, 1, 0, 1,
-0.5208632, -1.872678, -4.409143, 0.1882353, 1, 0, 1,
-0.5157176, -1.30595, -4.238307, 0.1803922, 1, 0, 1,
-0.5153686, 0.6273971, -0.243392, 0.1764706, 1, 0, 1,
-0.5140998, -0.9507488, -3.145333, 0.1686275, 1, 0, 1,
-0.5130523, 1.103224, 1.855407, 0.1647059, 1, 0, 1,
-0.51261, -0.595232, -2.536723, 0.1568628, 1, 0, 1,
-0.5110313, -0.7286649, -3.025908, 0.1529412, 1, 0, 1,
-0.5103412, -0.0008131789, -0.9325421, 0.145098, 1, 0, 1,
-0.5038784, -1.235451, -1.303511, 0.1411765, 1, 0, 1,
-0.5017357, 1.293962, 0.1097138, 0.1333333, 1, 0, 1,
-0.4996935, -0.08748791, -0.2943256, 0.1294118, 1, 0, 1,
-0.489415, -0.1394151, -2.567357, 0.1215686, 1, 0, 1,
-0.4831719, -0.6365867, -2.512689, 0.1176471, 1, 0, 1,
-0.4817313, -0.07680163, -2.845928, 0.1098039, 1, 0, 1,
-0.4783022, -0.8023341, -3.698672, 0.1058824, 1, 0, 1,
-0.4773739, 0.5141339, 0.3632362, 0.09803922, 1, 0, 1,
-0.476168, 0.07796045, -0.6184295, 0.09019608, 1, 0, 1,
-0.4757298, 0.193288, -1.833199, 0.08627451, 1, 0, 1,
-0.4719959, 1.291239, -1.463239, 0.07843138, 1, 0, 1,
-0.4707477, -0.2316559, -2.015271, 0.07450981, 1, 0, 1,
-0.4704938, 0.8051223, 0.694536, 0.06666667, 1, 0, 1,
-0.4686499, 0.202679, -0.9115764, 0.0627451, 1, 0, 1,
-0.4675533, 0.5605452, -0.8085645, 0.05490196, 1, 0, 1,
-0.4662523, -0.4242326, -1.558914, 0.05098039, 1, 0, 1,
-0.4649234, 0.1723241, -1.183716, 0.04313726, 1, 0, 1,
-0.4642933, -0.6386468, -1.558668, 0.03921569, 1, 0, 1,
-0.4631691, -1.4303, -3.227213, 0.03137255, 1, 0, 1,
-0.4602099, -0.8946996, -3.718267, 0.02745098, 1, 0, 1,
-0.4600233, -1.190793, -4.59491, 0.01960784, 1, 0, 1,
-0.4536401, 0.4293605, -1.11346, 0.01568628, 1, 0, 1,
-0.4515961, 0.603419, -0.9799718, 0.007843138, 1, 0, 1,
-0.444387, -0.9900438, -1.013313, 0.003921569, 1, 0, 1,
-0.4303175, 1.075924, 0.03663014, 0, 1, 0.003921569, 1,
-0.4294888, -0.7853796, -3.307257, 0, 1, 0.01176471, 1,
-0.4242597, 0.1438261, -2.505586, 0, 1, 0.01568628, 1,
-0.4139841, 0.3723462, -0.6421931, 0, 1, 0.02352941, 1,
-0.4121848, -0.4287289, -3.524183, 0, 1, 0.02745098, 1,
-0.4080956, 0.1356509, -1.30041, 0, 1, 0.03529412, 1,
-0.407565, 1.513071, 0.3771626, 0, 1, 0.03921569, 1,
-0.4019268, -1.250702, -3.907785, 0, 1, 0.04705882, 1,
-0.4017818, 0.2543424, -1.014344, 0, 1, 0.05098039, 1,
-0.3986748, 1.125253, -0.7410382, 0, 1, 0.05882353, 1,
-0.3974523, 1.117554, -0.08147424, 0, 1, 0.0627451, 1,
-0.3870481, 0.9091394, 0.08513526, 0, 1, 0.07058824, 1,
-0.3841947, -0.5063317, -1.721535, 0, 1, 0.07450981, 1,
-0.383947, 0.1456895, -1.194023, 0, 1, 0.08235294, 1,
-0.3814669, -1.563842, -3.634687, 0, 1, 0.08627451, 1,
-0.3806089, -0.1753429, -1.633915, 0, 1, 0.09411765, 1,
-0.3776884, 0.4168192, -2.106719, 0, 1, 0.1019608, 1,
-0.3757454, -0.1103742, -2.566634, 0, 1, 0.1058824, 1,
-0.3740529, -0.02385891, -2.658037, 0, 1, 0.1137255, 1,
-0.3722402, 0.8363542, 1.502367, 0, 1, 0.1176471, 1,
-0.3674249, 0.005346519, -1.974476, 0, 1, 0.1254902, 1,
-0.3608413, -1.280186, -3.681583, 0, 1, 0.1294118, 1,
-0.3599084, -1.114025, -2.398767, 0, 1, 0.1372549, 1,
-0.3583538, -0.2112379, -0.6386266, 0, 1, 0.1411765, 1,
-0.3574639, -0.04540906, -2.149913, 0, 1, 0.1490196, 1,
-0.357202, 1.078666, 1.459227, 0, 1, 0.1529412, 1,
-0.3558978, -0.6355963, -3.726349, 0, 1, 0.1607843, 1,
-0.3554778, 0.7636181, -1.585623, 0, 1, 0.1647059, 1,
-0.3477308, -0.4579357, -3.023053, 0, 1, 0.172549, 1,
-0.3406439, -0.3247101, -0.9157364, 0, 1, 0.1764706, 1,
-0.3345163, -0.6987166, -1.504374, 0, 1, 0.1843137, 1,
-0.3336225, 1.202096, 1.063466, 0, 1, 0.1882353, 1,
-0.3335302, 1.958681, 0.002752395, 0, 1, 0.1960784, 1,
-0.3332149, 0.1841385, -0.5963197, 0, 1, 0.2039216, 1,
-0.3271061, 0.7884668, -0.3264908, 0, 1, 0.2078431, 1,
-0.3260762, -0.8255849, -2.59461, 0, 1, 0.2156863, 1,
-0.3221277, -0.3856279, -2.87679, 0, 1, 0.2196078, 1,
-0.3155029, 0.6160187, -1.664342, 0, 1, 0.227451, 1,
-0.3112375, 2.557364, 0.7303415, 0, 1, 0.2313726, 1,
-0.310567, 0.00776167, -2.183996, 0, 1, 0.2392157, 1,
-0.3090115, -0.1249802, -0.6805163, 0, 1, 0.2431373, 1,
-0.3088724, 0.1982322, 1.452649, 0, 1, 0.2509804, 1,
-0.3050029, -0.8501703, -4.010723, 0, 1, 0.254902, 1,
-0.3049344, 0.7700863, -2.25964, 0, 1, 0.2627451, 1,
-0.3041007, 1.335224, -0.09539425, 0, 1, 0.2666667, 1,
-0.2985937, 0.2073766, -1.662619, 0, 1, 0.2745098, 1,
-0.2984254, 0.1292565, -1.532853, 0, 1, 0.2784314, 1,
-0.280551, -0.2262099, 0.2527121, 0, 1, 0.2862745, 1,
-0.2786504, 0.598255, -0.7060832, 0, 1, 0.2901961, 1,
-0.2746058, -2.088564, -2.617559, 0, 1, 0.2980392, 1,
-0.2729345, 0.8356418, 0.1674367, 0, 1, 0.3058824, 1,
-0.2640658, 0.4624521, 0.2264795, 0, 1, 0.3098039, 1,
-0.2581857, -0.5489597, -3.274864, 0, 1, 0.3176471, 1,
-0.2525986, 1.381982, 0.8466868, 0, 1, 0.3215686, 1,
-0.2496326, 1.149407, 0.2608877, 0, 1, 0.3294118, 1,
-0.2467805, 1.626405, 0.9635433, 0, 1, 0.3333333, 1,
-0.2399343, 0.2370991, 0.442353, 0, 1, 0.3411765, 1,
-0.2367277, -0.0504662, -1.66289, 0, 1, 0.345098, 1,
-0.235915, -0.9684286, -2.058124, 0, 1, 0.3529412, 1,
-0.2340451, 0.3840971, -0.3947787, 0, 1, 0.3568628, 1,
-0.2325961, -0.159285, -1.539092, 0, 1, 0.3647059, 1,
-0.2308286, 0.9935035, 0.5124111, 0, 1, 0.3686275, 1,
-0.2298052, 0.2174339, -2.426358, 0, 1, 0.3764706, 1,
-0.2250702, -0.1210239, -0.9728968, 0, 1, 0.3803922, 1,
-0.2242328, 0.9229093, -1.442329, 0, 1, 0.3882353, 1,
-0.2228327, 0.5293473, 0.08397508, 0, 1, 0.3921569, 1,
-0.2201376, 0.08610081, -1.111398, 0, 1, 0.4, 1,
-0.2200204, -0.2917314, -2.774349, 0, 1, 0.4078431, 1,
-0.2198107, 0.8363207, 1.458822, 0, 1, 0.4117647, 1,
-0.2183497, -1.538171, -2.6503, 0, 1, 0.4196078, 1,
-0.2167735, -0.1723112, -3.623252, 0, 1, 0.4235294, 1,
-0.215278, 0.6210934, 0.9011111, 0, 1, 0.4313726, 1,
-0.2144238, -1.002571, -1.877393, 0, 1, 0.4352941, 1,
-0.2118423, 0.8387129, 0.7914838, 0, 1, 0.4431373, 1,
-0.2103554, -1.380105, -3.021636, 0, 1, 0.4470588, 1,
-0.2025009, -0.6770365, -2.697391, 0, 1, 0.454902, 1,
-0.1981804, 0.4463793, 0.05369248, 0, 1, 0.4588235, 1,
-0.19667, -0.1915806, -2.133834, 0, 1, 0.4666667, 1,
-0.1963365, 1.113613, 0.2876481, 0, 1, 0.4705882, 1,
-0.1953788, -0.659695, -4.930355, 0, 1, 0.4784314, 1,
-0.1951545, 1.629728, 0.8086863, 0, 1, 0.4823529, 1,
-0.1919691, 0.307275, -0.9915985, 0, 1, 0.4901961, 1,
-0.1898878, -0.06795183, -2.58917, 0, 1, 0.4941176, 1,
-0.1885383, 0.06520317, -1.521935, 0, 1, 0.5019608, 1,
-0.1875214, -0.9179022, -3.11426, 0, 1, 0.509804, 1,
-0.1837419, -0.8147503, -4.109984, 0, 1, 0.5137255, 1,
-0.178502, 1.519297, -0.2857406, 0, 1, 0.5215687, 1,
-0.1756477, -0.20297, -3.622228, 0, 1, 0.5254902, 1,
-0.1742536, 0.2187948, -0.5955006, 0, 1, 0.5333334, 1,
-0.1717813, 0.9357682, 0.04207136, 0, 1, 0.5372549, 1,
-0.1666117, 0.07576028, -0.5444704, 0, 1, 0.5450981, 1,
-0.163156, 0.1808811, -2.733511, 0, 1, 0.5490196, 1,
-0.1616088, 1.362252, -1.317296, 0, 1, 0.5568628, 1,
-0.1602955, -0.2140611, -2.050611, 0, 1, 0.5607843, 1,
-0.1574654, 0.690213, 0.7175116, 0, 1, 0.5686275, 1,
-0.157106, -0.3595167, -3.323453, 0, 1, 0.572549, 1,
-0.1563957, 1.155163, -0.8800895, 0, 1, 0.5803922, 1,
-0.155981, -0.4461493, -4.451924, 0, 1, 0.5843138, 1,
-0.1554365, -0.2868184, -1.984128, 0, 1, 0.5921569, 1,
-0.152719, 0.449546, -0.8446273, 0, 1, 0.5960785, 1,
-0.143375, 0.7469692, 0.9044631, 0, 1, 0.6039216, 1,
-0.1410229, -0.9719231, -1.417486, 0, 1, 0.6117647, 1,
-0.1398395, -1.058631, -3.910266, 0, 1, 0.6156863, 1,
-0.1388117, -1.588293, -3.340205, 0, 1, 0.6235294, 1,
-0.137002, -0.1160353, -1.606589, 0, 1, 0.627451, 1,
-0.131475, -0.4158615, -1.383634, 0, 1, 0.6352941, 1,
-0.1308741, -1.560323, -2.831489, 0, 1, 0.6392157, 1,
-0.1237483, 1.005851, 0.03674539, 0, 1, 0.6470588, 1,
-0.1226533, 1.137501, -0.1698074, 0, 1, 0.6509804, 1,
-0.1223635, 2.306442, -0.9595553, 0, 1, 0.6588235, 1,
-0.1200793, -2.009178, -3.792285, 0, 1, 0.6627451, 1,
-0.1170913, 0.2421101, 0.03466461, 0, 1, 0.6705883, 1,
-0.1160816, 1.389569, 0.5364701, 0, 1, 0.6745098, 1,
-0.11236, 1.323563, 0.1663001, 0, 1, 0.682353, 1,
-0.1107133, -0.2688949, -3.179746, 0, 1, 0.6862745, 1,
-0.1098625, 0.437644, 0.2325686, 0, 1, 0.6941177, 1,
-0.108062, -0.397846, -1.837996, 0, 1, 0.7019608, 1,
-0.1071688, -2.003247, -4.111255, 0, 1, 0.7058824, 1,
-0.1021424, -0.1784579, -3.023061, 0, 1, 0.7137255, 1,
-0.1010762, 0.294174, -1.112158, 0, 1, 0.7176471, 1,
-0.09542241, 0.688541, 0.7803633, 0, 1, 0.7254902, 1,
-0.08653898, -0.538536, -4.297871, 0, 1, 0.7294118, 1,
-0.08416507, 0.1983249, -0.5787153, 0, 1, 0.7372549, 1,
-0.07540736, -1.246536, -2.484987, 0, 1, 0.7411765, 1,
-0.06126442, -2.095895, -2.244381, 0, 1, 0.7490196, 1,
-0.05818874, 0.1072133, -2.137697, 0, 1, 0.7529412, 1,
-0.05496755, -0.04668161, -2.908562, 0, 1, 0.7607843, 1,
-0.05196846, -2.471236, -3.179435, 0, 1, 0.7647059, 1,
-0.04620479, 0.8952653, -1.319012, 0, 1, 0.772549, 1,
-0.04166982, 1.025832, -0.7587942, 0, 1, 0.7764706, 1,
-0.04122298, -0.1096016, -2.644267, 0, 1, 0.7843137, 1,
-0.03757469, -0.9373859, -2.75207, 0, 1, 0.7882353, 1,
-0.03668958, 1.049381, -0.6255606, 0, 1, 0.7960784, 1,
-0.03551475, -1.075498, -3.788831, 0, 1, 0.8039216, 1,
-0.03143604, 0.8194876, -0.1830215, 0, 1, 0.8078431, 1,
-0.02579805, 0.1045891, -0.5331846, 0, 1, 0.8156863, 1,
-0.02129792, -1.040757, -2.678615, 0, 1, 0.8196079, 1,
-0.01633712, 1.567474, 1.504817, 0, 1, 0.827451, 1,
-0.01287761, 0.6669001, 0.3287731, 0, 1, 0.8313726, 1,
-0.01081439, -0.1778632, -3.228114, 0, 1, 0.8392157, 1,
-0.01058918, -0.2756796, -1.548506, 0, 1, 0.8431373, 1,
-0.00976121, -0.3526535, -2.128531, 0, 1, 0.8509804, 1,
-0.003388782, -0.3293149, -2.745601, 0, 1, 0.854902, 1,
-0.0006145498, -0.210889, -2.211638, 0, 1, 0.8627451, 1,
0.0009674812, 0.3356388, -0.2709277, 0, 1, 0.8666667, 1,
0.008796306, 1.767779, 0.02549705, 0, 1, 0.8745098, 1,
0.009394214, -0.8818421, 2.321773, 0, 1, 0.8784314, 1,
0.009594041, 0.2091582, 0.3170215, 0, 1, 0.8862745, 1,
0.01084791, -0.5733782, 2.286411, 0, 1, 0.8901961, 1,
0.01324366, -0.20876, 2.536871, 0, 1, 0.8980392, 1,
0.01384574, 1.708448, 0.5016347, 0, 1, 0.9058824, 1,
0.01535091, 0.3276212, -1.273652, 0, 1, 0.9098039, 1,
0.01675218, 1.532228, -1.019638, 0, 1, 0.9176471, 1,
0.01815096, 0.1386123, 1.162571, 0, 1, 0.9215686, 1,
0.02278787, 0.9231018, -0.5201396, 0, 1, 0.9294118, 1,
0.02456854, 1.31814, 0.1260372, 0, 1, 0.9333333, 1,
0.02758064, 2.055764, 1.214901, 0, 1, 0.9411765, 1,
0.02971641, 1.214538, 0.4686424, 0, 1, 0.945098, 1,
0.0330279, -1.639219, 2.769369, 0, 1, 0.9529412, 1,
0.0379932, -0.06211394, 1.266327, 0, 1, 0.9568627, 1,
0.04042341, 0.04013444, 1.898547, 0, 1, 0.9647059, 1,
0.04166006, 0.4790507, 0.3625717, 0, 1, 0.9686275, 1,
0.05098629, -0.2782861, 2.698224, 0, 1, 0.9764706, 1,
0.0541067, 0.6901975, -1.150575, 0, 1, 0.9803922, 1,
0.05502871, -0.7343754, 2.822918, 0, 1, 0.9882353, 1,
0.05899029, 0.1022889, 0.6815488, 0, 1, 0.9921569, 1,
0.06275613, -1.778712, 3.696381, 0, 1, 1, 1,
0.0635497, 1.112221, 1.94401, 0, 0.9921569, 1, 1,
0.0636006, 1.008327, 0.219496, 0, 0.9882353, 1, 1,
0.06769811, -0.1509635, 1.426647, 0, 0.9803922, 1, 1,
0.06840914, -0.5129793, 2.92128, 0, 0.9764706, 1, 1,
0.06918507, 0.2819124, -1.273644, 0, 0.9686275, 1, 1,
0.07657793, -0.6619391, 3.916856, 0, 0.9647059, 1, 1,
0.07801332, -0.2276747, 3.492249, 0, 0.9568627, 1, 1,
0.07926872, -0.1071564, 2.37501, 0, 0.9529412, 1, 1,
0.08269254, -0.936788, 0.5003274, 0, 0.945098, 1, 1,
0.09109661, 0.2396549, 0.399749, 0, 0.9411765, 1, 1,
0.09226895, -0.2645457, 1.15532, 0, 0.9333333, 1, 1,
0.09321919, -1.028874, 2.619091, 0, 0.9294118, 1, 1,
0.09698124, -0.9728055, 3.632005, 0, 0.9215686, 1, 1,
0.0984432, -0.102959, 2.473467, 0, 0.9176471, 1, 1,
0.1013359, 0.1112587, 1.730634, 0, 0.9098039, 1, 1,
0.1015038, 0.6247738, 1.737124, 0, 0.9058824, 1, 1,
0.1023822, -0.3711868, 4.466432, 0, 0.8980392, 1, 1,
0.1024788, -0.7722753, 3.863224, 0, 0.8901961, 1, 1,
0.1043051, -0.7946079, 1.974801, 0, 0.8862745, 1, 1,
0.1060627, -0.7818468, 2.212131, 0, 0.8784314, 1, 1,
0.1080774, -0.04508687, 2.028874, 0, 0.8745098, 1, 1,
0.1085892, 1.302409, -1.629254, 0, 0.8666667, 1, 1,
0.1103894, -0.2344918, 1.962864, 0, 0.8627451, 1, 1,
0.110958, -0.3448336, 2.352492, 0, 0.854902, 1, 1,
0.1188635, 2.132357, -1.116311, 0, 0.8509804, 1, 1,
0.1211615, -1.138978, 3.108093, 0, 0.8431373, 1, 1,
0.1214224, 0.08771828, 1.082811, 0, 0.8392157, 1, 1,
0.1281311, 1.346292, 1.082497, 0, 0.8313726, 1, 1,
0.1381678, 0.9322309, 0.2582, 0, 0.827451, 1, 1,
0.1401937, 1.44312, -1.926841, 0, 0.8196079, 1, 1,
0.1426771, 0.8796595, -1.029187, 0, 0.8156863, 1, 1,
0.1480033, 0.1241432, 1.379298, 0, 0.8078431, 1, 1,
0.1481242, -0.00999105, 0.678824, 0, 0.8039216, 1, 1,
0.150198, -0.8070024, 3.791068, 0, 0.7960784, 1, 1,
0.154954, 1.732563, -0.2475819, 0, 0.7882353, 1, 1,
0.1560612, 0.1251809, 1.366837, 0, 0.7843137, 1, 1,
0.1586972, 0.5687798, 0.4672197, 0, 0.7764706, 1, 1,
0.1604341, -0.6467356, 3.5319, 0, 0.772549, 1, 1,
0.1630857, -0.9168262, 3.035813, 0, 0.7647059, 1, 1,
0.1632488, -0.07614937, 2.629719, 0, 0.7607843, 1, 1,
0.1635197, -2.385952, 3.86763, 0, 0.7529412, 1, 1,
0.1669026, -0.8528439, 2.351738, 0, 0.7490196, 1, 1,
0.1676121, 1.620112, -1.210263, 0, 0.7411765, 1, 1,
0.1677969, 1.433775, -0.7318023, 0, 0.7372549, 1, 1,
0.1678271, 0.944998, 0.1566627, 0, 0.7294118, 1, 1,
0.1772031, -0.8513501, 2.148947, 0, 0.7254902, 1, 1,
0.1772384, -0.2215996, -0.07999244, 0, 0.7176471, 1, 1,
0.1778461, 0.683118, 0.8728587, 0, 0.7137255, 1, 1,
0.1797376, 0.1046189, 1.320764, 0, 0.7058824, 1, 1,
0.1849588, 0.640445, 1.123685, 0, 0.6980392, 1, 1,
0.1891385, 0.647767, 0.169686, 0, 0.6941177, 1, 1,
0.1911707, -0.5553022, 0.7248962, 0, 0.6862745, 1, 1,
0.1932552, 0.2868965, 0.9667565, 0, 0.682353, 1, 1,
0.1938362, 0.762987, 0.6740088, 0, 0.6745098, 1, 1,
0.2022621, 1.170453, 0.3641829, 0, 0.6705883, 1, 1,
0.2032537, 0.4914291, -0.1602661, 0, 0.6627451, 1, 1,
0.209892, -1.738795, 1.528427, 0, 0.6588235, 1, 1,
0.2173624, 0.8784018, 0.02195779, 0, 0.6509804, 1, 1,
0.2213556, -0.3053026, 3.45316, 0, 0.6470588, 1, 1,
0.2214549, 1.617617, -0.2886036, 0, 0.6392157, 1, 1,
0.2224189, -0.6002359, 4.686893, 0, 0.6352941, 1, 1,
0.228664, -0.08360108, 0.8240331, 0, 0.627451, 1, 1,
0.2289174, 0.1387072, 0.8687071, 0, 0.6235294, 1, 1,
0.2301046, 2.887198, 0.6283379, 0, 0.6156863, 1, 1,
0.2311638, 0.1391226, 0.1077467, 0, 0.6117647, 1, 1,
0.2320298, 1.541642, -0.5693243, 0, 0.6039216, 1, 1,
0.2354924, -1.516706, 2.48606, 0, 0.5960785, 1, 1,
0.2361631, 0.5821402, -0.8939152, 0, 0.5921569, 1, 1,
0.2414643, -1.119133, 3.248581, 0, 0.5843138, 1, 1,
0.2453607, 1.097657, 0.1771827, 0, 0.5803922, 1, 1,
0.2510654, -0.8496826, 1.545091, 0, 0.572549, 1, 1,
0.2548046, 1.048168, 0.3917646, 0, 0.5686275, 1, 1,
0.25872, -0.618134, 4.098094, 0, 0.5607843, 1, 1,
0.2612164, -1.024927, 3.506765, 0, 0.5568628, 1, 1,
0.2628886, 1.867946, -0.4088818, 0, 0.5490196, 1, 1,
0.2644094, 0.4943987, -0.7902192, 0, 0.5450981, 1, 1,
0.2685918, -0.5141935, 4.506581, 0, 0.5372549, 1, 1,
0.2727281, 0.4019662, 2.107907, 0, 0.5333334, 1, 1,
0.2811616, -0.7163193, 2.526086, 0, 0.5254902, 1, 1,
0.2824658, 1.319983, 1.30434, 0, 0.5215687, 1, 1,
0.2873729, -2.453708, 2.460652, 0, 0.5137255, 1, 1,
0.2925781, 1.225359, -1.786767, 0, 0.509804, 1, 1,
0.2930304, 1.394427, 1.613308, 0, 0.5019608, 1, 1,
0.2988732, -0.8165021, 2.246341, 0, 0.4941176, 1, 1,
0.2993467, 1.151464, 0.4098826, 0, 0.4901961, 1, 1,
0.3024763, 0.8945705, 0.08975724, 0, 0.4823529, 1, 1,
0.3030685, 0.5814623, 1.465035, 0, 0.4784314, 1, 1,
0.312266, -1.398438, 3.542495, 0, 0.4705882, 1, 1,
0.3144669, 0.9634363, -1.596114, 0, 0.4666667, 1, 1,
0.3154353, -0.1057495, 2.236111, 0, 0.4588235, 1, 1,
0.3167595, -0.5401462, 3.03109, 0, 0.454902, 1, 1,
0.3215377, 0.5263816, 0.5370896, 0, 0.4470588, 1, 1,
0.3233266, 0.1351826, 2.150015, 0, 0.4431373, 1, 1,
0.325599, -1.065076, 2.350227, 0, 0.4352941, 1, 1,
0.3274454, 0.2903804, 0.8754327, 0, 0.4313726, 1, 1,
0.3275022, 1.873752, -0.2736974, 0, 0.4235294, 1, 1,
0.3280666, 1.269507, -0.2303057, 0, 0.4196078, 1, 1,
0.3284279, 1.007436, 0.2332166, 0, 0.4117647, 1, 1,
0.3338113, -1.192987, 3.266146, 0, 0.4078431, 1, 1,
0.33413, 1.009308, -1.089981, 0, 0.4, 1, 1,
0.3372047, -0.2439396, 1.96465, 0, 0.3921569, 1, 1,
0.3493259, -0.6021636, 0.4516783, 0, 0.3882353, 1, 1,
0.3501698, 0.8957821, 1.037356, 0, 0.3803922, 1, 1,
0.3531818, 0.04890508, 2.670794, 0, 0.3764706, 1, 1,
0.3587904, 2.49931, -0.9702247, 0, 0.3686275, 1, 1,
0.3595007, -0.0675879, -0.4759906, 0, 0.3647059, 1, 1,
0.361657, 0.005966494, 3.110888, 0, 0.3568628, 1, 1,
0.363668, -0.2723017, 0.1796968, 0, 0.3529412, 1, 1,
0.367121, -0.7346355, 2.902493, 0, 0.345098, 1, 1,
0.3695326, -0.8865057, 4.119562, 0, 0.3411765, 1, 1,
0.3700675, 0.6033177, 0.3057678, 0, 0.3333333, 1, 1,
0.373951, -0.432604, 2.786438, 0, 0.3294118, 1, 1,
0.3815373, 1.201479, -0.7707506, 0, 0.3215686, 1, 1,
0.3880382, -0.603623, 1.804618, 0, 0.3176471, 1, 1,
0.3948788, -0.2658831, 1.878045, 0, 0.3098039, 1, 1,
0.3959408, -1.253198, 3.739701, 0, 0.3058824, 1, 1,
0.3976395, -2.572357, 2.036741, 0, 0.2980392, 1, 1,
0.4024995, 0.5273854, 0.3959612, 0, 0.2901961, 1, 1,
0.4028763, 0.358495, 0.2265699, 0, 0.2862745, 1, 1,
0.4096646, 0.6148414, 0.829914, 0, 0.2784314, 1, 1,
0.4100646, 0.705101, 3.09163, 0, 0.2745098, 1, 1,
0.4181794, -1.093168, 1.90353, 0, 0.2666667, 1, 1,
0.4209646, 0.6679819, 1.308292, 0, 0.2627451, 1, 1,
0.4219497, -1.563082, 1.089119, 0, 0.254902, 1, 1,
0.4238525, 0.2675012, -0.1833562, 0, 0.2509804, 1, 1,
0.4261827, -0.2462354, 4.327045, 0, 0.2431373, 1, 1,
0.4284197, -1.210139, 2.54619, 0, 0.2392157, 1, 1,
0.4308308, 2.517672, -0.2173189, 0, 0.2313726, 1, 1,
0.4336857, 1.345753, 0.3058319, 0, 0.227451, 1, 1,
0.4357483, -0.1592302, 1.811833, 0, 0.2196078, 1, 1,
0.4433859, 0.1125733, 0.8583038, 0, 0.2156863, 1, 1,
0.4452617, -0.7138526, 2.735337, 0, 0.2078431, 1, 1,
0.4456888, 0.4869522, 0.3462017, 0, 0.2039216, 1, 1,
0.4473516, -0.6454207, 2.959769, 0, 0.1960784, 1, 1,
0.4501679, 1.199832, 0.4588313, 0, 0.1882353, 1, 1,
0.4506754, -1.112902, 3.863421, 0, 0.1843137, 1, 1,
0.454102, -0.5824356, 2.646699, 0, 0.1764706, 1, 1,
0.4542012, 0.4957434, 0.4937003, 0, 0.172549, 1, 1,
0.4562237, -0.2066499, 2.925127, 0, 0.1647059, 1, 1,
0.4575001, 1.130363, -0.07899166, 0, 0.1607843, 1, 1,
0.458048, -0.2396359, 2.675559, 0, 0.1529412, 1, 1,
0.459327, 0.3528517, -1.279655, 0, 0.1490196, 1, 1,
0.4634852, 0.4190795, 2.157476, 0, 0.1411765, 1, 1,
0.463857, -0.9185339, 1.568867, 0, 0.1372549, 1, 1,
0.4648534, -0.1553264, 1.617206, 0, 0.1294118, 1, 1,
0.4662706, -1.559269, 1.820809, 0, 0.1254902, 1, 1,
0.4662909, 1.630187, -2.605404, 0, 0.1176471, 1, 1,
0.4679351, 0.2884771, 1.253985, 0, 0.1137255, 1, 1,
0.471939, -0.7454908, 3.341901, 0, 0.1058824, 1, 1,
0.4745579, 0.5366466, 1.712699, 0, 0.09803922, 1, 1,
0.4746509, 1.15302, 0.9965671, 0, 0.09411765, 1, 1,
0.4757796, 0.6254022, 0.7699363, 0, 0.08627451, 1, 1,
0.4818137, 1.268352, 1.732702, 0, 0.08235294, 1, 1,
0.4845856, 0.1893636, 1.316771, 0, 0.07450981, 1, 1,
0.4850433, 0.1540839, 1.226525, 0, 0.07058824, 1, 1,
0.492078, 1.763696, 0.3177433, 0, 0.0627451, 1, 1,
0.4930329, 1.230348, 0.9407765, 0, 0.05882353, 1, 1,
0.497199, -1.720871, 3.638014, 0, 0.05098039, 1, 1,
0.4980178, -0.4013779, 4.894547, 0, 0.04705882, 1, 1,
0.4991561, -0.02320441, 1.291572, 0, 0.03921569, 1, 1,
0.501877, 2.103204, 0.8728274, 0, 0.03529412, 1, 1,
0.5033749, -0.05443789, 1.294231, 0, 0.02745098, 1, 1,
0.5048194, -1.150463, 3.360282, 0, 0.02352941, 1, 1,
0.5078855, -0.08515602, 1.435496, 0, 0.01568628, 1, 1,
0.5093724, 0.1367978, 2.937159, 0, 0.01176471, 1, 1,
0.517801, 2.089881, 0.1428209, 0, 0.003921569, 1, 1,
0.521365, -0.7622559, 2.246946, 0.003921569, 0, 1, 1,
0.5242594, -0.001152894, 2.014695, 0.007843138, 0, 1, 1,
0.533963, -0.07650993, 1.989314, 0.01568628, 0, 1, 1,
0.5423462, -2.201381, 2.748906, 0.01960784, 0, 1, 1,
0.5457543, 0.5979583, 0.5728411, 0.02745098, 0, 1, 1,
0.5459501, 1.43365, -0.3037705, 0.03137255, 0, 1, 1,
0.5495846, -0.5777175, 2.326043, 0.03921569, 0, 1, 1,
0.5533844, 0.4722063, 1.309935, 0.04313726, 0, 1, 1,
0.553588, -1.455895, 3.258571, 0.05098039, 0, 1, 1,
0.5566863, 0.5627081, 1.94084, 0.05490196, 0, 1, 1,
0.5573088, 0.6900638, -1.990626, 0.0627451, 0, 1, 1,
0.5582393, 0.8058462, 1.511131, 0.06666667, 0, 1, 1,
0.561987, 0.7810004, 0.3813446, 0.07450981, 0, 1, 1,
0.5635188, 0.9660577, 1.513356, 0.07843138, 0, 1, 1,
0.5650392, 0.2157325, 1.028348, 0.08627451, 0, 1, 1,
0.5682254, 0.3083375, 1.721291, 0.09019608, 0, 1, 1,
0.5688043, 0.2046631, 0.472603, 0.09803922, 0, 1, 1,
0.5699569, 0.11299, 1.461334, 0.1058824, 0, 1, 1,
0.5738813, 1.809772, 0.4825008, 0.1098039, 0, 1, 1,
0.5787222, 0.469333, -0.02998666, 0.1176471, 0, 1, 1,
0.5844387, -0.3173026, 1.447806, 0.1215686, 0, 1, 1,
0.5860154, 0.6164864, 1.266402, 0.1294118, 0, 1, 1,
0.5863723, -0.52226, 4.099406, 0.1333333, 0, 1, 1,
0.5890969, 0.3509834, -0.8306198, 0.1411765, 0, 1, 1,
0.5892696, -0.7259791, 2.456003, 0.145098, 0, 1, 1,
0.5945963, -0.3401288, 3.366459, 0.1529412, 0, 1, 1,
0.5990639, -0.2988113, 2.605824, 0.1568628, 0, 1, 1,
0.6043962, 0.9983143, 0.7028959, 0.1647059, 0, 1, 1,
0.6076623, 0.6725976, 2.212742, 0.1686275, 0, 1, 1,
0.6094157, -1.170506, 2.276179, 0.1764706, 0, 1, 1,
0.6162984, 2.319568, 1.183765, 0.1803922, 0, 1, 1,
0.6197302, -0.2698385, 2.298929, 0.1882353, 0, 1, 1,
0.6209939, 1.157355, 0.2182842, 0.1921569, 0, 1, 1,
0.6250225, -0.4399773, 1.150923, 0.2, 0, 1, 1,
0.6254312, -0.2531678, 1.776279, 0.2078431, 0, 1, 1,
0.6266539, 0.7319434, -0.9569706, 0.2117647, 0, 1, 1,
0.6287637, 0.6476268, 0.5750543, 0.2196078, 0, 1, 1,
0.6295419, -0.4745257, 3.042482, 0.2235294, 0, 1, 1,
0.6352022, -0.8197575, 1.141709, 0.2313726, 0, 1, 1,
0.6356757, -0.208493, 2.780854, 0.2352941, 0, 1, 1,
0.6411906, 0.9110051, 1.698141, 0.2431373, 0, 1, 1,
0.6492077, -1.574039, 3.917792, 0.2470588, 0, 1, 1,
0.6505008, 0.3651367, 1.762798, 0.254902, 0, 1, 1,
0.6648251, 0.01707928, 1.529961, 0.2588235, 0, 1, 1,
0.6681263, -1.085935, 4.293617, 0.2666667, 0, 1, 1,
0.6683519, 0.6085538, 1.418432, 0.2705882, 0, 1, 1,
0.6709015, 1.554906, 0.6104059, 0.2784314, 0, 1, 1,
0.6855864, 0.7746182, 1.1805, 0.282353, 0, 1, 1,
0.6860538, 1.058064, 0.8507448, 0.2901961, 0, 1, 1,
0.6877352, -0.4779166, 4.141447, 0.2941177, 0, 1, 1,
0.6888574, 0.1265375, 0.7785926, 0.3019608, 0, 1, 1,
0.6911231, 0.9440504, 0.05111287, 0.3098039, 0, 1, 1,
0.6917894, -0.737096, 3.071398, 0.3137255, 0, 1, 1,
0.6919436, -0.7766259, 3.597957, 0.3215686, 0, 1, 1,
0.6929263, -0.05967952, 0.3637777, 0.3254902, 0, 1, 1,
0.7035162, 0.8885072, -0.05755425, 0.3333333, 0, 1, 1,
0.7053204, 0.9171474, 2.638919, 0.3372549, 0, 1, 1,
0.7071849, -0.5614824, 1.738252, 0.345098, 0, 1, 1,
0.7088782, 0.07044205, 1.549937, 0.3490196, 0, 1, 1,
0.7123516, -0.9266534, 1.686268, 0.3568628, 0, 1, 1,
0.712382, 1.205701, 0.01200999, 0.3607843, 0, 1, 1,
0.7137085, -0.8530237, 3.240944, 0.3686275, 0, 1, 1,
0.716501, 0.5652638, 0.6058681, 0.372549, 0, 1, 1,
0.7166257, -0.01214486, 1.515193, 0.3803922, 0, 1, 1,
0.7222901, 0.577347, 1.922865, 0.3843137, 0, 1, 1,
0.723793, 0.2475021, 0.8276227, 0.3921569, 0, 1, 1,
0.7245778, -0.5651088, 2.194095, 0.3960784, 0, 1, 1,
0.7246524, 1.094154, 0.07685874, 0.4039216, 0, 1, 1,
0.7297032, -0.6859978, 0.9470121, 0.4117647, 0, 1, 1,
0.7366492, 0.6696667, -0.5994083, 0.4156863, 0, 1, 1,
0.7377525, 0.2309054, 2.726231, 0.4235294, 0, 1, 1,
0.7400566, 0.3592121, 0.08456552, 0.427451, 0, 1, 1,
0.7401342, 1.358719, 0.5937626, 0.4352941, 0, 1, 1,
0.7427863, -0.3041185, 0.905151, 0.4392157, 0, 1, 1,
0.7462693, 0.3480649, 2.696633, 0.4470588, 0, 1, 1,
0.7476986, -0.3912409, 2.839952, 0.4509804, 0, 1, 1,
0.7477667, -2.050639, 2.529345, 0.4588235, 0, 1, 1,
0.7504347, 2.809719, -0.821303, 0.4627451, 0, 1, 1,
0.7520339, -0.1498044, 1.044419, 0.4705882, 0, 1, 1,
0.7524202, -0.7760258, 3.435712, 0.4745098, 0, 1, 1,
0.7544388, -0.7152734, 2.807245, 0.4823529, 0, 1, 1,
0.7555016, -0.1389647, 2.075378, 0.4862745, 0, 1, 1,
0.759172, -0.5309824, 4.113811, 0.4941176, 0, 1, 1,
0.7622421, -0.2934017, 3.643035, 0.5019608, 0, 1, 1,
0.7624342, -1.338566, 3.349302, 0.5058824, 0, 1, 1,
0.763533, 1.00158, -0.3428625, 0.5137255, 0, 1, 1,
0.769138, -0.3544706, 4.688854, 0.5176471, 0, 1, 1,
0.7742036, 0.9950249, 0.9253057, 0.5254902, 0, 1, 1,
0.7751766, 0.3658958, 1.151041, 0.5294118, 0, 1, 1,
0.7758937, 1.206422, 0.4891205, 0.5372549, 0, 1, 1,
0.7877826, -0.59124, 2.95242, 0.5411765, 0, 1, 1,
0.7966271, -0.6934999, 1.977518, 0.5490196, 0, 1, 1,
0.7969886, 0.9327575, 0.7324303, 0.5529412, 0, 1, 1,
0.7974768, -0.6696088, 1.719987, 0.5607843, 0, 1, 1,
0.7977, 0.1586831, 1.216552, 0.5647059, 0, 1, 1,
0.8009135, 0.4003745, 1.447724, 0.572549, 0, 1, 1,
0.8069757, 1.039809, -0.6384478, 0.5764706, 0, 1, 1,
0.8118846, 0.5796618, 1.456774, 0.5843138, 0, 1, 1,
0.8145144, 0.5819577, 1.728566, 0.5882353, 0, 1, 1,
0.8210064, 0.8736456, -0.730767, 0.5960785, 0, 1, 1,
0.8285198, 0.4297197, 2.294693, 0.6039216, 0, 1, 1,
0.8402552, -0.5134493, 1.337587, 0.6078432, 0, 1, 1,
0.8466905, -0.9922309, 2.58216, 0.6156863, 0, 1, 1,
0.8468666, 0.7594101, 2.096543, 0.6196079, 0, 1, 1,
0.8506594, -0.03140584, 3.195775, 0.627451, 0, 1, 1,
0.8511396, 2.803447, -0.6399608, 0.6313726, 0, 1, 1,
0.8520338, 0.4510843, 1.429999, 0.6392157, 0, 1, 1,
0.8524552, -1.360107, 2.410393, 0.6431373, 0, 1, 1,
0.8529898, 1.276069, 0.876783, 0.6509804, 0, 1, 1,
0.8552414, 0.0001939469, 1.679464, 0.654902, 0, 1, 1,
0.8645841, -2.626412, 2.232497, 0.6627451, 0, 1, 1,
0.8650829, 1.613197, 0.3283738, 0.6666667, 0, 1, 1,
0.865131, 0.9028021, 0.640772, 0.6745098, 0, 1, 1,
0.8681013, 1.398155, 0.01780018, 0.6784314, 0, 1, 1,
0.8762672, -1.179629, 1.431974, 0.6862745, 0, 1, 1,
0.8824342, 0.612528, 1.551957, 0.6901961, 0, 1, 1,
0.8830209, 2.545417, -0.05840717, 0.6980392, 0, 1, 1,
0.8939305, -1.379981, 4.079066, 0.7058824, 0, 1, 1,
0.8947623, -1.131801, 3.801338, 0.7098039, 0, 1, 1,
0.8963795, 0.8183111, 1.135841, 0.7176471, 0, 1, 1,
0.8983082, 1.696263, -1.23205, 0.7215686, 0, 1, 1,
0.9050639, 0.9311808, 2.22323, 0.7294118, 0, 1, 1,
0.9056049, 2.379436, -0.455828, 0.7333333, 0, 1, 1,
0.9057731, -1.865454, 2.466583, 0.7411765, 0, 1, 1,
0.9080909, 1.008142, 1.989303, 0.7450981, 0, 1, 1,
0.9087598, 1.522848, 0.7564805, 0.7529412, 0, 1, 1,
0.9174761, 0.3297712, 1.591201, 0.7568628, 0, 1, 1,
0.9180689, 0.2033231, 2.856569, 0.7647059, 0, 1, 1,
0.9186601, -0.9280511, 0.8647868, 0.7686275, 0, 1, 1,
0.920104, -0.3113909, 3.212572, 0.7764706, 0, 1, 1,
0.9207392, 0.09659935, 0.7668328, 0.7803922, 0, 1, 1,
0.9213966, 0.9115613, 0.5508808, 0.7882353, 0, 1, 1,
0.9266656, -0.5739518, 1.608485, 0.7921569, 0, 1, 1,
0.9275184, 0.6542304, -0.07259646, 0.8, 0, 1, 1,
0.9296035, 0.785064, 0.3342671, 0.8078431, 0, 1, 1,
0.9311634, -0.6627126, 3.467465, 0.8117647, 0, 1, 1,
0.9317085, 0.1208702, 1.920449, 0.8196079, 0, 1, 1,
0.9335579, -0.01733329, 1.57436, 0.8235294, 0, 1, 1,
0.9384065, -0.4240218, 2.002885, 0.8313726, 0, 1, 1,
0.9484566, 1.106609, 0.7696969, 0.8352941, 0, 1, 1,
0.95333, -0.07033926, 1.58356, 0.8431373, 0, 1, 1,
0.9576733, -0.5373654, 1.260961, 0.8470588, 0, 1, 1,
0.9592032, -1.444403, 2.043816, 0.854902, 0, 1, 1,
0.9618121, 0.4662117, 1.420744, 0.8588235, 0, 1, 1,
0.9666598, 1.851217, 0.5268768, 0.8666667, 0, 1, 1,
0.975817, 1.488843, -0.2753208, 0.8705882, 0, 1, 1,
0.9790202, 0.8881549, 0.7030541, 0.8784314, 0, 1, 1,
0.9796031, 1.326369, -0.9690557, 0.8823529, 0, 1, 1,
0.9801615, 0.8449594, 1.261429, 0.8901961, 0, 1, 1,
0.9856318, -0.3291695, 2.609065, 0.8941177, 0, 1, 1,
0.9882241, -0.6291566, 2.908764, 0.9019608, 0, 1, 1,
1.003348, 1.758816, 1.153391, 0.9098039, 0, 1, 1,
1.007301, 0.5742983, 0.3931452, 0.9137255, 0, 1, 1,
1.008591, -0.8249604, 2.466018, 0.9215686, 0, 1, 1,
1.012333, 1.060974, 0.8017817, 0.9254902, 0, 1, 1,
1.016667, -0.3426385, 1.283121, 0.9333333, 0, 1, 1,
1.021596, -2.292187, 3.435113, 0.9372549, 0, 1, 1,
1.027088, -0.8994034, 2.957076, 0.945098, 0, 1, 1,
1.028189, -0.2094698, 1.452938, 0.9490196, 0, 1, 1,
1.033997, -0.673159, -0.1517193, 0.9568627, 0, 1, 1,
1.034667, 0.1169261, 1.852901, 0.9607843, 0, 1, 1,
1.036108, -1.435031, 2.896998, 0.9686275, 0, 1, 1,
1.043463, -0.1542035, 3.270342, 0.972549, 0, 1, 1,
1.04433, 0.4904635, -0.3240812, 0.9803922, 0, 1, 1,
1.046239, -0.527804, 2.725741, 0.9843137, 0, 1, 1,
1.047148, -0.005171728, -0.07072443, 0.9921569, 0, 1, 1,
1.047585, 1.666264, 0.6675751, 0.9960784, 0, 1, 1,
1.048615, -0.4925573, 1.569897, 1, 0, 0.9960784, 1,
1.048799, 0.07649603, 1.263012, 1, 0, 0.9882353, 1,
1.052863, 0.02000723, 0.9944606, 1, 0, 0.9843137, 1,
1.059891, 0.6106323, 0.6773674, 1, 0, 0.9764706, 1,
1.061051, 0.3139923, 1.073976, 1, 0, 0.972549, 1,
1.062974, -0.1795458, -0.4322901, 1, 0, 0.9647059, 1,
1.066043, 1.20876, 0.0674376, 1, 0, 0.9607843, 1,
1.067814, 0.2494091, 2.041676, 1, 0, 0.9529412, 1,
1.076649, -0.9453518, 3.349962, 1, 0, 0.9490196, 1,
1.080531, 1.042879, -1.139983, 1, 0, 0.9411765, 1,
1.080703, 0.6316809, 2.218087, 1, 0, 0.9372549, 1,
1.087708, 0.6977433, 0.05974252, 1, 0, 0.9294118, 1,
1.090254, 0.4853047, 0.3820325, 1, 0, 0.9254902, 1,
1.095544, -0.4762241, 1.739823, 1, 0, 0.9176471, 1,
1.097035, 0.4385561, 0.3169152, 1, 0, 0.9137255, 1,
1.11501, 0.8598226, 0.6221336, 1, 0, 0.9058824, 1,
1.119555, -0.5879375, 2.130453, 1, 0, 0.9019608, 1,
1.119645, 0.9063605, 0.8507047, 1, 0, 0.8941177, 1,
1.121301, 0.2983643, 1.1644, 1, 0, 0.8862745, 1,
1.122278, -0.4705284, 1.120836, 1, 0, 0.8823529, 1,
1.124423, 0.1766872, 1.239906, 1, 0, 0.8745098, 1,
1.127052, 1.034441, 1.124804, 1, 0, 0.8705882, 1,
1.127322, 0.6902648, 2.083707, 1, 0, 0.8627451, 1,
1.129635, -0.1543484, 0.5682856, 1, 0, 0.8588235, 1,
1.13487, 1.499916, -0.9076434, 1, 0, 0.8509804, 1,
1.137839, -1.978406, 3.062767, 1, 0, 0.8470588, 1,
1.143558, -0.5914639, 1.740166, 1, 0, 0.8392157, 1,
1.143869, 1.100368, 2.401107, 1, 0, 0.8352941, 1,
1.145128, 1.170821, 1.140125, 1, 0, 0.827451, 1,
1.148146, 1.298942, 1.949016, 1, 0, 0.8235294, 1,
1.148319, 0.07393661, 0.817543, 1, 0, 0.8156863, 1,
1.152658, 0.09874412, 1.294903, 1, 0, 0.8117647, 1,
1.152988, -1.494886, 2.520576, 1, 0, 0.8039216, 1,
1.157458, -0.1359557, 1.686255, 1, 0, 0.7960784, 1,
1.160378, 1.336248, 0.6522799, 1, 0, 0.7921569, 1,
1.160986, -1.237062, 0.8645244, 1, 0, 0.7843137, 1,
1.173975, -1.018536, 1.076628, 1, 0, 0.7803922, 1,
1.18752, 2.112176, -0.7456536, 1, 0, 0.772549, 1,
1.189368, -0.6578112, 1.822888, 1, 0, 0.7686275, 1,
1.193815, 0.09396093, 1.53209, 1, 0, 0.7607843, 1,
1.195415, -0.9705723, 2.687151, 1, 0, 0.7568628, 1,
1.217427, -0.09695466, 0.1547792, 1, 0, 0.7490196, 1,
1.221008, 0.5014812, 0.8555328, 1, 0, 0.7450981, 1,
1.234157, 0.7377151, 1.591894, 1, 0, 0.7372549, 1,
1.236527, 0.177754, 0.0691391, 1, 0, 0.7333333, 1,
1.243786, 1.341601, 1.656388, 1, 0, 0.7254902, 1,
1.252282, 1.492242, 0.9121495, 1, 0, 0.7215686, 1,
1.258211, -0.9649508, 1.862511, 1, 0, 0.7137255, 1,
1.2612, 2.195529, -0.5986434, 1, 0, 0.7098039, 1,
1.261896, 1.332445, 0.4025257, 1, 0, 0.7019608, 1,
1.274387, -0.2575954, 1.958314, 1, 0, 0.6941177, 1,
1.277637, -0.1054562, 1.548631, 1, 0, 0.6901961, 1,
1.279205, 2.64478, -1.420638, 1, 0, 0.682353, 1,
1.281537, -0.6425797, 0.7918065, 1, 0, 0.6784314, 1,
1.284338, 0.05605831, 0.9669874, 1, 0, 0.6705883, 1,
1.287238, -0.8294314, 3.484962, 1, 0, 0.6666667, 1,
1.288898, 0.2197231, 1.689879, 1, 0, 0.6588235, 1,
1.294168, 0.8041157, 2.6639, 1, 0, 0.654902, 1,
1.30511, 0.01151061, 2.249046, 1, 0, 0.6470588, 1,
1.308233, -0.06000241, 0.7996482, 1, 0, 0.6431373, 1,
1.320877, 1.662647, 2.15825, 1, 0, 0.6352941, 1,
1.322474, -1.459651, 1.172847, 1, 0, 0.6313726, 1,
1.325231, 1.10548, -1.160624, 1, 0, 0.6235294, 1,
1.328833, -2.416875, 2.753662, 1, 0, 0.6196079, 1,
1.332441, 0.05597537, 0.3156523, 1, 0, 0.6117647, 1,
1.332818, 2.137886, -1.960691, 1, 0, 0.6078432, 1,
1.334305, -1.299036, 3.303984, 1, 0, 0.6, 1,
1.345064, 0.6513902, 1.100952, 1, 0, 0.5921569, 1,
1.345661, -1.141053, 2.791842, 1, 0, 0.5882353, 1,
1.358263, -0.5119801, 2.254347, 1, 0, 0.5803922, 1,
1.363096, 0.2609653, 2.127118, 1, 0, 0.5764706, 1,
1.370153, -0.2935246, 0.3600146, 1, 0, 0.5686275, 1,
1.372266, -0.4573443, 0.1104971, 1, 0, 0.5647059, 1,
1.374138, -1.594409, 2.507822, 1, 0, 0.5568628, 1,
1.383096, -0.1936503, 1.584627, 1, 0, 0.5529412, 1,
1.391, 1.0299, 1.166173, 1, 0, 0.5450981, 1,
1.391518, 0.00207428, 2.122802, 1, 0, 0.5411765, 1,
1.393601, 0.1031076, 2.417002, 1, 0, 0.5333334, 1,
1.411078, 0.8955508, 0.264577, 1, 0, 0.5294118, 1,
1.41388, 0.3341798, 0.5252495, 1, 0, 0.5215687, 1,
1.428627, 0.7854652, 0.7187619, 1, 0, 0.5176471, 1,
1.442637, -0.2374489, 0.3178108, 1, 0, 0.509804, 1,
1.450122, 0.4444611, -0.5260886, 1, 0, 0.5058824, 1,
1.451511, 0.3612691, 0.630664, 1, 0, 0.4980392, 1,
1.467991, 0.6737247, -0.2189357, 1, 0, 0.4901961, 1,
1.480392, -0.2844379, 1.574005, 1, 0, 0.4862745, 1,
1.483645, -1.603296, 3.342768, 1, 0, 0.4784314, 1,
1.490616, 0.9132155, 1.454646, 1, 0, 0.4745098, 1,
1.490952, -0.5140179, 2.040419, 1, 0, 0.4666667, 1,
1.492047, -1.662336, 1.602877, 1, 0, 0.4627451, 1,
1.495608, 0.7236069, 1.223374, 1, 0, 0.454902, 1,
1.508558, -0.5753928, 2.049459, 1, 0, 0.4509804, 1,
1.50999, 1.154993, 0.9899089, 1, 0, 0.4431373, 1,
1.512876, 0.874183, 0.1992303, 1, 0, 0.4392157, 1,
1.513959, -0.4330494, 0.2002476, 1, 0, 0.4313726, 1,
1.517906, 0.2017754, 0.4459077, 1, 0, 0.427451, 1,
1.521775, 1.515244, 1.583841, 1, 0, 0.4196078, 1,
1.531274, 0.2931593, 2.468944, 1, 0, 0.4156863, 1,
1.536948, 0.4936136, 1.795995, 1, 0, 0.4078431, 1,
1.549766, -0.2326768, 1.672564, 1, 0, 0.4039216, 1,
1.550299, -0.5515532, 1.549518, 1, 0, 0.3960784, 1,
1.554484, -0.918754, 2.035344, 1, 0, 0.3882353, 1,
1.567688, 0.3119121, 1.842219, 1, 0, 0.3843137, 1,
1.575918, 0.4064038, 0.9116045, 1, 0, 0.3764706, 1,
1.583574, -1.180637, 1.052082, 1, 0, 0.372549, 1,
1.585655, 0.3133408, 0.7653219, 1, 0, 0.3647059, 1,
1.593078, 0.6596252, 0.8077697, 1, 0, 0.3607843, 1,
1.616245, 1.244847, 2.076544, 1, 0, 0.3529412, 1,
1.624398, 0.1129076, 0.1673561, 1, 0, 0.3490196, 1,
1.625348, -0.5393842, 2.050348, 1, 0, 0.3411765, 1,
1.627773, 0.4653373, 0.7553948, 1, 0, 0.3372549, 1,
1.631176, 0.9013227, 0.4568991, 1, 0, 0.3294118, 1,
1.632445, 0.6099897, 1.260533, 1, 0, 0.3254902, 1,
1.634291, -0.6329918, -0.009111711, 1, 0, 0.3176471, 1,
1.635893, -3.455236, 3.522534, 1, 0, 0.3137255, 1,
1.639784, 2.4993, -0.2008663, 1, 0, 0.3058824, 1,
1.658281, 1.651728, 1.224116, 1, 0, 0.2980392, 1,
1.661622, 0.2319157, 2.011739, 1, 0, 0.2941177, 1,
1.665803, -0.4540341, 1.692028, 1, 0, 0.2862745, 1,
1.672691, 0.006377244, 2.817384, 1, 0, 0.282353, 1,
1.692265, -2.23314, 1.327579, 1, 0, 0.2745098, 1,
1.692553, -1.998461, 2.507634, 1, 0, 0.2705882, 1,
1.70978, 1.608801, 0.4932139, 1, 0, 0.2627451, 1,
1.71458, -0.9238384, 3.584689, 1, 0, 0.2588235, 1,
1.715761, -0.6243807, 1.919646, 1, 0, 0.2509804, 1,
1.728027, -0.4629271, 1.96344, 1, 0, 0.2470588, 1,
1.733132, -0.5090823, 2.624076, 1, 0, 0.2392157, 1,
1.733782, -0.9821562, 1.911001, 1, 0, 0.2352941, 1,
1.738659, 0.03361156, 0.4490513, 1, 0, 0.227451, 1,
1.746485, -1.077844, 3.44676, 1, 0, 0.2235294, 1,
1.748465, -0.9795348, 2.377063, 1, 0, 0.2156863, 1,
1.764118, 0.6434065, 2.133341, 1, 0, 0.2117647, 1,
1.809086, 0.2901546, 2.093568, 1, 0, 0.2039216, 1,
1.825282, 0.6079294, 0.3758009, 1, 0, 0.1960784, 1,
1.825573, 0.1871026, 2.821336, 1, 0, 0.1921569, 1,
1.827388, 1.33873, -0.7820746, 1, 0, 0.1843137, 1,
1.828115, 1.602845, 0.3317366, 1, 0, 0.1803922, 1,
1.828261, -0.3000418, 0.7916992, 1, 0, 0.172549, 1,
1.847474, -1.223902, 3.472829, 1, 0, 0.1686275, 1,
1.866506, -1.571874, 2.102918, 1, 0, 0.1607843, 1,
1.893927, 0.7646801, 0.8089317, 1, 0, 0.1568628, 1,
1.923201, 0.4667212, 1.370446, 1, 0, 0.1490196, 1,
1.930924, 1.167727, 0.497429, 1, 0, 0.145098, 1,
1.95878, -0.2153701, 2.234556, 1, 0, 0.1372549, 1,
1.962144, -0.8096285, 1.718907, 1, 0, 0.1333333, 1,
1.982938, 0.3949256, 1.62589, 1, 0, 0.1254902, 1,
1.994783, -0.1724056, 2.563468, 1, 0, 0.1215686, 1,
2.016678, -0.7453994, 1.040961, 1, 0, 0.1137255, 1,
2.037252, -1.329041, 2.730119, 1, 0, 0.1098039, 1,
2.037866, 0.6718614, 0.9875366, 1, 0, 0.1019608, 1,
2.129003, 0.5122074, 1.835389, 1, 0, 0.09411765, 1,
2.136583, 0.8863247, 0.1853727, 1, 0, 0.09019608, 1,
2.13763, 0.7130375, 1.876073, 1, 0, 0.08235294, 1,
2.179849, 1.484528, -1.162372, 1, 0, 0.07843138, 1,
2.237165, 0.2426108, 2.542855, 1, 0, 0.07058824, 1,
2.249979, -0.07486317, 1.600648, 1, 0, 0.06666667, 1,
2.251706, -1.636133, 3.049458, 1, 0, 0.05882353, 1,
2.260664, 0.2866663, 1.682646, 1, 0, 0.05490196, 1,
2.268153, -0.6759409, 2.470456, 1, 0, 0.04705882, 1,
2.286361, -0.9806281, 2.867839, 1, 0, 0.04313726, 1,
2.31571, 0.9793691, 1.910215, 1, 0, 0.03529412, 1,
2.367652, 0.3302981, 0.3336713, 1, 0, 0.03137255, 1,
2.370042, 0.5002782, -0.6897126, 1, 0, 0.02352941, 1,
2.429625, 1.480235, 2.839042, 1, 0, 0.01960784, 1,
2.463698, 0.7431753, 1.307037, 1, 0, 0.01176471, 1,
2.652053, 0.09581319, 2.732784, 1, 0, 0.007843138, 1
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
-0.3083762, -4.537372, -6.646986, 0, -0.5, 0.5, 0.5,
-0.3083762, -4.537372, -6.646986, 1, -0.5, 0.5, 0.5,
-0.3083762, -4.537372, -6.646986, 1, 1.5, 0.5, 0.5,
-0.3083762, -4.537372, -6.646986, 0, 1.5, 0.5, 0.5
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
-4.272391, -0.2630936, -6.646986, 0, -0.5, 0.5, 0.5,
-4.272391, -0.2630936, -6.646986, 1, -0.5, 0.5, 0.5,
-4.272391, -0.2630936, -6.646986, 1, 1.5, 0.5, 0.5,
-4.272391, -0.2630936, -6.646986, 0, 1.5, 0.5, 0.5
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
-4.272391, -4.537372, -0.03984046, 0, -0.5, 0.5, 0.5,
-4.272391, -4.537372, -0.03984046, 1, -0.5, 0.5, 0.5,
-4.272391, -4.537372, -0.03984046, 1, 1.5, 0.5, 0.5,
-4.272391, -4.537372, -0.03984046, 0, 1.5, 0.5, 0.5
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
-3, -3.551, -5.12226,
2, -3.551, -5.12226,
-3, -3.551, -5.12226,
-3, -3.715395, -5.376381,
-2, -3.551, -5.12226,
-2, -3.715395, -5.376381,
-1, -3.551, -5.12226,
-1, -3.715395, -5.376381,
0, -3.551, -5.12226,
0, -3.715395, -5.376381,
1, -3.551, -5.12226,
1, -3.715395, -5.376381,
2, -3.551, -5.12226,
2, -3.715395, -5.376381
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
-3, -4.044186, -5.884623, 0, -0.5, 0.5, 0.5,
-3, -4.044186, -5.884623, 1, -0.5, 0.5, 0.5,
-3, -4.044186, -5.884623, 1, 1.5, 0.5, 0.5,
-3, -4.044186, -5.884623, 0, 1.5, 0.5, 0.5,
-2, -4.044186, -5.884623, 0, -0.5, 0.5, 0.5,
-2, -4.044186, -5.884623, 1, -0.5, 0.5, 0.5,
-2, -4.044186, -5.884623, 1, 1.5, 0.5, 0.5,
-2, -4.044186, -5.884623, 0, 1.5, 0.5, 0.5,
-1, -4.044186, -5.884623, 0, -0.5, 0.5, 0.5,
-1, -4.044186, -5.884623, 1, -0.5, 0.5, 0.5,
-1, -4.044186, -5.884623, 1, 1.5, 0.5, 0.5,
-1, -4.044186, -5.884623, 0, 1.5, 0.5, 0.5,
0, -4.044186, -5.884623, 0, -0.5, 0.5, 0.5,
0, -4.044186, -5.884623, 1, -0.5, 0.5, 0.5,
0, -4.044186, -5.884623, 1, 1.5, 0.5, 0.5,
0, -4.044186, -5.884623, 0, 1.5, 0.5, 0.5,
1, -4.044186, -5.884623, 0, -0.5, 0.5, 0.5,
1, -4.044186, -5.884623, 1, -0.5, 0.5, 0.5,
1, -4.044186, -5.884623, 1, 1.5, 0.5, 0.5,
1, -4.044186, -5.884623, 0, 1.5, 0.5, 0.5,
2, -4.044186, -5.884623, 0, -0.5, 0.5, 0.5,
2, -4.044186, -5.884623, 1, -0.5, 0.5, 0.5,
2, -4.044186, -5.884623, 1, 1.5, 0.5, 0.5,
2, -4.044186, -5.884623, 0, 1.5, 0.5, 0.5
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
-3.357619, -3, -5.12226,
-3.357619, 2, -5.12226,
-3.357619, -3, -5.12226,
-3.510081, -3, -5.376381,
-3.357619, -2, -5.12226,
-3.510081, -2, -5.376381,
-3.357619, -1, -5.12226,
-3.510081, -1, -5.376381,
-3.357619, 0, -5.12226,
-3.510081, 0, -5.376381,
-3.357619, 1, -5.12226,
-3.510081, 1, -5.376381,
-3.357619, 2, -5.12226,
-3.510081, 2, -5.376381
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
-3.815005, -3, -5.884623, 0, -0.5, 0.5, 0.5,
-3.815005, -3, -5.884623, 1, -0.5, 0.5, 0.5,
-3.815005, -3, -5.884623, 1, 1.5, 0.5, 0.5,
-3.815005, -3, -5.884623, 0, 1.5, 0.5, 0.5,
-3.815005, -2, -5.884623, 0, -0.5, 0.5, 0.5,
-3.815005, -2, -5.884623, 1, -0.5, 0.5, 0.5,
-3.815005, -2, -5.884623, 1, 1.5, 0.5, 0.5,
-3.815005, -2, -5.884623, 0, 1.5, 0.5, 0.5,
-3.815005, -1, -5.884623, 0, -0.5, 0.5, 0.5,
-3.815005, -1, -5.884623, 1, -0.5, 0.5, 0.5,
-3.815005, -1, -5.884623, 1, 1.5, 0.5, 0.5,
-3.815005, -1, -5.884623, 0, 1.5, 0.5, 0.5,
-3.815005, 0, -5.884623, 0, -0.5, 0.5, 0.5,
-3.815005, 0, -5.884623, 1, -0.5, 0.5, 0.5,
-3.815005, 0, -5.884623, 1, 1.5, 0.5, 0.5,
-3.815005, 0, -5.884623, 0, 1.5, 0.5, 0.5,
-3.815005, 1, -5.884623, 0, -0.5, 0.5, 0.5,
-3.815005, 1, -5.884623, 1, -0.5, 0.5, 0.5,
-3.815005, 1, -5.884623, 1, 1.5, 0.5, 0.5,
-3.815005, 1, -5.884623, 0, 1.5, 0.5, 0.5,
-3.815005, 2, -5.884623, 0, -0.5, 0.5, 0.5,
-3.815005, 2, -5.884623, 1, -0.5, 0.5, 0.5,
-3.815005, 2, -5.884623, 1, 1.5, 0.5, 0.5,
-3.815005, 2, -5.884623, 0, 1.5, 0.5, 0.5
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
-3.357619, -3.551, -4,
-3.357619, -3.551, 4,
-3.357619, -3.551, -4,
-3.510081, -3.715395, -4,
-3.357619, -3.551, -2,
-3.510081, -3.715395, -2,
-3.357619, -3.551, 0,
-3.510081, -3.715395, 0,
-3.357619, -3.551, 2,
-3.510081, -3.715395, 2,
-3.357619, -3.551, 4,
-3.510081, -3.715395, 4
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
-3.815005, -4.044186, -4, 0, -0.5, 0.5, 0.5,
-3.815005, -4.044186, -4, 1, -0.5, 0.5, 0.5,
-3.815005, -4.044186, -4, 1, 1.5, 0.5, 0.5,
-3.815005, -4.044186, -4, 0, 1.5, 0.5, 0.5,
-3.815005, -4.044186, -2, 0, -0.5, 0.5, 0.5,
-3.815005, -4.044186, -2, 1, -0.5, 0.5, 0.5,
-3.815005, -4.044186, -2, 1, 1.5, 0.5, 0.5,
-3.815005, -4.044186, -2, 0, 1.5, 0.5, 0.5,
-3.815005, -4.044186, 0, 0, -0.5, 0.5, 0.5,
-3.815005, -4.044186, 0, 1, -0.5, 0.5, 0.5,
-3.815005, -4.044186, 0, 1, 1.5, 0.5, 0.5,
-3.815005, -4.044186, 0, 0, 1.5, 0.5, 0.5,
-3.815005, -4.044186, 2, 0, -0.5, 0.5, 0.5,
-3.815005, -4.044186, 2, 1, -0.5, 0.5, 0.5,
-3.815005, -4.044186, 2, 1, 1.5, 0.5, 0.5,
-3.815005, -4.044186, 2, 0, 1.5, 0.5, 0.5,
-3.815005, -4.044186, 4, 0, -0.5, 0.5, 0.5,
-3.815005, -4.044186, 4, 1, -0.5, 0.5, 0.5,
-3.815005, -4.044186, 4, 1, 1.5, 0.5, 0.5,
-3.815005, -4.044186, 4, 0, 1.5, 0.5, 0.5
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
-3.357619, -3.551, -5.12226,
-3.357619, 3.024813, -5.12226,
-3.357619, -3.551, 5.042579,
-3.357619, 3.024813, 5.042579,
-3.357619, -3.551, -5.12226,
-3.357619, -3.551, 5.042579,
-3.357619, 3.024813, -5.12226,
-3.357619, 3.024813, 5.042579,
-3.357619, -3.551, -5.12226,
2.740866, -3.551, -5.12226,
-3.357619, -3.551, 5.042579,
2.740866, -3.551, 5.042579,
-3.357619, 3.024813, -5.12226,
2.740866, 3.024813, -5.12226,
-3.357619, 3.024813, 5.042579,
2.740866, 3.024813, 5.042579,
2.740866, -3.551, -5.12226,
2.740866, 3.024813, -5.12226,
2.740866, -3.551, 5.042579,
2.740866, 3.024813, 5.042579,
2.740866, -3.551, -5.12226,
2.740866, -3.551, 5.042579,
2.740866, 3.024813, -5.12226,
2.740866, 3.024813, 5.042579
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
var radius = 7.238476;
var distance = 32.2048;
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
mvMatrix.translate( 0.3083762, 0.2630936, 0.03984046 );
mvMatrix.scale( 1.283332, 1.190177, 0.7699465 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.2048);
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
ammonium_sulfamic_ac<-read.table("ammonium_sulfamic_ac.xyz", skip=1)
```

```
## Error in read.table("ammonium_sulfamic_ac.xyz", skip = 1): duplicate 'row.names' are not allowed
```

```r
x<-ammonium_sulfamic_ac$V2
```

```
## Error in eval(expr, envir, enclos): object 'ammonium_sulfamic_ac' not found
```

```r
y<-ammonium_sulfamic_ac$V3
```

```
## Error in eval(expr, envir, enclos): object 'ammonium_sulfamic_ac' not found
```

```r
z<-ammonium_sulfamic_ac$V4
```

```
## Error in eval(expr, envir, enclos): object 'ammonium_sulfamic_ac' not found
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
-3.268806, 0.9136411, 1.599579, 0, 0, 1, 1, 1,
-3.173648, -1.180237, -2.271558, 1, 0, 0, 1, 1,
-2.95847, -0.3855864, -2.103848, 1, 0, 0, 1, 1,
-2.66327, -0.2017042, -2.33355, 1, 0, 0, 1, 1,
-2.546421, -0.0899139, -1.132697, 1, 0, 0, 1, 1,
-2.485408, -0.8886938, -1.092477, 1, 0, 0, 1, 1,
-2.394571, 1.072025, -2.479671, 0, 0, 0, 1, 1,
-2.378832, 1.281627, -0.7152665, 0, 0, 0, 1, 1,
-2.367646, 0.7047622, -1.708063, 0, 0, 0, 1, 1,
-2.350626, 0.75049, -4.232735, 0, 0, 0, 1, 1,
-2.332679, -0.4776163, -1.307144, 0, 0, 0, 1, 1,
-2.248572, -0.488145, -3.121578, 0, 0, 0, 1, 1,
-2.233343, -0.03023865, -1.473043, 0, 0, 0, 1, 1,
-2.222714, -0.02000172, -1.08623, 1, 1, 1, 1, 1,
-2.191821, 0.4220144, -1.002218, 1, 1, 1, 1, 1,
-2.148386, 1.277959, -1.124381, 1, 1, 1, 1, 1,
-2.138455, 0.1529822, -1.649982, 1, 1, 1, 1, 1,
-2.102071, 1.118134, -1.096878, 1, 1, 1, 1, 1,
-2.101397, -1.232737, -2.486752, 1, 1, 1, 1, 1,
-2.084338, -0.7319981, -3.166398, 1, 1, 1, 1, 1,
-2.051324, 0.2181817, -0.8494915, 1, 1, 1, 1, 1,
-2.039796, 1.091564, -2.557122, 1, 1, 1, 1, 1,
-2.025571, -1.34982, -2.26089, 1, 1, 1, 1, 1,
-2.025008, -0.5719614, -1.82043, 1, 1, 1, 1, 1,
-2.024826, -0.007094817, -3.564766, 1, 1, 1, 1, 1,
-2.019491, 0.8020727, -1.762314, 1, 1, 1, 1, 1,
-1.984935, -2.004759, -2.22912, 1, 1, 1, 1, 1,
-1.916324, 0.06201947, -0.4218349, 1, 1, 1, 1, 1,
-1.898192, -0.9977229, -2.494039, 0, 0, 1, 1, 1,
-1.889765, -0.845636, -2.486252, 1, 0, 0, 1, 1,
-1.868102, 0.2896071, -2.532103, 1, 0, 0, 1, 1,
-1.845107, -0.4493612, -2.068245, 1, 0, 0, 1, 1,
-1.843335, 0.5488311, -1.307643, 1, 0, 0, 1, 1,
-1.843254, 0.6057693, -1.955974, 1, 0, 0, 1, 1,
-1.837337, 0.7519012, -1.795519, 0, 0, 0, 1, 1,
-1.825313, -0.2270146, -1.897756, 0, 0, 0, 1, 1,
-1.824056, 0.591204, -2.27139, 0, 0, 0, 1, 1,
-1.819283, -0.3825523, -0.7492114, 0, 0, 0, 1, 1,
-1.796131, -0.1395677, -1.854765, 0, 0, 0, 1, 1,
-1.793007, -0.2965434, -0.8730826, 0, 0, 0, 1, 1,
-1.791753, -0.9128522, -2.778779, 0, 0, 0, 1, 1,
-1.764282, -0.004679974, -1.623205, 1, 1, 1, 1, 1,
-1.739904, -0.0394017, -2.648401, 1, 1, 1, 1, 1,
-1.736916, 0.3058736, -1.750788, 1, 1, 1, 1, 1,
-1.732622, -0.653056, -1.436704, 1, 1, 1, 1, 1,
-1.701852, -0.6510796, -1.4906, 1, 1, 1, 1, 1,
-1.683819, -1.64201, -1.866893, 1, 1, 1, 1, 1,
-1.679898, 0.4651714, -1.168276, 1, 1, 1, 1, 1,
-1.676729, -0.2483744, -2.495019, 1, 1, 1, 1, 1,
-1.671106, -1.621377, -2.558203, 1, 1, 1, 1, 1,
-1.653652, -1.135473, -3.052525, 1, 1, 1, 1, 1,
-1.647234, -0.3855633, -1.377002, 1, 1, 1, 1, 1,
-1.639829, 0.1480885, -0.7805068, 1, 1, 1, 1, 1,
-1.638085, -0.6510856, -0.9087574, 1, 1, 1, 1, 1,
-1.628868, -1.143998, -3.104601, 1, 1, 1, 1, 1,
-1.628535, -1.600527, -2.682208, 1, 1, 1, 1, 1,
-1.613316, -2.050717, -2.48132, 0, 0, 1, 1, 1,
-1.602011, -1.043339, -3.006341, 1, 0, 0, 1, 1,
-1.599188, -0.3095908, -2.795229, 1, 0, 0, 1, 1,
-1.599127, -0.6999961, -0.4949953, 1, 0, 0, 1, 1,
-1.589506, -0.02399596, -2.492221, 1, 0, 0, 1, 1,
-1.582731, -0.03751553, -1.847677, 1, 0, 0, 1, 1,
-1.567799, 0.8214492, 0.0271657, 0, 0, 0, 1, 1,
-1.562105, -0.1249802, -1.485359, 0, 0, 0, 1, 1,
-1.547602, 0.1064226, -2.102989, 0, 0, 0, 1, 1,
-1.543995, 2.248751, -1.699138, 0, 0, 0, 1, 1,
-1.5415, 0.2709975, 0.1240463, 0, 0, 0, 1, 1,
-1.540663, -0.7650131, -2.252322, 0, 0, 0, 1, 1,
-1.534784, -0.3566261, -1.876606, 0, 0, 0, 1, 1,
-1.507951, -0.7641542, -1.613363, 1, 1, 1, 1, 1,
-1.50511, -0.6220668, -2.285201, 1, 1, 1, 1, 1,
-1.50271, 1.910531, -1.292632, 1, 1, 1, 1, 1,
-1.477821, -0.4933233, -1.297243, 1, 1, 1, 1, 1,
-1.47363, 1.381584, -2.18768, 1, 1, 1, 1, 1,
-1.470556, 2.136273, -0.6028957, 1, 1, 1, 1, 1,
-1.470112, -0.5827019, -2.401166, 1, 1, 1, 1, 1,
-1.460327, 1.098089, -0.1863716, 1, 1, 1, 1, 1,
-1.451572, -1.410553, -1.091084, 1, 1, 1, 1, 1,
-1.451492, -0.8180699, -0.6483506, 1, 1, 1, 1, 1,
-1.443556, -0.9860973, -3.744136, 1, 1, 1, 1, 1,
-1.442707, 1.178713, -1.185142, 1, 1, 1, 1, 1,
-1.42263, 0.8205604, -0.7734075, 1, 1, 1, 1, 1,
-1.420999, 0.09014037, -3.757679, 1, 1, 1, 1, 1,
-1.40484, 0.8081803, -0.4726357, 1, 1, 1, 1, 1,
-1.404748, -0.00102881, -2.252847, 0, 0, 1, 1, 1,
-1.4036, 0.1501175, -1.386126, 1, 0, 0, 1, 1,
-1.402583, -0.1716432, -1.514892, 1, 0, 0, 1, 1,
-1.395159, -1.039751, -2.98128, 1, 0, 0, 1, 1,
-1.391374, 0.1878208, -1.781308, 1, 0, 0, 1, 1,
-1.388815, 0.7105868, -0.3367177, 1, 0, 0, 1, 1,
-1.387312, -0.4206644, -0.6591158, 0, 0, 0, 1, 1,
-1.385277, 2.864135, -0.5665555, 0, 0, 0, 1, 1,
-1.369045, 0.705694, -0.5495768, 0, 0, 0, 1, 1,
-1.359789, -1.168652, -3.150501, 0, 0, 0, 1, 1,
-1.350004, -1.924079, -4.391557, 0, 0, 0, 1, 1,
-1.348675, 0.4917361, -1.787719, 0, 0, 0, 1, 1,
-1.347678, -0.7821432, -1.149256, 0, 0, 0, 1, 1,
-1.347147, 0.1226733, -2.209918, 1, 1, 1, 1, 1,
-1.340563, -1.404049, -3.119626, 1, 1, 1, 1, 1,
-1.332455, 0.4568181, -0.8506054, 1, 1, 1, 1, 1,
-1.292412, 0.6651129, -1.014119, 1, 1, 1, 1, 1,
-1.25776, 1.706575, 0.3051619, 1, 1, 1, 1, 1,
-1.257691, -1.06208, -3.996414, 1, 1, 1, 1, 1,
-1.2572, -0.1391594, -2.061699, 1, 1, 1, 1, 1,
-1.251828, 0.8929185, -1.760652, 1, 1, 1, 1, 1,
-1.246987, 0.8708929, -0.4811719, 1, 1, 1, 1, 1,
-1.242336, 0.1908859, -3.271101, 1, 1, 1, 1, 1,
-1.230187, 1.239049, -2.581077, 1, 1, 1, 1, 1,
-1.225491, 2.242408, -0.1863637, 1, 1, 1, 1, 1,
-1.223161, -1.389146, -2.741322, 1, 1, 1, 1, 1,
-1.222877, -2.150464, -4.974228, 1, 1, 1, 1, 1,
-1.221799, -0.6017847, -2.959213, 1, 1, 1, 1, 1,
-1.218296, 0.5314492, -1.038381, 0, 0, 1, 1, 1,
-1.217225, 1.36792, -2.120106, 1, 0, 0, 1, 1,
-1.213249, 0.4886481, -0.6173266, 1, 0, 0, 1, 1,
-1.213196, -1.353389, -3.2693, 1, 0, 0, 1, 1,
-1.209038, -0.7197337, -2.497379, 1, 0, 0, 1, 1,
-1.208158, 0.6818714, -0.2522227, 1, 0, 0, 1, 1,
-1.202732, -1.122349, -3.48098, 0, 0, 0, 1, 1,
-1.199999, -0.1079749, -2.481388, 0, 0, 0, 1, 1,
-1.195742, 0.4847085, -2.191158, 0, 0, 0, 1, 1,
-1.190447, 0.1096748, -1.070906, 0, 0, 0, 1, 1,
-1.186363, -1.249432, -1.748008, 0, 0, 0, 1, 1,
-1.185263, -0.8185118, -2.156483, 0, 0, 0, 1, 1,
-1.181065, -0.9369118, -3.732624, 0, 0, 0, 1, 1,
-1.180769, 0.7196777, -0.960343, 1, 1, 1, 1, 1,
-1.180644, -0.7134318, -2.978924, 1, 1, 1, 1, 1,
-1.178567, 0.1086191, -0.7571266, 1, 1, 1, 1, 1,
-1.178045, 0.8749694, -1.572454, 1, 1, 1, 1, 1,
-1.171504, -0.4241863, -1.639932, 1, 1, 1, 1, 1,
-1.168333, -0.4070418, -2.462614, 1, 1, 1, 1, 1,
-1.167936, 1.188596, -1.255784, 1, 1, 1, 1, 1,
-1.167468, -0.4095037, 0.7403331, 1, 1, 1, 1, 1,
-1.14325, 1.34388, -1.479217, 1, 1, 1, 1, 1,
-1.140005, 0.9649385, -0.007913233, 1, 1, 1, 1, 1,
-1.120191, 1.053959, -0.7771354, 1, 1, 1, 1, 1,
-1.11506, -0.3768975, -0.9470805, 1, 1, 1, 1, 1,
-1.105518, 0.2268073, -1.040615, 1, 1, 1, 1, 1,
-1.10407, 1.670994, -0.9874991, 1, 1, 1, 1, 1,
-1.1031, -0.658663, -2.882872, 1, 1, 1, 1, 1,
-1.095442, 1.109452, 0.2484275, 0, 0, 1, 1, 1,
-1.092327, 0.1987928, -0.5239945, 1, 0, 0, 1, 1,
-1.090679, 0.2936029, -2.058658, 1, 0, 0, 1, 1,
-1.087931, 0.8271726, -0.3324207, 1, 0, 0, 1, 1,
-1.083205, -1.390041, -2.471743, 1, 0, 0, 1, 1,
-1.070602, 0.3743687, 1.129272, 1, 0, 0, 1, 1,
-1.066793, 0.6766163, -1.983585, 0, 0, 0, 1, 1,
-1.053516, -0.9794976, -4.318134, 0, 0, 0, 1, 1,
-1.050087, -0.09906568, -1.048567, 0, 0, 0, 1, 1,
-1.048649, 0.79479, -1.307271, 0, 0, 0, 1, 1,
-1.048264, 1.993859, 0.5340298, 0, 0, 0, 1, 1,
-1.037921, -0.4149887, -3.512414, 0, 0, 0, 1, 1,
-1.031316, 1.638353, -0.2767674, 0, 0, 0, 1, 1,
-1.029858, -0.03058504, -3.152616, 1, 1, 1, 1, 1,
-1.02908, -0.008370123, -1.7575, 1, 1, 1, 1, 1,
-1.028551, -0.4898271, -2.291792, 1, 1, 1, 1, 1,
-1.02657, 0.4192212, 0.08462935, 1, 1, 1, 1, 1,
-1.025858, -1.971216, -2.129633, 1, 1, 1, 1, 1,
-1.024243, -0.3143398, -1.224845, 1, 1, 1, 1, 1,
-1.008956, -1.71734, -1.925819, 1, 1, 1, 1, 1,
-1.007234, -0.292987, -2.044234, 1, 1, 1, 1, 1,
-1.006284, -0.4373415, -1.071811, 1, 1, 1, 1, 1,
-0.9990394, 0.9531194, 0.4628101, 1, 1, 1, 1, 1,
-0.9944652, 0.8361292, -1.417313, 1, 1, 1, 1, 1,
-0.991648, 0.3915274, -1.11789, 1, 1, 1, 1, 1,
-0.9848832, -2.441026, -2.324203, 1, 1, 1, 1, 1,
-0.9835397, 0.2899107, -1.281893, 1, 1, 1, 1, 1,
-0.9829665, 1.460084, -0.2375589, 1, 1, 1, 1, 1,
-0.9825596, 0.6295183, -2.393893, 0, 0, 1, 1, 1,
-0.9798464, -1.551629, -3.259028, 1, 0, 0, 1, 1,
-0.9680831, 0.9403843, -1.207611, 1, 0, 0, 1, 1,
-0.9633754, 0.4590324, -2.156694, 1, 0, 0, 1, 1,
-0.9600031, -0.1176751, 0.04584242, 1, 0, 0, 1, 1,
-0.9579033, -1.074106, -2.063387, 1, 0, 0, 1, 1,
-0.9536555, 0.4787427, -0.763889, 0, 0, 0, 1, 1,
-0.9479123, -0.1598624, -2.218472, 0, 0, 0, 1, 1,
-0.9431121, 0.5041528, -1.464544, 0, 0, 0, 1, 1,
-0.9342549, 0.1493508, -2.151439, 0, 0, 0, 1, 1,
-0.9286546, -0.5298189, -0.675186, 0, 0, 0, 1, 1,
-0.9282904, -1.014475, -2.110868, 0, 0, 0, 1, 1,
-0.9258592, -1.243262, -3.772658, 0, 0, 0, 1, 1,
-0.9220646, -1.315443, -2.824456, 1, 1, 1, 1, 1,
-0.9193721, -1.167174, -3.360676, 1, 1, 1, 1, 1,
-0.9182868, 0.08073608, -0.406268, 1, 1, 1, 1, 1,
-0.9158734, -3.24555, -3.411195, 1, 1, 1, 1, 1,
-0.9138261, -0.05565406, -1.798804, 1, 1, 1, 1, 1,
-0.9134369, -0.5453833, -1.834625, 1, 1, 1, 1, 1,
-0.9029622, 0.787368, -0.05760151, 1, 1, 1, 1, 1,
-0.8987604, 0.04857365, -2.609324, 1, 1, 1, 1, 1,
-0.894839, -0.9679537, -3.270633, 1, 1, 1, 1, 1,
-0.8922206, -1.136084, -1.391142, 1, 1, 1, 1, 1,
-0.8920683, 0.9129075, -0.8937618, 1, 1, 1, 1, 1,
-0.8917663, -1.31344, -2.486796, 1, 1, 1, 1, 1,
-0.8901719, -0.9662734, -1.901374, 1, 1, 1, 1, 1,
-0.8831833, -1.292448, -3.159759, 1, 1, 1, 1, 1,
-0.8817334, 0.2541938, -0.8448732, 1, 1, 1, 1, 1,
-0.8752394, 2.205539, -1.462759, 0, 0, 1, 1, 1,
-0.8739413, 0.4390488, -2.177148, 1, 0, 0, 1, 1,
-0.8732137, -0.3455538, -1.56921, 1, 0, 0, 1, 1,
-0.8613776, 0.3968927, -0.6969222, 1, 0, 0, 1, 1,
-0.859212, -1.346608, -2.936683, 1, 0, 0, 1, 1,
-0.8522788, 0.1564713, -1.006248, 1, 0, 0, 1, 1,
-0.8513715, -1.828251, -3.097026, 0, 0, 0, 1, 1,
-0.8480586, 0.1043598, 0.07836249, 0, 0, 0, 1, 1,
-0.8429536, -1.734824, -2.6058, 0, 0, 0, 1, 1,
-0.8411728, 0.9685884, -1.437388, 0, 0, 0, 1, 1,
-0.8331198, 1.742832, 0.8145228, 0, 0, 0, 1, 1,
-0.8318915, -0.1640507, -2.725562, 0, 0, 0, 1, 1,
-0.8314526, 1.261005, -1.98874, 0, 0, 0, 1, 1,
-0.8297148, -1.079347, -2.548028, 1, 1, 1, 1, 1,
-0.8278203, 0.2563378, -3.422725, 1, 1, 1, 1, 1,
-0.8275996, 0.9752142, 0.08675962, 1, 1, 1, 1, 1,
-0.8265854, -0.6330871, -1.858589, 1, 1, 1, 1, 1,
-0.8234074, -1.350497, -2.538693, 1, 1, 1, 1, 1,
-0.823131, -0.549483, -1.795508, 1, 1, 1, 1, 1,
-0.8217131, -0.06525075, -2.7075, 1, 1, 1, 1, 1,
-0.8095344, 0.4765659, -1.052402, 1, 1, 1, 1, 1,
-0.803296, -0.5130233, -1.158407, 1, 1, 1, 1, 1,
-0.7968438, -0.3235765, -1.548466, 1, 1, 1, 1, 1,
-0.7878113, -0.6467702, -1.993632, 1, 1, 1, 1, 1,
-0.7825381, 1.33107, -0.9957995, 1, 1, 1, 1, 1,
-0.7777009, -2.182324, -3.029727, 1, 1, 1, 1, 1,
-0.7772743, -0.2549654, -1.446817, 1, 1, 1, 1, 1,
-0.7765947, -1.259807, -2.53399, 1, 1, 1, 1, 1,
-0.7763789, -0.7789335, -1.996419, 0, 0, 1, 1, 1,
-0.7756071, -1.157364, -3.045362, 1, 0, 0, 1, 1,
-0.7666755, 2.09429, 0.8812455, 1, 0, 0, 1, 1,
-0.7644136, 0.332554, -1.600762, 1, 0, 0, 1, 1,
-0.7621665, 1.807823, -1.224906, 1, 0, 0, 1, 1,
-0.7590798, 1.420009, 0.2236508, 1, 0, 0, 1, 1,
-0.7589704, -0.7353117, -3.115759, 0, 0, 0, 1, 1,
-0.7524822, 0.665491, 0.572291, 0, 0, 0, 1, 1,
-0.7486224, -1.318901, -2.954999, 0, 0, 0, 1, 1,
-0.7477649, 1.52494, -0.6247437, 0, 0, 0, 1, 1,
-0.7468839, -0.7667631, -1.950081, 0, 0, 0, 1, 1,
-0.7457479, 0.6203039, -2.784595, 0, 0, 0, 1, 1,
-0.7449471, -0.6552689, -1.085824, 0, 0, 0, 1, 1,
-0.7378244, -0.7922208, -1.175707, 1, 1, 1, 1, 1,
-0.7272547, 0.4853491, -1.92386, 1, 1, 1, 1, 1,
-0.726845, 1.30941, -1.323437, 1, 1, 1, 1, 1,
-0.7247407, -1.19295, -1.236565, 1, 1, 1, 1, 1,
-0.7230099, 0.5288231, -1.274953, 1, 1, 1, 1, 1,
-0.7222705, -0.5126259, -0.1688227, 1, 1, 1, 1, 1,
-0.7181118, -0.2279149, 0.9684327, 1, 1, 1, 1, 1,
-0.7108679, 0.438122, -0.9410616, 1, 1, 1, 1, 1,
-0.7095796, -1.015, -3.033864, 1, 1, 1, 1, 1,
-0.7091279, 1.913098, -0.6778091, 1, 1, 1, 1, 1,
-0.7040091, -0.1009336, -3.647217, 1, 1, 1, 1, 1,
-0.6949545, -0.04536955, -3.972731, 1, 1, 1, 1, 1,
-0.693182, -0.6359202, -4.748278, 1, 1, 1, 1, 1,
-0.6930632, 0.7427467, -1.811984, 1, 1, 1, 1, 1,
-0.6925578, -1.922461, -1.281274, 1, 1, 1, 1, 1,
-0.691193, 0.121277, -2.233422, 0, 0, 1, 1, 1,
-0.6900908, -0.4574187, -1.633155, 1, 0, 0, 1, 1,
-0.6790358, -0.5564848, -3.266437, 1, 0, 0, 1, 1,
-0.6773216, -0.4950545, -1.831671, 1, 0, 0, 1, 1,
-0.6700571, 0.1488515, -3.18102, 1, 0, 0, 1, 1,
-0.669546, 1.437269, 0.08908319, 1, 0, 0, 1, 1,
-0.6686704, 0.4467247, -1.714087, 0, 0, 0, 1, 1,
-0.6578071, -0.5687112, -2.249751, 0, 0, 0, 1, 1,
-0.6573586, -1.679924, -3.561394, 0, 0, 0, 1, 1,
-0.6508089, 0.3394072, -1.399621, 0, 0, 0, 1, 1,
-0.6469829, -0.4336838, -0.577641, 0, 0, 0, 1, 1,
-0.6461204, -1.499905, -2.154843, 0, 0, 0, 1, 1,
-0.6383315, 0.9677988, -0.9528816, 0, 0, 0, 1, 1,
-0.6366403, 0.4010549, -1.530644, 1, 1, 1, 1, 1,
-0.6340414, -0.8737984, -3.445333, 1, 1, 1, 1, 1,
-0.6309349, 0.2147659, -1.046496, 1, 1, 1, 1, 1,
-0.629411, 0.5953899, -1.459573, 1, 1, 1, 1, 1,
-0.6280017, 0.3387461, -2.718419, 1, 1, 1, 1, 1,
-0.6276643, 0.3135124, -0.5792516, 1, 1, 1, 1, 1,
-0.6262567, -0.5796855, -1.98206, 1, 1, 1, 1, 1,
-0.6160269, -1.42088, -3.429328, 1, 1, 1, 1, 1,
-0.6150163, -0.4092197, -0.9299305, 1, 1, 1, 1, 1,
-0.6128804, 1.063218, -1.605548, 1, 1, 1, 1, 1,
-0.605422, 0.6559018, -1.922724, 1, 1, 1, 1, 1,
-0.6052707, -0.3704418, -4.421434, 1, 1, 1, 1, 1,
-0.5951223, -1.908265, -3.78933, 1, 1, 1, 1, 1,
-0.5940908, -0.4384545, -1.587754, 1, 1, 1, 1, 1,
-0.5872255, -0.4550161, -2.237777, 1, 1, 1, 1, 1,
-0.5863862, -2.382919, -2.798518, 0, 0, 1, 1, 1,
-0.5853591, -2.043507, -0.03918558, 1, 0, 0, 1, 1,
-0.5850549, 2.929049, -0.5941486, 1, 0, 0, 1, 1,
-0.5842538, 1.152833, -1.494367, 1, 0, 0, 1, 1,
-0.5840579, 1.248559, 0.7607259, 1, 0, 0, 1, 1,
-0.5828316, -0.9656382, -0.8478425, 1, 0, 0, 1, 1,
-0.5776848, 0.2820242, -0.4582419, 0, 0, 0, 1, 1,
-0.5772048, 1.202691, 0.06756859, 0, 0, 0, 1, 1,
-0.5743731, -0.5359395, -4.712294, 0, 0, 0, 1, 1,
-0.5723369, -0.3575009, -1.559246, 0, 0, 0, 1, 1,
-0.571951, 0.8149815, 0.4551534, 0, 0, 0, 1, 1,
-0.5699215, -0.03223149, -2.162012, 0, 0, 0, 1, 1,
-0.5653896, 0.5918609, -0.4444377, 0, 0, 0, 1, 1,
-0.5644167, -0.6162938, -2.05418, 1, 1, 1, 1, 1,
-0.5640624, 0.06719737, 0.1537613, 1, 1, 1, 1, 1,
-0.5616526, 0.3650139, -0.9322768, 1, 1, 1, 1, 1,
-0.5547771, -1.744605, -2.868908, 1, 1, 1, 1, 1,
-0.5515767, -0.1139308, -2.873079, 1, 1, 1, 1, 1,
-0.5508536, -0.3642077, -1.916202, 1, 1, 1, 1, 1,
-0.549144, 1.118225, -0.4209158, 1, 1, 1, 1, 1,
-0.5403225, 0.8153081, -0.8428093, 1, 1, 1, 1, 1,
-0.529828, 1.218168, 1.533618, 1, 1, 1, 1, 1,
-0.5208632, -1.872678, -4.409143, 1, 1, 1, 1, 1,
-0.5157176, -1.30595, -4.238307, 1, 1, 1, 1, 1,
-0.5153686, 0.6273971, -0.243392, 1, 1, 1, 1, 1,
-0.5140998, -0.9507488, -3.145333, 1, 1, 1, 1, 1,
-0.5130523, 1.103224, 1.855407, 1, 1, 1, 1, 1,
-0.51261, -0.595232, -2.536723, 1, 1, 1, 1, 1,
-0.5110313, -0.7286649, -3.025908, 0, 0, 1, 1, 1,
-0.5103412, -0.0008131789, -0.9325421, 1, 0, 0, 1, 1,
-0.5038784, -1.235451, -1.303511, 1, 0, 0, 1, 1,
-0.5017357, 1.293962, 0.1097138, 1, 0, 0, 1, 1,
-0.4996935, -0.08748791, -0.2943256, 1, 0, 0, 1, 1,
-0.489415, -0.1394151, -2.567357, 1, 0, 0, 1, 1,
-0.4831719, -0.6365867, -2.512689, 0, 0, 0, 1, 1,
-0.4817313, -0.07680163, -2.845928, 0, 0, 0, 1, 1,
-0.4783022, -0.8023341, -3.698672, 0, 0, 0, 1, 1,
-0.4773739, 0.5141339, 0.3632362, 0, 0, 0, 1, 1,
-0.476168, 0.07796045, -0.6184295, 0, 0, 0, 1, 1,
-0.4757298, 0.193288, -1.833199, 0, 0, 0, 1, 1,
-0.4719959, 1.291239, -1.463239, 0, 0, 0, 1, 1,
-0.4707477, -0.2316559, -2.015271, 1, 1, 1, 1, 1,
-0.4704938, 0.8051223, 0.694536, 1, 1, 1, 1, 1,
-0.4686499, 0.202679, -0.9115764, 1, 1, 1, 1, 1,
-0.4675533, 0.5605452, -0.8085645, 1, 1, 1, 1, 1,
-0.4662523, -0.4242326, -1.558914, 1, 1, 1, 1, 1,
-0.4649234, 0.1723241, -1.183716, 1, 1, 1, 1, 1,
-0.4642933, -0.6386468, -1.558668, 1, 1, 1, 1, 1,
-0.4631691, -1.4303, -3.227213, 1, 1, 1, 1, 1,
-0.4602099, -0.8946996, -3.718267, 1, 1, 1, 1, 1,
-0.4600233, -1.190793, -4.59491, 1, 1, 1, 1, 1,
-0.4536401, 0.4293605, -1.11346, 1, 1, 1, 1, 1,
-0.4515961, 0.603419, -0.9799718, 1, 1, 1, 1, 1,
-0.444387, -0.9900438, -1.013313, 1, 1, 1, 1, 1,
-0.4303175, 1.075924, 0.03663014, 1, 1, 1, 1, 1,
-0.4294888, -0.7853796, -3.307257, 1, 1, 1, 1, 1,
-0.4242597, 0.1438261, -2.505586, 0, 0, 1, 1, 1,
-0.4139841, 0.3723462, -0.6421931, 1, 0, 0, 1, 1,
-0.4121848, -0.4287289, -3.524183, 1, 0, 0, 1, 1,
-0.4080956, 0.1356509, -1.30041, 1, 0, 0, 1, 1,
-0.407565, 1.513071, 0.3771626, 1, 0, 0, 1, 1,
-0.4019268, -1.250702, -3.907785, 1, 0, 0, 1, 1,
-0.4017818, 0.2543424, -1.014344, 0, 0, 0, 1, 1,
-0.3986748, 1.125253, -0.7410382, 0, 0, 0, 1, 1,
-0.3974523, 1.117554, -0.08147424, 0, 0, 0, 1, 1,
-0.3870481, 0.9091394, 0.08513526, 0, 0, 0, 1, 1,
-0.3841947, -0.5063317, -1.721535, 0, 0, 0, 1, 1,
-0.383947, 0.1456895, -1.194023, 0, 0, 0, 1, 1,
-0.3814669, -1.563842, -3.634687, 0, 0, 0, 1, 1,
-0.3806089, -0.1753429, -1.633915, 1, 1, 1, 1, 1,
-0.3776884, 0.4168192, -2.106719, 1, 1, 1, 1, 1,
-0.3757454, -0.1103742, -2.566634, 1, 1, 1, 1, 1,
-0.3740529, -0.02385891, -2.658037, 1, 1, 1, 1, 1,
-0.3722402, 0.8363542, 1.502367, 1, 1, 1, 1, 1,
-0.3674249, 0.005346519, -1.974476, 1, 1, 1, 1, 1,
-0.3608413, -1.280186, -3.681583, 1, 1, 1, 1, 1,
-0.3599084, -1.114025, -2.398767, 1, 1, 1, 1, 1,
-0.3583538, -0.2112379, -0.6386266, 1, 1, 1, 1, 1,
-0.3574639, -0.04540906, -2.149913, 1, 1, 1, 1, 1,
-0.357202, 1.078666, 1.459227, 1, 1, 1, 1, 1,
-0.3558978, -0.6355963, -3.726349, 1, 1, 1, 1, 1,
-0.3554778, 0.7636181, -1.585623, 1, 1, 1, 1, 1,
-0.3477308, -0.4579357, -3.023053, 1, 1, 1, 1, 1,
-0.3406439, -0.3247101, -0.9157364, 1, 1, 1, 1, 1,
-0.3345163, -0.6987166, -1.504374, 0, 0, 1, 1, 1,
-0.3336225, 1.202096, 1.063466, 1, 0, 0, 1, 1,
-0.3335302, 1.958681, 0.002752395, 1, 0, 0, 1, 1,
-0.3332149, 0.1841385, -0.5963197, 1, 0, 0, 1, 1,
-0.3271061, 0.7884668, -0.3264908, 1, 0, 0, 1, 1,
-0.3260762, -0.8255849, -2.59461, 1, 0, 0, 1, 1,
-0.3221277, -0.3856279, -2.87679, 0, 0, 0, 1, 1,
-0.3155029, 0.6160187, -1.664342, 0, 0, 0, 1, 1,
-0.3112375, 2.557364, 0.7303415, 0, 0, 0, 1, 1,
-0.310567, 0.00776167, -2.183996, 0, 0, 0, 1, 1,
-0.3090115, -0.1249802, -0.6805163, 0, 0, 0, 1, 1,
-0.3088724, 0.1982322, 1.452649, 0, 0, 0, 1, 1,
-0.3050029, -0.8501703, -4.010723, 0, 0, 0, 1, 1,
-0.3049344, 0.7700863, -2.25964, 1, 1, 1, 1, 1,
-0.3041007, 1.335224, -0.09539425, 1, 1, 1, 1, 1,
-0.2985937, 0.2073766, -1.662619, 1, 1, 1, 1, 1,
-0.2984254, 0.1292565, -1.532853, 1, 1, 1, 1, 1,
-0.280551, -0.2262099, 0.2527121, 1, 1, 1, 1, 1,
-0.2786504, 0.598255, -0.7060832, 1, 1, 1, 1, 1,
-0.2746058, -2.088564, -2.617559, 1, 1, 1, 1, 1,
-0.2729345, 0.8356418, 0.1674367, 1, 1, 1, 1, 1,
-0.2640658, 0.4624521, 0.2264795, 1, 1, 1, 1, 1,
-0.2581857, -0.5489597, -3.274864, 1, 1, 1, 1, 1,
-0.2525986, 1.381982, 0.8466868, 1, 1, 1, 1, 1,
-0.2496326, 1.149407, 0.2608877, 1, 1, 1, 1, 1,
-0.2467805, 1.626405, 0.9635433, 1, 1, 1, 1, 1,
-0.2399343, 0.2370991, 0.442353, 1, 1, 1, 1, 1,
-0.2367277, -0.0504662, -1.66289, 1, 1, 1, 1, 1,
-0.235915, -0.9684286, -2.058124, 0, 0, 1, 1, 1,
-0.2340451, 0.3840971, -0.3947787, 1, 0, 0, 1, 1,
-0.2325961, -0.159285, -1.539092, 1, 0, 0, 1, 1,
-0.2308286, 0.9935035, 0.5124111, 1, 0, 0, 1, 1,
-0.2298052, 0.2174339, -2.426358, 1, 0, 0, 1, 1,
-0.2250702, -0.1210239, -0.9728968, 1, 0, 0, 1, 1,
-0.2242328, 0.9229093, -1.442329, 0, 0, 0, 1, 1,
-0.2228327, 0.5293473, 0.08397508, 0, 0, 0, 1, 1,
-0.2201376, 0.08610081, -1.111398, 0, 0, 0, 1, 1,
-0.2200204, -0.2917314, -2.774349, 0, 0, 0, 1, 1,
-0.2198107, 0.8363207, 1.458822, 0, 0, 0, 1, 1,
-0.2183497, -1.538171, -2.6503, 0, 0, 0, 1, 1,
-0.2167735, -0.1723112, -3.623252, 0, 0, 0, 1, 1,
-0.215278, 0.6210934, 0.9011111, 1, 1, 1, 1, 1,
-0.2144238, -1.002571, -1.877393, 1, 1, 1, 1, 1,
-0.2118423, 0.8387129, 0.7914838, 1, 1, 1, 1, 1,
-0.2103554, -1.380105, -3.021636, 1, 1, 1, 1, 1,
-0.2025009, -0.6770365, -2.697391, 1, 1, 1, 1, 1,
-0.1981804, 0.4463793, 0.05369248, 1, 1, 1, 1, 1,
-0.19667, -0.1915806, -2.133834, 1, 1, 1, 1, 1,
-0.1963365, 1.113613, 0.2876481, 1, 1, 1, 1, 1,
-0.1953788, -0.659695, -4.930355, 1, 1, 1, 1, 1,
-0.1951545, 1.629728, 0.8086863, 1, 1, 1, 1, 1,
-0.1919691, 0.307275, -0.9915985, 1, 1, 1, 1, 1,
-0.1898878, -0.06795183, -2.58917, 1, 1, 1, 1, 1,
-0.1885383, 0.06520317, -1.521935, 1, 1, 1, 1, 1,
-0.1875214, -0.9179022, -3.11426, 1, 1, 1, 1, 1,
-0.1837419, -0.8147503, -4.109984, 1, 1, 1, 1, 1,
-0.178502, 1.519297, -0.2857406, 0, 0, 1, 1, 1,
-0.1756477, -0.20297, -3.622228, 1, 0, 0, 1, 1,
-0.1742536, 0.2187948, -0.5955006, 1, 0, 0, 1, 1,
-0.1717813, 0.9357682, 0.04207136, 1, 0, 0, 1, 1,
-0.1666117, 0.07576028, -0.5444704, 1, 0, 0, 1, 1,
-0.163156, 0.1808811, -2.733511, 1, 0, 0, 1, 1,
-0.1616088, 1.362252, -1.317296, 0, 0, 0, 1, 1,
-0.1602955, -0.2140611, -2.050611, 0, 0, 0, 1, 1,
-0.1574654, 0.690213, 0.7175116, 0, 0, 0, 1, 1,
-0.157106, -0.3595167, -3.323453, 0, 0, 0, 1, 1,
-0.1563957, 1.155163, -0.8800895, 0, 0, 0, 1, 1,
-0.155981, -0.4461493, -4.451924, 0, 0, 0, 1, 1,
-0.1554365, -0.2868184, -1.984128, 0, 0, 0, 1, 1,
-0.152719, 0.449546, -0.8446273, 1, 1, 1, 1, 1,
-0.143375, 0.7469692, 0.9044631, 1, 1, 1, 1, 1,
-0.1410229, -0.9719231, -1.417486, 1, 1, 1, 1, 1,
-0.1398395, -1.058631, -3.910266, 1, 1, 1, 1, 1,
-0.1388117, -1.588293, -3.340205, 1, 1, 1, 1, 1,
-0.137002, -0.1160353, -1.606589, 1, 1, 1, 1, 1,
-0.131475, -0.4158615, -1.383634, 1, 1, 1, 1, 1,
-0.1308741, -1.560323, -2.831489, 1, 1, 1, 1, 1,
-0.1237483, 1.005851, 0.03674539, 1, 1, 1, 1, 1,
-0.1226533, 1.137501, -0.1698074, 1, 1, 1, 1, 1,
-0.1223635, 2.306442, -0.9595553, 1, 1, 1, 1, 1,
-0.1200793, -2.009178, -3.792285, 1, 1, 1, 1, 1,
-0.1170913, 0.2421101, 0.03466461, 1, 1, 1, 1, 1,
-0.1160816, 1.389569, 0.5364701, 1, 1, 1, 1, 1,
-0.11236, 1.323563, 0.1663001, 1, 1, 1, 1, 1,
-0.1107133, -0.2688949, -3.179746, 0, 0, 1, 1, 1,
-0.1098625, 0.437644, 0.2325686, 1, 0, 0, 1, 1,
-0.108062, -0.397846, -1.837996, 1, 0, 0, 1, 1,
-0.1071688, -2.003247, -4.111255, 1, 0, 0, 1, 1,
-0.1021424, -0.1784579, -3.023061, 1, 0, 0, 1, 1,
-0.1010762, 0.294174, -1.112158, 1, 0, 0, 1, 1,
-0.09542241, 0.688541, 0.7803633, 0, 0, 0, 1, 1,
-0.08653898, -0.538536, -4.297871, 0, 0, 0, 1, 1,
-0.08416507, 0.1983249, -0.5787153, 0, 0, 0, 1, 1,
-0.07540736, -1.246536, -2.484987, 0, 0, 0, 1, 1,
-0.06126442, -2.095895, -2.244381, 0, 0, 0, 1, 1,
-0.05818874, 0.1072133, -2.137697, 0, 0, 0, 1, 1,
-0.05496755, -0.04668161, -2.908562, 0, 0, 0, 1, 1,
-0.05196846, -2.471236, -3.179435, 1, 1, 1, 1, 1,
-0.04620479, 0.8952653, -1.319012, 1, 1, 1, 1, 1,
-0.04166982, 1.025832, -0.7587942, 1, 1, 1, 1, 1,
-0.04122298, -0.1096016, -2.644267, 1, 1, 1, 1, 1,
-0.03757469, -0.9373859, -2.75207, 1, 1, 1, 1, 1,
-0.03668958, 1.049381, -0.6255606, 1, 1, 1, 1, 1,
-0.03551475, -1.075498, -3.788831, 1, 1, 1, 1, 1,
-0.03143604, 0.8194876, -0.1830215, 1, 1, 1, 1, 1,
-0.02579805, 0.1045891, -0.5331846, 1, 1, 1, 1, 1,
-0.02129792, -1.040757, -2.678615, 1, 1, 1, 1, 1,
-0.01633712, 1.567474, 1.504817, 1, 1, 1, 1, 1,
-0.01287761, 0.6669001, 0.3287731, 1, 1, 1, 1, 1,
-0.01081439, -0.1778632, -3.228114, 1, 1, 1, 1, 1,
-0.01058918, -0.2756796, -1.548506, 1, 1, 1, 1, 1,
-0.00976121, -0.3526535, -2.128531, 1, 1, 1, 1, 1,
-0.003388782, -0.3293149, -2.745601, 0, 0, 1, 1, 1,
-0.0006145498, -0.210889, -2.211638, 1, 0, 0, 1, 1,
0.0009674812, 0.3356388, -0.2709277, 1, 0, 0, 1, 1,
0.008796306, 1.767779, 0.02549705, 1, 0, 0, 1, 1,
0.009394214, -0.8818421, 2.321773, 1, 0, 0, 1, 1,
0.009594041, 0.2091582, 0.3170215, 1, 0, 0, 1, 1,
0.01084791, -0.5733782, 2.286411, 0, 0, 0, 1, 1,
0.01324366, -0.20876, 2.536871, 0, 0, 0, 1, 1,
0.01384574, 1.708448, 0.5016347, 0, 0, 0, 1, 1,
0.01535091, 0.3276212, -1.273652, 0, 0, 0, 1, 1,
0.01675218, 1.532228, -1.019638, 0, 0, 0, 1, 1,
0.01815096, 0.1386123, 1.162571, 0, 0, 0, 1, 1,
0.02278787, 0.9231018, -0.5201396, 0, 0, 0, 1, 1,
0.02456854, 1.31814, 0.1260372, 1, 1, 1, 1, 1,
0.02758064, 2.055764, 1.214901, 1, 1, 1, 1, 1,
0.02971641, 1.214538, 0.4686424, 1, 1, 1, 1, 1,
0.0330279, -1.639219, 2.769369, 1, 1, 1, 1, 1,
0.0379932, -0.06211394, 1.266327, 1, 1, 1, 1, 1,
0.04042341, 0.04013444, 1.898547, 1, 1, 1, 1, 1,
0.04166006, 0.4790507, 0.3625717, 1, 1, 1, 1, 1,
0.05098629, -0.2782861, 2.698224, 1, 1, 1, 1, 1,
0.0541067, 0.6901975, -1.150575, 1, 1, 1, 1, 1,
0.05502871, -0.7343754, 2.822918, 1, 1, 1, 1, 1,
0.05899029, 0.1022889, 0.6815488, 1, 1, 1, 1, 1,
0.06275613, -1.778712, 3.696381, 1, 1, 1, 1, 1,
0.0635497, 1.112221, 1.94401, 1, 1, 1, 1, 1,
0.0636006, 1.008327, 0.219496, 1, 1, 1, 1, 1,
0.06769811, -0.1509635, 1.426647, 1, 1, 1, 1, 1,
0.06840914, -0.5129793, 2.92128, 0, 0, 1, 1, 1,
0.06918507, 0.2819124, -1.273644, 1, 0, 0, 1, 1,
0.07657793, -0.6619391, 3.916856, 1, 0, 0, 1, 1,
0.07801332, -0.2276747, 3.492249, 1, 0, 0, 1, 1,
0.07926872, -0.1071564, 2.37501, 1, 0, 0, 1, 1,
0.08269254, -0.936788, 0.5003274, 1, 0, 0, 1, 1,
0.09109661, 0.2396549, 0.399749, 0, 0, 0, 1, 1,
0.09226895, -0.2645457, 1.15532, 0, 0, 0, 1, 1,
0.09321919, -1.028874, 2.619091, 0, 0, 0, 1, 1,
0.09698124, -0.9728055, 3.632005, 0, 0, 0, 1, 1,
0.0984432, -0.102959, 2.473467, 0, 0, 0, 1, 1,
0.1013359, 0.1112587, 1.730634, 0, 0, 0, 1, 1,
0.1015038, 0.6247738, 1.737124, 0, 0, 0, 1, 1,
0.1023822, -0.3711868, 4.466432, 1, 1, 1, 1, 1,
0.1024788, -0.7722753, 3.863224, 1, 1, 1, 1, 1,
0.1043051, -0.7946079, 1.974801, 1, 1, 1, 1, 1,
0.1060627, -0.7818468, 2.212131, 1, 1, 1, 1, 1,
0.1080774, -0.04508687, 2.028874, 1, 1, 1, 1, 1,
0.1085892, 1.302409, -1.629254, 1, 1, 1, 1, 1,
0.1103894, -0.2344918, 1.962864, 1, 1, 1, 1, 1,
0.110958, -0.3448336, 2.352492, 1, 1, 1, 1, 1,
0.1188635, 2.132357, -1.116311, 1, 1, 1, 1, 1,
0.1211615, -1.138978, 3.108093, 1, 1, 1, 1, 1,
0.1214224, 0.08771828, 1.082811, 1, 1, 1, 1, 1,
0.1281311, 1.346292, 1.082497, 1, 1, 1, 1, 1,
0.1381678, 0.9322309, 0.2582, 1, 1, 1, 1, 1,
0.1401937, 1.44312, -1.926841, 1, 1, 1, 1, 1,
0.1426771, 0.8796595, -1.029187, 1, 1, 1, 1, 1,
0.1480033, 0.1241432, 1.379298, 0, 0, 1, 1, 1,
0.1481242, -0.00999105, 0.678824, 1, 0, 0, 1, 1,
0.150198, -0.8070024, 3.791068, 1, 0, 0, 1, 1,
0.154954, 1.732563, -0.2475819, 1, 0, 0, 1, 1,
0.1560612, 0.1251809, 1.366837, 1, 0, 0, 1, 1,
0.1586972, 0.5687798, 0.4672197, 1, 0, 0, 1, 1,
0.1604341, -0.6467356, 3.5319, 0, 0, 0, 1, 1,
0.1630857, -0.9168262, 3.035813, 0, 0, 0, 1, 1,
0.1632488, -0.07614937, 2.629719, 0, 0, 0, 1, 1,
0.1635197, -2.385952, 3.86763, 0, 0, 0, 1, 1,
0.1669026, -0.8528439, 2.351738, 0, 0, 0, 1, 1,
0.1676121, 1.620112, -1.210263, 0, 0, 0, 1, 1,
0.1677969, 1.433775, -0.7318023, 0, 0, 0, 1, 1,
0.1678271, 0.944998, 0.1566627, 1, 1, 1, 1, 1,
0.1772031, -0.8513501, 2.148947, 1, 1, 1, 1, 1,
0.1772384, -0.2215996, -0.07999244, 1, 1, 1, 1, 1,
0.1778461, 0.683118, 0.8728587, 1, 1, 1, 1, 1,
0.1797376, 0.1046189, 1.320764, 1, 1, 1, 1, 1,
0.1849588, 0.640445, 1.123685, 1, 1, 1, 1, 1,
0.1891385, 0.647767, 0.169686, 1, 1, 1, 1, 1,
0.1911707, -0.5553022, 0.7248962, 1, 1, 1, 1, 1,
0.1932552, 0.2868965, 0.9667565, 1, 1, 1, 1, 1,
0.1938362, 0.762987, 0.6740088, 1, 1, 1, 1, 1,
0.2022621, 1.170453, 0.3641829, 1, 1, 1, 1, 1,
0.2032537, 0.4914291, -0.1602661, 1, 1, 1, 1, 1,
0.209892, -1.738795, 1.528427, 1, 1, 1, 1, 1,
0.2173624, 0.8784018, 0.02195779, 1, 1, 1, 1, 1,
0.2213556, -0.3053026, 3.45316, 1, 1, 1, 1, 1,
0.2214549, 1.617617, -0.2886036, 0, 0, 1, 1, 1,
0.2224189, -0.6002359, 4.686893, 1, 0, 0, 1, 1,
0.228664, -0.08360108, 0.8240331, 1, 0, 0, 1, 1,
0.2289174, 0.1387072, 0.8687071, 1, 0, 0, 1, 1,
0.2301046, 2.887198, 0.6283379, 1, 0, 0, 1, 1,
0.2311638, 0.1391226, 0.1077467, 1, 0, 0, 1, 1,
0.2320298, 1.541642, -0.5693243, 0, 0, 0, 1, 1,
0.2354924, -1.516706, 2.48606, 0, 0, 0, 1, 1,
0.2361631, 0.5821402, -0.8939152, 0, 0, 0, 1, 1,
0.2414643, -1.119133, 3.248581, 0, 0, 0, 1, 1,
0.2453607, 1.097657, 0.1771827, 0, 0, 0, 1, 1,
0.2510654, -0.8496826, 1.545091, 0, 0, 0, 1, 1,
0.2548046, 1.048168, 0.3917646, 0, 0, 0, 1, 1,
0.25872, -0.618134, 4.098094, 1, 1, 1, 1, 1,
0.2612164, -1.024927, 3.506765, 1, 1, 1, 1, 1,
0.2628886, 1.867946, -0.4088818, 1, 1, 1, 1, 1,
0.2644094, 0.4943987, -0.7902192, 1, 1, 1, 1, 1,
0.2685918, -0.5141935, 4.506581, 1, 1, 1, 1, 1,
0.2727281, 0.4019662, 2.107907, 1, 1, 1, 1, 1,
0.2811616, -0.7163193, 2.526086, 1, 1, 1, 1, 1,
0.2824658, 1.319983, 1.30434, 1, 1, 1, 1, 1,
0.2873729, -2.453708, 2.460652, 1, 1, 1, 1, 1,
0.2925781, 1.225359, -1.786767, 1, 1, 1, 1, 1,
0.2930304, 1.394427, 1.613308, 1, 1, 1, 1, 1,
0.2988732, -0.8165021, 2.246341, 1, 1, 1, 1, 1,
0.2993467, 1.151464, 0.4098826, 1, 1, 1, 1, 1,
0.3024763, 0.8945705, 0.08975724, 1, 1, 1, 1, 1,
0.3030685, 0.5814623, 1.465035, 1, 1, 1, 1, 1,
0.312266, -1.398438, 3.542495, 0, 0, 1, 1, 1,
0.3144669, 0.9634363, -1.596114, 1, 0, 0, 1, 1,
0.3154353, -0.1057495, 2.236111, 1, 0, 0, 1, 1,
0.3167595, -0.5401462, 3.03109, 1, 0, 0, 1, 1,
0.3215377, 0.5263816, 0.5370896, 1, 0, 0, 1, 1,
0.3233266, 0.1351826, 2.150015, 1, 0, 0, 1, 1,
0.325599, -1.065076, 2.350227, 0, 0, 0, 1, 1,
0.3274454, 0.2903804, 0.8754327, 0, 0, 0, 1, 1,
0.3275022, 1.873752, -0.2736974, 0, 0, 0, 1, 1,
0.3280666, 1.269507, -0.2303057, 0, 0, 0, 1, 1,
0.3284279, 1.007436, 0.2332166, 0, 0, 0, 1, 1,
0.3338113, -1.192987, 3.266146, 0, 0, 0, 1, 1,
0.33413, 1.009308, -1.089981, 0, 0, 0, 1, 1,
0.3372047, -0.2439396, 1.96465, 1, 1, 1, 1, 1,
0.3493259, -0.6021636, 0.4516783, 1, 1, 1, 1, 1,
0.3501698, 0.8957821, 1.037356, 1, 1, 1, 1, 1,
0.3531818, 0.04890508, 2.670794, 1, 1, 1, 1, 1,
0.3587904, 2.49931, -0.9702247, 1, 1, 1, 1, 1,
0.3595007, -0.0675879, -0.4759906, 1, 1, 1, 1, 1,
0.361657, 0.005966494, 3.110888, 1, 1, 1, 1, 1,
0.363668, -0.2723017, 0.1796968, 1, 1, 1, 1, 1,
0.367121, -0.7346355, 2.902493, 1, 1, 1, 1, 1,
0.3695326, -0.8865057, 4.119562, 1, 1, 1, 1, 1,
0.3700675, 0.6033177, 0.3057678, 1, 1, 1, 1, 1,
0.373951, -0.432604, 2.786438, 1, 1, 1, 1, 1,
0.3815373, 1.201479, -0.7707506, 1, 1, 1, 1, 1,
0.3880382, -0.603623, 1.804618, 1, 1, 1, 1, 1,
0.3948788, -0.2658831, 1.878045, 1, 1, 1, 1, 1,
0.3959408, -1.253198, 3.739701, 0, 0, 1, 1, 1,
0.3976395, -2.572357, 2.036741, 1, 0, 0, 1, 1,
0.4024995, 0.5273854, 0.3959612, 1, 0, 0, 1, 1,
0.4028763, 0.358495, 0.2265699, 1, 0, 0, 1, 1,
0.4096646, 0.6148414, 0.829914, 1, 0, 0, 1, 1,
0.4100646, 0.705101, 3.09163, 1, 0, 0, 1, 1,
0.4181794, -1.093168, 1.90353, 0, 0, 0, 1, 1,
0.4209646, 0.6679819, 1.308292, 0, 0, 0, 1, 1,
0.4219497, -1.563082, 1.089119, 0, 0, 0, 1, 1,
0.4238525, 0.2675012, -0.1833562, 0, 0, 0, 1, 1,
0.4261827, -0.2462354, 4.327045, 0, 0, 0, 1, 1,
0.4284197, -1.210139, 2.54619, 0, 0, 0, 1, 1,
0.4308308, 2.517672, -0.2173189, 0, 0, 0, 1, 1,
0.4336857, 1.345753, 0.3058319, 1, 1, 1, 1, 1,
0.4357483, -0.1592302, 1.811833, 1, 1, 1, 1, 1,
0.4433859, 0.1125733, 0.8583038, 1, 1, 1, 1, 1,
0.4452617, -0.7138526, 2.735337, 1, 1, 1, 1, 1,
0.4456888, 0.4869522, 0.3462017, 1, 1, 1, 1, 1,
0.4473516, -0.6454207, 2.959769, 1, 1, 1, 1, 1,
0.4501679, 1.199832, 0.4588313, 1, 1, 1, 1, 1,
0.4506754, -1.112902, 3.863421, 1, 1, 1, 1, 1,
0.454102, -0.5824356, 2.646699, 1, 1, 1, 1, 1,
0.4542012, 0.4957434, 0.4937003, 1, 1, 1, 1, 1,
0.4562237, -0.2066499, 2.925127, 1, 1, 1, 1, 1,
0.4575001, 1.130363, -0.07899166, 1, 1, 1, 1, 1,
0.458048, -0.2396359, 2.675559, 1, 1, 1, 1, 1,
0.459327, 0.3528517, -1.279655, 1, 1, 1, 1, 1,
0.4634852, 0.4190795, 2.157476, 1, 1, 1, 1, 1,
0.463857, -0.9185339, 1.568867, 0, 0, 1, 1, 1,
0.4648534, -0.1553264, 1.617206, 1, 0, 0, 1, 1,
0.4662706, -1.559269, 1.820809, 1, 0, 0, 1, 1,
0.4662909, 1.630187, -2.605404, 1, 0, 0, 1, 1,
0.4679351, 0.2884771, 1.253985, 1, 0, 0, 1, 1,
0.471939, -0.7454908, 3.341901, 1, 0, 0, 1, 1,
0.4745579, 0.5366466, 1.712699, 0, 0, 0, 1, 1,
0.4746509, 1.15302, 0.9965671, 0, 0, 0, 1, 1,
0.4757796, 0.6254022, 0.7699363, 0, 0, 0, 1, 1,
0.4818137, 1.268352, 1.732702, 0, 0, 0, 1, 1,
0.4845856, 0.1893636, 1.316771, 0, 0, 0, 1, 1,
0.4850433, 0.1540839, 1.226525, 0, 0, 0, 1, 1,
0.492078, 1.763696, 0.3177433, 0, 0, 0, 1, 1,
0.4930329, 1.230348, 0.9407765, 1, 1, 1, 1, 1,
0.497199, -1.720871, 3.638014, 1, 1, 1, 1, 1,
0.4980178, -0.4013779, 4.894547, 1, 1, 1, 1, 1,
0.4991561, -0.02320441, 1.291572, 1, 1, 1, 1, 1,
0.501877, 2.103204, 0.8728274, 1, 1, 1, 1, 1,
0.5033749, -0.05443789, 1.294231, 1, 1, 1, 1, 1,
0.5048194, -1.150463, 3.360282, 1, 1, 1, 1, 1,
0.5078855, -0.08515602, 1.435496, 1, 1, 1, 1, 1,
0.5093724, 0.1367978, 2.937159, 1, 1, 1, 1, 1,
0.517801, 2.089881, 0.1428209, 1, 1, 1, 1, 1,
0.521365, -0.7622559, 2.246946, 1, 1, 1, 1, 1,
0.5242594, -0.001152894, 2.014695, 1, 1, 1, 1, 1,
0.533963, -0.07650993, 1.989314, 1, 1, 1, 1, 1,
0.5423462, -2.201381, 2.748906, 1, 1, 1, 1, 1,
0.5457543, 0.5979583, 0.5728411, 1, 1, 1, 1, 1,
0.5459501, 1.43365, -0.3037705, 0, 0, 1, 1, 1,
0.5495846, -0.5777175, 2.326043, 1, 0, 0, 1, 1,
0.5533844, 0.4722063, 1.309935, 1, 0, 0, 1, 1,
0.553588, -1.455895, 3.258571, 1, 0, 0, 1, 1,
0.5566863, 0.5627081, 1.94084, 1, 0, 0, 1, 1,
0.5573088, 0.6900638, -1.990626, 1, 0, 0, 1, 1,
0.5582393, 0.8058462, 1.511131, 0, 0, 0, 1, 1,
0.561987, 0.7810004, 0.3813446, 0, 0, 0, 1, 1,
0.5635188, 0.9660577, 1.513356, 0, 0, 0, 1, 1,
0.5650392, 0.2157325, 1.028348, 0, 0, 0, 1, 1,
0.5682254, 0.3083375, 1.721291, 0, 0, 0, 1, 1,
0.5688043, 0.2046631, 0.472603, 0, 0, 0, 1, 1,
0.5699569, 0.11299, 1.461334, 0, 0, 0, 1, 1,
0.5738813, 1.809772, 0.4825008, 1, 1, 1, 1, 1,
0.5787222, 0.469333, -0.02998666, 1, 1, 1, 1, 1,
0.5844387, -0.3173026, 1.447806, 1, 1, 1, 1, 1,
0.5860154, 0.6164864, 1.266402, 1, 1, 1, 1, 1,
0.5863723, -0.52226, 4.099406, 1, 1, 1, 1, 1,
0.5890969, 0.3509834, -0.8306198, 1, 1, 1, 1, 1,
0.5892696, -0.7259791, 2.456003, 1, 1, 1, 1, 1,
0.5945963, -0.3401288, 3.366459, 1, 1, 1, 1, 1,
0.5990639, -0.2988113, 2.605824, 1, 1, 1, 1, 1,
0.6043962, 0.9983143, 0.7028959, 1, 1, 1, 1, 1,
0.6076623, 0.6725976, 2.212742, 1, 1, 1, 1, 1,
0.6094157, -1.170506, 2.276179, 1, 1, 1, 1, 1,
0.6162984, 2.319568, 1.183765, 1, 1, 1, 1, 1,
0.6197302, -0.2698385, 2.298929, 1, 1, 1, 1, 1,
0.6209939, 1.157355, 0.2182842, 1, 1, 1, 1, 1,
0.6250225, -0.4399773, 1.150923, 0, 0, 1, 1, 1,
0.6254312, -0.2531678, 1.776279, 1, 0, 0, 1, 1,
0.6266539, 0.7319434, -0.9569706, 1, 0, 0, 1, 1,
0.6287637, 0.6476268, 0.5750543, 1, 0, 0, 1, 1,
0.6295419, -0.4745257, 3.042482, 1, 0, 0, 1, 1,
0.6352022, -0.8197575, 1.141709, 1, 0, 0, 1, 1,
0.6356757, -0.208493, 2.780854, 0, 0, 0, 1, 1,
0.6411906, 0.9110051, 1.698141, 0, 0, 0, 1, 1,
0.6492077, -1.574039, 3.917792, 0, 0, 0, 1, 1,
0.6505008, 0.3651367, 1.762798, 0, 0, 0, 1, 1,
0.6648251, 0.01707928, 1.529961, 0, 0, 0, 1, 1,
0.6681263, -1.085935, 4.293617, 0, 0, 0, 1, 1,
0.6683519, 0.6085538, 1.418432, 0, 0, 0, 1, 1,
0.6709015, 1.554906, 0.6104059, 1, 1, 1, 1, 1,
0.6855864, 0.7746182, 1.1805, 1, 1, 1, 1, 1,
0.6860538, 1.058064, 0.8507448, 1, 1, 1, 1, 1,
0.6877352, -0.4779166, 4.141447, 1, 1, 1, 1, 1,
0.6888574, 0.1265375, 0.7785926, 1, 1, 1, 1, 1,
0.6911231, 0.9440504, 0.05111287, 1, 1, 1, 1, 1,
0.6917894, -0.737096, 3.071398, 1, 1, 1, 1, 1,
0.6919436, -0.7766259, 3.597957, 1, 1, 1, 1, 1,
0.6929263, -0.05967952, 0.3637777, 1, 1, 1, 1, 1,
0.7035162, 0.8885072, -0.05755425, 1, 1, 1, 1, 1,
0.7053204, 0.9171474, 2.638919, 1, 1, 1, 1, 1,
0.7071849, -0.5614824, 1.738252, 1, 1, 1, 1, 1,
0.7088782, 0.07044205, 1.549937, 1, 1, 1, 1, 1,
0.7123516, -0.9266534, 1.686268, 1, 1, 1, 1, 1,
0.712382, 1.205701, 0.01200999, 1, 1, 1, 1, 1,
0.7137085, -0.8530237, 3.240944, 0, 0, 1, 1, 1,
0.716501, 0.5652638, 0.6058681, 1, 0, 0, 1, 1,
0.7166257, -0.01214486, 1.515193, 1, 0, 0, 1, 1,
0.7222901, 0.577347, 1.922865, 1, 0, 0, 1, 1,
0.723793, 0.2475021, 0.8276227, 1, 0, 0, 1, 1,
0.7245778, -0.5651088, 2.194095, 1, 0, 0, 1, 1,
0.7246524, 1.094154, 0.07685874, 0, 0, 0, 1, 1,
0.7297032, -0.6859978, 0.9470121, 0, 0, 0, 1, 1,
0.7366492, 0.6696667, -0.5994083, 0, 0, 0, 1, 1,
0.7377525, 0.2309054, 2.726231, 0, 0, 0, 1, 1,
0.7400566, 0.3592121, 0.08456552, 0, 0, 0, 1, 1,
0.7401342, 1.358719, 0.5937626, 0, 0, 0, 1, 1,
0.7427863, -0.3041185, 0.905151, 0, 0, 0, 1, 1,
0.7462693, 0.3480649, 2.696633, 1, 1, 1, 1, 1,
0.7476986, -0.3912409, 2.839952, 1, 1, 1, 1, 1,
0.7477667, -2.050639, 2.529345, 1, 1, 1, 1, 1,
0.7504347, 2.809719, -0.821303, 1, 1, 1, 1, 1,
0.7520339, -0.1498044, 1.044419, 1, 1, 1, 1, 1,
0.7524202, -0.7760258, 3.435712, 1, 1, 1, 1, 1,
0.7544388, -0.7152734, 2.807245, 1, 1, 1, 1, 1,
0.7555016, -0.1389647, 2.075378, 1, 1, 1, 1, 1,
0.759172, -0.5309824, 4.113811, 1, 1, 1, 1, 1,
0.7622421, -0.2934017, 3.643035, 1, 1, 1, 1, 1,
0.7624342, -1.338566, 3.349302, 1, 1, 1, 1, 1,
0.763533, 1.00158, -0.3428625, 1, 1, 1, 1, 1,
0.769138, -0.3544706, 4.688854, 1, 1, 1, 1, 1,
0.7742036, 0.9950249, 0.9253057, 1, 1, 1, 1, 1,
0.7751766, 0.3658958, 1.151041, 1, 1, 1, 1, 1,
0.7758937, 1.206422, 0.4891205, 0, 0, 1, 1, 1,
0.7877826, -0.59124, 2.95242, 1, 0, 0, 1, 1,
0.7966271, -0.6934999, 1.977518, 1, 0, 0, 1, 1,
0.7969886, 0.9327575, 0.7324303, 1, 0, 0, 1, 1,
0.7974768, -0.6696088, 1.719987, 1, 0, 0, 1, 1,
0.7977, 0.1586831, 1.216552, 1, 0, 0, 1, 1,
0.8009135, 0.4003745, 1.447724, 0, 0, 0, 1, 1,
0.8069757, 1.039809, -0.6384478, 0, 0, 0, 1, 1,
0.8118846, 0.5796618, 1.456774, 0, 0, 0, 1, 1,
0.8145144, 0.5819577, 1.728566, 0, 0, 0, 1, 1,
0.8210064, 0.8736456, -0.730767, 0, 0, 0, 1, 1,
0.8285198, 0.4297197, 2.294693, 0, 0, 0, 1, 1,
0.8402552, -0.5134493, 1.337587, 0, 0, 0, 1, 1,
0.8466905, -0.9922309, 2.58216, 1, 1, 1, 1, 1,
0.8468666, 0.7594101, 2.096543, 1, 1, 1, 1, 1,
0.8506594, -0.03140584, 3.195775, 1, 1, 1, 1, 1,
0.8511396, 2.803447, -0.6399608, 1, 1, 1, 1, 1,
0.8520338, 0.4510843, 1.429999, 1, 1, 1, 1, 1,
0.8524552, -1.360107, 2.410393, 1, 1, 1, 1, 1,
0.8529898, 1.276069, 0.876783, 1, 1, 1, 1, 1,
0.8552414, 0.0001939469, 1.679464, 1, 1, 1, 1, 1,
0.8645841, -2.626412, 2.232497, 1, 1, 1, 1, 1,
0.8650829, 1.613197, 0.3283738, 1, 1, 1, 1, 1,
0.865131, 0.9028021, 0.640772, 1, 1, 1, 1, 1,
0.8681013, 1.398155, 0.01780018, 1, 1, 1, 1, 1,
0.8762672, -1.179629, 1.431974, 1, 1, 1, 1, 1,
0.8824342, 0.612528, 1.551957, 1, 1, 1, 1, 1,
0.8830209, 2.545417, -0.05840717, 1, 1, 1, 1, 1,
0.8939305, -1.379981, 4.079066, 0, 0, 1, 1, 1,
0.8947623, -1.131801, 3.801338, 1, 0, 0, 1, 1,
0.8963795, 0.8183111, 1.135841, 1, 0, 0, 1, 1,
0.8983082, 1.696263, -1.23205, 1, 0, 0, 1, 1,
0.9050639, 0.9311808, 2.22323, 1, 0, 0, 1, 1,
0.9056049, 2.379436, -0.455828, 1, 0, 0, 1, 1,
0.9057731, -1.865454, 2.466583, 0, 0, 0, 1, 1,
0.9080909, 1.008142, 1.989303, 0, 0, 0, 1, 1,
0.9087598, 1.522848, 0.7564805, 0, 0, 0, 1, 1,
0.9174761, 0.3297712, 1.591201, 0, 0, 0, 1, 1,
0.9180689, 0.2033231, 2.856569, 0, 0, 0, 1, 1,
0.9186601, -0.9280511, 0.8647868, 0, 0, 0, 1, 1,
0.920104, -0.3113909, 3.212572, 0, 0, 0, 1, 1,
0.9207392, 0.09659935, 0.7668328, 1, 1, 1, 1, 1,
0.9213966, 0.9115613, 0.5508808, 1, 1, 1, 1, 1,
0.9266656, -0.5739518, 1.608485, 1, 1, 1, 1, 1,
0.9275184, 0.6542304, -0.07259646, 1, 1, 1, 1, 1,
0.9296035, 0.785064, 0.3342671, 1, 1, 1, 1, 1,
0.9311634, -0.6627126, 3.467465, 1, 1, 1, 1, 1,
0.9317085, 0.1208702, 1.920449, 1, 1, 1, 1, 1,
0.9335579, -0.01733329, 1.57436, 1, 1, 1, 1, 1,
0.9384065, -0.4240218, 2.002885, 1, 1, 1, 1, 1,
0.9484566, 1.106609, 0.7696969, 1, 1, 1, 1, 1,
0.95333, -0.07033926, 1.58356, 1, 1, 1, 1, 1,
0.9576733, -0.5373654, 1.260961, 1, 1, 1, 1, 1,
0.9592032, -1.444403, 2.043816, 1, 1, 1, 1, 1,
0.9618121, 0.4662117, 1.420744, 1, 1, 1, 1, 1,
0.9666598, 1.851217, 0.5268768, 1, 1, 1, 1, 1,
0.975817, 1.488843, -0.2753208, 0, 0, 1, 1, 1,
0.9790202, 0.8881549, 0.7030541, 1, 0, 0, 1, 1,
0.9796031, 1.326369, -0.9690557, 1, 0, 0, 1, 1,
0.9801615, 0.8449594, 1.261429, 1, 0, 0, 1, 1,
0.9856318, -0.3291695, 2.609065, 1, 0, 0, 1, 1,
0.9882241, -0.6291566, 2.908764, 1, 0, 0, 1, 1,
1.003348, 1.758816, 1.153391, 0, 0, 0, 1, 1,
1.007301, 0.5742983, 0.3931452, 0, 0, 0, 1, 1,
1.008591, -0.8249604, 2.466018, 0, 0, 0, 1, 1,
1.012333, 1.060974, 0.8017817, 0, 0, 0, 1, 1,
1.016667, -0.3426385, 1.283121, 0, 0, 0, 1, 1,
1.021596, -2.292187, 3.435113, 0, 0, 0, 1, 1,
1.027088, -0.8994034, 2.957076, 0, 0, 0, 1, 1,
1.028189, -0.2094698, 1.452938, 1, 1, 1, 1, 1,
1.033997, -0.673159, -0.1517193, 1, 1, 1, 1, 1,
1.034667, 0.1169261, 1.852901, 1, 1, 1, 1, 1,
1.036108, -1.435031, 2.896998, 1, 1, 1, 1, 1,
1.043463, -0.1542035, 3.270342, 1, 1, 1, 1, 1,
1.04433, 0.4904635, -0.3240812, 1, 1, 1, 1, 1,
1.046239, -0.527804, 2.725741, 1, 1, 1, 1, 1,
1.047148, -0.005171728, -0.07072443, 1, 1, 1, 1, 1,
1.047585, 1.666264, 0.6675751, 1, 1, 1, 1, 1,
1.048615, -0.4925573, 1.569897, 1, 1, 1, 1, 1,
1.048799, 0.07649603, 1.263012, 1, 1, 1, 1, 1,
1.052863, 0.02000723, 0.9944606, 1, 1, 1, 1, 1,
1.059891, 0.6106323, 0.6773674, 1, 1, 1, 1, 1,
1.061051, 0.3139923, 1.073976, 1, 1, 1, 1, 1,
1.062974, -0.1795458, -0.4322901, 1, 1, 1, 1, 1,
1.066043, 1.20876, 0.0674376, 0, 0, 1, 1, 1,
1.067814, 0.2494091, 2.041676, 1, 0, 0, 1, 1,
1.076649, -0.9453518, 3.349962, 1, 0, 0, 1, 1,
1.080531, 1.042879, -1.139983, 1, 0, 0, 1, 1,
1.080703, 0.6316809, 2.218087, 1, 0, 0, 1, 1,
1.087708, 0.6977433, 0.05974252, 1, 0, 0, 1, 1,
1.090254, 0.4853047, 0.3820325, 0, 0, 0, 1, 1,
1.095544, -0.4762241, 1.739823, 0, 0, 0, 1, 1,
1.097035, 0.4385561, 0.3169152, 0, 0, 0, 1, 1,
1.11501, 0.8598226, 0.6221336, 0, 0, 0, 1, 1,
1.119555, -0.5879375, 2.130453, 0, 0, 0, 1, 1,
1.119645, 0.9063605, 0.8507047, 0, 0, 0, 1, 1,
1.121301, 0.2983643, 1.1644, 0, 0, 0, 1, 1,
1.122278, -0.4705284, 1.120836, 1, 1, 1, 1, 1,
1.124423, 0.1766872, 1.239906, 1, 1, 1, 1, 1,
1.127052, 1.034441, 1.124804, 1, 1, 1, 1, 1,
1.127322, 0.6902648, 2.083707, 1, 1, 1, 1, 1,
1.129635, -0.1543484, 0.5682856, 1, 1, 1, 1, 1,
1.13487, 1.499916, -0.9076434, 1, 1, 1, 1, 1,
1.137839, -1.978406, 3.062767, 1, 1, 1, 1, 1,
1.143558, -0.5914639, 1.740166, 1, 1, 1, 1, 1,
1.143869, 1.100368, 2.401107, 1, 1, 1, 1, 1,
1.145128, 1.170821, 1.140125, 1, 1, 1, 1, 1,
1.148146, 1.298942, 1.949016, 1, 1, 1, 1, 1,
1.148319, 0.07393661, 0.817543, 1, 1, 1, 1, 1,
1.152658, 0.09874412, 1.294903, 1, 1, 1, 1, 1,
1.152988, -1.494886, 2.520576, 1, 1, 1, 1, 1,
1.157458, -0.1359557, 1.686255, 1, 1, 1, 1, 1,
1.160378, 1.336248, 0.6522799, 0, 0, 1, 1, 1,
1.160986, -1.237062, 0.8645244, 1, 0, 0, 1, 1,
1.173975, -1.018536, 1.076628, 1, 0, 0, 1, 1,
1.18752, 2.112176, -0.7456536, 1, 0, 0, 1, 1,
1.189368, -0.6578112, 1.822888, 1, 0, 0, 1, 1,
1.193815, 0.09396093, 1.53209, 1, 0, 0, 1, 1,
1.195415, -0.9705723, 2.687151, 0, 0, 0, 1, 1,
1.217427, -0.09695466, 0.1547792, 0, 0, 0, 1, 1,
1.221008, 0.5014812, 0.8555328, 0, 0, 0, 1, 1,
1.234157, 0.7377151, 1.591894, 0, 0, 0, 1, 1,
1.236527, 0.177754, 0.0691391, 0, 0, 0, 1, 1,
1.243786, 1.341601, 1.656388, 0, 0, 0, 1, 1,
1.252282, 1.492242, 0.9121495, 0, 0, 0, 1, 1,
1.258211, -0.9649508, 1.862511, 1, 1, 1, 1, 1,
1.2612, 2.195529, -0.5986434, 1, 1, 1, 1, 1,
1.261896, 1.332445, 0.4025257, 1, 1, 1, 1, 1,
1.274387, -0.2575954, 1.958314, 1, 1, 1, 1, 1,
1.277637, -0.1054562, 1.548631, 1, 1, 1, 1, 1,
1.279205, 2.64478, -1.420638, 1, 1, 1, 1, 1,
1.281537, -0.6425797, 0.7918065, 1, 1, 1, 1, 1,
1.284338, 0.05605831, 0.9669874, 1, 1, 1, 1, 1,
1.287238, -0.8294314, 3.484962, 1, 1, 1, 1, 1,
1.288898, 0.2197231, 1.689879, 1, 1, 1, 1, 1,
1.294168, 0.8041157, 2.6639, 1, 1, 1, 1, 1,
1.30511, 0.01151061, 2.249046, 1, 1, 1, 1, 1,
1.308233, -0.06000241, 0.7996482, 1, 1, 1, 1, 1,
1.320877, 1.662647, 2.15825, 1, 1, 1, 1, 1,
1.322474, -1.459651, 1.172847, 1, 1, 1, 1, 1,
1.325231, 1.10548, -1.160624, 0, 0, 1, 1, 1,
1.328833, -2.416875, 2.753662, 1, 0, 0, 1, 1,
1.332441, 0.05597537, 0.3156523, 1, 0, 0, 1, 1,
1.332818, 2.137886, -1.960691, 1, 0, 0, 1, 1,
1.334305, -1.299036, 3.303984, 1, 0, 0, 1, 1,
1.345064, 0.6513902, 1.100952, 1, 0, 0, 1, 1,
1.345661, -1.141053, 2.791842, 0, 0, 0, 1, 1,
1.358263, -0.5119801, 2.254347, 0, 0, 0, 1, 1,
1.363096, 0.2609653, 2.127118, 0, 0, 0, 1, 1,
1.370153, -0.2935246, 0.3600146, 0, 0, 0, 1, 1,
1.372266, -0.4573443, 0.1104971, 0, 0, 0, 1, 1,
1.374138, -1.594409, 2.507822, 0, 0, 0, 1, 1,
1.383096, -0.1936503, 1.584627, 0, 0, 0, 1, 1,
1.391, 1.0299, 1.166173, 1, 1, 1, 1, 1,
1.391518, 0.00207428, 2.122802, 1, 1, 1, 1, 1,
1.393601, 0.1031076, 2.417002, 1, 1, 1, 1, 1,
1.411078, 0.8955508, 0.264577, 1, 1, 1, 1, 1,
1.41388, 0.3341798, 0.5252495, 1, 1, 1, 1, 1,
1.428627, 0.7854652, 0.7187619, 1, 1, 1, 1, 1,
1.442637, -0.2374489, 0.3178108, 1, 1, 1, 1, 1,
1.450122, 0.4444611, -0.5260886, 1, 1, 1, 1, 1,
1.451511, 0.3612691, 0.630664, 1, 1, 1, 1, 1,
1.467991, 0.6737247, -0.2189357, 1, 1, 1, 1, 1,
1.480392, -0.2844379, 1.574005, 1, 1, 1, 1, 1,
1.483645, -1.603296, 3.342768, 1, 1, 1, 1, 1,
1.490616, 0.9132155, 1.454646, 1, 1, 1, 1, 1,
1.490952, -0.5140179, 2.040419, 1, 1, 1, 1, 1,
1.492047, -1.662336, 1.602877, 1, 1, 1, 1, 1,
1.495608, 0.7236069, 1.223374, 0, 0, 1, 1, 1,
1.508558, -0.5753928, 2.049459, 1, 0, 0, 1, 1,
1.50999, 1.154993, 0.9899089, 1, 0, 0, 1, 1,
1.512876, 0.874183, 0.1992303, 1, 0, 0, 1, 1,
1.513959, -0.4330494, 0.2002476, 1, 0, 0, 1, 1,
1.517906, 0.2017754, 0.4459077, 1, 0, 0, 1, 1,
1.521775, 1.515244, 1.583841, 0, 0, 0, 1, 1,
1.531274, 0.2931593, 2.468944, 0, 0, 0, 1, 1,
1.536948, 0.4936136, 1.795995, 0, 0, 0, 1, 1,
1.549766, -0.2326768, 1.672564, 0, 0, 0, 1, 1,
1.550299, -0.5515532, 1.549518, 0, 0, 0, 1, 1,
1.554484, -0.918754, 2.035344, 0, 0, 0, 1, 1,
1.567688, 0.3119121, 1.842219, 0, 0, 0, 1, 1,
1.575918, 0.4064038, 0.9116045, 1, 1, 1, 1, 1,
1.583574, -1.180637, 1.052082, 1, 1, 1, 1, 1,
1.585655, 0.3133408, 0.7653219, 1, 1, 1, 1, 1,
1.593078, 0.6596252, 0.8077697, 1, 1, 1, 1, 1,
1.616245, 1.244847, 2.076544, 1, 1, 1, 1, 1,
1.624398, 0.1129076, 0.1673561, 1, 1, 1, 1, 1,
1.625348, -0.5393842, 2.050348, 1, 1, 1, 1, 1,
1.627773, 0.4653373, 0.7553948, 1, 1, 1, 1, 1,
1.631176, 0.9013227, 0.4568991, 1, 1, 1, 1, 1,
1.632445, 0.6099897, 1.260533, 1, 1, 1, 1, 1,
1.634291, -0.6329918, -0.009111711, 1, 1, 1, 1, 1,
1.635893, -3.455236, 3.522534, 1, 1, 1, 1, 1,
1.639784, 2.4993, -0.2008663, 1, 1, 1, 1, 1,
1.658281, 1.651728, 1.224116, 1, 1, 1, 1, 1,
1.661622, 0.2319157, 2.011739, 1, 1, 1, 1, 1,
1.665803, -0.4540341, 1.692028, 0, 0, 1, 1, 1,
1.672691, 0.006377244, 2.817384, 1, 0, 0, 1, 1,
1.692265, -2.23314, 1.327579, 1, 0, 0, 1, 1,
1.692553, -1.998461, 2.507634, 1, 0, 0, 1, 1,
1.70978, 1.608801, 0.4932139, 1, 0, 0, 1, 1,
1.71458, -0.9238384, 3.584689, 1, 0, 0, 1, 1,
1.715761, -0.6243807, 1.919646, 0, 0, 0, 1, 1,
1.728027, -0.4629271, 1.96344, 0, 0, 0, 1, 1,
1.733132, -0.5090823, 2.624076, 0, 0, 0, 1, 1,
1.733782, -0.9821562, 1.911001, 0, 0, 0, 1, 1,
1.738659, 0.03361156, 0.4490513, 0, 0, 0, 1, 1,
1.746485, -1.077844, 3.44676, 0, 0, 0, 1, 1,
1.748465, -0.9795348, 2.377063, 0, 0, 0, 1, 1,
1.764118, 0.6434065, 2.133341, 1, 1, 1, 1, 1,
1.809086, 0.2901546, 2.093568, 1, 1, 1, 1, 1,
1.825282, 0.6079294, 0.3758009, 1, 1, 1, 1, 1,
1.825573, 0.1871026, 2.821336, 1, 1, 1, 1, 1,
1.827388, 1.33873, -0.7820746, 1, 1, 1, 1, 1,
1.828115, 1.602845, 0.3317366, 1, 1, 1, 1, 1,
1.828261, -0.3000418, 0.7916992, 1, 1, 1, 1, 1,
1.847474, -1.223902, 3.472829, 1, 1, 1, 1, 1,
1.866506, -1.571874, 2.102918, 1, 1, 1, 1, 1,
1.893927, 0.7646801, 0.8089317, 1, 1, 1, 1, 1,
1.923201, 0.4667212, 1.370446, 1, 1, 1, 1, 1,
1.930924, 1.167727, 0.497429, 1, 1, 1, 1, 1,
1.95878, -0.2153701, 2.234556, 1, 1, 1, 1, 1,
1.962144, -0.8096285, 1.718907, 1, 1, 1, 1, 1,
1.982938, 0.3949256, 1.62589, 1, 1, 1, 1, 1,
1.994783, -0.1724056, 2.563468, 0, 0, 1, 1, 1,
2.016678, -0.7453994, 1.040961, 1, 0, 0, 1, 1,
2.037252, -1.329041, 2.730119, 1, 0, 0, 1, 1,
2.037866, 0.6718614, 0.9875366, 1, 0, 0, 1, 1,
2.129003, 0.5122074, 1.835389, 1, 0, 0, 1, 1,
2.136583, 0.8863247, 0.1853727, 1, 0, 0, 1, 1,
2.13763, 0.7130375, 1.876073, 0, 0, 0, 1, 1,
2.179849, 1.484528, -1.162372, 0, 0, 0, 1, 1,
2.237165, 0.2426108, 2.542855, 0, 0, 0, 1, 1,
2.249979, -0.07486317, 1.600648, 0, 0, 0, 1, 1,
2.251706, -1.636133, 3.049458, 0, 0, 0, 1, 1,
2.260664, 0.2866663, 1.682646, 0, 0, 0, 1, 1,
2.268153, -0.6759409, 2.470456, 0, 0, 0, 1, 1,
2.286361, -0.9806281, 2.867839, 1, 1, 1, 1, 1,
2.31571, 0.9793691, 1.910215, 1, 1, 1, 1, 1,
2.367652, 0.3302981, 0.3336713, 1, 1, 1, 1, 1,
2.370042, 0.5002782, -0.6897126, 1, 1, 1, 1, 1,
2.429625, 1.480235, 2.839042, 1, 1, 1, 1, 1,
2.463698, 0.7431753, 1.307037, 1, 1, 1, 1, 1,
2.652053, 0.09581319, 2.732784, 1, 1, 1, 1, 1
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
var radius = 9.102526;
var distance = 31.97223;
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
mvMatrix.translate( 0.3083761, 0.2630935, 0.03984046 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -31.97223);
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
