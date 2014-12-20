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
-2.790582, 0.1981995, -1.297733, 1, 0, 0, 1,
-2.731217, -1.073851, -2.988448, 1, 0.007843138, 0, 1,
-2.583203, 1.206855, -1.622536, 1, 0.01176471, 0, 1,
-2.511487, 1.930139, -0.7776213, 1, 0.01960784, 0, 1,
-2.455628, -0.261822, -2.800671, 1, 0.02352941, 0, 1,
-2.44183, -0.3689681, -1.275089, 1, 0.03137255, 0, 1,
-2.42745, 1.024872, -2.292259, 1, 0.03529412, 0, 1,
-2.385349, -0.1822499, -1.147137, 1, 0.04313726, 0, 1,
-2.356078, -0.1897759, -1.029037, 1, 0.04705882, 0, 1,
-2.133608, 1.425587, -0.6596646, 1, 0.05490196, 0, 1,
-2.118393, -1.07324, -0.1958533, 1, 0.05882353, 0, 1,
-2.109751, 1.037623, -2.0273, 1, 0.06666667, 0, 1,
-2.049392, -0.01195773, -2.083571, 1, 0.07058824, 0, 1,
-2.040383, -2.501161, -3.959777, 1, 0.07843138, 0, 1,
-2.039117, -0.1107179, -1.37051, 1, 0.08235294, 0, 1,
-2.02958, -0.3796372, -2.24932, 1, 0.09019608, 0, 1,
-2.014937, -0.4078603, -0.7636213, 1, 0.09411765, 0, 1,
-1.974093, -0.6989781, -3.943886, 1, 0.1019608, 0, 1,
-1.960576, 1.793684, -0.2190403, 1, 0.1098039, 0, 1,
-1.915955, 0.8763582, -2.136412, 1, 0.1137255, 0, 1,
-1.894192, -0.08044131, -1.147239, 1, 0.1215686, 0, 1,
-1.885078, 0.8969203, -1.105562, 1, 0.1254902, 0, 1,
-1.809915, 2.049182, -0.8769832, 1, 0.1333333, 0, 1,
-1.797651, -1.466241, -1.568229, 1, 0.1372549, 0, 1,
-1.781396, 0.06318172, -1.320538, 1, 0.145098, 0, 1,
-1.773256, 0.04105081, -0.5510712, 1, 0.1490196, 0, 1,
-1.767813, -0.02292616, -0.4349394, 1, 0.1568628, 0, 1,
-1.764303, 1.160199, -2.25896, 1, 0.1607843, 0, 1,
-1.7462, 1.17426, -0.4692784, 1, 0.1686275, 0, 1,
-1.731403, 0.6095943, -2.023184, 1, 0.172549, 0, 1,
-1.726353, -0.9385611, -1.828907, 1, 0.1803922, 0, 1,
-1.71651, 0.534784, -1.684923, 1, 0.1843137, 0, 1,
-1.68301, -1.496694, -2.830012, 1, 0.1921569, 0, 1,
-1.681529, 1.284491, -0.8021833, 1, 0.1960784, 0, 1,
-1.67469, 0.6611774, -1.367803, 1, 0.2039216, 0, 1,
-1.657865, 0.03496605, -0.1612597, 1, 0.2117647, 0, 1,
-1.656259, 0.4591869, -1.215594, 1, 0.2156863, 0, 1,
-1.655315, -0.8396249, -2.709516, 1, 0.2235294, 0, 1,
-1.651844, -1.140847, -3.044725, 1, 0.227451, 0, 1,
-1.651315, 1.603837, -0.986794, 1, 0.2352941, 0, 1,
-1.647488, -0.9022105, -2.178788, 1, 0.2392157, 0, 1,
-1.646599, -1.504439, -2.050806, 1, 0.2470588, 0, 1,
-1.646223, -0.4822276, -1.791933, 1, 0.2509804, 0, 1,
-1.639889, -0.4414082, -2.593177, 1, 0.2588235, 0, 1,
-1.621802, -1.161529, -2.12902, 1, 0.2627451, 0, 1,
-1.616421, 0.545701, 0.1324404, 1, 0.2705882, 0, 1,
-1.61414, 1.631454, -1.559909, 1, 0.2745098, 0, 1,
-1.606122, 0.5523366, -1.481957, 1, 0.282353, 0, 1,
-1.597676, -1.448531, -1.729944, 1, 0.2862745, 0, 1,
-1.595792, 0.8176273, -1.255408, 1, 0.2941177, 0, 1,
-1.591894, 1.544016, -1.613169, 1, 0.3019608, 0, 1,
-1.582048, -0.4700609, -0.1021346, 1, 0.3058824, 0, 1,
-1.56953, 0.3275558, -2.276284, 1, 0.3137255, 0, 1,
-1.555554, 0.4286465, -3.786034, 1, 0.3176471, 0, 1,
-1.534577, -0.0569658, -1.493459, 1, 0.3254902, 0, 1,
-1.524974, -0.9135344, -0.8207299, 1, 0.3294118, 0, 1,
-1.524621, 1.534065, -0.6734974, 1, 0.3372549, 0, 1,
-1.522029, -2.507646, -2.137884, 1, 0.3411765, 0, 1,
-1.518386, 1.887646, 1.288087, 1, 0.3490196, 0, 1,
-1.507081, 0.1620772, -1.93233, 1, 0.3529412, 0, 1,
-1.503911, 0.4555542, -1.134911, 1, 0.3607843, 0, 1,
-1.502655, -0.6872734, -2.785329, 1, 0.3647059, 0, 1,
-1.500374, 0.6179001, 0.7233819, 1, 0.372549, 0, 1,
-1.476573, -1.159903, -2.143949, 1, 0.3764706, 0, 1,
-1.449496, -0.4841658, -1.116749, 1, 0.3843137, 0, 1,
-1.440136, 0.7376713, -2.047043, 1, 0.3882353, 0, 1,
-1.436542, -0.4006564, -0.6765211, 1, 0.3960784, 0, 1,
-1.434783, 0.517192, -1.822942, 1, 0.4039216, 0, 1,
-1.433374, -0.1807989, -1.626377, 1, 0.4078431, 0, 1,
-1.427772, 1.858364, -0.3962385, 1, 0.4156863, 0, 1,
-1.422308, -0.6210742, -2.485952, 1, 0.4196078, 0, 1,
-1.396361, 0.4676425, -0.8874109, 1, 0.427451, 0, 1,
-1.387209, 1.160141, -0.4844622, 1, 0.4313726, 0, 1,
-1.384916, 0.8366022, -1.539637, 1, 0.4392157, 0, 1,
-1.383994, 1.348726, -0.5141278, 1, 0.4431373, 0, 1,
-1.360432, -0.9799492, -3.453305, 1, 0.4509804, 0, 1,
-1.349944, -0.3945918, 0.1403805, 1, 0.454902, 0, 1,
-1.340786, -1.251655, -1.975274, 1, 0.4627451, 0, 1,
-1.34076, -0.07017998, -1.523462, 1, 0.4666667, 0, 1,
-1.3393, -0.9548257, -3.835209, 1, 0.4745098, 0, 1,
-1.337406, -0.02284365, -1.299704, 1, 0.4784314, 0, 1,
-1.335779, 0.08100727, -2.022974, 1, 0.4862745, 0, 1,
-1.315771, 1.60847, -0.1605044, 1, 0.4901961, 0, 1,
-1.306228, 1.252454, -1.415243, 1, 0.4980392, 0, 1,
-1.302091, -0.07842425, -0.8383164, 1, 0.5058824, 0, 1,
-1.298444, 0.822135, -1.132152, 1, 0.509804, 0, 1,
-1.295804, -0.07143013, -3.875664, 1, 0.5176471, 0, 1,
-1.295732, 0.4781533, -0.2959479, 1, 0.5215687, 0, 1,
-1.291198, -0.7455282, -1.802221, 1, 0.5294118, 0, 1,
-1.282835, -0.5076392, -1.291867, 1, 0.5333334, 0, 1,
-1.275098, 1.045559, -1.795889, 1, 0.5411765, 0, 1,
-1.261317, 1.117217, -1.574156, 1, 0.5450981, 0, 1,
-1.243436, 0.6123276, 0.2505073, 1, 0.5529412, 0, 1,
-1.236913, 0.8999397, 0.4441736, 1, 0.5568628, 0, 1,
-1.226376, -0.02470242, -2.436889, 1, 0.5647059, 0, 1,
-1.201172, 2.609107, -0.7069603, 1, 0.5686275, 0, 1,
-1.200784, -0.6837738, -3.03731, 1, 0.5764706, 0, 1,
-1.197839, -0.498215, -2.278063, 1, 0.5803922, 0, 1,
-1.194573, -0.1659076, -2.805555, 1, 0.5882353, 0, 1,
-1.194034, -0.7411532, -2.460718, 1, 0.5921569, 0, 1,
-1.179344, -1.44182, -1.527254, 1, 0.6, 0, 1,
-1.172875, -0.6569498, -3.281433, 1, 0.6078432, 0, 1,
-1.169984, 0.8714211, -0.422662, 1, 0.6117647, 0, 1,
-1.166484, 1.08963, -1.405101, 1, 0.6196079, 0, 1,
-1.161757, 0.3586414, 0.4989755, 1, 0.6235294, 0, 1,
-1.160935, 0.6803926, -1.391648, 1, 0.6313726, 0, 1,
-1.158448, -1.421129, -1.091095, 1, 0.6352941, 0, 1,
-1.156003, -0.9646104, -2.597828, 1, 0.6431373, 0, 1,
-1.155797, -0.4530047, -2.814784, 1, 0.6470588, 0, 1,
-1.155788, -1.180792, -1.18398, 1, 0.654902, 0, 1,
-1.146226, 0.5768768, -1.369058, 1, 0.6588235, 0, 1,
-1.145298, 0.606847, -2.094702, 1, 0.6666667, 0, 1,
-1.14312, 1.412751, 0.5011889, 1, 0.6705883, 0, 1,
-1.140004, 1.124832, -1.440578, 1, 0.6784314, 0, 1,
-1.132906, 0.6755017, -1.226926, 1, 0.682353, 0, 1,
-1.129461, -0.1553791, -1.036807, 1, 0.6901961, 0, 1,
-1.109347, 0.09509213, -1.73036, 1, 0.6941177, 0, 1,
-1.103354, -0.1135758, -2.497479, 1, 0.7019608, 0, 1,
-1.103141, 1.08178, 1.421508, 1, 0.7098039, 0, 1,
-1.099531, 0.6455441, -1.734462, 1, 0.7137255, 0, 1,
-1.087949, -1.703406, -3.656709, 1, 0.7215686, 0, 1,
-1.084665, -0.1541056, -2.765435, 1, 0.7254902, 0, 1,
-1.08368, 0.6942367, -0.3062737, 1, 0.7333333, 0, 1,
-1.072387, 0.4985876, -4.001349, 1, 0.7372549, 0, 1,
-1.070392, 0.1805708, -0.6932161, 1, 0.7450981, 0, 1,
-1.069021, -0.8585149, -1.870149, 1, 0.7490196, 0, 1,
-1.068858, -0.3402472, -2.329279, 1, 0.7568628, 0, 1,
-1.066551, 0.2760322, -0.8641784, 1, 0.7607843, 0, 1,
-1.061794, 0.6032943, -1.996233, 1, 0.7686275, 0, 1,
-1.058377, 0.6189301, -1.071353, 1, 0.772549, 0, 1,
-1.04809, 1.592376, -2.037008, 1, 0.7803922, 0, 1,
-1.047028, -0.05865276, -2.2716, 1, 0.7843137, 0, 1,
-1.040799, -1.018559, -1.716329, 1, 0.7921569, 0, 1,
-1.032639, 1.138305, -0.3304247, 1, 0.7960784, 0, 1,
-1.03236, -1.107792, -0.9146718, 1, 0.8039216, 0, 1,
-1.029456, -1.450177, -1.522852, 1, 0.8117647, 0, 1,
-1.024249, 0.3785199, -0.5634809, 1, 0.8156863, 0, 1,
-1.022647, 0.01564575, -2.032307, 1, 0.8235294, 0, 1,
-1.006463, -1.910174, -1.572534, 1, 0.827451, 0, 1,
-1.005047, -0.1359643, -1.174837, 1, 0.8352941, 0, 1,
-1.002958, -1.769177, -2.126741, 1, 0.8392157, 0, 1,
-1.000131, -0.7937095, -2.613921, 1, 0.8470588, 0, 1,
-0.999647, 0.1398125, -2.179021, 1, 0.8509804, 0, 1,
-0.9947311, 0.5192521, -1.986173, 1, 0.8588235, 0, 1,
-0.9887951, 0.3260931, -1.343965, 1, 0.8627451, 0, 1,
-0.9845967, 0.9097493, -0.763152, 1, 0.8705882, 0, 1,
-0.9819539, -0.3843309, -3.047441, 1, 0.8745098, 0, 1,
-0.9713599, -0.5604826, -1.072832, 1, 0.8823529, 0, 1,
-0.9707985, -0.6734898, -1.580213, 1, 0.8862745, 0, 1,
-0.9570641, -0.5477048, -3.800481, 1, 0.8941177, 0, 1,
-0.9315016, 0.6157622, 0.03938109, 1, 0.8980392, 0, 1,
-0.9268178, 0.328034, -0.751504, 1, 0.9058824, 0, 1,
-0.9257993, -0.02680518, -1.739243, 1, 0.9137255, 0, 1,
-0.9257488, 0.8863627, -0.8218952, 1, 0.9176471, 0, 1,
-0.921634, -1.244948, -2.353121, 1, 0.9254902, 0, 1,
-0.9103085, 1.400084, 1.675781, 1, 0.9294118, 0, 1,
-0.9090542, 1.069026, -2.697021, 1, 0.9372549, 0, 1,
-0.8949476, 1.219108, -0.3736776, 1, 0.9411765, 0, 1,
-0.8934836, 0.1664597, -1.225677, 1, 0.9490196, 0, 1,
-0.8906071, -2.051714, -2.649361, 1, 0.9529412, 0, 1,
-0.8893133, 0.666932, 0.08941205, 1, 0.9607843, 0, 1,
-0.8884521, 0.3448951, -1.16845, 1, 0.9647059, 0, 1,
-0.8828505, 0.9282225, -1.412897, 1, 0.972549, 0, 1,
-0.8805755, -1.698631, -3.418754, 1, 0.9764706, 0, 1,
-0.8770239, 0.3216417, -0.1487195, 1, 0.9843137, 0, 1,
-0.8753761, -0.3882602, -1.516484, 1, 0.9882353, 0, 1,
-0.8727787, -0.9396605, -3.071851, 1, 0.9960784, 0, 1,
-0.8713105, -0.2339383, -3.032727, 0.9960784, 1, 0, 1,
-0.87026, -0.3572342, -2.104982, 0.9921569, 1, 0, 1,
-0.866663, 0.9815553, -0.6584733, 0.9843137, 1, 0, 1,
-0.8611313, 0.8535645, 0.5746107, 0.9803922, 1, 0, 1,
-0.8597544, 1.057084, -0.4234443, 0.972549, 1, 0, 1,
-0.8580451, 0.6514595, -1.071605, 0.9686275, 1, 0, 1,
-0.8557662, 0.34073, -2.844484, 0.9607843, 1, 0, 1,
-0.8538947, -1.049801, -1.244515, 0.9568627, 1, 0, 1,
-0.8536165, -1.846292, -1.858781, 0.9490196, 1, 0, 1,
-0.8490577, 0.4422854, -2.022755, 0.945098, 1, 0, 1,
-0.8466547, -1.334643, -2.082997, 0.9372549, 1, 0, 1,
-0.8455978, -0.7624699, -3.364096, 0.9333333, 1, 0, 1,
-0.841527, -0.3490971, -3.152695, 0.9254902, 1, 0, 1,
-0.8374009, -0.119292, -2.15456, 0.9215686, 1, 0, 1,
-0.8303994, 1.057721, -1.079206, 0.9137255, 1, 0, 1,
-0.8225648, -1.278201, -1.935382, 0.9098039, 1, 0, 1,
-0.8218455, -0.2760727, -1.137976, 0.9019608, 1, 0, 1,
-0.8189904, 1.446178, 0.9441059, 0.8941177, 1, 0, 1,
-0.8144974, 2.173825, -0.9165128, 0.8901961, 1, 0, 1,
-0.810596, 0.2785501, -2.432696, 0.8823529, 1, 0, 1,
-0.8094957, -1.701998, -3.172093, 0.8784314, 1, 0, 1,
-0.8023193, 0.1363159, -0.7472301, 0.8705882, 1, 0, 1,
-0.8022478, -0.2324648, -2.209905, 0.8666667, 1, 0, 1,
-0.7995845, 1.910296, -0.7315663, 0.8588235, 1, 0, 1,
-0.7981574, -1.394479, -1.769011, 0.854902, 1, 0, 1,
-0.7969083, -0.5913626, -2.48346, 0.8470588, 1, 0, 1,
-0.7953091, 0.7722634, 0.8590457, 0.8431373, 1, 0, 1,
-0.7949576, -0.4876894, -1.784989, 0.8352941, 1, 0, 1,
-0.7895856, -1.817919, -1.7266, 0.8313726, 1, 0, 1,
-0.7892938, 0.1084398, -1.997583, 0.8235294, 1, 0, 1,
-0.7873316, -0.3321626, -2.07662, 0.8196079, 1, 0, 1,
-0.78605, -1.574553, -1.832178, 0.8117647, 1, 0, 1,
-0.7838879, -0.3408926, -0.6264145, 0.8078431, 1, 0, 1,
-0.7809819, -0.5609021, -0.9282485, 0.8, 1, 0, 1,
-0.7773406, 0.7138276, -2.763067, 0.7921569, 1, 0, 1,
-0.7772135, 0.8342237, -1.460621, 0.7882353, 1, 0, 1,
-0.7681424, 0.8824688, -1.82167, 0.7803922, 1, 0, 1,
-0.7667875, -1.576345, -1.531474, 0.7764706, 1, 0, 1,
-0.7656115, 0.718087, -0.9055178, 0.7686275, 1, 0, 1,
-0.7644145, 0.3397383, -1.432686, 0.7647059, 1, 0, 1,
-0.7614015, -0.5515958, -1.726982, 0.7568628, 1, 0, 1,
-0.7572829, 0.4324079, -0.8282751, 0.7529412, 1, 0, 1,
-0.7565193, -1.427783, -2.490728, 0.7450981, 1, 0, 1,
-0.7419622, 1.053995, -0.6915779, 0.7411765, 1, 0, 1,
-0.7381176, 1.303214, -3.148616, 0.7333333, 1, 0, 1,
-0.7379732, -2.957553, -2.232784, 0.7294118, 1, 0, 1,
-0.7368373, 1.202741, -0.4159282, 0.7215686, 1, 0, 1,
-0.7343649, -1.777041, -2.054591, 0.7176471, 1, 0, 1,
-0.7329552, 1.151352, -1.966794, 0.7098039, 1, 0, 1,
-0.7298273, -0.2966278, -0.62052, 0.7058824, 1, 0, 1,
-0.7225014, 0.1966742, -1.344756, 0.6980392, 1, 0, 1,
-0.7189732, 2.47693, -1.882628, 0.6901961, 1, 0, 1,
-0.7171976, 0.9316467, -0.7216012, 0.6862745, 1, 0, 1,
-0.716522, -1.224231, -4.308768, 0.6784314, 1, 0, 1,
-0.7160139, 0.1809648, -2.46495, 0.6745098, 1, 0, 1,
-0.7130784, -1.925191, -2.454195, 0.6666667, 1, 0, 1,
-0.7124633, 0.3887022, -0.9030415, 0.6627451, 1, 0, 1,
-0.7106136, 0.4230655, -3.007528, 0.654902, 1, 0, 1,
-0.7071069, -0.4687817, -1.399867, 0.6509804, 1, 0, 1,
-0.7068821, -0.2523521, -1.873026, 0.6431373, 1, 0, 1,
-0.7024524, -0.6889417, -3.920292, 0.6392157, 1, 0, 1,
-0.7013581, 0.3365107, -2.116841, 0.6313726, 1, 0, 1,
-0.6981077, 0.6137087, 0.9383187, 0.627451, 1, 0, 1,
-0.6843165, 0.8908474, -1.72762, 0.6196079, 1, 0, 1,
-0.6824318, 0.1301448, -2.584262, 0.6156863, 1, 0, 1,
-0.6804432, 0.2427941, -0.1599312, 0.6078432, 1, 0, 1,
-0.6777924, 0.5197238, 1.330622, 0.6039216, 1, 0, 1,
-0.6731371, 1.293115, 0.03332901, 0.5960785, 1, 0, 1,
-0.6720765, -0.8144625, -1.926535, 0.5882353, 1, 0, 1,
-0.6672199, 1.786001, -1.397101, 0.5843138, 1, 0, 1,
-0.6623277, -0.1423136, -1.028621, 0.5764706, 1, 0, 1,
-0.6606588, -0.7795861, -2.556627, 0.572549, 1, 0, 1,
-0.6586739, -0.6000054, -1.342631, 0.5647059, 1, 0, 1,
-0.6559336, -1.547335, -3.174583, 0.5607843, 1, 0, 1,
-0.6544268, -0.9748563, -1.801252, 0.5529412, 1, 0, 1,
-0.6428786, 0.7284185, 0.001957347, 0.5490196, 1, 0, 1,
-0.6406591, -1.503349, -2.004112, 0.5411765, 1, 0, 1,
-0.6334564, -0.4066823, -0.744808, 0.5372549, 1, 0, 1,
-0.6301305, -0.5563718, -2.832986, 0.5294118, 1, 0, 1,
-0.630004, 0.5449603, 0.0005537221, 0.5254902, 1, 0, 1,
-0.6288048, -2.342587, -3.539265, 0.5176471, 1, 0, 1,
-0.6271219, -0.0170534, -0.6575409, 0.5137255, 1, 0, 1,
-0.6254877, -1.228982, -0.3072434, 0.5058824, 1, 0, 1,
-0.6237867, -0.1492691, -2.70213, 0.5019608, 1, 0, 1,
-0.6226518, 0.5257773, -1.686381, 0.4941176, 1, 0, 1,
-0.6196252, -1.267325, -3.173942, 0.4862745, 1, 0, 1,
-0.6167846, 0.02203738, -2.065415, 0.4823529, 1, 0, 1,
-0.6158566, -0.3474591, -2.650318, 0.4745098, 1, 0, 1,
-0.6072028, 2.495849, -2.201475, 0.4705882, 1, 0, 1,
-0.6057625, 1.580506, -2.388005, 0.4627451, 1, 0, 1,
-0.6009485, -0.7631543, -1.742473, 0.4588235, 1, 0, 1,
-0.5997066, 0.3202263, -1.036701, 0.4509804, 1, 0, 1,
-0.5988945, 1.843266, -1.002714, 0.4470588, 1, 0, 1,
-0.5983096, 1.019961, -0.2439859, 0.4392157, 1, 0, 1,
-0.5969828, -0.7166981, -1.823361, 0.4352941, 1, 0, 1,
-0.5922369, 0.5876988, -0.5187584, 0.427451, 1, 0, 1,
-0.5916637, -1.977437, -0.9015799, 0.4235294, 1, 0, 1,
-0.585959, 1.418083, -0.07295983, 0.4156863, 1, 0, 1,
-0.5830584, -1.096721, -3.397962, 0.4117647, 1, 0, 1,
-0.5824644, -1.377712, -3.592974, 0.4039216, 1, 0, 1,
-0.5816885, 0.08246459, -2.77976, 0.3960784, 1, 0, 1,
-0.5795758, 0.1729674, -1.97465, 0.3921569, 1, 0, 1,
-0.5755538, 1.082564, -0.2109623, 0.3843137, 1, 0, 1,
-0.5740775, 0.1686522, -2.730582, 0.3803922, 1, 0, 1,
-0.5708787, 1.531212, 0.02806423, 0.372549, 1, 0, 1,
-0.5703309, 0.4695354, -0.8572397, 0.3686275, 1, 0, 1,
-0.5692691, -0.6018467, -2.751845, 0.3607843, 1, 0, 1,
-0.5679452, -0.005902034, -1.311811, 0.3568628, 1, 0, 1,
-0.5668768, 0.5146654, -1.009854, 0.3490196, 1, 0, 1,
-0.5664318, 0.4215254, -1.009319, 0.345098, 1, 0, 1,
-0.5659185, -0.2011638, -1.840845, 0.3372549, 1, 0, 1,
-0.5651564, 0.2857832, -2.282262, 0.3333333, 1, 0, 1,
-0.5644113, 2.471328, -0.4047871, 0.3254902, 1, 0, 1,
-0.5628137, -0.008513832, -0.9330299, 0.3215686, 1, 0, 1,
-0.5602162, -0.2186385, -1.882268, 0.3137255, 1, 0, 1,
-0.5584462, -1.117071, -2.347272, 0.3098039, 1, 0, 1,
-0.5584125, 0.8218076, -1.381079, 0.3019608, 1, 0, 1,
-0.5534648, 0.1907733, -1.238945, 0.2941177, 1, 0, 1,
-0.5503489, -0.1633626, -1.407724, 0.2901961, 1, 0, 1,
-0.5494074, 0.578797, -0.5554261, 0.282353, 1, 0, 1,
-0.5468969, 1.199274, 0.1027945, 0.2784314, 1, 0, 1,
-0.5436774, 1.13285, -1.116138, 0.2705882, 1, 0, 1,
-0.541714, -1.0819, -3.21921, 0.2666667, 1, 0, 1,
-0.5392351, -1.464923, -3.401906, 0.2588235, 1, 0, 1,
-0.5341156, 1.028465, 0.1763807, 0.254902, 1, 0, 1,
-0.5339306, -2.45308, -1.902566, 0.2470588, 1, 0, 1,
-0.5336956, 0.03862192, -3.468443, 0.2431373, 1, 0, 1,
-0.5259926, -0.3330982, -3.752025, 0.2352941, 1, 0, 1,
-0.5233189, -0.308209, -1.851908, 0.2313726, 1, 0, 1,
-0.5217601, -0.5911949, -3.6131, 0.2235294, 1, 0, 1,
-0.5209498, 0.8334034, -1.781987, 0.2196078, 1, 0, 1,
-0.5071675, -0.2159974, -1.073192, 0.2117647, 1, 0, 1,
-0.4999691, -0.5099323, -2.080662, 0.2078431, 1, 0, 1,
-0.4979309, 1.023636, 0.252299, 0.2, 1, 0, 1,
-0.4963302, 0.9209879, 0.2149732, 0.1921569, 1, 0, 1,
-0.4874685, 1.086238, 0.00488949, 0.1882353, 1, 0, 1,
-0.4825415, 1.497638, -1.997353, 0.1803922, 1, 0, 1,
-0.482513, 1.051803, -0.8277186, 0.1764706, 1, 0, 1,
-0.4741411, 0.8303533, 0.1618702, 0.1686275, 1, 0, 1,
-0.4715944, -0.6538544, -3.661026, 0.1647059, 1, 0, 1,
-0.468383, 2.659253, 0.7317658, 0.1568628, 1, 0, 1,
-0.4655692, 1.848326, -0.57604, 0.1529412, 1, 0, 1,
-0.461155, 1.278255, 0.2751779, 0.145098, 1, 0, 1,
-0.4601388, 0.2643694, 0.4663589, 0.1411765, 1, 0, 1,
-0.4575124, 0.5646452, -1.043453, 0.1333333, 1, 0, 1,
-0.4574922, 0.5096507, 0.5021757, 0.1294118, 1, 0, 1,
-0.4570306, -0.04923228, -1.481952, 0.1215686, 1, 0, 1,
-0.4564164, -0.458782, -2.37356, 0.1176471, 1, 0, 1,
-0.451798, 1.160589, -0.6988797, 0.1098039, 1, 0, 1,
-0.4457454, 1.567669, -1.076728, 0.1058824, 1, 0, 1,
-0.4418084, 2.462431, 0.5342009, 0.09803922, 1, 0, 1,
-0.4405493, 0.0386649, -1.145776, 0.09019608, 1, 0, 1,
-0.4379709, 0.5844207, 0.3832527, 0.08627451, 1, 0, 1,
-0.4348205, 0.3262749, -0.04816091, 0.07843138, 1, 0, 1,
-0.4339519, 0.3247325, -0.8794398, 0.07450981, 1, 0, 1,
-0.4302056, 1.459419, 1.238777, 0.06666667, 1, 0, 1,
-0.4284629, -1.151864, -3.449801, 0.0627451, 1, 0, 1,
-0.424345, -0.2474201, -1.446916, 0.05490196, 1, 0, 1,
-0.4189046, -0.08846261, -1.516284, 0.05098039, 1, 0, 1,
-0.4180698, 2.614847, -0.8669891, 0.04313726, 1, 0, 1,
-0.4136502, -0.4610671, -2.621657, 0.03921569, 1, 0, 1,
-0.4119246, 0.8149456, -3.376839, 0.03137255, 1, 0, 1,
-0.4099058, -0.2346842, -2.915847, 0.02745098, 1, 0, 1,
-0.409591, 0.7858255, -0.3619719, 0.01960784, 1, 0, 1,
-0.409079, -0.7748179, -1.460079, 0.01568628, 1, 0, 1,
-0.4068156, -0.1699558, -2.677074, 0.007843138, 1, 0, 1,
-0.4044801, -1.430775, -2.354645, 0.003921569, 1, 0, 1,
-0.4023908, 0.04773963, -1.46364, 0, 1, 0.003921569, 1,
-0.3981169, 1.495662, -0.7892953, 0, 1, 0.01176471, 1,
-0.3901026, 1.446632, -1.228908, 0, 1, 0.01568628, 1,
-0.3787312, 0.07437515, -2.204117, 0, 1, 0.02352941, 1,
-0.3782088, -0.5102381, -1.680783, 0, 1, 0.02745098, 1,
-0.3774891, -0.3111353, -4.417521, 0, 1, 0.03529412, 1,
-0.375439, 0.4466791, -1.793468, 0, 1, 0.03921569, 1,
-0.3723975, -1.660354, -2.945447, 0, 1, 0.04705882, 1,
-0.3720007, -1.399704, -2.609416, 0, 1, 0.05098039, 1,
-0.3706471, 0.4584612, -1.307589, 0, 1, 0.05882353, 1,
-0.3690337, -0.8088937, -2.370734, 0, 1, 0.0627451, 1,
-0.3686468, 0.6663148, -0.07299881, 0, 1, 0.07058824, 1,
-0.3650286, -2.149785, -4.006474, 0, 1, 0.07450981, 1,
-0.3647684, -0.8384137, -2.16149, 0, 1, 0.08235294, 1,
-0.3640297, 0.4889698, -1.285755, 0, 1, 0.08627451, 1,
-0.3633716, -0.5382854, -3.747609, 0, 1, 0.09411765, 1,
-0.3609738, -0.07623889, -2.10895, 0, 1, 0.1019608, 1,
-0.3594618, -0.0223927, -2.665781, 0, 1, 0.1058824, 1,
-0.3547135, -0.5173423, -3.177744, 0, 1, 0.1137255, 1,
-0.3535443, -0.3223608, -0.9833013, 0, 1, 0.1176471, 1,
-0.3528808, -0.1395114, -1.092523, 0, 1, 0.1254902, 1,
-0.3499244, -1.481988, -1.865964, 0, 1, 0.1294118, 1,
-0.3484068, -0.2258512, 0.1074233, 0, 1, 0.1372549, 1,
-0.3475579, -0.7521558, -1.525952, 0, 1, 0.1411765, 1,
-0.3464364, 0.53552, -1.725796, 0, 1, 0.1490196, 1,
-0.3396441, -1.374859, -3.069758, 0, 1, 0.1529412, 1,
-0.3364436, -1.356317, -3.58554, 0, 1, 0.1607843, 1,
-0.3255185, -0.3455573, -2.796192, 0, 1, 0.1647059, 1,
-0.325392, -0.09138035, -3.879188, 0, 1, 0.172549, 1,
-0.3222853, -2.105782, -3.3201, 0, 1, 0.1764706, 1,
-0.3150027, 0.4483148, 0.2733011, 0, 1, 0.1843137, 1,
-0.3130933, -1.04725, -1.78995, 0, 1, 0.1882353, 1,
-0.3082711, -0.05510876, -2.990437, 0, 1, 0.1960784, 1,
-0.2990311, 0.07615866, -1.291606, 0, 1, 0.2039216, 1,
-0.295347, 1.216043, 0.247879, 0, 1, 0.2078431, 1,
-0.2935201, 0.7689091, 0.2046427, 0, 1, 0.2156863, 1,
-0.2908636, 0.576971, -0.4120969, 0, 1, 0.2196078, 1,
-0.2856053, 1.407456, 0.238196, 0, 1, 0.227451, 1,
-0.2849303, -2.305583, -4.307109, 0, 1, 0.2313726, 1,
-0.2836904, -1.162917, -3.919408, 0, 1, 0.2392157, 1,
-0.2794972, 1.216555, -0.974507, 0, 1, 0.2431373, 1,
-0.273253, 0.5379398, -1.154349, 0, 1, 0.2509804, 1,
-0.2664156, 0.5958494, 0.9730927, 0, 1, 0.254902, 1,
-0.2527685, 0.8406236, -0.7713501, 0, 1, 0.2627451, 1,
-0.2512969, 0.2608629, -1.318056, 0, 1, 0.2666667, 1,
-0.2483965, -1.055763, -0.587884, 0, 1, 0.2745098, 1,
-0.2361612, 0.0810535, -0.9904729, 0, 1, 0.2784314, 1,
-0.2359292, 0.8195822, 0.81362, 0, 1, 0.2862745, 1,
-0.2319759, 0.3087892, -0.03289133, 0, 1, 0.2901961, 1,
-0.2315751, 0.03099084, -0.2517961, 0, 1, 0.2980392, 1,
-0.2298238, 1.535346, -0.5504414, 0, 1, 0.3058824, 1,
-0.2290695, -0.2182698, -2.79343, 0, 1, 0.3098039, 1,
-0.2238274, 0.5181558, -2.117043, 0, 1, 0.3176471, 1,
-0.2215062, 1.522085, 0.1530796, 0, 1, 0.3215686, 1,
-0.2165238, 0.3731138, -1.050591, 0, 1, 0.3294118, 1,
-0.2158119, 0.9786416, 1.125659, 0, 1, 0.3333333, 1,
-0.2141948, -1.687078, -3.571654, 0, 1, 0.3411765, 1,
-0.2137646, -0.98343, -2.761732, 0, 1, 0.345098, 1,
-0.2131591, 0.04504211, -1.049881, 0, 1, 0.3529412, 1,
-0.2129743, 0.9286357, -2.327429, 0, 1, 0.3568628, 1,
-0.2124158, -0.5706608, -2.702631, 0, 1, 0.3647059, 1,
-0.2069819, 2.401793, 1.156062, 0, 1, 0.3686275, 1,
-0.2019421, -0.2196591, -1.628671, 0, 1, 0.3764706, 1,
-0.1981371, -0.7172425, -2.468142, 0, 1, 0.3803922, 1,
-0.1961854, -0.5890353, -2.130398, 0, 1, 0.3882353, 1,
-0.1949381, 1.028174, -0.5988831, 0, 1, 0.3921569, 1,
-0.1929588, -0.001478681, -0.4636524, 0, 1, 0.4, 1,
-0.1884374, -0.0002336983, 0.5240663, 0, 1, 0.4078431, 1,
-0.1869245, -0.08736499, -2.382186, 0, 1, 0.4117647, 1,
-0.1850399, -0.3841065, -3.439808, 0, 1, 0.4196078, 1,
-0.1832004, 0.9500525, -0.8663961, 0, 1, 0.4235294, 1,
-0.1751094, 0.8674309, -0.6712756, 0, 1, 0.4313726, 1,
-0.1677688, -0.2900911, -2.010302, 0, 1, 0.4352941, 1,
-0.1668635, -0.8306662, -2.208465, 0, 1, 0.4431373, 1,
-0.1607406, -1.245353, -3.634647, 0, 1, 0.4470588, 1,
-0.157793, 1.791659, -2.553196, 0, 1, 0.454902, 1,
-0.156312, -0.01373151, -2.261961, 0, 1, 0.4588235, 1,
-0.1562458, -0.524706, -2.905339, 0, 1, 0.4666667, 1,
-0.156069, -1.250377, -4.223017, 0, 1, 0.4705882, 1,
-0.1544138, 0.9467106, 0.565984, 0, 1, 0.4784314, 1,
-0.1542829, 0.2522953, -1.795205, 0, 1, 0.4823529, 1,
-0.1536898, 0.2236214, -0.3409441, 0, 1, 0.4901961, 1,
-0.1527751, -1.177417, -3.273316, 0, 1, 0.4941176, 1,
-0.148274, 0.2770149, -0.131341, 0, 1, 0.5019608, 1,
-0.1430347, -0.283068, -1.109851, 0, 1, 0.509804, 1,
-0.1408103, -0.5557866, -3.765585, 0, 1, 0.5137255, 1,
-0.137954, 1.308125, -0.7633127, 0, 1, 0.5215687, 1,
-0.1321644, 0.4046473, 1.11131, 0, 1, 0.5254902, 1,
-0.131877, 1.833599, 0.8027673, 0, 1, 0.5333334, 1,
-0.1275407, -1.000661, -5.421198, 0, 1, 0.5372549, 1,
-0.126427, 0.6099445, 0.7224818, 0, 1, 0.5450981, 1,
-0.1238941, 0.8224378, -0.8343775, 0, 1, 0.5490196, 1,
-0.1229152, -0.02192786, -0.4092266, 0, 1, 0.5568628, 1,
-0.1109216, 0.7072284, -0.473891, 0, 1, 0.5607843, 1,
-0.1079258, -0.8562125, -3.532647, 0, 1, 0.5686275, 1,
-0.1072213, 1.478465, 0.3186871, 0, 1, 0.572549, 1,
-0.1050653, -0.07216004, -0.7229559, 0, 1, 0.5803922, 1,
-0.1012669, -0.2856222, -2.309389, 0, 1, 0.5843138, 1,
-0.1008903, -0.4664676, -4.715232, 0, 1, 0.5921569, 1,
-0.09831271, 0.2210563, 0.9504039, 0, 1, 0.5960785, 1,
-0.09795416, 0.6516431, -0.2441336, 0, 1, 0.6039216, 1,
-0.09645082, 1.02623, 1.135128, 0, 1, 0.6117647, 1,
-0.09361663, -0.3333306, -2.863248, 0, 1, 0.6156863, 1,
-0.09267407, 2.162362, -0.8438752, 0, 1, 0.6235294, 1,
-0.09197938, -0.7408217, -3.746747, 0, 1, 0.627451, 1,
-0.08935136, -0.08782873, -1.781218, 0, 1, 0.6352941, 1,
-0.08273453, -0.4020176, -4.686478, 0, 1, 0.6392157, 1,
-0.08095872, 0.5001317, 0.9326642, 0, 1, 0.6470588, 1,
-0.07828118, -0.1570661, -3.423908, 0, 1, 0.6509804, 1,
-0.07795937, -0.6071694, -3.669861, 0, 1, 0.6588235, 1,
-0.07559393, 1.339372, -0.3831913, 0, 1, 0.6627451, 1,
-0.07521482, 0.6651117, -0.7327887, 0, 1, 0.6705883, 1,
-0.07347465, 1.695467, -2.33985, 0, 1, 0.6745098, 1,
-0.0724301, 1.45092, 4.098476, 0, 1, 0.682353, 1,
-0.07104093, 1.692757, 1.058704, 0, 1, 0.6862745, 1,
-0.07006878, 0.9244888, -0.4848938, 0, 1, 0.6941177, 1,
-0.06979121, -0.1416171, -2.043194, 0, 1, 0.7019608, 1,
-0.06755602, 0.3554242, -1.633597, 0, 1, 0.7058824, 1,
-0.06430412, -0.09602381, -1.634435, 0, 1, 0.7137255, 1,
-0.06424446, -0.8187751, -3.276013, 0, 1, 0.7176471, 1,
-0.05928086, -0.377419, -2.999, 0, 1, 0.7254902, 1,
-0.05893139, 0.6615123, -0.2904663, 0, 1, 0.7294118, 1,
-0.05023534, 0.5441214, -0.1000415, 0, 1, 0.7372549, 1,
-0.04667015, -1.86036, -4.849933, 0, 1, 0.7411765, 1,
-0.04210858, -0.24781, -2.218394, 0, 1, 0.7490196, 1,
-0.03727699, 1.00067, -0.1131373, 0, 1, 0.7529412, 1,
-0.0315919, -0.8713523, -3.485468, 0, 1, 0.7607843, 1,
-0.02924562, 0.1514739, -0.1224071, 0, 1, 0.7647059, 1,
-0.02881333, -0.1421903, -2.728001, 0, 1, 0.772549, 1,
-0.0282675, -0.2903651, -3.05303, 0, 1, 0.7764706, 1,
-0.02744355, -0.009339276, -3.733949, 0, 1, 0.7843137, 1,
-0.02738177, 1.163363, -0.8183802, 0, 1, 0.7882353, 1,
-0.02621976, -1.582128, -2.243213, 0, 1, 0.7960784, 1,
-0.0257402, -0.482396, -3.551603, 0, 1, 0.8039216, 1,
-0.02279543, -0.472684, -3.694071, 0, 1, 0.8078431, 1,
-0.02162631, 0.1601762, -0.3862994, 0, 1, 0.8156863, 1,
-0.02087067, 0.1437581, -0.1779144, 0, 1, 0.8196079, 1,
-0.01787202, -3.010741, -4.154302, 0, 1, 0.827451, 1,
-0.01594209, -0.3911456, -4.133762, 0, 1, 0.8313726, 1,
-0.01533294, -0.9789782, -4.581696, 0, 1, 0.8392157, 1,
-0.01245928, 1.280511, -0.3680496, 0, 1, 0.8431373, 1,
-0.0106991, -1.263253, -2.466305, 0, 1, 0.8509804, 1,
-0.003656984, 0.2765907, -1.87645, 0, 1, 0.854902, 1,
-0.002072502, 1.16266, 0.4466724, 0, 1, 0.8627451, 1,
0.002583959, 0.9305194, 1.91961, 0, 1, 0.8666667, 1,
0.002779434, -0.8891488, 4.101896, 0, 1, 0.8745098, 1,
0.006263779, -0.7914793, 4.526076, 0, 1, 0.8784314, 1,
0.007213716, 2.138867, 0.571179, 0, 1, 0.8862745, 1,
0.01392157, -1.457506, 2.703838, 0, 1, 0.8901961, 1,
0.01739007, 1.1243, 2.988804, 0, 1, 0.8980392, 1,
0.020728, -0.9820001, 0.9853019, 0, 1, 0.9058824, 1,
0.02211621, -0.4575583, 3.509717, 0, 1, 0.9098039, 1,
0.02441007, -0.9258938, 3.739833, 0, 1, 0.9176471, 1,
0.0262917, -0.3384638, 1.551782, 0, 1, 0.9215686, 1,
0.02683876, 0.4736006, 1.034591, 0, 1, 0.9294118, 1,
0.02955877, 0.647286, -0.5134487, 0, 1, 0.9333333, 1,
0.03131013, 1.992073, 0.0658086, 0, 1, 0.9411765, 1,
0.03411767, -1.447057, 2.830168, 0, 1, 0.945098, 1,
0.03482646, -1.118259, 2.364568, 0, 1, 0.9529412, 1,
0.03618084, -0.4060995, 2.287858, 0, 1, 0.9568627, 1,
0.0377986, -1.498223, 1.725706, 0, 1, 0.9647059, 1,
0.03921641, -0.3584321, 0.537454, 0, 1, 0.9686275, 1,
0.04033462, 0.4800448, 1.681616, 0, 1, 0.9764706, 1,
0.04321263, 0.1955246, 0.3645029, 0, 1, 0.9803922, 1,
0.04581186, 1.050088, -0.5308214, 0, 1, 0.9882353, 1,
0.04924048, -0.358718, 3.938081, 0, 1, 0.9921569, 1,
0.05112974, 1.991004, 1.974182, 0, 1, 1, 1,
0.05188463, 0.5483468, -0.7125803, 0, 0.9921569, 1, 1,
0.05213637, -1.440546, 2.168291, 0, 0.9882353, 1, 1,
0.05448471, -0.128804, 2.426287, 0, 0.9803922, 1, 1,
0.05627298, -1.874114, 4.617401, 0, 0.9764706, 1, 1,
0.05791302, -0.9295654, 3.455031, 0, 0.9686275, 1, 1,
0.06086809, 0.1863202, 1.708582, 0, 0.9647059, 1, 1,
0.06116891, 0.9212337, -0.5102482, 0, 0.9568627, 1, 1,
0.06413827, 1.460258, -0.8650337, 0, 0.9529412, 1, 1,
0.06895648, 1.04697, -1.656536, 0, 0.945098, 1, 1,
0.06902818, -0.6877946, 1.925667, 0, 0.9411765, 1, 1,
0.08095545, -0.805001, 2.453311, 0, 0.9333333, 1, 1,
0.08178974, 1.924796, 2.29709, 0, 0.9294118, 1, 1,
0.0840484, -1.907281, 2.348022, 0, 0.9215686, 1, 1,
0.08409372, -1.448852, 1.96121, 0, 0.9176471, 1, 1,
0.08459634, 1.879216, 0.3007033, 0, 0.9098039, 1, 1,
0.08515855, -2.336159, 3.249724, 0, 0.9058824, 1, 1,
0.08599447, -1.15138, 2.740999, 0, 0.8980392, 1, 1,
0.08913327, 1.473252, -1.336095, 0, 0.8901961, 1, 1,
0.08978309, 1.499838, -0.1640271, 0, 0.8862745, 1, 1,
0.09028788, -1.560636, 4.174139, 0, 0.8784314, 1, 1,
0.09240349, -0.2887874, 2.053503, 0, 0.8745098, 1, 1,
0.09315629, 0.6278566, 1.662828, 0, 0.8666667, 1, 1,
0.09336227, -0.2959178, 3.077555, 0, 0.8627451, 1, 1,
0.09609596, -0.0914683, 3.054734, 0, 0.854902, 1, 1,
0.09728476, -0.5837849, 2.697862, 0, 0.8509804, 1, 1,
0.09865108, 2.551008, -0.4167573, 0, 0.8431373, 1, 1,
0.103328, 0.007944533, 3.156484, 0, 0.8392157, 1, 1,
0.1037335, -2.578439, 2.98589, 0, 0.8313726, 1, 1,
0.1051898, -2.10303, 2.608596, 0, 0.827451, 1, 1,
0.1077037, 0.008287114, 2.343767, 0, 0.8196079, 1, 1,
0.1133403, -0.5754358, 2.738471, 0, 0.8156863, 1, 1,
0.1185707, -0.3140038, 1.869972, 0, 0.8078431, 1, 1,
0.1203569, -0.4300013, 2.771676, 0, 0.8039216, 1, 1,
0.1205926, -1.013268, 2.038233, 0, 0.7960784, 1, 1,
0.1220829, -0.4413532, 2.261636, 0, 0.7882353, 1, 1,
0.1222692, -0.2200938, 2.345312, 0, 0.7843137, 1, 1,
0.1238832, -0.6557437, 3.756587, 0, 0.7764706, 1, 1,
0.1251155, 3.137041, -1.369606, 0, 0.772549, 1, 1,
0.1264323, -0.02725673, 0.8547127, 0, 0.7647059, 1, 1,
0.1273248, -0.5450599, -0.4867143, 0, 0.7607843, 1, 1,
0.1273672, 0.3604553, 0.02902072, 0, 0.7529412, 1, 1,
0.1312431, 0.7524102, -0.4201391, 0, 0.7490196, 1, 1,
0.1418023, 1.286121, 0.7859429, 0, 0.7411765, 1, 1,
0.1465478, 0.1705416, 2.418707, 0, 0.7372549, 1, 1,
0.1516536, 0.2132856, -0.0162791, 0, 0.7294118, 1, 1,
0.1572924, 0.6568515, -1.484836, 0, 0.7254902, 1, 1,
0.1610324, 0.4438429, -1.079998, 0, 0.7176471, 1, 1,
0.1621762, 0.7089794, 2.305351, 0, 0.7137255, 1, 1,
0.1631424, -0.3025691, 2.16522, 0, 0.7058824, 1, 1,
0.1649587, -0.4527574, 3.215176, 0, 0.6980392, 1, 1,
0.1661867, 0.8304766, 1.216225, 0, 0.6941177, 1, 1,
0.1675227, -0.1218053, 4.548212, 0, 0.6862745, 1, 1,
0.169357, -1.004642, 3.597043, 0, 0.682353, 1, 1,
0.1727756, 0.8439578, -0.6445786, 0, 0.6745098, 1, 1,
0.1774929, -0.03183824, 4.830537, 0, 0.6705883, 1, 1,
0.1775365, -0.2136232, 3.866246, 0, 0.6627451, 1, 1,
0.1778242, -0.2886832, 2.204465, 0, 0.6588235, 1, 1,
0.1781644, 0.3830639, -0.04614524, 0, 0.6509804, 1, 1,
0.1817151, -0.5366844, 2.900915, 0, 0.6470588, 1, 1,
0.1836308, -0.5156457, 0.4380866, 0, 0.6392157, 1, 1,
0.1841323, -1.960966, 3.866787, 0, 0.6352941, 1, 1,
0.1859087, -0.6850563, 4.185498, 0, 0.627451, 1, 1,
0.1911202, 0.140036, 1.084397, 0, 0.6235294, 1, 1,
0.1997844, 0.3901042, -0.470502, 0, 0.6156863, 1, 1,
0.2018305, -0.2588931, 4.139249, 0, 0.6117647, 1, 1,
0.2126155, -0.3947471, 2.644151, 0, 0.6039216, 1, 1,
0.2205973, -1.499222, 3.690358, 0, 0.5960785, 1, 1,
0.2216917, 1.630419, 1.237536, 0, 0.5921569, 1, 1,
0.2240098, 1.205922, -1.846698, 0, 0.5843138, 1, 1,
0.2243637, 2.440134, 0.3741755, 0, 0.5803922, 1, 1,
0.2265265, 0.0729764, -0.2380328, 0, 0.572549, 1, 1,
0.2309172, -0.7408293, 1.789983, 0, 0.5686275, 1, 1,
0.2350456, -0.5341652, 3.146835, 0, 0.5607843, 1, 1,
0.2398506, 0.300384, 0.3912916, 0, 0.5568628, 1, 1,
0.2405922, -0.9758939, 3.07824, 0, 0.5490196, 1, 1,
0.2408947, 0.3247513, -1.239563, 0, 0.5450981, 1, 1,
0.2417345, 0.405301, 0.5230263, 0, 0.5372549, 1, 1,
0.2471319, -1.300011, 2.711197, 0, 0.5333334, 1, 1,
0.2483907, 0.4717026, 1.127938, 0, 0.5254902, 1, 1,
0.2536629, 0.6105723, 0.08943564, 0, 0.5215687, 1, 1,
0.255566, 1.780811, 1.306118, 0, 0.5137255, 1, 1,
0.2572163, -0.6865647, 1.797156, 0, 0.509804, 1, 1,
0.2577829, -0.1825975, 2.245483, 0, 0.5019608, 1, 1,
0.264016, -0.9046904, 2.611639, 0, 0.4941176, 1, 1,
0.2697606, -1.21253, 2.397269, 0, 0.4901961, 1, 1,
0.2729151, 1.315247, 2.023699, 0, 0.4823529, 1, 1,
0.2729409, 1.570981, -1.361686, 0, 0.4784314, 1, 1,
0.2732022, 0.3880861, 1.546621, 0, 0.4705882, 1, 1,
0.2791847, -1.245888, 2.337381, 0, 0.4666667, 1, 1,
0.279806, 1.150214, -1.400843, 0, 0.4588235, 1, 1,
0.2854252, 1.96472, -0.5227363, 0, 0.454902, 1, 1,
0.291238, -0.1162218, 2.140539, 0, 0.4470588, 1, 1,
0.2918858, 0.7490692, 1.440922, 0, 0.4431373, 1, 1,
0.2933627, 0.9540058, -1.142579, 0, 0.4352941, 1, 1,
0.293377, -0.1422246, 0.3162273, 0, 0.4313726, 1, 1,
0.2947114, 0.8301077, 1.320196, 0, 0.4235294, 1, 1,
0.3002979, -0.6414698, 3.203355, 0, 0.4196078, 1, 1,
0.3028641, 0.4005027, -0.5640477, 0, 0.4117647, 1, 1,
0.3045826, 1.162024, 0.686169, 0, 0.4078431, 1, 1,
0.305812, 0.5437381, 1.515309, 0, 0.4, 1, 1,
0.3077607, 1.390886, -0.4730159, 0, 0.3921569, 1, 1,
0.3098013, -0.0944641, 1.696139, 0, 0.3882353, 1, 1,
0.3100133, -0.4874701, 0.9786395, 0, 0.3803922, 1, 1,
0.3161723, -0.7639508, 2.986654, 0, 0.3764706, 1, 1,
0.3170128, -1.041157, 0.2224427, 0, 0.3686275, 1, 1,
0.3205333, 0.8213206, 0.1150989, 0, 0.3647059, 1, 1,
0.3205781, -0.8912163, 3.11804, 0, 0.3568628, 1, 1,
0.3206541, 1.039886, 1.023953, 0, 0.3529412, 1, 1,
0.3206994, -0.7111297, 4.112401, 0, 0.345098, 1, 1,
0.3388986, -0.2596277, 3.220458, 0, 0.3411765, 1, 1,
0.3438261, -0.05179292, 1.412676, 0, 0.3333333, 1, 1,
0.3440683, -0.1148527, 2.735184, 0, 0.3294118, 1, 1,
0.3464886, -1.227321, 2.8034, 0, 0.3215686, 1, 1,
0.3466382, -0.4219089, 0.6843144, 0, 0.3176471, 1, 1,
0.3470372, 0.3646764, -1.314137, 0, 0.3098039, 1, 1,
0.348684, 0.3095542, -0.1555171, 0, 0.3058824, 1, 1,
0.3510189, 0.02881029, 0.9538007, 0, 0.2980392, 1, 1,
0.3525274, -0.3310682, 2.204007, 0, 0.2901961, 1, 1,
0.3542329, -1.294901, 1.574495, 0, 0.2862745, 1, 1,
0.3562066, 1.029004, -2.474158, 0, 0.2784314, 1, 1,
0.3579776, 0.0888712, 3.220516, 0, 0.2745098, 1, 1,
0.3603584, -0.873887, 4.051136, 0, 0.2666667, 1, 1,
0.3610419, 1.004902, 0.832361, 0, 0.2627451, 1, 1,
0.3634202, -1.200493, 2.62546, 0, 0.254902, 1, 1,
0.3674597, -0.279549, 3.099779, 0, 0.2509804, 1, 1,
0.3695662, 1.732201, -0.1911615, 0, 0.2431373, 1, 1,
0.3701286, -0.04606621, 3.742577, 0, 0.2392157, 1, 1,
0.3707595, 1.657753, 0.4885453, 0, 0.2313726, 1, 1,
0.3774809, -0.6371516, 2.867865, 0, 0.227451, 1, 1,
0.381166, 0.9143612, -0.7964408, 0, 0.2196078, 1, 1,
0.3812034, -0.4366941, 2.216399, 0, 0.2156863, 1, 1,
0.3818781, -1.513329, 2.476152, 0, 0.2078431, 1, 1,
0.3891452, -0.5728829, 1.576499, 0, 0.2039216, 1, 1,
0.3929423, 0.9636888, 1.01054, 0, 0.1960784, 1, 1,
0.3945381, 0.9491268, 3.326674, 0, 0.1882353, 1, 1,
0.395844, 0.8685197, 1.116795, 0, 0.1843137, 1, 1,
0.4040567, -1.439851, 2.785163, 0, 0.1764706, 1, 1,
0.4082408, 0.7987878, 1.039151, 0, 0.172549, 1, 1,
0.4088124, -0.5941035, 2.665801, 0, 0.1647059, 1, 1,
0.4117327, 1.270942, -0.7220721, 0, 0.1607843, 1, 1,
0.4120558, -0.4725572, 1.741049, 0, 0.1529412, 1, 1,
0.4127876, 0.02362372, 0.5812833, 0, 0.1490196, 1, 1,
0.4132333, -0.997766, 2.544459, 0, 0.1411765, 1, 1,
0.4152307, 1.548918, 0.9421564, 0, 0.1372549, 1, 1,
0.416278, -2.741773, 5.185444, 0, 0.1294118, 1, 1,
0.4180995, -0.4711372, 1.784401, 0, 0.1254902, 1, 1,
0.4183891, 0.08122817, 1.775789, 0, 0.1176471, 1, 1,
0.4203679, 0.789413, 2.541323, 0, 0.1137255, 1, 1,
0.4216126, -1.468705, 3.968535, 0, 0.1058824, 1, 1,
0.4242733, -0.431774, 2.110526, 0, 0.09803922, 1, 1,
0.4298052, 0.841854, -0.1126373, 0, 0.09411765, 1, 1,
0.4315611, -0.09913709, 2.399917, 0, 0.08627451, 1, 1,
0.4320033, 1.061935, -0.9884838, 0, 0.08235294, 1, 1,
0.4392959, 1.143924, 2.713834, 0, 0.07450981, 1, 1,
0.4406942, -0.5073994, 1.004884, 0, 0.07058824, 1, 1,
0.4432811, 0.7246864, 1.47653, 0, 0.0627451, 1, 1,
0.4440897, -1.329455, 4.532135, 0, 0.05882353, 1, 1,
0.4468269, -0.5788876, 2.538708, 0, 0.05098039, 1, 1,
0.4523229, -0.3506756, 1.369039, 0, 0.04705882, 1, 1,
0.4624109, 0.1462318, 1.390619, 0, 0.03921569, 1, 1,
0.4660057, -0.3606875, 1.826349, 0, 0.03529412, 1, 1,
0.4690073, 1.893704, -0.1882212, 0, 0.02745098, 1, 1,
0.4701181, 1.612857, 0.978476, 0, 0.02352941, 1, 1,
0.4813518, 0.4352214, 2.456405, 0, 0.01568628, 1, 1,
0.4824871, -0.2335548, 2.047146, 0, 0.01176471, 1, 1,
0.4839621, -1.103055, 2.573953, 0, 0.003921569, 1, 1,
0.4850747, -0.03368055, 2.365771, 0.003921569, 0, 1, 1,
0.4872001, 0.8696933, 1.017964, 0.007843138, 0, 1, 1,
0.4904781, 0.5486992, 1.209946, 0.01568628, 0, 1, 1,
0.493313, -0.3013938, 3.250943, 0.01960784, 0, 1, 1,
0.498229, 0.03904252, 0.7668707, 0.02745098, 0, 1, 1,
0.5034518, 1.610034, -0.1043308, 0.03137255, 0, 1, 1,
0.5051728, 3.075016, -0.2528043, 0.03921569, 0, 1, 1,
0.5064942, 2.489449, 0.3627373, 0.04313726, 0, 1, 1,
0.5078394, -0.4161467, 2.733503, 0.05098039, 0, 1, 1,
0.5135658, 0.6927958, 0.1598659, 0.05490196, 0, 1, 1,
0.5161036, -2.276578, 3.170435, 0.0627451, 0, 1, 1,
0.5200017, 0.4836062, 1.365185, 0.06666667, 0, 1, 1,
0.523164, 1.032119, 0.7540705, 0.07450981, 0, 1, 1,
0.5275427, -0.7238076, 3.384274, 0.07843138, 0, 1, 1,
0.529148, -1.628013, 2.798587, 0.08627451, 0, 1, 1,
0.5295628, -1.036432, 2.683581, 0.09019608, 0, 1, 1,
0.5299468, -1.174912, 2.49491, 0.09803922, 0, 1, 1,
0.5306056, -0.8780221, 3.05364, 0.1058824, 0, 1, 1,
0.5307564, 0.9564972, -1.175011, 0.1098039, 0, 1, 1,
0.5345075, -0.5240129, 3.141235, 0.1176471, 0, 1, 1,
0.5363075, 0.1391518, 1.829645, 0.1215686, 0, 1, 1,
0.5367709, -0.01326171, 0.2304167, 0.1294118, 0, 1, 1,
0.5370477, -0.5535986, 1.080074, 0.1333333, 0, 1, 1,
0.5398832, -1.300524, 1.408424, 0.1411765, 0, 1, 1,
0.5404751, 0.4259421, 0.7655272, 0.145098, 0, 1, 1,
0.5429541, 0.2020592, 0.348651, 0.1529412, 0, 1, 1,
0.5452585, -0.5260359, 1.759017, 0.1568628, 0, 1, 1,
0.5479413, 1.588346, 1.131486, 0.1647059, 0, 1, 1,
0.5487003, -1.123573, 3.799102, 0.1686275, 0, 1, 1,
0.5494798, 0.6048147, 1.304365, 0.1764706, 0, 1, 1,
0.5510719, 0.2810291, -0.260814, 0.1803922, 0, 1, 1,
0.5686457, 0.3568135, -1.911626, 0.1882353, 0, 1, 1,
0.5787163, 2.037733, 2.174748, 0.1921569, 0, 1, 1,
0.5848184, -0.1767623, 4.249475, 0.2, 0, 1, 1,
0.5851718, 0.3372, 2.031485, 0.2078431, 0, 1, 1,
0.5913559, 0.444863, -0.04706454, 0.2117647, 0, 1, 1,
0.5926798, 0.5635027, 1.00889, 0.2196078, 0, 1, 1,
0.5928913, 0.5680214, -0.1265319, 0.2235294, 0, 1, 1,
0.5932985, 2.442806, 0.4034285, 0.2313726, 0, 1, 1,
0.5962197, 0.6132987, 0.05951689, 0.2352941, 0, 1, 1,
0.5997515, -0.210002, 2.01069, 0.2431373, 0, 1, 1,
0.6006225, 1.560331, -0.5527133, 0.2470588, 0, 1, 1,
0.6032401, 0.6252246, 1.250923, 0.254902, 0, 1, 1,
0.6072679, -1.025378, 1.394605, 0.2588235, 0, 1, 1,
0.6111866, -1.020378, 2.88003, 0.2666667, 0, 1, 1,
0.6122625, 0.3271766, 1.675596, 0.2705882, 0, 1, 1,
0.6131503, -1.134496, 2.460487, 0.2784314, 0, 1, 1,
0.613878, 1.346274, -1.540574, 0.282353, 0, 1, 1,
0.6157941, -1.721752, 3.281559, 0.2901961, 0, 1, 1,
0.6190782, 0.8170478, -0.2770486, 0.2941177, 0, 1, 1,
0.6193364, 0.7276427, 0.2969094, 0.3019608, 0, 1, 1,
0.622725, 0.1169058, 2.972463, 0.3098039, 0, 1, 1,
0.6281058, 1.015773, 0.6707482, 0.3137255, 0, 1, 1,
0.6346517, 1.10177, -0.7587426, 0.3215686, 0, 1, 1,
0.6382746, -1.438615, 2.307848, 0.3254902, 0, 1, 1,
0.6388785, -1.625703, 2.366664, 0.3333333, 0, 1, 1,
0.6393331, 0.2026182, -1.421833, 0.3372549, 0, 1, 1,
0.6412644, 1.069202, -0.210116, 0.345098, 0, 1, 1,
0.6511209, 0.5727303, -0.1352242, 0.3490196, 0, 1, 1,
0.6527532, 0.7708052, 0.2425117, 0.3568628, 0, 1, 1,
0.6541334, 1.758721, 0.4003833, 0.3607843, 0, 1, 1,
0.6551793, -0.8107632, 1.887818, 0.3686275, 0, 1, 1,
0.6562884, -0.04219577, 1.986098, 0.372549, 0, 1, 1,
0.6584939, 0.8463221, 2.416495, 0.3803922, 0, 1, 1,
0.6595914, 0.4096821, -0.2041847, 0.3843137, 0, 1, 1,
0.6600167, 0.9175321, 2.357365, 0.3921569, 0, 1, 1,
0.6635174, 1.794999, 0.3221601, 0.3960784, 0, 1, 1,
0.6683955, -1.384728, 2.566145, 0.4039216, 0, 1, 1,
0.6689183, -0.3057232, 1.570639, 0.4117647, 0, 1, 1,
0.6707048, -0.007640601, 2.559911, 0.4156863, 0, 1, 1,
0.6822743, 1.283476, 1.972626, 0.4235294, 0, 1, 1,
0.6857335, -1.6865, 3.486368, 0.427451, 0, 1, 1,
0.6874138, -0.3530463, 2.187323, 0.4352941, 0, 1, 1,
0.6898943, -0.7810467, 3.97695, 0.4392157, 0, 1, 1,
0.6903967, -0.3821104, 2.798156, 0.4470588, 0, 1, 1,
0.7035299, 1.094504, 1.053715, 0.4509804, 0, 1, 1,
0.7072037, 0.9535789, -0.2908139, 0.4588235, 0, 1, 1,
0.7111888, 1.061073, 0.800604, 0.4627451, 0, 1, 1,
0.7146348, -0.1115356, 0.5030173, 0.4705882, 0, 1, 1,
0.7162511, 1.036414, 1.288649, 0.4745098, 0, 1, 1,
0.7163466, -0.06848228, 3.099663, 0.4823529, 0, 1, 1,
0.7218733, -0.05213381, 1.452697, 0.4862745, 0, 1, 1,
0.7266964, -0.7757739, 2.656579, 0.4941176, 0, 1, 1,
0.7289039, -0.2770181, 0.6263713, 0.5019608, 0, 1, 1,
0.7312149, 1.028839, 1.676944, 0.5058824, 0, 1, 1,
0.7328733, 0.6710413, 2.671229, 0.5137255, 0, 1, 1,
0.7334148, -0.2454024, 1.630254, 0.5176471, 0, 1, 1,
0.7412632, 0.4333751, 0.7113709, 0.5254902, 0, 1, 1,
0.7422923, -0.1759088, 1.49671, 0.5294118, 0, 1, 1,
0.7423339, 1.409504, 1.063539, 0.5372549, 0, 1, 1,
0.7457827, -2.201893, 3.299386, 0.5411765, 0, 1, 1,
0.7494195, -0.3581481, 2.185602, 0.5490196, 0, 1, 1,
0.7512845, -1.33171, 2.437785, 0.5529412, 0, 1, 1,
0.754346, 1.517615, 1.394746, 0.5607843, 0, 1, 1,
0.7546923, 1.76965, 0.7617804, 0.5647059, 0, 1, 1,
0.7555676, -1.969708, 4.150552, 0.572549, 0, 1, 1,
0.7585045, -1.597199, 1.735803, 0.5764706, 0, 1, 1,
0.7586861, -0.1084301, 0.4677417, 0.5843138, 0, 1, 1,
0.7626638, 2.337705, 0.5725979, 0.5882353, 0, 1, 1,
0.7675058, -1.047745, 2.228854, 0.5960785, 0, 1, 1,
0.7735417, 0.06605274, 2.793444, 0.6039216, 0, 1, 1,
0.7770151, -0.01517019, 1.842497, 0.6078432, 0, 1, 1,
0.7792695, 0.4071336, 0.7381195, 0.6156863, 0, 1, 1,
0.7812448, -0.7274131, 3.256721, 0.6196079, 0, 1, 1,
0.7987332, 1.269242, -0.4420182, 0.627451, 0, 1, 1,
0.8016145, 0.5271686, 0.7279614, 0.6313726, 0, 1, 1,
0.8038433, 0.196357, 0.14388, 0.6392157, 0, 1, 1,
0.8053005, -1.47282, 3.940005, 0.6431373, 0, 1, 1,
0.811434, 1.33647, -0.4714697, 0.6509804, 0, 1, 1,
0.8148067, -1.043815, 3.28901, 0.654902, 0, 1, 1,
0.8157237, 0.08900595, 1.17581, 0.6627451, 0, 1, 1,
0.821528, 0.2359255, 1.600687, 0.6666667, 0, 1, 1,
0.821773, -0.3758263, 2.484019, 0.6745098, 0, 1, 1,
0.8280355, 1.11327, -0.08983407, 0.6784314, 0, 1, 1,
0.8324097, -0.1998087, 3.245133, 0.6862745, 0, 1, 1,
0.8363595, 0.7396701, 1.867971, 0.6901961, 0, 1, 1,
0.8370284, -1.357244, 4.254879, 0.6980392, 0, 1, 1,
0.838295, 0.09843341, 1.800948, 0.7058824, 0, 1, 1,
0.8418127, 1.01186, 1.525661, 0.7098039, 0, 1, 1,
0.8438373, 0.2530732, -0.322459, 0.7176471, 0, 1, 1,
0.84507, -0.5658594, 1.593512, 0.7215686, 0, 1, 1,
0.8469903, -0.07363334, 1.498379, 0.7294118, 0, 1, 1,
0.8504801, 0.3830308, 0.07271095, 0.7333333, 0, 1, 1,
0.8543988, -0.04815178, -0.2862677, 0.7411765, 0, 1, 1,
0.8555528, -2.033757, 1.814202, 0.7450981, 0, 1, 1,
0.859596, 0.8750732, 0.7299514, 0.7529412, 0, 1, 1,
0.8599014, 2.200477, 0.4363655, 0.7568628, 0, 1, 1,
0.8721825, 0.06129957, 1.355799, 0.7647059, 0, 1, 1,
0.8767744, 0.9820566, 1.444274, 0.7686275, 0, 1, 1,
0.8817329, 1.37815, -0.661803, 0.7764706, 0, 1, 1,
0.8832977, 0.004545095, 2.91423, 0.7803922, 0, 1, 1,
0.8844586, 0.4618721, 0.6373063, 0.7882353, 0, 1, 1,
0.8864127, -1.577743, 2.075614, 0.7921569, 0, 1, 1,
0.8872816, -1.345286, 3.107621, 0.8, 0, 1, 1,
0.890187, -0.2118939, 2.513147, 0.8078431, 0, 1, 1,
0.8948016, 1.075542, -0.02734977, 0.8117647, 0, 1, 1,
0.8965484, 1.269994, -1.542582, 0.8196079, 0, 1, 1,
0.9054488, 0.2892104, 1.652533, 0.8235294, 0, 1, 1,
0.9164824, -1.001089, 2.236356, 0.8313726, 0, 1, 1,
0.9286965, -0.07885422, 2.771034, 0.8352941, 0, 1, 1,
0.930428, 0.5626993, 0.5145517, 0.8431373, 0, 1, 1,
0.9313022, 0.9501019, 1.754684, 0.8470588, 0, 1, 1,
0.932548, 0.2501068, 0.5259326, 0.854902, 0, 1, 1,
0.9366701, -0.5141932, 1.44063, 0.8588235, 0, 1, 1,
0.937002, -0.7385176, 1.829159, 0.8666667, 0, 1, 1,
0.9412125, 0.3478335, 0.1909875, 0.8705882, 0, 1, 1,
0.9418041, -0.1093361, 1.943362, 0.8784314, 0, 1, 1,
0.9464554, -0.02337653, 1.343644, 0.8823529, 0, 1, 1,
0.9547547, -1.611821, 2.022105, 0.8901961, 0, 1, 1,
0.9554986, -0.1937576, 0.3396436, 0.8941177, 0, 1, 1,
0.9568122, 1.857045, -0.2647169, 0.9019608, 0, 1, 1,
0.9647447, -0.9107003, 0.8876005, 0.9098039, 0, 1, 1,
0.9647735, 0.6438742, 1.444546, 0.9137255, 0, 1, 1,
0.9678161, -0.3026734, 3.499035, 0.9215686, 0, 1, 1,
0.9697246, 0.7615261, 1.023682, 0.9254902, 0, 1, 1,
0.9770842, -1.396652, 1.247008, 0.9333333, 0, 1, 1,
0.9909566, -1.070795, 1.729849, 0.9372549, 0, 1, 1,
0.9916597, -1.675743, 2.239881, 0.945098, 0, 1, 1,
0.9995843, -1.383172, 2.761716, 0.9490196, 0, 1, 1,
1.000654, 0.04523414, 0.6897727, 0.9568627, 0, 1, 1,
1.011561, -0.9840202, 2.001541, 0.9607843, 0, 1, 1,
1.021541, -1.227828, 3.416233, 0.9686275, 0, 1, 1,
1.025668, 0.6483763, 0.7044375, 0.972549, 0, 1, 1,
1.026621, 2.301546, 1.902405, 0.9803922, 0, 1, 1,
1.026947, 0.3033992, 1.412848, 0.9843137, 0, 1, 1,
1.028155, -0.3845969, 2.139534, 0.9921569, 0, 1, 1,
1.028789, 1.786963, 0.8146298, 0.9960784, 0, 1, 1,
1.034083, 0.601646, 3.138491, 1, 0, 0.9960784, 1,
1.038427, -0.6945148, 0.9363022, 1, 0, 0.9882353, 1,
1.04379, 0.364659, 0.1056581, 1, 0, 0.9843137, 1,
1.044771, -1.465001, 3.823931, 1, 0, 0.9764706, 1,
1.04515, 1.104895, 0.9125144, 1, 0, 0.972549, 1,
1.057426, 0.2642618, 0.5728197, 1, 0, 0.9647059, 1,
1.059984, 1.031945, -0.6441111, 1, 0, 0.9607843, 1,
1.063592, -0.176685, 0.9491792, 1, 0, 0.9529412, 1,
1.066903, -0.6648739, 2.360824, 1, 0, 0.9490196, 1,
1.067278, 0.3497508, 0.93491, 1, 0, 0.9411765, 1,
1.070538, 0.566077, -0.1713772, 1, 0, 0.9372549, 1,
1.075134, -1.709991, 2.29532, 1, 0, 0.9294118, 1,
1.075439, 0.09908874, 1.436543, 1, 0, 0.9254902, 1,
1.078252, 1.639305, 0.9137411, 1, 0, 0.9176471, 1,
1.079947, 0.520989, 0.6094153, 1, 0, 0.9137255, 1,
1.095408, 0.03259573, 1.188815, 1, 0, 0.9058824, 1,
1.098248, 0.5854412, 0.8582583, 1, 0, 0.9019608, 1,
1.109362, 0.1590689, 0.9514279, 1, 0, 0.8941177, 1,
1.112334, 0.6242079, 1.687775, 1, 0, 0.8862745, 1,
1.114225, 0.3128501, 1.018828, 1, 0, 0.8823529, 1,
1.114941, 0.4483501, 0.4706923, 1, 0, 0.8745098, 1,
1.118651, 0.2559569, 1.570529, 1, 0, 0.8705882, 1,
1.118816, -1.042162, 2.060434, 1, 0, 0.8627451, 1,
1.121815, 0.0804323, 0.225287, 1, 0, 0.8588235, 1,
1.128391, 0.4549993, 0.3596145, 1, 0, 0.8509804, 1,
1.128492, 0.2240731, 1.57331, 1, 0, 0.8470588, 1,
1.132261, -1.220699, 2.137851, 1, 0, 0.8392157, 1,
1.134778, 0.7703556, 1.413902, 1, 0, 0.8352941, 1,
1.1354, -0.9038985, 2.724951, 1, 0, 0.827451, 1,
1.141472, 0.1712294, 1.736338, 1, 0, 0.8235294, 1,
1.149472, -0.8877758, 0.5623829, 1, 0, 0.8156863, 1,
1.170253, 2.118406, 1.08297, 1, 0, 0.8117647, 1,
1.174229, -0.003640577, 1.318484, 1, 0, 0.8039216, 1,
1.177224, -0.00379053, 2.826301, 1, 0, 0.7960784, 1,
1.188565, -1.302704, 2.364488, 1, 0, 0.7921569, 1,
1.195361, -0.0767478, 1.192911, 1, 0, 0.7843137, 1,
1.201929, -0.8324486, 2.194681, 1, 0, 0.7803922, 1,
1.205117, 0.9945799, 1.30736, 1, 0, 0.772549, 1,
1.205752, -2.129026, 2.876989, 1, 0, 0.7686275, 1,
1.210951, 1.004201, -0.4299909, 1, 0, 0.7607843, 1,
1.218547, -0.8726746, 2.819671, 1, 0, 0.7568628, 1,
1.22717, 0.2249189, 0.3835249, 1, 0, 0.7490196, 1,
1.2281, -0.06625839, 1.764977, 1, 0, 0.7450981, 1,
1.234306, -0.459102, 1.957615, 1, 0, 0.7372549, 1,
1.248549, -0.3275579, 0.9802369, 1, 0, 0.7333333, 1,
1.251541, 0.3876353, 0.6488088, 1, 0, 0.7254902, 1,
1.252547, -0.595349, 0.784319, 1, 0, 0.7215686, 1,
1.254355, -1.960563, 2.429212, 1, 0, 0.7137255, 1,
1.263853, -0.2562653, -0.2247221, 1, 0, 0.7098039, 1,
1.267116, 3.509805, 1.084852, 1, 0, 0.7019608, 1,
1.270582, 0.2933846, 1.118437, 1, 0, 0.6941177, 1,
1.271367, 0.9958807, 1.638815, 1, 0, 0.6901961, 1,
1.271886, -0.9739025, 1.812177, 1, 0, 0.682353, 1,
1.280182, 0.5003724, 0.5705071, 1, 0, 0.6784314, 1,
1.281258, 1.591883, 0.1901, 1, 0, 0.6705883, 1,
1.281986, -1.039701, 0.0129548, 1, 0, 0.6666667, 1,
1.288752, 1.860047, -0.1640214, 1, 0, 0.6588235, 1,
1.28988, 0.3328679, 0.4857238, 1, 0, 0.654902, 1,
1.28999, 2.079581, 0.3796011, 1, 0, 0.6470588, 1,
1.304321, 0.5196794, 0.5871837, 1, 0, 0.6431373, 1,
1.308275, 0.7309821, 1.989552, 1, 0, 0.6352941, 1,
1.311818, -1.070484, 1.361922, 1, 0, 0.6313726, 1,
1.313453, -0.1353814, 4.06337, 1, 0, 0.6235294, 1,
1.315273, -1.586594, 3.538229, 1, 0, 0.6196079, 1,
1.320689, -0.488288, 2.221437, 1, 0, 0.6117647, 1,
1.322988, 1.037014, 0.4659864, 1, 0, 0.6078432, 1,
1.353346, -0.9157502, 3.496592, 1, 0, 0.6, 1,
1.357426, 0.886581, 1.200449, 1, 0, 0.5921569, 1,
1.372479, 0.713882, 0.2009612, 1, 0, 0.5882353, 1,
1.373639, -0.7030898, 2.118976, 1, 0, 0.5803922, 1,
1.382568, 0.3530253, 3.61207, 1, 0, 0.5764706, 1,
1.383606, 0.4010414, 1.514416, 1, 0, 0.5686275, 1,
1.391667, -1.124611, 2.783478, 1, 0, 0.5647059, 1,
1.398126, 1.060896, 1.038339, 1, 0, 0.5568628, 1,
1.420489, 1.238168, 1.680041, 1, 0, 0.5529412, 1,
1.421602, -0.2256407, 0.3854108, 1, 0, 0.5450981, 1,
1.438581, 0.832759, 0.7810653, 1, 0, 0.5411765, 1,
1.439824, 1.304126, 2.231643, 1, 0, 0.5333334, 1,
1.444699, 2.254197, -1.275698, 1, 0, 0.5294118, 1,
1.457686, 0.4060217, 3.107862, 1, 0, 0.5215687, 1,
1.461617, -1.467627, 2.234242, 1, 0, 0.5176471, 1,
1.475163, 0.1067194, 1.546808, 1, 0, 0.509804, 1,
1.488728, 0.8795408, 0.276223, 1, 0, 0.5058824, 1,
1.495593, -0.2082005, 2.787112, 1, 0, 0.4980392, 1,
1.497355, 0.01571821, 1.578152, 1, 0, 0.4901961, 1,
1.499162, -0.4023542, 1.12486, 1, 0, 0.4862745, 1,
1.512492, -0.6430246, 2.492016, 1, 0, 0.4784314, 1,
1.528535, -0.2626214, 2.550867, 1, 0, 0.4745098, 1,
1.530266, -0.762065, 4.089814, 1, 0, 0.4666667, 1,
1.533802, 0.01527947, 2.122932, 1, 0, 0.4627451, 1,
1.53989, -0.4487316, 0.8773085, 1, 0, 0.454902, 1,
1.54116, -0.1543483, 2.911781, 1, 0, 0.4509804, 1,
1.549249, 0.1493733, 1.57604, 1, 0, 0.4431373, 1,
1.549546, 1.545121, -0.04326161, 1, 0, 0.4392157, 1,
1.554053, 0.1159821, 1.498244, 1, 0, 0.4313726, 1,
1.576644, 1.707539, -0.6942688, 1, 0, 0.427451, 1,
1.58065, -0.04598627, 1.803934, 1, 0, 0.4196078, 1,
1.58131, 1.590928, 0.1778477, 1, 0, 0.4156863, 1,
1.591341, -0.03808317, 2.785764, 1, 0, 0.4078431, 1,
1.593405, -0.2437124, 0.8112398, 1, 0, 0.4039216, 1,
1.59351, 0.6669164, 1.754009, 1, 0, 0.3960784, 1,
1.605898, -1.022825, 2.293593, 1, 0, 0.3882353, 1,
1.60832, -0.7278239, 2.658252, 1, 0, 0.3843137, 1,
1.618329, 0.3883861, 0.1269585, 1, 0, 0.3764706, 1,
1.627534, -1.206819, 2.567009, 1, 0, 0.372549, 1,
1.629367, -0.493475, 3.079919, 1, 0, 0.3647059, 1,
1.63663, -0.8668244, 2.491223, 1, 0, 0.3607843, 1,
1.64154, 0.3696506, 1.815318, 1, 0, 0.3529412, 1,
1.64155, -0.7300586, 1.263198, 1, 0, 0.3490196, 1,
1.647954, -0.4635404, 2.040354, 1, 0, 0.3411765, 1,
1.684747, -1.718332, 2.441374, 1, 0, 0.3372549, 1,
1.687793, 0.6210569, 0.8379472, 1, 0, 0.3294118, 1,
1.692846, 0.2261387, 2.31835, 1, 0, 0.3254902, 1,
1.705747, 1.453574, -1.472514, 1, 0, 0.3176471, 1,
1.706701, -2.124055, 1.084534, 1, 0, 0.3137255, 1,
1.70676, 0.7022775, 1.294479, 1, 0, 0.3058824, 1,
1.709499, 0.1174796, 0.9565594, 1, 0, 0.2980392, 1,
1.711986, -1.42251, 1.252477, 1, 0, 0.2941177, 1,
1.721626, 0.6844365, 0.8089939, 1, 0, 0.2862745, 1,
1.725681, 0.414793, 0.2209675, 1, 0, 0.282353, 1,
1.749167, -0.2831321, 2.295355, 1, 0, 0.2745098, 1,
1.756934, 0.1686852, 1.700983, 1, 0, 0.2705882, 1,
1.779963, 0.8144897, 0.4459659, 1, 0, 0.2627451, 1,
1.781896, -0.6506743, 2.171653, 1, 0, 0.2588235, 1,
1.797052, -0.2969472, 3.85349, 1, 0, 0.2509804, 1,
1.811005, 0.5088595, 1.661678, 1, 0, 0.2470588, 1,
1.816008, -2.475678, 2.226752, 1, 0, 0.2392157, 1,
1.823534, -0.5421336, 1.616036, 1, 0, 0.2352941, 1,
1.83492, 0.4519455, 1.348079, 1, 0, 0.227451, 1,
1.845104, 0.6552301, 1.496706, 1, 0, 0.2235294, 1,
1.85598, -0.336308, 1.072491, 1, 0, 0.2156863, 1,
1.871605, 1.150882, 0.7073517, 1, 0, 0.2117647, 1,
1.884239, 1.081438, 1.513257, 1, 0, 0.2039216, 1,
1.893394, -1.801865, 2.712142, 1, 0, 0.1960784, 1,
1.895636, 0.6998319, 2.13917, 1, 0, 0.1921569, 1,
1.911992, 0.5323359, 2.222085, 1, 0, 0.1843137, 1,
1.916399, 0.2296721, 3.231963, 1, 0, 0.1803922, 1,
1.966466, -0.3711753, 1.132759, 1, 0, 0.172549, 1,
1.97773, -0.5169235, 0.8381668, 1, 0, 0.1686275, 1,
1.990571, -0.1516967, 1.443425, 1, 0, 0.1607843, 1,
2.001536, 0.2711859, 1.356248, 1, 0, 0.1568628, 1,
2.011757, -1.274598, 3.090383, 1, 0, 0.1490196, 1,
2.024715, 0.6731715, 1.941695, 1, 0, 0.145098, 1,
2.024925, 0.2151302, 0.6822661, 1, 0, 0.1372549, 1,
2.036652, 1.477738, 2.161954, 1, 0, 0.1333333, 1,
2.082938, 1.807677, 0.4273411, 1, 0, 0.1254902, 1,
2.08725, -0.9872285, 2.402328, 1, 0, 0.1215686, 1,
2.098104, -1.295068, 3.633574, 1, 0, 0.1137255, 1,
2.137235, 1.00528, 0.4261644, 1, 0, 0.1098039, 1,
2.145043, 1.559996, 0.7223264, 1, 0, 0.1019608, 1,
2.152002, -1.904171, 1.296928, 1, 0, 0.09411765, 1,
2.160504, 2.554088, 2.068276, 1, 0, 0.09019608, 1,
2.201436, 0.4531407, 0.9189777, 1, 0, 0.08235294, 1,
2.285411, -0.2220048, 0.6599398, 1, 0, 0.07843138, 1,
2.318572, -0.4697912, 3.043122, 1, 0, 0.07058824, 1,
2.325037, 0.5614077, 2.223017, 1, 0, 0.06666667, 1,
2.391004, 1.584496, 0.705842, 1, 0, 0.05882353, 1,
2.403407, -1.195121, 1.941975, 1, 0, 0.05490196, 1,
2.424451, -0.5219131, 0.4316296, 1, 0, 0.04705882, 1,
2.42857, -0.9564178, 2.710556, 1, 0, 0.04313726, 1,
2.571297, 0.06029407, 1.941355, 1, 0, 0.03529412, 1,
2.631439, 0.9110372, 0.5061534, 1, 0, 0.03137255, 1,
2.739176, -3.91229, 1.474569, 1, 0, 0.02352941, 1,
2.797909, 0.07610725, 2.36223, 1, 0, 0.01960784, 1,
2.893723, 0.05419951, 2.209365, 1, 0, 0.01176471, 1,
3.346064, -1.410966, 1.622816, 1, 0, 0.007843138, 1
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
0.277741, -5.170335, -7.219024, 0, -0.5, 0.5, 0.5,
0.277741, -5.170335, -7.219024, 1, -0.5, 0.5, 0.5,
0.277741, -5.170335, -7.219024, 1, 1.5, 0.5, 0.5,
0.277741, -5.170335, -7.219024, 0, 1.5, 0.5, 0.5
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
-3.830744, -0.2012422, -7.219024, 0, -0.5, 0.5, 0.5,
-3.830744, -0.2012422, -7.219024, 1, -0.5, 0.5, 0.5,
-3.830744, -0.2012422, -7.219024, 1, 1.5, 0.5, 0.5,
-3.830744, -0.2012422, -7.219024, 0, 1.5, 0.5, 0.5
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
-3.830744, -5.170335, -0.1178772, 0, -0.5, 0.5, 0.5,
-3.830744, -5.170335, -0.1178772, 1, -0.5, 0.5, 0.5,
-3.830744, -5.170335, -0.1178772, 1, 1.5, 0.5, 0.5,
-3.830744, -5.170335, -0.1178772, 0, 1.5, 0.5, 0.5
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
-2, -4.023621, -5.580298,
3, -4.023621, -5.580298,
-2, -4.023621, -5.580298,
-2, -4.21474, -5.853419,
-1, -4.023621, -5.580298,
-1, -4.21474, -5.853419,
0, -4.023621, -5.580298,
0, -4.21474, -5.853419,
1, -4.023621, -5.580298,
1, -4.21474, -5.853419,
2, -4.023621, -5.580298,
2, -4.21474, -5.853419,
3, -4.023621, -5.580298,
3, -4.21474, -5.853419
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
-2, -4.596978, -6.399661, 0, -0.5, 0.5, 0.5,
-2, -4.596978, -6.399661, 1, -0.5, 0.5, 0.5,
-2, -4.596978, -6.399661, 1, 1.5, 0.5, 0.5,
-2, -4.596978, -6.399661, 0, 1.5, 0.5, 0.5,
-1, -4.596978, -6.399661, 0, -0.5, 0.5, 0.5,
-1, -4.596978, -6.399661, 1, -0.5, 0.5, 0.5,
-1, -4.596978, -6.399661, 1, 1.5, 0.5, 0.5,
-1, -4.596978, -6.399661, 0, 1.5, 0.5, 0.5,
0, -4.596978, -6.399661, 0, -0.5, 0.5, 0.5,
0, -4.596978, -6.399661, 1, -0.5, 0.5, 0.5,
0, -4.596978, -6.399661, 1, 1.5, 0.5, 0.5,
0, -4.596978, -6.399661, 0, 1.5, 0.5, 0.5,
1, -4.596978, -6.399661, 0, -0.5, 0.5, 0.5,
1, -4.596978, -6.399661, 1, -0.5, 0.5, 0.5,
1, -4.596978, -6.399661, 1, 1.5, 0.5, 0.5,
1, -4.596978, -6.399661, 0, 1.5, 0.5, 0.5,
2, -4.596978, -6.399661, 0, -0.5, 0.5, 0.5,
2, -4.596978, -6.399661, 1, -0.5, 0.5, 0.5,
2, -4.596978, -6.399661, 1, 1.5, 0.5, 0.5,
2, -4.596978, -6.399661, 0, 1.5, 0.5, 0.5,
3, -4.596978, -6.399661, 0, -0.5, 0.5, 0.5,
3, -4.596978, -6.399661, 1, -0.5, 0.5, 0.5,
3, -4.596978, -6.399661, 1, 1.5, 0.5, 0.5,
3, -4.596978, -6.399661, 0, 1.5, 0.5, 0.5
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
-2.882632, -2, -5.580298,
-2.882632, 2, -5.580298,
-2.882632, -2, -5.580298,
-3.040651, -2, -5.853419,
-2.882632, 0, -5.580298,
-3.040651, 0, -5.853419,
-2.882632, 2, -5.580298,
-3.040651, 2, -5.853419
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
"0",
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
-3.356688, -2, -6.399661, 0, -0.5, 0.5, 0.5,
-3.356688, -2, -6.399661, 1, -0.5, 0.5, 0.5,
-3.356688, -2, -6.399661, 1, 1.5, 0.5, 0.5,
-3.356688, -2, -6.399661, 0, 1.5, 0.5, 0.5,
-3.356688, 0, -6.399661, 0, -0.5, 0.5, 0.5,
-3.356688, 0, -6.399661, 1, -0.5, 0.5, 0.5,
-3.356688, 0, -6.399661, 1, 1.5, 0.5, 0.5,
-3.356688, 0, -6.399661, 0, 1.5, 0.5, 0.5,
-3.356688, 2, -6.399661, 0, -0.5, 0.5, 0.5,
-3.356688, 2, -6.399661, 1, -0.5, 0.5, 0.5,
-3.356688, 2, -6.399661, 1, 1.5, 0.5, 0.5,
-3.356688, 2, -6.399661, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-2.882632, -4.023621, -4,
-2.882632, -4.023621, 4,
-2.882632, -4.023621, -4,
-3.040651, -4.21474, -4,
-2.882632, -4.023621, -2,
-3.040651, -4.21474, -2,
-2.882632, -4.023621, 0,
-3.040651, -4.21474, 0,
-2.882632, -4.023621, 2,
-3.040651, -4.21474, 2,
-2.882632, -4.023621, 4,
-3.040651, -4.21474, 4
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
-3.356688, -4.596978, -4, 0, -0.5, 0.5, 0.5,
-3.356688, -4.596978, -4, 1, -0.5, 0.5, 0.5,
-3.356688, -4.596978, -4, 1, 1.5, 0.5, 0.5,
-3.356688, -4.596978, -4, 0, 1.5, 0.5, 0.5,
-3.356688, -4.596978, -2, 0, -0.5, 0.5, 0.5,
-3.356688, -4.596978, -2, 1, -0.5, 0.5, 0.5,
-3.356688, -4.596978, -2, 1, 1.5, 0.5, 0.5,
-3.356688, -4.596978, -2, 0, 1.5, 0.5, 0.5,
-3.356688, -4.596978, 0, 0, -0.5, 0.5, 0.5,
-3.356688, -4.596978, 0, 1, -0.5, 0.5, 0.5,
-3.356688, -4.596978, 0, 1, 1.5, 0.5, 0.5,
-3.356688, -4.596978, 0, 0, 1.5, 0.5, 0.5,
-3.356688, -4.596978, 2, 0, -0.5, 0.5, 0.5,
-3.356688, -4.596978, 2, 1, -0.5, 0.5, 0.5,
-3.356688, -4.596978, 2, 1, 1.5, 0.5, 0.5,
-3.356688, -4.596978, 2, 0, 1.5, 0.5, 0.5,
-3.356688, -4.596978, 4, 0, -0.5, 0.5, 0.5,
-3.356688, -4.596978, 4, 1, -0.5, 0.5, 0.5,
-3.356688, -4.596978, 4, 1, 1.5, 0.5, 0.5,
-3.356688, -4.596978, 4, 0, 1.5, 0.5, 0.5
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
-2.882632, -4.023621, -5.580298,
-2.882632, 3.621137, -5.580298,
-2.882632, -4.023621, 5.344543,
-2.882632, 3.621137, 5.344543,
-2.882632, -4.023621, -5.580298,
-2.882632, -4.023621, 5.344543,
-2.882632, 3.621137, -5.580298,
-2.882632, 3.621137, 5.344543,
-2.882632, -4.023621, -5.580298,
3.438114, -4.023621, -5.580298,
-2.882632, -4.023621, 5.344543,
3.438114, -4.023621, 5.344543,
-2.882632, 3.621137, -5.580298,
3.438114, 3.621137, -5.580298,
-2.882632, 3.621137, 5.344543,
3.438114, 3.621137, 5.344543,
3.438114, -4.023621, -5.580298,
3.438114, 3.621137, -5.580298,
3.438114, -4.023621, 5.344543,
3.438114, 3.621137, 5.344543,
3.438114, -4.023621, -5.580298,
3.438114, -4.023621, 5.344543,
3.438114, 3.621137, -5.580298,
3.438114, 3.621137, 5.344543
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
var radius = 7.87954;
var distance = 35.05696;
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
mvMatrix.translate( -0.277741, 0.2012422, 0.1178772 );
mvMatrix.scale( 1.347865, 1.114425, 0.7798294 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.05696);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
chromafenozide<-read.table("chromafenozide.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-chromafenozide$V2
```

```
## Error in eval(expr, envir, enclos): object 'chromafenozide' not found
```

```r
y<-chromafenozide$V3
```

```
## Error in eval(expr, envir, enclos): object 'chromafenozide' not found
```

```r
z<-chromafenozide$V4
```

```
## Error in eval(expr, envir, enclos): object 'chromafenozide' not found
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
-2.790582, 0.1981995, -1.297733, 0, 0, 1, 1, 1,
-2.731217, -1.073851, -2.988448, 1, 0, 0, 1, 1,
-2.583203, 1.206855, -1.622536, 1, 0, 0, 1, 1,
-2.511487, 1.930139, -0.7776213, 1, 0, 0, 1, 1,
-2.455628, -0.261822, -2.800671, 1, 0, 0, 1, 1,
-2.44183, -0.3689681, -1.275089, 1, 0, 0, 1, 1,
-2.42745, 1.024872, -2.292259, 0, 0, 0, 1, 1,
-2.385349, -0.1822499, -1.147137, 0, 0, 0, 1, 1,
-2.356078, -0.1897759, -1.029037, 0, 0, 0, 1, 1,
-2.133608, 1.425587, -0.6596646, 0, 0, 0, 1, 1,
-2.118393, -1.07324, -0.1958533, 0, 0, 0, 1, 1,
-2.109751, 1.037623, -2.0273, 0, 0, 0, 1, 1,
-2.049392, -0.01195773, -2.083571, 0, 0, 0, 1, 1,
-2.040383, -2.501161, -3.959777, 1, 1, 1, 1, 1,
-2.039117, -0.1107179, -1.37051, 1, 1, 1, 1, 1,
-2.02958, -0.3796372, -2.24932, 1, 1, 1, 1, 1,
-2.014937, -0.4078603, -0.7636213, 1, 1, 1, 1, 1,
-1.974093, -0.6989781, -3.943886, 1, 1, 1, 1, 1,
-1.960576, 1.793684, -0.2190403, 1, 1, 1, 1, 1,
-1.915955, 0.8763582, -2.136412, 1, 1, 1, 1, 1,
-1.894192, -0.08044131, -1.147239, 1, 1, 1, 1, 1,
-1.885078, 0.8969203, -1.105562, 1, 1, 1, 1, 1,
-1.809915, 2.049182, -0.8769832, 1, 1, 1, 1, 1,
-1.797651, -1.466241, -1.568229, 1, 1, 1, 1, 1,
-1.781396, 0.06318172, -1.320538, 1, 1, 1, 1, 1,
-1.773256, 0.04105081, -0.5510712, 1, 1, 1, 1, 1,
-1.767813, -0.02292616, -0.4349394, 1, 1, 1, 1, 1,
-1.764303, 1.160199, -2.25896, 1, 1, 1, 1, 1,
-1.7462, 1.17426, -0.4692784, 0, 0, 1, 1, 1,
-1.731403, 0.6095943, -2.023184, 1, 0, 0, 1, 1,
-1.726353, -0.9385611, -1.828907, 1, 0, 0, 1, 1,
-1.71651, 0.534784, -1.684923, 1, 0, 0, 1, 1,
-1.68301, -1.496694, -2.830012, 1, 0, 0, 1, 1,
-1.681529, 1.284491, -0.8021833, 1, 0, 0, 1, 1,
-1.67469, 0.6611774, -1.367803, 0, 0, 0, 1, 1,
-1.657865, 0.03496605, -0.1612597, 0, 0, 0, 1, 1,
-1.656259, 0.4591869, -1.215594, 0, 0, 0, 1, 1,
-1.655315, -0.8396249, -2.709516, 0, 0, 0, 1, 1,
-1.651844, -1.140847, -3.044725, 0, 0, 0, 1, 1,
-1.651315, 1.603837, -0.986794, 0, 0, 0, 1, 1,
-1.647488, -0.9022105, -2.178788, 0, 0, 0, 1, 1,
-1.646599, -1.504439, -2.050806, 1, 1, 1, 1, 1,
-1.646223, -0.4822276, -1.791933, 1, 1, 1, 1, 1,
-1.639889, -0.4414082, -2.593177, 1, 1, 1, 1, 1,
-1.621802, -1.161529, -2.12902, 1, 1, 1, 1, 1,
-1.616421, 0.545701, 0.1324404, 1, 1, 1, 1, 1,
-1.61414, 1.631454, -1.559909, 1, 1, 1, 1, 1,
-1.606122, 0.5523366, -1.481957, 1, 1, 1, 1, 1,
-1.597676, -1.448531, -1.729944, 1, 1, 1, 1, 1,
-1.595792, 0.8176273, -1.255408, 1, 1, 1, 1, 1,
-1.591894, 1.544016, -1.613169, 1, 1, 1, 1, 1,
-1.582048, -0.4700609, -0.1021346, 1, 1, 1, 1, 1,
-1.56953, 0.3275558, -2.276284, 1, 1, 1, 1, 1,
-1.555554, 0.4286465, -3.786034, 1, 1, 1, 1, 1,
-1.534577, -0.0569658, -1.493459, 1, 1, 1, 1, 1,
-1.524974, -0.9135344, -0.8207299, 1, 1, 1, 1, 1,
-1.524621, 1.534065, -0.6734974, 0, 0, 1, 1, 1,
-1.522029, -2.507646, -2.137884, 1, 0, 0, 1, 1,
-1.518386, 1.887646, 1.288087, 1, 0, 0, 1, 1,
-1.507081, 0.1620772, -1.93233, 1, 0, 0, 1, 1,
-1.503911, 0.4555542, -1.134911, 1, 0, 0, 1, 1,
-1.502655, -0.6872734, -2.785329, 1, 0, 0, 1, 1,
-1.500374, 0.6179001, 0.7233819, 0, 0, 0, 1, 1,
-1.476573, -1.159903, -2.143949, 0, 0, 0, 1, 1,
-1.449496, -0.4841658, -1.116749, 0, 0, 0, 1, 1,
-1.440136, 0.7376713, -2.047043, 0, 0, 0, 1, 1,
-1.436542, -0.4006564, -0.6765211, 0, 0, 0, 1, 1,
-1.434783, 0.517192, -1.822942, 0, 0, 0, 1, 1,
-1.433374, -0.1807989, -1.626377, 0, 0, 0, 1, 1,
-1.427772, 1.858364, -0.3962385, 1, 1, 1, 1, 1,
-1.422308, -0.6210742, -2.485952, 1, 1, 1, 1, 1,
-1.396361, 0.4676425, -0.8874109, 1, 1, 1, 1, 1,
-1.387209, 1.160141, -0.4844622, 1, 1, 1, 1, 1,
-1.384916, 0.8366022, -1.539637, 1, 1, 1, 1, 1,
-1.383994, 1.348726, -0.5141278, 1, 1, 1, 1, 1,
-1.360432, -0.9799492, -3.453305, 1, 1, 1, 1, 1,
-1.349944, -0.3945918, 0.1403805, 1, 1, 1, 1, 1,
-1.340786, -1.251655, -1.975274, 1, 1, 1, 1, 1,
-1.34076, -0.07017998, -1.523462, 1, 1, 1, 1, 1,
-1.3393, -0.9548257, -3.835209, 1, 1, 1, 1, 1,
-1.337406, -0.02284365, -1.299704, 1, 1, 1, 1, 1,
-1.335779, 0.08100727, -2.022974, 1, 1, 1, 1, 1,
-1.315771, 1.60847, -0.1605044, 1, 1, 1, 1, 1,
-1.306228, 1.252454, -1.415243, 1, 1, 1, 1, 1,
-1.302091, -0.07842425, -0.8383164, 0, 0, 1, 1, 1,
-1.298444, 0.822135, -1.132152, 1, 0, 0, 1, 1,
-1.295804, -0.07143013, -3.875664, 1, 0, 0, 1, 1,
-1.295732, 0.4781533, -0.2959479, 1, 0, 0, 1, 1,
-1.291198, -0.7455282, -1.802221, 1, 0, 0, 1, 1,
-1.282835, -0.5076392, -1.291867, 1, 0, 0, 1, 1,
-1.275098, 1.045559, -1.795889, 0, 0, 0, 1, 1,
-1.261317, 1.117217, -1.574156, 0, 0, 0, 1, 1,
-1.243436, 0.6123276, 0.2505073, 0, 0, 0, 1, 1,
-1.236913, 0.8999397, 0.4441736, 0, 0, 0, 1, 1,
-1.226376, -0.02470242, -2.436889, 0, 0, 0, 1, 1,
-1.201172, 2.609107, -0.7069603, 0, 0, 0, 1, 1,
-1.200784, -0.6837738, -3.03731, 0, 0, 0, 1, 1,
-1.197839, -0.498215, -2.278063, 1, 1, 1, 1, 1,
-1.194573, -0.1659076, -2.805555, 1, 1, 1, 1, 1,
-1.194034, -0.7411532, -2.460718, 1, 1, 1, 1, 1,
-1.179344, -1.44182, -1.527254, 1, 1, 1, 1, 1,
-1.172875, -0.6569498, -3.281433, 1, 1, 1, 1, 1,
-1.169984, 0.8714211, -0.422662, 1, 1, 1, 1, 1,
-1.166484, 1.08963, -1.405101, 1, 1, 1, 1, 1,
-1.161757, 0.3586414, 0.4989755, 1, 1, 1, 1, 1,
-1.160935, 0.6803926, -1.391648, 1, 1, 1, 1, 1,
-1.158448, -1.421129, -1.091095, 1, 1, 1, 1, 1,
-1.156003, -0.9646104, -2.597828, 1, 1, 1, 1, 1,
-1.155797, -0.4530047, -2.814784, 1, 1, 1, 1, 1,
-1.155788, -1.180792, -1.18398, 1, 1, 1, 1, 1,
-1.146226, 0.5768768, -1.369058, 1, 1, 1, 1, 1,
-1.145298, 0.606847, -2.094702, 1, 1, 1, 1, 1,
-1.14312, 1.412751, 0.5011889, 0, 0, 1, 1, 1,
-1.140004, 1.124832, -1.440578, 1, 0, 0, 1, 1,
-1.132906, 0.6755017, -1.226926, 1, 0, 0, 1, 1,
-1.129461, -0.1553791, -1.036807, 1, 0, 0, 1, 1,
-1.109347, 0.09509213, -1.73036, 1, 0, 0, 1, 1,
-1.103354, -0.1135758, -2.497479, 1, 0, 0, 1, 1,
-1.103141, 1.08178, 1.421508, 0, 0, 0, 1, 1,
-1.099531, 0.6455441, -1.734462, 0, 0, 0, 1, 1,
-1.087949, -1.703406, -3.656709, 0, 0, 0, 1, 1,
-1.084665, -0.1541056, -2.765435, 0, 0, 0, 1, 1,
-1.08368, 0.6942367, -0.3062737, 0, 0, 0, 1, 1,
-1.072387, 0.4985876, -4.001349, 0, 0, 0, 1, 1,
-1.070392, 0.1805708, -0.6932161, 0, 0, 0, 1, 1,
-1.069021, -0.8585149, -1.870149, 1, 1, 1, 1, 1,
-1.068858, -0.3402472, -2.329279, 1, 1, 1, 1, 1,
-1.066551, 0.2760322, -0.8641784, 1, 1, 1, 1, 1,
-1.061794, 0.6032943, -1.996233, 1, 1, 1, 1, 1,
-1.058377, 0.6189301, -1.071353, 1, 1, 1, 1, 1,
-1.04809, 1.592376, -2.037008, 1, 1, 1, 1, 1,
-1.047028, -0.05865276, -2.2716, 1, 1, 1, 1, 1,
-1.040799, -1.018559, -1.716329, 1, 1, 1, 1, 1,
-1.032639, 1.138305, -0.3304247, 1, 1, 1, 1, 1,
-1.03236, -1.107792, -0.9146718, 1, 1, 1, 1, 1,
-1.029456, -1.450177, -1.522852, 1, 1, 1, 1, 1,
-1.024249, 0.3785199, -0.5634809, 1, 1, 1, 1, 1,
-1.022647, 0.01564575, -2.032307, 1, 1, 1, 1, 1,
-1.006463, -1.910174, -1.572534, 1, 1, 1, 1, 1,
-1.005047, -0.1359643, -1.174837, 1, 1, 1, 1, 1,
-1.002958, -1.769177, -2.126741, 0, 0, 1, 1, 1,
-1.000131, -0.7937095, -2.613921, 1, 0, 0, 1, 1,
-0.999647, 0.1398125, -2.179021, 1, 0, 0, 1, 1,
-0.9947311, 0.5192521, -1.986173, 1, 0, 0, 1, 1,
-0.9887951, 0.3260931, -1.343965, 1, 0, 0, 1, 1,
-0.9845967, 0.9097493, -0.763152, 1, 0, 0, 1, 1,
-0.9819539, -0.3843309, -3.047441, 0, 0, 0, 1, 1,
-0.9713599, -0.5604826, -1.072832, 0, 0, 0, 1, 1,
-0.9707985, -0.6734898, -1.580213, 0, 0, 0, 1, 1,
-0.9570641, -0.5477048, -3.800481, 0, 0, 0, 1, 1,
-0.9315016, 0.6157622, 0.03938109, 0, 0, 0, 1, 1,
-0.9268178, 0.328034, -0.751504, 0, 0, 0, 1, 1,
-0.9257993, -0.02680518, -1.739243, 0, 0, 0, 1, 1,
-0.9257488, 0.8863627, -0.8218952, 1, 1, 1, 1, 1,
-0.921634, -1.244948, -2.353121, 1, 1, 1, 1, 1,
-0.9103085, 1.400084, 1.675781, 1, 1, 1, 1, 1,
-0.9090542, 1.069026, -2.697021, 1, 1, 1, 1, 1,
-0.8949476, 1.219108, -0.3736776, 1, 1, 1, 1, 1,
-0.8934836, 0.1664597, -1.225677, 1, 1, 1, 1, 1,
-0.8906071, -2.051714, -2.649361, 1, 1, 1, 1, 1,
-0.8893133, 0.666932, 0.08941205, 1, 1, 1, 1, 1,
-0.8884521, 0.3448951, -1.16845, 1, 1, 1, 1, 1,
-0.8828505, 0.9282225, -1.412897, 1, 1, 1, 1, 1,
-0.8805755, -1.698631, -3.418754, 1, 1, 1, 1, 1,
-0.8770239, 0.3216417, -0.1487195, 1, 1, 1, 1, 1,
-0.8753761, -0.3882602, -1.516484, 1, 1, 1, 1, 1,
-0.8727787, -0.9396605, -3.071851, 1, 1, 1, 1, 1,
-0.8713105, -0.2339383, -3.032727, 1, 1, 1, 1, 1,
-0.87026, -0.3572342, -2.104982, 0, 0, 1, 1, 1,
-0.866663, 0.9815553, -0.6584733, 1, 0, 0, 1, 1,
-0.8611313, 0.8535645, 0.5746107, 1, 0, 0, 1, 1,
-0.8597544, 1.057084, -0.4234443, 1, 0, 0, 1, 1,
-0.8580451, 0.6514595, -1.071605, 1, 0, 0, 1, 1,
-0.8557662, 0.34073, -2.844484, 1, 0, 0, 1, 1,
-0.8538947, -1.049801, -1.244515, 0, 0, 0, 1, 1,
-0.8536165, -1.846292, -1.858781, 0, 0, 0, 1, 1,
-0.8490577, 0.4422854, -2.022755, 0, 0, 0, 1, 1,
-0.8466547, -1.334643, -2.082997, 0, 0, 0, 1, 1,
-0.8455978, -0.7624699, -3.364096, 0, 0, 0, 1, 1,
-0.841527, -0.3490971, -3.152695, 0, 0, 0, 1, 1,
-0.8374009, -0.119292, -2.15456, 0, 0, 0, 1, 1,
-0.8303994, 1.057721, -1.079206, 1, 1, 1, 1, 1,
-0.8225648, -1.278201, -1.935382, 1, 1, 1, 1, 1,
-0.8218455, -0.2760727, -1.137976, 1, 1, 1, 1, 1,
-0.8189904, 1.446178, 0.9441059, 1, 1, 1, 1, 1,
-0.8144974, 2.173825, -0.9165128, 1, 1, 1, 1, 1,
-0.810596, 0.2785501, -2.432696, 1, 1, 1, 1, 1,
-0.8094957, -1.701998, -3.172093, 1, 1, 1, 1, 1,
-0.8023193, 0.1363159, -0.7472301, 1, 1, 1, 1, 1,
-0.8022478, -0.2324648, -2.209905, 1, 1, 1, 1, 1,
-0.7995845, 1.910296, -0.7315663, 1, 1, 1, 1, 1,
-0.7981574, -1.394479, -1.769011, 1, 1, 1, 1, 1,
-0.7969083, -0.5913626, -2.48346, 1, 1, 1, 1, 1,
-0.7953091, 0.7722634, 0.8590457, 1, 1, 1, 1, 1,
-0.7949576, -0.4876894, -1.784989, 1, 1, 1, 1, 1,
-0.7895856, -1.817919, -1.7266, 1, 1, 1, 1, 1,
-0.7892938, 0.1084398, -1.997583, 0, 0, 1, 1, 1,
-0.7873316, -0.3321626, -2.07662, 1, 0, 0, 1, 1,
-0.78605, -1.574553, -1.832178, 1, 0, 0, 1, 1,
-0.7838879, -0.3408926, -0.6264145, 1, 0, 0, 1, 1,
-0.7809819, -0.5609021, -0.9282485, 1, 0, 0, 1, 1,
-0.7773406, 0.7138276, -2.763067, 1, 0, 0, 1, 1,
-0.7772135, 0.8342237, -1.460621, 0, 0, 0, 1, 1,
-0.7681424, 0.8824688, -1.82167, 0, 0, 0, 1, 1,
-0.7667875, -1.576345, -1.531474, 0, 0, 0, 1, 1,
-0.7656115, 0.718087, -0.9055178, 0, 0, 0, 1, 1,
-0.7644145, 0.3397383, -1.432686, 0, 0, 0, 1, 1,
-0.7614015, -0.5515958, -1.726982, 0, 0, 0, 1, 1,
-0.7572829, 0.4324079, -0.8282751, 0, 0, 0, 1, 1,
-0.7565193, -1.427783, -2.490728, 1, 1, 1, 1, 1,
-0.7419622, 1.053995, -0.6915779, 1, 1, 1, 1, 1,
-0.7381176, 1.303214, -3.148616, 1, 1, 1, 1, 1,
-0.7379732, -2.957553, -2.232784, 1, 1, 1, 1, 1,
-0.7368373, 1.202741, -0.4159282, 1, 1, 1, 1, 1,
-0.7343649, -1.777041, -2.054591, 1, 1, 1, 1, 1,
-0.7329552, 1.151352, -1.966794, 1, 1, 1, 1, 1,
-0.7298273, -0.2966278, -0.62052, 1, 1, 1, 1, 1,
-0.7225014, 0.1966742, -1.344756, 1, 1, 1, 1, 1,
-0.7189732, 2.47693, -1.882628, 1, 1, 1, 1, 1,
-0.7171976, 0.9316467, -0.7216012, 1, 1, 1, 1, 1,
-0.716522, -1.224231, -4.308768, 1, 1, 1, 1, 1,
-0.7160139, 0.1809648, -2.46495, 1, 1, 1, 1, 1,
-0.7130784, -1.925191, -2.454195, 1, 1, 1, 1, 1,
-0.7124633, 0.3887022, -0.9030415, 1, 1, 1, 1, 1,
-0.7106136, 0.4230655, -3.007528, 0, 0, 1, 1, 1,
-0.7071069, -0.4687817, -1.399867, 1, 0, 0, 1, 1,
-0.7068821, -0.2523521, -1.873026, 1, 0, 0, 1, 1,
-0.7024524, -0.6889417, -3.920292, 1, 0, 0, 1, 1,
-0.7013581, 0.3365107, -2.116841, 1, 0, 0, 1, 1,
-0.6981077, 0.6137087, 0.9383187, 1, 0, 0, 1, 1,
-0.6843165, 0.8908474, -1.72762, 0, 0, 0, 1, 1,
-0.6824318, 0.1301448, -2.584262, 0, 0, 0, 1, 1,
-0.6804432, 0.2427941, -0.1599312, 0, 0, 0, 1, 1,
-0.6777924, 0.5197238, 1.330622, 0, 0, 0, 1, 1,
-0.6731371, 1.293115, 0.03332901, 0, 0, 0, 1, 1,
-0.6720765, -0.8144625, -1.926535, 0, 0, 0, 1, 1,
-0.6672199, 1.786001, -1.397101, 0, 0, 0, 1, 1,
-0.6623277, -0.1423136, -1.028621, 1, 1, 1, 1, 1,
-0.6606588, -0.7795861, -2.556627, 1, 1, 1, 1, 1,
-0.6586739, -0.6000054, -1.342631, 1, 1, 1, 1, 1,
-0.6559336, -1.547335, -3.174583, 1, 1, 1, 1, 1,
-0.6544268, -0.9748563, -1.801252, 1, 1, 1, 1, 1,
-0.6428786, 0.7284185, 0.001957347, 1, 1, 1, 1, 1,
-0.6406591, -1.503349, -2.004112, 1, 1, 1, 1, 1,
-0.6334564, -0.4066823, -0.744808, 1, 1, 1, 1, 1,
-0.6301305, -0.5563718, -2.832986, 1, 1, 1, 1, 1,
-0.630004, 0.5449603, 0.0005537221, 1, 1, 1, 1, 1,
-0.6288048, -2.342587, -3.539265, 1, 1, 1, 1, 1,
-0.6271219, -0.0170534, -0.6575409, 1, 1, 1, 1, 1,
-0.6254877, -1.228982, -0.3072434, 1, 1, 1, 1, 1,
-0.6237867, -0.1492691, -2.70213, 1, 1, 1, 1, 1,
-0.6226518, 0.5257773, -1.686381, 1, 1, 1, 1, 1,
-0.6196252, -1.267325, -3.173942, 0, 0, 1, 1, 1,
-0.6167846, 0.02203738, -2.065415, 1, 0, 0, 1, 1,
-0.6158566, -0.3474591, -2.650318, 1, 0, 0, 1, 1,
-0.6072028, 2.495849, -2.201475, 1, 0, 0, 1, 1,
-0.6057625, 1.580506, -2.388005, 1, 0, 0, 1, 1,
-0.6009485, -0.7631543, -1.742473, 1, 0, 0, 1, 1,
-0.5997066, 0.3202263, -1.036701, 0, 0, 0, 1, 1,
-0.5988945, 1.843266, -1.002714, 0, 0, 0, 1, 1,
-0.5983096, 1.019961, -0.2439859, 0, 0, 0, 1, 1,
-0.5969828, -0.7166981, -1.823361, 0, 0, 0, 1, 1,
-0.5922369, 0.5876988, -0.5187584, 0, 0, 0, 1, 1,
-0.5916637, -1.977437, -0.9015799, 0, 0, 0, 1, 1,
-0.585959, 1.418083, -0.07295983, 0, 0, 0, 1, 1,
-0.5830584, -1.096721, -3.397962, 1, 1, 1, 1, 1,
-0.5824644, -1.377712, -3.592974, 1, 1, 1, 1, 1,
-0.5816885, 0.08246459, -2.77976, 1, 1, 1, 1, 1,
-0.5795758, 0.1729674, -1.97465, 1, 1, 1, 1, 1,
-0.5755538, 1.082564, -0.2109623, 1, 1, 1, 1, 1,
-0.5740775, 0.1686522, -2.730582, 1, 1, 1, 1, 1,
-0.5708787, 1.531212, 0.02806423, 1, 1, 1, 1, 1,
-0.5703309, 0.4695354, -0.8572397, 1, 1, 1, 1, 1,
-0.5692691, -0.6018467, -2.751845, 1, 1, 1, 1, 1,
-0.5679452, -0.005902034, -1.311811, 1, 1, 1, 1, 1,
-0.5668768, 0.5146654, -1.009854, 1, 1, 1, 1, 1,
-0.5664318, 0.4215254, -1.009319, 1, 1, 1, 1, 1,
-0.5659185, -0.2011638, -1.840845, 1, 1, 1, 1, 1,
-0.5651564, 0.2857832, -2.282262, 1, 1, 1, 1, 1,
-0.5644113, 2.471328, -0.4047871, 1, 1, 1, 1, 1,
-0.5628137, -0.008513832, -0.9330299, 0, 0, 1, 1, 1,
-0.5602162, -0.2186385, -1.882268, 1, 0, 0, 1, 1,
-0.5584462, -1.117071, -2.347272, 1, 0, 0, 1, 1,
-0.5584125, 0.8218076, -1.381079, 1, 0, 0, 1, 1,
-0.5534648, 0.1907733, -1.238945, 1, 0, 0, 1, 1,
-0.5503489, -0.1633626, -1.407724, 1, 0, 0, 1, 1,
-0.5494074, 0.578797, -0.5554261, 0, 0, 0, 1, 1,
-0.5468969, 1.199274, 0.1027945, 0, 0, 0, 1, 1,
-0.5436774, 1.13285, -1.116138, 0, 0, 0, 1, 1,
-0.541714, -1.0819, -3.21921, 0, 0, 0, 1, 1,
-0.5392351, -1.464923, -3.401906, 0, 0, 0, 1, 1,
-0.5341156, 1.028465, 0.1763807, 0, 0, 0, 1, 1,
-0.5339306, -2.45308, -1.902566, 0, 0, 0, 1, 1,
-0.5336956, 0.03862192, -3.468443, 1, 1, 1, 1, 1,
-0.5259926, -0.3330982, -3.752025, 1, 1, 1, 1, 1,
-0.5233189, -0.308209, -1.851908, 1, 1, 1, 1, 1,
-0.5217601, -0.5911949, -3.6131, 1, 1, 1, 1, 1,
-0.5209498, 0.8334034, -1.781987, 1, 1, 1, 1, 1,
-0.5071675, -0.2159974, -1.073192, 1, 1, 1, 1, 1,
-0.4999691, -0.5099323, -2.080662, 1, 1, 1, 1, 1,
-0.4979309, 1.023636, 0.252299, 1, 1, 1, 1, 1,
-0.4963302, 0.9209879, 0.2149732, 1, 1, 1, 1, 1,
-0.4874685, 1.086238, 0.00488949, 1, 1, 1, 1, 1,
-0.4825415, 1.497638, -1.997353, 1, 1, 1, 1, 1,
-0.482513, 1.051803, -0.8277186, 1, 1, 1, 1, 1,
-0.4741411, 0.8303533, 0.1618702, 1, 1, 1, 1, 1,
-0.4715944, -0.6538544, -3.661026, 1, 1, 1, 1, 1,
-0.468383, 2.659253, 0.7317658, 1, 1, 1, 1, 1,
-0.4655692, 1.848326, -0.57604, 0, 0, 1, 1, 1,
-0.461155, 1.278255, 0.2751779, 1, 0, 0, 1, 1,
-0.4601388, 0.2643694, 0.4663589, 1, 0, 0, 1, 1,
-0.4575124, 0.5646452, -1.043453, 1, 0, 0, 1, 1,
-0.4574922, 0.5096507, 0.5021757, 1, 0, 0, 1, 1,
-0.4570306, -0.04923228, -1.481952, 1, 0, 0, 1, 1,
-0.4564164, -0.458782, -2.37356, 0, 0, 0, 1, 1,
-0.451798, 1.160589, -0.6988797, 0, 0, 0, 1, 1,
-0.4457454, 1.567669, -1.076728, 0, 0, 0, 1, 1,
-0.4418084, 2.462431, 0.5342009, 0, 0, 0, 1, 1,
-0.4405493, 0.0386649, -1.145776, 0, 0, 0, 1, 1,
-0.4379709, 0.5844207, 0.3832527, 0, 0, 0, 1, 1,
-0.4348205, 0.3262749, -0.04816091, 0, 0, 0, 1, 1,
-0.4339519, 0.3247325, -0.8794398, 1, 1, 1, 1, 1,
-0.4302056, 1.459419, 1.238777, 1, 1, 1, 1, 1,
-0.4284629, -1.151864, -3.449801, 1, 1, 1, 1, 1,
-0.424345, -0.2474201, -1.446916, 1, 1, 1, 1, 1,
-0.4189046, -0.08846261, -1.516284, 1, 1, 1, 1, 1,
-0.4180698, 2.614847, -0.8669891, 1, 1, 1, 1, 1,
-0.4136502, -0.4610671, -2.621657, 1, 1, 1, 1, 1,
-0.4119246, 0.8149456, -3.376839, 1, 1, 1, 1, 1,
-0.4099058, -0.2346842, -2.915847, 1, 1, 1, 1, 1,
-0.409591, 0.7858255, -0.3619719, 1, 1, 1, 1, 1,
-0.409079, -0.7748179, -1.460079, 1, 1, 1, 1, 1,
-0.4068156, -0.1699558, -2.677074, 1, 1, 1, 1, 1,
-0.4044801, -1.430775, -2.354645, 1, 1, 1, 1, 1,
-0.4023908, 0.04773963, -1.46364, 1, 1, 1, 1, 1,
-0.3981169, 1.495662, -0.7892953, 1, 1, 1, 1, 1,
-0.3901026, 1.446632, -1.228908, 0, 0, 1, 1, 1,
-0.3787312, 0.07437515, -2.204117, 1, 0, 0, 1, 1,
-0.3782088, -0.5102381, -1.680783, 1, 0, 0, 1, 1,
-0.3774891, -0.3111353, -4.417521, 1, 0, 0, 1, 1,
-0.375439, 0.4466791, -1.793468, 1, 0, 0, 1, 1,
-0.3723975, -1.660354, -2.945447, 1, 0, 0, 1, 1,
-0.3720007, -1.399704, -2.609416, 0, 0, 0, 1, 1,
-0.3706471, 0.4584612, -1.307589, 0, 0, 0, 1, 1,
-0.3690337, -0.8088937, -2.370734, 0, 0, 0, 1, 1,
-0.3686468, 0.6663148, -0.07299881, 0, 0, 0, 1, 1,
-0.3650286, -2.149785, -4.006474, 0, 0, 0, 1, 1,
-0.3647684, -0.8384137, -2.16149, 0, 0, 0, 1, 1,
-0.3640297, 0.4889698, -1.285755, 0, 0, 0, 1, 1,
-0.3633716, -0.5382854, -3.747609, 1, 1, 1, 1, 1,
-0.3609738, -0.07623889, -2.10895, 1, 1, 1, 1, 1,
-0.3594618, -0.0223927, -2.665781, 1, 1, 1, 1, 1,
-0.3547135, -0.5173423, -3.177744, 1, 1, 1, 1, 1,
-0.3535443, -0.3223608, -0.9833013, 1, 1, 1, 1, 1,
-0.3528808, -0.1395114, -1.092523, 1, 1, 1, 1, 1,
-0.3499244, -1.481988, -1.865964, 1, 1, 1, 1, 1,
-0.3484068, -0.2258512, 0.1074233, 1, 1, 1, 1, 1,
-0.3475579, -0.7521558, -1.525952, 1, 1, 1, 1, 1,
-0.3464364, 0.53552, -1.725796, 1, 1, 1, 1, 1,
-0.3396441, -1.374859, -3.069758, 1, 1, 1, 1, 1,
-0.3364436, -1.356317, -3.58554, 1, 1, 1, 1, 1,
-0.3255185, -0.3455573, -2.796192, 1, 1, 1, 1, 1,
-0.325392, -0.09138035, -3.879188, 1, 1, 1, 1, 1,
-0.3222853, -2.105782, -3.3201, 1, 1, 1, 1, 1,
-0.3150027, 0.4483148, 0.2733011, 0, 0, 1, 1, 1,
-0.3130933, -1.04725, -1.78995, 1, 0, 0, 1, 1,
-0.3082711, -0.05510876, -2.990437, 1, 0, 0, 1, 1,
-0.2990311, 0.07615866, -1.291606, 1, 0, 0, 1, 1,
-0.295347, 1.216043, 0.247879, 1, 0, 0, 1, 1,
-0.2935201, 0.7689091, 0.2046427, 1, 0, 0, 1, 1,
-0.2908636, 0.576971, -0.4120969, 0, 0, 0, 1, 1,
-0.2856053, 1.407456, 0.238196, 0, 0, 0, 1, 1,
-0.2849303, -2.305583, -4.307109, 0, 0, 0, 1, 1,
-0.2836904, -1.162917, -3.919408, 0, 0, 0, 1, 1,
-0.2794972, 1.216555, -0.974507, 0, 0, 0, 1, 1,
-0.273253, 0.5379398, -1.154349, 0, 0, 0, 1, 1,
-0.2664156, 0.5958494, 0.9730927, 0, 0, 0, 1, 1,
-0.2527685, 0.8406236, -0.7713501, 1, 1, 1, 1, 1,
-0.2512969, 0.2608629, -1.318056, 1, 1, 1, 1, 1,
-0.2483965, -1.055763, -0.587884, 1, 1, 1, 1, 1,
-0.2361612, 0.0810535, -0.9904729, 1, 1, 1, 1, 1,
-0.2359292, 0.8195822, 0.81362, 1, 1, 1, 1, 1,
-0.2319759, 0.3087892, -0.03289133, 1, 1, 1, 1, 1,
-0.2315751, 0.03099084, -0.2517961, 1, 1, 1, 1, 1,
-0.2298238, 1.535346, -0.5504414, 1, 1, 1, 1, 1,
-0.2290695, -0.2182698, -2.79343, 1, 1, 1, 1, 1,
-0.2238274, 0.5181558, -2.117043, 1, 1, 1, 1, 1,
-0.2215062, 1.522085, 0.1530796, 1, 1, 1, 1, 1,
-0.2165238, 0.3731138, -1.050591, 1, 1, 1, 1, 1,
-0.2158119, 0.9786416, 1.125659, 1, 1, 1, 1, 1,
-0.2141948, -1.687078, -3.571654, 1, 1, 1, 1, 1,
-0.2137646, -0.98343, -2.761732, 1, 1, 1, 1, 1,
-0.2131591, 0.04504211, -1.049881, 0, 0, 1, 1, 1,
-0.2129743, 0.9286357, -2.327429, 1, 0, 0, 1, 1,
-0.2124158, -0.5706608, -2.702631, 1, 0, 0, 1, 1,
-0.2069819, 2.401793, 1.156062, 1, 0, 0, 1, 1,
-0.2019421, -0.2196591, -1.628671, 1, 0, 0, 1, 1,
-0.1981371, -0.7172425, -2.468142, 1, 0, 0, 1, 1,
-0.1961854, -0.5890353, -2.130398, 0, 0, 0, 1, 1,
-0.1949381, 1.028174, -0.5988831, 0, 0, 0, 1, 1,
-0.1929588, -0.001478681, -0.4636524, 0, 0, 0, 1, 1,
-0.1884374, -0.0002336983, 0.5240663, 0, 0, 0, 1, 1,
-0.1869245, -0.08736499, -2.382186, 0, 0, 0, 1, 1,
-0.1850399, -0.3841065, -3.439808, 0, 0, 0, 1, 1,
-0.1832004, 0.9500525, -0.8663961, 0, 0, 0, 1, 1,
-0.1751094, 0.8674309, -0.6712756, 1, 1, 1, 1, 1,
-0.1677688, -0.2900911, -2.010302, 1, 1, 1, 1, 1,
-0.1668635, -0.8306662, -2.208465, 1, 1, 1, 1, 1,
-0.1607406, -1.245353, -3.634647, 1, 1, 1, 1, 1,
-0.157793, 1.791659, -2.553196, 1, 1, 1, 1, 1,
-0.156312, -0.01373151, -2.261961, 1, 1, 1, 1, 1,
-0.1562458, -0.524706, -2.905339, 1, 1, 1, 1, 1,
-0.156069, -1.250377, -4.223017, 1, 1, 1, 1, 1,
-0.1544138, 0.9467106, 0.565984, 1, 1, 1, 1, 1,
-0.1542829, 0.2522953, -1.795205, 1, 1, 1, 1, 1,
-0.1536898, 0.2236214, -0.3409441, 1, 1, 1, 1, 1,
-0.1527751, -1.177417, -3.273316, 1, 1, 1, 1, 1,
-0.148274, 0.2770149, -0.131341, 1, 1, 1, 1, 1,
-0.1430347, -0.283068, -1.109851, 1, 1, 1, 1, 1,
-0.1408103, -0.5557866, -3.765585, 1, 1, 1, 1, 1,
-0.137954, 1.308125, -0.7633127, 0, 0, 1, 1, 1,
-0.1321644, 0.4046473, 1.11131, 1, 0, 0, 1, 1,
-0.131877, 1.833599, 0.8027673, 1, 0, 0, 1, 1,
-0.1275407, -1.000661, -5.421198, 1, 0, 0, 1, 1,
-0.126427, 0.6099445, 0.7224818, 1, 0, 0, 1, 1,
-0.1238941, 0.8224378, -0.8343775, 1, 0, 0, 1, 1,
-0.1229152, -0.02192786, -0.4092266, 0, 0, 0, 1, 1,
-0.1109216, 0.7072284, -0.473891, 0, 0, 0, 1, 1,
-0.1079258, -0.8562125, -3.532647, 0, 0, 0, 1, 1,
-0.1072213, 1.478465, 0.3186871, 0, 0, 0, 1, 1,
-0.1050653, -0.07216004, -0.7229559, 0, 0, 0, 1, 1,
-0.1012669, -0.2856222, -2.309389, 0, 0, 0, 1, 1,
-0.1008903, -0.4664676, -4.715232, 0, 0, 0, 1, 1,
-0.09831271, 0.2210563, 0.9504039, 1, 1, 1, 1, 1,
-0.09795416, 0.6516431, -0.2441336, 1, 1, 1, 1, 1,
-0.09645082, 1.02623, 1.135128, 1, 1, 1, 1, 1,
-0.09361663, -0.3333306, -2.863248, 1, 1, 1, 1, 1,
-0.09267407, 2.162362, -0.8438752, 1, 1, 1, 1, 1,
-0.09197938, -0.7408217, -3.746747, 1, 1, 1, 1, 1,
-0.08935136, -0.08782873, -1.781218, 1, 1, 1, 1, 1,
-0.08273453, -0.4020176, -4.686478, 1, 1, 1, 1, 1,
-0.08095872, 0.5001317, 0.9326642, 1, 1, 1, 1, 1,
-0.07828118, -0.1570661, -3.423908, 1, 1, 1, 1, 1,
-0.07795937, -0.6071694, -3.669861, 1, 1, 1, 1, 1,
-0.07559393, 1.339372, -0.3831913, 1, 1, 1, 1, 1,
-0.07521482, 0.6651117, -0.7327887, 1, 1, 1, 1, 1,
-0.07347465, 1.695467, -2.33985, 1, 1, 1, 1, 1,
-0.0724301, 1.45092, 4.098476, 1, 1, 1, 1, 1,
-0.07104093, 1.692757, 1.058704, 0, 0, 1, 1, 1,
-0.07006878, 0.9244888, -0.4848938, 1, 0, 0, 1, 1,
-0.06979121, -0.1416171, -2.043194, 1, 0, 0, 1, 1,
-0.06755602, 0.3554242, -1.633597, 1, 0, 0, 1, 1,
-0.06430412, -0.09602381, -1.634435, 1, 0, 0, 1, 1,
-0.06424446, -0.8187751, -3.276013, 1, 0, 0, 1, 1,
-0.05928086, -0.377419, -2.999, 0, 0, 0, 1, 1,
-0.05893139, 0.6615123, -0.2904663, 0, 0, 0, 1, 1,
-0.05023534, 0.5441214, -0.1000415, 0, 0, 0, 1, 1,
-0.04667015, -1.86036, -4.849933, 0, 0, 0, 1, 1,
-0.04210858, -0.24781, -2.218394, 0, 0, 0, 1, 1,
-0.03727699, 1.00067, -0.1131373, 0, 0, 0, 1, 1,
-0.0315919, -0.8713523, -3.485468, 0, 0, 0, 1, 1,
-0.02924562, 0.1514739, -0.1224071, 1, 1, 1, 1, 1,
-0.02881333, -0.1421903, -2.728001, 1, 1, 1, 1, 1,
-0.0282675, -0.2903651, -3.05303, 1, 1, 1, 1, 1,
-0.02744355, -0.009339276, -3.733949, 1, 1, 1, 1, 1,
-0.02738177, 1.163363, -0.8183802, 1, 1, 1, 1, 1,
-0.02621976, -1.582128, -2.243213, 1, 1, 1, 1, 1,
-0.0257402, -0.482396, -3.551603, 1, 1, 1, 1, 1,
-0.02279543, -0.472684, -3.694071, 1, 1, 1, 1, 1,
-0.02162631, 0.1601762, -0.3862994, 1, 1, 1, 1, 1,
-0.02087067, 0.1437581, -0.1779144, 1, 1, 1, 1, 1,
-0.01787202, -3.010741, -4.154302, 1, 1, 1, 1, 1,
-0.01594209, -0.3911456, -4.133762, 1, 1, 1, 1, 1,
-0.01533294, -0.9789782, -4.581696, 1, 1, 1, 1, 1,
-0.01245928, 1.280511, -0.3680496, 1, 1, 1, 1, 1,
-0.0106991, -1.263253, -2.466305, 1, 1, 1, 1, 1,
-0.003656984, 0.2765907, -1.87645, 0, 0, 1, 1, 1,
-0.002072502, 1.16266, 0.4466724, 1, 0, 0, 1, 1,
0.002583959, 0.9305194, 1.91961, 1, 0, 0, 1, 1,
0.002779434, -0.8891488, 4.101896, 1, 0, 0, 1, 1,
0.006263779, -0.7914793, 4.526076, 1, 0, 0, 1, 1,
0.007213716, 2.138867, 0.571179, 1, 0, 0, 1, 1,
0.01392157, -1.457506, 2.703838, 0, 0, 0, 1, 1,
0.01739007, 1.1243, 2.988804, 0, 0, 0, 1, 1,
0.020728, -0.9820001, 0.9853019, 0, 0, 0, 1, 1,
0.02211621, -0.4575583, 3.509717, 0, 0, 0, 1, 1,
0.02441007, -0.9258938, 3.739833, 0, 0, 0, 1, 1,
0.0262917, -0.3384638, 1.551782, 0, 0, 0, 1, 1,
0.02683876, 0.4736006, 1.034591, 0, 0, 0, 1, 1,
0.02955877, 0.647286, -0.5134487, 1, 1, 1, 1, 1,
0.03131013, 1.992073, 0.0658086, 1, 1, 1, 1, 1,
0.03411767, -1.447057, 2.830168, 1, 1, 1, 1, 1,
0.03482646, -1.118259, 2.364568, 1, 1, 1, 1, 1,
0.03618084, -0.4060995, 2.287858, 1, 1, 1, 1, 1,
0.0377986, -1.498223, 1.725706, 1, 1, 1, 1, 1,
0.03921641, -0.3584321, 0.537454, 1, 1, 1, 1, 1,
0.04033462, 0.4800448, 1.681616, 1, 1, 1, 1, 1,
0.04321263, 0.1955246, 0.3645029, 1, 1, 1, 1, 1,
0.04581186, 1.050088, -0.5308214, 1, 1, 1, 1, 1,
0.04924048, -0.358718, 3.938081, 1, 1, 1, 1, 1,
0.05112974, 1.991004, 1.974182, 1, 1, 1, 1, 1,
0.05188463, 0.5483468, -0.7125803, 1, 1, 1, 1, 1,
0.05213637, -1.440546, 2.168291, 1, 1, 1, 1, 1,
0.05448471, -0.128804, 2.426287, 1, 1, 1, 1, 1,
0.05627298, -1.874114, 4.617401, 0, 0, 1, 1, 1,
0.05791302, -0.9295654, 3.455031, 1, 0, 0, 1, 1,
0.06086809, 0.1863202, 1.708582, 1, 0, 0, 1, 1,
0.06116891, 0.9212337, -0.5102482, 1, 0, 0, 1, 1,
0.06413827, 1.460258, -0.8650337, 1, 0, 0, 1, 1,
0.06895648, 1.04697, -1.656536, 1, 0, 0, 1, 1,
0.06902818, -0.6877946, 1.925667, 0, 0, 0, 1, 1,
0.08095545, -0.805001, 2.453311, 0, 0, 0, 1, 1,
0.08178974, 1.924796, 2.29709, 0, 0, 0, 1, 1,
0.0840484, -1.907281, 2.348022, 0, 0, 0, 1, 1,
0.08409372, -1.448852, 1.96121, 0, 0, 0, 1, 1,
0.08459634, 1.879216, 0.3007033, 0, 0, 0, 1, 1,
0.08515855, -2.336159, 3.249724, 0, 0, 0, 1, 1,
0.08599447, -1.15138, 2.740999, 1, 1, 1, 1, 1,
0.08913327, 1.473252, -1.336095, 1, 1, 1, 1, 1,
0.08978309, 1.499838, -0.1640271, 1, 1, 1, 1, 1,
0.09028788, -1.560636, 4.174139, 1, 1, 1, 1, 1,
0.09240349, -0.2887874, 2.053503, 1, 1, 1, 1, 1,
0.09315629, 0.6278566, 1.662828, 1, 1, 1, 1, 1,
0.09336227, -0.2959178, 3.077555, 1, 1, 1, 1, 1,
0.09609596, -0.0914683, 3.054734, 1, 1, 1, 1, 1,
0.09728476, -0.5837849, 2.697862, 1, 1, 1, 1, 1,
0.09865108, 2.551008, -0.4167573, 1, 1, 1, 1, 1,
0.103328, 0.007944533, 3.156484, 1, 1, 1, 1, 1,
0.1037335, -2.578439, 2.98589, 1, 1, 1, 1, 1,
0.1051898, -2.10303, 2.608596, 1, 1, 1, 1, 1,
0.1077037, 0.008287114, 2.343767, 1, 1, 1, 1, 1,
0.1133403, -0.5754358, 2.738471, 1, 1, 1, 1, 1,
0.1185707, -0.3140038, 1.869972, 0, 0, 1, 1, 1,
0.1203569, -0.4300013, 2.771676, 1, 0, 0, 1, 1,
0.1205926, -1.013268, 2.038233, 1, 0, 0, 1, 1,
0.1220829, -0.4413532, 2.261636, 1, 0, 0, 1, 1,
0.1222692, -0.2200938, 2.345312, 1, 0, 0, 1, 1,
0.1238832, -0.6557437, 3.756587, 1, 0, 0, 1, 1,
0.1251155, 3.137041, -1.369606, 0, 0, 0, 1, 1,
0.1264323, -0.02725673, 0.8547127, 0, 0, 0, 1, 1,
0.1273248, -0.5450599, -0.4867143, 0, 0, 0, 1, 1,
0.1273672, 0.3604553, 0.02902072, 0, 0, 0, 1, 1,
0.1312431, 0.7524102, -0.4201391, 0, 0, 0, 1, 1,
0.1418023, 1.286121, 0.7859429, 0, 0, 0, 1, 1,
0.1465478, 0.1705416, 2.418707, 0, 0, 0, 1, 1,
0.1516536, 0.2132856, -0.0162791, 1, 1, 1, 1, 1,
0.1572924, 0.6568515, -1.484836, 1, 1, 1, 1, 1,
0.1610324, 0.4438429, -1.079998, 1, 1, 1, 1, 1,
0.1621762, 0.7089794, 2.305351, 1, 1, 1, 1, 1,
0.1631424, -0.3025691, 2.16522, 1, 1, 1, 1, 1,
0.1649587, -0.4527574, 3.215176, 1, 1, 1, 1, 1,
0.1661867, 0.8304766, 1.216225, 1, 1, 1, 1, 1,
0.1675227, -0.1218053, 4.548212, 1, 1, 1, 1, 1,
0.169357, -1.004642, 3.597043, 1, 1, 1, 1, 1,
0.1727756, 0.8439578, -0.6445786, 1, 1, 1, 1, 1,
0.1774929, -0.03183824, 4.830537, 1, 1, 1, 1, 1,
0.1775365, -0.2136232, 3.866246, 1, 1, 1, 1, 1,
0.1778242, -0.2886832, 2.204465, 1, 1, 1, 1, 1,
0.1781644, 0.3830639, -0.04614524, 1, 1, 1, 1, 1,
0.1817151, -0.5366844, 2.900915, 1, 1, 1, 1, 1,
0.1836308, -0.5156457, 0.4380866, 0, 0, 1, 1, 1,
0.1841323, -1.960966, 3.866787, 1, 0, 0, 1, 1,
0.1859087, -0.6850563, 4.185498, 1, 0, 0, 1, 1,
0.1911202, 0.140036, 1.084397, 1, 0, 0, 1, 1,
0.1997844, 0.3901042, -0.470502, 1, 0, 0, 1, 1,
0.2018305, -0.2588931, 4.139249, 1, 0, 0, 1, 1,
0.2126155, -0.3947471, 2.644151, 0, 0, 0, 1, 1,
0.2205973, -1.499222, 3.690358, 0, 0, 0, 1, 1,
0.2216917, 1.630419, 1.237536, 0, 0, 0, 1, 1,
0.2240098, 1.205922, -1.846698, 0, 0, 0, 1, 1,
0.2243637, 2.440134, 0.3741755, 0, 0, 0, 1, 1,
0.2265265, 0.0729764, -0.2380328, 0, 0, 0, 1, 1,
0.2309172, -0.7408293, 1.789983, 0, 0, 0, 1, 1,
0.2350456, -0.5341652, 3.146835, 1, 1, 1, 1, 1,
0.2398506, 0.300384, 0.3912916, 1, 1, 1, 1, 1,
0.2405922, -0.9758939, 3.07824, 1, 1, 1, 1, 1,
0.2408947, 0.3247513, -1.239563, 1, 1, 1, 1, 1,
0.2417345, 0.405301, 0.5230263, 1, 1, 1, 1, 1,
0.2471319, -1.300011, 2.711197, 1, 1, 1, 1, 1,
0.2483907, 0.4717026, 1.127938, 1, 1, 1, 1, 1,
0.2536629, 0.6105723, 0.08943564, 1, 1, 1, 1, 1,
0.255566, 1.780811, 1.306118, 1, 1, 1, 1, 1,
0.2572163, -0.6865647, 1.797156, 1, 1, 1, 1, 1,
0.2577829, -0.1825975, 2.245483, 1, 1, 1, 1, 1,
0.264016, -0.9046904, 2.611639, 1, 1, 1, 1, 1,
0.2697606, -1.21253, 2.397269, 1, 1, 1, 1, 1,
0.2729151, 1.315247, 2.023699, 1, 1, 1, 1, 1,
0.2729409, 1.570981, -1.361686, 1, 1, 1, 1, 1,
0.2732022, 0.3880861, 1.546621, 0, 0, 1, 1, 1,
0.2791847, -1.245888, 2.337381, 1, 0, 0, 1, 1,
0.279806, 1.150214, -1.400843, 1, 0, 0, 1, 1,
0.2854252, 1.96472, -0.5227363, 1, 0, 0, 1, 1,
0.291238, -0.1162218, 2.140539, 1, 0, 0, 1, 1,
0.2918858, 0.7490692, 1.440922, 1, 0, 0, 1, 1,
0.2933627, 0.9540058, -1.142579, 0, 0, 0, 1, 1,
0.293377, -0.1422246, 0.3162273, 0, 0, 0, 1, 1,
0.2947114, 0.8301077, 1.320196, 0, 0, 0, 1, 1,
0.3002979, -0.6414698, 3.203355, 0, 0, 0, 1, 1,
0.3028641, 0.4005027, -0.5640477, 0, 0, 0, 1, 1,
0.3045826, 1.162024, 0.686169, 0, 0, 0, 1, 1,
0.305812, 0.5437381, 1.515309, 0, 0, 0, 1, 1,
0.3077607, 1.390886, -0.4730159, 1, 1, 1, 1, 1,
0.3098013, -0.0944641, 1.696139, 1, 1, 1, 1, 1,
0.3100133, -0.4874701, 0.9786395, 1, 1, 1, 1, 1,
0.3161723, -0.7639508, 2.986654, 1, 1, 1, 1, 1,
0.3170128, -1.041157, 0.2224427, 1, 1, 1, 1, 1,
0.3205333, 0.8213206, 0.1150989, 1, 1, 1, 1, 1,
0.3205781, -0.8912163, 3.11804, 1, 1, 1, 1, 1,
0.3206541, 1.039886, 1.023953, 1, 1, 1, 1, 1,
0.3206994, -0.7111297, 4.112401, 1, 1, 1, 1, 1,
0.3388986, -0.2596277, 3.220458, 1, 1, 1, 1, 1,
0.3438261, -0.05179292, 1.412676, 1, 1, 1, 1, 1,
0.3440683, -0.1148527, 2.735184, 1, 1, 1, 1, 1,
0.3464886, -1.227321, 2.8034, 1, 1, 1, 1, 1,
0.3466382, -0.4219089, 0.6843144, 1, 1, 1, 1, 1,
0.3470372, 0.3646764, -1.314137, 1, 1, 1, 1, 1,
0.348684, 0.3095542, -0.1555171, 0, 0, 1, 1, 1,
0.3510189, 0.02881029, 0.9538007, 1, 0, 0, 1, 1,
0.3525274, -0.3310682, 2.204007, 1, 0, 0, 1, 1,
0.3542329, -1.294901, 1.574495, 1, 0, 0, 1, 1,
0.3562066, 1.029004, -2.474158, 1, 0, 0, 1, 1,
0.3579776, 0.0888712, 3.220516, 1, 0, 0, 1, 1,
0.3603584, -0.873887, 4.051136, 0, 0, 0, 1, 1,
0.3610419, 1.004902, 0.832361, 0, 0, 0, 1, 1,
0.3634202, -1.200493, 2.62546, 0, 0, 0, 1, 1,
0.3674597, -0.279549, 3.099779, 0, 0, 0, 1, 1,
0.3695662, 1.732201, -0.1911615, 0, 0, 0, 1, 1,
0.3701286, -0.04606621, 3.742577, 0, 0, 0, 1, 1,
0.3707595, 1.657753, 0.4885453, 0, 0, 0, 1, 1,
0.3774809, -0.6371516, 2.867865, 1, 1, 1, 1, 1,
0.381166, 0.9143612, -0.7964408, 1, 1, 1, 1, 1,
0.3812034, -0.4366941, 2.216399, 1, 1, 1, 1, 1,
0.3818781, -1.513329, 2.476152, 1, 1, 1, 1, 1,
0.3891452, -0.5728829, 1.576499, 1, 1, 1, 1, 1,
0.3929423, 0.9636888, 1.01054, 1, 1, 1, 1, 1,
0.3945381, 0.9491268, 3.326674, 1, 1, 1, 1, 1,
0.395844, 0.8685197, 1.116795, 1, 1, 1, 1, 1,
0.4040567, -1.439851, 2.785163, 1, 1, 1, 1, 1,
0.4082408, 0.7987878, 1.039151, 1, 1, 1, 1, 1,
0.4088124, -0.5941035, 2.665801, 1, 1, 1, 1, 1,
0.4117327, 1.270942, -0.7220721, 1, 1, 1, 1, 1,
0.4120558, -0.4725572, 1.741049, 1, 1, 1, 1, 1,
0.4127876, 0.02362372, 0.5812833, 1, 1, 1, 1, 1,
0.4132333, -0.997766, 2.544459, 1, 1, 1, 1, 1,
0.4152307, 1.548918, 0.9421564, 0, 0, 1, 1, 1,
0.416278, -2.741773, 5.185444, 1, 0, 0, 1, 1,
0.4180995, -0.4711372, 1.784401, 1, 0, 0, 1, 1,
0.4183891, 0.08122817, 1.775789, 1, 0, 0, 1, 1,
0.4203679, 0.789413, 2.541323, 1, 0, 0, 1, 1,
0.4216126, -1.468705, 3.968535, 1, 0, 0, 1, 1,
0.4242733, -0.431774, 2.110526, 0, 0, 0, 1, 1,
0.4298052, 0.841854, -0.1126373, 0, 0, 0, 1, 1,
0.4315611, -0.09913709, 2.399917, 0, 0, 0, 1, 1,
0.4320033, 1.061935, -0.9884838, 0, 0, 0, 1, 1,
0.4392959, 1.143924, 2.713834, 0, 0, 0, 1, 1,
0.4406942, -0.5073994, 1.004884, 0, 0, 0, 1, 1,
0.4432811, 0.7246864, 1.47653, 0, 0, 0, 1, 1,
0.4440897, -1.329455, 4.532135, 1, 1, 1, 1, 1,
0.4468269, -0.5788876, 2.538708, 1, 1, 1, 1, 1,
0.4523229, -0.3506756, 1.369039, 1, 1, 1, 1, 1,
0.4624109, 0.1462318, 1.390619, 1, 1, 1, 1, 1,
0.4660057, -0.3606875, 1.826349, 1, 1, 1, 1, 1,
0.4690073, 1.893704, -0.1882212, 1, 1, 1, 1, 1,
0.4701181, 1.612857, 0.978476, 1, 1, 1, 1, 1,
0.4813518, 0.4352214, 2.456405, 1, 1, 1, 1, 1,
0.4824871, -0.2335548, 2.047146, 1, 1, 1, 1, 1,
0.4839621, -1.103055, 2.573953, 1, 1, 1, 1, 1,
0.4850747, -0.03368055, 2.365771, 1, 1, 1, 1, 1,
0.4872001, 0.8696933, 1.017964, 1, 1, 1, 1, 1,
0.4904781, 0.5486992, 1.209946, 1, 1, 1, 1, 1,
0.493313, -0.3013938, 3.250943, 1, 1, 1, 1, 1,
0.498229, 0.03904252, 0.7668707, 1, 1, 1, 1, 1,
0.5034518, 1.610034, -0.1043308, 0, 0, 1, 1, 1,
0.5051728, 3.075016, -0.2528043, 1, 0, 0, 1, 1,
0.5064942, 2.489449, 0.3627373, 1, 0, 0, 1, 1,
0.5078394, -0.4161467, 2.733503, 1, 0, 0, 1, 1,
0.5135658, 0.6927958, 0.1598659, 1, 0, 0, 1, 1,
0.5161036, -2.276578, 3.170435, 1, 0, 0, 1, 1,
0.5200017, 0.4836062, 1.365185, 0, 0, 0, 1, 1,
0.523164, 1.032119, 0.7540705, 0, 0, 0, 1, 1,
0.5275427, -0.7238076, 3.384274, 0, 0, 0, 1, 1,
0.529148, -1.628013, 2.798587, 0, 0, 0, 1, 1,
0.5295628, -1.036432, 2.683581, 0, 0, 0, 1, 1,
0.5299468, -1.174912, 2.49491, 0, 0, 0, 1, 1,
0.5306056, -0.8780221, 3.05364, 0, 0, 0, 1, 1,
0.5307564, 0.9564972, -1.175011, 1, 1, 1, 1, 1,
0.5345075, -0.5240129, 3.141235, 1, 1, 1, 1, 1,
0.5363075, 0.1391518, 1.829645, 1, 1, 1, 1, 1,
0.5367709, -0.01326171, 0.2304167, 1, 1, 1, 1, 1,
0.5370477, -0.5535986, 1.080074, 1, 1, 1, 1, 1,
0.5398832, -1.300524, 1.408424, 1, 1, 1, 1, 1,
0.5404751, 0.4259421, 0.7655272, 1, 1, 1, 1, 1,
0.5429541, 0.2020592, 0.348651, 1, 1, 1, 1, 1,
0.5452585, -0.5260359, 1.759017, 1, 1, 1, 1, 1,
0.5479413, 1.588346, 1.131486, 1, 1, 1, 1, 1,
0.5487003, -1.123573, 3.799102, 1, 1, 1, 1, 1,
0.5494798, 0.6048147, 1.304365, 1, 1, 1, 1, 1,
0.5510719, 0.2810291, -0.260814, 1, 1, 1, 1, 1,
0.5686457, 0.3568135, -1.911626, 1, 1, 1, 1, 1,
0.5787163, 2.037733, 2.174748, 1, 1, 1, 1, 1,
0.5848184, -0.1767623, 4.249475, 0, 0, 1, 1, 1,
0.5851718, 0.3372, 2.031485, 1, 0, 0, 1, 1,
0.5913559, 0.444863, -0.04706454, 1, 0, 0, 1, 1,
0.5926798, 0.5635027, 1.00889, 1, 0, 0, 1, 1,
0.5928913, 0.5680214, -0.1265319, 1, 0, 0, 1, 1,
0.5932985, 2.442806, 0.4034285, 1, 0, 0, 1, 1,
0.5962197, 0.6132987, 0.05951689, 0, 0, 0, 1, 1,
0.5997515, -0.210002, 2.01069, 0, 0, 0, 1, 1,
0.6006225, 1.560331, -0.5527133, 0, 0, 0, 1, 1,
0.6032401, 0.6252246, 1.250923, 0, 0, 0, 1, 1,
0.6072679, -1.025378, 1.394605, 0, 0, 0, 1, 1,
0.6111866, -1.020378, 2.88003, 0, 0, 0, 1, 1,
0.6122625, 0.3271766, 1.675596, 0, 0, 0, 1, 1,
0.6131503, -1.134496, 2.460487, 1, 1, 1, 1, 1,
0.613878, 1.346274, -1.540574, 1, 1, 1, 1, 1,
0.6157941, -1.721752, 3.281559, 1, 1, 1, 1, 1,
0.6190782, 0.8170478, -0.2770486, 1, 1, 1, 1, 1,
0.6193364, 0.7276427, 0.2969094, 1, 1, 1, 1, 1,
0.622725, 0.1169058, 2.972463, 1, 1, 1, 1, 1,
0.6281058, 1.015773, 0.6707482, 1, 1, 1, 1, 1,
0.6346517, 1.10177, -0.7587426, 1, 1, 1, 1, 1,
0.6382746, -1.438615, 2.307848, 1, 1, 1, 1, 1,
0.6388785, -1.625703, 2.366664, 1, 1, 1, 1, 1,
0.6393331, 0.2026182, -1.421833, 1, 1, 1, 1, 1,
0.6412644, 1.069202, -0.210116, 1, 1, 1, 1, 1,
0.6511209, 0.5727303, -0.1352242, 1, 1, 1, 1, 1,
0.6527532, 0.7708052, 0.2425117, 1, 1, 1, 1, 1,
0.6541334, 1.758721, 0.4003833, 1, 1, 1, 1, 1,
0.6551793, -0.8107632, 1.887818, 0, 0, 1, 1, 1,
0.6562884, -0.04219577, 1.986098, 1, 0, 0, 1, 1,
0.6584939, 0.8463221, 2.416495, 1, 0, 0, 1, 1,
0.6595914, 0.4096821, -0.2041847, 1, 0, 0, 1, 1,
0.6600167, 0.9175321, 2.357365, 1, 0, 0, 1, 1,
0.6635174, 1.794999, 0.3221601, 1, 0, 0, 1, 1,
0.6683955, -1.384728, 2.566145, 0, 0, 0, 1, 1,
0.6689183, -0.3057232, 1.570639, 0, 0, 0, 1, 1,
0.6707048, -0.007640601, 2.559911, 0, 0, 0, 1, 1,
0.6822743, 1.283476, 1.972626, 0, 0, 0, 1, 1,
0.6857335, -1.6865, 3.486368, 0, 0, 0, 1, 1,
0.6874138, -0.3530463, 2.187323, 0, 0, 0, 1, 1,
0.6898943, -0.7810467, 3.97695, 0, 0, 0, 1, 1,
0.6903967, -0.3821104, 2.798156, 1, 1, 1, 1, 1,
0.7035299, 1.094504, 1.053715, 1, 1, 1, 1, 1,
0.7072037, 0.9535789, -0.2908139, 1, 1, 1, 1, 1,
0.7111888, 1.061073, 0.800604, 1, 1, 1, 1, 1,
0.7146348, -0.1115356, 0.5030173, 1, 1, 1, 1, 1,
0.7162511, 1.036414, 1.288649, 1, 1, 1, 1, 1,
0.7163466, -0.06848228, 3.099663, 1, 1, 1, 1, 1,
0.7218733, -0.05213381, 1.452697, 1, 1, 1, 1, 1,
0.7266964, -0.7757739, 2.656579, 1, 1, 1, 1, 1,
0.7289039, -0.2770181, 0.6263713, 1, 1, 1, 1, 1,
0.7312149, 1.028839, 1.676944, 1, 1, 1, 1, 1,
0.7328733, 0.6710413, 2.671229, 1, 1, 1, 1, 1,
0.7334148, -0.2454024, 1.630254, 1, 1, 1, 1, 1,
0.7412632, 0.4333751, 0.7113709, 1, 1, 1, 1, 1,
0.7422923, -0.1759088, 1.49671, 1, 1, 1, 1, 1,
0.7423339, 1.409504, 1.063539, 0, 0, 1, 1, 1,
0.7457827, -2.201893, 3.299386, 1, 0, 0, 1, 1,
0.7494195, -0.3581481, 2.185602, 1, 0, 0, 1, 1,
0.7512845, -1.33171, 2.437785, 1, 0, 0, 1, 1,
0.754346, 1.517615, 1.394746, 1, 0, 0, 1, 1,
0.7546923, 1.76965, 0.7617804, 1, 0, 0, 1, 1,
0.7555676, -1.969708, 4.150552, 0, 0, 0, 1, 1,
0.7585045, -1.597199, 1.735803, 0, 0, 0, 1, 1,
0.7586861, -0.1084301, 0.4677417, 0, 0, 0, 1, 1,
0.7626638, 2.337705, 0.5725979, 0, 0, 0, 1, 1,
0.7675058, -1.047745, 2.228854, 0, 0, 0, 1, 1,
0.7735417, 0.06605274, 2.793444, 0, 0, 0, 1, 1,
0.7770151, -0.01517019, 1.842497, 0, 0, 0, 1, 1,
0.7792695, 0.4071336, 0.7381195, 1, 1, 1, 1, 1,
0.7812448, -0.7274131, 3.256721, 1, 1, 1, 1, 1,
0.7987332, 1.269242, -0.4420182, 1, 1, 1, 1, 1,
0.8016145, 0.5271686, 0.7279614, 1, 1, 1, 1, 1,
0.8038433, 0.196357, 0.14388, 1, 1, 1, 1, 1,
0.8053005, -1.47282, 3.940005, 1, 1, 1, 1, 1,
0.811434, 1.33647, -0.4714697, 1, 1, 1, 1, 1,
0.8148067, -1.043815, 3.28901, 1, 1, 1, 1, 1,
0.8157237, 0.08900595, 1.17581, 1, 1, 1, 1, 1,
0.821528, 0.2359255, 1.600687, 1, 1, 1, 1, 1,
0.821773, -0.3758263, 2.484019, 1, 1, 1, 1, 1,
0.8280355, 1.11327, -0.08983407, 1, 1, 1, 1, 1,
0.8324097, -0.1998087, 3.245133, 1, 1, 1, 1, 1,
0.8363595, 0.7396701, 1.867971, 1, 1, 1, 1, 1,
0.8370284, -1.357244, 4.254879, 1, 1, 1, 1, 1,
0.838295, 0.09843341, 1.800948, 0, 0, 1, 1, 1,
0.8418127, 1.01186, 1.525661, 1, 0, 0, 1, 1,
0.8438373, 0.2530732, -0.322459, 1, 0, 0, 1, 1,
0.84507, -0.5658594, 1.593512, 1, 0, 0, 1, 1,
0.8469903, -0.07363334, 1.498379, 1, 0, 0, 1, 1,
0.8504801, 0.3830308, 0.07271095, 1, 0, 0, 1, 1,
0.8543988, -0.04815178, -0.2862677, 0, 0, 0, 1, 1,
0.8555528, -2.033757, 1.814202, 0, 0, 0, 1, 1,
0.859596, 0.8750732, 0.7299514, 0, 0, 0, 1, 1,
0.8599014, 2.200477, 0.4363655, 0, 0, 0, 1, 1,
0.8721825, 0.06129957, 1.355799, 0, 0, 0, 1, 1,
0.8767744, 0.9820566, 1.444274, 0, 0, 0, 1, 1,
0.8817329, 1.37815, -0.661803, 0, 0, 0, 1, 1,
0.8832977, 0.004545095, 2.91423, 1, 1, 1, 1, 1,
0.8844586, 0.4618721, 0.6373063, 1, 1, 1, 1, 1,
0.8864127, -1.577743, 2.075614, 1, 1, 1, 1, 1,
0.8872816, -1.345286, 3.107621, 1, 1, 1, 1, 1,
0.890187, -0.2118939, 2.513147, 1, 1, 1, 1, 1,
0.8948016, 1.075542, -0.02734977, 1, 1, 1, 1, 1,
0.8965484, 1.269994, -1.542582, 1, 1, 1, 1, 1,
0.9054488, 0.2892104, 1.652533, 1, 1, 1, 1, 1,
0.9164824, -1.001089, 2.236356, 1, 1, 1, 1, 1,
0.9286965, -0.07885422, 2.771034, 1, 1, 1, 1, 1,
0.930428, 0.5626993, 0.5145517, 1, 1, 1, 1, 1,
0.9313022, 0.9501019, 1.754684, 1, 1, 1, 1, 1,
0.932548, 0.2501068, 0.5259326, 1, 1, 1, 1, 1,
0.9366701, -0.5141932, 1.44063, 1, 1, 1, 1, 1,
0.937002, -0.7385176, 1.829159, 1, 1, 1, 1, 1,
0.9412125, 0.3478335, 0.1909875, 0, 0, 1, 1, 1,
0.9418041, -0.1093361, 1.943362, 1, 0, 0, 1, 1,
0.9464554, -0.02337653, 1.343644, 1, 0, 0, 1, 1,
0.9547547, -1.611821, 2.022105, 1, 0, 0, 1, 1,
0.9554986, -0.1937576, 0.3396436, 1, 0, 0, 1, 1,
0.9568122, 1.857045, -0.2647169, 1, 0, 0, 1, 1,
0.9647447, -0.9107003, 0.8876005, 0, 0, 0, 1, 1,
0.9647735, 0.6438742, 1.444546, 0, 0, 0, 1, 1,
0.9678161, -0.3026734, 3.499035, 0, 0, 0, 1, 1,
0.9697246, 0.7615261, 1.023682, 0, 0, 0, 1, 1,
0.9770842, -1.396652, 1.247008, 0, 0, 0, 1, 1,
0.9909566, -1.070795, 1.729849, 0, 0, 0, 1, 1,
0.9916597, -1.675743, 2.239881, 0, 0, 0, 1, 1,
0.9995843, -1.383172, 2.761716, 1, 1, 1, 1, 1,
1.000654, 0.04523414, 0.6897727, 1, 1, 1, 1, 1,
1.011561, -0.9840202, 2.001541, 1, 1, 1, 1, 1,
1.021541, -1.227828, 3.416233, 1, 1, 1, 1, 1,
1.025668, 0.6483763, 0.7044375, 1, 1, 1, 1, 1,
1.026621, 2.301546, 1.902405, 1, 1, 1, 1, 1,
1.026947, 0.3033992, 1.412848, 1, 1, 1, 1, 1,
1.028155, -0.3845969, 2.139534, 1, 1, 1, 1, 1,
1.028789, 1.786963, 0.8146298, 1, 1, 1, 1, 1,
1.034083, 0.601646, 3.138491, 1, 1, 1, 1, 1,
1.038427, -0.6945148, 0.9363022, 1, 1, 1, 1, 1,
1.04379, 0.364659, 0.1056581, 1, 1, 1, 1, 1,
1.044771, -1.465001, 3.823931, 1, 1, 1, 1, 1,
1.04515, 1.104895, 0.9125144, 1, 1, 1, 1, 1,
1.057426, 0.2642618, 0.5728197, 1, 1, 1, 1, 1,
1.059984, 1.031945, -0.6441111, 0, 0, 1, 1, 1,
1.063592, -0.176685, 0.9491792, 1, 0, 0, 1, 1,
1.066903, -0.6648739, 2.360824, 1, 0, 0, 1, 1,
1.067278, 0.3497508, 0.93491, 1, 0, 0, 1, 1,
1.070538, 0.566077, -0.1713772, 1, 0, 0, 1, 1,
1.075134, -1.709991, 2.29532, 1, 0, 0, 1, 1,
1.075439, 0.09908874, 1.436543, 0, 0, 0, 1, 1,
1.078252, 1.639305, 0.9137411, 0, 0, 0, 1, 1,
1.079947, 0.520989, 0.6094153, 0, 0, 0, 1, 1,
1.095408, 0.03259573, 1.188815, 0, 0, 0, 1, 1,
1.098248, 0.5854412, 0.8582583, 0, 0, 0, 1, 1,
1.109362, 0.1590689, 0.9514279, 0, 0, 0, 1, 1,
1.112334, 0.6242079, 1.687775, 0, 0, 0, 1, 1,
1.114225, 0.3128501, 1.018828, 1, 1, 1, 1, 1,
1.114941, 0.4483501, 0.4706923, 1, 1, 1, 1, 1,
1.118651, 0.2559569, 1.570529, 1, 1, 1, 1, 1,
1.118816, -1.042162, 2.060434, 1, 1, 1, 1, 1,
1.121815, 0.0804323, 0.225287, 1, 1, 1, 1, 1,
1.128391, 0.4549993, 0.3596145, 1, 1, 1, 1, 1,
1.128492, 0.2240731, 1.57331, 1, 1, 1, 1, 1,
1.132261, -1.220699, 2.137851, 1, 1, 1, 1, 1,
1.134778, 0.7703556, 1.413902, 1, 1, 1, 1, 1,
1.1354, -0.9038985, 2.724951, 1, 1, 1, 1, 1,
1.141472, 0.1712294, 1.736338, 1, 1, 1, 1, 1,
1.149472, -0.8877758, 0.5623829, 1, 1, 1, 1, 1,
1.170253, 2.118406, 1.08297, 1, 1, 1, 1, 1,
1.174229, -0.003640577, 1.318484, 1, 1, 1, 1, 1,
1.177224, -0.00379053, 2.826301, 1, 1, 1, 1, 1,
1.188565, -1.302704, 2.364488, 0, 0, 1, 1, 1,
1.195361, -0.0767478, 1.192911, 1, 0, 0, 1, 1,
1.201929, -0.8324486, 2.194681, 1, 0, 0, 1, 1,
1.205117, 0.9945799, 1.30736, 1, 0, 0, 1, 1,
1.205752, -2.129026, 2.876989, 1, 0, 0, 1, 1,
1.210951, 1.004201, -0.4299909, 1, 0, 0, 1, 1,
1.218547, -0.8726746, 2.819671, 0, 0, 0, 1, 1,
1.22717, 0.2249189, 0.3835249, 0, 0, 0, 1, 1,
1.2281, -0.06625839, 1.764977, 0, 0, 0, 1, 1,
1.234306, -0.459102, 1.957615, 0, 0, 0, 1, 1,
1.248549, -0.3275579, 0.9802369, 0, 0, 0, 1, 1,
1.251541, 0.3876353, 0.6488088, 0, 0, 0, 1, 1,
1.252547, -0.595349, 0.784319, 0, 0, 0, 1, 1,
1.254355, -1.960563, 2.429212, 1, 1, 1, 1, 1,
1.263853, -0.2562653, -0.2247221, 1, 1, 1, 1, 1,
1.267116, 3.509805, 1.084852, 1, 1, 1, 1, 1,
1.270582, 0.2933846, 1.118437, 1, 1, 1, 1, 1,
1.271367, 0.9958807, 1.638815, 1, 1, 1, 1, 1,
1.271886, -0.9739025, 1.812177, 1, 1, 1, 1, 1,
1.280182, 0.5003724, 0.5705071, 1, 1, 1, 1, 1,
1.281258, 1.591883, 0.1901, 1, 1, 1, 1, 1,
1.281986, -1.039701, 0.0129548, 1, 1, 1, 1, 1,
1.288752, 1.860047, -0.1640214, 1, 1, 1, 1, 1,
1.28988, 0.3328679, 0.4857238, 1, 1, 1, 1, 1,
1.28999, 2.079581, 0.3796011, 1, 1, 1, 1, 1,
1.304321, 0.5196794, 0.5871837, 1, 1, 1, 1, 1,
1.308275, 0.7309821, 1.989552, 1, 1, 1, 1, 1,
1.311818, -1.070484, 1.361922, 1, 1, 1, 1, 1,
1.313453, -0.1353814, 4.06337, 0, 0, 1, 1, 1,
1.315273, -1.586594, 3.538229, 1, 0, 0, 1, 1,
1.320689, -0.488288, 2.221437, 1, 0, 0, 1, 1,
1.322988, 1.037014, 0.4659864, 1, 0, 0, 1, 1,
1.353346, -0.9157502, 3.496592, 1, 0, 0, 1, 1,
1.357426, 0.886581, 1.200449, 1, 0, 0, 1, 1,
1.372479, 0.713882, 0.2009612, 0, 0, 0, 1, 1,
1.373639, -0.7030898, 2.118976, 0, 0, 0, 1, 1,
1.382568, 0.3530253, 3.61207, 0, 0, 0, 1, 1,
1.383606, 0.4010414, 1.514416, 0, 0, 0, 1, 1,
1.391667, -1.124611, 2.783478, 0, 0, 0, 1, 1,
1.398126, 1.060896, 1.038339, 0, 0, 0, 1, 1,
1.420489, 1.238168, 1.680041, 0, 0, 0, 1, 1,
1.421602, -0.2256407, 0.3854108, 1, 1, 1, 1, 1,
1.438581, 0.832759, 0.7810653, 1, 1, 1, 1, 1,
1.439824, 1.304126, 2.231643, 1, 1, 1, 1, 1,
1.444699, 2.254197, -1.275698, 1, 1, 1, 1, 1,
1.457686, 0.4060217, 3.107862, 1, 1, 1, 1, 1,
1.461617, -1.467627, 2.234242, 1, 1, 1, 1, 1,
1.475163, 0.1067194, 1.546808, 1, 1, 1, 1, 1,
1.488728, 0.8795408, 0.276223, 1, 1, 1, 1, 1,
1.495593, -0.2082005, 2.787112, 1, 1, 1, 1, 1,
1.497355, 0.01571821, 1.578152, 1, 1, 1, 1, 1,
1.499162, -0.4023542, 1.12486, 1, 1, 1, 1, 1,
1.512492, -0.6430246, 2.492016, 1, 1, 1, 1, 1,
1.528535, -0.2626214, 2.550867, 1, 1, 1, 1, 1,
1.530266, -0.762065, 4.089814, 1, 1, 1, 1, 1,
1.533802, 0.01527947, 2.122932, 1, 1, 1, 1, 1,
1.53989, -0.4487316, 0.8773085, 0, 0, 1, 1, 1,
1.54116, -0.1543483, 2.911781, 1, 0, 0, 1, 1,
1.549249, 0.1493733, 1.57604, 1, 0, 0, 1, 1,
1.549546, 1.545121, -0.04326161, 1, 0, 0, 1, 1,
1.554053, 0.1159821, 1.498244, 1, 0, 0, 1, 1,
1.576644, 1.707539, -0.6942688, 1, 0, 0, 1, 1,
1.58065, -0.04598627, 1.803934, 0, 0, 0, 1, 1,
1.58131, 1.590928, 0.1778477, 0, 0, 0, 1, 1,
1.591341, -0.03808317, 2.785764, 0, 0, 0, 1, 1,
1.593405, -0.2437124, 0.8112398, 0, 0, 0, 1, 1,
1.59351, 0.6669164, 1.754009, 0, 0, 0, 1, 1,
1.605898, -1.022825, 2.293593, 0, 0, 0, 1, 1,
1.60832, -0.7278239, 2.658252, 0, 0, 0, 1, 1,
1.618329, 0.3883861, 0.1269585, 1, 1, 1, 1, 1,
1.627534, -1.206819, 2.567009, 1, 1, 1, 1, 1,
1.629367, -0.493475, 3.079919, 1, 1, 1, 1, 1,
1.63663, -0.8668244, 2.491223, 1, 1, 1, 1, 1,
1.64154, 0.3696506, 1.815318, 1, 1, 1, 1, 1,
1.64155, -0.7300586, 1.263198, 1, 1, 1, 1, 1,
1.647954, -0.4635404, 2.040354, 1, 1, 1, 1, 1,
1.684747, -1.718332, 2.441374, 1, 1, 1, 1, 1,
1.687793, 0.6210569, 0.8379472, 1, 1, 1, 1, 1,
1.692846, 0.2261387, 2.31835, 1, 1, 1, 1, 1,
1.705747, 1.453574, -1.472514, 1, 1, 1, 1, 1,
1.706701, -2.124055, 1.084534, 1, 1, 1, 1, 1,
1.70676, 0.7022775, 1.294479, 1, 1, 1, 1, 1,
1.709499, 0.1174796, 0.9565594, 1, 1, 1, 1, 1,
1.711986, -1.42251, 1.252477, 1, 1, 1, 1, 1,
1.721626, 0.6844365, 0.8089939, 0, 0, 1, 1, 1,
1.725681, 0.414793, 0.2209675, 1, 0, 0, 1, 1,
1.749167, -0.2831321, 2.295355, 1, 0, 0, 1, 1,
1.756934, 0.1686852, 1.700983, 1, 0, 0, 1, 1,
1.779963, 0.8144897, 0.4459659, 1, 0, 0, 1, 1,
1.781896, -0.6506743, 2.171653, 1, 0, 0, 1, 1,
1.797052, -0.2969472, 3.85349, 0, 0, 0, 1, 1,
1.811005, 0.5088595, 1.661678, 0, 0, 0, 1, 1,
1.816008, -2.475678, 2.226752, 0, 0, 0, 1, 1,
1.823534, -0.5421336, 1.616036, 0, 0, 0, 1, 1,
1.83492, 0.4519455, 1.348079, 0, 0, 0, 1, 1,
1.845104, 0.6552301, 1.496706, 0, 0, 0, 1, 1,
1.85598, -0.336308, 1.072491, 0, 0, 0, 1, 1,
1.871605, 1.150882, 0.7073517, 1, 1, 1, 1, 1,
1.884239, 1.081438, 1.513257, 1, 1, 1, 1, 1,
1.893394, -1.801865, 2.712142, 1, 1, 1, 1, 1,
1.895636, 0.6998319, 2.13917, 1, 1, 1, 1, 1,
1.911992, 0.5323359, 2.222085, 1, 1, 1, 1, 1,
1.916399, 0.2296721, 3.231963, 1, 1, 1, 1, 1,
1.966466, -0.3711753, 1.132759, 1, 1, 1, 1, 1,
1.97773, -0.5169235, 0.8381668, 1, 1, 1, 1, 1,
1.990571, -0.1516967, 1.443425, 1, 1, 1, 1, 1,
2.001536, 0.2711859, 1.356248, 1, 1, 1, 1, 1,
2.011757, -1.274598, 3.090383, 1, 1, 1, 1, 1,
2.024715, 0.6731715, 1.941695, 1, 1, 1, 1, 1,
2.024925, 0.2151302, 0.6822661, 1, 1, 1, 1, 1,
2.036652, 1.477738, 2.161954, 1, 1, 1, 1, 1,
2.082938, 1.807677, 0.4273411, 1, 1, 1, 1, 1,
2.08725, -0.9872285, 2.402328, 0, 0, 1, 1, 1,
2.098104, -1.295068, 3.633574, 1, 0, 0, 1, 1,
2.137235, 1.00528, 0.4261644, 1, 0, 0, 1, 1,
2.145043, 1.559996, 0.7223264, 1, 0, 0, 1, 1,
2.152002, -1.904171, 1.296928, 1, 0, 0, 1, 1,
2.160504, 2.554088, 2.068276, 1, 0, 0, 1, 1,
2.201436, 0.4531407, 0.9189777, 0, 0, 0, 1, 1,
2.285411, -0.2220048, 0.6599398, 0, 0, 0, 1, 1,
2.318572, -0.4697912, 3.043122, 0, 0, 0, 1, 1,
2.325037, 0.5614077, 2.223017, 0, 0, 0, 1, 1,
2.391004, 1.584496, 0.705842, 0, 0, 0, 1, 1,
2.403407, -1.195121, 1.941975, 0, 0, 0, 1, 1,
2.424451, -0.5219131, 0.4316296, 0, 0, 0, 1, 1,
2.42857, -0.9564178, 2.710556, 1, 1, 1, 1, 1,
2.571297, 0.06029407, 1.941355, 1, 1, 1, 1, 1,
2.631439, 0.9110372, 0.5061534, 1, 1, 1, 1, 1,
2.739176, -3.91229, 1.474569, 1, 1, 1, 1, 1,
2.797909, 0.07610725, 2.36223, 1, 1, 1, 1, 1,
2.893723, 0.05419951, 2.209365, 1, 1, 1, 1, 1,
3.346064, -1.410966, 1.622816, 1, 1, 1, 1, 1
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
var radius = 9.744602;
var distance = 34.2275;
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
mvMatrix.translate( -0.277741, 0.201242, 0.1178772 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.2275);
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
