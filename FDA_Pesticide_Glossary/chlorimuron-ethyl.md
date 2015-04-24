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
-2.894689, -2.500513, -1.859959, 1, 0, 0, 1,
-2.733371, -0.2312149, -2.520506, 1, 0.007843138, 0, 1,
-2.718021, -1.174304, -2.438554, 1, 0.01176471, 0, 1,
-2.712173, 0.3998607, -3.057745, 1, 0.01960784, 0, 1,
-2.66648, 2.390106, -1.169224, 1, 0.02352941, 0, 1,
-2.654465, 0.7590208, -2.347108, 1, 0.03137255, 0, 1,
-2.633106, 0.7791011, -1.460674, 1, 0.03529412, 0, 1,
-2.422202, -1.073427, -0.8421379, 1, 0.04313726, 0, 1,
-2.292629, 0.5457217, -0.4778502, 1, 0.04705882, 0, 1,
-2.245909, -0.583054, -1.433964, 1, 0.05490196, 0, 1,
-2.21454, -1.984289, -3.151301, 1, 0.05882353, 0, 1,
-2.202868, -1.53413, -3.460628, 1, 0.06666667, 0, 1,
-2.187056, 0.1055083, -0.9641438, 1, 0.07058824, 0, 1,
-2.167222, -1.515895, -3.022432, 1, 0.07843138, 0, 1,
-2.15488, -2.323899, -2.015481, 1, 0.08235294, 0, 1,
-2.076246, 2.573047, 0.3675796, 1, 0.09019608, 0, 1,
-2.0548, 0.7945971, -0.4729283, 1, 0.09411765, 0, 1,
-2.052519, 0.8031739, -0.8093156, 1, 0.1019608, 0, 1,
-2.048711, 0.5552182, -0.1071178, 1, 0.1098039, 0, 1,
-1.994092, -0.9190221, -1.120903, 1, 0.1137255, 0, 1,
-1.98989, 0.4571263, -0.01722134, 1, 0.1215686, 0, 1,
-1.976943, 0.7122278, -0.3881769, 1, 0.1254902, 0, 1,
-1.973005, 0.6025177, -1.621017, 1, 0.1333333, 0, 1,
-1.971364, 0.6013682, -2.316083, 1, 0.1372549, 0, 1,
-1.938432, 1.331333, -0.9754919, 1, 0.145098, 0, 1,
-1.936555, 0.4930525, 0.1489229, 1, 0.1490196, 0, 1,
-1.920686, 0.04692446, -2.038075, 1, 0.1568628, 0, 1,
-1.866317, -1.465212, -2.581791, 1, 0.1607843, 0, 1,
-1.865395, -0.1952004, -4.025379, 1, 0.1686275, 0, 1,
-1.832401, 0.6189235, -0.6470867, 1, 0.172549, 0, 1,
-1.81811, -1.109977, -3.8224, 1, 0.1803922, 0, 1,
-1.772639, -0.2077137, -0.579378, 1, 0.1843137, 0, 1,
-1.761711, 0.9041269, 0.2056842, 1, 0.1921569, 0, 1,
-1.745283, 1.325772, 0.04695551, 1, 0.1960784, 0, 1,
-1.744188, -0.7010093, -1.309236, 1, 0.2039216, 0, 1,
-1.714982, -0.6661143, -3.270391, 1, 0.2117647, 0, 1,
-1.689037, 1.314395, -1.589855, 1, 0.2156863, 0, 1,
-1.67732, 1.183076, -0.4679067, 1, 0.2235294, 0, 1,
-1.672501, 1.429243, -0.7765952, 1, 0.227451, 0, 1,
-1.668329, 0.619582, -2.65048, 1, 0.2352941, 0, 1,
-1.660636, 1.981666, -2.047615, 1, 0.2392157, 0, 1,
-1.657264, -1.753814, -3.132753, 1, 0.2470588, 0, 1,
-1.644663, -0.02333437, -1.475276, 1, 0.2509804, 0, 1,
-1.629762, -1.370344, -1.68936, 1, 0.2588235, 0, 1,
-1.610508, 1.109084, -1.323217, 1, 0.2627451, 0, 1,
-1.587825, -1.59736, -3.64198, 1, 0.2705882, 0, 1,
-1.581928, -1.046828, -2.899042, 1, 0.2745098, 0, 1,
-1.580195, -0.5755718, -0.9911571, 1, 0.282353, 0, 1,
-1.562448, 1.040918, -0.9094941, 1, 0.2862745, 0, 1,
-1.560747, -1.092647, -1.755872, 1, 0.2941177, 0, 1,
-1.557769, 0.5403929, -0.3539782, 1, 0.3019608, 0, 1,
-1.540764, 0.6542818, 0.6187263, 1, 0.3058824, 0, 1,
-1.530032, -0.511364, -1.495668, 1, 0.3137255, 0, 1,
-1.511315, -0.708598, -1.160584, 1, 0.3176471, 0, 1,
-1.503843, -0.2344264, -1.983977, 1, 0.3254902, 0, 1,
-1.496062, -0.01048592, 0.0912722, 1, 0.3294118, 0, 1,
-1.461587, 0.1985641, -1.482789, 1, 0.3372549, 0, 1,
-1.452155, 1.665356, 0.08186658, 1, 0.3411765, 0, 1,
-1.444683, -0.3264958, -1.56939, 1, 0.3490196, 0, 1,
-1.438178, -0.1749667, -3.830161, 1, 0.3529412, 0, 1,
-1.431374, -0.9141942, -1.676604, 1, 0.3607843, 0, 1,
-1.427276, 0.03511209, -2.593846, 1, 0.3647059, 0, 1,
-1.425869, -0.5626187, -2.77914, 1, 0.372549, 0, 1,
-1.422982, -0.4276712, -1.555886, 1, 0.3764706, 0, 1,
-1.419544, -0.241759, -0.9821671, 1, 0.3843137, 0, 1,
-1.409561, 1.059758, -1.645988, 1, 0.3882353, 0, 1,
-1.406924, 0.1581104, -1.421594, 1, 0.3960784, 0, 1,
-1.40455, -2.119686, -2.938398, 1, 0.4039216, 0, 1,
-1.386768, 0.2076013, -1.146849, 1, 0.4078431, 0, 1,
-1.383844, 0.2154061, -1.550947, 1, 0.4156863, 0, 1,
-1.382804, -1.153954, -2.774442, 1, 0.4196078, 0, 1,
-1.381403, 0.5525361, -0.7561724, 1, 0.427451, 0, 1,
-1.360173, 0.3321617, -2.854678, 1, 0.4313726, 0, 1,
-1.353442, -0.5480024, -2.384247, 1, 0.4392157, 0, 1,
-1.351593, 0.700902, -0.2917854, 1, 0.4431373, 0, 1,
-1.349117, 0.9764625, -0.9399346, 1, 0.4509804, 0, 1,
-1.347356, -0.3457212, -2.444658, 1, 0.454902, 0, 1,
-1.336962, 1.649302, -0.2155589, 1, 0.4627451, 0, 1,
-1.323733, -1.193633, -0.4154866, 1, 0.4666667, 0, 1,
-1.321256, 0.6440935, -0.8188986, 1, 0.4745098, 0, 1,
-1.31385, -0.6919417, -1.938236, 1, 0.4784314, 0, 1,
-1.303662, 0.5220312, 0.7079918, 1, 0.4862745, 0, 1,
-1.297495, 1.079348, -2.36823, 1, 0.4901961, 0, 1,
-1.295374, -1.256369, -2.847547, 1, 0.4980392, 0, 1,
-1.292832, 1.855388, 0.6253189, 1, 0.5058824, 0, 1,
-1.281502, 0.3054136, -1.958957, 1, 0.509804, 0, 1,
-1.273939, -0.1702503, -2.215927, 1, 0.5176471, 0, 1,
-1.273136, 0.2572387, -2.14208, 1, 0.5215687, 0, 1,
-1.266396, 0.3326315, -2.164801, 1, 0.5294118, 0, 1,
-1.257396, 1.237806, 1.249585, 1, 0.5333334, 0, 1,
-1.254908, -0.7546792, -1.909526, 1, 0.5411765, 0, 1,
-1.25339, 1.7975, 0.315953, 1, 0.5450981, 0, 1,
-1.247487, 0.1857439, -1.212962, 1, 0.5529412, 0, 1,
-1.240405, -1.195248, -2.275334, 1, 0.5568628, 0, 1,
-1.238092, 0.6512213, -0.6624152, 1, 0.5647059, 0, 1,
-1.226632, 1.084688, -1.845303, 1, 0.5686275, 0, 1,
-1.225302, 0.2836626, -0.7294655, 1, 0.5764706, 0, 1,
-1.220352, 0.3642333, -1.714076, 1, 0.5803922, 0, 1,
-1.218557, -0.2693731, -1.916885, 1, 0.5882353, 0, 1,
-1.204001, 0.6404005, -0.496388, 1, 0.5921569, 0, 1,
-1.200622, 0.257841, -1.97113, 1, 0.6, 0, 1,
-1.197894, -0.5691208, -1.844595, 1, 0.6078432, 0, 1,
-1.195473, -0.1157784, -0.663609, 1, 0.6117647, 0, 1,
-1.194501, -0.9074949, -2.317102, 1, 0.6196079, 0, 1,
-1.193085, 0.01780249, -0.3103215, 1, 0.6235294, 0, 1,
-1.183968, 1.081337, -1.85219, 1, 0.6313726, 0, 1,
-1.175921, 1.266981, -0.9191394, 1, 0.6352941, 0, 1,
-1.175662, 0.1093048, -1.132406, 1, 0.6431373, 0, 1,
-1.173267, -0.3063475, -2.235951, 1, 0.6470588, 0, 1,
-1.171486, 0.3368779, -2.236589, 1, 0.654902, 0, 1,
-1.170668, -0.8969817, -3.382143, 1, 0.6588235, 0, 1,
-1.169729, -0.6445547, -2.645838, 1, 0.6666667, 0, 1,
-1.168516, -0.8866304, -1.444551, 1, 0.6705883, 0, 1,
-1.157721, 0.3203878, -3.400744, 1, 0.6784314, 0, 1,
-1.156405, -0.9518466, -2.974957, 1, 0.682353, 0, 1,
-1.154184, 0.84693, -1.142663, 1, 0.6901961, 0, 1,
-1.152496, -1.152765, -2.961461, 1, 0.6941177, 0, 1,
-1.151089, 0.05664171, -1.500426, 1, 0.7019608, 0, 1,
-1.142832, -0.07454705, -2.294175, 1, 0.7098039, 0, 1,
-1.13075, -0.3970797, -3.004323, 1, 0.7137255, 0, 1,
-1.12854, -0.1223173, -0.6344475, 1, 0.7215686, 0, 1,
-1.124135, 1.242295, -1.529658, 1, 0.7254902, 0, 1,
-1.118202, 0.3672742, 0.2369608, 1, 0.7333333, 0, 1,
-1.114641, 2.515906, 0.6447024, 1, 0.7372549, 0, 1,
-1.095341, -1.097167, -1.642872, 1, 0.7450981, 0, 1,
-1.087686, -1.194061, -2.601138, 1, 0.7490196, 0, 1,
-1.082044, 1.435282, -0.15382, 1, 0.7568628, 0, 1,
-1.079783, -2.257468, -3.526248, 1, 0.7607843, 0, 1,
-1.079309, 0.0665544, -2.205106, 1, 0.7686275, 0, 1,
-1.078902, -0.2666835, -1.873903, 1, 0.772549, 0, 1,
-1.075167, 1.295195, -2.792037, 1, 0.7803922, 0, 1,
-1.071969, -0.315807, -2.871284, 1, 0.7843137, 0, 1,
-1.061844, -0.01930012, -2.886664, 1, 0.7921569, 0, 1,
-1.05546, -1.227233, -3.559863, 1, 0.7960784, 0, 1,
-1.053954, 0.966074, -1.245582, 1, 0.8039216, 0, 1,
-1.053907, -1.572367, -3.170138, 1, 0.8117647, 0, 1,
-1.044196, -0.0576826, -2.595665, 1, 0.8156863, 0, 1,
-1.042839, 1.417713, -1.94335, 1, 0.8235294, 0, 1,
-1.04264, 1.457701, 1.278347, 1, 0.827451, 0, 1,
-1.03933, -1.148522, -1.731737, 1, 0.8352941, 0, 1,
-1.038274, -0.03491236, -0.7366995, 1, 0.8392157, 0, 1,
-1.031176, -1.024399, -2.478654, 1, 0.8470588, 0, 1,
-1.027068, 2.399265, -0.7859982, 1, 0.8509804, 0, 1,
-1.024637, -0.3129444, -1.545333, 1, 0.8588235, 0, 1,
-1.018914, -1.22964, -0.7467207, 1, 0.8627451, 0, 1,
-1.0177, 1.640494, -0.2942004, 1, 0.8705882, 0, 1,
-1.012903, 0.514712, -1.427399, 1, 0.8745098, 0, 1,
-1.012403, 0.03903481, -1.783873, 1, 0.8823529, 0, 1,
-1.007541, -0.1170139, -2.948446, 1, 0.8862745, 0, 1,
-1.005178, -0.8122538, -0.8115945, 1, 0.8941177, 0, 1,
-1.000486, 0.6851971, -0.6067337, 1, 0.8980392, 0, 1,
-0.9981185, -0.1198499, -3.905988, 1, 0.9058824, 0, 1,
-0.9954137, -0.5789654, -2.197501, 1, 0.9137255, 0, 1,
-0.9950832, -1.956179, -3.16027, 1, 0.9176471, 0, 1,
-0.9910038, 0.9154916, 0.08627926, 1, 0.9254902, 0, 1,
-0.9846795, 1.080592, -2.129915, 1, 0.9294118, 0, 1,
-0.9716593, -0.3934179, -3.734067, 1, 0.9372549, 0, 1,
-0.9693267, -1.348791, -1.859998, 1, 0.9411765, 0, 1,
-0.9667686, 0.1887445, -1.765117, 1, 0.9490196, 0, 1,
-0.9560622, -1.522248, -2.793121, 1, 0.9529412, 0, 1,
-0.9559109, 0.1740237, -1.392942, 1, 0.9607843, 0, 1,
-0.9437233, 1.012099, -0.5075195, 1, 0.9647059, 0, 1,
-0.9376379, -1.693063, -1.267928, 1, 0.972549, 0, 1,
-0.9326316, -0.7619985, -2.660705, 1, 0.9764706, 0, 1,
-0.9315509, 1.438402, -1.650984, 1, 0.9843137, 0, 1,
-0.9282181, 1.732526, -0.5800696, 1, 0.9882353, 0, 1,
-0.9198552, -0.9753929, -1.217878, 1, 0.9960784, 0, 1,
-0.9178618, 0.04248428, -0.7970268, 0.9960784, 1, 0, 1,
-0.9177294, 0.6102097, -0.8705739, 0.9921569, 1, 0, 1,
-0.9032152, 0.7139303, -1.167032, 0.9843137, 1, 0, 1,
-0.8979906, -0.6892334, -3.059505, 0.9803922, 1, 0, 1,
-0.8878022, 1.384338, -0.9808323, 0.972549, 1, 0, 1,
-0.8875043, 0.9991254, -0.9647314, 0.9686275, 1, 0, 1,
-0.8862782, -1.429402, -3.35431, 0.9607843, 1, 0, 1,
-0.8819093, -0.9208918, -2.721791, 0.9568627, 1, 0, 1,
-0.8815819, 0.3810598, -0.7734624, 0.9490196, 1, 0, 1,
-0.881115, 1.906746, -0.2700165, 0.945098, 1, 0, 1,
-0.8798427, 1.104724, -0.5993841, 0.9372549, 1, 0, 1,
-0.8702138, 0.8432255, -2.146776, 0.9333333, 1, 0, 1,
-0.8683726, 0.5343992, -1.253532, 0.9254902, 1, 0, 1,
-0.8665619, -0.6604798, -2.67549, 0.9215686, 1, 0, 1,
-0.8657798, -0.6566018, -1.965599, 0.9137255, 1, 0, 1,
-0.8655114, 1.750582, 0.8654411, 0.9098039, 1, 0, 1,
-0.8583373, -0.01540857, -0.775185, 0.9019608, 1, 0, 1,
-0.8517511, 1.634732, -0.08455496, 0.8941177, 1, 0, 1,
-0.8505754, -0.244455, -1.086854, 0.8901961, 1, 0, 1,
-0.8491505, 0.0546726, -1.974197, 0.8823529, 1, 0, 1,
-0.8490503, 0.3120252, -1.386515, 0.8784314, 1, 0, 1,
-0.8448066, -0.2001768, -3.332853, 0.8705882, 1, 0, 1,
-0.8443736, -1.207734, -3.688048, 0.8666667, 1, 0, 1,
-0.8442484, 0.7294692, -0.5561128, 0.8588235, 1, 0, 1,
-0.8419654, 0.1636322, -2.706846, 0.854902, 1, 0, 1,
-0.8410539, -0.1354125, -1.316925, 0.8470588, 1, 0, 1,
-0.8340969, -1.207607, -2.738578, 0.8431373, 1, 0, 1,
-0.8302278, -0.3913973, -2.496089, 0.8352941, 1, 0, 1,
-0.8287327, -0.05180736, -2.673038, 0.8313726, 1, 0, 1,
-0.8286455, 1.57267, 1.197379, 0.8235294, 1, 0, 1,
-0.8281174, 0.8501682, -0.5281172, 0.8196079, 1, 0, 1,
-0.8257749, 0.3980422, -0.169818, 0.8117647, 1, 0, 1,
-0.8243049, 2.52691, 0.3980164, 0.8078431, 1, 0, 1,
-0.8170345, -0.02639362, -3.098614, 0.8, 1, 0, 1,
-0.8159205, -0.1226266, -2.630169, 0.7921569, 1, 0, 1,
-0.815448, -0.8853557, -3.429095, 0.7882353, 1, 0, 1,
-0.8084375, 0.1929985, -1.792992, 0.7803922, 1, 0, 1,
-0.8023841, 0.5794227, -0.4012609, 0.7764706, 1, 0, 1,
-0.8022723, -0.7946025, -0.6157289, 0.7686275, 1, 0, 1,
-0.798623, -1.217897, -3.694464, 0.7647059, 1, 0, 1,
-0.7962292, 1.843785, -0.7428592, 0.7568628, 1, 0, 1,
-0.7911674, -1.804675, -3.317677, 0.7529412, 1, 0, 1,
-0.7901724, 0.4235685, -2.712278, 0.7450981, 1, 0, 1,
-0.7878711, 0.8797616, 0.1665698, 0.7411765, 1, 0, 1,
-0.7856674, -0.7197515, -2.986391, 0.7333333, 1, 0, 1,
-0.7754248, 0.02447603, -1.257635, 0.7294118, 1, 0, 1,
-0.7734008, 0.1252673, -1.177121, 0.7215686, 1, 0, 1,
-0.7714567, -0.3481543, -2.284852, 0.7176471, 1, 0, 1,
-0.7697468, 1.273448, 0.6557749, 0.7098039, 1, 0, 1,
-0.7692082, -0.5441128, -3.440691, 0.7058824, 1, 0, 1,
-0.7619696, -1.127201, -1.742841, 0.6980392, 1, 0, 1,
-0.7597891, -0.5875226, -3.866068, 0.6901961, 1, 0, 1,
-0.7577413, 1.349833, -1.134649, 0.6862745, 1, 0, 1,
-0.7550735, 0.1498524, -2.541501, 0.6784314, 1, 0, 1,
-0.7517145, 0.2418258, -1.002813, 0.6745098, 1, 0, 1,
-0.7503775, -0.2708478, -2.8304, 0.6666667, 1, 0, 1,
-0.7497486, 0.2441718, -3.110842, 0.6627451, 1, 0, 1,
-0.749481, 1.03504, -0.1112015, 0.654902, 1, 0, 1,
-0.7437733, 1.73994, -0.9349807, 0.6509804, 1, 0, 1,
-0.7432631, -2.185343, -3.22997, 0.6431373, 1, 0, 1,
-0.7358914, -0.474058, -1.343429, 0.6392157, 1, 0, 1,
-0.7295817, -1.243993, -2.064547, 0.6313726, 1, 0, 1,
-0.7224274, 1.264863, -2.546223, 0.627451, 1, 0, 1,
-0.7215585, -0.0504075, -0.2259245, 0.6196079, 1, 0, 1,
-0.7122637, -0.657438, -2.528493, 0.6156863, 1, 0, 1,
-0.7105479, 0.02502281, -3.793676, 0.6078432, 1, 0, 1,
-0.702723, -0.08658074, -1.641457, 0.6039216, 1, 0, 1,
-0.7023988, -1.410638, -4.109086, 0.5960785, 1, 0, 1,
-0.7001326, 0.8080818, 0.7763824, 0.5882353, 1, 0, 1,
-0.6940413, -0.7718028, -2.046569, 0.5843138, 1, 0, 1,
-0.6918246, 1.854922, -2.740089, 0.5764706, 1, 0, 1,
-0.6909146, 0.5062422, -0.05505621, 0.572549, 1, 0, 1,
-0.6811415, 0.8822184, -1.238048, 0.5647059, 1, 0, 1,
-0.6792845, 1.568716, 1.018737, 0.5607843, 1, 0, 1,
-0.6742635, 0.2504813, -0.5512168, 0.5529412, 1, 0, 1,
-0.6741719, 1.134454, -0.5011493, 0.5490196, 1, 0, 1,
-0.6714218, -0.05542856, -2.379707, 0.5411765, 1, 0, 1,
-0.6713352, -1.19089, -3.830209, 0.5372549, 1, 0, 1,
-0.6663845, 1.373106, -0.214796, 0.5294118, 1, 0, 1,
-0.6646661, -0.03661102, -0.6882648, 0.5254902, 1, 0, 1,
-0.6620148, -0.3274433, -2.739228, 0.5176471, 1, 0, 1,
-0.6619495, 0.5564698, 0.3764497, 0.5137255, 1, 0, 1,
-0.6543925, 2.617338, -1.426551, 0.5058824, 1, 0, 1,
-0.6512995, -0.1698757, -2.362281, 0.5019608, 1, 0, 1,
-0.6458046, 2.288334, -1.425521, 0.4941176, 1, 0, 1,
-0.6454017, 0.4409936, -0.5019534, 0.4862745, 1, 0, 1,
-0.6451746, 0.3474084, -1.165751, 0.4823529, 1, 0, 1,
-0.6441209, -0.4266606, -2.1812, 0.4745098, 1, 0, 1,
-0.6407051, -1.608709, -5.10972, 0.4705882, 1, 0, 1,
-0.6377162, -0.4713296, -3.264565, 0.4627451, 1, 0, 1,
-0.6346354, 0.9659949, -0.2542534, 0.4588235, 1, 0, 1,
-0.6277027, -1.601076, -1.068138, 0.4509804, 1, 0, 1,
-0.6259097, 0.2074188, -0.8056043, 0.4470588, 1, 0, 1,
-0.6249301, -1.083574, -3.233294, 0.4392157, 1, 0, 1,
-0.6239095, 0.5767134, -0.8098891, 0.4352941, 1, 0, 1,
-0.6226147, -0.6786891, -3.998005, 0.427451, 1, 0, 1,
-0.6217724, -0.9342359, -2.683705, 0.4235294, 1, 0, 1,
-0.6211442, 1.681259, -1.541541, 0.4156863, 1, 0, 1,
-0.6143838, -0.05828295, -1.071127, 0.4117647, 1, 0, 1,
-0.605813, -0.015257, -1.70325, 0.4039216, 1, 0, 1,
-0.6019352, 0.3505419, -0.2146066, 0.3960784, 1, 0, 1,
-0.5972028, -1.371076, -3.333957, 0.3921569, 1, 0, 1,
-0.5970625, 0.9752201, -0.4046719, 0.3843137, 1, 0, 1,
-0.5945566, 0.0185452, -2.290976, 0.3803922, 1, 0, 1,
-0.592055, 1.030261, 0.6992615, 0.372549, 1, 0, 1,
-0.5890041, 1.1473, -0.4700411, 0.3686275, 1, 0, 1,
-0.586085, 0.5521435, 0.2448237, 0.3607843, 1, 0, 1,
-0.5794593, 0.9096007, 1.680222, 0.3568628, 1, 0, 1,
-0.5746807, -0.1106363, -3.010623, 0.3490196, 1, 0, 1,
-0.5644047, 0.2064876, -2.85633, 0.345098, 1, 0, 1,
-0.5565906, 1.538583, 0.2135039, 0.3372549, 1, 0, 1,
-0.5562173, 1.181853, -1.948229, 0.3333333, 1, 0, 1,
-0.5523456, -1.273235, -3.994325, 0.3254902, 1, 0, 1,
-0.5515224, -0.2195324, -1.952981, 0.3215686, 1, 0, 1,
-0.551327, 2.487241, 0.8629265, 0.3137255, 1, 0, 1,
-0.5494295, -1.945743, -3.69887, 0.3098039, 1, 0, 1,
-0.547884, 0.2192172, -0.05233409, 0.3019608, 1, 0, 1,
-0.5413371, 0.7305197, 0.05240369, 0.2941177, 1, 0, 1,
-0.5399256, 1.189516, 0.9587542, 0.2901961, 1, 0, 1,
-0.5398722, 0.2710104, -1.656626, 0.282353, 1, 0, 1,
-0.533616, -0.1261325, -0.04382602, 0.2784314, 1, 0, 1,
-0.5320261, 0.8741733, 0.3014098, 0.2705882, 1, 0, 1,
-0.5319312, -0.9297831, -4.224557, 0.2666667, 1, 0, 1,
-0.5252209, -0.2372324, -3.015376, 0.2588235, 1, 0, 1,
-0.5226607, -0.769623, -1.633817, 0.254902, 1, 0, 1,
-0.519773, 1.804232, 0.1329812, 0.2470588, 1, 0, 1,
-0.5188576, 0.1821322, -0.7244906, 0.2431373, 1, 0, 1,
-0.5148414, -0.9190421, -2.381211, 0.2352941, 1, 0, 1,
-0.5131062, 0.7429404, -0.9844442, 0.2313726, 1, 0, 1,
-0.510877, 1.262832, -0.5968283, 0.2235294, 1, 0, 1,
-0.5089098, 0.1665603, -2.221232, 0.2196078, 1, 0, 1,
-0.5077858, 0.08778057, -2.651372, 0.2117647, 1, 0, 1,
-0.4982421, 1.341824, -0.4112103, 0.2078431, 1, 0, 1,
-0.4945713, -0.6529459, -1.497342, 0.2, 1, 0, 1,
-0.4923319, -0.3574569, -1.516716, 0.1921569, 1, 0, 1,
-0.4918096, -0.05724066, -4.121384, 0.1882353, 1, 0, 1,
-0.4915463, 1.107841, 0.849919, 0.1803922, 1, 0, 1,
-0.4867311, 1.751865, -0.5414343, 0.1764706, 1, 0, 1,
-0.4849605, 0.8707541, -0.8626465, 0.1686275, 1, 0, 1,
-0.4811352, 1.003278, -1.086661, 0.1647059, 1, 0, 1,
-0.477891, -0.6445578, 0.04308413, 0.1568628, 1, 0, 1,
-0.4745346, -0.09881607, -2.304973, 0.1529412, 1, 0, 1,
-0.4724589, -0.9778953, -3.810831, 0.145098, 1, 0, 1,
-0.4708757, -1.349365, -2.395457, 0.1411765, 1, 0, 1,
-0.4699837, 2.706897, -0.3782071, 0.1333333, 1, 0, 1,
-0.4632945, -1.227404, -2.095507, 0.1294118, 1, 0, 1,
-0.4572194, 1.564173, -0.1182725, 0.1215686, 1, 0, 1,
-0.4565372, 0.9907836, -0.3583934, 0.1176471, 1, 0, 1,
-0.4540173, 0.2687921, -0.6264502, 0.1098039, 1, 0, 1,
-0.4530568, -0.7691542, -3.781628, 0.1058824, 1, 0, 1,
-0.4517615, 0.9350624, 1.430835, 0.09803922, 1, 0, 1,
-0.4506296, -0.9775211, -2.4442, 0.09019608, 1, 0, 1,
-0.4485104, 0.1856246, -1.377792, 0.08627451, 1, 0, 1,
-0.4473691, -0.8480176, -3.293693, 0.07843138, 1, 0, 1,
-0.4465307, 0.4584559, -1.414165, 0.07450981, 1, 0, 1,
-0.4458468, -1.0891, -3.674216, 0.06666667, 1, 0, 1,
-0.4425868, -0.4428025, -3.044118, 0.0627451, 1, 0, 1,
-0.4416382, 1.13333, -0.3677612, 0.05490196, 1, 0, 1,
-0.4393595, 0.2276983, -1.354471, 0.05098039, 1, 0, 1,
-0.4392506, -0.3835687, -1.87137, 0.04313726, 1, 0, 1,
-0.4381267, -1.267658, -1.83554, 0.03921569, 1, 0, 1,
-0.4330034, 0.6682079, 0.1301252, 0.03137255, 1, 0, 1,
-0.4326133, 0.2878025, -0.7638901, 0.02745098, 1, 0, 1,
-0.429662, -1.467478, -3.281636, 0.01960784, 1, 0, 1,
-0.4264033, -0.3198161, -1.465362, 0.01568628, 1, 0, 1,
-0.4253648, -0.733472, -1.016209, 0.007843138, 1, 0, 1,
-0.4245341, -0.3870434, -2.814873, 0.003921569, 1, 0, 1,
-0.419542, 2.550063, -0.4683878, 0, 1, 0.003921569, 1,
-0.4189257, 0.1725643, -1.732794, 0, 1, 0.01176471, 1,
-0.4180697, 1.535231, 0.5784302, 0, 1, 0.01568628, 1,
-0.4170423, 0.4457967, 0.9168075, 0, 1, 0.02352941, 1,
-0.4158431, -0.769373, -2.175555, 0, 1, 0.02745098, 1,
-0.4135624, 1.239979, -0.9671777, 0, 1, 0.03529412, 1,
-0.4117775, 0.02135511, -0.4439152, 0, 1, 0.03921569, 1,
-0.4106889, -0.6257089, -1.861147, 0, 1, 0.04705882, 1,
-0.4047707, -0.8205656, -2.897492, 0, 1, 0.05098039, 1,
-0.4037084, 0.1415622, -1.397135, 0, 1, 0.05882353, 1,
-0.4009621, 1.018002, -1.833338, 0, 1, 0.0627451, 1,
-0.3997513, -0.3957246, -2.950197, 0, 1, 0.07058824, 1,
-0.3992556, 0.4513389, -1.109376, 0, 1, 0.07450981, 1,
-0.3983642, -0.6020705, -2.470374, 0, 1, 0.08235294, 1,
-0.3981407, 1.259656, 0.1381842, 0, 1, 0.08627451, 1,
-0.3960127, -0.7555723, -3.61904, 0, 1, 0.09411765, 1,
-0.3870711, -1.106361, -4.419038, 0, 1, 0.1019608, 1,
-0.3867567, 0.1408842, -0.4448204, 0, 1, 0.1058824, 1,
-0.3863294, -0.9535233, -2.785325, 0, 1, 0.1137255, 1,
-0.3862039, 1.181425, -1.89651, 0, 1, 0.1176471, 1,
-0.3839319, 1.102763, -0.6647335, 0, 1, 0.1254902, 1,
-0.3816946, 1.797534, -0.1687746, 0, 1, 0.1294118, 1,
-0.3796252, -1.280962, -3.450278, 0, 1, 0.1372549, 1,
-0.3786104, 0.3434394, -0.3905345, 0, 1, 0.1411765, 1,
-0.3781654, -1.212825, -2.731423, 0, 1, 0.1490196, 1,
-0.3769488, 1.293586, 0.5018981, 0, 1, 0.1529412, 1,
-0.3761948, 0.2114332, -1.760203, 0, 1, 0.1607843, 1,
-0.3722488, 0.3396882, -2.281355, 0, 1, 0.1647059, 1,
-0.3713304, 0.2941485, -1.439854, 0, 1, 0.172549, 1,
-0.3701204, -2.411978, -3.898617, 0, 1, 0.1764706, 1,
-0.3683891, -0.1362183, -2.189544, 0, 1, 0.1843137, 1,
-0.3626008, 1.489325, -0.1168173, 0, 1, 0.1882353, 1,
-0.357131, -0.4485514, -3.177308, 0, 1, 0.1960784, 1,
-0.3562664, -0.9778237, -3.242392, 0, 1, 0.2039216, 1,
-0.3555633, -0.9306, -2.495731, 0, 1, 0.2078431, 1,
-0.3510357, -1.354425, -3.629913, 0, 1, 0.2156863, 1,
-0.3482831, -0.5767022, -1.988163, 0, 1, 0.2196078, 1,
-0.3482491, 1.021796, 0.792141, 0, 1, 0.227451, 1,
-0.3472725, 0.4630566, -2.614209, 0, 1, 0.2313726, 1,
-0.3451711, -0.7679493, -1.357099, 0, 1, 0.2392157, 1,
-0.339916, -0.979179, -2.803319, 0, 1, 0.2431373, 1,
-0.3379857, 0.9146168, 1.301489, 0, 1, 0.2509804, 1,
-0.3312795, -1.67172, -2.939132, 0, 1, 0.254902, 1,
-0.3271601, -0.2862304, -1.759489, 0, 1, 0.2627451, 1,
-0.3268661, -0.3691119, -2.250164, 0, 1, 0.2666667, 1,
-0.3143184, -0.1892085, -1.711117, 0, 1, 0.2745098, 1,
-0.3076968, -1.134309, -2.341924, 0, 1, 0.2784314, 1,
-0.3068391, -0.1808601, -0.7692373, 0, 1, 0.2862745, 1,
-0.3058875, -1.824335, -3.324604, 0, 1, 0.2901961, 1,
-0.3058199, -1.175712, -1.023667, 0, 1, 0.2980392, 1,
-0.3048255, 0.8795482, 1.107069, 0, 1, 0.3058824, 1,
-0.299429, 0.09917498, -2.496788, 0, 1, 0.3098039, 1,
-0.2963125, -1.431076, -3.521745, 0, 1, 0.3176471, 1,
-0.295959, -0.4621173, -2.933367, 0, 1, 0.3215686, 1,
-0.2917357, -0.7457969, -5.702742, 0, 1, 0.3294118, 1,
-0.2844959, -0.5107182, -2.181847, 0, 1, 0.3333333, 1,
-0.2813932, -1.368265, -2.173916, 0, 1, 0.3411765, 1,
-0.2791749, 0.8483824, -0.6051181, 0, 1, 0.345098, 1,
-0.274557, 0.2129951, -0.351426, 0, 1, 0.3529412, 1,
-0.2740702, 1.164615, -1.376632, 0, 1, 0.3568628, 1,
-0.2695437, -0.6105119, -2.410944, 0, 1, 0.3647059, 1,
-0.2678412, 0.8521333, -0.06244321, 0, 1, 0.3686275, 1,
-0.257785, 1.642229, 0.07320242, 0, 1, 0.3764706, 1,
-0.2552315, 1.518808, -0.1699687, 0, 1, 0.3803922, 1,
-0.2478956, -0.1991003, -2.762028, 0, 1, 0.3882353, 1,
-0.2474439, 1.872556, -0.6134322, 0, 1, 0.3921569, 1,
-0.2459661, -0.904119, -3.32096, 0, 1, 0.4, 1,
-0.2438064, 0.6405743, -0.9079512, 0, 1, 0.4078431, 1,
-0.2317709, 0.5110796, 1.204599, 0, 1, 0.4117647, 1,
-0.2312174, -1.006292, -3.957865, 0, 1, 0.4196078, 1,
-0.2265664, -1.719293, -4.705993, 0, 1, 0.4235294, 1,
-0.2255366, 0.8902482, 1.369073, 0, 1, 0.4313726, 1,
-0.2250694, -1.955184, -2.184212, 0, 1, 0.4352941, 1,
-0.2244249, 0.4082005, 0.6003734, 0, 1, 0.4431373, 1,
-0.2190605, 0.2520547, -2.229221, 0, 1, 0.4470588, 1,
-0.2134131, -0.2818373, -1.883965, 0, 1, 0.454902, 1,
-0.2120195, -1.345444, 0.3476331, 0, 1, 0.4588235, 1,
-0.2112308, -1.040807, -1.956236, 0, 1, 0.4666667, 1,
-0.2104276, -0.8824264, -4.60129, 0, 1, 0.4705882, 1,
-0.2074755, -0.6909437, -2.389523, 0, 1, 0.4784314, 1,
-0.2070909, -1.535961, -3.65135, 0, 1, 0.4823529, 1,
-0.2054606, -0.02607419, -2.382777, 0, 1, 0.4901961, 1,
-0.2044834, 0.6635827, -0.8397149, 0, 1, 0.4941176, 1,
-0.2040294, -1.53695, -3.059518, 0, 1, 0.5019608, 1,
-0.2040157, 0.1618189, 0.9770321, 0, 1, 0.509804, 1,
-0.2002936, -1.63007, -3.280301, 0, 1, 0.5137255, 1,
-0.1977183, 0.251448, -0.8559287, 0, 1, 0.5215687, 1,
-0.1941968, 0.8272167, -0.5676318, 0, 1, 0.5254902, 1,
-0.1921353, -1.483597, -3.48946, 0, 1, 0.5333334, 1,
-0.191599, 0.2360596, 0.973932, 0, 1, 0.5372549, 1,
-0.1902346, 0.1539218, -0.6585054, 0, 1, 0.5450981, 1,
-0.1897124, -0.7559761, -3.073551, 0, 1, 0.5490196, 1,
-0.1892419, 1.208381, -0.2730275, 0, 1, 0.5568628, 1,
-0.1889201, 1.213288, -0.6276609, 0, 1, 0.5607843, 1,
-0.1866272, 0.9131538, 0.1194045, 0, 1, 0.5686275, 1,
-0.1861327, 1.104216, -0.2748754, 0, 1, 0.572549, 1,
-0.1855671, 0.04627827, -0.4752326, 0, 1, 0.5803922, 1,
-0.1790217, -3.862499, -2.69667, 0, 1, 0.5843138, 1,
-0.1773519, -0.1220322, -1.031969, 0, 1, 0.5921569, 1,
-0.1770688, -0.6283746, -2.829087, 0, 1, 0.5960785, 1,
-0.1752784, -0.2726284, -2.681541, 0, 1, 0.6039216, 1,
-0.1752052, 0.330639, -1.12445, 0, 1, 0.6117647, 1,
-0.1725013, -1.140674, -4.51131, 0, 1, 0.6156863, 1,
-0.1704341, 0.7435568, -0.104741, 0, 1, 0.6235294, 1,
-0.1686092, -0.962158, -3.628519, 0, 1, 0.627451, 1,
-0.1684777, 0.393713, -0.8040438, 0, 1, 0.6352941, 1,
-0.1666686, 0.6126702, -0.712011, 0, 1, 0.6392157, 1,
-0.1639665, -1.177981, -2.963729, 0, 1, 0.6470588, 1,
-0.161701, 1.761719, -1.14193, 0, 1, 0.6509804, 1,
-0.1588375, 0.2867665, 0.1667417, 0, 1, 0.6588235, 1,
-0.1562758, 1.042328, 0.4780872, 0, 1, 0.6627451, 1,
-0.1543455, 0.2408907, -1.866301, 0, 1, 0.6705883, 1,
-0.1477321, 0.3775575, -0.4900254, 0, 1, 0.6745098, 1,
-0.1436303, -1.159733, -2.517217, 0, 1, 0.682353, 1,
-0.1428939, -0.06379759, -2.657926, 0, 1, 0.6862745, 1,
-0.137431, -1.860138, -3.608569, 0, 1, 0.6941177, 1,
-0.1367202, 0.7658991, -2.022013, 0, 1, 0.7019608, 1,
-0.1347857, 0.6563162, -0.6478544, 0, 1, 0.7058824, 1,
-0.1222465, 0.2660236, -0.8689586, 0, 1, 0.7137255, 1,
-0.122019, -1.431504, -3.6364, 0, 1, 0.7176471, 1,
-0.1198367, -0.2874518, -2.32355, 0, 1, 0.7254902, 1,
-0.1177006, 0.1096973, 0.2420991, 0, 1, 0.7294118, 1,
-0.1157629, 1.468051, 1.028612, 0, 1, 0.7372549, 1,
-0.1134462, 1.879089, 0.8773286, 0, 1, 0.7411765, 1,
-0.1053902, -0.009004178, -2.477509, 0, 1, 0.7490196, 1,
-0.1035183, 0.7055069, -0.8967614, 0, 1, 0.7529412, 1,
-0.1003136, -0.498952, -3.758643, 0, 1, 0.7607843, 1,
-0.1000122, -0.6063112, -4.153055, 0, 1, 0.7647059, 1,
-0.09514248, -1.176448, -3.074394, 0, 1, 0.772549, 1,
-0.0908585, 0.5877275, -1.393016, 0, 1, 0.7764706, 1,
-0.09078655, -0.1613012, -3.177668, 0, 1, 0.7843137, 1,
-0.08909617, 0.2644389, -0.256413, 0, 1, 0.7882353, 1,
-0.08680045, 1.111978, -0.3741978, 0, 1, 0.7960784, 1,
-0.08278942, 0.7438784, -1.217263, 0, 1, 0.8039216, 1,
-0.08107357, -0.7905444, -1.59246, 0, 1, 0.8078431, 1,
-0.07966006, -0.3126804, -3.59334, 0, 1, 0.8156863, 1,
-0.07948148, -0.08352402, -1.741694, 0, 1, 0.8196079, 1,
-0.07937343, -1.87291, -1.809553, 0, 1, 0.827451, 1,
-0.07873854, 0.2540199, 0.8240393, 0, 1, 0.8313726, 1,
-0.07567776, 0.8833966, 0.08211759, 0, 1, 0.8392157, 1,
-0.07494099, -0.3271041, -3.981102, 0, 1, 0.8431373, 1,
-0.06378773, -1.516784, -1.856906, 0, 1, 0.8509804, 1,
-0.0618317, 0.9266895, 0.3071871, 0, 1, 0.854902, 1,
-0.06163862, -0.04560077, -2.006736, 0, 1, 0.8627451, 1,
-0.06145954, -0.3014608, -1.683751, 0, 1, 0.8666667, 1,
-0.05625417, 0.06854249, 2.649745, 0, 1, 0.8745098, 1,
-0.05560556, -0.8170177, -3.208111, 0, 1, 0.8784314, 1,
-0.05526289, -0.7698331, -1.867198, 0, 1, 0.8862745, 1,
-0.05445861, -0.3322748, -2.293644, 0, 1, 0.8901961, 1,
-0.05008397, -0.4852974, -4.45693, 0, 1, 0.8980392, 1,
-0.04752114, 0.5077059, 1.916262, 0, 1, 0.9058824, 1,
-0.04707557, 0.947919, -1.420112, 0, 1, 0.9098039, 1,
-0.0459834, 0.906301, 0.3242635, 0, 1, 0.9176471, 1,
-0.04587364, -0.869782, -5.010962, 0, 1, 0.9215686, 1,
-0.04419603, -0.4144085, -1.664533, 0, 1, 0.9294118, 1,
-0.04100154, 1.578477, 0.9363844, 0, 1, 0.9333333, 1,
-0.03816563, -1.4282, -3.307173, 0, 1, 0.9411765, 1,
-0.03295936, -0.4667264, -2.502795, 0, 1, 0.945098, 1,
-0.03120365, -0.08415332, -3.847394, 0, 1, 0.9529412, 1,
-0.03101097, 0.06346486, -2.025017, 0, 1, 0.9568627, 1,
-0.02991148, -1.546768, -4.092711, 0, 1, 0.9647059, 1,
-0.02179398, 0.3165396, 2.611977, 0, 1, 0.9686275, 1,
-0.004387756, 1.403714, -1.082431, 0, 1, 0.9764706, 1,
-0.002162804, -0.0778669, -1.494757, 0, 1, 0.9803922, 1,
0.002317956, 0.9735317, -0.0446881, 0, 1, 0.9882353, 1,
0.009547845, -1.485057, 2.223322, 0, 1, 0.9921569, 1,
0.01996177, -0.4167964, 5.014889, 0, 1, 1, 1,
0.02363493, 1.817635, 1.213709, 0, 0.9921569, 1, 1,
0.02601317, -0.2683311, 2.455598, 0, 0.9882353, 1, 1,
0.03357601, -0.7458921, 3.411941, 0, 0.9803922, 1, 1,
0.04222097, 0.417752, -1.199938, 0, 0.9764706, 1, 1,
0.04265759, 0.1515689, 1.900588, 0, 0.9686275, 1, 1,
0.047065, 2.744709, 1.120692, 0, 0.9647059, 1, 1,
0.04887407, -0.4749818, 1.969402, 0, 0.9568627, 1, 1,
0.05058519, -0.7554135, 3.868034, 0, 0.9529412, 1, 1,
0.05140368, 0.5226133, -0.8610282, 0, 0.945098, 1, 1,
0.05242477, -1.343939, 2.784858, 0, 0.9411765, 1, 1,
0.05392921, -1.887322, 2.024387, 0, 0.9333333, 1, 1,
0.05598035, -0.6107402, 4.600972, 0, 0.9294118, 1, 1,
0.05916689, -0.07847603, 2.548511, 0, 0.9215686, 1, 1,
0.06735405, -1.250128, 2.769931, 0, 0.9176471, 1, 1,
0.07150876, 0.1924716, 0.0321471, 0, 0.9098039, 1, 1,
0.07418065, 2.287699, -1.094422, 0, 0.9058824, 1, 1,
0.07587618, -0.08776929, 2.239584, 0, 0.8980392, 1, 1,
0.07760197, -1.068468, 2.99638, 0, 0.8901961, 1, 1,
0.07838064, 1.422307, 0.1231594, 0, 0.8862745, 1, 1,
0.07855175, 0.1923227, 1.182583, 0, 0.8784314, 1, 1,
0.0818783, -0.1745933, 1.492165, 0, 0.8745098, 1, 1,
0.0831279, 1.123709, 1.109291, 0, 0.8666667, 1, 1,
0.08353752, 0.365687, 0.5551019, 0, 0.8627451, 1, 1,
0.08869015, 0.2816446, 1.088839, 0, 0.854902, 1, 1,
0.08909186, -0.871973, 3.33952, 0, 0.8509804, 1, 1,
0.09010504, -0.6450516, 3.43351, 0, 0.8431373, 1, 1,
0.0922799, 0.870328, -0.3282703, 0, 0.8392157, 1, 1,
0.09266158, 0.4819611, 1.444438, 0, 0.8313726, 1, 1,
0.09826655, -0.2757095, 3.842545, 0, 0.827451, 1, 1,
0.09863896, 1.247104, -0.8138046, 0, 0.8196079, 1, 1,
0.1001443, 0.8160627, -0.7509099, 0, 0.8156863, 1, 1,
0.1042351, -0.008541003, 0.4239891, 0, 0.8078431, 1, 1,
0.1081575, 0.2567113, 0.004838118, 0, 0.8039216, 1, 1,
0.1115226, -0.7746198, 2.302506, 0, 0.7960784, 1, 1,
0.1127091, 1.305429, 0.08315863, 0, 0.7882353, 1, 1,
0.1190517, -0.3028237, 2.622479, 0, 0.7843137, 1, 1,
0.1201623, 0.8911206, -0.3817686, 0, 0.7764706, 1, 1,
0.1241825, -0.9945024, 2.689627, 0, 0.772549, 1, 1,
0.1251624, -1.152807, 3.08061, 0, 0.7647059, 1, 1,
0.1352602, 2.336993, -0.571018, 0, 0.7607843, 1, 1,
0.1353703, 0.07248667, 1.898999, 0, 0.7529412, 1, 1,
0.1367238, -1.865495, 2.698137, 0, 0.7490196, 1, 1,
0.1378211, 0.621825, 0.7137417, 0, 0.7411765, 1, 1,
0.1381839, -0.5406935, 3.141638, 0, 0.7372549, 1, 1,
0.1389132, 0.2654215, -1.087054, 0, 0.7294118, 1, 1,
0.1409215, 0.05488929, 0.05506086, 0, 0.7254902, 1, 1,
0.1445464, -0.1609247, 3.687876, 0, 0.7176471, 1, 1,
0.1475052, 0.2244266, 2.716173, 0, 0.7137255, 1, 1,
0.1491243, 1.864999, -0.2105848, 0, 0.7058824, 1, 1,
0.1495911, -0.1231024, 1.312078, 0, 0.6980392, 1, 1,
0.1545682, -0.02078604, 0.9205642, 0, 0.6941177, 1, 1,
0.1554907, -0.7460975, 2.262149, 0, 0.6862745, 1, 1,
0.1556685, 0.8556352, -0.5852208, 0, 0.682353, 1, 1,
0.1584652, 0.3611926, 0.893119, 0, 0.6745098, 1, 1,
0.1593691, -0.9373172, 4.302648, 0, 0.6705883, 1, 1,
0.1691373, 0.4356921, -0.4902397, 0, 0.6627451, 1, 1,
0.1697697, 0.6686182, 0.5106062, 0, 0.6588235, 1, 1,
0.1723503, 2.015623, 0.136909, 0, 0.6509804, 1, 1,
0.1724167, 0.7506614, 0.9338775, 0, 0.6470588, 1, 1,
0.1729727, 0.9338089, 1.09797, 0, 0.6392157, 1, 1,
0.1789235, 0.4897639, -0.6229167, 0, 0.6352941, 1, 1,
0.1794191, 0.6045375, -1.496358, 0, 0.627451, 1, 1,
0.1795211, -0.2652608, 2.331024, 0, 0.6235294, 1, 1,
0.1798, 2.431648, 1.197641, 0, 0.6156863, 1, 1,
0.1806526, 1.668089, 0.06435012, 0, 0.6117647, 1, 1,
0.1860438, 0.4821223, 0.1983103, 0, 0.6039216, 1, 1,
0.1865474, 0.02728721, 1.659389, 0, 0.5960785, 1, 1,
0.1866286, 0.07642542, -0.1478781, 0, 0.5921569, 1, 1,
0.1896777, 0.3972819, -0.623257, 0, 0.5843138, 1, 1,
0.1933805, -0.3359126, 1.478528, 0, 0.5803922, 1, 1,
0.1946365, -1.801677, 2.996828, 0, 0.572549, 1, 1,
0.1961643, 1.372215, -0.4273615, 0, 0.5686275, 1, 1,
0.2003555, -0.7260688, 2.888979, 0, 0.5607843, 1, 1,
0.2184597, 0.7380939, -1.285562, 0, 0.5568628, 1, 1,
0.2204115, -0.08834037, 1.909461, 0, 0.5490196, 1, 1,
0.2207022, -0.7610447, 2.943682, 0, 0.5450981, 1, 1,
0.2220721, -0.2669664, 1.101584, 0, 0.5372549, 1, 1,
0.2234025, -0.319529, 2.614944, 0, 0.5333334, 1, 1,
0.2234095, -1.351963, 2.538758, 0, 0.5254902, 1, 1,
0.2246184, 1.741201, 1.491263, 0, 0.5215687, 1, 1,
0.2299256, -0.04580874, 2.197008, 0, 0.5137255, 1, 1,
0.2339014, -1.602755, 3.89346, 0, 0.509804, 1, 1,
0.2368343, -0.8508633, 3.287508, 0, 0.5019608, 1, 1,
0.2459222, 0.3403082, -1.002948, 0, 0.4941176, 1, 1,
0.2468888, 0.4745801, -0.5349815, 0, 0.4901961, 1, 1,
0.2521309, 0.5453838, -0.3780431, 0, 0.4823529, 1, 1,
0.2530057, 0.3522312, -0.2447564, 0, 0.4784314, 1, 1,
0.2610163, -0.4126064, 2.0195, 0, 0.4705882, 1, 1,
0.2620043, 0.5511076, 0.8068654, 0, 0.4666667, 1, 1,
0.2676767, -0.9315772, 2.888659, 0, 0.4588235, 1, 1,
0.2680223, -0.8577065, 3.287476, 0, 0.454902, 1, 1,
0.2691468, 0.331736, 0.8756055, 0, 0.4470588, 1, 1,
0.2710617, 0.7766603, -0.6140976, 0, 0.4431373, 1, 1,
0.273009, -1.657542, 5.183003, 0, 0.4352941, 1, 1,
0.2739622, -0.8010132, 1.122323, 0, 0.4313726, 1, 1,
0.2744488, -1.200164, 3.473229, 0, 0.4235294, 1, 1,
0.2746417, -0.3364007, 1.698777, 0, 0.4196078, 1, 1,
0.2791913, 0.1397697, 1.321315, 0, 0.4117647, 1, 1,
0.2814263, -0.3752793, -0.3054949, 0, 0.4078431, 1, 1,
0.2880278, -0.407972, 2.610143, 0, 0.4, 1, 1,
0.289254, -0.5063221, 2.834997, 0, 0.3921569, 1, 1,
0.2907293, 1.303684, -1.128049, 0, 0.3882353, 1, 1,
0.2927939, 1.487065, -0.8810974, 0, 0.3803922, 1, 1,
0.3018656, -0.3490601, 3.072333, 0, 0.3764706, 1, 1,
0.3047589, 1.090139, 0.4512776, 0, 0.3686275, 1, 1,
0.3047752, 1.406516, 0.3671417, 0, 0.3647059, 1, 1,
0.3084134, 0.4041217, -0.009748314, 0, 0.3568628, 1, 1,
0.3144054, -2.618586, 1.940042, 0, 0.3529412, 1, 1,
0.3150391, -0.5588636, 3.551405, 0, 0.345098, 1, 1,
0.319042, 0.7808135, 1.099586, 0, 0.3411765, 1, 1,
0.3212877, -1.39694, 3.175097, 0, 0.3333333, 1, 1,
0.3221745, -0.9431151, 2.281234, 0, 0.3294118, 1, 1,
0.3228446, 1.420452, 1.693801, 0, 0.3215686, 1, 1,
0.3234031, -1.213931, 2.078468, 0, 0.3176471, 1, 1,
0.3259617, -1.745472, 3.944572, 0, 0.3098039, 1, 1,
0.3279812, -1.008376, 3.196796, 0, 0.3058824, 1, 1,
0.3315245, 0.3610815, 2.656819, 0, 0.2980392, 1, 1,
0.3379329, -1.190191, 3.079678, 0, 0.2901961, 1, 1,
0.3380231, -0.794686, 2.031168, 0, 0.2862745, 1, 1,
0.3384426, -0.2084601, 2.557624, 0, 0.2784314, 1, 1,
0.3406444, -0.8057425, 2.46566, 0, 0.2745098, 1, 1,
0.3413335, -1.238597, 1.253701, 0, 0.2666667, 1, 1,
0.343091, -1.061518, 3.397895, 0, 0.2627451, 1, 1,
0.3435583, 0.4501733, 1.874727, 0, 0.254902, 1, 1,
0.346619, 0.3990841, -0.6964631, 0, 0.2509804, 1, 1,
0.3470995, 0.3001294, 2.967983, 0, 0.2431373, 1, 1,
0.3510233, 1.247981, 1.197091, 0, 0.2392157, 1, 1,
0.3511613, 0.1852557, 0.5442025, 0, 0.2313726, 1, 1,
0.3516218, 0.3217257, 1.019804, 0, 0.227451, 1, 1,
0.3528477, 0.03411428, 2.118186, 0, 0.2196078, 1, 1,
0.3601917, 0.988819, 1.460485, 0, 0.2156863, 1, 1,
0.3631945, -1.431806, 3.031897, 0, 0.2078431, 1, 1,
0.3644542, 0.8558025, 0.05357186, 0, 0.2039216, 1, 1,
0.3647962, -1.282517, 4.19624, 0, 0.1960784, 1, 1,
0.3649748, 0.4585049, 0.04284726, 0, 0.1882353, 1, 1,
0.3670244, -1.157342, 3.337937, 0, 0.1843137, 1, 1,
0.371592, -0.7052608, 0.9319918, 0, 0.1764706, 1, 1,
0.371754, 0.2525887, 1.59274, 0, 0.172549, 1, 1,
0.374823, 0.09602891, 0.9173474, 0, 0.1647059, 1, 1,
0.3813489, 0.8325137, 1.820923, 0, 0.1607843, 1, 1,
0.3821822, 0.287064, 1.46096, 0, 0.1529412, 1, 1,
0.383601, 0.1294115, 2.049557, 0, 0.1490196, 1, 1,
0.3865085, -1.492921, 0.8403193, 0, 0.1411765, 1, 1,
0.3872021, 1.61872, 0.02077411, 0, 0.1372549, 1, 1,
0.3876286, 0.3078806, 0.6520327, 0, 0.1294118, 1, 1,
0.3877923, -0.7269564, 1.397959, 0, 0.1254902, 1, 1,
0.3929354, 0.5381643, 1.458786, 0, 0.1176471, 1, 1,
0.3941058, 0.3187063, 1.288472, 0, 0.1137255, 1, 1,
0.4016233, 0.5538883, 0.1275882, 0, 0.1058824, 1, 1,
0.401668, 0.5949524, -0.2440289, 0, 0.09803922, 1, 1,
0.4024072, -0.8353179, 1.439596, 0, 0.09411765, 1, 1,
0.405458, -0.6331515, 2.598139, 0, 0.08627451, 1, 1,
0.4076945, -0.1284609, 1.453887, 0, 0.08235294, 1, 1,
0.4093201, 0.8580741, -0.4309219, 0, 0.07450981, 1, 1,
0.4115149, -0.9210431, 3.319216, 0, 0.07058824, 1, 1,
0.4125944, -0.08667, 2.439734, 0, 0.0627451, 1, 1,
0.4139383, -1.182877, 2.746518, 0, 0.05882353, 1, 1,
0.4158184, -0.4000314, 1.789137, 0, 0.05098039, 1, 1,
0.4182622, 0.7397114, 1.675031, 0, 0.04705882, 1, 1,
0.4199733, 0.8880608, 1.889306, 0, 0.03921569, 1, 1,
0.4258054, 1.095107, 1.139096, 0, 0.03529412, 1, 1,
0.4261419, -0.5584986, 2.44216, 0, 0.02745098, 1, 1,
0.4287741, -1.314164, 4.004402, 0, 0.02352941, 1, 1,
0.4338862, -0.00114568, -0.3696254, 0, 0.01568628, 1, 1,
0.434624, 0.2619179, 1.425987, 0, 0.01176471, 1, 1,
0.4354956, -1.058215, 2.289639, 0, 0.003921569, 1, 1,
0.4380735, -0.2954106, 3.045066, 0.003921569, 0, 1, 1,
0.4409595, 0.8581189, 0.8065279, 0.007843138, 0, 1, 1,
0.4456528, -0.07547043, 0.1742941, 0.01568628, 0, 1, 1,
0.4464209, -1.378773, 4.977026, 0.01960784, 0, 1, 1,
0.4513533, -0.1598694, 1.276192, 0.02745098, 0, 1, 1,
0.4521002, -0.2742226, 1.618724, 0.03137255, 0, 1, 1,
0.4562936, -1.42272, 1.593584, 0.03921569, 0, 1, 1,
0.4576732, 0.903747, -1.141802, 0.04313726, 0, 1, 1,
0.4582996, 0.04577852, 1.535206, 0.05098039, 0, 1, 1,
0.4583682, -0.1823383, 1.949258, 0.05490196, 0, 1, 1,
0.4599517, 0.7943906, 1.047804, 0.0627451, 0, 1, 1,
0.4602524, -1.63942, 1.086613, 0.06666667, 0, 1, 1,
0.4630534, -0.7584748, 4.042792, 0.07450981, 0, 1, 1,
0.4635563, 1.14792, -0.7600934, 0.07843138, 0, 1, 1,
0.4642944, 0.1913692, 1.268732, 0.08627451, 0, 1, 1,
0.4646704, -0.9077964, 2.159323, 0.09019608, 0, 1, 1,
0.4709765, 1.580441, -1.020614, 0.09803922, 0, 1, 1,
0.475495, 0.9477828, 1.177962, 0.1058824, 0, 1, 1,
0.47768, 0.3931271, 0.04392003, 0.1098039, 0, 1, 1,
0.4780653, -1.685824, 3.538299, 0.1176471, 0, 1, 1,
0.479843, 1.073555, -2.935823, 0.1215686, 0, 1, 1,
0.4848329, 0.3711702, 1.251376, 0.1294118, 0, 1, 1,
0.4853217, -0.3728892, 2.716098, 0.1333333, 0, 1, 1,
0.4904675, 1.170695, -0.2461702, 0.1411765, 0, 1, 1,
0.4907979, -0.6725245, 3.616044, 0.145098, 0, 1, 1,
0.492065, 0.1431699, 1.113725, 0.1529412, 0, 1, 1,
0.4945363, 0.3166814, 0.9008163, 0.1568628, 0, 1, 1,
0.500355, -1.372999, 2.35431, 0.1647059, 0, 1, 1,
0.5054707, -0.6999144, 2.674946, 0.1686275, 0, 1, 1,
0.5111558, -1.087241, 2.724597, 0.1764706, 0, 1, 1,
0.5171192, 0.458672, 1.054935, 0.1803922, 0, 1, 1,
0.5175201, 2.04615, -1.340495, 0.1882353, 0, 1, 1,
0.517583, 0.04107352, 1.615431, 0.1921569, 0, 1, 1,
0.5195286, -0.8784488, 2.815378, 0.2, 0, 1, 1,
0.5231703, -0.8975532, 4.143199, 0.2078431, 0, 1, 1,
0.5247128, -0.8465126, 3.219332, 0.2117647, 0, 1, 1,
0.529436, -2.1551, 3.289973, 0.2196078, 0, 1, 1,
0.5347563, 0.0326266, 3.606301, 0.2235294, 0, 1, 1,
0.5399256, 0.4678844, -0.7017795, 0.2313726, 0, 1, 1,
0.5421064, -1.052016, 1.553958, 0.2352941, 0, 1, 1,
0.5431126, 0.8597752, -1.424359, 0.2431373, 0, 1, 1,
0.5443926, 1.338578, -0.576492, 0.2470588, 0, 1, 1,
0.546721, 2.002781, 0.858632, 0.254902, 0, 1, 1,
0.5482752, 1.586932, 0.4885714, 0.2588235, 0, 1, 1,
0.5487592, 0.4843655, 2.07008, 0.2666667, 0, 1, 1,
0.5502769, -0.2865924, 1.302264, 0.2705882, 0, 1, 1,
0.5521124, -0.6566297, 1.155727, 0.2784314, 0, 1, 1,
0.5533093, 2.928214, 1.012631, 0.282353, 0, 1, 1,
0.5539075, 1.282744, 1.968425, 0.2901961, 0, 1, 1,
0.5564938, 0.05829105, 1.499623, 0.2941177, 0, 1, 1,
0.5573199, 0.3332985, 0.7346221, 0.3019608, 0, 1, 1,
0.5667621, -0.4612581, 2.582506, 0.3098039, 0, 1, 1,
0.5675225, -0.9455728, 3.444733, 0.3137255, 0, 1, 1,
0.5684816, 0.6777582, -0.04717643, 0.3215686, 0, 1, 1,
0.5685535, -0.406335, 2.346347, 0.3254902, 0, 1, 1,
0.5720756, -0.0505375, 0.3794022, 0.3333333, 0, 1, 1,
0.5742903, 1.746615, 0.5011896, 0.3372549, 0, 1, 1,
0.5753821, 0.2973017, 0.5864064, 0.345098, 0, 1, 1,
0.5768976, -1.101314, 1.061572, 0.3490196, 0, 1, 1,
0.5802444, 0.5920126, 0.3394389, 0.3568628, 0, 1, 1,
0.5850096, 0.4514275, 2.052446, 0.3607843, 0, 1, 1,
0.5907449, -0.2903215, 1.629193, 0.3686275, 0, 1, 1,
0.5935191, 0.1853784, 0.9180527, 0.372549, 0, 1, 1,
0.5948842, 0.2235245, 1.68905, 0.3803922, 0, 1, 1,
0.6030039, 0.853923, -0.7193443, 0.3843137, 0, 1, 1,
0.6058073, -0.005029816, 0.1587725, 0.3921569, 0, 1, 1,
0.6068655, -1.432398, 1.69021, 0.3960784, 0, 1, 1,
0.6110565, -0.9055635, 0.8790554, 0.4039216, 0, 1, 1,
0.6147191, -0.09001856, 2.128366, 0.4117647, 0, 1, 1,
0.6237417, -2.123379, 3.947751, 0.4156863, 0, 1, 1,
0.6266816, 0.7788231, 1.546193, 0.4235294, 0, 1, 1,
0.6294564, -0.8237121, 3.453734, 0.427451, 0, 1, 1,
0.6296965, -0.5696399, 1.684893, 0.4352941, 0, 1, 1,
0.6310251, 2.767458, -1.410495, 0.4392157, 0, 1, 1,
0.6332746, 0.6122472, 0.08632836, 0.4470588, 0, 1, 1,
0.6410391, 0.7667738, -0.7080091, 0.4509804, 0, 1, 1,
0.6430222, 1.430688, -0.5132368, 0.4588235, 0, 1, 1,
0.6460384, -0.6837146, 1.803035, 0.4627451, 0, 1, 1,
0.646696, 1.848526, -1.167709, 0.4705882, 0, 1, 1,
0.6489113, -0.06299514, 0.9907719, 0.4745098, 0, 1, 1,
0.6523275, -0.6442145, 1.085637, 0.4823529, 0, 1, 1,
0.6551535, 0.4978753, 1.452092, 0.4862745, 0, 1, 1,
0.6598259, 1.709553, 0.4374505, 0.4941176, 0, 1, 1,
0.6661879, -1.326212, 2.643056, 0.5019608, 0, 1, 1,
0.6676193, 2.307524, -0.2293828, 0.5058824, 0, 1, 1,
0.6707079, -0.2488955, 0.7680474, 0.5137255, 0, 1, 1,
0.670902, 0.9031261, 0.3991901, 0.5176471, 0, 1, 1,
0.6721158, 0.1130164, -0.5435755, 0.5254902, 0, 1, 1,
0.6722109, 0.4830653, 1.542747, 0.5294118, 0, 1, 1,
0.6763329, -0.2052254, -0.6767395, 0.5372549, 0, 1, 1,
0.6769948, -0.2279944, 2.52292, 0.5411765, 0, 1, 1,
0.6780334, 2.392327, -1.632167, 0.5490196, 0, 1, 1,
0.6824702, -1.052773, 2.364234, 0.5529412, 0, 1, 1,
0.6883249, -0.5407984, 4.493411, 0.5607843, 0, 1, 1,
0.6918578, -1.215548, 1.936824, 0.5647059, 0, 1, 1,
0.6931936, 1.340745, 0.4404672, 0.572549, 0, 1, 1,
0.6971717, 0.05997625, 2.04464, 0.5764706, 0, 1, 1,
0.699047, -1.71563, 1.490791, 0.5843138, 0, 1, 1,
0.699069, 0.8359922, 0.4838039, 0.5882353, 0, 1, 1,
0.7014675, 0.9101097, 0.6899227, 0.5960785, 0, 1, 1,
0.7049618, 0.5387622, 2.496347, 0.6039216, 0, 1, 1,
0.705035, -0.323511, 2.429709, 0.6078432, 0, 1, 1,
0.7075494, -0.6373408, 1.764232, 0.6156863, 0, 1, 1,
0.7104373, 0.2486495, 1.473232, 0.6196079, 0, 1, 1,
0.7150241, 0.03130901, 2.788735, 0.627451, 0, 1, 1,
0.7160106, 2.214382, -0.3523782, 0.6313726, 0, 1, 1,
0.7242877, 1.369446, 1.892815, 0.6392157, 0, 1, 1,
0.7336673, -0.6332036, 2.315871, 0.6431373, 0, 1, 1,
0.7344134, -0.5686203, 1.390871, 0.6509804, 0, 1, 1,
0.7359433, -0.07572167, 0.8309486, 0.654902, 0, 1, 1,
0.7415974, -0.1995502, 1.673467, 0.6627451, 0, 1, 1,
0.741977, 1.067644, 0.9639074, 0.6666667, 0, 1, 1,
0.7458812, 1.306509, 0.2564827, 0.6745098, 0, 1, 1,
0.7466736, 0.1489129, 2.893632, 0.6784314, 0, 1, 1,
0.7631906, 0.8592696, 0.006624106, 0.6862745, 0, 1, 1,
0.7651639, 0.287576, 0.5313518, 0.6901961, 0, 1, 1,
0.7676129, 0.7847663, 0.8396817, 0.6980392, 0, 1, 1,
0.768629, 2.322979, 0.5755451, 0.7058824, 0, 1, 1,
0.769868, 2.047021, -0.567725, 0.7098039, 0, 1, 1,
0.7709616, 0.3691286, 1.322413, 0.7176471, 0, 1, 1,
0.7742249, 1.132563, 0.8573295, 0.7215686, 0, 1, 1,
0.782975, -0.1507501, 2.20703, 0.7294118, 0, 1, 1,
0.7832561, -0.7522421, 4.669798, 0.7333333, 0, 1, 1,
0.7847334, -0.07072493, 1.462933, 0.7411765, 0, 1, 1,
0.7893788, -0.2193537, 2.832607, 0.7450981, 0, 1, 1,
0.7900281, -1.384303, 2.835189, 0.7529412, 0, 1, 1,
0.7912055, -0.02261854, 2.066848, 0.7568628, 0, 1, 1,
0.7954603, 0.8787318, 0.8250796, 0.7647059, 0, 1, 1,
0.7981927, 0.3082527, 1.229492, 0.7686275, 0, 1, 1,
0.8054782, -0.9378076, 2.126964, 0.7764706, 0, 1, 1,
0.8081591, -0.6867006, 2.926558, 0.7803922, 0, 1, 1,
0.8109304, 0.3922669, 2.432125, 0.7882353, 0, 1, 1,
0.811496, -1.432596, 1.315984, 0.7921569, 0, 1, 1,
0.8146758, 0.3857862, 3.044873, 0.8, 0, 1, 1,
0.8288339, -0.1947065, 2.154728, 0.8078431, 0, 1, 1,
0.8289112, -2.39319, 2.35147, 0.8117647, 0, 1, 1,
0.8289262, 1.33975, 0.6679142, 0.8196079, 0, 1, 1,
0.8295348, -0.4893781, 2.010046, 0.8235294, 0, 1, 1,
0.8295873, 0.08166268, 1.910694, 0.8313726, 0, 1, 1,
0.8346753, -1.224939, 2.215494, 0.8352941, 0, 1, 1,
0.8352134, -0.0265686, 0.5071319, 0.8431373, 0, 1, 1,
0.8397863, -0.9296736, -0.3215784, 0.8470588, 0, 1, 1,
0.8421813, -0.8672979, 2.741559, 0.854902, 0, 1, 1,
0.8428338, 1.243435, 2.401427, 0.8588235, 0, 1, 1,
0.8465652, -0.915089, 3.433595, 0.8666667, 0, 1, 1,
0.850933, -0.1171894, 2.263761, 0.8705882, 0, 1, 1,
0.8527342, -0.677889, 3.022168, 0.8784314, 0, 1, 1,
0.8554339, 0.583815, 1.184941, 0.8823529, 0, 1, 1,
0.8576887, -0.6014245, 2.823785, 0.8901961, 0, 1, 1,
0.85962, 0.5252181, 2.191408, 0.8941177, 0, 1, 1,
0.8801578, 1.611742, 1.42738, 0.9019608, 0, 1, 1,
0.8841835, 0.246081, 1.126214, 0.9098039, 0, 1, 1,
0.8897156, 1.493286, 0.1806864, 0.9137255, 0, 1, 1,
0.8921995, -0.502065, 1.109676, 0.9215686, 0, 1, 1,
0.8946846, 0.07436556, 2.007307, 0.9254902, 0, 1, 1,
0.8953052, 0.04354718, 1.95409, 0.9333333, 0, 1, 1,
0.8959695, -0.366603, 4.418313, 0.9372549, 0, 1, 1,
0.896961, 0.2636338, 2.032378, 0.945098, 0, 1, 1,
0.8972598, 0.7400849, 1.897531, 0.9490196, 0, 1, 1,
0.8991376, 1.132285, 0.9243043, 0.9568627, 0, 1, 1,
0.9014956, 2.945238, 0.05967466, 0.9607843, 0, 1, 1,
0.9029844, -0.1483195, 2.949516, 0.9686275, 0, 1, 1,
0.9098717, -0.5724343, 1.3793, 0.972549, 0, 1, 1,
0.9099914, 0.02530626, -0.03591734, 0.9803922, 0, 1, 1,
0.9117469, 0.8753914, 1.215563, 0.9843137, 0, 1, 1,
0.9127964, 1.255404, 0.6350625, 0.9921569, 0, 1, 1,
0.9152851, 0.1399828, 1.949323, 0.9960784, 0, 1, 1,
0.9164817, -0.8048179, 3.969292, 1, 0, 0.9960784, 1,
0.916929, -0.5930338, 2.677623, 1, 0, 0.9882353, 1,
0.9199271, 0.134228, 2.117134, 1, 0, 0.9843137, 1,
0.9202551, 0.4555352, 0.710166, 1, 0, 0.9764706, 1,
0.9215757, 1.274745, 0.7612601, 1, 0, 0.972549, 1,
0.9221905, -1.307246, 1.925417, 1, 0, 0.9647059, 1,
0.9256253, -1.33019, 1.982424, 1, 0, 0.9607843, 1,
0.9279894, 0.8992116, 1.346517, 1, 0, 0.9529412, 1,
0.9290867, -0.9312733, 1.159125, 1, 0, 0.9490196, 1,
0.9380715, 0.1739056, 2.108961, 1, 0, 0.9411765, 1,
0.9387683, 0.4398582, -0.9035411, 1, 0, 0.9372549, 1,
0.9419342, 0.6103526, -0.3185572, 1, 0, 0.9294118, 1,
0.9445729, 1.638273, 2.005121, 1, 0, 0.9254902, 1,
0.951347, 0.7073026, 2.191877, 1, 0, 0.9176471, 1,
0.9617447, -0.4080132, 0.5722415, 1, 0, 0.9137255, 1,
0.9683766, 0.3987283, 0.8081362, 1, 0, 0.9058824, 1,
0.9689959, -1.911171, 4.216971, 1, 0, 0.9019608, 1,
0.9703782, 0.4816019, 2.277036, 1, 0, 0.8941177, 1,
0.9740967, 0.1873631, 3.257709, 1, 0, 0.8862745, 1,
0.9755065, -1.079761, 2.840716, 1, 0, 0.8823529, 1,
0.9829137, -1.176839, 1.837253, 1, 0, 0.8745098, 1,
0.9930502, -0.4139887, -0.03929943, 1, 0, 0.8705882, 1,
0.9983217, 0.6670026, 0.1059736, 1, 0, 0.8627451, 1,
1.012908, -0.4335687, 1.294015, 1, 0, 0.8588235, 1,
1.017053, 1.322098, 1.074648, 1, 0, 0.8509804, 1,
1.025546, -1.175124, 2.79854, 1, 0, 0.8470588, 1,
1.028048, 0.556129, 1.22697, 1, 0, 0.8392157, 1,
1.032153, -1.053558, 2.523659, 1, 0, 0.8352941, 1,
1.041977, -0.4061362, 2.519537, 1, 0, 0.827451, 1,
1.042253, -0.6752484, 1.588058, 1, 0, 0.8235294, 1,
1.045394, -2.026764, 2.556104, 1, 0, 0.8156863, 1,
1.046581, -0.06232857, 1.908082, 1, 0, 0.8117647, 1,
1.047831, -0.5568063, 1.584528, 1, 0, 0.8039216, 1,
1.059798, -1.021194, 2.090958, 1, 0, 0.7960784, 1,
1.061297, 0.1589892, 1.985015, 1, 0, 0.7921569, 1,
1.061998, -1.568693, 2.077078, 1, 0, 0.7843137, 1,
1.063402, 0.9694616, 0.148692, 1, 0, 0.7803922, 1,
1.067041, 0.3471228, 1.760544, 1, 0, 0.772549, 1,
1.068962, 0.02542264, 2.561591, 1, 0, 0.7686275, 1,
1.071564, 0.933699, 0.05692496, 1, 0, 0.7607843, 1,
1.075363, -0.004413659, 2.045759, 1, 0, 0.7568628, 1,
1.079134, -1.012452, 3.382295, 1, 0, 0.7490196, 1,
1.079504, -1.412485, 1.710103, 1, 0, 0.7450981, 1,
1.083238, 0.1029018, -0.4217344, 1, 0, 0.7372549, 1,
1.088187, -0.09637523, 1.354612, 1, 0, 0.7333333, 1,
1.103421, 0.5964141, -0.05460788, 1, 0, 0.7254902, 1,
1.106918, 0.9206719, -0.5646968, 1, 0, 0.7215686, 1,
1.1133, 1.399913, 0.2088136, 1, 0, 0.7137255, 1,
1.12988, -0.4746413, 1.217401, 1, 0, 0.7098039, 1,
1.13126, 0.1585432, 0.6420593, 1, 0, 0.7019608, 1,
1.139346, -0.3625859, 0.9537017, 1, 0, 0.6941177, 1,
1.157625, 1.267199, 1.370281, 1, 0, 0.6901961, 1,
1.169893, 2.66537, 1.929649, 1, 0, 0.682353, 1,
1.176332, 1.325789, -1.226184, 1, 0, 0.6784314, 1,
1.176827, 0.5849757, 0.7103533, 1, 0, 0.6705883, 1,
1.181055, 0.9905199, 1.629761, 1, 0, 0.6666667, 1,
1.181194, -0.4831294, 2.244414, 1, 0, 0.6588235, 1,
1.185034, 0.7612906, 0.015653, 1, 0, 0.654902, 1,
1.185157, 0.8024197, 2.434321, 1, 0, 0.6470588, 1,
1.190813, -0.6144527, 1.89129, 1, 0, 0.6431373, 1,
1.196099, -1.19, 1.374494, 1, 0, 0.6352941, 1,
1.197424, -1.173019, 1.353487, 1, 0, 0.6313726, 1,
1.214244, 0.2301651, 2.295156, 1, 0, 0.6235294, 1,
1.215446, 0.3792316, 0.7579418, 1, 0, 0.6196079, 1,
1.215608, 0.5150064, 0.3761316, 1, 0, 0.6117647, 1,
1.219007, -0.2374308, 1.518649, 1, 0, 0.6078432, 1,
1.223159, -0.6093907, 1.966576, 1, 0, 0.6, 1,
1.223613, -0.1140824, 1.641485, 1, 0, 0.5921569, 1,
1.226882, 1.994459, 1.735867, 1, 0, 0.5882353, 1,
1.23132, 0.3850147, 1.841989, 1, 0, 0.5803922, 1,
1.241765, -0.4587192, 3.630708, 1, 0, 0.5764706, 1,
1.250029, -0.7957316, 1.741314, 1, 0, 0.5686275, 1,
1.256123, 1.451793, 1.459852, 1, 0, 0.5647059, 1,
1.258458, -0.4181674, 2.957117, 1, 0, 0.5568628, 1,
1.263617, 0.006104617, 2.868391, 1, 0, 0.5529412, 1,
1.268377, -1.33542, 2.001087, 1, 0, 0.5450981, 1,
1.277549, -0.9069587, 2.312215, 1, 0, 0.5411765, 1,
1.290051, 1.41572, -0.4327979, 1, 0, 0.5333334, 1,
1.298304, -0.8158582, 3.207857, 1, 0, 0.5294118, 1,
1.313473, 0.3103986, 1.600821, 1, 0, 0.5215687, 1,
1.322368, -0.1737371, 2.146958, 1, 0, 0.5176471, 1,
1.324676, -2.526728, 3.120033, 1, 0, 0.509804, 1,
1.325356, -0.4591869, 1.246361, 1, 0, 0.5058824, 1,
1.337836, -1.82588, 0.05871582, 1, 0, 0.4980392, 1,
1.342664, 1.934064, 1.563154, 1, 0, 0.4901961, 1,
1.352484, 1.586852, 0.8910923, 1, 0, 0.4862745, 1,
1.356727, -0.1269867, 1.573207, 1, 0, 0.4784314, 1,
1.362724, 0.5290723, -0.3277896, 1, 0, 0.4745098, 1,
1.365812, -1.226153, 2.937951, 1, 0, 0.4666667, 1,
1.367338, -0.4642108, -0.7053968, 1, 0, 0.4627451, 1,
1.373971, -0.06811933, 3.277574, 1, 0, 0.454902, 1,
1.375366, 2.200366, 2.125627, 1, 0, 0.4509804, 1,
1.379607, 0.6759467, 0.193389, 1, 0, 0.4431373, 1,
1.383357, 0.587384, 2.413532, 1, 0, 0.4392157, 1,
1.386831, -0.5089232, 2.139856, 1, 0, 0.4313726, 1,
1.394184, -1.028527, 2.618572, 1, 0, 0.427451, 1,
1.405551, -0.0936854, 1.1889, 1, 0, 0.4196078, 1,
1.408139, 0.1091064, -0.2894848, 1, 0, 0.4156863, 1,
1.428209, 0.5838116, 1.479953, 1, 0, 0.4078431, 1,
1.437233, -0.1905523, 0.4232766, 1, 0, 0.4039216, 1,
1.444234, 0.2589401, 2.425946, 1, 0, 0.3960784, 1,
1.452422, 0.9701571, 1.988068, 1, 0, 0.3882353, 1,
1.452645, 0.238901, 2.044083, 1, 0, 0.3843137, 1,
1.45413, 1.802433, -0.0505312, 1, 0, 0.3764706, 1,
1.457021, 0.4640933, 1.364807, 1, 0, 0.372549, 1,
1.478994, 0.9541593, 1.556955, 1, 0, 0.3647059, 1,
1.486947, -0.1342755, 2.675133, 1, 0, 0.3607843, 1,
1.487034, -0.2449336, 2.24747, 1, 0, 0.3529412, 1,
1.488171, 1.675437, 0.3445355, 1, 0, 0.3490196, 1,
1.49871, -2.128664, 2.278463, 1, 0, 0.3411765, 1,
1.498942, -0.4838362, 1.858706, 1, 0, 0.3372549, 1,
1.502675, 0.6090043, 3.258366, 1, 0, 0.3294118, 1,
1.503215, -0.6750667, 1.549055, 1, 0, 0.3254902, 1,
1.506816, -0.3722441, 2.144311, 1, 0, 0.3176471, 1,
1.515115, 1.06723, 2.154954, 1, 0, 0.3137255, 1,
1.515201, -0.6049044, 1.289353, 1, 0, 0.3058824, 1,
1.518364, 1.588505, -0.9995022, 1, 0, 0.2980392, 1,
1.52343, 1.387797, 1.475519, 1, 0, 0.2941177, 1,
1.530195, -2.127286, 1.591735, 1, 0, 0.2862745, 1,
1.536053, -1.034657, 2.536607, 1, 0, 0.282353, 1,
1.551266, 0.699729, 0.9501781, 1, 0, 0.2745098, 1,
1.560784, 0.2831668, 0.3150023, 1, 0, 0.2705882, 1,
1.567893, -0.6428654, -0.3920299, 1, 0, 0.2627451, 1,
1.571155, 0.270674, 1.72915, 1, 0, 0.2588235, 1,
1.57285, 0.7595894, 1.37585, 1, 0, 0.2509804, 1,
1.600174, -1.731301, 2.529055, 1, 0, 0.2470588, 1,
1.634653, 0.709281, 1.529367, 1, 0, 0.2392157, 1,
1.65976, 0.7964642, 1.382704, 1, 0, 0.2352941, 1,
1.666281, -1.273412, 1.711615, 1, 0, 0.227451, 1,
1.668821, -0.1132928, 1.620014, 1, 0, 0.2235294, 1,
1.675105, -1.04358, 1.912876, 1, 0, 0.2156863, 1,
1.736206, 3.052213, 0.5338838, 1, 0, 0.2117647, 1,
1.74295, 1.304836, 1.70104, 1, 0, 0.2039216, 1,
1.751467, -0.2367473, 1.16588, 1, 0, 0.1960784, 1,
1.78817, -0.4179973, 2.878405, 1, 0, 0.1921569, 1,
1.817397, 0.2576433, 0.1173049, 1, 0, 0.1843137, 1,
1.821914, 0.07358763, 2.623379, 1, 0, 0.1803922, 1,
1.830618, 0.8528377, 1.585724, 1, 0, 0.172549, 1,
1.841527, -1.061707, 2.228354, 1, 0, 0.1686275, 1,
1.853281, 1.955982, 1.105389, 1, 0, 0.1607843, 1,
1.853656, 0.7629204, 2.128502, 1, 0, 0.1568628, 1,
1.867347, -0.05901456, 1.880224, 1, 0, 0.1490196, 1,
1.869709, 1.533919, 1.310823, 1, 0, 0.145098, 1,
1.875476, -1.403821, 2.356056, 1, 0, 0.1372549, 1,
1.889205, -0.3710178, 2.2647, 1, 0, 0.1333333, 1,
1.931815, 1.399472, -0.1572727, 1, 0, 0.1254902, 1,
1.974957, 0.8009169, 2.41871, 1, 0, 0.1215686, 1,
2.019605, -1.052238, 1.64289, 1, 0, 0.1137255, 1,
2.021192, -0.1083855, 1.951163, 1, 0, 0.1098039, 1,
2.023386, 0.4187275, 1.658554, 1, 0, 0.1019608, 1,
2.08987, -0.248409, 0.8932061, 1, 0, 0.09411765, 1,
2.147008, 0.9211183, 0.9887086, 1, 0, 0.09019608, 1,
2.176302, 0.01272991, 2.464691, 1, 0, 0.08235294, 1,
2.246868, 0.08585858, -0.4367019, 1, 0, 0.07843138, 1,
2.264293, -3.00715, 0.7614218, 1, 0, 0.07058824, 1,
2.277844, -1.371148, 1.299749, 1, 0, 0.06666667, 1,
2.330026, -0.1286279, 1.454654, 1, 0, 0.05882353, 1,
2.413639, -1.078913, 2.972311, 1, 0, 0.05490196, 1,
2.420604, 2.287743, 0.995595, 1, 0, 0.04705882, 1,
2.492807, -1.477877, 2.096334, 1, 0, 0.04313726, 1,
2.511865, 0.8417651, 2.94158, 1, 0, 0.03529412, 1,
2.521529, 0.5224229, 1.068989, 1, 0, 0.03137255, 1,
2.534764, 1.272061, 2.449355, 1, 0, 0.02352941, 1,
2.595208, 0.4312588, 1.332539, 1, 0, 0.01960784, 1,
2.72291, 0.3249444, 0.6479519, 1, 0, 0.01176471, 1,
3.709749, 1.084042, 2.543383, 1, 0, 0.007843138, 1
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
0.4075301, -5.034543, -7.547876, 0, -0.5, 0.5, 0.5,
0.4075301, -5.034543, -7.547876, 1, -0.5, 0.5, 0.5,
0.4075301, -5.034543, -7.547876, 1, 1.5, 0.5, 0.5,
0.4075301, -5.034543, -7.547876, 0, 1.5, 0.5, 0.5
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
-4.014142, -0.405143, -7.547876, 0, -0.5, 0.5, 0.5,
-4.014142, -0.405143, -7.547876, 1, -0.5, 0.5, 0.5,
-4.014142, -0.405143, -7.547876, 1, 1.5, 0.5, 0.5,
-4.014142, -0.405143, -7.547876, 0, 1.5, 0.5, 0.5
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
-4.014142, -5.034543, -0.2598693, 0, -0.5, 0.5, 0.5,
-4.014142, -5.034543, -0.2598693, 1, -0.5, 0.5, 0.5,
-4.014142, -5.034543, -0.2598693, 1, 1.5, 0.5, 0.5,
-4.014142, -5.034543, -0.2598693, 0, 1.5, 0.5, 0.5
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
-2, -3.966219, -5.866028,
3, -3.966219, -5.866028,
-2, -3.966219, -5.866028,
-2, -4.144273, -6.146336,
-1, -3.966219, -5.866028,
-1, -4.144273, -6.146336,
0, -3.966219, -5.866028,
0, -4.144273, -6.146336,
1, -3.966219, -5.866028,
1, -4.144273, -6.146336,
2, -3.966219, -5.866028,
2, -4.144273, -6.146336,
3, -3.966219, -5.866028,
3, -4.144273, -6.146336
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
-2, -4.500381, -6.706952, 0, -0.5, 0.5, 0.5,
-2, -4.500381, -6.706952, 1, -0.5, 0.5, 0.5,
-2, -4.500381, -6.706952, 1, 1.5, 0.5, 0.5,
-2, -4.500381, -6.706952, 0, 1.5, 0.5, 0.5,
-1, -4.500381, -6.706952, 0, -0.5, 0.5, 0.5,
-1, -4.500381, -6.706952, 1, -0.5, 0.5, 0.5,
-1, -4.500381, -6.706952, 1, 1.5, 0.5, 0.5,
-1, -4.500381, -6.706952, 0, 1.5, 0.5, 0.5,
0, -4.500381, -6.706952, 0, -0.5, 0.5, 0.5,
0, -4.500381, -6.706952, 1, -0.5, 0.5, 0.5,
0, -4.500381, -6.706952, 1, 1.5, 0.5, 0.5,
0, -4.500381, -6.706952, 0, 1.5, 0.5, 0.5,
1, -4.500381, -6.706952, 0, -0.5, 0.5, 0.5,
1, -4.500381, -6.706952, 1, -0.5, 0.5, 0.5,
1, -4.500381, -6.706952, 1, 1.5, 0.5, 0.5,
1, -4.500381, -6.706952, 0, 1.5, 0.5, 0.5,
2, -4.500381, -6.706952, 0, -0.5, 0.5, 0.5,
2, -4.500381, -6.706952, 1, -0.5, 0.5, 0.5,
2, -4.500381, -6.706952, 1, 1.5, 0.5, 0.5,
2, -4.500381, -6.706952, 0, 1.5, 0.5, 0.5,
3, -4.500381, -6.706952, 0, -0.5, 0.5, 0.5,
3, -4.500381, -6.706952, 1, -0.5, 0.5, 0.5,
3, -4.500381, -6.706952, 1, 1.5, 0.5, 0.5,
3, -4.500381, -6.706952, 0, 1.5, 0.5, 0.5
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
-2.993756, -3, -5.866028,
-2.993756, 3, -5.866028,
-2.993756, -3, -5.866028,
-3.16382, -3, -6.146336,
-2.993756, -2, -5.866028,
-3.16382, -2, -6.146336,
-2.993756, -1, -5.866028,
-3.16382, -1, -6.146336,
-2.993756, 0, -5.866028,
-3.16382, 0, -6.146336,
-2.993756, 1, -5.866028,
-3.16382, 1, -6.146336,
-2.993756, 2, -5.866028,
-3.16382, 2, -6.146336,
-2.993756, 3, -5.866028,
-3.16382, 3, -6.146336
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
-3.503948, -3, -6.706952, 0, -0.5, 0.5, 0.5,
-3.503948, -3, -6.706952, 1, -0.5, 0.5, 0.5,
-3.503948, -3, -6.706952, 1, 1.5, 0.5, 0.5,
-3.503948, -3, -6.706952, 0, 1.5, 0.5, 0.5,
-3.503948, -2, -6.706952, 0, -0.5, 0.5, 0.5,
-3.503948, -2, -6.706952, 1, -0.5, 0.5, 0.5,
-3.503948, -2, -6.706952, 1, 1.5, 0.5, 0.5,
-3.503948, -2, -6.706952, 0, 1.5, 0.5, 0.5,
-3.503948, -1, -6.706952, 0, -0.5, 0.5, 0.5,
-3.503948, -1, -6.706952, 1, -0.5, 0.5, 0.5,
-3.503948, -1, -6.706952, 1, 1.5, 0.5, 0.5,
-3.503948, -1, -6.706952, 0, 1.5, 0.5, 0.5,
-3.503948, 0, -6.706952, 0, -0.5, 0.5, 0.5,
-3.503948, 0, -6.706952, 1, -0.5, 0.5, 0.5,
-3.503948, 0, -6.706952, 1, 1.5, 0.5, 0.5,
-3.503948, 0, -6.706952, 0, 1.5, 0.5, 0.5,
-3.503948, 1, -6.706952, 0, -0.5, 0.5, 0.5,
-3.503948, 1, -6.706952, 1, -0.5, 0.5, 0.5,
-3.503948, 1, -6.706952, 1, 1.5, 0.5, 0.5,
-3.503948, 1, -6.706952, 0, 1.5, 0.5, 0.5,
-3.503948, 2, -6.706952, 0, -0.5, 0.5, 0.5,
-3.503948, 2, -6.706952, 1, -0.5, 0.5, 0.5,
-3.503948, 2, -6.706952, 1, 1.5, 0.5, 0.5,
-3.503948, 2, -6.706952, 0, 1.5, 0.5, 0.5,
-3.503948, 3, -6.706952, 0, -0.5, 0.5, 0.5,
-3.503948, 3, -6.706952, 1, -0.5, 0.5, 0.5,
-3.503948, 3, -6.706952, 1, 1.5, 0.5, 0.5,
-3.503948, 3, -6.706952, 0, 1.5, 0.5, 0.5
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
-2.993756, -3.966219, -4,
-2.993756, -3.966219, 4,
-2.993756, -3.966219, -4,
-3.16382, -4.144273, -4,
-2.993756, -3.966219, -2,
-3.16382, -4.144273, -2,
-2.993756, -3.966219, 0,
-3.16382, -4.144273, 0,
-2.993756, -3.966219, 2,
-3.16382, -4.144273, 2,
-2.993756, -3.966219, 4,
-3.16382, -4.144273, 4
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
-3.503948, -4.500381, -4, 0, -0.5, 0.5, 0.5,
-3.503948, -4.500381, -4, 1, -0.5, 0.5, 0.5,
-3.503948, -4.500381, -4, 1, 1.5, 0.5, 0.5,
-3.503948, -4.500381, -4, 0, 1.5, 0.5, 0.5,
-3.503948, -4.500381, -2, 0, -0.5, 0.5, 0.5,
-3.503948, -4.500381, -2, 1, -0.5, 0.5, 0.5,
-3.503948, -4.500381, -2, 1, 1.5, 0.5, 0.5,
-3.503948, -4.500381, -2, 0, 1.5, 0.5, 0.5,
-3.503948, -4.500381, 0, 0, -0.5, 0.5, 0.5,
-3.503948, -4.500381, 0, 1, -0.5, 0.5, 0.5,
-3.503948, -4.500381, 0, 1, 1.5, 0.5, 0.5,
-3.503948, -4.500381, 0, 0, 1.5, 0.5, 0.5,
-3.503948, -4.500381, 2, 0, -0.5, 0.5, 0.5,
-3.503948, -4.500381, 2, 1, -0.5, 0.5, 0.5,
-3.503948, -4.500381, 2, 1, 1.5, 0.5, 0.5,
-3.503948, -4.500381, 2, 0, 1.5, 0.5, 0.5,
-3.503948, -4.500381, 4, 0, -0.5, 0.5, 0.5,
-3.503948, -4.500381, 4, 1, -0.5, 0.5, 0.5,
-3.503948, -4.500381, 4, 1, 1.5, 0.5, 0.5,
-3.503948, -4.500381, 4, 0, 1.5, 0.5, 0.5
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
-2.993756, -3.966219, -5.866028,
-2.993756, 3.155933, -5.866028,
-2.993756, -3.966219, 5.34629,
-2.993756, 3.155933, 5.34629,
-2.993756, -3.966219, -5.866028,
-2.993756, -3.966219, 5.34629,
-2.993756, 3.155933, -5.866028,
-2.993756, 3.155933, 5.34629,
-2.993756, -3.966219, -5.866028,
3.808816, -3.966219, -5.866028,
-2.993756, -3.966219, 5.34629,
3.808816, -3.966219, 5.34629,
-2.993756, 3.155933, -5.866028,
3.808816, 3.155933, -5.866028,
-2.993756, 3.155933, 5.34629,
3.808816, 3.155933, 5.34629,
3.808816, -3.966219, -5.866028,
3.808816, 3.155933, -5.866028,
3.808816, -3.966219, 5.34629,
3.808816, 3.155933, 5.34629,
3.808816, -3.966219, -5.866028,
3.808816, -3.966219, 5.34629,
3.808816, 3.155933, -5.866028,
3.808816, 3.155933, 5.34629
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
var radius = 7.968953;
var distance = 35.45477;
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
mvMatrix.translate( -0.4075301, 0.405143, 0.2598693 );
mvMatrix.scale( 1.266608, 1.209773, 0.7684574 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.45477);
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
chlorimuron-ethyl<-read.table("chlorimuron-ethyl.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-chlorimuron-ethyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'chlorimuron' not found
```

```r
y<-chlorimuron-ethyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'chlorimuron' not found
```

```r
z<-chlorimuron-ethyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'chlorimuron' not found
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
-2.894689, -2.500513, -1.859959, 0, 0, 1, 1, 1,
-2.733371, -0.2312149, -2.520506, 1, 0, 0, 1, 1,
-2.718021, -1.174304, -2.438554, 1, 0, 0, 1, 1,
-2.712173, 0.3998607, -3.057745, 1, 0, 0, 1, 1,
-2.66648, 2.390106, -1.169224, 1, 0, 0, 1, 1,
-2.654465, 0.7590208, -2.347108, 1, 0, 0, 1, 1,
-2.633106, 0.7791011, -1.460674, 0, 0, 0, 1, 1,
-2.422202, -1.073427, -0.8421379, 0, 0, 0, 1, 1,
-2.292629, 0.5457217, -0.4778502, 0, 0, 0, 1, 1,
-2.245909, -0.583054, -1.433964, 0, 0, 0, 1, 1,
-2.21454, -1.984289, -3.151301, 0, 0, 0, 1, 1,
-2.202868, -1.53413, -3.460628, 0, 0, 0, 1, 1,
-2.187056, 0.1055083, -0.9641438, 0, 0, 0, 1, 1,
-2.167222, -1.515895, -3.022432, 1, 1, 1, 1, 1,
-2.15488, -2.323899, -2.015481, 1, 1, 1, 1, 1,
-2.076246, 2.573047, 0.3675796, 1, 1, 1, 1, 1,
-2.0548, 0.7945971, -0.4729283, 1, 1, 1, 1, 1,
-2.052519, 0.8031739, -0.8093156, 1, 1, 1, 1, 1,
-2.048711, 0.5552182, -0.1071178, 1, 1, 1, 1, 1,
-1.994092, -0.9190221, -1.120903, 1, 1, 1, 1, 1,
-1.98989, 0.4571263, -0.01722134, 1, 1, 1, 1, 1,
-1.976943, 0.7122278, -0.3881769, 1, 1, 1, 1, 1,
-1.973005, 0.6025177, -1.621017, 1, 1, 1, 1, 1,
-1.971364, 0.6013682, -2.316083, 1, 1, 1, 1, 1,
-1.938432, 1.331333, -0.9754919, 1, 1, 1, 1, 1,
-1.936555, 0.4930525, 0.1489229, 1, 1, 1, 1, 1,
-1.920686, 0.04692446, -2.038075, 1, 1, 1, 1, 1,
-1.866317, -1.465212, -2.581791, 1, 1, 1, 1, 1,
-1.865395, -0.1952004, -4.025379, 0, 0, 1, 1, 1,
-1.832401, 0.6189235, -0.6470867, 1, 0, 0, 1, 1,
-1.81811, -1.109977, -3.8224, 1, 0, 0, 1, 1,
-1.772639, -0.2077137, -0.579378, 1, 0, 0, 1, 1,
-1.761711, 0.9041269, 0.2056842, 1, 0, 0, 1, 1,
-1.745283, 1.325772, 0.04695551, 1, 0, 0, 1, 1,
-1.744188, -0.7010093, -1.309236, 0, 0, 0, 1, 1,
-1.714982, -0.6661143, -3.270391, 0, 0, 0, 1, 1,
-1.689037, 1.314395, -1.589855, 0, 0, 0, 1, 1,
-1.67732, 1.183076, -0.4679067, 0, 0, 0, 1, 1,
-1.672501, 1.429243, -0.7765952, 0, 0, 0, 1, 1,
-1.668329, 0.619582, -2.65048, 0, 0, 0, 1, 1,
-1.660636, 1.981666, -2.047615, 0, 0, 0, 1, 1,
-1.657264, -1.753814, -3.132753, 1, 1, 1, 1, 1,
-1.644663, -0.02333437, -1.475276, 1, 1, 1, 1, 1,
-1.629762, -1.370344, -1.68936, 1, 1, 1, 1, 1,
-1.610508, 1.109084, -1.323217, 1, 1, 1, 1, 1,
-1.587825, -1.59736, -3.64198, 1, 1, 1, 1, 1,
-1.581928, -1.046828, -2.899042, 1, 1, 1, 1, 1,
-1.580195, -0.5755718, -0.9911571, 1, 1, 1, 1, 1,
-1.562448, 1.040918, -0.9094941, 1, 1, 1, 1, 1,
-1.560747, -1.092647, -1.755872, 1, 1, 1, 1, 1,
-1.557769, 0.5403929, -0.3539782, 1, 1, 1, 1, 1,
-1.540764, 0.6542818, 0.6187263, 1, 1, 1, 1, 1,
-1.530032, -0.511364, -1.495668, 1, 1, 1, 1, 1,
-1.511315, -0.708598, -1.160584, 1, 1, 1, 1, 1,
-1.503843, -0.2344264, -1.983977, 1, 1, 1, 1, 1,
-1.496062, -0.01048592, 0.0912722, 1, 1, 1, 1, 1,
-1.461587, 0.1985641, -1.482789, 0, 0, 1, 1, 1,
-1.452155, 1.665356, 0.08186658, 1, 0, 0, 1, 1,
-1.444683, -0.3264958, -1.56939, 1, 0, 0, 1, 1,
-1.438178, -0.1749667, -3.830161, 1, 0, 0, 1, 1,
-1.431374, -0.9141942, -1.676604, 1, 0, 0, 1, 1,
-1.427276, 0.03511209, -2.593846, 1, 0, 0, 1, 1,
-1.425869, -0.5626187, -2.77914, 0, 0, 0, 1, 1,
-1.422982, -0.4276712, -1.555886, 0, 0, 0, 1, 1,
-1.419544, -0.241759, -0.9821671, 0, 0, 0, 1, 1,
-1.409561, 1.059758, -1.645988, 0, 0, 0, 1, 1,
-1.406924, 0.1581104, -1.421594, 0, 0, 0, 1, 1,
-1.40455, -2.119686, -2.938398, 0, 0, 0, 1, 1,
-1.386768, 0.2076013, -1.146849, 0, 0, 0, 1, 1,
-1.383844, 0.2154061, -1.550947, 1, 1, 1, 1, 1,
-1.382804, -1.153954, -2.774442, 1, 1, 1, 1, 1,
-1.381403, 0.5525361, -0.7561724, 1, 1, 1, 1, 1,
-1.360173, 0.3321617, -2.854678, 1, 1, 1, 1, 1,
-1.353442, -0.5480024, -2.384247, 1, 1, 1, 1, 1,
-1.351593, 0.700902, -0.2917854, 1, 1, 1, 1, 1,
-1.349117, 0.9764625, -0.9399346, 1, 1, 1, 1, 1,
-1.347356, -0.3457212, -2.444658, 1, 1, 1, 1, 1,
-1.336962, 1.649302, -0.2155589, 1, 1, 1, 1, 1,
-1.323733, -1.193633, -0.4154866, 1, 1, 1, 1, 1,
-1.321256, 0.6440935, -0.8188986, 1, 1, 1, 1, 1,
-1.31385, -0.6919417, -1.938236, 1, 1, 1, 1, 1,
-1.303662, 0.5220312, 0.7079918, 1, 1, 1, 1, 1,
-1.297495, 1.079348, -2.36823, 1, 1, 1, 1, 1,
-1.295374, -1.256369, -2.847547, 1, 1, 1, 1, 1,
-1.292832, 1.855388, 0.6253189, 0, 0, 1, 1, 1,
-1.281502, 0.3054136, -1.958957, 1, 0, 0, 1, 1,
-1.273939, -0.1702503, -2.215927, 1, 0, 0, 1, 1,
-1.273136, 0.2572387, -2.14208, 1, 0, 0, 1, 1,
-1.266396, 0.3326315, -2.164801, 1, 0, 0, 1, 1,
-1.257396, 1.237806, 1.249585, 1, 0, 0, 1, 1,
-1.254908, -0.7546792, -1.909526, 0, 0, 0, 1, 1,
-1.25339, 1.7975, 0.315953, 0, 0, 0, 1, 1,
-1.247487, 0.1857439, -1.212962, 0, 0, 0, 1, 1,
-1.240405, -1.195248, -2.275334, 0, 0, 0, 1, 1,
-1.238092, 0.6512213, -0.6624152, 0, 0, 0, 1, 1,
-1.226632, 1.084688, -1.845303, 0, 0, 0, 1, 1,
-1.225302, 0.2836626, -0.7294655, 0, 0, 0, 1, 1,
-1.220352, 0.3642333, -1.714076, 1, 1, 1, 1, 1,
-1.218557, -0.2693731, -1.916885, 1, 1, 1, 1, 1,
-1.204001, 0.6404005, -0.496388, 1, 1, 1, 1, 1,
-1.200622, 0.257841, -1.97113, 1, 1, 1, 1, 1,
-1.197894, -0.5691208, -1.844595, 1, 1, 1, 1, 1,
-1.195473, -0.1157784, -0.663609, 1, 1, 1, 1, 1,
-1.194501, -0.9074949, -2.317102, 1, 1, 1, 1, 1,
-1.193085, 0.01780249, -0.3103215, 1, 1, 1, 1, 1,
-1.183968, 1.081337, -1.85219, 1, 1, 1, 1, 1,
-1.175921, 1.266981, -0.9191394, 1, 1, 1, 1, 1,
-1.175662, 0.1093048, -1.132406, 1, 1, 1, 1, 1,
-1.173267, -0.3063475, -2.235951, 1, 1, 1, 1, 1,
-1.171486, 0.3368779, -2.236589, 1, 1, 1, 1, 1,
-1.170668, -0.8969817, -3.382143, 1, 1, 1, 1, 1,
-1.169729, -0.6445547, -2.645838, 1, 1, 1, 1, 1,
-1.168516, -0.8866304, -1.444551, 0, 0, 1, 1, 1,
-1.157721, 0.3203878, -3.400744, 1, 0, 0, 1, 1,
-1.156405, -0.9518466, -2.974957, 1, 0, 0, 1, 1,
-1.154184, 0.84693, -1.142663, 1, 0, 0, 1, 1,
-1.152496, -1.152765, -2.961461, 1, 0, 0, 1, 1,
-1.151089, 0.05664171, -1.500426, 1, 0, 0, 1, 1,
-1.142832, -0.07454705, -2.294175, 0, 0, 0, 1, 1,
-1.13075, -0.3970797, -3.004323, 0, 0, 0, 1, 1,
-1.12854, -0.1223173, -0.6344475, 0, 0, 0, 1, 1,
-1.124135, 1.242295, -1.529658, 0, 0, 0, 1, 1,
-1.118202, 0.3672742, 0.2369608, 0, 0, 0, 1, 1,
-1.114641, 2.515906, 0.6447024, 0, 0, 0, 1, 1,
-1.095341, -1.097167, -1.642872, 0, 0, 0, 1, 1,
-1.087686, -1.194061, -2.601138, 1, 1, 1, 1, 1,
-1.082044, 1.435282, -0.15382, 1, 1, 1, 1, 1,
-1.079783, -2.257468, -3.526248, 1, 1, 1, 1, 1,
-1.079309, 0.0665544, -2.205106, 1, 1, 1, 1, 1,
-1.078902, -0.2666835, -1.873903, 1, 1, 1, 1, 1,
-1.075167, 1.295195, -2.792037, 1, 1, 1, 1, 1,
-1.071969, -0.315807, -2.871284, 1, 1, 1, 1, 1,
-1.061844, -0.01930012, -2.886664, 1, 1, 1, 1, 1,
-1.05546, -1.227233, -3.559863, 1, 1, 1, 1, 1,
-1.053954, 0.966074, -1.245582, 1, 1, 1, 1, 1,
-1.053907, -1.572367, -3.170138, 1, 1, 1, 1, 1,
-1.044196, -0.0576826, -2.595665, 1, 1, 1, 1, 1,
-1.042839, 1.417713, -1.94335, 1, 1, 1, 1, 1,
-1.04264, 1.457701, 1.278347, 1, 1, 1, 1, 1,
-1.03933, -1.148522, -1.731737, 1, 1, 1, 1, 1,
-1.038274, -0.03491236, -0.7366995, 0, 0, 1, 1, 1,
-1.031176, -1.024399, -2.478654, 1, 0, 0, 1, 1,
-1.027068, 2.399265, -0.7859982, 1, 0, 0, 1, 1,
-1.024637, -0.3129444, -1.545333, 1, 0, 0, 1, 1,
-1.018914, -1.22964, -0.7467207, 1, 0, 0, 1, 1,
-1.0177, 1.640494, -0.2942004, 1, 0, 0, 1, 1,
-1.012903, 0.514712, -1.427399, 0, 0, 0, 1, 1,
-1.012403, 0.03903481, -1.783873, 0, 0, 0, 1, 1,
-1.007541, -0.1170139, -2.948446, 0, 0, 0, 1, 1,
-1.005178, -0.8122538, -0.8115945, 0, 0, 0, 1, 1,
-1.000486, 0.6851971, -0.6067337, 0, 0, 0, 1, 1,
-0.9981185, -0.1198499, -3.905988, 0, 0, 0, 1, 1,
-0.9954137, -0.5789654, -2.197501, 0, 0, 0, 1, 1,
-0.9950832, -1.956179, -3.16027, 1, 1, 1, 1, 1,
-0.9910038, 0.9154916, 0.08627926, 1, 1, 1, 1, 1,
-0.9846795, 1.080592, -2.129915, 1, 1, 1, 1, 1,
-0.9716593, -0.3934179, -3.734067, 1, 1, 1, 1, 1,
-0.9693267, -1.348791, -1.859998, 1, 1, 1, 1, 1,
-0.9667686, 0.1887445, -1.765117, 1, 1, 1, 1, 1,
-0.9560622, -1.522248, -2.793121, 1, 1, 1, 1, 1,
-0.9559109, 0.1740237, -1.392942, 1, 1, 1, 1, 1,
-0.9437233, 1.012099, -0.5075195, 1, 1, 1, 1, 1,
-0.9376379, -1.693063, -1.267928, 1, 1, 1, 1, 1,
-0.9326316, -0.7619985, -2.660705, 1, 1, 1, 1, 1,
-0.9315509, 1.438402, -1.650984, 1, 1, 1, 1, 1,
-0.9282181, 1.732526, -0.5800696, 1, 1, 1, 1, 1,
-0.9198552, -0.9753929, -1.217878, 1, 1, 1, 1, 1,
-0.9178618, 0.04248428, -0.7970268, 1, 1, 1, 1, 1,
-0.9177294, 0.6102097, -0.8705739, 0, 0, 1, 1, 1,
-0.9032152, 0.7139303, -1.167032, 1, 0, 0, 1, 1,
-0.8979906, -0.6892334, -3.059505, 1, 0, 0, 1, 1,
-0.8878022, 1.384338, -0.9808323, 1, 0, 0, 1, 1,
-0.8875043, 0.9991254, -0.9647314, 1, 0, 0, 1, 1,
-0.8862782, -1.429402, -3.35431, 1, 0, 0, 1, 1,
-0.8819093, -0.9208918, -2.721791, 0, 0, 0, 1, 1,
-0.8815819, 0.3810598, -0.7734624, 0, 0, 0, 1, 1,
-0.881115, 1.906746, -0.2700165, 0, 0, 0, 1, 1,
-0.8798427, 1.104724, -0.5993841, 0, 0, 0, 1, 1,
-0.8702138, 0.8432255, -2.146776, 0, 0, 0, 1, 1,
-0.8683726, 0.5343992, -1.253532, 0, 0, 0, 1, 1,
-0.8665619, -0.6604798, -2.67549, 0, 0, 0, 1, 1,
-0.8657798, -0.6566018, -1.965599, 1, 1, 1, 1, 1,
-0.8655114, 1.750582, 0.8654411, 1, 1, 1, 1, 1,
-0.8583373, -0.01540857, -0.775185, 1, 1, 1, 1, 1,
-0.8517511, 1.634732, -0.08455496, 1, 1, 1, 1, 1,
-0.8505754, -0.244455, -1.086854, 1, 1, 1, 1, 1,
-0.8491505, 0.0546726, -1.974197, 1, 1, 1, 1, 1,
-0.8490503, 0.3120252, -1.386515, 1, 1, 1, 1, 1,
-0.8448066, -0.2001768, -3.332853, 1, 1, 1, 1, 1,
-0.8443736, -1.207734, -3.688048, 1, 1, 1, 1, 1,
-0.8442484, 0.7294692, -0.5561128, 1, 1, 1, 1, 1,
-0.8419654, 0.1636322, -2.706846, 1, 1, 1, 1, 1,
-0.8410539, -0.1354125, -1.316925, 1, 1, 1, 1, 1,
-0.8340969, -1.207607, -2.738578, 1, 1, 1, 1, 1,
-0.8302278, -0.3913973, -2.496089, 1, 1, 1, 1, 1,
-0.8287327, -0.05180736, -2.673038, 1, 1, 1, 1, 1,
-0.8286455, 1.57267, 1.197379, 0, 0, 1, 1, 1,
-0.8281174, 0.8501682, -0.5281172, 1, 0, 0, 1, 1,
-0.8257749, 0.3980422, -0.169818, 1, 0, 0, 1, 1,
-0.8243049, 2.52691, 0.3980164, 1, 0, 0, 1, 1,
-0.8170345, -0.02639362, -3.098614, 1, 0, 0, 1, 1,
-0.8159205, -0.1226266, -2.630169, 1, 0, 0, 1, 1,
-0.815448, -0.8853557, -3.429095, 0, 0, 0, 1, 1,
-0.8084375, 0.1929985, -1.792992, 0, 0, 0, 1, 1,
-0.8023841, 0.5794227, -0.4012609, 0, 0, 0, 1, 1,
-0.8022723, -0.7946025, -0.6157289, 0, 0, 0, 1, 1,
-0.798623, -1.217897, -3.694464, 0, 0, 0, 1, 1,
-0.7962292, 1.843785, -0.7428592, 0, 0, 0, 1, 1,
-0.7911674, -1.804675, -3.317677, 0, 0, 0, 1, 1,
-0.7901724, 0.4235685, -2.712278, 1, 1, 1, 1, 1,
-0.7878711, 0.8797616, 0.1665698, 1, 1, 1, 1, 1,
-0.7856674, -0.7197515, -2.986391, 1, 1, 1, 1, 1,
-0.7754248, 0.02447603, -1.257635, 1, 1, 1, 1, 1,
-0.7734008, 0.1252673, -1.177121, 1, 1, 1, 1, 1,
-0.7714567, -0.3481543, -2.284852, 1, 1, 1, 1, 1,
-0.7697468, 1.273448, 0.6557749, 1, 1, 1, 1, 1,
-0.7692082, -0.5441128, -3.440691, 1, 1, 1, 1, 1,
-0.7619696, -1.127201, -1.742841, 1, 1, 1, 1, 1,
-0.7597891, -0.5875226, -3.866068, 1, 1, 1, 1, 1,
-0.7577413, 1.349833, -1.134649, 1, 1, 1, 1, 1,
-0.7550735, 0.1498524, -2.541501, 1, 1, 1, 1, 1,
-0.7517145, 0.2418258, -1.002813, 1, 1, 1, 1, 1,
-0.7503775, -0.2708478, -2.8304, 1, 1, 1, 1, 1,
-0.7497486, 0.2441718, -3.110842, 1, 1, 1, 1, 1,
-0.749481, 1.03504, -0.1112015, 0, 0, 1, 1, 1,
-0.7437733, 1.73994, -0.9349807, 1, 0, 0, 1, 1,
-0.7432631, -2.185343, -3.22997, 1, 0, 0, 1, 1,
-0.7358914, -0.474058, -1.343429, 1, 0, 0, 1, 1,
-0.7295817, -1.243993, -2.064547, 1, 0, 0, 1, 1,
-0.7224274, 1.264863, -2.546223, 1, 0, 0, 1, 1,
-0.7215585, -0.0504075, -0.2259245, 0, 0, 0, 1, 1,
-0.7122637, -0.657438, -2.528493, 0, 0, 0, 1, 1,
-0.7105479, 0.02502281, -3.793676, 0, 0, 0, 1, 1,
-0.702723, -0.08658074, -1.641457, 0, 0, 0, 1, 1,
-0.7023988, -1.410638, -4.109086, 0, 0, 0, 1, 1,
-0.7001326, 0.8080818, 0.7763824, 0, 0, 0, 1, 1,
-0.6940413, -0.7718028, -2.046569, 0, 0, 0, 1, 1,
-0.6918246, 1.854922, -2.740089, 1, 1, 1, 1, 1,
-0.6909146, 0.5062422, -0.05505621, 1, 1, 1, 1, 1,
-0.6811415, 0.8822184, -1.238048, 1, 1, 1, 1, 1,
-0.6792845, 1.568716, 1.018737, 1, 1, 1, 1, 1,
-0.6742635, 0.2504813, -0.5512168, 1, 1, 1, 1, 1,
-0.6741719, 1.134454, -0.5011493, 1, 1, 1, 1, 1,
-0.6714218, -0.05542856, -2.379707, 1, 1, 1, 1, 1,
-0.6713352, -1.19089, -3.830209, 1, 1, 1, 1, 1,
-0.6663845, 1.373106, -0.214796, 1, 1, 1, 1, 1,
-0.6646661, -0.03661102, -0.6882648, 1, 1, 1, 1, 1,
-0.6620148, -0.3274433, -2.739228, 1, 1, 1, 1, 1,
-0.6619495, 0.5564698, 0.3764497, 1, 1, 1, 1, 1,
-0.6543925, 2.617338, -1.426551, 1, 1, 1, 1, 1,
-0.6512995, -0.1698757, -2.362281, 1, 1, 1, 1, 1,
-0.6458046, 2.288334, -1.425521, 1, 1, 1, 1, 1,
-0.6454017, 0.4409936, -0.5019534, 0, 0, 1, 1, 1,
-0.6451746, 0.3474084, -1.165751, 1, 0, 0, 1, 1,
-0.6441209, -0.4266606, -2.1812, 1, 0, 0, 1, 1,
-0.6407051, -1.608709, -5.10972, 1, 0, 0, 1, 1,
-0.6377162, -0.4713296, -3.264565, 1, 0, 0, 1, 1,
-0.6346354, 0.9659949, -0.2542534, 1, 0, 0, 1, 1,
-0.6277027, -1.601076, -1.068138, 0, 0, 0, 1, 1,
-0.6259097, 0.2074188, -0.8056043, 0, 0, 0, 1, 1,
-0.6249301, -1.083574, -3.233294, 0, 0, 0, 1, 1,
-0.6239095, 0.5767134, -0.8098891, 0, 0, 0, 1, 1,
-0.6226147, -0.6786891, -3.998005, 0, 0, 0, 1, 1,
-0.6217724, -0.9342359, -2.683705, 0, 0, 0, 1, 1,
-0.6211442, 1.681259, -1.541541, 0, 0, 0, 1, 1,
-0.6143838, -0.05828295, -1.071127, 1, 1, 1, 1, 1,
-0.605813, -0.015257, -1.70325, 1, 1, 1, 1, 1,
-0.6019352, 0.3505419, -0.2146066, 1, 1, 1, 1, 1,
-0.5972028, -1.371076, -3.333957, 1, 1, 1, 1, 1,
-0.5970625, 0.9752201, -0.4046719, 1, 1, 1, 1, 1,
-0.5945566, 0.0185452, -2.290976, 1, 1, 1, 1, 1,
-0.592055, 1.030261, 0.6992615, 1, 1, 1, 1, 1,
-0.5890041, 1.1473, -0.4700411, 1, 1, 1, 1, 1,
-0.586085, 0.5521435, 0.2448237, 1, 1, 1, 1, 1,
-0.5794593, 0.9096007, 1.680222, 1, 1, 1, 1, 1,
-0.5746807, -0.1106363, -3.010623, 1, 1, 1, 1, 1,
-0.5644047, 0.2064876, -2.85633, 1, 1, 1, 1, 1,
-0.5565906, 1.538583, 0.2135039, 1, 1, 1, 1, 1,
-0.5562173, 1.181853, -1.948229, 1, 1, 1, 1, 1,
-0.5523456, -1.273235, -3.994325, 1, 1, 1, 1, 1,
-0.5515224, -0.2195324, -1.952981, 0, 0, 1, 1, 1,
-0.551327, 2.487241, 0.8629265, 1, 0, 0, 1, 1,
-0.5494295, -1.945743, -3.69887, 1, 0, 0, 1, 1,
-0.547884, 0.2192172, -0.05233409, 1, 0, 0, 1, 1,
-0.5413371, 0.7305197, 0.05240369, 1, 0, 0, 1, 1,
-0.5399256, 1.189516, 0.9587542, 1, 0, 0, 1, 1,
-0.5398722, 0.2710104, -1.656626, 0, 0, 0, 1, 1,
-0.533616, -0.1261325, -0.04382602, 0, 0, 0, 1, 1,
-0.5320261, 0.8741733, 0.3014098, 0, 0, 0, 1, 1,
-0.5319312, -0.9297831, -4.224557, 0, 0, 0, 1, 1,
-0.5252209, -0.2372324, -3.015376, 0, 0, 0, 1, 1,
-0.5226607, -0.769623, -1.633817, 0, 0, 0, 1, 1,
-0.519773, 1.804232, 0.1329812, 0, 0, 0, 1, 1,
-0.5188576, 0.1821322, -0.7244906, 1, 1, 1, 1, 1,
-0.5148414, -0.9190421, -2.381211, 1, 1, 1, 1, 1,
-0.5131062, 0.7429404, -0.9844442, 1, 1, 1, 1, 1,
-0.510877, 1.262832, -0.5968283, 1, 1, 1, 1, 1,
-0.5089098, 0.1665603, -2.221232, 1, 1, 1, 1, 1,
-0.5077858, 0.08778057, -2.651372, 1, 1, 1, 1, 1,
-0.4982421, 1.341824, -0.4112103, 1, 1, 1, 1, 1,
-0.4945713, -0.6529459, -1.497342, 1, 1, 1, 1, 1,
-0.4923319, -0.3574569, -1.516716, 1, 1, 1, 1, 1,
-0.4918096, -0.05724066, -4.121384, 1, 1, 1, 1, 1,
-0.4915463, 1.107841, 0.849919, 1, 1, 1, 1, 1,
-0.4867311, 1.751865, -0.5414343, 1, 1, 1, 1, 1,
-0.4849605, 0.8707541, -0.8626465, 1, 1, 1, 1, 1,
-0.4811352, 1.003278, -1.086661, 1, 1, 1, 1, 1,
-0.477891, -0.6445578, 0.04308413, 1, 1, 1, 1, 1,
-0.4745346, -0.09881607, -2.304973, 0, 0, 1, 1, 1,
-0.4724589, -0.9778953, -3.810831, 1, 0, 0, 1, 1,
-0.4708757, -1.349365, -2.395457, 1, 0, 0, 1, 1,
-0.4699837, 2.706897, -0.3782071, 1, 0, 0, 1, 1,
-0.4632945, -1.227404, -2.095507, 1, 0, 0, 1, 1,
-0.4572194, 1.564173, -0.1182725, 1, 0, 0, 1, 1,
-0.4565372, 0.9907836, -0.3583934, 0, 0, 0, 1, 1,
-0.4540173, 0.2687921, -0.6264502, 0, 0, 0, 1, 1,
-0.4530568, -0.7691542, -3.781628, 0, 0, 0, 1, 1,
-0.4517615, 0.9350624, 1.430835, 0, 0, 0, 1, 1,
-0.4506296, -0.9775211, -2.4442, 0, 0, 0, 1, 1,
-0.4485104, 0.1856246, -1.377792, 0, 0, 0, 1, 1,
-0.4473691, -0.8480176, -3.293693, 0, 0, 0, 1, 1,
-0.4465307, 0.4584559, -1.414165, 1, 1, 1, 1, 1,
-0.4458468, -1.0891, -3.674216, 1, 1, 1, 1, 1,
-0.4425868, -0.4428025, -3.044118, 1, 1, 1, 1, 1,
-0.4416382, 1.13333, -0.3677612, 1, 1, 1, 1, 1,
-0.4393595, 0.2276983, -1.354471, 1, 1, 1, 1, 1,
-0.4392506, -0.3835687, -1.87137, 1, 1, 1, 1, 1,
-0.4381267, -1.267658, -1.83554, 1, 1, 1, 1, 1,
-0.4330034, 0.6682079, 0.1301252, 1, 1, 1, 1, 1,
-0.4326133, 0.2878025, -0.7638901, 1, 1, 1, 1, 1,
-0.429662, -1.467478, -3.281636, 1, 1, 1, 1, 1,
-0.4264033, -0.3198161, -1.465362, 1, 1, 1, 1, 1,
-0.4253648, -0.733472, -1.016209, 1, 1, 1, 1, 1,
-0.4245341, -0.3870434, -2.814873, 1, 1, 1, 1, 1,
-0.419542, 2.550063, -0.4683878, 1, 1, 1, 1, 1,
-0.4189257, 0.1725643, -1.732794, 1, 1, 1, 1, 1,
-0.4180697, 1.535231, 0.5784302, 0, 0, 1, 1, 1,
-0.4170423, 0.4457967, 0.9168075, 1, 0, 0, 1, 1,
-0.4158431, -0.769373, -2.175555, 1, 0, 0, 1, 1,
-0.4135624, 1.239979, -0.9671777, 1, 0, 0, 1, 1,
-0.4117775, 0.02135511, -0.4439152, 1, 0, 0, 1, 1,
-0.4106889, -0.6257089, -1.861147, 1, 0, 0, 1, 1,
-0.4047707, -0.8205656, -2.897492, 0, 0, 0, 1, 1,
-0.4037084, 0.1415622, -1.397135, 0, 0, 0, 1, 1,
-0.4009621, 1.018002, -1.833338, 0, 0, 0, 1, 1,
-0.3997513, -0.3957246, -2.950197, 0, 0, 0, 1, 1,
-0.3992556, 0.4513389, -1.109376, 0, 0, 0, 1, 1,
-0.3983642, -0.6020705, -2.470374, 0, 0, 0, 1, 1,
-0.3981407, 1.259656, 0.1381842, 0, 0, 0, 1, 1,
-0.3960127, -0.7555723, -3.61904, 1, 1, 1, 1, 1,
-0.3870711, -1.106361, -4.419038, 1, 1, 1, 1, 1,
-0.3867567, 0.1408842, -0.4448204, 1, 1, 1, 1, 1,
-0.3863294, -0.9535233, -2.785325, 1, 1, 1, 1, 1,
-0.3862039, 1.181425, -1.89651, 1, 1, 1, 1, 1,
-0.3839319, 1.102763, -0.6647335, 1, 1, 1, 1, 1,
-0.3816946, 1.797534, -0.1687746, 1, 1, 1, 1, 1,
-0.3796252, -1.280962, -3.450278, 1, 1, 1, 1, 1,
-0.3786104, 0.3434394, -0.3905345, 1, 1, 1, 1, 1,
-0.3781654, -1.212825, -2.731423, 1, 1, 1, 1, 1,
-0.3769488, 1.293586, 0.5018981, 1, 1, 1, 1, 1,
-0.3761948, 0.2114332, -1.760203, 1, 1, 1, 1, 1,
-0.3722488, 0.3396882, -2.281355, 1, 1, 1, 1, 1,
-0.3713304, 0.2941485, -1.439854, 1, 1, 1, 1, 1,
-0.3701204, -2.411978, -3.898617, 1, 1, 1, 1, 1,
-0.3683891, -0.1362183, -2.189544, 0, 0, 1, 1, 1,
-0.3626008, 1.489325, -0.1168173, 1, 0, 0, 1, 1,
-0.357131, -0.4485514, -3.177308, 1, 0, 0, 1, 1,
-0.3562664, -0.9778237, -3.242392, 1, 0, 0, 1, 1,
-0.3555633, -0.9306, -2.495731, 1, 0, 0, 1, 1,
-0.3510357, -1.354425, -3.629913, 1, 0, 0, 1, 1,
-0.3482831, -0.5767022, -1.988163, 0, 0, 0, 1, 1,
-0.3482491, 1.021796, 0.792141, 0, 0, 0, 1, 1,
-0.3472725, 0.4630566, -2.614209, 0, 0, 0, 1, 1,
-0.3451711, -0.7679493, -1.357099, 0, 0, 0, 1, 1,
-0.339916, -0.979179, -2.803319, 0, 0, 0, 1, 1,
-0.3379857, 0.9146168, 1.301489, 0, 0, 0, 1, 1,
-0.3312795, -1.67172, -2.939132, 0, 0, 0, 1, 1,
-0.3271601, -0.2862304, -1.759489, 1, 1, 1, 1, 1,
-0.3268661, -0.3691119, -2.250164, 1, 1, 1, 1, 1,
-0.3143184, -0.1892085, -1.711117, 1, 1, 1, 1, 1,
-0.3076968, -1.134309, -2.341924, 1, 1, 1, 1, 1,
-0.3068391, -0.1808601, -0.7692373, 1, 1, 1, 1, 1,
-0.3058875, -1.824335, -3.324604, 1, 1, 1, 1, 1,
-0.3058199, -1.175712, -1.023667, 1, 1, 1, 1, 1,
-0.3048255, 0.8795482, 1.107069, 1, 1, 1, 1, 1,
-0.299429, 0.09917498, -2.496788, 1, 1, 1, 1, 1,
-0.2963125, -1.431076, -3.521745, 1, 1, 1, 1, 1,
-0.295959, -0.4621173, -2.933367, 1, 1, 1, 1, 1,
-0.2917357, -0.7457969, -5.702742, 1, 1, 1, 1, 1,
-0.2844959, -0.5107182, -2.181847, 1, 1, 1, 1, 1,
-0.2813932, -1.368265, -2.173916, 1, 1, 1, 1, 1,
-0.2791749, 0.8483824, -0.6051181, 1, 1, 1, 1, 1,
-0.274557, 0.2129951, -0.351426, 0, 0, 1, 1, 1,
-0.2740702, 1.164615, -1.376632, 1, 0, 0, 1, 1,
-0.2695437, -0.6105119, -2.410944, 1, 0, 0, 1, 1,
-0.2678412, 0.8521333, -0.06244321, 1, 0, 0, 1, 1,
-0.257785, 1.642229, 0.07320242, 1, 0, 0, 1, 1,
-0.2552315, 1.518808, -0.1699687, 1, 0, 0, 1, 1,
-0.2478956, -0.1991003, -2.762028, 0, 0, 0, 1, 1,
-0.2474439, 1.872556, -0.6134322, 0, 0, 0, 1, 1,
-0.2459661, -0.904119, -3.32096, 0, 0, 0, 1, 1,
-0.2438064, 0.6405743, -0.9079512, 0, 0, 0, 1, 1,
-0.2317709, 0.5110796, 1.204599, 0, 0, 0, 1, 1,
-0.2312174, -1.006292, -3.957865, 0, 0, 0, 1, 1,
-0.2265664, -1.719293, -4.705993, 0, 0, 0, 1, 1,
-0.2255366, 0.8902482, 1.369073, 1, 1, 1, 1, 1,
-0.2250694, -1.955184, -2.184212, 1, 1, 1, 1, 1,
-0.2244249, 0.4082005, 0.6003734, 1, 1, 1, 1, 1,
-0.2190605, 0.2520547, -2.229221, 1, 1, 1, 1, 1,
-0.2134131, -0.2818373, -1.883965, 1, 1, 1, 1, 1,
-0.2120195, -1.345444, 0.3476331, 1, 1, 1, 1, 1,
-0.2112308, -1.040807, -1.956236, 1, 1, 1, 1, 1,
-0.2104276, -0.8824264, -4.60129, 1, 1, 1, 1, 1,
-0.2074755, -0.6909437, -2.389523, 1, 1, 1, 1, 1,
-0.2070909, -1.535961, -3.65135, 1, 1, 1, 1, 1,
-0.2054606, -0.02607419, -2.382777, 1, 1, 1, 1, 1,
-0.2044834, 0.6635827, -0.8397149, 1, 1, 1, 1, 1,
-0.2040294, -1.53695, -3.059518, 1, 1, 1, 1, 1,
-0.2040157, 0.1618189, 0.9770321, 1, 1, 1, 1, 1,
-0.2002936, -1.63007, -3.280301, 1, 1, 1, 1, 1,
-0.1977183, 0.251448, -0.8559287, 0, 0, 1, 1, 1,
-0.1941968, 0.8272167, -0.5676318, 1, 0, 0, 1, 1,
-0.1921353, -1.483597, -3.48946, 1, 0, 0, 1, 1,
-0.191599, 0.2360596, 0.973932, 1, 0, 0, 1, 1,
-0.1902346, 0.1539218, -0.6585054, 1, 0, 0, 1, 1,
-0.1897124, -0.7559761, -3.073551, 1, 0, 0, 1, 1,
-0.1892419, 1.208381, -0.2730275, 0, 0, 0, 1, 1,
-0.1889201, 1.213288, -0.6276609, 0, 0, 0, 1, 1,
-0.1866272, 0.9131538, 0.1194045, 0, 0, 0, 1, 1,
-0.1861327, 1.104216, -0.2748754, 0, 0, 0, 1, 1,
-0.1855671, 0.04627827, -0.4752326, 0, 0, 0, 1, 1,
-0.1790217, -3.862499, -2.69667, 0, 0, 0, 1, 1,
-0.1773519, -0.1220322, -1.031969, 0, 0, 0, 1, 1,
-0.1770688, -0.6283746, -2.829087, 1, 1, 1, 1, 1,
-0.1752784, -0.2726284, -2.681541, 1, 1, 1, 1, 1,
-0.1752052, 0.330639, -1.12445, 1, 1, 1, 1, 1,
-0.1725013, -1.140674, -4.51131, 1, 1, 1, 1, 1,
-0.1704341, 0.7435568, -0.104741, 1, 1, 1, 1, 1,
-0.1686092, -0.962158, -3.628519, 1, 1, 1, 1, 1,
-0.1684777, 0.393713, -0.8040438, 1, 1, 1, 1, 1,
-0.1666686, 0.6126702, -0.712011, 1, 1, 1, 1, 1,
-0.1639665, -1.177981, -2.963729, 1, 1, 1, 1, 1,
-0.161701, 1.761719, -1.14193, 1, 1, 1, 1, 1,
-0.1588375, 0.2867665, 0.1667417, 1, 1, 1, 1, 1,
-0.1562758, 1.042328, 0.4780872, 1, 1, 1, 1, 1,
-0.1543455, 0.2408907, -1.866301, 1, 1, 1, 1, 1,
-0.1477321, 0.3775575, -0.4900254, 1, 1, 1, 1, 1,
-0.1436303, -1.159733, -2.517217, 1, 1, 1, 1, 1,
-0.1428939, -0.06379759, -2.657926, 0, 0, 1, 1, 1,
-0.137431, -1.860138, -3.608569, 1, 0, 0, 1, 1,
-0.1367202, 0.7658991, -2.022013, 1, 0, 0, 1, 1,
-0.1347857, 0.6563162, -0.6478544, 1, 0, 0, 1, 1,
-0.1222465, 0.2660236, -0.8689586, 1, 0, 0, 1, 1,
-0.122019, -1.431504, -3.6364, 1, 0, 0, 1, 1,
-0.1198367, -0.2874518, -2.32355, 0, 0, 0, 1, 1,
-0.1177006, 0.1096973, 0.2420991, 0, 0, 0, 1, 1,
-0.1157629, 1.468051, 1.028612, 0, 0, 0, 1, 1,
-0.1134462, 1.879089, 0.8773286, 0, 0, 0, 1, 1,
-0.1053902, -0.009004178, -2.477509, 0, 0, 0, 1, 1,
-0.1035183, 0.7055069, -0.8967614, 0, 0, 0, 1, 1,
-0.1003136, -0.498952, -3.758643, 0, 0, 0, 1, 1,
-0.1000122, -0.6063112, -4.153055, 1, 1, 1, 1, 1,
-0.09514248, -1.176448, -3.074394, 1, 1, 1, 1, 1,
-0.0908585, 0.5877275, -1.393016, 1, 1, 1, 1, 1,
-0.09078655, -0.1613012, -3.177668, 1, 1, 1, 1, 1,
-0.08909617, 0.2644389, -0.256413, 1, 1, 1, 1, 1,
-0.08680045, 1.111978, -0.3741978, 1, 1, 1, 1, 1,
-0.08278942, 0.7438784, -1.217263, 1, 1, 1, 1, 1,
-0.08107357, -0.7905444, -1.59246, 1, 1, 1, 1, 1,
-0.07966006, -0.3126804, -3.59334, 1, 1, 1, 1, 1,
-0.07948148, -0.08352402, -1.741694, 1, 1, 1, 1, 1,
-0.07937343, -1.87291, -1.809553, 1, 1, 1, 1, 1,
-0.07873854, 0.2540199, 0.8240393, 1, 1, 1, 1, 1,
-0.07567776, 0.8833966, 0.08211759, 1, 1, 1, 1, 1,
-0.07494099, -0.3271041, -3.981102, 1, 1, 1, 1, 1,
-0.06378773, -1.516784, -1.856906, 1, 1, 1, 1, 1,
-0.0618317, 0.9266895, 0.3071871, 0, 0, 1, 1, 1,
-0.06163862, -0.04560077, -2.006736, 1, 0, 0, 1, 1,
-0.06145954, -0.3014608, -1.683751, 1, 0, 0, 1, 1,
-0.05625417, 0.06854249, 2.649745, 1, 0, 0, 1, 1,
-0.05560556, -0.8170177, -3.208111, 1, 0, 0, 1, 1,
-0.05526289, -0.7698331, -1.867198, 1, 0, 0, 1, 1,
-0.05445861, -0.3322748, -2.293644, 0, 0, 0, 1, 1,
-0.05008397, -0.4852974, -4.45693, 0, 0, 0, 1, 1,
-0.04752114, 0.5077059, 1.916262, 0, 0, 0, 1, 1,
-0.04707557, 0.947919, -1.420112, 0, 0, 0, 1, 1,
-0.0459834, 0.906301, 0.3242635, 0, 0, 0, 1, 1,
-0.04587364, -0.869782, -5.010962, 0, 0, 0, 1, 1,
-0.04419603, -0.4144085, -1.664533, 0, 0, 0, 1, 1,
-0.04100154, 1.578477, 0.9363844, 1, 1, 1, 1, 1,
-0.03816563, -1.4282, -3.307173, 1, 1, 1, 1, 1,
-0.03295936, -0.4667264, -2.502795, 1, 1, 1, 1, 1,
-0.03120365, -0.08415332, -3.847394, 1, 1, 1, 1, 1,
-0.03101097, 0.06346486, -2.025017, 1, 1, 1, 1, 1,
-0.02991148, -1.546768, -4.092711, 1, 1, 1, 1, 1,
-0.02179398, 0.3165396, 2.611977, 1, 1, 1, 1, 1,
-0.004387756, 1.403714, -1.082431, 1, 1, 1, 1, 1,
-0.002162804, -0.0778669, -1.494757, 1, 1, 1, 1, 1,
0.002317956, 0.9735317, -0.0446881, 1, 1, 1, 1, 1,
0.009547845, -1.485057, 2.223322, 1, 1, 1, 1, 1,
0.01996177, -0.4167964, 5.014889, 1, 1, 1, 1, 1,
0.02363493, 1.817635, 1.213709, 1, 1, 1, 1, 1,
0.02601317, -0.2683311, 2.455598, 1, 1, 1, 1, 1,
0.03357601, -0.7458921, 3.411941, 1, 1, 1, 1, 1,
0.04222097, 0.417752, -1.199938, 0, 0, 1, 1, 1,
0.04265759, 0.1515689, 1.900588, 1, 0, 0, 1, 1,
0.047065, 2.744709, 1.120692, 1, 0, 0, 1, 1,
0.04887407, -0.4749818, 1.969402, 1, 0, 0, 1, 1,
0.05058519, -0.7554135, 3.868034, 1, 0, 0, 1, 1,
0.05140368, 0.5226133, -0.8610282, 1, 0, 0, 1, 1,
0.05242477, -1.343939, 2.784858, 0, 0, 0, 1, 1,
0.05392921, -1.887322, 2.024387, 0, 0, 0, 1, 1,
0.05598035, -0.6107402, 4.600972, 0, 0, 0, 1, 1,
0.05916689, -0.07847603, 2.548511, 0, 0, 0, 1, 1,
0.06735405, -1.250128, 2.769931, 0, 0, 0, 1, 1,
0.07150876, 0.1924716, 0.0321471, 0, 0, 0, 1, 1,
0.07418065, 2.287699, -1.094422, 0, 0, 0, 1, 1,
0.07587618, -0.08776929, 2.239584, 1, 1, 1, 1, 1,
0.07760197, -1.068468, 2.99638, 1, 1, 1, 1, 1,
0.07838064, 1.422307, 0.1231594, 1, 1, 1, 1, 1,
0.07855175, 0.1923227, 1.182583, 1, 1, 1, 1, 1,
0.0818783, -0.1745933, 1.492165, 1, 1, 1, 1, 1,
0.0831279, 1.123709, 1.109291, 1, 1, 1, 1, 1,
0.08353752, 0.365687, 0.5551019, 1, 1, 1, 1, 1,
0.08869015, 0.2816446, 1.088839, 1, 1, 1, 1, 1,
0.08909186, -0.871973, 3.33952, 1, 1, 1, 1, 1,
0.09010504, -0.6450516, 3.43351, 1, 1, 1, 1, 1,
0.0922799, 0.870328, -0.3282703, 1, 1, 1, 1, 1,
0.09266158, 0.4819611, 1.444438, 1, 1, 1, 1, 1,
0.09826655, -0.2757095, 3.842545, 1, 1, 1, 1, 1,
0.09863896, 1.247104, -0.8138046, 1, 1, 1, 1, 1,
0.1001443, 0.8160627, -0.7509099, 1, 1, 1, 1, 1,
0.1042351, -0.008541003, 0.4239891, 0, 0, 1, 1, 1,
0.1081575, 0.2567113, 0.004838118, 1, 0, 0, 1, 1,
0.1115226, -0.7746198, 2.302506, 1, 0, 0, 1, 1,
0.1127091, 1.305429, 0.08315863, 1, 0, 0, 1, 1,
0.1190517, -0.3028237, 2.622479, 1, 0, 0, 1, 1,
0.1201623, 0.8911206, -0.3817686, 1, 0, 0, 1, 1,
0.1241825, -0.9945024, 2.689627, 0, 0, 0, 1, 1,
0.1251624, -1.152807, 3.08061, 0, 0, 0, 1, 1,
0.1352602, 2.336993, -0.571018, 0, 0, 0, 1, 1,
0.1353703, 0.07248667, 1.898999, 0, 0, 0, 1, 1,
0.1367238, -1.865495, 2.698137, 0, 0, 0, 1, 1,
0.1378211, 0.621825, 0.7137417, 0, 0, 0, 1, 1,
0.1381839, -0.5406935, 3.141638, 0, 0, 0, 1, 1,
0.1389132, 0.2654215, -1.087054, 1, 1, 1, 1, 1,
0.1409215, 0.05488929, 0.05506086, 1, 1, 1, 1, 1,
0.1445464, -0.1609247, 3.687876, 1, 1, 1, 1, 1,
0.1475052, 0.2244266, 2.716173, 1, 1, 1, 1, 1,
0.1491243, 1.864999, -0.2105848, 1, 1, 1, 1, 1,
0.1495911, -0.1231024, 1.312078, 1, 1, 1, 1, 1,
0.1545682, -0.02078604, 0.9205642, 1, 1, 1, 1, 1,
0.1554907, -0.7460975, 2.262149, 1, 1, 1, 1, 1,
0.1556685, 0.8556352, -0.5852208, 1, 1, 1, 1, 1,
0.1584652, 0.3611926, 0.893119, 1, 1, 1, 1, 1,
0.1593691, -0.9373172, 4.302648, 1, 1, 1, 1, 1,
0.1691373, 0.4356921, -0.4902397, 1, 1, 1, 1, 1,
0.1697697, 0.6686182, 0.5106062, 1, 1, 1, 1, 1,
0.1723503, 2.015623, 0.136909, 1, 1, 1, 1, 1,
0.1724167, 0.7506614, 0.9338775, 1, 1, 1, 1, 1,
0.1729727, 0.9338089, 1.09797, 0, 0, 1, 1, 1,
0.1789235, 0.4897639, -0.6229167, 1, 0, 0, 1, 1,
0.1794191, 0.6045375, -1.496358, 1, 0, 0, 1, 1,
0.1795211, -0.2652608, 2.331024, 1, 0, 0, 1, 1,
0.1798, 2.431648, 1.197641, 1, 0, 0, 1, 1,
0.1806526, 1.668089, 0.06435012, 1, 0, 0, 1, 1,
0.1860438, 0.4821223, 0.1983103, 0, 0, 0, 1, 1,
0.1865474, 0.02728721, 1.659389, 0, 0, 0, 1, 1,
0.1866286, 0.07642542, -0.1478781, 0, 0, 0, 1, 1,
0.1896777, 0.3972819, -0.623257, 0, 0, 0, 1, 1,
0.1933805, -0.3359126, 1.478528, 0, 0, 0, 1, 1,
0.1946365, -1.801677, 2.996828, 0, 0, 0, 1, 1,
0.1961643, 1.372215, -0.4273615, 0, 0, 0, 1, 1,
0.2003555, -0.7260688, 2.888979, 1, 1, 1, 1, 1,
0.2184597, 0.7380939, -1.285562, 1, 1, 1, 1, 1,
0.2204115, -0.08834037, 1.909461, 1, 1, 1, 1, 1,
0.2207022, -0.7610447, 2.943682, 1, 1, 1, 1, 1,
0.2220721, -0.2669664, 1.101584, 1, 1, 1, 1, 1,
0.2234025, -0.319529, 2.614944, 1, 1, 1, 1, 1,
0.2234095, -1.351963, 2.538758, 1, 1, 1, 1, 1,
0.2246184, 1.741201, 1.491263, 1, 1, 1, 1, 1,
0.2299256, -0.04580874, 2.197008, 1, 1, 1, 1, 1,
0.2339014, -1.602755, 3.89346, 1, 1, 1, 1, 1,
0.2368343, -0.8508633, 3.287508, 1, 1, 1, 1, 1,
0.2459222, 0.3403082, -1.002948, 1, 1, 1, 1, 1,
0.2468888, 0.4745801, -0.5349815, 1, 1, 1, 1, 1,
0.2521309, 0.5453838, -0.3780431, 1, 1, 1, 1, 1,
0.2530057, 0.3522312, -0.2447564, 1, 1, 1, 1, 1,
0.2610163, -0.4126064, 2.0195, 0, 0, 1, 1, 1,
0.2620043, 0.5511076, 0.8068654, 1, 0, 0, 1, 1,
0.2676767, -0.9315772, 2.888659, 1, 0, 0, 1, 1,
0.2680223, -0.8577065, 3.287476, 1, 0, 0, 1, 1,
0.2691468, 0.331736, 0.8756055, 1, 0, 0, 1, 1,
0.2710617, 0.7766603, -0.6140976, 1, 0, 0, 1, 1,
0.273009, -1.657542, 5.183003, 0, 0, 0, 1, 1,
0.2739622, -0.8010132, 1.122323, 0, 0, 0, 1, 1,
0.2744488, -1.200164, 3.473229, 0, 0, 0, 1, 1,
0.2746417, -0.3364007, 1.698777, 0, 0, 0, 1, 1,
0.2791913, 0.1397697, 1.321315, 0, 0, 0, 1, 1,
0.2814263, -0.3752793, -0.3054949, 0, 0, 0, 1, 1,
0.2880278, -0.407972, 2.610143, 0, 0, 0, 1, 1,
0.289254, -0.5063221, 2.834997, 1, 1, 1, 1, 1,
0.2907293, 1.303684, -1.128049, 1, 1, 1, 1, 1,
0.2927939, 1.487065, -0.8810974, 1, 1, 1, 1, 1,
0.3018656, -0.3490601, 3.072333, 1, 1, 1, 1, 1,
0.3047589, 1.090139, 0.4512776, 1, 1, 1, 1, 1,
0.3047752, 1.406516, 0.3671417, 1, 1, 1, 1, 1,
0.3084134, 0.4041217, -0.009748314, 1, 1, 1, 1, 1,
0.3144054, -2.618586, 1.940042, 1, 1, 1, 1, 1,
0.3150391, -0.5588636, 3.551405, 1, 1, 1, 1, 1,
0.319042, 0.7808135, 1.099586, 1, 1, 1, 1, 1,
0.3212877, -1.39694, 3.175097, 1, 1, 1, 1, 1,
0.3221745, -0.9431151, 2.281234, 1, 1, 1, 1, 1,
0.3228446, 1.420452, 1.693801, 1, 1, 1, 1, 1,
0.3234031, -1.213931, 2.078468, 1, 1, 1, 1, 1,
0.3259617, -1.745472, 3.944572, 1, 1, 1, 1, 1,
0.3279812, -1.008376, 3.196796, 0, 0, 1, 1, 1,
0.3315245, 0.3610815, 2.656819, 1, 0, 0, 1, 1,
0.3379329, -1.190191, 3.079678, 1, 0, 0, 1, 1,
0.3380231, -0.794686, 2.031168, 1, 0, 0, 1, 1,
0.3384426, -0.2084601, 2.557624, 1, 0, 0, 1, 1,
0.3406444, -0.8057425, 2.46566, 1, 0, 0, 1, 1,
0.3413335, -1.238597, 1.253701, 0, 0, 0, 1, 1,
0.343091, -1.061518, 3.397895, 0, 0, 0, 1, 1,
0.3435583, 0.4501733, 1.874727, 0, 0, 0, 1, 1,
0.346619, 0.3990841, -0.6964631, 0, 0, 0, 1, 1,
0.3470995, 0.3001294, 2.967983, 0, 0, 0, 1, 1,
0.3510233, 1.247981, 1.197091, 0, 0, 0, 1, 1,
0.3511613, 0.1852557, 0.5442025, 0, 0, 0, 1, 1,
0.3516218, 0.3217257, 1.019804, 1, 1, 1, 1, 1,
0.3528477, 0.03411428, 2.118186, 1, 1, 1, 1, 1,
0.3601917, 0.988819, 1.460485, 1, 1, 1, 1, 1,
0.3631945, -1.431806, 3.031897, 1, 1, 1, 1, 1,
0.3644542, 0.8558025, 0.05357186, 1, 1, 1, 1, 1,
0.3647962, -1.282517, 4.19624, 1, 1, 1, 1, 1,
0.3649748, 0.4585049, 0.04284726, 1, 1, 1, 1, 1,
0.3670244, -1.157342, 3.337937, 1, 1, 1, 1, 1,
0.371592, -0.7052608, 0.9319918, 1, 1, 1, 1, 1,
0.371754, 0.2525887, 1.59274, 1, 1, 1, 1, 1,
0.374823, 0.09602891, 0.9173474, 1, 1, 1, 1, 1,
0.3813489, 0.8325137, 1.820923, 1, 1, 1, 1, 1,
0.3821822, 0.287064, 1.46096, 1, 1, 1, 1, 1,
0.383601, 0.1294115, 2.049557, 1, 1, 1, 1, 1,
0.3865085, -1.492921, 0.8403193, 1, 1, 1, 1, 1,
0.3872021, 1.61872, 0.02077411, 0, 0, 1, 1, 1,
0.3876286, 0.3078806, 0.6520327, 1, 0, 0, 1, 1,
0.3877923, -0.7269564, 1.397959, 1, 0, 0, 1, 1,
0.3929354, 0.5381643, 1.458786, 1, 0, 0, 1, 1,
0.3941058, 0.3187063, 1.288472, 1, 0, 0, 1, 1,
0.4016233, 0.5538883, 0.1275882, 1, 0, 0, 1, 1,
0.401668, 0.5949524, -0.2440289, 0, 0, 0, 1, 1,
0.4024072, -0.8353179, 1.439596, 0, 0, 0, 1, 1,
0.405458, -0.6331515, 2.598139, 0, 0, 0, 1, 1,
0.4076945, -0.1284609, 1.453887, 0, 0, 0, 1, 1,
0.4093201, 0.8580741, -0.4309219, 0, 0, 0, 1, 1,
0.4115149, -0.9210431, 3.319216, 0, 0, 0, 1, 1,
0.4125944, -0.08667, 2.439734, 0, 0, 0, 1, 1,
0.4139383, -1.182877, 2.746518, 1, 1, 1, 1, 1,
0.4158184, -0.4000314, 1.789137, 1, 1, 1, 1, 1,
0.4182622, 0.7397114, 1.675031, 1, 1, 1, 1, 1,
0.4199733, 0.8880608, 1.889306, 1, 1, 1, 1, 1,
0.4258054, 1.095107, 1.139096, 1, 1, 1, 1, 1,
0.4261419, -0.5584986, 2.44216, 1, 1, 1, 1, 1,
0.4287741, -1.314164, 4.004402, 1, 1, 1, 1, 1,
0.4338862, -0.00114568, -0.3696254, 1, 1, 1, 1, 1,
0.434624, 0.2619179, 1.425987, 1, 1, 1, 1, 1,
0.4354956, -1.058215, 2.289639, 1, 1, 1, 1, 1,
0.4380735, -0.2954106, 3.045066, 1, 1, 1, 1, 1,
0.4409595, 0.8581189, 0.8065279, 1, 1, 1, 1, 1,
0.4456528, -0.07547043, 0.1742941, 1, 1, 1, 1, 1,
0.4464209, -1.378773, 4.977026, 1, 1, 1, 1, 1,
0.4513533, -0.1598694, 1.276192, 1, 1, 1, 1, 1,
0.4521002, -0.2742226, 1.618724, 0, 0, 1, 1, 1,
0.4562936, -1.42272, 1.593584, 1, 0, 0, 1, 1,
0.4576732, 0.903747, -1.141802, 1, 0, 0, 1, 1,
0.4582996, 0.04577852, 1.535206, 1, 0, 0, 1, 1,
0.4583682, -0.1823383, 1.949258, 1, 0, 0, 1, 1,
0.4599517, 0.7943906, 1.047804, 1, 0, 0, 1, 1,
0.4602524, -1.63942, 1.086613, 0, 0, 0, 1, 1,
0.4630534, -0.7584748, 4.042792, 0, 0, 0, 1, 1,
0.4635563, 1.14792, -0.7600934, 0, 0, 0, 1, 1,
0.4642944, 0.1913692, 1.268732, 0, 0, 0, 1, 1,
0.4646704, -0.9077964, 2.159323, 0, 0, 0, 1, 1,
0.4709765, 1.580441, -1.020614, 0, 0, 0, 1, 1,
0.475495, 0.9477828, 1.177962, 0, 0, 0, 1, 1,
0.47768, 0.3931271, 0.04392003, 1, 1, 1, 1, 1,
0.4780653, -1.685824, 3.538299, 1, 1, 1, 1, 1,
0.479843, 1.073555, -2.935823, 1, 1, 1, 1, 1,
0.4848329, 0.3711702, 1.251376, 1, 1, 1, 1, 1,
0.4853217, -0.3728892, 2.716098, 1, 1, 1, 1, 1,
0.4904675, 1.170695, -0.2461702, 1, 1, 1, 1, 1,
0.4907979, -0.6725245, 3.616044, 1, 1, 1, 1, 1,
0.492065, 0.1431699, 1.113725, 1, 1, 1, 1, 1,
0.4945363, 0.3166814, 0.9008163, 1, 1, 1, 1, 1,
0.500355, -1.372999, 2.35431, 1, 1, 1, 1, 1,
0.5054707, -0.6999144, 2.674946, 1, 1, 1, 1, 1,
0.5111558, -1.087241, 2.724597, 1, 1, 1, 1, 1,
0.5171192, 0.458672, 1.054935, 1, 1, 1, 1, 1,
0.5175201, 2.04615, -1.340495, 1, 1, 1, 1, 1,
0.517583, 0.04107352, 1.615431, 1, 1, 1, 1, 1,
0.5195286, -0.8784488, 2.815378, 0, 0, 1, 1, 1,
0.5231703, -0.8975532, 4.143199, 1, 0, 0, 1, 1,
0.5247128, -0.8465126, 3.219332, 1, 0, 0, 1, 1,
0.529436, -2.1551, 3.289973, 1, 0, 0, 1, 1,
0.5347563, 0.0326266, 3.606301, 1, 0, 0, 1, 1,
0.5399256, 0.4678844, -0.7017795, 1, 0, 0, 1, 1,
0.5421064, -1.052016, 1.553958, 0, 0, 0, 1, 1,
0.5431126, 0.8597752, -1.424359, 0, 0, 0, 1, 1,
0.5443926, 1.338578, -0.576492, 0, 0, 0, 1, 1,
0.546721, 2.002781, 0.858632, 0, 0, 0, 1, 1,
0.5482752, 1.586932, 0.4885714, 0, 0, 0, 1, 1,
0.5487592, 0.4843655, 2.07008, 0, 0, 0, 1, 1,
0.5502769, -0.2865924, 1.302264, 0, 0, 0, 1, 1,
0.5521124, -0.6566297, 1.155727, 1, 1, 1, 1, 1,
0.5533093, 2.928214, 1.012631, 1, 1, 1, 1, 1,
0.5539075, 1.282744, 1.968425, 1, 1, 1, 1, 1,
0.5564938, 0.05829105, 1.499623, 1, 1, 1, 1, 1,
0.5573199, 0.3332985, 0.7346221, 1, 1, 1, 1, 1,
0.5667621, -0.4612581, 2.582506, 1, 1, 1, 1, 1,
0.5675225, -0.9455728, 3.444733, 1, 1, 1, 1, 1,
0.5684816, 0.6777582, -0.04717643, 1, 1, 1, 1, 1,
0.5685535, -0.406335, 2.346347, 1, 1, 1, 1, 1,
0.5720756, -0.0505375, 0.3794022, 1, 1, 1, 1, 1,
0.5742903, 1.746615, 0.5011896, 1, 1, 1, 1, 1,
0.5753821, 0.2973017, 0.5864064, 1, 1, 1, 1, 1,
0.5768976, -1.101314, 1.061572, 1, 1, 1, 1, 1,
0.5802444, 0.5920126, 0.3394389, 1, 1, 1, 1, 1,
0.5850096, 0.4514275, 2.052446, 1, 1, 1, 1, 1,
0.5907449, -0.2903215, 1.629193, 0, 0, 1, 1, 1,
0.5935191, 0.1853784, 0.9180527, 1, 0, 0, 1, 1,
0.5948842, 0.2235245, 1.68905, 1, 0, 0, 1, 1,
0.6030039, 0.853923, -0.7193443, 1, 0, 0, 1, 1,
0.6058073, -0.005029816, 0.1587725, 1, 0, 0, 1, 1,
0.6068655, -1.432398, 1.69021, 1, 0, 0, 1, 1,
0.6110565, -0.9055635, 0.8790554, 0, 0, 0, 1, 1,
0.6147191, -0.09001856, 2.128366, 0, 0, 0, 1, 1,
0.6237417, -2.123379, 3.947751, 0, 0, 0, 1, 1,
0.6266816, 0.7788231, 1.546193, 0, 0, 0, 1, 1,
0.6294564, -0.8237121, 3.453734, 0, 0, 0, 1, 1,
0.6296965, -0.5696399, 1.684893, 0, 0, 0, 1, 1,
0.6310251, 2.767458, -1.410495, 0, 0, 0, 1, 1,
0.6332746, 0.6122472, 0.08632836, 1, 1, 1, 1, 1,
0.6410391, 0.7667738, -0.7080091, 1, 1, 1, 1, 1,
0.6430222, 1.430688, -0.5132368, 1, 1, 1, 1, 1,
0.6460384, -0.6837146, 1.803035, 1, 1, 1, 1, 1,
0.646696, 1.848526, -1.167709, 1, 1, 1, 1, 1,
0.6489113, -0.06299514, 0.9907719, 1, 1, 1, 1, 1,
0.6523275, -0.6442145, 1.085637, 1, 1, 1, 1, 1,
0.6551535, 0.4978753, 1.452092, 1, 1, 1, 1, 1,
0.6598259, 1.709553, 0.4374505, 1, 1, 1, 1, 1,
0.6661879, -1.326212, 2.643056, 1, 1, 1, 1, 1,
0.6676193, 2.307524, -0.2293828, 1, 1, 1, 1, 1,
0.6707079, -0.2488955, 0.7680474, 1, 1, 1, 1, 1,
0.670902, 0.9031261, 0.3991901, 1, 1, 1, 1, 1,
0.6721158, 0.1130164, -0.5435755, 1, 1, 1, 1, 1,
0.6722109, 0.4830653, 1.542747, 1, 1, 1, 1, 1,
0.6763329, -0.2052254, -0.6767395, 0, 0, 1, 1, 1,
0.6769948, -0.2279944, 2.52292, 1, 0, 0, 1, 1,
0.6780334, 2.392327, -1.632167, 1, 0, 0, 1, 1,
0.6824702, -1.052773, 2.364234, 1, 0, 0, 1, 1,
0.6883249, -0.5407984, 4.493411, 1, 0, 0, 1, 1,
0.6918578, -1.215548, 1.936824, 1, 0, 0, 1, 1,
0.6931936, 1.340745, 0.4404672, 0, 0, 0, 1, 1,
0.6971717, 0.05997625, 2.04464, 0, 0, 0, 1, 1,
0.699047, -1.71563, 1.490791, 0, 0, 0, 1, 1,
0.699069, 0.8359922, 0.4838039, 0, 0, 0, 1, 1,
0.7014675, 0.9101097, 0.6899227, 0, 0, 0, 1, 1,
0.7049618, 0.5387622, 2.496347, 0, 0, 0, 1, 1,
0.705035, -0.323511, 2.429709, 0, 0, 0, 1, 1,
0.7075494, -0.6373408, 1.764232, 1, 1, 1, 1, 1,
0.7104373, 0.2486495, 1.473232, 1, 1, 1, 1, 1,
0.7150241, 0.03130901, 2.788735, 1, 1, 1, 1, 1,
0.7160106, 2.214382, -0.3523782, 1, 1, 1, 1, 1,
0.7242877, 1.369446, 1.892815, 1, 1, 1, 1, 1,
0.7336673, -0.6332036, 2.315871, 1, 1, 1, 1, 1,
0.7344134, -0.5686203, 1.390871, 1, 1, 1, 1, 1,
0.7359433, -0.07572167, 0.8309486, 1, 1, 1, 1, 1,
0.7415974, -0.1995502, 1.673467, 1, 1, 1, 1, 1,
0.741977, 1.067644, 0.9639074, 1, 1, 1, 1, 1,
0.7458812, 1.306509, 0.2564827, 1, 1, 1, 1, 1,
0.7466736, 0.1489129, 2.893632, 1, 1, 1, 1, 1,
0.7631906, 0.8592696, 0.006624106, 1, 1, 1, 1, 1,
0.7651639, 0.287576, 0.5313518, 1, 1, 1, 1, 1,
0.7676129, 0.7847663, 0.8396817, 1, 1, 1, 1, 1,
0.768629, 2.322979, 0.5755451, 0, 0, 1, 1, 1,
0.769868, 2.047021, -0.567725, 1, 0, 0, 1, 1,
0.7709616, 0.3691286, 1.322413, 1, 0, 0, 1, 1,
0.7742249, 1.132563, 0.8573295, 1, 0, 0, 1, 1,
0.782975, -0.1507501, 2.20703, 1, 0, 0, 1, 1,
0.7832561, -0.7522421, 4.669798, 1, 0, 0, 1, 1,
0.7847334, -0.07072493, 1.462933, 0, 0, 0, 1, 1,
0.7893788, -0.2193537, 2.832607, 0, 0, 0, 1, 1,
0.7900281, -1.384303, 2.835189, 0, 0, 0, 1, 1,
0.7912055, -0.02261854, 2.066848, 0, 0, 0, 1, 1,
0.7954603, 0.8787318, 0.8250796, 0, 0, 0, 1, 1,
0.7981927, 0.3082527, 1.229492, 0, 0, 0, 1, 1,
0.8054782, -0.9378076, 2.126964, 0, 0, 0, 1, 1,
0.8081591, -0.6867006, 2.926558, 1, 1, 1, 1, 1,
0.8109304, 0.3922669, 2.432125, 1, 1, 1, 1, 1,
0.811496, -1.432596, 1.315984, 1, 1, 1, 1, 1,
0.8146758, 0.3857862, 3.044873, 1, 1, 1, 1, 1,
0.8288339, -0.1947065, 2.154728, 1, 1, 1, 1, 1,
0.8289112, -2.39319, 2.35147, 1, 1, 1, 1, 1,
0.8289262, 1.33975, 0.6679142, 1, 1, 1, 1, 1,
0.8295348, -0.4893781, 2.010046, 1, 1, 1, 1, 1,
0.8295873, 0.08166268, 1.910694, 1, 1, 1, 1, 1,
0.8346753, -1.224939, 2.215494, 1, 1, 1, 1, 1,
0.8352134, -0.0265686, 0.5071319, 1, 1, 1, 1, 1,
0.8397863, -0.9296736, -0.3215784, 1, 1, 1, 1, 1,
0.8421813, -0.8672979, 2.741559, 1, 1, 1, 1, 1,
0.8428338, 1.243435, 2.401427, 1, 1, 1, 1, 1,
0.8465652, -0.915089, 3.433595, 1, 1, 1, 1, 1,
0.850933, -0.1171894, 2.263761, 0, 0, 1, 1, 1,
0.8527342, -0.677889, 3.022168, 1, 0, 0, 1, 1,
0.8554339, 0.583815, 1.184941, 1, 0, 0, 1, 1,
0.8576887, -0.6014245, 2.823785, 1, 0, 0, 1, 1,
0.85962, 0.5252181, 2.191408, 1, 0, 0, 1, 1,
0.8801578, 1.611742, 1.42738, 1, 0, 0, 1, 1,
0.8841835, 0.246081, 1.126214, 0, 0, 0, 1, 1,
0.8897156, 1.493286, 0.1806864, 0, 0, 0, 1, 1,
0.8921995, -0.502065, 1.109676, 0, 0, 0, 1, 1,
0.8946846, 0.07436556, 2.007307, 0, 0, 0, 1, 1,
0.8953052, 0.04354718, 1.95409, 0, 0, 0, 1, 1,
0.8959695, -0.366603, 4.418313, 0, 0, 0, 1, 1,
0.896961, 0.2636338, 2.032378, 0, 0, 0, 1, 1,
0.8972598, 0.7400849, 1.897531, 1, 1, 1, 1, 1,
0.8991376, 1.132285, 0.9243043, 1, 1, 1, 1, 1,
0.9014956, 2.945238, 0.05967466, 1, 1, 1, 1, 1,
0.9029844, -0.1483195, 2.949516, 1, 1, 1, 1, 1,
0.9098717, -0.5724343, 1.3793, 1, 1, 1, 1, 1,
0.9099914, 0.02530626, -0.03591734, 1, 1, 1, 1, 1,
0.9117469, 0.8753914, 1.215563, 1, 1, 1, 1, 1,
0.9127964, 1.255404, 0.6350625, 1, 1, 1, 1, 1,
0.9152851, 0.1399828, 1.949323, 1, 1, 1, 1, 1,
0.9164817, -0.8048179, 3.969292, 1, 1, 1, 1, 1,
0.916929, -0.5930338, 2.677623, 1, 1, 1, 1, 1,
0.9199271, 0.134228, 2.117134, 1, 1, 1, 1, 1,
0.9202551, 0.4555352, 0.710166, 1, 1, 1, 1, 1,
0.9215757, 1.274745, 0.7612601, 1, 1, 1, 1, 1,
0.9221905, -1.307246, 1.925417, 1, 1, 1, 1, 1,
0.9256253, -1.33019, 1.982424, 0, 0, 1, 1, 1,
0.9279894, 0.8992116, 1.346517, 1, 0, 0, 1, 1,
0.9290867, -0.9312733, 1.159125, 1, 0, 0, 1, 1,
0.9380715, 0.1739056, 2.108961, 1, 0, 0, 1, 1,
0.9387683, 0.4398582, -0.9035411, 1, 0, 0, 1, 1,
0.9419342, 0.6103526, -0.3185572, 1, 0, 0, 1, 1,
0.9445729, 1.638273, 2.005121, 0, 0, 0, 1, 1,
0.951347, 0.7073026, 2.191877, 0, 0, 0, 1, 1,
0.9617447, -0.4080132, 0.5722415, 0, 0, 0, 1, 1,
0.9683766, 0.3987283, 0.8081362, 0, 0, 0, 1, 1,
0.9689959, -1.911171, 4.216971, 0, 0, 0, 1, 1,
0.9703782, 0.4816019, 2.277036, 0, 0, 0, 1, 1,
0.9740967, 0.1873631, 3.257709, 0, 0, 0, 1, 1,
0.9755065, -1.079761, 2.840716, 1, 1, 1, 1, 1,
0.9829137, -1.176839, 1.837253, 1, 1, 1, 1, 1,
0.9930502, -0.4139887, -0.03929943, 1, 1, 1, 1, 1,
0.9983217, 0.6670026, 0.1059736, 1, 1, 1, 1, 1,
1.012908, -0.4335687, 1.294015, 1, 1, 1, 1, 1,
1.017053, 1.322098, 1.074648, 1, 1, 1, 1, 1,
1.025546, -1.175124, 2.79854, 1, 1, 1, 1, 1,
1.028048, 0.556129, 1.22697, 1, 1, 1, 1, 1,
1.032153, -1.053558, 2.523659, 1, 1, 1, 1, 1,
1.041977, -0.4061362, 2.519537, 1, 1, 1, 1, 1,
1.042253, -0.6752484, 1.588058, 1, 1, 1, 1, 1,
1.045394, -2.026764, 2.556104, 1, 1, 1, 1, 1,
1.046581, -0.06232857, 1.908082, 1, 1, 1, 1, 1,
1.047831, -0.5568063, 1.584528, 1, 1, 1, 1, 1,
1.059798, -1.021194, 2.090958, 1, 1, 1, 1, 1,
1.061297, 0.1589892, 1.985015, 0, 0, 1, 1, 1,
1.061998, -1.568693, 2.077078, 1, 0, 0, 1, 1,
1.063402, 0.9694616, 0.148692, 1, 0, 0, 1, 1,
1.067041, 0.3471228, 1.760544, 1, 0, 0, 1, 1,
1.068962, 0.02542264, 2.561591, 1, 0, 0, 1, 1,
1.071564, 0.933699, 0.05692496, 1, 0, 0, 1, 1,
1.075363, -0.004413659, 2.045759, 0, 0, 0, 1, 1,
1.079134, -1.012452, 3.382295, 0, 0, 0, 1, 1,
1.079504, -1.412485, 1.710103, 0, 0, 0, 1, 1,
1.083238, 0.1029018, -0.4217344, 0, 0, 0, 1, 1,
1.088187, -0.09637523, 1.354612, 0, 0, 0, 1, 1,
1.103421, 0.5964141, -0.05460788, 0, 0, 0, 1, 1,
1.106918, 0.9206719, -0.5646968, 0, 0, 0, 1, 1,
1.1133, 1.399913, 0.2088136, 1, 1, 1, 1, 1,
1.12988, -0.4746413, 1.217401, 1, 1, 1, 1, 1,
1.13126, 0.1585432, 0.6420593, 1, 1, 1, 1, 1,
1.139346, -0.3625859, 0.9537017, 1, 1, 1, 1, 1,
1.157625, 1.267199, 1.370281, 1, 1, 1, 1, 1,
1.169893, 2.66537, 1.929649, 1, 1, 1, 1, 1,
1.176332, 1.325789, -1.226184, 1, 1, 1, 1, 1,
1.176827, 0.5849757, 0.7103533, 1, 1, 1, 1, 1,
1.181055, 0.9905199, 1.629761, 1, 1, 1, 1, 1,
1.181194, -0.4831294, 2.244414, 1, 1, 1, 1, 1,
1.185034, 0.7612906, 0.015653, 1, 1, 1, 1, 1,
1.185157, 0.8024197, 2.434321, 1, 1, 1, 1, 1,
1.190813, -0.6144527, 1.89129, 1, 1, 1, 1, 1,
1.196099, -1.19, 1.374494, 1, 1, 1, 1, 1,
1.197424, -1.173019, 1.353487, 1, 1, 1, 1, 1,
1.214244, 0.2301651, 2.295156, 0, 0, 1, 1, 1,
1.215446, 0.3792316, 0.7579418, 1, 0, 0, 1, 1,
1.215608, 0.5150064, 0.3761316, 1, 0, 0, 1, 1,
1.219007, -0.2374308, 1.518649, 1, 0, 0, 1, 1,
1.223159, -0.6093907, 1.966576, 1, 0, 0, 1, 1,
1.223613, -0.1140824, 1.641485, 1, 0, 0, 1, 1,
1.226882, 1.994459, 1.735867, 0, 0, 0, 1, 1,
1.23132, 0.3850147, 1.841989, 0, 0, 0, 1, 1,
1.241765, -0.4587192, 3.630708, 0, 0, 0, 1, 1,
1.250029, -0.7957316, 1.741314, 0, 0, 0, 1, 1,
1.256123, 1.451793, 1.459852, 0, 0, 0, 1, 1,
1.258458, -0.4181674, 2.957117, 0, 0, 0, 1, 1,
1.263617, 0.006104617, 2.868391, 0, 0, 0, 1, 1,
1.268377, -1.33542, 2.001087, 1, 1, 1, 1, 1,
1.277549, -0.9069587, 2.312215, 1, 1, 1, 1, 1,
1.290051, 1.41572, -0.4327979, 1, 1, 1, 1, 1,
1.298304, -0.8158582, 3.207857, 1, 1, 1, 1, 1,
1.313473, 0.3103986, 1.600821, 1, 1, 1, 1, 1,
1.322368, -0.1737371, 2.146958, 1, 1, 1, 1, 1,
1.324676, -2.526728, 3.120033, 1, 1, 1, 1, 1,
1.325356, -0.4591869, 1.246361, 1, 1, 1, 1, 1,
1.337836, -1.82588, 0.05871582, 1, 1, 1, 1, 1,
1.342664, 1.934064, 1.563154, 1, 1, 1, 1, 1,
1.352484, 1.586852, 0.8910923, 1, 1, 1, 1, 1,
1.356727, -0.1269867, 1.573207, 1, 1, 1, 1, 1,
1.362724, 0.5290723, -0.3277896, 1, 1, 1, 1, 1,
1.365812, -1.226153, 2.937951, 1, 1, 1, 1, 1,
1.367338, -0.4642108, -0.7053968, 1, 1, 1, 1, 1,
1.373971, -0.06811933, 3.277574, 0, 0, 1, 1, 1,
1.375366, 2.200366, 2.125627, 1, 0, 0, 1, 1,
1.379607, 0.6759467, 0.193389, 1, 0, 0, 1, 1,
1.383357, 0.587384, 2.413532, 1, 0, 0, 1, 1,
1.386831, -0.5089232, 2.139856, 1, 0, 0, 1, 1,
1.394184, -1.028527, 2.618572, 1, 0, 0, 1, 1,
1.405551, -0.0936854, 1.1889, 0, 0, 0, 1, 1,
1.408139, 0.1091064, -0.2894848, 0, 0, 0, 1, 1,
1.428209, 0.5838116, 1.479953, 0, 0, 0, 1, 1,
1.437233, -0.1905523, 0.4232766, 0, 0, 0, 1, 1,
1.444234, 0.2589401, 2.425946, 0, 0, 0, 1, 1,
1.452422, 0.9701571, 1.988068, 0, 0, 0, 1, 1,
1.452645, 0.238901, 2.044083, 0, 0, 0, 1, 1,
1.45413, 1.802433, -0.0505312, 1, 1, 1, 1, 1,
1.457021, 0.4640933, 1.364807, 1, 1, 1, 1, 1,
1.478994, 0.9541593, 1.556955, 1, 1, 1, 1, 1,
1.486947, -0.1342755, 2.675133, 1, 1, 1, 1, 1,
1.487034, -0.2449336, 2.24747, 1, 1, 1, 1, 1,
1.488171, 1.675437, 0.3445355, 1, 1, 1, 1, 1,
1.49871, -2.128664, 2.278463, 1, 1, 1, 1, 1,
1.498942, -0.4838362, 1.858706, 1, 1, 1, 1, 1,
1.502675, 0.6090043, 3.258366, 1, 1, 1, 1, 1,
1.503215, -0.6750667, 1.549055, 1, 1, 1, 1, 1,
1.506816, -0.3722441, 2.144311, 1, 1, 1, 1, 1,
1.515115, 1.06723, 2.154954, 1, 1, 1, 1, 1,
1.515201, -0.6049044, 1.289353, 1, 1, 1, 1, 1,
1.518364, 1.588505, -0.9995022, 1, 1, 1, 1, 1,
1.52343, 1.387797, 1.475519, 1, 1, 1, 1, 1,
1.530195, -2.127286, 1.591735, 0, 0, 1, 1, 1,
1.536053, -1.034657, 2.536607, 1, 0, 0, 1, 1,
1.551266, 0.699729, 0.9501781, 1, 0, 0, 1, 1,
1.560784, 0.2831668, 0.3150023, 1, 0, 0, 1, 1,
1.567893, -0.6428654, -0.3920299, 1, 0, 0, 1, 1,
1.571155, 0.270674, 1.72915, 1, 0, 0, 1, 1,
1.57285, 0.7595894, 1.37585, 0, 0, 0, 1, 1,
1.600174, -1.731301, 2.529055, 0, 0, 0, 1, 1,
1.634653, 0.709281, 1.529367, 0, 0, 0, 1, 1,
1.65976, 0.7964642, 1.382704, 0, 0, 0, 1, 1,
1.666281, -1.273412, 1.711615, 0, 0, 0, 1, 1,
1.668821, -0.1132928, 1.620014, 0, 0, 0, 1, 1,
1.675105, -1.04358, 1.912876, 0, 0, 0, 1, 1,
1.736206, 3.052213, 0.5338838, 1, 1, 1, 1, 1,
1.74295, 1.304836, 1.70104, 1, 1, 1, 1, 1,
1.751467, -0.2367473, 1.16588, 1, 1, 1, 1, 1,
1.78817, -0.4179973, 2.878405, 1, 1, 1, 1, 1,
1.817397, 0.2576433, 0.1173049, 1, 1, 1, 1, 1,
1.821914, 0.07358763, 2.623379, 1, 1, 1, 1, 1,
1.830618, 0.8528377, 1.585724, 1, 1, 1, 1, 1,
1.841527, -1.061707, 2.228354, 1, 1, 1, 1, 1,
1.853281, 1.955982, 1.105389, 1, 1, 1, 1, 1,
1.853656, 0.7629204, 2.128502, 1, 1, 1, 1, 1,
1.867347, -0.05901456, 1.880224, 1, 1, 1, 1, 1,
1.869709, 1.533919, 1.310823, 1, 1, 1, 1, 1,
1.875476, -1.403821, 2.356056, 1, 1, 1, 1, 1,
1.889205, -0.3710178, 2.2647, 1, 1, 1, 1, 1,
1.931815, 1.399472, -0.1572727, 1, 1, 1, 1, 1,
1.974957, 0.8009169, 2.41871, 0, 0, 1, 1, 1,
2.019605, -1.052238, 1.64289, 1, 0, 0, 1, 1,
2.021192, -0.1083855, 1.951163, 1, 0, 0, 1, 1,
2.023386, 0.4187275, 1.658554, 1, 0, 0, 1, 1,
2.08987, -0.248409, 0.8932061, 1, 0, 0, 1, 1,
2.147008, 0.9211183, 0.9887086, 1, 0, 0, 1, 1,
2.176302, 0.01272991, 2.464691, 0, 0, 0, 1, 1,
2.246868, 0.08585858, -0.4367019, 0, 0, 0, 1, 1,
2.264293, -3.00715, 0.7614218, 0, 0, 0, 1, 1,
2.277844, -1.371148, 1.299749, 0, 0, 0, 1, 1,
2.330026, -0.1286279, 1.454654, 0, 0, 0, 1, 1,
2.413639, -1.078913, 2.972311, 0, 0, 0, 1, 1,
2.420604, 2.287743, 0.995595, 0, 0, 0, 1, 1,
2.492807, -1.477877, 2.096334, 1, 1, 1, 1, 1,
2.511865, 0.8417651, 2.94158, 1, 1, 1, 1, 1,
2.521529, 0.5224229, 1.068989, 1, 1, 1, 1, 1,
2.534764, 1.272061, 2.449355, 1, 1, 1, 1, 1,
2.595208, 0.4312588, 1.332539, 1, 1, 1, 1, 1,
2.72291, 0.3249444, 0.6479519, 1, 1, 1, 1, 1,
3.709749, 1.084042, 2.543383, 1, 1, 1, 1, 1
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
var radius = 9.831792;
var distance = 34.53375;
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
mvMatrix.translate( -0.4075301, 0.405143, 0.2598693 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.53375);
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