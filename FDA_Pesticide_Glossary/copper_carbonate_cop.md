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
-3.058471, -1.398747, -2.469416, 1, 0, 0, 1,
-2.759881, -0.7582901, -1.019597, 1, 0.007843138, 0, 1,
-2.674748, -1.281317, -2.948168, 1, 0.01176471, 0, 1,
-2.661232, 0.9090602, -0.5674801, 1, 0.01960784, 0, 1,
-2.625393, -0.9500207, -2.593997, 1, 0.02352941, 0, 1,
-2.546645, -0.2562248, -1.197652, 1, 0.03137255, 0, 1,
-2.528944, -1.339768, -1.17928, 1, 0.03529412, 0, 1,
-2.518643, -0.06760308, -2.318443, 1, 0.04313726, 0, 1,
-2.415067, -0.3202549, -2.343857, 1, 0.04705882, 0, 1,
-2.369843, 0.5473443, -0.9415118, 1, 0.05490196, 0, 1,
-2.281186, -0.8943818, -1.034145, 1, 0.05882353, 0, 1,
-2.263773, 1.504794, -1.134167, 1, 0.06666667, 0, 1,
-2.245703, -0.2921963, -1.152041, 1, 0.07058824, 0, 1,
-2.231676, -0.007713865, -1.257056, 1, 0.07843138, 0, 1,
-2.226701, -0.3949111, -2.848094, 1, 0.08235294, 0, 1,
-2.178688, -0.4745119, -1.46305, 1, 0.09019608, 0, 1,
-2.169889, -1.229445, -2.386183, 1, 0.09411765, 0, 1,
-2.162404, 0.4964559, -1.6908, 1, 0.1019608, 0, 1,
-2.110709, -0.642911, -2.061879, 1, 0.1098039, 0, 1,
-2.077685, -0.008708405, -1.220623, 1, 0.1137255, 0, 1,
-2.016164, -0.5172462, -1.304481, 1, 0.1215686, 0, 1,
-2.005359, -0.8880609, -2.215609, 1, 0.1254902, 0, 1,
-1.963433, 0.02298759, -2.548269, 1, 0.1333333, 0, 1,
-1.951435, 2.673651, -1.726022, 1, 0.1372549, 0, 1,
-1.946418, -0.1821437, -2.254653, 1, 0.145098, 0, 1,
-1.931853, -0.5484166, -2.301032, 1, 0.1490196, 0, 1,
-1.878836, -1.74731, -1.597643, 1, 0.1568628, 0, 1,
-1.858053, 1.702022, 1.520486, 1, 0.1607843, 0, 1,
-1.849244, 0.9815795, -1.631341, 1, 0.1686275, 0, 1,
-1.83039, -0.3565984, -1.186204, 1, 0.172549, 0, 1,
-1.794961, 0.06553113, -0.8256211, 1, 0.1803922, 0, 1,
-1.772754, 0.3769564, -0.02842998, 1, 0.1843137, 0, 1,
-1.770843, -0.6429538, -2.158824, 1, 0.1921569, 0, 1,
-1.765688, 0.2920231, -0.8891745, 1, 0.1960784, 0, 1,
-1.757871, 2.33795, -0.9052573, 1, 0.2039216, 0, 1,
-1.725501, 0.02161326, -0.5202803, 1, 0.2117647, 0, 1,
-1.705555, 0.02964986, -0.6011739, 1, 0.2156863, 0, 1,
-1.678895, 0.3780838, -1.914248, 1, 0.2235294, 0, 1,
-1.674334, 0.04789582, -0.9518458, 1, 0.227451, 0, 1,
-1.67415, -0.5624505, -1.518587, 1, 0.2352941, 0, 1,
-1.670426, -0.3082671, -0.2627333, 1, 0.2392157, 0, 1,
-1.659396, -0.2853592, -1.759205, 1, 0.2470588, 0, 1,
-1.642708, 0.1174564, -1.401978, 1, 0.2509804, 0, 1,
-1.627358, 1.657006, -0.2236442, 1, 0.2588235, 0, 1,
-1.618191, -0.2325165, -1.016797, 1, 0.2627451, 0, 1,
-1.614746, -0.6425362, -3.117166, 1, 0.2705882, 0, 1,
-1.602572, 2.799551, -0.7049828, 1, 0.2745098, 0, 1,
-1.600844, -0.3741387, -3.489717, 1, 0.282353, 0, 1,
-1.589023, 1.45061, -0.02828174, 1, 0.2862745, 0, 1,
-1.582202, -0.929689, -1.765211, 1, 0.2941177, 0, 1,
-1.56102, 0.8016514, -3.306243, 1, 0.3019608, 0, 1,
-1.5425, -1.522717, -2.683765, 1, 0.3058824, 0, 1,
-1.526357, 0.2771462, -1.789547, 1, 0.3137255, 0, 1,
-1.517685, -0.1283905, -1.835116, 1, 0.3176471, 0, 1,
-1.515201, 0.8661887, 0.4456647, 1, 0.3254902, 0, 1,
-1.508908, -0.1407749, -2.138647, 1, 0.3294118, 0, 1,
-1.487998, 1.322838, -2.291079, 1, 0.3372549, 0, 1,
-1.487803, -1.263792, -2.707924, 1, 0.3411765, 0, 1,
-1.486415, -0.1159562, -1.046321, 1, 0.3490196, 0, 1,
-1.474883, 0.03172331, -1.532552, 1, 0.3529412, 0, 1,
-1.474674, 1.074273, -0.8118821, 1, 0.3607843, 0, 1,
-1.473173, -0.08881554, -0.3733596, 1, 0.3647059, 0, 1,
-1.467699, -0.64601, -1.491935, 1, 0.372549, 0, 1,
-1.466973, 1.827292, 1.143159, 1, 0.3764706, 0, 1,
-1.462459, 0.08960781, 0.0671467, 1, 0.3843137, 0, 1,
-1.449036, 0.4082878, -1.343979, 1, 0.3882353, 0, 1,
-1.444283, -1.065468, -0.9920439, 1, 0.3960784, 0, 1,
-1.437546, -1.105348, -3.403201, 1, 0.4039216, 0, 1,
-1.433129, 0.4061598, -0.1160115, 1, 0.4078431, 0, 1,
-1.432055, -0.7712396, -1.079441, 1, 0.4156863, 0, 1,
-1.42249, -0.5146571, -0.5711139, 1, 0.4196078, 0, 1,
-1.394302, -1.7004, -2.003632, 1, 0.427451, 0, 1,
-1.390218, 1.241963, -1.509606, 1, 0.4313726, 0, 1,
-1.388292, 0.5616937, 0.6086692, 1, 0.4392157, 0, 1,
-1.387661, -0.9317306, -3.267596, 1, 0.4431373, 0, 1,
-1.370037, -0.3917202, -0.5901032, 1, 0.4509804, 0, 1,
-1.369675, -1.428518, -1.532965, 1, 0.454902, 0, 1,
-1.365438, 0.8313196, -3.097258, 1, 0.4627451, 0, 1,
-1.364381, -0.003875033, -0.9321716, 1, 0.4666667, 0, 1,
-1.364217, 1.196147, -0.02796178, 1, 0.4745098, 0, 1,
-1.361191, 0.02446101, -1.891687, 1, 0.4784314, 0, 1,
-1.358077, -0.593742, -1.378893, 1, 0.4862745, 0, 1,
-1.355253, -1.340629, -1.308367, 1, 0.4901961, 0, 1,
-1.353629, -0.3311298, -1.367855, 1, 0.4980392, 0, 1,
-1.344025, 1.506491, -0.4831709, 1, 0.5058824, 0, 1,
-1.341435, 0.5698321, -1.96405, 1, 0.509804, 0, 1,
-1.334779, 0.6374658, -0.5573041, 1, 0.5176471, 0, 1,
-1.332896, -0.1245629, -2.64518, 1, 0.5215687, 0, 1,
-1.33209, -0.4989646, -2.118768, 1, 0.5294118, 0, 1,
-1.329614, 0.06405605, -2.896945, 1, 0.5333334, 0, 1,
-1.328049, 0.3332583, -3.360789, 1, 0.5411765, 0, 1,
-1.326578, 1.754995, -1.369511, 1, 0.5450981, 0, 1,
-1.320331, 0.6841329, -1.842314, 1, 0.5529412, 0, 1,
-1.316551, -1.547672, -3.392257, 1, 0.5568628, 0, 1,
-1.302988, 0.1256328, -2.394016, 1, 0.5647059, 0, 1,
-1.300105, 0.108245, -1.416437, 1, 0.5686275, 0, 1,
-1.249165, 0.4454937, 0.06013013, 1, 0.5764706, 0, 1,
-1.246183, 1.526127, -2.353628, 1, 0.5803922, 0, 1,
-1.243769, -0.6460089, -0.755227, 1, 0.5882353, 0, 1,
-1.243391, 1.372931, 0.3042749, 1, 0.5921569, 0, 1,
-1.240103, 0.8045868, -0.111591, 1, 0.6, 0, 1,
-1.239595, -0.4837262, -2.723431, 1, 0.6078432, 0, 1,
-1.238807, -0.713851, -4.501328, 1, 0.6117647, 0, 1,
-1.238268, 1.046156, -1.185564, 1, 0.6196079, 0, 1,
-1.236214, 1.458609, -1.939013, 1, 0.6235294, 0, 1,
-1.235244, -0.2962555, -0.8228807, 1, 0.6313726, 0, 1,
-1.229652, -0.6420648, -2.240032, 1, 0.6352941, 0, 1,
-1.225322, -0.2210739, -3.503937, 1, 0.6431373, 0, 1,
-1.221151, -0.05047254, -0.829079, 1, 0.6470588, 0, 1,
-1.220732, -0.777216, -2.226743, 1, 0.654902, 0, 1,
-1.21922, -1.938717, -3.838768, 1, 0.6588235, 0, 1,
-1.215261, -1.186416, -0.8607876, 1, 0.6666667, 0, 1,
-1.21459, 1.63154, -1.112298, 1, 0.6705883, 0, 1,
-1.211149, -0.003594375, -2.613198, 1, 0.6784314, 0, 1,
-1.207392, 0.3520986, -0.2932026, 1, 0.682353, 0, 1,
-1.201164, 0.4349529, -1.689523, 1, 0.6901961, 0, 1,
-1.197531, -0.4302053, -1.408652, 1, 0.6941177, 0, 1,
-1.196174, 0.2712539, -0.9435029, 1, 0.7019608, 0, 1,
-1.195809, -1.773278, -1.77695, 1, 0.7098039, 0, 1,
-1.190965, 0.7384178, -1.181331, 1, 0.7137255, 0, 1,
-1.187891, 0.7320669, -1.978433, 1, 0.7215686, 0, 1,
-1.170839, 0.7144954, -0.08757586, 1, 0.7254902, 0, 1,
-1.167268, 0.09219691, -2.118351, 1, 0.7333333, 0, 1,
-1.165246, 0.440613, -1.087582, 1, 0.7372549, 0, 1,
-1.160964, -0.7214773, -2.471386, 1, 0.7450981, 0, 1,
-1.157125, -0.3594184, -1.403731, 1, 0.7490196, 0, 1,
-1.156987, -0.8591383, -2.280252, 1, 0.7568628, 0, 1,
-1.15033, -1.371589, -2.771847, 1, 0.7607843, 0, 1,
-1.14447, -1.074709, -2.867329, 1, 0.7686275, 0, 1,
-1.13317, 0.5502152, -2.066331, 1, 0.772549, 0, 1,
-1.133132, -0.5919474, -1.712267, 1, 0.7803922, 0, 1,
-1.131514, 0.09068257, 0.2078556, 1, 0.7843137, 0, 1,
-1.128697, 0.2789223, -2.452762, 1, 0.7921569, 0, 1,
-1.127714, -0.352383, -1.658297, 1, 0.7960784, 0, 1,
-1.12642, 1.492679, -1.093835, 1, 0.8039216, 0, 1,
-1.124868, -0.3932448, -0.9770566, 1, 0.8117647, 0, 1,
-1.124537, 0.9290713, -2.169252, 1, 0.8156863, 0, 1,
-1.117067, -0.1963289, -1.504861, 1, 0.8235294, 0, 1,
-1.115029, 0.980279, -0.7721407, 1, 0.827451, 0, 1,
-1.111587, 1.445071, 0.2907752, 1, 0.8352941, 0, 1,
-1.108065, 1.007583, -1.302129, 1, 0.8392157, 0, 1,
-1.107267, 0.3156683, -1.375027, 1, 0.8470588, 0, 1,
-1.106786, 1.054268, -0.6738412, 1, 0.8509804, 0, 1,
-1.09357, 0.07138298, -2.298045, 1, 0.8588235, 0, 1,
-1.090895, -0.5161285, -2.368518, 1, 0.8627451, 0, 1,
-1.090104, 0.8071833, -0.372865, 1, 0.8705882, 0, 1,
-1.088876, -1.23381, -1.864298, 1, 0.8745098, 0, 1,
-1.075456, -0.2619185, -2.049773, 1, 0.8823529, 0, 1,
-1.065838, -1.265094, -2.29934, 1, 0.8862745, 0, 1,
-1.058443, -1.255711, -2.669444, 1, 0.8941177, 0, 1,
-1.054792, -0.6227058, -2.298144, 1, 0.8980392, 0, 1,
-1.051294, 0.6707681, -0.5423797, 1, 0.9058824, 0, 1,
-1.044354, 0.6204842, -1.103312, 1, 0.9137255, 0, 1,
-1.043567, -1.368048, -2.457692, 1, 0.9176471, 0, 1,
-1.035901, 1.492304, -0.4802165, 1, 0.9254902, 0, 1,
-1.025591, -1.12963, -3.239048, 1, 0.9294118, 0, 1,
-1.023288, -0.153504, -2.099169, 1, 0.9372549, 0, 1,
-1.021644, -0.1719731, -2.636121, 1, 0.9411765, 0, 1,
-1.016678, -1.247124, -2.634947, 1, 0.9490196, 0, 1,
-1.011847, -0.8433923, -2.427519, 1, 0.9529412, 0, 1,
-1.011338, -0.5785668, -2.453784, 1, 0.9607843, 0, 1,
-1.006234, -0.785428, -2.945552, 1, 0.9647059, 0, 1,
-1.004544, 0.2247305, -1.675523, 1, 0.972549, 0, 1,
-0.9967263, 1.797995, 0.3410865, 1, 0.9764706, 0, 1,
-0.9962381, -0.0709783, -1.057362, 1, 0.9843137, 0, 1,
-0.9904901, 0.68253, -2.207558, 1, 0.9882353, 0, 1,
-0.9874386, 0.3900713, -2.060576, 1, 0.9960784, 0, 1,
-0.9807942, 0.1826184, -2.732339, 0.9960784, 1, 0, 1,
-0.9807861, -1.407482, -0.2769675, 0.9921569, 1, 0, 1,
-0.9805257, -0.06953069, -1.907564, 0.9843137, 1, 0, 1,
-0.9780615, 0.4779218, -2.297024, 0.9803922, 1, 0, 1,
-0.9741601, 0.5469527, 0.8281339, 0.972549, 1, 0, 1,
-0.9635861, 0.8299546, -2.819422, 0.9686275, 1, 0, 1,
-0.9589616, 1.780748, -0.1687899, 0.9607843, 1, 0, 1,
-0.9511459, 1.502288, -0.2477215, 0.9568627, 1, 0, 1,
-0.946273, -0.3218218, -1.111032, 0.9490196, 1, 0, 1,
-0.9448399, -0.7375396, -2.342037, 0.945098, 1, 0, 1,
-0.9431583, -0.1675657, -0.6103292, 0.9372549, 1, 0, 1,
-0.9293269, 0.8757306, -0.4165346, 0.9333333, 1, 0, 1,
-0.9276466, -0.7449579, -2.806454, 0.9254902, 1, 0, 1,
-0.9111833, -1.041166, -4.410095, 0.9215686, 1, 0, 1,
-0.9109854, 0.6273155, -0.3517501, 0.9137255, 1, 0, 1,
-0.903678, 0.6582401, 0.1919103, 0.9098039, 1, 0, 1,
-0.8942012, 2.509498, 0.7410787, 0.9019608, 1, 0, 1,
-0.8868552, -0.6159054, -1.554204, 0.8941177, 1, 0, 1,
-0.8866083, 0.5489572, -2.326577, 0.8901961, 1, 0, 1,
-0.883571, -0.06537982, -0.1059969, 0.8823529, 1, 0, 1,
-0.8832864, -1.554464, 0.1492032, 0.8784314, 1, 0, 1,
-0.8832529, 1.789416, -0.5773787, 0.8705882, 1, 0, 1,
-0.8791777, -0.01690062, -1.318405, 0.8666667, 1, 0, 1,
-0.878305, -0.03492536, -3.869201, 0.8588235, 1, 0, 1,
-0.8686686, -0.7164622, -1.997656, 0.854902, 1, 0, 1,
-0.8667741, 0.9896104, -1.131569, 0.8470588, 1, 0, 1,
-0.865661, -1.971383, -2.382082, 0.8431373, 1, 0, 1,
-0.8621479, -0.6144474, -4.210369, 0.8352941, 1, 0, 1,
-0.860616, -0.8065806, -1.643247, 0.8313726, 1, 0, 1,
-0.8578457, -1.110409, -0.7501704, 0.8235294, 1, 0, 1,
-0.849396, 1.140845, -0.848503, 0.8196079, 1, 0, 1,
-0.8445309, -0.7661275, -2.900773, 0.8117647, 1, 0, 1,
-0.8433062, -1.169364, -1.572841, 0.8078431, 1, 0, 1,
-0.8430599, -0.00861631, -2.993655, 0.8, 1, 0, 1,
-0.842977, -0.3340458, -0.2653996, 0.7921569, 1, 0, 1,
-0.8419834, 0.7917101, -0.615218, 0.7882353, 1, 0, 1,
-0.8380535, 0.5803272, -1.302001, 0.7803922, 1, 0, 1,
-0.8379413, -0.9264897, -2.080671, 0.7764706, 1, 0, 1,
-0.8366107, 1.305454, -1.740597, 0.7686275, 1, 0, 1,
-0.8338493, -1.462247, -1.35835, 0.7647059, 1, 0, 1,
-0.8332971, -1.062747, -1.718805, 0.7568628, 1, 0, 1,
-0.8285327, 0.1640737, -1.573359, 0.7529412, 1, 0, 1,
-0.8280368, 1.066357, -1.022601, 0.7450981, 1, 0, 1,
-0.8249472, -0.1863118, -1.595237, 0.7411765, 1, 0, 1,
-0.816977, 1.345432, 0.2682702, 0.7333333, 1, 0, 1,
-0.8076657, 0.4601771, 2.561562, 0.7294118, 1, 0, 1,
-0.8047435, 0.3005765, -1.177441, 0.7215686, 1, 0, 1,
-0.7921796, 0.88271, -0.9753215, 0.7176471, 1, 0, 1,
-0.7897804, 0.2638909, -2.89309, 0.7098039, 1, 0, 1,
-0.7896702, 1.538313, -1.579444, 0.7058824, 1, 0, 1,
-0.7831981, -0.3071919, -1.360157, 0.6980392, 1, 0, 1,
-0.7773548, -1.331786, -2.536359, 0.6901961, 1, 0, 1,
-0.7725448, 0.3243268, -1.900968, 0.6862745, 1, 0, 1,
-0.7683073, -1.615539, -1.83335, 0.6784314, 1, 0, 1,
-0.7682046, 0.3324621, -0.884322, 0.6745098, 1, 0, 1,
-0.7652403, 0.6969083, -0.3081643, 0.6666667, 1, 0, 1,
-0.764569, 0.6355417, -0.8890213, 0.6627451, 1, 0, 1,
-0.7633715, 1.292749, -1.421933, 0.654902, 1, 0, 1,
-0.7626759, 0.2953418, -2.186516, 0.6509804, 1, 0, 1,
-0.7597855, 0.6698757, -0.7999341, 0.6431373, 1, 0, 1,
-0.7574224, -1.250248, -2.639426, 0.6392157, 1, 0, 1,
-0.7501919, 0.1604913, -1.993033, 0.6313726, 1, 0, 1,
-0.7464141, -0.7004753, -2.563549, 0.627451, 1, 0, 1,
-0.7458249, 0.3527479, -0.583902, 0.6196079, 1, 0, 1,
-0.7436789, -0.0284459, 0.8863944, 0.6156863, 1, 0, 1,
-0.7390602, -1.065735, -2.814247, 0.6078432, 1, 0, 1,
-0.7384032, 1.044288, -0.7208115, 0.6039216, 1, 0, 1,
-0.7372406, 0.8595808, -0.1786391, 0.5960785, 1, 0, 1,
-0.7359669, -0.2034049, -2.595382, 0.5882353, 1, 0, 1,
-0.733921, -1.470716, -3.360305, 0.5843138, 1, 0, 1,
-0.7331091, -2.329933, -3.816342, 0.5764706, 1, 0, 1,
-0.732231, 0.3889103, -1.600235, 0.572549, 1, 0, 1,
-0.731776, -0.6964465, -1.868099, 0.5647059, 1, 0, 1,
-0.7313468, 1.30836, -0.1526255, 0.5607843, 1, 0, 1,
-0.7305285, -0.822525, -1.93833, 0.5529412, 1, 0, 1,
-0.7200265, 1.137583, 0.1582794, 0.5490196, 1, 0, 1,
-0.7156508, -0.4545484, -1.083333, 0.5411765, 1, 0, 1,
-0.7111124, 0.7731564, -0.1102413, 0.5372549, 1, 0, 1,
-0.7096764, -1.632941, -3.222935, 0.5294118, 1, 0, 1,
-0.7072281, -0.2127184, -1.451264, 0.5254902, 1, 0, 1,
-0.7032054, -1.324693, -1.621423, 0.5176471, 1, 0, 1,
-0.6937765, -0.07866686, 0.1994218, 0.5137255, 1, 0, 1,
-0.6934336, 0.1163313, -0.8538827, 0.5058824, 1, 0, 1,
-0.6906034, -0.9640176, -2.403739, 0.5019608, 1, 0, 1,
-0.6902044, -1.063154, -1.729731, 0.4941176, 1, 0, 1,
-0.6886257, -0.4220258, -3.336437, 0.4862745, 1, 0, 1,
-0.6877358, -0.9527848, -1.598449, 0.4823529, 1, 0, 1,
-0.6853263, -1.749957, -3.913435, 0.4745098, 1, 0, 1,
-0.6852269, -0.4169532, -3.210611, 0.4705882, 1, 0, 1,
-0.6810398, -0.2870978, -2.708497, 0.4627451, 1, 0, 1,
-0.6773624, 0.4504864, -1.691215, 0.4588235, 1, 0, 1,
-0.674878, -0.8021531, -1.122908, 0.4509804, 1, 0, 1,
-0.673579, -1.354702, -1.974708, 0.4470588, 1, 0, 1,
-0.671979, -2.042912, -3.459259, 0.4392157, 1, 0, 1,
-0.6712163, 0.09515245, -2.261515, 0.4352941, 1, 0, 1,
-0.6629236, -0.7769673, -2.444764, 0.427451, 1, 0, 1,
-0.6592, 0.5596218, -2.341543, 0.4235294, 1, 0, 1,
-0.6549997, 0.6145108, -2.01503, 0.4156863, 1, 0, 1,
-0.651199, -0.3816561, -2.138139, 0.4117647, 1, 0, 1,
-0.6507061, 0.1126815, -0.8473594, 0.4039216, 1, 0, 1,
-0.6492569, -0.7770939, -2.5288, 0.3960784, 1, 0, 1,
-0.6413438, -0.3136769, -2.986976, 0.3921569, 1, 0, 1,
-0.6390625, -2.052713, -2.504823, 0.3843137, 1, 0, 1,
-0.6330251, 0.3379654, -2.007141, 0.3803922, 1, 0, 1,
-0.6322343, 0.01375865, -0.8087668, 0.372549, 1, 0, 1,
-0.6275572, -0.1000439, -1.26486, 0.3686275, 1, 0, 1,
-0.6275188, 0.7297052, 0.5129294, 0.3607843, 1, 0, 1,
-0.6242592, -0.2833135, -2.05354, 0.3568628, 1, 0, 1,
-0.6233454, 0.7711334, 0.2098317, 0.3490196, 1, 0, 1,
-0.6122226, -0.2504374, -0.9375665, 0.345098, 1, 0, 1,
-0.611519, 0.6835445, -2.442612, 0.3372549, 1, 0, 1,
-0.6075439, 1.067077, 0.1052134, 0.3333333, 1, 0, 1,
-0.6066766, -0.4116406, -3.375591, 0.3254902, 1, 0, 1,
-0.606382, -0.233224, -0.41627, 0.3215686, 1, 0, 1,
-0.6042293, -0.7949229, -0.7575182, 0.3137255, 1, 0, 1,
-0.6013086, 0.3829376, 0.5465519, 0.3098039, 1, 0, 1,
-0.5993481, -0.6622913, -0.9092962, 0.3019608, 1, 0, 1,
-0.5958375, -0.7238681, -2.055256, 0.2941177, 1, 0, 1,
-0.5912294, 0.7713593, 0.3557619, 0.2901961, 1, 0, 1,
-0.5906258, 1.631428, -0.2811522, 0.282353, 1, 0, 1,
-0.5904059, 1.039204, 0.2671321, 0.2784314, 1, 0, 1,
-0.5889682, 1.558258, 0.15462, 0.2705882, 1, 0, 1,
-0.5876596, -0.8107979, -2.318192, 0.2666667, 1, 0, 1,
-0.5853843, -0.4051543, -3.515633, 0.2588235, 1, 0, 1,
-0.578142, 0.1019685, -3.652423, 0.254902, 1, 0, 1,
-0.5750255, -2.043697, -2.284627, 0.2470588, 1, 0, 1,
-0.5746945, -0.2942762, -3.48389, 0.2431373, 1, 0, 1,
-0.5744685, -0.358586, -1.917175, 0.2352941, 1, 0, 1,
-0.5735671, 0.8628985, -0.264464, 0.2313726, 1, 0, 1,
-0.5723147, -1.625028, -4.025791, 0.2235294, 1, 0, 1,
-0.5675899, -0.6529678, -1.835187, 0.2196078, 1, 0, 1,
-0.5639954, -0.2628947, -0.8878144, 0.2117647, 1, 0, 1,
-0.5550076, 0.7812467, -3.124429, 0.2078431, 1, 0, 1,
-0.5548593, -0.9122562, -2.407436, 0.2, 1, 0, 1,
-0.5533524, -0.3835822, -3.198256, 0.1921569, 1, 0, 1,
-0.5533296, -0.68909, -3.185539, 0.1882353, 1, 0, 1,
-0.5474089, 0.9981093, -0.392715, 0.1803922, 1, 0, 1,
-0.546525, -0.1350504, -3.556708, 0.1764706, 1, 0, 1,
-0.542892, 0.01886172, -0.9091149, 0.1686275, 1, 0, 1,
-0.542545, -0.4333733, -2.66538, 0.1647059, 1, 0, 1,
-0.5385349, 0.2437877, -0.5574484, 0.1568628, 1, 0, 1,
-0.5376272, -0.960647, -2.505962, 0.1529412, 1, 0, 1,
-0.5325024, 0.400397, -2.048045, 0.145098, 1, 0, 1,
-0.5323571, 0.3824641, -0.6789771, 0.1411765, 1, 0, 1,
-0.5258532, 0.9525517, -0.3146736, 0.1333333, 1, 0, 1,
-0.5243746, -2.434807, -2.069572, 0.1294118, 1, 0, 1,
-0.5227785, 1.576002, 0.08161521, 0.1215686, 1, 0, 1,
-0.5176594, 1.609134, -1.018769, 0.1176471, 1, 0, 1,
-0.5149066, 0.4280155, -0.01105139, 0.1098039, 1, 0, 1,
-0.5076455, 1.988232, -1.644843, 0.1058824, 1, 0, 1,
-0.495634, -1.284415, -2.586438, 0.09803922, 1, 0, 1,
-0.4943784, -0.5346381, -3.750937, 0.09019608, 1, 0, 1,
-0.4914701, 0.77343, -0.3763295, 0.08627451, 1, 0, 1,
-0.4853726, -0.1781992, -1.154471, 0.07843138, 1, 0, 1,
-0.4844534, 0.08420552, -1.636582, 0.07450981, 1, 0, 1,
-0.4781472, 1.33815, -1.503299, 0.06666667, 1, 0, 1,
-0.4772475, -0.2508463, -1.272442, 0.0627451, 1, 0, 1,
-0.4712175, 1.833187, -0.3737437, 0.05490196, 1, 0, 1,
-0.4687876, -0.1085513, -1.595592, 0.05098039, 1, 0, 1,
-0.4632216, -0.5673998, -2.305467, 0.04313726, 1, 0, 1,
-0.4618992, -0.180295, -3.886374, 0.03921569, 1, 0, 1,
-0.4526272, 0.3027335, -0.05207109, 0.03137255, 1, 0, 1,
-0.4467876, -1.156643, -2.81999, 0.02745098, 1, 0, 1,
-0.4428186, 0.5681607, -0.06767064, 0.01960784, 1, 0, 1,
-0.4358959, 0.1993535, -1.678911, 0.01568628, 1, 0, 1,
-0.4321043, -0.348813, -2.303903, 0.007843138, 1, 0, 1,
-0.4319348, 1.781685, -0.2025275, 0.003921569, 1, 0, 1,
-0.43134, 0.07844076, 0.0833923, 0, 1, 0.003921569, 1,
-0.4307935, -0.09441315, -1.671107, 0, 1, 0.01176471, 1,
-0.428033, -1.770668, -3.57339, 0, 1, 0.01568628, 1,
-0.4271004, -0.3219565, -1.382203, 0, 1, 0.02352941, 1,
-0.4204319, 0.4676552, -2.87367, 0, 1, 0.02745098, 1,
-0.417031, 0.8224831, -1.638031, 0, 1, 0.03529412, 1,
-0.4104116, -0.3649942, -3.352506, 0, 1, 0.03921569, 1,
-0.4080997, 0.4909767, 0.4366269, 0, 1, 0.04705882, 1,
-0.4015248, 0.4884779, -0.5350731, 0, 1, 0.05098039, 1,
-0.3967153, 0.03484061, -0.2131334, 0, 1, 0.05882353, 1,
-0.394483, 0.7601328, -1.088199, 0, 1, 0.0627451, 1,
-0.3939264, -1.492776, -2.245665, 0, 1, 0.07058824, 1,
-0.3931322, -0.03413518, -1.72428, 0, 1, 0.07450981, 1,
-0.3931225, -0.3110156, -2.338617, 0, 1, 0.08235294, 1,
-0.3930772, -0.5745129, -2.667012, 0, 1, 0.08627451, 1,
-0.3930467, 0.6648472, 0.06782275, 0, 1, 0.09411765, 1,
-0.3917013, -1.627575, -4.591654, 0, 1, 0.1019608, 1,
-0.3914084, 1.813586, -0.9197029, 0, 1, 0.1058824, 1,
-0.3878957, 3.766337, 0.6378832, 0, 1, 0.1137255, 1,
-0.3873269, -0.2886521, -1.496511, 0, 1, 0.1176471, 1,
-0.387089, -1.501859, -3.613006, 0, 1, 0.1254902, 1,
-0.3816597, 0.2503459, -2.104765, 0, 1, 0.1294118, 1,
-0.3807747, 1.02054, -2.798357, 0, 1, 0.1372549, 1,
-0.3743666, 0.7896003, -1.441351, 0, 1, 0.1411765, 1,
-0.369909, 0.001914398, 0.1720951, 0, 1, 0.1490196, 1,
-0.3682926, 1.466911, 0.6627753, 0, 1, 0.1529412, 1,
-0.367498, -0.3919856, -2.099049, 0, 1, 0.1607843, 1,
-0.3661898, 0.4745693, -1.164776, 0, 1, 0.1647059, 1,
-0.3652411, 1.145812, 0.2202599, 0, 1, 0.172549, 1,
-0.363359, -1.929275, -3.045224, 0, 1, 0.1764706, 1,
-0.3605092, -0.7543179, -3.06355, 0, 1, 0.1843137, 1,
-0.3599639, -0.2349887, -1.232802, 0, 1, 0.1882353, 1,
-0.3594355, 1.351198, -1.037033, 0, 1, 0.1960784, 1,
-0.3557843, -0.4565408, -3.00447, 0, 1, 0.2039216, 1,
-0.3504246, -1.688421, -2.716418, 0, 1, 0.2078431, 1,
-0.3491941, 0.2642377, -1.529572, 0, 1, 0.2156863, 1,
-0.3471301, -2.841897, -3.675464, 0, 1, 0.2196078, 1,
-0.3468504, 0.1185014, 1.799626, 0, 1, 0.227451, 1,
-0.344528, -0.5288888, -3.556639, 0, 1, 0.2313726, 1,
-0.3431055, 1.860018, -1.553529, 0, 1, 0.2392157, 1,
-0.3420511, -0.2909869, -2.881906, 0, 1, 0.2431373, 1,
-0.3416877, 0.6314104, 0.00576019, 0, 1, 0.2509804, 1,
-0.3367154, -1.411957, -1.847131, 0, 1, 0.254902, 1,
-0.3318388, 0.2624281, -1.383559, 0, 1, 0.2627451, 1,
-0.3284028, 2.282565, 0.7472115, 0, 1, 0.2666667, 1,
-0.3283811, -0.410081, -3.205483, 0, 1, 0.2745098, 1,
-0.3276475, -0.1343399, -0.7056518, 0, 1, 0.2784314, 1,
-0.3248654, -2.841271, -3.177317, 0, 1, 0.2862745, 1,
-0.3213499, 0.8691329, 0.1721467, 0, 1, 0.2901961, 1,
-0.3179507, 0.2265225, -1.166602, 0, 1, 0.2980392, 1,
-0.3141319, -0.6726472, -3.721127, 0, 1, 0.3058824, 1,
-0.3098121, 0.8267736, -0.1199172, 0, 1, 0.3098039, 1,
-0.3061607, -0.7084595, -3.162787, 0, 1, 0.3176471, 1,
-0.3055613, -0.6513566, -3.418624, 0, 1, 0.3215686, 1,
-0.304722, -0.7420775, -2.993257, 0, 1, 0.3294118, 1,
-0.2999811, 0.9234578, -1.772456, 0, 1, 0.3333333, 1,
-0.2968808, 0.9568651, -0.6761523, 0, 1, 0.3411765, 1,
-0.2961565, -0.3628441, -2.707884, 0, 1, 0.345098, 1,
-0.2891689, 0.4668905, -0.3074646, 0, 1, 0.3529412, 1,
-0.2864576, -1.003532, -3.375322, 0, 1, 0.3568628, 1,
-0.2860862, 0.4331844, -0.2419004, 0, 1, 0.3647059, 1,
-0.2839135, -0.3606353, -3.395688, 0, 1, 0.3686275, 1,
-0.2800289, 1.226989, -0.2741661, 0, 1, 0.3764706, 1,
-0.2791316, 0.1038168, -2.903253, 0, 1, 0.3803922, 1,
-0.2775632, 0.9066435, -1.032964, 0, 1, 0.3882353, 1,
-0.2755445, 0.2711472, -0.3540916, 0, 1, 0.3921569, 1,
-0.2717526, 1.214454, -0.6514465, 0, 1, 0.4, 1,
-0.2705325, 0.1030293, -1.160822, 0, 1, 0.4078431, 1,
-0.2683986, -1.31313, -2.819992, 0, 1, 0.4117647, 1,
-0.2681655, -1.964721, -1.797678, 0, 1, 0.4196078, 1,
-0.2680702, -0.3880434, -0.3008779, 0, 1, 0.4235294, 1,
-0.2679634, 1.278693, 1.188613, 0, 1, 0.4313726, 1,
-0.2657165, -0.3306153, -3.492592, 0, 1, 0.4352941, 1,
-0.2628035, -0.2893968, -1.912846, 0, 1, 0.4431373, 1,
-0.2609353, 1.316955, -0.9831554, 0, 1, 0.4470588, 1,
-0.2578374, -0.005379498, -1.442217, 0, 1, 0.454902, 1,
-0.2493435, -0.4278511, -3.286301, 0, 1, 0.4588235, 1,
-0.2491223, -0.8791343, -3.382955, 0, 1, 0.4666667, 1,
-0.2460773, 1.000018, -0.7067918, 0, 1, 0.4705882, 1,
-0.2433296, -0.06190677, -2.251171, 0, 1, 0.4784314, 1,
-0.23402, -0.04957886, -1.443714, 0, 1, 0.4823529, 1,
-0.2236878, 1.260005, -1.331127, 0, 1, 0.4901961, 1,
-0.218098, 0.1983049, -0.9197855, 0, 1, 0.4941176, 1,
-0.2160834, 0.9085925, -0.5817877, 0, 1, 0.5019608, 1,
-0.213902, 0.3141345, 0.08628129, 0, 1, 0.509804, 1,
-0.2102293, 0.1550189, -0.7076653, 0, 1, 0.5137255, 1,
-0.2077677, -0.2121785, -1.934524, 0, 1, 0.5215687, 1,
-0.2076617, -1.379288, -2.501967, 0, 1, 0.5254902, 1,
-0.2003506, -1.926093, -2.201638, 0, 1, 0.5333334, 1,
-0.1995019, 0.7367138, -0.1882107, 0, 1, 0.5372549, 1,
-0.1944524, 0.8111253, -1.048671, 0, 1, 0.5450981, 1,
-0.1930851, 0.3764842, -0.1572235, 0, 1, 0.5490196, 1,
-0.1921141, 1.034269, 0.139033, 0, 1, 0.5568628, 1,
-0.1887262, -0.4484851, -3.474579, 0, 1, 0.5607843, 1,
-0.1871221, -1.627581, -2.133551, 0, 1, 0.5686275, 1,
-0.1837445, -1.969682, -1.999692, 0, 1, 0.572549, 1,
-0.1809216, -0.4351814, -4.71323, 0, 1, 0.5803922, 1,
-0.1772142, -0.1088361, -2.100015, 0, 1, 0.5843138, 1,
-0.1748654, 0.9574561, 0.899704, 0, 1, 0.5921569, 1,
-0.169942, 0.2185998, -1.031466, 0, 1, 0.5960785, 1,
-0.1662628, -0.4631949, -1.731647, 0, 1, 0.6039216, 1,
-0.1625207, 1.503337, 1.523041, 0, 1, 0.6117647, 1,
-0.1618226, 1.247486, -0.7891511, 0, 1, 0.6156863, 1,
-0.1615523, 0.3448672, 0.3424744, 0, 1, 0.6235294, 1,
-0.159049, -0.9112018, -3.361344, 0, 1, 0.627451, 1,
-0.1502119, -1.046507, -0.884063, 0, 1, 0.6352941, 1,
-0.1488709, 1.14355, 0.8588082, 0, 1, 0.6392157, 1,
-0.1463035, -2.088514, -3.870507, 0, 1, 0.6470588, 1,
-0.1427531, -1.664598, -3.132423, 0, 1, 0.6509804, 1,
-0.1375572, -0.7372122, -2.330225, 0, 1, 0.6588235, 1,
-0.1359098, -1.101768, -3.854146, 0, 1, 0.6627451, 1,
-0.1331087, 0.4123425, -0.04025929, 0, 1, 0.6705883, 1,
-0.1329292, -0.04570241, -1.540066, 0, 1, 0.6745098, 1,
-0.1315093, 1.141126, 0.6008242, 0, 1, 0.682353, 1,
-0.1249775, -1.636955, -2.444879, 0, 1, 0.6862745, 1,
-0.1209221, -0.9624938, -2.999127, 0, 1, 0.6941177, 1,
-0.1170968, -0.1866263, -1.680022, 0, 1, 0.7019608, 1,
-0.1166317, 0.6290404, 1.083292, 0, 1, 0.7058824, 1,
-0.1157142, -0.63378, -2.651027, 0, 1, 0.7137255, 1,
-0.1133019, -0.4292734, -2.747177, 0, 1, 0.7176471, 1,
-0.1107486, -0.8312117, -2.140451, 0, 1, 0.7254902, 1,
-0.1100077, -1.613241, -2.417562, 0, 1, 0.7294118, 1,
-0.1077768, 1.056081, -0.9411238, 0, 1, 0.7372549, 1,
-0.1011223, -1.277467, -5.108746, 0, 1, 0.7411765, 1,
-0.1009896, -0.8138751, -2.36048, 0, 1, 0.7490196, 1,
-0.09985682, 1.295504, 1.139113, 0, 1, 0.7529412, 1,
-0.09911185, -1.097214, -1.596432, 0, 1, 0.7607843, 1,
-0.09895165, -0.0428399, -2.043587, 0, 1, 0.7647059, 1,
-0.09791671, 0.7115623, -0.2524306, 0, 1, 0.772549, 1,
-0.09732845, 0.6071959, -0.976071, 0, 1, 0.7764706, 1,
-0.09635524, -2.650543, -3.503806, 0, 1, 0.7843137, 1,
-0.09633007, -0.3867199, -1.277373, 0, 1, 0.7882353, 1,
-0.09610678, 1.158758, 0.0872407, 0, 1, 0.7960784, 1,
-0.09484753, -0.7556844, -2.145068, 0, 1, 0.8039216, 1,
-0.09464646, 0.391901, -1.428074, 0, 1, 0.8078431, 1,
-0.08711629, 0.3455893, -0.6646125, 0, 1, 0.8156863, 1,
-0.08247985, 0.3922273, -0.1548346, 0, 1, 0.8196079, 1,
-0.07757557, 0.9496716, 0.6846476, 0, 1, 0.827451, 1,
-0.07571925, -0.3578828, -1.290884, 0, 1, 0.8313726, 1,
-0.07555591, -0.001772793, -1.5112, 0, 1, 0.8392157, 1,
-0.07319121, -0.3808376, -3.770591, 0, 1, 0.8431373, 1,
-0.07021259, -0.5099466, -2.735647, 0, 1, 0.8509804, 1,
-0.06657443, -0.1038052, -2.96588, 0, 1, 0.854902, 1,
-0.05957105, 0.2733776, 0.3471051, 0, 1, 0.8627451, 1,
-0.0580203, 0.1146325, 0.7295143, 0, 1, 0.8666667, 1,
-0.05594268, 1.232307, 0.2188508, 0, 1, 0.8745098, 1,
-0.05555179, -1.518614, -2.946919, 0, 1, 0.8784314, 1,
-0.04829464, -1.162674, -2.51085, 0, 1, 0.8862745, 1,
-0.0479836, -0.1383289, -2.442672, 0, 1, 0.8901961, 1,
-0.04783434, -1.733299, -4.927258, 0, 1, 0.8980392, 1,
-0.04380172, -1.820676, -2.343217, 0, 1, 0.9058824, 1,
-0.03987435, -1.18542, -2.578346, 0, 1, 0.9098039, 1,
-0.03106026, -0.7480292, -4.290372, 0, 1, 0.9176471, 1,
-0.02903355, -0.08588818, -3.520743, 0, 1, 0.9215686, 1,
-0.02824663, 1.484332, 0.3417433, 0, 1, 0.9294118, 1,
-0.02449958, 0.9796364, 0.7327502, 0, 1, 0.9333333, 1,
-0.02379381, 0.5220693, -0.8363288, 0, 1, 0.9411765, 1,
-0.02199262, -1.383253, -2.521101, 0, 1, 0.945098, 1,
-0.01322949, 0.5657399, 0.2312099, 0, 1, 0.9529412, 1,
-0.01073393, 0.4417938, -0.1727487, 0, 1, 0.9568627, 1,
-0.006011478, 1.215918, 1.681503, 0, 1, 0.9647059, 1,
0.0008799943, 0.599468, 0.3408628, 0, 1, 0.9686275, 1,
0.004554297, -1.12011, 2.49266, 0, 1, 0.9764706, 1,
0.004886879, -0.2927095, 3.56876, 0, 1, 0.9803922, 1,
0.006538588, 1.475317, -0.3118616, 0, 1, 0.9882353, 1,
0.008460729, -0.04996699, 3.660327, 0, 1, 0.9921569, 1,
0.01087912, -1.047113, 2.307621, 0, 1, 1, 1,
0.01260913, -1.23845, 2.660836, 0, 0.9921569, 1, 1,
0.01542364, -0.5066479, 2.969254, 0, 0.9882353, 1, 1,
0.01926595, 0.5821233, -1.260338, 0, 0.9803922, 1, 1,
0.02348341, 0.2414974, 0.102012, 0, 0.9764706, 1, 1,
0.02412392, -0.2087464, 2.651983, 0, 0.9686275, 1, 1,
0.02557537, 0.5592905, -1.928413, 0, 0.9647059, 1, 1,
0.02617253, -1.73296, 2.634462, 0, 0.9568627, 1, 1,
0.03113155, 0.7720518, 1.249932, 0, 0.9529412, 1, 1,
0.03229286, 0.008333184, 2.178019, 0, 0.945098, 1, 1,
0.0408519, 1.707279, 1.550025, 0, 0.9411765, 1, 1,
0.04189844, -0.4027815, 2.684017, 0, 0.9333333, 1, 1,
0.04453507, 0.3044321, 0.899797, 0, 0.9294118, 1, 1,
0.04579626, 2.255987, 1.189772, 0, 0.9215686, 1, 1,
0.04746222, -1.637734, 4.864352, 0, 0.9176471, 1, 1,
0.05101469, -0.9672332, 3.750018, 0, 0.9098039, 1, 1,
0.05142468, -0.3050064, 2.070379, 0, 0.9058824, 1, 1,
0.05377333, 1.184748, -0.1806159, 0, 0.8980392, 1, 1,
0.05543296, -1.767139, 3.62492, 0, 0.8901961, 1, 1,
0.05867141, 0.2046398, -0.2987006, 0, 0.8862745, 1, 1,
0.06395327, 0.546084, 1.292977, 0, 0.8784314, 1, 1,
0.06882834, -0.2521582, 4.063586, 0, 0.8745098, 1, 1,
0.06938813, -0.7363733, 4.16412, 0, 0.8666667, 1, 1,
0.08189695, -2.432368, 2.927358, 0, 0.8627451, 1, 1,
0.08612674, 0.1865224, 0.2598482, 0, 0.854902, 1, 1,
0.09058227, -0.8383654, 4.431184, 0, 0.8509804, 1, 1,
0.09061895, -0.5543304, 2.6405, 0, 0.8431373, 1, 1,
0.09133071, -0.6236236, 3.350762, 0, 0.8392157, 1, 1,
0.09289543, 0.744275, -0.006603308, 0, 0.8313726, 1, 1,
0.09372161, 0.10269, 1.829051, 0, 0.827451, 1, 1,
0.09670936, -0.4435196, 4.097466, 0, 0.8196079, 1, 1,
0.09701844, 0.08108509, 1.572632, 0, 0.8156863, 1, 1,
0.09901749, 0.3650998, -0.2673801, 0, 0.8078431, 1, 1,
0.1015701, -1.656968, 2.963679, 0, 0.8039216, 1, 1,
0.1052878, 0.8704873, 0.09677564, 0, 0.7960784, 1, 1,
0.1068061, -0.06901556, 1.360136, 0, 0.7882353, 1, 1,
0.1095393, -0.9012399, 3.501427, 0, 0.7843137, 1, 1,
0.1104782, -1.608018, 3.337466, 0, 0.7764706, 1, 1,
0.1109262, -0.6333016, 2.470626, 0, 0.772549, 1, 1,
0.1137707, 0.7739223, 0.6312159, 0, 0.7647059, 1, 1,
0.1174125, -0.3741545, 2.754471, 0, 0.7607843, 1, 1,
0.1213574, 1.36187, 0.8305828, 0, 0.7529412, 1, 1,
0.1338318, 0.599959, 0.7800398, 0, 0.7490196, 1, 1,
0.1360233, 0.7898598, -0.2727418, 0, 0.7411765, 1, 1,
0.1377636, -0.09775519, 4.337909, 0, 0.7372549, 1, 1,
0.1394284, 1.462858, 1.921603, 0, 0.7294118, 1, 1,
0.1403364, 0.9618548, -0.6370293, 0, 0.7254902, 1, 1,
0.1429026, -0.3185438, 1.38324, 0, 0.7176471, 1, 1,
0.1487932, -0.3852201, 2.237147, 0, 0.7137255, 1, 1,
0.1584735, 0.8138702, 2.643068, 0, 0.7058824, 1, 1,
0.1606513, 1.310609, -0.05783977, 0, 0.6980392, 1, 1,
0.1636253, -0.04021182, 3.459938, 0, 0.6941177, 1, 1,
0.1645113, -1.838082, 1.794509, 0, 0.6862745, 1, 1,
0.1657822, -0.4084515, 1.374062, 0, 0.682353, 1, 1,
0.1712786, 1.166002, 0.2516944, 0, 0.6745098, 1, 1,
0.1721278, -0.3532622, 3.546278, 0, 0.6705883, 1, 1,
0.1776336, -0.8786706, 2.650529, 0, 0.6627451, 1, 1,
0.1786763, -0.616389, 3.322156, 0, 0.6588235, 1, 1,
0.1795811, 0.7057046, 0.2581018, 0, 0.6509804, 1, 1,
0.1812778, 0.3340343, 1.863635, 0, 0.6470588, 1, 1,
0.1848646, 0.05109184, -0.2668844, 0, 0.6392157, 1, 1,
0.1932237, 1.40448, 0.2418612, 0, 0.6352941, 1, 1,
0.1941677, 0.5443471, 0.0957652, 0, 0.627451, 1, 1,
0.1983999, -0.9606141, 3.192059, 0, 0.6235294, 1, 1,
0.1987069, -1.148214, 1.785679, 0, 0.6156863, 1, 1,
0.198794, 0.2662737, 0.729034, 0, 0.6117647, 1, 1,
0.2016761, 0.1163108, 2.691881, 0, 0.6039216, 1, 1,
0.2045981, -0.5183278, 3.398484, 0, 0.5960785, 1, 1,
0.2061895, -1.148386, 4.780578, 0, 0.5921569, 1, 1,
0.2070256, -0.3114051, 4.304699, 0, 0.5843138, 1, 1,
0.2103065, -0.1692863, 3.020211, 0, 0.5803922, 1, 1,
0.2113433, 2.357553, 0.8170897, 0, 0.572549, 1, 1,
0.2129023, -1.018164, 3.742987, 0, 0.5686275, 1, 1,
0.2164636, -2.099733, 4.364403, 0, 0.5607843, 1, 1,
0.2185066, -0.4256631, 3.643317, 0, 0.5568628, 1, 1,
0.2186251, 0.20134, 1.829705, 0, 0.5490196, 1, 1,
0.2263167, -0.6816968, 2.457621, 0, 0.5450981, 1, 1,
0.2287122, -1.297077, 3.874032, 0, 0.5372549, 1, 1,
0.229608, -0.6805796, 2.793024, 0, 0.5333334, 1, 1,
0.2297936, -0.9223166, 2.032235, 0, 0.5254902, 1, 1,
0.2327162, 0.2607771, 2.853089, 0, 0.5215687, 1, 1,
0.233063, 0.1890721, 1.404523, 0, 0.5137255, 1, 1,
0.2333293, -0.5151248, 2.425658, 0, 0.509804, 1, 1,
0.2351723, 2.842856, -0.4486656, 0, 0.5019608, 1, 1,
0.2360094, -2.568118, 4.921389, 0, 0.4941176, 1, 1,
0.2432007, 0.7645484, 0.8801606, 0, 0.4901961, 1, 1,
0.2435336, 0.9680291, 0.8568649, 0, 0.4823529, 1, 1,
0.2476087, -2.029325, 2.597102, 0, 0.4784314, 1, 1,
0.2490111, 1.640799, 0.853126, 0, 0.4705882, 1, 1,
0.250298, -1.076878, 2.703733, 0, 0.4666667, 1, 1,
0.2558835, 0.4179731, 0.8934834, 0, 0.4588235, 1, 1,
0.2610596, 1.569981, -2.590931, 0, 0.454902, 1, 1,
0.2662554, -0.3245017, 3.641306, 0, 0.4470588, 1, 1,
0.2712974, -0.1105968, 2.741124, 0, 0.4431373, 1, 1,
0.2747776, -0.1810511, 2.381567, 0, 0.4352941, 1, 1,
0.2751779, -0.5665165, 1.966288, 0, 0.4313726, 1, 1,
0.275757, 0.3552997, 0.08992815, 0, 0.4235294, 1, 1,
0.2863705, 0.6340172, 3.470041, 0, 0.4196078, 1, 1,
0.289559, -0.4666227, 2.752264, 0, 0.4117647, 1, 1,
0.2903072, -0.4577853, 3.362811, 0, 0.4078431, 1, 1,
0.2952994, -0.1427994, -0.09705702, 0, 0.4, 1, 1,
0.305689, -1.55691, 3.027041, 0, 0.3921569, 1, 1,
0.3173294, 0.3141588, 0.3523006, 0, 0.3882353, 1, 1,
0.3207053, -0.1753837, 3.28715, 0, 0.3803922, 1, 1,
0.3236255, 0.7398065, -0.1458724, 0, 0.3764706, 1, 1,
0.3243443, -1.707772, 3.260521, 0, 0.3686275, 1, 1,
0.3248269, -1.022641, 1.867689, 0, 0.3647059, 1, 1,
0.328213, 0.2928002, 0.3994769, 0, 0.3568628, 1, 1,
0.3288035, 0.1613644, 1.563195, 0, 0.3529412, 1, 1,
0.3292541, 0.6372456, 1.641885, 0, 0.345098, 1, 1,
0.3294153, -0.01850471, 1.671539, 0, 0.3411765, 1, 1,
0.3311643, -0.3239719, 1.91923, 0, 0.3333333, 1, 1,
0.3323478, 0.7513086, 0.4506778, 0, 0.3294118, 1, 1,
0.3350636, -2.461634, 4.432136, 0, 0.3215686, 1, 1,
0.3383815, -0.4014138, 2.65663, 0, 0.3176471, 1, 1,
0.3421907, 0.2461262, 3.730793, 0, 0.3098039, 1, 1,
0.3448715, -0.9604455, 1.390225, 0, 0.3058824, 1, 1,
0.3464759, -0.1038097, 1.955465, 0, 0.2980392, 1, 1,
0.3633952, 0.4466693, 0.7444118, 0, 0.2901961, 1, 1,
0.3644827, 0.01300229, 2.473694, 0, 0.2862745, 1, 1,
0.3653344, -0.7590537, 2.406815, 0, 0.2784314, 1, 1,
0.3668906, -0.1984093, 0.9268809, 0, 0.2745098, 1, 1,
0.3689619, -0.4534755, 3.864459, 0, 0.2666667, 1, 1,
0.3744809, -1.906147, 2.289785, 0, 0.2627451, 1, 1,
0.3808607, -1.030831, 3.485933, 0, 0.254902, 1, 1,
0.381754, -0.7625956, 2.98127, 0, 0.2509804, 1, 1,
0.3827814, 0.3959134, 2.062941, 0, 0.2431373, 1, 1,
0.3846022, -0.8782549, 2.82581, 0, 0.2392157, 1, 1,
0.3848664, 0.3398101, 0.9478003, 0, 0.2313726, 1, 1,
0.3879188, 0.06275418, 0.967134, 0, 0.227451, 1, 1,
0.3913399, -0.6693879, 2.26741, 0, 0.2196078, 1, 1,
0.3924863, 0.8690954, 1.561334, 0, 0.2156863, 1, 1,
0.3969024, 0.1691737, 1.654938, 0, 0.2078431, 1, 1,
0.4038594, -1.180763, 1.592389, 0, 0.2039216, 1, 1,
0.4092887, -0.8058049, 3.874426, 0, 0.1960784, 1, 1,
0.4114486, -0.566168, 1.888164, 0, 0.1882353, 1, 1,
0.4175962, 0.7764705, 0.07970764, 0, 0.1843137, 1, 1,
0.4215856, 0.2102717, 1.560653, 0, 0.1764706, 1, 1,
0.4231302, -0.1972907, 0.6630645, 0, 0.172549, 1, 1,
0.4231524, -0.1332146, 3.633499, 0, 0.1647059, 1, 1,
0.4268605, -0.6170499, 2.076635, 0, 0.1607843, 1, 1,
0.4308952, -1.471726, 1.901284, 0, 0.1529412, 1, 1,
0.4323699, -0.3797653, 1.15905, 0, 0.1490196, 1, 1,
0.4352154, 0.2689419, 2.235682, 0, 0.1411765, 1, 1,
0.4365949, -1.222887, 4.075276, 0, 0.1372549, 1, 1,
0.4376861, 0.166691, 0.7615874, 0, 0.1294118, 1, 1,
0.4380485, 0.9075716, 1.815913, 0, 0.1254902, 1, 1,
0.4393866, -0.9084116, 2.617913, 0, 0.1176471, 1, 1,
0.4420569, 0.6295024, 0.6885552, 0, 0.1137255, 1, 1,
0.4488645, 0.1639276, 1.636408, 0, 0.1058824, 1, 1,
0.4521126, -1.240874, 3.04838, 0, 0.09803922, 1, 1,
0.4558658, 0.5335163, -0.2295299, 0, 0.09411765, 1, 1,
0.4558765, 0.1571157, 0.9663271, 0, 0.08627451, 1, 1,
0.4592623, -2.364861, 2.416008, 0, 0.08235294, 1, 1,
0.4625432, 0.3938419, -0.007579018, 0, 0.07450981, 1, 1,
0.4652449, 0.5037871, 0.3369577, 0, 0.07058824, 1, 1,
0.4659387, -0.869139, 3.749396, 0, 0.0627451, 1, 1,
0.4682748, 0.05616027, -0.7536904, 0, 0.05882353, 1, 1,
0.4709767, -0.1710439, 0.6004556, 0, 0.05098039, 1, 1,
0.4776153, -2.075493, 3.521386, 0, 0.04705882, 1, 1,
0.4784632, -0.1854931, 3.344926, 0, 0.03921569, 1, 1,
0.4809435, -0.2386182, 2.757569, 0, 0.03529412, 1, 1,
0.4851774, -0.2590458, 2.675047, 0, 0.02745098, 1, 1,
0.4852364, -0.716965, 2.200849, 0, 0.02352941, 1, 1,
0.4864311, 0.1058453, 1.623823, 0, 0.01568628, 1, 1,
0.4866906, 0.5477289, 1.370656, 0, 0.01176471, 1, 1,
0.489674, -0.511972, 2.786567, 0, 0.003921569, 1, 1,
0.4898374, 0.8199716, 0.2532159, 0.003921569, 0, 1, 1,
0.4952844, -0.2219201, 2.017236, 0.007843138, 0, 1, 1,
0.4990743, -0.2593449, 1.59134, 0.01568628, 0, 1, 1,
0.4991715, 0.7849588, -1.550516, 0.01960784, 0, 1, 1,
0.5026578, 1.474983, 0.5678902, 0.02745098, 0, 1, 1,
0.5030673, 1.078315, 0.5839936, 0.03137255, 0, 1, 1,
0.5067999, -0.2827398, 1.419456, 0.03921569, 0, 1, 1,
0.5074238, 0.5789434, -0.5187681, 0.04313726, 0, 1, 1,
0.5102729, -0.9673523, 2.1088, 0.05098039, 0, 1, 1,
0.5121066, -0.4144075, 1.584121, 0.05490196, 0, 1, 1,
0.5178242, -0.1869142, 1.41005, 0.0627451, 0, 1, 1,
0.518307, -1.841241, 2.44493, 0.06666667, 0, 1, 1,
0.5185135, 0.1697462, 1.709273, 0.07450981, 0, 1, 1,
0.521713, -1.386027, 3.602106, 0.07843138, 0, 1, 1,
0.5228413, 0.610766, -0.4582715, 0.08627451, 0, 1, 1,
0.523079, -0.8939401, 1.353022, 0.09019608, 0, 1, 1,
0.5232453, -0.4067056, 4.086902, 0.09803922, 0, 1, 1,
0.5239808, -1.505668, 2.899321, 0.1058824, 0, 1, 1,
0.5250474, 0.2132699, -0.07835244, 0.1098039, 0, 1, 1,
0.5263672, -1.208955, 1.955755, 0.1176471, 0, 1, 1,
0.5281372, 0.9077505, 0.5115695, 0.1215686, 0, 1, 1,
0.535782, 1.6621, 2.133419, 0.1294118, 0, 1, 1,
0.5388654, -0.2348434, 2.422525, 0.1333333, 0, 1, 1,
0.5395685, -1.086177, 4.14072, 0.1411765, 0, 1, 1,
0.5419885, 0.3964999, 1.866416, 0.145098, 0, 1, 1,
0.544463, -0.5272492, 0.6519083, 0.1529412, 0, 1, 1,
0.5481656, 0.4955603, 1.41477, 0.1568628, 0, 1, 1,
0.550117, 0.1509706, 2.152315, 0.1647059, 0, 1, 1,
0.5510083, -0.1551219, 0.544642, 0.1686275, 0, 1, 1,
0.5523441, 0.6540266, 3.422409, 0.1764706, 0, 1, 1,
0.5534208, -1.012324, 3.074171, 0.1803922, 0, 1, 1,
0.5627292, -1.778504, 2.461736, 0.1882353, 0, 1, 1,
0.5667332, 1.006328, 1.411502, 0.1921569, 0, 1, 1,
0.5675331, -1.077372, 2.113205, 0.2, 0, 1, 1,
0.5713491, 1.912294, 0.4054082, 0.2078431, 0, 1, 1,
0.5753933, 0.0802234, 2.679912, 0.2117647, 0, 1, 1,
0.5777342, -0.04315563, 2.522584, 0.2196078, 0, 1, 1,
0.5786409, -0.8048347, 3.705941, 0.2235294, 0, 1, 1,
0.5791494, 0.3506148, -0.2513679, 0.2313726, 0, 1, 1,
0.5808021, 0.8326083, 0.6351568, 0.2352941, 0, 1, 1,
0.5833271, -1.230075, 2.175829, 0.2431373, 0, 1, 1,
0.5841549, -1.089433, 2.814935, 0.2470588, 0, 1, 1,
0.5864333, 0.3426791, 0.2528918, 0.254902, 0, 1, 1,
0.5945687, 0.0368951, 1.390283, 0.2588235, 0, 1, 1,
0.6010581, 0.7434549, 0.08812533, 0.2666667, 0, 1, 1,
0.6064616, 0.4650848, -0.3323477, 0.2705882, 0, 1, 1,
0.608793, 0.3868228, 1.915995, 0.2784314, 0, 1, 1,
0.611525, -1.676446, 3.049902, 0.282353, 0, 1, 1,
0.6218236, -0.3698389, 1.785092, 0.2901961, 0, 1, 1,
0.6229009, -1.200983, 3.572483, 0.2941177, 0, 1, 1,
0.6230842, -1.664037, 2.242084, 0.3019608, 0, 1, 1,
0.6234295, 0.3955606, 1.51326, 0.3098039, 0, 1, 1,
0.6243742, 2.174674, -1.155457, 0.3137255, 0, 1, 1,
0.624379, 0.07417011, 2.022189, 0.3215686, 0, 1, 1,
0.6269158, 1.141453, 0.7377442, 0.3254902, 0, 1, 1,
0.627818, 2.238595, 0.008663053, 0.3333333, 0, 1, 1,
0.6309144, -1.821242, 2.015309, 0.3372549, 0, 1, 1,
0.6323005, -0.5505669, 2.937004, 0.345098, 0, 1, 1,
0.6369503, 0.09124587, 2.35057, 0.3490196, 0, 1, 1,
0.6372983, -1.041698, 3.126371, 0.3568628, 0, 1, 1,
0.6373004, -0.7767294, 2.321192, 0.3607843, 0, 1, 1,
0.6393231, 0.8570591, 0.871065, 0.3686275, 0, 1, 1,
0.6481101, -1.36333, 1.185664, 0.372549, 0, 1, 1,
0.6486881, -0.6600453, 3.709501, 0.3803922, 0, 1, 1,
0.6492424, -1.205142, 1.728516, 0.3843137, 0, 1, 1,
0.6541989, 0.06595647, 1.73833, 0.3921569, 0, 1, 1,
0.6579056, 1.868894, -0.09203451, 0.3960784, 0, 1, 1,
0.661773, 0.9710982, -0.4327483, 0.4039216, 0, 1, 1,
0.6655375, -0.9391198, 2.579305, 0.4117647, 0, 1, 1,
0.6681855, 1.320049, -0.6119367, 0.4156863, 0, 1, 1,
0.6687263, 1.041892, 0.4159415, 0.4235294, 0, 1, 1,
0.6714433, -0.1459688, 2.870114, 0.427451, 0, 1, 1,
0.6752019, 0.3974802, 2.01726, 0.4352941, 0, 1, 1,
0.6753436, -0.4185438, 1.648247, 0.4392157, 0, 1, 1,
0.6804656, -0.3685734, 3.171163, 0.4470588, 0, 1, 1,
0.6824507, -0.1207125, 2.083101, 0.4509804, 0, 1, 1,
0.6845108, 0.8326142, 1.596874, 0.4588235, 0, 1, 1,
0.7012646, -0.05878704, 1.721146, 0.4627451, 0, 1, 1,
0.7042368, -0.00190998, 2.898811, 0.4705882, 0, 1, 1,
0.7048426, -1.565562, 4.703183, 0.4745098, 0, 1, 1,
0.7071499, -1.615883, 3.331599, 0.4823529, 0, 1, 1,
0.7098232, 0.3789526, -0.05096186, 0.4862745, 0, 1, 1,
0.7163277, 1.027177, 1.135439, 0.4941176, 0, 1, 1,
0.7172167, -0.9221766, 1.913151, 0.5019608, 0, 1, 1,
0.7201225, 0.5340164, 1.696431, 0.5058824, 0, 1, 1,
0.7216707, -0.4022875, 1.072147, 0.5137255, 0, 1, 1,
0.7219152, -2.035626, 2.598605, 0.5176471, 0, 1, 1,
0.7246924, 1.382751, 0.2963286, 0.5254902, 0, 1, 1,
0.7277955, -2.457772, 0.9363101, 0.5294118, 0, 1, 1,
0.7301627, 0.9783865, 0.3709842, 0.5372549, 0, 1, 1,
0.7359452, 0.05695873, 2.813033, 0.5411765, 0, 1, 1,
0.7375417, -0.6876343, 3.300069, 0.5490196, 0, 1, 1,
0.7391114, 0.102247, 2.294902, 0.5529412, 0, 1, 1,
0.744145, 1.473777, 0.2610024, 0.5607843, 0, 1, 1,
0.7508021, 0.4378259, 0.2971766, 0.5647059, 0, 1, 1,
0.7616647, 1.847402, -1.260845, 0.572549, 0, 1, 1,
0.7633268, 0.683547, 1.569594, 0.5764706, 0, 1, 1,
0.7660182, -1.512229, 3.0363, 0.5843138, 0, 1, 1,
0.7698203, -0.303947, 2.372736, 0.5882353, 0, 1, 1,
0.7742442, -0.9511161, 4.000496, 0.5960785, 0, 1, 1,
0.7844269, -0.07205441, 0.2284443, 0.6039216, 0, 1, 1,
0.786737, 0.2036643, 2.839016, 0.6078432, 0, 1, 1,
0.787649, 0.4536377, -1.253438, 0.6156863, 0, 1, 1,
0.792447, 0.2151873, 1.43704, 0.6196079, 0, 1, 1,
0.7956325, -0.4730184, 2.719368, 0.627451, 0, 1, 1,
0.79773, 1.8202, 0.7236118, 0.6313726, 0, 1, 1,
0.8064377, -0.1695193, 2.050243, 0.6392157, 0, 1, 1,
0.8112963, -0.1079366, 3.890159, 0.6431373, 0, 1, 1,
0.8151034, 1.32441, 1.12511, 0.6509804, 0, 1, 1,
0.8169169, -0.6278544, 2.090426, 0.654902, 0, 1, 1,
0.8190713, 1.020309, -0.2132376, 0.6627451, 0, 1, 1,
0.8199185, 1.086269, 0.5405753, 0.6666667, 0, 1, 1,
0.8204345, 0.2253758, 1.238036, 0.6745098, 0, 1, 1,
0.8229339, -0.4020287, 2.982413, 0.6784314, 0, 1, 1,
0.8365237, 0.1829267, 3.322861, 0.6862745, 0, 1, 1,
0.8395305, -0.7587171, 2.099045, 0.6901961, 0, 1, 1,
0.8414353, -0.568349, 4.344013, 0.6980392, 0, 1, 1,
0.8426718, 1.353044, 1.657121, 0.7058824, 0, 1, 1,
0.8451378, 0.6006318, 2.088605, 0.7098039, 0, 1, 1,
0.8461017, -0.5308021, 2.341839, 0.7176471, 0, 1, 1,
0.8480895, -1.271134, 3.138883, 0.7215686, 0, 1, 1,
0.8501244, 0.9646078, 0.5691844, 0.7294118, 0, 1, 1,
0.8530319, 1.661616, 1.962727, 0.7333333, 0, 1, 1,
0.8531542, -2.741303, 1.958032, 0.7411765, 0, 1, 1,
0.8545853, 1.310775, 0.0006067206, 0.7450981, 0, 1, 1,
0.859469, 0.09379335, 1.165078, 0.7529412, 0, 1, 1,
0.8603844, -0.1389053, 0.6118864, 0.7568628, 0, 1, 1,
0.8624805, -0.7758712, 1.640698, 0.7647059, 0, 1, 1,
0.864634, -0.1128922, 0.187451, 0.7686275, 0, 1, 1,
0.8702722, -1.180301, 0.1905727, 0.7764706, 0, 1, 1,
0.8716422, 0.2824614, 2.681749, 0.7803922, 0, 1, 1,
0.8745533, -0.5078335, 1.559473, 0.7882353, 0, 1, 1,
0.8929706, -1.855703, 3.854247, 0.7921569, 0, 1, 1,
0.8939567, -2.481624, 0.9905786, 0.8, 0, 1, 1,
0.8942691, -0.1640511, 2.183055, 0.8078431, 0, 1, 1,
0.8956885, 1.656299, 1.629712, 0.8117647, 0, 1, 1,
0.8984097, -0.2175633, 1.521757, 0.8196079, 0, 1, 1,
0.8999061, -1.149885, 1.302984, 0.8235294, 0, 1, 1,
0.9026802, 1.745368, 0.3947051, 0.8313726, 0, 1, 1,
0.9060679, 1.130218, 0.4037222, 0.8352941, 0, 1, 1,
0.9061964, -0.1473522, 1.984399, 0.8431373, 0, 1, 1,
0.9079154, 1.53271, 0.4781332, 0.8470588, 0, 1, 1,
0.9113962, -0.7055719, 1.743575, 0.854902, 0, 1, 1,
0.9158537, -2.186036, 2.017759, 0.8588235, 0, 1, 1,
0.9245346, -1.608924, 3.289346, 0.8666667, 0, 1, 1,
0.9290401, -2.244465, 4.259468, 0.8705882, 0, 1, 1,
0.9319854, -0.06396604, 1.575882, 0.8784314, 0, 1, 1,
0.9336924, 0.4091565, 0.341224, 0.8823529, 0, 1, 1,
0.9364454, 0.6959903, 0.9931345, 0.8901961, 0, 1, 1,
0.9373145, 0.6796091, 2.394774, 0.8941177, 0, 1, 1,
0.9434581, -0.5720639, 3.4441, 0.9019608, 0, 1, 1,
0.9534979, -0.3407021, 2.61163, 0.9098039, 0, 1, 1,
0.9566675, 0.3854695, 1.389601, 0.9137255, 0, 1, 1,
0.9608694, -0.8088585, 4.08988, 0.9215686, 0, 1, 1,
0.9659888, -1.540259, 2.538631, 0.9254902, 0, 1, 1,
0.9803028, 0.6691746, 0.8689785, 0.9333333, 0, 1, 1,
0.9807971, 0.3664088, 1.001696, 0.9372549, 0, 1, 1,
0.9807999, -0.7787821, 2.123705, 0.945098, 0, 1, 1,
0.9823599, 0.7961536, 2.479569, 0.9490196, 0, 1, 1,
0.9874616, -0.4297915, 1.622145, 0.9568627, 0, 1, 1,
0.9876327, -2.082983, 0.6564757, 0.9607843, 0, 1, 1,
0.9905949, 0.9150582, 1.859481, 0.9686275, 0, 1, 1,
0.9929835, -1.616162, 2.922067, 0.972549, 0, 1, 1,
0.9962633, -0.04045793, 1.945285, 0.9803922, 0, 1, 1,
0.996685, 0.4143855, -0.5022265, 0.9843137, 0, 1, 1,
1.004662, -1.185375, 3.397063, 0.9921569, 0, 1, 1,
1.006571, 1.153239, 2.098463, 0.9960784, 0, 1, 1,
1.006889, -1.052402, 1.375221, 1, 0, 0.9960784, 1,
1.007898, 0.4359826, 1.497941, 1, 0, 0.9882353, 1,
1.010573, 0.163329, 1.318792, 1, 0, 0.9843137, 1,
1.015519, -0.4531768, 1.66213, 1, 0, 0.9764706, 1,
1.016174, -0.2949405, 2.341974, 1, 0, 0.972549, 1,
1.027627, -1.390424, 2.501172, 1, 0, 0.9647059, 1,
1.028819, 0.2511173, -0.9307462, 1, 0, 0.9607843, 1,
1.028839, 1.735394, -1.934712, 1, 0, 0.9529412, 1,
1.031295, 0.5902292, 2.127983, 1, 0, 0.9490196, 1,
1.031502, 0.6274151, 0.1662993, 1, 0, 0.9411765, 1,
1.035938, -1.961799, 3.746943, 1, 0, 0.9372549, 1,
1.03612, -0.4252033, 1.958096, 1, 0, 0.9294118, 1,
1.036642, -1.097011, 3.142848, 1, 0, 0.9254902, 1,
1.040046, 0.3246244, 1.412543, 1, 0, 0.9176471, 1,
1.041203, -0.7996501, 1.372874, 1, 0, 0.9137255, 1,
1.046355, 0.5974985, 2.484366, 1, 0, 0.9058824, 1,
1.051156, -0.271452, 1.535925, 1, 0, 0.9019608, 1,
1.066072, 0.3611282, 0.1224624, 1, 0, 0.8941177, 1,
1.068844, 0.587238, 2.509235, 1, 0, 0.8862745, 1,
1.079506, 0.7370277, 0.7020414, 1, 0, 0.8823529, 1,
1.0843, -1.002157, 2.282427, 1, 0, 0.8745098, 1,
1.084844, -1.947398, 3.652391, 1, 0, 0.8705882, 1,
1.091135, -0.4136583, 1.594394, 1, 0, 0.8627451, 1,
1.09731, 0.05551674, 1.623289, 1, 0, 0.8588235, 1,
1.100955, 0.8540149, 0.4180576, 1, 0, 0.8509804, 1,
1.104284, -0.629443, 2.777212, 1, 0, 0.8470588, 1,
1.114894, 1.132606, 0.3539109, 1, 0, 0.8392157, 1,
1.115806, 0.3844397, 1.262286, 1, 0, 0.8352941, 1,
1.129775, 1.660259, 0.5471364, 1, 0, 0.827451, 1,
1.132405, 0.3458981, 1.520415, 1, 0, 0.8235294, 1,
1.133044, 0.8530943, 1.101588, 1, 0, 0.8156863, 1,
1.134534, 1.011367, 1.137644, 1, 0, 0.8117647, 1,
1.135982, -1.630102, 2.207405, 1, 0, 0.8039216, 1,
1.139271, -0.1409713, 1.699698, 1, 0, 0.7960784, 1,
1.13966, 1.643459, 1.379116, 1, 0, 0.7921569, 1,
1.140485, -0.5491391, 4.135847, 1, 0, 0.7843137, 1,
1.144624, 0.184506, 0.8397346, 1, 0, 0.7803922, 1,
1.147685, -1.283306, 3.136032, 1, 0, 0.772549, 1,
1.149765, -0.06466325, 1.396906, 1, 0, 0.7686275, 1,
1.155373, 0.3712544, 1.291206, 1, 0, 0.7607843, 1,
1.156177, -0.2058863, 1.140127, 1, 0, 0.7568628, 1,
1.163366, 0.2704561, 0.8492793, 1, 0, 0.7490196, 1,
1.169879, 1.382107, 1.494636, 1, 0, 0.7450981, 1,
1.169976, 0.2560743, 1.104755, 1, 0, 0.7372549, 1,
1.180471, -0.5142922, 3.335443, 1, 0, 0.7333333, 1,
1.183188, 1.116488, 3.379385, 1, 0, 0.7254902, 1,
1.183693, 0.825533, 2.133418, 1, 0, 0.7215686, 1,
1.194645, 0.9076356, 0.2149024, 1, 0, 0.7137255, 1,
1.202156, -1.402519, 3.662854, 1, 0, 0.7098039, 1,
1.217411, 0.03186881, 1.807233, 1, 0, 0.7019608, 1,
1.2193, -2.156828, 0.9778066, 1, 0, 0.6941177, 1,
1.221546, -0.4710062, 2.663498, 1, 0, 0.6901961, 1,
1.226097, -1.975867, 1.125738, 1, 0, 0.682353, 1,
1.22856, 0.3485164, 1.327808, 1, 0, 0.6784314, 1,
1.229392, -0.1401527, 2.121413, 1, 0, 0.6705883, 1,
1.230854, -1.598827, 2.529357, 1, 0, 0.6666667, 1,
1.231358, 1.223576, 0.2545665, 1, 0, 0.6588235, 1,
1.243133, 1.6476, 1.127566, 1, 0, 0.654902, 1,
1.247423, 0.2673854, 2.417591, 1, 0, 0.6470588, 1,
1.257212, 1.121564, 1.014867, 1, 0, 0.6431373, 1,
1.258428, -0.1175102, -0.2644928, 1, 0, 0.6352941, 1,
1.261357, 0.07123896, 1.214167, 1, 0, 0.6313726, 1,
1.263463, 0.4636007, 1.83562, 1, 0, 0.6235294, 1,
1.273744, 0.007820805, 3.429377, 1, 0, 0.6196079, 1,
1.278601, 0.2542203, 1.685335, 1, 0, 0.6117647, 1,
1.294, -0.6513559, 1.5418, 1, 0, 0.6078432, 1,
1.30239, 1.905163, 0.3660455, 1, 0, 0.6, 1,
1.303601, -0.142953, 2.898566, 1, 0, 0.5921569, 1,
1.30509, 0.7128035, 1.200124, 1, 0, 0.5882353, 1,
1.324766, 0.5538459, -0.06139383, 1, 0, 0.5803922, 1,
1.325003, -0.1665683, 0.5703291, 1, 0, 0.5764706, 1,
1.326749, -1.304651, 4.740093, 1, 0, 0.5686275, 1,
1.334697, 1.693488, -0.9082258, 1, 0, 0.5647059, 1,
1.335241, -1.310606, 3.457418, 1, 0, 0.5568628, 1,
1.335589, 0.3866432, 1.242736, 1, 0, 0.5529412, 1,
1.349797, -0.4449038, 3.958754, 1, 0, 0.5450981, 1,
1.363336, -0.3035637, 2.51531, 1, 0, 0.5411765, 1,
1.3643, 1.232071, 0.400325, 1, 0, 0.5333334, 1,
1.373034, -0.861523, 2.154154, 1, 0, 0.5294118, 1,
1.376462, 1.732841, 1.455993, 1, 0, 0.5215687, 1,
1.384063, 0.6066323, -0.2948387, 1, 0, 0.5176471, 1,
1.386768, 0.9110726, -0.4646965, 1, 0, 0.509804, 1,
1.394534, 0.3519785, 1.163602, 1, 0, 0.5058824, 1,
1.397908, -0.01151415, 2.266822, 1, 0, 0.4980392, 1,
1.398095, 2.282929, 1.147516, 1, 0, 0.4901961, 1,
1.411271, 1.515207, 0.8625651, 1, 0, 0.4862745, 1,
1.413747, 1.277194, 1.628655, 1, 0, 0.4784314, 1,
1.419079, -0.1069757, -0.2980123, 1, 0, 0.4745098, 1,
1.422722, 0.5839107, 1.467185, 1, 0, 0.4666667, 1,
1.423413, -0.9425633, 1.355599, 1, 0, 0.4627451, 1,
1.427548, 1.421714, 1.148243, 1, 0, 0.454902, 1,
1.439923, -0.8195131, 1.967865, 1, 0, 0.4509804, 1,
1.441081, 1.596817, 1.606754, 1, 0, 0.4431373, 1,
1.457989, -1.512164, 4.258023, 1, 0, 0.4392157, 1,
1.461423, 0.9945594, 2.359807, 1, 0, 0.4313726, 1,
1.463213, -1.354024, 1.922219, 1, 0, 0.427451, 1,
1.493403, -0.5060785, 0.8082461, 1, 0, 0.4196078, 1,
1.503051, 1.519163, -0.9706753, 1, 0, 0.4156863, 1,
1.519142, 0.662187, 1.595123, 1, 0, 0.4078431, 1,
1.531812, 0.2458378, 1.527997, 1, 0, 0.4039216, 1,
1.531837, 1.29294, 1.094222, 1, 0, 0.3960784, 1,
1.541154, 0.6189104, 0.7009947, 1, 0, 0.3882353, 1,
1.543114, -0.7426811, 1.041788, 1, 0, 0.3843137, 1,
1.569568, 1.268784, 1.506826, 1, 0, 0.3764706, 1,
1.571047, -0.1612724, 2.064023, 1, 0, 0.372549, 1,
1.600702, 0.6016617, 0.0144496, 1, 0, 0.3647059, 1,
1.605332, 0.2966315, 1.732626, 1, 0, 0.3607843, 1,
1.613054, 2.071029, 0.9974394, 1, 0, 0.3529412, 1,
1.620476, -0.3643237, 2.602656, 1, 0, 0.3490196, 1,
1.624208, 0.6454432, 1.344796, 1, 0, 0.3411765, 1,
1.630048, 0.4143357, 2.566107, 1, 0, 0.3372549, 1,
1.638462, 1.326312, 1.437841, 1, 0, 0.3294118, 1,
1.644245, -0.4130948, 2.625713, 1, 0, 0.3254902, 1,
1.648268, -0.4249071, -0.5579845, 1, 0, 0.3176471, 1,
1.648415, -0.04446991, 2.585203, 1, 0, 0.3137255, 1,
1.652285, 0.2629932, 1.582958, 1, 0, 0.3058824, 1,
1.667593, 0.6305559, 0.5953393, 1, 0, 0.2980392, 1,
1.705186, 0.3865173, 3.071605, 1, 0, 0.2941177, 1,
1.719603, -2.405515, 2.245089, 1, 0, 0.2862745, 1,
1.732933, 1.44049, -0.955858, 1, 0, 0.282353, 1,
1.735929, -0.12918, 0.06439207, 1, 0, 0.2745098, 1,
1.739747, -0.0949504, 3.820362, 1, 0, 0.2705882, 1,
1.740308, -0.1975595, 1.321566, 1, 0, 0.2627451, 1,
1.747561, -1.089903, 2.936713, 1, 0, 0.2588235, 1,
1.758341, 0.7196879, 0.6168989, 1, 0, 0.2509804, 1,
1.764084, -0.6958241, 1.956062, 1, 0, 0.2470588, 1,
1.777123, -0.1510289, 1.873727, 1, 0, 0.2392157, 1,
1.784907, 1.547527, 1.341277, 1, 0, 0.2352941, 1,
1.801346, 0.5881974, 0.4195041, 1, 0, 0.227451, 1,
1.801473, 1.096589, 1.471416, 1, 0, 0.2235294, 1,
1.816836, 1.593788, 1.074661, 1, 0, 0.2156863, 1,
1.823531, 1.480938, 2.409271, 1, 0, 0.2117647, 1,
1.844194, 0.1272205, 1.575168, 1, 0, 0.2039216, 1,
1.93757, -0.6161343, 2.154632, 1, 0, 0.1960784, 1,
1.992806, -0.6196526, -0.5039522, 1, 0, 0.1921569, 1,
2.042499, 1.513334, 1.092621, 1, 0, 0.1843137, 1,
2.046649, 0.8721871, 3.598646, 1, 0, 0.1803922, 1,
2.050735, -1.346374, 4.083047, 1, 0, 0.172549, 1,
2.05292, 1.592531, -0.4238907, 1, 0, 0.1686275, 1,
2.057663, 0.5807627, 0.8443511, 1, 0, 0.1607843, 1,
2.067703, 0.7630157, 0.8289805, 1, 0, 0.1568628, 1,
2.091511, 0.1967693, 2.971882, 1, 0, 0.1490196, 1,
2.113048, -0.3811605, 1.525724, 1, 0, 0.145098, 1,
2.11848, 0.6023422, -0.07863975, 1, 0, 0.1372549, 1,
2.120643, -1.150823, 1.772438, 1, 0, 0.1333333, 1,
2.122691, 0.2591446, 1.477278, 1, 0, 0.1254902, 1,
2.135657, 0.3097321, 1.663686, 1, 0, 0.1215686, 1,
2.168428, -2.240658, 2.255978, 1, 0, 0.1137255, 1,
2.168458, 0.3662834, 1.953679, 1, 0, 0.1098039, 1,
2.223138, 0.01239072, 2.746301, 1, 0, 0.1019608, 1,
2.246359, 1.74686, 2.306445, 1, 0, 0.09411765, 1,
2.258973, 0.7305304, 1.577632, 1, 0, 0.09019608, 1,
2.281977, 0.4852876, -0.2739422, 1, 0, 0.08235294, 1,
2.354213, -1.204402, 2.048169, 1, 0, 0.07843138, 1,
2.363704, -0.1594818, 3.052096, 1, 0, 0.07058824, 1,
2.391418, 0.06249478, 1.615546, 1, 0, 0.06666667, 1,
2.46345, 0.1019416, 1.032725, 1, 0, 0.05882353, 1,
2.470013, -0.7495553, 0.9283017, 1, 0, 0.05490196, 1,
2.510055, 0.6884689, 0.8145266, 1, 0, 0.04705882, 1,
2.61864, 0.88946, -0.134574, 1, 0, 0.04313726, 1,
2.670597, 1.145808, 0.6713339, 1, 0, 0.03529412, 1,
2.867733, -0.5395494, 3.78086, 1, 0, 0.03137255, 1,
2.92984, 0.5003763, 0.91939, 1, 0, 0.02352941, 1,
2.936691, 2.30002, 2.798437, 1, 0, 0.01960784, 1,
3.165206, 0.6880358, 0.03929307, 1, 0, 0.01176471, 1,
3.288621, -0.2317952, 0.7057656, 1, 0, 0.007843138, 1
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
0.115075, -3.961993, -6.808854, 0, -0.5, 0.5, 0.5,
0.115075, -3.961993, -6.808854, 1, -0.5, 0.5, 0.5,
0.115075, -3.961993, -6.808854, 1, 1.5, 0.5, 0.5,
0.115075, -3.961993, -6.808854, 0, 1.5, 0.5, 0.5
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
-4.134304, 0.46222, -6.808854, 0, -0.5, 0.5, 0.5,
-4.134304, 0.46222, -6.808854, 1, -0.5, 0.5, 0.5,
-4.134304, 0.46222, -6.808854, 1, 1.5, 0.5, 0.5,
-4.134304, 0.46222, -6.808854, 0, 1.5, 0.5, 0.5
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
-4.134304, -3.961993, -0.09367847, 0, -0.5, 0.5, 0.5,
-4.134304, -3.961993, -0.09367847, 1, -0.5, 0.5, 0.5,
-4.134304, -3.961993, -0.09367847, 1, 1.5, 0.5, 0.5,
-4.134304, -3.961993, -0.09367847, 0, 1.5, 0.5, 0.5
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
-3, -2.94102, -5.259198,
3, -2.94102, -5.259198,
-3, -2.94102, -5.259198,
-3, -3.111182, -5.517474,
-2, -2.94102, -5.259198,
-2, -3.111182, -5.517474,
-1, -2.94102, -5.259198,
-1, -3.111182, -5.517474,
0, -2.94102, -5.259198,
0, -3.111182, -5.517474,
1, -2.94102, -5.259198,
1, -3.111182, -5.517474,
2, -2.94102, -5.259198,
2, -3.111182, -5.517474,
3, -2.94102, -5.259198,
3, -3.111182, -5.517474
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
-3, -3.451507, -6.034026, 0, -0.5, 0.5, 0.5,
-3, -3.451507, -6.034026, 1, -0.5, 0.5, 0.5,
-3, -3.451507, -6.034026, 1, 1.5, 0.5, 0.5,
-3, -3.451507, -6.034026, 0, 1.5, 0.5, 0.5,
-2, -3.451507, -6.034026, 0, -0.5, 0.5, 0.5,
-2, -3.451507, -6.034026, 1, -0.5, 0.5, 0.5,
-2, -3.451507, -6.034026, 1, 1.5, 0.5, 0.5,
-2, -3.451507, -6.034026, 0, 1.5, 0.5, 0.5,
-1, -3.451507, -6.034026, 0, -0.5, 0.5, 0.5,
-1, -3.451507, -6.034026, 1, -0.5, 0.5, 0.5,
-1, -3.451507, -6.034026, 1, 1.5, 0.5, 0.5,
-1, -3.451507, -6.034026, 0, 1.5, 0.5, 0.5,
0, -3.451507, -6.034026, 0, -0.5, 0.5, 0.5,
0, -3.451507, -6.034026, 1, -0.5, 0.5, 0.5,
0, -3.451507, -6.034026, 1, 1.5, 0.5, 0.5,
0, -3.451507, -6.034026, 0, 1.5, 0.5, 0.5,
1, -3.451507, -6.034026, 0, -0.5, 0.5, 0.5,
1, -3.451507, -6.034026, 1, -0.5, 0.5, 0.5,
1, -3.451507, -6.034026, 1, 1.5, 0.5, 0.5,
1, -3.451507, -6.034026, 0, 1.5, 0.5, 0.5,
2, -3.451507, -6.034026, 0, -0.5, 0.5, 0.5,
2, -3.451507, -6.034026, 1, -0.5, 0.5, 0.5,
2, -3.451507, -6.034026, 1, 1.5, 0.5, 0.5,
2, -3.451507, -6.034026, 0, 1.5, 0.5, 0.5,
3, -3.451507, -6.034026, 0, -0.5, 0.5, 0.5,
3, -3.451507, -6.034026, 1, -0.5, 0.5, 0.5,
3, -3.451507, -6.034026, 1, 1.5, 0.5, 0.5,
3, -3.451507, -6.034026, 0, 1.5, 0.5, 0.5
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
-3.153678, -2, -5.259198,
-3.153678, 3, -5.259198,
-3.153678, -2, -5.259198,
-3.317115, -2, -5.517474,
-3.153678, -1, -5.259198,
-3.317115, -1, -5.517474,
-3.153678, 0, -5.259198,
-3.317115, 0, -5.517474,
-3.153678, 1, -5.259198,
-3.317115, 1, -5.517474,
-3.153678, 2, -5.259198,
-3.317115, 2, -5.517474,
-3.153678, 3, -5.259198,
-3.317115, 3, -5.517474
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
-3.643991, -2, -6.034026, 0, -0.5, 0.5, 0.5,
-3.643991, -2, -6.034026, 1, -0.5, 0.5, 0.5,
-3.643991, -2, -6.034026, 1, 1.5, 0.5, 0.5,
-3.643991, -2, -6.034026, 0, 1.5, 0.5, 0.5,
-3.643991, -1, -6.034026, 0, -0.5, 0.5, 0.5,
-3.643991, -1, -6.034026, 1, -0.5, 0.5, 0.5,
-3.643991, -1, -6.034026, 1, 1.5, 0.5, 0.5,
-3.643991, -1, -6.034026, 0, 1.5, 0.5, 0.5,
-3.643991, 0, -6.034026, 0, -0.5, 0.5, 0.5,
-3.643991, 0, -6.034026, 1, -0.5, 0.5, 0.5,
-3.643991, 0, -6.034026, 1, 1.5, 0.5, 0.5,
-3.643991, 0, -6.034026, 0, 1.5, 0.5, 0.5,
-3.643991, 1, -6.034026, 0, -0.5, 0.5, 0.5,
-3.643991, 1, -6.034026, 1, -0.5, 0.5, 0.5,
-3.643991, 1, -6.034026, 1, 1.5, 0.5, 0.5,
-3.643991, 1, -6.034026, 0, 1.5, 0.5, 0.5,
-3.643991, 2, -6.034026, 0, -0.5, 0.5, 0.5,
-3.643991, 2, -6.034026, 1, -0.5, 0.5, 0.5,
-3.643991, 2, -6.034026, 1, 1.5, 0.5, 0.5,
-3.643991, 2, -6.034026, 0, 1.5, 0.5, 0.5,
-3.643991, 3, -6.034026, 0, -0.5, 0.5, 0.5,
-3.643991, 3, -6.034026, 1, -0.5, 0.5, 0.5,
-3.643991, 3, -6.034026, 1, 1.5, 0.5, 0.5,
-3.643991, 3, -6.034026, 0, 1.5, 0.5, 0.5
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
-3.153678, -2.94102, -4,
-3.153678, -2.94102, 4,
-3.153678, -2.94102, -4,
-3.317115, -3.111182, -4,
-3.153678, -2.94102, -2,
-3.317115, -3.111182, -2,
-3.153678, -2.94102, 0,
-3.317115, -3.111182, 0,
-3.153678, -2.94102, 2,
-3.317115, -3.111182, 2,
-3.153678, -2.94102, 4,
-3.317115, -3.111182, 4
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
-3.643991, -3.451507, -4, 0, -0.5, 0.5, 0.5,
-3.643991, -3.451507, -4, 1, -0.5, 0.5, 0.5,
-3.643991, -3.451507, -4, 1, 1.5, 0.5, 0.5,
-3.643991, -3.451507, -4, 0, 1.5, 0.5, 0.5,
-3.643991, -3.451507, -2, 0, -0.5, 0.5, 0.5,
-3.643991, -3.451507, -2, 1, -0.5, 0.5, 0.5,
-3.643991, -3.451507, -2, 1, 1.5, 0.5, 0.5,
-3.643991, -3.451507, -2, 0, 1.5, 0.5, 0.5,
-3.643991, -3.451507, 0, 0, -0.5, 0.5, 0.5,
-3.643991, -3.451507, 0, 1, -0.5, 0.5, 0.5,
-3.643991, -3.451507, 0, 1, 1.5, 0.5, 0.5,
-3.643991, -3.451507, 0, 0, 1.5, 0.5, 0.5,
-3.643991, -3.451507, 2, 0, -0.5, 0.5, 0.5,
-3.643991, -3.451507, 2, 1, -0.5, 0.5, 0.5,
-3.643991, -3.451507, 2, 1, 1.5, 0.5, 0.5,
-3.643991, -3.451507, 2, 0, 1.5, 0.5, 0.5,
-3.643991, -3.451507, 4, 0, -0.5, 0.5, 0.5,
-3.643991, -3.451507, 4, 1, -0.5, 0.5, 0.5,
-3.643991, -3.451507, 4, 1, 1.5, 0.5, 0.5,
-3.643991, -3.451507, 4, 0, 1.5, 0.5, 0.5
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
-3.153678, -2.94102, -5.259198,
-3.153678, 3.86546, -5.259198,
-3.153678, -2.94102, 5.071841,
-3.153678, 3.86546, 5.071841,
-3.153678, -2.94102, -5.259198,
-3.153678, -2.94102, 5.071841,
-3.153678, 3.86546, -5.259198,
-3.153678, 3.86546, 5.071841,
-3.153678, -2.94102, -5.259198,
3.383828, -2.94102, -5.259198,
-3.153678, -2.94102, 5.071841,
3.383828, -2.94102, 5.071841,
-3.153678, 3.86546, -5.259198,
3.383828, 3.86546, -5.259198,
-3.153678, 3.86546, 5.071841,
3.383828, 3.86546, 5.071841,
3.383828, -2.94102, -5.259198,
3.383828, 3.86546, -5.259198,
3.383828, -2.94102, 5.071841,
3.383828, 3.86546, 5.071841,
3.383828, -2.94102, -5.259198,
3.383828, -2.94102, 5.071841,
3.383828, 3.86546, -5.259198,
3.383828, 3.86546, 5.071841
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
var radius = 7.471866;
var distance = 33.24318;
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
mvMatrix.translate( -0.115075, -0.46222, 0.09367847 );
mvMatrix.scale( 1.235751, 1.186917, 0.781986 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.24318);
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
copper_carbonate_cop<-read.table("copper_carbonate_cop.xyz", skip=1)
x<-copper_carbonate_cop$V2
y<-copper_carbonate_cop$V3
z<-copper_carbonate_cop$V4
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
11, 6, 2, 0, 0, 1, 1, 1,
1, 2, 1, 1, 0, 0, 1, 1,
1, 4, 1, 1, 0, 0, 1, 1,
4, 2, 1, 1, 0, 0, 1, 1,
2, 3, 1, 1, 0, 0, 1, 1,
7, 3, 1, 1, 0, 0, 1, 1,
4, 4, 1, 0, 0, 0, 1, 1,
9, 1, 1, 0, 0, 0, 1, 1,
10, 1, 1, 0, 0, 0, 1, 1,
5, 2, 1, 0, 0, 0, 1, 1,
3, 3, 1, 0, 0, 0, 1, 1,
8, 3, 1, 0, 0, 0, 1, 1,
5, 4, 1, 0, 0, 0, 1, 1,
1, 5, 1, 1, 1, 1, 1, 1,
6, 5, 1, 1, 1, 1, 1, 1
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
var radius = 7.816969;
var distance = 27.45677;
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
mvMatrix.translate( -6, -3.5, -1.5 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -27.45677);
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
for (var i = 0; i < 15; i++) {
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
