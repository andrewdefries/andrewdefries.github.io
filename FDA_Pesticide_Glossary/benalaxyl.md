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
-3.031442, -0.1406341, 0.1289641, 1, 0, 0, 1,
-3.002133, -1.115415, -1.784035, 1, 0.007843138, 0, 1,
-2.454688, -0.7007524, -2.532465, 1, 0.01176471, 0, 1,
-2.448578, -0.6239079, -1.571484, 1, 0.01960784, 0, 1,
-2.427866, -0.2248891, -0.9191191, 1, 0.02352941, 0, 1,
-2.424366, -1.494388, -2.487064, 1, 0.03137255, 0, 1,
-2.324462, -1.183767, -1.297191, 1, 0.03529412, 0, 1,
-2.246461, 0.447592, -1.925086, 1, 0.04313726, 0, 1,
-2.162778, -0.05926983, -2.568368, 1, 0.04705882, 0, 1,
-2.145454, 0.3792243, -0.756719, 1, 0.05490196, 0, 1,
-2.135208, -0.007303264, -2.547856, 1, 0.05882353, 0, 1,
-2.130678, 0.3385356, -1.541219, 1, 0.06666667, 0, 1,
-2.094934, -0.286788, -2.632042, 1, 0.07058824, 0, 1,
-2.015599, -1.559779, -1.978675, 1, 0.07843138, 0, 1,
-1.926563, 1.779398, -0.8946607, 1, 0.08235294, 0, 1,
-1.918586, -0.7511528, -4.128062, 1, 0.09019608, 0, 1,
-1.905524, -2.133382, -1.484781, 1, 0.09411765, 0, 1,
-1.87508, -1.327183, -1.305973, 1, 0.1019608, 0, 1,
-1.860559, 0.7899919, -0.8406255, 1, 0.1098039, 0, 1,
-1.853459, -1.227394, -1.30248, 1, 0.1137255, 0, 1,
-1.831731, 0.3872463, -1.71957, 1, 0.1215686, 0, 1,
-1.818173, 0.3360054, -0.4022599, 1, 0.1254902, 0, 1,
-1.809835, -0.01681099, -1.516181, 1, 0.1333333, 0, 1,
-1.798837, 0.6776235, -0.5416111, 1, 0.1372549, 0, 1,
-1.796857, -0.2546591, -0.6632602, 1, 0.145098, 0, 1,
-1.791018, -0.7687624, -1.14174, 1, 0.1490196, 0, 1,
-1.782618, -0.4744382, -1.290968, 1, 0.1568628, 0, 1,
-1.781242, 0.3241642, -2.609963, 1, 0.1607843, 0, 1,
-1.77034, -0.3926355, -2.493336, 1, 0.1686275, 0, 1,
-1.768203, 0.6404042, -0.3035918, 1, 0.172549, 0, 1,
-1.73598, 0.9156215, -1.047568, 1, 0.1803922, 0, 1,
-1.730536, -0.3666634, -1.559875, 1, 0.1843137, 0, 1,
-1.698394, 0.3489926, -2.461329, 1, 0.1921569, 0, 1,
-1.696533, -1.42864, -2.296248, 1, 0.1960784, 0, 1,
-1.691875, 0.2818648, 0.1448786, 1, 0.2039216, 0, 1,
-1.682533, -0.564733, -1.054259, 1, 0.2117647, 0, 1,
-1.679672, 1.343022, -0.879783, 1, 0.2156863, 0, 1,
-1.637713, 0.02643555, -0.9098389, 1, 0.2235294, 0, 1,
-1.636091, 1.370776, 0.3100953, 1, 0.227451, 0, 1,
-1.633041, 1.40209, 0.3063006, 1, 0.2352941, 0, 1,
-1.625416, -0.1014091, -3.10532, 1, 0.2392157, 0, 1,
-1.622147, 0.8448645, -0.4551899, 1, 0.2470588, 0, 1,
-1.610046, -0.1401307, -1.577662, 1, 0.2509804, 0, 1,
-1.593112, -1.887174, -2.31581, 1, 0.2588235, 0, 1,
-1.58145, -0.7382697, -2.00322, 1, 0.2627451, 0, 1,
-1.579235, 0.2706414, -1.950628, 1, 0.2705882, 0, 1,
-1.576437, 0.597414, -1.893776, 1, 0.2745098, 0, 1,
-1.570705, 1.529253, -0.8714336, 1, 0.282353, 0, 1,
-1.567051, 0.1068528, -2.721741, 1, 0.2862745, 0, 1,
-1.563343, -0.987209, -1.389006, 1, 0.2941177, 0, 1,
-1.55115, 0.5595774, -1.114314, 1, 0.3019608, 0, 1,
-1.545205, -2.623597, -1.753683, 1, 0.3058824, 0, 1,
-1.544844, 0.1339392, -0.5885894, 1, 0.3137255, 0, 1,
-1.542534, -0.7596824, -1.898361, 1, 0.3176471, 0, 1,
-1.542522, -0.3238253, -1.73064, 1, 0.3254902, 0, 1,
-1.536756, 0.06827967, -0.5547362, 1, 0.3294118, 0, 1,
-1.533141, 0.4180335, 0.7552782, 1, 0.3372549, 0, 1,
-1.506146, -0.3830962, -2.890697, 1, 0.3411765, 0, 1,
-1.501115, -1.827284, -4.043087, 1, 0.3490196, 0, 1,
-1.466144, 0.6532773, -1.289906, 1, 0.3529412, 0, 1,
-1.452667, -1.100268, -1.210868, 1, 0.3607843, 0, 1,
-1.445015, -0.7244729, -2.696733, 1, 0.3647059, 0, 1,
-1.444557, -1.844445, -3.607904, 1, 0.372549, 0, 1,
-1.436223, 0.9953948, 0.5732701, 1, 0.3764706, 0, 1,
-1.432821, 1.389318, -1.565678, 1, 0.3843137, 0, 1,
-1.430434, 0.4213345, -0.7985601, 1, 0.3882353, 0, 1,
-1.421895, -1.214926, 0.7208472, 1, 0.3960784, 0, 1,
-1.41495, 1.192466, -1.234351, 1, 0.4039216, 0, 1,
-1.408937, -0.2827712, -1.445588, 1, 0.4078431, 0, 1,
-1.403143, -1.436996, -0.8815656, 1, 0.4156863, 0, 1,
-1.400502, 0.7080736, -0.4229059, 1, 0.4196078, 0, 1,
-1.38208, 0.9681551, -0.3322642, 1, 0.427451, 0, 1,
-1.361696, 0.4137955, -0.713218, 1, 0.4313726, 0, 1,
-1.346172, -0.9552116, -2.614451, 1, 0.4392157, 0, 1,
-1.342525, 1.384292, -2.61849, 1, 0.4431373, 0, 1,
-1.333336, -0.5705557, -0.5882134, 1, 0.4509804, 0, 1,
-1.329817, -0.8517148, -2.112195, 1, 0.454902, 0, 1,
-1.324314, 0.6958142, -2.718346, 1, 0.4627451, 0, 1,
-1.321091, 0.9282609, -0.5930405, 1, 0.4666667, 0, 1,
-1.314352, -0.3967078, -4.814953, 1, 0.4745098, 0, 1,
-1.314004, 1.501338, 0.4185864, 1, 0.4784314, 0, 1,
-1.304886, 0.1390569, -1.489913, 1, 0.4862745, 0, 1,
-1.301796, -1.640199, -1.077607, 1, 0.4901961, 0, 1,
-1.29603, 0.8183892, -1.678082, 1, 0.4980392, 0, 1,
-1.292978, 0.1575467, -2.687504, 1, 0.5058824, 0, 1,
-1.288879, -0.2981765, -2.069779, 1, 0.509804, 0, 1,
-1.288759, 1.414862, -0.9153774, 1, 0.5176471, 0, 1,
-1.281303, 2.491061, 0.4926305, 1, 0.5215687, 0, 1,
-1.279493, 0.6404035, 0.8417051, 1, 0.5294118, 0, 1,
-1.254523, -0.6086798, -2.083822, 1, 0.5333334, 0, 1,
-1.246775, -0.5861319, -3.477471, 1, 0.5411765, 0, 1,
-1.243432, 0.9734735, -1.031021, 1, 0.5450981, 0, 1,
-1.223931, 0.08923214, -2.484361, 1, 0.5529412, 0, 1,
-1.217328, 1.167273, 0.2682434, 1, 0.5568628, 0, 1,
-1.214854, -0.7866928, -4.860561, 1, 0.5647059, 0, 1,
-1.209488, 1.219857, 0.8379292, 1, 0.5686275, 0, 1,
-1.207077, -0.2953171, -3.090219, 1, 0.5764706, 0, 1,
-1.206677, 0.2110172, -0.7919332, 1, 0.5803922, 0, 1,
-1.202584, 0.6548316, -1.36075, 1, 0.5882353, 0, 1,
-1.19759, 0.003701953, -1.377399, 1, 0.5921569, 0, 1,
-1.197051, 1.771766, 0.177175, 1, 0.6, 0, 1,
-1.187147, 1.30208, -2.253582, 1, 0.6078432, 0, 1,
-1.170076, 0.4511186, -1.483023, 1, 0.6117647, 0, 1,
-1.169562, 0.02672031, -2.156682, 1, 0.6196079, 0, 1,
-1.163516, -0.1860467, -2.31935, 1, 0.6235294, 0, 1,
-1.152336, -0.7160072, -1.110677, 1, 0.6313726, 0, 1,
-1.150936, -0.5092643, -4.413438, 1, 0.6352941, 0, 1,
-1.149847, -0.09339386, -1.392189, 1, 0.6431373, 0, 1,
-1.149008, 0.8406871, -2.176073, 1, 0.6470588, 0, 1,
-1.144761, -0.1755934, -1.850097, 1, 0.654902, 0, 1,
-1.144677, 1.151094, 0.01750466, 1, 0.6588235, 0, 1,
-1.143863, 0.2150671, -3.839772, 1, 0.6666667, 0, 1,
-1.141369, -1.698442, -2.754409, 1, 0.6705883, 0, 1,
-1.139022, 2.065696, -0.7018647, 1, 0.6784314, 0, 1,
-1.138879, 0.09268593, -2.593408, 1, 0.682353, 0, 1,
-1.137571, 0.8560129, -2.617484, 1, 0.6901961, 0, 1,
-1.137056, 1.428269, -1.145381, 1, 0.6941177, 0, 1,
-1.134446, -1.823285, -2.615789, 1, 0.7019608, 0, 1,
-1.131488, 0.8871729, 0.8479185, 1, 0.7098039, 0, 1,
-1.131458, -0.2235641, -2.247135, 1, 0.7137255, 0, 1,
-1.117462, -0.357757, -2.62952, 1, 0.7215686, 0, 1,
-1.116728, -0.2316089, -1.89962, 1, 0.7254902, 0, 1,
-1.114316, 0.6183187, -1.699066, 1, 0.7333333, 0, 1,
-1.102186, -0.4628919, -1.581005, 1, 0.7372549, 0, 1,
-1.100133, 0.1234588, -1.717037, 1, 0.7450981, 0, 1,
-1.09933, -1.019094, -1.560288, 1, 0.7490196, 0, 1,
-1.092089, -0.4666044, -0.4107589, 1, 0.7568628, 0, 1,
-1.090619, 0.4599061, 1.373937, 1, 0.7607843, 0, 1,
-1.085671, 1.366222, 1.320353, 1, 0.7686275, 0, 1,
-1.082905, 0.0833699, -2.12067, 1, 0.772549, 0, 1,
-1.076279, 0.4579444, 0.1882633, 1, 0.7803922, 0, 1,
-1.054294, -0.5393349, -3.499625, 1, 0.7843137, 0, 1,
-1.05183, 1.621658, -0.5638894, 1, 0.7921569, 0, 1,
-1.049873, 1.133228, -0.1851991, 1, 0.7960784, 0, 1,
-1.043768, -1.521344, -3.991968, 1, 0.8039216, 0, 1,
-1.040255, -0.04259175, 0.3078301, 1, 0.8117647, 0, 1,
-1.038038, -0.1581698, 0.1561239, 1, 0.8156863, 0, 1,
-1.036828, -1.57091, -1.734444, 1, 0.8235294, 0, 1,
-1.029793, -0.950712, -2.199353, 1, 0.827451, 0, 1,
-1.017931, 1.585329, -0.309415, 1, 0.8352941, 0, 1,
-1.013418, -1.643969, -3.682691, 1, 0.8392157, 0, 1,
-1.010968, 0.2964561, -2.360027, 1, 0.8470588, 0, 1,
-1.004216, 0.1027908, -1.037425, 1, 0.8509804, 0, 1,
-1.004066, 1.31456, -0.9723174, 1, 0.8588235, 0, 1,
-0.9954485, 1.028212, -1.118939, 1, 0.8627451, 0, 1,
-0.9922933, -0.3875431, -2.584759, 1, 0.8705882, 0, 1,
-0.9866063, -1.42189, 0.710332, 1, 0.8745098, 0, 1,
-0.980964, -0.3228144, -0.1646771, 1, 0.8823529, 0, 1,
-0.9771074, 0.6085818, -0.9145256, 1, 0.8862745, 0, 1,
-0.9703494, -0.4893368, -0.9587926, 1, 0.8941177, 0, 1,
-0.9699156, -0.6208733, -1.594063, 1, 0.8980392, 0, 1,
-0.9581288, 0.587531, -1.056947, 1, 0.9058824, 0, 1,
-0.9481234, 0.8785902, -0.07178615, 1, 0.9137255, 0, 1,
-0.9421698, -0.03605217, -3.833711, 1, 0.9176471, 0, 1,
-0.9305068, -0.1187508, -2.187974, 1, 0.9254902, 0, 1,
-0.927734, -1.301384, -1.818218, 1, 0.9294118, 0, 1,
-0.9217614, 1.03496, 0.1538104, 1, 0.9372549, 0, 1,
-0.9216005, 0.531726, -2.204078, 1, 0.9411765, 0, 1,
-0.9213308, 1.320347, -1.435558, 1, 0.9490196, 0, 1,
-0.9209151, -1.822859, -1.894922, 1, 0.9529412, 0, 1,
-0.9179328, 0.6720018, 0.06520019, 1, 0.9607843, 0, 1,
-0.9109377, -0.6256409, -1.30687, 1, 0.9647059, 0, 1,
-0.9105111, 0.4860333, -1.431567, 1, 0.972549, 0, 1,
-0.9028515, -0.844316, -1.034563, 1, 0.9764706, 0, 1,
-0.8964541, 1.500113, 0.06446441, 1, 0.9843137, 0, 1,
-0.8961039, 0.02278034, -2.793095, 1, 0.9882353, 0, 1,
-0.8939169, -0.8043871, -0.6820212, 1, 0.9960784, 0, 1,
-0.893576, 0.8068254, -3.006644, 0.9960784, 1, 0, 1,
-0.8886093, -0.2140784, -2.306589, 0.9921569, 1, 0, 1,
-0.8874492, -0.7341478, -2.234298, 0.9843137, 1, 0, 1,
-0.8871162, 1.324837, -0.01679979, 0.9803922, 1, 0, 1,
-0.8854086, -0.1114284, -2.655168, 0.972549, 1, 0, 1,
-0.882612, -0.990918, -3.151436, 0.9686275, 1, 0, 1,
-0.8754136, 0.23915, -2.017527, 0.9607843, 1, 0, 1,
-0.8752586, -0.0904417, -0.4277442, 0.9568627, 1, 0, 1,
-0.8624698, -0.2224003, -0.9961283, 0.9490196, 1, 0, 1,
-0.8611948, -0.1440543, -0.1374484, 0.945098, 1, 0, 1,
-0.8605693, -0.09086669, -1.610412, 0.9372549, 1, 0, 1,
-0.8602324, 1.347368, -0.09850223, 0.9333333, 1, 0, 1,
-0.8533642, 1.358082, -1.389445, 0.9254902, 1, 0, 1,
-0.8503699, 1.386871, -1.038829, 0.9215686, 1, 0, 1,
-0.8454038, -0.1708732, -1.789617, 0.9137255, 1, 0, 1,
-0.8453689, -0.7970409, -2.564613, 0.9098039, 1, 0, 1,
-0.8435053, -0.1002905, -0.611437, 0.9019608, 1, 0, 1,
-0.8399456, 0.1643223, -1.879131, 0.8941177, 1, 0, 1,
-0.8397982, -1.106555, -2.951018, 0.8901961, 1, 0, 1,
-0.8388428, 0.9133413, -0.1599714, 0.8823529, 1, 0, 1,
-0.8352517, -0.9514173, -2.1856, 0.8784314, 1, 0, 1,
-0.8335078, 0.4687086, -0.1850323, 0.8705882, 1, 0, 1,
-0.8330002, -1.322038, -2.849766, 0.8666667, 1, 0, 1,
-0.8287411, -0.5675746, -2.848501, 0.8588235, 1, 0, 1,
-0.8273134, -1.419327, -1.750181, 0.854902, 1, 0, 1,
-0.8267856, -1.546859, -3.419364, 0.8470588, 1, 0, 1,
-0.823401, -1.765785, -1.844932, 0.8431373, 1, 0, 1,
-0.8229392, -0.3234044, -2.546124, 0.8352941, 1, 0, 1,
-0.8210151, -0.02005232, -0.155458, 0.8313726, 1, 0, 1,
-0.8199373, 1.394081, 0.2928528, 0.8235294, 1, 0, 1,
-0.8181977, -0.1897642, -2.191124, 0.8196079, 1, 0, 1,
-0.816098, 0.622399, 0.2287699, 0.8117647, 1, 0, 1,
-0.8082615, -0.2821054, -0.7939429, 0.8078431, 1, 0, 1,
-0.8056017, -0.3011915, -3.54099, 0.8, 1, 0, 1,
-0.8003317, 1.176558, -0.2184828, 0.7921569, 1, 0, 1,
-0.7980626, -0.2466667, -0.7591795, 0.7882353, 1, 0, 1,
-0.7942116, 0.5632488, -0.8321576, 0.7803922, 1, 0, 1,
-0.7929404, 0.8319685, -0.4477391, 0.7764706, 1, 0, 1,
-0.7903928, -0.7712913, -0.9451008, 0.7686275, 1, 0, 1,
-0.789665, 0.4982059, -2.675729, 0.7647059, 1, 0, 1,
-0.7794136, -0.840915, -1.336777, 0.7568628, 1, 0, 1,
-0.7770129, 0.100905, -1.280883, 0.7529412, 1, 0, 1,
-0.7757805, -1.815646, -1.417758, 0.7450981, 1, 0, 1,
-0.7722746, -0.8238866, -2.59455, 0.7411765, 1, 0, 1,
-0.7711861, -0.3597794, -0.8591231, 0.7333333, 1, 0, 1,
-0.7658903, 1.546706, -1.119623, 0.7294118, 1, 0, 1,
-0.76415, 0.5507256, -1.413409, 0.7215686, 1, 0, 1,
-0.7493539, 0.4234334, -3.428, 0.7176471, 1, 0, 1,
-0.7467891, 0.0809387, -1.710214, 0.7098039, 1, 0, 1,
-0.7405846, 0.4717429, -0.6183919, 0.7058824, 1, 0, 1,
-0.7403061, 0.4854712, -0.8543956, 0.6980392, 1, 0, 1,
-0.7362614, 0.8190608, 0.1972881, 0.6901961, 1, 0, 1,
-0.7325967, 0.8285679, -0.9839085, 0.6862745, 1, 0, 1,
-0.7307444, -0.09408056, -1.12581, 0.6784314, 1, 0, 1,
-0.7291337, 1.161144, 0.8259027, 0.6745098, 1, 0, 1,
-0.7208796, -0.1616079, -2.771464, 0.6666667, 1, 0, 1,
-0.7190168, 0.9789149, -0.6164392, 0.6627451, 1, 0, 1,
-0.7176215, 1.20745, -0.5206872, 0.654902, 1, 0, 1,
-0.7165824, 0.6539302, -1.864204, 0.6509804, 1, 0, 1,
-0.7112107, 0.7808128, 1.448132, 0.6431373, 1, 0, 1,
-0.7097886, 0.05297684, -0.1372919, 0.6392157, 1, 0, 1,
-0.708332, -2.579571, -2.432813, 0.6313726, 1, 0, 1,
-0.7072276, -2.312775, -3.428146, 0.627451, 1, 0, 1,
-0.7042321, 0.949133, -0.8238175, 0.6196079, 1, 0, 1,
-0.6963475, 1.281706, -1.432039, 0.6156863, 1, 0, 1,
-0.6914401, -0.4272483, -0.01224323, 0.6078432, 1, 0, 1,
-0.6876283, 1.385745, 0.1300454, 0.6039216, 1, 0, 1,
-0.6822183, 2.477169, 0.5182012, 0.5960785, 1, 0, 1,
-0.6817566, -1.623497, 0.08079889, 0.5882353, 1, 0, 1,
-0.6814053, 0.2643906, -0.6727747, 0.5843138, 1, 0, 1,
-0.6791346, -0.5939618, -1.118158, 0.5764706, 1, 0, 1,
-0.6791025, -0.08287526, -0.5144928, 0.572549, 1, 0, 1,
-0.6763536, -1.602791, -3.544598, 0.5647059, 1, 0, 1,
-0.6743015, 1.041288, -1.021135, 0.5607843, 1, 0, 1,
-0.6706832, 0.2610202, -0.5732277, 0.5529412, 1, 0, 1,
-0.6700667, -0.2851291, -0.9303705, 0.5490196, 1, 0, 1,
-0.6611213, -0.1407619, -1.037021, 0.5411765, 1, 0, 1,
-0.6585947, 0.2888647, -1.356884, 0.5372549, 1, 0, 1,
-0.6548036, 0.4955278, -0.8710249, 0.5294118, 1, 0, 1,
-0.6541615, -1.046631, -2.179091, 0.5254902, 1, 0, 1,
-0.651508, 0.6088417, -0.9960656, 0.5176471, 1, 0, 1,
-0.6471511, -0.1900253, -2.677899, 0.5137255, 1, 0, 1,
-0.6469162, 1.046895, 0.5146945, 0.5058824, 1, 0, 1,
-0.6468956, 0.4765593, 0.8878418, 0.5019608, 1, 0, 1,
-0.6457727, 0.8175634, -0.04877939, 0.4941176, 1, 0, 1,
-0.6445245, 1.149263, -0.9161338, 0.4862745, 1, 0, 1,
-0.6443824, -1.074256, -2.137572, 0.4823529, 1, 0, 1,
-0.6433128, -0.1872191, -2.700703, 0.4745098, 1, 0, 1,
-0.6428463, 0.3005136, -0.9213862, 0.4705882, 1, 0, 1,
-0.6397157, -0.5264203, -2.303088, 0.4627451, 1, 0, 1,
-0.6356197, -0.364376, -1.493666, 0.4588235, 1, 0, 1,
-0.6284394, 1.383117, -1.354443, 0.4509804, 1, 0, 1,
-0.6278231, -1.304749, -3.234098, 0.4470588, 1, 0, 1,
-0.6273044, 0.8864771, 0.1179839, 0.4392157, 1, 0, 1,
-0.6261477, 0.447437, -0.7253168, 0.4352941, 1, 0, 1,
-0.6247859, 1.66152, -0.6694085, 0.427451, 1, 0, 1,
-0.6240857, 1.08154, -2.169728, 0.4235294, 1, 0, 1,
-0.6235496, 0.408764, -2.049031, 0.4156863, 1, 0, 1,
-0.6231483, 1.109797, 0.345683, 0.4117647, 1, 0, 1,
-0.6103766, 2.58863, -0.3488848, 0.4039216, 1, 0, 1,
-0.6099908, -1.02016, -3.368741, 0.3960784, 1, 0, 1,
-0.6067659, 0.5073513, -2.044945, 0.3921569, 1, 0, 1,
-0.6045501, 0.0616487, -2.54635, 0.3843137, 1, 0, 1,
-0.5875249, -0.6622056, -1.983852, 0.3803922, 1, 0, 1,
-0.5786786, 1.596568, 0.4147031, 0.372549, 1, 0, 1,
-0.5771316, -1.66983, -3.21362, 0.3686275, 1, 0, 1,
-0.5699616, 0.07208552, 0.7543983, 0.3607843, 1, 0, 1,
-0.5611832, -1.062568, -2.095722, 0.3568628, 1, 0, 1,
-0.558131, -0.7196121, -4.284192, 0.3490196, 1, 0, 1,
-0.557444, -1.204917, -3.659158, 0.345098, 1, 0, 1,
-0.5553851, 0.1932492, -0.7008993, 0.3372549, 1, 0, 1,
-0.5528145, -2.049016, -3.335154, 0.3333333, 1, 0, 1,
-0.5505385, -1.051546, -2.855063, 0.3254902, 1, 0, 1,
-0.5491323, -1.815964, -4.301075, 0.3215686, 1, 0, 1,
-0.5477899, 0.6496504, -1.457163, 0.3137255, 1, 0, 1,
-0.545477, 0.00210959, 0.4155932, 0.3098039, 1, 0, 1,
-0.5431203, -0.4886508, -2.273583, 0.3019608, 1, 0, 1,
-0.5425442, -0.6289914, -1.733826, 0.2941177, 1, 0, 1,
-0.539292, 0.5078855, 0.09833182, 0.2901961, 1, 0, 1,
-0.5339206, -0.5914568, -3.814864, 0.282353, 1, 0, 1,
-0.5308715, 1.645578, -1.333913, 0.2784314, 1, 0, 1,
-0.53006, 0.3035778, -1.045614, 0.2705882, 1, 0, 1,
-0.529959, -0.0235393, -1.260263, 0.2666667, 1, 0, 1,
-0.5234756, -0.3431985, -1.469263, 0.2588235, 1, 0, 1,
-0.5178138, 0.5286472, 0.5220696, 0.254902, 1, 0, 1,
-0.5149041, 0.5424827, 0.5259983, 0.2470588, 1, 0, 1,
-0.5143937, -0.5275881, -2.314578, 0.2431373, 1, 0, 1,
-0.5114468, 0.648491, 0.02637481, 0.2352941, 1, 0, 1,
-0.5027986, -0.3476906, -1.608809, 0.2313726, 1, 0, 1,
-0.5027432, 1.703182, -0.1393573, 0.2235294, 1, 0, 1,
-0.499452, 0.2330669, -1.63131, 0.2196078, 1, 0, 1,
-0.4968095, -0.3579767, -3.1547, 0.2117647, 1, 0, 1,
-0.4939535, 1.707851, 0.436402, 0.2078431, 1, 0, 1,
-0.4888458, -0.2843753, -2.669215, 0.2, 1, 0, 1,
-0.4888256, 1.911358, -0.9181668, 0.1921569, 1, 0, 1,
-0.488355, -0.6111001, -2.536777, 0.1882353, 1, 0, 1,
-0.4808176, 1.607941, -0.6469249, 0.1803922, 1, 0, 1,
-0.4793648, -0.8005309, -1.430785, 0.1764706, 1, 0, 1,
-0.4788782, -1.33092, -2.759314, 0.1686275, 1, 0, 1,
-0.4755004, 0.6029188, 0.7663999, 0.1647059, 1, 0, 1,
-0.473827, -0.4409604, -1.531638, 0.1568628, 1, 0, 1,
-0.4732375, 0.327917, -3.487574, 0.1529412, 1, 0, 1,
-0.4712881, 0.4086376, -1.516063, 0.145098, 1, 0, 1,
-0.4696544, -1.363541, -1.462966, 0.1411765, 1, 0, 1,
-0.4633143, -0.6487151, -1.157054, 0.1333333, 1, 0, 1,
-0.4543389, 0.3331499, -1.945903, 0.1294118, 1, 0, 1,
-0.4523338, 0.4588054, 0.4437164, 0.1215686, 1, 0, 1,
-0.4380952, 1.011038, 0.6136338, 0.1176471, 1, 0, 1,
-0.4375851, -1.070845, -3.043063, 0.1098039, 1, 0, 1,
-0.4362284, -1.690502, -2.7533, 0.1058824, 1, 0, 1,
-0.4314241, 0.775771, 1.601434, 0.09803922, 1, 0, 1,
-0.4301505, 0.6350862, -0.307954, 0.09019608, 1, 0, 1,
-0.4260011, -0.3263457, -2.040445, 0.08627451, 1, 0, 1,
-0.4242375, -0.74672, -2.019061, 0.07843138, 1, 0, 1,
-0.4224086, -1.559948, -3.633296, 0.07450981, 1, 0, 1,
-0.4143093, 0.4585408, -0.4105531, 0.06666667, 1, 0, 1,
-0.4141616, 1.286742, -1.692587, 0.0627451, 1, 0, 1,
-0.414103, 1.078933, -1.208658, 0.05490196, 1, 0, 1,
-0.4138021, 1.441182, 0.613319, 0.05098039, 1, 0, 1,
-0.4133079, -0.6862964, -2.803082, 0.04313726, 1, 0, 1,
-0.4064261, 1.724322, 0.1200584, 0.03921569, 1, 0, 1,
-0.4047098, -1.049887, -1.176306, 0.03137255, 1, 0, 1,
-0.4009155, 2.996107, -1.069174, 0.02745098, 1, 0, 1,
-0.4003095, -0.006051988, -2.189881, 0.01960784, 1, 0, 1,
-0.3981889, -0.6461499, -2.699355, 0.01568628, 1, 0, 1,
-0.3955898, -0.8551695, -3.77522, 0.007843138, 1, 0, 1,
-0.3916963, -1.457392, -4.314295, 0.003921569, 1, 0, 1,
-0.3913271, 0.7057851, -0.9308689, 0, 1, 0.003921569, 1,
-0.3798128, -1.931618, -3.481325, 0, 1, 0.01176471, 1,
-0.3661741, -0.2899569, -2.439405, 0, 1, 0.01568628, 1,
-0.3655621, -0.3533315, -2.372028, 0, 1, 0.02352941, 1,
-0.3644347, 0.9049008, -0.6613772, 0, 1, 0.02745098, 1,
-0.3572066, -0.9490325, -3.339354, 0, 1, 0.03529412, 1,
-0.3553357, 1.200521, -0.6971152, 0, 1, 0.03921569, 1,
-0.3539317, -0.7216036, -2.876421, 0, 1, 0.04705882, 1,
-0.3537157, 0.5757307, -1.304968, 0, 1, 0.05098039, 1,
-0.3516046, 1.805272, -0.5103189, 0, 1, 0.05882353, 1,
-0.3512349, 0.03472174, -1.007383, 0, 1, 0.0627451, 1,
-0.3500243, -0.9758073, -4.054073, 0, 1, 0.07058824, 1,
-0.3480743, -0.2809047, -2.119176, 0, 1, 0.07450981, 1,
-0.3479427, -0.58215, -2.777771, 0, 1, 0.08235294, 1,
-0.3467301, 0.1016594, -2.518231, 0, 1, 0.08627451, 1,
-0.334454, 0.2854902, 0.7540447, 0, 1, 0.09411765, 1,
-0.3340903, -2.270546, -2.974531, 0, 1, 0.1019608, 1,
-0.3308692, 1.231029, 0.3659912, 0, 1, 0.1058824, 1,
-0.3294103, 0.9797047, -0.7941451, 0, 1, 0.1137255, 1,
-0.3269103, 3.032038, -2.328357, 0, 1, 0.1176471, 1,
-0.3253381, -1.461185, -3.138137, 0, 1, 0.1254902, 1,
-0.3252459, 0.8070386, -0.6383399, 0, 1, 0.1294118, 1,
-0.3247328, 0.5453447, -0.5592986, 0, 1, 0.1372549, 1,
-0.3213086, 1.164842, 0.2746797, 0, 1, 0.1411765, 1,
-0.3178808, -1.226849, -0.7078971, 0, 1, 0.1490196, 1,
-0.3169066, 1.630997, -1.219421, 0, 1, 0.1529412, 1,
-0.3153644, 1.401251, 1.394939, 0, 1, 0.1607843, 1,
-0.3148109, 1.159489, -0.7233129, 0, 1, 0.1647059, 1,
-0.309434, -0.32954, -3.089705, 0, 1, 0.172549, 1,
-0.308952, -0.4313096, -1.361837, 0, 1, 0.1764706, 1,
-0.3050256, 0.1113033, 0.1016775, 0, 1, 0.1843137, 1,
-0.3041451, 1.309108, -1.493371, 0, 1, 0.1882353, 1,
-0.3038017, 2.121185, -1.85606, 0, 1, 0.1960784, 1,
-0.3036327, -0.8120595, -2.659915, 0, 1, 0.2039216, 1,
-0.3026114, 0.3966757, -0.2741363, 0, 1, 0.2078431, 1,
-0.2976272, 0.4755504, -0.1611744, 0, 1, 0.2156863, 1,
-0.2897012, -2.010566, -4.982574, 0, 1, 0.2196078, 1,
-0.2855896, 0.5072813, 0.5734537, 0, 1, 0.227451, 1,
-0.2836421, 0.1952973, -0.8191393, 0, 1, 0.2313726, 1,
-0.2815694, 1.895242, -0.752929, 0, 1, 0.2392157, 1,
-0.2746782, -0.4111162, -1.086807, 0, 1, 0.2431373, 1,
-0.2728685, -2.242948, -2.490952, 0, 1, 0.2509804, 1,
-0.2709593, 0.932698, -1.610784, 0, 1, 0.254902, 1,
-0.2688865, -1.884399, -3.774191, 0, 1, 0.2627451, 1,
-0.2662186, -0.4000352, -2.067712, 0, 1, 0.2666667, 1,
-0.2639946, 0.677588, -0.289466, 0, 1, 0.2745098, 1,
-0.2609809, 1.679985, 0.2611639, 0, 1, 0.2784314, 1,
-0.2604718, 0.7732779, -0.055411, 0, 1, 0.2862745, 1,
-0.2599735, 1.256057, 0.003391974, 0, 1, 0.2901961, 1,
-0.2593509, 1.468966, -0.4197331, 0, 1, 0.2980392, 1,
-0.2591216, -0.60812, -4.013758, 0, 1, 0.3058824, 1,
-0.2522746, -1.615506, -3.773229, 0, 1, 0.3098039, 1,
-0.246283, 1.179164, -1.011167, 0, 1, 0.3176471, 1,
-0.2455371, -1.004296, -3.42135, 0, 1, 0.3215686, 1,
-0.2400265, -2.766239, -3.689974, 0, 1, 0.3294118, 1,
-0.2388549, 0.3905088, -0.1895093, 0, 1, 0.3333333, 1,
-0.2347146, -0.05773373, -2.462891, 0, 1, 0.3411765, 1,
-0.2334158, -0.6010113, -3.229753, 0, 1, 0.345098, 1,
-0.2296385, -1.104518, -2.240684, 0, 1, 0.3529412, 1,
-0.2275111, -1.259945, -5.4894, 0, 1, 0.3568628, 1,
-0.2247606, 0.3479878, 0.1735244, 0, 1, 0.3647059, 1,
-0.2230664, -2.102124, -2.994604, 0, 1, 0.3686275, 1,
-0.2227482, 1.370768, -0.3656455, 0, 1, 0.3764706, 1,
-0.218441, 1.30845, 1.580953, 0, 1, 0.3803922, 1,
-0.2137665, -0.004631434, -1.439276, 0, 1, 0.3882353, 1,
-0.2058516, 0.2501041, -1.067387, 0, 1, 0.3921569, 1,
-0.2047803, 0.2325459, -1.302867, 0, 1, 0.4, 1,
-0.2023808, -1.174493, -4.146905, 0, 1, 0.4078431, 1,
-0.2017581, -0.9259266, -2.444518, 0, 1, 0.4117647, 1,
-0.1976984, -1.252743, -1.802117, 0, 1, 0.4196078, 1,
-0.1949972, 0.2057049, -0.4309803, 0, 1, 0.4235294, 1,
-0.1937476, 0.7639897, -0.7224641, 0, 1, 0.4313726, 1,
-0.1844177, -0.9972907, -2.04667, 0, 1, 0.4352941, 1,
-0.1825659, 0.5063874, 0.6202291, 0, 1, 0.4431373, 1,
-0.1820073, 1.453906, -0.6570076, 0, 1, 0.4470588, 1,
-0.1812274, 1.649158, 2.202315, 0, 1, 0.454902, 1,
-0.1809551, 1.595997, -1.349088, 0, 1, 0.4588235, 1,
-0.180909, -0.7654617, -4.767018, 0, 1, 0.4666667, 1,
-0.1807059, 0.5296297, -0.03752226, 0, 1, 0.4705882, 1,
-0.1784256, -0.4581775, -3.008143, 0, 1, 0.4784314, 1,
-0.1782376, -1.432971, -4.18517, 0, 1, 0.4823529, 1,
-0.1686545, -0.2413943, -1.033793, 0, 1, 0.4901961, 1,
-0.1670569, 0.4895051, 0.02174442, 0, 1, 0.4941176, 1,
-0.1642367, 1.235151, -0.001804393, 0, 1, 0.5019608, 1,
-0.1642204, 1.771372, -1.200384, 0, 1, 0.509804, 1,
-0.1640427, -0.8164409, -2.676908, 0, 1, 0.5137255, 1,
-0.1597368, 1.060826, -0.413951, 0, 1, 0.5215687, 1,
-0.1585512, -0.1671561, -3.909277, 0, 1, 0.5254902, 1,
-0.1572131, 1.859337, 0.03978623, 0, 1, 0.5333334, 1,
-0.1558247, 0.3898992, -2.104867, 0, 1, 0.5372549, 1,
-0.1541612, -0.4524308, -3.186733, 0, 1, 0.5450981, 1,
-0.1524132, 0.7267252, -0.871612, 0, 1, 0.5490196, 1,
-0.15071, 0.01240496, -2.189471, 0, 1, 0.5568628, 1,
-0.1500329, -0.3723058, -1.616112, 0, 1, 0.5607843, 1,
-0.1495718, -0.1518678, -1.38019, 0, 1, 0.5686275, 1,
-0.1441955, -1.020242, -2.355651, 0, 1, 0.572549, 1,
-0.1439921, -0.2564698, -3.462297, 0, 1, 0.5803922, 1,
-0.1396427, -0.001089942, -1.528215, 0, 1, 0.5843138, 1,
-0.1372258, -0.9767666, -5.040713, 0, 1, 0.5921569, 1,
-0.1329119, -0.9121404, -2.968029, 0, 1, 0.5960785, 1,
-0.1283792, -2.072664, -3.707179, 0, 1, 0.6039216, 1,
-0.1282851, 1.181085, 1.022903, 0, 1, 0.6117647, 1,
-0.1245138, 0.2558956, -0.8282512, 0, 1, 0.6156863, 1,
-0.1229441, 0.6402749, -1.208552, 0, 1, 0.6235294, 1,
-0.1203325, 0.7176508, 0.04567341, 0, 1, 0.627451, 1,
-0.1198554, -0.6744236, -3.299428, 0, 1, 0.6352941, 1,
-0.1171633, 0.8837114, -1.796923, 0, 1, 0.6392157, 1,
-0.1146858, -0.2251376, -1.225268, 0, 1, 0.6470588, 1,
-0.1073815, -0.8433515, -1.824928, 0, 1, 0.6509804, 1,
-0.1072501, 0.5361336, -0.3361769, 0, 1, 0.6588235, 1,
-0.09950533, 1.346207, -0.5910791, 0, 1, 0.6627451, 1,
-0.09790672, -0.3811005, -2.789359, 0, 1, 0.6705883, 1,
-0.09631997, 1.066142, 0.7412991, 0, 1, 0.6745098, 1,
-0.0962829, -0.7280226, -1.834269, 0, 1, 0.682353, 1,
-0.094436, 0.345442, -1.178573, 0, 1, 0.6862745, 1,
-0.09316217, 0.3413987, 0.1893806, 0, 1, 0.6941177, 1,
-0.09243908, 2.566116, -0.2729446, 0, 1, 0.7019608, 1,
-0.09158451, -1.123218, -1.829104, 0, 1, 0.7058824, 1,
-0.09063754, -0.2677806, -3.264262, 0, 1, 0.7137255, 1,
-0.08970714, 1.056015, 0.4015861, 0, 1, 0.7176471, 1,
-0.08863403, 1.731424, 0.9235377, 0, 1, 0.7254902, 1,
-0.08857515, 0.3436724, -0.3025395, 0, 1, 0.7294118, 1,
-0.08842079, 0.9801964, -0.09374914, 0, 1, 0.7372549, 1,
-0.08712837, -1.05454, -3.441382, 0, 1, 0.7411765, 1,
-0.08603495, -0.01393586, -3.471448, 0, 1, 0.7490196, 1,
-0.08408494, 0.5775805, 0.4520131, 0, 1, 0.7529412, 1,
-0.08399601, -0.4468904, -4.30227, 0, 1, 0.7607843, 1,
-0.08142456, 0.4797039, 0.8021814, 0, 1, 0.7647059, 1,
-0.0779696, -0.2919855, -3.066792, 0, 1, 0.772549, 1,
-0.07655651, -1.266505, -3.795486, 0, 1, 0.7764706, 1,
-0.07560706, 0.5656613, -2.632579, 0, 1, 0.7843137, 1,
-0.07051819, -0.5653998, -2.439516, 0, 1, 0.7882353, 1,
-0.06646055, 0.4155344, 1.677533, 0, 1, 0.7960784, 1,
-0.06353308, -0.373616, -3.560131, 0, 1, 0.8039216, 1,
-0.05742473, -0.2604516, -3.694327, 0, 1, 0.8078431, 1,
-0.05121886, 0.05535983, -0.987711, 0, 1, 0.8156863, 1,
-0.05101233, -1.090846, -3.267198, 0, 1, 0.8196079, 1,
-0.05047496, 0.6463275, 1.324717, 0, 1, 0.827451, 1,
-0.04767892, -0.3738147, -1.316315, 0, 1, 0.8313726, 1,
-0.04723314, 0.2095654, 0.1567231, 0, 1, 0.8392157, 1,
-0.04715013, -0.323291, -2.341314, 0, 1, 0.8431373, 1,
-0.04573485, -0.3967805, -3.212999, 0, 1, 0.8509804, 1,
-0.03802449, 0.444726, 1.268808, 0, 1, 0.854902, 1,
-0.03323701, 0.7766336, 0.4434834, 0, 1, 0.8627451, 1,
-0.02753096, -1.335659, -4.068724, 0, 1, 0.8666667, 1,
-0.02703281, -1.68989, -4.188642, 0, 1, 0.8745098, 1,
-0.0197638, 0.6157989, 0.2333023, 0, 1, 0.8784314, 1,
-0.01507447, -0.6566501, -3.302855, 0, 1, 0.8862745, 1,
-0.01460276, 0.6327739, 0.2025675, 0, 1, 0.8901961, 1,
-0.01321269, 0.08974816, 0.3692786, 0, 1, 0.8980392, 1,
-0.01061987, 0.1953743, -0.2013829, 0, 1, 0.9058824, 1,
-0.01034991, -0.52952, -1.724174, 0, 1, 0.9098039, 1,
-0.006136163, -0.09347408, -2.101771, 0, 1, 0.9176471, 1,
-0.004656028, 0.02600636, -1.38949, 0, 1, 0.9215686, 1,
0.0003608799, 0.1586775, 0.6714742, 0, 1, 0.9294118, 1,
0.001461569, -0.7024941, 2.269249, 0, 1, 0.9333333, 1,
0.00457006, -2.110599, 3.990087, 0, 1, 0.9411765, 1,
0.004727971, -0.5687026, 5.064091, 0, 1, 0.945098, 1,
0.007798209, -0.7020203, 2.024388, 0, 1, 0.9529412, 1,
0.008733396, 0.4514748, -1.442752, 0, 1, 0.9568627, 1,
0.01048613, -0.615461, 2.918382, 0, 1, 0.9647059, 1,
0.01149375, 0.5003948, -2.104598, 0, 1, 0.9686275, 1,
0.01657123, 0.05715027, -0.3165649, 0, 1, 0.9764706, 1,
0.01787383, 0.7057778, 2.074445, 0, 1, 0.9803922, 1,
0.01834083, 0.05254185, -0.03915989, 0, 1, 0.9882353, 1,
0.01908194, 0.8939717, 0.7147418, 0, 1, 0.9921569, 1,
0.01940397, 1.526509, -1.187935, 0, 1, 1, 1,
0.02104013, -0.4227467, 2.979264, 0, 0.9921569, 1, 1,
0.02113536, 0.4876961, 0.8787313, 0, 0.9882353, 1, 1,
0.02404624, 0.1800212, -1.47448, 0, 0.9803922, 1, 1,
0.02471536, -0.1095673, 3.742436, 0, 0.9764706, 1, 1,
0.02653049, 2.208275, -0.1124925, 0, 0.9686275, 1, 1,
0.03080658, -0.2931272, 2.906113, 0, 0.9647059, 1, 1,
0.0318898, 0.001358684, 1.624185, 0, 0.9568627, 1, 1,
0.03291382, -0.942248, 2.769214, 0, 0.9529412, 1, 1,
0.03628178, 1.159356, -1.217505, 0, 0.945098, 1, 1,
0.04321747, 0.2046446, 0.4714513, 0, 0.9411765, 1, 1,
0.0433794, 0.5566127, -0.5419572, 0, 0.9333333, 1, 1,
0.05566403, 0.2589146, -0.2814947, 0, 0.9294118, 1, 1,
0.05859342, 0.04959172, 1.725192, 0, 0.9215686, 1, 1,
0.06075043, -0.2257203, 3.487134, 0, 0.9176471, 1, 1,
0.06343099, -0.0470392, 0.8201688, 0, 0.9098039, 1, 1,
0.06872254, -1.699771, 3.783948, 0, 0.9058824, 1, 1,
0.07292935, 0.7122117, -1.050812, 0, 0.8980392, 1, 1,
0.08654761, -0.2431285, 2.35221, 0, 0.8901961, 1, 1,
0.09018365, -0.2454332, 3.059712, 0, 0.8862745, 1, 1,
0.09382793, -1.122815, 2.684564, 0, 0.8784314, 1, 1,
0.09613071, -0.9540803, 2.53372, 0, 0.8745098, 1, 1,
0.09680479, 0.5244364, 0.5977862, 0, 0.8666667, 1, 1,
0.09957583, 1.372809, 0.4626679, 0, 0.8627451, 1, 1,
0.1014401, -2.15697, 3.585261, 0, 0.854902, 1, 1,
0.1029686, -2.234431, 2.821384, 0, 0.8509804, 1, 1,
0.1056903, -1.054901, 2.140331, 0, 0.8431373, 1, 1,
0.1075049, -0.1276204, 2.032494, 0, 0.8392157, 1, 1,
0.1098446, -1.163823, 2.736325, 0, 0.8313726, 1, 1,
0.115397, 0.2614591, 0.3375759, 0, 0.827451, 1, 1,
0.1238273, -0.737009, 1.309639, 0, 0.8196079, 1, 1,
0.1295856, -1.333503, 3.067386, 0, 0.8156863, 1, 1,
0.1304793, 0.5633026, -1.465698, 0, 0.8078431, 1, 1,
0.1322781, 0.69763, 0.3082125, 0, 0.8039216, 1, 1,
0.1411202, 1.10412, 0.151115, 0, 0.7960784, 1, 1,
0.1482535, 0.2665134, 0.760506, 0, 0.7882353, 1, 1,
0.1486426, 0.02006446, 1.427839, 0, 0.7843137, 1, 1,
0.1493421, -1.11093, 3.736932, 0, 0.7764706, 1, 1,
0.1521669, -0.4269932, 2.677613, 0, 0.772549, 1, 1,
0.1521966, -0.9101455, 1.924259, 0, 0.7647059, 1, 1,
0.1634357, -2.220966, 5.323336, 0, 0.7607843, 1, 1,
0.16728, 0.5841282, -1.652697, 0, 0.7529412, 1, 1,
0.1689722, 0.06596293, 0.7740595, 0, 0.7490196, 1, 1,
0.1699125, -0.271167, 2.759862, 0, 0.7411765, 1, 1,
0.1704285, 0.7141255, 1.978118, 0, 0.7372549, 1, 1,
0.1814844, -1.698607, 2.312976, 0, 0.7294118, 1, 1,
0.1852975, -0.7737824, 4.426711, 0, 0.7254902, 1, 1,
0.1855191, 1.187824, -0.08017395, 0, 0.7176471, 1, 1,
0.1895937, 0.7690744, 0.2960107, 0, 0.7137255, 1, 1,
0.190206, 0.3699763, 0.1967882, 0, 0.7058824, 1, 1,
0.191287, -0.3676094, 3.461968, 0, 0.6980392, 1, 1,
0.1928148, 0.775387, -0.7840924, 0, 0.6941177, 1, 1,
0.193597, 0.08328298, -0.09693007, 0, 0.6862745, 1, 1,
0.1969502, 0.9067521, -1.973599, 0, 0.682353, 1, 1,
0.1977213, 0.8277623, 1.908033, 0, 0.6745098, 1, 1,
0.1987541, -0.8991673, 3.225782, 0, 0.6705883, 1, 1,
0.2025105, -0.09607957, 3.344942, 0, 0.6627451, 1, 1,
0.203268, -1.314353, 1.557471, 0, 0.6588235, 1, 1,
0.2041119, 1.325068, 0.8720713, 0, 0.6509804, 1, 1,
0.2061618, 0.5099677, 0.4082775, 0, 0.6470588, 1, 1,
0.2071964, 0.1675765, -2.507118, 0, 0.6392157, 1, 1,
0.2084008, -0.8059434, 3.996478, 0, 0.6352941, 1, 1,
0.2114897, -0.1078139, 1.13879, 0, 0.627451, 1, 1,
0.212132, -1.103716, 2.425489, 0, 0.6235294, 1, 1,
0.2133179, -0.2089163, 2.304078, 0, 0.6156863, 1, 1,
0.216911, 0.4655466, 0.134424, 0, 0.6117647, 1, 1,
0.2170306, 1.314915, 1.5722, 0, 0.6039216, 1, 1,
0.2191436, 0.002348297, 2.69328, 0, 0.5960785, 1, 1,
0.2195406, 0.3858159, 0.3167676, 0, 0.5921569, 1, 1,
0.2202639, 1.549073, 1.127514, 0, 0.5843138, 1, 1,
0.2217039, 0.1322533, 0.5702953, 0, 0.5803922, 1, 1,
0.2257589, -0.7114892, 1.196942, 0, 0.572549, 1, 1,
0.2281088, 0.3935071, 1.039912, 0, 0.5686275, 1, 1,
0.2308625, -1.350793, 2.521292, 0, 0.5607843, 1, 1,
0.2310429, 0.7880644, -0.8006387, 0, 0.5568628, 1, 1,
0.2335463, 0.8275132, 1.61855, 0, 0.5490196, 1, 1,
0.2337817, -0.1583246, 1.335232, 0, 0.5450981, 1, 1,
0.2388885, -0.1471951, 2.4459, 0, 0.5372549, 1, 1,
0.2398601, 1.095994, 0.1809674, 0, 0.5333334, 1, 1,
0.2399823, 0.3819284, 0.5435685, 0, 0.5254902, 1, 1,
0.2467704, -0.1618664, 1.250364, 0, 0.5215687, 1, 1,
0.248214, -0.05527361, 1.481318, 0, 0.5137255, 1, 1,
0.2501526, 0.4147472, -1.641897, 0, 0.509804, 1, 1,
0.2507765, -0.728016, 0.3680193, 0, 0.5019608, 1, 1,
0.2515369, -0.464145, 1.645459, 0, 0.4941176, 1, 1,
0.252614, -1.120224, 2.463493, 0, 0.4901961, 1, 1,
0.2531383, 1.154847, 0.2064745, 0, 0.4823529, 1, 1,
0.25342, 0.2623895, 2.009412, 0, 0.4784314, 1, 1,
0.2542016, 0.361969, 0.9110273, 0, 0.4705882, 1, 1,
0.2579908, -0.3119652, 1.279032, 0, 0.4666667, 1, 1,
0.2653084, 1.057293, 1.642985, 0, 0.4588235, 1, 1,
0.2710883, -0.05053509, 2.908273, 0, 0.454902, 1, 1,
0.2725995, 1.821499, 0.833232, 0, 0.4470588, 1, 1,
0.2729267, 0.6105059, -2.603141, 0, 0.4431373, 1, 1,
0.2741053, 0.509658, 1.64903, 0, 0.4352941, 1, 1,
0.2778786, -0.8144408, 1.250039, 0, 0.4313726, 1, 1,
0.282928, -1.012061, 3.793995, 0, 0.4235294, 1, 1,
0.2885903, -0.8363669, 2.208726, 0, 0.4196078, 1, 1,
0.290727, 0.376635, 0.1366808, 0, 0.4117647, 1, 1,
0.2926968, 0.419295, 0.6043772, 0, 0.4078431, 1, 1,
0.2929552, -0.9350129, 3.900821, 0, 0.4, 1, 1,
0.2944204, -0.03266083, 1.295797, 0, 0.3921569, 1, 1,
0.2945335, 0.6844277, 2.186884, 0, 0.3882353, 1, 1,
0.2958924, 0.2190143, 3.254714, 0, 0.3803922, 1, 1,
0.3017846, 0.8220434, -1.305558, 0, 0.3764706, 1, 1,
0.3048182, 2.455684, 0.4281139, 0, 0.3686275, 1, 1,
0.3061045, 0.4324588, -0.7711625, 0, 0.3647059, 1, 1,
0.3081856, -0.481188, 0.824627, 0, 0.3568628, 1, 1,
0.3090251, 0.006997822, 0.6105713, 0, 0.3529412, 1, 1,
0.310958, -1.501975, 2.510313, 0, 0.345098, 1, 1,
0.3114581, -0.8346777, 3.07786, 0, 0.3411765, 1, 1,
0.3125306, 0.3496987, 1.114384, 0, 0.3333333, 1, 1,
0.3128773, -0.2868851, 2.25002, 0, 0.3294118, 1, 1,
0.3137477, 0.02296293, 1.284608, 0, 0.3215686, 1, 1,
0.3201197, 0.2512559, 0.5652408, 0, 0.3176471, 1, 1,
0.3257649, -0.1257994, 1.290783, 0, 0.3098039, 1, 1,
0.3267971, 0.006235296, 2.257174, 0, 0.3058824, 1, 1,
0.3298742, 1.192546, 1.404181, 0, 0.2980392, 1, 1,
0.3308484, -0.3381148, 2.024314, 0, 0.2901961, 1, 1,
0.3361835, -0.9036353, 2.285321, 0, 0.2862745, 1, 1,
0.3369573, 0.7532042, 2.050861, 0, 0.2784314, 1, 1,
0.3378414, -1.798406, 1.217215, 0, 0.2745098, 1, 1,
0.3389218, -0.6746262, 2.337071, 0, 0.2666667, 1, 1,
0.3427199, 1.12661, 0.3631064, 0, 0.2627451, 1, 1,
0.3450888, -1.950588, 5.129755, 0, 0.254902, 1, 1,
0.3453352, -0.1459731, 2.474263, 0, 0.2509804, 1, 1,
0.346008, -0.5670704, 2.917767, 0, 0.2431373, 1, 1,
0.3560788, 0.4630236, -0.1211528, 0, 0.2392157, 1, 1,
0.3576861, -0.05284373, 1.247454, 0, 0.2313726, 1, 1,
0.3578046, 0.7205138, 3.285019, 0, 0.227451, 1, 1,
0.3658803, -0.138447, 0.2699087, 0, 0.2196078, 1, 1,
0.3689254, 0.2544773, 0.3086585, 0, 0.2156863, 1, 1,
0.3699981, -0.4479255, 3.71128, 0, 0.2078431, 1, 1,
0.3701019, 0.8778931, 0.2505193, 0, 0.2039216, 1, 1,
0.3715163, -0.2188849, 2.312338, 0, 0.1960784, 1, 1,
0.3723348, -1.41922, 3.204606, 0, 0.1882353, 1, 1,
0.3737353, -1.063118, 2.250023, 0, 0.1843137, 1, 1,
0.3737393, -2.150876, 1.699861, 0, 0.1764706, 1, 1,
0.376186, -1.795597, 2.839966, 0, 0.172549, 1, 1,
0.3785631, 1.417173, 0.1982001, 0, 0.1647059, 1, 1,
0.3834315, 0.7556102, 1.751839, 0, 0.1607843, 1, 1,
0.3851283, 0.04592045, 4.159215, 0, 0.1529412, 1, 1,
0.387121, 1.084534, 0.1328542, 0, 0.1490196, 1, 1,
0.3871377, 0.1038642, 0.9986151, 0, 0.1411765, 1, 1,
0.387932, -0.9313377, 0.6498848, 0, 0.1372549, 1, 1,
0.3895812, -0.1125549, 0.8197616, 0, 0.1294118, 1, 1,
0.3906042, -0.9573581, 1.609479, 0, 0.1254902, 1, 1,
0.3940012, -0.2236539, 4.36643, 0, 0.1176471, 1, 1,
0.3958211, -0.1924268, 0.9158813, 0, 0.1137255, 1, 1,
0.3988537, 0.1916805, 0.4228513, 0, 0.1058824, 1, 1,
0.4010039, 0.8081697, 0.2858962, 0, 0.09803922, 1, 1,
0.4015075, 1.316936, -0.4826531, 0, 0.09411765, 1, 1,
0.4055521, -1.685082, 4.788028, 0, 0.08627451, 1, 1,
0.409273, 0.3266961, -0.3114862, 0, 0.08235294, 1, 1,
0.4098483, -2.618673, 4.592203, 0, 0.07450981, 1, 1,
0.4183455, -1.069656, 2.271335, 0, 0.07058824, 1, 1,
0.4197548, -0.3232524, 2.383391, 0, 0.0627451, 1, 1,
0.4213138, 0.6000947, 1.179878, 0, 0.05882353, 1, 1,
0.4318575, -0.6911062, 1.172255, 0, 0.05098039, 1, 1,
0.431953, -2.24236, 0.7883386, 0, 0.04705882, 1, 1,
0.4416966, 0.142465, 2.163111, 0, 0.03921569, 1, 1,
0.4419848, 1.290921, -0.08611849, 0, 0.03529412, 1, 1,
0.4439005, 0.8780147, -2.029985, 0, 0.02745098, 1, 1,
0.4443748, 0.7451122, -1.416024, 0, 0.02352941, 1, 1,
0.4477167, -2.324999, 3.896402, 0, 0.01568628, 1, 1,
0.449222, -0.1787629, 1.647552, 0, 0.01176471, 1, 1,
0.4540478, 0.8076798, -2.387645, 0, 0.003921569, 1, 1,
0.4577637, -1.441063, 3.687551, 0.003921569, 0, 1, 1,
0.4581094, 0.1862372, -0.3769566, 0.007843138, 0, 1, 1,
0.4626014, 1.426294, -1.457051, 0.01568628, 0, 1, 1,
0.4648595, 0.5507336, 0.2458749, 0.01960784, 0, 1, 1,
0.468022, -0.3726714, 2.103901, 0.02745098, 0, 1, 1,
0.4698263, -0.5452251, 3.5645, 0.03137255, 0, 1, 1,
0.4746709, 0.3531409, -0.6577506, 0.03921569, 0, 1, 1,
0.4770434, 0.9117463, 0.5917332, 0.04313726, 0, 1, 1,
0.4863286, 1.455959, 0.5547519, 0.05098039, 0, 1, 1,
0.4875443, 0.5072142, 0.01146779, 0.05490196, 0, 1, 1,
0.4909513, 0.8175251, 0.08308688, 0.0627451, 0, 1, 1,
0.4910887, 0.6085766, 0.611509, 0.06666667, 0, 1, 1,
0.4912713, -0.05267574, 0.533582, 0.07450981, 0, 1, 1,
0.493868, -0.3817933, 1.612287, 0.07843138, 0, 1, 1,
0.494229, 1.089474, -0.7869102, 0.08627451, 0, 1, 1,
0.4972151, 1.428091, 0.7512119, 0.09019608, 0, 1, 1,
0.5020228, 0.7143063, 0.929861, 0.09803922, 0, 1, 1,
0.5097356, -0.1888818, 3.810474, 0.1058824, 0, 1, 1,
0.512085, 1.09715, -0.2937162, 0.1098039, 0, 1, 1,
0.518125, -0.5939708, 2.633878, 0.1176471, 0, 1, 1,
0.5186415, 0.390844, 1.789218, 0.1215686, 0, 1, 1,
0.5275469, -0.992649, 4.991885, 0.1294118, 0, 1, 1,
0.5278125, -2.171466, 2.289806, 0.1333333, 0, 1, 1,
0.5298752, 0.7197815, 2.007253, 0.1411765, 0, 1, 1,
0.5320497, -0.592119, 4.052502, 0.145098, 0, 1, 1,
0.5384219, -1.887835, 2.802853, 0.1529412, 0, 1, 1,
0.5412122, 0.8457227, 2.194942, 0.1568628, 0, 1, 1,
0.5413502, 0.7380651, 1.220394, 0.1647059, 0, 1, 1,
0.5451503, -0.2112418, 2.753241, 0.1686275, 0, 1, 1,
0.5483769, -0.9671599, 4.092582, 0.1764706, 0, 1, 1,
0.5519036, 0.3191965, 2.263906, 0.1803922, 0, 1, 1,
0.5542989, -0.4198324, 1.416453, 0.1882353, 0, 1, 1,
0.5550103, 0.7036616, 2.274691, 0.1921569, 0, 1, 1,
0.5561889, 0.8070405, 1.903132, 0.2, 0, 1, 1,
0.5567943, 0.5642454, -0.1827142, 0.2078431, 0, 1, 1,
0.5577835, -1.55792, 4.074312, 0.2117647, 0, 1, 1,
0.5591815, -0.8976099, 2.059748, 0.2196078, 0, 1, 1,
0.5600784, 0.4725677, 2.100164, 0.2235294, 0, 1, 1,
0.5617412, 0.2457307, 1.036042, 0.2313726, 0, 1, 1,
0.5645818, -0.5305476, 2.570436, 0.2352941, 0, 1, 1,
0.5654613, -2.078299, 2.903494, 0.2431373, 0, 1, 1,
0.5667583, 1.168235, 0.1029876, 0.2470588, 0, 1, 1,
0.5680368, -0.01994269, 2.068246, 0.254902, 0, 1, 1,
0.5697902, 0.7604128, 0.8838092, 0.2588235, 0, 1, 1,
0.5708243, 0.7568076, 1.329496, 0.2666667, 0, 1, 1,
0.5733325, 0.5740482, 1.249102, 0.2705882, 0, 1, 1,
0.5756072, 0.0572369, 0.3963826, 0.2784314, 0, 1, 1,
0.5811144, 0.9881763, 0.2243891, 0.282353, 0, 1, 1,
0.5885821, -1.29908, 1.379576, 0.2901961, 0, 1, 1,
0.5999668, 0.571255, 0.1916972, 0.2941177, 0, 1, 1,
0.6027701, -1.22593, 2.229099, 0.3019608, 0, 1, 1,
0.604323, -0.6781548, 3.405699, 0.3098039, 0, 1, 1,
0.6081744, -0.5649123, 1.048697, 0.3137255, 0, 1, 1,
0.6129391, -0.2310911, 1.462824, 0.3215686, 0, 1, 1,
0.6146288, -0.6068912, 4.054267, 0.3254902, 0, 1, 1,
0.6176046, 0.539092, 2.118263, 0.3333333, 0, 1, 1,
0.6176252, -0.1774181, 0.1460999, 0.3372549, 0, 1, 1,
0.6201357, -1.738663, 2.253968, 0.345098, 0, 1, 1,
0.6236166, 1.204437, 0.03219992, 0.3490196, 0, 1, 1,
0.6239418, -0.06731681, 0.3426858, 0.3568628, 0, 1, 1,
0.625078, 1.529636, 0.5551277, 0.3607843, 0, 1, 1,
0.6277323, 1.182739, 0.2482204, 0.3686275, 0, 1, 1,
0.6293748, -1.779085, 1.844214, 0.372549, 0, 1, 1,
0.6353461, -0.06943524, 1.273532, 0.3803922, 0, 1, 1,
0.6356835, -0.7254268, 1.589785, 0.3843137, 0, 1, 1,
0.6357536, -1.192276, 2.421886, 0.3921569, 0, 1, 1,
0.6365208, -0.06246721, 2.535848, 0.3960784, 0, 1, 1,
0.6526929, -0.3930294, 3.174061, 0.4039216, 0, 1, 1,
0.6533223, 0.7786373, 1.004862, 0.4117647, 0, 1, 1,
0.6551353, -0.5829508, 1.804015, 0.4156863, 0, 1, 1,
0.6576287, 0.3081635, 2.6174, 0.4235294, 0, 1, 1,
0.6591499, 0.1177594, 1.586275, 0.427451, 0, 1, 1,
0.661225, -0.6997812, 3.771974, 0.4352941, 0, 1, 1,
0.6612891, -0.2690797, 2.813078, 0.4392157, 0, 1, 1,
0.6613163, 0.5554964, 0.2419908, 0.4470588, 0, 1, 1,
0.6638631, -0.2104137, 1.474134, 0.4509804, 0, 1, 1,
0.6655262, -0.05377319, 2.767252, 0.4588235, 0, 1, 1,
0.6686655, 1.392718, 2.180358, 0.4627451, 0, 1, 1,
0.6691313, 0.2192711, 0.3708056, 0.4705882, 0, 1, 1,
0.6704924, 0.6652671, 1.457527, 0.4745098, 0, 1, 1,
0.6873816, 1.093466, 0.08332026, 0.4823529, 0, 1, 1,
0.6880449, -2.244351, 1.978953, 0.4862745, 0, 1, 1,
0.6891519, 0.0732675, 1.875615, 0.4941176, 0, 1, 1,
0.6928352, 0.5170215, 1.226109, 0.5019608, 0, 1, 1,
0.6936315, -0.6739726, 3.190094, 0.5058824, 0, 1, 1,
0.6938601, -1.986866, 2.365474, 0.5137255, 0, 1, 1,
0.6955255, -1.069504, 3.238734, 0.5176471, 0, 1, 1,
0.6979063, -0.5834561, 3.387337, 0.5254902, 0, 1, 1,
0.697989, -0.5014787, 2.297375, 0.5294118, 0, 1, 1,
0.7068975, -0.8022313, 1.996009, 0.5372549, 0, 1, 1,
0.7084914, 1.52316, -0.2436008, 0.5411765, 0, 1, 1,
0.7086599, 1.040725, -0.5475049, 0.5490196, 0, 1, 1,
0.7100593, 0.104689, 2.016687, 0.5529412, 0, 1, 1,
0.7114742, -0.8172899, 2.021707, 0.5607843, 0, 1, 1,
0.7150705, -1.725553, 2.634461, 0.5647059, 0, 1, 1,
0.7171132, -0.9036677, 2.019627, 0.572549, 0, 1, 1,
0.7241725, -0.6064895, 1.440596, 0.5764706, 0, 1, 1,
0.7343587, 0.8641869, 0.4664754, 0.5843138, 0, 1, 1,
0.7353194, -0.06492171, 2.378726, 0.5882353, 0, 1, 1,
0.7354859, -0.5144446, 2.458086, 0.5960785, 0, 1, 1,
0.7365815, 1.964899, 0.9242859, 0.6039216, 0, 1, 1,
0.7373959, -0.209329, 2.623744, 0.6078432, 0, 1, 1,
0.7377306, 0.1629179, -0.2381538, 0.6156863, 0, 1, 1,
0.7399421, 0.1686645, 2.606461, 0.6196079, 0, 1, 1,
0.7407814, -0.7479413, -0.0821232, 0.627451, 0, 1, 1,
0.7453666, 1.14233, 0.6158147, 0.6313726, 0, 1, 1,
0.75438, 0.9603519, -1.293287, 0.6392157, 0, 1, 1,
0.7564931, 0.6248166, -0.605649, 0.6431373, 0, 1, 1,
0.756681, 0.1084523, 0.7847143, 0.6509804, 0, 1, 1,
0.76026, -1.844429, 3.419157, 0.654902, 0, 1, 1,
0.7645434, -1.20961, 3.013704, 0.6627451, 0, 1, 1,
0.7675299, 2.334193, 0.5735832, 0.6666667, 0, 1, 1,
0.7711956, -0.2657719, 1.725783, 0.6745098, 0, 1, 1,
0.7975437, -0.1373008, 2.710181, 0.6784314, 0, 1, 1,
0.7989534, 1.936458, -1.130221, 0.6862745, 0, 1, 1,
0.7995477, -0.4134315, 2.967071, 0.6901961, 0, 1, 1,
0.8043369, -0.974411, 3.410926, 0.6980392, 0, 1, 1,
0.8063651, 1.132735, -0.4277143, 0.7058824, 0, 1, 1,
0.8084089, 0.4000328, 2.812596, 0.7098039, 0, 1, 1,
0.8104953, -0.6204892, 1.196104, 0.7176471, 0, 1, 1,
0.8247892, 1.684141, 0.2008089, 0.7215686, 0, 1, 1,
0.829927, 0.8721527, 0.7755815, 0.7294118, 0, 1, 1,
0.836263, 0.05225519, 1.388344, 0.7333333, 0, 1, 1,
0.8410369, 0.1075466, -0.538158, 0.7411765, 0, 1, 1,
0.8488501, 0.610229, 0.8287596, 0.7450981, 0, 1, 1,
0.8513952, -0.6919971, 2.234763, 0.7529412, 0, 1, 1,
0.8527964, 0.1996278, 1.576055, 0.7568628, 0, 1, 1,
0.8562765, -0.6588392, 1.062473, 0.7647059, 0, 1, 1,
0.8573281, -1.423213, 2.339812, 0.7686275, 0, 1, 1,
0.8591949, -0.2328983, 1.716202, 0.7764706, 0, 1, 1,
0.860157, 1.380031, 2.042158, 0.7803922, 0, 1, 1,
0.8636016, 0.6637002, 0.1549445, 0.7882353, 0, 1, 1,
0.866638, -1.438196, 2.540202, 0.7921569, 0, 1, 1,
0.8687101, -1.585992, 1.995859, 0.8, 0, 1, 1,
0.8717243, -0.9412479, 1.147233, 0.8078431, 0, 1, 1,
0.8783447, -0.7428954, 2.692556, 0.8117647, 0, 1, 1,
0.8809297, 0.3681919, 0.3231052, 0.8196079, 0, 1, 1,
0.8816584, -0.8036749, 2.514433, 0.8235294, 0, 1, 1,
0.8866978, -0.8263868, 3.71378, 0.8313726, 0, 1, 1,
0.8881276, -0.7636297, 3.412196, 0.8352941, 0, 1, 1,
0.8883519, -1.772318, 4.281276, 0.8431373, 0, 1, 1,
0.8892242, 0.4954833, 3.46611, 0.8470588, 0, 1, 1,
0.9002658, -1.007886, 0.3099734, 0.854902, 0, 1, 1,
0.9051347, -0.7816356, 2.887668, 0.8588235, 0, 1, 1,
0.9066854, -0.6543152, 1.12691, 0.8666667, 0, 1, 1,
0.9071661, -0.2105012, 1.472356, 0.8705882, 0, 1, 1,
0.9078938, -0.2841472, 1.70638, 0.8784314, 0, 1, 1,
0.9173059, -0.1946376, 1.849021, 0.8823529, 0, 1, 1,
0.9183995, -0.5249676, 2.611944, 0.8901961, 0, 1, 1,
0.9185739, 1.088456, 4.101657, 0.8941177, 0, 1, 1,
0.9253958, -2.162945, 2.911297, 0.9019608, 0, 1, 1,
0.9259624, 0.6219211, 1.407156, 0.9098039, 0, 1, 1,
0.9289487, 0.4336886, 1.00748, 0.9137255, 0, 1, 1,
0.9290615, 0.1299028, 1.541271, 0.9215686, 0, 1, 1,
0.9337242, -0.7731006, 2.860217, 0.9254902, 0, 1, 1,
0.9339963, 0.1080403, 1.160578, 0.9333333, 0, 1, 1,
0.93438, -0.3904704, 1.862308, 0.9372549, 0, 1, 1,
0.9351639, 0.317249, 0.3708354, 0.945098, 0, 1, 1,
0.9417417, -0.9866667, 1.924528, 0.9490196, 0, 1, 1,
0.9421546, 0.1442966, 2.242019, 0.9568627, 0, 1, 1,
0.9465387, -1.314092, 2.379262, 0.9607843, 0, 1, 1,
0.9473205, 0.6302512, 1.510087, 0.9686275, 0, 1, 1,
0.9658641, 0.637191, -1.064824, 0.972549, 0, 1, 1,
0.9694631, -0.1498668, 2.775806, 0.9803922, 0, 1, 1,
0.9707522, -0.461407, 0.5039108, 0.9843137, 0, 1, 1,
0.9725682, -0.5798842, 0.4611601, 0.9921569, 0, 1, 1,
0.9855198, -1.759223, 1.93214, 0.9960784, 0, 1, 1,
0.9941885, -1.294357, 2.982763, 1, 0, 0.9960784, 1,
0.9983916, -0.5420167, 2.673311, 1, 0, 0.9882353, 1,
0.9985915, 1.317384, 1.9901, 1, 0, 0.9843137, 1,
0.9997256, 0.2594264, 1.134787, 1, 0, 0.9764706, 1,
1.004048, 0.5669288, 2.879877, 1, 0, 0.972549, 1,
1.004637, -0.1004281, 0.8688875, 1, 0, 0.9647059, 1,
1.006316, -0.1558052, 1.719528, 1, 0, 0.9607843, 1,
1.007444, 0.1743095, 0.6735924, 1, 0, 0.9529412, 1,
1.009477, -0.5209293, 2.010885, 1, 0, 0.9490196, 1,
1.020368, 1.364331, -0.2103614, 1, 0, 0.9411765, 1,
1.028867, 1.043447, 0.8726914, 1, 0, 0.9372549, 1,
1.036116, -1.263829, 0.9936414, 1, 0, 0.9294118, 1,
1.037983, -0.9151596, 3.268045, 1, 0, 0.9254902, 1,
1.039603, 0.672208, -0.5388349, 1, 0, 0.9176471, 1,
1.040676, 0.7766674, 1.088476, 1, 0, 0.9137255, 1,
1.045295, 1.140212, 1.20578, 1, 0, 0.9058824, 1,
1.045781, -0.3203117, 0.003682642, 1, 0, 0.9019608, 1,
1.049489, -0.07638881, 1.595852, 1, 0, 0.8941177, 1,
1.054713, -0.485681, 1.459673, 1, 0, 0.8862745, 1,
1.064968, -0.7193883, 1.633087, 1, 0, 0.8823529, 1,
1.06683, 0.3488013, 2.027942, 1, 0, 0.8745098, 1,
1.071047, -0.127027, 1.203334, 1, 0, 0.8705882, 1,
1.074702, -1.500373, 3.876524, 1, 0, 0.8627451, 1,
1.077579, 0.3248324, 2.017333, 1, 0, 0.8588235, 1,
1.078253, 1.117328, 2.904358, 1, 0, 0.8509804, 1,
1.08108, -0.1401133, 2.952855, 1, 0, 0.8470588, 1,
1.085585, -0.7110289, 0.9156096, 1, 0, 0.8392157, 1,
1.090417, 0.3086459, 1.714135, 1, 0, 0.8352941, 1,
1.092209, 0.7644465, 1.164935, 1, 0, 0.827451, 1,
1.093817, 0.2090017, 0.7531843, 1, 0, 0.8235294, 1,
1.099135, -0.8707789, 1.246637, 1, 0, 0.8156863, 1,
1.101592, -1.270978, 1.529108, 1, 0, 0.8117647, 1,
1.101738, -0.7276095, 1.637466, 1, 0, 0.8039216, 1,
1.10446, 0.5253952, 0.7392364, 1, 0, 0.7960784, 1,
1.106217, -1.200169, 2.47578, 1, 0, 0.7921569, 1,
1.106862, -0.05649719, 1.637351, 1, 0, 0.7843137, 1,
1.107579, 0.2069844, 2.046394, 1, 0, 0.7803922, 1,
1.109769, -0.9281622, 1.684062, 1, 0, 0.772549, 1,
1.114721, -0.412739, 1.329243, 1, 0, 0.7686275, 1,
1.115939, -0.7179791, 3.743478, 1, 0, 0.7607843, 1,
1.116653, 0.4918386, 2.382873, 1, 0, 0.7568628, 1,
1.117529, 0.8596175, 1.940265, 1, 0, 0.7490196, 1,
1.118035, 0.7991546, -1.806589, 1, 0, 0.7450981, 1,
1.122367, -1.738028, 1.795671, 1, 0, 0.7372549, 1,
1.132219, 1.291708, -1.951789, 1, 0, 0.7333333, 1,
1.133604, 1.162104, 1.300742, 1, 0, 0.7254902, 1,
1.141464, 0.7555423, 1.807727, 1, 0, 0.7215686, 1,
1.147078, -0.2077585, 2.700252, 1, 0, 0.7137255, 1,
1.147583, -1.132443, 2.682543, 1, 0, 0.7098039, 1,
1.15342, 0.4523031, 0.9179592, 1, 0, 0.7019608, 1,
1.158317, -0.5223887, 1.443565, 1, 0, 0.6941177, 1,
1.169983, 0.7375344, 0.427404, 1, 0, 0.6901961, 1,
1.180395, 0.6671916, -0.1387214, 1, 0, 0.682353, 1,
1.188736, 0.2213703, 1.418215, 1, 0, 0.6784314, 1,
1.197231, 0.5062674, 1.054893, 1, 0, 0.6705883, 1,
1.207415, 0.7676522, 2.214589, 1, 0, 0.6666667, 1,
1.207816, -0.9320093, 1.754529, 1, 0, 0.6588235, 1,
1.22461, 0.5979123, 1.42829, 1, 0, 0.654902, 1,
1.228596, -0.9983435, 0.7508189, 1, 0, 0.6470588, 1,
1.235552, 0.8096234, 2.001815, 1, 0, 0.6431373, 1,
1.250552, -0.9426917, 1.994982, 1, 0, 0.6352941, 1,
1.251166, -0.08174707, 0.4574615, 1, 0, 0.6313726, 1,
1.261526, 0.9115041, 1.525019, 1, 0, 0.6235294, 1,
1.263433, 1.014988, 1.436108, 1, 0, 0.6196079, 1,
1.268071, -0.7252718, 2.757725, 1, 0, 0.6117647, 1,
1.26997, -1.036046, 0.7709894, 1, 0, 0.6078432, 1,
1.272013, -0.3858525, 3.0617, 1, 0, 0.6, 1,
1.276132, -0.6120786, 1.966838, 1, 0, 0.5921569, 1,
1.278648, -1.454726, 1.484068, 1, 0, 0.5882353, 1,
1.27897, -0.6692194, 2.837209, 1, 0, 0.5803922, 1,
1.279707, -2.101889, 4.381663, 1, 0, 0.5764706, 1,
1.286279, 1.252586, -0.7880974, 1, 0, 0.5686275, 1,
1.298138, 0.01715452, -0.1437116, 1, 0, 0.5647059, 1,
1.310328, -1.137243, -0.3298366, 1, 0, 0.5568628, 1,
1.317159, 0.2418189, 1.187933, 1, 0, 0.5529412, 1,
1.3182, 0.1449512, 0.9912944, 1, 0, 0.5450981, 1,
1.323067, -0.1238141, 0.5095019, 1, 0, 0.5411765, 1,
1.323303, -0.4905097, 1.094631, 1, 0, 0.5333334, 1,
1.325156, 0.2490441, 1.163563, 1, 0, 0.5294118, 1,
1.330605, 1.512243, 2.778568, 1, 0, 0.5215687, 1,
1.335034, 1.203695, 1.668804, 1, 0, 0.5176471, 1,
1.33604, -1.730838, 3.279887, 1, 0, 0.509804, 1,
1.350096, 0.8205249, 1.836737, 1, 0, 0.5058824, 1,
1.361094, 0.243928, 0.6224008, 1, 0, 0.4980392, 1,
1.362036, 0.1824021, 2.147905, 1, 0, 0.4901961, 1,
1.368878, -0.03404308, 0.3737757, 1, 0, 0.4862745, 1,
1.370833, -0.2381966, 0.567594, 1, 0, 0.4784314, 1,
1.374393, 0.2334872, 1.442537, 1, 0, 0.4745098, 1,
1.37858, 0.5612779, 0.7121747, 1, 0, 0.4666667, 1,
1.383993, -0.6021004, 1.586931, 1, 0, 0.4627451, 1,
1.384601, 1.683861, 0.2271659, 1, 0, 0.454902, 1,
1.391724, 0.6144444, 1.874186, 1, 0, 0.4509804, 1,
1.394181, 1.881881, 0.473673, 1, 0, 0.4431373, 1,
1.400939, -1.133155, 1.893153, 1, 0, 0.4392157, 1,
1.405531, 0.2601939, 2.146024, 1, 0, 0.4313726, 1,
1.408316, 1.554675, 0.5714765, 1, 0, 0.427451, 1,
1.430938, -0.6476569, 2.15088, 1, 0, 0.4196078, 1,
1.43741, -0.943462, 0.6725878, 1, 0, 0.4156863, 1,
1.440131, -1.236744, 3.302643, 1, 0, 0.4078431, 1,
1.448495, 0.613471, 0.08219993, 1, 0, 0.4039216, 1,
1.478179, 0.45623, 0.4485345, 1, 0, 0.3960784, 1,
1.480356, -0.003135731, 2.412773, 1, 0, 0.3882353, 1,
1.510062, 0.2714731, 2.246843, 1, 0, 0.3843137, 1,
1.513381, -0.6591272, 1.695369, 1, 0, 0.3764706, 1,
1.517674, 0.7500594, 0.2697452, 1, 0, 0.372549, 1,
1.528682, -0.0564311, 2.214666, 1, 0, 0.3647059, 1,
1.541021, -0.002023633, 1.268306, 1, 0, 0.3607843, 1,
1.546419, -0.04997945, 1.748565, 1, 0, 0.3529412, 1,
1.550041, -1.369275, 3.523402, 1, 0, 0.3490196, 1,
1.573167, 0.6141734, 0.73671, 1, 0, 0.3411765, 1,
1.577298, -0.04812969, 2.668019, 1, 0, 0.3372549, 1,
1.613103, -0.5821633, 2.549674, 1, 0, 0.3294118, 1,
1.617981, 0.968035, 1.671946, 1, 0, 0.3254902, 1,
1.63209, 1.451531, 1.443054, 1, 0, 0.3176471, 1,
1.639241, -0.3463475, 1.599438, 1, 0, 0.3137255, 1,
1.643361, -0.8449722, 3.947736, 1, 0, 0.3058824, 1,
1.667211, 0.8345917, 0.3628627, 1, 0, 0.2980392, 1,
1.692652, -0.5783834, 1.341427, 1, 0, 0.2941177, 1,
1.692976, 0.6910822, 1.271309, 1, 0, 0.2862745, 1,
1.704201, -1.437348, 3.426836, 1, 0, 0.282353, 1,
1.706962, 0.08791517, 1.541612, 1, 0, 0.2745098, 1,
1.713874, -1.394878, 0.3817635, 1, 0, 0.2705882, 1,
1.776352, -0.1428174, 1.124445, 1, 0, 0.2627451, 1,
1.778974, -1.351934, 3.397666, 1, 0, 0.2588235, 1,
1.7845, -1.847208, 2.785224, 1, 0, 0.2509804, 1,
1.789511, 0.0811331, 4.4411, 1, 0, 0.2470588, 1,
1.812327, -0.2083648, 2.203928, 1, 0, 0.2392157, 1,
1.822457, -0.1601116, 3.974481, 1, 0, 0.2352941, 1,
1.837215, 0.7362781, 1.630619, 1, 0, 0.227451, 1,
1.838124, 0.4183463, 2.97479, 1, 0, 0.2235294, 1,
1.840261, 0.0547621, 3.254476, 1, 0, 0.2156863, 1,
1.850346, -2.999918, 2.127086, 1, 0, 0.2117647, 1,
1.877052, 0.7550609, 3.135287, 1, 0, 0.2039216, 1,
1.909645, 0.6758155, 0.8158994, 1, 0, 0.1960784, 1,
1.944476, 0.2404, 1.001946, 1, 0, 0.1921569, 1,
1.949853, -0.1307364, -0.1974948, 1, 0, 0.1843137, 1,
1.957709, -0.1868417, 0.4659354, 1, 0, 0.1803922, 1,
1.969124, -1.396124, 4.197181, 1, 0, 0.172549, 1,
1.989841, -1.591963, 1.709589, 1, 0, 0.1686275, 1,
2.023116, -1.316244, 3.112436, 1, 0, 0.1607843, 1,
2.045505, -0.6636707, 0.908553, 1, 0, 0.1568628, 1,
2.055234, 1.419972, -0.6150683, 1, 0, 0.1490196, 1,
2.05665, 1.296423, 2.01164, 1, 0, 0.145098, 1,
2.115102, 0.1321858, 2.897076, 1, 0, 0.1372549, 1,
2.115718, 1.026151, 2.468519, 1, 0, 0.1333333, 1,
2.133812, 0.9389684, 1.718785, 1, 0, 0.1254902, 1,
2.137789, -1.486579, 1.901567, 1, 0, 0.1215686, 1,
2.178329, -1.031691, 2.342291, 1, 0, 0.1137255, 1,
2.184546, -1.953589, 1.884928, 1, 0, 0.1098039, 1,
2.202413, -0.5185978, 0.9624682, 1, 0, 0.1019608, 1,
2.219345, 0.9709963, 1.74048, 1, 0, 0.09411765, 1,
2.23109, -1.254781, 2.426185, 1, 0, 0.09019608, 1,
2.252444, 0.3148428, 2.649112, 1, 0, 0.08235294, 1,
2.307597, -1.249677, 0.1632892, 1, 0, 0.07843138, 1,
2.334978, -0.4486697, 3.063325, 1, 0, 0.07058824, 1,
2.343405, -0.05976676, 1.359623, 1, 0, 0.06666667, 1,
2.400713, 0.2921777, 1.161317, 1, 0, 0.05882353, 1,
2.476002, -0.2620279, 1.881783, 1, 0, 0.05490196, 1,
2.518216, 0.7657188, 0.9159612, 1, 0, 0.04705882, 1,
2.647627, -1.130941, 1.681124, 1, 0, 0.04313726, 1,
2.673435, -0.2299064, 3.572604, 1, 0, 0.03529412, 1,
2.695954, -0.2207636, 2.732341, 1, 0, 0.03137255, 1,
2.701387, 2.326794, 1.581014, 1, 0, 0.02352941, 1,
2.737553, -0.8634627, 1.188588, 1, 0, 0.01960784, 1,
2.936072, -0.2986593, 1.405, 1, 0, 0.01176471, 1,
3.027189, 0.8408988, 2.836755, 1, 0, 0.007843138, 1
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
-0.002126575, -4.022335, -7.322159, 0, -0.5, 0.5, 0.5,
-0.002126575, -4.022335, -7.322159, 1, -0.5, 0.5, 0.5,
-0.002126575, -4.022335, -7.322159, 1, 1.5, 0.5, 0.5,
-0.002126575, -4.022335, -7.322159, 0, 1.5, 0.5, 0.5
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
-4.05838, 0.01605964, -7.322159, 0, -0.5, 0.5, 0.5,
-4.05838, 0.01605964, -7.322159, 1, -0.5, 0.5, 0.5,
-4.05838, 0.01605964, -7.322159, 1, 1.5, 0.5, 0.5,
-4.05838, 0.01605964, -7.322159, 0, 1.5, 0.5, 0.5
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
-4.05838, -4.022335, -0.08303237, 0, -0.5, 0.5, 0.5,
-4.05838, -4.022335, -0.08303237, 1, -0.5, 0.5, 0.5,
-4.05838, -4.022335, -0.08303237, 1, 1.5, 0.5, 0.5,
-4.05838, -4.022335, -0.08303237, 0, 1.5, 0.5, 0.5
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
-3, -3.090398, -5.651591,
3, -3.090398, -5.651591,
-3, -3.090398, -5.651591,
-3, -3.245721, -5.930019,
-2, -3.090398, -5.651591,
-2, -3.245721, -5.930019,
-1, -3.090398, -5.651591,
-1, -3.245721, -5.930019,
0, -3.090398, -5.651591,
0, -3.245721, -5.930019,
1, -3.090398, -5.651591,
1, -3.245721, -5.930019,
2, -3.090398, -5.651591,
2, -3.245721, -5.930019,
3, -3.090398, -5.651591,
3, -3.245721, -5.930019
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
-3, -3.556366, -6.486875, 0, -0.5, 0.5, 0.5,
-3, -3.556366, -6.486875, 1, -0.5, 0.5, 0.5,
-3, -3.556366, -6.486875, 1, 1.5, 0.5, 0.5,
-3, -3.556366, -6.486875, 0, 1.5, 0.5, 0.5,
-2, -3.556366, -6.486875, 0, -0.5, 0.5, 0.5,
-2, -3.556366, -6.486875, 1, -0.5, 0.5, 0.5,
-2, -3.556366, -6.486875, 1, 1.5, 0.5, 0.5,
-2, -3.556366, -6.486875, 0, 1.5, 0.5, 0.5,
-1, -3.556366, -6.486875, 0, -0.5, 0.5, 0.5,
-1, -3.556366, -6.486875, 1, -0.5, 0.5, 0.5,
-1, -3.556366, -6.486875, 1, 1.5, 0.5, 0.5,
-1, -3.556366, -6.486875, 0, 1.5, 0.5, 0.5,
0, -3.556366, -6.486875, 0, -0.5, 0.5, 0.5,
0, -3.556366, -6.486875, 1, -0.5, 0.5, 0.5,
0, -3.556366, -6.486875, 1, 1.5, 0.5, 0.5,
0, -3.556366, -6.486875, 0, 1.5, 0.5, 0.5,
1, -3.556366, -6.486875, 0, -0.5, 0.5, 0.5,
1, -3.556366, -6.486875, 1, -0.5, 0.5, 0.5,
1, -3.556366, -6.486875, 1, 1.5, 0.5, 0.5,
1, -3.556366, -6.486875, 0, 1.5, 0.5, 0.5,
2, -3.556366, -6.486875, 0, -0.5, 0.5, 0.5,
2, -3.556366, -6.486875, 1, -0.5, 0.5, 0.5,
2, -3.556366, -6.486875, 1, 1.5, 0.5, 0.5,
2, -3.556366, -6.486875, 0, 1.5, 0.5, 0.5,
3, -3.556366, -6.486875, 0, -0.5, 0.5, 0.5,
3, -3.556366, -6.486875, 1, -0.5, 0.5, 0.5,
3, -3.556366, -6.486875, 1, 1.5, 0.5, 0.5,
3, -3.556366, -6.486875, 0, 1.5, 0.5, 0.5
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
-3.122321, -2, -5.651591,
-3.122321, 3, -5.651591,
-3.122321, -2, -5.651591,
-3.278331, -2, -5.930019,
-3.122321, -1, -5.651591,
-3.278331, -1, -5.930019,
-3.122321, 0, -5.651591,
-3.278331, 0, -5.930019,
-3.122321, 1, -5.651591,
-3.278331, 1, -5.930019,
-3.122321, 2, -5.651591,
-3.278331, 2, -5.930019,
-3.122321, 3, -5.651591,
-3.278331, 3, -5.930019
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
-3.590351, -2, -6.486875, 0, -0.5, 0.5, 0.5,
-3.590351, -2, -6.486875, 1, -0.5, 0.5, 0.5,
-3.590351, -2, -6.486875, 1, 1.5, 0.5, 0.5,
-3.590351, -2, -6.486875, 0, 1.5, 0.5, 0.5,
-3.590351, -1, -6.486875, 0, -0.5, 0.5, 0.5,
-3.590351, -1, -6.486875, 1, -0.5, 0.5, 0.5,
-3.590351, -1, -6.486875, 1, 1.5, 0.5, 0.5,
-3.590351, -1, -6.486875, 0, 1.5, 0.5, 0.5,
-3.590351, 0, -6.486875, 0, -0.5, 0.5, 0.5,
-3.590351, 0, -6.486875, 1, -0.5, 0.5, 0.5,
-3.590351, 0, -6.486875, 1, 1.5, 0.5, 0.5,
-3.590351, 0, -6.486875, 0, 1.5, 0.5, 0.5,
-3.590351, 1, -6.486875, 0, -0.5, 0.5, 0.5,
-3.590351, 1, -6.486875, 1, -0.5, 0.5, 0.5,
-3.590351, 1, -6.486875, 1, 1.5, 0.5, 0.5,
-3.590351, 1, -6.486875, 0, 1.5, 0.5, 0.5,
-3.590351, 2, -6.486875, 0, -0.5, 0.5, 0.5,
-3.590351, 2, -6.486875, 1, -0.5, 0.5, 0.5,
-3.590351, 2, -6.486875, 1, 1.5, 0.5, 0.5,
-3.590351, 2, -6.486875, 0, 1.5, 0.5, 0.5,
-3.590351, 3, -6.486875, 0, -0.5, 0.5, 0.5,
-3.590351, 3, -6.486875, 1, -0.5, 0.5, 0.5,
-3.590351, 3, -6.486875, 1, 1.5, 0.5, 0.5,
-3.590351, 3, -6.486875, 0, 1.5, 0.5, 0.5
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
-3.122321, -3.090398, -4,
-3.122321, -3.090398, 4,
-3.122321, -3.090398, -4,
-3.278331, -3.245721, -4,
-3.122321, -3.090398, -2,
-3.278331, -3.245721, -2,
-3.122321, -3.090398, 0,
-3.278331, -3.245721, 0,
-3.122321, -3.090398, 2,
-3.278331, -3.245721, 2,
-3.122321, -3.090398, 4,
-3.278331, -3.245721, 4
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
-3.590351, -3.556366, -4, 0, -0.5, 0.5, 0.5,
-3.590351, -3.556366, -4, 1, -0.5, 0.5, 0.5,
-3.590351, -3.556366, -4, 1, 1.5, 0.5, 0.5,
-3.590351, -3.556366, -4, 0, 1.5, 0.5, 0.5,
-3.590351, -3.556366, -2, 0, -0.5, 0.5, 0.5,
-3.590351, -3.556366, -2, 1, -0.5, 0.5, 0.5,
-3.590351, -3.556366, -2, 1, 1.5, 0.5, 0.5,
-3.590351, -3.556366, -2, 0, 1.5, 0.5, 0.5,
-3.590351, -3.556366, 0, 0, -0.5, 0.5, 0.5,
-3.590351, -3.556366, 0, 1, -0.5, 0.5, 0.5,
-3.590351, -3.556366, 0, 1, 1.5, 0.5, 0.5,
-3.590351, -3.556366, 0, 0, 1.5, 0.5, 0.5,
-3.590351, -3.556366, 2, 0, -0.5, 0.5, 0.5,
-3.590351, -3.556366, 2, 1, -0.5, 0.5, 0.5,
-3.590351, -3.556366, 2, 1, 1.5, 0.5, 0.5,
-3.590351, -3.556366, 2, 0, 1.5, 0.5, 0.5,
-3.590351, -3.556366, 4, 0, -0.5, 0.5, 0.5,
-3.590351, -3.556366, 4, 1, -0.5, 0.5, 0.5,
-3.590351, -3.556366, 4, 1, 1.5, 0.5, 0.5,
-3.590351, -3.556366, 4, 0, 1.5, 0.5, 0.5
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
-3.122321, -3.090398, -5.651591,
-3.122321, 3.122517, -5.651591,
-3.122321, -3.090398, 5.485527,
-3.122321, 3.122517, 5.485527,
-3.122321, -3.090398, -5.651591,
-3.122321, -3.090398, 5.485527,
-3.122321, 3.122517, -5.651591,
-3.122321, 3.122517, 5.485527,
-3.122321, -3.090398, -5.651591,
3.118068, -3.090398, -5.651591,
-3.122321, -3.090398, 5.485527,
3.118068, -3.090398, 5.485527,
-3.122321, 3.122517, -5.651591,
3.118068, 3.122517, -5.651591,
-3.122321, 3.122517, 5.485527,
3.118068, 3.122517, 5.485527,
3.118068, -3.090398, -5.651591,
3.118068, 3.122517, -5.651591,
3.118068, -3.090398, 5.485527,
3.118068, 3.122517, 5.485527,
3.118068, -3.090398, -5.651591,
3.118068, -3.090398, 5.485527,
3.118068, 3.122517, -5.651591,
3.118068, 3.122517, 5.485527
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
var radius = 7.581362;
var distance = 33.73034;
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
mvMatrix.translate( 0.002126575, -0.01605964, 0.08303237 );
mvMatrix.scale( 1.313558, 1.319367, 0.7360178 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.73034);
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
benalaxyl<-read.table("benalaxyl.xyz")
```

```
## Error in read.table("benalaxyl.xyz"): no lines available in input
```

```r
x<-benalaxyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'benalaxyl' not found
```

```r
y<-benalaxyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'benalaxyl' not found
```

```r
z<-benalaxyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'benalaxyl' not found
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
-3.031442, -0.1406341, 0.1289641, 0, 0, 1, 1, 1,
-3.002133, -1.115415, -1.784035, 1, 0, 0, 1, 1,
-2.454688, -0.7007524, -2.532465, 1, 0, 0, 1, 1,
-2.448578, -0.6239079, -1.571484, 1, 0, 0, 1, 1,
-2.427866, -0.2248891, -0.9191191, 1, 0, 0, 1, 1,
-2.424366, -1.494388, -2.487064, 1, 0, 0, 1, 1,
-2.324462, -1.183767, -1.297191, 0, 0, 0, 1, 1,
-2.246461, 0.447592, -1.925086, 0, 0, 0, 1, 1,
-2.162778, -0.05926983, -2.568368, 0, 0, 0, 1, 1,
-2.145454, 0.3792243, -0.756719, 0, 0, 0, 1, 1,
-2.135208, -0.007303264, -2.547856, 0, 0, 0, 1, 1,
-2.130678, 0.3385356, -1.541219, 0, 0, 0, 1, 1,
-2.094934, -0.286788, -2.632042, 0, 0, 0, 1, 1,
-2.015599, -1.559779, -1.978675, 1, 1, 1, 1, 1,
-1.926563, 1.779398, -0.8946607, 1, 1, 1, 1, 1,
-1.918586, -0.7511528, -4.128062, 1, 1, 1, 1, 1,
-1.905524, -2.133382, -1.484781, 1, 1, 1, 1, 1,
-1.87508, -1.327183, -1.305973, 1, 1, 1, 1, 1,
-1.860559, 0.7899919, -0.8406255, 1, 1, 1, 1, 1,
-1.853459, -1.227394, -1.30248, 1, 1, 1, 1, 1,
-1.831731, 0.3872463, -1.71957, 1, 1, 1, 1, 1,
-1.818173, 0.3360054, -0.4022599, 1, 1, 1, 1, 1,
-1.809835, -0.01681099, -1.516181, 1, 1, 1, 1, 1,
-1.798837, 0.6776235, -0.5416111, 1, 1, 1, 1, 1,
-1.796857, -0.2546591, -0.6632602, 1, 1, 1, 1, 1,
-1.791018, -0.7687624, -1.14174, 1, 1, 1, 1, 1,
-1.782618, -0.4744382, -1.290968, 1, 1, 1, 1, 1,
-1.781242, 0.3241642, -2.609963, 1, 1, 1, 1, 1,
-1.77034, -0.3926355, -2.493336, 0, 0, 1, 1, 1,
-1.768203, 0.6404042, -0.3035918, 1, 0, 0, 1, 1,
-1.73598, 0.9156215, -1.047568, 1, 0, 0, 1, 1,
-1.730536, -0.3666634, -1.559875, 1, 0, 0, 1, 1,
-1.698394, 0.3489926, -2.461329, 1, 0, 0, 1, 1,
-1.696533, -1.42864, -2.296248, 1, 0, 0, 1, 1,
-1.691875, 0.2818648, 0.1448786, 0, 0, 0, 1, 1,
-1.682533, -0.564733, -1.054259, 0, 0, 0, 1, 1,
-1.679672, 1.343022, -0.879783, 0, 0, 0, 1, 1,
-1.637713, 0.02643555, -0.9098389, 0, 0, 0, 1, 1,
-1.636091, 1.370776, 0.3100953, 0, 0, 0, 1, 1,
-1.633041, 1.40209, 0.3063006, 0, 0, 0, 1, 1,
-1.625416, -0.1014091, -3.10532, 0, 0, 0, 1, 1,
-1.622147, 0.8448645, -0.4551899, 1, 1, 1, 1, 1,
-1.610046, -0.1401307, -1.577662, 1, 1, 1, 1, 1,
-1.593112, -1.887174, -2.31581, 1, 1, 1, 1, 1,
-1.58145, -0.7382697, -2.00322, 1, 1, 1, 1, 1,
-1.579235, 0.2706414, -1.950628, 1, 1, 1, 1, 1,
-1.576437, 0.597414, -1.893776, 1, 1, 1, 1, 1,
-1.570705, 1.529253, -0.8714336, 1, 1, 1, 1, 1,
-1.567051, 0.1068528, -2.721741, 1, 1, 1, 1, 1,
-1.563343, -0.987209, -1.389006, 1, 1, 1, 1, 1,
-1.55115, 0.5595774, -1.114314, 1, 1, 1, 1, 1,
-1.545205, -2.623597, -1.753683, 1, 1, 1, 1, 1,
-1.544844, 0.1339392, -0.5885894, 1, 1, 1, 1, 1,
-1.542534, -0.7596824, -1.898361, 1, 1, 1, 1, 1,
-1.542522, -0.3238253, -1.73064, 1, 1, 1, 1, 1,
-1.536756, 0.06827967, -0.5547362, 1, 1, 1, 1, 1,
-1.533141, 0.4180335, 0.7552782, 0, 0, 1, 1, 1,
-1.506146, -0.3830962, -2.890697, 1, 0, 0, 1, 1,
-1.501115, -1.827284, -4.043087, 1, 0, 0, 1, 1,
-1.466144, 0.6532773, -1.289906, 1, 0, 0, 1, 1,
-1.452667, -1.100268, -1.210868, 1, 0, 0, 1, 1,
-1.445015, -0.7244729, -2.696733, 1, 0, 0, 1, 1,
-1.444557, -1.844445, -3.607904, 0, 0, 0, 1, 1,
-1.436223, 0.9953948, 0.5732701, 0, 0, 0, 1, 1,
-1.432821, 1.389318, -1.565678, 0, 0, 0, 1, 1,
-1.430434, 0.4213345, -0.7985601, 0, 0, 0, 1, 1,
-1.421895, -1.214926, 0.7208472, 0, 0, 0, 1, 1,
-1.41495, 1.192466, -1.234351, 0, 0, 0, 1, 1,
-1.408937, -0.2827712, -1.445588, 0, 0, 0, 1, 1,
-1.403143, -1.436996, -0.8815656, 1, 1, 1, 1, 1,
-1.400502, 0.7080736, -0.4229059, 1, 1, 1, 1, 1,
-1.38208, 0.9681551, -0.3322642, 1, 1, 1, 1, 1,
-1.361696, 0.4137955, -0.713218, 1, 1, 1, 1, 1,
-1.346172, -0.9552116, -2.614451, 1, 1, 1, 1, 1,
-1.342525, 1.384292, -2.61849, 1, 1, 1, 1, 1,
-1.333336, -0.5705557, -0.5882134, 1, 1, 1, 1, 1,
-1.329817, -0.8517148, -2.112195, 1, 1, 1, 1, 1,
-1.324314, 0.6958142, -2.718346, 1, 1, 1, 1, 1,
-1.321091, 0.9282609, -0.5930405, 1, 1, 1, 1, 1,
-1.314352, -0.3967078, -4.814953, 1, 1, 1, 1, 1,
-1.314004, 1.501338, 0.4185864, 1, 1, 1, 1, 1,
-1.304886, 0.1390569, -1.489913, 1, 1, 1, 1, 1,
-1.301796, -1.640199, -1.077607, 1, 1, 1, 1, 1,
-1.29603, 0.8183892, -1.678082, 1, 1, 1, 1, 1,
-1.292978, 0.1575467, -2.687504, 0, 0, 1, 1, 1,
-1.288879, -0.2981765, -2.069779, 1, 0, 0, 1, 1,
-1.288759, 1.414862, -0.9153774, 1, 0, 0, 1, 1,
-1.281303, 2.491061, 0.4926305, 1, 0, 0, 1, 1,
-1.279493, 0.6404035, 0.8417051, 1, 0, 0, 1, 1,
-1.254523, -0.6086798, -2.083822, 1, 0, 0, 1, 1,
-1.246775, -0.5861319, -3.477471, 0, 0, 0, 1, 1,
-1.243432, 0.9734735, -1.031021, 0, 0, 0, 1, 1,
-1.223931, 0.08923214, -2.484361, 0, 0, 0, 1, 1,
-1.217328, 1.167273, 0.2682434, 0, 0, 0, 1, 1,
-1.214854, -0.7866928, -4.860561, 0, 0, 0, 1, 1,
-1.209488, 1.219857, 0.8379292, 0, 0, 0, 1, 1,
-1.207077, -0.2953171, -3.090219, 0, 0, 0, 1, 1,
-1.206677, 0.2110172, -0.7919332, 1, 1, 1, 1, 1,
-1.202584, 0.6548316, -1.36075, 1, 1, 1, 1, 1,
-1.19759, 0.003701953, -1.377399, 1, 1, 1, 1, 1,
-1.197051, 1.771766, 0.177175, 1, 1, 1, 1, 1,
-1.187147, 1.30208, -2.253582, 1, 1, 1, 1, 1,
-1.170076, 0.4511186, -1.483023, 1, 1, 1, 1, 1,
-1.169562, 0.02672031, -2.156682, 1, 1, 1, 1, 1,
-1.163516, -0.1860467, -2.31935, 1, 1, 1, 1, 1,
-1.152336, -0.7160072, -1.110677, 1, 1, 1, 1, 1,
-1.150936, -0.5092643, -4.413438, 1, 1, 1, 1, 1,
-1.149847, -0.09339386, -1.392189, 1, 1, 1, 1, 1,
-1.149008, 0.8406871, -2.176073, 1, 1, 1, 1, 1,
-1.144761, -0.1755934, -1.850097, 1, 1, 1, 1, 1,
-1.144677, 1.151094, 0.01750466, 1, 1, 1, 1, 1,
-1.143863, 0.2150671, -3.839772, 1, 1, 1, 1, 1,
-1.141369, -1.698442, -2.754409, 0, 0, 1, 1, 1,
-1.139022, 2.065696, -0.7018647, 1, 0, 0, 1, 1,
-1.138879, 0.09268593, -2.593408, 1, 0, 0, 1, 1,
-1.137571, 0.8560129, -2.617484, 1, 0, 0, 1, 1,
-1.137056, 1.428269, -1.145381, 1, 0, 0, 1, 1,
-1.134446, -1.823285, -2.615789, 1, 0, 0, 1, 1,
-1.131488, 0.8871729, 0.8479185, 0, 0, 0, 1, 1,
-1.131458, -0.2235641, -2.247135, 0, 0, 0, 1, 1,
-1.117462, -0.357757, -2.62952, 0, 0, 0, 1, 1,
-1.116728, -0.2316089, -1.89962, 0, 0, 0, 1, 1,
-1.114316, 0.6183187, -1.699066, 0, 0, 0, 1, 1,
-1.102186, -0.4628919, -1.581005, 0, 0, 0, 1, 1,
-1.100133, 0.1234588, -1.717037, 0, 0, 0, 1, 1,
-1.09933, -1.019094, -1.560288, 1, 1, 1, 1, 1,
-1.092089, -0.4666044, -0.4107589, 1, 1, 1, 1, 1,
-1.090619, 0.4599061, 1.373937, 1, 1, 1, 1, 1,
-1.085671, 1.366222, 1.320353, 1, 1, 1, 1, 1,
-1.082905, 0.0833699, -2.12067, 1, 1, 1, 1, 1,
-1.076279, 0.4579444, 0.1882633, 1, 1, 1, 1, 1,
-1.054294, -0.5393349, -3.499625, 1, 1, 1, 1, 1,
-1.05183, 1.621658, -0.5638894, 1, 1, 1, 1, 1,
-1.049873, 1.133228, -0.1851991, 1, 1, 1, 1, 1,
-1.043768, -1.521344, -3.991968, 1, 1, 1, 1, 1,
-1.040255, -0.04259175, 0.3078301, 1, 1, 1, 1, 1,
-1.038038, -0.1581698, 0.1561239, 1, 1, 1, 1, 1,
-1.036828, -1.57091, -1.734444, 1, 1, 1, 1, 1,
-1.029793, -0.950712, -2.199353, 1, 1, 1, 1, 1,
-1.017931, 1.585329, -0.309415, 1, 1, 1, 1, 1,
-1.013418, -1.643969, -3.682691, 0, 0, 1, 1, 1,
-1.010968, 0.2964561, -2.360027, 1, 0, 0, 1, 1,
-1.004216, 0.1027908, -1.037425, 1, 0, 0, 1, 1,
-1.004066, 1.31456, -0.9723174, 1, 0, 0, 1, 1,
-0.9954485, 1.028212, -1.118939, 1, 0, 0, 1, 1,
-0.9922933, -0.3875431, -2.584759, 1, 0, 0, 1, 1,
-0.9866063, -1.42189, 0.710332, 0, 0, 0, 1, 1,
-0.980964, -0.3228144, -0.1646771, 0, 0, 0, 1, 1,
-0.9771074, 0.6085818, -0.9145256, 0, 0, 0, 1, 1,
-0.9703494, -0.4893368, -0.9587926, 0, 0, 0, 1, 1,
-0.9699156, -0.6208733, -1.594063, 0, 0, 0, 1, 1,
-0.9581288, 0.587531, -1.056947, 0, 0, 0, 1, 1,
-0.9481234, 0.8785902, -0.07178615, 0, 0, 0, 1, 1,
-0.9421698, -0.03605217, -3.833711, 1, 1, 1, 1, 1,
-0.9305068, -0.1187508, -2.187974, 1, 1, 1, 1, 1,
-0.927734, -1.301384, -1.818218, 1, 1, 1, 1, 1,
-0.9217614, 1.03496, 0.1538104, 1, 1, 1, 1, 1,
-0.9216005, 0.531726, -2.204078, 1, 1, 1, 1, 1,
-0.9213308, 1.320347, -1.435558, 1, 1, 1, 1, 1,
-0.9209151, -1.822859, -1.894922, 1, 1, 1, 1, 1,
-0.9179328, 0.6720018, 0.06520019, 1, 1, 1, 1, 1,
-0.9109377, -0.6256409, -1.30687, 1, 1, 1, 1, 1,
-0.9105111, 0.4860333, -1.431567, 1, 1, 1, 1, 1,
-0.9028515, -0.844316, -1.034563, 1, 1, 1, 1, 1,
-0.8964541, 1.500113, 0.06446441, 1, 1, 1, 1, 1,
-0.8961039, 0.02278034, -2.793095, 1, 1, 1, 1, 1,
-0.8939169, -0.8043871, -0.6820212, 1, 1, 1, 1, 1,
-0.893576, 0.8068254, -3.006644, 1, 1, 1, 1, 1,
-0.8886093, -0.2140784, -2.306589, 0, 0, 1, 1, 1,
-0.8874492, -0.7341478, -2.234298, 1, 0, 0, 1, 1,
-0.8871162, 1.324837, -0.01679979, 1, 0, 0, 1, 1,
-0.8854086, -0.1114284, -2.655168, 1, 0, 0, 1, 1,
-0.882612, -0.990918, -3.151436, 1, 0, 0, 1, 1,
-0.8754136, 0.23915, -2.017527, 1, 0, 0, 1, 1,
-0.8752586, -0.0904417, -0.4277442, 0, 0, 0, 1, 1,
-0.8624698, -0.2224003, -0.9961283, 0, 0, 0, 1, 1,
-0.8611948, -0.1440543, -0.1374484, 0, 0, 0, 1, 1,
-0.8605693, -0.09086669, -1.610412, 0, 0, 0, 1, 1,
-0.8602324, 1.347368, -0.09850223, 0, 0, 0, 1, 1,
-0.8533642, 1.358082, -1.389445, 0, 0, 0, 1, 1,
-0.8503699, 1.386871, -1.038829, 0, 0, 0, 1, 1,
-0.8454038, -0.1708732, -1.789617, 1, 1, 1, 1, 1,
-0.8453689, -0.7970409, -2.564613, 1, 1, 1, 1, 1,
-0.8435053, -0.1002905, -0.611437, 1, 1, 1, 1, 1,
-0.8399456, 0.1643223, -1.879131, 1, 1, 1, 1, 1,
-0.8397982, -1.106555, -2.951018, 1, 1, 1, 1, 1,
-0.8388428, 0.9133413, -0.1599714, 1, 1, 1, 1, 1,
-0.8352517, -0.9514173, -2.1856, 1, 1, 1, 1, 1,
-0.8335078, 0.4687086, -0.1850323, 1, 1, 1, 1, 1,
-0.8330002, -1.322038, -2.849766, 1, 1, 1, 1, 1,
-0.8287411, -0.5675746, -2.848501, 1, 1, 1, 1, 1,
-0.8273134, -1.419327, -1.750181, 1, 1, 1, 1, 1,
-0.8267856, -1.546859, -3.419364, 1, 1, 1, 1, 1,
-0.823401, -1.765785, -1.844932, 1, 1, 1, 1, 1,
-0.8229392, -0.3234044, -2.546124, 1, 1, 1, 1, 1,
-0.8210151, -0.02005232, -0.155458, 1, 1, 1, 1, 1,
-0.8199373, 1.394081, 0.2928528, 0, 0, 1, 1, 1,
-0.8181977, -0.1897642, -2.191124, 1, 0, 0, 1, 1,
-0.816098, 0.622399, 0.2287699, 1, 0, 0, 1, 1,
-0.8082615, -0.2821054, -0.7939429, 1, 0, 0, 1, 1,
-0.8056017, -0.3011915, -3.54099, 1, 0, 0, 1, 1,
-0.8003317, 1.176558, -0.2184828, 1, 0, 0, 1, 1,
-0.7980626, -0.2466667, -0.7591795, 0, 0, 0, 1, 1,
-0.7942116, 0.5632488, -0.8321576, 0, 0, 0, 1, 1,
-0.7929404, 0.8319685, -0.4477391, 0, 0, 0, 1, 1,
-0.7903928, -0.7712913, -0.9451008, 0, 0, 0, 1, 1,
-0.789665, 0.4982059, -2.675729, 0, 0, 0, 1, 1,
-0.7794136, -0.840915, -1.336777, 0, 0, 0, 1, 1,
-0.7770129, 0.100905, -1.280883, 0, 0, 0, 1, 1,
-0.7757805, -1.815646, -1.417758, 1, 1, 1, 1, 1,
-0.7722746, -0.8238866, -2.59455, 1, 1, 1, 1, 1,
-0.7711861, -0.3597794, -0.8591231, 1, 1, 1, 1, 1,
-0.7658903, 1.546706, -1.119623, 1, 1, 1, 1, 1,
-0.76415, 0.5507256, -1.413409, 1, 1, 1, 1, 1,
-0.7493539, 0.4234334, -3.428, 1, 1, 1, 1, 1,
-0.7467891, 0.0809387, -1.710214, 1, 1, 1, 1, 1,
-0.7405846, 0.4717429, -0.6183919, 1, 1, 1, 1, 1,
-0.7403061, 0.4854712, -0.8543956, 1, 1, 1, 1, 1,
-0.7362614, 0.8190608, 0.1972881, 1, 1, 1, 1, 1,
-0.7325967, 0.8285679, -0.9839085, 1, 1, 1, 1, 1,
-0.7307444, -0.09408056, -1.12581, 1, 1, 1, 1, 1,
-0.7291337, 1.161144, 0.8259027, 1, 1, 1, 1, 1,
-0.7208796, -0.1616079, -2.771464, 1, 1, 1, 1, 1,
-0.7190168, 0.9789149, -0.6164392, 1, 1, 1, 1, 1,
-0.7176215, 1.20745, -0.5206872, 0, 0, 1, 1, 1,
-0.7165824, 0.6539302, -1.864204, 1, 0, 0, 1, 1,
-0.7112107, 0.7808128, 1.448132, 1, 0, 0, 1, 1,
-0.7097886, 0.05297684, -0.1372919, 1, 0, 0, 1, 1,
-0.708332, -2.579571, -2.432813, 1, 0, 0, 1, 1,
-0.7072276, -2.312775, -3.428146, 1, 0, 0, 1, 1,
-0.7042321, 0.949133, -0.8238175, 0, 0, 0, 1, 1,
-0.6963475, 1.281706, -1.432039, 0, 0, 0, 1, 1,
-0.6914401, -0.4272483, -0.01224323, 0, 0, 0, 1, 1,
-0.6876283, 1.385745, 0.1300454, 0, 0, 0, 1, 1,
-0.6822183, 2.477169, 0.5182012, 0, 0, 0, 1, 1,
-0.6817566, -1.623497, 0.08079889, 0, 0, 0, 1, 1,
-0.6814053, 0.2643906, -0.6727747, 0, 0, 0, 1, 1,
-0.6791346, -0.5939618, -1.118158, 1, 1, 1, 1, 1,
-0.6791025, -0.08287526, -0.5144928, 1, 1, 1, 1, 1,
-0.6763536, -1.602791, -3.544598, 1, 1, 1, 1, 1,
-0.6743015, 1.041288, -1.021135, 1, 1, 1, 1, 1,
-0.6706832, 0.2610202, -0.5732277, 1, 1, 1, 1, 1,
-0.6700667, -0.2851291, -0.9303705, 1, 1, 1, 1, 1,
-0.6611213, -0.1407619, -1.037021, 1, 1, 1, 1, 1,
-0.6585947, 0.2888647, -1.356884, 1, 1, 1, 1, 1,
-0.6548036, 0.4955278, -0.8710249, 1, 1, 1, 1, 1,
-0.6541615, -1.046631, -2.179091, 1, 1, 1, 1, 1,
-0.651508, 0.6088417, -0.9960656, 1, 1, 1, 1, 1,
-0.6471511, -0.1900253, -2.677899, 1, 1, 1, 1, 1,
-0.6469162, 1.046895, 0.5146945, 1, 1, 1, 1, 1,
-0.6468956, 0.4765593, 0.8878418, 1, 1, 1, 1, 1,
-0.6457727, 0.8175634, -0.04877939, 1, 1, 1, 1, 1,
-0.6445245, 1.149263, -0.9161338, 0, 0, 1, 1, 1,
-0.6443824, -1.074256, -2.137572, 1, 0, 0, 1, 1,
-0.6433128, -0.1872191, -2.700703, 1, 0, 0, 1, 1,
-0.6428463, 0.3005136, -0.9213862, 1, 0, 0, 1, 1,
-0.6397157, -0.5264203, -2.303088, 1, 0, 0, 1, 1,
-0.6356197, -0.364376, -1.493666, 1, 0, 0, 1, 1,
-0.6284394, 1.383117, -1.354443, 0, 0, 0, 1, 1,
-0.6278231, -1.304749, -3.234098, 0, 0, 0, 1, 1,
-0.6273044, 0.8864771, 0.1179839, 0, 0, 0, 1, 1,
-0.6261477, 0.447437, -0.7253168, 0, 0, 0, 1, 1,
-0.6247859, 1.66152, -0.6694085, 0, 0, 0, 1, 1,
-0.6240857, 1.08154, -2.169728, 0, 0, 0, 1, 1,
-0.6235496, 0.408764, -2.049031, 0, 0, 0, 1, 1,
-0.6231483, 1.109797, 0.345683, 1, 1, 1, 1, 1,
-0.6103766, 2.58863, -0.3488848, 1, 1, 1, 1, 1,
-0.6099908, -1.02016, -3.368741, 1, 1, 1, 1, 1,
-0.6067659, 0.5073513, -2.044945, 1, 1, 1, 1, 1,
-0.6045501, 0.0616487, -2.54635, 1, 1, 1, 1, 1,
-0.5875249, -0.6622056, -1.983852, 1, 1, 1, 1, 1,
-0.5786786, 1.596568, 0.4147031, 1, 1, 1, 1, 1,
-0.5771316, -1.66983, -3.21362, 1, 1, 1, 1, 1,
-0.5699616, 0.07208552, 0.7543983, 1, 1, 1, 1, 1,
-0.5611832, -1.062568, -2.095722, 1, 1, 1, 1, 1,
-0.558131, -0.7196121, -4.284192, 1, 1, 1, 1, 1,
-0.557444, -1.204917, -3.659158, 1, 1, 1, 1, 1,
-0.5553851, 0.1932492, -0.7008993, 1, 1, 1, 1, 1,
-0.5528145, -2.049016, -3.335154, 1, 1, 1, 1, 1,
-0.5505385, -1.051546, -2.855063, 1, 1, 1, 1, 1,
-0.5491323, -1.815964, -4.301075, 0, 0, 1, 1, 1,
-0.5477899, 0.6496504, -1.457163, 1, 0, 0, 1, 1,
-0.545477, 0.00210959, 0.4155932, 1, 0, 0, 1, 1,
-0.5431203, -0.4886508, -2.273583, 1, 0, 0, 1, 1,
-0.5425442, -0.6289914, -1.733826, 1, 0, 0, 1, 1,
-0.539292, 0.5078855, 0.09833182, 1, 0, 0, 1, 1,
-0.5339206, -0.5914568, -3.814864, 0, 0, 0, 1, 1,
-0.5308715, 1.645578, -1.333913, 0, 0, 0, 1, 1,
-0.53006, 0.3035778, -1.045614, 0, 0, 0, 1, 1,
-0.529959, -0.0235393, -1.260263, 0, 0, 0, 1, 1,
-0.5234756, -0.3431985, -1.469263, 0, 0, 0, 1, 1,
-0.5178138, 0.5286472, 0.5220696, 0, 0, 0, 1, 1,
-0.5149041, 0.5424827, 0.5259983, 0, 0, 0, 1, 1,
-0.5143937, -0.5275881, -2.314578, 1, 1, 1, 1, 1,
-0.5114468, 0.648491, 0.02637481, 1, 1, 1, 1, 1,
-0.5027986, -0.3476906, -1.608809, 1, 1, 1, 1, 1,
-0.5027432, 1.703182, -0.1393573, 1, 1, 1, 1, 1,
-0.499452, 0.2330669, -1.63131, 1, 1, 1, 1, 1,
-0.4968095, -0.3579767, -3.1547, 1, 1, 1, 1, 1,
-0.4939535, 1.707851, 0.436402, 1, 1, 1, 1, 1,
-0.4888458, -0.2843753, -2.669215, 1, 1, 1, 1, 1,
-0.4888256, 1.911358, -0.9181668, 1, 1, 1, 1, 1,
-0.488355, -0.6111001, -2.536777, 1, 1, 1, 1, 1,
-0.4808176, 1.607941, -0.6469249, 1, 1, 1, 1, 1,
-0.4793648, -0.8005309, -1.430785, 1, 1, 1, 1, 1,
-0.4788782, -1.33092, -2.759314, 1, 1, 1, 1, 1,
-0.4755004, 0.6029188, 0.7663999, 1, 1, 1, 1, 1,
-0.473827, -0.4409604, -1.531638, 1, 1, 1, 1, 1,
-0.4732375, 0.327917, -3.487574, 0, 0, 1, 1, 1,
-0.4712881, 0.4086376, -1.516063, 1, 0, 0, 1, 1,
-0.4696544, -1.363541, -1.462966, 1, 0, 0, 1, 1,
-0.4633143, -0.6487151, -1.157054, 1, 0, 0, 1, 1,
-0.4543389, 0.3331499, -1.945903, 1, 0, 0, 1, 1,
-0.4523338, 0.4588054, 0.4437164, 1, 0, 0, 1, 1,
-0.4380952, 1.011038, 0.6136338, 0, 0, 0, 1, 1,
-0.4375851, -1.070845, -3.043063, 0, 0, 0, 1, 1,
-0.4362284, -1.690502, -2.7533, 0, 0, 0, 1, 1,
-0.4314241, 0.775771, 1.601434, 0, 0, 0, 1, 1,
-0.4301505, 0.6350862, -0.307954, 0, 0, 0, 1, 1,
-0.4260011, -0.3263457, -2.040445, 0, 0, 0, 1, 1,
-0.4242375, -0.74672, -2.019061, 0, 0, 0, 1, 1,
-0.4224086, -1.559948, -3.633296, 1, 1, 1, 1, 1,
-0.4143093, 0.4585408, -0.4105531, 1, 1, 1, 1, 1,
-0.4141616, 1.286742, -1.692587, 1, 1, 1, 1, 1,
-0.414103, 1.078933, -1.208658, 1, 1, 1, 1, 1,
-0.4138021, 1.441182, 0.613319, 1, 1, 1, 1, 1,
-0.4133079, -0.6862964, -2.803082, 1, 1, 1, 1, 1,
-0.4064261, 1.724322, 0.1200584, 1, 1, 1, 1, 1,
-0.4047098, -1.049887, -1.176306, 1, 1, 1, 1, 1,
-0.4009155, 2.996107, -1.069174, 1, 1, 1, 1, 1,
-0.4003095, -0.006051988, -2.189881, 1, 1, 1, 1, 1,
-0.3981889, -0.6461499, -2.699355, 1, 1, 1, 1, 1,
-0.3955898, -0.8551695, -3.77522, 1, 1, 1, 1, 1,
-0.3916963, -1.457392, -4.314295, 1, 1, 1, 1, 1,
-0.3913271, 0.7057851, -0.9308689, 1, 1, 1, 1, 1,
-0.3798128, -1.931618, -3.481325, 1, 1, 1, 1, 1,
-0.3661741, -0.2899569, -2.439405, 0, 0, 1, 1, 1,
-0.3655621, -0.3533315, -2.372028, 1, 0, 0, 1, 1,
-0.3644347, 0.9049008, -0.6613772, 1, 0, 0, 1, 1,
-0.3572066, -0.9490325, -3.339354, 1, 0, 0, 1, 1,
-0.3553357, 1.200521, -0.6971152, 1, 0, 0, 1, 1,
-0.3539317, -0.7216036, -2.876421, 1, 0, 0, 1, 1,
-0.3537157, 0.5757307, -1.304968, 0, 0, 0, 1, 1,
-0.3516046, 1.805272, -0.5103189, 0, 0, 0, 1, 1,
-0.3512349, 0.03472174, -1.007383, 0, 0, 0, 1, 1,
-0.3500243, -0.9758073, -4.054073, 0, 0, 0, 1, 1,
-0.3480743, -0.2809047, -2.119176, 0, 0, 0, 1, 1,
-0.3479427, -0.58215, -2.777771, 0, 0, 0, 1, 1,
-0.3467301, 0.1016594, -2.518231, 0, 0, 0, 1, 1,
-0.334454, 0.2854902, 0.7540447, 1, 1, 1, 1, 1,
-0.3340903, -2.270546, -2.974531, 1, 1, 1, 1, 1,
-0.3308692, 1.231029, 0.3659912, 1, 1, 1, 1, 1,
-0.3294103, 0.9797047, -0.7941451, 1, 1, 1, 1, 1,
-0.3269103, 3.032038, -2.328357, 1, 1, 1, 1, 1,
-0.3253381, -1.461185, -3.138137, 1, 1, 1, 1, 1,
-0.3252459, 0.8070386, -0.6383399, 1, 1, 1, 1, 1,
-0.3247328, 0.5453447, -0.5592986, 1, 1, 1, 1, 1,
-0.3213086, 1.164842, 0.2746797, 1, 1, 1, 1, 1,
-0.3178808, -1.226849, -0.7078971, 1, 1, 1, 1, 1,
-0.3169066, 1.630997, -1.219421, 1, 1, 1, 1, 1,
-0.3153644, 1.401251, 1.394939, 1, 1, 1, 1, 1,
-0.3148109, 1.159489, -0.7233129, 1, 1, 1, 1, 1,
-0.309434, -0.32954, -3.089705, 1, 1, 1, 1, 1,
-0.308952, -0.4313096, -1.361837, 1, 1, 1, 1, 1,
-0.3050256, 0.1113033, 0.1016775, 0, 0, 1, 1, 1,
-0.3041451, 1.309108, -1.493371, 1, 0, 0, 1, 1,
-0.3038017, 2.121185, -1.85606, 1, 0, 0, 1, 1,
-0.3036327, -0.8120595, -2.659915, 1, 0, 0, 1, 1,
-0.3026114, 0.3966757, -0.2741363, 1, 0, 0, 1, 1,
-0.2976272, 0.4755504, -0.1611744, 1, 0, 0, 1, 1,
-0.2897012, -2.010566, -4.982574, 0, 0, 0, 1, 1,
-0.2855896, 0.5072813, 0.5734537, 0, 0, 0, 1, 1,
-0.2836421, 0.1952973, -0.8191393, 0, 0, 0, 1, 1,
-0.2815694, 1.895242, -0.752929, 0, 0, 0, 1, 1,
-0.2746782, -0.4111162, -1.086807, 0, 0, 0, 1, 1,
-0.2728685, -2.242948, -2.490952, 0, 0, 0, 1, 1,
-0.2709593, 0.932698, -1.610784, 0, 0, 0, 1, 1,
-0.2688865, -1.884399, -3.774191, 1, 1, 1, 1, 1,
-0.2662186, -0.4000352, -2.067712, 1, 1, 1, 1, 1,
-0.2639946, 0.677588, -0.289466, 1, 1, 1, 1, 1,
-0.2609809, 1.679985, 0.2611639, 1, 1, 1, 1, 1,
-0.2604718, 0.7732779, -0.055411, 1, 1, 1, 1, 1,
-0.2599735, 1.256057, 0.003391974, 1, 1, 1, 1, 1,
-0.2593509, 1.468966, -0.4197331, 1, 1, 1, 1, 1,
-0.2591216, -0.60812, -4.013758, 1, 1, 1, 1, 1,
-0.2522746, -1.615506, -3.773229, 1, 1, 1, 1, 1,
-0.246283, 1.179164, -1.011167, 1, 1, 1, 1, 1,
-0.2455371, -1.004296, -3.42135, 1, 1, 1, 1, 1,
-0.2400265, -2.766239, -3.689974, 1, 1, 1, 1, 1,
-0.2388549, 0.3905088, -0.1895093, 1, 1, 1, 1, 1,
-0.2347146, -0.05773373, -2.462891, 1, 1, 1, 1, 1,
-0.2334158, -0.6010113, -3.229753, 1, 1, 1, 1, 1,
-0.2296385, -1.104518, -2.240684, 0, 0, 1, 1, 1,
-0.2275111, -1.259945, -5.4894, 1, 0, 0, 1, 1,
-0.2247606, 0.3479878, 0.1735244, 1, 0, 0, 1, 1,
-0.2230664, -2.102124, -2.994604, 1, 0, 0, 1, 1,
-0.2227482, 1.370768, -0.3656455, 1, 0, 0, 1, 1,
-0.218441, 1.30845, 1.580953, 1, 0, 0, 1, 1,
-0.2137665, -0.004631434, -1.439276, 0, 0, 0, 1, 1,
-0.2058516, 0.2501041, -1.067387, 0, 0, 0, 1, 1,
-0.2047803, 0.2325459, -1.302867, 0, 0, 0, 1, 1,
-0.2023808, -1.174493, -4.146905, 0, 0, 0, 1, 1,
-0.2017581, -0.9259266, -2.444518, 0, 0, 0, 1, 1,
-0.1976984, -1.252743, -1.802117, 0, 0, 0, 1, 1,
-0.1949972, 0.2057049, -0.4309803, 0, 0, 0, 1, 1,
-0.1937476, 0.7639897, -0.7224641, 1, 1, 1, 1, 1,
-0.1844177, -0.9972907, -2.04667, 1, 1, 1, 1, 1,
-0.1825659, 0.5063874, 0.6202291, 1, 1, 1, 1, 1,
-0.1820073, 1.453906, -0.6570076, 1, 1, 1, 1, 1,
-0.1812274, 1.649158, 2.202315, 1, 1, 1, 1, 1,
-0.1809551, 1.595997, -1.349088, 1, 1, 1, 1, 1,
-0.180909, -0.7654617, -4.767018, 1, 1, 1, 1, 1,
-0.1807059, 0.5296297, -0.03752226, 1, 1, 1, 1, 1,
-0.1784256, -0.4581775, -3.008143, 1, 1, 1, 1, 1,
-0.1782376, -1.432971, -4.18517, 1, 1, 1, 1, 1,
-0.1686545, -0.2413943, -1.033793, 1, 1, 1, 1, 1,
-0.1670569, 0.4895051, 0.02174442, 1, 1, 1, 1, 1,
-0.1642367, 1.235151, -0.001804393, 1, 1, 1, 1, 1,
-0.1642204, 1.771372, -1.200384, 1, 1, 1, 1, 1,
-0.1640427, -0.8164409, -2.676908, 1, 1, 1, 1, 1,
-0.1597368, 1.060826, -0.413951, 0, 0, 1, 1, 1,
-0.1585512, -0.1671561, -3.909277, 1, 0, 0, 1, 1,
-0.1572131, 1.859337, 0.03978623, 1, 0, 0, 1, 1,
-0.1558247, 0.3898992, -2.104867, 1, 0, 0, 1, 1,
-0.1541612, -0.4524308, -3.186733, 1, 0, 0, 1, 1,
-0.1524132, 0.7267252, -0.871612, 1, 0, 0, 1, 1,
-0.15071, 0.01240496, -2.189471, 0, 0, 0, 1, 1,
-0.1500329, -0.3723058, -1.616112, 0, 0, 0, 1, 1,
-0.1495718, -0.1518678, -1.38019, 0, 0, 0, 1, 1,
-0.1441955, -1.020242, -2.355651, 0, 0, 0, 1, 1,
-0.1439921, -0.2564698, -3.462297, 0, 0, 0, 1, 1,
-0.1396427, -0.001089942, -1.528215, 0, 0, 0, 1, 1,
-0.1372258, -0.9767666, -5.040713, 0, 0, 0, 1, 1,
-0.1329119, -0.9121404, -2.968029, 1, 1, 1, 1, 1,
-0.1283792, -2.072664, -3.707179, 1, 1, 1, 1, 1,
-0.1282851, 1.181085, 1.022903, 1, 1, 1, 1, 1,
-0.1245138, 0.2558956, -0.8282512, 1, 1, 1, 1, 1,
-0.1229441, 0.6402749, -1.208552, 1, 1, 1, 1, 1,
-0.1203325, 0.7176508, 0.04567341, 1, 1, 1, 1, 1,
-0.1198554, -0.6744236, -3.299428, 1, 1, 1, 1, 1,
-0.1171633, 0.8837114, -1.796923, 1, 1, 1, 1, 1,
-0.1146858, -0.2251376, -1.225268, 1, 1, 1, 1, 1,
-0.1073815, -0.8433515, -1.824928, 1, 1, 1, 1, 1,
-0.1072501, 0.5361336, -0.3361769, 1, 1, 1, 1, 1,
-0.09950533, 1.346207, -0.5910791, 1, 1, 1, 1, 1,
-0.09790672, -0.3811005, -2.789359, 1, 1, 1, 1, 1,
-0.09631997, 1.066142, 0.7412991, 1, 1, 1, 1, 1,
-0.0962829, -0.7280226, -1.834269, 1, 1, 1, 1, 1,
-0.094436, 0.345442, -1.178573, 0, 0, 1, 1, 1,
-0.09316217, 0.3413987, 0.1893806, 1, 0, 0, 1, 1,
-0.09243908, 2.566116, -0.2729446, 1, 0, 0, 1, 1,
-0.09158451, -1.123218, -1.829104, 1, 0, 0, 1, 1,
-0.09063754, -0.2677806, -3.264262, 1, 0, 0, 1, 1,
-0.08970714, 1.056015, 0.4015861, 1, 0, 0, 1, 1,
-0.08863403, 1.731424, 0.9235377, 0, 0, 0, 1, 1,
-0.08857515, 0.3436724, -0.3025395, 0, 0, 0, 1, 1,
-0.08842079, 0.9801964, -0.09374914, 0, 0, 0, 1, 1,
-0.08712837, -1.05454, -3.441382, 0, 0, 0, 1, 1,
-0.08603495, -0.01393586, -3.471448, 0, 0, 0, 1, 1,
-0.08408494, 0.5775805, 0.4520131, 0, 0, 0, 1, 1,
-0.08399601, -0.4468904, -4.30227, 0, 0, 0, 1, 1,
-0.08142456, 0.4797039, 0.8021814, 1, 1, 1, 1, 1,
-0.0779696, -0.2919855, -3.066792, 1, 1, 1, 1, 1,
-0.07655651, -1.266505, -3.795486, 1, 1, 1, 1, 1,
-0.07560706, 0.5656613, -2.632579, 1, 1, 1, 1, 1,
-0.07051819, -0.5653998, -2.439516, 1, 1, 1, 1, 1,
-0.06646055, 0.4155344, 1.677533, 1, 1, 1, 1, 1,
-0.06353308, -0.373616, -3.560131, 1, 1, 1, 1, 1,
-0.05742473, -0.2604516, -3.694327, 1, 1, 1, 1, 1,
-0.05121886, 0.05535983, -0.987711, 1, 1, 1, 1, 1,
-0.05101233, -1.090846, -3.267198, 1, 1, 1, 1, 1,
-0.05047496, 0.6463275, 1.324717, 1, 1, 1, 1, 1,
-0.04767892, -0.3738147, -1.316315, 1, 1, 1, 1, 1,
-0.04723314, 0.2095654, 0.1567231, 1, 1, 1, 1, 1,
-0.04715013, -0.323291, -2.341314, 1, 1, 1, 1, 1,
-0.04573485, -0.3967805, -3.212999, 1, 1, 1, 1, 1,
-0.03802449, 0.444726, 1.268808, 0, 0, 1, 1, 1,
-0.03323701, 0.7766336, 0.4434834, 1, 0, 0, 1, 1,
-0.02753096, -1.335659, -4.068724, 1, 0, 0, 1, 1,
-0.02703281, -1.68989, -4.188642, 1, 0, 0, 1, 1,
-0.0197638, 0.6157989, 0.2333023, 1, 0, 0, 1, 1,
-0.01507447, -0.6566501, -3.302855, 1, 0, 0, 1, 1,
-0.01460276, 0.6327739, 0.2025675, 0, 0, 0, 1, 1,
-0.01321269, 0.08974816, 0.3692786, 0, 0, 0, 1, 1,
-0.01061987, 0.1953743, -0.2013829, 0, 0, 0, 1, 1,
-0.01034991, -0.52952, -1.724174, 0, 0, 0, 1, 1,
-0.006136163, -0.09347408, -2.101771, 0, 0, 0, 1, 1,
-0.004656028, 0.02600636, -1.38949, 0, 0, 0, 1, 1,
0.0003608799, 0.1586775, 0.6714742, 0, 0, 0, 1, 1,
0.001461569, -0.7024941, 2.269249, 1, 1, 1, 1, 1,
0.00457006, -2.110599, 3.990087, 1, 1, 1, 1, 1,
0.004727971, -0.5687026, 5.064091, 1, 1, 1, 1, 1,
0.007798209, -0.7020203, 2.024388, 1, 1, 1, 1, 1,
0.008733396, 0.4514748, -1.442752, 1, 1, 1, 1, 1,
0.01048613, -0.615461, 2.918382, 1, 1, 1, 1, 1,
0.01149375, 0.5003948, -2.104598, 1, 1, 1, 1, 1,
0.01657123, 0.05715027, -0.3165649, 1, 1, 1, 1, 1,
0.01787383, 0.7057778, 2.074445, 1, 1, 1, 1, 1,
0.01834083, 0.05254185, -0.03915989, 1, 1, 1, 1, 1,
0.01908194, 0.8939717, 0.7147418, 1, 1, 1, 1, 1,
0.01940397, 1.526509, -1.187935, 1, 1, 1, 1, 1,
0.02104013, -0.4227467, 2.979264, 1, 1, 1, 1, 1,
0.02113536, 0.4876961, 0.8787313, 1, 1, 1, 1, 1,
0.02404624, 0.1800212, -1.47448, 1, 1, 1, 1, 1,
0.02471536, -0.1095673, 3.742436, 0, 0, 1, 1, 1,
0.02653049, 2.208275, -0.1124925, 1, 0, 0, 1, 1,
0.03080658, -0.2931272, 2.906113, 1, 0, 0, 1, 1,
0.0318898, 0.001358684, 1.624185, 1, 0, 0, 1, 1,
0.03291382, -0.942248, 2.769214, 1, 0, 0, 1, 1,
0.03628178, 1.159356, -1.217505, 1, 0, 0, 1, 1,
0.04321747, 0.2046446, 0.4714513, 0, 0, 0, 1, 1,
0.0433794, 0.5566127, -0.5419572, 0, 0, 0, 1, 1,
0.05566403, 0.2589146, -0.2814947, 0, 0, 0, 1, 1,
0.05859342, 0.04959172, 1.725192, 0, 0, 0, 1, 1,
0.06075043, -0.2257203, 3.487134, 0, 0, 0, 1, 1,
0.06343099, -0.0470392, 0.8201688, 0, 0, 0, 1, 1,
0.06872254, -1.699771, 3.783948, 0, 0, 0, 1, 1,
0.07292935, 0.7122117, -1.050812, 1, 1, 1, 1, 1,
0.08654761, -0.2431285, 2.35221, 1, 1, 1, 1, 1,
0.09018365, -0.2454332, 3.059712, 1, 1, 1, 1, 1,
0.09382793, -1.122815, 2.684564, 1, 1, 1, 1, 1,
0.09613071, -0.9540803, 2.53372, 1, 1, 1, 1, 1,
0.09680479, 0.5244364, 0.5977862, 1, 1, 1, 1, 1,
0.09957583, 1.372809, 0.4626679, 1, 1, 1, 1, 1,
0.1014401, -2.15697, 3.585261, 1, 1, 1, 1, 1,
0.1029686, -2.234431, 2.821384, 1, 1, 1, 1, 1,
0.1056903, -1.054901, 2.140331, 1, 1, 1, 1, 1,
0.1075049, -0.1276204, 2.032494, 1, 1, 1, 1, 1,
0.1098446, -1.163823, 2.736325, 1, 1, 1, 1, 1,
0.115397, 0.2614591, 0.3375759, 1, 1, 1, 1, 1,
0.1238273, -0.737009, 1.309639, 1, 1, 1, 1, 1,
0.1295856, -1.333503, 3.067386, 1, 1, 1, 1, 1,
0.1304793, 0.5633026, -1.465698, 0, 0, 1, 1, 1,
0.1322781, 0.69763, 0.3082125, 1, 0, 0, 1, 1,
0.1411202, 1.10412, 0.151115, 1, 0, 0, 1, 1,
0.1482535, 0.2665134, 0.760506, 1, 0, 0, 1, 1,
0.1486426, 0.02006446, 1.427839, 1, 0, 0, 1, 1,
0.1493421, -1.11093, 3.736932, 1, 0, 0, 1, 1,
0.1521669, -0.4269932, 2.677613, 0, 0, 0, 1, 1,
0.1521966, -0.9101455, 1.924259, 0, 0, 0, 1, 1,
0.1634357, -2.220966, 5.323336, 0, 0, 0, 1, 1,
0.16728, 0.5841282, -1.652697, 0, 0, 0, 1, 1,
0.1689722, 0.06596293, 0.7740595, 0, 0, 0, 1, 1,
0.1699125, -0.271167, 2.759862, 0, 0, 0, 1, 1,
0.1704285, 0.7141255, 1.978118, 0, 0, 0, 1, 1,
0.1814844, -1.698607, 2.312976, 1, 1, 1, 1, 1,
0.1852975, -0.7737824, 4.426711, 1, 1, 1, 1, 1,
0.1855191, 1.187824, -0.08017395, 1, 1, 1, 1, 1,
0.1895937, 0.7690744, 0.2960107, 1, 1, 1, 1, 1,
0.190206, 0.3699763, 0.1967882, 1, 1, 1, 1, 1,
0.191287, -0.3676094, 3.461968, 1, 1, 1, 1, 1,
0.1928148, 0.775387, -0.7840924, 1, 1, 1, 1, 1,
0.193597, 0.08328298, -0.09693007, 1, 1, 1, 1, 1,
0.1969502, 0.9067521, -1.973599, 1, 1, 1, 1, 1,
0.1977213, 0.8277623, 1.908033, 1, 1, 1, 1, 1,
0.1987541, -0.8991673, 3.225782, 1, 1, 1, 1, 1,
0.2025105, -0.09607957, 3.344942, 1, 1, 1, 1, 1,
0.203268, -1.314353, 1.557471, 1, 1, 1, 1, 1,
0.2041119, 1.325068, 0.8720713, 1, 1, 1, 1, 1,
0.2061618, 0.5099677, 0.4082775, 1, 1, 1, 1, 1,
0.2071964, 0.1675765, -2.507118, 0, 0, 1, 1, 1,
0.2084008, -0.8059434, 3.996478, 1, 0, 0, 1, 1,
0.2114897, -0.1078139, 1.13879, 1, 0, 0, 1, 1,
0.212132, -1.103716, 2.425489, 1, 0, 0, 1, 1,
0.2133179, -0.2089163, 2.304078, 1, 0, 0, 1, 1,
0.216911, 0.4655466, 0.134424, 1, 0, 0, 1, 1,
0.2170306, 1.314915, 1.5722, 0, 0, 0, 1, 1,
0.2191436, 0.002348297, 2.69328, 0, 0, 0, 1, 1,
0.2195406, 0.3858159, 0.3167676, 0, 0, 0, 1, 1,
0.2202639, 1.549073, 1.127514, 0, 0, 0, 1, 1,
0.2217039, 0.1322533, 0.5702953, 0, 0, 0, 1, 1,
0.2257589, -0.7114892, 1.196942, 0, 0, 0, 1, 1,
0.2281088, 0.3935071, 1.039912, 0, 0, 0, 1, 1,
0.2308625, -1.350793, 2.521292, 1, 1, 1, 1, 1,
0.2310429, 0.7880644, -0.8006387, 1, 1, 1, 1, 1,
0.2335463, 0.8275132, 1.61855, 1, 1, 1, 1, 1,
0.2337817, -0.1583246, 1.335232, 1, 1, 1, 1, 1,
0.2388885, -0.1471951, 2.4459, 1, 1, 1, 1, 1,
0.2398601, 1.095994, 0.1809674, 1, 1, 1, 1, 1,
0.2399823, 0.3819284, 0.5435685, 1, 1, 1, 1, 1,
0.2467704, -0.1618664, 1.250364, 1, 1, 1, 1, 1,
0.248214, -0.05527361, 1.481318, 1, 1, 1, 1, 1,
0.2501526, 0.4147472, -1.641897, 1, 1, 1, 1, 1,
0.2507765, -0.728016, 0.3680193, 1, 1, 1, 1, 1,
0.2515369, -0.464145, 1.645459, 1, 1, 1, 1, 1,
0.252614, -1.120224, 2.463493, 1, 1, 1, 1, 1,
0.2531383, 1.154847, 0.2064745, 1, 1, 1, 1, 1,
0.25342, 0.2623895, 2.009412, 1, 1, 1, 1, 1,
0.2542016, 0.361969, 0.9110273, 0, 0, 1, 1, 1,
0.2579908, -0.3119652, 1.279032, 1, 0, 0, 1, 1,
0.2653084, 1.057293, 1.642985, 1, 0, 0, 1, 1,
0.2710883, -0.05053509, 2.908273, 1, 0, 0, 1, 1,
0.2725995, 1.821499, 0.833232, 1, 0, 0, 1, 1,
0.2729267, 0.6105059, -2.603141, 1, 0, 0, 1, 1,
0.2741053, 0.509658, 1.64903, 0, 0, 0, 1, 1,
0.2778786, -0.8144408, 1.250039, 0, 0, 0, 1, 1,
0.282928, -1.012061, 3.793995, 0, 0, 0, 1, 1,
0.2885903, -0.8363669, 2.208726, 0, 0, 0, 1, 1,
0.290727, 0.376635, 0.1366808, 0, 0, 0, 1, 1,
0.2926968, 0.419295, 0.6043772, 0, 0, 0, 1, 1,
0.2929552, -0.9350129, 3.900821, 0, 0, 0, 1, 1,
0.2944204, -0.03266083, 1.295797, 1, 1, 1, 1, 1,
0.2945335, 0.6844277, 2.186884, 1, 1, 1, 1, 1,
0.2958924, 0.2190143, 3.254714, 1, 1, 1, 1, 1,
0.3017846, 0.8220434, -1.305558, 1, 1, 1, 1, 1,
0.3048182, 2.455684, 0.4281139, 1, 1, 1, 1, 1,
0.3061045, 0.4324588, -0.7711625, 1, 1, 1, 1, 1,
0.3081856, -0.481188, 0.824627, 1, 1, 1, 1, 1,
0.3090251, 0.006997822, 0.6105713, 1, 1, 1, 1, 1,
0.310958, -1.501975, 2.510313, 1, 1, 1, 1, 1,
0.3114581, -0.8346777, 3.07786, 1, 1, 1, 1, 1,
0.3125306, 0.3496987, 1.114384, 1, 1, 1, 1, 1,
0.3128773, -0.2868851, 2.25002, 1, 1, 1, 1, 1,
0.3137477, 0.02296293, 1.284608, 1, 1, 1, 1, 1,
0.3201197, 0.2512559, 0.5652408, 1, 1, 1, 1, 1,
0.3257649, -0.1257994, 1.290783, 1, 1, 1, 1, 1,
0.3267971, 0.006235296, 2.257174, 0, 0, 1, 1, 1,
0.3298742, 1.192546, 1.404181, 1, 0, 0, 1, 1,
0.3308484, -0.3381148, 2.024314, 1, 0, 0, 1, 1,
0.3361835, -0.9036353, 2.285321, 1, 0, 0, 1, 1,
0.3369573, 0.7532042, 2.050861, 1, 0, 0, 1, 1,
0.3378414, -1.798406, 1.217215, 1, 0, 0, 1, 1,
0.3389218, -0.6746262, 2.337071, 0, 0, 0, 1, 1,
0.3427199, 1.12661, 0.3631064, 0, 0, 0, 1, 1,
0.3450888, -1.950588, 5.129755, 0, 0, 0, 1, 1,
0.3453352, -0.1459731, 2.474263, 0, 0, 0, 1, 1,
0.346008, -0.5670704, 2.917767, 0, 0, 0, 1, 1,
0.3560788, 0.4630236, -0.1211528, 0, 0, 0, 1, 1,
0.3576861, -0.05284373, 1.247454, 0, 0, 0, 1, 1,
0.3578046, 0.7205138, 3.285019, 1, 1, 1, 1, 1,
0.3658803, -0.138447, 0.2699087, 1, 1, 1, 1, 1,
0.3689254, 0.2544773, 0.3086585, 1, 1, 1, 1, 1,
0.3699981, -0.4479255, 3.71128, 1, 1, 1, 1, 1,
0.3701019, 0.8778931, 0.2505193, 1, 1, 1, 1, 1,
0.3715163, -0.2188849, 2.312338, 1, 1, 1, 1, 1,
0.3723348, -1.41922, 3.204606, 1, 1, 1, 1, 1,
0.3737353, -1.063118, 2.250023, 1, 1, 1, 1, 1,
0.3737393, -2.150876, 1.699861, 1, 1, 1, 1, 1,
0.376186, -1.795597, 2.839966, 1, 1, 1, 1, 1,
0.3785631, 1.417173, 0.1982001, 1, 1, 1, 1, 1,
0.3834315, 0.7556102, 1.751839, 1, 1, 1, 1, 1,
0.3851283, 0.04592045, 4.159215, 1, 1, 1, 1, 1,
0.387121, 1.084534, 0.1328542, 1, 1, 1, 1, 1,
0.3871377, 0.1038642, 0.9986151, 1, 1, 1, 1, 1,
0.387932, -0.9313377, 0.6498848, 0, 0, 1, 1, 1,
0.3895812, -0.1125549, 0.8197616, 1, 0, 0, 1, 1,
0.3906042, -0.9573581, 1.609479, 1, 0, 0, 1, 1,
0.3940012, -0.2236539, 4.36643, 1, 0, 0, 1, 1,
0.3958211, -0.1924268, 0.9158813, 1, 0, 0, 1, 1,
0.3988537, 0.1916805, 0.4228513, 1, 0, 0, 1, 1,
0.4010039, 0.8081697, 0.2858962, 0, 0, 0, 1, 1,
0.4015075, 1.316936, -0.4826531, 0, 0, 0, 1, 1,
0.4055521, -1.685082, 4.788028, 0, 0, 0, 1, 1,
0.409273, 0.3266961, -0.3114862, 0, 0, 0, 1, 1,
0.4098483, -2.618673, 4.592203, 0, 0, 0, 1, 1,
0.4183455, -1.069656, 2.271335, 0, 0, 0, 1, 1,
0.4197548, -0.3232524, 2.383391, 0, 0, 0, 1, 1,
0.4213138, 0.6000947, 1.179878, 1, 1, 1, 1, 1,
0.4318575, -0.6911062, 1.172255, 1, 1, 1, 1, 1,
0.431953, -2.24236, 0.7883386, 1, 1, 1, 1, 1,
0.4416966, 0.142465, 2.163111, 1, 1, 1, 1, 1,
0.4419848, 1.290921, -0.08611849, 1, 1, 1, 1, 1,
0.4439005, 0.8780147, -2.029985, 1, 1, 1, 1, 1,
0.4443748, 0.7451122, -1.416024, 1, 1, 1, 1, 1,
0.4477167, -2.324999, 3.896402, 1, 1, 1, 1, 1,
0.449222, -0.1787629, 1.647552, 1, 1, 1, 1, 1,
0.4540478, 0.8076798, -2.387645, 1, 1, 1, 1, 1,
0.4577637, -1.441063, 3.687551, 1, 1, 1, 1, 1,
0.4581094, 0.1862372, -0.3769566, 1, 1, 1, 1, 1,
0.4626014, 1.426294, -1.457051, 1, 1, 1, 1, 1,
0.4648595, 0.5507336, 0.2458749, 1, 1, 1, 1, 1,
0.468022, -0.3726714, 2.103901, 1, 1, 1, 1, 1,
0.4698263, -0.5452251, 3.5645, 0, 0, 1, 1, 1,
0.4746709, 0.3531409, -0.6577506, 1, 0, 0, 1, 1,
0.4770434, 0.9117463, 0.5917332, 1, 0, 0, 1, 1,
0.4863286, 1.455959, 0.5547519, 1, 0, 0, 1, 1,
0.4875443, 0.5072142, 0.01146779, 1, 0, 0, 1, 1,
0.4909513, 0.8175251, 0.08308688, 1, 0, 0, 1, 1,
0.4910887, 0.6085766, 0.611509, 0, 0, 0, 1, 1,
0.4912713, -0.05267574, 0.533582, 0, 0, 0, 1, 1,
0.493868, -0.3817933, 1.612287, 0, 0, 0, 1, 1,
0.494229, 1.089474, -0.7869102, 0, 0, 0, 1, 1,
0.4972151, 1.428091, 0.7512119, 0, 0, 0, 1, 1,
0.5020228, 0.7143063, 0.929861, 0, 0, 0, 1, 1,
0.5097356, -0.1888818, 3.810474, 0, 0, 0, 1, 1,
0.512085, 1.09715, -0.2937162, 1, 1, 1, 1, 1,
0.518125, -0.5939708, 2.633878, 1, 1, 1, 1, 1,
0.5186415, 0.390844, 1.789218, 1, 1, 1, 1, 1,
0.5275469, -0.992649, 4.991885, 1, 1, 1, 1, 1,
0.5278125, -2.171466, 2.289806, 1, 1, 1, 1, 1,
0.5298752, 0.7197815, 2.007253, 1, 1, 1, 1, 1,
0.5320497, -0.592119, 4.052502, 1, 1, 1, 1, 1,
0.5384219, -1.887835, 2.802853, 1, 1, 1, 1, 1,
0.5412122, 0.8457227, 2.194942, 1, 1, 1, 1, 1,
0.5413502, 0.7380651, 1.220394, 1, 1, 1, 1, 1,
0.5451503, -0.2112418, 2.753241, 1, 1, 1, 1, 1,
0.5483769, -0.9671599, 4.092582, 1, 1, 1, 1, 1,
0.5519036, 0.3191965, 2.263906, 1, 1, 1, 1, 1,
0.5542989, -0.4198324, 1.416453, 1, 1, 1, 1, 1,
0.5550103, 0.7036616, 2.274691, 1, 1, 1, 1, 1,
0.5561889, 0.8070405, 1.903132, 0, 0, 1, 1, 1,
0.5567943, 0.5642454, -0.1827142, 1, 0, 0, 1, 1,
0.5577835, -1.55792, 4.074312, 1, 0, 0, 1, 1,
0.5591815, -0.8976099, 2.059748, 1, 0, 0, 1, 1,
0.5600784, 0.4725677, 2.100164, 1, 0, 0, 1, 1,
0.5617412, 0.2457307, 1.036042, 1, 0, 0, 1, 1,
0.5645818, -0.5305476, 2.570436, 0, 0, 0, 1, 1,
0.5654613, -2.078299, 2.903494, 0, 0, 0, 1, 1,
0.5667583, 1.168235, 0.1029876, 0, 0, 0, 1, 1,
0.5680368, -0.01994269, 2.068246, 0, 0, 0, 1, 1,
0.5697902, 0.7604128, 0.8838092, 0, 0, 0, 1, 1,
0.5708243, 0.7568076, 1.329496, 0, 0, 0, 1, 1,
0.5733325, 0.5740482, 1.249102, 0, 0, 0, 1, 1,
0.5756072, 0.0572369, 0.3963826, 1, 1, 1, 1, 1,
0.5811144, 0.9881763, 0.2243891, 1, 1, 1, 1, 1,
0.5885821, -1.29908, 1.379576, 1, 1, 1, 1, 1,
0.5999668, 0.571255, 0.1916972, 1, 1, 1, 1, 1,
0.6027701, -1.22593, 2.229099, 1, 1, 1, 1, 1,
0.604323, -0.6781548, 3.405699, 1, 1, 1, 1, 1,
0.6081744, -0.5649123, 1.048697, 1, 1, 1, 1, 1,
0.6129391, -0.2310911, 1.462824, 1, 1, 1, 1, 1,
0.6146288, -0.6068912, 4.054267, 1, 1, 1, 1, 1,
0.6176046, 0.539092, 2.118263, 1, 1, 1, 1, 1,
0.6176252, -0.1774181, 0.1460999, 1, 1, 1, 1, 1,
0.6201357, -1.738663, 2.253968, 1, 1, 1, 1, 1,
0.6236166, 1.204437, 0.03219992, 1, 1, 1, 1, 1,
0.6239418, -0.06731681, 0.3426858, 1, 1, 1, 1, 1,
0.625078, 1.529636, 0.5551277, 1, 1, 1, 1, 1,
0.6277323, 1.182739, 0.2482204, 0, 0, 1, 1, 1,
0.6293748, -1.779085, 1.844214, 1, 0, 0, 1, 1,
0.6353461, -0.06943524, 1.273532, 1, 0, 0, 1, 1,
0.6356835, -0.7254268, 1.589785, 1, 0, 0, 1, 1,
0.6357536, -1.192276, 2.421886, 1, 0, 0, 1, 1,
0.6365208, -0.06246721, 2.535848, 1, 0, 0, 1, 1,
0.6526929, -0.3930294, 3.174061, 0, 0, 0, 1, 1,
0.6533223, 0.7786373, 1.004862, 0, 0, 0, 1, 1,
0.6551353, -0.5829508, 1.804015, 0, 0, 0, 1, 1,
0.6576287, 0.3081635, 2.6174, 0, 0, 0, 1, 1,
0.6591499, 0.1177594, 1.586275, 0, 0, 0, 1, 1,
0.661225, -0.6997812, 3.771974, 0, 0, 0, 1, 1,
0.6612891, -0.2690797, 2.813078, 0, 0, 0, 1, 1,
0.6613163, 0.5554964, 0.2419908, 1, 1, 1, 1, 1,
0.6638631, -0.2104137, 1.474134, 1, 1, 1, 1, 1,
0.6655262, -0.05377319, 2.767252, 1, 1, 1, 1, 1,
0.6686655, 1.392718, 2.180358, 1, 1, 1, 1, 1,
0.6691313, 0.2192711, 0.3708056, 1, 1, 1, 1, 1,
0.6704924, 0.6652671, 1.457527, 1, 1, 1, 1, 1,
0.6873816, 1.093466, 0.08332026, 1, 1, 1, 1, 1,
0.6880449, -2.244351, 1.978953, 1, 1, 1, 1, 1,
0.6891519, 0.0732675, 1.875615, 1, 1, 1, 1, 1,
0.6928352, 0.5170215, 1.226109, 1, 1, 1, 1, 1,
0.6936315, -0.6739726, 3.190094, 1, 1, 1, 1, 1,
0.6938601, -1.986866, 2.365474, 1, 1, 1, 1, 1,
0.6955255, -1.069504, 3.238734, 1, 1, 1, 1, 1,
0.6979063, -0.5834561, 3.387337, 1, 1, 1, 1, 1,
0.697989, -0.5014787, 2.297375, 1, 1, 1, 1, 1,
0.7068975, -0.8022313, 1.996009, 0, 0, 1, 1, 1,
0.7084914, 1.52316, -0.2436008, 1, 0, 0, 1, 1,
0.7086599, 1.040725, -0.5475049, 1, 0, 0, 1, 1,
0.7100593, 0.104689, 2.016687, 1, 0, 0, 1, 1,
0.7114742, -0.8172899, 2.021707, 1, 0, 0, 1, 1,
0.7150705, -1.725553, 2.634461, 1, 0, 0, 1, 1,
0.7171132, -0.9036677, 2.019627, 0, 0, 0, 1, 1,
0.7241725, -0.6064895, 1.440596, 0, 0, 0, 1, 1,
0.7343587, 0.8641869, 0.4664754, 0, 0, 0, 1, 1,
0.7353194, -0.06492171, 2.378726, 0, 0, 0, 1, 1,
0.7354859, -0.5144446, 2.458086, 0, 0, 0, 1, 1,
0.7365815, 1.964899, 0.9242859, 0, 0, 0, 1, 1,
0.7373959, -0.209329, 2.623744, 0, 0, 0, 1, 1,
0.7377306, 0.1629179, -0.2381538, 1, 1, 1, 1, 1,
0.7399421, 0.1686645, 2.606461, 1, 1, 1, 1, 1,
0.7407814, -0.7479413, -0.0821232, 1, 1, 1, 1, 1,
0.7453666, 1.14233, 0.6158147, 1, 1, 1, 1, 1,
0.75438, 0.9603519, -1.293287, 1, 1, 1, 1, 1,
0.7564931, 0.6248166, -0.605649, 1, 1, 1, 1, 1,
0.756681, 0.1084523, 0.7847143, 1, 1, 1, 1, 1,
0.76026, -1.844429, 3.419157, 1, 1, 1, 1, 1,
0.7645434, -1.20961, 3.013704, 1, 1, 1, 1, 1,
0.7675299, 2.334193, 0.5735832, 1, 1, 1, 1, 1,
0.7711956, -0.2657719, 1.725783, 1, 1, 1, 1, 1,
0.7975437, -0.1373008, 2.710181, 1, 1, 1, 1, 1,
0.7989534, 1.936458, -1.130221, 1, 1, 1, 1, 1,
0.7995477, -0.4134315, 2.967071, 1, 1, 1, 1, 1,
0.8043369, -0.974411, 3.410926, 1, 1, 1, 1, 1,
0.8063651, 1.132735, -0.4277143, 0, 0, 1, 1, 1,
0.8084089, 0.4000328, 2.812596, 1, 0, 0, 1, 1,
0.8104953, -0.6204892, 1.196104, 1, 0, 0, 1, 1,
0.8247892, 1.684141, 0.2008089, 1, 0, 0, 1, 1,
0.829927, 0.8721527, 0.7755815, 1, 0, 0, 1, 1,
0.836263, 0.05225519, 1.388344, 1, 0, 0, 1, 1,
0.8410369, 0.1075466, -0.538158, 0, 0, 0, 1, 1,
0.8488501, 0.610229, 0.8287596, 0, 0, 0, 1, 1,
0.8513952, -0.6919971, 2.234763, 0, 0, 0, 1, 1,
0.8527964, 0.1996278, 1.576055, 0, 0, 0, 1, 1,
0.8562765, -0.6588392, 1.062473, 0, 0, 0, 1, 1,
0.8573281, -1.423213, 2.339812, 0, 0, 0, 1, 1,
0.8591949, -0.2328983, 1.716202, 0, 0, 0, 1, 1,
0.860157, 1.380031, 2.042158, 1, 1, 1, 1, 1,
0.8636016, 0.6637002, 0.1549445, 1, 1, 1, 1, 1,
0.866638, -1.438196, 2.540202, 1, 1, 1, 1, 1,
0.8687101, -1.585992, 1.995859, 1, 1, 1, 1, 1,
0.8717243, -0.9412479, 1.147233, 1, 1, 1, 1, 1,
0.8783447, -0.7428954, 2.692556, 1, 1, 1, 1, 1,
0.8809297, 0.3681919, 0.3231052, 1, 1, 1, 1, 1,
0.8816584, -0.8036749, 2.514433, 1, 1, 1, 1, 1,
0.8866978, -0.8263868, 3.71378, 1, 1, 1, 1, 1,
0.8881276, -0.7636297, 3.412196, 1, 1, 1, 1, 1,
0.8883519, -1.772318, 4.281276, 1, 1, 1, 1, 1,
0.8892242, 0.4954833, 3.46611, 1, 1, 1, 1, 1,
0.9002658, -1.007886, 0.3099734, 1, 1, 1, 1, 1,
0.9051347, -0.7816356, 2.887668, 1, 1, 1, 1, 1,
0.9066854, -0.6543152, 1.12691, 1, 1, 1, 1, 1,
0.9071661, -0.2105012, 1.472356, 0, 0, 1, 1, 1,
0.9078938, -0.2841472, 1.70638, 1, 0, 0, 1, 1,
0.9173059, -0.1946376, 1.849021, 1, 0, 0, 1, 1,
0.9183995, -0.5249676, 2.611944, 1, 0, 0, 1, 1,
0.9185739, 1.088456, 4.101657, 1, 0, 0, 1, 1,
0.9253958, -2.162945, 2.911297, 1, 0, 0, 1, 1,
0.9259624, 0.6219211, 1.407156, 0, 0, 0, 1, 1,
0.9289487, 0.4336886, 1.00748, 0, 0, 0, 1, 1,
0.9290615, 0.1299028, 1.541271, 0, 0, 0, 1, 1,
0.9337242, -0.7731006, 2.860217, 0, 0, 0, 1, 1,
0.9339963, 0.1080403, 1.160578, 0, 0, 0, 1, 1,
0.93438, -0.3904704, 1.862308, 0, 0, 0, 1, 1,
0.9351639, 0.317249, 0.3708354, 0, 0, 0, 1, 1,
0.9417417, -0.9866667, 1.924528, 1, 1, 1, 1, 1,
0.9421546, 0.1442966, 2.242019, 1, 1, 1, 1, 1,
0.9465387, -1.314092, 2.379262, 1, 1, 1, 1, 1,
0.9473205, 0.6302512, 1.510087, 1, 1, 1, 1, 1,
0.9658641, 0.637191, -1.064824, 1, 1, 1, 1, 1,
0.9694631, -0.1498668, 2.775806, 1, 1, 1, 1, 1,
0.9707522, -0.461407, 0.5039108, 1, 1, 1, 1, 1,
0.9725682, -0.5798842, 0.4611601, 1, 1, 1, 1, 1,
0.9855198, -1.759223, 1.93214, 1, 1, 1, 1, 1,
0.9941885, -1.294357, 2.982763, 1, 1, 1, 1, 1,
0.9983916, -0.5420167, 2.673311, 1, 1, 1, 1, 1,
0.9985915, 1.317384, 1.9901, 1, 1, 1, 1, 1,
0.9997256, 0.2594264, 1.134787, 1, 1, 1, 1, 1,
1.004048, 0.5669288, 2.879877, 1, 1, 1, 1, 1,
1.004637, -0.1004281, 0.8688875, 1, 1, 1, 1, 1,
1.006316, -0.1558052, 1.719528, 0, 0, 1, 1, 1,
1.007444, 0.1743095, 0.6735924, 1, 0, 0, 1, 1,
1.009477, -0.5209293, 2.010885, 1, 0, 0, 1, 1,
1.020368, 1.364331, -0.2103614, 1, 0, 0, 1, 1,
1.028867, 1.043447, 0.8726914, 1, 0, 0, 1, 1,
1.036116, -1.263829, 0.9936414, 1, 0, 0, 1, 1,
1.037983, -0.9151596, 3.268045, 0, 0, 0, 1, 1,
1.039603, 0.672208, -0.5388349, 0, 0, 0, 1, 1,
1.040676, 0.7766674, 1.088476, 0, 0, 0, 1, 1,
1.045295, 1.140212, 1.20578, 0, 0, 0, 1, 1,
1.045781, -0.3203117, 0.003682642, 0, 0, 0, 1, 1,
1.049489, -0.07638881, 1.595852, 0, 0, 0, 1, 1,
1.054713, -0.485681, 1.459673, 0, 0, 0, 1, 1,
1.064968, -0.7193883, 1.633087, 1, 1, 1, 1, 1,
1.06683, 0.3488013, 2.027942, 1, 1, 1, 1, 1,
1.071047, -0.127027, 1.203334, 1, 1, 1, 1, 1,
1.074702, -1.500373, 3.876524, 1, 1, 1, 1, 1,
1.077579, 0.3248324, 2.017333, 1, 1, 1, 1, 1,
1.078253, 1.117328, 2.904358, 1, 1, 1, 1, 1,
1.08108, -0.1401133, 2.952855, 1, 1, 1, 1, 1,
1.085585, -0.7110289, 0.9156096, 1, 1, 1, 1, 1,
1.090417, 0.3086459, 1.714135, 1, 1, 1, 1, 1,
1.092209, 0.7644465, 1.164935, 1, 1, 1, 1, 1,
1.093817, 0.2090017, 0.7531843, 1, 1, 1, 1, 1,
1.099135, -0.8707789, 1.246637, 1, 1, 1, 1, 1,
1.101592, -1.270978, 1.529108, 1, 1, 1, 1, 1,
1.101738, -0.7276095, 1.637466, 1, 1, 1, 1, 1,
1.10446, 0.5253952, 0.7392364, 1, 1, 1, 1, 1,
1.106217, -1.200169, 2.47578, 0, 0, 1, 1, 1,
1.106862, -0.05649719, 1.637351, 1, 0, 0, 1, 1,
1.107579, 0.2069844, 2.046394, 1, 0, 0, 1, 1,
1.109769, -0.9281622, 1.684062, 1, 0, 0, 1, 1,
1.114721, -0.412739, 1.329243, 1, 0, 0, 1, 1,
1.115939, -0.7179791, 3.743478, 1, 0, 0, 1, 1,
1.116653, 0.4918386, 2.382873, 0, 0, 0, 1, 1,
1.117529, 0.8596175, 1.940265, 0, 0, 0, 1, 1,
1.118035, 0.7991546, -1.806589, 0, 0, 0, 1, 1,
1.122367, -1.738028, 1.795671, 0, 0, 0, 1, 1,
1.132219, 1.291708, -1.951789, 0, 0, 0, 1, 1,
1.133604, 1.162104, 1.300742, 0, 0, 0, 1, 1,
1.141464, 0.7555423, 1.807727, 0, 0, 0, 1, 1,
1.147078, -0.2077585, 2.700252, 1, 1, 1, 1, 1,
1.147583, -1.132443, 2.682543, 1, 1, 1, 1, 1,
1.15342, 0.4523031, 0.9179592, 1, 1, 1, 1, 1,
1.158317, -0.5223887, 1.443565, 1, 1, 1, 1, 1,
1.169983, 0.7375344, 0.427404, 1, 1, 1, 1, 1,
1.180395, 0.6671916, -0.1387214, 1, 1, 1, 1, 1,
1.188736, 0.2213703, 1.418215, 1, 1, 1, 1, 1,
1.197231, 0.5062674, 1.054893, 1, 1, 1, 1, 1,
1.207415, 0.7676522, 2.214589, 1, 1, 1, 1, 1,
1.207816, -0.9320093, 1.754529, 1, 1, 1, 1, 1,
1.22461, 0.5979123, 1.42829, 1, 1, 1, 1, 1,
1.228596, -0.9983435, 0.7508189, 1, 1, 1, 1, 1,
1.235552, 0.8096234, 2.001815, 1, 1, 1, 1, 1,
1.250552, -0.9426917, 1.994982, 1, 1, 1, 1, 1,
1.251166, -0.08174707, 0.4574615, 1, 1, 1, 1, 1,
1.261526, 0.9115041, 1.525019, 0, 0, 1, 1, 1,
1.263433, 1.014988, 1.436108, 1, 0, 0, 1, 1,
1.268071, -0.7252718, 2.757725, 1, 0, 0, 1, 1,
1.26997, -1.036046, 0.7709894, 1, 0, 0, 1, 1,
1.272013, -0.3858525, 3.0617, 1, 0, 0, 1, 1,
1.276132, -0.6120786, 1.966838, 1, 0, 0, 1, 1,
1.278648, -1.454726, 1.484068, 0, 0, 0, 1, 1,
1.27897, -0.6692194, 2.837209, 0, 0, 0, 1, 1,
1.279707, -2.101889, 4.381663, 0, 0, 0, 1, 1,
1.286279, 1.252586, -0.7880974, 0, 0, 0, 1, 1,
1.298138, 0.01715452, -0.1437116, 0, 0, 0, 1, 1,
1.310328, -1.137243, -0.3298366, 0, 0, 0, 1, 1,
1.317159, 0.2418189, 1.187933, 0, 0, 0, 1, 1,
1.3182, 0.1449512, 0.9912944, 1, 1, 1, 1, 1,
1.323067, -0.1238141, 0.5095019, 1, 1, 1, 1, 1,
1.323303, -0.4905097, 1.094631, 1, 1, 1, 1, 1,
1.325156, 0.2490441, 1.163563, 1, 1, 1, 1, 1,
1.330605, 1.512243, 2.778568, 1, 1, 1, 1, 1,
1.335034, 1.203695, 1.668804, 1, 1, 1, 1, 1,
1.33604, -1.730838, 3.279887, 1, 1, 1, 1, 1,
1.350096, 0.8205249, 1.836737, 1, 1, 1, 1, 1,
1.361094, 0.243928, 0.6224008, 1, 1, 1, 1, 1,
1.362036, 0.1824021, 2.147905, 1, 1, 1, 1, 1,
1.368878, -0.03404308, 0.3737757, 1, 1, 1, 1, 1,
1.370833, -0.2381966, 0.567594, 1, 1, 1, 1, 1,
1.374393, 0.2334872, 1.442537, 1, 1, 1, 1, 1,
1.37858, 0.5612779, 0.7121747, 1, 1, 1, 1, 1,
1.383993, -0.6021004, 1.586931, 1, 1, 1, 1, 1,
1.384601, 1.683861, 0.2271659, 0, 0, 1, 1, 1,
1.391724, 0.6144444, 1.874186, 1, 0, 0, 1, 1,
1.394181, 1.881881, 0.473673, 1, 0, 0, 1, 1,
1.400939, -1.133155, 1.893153, 1, 0, 0, 1, 1,
1.405531, 0.2601939, 2.146024, 1, 0, 0, 1, 1,
1.408316, 1.554675, 0.5714765, 1, 0, 0, 1, 1,
1.430938, -0.6476569, 2.15088, 0, 0, 0, 1, 1,
1.43741, -0.943462, 0.6725878, 0, 0, 0, 1, 1,
1.440131, -1.236744, 3.302643, 0, 0, 0, 1, 1,
1.448495, 0.613471, 0.08219993, 0, 0, 0, 1, 1,
1.478179, 0.45623, 0.4485345, 0, 0, 0, 1, 1,
1.480356, -0.003135731, 2.412773, 0, 0, 0, 1, 1,
1.510062, 0.2714731, 2.246843, 0, 0, 0, 1, 1,
1.513381, -0.6591272, 1.695369, 1, 1, 1, 1, 1,
1.517674, 0.7500594, 0.2697452, 1, 1, 1, 1, 1,
1.528682, -0.0564311, 2.214666, 1, 1, 1, 1, 1,
1.541021, -0.002023633, 1.268306, 1, 1, 1, 1, 1,
1.546419, -0.04997945, 1.748565, 1, 1, 1, 1, 1,
1.550041, -1.369275, 3.523402, 1, 1, 1, 1, 1,
1.573167, 0.6141734, 0.73671, 1, 1, 1, 1, 1,
1.577298, -0.04812969, 2.668019, 1, 1, 1, 1, 1,
1.613103, -0.5821633, 2.549674, 1, 1, 1, 1, 1,
1.617981, 0.968035, 1.671946, 1, 1, 1, 1, 1,
1.63209, 1.451531, 1.443054, 1, 1, 1, 1, 1,
1.639241, -0.3463475, 1.599438, 1, 1, 1, 1, 1,
1.643361, -0.8449722, 3.947736, 1, 1, 1, 1, 1,
1.667211, 0.8345917, 0.3628627, 1, 1, 1, 1, 1,
1.692652, -0.5783834, 1.341427, 1, 1, 1, 1, 1,
1.692976, 0.6910822, 1.271309, 0, 0, 1, 1, 1,
1.704201, -1.437348, 3.426836, 1, 0, 0, 1, 1,
1.706962, 0.08791517, 1.541612, 1, 0, 0, 1, 1,
1.713874, -1.394878, 0.3817635, 1, 0, 0, 1, 1,
1.776352, -0.1428174, 1.124445, 1, 0, 0, 1, 1,
1.778974, -1.351934, 3.397666, 1, 0, 0, 1, 1,
1.7845, -1.847208, 2.785224, 0, 0, 0, 1, 1,
1.789511, 0.0811331, 4.4411, 0, 0, 0, 1, 1,
1.812327, -0.2083648, 2.203928, 0, 0, 0, 1, 1,
1.822457, -0.1601116, 3.974481, 0, 0, 0, 1, 1,
1.837215, 0.7362781, 1.630619, 0, 0, 0, 1, 1,
1.838124, 0.4183463, 2.97479, 0, 0, 0, 1, 1,
1.840261, 0.0547621, 3.254476, 0, 0, 0, 1, 1,
1.850346, -2.999918, 2.127086, 1, 1, 1, 1, 1,
1.877052, 0.7550609, 3.135287, 1, 1, 1, 1, 1,
1.909645, 0.6758155, 0.8158994, 1, 1, 1, 1, 1,
1.944476, 0.2404, 1.001946, 1, 1, 1, 1, 1,
1.949853, -0.1307364, -0.1974948, 1, 1, 1, 1, 1,
1.957709, -0.1868417, 0.4659354, 1, 1, 1, 1, 1,
1.969124, -1.396124, 4.197181, 1, 1, 1, 1, 1,
1.989841, -1.591963, 1.709589, 1, 1, 1, 1, 1,
2.023116, -1.316244, 3.112436, 1, 1, 1, 1, 1,
2.045505, -0.6636707, 0.908553, 1, 1, 1, 1, 1,
2.055234, 1.419972, -0.6150683, 1, 1, 1, 1, 1,
2.05665, 1.296423, 2.01164, 1, 1, 1, 1, 1,
2.115102, 0.1321858, 2.897076, 1, 1, 1, 1, 1,
2.115718, 1.026151, 2.468519, 1, 1, 1, 1, 1,
2.133812, 0.9389684, 1.718785, 1, 1, 1, 1, 1,
2.137789, -1.486579, 1.901567, 0, 0, 1, 1, 1,
2.178329, -1.031691, 2.342291, 1, 0, 0, 1, 1,
2.184546, -1.953589, 1.884928, 1, 0, 0, 1, 1,
2.202413, -0.5185978, 0.9624682, 1, 0, 0, 1, 1,
2.219345, 0.9709963, 1.74048, 1, 0, 0, 1, 1,
2.23109, -1.254781, 2.426185, 1, 0, 0, 1, 1,
2.252444, 0.3148428, 2.649112, 0, 0, 0, 1, 1,
2.307597, -1.249677, 0.1632892, 0, 0, 0, 1, 1,
2.334978, -0.4486697, 3.063325, 0, 0, 0, 1, 1,
2.343405, -0.05976676, 1.359623, 0, 0, 0, 1, 1,
2.400713, 0.2921777, 1.161317, 0, 0, 0, 1, 1,
2.476002, -0.2620279, 1.881783, 0, 0, 0, 1, 1,
2.518216, 0.7657188, 0.9159612, 0, 0, 0, 1, 1,
2.647627, -1.130941, 1.681124, 1, 1, 1, 1, 1,
2.673435, -0.2299064, 3.572604, 1, 1, 1, 1, 1,
2.695954, -0.2207636, 2.732341, 1, 1, 1, 1, 1,
2.701387, 2.326794, 1.581014, 1, 1, 1, 1, 1,
2.737553, -0.8634627, 1.188588, 1, 1, 1, 1, 1,
2.936072, -0.2986593, 1.405, 1, 1, 1, 1, 1,
3.027189, 0.8408988, 2.836755, 1, 1, 1, 1, 1
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
var radius = 9.42444;
var distance = 33.10295;
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
mvMatrix.translate( 0.002126455, -0.01605964, 0.08303237 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.10295);
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
