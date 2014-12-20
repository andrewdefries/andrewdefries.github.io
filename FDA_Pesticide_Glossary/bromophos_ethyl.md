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
-3.851566, -0.7418225, -0.5054048, 1, 0, 0, 1,
-3.516467, -0.3508582, -2.074026, 1, 0.007843138, 0, 1,
-3.157277, -1.288421, -2.527332, 1, 0.01176471, 0, 1,
-2.793114, 0.3670762, -1.958082, 1, 0.01960784, 0, 1,
-2.713986, 1.433409, -1.568807, 1, 0.02352941, 0, 1,
-2.680484, 0.2665375, -0.3620075, 1, 0.03137255, 0, 1,
-2.666526, -0.5094216, -1.493622, 1, 0.03529412, 0, 1,
-2.475781, 0.3974192, -3.89508, 1, 0.04313726, 0, 1,
-2.427601, -0.5205332, -2.204281, 1, 0.04705882, 0, 1,
-2.411976, -1.349192, -1.200224, 1, 0.05490196, 0, 1,
-2.320642, -1.59425, -3.508332, 1, 0.05882353, 0, 1,
-2.280608, -1.267714, -2.277327, 1, 0.06666667, 0, 1,
-2.178886, 0.5204865, -2.698104, 1, 0.07058824, 0, 1,
-2.134429, -0.380456, 1.250369, 1, 0.07843138, 0, 1,
-2.126101, 3.08152, 1.334837, 1, 0.08235294, 0, 1,
-2.118688, 1.06226, -0.8265846, 1, 0.09019608, 0, 1,
-2.105749, -0.1138026, -1.765862, 1, 0.09411765, 0, 1,
-2.07641, 0.6998233, -0.5334662, 1, 0.1019608, 0, 1,
-2.054291, 0.2099786, -3.112885, 1, 0.1098039, 0, 1,
-2.046438, 1.596136, -0.3813837, 1, 0.1137255, 0, 1,
-2.03085, -0.750397, -1.417853, 1, 0.1215686, 0, 1,
-2.011028, 0.7999759, -1.254741, 1, 0.1254902, 0, 1,
-1.998255, 1.223405, -0.4917903, 1, 0.1333333, 0, 1,
-1.98881, -2.73325, -2.341245, 1, 0.1372549, 0, 1,
-1.966833, 0.2255812, -1.20504, 1, 0.145098, 0, 1,
-1.945811, 0.3897984, -1.664074, 1, 0.1490196, 0, 1,
-1.94247, 2.304945, -0.0779153, 1, 0.1568628, 0, 1,
-1.915336, -0.2646289, -0.9431558, 1, 0.1607843, 0, 1,
-1.881438, -1.629487, -3.502563, 1, 0.1686275, 0, 1,
-1.842024, 1.006422, -1.968994, 1, 0.172549, 0, 1,
-1.83983, -0.6788478, -0.1023538, 1, 0.1803922, 0, 1,
-1.837325, 0.3982266, -1.142558, 1, 0.1843137, 0, 1,
-1.790299, -0.1791194, -0.7876356, 1, 0.1921569, 0, 1,
-1.785424, 0.43487, -1.469749, 1, 0.1960784, 0, 1,
-1.782316, -0.7469541, -2.548872, 1, 0.2039216, 0, 1,
-1.780611, 0.6904057, -2.333549, 1, 0.2117647, 0, 1,
-1.774292, -0.6950534, -0.3317589, 1, 0.2156863, 0, 1,
-1.752607, 0.1453888, -1.725217, 1, 0.2235294, 0, 1,
-1.747388, -1.190531, -2.95728, 1, 0.227451, 0, 1,
-1.739672, 0.2584351, -1.557432, 1, 0.2352941, 0, 1,
-1.717809, 0.1779579, -1.907597, 1, 0.2392157, 0, 1,
-1.667921, -2.418076, -2.414621, 1, 0.2470588, 0, 1,
-1.643561, 0.29407, -0.337944, 1, 0.2509804, 0, 1,
-1.639681, 0.7926229, -3.174779, 1, 0.2588235, 0, 1,
-1.633134, 1.2459, -0.5781937, 1, 0.2627451, 0, 1,
-1.624985, -0.3056614, -2.745592, 1, 0.2705882, 0, 1,
-1.621783, -0.3796913, -2.99193, 1, 0.2745098, 0, 1,
-1.615836, 0.50769, -0.7213044, 1, 0.282353, 0, 1,
-1.611977, -1.560101, -1.950398, 1, 0.2862745, 0, 1,
-1.608737, -1.600261, -0.3070195, 1, 0.2941177, 0, 1,
-1.6026, -0.8670396, -0.08034188, 1, 0.3019608, 0, 1,
-1.586516, -0.8095786, -1.74893, 1, 0.3058824, 0, 1,
-1.58115, -0.6774201, -0.1836413, 1, 0.3137255, 0, 1,
-1.56513, -0.2894171, -3.326639, 1, 0.3176471, 0, 1,
-1.55632, -0.4820746, -1.136099, 1, 0.3254902, 0, 1,
-1.548894, -0.4094863, -2.785662, 1, 0.3294118, 0, 1,
-1.536917, 1.129176, -1.200998, 1, 0.3372549, 0, 1,
-1.532176, 1.532358, 0.7840547, 1, 0.3411765, 0, 1,
-1.531414, -1.491469, -2.559402, 1, 0.3490196, 0, 1,
-1.514849, 1.535151, -0.4417928, 1, 0.3529412, 0, 1,
-1.498556, 0.5973764, 0.9606963, 1, 0.3607843, 0, 1,
-1.482396, 0.08781223, -3.873082, 1, 0.3647059, 0, 1,
-1.47853, 0.4121246, -0.2544607, 1, 0.372549, 0, 1,
-1.473474, 2.668568, 0.961379, 1, 0.3764706, 0, 1,
-1.472783, -1.159246, -3.039332, 1, 0.3843137, 0, 1,
-1.47077, -1.09428, -0.5241069, 1, 0.3882353, 0, 1,
-1.465949, -0.5977662, -1.358742, 1, 0.3960784, 0, 1,
-1.463244, 1.09587, -2.295458, 1, 0.4039216, 0, 1,
-1.458341, 0.5115695, -2.17314, 1, 0.4078431, 0, 1,
-1.455307, -0.6138611, -2.926872, 1, 0.4156863, 0, 1,
-1.453933, -0.5707595, -1.718483, 1, 0.4196078, 0, 1,
-1.440601, 0.6428011, 1.337457, 1, 0.427451, 0, 1,
-1.427928, -2.334609, -2.761667, 1, 0.4313726, 0, 1,
-1.412535, 1.453511, -0.8874536, 1, 0.4392157, 0, 1,
-1.411037, -1.10033, -1.596049, 1, 0.4431373, 0, 1,
-1.405789, 0.3872686, -1.299452, 1, 0.4509804, 0, 1,
-1.394598, -0.3177283, -1.056461, 1, 0.454902, 0, 1,
-1.384861, 0.1859301, -2.80876, 1, 0.4627451, 0, 1,
-1.352733, 0.2023538, -0.9399757, 1, 0.4666667, 0, 1,
-1.352182, 1.676603, -0.4664021, 1, 0.4745098, 0, 1,
-1.340066, 0.3223555, -0.1378247, 1, 0.4784314, 0, 1,
-1.331587, -0.8134832, -2.860476, 1, 0.4862745, 0, 1,
-1.33103, 0.6904475, -0.7220054, 1, 0.4901961, 0, 1,
-1.302251, 0.821879, -0.1955133, 1, 0.4980392, 0, 1,
-1.295738, -1.501237, -3.758833, 1, 0.5058824, 0, 1,
-1.294426, -1.951085, -1.316185, 1, 0.509804, 0, 1,
-1.290951, -0.5646217, -2.599425, 1, 0.5176471, 0, 1,
-1.286037, 0.1082776, -1.485104, 1, 0.5215687, 0, 1,
-1.285247, -1.33247, -2.785372, 1, 0.5294118, 0, 1,
-1.284525, 0.2556939, -2.903118, 1, 0.5333334, 0, 1,
-1.276515, -0.08258291, -1.868911, 1, 0.5411765, 0, 1,
-1.26888, -2.277838, -1.855259, 1, 0.5450981, 0, 1,
-1.262148, -1.083444, -1.444991, 1, 0.5529412, 0, 1,
-1.259109, -0.7670214, -0.6643972, 1, 0.5568628, 0, 1,
-1.258556, 0.7059621, 0.3131731, 1, 0.5647059, 0, 1,
-1.246188, 1.011035, -0.8434274, 1, 0.5686275, 0, 1,
-1.24413, -2.637567, -1.930905, 1, 0.5764706, 0, 1,
-1.234595, -0.1085478, -0.3440588, 1, 0.5803922, 0, 1,
-1.231886, 1.126411, -0.5034816, 1, 0.5882353, 0, 1,
-1.231747, 0.846278, -2.188062, 1, 0.5921569, 0, 1,
-1.228107, -0.3157173, -2.276152, 1, 0.6, 0, 1,
-1.204401, 1.615869, -0.3141911, 1, 0.6078432, 0, 1,
-1.194683, 1.471364, -0.740673, 1, 0.6117647, 0, 1,
-1.184299, -0.8787059, -2.358239, 1, 0.6196079, 0, 1,
-1.177598, 0.6478539, -0.9144139, 1, 0.6235294, 0, 1,
-1.176838, -0.1187515, -0.2176504, 1, 0.6313726, 0, 1,
-1.175905, -0.7814796, -2.32799, 1, 0.6352941, 0, 1,
-1.169361, -0.7798252, -0.6300617, 1, 0.6431373, 0, 1,
-1.152145, 0.3057134, 0.4491448, 1, 0.6470588, 0, 1,
-1.145774, -1.366277, -1.359011, 1, 0.654902, 0, 1,
-1.141599, -0.04917188, -1.947662, 1, 0.6588235, 0, 1,
-1.137662, 1.201944, -0.4957863, 1, 0.6666667, 0, 1,
-1.127511, 0.3943358, -2.060163, 1, 0.6705883, 0, 1,
-1.117432, -1.400274, -1.457865, 1, 0.6784314, 0, 1,
-1.106332, 0.4313798, -2.543002, 1, 0.682353, 0, 1,
-1.106142, 0.08463841, -0.9270189, 1, 0.6901961, 0, 1,
-1.10498, 0.7512729, -0.247489, 1, 0.6941177, 0, 1,
-1.103684, 0.5357289, -2.008104, 1, 0.7019608, 0, 1,
-1.103327, -0.7047752, -2.388843, 1, 0.7098039, 0, 1,
-1.097039, -0.3123474, -2.486187, 1, 0.7137255, 0, 1,
-1.093345, 0.2228781, -2.933131, 1, 0.7215686, 0, 1,
-1.092864, -1.596254, -1.694407, 1, 0.7254902, 0, 1,
-1.091782, 0.391772, -2.29367, 1, 0.7333333, 0, 1,
-1.090076, -1.48182, -3.092725, 1, 0.7372549, 0, 1,
-1.080564, 1.192813, -0.1253666, 1, 0.7450981, 0, 1,
-1.080342, -1.000973, -2.273295, 1, 0.7490196, 0, 1,
-1.073915, -1.012959, -2.968771, 1, 0.7568628, 0, 1,
-1.063469, -0.5378484, -3.686018, 1, 0.7607843, 0, 1,
-1.055796, -1.266457, -2.71187, 1, 0.7686275, 0, 1,
-1.054408, 1.737047, -0.9296982, 1, 0.772549, 0, 1,
-1.054356, 0.4021901, -2.197979, 1, 0.7803922, 0, 1,
-1.054194, -0.7735884, -0.6270853, 1, 0.7843137, 0, 1,
-1.054107, 1.11035, -3.946782, 1, 0.7921569, 0, 1,
-1.049369, 1.387015, 0.1631308, 1, 0.7960784, 0, 1,
-1.04886, -0.7179558, -1.122762, 1, 0.8039216, 0, 1,
-1.045921, 0.3876946, -3.257612, 1, 0.8117647, 0, 1,
-1.044402, 0.8126584, 1.18822, 1, 0.8156863, 0, 1,
-1.042657, 0.6015549, -0.4641532, 1, 0.8235294, 0, 1,
-1.0302, 1.676047, -1.379766, 1, 0.827451, 0, 1,
-1.028922, 1.454217, -1.155488, 1, 0.8352941, 0, 1,
-1.022876, -0.965103, -0.8132886, 1, 0.8392157, 0, 1,
-1.022818, -0.6258447, -5.179375, 1, 0.8470588, 0, 1,
-1.016458, 0.04461884, -1.620944, 1, 0.8509804, 0, 1,
-1.013964, 1.321722, -0.004689518, 1, 0.8588235, 0, 1,
-1.01166, -0.6903052, -3.281024, 1, 0.8627451, 0, 1,
-1.005021, -0.6482741, -5.453898, 1, 0.8705882, 0, 1,
-0.9992507, -0.4771722, -0.9550375, 1, 0.8745098, 0, 1,
-0.9897795, 0.5947515, -0.5661901, 1, 0.8823529, 0, 1,
-0.9845707, -0.2180374, -2.638323, 1, 0.8862745, 0, 1,
-0.9794468, 0.2911353, -0.7951741, 1, 0.8941177, 0, 1,
-0.9762721, -0.7503734, -2.479338, 1, 0.8980392, 0, 1,
-0.957681, -1.214631, -2.749581, 1, 0.9058824, 0, 1,
-0.9480293, -0.08085709, -2.975151, 1, 0.9137255, 0, 1,
-0.9475985, -2.091173, -1.558489, 1, 0.9176471, 0, 1,
-0.9462026, -1.519547, -3.009246, 1, 0.9254902, 0, 1,
-0.9367731, 0.1541101, -1.832518, 1, 0.9294118, 0, 1,
-0.9349756, 0.7217171, -2.688314, 1, 0.9372549, 0, 1,
-0.9291026, -0.7146389, -0.6146994, 1, 0.9411765, 0, 1,
-0.9280146, -1.174027, -1.41244, 1, 0.9490196, 0, 1,
-0.9162672, -0.8753182, -3.314997, 1, 0.9529412, 0, 1,
-0.9142991, -1.448572, -3.788652, 1, 0.9607843, 0, 1,
-0.9118113, -1.16496, -3.335041, 1, 0.9647059, 0, 1,
-0.9063938, -2.34042, -2.433055, 1, 0.972549, 0, 1,
-0.8997529, 0.89799, -1.146058, 1, 0.9764706, 0, 1,
-0.8989807, 0.5790158, -1.374491, 1, 0.9843137, 0, 1,
-0.8848068, -0.9005252, -2.582862, 1, 0.9882353, 0, 1,
-0.8838252, -1.702918, -2.753819, 1, 0.9960784, 0, 1,
-0.8830269, 0.9885817, -0.3312598, 0.9960784, 1, 0, 1,
-0.8829446, 1.539877, -1.564437, 0.9921569, 1, 0, 1,
-0.8744742, 0.3018411, -1.38339, 0.9843137, 1, 0, 1,
-0.8730026, -0.04639965, -0.8506191, 0.9803922, 1, 0, 1,
-0.8693858, -1.041431, -3.541929, 0.972549, 1, 0, 1,
-0.8665711, -1.00798, -1.141752, 0.9686275, 1, 0, 1,
-0.8620632, 0.7667323, 0.6793845, 0.9607843, 1, 0, 1,
-0.8606322, -0.1163827, 0.3365471, 0.9568627, 1, 0, 1,
-0.8583755, -0.793557, -1.660246, 0.9490196, 1, 0, 1,
-0.8580302, 0.04071944, -3.404878, 0.945098, 1, 0, 1,
-0.8535704, -0.362415, -2.437755, 0.9372549, 1, 0, 1,
-0.8532394, -0.2921361, -2.48719, 0.9333333, 1, 0, 1,
-0.8509588, 0.5093138, -1.565276, 0.9254902, 1, 0, 1,
-0.8476345, 0.986834, -1.08045, 0.9215686, 1, 0, 1,
-0.84687, -0.3597153, -0.1884319, 0.9137255, 1, 0, 1,
-0.8388453, 0.679414, -2.012, 0.9098039, 1, 0, 1,
-0.8382391, -1.012286, -0.3489273, 0.9019608, 1, 0, 1,
-0.8370211, 0.4484268, -0.5488963, 0.8941177, 1, 0, 1,
-0.8339679, -1.53597, -2.190375, 0.8901961, 1, 0, 1,
-0.8272091, -0.2362854, -0.730865, 0.8823529, 1, 0, 1,
-0.8242561, 0.5218278, 0.7346495, 0.8784314, 1, 0, 1,
-0.8225715, 1.640024, -1.213178, 0.8705882, 1, 0, 1,
-0.8192923, -0.2595019, -0.7771451, 0.8666667, 1, 0, 1,
-0.808167, 1.094298, -2.086684, 0.8588235, 1, 0, 1,
-0.7914832, 0.8419249, 0.4358812, 0.854902, 1, 0, 1,
-0.789765, -0.2523732, -1.027256, 0.8470588, 1, 0, 1,
-0.7849343, -1.017301, -3.032319, 0.8431373, 1, 0, 1,
-0.7835873, -1.239043, -3.64745, 0.8352941, 1, 0, 1,
-0.7827391, -0.2342608, -1.742306, 0.8313726, 1, 0, 1,
-0.7804241, 0.1913894, -0.9714307, 0.8235294, 1, 0, 1,
-0.7771802, 1.366991, -0.003069809, 0.8196079, 1, 0, 1,
-0.7718326, -1.083388, -2.314305, 0.8117647, 1, 0, 1,
-0.7674373, 0.3579729, -1.781059, 0.8078431, 1, 0, 1,
-0.7670149, 0.8383293, -0.4150531, 0.8, 1, 0, 1,
-0.7658238, 0.79681, -0.9804119, 0.7921569, 1, 0, 1,
-0.7632874, 0.7569768, -1.257162, 0.7882353, 1, 0, 1,
-0.7631004, 1.223326, 0.5842609, 0.7803922, 1, 0, 1,
-0.7593931, -0.8413408, -1.569095, 0.7764706, 1, 0, 1,
-0.7581756, 1.197105, 0.3757479, 0.7686275, 1, 0, 1,
-0.7541156, -0.6457963, -2.443437, 0.7647059, 1, 0, 1,
-0.7518724, -0.3961207, -2.163497, 0.7568628, 1, 0, 1,
-0.7438185, 0.7386548, 0.2059653, 0.7529412, 1, 0, 1,
-0.7413476, -0.02072858, -2.608852, 0.7450981, 1, 0, 1,
-0.740808, -0.5334867, -4.477581, 0.7411765, 1, 0, 1,
-0.7372925, -0.6017807, -0.4785571, 0.7333333, 1, 0, 1,
-0.7368992, -1.483969, -3.569131, 0.7294118, 1, 0, 1,
-0.7367565, 0.6226341, 0.764495, 0.7215686, 1, 0, 1,
-0.7349421, 0.2695163, 0.6503448, 0.7176471, 1, 0, 1,
-0.7304262, 1.264912, 0.8615546, 0.7098039, 1, 0, 1,
-0.7238481, -2.272259, -1.372468, 0.7058824, 1, 0, 1,
-0.7220781, 1.409671, 0.9435871, 0.6980392, 1, 0, 1,
-0.7187716, 1.082686, -0.615471, 0.6901961, 1, 0, 1,
-0.7174909, 1.686407, -0.3662925, 0.6862745, 1, 0, 1,
-0.7147434, 0.7388269, -0.2357603, 0.6784314, 1, 0, 1,
-0.7143832, 0.6712225, 0.9658193, 0.6745098, 1, 0, 1,
-0.7099146, 0.3534542, -2.692548, 0.6666667, 1, 0, 1,
-0.7068073, -0.530106, -5.060184, 0.6627451, 1, 0, 1,
-0.700388, 0.04353609, -1.696873, 0.654902, 1, 0, 1,
-0.6954488, 1.335467, -0.9072649, 0.6509804, 1, 0, 1,
-0.6940162, 0.4401211, -1.002308, 0.6431373, 1, 0, 1,
-0.6910533, 0.9596637, -0.8690919, 0.6392157, 1, 0, 1,
-0.6871272, -1.825738, -4.211862, 0.6313726, 1, 0, 1,
-0.6856039, -0.3218721, -3.327476, 0.627451, 1, 0, 1,
-0.6827378, -1.574558, -3.938222, 0.6196079, 1, 0, 1,
-0.6818646, -0.5124485, -1.615945, 0.6156863, 1, 0, 1,
-0.6805584, -1.708714, -4.008021, 0.6078432, 1, 0, 1,
-0.6779779, -0.0100541, -3.010459, 0.6039216, 1, 0, 1,
-0.6762651, -1.802766, -3.094315, 0.5960785, 1, 0, 1,
-0.6741637, -1.163131, -3.47572, 0.5882353, 1, 0, 1,
-0.6706964, 1.430637, -0.2652495, 0.5843138, 1, 0, 1,
-0.6700828, 1.608924, -0.8660639, 0.5764706, 1, 0, 1,
-0.6691661, -1.65986, -3.098814, 0.572549, 1, 0, 1,
-0.6654843, 1.275706, -1.481661, 0.5647059, 1, 0, 1,
-0.6631667, -1.260954, -1.558886, 0.5607843, 1, 0, 1,
-0.6568328, -0.1991655, -1.873766, 0.5529412, 1, 0, 1,
-0.6566557, 2.073588, -0.3860069, 0.5490196, 1, 0, 1,
-0.6564583, 0.02649481, -1.915074, 0.5411765, 1, 0, 1,
-0.6560511, 1.011768, 0.08941874, 0.5372549, 1, 0, 1,
-0.6558782, -0.2359217, -1.985593, 0.5294118, 1, 0, 1,
-0.6532586, -0.1995239, -1.616093, 0.5254902, 1, 0, 1,
-0.650003, -0.9082785, -2.580682, 0.5176471, 1, 0, 1,
-0.6497167, 1.298508, -0.4167236, 0.5137255, 1, 0, 1,
-0.6483283, 1.932887, 0.7763218, 0.5058824, 1, 0, 1,
-0.6438024, 0.3774718, 0.08118891, 0.5019608, 1, 0, 1,
-0.6432619, 0.6070167, -0.449921, 0.4941176, 1, 0, 1,
-0.6432076, 1.697662, -0.8491069, 0.4862745, 1, 0, 1,
-0.641843, -0.7168478, -3.572411, 0.4823529, 1, 0, 1,
-0.6289741, -0.1656201, -0.6744064, 0.4745098, 1, 0, 1,
-0.6250424, -1.325096, -1.736021, 0.4705882, 1, 0, 1,
-0.6151797, -2.64893, -5.259533, 0.4627451, 1, 0, 1,
-0.6134546, 0.4375583, 0.3096239, 0.4588235, 1, 0, 1,
-0.6128656, -1.133758, -1.636663, 0.4509804, 1, 0, 1,
-0.6124893, 2.868299, -1.142289, 0.4470588, 1, 0, 1,
-0.6085896, -0.918305, -3.116182, 0.4392157, 1, 0, 1,
-0.607738, -0.5089121, -2.402942, 0.4352941, 1, 0, 1,
-0.6042987, -0.3197482, -4.199918, 0.427451, 1, 0, 1,
-0.5969872, 1.354867, -0.1318079, 0.4235294, 1, 0, 1,
-0.5940135, -0.3657159, -2.793522, 0.4156863, 1, 0, 1,
-0.586605, -0.7943905, -2.324957, 0.4117647, 1, 0, 1,
-0.5653437, 2.110578, 0.3508331, 0.4039216, 1, 0, 1,
-0.5649149, 1.33565, -1.661217, 0.3960784, 1, 0, 1,
-0.5625987, -1.072994, -2.795606, 0.3921569, 1, 0, 1,
-0.5475929, -0.1909857, -1.164991, 0.3843137, 1, 0, 1,
-0.5470827, -0.5655764, -2.957545, 0.3803922, 1, 0, 1,
-0.5439555, 0.4522494, -0.1079414, 0.372549, 1, 0, 1,
-0.5412058, 0.4428178, -2.369259, 0.3686275, 1, 0, 1,
-0.5322587, -0.3746079, -2.635048, 0.3607843, 1, 0, 1,
-0.5253399, -0.2561069, -0.4479039, 0.3568628, 1, 0, 1,
-0.5226652, 0.1846541, -3.769045, 0.3490196, 1, 0, 1,
-0.5222043, 0.3704457, -1.13482, 0.345098, 1, 0, 1,
-0.5209295, -1.382541, -2.311461, 0.3372549, 1, 0, 1,
-0.5152509, 0.2623443, -2.768114, 0.3333333, 1, 0, 1,
-0.5047886, 0.4566897, -1.393943, 0.3254902, 1, 0, 1,
-0.4979359, 1.102821, -0.5138847, 0.3215686, 1, 0, 1,
-0.4967417, -1.189994, -3.503186, 0.3137255, 1, 0, 1,
-0.4948211, 0.8114957, -0.09620614, 0.3098039, 1, 0, 1,
-0.4942829, -1.752084, -3.166403, 0.3019608, 1, 0, 1,
-0.4937561, 0.6348496, -0.649898, 0.2941177, 1, 0, 1,
-0.4915933, 0.4244223, -2.217735, 0.2901961, 1, 0, 1,
-0.4885018, -1.65988, -3.380575, 0.282353, 1, 0, 1,
-0.4874028, -0.7485463, -1.645064, 0.2784314, 1, 0, 1,
-0.4840284, 1.087319, -2.030149, 0.2705882, 1, 0, 1,
-0.4740194, -0.8076872, -2.857303, 0.2666667, 1, 0, 1,
-0.4639581, 0.6278398, -0.4728829, 0.2588235, 1, 0, 1,
-0.4636746, -1.393967, -2.868453, 0.254902, 1, 0, 1,
-0.4624565, -2.36853, -2.966739, 0.2470588, 1, 0, 1,
-0.4620168, 0.1733021, -0.9021372, 0.2431373, 1, 0, 1,
-0.4609375, 0.9871325, -0.1194807, 0.2352941, 1, 0, 1,
-0.451861, 1.071395, 0.5904602, 0.2313726, 1, 0, 1,
-0.4493372, -0.5458301, -1.307993, 0.2235294, 1, 0, 1,
-0.4423559, -0.6999802, -1.361799, 0.2196078, 1, 0, 1,
-0.4420519, 2.341455, -0.02865271, 0.2117647, 1, 0, 1,
-0.4367017, -0.09709542, -2.005003, 0.2078431, 1, 0, 1,
-0.4332908, -0.04401601, 0.5478429, 0.2, 1, 0, 1,
-0.4314352, -1.489167, -5.395511, 0.1921569, 1, 0, 1,
-0.4300305, -0.03335343, -0.825424, 0.1882353, 1, 0, 1,
-0.4293906, -0.7268017, -2.316504, 0.1803922, 1, 0, 1,
-0.4261566, 0.1792335, -1.55306, 0.1764706, 1, 0, 1,
-0.4253468, -1.54067, -3.655006, 0.1686275, 1, 0, 1,
-0.4243692, 2.252552, -0.03314111, 0.1647059, 1, 0, 1,
-0.4238351, -0.01618252, 0.03163537, 0.1568628, 1, 0, 1,
-0.4234294, -1.190718, -2.981852, 0.1529412, 1, 0, 1,
-0.4212083, 0.9381515, -1.610059, 0.145098, 1, 0, 1,
-0.4189599, -2.845638, -2.117661, 0.1411765, 1, 0, 1,
-0.4186316, -1.449398, -2.73427, 0.1333333, 1, 0, 1,
-0.4178534, -1.223983, -2.603698, 0.1294118, 1, 0, 1,
-0.4142759, -0.1798324, -2.165941, 0.1215686, 1, 0, 1,
-0.4116697, 1.100979, -1.290045, 0.1176471, 1, 0, 1,
-0.4067932, 1.293457, 0.9195294, 0.1098039, 1, 0, 1,
-0.3948379, -1.266501, -2.728106, 0.1058824, 1, 0, 1,
-0.392209, 0.7954084, -0.2664971, 0.09803922, 1, 0, 1,
-0.3913488, 2.416102, 0.2002729, 0.09019608, 1, 0, 1,
-0.3713651, -1.98033, -2.958414, 0.08627451, 1, 0, 1,
-0.3679498, -2.066964, -3.859105, 0.07843138, 1, 0, 1,
-0.3672615, -0.08893885, -1.704453, 0.07450981, 1, 0, 1,
-0.3637117, -0.4804794, -4.110257, 0.06666667, 1, 0, 1,
-0.3636991, -1.548115, -2.879568, 0.0627451, 1, 0, 1,
-0.3626828, 0.6249379, -1.490123, 0.05490196, 1, 0, 1,
-0.3617022, -0.3684869, -1.635749, 0.05098039, 1, 0, 1,
-0.3612201, -0.1281982, -2.335284, 0.04313726, 1, 0, 1,
-0.359636, 1.468273, -1.081395, 0.03921569, 1, 0, 1,
-0.3528872, -0.6713477, -2.455571, 0.03137255, 1, 0, 1,
-0.3498613, -0.3443143, -2.63977, 0.02745098, 1, 0, 1,
-0.3475176, 0.8514113, -0.9353349, 0.01960784, 1, 0, 1,
-0.3474105, -1.124802, -4.029692, 0.01568628, 1, 0, 1,
-0.3455442, 0.9574353, 2.271919, 0.007843138, 1, 0, 1,
-0.3411098, 0.5867646, -2.61292, 0.003921569, 1, 0, 1,
-0.3389547, 0.07598045, -1.117404, 0, 1, 0.003921569, 1,
-0.3332285, 0.1396827, -0.5900287, 0, 1, 0.01176471, 1,
-0.3329899, -0.5403775, -1.863189, 0, 1, 0.01568628, 1,
-0.3266299, 0.3415553, -1.29189, 0, 1, 0.02352941, 1,
-0.3257797, 0.7941564, -2.372119, 0, 1, 0.02745098, 1,
-0.3234601, -2.349223, -1.361828, 0, 1, 0.03529412, 1,
-0.3176978, -0.4991946, -2.40732, 0, 1, 0.03921569, 1,
-0.3143413, -1.054516, -4.224574, 0, 1, 0.04705882, 1,
-0.3139698, 1.71258, -0.2128685, 0, 1, 0.05098039, 1,
-0.3063264, -1.158589, -2.493468, 0, 1, 0.05882353, 1,
-0.3053953, -0.9903829, -3.474124, 0, 1, 0.0627451, 1,
-0.3041323, 1.123954, 0.4382206, 0, 1, 0.07058824, 1,
-0.3022922, -1.281582, -3.02248, 0, 1, 0.07450981, 1,
-0.2984515, -1.12006, -3.995639, 0, 1, 0.08235294, 1,
-0.2976527, -1.477127, -2.672843, 0, 1, 0.08627451, 1,
-0.2975924, 0.4884827, -0.9625052, 0, 1, 0.09411765, 1,
-0.2942625, 0.6373121, -0.4440258, 0, 1, 0.1019608, 1,
-0.293472, 1.191648, -0.2949522, 0, 1, 0.1058824, 1,
-0.293333, 0.1957511, -2.742393, 0, 1, 0.1137255, 1,
-0.2924996, 1.451555, -1.094257, 0, 1, 0.1176471, 1,
-0.2920622, -0.9796979, -3.027594, 0, 1, 0.1254902, 1,
-0.2908649, 1.170864, -0.7883837, 0, 1, 0.1294118, 1,
-0.2892938, -0.09622151, -0.9363638, 0, 1, 0.1372549, 1,
-0.2886656, 1.437513, -1.712653, 0, 1, 0.1411765, 1,
-0.2857264, 1.24525, 1.546342, 0, 1, 0.1490196, 1,
-0.2846046, 0.5923738, -0.6538169, 0, 1, 0.1529412, 1,
-0.2835856, -0.126066, -1.050572, 0, 1, 0.1607843, 1,
-0.2817396, 1.74603, 2.660968, 0, 1, 0.1647059, 1,
-0.2814177, 2.084932, -1.036332, 0, 1, 0.172549, 1,
-0.2805381, 0.8376639, -0.7802455, 0, 1, 0.1764706, 1,
-0.2805034, 0.4046828, -0.7918398, 0, 1, 0.1843137, 1,
-0.2803175, -0.08754583, -2.195743, 0, 1, 0.1882353, 1,
-0.2767057, -0.2594957, -4.759599, 0, 1, 0.1960784, 1,
-0.272269, 1.293231, -1.212343, 0, 1, 0.2039216, 1,
-0.2696271, -0.6249195, -2.18763, 0, 1, 0.2078431, 1,
-0.2694444, -0.06294122, -1.059659, 0, 1, 0.2156863, 1,
-0.2688377, 1.479313, -3.036785, 0, 1, 0.2196078, 1,
-0.2648351, 0.8417168, -0.6366022, 0, 1, 0.227451, 1,
-0.2640727, 1.316811, -0.1723592, 0, 1, 0.2313726, 1,
-0.2626314, -1.266679, -4.131154, 0, 1, 0.2392157, 1,
-0.2611849, 0.2964891, 0.1942081, 0, 1, 0.2431373, 1,
-0.2568325, -0.4186456, -2.731979, 0, 1, 0.2509804, 1,
-0.2557039, 0.1006508, -1.662864, 0, 1, 0.254902, 1,
-0.2550184, -0.3160737, -3.047863, 0, 1, 0.2627451, 1,
-0.2539768, -1.112458, -1.341272, 0, 1, 0.2666667, 1,
-0.252667, 1.825569, -2.260509, 0, 1, 0.2745098, 1,
-0.2488896, -0.2302795, -2.532578, 0, 1, 0.2784314, 1,
-0.248289, -1.677062, -5.837719, 0, 1, 0.2862745, 1,
-0.2476732, 1.401871, 0.7520699, 0, 1, 0.2901961, 1,
-0.2476177, -1.465081, -2.385297, 0, 1, 0.2980392, 1,
-0.2475368, 0.3963295, -0.7650391, 0, 1, 0.3058824, 1,
-0.2473875, -0.04041544, -2.922968, 0, 1, 0.3098039, 1,
-0.2459491, -2.177507, -3.085344, 0, 1, 0.3176471, 1,
-0.2449622, 0.7118019, 0.8309757, 0, 1, 0.3215686, 1,
-0.2427935, 0.630926, -0.3823597, 0, 1, 0.3294118, 1,
-0.2404556, -1.580812, -2.228571, 0, 1, 0.3333333, 1,
-0.2331588, 0.2584699, 0.03749903, 0, 1, 0.3411765, 1,
-0.2317404, 1.99363, -0.2689422, 0, 1, 0.345098, 1,
-0.2297946, -0.4007878, -1.623326, 0, 1, 0.3529412, 1,
-0.2236277, 0.2830645, -0.9939673, 0, 1, 0.3568628, 1,
-0.2234837, -0.9434926, -4.726989, 0, 1, 0.3647059, 1,
-0.2146755, 0.02207619, -2.704718, 0, 1, 0.3686275, 1,
-0.2096298, -1.351746, -4.496704, 0, 1, 0.3764706, 1,
-0.2079101, 0.8682094, 1.605258, 0, 1, 0.3803922, 1,
-0.1986446, -0.2677718, -1.381554, 0, 1, 0.3882353, 1,
-0.1961234, -0.07198774, -0.7167243, 0, 1, 0.3921569, 1,
-0.19602, -0.6663666, -3.558638, 0, 1, 0.4, 1,
-0.1942185, 0.7217352, -0.9042835, 0, 1, 0.4078431, 1,
-0.1929263, 0.343913, -0.5155272, 0, 1, 0.4117647, 1,
-0.1859445, 0.2462837, -0.3748079, 0, 1, 0.4196078, 1,
-0.1851958, -0.6404676, -2.315727, 0, 1, 0.4235294, 1,
-0.1791096, 0.03484768, -0.8317922, 0, 1, 0.4313726, 1,
-0.1782418, 1.723315, 0.4637547, 0, 1, 0.4352941, 1,
-0.168674, 0.2824654, 0.3879943, 0, 1, 0.4431373, 1,
-0.1677616, 0.03334276, -2.086613, 0, 1, 0.4470588, 1,
-0.1667769, 1.47007, -0.4943517, 0, 1, 0.454902, 1,
-0.165736, 0.1684631, -1.247463, 0, 1, 0.4588235, 1,
-0.1629135, -0.0799951, -1.115165, 0, 1, 0.4666667, 1,
-0.1594266, 0.2220899, -2.068216, 0, 1, 0.4705882, 1,
-0.1570545, 0.8886979, -0.3663069, 0, 1, 0.4784314, 1,
-0.1517479, 1.621241, -1.137592, 0, 1, 0.4823529, 1,
-0.1498619, 0.06102277, -0.6541305, 0, 1, 0.4901961, 1,
-0.1497563, 0.7290156, 1.222267, 0, 1, 0.4941176, 1,
-0.143702, -0.4428595, -2.641406, 0, 1, 0.5019608, 1,
-0.1425669, 0.09678596, -1.015381, 0, 1, 0.509804, 1,
-0.1414739, 1.116189, 0.09364805, 0, 1, 0.5137255, 1,
-0.1401726, -0.6621601, -1.931446, 0, 1, 0.5215687, 1,
-0.1380561, -0.7308164, -2.221096, 0, 1, 0.5254902, 1,
-0.1331756, -1.297587, -4.326906, 0, 1, 0.5333334, 1,
-0.1308796, 0.6268359, 1.797436, 0, 1, 0.5372549, 1,
-0.1289887, -1.046999, -3.522892, 0, 1, 0.5450981, 1,
-0.1283805, 0.5857872, -0.6999928, 0, 1, 0.5490196, 1,
-0.1268617, 0.4475159, 0.4267682, 0, 1, 0.5568628, 1,
-0.1230788, -1.537841, -4.739642, 0, 1, 0.5607843, 1,
-0.1224983, 1.133965, 0.6543168, 0, 1, 0.5686275, 1,
-0.1222131, -1.063513, -4.093739, 0, 1, 0.572549, 1,
-0.1190474, -1.79533, -2.357418, 0, 1, 0.5803922, 1,
-0.1187538, 0.7961262, 0.3980104, 0, 1, 0.5843138, 1,
-0.116362, 0.2608089, 0.9490623, 0, 1, 0.5921569, 1,
-0.1154844, 0.8768806, -1.793882, 0, 1, 0.5960785, 1,
-0.1074277, 0.3232267, 0.1945425, 0, 1, 0.6039216, 1,
-0.1065188, 0.8847176, -0.1127999, 0, 1, 0.6117647, 1,
-0.1059476, 2.168474, 0.6552351, 0, 1, 0.6156863, 1,
-0.1051753, -1.211252, -3.404541, 0, 1, 0.6235294, 1,
-0.1003685, -1.543892, -2.340906, 0, 1, 0.627451, 1,
-0.09784384, -0.6712855, -2.363754, 0, 1, 0.6352941, 1,
-0.09379061, 0.183788, -0.3889655, 0, 1, 0.6392157, 1,
-0.09342276, -1.700606, -3.354726, 0, 1, 0.6470588, 1,
-0.09136757, 0.2425281, 0.01366948, 0, 1, 0.6509804, 1,
-0.08808874, -0.6941558, -2.713384, 0, 1, 0.6588235, 1,
-0.08673752, 0.05149986, -2.256104, 0, 1, 0.6627451, 1,
-0.08663083, -1.313919, -3.10453, 0, 1, 0.6705883, 1,
-0.08625192, 0.9166065, 1.622813, 0, 1, 0.6745098, 1,
-0.08421417, 0.2568735, -1.126318, 0, 1, 0.682353, 1,
-0.0832179, 1.103887, 0.03047825, 0, 1, 0.6862745, 1,
-0.08173654, 1.018015, -1.350057, 0, 1, 0.6941177, 1,
-0.08102425, -0.2313317, -2.892878, 0, 1, 0.7019608, 1,
-0.08095822, -0.01741401, -0.9686857, 0, 1, 0.7058824, 1,
-0.07742234, -0.2712409, -3.377336, 0, 1, 0.7137255, 1,
-0.07540491, 0.3541307, 0.1326339, 0, 1, 0.7176471, 1,
-0.06636255, 0.7051115, 1.625225, 0, 1, 0.7254902, 1,
-0.06583251, 0.04831003, -0.0337369, 0, 1, 0.7294118, 1,
-0.05785454, 0.5013251, 1.04357, 0, 1, 0.7372549, 1,
-0.05075382, 0.9687951, -0.1605145, 0, 1, 0.7411765, 1,
-0.04856131, 1.208844, -0.9184701, 0, 1, 0.7490196, 1,
-0.04852176, -0.7130726, -3.023428, 0, 1, 0.7529412, 1,
-0.04651299, -0.6863015, -1.935605, 0, 1, 0.7607843, 1,
-0.04473135, 1.10034, 1.436595, 0, 1, 0.7647059, 1,
-0.04457156, -1.079216, -3.085701, 0, 1, 0.772549, 1,
-0.04113853, 0.1285528, -1.134486, 0, 1, 0.7764706, 1,
-0.04079466, 1.454903, 1.182034, 0, 1, 0.7843137, 1,
-0.03232557, 0.03075865, -0.3424093, 0, 1, 0.7882353, 1,
-0.02678476, 0.6965523, 0.6177118, 0, 1, 0.7960784, 1,
-0.02378439, 0.5727537, 0.4719166, 0, 1, 0.8039216, 1,
-0.01870701, 0.2025409, 0.3315539, 0, 1, 0.8078431, 1,
-0.01551455, 0.6819473, 0.08770191, 0, 1, 0.8156863, 1,
-0.01180953, -0.05683235, -2.666434, 0, 1, 0.8196079, 1,
-0.01090148, 1.029424, 0.6022917, 0, 1, 0.827451, 1,
-0.007348613, -0.5563709, -3.464682, 0, 1, 0.8313726, 1,
-0.004426546, -0.1465823, -1.376335, 0, 1, 0.8392157, 1,
-0.0006923747, 0.6811043, -0.7802766, 0, 1, 0.8431373, 1,
-0.000241388, -0.3720973, -2.851357, 0, 1, 0.8509804, 1,
0.000145205, -0.05767614, 2.650935, 0, 1, 0.854902, 1,
0.0005968543, -0.1049124, 1.904204, 0, 1, 0.8627451, 1,
0.002678911, -0.4264044, 3.071918, 0, 1, 0.8666667, 1,
0.007903506, 0.1175267, -0.1522888, 0, 1, 0.8745098, 1,
0.009743553, 1.059622, -0.489171, 0, 1, 0.8784314, 1,
0.01131388, -0.2941786, 5.519167, 0, 1, 0.8862745, 1,
0.01288271, -0.7259663, 1.363056, 0, 1, 0.8901961, 1,
0.01591692, 1.524085, 0.9964592, 0, 1, 0.8980392, 1,
0.01899223, 0.3062952, -0.4017063, 0, 1, 0.9058824, 1,
0.01933937, 0.1708026, 0.5768972, 0, 1, 0.9098039, 1,
0.02095552, -0.3686726, 3.385447, 0, 1, 0.9176471, 1,
0.02670798, -0.117079, 1.785312, 0, 1, 0.9215686, 1,
0.02901983, 0.143424, -1.435052, 0, 1, 0.9294118, 1,
0.0319434, 2.732758, 0.8014849, 0, 1, 0.9333333, 1,
0.03791567, -0.3033384, 3.882689, 0, 1, 0.9411765, 1,
0.03969518, -1.139715, 5.72008, 0, 1, 0.945098, 1,
0.04118384, 0.4039878, 0.9115419, 0, 1, 0.9529412, 1,
0.04172205, -0.1188221, 4.68062, 0, 1, 0.9568627, 1,
0.04292707, 0.1990432, 0.3245031, 0, 1, 0.9647059, 1,
0.04853539, 0.7497234, 0.1774085, 0, 1, 0.9686275, 1,
0.04899485, -0.7505602, 3.50737, 0, 1, 0.9764706, 1,
0.05812459, 0.8470218, -0.9755251, 0, 1, 0.9803922, 1,
0.05863858, 0.5319691, 0.277532, 0, 1, 0.9882353, 1,
0.06013218, 0.8740986, 1.460777, 0, 1, 0.9921569, 1,
0.06193285, 1.070304, -1.714723, 0, 1, 1, 1,
0.06250952, 2.172887, 0.08935808, 0, 0.9921569, 1, 1,
0.06660646, 0.3344246, -0.5333019, 0, 0.9882353, 1, 1,
0.06858398, -0.2951164, 4.010415, 0, 0.9803922, 1, 1,
0.07613619, -1.081538, 1.735141, 0, 0.9764706, 1, 1,
0.0769157, 0.2185106, 0.753978, 0, 0.9686275, 1, 1,
0.07768334, -1.195835, 3.856148, 0, 0.9647059, 1, 1,
0.0786081, -0.3295819, 1.601441, 0, 0.9568627, 1, 1,
0.0787609, 0.7584777, -0.5471722, 0, 0.9529412, 1, 1,
0.08104719, 0.8000208, -0.918363, 0, 0.945098, 1, 1,
0.08308126, -1.160431, 3.008706, 0, 0.9411765, 1, 1,
0.0838437, -0.08424734, 4.273232, 0, 0.9333333, 1, 1,
0.08435787, -0.6517915, 4.567842, 0, 0.9294118, 1, 1,
0.08648574, 0.7078236, 0.5759276, 0, 0.9215686, 1, 1,
0.08784999, 0.2427983, 0.9567509, 0, 0.9176471, 1, 1,
0.08858957, 0.2166119, 1.377954, 0, 0.9098039, 1, 1,
0.09142939, -0.9000015, 3.182946, 0, 0.9058824, 1, 1,
0.09252041, -0.1752816, 1.141171, 0, 0.8980392, 1, 1,
0.09524474, -1.040781, 3.710047, 0, 0.8901961, 1, 1,
0.0961736, 0.2529023, -0.05384052, 0, 0.8862745, 1, 1,
0.0982835, 0.09015372, 0.9251498, 0, 0.8784314, 1, 1,
0.09838536, 1.340221, -0.7402513, 0, 0.8745098, 1, 1,
0.1009049, -0.5025122, 3.129098, 0, 0.8666667, 1, 1,
0.1018153, -2.055357, 2.385402, 0, 0.8627451, 1, 1,
0.1054495, 2.417557, -0.2937728, 0, 0.854902, 1, 1,
0.1058232, -1.042431, 3.266003, 0, 0.8509804, 1, 1,
0.107269, -2.315673, 3.378042, 0, 0.8431373, 1, 1,
0.1176366, 0.5672853, -1.857921, 0, 0.8392157, 1, 1,
0.1195149, -0.4735164, 2.287131, 0, 0.8313726, 1, 1,
0.1218616, 0.03729817, -0.1474291, 0, 0.827451, 1, 1,
0.1265329, -0.3661084, 2.240334, 0, 0.8196079, 1, 1,
0.1281904, -0.01345633, 2.170965, 0, 0.8156863, 1, 1,
0.1283824, -1.204806, 1.807032, 0, 0.8078431, 1, 1,
0.1303028, 0.9905409, -0.1388128, 0, 0.8039216, 1, 1,
0.136707, -0.5889758, 3.082587, 0, 0.7960784, 1, 1,
0.1368947, 0.2973857, 0.03114671, 0, 0.7882353, 1, 1,
0.1380116, 0.8472922, -0.312233, 0, 0.7843137, 1, 1,
0.1440703, 0.7453619, -1.84073, 0, 0.7764706, 1, 1,
0.1455598, -0.2863538, 1.8403, 0, 0.772549, 1, 1,
0.1461994, -0.2334611, 1.966486, 0, 0.7647059, 1, 1,
0.1475486, -1.120258, 1.857143, 0, 0.7607843, 1, 1,
0.1506577, 0.5240529, 1.516398, 0, 0.7529412, 1, 1,
0.15111, -0.02955205, 2.089371, 0, 0.7490196, 1, 1,
0.1574203, -0.6005836, 1.296458, 0, 0.7411765, 1, 1,
0.165149, 0.4337102, 0.5330062, 0, 0.7372549, 1, 1,
0.1675777, -0.23437, 2.093762, 0, 0.7294118, 1, 1,
0.1686604, -2.285794, 3.82292, 0, 0.7254902, 1, 1,
0.1697092, 1.235979, -1.642226, 0, 0.7176471, 1, 1,
0.1700405, -0.0004034207, 1.083186, 0, 0.7137255, 1, 1,
0.177045, 1.67399, 0.3009175, 0, 0.7058824, 1, 1,
0.1781, 0.1499254, 0.8442327, 0, 0.6980392, 1, 1,
0.1825514, -1.433683, 2.636981, 0, 0.6941177, 1, 1,
0.1826447, -1.400485, 2.639455, 0, 0.6862745, 1, 1,
0.1867083, 0.7364734, -0.3282152, 0, 0.682353, 1, 1,
0.1890132, -1.343634, 3.806751, 0, 0.6745098, 1, 1,
0.1918389, -0.9225481, 3.883124, 0, 0.6705883, 1, 1,
0.1949774, -0.3458016, 3.455277, 0, 0.6627451, 1, 1,
0.2013995, -0.1172978, 1.199521, 0, 0.6588235, 1, 1,
0.2034741, -1.14237, 3.638059, 0, 0.6509804, 1, 1,
0.2048642, 0.2840797, 0.02756864, 0, 0.6470588, 1, 1,
0.2054935, 1.022927, 0.2842863, 0, 0.6392157, 1, 1,
0.2064977, -0.5845933, 2.587791, 0, 0.6352941, 1, 1,
0.2065958, 0.5395293, 0.06127575, 0, 0.627451, 1, 1,
0.2087688, 1.154105, 1.032422, 0, 0.6235294, 1, 1,
0.2089216, 0.3929281, 0.4376724, 0, 0.6156863, 1, 1,
0.2098182, 0.9379856, -2.546407, 0, 0.6117647, 1, 1,
0.2118051, 0.0784763, 1.099578, 0, 0.6039216, 1, 1,
0.2164426, -0.9036737, 3.367135, 0, 0.5960785, 1, 1,
0.2235523, -0.1122628, 0.3631114, 0, 0.5921569, 1, 1,
0.2256552, 1.410304, -0.674074, 0, 0.5843138, 1, 1,
0.2262741, -0.03920137, 0.5453774, 0, 0.5803922, 1, 1,
0.2310075, 0.4089764, 0.949643, 0, 0.572549, 1, 1,
0.2319082, -0.04719586, 1.561255, 0, 0.5686275, 1, 1,
0.2330053, 0.2529776, -0.9763671, 0, 0.5607843, 1, 1,
0.2348932, 0.3692154, 0.2510294, 0, 0.5568628, 1, 1,
0.2401647, -0.9925988, 3.222021, 0, 0.5490196, 1, 1,
0.2448748, -1.489905, 3.389541, 0, 0.5450981, 1, 1,
0.2464044, 0.4261375, 1.589418, 0, 0.5372549, 1, 1,
0.248177, -1.788518, 1.543497, 0, 0.5333334, 1, 1,
0.2532025, 1.911739, 0.8071075, 0, 0.5254902, 1, 1,
0.2556736, -2.661947, 2.380353, 0, 0.5215687, 1, 1,
0.2570701, -0.2490662, 1.255097, 0, 0.5137255, 1, 1,
0.2583714, -1.189745, 4.07521, 0, 0.509804, 1, 1,
0.2596037, 0.3349157, 0.5357972, 0, 0.5019608, 1, 1,
0.2632794, 0.8949109, 1.594347, 0, 0.4941176, 1, 1,
0.2656372, 0.8350538, -0.8586649, 0, 0.4901961, 1, 1,
0.2729445, -1.324275, 2.614561, 0, 0.4823529, 1, 1,
0.275533, 1.376566, 0.7677345, 0, 0.4784314, 1, 1,
0.2761494, 0.2130769, -0.3909614, 0, 0.4705882, 1, 1,
0.2776429, -0.3477507, 1.665519, 0, 0.4666667, 1, 1,
0.2777973, 0.05505768, 1.956444, 0, 0.4588235, 1, 1,
0.2792678, -0.6407954, 1.858825, 0, 0.454902, 1, 1,
0.2798911, 1.782251, 3.123148, 0, 0.4470588, 1, 1,
0.2807776, 0.9681659, 0.1363774, 0, 0.4431373, 1, 1,
0.2813113, 1.073087, 0.0885444, 0, 0.4352941, 1, 1,
0.2833208, -0.327419, 1.481866, 0, 0.4313726, 1, 1,
0.2835101, 0.6663313, -1.659347, 0, 0.4235294, 1, 1,
0.2840526, 0.4071755, 0.409169, 0, 0.4196078, 1, 1,
0.2898937, -0.7082349, 2.696216, 0, 0.4117647, 1, 1,
0.2919593, 0.4352717, 0.9424334, 0, 0.4078431, 1, 1,
0.2944148, 1.944708, 0.29176, 0, 0.4, 1, 1,
0.298114, 0.917673, -0.06006664, 0, 0.3921569, 1, 1,
0.3009758, -0.7949712, 1.484099, 0, 0.3882353, 1, 1,
0.3028511, -1.787988, 2.817394, 0, 0.3803922, 1, 1,
0.3075238, 0.09560791, 1.237047, 0, 0.3764706, 1, 1,
0.3116898, -0.804433, 4.148087, 0, 0.3686275, 1, 1,
0.3122043, -0.02115152, 0.5189397, 0, 0.3647059, 1, 1,
0.3123005, 1.297089, 0.4179439, 0, 0.3568628, 1, 1,
0.3175048, 1.918841, -0.1206584, 0, 0.3529412, 1, 1,
0.3184722, -1.508342, 2.917802, 0, 0.345098, 1, 1,
0.3190593, 0.5105305, 0.9351814, 0, 0.3411765, 1, 1,
0.3192211, 0.875261, -0.6397813, 0, 0.3333333, 1, 1,
0.3209726, 1.930103, -1.083314, 0, 0.3294118, 1, 1,
0.325579, 0.3015147, 0.1589054, 0, 0.3215686, 1, 1,
0.3311645, 1.768252, 2.31289, 0, 0.3176471, 1, 1,
0.3335459, 0.7853904, 1.814317, 0, 0.3098039, 1, 1,
0.33586, 0.1598533, 2.125331, 0, 0.3058824, 1, 1,
0.3384012, -0.9593597, 2.682154, 0, 0.2980392, 1, 1,
0.341841, 0.8716155, -1.125008, 0, 0.2901961, 1, 1,
0.3469123, 0.4983178, 0.5326095, 0, 0.2862745, 1, 1,
0.3498835, 2.229669, 2.320597, 0, 0.2784314, 1, 1,
0.3501018, -3.070325, 3.588826, 0, 0.2745098, 1, 1,
0.3602535, -0.07438722, 3.341163, 0, 0.2666667, 1, 1,
0.3616666, 0.4175913, 1.375152, 0, 0.2627451, 1, 1,
0.3620753, 1.12733, -0.02831709, 0, 0.254902, 1, 1,
0.3641717, -0.2095792, 3.428174, 0, 0.2509804, 1, 1,
0.3665869, -0.7460509, 3.177596, 0, 0.2431373, 1, 1,
0.373704, 0.2921562, -0.24423, 0, 0.2392157, 1, 1,
0.3752133, -0.7343243, 3.097195, 0, 0.2313726, 1, 1,
0.3754726, 0.5713215, -0.7238896, 0, 0.227451, 1, 1,
0.3791967, 1.254814, 1.257033, 0, 0.2196078, 1, 1,
0.3829626, -0.4663986, 4.269074, 0, 0.2156863, 1, 1,
0.3844875, -0.51026, 1.950753, 0, 0.2078431, 1, 1,
0.3880966, 0.7520239, 0.9763613, 0, 0.2039216, 1, 1,
0.3928143, -1.958843, 1.73312, 0, 0.1960784, 1, 1,
0.3957617, 0.513102, 2.784699, 0, 0.1882353, 1, 1,
0.3973581, -1.510882, 5.004706, 0, 0.1843137, 1, 1,
0.3995469, 0.8426607, -0.00489962, 0, 0.1764706, 1, 1,
0.4033532, 1.512093, -0.4973167, 0, 0.172549, 1, 1,
0.4047089, 0.08204357, 0.5877907, 0, 0.1647059, 1, 1,
0.4110589, -1.75344, 2.558865, 0, 0.1607843, 1, 1,
0.4155665, 0.523112, -0.6126909, 0, 0.1529412, 1, 1,
0.4161782, -1.984874, 2.023531, 0, 0.1490196, 1, 1,
0.4185511, -0.1077162, 1.59798, 0, 0.1411765, 1, 1,
0.4185814, -1.385449, 3.452547, 0, 0.1372549, 1, 1,
0.4207312, 0.4967766, 0.6868958, 0, 0.1294118, 1, 1,
0.4257439, -0.853466, 3.362941, 0, 0.1254902, 1, 1,
0.4276913, 0.4410322, 1.371174, 0, 0.1176471, 1, 1,
0.4318807, -0.0951319, 2.682803, 0, 0.1137255, 1, 1,
0.4338568, -0.07008877, 2.603861, 0, 0.1058824, 1, 1,
0.4340564, 0.2409734, 0.958901, 0, 0.09803922, 1, 1,
0.4377052, 0.8331351, -0.5818219, 0, 0.09411765, 1, 1,
0.4427844, 0.7703736, 1.552826, 0, 0.08627451, 1, 1,
0.4429053, 1.808715, 0.3753775, 0, 0.08235294, 1, 1,
0.4449288, 0.456868, 2.945759, 0, 0.07450981, 1, 1,
0.4466875, 0.9682387, 0.5152416, 0, 0.07058824, 1, 1,
0.4479284, 1.788286, 2.167336, 0, 0.0627451, 1, 1,
0.4520926, 0.05897547, 1.874153, 0, 0.05882353, 1, 1,
0.4547288, 1.776173, -1.244117, 0, 0.05098039, 1, 1,
0.4558422, -0.6491238, 3.468443, 0, 0.04705882, 1, 1,
0.4576887, 0.1564562, 2.737931, 0, 0.03921569, 1, 1,
0.4606737, 0.414316, -0.07772441, 0, 0.03529412, 1, 1,
0.4610879, -0.4499597, 3.172079, 0, 0.02745098, 1, 1,
0.4619664, 0.2204527, 1.325362, 0, 0.02352941, 1, 1,
0.4630922, -0.06820159, 2.182835, 0, 0.01568628, 1, 1,
0.466563, -0.08693183, 1.02219, 0, 0.01176471, 1, 1,
0.4686248, 0.4858674, 0.8020681, 0, 0.003921569, 1, 1,
0.469191, 0.2435215, 1.389402, 0.003921569, 0, 1, 1,
0.4696937, 1.343605, -0.9290153, 0.007843138, 0, 1, 1,
0.471231, -0.05977336, 0.4283708, 0.01568628, 0, 1, 1,
0.4742967, -0.1372987, 2.052398, 0.01960784, 0, 1, 1,
0.4745497, -1.249396, 2.691653, 0.02745098, 0, 1, 1,
0.4760503, -0.02176271, 0.5174116, 0.03137255, 0, 1, 1,
0.477747, 1.021006, -2.529315, 0.03921569, 0, 1, 1,
0.4788173, 1.693865, 0.1089227, 0.04313726, 0, 1, 1,
0.4809534, 0.4523954, 0.4842432, 0.05098039, 0, 1, 1,
0.4824144, 2.10927, -0.03441581, 0.05490196, 0, 1, 1,
0.4854633, 0.1334533, 0.5810956, 0.0627451, 0, 1, 1,
0.4874672, 0.5111269, 0.2701532, 0.06666667, 0, 1, 1,
0.4899269, -2.437557, 1.435573, 0.07450981, 0, 1, 1,
0.4915948, 0.4668534, 0.1076522, 0.07843138, 0, 1, 1,
0.4923553, -2.129721, 2.73279, 0.08627451, 0, 1, 1,
0.4960616, 1.168517, 1.092262, 0.09019608, 0, 1, 1,
0.4969393, 1.033681, 2.34779, 0.09803922, 0, 1, 1,
0.4990763, 1.35675, 0.4937522, 0.1058824, 0, 1, 1,
0.5022973, -0.7688736, 1.006359, 0.1098039, 0, 1, 1,
0.5072927, 0.1626945, 3.162395, 0.1176471, 0, 1, 1,
0.5156538, 2.831434, -0.6115538, 0.1215686, 0, 1, 1,
0.5159304, 0.2799067, 0.9674416, 0.1294118, 0, 1, 1,
0.5185409, 0.634923, 2.04458, 0.1333333, 0, 1, 1,
0.5188599, 1.055242, 1.07117, 0.1411765, 0, 1, 1,
0.5191732, -1.244888, 1.639008, 0.145098, 0, 1, 1,
0.5271246, 2.126521, 2.318438, 0.1529412, 0, 1, 1,
0.5299129, 0.09398533, 2.74477, 0.1568628, 0, 1, 1,
0.5326267, -0.8212686, 2.92538, 0.1647059, 0, 1, 1,
0.5358851, -0.3459795, 1.377413, 0.1686275, 0, 1, 1,
0.5435443, 0.6425224, -2.091383, 0.1764706, 0, 1, 1,
0.5440688, 0.09231351, 0.7409892, 0.1803922, 0, 1, 1,
0.544327, 0.4288116, 1.258088, 0.1882353, 0, 1, 1,
0.5445991, 0.1539861, 0.478197, 0.1921569, 0, 1, 1,
0.549518, -0.2973091, 1.616503, 0.2, 0, 1, 1,
0.5503181, 1.362107, 0.1810212, 0.2078431, 0, 1, 1,
0.5530951, -0.5216967, 1.814836, 0.2117647, 0, 1, 1,
0.5560439, -0.04606874, 1.598459, 0.2196078, 0, 1, 1,
0.5583185, 1.007755, -1.276102, 0.2235294, 0, 1, 1,
0.5595677, -0.3218878, 2.931127, 0.2313726, 0, 1, 1,
0.5623854, -0.09034497, 0.00321026, 0.2352941, 0, 1, 1,
0.5660812, 2.688474, 0.8427209, 0.2431373, 0, 1, 1,
0.5662772, -0.4100864, 2.471525, 0.2470588, 0, 1, 1,
0.5667399, 1.497093, -0.2811836, 0.254902, 0, 1, 1,
0.5683025, 0.7195216, 0.8672304, 0.2588235, 0, 1, 1,
0.5693348, -0.01101036, 2.745353, 0.2666667, 0, 1, 1,
0.5713806, -0.5164552, 1.53116, 0.2705882, 0, 1, 1,
0.5731389, -0.2696738, 3.349336, 0.2784314, 0, 1, 1,
0.5793551, -1.591588, 2.482409, 0.282353, 0, 1, 1,
0.5803665, 0.5061879, 1.120508, 0.2901961, 0, 1, 1,
0.5809373, -0.8882375, 3.179015, 0.2941177, 0, 1, 1,
0.5876335, -0.1919951, 3.189286, 0.3019608, 0, 1, 1,
0.5885383, -0.183327, 1.897436, 0.3098039, 0, 1, 1,
0.5896589, 1.037364, 0.3194377, 0.3137255, 0, 1, 1,
0.5929538, 0.04115645, -0.7992709, 0.3215686, 0, 1, 1,
0.5937933, -0.4968188, 1.456268, 0.3254902, 0, 1, 1,
0.6014847, -1.197985, 3.420605, 0.3333333, 0, 1, 1,
0.6018472, -2.251936, 1.080675, 0.3372549, 0, 1, 1,
0.608835, 0.2580697, 0.6077321, 0.345098, 0, 1, 1,
0.6093321, 1.880493, 0.8973311, 0.3490196, 0, 1, 1,
0.6096523, 1.906857, 1.252552, 0.3568628, 0, 1, 1,
0.6157919, 0.4641719, 0.5653367, 0.3607843, 0, 1, 1,
0.6201408, -0.2086, 1.303026, 0.3686275, 0, 1, 1,
0.6335018, 1.141176, -1.110181, 0.372549, 0, 1, 1,
0.6390808, 0.1252594, 2.312323, 0.3803922, 0, 1, 1,
0.6464686, 1.506035, -1.546747, 0.3843137, 0, 1, 1,
0.6464928, 0.3537821, 1.017172, 0.3921569, 0, 1, 1,
0.6470246, -0.6840916, 3.739992, 0.3960784, 0, 1, 1,
0.6489031, -0.2960121, 1.194821, 0.4039216, 0, 1, 1,
0.6524614, 0.4095582, 0.8558817, 0.4117647, 0, 1, 1,
0.6539278, -0.3862127, 1.343615, 0.4156863, 0, 1, 1,
0.6545233, 0.3519883, -0.07213247, 0.4235294, 0, 1, 1,
0.656793, 0.9666395, 1.260575, 0.427451, 0, 1, 1,
0.6594826, -0.6310404, 3.761067, 0.4352941, 0, 1, 1,
0.6608175, -0.8151463, 1.177802, 0.4392157, 0, 1, 1,
0.6695702, -0.2506425, 3.550503, 0.4470588, 0, 1, 1,
0.6758403, -0.8878812, 1.970821, 0.4509804, 0, 1, 1,
0.6796222, -0.4948404, 3.230879, 0.4588235, 0, 1, 1,
0.6822908, -0.5606413, 2.362031, 0.4627451, 0, 1, 1,
0.6825348, -1.255988, 4.255562, 0.4705882, 0, 1, 1,
0.683104, 0.8718001, 0.5120389, 0.4745098, 0, 1, 1,
0.6846738, 1.079952, 0.3984095, 0.4823529, 0, 1, 1,
0.6857237, -0.8465794, 5.59907, 0.4862745, 0, 1, 1,
0.6866721, -0.3785697, 2.306584, 0.4941176, 0, 1, 1,
0.6868944, 0.431932, -0.2091208, 0.5019608, 0, 1, 1,
0.6927498, -0.2296979, 2.762042, 0.5058824, 0, 1, 1,
0.6935673, 0.04232636, 1.850027, 0.5137255, 0, 1, 1,
0.7035563, -0.3675841, 1.890482, 0.5176471, 0, 1, 1,
0.7072216, 0.4393184, 1.893353, 0.5254902, 0, 1, 1,
0.7137396, 2.576107, -0.9906945, 0.5294118, 0, 1, 1,
0.721711, -1.46271, 1.37139, 0.5372549, 0, 1, 1,
0.7247168, 0.1038627, 2.035446, 0.5411765, 0, 1, 1,
0.7286933, -0.9644783, 2.775336, 0.5490196, 0, 1, 1,
0.7309326, -0.9961665, 3.168204, 0.5529412, 0, 1, 1,
0.7372538, 0.1806534, 1.3853, 0.5607843, 0, 1, 1,
0.7382717, -0.9789759, 2.133206, 0.5647059, 0, 1, 1,
0.7582593, 1.56369, 1.665133, 0.572549, 0, 1, 1,
0.7597535, 0.1280935, 0.07168888, 0.5764706, 0, 1, 1,
0.7640581, -0.4761259, 1.830409, 0.5843138, 0, 1, 1,
0.7727801, 1.457847, 0.2034841, 0.5882353, 0, 1, 1,
0.7742708, 0.6386846, -0.3176339, 0.5960785, 0, 1, 1,
0.7851767, 0.7890984, -1.08768, 0.6039216, 0, 1, 1,
0.7863708, 0.913432, 1.153851, 0.6078432, 0, 1, 1,
0.7880545, -1.160936, 3.193488, 0.6156863, 0, 1, 1,
0.7931509, -0.8888182, 1.599469, 0.6196079, 0, 1, 1,
0.7934173, -0.2104889, 0.4612793, 0.627451, 0, 1, 1,
0.8036152, -0.164425, 0.09677699, 0.6313726, 0, 1, 1,
0.8114014, -0.7491556, 3.880812, 0.6392157, 0, 1, 1,
0.8135406, -0.2261521, 2.397314, 0.6431373, 0, 1, 1,
0.8259825, -0.1794837, 0.7993953, 0.6509804, 0, 1, 1,
0.8274617, -0.9504786, 2.64926, 0.654902, 0, 1, 1,
0.8279401, 0.5747671, 1.351366, 0.6627451, 0, 1, 1,
0.829536, -0.7173365, 3.283485, 0.6666667, 0, 1, 1,
0.8373299, 0.1836868, 3.604397, 0.6745098, 0, 1, 1,
0.8383991, 0.4752111, 1.048234, 0.6784314, 0, 1, 1,
0.8384752, -0.2607039, 0.3802398, 0.6862745, 0, 1, 1,
0.8408098, 1.779013, 0.1642194, 0.6901961, 0, 1, 1,
0.8421649, 0.02498433, -0.02874043, 0.6980392, 0, 1, 1,
0.8541434, 0.02487596, 2.781249, 0.7058824, 0, 1, 1,
0.8548645, 1.230946, 0.7727173, 0.7098039, 0, 1, 1,
0.8553375, -0.4659835, 2.83398, 0.7176471, 0, 1, 1,
0.8641033, -0.2952055, 1.072192, 0.7215686, 0, 1, 1,
0.8646284, -1.250931, 3.001824, 0.7294118, 0, 1, 1,
0.8667148, -0.350155, 1.747888, 0.7333333, 0, 1, 1,
0.8715185, -0.6864373, 2.28592, 0.7411765, 0, 1, 1,
0.8727721, 1.024354, 0.6440815, 0.7450981, 0, 1, 1,
0.8741381, 0.7539941, 0.7566377, 0.7529412, 0, 1, 1,
0.8748397, 0.1925147, 1.80468, 0.7568628, 0, 1, 1,
0.8803701, -0.4767298, 2.161155, 0.7647059, 0, 1, 1,
0.883818, -1.139639, 2.539263, 0.7686275, 0, 1, 1,
0.8898989, 1.087446, 1.36814, 0.7764706, 0, 1, 1,
0.8913104, 1.191256, 1.53826, 0.7803922, 0, 1, 1,
0.8946739, 0.7977642, -0.9542339, 0.7882353, 0, 1, 1,
0.9110842, -0.9423152, 2.070771, 0.7921569, 0, 1, 1,
0.9194645, 0.7521787, -0.242802, 0.8, 0, 1, 1,
0.9202934, -1.149739, 2.614616, 0.8078431, 0, 1, 1,
0.9214227, -0.3111979, 0.9054685, 0.8117647, 0, 1, 1,
0.922245, 0.1449552, 1.89727, 0.8196079, 0, 1, 1,
0.9228099, -0.6947944, 2.84313, 0.8235294, 0, 1, 1,
0.9284132, 1.146094, 1.645251, 0.8313726, 0, 1, 1,
0.9289824, 0.9734861, 1.865791, 0.8352941, 0, 1, 1,
0.9364046, -1.714493, 3.506622, 0.8431373, 0, 1, 1,
0.9394812, 0.2574683, 2.088331, 0.8470588, 0, 1, 1,
0.9400479, 2.099622, 0.4226439, 0.854902, 0, 1, 1,
0.9402463, -0.002976692, -0.203592, 0.8588235, 0, 1, 1,
0.9413444, -1.178258, 2.488638, 0.8666667, 0, 1, 1,
0.9415767, 0.8765159, 1.053176, 0.8705882, 0, 1, 1,
0.9430616, -0.2357763, 2.395156, 0.8784314, 0, 1, 1,
0.9437365, 0.7302104, 0.01760731, 0.8823529, 0, 1, 1,
0.9480882, 2.205814, 0.0313582, 0.8901961, 0, 1, 1,
0.9503874, -0.7771978, 1.918566, 0.8941177, 0, 1, 1,
0.9523719, -1.609423, 1.69666, 0.9019608, 0, 1, 1,
0.9539933, -0.7972472, 3.10676, 0.9098039, 0, 1, 1,
0.9557383, -0.3986079, 0.5207382, 0.9137255, 0, 1, 1,
0.9578109, 1.116137, 2.166513, 0.9215686, 0, 1, 1,
0.9596271, 1.252446, 0.7664524, 0.9254902, 0, 1, 1,
0.9630956, -0.7638765, 1.550625, 0.9333333, 0, 1, 1,
0.9650547, -0.7377636, 3.035445, 0.9372549, 0, 1, 1,
0.9650618, -0.2902622, 1.261689, 0.945098, 0, 1, 1,
0.979165, -1.196109, 3.190069, 0.9490196, 0, 1, 1,
0.9802914, 1.19836, -0.4678785, 0.9568627, 0, 1, 1,
0.9809018, 2.057385, 1.837247, 0.9607843, 0, 1, 1,
0.9831429, 0.05886083, 1.234161, 0.9686275, 0, 1, 1,
0.9835284, -0.5484924, 1.513869, 0.972549, 0, 1, 1,
0.9840019, 0.439541, 0.7315379, 0.9803922, 0, 1, 1,
0.9841908, -0.06779527, -0.1903712, 0.9843137, 0, 1, 1,
0.9909297, 0.9652987, -0.2298306, 0.9921569, 0, 1, 1,
0.99288, 0.5765663, -1.395039, 0.9960784, 0, 1, 1,
0.9982656, 0.04405676, 2.619622, 1, 0, 0.9960784, 1,
1.001302, -0.9725068, 2.638257, 1, 0, 0.9882353, 1,
1.002786, 1.222746, 0.7200891, 1, 0, 0.9843137, 1,
1.009057, 1.321305, 0.7362445, 1, 0, 0.9764706, 1,
1.01175, 0.5040275, 1.119726, 1, 0, 0.972549, 1,
1.02036, 0.5285931, 1.429736, 1, 0, 0.9647059, 1,
1.021749, 0.6161026, 1.523522, 1, 0, 0.9607843, 1,
1.025298, 3.621519, 0.8699579, 1, 0, 0.9529412, 1,
1.02804, -0.2150974, 1.689508, 1, 0, 0.9490196, 1,
1.028215, 1.070975, 0.4262914, 1, 0, 0.9411765, 1,
1.037472, -0.762279, 3.602098, 1, 0, 0.9372549, 1,
1.042561, -1.153461, 1.874062, 1, 0, 0.9294118, 1,
1.042896, -0.2883662, 2.077325, 1, 0, 0.9254902, 1,
1.04443, -0.3476588, 2.444888, 1, 0, 0.9176471, 1,
1.053402, 0.6431802, 0.02205462, 1, 0, 0.9137255, 1,
1.055427, -0.4071187, 4.1396, 1, 0, 0.9058824, 1,
1.059855, 0.6197822, 1.432064, 1, 0, 0.9019608, 1,
1.06106, -1.839017, 0.9774213, 1, 0, 0.8941177, 1,
1.070534, -1.460343, 2.510646, 1, 0, 0.8862745, 1,
1.080927, -0.9373875, 1.866588, 1, 0, 0.8823529, 1,
1.083489, -0.8172525, 2.04887, 1, 0, 0.8745098, 1,
1.084985, 1.728154, 1.647023, 1, 0, 0.8705882, 1,
1.08887, 0.4663633, 0.8139822, 1, 0, 0.8627451, 1,
1.091613, 0.3747003, 2.087899, 1, 0, 0.8588235, 1,
1.093916, 0.2670235, 0.8472964, 1, 0, 0.8509804, 1,
1.094999, 0.3272779, -0.3832301, 1, 0, 0.8470588, 1,
1.095637, 0.7180488, -0.7599514, 1, 0, 0.8392157, 1,
1.113204, -0.03843686, 3.99, 1, 0, 0.8352941, 1,
1.118589, -1.189577, 3.111007, 1, 0, 0.827451, 1,
1.123833, 0.7709508, 2.185844, 1, 0, 0.8235294, 1,
1.124516, -1.181103, 3.159603, 1, 0, 0.8156863, 1,
1.127382, 0.1749571, 3.240669, 1, 0, 0.8117647, 1,
1.128923, 0.1497354, 0.7438815, 1, 0, 0.8039216, 1,
1.133068, 0.4318092, 1.050534, 1, 0, 0.7960784, 1,
1.133336, 0.9884714, 0.07668143, 1, 0, 0.7921569, 1,
1.134193, -0.7080424, 1.346432, 1, 0, 0.7843137, 1,
1.134515, 0.2714903, -0.08569, 1, 0, 0.7803922, 1,
1.153021, -1.377355, 4.104931, 1, 0, 0.772549, 1,
1.155203, 0.1797095, 0.03368573, 1, 0, 0.7686275, 1,
1.166175, -0.6905306, 2.291777, 1, 0, 0.7607843, 1,
1.175248, 0.4108664, 2.121483, 1, 0, 0.7568628, 1,
1.176823, 0.3469789, 0.8097193, 1, 0, 0.7490196, 1,
1.17996, -1.031164, 1.303564, 1, 0, 0.7450981, 1,
1.180485, -1.557222, 1.772011, 1, 0, 0.7372549, 1,
1.185132, 0.09174204, 1.277703, 1, 0, 0.7333333, 1,
1.185259, 0.9742225, -0.1165827, 1, 0, 0.7254902, 1,
1.190242, 0.01110584, 0.7350339, 1, 0, 0.7215686, 1,
1.197791, 0.2815859, 0.9231909, 1, 0, 0.7137255, 1,
1.201573, -2.396461, 4.609378, 1, 0, 0.7098039, 1,
1.207829, -0.6869976, 3.923071, 1, 0, 0.7019608, 1,
1.208974, -0.5082794, 2.464765, 1, 0, 0.6941177, 1,
1.221497, 1.476391, -1.140677, 1, 0, 0.6901961, 1,
1.224941, -1.836106, 3.779399, 1, 0, 0.682353, 1,
1.227421, 0.5130887, -0.4765124, 1, 0, 0.6784314, 1,
1.242564, -0.7139637, 1.59851, 1, 0, 0.6705883, 1,
1.243545, -0.5009608, 2.368538, 1, 0, 0.6666667, 1,
1.246452, -0.473123, 0.8845235, 1, 0, 0.6588235, 1,
1.249311, -0.9074009, 2.615791, 1, 0, 0.654902, 1,
1.271466, -0.1915352, 1.735525, 1, 0, 0.6470588, 1,
1.275275, -1.639313, 2.506176, 1, 0, 0.6431373, 1,
1.275845, -0.05178546, 1.325753, 1, 0, 0.6352941, 1,
1.286105, 1.954181, 0.5317392, 1, 0, 0.6313726, 1,
1.299618, -1.317742, 2.231613, 1, 0, 0.6235294, 1,
1.301033, 1.552368, -0.748836, 1, 0, 0.6196079, 1,
1.303876, 0.2184078, 2.108004, 1, 0, 0.6117647, 1,
1.305148, -0.4582221, 0.3380483, 1, 0, 0.6078432, 1,
1.320918, 0.4808126, 1.355809, 1, 0, 0.6, 1,
1.321124, -0.1292278, 1.055727, 1, 0, 0.5921569, 1,
1.32643, 0.08317045, 1.668202, 1, 0, 0.5882353, 1,
1.32769, -0.9794552, 3.175397, 1, 0, 0.5803922, 1,
1.339032, 0.1764267, 0.01034701, 1, 0, 0.5764706, 1,
1.344704, 1.268324, 1.572598, 1, 0, 0.5686275, 1,
1.345872, 1.290349, 0.299543, 1, 0, 0.5647059, 1,
1.359427, -0.8528499, 1.11266, 1, 0, 0.5568628, 1,
1.361857, -0.9062154, 2.549171, 1, 0, 0.5529412, 1,
1.365113, -0.5850791, 3.275927, 1, 0, 0.5450981, 1,
1.365582, -1.867917, 2.956061, 1, 0, 0.5411765, 1,
1.370517, 1.978244, -0.1704066, 1, 0, 0.5333334, 1,
1.378802, -1.700452, 2.199129, 1, 0, 0.5294118, 1,
1.388453, -1.679638, 1.861517, 1, 0, 0.5215687, 1,
1.402835, 0.294707, 0.584386, 1, 0, 0.5176471, 1,
1.420601, -0.695146, 2.32658, 1, 0, 0.509804, 1,
1.421291, -1.920228, 3.141799, 1, 0, 0.5058824, 1,
1.424651, -0.7104079, 0.7317998, 1, 0, 0.4980392, 1,
1.431612, -0.8920975, 1.208564, 1, 0, 0.4901961, 1,
1.433335, 1.970025, 0.7406644, 1, 0, 0.4862745, 1,
1.437489, 0.7549924, 3.260064, 1, 0, 0.4784314, 1,
1.451972, 0.9710587, 2.467762, 1, 0, 0.4745098, 1,
1.452869, -1.124761, 1.30065, 1, 0, 0.4666667, 1,
1.462062, 0.8538924, -0.3029326, 1, 0, 0.4627451, 1,
1.462113, -0.4427814, 2.134825, 1, 0, 0.454902, 1,
1.466247, 0.4633685, 0.4195321, 1, 0, 0.4509804, 1,
1.467116, 2.043326, 0.1585458, 1, 0, 0.4431373, 1,
1.475132, -1.266828, 4.468818, 1, 0, 0.4392157, 1,
1.475509, 1.437623, 0.06206301, 1, 0, 0.4313726, 1,
1.489691, 1.063814, 1.676052, 1, 0, 0.427451, 1,
1.50429, -1.409887, 1.737728, 1, 0, 0.4196078, 1,
1.516271, 1.079772, 1.390588, 1, 0, 0.4156863, 1,
1.518972, -2.084878, 3.983754, 1, 0, 0.4078431, 1,
1.524977, 0.6726919, -1.297046, 1, 0, 0.4039216, 1,
1.529958, -0.3747598, 0.2615607, 1, 0, 0.3960784, 1,
1.538562, 0.0581494, 0.1807461, 1, 0, 0.3882353, 1,
1.559293, 0.322893, 0.2305545, 1, 0, 0.3843137, 1,
1.574413, 0.1619888, 2.007087, 1, 0, 0.3764706, 1,
1.576166, -0.5506231, -0.3495988, 1, 0, 0.372549, 1,
1.576968, 1.331118, -0.003853267, 1, 0, 0.3647059, 1,
1.578232, -0.004932482, 0.4534369, 1, 0, 0.3607843, 1,
1.58393, 0.9572186, 0.4385116, 1, 0, 0.3529412, 1,
1.591369, 0.1437734, 2.027754, 1, 0, 0.3490196, 1,
1.616714, 0.0363689, 4.132625, 1, 0, 0.3411765, 1,
1.62754, 1.273144, 1.107384, 1, 0, 0.3372549, 1,
1.635969, -0.8466858, 2.311962, 1, 0, 0.3294118, 1,
1.636317, 0.09125306, 0.8668108, 1, 0, 0.3254902, 1,
1.646827, -1.688486, 2.210132, 1, 0, 0.3176471, 1,
1.648741, -0.5023457, 0.1419257, 1, 0, 0.3137255, 1,
1.66159, -0.1886159, 3.121908, 1, 0, 0.3058824, 1,
1.67162, -0.2096738, 2.532048, 1, 0, 0.2980392, 1,
1.67864, -1.210051, 1.558054, 1, 0, 0.2941177, 1,
1.683062, 3.250309, 0.4772449, 1, 0, 0.2862745, 1,
1.704075, -0.8140842, 1.964595, 1, 0, 0.282353, 1,
1.704166, 1.920072, 0.3294176, 1, 0, 0.2745098, 1,
1.712679, 0.8215145, 1.100085, 1, 0, 0.2705882, 1,
1.720564, 0.2736019, 1.586247, 1, 0, 0.2627451, 1,
1.75201, -0.4795403, 1.259092, 1, 0, 0.2588235, 1,
1.767397, -0.1236235, 0.8216547, 1, 0, 0.2509804, 1,
1.787976, 1.07685, 1.39187, 1, 0, 0.2470588, 1,
1.791323, -0.2651149, 1.644965, 1, 0, 0.2392157, 1,
1.79274, 0.5387003, 2.363181, 1, 0, 0.2352941, 1,
1.803406, -0.538785, 1.319398, 1, 0, 0.227451, 1,
1.833114, -0.9290354, 0.6423323, 1, 0, 0.2235294, 1,
1.853352, 1.142552, 2.016716, 1, 0, 0.2156863, 1,
1.861432, -1.098024, 0.154803, 1, 0, 0.2117647, 1,
1.879033, -0.8681341, 1.650558, 1, 0, 0.2039216, 1,
1.883433, -0.6585759, 2.898764, 1, 0, 0.1960784, 1,
1.892178, 0.7732776, 0.8268777, 1, 0, 0.1921569, 1,
1.893874, -0.1923724, 0.3816462, 1, 0, 0.1843137, 1,
1.896176, -0.437648, 1.051574, 1, 0, 0.1803922, 1,
1.913961, 0.2949829, 1.146445, 1, 0, 0.172549, 1,
1.934685, 1.307064, -0.4275841, 1, 0, 0.1686275, 1,
1.965794, -0.3266253, 3.205271, 1, 0, 0.1607843, 1,
1.979216, -1.219591, 2.470176, 1, 0, 0.1568628, 1,
1.988325, -0.319719, 2.569452, 1, 0, 0.1490196, 1,
2.026314, 0.610034, 1.434109, 1, 0, 0.145098, 1,
2.06046, 0.08575712, 2.679606, 1, 0, 0.1372549, 1,
2.068072, 0.1817852, 2.686606, 1, 0, 0.1333333, 1,
2.10289, 0.2860006, 1.978884, 1, 0, 0.1254902, 1,
2.137577, -0.6359458, 1.576994, 1, 0, 0.1215686, 1,
2.145864, 1.97876, 0.6888584, 1, 0, 0.1137255, 1,
2.172045, -0.2765749, 2.605478, 1, 0, 0.1098039, 1,
2.199429, -0.9018634, 4.140596, 1, 0, 0.1019608, 1,
2.20405, -0.7421224, 1.80915, 1, 0, 0.09411765, 1,
2.225552, -1.892381, 0.2345144, 1, 0, 0.09019608, 1,
2.232299, -1.430524, 0.9014454, 1, 0, 0.08235294, 1,
2.263609, -0.9227517, 1.984189, 1, 0, 0.07843138, 1,
2.297462, -0.6227596, 1.169735, 1, 0, 0.07058824, 1,
2.330073, 0.5358632, 1.619184, 1, 0, 0.06666667, 1,
2.359663, -0.09031366, 0.9089627, 1, 0, 0.05882353, 1,
2.403509, -1.698166, 1.1756, 1, 0, 0.05490196, 1,
2.41926, -0.07563077, 2.925201, 1, 0, 0.04705882, 1,
2.510543, 0.101278, 3.415655, 1, 0, 0.04313726, 1,
2.524224, -0.6682661, 1.772153, 1, 0, 0.03529412, 1,
2.605619, -1.516165, 0.9510201, 1, 0, 0.03137255, 1,
2.771, -0.3396233, 1.70378, 1, 0, 0.02352941, 1,
2.901479, 0.7334632, 1.50264, 1, 0, 0.01960784, 1,
2.925534, 1.102704, 0.6871422, 1, 0, 0.01176471, 1,
3.053218, 0.8609908, 2.995809, 1, 0, 0.007843138, 1
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
-0.3991742, -4.204593, -7.796766, 0, -0.5, 0.5, 0.5,
-0.3991742, -4.204593, -7.796766, 1, -0.5, 0.5, 0.5,
-0.3991742, -4.204593, -7.796766, 1, 1.5, 0.5, 0.5,
-0.3991742, -4.204593, -7.796766, 0, 1.5, 0.5, 0.5
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
-5.021927, 0.2755966, -7.796766, 0, -0.5, 0.5, 0.5,
-5.021927, 0.2755966, -7.796766, 1, -0.5, 0.5, 0.5,
-5.021927, 0.2755966, -7.796766, 1, 1.5, 0.5, 0.5,
-5.021927, 0.2755966, -7.796766, 0, 1.5, 0.5, 0.5
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
-5.021927, -4.204593, -0.05881953, 0, -0.5, 0.5, 0.5,
-5.021927, -4.204593, -0.05881953, 1, -0.5, 0.5, 0.5,
-5.021927, -4.204593, -0.05881953, 1, 1.5, 0.5, 0.5,
-5.021927, -4.204593, -0.05881953, 0, 1.5, 0.5, 0.5
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
-3, -3.170703, -6.011086,
3, -3.170703, -6.011086,
-3, -3.170703, -6.011086,
-3, -3.343018, -6.3087,
-2, -3.170703, -6.011086,
-2, -3.343018, -6.3087,
-1, -3.170703, -6.011086,
-1, -3.343018, -6.3087,
0, -3.170703, -6.011086,
0, -3.343018, -6.3087,
1, -3.170703, -6.011086,
1, -3.343018, -6.3087,
2, -3.170703, -6.011086,
2, -3.343018, -6.3087,
3, -3.170703, -6.011086,
3, -3.343018, -6.3087
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
-3, -3.687648, -6.903926, 0, -0.5, 0.5, 0.5,
-3, -3.687648, -6.903926, 1, -0.5, 0.5, 0.5,
-3, -3.687648, -6.903926, 1, 1.5, 0.5, 0.5,
-3, -3.687648, -6.903926, 0, 1.5, 0.5, 0.5,
-2, -3.687648, -6.903926, 0, -0.5, 0.5, 0.5,
-2, -3.687648, -6.903926, 1, -0.5, 0.5, 0.5,
-2, -3.687648, -6.903926, 1, 1.5, 0.5, 0.5,
-2, -3.687648, -6.903926, 0, 1.5, 0.5, 0.5,
-1, -3.687648, -6.903926, 0, -0.5, 0.5, 0.5,
-1, -3.687648, -6.903926, 1, -0.5, 0.5, 0.5,
-1, -3.687648, -6.903926, 1, 1.5, 0.5, 0.5,
-1, -3.687648, -6.903926, 0, 1.5, 0.5, 0.5,
0, -3.687648, -6.903926, 0, -0.5, 0.5, 0.5,
0, -3.687648, -6.903926, 1, -0.5, 0.5, 0.5,
0, -3.687648, -6.903926, 1, 1.5, 0.5, 0.5,
0, -3.687648, -6.903926, 0, 1.5, 0.5, 0.5,
1, -3.687648, -6.903926, 0, -0.5, 0.5, 0.5,
1, -3.687648, -6.903926, 1, -0.5, 0.5, 0.5,
1, -3.687648, -6.903926, 1, 1.5, 0.5, 0.5,
1, -3.687648, -6.903926, 0, 1.5, 0.5, 0.5,
2, -3.687648, -6.903926, 0, -0.5, 0.5, 0.5,
2, -3.687648, -6.903926, 1, -0.5, 0.5, 0.5,
2, -3.687648, -6.903926, 1, 1.5, 0.5, 0.5,
2, -3.687648, -6.903926, 0, 1.5, 0.5, 0.5,
3, -3.687648, -6.903926, 0, -0.5, 0.5, 0.5,
3, -3.687648, -6.903926, 1, -0.5, 0.5, 0.5,
3, -3.687648, -6.903926, 1, 1.5, 0.5, 0.5,
3, -3.687648, -6.903926, 0, 1.5, 0.5, 0.5
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
-3.955138, -3, -6.011086,
-3.955138, 3, -6.011086,
-3.955138, -3, -6.011086,
-4.132936, -3, -6.3087,
-3.955138, -2, -6.011086,
-4.132936, -2, -6.3087,
-3.955138, -1, -6.011086,
-4.132936, -1, -6.3087,
-3.955138, 0, -6.011086,
-4.132936, 0, -6.3087,
-3.955138, 1, -6.011086,
-4.132936, 1, -6.3087,
-3.955138, 2, -6.011086,
-4.132936, 2, -6.3087,
-3.955138, 3, -6.011086,
-4.132936, 3, -6.3087
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
-4.488533, -3, -6.903926, 0, -0.5, 0.5, 0.5,
-4.488533, -3, -6.903926, 1, -0.5, 0.5, 0.5,
-4.488533, -3, -6.903926, 1, 1.5, 0.5, 0.5,
-4.488533, -3, -6.903926, 0, 1.5, 0.5, 0.5,
-4.488533, -2, -6.903926, 0, -0.5, 0.5, 0.5,
-4.488533, -2, -6.903926, 1, -0.5, 0.5, 0.5,
-4.488533, -2, -6.903926, 1, 1.5, 0.5, 0.5,
-4.488533, -2, -6.903926, 0, 1.5, 0.5, 0.5,
-4.488533, -1, -6.903926, 0, -0.5, 0.5, 0.5,
-4.488533, -1, -6.903926, 1, -0.5, 0.5, 0.5,
-4.488533, -1, -6.903926, 1, 1.5, 0.5, 0.5,
-4.488533, -1, -6.903926, 0, 1.5, 0.5, 0.5,
-4.488533, 0, -6.903926, 0, -0.5, 0.5, 0.5,
-4.488533, 0, -6.903926, 1, -0.5, 0.5, 0.5,
-4.488533, 0, -6.903926, 1, 1.5, 0.5, 0.5,
-4.488533, 0, -6.903926, 0, 1.5, 0.5, 0.5,
-4.488533, 1, -6.903926, 0, -0.5, 0.5, 0.5,
-4.488533, 1, -6.903926, 1, -0.5, 0.5, 0.5,
-4.488533, 1, -6.903926, 1, 1.5, 0.5, 0.5,
-4.488533, 1, -6.903926, 0, 1.5, 0.5, 0.5,
-4.488533, 2, -6.903926, 0, -0.5, 0.5, 0.5,
-4.488533, 2, -6.903926, 1, -0.5, 0.5, 0.5,
-4.488533, 2, -6.903926, 1, 1.5, 0.5, 0.5,
-4.488533, 2, -6.903926, 0, 1.5, 0.5, 0.5,
-4.488533, 3, -6.903926, 0, -0.5, 0.5, 0.5,
-4.488533, 3, -6.903926, 1, -0.5, 0.5, 0.5,
-4.488533, 3, -6.903926, 1, 1.5, 0.5, 0.5,
-4.488533, 3, -6.903926, 0, 1.5, 0.5, 0.5
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
-3.955138, -3.170703, -4,
-3.955138, -3.170703, 4,
-3.955138, -3.170703, -4,
-4.132936, -3.343018, -4,
-3.955138, -3.170703, -2,
-4.132936, -3.343018, -2,
-3.955138, -3.170703, 0,
-4.132936, -3.343018, 0,
-3.955138, -3.170703, 2,
-4.132936, -3.343018, 2,
-3.955138, -3.170703, 4,
-4.132936, -3.343018, 4
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
-4.488533, -3.687648, -4, 0, -0.5, 0.5, 0.5,
-4.488533, -3.687648, -4, 1, -0.5, 0.5, 0.5,
-4.488533, -3.687648, -4, 1, 1.5, 0.5, 0.5,
-4.488533, -3.687648, -4, 0, 1.5, 0.5, 0.5,
-4.488533, -3.687648, -2, 0, -0.5, 0.5, 0.5,
-4.488533, -3.687648, -2, 1, -0.5, 0.5, 0.5,
-4.488533, -3.687648, -2, 1, 1.5, 0.5, 0.5,
-4.488533, -3.687648, -2, 0, 1.5, 0.5, 0.5,
-4.488533, -3.687648, 0, 0, -0.5, 0.5, 0.5,
-4.488533, -3.687648, 0, 1, -0.5, 0.5, 0.5,
-4.488533, -3.687648, 0, 1, 1.5, 0.5, 0.5,
-4.488533, -3.687648, 0, 0, 1.5, 0.5, 0.5,
-4.488533, -3.687648, 2, 0, -0.5, 0.5, 0.5,
-4.488533, -3.687648, 2, 1, -0.5, 0.5, 0.5,
-4.488533, -3.687648, 2, 1, 1.5, 0.5, 0.5,
-4.488533, -3.687648, 2, 0, 1.5, 0.5, 0.5,
-4.488533, -3.687648, 4, 0, -0.5, 0.5, 0.5,
-4.488533, -3.687648, 4, 1, -0.5, 0.5, 0.5,
-4.488533, -3.687648, 4, 1, 1.5, 0.5, 0.5,
-4.488533, -3.687648, 4, 0, 1.5, 0.5, 0.5
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
-3.955138, -3.170703, -6.011086,
-3.955138, 3.721896, -6.011086,
-3.955138, -3.170703, 5.893447,
-3.955138, 3.721896, 5.893447,
-3.955138, -3.170703, -6.011086,
-3.955138, -3.170703, 5.893447,
-3.955138, 3.721896, -6.011086,
-3.955138, 3.721896, 5.893447,
-3.955138, -3.170703, -6.011086,
3.15679, -3.170703, -6.011086,
-3.955138, -3.170703, 5.893447,
3.15679, -3.170703, 5.893447,
-3.955138, 3.721896, -6.011086,
3.15679, 3.721896, -6.011086,
-3.955138, 3.721896, 5.893447,
3.15679, 3.721896, 5.893447,
3.15679, -3.170703, -6.011086,
3.15679, 3.721896, -6.011086,
3.15679, -3.170703, 5.893447,
3.15679, 3.721896, 5.893447,
3.15679, -3.170703, -6.011086,
3.15679, -3.170703, 5.893447,
3.15679, 3.721896, -6.011086,
3.15679, 3.721896, 5.893447
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
var radius = 8.269037;
var distance = 36.78988;
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
mvMatrix.translate( 0.3991742, -0.2755966, 0.05881953 );
mvMatrix.scale( 1.257134, 1.297137, 0.7510285 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.78988);
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
bromophos_ethyl<-read.table("bromophos_ethyl.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-bromophos_ethyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'bromophos_ethyl' not found
```

```r
y<-bromophos_ethyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'bromophos_ethyl' not found
```

```r
z<-bromophos_ethyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'bromophos_ethyl' not found
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
-3.851566, -0.7418225, -0.5054048, 0, 0, 1, 1, 1,
-3.516467, -0.3508582, -2.074026, 1, 0, 0, 1, 1,
-3.157277, -1.288421, -2.527332, 1, 0, 0, 1, 1,
-2.793114, 0.3670762, -1.958082, 1, 0, 0, 1, 1,
-2.713986, 1.433409, -1.568807, 1, 0, 0, 1, 1,
-2.680484, 0.2665375, -0.3620075, 1, 0, 0, 1, 1,
-2.666526, -0.5094216, -1.493622, 0, 0, 0, 1, 1,
-2.475781, 0.3974192, -3.89508, 0, 0, 0, 1, 1,
-2.427601, -0.5205332, -2.204281, 0, 0, 0, 1, 1,
-2.411976, -1.349192, -1.200224, 0, 0, 0, 1, 1,
-2.320642, -1.59425, -3.508332, 0, 0, 0, 1, 1,
-2.280608, -1.267714, -2.277327, 0, 0, 0, 1, 1,
-2.178886, 0.5204865, -2.698104, 0, 0, 0, 1, 1,
-2.134429, -0.380456, 1.250369, 1, 1, 1, 1, 1,
-2.126101, 3.08152, 1.334837, 1, 1, 1, 1, 1,
-2.118688, 1.06226, -0.8265846, 1, 1, 1, 1, 1,
-2.105749, -0.1138026, -1.765862, 1, 1, 1, 1, 1,
-2.07641, 0.6998233, -0.5334662, 1, 1, 1, 1, 1,
-2.054291, 0.2099786, -3.112885, 1, 1, 1, 1, 1,
-2.046438, 1.596136, -0.3813837, 1, 1, 1, 1, 1,
-2.03085, -0.750397, -1.417853, 1, 1, 1, 1, 1,
-2.011028, 0.7999759, -1.254741, 1, 1, 1, 1, 1,
-1.998255, 1.223405, -0.4917903, 1, 1, 1, 1, 1,
-1.98881, -2.73325, -2.341245, 1, 1, 1, 1, 1,
-1.966833, 0.2255812, -1.20504, 1, 1, 1, 1, 1,
-1.945811, 0.3897984, -1.664074, 1, 1, 1, 1, 1,
-1.94247, 2.304945, -0.0779153, 1, 1, 1, 1, 1,
-1.915336, -0.2646289, -0.9431558, 1, 1, 1, 1, 1,
-1.881438, -1.629487, -3.502563, 0, 0, 1, 1, 1,
-1.842024, 1.006422, -1.968994, 1, 0, 0, 1, 1,
-1.83983, -0.6788478, -0.1023538, 1, 0, 0, 1, 1,
-1.837325, 0.3982266, -1.142558, 1, 0, 0, 1, 1,
-1.790299, -0.1791194, -0.7876356, 1, 0, 0, 1, 1,
-1.785424, 0.43487, -1.469749, 1, 0, 0, 1, 1,
-1.782316, -0.7469541, -2.548872, 0, 0, 0, 1, 1,
-1.780611, 0.6904057, -2.333549, 0, 0, 0, 1, 1,
-1.774292, -0.6950534, -0.3317589, 0, 0, 0, 1, 1,
-1.752607, 0.1453888, -1.725217, 0, 0, 0, 1, 1,
-1.747388, -1.190531, -2.95728, 0, 0, 0, 1, 1,
-1.739672, 0.2584351, -1.557432, 0, 0, 0, 1, 1,
-1.717809, 0.1779579, -1.907597, 0, 0, 0, 1, 1,
-1.667921, -2.418076, -2.414621, 1, 1, 1, 1, 1,
-1.643561, 0.29407, -0.337944, 1, 1, 1, 1, 1,
-1.639681, 0.7926229, -3.174779, 1, 1, 1, 1, 1,
-1.633134, 1.2459, -0.5781937, 1, 1, 1, 1, 1,
-1.624985, -0.3056614, -2.745592, 1, 1, 1, 1, 1,
-1.621783, -0.3796913, -2.99193, 1, 1, 1, 1, 1,
-1.615836, 0.50769, -0.7213044, 1, 1, 1, 1, 1,
-1.611977, -1.560101, -1.950398, 1, 1, 1, 1, 1,
-1.608737, -1.600261, -0.3070195, 1, 1, 1, 1, 1,
-1.6026, -0.8670396, -0.08034188, 1, 1, 1, 1, 1,
-1.586516, -0.8095786, -1.74893, 1, 1, 1, 1, 1,
-1.58115, -0.6774201, -0.1836413, 1, 1, 1, 1, 1,
-1.56513, -0.2894171, -3.326639, 1, 1, 1, 1, 1,
-1.55632, -0.4820746, -1.136099, 1, 1, 1, 1, 1,
-1.548894, -0.4094863, -2.785662, 1, 1, 1, 1, 1,
-1.536917, 1.129176, -1.200998, 0, 0, 1, 1, 1,
-1.532176, 1.532358, 0.7840547, 1, 0, 0, 1, 1,
-1.531414, -1.491469, -2.559402, 1, 0, 0, 1, 1,
-1.514849, 1.535151, -0.4417928, 1, 0, 0, 1, 1,
-1.498556, 0.5973764, 0.9606963, 1, 0, 0, 1, 1,
-1.482396, 0.08781223, -3.873082, 1, 0, 0, 1, 1,
-1.47853, 0.4121246, -0.2544607, 0, 0, 0, 1, 1,
-1.473474, 2.668568, 0.961379, 0, 0, 0, 1, 1,
-1.472783, -1.159246, -3.039332, 0, 0, 0, 1, 1,
-1.47077, -1.09428, -0.5241069, 0, 0, 0, 1, 1,
-1.465949, -0.5977662, -1.358742, 0, 0, 0, 1, 1,
-1.463244, 1.09587, -2.295458, 0, 0, 0, 1, 1,
-1.458341, 0.5115695, -2.17314, 0, 0, 0, 1, 1,
-1.455307, -0.6138611, -2.926872, 1, 1, 1, 1, 1,
-1.453933, -0.5707595, -1.718483, 1, 1, 1, 1, 1,
-1.440601, 0.6428011, 1.337457, 1, 1, 1, 1, 1,
-1.427928, -2.334609, -2.761667, 1, 1, 1, 1, 1,
-1.412535, 1.453511, -0.8874536, 1, 1, 1, 1, 1,
-1.411037, -1.10033, -1.596049, 1, 1, 1, 1, 1,
-1.405789, 0.3872686, -1.299452, 1, 1, 1, 1, 1,
-1.394598, -0.3177283, -1.056461, 1, 1, 1, 1, 1,
-1.384861, 0.1859301, -2.80876, 1, 1, 1, 1, 1,
-1.352733, 0.2023538, -0.9399757, 1, 1, 1, 1, 1,
-1.352182, 1.676603, -0.4664021, 1, 1, 1, 1, 1,
-1.340066, 0.3223555, -0.1378247, 1, 1, 1, 1, 1,
-1.331587, -0.8134832, -2.860476, 1, 1, 1, 1, 1,
-1.33103, 0.6904475, -0.7220054, 1, 1, 1, 1, 1,
-1.302251, 0.821879, -0.1955133, 1, 1, 1, 1, 1,
-1.295738, -1.501237, -3.758833, 0, 0, 1, 1, 1,
-1.294426, -1.951085, -1.316185, 1, 0, 0, 1, 1,
-1.290951, -0.5646217, -2.599425, 1, 0, 0, 1, 1,
-1.286037, 0.1082776, -1.485104, 1, 0, 0, 1, 1,
-1.285247, -1.33247, -2.785372, 1, 0, 0, 1, 1,
-1.284525, 0.2556939, -2.903118, 1, 0, 0, 1, 1,
-1.276515, -0.08258291, -1.868911, 0, 0, 0, 1, 1,
-1.26888, -2.277838, -1.855259, 0, 0, 0, 1, 1,
-1.262148, -1.083444, -1.444991, 0, 0, 0, 1, 1,
-1.259109, -0.7670214, -0.6643972, 0, 0, 0, 1, 1,
-1.258556, 0.7059621, 0.3131731, 0, 0, 0, 1, 1,
-1.246188, 1.011035, -0.8434274, 0, 0, 0, 1, 1,
-1.24413, -2.637567, -1.930905, 0, 0, 0, 1, 1,
-1.234595, -0.1085478, -0.3440588, 1, 1, 1, 1, 1,
-1.231886, 1.126411, -0.5034816, 1, 1, 1, 1, 1,
-1.231747, 0.846278, -2.188062, 1, 1, 1, 1, 1,
-1.228107, -0.3157173, -2.276152, 1, 1, 1, 1, 1,
-1.204401, 1.615869, -0.3141911, 1, 1, 1, 1, 1,
-1.194683, 1.471364, -0.740673, 1, 1, 1, 1, 1,
-1.184299, -0.8787059, -2.358239, 1, 1, 1, 1, 1,
-1.177598, 0.6478539, -0.9144139, 1, 1, 1, 1, 1,
-1.176838, -0.1187515, -0.2176504, 1, 1, 1, 1, 1,
-1.175905, -0.7814796, -2.32799, 1, 1, 1, 1, 1,
-1.169361, -0.7798252, -0.6300617, 1, 1, 1, 1, 1,
-1.152145, 0.3057134, 0.4491448, 1, 1, 1, 1, 1,
-1.145774, -1.366277, -1.359011, 1, 1, 1, 1, 1,
-1.141599, -0.04917188, -1.947662, 1, 1, 1, 1, 1,
-1.137662, 1.201944, -0.4957863, 1, 1, 1, 1, 1,
-1.127511, 0.3943358, -2.060163, 0, 0, 1, 1, 1,
-1.117432, -1.400274, -1.457865, 1, 0, 0, 1, 1,
-1.106332, 0.4313798, -2.543002, 1, 0, 0, 1, 1,
-1.106142, 0.08463841, -0.9270189, 1, 0, 0, 1, 1,
-1.10498, 0.7512729, -0.247489, 1, 0, 0, 1, 1,
-1.103684, 0.5357289, -2.008104, 1, 0, 0, 1, 1,
-1.103327, -0.7047752, -2.388843, 0, 0, 0, 1, 1,
-1.097039, -0.3123474, -2.486187, 0, 0, 0, 1, 1,
-1.093345, 0.2228781, -2.933131, 0, 0, 0, 1, 1,
-1.092864, -1.596254, -1.694407, 0, 0, 0, 1, 1,
-1.091782, 0.391772, -2.29367, 0, 0, 0, 1, 1,
-1.090076, -1.48182, -3.092725, 0, 0, 0, 1, 1,
-1.080564, 1.192813, -0.1253666, 0, 0, 0, 1, 1,
-1.080342, -1.000973, -2.273295, 1, 1, 1, 1, 1,
-1.073915, -1.012959, -2.968771, 1, 1, 1, 1, 1,
-1.063469, -0.5378484, -3.686018, 1, 1, 1, 1, 1,
-1.055796, -1.266457, -2.71187, 1, 1, 1, 1, 1,
-1.054408, 1.737047, -0.9296982, 1, 1, 1, 1, 1,
-1.054356, 0.4021901, -2.197979, 1, 1, 1, 1, 1,
-1.054194, -0.7735884, -0.6270853, 1, 1, 1, 1, 1,
-1.054107, 1.11035, -3.946782, 1, 1, 1, 1, 1,
-1.049369, 1.387015, 0.1631308, 1, 1, 1, 1, 1,
-1.04886, -0.7179558, -1.122762, 1, 1, 1, 1, 1,
-1.045921, 0.3876946, -3.257612, 1, 1, 1, 1, 1,
-1.044402, 0.8126584, 1.18822, 1, 1, 1, 1, 1,
-1.042657, 0.6015549, -0.4641532, 1, 1, 1, 1, 1,
-1.0302, 1.676047, -1.379766, 1, 1, 1, 1, 1,
-1.028922, 1.454217, -1.155488, 1, 1, 1, 1, 1,
-1.022876, -0.965103, -0.8132886, 0, 0, 1, 1, 1,
-1.022818, -0.6258447, -5.179375, 1, 0, 0, 1, 1,
-1.016458, 0.04461884, -1.620944, 1, 0, 0, 1, 1,
-1.013964, 1.321722, -0.004689518, 1, 0, 0, 1, 1,
-1.01166, -0.6903052, -3.281024, 1, 0, 0, 1, 1,
-1.005021, -0.6482741, -5.453898, 1, 0, 0, 1, 1,
-0.9992507, -0.4771722, -0.9550375, 0, 0, 0, 1, 1,
-0.9897795, 0.5947515, -0.5661901, 0, 0, 0, 1, 1,
-0.9845707, -0.2180374, -2.638323, 0, 0, 0, 1, 1,
-0.9794468, 0.2911353, -0.7951741, 0, 0, 0, 1, 1,
-0.9762721, -0.7503734, -2.479338, 0, 0, 0, 1, 1,
-0.957681, -1.214631, -2.749581, 0, 0, 0, 1, 1,
-0.9480293, -0.08085709, -2.975151, 0, 0, 0, 1, 1,
-0.9475985, -2.091173, -1.558489, 1, 1, 1, 1, 1,
-0.9462026, -1.519547, -3.009246, 1, 1, 1, 1, 1,
-0.9367731, 0.1541101, -1.832518, 1, 1, 1, 1, 1,
-0.9349756, 0.7217171, -2.688314, 1, 1, 1, 1, 1,
-0.9291026, -0.7146389, -0.6146994, 1, 1, 1, 1, 1,
-0.9280146, -1.174027, -1.41244, 1, 1, 1, 1, 1,
-0.9162672, -0.8753182, -3.314997, 1, 1, 1, 1, 1,
-0.9142991, -1.448572, -3.788652, 1, 1, 1, 1, 1,
-0.9118113, -1.16496, -3.335041, 1, 1, 1, 1, 1,
-0.9063938, -2.34042, -2.433055, 1, 1, 1, 1, 1,
-0.8997529, 0.89799, -1.146058, 1, 1, 1, 1, 1,
-0.8989807, 0.5790158, -1.374491, 1, 1, 1, 1, 1,
-0.8848068, -0.9005252, -2.582862, 1, 1, 1, 1, 1,
-0.8838252, -1.702918, -2.753819, 1, 1, 1, 1, 1,
-0.8830269, 0.9885817, -0.3312598, 1, 1, 1, 1, 1,
-0.8829446, 1.539877, -1.564437, 0, 0, 1, 1, 1,
-0.8744742, 0.3018411, -1.38339, 1, 0, 0, 1, 1,
-0.8730026, -0.04639965, -0.8506191, 1, 0, 0, 1, 1,
-0.8693858, -1.041431, -3.541929, 1, 0, 0, 1, 1,
-0.8665711, -1.00798, -1.141752, 1, 0, 0, 1, 1,
-0.8620632, 0.7667323, 0.6793845, 1, 0, 0, 1, 1,
-0.8606322, -0.1163827, 0.3365471, 0, 0, 0, 1, 1,
-0.8583755, -0.793557, -1.660246, 0, 0, 0, 1, 1,
-0.8580302, 0.04071944, -3.404878, 0, 0, 0, 1, 1,
-0.8535704, -0.362415, -2.437755, 0, 0, 0, 1, 1,
-0.8532394, -0.2921361, -2.48719, 0, 0, 0, 1, 1,
-0.8509588, 0.5093138, -1.565276, 0, 0, 0, 1, 1,
-0.8476345, 0.986834, -1.08045, 0, 0, 0, 1, 1,
-0.84687, -0.3597153, -0.1884319, 1, 1, 1, 1, 1,
-0.8388453, 0.679414, -2.012, 1, 1, 1, 1, 1,
-0.8382391, -1.012286, -0.3489273, 1, 1, 1, 1, 1,
-0.8370211, 0.4484268, -0.5488963, 1, 1, 1, 1, 1,
-0.8339679, -1.53597, -2.190375, 1, 1, 1, 1, 1,
-0.8272091, -0.2362854, -0.730865, 1, 1, 1, 1, 1,
-0.8242561, 0.5218278, 0.7346495, 1, 1, 1, 1, 1,
-0.8225715, 1.640024, -1.213178, 1, 1, 1, 1, 1,
-0.8192923, -0.2595019, -0.7771451, 1, 1, 1, 1, 1,
-0.808167, 1.094298, -2.086684, 1, 1, 1, 1, 1,
-0.7914832, 0.8419249, 0.4358812, 1, 1, 1, 1, 1,
-0.789765, -0.2523732, -1.027256, 1, 1, 1, 1, 1,
-0.7849343, -1.017301, -3.032319, 1, 1, 1, 1, 1,
-0.7835873, -1.239043, -3.64745, 1, 1, 1, 1, 1,
-0.7827391, -0.2342608, -1.742306, 1, 1, 1, 1, 1,
-0.7804241, 0.1913894, -0.9714307, 0, 0, 1, 1, 1,
-0.7771802, 1.366991, -0.003069809, 1, 0, 0, 1, 1,
-0.7718326, -1.083388, -2.314305, 1, 0, 0, 1, 1,
-0.7674373, 0.3579729, -1.781059, 1, 0, 0, 1, 1,
-0.7670149, 0.8383293, -0.4150531, 1, 0, 0, 1, 1,
-0.7658238, 0.79681, -0.9804119, 1, 0, 0, 1, 1,
-0.7632874, 0.7569768, -1.257162, 0, 0, 0, 1, 1,
-0.7631004, 1.223326, 0.5842609, 0, 0, 0, 1, 1,
-0.7593931, -0.8413408, -1.569095, 0, 0, 0, 1, 1,
-0.7581756, 1.197105, 0.3757479, 0, 0, 0, 1, 1,
-0.7541156, -0.6457963, -2.443437, 0, 0, 0, 1, 1,
-0.7518724, -0.3961207, -2.163497, 0, 0, 0, 1, 1,
-0.7438185, 0.7386548, 0.2059653, 0, 0, 0, 1, 1,
-0.7413476, -0.02072858, -2.608852, 1, 1, 1, 1, 1,
-0.740808, -0.5334867, -4.477581, 1, 1, 1, 1, 1,
-0.7372925, -0.6017807, -0.4785571, 1, 1, 1, 1, 1,
-0.7368992, -1.483969, -3.569131, 1, 1, 1, 1, 1,
-0.7367565, 0.6226341, 0.764495, 1, 1, 1, 1, 1,
-0.7349421, 0.2695163, 0.6503448, 1, 1, 1, 1, 1,
-0.7304262, 1.264912, 0.8615546, 1, 1, 1, 1, 1,
-0.7238481, -2.272259, -1.372468, 1, 1, 1, 1, 1,
-0.7220781, 1.409671, 0.9435871, 1, 1, 1, 1, 1,
-0.7187716, 1.082686, -0.615471, 1, 1, 1, 1, 1,
-0.7174909, 1.686407, -0.3662925, 1, 1, 1, 1, 1,
-0.7147434, 0.7388269, -0.2357603, 1, 1, 1, 1, 1,
-0.7143832, 0.6712225, 0.9658193, 1, 1, 1, 1, 1,
-0.7099146, 0.3534542, -2.692548, 1, 1, 1, 1, 1,
-0.7068073, -0.530106, -5.060184, 1, 1, 1, 1, 1,
-0.700388, 0.04353609, -1.696873, 0, 0, 1, 1, 1,
-0.6954488, 1.335467, -0.9072649, 1, 0, 0, 1, 1,
-0.6940162, 0.4401211, -1.002308, 1, 0, 0, 1, 1,
-0.6910533, 0.9596637, -0.8690919, 1, 0, 0, 1, 1,
-0.6871272, -1.825738, -4.211862, 1, 0, 0, 1, 1,
-0.6856039, -0.3218721, -3.327476, 1, 0, 0, 1, 1,
-0.6827378, -1.574558, -3.938222, 0, 0, 0, 1, 1,
-0.6818646, -0.5124485, -1.615945, 0, 0, 0, 1, 1,
-0.6805584, -1.708714, -4.008021, 0, 0, 0, 1, 1,
-0.6779779, -0.0100541, -3.010459, 0, 0, 0, 1, 1,
-0.6762651, -1.802766, -3.094315, 0, 0, 0, 1, 1,
-0.6741637, -1.163131, -3.47572, 0, 0, 0, 1, 1,
-0.6706964, 1.430637, -0.2652495, 0, 0, 0, 1, 1,
-0.6700828, 1.608924, -0.8660639, 1, 1, 1, 1, 1,
-0.6691661, -1.65986, -3.098814, 1, 1, 1, 1, 1,
-0.6654843, 1.275706, -1.481661, 1, 1, 1, 1, 1,
-0.6631667, -1.260954, -1.558886, 1, 1, 1, 1, 1,
-0.6568328, -0.1991655, -1.873766, 1, 1, 1, 1, 1,
-0.6566557, 2.073588, -0.3860069, 1, 1, 1, 1, 1,
-0.6564583, 0.02649481, -1.915074, 1, 1, 1, 1, 1,
-0.6560511, 1.011768, 0.08941874, 1, 1, 1, 1, 1,
-0.6558782, -0.2359217, -1.985593, 1, 1, 1, 1, 1,
-0.6532586, -0.1995239, -1.616093, 1, 1, 1, 1, 1,
-0.650003, -0.9082785, -2.580682, 1, 1, 1, 1, 1,
-0.6497167, 1.298508, -0.4167236, 1, 1, 1, 1, 1,
-0.6483283, 1.932887, 0.7763218, 1, 1, 1, 1, 1,
-0.6438024, 0.3774718, 0.08118891, 1, 1, 1, 1, 1,
-0.6432619, 0.6070167, -0.449921, 1, 1, 1, 1, 1,
-0.6432076, 1.697662, -0.8491069, 0, 0, 1, 1, 1,
-0.641843, -0.7168478, -3.572411, 1, 0, 0, 1, 1,
-0.6289741, -0.1656201, -0.6744064, 1, 0, 0, 1, 1,
-0.6250424, -1.325096, -1.736021, 1, 0, 0, 1, 1,
-0.6151797, -2.64893, -5.259533, 1, 0, 0, 1, 1,
-0.6134546, 0.4375583, 0.3096239, 1, 0, 0, 1, 1,
-0.6128656, -1.133758, -1.636663, 0, 0, 0, 1, 1,
-0.6124893, 2.868299, -1.142289, 0, 0, 0, 1, 1,
-0.6085896, -0.918305, -3.116182, 0, 0, 0, 1, 1,
-0.607738, -0.5089121, -2.402942, 0, 0, 0, 1, 1,
-0.6042987, -0.3197482, -4.199918, 0, 0, 0, 1, 1,
-0.5969872, 1.354867, -0.1318079, 0, 0, 0, 1, 1,
-0.5940135, -0.3657159, -2.793522, 0, 0, 0, 1, 1,
-0.586605, -0.7943905, -2.324957, 1, 1, 1, 1, 1,
-0.5653437, 2.110578, 0.3508331, 1, 1, 1, 1, 1,
-0.5649149, 1.33565, -1.661217, 1, 1, 1, 1, 1,
-0.5625987, -1.072994, -2.795606, 1, 1, 1, 1, 1,
-0.5475929, -0.1909857, -1.164991, 1, 1, 1, 1, 1,
-0.5470827, -0.5655764, -2.957545, 1, 1, 1, 1, 1,
-0.5439555, 0.4522494, -0.1079414, 1, 1, 1, 1, 1,
-0.5412058, 0.4428178, -2.369259, 1, 1, 1, 1, 1,
-0.5322587, -0.3746079, -2.635048, 1, 1, 1, 1, 1,
-0.5253399, -0.2561069, -0.4479039, 1, 1, 1, 1, 1,
-0.5226652, 0.1846541, -3.769045, 1, 1, 1, 1, 1,
-0.5222043, 0.3704457, -1.13482, 1, 1, 1, 1, 1,
-0.5209295, -1.382541, -2.311461, 1, 1, 1, 1, 1,
-0.5152509, 0.2623443, -2.768114, 1, 1, 1, 1, 1,
-0.5047886, 0.4566897, -1.393943, 1, 1, 1, 1, 1,
-0.4979359, 1.102821, -0.5138847, 0, 0, 1, 1, 1,
-0.4967417, -1.189994, -3.503186, 1, 0, 0, 1, 1,
-0.4948211, 0.8114957, -0.09620614, 1, 0, 0, 1, 1,
-0.4942829, -1.752084, -3.166403, 1, 0, 0, 1, 1,
-0.4937561, 0.6348496, -0.649898, 1, 0, 0, 1, 1,
-0.4915933, 0.4244223, -2.217735, 1, 0, 0, 1, 1,
-0.4885018, -1.65988, -3.380575, 0, 0, 0, 1, 1,
-0.4874028, -0.7485463, -1.645064, 0, 0, 0, 1, 1,
-0.4840284, 1.087319, -2.030149, 0, 0, 0, 1, 1,
-0.4740194, -0.8076872, -2.857303, 0, 0, 0, 1, 1,
-0.4639581, 0.6278398, -0.4728829, 0, 0, 0, 1, 1,
-0.4636746, -1.393967, -2.868453, 0, 0, 0, 1, 1,
-0.4624565, -2.36853, -2.966739, 0, 0, 0, 1, 1,
-0.4620168, 0.1733021, -0.9021372, 1, 1, 1, 1, 1,
-0.4609375, 0.9871325, -0.1194807, 1, 1, 1, 1, 1,
-0.451861, 1.071395, 0.5904602, 1, 1, 1, 1, 1,
-0.4493372, -0.5458301, -1.307993, 1, 1, 1, 1, 1,
-0.4423559, -0.6999802, -1.361799, 1, 1, 1, 1, 1,
-0.4420519, 2.341455, -0.02865271, 1, 1, 1, 1, 1,
-0.4367017, -0.09709542, -2.005003, 1, 1, 1, 1, 1,
-0.4332908, -0.04401601, 0.5478429, 1, 1, 1, 1, 1,
-0.4314352, -1.489167, -5.395511, 1, 1, 1, 1, 1,
-0.4300305, -0.03335343, -0.825424, 1, 1, 1, 1, 1,
-0.4293906, -0.7268017, -2.316504, 1, 1, 1, 1, 1,
-0.4261566, 0.1792335, -1.55306, 1, 1, 1, 1, 1,
-0.4253468, -1.54067, -3.655006, 1, 1, 1, 1, 1,
-0.4243692, 2.252552, -0.03314111, 1, 1, 1, 1, 1,
-0.4238351, -0.01618252, 0.03163537, 1, 1, 1, 1, 1,
-0.4234294, -1.190718, -2.981852, 0, 0, 1, 1, 1,
-0.4212083, 0.9381515, -1.610059, 1, 0, 0, 1, 1,
-0.4189599, -2.845638, -2.117661, 1, 0, 0, 1, 1,
-0.4186316, -1.449398, -2.73427, 1, 0, 0, 1, 1,
-0.4178534, -1.223983, -2.603698, 1, 0, 0, 1, 1,
-0.4142759, -0.1798324, -2.165941, 1, 0, 0, 1, 1,
-0.4116697, 1.100979, -1.290045, 0, 0, 0, 1, 1,
-0.4067932, 1.293457, 0.9195294, 0, 0, 0, 1, 1,
-0.3948379, -1.266501, -2.728106, 0, 0, 0, 1, 1,
-0.392209, 0.7954084, -0.2664971, 0, 0, 0, 1, 1,
-0.3913488, 2.416102, 0.2002729, 0, 0, 0, 1, 1,
-0.3713651, -1.98033, -2.958414, 0, 0, 0, 1, 1,
-0.3679498, -2.066964, -3.859105, 0, 0, 0, 1, 1,
-0.3672615, -0.08893885, -1.704453, 1, 1, 1, 1, 1,
-0.3637117, -0.4804794, -4.110257, 1, 1, 1, 1, 1,
-0.3636991, -1.548115, -2.879568, 1, 1, 1, 1, 1,
-0.3626828, 0.6249379, -1.490123, 1, 1, 1, 1, 1,
-0.3617022, -0.3684869, -1.635749, 1, 1, 1, 1, 1,
-0.3612201, -0.1281982, -2.335284, 1, 1, 1, 1, 1,
-0.359636, 1.468273, -1.081395, 1, 1, 1, 1, 1,
-0.3528872, -0.6713477, -2.455571, 1, 1, 1, 1, 1,
-0.3498613, -0.3443143, -2.63977, 1, 1, 1, 1, 1,
-0.3475176, 0.8514113, -0.9353349, 1, 1, 1, 1, 1,
-0.3474105, -1.124802, -4.029692, 1, 1, 1, 1, 1,
-0.3455442, 0.9574353, 2.271919, 1, 1, 1, 1, 1,
-0.3411098, 0.5867646, -2.61292, 1, 1, 1, 1, 1,
-0.3389547, 0.07598045, -1.117404, 1, 1, 1, 1, 1,
-0.3332285, 0.1396827, -0.5900287, 1, 1, 1, 1, 1,
-0.3329899, -0.5403775, -1.863189, 0, 0, 1, 1, 1,
-0.3266299, 0.3415553, -1.29189, 1, 0, 0, 1, 1,
-0.3257797, 0.7941564, -2.372119, 1, 0, 0, 1, 1,
-0.3234601, -2.349223, -1.361828, 1, 0, 0, 1, 1,
-0.3176978, -0.4991946, -2.40732, 1, 0, 0, 1, 1,
-0.3143413, -1.054516, -4.224574, 1, 0, 0, 1, 1,
-0.3139698, 1.71258, -0.2128685, 0, 0, 0, 1, 1,
-0.3063264, -1.158589, -2.493468, 0, 0, 0, 1, 1,
-0.3053953, -0.9903829, -3.474124, 0, 0, 0, 1, 1,
-0.3041323, 1.123954, 0.4382206, 0, 0, 0, 1, 1,
-0.3022922, -1.281582, -3.02248, 0, 0, 0, 1, 1,
-0.2984515, -1.12006, -3.995639, 0, 0, 0, 1, 1,
-0.2976527, -1.477127, -2.672843, 0, 0, 0, 1, 1,
-0.2975924, 0.4884827, -0.9625052, 1, 1, 1, 1, 1,
-0.2942625, 0.6373121, -0.4440258, 1, 1, 1, 1, 1,
-0.293472, 1.191648, -0.2949522, 1, 1, 1, 1, 1,
-0.293333, 0.1957511, -2.742393, 1, 1, 1, 1, 1,
-0.2924996, 1.451555, -1.094257, 1, 1, 1, 1, 1,
-0.2920622, -0.9796979, -3.027594, 1, 1, 1, 1, 1,
-0.2908649, 1.170864, -0.7883837, 1, 1, 1, 1, 1,
-0.2892938, -0.09622151, -0.9363638, 1, 1, 1, 1, 1,
-0.2886656, 1.437513, -1.712653, 1, 1, 1, 1, 1,
-0.2857264, 1.24525, 1.546342, 1, 1, 1, 1, 1,
-0.2846046, 0.5923738, -0.6538169, 1, 1, 1, 1, 1,
-0.2835856, -0.126066, -1.050572, 1, 1, 1, 1, 1,
-0.2817396, 1.74603, 2.660968, 1, 1, 1, 1, 1,
-0.2814177, 2.084932, -1.036332, 1, 1, 1, 1, 1,
-0.2805381, 0.8376639, -0.7802455, 1, 1, 1, 1, 1,
-0.2805034, 0.4046828, -0.7918398, 0, 0, 1, 1, 1,
-0.2803175, -0.08754583, -2.195743, 1, 0, 0, 1, 1,
-0.2767057, -0.2594957, -4.759599, 1, 0, 0, 1, 1,
-0.272269, 1.293231, -1.212343, 1, 0, 0, 1, 1,
-0.2696271, -0.6249195, -2.18763, 1, 0, 0, 1, 1,
-0.2694444, -0.06294122, -1.059659, 1, 0, 0, 1, 1,
-0.2688377, 1.479313, -3.036785, 0, 0, 0, 1, 1,
-0.2648351, 0.8417168, -0.6366022, 0, 0, 0, 1, 1,
-0.2640727, 1.316811, -0.1723592, 0, 0, 0, 1, 1,
-0.2626314, -1.266679, -4.131154, 0, 0, 0, 1, 1,
-0.2611849, 0.2964891, 0.1942081, 0, 0, 0, 1, 1,
-0.2568325, -0.4186456, -2.731979, 0, 0, 0, 1, 1,
-0.2557039, 0.1006508, -1.662864, 0, 0, 0, 1, 1,
-0.2550184, -0.3160737, -3.047863, 1, 1, 1, 1, 1,
-0.2539768, -1.112458, -1.341272, 1, 1, 1, 1, 1,
-0.252667, 1.825569, -2.260509, 1, 1, 1, 1, 1,
-0.2488896, -0.2302795, -2.532578, 1, 1, 1, 1, 1,
-0.248289, -1.677062, -5.837719, 1, 1, 1, 1, 1,
-0.2476732, 1.401871, 0.7520699, 1, 1, 1, 1, 1,
-0.2476177, -1.465081, -2.385297, 1, 1, 1, 1, 1,
-0.2475368, 0.3963295, -0.7650391, 1, 1, 1, 1, 1,
-0.2473875, -0.04041544, -2.922968, 1, 1, 1, 1, 1,
-0.2459491, -2.177507, -3.085344, 1, 1, 1, 1, 1,
-0.2449622, 0.7118019, 0.8309757, 1, 1, 1, 1, 1,
-0.2427935, 0.630926, -0.3823597, 1, 1, 1, 1, 1,
-0.2404556, -1.580812, -2.228571, 1, 1, 1, 1, 1,
-0.2331588, 0.2584699, 0.03749903, 1, 1, 1, 1, 1,
-0.2317404, 1.99363, -0.2689422, 1, 1, 1, 1, 1,
-0.2297946, -0.4007878, -1.623326, 0, 0, 1, 1, 1,
-0.2236277, 0.2830645, -0.9939673, 1, 0, 0, 1, 1,
-0.2234837, -0.9434926, -4.726989, 1, 0, 0, 1, 1,
-0.2146755, 0.02207619, -2.704718, 1, 0, 0, 1, 1,
-0.2096298, -1.351746, -4.496704, 1, 0, 0, 1, 1,
-0.2079101, 0.8682094, 1.605258, 1, 0, 0, 1, 1,
-0.1986446, -0.2677718, -1.381554, 0, 0, 0, 1, 1,
-0.1961234, -0.07198774, -0.7167243, 0, 0, 0, 1, 1,
-0.19602, -0.6663666, -3.558638, 0, 0, 0, 1, 1,
-0.1942185, 0.7217352, -0.9042835, 0, 0, 0, 1, 1,
-0.1929263, 0.343913, -0.5155272, 0, 0, 0, 1, 1,
-0.1859445, 0.2462837, -0.3748079, 0, 0, 0, 1, 1,
-0.1851958, -0.6404676, -2.315727, 0, 0, 0, 1, 1,
-0.1791096, 0.03484768, -0.8317922, 1, 1, 1, 1, 1,
-0.1782418, 1.723315, 0.4637547, 1, 1, 1, 1, 1,
-0.168674, 0.2824654, 0.3879943, 1, 1, 1, 1, 1,
-0.1677616, 0.03334276, -2.086613, 1, 1, 1, 1, 1,
-0.1667769, 1.47007, -0.4943517, 1, 1, 1, 1, 1,
-0.165736, 0.1684631, -1.247463, 1, 1, 1, 1, 1,
-0.1629135, -0.0799951, -1.115165, 1, 1, 1, 1, 1,
-0.1594266, 0.2220899, -2.068216, 1, 1, 1, 1, 1,
-0.1570545, 0.8886979, -0.3663069, 1, 1, 1, 1, 1,
-0.1517479, 1.621241, -1.137592, 1, 1, 1, 1, 1,
-0.1498619, 0.06102277, -0.6541305, 1, 1, 1, 1, 1,
-0.1497563, 0.7290156, 1.222267, 1, 1, 1, 1, 1,
-0.143702, -0.4428595, -2.641406, 1, 1, 1, 1, 1,
-0.1425669, 0.09678596, -1.015381, 1, 1, 1, 1, 1,
-0.1414739, 1.116189, 0.09364805, 1, 1, 1, 1, 1,
-0.1401726, -0.6621601, -1.931446, 0, 0, 1, 1, 1,
-0.1380561, -0.7308164, -2.221096, 1, 0, 0, 1, 1,
-0.1331756, -1.297587, -4.326906, 1, 0, 0, 1, 1,
-0.1308796, 0.6268359, 1.797436, 1, 0, 0, 1, 1,
-0.1289887, -1.046999, -3.522892, 1, 0, 0, 1, 1,
-0.1283805, 0.5857872, -0.6999928, 1, 0, 0, 1, 1,
-0.1268617, 0.4475159, 0.4267682, 0, 0, 0, 1, 1,
-0.1230788, -1.537841, -4.739642, 0, 0, 0, 1, 1,
-0.1224983, 1.133965, 0.6543168, 0, 0, 0, 1, 1,
-0.1222131, -1.063513, -4.093739, 0, 0, 0, 1, 1,
-0.1190474, -1.79533, -2.357418, 0, 0, 0, 1, 1,
-0.1187538, 0.7961262, 0.3980104, 0, 0, 0, 1, 1,
-0.116362, 0.2608089, 0.9490623, 0, 0, 0, 1, 1,
-0.1154844, 0.8768806, -1.793882, 1, 1, 1, 1, 1,
-0.1074277, 0.3232267, 0.1945425, 1, 1, 1, 1, 1,
-0.1065188, 0.8847176, -0.1127999, 1, 1, 1, 1, 1,
-0.1059476, 2.168474, 0.6552351, 1, 1, 1, 1, 1,
-0.1051753, -1.211252, -3.404541, 1, 1, 1, 1, 1,
-0.1003685, -1.543892, -2.340906, 1, 1, 1, 1, 1,
-0.09784384, -0.6712855, -2.363754, 1, 1, 1, 1, 1,
-0.09379061, 0.183788, -0.3889655, 1, 1, 1, 1, 1,
-0.09342276, -1.700606, -3.354726, 1, 1, 1, 1, 1,
-0.09136757, 0.2425281, 0.01366948, 1, 1, 1, 1, 1,
-0.08808874, -0.6941558, -2.713384, 1, 1, 1, 1, 1,
-0.08673752, 0.05149986, -2.256104, 1, 1, 1, 1, 1,
-0.08663083, -1.313919, -3.10453, 1, 1, 1, 1, 1,
-0.08625192, 0.9166065, 1.622813, 1, 1, 1, 1, 1,
-0.08421417, 0.2568735, -1.126318, 1, 1, 1, 1, 1,
-0.0832179, 1.103887, 0.03047825, 0, 0, 1, 1, 1,
-0.08173654, 1.018015, -1.350057, 1, 0, 0, 1, 1,
-0.08102425, -0.2313317, -2.892878, 1, 0, 0, 1, 1,
-0.08095822, -0.01741401, -0.9686857, 1, 0, 0, 1, 1,
-0.07742234, -0.2712409, -3.377336, 1, 0, 0, 1, 1,
-0.07540491, 0.3541307, 0.1326339, 1, 0, 0, 1, 1,
-0.06636255, 0.7051115, 1.625225, 0, 0, 0, 1, 1,
-0.06583251, 0.04831003, -0.0337369, 0, 0, 0, 1, 1,
-0.05785454, 0.5013251, 1.04357, 0, 0, 0, 1, 1,
-0.05075382, 0.9687951, -0.1605145, 0, 0, 0, 1, 1,
-0.04856131, 1.208844, -0.9184701, 0, 0, 0, 1, 1,
-0.04852176, -0.7130726, -3.023428, 0, 0, 0, 1, 1,
-0.04651299, -0.6863015, -1.935605, 0, 0, 0, 1, 1,
-0.04473135, 1.10034, 1.436595, 1, 1, 1, 1, 1,
-0.04457156, -1.079216, -3.085701, 1, 1, 1, 1, 1,
-0.04113853, 0.1285528, -1.134486, 1, 1, 1, 1, 1,
-0.04079466, 1.454903, 1.182034, 1, 1, 1, 1, 1,
-0.03232557, 0.03075865, -0.3424093, 1, 1, 1, 1, 1,
-0.02678476, 0.6965523, 0.6177118, 1, 1, 1, 1, 1,
-0.02378439, 0.5727537, 0.4719166, 1, 1, 1, 1, 1,
-0.01870701, 0.2025409, 0.3315539, 1, 1, 1, 1, 1,
-0.01551455, 0.6819473, 0.08770191, 1, 1, 1, 1, 1,
-0.01180953, -0.05683235, -2.666434, 1, 1, 1, 1, 1,
-0.01090148, 1.029424, 0.6022917, 1, 1, 1, 1, 1,
-0.007348613, -0.5563709, -3.464682, 1, 1, 1, 1, 1,
-0.004426546, -0.1465823, -1.376335, 1, 1, 1, 1, 1,
-0.0006923747, 0.6811043, -0.7802766, 1, 1, 1, 1, 1,
-0.000241388, -0.3720973, -2.851357, 1, 1, 1, 1, 1,
0.000145205, -0.05767614, 2.650935, 0, 0, 1, 1, 1,
0.0005968543, -0.1049124, 1.904204, 1, 0, 0, 1, 1,
0.002678911, -0.4264044, 3.071918, 1, 0, 0, 1, 1,
0.007903506, 0.1175267, -0.1522888, 1, 0, 0, 1, 1,
0.009743553, 1.059622, -0.489171, 1, 0, 0, 1, 1,
0.01131388, -0.2941786, 5.519167, 1, 0, 0, 1, 1,
0.01288271, -0.7259663, 1.363056, 0, 0, 0, 1, 1,
0.01591692, 1.524085, 0.9964592, 0, 0, 0, 1, 1,
0.01899223, 0.3062952, -0.4017063, 0, 0, 0, 1, 1,
0.01933937, 0.1708026, 0.5768972, 0, 0, 0, 1, 1,
0.02095552, -0.3686726, 3.385447, 0, 0, 0, 1, 1,
0.02670798, -0.117079, 1.785312, 0, 0, 0, 1, 1,
0.02901983, 0.143424, -1.435052, 0, 0, 0, 1, 1,
0.0319434, 2.732758, 0.8014849, 1, 1, 1, 1, 1,
0.03791567, -0.3033384, 3.882689, 1, 1, 1, 1, 1,
0.03969518, -1.139715, 5.72008, 1, 1, 1, 1, 1,
0.04118384, 0.4039878, 0.9115419, 1, 1, 1, 1, 1,
0.04172205, -0.1188221, 4.68062, 1, 1, 1, 1, 1,
0.04292707, 0.1990432, 0.3245031, 1, 1, 1, 1, 1,
0.04853539, 0.7497234, 0.1774085, 1, 1, 1, 1, 1,
0.04899485, -0.7505602, 3.50737, 1, 1, 1, 1, 1,
0.05812459, 0.8470218, -0.9755251, 1, 1, 1, 1, 1,
0.05863858, 0.5319691, 0.277532, 1, 1, 1, 1, 1,
0.06013218, 0.8740986, 1.460777, 1, 1, 1, 1, 1,
0.06193285, 1.070304, -1.714723, 1, 1, 1, 1, 1,
0.06250952, 2.172887, 0.08935808, 1, 1, 1, 1, 1,
0.06660646, 0.3344246, -0.5333019, 1, 1, 1, 1, 1,
0.06858398, -0.2951164, 4.010415, 1, 1, 1, 1, 1,
0.07613619, -1.081538, 1.735141, 0, 0, 1, 1, 1,
0.0769157, 0.2185106, 0.753978, 1, 0, 0, 1, 1,
0.07768334, -1.195835, 3.856148, 1, 0, 0, 1, 1,
0.0786081, -0.3295819, 1.601441, 1, 0, 0, 1, 1,
0.0787609, 0.7584777, -0.5471722, 1, 0, 0, 1, 1,
0.08104719, 0.8000208, -0.918363, 1, 0, 0, 1, 1,
0.08308126, -1.160431, 3.008706, 0, 0, 0, 1, 1,
0.0838437, -0.08424734, 4.273232, 0, 0, 0, 1, 1,
0.08435787, -0.6517915, 4.567842, 0, 0, 0, 1, 1,
0.08648574, 0.7078236, 0.5759276, 0, 0, 0, 1, 1,
0.08784999, 0.2427983, 0.9567509, 0, 0, 0, 1, 1,
0.08858957, 0.2166119, 1.377954, 0, 0, 0, 1, 1,
0.09142939, -0.9000015, 3.182946, 0, 0, 0, 1, 1,
0.09252041, -0.1752816, 1.141171, 1, 1, 1, 1, 1,
0.09524474, -1.040781, 3.710047, 1, 1, 1, 1, 1,
0.0961736, 0.2529023, -0.05384052, 1, 1, 1, 1, 1,
0.0982835, 0.09015372, 0.9251498, 1, 1, 1, 1, 1,
0.09838536, 1.340221, -0.7402513, 1, 1, 1, 1, 1,
0.1009049, -0.5025122, 3.129098, 1, 1, 1, 1, 1,
0.1018153, -2.055357, 2.385402, 1, 1, 1, 1, 1,
0.1054495, 2.417557, -0.2937728, 1, 1, 1, 1, 1,
0.1058232, -1.042431, 3.266003, 1, 1, 1, 1, 1,
0.107269, -2.315673, 3.378042, 1, 1, 1, 1, 1,
0.1176366, 0.5672853, -1.857921, 1, 1, 1, 1, 1,
0.1195149, -0.4735164, 2.287131, 1, 1, 1, 1, 1,
0.1218616, 0.03729817, -0.1474291, 1, 1, 1, 1, 1,
0.1265329, -0.3661084, 2.240334, 1, 1, 1, 1, 1,
0.1281904, -0.01345633, 2.170965, 1, 1, 1, 1, 1,
0.1283824, -1.204806, 1.807032, 0, 0, 1, 1, 1,
0.1303028, 0.9905409, -0.1388128, 1, 0, 0, 1, 1,
0.136707, -0.5889758, 3.082587, 1, 0, 0, 1, 1,
0.1368947, 0.2973857, 0.03114671, 1, 0, 0, 1, 1,
0.1380116, 0.8472922, -0.312233, 1, 0, 0, 1, 1,
0.1440703, 0.7453619, -1.84073, 1, 0, 0, 1, 1,
0.1455598, -0.2863538, 1.8403, 0, 0, 0, 1, 1,
0.1461994, -0.2334611, 1.966486, 0, 0, 0, 1, 1,
0.1475486, -1.120258, 1.857143, 0, 0, 0, 1, 1,
0.1506577, 0.5240529, 1.516398, 0, 0, 0, 1, 1,
0.15111, -0.02955205, 2.089371, 0, 0, 0, 1, 1,
0.1574203, -0.6005836, 1.296458, 0, 0, 0, 1, 1,
0.165149, 0.4337102, 0.5330062, 0, 0, 0, 1, 1,
0.1675777, -0.23437, 2.093762, 1, 1, 1, 1, 1,
0.1686604, -2.285794, 3.82292, 1, 1, 1, 1, 1,
0.1697092, 1.235979, -1.642226, 1, 1, 1, 1, 1,
0.1700405, -0.0004034207, 1.083186, 1, 1, 1, 1, 1,
0.177045, 1.67399, 0.3009175, 1, 1, 1, 1, 1,
0.1781, 0.1499254, 0.8442327, 1, 1, 1, 1, 1,
0.1825514, -1.433683, 2.636981, 1, 1, 1, 1, 1,
0.1826447, -1.400485, 2.639455, 1, 1, 1, 1, 1,
0.1867083, 0.7364734, -0.3282152, 1, 1, 1, 1, 1,
0.1890132, -1.343634, 3.806751, 1, 1, 1, 1, 1,
0.1918389, -0.9225481, 3.883124, 1, 1, 1, 1, 1,
0.1949774, -0.3458016, 3.455277, 1, 1, 1, 1, 1,
0.2013995, -0.1172978, 1.199521, 1, 1, 1, 1, 1,
0.2034741, -1.14237, 3.638059, 1, 1, 1, 1, 1,
0.2048642, 0.2840797, 0.02756864, 1, 1, 1, 1, 1,
0.2054935, 1.022927, 0.2842863, 0, 0, 1, 1, 1,
0.2064977, -0.5845933, 2.587791, 1, 0, 0, 1, 1,
0.2065958, 0.5395293, 0.06127575, 1, 0, 0, 1, 1,
0.2087688, 1.154105, 1.032422, 1, 0, 0, 1, 1,
0.2089216, 0.3929281, 0.4376724, 1, 0, 0, 1, 1,
0.2098182, 0.9379856, -2.546407, 1, 0, 0, 1, 1,
0.2118051, 0.0784763, 1.099578, 0, 0, 0, 1, 1,
0.2164426, -0.9036737, 3.367135, 0, 0, 0, 1, 1,
0.2235523, -0.1122628, 0.3631114, 0, 0, 0, 1, 1,
0.2256552, 1.410304, -0.674074, 0, 0, 0, 1, 1,
0.2262741, -0.03920137, 0.5453774, 0, 0, 0, 1, 1,
0.2310075, 0.4089764, 0.949643, 0, 0, 0, 1, 1,
0.2319082, -0.04719586, 1.561255, 0, 0, 0, 1, 1,
0.2330053, 0.2529776, -0.9763671, 1, 1, 1, 1, 1,
0.2348932, 0.3692154, 0.2510294, 1, 1, 1, 1, 1,
0.2401647, -0.9925988, 3.222021, 1, 1, 1, 1, 1,
0.2448748, -1.489905, 3.389541, 1, 1, 1, 1, 1,
0.2464044, 0.4261375, 1.589418, 1, 1, 1, 1, 1,
0.248177, -1.788518, 1.543497, 1, 1, 1, 1, 1,
0.2532025, 1.911739, 0.8071075, 1, 1, 1, 1, 1,
0.2556736, -2.661947, 2.380353, 1, 1, 1, 1, 1,
0.2570701, -0.2490662, 1.255097, 1, 1, 1, 1, 1,
0.2583714, -1.189745, 4.07521, 1, 1, 1, 1, 1,
0.2596037, 0.3349157, 0.5357972, 1, 1, 1, 1, 1,
0.2632794, 0.8949109, 1.594347, 1, 1, 1, 1, 1,
0.2656372, 0.8350538, -0.8586649, 1, 1, 1, 1, 1,
0.2729445, -1.324275, 2.614561, 1, 1, 1, 1, 1,
0.275533, 1.376566, 0.7677345, 1, 1, 1, 1, 1,
0.2761494, 0.2130769, -0.3909614, 0, 0, 1, 1, 1,
0.2776429, -0.3477507, 1.665519, 1, 0, 0, 1, 1,
0.2777973, 0.05505768, 1.956444, 1, 0, 0, 1, 1,
0.2792678, -0.6407954, 1.858825, 1, 0, 0, 1, 1,
0.2798911, 1.782251, 3.123148, 1, 0, 0, 1, 1,
0.2807776, 0.9681659, 0.1363774, 1, 0, 0, 1, 1,
0.2813113, 1.073087, 0.0885444, 0, 0, 0, 1, 1,
0.2833208, -0.327419, 1.481866, 0, 0, 0, 1, 1,
0.2835101, 0.6663313, -1.659347, 0, 0, 0, 1, 1,
0.2840526, 0.4071755, 0.409169, 0, 0, 0, 1, 1,
0.2898937, -0.7082349, 2.696216, 0, 0, 0, 1, 1,
0.2919593, 0.4352717, 0.9424334, 0, 0, 0, 1, 1,
0.2944148, 1.944708, 0.29176, 0, 0, 0, 1, 1,
0.298114, 0.917673, -0.06006664, 1, 1, 1, 1, 1,
0.3009758, -0.7949712, 1.484099, 1, 1, 1, 1, 1,
0.3028511, -1.787988, 2.817394, 1, 1, 1, 1, 1,
0.3075238, 0.09560791, 1.237047, 1, 1, 1, 1, 1,
0.3116898, -0.804433, 4.148087, 1, 1, 1, 1, 1,
0.3122043, -0.02115152, 0.5189397, 1, 1, 1, 1, 1,
0.3123005, 1.297089, 0.4179439, 1, 1, 1, 1, 1,
0.3175048, 1.918841, -0.1206584, 1, 1, 1, 1, 1,
0.3184722, -1.508342, 2.917802, 1, 1, 1, 1, 1,
0.3190593, 0.5105305, 0.9351814, 1, 1, 1, 1, 1,
0.3192211, 0.875261, -0.6397813, 1, 1, 1, 1, 1,
0.3209726, 1.930103, -1.083314, 1, 1, 1, 1, 1,
0.325579, 0.3015147, 0.1589054, 1, 1, 1, 1, 1,
0.3311645, 1.768252, 2.31289, 1, 1, 1, 1, 1,
0.3335459, 0.7853904, 1.814317, 1, 1, 1, 1, 1,
0.33586, 0.1598533, 2.125331, 0, 0, 1, 1, 1,
0.3384012, -0.9593597, 2.682154, 1, 0, 0, 1, 1,
0.341841, 0.8716155, -1.125008, 1, 0, 0, 1, 1,
0.3469123, 0.4983178, 0.5326095, 1, 0, 0, 1, 1,
0.3498835, 2.229669, 2.320597, 1, 0, 0, 1, 1,
0.3501018, -3.070325, 3.588826, 1, 0, 0, 1, 1,
0.3602535, -0.07438722, 3.341163, 0, 0, 0, 1, 1,
0.3616666, 0.4175913, 1.375152, 0, 0, 0, 1, 1,
0.3620753, 1.12733, -0.02831709, 0, 0, 0, 1, 1,
0.3641717, -0.2095792, 3.428174, 0, 0, 0, 1, 1,
0.3665869, -0.7460509, 3.177596, 0, 0, 0, 1, 1,
0.373704, 0.2921562, -0.24423, 0, 0, 0, 1, 1,
0.3752133, -0.7343243, 3.097195, 0, 0, 0, 1, 1,
0.3754726, 0.5713215, -0.7238896, 1, 1, 1, 1, 1,
0.3791967, 1.254814, 1.257033, 1, 1, 1, 1, 1,
0.3829626, -0.4663986, 4.269074, 1, 1, 1, 1, 1,
0.3844875, -0.51026, 1.950753, 1, 1, 1, 1, 1,
0.3880966, 0.7520239, 0.9763613, 1, 1, 1, 1, 1,
0.3928143, -1.958843, 1.73312, 1, 1, 1, 1, 1,
0.3957617, 0.513102, 2.784699, 1, 1, 1, 1, 1,
0.3973581, -1.510882, 5.004706, 1, 1, 1, 1, 1,
0.3995469, 0.8426607, -0.00489962, 1, 1, 1, 1, 1,
0.4033532, 1.512093, -0.4973167, 1, 1, 1, 1, 1,
0.4047089, 0.08204357, 0.5877907, 1, 1, 1, 1, 1,
0.4110589, -1.75344, 2.558865, 1, 1, 1, 1, 1,
0.4155665, 0.523112, -0.6126909, 1, 1, 1, 1, 1,
0.4161782, -1.984874, 2.023531, 1, 1, 1, 1, 1,
0.4185511, -0.1077162, 1.59798, 1, 1, 1, 1, 1,
0.4185814, -1.385449, 3.452547, 0, 0, 1, 1, 1,
0.4207312, 0.4967766, 0.6868958, 1, 0, 0, 1, 1,
0.4257439, -0.853466, 3.362941, 1, 0, 0, 1, 1,
0.4276913, 0.4410322, 1.371174, 1, 0, 0, 1, 1,
0.4318807, -0.0951319, 2.682803, 1, 0, 0, 1, 1,
0.4338568, -0.07008877, 2.603861, 1, 0, 0, 1, 1,
0.4340564, 0.2409734, 0.958901, 0, 0, 0, 1, 1,
0.4377052, 0.8331351, -0.5818219, 0, 0, 0, 1, 1,
0.4427844, 0.7703736, 1.552826, 0, 0, 0, 1, 1,
0.4429053, 1.808715, 0.3753775, 0, 0, 0, 1, 1,
0.4449288, 0.456868, 2.945759, 0, 0, 0, 1, 1,
0.4466875, 0.9682387, 0.5152416, 0, 0, 0, 1, 1,
0.4479284, 1.788286, 2.167336, 0, 0, 0, 1, 1,
0.4520926, 0.05897547, 1.874153, 1, 1, 1, 1, 1,
0.4547288, 1.776173, -1.244117, 1, 1, 1, 1, 1,
0.4558422, -0.6491238, 3.468443, 1, 1, 1, 1, 1,
0.4576887, 0.1564562, 2.737931, 1, 1, 1, 1, 1,
0.4606737, 0.414316, -0.07772441, 1, 1, 1, 1, 1,
0.4610879, -0.4499597, 3.172079, 1, 1, 1, 1, 1,
0.4619664, 0.2204527, 1.325362, 1, 1, 1, 1, 1,
0.4630922, -0.06820159, 2.182835, 1, 1, 1, 1, 1,
0.466563, -0.08693183, 1.02219, 1, 1, 1, 1, 1,
0.4686248, 0.4858674, 0.8020681, 1, 1, 1, 1, 1,
0.469191, 0.2435215, 1.389402, 1, 1, 1, 1, 1,
0.4696937, 1.343605, -0.9290153, 1, 1, 1, 1, 1,
0.471231, -0.05977336, 0.4283708, 1, 1, 1, 1, 1,
0.4742967, -0.1372987, 2.052398, 1, 1, 1, 1, 1,
0.4745497, -1.249396, 2.691653, 1, 1, 1, 1, 1,
0.4760503, -0.02176271, 0.5174116, 0, 0, 1, 1, 1,
0.477747, 1.021006, -2.529315, 1, 0, 0, 1, 1,
0.4788173, 1.693865, 0.1089227, 1, 0, 0, 1, 1,
0.4809534, 0.4523954, 0.4842432, 1, 0, 0, 1, 1,
0.4824144, 2.10927, -0.03441581, 1, 0, 0, 1, 1,
0.4854633, 0.1334533, 0.5810956, 1, 0, 0, 1, 1,
0.4874672, 0.5111269, 0.2701532, 0, 0, 0, 1, 1,
0.4899269, -2.437557, 1.435573, 0, 0, 0, 1, 1,
0.4915948, 0.4668534, 0.1076522, 0, 0, 0, 1, 1,
0.4923553, -2.129721, 2.73279, 0, 0, 0, 1, 1,
0.4960616, 1.168517, 1.092262, 0, 0, 0, 1, 1,
0.4969393, 1.033681, 2.34779, 0, 0, 0, 1, 1,
0.4990763, 1.35675, 0.4937522, 0, 0, 0, 1, 1,
0.5022973, -0.7688736, 1.006359, 1, 1, 1, 1, 1,
0.5072927, 0.1626945, 3.162395, 1, 1, 1, 1, 1,
0.5156538, 2.831434, -0.6115538, 1, 1, 1, 1, 1,
0.5159304, 0.2799067, 0.9674416, 1, 1, 1, 1, 1,
0.5185409, 0.634923, 2.04458, 1, 1, 1, 1, 1,
0.5188599, 1.055242, 1.07117, 1, 1, 1, 1, 1,
0.5191732, -1.244888, 1.639008, 1, 1, 1, 1, 1,
0.5271246, 2.126521, 2.318438, 1, 1, 1, 1, 1,
0.5299129, 0.09398533, 2.74477, 1, 1, 1, 1, 1,
0.5326267, -0.8212686, 2.92538, 1, 1, 1, 1, 1,
0.5358851, -0.3459795, 1.377413, 1, 1, 1, 1, 1,
0.5435443, 0.6425224, -2.091383, 1, 1, 1, 1, 1,
0.5440688, 0.09231351, 0.7409892, 1, 1, 1, 1, 1,
0.544327, 0.4288116, 1.258088, 1, 1, 1, 1, 1,
0.5445991, 0.1539861, 0.478197, 1, 1, 1, 1, 1,
0.549518, -0.2973091, 1.616503, 0, 0, 1, 1, 1,
0.5503181, 1.362107, 0.1810212, 1, 0, 0, 1, 1,
0.5530951, -0.5216967, 1.814836, 1, 0, 0, 1, 1,
0.5560439, -0.04606874, 1.598459, 1, 0, 0, 1, 1,
0.5583185, 1.007755, -1.276102, 1, 0, 0, 1, 1,
0.5595677, -0.3218878, 2.931127, 1, 0, 0, 1, 1,
0.5623854, -0.09034497, 0.00321026, 0, 0, 0, 1, 1,
0.5660812, 2.688474, 0.8427209, 0, 0, 0, 1, 1,
0.5662772, -0.4100864, 2.471525, 0, 0, 0, 1, 1,
0.5667399, 1.497093, -0.2811836, 0, 0, 0, 1, 1,
0.5683025, 0.7195216, 0.8672304, 0, 0, 0, 1, 1,
0.5693348, -0.01101036, 2.745353, 0, 0, 0, 1, 1,
0.5713806, -0.5164552, 1.53116, 0, 0, 0, 1, 1,
0.5731389, -0.2696738, 3.349336, 1, 1, 1, 1, 1,
0.5793551, -1.591588, 2.482409, 1, 1, 1, 1, 1,
0.5803665, 0.5061879, 1.120508, 1, 1, 1, 1, 1,
0.5809373, -0.8882375, 3.179015, 1, 1, 1, 1, 1,
0.5876335, -0.1919951, 3.189286, 1, 1, 1, 1, 1,
0.5885383, -0.183327, 1.897436, 1, 1, 1, 1, 1,
0.5896589, 1.037364, 0.3194377, 1, 1, 1, 1, 1,
0.5929538, 0.04115645, -0.7992709, 1, 1, 1, 1, 1,
0.5937933, -0.4968188, 1.456268, 1, 1, 1, 1, 1,
0.6014847, -1.197985, 3.420605, 1, 1, 1, 1, 1,
0.6018472, -2.251936, 1.080675, 1, 1, 1, 1, 1,
0.608835, 0.2580697, 0.6077321, 1, 1, 1, 1, 1,
0.6093321, 1.880493, 0.8973311, 1, 1, 1, 1, 1,
0.6096523, 1.906857, 1.252552, 1, 1, 1, 1, 1,
0.6157919, 0.4641719, 0.5653367, 1, 1, 1, 1, 1,
0.6201408, -0.2086, 1.303026, 0, 0, 1, 1, 1,
0.6335018, 1.141176, -1.110181, 1, 0, 0, 1, 1,
0.6390808, 0.1252594, 2.312323, 1, 0, 0, 1, 1,
0.6464686, 1.506035, -1.546747, 1, 0, 0, 1, 1,
0.6464928, 0.3537821, 1.017172, 1, 0, 0, 1, 1,
0.6470246, -0.6840916, 3.739992, 1, 0, 0, 1, 1,
0.6489031, -0.2960121, 1.194821, 0, 0, 0, 1, 1,
0.6524614, 0.4095582, 0.8558817, 0, 0, 0, 1, 1,
0.6539278, -0.3862127, 1.343615, 0, 0, 0, 1, 1,
0.6545233, 0.3519883, -0.07213247, 0, 0, 0, 1, 1,
0.656793, 0.9666395, 1.260575, 0, 0, 0, 1, 1,
0.6594826, -0.6310404, 3.761067, 0, 0, 0, 1, 1,
0.6608175, -0.8151463, 1.177802, 0, 0, 0, 1, 1,
0.6695702, -0.2506425, 3.550503, 1, 1, 1, 1, 1,
0.6758403, -0.8878812, 1.970821, 1, 1, 1, 1, 1,
0.6796222, -0.4948404, 3.230879, 1, 1, 1, 1, 1,
0.6822908, -0.5606413, 2.362031, 1, 1, 1, 1, 1,
0.6825348, -1.255988, 4.255562, 1, 1, 1, 1, 1,
0.683104, 0.8718001, 0.5120389, 1, 1, 1, 1, 1,
0.6846738, 1.079952, 0.3984095, 1, 1, 1, 1, 1,
0.6857237, -0.8465794, 5.59907, 1, 1, 1, 1, 1,
0.6866721, -0.3785697, 2.306584, 1, 1, 1, 1, 1,
0.6868944, 0.431932, -0.2091208, 1, 1, 1, 1, 1,
0.6927498, -0.2296979, 2.762042, 1, 1, 1, 1, 1,
0.6935673, 0.04232636, 1.850027, 1, 1, 1, 1, 1,
0.7035563, -0.3675841, 1.890482, 1, 1, 1, 1, 1,
0.7072216, 0.4393184, 1.893353, 1, 1, 1, 1, 1,
0.7137396, 2.576107, -0.9906945, 1, 1, 1, 1, 1,
0.721711, -1.46271, 1.37139, 0, 0, 1, 1, 1,
0.7247168, 0.1038627, 2.035446, 1, 0, 0, 1, 1,
0.7286933, -0.9644783, 2.775336, 1, 0, 0, 1, 1,
0.7309326, -0.9961665, 3.168204, 1, 0, 0, 1, 1,
0.7372538, 0.1806534, 1.3853, 1, 0, 0, 1, 1,
0.7382717, -0.9789759, 2.133206, 1, 0, 0, 1, 1,
0.7582593, 1.56369, 1.665133, 0, 0, 0, 1, 1,
0.7597535, 0.1280935, 0.07168888, 0, 0, 0, 1, 1,
0.7640581, -0.4761259, 1.830409, 0, 0, 0, 1, 1,
0.7727801, 1.457847, 0.2034841, 0, 0, 0, 1, 1,
0.7742708, 0.6386846, -0.3176339, 0, 0, 0, 1, 1,
0.7851767, 0.7890984, -1.08768, 0, 0, 0, 1, 1,
0.7863708, 0.913432, 1.153851, 0, 0, 0, 1, 1,
0.7880545, -1.160936, 3.193488, 1, 1, 1, 1, 1,
0.7931509, -0.8888182, 1.599469, 1, 1, 1, 1, 1,
0.7934173, -0.2104889, 0.4612793, 1, 1, 1, 1, 1,
0.8036152, -0.164425, 0.09677699, 1, 1, 1, 1, 1,
0.8114014, -0.7491556, 3.880812, 1, 1, 1, 1, 1,
0.8135406, -0.2261521, 2.397314, 1, 1, 1, 1, 1,
0.8259825, -0.1794837, 0.7993953, 1, 1, 1, 1, 1,
0.8274617, -0.9504786, 2.64926, 1, 1, 1, 1, 1,
0.8279401, 0.5747671, 1.351366, 1, 1, 1, 1, 1,
0.829536, -0.7173365, 3.283485, 1, 1, 1, 1, 1,
0.8373299, 0.1836868, 3.604397, 1, 1, 1, 1, 1,
0.8383991, 0.4752111, 1.048234, 1, 1, 1, 1, 1,
0.8384752, -0.2607039, 0.3802398, 1, 1, 1, 1, 1,
0.8408098, 1.779013, 0.1642194, 1, 1, 1, 1, 1,
0.8421649, 0.02498433, -0.02874043, 1, 1, 1, 1, 1,
0.8541434, 0.02487596, 2.781249, 0, 0, 1, 1, 1,
0.8548645, 1.230946, 0.7727173, 1, 0, 0, 1, 1,
0.8553375, -0.4659835, 2.83398, 1, 0, 0, 1, 1,
0.8641033, -0.2952055, 1.072192, 1, 0, 0, 1, 1,
0.8646284, -1.250931, 3.001824, 1, 0, 0, 1, 1,
0.8667148, -0.350155, 1.747888, 1, 0, 0, 1, 1,
0.8715185, -0.6864373, 2.28592, 0, 0, 0, 1, 1,
0.8727721, 1.024354, 0.6440815, 0, 0, 0, 1, 1,
0.8741381, 0.7539941, 0.7566377, 0, 0, 0, 1, 1,
0.8748397, 0.1925147, 1.80468, 0, 0, 0, 1, 1,
0.8803701, -0.4767298, 2.161155, 0, 0, 0, 1, 1,
0.883818, -1.139639, 2.539263, 0, 0, 0, 1, 1,
0.8898989, 1.087446, 1.36814, 0, 0, 0, 1, 1,
0.8913104, 1.191256, 1.53826, 1, 1, 1, 1, 1,
0.8946739, 0.7977642, -0.9542339, 1, 1, 1, 1, 1,
0.9110842, -0.9423152, 2.070771, 1, 1, 1, 1, 1,
0.9194645, 0.7521787, -0.242802, 1, 1, 1, 1, 1,
0.9202934, -1.149739, 2.614616, 1, 1, 1, 1, 1,
0.9214227, -0.3111979, 0.9054685, 1, 1, 1, 1, 1,
0.922245, 0.1449552, 1.89727, 1, 1, 1, 1, 1,
0.9228099, -0.6947944, 2.84313, 1, 1, 1, 1, 1,
0.9284132, 1.146094, 1.645251, 1, 1, 1, 1, 1,
0.9289824, 0.9734861, 1.865791, 1, 1, 1, 1, 1,
0.9364046, -1.714493, 3.506622, 1, 1, 1, 1, 1,
0.9394812, 0.2574683, 2.088331, 1, 1, 1, 1, 1,
0.9400479, 2.099622, 0.4226439, 1, 1, 1, 1, 1,
0.9402463, -0.002976692, -0.203592, 1, 1, 1, 1, 1,
0.9413444, -1.178258, 2.488638, 1, 1, 1, 1, 1,
0.9415767, 0.8765159, 1.053176, 0, 0, 1, 1, 1,
0.9430616, -0.2357763, 2.395156, 1, 0, 0, 1, 1,
0.9437365, 0.7302104, 0.01760731, 1, 0, 0, 1, 1,
0.9480882, 2.205814, 0.0313582, 1, 0, 0, 1, 1,
0.9503874, -0.7771978, 1.918566, 1, 0, 0, 1, 1,
0.9523719, -1.609423, 1.69666, 1, 0, 0, 1, 1,
0.9539933, -0.7972472, 3.10676, 0, 0, 0, 1, 1,
0.9557383, -0.3986079, 0.5207382, 0, 0, 0, 1, 1,
0.9578109, 1.116137, 2.166513, 0, 0, 0, 1, 1,
0.9596271, 1.252446, 0.7664524, 0, 0, 0, 1, 1,
0.9630956, -0.7638765, 1.550625, 0, 0, 0, 1, 1,
0.9650547, -0.7377636, 3.035445, 0, 0, 0, 1, 1,
0.9650618, -0.2902622, 1.261689, 0, 0, 0, 1, 1,
0.979165, -1.196109, 3.190069, 1, 1, 1, 1, 1,
0.9802914, 1.19836, -0.4678785, 1, 1, 1, 1, 1,
0.9809018, 2.057385, 1.837247, 1, 1, 1, 1, 1,
0.9831429, 0.05886083, 1.234161, 1, 1, 1, 1, 1,
0.9835284, -0.5484924, 1.513869, 1, 1, 1, 1, 1,
0.9840019, 0.439541, 0.7315379, 1, 1, 1, 1, 1,
0.9841908, -0.06779527, -0.1903712, 1, 1, 1, 1, 1,
0.9909297, 0.9652987, -0.2298306, 1, 1, 1, 1, 1,
0.99288, 0.5765663, -1.395039, 1, 1, 1, 1, 1,
0.9982656, 0.04405676, 2.619622, 1, 1, 1, 1, 1,
1.001302, -0.9725068, 2.638257, 1, 1, 1, 1, 1,
1.002786, 1.222746, 0.7200891, 1, 1, 1, 1, 1,
1.009057, 1.321305, 0.7362445, 1, 1, 1, 1, 1,
1.01175, 0.5040275, 1.119726, 1, 1, 1, 1, 1,
1.02036, 0.5285931, 1.429736, 1, 1, 1, 1, 1,
1.021749, 0.6161026, 1.523522, 0, 0, 1, 1, 1,
1.025298, 3.621519, 0.8699579, 1, 0, 0, 1, 1,
1.02804, -0.2150974, 1.689508, 1, 0, 0, 1, 1,
1.028215, 1.070975, 0.4262914, 1, 0, 0, 1, 1,
1.037472, -0.762279, 3.602098, 1, 0, 0, 1, 1,
1.042561, -1.153461, 1.874062, 1, 0, 0, 1, 1,
1.042896, -0.2883662, 2.077325, 0, 0, 0, 1, 1,
1.04443, -0.3476588, 2.444888, 0, 0, 0, 1, 1,
1.053402, 0.6431802, 0.02205462, 0, 0, 0, 1, 1,
1.055427, -0.4071187, 4.1396, 0, 0, 0, 1, 1,
1.059855, 0.6197822, 1.432064, 0, 0, 0, 1, 1,
1.06106, -1.839017, 0.9774213, 0, 0, 0, 1, 1,
1.070534, -1.460343, 2.510646, 0, 0, 0, 1, 1,
1.080927, -0.9373875, 1.866588, 1, 1, 1, 1, 1,
1.083489, -0.8172525, 2.04887, 1, 1, 1, 1, 1,
1.084985, 1.728154, 1.647023, 1, 1, 1, 1, 1,
1.08887, 0.4663633, 0.8139822, 1, 1, 1, 1, 1,
1.091613, 0.3747003, 2.087899, 1, 1, 1, 1, 1,
1.093916, 0.2670235, 0.8472964, 1, 1, 1, 1, 1,
1.094999, 0.3272779, -0.3832301, 1, 1, 1, 1, 1,
1.095637, 0.7180488, -0.7599514, 1, 1, 1, 1, 1,
1.113204, -0.03843686, 3.99, 1, 1, 1, 1, 1,
1.118589, -1.189577, 3.111007, 1, 1, 1, 1, 1,
1.123833, 0.7709508, 2.185844, 1, 1, 1, 1, 1,
1.124516, -1.181103, 3.159603, 1, 1, 1, 1, 1,
1.127382, 0.1749571, 3.240669, 1, 1, 1, 1, 1,
1.128923, 0.1497354, 0.7438815, 1, 1, 1, 1, 1,
1.133068, 0.4318092, 1.050534, 1, 1, 1, 1, 1,
1.133336, 0.9884714, 0.07668143, 0, 0, 1, 1, 1,
1.134193, -0.7080424, 1.346432, 1, 0, 0, 1, 1,
1.134515, 0.2714903, -0.08569, 1, 0, 0, 1, 1,
1.153021, -1.377355, 4.104931, 1, 0, 0, 1, 1,
1.155203, 0.1797095, 0.03368573, 1, 0, 0, 1, 1,
1.166175, -0.6905306, 2.291777, 1, 0, 0, 1, 1,
1.175248, 0.4108664, 2.121483, 0, 0, 0, 1, 1,
1.176823, 0.3469789, 0.8097193, 0, 0, 0, 1, 1,
1.17996, -1.031164, 1.303564, 0, 0, 0, 1, 1,
1.180485, -1.557222, 1.772011, 0, 0, 0, 1, 1,
1.185132, 0.09174204, 1.277703, 0, 0, 0, 1, 1,
1.185259, 0.9742225, -0.1165827, 0, 0, 0, 1, 1,
1.190242, 0.01110584, 0.7350339, 0, 0, 0, 1, 1,
1.197791, 0.2815859, 0.9231909, 1, 1, 1, 1, 1,
1.201573, -2.396461, 4.609378, 1, 1, 1, 1, 1,
1.207829, -0.6869976, 3.923071, 1, 1, 1, 1, 1,
1.208974, -0.5082794, 2.464765, 1, 1, 1, 1, 1,
1.221497, 1.476391, -1.140677, 1, 1, 1, 1, 1,
1.224941, -1.836106, 3.779399, 1, 1, 1, 1, 1,
1.227421, 0.5130887, -0.4765124, 1, 1, 1, 1, 1,
1.242564, -0.7139637, 1.59851, 1, 1, 1, 1, 1,
1.243545, -0.5009608, 2.368538, 1, 1, 1, 1, 1,
1.246452, -0.473123, 0.8845235, 1, 1, 1, 1, 1,
1.249311, -0.9074009, 2.615791, 1, 1, 1, 1, 1,
1.271466, -0.1915352, 1.735525, 1, 1, 1, 1, 1,
1.275275, -1.639313, 2.506176, 1, 1, 1, 1, 1,
1.275845, -0.05178546, 1.325753, 1, 1, 1, 1, 1,
1.286105, 1.954181, 0.5317392, 1, 1, 1, 1, 1,
1.299618, -1.317742, 2.231613, 0, 0, 1, 1, 1,
1.301033, 1.552368, -0.748836, 1, 0, 0, 1, 1,
1.303876, 0.2184078, 2.108004, 1, 0, 0, 1, 1,
1.305148, -0.4582221, 0.3380483, 1, 0, 0, 1, 1,
1.320918, 0.4808126, 1.355809, 1, 0, 0, 1, 1,
1.321124, -0.1292278, 1.055727, 1, 0, 0, 1, 1,
1.32643, 0.08317045, 1.668202, 0, 0, 0, 1, 1,
1.32769, -0.9794552, 3.175397, 0, 0, 0, 1, 1,
1.339032, 0.1764267, 0.01034701, 0, 0, 0, 1, 1,
1.344704, 1.268324, 1.572598, 0, 0, 0, 1, 1,
1.345872, 1.290349, 0.299543, 0, 0, 0, 1, 1,
1.359427, -0.8528499, 1.11266, 0, 0, 0, 1, 1,
1.361857, -0.9062154, 2.549171, 0, 0, 0, 1, 1,
1.365113, -0.5850791, 3.275927, 1, 1, 1, 1, 1,
1.365582, -1.867917, 2.956061, 1, 1, 1, 1, 1,
1.370517, 1.978244, -0.1704066, 1, 1, 1, 1, 1,
1.378802, -1.700452, 2.199129, 1, 1, 1, 1, 1,
1.388453, -1.679638, 1.861517, 1, 1, 1, 1, 1,
1.402835, 0.294707, 0.584386, 1, 1, 1, 1, 1,
1.420601, -0.695146, 2.32658, 1, 1, 1, 1, 1,
1.421291, -1.920228, 3.141799, 1, 1, 1, 1, 1,
1.424651, -0.7104079, 0.7317998, 1, 1, 1, 1, 1,
1.431612, -0.8920975, 1.208564, 1, 1, 1, 1, 1,
1.433335, 1.970025, 0.7406644, 1, 1, 1, 1, 1,
1.437489, 0.7549924, 3.260064, 1, 1, 1, 1, 1,
1.451972, 0.9710587, 2.467762, 1, 1, 1, 1, 1,
1.452869, -1.124761, 1.30065, 1, 1, 1, 1, 1,
1.462062, 0.8538924, -0.3029326, 1, 1, 1, 1, 1,
1.462113, -0.4427814, 2.134825, 0, 0, 1, 1, 1,
1.466247, 0.4633685, 0.4195321, 1, 0, 0, 1, 1,
1.467116, 2.043326, 0.1585458, 1, 0, 0, 1, 1,
1.475132, -1.266828, 4.468818, 1, 0, 0, 1, 1,
1.475509, 1.437623, 0.06206301, 1, 0, 0, 1, 1,
1.489691, 1.063814, 1.676052, 1, 0, 0, 1, 1,
1.50429, -1.409887, 1.737728, 0, 0, 0, 1, 1,
1.516271, 1.079772, 1.390588, 0, 0, 0, 1, 1,
1.518972, -2.084878, 3.983754, 0, 0, 0, 1, 1,
1.524977, 0.6726919, -1.297046, 0, 0, 0, 1, 1,
1.529958, -0.3747598, 0.2615607, 0, 0, 0, 1, 1,
1.538562, 0.0581494, 0.1807461, 0, 0, 0, 1, 1,
1.559293, 0.322893, 0.2305545, 0, 0, 0, 1, 1,
1.574413, 0.1619888, 2.007087, 1, 1, 1, 1, 1,
1.576166, -0.5506231, -0.3495988, 1, 1, 1, 1, 1,
1.576968, 1.331118, -0.003853267, 1, 1, 1, 1, 1,
1.578232, -0.004932482, 0.4534369, 1, 1, 1, 1, 1,
1.58393, 0.9572186, 0.4385116, 1, 1, 1, 1, 1,
1.591369, 0.1437734, 2.027754, 1, 1, 1, 1, 1,
1.616714, 0.0363689, 4.132625, 1, 1, 1, 1, 1,
1.62754, 1.273144, 1.107384, 1, 1, 1, 1, 1,
1.635969, -0.8466858, 2.311962, 1, 1, 1, 1, 1,
1.636317, 0.09125306, 0.8668108, 1, 1, 1, 1, 1,
1.646827, -1.688486, 2.210132, 1, 1, 1, 1, 1,
1.648741, -0.5023457, 0.1419257, 1, 1, 1, 1, 1,
1.66159, -0.1886159, 3.121908, 1, 1, 1, 1, 1,
1.67162, -0.2096738, 2.532048, 1, 1, 1, 1, 1,
1.67864, -1.210051, 1.558054, 1, 1, 1, 1, 1,
1.683062, 3.250309, 0.4772449, 0, 0, 1, 1, 1,
1.704075, -0.8140842, 1.964595, 1, 0, 0, 1, 1,
1.704166, 1.920072, 0.3294176, 1, 0, 0, 1, 1,
1.712679, 0.8215145, 1.100085, 1, 0, 0, 1, 1,
1.720564, 0.2736019, 1.586247, 1, 0, 0, 1, 1,
1.75201, -0.4795403, 1.259092, 1, 0, 0, 1, 1,
1.767397, -0.1236235, 0.8216547, 0, 0, 0, 1, 1,
1.787976, 1.07685, 1.39187, 0, 0, 0, 1, 1,
1.791323, -0.2651149, 1.644965, 0, 0, 0, 1, 1,
1.79274, 0.5387003, 2.363181, 0, 0, 0, 1, 1,
1.803406, -0.538785, 1.319398, 0, 0, 0, 1, 1,
1.833114, -0.9290354, 0.6423323, 0, 0, 0, 1, 1,
1.853352, 1.142552, 2.016716, 0, 0, 0, 1, 1,
1.861432, -1.098024, 0.154803, 1, 1, 1, 1, 1,
1.879033, -0.8681341, 1.650558, 1, 1, 1, 1, 1,
1.883433, -0.6585759, 2.898764, 1, 1, 1, 1, 1,
1.892178, 0.7732776, 0.8268777, 1, 1, 1, 1, 1,
1.893874, -0.1923724, 0.3816462, 1, 1, 1, 1, 1,
1.896176, -0.437648, 1.051574, 1, 1, 1, 1, 1,
1.913961, 0.2949829, 1.146445, 1, 1, 1, 1, 1,
1.934685, 1.307064, -0.4275841, 1, 1, 1, 1, 1,
1.965794, -0.3266253, 3.205271, 1, 1, 1, 1, 1,
1.979216, -1.219591, 2.470176, 1, 1, 1, 1, 1,
1.988325, -0.319719, 2.569452, 1, 1, 1, 1, 1,
2.026314, 0.610034, 1.434109, 1, 1, 1, 1, 1,
2.06046, 0.08575712, 2.679606, 1, 1, 1, 1, 1,
2.068072, 0.1817852, 2.686606, 1, 1, 1, 1, 1,
2.10289, 0.2860006, 1.978884, 1, 1, 1, 1, 1,
2.137577, -0.6359458, 1.576994, 0, 0, 1, 1, 1,
2.145864, 1.97876, 0.6888584, 1, 0, 0, 1, 1,
2.172045, -0.2765749, 2.605478, 1, 0, 0, 1, 1,
2.199429, -0.9018634, 4.140596, 1, 0, 0, 1, 1,
2.20405, -0.7421224, 1.80915, 1, 0, 0, 1, 1,
2.225552, -1.892381, 0.2345144, 1, 0, 0, 1, 1,
2.232299, -1.430524, 0.9014454, 0, 0, 0, 1, 1,
2.263609, -0.9227517, 1.984189, 0, 0, 0, 1, 1,
2.297462, -0.6227596, 1.169735, 0, 0, 0, 1, 1,
2.330073, 0.5358632, 1.619184, 0, 0, 0, 1, 1,
2.359663, -0.09031366, 0.9089627, 0, 0, 0, 1, 1,
2.403509, -1.698166, 1.1756, 0, 0, 0, 1, 1,
2.41926, -0.07563077, 2.925201, 0, 0, 0, 1, 1,
2.510543, 0.101278, 3.415655, 1, 1, 1, 1, 1,
2.524224, -0.6682661, 1.772153, 1, 1, 1, 1, 1,
2.605619, -1.516165, 0.9510201, 1, 1, 1, 1, 1,
2.771, -0.3396233, 1.70378, 1, 1, 1, 1, 1,
2.901479, 0.7334632, 1.50264, 1, 1, 1, 1, 1,
2.925534, 1.102704, 0.6871422, 1, 1, 1, 1, 1,
3.053218, 0.8609908, 2.995809, 1, 1, 1, 1, 1
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
var radius = 10.12145;
var distance = 35.55118;
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
mvMatrix.translate( 0.3991742, -0.2755966, 0.05881953 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.55118);
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
