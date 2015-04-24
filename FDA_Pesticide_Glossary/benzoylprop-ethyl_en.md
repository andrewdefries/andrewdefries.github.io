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
-3.47792, 0.5385363, -0.9230531, 1, 0, 0, 1,
-3.308067, -0.5303239, -1.279151, 1, 0.007843138, 0, 1,
-2.957959, 0.2303478, -1.530227, 1, 0.01176471, 0, 1,
-2.789755, -0.1325059, -0.5443689, 1, 0.01960784, 0, 1,
-2.738684, 1.24387, -1.263356, 1, 0.02352941, 0, 1,
-2.545563, -1.839327, -1.889279, 1, 0.03137255, 0, 1,
-2.512114, -0.5026684, -1.458941, 1, 0.03529412, 0, 1,
-2.484173, 0.3520845, -2.757751, 1, 0.04313726, 0, 1,
-2.457885, 0.9245703, -1.603556, 1, 0.04705882, 0, 1,
-2.419283, -0.7053374, -1.693887, 1, 0.05490196, 0, 1,
-2.400385, 0.9482453, -1.060779, 1, 0.05882353, 0, 1,
-2.389012, -1.169097, -1.141264, 1, 0.06666667, 0, 1,
-2.385802, 1.331306, -3.105574, 1, 0.07058824, 0, 1,
-2.370815, -0.9224176, -2.192487, 1, 0.07843138, 0, 1,
-2.355732, 0.4190007, -1.521155, 1, 0.08235294, 0, 1,
-2.348305, 1.636161, -1.522474, 1, 0.09019608, 0, 1,
-2.301837, -1.357635, -2.974506, 1, 0.09411765, 0, 1,
-2.123279, -0.0917759, -3.40825, 1, 0.1019608, 0, 1,
-2.109555, 0.1251355, -1.202727, 1, 0.1098039, 0, 1,
-2.071187, -0.1436297, -1.647509, 1, 0.1137255, 0, 1,
-2.06029, -1.760786, -2.626101, 1, 0.1215686, 0, 1,
-2.043687, 0.05361272, -1.879973, 1, 0.1254902, 0, 1,
-2.021594, 1.413314, -0.03676214, 1, 0.1333333, 0, 1,
-2.000476, 1.923424, -2.316865, 1, 0.1372549, 0, 1,
-1.996074, 0.2771328, -1.765945, 1, 0.145098, 0, 1,
-1.952638, 0.4974915, -1.428461, 1, 0.1490196, 0, 1,
-1.949099, -0.5431408, -1.754282, 1, 0.1568628, 0, 1,
-1.944051, -0.1835538, -2.845109, 1, 0.1607843, 0, 1,
-1.94191, 0.2322153, -2.186121, 1, 0.1686275, 0, 1,
-1.907701, -0.08352202, -1.678492, 1, 0.172549, 0, 1,
-1.8982, 1.293039, -0.7854589, 1, 0.1803922, 0, 1,
-1.895191, 0.22165, -0.1652981, 1, 0.1843137, 0, 1,
-1.883394, 1.209576, -0.7874615, 1, 0.1921569, 0, 1,
-1.875086, -2.239086, -2.891693, 1, 0.1960784, 0, 1,
-1.84257, 0.5651867, -1.443323, 1, 0.2039216, 0, 1,
-1.829504, 0.583267, -1.889083, 1, 0.2117647, 0, 1,
-1.816374, -0.5397378, -1.972176, 1, 0.2156863, 0, 1,
-1.815018, -1.454508, -1.866021, 1, 0.2235294, 0, 1,
-1.810291, 1.314313, 0.01626289, 1, 0.227451, 0, 1,
-1.797712, -0.1816659, -3.183501, 1, 0.2352941, 0, 1,
-1.753921, 1.143083, -2.545985, 1, 0.2392157, 0, 1,
-1.740365, 0.7856958, -2.117169, 1, 0.2470588, 0, 1,
-1.738641, 0.01327524, -2.727881, 1, 0.2509804, 0, 1,
-1.733822, 0.8693287, -0.8709036, 1, 0.2588235, 0, 1,
-1.716318, 1.748, 1.022229, 1, 0.2627451, 0, 1,
-1.709243, -2.533083, -2.55956, 1, 0.2705882, 0, 1,
-1.686343, -0.3931508, -2.77342, 1, 0.2745098, 0, 1,
-1.667878, -0.3285877, -2.074907, 1, 0.282353, 0, 1,
-1.65518, -0.862932, -1.600399, 1, 0.2862745, 0, 1,
-1.650982, -1.683901, -1.455981, 1, 0.2941177, 0, 1,
-1.649684, 0.09079687, -1.529867, 1, 0.3019608, 0, 1,
-1.646229, -1.308455, -2.660491, 1, 0.3058824, 0, 1,
-1.645975, 1.162634, -0.5733884, 1, 0.3137255, 0, 1,
-1.634553, 0.3377914, -2.053115, 1, 0.3176471, 0, 1,
-1.63251, 0.008962893, -2.565586, 1, 0.3254902, 0, 1,
-1.625349, 0.788985, -2.509312, 1, 0.3294118, 0, 1,
-1.624686, 0.05385982, -2.263731, 1, 0.3372549, 0, 1,
-1.618025, 0.07308318, -0.3757527, 1, 0.3411765, 0, 1,
-1.614673, 0.6000262, -3.09849, 1, 0.3490196, 0, 1,
-1.608425, -0.2729466, -3.229594, 1, 0.3529412, 0, 1,
-1.598384, 0.523204, -1.597112, 1, 0.3607843, 0, 1,
-1.590806, -0.08852179, -2.357, 1, 0.3647059, 0, 1,
-1.580079, 0.6967405, -1.58223, 1, 0.372549, 0, 1,
-1.557395, 0.7392046, -1.250612, 1, 0.3764706, 0, 1,
-1.55451, 0.4558325, -2.57461, 1, 0.3843137, 0, 1,
-1.533275, 0.7521114, -0.5037168, 1, 0.3882353, 0, 1,
-1.527889, 1.38937, -0.7374823, 1, 0.3960784, 0, 1,
-1.522184, 0.8857558, -2.660733, 1, 0.4039216, 0, 1,
-1.513741, 2.124739, -1.859183, 1, 0.4078431, 0, 1,
-1.499947, 0.8058646, -0.1088658, 1, 0.4156863, 0, 1,
-1.493279, -0.8760605, -1.172616, 1, 0.4196078, 0, 1,
-1.477197, -1.750555, -1.807748, 1, 0.427451, 0, 1,
-1.472096, -0.1449277, -1.237805, 1, 0.4313726, 0, 1,
-1.447188, -0.1808327, -1.011628, 1, 0.4392157, 0, 1,
-1.4434, 1.673862, 0.467597, 1, 0.4431373, 0, 1,
-1.442501, -0.177419, -1.816423, 1, 0.4509804, 0, 1,
-1.441484, -0.9984001, -2.102137, 1, 0.454902, 0, 1,
-1.433683, 0.1750639, -1.717338, 1, 0.4627451, 0, 1,
-1.417451, -0.8215699, -2.786382, 1, 0.4666667, 0, 1,
-1.412533, 0.1511777, -0.3955978, 1, 0.4745098, 0, 1,
-1.368562, 1.792498, -0.1757854, 1, 0.4784314, 0, 1,
-1.356422, 0.486201, -2.267859, 1, 0.4862745, 0, 1,
-1.356034, 1.308005, -0.1359369, 1, 0.4901961, 0, 1,
-1.344112, -0.6859818, -3.1996, 1, 0.4980392, 0, 1,
-1.341517, -1.366008, -0.9720528, 1, 0.5058824, 0, 1,
-1.334303, -0.3889692, -0.6460115, 1, 0.509804, 0, 1,
-1.327876, -0.975096, -2.026587, 1, 0.5176471, 0, 1,
-1.327135, -0.5623767, -1.575784, 1, 0.5215687, 0, 1,
-1.325407, 1.169662, 0.1645011, 1, 0.5294118, 0, 1,
-1.322327, 1.121029, -2.444468, 1, 0.5333334, 0, 1,
-1.321397, -2.09686, -2.67026, 1, 0.5411765, 0, 1,
-1.310801, -0.3040302, -2.694984, 1, 0.5450981, 0, 1,
-1.305367, -1.136925, -0.5619286, 1, 0.5529412, 0, 1,
-1.300466, 0.501318, -1.203889, 1, 0.5568628, 0, 1,
-1.295111, -0.4693827, -1.563224, 1, 0.5647059, 0, 1,
-1.291825, -0.7916791, -3.842407, 1, 0.5686275, 0, 1,
-1.280357, -0.4317227, -1.405225, 1, 0.5764706, 0, 1,
-1.273833, -0.23042, -1.940281, 1, 0.5803922, 0, 1,
-1.249371, 0.4822356, -1.996204, 1, 0.5882353, 0, 1,
-1.23329, -0.3300647, -1.666686, 1, 0.5921569, 0, 1,
-1.230374, 0.396199, 0.4725044, 1, 0.6, 0, 1,
-1.226804, 0.9885975, -0.7361309, 1, 0.6078432, 0, 1,
-1.22004, 0.9428519, -1.77688, 1, 0.6117647, 0, 1,
-1.219643, 0.2575597, -2.23324, 1, 0.6196079, 0, 1,
-1.205359, -1.102877, -2.513517, 1, 0.6235294, 0, 1,
-1.203628, 0.4928578, -0.1778196, 1, 0.6313726, 0, 1,
-1.20253, -2.370263, -3.023767, 1, 0.6352941, 0, 1,
-1.197814, -0.5174958, -1.480621, 1, 0.6431373, 0, 1,
-1.187374, -2.193165, -3.085636, 1, 0.6470588, 0, 1,
-1.185317, 1.055258, -0.3716384, 1, 0.654902, 0, 1,
-1.184504, 0.7228461, -0.05498092, 1, 0.6588235, 0, 1,
-1.176915, -1.904584, -3.015482, 1, 0.6666667, 0, 1,
-1.170986, 0.3076508, -1.078772, 1, 0.6705883, 0, 1,
-1.168324, 1.471002, -2.118883, 1, 0.6784314, 0, 1,
-1.161621, -0.2940728, -1.696209, 1, 0.682353, 0, 1,
-1.149914, -0.03157778, -1.380415, 1, 0.6901961, 0, 1,
-1.144595, -0.4913526, -3.161662, 1, 0.6941177, 0, 1,
-1.135008, 1.90946, 0.1472834, 1, 0.7019608, 0, 1,
-1.133752, 0.3621306, -1.911179, 1, 0.7098039, 0, 1,
-1.13051, 1.08331, 0.527864, 1, 0.7137255, 0, 1,
-1.126239, 1.405225, -0.8555725, 1, 0.7215686, 0, 1,
-1.108328, 1.40765, -1.031458, 1, 0.7254902, 0, 1,
-1.106761, 0.3412988, 0.7471185, 1, 0.7333333, 0, 1,
-1.103006, -1.497111, -2.479285, 1, 0.7372549, 0, 1,
-1.102407, -1.597495, -4.819581, 1, 0.7450981, 0, 1,
-1.09721, -1.107769, -1.556453, 1, 0.7490196, 0, 1,
-1.095374, -1.172143, -4.437669, 1, 0.7568628, 0, 1,
-1.09226, -2.184327, -3.437478, 1, 0.7607843, 0, 1,
-1.086135, -0.07904571, -2.624734, 1, 0.7686275, 0, 1,
-1.083268, -1.042705, -3.037759, 1, 0.772549, 0, 1,
-1.081452, -1.031366, -3.026745, 1, 0.7803922, 0, 1,
-1.078073, -0.7190254, -2.008112, 1, 0.7843137, 0, 1,
-1.077893, 0.7378259, -0.8639951, 1, 0.7921569, 0, 1,
-1.070599, 1.092752, -1.14483, 1, 0.7960784, 0, 1,
-1.070433, 2.424412, 1.338923, 1, 0.8039216, 0, 1,
-1.069613, 0.2035228, -2.093386, 1, 0.8117647, 0, 1,
-1.05994, 1.93524, -0.02252214, 1, 0.8156863, 0, 1,
-1.058271, 1.3285, -0.8025491, 1, 0.8235294, 0, 1,
-1.054423, 0.3393878, -0.8971602, 1, 0.827451, 0, 1,
-1.047169, 0.956134, -1.343101, 1, 0.8352941, 0, 1,
-1.042402, 1.984474, -0.9028537, 1, 0.8392157, 0, 1,
-1.035334, 0.8284644, -1.566428, 1, 0.8470588, 0, 1,
-1.030255, -0.03511057, -2.737836, 1, 0.8509804, 0, 1,
-1.027737, 0.6355777, -1.325306, 1, 0.8588235, 0, 1,
-1.024798, -0.5916809, -1.158756, 1, 0.8627451, 0, 1,
-1.007963, -0.08127576, -1.774088, 1, 0.8705882, 0, 1,
-1.00556, -0.9880157, -0.5060265, 1, 0.8745098, 0, 1,
-1.004943, 0.02131241, -1.019592, 1, 0.8823529, 0, 1,
-1.002967, 0.2372033, -0.9817312, 1, 0.8862745, 0, 1,
-1.000577, 0.249476, -0.7948468, 1, 0.8941177, 0, 1,
-0.9984613, -1.443902, -3.38826, 1, 0.8980392, 0, 1,
-0.9981353, 0.6833892, 0.593634, 1, 0.9058824, 0, 1,
-0.99468, -0.9109876, -1.290748, 1, 0.9137255, 0, 1,
-0.9883757, 0.6913229, -0.161018, 1, 0.9176471, 0, 1,
-0.9865459, -1.769149, -0.3869474, 1, 0.9254902, 0, 1,
-0.9736226, -1.191221, -3.231777, 1, 0.9294118, 0, 1,
-0.9670004, -0.6075944, -1.768166, 1, 0.9372549, 0, 1,
-0.9651861, -0.5127571, -1.501442, 1, 0.9411765, 0, 1,
-0.9514063, 0.4860381, -1.92863, 1, 0.9490196, 0, 1,
-0.9483829, -0.2642479, -3.410888, 1, 0.9529412, 0, 1,
-0.9417814, -1.446664, -1.116607, 1, 0.9607843, 0, 1,
-0.9408448, 0.8972435, -0.9354354, 1, 0.9647059, 0, 1,
-0.9305173, -0.4823746, -1.580671, 1, 0.972549, 0, 1,
-0.9292939, 1.717267, -1.427063, 1, 0.9764706, 0, 1,
-0.9217185, 0.4661324, -0.1937605, 1, 0.9843137, 0, 1,
-0.9148928, -1.012023, -2.094819, 1, 0.9882353, 0, 1,
-0.9112269, -1.568882, -2.357643, 1, 0.9960784, 0, 1,
-0.9090087, 1.375901, -1.960699, 0.9960784, 1, 0, 1,
-0.9079201, -0.9823915, -2.143084, 0.9921569, 1, 0, 1,
-0.9076214, 0.475029, -0.3309152, 0.9843137, 1, 0, 1,
-0.9049422, -1.829126, -3.021178, 0.9803922, 1, 0, 1,
-0.9025875, 0.0549638, -1.214106, 0.972549, 1, 0, 1,
-0.9021507, 0.5180466, -0.3510364, 0.9686275, 1, 0, 1,
-0.8990185, -1.203799, -2.524313, 0.9607843, 1, 0, 1,
-0.8964717, 1.691143, 1.484941, 0.9568627, 1, 0, 1,
-0.8951387, -0.03386243, -0.8104087, 0.9490196, 1, 0, 1,
-0.89227, 0.935038, -0.7795027, 0.945098, 1, 0, 1,
-0.8917591, -2.222501, -2.340573, 0.9372549, 1, 0, 1,
-0.8904478, -1.304422, -3.158939, 0.9333333, 1, 0, 1,
-0.8887873, 2.449231, -0.4465923, 0.9254902, 1, 0, 1,
-0.8863965, -0.4216798, -2.757945, 0.9215686, 1, 0, 1,
-0.8683624, 0.1918378, -0.6442209, 0.9137255, 1, 0, 1,
-0.8647316, -0.08119024, -1.246581, 0.9098039, 1, 0, 1,
-0.8603569, -1.097662, -3.222641, 0.9019608, 1, 0, 1,
-0.8579329, 0.5148974, -1.608387, 0.8941177, 1, 0, 1,
-0.856352, 0.5108466, -2.230654, 0.8901961, 1, 0, 1,
-0.8436945, -0.2903057, -0.4627908, 0.8823529, 1, 0, 1,
-0.842562, 0.07889467, -1.406772, 0.8784314, 1, 0, 1,
-0.8409665, 0.9338995, -0.7531068, 0.8705882, 1, 0, 1,
-0.8407092, 1.310996, -1.737701, 0.8666667, 1, 0, 1,
-0.8380406, -0.9622074, -1.305928, 0.8588235, 1, 0, 1,
-0.8336791, -1.501373, -2.69147, 0.854902, 1, 0, 1,
-0.8331013, 2.537783, -0.3775547, 0.8470588, 1, 0, 1,
-0.8330532, -0.3016454, -0.9573105, 0.8431373, 1, 0, 1,
-0.8313386, 1.373329, -1.057594, 0.8352941, 1, 0, 1,
-0.8300642, 0.2999612, -1.62911, 0.8313726, 1, 0, 1,
-0.8295702, 0.1852189, -1.957691, 0.8235294, 1, 0, 1,
-0.8179759, 1.482421, -0.4262342, 0.8196079, 1, 0, 1,
-0.8125028, 1.258382, 1.117809, 0.8117647, 1, 0, 1,
-0.811694, -0.2388373, -1.980431, 0.8078431, 1, 0, 1,
-0.8101236, -0.4577293, -2.467113, 0.8, 1, 0, 1,
-0.8041993, 1.194709, -0.09508762, 0.7921569, 1, 0, 1,
-0.804069, 0.3859517, -2.382698, 0.7882353, 1, 0, 1,
-0.7968629, -0.9479186, -1.98819, 0.7803922, 1, 0, 1,
-0.792104, -1.33936, -1.746118, 0.7764706, 1, 0, 1,
-0.7882976, -0.4427063, -2.192935, 0.7686275, 1, 0, 1,
-0.7859688, 0.9180773, 0.03103221, 0.7647059, 1, 0, 1,
-0.7854646, -0.3909781, -2.675523, 0.7568628, 1, 0, 1,
-0.7827321, -0.8856862, -2.688207, 0.7529412, 1, 0, 1,
-0.7823316, -0.4815511, -2.07552, 0.7450981, 1, 0, 1,
-0.7645143, -0.7036062, -2.835708, 0.7411765, 1, 0, 1,
-0.7630292, -0.1472252, -1.529073, 0.7333333, 1, 0, 1,
-0.7553467, 2.008502, -0.2846827, 0.7294118, 1, 0, 1,
-0.7537253, 0.1109797, -0.6286469, 0.7215686, 1, 0, 1,
-0.7517034, -0.4633915, -2.890851, 0.7176471, 1, 0, 1,
-0.7508134, 0.5409635, -0.8710296, 0.7098039, 1, 0, 1,
-0.747465, 0.4370559, 0.4689049, 0.7058824, 1, 0, 1,
-0.7410486, -1.03857, -4.492749, 0.6980392, 1, 0, 1,
-0.7347161, 1.008945, 1.460017, 0.6901961, 1, 0, 1,
-0.7328218, -1.779649, -4.246953, 0.6862745, 1, 0, 1,
-0.7319275, -1.347206, -2.845168, 0.6784314, 1, 0, 1,
-0.7297761, 1.190152, -0.4955031, 0.6745098, 1, 0, 1,
-0.7274484, 1.15543, -1.393355, 0.6666667, 1, 0, 1,
-0.7252532, -0.505551, -1.771912, 0.6627451, 1, 0, 1,
-0.7217811, 0.9812445, -0.5740186, 0.654902, 1, 0, 1,
-0.7161771, -1.630516, -2.273297, 0.6509804, 1, 0, 1,
-0.7140652, 1.099287, 1.095284, 0.6431373, 1, 0, 1,
-0.7023124, -0.01472558, -3.363029, 0.6392157, 1, 0, 1,
-0.6995618, 0.1529812, -1.154238, 0.6313726, 1, 0, 1,
-0.6948445, -1.236838, -5.382648, 0.627451, 1, 0, 1,
-0.6933103, -1.032547, -1.271436, 0.6196079, 1, 0, 1,
-0.6918173, 0.2457368, -1.886287, 0.6156863, 1, 0, 1,
-0.6890471, 0.7583681, -1.232219, 0.6078432, 1, 0, 1,
-0.6856722, -1.561143, -2.601121, 0.6039216, 1, 0, 1,
-0.6830558, 0.01193426, -2.770206, 0.5960785, 1, 0, 1,
-0.6825883, 0.970556, 0.7358297, 0.5882353, 1, 0, 1,
-0.6791937, 0.4727028, -2.116913, 0.5843138, 1, 0, 1,
-0.6784949, 1.626867, 0.4464143, 0.5764706, 1, 0, 1,
-0.6772968, -0.8350654, -1.053758, 0.572549, 1, 0, 1,
-0.674942, -0.5737769, -0.7943417, 0.5647059, 1, 0, 1,
-0.6722528, 0.7495235, -1.09015, 0.5607843, 1, 0, 1,
-0.6674299, -0.237378, -3.054619, 0.5529412, 1, 0, 1,
-0.6655006, -1.573938, -6.467117, 0.5490196, 1, 0, 1,
-0.6588492, 0.08022309, -1.132368, 0.5411765, 1, 0, 1,
-0.6560822, -1.542744, -1.208171, 0.5372549, 1, 0, 1,
-0.654871, -0.4712375, 1.104772, 0.5294118, 1, 0, 1,
-0.6542763, 0.2858366, -0.6780389, 0.5254902, 1, 0, 1,
-0.6514854, 1.463668, -1.810564, 0.5176471, 1, 0, 1,
-0.6462319, -0.647475, -1.730918, 0.5137255, 1, 0, 1,
-0.645907, -2.189622, -3.523029, 0.5058824, 1, 0, 1,
-0.6433156, 0.3592339, -1.286602, 0.5019608, 1, 0, 1,
-0.6421806, -1.186132, -2.65607, 0.4941176, 1, 0, 1,
-0.6407707, -0.08684873, -1.008988, 0.4862745, 1, 0, 1,
-0.6407145, -1.422555, -1.973138, 0.4823529, 1, 0, 1,
-0.640495, -0.05527739, 0.2467756, 0.4745098, 1, 0, 1,
-0.6359897, -1.184415, -2.540569, 0.4705882, 1, 0, 1,
-0.6202238, 0.3546908, -2.634817, 0.4627451, 1, 0, 1,
-0.6162569, 2.211148, 0.4407433, 0.4588235, 1, 0, 1,
-0.6146808, -0.2226386, -3.295557, 0.4509804, 1, 0, 1,
-0.6111116, -0.9238224, -1.535495, 0.4470588, 1, 0, 1,
-0.6003145, -0.02451346, -1.251204, 0.4392157, 1, 0, 1,
-0.5952873, -0.972803, -3.177257, 0.4352941, 1, 0, 1,
-0.5927803, 0.2802209, -1.210431, 0.427451, 1, 0, 1,
-0.5917961, -0.01564842, -0.230251, 0.4235294, 1, 0, 1,
-0.5893282, -0.6504923, -1.950936, 0.4156863, 1, 0, 1,
-0.5871859, -0.3967228, -2.580135, 0.4117647, 1, 0, 1,
-0.5859629, -0.3605474, -1.304458, 0.4039216, 1, 0, 1,
-0.5828326, 0.6249601, 0.08335392, 0.3960784, 1, 0, 1,
-0.5807967, 1.087303, -1.04548, 0.3921569, 1, 0, 1,
-0.5771625, -1.791831, -3.353758, 0.3843137, 1, 0, 1,
-0.5715886, 1.338006, 0.173491, 0.3803922, 1, 0, 1,
-0.5713577, 0.9286924, -1.578208, 0.372549, 1, 0, 1,
-0.5680697, 0.2832787, -2.792502, 0.3686275, 1, 0, 1,
-0.5677418, -0.4535216, -2.283376, 0.3607843, 1, 0, 1,
-0.5672662, 0.6959394, -0.7086043, 0.3568628, 1, 0, 1,
-0.5654932, -0.8028513, -2.243149, 0.3490196, 1, 0, 1,
-0.5628332, -0.9381949, -1.787403, 0.345098, 1, 0, 1,
-0.55793, -0.9538195, -2.731076, 0.3372549, 1, 0, 1,
-0.5573159, -0.2352346, -2.755708, 0.3333333, 1, 0, 1,
-0.5559558, 0.664288, -0.8521788, 0.3254902, 1, 0, 1,
-0.5551156, 0.003781417, -2.889836, 0.3215686, 1, 0, 1,
-0.5540079, 1.029028, -2.015543, 0.3137255, 1, 0, 1,
-0.5533735, 1.103897, 0.7686505, 0.3098039, 1, 0, 1,
-0.5508165, -0.4141503, -3.90781, 0.3019608, 1, 0, 1,
-0.5457564, 0.2167895, -1.090709, 0.2941177, 1, 0, 1,
-0.5454652, -0.1392232, -1.717572, 0.2901961, 1, 0, 1,
-0.5441751, 0.9479812, 0.09210266, 0.282353, 1, 0, 1,
-0.539914, 1.502039, 0.3414439, 0.2784314, 1, 0, 1,
-0.5360919, -0.3952885, -0.4256905, 0.2705882, 1, 0, 1,
-0.5314686, 1.977589, 0.2748033, 0.2666667, 1, 0, 1,
-0.5252491, 0.1566812, -2.001754, 0.2588235, 1, 0, 1,
-0.5222901, -1.351209, -2.215701, 0.254902, 1, 0, 1,
-0.5216968, 0.6831034, 1.803926, 0.2470588, 1, 0, 1,
-0.5202313, -0.7811409, -2.969349, 0.2431373, 1, 0, 1,
-0.5174527, 1.106936, 0.4299624, 0.2352941, 1, 0, 1,
-0.517434, -0.3832727, -3.253894, 0.2313726, 1, 0, 1,
-0.5121747, 0.6515284, 0.2012996, 0.2235294, 1, 0, 1,
-0.5088822, 0.1651034, 0.06107565, 0.2196078, 1, 0, 1,
-0.5039565, -1.165337, -3.660697, 0.2117647, 1, 0, 1,
-0.5010939, -0.3247143, -1.857011, 0.2078431, 1, 0, 1,
-0.4980771, -1.497812, -2.244139, 0.2, 1, 0, 1,
-0.4975564, -1.100623, -2.890307, 0.1921569, 1, 0, 1,
-0.4967996, -0.2754193, -2.515654, 0.1882353, 1, 0, 1,
-0.4944915, 1.045003, -0.225132, 0.1803922, 1, 0, 1,
-0.4942365, 0.84859, -0.8977669, 0.1764706, 1, 0, 1,
-0.4882838, 0.1631652, -1.114237, 0.1686275, 1, 0, 1,
-0.4788867, 0.587437, -1.341, 0.1647059, 1, 0, 1,
-0.4757594, 0.1619613, -2.763066, 0.1568628, 1, 0, 1,
-0.4699814, 0.6335491, -1.492216, 0.1529412, 1, 0, 1,
-0.4675478, -0.2570246, -3.114735, 0.145098, 1, 0, 1,
-0.4669419, -0.1973894, -3.013283, 0.1411765, 1, 0, 1,
-0.4651033, 0.495728, -0.2929409, 0.1333333, 1, 0, 1,
-0.4646206, 0.1637927, -1.04741, 0.1294118, 1, 0, 1,
-0.4627189, -0.6268351, -0.8393441, 0.1215686, 1, 0, 1,
-0.4584696, 0.01779003, -0.7468346, 0.1176471, 1, 0, 1,
-0.4517757, 0.3835863, -0.1159851, 0.1098039, 1, 0, 1,
-0.4490226, 0.9980405, -1.615277, 0.1058824, 1, 0, 1,
-0.4470582, -1.825367, -3.17402, 0.09803922, 1, 0, 1,
-0.4436652, -0.7421819, -3.319328, 0.09019608, 1, 0, 1,
-0.4433398, 1.405138, 0.2571729, 0.08627451, 1, 0, 1,
-0.4347932, -0.2615573, -1.75618, 0.07843138, 1, 0, 1,
-0.4313248, 0.1084252, -1.684308, 0.07450981, 1, 0, 1,
-0.4292574, 1.04221, -1.363808, 0.06666667, 1, 0, 1,
-0.4279456, -0.004994354, -0.9919704, 0.0627451, 1, 0, 1,
-0.4263996, -2.0888, -3.26508, 0.05490196, 1, 0, 1,
-0.4243029, -0.8558126, -4.109649, 0.05098039, 1, 0, 1,
-0.4168113, -0.8420911, -1.753102, 0.04313726, 1, 0, 1,
-0.4159238, 2.039993, -0.4400224, 0.03921569, 1, 0, 1,
-0.4157608, -1.441866, -2.69898, 0.03137255, 1, 0, 1,
-0.4129941, -1.118813, -3.335306, 0.02745098, 1, 0, 1,
-0.4100161, 2.805283, 0.1729051, 0.01960784, 1, 0, 1,
-0.4063262, 0.8948072, -0.1153344, 0.01568628, 1, 0, 1,
-0.4022011, -1.425552, -1.54126, 0.007843138, 1, 0, 1,
-0.4016474, 0.6368569, -0.1598901, 0.003921569, 1, 0, 1,
-0.3995551, 1.132427, -0.3580717, 0, 1, 0.003921569, 1,
-0.3994375, 0.505675, -0.03892358, 0, 1, 0.01176471, 1,
-0.3936938, 1.308082, -2.055209, 0, 1, 0.01568628, 1,
-0.3935805, 0.7230762, 1.227293, 0, 1, 0.02352941, 1,
-0.3886249, 0.1896486, 0.4381216, 0, 1, 0.02745098, 1,
-0.3882205, -0.8125061, -2.791294, 0, 1, 0.03529412, 1,
-0.3871646, 1.33361, 1.763994, 0, 1, 0.03921569, 1,
-0.381356, -0.2234387, -0.9222675, 0, 1, 0.04705882, 1,
-0.3799782, 0.5599196, 0.2635014, 0, 1, 0.05098039, 1,
-0.3784989, -0.2354871, -1.990397, 0, 1, 0.05882353, 1,
-0.3754609, -1.171877, -1.117981, 0, 1, 0.0627451, 1,
-0.3727749, 1.147172, 3.46397, 0, 1, 0.07058824, 1,
-0.3723969, 1.218264, 0.7670902, 0, 1, 0.07450981, 1,
-0.3709802, -1.162661, -3.142021, 0, 1, 0.08235294, 1,
-0.3697763, -0.294295, -1.67261, 0, 1, 0.08627451, 1,
-0.369612, -0.171785, -0.2113858, 0, 1, 0.09411765, 1,
-0.3602884, 0.4766045, -0.5713567, 0, 1, 0.1019608, 1,
-0.356707, 0.4956181, 1.971342, 0, 1, 0.1058824, 1,
-0.3564419, 1.349166, 0.254816, 0, 1, 0.1137255, 1,
-0.3507212, -0.9593691, -3.547199, 0, 1, 0.1176471, 1,
-0.3494752, -0.51789, -2.487452, 0, 1, 0.1254902, 1,
-0.3477719, -0.1151061, -2.846126, 0, 1, 0.1294118, 1,
-0.343802, 0.08091483, -3.680605, 0, 1, 0.1372549, 1,
-0.3407734, 1.44514, 0.8982788, 0, 1, 0.1411765, 1,
-0.339798, 0.2999447, -1.018411, 0, 1, 0.1490196, 1,
-0.3378859, -0.7546558, -3.383377, 0, 1, 0.1529412, 1,
-0.3360381, 0.08346866, -0.7076279, 0, 1, 0.1607843, 1,
-0.3315251, -0.8382648, -3.148987, 0, 1, 0.1647059, 1,
-0.3297126, 1.568074, 1.484942, 0, 1, 0.172549, 1,
-0.3216425, -0.3292602, -2.361894, 0, 1, 0.1764706, 1,
-0.31791, -0.2861814, -3.406946, 0, 1, 0.1843137, 1,
-0.3169188, -0.7437449, -4.412435, 0, 1, 0.1882353, 1,
-0.3146805, 1.197994, -0.2012149, 0, 1, 0.1960784, 1,
-0.3128191, -2.025196, -2.667815, 0, 1, 0.2039216, 1,
-0.3098752, 0.9210346, -0.8266302, 0, 1, 0.2078431, 1,
-0.3094055, -0.7675856, -2.319108, 0, 1, 0.2156863, 1,
-0.3093342, -2.853158, -4.151125, 0, 1, 0.2196078, 1,
-0.3048169, -0.07113274, -1.050434, 0, 1, 0.227451, 1,
-0.3013699, 0.5120713, -0.8287005, 0, 1, 0.2313726, 1,
-0.2959684, -1.665369, -3.774072, 0, 1, 0.2392157, 1,
-0.2954545, 0.3973476, -0.2360827, 0, 1, 0.2431373, 1,
-0.2900821, -0.4074438, -1.087381, 0, 1, 0.2509804, 1,
-0.2890614, 0.004828613, -1.670432, 0, 1, 0.254902, 1,
-0.2861759, -0.4602256, -2.397134, 0, 1, 0.2627451, 1,
-0.285042, 1.061061, -1.007452, 0, 1, 0.2666667, 1,
-0.2827608, 0.3644741, -0.1699804, 0, 1, 0.2745098, 1,
-0.2784945, -0.8563874, -4.388757, 0, 1, 0.2784314, 1,
-0.2780828, 0.5707743, -1.947399, 0, 1, 0.2862745, 1,
-0.2743726, 0.8946382, -0.1972296, 0, 1, 0.2901961, 1,
-0.2709146, 0.6168048, 0.9986496, 0, 1, 0.2980392, 1,
-0.2706096, 1.216003, -0.2640373, 0, 1, 0.3058824, 1,
-0.2627486, 0.8333678, -0.5593454, 0, 1, 0.3098039, 1,
-0.2608424, -1.003946, -3.516598, 0, 1, 0.3176471, 1,
-0.253239, -0.3957115, -3.542434, 0, 1, 0.3215686, 1,
-0.2525212, 0.792704, -1.405935, 0, 1, 0.3294118, 1,
-0.2419653, 0.8155382, -2.156617, 0, 1, 0.3333333, 1,
-0.2415787, 1.118708, 0.7111475, 0, 1, 0.3411765, 1,
-0.2400286, 0.8093609, -0.7001883, 0, 1, 0.345098, 1,
-0.2386487, 0.5312563, -1.04498, 0, 1, 0.3529412, 1,
-0.2229716, -1.040359, -1.082483, 0, 1, 0.3568628, 1,
-0.2216066, 1.742561, -0.5749769, 0, 1, 0.3647059, 1,
-0.2204779, -1.763631, -3.595824, 0, 1, 0.3686275, 1,
-0.2189158, 1.134104, -0.2502833, 0, 1, 0.3764706, 1,
-0.2181821, 0.1952359, -2.388419, 0, 1, 0.3803922, 1,
-0.2161707, -1.094154, -2.28957, 0, 1, 0.3882353, 1,
-0.214674, 0.4300243, -2.408172, 0, 1, 0.3921569, 1,
-0.2104212, -1.952231, -3.217792, 0, 1, 0.4, 1,
-0.2081859, 0.9142471, 0.8504381, 0, 1, 0.4078431, 1,
-0.2069167, -0.1926384, -1.199405, 0, 1, 0.4117647, 1,
-0.2058133, 2.209171, -0.7443283, 0, 1, 0.4196078, 1,
-0.2052346, -1.282721, -2.961635, 0, 1, 0.4235294, 1,
-0.1990347, 1.372738, -2.562981, 0, 1, 0.4313726, 1,
-0.1954226, 0.1615507, 0.8272828, 0, 1, 0.4352941, 1,
-0.1929655, -0.05534365, -2.928955, 0, 1, 0.4431373, 1,
-0.1900108, -1.417627, -4.080904, 0, 1, 0.4470588, 1,
-0.1829501, 1.589999, 1.939602, 0, 1, 0.454902, 1,
-0.1799314, 1.324142, -1.605129, 0, 1, 0.4588235, 1,
-0.1761838, 1.154157, -0.9961989, 0, 1, 0.4666667, 1,
-0.1739615, 1.823812, -0.3307654, 0, 1, 0.4705882, 1,
-0.1738169, -1.29997, -4.134124, 0, 1, 0.4784314, 1,
-0.1720136, 1.065486, 0.615517, 0, 1, 0.4823529, 1,
-0.1650863, -0.8159185, -2.759372, 0, 1, 0.4901961, 1,
-0.1529133, 0.3947088, -1.20277, 0, 1, 0.4941176, 1,
-0.1525922, -0.6003654, -4.574098, 0, 1, 0.5019608, 1,
-0.151392, 2.106729, 2.20418, 0, 1, 0.509804, 1,
-0.1510536, -0.1714474, -2.809945, 0, 1, 0.5137255, 1,
-0.1459223, 0.8647991, 0.7119366, 0, 1, 0.5215687, 1,
-0.1454587, 0.2532974, -0.7484296, 0, 1, 0.5254902, 1,
-0.1440165, -0.0846471, -2.794325, 0, 1, 0.5333334, 1,
-0.1436909, -2.414307, -4.280231, 0, 1, 0.5372549, 1,
-0.1423147, -1.620627, -3.775059, 0, 1, 0.5450981, 1,
-0.1418948, -0.07416835, -1.656615, 0, 1, 0.5490196, 1,
-0.1415186, -0.1389243, -3.981303, 0, 1, 0.5568628, 1,
-0.1360712, -1.144646, -3.267901, 0, 1, 0.5607843, 1,
-0.1310382, 1.080361, 0.1185062, 0, 1, 0.5686275, 1,
-0.1304131, -1.875066, -3.268736, 0, 1, 0.572549, 1,
-0.1303407, 1.348244, -1.654474, 0, 1, 0.5803922, 1,
-0.1296632, -0.5514104, -2.556396, 0, 1, 0.5843138, 1,
-0.1241756, 0.1118457, -2.889733, 0, 1, 0.5921569, 1,
-0.1210555, -0.5826885, -1.679284, 0, 1, 0.5960785, 1,
-0.118279, -0.284059, -2.742509, 0, 1, 0.6039216, 1,
-0.1134767, 1.020358, 0.2848143, 0, 1, 0.6117647, 1,
-0.1104171, -1.576383, -2.607537, 0, 1, 0.6156863, 1,
-0.1075077, -0.06363446, -2.689901, 0, 1, 0.6235294, 1,
-0.1066167, -0.3968828, -3.235152, 0, 1, 0.627451, 1,
-0.1063801, 0.6247057, -2.047502, 0, 1, 0.6352941, 1,
-0.1060571, -1.776671, -3.669146, 0, 1, 0.6392157, 1,
-0.09981057, -0.1958674, -3.418586, 0, 1, 0.6470588, 1,
-0.09809958, -0.1234783, -1.432721, 0, 1, 0.6509804, 1,
-0.09671549, 1.700843, 1.084385, 0, 1, 0.6588235, 1,
-0.09631565, -1.028929, -3.441087, 0, 1, 0.6627451, 1,
-0.09576552, -1.542597, -3.04746, 0, 1, 0.6705883, 1,
-0.0949294, 1.682823, 0.2377111, 0, 1, 0.6745098, 1,
-0.0885764, 0.7402325, -1.72202, 0, 1, 0.682353, 1,
-0.0882024, 0.4234977, -1.131588, 0, 1, 0.6862745, 1,
-0.08786911, 1.781611, -1.198534, 0, 1, 0.6941177, 1,
-0.08728455, 1.627719, -0.3662238, 0, 1, 0.7019608, 1,
-0.08588287, -1.046093, -5.672704, 0, 1, 0.7058824, 1,
-0.07781299, -0.8963772, -2.850439, 0, 1, 0.7137255, 1,
-0.07749857, 1.202075, 0.4997074, 0, 1, 0.7176471, 1,
-0.07555868, -0.4772878, -3.555331, 0, 1, 0.7254902, 1,
-0.07163964, 0.3629303, -0.7920393, 0, 1, 0.7294118, 1,
-0.07007774, 0.08928914, -0.5587686, 0, 1, 0.7372549, 1,
-0.06317615, -1.392392, -3.350883, 0, 1, 0.7411765, 1,
-0.05741664, 0.09910128, -0.05463628, 0, 1, 0.7490196, 1,
-0.05661954, 0.09405186, -0.9107965, 0, 1, 0.7529412, 1,
-0.05569175, -0.06525519, -3.073908, 0, 1, 0.7607843, 1,
-0.05557018, -1.220698, -5.880592, 0, 1, 0.7647059, 1,
-0.05387632, -2.026844, -2.547931, 0, 1, 0.772549, 1,
-0.04854559, 1.227815, -1.20123, 0, 1, 0.7764706, 1,
-0.04595989, 0.3909801, -0.2475343, 0, 1, 0.7843137, 1,
-0.04495468, -1.151542, -2.912289, 0, 1, 0.7882353, 1,
-0.03971106, -0.728201, -1.98646, 0, 1, 0.7960784, 1,
-0.03543194, -2.840697, -2.741179, 0, 1, 0.8039216, 1,
-0.0311392, -0.9798542, -3.086567, 0, 1, 0.8078431, 1,
-0.02951539, 0.4351803, -0.7609199, 0, 1, 0.8156863, 1,
-0.02593121, 0.4952686, -1.635983, 0, 1, 0.8196079, 1,
-0.02501357, -1.34452, -2.774259, 0, 1, 0.827451, 1,
-0.02498598, 0.8964738, -0.9580107, 0, 1, 0.8313726, 1,
-0.02486469, 1.218406, 0.1320246, 0, 1, 0.8392157, 1,
-0.02379994, 0.7525397, 1.271257, 0, 1, 0.8431373, 1,
-0.02160487, 1.364636, -1.034229, 0, 1, 0.8509804, 1,
-0.01583463, -0.2160743, -4.169795, 0, 1, 0.854902, 1,
-0.01336433, -0.006746243, -1.573539, 0, 1, 0.8627451, 1,
-0.009449766, -0.1677868, -2.718824, 0, 1, 0.8666667, 1,
-0.008802085, -0.2077808, -4.008488, 0, 1, 0.8745098, 1,
-0.006213218, 2.645452, -0.2267716, 0, 1, 0.8784314, 1,
-0.001014008, 0.553108, -1.187819, 0, 1, 0.8862745, 1,
0.001102437, -0.6641737, 2.83579, 0, 1, 0.8901961, 1,
0.001629575, -0.3811276, 3.86945, 0, 1, 0.8980392, 1,
0.001851838, 0.2287168, -0.3665655, 0, 1, 0.9058824, 1,
0.00313129, -0.3297052, 3.12688, 0, 1, 0.9098039, 1,
0.003802216, -0.8625963, 3.872538, 0, 1, 0.9176471, 1,
0.005104156, -0.4058293, 3.386128, 0, 1, 0.9215686, 1,
0.006984874, -0.7805406, 4.676445, 0, 1, 0.9294118, 1,
0.01051739, 0.2930425, -1.034292, 0, 1, 0.9333333, 1,
0.01411022, 1.139351, 0.6593959, 0, 1, 0.9411765, 1,
0.01745429, 0.5519778, -0.5889171, 0, 1, 0.945098, 1,
0.01968198, -0.9575509, 3.357791, 0, 1, 0.9529412, 1,
0.0207523, 0.8074204, -0.5483832, 0, 1, 0.9568627, 1,
0.02381372, -1.523456, 1.521394, 0, 1, 0.9647059, 1,
0.02776633, 1.984065, -0.1419756, 0, 1, 0.9686275, 1,
0.02830835, 2.813895, -1.378672, 0, 1, 0.9764706, 1,
0.03692593, 0.008780682, 1.297292, 0, 1, 0.9803922, 1,
0.03903826, 0.8864868, 0.5933191, 0, 1, 0.9882353, 1,
0.040139, 1.338416, 0.7239869, 0, 1, 0.9921569, 1,
0.04552609, -0.4491843, 3.452244, 0, 1, 1, 1,
0.05020018, 0.3231429, -0.8714276, 0, 0.9921569, 1, 1,
0.05223355, -0.1439002, 1.168478, 0, 0.9882353, 1, 1,
0.05243521, -0.4753878, 1.726704, 0, 0.9803922, 1, 1,
0.05465041, 0.1236264, 0.2666657, 0, 0.9764706, 1, 1,
0.0555337, 0.3572598, 1.146858, 0, 0.9686275, 1, 1,
0.05570193, 0.3752576, 0.1411986, 0, 0.9647059, 1, 1,
0.0574988, -0.4797637, 2.646011, 0, 0.9568627, 1, 1,
0.06223174, -0.8710685, 1.600147, 0, 0.9529412, 1, 1,
0.06759116, -0.6860021, 2.015609, 0, 0.945098, 1, 1,
0.06968343, 0.1429194, -0.9695445, 0, 0.9411765, 1, 1,
0.06991794, 0.4820988, 0.9133869, 0, 0.9333333, 1, 1,
0.07005687, 0.3037691, 0.3346182, 0, 0.9294118, 1, 1,
0.07034657, -0.1198495, 2.493797, 0, 0.9215686, 1, 1,
0.07215454, 0.902232, 0.7859712, 0, 0.9176471, 1, 1,
0.07395104, 0.6119755, 0.4635165, 0, 0.9098039, 1, 1,
0.07517448, 0.8170207, 0.1208412, 0, 0.9058824, 1, 1,
0.0858869, 0.8567897, -0.7970282, 0, 0.8980392, 1, 1,
0.08942603, 1.116099, 1.566811, 0, 0.8901961, 1, 1,
0.09013201, 0.9468902, -1.396487, 0, 0.8862745, 1, 1,
0.09112865, 1.125332, 1.219515, 0, 0.8784314, 1, 1,
0.09180907, 0.8157012, 0.1227985, 0, 0.8745098, 1, 1,
0.09338848, 0.1951849, -1.17866, 0, 0.8666667, 1, 1,
0.09562395, 0.3694227, 0.05474709, 0, 0.8627451, 1, 1,
0.09788463, -2.372519, 2.750884, 0, 0.854902, 1, 1,
0.09817866, 0.5345642, -0.3855737, 0, 0.8509804, 1, 1,
0.09910133, -0.2972043, 3.730638, 0, 0.8431373, 1, 1,
0.100418, 0.7149375, -0.5564328, 0, 0.8392157, 1, 1,
0.1018911, 1.772575, 0.4611326, 0, 0.8313726, 1, 1,
0.1020492, 0.743767, -2.036752, 0, 0.827451, 1, 1,
0.1042871, -0.03601634, 0.3179233, 0, 0.8196079, 1, 1,
0.1055369, 0.5515301, 0.4277438, 0, 0.8156863, 1, 1,
0.1089576, -0.1781742, 3.458683, 0, 0.8078431, 1, 1,
0.1094349, 1.733727, 1.808946, 0, 0.8039216, 1, 1,
0.1157944, 0.6267841, -0.9147407, 0, 0.7960784, 1, 1,
0.1218525, -0.7960571, 2.784001, 0, 0.7882353, 1, 1,
0.132255, -1.30577, 3.656777, 0, 0.7843137, 1, 1,
0.1326552, 0.6048561, -0.7238533, 0, 0.7764706, 1, 1,
0.1338198, -1.135686, 3.578727, 0, 0.772549, 1, 1,
0.1347423, 0.9985865, 1.257592, 0, 0.7647059, 1, 1,
0.1447318, -0.3157292, 0.5509903, 0, 0.7607843, 1, 1,
0.1461683, 0.4806805, -0.6473683, 0, 0.7529412, 1, 1,
0.1465171, 0.7254884, -0.5647593, 0, 0.7490196, 1, 1,
0.1520765, -1.341059, 2.892228, 0, 0.7411765, 1, 1,
0.1533196, -0.4038944, 4.215699, 0, 0.7372549, 1, 1,
0.1558244, 2.32353, -0.6239541, 0, 0.7294118, 1, 1,
0.1611396, -1.845668, 3.740654, 0, 0.7254902, 1, 1,
0.1647986, 0.3088423, 0.4158198, 0, 0.7176471, 1, 1,
0.1661265, -0.5350683, 3.971456, 0, 0.7137255, 1, 1,
0.1678307, -0.9173582, 3.4682, 0, 0.7058824, 1, 1,
0.1686347, -0.203073, 3.40711, 0, 0.6980392, 1, 1,
0.1691874, -0.404132, 1.922279, 0, 0.6941177, 1, 1,
0.1696339, 0.9350351, -0.8486397, 0, 0.6862745, 1, 1,
0.1721692, 0.5013516, -1.257962, 0, 0.682353, 1, 1,
0.1743158, -1.396642, 3.681411, 0, 0.6745098, 1, 1,
0.1817083, -0.8085699, 2.213263, 0, 0.6705883, 1, 1,
0.1859377, -0.4961062, 1.283509, 0, 0.6627451, 1, 1,
0.1867681, 0.9301191, 2.358546, 0, 0.6588235, 1, 1,
0.1905372, -0.4037477, 3.879933, 0, 0.6509804, 1, 1,
0.1908172, 1.286205, -1.329772, 0, 0.6470588, 1, 1,
0.1936918, 1.001544, -1.070442, 0, 0.6392157, 1, 1,
0.196438, -1.148603, 1.424117, 0, 0.6352941, 1, 1,
0.202683, -0.05701392, 0.4457443, 0, 0.627451, 1, 1,
0.2081395, -0.716692, 3.586308, 0, 0.6235294, 1, 1,
0.214071, -0.6513814, 2.861836, 0, 0.6156863, 1, 1,
0.2162772, -1.025343, 3.821512, 0, 0.6117647, 1, 1,
0.2220651, -0.5187708, 3.42601, 0, 0.6039216, 1, 1,
0.2244727, 0.223753, 0.3570222, 0, 0.5960785, 1, 1,
0.2266404, 0.3884419, -0.3399457, 0, 0.5921569, 1, 1,
0.2300642, 1.389824, -1.947499, 0, 0.5843138, 1, 1,
0.2342909, -1.764925, 2.921666, 0, 0.5803922, 1, 1,
0.2350247, -0.4738649, 2.367506, 0, 0.572549, 1, 1,
0.2366168, -1.222291, 3.96236, 0, 0.5686275, 1, 1,
0.2392701, 0.7624174, 1.498765, 0, 0.5607843, 1, 1,
0.2452011, 0.5732789, 1.204651, 0, 0.5568628, 1, 1,
0.2467268, 0.6655997, -0.3130038, 0, 0.5490196, 1, 1,
0.2494001, -0.1621546, 1.355152, 0, 0.5450981, 1, 1,
0.2500886, 0.3101219, -0.5182092, 0, 0.5372549, 1, 1,
0.2503273, -0.6485174, 2.252738, 0, 0.5333334, 1, 1,
0.2535254, 0.3422297, 1.272455, 0, 0.5254902, 1, 1,
0.2538963, -0.01648024, 2.937899, 0, 0.5215687, 1, 1,
0.2612803, 0.7942055, 1.583941, 0, 0.5137255, 1, 1,
0.2632932, -0.3141134, 2.320891, 0, 0.509804, 1, 1,
0.2634678, 0.8401579, 1.855014, 0, 0.5019608, 1, 1,
0.2635259, 0.6926295, -0.2250673, 0, 0.4941176, 1, 1,
0.2638145, -0.2600039, 2.620149, 0, 0.4901961, 1, 1,
0.2653999, -1.393849, 2.338803, 0, 0.4823529, 1, 1,
0.2654031, -1.608768, 3.03324, 0, 0.4784314, 1, 1,
0.2659248, 0.9879147, -0.3825122, 0, 0.4705882, 1, 1,
0.2718024, 0.07683868, -0.4806875, 0, 0.4666667, 1, 1,
0.2758499, 0.2689777, 1.219697, 0, 0.4588235, 1, 1,
0.2762917, 2.167706, -1.32432, 0, 0.454902, 1, 1,
0.279682, -1.820266, 2.643922, 0, 0.4470588, 1, 1,
0.2797622, -0.03401086, 1.595071, 0, 0.4431373, 1, 1,
0.2809817, -0.7756661, 3.169899, 0, 0.4352941, 1, 1,
0.2839871, -0.009198348, 1.580658, 0, 0.4313726, 1, 1,
0.2846136, 3.119333, 0.6290723, 0, 0.4235294, 1, 1,
0.2872517, 2.421385, 0.5086719, 0, 0.4196078, 1, 1,
0.2882118, 0.07809904, 1.433286, 0, 0.4117647, 1, 1,
0.2891591, -0.8415607, 2.099576, 0, 0.4078431, 1, 1,
0.2892935, 1.206774, -1.008247, 0, 0.4, 1, 1,
0.2916099, 1.881011, 0.2809916, 0, 0.3921569, 1, 1,
0.2932398, -0.2268208, 1.892584, 0, 0.3882353, 1, 1,
0.294849, 1.669428, 1.038942, 0, 0.3803922, 1, 1,
0.2999183, -0.6655563, 4.104097, 0, 0.3764706, 1, 1,
0.3007419, -0.2309749, 2.59112, 0, 0.3686275, 1, 1,
0.3069582, 0.7445607, -0.3745595, 0, 0.3647059, 1, 1,
0.3076611, -0.2185642, 2.022914, 0, 0.3568628, 1, 1,
0.308889, -0.1718379, 1.389244, 0, 0.3529412, 1, 1,
0.3096544, -0.3127843, 3.274023, 0, 0.345098, 1, 1,
0.3102643, 0.4903669, 0.1216547, 0, 0.3411765, 1, 1,
0.3184299, -1.547472, 4.377649, 0, 0.3333333, 1, 1,
0.3186883, -0.5194551, 2.200393, 0, 0.3294118, 1, 1,
0.3213851, -1.884969, 3.566386, 0, 0.3215686, 1, 1,
0.3225659, 0.6720905, 1.451309, 0, 0.3176471, 1, 1,
0.3228655, 0.9290168, 1.413411, 0, 0.3098039, 1, 1,
0.3255896, -1.659714, 2.251356, 0, 0.3058824, 1, 1,
0.3270991, 1.002166, -0.7013368, 0, 0.2980392, 1, 1,
0.3283119, 0.1171832, 1.429996, 0, 0.2901961, 1, 1,
0.3366695, -0.264413, 2.31385, 0, 0.2862745, 1, 1,
0.3382617, -0.4342349, 1.334245, 0, 0.2784314, 1, 1,
0.3413152, 1.243453, 0.9316, 0, 0.2745098, 1, 1,
0.3454236, -0.6182742, 1.435259, 0, 0.2666667, 1, 1,
0.3455486, 1.678373, 0.3081312, 0, 0.2627451, 1, 1,
0.3464393, 0.04503148, 1.097603, 0, 0.254902, 1, 1,
0.3479369, -0.5916904, 1.580748, 0, 0.2509804, 1, 1,
0.3480013, -1.149056, 2.343795, 0, 0.2431373, 1, 1,
0.3507947, 1.23665, 0.9115931, 0, 0.2392157, 1, 1,
0.3510657, 0.4699877, 0.4079868, 0, 0.2313726, 1, 1,
0.3557175, 0.6630754, 0.1168792, 0, 0.227451, 1, 1,
0.3642972, -0.4580694, 2.181057, 0, 0.2196078, 1, 1,
0.3657927, -0.3903184, 1.392378, 0, 0.2156863, 1, 1,
0.3701137, -0.8703903, 1.173008, 0, 0.2078431, 1, 1,
0.3705896, 1.254025, -0.5707887, 0, 0.2039216, 1, 1,
0.3757634, 0.1737456, 0.5300003, 0, 0.1960784, 1, 1,
0.3760067, -0.7744653, 3.01113, 0, 0.1882353, 1, 1,
0.3793359, -0.3533357, 1.878467, 0, 0.1843137, 1, 1,
0.382347, -0.5325001, 3.200026, 0, 0.1764706, 1, 1,
0.383205, 0.9588308, 0.2031012, 0, 0.172549, 1, 1,
0.3836789, -0.05929624, 0.5996267, 0, 0.1647059, 1, 1,
0.3896395, 2.394151, 0.2051481, 0, 0.1607843, 1, 1,
0.3899987, -0.3376722, 2.40557, 0, 0.1529412, 1, 1,
0.390958, -2.026421, 3.376503, 0, 0.1490196, 1, 1,
0.396116, 0.4112449, 0.3733259, 0, 0.1411765, 1, 1,
0.3964935, 1.174714, -0.4280125, 0, 0.1372549, 1, 1,
0.397465, 1.079023, -1.148788, 0, 0.1294118, 1, 1,
0.401949, -1.7658, 2.232295, 0, 0.1254902, 1, 1,
0.4069698, 1.210017, 0.626103, 0, 0.1176471, 1, 1,
0.4107459, 1.504631, -0.3079055, 0, 0.1137255, 1, 1,
0.4124217, -1.02537, 1.612221, 0, 0.1058824, 1, 1,
0.4137564, -0.7323586, 2.684713, 0, 0.09803922, 1, 1,
0.4137903, 0.1507303, 1.297877, 0, 0.09411765, 1, 1,
0.4174005, -0.8654674, 3.52338, 0, 0.08627451, 1, 1,
0.4205345, -0.413697, 2.108462, 0, 0.08235294, 1, 1,
0.4208792, 0.06263269, 1.492394, 0, 0.07450981, 1, 1,
0.4246045, -0.005455361, 1.507233, 0, 0.07058824, 1, 1,
0.4279225, 0.5291998, 0.8031678, 0, 0.0627451, 1, 1,
0.429886, 1.799142, 0.4471222, 0, 0.05882353, 1, 1,
0.431346, 0.07234026, 0.4626733, 0, 0.05098039, 1, 1,
0.4331828, 0.9694358, 0.6780156, 0, 0.04705882, 1, 1,
0.4344224, 0.3585241, 0.7787248, 0, 0.03921569, 1, 1,
0.4372416, -0.1297317, 2.111918, 0, 0.03529412, 1, 1,
0.45077, -0.09753161, 0.6746225, 0, 0.02745098, 1, 1,
0.4525953, 0.4813765, 0.3688533, 0, 0.02352941, 1, 1,
0.4611031, 0.1378869, -0.6592928, 0, 0.01568628, 1, 1,
0.4624453, -0.9894186, 5.604085, 0, 0.01176471, 1, 1,
0.4632339, -0.4199953, 3.50603, 0, 0.003921569, 1, 1,
0.4639795, -1.786739, 3.018187, 0.003921569, 0, 1, 1,
0.464155, 0.07943846, 2.178624, 0.007843138, 0, 1, 1,
0.469772, 0.9166753, -0.389635, 0.01568628, 0, 1, 1,
0.4698907, 0.2881041, 2.302056, 0.01960784, 0, 1, 1,
0.4705402, -0.867107, 3.452005, 0.02745098, 0, 1, 1,
0.4758889, 0.1946772, 0.00772707, 0.03137255, 0, 1, 1,
0.4769422, -0.9627872, 2.78108, 0.03921569, 0, 1, 1,
0.4784953, -0.3439777, 1.939369, 0.04313726, 0, 1, 1,
0.4792717, -0.1955785, 1.845191, 0.05098039, 0, 1, 1,
0.4840073, -3.390312, 1.863175, 0.05490196, 0, 1, 1,
0.4887106, -0.2997209, 2.423948, 0.0627451, 0, 1, 1,
0.490434, -0.5771685, 3.501345, 0.06666667, 0, 1, 1,
0.4924732, 0.004252052, 0.6092338, 0.07450981, 0, 1, 1,
0.4945087, 0.06883205, 3.175457, 0.07843138, 0, 1, 1,
0.4977813, 0.8154971, -0.9656661, 0.08627451, 0, 1, 1,
0.498394, 1.870939, 0.7597011, 0.09019608, 0, 1, 1,
0.4990655, -0.4722986, 1.566541, 0.09803922, 0, 1, 1,
0.5022593, 0.2713307, 1.453963, 0.1058824, 0, 1, 1,
0.5054116, 0.7840947, 0.9344325, 0.1098039, 0, 1, 1,
0.5063056, 0.9000416, 1.306385, 0.1176471, 0, 1, 1,
0.5070406, -0.829073, 1.609974, 0.1215686, 0, 1, 1,
0.507084, 0.4009645, 2.120969, 0.1294118, 0, 1, 1,
0.5071465, 0.1086391, 0.8832034, 0.1333333, 0, 1, 1,
0.5082011, 0.1447043, 1.716147, 0.1411765, 0, 1, 1,
0.5101318, 2.678391, -1.203916, 0.145098, 0, 1, 1,
0.5123893, -0.2612083, 2.4461, 0.1529412, 0, 1, 1,
0.5173711, 1.02033, 3.300556, 0.1568628, 0, 1, 1,
0.5181642, -1.566033, 3.805277, 0.1647059, 0, 1, 1,
0.5230583, 0.4220682, 0.8908687, 0.1686275, 0, 1, 1,
0.5279558, 1.108835, 1.199518, 0.1764706, 0, 1, 1,
0.5305749, 1.040579, 1.130859, 0.1803922, 0, 1, 1,
0.5353226, 1.343112, 0.1268355, 0.1882353, 0, 1, 1,
0.538461, -1.70061, 4.761501, 0.1921569, 0, 1, 1,
0.5437091, -0.4482033, 1.410876, 0.2, 0, 1, 1,
0.5493652, 0.06691109, -0.1657257, 0.2078431, 0, 1, 1,
0.5528457, -0.6322483, 2.067449, 0.2117647, 0, 1, 1,
0.558358, -0.3982294, 0.2811511, 0.2196078, 0, 1, 1,
0.559561, 0.943538, -0.1327893, 0.2235294, 0, 1, 1,
0.5596078, 0.917963, -0.4266864, 0.2313726, 0, 1, 1,
0.5718715, -3.651211, 4.159066, 0.2352941, 0, 1, 1,
0.5727698, 1.145426, 0.708348, 0.2431373, 0, 1, 1,
0.5730103, -0.0170042, 2.867983, 0.2470588, 0, 1, 1,
0.5735281, 0.2521157, 0.591548, 0.254902, 0, 1, 1,
0.5791174, 0.02462945, 1.258525, 0.2588235, 0, 1, 1,
0.5873839, -0.3033542, 0.6701987, 0.2666667, 0, 1, 1,
0.5947376, -0.6548547, 1.908488, 0.2705882, 0, 1, 1,
0.5973746, 0.04850084, 2.198795, 0.2784314, 0, 1, 1,
0.6029784, -0.3625495, 3.235077, 0.282353, 0, 1, 1,
0.606209, 1.128417, 0.3145729, 0.2901961, 0, 1, 1,
0.614924, -1.832244, 3.346305, 0.2941177, 0, 1, 1,
0.6159289, 0.4847589, 1.007361, 0.3019608, 0, 1, 1,
0.6197738, -1.049762, 1.489712, 0.3098039, 0, 1, 1,
0.620503, -0.0206312, -0.02895084, 0.3137255, 0, 1, 1,
0.6254106, -1.609316, 4.309526, 0.3215686, 0, 1, 1,
0.629326, 1.209621, 0.3967446, 0.3254902, 0, 1, 1,
0.6377761, -0.3409687, 1.129773, 0.3333333, 0, 1, 1,
0.638697, 0.1743003, 0.2056141, 0.3372549, 0, 1, 1,
0.6413798, 1.028276, 0.631839, 0.345098, 0, 1, 1,
0.6423982, 0.513858, 1.463593, 0.3490196, 0, 1, 1,
0.6429697, 0.2458006, 2.361725, 0.3568628, 0, 1, 1,
0.6447219, -0.9528627, 2.941391, 0.3607843, 0, 1, 1,
0.6466078, -0.9072241, 3.47961, 0.3686275, 0, 1, 1,
0.6478629, -0.3165294, 2.456567, 0.372549, 0, 1, 1,
0.6503924, -0.4484193, 1.458726, 0.3803922, 0, 1, 1,
0.655748, 0.5339406, 1.44242, 0.3843137, 0, 1, 1,
0.6570484, -0.4478194, 0.8798912, 0.3921569, 0, 1, 1,
0.6589231, 1.082774, 0.2846498, 0.3960784, 0, 1, 1,
0.6650679, 0.8839604, 0.1534191, 0.4039216, 0, 1, 1,
0.6685383, -0.7661873, 2.514889, 0.4117647, 0, 1, 1,
0.6695037, 0.3247534, 0.6037123, 0.4156863, 0, 1, 1,
0.6732675, -0.3799678, 2.517081, 0.4235294, 0, 1, 1,
0.6735641, -0.3120459, 1.518522, 0.427451, 0, 1, 1,
0.6781983, 0.1629313, 1.078542, 0.4352941, 0, 1, 1,
0.6795971, 1.25275, 0.007140168, 0.4392157, 0, 1, 1,
0.6847237, -0.5630513, 1.719445, 0.4470588, 0, 1, 1,
0.6910592, 0.7981194, 2.086507, 0.4509804, 0, 1, 1,
0.6919273, 0.4073413, 4.11521, 0.4588235, 0, 1, 1,
0.7009929, 0.8403954, 1.352424, 0.4627451, 0, 1, 1,
0.7026392, 0.2954963, 1.885985, 0.4705882, 0, 1, 1,
0.7058849, 0.9151295, 0.4991403, 0.4745098, 0, 1, 1,
0.7060747, 1.434732, 1.760879, 0.4823529, 0, 1, 1,
0.7066506, -0.9927906, 2.295112, 0.4862745, 0, 1, 1,
0.7100751, 1.934738, 0.850573, 0.4941176, 0, 1, 1,
0.7134753, -0.5464749, 3.42345, 0.5019608, 0, 1, 1,
0.7145719, -1.120816, 1.653316, 0.5058824, 0, 1, 1,
0.7146963, -1.013148, 2.802057, 0.5137255, 0, 1, 1,
0.7159345, 0.6634309, 2.461441, 0.5176471, 0, 1, 1,
0.7234044, 0.06792817, 0.7700922, 0.5254902, 0, 1, 1,
0.7275111, 1.291919, 0.8884477, 0.5294118, 0, 1, 1,
0.7278422, -1.053238, 4.193346, 0.5372549, 0, 1, 1,
0.7302198, 0.4579614, 0.5109017, 0.5411765, 0, 1, 1,
0.7325636, 0.848197, 0.117773, 0.5490196, 0, 1, 1,
0.7327447, -2.326124, 3.246618, 0.5529412, 0, 1, 1,
0.7355446, -0.4793511, 2.441921, 0.5607843, 0, 1, 1,
0.7360973, 1.757581, -1.407315, 0.5647059, 0, 1, 1,
0.7370189, 1.918659, -0.9240893, 0.572549, 0, 1, 1,
0.7451462, -0.2876301, 1.83808, 0.5764706, 0, 1, 1,
0.7499802, 0.3077295, 0.6925462, 0.5843138, 0, 1, 1,
0.7506173, 0.5822502, 0.7297391, 0.5882353, 0, 1, 1,
0.7512745, -0.2574511, 1.30302, 0.5960785, 0, 1, 1,
0.7595337, -0.3231404, 1.43803, 0.6039216, 0, 1, 1,
0.7606891, 0.7138317, 0.5764738, 0.6078432, 0, 1, 1,
0.7643552, -1.677754, 4.283672, 0.6156863, 0, 1, 1,
0.7676557, -2.139105, 4.231483, 0.6196079, 0, 1, 1,
0.767673, -0.07877555, 2.596482, 0.627451, 0, 1, 1,
0.7690828, -0.4334846, 3.05046, 0.6313726, 0, 1, 1,
0.7794966, 0.1060212, 2.722492, 0.6392157, 0, 1, 1,
0.7815473, 1.473991, -0.1788639, 0.6431373, 0, 1, 1,
0.7832968, 0.5399563, 0.357511, 0.6509804, 0, 1, 1,
0.7895809, -0.8844984, 2.194614, 0.654902, 0, 1, 1,
0.7909414, 1.303401, 0.8082814, 0.6627451, 0, 1, 1,
0.7922953, -0.7882602, 2.971375, 0.6666667, 0, 1, 1,
0.7928532, -0.4874546, 3.864679, 0.6745098, 0, 1, 1,
0.7949058, 0.2161549, 0.6050309, 0.6784314, 0, 1, 1,
0.7950805, 0.09716024, 0.9784476, 0.6862745, 0, 1, 1,
0.7970629, -1.358513, 2.476237, 0.6901961, 0, 1, 1,
0.8016116, -0.1850672, 0.2954448, 0.6980392, 0, 1, 1,
0.8037975, 1.28732, -1.52009, 0.7058824, 0, 1, 1,
0.8067157, 0.914387, 1.653007, 0.7098039, 0, 1, 1,
0.8087686, 1.816645, -0.6248735, 0.7176471, 0, 1, 1,
0.8133515, 2.190387, 0.6185767, 0.7215686, 0, 1, 1,
0.8152002, -1.0686, 2.462693, 0.7294118, 0, 1, 1,
0.8246621, 0.5658002, 0.6461349, 0.7333333, 0, 1, 1,
0.8282214, 0.2478835, 1.722382, 0.7411765, 0, 1, 1,
0.8329728, -0.07301438, 0.9147688, 0.7450981, 0, 1, 1,
0.8341216, 0.2339699, 1.372279, 0.7529412, 0, 1, 1,
0.838483, 0.7463072, 0.4775033, 0.7568628, 0, 1, 1,
0.8395987, -1.265491, 2.564937, 0.7647059, 0, 1, 1,
0.8420709, 1.090432, -0.09241016, 0.7686275, 0, 1, 1,
0.8476804, -0.5289845, 3.115197, 0.7764706, 0, 1, 1,
0.8493597, 0.7602309, 1.859471, 0.7803922, 0, 1, 1,
0.8495165, 0.5336057, 0.8168098, 0.7882353, 0, 1, 1,
0.8496509, 2.333112, 2.122175, 0.7921569, 0, 1, 1,
0.8660962, -0.9207795, 1.890067, 0.8, 0, 1, 1,
0.8670055, 0.2054847, 1.238328, 0.8078431, 0, 1, 1,
0.8815859, 0.2407519, 2.063689, 0.8117647, 0, 1, 1,
0.885999, 0.3086557, 2.579113, 0.8196079, 0, 1, 1,
0.891154, -0.8431516, 1.859473, 0.8235294, 0, 1, 1,
0.8915875, -0.4026466, 1.981489, 0.8313726, 0, 1, 1,
0.8969532, -0.08710441, 1.507058, 0.8352941, 0, 1, 1,
0.9050597, 0.6339122, 1.289763, 0.8431373, 0, 1, 1,
0.9082674, 0.869265, 0.04132793, 0.8470588, 0, 1, 1,
0.9102947, -0.8547107, -0.3670394, 0.854902, 0, 1, 1,
0.9259875, 0.7539328, 0.1477499, 0.8588235, 0, 1, 1,
0.9269105, 1.021207, 1.298743, 0.8666667, 0, 1, 1,
0.9300168, 0.9321649, -0.01153584, 0.8705882, 0, 1, 1,
0.9353139, -0.1945129, 0.926118, 0.8784314, 0, 1, 1,
0.9363884, 0.7195396, -0.2903752, 0.8823529, 0, 1, 1,
0.942034, 0.4174159, 0.8144355, 0.8901961, 0, 1, 1,
0.9558817, -0.2572411, 2.546226, 0.8941177, 0, 1, 1,
0.9647275, 0.1372488, 0.08316115, 0.9019608, 0, 1, 1,
0.9742231, 0.09581474, 0.8972978, 0.9098039, 0, 1, 1,
0.9902061, -1.386088, 2.362924, 0.9137255, 0, 1, 1,
0.9906141, 0.361605, 1.77722, 0.9215686, 0, 1, 1,
0.9907774, 0.1188793, 1.507449, 0.9254902, 0, 1, 1,
1.005355, -0.1851685, 3.224306, 0.9333333, 0, 1, 1,
1.007714, -0.9239001, 2.27828, 0.9372549, 0, 1, 1,
1.009581, -0.6181748, 0.2420462, 0.945098, 0, 1, 1,
1.011337, 0.564861, 0.9899163, 0.9490196, 0, 1, 1,
1.012285, -1.611182, 2.845114, 0.9568627, 0, 1, 1,
1.013735, -1.257516, 1.345946, 0.9607843, 0, 1, 1,
1.016446, -0.600793, 1.701801, 0.9686275, 0, 1, 1,
1.016545, -0.8306352, 2.036801, 0.972549, 0, 1, 1,
1.016762, -1.058631, 3.351547, 0.9803922, 0, 1, 1,
1.020485, -0.8269, 2.207382, 0.9843137, 0, 1, 1,
1.021172, 0.4382313, 0.007418086, 0.9921569, 0, 1, 1,
1.029768, -0.3750672, 0.1739796, 0.9960784, 0, 1, 1,
1.034882, -0.3950065, 2.433815, 1, 0, 0.9960784, 1,
1.035243, -1.057889, 4.653246, 1, 0, 0.9882353, 1,
1.036848, 0.3467523, 1.398131, 1, 0, 0.9843137, 1,
1.037721, -1.08996, 2.244589, 1, 0, 0.9764706, 1,
1.045099, 0.4821443, 2.210341, 1, 0, 0.972549, 1,
1.051668, -1.456195, 3.347042, 1, 0, 0.9647059, 1,
1.05428, 0.7121646, 0.0008105416, 1, 0, 0.9607843, 1,
1.065423, 0.8784677, -0.1830382, 1, 0, 0.9529412, 1,
1.066798, 0.5235563, 1.166561, 1, 0, 0.9490196, 1,
1.068768, -1.355057, 2.937091, 1, 0, 0.9411765, 1,
1.069554, -1.86161, 3.063086, 1, 0, 0.9372549, 1,
1.070861, -0.5412008, 2.858449, 1, 0, 0.9294118, 1,
1.079867, -0.4126499, 3.889944, 1, 0, 0.9254902, 1,
1.083246, -1.818657, 2.533275, 1, 0, 0.9176471, 1,
1.092223, 0.6345484, 0.6216084, 1, 0, 0.9137255, 1,
1.105844, -0.01620203, 1.316342, 1, 0, 0.9058824, 1,
1.12842, 0.1908152, 0.9070145, 1, 0, 0.9019608, 1,
1.128906, 0.03037292, 0.702175, 1, 0, 0.8941177, 1,
1.135017, -0.6453204, 1.841144, 1, 0, 0.8862745, 1,
1.135557, -1.253813, 3.061357, 1, 0, 0.8823529, 1,
1.147478, -0.9837235, 4.100514, 1, 0, 0.8745098, 1,
1.155787, -0.6506368, 1.664259, 1, 0, 0.8705882, 1,
1.158501, 0.7977231, 2.319416, 1, 0, 0.8627451, 1,
1.159891, -0.5198331, 1.04257, 1, 0, 0.8588235, 1,
1.163051, -0.06490365, 1.225979, 1, 0, 0.8509804, 1,
1.166157, -0.03161031, 0.533196, 1, 0, 0.8470588, 1,
1.180949, 0.7320217, 1.542284, 1, 0, 0.8392157, 1,
1.183332, -0.6002146, 0.01311382, 1, 0, 0.8352941, 1,
1.18795, -0.4833466, 2.560263, 1, 0, 0.827451, 1,
1.188691, -0.6943122, 4.15179, 1, 0, 0.8235294, 1,
1.195402, 0.8427452, 0.4758342, 1, 0, 0.8156863, 1,
1.199749, 0.227562, -0.5007203, 1, 0, 0.8117647, 1,
1.20194, -0.9763985, 1.708061, 1, 0, 0.8039216, 1,
1.219147, 1.486526, 1.333648, 1, 0, 0.7960784, 1,
1.219635, -0.8201976, 2.603965, 1, 0, 0.7921569, 1,
1.22126, 1.391787, -0.9178826, 1, 0, 0.7843137, 1,
1.240339, 0.3546416, 3.332758, 1, 0, 0.7803922, 1,
1.241229, -0.02614182, 2.92536, 1, 0, 0.772549, 1,
1.243691, -1.491106, 0.1685643, 1, 0, 0.7686275, 1,
1.244434, -1.079399, 1.440329, 1, 0, 0.7607843, 1,
1.250302, -2.161727, 3.436261, 1, 0, 0.7568628, 1,
1.257607, 0.6708043, 1.108406, 1, 0, 0.7490196, 1,
1.261203, 0.2883855, 2.610797, 1, 0, 0.7450981, 1,
1.265858, -1.052806, 2.656434, 1, 0, 0.7372549, 1,
1.267553, -1.823124, 2.135754, 1, 0, 0.7333333, 1,
1.26907, 0.07892481, 2.07595, 1, 0, 0.7254902, 1,
1.274745, -0.6641143, 2.43395, 1, 0, 0.7215686, 1,
1.276929, 1.084326, 2.178241, 1, 0, 0.7137255, 1,
1.276932, 1.478873, 2.622957, 1, 0, 0.7098039, 1,
1.282835, -0.9383548, 1.321019, 1, 0, 0.7019608, 1,
1.286241, -0.6089113, 2.078296, 1, 0, 0.6941177, 1,
1.287121, 2.314694, -1.110404, 1, 0, 0.6901961, 1,
1.298983, -1.167597, 3.438844, 1, 0, 0.682353, 1,
1.302223, 0.1450296, 1.824251, 1, 0, 0.6784314, 1,
1.302548, -1.26801, 0.8889911, 1, 0, 0.6705883, 1,
1.307778, 0.1771901, 2.758054, 1, 0, 0.6666667, 1,
1.321097, 0.2462163, 0.9466991, 1, 0, 0.6588235, 1,
1.325534, 1.636152, 0.2705255, 1, 0, 0.654902, 1,
1.330103, 0.231707, 0.2545856, 1, 0, 0.6470588, 1,
1.331701, -0.3461107, 2.684682, 1, 0, 0.6431373, 1,
1.335915, -0.8475353, 1.067472, 1, 0, 0.6352941, 1,
1.336905, 0.3473903, 2.376013, 1, 0, 0.6313726, 1,
1.350811, 0.2622491, 4.135999, 1, 0, 0.6235294, 1,
1.353469, 0.5672692, 1.761846, 1, 0, 0.6196079, 1,
1.361966, 1.297647, -0.4888623, 1, 0, 0.6117647, 1,
1.366424, -0.1606056, 0.2430319, 1, 0, 0.6078432, 1,
1.367406, -0.004855343, 1.136014, 1, 0, 0.6, 1,
1.367932, 0.2747129, 1.172313, 1, 0, 0.5921569, 1,
1.369584, 0.9906213, -0.04373343, 1, 0, 0.5882353, 1,
1.375717, 0.4116593, 0.9295531, 1, 0, 0.5803922, 1,
1.402756, 3.123235, 1.23331, 1, 0, 0.5764706, 1,
1.404526, 1.122565, 1.35009, 1, 0, 0.5686275, 1,
1.411044, -0.9136794, 3.167047, 1, 0, 0.5647059, 1,
1.414862, -0.1150974, 3.330468, 1, 0, 0.5568628, 1,
1.418782, -1.337808, 3.275924, 1, 0, 0.5529412, 1,
1.42098, -1.208931, 2.1558, 1, 0, 0.5450981, 1,
1.430519, -1.420806, 0.6400898, 1, 0, 0.5411765, 1,
1.434477, 0.4192839, 0.1480613, 1, 0, 0.5333334, 1,
1.436429, -1.226674, 1.149798, 1, 0, 0.5294118, 1,
1.451584, 1.03813, 0.3545936, 1, 0, 0.5215687, 1,
1.452103, -1.531727, 1.541241, 1, 0, 0.5176471, 1,
1.460612, 0.9824791, 2.626431, 1, 0, 0.509804, 1,
1.463918, 0.1968132, 0.2307838, 1, 0, 0.5058824, 1,
1.46704, -1.229886, 2.522273, 1, 0, 0.4980392, 1,
1.46973, -1.318156, 1.801985, 1, 0, 0.4901961, 1,
1.477201, 0.1846596, 0.7321669, 1, 0, 0.4862745, 1,
1.478204, -0.0523171, 1.506121, 1, 0, 0.4784314, 1,
1.49284, -0.06850108, 1.557591, 1, 0, 0.4745098, 1,
1.512235, 0.1039044, 3.157547, 1, 0, 0.4666667, 1,
1.513458, 0.1630428, 1.25167, 1, 0, 0.4627451, 1,
1.528363, 0.01219411, 1.890884, 1, 0, 0.454902, 1,
1.531135, 0.548008, 1.448967, 1, 0, 0.4509804, 1,
1.547564, 0.05384651, 1.067939, 1, 0, 0.4431373, 1,
1.556191, 0.1105233, 2.297513, 1, 0, 0.4392157, 1,
1.563527, 0.4007069, -0.1939016, 1, 0, 0.4313726, 1,
1.584221, 1.150757, 1.514392, 1, 0, 0.427451, 1,
1.586137, -1.035524, 1.892733, 1, 0, 0.4196078, 1,
1.588301, -0.3744351, 2.411086, 1, 0, 0.4156863, 1,
1.639042, 2.042494, -0.1441803, 1, 0, 0.4078431, 1,
1.664622, -0.3555733, 0.8655338, 1, 0, 0.4039216, 1,
1.665905, -1.758968, 4.042335, 1, 0, 0.3960784, 1,
1.667064, -0.7258837, 1.224498, 1, 0, 0.3882353, 1,
1.66731, 0.9532762, 2.479474, 1, 0, 0.3843137, 1,
1.670583, 0.891322, -0.1650465, 1, 0, 0.3764706, 1,
1.672445, -0.6619371, 1.004397, 1, 0, 0.372549, 1,
1.674374, 1.017144, 0.4597023, 1, 0, 0.3647059, 1,
1.676288, -0.1729598, 0.2307336, 1, 0, 0.3607843, 1,
1.676697, -1.602941, 3.07762, 1, 0, 0.3529412, 1,
1.683177, -1.879469, 2.112279, 1, 0, 0.3490196, 1,
1.684961, -2.118564, 2.849732, 1, 0, 0.3411765, 1,
1.696962, 0.4914694, 1.74218, 1, 0, 0.3372549, 1,
1.69843, 0.05844381, 2.71168, 1, 0, 0.3294118, 1,
1.710974, 1.683404, 1.378575, 1, 0, 0.3254902, 1,
1.711455, 0.1718373, 1.690648, 1, 0, 0.3176471, 1,
1.732006, -0.1413802, 2.099881, 1, 0, 0.3137255, 1,
1.73901, 0.2665381, 0.2433538, 1, 0, 0.3058824, 1,
1.75143, 0.893214, 1.122274, 1, 0, 0.2980392, 1,
1.779008, 1.868023, 0.3327664, 1, 0, 0.2941177, 1,
1.782864, 2.2413, 0.2522144, 1, 0, 0.2862745, 1,
1.783536, -1.392874, 3.61839, 1, 0, 0.282353, 1,
1.819182, 0.382911, 2.499338, 1, 0, 0.2745098, 1,
1.81935, -0.5630885, 1.86394, 1, 0, 0.2705882, 1,
1.825521, 1.273481, 0.9869515, 1, 0, 0.2627451, 1,
1.836941, -1.360389, 1.718473, 1, 0, 0.2588235, 1,
1.840545, -0.1742184, 1.664324, 1, 0, 0.2509804, 1,
1.841743, 0.8988842, -0.07880589, 1, 0, 0.2470588, 1,
1.853811, -0.06722175, 1.20061, 1, 0, 0.2392157, 1,
1.864616, 1.820192, 0.8620932, 1, 0, 0.2352941, 1,
1.867866, -0.2849025, 0.837535, 1, 0, 0.227451, 1,
1.880352, -1.580177, 1.388915, 1, 0, 0.2235294, 1,
1.883166, 0.07470155, 2.184958, 1, 0, 0.2156863, 1,
1.887293, -1.965071, -0.2910056, 1, 0, 0.2117647, 1,
1.898187, -1.620033, 2.588345, 1, 0, 0.2039216, 1,
1.918433, -0.8242318, 0.6602791, 1, 0, 0.1960784, 1,
1.929159, -1.231702, 2.27665, 1, 0, 0.1921569, 1,
1.953944, -0.5320847, 0.4016099, 1, 0, 0.1843137, 1,
1.956635, -0.3785841, 1.129789, 1, 0, 0.1803922, 1,
1.977299, 0.120624, 1.059141, 1, 0, 0.172549, 1,
2.000143, -0.1977512, 1.77216, 1, 0, 0.1686275, 1,
2.006532, 0.7019984, -0.5571141, 1, 0, 0.1607843, 1,
2.02335, 0.9984975, 0.9822879, 1, 0, 0.1568628, 1,
2.044973, 2.705593, 2.979561, 1, 0, 0.1490196, 1,
2.067969, 2.527017, 0.6188486, 1, 0, 0.145098, 1,
2.071862, -0.1176268, 2.701152, 1, 0, 0.1372549, 1,
2.07287, 0.8025844, 0.9845231, 1, 0, 0.1333333, 1,
2.074869, 0.8080317, -0.02358068, 1, 0, 0.1254902, 1,
2.202387, -0.04988321, 0.652061, 1, 0, 0.1215686, 1,
2.247376, -1.257046, 1.472719, 1, 0, 0.1137255, 1,
2.249369, 1.235942, 0.5310383, 1, 0, 0.1098039, 1,
2.263268, 0.5752633, 2.548892, 1, 0, 0.1019608, 1,
2.287715, -1.465725, 2.762967, 1, 0, 0.09411765, 1,
2.296655, 1.56369, 1.252271, 1, 0, 0.09019608, 1,
2.315846, 0.6706914, 1.801914, 1, 0, 0.08235294, 1,
2.370841, -3.51707, 1.458661, 1, 0, 0.07843138, 1,
2.459476, 0.09248082, 1.326798, 1, 0, 0.07058824, 1,
2.570551, -0.7480799, -0.06858723, 1, 0, 0.06666667, 1,
2.60787, -1.571554, 2.246384, 1, 0, 0.05882353, 1,
2.611753, -0.02702986, 0.5155382, 1, 0, 0.05490196, 1,
2.616419, 0.5270054, 1.35515, 1, 0, 0.04705882, 1,
2.712506, -1.939615, 2.665683, 1, 0, 0.04313726, 1,
2.717737, 1.052643, 2.995307, 1, 0, 0.03529412, 1,
2.818244, 0.05588269, 1.292092, 1, 0, 0.03137255, 1,
2.880704, -1.223203, 3.040148, 1, 0, 0.02352941, 1,
3.128125, 0.3648516, 0.8338137, 1, 0, 0.01960784, 1,
3.138135, 0.09457966, 2.418019, 1, 0, 0.01176471, 1,
3.33639, 0.6086327, 0.889397, 1, 0, 0.007843138, 1
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
-0.0707649, -4.799479, -8.513186, 0, -0.5, 0.5, 0.5,
-0.0707649, -4.799479, -8.513186, 1, -0.5, 0.5, 0.5,
-0.0707649, -4.799479, -8.513186, 1, 1.5, 0.5, 0.5,
-0.0707649, -4.799479, -8.513186, 0, 1.5, 0.5, 0.5
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
-4.632945, -0.2639878, -8.513186, 0, -0.5, 0.5, 0.5,
-4.632945, -0.2639878, -8.513186, 1, -0.5, 0.5, 0.5,
-4.632945, -0.2639878, -8.513186, 1, 1.5, 0.5, 0.5,
-4.632945, -0.2639878, -8.513186, 0, 1.5, 0.5, 0.5
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
-4.632945, -4.799479, -0.4315157, 0, -0.5, 0.5, 0.5,
-4.632945, -4.799479, -0.4315157, 1, -0.5, 0.5, 0.5,
-4.632945, -4.799479, -0.4315157, 1, 1.5, 0.5, 0.5,
-4.632945, -4.799479, -0.4315157, 0, 1.5, 0.5, 0.5
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
-3, -3.752827, -6.648185,
3, -3.752827, -6.648185,
-3, -3.752827, -6.648185,
-3, -3.927269, -6.959018,
-2, -3.752827, -6.648185,
-2, -3.927269, -6.959018,
-1, -3.752827, -6.648185,
-1, -3.927269, -6.959018,
0, -3.752827, -6.648185,
0, -3.927269, -6.959018,
1, -3.752827, -6.648185,
1, -3.927269, -6.959018,
2, -3.752827, -6.648185,
2, -3.927269, -6.959018,
3, -3.752827, -6.648185,
3, -3.927269, -6.959018
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
-3, -4.276154, -7.580685, 0, -0.5, 0.5, 0.5,
-3, -4.276154, -7.580685, 1, -0.5, 0.5, 0.5,
-3, -4.276154, -7.580685, 1, 1.5, 0.5, 0.5,
-3, -4.276154, -7.580685, 0, 1.5, 0.5, 0.5,
-2, -4.276154, -7.580685, 0, -0.5, 0.5, 0.5,
-2, -4.276154, -7.580685, 1, -0.5, 0.5, 0.5,
-2, -4.276154, -7.580685, 1, 1.5, 0.5, 0.5,
-2, -4.276154, -7.580685, 0, 1.5, 0.5, 0.5,
-1, -4.276154, -7.580685, 0, -0.5, 0.5, 0.5,
-1, -4.276154, -7.580685, 1, -0.5, 0.5, 0.5,
-1, -4.276154, -7.580685, 1, 1.5, 0.5, 0.5,
-1, -4.276154, -7.580685, 0, 1.5, 0.5, 0.5,
0, -4.276154, -7.580685, 0, -0.5, 0.5, 0.5,
0, -4.276154, -7.580685, 1, -0.5, 0.5, 0.5,
0, -4.276154, -7.580685, 1, 1.5, 0.5, 0.5,
0, -4.276154, -7.580685, 0, 1.5, 0.5, 0.5,
1, -4.276154, -7.580685, 0, -0.5, 0.5, 0.5,
1, -4.276154, -7.580685, 1, -0.5, 0.5, 0.5,
1, -4.276154, -7.580685, 1, 1.5, 0.5, 0.5,
1, -4.276154, -7.580685, 0, 1.5, 0.5, 0.5,
2, -4.276154, -7.580685, 0, -0.5, 0.5, 0.5,
2, -4.276154, -7.580685, 1, -0.5, 0.5, 0.5,
2, -4.276154, -7.580685, 1, 1.5, 0.5, 0.5,
2, -4.276154, -7.580685, 0, 1.5, 0.5, 0.5,
3, -4.276154, -7.580685, 0, -0.5, 0.5, 0.5,
3, -4.276154, -7.580685, 1, -0.5, 0.5, 0.5,
3, -4.276154, -7.580685, 1, 1.5, 0.5, 0.5,
3, -4.276154, -7.580685, 0, 1.5, 0.5, 0.5
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
-3.580134, -3, -6.648185,
-3.580134, 3, -6.648185,
-3.580134, -3, -6.648185,
-3.755603, -3, -6.959018,
-3.580134, -2, -6.648185,
-3.755603, -2, -6.959018,
-3.580134, -1, -6.648185,
-3.755603, -1, -6.959018,
-3.580134, 0, -6.648185,
-3.755603, 0, -6.959018,
-3.580134, 1, -6.648185,
-3.755603, 1, -6.959018,
-3.580134, 2, -6.648185,
-3.755603, 2, -6.959018,
-3.580134, 3, -6.648185,
-3.755603, 3, -6.959018
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
-4.10654, -3, -7.580685, 0, -0.5, 0.5, 0.5,
-4.10654, -3, -7.580685, 1, -0.5, 0.5, 0.5,
-4.10654, -3, -7.580685, 1, 1.5, 0.5, 0.5,
-4.10654, -3, -7.580685, 0, 1.5, 0.5, 0.5,
-4.10654, -2, -7.580685, 0, -0.5, 0.5, 0.5,
-4.10654, -2, -7.580685, 1, -0.5, 0.5, 0.5,
-4.10654, -2, -7.580685, 1, 1.5, 0.5, 0.5,
-4.10654, -2, -7.580685, 0, 1.5, 0.5, 0.5,
-4.10654, -1, -7.580685, 0, -0.5, 0.5, 0.5,
-4.10654, -1, -7.580685, 1, -0.5, 0.5, 0.5,
-4.10654, -1, -7.580685, 1, 1.5, 0.5, 0.5,
-4.10654, -1, -7.580685, 0, 1.5, 0.5, 0.5,
-4.10654, 0, -7.580685, 0, -0.5, 0.5, 0.5,
-4.10654, 0, -7.580685, 1, -0.5, 0.5, 0.5,
-4.10654, 0, -7.580685, 1, 1.5, 0.5, 0.5,
-4.10654, 0, -7.580685, 0, 1.5, 0.5, 0.5,
-4.10654, 1, -7.580685, 0, -0.5, 0.5, 0.5,
-4.10654, 1, -7.580685, 1, -0.5, 0.5, 0.5,
-4.10654, 1, -7.580685, 1, 1.5, 0.5, 0.5,
-4.10654, 1, -7.580685, 0, 1.5, 0.5, 0.5,
-4.10654, 2, -7.580685, 0, -0.5, 0.5, 0.5,
-4.10654, 2, -7.580685, 1, -0.5, 0.5, 0.5,
-4.10654, 2, -7.580685, 1, 1.5, 0.5, 0.5,
-4.10654, 2, -7.580685, 0, 1.5, 0.5, 0.5,
-4.10654, 3, -7.580685, 0, -0.5, 0.5, 0.5,
-4.10654, 3, -7.580685, 1, -0.5, 0.5, 0.5,
-4.10654, 3, -7.580685, 1, 1.5, 0.5, 0.5,
-4.10654, 3, -7.580685, 0, 1.5, 0.5, 0.5
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
-3.580134, -3.752827, -6,
-3.580134, -3.752827, 4,
-3.580134, -3.752827, -6,
-3.755603, -3.927269, -6,
-3.580134, -3.752827, -4,
-3.755603, -3.927269, -4,
-3.580134, -3.752827, -2,
-3.755603, -3.927269, -2,
-3.580134, -3.752827, 0,
-3.755603, -3.927269, 0,
-3.580134, -3.752827, 2,
-3.755603, -3.927269, 2,
-3.580134, -3.752827, 4,
-3.755603, -3.927269, 4
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
"-6",
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
-4.10654, -4.276154, -6, 0, -0.5, 0.5, 0.5,
-4.10654, -4.276154, -6, 1, -0.5, 0.5, 0.5,
-4.10654, -4.276154, -6, 1, 1.5, 0.5, 0.5,
-4.10654, -4.276154, -6, 0, 1.5, 0.5, 0.5,
-4.10654, -4.276154, -4, 0, -0.5, 0.5, 0.5,
-4.10654, -4.276154, -4, 1, -0.5, 0.5, 0.5,
-4.10654, -4.276154, -4, 1, 1.5, 0.5, 0.5,
-4.10654, -4.276154, -4, 0, 1.5, 0.5, 0.5,
-4.10654, -4.276154, -2, 0, -0.5, 0.5, 0.5,
-4.10654, -4.276154, -2, 1, -0.5, 0.5, 0.5,
-4.10654, -4.276154, -2, 1, 1.5, 0.5, 0.5,
-4.10654, -4.276154, -2, 0, 1.5, 0.5, 0.5,
-4.10654, -4.276154, 0, 0, -0.5, 0.5, 0.5,
-4.10654, -4.276154, 0, 1, -0.5, 0.5, 0.5,
-4.10654, -4.276154, 0, 1, 1.5, 0.5, 0.5,
-4.10654, -4.276154, 0, 0, 1.5, 0.5, 0.5,
-4.10654, -4.276154, 2, 0, -0.5, 0.5, 0.5,
-4.10654, -4.276154, 2, 1, -0.5, 0.5, 0.5,
-4.10654, -4.276154, 2, 1, 1.5, 0.5, 0.5,
-4.10654, -4.276154, 2, 0, 1.5, 0.5, 0.5,
-4.10654, -4.276154, 4, 0, -0.5, 0.5, 0.5,
-4.10654, -4.276154, 4, 1, -0.5, 0.5, 0.5,
-4.10654, -4.276154, 4, 1, 1.5, 0.5, 0.5,
-4.10654, -4.276154, 4, 0, 1.5, 0.5, 0.5
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
-3.580134, -3.752827, -6.648185,
-3.580134, 3.224852, -6.648185,
-3.580134, -3.752827, 5.785153,
-3.580134, 3.224852, 5.785153,
-3.580134, -3.752827, -6.648185,
-3.580134, -3.752827, 5.785153,
-3.580134, 3.224852, -6.648185,
-3.580134, 3.224852, 5.785153,
-3.580134, -3.752827, -6.648185,
3.438604, -3.752827, -6.648185,
-3.580134, -3.752827, 5.785153,
3.438604, -3.752827, 5.785153,
-3.580134, 3.224852, -6.648185,
3.438604, 3.224852, -6.648185,
-3.580134, 3.224852, 5.785153,
3.438604, 3.224852, 5.785153,
3.438604, -3.752827, -6.648185,
3.438604, 3.224852, -6.648185,
3.438604, -3.752827, 5.785153,
3.438604, 3.224852, 5.785153,
3.438604, -3.752827, -6.648185,
3.438604, -3.752827, 5.785153,
3.438604, 3.224852, -6.648185,
3.438604, 3.224852, 5.785153
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
var radius = 8.485733;
var distance = 37.75398;
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
mvMatrix.translate( 0.0707649, 0.2639878, 0.4315157 );
mvMatrix.scale( 1.307207, 1.314899, 0.7379306 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.75398);
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
benzoylprop-ethyl_en<-read.table("benzoylprop-ethyl_en.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-benzoylprop-ethyl_en$V2
```

```
## Error in eval(expr, envir, enclos): object 'benzoylprop' not found
```

```r
y<-benzoylprop-ethyl_en$V3
```

```
## Error in eval(expr, envir, enclos): object 'benzoylprop' not found
```

```r
z<-benzoylprop-ethyl_en$V4
```

```
## Error in eval(expr, envir, enclos): object 'benzoylprop' not found
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
-3.47792, 0.5385363, -0.9230531, 0, 0, 1, 1, 1,
-3.308067, -0.5303239, -1.279151, 1, 0, 0, 1, 1,
-2.957959, 0.2303478, -1.530227, 1, 0, 0, 1, 1,
-2.789755, -0.1325059, -0.5443689, 1, 0, 0, 1, 1,
-2.738684, 1.24387, -1.263356, 1, 0, 0, 1, 1,
-2.545563, -1.839327, -1.889279, 1, 0, 0, 1, 1,
-2.512114, -0.5026684, -1.458941, 0, 0, 0, 1, 1,
-2.484173, 0.3520845, -2.757751, 0, 0, 0, 1, 1,
-2.457885, 0.9245703, -1.603556, 0, 0, 0, 1, 1,
-2.419283, -0.7053374, -1.693887, 0, 0, 0, 1, 1,
-2.400385, 0.9482453, -1.060779, 0, 0, 0, 1, 1,
-2.389012, -1.169097, -1.141264, 0, 0, 0, 1, 1,
-2.385802, 1.331306, -3.105574, 0, 0, 0, 1, 1,
-2.370815, -0.9224176, -2.192487, 1, 1, 1, 1, 1,
-2.355732, 0.4190007, -1.521155, 1, 1, 1, 1, 1,
-2.348305, 1.636161, -1.522474, 1, 1, 1, 1, 1,
-2.301837, -1.357635, -2.974506, 1, 1, 1, 1, 1,
-2.123279, -0.0917759, -3.40825, 1, 1, 1, 1, 1,
-2.109555, 0.1251355, -1.202727, 1, 1, 1, 1, 1,
-2.071187, -0.1436297, -1.647509, 1, 1, 1, 1, 1,
-2.06029, -1.760786, -2.626101, 1, 1, 1, 1, 1,
-2.043687, 0.05361272, -1.879973, 1, 1, 1, 1, 1,
-2.021594, 1.413314, -0.03676214, 1, 1, 1, 1, 1,
-2.000476, 1.923424, -2.316865, 1, 1, 1, 1, 1,
-1.996074, 0.2771328, -1.765945, 1, 1, 1, 1, 1,
-1.952638, 0.4974915, -1.428461, 1, 1, 1, 1, 1,
-1.949099, -0.5431408, -1.754282, 1, 1, 1, 1, 1,
-1.944051, -0.1835538, -2.845109, 1, 1, 1, 1, 1,
-1.94191, 0.2322153, -2.186121, 0, 0, 1, 1, 1,
-1.907701, -0.08352202, -1.678492, 1, 0, 0, 1, 1,
-1.8982, 1.293039, -0.7854589, 1, 0, 0, 1, 1,
-1.895191, 0.22165, -0.1652981, 1, 0, 0, 1, 1,
-1.883394, 1.209576, -0.7874615, 1, 0, 0, 1, 1,
-1.875086, -2.239086, -2.891693, 1, 0, 0, 1, 1,
-1.84257, 0.5651867, -1.443323, 0, 0, 0, 1, 1,
-1.829504, 0.583267, -1.889083, 0, 0, 0, 1, 1,
-1.816374, -0.5397378, -1.972176, 0, 0, 0, 1, 1,
-1.815018, -1.454508, -1.866021, 0, 0, 0, 1, 1,
-1.810291, 1.314313, 0.01626289, 0, 0, 0, 1, 1,
-1.797712, -0.1816659, -3.183501, 0, 0, 0, 1, 1,
-1.753921, 1.143083, -2.545985, 0, 0, 0, 1, 1,
-1.740365, 0.7856958, -2.117169, 1, 1, 1, 1, 1,
-1.738641, 0.01327524, -2.727881, 1, 1, 1, 1, 1,
-1.733822, 0.8693287, -0.8709036, 1, 1, 1, 1, 1,
-1.716318, 1.748, 1.022229, 1, 1, 1, 1, 1,
-1.709243, -2.533083, -2.55956, 1, 1, 1, 1, 1,
-1.686343, -0.3931508, -2.77342, 1, 1, 1, 1, 1,
-1.667878, -0.3285877, -2.074907, 1, 1, 1, 1, 1,
-1.65518, -0.862932, -1.600399, 1, 1, 1, 1, 1,
-1.650982, -1.683901, -1.455981, 1, 1, 1, 1, 1,
-1.649684, 0.09079687, -1.529867, 1, 1, 1, 1, 1,
-1.646229, -1.308455, -2.660491, 1, 1, 1, 1, 1,
-1.645975, 1.162634, -0.5733884, 1, 1, 1, 1, 1,
-1.634553, 0.3377914, -2.053115, 1, 1, 1, 1, 1,
-1.63251, 0.008962893, -2.565586, 1, 1, 1, 1, 1,
-1.625349, 0.788985, -2.509312, 1, 1, 1, 1, 1,
-1.624686, 0.05385982, -2.263731, 0, 0, 1, 1, 1,
-1.618025, 0.07308318, -0.3757527, 1, 0, 0, 1, 1,
-1.614673, 0.6000262, -3.09849, 1, 0, 0, 1, 1,
-1.608425, -0.2729466, -3.229594, 1, 0, 0, 1, 1,
-1.598384, 0.523204, -1.597112, 1, 0, 0, 1, 1,
-1.590806, -0.08852179, -2.357, 1, 0, 0, 1, 1,
-1.580079, 0.6967405, -1.58223, 0, 0, 0, 1, 1,
-1.557395, 0.7392046, -1.250612, 0, 0, 0, 1, 1,
-1.55451, 0.4558325, -2.57461, 0, 0, 0, 1, 1,
-1.533275, 0.7521114, -0.5037168, 0, 0, 0, 1, 1,
-1.527889, 1.38937, -0.7374823, 0, 0, 0, 1, 1,
-1.522184, 0.8857558, -2.660733, 0, 0, 0, 1, 1,
-1.513741, 2.124739, -1.859183, 0, 0, 0, 1, 1,
-1.499947, 0.8058646, -0.1088658, 1, 1, 1, 1, 1,
-1.493279, -0.8760605, -1.172616, 1, 1, 1, 1, 1,
-1.477197, -1.750555, -1.807748, 1, 1, 1, 1, 1,
-1.472096, -0.1449277, -1.237805, 1, 1, 1, 1, 1,
-1.447188, -0.1808327, -1.011628, 1, 1, 1, 1, 1,
-1.4434, 1.673862, 0.467597, 1, 1, 1, 1, 1,
-1.442501, -0.177419, -1.816423, 1, 1, 1, 1, 1,
-1.441484, -0.9984001, -2.102137, 1, 1, 1, 1, 1,
-1.433683, 0.1750639, -1.717338, 1, 1, 1, 1, 1,
-1.417451, -0.8215699, -2.786382, 1, 1, 1, 1, 1,
-1.412533, 0.1511777, -0.3955978, 1, 1, 1, 1, 1,
-1.368562, 1.792498, -0.1757854, 1, 1, 1, 1, 1,
-1.356422, 0.486201, -2.267859, 1, 1, 1, 1, 1,
-1.356034, 1.308005, -0.1359369, 1, 1, 1, 1, 1,
-1.344112, -0.6859818, -3.1996, 1, 1, 1, 1, 1,
-1.341517, -1.366008, -0.9720528, 0, 0, 1, 1, 1,
-1.334303, -0.3889692, -0.6460115, 1, 0, 0, 1, 1,
-1.327876, -0.975096, -2.026587, 1, 0, 0, 1, 1,
-1.327135, -0.5623767, -1.575784, 1, 0, 0, 1, 1,
-1.325407, 1.169662, 0.1645011, 1, 0, 0, 1, 1,
-1.322327, 1.121029, -2.444468, 1, 0, 0, 1, 1,
-1.321397, -2.09686, -2.67026, 0, 0, 0, 1, 1,
-1.310801, -0.3040302, -2.694984, 0, 0, 0, 1, 1,
-1.305367, -1.136925, -0.5619286, 0, 0, 0, 1, 1,
-1.300466, 0.501318, -1.203889, 0, 0, 0, 1, 1,
-1.295111, -0.4693827, -1.563224, 0, 0, 0, 1, 1,
-1.291825, -0.7916791, -3.842407, 0, 0, 0, 1, 1,
-1.280357, -0.4317227, -1.405225, 0, 0, 0, 1, 1,
-1.273833, -0.23042, -1.940281, 1, 1, 1, 1, 1,
-1.249371, 0.4822356, -1.996204, 1, 1, 1, 1, 1,
-1.23329, -0.3300647, -1.666686, 1, 1, 1, 1, 1,
-1.230374, 0.396199, 0.4725044, 1, 1, 1, 1, 1,
-1.226804, 0.9885975, -0.7361309, 1, 1, 1, 1, 1,
-1.22004, 0.9428519, -1.77688, 1, 1, 1, 1, 1,
-1.219643, 0.2575597, -2.23324, 1, 1, 1, 1, 1,
-1.205359, -1.102877, -2.513517, 1, 1, 1, 1, 1,
-1.203628, 0.4928578, -0.1778196, 1, 1, 1, 1, 1,
-1.20253, -2.370263, -3.023767, 1, 1, 1, 1, 1,
-1.197814, -0.5174958, -1.480621, 1, 1, 1, 1, 1,
-1.187374, -2.193165, -3.085636, 1, 1, 1, 1, 1,
-1.185317, 1.055258, -0.3716384, 1, 1, 1, 1, 1,
-1.184504, 0.7228461, -0.05498092, 1, 1, 1, 1, 1,
-1.176915, -1.904584, -3.015482, 1, 1, 1, 1, 1,
-1.170986, 0.3076508, -1.078772, 0, 0, 1, 1, 1,
-1.168324, 1.471002, -2.118883, 1, 0, 0, 1, 1,
-1.161621, -0.2940728, -1.696209, 1, 0, 0, 1, 1,
-1.149914, -0.03157778, -1.380415, 1, 0, 0, 1, 1,
-1.144595, -0.4913526, -3.161662, 1, 0, 0, 1, 1,
-1.135008, 1.90946, 0.1472834, 1, 0, 0, 1, 1,
-1.133752, 0.3621306, -1.911179, 0, 0, 0, 1, 1,
-1.13051, 1.08331, 0.527864, 0, 0, 0, 1, 1,
-1.126239, 1.405225, -0.8555725, 0, 0, 0, 1, 1,
-1.108328, 1.40765, -1.031458, 0, 0, 0, 1, 1,
-1.106761, 0.3412988, 0.7471185, 0, 0, 0, 1, 1,
-1.103006, -1.497111, -2.479285, 0, 0, 0, 1, 1,
-1.102407, -1.597495, -4.819581, 0, 0, 0, 1, 1,
-1.09721, -1.107769, -1.556453, 1, 1, 1, 1, 1,
-1.095374, -1.172143, -4.437669, 1, 1, 1, 1, 1,
-1.09226, -2.184327, -3.437478, 1, 1, 1, 1, 1,
-1.086135, -0.07904571, -2.624734, 1, 1, 1, 1, 1,
-1.083268, -1.042705, -3.037759, 1, 1, 1, 1, 1,
-1.081452, -1.031366, -3.026745, 1, 1, 1, 1, 1,
-1.078073, -0.7190254, -2.008112, 1, 1, 1, 1, 1,
-1.077893, 0.7378259, -0.8639951, 1, 1, 1, 1, 1,
-1.070599, 1.092752, -1.14483, 1, 1, 1, 1, 1,
-1.070433, 2.424412, 1.338923, 1, 1, 1, 1, 1,
-1.069613, 0.2035228, -2.093386, 1, 1, 1, 1, 1,
-1.05994, 1.93524, -0.02252214, 1, 1, 1, 1, 1,
-1.058271, 1.3285, -0.8025491, 1, 1, 1, 1, 1,
-1.054423, 0.3393878, -0.8971602, 1, 1, 1, 1, 1,
-1.047169, 0.956134, -1.343101, 1, 1, 1, 1, 1,
-1.042402, 1.984474, -0.9028537, 0, 0, 1, 1, 1,
-1.035334, 0.8284644, -1.566428, 1, 0, 0, 1, 1,
-1.030255, -0.03511057, -2.737836, 1, 0, 0, 1, 1,
-1.027737, 0.6355777, -1.325306, 1, 0, 0, 1, 1,
-1.024798, -0.5916809, -1.158756, 1, 0, 0, 1, 1,
-1.007963, -0.08127576, -1.774088, 1, 0, 0, 1, 1,
-1.00556, -0.9880157, -0.5060265, 0, 0, 0, 1, 1,
-1.004943, 0.02131241, -1.019592, 0, 0, 0, 1, 1,
-1.002967, 0.2372033, -0.9817312, 0, 0, 0, 1, 1,
-1.000577, 0.249476, -0.7948468, 0, 0, 0, 1, 1,
-0.9984613, -1.443902, -3.38826, 0, 0, 0, 1, 1,
-0.9981353, 0.6833892, 0.593634, 0, 0, 0, 1, 1,
-0.99468, -0.9109876, -1.290748, 0, 0, 0, 1, 1,
-0.9883757, 0.6913229, -0.161018, 1, 1, 1, 1, 1,
-0.9865459, -1.769149, -0.3869474, 1, 1, 1, 1, 1,
-0.9736226, -1.191221, -3.231777, 1, 1, 1, 1, 1,
-0.9670004, -0.6075944, -1.768166, 1, 1, 1, 1, 1,
-0.9651861, -0.5127571, -1.501442, 1, 1, 1, 1, 1,
-0.9514063, 0.4860381, -1.92863, 1, 1, 1, 1, 1,
-0.9483829, -0.2642479, -3.410888, 1, 1, 1, 1, 1,
-0.9417814, -1.446664, -1.116607, 1, 1, 1, 1, 1,
-0.9408448, 0.8972435, -0.9354354, 1, 1, 1, 1, 1,
-0.9305173, -0.4823746, -1.580671, 1, 1, 1, 1, 1,
-0.9292939, 1.717267, -1.427063, 1, 1, 1, 1, 1,
-0.9217185, 0.4661324, -0.1937605, 1, 1, 1, 1, 1,
-0.9148928, -1.012023, -2.094819, 1, 1, 1, 1, 1,
-0.9112269, -1.568882, -2.357643, 1, 1, 1, 1, 1,
-0.9090087, 1.375901, -1.960699, 1, 1, 1, 1, 1,
-0.9079201, -0.9823915, -2.143084, 0, 0, 1, 1, 1,
-0.9076214, 0.475029, -0.3309152, 1, 0, 0, 1, 1,
-0.9049422, -1.829126, -3.021178, 1, 0, 0, 1, 1,
-0.9025875, 0.0549638, -1.214106, 1, 0, 0, 1, 1,
-0.9021507, 0.5180466, -0.3510364, 1, 0, 0, 1, 1,
-0.8990185, -1.203799, -2.524313, 1, 0, 0, 1, 1,
-0.8964717, 1.691143, 1.484941, 0, 0, 0, 1, 1,
-0.8951387, -0.03386243, -0.8104087, 0, 0, 0, 1, 1,
-0.89227, 0.935038, -0.7795027, 0, 0, 0, 1, 1,
-0.8917591, -2.222501, -2.340573, 0, 0, 0, 1, 1,
-0.8904478, -1.304422, -3.158939, 0, 0, 0, 1, 1,
-0.8887873, 2.449231, -0.4465923, 0, 0, 0, 1, 1,
-0.8863965, -0.4216798, -2.757945, 0, 0, 0, 1, 1,
-0.8683624, 0.1918378, -0.6442209, 1, 1, 1, 1, 1,
-0.8647316, -0.08119024, -1.246581, 1, 1, 1, 1, 1,
-0.8603569, -1.097662, -3.222641, 1, 1, 1, 1, 1,
-0.8579329, 0.5148974, -1.608387, 1, 1, 1, 1, 1,
-0.856352, 0.5108466, -2.230654, 1, 1, 1, 1, 1,
-0.8436945, -0.2903057, -0.4627908, 1, 1, 1, 1, 1,
-0.842562, 0.07889467, -1.406772, 1, 1, 1, 1, 1,
-0.8409665, 0.9338995, -0.7531068, 1, 1, 1, 1, 1,
-0.8407092, 1.310996, -1.737701, 1, 1, 1, 1, 1,
-0.8380406, -0.9622074, -1.305928, 1, 1, 1, 1, 1,
-0.8336791, -1.501373, -2.69147, 1, 1, 1, 1, 1,
-0.8331013, 2.537783, -0.3775547, 1, 1, 1, 1, 1,
-0.8330532, -0.3016454, -0.9573105, 1, 1, 1, 1, 1,
-0.8313386, 1.373329, -1.057594, 1, 1, 1, 1, 1,
-0.8300642, 0.2999612, -1.62911, 1, 1, 1, 1, 1,
-0.8295702, 0.1852189, -1.957691, 0, 0, 1, 1, 1,
-0.8179759, 1.482421, -0.4262342, 1, 0, 0, 1, 1,
-0.8125028, 1.258382, 1.117809, 1, 0, 0, 1, 1,
-0.811694, -0.2388373, -1.980431, 1, 0, 0, 1, 1,
-0.8101236, -0.4577293, -2.467113, 1, 0, 0, 1, 1,
-0.8041993, 1.194709, -0.09508762, 1, 0, 0, 1, 1,
-0.804069, 0.3859517, -2.382698, 0, 0, 0, 1, 1,
-0.7968629, -0.9479186, -1.98819, 0, 0, 0, 1, 1,
-0.792104, -1.33936, -1.746118, 0, 0, 0, 1, 1,
-0.7882976, -0.4427063, -2.192935, 0, 0, 0, 1, 1,
-0.7859688, 0.9180773, 0.03103221, 0, 0, 0, 1, 1,
-0.7854646, -0.3909781, -2.675523, 0, 0, 0, 1, 1,
-0.7827321, -0.8856862, -2.688207, 0, 0, 0, 1, 1,
-0.7823316, -0.4815511, -2.07552, 1, 1, 1, 1, 1,
-0.7645143, -0.7036062, -2.835708, 1, 1, 1, 1, 1,
-0.7630292, -0.1472252, -1.529073, 1, 1, 1, 1, 1,
-0.7553467, 2.008502, -0.2846827, 1, 1, 1, 1, 1,
-0.7537253, 0.1109797, -0.6286469, 1, 1, 1, 1, 1,
-0.7517034, -0.4633915, -2.890851, 1, 1, 1, 1, 1,
-0.7508134, 0.5409635, -0.8710296, 1, 1, 1, 1, 1,
-0.747465, 0.4370559, 0.4689049, 1, 1, 1, 1, 1,
-0.7410486, -1.03857, -4.492749, 1, 1, 1, 1, 1,
-0.7347161, 1.008945, 1.460017, 1, 1, 1, 1, 1,
-0.7328218, -1.779649, -4.246953, 1, 1, 1, 1, 1,
-0.7319275, -1.347206, -2.845168, 1, 1, 1, 1, 1,
-0.7297761, 1.190152, -0.4955031, 1, 1, 1, 1, 1,
-0.7274484, 1.15543, -1.393355, 1, 1, 1, 1, 1,
-0.7252532, -0.505551, -1.771912, 1, 1, 1, 1, 1,
-0.7217811, 0.9812445, -0.5740186, 0, 0, 1, 1, 1,
-0.7161771, -1.630516, -2.273297, 1, 0, 0, 1, 1,
-0.7140652, 1.099287, 1.095284, 1, 0, 0, 1, 1,
-0.7023124, -0.01472558, -3.363029, 1, 0, 0, 1, 1,
-0.6995618, 0.1529812, -1.154238, 1, 0, 0, 1, 1,
-0.6948445, -1.236838, -5.382648, 1, 0, 0, 1, 1,
-0.6933103, -1.032547, -1.271436, 0, 0, 0, 1, 1,
-0.6918173, 0.2457368, -1.886287, 0, 0, 0, 1, 1,
-0.6890471, 0.7583681, -1.232219, 0, 0, 0, 1, 1,
-0.6856722, -1.561143, -2.601121, 0, 0, 0, 1, 1,
-0.6830558, 0.01193426, -2.770206, 0, 0, 0, 1, 1,
-0.6825883, 0.970556, 0.7358297, 0, 0, 0, 1, 1,
-0.6791937, 0.4727028, -2.116913, 0, 0, 0, 1, 1,
-0.6784949, 1.626867, 0.4464143, 1, 1, 1, 1, 1,
-0.6772968, -0.8350654, -1.053758, 1, 1, 1, 1, 1,
-0.674942, -0.5737769, -0.7943417, 1, 1, 1, 1, 1,
-0.6722528, 0.7495235, -1.09015, 1, 1, 1, 1, 1,
-0.6674299, -0.237378, -3.054619, 1, 1, 1, 1, 1,
-0.6655006, -1.573938, -6.467117, 1, 1, 1, 1, 1,
-0.6588492, 0.08022309, -1.132368, 1, 1, 1, 1, 1,
-0.6560822, -1.542744, -1.208171, 1, 1, 1, 1, 1,
-0.654871, -0.4712375, 1.104772, 1, 1, 1, 1, 1,
-0.6542763, 0.2858366, -0.6780389, 1, 1, 1, 1, 1,
-0.6514854, 1.463668, -1.810564, 1, 1, 1, 1, 1,
-0.6462319, -0.647475, -1.730918, 1, 1, 1, 1, 1,
-0.645907, -2.189622, -3.523029, 1, 1, 1, 1, 1,
-0.6433156, 0.3592339, -1.286602, 1, 1, 1, 1, 1,
-0.6421806, -1.186132, -2.65607, 1, 1, 1, 1, 1,
-0.6407707, -0.08684873, -1.008988, 0, 0, 1, 1, 1,
-0.6407145, -1.422555, -1.973138, 1, 0, 0, 1, 1,
-0.640495, -0.05527739, 0.2467756, 1, 0, 0, 1, 1,
-0.6359897, -1.184415, -2.540569, 1, 0, 0, 1, 1,
-0.6202238, 0.3546908, -2.634817, 1, 0, 0, 1, 1,
-0.6162569, 2.211148, 0.4407433, 1, 0, 0, 1, 1,
-0.6146808, -0.2226386, -3.295557, 0, 0, 0, 1, 1,
-0.6111116, -0.9238224, -1.535495, 0, 0, 0, 1, 1,
-0.6003145, -0.02451346, -1.251204, 0, 0, 0, 1, 1,
-0.5952873, -0.972803, -3.177257, 0, 0, 0, 1, 1,
-0.5927803, 0.2802209, -1.210431, 0, 0, 0, 1, 1,
-0.5917961, -0.01564842, -0.230251, 0, 0, 0, 1, 1,
-0.5893282, -0.6504923, -1.950936, 0, 0, 0, 1, 1,
-0.5871859, -0.3967228, -2.580135, 1, 1, 1, 1, 1,
-0.5859629, -0.3605474, -1.304458, 1, 1, 1, 1, 1,
-0.5828326, 0.6249601, 0.08335392, 1, 1, 1, 1, 1,
-0.5807967, 1.087303, -1.04548, 1, 1, 1, 1, 1,
-0.5771625, -1.791831, -3.353758, 1, 1, 1, 1, 1,
-0.5715886, 1.338006, 0.173491, 1, 1, 1, 1, 1,
-0.5713577, 0.9286924, -1.578208, 1, 1, 1, 1, 1,
-0.5680697, 0.2832787, -2.792502, 1, 1, 1, 1, 1,
-0.5677418, -0.4535216, -2.283376, 1, 1, 1, 1, 1,
-0.5672662, 0.6959394, -0.7086043, 1, 1, 1, 1, 1,
-0.5654932, -0.8028513, -2.243149, 1, 1, 1, 1, 1,
-0.5628332, -0.9381949, -1.787403, 1, 1, 1, 1, 1,
-0.55793, -0.9538195, -2.731076, 1, 1, 1, 1, 1,
-0.5573159, -0.2352346, -2.755708, 1, 1, 1, 1, 1,
-0.5559558, 0.664288, -0.8521788, 1, 1, 1, 1, 1,
-0.5551156, 0.003781417, -2.889836, 0, 0, 1, 1, 1,
-0.5540079, 1.029028, -2.015543, 1, 0, 0, 1, 1,
-0.5533735, 1.103897, 0.7686505, 1, 0, 0, 1, 1,
-0.5508165, -0.4141503, -3.90781, 1, 0, 0, 1, 1,
-0.5457564, 0.2167895, -1.090709, 1, 0, 0, 1, 1,
-0.5454652, -0.1392232, -1.717572, 1, 0, 0, 1, 1,
-0.5441751, 0.9479812, 0.09210266, 0, 0, 0, 1, 1,
-0.539914, 1.502039, 0.3414439, 0, 0, 0, 1, 1,
-0.5360919, -0.3952885, -0.4256905, 0, 0, 0, 1, 1,
-0.5314686, 1.977589, 0.2748033, 0, 0, 0, 1, 1,
-0.5252491, 0.1566812, -2.001754, 0, 0, 0, 1, 1,
-0.5222901, -1.351209, -2.215701, 0, 0, 0, 1, 1,
-0.5216968, 0.6831034, 1.803926, 0, 0, 0, 1, 1,
-0.5202313, -0.7811409, -2.969349, 1, 1, 1, 1, 1,
-0.5174527, 1.106936, 0.4299624, 1, 1, 1, 1, 1,
-0.517434, -0.3832727, -3.253894, 1, 1, 1, 1, 1,
-0.5121747, 0.6515284, 0.2012996, 1, 1, 1, 1, 1,
-0.5088822, 0.1651034, 0.06107565, 1, 1, 1, 1, 1,
-0.5039565, -1.165337, -3.660697, 1, 1, 1, 1, 1,
-0.5010939, -0.3247143, -1.857011, 1, 1, 1, 1, 1,
-0.4980771, -1.497812, -2.244139, 1, 1, 1, 1, 1,
-0.4975564, -1.100623, -2.890307, 1, 1, 1, 1, 1,
-0.4967996, -0.2754193, -2.515654, 1, 1, 1, 1, 1,
-0.4944915, 1.045003, -0.225132, 1, 1, 1, 1, 1,
-0.4942365, 0.84859, -0.8977669, 1, 1, 1, 1, 1,
-0.4882838, 0.1631652, -1.114237, 1, 1, 1, 1, 1,
-0.4788867, 0.587437, -1.341, 1, 1, 1, 1, 1,
-0.4757594, 0.1619613, -2.763066, 1, 1, 1, 1, 1,
-0.4699814, 0.6335491, -1.492216, 0, 0, 1, 1, 1,
-0.4675478, -0.2570246, -3.114735, 1, 0, 0, 1, 1,
-0.4669419, -0.1973894, -3.013283, 1, 0, 0, 1, 1,
-0.4651033, 0.495728, -0.2929409, 1, 0, 0, 1, 1,
-0.4646206, 0.1637927, -1.04741, 1, 0, 0, 1, 1,
-0.4627189, -0.6268351, -0.8393441, 1, 0, 0, 1, 1,
-0.4584696, 0.01779003, -0.7468346, 0, 0, 0, 1, 1,
-0.4517757, 0.3835863, -0.1159851, 0, 0, 0, 1, 1,
-0.4490226, 0.9980405, -1.615277, 0, 0, 0, 1, 1,
-0.4470582, -1.825367, -3.17402, 0, 0, 0, 1, 1,
-0.4436652, -0.7421819, -3.319328, 0, 0, 0, 1, 1,
-0.4433398, 1.405138, 0.2571729, 0, 0, 0, 1, 1,
-0.4347932, -0.2615573, -1.75618, 0, 0, 0, 1, 1,
-0.4313248, 0.1084252, -1.684308, 1, 1, 1, 1, 1,
-0.4292574, 1.04221, -1.363808, 1, 1, 1, 1, 1,
-0.4279456, -0.004994354, -0.9919704, 1, 1, 1, 1, 1,
-0.4263996, -2.0888, -3.26508, 1, 1, 1, 1, 1,
-0.4243029, -0.8558126, -4.109649, 1, 1, 1, 1, 1,
-0.4168113, -0.8420911, -1.753102, 1, 1, 1, 1, 1,
-0.4159238, 2.039993, -0.4400224, 1, 1, 1, 1, 1,
-0.4157608, -1.441866, -2.69898, 1, 1, 1, 1, 1,
-0.4129941, -1.118813, -3.335306, 1, 1, 1, 1, 1,
-0.4100161, 2.805283, 0.1729051, 1, 1, 1, 1, 1,
-0.4063262, 0.8948072, -0.1153344, 1, 1, 1, 1, 1,
-0.4022011, -1.425552, -1.54126, 1, 1, 1, 1, 1,
-0.4016474, 0.6368569, -0.1598901, 1, 1, 1, 1, 1,
-0.3995551, 1.132427, -0.3580717, 1, 1, 1, 1, 1,
-0.3994375, 0.505675, -0.03892358, 1, 1, 1, 1, 1,
-0.3936938, 1.308082, -2.055209, 0, 0, 1, 1, 1,
-0.3935805, 0.7230762, 1.227293, 1, 0, 0, 1, 1,
-0.3886249, 0.1896486, 0.4381216, 1, 0, 0, 1, 1,
-0.3882205, -0.8125061, -2.791294, 1, 0, 0, 1, 1,
-0.3871646, 1.33361, 1.763994, 1, 0, 0, 1, 1,
-0.381356, -0.2234387, -0.9222675, 1, 0, 0, 1, 1,
-0.3799782, 0.5599196, 0.2635014, 0, 0, 0, 1, 1,
-0.3784989, -0.2354871, -1.990397, 0, 0, 0, 1, 1,
-0.3754609, -1.171877, -1.117981, 0, 0, 0, 1, 1,
-0.3727749, 1.147172, 3.46397, 0, 0, 0, 1, 1,
-0.3723969, 1.218264, 0.7670902, 0, 0, 0, 1, 1,
-0.3709802, -1.162661, -3.142021, 0, 0, 0, 1, 1,
-0.3697763, -0.294295, -1.67261, 0, 0, 0, 1, 1,
-0.369612, -0.171785, -0.2113858, 1, 1, 1, 1, 1,
-0.3602884, 0.4766045, -0.5713567, 1, 1, 1, 1, 1,
-0.356707, 0.4956181, 1.971342, 1, 1, 1, 1, 1,
-0.3564419, 1.349166, 0.254816, 1, 1, 1, 1, 1,
-0.3507212, -0.9593691, -3.547199, 1, 1, 1, 1, 1,
-0.3494752, -0.51789, -2.487452, 1, 1, 1, 1, 1,
-0.3477719, -0.1151061, -2.846126, 1, 1, 1, 1, 1,
-0.343802, 0.08091483, -3.680605, 1, 1, 1, 1, 1,
-0.3407734, 1.44514, 0.8982788, 1, 1, 1, 1, 1,
-0.339798, 0.2999447, -1.018411, 1, 1, 1, 1, 1,
-0.3378859, -0.7546558, -3.383377, 1, 1, 1, 1, 1,
-0.3360381, 0.08346866, -0.7076279, 1, 1, 1, 1, 1,
-0.3315251, -0.8382648, -3.148987, 1, 1, 1, 1, 1,
-0.3297126, 1.568074, 1.484942, 1, 1, 1, 1, 1,
-0.3216425, -0.3292602, -2.361894, 1, 1, 1, 1, 1,
-0.31791, -0.2861814, -3.406946, 0, 0, 1, 1, 1,
-0.3169188, -0.7437449, -4.412435, 1, 0, 0, 1, 1,
-0.3146805, 1.197994, -0.2012149, 1, 0, 0, 1, 1,
-0.3128191, -2.025196, -2.667815, 1, 0, 0, 1, 1,
-0.3098752, 0.9210346, -0.8266302, 1, 0, 0, 1, 1,
-0.3094055, -0.7675856, -2.319108, 1, 0, 0, 1, 1,
-0.3093342, -2.853158, -4.151125, 0, 0, 0, 1, 1,
-0.3048169, -0.07113274, -1.050434, 0, 0, 0, 1, 1,
-0.3013699, 0.5120713, -0.8287005, 0, 0, 0, 1, 1,
-0.2959684, -1.665369, -3.774072, 0, 0, 0, 1, 1,
-0.2954545, 0.3973476, -0.2360827, 0, 0, 0, 1, 1,
-0.2900821, -0.4074438, -1.087381, 0, 0, 0, 1, 1,
-0.2890614, 0.004828613, -1.670432, 0, 0, 0, 1, 1,
-0.2861759, -0.4602256, -2.397134, 1, 1, 1, 1, 1,
-0.285042, 1.061061, -1.007452, 1, 1, 1, 1, 1,
-0.2827608, 0.3644741, -0.1699804, 1, 1, 1, 1, 1,
-0.2784945, -0.8563874, -4.388757, 1, 1, 1, 1, 1,
-0.2780828, 0.5707743, -1.947399, 1, 1, 1, 1, 1,
-0.2743726, 0.8946382, -0.1972296, 1, 1, 1, 1, 1,
-0.2709146, 0.6168048, 0.9986496, 1, 1, 1, 1, 1,
-0.2706096, 1.216003, -0.2640373, 1, 1, 1, 1, 1,
-0.2627486, 0.8333678, -0.5593454, 1, 1, 1, 1, 1,
-0.2608424, -1.003946, -3.516598, 1, 1, 1, 1, 1,
-0.253239, -0.3957115, -3.542434, 1, 1, 1, 1, 1,
-0.2525212, 0.792704, -1.405935, 1, 1, 1, 1, 1,
-0.2419653, 0.8155382, -2.156617, 1, 1, 1, 1, 1,
-0.2415787, 1.118708, 0.7111475, 1, 1, 1, 1, 1,
-0.2400286, 0.8093609, -0.7001883, 1, 1, 1, 1, 1,
-0.2386487, 0.5312563, -1.04498, 0, 0, 1, 1, 1,
-0.2229716, -1.040359, -1.082483, 1, 0, 0, 1, 1,
-0.2216066, 1.742561, -0.5749769, 1, 0, 0, 1, 1,
-0.2204779, -1.763631, -3.595824, 1, 0, 0, 1, 1,
-0.2189158, 1.134104, -0.2502833, 1, 0, 0, 1, 1,
-0.2181821, 0.1952359, -2.388419, 1, 0, 0, 1, 1,
-0.2161707, -1.094154, -2.28957, 0, 0, 0, 1, 1,
-0.214674, 0.4300243, -2.408172, 0, 0, 0, 1, 1,
-0.2104212, -1.952231, -3.217792, 0, 0, 0, 1, 1,
-0.2081859, 0.9142471, 0.8504381, 0, 0, 0, 1, 1,
-0.2069167, -0.1926384, -1.199405, 0, 0, 0, 1, 1,
-0.2058133, 2.209171, -0.7443283, 0, 0, 0, 1, 1,
-0.2052346, -1.282721, -2.961635, 0, 0, 0, 1, 1,
-0.1990347, 1.372738, -2.562981, 1, 1, 1, 1, 1,
-0.1954226, 0.1615507, 0.8272828, 1, 1, 1, 1, 1,
-0.1929655, -0.05534365, -2.928955, 1, 1, 1, 1, 1,
-0.1900108, -1.417627, -4.080904, 1, 1, 1, 1, 1,
-0.1829501, 1.589999, 1.939602, 1, 1, 1, 1, 1,
-0.1799314, 1.324142, -1.605129, 1, 1, 1, 1, 1,
-0.1761838, 1.154157, -0.9961989, 1, 1, 1, 1, 1,
-0.1739615, 1.823812, -0.3307654, 1, 1, 1, 1, 1,
-0.1738169, -1.29997, -4.134124, 1, 1, 1, 1, 1,
-0.1720136, 1.065486, 0.615517, 1, 1, 1, 1, 1,
-0.1650863, -0.8159185, -2.759372, 1, 1, 1, 1, 1,
-0.1529133, 0.3947088, -1.20277, 1, 1, 1, 1, 1,
-0.1525922, -0.6003654, -4.574098, 1, 1, 1, 1, 1,
-0.151392, 2.106729, 2.20418, 1, 1, 1, 1, 1,
-0.1510536, -0.1714474, -2.809945, 1, 1, 1, 1, 1,
-0.1459223, 0.8647991, 0.7119366, 0, 0, 1, 1, 1,
-0.1454587, 0.2532974, -0.7484296, 1, 0, 0, 1, 1,
-0.1440165, -0.0846471, -2.794325, 1, 0, 0, 1, 1,
-0.1436909, -2.414307, -4.280231, 1, 0, 0, 1, 1,
-0.1423147, -1.620627, -3.775059, 1, 0, 0, 1, 1,
-0.1418948, -0.07416835, -1.656615, 1, 0, 0, 1, 1,
-0.1415186, -0.1389243, -3.981303, 0, 0, 0, 1, 1,
-0.1360712, -1.144646, -3.267901, 0, 0, 0, 1, 1,
-0.1310382, 1.080361, 0.1185062, 0, 0, 0, 1, 1,
-0.1304131, -1.875066, -3.268736, 0, 0, 0, 1, 1,
-0.1303407, 1.348244, -1.654474, 0, 0, 0, 1, 1,
-0.1296632, -0.5514104, -2.556396, 0, 0, 0, 1, 1,
-0.1241756, 0.1118457, -2.889733, 0, 0, 0, 1, 1,
-0.1210555, -0.5826885, -1.679284, 1, 1, 1, 1, 1,
-0.118279, -0.284059, -2.742509, 1, 1, 1, 1, 1,
-0.1134767, 1.020358, 0.2848143, 1, 1, 1, 1, 1,
-0.1104171, -1.576383, -2.607537, 1, 1, 1, 1, 1,
-0.1075077, -0.06363446, -2.689901, 1, 1, 1, 1, 1,
-0.1066167, -0.3968828, -3.235152, 1, 1, 1, 1, 1,
-0.1063801, 0.6247057, -2.047502, 1, 1, 1, 1, 1,
-0.1060571, -1.776671, -3.669146, 1, 1, 1, 1, 1,
-0.09981057, -0.1958674, -3.418586, 1, 1, 1, 1, 1,
-0.09809958, -0.1234783, -1.432721, 1, 1, 1, 1, 1,
-0.09671549, 1.700843, 1.084385, 1, 1, 1, 1, 1,
-0.09631565, -1.028929, -3.441087, 1, 1, 1, 1, 1,
-0.09576552, -1.542597, -3.04746, 1, 1, 1, 1, 1,
-0.0949294, 1.682823, 0.2377111, 1, 1, 1, 1, 1,
-0.0885764, 0.7402325, -1.72202, 1, 1, 1, 1, 1,
-0.0882024, 0.4234977, -1.131588, 0, 0, 1, 1, 1,
-0.08786911, 1.781611, -1.198534, 1, 0, 0, 1, 1,
-0.08728455, 1.627719, -0.3662238, 1, 0, 0, 1, 1,
-0.08588287, -1.046093, -5.672704, 1, 0, 0, 1, 1,
-0.07781299, -0.8963772, -2.850439, 1, 0, 0, 1, 1,
-0.07749857, 1.202075, 0.4997074, 1, 0, 0, 1, 1,
-0.07555868, -0.4772878, -3.555331, 0, 0, 0, 1, 1,
-0.07163964, 0.3629303, -0.7920393, 0, 0, 0, 1, 1,
-0.07007774, 0.08928914, -0.5587686, 0, 0, 0, 1, 1,
-0.06317615, -1.392392, -3.350883, 0, 0, 0, 1, 1,
-0.05741664, 0.09910128, -0.05463628, 0, 0, 0, 1, 1,
-0.05661954, 0.09405186, -0.9107965, 0, 0, 0, 1, 1,
-0.05569175, -0.06525519, -3.073908, 0, 0, 0, 1, 1,
-0.05557018, -1.220698, -5.880592, 1, 1, 1, 1, 1,
-0.05387632, -2.026844, -2.547931, 1, 1, 1, 1, 1,
-0.04854559, 1.227815, -1.20123, 1, 1, 1, 1, 1,
-0.04595989, 0.3909801, -0.2475343, 1, 1, 1, 1, 1,
-0.04495468, -1.151542, -2.912289, 1, 1, 1, 1, 1,
-0.03971106, -0.728201, -1.98646, 1, 1, 1, 1, 1,
-0.03543194, -2.840697, -2.741179, 1, 1, 1, 1, 1,
-0.0311392, -0.9798542, -3.086567, 1, 1, 1, 1, 1,
-0.02951539, 0.4351803, -0.7609199, 1, 1, 1, 1, 1,
-0.02593121, 0.4952686, -1.635983, 1, 1, 1, 1, 1,
-0.02501357, -1.34452, -2.774259, 1, 1, 1, 1, 1,
-0.02498598, 0.8964738, -0.9580107, 1, 1, 1, 1, 1,
-0.02486469, 1.218406, 0.1320246, 1, 1, 1, 1, 1,
-0.02379994, 0.7525397, 1.271257, 1, 1, 1, 1, 1,
-0.02160487, 1.364636, -1.034229, 1, 1, 1, 1, 1,
-0.01583463, -0.2160743, -4.169795, 0, 0, 1, 1, 1,
-0.01336433, -0.006746243, -1.573539, 1, 0, 0, 1, 1,
-0.009449766, -0.1677868, -2.718824, 1, 0, 0, 1, 1,
-0.008802085, -0.2077808, -4.008488, 1, 0, 0, 1, 1,
-0.006213218, 2.645452, -0.2267716, 1, 0, 0, 1, 1,
-0.001014008, 0.553108, -1.187819, 1, 0, 0, 1, 1,
0.001102437, -0.6641737, 2.83579, 0, 0, 0, 1, 1,
0.001629575, -0.3811276, 3.86945, 0, 0, 0, 1, 1,
0.001851838, 0.2287168, -0.3665655, 0, 0, 0, 1, 1,
0.00313129, -0.3297052, 3.12688, 0, 0, 0, 1, 1,
0.003802216, -0.8625963, 3.872538, 0, 0, 0, 1, 1,
0.005104156, -0.4058293, 3.386128, 0, 0, 0, 1, 1,
0.006984874, -0.7805406, 4.676445, 0, 0, 0, 1, 1,
0.01051739, 0.2930425, -1.034292, 1, 1, 1, 1, 1,
0.01411022, 1.139351, 0.6593959, 1, 1, 1, 1, 1,
0.01745429, 0.5519778, -0.5889171, 1, 1, 1, 1, 1,
0.01968198, -0.9575509, 3.357791, 1, 1, 1, 1, 1,
0.0207523, 0.8074204, -0.5483832, 1, 1, 1, 1, 1,
0.02381372, -1.523456, 1.521394, 1, 1, 1, 1, 1,
0.02776633, 1.984065, -0.1419756, 1, 1, 1, 1, 1,
0.02830835, 2.813895, -1.378672, 1, 1, 1, 1, 1,
0.03692593, 0.008780682, 1.297292, 1, 1, 1, 1, 1,
0.03903826, 0.8864868, 0.5933191, 1, 1, 1, 1, 1,
0.040139, 1.338416, 0.7239869, 1, 1, 1, 1, 1,
0.04552609, -0.4491843, 3.452244, 1, 1, 1, 1, 1,
0.05020018, 0.3231429, -0.8714276, 1, 1, 1, 1, 1,
0.05223355, -0.1439002, 1.168478, 1, 1, 1, 1, 1,
0.05243521, -0.4753878, 1.726704, 1, 1, 1, 1, 1,
0.05465041, 0.1236264, 0.2666657, 0, 0, 1, 1, 1,
0.0555337, 0.3572598, 1.146858, 1, 0, 0, 1, 1,
0.05570193, 0.3752576, 0.1411986, 1, 0, 0, 1, 1,
0.0574988, -0.4797637, 2.646011, 1, 0, 0, 1, 1,
0.06223174, -0.8710685, 1.600147, 1, 0, 0, 1, 1,
0.06759116, -0.6860021, 2.015609, 1, 0, 0, 1, 1,
0.06968343, 0.1429194, -0.9695445, 0, 0, 0, 1, 1,
0.06991794, 0.4820988, 0.9133869, 0, 0, 0, 1, 1,
0.07005687, 0.3037691, 0.3346182, 0, 0, 0, 1, 1,
0.07034657, -0.1198495, 2.493797, 0, 0, 0, 1, 1,
0.07215454, 0.902232, 0.7859712, 0, 0, 0, 1, 1,
0.07395104, 0.6119755, 0.4635165, 0, 0, 0, 1, 1,
0.07517448, 0.8170207, 0.1208412, 0, 0, 0, 1, 1,
0.0858869, 0.8567897, -0.7970282, 1, 1, 1, 1, 1,
0.08942603, 1.116099, 1.566811, 1, 1, 1, 1, 1,
0.09013201, 0.9468902, -1.396487, 1, 1, 1, 1, 1,
0.09112865, 1.125332, 1.219515, 1, 1, 1, 1, 1,
0.09180907, 0.8157012, 0.1227985, 1, 1, 1, 1, 1,
0.09338848, 0.1951849, -1.17866, 1, 1, 1, 1, 1,
0.09562395, 0.3694227, 0.05474709, 1, 1, 1, 1, 1,
0.09788463, -2.372519, 2.750884, 1, 1, 1, 1, 1,
0.09817866, 0.5345642, -0.3855737, 1, 1, 1, 1, 1,
0.09910133, -0.2972043, 3.730638, 1, 1, 1, 1, 1,
0.100418, 0.7149375, -0.5564328, 1, 1, 1, 1, 1,
0.1018911, 1.772575, 0.4611326, 1, 1, 1, 1, 1,
0.1020492, 0.743767, -2.036752, 1, 1, 1, 1, 1,
0.1042871, -0.03601634, 0.3179233, 1, 1, 1, 1, 1,
0.1055369, 0.5515301, 0.4277438, 1, 1, 1, 1, 1,
0.1089576, -0.1781742, 3.458683, 0, 0, 1, 1, 1,
0.1094349, 1.733727, 1.808946, 1, 0, 0, 1, 1,
0.1157944, 0.6267841, -0.9147407, 1, 0, 0, 1, 1,
0.1218525, -0.7960571, 2.784001, 1, 0, 0, 1, 1,
0.132255, -1.30577, 3.656777, 1, 0, 0, 1, 1,
0.1326552, 0.6048561, -0.7238533, 1, 0, 0, 1, 1,
0.1338198, -1.135686, 3.578727, 0, 0, 0, 1, 1,
0.1347423, 0.9985865, 1.257592, 0, 0, 0, 1, 1,
0.1447318, -0.3157292, 0.5509903, 0, 0, 0, 1, 1,
0.1461683, 0.4806805, -0.6473683, 0, 0, 0, 1, 1,
0.1465171, 0.7254884, -0.5647593, 0, 0, 0, 1, 1,
0.1520765, -1.341059, 2.892228, 0, 0, 0, 1, 1,
0.1533196, -0.4038944, 4.215699, 0, 0, 0, 1, 1,
0.1558244, 2.32353, -0.6239541, 1, 1, 1, 1, 1,
0.1611396, -1.845668, 3.740654, 1, 1, 1, 1, 1,
0.1647986, 0.3088423, 0.4158198, 1, 1, 1, 1, 1,
0.1661265, -0.5350683, 3.971456, 1, 1, 1, 1, 1,
0.1678307, -0.9173582, 3.4682, 1, 1, 1, 1, 1,
0.1686347, -0.203073, 3.40711, 1, 1, 1, 1, 1,
0.1691874, -0.404132, 1.922279, 1, 1, 1, 1, 1,
0.1696339, 0.9350351, -0.8486397, 1, 1, 1, 1, 1,
0.1721692, 0.5013516, -1.257962, 1, 1, 1, 1, 1,
0.1743158, -1.396642, 3.681411, 1, 1, 1, 1, 1,
0.1817083, -0.8085699, 2.213263, 1, 1, 1, 1, 1,
0.1859377, -0.4961062, 1.283509, 1, 1, 1, 1, 1,
0.1867681, 0.9301191, 2.358546, 1, 1, 1, 1, 1,
0.1905372, -0.4037477, 3.879933, 1, 1, 1, 1, 1,
0.1908172, 1.286205, -1.329772, 1, 1, 1, 1, 1,
0.1936918, 1.001544, -1.070442, 0, 0, 1, 1, 1,
0.196438, -1.148603, 1.424117, 1, 0, 0, 1, 1,
0.202683, -0.05701392, 0.4457443, 1, 0, 0, 1, 1,
0.2081395, -0.716692, 3.586308, 1, 0, 0, 1, 1,
0.214071, -0.6513814, 2.861836, 1, 0, 0, 1, 1,
0.2162772, -1.025343, 3.821512, 1, 0, 0, 1, 1,
0.2220651, -0.5187708, 3.42601, 0, 0, 0, 1, 1,
0.2244727, 0.223753, 0.3570222, 0, 0, 0, 1, 1,
0.2266404, 0.3884419, -0.3399457, 0, 0, 0, 1, 1,
0.2300642, 1.389824, -1.947499, 0, 0, 0, 1, 1,
0.2342909, -1.764925, 2.921666, 0, 0, 0, 1, 1,
0.2350247, -0.4738649, 2.367506, 0, 0, 0, 1, 1,
0.2366168, -1.222291, 3.96236, 0, 0, 0, 1, 1,
0.2392701, 0.7624174, 1.498765, 1, 1, 1, 1, 1,
0.2452011, 0.5732789, 1.204651, 1, 1, 1, 1, 1,
0.2467268, 0.6655997, -0.3130038, 1, 1, 1, 1, 1,
0.2494001, -0.1621546, 1.355152, 1, 1, 1, 1, 1,
0.2500886, 0.3101219, -0.5182092, 1, 1, 1, 1, 1,
0.2503273, -0.6485174, 2.252738, 1, 1, 1, 1, 1,
0.2535254, 0.3422297, 1.272455, 1, 1, 1, 1, 1,
0.2538963, -0.01648024, 2.937899, 1, 1, 1, 1, 1,
0.2612803, 0.7942055, 1.583941, 1, 1, 1, 1, 1,
0.2632932, -0.3141134, 2.320891, 1, 1, 1, 1, 1,
0.2634678, 0.8401579, 1.855014, 1, 1, 1, 1, 1,
0.2635259, 0.6926295, -0.2250673, 1, 1, 1, 1, 1,
0.2638145, -0.2600039, 2.620149, 1, 1, 1, 1, 1,
0.2653999, -1.393849, 2.338803, 1, 1, 1, 1, 1,
0.2654031, -1.608768, 3.03324, 1, 1, 1, 1, 1,
0.2659248, 0.9879147, -0.3825122, 0, 0, 1, 1, 1,
0.2718024, 0.07683868, -0.4806875, 1, 0, 0, 1, 1,
0.2758499, 0.2689777, 1.219697, 1, 0, 0, 1, 1,
0.2762917, 2.167706, -1.32432, 1, 0, 0, 1, 1,
0.279682, -1.820266, 2.643922, 1, 0, 0, 1, 1,
0.2797622, -0.03401086, 1.595071, 1, 0, 0, 1, 1,
0.2809817, -0.7756661, 3.169899, 0, 0, 0, 1, 1,
0.2839871, -0.009198348, 1.580658, 0, 0, 0, 1, 1,
0.2846136, 3.119333, 0.6290723, 0, 0, 0, 1, 1,
0.2872517, 2.421385, 0.5086719, 0, 0, 0, 1, 1,
0.2882118, 0.07809904, 1.433286, 0, 0, 0, 1, 1,
0.2891591, -0.8415607, 2.099576, 0, 0, 0, 1, 1,
0.2892935, 1.206774, -1.008247, 0, 0, 0, 1, 1,
0.2916099, 1.881011, 0.2809916, 1, 1, 1, 1, 1,
0.2932398, -0.2268208, 1.892584, 1, 1, 1, 1, 1,
0.294849, 1.669428, 1.038942, 1, 1, 1, 1, 1,
0.2999183, -0.6655563, 4.104097, 1, 1, 1, 1, 1,
0.3007419, -0.2309749, 2.59112, 1, 1, 1, 1, 1,
0.3069582, 0.7445607, -0.3745595, 1, 1, 1, 1, 1,
0.3076611, -0.2185642, 2.022914, 1, 1, 1, 1, 1,
0.308889, -0.1718379, 1.389244, 1, 1, 1, 1, 1,
0.3096544, -0.3127843, 3.274023, 1, 1, 1, 1, 1,
0.3102643, 0.4903669, 0.1216547, 1, 1, 1, 1, 1,
0.3184299, -1.547472, 4.377649, 1, 1, 1, 1, 1,
0.3186883, -0.5194551, 2.200393, 1, 1, 1, 1, 1,
0.3213851, -1.884969, 3.566386, 1, 1, 1, 1, 1,
0.3225659, 0.6720905, 1.451309, 1, 1, 1, 1, 1,
0.3228655, 0.9290168, 1.413411, 1, 1, 1, 1, 1,
0.3255896, -1.659714, 2.251356, 0, 0, 1, 1, 1,
0.3270991, 1.002166, -0.7013368, 1, 0, 0, 1, 1,
0.3283119, 0.1171832, 1.429996, 1, 0, 0, 1, 1,
0.3366695, -0.264413, 2.31385, 1, 0, 0, 1, 1,
0.3382617, -0.4342349, 1.334245, 1, 0, 0, 1, 1,
0.3413152, 1.243453, 0.9316, 1, 0, 0, 1, 1,
0.3454236, -0.6182742, 1.435259, 0, 0, 0, 1, 1,
0.3455486, 1.678373, 0.3081312, 0, 0, 0, 1, 1,
0.3464393, 0.04503148, 1.097603, 0, 0, 0, 1, 1,
0.3479369, -0.5916904, 1.580748, 0, 0, 0, 1, 1,
0.3480013, -1.149056, 2.343795, 0, 0, 0, 1, 1,
0.3507947, 1.23665, 0.9115931, 0, 0, 0, 1, 1,
0.3510657, 0.4699877, 0.4079868, 0, 0, 0, 1, 1,
0.3557175, 0.6630754, 0.1168792, 1, 1, 1, 1, 1,
0.3642972, -0.4580694, 2.181057, 1, 1, 1, 1, 1,
0.3657927, -0.3903184, 1.392378, 1, 1, 1, 1, 1,
0.3701137, -0.8703903, 1.173008, 1, 1, 1, 1, 1,
0.3705896, 1.254025, -0.5707887, 1, 1, 1, 1, 1,
0.3757634, 0.1737456, 0.5300003, 1, 1, 1, 1, 1,
0.3760067, -0.7744653, 3.01113, 1, 1, 1, 1, 1,
0.3793359, -0.3533357, 1.878467, 1, 1, 1, 1, 1,
0.382347, -0.5325001, 3.200026, 1, 1, 1, 1, 1,
0.383205, 0.9588308, 0.2031012, 1, 1, 1, 1, 1,
0.3836789, -0.05929624, 0.5996267, 1, 1, 1, 1, 1,
0.3896395, 2.394151, 0.2051481, 1, 1, 1, 1, 1,
0.3899987, -0.3376722, 2.40557, 1, 1, 1, 1, 1,
0.390958, -2.026421, 3.376503, 1, 1, 1, 1, 1,
0.396116, 0.4112449, 0.3733259, 1, 1, 1, 1, 1,
0.3964935, 1.174714, -0.4280125, 0, 0, 1, 1, 1,
0.397465, 1.079023, -1.148788, 1, 0, 0, 1, 1,
0.401949, -1.7658, 2.232295, 1, 0, 0, 1, 1,
0.4069698, 1.210017, 0.626103, 1, 0, 0, 1, 1,
0.4107459, 1.504631, -0.3079055, 1, 0, 0, 1, 1,
0.4124217, -1.02537, 1.612221, 1, 0, 0, 1, 1,
0.4137564, -0.7323586, 2.684713, 0, 0, 0, 1, 1,
0.4137903, 0.1507303, 1.297877, 0, 0, 0, 1, 1,
0.4174005, -0.8654674, 3.52338, 0, 0, 0, 1, 1,
0.4205345, -0.413697, 2.108462, 0, 0, 0, 1, 1,
0.4208792, 0.06263269, 1.492394, 0, 0, 0, 1, 1,
0.4246045, -0.005455361, 1.507233, 0, 0, 0, 1, 1,
0.4279225, 0.5291998, 0.8031678, 0, 0, 0, 1, 1,
0.429886, 1.799142, 0.4471222, 1, 1, 1, 1, 1,
0.431346, 0.07234026, 0.4626733, 1, 1, 1, 1, 1,
0.4331828, 0.9694358, 0.6780156, 1, 1, 1, 1, 1,
0.4344224, 0.3585241, 0.7787248, 1, 1, 1, 1, 1,
0.4372416, -0.1297317, 2.111918, 1, 1, 1, 1, 1,
0.45077, -0.09753161, 0.6746225, 1, 1, 1, 1, 1,
0.4525953, 0.4813765, 0.3688533, 1, 1, 1, 1, 1,
0.4611031, 0.1378869, -0.6592928, 1, 1, 1, 1, 1,
0.4624453, -0.9894186, 5.604085, 1, 1, 1, 1, 1,
0.4632339, -0.4199953, 3.50603, 1, 1, 1, 1, 1,
0.4639795, -1.786739, 3.018187, 1, 1, 1, 1, 1,
0.464155, 0.07943846, 2.178624, 1, 1, 1, 1, 1,
0.469772, 0.9166753, -0.389635, 1, 1, 1, 1, 1,
0.4698907, 0.2881041, 2.302056, 1, 1, 1, 1, 1,
0.4705402, -0.867107, 3.452005, 1, 1, 1, 1, 1,
0.4758889, 0.1946772, 0.00772707, 0, 0, 1, 1, 1,
0.4769422, -0.9627872, 2.78108, 1, 0, 0, 1, 1,
0.4784953, -0.3439777, 1.939369, 1, 0, 0, 1, 1,
0.4792717, -0.1955785, 1.845191, 1, 0, 0, 1, 1,
0.4840073, -3.390312, 1.863175, 1, 0, 0, 1, 1,
0.4887106, -0.2997209, 2.423948, 1, 0, 0, 1, 1,
0.490434, -0.5771685, 3.501345, 0, 0, 0, 1, 1,
0.4924732, 0.004252052, 0.6092338, 0, 0, 0, 1, 1,
0.4945087, 0.06883205, 3.175457, 0, 0, 0, 1, 1,
0.4977813, 0.8154971, -0.9656661, 0, 0, 0, 1, 1,
0.498394, 1.870939, 0.7597011, 0, 0, 0, 1, 1,
0.4990655, -0.4722986, 1.566541, 0, 0, 0, 1, 1,
0.5022593, 0.2713307, 1.453963, 0, 0, 0, 1, 1,
0.5054116, 0.7840947, 0.9344325, 1, 1, 1, 1, 1,
0.5063056, 0.9000416, 1.306385, 1, 1, 1, 1, 1,
0.5070406, -0.829073, 1.609974, 1, 1, 1, 1, 1,
0.507084, 0.4009645, 2.120969, 1, 1, 1, 1, 1,
0.5071465, 0.1086391, 0.8832034, 1, 1, 1, 1, 1,
0.5082011, 0.1447043, 1.716147, 1, 1, 1, 1, 1,
0.5101318, 2.678391, -1.203916, 1, 1, 1, 1, 1,
0.5123893, -0.2612083, 2.4461, 1, 1, 1, 1, 1,
0.5173711, 1.02033, 3.300556, 1, 1, 1, 1, 1,
0.5181642, -1.566033, 3.805277, 1, 1, 1, 1, 1,
0.5230583, 0.4220682, 0.8908687, 1, 1, 1, 1, 1,
0.5279558, 1.108835, 1.199518, 1, 1, 1, 1, 1,
0.5305749, 1.040579, 1.130859, 1, 1, 1, 1, 1,
0.5353226, 1.343112, 0.1268355, 1, 1, 1, 1, 1,
0.538461, -1.70061, 4.761501, 1, 1, 1, 1, 1,
0.5437091, -0.4482033, 1.410876, 0, 0, 1, 1, 1,
0.5493652, 0.06691109, -0.1657257, 1, 0, 0, 1, 1,
0.5528457, -0.6322483, 2.067449, 1, 0, 0, 1, 1,
0.558358, -0.3982294, 0.2811511, 1, 0, 0, 1, 1,
0.559561, 0.943538, -0.1327893, 1, 0, 0, 1, 1,
0.5596078, 0.917963, -0.4266864, 1, 0, 0, 1, 1,
0.5718715, -3.651211, 4.159066, 0, 0, 0, 1, 1,
0.5727698, 1.145426, 0.708348, 0, 0, 0, 1, 1,
0.5730103, -0.0170042, 2.867983, 0, 0, 0, 1, 1,
0.5735281, 0.2521157, 0.591548, 0, 0, 0, 1, 1,
0.5791174, 0.02462945, 1.258525, 0, 0, 0, 1, 1,
0.5873839, -0.3033542, 0.6701987, 0, 0, 0, 1, 1,
0.5947376, -0.6548547, 1.908488, 0, 0, 0, 1, 1,
0.5973746, 0.04850084, 2.198795, 1, 1, 1, 1, 1,
0.6029784, -0.3625495, 3.235077, 1, 1, 1, 1, 1,
0.606209, 1.128417, 0.3145729, 1, 1, 1, 1, 1,
0.614924, -1.832244, 3.346305, 1, 1, 1, 1, 1,
0.6159289, 0.4847589, 1.007361, 1, 1, 1, 1, 1,
0.6197738, -1.049762, 1.489712, 1, 1, 1, 1, 1,
0.620503, -0.0206312, -0.02895084, 1, 1, 1, 1, 1,
0.6254106, -1.609316, 4.309526, 1, 1, 1, 1, 1,
0.629326, 1.209621, 0.3967446, 1, 1, 1, 1, 1,
0.6377761, -0.3409687, 1.129773, 1, 1, 1, 1, 1,
0.638697, 0.1743003, 0.2056141, 1, 1, 1, 1, 1,
0.6413798, 1.028276, 0.631839, 1, 1, 1, 1, 1,
0.6423982, 0.513858, 1.463593, 1, 1, 1, 1, 1,
0.6429697, 0.2458006, 2.361725, 1, 1, 1, 1, 1,
0.6447219, -0.9528627, 2.941391, 1, 1, 1, 1, 1,
0.6466078, -0.9072241, 3.47961, 0, 0, 1, 1, 1,
0.6478629, -0.3165294, 2.456567, 1, 0, 0, 1, 1,
0.6503924, -0.4484193, 1.458726, 1, 0, 0, 1, 1,
0.655748, 0.5339406, 1.44242, 1, 0, 0, 1, 1,
0.6570484, -0.4478194, 0.8798912, 1, 0, 0, 1, 1,
0.6589231, 1.082774, 0.2846498, 1, 0, 0, 1, 1,
0.6650679, 0.8839604, 0.1534191, 0, 0, 0, 1, 1,
0.6685383, -0.7661873, 2.514889, 0, 0, 0, 1, 1,
0.6695037, 0.3247534, 0.6037123, 0, 0, 0, 1, 1,
0.6732675, -0.3799678, 2.517081, 0, 0, 0, 1, 1,
0.6735641, -0.3120459, 1.518522, 0, 0, 0, 1, 1,
0.6781983, 0.1629313, 1.078542, 0, 0, 0, 1, 1,
0.6795971, 1.25275, 0.007140168, 0, 0, 0, 1, 1,
0.6847237, -0.5630513, 1.719445, 1, 1, 1, 1, 1,
0.6910592, 0.7981194, 2.086507, 1, 1, 1, 1, 1,
0.6919273, 0.4073413, 4.11521, 1, 1, 1, 1, 1,
0.7009929, 0.8403954, 1.352424, 1, 1, 1, 1, 1,
0.7026392, 0.2954963, 1.885985, 1, 1, 1, 1, 1,
0.7058849, 0.9151295, 0.4991403, 1, 1, 1, 1, 1,
0.7060747, 1.434732, 1.760879, 1, 1, 1, 1, 1,
0.7066506, -0.9927906, 2.295112, 1, 1, 1, 1, 1,
0.7100751, 1.934738, 0.850573, 1, 1, 1, 1, 1,
0.7134753, -0.5464749, 3.42345, 1, 1, 1, 1, 1,
0.7145719, -1.120816, 1.653316, 1, 1, 1, 1, 1,
0.7146963, -1.013148, 2.802057, 1, 1, 1, 1, 1,
0.7159345, 0.6634309, 2.461441, 1, 1, 1, 1, 1,
0.7234044, 0.06792817, 0.7700922, 1, 1, 1, 1, 1,
0.7275111, 1.291919, 0.8884477, 1, 1, 1, 1, 1,
0.7278422, -1.053238, 4.193346, 0, 0, 1, 1, 1,
0.7302198, 0.4579614, 0.5109017, 1, 0, 0, 1, 1,
0.7325636, 0.848197, 0.117773, 1, 0, 0, 1, 1,
0.7327447, -2.326124, 3.246618, 1, 0, 0, 1, 1,
0.7355446, -0.4793511, 2.441921, 1, 0, 0, 1, 1,
0.7360973, 1.757581, -1.407315, 1, 0, 0, 1, 1,
0.7370189, 1.918659, -0.9240893, 0, 0, 0, 1, 1,
0.7451462, -0.2876301, 1.83808, 0, 0, 0, 1, 1,
0.7499802, 0.3077295, 0.6925462, 0, 0, 0, 1, 1,
0.7506173, 0.5822502, 0.7297391, 0, 0, 0, 1, 1,
0.7512745, -0.2574511, 1.30302, 0, 0, 0, 1, 1,
0.7595337, -0.3231404, 1.43803, 0, 0, 0, 1, 1,
0.7606891, 0.7138317, 0.5764738, 0, 0, 0, 1, 1,
0.7643552, -1.677754, 4.283672, 1, 1, 1, 1, 1,
0.7676557, -2.139105, 4.231483, 1, 1, 1, 1, 1,
0.767673, -0.07877555, 2.596482, 1, 1, 1, 1, 1,
0.7690828, -0.4334846, 3.05046, 1, 1, 1, 1, 1,
0.7794966, 0.1060212, 2.722492, 1, 1, 1, 1, 1,
0.7815473, 1.473991, -0.1788639, 1, 1, 1, 1, 1,
0.7832968, 0.5399563, 0.357511, 1, 1, 1, 1, 1,
0.7895809, -0.8844984, 2.194614, 1, 1, 1, 1, 1,
0.7909414, 1.303401, 0.8082814, 1, 1, 1, 1, 1,
0.7922953, -0.7882602, 2.971375, 1, 1, 1, 1, 1,
0.7928532, -0.4874546, 3.864679, 1, 1, 1, 1, 1,
0.7949058, 0.2161549, 0.6050309, 1, 1, 1, 1, 1,
0.7950805, 0.09716024, 0.9784476, 1, 1, 1, 1, 1,
0.7970629, -1.358513, 2.476237, 1, 1, 1, 1, 1,
0.8016116, -0.1850672, 0.2954448, 1, 1, 1, 1, 1,
0.8037975, 1.28732, -1.52009, 0, 0, 1, 1, 1,
0.8067157, 0.914387, 1.653007, 1, 0, 0, 1, 1,
0.8087686, 1.816645, -0.6248735, 1, 0, 0, 1, 1,
0.8133515, 2.190387, 0.6185767, 1, 0, 0, 1, 1,
0.8152002, -1.0686, 2.462693, 1, 0, 0, 1, 1,
0.8246621, 0.5658002, 0.6461349, 1, 0, 0, 1, 1,
0.8282214, 0.2478835, 1.722382, 0, 0, 0, 1, 1,
0.8329728, -0.07301438, 0.9147688, 0, 0, 0, 1, 1,
0.8341216, 0.2339699, 1.372279, 0, 0, 0, 1, 1,
0.838483, 0.7463072, 0.4775033, 0, 0, 0, 1, 1,
0.8395987, -1.265491, 2.564937, 0, 0, 0, 1, 1,
0.8420709, 1.090432, -0.09241016, 0, 0, 0, 1, 1,
0.8476804, -0.5289845, 3.115197, 0, 0, 0, 1, 1,
0.8493597, 0.7602309, 1.859471, 1, 1, 1, 1, 1,
0.8495165, 0.5336057, 0.8168098, 1, 1, 1, 1, 1,
0.8496509, 2.333112, 2.122175, 1, 1, 1, 1, 1,
0.8660962, -0.9207795, 1.890067, 1, 1, 1, 1, 1,
0.8670055, 0.2054847, 1.238328, 1, 1, 1, 1, 1,
0.8815859, 0.2407519, 2.063689, 1, 1, 1, 1, 1,
0.885999, 0.3086557, 2.579113, 1, 1, 1, 1, 1,
0.891154, -0.8431516, 1.859473, 1, 1, 1, 1, 1,
0.8915875, -0.4026466, 1.981489, 1, 1, 1, 1, 1,
0.8969532, -0.08710441, 1.507058, 1, 1, 1, 1, 1,
0.9050597, 0.6339122, 1.289763, 1, 1, 1, 1, 1,
0.9082674, 0.869265, 0.04132793, 1, 1, 1, 1, 1,
0.9102947, -0.8547107, -0.3670394, 1, 1, 1, 1, 1,
0.9259875, 0.7539328, 0.1477499, 1, 1, 1, 1, 1,
0.9269105, 1.021207, 1.298743, 1, 1, 1, 1, 1,
0.9300168, 0.9321649, -0.01153584, 0, 0, 1, 1, 1,
0.9353139, -0.1945129, 0.926118, 1, 0, 0, 1, 1,
0.9363884, 0.7195396, -0.2903752, 1, 0, 0, 1, 1,
0.942034, 0.4174159, 0.8144355, 1, 0, 0, 1, 1,
0.9558817, -0.2572411, 2.546226, 1, 0, 0, 1, 1,
0.9647275, 0.1372488, 0.08316115, 1, 0, 0, 1, 1,
0.9742231, 0.09581474, 0.8972978, 0, 0, 0, 1, 1,
0.9902061, -1.386088, 2.362924, 0, 0, 0, 1, 1,
0.9906141, 0.361605, 1.77722, 0, 0, 0, 1, 1,
0.9907774, 0.1188793, 1.507449, 0, 0, 0, 1, 1,
1.005355, -0.1851685, 3.224306, 0, 0, 0, 1, 1,
1.007714, -0.9239001, 2.27828, 0, 0, 0, 1, 1,
1.009581, -0.6181748, 0.2420462, 0, 0, 0, 1, 1,
1.011337, 0.564861, 0.9899163, 1, 1, 1, 1, 1,
1.012285, -1.611182, 2.845114, 1, 1, 1, 1, 1,
1.013735, -1.257516, 1.345946, 1, 1, 1, 1, 1,
1.016446, -0.600793, 1.701801, 1, 1, 1, 1, 1,
1.016545, -0.8306352, 2.036801, 1, 1, 1, 1, 1,
1.016762, -1.058631, 3.351547, 1, 1, 1, 1, 1,
1.020485, -0.8269, 2.207382, 1, 1, 1, 1, 1,
1.021172, 0.4382313, 0.007418086, 1, 1, 1, 1, 1,
1.029768, -0.3750672, 0.1739796, 1, 1, 1, 1, 1,
1.034882, -0.3950065, 2.433815, 1, 1, 1, 1, 1,
1.035243, -1.057889, 4.653246, 1, 1, 1, 1, 1,
1.036848, 0.3467523, 1.398131, 1, 1, 1, 1, 1,
1.037721, -1.08996, 2.244589, 1, 1, 1, 1, 1,
1.045099, 0.4821443, 2.210341, 1, 1, 1, 1, 1,
1.051668, -1.456195, 3.347042, 1, 1, 1, 1, 1,
1.05428, 0.7121646, 0.0008105416, 0, 0, 1, 1, 1,
1.065423, 0.8784677, -0.1830382, 1, 0, 0, 1, 1,
1.066798, 0.5235563, 1.166561, 1, 0, 0, 1, 1,
1.068768, -1.355057, 2.937091, 1, 0, 0, 1, 1,
1.069554, -1.86161, 3.063086, 1, 0, 0, 1, 1,
1.070861, -0.5412008, 2.858449, 1, 0, 0, 1, 1,
1.079867, -0.4126499, 3.889944, 0, 0, 0, 1, 1,
1.083246, -1.818657, 2.533275, 0, 0, 0, 1, 1,
1.092223, 0.6345484, 0.6216084, 0, 0, 0, 1, 1,
1.105844, -0.01620203, 1.316342, 0, 0, 0, 1, 1,
1.12842, 0.1908152, 0.9070145, 0, 0, 0, 1, 1,
1.128906, 0.03037292, 0.702175, 0, 0, 0, 1, 1,
1.135017, -0.6453204, 1.841144, 0, 0, 0, 1, 1,
1.135557, -1.253813, 3.061357, 1, 1, 1, 1, 1,
1.147478, -0.9837235, 4.100514, 1, 1, 1, 1, 1,
1.155787, -0.6506368, 1.664259, 1, 1, 1, 1, 1,
1.158501, 0.7977231, 2.319416, 1, 1, 1, 1, 1,
1.159891, -0.5198331, 1.04257, 1, 1, 1, 1, 1,
1.163051, -0.06490365, 1.225979, 1, 1, 1, 1, 1,
1.166157, -0.03161031, 0.533196, 1, 1, 1, 1, 1,
1.180949, 0.7320217, 1.542284, 1, 1, 1, 1, 1,
1.183332, -0.6002146, 0.01311382, 1, 1, 1, 1, 1,
1.18795, -0.4833466, 2.560263, 1, 1, 1, 1, 1,
1.188691, -0.6943122, 4.15179, 1, 1, 1, 1, 1,
1.195402, 0.8427452, 0.4758342, 1, 1, 1, 1, 1,
1.199749, 0.227562, -0.5007203, 1, 1, 1, 1, 1,
1.20194, -0.9763985, 1.708061, 1, 1, 1, 1, 1,
1.219147, 1.486526, 1.333648, 1, 1, 1, 1, 1,
1.219635, -0.8201976, 2.603965, 0, 0, 1, 1, 1,
1.22126, 1.391787, -0.9178826, 1, 0, 0, 1, 1,
1.240339, 0.3546416, 3.332758, 1, 0, 0, 1, 1,
1.241229, -0.02614182, 2.92536, 1, 0, 0, 1, 1,
1.243691, -1.491106, 0.1685643, 1, 0, 0, 1, 1,
1.244434, -1.079399, 1.440329, 1, 0, 0, 1, 1,
1.250302, -2.161727, 3.436261, 0, 0, 0, 1, 1,
1.257607, 0.6708043, 1.108406, 0, 0, 0, 1, 1,
1.261203, 0.2883855, 2.610797, 0, 0, 0, 1, 1,
1.265858, -1.052806, 2.656434, 0, 0, 0, 1, 1,
1.267553, -1.823124, 2.135754, 0, 0, 0, 1, 1,
1.26907, 0.07892481, 2.07595, 0, 0, 0, 1, 1,
1.274745, -0.6641143, 2.43395, 0, 0, 0, 1, 1,
1.276929, 1.084326, 2.178241, 1, 1, 1, 1, 1,
1.276932, 1.478873, 2.622957, 1, 1, 1, 1, 1,
1.282835, -0.9383548, 1.321019, 1, 1, 1, 1, 1,
1.286241, -0.6089113, 2.078296, 1, 1, 1, 1, 1,
1.287121, 2.314694, -1.110404, 1, 1, 1, 1, 1,
1.298983, -1.167597, 3.438844, 1, 1, 1, 1, 1,
1.302223, 0.1450296, 1.824251, 1, 1, 1, 1, 1,
1.302548, -1.26801, 0.8889911, 1, 1, 1, 1, 1,
1.307778, 0.1771901, 2.758054, 1, 1, 1, 1, 1,
1.321097, 0.2462163, 0.9466991, 1, 1, 1, 1, 1,
1.325534, 1.636152, 0.2705255, 1, 1, 1, 1, 1,
1.330103, 0.231707, 0.2545856, 1, 1, 1, 1, 1,
1.331701, -0.3461107, 2.684682, 1, 1, 1, 1, 1,
1.335915, -0.8475353, 1.067472, 1, 1, 1, 1, 1,
1.336905, 0.3473903, 2.376013, 1, 1, 1, 1, 1,
1.350811, 0.2622491, 4.135999, 0, 0, 1, 1, 1,
1.353469, 0.5672692, 1.761846, 1, 0, 0, 1, 1,
1.361966, 1.297647, -0.4888623, 1, 0, 0, 1, 1,
1.366424, -0.1606056, 0.2430319, 1, 0, 0, 1, 1,
1.367406, -0.004855343, 1.136014, 1, 0, 0, 1, 1,
1.367932, 0.2747129, 1.172313, 1, 0, 0, 1, 1,
1.369584, 0.9906213, -0.04373343, 0, 0, 0, 1, 1,
1.375717, 0.4116593, 0.9295531, 0, 0, 0, 1, 1,
1.402756, 3.123235, 1.23331, 0, 0, 0, 1, 1,
1.404526, 1.122565, 1.35009, 0, 0, 0, 1, 1,
1.411044, -0.9136794, 3.167047, 0, 0, 0, 1, 1,
1.414862, -0.1150974, 3.330468, 0, 0, 0, 1, 1,
1.418782, -1.337808, 3.275924, 0, 0, 0, 1, 1,
1.42098, -1.208931, 2.1558, 1, 1, 1, 1, 1,
1.430519, -1.420806, 0.6400898, 1, 1, 1, 1, 1,
1.434477, 0.4192839, 0.1480613, 1, 1, 1, 1, 1,
1.436429, -1.226674, 1.149798, 1, 1, 1, 1, 1,
1.451584, 1.03813, 0.3545936, 1, 1, 1, 1, 1,
1.452103, -1.531727, 1.541241, 1, 1, 1, 1, 1,
1.460612, 0.9824791, 2.626431, 1, 1, 1, 1, 1,
1.463918, 0.1968132, 0.2307838, 1, 1, 1, 1, 1,
1.46704, -1.229886, 2.522273, 1, 1, 1, 1, 1,
1.46973, -1.318156, 1.801985, 1, 1, 1, 1, 1,
1.477201, 0.1846596, 0.7321669, 1, 1, 1, 1, 1,
1.478204, -0.0523171, 1.506121, 1, 1, 1, 1, 1,
1.49284, -0.06850108, 1.557591, 1, 1, 1, 1, 1,
1.512235, 0.1039044, 3.157547, 1, 1, 1, 1, 1,
1.513458, 0.1630428, 1.25167, 1, 1, 1, 1, 1,
1.528363, 0.01219411, 1.890884, 0, 0, 1, 1, 1,
1.531135, 0.548008, 1.448967, 1, 0, 0, 1, 1,
1.547564, 0.05384651, 1.067939, 1, 0, 0, 1, 1,
1.556191, 0.1105233, 2.297513, 1, 0, 0, 1, 1,
1.563527, 0.4007069, -0.1939016, 1, 0, 0, 1, 1,
1.584221, 1.150757, 1.514392, 1, 0, 0, 1, 1,
1.586137, -1.035524, 1.892733, 0, 0, 0, 1, 1,
1.588301, -0.3744351, 2.411086, 0, 0, 0, 1, 1,
1.639042, 2.042494, -0.1441803, 0, 0, 0, 1, 1,
1.664622, -0.3555733, 0.8655338, 0, 0, 0, 1, 1,
1.665905, -1.758968, 4.042335, 0, 0, 0, 1, 1,
1.667064, -0.7258837, 1.224498, 0, 0, 0, 1, 1,
1.66731, 0.9532762, 2.479474, 0, 0, 0, 1, 1,
1.670583, 0.891322, -0.1650465, 1, 1, 1, 1, 1,
1.672445, -0.6619371, 1.004397, 1, 1, 1, 1, 1,
1.674374, 1.017144, 0.4597023, 1, 1, 1, 1, 1,
1.676288, -0.1729598, 0.2307336, 1, 1, 1, 1, 1,
1.676697, -1.602941, 3.07762, 1, 1, 1, 1, 1,
1.683177, -1.879469, 2.112279, 1, 1, 1, 1, 1,
1.684961, -2.118564, 2.849732, 1, 1, 1, 1, 1,
1.696962, 0.4914694, 1.74218, 1, 1, 1, 1, 1,
1.69843, 0.05844381, 2.71168, 1, 1, 1, 1, 1,
1.710974, 1.683404, 1.378575, 1, 1, 1, 1, 1,
1.711455, 0.1718373, 1.690648, 1, 1, 1, 1, 1,
1.732006, -0.1413802, 2.099881, 1, 1, 1, 1, 1,
1.73901, 0.2665381, 0.2433538, 1, 1, 1, 1, 1,
1.75143, 0.893214, 1.122274, 1, 1, 1, 1, 1,
1.779008, 1.868023, 0.3327664, 1, 1, 1, 1, 1,
1.782864, 2.2413, 0.2522144, 0, 0, 1, 1, 1,
1.783536, -1.392874, 3.61839, 1, 0, 0, 1, 1,
1.819182, 0.382911, 2.499338, 1, 0, 0, 1, 1,
1.81935, -0.5630885, 1.86394, 1, 0, 0, 1, 1,
1.825521, 1.273481, 0.9869515, 1, 0, 0, 1, 1,
1.836941, -1.360389, 1.718473, 1, 0, 0, 1, 1,
1.840545, -0.1742184, 1.664324, 0, 0, 0, 1, 1,
1.841743, 0.8988842, -0.07880589, 0, 0, 0, 1, 1,
1.853811, -0.06722175, 1.20061, 0, 0, 0, 1, 1,
1.864616, 1.820192, 0.8620932, 0, 0, 0, 1, 1,
1.867866, -0.2849025, 0.837535, 0, 0, 0, 1, 1,
1.880352, -1.580177, 1.388915, 0, 0, 0, 1, 1,
1.883166, 0.07470155, 2.184958, 0, 0, 0, 1, 1,
1.887293, -1.965071, -0.2910056, 1, 1, 1, 1, 1,
1.898187, -1.620033, 2.588345, 1, 1, 1, 1, 1,
1.918433, -0.8242318, 0.6602791, 1, 1, 1, 1, 1,
1.929159, -1.231702, 2.27665, 1, 1, 1, 1, 1,
1.953944, -0.5320847, 0.4016099, 1, 1, 1, 1, 1,
1.956635, -0.3785841, 1.129789, 1, 1, 1, 1, 1,
1.977299, 0.120624, 1.059141, 1, 1, 1, 1, 1,
2.000143, -0.1977512, 1.77216, 1, 1, 1, 1, 1,
2.006532, 0.7019984, -0.5571141, 1, 1, 1, 1, 1,
2.02335, 0.9984975, 0.9822879, 1, 1, 1, 1, 1,
2.044973, 2.705593, 2.979561, 1, 1, 1, 1, 1,
2.067969, 2.527017, 0.6188486, 1, 1, 1, 1, 1,
2.071862, -0.1176268, 2.701152, 1, 1, 1, 1, 1,
2.07287, 0.8025844, 0.9845231, 1, 1, 1, 1, 1,
2.074869, 0.8080317, -0.02358068, 1, 1, 1, 1, 1,
2.202387, -0.04988321, 0.652061, 0, 0, 1, 1, 1,
2.247376, -1.257046, 1.472719, 1, 0, 0, 1, 1,
2.249369, 1.235942, 0.5310383, 1, 0, 0, 1, 1,
2.263268, 0.5752633, 2.548892, 1, 0, 0, 1, 1,
2.287715, -1.465725, 2.762967, 1, 0, 0, 1, 1,
2.296655, 1.56369, 1.252271, 1, 0, 0, 1, 1,
2.315846, 0.6706914, 1.801914, 0, 0, 0, 1, 1,
2.370841, -3.51707, 1.458661, 0, 0, 0, 1, 1,
2.459476, 0.09248082, 1.326798, 0, 0, 0, 1, 1,
2.570551, -0.7480799, -0.06858723, 0, 0, 0, 1, 1,
2.60787, -1.571554, 2.246384, 0, 0, 0, 1, 1,
2.611753, -0.02702986, 0.5155382, 0, 0, 0, 1, 1,
2.616419, 0.5270054, 1.35515, 0, 0, 0, 1, 1,
2.712506, -1.939615, 2.665683, 1, 1, 1, 1, 1,
2.717737, 1.052643, 2.995307, 1, 1, 1, 1, 1,
2.818244, 0.05588269, 1.292092, 1, 1, 1, 1, 1,
2.880704, -1.223203, 3.040148, 1, 1, 1, 1, 1,
3.128125, 0.3648516, 0.8338137, 1, 1, 1, 1, 1,
3.138135, 0.09457966, 2.418019, 1, 1, 1, 1, 1,
3.33639, 0.6086327, 0.889397, 1, 1, 1, 1, 1
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
var radius = 10.3289;
var distance = 36.27983;
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
mvMatrix.translate( 0.07076502, 0.2639878, 0.4315157 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -36.27983);
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