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
-3.103568, 1.157269, -1.015062, 1, 0, 0, 1,
-2.899503, -1.925972, -2.139014, 1, 0.007843138, 0, 1,
-2.805853, 0.8427051, 0.00427069, 1, 0.01176471, 0, 1,
-2.728642, 0.1065216, -1.323528, 1, 0.01960784, 0, 1,
-2.709948, -1.859001, -2.532186, 1, 0.02352941, 0, 1,
-2.675948, 0.2329787, -0.9286383, 1, 0.03137255, 0, 1,
-2.491472, 1.058331, 0.7951713, 1, 0.03529412, 0, 1,
-2.487127, -0.05281497, -0.9277472, 1, 0.04313726, 0, 1,
-2.390217, -1.45516, -3.110004, 1, 0.04705882, 0, 1,
-2.376189, -2.09234, -3.408038, 1, 0.05490196, 0, 1,
-2.357579, 0.1412253, 0.5850811, 1, 0.05882353, 0, 1,
-2.28727, -0.3159557, -1.641623, 1, 0.06666667, 0, 1,
-2.188693, 0.5697361, -1.225528, 1, 0.07058824, 0, 1,
-2.187023, -0.4808769, -1.622887, 1, 0.07843138, 0, 1,
-2.182938, 1.073967, -1.715568, 1, 0.08235294, 0, 1,
-2.163658, -0.3421371, -1.213393, 1, 0.09019608, 0, 1,
-2.134451, 0.06223801, -0.9373509, 1, 0.09411765, 0, 1,
-2.130646, 0.3246109, -1.834143, 1, 0.1019608, 0, 1,
-2.057557, 0.04660577, -0.2318295, 1, 0.1098039, 0, 1,
-2.051265, -0.7934294, -3.500596, 1, 0.1137255, 0, 1,
-2.033257, 1.91081, -0.07134493, 1, 0.1215686, 0, 1,
-2.029786, 0.4961961, -1.657266, 1, 0.1254902, 0, 1,
-2.028399, -1.558574, -1.833236, 1, 0.1333333, 0, 1,
-2.000918, 3.035329, 2.334804, 1, 0.1372549, 0, 1,
-1.970111, -0.2224238, -0.7311381, 1, 0.145098, 0, 1,
-1.918837, 1.376136, -1.350681, 1, 0.1490196, 0, 1,
-1.876581, -0.6016225, -3.258122, 1, 0.1568628, 0, 1,
-1.868624, -0.401925, -1.88726, 1, 0.1607843, 0, 1,
-1.868541, 1.167296, -1.95115, 1, 0.1686275, 0, 1,
-1.852061, 1.660535, -3.178591, 1, 0.172549, 0, 1,
-1.851822, 0.9708009, -1.202242, 1, 0.1803922, 0, 1,
-1.832947, 0.1858102, -0.03741871, 1, 0.1843137, 0, 1,
-1.831573, 0.8309957, -1.000426, 1, 0.1921569, 0, 1,
-1.827328, -1.593972, -2.850565, 1, 0.1960784, 0, 1,
-1.81982, -0.4796779, -4.054363, 1, 0.2039216, 0, 1,
-1.813913, 0.4746306, -2.400538, 1, 0.2117647, 0, 1,
-1.811925, 0.2251723, -0.6161952, 1, 0.2156863, 0, 1,
-1.808708, -1.170455, -2.215242, 1, 0.2235294, 0, 1,
-1.781037, -1.12316, -3.685848, 1, 0.227451, 0, 1,
-1.774429, 0.2060326, -0.7004616, 1, 0.2352941, 0, 1,
-1.742992, -2.09686, -2.956724, 1, 0.2392157, 0, 1,
-1.715029, 1.439201, -0.2588188, 1, 0.2470588, 0, 1,
-1.710881, -0.301502, -1.835017, 1, 0.2509804, 0, 1,
-1.69669, 1.302085, -1.056064, 1, 0.2588235, 0, 1,
-1.68353, -0.3738801, -1.958669, 1, 0.2627451, 0, 1,
-1.682285, 0.5612125, -1.546789, 1, 0.2705882, 0, 1,
-1.676537, -0.6091708, -1.110837, 1, 0.2745098, 0, 1,
-1.674632, -0.9002627, -1.936326, 1, 0.282353, 0, 1,
-1.663392, -0.2828611, -1.918811, 1, 0.2862745, 0, 1,
-1.655673, 0.5147212, -0.9499046, 1, 0.2941177, 0, 1,
-1.630529, 0.4663429, -1.9509, 1, 0.3019608, 0, 1,
-1.62454, -0.3456216, -0.9670458, 1, 0.3058824, 0, 1,
-1.62345, 0.6112621, -1.154395, 1, 0.3137255, 0, 1,
-1.571593, 1.131089, 1.047289, 1, 0.3176471, 0, 1,
-1.564844, 0.1865878, -3.334124, 1, 0.3254902, 0, 1,
-1.552057, -0.4102422, -2.713541, 1, 0.3294118, 0, 1,
-1.537462, 1.899835, -1.052494, 1, 0.3372549, 0, 1,
-1.515431, 0.8409972, -1.781911, 1, 0.3411765, 0, 1,
-1.508799, 0.4924461, -2.081508, 1, 0.3490196, 0, 1,
-1.500626, 1.023112, -1.211363, 1, 0.3529412, 0, 1,
-1.490847, 0.5824081, -0.820278, 1, 0.3607843, 0, 1,
-1.477737, 1.160073, -1.35465, 1, 0.3647059, 0, 1,
-1.461382, 1.116992, -1.170272, 1, 0.372549, 0, 1,
-1.451866, 0.103157, 0.07091261, 1, 0.3764706, 0, 1,
-1.448286, 1.714594, -0.04692159, 1, 0.3843137, 0, 1,
-1.446434, 0.3780773, 0.4670088, 1, 0.3882353, 0, 1,
-1.431181, 1.665477, -2.091915, 1, 0.3960784, 0, 1,
-1.429992, 0.5048763, -1.026708, 1, 0.4039216, 0, 1,
-1.422592, -0.3756059, -0.9093853, 1, 0.4078431, 0, 1,
-1.421932, 1.929786, -1.453157, 1, 0.4156863, 0, 1,
-1.415691, 0.4904597, -2.315757, 1, 0.4196078, 0, 1,
-1.399498, -0.972639, -3.653528, 1, 0.427451, 0, 1,
-1.378115, 0.4717693, -2.261986, 1, 0.4313726, 0, 1,
-1.373328, -1.048334, -1.960177, 1, 0.4392157, 0, 1,
-1.364944, -0.8398745, -1.482586, 1, 0.4431373, 0, 1,
-1.363927, 0.449571, -3.494851, 1, 0.4509804, 0, 1,
-1.36188, 0.2774299, -1.605548, 1, 0.454902, 0, 1,
-1.357768, -0.5736257, -5.269922, 1, 0.4627451, 0, 1,
-1.355672, 1.010194, -0.3435247, 1, 0.4666667, 0, 1,
-1.348525, 1.023032, -0.7060787, 1, 0.4745098, 0, 1,
-1.346932, -0.1791911, -3.109129, 1, 0.4784314, 0, 1,
-1.345729, -1.029326, -2.975421, 1, 0.4862745, 0, 1,
-1.344768, 1.46366, -0.18818, 1, 0.4901961, 0, 1,
-1.338534, -1.246461, -1.370518, 1, 0.4980392, 0, 1,
-1.329656, -0.003894387, -1.452284, 1, 0.5058824, 0, 1,
-1.31484, -1.178196, -1.422938, 1, 0.509804, 0, 1,
-1.312109, 0.6762667, -0.6312506, 1, 0.5176471, 0, 1,
-1.308798, -0.8874618, -2.84557, 1, 0.5215687, 0, 1,
-1.298833, 0.8917917, -1.572107, 1, 0.5294118, 0, 1,
-1.297376, -0.02549694, -0.9094477, 1, 0.5333334, 0, 1,
-1.291587, -1.558661, -3.274547, 1, 0.5411765, 0, 1,
-1.288973, -0.4007921, -3.423529, 1, 0.5450981, 0, 1,
-1.275356, 0.7733665, -1.901876, 1, 0.5529412, 0, 1,
-1.274766, 0.895121, 0.6906841, 1, 0.5568628, 0, 1,
-1.272837, -0.9671025, -3.496304, 1, 0.5647059, 0, 1,
-1.272384, -0.3965414, -1.351385, 1, 0.5686275, 0, 1,
-1.271208, -1.371855, -2.030383, 1, 0.5764706, 0, 1,
-1.270391, -0.5104436, -2.392097, 1, 0.5803922, 0, 1,
-1.248121, -0.04724638, -1.637798, 1, 0.5882353, 0, 1,
-1.247338, -0.1461141, -1.799004, 1, 0.5921569, 0, 1,
-1.2407, 1.275425, 0.2151217, 1, 0.6, 0, 1,
-1.240285, 2.086706, -0.03828532, 1, 0.6078432, 0, 1,
-1.238909, 0.03112677, -1.965066, 1, 0.6117647, 0, 1,
-1.238158, 0.0902749, -0.1944312, 1, 0.6196079, 0, 1,
-1.235072, 0.1163525, -2.307779, 1, 0.6235294, 0, 1,
-1.233344, 0.05240209, 0.1724146, 1, 0.6313726, 0, 1,
-1.224761, -1.068837, -4.07736, 1, 0.6352941, 0, 1,
-1.221245, -1.693869, -3.511277, 1, 0.6431373, 0, 1,
-1.218668, 0.9486492, -0.3195355, 1, 0.6470588, 0, 1,
-1.209221, -2.358552, -2.829129, 1, 0.654902, 0, 1,
-1.206351, 0.4142555, -2.499614, 1, 0.6588235, 0, 1,
-1.200047, -1.600525, -2.706098, 1, 0.6666667, 0, 1,
-1.197682, 0.9679806, -0.01673529, 1, 0.6705883, 0, 1,
-1.196346, 0.2536362, -0.751175, 1, 0.6784314, 0, 1,
-1.188291, 0.02212442, -2.945882, 1, 0.682353, 0, 1,
-1.181336, 1.598205, -0.09562935, 1, 0.6901961, 0, 1,
-1.168575, 1.593557, 1.385694, 1, 0.6941177, 0, 1,
-1.155541, 3.021409, -1.022776, 1, 0.7019608, 0, 1,
-1.155393, -0.5790544, -0.8750693, 1, 0.7098039, 0, 1,
-1.148744, 0.7263013, 0.9839991, 1, 0.7137255, 0, 1,
-1.148596, 2.045787, 0.6316147, 1, 0.7215686, 0, 1,
-1.126334, 0.255933, -0.9584763, 1, 0.7254902, 0, 1,
-1.125519, -1.593468, -1.305602, 1, 0.7333333, 0, 1,
-1.122725, -2.070196, -3.916003, 1, 0.7372549, 0, 1,
-1.119433, 0.7681795, -0.5032093, 1, 0.7450981, 0, 1,
-1.111636, 1.335459, 0.6627464, 1, 0.7490196, 0, 1,
-1.097551, 2.016904, -1.499458, 1, 0.7568628, 0, 1,
-1.089364, -0.4488265, -1.917014, 1, 0.7607843, 0, 1,
-1.085331, 1.507579, -0.3118394, 1, 0.7686275, 0, 1,
-1.085204, -0.5634281, -2.573822, 1, 0.772549, 0, 1,
-1.080895, -0.5379085, -3.06603, 1, 0.7803922, 0, 1,
-1.075145, -1.532323, -2.525822, 1, 0.7843137, 0, 1,
-1.071968, -0.4303857, -0.5277555, 1, 0.7921569, 0, 1,
-1.06878, 0.06582119, -0.3276148, 1, 0.7960784, 0, 1,
-1.067884, -0.8249475, -1.763254, 1, 0.8039216, 0, 1,
-1.061932, -1.635226, -2.820918, 1, 0.8117647, 0, 1,
-1.054088, -0.7584887, -1.322544, 1, 0.8156863, 0, 1,
-1.039069, -0.02516978, -1.403123, 1, 0.8235294, 0, 1,
-1.038046, -0.09908973, -0.1907027, 1, 0.827451, 0, 1,
-1.034407, 0.8281276, -1.15397, 1, 0.8352941, 0, 1,
-1.029683, 1.267222, -2.648021, 1, 0.8392157, 0, 1,
-1.02492, 0.210306, -2.08013, 1, 0.8470588, 0, 1,
-1.017354, 0.981641, -0.2238613, 1, 0.8509804, 0, 1,
-1.013399, 0.2808607, -0.7332917, 1, 0.8588235, 0, 1,
-1.011485, 0.3451269, -2.433056, 1, 0.8627451, 0, 1,
-0.9997918, -0.1715647, -2.680918, 1, 0.8705882, 0, 1,
-0.9853466, -1.279711, -1.401162, 1, 0.8745098, 0, 1,
-0.9850875, -0.7511156, -2.281099, 1, 0.8823529, 0, 1,
-0.9794194, 0.280755, -2.434988, 1, 0.8862745, 0, 1,
-0.9775448, -0.4946581, -0.6480055, 1, 0.8941177, 0, 1,
-0.9735291, 1.484778, -0.6231097, 1, 0.8980392, 0, 1,
-0.9713228, -0.4795184, -2.230807, 1, 0.9058824, 0, 1,
-0.9683298, 1.385107, -0.8426706, 1, 0.9137255, 0, 1,
-0.9623832, -0.1381988, -2.087047, 1, 0.9176471, 0, 1,
-0.9613096, -0.09275055, -2.838429, 1, 0.9254902, 0, 1,
-0.9549943, -0.8674052, -2.280762, 1, 0.9294118, 0, 1,
-0.9489129, -1.312285, -3.949655, 1, 0.9372549, 0, 1,
-0.939169, 1.614841, -0.6091864, 1, 0.9411765, 0, 1,
-0.9372378, 0.397666, -0.6957492, 1, 0.9490196, 0, 1,
-0.9352002, 1.051517, -0.7562997, 1, 0.9529412, 0, 1,
-0.9338403, -0.5958658, -3.215205, 1, 0.9607843, 0, 1,
-0.9330734, -0.1545529, -3.159173, 1, 0.9647059, 0, 1,
-0.9312762, 0.6859673, -2.434225, 1, 0.972549, 0, 1,
-0.9298025, -0.02732791, -1.07801, 1, 0.9764706, 0, 1,
-0.9289549, 0.250228, -1.567351, 1, 0.9843137, 0, 1,
-0.9263107, 1.603748, 0.1542886, 1, 0.9882353, 0, 1,
-0.925939, -0.9048354, -3.575708, 1, 0.9960784, 0, 1,
-0.9216608, 0.447502, -0.26184, 0.9960784, 1, 0, 1,
-0.9210774, 2.299683, 1.278269, 0.9921569, 1, 0, 1,
-0.9208139, -0.9557434, -2.804596, 0.9843137, 1, 0, 1,
-0.9174057, -0.7822698, -2.157928, 0.9803922, 1, 0, 1,
-0.9159811, 0.3667054, -1.440376, 0.972549, 1, 0, 1,
-0.9155223, -0.9527699, -3.43353, 0.9686275, 1, 0, 1,
-0.9153854, 0.1013222, -0.3052177, 0.9607843, 1, 0, 1,
-0.9100872, -0.1200357, -2.446609, 0.9568627, 1, 0, 1,
-0.9074324, -0.9147211, -1.316391, 0.9490196, 1, 0, 1,
-0.9044538, -0.6149715, -1.657894, 0.945098, 1, 0, 1,
-0.9000053, 0.6273907, -2.327658, 0.9372549, 1, 0, 1,
-0.8947843, -1.210713, -3.103332, 0.9333333, 1, 0, 1,
-0.8883071, 0.5509012, 0.001002499, 0.9254902, 1, 0, 1,
-0.8829901, 0.8840076, -0.2229798, 0.9215686, 1, 0, 1,
-0.8798961, -1.643869, -3.215955, 0.9137255, 1, 0, 1,
-0.8794149, 0.3899778, 0.1293683, 0.9098039, 1, 0, 1,
-0.8786548, 0.5667331, -1.711586, 0.9019608, 1, 0, 1,
-0.8727196, 0.2373412, -0.006355409, 0.8941177, 1, 0, 1,
-0.869661, 0.6908551, -0.439503, 0.8901961, 1, 0, 1,
-0.8679404, -0.3391418, -2.982669, 0.8823529, 1, 0, 1,
-0.8666919, 1.279242, -1.569802, 0.8784314, 1, 0, 1,
-0.8560373, 0.0999856, 0.6354511, 0.8705882, 1, 0, 1,
-0.8538781, -0.1173545, -2.447091, 0.8666667, 1, 0, 1,
-0.8533313, 0.6709992, -1.595591, 0.8588235, 1, 0, 1,
-0.8476343, -1.310693, -2.992544, 0.854902, 1, 0, 1,
-0.8459403, 0.6688857, 0.1718382, 0.8470588, 1, 0, 1,
-0.8447539, -0.4647064, -1.81768, 0.8431373, 1, 0, 1,
-0.8437769, 0.1707821, -2.106529, 0.8352941, 1, 0, 1,
-0.8320976, 0.351593, -0.863724, 0.8313726, 1, 0, 1,
-0.8294482, 0.6239107, -1.896885, 0.8235294, 1, 0, 1,
-0.8236894, 0.009760823, -2.972236, 0.8196079, 1, 0, 1,
-0.8225964, 0.7181782, -0.1357368, 0.8117647, 1, 0, 1,
-0.8177977, 0.4487422, -2.469156, 0.8078431, 1, 0, 1,
-0.817278, -0.9982021, -3.373171, 0.8, 1, 0, 1,
-0.8165067, -1.456019, -2.499586, 0.7921569, 1, 0, 1,
-0.810532, 0.4058505, -1.488098, 0.7882353, 1, 0, 1,
-0.8099258, -0.0909524, -1.078617, 0.7803922, 1, 0, 1,
-0.7972783, -1.04972, -2.135128, 0.7764706, 1, 0, 1,
-0.7971303, -0.1127535, -2.729629, 0.7686275, 1, 0, 1,
-0.7942288, -2.365447, -4.55999, 0.7647059, 1, 0, 1,
-0.7921785, 0.8326589, 0.9381307, 0.7568628, 1, 0, 1,
-0.7854576, 0.789491, -0.4319477, 0.7529412, 1, 0, 1,
-0.7829664, -1.536502, -4.205324, 0.7450981, 1, 0, 1,
-0.7787129, 0.1473871, -1.942538, 0.7411765, 1, 0, 1,
-0.7782217, -0.3472945, -1.211722, 0.7333333, 1, 0, 1,
-0.7766783, 0.7993265, -0.9307296, 0.7294118, 1, 0, 1,
-0.7754843, 1.09488, -0.3575665, 0.7215686, 1, 0, 1,
-0.7747022, -0.8556544, -2.582883, 0.7176471, 1, 0, 1,
-0.7719125, -0.1473883, -0.8594133, 0.7098039, 1, 0, 1,
-0.7675678, 1.159204, -0.399171, 0.7058824, 1, 0, 1,
-0.765687, -0.6672876, -2.728926, 0.6980392, 1, 0, 1,
-0.7604985, -2.557463, -2.793952, 0.6901961, 1, 0, 1,
-0.7571377, 0.05719498, -1.717384, 0.6862745, 1, 0, 1,
-0.7556604, -0.6650366, -1.98133, 0.6784314, 1, 0, 1,
-0.7514624, 0.1336169, -2.003236, 0.6745098, 1, 0, 1,
-0.7497197, 0.8019169, -0.782797, 0.6666667, 1, 0, 1,
-0.747043, 0.4123304, 1.019064, 0.6627451, 1, 0, 1,
-0.7448131, 0.4367899, -2.240632, 0.654902, 1, 0, 1,
-0.7416126, -0.588512, -1.895343, 0.6509804, 1, 0, 1,
-0.7345535, 0.2740177, -1.665449, 0.6431373, 1, 0, 1,
-0.7285677, -0.7449355, -2.128915, 0.6392157, 1, 0, 1,
-0.725448, -0.7088521, -2.918345, 0.6313726, 1, 0, 1,
-0.7248777, -1.344964, -2.512836, 0.627451, 1, 0, 1,
-0.7244492, 0.5142539, -1.413428, 0.6196079, 1, 0, 1,
-0.7225553, 0.04959177, -1.581395, 0.6156863, 1, 0, 1,
-0.7224613, -1.382162, -0.2614719, 0.6078432, 1, 0, 1,
-0.7160389, -2.465987, -3.41756, 0.6039216, 1, 0, 1,
-0.7140619, 0.8415479, -0.9960932, 0.5960785, 1, 0, 1,
-0.7130286, -0.368245, -1.145728, 0.5882353, 1, 0, 1,
-0.7127641, -0.08102684, -0.8451809, 0.5843138, 1, 0, 1,
-0.7110858, -1.057233, -2.554554, 0.5764706, 1, 0, 1,
-0.7100722, 1.543508, -1.848499, 0.572549, 1, 0, 1,
-0.7093706, 0.778307, -0.5413146, 0.5647059, 1, 0, 1,
-0.7040865, 1.907303, -0.8903108, 0.5607843, 1, 0, 1,
-0.7019652, -2.264642, -3.038511, 0.5529412, 1, 0, 1,
-0.7017155, -0.2891037, -0.3101115, 0.5490196, 1, 0, 1,
-0.6978894, -0.007725141, -1.068617, 0.5411765, 1, 0, 1,
-0.6943717, 1.513059, 1.769546, 0.5372549, 1, 0, 1,
-0.6938356, -1.272419, -1.938174, 0.5294118, 1, 0, 1,
-0.690322, -0.7640279, -2.396466, 0.5254902, 1, 0, 1,
-0.6870545, -0.6942532, -2.119314, 0.5176471, 1, 0, 1,
-0.6819256, 1.248007, -0.7782162, 0.5137255, 1, 0, 1,
-0.6794326, 1.82823, 0.3441468, 0.5058824, 1, 0, 1,
-0.6726241, -0.3167076, -1.678846, 0.5019608, 1, 0, 1,
-0.6723104, -0.9710584, -1.810512, 0.4941176, 1, 0, 1,
-0.6661747, -1.916768, -3.114237, 0.4862745, 1, 0, 1,
-0.6649876, 0.2938667, -0.289195, 0.4823529, 1, 0, 1,
-0.6565306, -0.4472535, -1.70238, 0.4745098, 1, 0, 1,
-0.6542805, 0.6658939, -0.4921287, 0.4705882, 1, 0, 1,
-0.6540517, -0.6090773, -1.629932, 0.4627451, 1, 0, 1,
-0.6522712, 0.8336945, -2.220531, 0.4588235, 1, 0, 1,
-0.6507459, -0.1970491, 0.200978, 0.4509804, 1, 0, 1,
-0.6502446, -0.8322511, -2.665282, 0.4470588, 1, 0, 1,
-0.6474381, -0.0323729, -0.1106789, 0.4392157, 1, 0, 1,
-0.6463617, -1.572505, -2.9231, 0.4352941, 1, 0, 1,
-0.6406175, 1.933311, -0.4507326, 0.427451, 1, 0, 1,
-0.6338565, -0.2257466, -0.2345822, 0.4235294, 1, 0, 1,
-0.6337923, -0.8238248, -3.56952, 0.4156863, 1, 0, 1,
-0.6325381, 0.1182034, 0.1519016, 0.4117647, 1, 0, 1,
-0.6309157, 1.067128, -0.8484929, 0.4039216, 1, 0, 1,
-0.6205333, 0.5882562, -1.335888, 0.3960784, 1, 0, 1,
-0.6154891, 1.137154, -1.06232, 0.3921569, 1, 0, 1,
-0.6127346, -1.738657, -3.020855, 0.3843137, 1, 0, 1,
-0.6115582, -0.27125, -0.8769547, 0.3803922, 1, 0, 1,
-0.608593, 0.5606842, 0.2857447, 0.372549, 1, 0, 1,
-0.6058948, 1.754895, 0.4727997, 0.3686275, 1, 0, 1,
-0.6030375, -1.635898, -4.718282, 0.3607843, 1, 0, 1,
-0.601104, 0.3765157, -2.516971, 0.3568628, 1, 0, 1,
-0.585404, -0.9659098, -2.229807, 0.3490196, 1, 0, 1,
-0.5828946, 0.8131018, -1.418379, 0.345098, 1, 0, 1,
-0.5774778, -1.34717, -0.6650925, 0.3372549, 1, 0, 1,
-0.57533, -0.02643954, -0.6948394, 0.3333333, 1, 0, 1,
-0.5703772, 0.1228044, -0.5682624, 0.3254902, 1, 0, 1,
-0.5658019, -0.1751956, -2.97963, 0.3215686, 1, 0, 1,
-0.5618755, -0.2697437, 0.1806023, 0.3137255, 1, 0, 1,
-0.5605633, -0.4390755, -2.115698, 0.3098039, 1, 0, 1,
-0.5595872, -0.1968331, -2.689023, 0.3019608, 1, 0, 1,
-0.5557737, 0.5238094, 0.1232819, 0.2941177, 1, 0, 1,
-0.5494431, -0.44402, -3.792712, 0.2901961, 1, 0, 1,
-0.5478887, 0.2645927, -1.981751, 0.282353, 1, 0, 1,
-0.5347161, 1.157818, -0.6675534, 0.2784314, 1, 0, 1,
-0.5339879, -0.6070653, -3.142107, 0.2705882, 1, 0, 1,
-0.5328211, 0.2430473, 0.2395759, 0.2666667, 1, 0, 1,
-0.530206, 1.797314, -1.862083, 0.2588235, 1, 0, 1,
-0.5269871, 0.5428872, 0.01144002, 0.254902, 1, 0, 1,
-0.5209836, 0.1377693, -1.693673, 0.2470588, 1, 0, 1,
-0.5166035, 0.7100782, -0.8647904, 0.2431373, 1, 0, 1,
-0.515722, 0.0006029945, 0.2941441, 0.2352941, 1, 0, 1,
-0.5120175, 2.685205, -0.5230613, 0.2313726, 1, 0, 1,
-0.5081425, -0.1844614, -2.461596, 0.2235294, 1, 0, 1,
-0.507153, 0.9024879, -0.08671526, 0.2196078, 1, 0, 1,
-0.5054817, 0.4930154, -1.642198, 0.2117647, 1, 0, 1,
-0.4945271, 0.0764742, -1.02516, 0.2078431, 1, 0, 1,
-0.4897372, -0.2669078, -2.532385, 0.2, 1, 0, 1,
-0.4883721, 1.934372, -1.004817, 0.1921569, 1, 0, 1,
-0.4842793, -0.1398161, -3.752574, 0.1882353, 1, 0, 1,
-0.4813985, 0.06131807, 0.003160871, 0.1803922, 1, 0, 1,
-0.4754066, -0.706037, -3.38979, 0.1764706, 1, 0, 1,
-0.4692301, -1.151519, -1.290214, 0.1686275, 1, 0, 1,
-0.4683565, 0.83963, -0.976022, 0.1647059, 1, 0, 1,
-0.4668671, -1.767616, -2.311598, 0.1568628, 1, 0, 1,
-0.4601212, -1.80369, -2.90641, 0.1529412, 1, 0, 1,
-0.4576668, 0.2734792, -0.3051002, 0.145098, 1, 0, 1,
-0.4552681, -1.535654, -3.373902, 0.1411765, 1, 0, 1,
-0.4504203, 0.4755422, -0.2679559, 0.1333333, 1, 0, 1,
-0.4462561, -3.042377, -3.890024, 0.1294118, 1, 0, 1,
-0.4456398, 1.174798, -1.901518, 0.1215686, 1, 0, 1,
-0.4415314, 0.5291417, -1.605523, 0.1176471, 1, 0, 1,
-0.4377537, 0.2874482, -0.5868698, 0.1098039, 1, 0, 1,
-0.4364746, 1.940038, 0.96517, 0.1058824, 1, 0, 1,
-0.4358082, -0.936545, -2.114626, 0.09803922, 1, 0, 1,
-0.4345935, 0.2265737, -0.3103116, 0.09019608, 1, 0, 1,
-0.4307646, -0.6912214, -2.440204, 0.08627451, 1, 0, 1,
-0.4301054, 0.9652365, 0.5983064, 0.07843138, 1, 0, 1,
-0.4278409, -0.7316244, -1.400539, 0.07450981, 1, 0, 1,
-0.4257861, 0.7962868, 0.06779896, 0.06666667, 1, 0, 1,
-0.4247318, 0.4579231, -1.406685, 0.0627451, 1, 0, 1,
-0.4227337, -0.5010719, -2.124106, 0.05490196, 1, 0, 1,
-0.4226654, -1.007508, -1.994278, 0.05098039, 1, 0, 1,
-0.4190696, -1.442758, -3.306367, 0.04313726, 1, 0, 1,
-0.4126008, 0.1291236, -2.420686, 0.03921569, 1, 0, 1,
-0.4097745, -0.7942463, -3.180764, 0.03137255, 1, 0, 1,
-0.4085234, -0.7600061, -1.375792, 0.02745098, 1, 0, 1,
-0.3934922, 0.6188987, 1.167753, 0.01960784, 1, 0, 1,
-0.3911763, -0.09556127, -2.925018, 0.01568628, 1, 0, 1,
-0.3910998, 1.171815, -0.7957635, 0.007843138, 1, 0, 1,
-0.3881724, -0.4102353, -1.450826, 0.003921569, 1, 0, 1,
-0.3875747, -0.6491863, -2.766645, 0, 1, 0.003921569, 1,
-0.3846601, -0.6020845, -1.834138, 0, 1, 0.01176471, 1,
-0.3831356, 0.2953595, 0.06296016, 0, 1, 0.01568628, 1,
-0.3816175, 0.01514772, -1.284324, 0, 1, 0.02352941, 1,
-0.3785408, -0.7221449, -2.060359, 0, 1, 0.02745098, 1,
-0.374844, 1.190689, -1.101308, 0, 1, 0.03529412, 1,
-0.3727846, 0.002478164, -1.857311, 0, 1, 0.03921569, 1,
-0.3720192, -2.208541, -3.192084, 0, 1, 0.04705882, 1,
-0.3701768, 0.3504599, 1.445405, 0, 1, 0.05098039, 1,
-0.3658218, 0.4369331, -0.5208194, 0, 1, 0.05882353, 1,
-0.3639872, 1.969125, -0.2029811, 0, 1, 0.0627451, 1,
-0.3621898, -1.743571, -2.650615, 0, 1, 0.07058824, 1,
-0.3615304, -0.200555, -2.865056, 0, 1, 0.07450981, 1,
-0.3610492, -1.322699, -3.833817, 0, 1, 0.08235294, 1,
-0.3608818, 1.328113, -0.6086685, 0, 1, 0.08627451, 1,
-0.3593047, 0.7039594, -1.409449, 0, 1, 0.09411765, 1,
-0.3546891, 1.139353, 0.710986, 0, 1, 0.1019608, 1,
-0.3493477, 1.817591, 0.2534862, 0, 1, 0.1058824, 1,
-0.349213, -0.2814446, -1.385077, 0, 1, 0.1137255, 1,
-0.3465799, 0.09576808, -0.8406255, 0, 1, 0.1176471, 1,
-0.3413371, 0.7613015, -1.607019, 0, 1, 0.1254902, 1,
-0.3413328, 0.6065751, 0.6234533, 0, 1, 0.1294118, 1,
-0.3378098, 1.319814, -0.262046, 0, 1, 0.1372549, 1,
-0.3359985, -0.03433637, -0.7324893, 0, 1, 0.1411765, 1,
-0.3347381, -0.3244144, -2.192494, 0, 1, 0.1490196, 1,
-0.3340615, 0.6814641, 1.022161, 0, 1, 0.1529412, 1,
-0.3336707, -1.492376, -2.006231, 0, 1, 0.1607843, 1,
-0.3315073, 0.01916121, -0.5921531, 0, 1, 0.1647059, 1,
-0.331464, 0.3893521, -0.9301316, 0, 1, 0.172549, 1,
-0.3282233, 1.087336, -1.323197, 0, 1, 0.1764706, 1,
-0.3279488, -0.240933, -0.9918438, 0, 1, 0.1843137, 1,
-0.3253565, -0.538586, -1.847674, 0, 1, 0.1882353, 1,
-0.3253501, -1.516401, -3.021176, 0, 1, 0.1960784, 1,
-0.324611, -0.103655, -1.473504, 0, 1, 0.2039216, 1,
-0.321656, 0.9572381, -1.253333, 0, 1, 0.2078431, 1,
-0.3213207, -1.137481, -3.804778, 0, 1, 0.2156863, 1,
-0.3211624, -0.4556825, -2.622319, 0, 1, 0.2196078, 1,
-0.3196892, 0.2735415, -0.5538918, 0, 1, 0.227451, 1,
-0.3189264, 1.718202, 2.55319, 0, 1, 0.2313726, 1,
-0.3188224, -2.663629, -2.199348, 0, 1, 0.2392157, 1,
-0.3132562, -0.1975183, -1.98774, 0, 1, 0.2431373, 1,
-0.3051753, -0.01085239, -0.9729447, 0, 1, 0.2509804, 1,
-0.3033806, 0.324544, 0.2251899, 0, 1, 0.254902, 1,
-0.3032326, -0.5384346, -2.038769, 0, 1, 0.2627451, 1,
-0.302609, 0.3276156, -2.427238, 0, 1, 0.2666667, 1,
-0.3007244, -1.085845, -3.271921, 0, 1, 0.2745098, 1,
-0.3005735, -1.788557, -2.665538, 0, 1, 0.2784314, 1,
-0.2978712, 1.107623, -0.7542713, 0, 1, 0.2862745, 1,
-0.2927362, -0.3665492, -2.575022, 0, 1, 0.2901961, 1,
-0.2867171, -1.840145, -3.934144, 0, 1, 0.2980392, 1,
-0.2850538, 0.4342328, 1.05867, 0, 1, 0.3058824, 1,
-0.2835594, -0.01859759, -2.818443, 0, 1, 0.3098039, 1,
-0.2827727, -0.9622634, -4.140459, 0, 1, 0.3176471, 1,
-0.2817606, -0.04639287, -2.773854, 0, 1, 0.3215686, 1,
-0.2776935, -0.2713577, -3.855215, 0, 1, 0.3294118, 1,
-0.2758879, 0.2472888, 0.6249454, 0, 1, 0.3333333, 1,
-0.2753932, -2.459224, -4.703833, 0, 1, 0.3411765, 1,
-0.2722313, 0.5957533, 0.6948987, 0, 1, 0.345098, 1,
-0.2679597, -1.435472, -3.009516, 0, 1, 0.3529412, 1,
-0.2658719, -1.237555, -1.997364, 0, 1, 0.3568628, 1,
-0.2632066, 0.5233236, -1.306453, 0, 1, 0.3647059, 1,
-0.2623778, 0.3430866, -2.098605, 0, 1, 0.3686275, 1,
-0.2616529, -0.8033786, -3.150012, 0, 1, 0.3764706, 1,
-0.2592824, -0.50363, -2.266288, 0, 1, 0.3803922, 1,
-0.2566494, 1.091293, -1.380508, 0, 1, 0.3882353, 1,
-0.2489865, 0.2896696, -1.11171, 0, 1, 0.3921569, 1,
-0.2481537, 0.5023364, -1.156118, 0, 1, 0.4, 1,
-0.2479894, -1.524509, -2.313595, 0, 1, 0.4078431, 1,
-0.2478683, 2.830176, -0.8395871, 0, 1, 0.4117647, 1,
-0.2460332, -0.06697793, -2.916555, 0, 1, 0.4196078, 1,
-0.2439688, -0.6989015, -3.003992, 0, 1, 0.4235294, 1,
-0.2434461, -0.06673311, -0.4511942, 0, 1, 0.4313726, 1,
-0.2382296, 0.8046153, 0.6482589, 0, 1, 0.4352941, 1,
-0.236287, 1.727352, -0.2822577, 0, 1, 0.4431373, 1,
-0.2350523, -0.171261, -0.9112022, 0, 1, 0.4470588, 1,
-0.2333911, -0.01177217, -0.1712394, 0, 1, 0.454902, 1,
-0.2286951, 1.168198, -0.8871416, 0, 1, 0.4588235, 1,
-0.2205627, 0.92143, -0.9773658, 0, 1, 0.4666667, 1,
-0.2171705, 0.1395307, -2.658904, 0, 1, 0.4705882, 1,
-0.2097252, 1.158695, 0.7910739, 0, 1, 0.4784314, 1,
-0.2092926, -0.9087999, -2.748895, 0, 1, 0.4823529, 1,
-0.2068986, 1.166002, 0.4425918, 0, 1, 0.4901961, 1,
-0.2066916, -0.4821036, -4.702099, 0, 1, 0.4941176, 1,
-0.2052574, 0.2963058, -0.4414785, 0, 1, 0.5019608, 1,
-0.2049767, 0.6882312, -1.826977, 0, 1, 0.509804, 1,
-0.2040012, 1.341003, 0.3524522, 0, 1, 0.5137255, 1,
-0.2014379, -0.03158186, -2.334423, 0, 1, 0.5215687, 1,
-0.2011921, -0.1356334, -2.19259, 0, 1, 0.5254902, 1,
-0.1960348, -0.001830806, -0.8723233, 0, 1, 0.5333334, 1,
-0.1889243, 0.3536942, -0.9936749, 0, 1, 0.5372549, 1,
-0.1880401, 0.2134053, -0.9418054, 0, 1, 0.5450981, 1,
-0.1863417, 1.504802, -0.1132562, 0, 1, 0.5490196, 1,
-0.1862524, 0.4059935, -1.705733, 0, 1, 0.5568628, 1,
-0.1859124, 0.5643777, -0.7932296, 0, 1, 0.5607843, 1,
-0.1847378, 2.370851, 0.2697641, 0, 1, 0.5686275, 1,
-0.1839273, -1.205414, -2.808356, 0, 1, 0.572549, 1,
-0.182593, -1.494068, -2.578661, 0, 1, 0.5803922, 1,
-0.1815019, -1.199345, -3.794143, 0, 1, 0.5843138, 1,
-0.1810415, -0.464149, -2.530708, 0, 1, 0.5921569, 1,
-0.1716924, 1.0579, -0.04201385, 0, 1, 0.5960785, 1,
-0.171206, 0.5509777, -0.5340451, 0, 1, 0.6039216, 1,
-0.1692077, -0.9529728, -4.109335, 0, 1, 0.6117647, 1,
-0.16646, 1.113456, 2.521243, 0, 1, 0.6156863, 1,
-0.1661679, -2.515374, -2.090594, 0, 1, 0.6235294, 1,
-0.1658317, -0.03076644, -1.383471, 0, 1, 0.627451, 1,
-0.1621163, 0.2263846, -0.7944413, 0, 1, 0.6352941, 1,
-0.1609825, -0.8249499, -3.958555, 0, 1, 0.6392157, 1,
-0.1587231, -1.131327, -5.52053, 0, 1, 0.6470588, 1,
-0.1543996, -0.1912021, -3.836033, 0, 1, 0.6509804, 1,
-0.1540756, -0.02003269, -0.1805147, 0, 1, 0.6588235, 1,
-0.1537673, -0.4305558, -1.950541, 0, 1, 0.6627451, 1,
-0.1508356, -0.3115808, -1.585859, 0, 1, 0.6705883, 1,
-0.1481774, -0.2293468, -1.402988, 0, 1, 0.6745098, 1,
-0.146951, 0.4505901, -0.67195, 0, 1, 0.682353, 1,
-0.1469424, 2.433141, -0.4124911, 0, 1, 0.6862745, 1,
-0.144524, -0.5199173, -2.011398, 0, 1, 0.6941177, 1,
-0.1443182, -0.6767112, -1.199662, 0, 1, 0.7019608, 1,
-0.1407947, 0.6011806, -0.4280362, 0, 1, 0.7058824, 1,
-0.1288867, -0.03959282, -1.453823, 0, 1, 0.7137255, 1,
-0.1284867, 0.5799017, -0.8859404, 0, 1, 0.7176471, 1,
-0.1223509, -0.4309157, -2.49988, 0, 1, 0.7254902, 1,
-0.1214261, 1.495398, 2.030751, 0, 1, 0.7294118, 1,
-0.120472, -2.626439, -3.40569, 0, 1, 0.7372549, 1,
-0.1178253, -0.1868208, 0.2613091, 0, 1, 0.7411765, 1,
-0.1165118, -0.509987, -3.306234, 0, 1, 0.7490196, 1,
-0.1160038, 0.1230487, 0.0920662, 0, 1, 0.7529412, 1,
-0.1147633, -0.3730401, -2.785883, 0, 1, 0.7607843, 1,
-0.1116873, 1.041955, -0.7316982, 0, 1, 0.7647059, 1,
-0.1109455, 0.9808502, -0.09515042, 0, 1, 0.772549, 1,
-0.1100796, -0.7944164, -3.062299, 0, 1, 0.7764706, 1,
-0.1069392, -1.273497, -4.547115, 0, 1, 0.7843137, 1,
-0.1017348, 1.029786, -1.116595, 0, 1, 0.7882353, 1,
-0.1008302, 1.315275, -0.630787, 0, 1, 0.7960784, 1,
-0.100287, -1.773221, -4.02071, 0, 1, 0.8039216, 1,
-0.09814776, 0.1442887, -0.5606221, 0, 1, 0.8078431, 1,
-0.09599526, -1.243197, -5.238775, 0, 1, 0.8156863, 1,
-0.09572323, 0.3059871, -0.8810127, 0, 1, 0.8196079, 1,
-0.09075792, -1.120312, -2.247282, 0, 1, 0.827451, 1,
-0.08787945, 0.266025, -1.527907, 0, 1, 0.8313726, 1,
-0.08592284, -0.608497, -1.948252, 0, 1, 0.8392157, 1,
-0.0845176, -0.1597886, -3.140153, 0, 1, 0.8431373, 1,
-0.08421411, 1.21205, -1.067393, 0, 1, 0.8509804, 1,
-0.08134331, 0.2673121, -0.4916231, 0, 1, 0.854902, 1,
-0.08049093, 0.2478282, -0.04889626, 0, 1, 0.8627451, 1,
-0.08035177, -0.5203615, -3.571526, 0, 1, 0.8666667, 1,
-0.07795031, -0.3409578, -0.4352612, 0, 1, 0.8745098, 1,
-0.07537837, -0.5674199, -5.229355, 0, 1, 0.8784314, 1,
-0.07409799, 0.431906, -2.302715, 0, 1, 0.8862745, 1,
-0.07316542, -0.8682913, -4.387575, 0, 1, 0.8901961, 1,
-0.07062408, 1.448605, -1.693917, 0, 1, 0.8980392, 1,
-0.07054292, 0.1059752, -2.192956, 0, 1, 0.9058824, 1,
-0.06962278, -1.150075, -2.46114, 0, 1, 0.9098039, 1,
-0.06298514, -0.1243929, -1.761766, 0, 1, 0.9176471, 1,
-0.0580373, -1.100695, -2.066815, 0, 1, 0.9215686, 1,
-0.05794666, -0.04557059, -3.056535, 0, 1, 0.9294118, 1,
-0.05636476, -1.419533, -2.068193, 0, 1, 0.9333333, 1,
-0.05230929, 0.8093105, -1.198032, 0, 1, 0.9411765, 1,
-0.04932001, 0.5081321, -0.9936679, 0, 1, 0.945098, 1,
-0.04651727, -0.9758262, -5.997978, 0, 1, 0.9529412, 1,
-0.04241686, -0.2085538, -3.068742, 0, 1, 0.9568627, 1,
-0.04063447, -0.5115945, -2.251157, 0, 1, 0.9647059, 1,
-0.03655382, 1.365808, -0.2992172, 0, 1, 0.9686275, 1,
-0.03304536, 0.7294394, 2.016459, 0, 1, 0.9764706, 1,
-0.03109956, 0.9808841, 1.033807, 0, 1, 0.9803922, 1,
-0.02777718, -1.869995, -3.686914, 0, 1, 0.9882353, 1,
-0.01999001, -0.8325121, -1.313096, 0, 1, 0.9921569, 1,
-0.01724758, 1.447726, 1.243743, 0, 1, 1, 1,
-0.01658632, 0.07952853, -0.5303237, 0, 0.9921569, 1, 1,
-0.01575886, 0.1704204, -0.7548469, 0, 0.9882353, 1, 1,
-0.01168568, 0.006727275, 0.8550181, 0, 0.9803922, 1, 1,
-0.009685618, 0.8616992, 0.6818738, 0, 0.9764706, 1, 1,
-0.008725689, 0.9888323, -0.2179211, 0, 0.9686275, 1, 1,
-0.0079582, -0.6783305, -3.270066, 0, 0.9647059, 1, 1,
-0.004925583, 1.069185, 0.4372613, 0, 0.9568627, 1, 1,
-0.001939588, 0.4927327, -0.7843115, 0, 0.9529412, 1, 1,
-0.001703612, 0.6768711, 0.7745744, 0, 0.945098, 1, 1,
0.005487218, -0.1764941, 0.1191657, 0, 0.9411765, 1, 1,
0.01005497, 1.292158, -1.159695, 0, 0.9333333, 1, 1,
0.01684801, 1.672266, -0.2998536, 0, 0.9294118, 1, 1,
0.01892255, -0.4470227, 1.215207, 0, 0.9215686, 1, 1,
0.02112528, 0.3110725, -0.7756655, 0, 0.9176471, 1, 1,
0.02163113, -0.982675, 2.880886, 0, 0.9098039, 1, 1,
0.02212524, 0.8508133, 0.6366649, 0, 0.9058824, 1, 1,
0.02594265, 0.386216, -0.7170981, 0, 0.8980392, 1, 1,
0.03270594, -1.491294, 4.719141, 0, 0.8901961, 1, 1,
0.03450925, 0.346288, 0.03233328, 0, 0.8862745, 1, 1,
0.03620343, 1.036816, 0.01995459, 0, 0.8784314, 1, 1,
0.04157687, -0.3611711, 4.827723, 0, 0.8745098, 1, 1,
0.04204654, 1.103015, -1.629484, 0, 0.8666667, 1, 1,
0.04396139, -0.2587924, 4.600263, 0, 0.8627451, 1, 1,
0.04614329, 0.6583863, 0.4727951, 0, 0.854902, 1, 1,
0.04842147, 1.108878, -1.314221, 0, 0.8509804, 1, 1,
0.04915962, 0.1040791, -0.4994893, 0, 0.8431373, 1, 1,
0.04978216, 2.158971, -1.724205, 0, 0.8392157, 1, 1,
0.05530908, 1.257974, 0.1184121, 0, 0.8313726, 1, 1,
0.05880754, 0.5464011, 1.419557, 0, 0.827451, 1, 1,
0.06130012, -0.4350618, 1.729934, 0, 0.8196079, 1, 1,
0.06130173, -0.1627831, 4.452333, 0, 0.8156863, 1, 1,
0.06354776, -0.1535004, 2.894654, 0, 0.8078431, 1, 1,
0.0639843, -1.162225, 2.525178, 0, 0.8039216, 1, 1,
0.06664612, -0.4682383, 2.366977, 0, 0.7960784, 1, 1,
0.06674695, 0.474234, 0.5833983, 0, 0.7882353, 1, 1,
0.06718155, -1.372608, 3.976099, 0, 0.7843137, 1, 1,
0.06736998, 0.754986, 0.5293864, 0, 0.7764706, 1, 1,
0.06919757, -0.2127047, 2.694747, 0, 0.772549, 1, 1,
0.07406792, -0.9509337, 4.010312, 0, 0.7647059, 1, 1,
0.08349731, -0.06009288, 2.980509, 0, 0.7607843, 1, 1,
0.08481048, -0.9516943, 3.284599, 0, 0.7529412, 1, 1,
0.09251671, 1.627517, -1.300236, 0, 0.7490196, 1, 1,
0.09375317, -0.5539319, 2.617019, 0, 0.7411765, 1, 1,
0.09444881, 0.4566637, 1.794284, 0, 0.7372549, 1, 1,
0.09493791, -1.406968, 3.397577, 0, 0.7294118, 1, 1,
0.09509341, -0.2280028, 3.501867, 0, 0.7254902, 1, 1,
0.0970143, -1.85168, 3.043252, 0, 0.7176471, 1, 1,
0.0986726, -0.1917257, 1.650417, 0, 0.7137255, 1, 1,
0.1027758, 1.344593, -1.133559, 0, 0.7058824, 1, 1,
0.1030913, 1.051073, -0.1914822, 0, 0.6980392, 1, 1,
0.1077847, 2.758083, -0.8271787, 0, 0.6941177, 1, 1,
0.1111946, -1.104161, 2.040087, 0, 0.6862745, 1, 1,
0.1120865, 1.33083, 0.5884219, 0, 0.682353, 1, 1,
0.1130977, 0.3707522, 1.13039, 0, 0.6745098, 1, 1,
0.1131332, -1.206055, 1.790499, 0, 0.6705883, 1, 1,
0.1136941, 1.517209, -0.03085073, 0, 0.6627451, 1, 1,
0.117265, 2.393071, 0.7682098, 0, 0.6588235, 1, 1,
0.1174347, 1.09922, 1.469594, 0, 0.6509804, 1, 1,
0.1226352, -0.4662299, 3.471119, 0, 0.6470588, 1, 1,
0.1236565, 0.1019113, 1.412321, 0, 0.6392157, 1, 1,
0.1244989, 0.1511617, -1.110599, 0, 0.6352941, 1, 1,
0.1267685, -1.551578, 2.211106, 0, 0.627451, 1, 1,
0.1277014, -0.5500321, 2.235964, 0, 0.6235294, 1, 1,
0.1316237, 1.281414, 1.13094, 0, 0.6156863, 1, 1,
0.1324974, -2.018965, 3.56432, 0, 0.6117647, 1, 1,
0.1340816, -0.6140486, 3.02717, 0, 0.6039216, 1, 1,
0.1363255, -0.3346526, 2.86101, 0, 0.5960785, 1, 1,
0.1539337, -0.2585644, 2.905833, 0, 0.5921569, 1, 1,
0.1548119, 0.1587422, -0.3491679, 0, 0.5843138, 1, 1,
0.1556976, -0.373797, 2.728271, 0, 0.5803922, 1, 1,
0.1560135, 0.1742775, 1.162004, 0, 0.572549, 1, 1,
0.156015, 0.1484664, 1.451517, 0, 0.5686275, 1, 1,
0.1605496, -1.003641, 2.114514, 0, 0.5607843, 1, 1,
0.1658473, -0.2480347, 1.403186, 0, 0.5568628, 1, 1,
0.1660129, -0.4203714, 1.922948, 0, 0.5490196, 1, 1,
0.1680561, -2.187757, 1.629189, 0, 0.5450981, 1, 1,
0.1696331, 0.5931125, -0.3098489, 0, 0.5372549, 1, 1,
0.175426, 0.4404141, -0.2579541, 0, 0.5333334, 1, 1,
0.1775947, -0.00768163, 0.6881324, 0, 0.5254902, 1, 1,
0.1793833, 0.5159717, 1.498805, 0, 0.5215687, 1, 1,
0.1806263, 0.1864867, 0.4250675, 0, 0.5137255, 1, 1,
0.1819368, 0.7426736, 0.3398053, 0, 0.509804, 1, 1,
0.1830573, 0.593063, -1.076122, 0, 0.5019608, 1, 1,
0.1885554, 2.102741, -0.0701768, 0, 0.4941176, 1, 1,
0.1893796, 0.1017446, 3.82788, 0, 0.4901961, 1, 1,
0.1972568, -0.2476386, 3.722263, 0, 0.4823529, 1, 1,
0.2024532, -0.06146624, 1.5122, 0, 0.4784314, 1, 1,
0.2054005, 0.1579908, 1.118675, 0, 0.4705882, 1, 1,
0.2072157, -0.4565735, 4.088404, 0, 0.4666667, 1, 1,
0.2110903, 0.9438668, -1.052696, 0, 0.4588235, 1, 1,
0.2119408, -0.5877261, 3.553379, 0, 0.454902, 1, 1,
0.2162088, 0.2537321, 0.7583615, 0, 0.4470588, 1, 1,
0.2195741, 0.04483351, 1.640688, 0, 0.4431373, 1, 1,
0.2225799, 0.3090357, -0.2274743, 0, 0.4352941, 1, 1,
0.2259271, 0.8499585, -0.1484506, 0, 0.4313726, 1, 1,
0.2271964, 0.1672474, 2.020525, 0, 0.4235294, 1, 1,
0.228045, -0.7251948, 1.072893, 0, 0.4196078, 1, 1,
0.2295579, -0.5256413, 2.489495, 0, 0.4117647, 1, 1,
0.2393754, -0.05986093, 1.525737, 0, 0.4078431, 1, 1,
0.2406526, 0.0007597117, 0.07668295, 0, 0.4, 1, 1,
0.2482028, -0.5564938, 2.479078, 0, 0.3921569, 1, 1,
0.2568816, 1.406532, -0.8703161, 0, 0.3882353, 1, 1,
0.2584917, 2.542154, -1.423493, 0, 0.3803922, 1, 1,
0.2593198, -0.664634, 3.31083, 0, 0.3764706, 1, 1,
0.2604822, 1.499538, 1.134589, 0, 0.3686275, 1, 1,
0.2608675, 2.133484, 0.08946169, 0, 0.3647059, 1, 1,
0.2638552, -0.02381826, 2.360216, 0, 0.3568628, 1, 1,
0.2657656, -0.05654064, 0.960693, 0, 0.3529412, 1, 1,
0.270215, -0.2949296, 4.535332, 0, 0.345098, 1, 1,
0.2752193, -0.6137522, 1.667573, 0, 0.3411765, 1, 1,
0.2778623, -0.9530588, 3.055516, 0, 0.3333333, 1, 1,
0.2789997, -1.631904, 2.742516, 0, 0.3294118, 1, 1,
0.2801581, 1.046386, 1.467347, 0, 0.3215686, 1, 1,
0.2822596, 1.43682, 0.5257264, 0, 0.3176471, 1, 1,
0.2843887, -0.3529821, 3.418537, 0, 0.3098039, 1, 1,
0.2852134, 0.5060403, 0.2013992, 0, 0.3058824, 1, 1,
0.288381, -0.9013638, 2.148142, 0, 0.2980392, 1, 1,
0.2977437, -0.564185, 2.492013, 0, 0.2901961, 1, 1,
0.3033114, 0.3781722, 1.299332, 0, 0.2862745, 1, 1,
0.3033284, 0.9776926, 0.8586105, 0, 0.2784314, 1, 1,
0.3060569, 1.177248, 0.364861, 0, 0.2745098, 1, 1,
0.3070848, 0.7889563, 1.514978, 0, 0.2666667, 1, 1,
0.3115228, -0.1394472, 1.928349, 0, 0.2627451, 1, 1,
0.3121665, -0.04107229, 3.350038, 0, 0.254902, 1, 1,
0.3159077, 0.8763227, 0.207207, 0, 0.2509804, 1, 1,
0.3169597, -0.00798982, 1.476938, 0, 0.2431373, 1, 1,
0.3199595, -1.028724, 3.827559, 0, 0.2392157, 1, 1,
0.320193, 0.7028321, 1.370336, 0, 0.2313726, 1, 1,
0.3221598, -1.17353, 2.070026, 0, 0.227451, 1, 1,
0.3253832, 0.5719655, 0.3020326, 0, 0.2196078, 1, 1,
0.327022, -0.1771344, 3.161478, 0, 0.2156863, 1, 1,
0.3356889, 1.138033, 0.1201639, 0, 0.2078431, 1, 1,
0.3366237, -0.02734404, 2.44176, 0, 0.2039216, 1, 1,
0.33773, -0.4882557, 3.539813, 0, 0.1960784, 1, 1,
0.3399006, 0.8271219, 1.487843, 0, 0.1882353, 1, 1,
0.3424202, -0.07182146, 1.677856, 0, 0.1843137, 1, 1,
0.343089, 1.074697, -0.3765789, 0, 0.1764706, 1, 1,
0.3495168, 0.5230564, 1.317892, 0, 0.172549, 1, 1,
0.3505513, -0.5380077, 2.450059, 0, 0.1647059, 1, 1,
0.3509507, 1.709199, -0.1447043, 0, 0.1607843, 1, 1,
0.3533415, -1.314353, 2.674691, 0, 0.1529412, 1, 1,
0.3547562, 0.0482352, 2.394792, 0, 0.1490196, 1, 1,
0.3578016, -0.03119433, 2.130508, 0, 0.1411765, 1, 1,
0.3662023, -0.5147713, 2.642534, 0, 0.1372549, 1, 1,
0.3694816, -0.3289345, 1.768586, 0, 0.1294118, 1, 1,
0.3710693, 1.010338, 0.2422153, 0, 0.1254902, 1, 1,
0.3724353, 0.3189334, 1.58775, 0, 0.1176471, 1, 1,
0.372876, -0.8232062, 1.506596, 0, 0.1137255, 1, 1,
0.3741139, -0.3013439, 3.84729, 0, 0.1058824, 1, 1,
0.3841434, -1.857171, 3.179169, 0, 0.09803922, 1, 1,
0.3869003, 1.240183, 0.9419066, 0, 0.09411765, 1, 1,
0.3886165, 2.128695, 0.7797043, 0, 0.08627451, 1, 1,
0.3901583, 1.377511, 0.893724, 0, 0.08235294, 1, 1,
0.3912078, 0.2220109, -0.1537437, 0, 0.07450981, 1, 1,
0.3928736, 0.9005489, 0.5254059, 0, 0.07058824, 1, 1,
0.3980365, 0.7363588, -1.199077, 0, 0.0627451, 1, 1,
0.3990397, 0.206051, 1.241844, 0, 0.05882353, 1, 1,
0.404714, -0.8259885, 1.574475, 0, 0.05098039, 1, 1,
0.4061717, 0.05942572, 0.6165081, 0, 0.04705882, 1, 1,
0.4183615, -0.8700489, 1.887795, 0, 0.03921569, 1, 1,
0.4203802, -2.252819, 3.030757, 0, 0.03529412, 1, 1,
0.4213735, -1.055662, 1.744918, 0, 0.02745098, 1, 1,
0.4243526, -0.4211325, 1.234179, 0, 0.02352941, 1, 1,
0.4259578, -0.3137105, 1.531774, 0, 0.01568628, 1, 1,
0.4283166, 0.4146209, 0.6173751, 0, 0.01176471, 1, 1,
0.4284637, -0.738794, 2.539746, 0, 0.003921569, 1, 1,
0.4314185, -0.1017236, 3.652511, 0.003921569, 0, 1, 1,
0.4365518, -0.9402537, 1.791285, 0.007843138, 0, 1, 1,
0.4365536, -2.788069, 2.798044, 0.01568628, 0, 1, 1,
0.4392152, 0.04511043, 0.9042764, 0.01960784, 0, 1, 1,
0.4407138, -0.2898798, 2.358799, 0.02745098, 0, 1, 1,
0.4439022, 0.472505, 0.2955497, 0.03137255, 0, 1, 1,
0.4465975, -0.4556697, 1.115174, 0.03921569, 0, 1, 1,
0.4466009, 0.9895297, -1.497164, 0.04313726, 0, 1, 1,
0.4501498, -0.380456, 3.735944, 0.05098039, 0, 1, 1,
0.4538152, -0.01377721, 2.649958, 0.05490196, 0, 1, 1,
0.4557526, 1.484357, -0.4185112, 0.0627451, 0, 1, 1,
0.4568157, 1.964715, 1.40568, 0.06666667, 0, 1, 1,
0.4578044, 0.09831073, 2.373011, 0.07450981, 0, 1, 1,
0.4597992, 1.644133, 0.7137684, 0.07843138, 0, 1, 1,
0.4622757, 1.268003, -0.05179228, 0.08627451, 0, 1, 1,
0.4690119, -0.5975601, 1.718704, 0.09019608, 0, 1, 1,
0.4736218, 0.1777468, 0.3289162, 0.09803922, 0, 1, 1,
0.4772844, 0.1210876, 1.463804, 0.1058824, 0, 1, 1,
0.478155, 0.9622604, -0.2740456, 0.1098039, 0, 1, 1,
0.4826074, -0.8771008, 3.970693, 0.1176471, 0, 1, 1,
0.4838993, -1.543977, 3.998862, 0.1215686, 0, 1, 1,
0.489875, -0.6465166, 3.230544, 0.1294118, 0, 1, 1,
0.4914123, 0.05256863, 1.78238, 0.1333333, 0, 1, 1,
0.4923117, -1.76015, 2.962628, 0.1411765, 0, 1, 1,
0.5005534, 0.7173201, 2.502234, 0.145098, 0, 1, 1,
0.5016331, 0.2922441, 2.604468, 0.1529412, 0, 1, 1,
0.5049073, -0.8207892, 3.103096, 0.1568628, 0, 1, 1,
0.5053357, 1.525923, 1.151199, 0.1647059, 0, 1, 1,
0.5059797, -0.6948963, 1.714152, 0.1686275, 0, 1, 1,
0.5081723, 0.5759889, 1.241298, 0.1764706, 0, 1, 1,
0.5144559, 0.5227349, 2.07769, 0.1803922, 0, 1, 1,
0.5157208, 0.9898656, -1.005925, 0.1882353, 0, 1, 1,
0.5169943, 0.1543334, 1.181522, 0.1921569, 0, 1, 1,
0.5179113, 0.3299208, 0.7771527, 0.2, 0, 1, 1,
0.5186514, -0.9347349, 1.228764, 0.2078431, 0, 1, 1,
0.5189009, 0.1737555, 0.8936238, 0.2117647, 0, 1, 1,
0.5242101, 1.111809, 0.5182992, 0.2196078, 0, 1, 1,
0.5321295, -1.353009, 1.99189, 0.2235294, 0, 1, 1,
0.5327516, 0.5182341, 0.9405683, 0.2313726, 0, 1, 1,
0.533417, -0.03584621, 1.569041, 0.2352941, 0, 1, 1,
0.5336169, -0.3487118, 1.833786, 0.2431373, 0, 1, 1,
0.5340606, -0.3147945, 0.723439, 0.2470588, 0, 1, 1,
0.5354422, 1.571401, 0.7702236, 0.254902, 0, 1, 1,
0.536643, -1.444854, 2.676177, 0.2588235, 0, 1, 1,
0.5435047, 1.44181, -1.260661, 0.2666667, 0, 1, 1,
0.5436941, 0.6640137, 2.84761, 0.2705882, 0, 1, 1,
0.5438644, -0.9349101, 2.224921, 0.2784314, 0, 1, 1,
0.5497982, 0.7730463, 0.4160166, 0.282353, 0, 1, 1,
0.5506999, 0.006626192, 1.426836, 0.2901961, 0, 1, 1,
0.5520017, 0.2975365, 2.734357, 0.2941177, 0, 1, 1,
0.5527972, 1.776307, 1.48894, 0.3019608, 0, 1, 1,
0.5572177, -0.3363808, 1.208734, 0.3098039, 0, 1, 1,
0.5630648, -0.2127403, 2.985549, 0.3137255, 0, 1, 1,
0.5647519, -0.1922796, 0.8577312, 0.3215686, 0, 1, 1,
0.5651873, 0.5118331, 1.252141, 0.3254902, 0, 1, 1,
0.5673333, 0.8903053, -0.6782302, 0.3333333, 0, 1, 1,
0.5720787, -0.1733716, 4.407939, 0.3372549, 0, 1, 1,
0.5739251, 0.307894, 0.5954623, 0.345098, 0, 1, 1,
0.5744796, -0.2639305, 3.003034, 0.3490196, 0, 1, 1,
0.5752175, -0.7398075, 3.878996, 0.3568628, 0, 1, 1,
0.5760586, -0.5860319, 1.988801, 0.3607843, 0, 1, 1,
0.580795, -0.522342, 1.491673, 0.3686275, 0, 1, 1,
0.5819321, -2.049461, 2.580373, 0.372549, 0, 1, 1,
0.5826662, 0.821197, 0.6707975, 0.3803922, 0, 1, 1,
0.5843734, -1.051404, 3.044591, 0.3843137, 0, 1, 1,
0.5889943, -0.630715, 1.948612, 0.3921569, 0, 1, 1,
0.5917433, 0.13406, 1.285857, 0.3960784, 0, 1, 1,
0.5957642, -1.385535, 3.887199, 0.4039216, 0, 1, 1,
0.5987222, -0.3418832, 4.060561, 0.4117647, 0, 1, 1,
0.6071802, 0.224609, 2.254638, 0.4156863, 0, 1, 1,
0.6101238, 1.810342, -0.6577998, 0.4235294, 0, 1, 1,
0.6111047, 0.1458382, 1.522128, 0.427451, 0, 1, 1,
0.6111404, -0.244072, 1.869242, 0.4352941, 0, 1, 1,
0.6117449, 0.1173904, 1.967866, 0.4392157, 0, 1, 1,
0.6137292, 1.222055, 1.327333, 0.4470588, 0, 1, 1,
0.6178058, -0.2322479, 3.421616, 0.4509804, 0, 1, 1,
0.6246299, 0.3375862, -0.6378689, 0.4588235, 0, 1, 1,
0.6275823, -0.495088, 1.496878, 0.4627451, 0, 1, 1,
0.6310154, 0.2237149, 2.234402, 0.4705882, 0, 1, 1,
0.6444264, -0.373483, 2.297657, 0.4745098, 0, 1, 1,
0.6492702, 0.8509563, 1.028344, 0.4823529, 0, 1, 1,
0.6516662, -0.1434726, 0.1759956, 0.4862745, 0, 1, 1,
0.6547809, -0.723236, 2.101044, 0.4941176, 0, 1, 1,
0.6554804, 2.405013, 1.845053, 0.5019608, 0, 1, 1,
0.6562094, 0.001539282, 1.85786, 0.5058824, 0, 1, 1,
0.6579531, 1.613158, -1.759855, 0.5137255, 0, 1, 1,
0.6646017, 0.7792749, 1.013964, 0.5176471, 0, 1, 1,
0.6814242, -2.087507, 2.846933, 0.5254902, 0, 1, 1,
0.6847567, 0.7405012, 1.041746, 0.5294118, 0, 1, 1,
0.6924228, 1.304657, -0.6812698, 0.5372549, 0, 1, 1,
0.6929491, -1.314373, 2.00942, 0.5411765, 0, 1, 1,
0.6943902, 1.874538, -0.7952004, 0.5490196, 0, 1, 1,
0.7047991, 1.005764, 0.8825684, 0.5529412, 0, 1, 1,
0.7146727, -0.4929554, 1.116227, 0.5607843, 0, 1, 1,
0.7154243, 0.4405598, 2.167549, 0.5647059, 0, 1, 1,
0.717204, -1.073328, 2.225283, 0.572549, 0, 1, 1,
0.7177863, -0.3514317, 1.778151, 0.5764706, 0, 1, 1,
0.7200504, -0.3112235, 3.960726, 0.5843138, 0, 1, 1,
0.7272114, 0.8161229, 2.139353, 0.5882353, 0, 1, 1,
0.7310178, -0.5802301, 2.458158, 0.5960785, 0, 1, 1,
0.7315214, -0.01313567, 2.999057, 0.6039216, 0, 1, 1,
0.7348448, -0.6712578, 2.951837, 0.6078432, 0, 1, 1,
0.73842, 0.6506466, 1.384603, 0.6156863, 0, 1, 1,
0.7459406, 2.448644, 0.5998594, 0.6196079, 0, 1, 1,
0.7507812, 0.4744511, 0.1962963, 0.627451, 0, 1, 1,
0.7535634, -2.312024, 3.504107, 0.6313726, 0, 1, 1,
0.7567474, -0.7963527, 2.220735, 0.6392157, 0, 1, 1,
0.7570816, 0.9533711, 0.9229439, 0.6431373, 0, 1, 1,
0.760712, 1.693026, 0.1580052, 0.6509804, 0, 1, 1,
0.7616299, 0.5020074, 2.00375, 0.654902, 0, 1, 1,
0.762777, -0.7382695, 2.155421, 0.6627451, 0, 1, 1,
0.7772291, 0.3592391, -0.5171464, 0.6666667, 0, 1, 1,
0.7800444, -0.1290644, 1.69339, 0.6745098, 0, 1, 1,
0.7850861, -0.2098863, 3.51183, 0.6784314, 0, 1, 1,
0.7890374, -0.9063891, 2.268462, 0.6862745, 0, 1, 1,
0.7949285, 0.3822074, -0.5222143, 0.6901961, 0, 1, 1,
0.7955286, -0.9004817, 1.734025, 0.6980392, 0, 1, 1,
0.8000623, 0.05942511, 2.592324, 0.7058824, 0, 1, 1,
0.8155748, 0.784032, 0.1653583, 0.7098039, 0, 1, 1,
0.8170683, 1.117803, 0.8299574, 0.7176471, 0, 1, 1,
0.8259485, -0.6441229, 3.015177, 0.7215686, 0, 1, 1,
0.829388, 0.08945131, 0.5106022, 0.7294118, 0, 1, 1,
0.8305033, 1.405893, 0.6239073, 0.7333333, 0, 1, 1,
0.8311317, 0.3525959, 0.2234577, 0.7411765, 0, 1, 1,
0.8342033, -1.393037, 2.516452, 0.7450981, 0, 1, 1,
0.8358547, -0.3408518, 2.175585, 0.7529412, 0, 1, 1,
0.8360219, 0.662953, 0.298689, 0.7568628, 0, 1, 1,
0.8432764, -0.3898624, 2.845191, 0.7647059, 0, 1, 1,
0.8453802, -0.5104136, 2.930189, 0.7686275, 0, 1, 1,
0.847217, 0.1062447, 0.9045056, 0.7764706, 0, 1, 1,
0.8694959, 0.06232894, 1.179599, 0.7803922, 0, 1, 1,
0.8805082, 0.3840239, 0.5434987, 0.7882353, 0, 1, 1,
0.8857816, -0.1076958, 3.108115, 0.7921569, 0, 1, 1,
0.8869095, -1.867882, 2.071343, 0.8, 0, 1, 1,
0.8954833, 1.691715, 0.458697, 0.8078431, 0, 1, 1,
0.8956106, 0.3112522, 3.88413, 0.8117647, 0, 1, 1,
0.8983775, -0.5849118, 2.933987, 0.8196079, 0, 1, 1,
0.9081031, 1.79914, -0.6419984, 0.8235294, 0, 1, 1,
0.9083644, 0.2700709, 1.280516, 0.8313726, 0, 1, 1,
0.9129085, -0.1301322, 1.390895, 0.8352941, 0, 1, 1,
0.9141207, 0.8484513, 1.111284, 0.8431373, 0, 1, 1,
0.9172817, 1.399844, 1.261334, 0.8470588, 0, 1, 1,
0.9183456, 0.6953624, 1.423182, 0.854902, 0, 1, 1,
0.9228532, 1.404573, 0.08451737, 0.8588235, 0, 1, 1,
0.9232557, 0.2951628, 2.069253, 0.8666667, 0, 1, 1,
0.9261819, 0.744583, 0.8049816, 0.8705882, 0, 1, 1,
0.9352311, -1.041051, 2.480826, 0.8784314, 0, 1, 1,
0.9353516, -1.919091, 2.698956, 0.8823529, 0, 1, 1,
0.9356333, 0.5140975, 0.530044, 0.8901961, 0, 1, 1,
0.9438024, -0.527451, 2.928735, 0.8941177, 0, 1, 1,
0.9488556, 1.006756, -0.1323109, 0.9019608, 0, 1, 1,
0.9511802, 0.6042075, 1.387233, 0.9098039, 0, 1, 1,
0.9521704, 0.565298, 0.9140048, 0.9137255, 0, 1, 1,
0.9558429, -0.6477441, 3.027606, 0.9215686, 0, 1, 1,
0.9604198, -0.5284653, 1.618947, 0.9254902, 0, 1, 1,
0.9670227, 0.04692542, 2.16424, 0.9333333, 0, 1, 1,
0.9706171, -1.047583, 2.478761, 0.9372549, 0, 1, 1,
0.9709794, -0.1175062, 1.119127, 0.945098, 0, 1, 1,
0.9729908, -1.766706, 3.167263, 0.9490196, 0, 1, 1,
0.9758891, -1.051376, 2.838804, 0.9568627, 0, 1, 1,
0.9770177, -0.39436, 1.357805, 0.9607843, 0, 1, 1,
0.9858581, 1.161953, 0.8302612, 0.9686275, 0, 1, 1,
0.9891931, -0.3514846, 2.884601, 0.972549, 0, 1, 1,
0.9899181, -0.57401, 0.8774033, 0.9803922, 0, 1, 1,
0.9934011, 1.563378, 0.4827522, 0.9843137, 0, 1, 1,
0.9970856, 0.3310863, 2.85693, 0.9921569, 0, 1, 1,
1.000561, -0.06217619, 1.371878, 0.9960784, 0, 1, 1,
1.005018, 0.4110661, 0.6628962, 1, 0, 0.9960784, 1,
1.005508, 0.6747259, 1.55015, 1, 0, 0.9882353, 1,
1.006299, -1.651662, 1.657411, 1, 0, 0.9843137, 1,
1.008614, -0.3274521, 2.222036, 1, 0, 0.9764706, 1,
1.017325, 1.190469, 1.718725, 1, 0, 0.972549, 1,
1.018339, 0.1587355, 2.639511, 1, 0, 0.9647059, 1,
1.019932, -1.026167, 3.1681, 1, 0, 0.9607843, 1,
1.023659, -0.1271684, 2.987368, 1, 0, 0.9529412, 1,
1.026504, 0.1316682, 0.5588974, 1, 0, 0.9490196, 1,
1.026546, -1.681423, 1.888721, 1, 0, 0.9411765, 1,
1.037362, 0.8698537, 0.370164, 1, 0, 0.9372549, 1,
1.039332, -0.9217963, 1.209597, 1, 0, 0.9294118, 1,
1.046715, -0.194657, 2.341852, 1, 0, 0.9254902, 1,
1.048865, 1.495349, 0.6354305, 1, 0, 0.9176471, 1,
1.071404, 0.6481849, 0.6112857, 1, 0, 0.9137255, 1,
1.075517, -0.8525942, 2.884253, 1, 0, 0.9058824, 1,
1.077133, 0.001170882, 1.60338, 1, 0, 0.9019608, 1,
1.077369, 0.3773954, 0.3242749, 1, 0, 0.8941177, 1,
1.088328, 2.056997, 0.07184159, 1, 0, 0.8862745, 1,
1.089064, -1.464963, 3.268736, 1, 0, 0.8823529, 1,
1.08909, -0.7133514, 2.598405, 1, 0, 0.8745098, 1,
1.092299, 1.656987, -0.9316745, 1, 0, 0.8705882, 1,
1.092931, -0.137996, 0.4949092, 1, 0, 0.8627451, 1,
1.105825, -1.857225, 2.483757, 1, 0, 0.8588235, 1,
1.11068, 1.57425, 0.1311831, 1, 0, 0.8509804, 1,
1.118023, -0.4251607, 1.535181, 1, 0, 0.8470588, 1,
1.123258, 0.6736705, 1.644572, 1, 0, 0.8392157, 1,
1.135149, -0.8140789, 1.74905, 1, 0, 0.8352941, 1,
1.139274, 0.3248301, 2.542854, 1, 0, 0.827451, 1,
1.149169, -0.7203149, 2.144053, 1, 0, 0.8235294, 1,
1.156156, 0.03477097, 3.985729, 1, 0, 0.8156863, 1,
1.157419, -2.488482, 2.318065, 1, 0, 0.8117647, 1,
1.172057, -0.3020832, 1.709715, 1, 0, 0.8039216, 1,
1.173844, -0.4318015, 3.341541, 1, 0, 0.7960784, 1,
1.179552, 0.07566053, 1.302348, 1, 0, 0.7921569, 1,
1.180055, -0.5012253, 0.7130336, 1, 0, 0.7843137, 1,
1.184158, 1.33355, 0.9700443, 1, 0, 0.7803922, 1,
1.187037, -0.4475008, 1.671787, 1, 0, 0.772549, 1,
1.189698, 0.1004482, 1.615108, 1, 0, 0.7686275, 1,
1.190185, -0.2363834, 1.713143, 1, 0, 0.7607843, 1,
1.192434, -1.743564, 3.442129, 1, 0, 0.7568628, 1,
1.197767, 0.3944468, 0.7310125, 1, 0, 0.7490196, 1,
1.2045, 1.446845, 0.2345014, 1, 0, 0.7450981, 1,
1.204517, 0.7996966, 0.1866027, 1, 0, 0.7372549, 1,
1.211078, 0.4675385, 1.064003, 1, 0, 0.7333333, 1,
1.213665, 1.433661, 0.6972639, 1, 0, 0.7254902, 1,
1.216544, -1.858569, 4.16726, 1, 0, 0.7215686, 1,
1.219753, 0.02017586, 1.206722, 1, 0, 0.7137255, 1,
1.220096, 0.007111845, 0.0002501632, 1, 0, 0.7098039, 1,
1.223024, 0.7706608, 0.9754274, 1, 0, 0.7019608, 1,
1.225198, 0.7973201, 1.078218, 1, 0, 0.6941177, 1,
1.22591, -1.230121, 2.979248, 1, 0, 0.6901961, 1,
1.229354, 0.93591, 2.341022, 1, 0, 0.682353, 1,
1.229384, 0.1843139, 1.727156, 1, 0, 0.6784314, 1,
1.23981, -0.1364509, 2.014315, 1, 0, 0.6705883, 1,
1.245276, 0.6109958, -0.7439173, 1, 0, 0.6666667, 1,
1.245971, -0.4869468, 2.039097, 1, 0, 0.6588235, 1,
1.246562, 1.157105, 1.151902, 1, 0, 0.654902, 1,
1.253483, 0.4592305, 2.274461, 1, 0, 0.6470588, 1,
1.254154, 0.5125191, 0.5449257, 1, 0, 0.6431373, 1,
1.258287, 0.9127861, 0.6571307, 1, 0, 0.6352941, 1,
1.259948, -1.16321, 1.291806, 1, 0, 0.6313726, 1,
1.260842, 1.257385, 2.403823, 1, 0, 0.6235294, 1,
1.261903, 1.301264, 1.489353, 1, 0, 0.6196079, 1,
1.266989, 0.2845782, 0.1859567, 1, 0, 0.6117647, 1,
1.268569, -0.450673, 1.263396, 1, 0, 0.6078432, 1,
1.274381, 0.4868721, 2.722263, 1, 0, 0.6, 1,
1.27719, -0.4380169, 1.354746, 1, 0, 0.5921569, 1,
1.277525, -0.1832248, 2.152089, 1, 0, 0.5882353, 1,
1.281468, 1.474915, -0.2560658, 1, 0, 0.5803922, 1,
1.286549, -1.516359, 1.228353, 1, 0, 0.5764706, 1,
1.298535, 1.256015, 1.084817, 1, 0, 0.5686275, 1,
1.300999, -0.9984984, 2.738635, 1, 0, 0.5647059, 1,
1.306248, -0.06713392, 0.7380012, 1, 0, 0.5568628, 1,
1.318606, 0.423363, 0.8705819, 1, 0, 0.5529412, 1,
1.319919, 2.010441, 1.930123, 1, 0, 0.5450981, 1,
1.32852, -1.198429, 0.5934983, 1, 0, 0.5411765, 1,
1.329453, 0.5783614, 1.588026, 1, 0, 0.5333334, 1,
1.334001, -0.8163009, 0.770188, 1, 0, 0.5294118, 1,
1.338992, 1.698202, 0.04667374, 1, 0, 0.5215687, 1,
1.343728, -0.6943987, 1.723834, 1, 0, 0.5176471, 1,
1.349783, -0.5690528, 3.956764, 1, 0, 0.509804, 1,
1.360922, -0.6252196, 2.339447, 1, 0, 0.5058824, 1,
1.361006, 0.7679653, 1.029963, 1, 0, 0.4980392, 1,
1.362639, -1.383376, 3.054708, 1, 0, 0.4901961, 1,
1.363893, -1.868259, 3.682641, 1, 0, 0.4862745, 1,
1.376917, -1.66046, 3.556308, 1, 0, 0.4784314, 1,
1.381744, -0.4037681, 2.211192, 1, 0, 0.4745098, 1,
1.382928, -2.684562, 2.190382, 1, 0, 0.4666667, 1,
1.385238, -0.2643586, 1.716515, 1, 0, 0.4627451, 1,
1.388631, -0.0998864, 0.8434015, 1, 0, 0.454902, 1,
1.389312, -1.311414, 3.13637, 1, 0, 0.4509804, 1,
1.389398, -0.2111102, 1.69838, 1, 0, 0.4431373, 1,
1.393652, 1.228322, 0.02045279, 1, 0, 0.4392157, 1,
1.405254, 1.053806, 1.805553, 1, 0, 0.4313726, 1,
1.421001, 0.2977547, 0.2826401, 1, 0, 0.427451, 1,
1.429702, -0.3743372, 2.115345, 1, 0, 0.4196078, 1,
1.442405, -0.1135336, 2.18079, 1, 0, 0.4156863, 1,
1.450726, -1.875194, 1.443828, 1, 0, 0.4078431, 1,
1.470747, -2.176655, 4.238508, 1, 0, 0.4039216, 1,
1.472057, -0.1109285, 1.153594, 1, 0, 0.3960784, 1,
1.474113, -0.6867383, 2.297956, 1, 0, 0.3882353, 1,
1.476643, -1.060259, 2.138235, 1, 0, 0.3843137, 1,
1.497654, -0.1694967, 2.955552, 1, 0, 0.3764706, 1,
1.500434, 1.879851, 0.9680658, 1, 0, 0.372549, 1,
1.515452, 0.9622791, 3.471182, 1, 0, 0.3647059, 1,
1.523585, 0.1774377, 1.948318, 1, 0, 0.3607843, 1,
1.553577, -0.02164012, 0.5522618, 1, 0, 0.3529412, 1,
1.561825, 1.456802, -0.1262479, 1, 0, 0.3490196, 1,
1.566517, -0.9058052, 3.397043, 1, 0, 0.3411765, 1,
1.587795, -0.1711326, 1.588521, 1, 0, 0.3372549, 1,
1.590567, -0.8843763, 1.449748, 1, 0, 0.3294118, 1,
1.597959, 1.16812, 0.5383581, 1, 0, 0.3254902, 1,
1.609757, 0.6887105, 1.071939, 1, 0, 0.3176471, 1,
1.610888, -2.116749, 1.364104, 1, 0, 0.3137255, 1,
1.638668, -0.09936593, 2.630268, 1, 0, 0.3058824, 1,
1.65574, 0.0709059, 1.155583, 1, 0, 0.2980392, 1,
1.655983, -0.06571871, 0.8547659, 1, 0, 0.2941177, 1,
1.669014, -0.4816501, 1.716795, 1, 0, 0.2862745, 1,
1.677006, -0.3116421, 0.6169885, 1, 0, 0.282353, 1,
1.696251, 0.01078478, 1.775071, 1, 0, 0.2745098, 1,
1.699268, -0.7158197, -0.7778137, 1, 0, 0.2705882, 1,
1.702503, -1.352947, 2.59058, 1, 0, 0.2627451, 1,
1.72499, -1.949735, 1.186971, 1, 0, 0.2588235, 1,
1.726766, 0.1788277, 0.9133821, 1, 0, 0.2509804, 1,
1.738044, 1.186459, -0.6395616, 1, 0, 0.2470588, 1,
1.75019, 1.052286, 1.244805, 1, 0, 0.2392157, 1,
1.752408, -1.614907, 2.326528, 1, 0, 0.2352941, 1,
1.761115, 0.2953277, 1.401756, 1, 0, 0.227451, 1,
1.793034, 0.07179814, 2.728709, 1, 0, 0.2235294, 1,
1.834823, -0.06166345, 0.8520947, 1, 0, 0.2156863, 1,
1.86524, -1.577519, 1.620426, 1, 0, 0.2117647, 1,
1.871269, 1.394337, 1.860097, 1, 0, 0.2039216, 1,
1.899851, -2.211056, 4.230186, 1, 0, 0.1960784, 1,
1.916925, 0.3387541, 2.464065, 1, 0, 0.1921569, 1,
1.918542, 1.670624, 0.7339094, 1, 0, 0.1843137, 1,
1.920787, 0.548977, 1.639426, 1, 0, 0.1803922, 1,
1.928323, 0.08395533, 2.445204, 1, 0, 0.172549, 1,
1.930276, -0.003747869, 1.320142, 1, 0, 0.1686275, 1,
1.932768, 0.7910391, 0.1732669, 1, 0, 0.1607843, 1,
1.946118, 2.045884, -0.8785549, 1, 0, 0.1568628, 1,
1.956467, 0.582501, 1.156816, 1, 0, 0.1490196, 1,
1.960018, -1.41634, 3.798428, 1, 0, 0.145098, 1,
1.96955, -0.4370417, 1.852818, 1, 0, 0.1372549, 1,
2.003235, 0.7599241, 0.3857715, 1, 0, 0.1333333, 1,
2.011236, -1.476237, 2.63013, 1, 0, 0.1254902, 1,
2.032008, -1.229601, 1.054988, 1, 0, 0.1215686, 1,
2.064146, 0.1278899, 0.8859568, 1, 0, 0.1137255, 1,
2.114783, 0.8733804, 2.650263, 1, 0, 0.1098039, 1,
2.155504, 1.90523, 1.556679, 1, 0, 0.1019608, 1,
2.156497, 0.04149679, 0.870554, 1, 0, 0.09411765, 1,
2.160243, -1.312063, 2.796661, 1, 0, 0.09019608, 1,
2.160914, 1.164239, 0.8960157, 1, 0, 0.08235294, 1,
2.26764, -0.3135454, 0.2315306, 1, 0, 0.07843138, 1,
2.275079, -0.5364466, 0.6015044, 1, 0, 0.07058824, 1,
2.316782, -2.476688, 2.646465, 1, 0, 0.06666667, 1,
2.320982, -0.7642891, 1.06807, 1, 0, 0.05882353, 1,
2.332252, 1.181125, 0.9536194, 1, 0, 0.05490196, 1,
2.432035, -0.4239362, 3.81413, 1, 0, 0.04705882, 1,
2.436231, 1.081586, 0.8193692, 1, 0, 0.04313726, 1,
2.523002, 0.3544049, 3.891745, 1, 0, 0.03529412, 1,
2.542731, -0.5172692, 2.324483, 1, 0, 0.03137255, 1,
2.598239, -0.6205342, 2.649991, 1, 0, 0.02352941, 1,
2.769488, -0.09433843, 2.556275, 1, 0, 0.01960784, 1,
2.828648, -0.7004665, 1.80875, 1, 0, 0.01176471, 1,
2.985266, -0.3902642, 0.2798657, 1, 0, 0.007843138, 1
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
-0.05915117, -4.072547, -7.832934, 0, -0.5, 0.5, 0.5,
-0.05915117, -4.072547, -7.832934, 1, -0.5, 0.5, 0.5,
-0.05915117, -4.072547, -7.832934, 1, 1.5, 0.5, 0.5,
-0.05915117, -4.072547, -7.832934, 0, 1.5, 0.5, 0.5
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
-4.135625, -0.003523588, -7.832934, 0, -0.5, 0.5, 0.5,
-4.135625, -0.003523588, -7.832934, 1, -0.5, 0.5, 0.5,
-4.135625, -0.003523588, -7.832934, 1, 1.5, 0.5, 0.5,
-4.135625, -0.003523588, -7.832934, 0, 1.5, 0.5, 0.5
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
-4.135625, -4.072547, -0.5851274, 0, -0.5, 0.5, 0.5,
-4.135625, -4.072547, -0.5851274, 1, -0.5, 0.5, 0.5,
-4.135625, -4.072547, -0.5851274, 1, 1.5, 0.5, 0.5,
-4.135625, -4.072547, -0.5851274, 0, 1.5, 0.5, 0.5
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
-3, -3.133542, -6.160363,
2, -3.133542, -6.160363,
-3, -3.133542, -6.160363,
-3, -3.290043, -6.439125,
-2, -3.133542, -6.160363,
-2, -3.290043, -6.439125,
-1, -3.133542, -6.160363,
-1, -3.290043, -6.439125,
0, -3.133542, -6.160363,
0, -3.290043, -6.439125,
1, -3.133542, -6.160363,
1, -3.290043, -6.439125,
2, -3.133542, -6.160363,
2, -3.290043, -6.439125
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
-3, -3.603045, -6.996649, 0, -0.5, 0.5, 0.5,
-3, -3.603045, -6.996649, 1, -0.5, 0.5, 0.5,
-3, -3.603045, -6.996649, 1, 1.5, 0.5, 0.5,
-3, -3.603045, -6.996649, 0, 1.5, 0.5, 0.5,
-2, -3.603045, -6.996649, 0, -0.5, 0.5, 0.5,
-2, -3.603045, -6.996649, 1, -0.5, 0.5, 0.5,
-2, -3.603045, -6.996649, 1, 1.5, 0.5, 0.5,
-2, -3.603045, -6.996649, 0, 1.5, 0.5, 0.5,
-1, -3.603045, -6.996649, 0, -0.5, 0.5, 0.5,
-1, -3.603045, -6.996649, 1, -0.5, 0.5, 0.5,
-1, -3.603045, -6.996649, 1, 1.5, 0.5, 0.5,
-1, -3.603045, -6.996649, 0, 1.5, 0.5, 0.5,
0, -3.603045, -6.996649, 0, -0.5, 0.5, 0.5,
0, -3.603045, -6.996649, 1, -0.5, 0.5, 0.5,
0, -3.603045, -6.996649, 1, 1.5, 0.5, 0.5,
0, -3.603045, -6.996649, 0, 1.5, 0.5, 0.5,
1, -3.603045, -6.996649, 0, -0.5, 0.5, 0.5,
1, -3.603045, -6.996649, 1, -0.5, 0.5, 0.5,
1, -3.603045, -6.996649, 1, 1.5, 0.5, 0.5,
1, -3.603045, -6.996649, 0, 1.5, 0.5, 0.5,
2, -3.603045, -6.996649, 0, -0.5, 0.5, 0.5,
2, -3.603045, -6.996649, 1, -0.5, 0.5, 0.5,
2, -3.603045, -6.996649, 1, 1.5, 0.5, 0.5,
2, -3.603045, -6.996649, 0, 1.5, 0.5, 0.5
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
-3.194901, -3, -6.160363,
-3.194901, 3, -6.160363,
-3.194901, -3, -6.160363,
-3.351688, -3, -6.439125,
-3.194901, -2, -6.160363,
-3.351688, -2, -6.439125,
-3.194901, -1, -6.160363,
-3.351688, -1, -6.439125,
-3.194901, 0, -6.160363,
-3.351688, 0, -6.439125,
-3.194901, 1, -6.160363,
-3.351688, 1, -6.439125,
-3.194901, 2, -6.160363,
-3.351688, 2, -6.439125,
-3.194901, 3, -6.160363,
-3.351688, 3, -6.439125
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
-3.665263, -3, -6.996649, 0, -0.5, 0.5, 0.5,
-3.665263, -3, -6.996649, 1, -0.5, 0.5, 0.5,
-3.665263, -3, -6.996649, 1, 1.5, 0.5, 0.5,
-3.665263, -3, -6.996649, 0, 1.5, 0.5, 0.5,
-3.665263, -2, -6.996649, 0, -0.5, 0.5, 0.5,
-3.665263, -2, -6.996649, 1, -0.5, 0.5, 0.5,
-3.665263, -2, -6.996649, 1, 1.5, 0.5, 0.5,
-3.665263, -2, -6.996649, 0, 1.5, 0.5, 0.5,
-3.665263, -1, -6.996649, 0, -0.5, 0.5, 0.5,
-3.665263, -1, -6.996649, 1, -0.5, 0.5, 0.5,
-3.665263, -1, -6.996649, 1, 1.5, 0.5, 0.5,
-3.665263, -1, -6.996649, 0, 1.5, 0.5, 0.5,
-3.665263, 0, -6.996649, 0, -0.5, 0.5, 0.5,
-3.665263, 0, -6.996649, 1, -0.5, 0.5, 0.5,
-3.665263, 0, -6.996649, 1, 1.5, 0.5, 0.5,
-3.665263, 0, -6.996649, 0, 1.5, 0.5, 0.5,
-3.665263, 1, -6.996649, 0, -0.5, 0.5, 0.5,
-3.665263, 1, -6.996649, 1, -0.5, 0.5, 0.5,
-3.665263, 1, -6.996649, 1, 1.5, 0.5, 0.5,
-3.665263, 1, -6.996649, 0, 1.5, 0.5, 0.5,
-3.665263, 2, -6.996649, 0, -0.5, 0.5, 0.5,
-3.665263, 2, -6.996649, 1, -0.5, 0.5, 0.5,
-3.665263, 2, -6.996649, 1, 1.5, 0.5, 0.5,
-3.665263, 2, -6.996649, 0, 1.5, 0.5, 0.5,
-3.665263, 3, -6.996649, 0, -0.5, 0.5, 0.5,
-3.665263, 3, -6.996649, 1, -0.5, 0.5, 0.5,
-3.665263, 3, -6.996649, 1, 1.5, 0.5, 0.5,
-3.665263, 3, -6.996649, 0, 1.5, 0.5, 0.5
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
-3.194901, -3.133542, -4,
-3.194901, -3.133542, 4,
-3.194901, -3.133542, -4,
-3.351688, -3.290043, -4,
-3.194901, -3.133542, -2,
-3.351688, -3.290043, -2,
-3.194901, -3.133542, 0,
-3.351688, -3.290043, 0,
-3.194901, -3.133542, 2,
-3.351688, -3.290043, 2,
-3.194901, -3.133542, 4,
-3.351688, -3.290043, 4
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
-3.665263, -3.603045, -4, 0, -0.5, 0.5, 0.5,
-3.665263, -3.603045, -4, 1, -0.5, 0.5, 0.5,
-3.665263, -3.603045, -4, 1, 1.5, 0.5, 0.5,
-3.665263, -3.603045, -4, 0, 1.5, 0.5, 0.5,
-3.665263, -3.603045, -2, 0, -0.5, 0.5, 0.5,
-3.665263, -3.603045, -2, 1, -0.5, 0.5, 0.5,
-3.665263, -3.603045, -2, 1, 1.5, 0.5, 0.5,
-3.665263, -3.603045, -2, 0, 1.5, 0.5, 0.5,
-3.665263, -3.603045, 0, 0, -0.5, 0.5, 0.5,
-3.665263, -3.603045, 0, 1, -0.5, 0.5, 0.5,
-3.665263, -3.603045, 0, 1, 1.5, 0.5, 0.5,
-3.665263, -3.603045, 0, 0, 1.5, 0.5, 0.5,
-3.665263, -3.603045, 2, 0, -0.5, 0.5, 0.5,
-3.665263, -3.603045, 2, 1, -0.5, 0.5, 0.5,
-3.665263, -3.603045, 2, 1, 1.5, 0.5, 0.5,
-3.665263, -3.603045, 2, 0, 1.5, 0.5, 0.5,
-3.665263, -3.603045, 4, 0, -0.5, 0.5, 0.5,
-3.665263, -3.603045, 4, 1, -0.5, 0.5, 0.5,
-3.665263, -3.603045, 4, 1, 1.5, 0.5, 0.5,
-3.665263, -3.603045, 4, 0, 1.5, 0.5, 0.5
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
-3.194901, -3.133542, -6.160363,
-3.194901, 3.126495, -6.160363,
-3.194901, -3.133542, 4.990108,
-3.194901, 3.126495, 4.990108,
-3.194901, -3.133542, -6.160363,
-3.194901, -3.133542, 4.990108,
-3.194901, 3.126495, -6.160363,
-3.194901, 3.126495, 4.990108,
-3.194901, -3.133542, -6.160363,
3.076598, -3.133542, -6.160363,
-3.194901, -3.133542, 4.990108,
3.076598, -3.133542, 4.990108,
-3.194901, 3.126495, -6.160363,
3.076598, 3.126495, -6.160363,
-3.194901, 3.126495, 4.990108,
3.076598, 3.126495, 4.990108,
3.076598, -3.133542, -6.160363,
3.076598, 3.126495, -6.160363,
3.076598, -3.133542, 4.990108,
3.076598, 3.126495, 4.990108,
3.076598, -3.133542, -6.160363,
3.076598, -3.133542, 4.990108,
3.076598, 3.126495, -6.160363,
3.076598, 3.126495, 4.990108
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
var radius = 7.605293;
var distance = 33.83681;
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
mvMatrix.translate( 0.05915117, 0.003523588, 0.5851274 );
mvMatrix.scale( 1.311169, 1.313569, 0.7374569 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.83681);
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
calcium_arsenate_tri<-read.table("calcium_arsenate_tri.xyz")
```

```
## Error in read.table("calcium_arsenate_tri.xyz"): no lines available in input
```

```r
x<-calcium_arsenate_tri$V2
```

```
## Error in eval(expr, envir, enclos): object 'calcium_arsenate_tri' not found
```

```r
y<-calcium_arsenate_tri$V3
```

```
## Error in eval(expr, envir, enclos): object 'calcium_arsenate_tri' not found
```

```r
z<-calcium_arsenate_tri$V4
```

```
## Error in eval(expr, envir, enclos): object 'calcium_arsenate_tri' not found
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
-3.103568, 1.157269, -1.015062, 0, 0, 1, 1, 1,
-2.899503, -1.925972, -2.139014, 1, 0, 0, 1, 1,
-2.805853, 0.8427051, 0.00427069, 1, 0, 0, 1, 1,
-2.728642, 0.1065216, -1.323528, 1, 0, 0, 1, 1,
-2.709948, -1.859001, -2.532186, 1, 0, 0, 1, 1,
-2.675948, 0.2329787, -0.9286383, 1, 0, 0, 1, 1,
-2.491472, 1.058331, 0.7951713, 0, 0, 0, 1, 1,
-2.487127, -0.05281497, -0.9277472, 0, 0, 0, 1, 1,
-2.390217, -1.45516, -3.110004, 0, 0, 0, 1, 1,
-2.376189, -2.09234, -3.408038, 0, 0, 0, 1, 1,
-2.357579, 0.1412253, 0.5850811, 0, 0, 0, 1, 1,
-2.28727, -0.3159557, -1.641623, 0, 0, 0, 1, 1,
-2.188693, 0.5697361, -1.225528, 0, 0, 0, 1, 1,
-2.187023, -0.4808769, -1.622887, 1, 1, 1, 1, 1,
-2.182938, 1.073967, -1.715568, 1, 1, 1, 1, 1,
-2.163658, -0.3421371, -1.213393, 1, 1, 1, 1, 1,
-2.134451, 0.06223801, -0.9373509, 1, 1, 1, 1, 1,
-2.130646, 0.3246109, -1.834143, 1, 1, 1, 1, 1,
-2.057557, 0.04660577, -0.2318295, 1, 1, 1, 1, 1,
-2.051265, -0.7934294, -3.500596, 1, 1, 1, 1, 1,
-2.033257, 1.91081, -0.07134493, 1, 1, 1, 1, 1,
-2.029786, 0.4961961, -1.657266, 1, 1, 1, 1, 1,
-2.028399, -1.558574, -1.833236, 1, 1, 1, 1, 1,
-2.000918, 3.035329, 2.334804, 1, 1, 1, 1, 1,
-1.970111, -0.2224238, -0.7311381, 1, 1, 1, 1, 1,
-1.918837, 1.376136, -1.350681, 1, 1, 1, 1, 1,
-1.876581, -0.6016225, -3.258122, 1, 1, 1, 1, 1,
-1.868624, -0.401925, -1.88726, 1, 1, 1, 1, 1,
-1.868541, 1.167296, -1.95115, 0, 0, 1, 1, 1,
-1.852061, 1.660535, -3.178591, 1, 0, 0, 1, 1,
-1.851822, 0.9708009, -1.202242, 1, 0, 0, 1, 1,
-1.832947, 0.1858102, -0.03741871, 1, 0, 0, 1, 1,
-1.831573, 0.8309957, -1.000426, 1, 0, 0, 1, 1,
-1.827328, -1.593972, -2.850565, 1, 0, 0, 1, 1,
-1.81982, -0.4796779, -4.054363, 0, 0, 0, 1, 1,
-1.813913, 0.4746306, -2.400538, 0, 0, 0, 1, 1,
-1.811925, 0.2251723, -0.6161952, 0, 0, 0, 1, 1,
-1.808708, -1.170455, -2.215242, 0, 0, 0, 1, 1,
-1.781037, -1.12316, -3.685848, 0, 0, 0, 1, 1,
-1.774429, 0.2060326, -0.7004616, 0, 0, 0, 1, 1,
-1.742992, -2.09686, -2.956724, 0, 0, 0, 1, 1,
-1.715029, 1.439201, -0.2588188, 1, 1, 1, 1, 1,
-1.710881, -0.301502, -1.835017, 1, 1, 1, 1, 1,
-1.69669, 1.302085, -1.056064, 1, 1, 1, 1, 1,
-1.68353, -0.3738801, -1.958669, 1, 1, 1, 1, 1,
-1.682285, 0.5612125, -1.546789, 1, 1, 1, 1, 1,
-1.676537, -0.6091708, -1.110837, 1, 1, 1, 1, 1,
-1.674632, -0.9002627, -1.936326, 1, 1, 1, 1, 1,
-1.663392, -0.2828611, -1.918811, 1, 1, 1, 1, 1,
-1.655673, 0.5147212, -0.9499046, 1, 1, 1, 1, 1,
-1.630529, 0.4663429, -1.9509, 1, 1, 1, 1, 1,
-1.62454, -0.3456216, -0.9670458, 1, 1, 1, 1, 1,
-1.62345, 0.6112621, -1.154395, 1, 1, 1, 1, 1,
-1.571593, 1.131089, 1.047289, 1, 1, 1, 1, 1,
-1.564844, 0.1865878, -3.334124, 1, 1, 1, 1, 1,
-1.552057, -0.4102422, -2.713541, 1, 1, 1, 1, 1,
-1.537462, 1.899835, -1.052494, 0, 0, 1, 1, 1,
-1.515431, 0.8409972, -1.781911, 1, 0, 0, 1, 1,
-1.508799, 0.4924461, -2.081508, 1, 0, 0, 1, 1,
-1.500626, 1.023112, -1.211363, 1, 0, 0, 1, 1,
-1.490847, 0.5824081, -0.820278, 1, 0, 0, 1, 1,
-1.477737, 1.160073, -1.35465, 1, 0, 0, 1, 1,
-1.461382, 1.116992, -1.170272, 0, 0, 0, 1, 1,
-1.451866, 0.103157, 0.07091261, 0, 0, 0, 1, 1,
-1.448286, 1.714594, -0.04692159, 0, 0, 0, 1, 1,
-1.446434, 0.3780773, 0.4670088, 0, 0, 0, 1, 1,
-1.431181, 1.665477, -2.091915, 0, 0, 0, 1, 1,
-1.429992, 0.5048763, -1.026708, 0, 0, 0, 1, 1,
-1.422592, -0.3756059, -0.9093853, 0, 0, 0, 1, 1,
-1.421932, 1.929786, -1.453157, 1, 1, 1, 1, 1,
-1.415691, 0.4904597, -2.315757, 1, 1, 1, 1, 1,
-1.399498, -0.972639, -3.653528, 1, 1, 1, 1, 1,
-1.378115, 0.4717693, -2.261986, 1, 1, 1, 1, 1,
-1.373328, -1.048334, -1.960177, 1, 1, 1, 1, 1,
-1.364944, -0.8398745, -1.482586, 1, 1, 1, 1, 1,
-1.363927, 0.449571, -3.494851, 1, 1, 1, 1, 1,
-1.36188, 0.2774299, -1.605548, 1, 1, 1, 1, 1,
-1.357768, -0.5736257, -5.269922, 1, 1, 1, 1, 1,
-1.355672, 1.010194, -0.3435247, 1, 1, 1, 1, 1,
-1.348525, 1.023032, -0.7060787, 1, 1, 1, 1, 1,
-1.346932, -0.1791911, -3.109129, 1, 1, 1, 1, 1,
-1.345729, -1.029326, -2.975421, 1, 1, 1, 1, 1,
-1.344768, 1.46366, -0.18818, 1, 1, 1, 1, 1,
-1.338534, -1.246461, -1.370518, 1, 1, 1, 1, 1,
-1.329656, -0.003894387, -1.452284, 0, 0, 1, 1, 1,
-1.31484, -1.178196, -1.422938, 1, 0, 0, 1, 1,
-1.312109, 0.6762667, -0.6312506, 1, 0, 0, 1, 1,
-1.308798, -0.8874618, -2.84557, 1, 0, 0, 1, 1,
-1.298833, 0.8917917, -1.572107, 1, 0, 0, 1, 1,
-1.297376, -0.02549694, -0.9094477, 1, 0, 0, 1, 1,
-1.291587, -1.558661, -3.274547, 0, 0, 0, 1, 1,
-1.288973, -0.4007921, -3.423529, 0, 0, 0, 1, 1,
-1.275356, 0.7733665, -1.901876, 0, 0, 0, 1, 1,
-1.274766, 0.895121, 0.6906841, 0, 0, 0, 1, 1,
-1.272837, -0.9671025, -3.496304, 0, 0, 0, 1, 1,
-1.272384, -0.3965414, -1.351385, 0, 0, 0, 1, 1,
-1.271208, -1.371855, -2.030383, 0, 0, 0, 1, 1,
-1.270391, -0.5104436, -2.392097, 1, 1, 1, 1, 1,
-1.248121, -0.04724638, -1.637798, 1, 1, 1, 1, 1,
-1.247338, -0.1461141, -1.799004, 1, 1, 1, 1, 1,
-1.2407, 1.275425, 0.2151217, 1, 1, 1, 1, 1,
-1.240285, 2.086706, -0.03828532, 1, 1, 1, 1, 1,
-1.238909, 0.03112677, -1.965066, 1, 1, 1, 1, 1,
-1.238158, 0.0902749, -0.1944312, 1, 1, 1, 1, 1,
-1.235072, 0.1163525, -2.307779, 1, 1, 1, 1, 1,
-1.233344, 0.05240209, 0.1724146, 1, 1, 1, 1, 1,
-1.224761, -1.068837, -4.07736, 1, 1, 1, 1, 1,
-1.221245, -1.693869, -3.511277, 1, 1, 1, 1, 1,
-1.218668, 0.9486492, -0.3195355, 1, 1, 1, 1, 1,
-1.209221, -2.358552, -2.829129, 1, 1, 1, 1, 1,
-1.206351, 0.4142555, -2.499614, 1, 1, 1, 1, 1,
-1.200047, -1.600525, -2.706098, 1, 1, 1, 1, 1,
-1.197682, 0.9679806, -0.01673529, 0, 0, 1, 1, 1,
-1.196346, 0.2536362, -0.751175, 1, 0, 0, 1, 1,
-1.188291, 0.02212442, -2.945882, 1, 0, 0, 1, 1,
-1.181336, 1.598205, -0.09562935, 1, 0, 0, 1, 1,
-1.168575, 1.593557, 1.385694, 1, 0, 0, 1, 1,
-1.155541, 3.021409, -1.022776, 1, 0, 0, 1, 1,
-1.155393, -0.5790544, -0.8750693, 0, 0, 0, 1, 1,
-1.148744, 0.7263013, 0.9839991, 0, 0, 0, 1, 1,
-1.148596, 2.045787, 0.6316147, 0, 0, 0, 1, 1,
-1.126334, 0.255933, -0.9584763, 0, 0, 0, 1, 1,
-1.125519, -1.593468, -1.305602, 0, 0, 0, 1, 1,
-1.122725, -2.070196, -3.916003, 0, 0, 0, 1, 1,
-1.119433, 0.7681795, -0.5032093, 0, 0, 0, 1, 1,
-1.111636, 1.335459, 0.6627464, 1, 1, 1, 1, 1,
-1.097551, 2.016904, -1.499458, 1, 1, 1, 1, 1,
-1.089364, -0.4488265, -1.917014, 1, 1, 1, 1, 1,
-1.085331, 1.507579, -0.3118394, 1, 1, 1, 1, 1,
-1.085204, -0.5634281, -2.573822, 1, 1, 1, 1, 1,
-1.080895, -0.5379085, -3.06603, 1, 1, 1, 1, 1,
-1.075145, -1.532323, -2.525822, 1, 1, 1, 1, 1,
-1.071968, -0.4303857, -0.5277555, 1, 1, 1, 1, 1,
-1.06878, 0.06582119, -0.3276148, 1, 1, 1, 1, 1,
-1.067884, -0.8249475, -1.763254, 1, 1, 1, 1, 1,
-1.061932, -1.635226, -2.820918, 1, 1, 1, 1, 1,
-1.054088, -0.7584887, -1.322544, 1, 1, 1, 1, 1,
-1.039069, -0.02516978, -1.403123, 1, 1, 1, 1, 1,
-1.038046, -0.09908973, -0.1907027, 1, 1, 1, 1, 1,
-1.034407, 0.8281276, -1.15397, 1, 1, 1, 1, 1,
-1.029683, 1.267222, -2.648021, 0, 0, 1, 1, 1,
-1.02492, 0.210306, -2.08013, 1, 0, 0, 1, 1,
-1.017354, 0.981641, -0.2238613, 1, 0, 0, 1, 1,
-1.013399, 0.2808607, -0.7332917, 1, 0, 0, 1, 1,
-1.011485, 0.3451269, -2.433056, 1, 0, 0, 1, 1,
-0.9997918, -0.1715647, -2.680918, 1, 0, 0, 1, 1,
-0.9853466, -1.279711, -1.401162, 0, 0, 0, 1, 1,
-0.9850875, -0.7511156, -2.281099, 0, 0, 0, 1, 1,
-0.9794194, 0.280755, -2.434988, 0, 0, 0, 1, 1,
-0.9775448, -0.4946581, -0.6480055, 0, 0, 0, 1, 1,
-0.9735291, 1.484778, -0.6231097, 0, 0, 0, 1, 1,
-0.9713228, -0.4795184, -2.230807, 0, 0, 0, 1, 1,
-0.9683298, 1.385107, -0.8426706, 0, 0, 0, 1, 1,
-0.9623832, -0.1381988, -2.087047, 1, 1, 1, 1, 1,
-0.9613096, -0.09275055, -2.838429, 1, 1, 1, 1, 1,
-0.9549943, -0.8674052, -2.280762, 1, 1, 1, 1, 1,
-0.9489129, -1.312285, -3.949655, 1, 1, 1, 1, 1,
-0.939169, 1.614841, -0.6091864, 1, 1, 1, 1, 1,
-0.9372378, 0.397666, -0.6957492, 1, 1, 1, 1, 1,
-0.9352002, 1.051517, -0.7562997, 1, 1, 1, 1, 1,
-0.9338403, -0.5958658, -3.215205, 1, 1, 1, 1, 1,
-0.9330734, -0.1545529, -3.159173, 1, 1, 1, 1, 1,
-0.9312762, 0.6859673, -2.434225, 1, 1, 1, 1, 1,
-0.9298025, -0.02732791, -1.07801, 1, 1, 1, 1, 1,
-0.9289549, 0.250228, -1.567351, 1, 1, 1, 1, 1,
-0.9263107, 1.603748, 0.1542886, 1, 1, 1, 1, 1,
-0.925939, -0.9048354, -3.575708, 1, 1, 1, 1, 1,
-0.9216608, 0.447502, -0.26184, 1, 1, 1, 1, 1,
-0.9210774, 2.299683, 1.278269, 0, 0, 1, 1, 1,
-0.9208139, -0.9557434, -2.804596, 1, 0, 0, 1, 1,
-0.9174057, -0.7822698, -2.157928, 1, 0, 0, 1, 1,
-0.9159811, 0.3667054, -1.440376, 1, 0, 0, 1, 1,
-0.9155223, -0.9527699, -3.43353, 1, 0, 0, 1, 1,
-0.9153854, 0.1013222, -0.3052177, 1, 0, 0, 1, 1,
-0.9100872, -0.1200357, -2.446609, 0, 0, 0, 1, 1,
-0.9074324, -0.9147211, -1.316391, 0, 0, 0, 1, 1,
-0.9044538, -0.6149715, -1.657894, 0, 0, 0, 1, 1,
-0.9000053, 0.6273907, -2.327658, 0, 0, 0, 1, 1,
-0.8947843, -1.210713, -3.103332, 0, 0, 0, 1, 1,
-0.8883071, 0.5509012, 0.001002499, 0, 0, 0, 1, 1,
-0.8829901, 0.8840076, -0.2229798, 0, 0, 0, 1, 1,
-0.8798961, -1.643869, -3.215955, 1, 1, 1, 1, 1,
-0.8794149, 0.3899778, 0.1293683, 1, 1, 1, 1, 1,
-0.8786548, 0.5667331, -1.711586, 1, 1, 1, 1, 1,
-0.8727196, 0.2373412, -0.006355409, 1, 1, 1, 1, 1,
-0.869661, 0.6908551, -0.439503, 1, 1, 1, 1, 1,
-0.8679404, -0.3391418, -2.982669, 1, 1, 1, 1, 1,
-0.8666919, 1.279242, -1.569802, 1, 1, 1, 1, 1,
-0.8560373, 0.0999856, 0.6354511, 1, 1, 1, 1, 1,
-0.8538781, -0.1173545, -2.447091, 1, 1, 1, 1, 1,
-0.8533313, 0.6709992, -1.595591, 1, 1, 1, 1, 1,
-0.8476343, -1.310693, -2.992544, 1, 1, 1, 1, 1,
-0.8459403, 0.6688857, 0.1718382, 1, 1, 1, 1, 1,
-0.8447539, -0.4647064, -1.81768, 1, 1, 1, 1, 1,
-0.8437769, 0.1707821, -2.106529, 1, 1, 1, 1, 1,
-0.8320976, 0.351593, -0.863724, 1, 1, 1, 1, 1,
-0.8294482, 0.6239107, -1.896885, 0, 0, 1, 1, 1,
-0.8236894, 0.009760823, -2.972236, 1, 0, 0, 1, 1,
-0.8225964, 0.7181782, -0.1357368, 1, 0, 0, 1, 1,
-0.8177977, 0.4487422, -2.469156, 1, 0, 0, 1, 1,
-0.817278, -0.9982021, -3.373171, 1, 0, 0, 1, 1,
-0.8165067, -1.456019, -2.499586, 1, 0, 0, 1, 1,
-0.810532, 0.4058505, -1.488098, 0, 0, 0, 1, 1,
-0.8099258, -0.0909524, -1.078617, 0, 0, 0, 1, 1,
-0.7972783, -1.04972, -2.135128, 0, 0, 0, 1, 1,
-0.7971303, -0.1127535, -2.729629, 0, 0, 0, 1, 1,
-0.7942288, -2.365447, -4.55999, 0, 0, 0, 1, 1,
-0.7921785, 0.8326589, 0.9381307, 0, 0, 0, 1, 1,
-0.7854576, 0.789491, -0.4319477, 0, 0, 0, 1, 1,
-0.7829664, -1.536502, -4.205324, 1, 1, 1, 1, 1,
-0.7787129, 0.1473871, -1.942538, 1, 1, 1, 1, 1,
-0.7782217, -0.3472945, -1.211722, 1, 1, 1, 1, 1,
-0.7766783, 0.7993265, -0.9307296, 1, 1, 1, 1, 1,
-0.7754843, 1.09488, -0.3575665, 1, 1, 1, 1, 1,
-0.7747022, -0.8556544, -2.582883, 1, 1, 1, 1, 1,
-0.7719125, -0.1473883, -0.8594133, 1, 1, 1, 1, 1,
-0.7675678, 1.159204, -0.399171, 1, 1, 1, 1, 1,
-0.765687, -0.6672876, -2.728926, 1, 1, 1, 1, 1,
-0.7604985, -2.557463, -2.793952, 1, 1, 1, 1, 1,
-0.7571377, 0.05719498, -1.717384, 1, 1, 1, 1, 1,
-0.7556604, -0.6650366, -1.98133, 1, 1, 1, 1, 1,
-0.7514624, 0.1336169, -2.003236, 1, 1, 1, 1, 1,
-0.7497197, 0.8019169, -0.782797, 1, 1, 1, 1, 1,
-0.747043, 0.4123304, 1.019064, 1, 1, 1, 1, 1,
-0.7448131, 0.4367899, -2.240632, 0, 0, 1, 1, 1,
-0.7416126, -0.588512, -1.895343, 1, 0, 0, 1, 1,
-0.7345535, 0.2740177, -1.665449, 1, 0, 0, 1, 1,
-0.7285677, -0.7449355, -2.128915, 1, 0, 0, 1, 1,
-0.725448, -0.7088521, -2.918345, 1, 0, 0, 1, 1,
-0.7248777, -1.344964, -2.512836, 1, 0, 0, 1, 1,
-0.7244492, 0.5142539, -1.413428, 0, 0, 0, 1, 1,
-0.7225553, 0.04959177, -1.581395, 0, 0, 0, 1, 1,
-0.7224613, -1.382162, -0.2614719, 0, 0, 0, 1, 1,
-0.7160389, -2.465987, -3.41756, 0, 0, 0, 1, 1,
-0.7140619, 0.8415479, -0.9960932, 0, 0, 0, 1, 1,
-0.7130286, -0.368245, -1.145728, 0, 0, 0, 1, 1,
-0.7127641, -0.08102684, -0.8451809, 0, 0, 0, 1, 1,
-0.7110858, -1.057233, -2.554554, 1, 1, 1, 1, 1,
-0.7100722, 1.543508, -1.848499, 1, 1, 1, 1, 1,
-0.7093706, 0.778307, -0.5413146, 1, 1, 1, 1, 1,
-0.7040865, 1.907303, -0.8903108, 1, 1, 1, 1, 1,
-0.7019652, -2.264642, -3.038511, 1, 1, 1, 1, 1,
-0.7017155, -0.2891037, -0.3101115, 1, 1, 1, 1, 1,
-0.6978894, -0.007725141, -1.068617, 1, 1, 1, 1, 1,
-0.6943717, 1.513059, 1.769546, 1, 1, 1, 1, 1,
-0.6938356, -1.272419, -1.938174, 1, 1, 1, 1, 1,
-0.690322, -0.7640279, -2.396466, 1, 1, 1, 1, 1,
-0.6870545, -0.6942532, -2.119314, 1, 1, 1, 1, 1,
-0.6819256, 1.248007, -0.7782162, 1, 1, 1, 1, 1,
-0.6794326, 1.82823, 0.3441468, 1, 1, 1, 1, 1,
-0.6726241, -0.3167076, -1.678846, 1, 1, 1, 1, 1,
-0.6723104, -0.9710584, -1.810512, 1, 1, 1, 1, 1,
-0.6661747, -1.916768, -3.114237, 0, 0, 1, 1, 1,
-0.6649876, 0.2938667, -0.289195, 1, 0, 0, 1, 1,
-0.6565306, -0.4472535, -1.70238, 1, 0, 0, 1, 1,
-0.6542805, 0.6658939, -0.4921287, 1, 0, 0, 1, 1,
-0.6540517, -0.6090773, -1.629932, 1, 0, 0, 1, 1,
-0.6522712, 0.8336945, -2.220531, 1, 0, 0, 1, 1,
-0.6507459, -0.1970491, 0.200978, 0, 0, 0, 1, 1,
-0.6502446, -0.8322511, -2.665282, 0, 0, 0, 1, 1,
-0.6474381, -0.0323729, -0.1106789, 0, 0, 0, 1, 1,
-0.6463617, -1.572505, -2.9231, 0, 0, 0, 1, 1,
-0.6406175, 1.933311, -0.4507326, 0, 0, 0, 1, 1,
-0.6338565, -0.2257466, -0.2345822, 0, 0, 0, 1, 1,
-0.6337923, -0.8238248, -3.56952, 0, 0, 0, 1, 1,
-0.6325381, 0.1182034, 0.1519016, 1, 1, 1, 1, 1,
-0.6309157, 1.067128, -0.8484929, 1, 1, 1, 1, 1,
-0.6205333, 0.5882562, -1.335888, 1, 1, 1, 1, 1,
-0.6154891, 1.137154, -1.06232, 1, 1, 1, 1, 1,
-0.6127346, -1.738657, -3.020855, 1, 1, 1, 1, 1,
-0.6115582, -0.27125, -0.8769547, 1, 1, 1, 1, 1,
-0.608593, 0.5606842, 0.2857447, 1, 1, 1, 1, 1,
-0.6058948, 1.754895, 0.4727997, 1, 1, 1, 1, 1,
-0.6030375, -1.635898, -4.718282, 1, 1, 1, 1, 1,
-0.601104, 0.3765157, -2.516971, 1, 1, 1, 1, 1,
-0.585404, -0.9659098, -2.229807, 1, 1, 1, 1, 1,
-0.5828946, 0.8131018, -1.418379, 1, 1, 1, 1, 1,
-0.5774778, -1.34717, -0.6650925, 1, 1, 1, 1, 1,
-0.57533, -0.02643954, -0.6948394, 1, 1, 1, 1, 1,
-0.5703772, 0.1228044, -0.5682624, 1, 1, 1, 1, 1,
-0.5658019, -0.1751956, -2.97963, 0, 0, 1, 1, 1,
-0.5618755, -0.2697437, 0.1806023, 1, 0, 0, 1, 1,
-0.5605633, -0.4390755, -2.115698, 1, 0, 0, 1, 1,
-0.5595872, -0.1968331, -2.689023, 1, 0, 0, 1, 1,
-0.5557737, 0.5238094, 0.1232819, 1, 0, 0, 1, 1,
-0.5494431, -0.44402, -3.792712, 1, 0, 0, 1, 1,
-0.5478887, 0.2645927, -1.981751, 0, 0, 0, 1, 1,
-0.5347161, 1.157818, -0.6675534, 0, 0, 0, 1, 1,
-0.5339879, -0.6070653, -3.142107, 0, 0, 0, 1, 1,
-0.5328211, 0.2430473, 0.2395759, 0, 0, 0, 1, 1,
-0.530206, 1.797314, -1.862083, 0, 0, 0, 1, 1,
-0.5269871, 0.5428872, 0.01144002, 0, 0, 0, 1, 1,
-0.5209836, 0.1377693, -1.693673, 0, 0, 0, 1, 1,
-0.5166035, 0.7100782, -0.8647904, 1, 1, 1, 1, 1,
-0.515722, 0.0006029945, 0.2941441, 1, 1, 1, 1, 1,
-0.5120175, 2.685205, -0.5230613, 1, 1, 1, 1, 1,
-0.5081425, -0.1844614, -2.461596, 1, 1, 1, 1, 1,
-0.507153, 0.9024879, -0.08671526, 1, 1, 1, 1, 1,
-0.5054817, 0.4930154, -1.642198, 1, 1, 1, 1, 1,
-0.4945271, 0.0764742, -1.02516, 1, 1, 1, 1, 1,
-0.4897372, -0.2669078, -2.532385, 1, 1, 1, 1, 1,
-0.4883721, 1.934372, -1.004817, 1, 1, 1, 1, 1,
-0.4842793, -0.1398161, -3.752574, 1, 1, 1, 1, 1,
-0.4813985, 0.06131807, 0.003160871, 1, 1, 1, 1, 1,
-0.4754066, -0.706037, -3.38979, 1, 1, 1, 1, 1,
-0.4692301, -1.151519, -1.290214, 1, 1, 1, 1, 1,
-0.4683565, 0.83963, -0.976022, 1, 1, 1, 1, 1,
-0.4668671, -1.767616, -2.311598, 1, 1, 1, 1, 1,
-0.4601212, -1.80369, -2.90641, 0, 0, 1, 1, 1,
-0.4576668, 0.2734792, -0.3051002, 1, 0, 0, 1, 1,
-0.4552681, -1.535654, -3.373902, 1, 0, 0, 1, 1,
-0.4504203, 0.4755422, -0.2679559, 1, 0, 0, 1, 1,
-0.4462561, -3.042377, -3.890024, 1, 0, 0, 1, 1,
-0.4456398, 1.174798, -1.901518, 1, 0, 0, 1, 1,
-0.4415314, 0.5291417, -1.605523, 0, 0, 0, 1, 1,
-0.4377537, 0.2874482, -0.5868698, 0, 0, 0, 1, 1,
-0.4364746, 1.940038, 0.96517, 0, 0, 0, 1, 1,
-0.4358082, -0.936545, -2.114626, 0, 0, 0, 1, 1,
-0.4345935, 0.2265737, -0.3103116, 0, 0, 0, 1, 1,
-0.4307646, -0.6912214, -2.440204, 0, 0, 0, 1, 1,
-0.4301054, 0.9652365, 0.5983064, 0, 0, 0, 1, 1,
-0.4278409, -0.7316244, -1.400539, 1, 1, 1, 1, 1,
-0.4257861, 0.7962868, 0.06779896, 1, 1, 1, 1, 1,
-0.4247318, 0.4579231, -1.406685, 1, 1, 1, 1, 1,
-0.4227337, -0.5010719, -2.124106, 1, 1, 1, 1, 1,
-0.4226654, -1.007508, -1.994278, 1, 1, 1, 1, 1,
-0.4190696, -1.442758, -3.306367, 1, 1, 1, 1, 1,
-0.4126008, 0.1291236, -2.420686, 1, 1, 1, 1, 1,
-0.4097745, -0.7942463, -3.180764, 1, 1, 1, 1, 1,
-0.4085234, -0.7600061, -1.375792, 1, 1, 1, 1, 1,
-0.3934922, 0.6188987, 1.167753, 1, 1, 1, 1, 1,
-0.3911763, -0.09556127, -2.925018, 1, 1, 1, 1, 1,
-0.3910998, 1.171815, -0.7957635, 1, 1, 1, 1, 1,
-0.3881724, -0.4102353, -1.450826, 1, 1, 1, 1, 1,
-0.3875747, -0.6491863, -2.766645, 1, 1, 1, 1, 1,
-0.3846601, -0.6020845, -1.834138, 1, 1, 1, 1, 1,
-0.3831356, 0.2953595, 0.06296016, 0, 0, 1, 1, 1,
-0.3816175, 0.01514772, -1.284324, 1, 0, 0, 1, 1,
-0.3785408, -0.7221449, -2.060359, 1, 0, 0, 1, 1,
-0.374844, 1.190689, -1.101308, 1, 0, 0, 1, 1,
-0.3727846, 0.002478164, -1.857311, 1, 0, 0, 1, 1,
-0.3720192, -2.208541, -3.192084, 1, 0, 0, 1, 1,
-0.3701768, 0.3504599, 1.445405, 0, 0, 0, 1, 1,
-0.3658218, 0.4369331, -0.5208194, 0, 0, 0, 1, 1,
-0.3639872, 1.969125, -0.2029811, 0, 0, 0, 1, 1,
-0.3621898, -1.743571, -2.650615, 0, 0, 0, 1, 1,
-0.3615304, -0.200555, -2.865056, 0, 0, 0, 1, 1,
-0.3610492, -1.322699, -3.833817, 0, 0, 0, 1, 1,
-0.3608818, 1.328113, -0.6086685, 0, 0, 0, 1, 1,
-0.3593047, 0.7039594, -1.409449, 1, 1, 1, 1, 1,
-0.3546891, 1.139353, 0.710986, 1, 1, 1, 1, 1,
-0.3493477, 1.817591, 0.2534862, 1, 1, 1, 1, 1,
-0.349213, -0.2814446, -1.385077, 1, 1, 1, 1, 1,
-0.3465799, 0.09576808, -0.8406255, 1, 1, 1, 1, 1,
-0.3413371, 0.7613015, -1.607019, 1, 1, 1, 1, 1,
-0.3413328, 0.6065751, 0.6234533, 1, 1, 1, 1, 1,
-0.3378098, 1.319814, -0.262046, 1, 1, 1, 1, 1,
-0.3359985, -0.03433637, -0.7324893, 1, 1, 1, 1, 1,
-0.3347381, -0.3244144, -2.192494, 1, 1, 1, 1, 1,
-0.3340615, 0.6814641, 1.022161, 1, 1, 1, 1, 1,
-0.3336707, -1.492376, -2.006231, 1, 1, 1, 1, 1,
-0.3315073, 0.01916121, -0.5921531, 1, 1, 1, 1, 1,
-0.331464, 0.3893521, -0.9301316, 1, 1, 1, 1, 1,
-0.3282233, 1.087336, -1.323197, 1, 1, 1, 1, 1,
-0.3279488, -0.240933, -0.9918438, 0, 0, 1, 1, 1,
-0.3253565, -0.538586, -1.847674, 1, 0, 0, 1, 1,
-0.3253501, -1.516401, -3.021176, 1, 0, 0, 1, 1,
-0.324611, -0.103655, -1.473504, 1, 0, 0, 1, 1,
-0.321656, 0.9572381, -1.253333, 1, 0, 0, 1, 1,
-0.3213207, -1.137481, -3.804778, 1, 0, 0, 1, 1,
-0.3211624, -0.4556825, -2.622319, 0, 0, 0, 1, 1,
-0.3196892, 0.2735415, -0.5538918, 0, 0, 0, 1, 1,
-0.3189264, 1.718202, 2.55319, 0, 0, 0, 1, 1,
-0.3188224, -2.663629, -2.199348, 0, 0, 0, 1, 1,
-0.3132562, -0.1975183, -1.98774, 0, 0, 0, 1, 1,
-0.3051753, -0.01085239, -0.9729447, 0, 0, 0, 1, 1,
-0.3033806, 0.324544, 0.2251899, 0, 0, 0, 1, 1,
-0.3032326, -0.5384346, -2.038769, 1, 1, 1, 1, 1,
-0.302609, 0.3276156, -2.427238, 1, 1, 1, 1, 1,
-0.3007244, -1.085845, -3.271921, 1, 1, 1, 1, 1,
-0.3005735, -1.788557, -2.665538, 1, 1, 1, 1, 1,
-0.2978712, 1.107623, -0.7542713, 1, 1, 1, 1, 1,
-0.2927362, -0.3665492, -2.575022, 1, 1, 1, 1, 1,
-0.2867171, -1.840145, -3.934144, 1, 1, 1, 1, 1,
-0.2850538, 0.4342328, 1.05867, 1, 1, 1, 1, 1,
-0.2835594, -0.01859759, -2.818443, 1, 1, 1, 1, 1,
-0.2827727, -0.9622634, -4.140459, 1, 1, 1, 1, 1,
-0.2817606, -0.04639287, -2.773854, 1, 1, 1, 1, 1,
-0.2776935, -0.2713577, -3.855215, 1, 1, 1, 1, 1,
-0.2758879, 0.2472888, 0.6249454, 1, 1, 1, 1, 1,
-0.2753932, -2.459224, -4.703833, 1, 1, 1, 1, 1,
-0.2722313, 0.5957533, 0.6948987, 1, 1, 1, 1, 1,
-0.2679597, -1.435472, -3.009516, 0, 0, 1, 1, 1,
-0.2658719, -1.237555, -1.997364, 1, 0, 0, 1, 1,
-0.2632066, 0.5233236, -1.306453, 1, 0, 0, 1, 1,
-0.2623778, 0.3430866, -2.098605, 1, 0, 0, 1, 1,
-0.2616529, -0.8033786, -3.150012, 1, 0, 0, 1, 1,
-0.2592824, -0.50363, -2.266288, 1, 0, 0, 1, 1,
-0.2566494, 1.091293, -1.380508, 0, 0, 0, 1, 1,
-0.2489865, 0.2896696, -1.11171, 0, 0, 0, 1, 1,
-0.2481537, 0.5023364, -1.156118, 0, 0, 0, 1, 1,
-0.2479894, -1.524509, -2.313595, 0, 0, 0, 1, 1,
-0.2478683, 2.830176, -0.8395871, 0, 0, 0, 1, 1,
-0.2460332, -0.06697793, -2.916555, 0, 0, 0, 1, 1,
-0.2439688, -0.6989015, -3.003992, 0, 0, 0, 1, 1,
-0.2434461, -0.06673311, -0.4511942, 1, 1, 1, 1, 1,
-0.2382296, 0.8046153, 0.6482589, 1, 1, 1, 1, 1,
-0.236287, 1.727352, -0.2822577, 1, 1, 1, 1, 1,
-0.2350523, -0.171261, -0.9112022, 1, 1, 1, 1, 1,
-0.2333911, -0.01177217, -0.1712394, 1, 1, 1, 1, 1,
-0.2286951, 1.168198, -0.8871416, 1, 1, 1, 1, 1,
-0.2205627, 0.92143, -0.9773658, 1, 1, 1, 1, 1,
-0.2171705, 0.1395307, -2.658904, 1, 1, 1, 1, 1,
-0.2097252, 1.158695, 0.7910739, 1, 1, 1, 1, 1,
-0.2092926, -0.9087999, -2.748895, 1, 1, 1, 1, 1,
-0.2068986, 1.166002, 0.4425918, 1, 1, 1, 1, 1,
-0.2066916, -0.4821036, -4.702099, 1, 1, 1, 1, 1,
-0.2052574, 0.2963058, -0.4414785, 1, 1, 1, 1, 1,
-0.2049767, 0.6882312, -1.826977, 1, 1, 1, 1, 1,
-0.2040012, 1.341003, 0.3524522, 1, 1, 1, 1, 1,
-0.2014379, -0.03158186, -2.334423, 0, 0, 1, 1, 1,
-0.2011921, -0.1356334, -2.19259, 1, 0, 0, 1, 1,
-0.1960348, -0.001830806, -0.8723233, 1, 0, 0, 1, 1,
-0.1889243, 0.3536942, -0.9936749, 1, 0, 0, 1, 1,
-0.1880401, 0.2134053, -0.9418054, 1, 0, 0, 1, 1,
-0.1863417, 1.504802, -0.1132562, 1, 0, 0, 1, 1,
-0.1862524, 0.4059935, -1.705733, 0, 0, 0, 1, 1,
-0.1859124, 0.5643777, -0.7932296, 0, 0, 0, 1, 1,
-0.1847378, 2.370851, 0.2697641, 0, 0, 0, 1, 1,
-0.1839273, -1.205414, -2.808356, 0, 0, 0, 1, 1,
-0.182593, -1.494068, -2.578661, 0, 0, 0, 1, 1,
-0.1815019, -1.199345, -3.794143, 0, 0, 0, 1, 1,
-0.1810415, -0.464149, -2.530708, 0, 0, 0, 1, 1,
-0.1716924, 1.0579, -0.04201385, 1, 1, 1, 1, 1,
-0.171206, 0.5509777, -0.5340451, 1, 1, 1, 1, 1,
-0.1692077, -0.9529728, -4.109335, 1, 1, 1, 1, 1,
-0.16646, 1.113456, 2.521243, 1, 1, 1, 1, 1,
-0.1661679, -2.515374, -2.090594, 1, 1, 1, 1, 1,
-0.1658317, -0.03076644, -1.383471, 1, 1, 1, 1, 1,
-0.1621163, 0.2263846, -0.7944413, 1, 1, 1, 1, 1,
-0.1609825, -0.8249499, -3.958555, 1, 1, 1, 1, 1,
-0.1587231, -1.131327, -5.52053, 1, 1, 1, 1, 1,
-0.1543996, -0.1912021, -3.836033, 1, 1, 1, 1, 1,
-0.1540756, -0.02003269, -0.1805147, 1, 1, 1, 1, 1,
-0.1537673, -0.4305558, -1.950541, 1, 1, 1, 1, 1,
-0.1508356, -0.3115808, -1.585859, 1, 1, 1, 1, 1,
-0.1481774, -0.2293468, -1.402988, 1, 1, 1, 1, 1,
-0.146951, 0.4505901, -0.67195, 1, 1, 1, 1, 1,
-0.1469424, 2.433141, -0.4124911, 0, 0, 1, 1, 1,
-0.144524, -0.5199173, -2.011398, 1, 0, 0, 1, 1,
-0.1443182, -0.6767112, -1.199662, 1, 0, 0, 1, 1,
-0.1407947, 0.6011806, -0.4280362, 1, 0, 0, 1, 1,
-0.1288867, -0.03959282, -1.453823, 1, 0, 0, 1, 1,
-0.1284867, 0.5799017, -0.8859404, 1, 0, 0, 1, 1,
-0.1223509, -0.4309157, -2.49988, 0, 0, 0, 1, 1,
-0.1214261, 1.495398, 2.030751, 0, 0, 0, 1, 1,
-0.120472, -2.626439, -3.40569, 0, 0, 0, 1, 1,
-0.1178253, -0.1868208, 0.2613091, 0, 0, 0, 1, 1,
-0.1165118, -0.509987, -3.306234, 0, 0, 0, 1, 1,
-0.1160038, 0.1230487, 0.0920662, 0, 0, 0, 1, 1,
-0.1147633, -0.3730401, -2.785883, 0, 0, 0, 1, 1,
-0.1116873, 1.041955, -0.7316982, 1, 1, 1, 1, 1,
-0.1109455, 0.9808502, -0.09515042, 1, 1, 1, 1, 1,
-0.1100796, -0.7944164, -3.062299, 1, 1, 1, 1, 1,
-0.1069392, -1.273497, -4.547115, 1, 1, 1, 1, 1,
-0.1017348, 1.029786, -1.116595, 1, 1, 1, 1, 1,
-0.1008302, 1.315275, -0.630787, 1, 1, 1, 1, 1,
-0.100287, -1.773221, -4.02071, 1, 1, 1, 1, 1,
-0.09814776, 0.1442887, -0.5606221, 1, 1, 1, 1, 1,
-0.09599526, -1.243197, -5.238775, 1, 1, 1, 1, 1,
-0.09572323, 0.3059871, -0.8810127, 1, 1, 1, 1, 1,
-0.09075792, -1.120312, -2.247282, 1, 1, 1, 1, 1,
-0.08787945, 0.266025, -1.527907, 1, 1, 1, 1, 1,
-0.08592284, -0.608497, -1.948252, 1, 1, 1, 1, 1,
-0.0845176, -0.1597886, -3.140153, 1, 1, 1, 1, 1,
-0.08421411, 1.21205, -1.067393, 1, 1, 1, 1, 1,
-0.08134331, 0.2673121, -0.4916231, 0, 0, 1, 1, 1,
-0.08049093, 0.2478282, -0.04889626, 1, 0, 0, 1, 1,
-0.08035177, -0.5203615, -3.571526, 1, 0, 0, 1, 1,
-0.07795031, -0.3409578, -0.4352612, 1, 0, 0, 1, 1,
-0.07537837, -0.5674199, -5.229355, 1, 0, 0, 1, 1,
-0.07409799, 0.431906, -2.302715, 1, 0, 0, 1, 1,
-0.07316542, -0.8682913, -4.387575, 0, 0, 0, 1, 1,
-0.07062408, 1.448605, -1.693917, 0, 0, 0, 1, 1,
-0.07054292, 0.1059752, -2.192956, 0, 0, 0, 1, 1,
-0.06962278, -1.150075, -2.46114, 0, 0, 0, 1, 1,
-0.06298514, -0.1243929, -1.761766, 0, 0, 0, 1, 1,
-0.0580373, -1.100695, -2.066815, 0, 0, 0, 1, 1,
-0.05794666, -0.04557059, -3.056535, 0, 0, 0, 1, 1,
-0.05636476, -1.419533, -2.068193, 1, 1, 1, 1, 1,
-0.05230929, 0.8093105, -1.198032, 1, 1, 1, 1, 1,
-0.04932001, 0.5081321, -0.9936679, 1, 1, 1, 1, 1,
-0.04651727, -0.9758262, -5.997978, 1, 1, 1, 1, 1,
-0.04241686, -0.2085538, -3.068742, 1, 1, 1, 1, 1,
-0.04063447, -0.5115945, -2.251157, 1, 1, 1, 1, 1,
-0.03655382, 1.365808, -0.2992172, 1, 1, 1, 1, 1,
-0.03304536, 0.7294394, 2.016459, 1, 1, 1, 1, 1,
-0.03109956, 0.9808841, 1.033807, 1, 1, 1, 1, 1,
-0.02777718, -1.869995, -3.686914, 1, 1, 1, 1, 1,
-0.01999001, -0.8325121, -1.313096, 1, 1, 1, 1, 1,
-0.01724758, 1.447726, 1.243743, 1, 1, 1, 1, 1,
-0.01658632, 0.07952853, -0.5303237, 1, 1, 1, 1, 1,
-0.01575886, 0.1704204, -0.7548469, 1, 1, 1, 1, 1,
-0.01168568, 0.006727275, 0.8550181, 1, 1, 1, 1, 1,
-0.009685618, 0.8616992, 0.6818738, 0, 0, 1, 1, 1,
-0.008725689, 0.9888323, -0.2179211, 1, 0, 0, 1, 1,
-0.0079582, -0.6783305, -3.270066, 1, 0, 0, 1, 1,
-0.004925583, 1.069185, 0.4372613, 1, 0, 0, 1, 1,
-0.001939588, 0.4927327, -0.7843115, 1, 0, 0, 1, 1,
-0.001703612, 0.6768711, 0.7745744, 1, 0, 0, 1, 1,
0.005487218, -0.1764941, 0.1191657, 0, 0, 0, 1, 1,
0.01005497, 1.292158, -1.159695, 0, 0, 0, 1, 1,
0.01684801, 1.672266, -0.2998536, 0, 0, 0, 1, 1,
0.01892255, -0.4470227, 1.215207, 0, 0, 0, 1, 1,
0.02112528, 0.3110725, -0.7756655, 0, 0, 0, 1, 1,
0.02163113, -0.982675, 2.880886, 0, 0, 0, 1, 1,
0.02212524, 0.8508133, 0.6366649, 0, 0, 0, 1, 1,
0.02594265, 0.386216, -0.7170981, 1, 1, 1, 1, 1,
0.03270594, -1.491294, 4.719141, 1, 1, 1, 1, 1,
0.03450925, 0.346288, 0.03233328, 1, 1, 1, 1, 1,
0.03620343, 1.036816, 0.01995459, 1, 1, 1, 1, 1,
0.04157687, -0.3611711, 4.827723, 1, 1, 1, 1, 1,
0.04204654, 1.103015, -1.629484, 1, 1, 1, 1, 1,
0.04396139, -0.2587924, 4.600263, 1, 1, 1, 1, 1,
0.04614329, 0.6583863, 0.4727951, 1, 1, 1, 1, 1,
0.04842147, 1.108878, -1.314221, 1, 1, 1, 1, 1,
0.04915962, 0.1040791, -0.4994893, 1, 1, 1, 1, 1,
0.04978216, 2.158971, -1.724205, 1, 1, 1, 1, 1,
0.05530908, 1.257974, 0.1184121, 1, 1, 1, 1, 1,
0.05880754, 0.5464011, 1.419557, 1, 1, 1, 1, 1,
0.06130012, -0.4350618, 1.729934, 1, 1, 1, 1, 1,
0.06130173, -0.1627831, 4.452333, 1, 1, 1, 1, 1,
0.06354776, -0.1535004, 2.894654, 0, 0, 1, 1, 1,
0.0639843, -1.162225, 2.525178, 1, 0, 0, 1, 1,
0.06664612, -0.4682383, 2.366977, 1, 0, 0, 1, 1,
0.06674695, 0.474234, 0.5833983, 1, 0, 0, 1, 1,
0.06718155, -1.372608, 3.976099, 1, 0, 0, 1, 1,
0.06736998, 0.754986, 0.5293864, 1, 0, 0, 1, 1,
0.06919757, -0.2127047, 2.694747, 0, 0, 0, 1, 1,
0.07406792, -0.9509337, 4.010312, 0, 0, 0, 1, 1,
0.08349731, -0.06009288, 2.980509, 0, 0, 0, 1, 1,
0.08481048, -0.9516943, 3.284599, 0, 0, 0, 1, 1,
0.09251671, 1.627517, -1.300236, 0, 0, 0, 1, 1,
0.09375317, -0.5539319, 2.617019, 0, 0, 0, 1, 1,
0.09444881, 0.4566637, 1.794284, 0, 0, 0, 1, 1,
0.09493791, -1.406968, 3.397577, 1, 1, 1, 1, 1,
0.09509341, -0.2280028, 3.501867, 1, 1, 1, 1, 1,
0.0970143, -1.85168, 3.043252, 1, 1, 1, 1, 1,
0.0986726, -0.1917257, 1.650417, 1, 1, 1, 1, 1,
0.1027758, 1.344593, -1.133559, 1, 1, 1, 1, 1,
0.1030913, 1.051073, -0.1914822, 1, 1, 1, 1, 1,
0.1077847, 2.758083, -0.8271787, 1, 1, 1, 1, 1,
0.1111946, -1.104161, 2.040087, 1, 1, 1, 1, 1,
0.1120865, 1.33083, 0.5884219, 1, 1, 1, 1, 1,
0.1130977, 0.3707522, 1.13039, 1, 1, 1, 1, 1,
0.1131332, -1.206055, 1.790499, 1, 1, 1, 1, 1,
0.1136941, 1.517209, -0.03085073, 1, 1, 1, 1, 1,
0.117265, 2.393071, 0.7682098, 1, 1, 1, 1, 1,
0.1174347, 1.09922, 1.469594, 1, 1, 1, 1, 1,
0.1226352, -0.4662299, 3.471119, 1, 1, 1, 1, 1,
0.1236565, 0.1019113, 1.412321, 0, 0, 1, 1, 1,
0.1244989, 0.1511617, -1.110599, 1, 0, 0, 1, 1,
0.1267685, -1.551578, 2.211106, 1, 0, 0, 1, 1,
0.1277014, -0.5500321, 2.235964, 1, 0, 0, 1, 1,
0.1316237, 1.281414, 1.13094, 1, 0, 0, 1, 1,
0.1324974, -2.018965, 3.56432, 1, 0, 0, 1, 1,
0.1340816, -0.6140486, 3.02717, 0, 0, 0, 1, 1,
0.1363255, -0.3346526, 2.86101, 0, 0, 0, 1, 1,
0.1539337, -0.2585644, 2.905833, 0, 0, 0, 1, 1,
0.1548119, 0.1587422, -0.3491679, 0, 0, 0, 1, 1,
0.1556976, -0.373797, 2.728271, 0, 0, 0, 1, 1,
0.1560135, 0.1742775, 1.162004, 0, 0, 0, 1, 1,
0.156015, 0.1484664, 1.451517, 0, 0, 0, 1, 1,
0.1605496, -1.003641, 2.114514, 1, 1, 1, 1, 1,
0.1658473, -0.2480347, 1.403186, 1, 1, 1, 1, 1,
0.1660129, -0.4203714, 1.922948, 1, 1, 1, 1, 1,
0.1680561, -2.187757, 1.629189, 1, 1, 1, 1, 1,
0.1696331, 0.5931125, -0.3098489, 1, 1, 1, 1, 1,
0.175426, 0.4404141, -0.2579541, 1, 1, 1, 1, 1,
0.1775947, -0.00768163, 0.6881324, 1, 1, 1, 1, 1,
0.1793833, 0.5159717, 1.498805, 1, 1, 1, 1, 1,
0.1806263, 0.1864867, 0.4250675, 1, 1, 1, 1, 1,
0.1819368, 0.7426736, 0.3398053, 1, 1, 1, 1, 1,
0.1830573, 0.593063, -1.076122, 1, 1, 1, 1, 1,
0.1885554, 2.102741, -0.0701768, 1, 1, 1, 1, 1,
0.1893796, 0.1017446, 3.82788, 1, 1, 1, 1, 1,
0.1972568, -0.2476386, 3.722263, 1, 1, 1, 1, 1,
0.2024532, -0.06146624, 1.5122, 1, 1, 1, 1, 1,
0.2054005, 0.1579908, 1.118675, 0, 0, 1, 1, 1,
0.2072157, -0.4565735, 4.088404, 1, 0, 0, 1, 1,
0.2110903, 0.9438668, -1.052696, 1, 0, 0, 1, 1,
0.2119408, -0.5877261, 3.553379, 1, 0, 0, 1, 1,
0.2162088, 0.2537321, 0.7583615, 1, 0, 0, 1, 1,
0.2195741, 0.04483351, 1.640688, 1, 0, 0, 1, 1,
0.2225799, 0.3090357, -0.2274743, 0, 0, 0, 1, 1,
0.2259271, 0.8499585, -0.1484506, 0, 0, 0, 1, 1,
0.2271964, 0.1672474, 2.020525, 0, 0, 0, 1, 1,
0.228045, -0.7251948, 1.072893, 0, 0, 0, 1, 1,
0.2295579, -0.5256413, 2.489495, 0, 0, 0, 1, 1,
0.2393754, -0.05986093, 1.525737, 0, 0, 0, 1, 1,
0.2406526, 0.0007597117, 0.07668295, 0, 0, 0, 1, 1,
0.2482028, -0.5564938, 2.479078, 1, 1, 1, 1, 1,
0.2568816, 1.406532, -0.8703161, 1, 1, 1, 1, 1,
0.2584917, 2.542154, -1.423493, 1, 1, 1, 1, 1,
0.2593198, -0.664634, 3.31083, 1, 1, 1, 1, 1,
0.2604822, 1.499538, 1.134589, 1, 1, 1, 1, 1,
0.2608675, 2.133484, 0.08946169, 1, 1, 1, 1, 1,
0.2638552, -0.02381826, 2.360216, 1, 1, 1, 1, 1,
0.2657656, -0.05654064, 0.960693, 1, 1, 1, 1, 1,
0.270215, -0.2949296, 4.535332, 1, 1, 1, 1, 1,
0.2752193, -0.6137522, 1.667573, 1, 1, 1, 1, 1,
0.2778623, -0.9530588, 3.055516, 1, 1, 1, 1, 1,
0.2789997, -1.631904, 2.742516, 1, 1, 1, 1, 1,
0.2801581, 1.046386, 1.467347, 1, 1, 1, 1, 1,
0.2822596, 1.43682, 0.5257264, 1, 1, 1, 1, 1,
0.2843887, -0.3529821, 3.418537, 1, 1, 1, 1, 1,
0.2852134, 0.5060403, 0.2013992, 0, 0, 1, 1, 1,
0.288381, -0.9013638, 2.148142, 1, 0, 0, 1, 1,
0.2977437, -0.564185, 2.492013, 1, 0, 0, 1, 1,
0.3033114, 0.3781722, 1.299332, 1, 0, 0, 1, 1,
0.3033284, 0.9776926, 0.8586105, 1, 0, 0, 1, 1,
0.3060569, 1.177248, 0.364861, 1, 0, 0, 1, 1,
0.3070848, 0.7889563, 1.514978, 0, 0, 0, 1, 1,
0.3115228, -0.1394472, 1.928349, 0, 0, 0, 1, 1,
0.3121665, -0.04107229, 3.350038, 0, 0, 0, 1, 1,
0.3159077, 0.8763227, 0.207207, 0, 0, 0, 1, 1,
0.3169597, -0.00798982, 1.476938, 0, 0, 0, 1, 1,
0.3199595, -1.028724, 3.827559, 0, 0, 0, 1, 1,
0.320193, 0.7028321, 1.370336, 0, 0, 0, 1, 1,
0.3221598, -1.17353, 2.070026, 1, 1, 1, 1, 1,
0.3253832, 0.5719655, 0.3020326, 1, 1, 1, 1, 1,
0.327022, -0.1771344, 3.161478, 1, 1, 1, 1, 1,
0.3356889, 1.138033, 0.1201639, 1, 1, 1, 1, 1,
0.3366237, -0.02734404, 2.44176, 1, 1, 1, 1, 1,
0.33773, -0.4882557, 3.539813, 1, 1, 1, 1, 1,
0.3399006, 0.8271219, 1.487843, 1, 1, 1, 1, 1,
0.3424202, -0.07182146, 1.677856, 1, 1, 1, 1, 1,
0.343089, 1.074697, -0.3765789, 1, 1, 1, 1, 1,
0.3495168, 0.5230564, 1.317892, 1, 1, 1, 1, 1,
0.3505513, -0.5380077, 2.450059, 1, 1, 1, 1, 1,
0.3509507, 1.709199, -0.1447043, 1, 1, 1, 1, 1,
0.3533415, -1.314353, 2.674691, 1, 1, 1, 1, 1,
0.3547562, 0.0482352, 2.394792, 1, 1, 1, 1, 1,
0.3578016, -0.03119433, 2.130508, 1, 1, 1, 1, 1,
0.3662023, -0.5147713, 2.642534, 0, 0, 1, 1, 1,
0.3694816, -0.3289345, 1.768586, 1, 0, 0, 1, 1,
0.3710693, 1.010338, 0.2422153, 1, 0, 0, 1, 1,
0.3724353, 0.3189334, 1.58775, 1, 0, 0, 1, 1,
0.372876, -0.8232062, 1.506596, 1, 0, 0, 1, 1,
0.3741139, -0.3013439, 3.84729, 1, 0, 0, 1, 1,
0.3841434, -1.857171, 3.179169, 0, 0, 0, 1, 1,
0.3869003, 1.240183, 0.9419066, 0, 0, 0, 1, 1,
0.3886165, 2.128695, 0.7797043, 0, 0, 0, 1, 1,
0.3901583, 1.377511, 0.893724, 0, 0, 0, 1, 1,
0.3912078, 0.2220109, -0.1537437, 0, 0, 0, 1, 1,
0.3928736, 0.9005489, 0.5254059, 0, 0, 0, 1, 1,
0.3980365, 0.7363588, -1.199077, 0, 0, 0, 1, 1,
0.3990397, 0.206051, 1.241844, 1, 1, 1, 1, 1,
0.404714, -0.8259885, 1.574475, 1, 1, 1, 1, 1,
0.4061717, 0.05942572, 0.6165081, 1, 1, 1, 1, 1,
0.4183615, -0.8700489, 1.887795, 1, 1, 1, 1, 1,
0.4203802, -2.252819, 3.030757, 1, 1, 1, 1, 1,
0.4213735, -1.055662, 1.744918, 1, 1, 1, 1, 1,
0.4243526, -0.4211325, 1.234179, 1, 1, 1, 1, 1,
0.4259578, -0.3137105, 1.531774, 1, 1, 1, 1, 1,
0.4283166, 0.4146209, 0.6173751, 1, 1, 1, 1, 1,
0.4284637, -0.738794, 2.539746, 1, 1, 1, 1, 1,
0.4314185, -0.1017236, 3.652511, 1, 1, 1, 1, 1,
0.4365518, -0.9402537, 1.791285, 1, 1, 1, 1, 1,
0.4365536, -2.788069, 2.798044, 1, 1, 1, 1, 1,
0.4392152, 0.04511043, 0.9042764, 1, 1, 1, 1, 1,
0.4407138, -0.2898798, 2.358799, 1, 1, 1, 1, 1,
0.4439022, 0.472505, 0.2955497, 0, 0, 1, 1, 1,
0.4465975, -0.4556697, 1.115174, 1, 0, 0, 1, 1,
0.4466009, 0.9895297, -1.497164, 1, 0, 0, 1, 1,
0.4501498, -0.380456, 3.735944, 1, 0, 0, 1, 1,
0.4538152, -0.01377721, 2.649958, 1, 0, 0, 1, 1,
0.4557526, 1.484357, -0.4185112, 1, 0, 0, 1, 1,
0.4568157, 1.964715, 1.40568, 0, 0, 0, 1, 1,
0.4578044, 0.09831073, 2.373011, 0, 0, 0, 1, 1,
0.4597992, 1.644133, 0.7137684, 0, 0, 0, 1, 1,
0.4622757, 1.268003, -0.05179228, 0, 0, 0, 1, 1,
0.4690119, -0.5975601, 1.718704, 0, 0, 0, 1, 1,
0.4736218, 0.1777468, 0.3289162, 0, 0, 0, 1, 1,
0.4772844, 0.1210876, 1.463804, 0, 0, 0, 1, 1,
0.478155, 0.9622604, -0.2740456, 1, 1, 1, 1, 1,
0.4826074, -0.8771008, 3.970693, 1, 1, 1, 1, 1,
0.4838993, -1.543977, 3.998862, 1, 1, 1, 1, 1,
0.489875, -0.6465166, 3.230544, 1, 1, 1, 1, 1,
0.4914123, 0.05256863, 1.78238, 1, 1, 1, 1, 1,
0.4923117, -1.76015, 2.962628, 1, 1, 1, 1, 1,
0.5005534, 0.7173201, 2.502234, 1, 1, 1, 1, 1,
0.5016331, 0.2922441, 2.604468, 1, 1, 1, 1, 1,
0.5049073, -0.8207892, 3.103096, 1, 1, 1, 1, 1,
0.5053357, 1.525923, 1.151199, 1, 1, 1, 1, 1,
0.5059797, -0.6948963, 1.714152, 1, 1, 1, 1, 1,
0.5081723, 0.5759889, 1.241298, 1, 1, 1, 1, 1,
0.5144559, 0.5227349, 2.07769, 1, 1, 1, 1, 1,
0.5157208, 0.9898656, -1.005925, 1, 1, 1, 1, 1,
0.5169943, 0.1543334, 1.181522, 1, 1, 1, 1, 1,
0.5179113, 0.3299208, 0.7771527, 0, 0, 1, 1, 1,
0.5186514, -0.9347349, 1.228764, 1, 0, 0, 1, 1,
0.5189009, 0.1737555, 0.8936238, 1, 0, 0, 1, 1,
0.5242101, 1.111809, 0.5182992, 1, 0, 0, 1, 1,
0.5321295, -1.353009, 1.99189, 1, 0, 0, 1, 1,
0.5327516, 0.5182341, 0.9405683, 1, 0, 0, 1, 1,
0.533417, -0.03584621, 1.569041, 0, 0, 0, 1, 1,
0.5336169, -0.3487118, 1.833786, 0, 0, 0, 1, 1,
0.5340606, -0.3147945, 0.723439, 0, 0, 0, 1, 1,
0.5354422, 1.571401, 0.7702236, 0, 0, 0, 1, 1,
0.536643, -1.444854, 2.676177, 0, 0, 0, 1, 1,
0.5435047, 1.44181, -1.260661, 0, 0, 0, 1, 1,
0.5436941, 0.6640137, 2.84761, 0, 0, 0, 1, 1,
0.5438644, -0.9349101, 2.224921, 1, 1, 1, 1, 1,
0.5497982, 0.7730463, 0.4160166, 1, 1, 1, 1, 1,
0.5506999, 0.006626192, 1.426836, 1, 1, 1, 1, 1,
0.5520017, 0.2975365, 2.734357, 1, 1, 1, 1, 1,
0.5527972, 1.776307, 1.48894, 1, 1, 1, 1, 1,
0.5572177, -0.3363808, 1.208734, 1, 1, 1, 1, 1,
0.5630648, -0.2127403, 2.985549, 1, 1, 1, 1, 1,
0.5647519, -0.1922796, 0.8577312, 1, 1, 1, 1, 1,
0.5651873, 0.5118331, 1.252141, 1, 1, 1, 1, 1,
0.5673333, 0.8903053, -0.6782302, 1, 1, 1, 1, 1,
0.5720787, -0.1733716, 4.407939, 1, 1, 1, 1, 1,
0.5739251, 0.307894, 0.5954623, 1, 1, 1, 1, 1,
0.5744796, -0.2639305, 3.003034, 1, 1, 1, 1, 1,
0.5752175, -0.7398075, 3.878996, 1, 1, 1, 1, 1,
0.5760586, -0.5860319, 1.988801, 1, 1, 1, 1, 1,
0.580795, -0.522342, 1.491673, 0, 0, 1, 1, 1,
0.5819321, -2.049461, 2.580373, 1, 0, 0, 1, 1,
0.5826662, 0.821197, 0.6707975, 1, 0, 0, 1, 1,
0.5843734, -1.051404, 3.044591, 1, 0, 0, 1, 1,
0.5889943, -0.630715, 1.948612, 1, 0, 0, 1, 1,
0.5917433, 0.13406, 1.285857, 1, 0, 0, 1, 1,
0.5957642, -1.385535, 3.887199, 0, 0, 0, 1, 1,
0.5987222, -0.3418832, 4.060561, 0, 0, 0, 1, 1,
0.6071802, 0.224609, 2.254638, 0, 0, 0, 1, 1,
0.6101238, 1.810342, -0.6577998, 0, 0, 0, 1, 1,
0.6111047, 0.1458382, 1.522128, 0, 0, 0, 1, 1,
0.6111404, -0.244072, 1.869242, 0, 0, 0, 1, 1,
0.6117449, 0.1173904, 1.967866, 0, 0, 0, 1, 1,
0.6137292, 1.222055, 1.327333, 1, 1, 1, 1, 1,
0.6178058, -0.2322479, 3.421616, 1, 1, 1, 1, 1,
0.6246299, 0.3375862, -0.6378689, 1, 1, 1, 1, 1,
0.6275823, -0.495088, 1.496878, 1, 1, 1, 1, 1,
0.6310154, 0.2237149, 2.234402, 1, 1, 1, 1, 1,
0.6444264, -0.373483, 2.297657, 1, 1, 1, 1, 1,
0.6492702, 0.8509563, 1.028344, 1, 1, 1, 1, 1,
0.6516662, -0.1434726, 0.1759956, 1, 1, 1, 1, 1,
0.6547809, -0.723236, 2.101044, 1, 1, 1, 1, 1,
0.6554804, 2.405013, 1.845053, 1, 1, 1, 1, 1,
0.6562094, 0.001539282, 1.85786, 1, 1, 1, 1, 1,
0.6579531, 1.613158, -1.759855, 1, 1, 1, 1, 1,
0.6646017, 0.7792749, 1.013964, 1, 1, 1, 1, 1,
0.6814242, -2.087507, 2.846933, 1, 1, 1, 1, 1,
0.6847567, 0.7405012, 1.041746, 1, 1, 1, 1, 1,
0.6924228, 1.304657, -0.6812698, 0, 0, 1, 1, 1,
0.6929491, -1.314373, 2.00942, 1, 0, 0, 1, 1,
0.6943902, 1.874538, -0.7952004, 1, 0, 0, 1, 1,
0.7047991, 1.005764, 0.8825684, 1, 0, 0, 1, 1,
0.7146727, -0.4929554, 1.116227, 1, 0, 0, 1, 1,
0.7154243, 0.4405598, 2.167549, 1, 0, 0, 1, 1,
0.717204, -1.073328, 2.225283, 0, 0, 0, 1, 1,
0.7177863, -0.3514317, 1.778151, 0, 0, 0, 1, 1,
0.7200504, -0.3112235, 3.960726, 0, 0, 0, 1, 1,
0.7272114, 0.8161229, 2.139353, 0, 0, 0, 1, 1,
0.7310178, -0.5802301, 2.458158, 0, 0, 0, 1, 1,
0.7315214, -0.01313567, 2.999057, 0, 0, 0, 1, 1,
0.7348448, -0.6712578, 2.951837, 0, 0, 0, 1, 1,
0.73842, 0.6506466, 1.384603, 1, 1, 1, 1, 1,
0.7459406, 2.448644, 0.5998594, 1, 1, 1, 1, 1,
0.7507812, 0.4744511, 0.1962963, 1, 1, 1, 1, 1,
0.7535634, -2.312024, 3.504107, 1, 1, 1, 1, 1,
0.7567474, -0.7963527, 2.220735, 1, 1, 1, 1, 1,
0.7570816, 0.9533711, 0.9229439, 1, 1, 1, 1, 1,
0.760712, 1.693026, 0.1580052, 1, 1, 1, 1, 1,
0.7616299, 0.5020074, 2.00375, 1, 1, 1, 1, 1,
0.762777, -0.7382695, 2.155421, 1, 1, 1, 1, 1,
0.7772291, 0.3592391, -0.5171464, 1, 1, 1, 1, 1,
0.7800444, -0.1290644, 1.69339, 1, 1, 1, 1, 1,
0.7850861, -0.2098863, 3.51183, 1, 1, 1, 1, 1,
0.7890374, -0.9063891, 2.268462, 1, 1, 1, 1, 1,
0.7949285, 0.3822074, -0.5222143, 1, 1, 1, 1, 1,
0.7955286, -0.9004817, 1.734025, 1, 1, 1, 1, 1,
0.8000623, 0.05942511, 2.592324, 0, 0, 1, 1, 1,
0.8155748, 0.784032, 0.1653583, 1, 0, 0, 1, 1,
0.8170683, 1.117803, 0.8299574, 1, 0, 0, 1, 1,
0.8259485, -0.6441229, 3.015177, 1, 0, 0, 1, 1,
0.829388, 0.08945131, 0.5106022, 1, 0, 0, 1, 1,
0.8305033, 1.405893, 0.6239073, 1, 0, 0, 1, 1,
0.8311317, 0.3525959, 0.2234577, 0, 0, 0, 1, 1,
0.8342033, -1.393037, 2.516452, 0, 0, 0, 1, 1,
0.8358547, -0.3408518, 2.175585, 0, 0, 0, 1, 1,
0.8360219, 0.662953, 0.298689, 0, 0, 0, 1, 1,
0.8432764, -0.3898624, 2.845191, 0, 0, 0, 1, 1,
0.8453802, -0.5104136, 2.930189, 0, 0, 0, 1, 1,
0.847217, 0.1062447, 0.9045056, 0, 0, 0, 1, 1,
0.8694959, 0.06232894, 1.179599, 1, 1, 1, 1, 1,
0.8805082, 0.3840239, 0.5434987, 1, 1, 1, 1, 1,
0.8857816, -0.1076958, 3.108115, 1, 1, 1, 1, 1,
0.8869095, -1.867882, 2.071343, 1, 1, 1, 1, 1,
0.8954833, 1.691715, 0.458697, 1, 1, 1, 1, 1,
0.8956106, 0.3112522, 3.88413, 1, 1, 1, 1, 1,
0.8983775, -0.5849118, 2.933987, 1, 1, 1, 1, 1,
0.9081031, 1.79914, -0.6419984, 1, 1, 1, 1, 1,
0.9083644, 0.2700709, 1.280516, 1, 1, 1, 1, 1,
0.9129085, -0.1301322, 1.390895, 1, 1, 1, 1, 1,
0.9141207, 0.8484513, 1.111284, 1, 1, 1, 1, 1,
0.9172817, 1.399844, 1.261334, 1, 1, 1, 1, 1,
0.9183456, 0.6953624, 1.423182, 1, 1, 1, 1, 1,
0.9228532, 1.404573, 0.08451737, 1, 1, 1, 1, 1,
0.9232557, 0.2951628, 2.069253, 1, 1, 1, 1, 1,
0.9261819, 0.744583, 0.8049816, 0, 0, 1, 1, 1,
0.9352311, -1.041051, 2.480826, 1, 0, 0, 1, 1,
0.9353516, -1.919091, 2.698956, 1, 0, 0, 1, 1,
0.9356333, 0.5140975, 0.530044, 1, 0, 0, 1, 1,
0.9438024, -0.527451, 2.928735, 1, 0, 0, 1, 1,
0.9488556, 1.006756, -0.1323109, 1, 0, 0, 1, 1,
0.9511802, 0.6042075, 1.387233, 0, 0, 0, 1, 1,
0.9521704, 0.565298, 0.9140048, 0, 0, 0, 1, 1,
0.9558429, -0.6477441, 3.027606, 0, 0, 0, 1, 1,
0.9604198, -0.5284653, 1.618947, 0, 0, 0, 1, 1,
0.9670227, 0.04692542, 2.16424, 0, 0, 0, 1, 1,
0.9706171, -1.047583, 2.478761, 0, 0, 0, 1, 1,
0.9709794, -0.1175062, 1.119127, 0, 0, 0, 1, 1,
0.9729908, -1.766706, 3.167263, 1, 1, 1, 1, 1,
0.9758891, -1.051376, 2.838804, 1, 1, 1, 1, 1,
0.9770177, -0.39436, 1.357805, 1, 1, 1, 1, 1,
0.9858581, 1.161953, 0.8302612, 1, 1, 1, 1, 1,
0.9891931, -0.3514846, 2.884601, 1, 1, 1, 1, 1,
0.9899181, -0.57401, 0.8774033, 1, 1, 1, 1, 1,
0.9934011, 1.563378, 0.4827522, 1, 1, 1, 1, 1,
0.9970856, 0.3310863, 2.85693, 1, 1, 1, 1, 1,
1.000561, -0.06217619, 1.371878, 1, 1, 1, 1, 1,
1.005018, 0.4110661, 0.6628962, 1, 1, 1, 1, 1,
1.005508, 0.6747259, 1.55015, 1, 1, 1, 1, 1,
1.006299, -1.651662, 1.657411, 1, 1, 1, 1, 1,
1.008614, -0.3274521, 2.222036, 1, 1, 1, 1, 1,
1.017325, 1.190469, 1.718725, 1, 1, 1, 1, 1,
1.018339, 0.1587355, 2.639511, 1, 1, 1, 1, 1,
1.019932, -1.026167, 3.1681, 0, 0, 1, 1, 1,
1.023659, -0.1271684, 2.987368, 1, 0, 0, 1, 1,
1.026504, 0.1316682, 0.5588974, 1, 0, 0, 1, 1,
1.026546, -1.681423, 1.888721, 1, 0, 0, 1, 1,
1.037362, 0.8698537, 0.370164, 1, 0, 0, 1, 1,
1.039332, -0.9217963, 1.209597, 1, 0, 0, 1, 1,
1.046715, -0.194657, 2.341852, 0, 0, 0, 1, 1,
1.048865, 1.495349, 0.6354305, 0, 0, 0, 1, 1,
1.071404, 0.6481849, 0.6112857, 0, 0, 0, 1, 1,
1.075517, -0.8525942, 2.884253, 0, 0, 0, 1, 1,
1.077133, 0.001170882, 1.60338, 0, 0, 0, 1, 1,
1.077369, 0.3773954, 0.3242749, 0, 0, 0, 1, 1,
1.088328, 2.056997, 0.07184159, 0, 0, 0, 1, 1,
1.089064, -1.464963, 3.268736, 1, 1, 1, 1, 1,
1.08909, -0.7133514, 2.598405, 1, 1, 1, 1, 1,
1.092299, 1.656987, -0.9316745, 1, 1, 1, 1, 1,
1.092931, -0.137996, 0.4949092, 1, 1, 1, 1, 1,
1.105825, -1.857225, 2.483757, 1, 1, 1, 1, 1,
1.11068, 1.57425, 0.1311831, 1, 1, 1, 1, 1,
1.118023, -0.4251607, 1.535181, 1, 1, 1, 1, 1,
1.123258, 0.6736705, 1.644572, 1, 1, 1, 1, 1,
1.135149, -0.8140789, 1.74905, 1, 1, 1, 1, 1,
1.139274, 0.3248301, 2.542854, 1, 1, 1, 1, 1,
1.149169, -0.7203149, 2.144053, 1, 1, 1, 1, 1,
1.156156, 0.03477097, 3.985729, 1, 1, 1, 1, 1,
1.157419, -2.488482, 2.318065, 1, 1, 1, 1, 1,
1.172057, -0.3020832, 1.709715, 1, 1, 1, 1, 1,
1.173844, -0.4318015, 3.341541, 1, 1, 1, 1, 1,
1.179552, 0.07566053, 1.302348, 0, 0, 1, 1, 1,
1.180055, -0.5012253, 0.7130336, 1, 0, 0, 1, 1,
1.184158, 1.33355, 0.9700443, 1, 0, 0, 1, 1,
1.187037, -0.4475008, 1.671787, 1, 0, 0, 1, 1,
1.189698, 0.1004482, 1.615108, 1, 0, 0, 1, 1,
1.190185, -0.2363834, 1.713143, 1, 0, 0, 1, 1,
1.192434, -1.743564, 3.442129, 0, 0, 0, 1, 1,
1.197767, 0.3944468, 0.7310125, 0, 0, 0, 1, 1,
1.2045, 1.446845, 0.2345014, 0, 0, 0, 1, 1,
1.204517, 0.7996966, 0.1866027, 0, 0, 0, 1, 1,
1.211078, 0.4675385, 1.064003, 0, 0, 0, 1, 1,
1.213665, 1.433661, 0.6972639, 0, 0, 0, 1, 1,
1.216544, -1.858569, 4.16726, 0, 0, 0, 1, 1,
1.219753, 0.02017586, 1.206722, 1, 1, 1, 1, 1,
1.220096, 0.007111845, 0.0002501632, 1, 1, 1, 1, 1,
1.223024, 0.7706608, 0.9754274, 1, 1, 1, 1, 1,
1.225198, 0.7973201, 1.078218, 1, 1, 1, 1, 1,
1.22591, -1.230121, 2.979248, 1, 1, 1, 1, 1,
1.229354, 0.93591, 2.341022, 1, 1, 1, 1, 1,
1.229384, 0.1843139, 1.727156, 1, 1, 1, 1, 1,
1.23981, -0.1364509, 2.014315, 1, 1, 1, 1, 1,
1.245276, 0.6109958, -0.7439173, 1, 1, 1, 1, 1,
1.245971, -0.4869468, 2.039097, 1, 1, 1, 1, 1,
1.246562, 1.157105, 1.151902, 1, 1, 1, 1, 1,
1.253483, 0.4592305, 2.274461, 1, 1, 1, 1, 1,
1.254154, 0.5125191, 0.5449257, 1, 1, 1, 1, 1,
1.258287, 0.9127861, 0.6571307, 1, 1, 1, 1, 1,
1.259948, -1.16321, 1.291806, 1, 1, 1, 1, 1,
1.260842, 1.257385, 2.403823, 0, 0, 1, 1, 1,
1.261903, 1.301264, 1.489353, 1, 0, 0, 1, 1,
1.266989, 0.2845782, 0.1859567, 1, 0, 0, 1, 1,
1.268569, -0.450673, 1.263396, 1, 0, 0, 1, 1,
1.274381, 0.4868721, 2.722263, 1, 0, 0, 1, 1,
1.27719, -0.4380169, 1.354746, 1, 0, 0, 1, 1,
1.277525, -0.1832248, 2.152089, 0, 0, 0, 1, 1,
1.281468, 1.474915, -0.2560658, 0, 0, 0, 1, 1,
1.286549, -1.516359, 1.228353, 0, 0, 0, 1, 1,
1.298535, 1.256015, 1.084817, 0, 0, 0, 1, 1,
1.300999, -0.9984984, 2.738635, 0, 0, 0, 1, 1,
1.306248, -0.06713392, 0.7380012, 0, 0, 0, 1, 1,
1.318606, 0.423363, 0.8705819, 0, 0, 0, 1, 1,
1.319919, 2.010441, 1.930123, 1, 1, 1, 1, 1,
1.32852, -1.198429, 0.5934983, 1, 1, 1, 1, 1,
1.329453, 0.5783614, 1.588026, 1, 1, 1, 1, 1,
1.334001, -0.8163009, 0.770188, 1, 1, 1, 1, 1,
1.338992, 1.698202, 0.04667374, 1, 1, 1, 1, 1,
1.343728, -0.6943987, 1.723834, 1, 1, 1, 1, 1,
1.349783, -0.5690528, 3.956764, 1, 1, 1, 1, 1,
1.360922, -0.6252196, 2.339447, 1, 1, 1, 1, 1,
1.361006, 0.7679653, 1.029963, 1, 1, 1, 1, 1,
1.362639, -1.383376, 3.054708, 1, 1, 1, 1, 1,
1.363893, -1.868259, 3.682641, 1, 1, 1, 1, 1,
1.376917, -1.66046, 3.556308, 1, 1, 1, 1, 1,
1.381744, -0.4037681, 2.211192, 1, 1, 1, 1, 1,
1.382928, -2.684562, 2.190382, 1, 1, 1, 1, 1,
1.385238, -0.2643586, 1.716515, 1, 1, 1, 1, 1,
1.388631, -0.0998864, 0.8434015, 0, 0, 1, 1, 1,
1.389312, -1.311414, 3.13637, 1, 0, 0, 1, 1,
1.389398, -0.2111102, 1.69838, 1, 0, 0, 1, 1,
1.393652, 1.228322, 0.02045279, 1, 0, 0, 1, 1,
1.405254, 1.053806, 1.805553, 1, 0, 0, 1, 1,
1.421001, 0.2977547, 0.2826401, 1, 0, 0, 1, 1,
1.429702, -0.3743372, 2.115345, 0, 0, 0, 1, 1,
1.442405, -0.1135336, 2.18079, 0, 0, 0, 1, 1,
1.450726, -1.875194, 1.443828, 0, 0, 0, 1, 1,
1.470747, -2.176655, 4.238508, 0, 0, 0, 1, 1,
1.472057, -0.1109285, 1.153594, 0, 0, 0, 1, 1,
1.474113, -0.6867383, 2.297956, 0, 0, 0, 1, 1,
1.476643, -1.060259, 2.138235, 0, 0, 0, 1, 1,
1.497654, -0.1694967, 2.955552, 1, 1, 1, 1, 1,
1.500434, 1.879851, 0.9680658, 1, 1, 1, 1, 1,
1.515452, 0.9622791, 3.471182, 1, 1, 1, 1, 1,
1.523585, 0.1774377, 1.948318, 1, 1, 1, 1, 1,
1.553577, -0.02164012, 0.5522618, 1, 1, 1, 1, 1,
1.561825, 1.456802, -0.1262479, 1, 1, 1, 1, 1,
1.566517, -0.9058052, 3.397043, 1, 1, 1, 1, 1,
1.587795, -0.1711326, 1.588521, 1, 1, 1, 1, 1,
1.590567, -0.8843763, 1.449748, 1, 1, 1, 1, 1,
1.597959, 1.16812, 0.5383581, 1, 1, 1, 1, 1,
1.609757, 0.6887105, 1.071939, 1, 1, 1, 1, 1,
1.610888, -2.116749, 1.364104, 1, 1, 1, 1, 1,
1.638668, -0.09936593, 2.630268, 1, 1, 1, 1, 1,
1.65574, 0.0709059, 1.155583, 1, 1, 1, 1, 1,
1.655983, -0.06571871, 0.8547659, 1, 1, 1, 1, 1,
1.669014, -0.4816501, 1.716795, 0, 0, 1, 1, 1,
1.677006, -0.3116421, 0.6169885, 1, 0, 0, 1, 1,
1.696251, 0.01078478, 1.775071, 1, 0, 0, 1, 1,
1.699268, -0.7158197, -0.7778137, 1, 0, 0, 1, 1,
1.702503, -1.352947, 2.59058, 1, 0, 0, 1, 1,
1.72499, -1.949735, 1.186971, 1, 0, 0, 1, 1,
1.726766, 0.1788277, 0.9133821, 0, 0, 0, 1, 1,
1.738044, 1.186459, -0.6395616, 0, 0, 0, 1, 1,
1.75019, 1.052286, 1.244805, 0, 0, 0, 1, 1,
1.752408, -1.614907, 2.326528, 0, 0, 0, 1, 1,
1.761115, 0.2953277, 1.401756, 0, 0, 0, 1, 1,
1.793034, 0.07179814, 2.728709, 0, 0, 0, 1, 1,
1.834823, -0.06166345, 0.8520947, 0, 0, 0, 1, 1,
1.86524, -1.577519, 1.620426, 1, 1, 1, 1, 1,
1.871269, 1.394337, 1.860097, 1, 1, 1, 1, 1,
1.899851, -2.211056, 4.230186, 1, 1, 1, 1, 1,
1.916925, 0.3387541, 2.464065, 1, 1, 1, 1, 1,
1.918542, 1.670624, 0.7339094, 1, 1, 1, 1, 1,
1.920787, 0.548977, 1.639426, 1, 1, 1, 1, 1,
1.928323, 0.08395533, 2.445204, 1, 1, 1, 1, 1,
1.930276, -0.003747869, 1.320142, 1, 1, 1, 1, 1,
1.932768, 0.7910391, 0.1732669, 1, 1, 1, 1, 1,
1.946118, 2.045884, -0.8785549, 1, 1, 1, 1, 1,
1.956467, 0.582501, 1.156816, 1, 1, 1, 1, 1,
1.960018, -1.41634, 3.798428, 1, 1, 1, 1, 1,
1.96955, -0.4370417, 1.852818, 1, 1, 1, 1, 1,
2.003235, 0.7599241, 0.3857715, 1, 1, 1, 1, 1,
2.011236, -1.476237, 2.63013, 1, 1, 1, 1, 1,
2.032008, -1.229601, 1.054988, 0, 0, 1, 1, 1,
2.064146, 0.1278899, 0.8859568, 1, 0, 0, 1, 1,
2.114783, 0.8733804, 2.650263, 1, 0, 0, 1, 1,
2.155504, 1.90523, 1.556679, 1, 0, 0, 1, 1,
2.156497, 0.04149679, 0.870554, 1, 0, 0, 1, 1,
2.160243, -1.312063, 2.796661, 1, 0, 0, 1, 1,
2.160914, 1.164239, 0.8960157, 0, 0, 0, 1, 1,
2.26764, -0.3135454, 0.2315306, 0, 0, 0, 1, 1,
2.275079, -0.5364466, 0.6015044, 0, 0, 0, 1, 1,
2.316782, -2.476688, 2.646465, 0, 0, 0, 1, 1,
2.320982, -0.7642891, 1.06807, 0, 0, 0, 1, 1,
2.332252, 1.181125, 0.9536194, 0, 0, 0, 1, 1,
2.432035, -0.4239362, 3.81413, 0, 0, 0, 1, 1,
2.436231, 1.081586, 0.8193692, 1, 1, 1, 1, 1,
2.523002, 0.3544049, 3.891745, 1, 1, 1, 1, 1,
2.542731, -0.5172692, 2.324483, 1, 1, 1, 1, 1,
2.598239, -0.6205342, 2.649991, 1, 1, 1, 1, 1,
2.769488, -0.09433843, 2.556275, 1, 1, 1, 1, 1,
2.828648, -0.7004665, 1.80875, 1, 1, 1, 1, 1,
2.985266, -0.3902642, 0.2798657, 1, 1, 1, 1, 1
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
var radius = 9.449396;
var distance = 33.19061;
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
mvMatrix.translate( 0.05915117, 0.003523588, 0.5851274 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.19061);
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
