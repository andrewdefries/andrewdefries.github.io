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
-3.222854, -0.9381062, -3.086254, 1, 0, 0, 1,
-3.218315, -0.1127801, -3.930612, 1, 0.007843138, 0, 1,
-2.994514, 1.94256, 0.3418721, 1, 0.01176471, 0, 1,
-2.721634, -0.9234183, -0.6452683, 1, 0.01960784, 0, 1,
-2.661417, -0.8279286, -1.694819, 1, 0.02352941, 0, 1,
-2.647311, -0.457962, -3.584109, 1, 0.03137255, 0, 1,
-2.637607, 0.2068922, -2.589705, 1, 0.03529412, 0, 1,
-2.627966, -0.3788365, 0.919355, 1, 0.04313726, 0, 1,
-2.470759, -0.5893368, -1.812546, 1, 0.04705882, 0, 1,
-2.353326, 0.06033185, -2.885173, 1, 0.05490196, 0, 1,
-2.343071, -0.3281547, -1.624034, 1, 0.05882353, 0, 1,
-2.298985, -0.03683431, -1.597444, 1, 0.06666667, 0, 1,
-2.289513, -0.3079967, 0.04375913, 1, 0.07058824, 0, 1,
-2.24856, -0.6030312, -2.553072, 1, 0.07843138, 0, 1,
-2.2206, -0.5401884, -2.979549, 1, 0.08235294, 0, 1,
-2.18106, -0.6704383, -0.08578392, 1, 0.09019608, 0, 1,
-2.17876, -0.324172, -1.811164, 1, 0.09411765, 0, 1,
-2.175821, 0.1074445, -1.397402, 1, 0.1019608, 0, 1,
-2.158561, 0.7663326, 0.1677473, 1, 0.1098039, 0, 1,
-2.149762, -0.6622223, -1.89243, 1, 0.1137255, 0, 1,
-2.101921, 1.857975, 0.3819225, 1, 0.1215686, 0, 1,
-2.099349, -0.4459415, -2.252944, 1, 0.1254902, 0, 1,
-2.098329, 0.9229441, -0.8551954, 1, 0.1333333, 0, 1,
-2.08022, -0.3298518, -3.518566, 1, 0.1372549, 0, 1,
-2.060141, 0.57599, -3.119548, 1, 0.145098, 0, 1,
-2.033607, -0.611784, -2.176818, 1, 0.1490196, 0, 1,
-2.028703, -0.05522741, -0.9690939, 1, 0.1568628, 0, 1,
-1.990029, 1.931745, -1.774863, 1, 0.1607843, 0, 1,
-1.988686, 1.251069, -0.5553041, 1, 0.1686275, 0, 1,
-1.980851, 1.410737, -1.848348, 1, 0.172549, 0, 1,
-1.93523, 0.3344657, -2.651519, 1, 0.1803922, 0, 1,
-1.913687, 0.3435291, 0.4029839, 1, 0.1843137, 0, 1,
-1.8883, 1.55675, -1.831515, 1, 0.1921569, 0, 1,
-1.884025, 0.1786103, -2.941964, 1, 0.1960784, 0, 1,
-1.852593, 1.389074, -1.254504, 1, 0.2039216, 0, 1,
-1.849553, 1.370928, -0.3114634, 1, 0.2117647, 0, 1,
-1.849147, 0.4148242, -0.4859253, 1, 0.2156863, 0, 1,
-1.840786, -1.208132, -0.6592985, 1, 0.2235294, 0, 1,
-1.839243, 0.4190021, -1.109112, 1, 0.227451, 0, 1,
-1.833325, -0.8331156, 0.3977758, 1, 0.2352941, 0, 1,
-1.772533, 1.77108, -0.2650199, 1, 0.2392157, 0, 1,
-1.745538, 1.318611, -1.37093, 1, 0.2470588, 0, 1,
-1.709701, -0.5581, -1.12205, 1, 0.2509804, 0, 1,
-1.69692, -0.6550996, -3.429012, 1, 0.2588235, 0, 1,
-1.694904, 1.149389, 0.3414339, 1, 0.2627451, 0, 1,
-1.682593, -1.271386, -2.698328, 1, 0.2705882, 0, 1,
-1.67823, 0.05850585, -2.951298, 1, 0.2745098, 0, 1,
-1.657073, 0.6077848, -1.878225, 1, 0.282353, 0, 1,
-1.641887, 0.2603197, -1.001573, 1, 0.2862745, 0, 1,
-1.62236, 0.8966125, 0.4260609, 1, 0.2941177, 0, 1,
-1.594408, 1.869034, 0.3545923, 1, 0.3019608, 0, 1,
-1.590341, -0.1304587, -0.6296099, 1, 0.3058824, 0, 1,
-1.587084, 1.085983, -1.192325, 1, 0.3137255, 0, 1,
-1.586181, -0.2827191, 0.8963419, 1, 0.3176471, 0, 1,
-1.583262, -1.374138, -3.003783, 1, 0.3254902, 0, 1,
-1.581671, -0.1346375, -2.037677, 1, 0.3294118, 0, 1,
-1.54527, 1.301498, -1.316854, 1, 0.3372549, 0, 1,
-1.533829, -0.1385514, -3.645639, 1, 0.3411765, 0, 1,
-1.531047, 0.9593272, -0.1740288, 1, 0.3490196, 0, 1,
-1.529538, -1.692279, -2.717249, 1, 0.3529412, 0, 1,
-1.521022, 0.2752998, -2.898877, 1, 0.3607843, 0, 1,
-1.519963, 0.5229409, -1.647776, 1, 0.3647059, 0, 1,
-1.496834, 0.5541286, -2.0728, 1, 0.372549, 0, 1,
-1.488517, 1.763482, 0.9809542, 1, 0.3764706, 0, 1,
-1.484444, -0.2274932, -0.7498485, 1, 0.3843137, 0, 1,
-1.483771, 1.648386, -0.3460928, 1, 0.3882353, 0, 1,
-1.472704, -0.2991431, -4.827274, 1, 0.3960784, 0, 1,
-1.468395, 0.1256452, -0.314962, 1, 0.4039216, 0, 1,
-1.467057, 0.9136783, -0.8673516, 1, 0.4078431, 0, 1,
-1.463734, 0.02010953, -1.611105, 1, 0.4156863, 0, 1,
-1.459926, -0.9403913, -2.520792, 1, 0.4196078, 0, 1,
-1.451096, 2.249311, -2.778145, 1, 0.427451, 0, 1,
-1.447438, 1.111465, 0.1127939, 1, 0.4313726, 0, 1,
-1.44565, -0.8070631, -1.336561, 1, 0.4392157, 0, 1,
-1.437426, -0.1584558, -1.879308, 1, 0.4431373, 0, 1,
-1.435498, -0.1123537, -3.097799, 1, 0.4509804, 0, 1,
-1.427288, 0.5838202, -0.8711747, 1, 0.454902, 0, 1,
-1.422064, -0.7342641, -1.983973, 1, 0.4627451, 0, 1,
-1.420968, -0.8178449, -1.957539, 1, 0.4666667, 0, 1,
-1.409326, -0.0002827919, -1.283927, 1, 0.4745098, 0, 1,
-1.406075, -0.4544526, -1.937938, 1, 0.4784314, 0, 1,
-1.404786, 1.412638, -1.477957, 1, 0.4862745, 0, 1,
-1.398449, 0.5245444, -1.55415, 1, 0.4901961, 0, 1,
-1.39511, -0.3274684, -1.068518, 1, 0.4980392, 0, 1,
-1.392271, -0.6468312, -3.112226, 1, 0.5058824, 0, 1,
-1.369041, 1.373556, -1.741138, 1, 0.509804, 0, 1,
-1.369018, -0.3050053, -1.300214, 1, 0.5176471, 0, 1,
-1.362365, -0.5925831, -2.609464, 1, 0.5215687, 0, 1,
-1.347583, 0.4539362, -1.143405, 1, 0.5294118, 0, 1,
-1.332223, -0.3325451, -0.701892, 1, 0.5333334, 0, 1,
-1.328982, 1.211722, -3.206949, 1, 0.5411765, 0, 1,
-1.32555, -1.565986, -1.403874, 1, 0.5450981, 0, 1,
-1.324497, 0.6872771, 0.770461, 1, 0.5529412, 0, 1,
-1.318403, 0.6666734, -2.858948, 1, 0.5568628, 0, 1,
-1.307538, 1.802709, -1.256533, 1, 0.5647059, 0, 1,
-1.306195, -0.2613561, -1.858164, 1, 0.5686275, 0, 1,
-1.304575, 1.538234, -0.07637522, 1, 0.5764706, 0, 1,
-1.296236, -1.467572, -1.59736, 1, 0.5803922, 0, 1,
-1.287666, -0.2152724, -1.721734, 1, 0.5882353, 0, 1,
-1.275792, 1.63351, -0.6416228, 1, 0.5921569, 0, 1,
-1.27386, 0.4782543, 0.9093593, 1, 0.6, 0, 1,
-1.26068, 0.07885765, -0.5248359, 1, 0.6078432, 0, 1,
-1.253858, -0.02426059, 0.2992296, 1, 0.6117647, 0, 1,
-1.253625, -1.740067, -1.855258, 1, 0.6196079, 0, 1,
-1.238813, 0.5597368, -2.839755, 1, 0.6235294, 0, 1,
-1.236755, 0.6454634, -2.10323, 1, 0.6313726, 0, 1,
-1.232594, 0.1454844, -2.606242, 1, 0.6352941, 0, 1,
-1.227038, 2.047563, 0.3437494, 1, 0.6431373, 0, 1,
-1.224353, 0.9747857, -1.656134, 1, 0.6470588, 0, 1,
-1.224009, 1.774708, -0.916837, 1, 0.654902, 0, 1,
-1.218619, 0.7182451, -1.36612, 1, 0.6588235, 0, 1,
-1.217025, 0.03694473, -3.013133, 1, 0.6666667, 0, 1,
-1.211109, -0.5271184, -1.604163, 1, 0.6705883, 0, 1,
-1.209388, 1.034375, 0.4123666, 1, 0.6784314, 0, 1,
-1.205582, -0.396196, -3.30053, 1, 0.682353, 0, 1,
-1.202871, -0.1587555, -2.6674, 1, 0.6901961, 0, 1,
-1.200506, -0.2471746, -2.037355, 1, 0.6941177, 0, 1,
-1.19965, 0.01712691, -0.8014887, 1, 0.7019608, 0, 1,
-1.19641, -1.944428, -1.95912, 1, 0.7098039, 0, 1,
-1.189567, -0.7563942, -1.155243, 1, 0.7137255, 0, 1,
-1.183571, 0.02995835, -2.675201, 1, 0.7215686, 0, 1,
-1.176664, 0.08424051, -2.961154, 1, 0.7254902, 0, 1,
-1.172555, 1.947503, 0.02755086, 1, 0.7333333, 0, 1,
-1.162605, -0.09635408, 0.4385462, 1, 0.7372549, 0, 1,
-1.158623, 0.6247218, 0.02515291, 1, 0.7450981, 0, 1,
-1.139857, -0.1695685, -3.479085, 1, 0.7490196, 0, 1,
-1.131432, -0.7283542, -1.61134, 1, 0.7568628, 0, 1,
-1.130072, -0.5468841, 0.4872018, 1, 0.7607843, 0, 1,
-1.127041, 0.6207312, -1.837515, 1, 0.7686275, 0, 1,
-1.119978, -0.2351283, -3.175568, 1, 0.772549, 0, 1,
-1.115871, -0.1023534, -2.509656, 1, 0.7803922, 0, 1,
-1.112144, 0.7473847, -1.541397, 1, 0.7843137, 0, 1,
-1.090868, -0.8926665, -2.829133, 1, 0.7921569, 0, 1,
-1.080051, 0.6697605, 1.466521, 1, 0.7960784, 0, 1,
-1.078471, 0.3519137, -1.170783, 1, 0.8039216, 0, 1,
-1.074435, 1.150896, -0.3858452, 1, 0.8117647, 0, 1,
-1.064181, 0.02934947, -1.4023, 1, 0.8156863, 0, 1,
-1.062649, 0.8152441, 1.092998, 1, 0.8235294, 0, 1,
-1.060427, -0.1317949, -0.6114783, 1, 0.827451, 0, 1,
-1.053894, -0.1381453, -2.202332, 1, 0.8352941, 0, 1,
-1.050275, -0.3953066, -1.486542, 1, 0.8392157, 0, 1,
-1.04793, 0.5163604, -1.588601, 1, 0.8470588, 0, 1,
-1.03961, 0.5898812, -1.132812, 1, 0.8509804, 0, 1,
-1.038988, -1.002169, -2.151085, 1, 0.8588235, 0, 1,
-1.021639, 1.097621, -2.652484, 1, 0.8627451, 0, 1,
-1.00796, -1.896292, -2.890104, 1, 0.8705882, 0, 1,
-1.007635, 1.086004, -0.5164745, 1, 0.8745098, 0, 1,
-0.9995657, 0.7170032, -1.341989, 1, 0.8823529, 0, 1,
-0.9926614, -1.149872, -0.6886134, 1, 0.8862745, 0, 1,
-0.9916909, -0.5667142, -1.359438, 1, 0.8941177, 0, 1,
-0.990492, 1.003436, -1.473213, 1, 0.8980392, 0, 1,
-0.9845247, -0.345065, -2.008004, 1, 0.9058824, 0, 1,
-0.9819022, 0.1003163, -2.187673, 1, 0.9137255, 0, 1,
-0.9765291, -0.1161501, -1.376096, 1, 0.9176471, 0, 1,
-0.9741498, 0.6598828, -0.2155382, 1, 0.9254902, 0, 1,
-0.9740819, 0.1497395, -1.283315, 1, 0.9294118, 0, 1,
-0.9713087, 1.073415, 0.534353, 1, 0.9372549, 0, 1,
-0.9690548, 0.552647, -0.4597028, 1, 0.9411765, 0, 1,
-0.9667058, -0.6788632, -0.4554588, 1, 0.9490196, 0, 1,
-0.9606302, 0.4865355, -1.526718, 1, 0.9529412, 0, 1,
-0.9532667, -1.695756, -2.866965, 1, 0.9607843, 0, 1,
-0.9464261, 0.2046548, -0.8938667, 1, 0.9647059, 0, 1,
-0.9398071, -0.3951015, -0.8288211, 1, 0.972549, 0, 1,
-0.9387853, 0.671443, -1.001408, 1, 0.9764706, 0, 1,
-0.9323233, -1.03916, -1.861184, 1, 0.9843137, 0, 1,
-0.9233754, -1.619584, -2.603842, 1, 0.9882353, 0, 1,
-0.9218947, 1.43431, -0.01223513, 1, 0.9960784, 0, 1,
-0.9144034, 0.3100732, -0.7156891, 0.9960784, 1, 0, 1,
-0.9117238, 0.5253524, -0.8215479, 0.9921569, 1, 0, 1,
-0.911659, 0.1258222, -0.6449276, 0.9843137, 1, 0, 1,
-0.9017484, 0.1923509, -1.639156, 0.9803922, 1, 0, 1,
-0.8907322, 2.247062, -0.5427616, 0.972549, 1, 0, 1,
-0.8886136, 1.800979, -1.803853, 0.9686275, 1, 0, 1,
-0.8885317, -1.406444, -3.335497, 0.9607843, 1, 0, 1,
-0.8861585, -0.6347939, -2.226533, 0.9568627, 1, 0, 1,
-0.8847295, 0.7983471, -0.4258724, 0.9490196, 1, 0, 1,
-0.8809577, -0.1602621, -0.8472734, 0.945098, 1, 0, 1,
-0.8794873, -0.2183295, -1.81656, 0.9372549, 1, 0, 1,
-0.8786407, -0.6776676, -3.270596, 0.9333333, 1, 0, 1,
-0.8757402, 1.330134, -0.5625696, 0.9254902, 1, 0, 1,
-0.8707522, -0.07514922, -2.858383, 0.9215686, 1, 0, 1,
-0.8579514, 0.03637574, -1.487482, 0.9137255, 1, 0, 1,
-0.85571, -1.353291, -4.0303, 0.9098039, 1, 0, 1,
-0.8466198, 0.878822, -1.92095, 0.9019608, 1, 0, 1,
-0.846616, 0.6378915, -1.554464, 0.8941177, 1, 0, 1,
-0.8465841, -0.4207185, -2.541538, 0.8901961, 1, 0, 1,
-0.8458446, 1.063001, 0.05972207, 0.8823529, 1, 0, 1,
-0.8401675, 0.4206939, -0.925257, 0.8784314, 1, 0, 1,
-0.8387713, -1.563131, -2.4386, 0.8705882, 1, 0, 1,
-0.8384275, -0.1453958, -1.363916, 0.8666667, 1, 0, 1,
-0.8378453, -1.346843, -2.787973, 0.8588235, 1, 0, 1,
-0.835898, 0.2374223, -2.562617, 0.854902, 1, 0, 1,
-0.8293685, 0.1424352, -0.6034545, 0.8470588, 1, 0, 1,
-0.8241637, -1.680164, -1.358097, 0.8431373, 1, 0, 1,
-0.8155503, 1.484549, -0.9475349, 0.8352941, 1, 0, 1,
-0.8105592, 0.8547876, -2.510275, 0.8313726, 1, 0, 1,
-0.8100342, 0.3121193, -2.144303, 0.8235294, 1, 0, 1,
-0.8050178, 0.8442668, -1.32056, 0.8196079, 1, 0, 1,
-0.8044093, 2.082245, -0.3269942, 0.8117647, 1, 0, 1,
-0.8038027, -0.8240966, -1.173728, 0.8078431, 1, 0, 1,
-0.8025932, 1.061163, -1.470368, 0.8, 1, 0, 1,
-0.7989253, 0.4788553, -1.261191, 0.7921569, 1, 0, 1,
-0.7956572, -0.6144007, -2.742815, 0.7882353, 1, 0, 1,
-0.7953218, 0.5951703, -0.4546519, 0.7803922, 1, 0, 1,
-0.7950482, 1.003221, -1.61077, 0.7764706, 1, 0, 1,
-0.7843764, -0.08183938, -2.844075, 0.7686275, 1, 0, 1,
-0.782028, -1.326666, -1.290864, 0.7647059, 1, 0, 1,
-0.7780084, -0.7678021, -2.826821, 0.7568628, 1, 0, 1,
-0.775769, -1.431929, -2.751437, 0.7529412, 1, 0, 1,
-0.7737499, 0.1361617, 0.2862311, 0.7450981, 1, 0, 1,
-0.7729786, -0.5441062, -2.467014, 0.7411765, 1, 0, 1,
-0.7703485, 1.123222, -1.361843, 0.7333333, 1, 0, 1,
-0.7671251, 1.325476, -0.1544083, 0.7294118, 1, 0, 1,
-0.7671209, 1.164876, 0.4844099, 0.7215686, 1, 0, 1,
-0.7670299, 0.7594661, -0.7222889, 0.7176471, 1, 0, 1,
-0.762315, -0.5334589, -3.950448, 0.7098039, 1, 0, 1,
-0.7543563, 0.2700923, -0.5800164, 0.7058824, 1, 0, 1,
-0.7500868, -0.2801515, -1.507198, 0.6980392, 1, 0, 1,
-0.7493796, -0.6681625, -3.82141, 0.6901961, 1, 0, 1,
-0.7489676, -1.833776, -2.896976, 0.6862745, 1, 0, 1,
-0.7471313, 0.8485098, 1.513721, 0.6784314, 1, 0, 1,
-0.7452164, -0.2410718, -2.315343, 0.6745098, 1, 0, 1,
-0.7437769, -0.07209691, 0.2060383, 0.6666667, 1, 0, 1,
-0.7402601, 0.1548857, -0.1413407, 0.6627451, 1, 0, 1,
-0.7378567, -0.4362739, -2.672029, 0.654902, 1, 0, 1,
-0.7364507, 0.6052048, -1.626213, 0.6509804, 1, 0, 1,
-0.7318435, -1.751455, -2.250879, 0.6431373, 1, 0, 1,
-0.7303672, -0.8408521, -3.156694, 0.6392157, 1, 0, 1,
-0.728897, -0.1152097, -2.656261, 0.6313726, 1, 0, 1,
-0.7272179, 0.8817939, -1.571475, 0.627451, 1, 0, 1,
-0.7263756, 1.9857, -0.2163394, 0.6196079, 1, 0, 1,
-0.7250875, -0.1821183, -1.438317, 0.6156863, 1, 0, 1,
-0.7231205, -0.5230034, -1.307755, 0.6078432, 1, 0, 1,
-0.7211714, -0.5181909, -1.33303, 0.6039216, 1, 0, 1,
-0.72064, 1.031016, -0.1395004, 0.5960785, 1, 0, 1,
-0.7108977, 0.5022659, -0.8245561, 0.5882353, 1, 0, 1,
-0.7053051, 0.1835936, -3.621293, 0.5843138, 1, 0, 1,
-0.7034335, 0.02140798, 0.611382, 0.5764706, 1, 0, 1,
-0.700234, -0.3183151, -1.918743, 0.572549, 1, 0, 1,
-0.6947003, 0.0005939566, -3.309207, 0.5647059, 1, 0, 1,
-0.6820549, 0.7965556, -1.528571, 0.5607843, 1, 0, 1,
-0.6774427, 0.01292764, -2.492836, 0.5529412, 1, 0, 1,
-0.6724259, 0.5530357, -0.7951517, 0.5490196, 1, 0, 1,
-0.6619133, 0.4825256, -0.05423188, 0.5411765, 1, 0, 1,
-0.6568164, 1.764746, -0.7070575, 0.5372549, 1, 0, 1,
-0.6550857, 0.4834696, -1.430502, 0.5294118, 1, 0, 1,
-0.6515116, -0.3829814, -1.843906, 0.5254902, 1, 0, 1,
-0.6486548, 0.1265945, -0.6154101, 0.5176471, 1, 0, 1,
-0.6445979, 0.5519805, -1.254925, 0.5137255, 1, 0, 1,
-0.6419687, 0.03797009, -3.125866, 0.5058824, 1, 0, 1,
-0.637876, -1.43989, -1.919224, 0.5019608, 1, 0, 1,
-0.6357491, -0.1988344, -3.194073, 0.4941176, 1, 0, 1,
-0.6348998, 0.9174334, -1.408569, 0.4862745, 1, 0, 1,
-0.6343124, 0.01254923, -2.346249, 0.4823529, 1, 0, 1,
-0.632305, 1.583025, 0.6047615, 0.4745098, 1, 0, 1,
-0.627389, -0.5943825, -3.904261, 0.4705882, 1, 0, 1,
-0.6254158, 1.141957, 1.720335, 0.4627451, 1, 0, 1,
-0.6206966, 1.043205, -1.953045, 0.4588235, 1, 0, 1,
-0.6172051, -0.3786352, -0.6363374, 0.4509804, 1, 0, 1,
-0.6109313, -0.1142282, -0.6738638, 0.4470588, 1, 0, 1,
-0.6099639, -0.4383626, -1.950912, 0.4392157, 1, 0, 1,
-0.6064289, -0.3893814, -2.255381, 0.4352941, 1, 0, 1,
-0.6010746, -0.8527789, -3.402159, 0.427451, 1, 0, 1,
-0.6007987, 0.1638709, -2.077302, 0.4235294, 1, 0, 1,
-0.5975366, -0.2741531, -1.707889, 0.4156863, 1, 0, 1,
-0.5942836, 1.791422, 1.354966, 0.4117647, 1, 0, 1,
-0.5918584, 1.427056, -1.17087, 0.4039216, 1, 0, 1,
-0.5824748, -0.5939969, -4.511362, 0.3960784, 1, 0, 1,
-0.5803761, 0.6198932, -1.396702, 0.3921569, 1, 0, 1,
-0.5771351, 1.744404, -0.9634918, 0.3843137, 1, 0, 1,
-0.5750561, -1.096968, -2.267016, 0.3803922, 1, 0, 1,
-0.5716164, -0.4534731, -0.1326333, 0.372549, 1, 0, 1,
-0.56954, 0.1618652, -0.6224673, 0.3686275, 1, 0, 1,
-0.5630519, -1.311984, -3.167817, 0.3607843, 1, 0, 1,
-0.5618382, -0.007640758, -3.791451, 0.3568628, 1, 0, 1,
-0.5576442, -0.5840513, -2.742632, 0.3490196, 1, 0, 1,
-0.5566612, 0.5566887, -3.140275, 0.345098, 1, 0, 1,
-0.5531674, 1.8763, -0.8263249, 0.3372549, 1, 0, 1,
-0.5509789, -1.117874, -1.671647, 0.3333333, 1, 0, 1,
-0.550082, -0.195649, -0.6400966, 0.3254902, 1, 0, 1,
-0.5465588, -0.9545842, -4.100917, 0.3215686, 1, 0, 1,
-0.5459973, 0.9592441, -1.707719, 0.3137255, 1, 0, 1,
-0.541388, 1.401961, -0.6107618, 0.3098039, 1, 0, 1,
-0.5369307, -0.7980536, -4.314472, 0.3019608, 1, 0, 1,
-0.5309755, -0.3556006, -1.9875, 0.2941177, 1, 0, 1,
-0.5216571, 0.7092931, -1.331456, 0.2901961, 1, 0, 1,
-0.5202126, 0.350381, 1.033579, 0.282353, 1, 0, 1,
-0.5156294, -0.6382113, -2.457928, 0.2784314, 1, 0, 1,
-0.5121061, -1.10176, -3.342972, 0.2705882, 1, 0, 1,
-0.5063915, 1.453966, 1.032455, 0.2666667, 1, 0, 1,
-0.5009055, -0.5704176, -3.907065, 0.2588235, 1, 0, 1,
-0.4974751, 0.652099, 1.30951, 0.254902, 1, 0, 1,
-0.4965671, -0.7624707, -2.347696, 0.2470588, 1, 0, 1,
-0.496096, 0.6022181, 0.4361708, 0.2431373, 1, 0, 1,
-0.4930222, -0.118605, -3.015094, 0.2352941, 1, 0, 1,
-0.4920713, -1.322718, -2.407739, 0.2313726, 1, 0, 1,
-0.4890422, 0.2537126, -2.381165, 0.2235294, 1, 0, 1,
-0.4855426, -0.7613785, -3.009583, 0.2196078, 1, 0, 1,
-0.4852625, 0.2767809, 0.03243358, 0.2117647, 1, 0, 1,
-0.4804563, -0.8632687, -1.978652, 0.2078431, 1, 0, 1,
-0.4774843, 1.573843, -1.672487, 0.2, 1, 0, 1,
-0.4760908, 0.678115, -0.3209205, 0.1921569, 1, 0, 1,
-0.4752964, -0.8507725, -3.739213, 0.1882353, 1, 0, 1,
-0.4712276, 0.6390942, 0.04249773, 0.1803922, 1, 0, 1,
-0.4680476, -0.06048176, -2.407749, 0.1764706, 1, 0, 1,
-0.4671595, 0.6679643, -0.8837233, 0.1686275, 1, 0, 1,
-0.4662215, 0.2882532, -0.1460903, 0.1647059, 1, 0, 1,
-0.4655, -1.691978, -3.015745, 0.1568628, 1, 0, 1,
-0.4633368, -0.5233747, -2.769665, 0.1529412, 1, 0, 1,
-0.4596586, 0.9447854, -0.8958933, 0.145098, 1, 0, 1,
-0.4567526, -0.3488988, -2.716244, 0.1411765, 1, 0, 1,
-0.451546, 1.538652, -1.475893, 0.1333333, 1, 0, 1,
-0.444243, -0.7832173, -1.96309, 0.1294118, 1, 0, 1,
-0.4300821, -1.007373, -1.473438, 0.1215686, 1, 0, 1,
-0.427914, -1.723607, -3.510894, 0.1176471, 1, 0, 1,
-0.4233096, 0.8351499, 0.1925258, 0.1098039, 1, 0, 1,
-0.419355, 0.442611, -1.230258, 0.1058824, 1, 0, 1,
-0.4182707, -2.323422, -3.22265, 0.09803922, 1, 0, 1,
-0.4165775, 1.251495, -1.860536, 0.09019608, 1, 0, 1,
-0.4165018, 2.280077, 0.3583613, 0.08627451, 1, 0, 1,
-0.413177, 0.3563369, 0.4492287, 0.07843138, 1, 0, 1,
-0.4104275, -0.1845506, -3.31093, 0.07450981, 1, 0, 1,
-0.4088854, 0.1859001, -0.06115643, 0.06666667, 1, 0, 1,
-0.4086457, -2.445872, -2.931432, 0.0627451, 1, 0, 1,
-0.4072828, 1.346767, -1.455643, 0.05490196, 1, 0, 1,
-0.4043251, -0.03395795, -2.455484, 0.05098039, 1, 0, 1,
-0.399031, 0.6983382, -0.4201659, 0.04313726, 1, 0, 1,
-0.3975394, 0.2924591, 0.6217697, 0.03921569, 1, 0, 1,
-0.3948971, -1.525958, -3.311141, 0.03137255, 1, 0, 1,
-0.3920154, -0.06285135, -2.02841, 0.02745098, 1, 0, 1,
-0.3912884, 0.009210558, -1.941912, 0.01960784, 1, 0, 1,
-0.3839686, -1.375991, -2.577558, 0.01568628, 1, 0, 1,
-0.3816552, -0.1967276, -2.778228, 0.007843138, 1, 0, 1,
-0.3801801, -0.1075195, -2.940615, 0.003921569, 1, 0, 1,
-0.3782413, -0.2724071, -1.875145, 0, 1, 0.003921569, 1,
-0.374906, 0.6599268, -1.694833, 0, 1, 0.01176471, 1,
-0.3729774, 0.2535709, -0.02521681, 0, 1, 0.01568628, 1,
-0.3707302, 0.6574824, 0.3013095, 0, 1, 0.02352941, 1,
-0.3683588, 1.165918, -1.461836, 0, 1, 0.02745098, 1,
-0.3630598, -0.9637024, -0.008239402, 0, 1, 0.03529412, 1,
-0.3587428, 1.214255, -0.1615514, 0, 1, 0.03921569, 1,
-0.3576456, -0.5255861, -0.7263623, 0, 1, 0.04705882, 1,
-0.3549532, -0.4713043, -3.099282, 0, 1, 0.05098039, 1,
-0.3535246, 0.5430043, 0.2475508, 0, 1, 0.05882353, 1,
-0.3527746, -0.7977207, -2.926502, 0, 1, 0.0627451, 1,
-0.3518392, 0.898121, -1.882819, 0, 1, 0.07058824, 1,
-0.3494351, 1.085487, -0.8712923, 0, 1, 0.07450981, 1,
-0.3439776, -0.1727538, -0.4208588, 0, 1, 0.08235294, 1,
-0.3347331, -0.3931012, -1.920157, 0, 1, 0.08627451, 1,
-0.3327429, -0.01364824, -2.163022, 0, 1, 0.09411765, 1,
-0.3300422, -0.191366, -2.248027, 0, 1, 0.1019608, 1,
-0.3234337, 0.4947731, 0.0658171, 0, 1, 0.1058824, 1,
-0.3218033, -1.166046, -1.05614, 0, 1, 0.1137255, 1,
-0.3212219, 0.03391222, 0.09597356, 0, 1, 0.1176471, 1,
-0.3159522, -0.5648317, -2.804564, 0, 1, 0.1254902, 1,
-0.31439, 0.1478636, -2.171703, 0, 1, 0.1294118, 1,
-0.3143456, 0.4295568, -0.4292549, 0, 1, 0.1372549, 1,
-0.3089935, -1.275446, -3.179526, 0, 1, 0.1411765, 1,
-0.3077448, 0.04972624, -0.6295171, 0, 1, 0.1490196, 1,
-0.2973696, 1.360366, 1.146114, 0, 1, 0.1529412, 1,
-0.2944223, 0.4830539, -1.508268, 0, 1, 0.1607843, 1,
-0.2940174, 0.2125471, -1.077471, 0, 1, 0.1647059, 1,
-0.2940005, 1.044678, 0.6158292, 0, 1, 0.172549, 1,
-0.2938192, 0.9650261, -0.003288533, 0, 1, 0.1764706, 1,
-0.2935435, -0.2175019, -5.251399, 0, 1, 0.1843137, 1,
-0.2921125, 0.5089077, -1.610914, 0, 1, 0.1882353, 1,
-0.2916087, -1.147089, -1.651655, 0, 1, 0.1960784, 1,
-0.2890285, -0.6336399, -3.898475, 0, 1, 0.2039216, 1,
-0.2872307, -0.904324, -2.626757, 0, 1, 0.2078431, 1,
-0.2852308, -0.219042, -2.040629, 0, 1, 0.2156863, 1,
-0.2848253, 1.240322, -0.4448847, 0, 1, 0.2196078, 1,
-0.2820621, 1.074574, 1.658263, 0, 1, 0.227451, 1,
-0.2811907, -1.056319, -1.843867, 0, 1, 0.2313726, 1,
-0.2811287, -0.6505556, -1.496245, 0, 1, 0.2392157, 1,
-0.2775705, 0.7856023, 0.647948, 0, 1, 0.2431373, 1,
-0.2769862, 0.1827401, -2.418325, 0, 1, 0.2509804, 1,
-0.2748931, 0.2892907, 0.8530627, 0, 1, 0.254902, 1,
-0.2729708, 0.9424304, 1.97005, 0, 1, 0.2627451, 1,
-0.2685847, -0.3624104, -4.064373, 0, 1, 0.2666667, 1,
-0.2667219, 0.1581929, -1.177612, 0, 1, 0.2745098, 1,
-0.2622709, -1.229948, -3.830798, 0, 1, 0.2784314, 1,
-0.2618259, 0.1628535, -1.237214, 0, 1, 0.2862745, 1,
-0.2599196, 0.6382027, 0.3706023, 0, 1, 0.2901961, 1,
-0.2521424, -0.3829285, -2.49163, 0, 1, 0.2980392, 1,
-0.2518026, -0.358426, -3.679372, 0, 1, 0.3058824, 1,
-0.2510903, -1.056936, -2.767872, 0, 1, 0.3098039, 1,
-0.2460781, 0.7784606, 0.9864848, 0, 1, 0.3176471, 1,
-0.244728, 0.8366386, 0.3656763, 0, 1, 0.3215686, 1,
-0.2408508, -1.370814, -2.331542, 0, 1, 0.3294118, 1,
-0.2406434, 1.070515, 2.204935, 0, 1, 0.3333333, 1,
-0.2382958, -0.7629267, -1.700783, 0, 1, 0.3411765, 1,
-0.2381415, -0.3840728, -2.225522, 0, 1, 0.345098, 1,
-0.2269891, -1.29026, -2.698179, 0, 1, 0.3529412, 1,
-0.224567, -0.4382085, -3.128022, 0, 1, 0.3568628, 1,
-0.2236765, -0.1762936, -3.325732, 0, 1, 0.3647059, 1,
-0.2199719, 0.0863215, -1.990953, 0, 1, 0.3686275, 1,
-0.2102262, -0.4596245, -2.228449, 0, 1, 0.3764706, 1,
-0.2095707, -0.7826437, -3.11361, 0, 1, 0.3803922, 1,
-0.206276, -0.5837195, -2.442097, 0, 1, 0.3882353, 1,
-0.2048785, -0.2565744, -2.454335, 0, 1, 0.3921569, 1,
-0.2043396, -1.571738, -1.980025, 0, 1, 0.4, 1,
-0.2022753, 0.3428526, -0.4654064, 0, 1, 0.4078431, 1,
-0.2018081, 1.208878, 1.195755, 0, 1, 0.4117647, 1,
-0.1976958, 0.2912498, 0.06992882, 0, 1, 0.4196078, 1,
-0.1944874, -0.8453583, -3.84593, 0, 1, 0.4235294, 1,
-0.1931, 0.03180186, -2.051147, 0, 1, 0.4313726, 1,
-0.191265, -1.795171, -2.503561, 0, 1, 0.4352941, 1,
-0.1891875, 0.3513435, -0.4233764, 0, 1, 0.4431373, 1,
-0.1866251, 0.0355973, -0.3837347, 0, 1, 0.4470588, 1,
-0.1837066, 0.8947585, -1.790895, 0, 1, 0.454902, 1,
-0.1791309, 0.6532901, -0.02884914, 0, 1, 0.4588235, 1,
-0.1761012, 1.17435, -0.7852604, 0, 1, 0.4666667, 1,
-0.1742793, -2.433306, -4.544402, 0, 1, 0.4705882, 1,
-0.1711504, 0.3653674, -0.393928, 0, 1, 0.4784314, 1,
-0.1685208, 0.2107165, -2.377929, 0, 1, 0.4823529, 1,
-0.1639009, -0.239267, -2.414332, 0, 1, 0.4901961, 1,
-0.1524524, -0.06868611, -1.504016, 0, 1, 0.4941176, 1,
-0.1502263, 0.6633593, -0.6755973, 0, 1, 0.5019608, 1,
-0.1496305, -1.019678, -1.785895, 0, 1, 0.509804, 1,
-0.1432645, -0.05665112, -1.687079, 0, 1, 0.5137255, 1,
-0.1427236, 0.5108153, -1.883551, 0, 1, 0.5215687, 1,
-0.1407682, 0.2888214, 1.603673, 0, 1, 0.5254902, 1,
-0.138723, -1.296146, -1.134111, 0, 1, 0.5333334, 1,
-0.1357152, 1.050467, -1.80761, 0, 1, 0.5372549, 1,
-0.1349983, -2.391588, -3.465654, 0, 1, 0.5450981, 1,
-0.1332181, -1.235825, -3.600303, 0, 1, 0.5490196, 1,
-0.1273121, -0.1129247, -0.8775027, 0, 1, 0.5568628, 1,
-0.1270638, -0.05545646, -1.544797, 0, 1, 0.5607843, 1,
-0.1269726, 0.3583649, -1.141812, 0, 1, 0.5686275, 1,
-0.1257029, 0.3363973, -0.3842803, 0, 1, 0.572549, 1,
-0.1253818, 0.4571859, 0.8720874, 0, 1, 0.5803922, 1,
-0.124771, 1.03726, -0.7658221, 0, 1, 0.5843138, 1,
-0.123408, -1.755366, -3.274435, 0, 1, 0.5921569, 1,
-0.1184307, -0.5954294, -1.75958, 0, 1, 0.5960785, 1,
-0.1179988, -0.139997, -2.023501, 0, 1, 0.6039216, 1,
-0.117028, -1.492899, -3.363509, 0, 1, 0.6117647, 1,
-0.1152744, -0.3268739, -4.426819, 0, 1, 0.6156863, 1,
-0.1115206, -0.3413152, -3.465992, 0, 1, 0.6235294, 1,
-0.1114201, -0.1913266, -1.836207, 0, 1, 0.627451, 1,
-0.110459, -0.01982701, -3.318272, 0, 1, 0.6352941, 1,
-0.1059075, 1.170808, 0.8544458, 0, 1, 0.6392157, 1,
-0.1040423, 2.183107, -1.125566, 0, 1, 0.6470588, 1,
-0.09836592, -0.0877229, -1.737051, 0, 1, 0.6509804, 1,
-0.09751523, -1.335802, -6.154613, 0, 1, 0.6588235, 1,
-0.09490977, 0.4160726, -0.3936862, 0, 1, 0.6627451, 1,
-0.08649784, 0.3465161, 0.7758642, 0, 1, 0.6705883, 1,
-0.08629482, 0.5729557, -0.6276944, 0, 1, 0.6745098, 1,
-0.0850836, -0.0419274, -3.194582, 0, 1, 0.682353, 1,
-0.0827817, 0.5686215, -0.6210269, 0, 1, 0.6862745, 1,
-0.08085649, 0.307754, 0.7073835, 0, 1, 0.6941177, 1,
-0.08045699, 0.9082133, 0.05844224, 0, 1, 0.7019608, 1,
-0.08018348, 0.3392637, -1.69365, 0, 1, 0.7058824, 1,
-0.07962769, 0.9380327, 1.625596, 0, 1, 0.7137255, 1,
-0.0793262, 1.21534, 1.04967, 0, 1, 0.7176471, 1,
-0.07622443, 1.536275, -0.9157333, 0, 1, 0.7254902, 1,
-0.07471025, -0.816364, -2.015157, 0, 1, 0.7294118, 1,
-0.07088549, 0.4002287, -0.4323924, 0, 1, 0.7372549, 1,
-0.06956784, -1.197963, -2.467657, 0, 1, 0.7411765, 1,
-0.06890903, 0.2998699, 0.5299616, 0, 1, 0.7490196, 1,
-0.06847025, -0.7177335, -2.520067, 0, 1, 0.7529412, 1,
-0.06300723, -0.9551309, -4.135824, 0, 1, 0.7607843, 1,
-0.06050894, 1.379639, -0.537676, 0, 1, 0.7647059, 1,
-0.05924737, -1.241832, -2.501355, 0, 1, 0.772549, 1,
-0.05840011, 0.8947955, -0.8024054, 0, 1, 0.7764706, 1,
-0.05607833, -0.2547149, -3.794861, 0, 1, 0.7843137, 1,
-0.0419641, -1.632506, -5.686619, 0, 1, 0.7882353, 1,
-0.041089, 0.3044914, -0.6186112, 0, 1, 0.7960784, 1,
-0.03857925, -0.07028564, -3.383896, 0, 1, 0.8039216, 1,
-0.03735369, -0.3602951, -2.08597, 0, 1, 0.8078431, 1,
-0.03521718, -0.03978195, -2.296425, 0, 1, 0.8156863, 1,
-0.02845129, -0.9398371, -5.205548, 0, 1, 0.8196079, 1,
-0.0231901, 0.5173404, 0.8058423, 0, 1, 0.827451, 1,
-0.02302197, -0.2587813, -3.102615, 0, 1, 0.8313726, 1,
-0.02116159, 0.1552504, -1.194628, 0, 1, 0.8392157, 1,
-0.02038169, 0.7591066, -0.8816946, 0, 1, 0.8431373, 1,
-0.01806577, 0.3572296, 0.3088418, 0, 1, 0.8509804, 1,
-0.01759708, 0.4653337, 0.8596003, 0, 1, 0.854902, 1,
-0.01564668, -0.100149, -1.340101, 0, 1, 0.8627451, 1,
-0.01460008, -1.16504, -1.511626, 0, 1, 0.8666667, 1,
-0.01151661, -1.614636, -2.845515, 0, 1, 0.8745098, 1,
-0.01118398, -0.06197239, -2.874834, 0, 1, 0.8784314, 1,
-0.010061, 0.4072873, -0.4194909, 0, 1, 0.8862745, 1,
-0.009732419, -1.050897, -3.379382, 0, 1, 0.8901961, 1,
-0.007716706, 0.5091789, -1.008881, 0, 1, 0.8980392, 1,
-0.006480997, 1.353303, -0.07455676, 0, 1, 0.9058824, 1,
-0.0031532, -1.513443, -3.879494, 0, 1, 0.9098039, 1,
0.004446321, -1.048129, 3.737716, 0, 1, 0.9176471, 1,
0.004835221, -0.9451638, 3.993697, 0, 1, 0.9215686, 1,
0.008114984, -0.2997264, 2.357544, 0, 1, 0.9294118, 1,
0.0129571, 0.1592412, -0.6592374, 0, 1, 0.9333333, 1,
0.01318884, 0.9662937, 0.5535163, 0, 1, 0.9411765, 1,
0.01495724, -0.9824926, 1.333862, 0, 1, 0.945098, 1,
0.01851941, -1.356376, 1.70047, 0, 1, 0.9529412, 1,
0.02084774, -0.2078396, 3.435248, 0, 1, 0.9568627, 1,
0.02195033, 1.149713, 1.981434, 0, 1, 0.9647059, 1,
0.02424611, -0.6725516, 2.569708, 0, 1, 0.9686275, 1,
0.0258229, 0.5306332, 1.151328, 0, 1, 0.9764706, 1,
0.02685979, 0.9978382, 1.018031, 0, 1, 0.9803922, 1,
0.02721003, 2.222203, -1.888594, 0, 1, 0.9882353, 1,
0.02911444, -0.3110366, 3.01827, 0, 1, 0.9921569, 1,
0.03167216, -1.949289, 3.793237, 0, 1, 1, 1,
0.03285228, -0.1046336, 2.033479, 0, 0.9921569, 1, 1,
0.03362125, -2.416284, 4.504135, 0, 0.9882353, 1, 1,
0.03738998, 2.87375, 1.122275, 0, 0.9803922, 1, 1,
0.04128407, -0.2477439, 3.137208, 0, 0.9764706, 1, 1,
0.04143259, -0.5988958, 3.808448, 0, 0.9686275, 1, 1,
0.04422666, 1.061522, 1.563325, 0, 0.9647059, 1, 1,
0.04524753, -0.3298362, 4.346498, 0, 0.9568627, 1, 1,
0.0468269, -1.054191, 3.28688, 0, 0.9529412, 1, 1,
0.04684106, -1.150079, 2.754685, 0, 0.945098, 1, 1,
0.05065874, -1.370977, 2.711487, 0, 0.9411765, 1, 1,
0.05535194, 0.06665156, 1.857789, 0, 0.9333333, 1, 1,
0.0564812, -0.4909643, 2.177241, 0, 0.9294118, 1, 1,
0.05972129, -0.02893311, 2.402401, 0, 0.9215686, 1, 1,
0.06543347, -0.001219643, 2.982554, 0, 0.9176471, 1, 1,
0.06570641, -2.07311, 4.112233, 0, 0.9098039, 1, 1,
0.06878369, -1.651106, 2.539438, 0, 0.9058824, 1, 1,
0.07044647, 0.4983204, 0.7770391, 0, 0.8980392, 1, 1,
0.07285323, 0.376789, -0.9277489, 0, 0.8901961, 1, 1,
0.07292046, 0.0944783, 1.281664, 0, 0.8862745, 1, 1,
0.07458587, 0.6888988, -0.4041858, 0, 0.8784314, 1, 1,
0.07518887, 1.904641, 0.4824314, 0, 0.8745098, 1, 1,
0.07702667, 0.4494887, 1.438082, 0, 0.8666667, 1, 1,
0.07936894, 0.5171252, -0.4079088, 0, 0.8627451, 1, 1,
0.08310284, 0.1253757, 1.582615, 0, 0.854902, 1, 1,
0.08350965, 2.356, -1.006342, 0, 0.8509804, 1, 1,
0.08468015, 0.1977082, 1.004621, 0, 0.8431373, 1, 1,
0.08667069, 0.4631205, 1.190711, 0, 0.8392157, 1, 1,
0.08972724, 0.5925733, -2.414128, 0, 0.8313726, 1, 1,
0.09188082, -0.7142018, 3.928451, 0, 0.827451, 1, 1,
0.0921089, 0.4607339, 0.5551522, 0, 0.8196079, 1, 1,
0.1050587, 0.2373832, 0.6146792, 0, 0.8156863, 1, 1,
0.1177139, -1.247905, 3.058694, 0, 0.8078431, 1, 1,
0.1286169, 1.658345, -0.8028788, 0, 0.8039216, 1, 1,
0.1294761, -1.100232, 1.817293, 0, 0.7960784, 1, 1,
0.1320556, 0.09853392, 0.8042543, 0, 0.7882353, 1, 1,
0.1349902, -0.08373234, 2.797071, 0, 0.7843137, 1, 1,
0.1368556, 2.266173, 0.5850996, 0, 0.7764706, 1, 1,
0.1372295, -0.3259521, 4.550525, 0, 0.772549, 1, 1,
0.1391744, 0.8212944, -0.6267706, 0, 0.7647059, 1, 1,
0.1399447, -2.033406, 2.178902, 0, 0.7607843, 1, 1,
0.1401382, -0.9478892, 2.818579, 0, 0.7529412, 1, 1,
0.14245, -0.3966444, 1.810582, 0, 0.7490196, 1, 1,
0.1478154, 0.5530445, 0.0842637, 0, 0.7411765, 1, 1,
0.1524602, -0.6246144, 1.70574, 0, 0.7372549, 1, 1,
0.1537743, 0.628695, -0.5344954, 0, 0.7294118, 1, 1,
0.1604496, -1.111735, 3.943534, 0, 0.7254902, 1, 1,
0.1608298, -1.028828, 3.329426, 0, 0.7176471, 1, 1,
0.1618705, -2.242769, 4.02328, 0, 0.7137255, 1, 1,
0.1629997, 0.9573413, -0.2311543, 0, 0.7058824, 1, 1,
0.1636557, 1.340115, 0.8945108, 0, 0.6980392, 1, 1,
0.1641754, 1.554541, -1.260886, 0, 0.6941177, 1, 1,
0.1644537, 0.3191876, 0.2128099, 0, 0.6862745, 1, 1,
0.1700048, 0.8131331, -0.3561395, 0, 0.682353, 1, 1,
0.1713436, 0.2396808, -0.7995623, 0, 0.6745098, 1, 1,
0.1820541, -1.169894, 3.28583, 0, 0.6705883, 1, 1,
0.1822665, -0.02565552, 2.657724, 0, 0.6627451, 1, 1,
0.1829513, -0.4519727, 3.568079, 0, 0.6588235, 1, 1,
0.1837303, 1.694134, -0.4981081, 0, 0.6509804, 1, 1,
0.1898191, -0.5596519, 3.807339, 0, 0.6470588, 1, 1,
0.1902364, 0.06567144, 2.544511, 0, 0.6392157, 1, 1,
0.1904054, 1.283017, 0.9949898, 0, 0.6352941, 1, 1,
0.1940383, 0.5703633, 0.7898409, 0, 0.627451, 1, 1,
0.1940761, 0.04183724, 1.017388, 0, 0.6235294, 1, 1,
0.1951199, -1.020251, 3.508958, 0, 0.6156863, 1, 1,
0.1991089, 0.5346388, 0.7402455, 0, 0.6117647, 1, 1,
0.1997832, 0.04448356, 0.8351659, 0, 0.6039216, 1, 1,
0.2008107, 0.1334929, 1.101571, 0, 0.5960785, 1, 1,
0.2029612, 0.1474555, -0.3048117, 0, 0.5921569, 1, 1,
0.2036167, 0.1279007, 1.832948, 0, 0.5843138, 1, 1,
0.2042813, -1.967555, 3.580684, 0, 0.5803922, 1, 1,
0.2060191, 0.5565208, 1.198712, 0, 0.572549, 1, 1,
0.2060619, 1.199049, 0.6427768, 0, 0.5686275, 1, 1,
0.2074483, -0.7510052, 3.1199, 0, 0.5607843, 1, 1,
0.2079826, 1.512307, 0.8220941, 0, 0.5568628, 1, 1,
0.2083588, 0.3779267, 1.724422, 0, 0.5490196, 1, 1,
0.2090665, -0.7295543, 5.016734, 0, 0.5450981, 1, 1,
0.2092917, -0.1131963, 2.741278, 0, 0.5372549, 1, 1,
0.2132521, -1.005168, 4.036458, 0, 0.5333334, 1, 1,
0.2141528, 0.8907592, -0.5157017, 0, 0.5254902, 1, 1,
0.2152336, 1.725348, -0.6650876, 0, 0.5215687, 1, 1,
0.2192255, -0.9759367, 2.328032, 0, 0.5137255, 1, 1,
0.2244364, 0.5099342, 0.6556333, 0, 0.509804, 1, 1,
0.2258977, 0.9729441, 0.09730741, 0, 0.5019608, 1, 1,
0.2302686, -0.7683363, 4.858465, 0, 0.4941176, 1, 1,
0.2364665, -0.2547778, 2.687188, 0, 0.4901961, 1, 1,
0.2365879, -0.9989626, 1.949045, 0, 0.4823529, 1, 1,
0.2371782, 0.363162, 0.0382561, 0, 0.4784314, 1, 1,
0.2424398, 1.400773, -0.267151, 0, 0.4705882, 1, 1,
0.2489671, 0.581991, -0.1769525, 0, 0.4666667, 1, 1,
0.2495041, -0.5066022, 3.721435, 0, 0.4588235, 1, 1,
0.2499859, 0.03224842, 0.5774023, 0, 0.454902, 1, 1,
0.2505181, 1.590918, -1.710232, 0, 0.4470588, 1, 1,
0.2546423, 1.911218, 0.07501753, 0, 0.4431373, 1, 1,
0.2556485, 0.05315698, 1.596765, 0, 0.4352941, 1, 1,
0.2572848, -0.7145922, 3.42171, 0, 0.4313726, 1, 1,
0.2673931, 1.564366, -0.3839422, 0, 0.4235294, 1, 1,
0.2718945, -0.2385602, 2.053068, 0, 0.4196078, 1, 1,
0.2746206, 2.645903, -1.45634, 0, 0.4117647, 1, 1,
0.2752891, -1.312744, 4.146486, 0, 0.4078431, 1, 1,
0.2788812, 1.708102, 0.2694257, 0, 0.4, 1, 1,
0.2835387, 0.1201539, -0.1777193, 0, 0.3921569, 1, 1,
0.284104, 0.5523167, -0.05122101, 0, 0.3882353, 1, 1,
0.2849718, 0.2851274, 2.09055, 0, 0.3803922, 1, 1,
0.2901786, 0.05932975, 1.437637, 0, 0.3764706, 1, 1,
0.2916711, 1.328316, -0.9319075, 0, 0.3686275, 1, 1,
0.2921874, 1.06758, -1.114257, 0, 0.3647059, 1, 1,
0.2963898, -0.5811877, 2.435606, 0, 0.3568628, 1, 1,
0.2988862, -0.512693, 1.821772, 0, 0.3529412, 1, 1,
0.2997832, 1.458912, 1.261071, 0, 0.345098, 1, 1,
0.3005356, -0.3005307, 1.104911, 0, 0.3411765, 1, 1,
0.3008776, 0.5286537, 0.226539, 0, 0.3333333, 1, 1,
0.3035703, 0.7328305, -0.1031903, 0, 0.3294118, 1, 1,
0.3035905, 0.2383306, 1.421524, 0, 0.3215686, 1, 1,
0.3087823, 0.5348308, 1.377513, 0, 0.3176471, 1, 1,
0.3151836, 0.04596191, 0.1615764, 0, 0.3098039, 1, 1,
0.3156386, 0.5319253, 1.643737, 0, 0.3058824, 1, 1,
0.3172412, -0.1016887, 3.827262, 0, 0.2980392, 1, 1,
0.3193153, 0.8057603, 0.1959998, 0, 0.2901961, 1, 1,
0.3206898, -1.256139, 2.547589, 0, 0.2862745, 1, 1,
0.3227198, 0.07436433, 2.05613, 0, 0.2784314, 1, 1,
0.3231202, -0.5622125, 3.238084, 0, 0.2745098, 1, 1,
0.3290632, 0.398554, 2.954775, 0, 0.2666667, 1, 1,
0.3338021, 2.284934, 0.9258122, 0, 0.2627451, 1, 1,
0.3392291, -0.3533523, 3.402426, 0, 0.254902, 1, 1,
0.3400769, 0.5046191, 1.681085, 0, 0.2509804, 1, 1,
0.3406938, 0.9603364, 1.048405, 0, 0.2431373, 1, 1,
0.3490365, 0.2283106, 1.975482, 0, 0.2392157, 1, 1,
0.3491268, -0.9143766, 3.930233, 0, 0.2313726, 1, 1,
0.3494188, 0.09440501, 0.1987311, 0, 0.227451, 1, 1,
0.3516859, 1.65376, -0.513207, 0, 0.2196078, 1, 1,
0.3541384, 1.143048, 0.08340652, 0, 0.2156863, 1, 1,
0.3548883, -0.8504164, 3.510124, 0, 0.2078431, 1, 1,
0.3561403, -1.045848, 3.130849, 0, 0.2039216, 1, 1,
0.3602845, 0.9554698, 1.20984, 0, 0.1960784, 1, 1,
0.3635499, -1.485561, 1.685624, 0, 0.1882353, 1, 1,
0.365092, 1.241335, 2.185859, 0, 0.1843137, 1, 1,
0.3701331, -1.566102, 3.031179, 0, 0.1764706, 1, 1,
0.3716618, 1.474749, -1.625694, 0, 0.172549, 1, 1,
0.3784092, 0.5241538, 0.9951538, 0, 0.1647059, 1, 1,
0.3805343, 0.2454923, 1.134055, 0, 0.1607843, 1, 1,
0.3838318, 0.2065829, 1.370265, 0, 0.1529412, 1, 1,
0.3848388, 0.2444494, 0.3460525, 0, 0.1490196, 1, 1,
0.3870772, -0.5105106, 2.069555, 0, 0.1411765, 1, 1,
0.389883, -0.05899074, 2.956234, 0, 0.1372549, 1, 1,
0.3906659, -0.3290398, 1.795873, 0, 0.1294118, 1, 1,
0.3906825, -0.8870599, 2.621982, 0, 0.1254902, 1, 1,
0.3929667, -0.1822619, 1.072652, 0, 0.1176471, 1, 1,
0.3934269, 0.3563414, 0.1509425, 0, 0.1137255, 1, 1,
0.395004, 1.176253, 1.306074, 0, 0.1058824, 1, 1,
0.3957606, 2.149794, 0.1778473, 0, 0.09803922, 1, 1,
0.3983367, 1.537847, 1.950535, 0, 0.09411765, 1, 1,
0.4025224, -0.04134397, 2.4674, 0, 0.08627451, 1, 1,
0.4085512, -0.6051915, 3.431324, 0, 0.08235294, 1, 1,
0.4169179, 0.5217146, 0.6215227, 0, 0.07450981, 1, 1,
0.4175521, -0.1111462, 0.7745638, 0, 0.07058824, 1, 1,
0.4196355, 0.2056401, 1.847492, 0, 0.0627451, 1, 1,
0.4207067, -0.5627275, 3.013374, 0, 0.05882353, 1, 1,
0.4225734, 0.009178291, 0.1191314, 0, 0.05098039, 1, 1,
0.4231583, -1.075296, 4.127098, 0, 0.04705882, 1, 1,
0.4267739, -0.9710786, 3.69028, 0, 0.03921569, 1, 1,
0.4279789, 2.640106, -0.4446568, 0, 0.03529412, 1, 1,
0.435748, 0.498816, -0.1424975, 0, 0.02745098, 1, 1,
0.438233, -0.4711585, 3.109835, 0, 0.02352941, 1, 1,
0.4425704, 0.6302595, 0.5184767, 0, 0.01568628, 1, 1,
0.4432732, 0.2783494, 0.5868277, 0, 0.01176471, 1, 1,
0.4450232, 0.5748217, -0.7805198, 0, 0.003921569, 1, 1,
0.4479741, -0.9255804, 2.684474, 0.003921569, 0, 1, 1,
0.4480851, -0.2715076, 2.167881, 0.007843138, 0, 1, 1,
0.4484612, 0.3736878, -0.01660049, 0.01568628, 0, 1, 1,
0.4503963, 0.3907304, 2.097298, 0.01960784, 0, 1, 1,
0.4546101, 0.6487643, 1.018401, 0.02745098, 0, 1, 1,
0.4554853, 1.285753, -0.8348666, 0.03137255, 0, 1, 1,
0.4586664, -0.1924259, 1.495093, 0.03921569, 0, 1, 1,
0.4587855, 1.361038, -1.215113, 0.04313726, 0, 1, 1,
0.4634775, 1.314485, 0.5249705, 0.05098039, 0, 1, 1,
0.4634841, 0.8972766, 0.4549814, 0.05490196, 0, 1, 1,
0.467501, 0.5807648, 0.01791119, 0.0627451, 0, 1, 1,
0.4675547, 0.8509091, 0.4630007, 0.06666667, 0, 1, 1,
0.4732879, -0.6488132, 2.390817, 0.07450981, 0, 1, 1,
0.4762965, -0.9692945, 2.048506, 0.07843138, 0, 1, 1,
0.477713, 0.7191556, -0.20675, 0.08627451, 0, 1, 1,
0.4831701, -0.06021291, 1.499725, 0.09019608, 0, 1, 1,
0.490214, -0.6418608, 1.88461, 0.09803922, 0, 1, 1,
0.4924118, -1.666801, 2.185901, 0.1058824, 0, 1, 1,
0.4926001, 1.02842, 1.298555, 0.1098039, 0, 1, 1,
0.5056878, -0.4885292, 1.11701, 0.1176471, 0, 1, 1,
0.5121359, -0.4715198, 2.778779, 0.1215686, 0, 1, 1,
0.5195796, 0.2014489, 3.0842, 0.1294118, 0, 1, 1,
0.5197064, 0.1064791, 2.376379, 0.1333333, 0, 1, 1,
0.5238282, -0.2968218, 1.871319, 0.1411765, 0, 1, 1,
0.5305106, 0.9319012, -1.652652, 0.145098, 0, 1, 1,
0.533646, 0.7081761, 0.6738981, 0.1529412, 0, 1, 1,
0.5351544, 0.658319, -1.153596, 0.1568628, 0, 1, 1,
0.538285, -0.5290064, 3.256858, 0.1647059, 0, 1, 1,
0.5500219, 1.400422, 0.9130555, 0.1686275, 0, 1, 1,
0.5520008, -2.341432, 2.291014, 0.1764706, 0, 1, 1,
0.5540475, 1.327104, -0.09457644, 0.1803922, 0, 1, 1,
0.5569925, -0.707708, 2.549667, 0.1882353, 0, 1, 1,
0.5615197, -0.6493825, 1.905076, 0.1921569, 0, 1, 1,
0.5623917, -1.479864, 2.515139, 0.2, 0, 1, 1,
0.5638699, -1.436287, 2.295878, 0.2078431, 0, 1, 1,
0.5701213, -0.6195095, 2.716672, 0.2117647, 0, 1, 1,
0.5713646, -0.9377731, 3.496358, 0.2196078, 0, 1, 1,
0.5749533, -0.3991119, 2.087012, 0.2235294, 0, 1, 1,
0.5808342, -1.97236, 2.619266, 0.2313726, 0, 1, 1,
0.5822541, 0.3684971, 1.268399, 0.2352941, 0, 1, 1,
0.583362, -1.518788, 2.102885, 0.2431373, 0, 1, 1,
0.5854003, 0.4835595, -0.2681012, 0.2470588, 0, 1, 1,
0.5889986, -0.6253372, 2.545886, 0.254902, 0, 1, 1,
0.5891278, -0.4198689, 1.11841, 0.2588235, 0, 1, 1,
0.5899647, 0.3166619, 0.1857153, 0.2666667, 0, 1, 1,
0.5904735, -1.735369, 1.947738, 0.2705882, 0, 1, 1,
0.5924148, -0.9763296, 1.115816, 0.2784314, 0, 1, 1,
0.5929295, -1.667113, 3.556119, 0.282353, 0, 1, 1,
0.5950782, -0.5774057, 3.101985, 0.2901961, 0, 1, 1,
0.5988025, 0.2889635, -0.08783866, 0.2941177, 0, 1, 1,
0.6031976, 2.255929, -1.43461, 0.3019608, 0, 1, 1,
0.6046239, 0.5160234, -0.943278, 0.3098039, 0, 1, 1,
0.6060917, 0.3740134, 0.660853, 0.3137255, 0, 1, 1,
0.606172, 0.1991408, -0.4326386, 0.3215686, 0, 1, 1,
0.6083692, -0.851721, 3.566649, 0.3254902, 0, 1, 1,
0.6087515, -1.047576, 2.89046, 0.3333333, 0, 1, 1,
0.6089045, -0.9053456, 2.323361, 0.3372549, 0, 1, 1,
0.6089326, -1.000701, 3.38837, 0.345098, 0, 1, 1,
0.6156134, 0.559615, 1.557874, 0.3490196, 0, 1, 1,
0.6170636, -0.284534, 2.416101, 0.3568628, 0, 1, 1,
0.6179903, 1.043914, 0.8364413, 0.3607843, 0, 1, 1,
0.6203522, 0.5339072, 0.8353203, 0.3686275, 0, 1, 1,
0.6235821, 0.06407974, 0.729953, 0.372549, 0, 1, 1,
0.6256502, -0.4412853, 1.959241, 0.3803922, 0, 1, 1,
0.6368418, 2.120274, 0.07164389, 0.3843137, 0, 1, 1,
0.6402438, 0.2170086, 0.943063, 0.3921569, 0, 1, 1,
0.6413195, -1.96673, 4.113511, 0.3960784, 0, 1, 1,
0.6436687, -0.05010407, 0.5272489, 0.4039216, 0, 1, 1,
0.6490922, -2.044086, 1.952363, 0.4117647, 0, 1, 1,
0.6518631, 1.380497, -0.722744, 0.4156863, 0, 1, 1,
0.6521475, -0.3719549, 1.534377, 0.4235294, 0, 1, 1,
0.6592746, -0.4122199, 2.808371, 0.427451, 0, 1, 1,
0.6690783, 1.142971, 2.032371, 0.4352941, 0, 1, 1,
0.6704668, 1.600894, -0.6706179, 0.4392157, 0, 1, 1,
0.6713691, -1.096209, 2.794537, 0.4470588, 0, 1, 1,
0.6716097, 0.5187879, -0.1400111, 0.4509804, 0, 1, 1,
0.6764012, 1.504966, 0.6254232, 0.4588235, 0, 1, 1,
0.6811215, -1.127725, 2.092885, 0.4627451, 0, 1, 1,
0.6883321, 0.6727003, 0.9969222, 0.4705882, 0, 1, 1,
0.692381, -0.858322, 2.881275, 0.4745098, 0, 1, 1,
0.6963909, -1.596035, 2.924408, 0.4823529, 0, 1, 1,
0.6970862, 0.492521, 0.7042937, 0.4862745, 0, 1, 1,
0.6998942, -0.496207, 2.206686, 0.4941176, 0, 1, 1,
0.7001328, -0.05558946, 2.444113, 0.5019608, 0, 1, 1,
0.7044983, -0.7619341, 3.580422, 0.5058824, 0, 1, 1,
0.7077739, 0.1160691, 1.82406, 0.5137255, 0, 1, 1,
0.7109777, 0.9309714, 0.1733317, 0.5176471, 0, 1, 1,
0.7112265, 0.1756569, -0.3827334, 0.5254902, 0, 1, 1,
0.7250131, 1.323375, 0.1674555, 0.5294118, 0, 1, 1,
0.7270558, -1.582147, 2.3017, 0.5372549, 0, 1, 1,
0.7287484, 0.5899643, 2.110193, 0.5411765, 0, 1, 1,
0.7361102, -2.163836, 2.480427, 0.5490196, 0, 1, 1,
0.7414991, 0.8150992, 2.488753, 0.5529412, 0, 1, 1,
0.7443623, 0.391943, 0.4154116, 0.5607843, 0, 1, 1,
0.744544, 0.4959267, 0.8146172, 0.5647059, 0, 1, 1,
0.7448785, -1.423959, 1.834018, 0.572549, 0, 1, 1,
0.7457185, -1.524127, 3.690055, 0.5764706, 0, 1, 1,
0.7571799, 0.7690809, 1.17144, 0.5843138, 0, 1, 1,
0.7573741, 0.090192, -0.4068631, 0.5882353, 0, 1, 1,
0.7595198, -0.1528491, 1.033172, 0.5960785, 0, 1, 1,
0.7606261, -0.6389931, 2.189826, 0.6039216, 0, 1, 1,
0.7628037, -1.097594, 3.956996, 0.6078432, 0, 1, 1,
0.7651521, -0.4521972, 2.643752, 0.6156863, 0, 1, 1,
0.7689992, 1.10956, -0.07129654, 0.6196079, 0, 1, 1,
0.769568, 0.2708429, 2.360887, 0.627451, 0, 1, 1,
0.7731162, 0.06790792, 1.608682, 0.6313726, 0, 1, 1,
0.7795357, -0.7821786, 4.113726, 0.6392157, 0, 1, 1,
0.7856993, -0.5790048, 1.389511, 0.6431373, 0, 1, 1,
0.7916312, -0.7695829, 0.8947396, 0.6509804, 0, 1, 1,
0.7940241, -1.176569, 2.115344, 0.654902, 0, 1, 1,
0.8012504, -0.4921296, 2.638855, 0.6627451, 0, 1, 1,
0.8041959, 1.220728, 0.5441325, 0.6666667, 0, 1, 1,
0.8054737, -1.779302, 3.32868, 0.6745098, 0, 1, 1,
0.8056227, -1.035469, 2.985142, 0.6784314, 0, 1, 1,
0.8126483, -0.310227, 1.817429, 0.6862745, 0, 1, 1,
0.8145369, -0.5131173, 1.642002, 0.6901961, 0, 1, 1,
0.8172849, 0.3287585, 2.779563, 0.6980392, 0, 1, 1,
0.8182881, -0.3583314, 2.632819, 0.7058824, 0, 1, 1,
0.8278998, -1.834368, 1.342169, 0.7098039, 0, 1, 1,
0.8306929, -0.6789852, 2.377634, 0.7176471, 0, 1, 1,
0.8378735, 0.04074249, 1.512409, 0.7215686, 0, 1, 1,
0.8387526, -0.1890966, 2.451213, 0.7294118, 0, 1, 1,
0.8387529, -1.309599, 2.425926, 0.7333333, 0, 1, 1,
0.840472, 1.267703, 0.2830071, 0.7411765, 0, 1, 1,
0.8405308, 0.690209, 0.3874322, 0.7450981, 0, 1, 1,
0.8420773, 0.004522398, 1.996859, 0.7529412, 0, 1, 1,
0.8423349, -1.108284, 3.230743, 0.7568628, 0, 1, 1,
0.8436458, -0.8626063, 3.308061, 0.7647059, 0, 1, 1,
0.8447846, -2.741044, 4.257837, 0.7686275, 0, 1, 1,
0.8475279, 0.7464975, 0.7538933, 0.7764706, 0, 1, 1,
0.8480328, -0.9763122, 1.363475, 0.7803922, 0, 1, 1,
0.8493586, -1.996047, 1.626008, 0.7882353, 0, 1, 1,
0.8502206, 0.4062179, 2.605858, 0.7921569, 0, 1, 1,
0.8564084, 0.6594236, 2.581482, 0.8, 0, 1, 1,
0.8574235, 0.02134407, -0.2389181, 0.8078431, 0, 1, 1,
0.8577837, 0.3605101, 2.043019, 0.8117647, 0, 1, 1,
0.8637765, -0.7054334, 4.015578, 0.8196079, 0, 1, 1,
0.8651533, -0.74463, 1.45818, 0.8235294, 0, 1, 1,
0.8665307, 0.4263994, 0.7698805, 0.8313726, 0, 1, 1,
0.8674062, 0.2668105, 2.059602, 0.8352941, 0, 1, 1,
0.8897601, -0.007692987, 2.407727, 0.8431373, 0, 1, 1,
0.8944244, 0.1185207, 1.421, 0.8470588, 0, 1, 1,
0.8977574, -0.4870721, 1.740393, 0.854902, 0, 1, 1,
0.8998877, 0.09860221, -0.3818959, 0.8588235, 0, 1, 1,
0.9006573, -0.4260234, 0.7382651, 0.8666667, 0, 1, 1,
0.9049488, 0.02558006, 1.908918, 0.8705882, 0, 1, 1,
0.9063743, -0.4155589, 3.060558, 0.8784314, 0, 1, 1,
0.9095105, 0.3170795, -0.5735061, 0.8823529, 0, 1, 1,
0.9153863, -1.588164, 2.219128, 0.8901961, 0, 1, 1,
0.9163818, -0.4433144, 2.331965, 0.8941177, 0, 1, 1,
0.9169918, 0.8457016, 1.397725, 0.9019608, 0, 1, 1,
0.9210774, 0.8181345, 0.5707777, 0.9098039, 0, 1, 1,
0.9225142, -0.4159966, 2.244461, 0.9137255, 0, 1, 1,
0.9247296, 0.9511516, 2.834925, 0.9215686, 0, 1, 1,
0.926281, 0.864608, -0.6792812, 0.9254902, 0, 1, 1,
0.9345633, -0.5437279, 1.484962, 0.9333333, 0, 1, 1,
0.9401947, -0.2185111, 2.146894, 0.9372549, 0, 1, 1,
0.9413603, -0.3800288, 4.314517, 0.945098, 0, 1, 1,
0.9436981, -1.671642, 1.295442, 0.9490196, 0, 1, 1,
0.9466285, 0.03528024, 1.306146, 0.9568627, 0, 1, 1,
0.9466991, 1.017982, -1.358368, 0.9607843, 0, 1, 1,
0.9567454, -0.9274977, 3.102884, 0.9686275, 0, 1, 1,
0.9571319, 0.0334033, 3.104275, 0.972549, 0, 1, 1,
0.9575065, -2.405278, 2.696858, 0.9803922, 0, 1, 1,
0.9580684, -1.978627, 1.177845, 0.9843137, 0, 1, 1,
0.9637012, -0.7523651, 2.184452, 0.9921569, 0, 1, 1,
0.964497, -0.936792, 3.439631, 0.9960784, 0, 1, 1,
0.9708362, -0.418546, 1.669851, 1, 0, 0.9960784, 1,
0.9728559, -0.5500535, 2.732081, 1, 0, 0.9882353, 1,
0.9759966, -1.990087, 3.211554, 1, 0, 0.9843137, 1,
0.981668, 2.278409, 1.032559, 1, 0, 0.9764706, 1,
0.9835855, -0.2946226, 1.279442, 1, 0, 0.972549, 1,
0.9848349, 0.6092675, 1.078793, 1, 0, 0.9647059, 1,
0.9890218, 0.1758767, 2.450269, 1, 0, 0.9607843, 1,
0.9896871, 1.935214, 0.4082937, 1, 0, 0.9529412, 1,
0.9980114, -1.14601, 2.723204, 1, 0, 0.9490196, 1,
1.005136, -0.3313667, 3.896235, 1, 0, 0.9411765, 1,
1.0071, -0.9120959, 2.402626, 1, 0, 0.9372549, 1,
1.007325, -1.033114, 1.097453, 1, 0, 0.9294118, 1,
1.010491, 1.027183, -1.033376, 1, 0, 0.9254902, 1,
1.010623, 0.06698975, 3.248341, 1, 0, 0.9176471, 1,
1.011935, 0.5187612, 2.425109, 1, 0, 0.9137255, 1,
1.016192, 0.1946179, 1.531775, 1, 0, 0.9058824, 1,
1.016568, 0.03595094, 2.726311, 1, 0, 0.9019608, 1,
1.024053, -0.8370742, 2.579592, 1, 0, 0.8941177, 1,
1.028947, 0.2672783, 2.299838, 1, 0, 0.8862745, 1,
1.031318, -1.188277, 1.125936, 1, 0, 0.8823529, 1,
1.033277, 0.9907674, 0.6622304, 1, 0, 0.8745098, 1,
1.037425, 1.278105, 0.4757301, 1, 0, 0.8705882, 1,
1.044389, 0.354644, 1.77178, 1, 0, 0.8627451, 1,
1.054572, -1.09041, 2.268872, 1, 0, 0.8588235, 1,
1.066943, -1.280578, 3.245375, 1, 0, 0.8509804, 1,
1.069306, -0.2641822, 1.491587, 1, 0, 0.8470588, 1,
1.076686, 0.3124483, 0.8854141, 1, 0, 0.8392157, 1,
1.096338, -0.008673962, 0.5340009, 1, 0, 0.8352941, 1,
1.098555, 0.9109504, 2.405936, 1, 0, 0.827451, 1,
1.099949, 0.0676301, 3.443135, 1, 0, 0.8235294, 1,
1.102694, -0.969621, 0.5835002, 1, 0, 0.8156863, 1,
1.105439, -1.235561, 0.8631777, 1, 0, 0.8117647, 1,
1.107794, -0.5035769, 1.902256, 1, 0, 0.8039216, 1,
1.108466, -1.834534, 2.63009, 1, 0, 0.7960784, 1,
1.110925, -0.1774173, 0.9728799, 1, 0, 0.7921569, 1,
1.113187, 0.5153978, -0.7985708, 1, 0, 0.7843137, 1,
1.114199, 0.08238528, 1.375688, 1, 0, 0.7803922, 1,
1.123888, 0.08092543, 1.527626, 1, 0, 0.772549, 1,
1.133255, -1.410038, 0.8618677, 1, 0, 0.7686275, 1,
1.133618, 1.683204, 0.6423085, 1, 0, 0.7607843, 1,
1.13555, -0.02897625, 0.8715646, 1, 0, 0.7568628, 1,
1.135835, 1.042639, -1.732743, 1, 0, 0.7490196, 1,
1.138706, 0.4710968, 0.2943854, 1, 0, 0.7450981, 1,
1.145267, 0.6834512, 2.200586, 1, 0, 0.7372549, 1,
1.149189, -1.617863, 1.838376, 1, 0, 0.7333333, 1,
1.15108, -0.9929995, 3.0596, 1, 0, 0.7254902, 1,
1.151737, 0.2632315, 0.3313105, 1, 0, 0.7215686, 1,
1.161472, 2.209934, -0.06770945, 1, 0, 0.7137255, 1,
1.162615, -0.3533358, 2.659181, 1, 0, 0.7098039, 1,
1.168051, -0.8902215, 2.017832, 1, 0, 0.7019608, 1,
1.16927, 0.3178759, 2.157077, 1, 0, 0.6941177, 1,
1.199239, -0.4146276, 2.07807, 1, 0, 0.6901961, 1,
1.209402, 0.9819123, -1.528235, 1, 0, 0.682353, 1,
1.211531, 1.728674, 1.761548, 1, 0, 0.6784314, 1,
1.212343, 0.3543523, 1.603008, 1, 0, 0.6705883, 1,
1.217586, 0.235533, 1.989373, 1, 0, 0.6666667, 1,
1.218331, 0.4160413, 2.086761, 1, 0, 0.6588235, 1,
1.219239, 0.5399947, 2.607248, 1, 0, 0.654902, 1,
1.219462, 0.9936858, 1.515459, 1, 0, 0.6470588, 1,
1.228844, 1.51638, 0.5413186, 1, 0, 0.6431373, 1,
1.230454, -1.271951, 4.676019, 1, 0, 0.6352941, 1,
1.240449, -0.2664567, 1.794003, 1, 0, 0.6313726, 1,
1.24241, 0.5141249, 0.8203112, 1, 0, 0.6235294, 1,
1.247569, -0.3636159, 1.31338, 1, 0, 0.6196079, 1,
1.247571, 0.09951957, 0.3834555, 1, 0, 0.6117647, 1,
1.247925, -0.4272497, 0.08328882, 1, 0, 0.6078432, 1,
1.250401, 1.13668, 2.447072, 1, 0, 0.6, 1,
1.25418, 1.131461, 0.105088, 1, 0, 0.5921569, 1,
1.256196, -0.5263737, -0.215447, 1, 0, 0.5882353, 1,
1.260924, -2.174839, 3.787206, 1, 0, 0.5803922, 1,
1.266552, -1.050301, 2.871791, 1, 0, 0.5764706, 1,
1.267879, 1.565899, 0.6369349, 1, 0, 0.5686275, 1,
1.271415, 1.618963, 0.5239405, 1, 0, 0.5647059, 1,
1.274907, -0.413167, 0.1762514, 1, 0, 0.5568628, 1,
1.290513, -1.474244, 2.40485, 1, 0, 0.5529412, 1,
1.302395, -1.352088, 3.623045, 1, 0, 0.5450981, 1,
1.311126, -0.4125443, 1.333252, 1, 0, 0.5411765, 1,
1.313337, -0.8117217, 2.643199, 1, 0, 0.5333334, 1,
1.31781, -0.05331986, 1.800895, 1, 0, 0.5294118, 1,
1.327114, 0.1887448, 1.092861, 1, 0, 0.5215687, 1,
1.327459, -0.7298918, 1.182825, 1, 0, 0.5176471, 1,
1.328983, -2.025788, 1.134346, 1, 0, 0.509804, 1,
1.329113, -0.2065866, 1.391021, 1, 0, 0.5058824, 1,
1.34239, 0.5160466, 0.1649206, 1, 0, 0.4980392, 1,
1.346157, 0.7492166, 1.955872, 1, 0, 0.4901961, 1,
1.349316, -0.6578788, 2.211543, 1, 0, 0.4862745, 1,
1.36675, -0.1238319, -0.04128601, 1, 0, 0.4784314, 1,
1.36687, -0.392451, 3.118435, 1, 0, 0.4745098, 1,
1.37078, -0.6973826, 2.865993, 1, 0, 0.4666667, 1,
1.370816, 1.276459, 0.7843206, 1, 0, 0.4627451, 1,
1.375012, -0.5146039, 1.336379, 1, 0, 0.454902, 1,
1.376837, 0.007261153, 1.680094, 1, 0, 0.4509804, 1,
1.378328, 0.6455851, 1.343351, 1, 0, 0.4431373, 1,
1.381173, 0.6475117, 2.465218, 1, 0, 0.4392157, 1,
1.40212, 2.68646, 0.3032071, 1, 0, 0.4313726, 1,
1.403583, 0.4446555, 1.809178, 1, 0, 0.427451, 1,
1.411423, 0.7013446, 0.5080627, 1, 0, 0.4196078, 1,
1.415435, 2.242104, 0.9435266, 1, 0, 0.4156863, 1,
1.422539, -1.225996, 3.240432, 1, 0, 0.4078431, 1,
1.426239, -0.7734396, 3.048245, 1, 0, 0.4039216, 1,
1.433417, -0.428652, 1.045636, 1, 0, 0.3960784, 1,
1.447469, 0.5481942, 0.4778277, 1, 0, 0.3882353, 1,
1.450373, -1.543559, 2.136578, 1, 0, 0.3843137, 1,
1.455337, 0.383423, 1.01201, 1, 0, 0.3764706, 1,
1.461062, 0.4754891, 0.4001256, 1, 0, 0.372549, 1,
1.467735, -0.3817894, 1.659607, 1, 0, 0.3647059, 1,
1.495507, -0.2925914, 3.278891, 1, 0, 0.3607843, 1,
1.506529, 0.8886051, 2.646455, 1, 0, 0.3529412, 1,
1.517434, -0.3883055, 2.124377, 1, 0, 0.3490196, 1,
1.550266, 0.9089004, 1.27983, 1, 0, 0.3411765, 1,
1.55437, -0.7828932, 1.915552, 1, 0, 0.3372549, 1,
1.56616, 1.695906, 0.7954295, 1, 0, 0.3294118, 1,
1.572156, 0.2994311, 1.00068, 1, 0, 0.3254902, 1,
1.57275, 1.135602, 1.050337, 1, 0, 0.3176471, 1,
1.587655, 0.08896938, 0.7787165, 1, 0, 0.3137255, 1,
1.587823, 0.4357131, 0.6462893, 1, 0, 0.3058824, 1,
1.6031, -2.834999, 1.915391, 1, 0, 0.2980392, 1,
1.609227, 0.9055044, -0.5725809, 1, 0, 0.2941177, 1,
1.614727, -0.0813541, 2.904846, 1, 0, 0.2862745, 1,
1.615704, 0.750029, 2.229369, 1, 0, 0.282353, 1,
1.642853, -0.6218688, 0.9258895, 1, 0, 0.2745098, 1,
1.66009, 0.5943165, 1.271723, 1, 0, 0.2705882, 1,
1.669648, -0.6553915, -0.1257043, 1, 0, 0.2627451, 1,
1.671717, 1.52843, 2.003312, 1, 0, 0.2588235, 1,
1.687923, 1.133606, 0.9240665, 1, 0, 0.2509804, 1,
1.695494, 0.6685779, 2.568191, 1, 0, 0.2470588, 1,
1.699805, -0.6385898, 3.476994, 1, 0, 0.2392157, 1,
1.700477, -0.5252101, 2.804585, 1, 0, 0.2352941, 1,
1.724847, 0.07148896, 1.944374, 1, 0, 0.227451, 1,
1.732246, 1.141845, 1.765053, 1, 0, 0.2235294, 1,
1.747759, -0.8865432, 1.910759, 1, 0, 0.2156863, 1,
1.767725, -0.6172562, 1.958073, 1, 0, 0.2117647, 1,
1.794036, 0.2069291, 1.330827, 1, 0, 0.2039216, 1,
1.815472, -1.707778, 1.987398, 1, 0, 0.1960784, 1,
1.825263, 0.2629308, 0.4996792, 1, 0, 0.1921569, 1,
1.838512, -0.5713397, 1.284302, 1, 0, 0.1843137, 1,
1.853033, -0.1724613, 1.028853, 1, 0, 0.1803922, 1,
1.858029, 1.146283, 1.085458, 1, 0, 0.172549, 1,
1.860053, 0.6865149, 0.7140217, 1, 0, 0.1686275, 1,
1.865367, 0.6203774, 2.08169, 1, 0, 0.1607843, 1,
1.876942, 1.350255, 2.08466, 1, 0, 0.1568628, 1,
1.89475, 0.5246379, 1.294298, 1, 0, 0.1490196, 1,
1.899541, 0.1636953, 1.921613, 1, 0, 0.145098, 1,
1.907508, 1.27633, 1.165506, 1, 0, 0.1372549, 1,
1.908331, -0.7124147, 1.592019, 1, 0, 0.1333333, 1,
1.920407, -1.0695, 1.547281, 1, 0, 0.1254902, 1,
1.955675, -1.998494, 2.140279, 1, 0, 0.1215686, 1,
1.965856, -0.4895275, 1.600324, 1, 0, 0.1137255, 1,
1.987444, 1.041381, 1.602318, 1, 0, 0.1098039, 1,
1.988254, 0.1752803, 1.057209, 1, 0, 0.1019608, 1,
2.002142, 0.002362887, 1.328061, 1, 0, 0.09411765, 1,
2.013921, -0.6319178, 2.86088, 1, 0, 0.09019608, 1,
2.026109, -0.7158272, 1.765904, 1, 0, 0.08235294, 1,
2.085342, 0.1718529, -0.4144031, 1, 0, 0.07843138, 1,
2.093203, 1.257997, -1.101229, 1, 0, 0.07058824, 1,
2.127614, 0.3782766, 3.073134, 1, 0, 0.06666667, 1,
2.147094, 1.635648, 1.938633, 1, 0, 0.05882353, 1,
2.163944, -0.3856442, 1.298825, 1, 0, 0.05490196, 1,
2.176298, -0.2316617, 2.80265, 1, 0, 0.04705882, 1,
2.230365, 0.5638547, 2.235388, 1, 0, 0.04313726, 1,
2.30563, 0.6496375, 1.176468, 1, 0, 0.03529412, 1,
2.332753, -0.9229031, 2.691009, 1, 0, 0.03137255, 1,
2.351633, -2.498722, 1.78253, 1, 0, 0.02352941, 1,
2.380325, -0.1305745, 2.098189, 1, 0, 0.01960784, 1,
2.457833, -1.262541, 2.24654, 1, 0, 0.01176471, 1,
2.805938, 0.01268987, 1.229406, 1, 0, 0.007843138, 1
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
-0.2084581, -3.802632, -8.048157, 0, -0.5, 0.5, 0.5,
-0.2084581, -3.802632, -8.048157, 1, -0.5, 0.5, 0.5,
-0.2084581, -3.802632, -8.048157, 1, 1.5, 0.5, 0.5,
-0.2084581, -3.802632, -8.048157, 0, 1.5, 0.5, 0.5
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
-4.244734, 0.01937556, -8.048157, 0, -0.5, 0.5, 0.5,
-4.244734, 0.01937556, -8.048157, 1, -0.5, 0.5, 0.5,
-4.244734, 0.01937556, -8.048157, 1, 1.5, 0.5, 0.5,
-4.244734, 0.01937556, -8.048157, 0, 1.5, 0.5, 0.5
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
-4.244734, -3.802632, -0.5689399, 0, -0.5, 0.5, 0.5,
-4.244734, -3.802632, -0.5689399, 1, -0.5, 0.5, 0.5,
-4.244734, -3.802632, -0.5689399, 1, 1.5, 0.5, 0.5,
-4.244734, -3.802632, -0.5689399, 0, 1.5, 0.5, 0.5
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
-3, -2.92063, -6.322184,
2, -2.92063, -6.322184,
-3, -2.92063, -6.322184,
-3, -3.06763, -6.609846,
-2, -2.92063, -6.322184,
-2, -3.06763, -6.609846,
-1, -2.92063, -6.322184,
-1, -3.06763, -6.609846,
0, -2.92063, -6.322184,
0, -3.06763, -6.609846,
1, -2.92063, -6.322184,
1, -3.06763, -6.609846,
2, -2.92063, -6.322184,
2, -3.06763, -6.609846
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
-3, -3.361631, -7.18517, 0, -0.5, 0.5, 0.5,
-3, -3.361631, -7.18517, 1, -0.5, 0.5, 0.5,
-3, -3.361631, -7.18517, 1, 1.5, 0.5, 0.5,
-3, -3.361631, -7.18517, 0, 1.5, 0.5, 0.5,
-2, -3.361631, -7.18517, 0, -0.5, 0.5, 0.5,
-2, -3.361631, -7.18517, 1, -0.5, 0.5, 0.5,
-2, -3.361631, -7.18517, 1, 1.5, 0.5, 0.5,
-2, -3.361631, -7.18517, 0, 1.5, 0.5, 0.5,
-1, -3.361631, -7.18517, 0, -0.5, 0.5, 0.5,
-1, -3.361631, -7.18517, 1, -0.5, 0.5, 0.5,
-1, -3.361631, -7.18517, 1, 1.5, 0.5, 0.5,
-1, -3.361631, -7.18517, 0, 1.5, 0.5, 0.5,
0, -3.361631, -7.18517, 0, -0.5, 0.5, 0.5,
0, -3.361631, -7.18517, 1, -0.5, 0.5, 0.5,
0, -3.361631, -7.18517, 1, 1.5, 0.5, 0.5,
0, -3.361631, -7.18517, 0, 1.5, 0.5, 0.5,
1, -3.361631, -7.18517, 0, -0.5, 0.5, 0.5,
1, -3.361631, -7.18517, 1, -0.5, 0.5, 0.5,
1, -3.361631, -7.18517, 1, 1.5, 0.5, 0.5,
1, -3.361631, -7.18517, 0, 1.5, 0.5, 0.5,
2, -3.361631, -7.18517, 0, -0.5, 0.5, 0.5,
2, -3.361631, -7.18517, 1, -0.5, 0.5, 0.5,
2, -3.361631, -7.18517, 1, 1.5, 0.5, 0.5,
2, -3.361631, -7.18517, 0, 1.5, 0.5, 0.5
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
-3.313286, -2, -6.322184,
-3.313286, 2, -6.322184,
-3.313286, -2, -6.322184,
-3.468527, -2, -6.609846,
-3.313286, -1, -6.322184,
-3.468527, -1, -6.609846,
-3.313286, 0, -6.322184,
-3.468527, 0, -6.609846,
-3.313286, 1, -6.322184,
-3.468527, 1, -6.609846,
-3.313286, 2, -6.322184,
-3.468527, 2, -6.609846
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
-3.77901, -2, -7.18517, 0, -0.5, 0.5, 0.5,
-3.77901, -2, -7.18517, 1, -0.5, 0.5, 0.5,
-3.77901, -2, -7.18517, 1, 1.5, 0.5, 0.5,
-3.77901, -2, -7.18517, 0, 1.5, 0.5, 0.5,
-3.77901, -1, -7.18517, 0, -0.5, 0.5, 0.5,
-3.77901, -1, -7.18517, 1, -0.5, 0.5, 0.5,
-3.77901, -1, -7.18517, 1, 1.5, 0.5, 0.5,
-3.77901, -1, -7.18517, 0, 1.5, 0.5, 0.5,
-3.77901, 0, -7.18517, 0, -0.5, 0.5, 0.5,
-3.77901, 0, -7.18517, 1, -0.5, 0.5, 0.5,
-3.77901, 0, -7.18517, 1, 1.5, 0.5, 0.5,
-3.77901, 0, -7.18517, 0, 1.5, 0.5, 0.5,
-3.77901, 1, -7.18517, 0, -0.5, 0.5, 0.5,
-3.77901, 1, -7.18517, 1, -0.5, 0.5, 0.5,
-3.77901, 1, -7.18517, 1, 1.5, 0.5, 0.5,
-3.77901, 1, -7.18517, 0, 1.5, 0.5, 0.5,
-3.77901, 2, -7.18517, 0, -0.5, 0.5, 0.5,
-3.77901, 2, -7.18517, 1, -0.5, 0.5, 0.5,
-3.77901, 2, -7.18517, 1, 1.5, 0.5, 0.5,
-3.77901, 2, -7.18517, 0, 1.5, 0.5, 0.5
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
-3.313286, -2.92063, -6,
-3.313286, -2.92063, 4,
-3.313286, -2.92063, -6,
-3.468527, -3.06763, -6,
-3.313286, -2.92063, -4,
-3.468527, -3.06763, -4,
-3.313286, -2.92063, -2,
-3.468527, -3.06763, -2,
-3.313286, -2.92063, 0,
-3.468527, -3.06763, 0,
-3.313286, -2.92063, 2,
-3.468527, -3.06763, 2,
-3.313286, -2.92063, 4,
-3.468527, -3.06763, 4
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
-3.77901, -3.361631, -6, 0, -0.5, 0.5, 0.5,
-3.77901, -3.361631, -6, 1, -0.5, 0.5, 0.5,
-3.77901, -3.361631, -6, 1, 1.5, 0.5, 0.5,
-3.77901, -3.361631, -6, 0, 1.5, 0.5, 0.5,
-3.77901, -3.361631, -4, 0, -0.5, 0.5, 0.5,
-3.77901, -3.361631, -4, 1, -0.5, 0.5, 0.5,
-3.77901, -3.361631, -4, 1, 1.5, 0.5, 0.5,
-3.77901, -3.361631, -4, 0, 1.5, 0.5, 0.5,
-3.77901, -3.361631, -2, 0, -0.5, 0.5, 0.5,
-3.77901, -3.361631, -2, 1, -0.5, 0.5, 0.5,
-3.77901, -3.361631, -2, 1, 1.5, 0.5, 0.5,
-3.77901, -3.361631, -2, 0, 1.5, 0.5, 0.5,
-3.77901, -3.361631, 0, 0, -0.5, 0.5, 0.5,
-3.77901, -3.361631, 0, 1, -0.5, 0.5, 0.5,
-3.77901, -3.361631, 0, 1, 1.5, 0.5, 0.5,
-3.77901, -3.361631, 0, 0, 1.5, 0.5, 0.5,
-3.77901, -3.361631, 2, 0, -0.5, 0.5, 0.5,
-3.77901, -3.361631, 2, 1, -0.5, 0.5, 0.5,
-3.77901, -3.361631, 2, 1, 1.5, 0.5, 0.5,
-3.77901, -3.361631, 2, 0, 1.5, 0.5, 0.5,
-3.77901, -3.361631, 4, 0, -0.5, 0.5, 0.5,
-3.77901, -3.361631, 4, 1, -0.5, 0.5, 0.5,
-3.77901, -3.361631, 4, 1, 1.5, 0.5, 0.5,
-3.77901, -3.361631, 4, 0, 1.5, 0.5, 0.5
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
-3.313286, -2.92063, -6.322184,
-3.313286, 2.959381, -6.322184,
-3.313286, -2.92063, 5.184304,
-3.313286, 2.959381, 5.184304,
-3.313286, -2.92063, -6.322184,
-3.313286, -2.92063, 5.184304,
-3.313286, 2.959381, -6.322184,
-3.313286, 2.959381, 5.184304,
-3.313286, -2.92063, -6.322184,
2.89637, -2.92063, -6.322184,
-3.313286, -2.92063, 5.184304,
2.89637, -2.92063, 5.184304,
-3.313286, 2.959381, -6.322184,
2.89637, 2.959381, -6.322184,
-3.313286, 2.959381, 5.184304,
2.89637, 2.959381, 5.184304,
2.89637, -2.92063, -6.322184,
2.89637, 2.959381, -6.322184,
2.89637, -2.92063, 5.184304,
2.89637, 2.959381, 5.184304,
2.89637, -2.92063, -6.322184,
2.89637, -2.92063, 5.184304,
2.89637, 2.959381, -6.322184,
2.89637, 2.959381, 5.184304
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
var radius = 7.655383;
var distance = 34.05966;
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
mvMatrix.translate( 0.2084581, -0.01937556, 0.5689399 );
mvMatrix.scale( 1.332948, 1.407676, 0.7193463 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.05966);
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
cycluron<-read.table("cycluron.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-cycluron$V2
```

```
## Error in eval(expr, envir, enclos): object 'cycluron' not found
```

```r
y<-cycluron$V3
```

```
## Error in eval(expr, envir, enclos): object 'cycluron' not found
```

```r
z<-cycluron$V4
```

```
## Error in eval(expr, envir, enclos): object 'cycluron' not found
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
-3.222854, -0.9381062, -3.086254, 0, 0, 1, 1, 1,
-3.218315, -0.1127801, -3.930612, 1, 0, 0, 1, 1,
-2.994514, 1.94256, 0.3418721, 1, 0, 0, 1, 1,
-2.721634, -0.9234183, -0.6452683, 1, 0, 0, 1, 1,
-2.661417, -0.8279286, -1.694819, 1, 0, 0, 1, 1,
-2.647311, -0.457962, -3.584109, 1, 0, 0, 1, 1,
-2.637607, 0.2068922, -2.589705, 0, 0, 0, 1, 1,
-2.627966, -0.3788365, 0.919355, 0, 0, 0, 1, 1,
-2.470759, -0.5893368, -1.812546, 0, 0, 0, 1, 1,
-2.353326, 0.06033185, -2.885173, 0, 0, 0, 1, 1,
-2.343071, -0.3281547, -1.624034, 0, 0, 0, 1, 1,
-2.298985, -0.03683431, -1.597444, 0, 0, 0, 1, 1,
-2.289513, -0.3079967, 0.04375913, 0, 0, 0, 1, 1,
-2.24856, -0.6030312, -2.553072, 1, 1, 1, 1, 1,
-2.2206, -0.5401884, -2.979549, 1, 1, 1, 1, 1,
-2.18106, -0.6704383, -0.08578392, 1, 1, 1, 1, 1,
-2.17876, -0.324172, -1.811164, 1, 1, 1, 1, 1,
-2.175821, 0.1074445, -1.397402, 1, 1, 1, 1, 1,
-2.158561, 0.7663326, 0.1677473, 1, 1, 1, 1, 1,
-2.149762, -0.6622223, -1.89243, 1, 1, 1, 1, 1,
-2.101921, 1.857975, 0.3819225, 1, 1, 1, 1, 1,
-2.099349, -0.4459415, -2.252944, 1, 1, 1, 1, 1,
-2.098329, 0.9229441, -0.8551954, 1, 1, 1, 1, 1,
-2.08022, -0.3298518, -3.518566, 1, 1, 1, 1, 1,
-2.060141, 0.57599, -3.119548, 1, 1, 1, 1, 1,
-2.033607, -0.611784, -2.176818, 1, 1, 1, 1, 1,
-2.028703, -0.05522741, -0.9690939, 1, 1, 1, 1, 1,
-1.990029, 1.931745, -1.774863, 1, 1, 1, 1, 1,
-1.988686, 1.251069, -0.5553041, 0, 0, 1, 1, 1,
-1.980851, 1.410737, -1.848348, 1, 0, 0, 1, 1,
-1.93523, 0.3344657, -2.651519, 1, 0, 0, 1, 1,
-1.913687, 0.3435291, 0.4029839, 1, 0, 0, 1, 1,
-1.8883, 1.55675, -1.831515, 1, 0, 0, 1, 1,
-1.884025, 0.1786103, -2.941964, 1, 0, 0, 1, 1,
-1.852593, 1.389074, -1.254504, 0, 0, 0, 1, 1,
-1.849553, 1.370928, -0.3114634, 0, 0, 0, 1, 1,
-1.849147, 0.4148242, -0.4859253, 0, 0, 0, 1, 1,
-1.840786, -1.208132, -0.6592985, 0, 0, 0, 1, 1,
-1.839243, 0.4190021, -1.109112, 0, 0, 0, 1, 1,
-1.833325, -0.8331156, 0.3977758, 0, 0, 0, 1, 1,
-1.772533, 1.77108, -0.2650199, 0, 0, 0, 1, 1,
-1.745538, 1.318611, -1.37093, 1, 1, 1, 1, 1,
-1.709701, -0.5581, -1.12205, 1, 1, 1, 1, 1,
-1.69692, -0.6550996, -3.429012, 1, 1, 1, 1, 1,
-1.694904, 1.149389, 0.3414339, 1, 1, 1, 1, 1,
-1.682593, -1.271386, -2.698328, 1, 1, 1, 1, 1,
-1.67823, 0.05850585, -2.951298, 1, 1, 1, 1, 1,
-1.657073, 0.6077848, -1.878225, 1, 1, 1, 1, 1,
-1.641887, 0.2603197, -1.001573, 1, 1, 1, 1, 1,
-1.62236, 0.8966125, 0.4260609, 1, 1, 1, 1, 1,
-1.594408, 1.869034, 0.3545923, 1, 1, 1, 1, 1,
-1.590341, -0.1304587, -0.6296099, 1, 1, 1, 1, 1,
-1.587084, 1.085983, -1.192325, 1, 1, 1, 1, 1,
-1.586181, -0.2827191, 0.8963419, 1, 1, 1, 1, 1,
-1.583262, -1.374138, -3.003783, 1, 1, 1, 1, 1,
-1.581671, -0.1346375, -2.037677, 1, 1, 1, 1, 1,
-1.54527, 1.301498, -1.316854, 0, 0, 1, 1, 1,
-1.533829, -0.1385514, -3.645639, 1, 0, 0, 1, 1,
-1.531047, 0.9593272, -0.1740288, 1, 0, 0, 1, 1,
-1.529538, -1.692279, -2.717249, 1, 0, 0, 1, 1,
-1.521022, 0.2752998, -2.898877, 1, 0, 0, 1, 1,
-1.519963, 0.5229409, -1.647776, 1, 0, 0, 1, 1,
-1.496834, 0.5541286, -2.0728, 0, 0, 0, 1, 1,
-1.488517, 1.763482, 0.9809542, 0, 0, 0, 1, 1,
-1.484444, -0.2274932, -0.7498485, 0, 0, 0, 1, 1,
-1.483771, 1.648386, -0.3460928, 0, 0, 0, 1, 1,
-1.472704, -0.2991431, -4.827274, 0, 0, 0, 1, 1,
-1.468395, 0.1256452, -0.314962, 0, 0, 0, 1, 1,
-1.467057, 0.9136783, -0.8673516, 0, 0, 0, 1, 1,
-1.463734, 0.02010953, -1.611105, 1, 1, 1, 1, 1,
-1.459926, -0.9403913, -2.520792, 1, 1, 1, 1, 1,
-1.451096, 2.249311, -2.778145, 1, 1, 1, 1, 1,
-1.447438, 1.111465, 0.1127939, 1, 1, 1, 1, 1,
-1.44565, -0.8070631, -1.336561, 1, 1, 1, 1, 1,
-1.437426, -0.1584558, -1.879308, 1, 1, 1, 1, 1,
-1.435498, -0.1123537, -3.097799, 1, 1, 1, 1, 1,
-1.427288, 0.5838202, -0.8711747, 1, 1, 1, 1, 1,
-1.422064, -0.7342641, -1.983973, 1, 1, 1, 1, 1,
-1.420968, -0.8178449, -1.957539, 1, 1, 1, 1, 1,
-1.409326, -0.0002827919, -1.283927, 1, 1, 1, 1, 1,
-1.406075, -0.4544526, -1.937938, 1, 1, 1, 1, 1,
-1.404786, 1.412638, -1.477957, 1, 1, 1, 1, 1,
-1.398449, 0.5245444, -1.55415, 1, 1, 1, 1, 1,
-1.39511, -0.3274684, -1.068518, 1, 1, 1, 1, 1,
-1.392271, -0.6468312, -3.112226, 0, 0, 1, 1, 1,
-1.369041, 1.373556, -1.741138, 1, 0, 0, 1, 1,
-1.369018, -0.3050053, -1.300214, 1, 0, 0, 1, 1,
-1.362365, -0.5925831, -2.609464, 1, 0, 0, 1, 1,
-1.347583, 0.4539362, -1.143405, 1, 0, 0, 1, 1,
-1.332223, -0.3325451, -0.701892, 1, 0, 0, 1, 1,
-1.328982, 1.211722, -3.206949, 0, 0, 0, 1, 1,
-1.32555, -1.565986, -1.403874, 0, 0, 0, 1, 1,
-1.324497, 0.6872771, 0.770461, 0, 0, 0, 1, 1,
-1.318403, 0.6666734, -2.858948, 0, 0, 0, 1, 1,
-1.307538, 1.802709, -1.256533, 0, 0, 0, 1, 1,
-1.306195, -0.2613561, -1.858164, 0, 0, 0, 1, 1,
-1.304575, 1.538234, -0.07637522, 0, 0, 0, 1, 1,
-1.296236, -1.467572, -1.59736, 1, 1, 1, 1, 1,
-1.287666, -0.2152724, -1.721734, 1, 1, 1, 1, 1,
-1.275792, 1.63351, -0.6416228, 1, 1, 1, 1, 1,
-1.27386, 0.4782543, 0.9093593, 1, 1, 1, 1, 1,
-1.26068, 0.07885765, -0.5248359, 1, 1, 1, 1, 1,
-1.253858, -0.02426059, 0.2992296, 1, 1, 1, 1, 1,
-1.253625, -1.740067, -1.855258, 1, 1, 1, 1, 1,
-1.238813, 0.5597368, -2.839755, 1, 1, 1, 1, 1,
-1.236755, 0.6454634, -2.10323, 1, 1, 1, 1, 1,
-1.232594, 0.1454844, -2.606242, 1, 1, 1, 1, 1,
-1.227038, 2.047563, 0.3437494, 1, 1, 1, 1, 1,
-1.224353, 0.9747857, -1.656134, 1, 1, 1, 1, 1,
-1.224009, 1.774708, -0.916837, 1, 1, 1, 1, 1,
-1.218619, 0.7182451, -1.36612, 1, 1, 1, 1, 1,
-1.217025, 0.03694473, -3.013133, 1, 1, 1, 1, 1,
-1.211109, -0.5271184, -1.604163, 0, 0, 1, 1, 1,
-1.209388, 1.034375, 0.4123666, 1, 0, 0, 1, 1,
-1.205582, -0.396196, -3.30053, 1, 0, 0, 1, 1,
-1.202871, -0.1587555, -2.6674, 1, 0, 0, 1, 1,
-1.200506, -0.2471746, -2.037355, 1, 0, 0, 1, 1,
-1.19965, 0.01712691, -0.8014887, 1, 0, 0, 1, 1,
-1.19641, -1.944428, -1.95912, 0, 0, 0, 1, 1,
-1.189567, -0.7563942, -1.155243, 0, 0, 0, 1, 1,
-1.183571, 0.02995835, -2.675201, 0, 0, 0, 1, 1,
-1.176664, 0.08424051, -2.961154, 0, 0, 0, 1, 1,
-1.172555, 1.947503, 0.02755086, 0, 0, 0, 1, 1,
-1.162605, -0.09635408, 0.4385462, 0, 0, 0, 1, 1,
-1.158623, 0.6247218, 0.02515291, 0, 0, 0, 1, 1,
-1.139857, -0.1695685, -3.479085, 1, 1, 1, 1, 1,
-1.131432, -0.7283542, -1.61134, 1, 1, 1, 1, 1,
-1.130072, -0.5468841, 0.4872018, 1, 1, 1, 1, 1,
-1.127041, 0.6207312, -1.837515, 1, 1, 1, 1, 1,
-1.119978, -0.2351283, -3.175568, 1, 1, 1, 1, 1,
-1.115871, -0.1023534, -2.509656, 1, 1, 1, 1, 1,
-1.112144, 0.7473847, -1.541397, 1, 1, 1, 1, 1,
-1.090868, -0.8926665, -2.829133, 1, 1, 1, 1, 1,
-1.080051, 0.6697605, 1.466521, 1, 1, 1, 1, 1,
-1.078471, 0.3519137, -1.170783, 1, 1, 1, 1, 1,
-1.074435, 1.150896, -0.3858452, 1, 1, 1, 1, 1,
-1.064181, 0.02934947, -1.4023, 1, 1, 1, 1, 1,
-1.062649, 0.8152441, 1.092998, 1, 1, 1, 1, 1,
-1.060427, -0.1317949, -0.6114783, 1, 1, 1, 1, 1,
-1.053894, -0.1381453, -2.202332, 1, 1, 1, 1, 1,
-1.050275, -0.3953066, -1.486542, 0, 0, 1, 1, 1,
-1.04793, 0.5163604, -1.588601, 1, 0, 0, 1, 1,
-1.03961, 0.5898812, -1.132812, 1, 0, 0, 1, 1,
-1.038988, -1.002169, -2.151085, 1, 0, 0, 1, 1,
-1.021639, 1.097621, -2.652484, 1, 0, 0, 1, 1,
-1.00796, -1.896292, -2.890104, 1, 0, 0, 1, 1,
-1.007635, 1.086004, -0.5164745, 0, 0, 0, 1, 1,
-0.9995657, 0.7170032, -1.341989, 0, 0, 0, 1, 1,
-0.9926614, -1.149872, -0.6886134, 0, 0, 0, 1, 1,
-0.9916909, -0.5667142, -1.359438, 0, 0, 0, 1, 1,
-0.990492, 1.003436, -1.473213, 0, 0, 0, 1, 1,
-0.9845247, -0.345065, -2.008004, 0, 0, 0, 1, 1,
-0.9819022, 0.1003163, -2.187673, 0, 0, 0, 1, 1,
-0.9765291, -0.1161501, -1.376096, 1, 1, 1, 1, 1,
-0.9741498, 0.6598828, -0.2155382, 1, 1, 1, 1, 1,
-0.9740819, 0.1497395, -1.283315, 1, 1, 1, 1, 1,
-0.9713087, 1.073415, 0.534353, 1, 1, 1, 1, 1,
-0.9690548, 0.552647, -0.4597028, 1, 1, 1, 1, 1,
-0.9667058, -0.6788632, -0.4554588, 1, 1, 1, 1, 1,
-0.9606302, 0.4865355, -1.526718, 1, 1, 1, 1, 1,
-0.9532667, -1.695756, -2.866965, 1, 1, 1, 1, 1,
-0.9464261, 0.2046548, -0.8938667, 1, 1, 1, 1, 1,
-0.9398071, -0.3951015, -0.8288211, 1, 1, 1, 1, 1,
-0.9387853, 0.671443, -1.001408, 1, 1, 1, 1, 1,
-0.9323233, -1.03916, -1.861184, 1, 1, 1, 1, 1,
-0.9233754, -1.619584, -2.603842, 1, 1, 1, 1, 1,
-0.9218947, 1.43431, -0.01223513, 1, 1, 1, 1, 1,
-0.9144034, 0.3100732, -0.7156891, 1, 1, 1, 1, 1,
-0.9117238, 0.5253524, -0.8215479, 0, 0, 1, 1, 1,
-0.911659, 0.1258222, -0.6449276, 1, 0, 0, 1, 1,
-0.9017484, 0.1923509, -1.639156, 1, 0, 0, 1, 1,
-0.8907322, 2.247062, -0.5427616, 1, 0, 0, 1, 1,
-0.8886136, 1.800979, -1.803853, 1, 0, 0, 1, 1,
-0.8885317, -1.406444, -3.335497, 1, 0, 0, 1, 1,
-0.8861585, -0.6347939, -2.226533, 0, 0, 0, 1, 1,
-0.8847295, 0.7983471, -0.4258724, 0, 0, 0, 1, 1,
-0.8809577, -0.1602621, -0.8472734, 0, 0, 0, 1, 1,
-0.8794873, -0.2183295, -1.81656, 0, 0, 0, 1, 1,
-0.8786407, -0.6776676, -3.270596, 0, 0, 0, 1, 1,
-0.8757402, 1.330134, -0.5625696, 0, 0, 0, 1, 1,
-0.8707522, -0.07514922, -2.858383, 0, 0, 0, 1, 1,
-0.8579514, 0.03637574, -1.487482, 1, 1, 1, 1, 1,
-0.85571, -1.353291, -4.0303, 1, 1, 1, 1, 1,
-0.8466198, 0.878822, -1.92095, 1, 1, 1, 1, 1,
-0.846616, 0.6378915, -1.554464, 1, 1, 1, 1, 1,
-0.8465841, -0.4207185, -2.541538, 1, 1, 1, 1, 1,
-0.8458446, 1.063001, 0.05972207, 1, 1, 1, 1, 1,
-0.8401675, 0.4206939, -0.925257, 1, 1, 1, 1, 1,
-0.8387713, -1.563131, -2.4386, 1, 1, 1, 1, 1,
-0.8384275, -0.1453958, -1.363916, 1, 1, 1, 1, 1,
-0.8378453, -1.346843, -2.787973, 1, 1, 1, 1, 1,
-0.835898, 0.2374223, -2.562617, 1, 1, 1, 1, 1,
-0.8293685, 0.1424352, -0.6034545, 1, 1, 1, 1, 1,
-0.8241637, -1.680164, -1.358097, 1, 1, 1, 1, 1,
-0.8155503, 1.484549, -0.9475349, 1, 1, 1, 1, 1,
-0.8105592, 0.8547876, -2.510275, 1, 1, 1, 1, 1,
-0.8100342, 0.3121193, -2.144303, 0, 0, 1, 1, 1,
-0.8050178, 0.8442668, -1.32056, 1, 0, 0, 1, 1,
-0.8044093, 2.082245, -0.3269942, 1, 0, 0, 1, 1,
-0.8038027, -0.8240966, -1.173728, 1, 0, 0, 1, 1,
-0.8025932, 1.061163, -1.470368, 1, 0, 0, 1, 1,
-0.7989253, 0.4788553, -1.261191, 1, 0, 0, 1, 1,
-0.7956572, -0.6144007, -2.742815, 0, 0, 0, 1, 1,
-0.7953218, 0.5951703, -0.4546519, 0, 0, 0, 1, 1,
-0.7950482, 1.003221, -1.61077, 0, 0, 0, 1, 1,
-0.7843764, -0.08183938, -2.844075, 0, 0, 0, 1, 1,
-0.782028, -1.326666, -1.290864, 0, 0, 0, 1, 1,
-0.7780084, -0.7678021, -2.826821, 0, 0, 0, 1, 1,
-0.775769, -1.431929, -2.751437, 0, 0, 0, 1, 1,
-0.7737499, 0.1361617, 0.2862311, 1, 1, 1, 1, 1,
-0.7729786, -0.5441062, -2.467014, 1, 1, 1, 1, 1,
-0.7703485, 1.123222, -1.361843, 1, 1, 1, 1, 1,
-0.7671251, 1.325476, -0.1544083, 1, 1, 1, 1, 1,
-0.7671209, 1.164876, 0.4844099, 1, 1, 1, 1, 1,
-0.7670299, 0.7594661, -0.7222889, 1, 1, 1, 1, 1,
-0.762315, -0.5334589, -3.950448, 1, 1, 1, 1, 1,
-0.7543563, 0.2700923, -0.5800164, 1, 1, 1, 1, 1,
-0.7500868, -0.2801515, -1.507198, 1, 1, 1, 1, 1,
-0.7493796, -0.6681625, -3.82141, 1, 1, 1, 1, 1,
-0.7489676, -1.833776, -2.896976, 1, 1, 1, 1, 1,
-0.7471313, 0.8485098, 1.513721, 1, 1, 1, 1, 1,
-0.7452164, -0.2410718, -2.315343, 1, 1, 1, 1, 1,
-0.7437769, -0.07209691, 0.2060383, 1, 1, 1, 1, 1,
-0.7402601, 0.1548857, -0.1413407, 1, 1, 1, 1, 1,
-0.7378567, -0.4362739, -2.672029, 0, 0, 1, 1, 1,
-0.7364507, 0.6052048, -1.626213, 1, 0, 0, 1, 1,
-0.7318435, -1.751455, -2.250879, 1, 0, 0, 1, 1,
-0.7303672, -0.8408521, -3.156694, 1, 0, 0, 1, 1,
-0.728897, -0.1152097, -2.656261, 1, 0, 0, 1, 1,
-0.7272179, 0.8817939, -1.571475, 1, 0, 0, 1, 1,
-0.7263756, 1.9857, -0.2163394, 0, 0, 0, 1, 1,
-0.7250875, -0.1821183, -1.438317, 0, 0, 0, 1, 1,
-0.7231205, -0.5230034, -1.307755, 0, 0, 0, 1, 1,
-0.7211714, -0.5181909, -1.33303, 0, 0, 0, 1, 1,
-0.72064, 1.031016, -0.1395004, 0, 0, 0, 1, 1,
-0.7108977, 0.5022659, -0.8245561, 0, 0, 0, 1, 1,
-0.7053051, 0.1835936, -3.621293, 0, 0, 0, 1, 1,
-0.7034335, 0.02140798, 0.611382, 1, 1, 1, 1, 1,
-0.700234, -0.3183151, -1.918743, 1, 1, 1, 1, 1,
-0.6947003, 0.0005939566, -3.309207, 1, 1, 1, 1, 1,
-0.6820549, 0.7965556, -1.528571, 1, 1, 1, 1, 1,
-0.6774427, 0.01292764, -2.492836, 1, 1, 1, 1, 1,
-0.6724259, 0.5530357, -0.7951517, 1, 1, 1, 1, 1,
-0.6619133, 0.4825256, -0.05423188, 1, 1, 1, 1, 1,
-0.6568164, 1.764746, -0.7070575, 1, 1, 1, 1, 1,
-0.6550857, 0.4834696, -1.430502, 1, 1, 1, 1, 1,
-0.6515116, -0.3829814, -1.843906, 1, 1, 1, 1, 1,
-0.6486548, 0.1265945, -0.6154101, 1, 1, 1, 1, 1,
-0.6445979, 0.5519805, -1.254925, 1, 1, 1, 1, 1,
-0.6419687, 0.03797009, -3.125866, 1, 1, 1, 1, 1,
-0.637876, -1.43989, -1.919224, 1, 1, 1, 1, 1,
-0.6357491, -0.1988344, -3.194073, 1, 1, 1, 1, 1,
-0.6348998, 0.9174334, -1.408569, 0, 0, 1, 1, 1,
-0.6343124, 0.01254923, -2.346249, 1, 0, 0, 1, 1,
-0.632305, 1.583025, 0.6047615, 1, 0, 0, 1, 1,
-0.627389, -0.5943825, -3.904261, 1, 0, 0, 1, 1,
-0.6254158, 1.141957, 1.720335, 1, 0, 0, 1, 1,
-0.6206966, 1.043205, -1.953045, 1, 0, 0, 1, 1,
-0.6172051, -0.3786352, -0.6363374, 0, 0, 0, 1, 1,
-0.6109313, -0.1142282, -0.6738638, 0, 0, 0, 1, 1,
-0.6099639, -0.4383626, -1.950912, 0, 0, 0, 1, 1,
-0.6064289, -0.3893814, -2.255381, 0, 0, 0, 1, 1,
-0.6010746, -0.8527789, -3.402159, 0, 0, 0, 1, 1,
-0.6007987, 0.1638709, -2.077302, 0, 0, 0, 1, 1,
-0.5975366, -0.2741531, -1.707889, 0, 0, 0, 1, 1,
-0.5942836, 1.791422, 1.354966, 1, 1, 1, 1, 1,
-0.5918584, 1.427056, -1.17087, 1, 1, 1, 1, 1,
-0.5824748, -0.5939969, -4.511362, 1, 1, 1, 1, 1,
-0.5803761, 0.6198932, -1.396702, 1, 1, 1, 1, 1,
-0.5771351, 1.744404, -0.9634918, 1, 1, 1, 1, 1,
-0.5750561, -1.096968, -2.267016, 1, 1, 1, 1, 1,
-0.5716164, -0.4534731, -0.1326333, 1, 1, 1, 1, 1,
-0.56954, 0.1618652, -0.6224673, 1, 1, 1, 1, 1,
-0.5630519, -1.311984, -3.167817, 1, 1, 1, 1, 1,
-0.5618382, -0.007640758, -3.791451, 1, 1, 1, 1, 1,
-0.5576442, -0.5840513, -2.742632, 1, 1, 1, 1, 1,
-0.5566612, 0.5566887, -3.140275, 1, 1, 1, 1, 1,
-0.5531674, 1.8763, -0.8263249, 1, 1, 1, 1, 1,
-0.5509789, -1.117874, -1.671647, 1, 1, 1, 1, 1,
-0.550082, -0.195649, -0.6400966, 1, 1, 1, 1, 1,
-0.5465588, -0.9545842, -4.100917, 0, 0, 1, 1, 1,
-0.5459973, 0.9592441, -1.707719, 1, 0, 0, 1, 1,
-0.541388, 1.401961, -0.6107618, 1, 0, 0, 1, 1,
-0.5369307, -0.7980536, -4.314472, 1, 0, 0, 1, 1,
-0.5309755, -0.3556006, -1.9875, 1, 0, 0, 1, 1,
-0.5216571, 0.7092931, -1.331456, 1, 0, 0, 1, 1,
-0.5202126, 0.350381, 1.033579, 0, 0, 0, 1, 1,
-0.5156294, -0.6382113, -2.457928, 0, 0, 0, 1, 1,
-0.5121061, -1.10176, -3.342972, 0, 0, 0, 1, 1,
-0.5063915, 1.453966, 1.032455, 0, 0, 0, 1, 1,
-0.5009055, -0.5704176, -3.907065, 0, 0, 0, 1, 1,
-0.4974751, 0.652099, 1.30951, 0, 0, 0, 1, 1,
-0.4965671, -0.7624707, -2.347696, 0, 0, 0, 1, 1,
-0.496096, 0.6022181, 0.4361708, 1, 1, 1, 1, 1,
-0.4930222, -0.118605, -3.015094, 1, 1, 1, 1, 1,
-0.4920713, -1.322718, -2.407739, 1, 1, 1, 1, 1,
-0.4890422, 0.2537126, -2.381165, 1, 1, 1, 1, 1,
-0.4855426, -0.7613785, -3.009583, 1, 1, 1, 1, 1,
-0.4852625, 0.2767809, 0.03243358, 1, 1, 1, 1, 1,
-0.4804563, -0.8632687, -1.978652, 1, 1, 1, 1, 1,
-0.4774843, 1.573843, -1.672487, 1, 1, 1, 1, 1,
-0.4760908, 0.678115, -0.3209205, 1, 1, 1, 1, 1,
-0.4752964, -0.8507725, -3.739213, 1, 1, 1, 1, 1,
-0.4712276, 0.6390942, 0.04249773, 1, 1, 1, 1, 1,
-0.4680476, -0.06048176, -2.407749, 1, 1, 1, 1, 1,
-0.4671595, 0.6679643, -0.8837233, 1, 1, 1, 1, 1,
-0.4662215, 0.2882532, -0.1460903, 1, 1, 1, 1, 1,
-0.4655, -1.691978, -3.015745, 1, 1, 1, 1, 1,
-0.4633368, -0.5233747, -2.769665, 0, 0, 1, 1, 1,
-0.4596586, 0.9447854, -0.8958933, 1, 0, 0, 1, 1,
-0.4567526, -0.3488988, -2.716244, 1, 0, 0, 1, 1,
-0.451546, 1.538652, -1.475893, 1, 0, 0, 1, 1,
-0.444243, -0.7832173, -1.96309, 1, 0, 0, 1, 1,
-0.4300821, -1.007373, -1.473438, 1, 0, 0, 1, 1,
-0.427914, -1.723607, -3.510894, 0, 0, 0, 1, 1,
-0.4233096, 0.8351499, 0.1925258, 0, 0, 0, 1, 1,
-0.419355, 0.442611, -1.230258, 0, 0, 0, 1, 1,
-0.4182707, -2.323422, -3.22265, 0, 0, 0, 1, 1,
-0.4165775, 1.251495, -1.860536, 0, 0, 0, 1, 1,
-0.4165018, 2.280077, 0.3583613, 0, 0, 0, 1, 1,
-0.413177, 0.3563369, 0.4492287, 0, 0, 0, 1, 1,
-0.4104275, -0.1845506, -3.31093, 1, 1, 1, 1, 1,
-0.4088854, 0.1859001, -0.06115643, 1, 1, 1, 1, 1,
-0.4086457, -2.445872, -2.931432, 1, 1, 1, 1, 1,
-0.4072828, 1.346767, -1.455643, 1, 1, 1, 1, 1,
-0.4043251, -0.03395795, -2.455484, 1, 1, 1, 1, 1,
-0.399031, 0.6983382, -0.4201659, 1, 1, 1, 1, 1,
-0.3975394, 0.2924591, 0.6217697, 1, 1, 1, 1, 1,
-0.3948971, -1.525958, -3.311141, 1, 1, 1, 1, 1,
-0.3920154, -0.06285135, -2.02841, 1, 1, 1, 1, 1,
-0.3912884, 0.009210558, -1.941912, 1, 1, 1, 1, 1,
-0.3839686, -1.375991, -2.577558, 1, 1, 1, 1, 1,
-0.3816552, -0.1967276, -2.778228, 1, 1, 1, 1, 1,
-0.3801801, -0.1075195, -2.940615, 1, 1, 1, 1, 1,
-0.3782413, -0.2724071, -1.875145, 1, 1, 1, 1, 1,
-0.374906, 0.6599268, -1.694833, 1, 1, 1, 1, 1,
-0.3729774, 0.2535709, -0.02521681, 0, 0, 1, 1, 1,
-0.3707302, 0.6574824, 0.3013095, 1, 0, 0, 1, 1,
-0.3683588, 1.165918, -1.461836, 1, 0, 0, 1, 1,
-0.3630598, -0.9637024, -0.008239402, 1, 0, 0, 1, 1,
-0.3587428, 1.214255, -0.1615514, 1, 0, 0, 1, 1,
-0.3576456, -0.5255861, -0.7263623, 1, 0, 0, 1, 1,
-0.3549532, -0.4713043, -3.099282, 0, 0, 0, 1, 1,
-0.3535246, 0.5430043, 0.2475508, 0, 0, 0, 1, 1,
-0.3527746, -0.7977207, -2.926502, 0, 0, 0, 1, 1,
-0.3518392, 0.898121, -1.882819, 0, 0, 0, 1, 1,
-0.3494351, 1.085487, -0.8712923, 0, 0, 0, 1, 1,
-0.3439776, -0.1727538, -0.4208588, 0, 0, 0, 1, 1,
-0.3347331, -0.3931012, -1.920157, 0, 0, 0, 1, 1,
-0.3327429, -0.01364824, -2.163022, 1, 1, 1, 1, 1,
-0.3300422, -0.191366, -2.248027, 1, 1, 1, 1, 1,
-0.3234337, 0.4947731, 0.0658171, 1, 1, 1, 1, 1,
-0.3218033, -1.166046, -1.05614, 1, 1, 1, 1, 1,
-0.3212219, 0.03391222, 0.09597356, 1, 1, 1, 1, 1,
-0.3159522, -0.5648317, -2.804564, 1, 1, 1, 1, 1,
-0.31439, 0.1478636, -2.171703, 1, 1, 1, 1, 1,
-0.3143456, 0.4295568, -0.4292549, 1, 1, 1, 1, 1,
-0.3089935, -1.275446, -3.179526, 1, 1, 1, 1, 1,
-0.3077448, 0.04972624, -0.6295171, 1, 1, 1, 1, 1,
-0.2973696, 1.360366, 1.146114, 1, 1, 1, 1, 1,
-0.2944223, 0.4830539, -1.508268, 1, 1, 1, 1, 1,
-0.2940174, 0.2125471, -1.077471, 1, 1, 1, 1, 1,
-0.2940005, 1.044678, 0.6158292, 1, 1, 1, 1, 1,
-0.2938192, 0.9650261, -0.003288533, 1, 1, 1, 1, 1,
-0.2935435, -0.2175019, -5.251399, 0, 0, 1, 1, 1,
-0.2921125, 0.5089077, -1.610914, 1, 0, 0, 1, 1,
-0.2916087, -1.147089, -1.651655, 1, 0, 0, 1, 1,
-0.2890285, -0.6336399, -3.898475, 1, 0, 0, 1, 1,
-0.2872307, -0.904324, -2.626757, 1, 0, 0, 1, 1,
-0.2852308, -0.219042, -2.040629, 1, 0, 0, 1, 1,
-0.2848253, 1.240322, -0.4448847, 0, 0, 0, 1, 1,
-0.2820621, 1.074574, 1.658263, 0, 0, 0, 1, 1,
-0.2811907, -1.056319, -1.843867, 0, 0, 0, 1, 1,
-0.2811287, -0.6505556, -1.496245, 0, 0, 0, 1, 1,
-0.2775705, 0.7856023, 0.647948, 0, 0, 0, 1, 1,
-0.2769862, 0.1827401, -2.418325, 0, 0, 0, 1, 1,
-0.2748931, 0.2892907, 0.8530627, 0, 0, 0, 1, 1,
-0.2729708, 0.9424304, 1.97005, 1, 1, 1, 1, 1,
-0.2685847, -0.3624104, -4.064373, 1, 1, 1, 1, 1,
-0.2667219, 0.1581929, -1.177612, 1, 1, 1, 1, 1,
-0.2622709, -1.229948, -3.830798, 1, 1, 1, 1, 1,
-0.2618259, 0.1628535, -1.237214, 1, 1, 1, 1, 1,
-0.2599196, 0.6382027, 0.3706023, 1, 1, 1, 1, 1,
-0.2521424, -0.3829285, -2.49163, 1, 1, 1, 1, 1,
-0.2518026, -0.358426, -3.679372, 1, 1, 1, 1, 1,
-0.2510903, -1.056936, -2.767872, 1, 1, 1, 1, 1,
-0.2460781, 0.7784606, 0.9864848, 1, 1, 1, 1, 1,
-0.244728, 0.8366386, 0.3656763, 1, 1, 1, 1, 1,
-0.2408508, -1.370814, -2.331542, 1, 1, 1, 1, 1,
-0.2406434, 1.070515, 2.204935, 1, 1, 1, 1, 1,
-0.2382958, -0.7629267, -1.700783, 1, 1, 1, 1, 1,
-0.2381415, -0.3840728, -2.225522, 1, 1, 1, 1, 1,
-0.2269891, -1.29026, -2.698179, 0, 0, 1, 1, 1,
-0.224567, -0.4382085, -3.128022, 1, 0, 0, 1, 1,
-0.2236765, -0.1762936, -3.325732, 1, 0, 0, 1, 1,
-0.2199719, 0.0863215, -1.990953, 1, 0, 0, 1, 1,
-0.2102262, -0.4596245, -2.228449, 1, 0, 0, 1, 1,
-0.2095707, -0.7826437, -3.11361, 1, 0, 0, 1, 1,
-0.206276, -0.5837195, -2.442097, 0, 0, 0, 1, 1,
-0.2048785, -0.2565744, -2.454335, 0, 0, 0, 1, 1,
-0.2043396, -1.571738, -1.980025, 0, 0, 0, 1, 1,
-0.2022753, 0.3428526, -0.4654064, 0, 0, 0, 1, 1,
-0.2018081, 1.208878, 1.195755, 0, 0, 0, 1, 1,
-0.1976958, 0.2912498, 0.06992882, 0, 0, 0, 1, 1,
-0.1944874, -0.8453583, -3.84593, 0, 0, 0, 1, 1,
-0.1931, 0.03180186, -2.051147, 1, 1, 1, 1, 1,
-0.191265, -1.795171, -2.503561, 1, 1, 1, 1, 1,
-0.1891875, 0.3513435, -0.4233764, 1, 1, 1, 1, 1,
-0.1866251, 0.0355973, -0.3837347, 1, 1, 1, 1, 1,
-0.1837066, 0.8947585, -1.790895, 1, 1, 1, 1, 1,
-0.1791309, 0.6532901, -0.02884914, 1, 1, 1, 1, 1,
-0.1761012, 1.17435, -0.7852604, 1, 1, 1, 1, 1,
-0.1742793, -2.433306, -4.544402, 1, 1, 1, 1, 1,
-0.1711504, 0.3653674, -0.393928, 1, 1, 1, 1, 1,
-0.1685208, 0.2107165, -2.377929, 1, 1, 1, 1, 1,
-0.1639009, -0.239267, -2.414332, 1, 1, 1, 1, 1,
-0.1524524, -0.06868611, -1.504016, 1, 1, 1, 1, 1,
-0.1502263, 0.6633593, -0.6755973, 1, 1, 1, 1, 1,
-0.1496305, -1.019678, -1.785895, 1, 1, 1, 1, 1,
-0.1432645, -0.05665112, -1.687079, 1, 1, 1, 1, 1,
-0.1427236, 0.5108153, -1.883551, 0, 0, 1, 1, 1,
-0.1407682, 0.2888214, 1.603673, 1, 0, 0, 1, 1,
-0.138723, -1.296146, -1.134111, 1, 0, 0, 1, 1,
-0.1357152, 1.050467, -1.80761, 1, 0, 0, 1, 1,
-0.1349983, -2.391588, -3.465654, 1, 0, 0, 1, 1,
-0.1332181, -1.235825, -3.600303, 1, 0, 0, 1, 1,
-0.1273121, -0.1129247, -0.8775027, 0, 0, 0, 1, 1,
-0.1270638, -0.05545646, -1.544797, 0, 0, 0, 1, 1,
-0.1269726, 0.3583649, -1.141812, 0, 0, 0, 1, 1,
-0.1257029, 0.3363973, -0.3842803, 0, 0, 0, 1, 1,
-0.1253818, 0.4571859, 0.8720874, 0, 0, 0, 1, 1,
-0.124771, 1.03726, -0.7658221, 0, 0, 0, 1, 1,
-0.123408, -1.755366, -3.274435, 0, 0, 0, 1, 1,
-0.1184307, -0.5954294, -1.75958, 1, 1, 1, 1, 1,
-0.1179988, -0.139997, -2.023501, 1, 1, 1, 1, 1,
-0.117028, -1.492899, -3.363509, 1, 1, 1, 1, 1,
-0.1152744, -0.3268739, -4.426819, 1, 1, 1, 1, 1,
-0.1115206, -0.3413152, -3.465992, 1, 1, 1, 1, 1,
-0.1114201, -0.1913266, -1.836207, 1, 1, 1, 1, 1,
-0.110459, -0.01982701, -3.318272, 1, 1, 1, 1, 1,
-0.1059075, 1.170808, 0.8544458, 1, 1, 1, 1, 1,
-0.1040423, 2.183107, -1.125566, 1, 1, 1, 1, 1,
-0.09836592, -0.0877229, -1.737051, 1, 1, 1, 1, 1,
-0.09751523, -1.335802, -6.154613, 1, 1, 1, 1, 1,
-0.09490977, 0.4160726, -0.3936862, 1, 1, 1, 1, 1,
-0.08649784, 0.3465161, 0.7758642, 1, 1, 1, 1, 1,
-0.08629482, 0.5729557, -0.6276944, 1, 1, 1, 1, 1,
-0.0850836, -0.0419274, -3.194582, 1, 1, 1, 1, 1,
-0.0827817, 0.5686215, -0.6210269, 0, 0, 1, 1, 1,
-0.08085649, 0.307754, 0.7073835, 1, 0, 0, 1, 1,
-0.08045699, 0.9082133, 0.05844224, 1, 0, 0, 1, 1,
-0.08018348, 0.3392637, -1.69365, 1, 0, 0, 1, 1,
-0.07962769, 0.9380327, 1.625596, 1, 0, 0, 1, 1,
-0.0793262, 1.21534, 1.04967, 1, 0, 0, 1, 1,
-0.07622443, 1.536275, -0.9157333, 0, 0, 0, 1, 1,
-0.07471025, -0.816364, -2.015157, 0, 0, 0, 1, 1,
-0.07088549, 0.4002287, -0.4323924, 0, 0, 0, 1, 1,
-0.06956784, -1.197963, -2.467657, 0, 0, 0, 1, 1,
-0.06890903, 0.2998699, 0.5299616, 0, 0, 0, 1, 1,
-0.06847025, -0.7177335, -2.520067, 0, 0, 0, 1, 1,
-0.06300723, -0.9551309, -4.135824, 0, 0, 0, 1, 1,
-0.06050894, 1.379639, -0.537676, 1, 1, 1, 1, 1,
-0.05924737, -1.241832, -2.501355, 1, 1, 1, 1, 1,
-0.05840011, 0.8947955, -0.8024054, 1, 1, 1, 1, 1,
-0.05607833, -0.2547149, -3.794861, 1, 1, 1, 1, 1,
-0.0419641, -1.632506, -5.686619, 1, 1, 1, 1, 1,
-0.041089, 0.3044914, -0.6186112, 1, 1, 1, 1, 1,
-0.03857925, -0.07028564, -3.383896, 1, 1, 1, 1, 1,
-0.03735369, -0.3602951, -2.08597, 1, 1, 1, 1, 1,
-0.03521718, -0.03978195, -2.296425, 1, 1, 1, 1, 1,
-0.02845129, -0.9398371, -5.205548, 1, 1, 1, 1, 1,
-0.0231901, 0.5173404, 0.8058423, 1, 1, 1, 1, 1,
-0.02302197, -0.2587813, -3.102615, 1, 1, 1, 1, 1,
-0.02116159, 0.1552504, -1.194628, 1, 1, 1, 1, 1,
-0.02038169, 0.7591066, -0.8816946, 1, 1, 1, 1, 1,
-0.01806577, 0.3572296, 0.3088418, 1, 1, 1, 1, 1,
-0.01759708, 0.4653337, 0.8596003, 0, 0, 1, 1, 1,
-0.01564668, -0.100149, -1.340101, 1, 0, 0, 1, 1,
-0.01460008, -1.16504, -1.511626, 1, 0, 0, 1, 1,
-0.01151661, -1.614636, -2.845515, 1, 0, 0, 1, 1,
-0.01118398, -0.06197239, -2.874834, 1, 0, 0, 1, 1,
-0.010061, 0.4072873, -0.4194909, 1, 0, 0, 1, 1,
-0.009732419, -1.050897, -3.379382, 0, 0, 0, 1, 1,
-0.007716706, 0.5091789, -1.008881, 0, 0, 0, 1, 1,
-0.006480997, 1.353303, -0.07455676, 0, 0, 0, 1, 1,
-0.0031532, -1.513443, -3.879494, 0, 0, 0, 1, 1,
0.004446321, -1.048129, 3.737716, 0, 0, 0, 1, 1,
0.004835221, -0.9451638, 3.993697, 0, 0, 0, 1, 1,
0.008114984, -0.2997264, 2.357544, 0, 0, 0, 1, 1,
0.0129571, 0.1592412, -0.6592374, 1, 1, 1, 1, 1,
0.01318884, 0.9662937, 0.5535163, 1, 1, 1, 1, 1,
0.01495724, -0.9824926, 1.333862, 1, 1, 1, 1, 1,
0.01851941, -1.356376, 1.70047, 1, 1, 1, 1, 1,
0.02084774, -0.2078396, 3.435248, 1, 1, 1, 1, 1,
0.02195033, 1.149713, 1.981434, 1, 1, 1, 1, 1,
0.02424611, -0.6725516, 2.569708, 1, 1, 1, 1, 1,
0.0258229, 0.5306332, 1.151328, 1, 1, 1, 1, 1,
0.02685979, 0.9978382, 1.018031, 1, 1, 1, 1, 1,
0.02721003, 2.222203, -1.888594, 1, 1, 1, 1, 1,
0.02911444, -0.3110366, 3.01827, 1, 1, 1, 1, 1,
0.03167216, -1.949289, 3.793237, 1, 1, 1, 1, 1,
0.03285228, -0.1046336, 2.033479, 1, 1, 1, 1, 1,
0.03362125, -2.416284, 4.504135, 1, 1, 1, 1, 1,
0.03738998, 2.87375, 1.122275, 1, 1, 1, 1, 1,
0.04128407, -0.2477439, 3.137208, 0, 0, 1, 1, 1,
0.04143259, -0.5988958, 3.808448, 1, 0, 0, 1, 1,
0.04422666, 1.061522, 1.563325, 1, 0, 0, 1, 1,
0.04524753, -0.3298362, 4.346498, 1, 0, 0, 1, 1,
0.0468269, -1.054191, 3.28688, 1, 0, 0, 1, 1,
0.04684106, -1.150079, 2.754685, 1, 0, 0, 1, 1,
0.05065874, -1.370977, 2.711487, 0, 0, 0, 1, 1,
0.05535194, 0.06665156, 1.857789, 0, 0, 0, 1, 1,
0.0564812, -0.4909643, 2.177241, 0, 0, 0, 1, 1,
0.05972129, -0.02893311, 2.402401, 0, 0, 0, 1, 1,
0.06543347, -0.001219643, 2.982554, 0, 0, 0, 1, 1,
0.06570641, -2.07311, 4.112233, 0, 0, 0, 1, 1,
0.06878369, -1.651106, 2.539438, 0, 0, 0, 1, 1,
0.07044647, 0.4983204, 0.7770391, 1, 1, 1, 1, 1,
0.07285323, 0.376789, -0.9277489, 1, 1, 1, 1, 1,
0.07292046, 0.0944783, 1.281664, 1, 1, 1, 1, 1,
0.07458587, 0.6888988, -0.4041858, 1, 1, 1, 1, 1,
0.07518887, 1.904641, 0.4824314, 1, 1, 1, 1, 1,
0.07702667, 0.4494887, 1.438082, 1, 1, 1, 1, 1,
0.07936894, 0.5171252, -0.4079088, 1, 1, 1, 1, 1,
0.08310284, 0.1253757, 1.582615, 1, 1, 1, 1, 1,
0.08350965, 2.356, -1.006342, 1, 1, 1, 1, 1,
0.08468015, 0.1977082, 1.004621, 1, 1, 1, 1, 1,
0.08667069, 0.4631205, 1.190711, 1, 1, 1, 1, 1,
0.08972724, 0.5925733, -2.414128, 1, 1, 1, 1, 1,
0.09188082, -0.7142018, 3.928451, 1, 1, 1, 1, 1,
0.0921089, 0.4607339, 0.5551522, 1, 1, 1, 1, 1,
0.1050587, 0.2373832, 0.6146792, 1, 1, 1, 1, 1,
0.1177139, -1.247905, 3.058694, 0, 0, 1, 1, 1,
0.1286169, 1.658345, -0.8028788, 1, 0, 0, 1, 1,
0.1294761, -1.100232, 1.817293, 1, 0, 0, 1, 1,
0.1320556, 0.09853392, 0.8042543, 1, 0, 0, 1, 1,
0.1349902, -0.08373234, 2.797071, 1, 0, 0, 1, 1,
0.1368556, 2.266173, 0.5850996, 1, 0, 0, 1, 1,
0.1372295, -0.3259521, 4.550525, 0, 0, 0, 1, 1,
0.1391744, 0.8212944, -0.6267706, 0, 0, 0, 1, 1,
0.1399447, -2.033406, 2.178902, 0, 0, 0, 1, 1,
0.1401382, -0.9478892, 2.818579, 0, 0, 0, 1, 1,
0.14245, -0.3966444, 1.810582, 0, 0, 0, 1, 1,
0.1478154, 0.5530445, 0.0842637, 0, 0, 0, 1, 1,
0.1524602, -0.6246144, 1.70574, 0, 0, 0, 1, 1,
0.1537743, 0.628695, -0.5344954, 1, 1, 1, 1, 1,
0.1604496, -1.111735, 3.943534, 1, 1, 1, 1, 1,
0.1608298, -1.028828, 3.329426, 1, 1, 1, 1, 1,
0.1618705, -2.242769, 4.02328, 1, 1, 1, 1, 1,
0.1629997, 0.9573413, -0.2311543, 1, 1, 1, 1, 1,
0.1636557, 1.340115, 0.8945108, 1, 1, 1, 1, 1,
0.1641754, 1.554541, -1.260886, 1, 1, 1, 1, 1,
0.1644537, 0.3191876, 0.2128099, 1, 1, 1, 1, 1,
0.1700048, 0.8131331, -0.3561395, 1, 1, 1, 1, 1,
0.1713436, 0.2396808, -0.7995623, 1, 1, 1, 1, 1,
0.1820541, -1.169894, 3.28583, 1, 1, 1, 1, 1,
0.1822665, -0.02565552, 2.657724, 1, 1, 1, 1, 1,
0.1829513, -0.4519727, 3.568079, 1, 1, 1, 1, 1,
0.1837303, 1.694134, -0.4981081, 1, 1, 1, 1, 1,
0.1898191, -0.5596519, 3.807339, 1, 1, 1, 1, 1,
0.1902364, 0.06567144, 2.544511, 0, 0, 1, 1, 1,
0.1904054, 1.283017, 0.9949898, 1, 0, 0, 1, 1,
0.1940383, 0.5703633, 0.7898409, 1, 0, 0, 1, 1,
0.1940761, 0.04183724, 1.017388, 1, 0, 0, 1, 1,
0.1951199, -1.020251, 3.508958, 1, 0, 0, 1, 1,
0.1991089, 0.5346388, 0.7402455, 1, 0, 0, 1, 1,
0.1997832, 0.04448356, 0.8351659, 0, 0, 0, 1, 1,
0.2008107, 0.1334929, 1.101571, 0, 0, 0, 1, 1,
0.2029612, 0.1474555, -0.3048117, 0, 0, 0, 1, 1,
0.2036167, 0.1279007, 1.832948, 0, 0, 0, 1, 1,
0.2042813, -1.967555, 3.580684, 0, 0, 0, 1, 1,
0.2060191, 0.5565208, 1.198712, 0, 0, 0, 1, 1,
0.2060619, 1.199049, 0.6427768, 0, 0, 0, 1, 1,
0.2074483, -0.7510052, 3.1199, 1, 1, 1, 1, 1,
0.2079826, 1.512307, 0.8220941, 1, 1, 1, 1, 1,
0.2083588, 0.3779267, 1.724422, 1, 1, 1, 1, 1,
0.2090665, -0.7295543, 5.016734, 1, 1, 1, 1, 1,
0.2092917, -0.1131963, 2.741278, 1, 1, 1, 1, 1,
0.2132521, -1.005168, 4.036458, 1, 1, 1, 1, 1,
0.2141528, 0.8907592, -0.5157017, 1, 1, 1, 1, 1,
0.2152336, 1.725348, -0.6650876, 1, 1, 1, 1, 1,
0.2192255, -0.9759367, 2.328032, 1, 1, 1, 1, 1,
0.2244364, 0.5099342, 0.6556333, 1, 1, 1, 1, 1,
0.2258977, 0.9729441, 0.09730741, 1, 1, 1, 1, 1,
0.2302686, -0.7683363, 4.858465, 1, 1, 1, 1, 1,
0.2364665, -0.2547778, 2.687188, 1, 1, 1, 1, 1,
0.2365879, -0.9989626, 1.949045, 1, 1, 1, 1, 1,
0.2371782, 0.363162, 0.0382561, 1, 1, 1, 1, 1,
0.2424398, 1.400773, -0.267151, 0, 0, 1, 1, 1,
0.2489671, 0.581991, -0.1769525, 1, 0, 0, 1, 1,
0.2495041, -0.5066022, 3.721435, 1, 0, 0, 1, 1,
0.2499859, 0.03224842, 0.5774023, 1, 0, 0, 1, 1,
0.2505181, 1.590918, -1.710232, 1, 0, 0, 1, 1,
0.2546423, 1.911218, 0.07501753, 1, 0, 0, 1, 1,
0.2556485, 0.05315698, 1.596765, 0, 0, 0, 1, 1,
0.2572848, -0.7145922, 3.42171, 0, 0, 0, 1, 1,
0.2673931, 1.564366, -0.3839422, 0, 0, 0, 1, 1,
0.2718945, -0.2385602, 2.053068, 0, 0, 0, 1, 1,
0.2746206, 2.645903, -1.45634, 0, 0, 0, 1, 1,
0.2752891, -1.312744, 4.146486, 0, 0, 0, 1, 1,
0.2788812, 1.708102, 0.2694257, 0, 0, 0, 1, 1,
0.2835387, 0.1201539, -0.1777193, 1, 1, 1, 1, 1,
0.284104, 0.5523167, -0.05122101, 1, 1, 1, 1, 1,
0.2849718, 0.2851274, 2.09055, 1, 1, 1, 1, 1,
0.2901786, 0.05932975, 1.437637, 1, 1, 1, 1, 1,
0.2916711, 1.328316, -0.9319075, 1, 1, 1, 1, 1,
0.2921874, 1.06758, -1.114257, 1, 1, 1, 1, 1,
0.2963898, -0.5811877, 2.435606, 1, 1, 1, 1, 1,
0.2988862, -0.512693, 1.821772, 1, 1, 1, 1, 1,
0.2997832, 1.458912, 1.261071, 1, 1, 1, 1, 1,
0.3005356, -0.3005307, 1.104911, 1, 1, 1, 1, 1,
0.3008776, 0.5286537, 0.226539, 1, 1, 1, 1, 1,
0.3035703, 0.7328305, -0.1031903, 1, 1, 1, 1, 1,
0.3035905, 0.2383306, 1.421524, 1, 1, 1, 1, 1,
0.3087823, 0.5348308, 1.377513, 1, 1, 1, 1, 1,
0.3151836, 0.04596191, 0.1615764, 1, 1, 1, 1, 1,
0.3156386, 0.5319253, 1.643737, 0, 0, 1, 1, 1,
0.3172412, -0.1016887, 3.827262, 1, 0, 0, 1, 1,
0.3193153, 0.8057603, 0.1959998, 1, 0, 0, 1, 1,
0.3206898, -1.256139, 2.547589, 1, 0, 0, 1, 1,
0.3227198, 0.07436433, 2.05613, 1, 0, 0, 1, 1,
0.3231202, -0.5622125, 3.238084, 1, 0, 0, 1, 1,
0.3290632, 0.398554, 2.954775, 0, 0, 0, 1, 1,
0.3338021, 2.284934, 0.9258122, 0, 0, 0, 1, 1,
0.3392291, -0.3533523, 3.402426, 0, 0, 0, 1, 1,
0.3400769, 0.5046191, 1.681085, 0, 0, 0, 1, 1,
0.3406938, 0.9603364, 1.048405, 0, 0, 0, 1, 1,
0.3490365, 0.2283106, 1.975482, 0, 0, 0, 1, 1,
0.3491268, -0.9143766, 3.930233, 0, 0, 0, 1, 1,
0.3494188, 0.09440501, 0.1987311, 1, 1, 1, 1, 1,
0.3516859, 1.65376, -0.513207, 1, 1, 1, 1, 1,
0.3541384, 1.143048, 0.08340652, 1, 1, 1, 1, 1,
0.3548883, -0.8504164, 3.510124, 1, 1, 1, 1, 1,
0.3561403, -1.045848, 3.130849, 1, 1, 1, 1, 1,
0.3602845, 0.9554698, 1.20984, 1, 1, 1, 1, 1,
0.3635499, -1.485561, 1.685624, 1, 1, 1, 1, 1,
0.365092, 1.241335, 2.185859, 1, 1, 1, 1, 1,
0.3701331, -1.566102, 3.031179, 1, 1, 1, 1, 1,
0.3716618, 1.474749, -1.625694, 1, 1, 1, 1, 1,
0.3784092, 0.5241538, 0.9951538, 1, 1, 1, 1, 1,
0.3805343, 0.2454923, 1.134055, 1, 1, 1, 1, 1,
0.3838318, 0.2065829, 1.370265, 1, 1, 1, 1, 1,
0.3848388, 0.2444494, 0.3460525, 1, 1, 1, 1, 1,
0.3870772, -0.5105106, 2.069555, 1, 1, 1, 1, 1,
0.389883, -0.05899074, 2.956234, 0, 0, 1, 1, 1,
0.3906659, -0.3290398, 1.795873, 1, 0, 0, 1, 1,
0.3906825, -0.8870599, 2.621982, 1, 0, 0, 1, 1,
0.3929667, -0.1822619, 1.072652, 1, 0, 0, 1, 1,
0.3934269, 0.3563414, 0.1509425, 1, 0, 0, 1, 1,
0.395004, 1.176253, 1.306074, 1, 0, 0, 1, 1,
0.3957606, 2.149794, 0.1778473, 0, 0, 0, 1, 1,
0.3983367, 1.537847, 1.950535, 0, 0, 0, 1, 1,
0.4025224, -0.04134397, 2.4674, 0, 0, 0, 1, 1,
0.4085512, -0.6051915, 3.431324, 0, 0, 0, 1, 1,
0.4169179, 0.5217146, 0.6215227, 0, 0, 0, 1, 1,
0.4175521, -0.1111462, 0.7745638, 0, 0, 0, 1, 1,
0.4196355, 0.2056401, 1.847492, 0, 0, 0, 1, 1,
0.4207067, -0.5627275, 3.013374, 1, 1, 1, 1, 1,
0.4225734, 0.009178291, 0.1191314, 1, 1, 1, 1, 1,
0.4231583, -1.075296, 4.127098, 1, 1, 1, 1, 1,
0.4267739, -0.9710786, 3.69028, 1, 1, 1, 1, 1,
0.4279789, 2.640106, -0.4446568, 1, 1, 1, 1, 1,
0.435748, 0.498816, -0.1424975, 1, 1, 1, 1, 1,
0.438233, -0.4711585, 3.109835, 1, 1, 1, 1, 1,
0.4425704, 0.6302595, 0.5184767, 1, 1, 1, 1, 1,
0.4432732, 0.2783494, 0.5868277, 1, 1, 1, 1, 1,
0.4450232, 0.5748217, -0.7805198, 1, 1, 1, 1, 1,
0.4479741, -0.9255804, 2.684474, 1, 1, 1, 1, 1,
0.4480851, -0.2715076, 2.167881, 1, 1, 1, 1, 1,
0.4484612, 0.3736878, -0.01660049, 1, 1, 1, 1, 1,
0.4503963, 0.3907304, 2.097298, 1, 1, 1, 1, 1,
0.4546101, 0.6487643, 1.018401, 1, 1, 1, 1, 1,
0.4554853, 1.285753, -0.8348666, 0, 0, 1, 1, 1,
0.4586664, -0.1924259, 1.495093, 1, 0, 0, 1, 1,
0.4587855, 1.361038, -1.215113, 1, 0, 0, 1, 1,
0.4634775, 1.314485, 0.5249705, 1, 0, 0, 1, 1,
0.4634841, 0.8972766, 0.4549814, 1, 0, 0, 1, 1,
0.467501, 0.5807648, 0.01791119, 1, 0, 0, 1, 1,
0.4675547, 0.8509091, 0.4630007, 0, 0, 0, 1, 1,
0.4732879, -0.6488132, 2.390817, 0, 0, 0, 1, 1,
0.4762965, -0.9692945, 2.048506, 0, 0, 0, 1, 1,
0.477713, 0.7191556, -0.20675, 0, 0, 0, 1, 1,
0.4831701, -0.06021291, 1.499725, 0, 0, 0, 1, 1,
0.490214, -0.6418608, 1.88461, 0, 0, 0, 1, 1,
0.4924118, -1.666801, 2.185901, 0, 0, 0, 1, 1,
0.4926001, 1.02842, 1.298555, 1, 1, 1, 1, 1,
0.5056878, -0.4885292, 1.11701, 1, 1, 1, 1, 1,
0.5121359, -0.4715198, 2.778779, 1, 1, 1, 1, 1,
0.5195796, 0.2014489, 3.0842, 1, 1, 1, 1, 1,
0.5197064, 0.1064791, 2.376379, 1, 1, 1, 1, 1,
0.5238282, -0.2968218, 1.871319, 1, 1, 1, 1, 1,
0.5305106, 0.9319012, -1.652652, 1, 1, 1, 1, 1,
0.533646, 0.7081761, 0.6738981, 1, 1, 1, 1, 1,
0.5351544, 0.658319, -1.153596, 1, 1, 1, 1, 1,
0.538285, -0.5290064, 3.256858, 1, 1, 1, 1, 1,
0.5500219, 1.400422, 0.9130555, 1, 1, 1, 1, 1,
0.5520008, -2.341432, 2.291014, 1, 1, 1, 1, 1,
0.5540475, 1.327104, -0.09457644, 1, 1, 1, 1, 1,
0.5569925, -0.707708, 2.549667, 1, 1, 1, 1, 1,
0.5615197, -0.6493825, 1.905076, 1, 1, 1, 1, 1,
0.5623917, -1.479864, 2.515139, 0, 0, 1, 1, 1,
0.5638699, -1.436287, 2.295878, 1, 0, 0, 1, 1,
0.5701213, -0.6195095, 2.716672, 1, 0, 0, 1, 1,
0.5713646, -0.9377731, 3.496358, 1, 0, 0, 1, 1,
0.5749533, -0.3991119, 2.087012, 1, 0, 0, 1, 1,
0.5808342, -1.97236, 2.619266, 1, 0, 0, 1, 1,
0.5822541, 0.3684971, 1.268399, 0, 0, 0, 1, 1,
0.583362, -1.518788, 2.102885, 0, 0, 0, 1, 1,
0.5854003, 0.4835595, -0.2681012, 0, 0, 0, 1, 1,
0.5889986, -0.6253372, 2.545886, 0, 0, 0, 1, 1,
0.5891278, -0.4198689, 1.11841, 0, 0, 0, 1, 1,
0.5899647, 0.3166619, 0.1857153, 0, 0, 0, 1, 1,
0.5904735, -1.735369, 1.947738, 0, 0, 0, 1, 1,
0.5924148, -0.9763296, 1.115816, 1, 1, 1, 1, 1,
0.5929295, -1.667113, 3.556119, 1, 1, 1, 1, 1,
0.5950782, -0.5774057, 3.101985, 1, 1, 1, 1, 1,
0.5988025, 0.2889635, -0.08783866, 1, 1, 1, 1, 1,
0.6031976, 2.255929, -1.43461, 1, 1, 1, 1, 1,
0.6046239, 0.5160234, -0.943278, 1, 1, 1, 1, 1,
0.6060917, 0.3740134, 0.660853, 1, 1, 1, 1, 1,
0.606172, 0.1991408, -0.4326386, 1, 1, 1, 1, 1,
0.6083692, -0.851721, 3.566649, 1, 1, 1, 1, 1,
0.6087515, -1.047576, 2.89046, 1, 1, 1, 1, 1,
0.6089045, -0.9053456, 2.323361, 1, 1, 1, 1, 1,
0.6089326, -1.000701, 3.38837, 1, 1, 1, 1, 1,
0.6156134, 0.559615, 1.557874, 1, 1, 1, 1, 1,
0.6170636, -0.284534, 2.416101, 1, 1, 1, 1, 1,
0.6179903, 1.043914, 0.8364413, 1, 1, 1, 1, 1,
0.6203522, 0.5339072, 0.8353203, 0, 0, 1, 1, 1,
0.6235821, 0.06407974, 0.729953, 1, 0, 0, 1, 1,
0.6256502, -0.4412853, 1.959241, 1, 0, 0, 1, 1,
0.6368418, 2.120274, 0.07164389, 1, 0, 0, 1, 1,
0.6402438, 0.2170086, 0.943063, 1, 0, 0, 1, 1,
0.6413195, -1.96673, 4.113511, 1, 0, 0, 1, 1,
0.6436687, -0.05010407, 0.5272489, 0, 0, 0, 1, 1,
0.6490922, -2.044086, 1.952363, 0, 0, 0, 1, 1,
0.6518631, 1.380497, -0.722744, 0, 0, 0, 1, 1,
0.6521475, -0.3719549, 1.534377, 0, 0, 0, 1, 1,
0.6592746, -0.4122199, 2.808371, 0, 0, 0, 1, 1,
0.6690783, 1.142971, 2.032371, 0, 0, 0, 1, 1,
0.6704668, 1.600894, -0.6706179, 0, 0, 0, 1, 1,
0.6713691, -1.096209, 2.794537, 1, 1, 1, 1, 1,
0.6716097, 0.5187879, -0.1400111, 1, 1, 1, 1, 1,
0.6764012, 1.504966, 0.6254232, 1, 1, 1, 1, 1,
0.6811215, -1.127725, 2.092885, 1, 1, 1, 1, 1,
0.6883321, 0.6727003, 0.9969222, 1, 1, 1, 1, 1,
0.692381, -0.858322, 2.881275, 1, 1, 1, 1, 1,
0.6963909, -1.596035, 2.924408, 1, 1, 1, 1, 1,
0.6970862, 0.492521, 0.7042937, 1, 1, 1, 1, 1,
0.6998942, -0.496207, 2.206686, 1, 1, 1, 1, 1,
0.7001328, -0.05558946, 2.444113, 1, 1, 1, 1, 1,
0.7044983, -0.7619341, 3.580422, 1, 1, 1, 1, 1,
0.7077739, 0.1160691, 1.82406, 1, 1, 1, 1, 1,
0.7109777, 0.9309714, 0.1733317, 1, 1, 1, 1, 1,
0.7112265, 0.1756569, -0.3827334, 1, 1, 1, 1, 1,
0.7250131, 1.323375, 0.1674555, 1, 1, 1, 1, 1,
0.7270558, -1.582147, 2.3017, 0, 0, 1, 1, 1,
0.7287484, 0.5899643, 2.110193, 1, 0, 0, 1, 1,
0.7361102, -2.163836, 2.480427, 1, 0, 0, 1, 1,
0.7414991, 0.8150992, 2.488753, 1, 0, 0, 1, 1,
0.7443623, 0.391943, 0.4154116, 1, 0, 0, 1, 1,
0.744544, 0.4959267, 0.8146172, 1, 0, 0, 1, 1,
0.7448785, -1.423959, 1.834018, 0, 0, 0, 1, 1,
0.7457185, -1.524127, 3.690055, 0, 0, 0, 1, 1,
0.7571799, 0.7690809, 1.17144, 0, 0, 0, 1, 1,
0.7573741, 0.090192, -0.4068631, 0, 0, 0, 1, 1,
0.7595198, -0.1528491, 1.033172, 0, 0, 0, 1, 1,
0.7606261, -0.6389931, 2.189826, 0, 0, 0, 1, 1,
0.7628037, -1.097594, 3.956996, 0, 0, 0, 1, 1,
0.7651521, -0.4521972, 2.643752, 1, 1, 1, 1, 1,
0.7689992, 1.10956, -0.07129654, 1, 1, 1, 1, 1,
0.769568, 0.2708429, 2.360887, 1, 1, 1, 1, 1,
0.7731162, 0.06790792, 1.608682, 1, 1, 1, 1, 1,
0.7795357, -0.7821786, 4.113726, 1, 1, 1, 1, 1,
0.7856993, -0.5790048, 1.389511, 1, 1, 1, 1, 1,
0.7916312, -0.7695829, 0.8947396, 1, 1, 1, 1, 1,
0.7940241, -1.176569, 2.115344, 1, 1, 1, 1, 1,
0.8012504, -0.4921296, 2.638855, 1, 1, 1, 1, 1,
0.8041959, 1.220728, 0.5441325, 1, 1, 1, 1, 1,
0.8054737, -1.779302, 3.32868, 1, 1, 1, 1, 1,
0.8056227, -1.035469, 2.985142, 1, 1, 1, 1, 1,
0.8126483, -0.310227, 1.817429, 1, 1, 1, 1, 1,
0.8145369, -0.5131173, 1.642002, 1, 1, 1, 1, 1,
0.8172849, 0.3287585, 2.779563, 1, 1, 1, 1, 1,
0.8182881, -0.3583314, 2.632819, 0, 0, 1, 1, 1,
0.8278998, -1.834368, 1.342169, 1, 0, 0, 1, 1,
0.8306929, -0.6789852, 2.377634, 1, 0, 0, 1, 1,
0.8378735, 0.04074249, 1.512409, 1, 0, 0, 1, 1,
0.8387526, -0.1890966, 2.451213, 1, 0, 0, 1, 1,
0.8387529, -1.309599, 2.425926, 1, 0, 0, 1, 1,
0.840472, 1.267703, 0.2830071, 0, 0, 0, 1, 1,
0.8405308, 0.690209, 0.3874322, 0, 0, 0, 1, 1,
0.8420773, 0.004522398, 1.996859, 0, 0, 0, 1, 1,
0.8423349, -1.108284, 3.230743, 0, 0, 0, 1, 1,
0.8436458, -0.8626063, 3.308061, 0, 0, 0, 1, 1,
0.8447846, -2.741044, 4.257837, 0, 0, 0, 1, 1,
0.8475279, 0.7464975, 0.7538933, 0, 0, 0, 1, 1,
0.8480328, -0.9763122, 1.363475, 1, 1, 1, 1, 1,
0.8493586, -1.996047, 1.626008, 1, 1, 1, 1, 1,
0.8502206, 0.4062179, 2.605858, 1, 1, 1, 1, 1,
0.8564084, 0.6594236, 2.581482, 1, 1, 1, 1, 1,
0.8574235, 0.02134407, -0.2389181, 1, 1, 1, 1, 1,
0.8577837, 0.3605101, 2.043019, 1, 1, 1, 1, 1,
0.8637765, -0.7054334, 4.015578, 1, 1, 1, 1, 1,
0.8651533, -0.74463, 1.45818, 1, 1, 1, 1, 1,
0.8665307, 0.4263994, 0.7698805, 1, 1, 1, 1, 1,
0.8674062, 0.2668105, 2.059602, 1, 1, 1, 1, 1,
0.8897601, -0.007692987, 2.407727, 1, 1, 1, 1, 1,
0.8944244, 0.1185207, 1.421, 1, 1, 1, 1, 1,
0.8977574, -0.4870721, 1.740393, 1, 1, 1, 1, 1,
0.8998877, 0.09860221, -0.3818959, 1, 1, 1, 1, 1,
0.9006573, -0.4260234, 0.7382651, 1, 1, 1, 1, 1,
0.9049488, 0.02558006, 1.908918, 0, 0, 1, 1, 1,
0.9063743, -0.4155589, 3.060558, 1, 0, 0, 1, 1,
0.9095105, 0.3170795, -0.5735061, 1, 0, 0, 1, 1,
0.9153863, -1.588164, 2.219128, 1, 0, 0, 1, 1,
0.9163818, -0.4433144, 2.331965, 1, 0, 0, 1, 1,
0.9169918, 0.8457016, 1.397725, 1, 0, 0, 1, 1,
0.9210774, 0.8181345, 0.5707777, 0, 0, 0, 1, 1,
0.9225142, -0.4159966, 2.244461, 0, 0, 0, 1, 1,
0.9247296, 0.9511516, 2.834925, 0, 0, 0, 1, 1,
0.926281, 0.864608, -0.6792812, 0, 0, 0, 1, 1,
0.9345633, -0.5437279, 1.484962, 0, 0, 0, 1, 1,
0.9401947, -0.2185111, 2.146894, 0, 0, 0, 1, 1,
0.9413603, -0.3800288, 4.314517, 0, 0, 0, 1, 1,
0.9436981, -1.671642, 1.295442, 1, 1, 1, 1, 1,
0.9466285, 0.03528024, 1.306146, 1, 1, 1, 1, 1,
0.9466991, 1.017982, -1.358368, 1, 1, 1, 1, 1,
0.9567454, -0.9274977, 3.102884, 1, 1, 1, 1, 1,
0.9571319, 0.0334033, 3.104275, 1, 1, 1, 1, 1,
0.9575065, -2.405278, 2.696858, 1, 1, 1, 1, 1,
0.9580684, -1.978627, 1.177845, 1, 1, 1, 1, 1,
0.9637012, -0.7523651, 2.184452, 1, 1, 1, 1, 1,
0.964497, -0.936792, 3.439631, 1, 1, 1, 1, 1,
0.9708362, -0.418546, 1.669851, 1, 1, 1, 1, 1,
0.9728559, -0.5500535, 2.732081, 1, 1, 1, 1, 1,
0.9759966, -1.990087, 3.211554, 1, 1, 1, 1, 1,
0.981668, 2.278409, 1.032559, 1, 1, 1, 1, 1,
0.9835855, -0.2946226, 1.279442, 1, 1, 1, 1, 1,
0.9848349, 0.6092675, 1.078793, 1, 1, 1, 1, 1,
0.9890218, 0.1758767, 2.450269, 0, 0, 1, 1, 1,
0.9896871, 1.935214, 0.4082937, 1, 0, 0, 1, 1,
0.9980114, -1.14601, 2.723204, 1, 0, 0, 1, 1,
1.005136, -0.3313667, 3.896235, 1, 0, 0, 1, 1,
1.0071, -0.9120959, 2.402626, 1, 0, 0, 1, 1,
1.007325, -1.033114, 1.097453, 1, 0, 0, 1, 1,
1.010491, 1.027183, -1.033376, 0, 0, 0, 1, 1,
1.010623, 0.06698975, 3.248341, 0, 0, 0, 1, 1,
1.011935, 0.5187612, 2.425109, 0, 0, 0, 1, 1,
1.016192, 0.1946179, 1.531775, 0, 0, 0, 1, 1,
1.016568, 0.03595094, 2.726311, 0, 0, 0, 1, 1,
1.024053, -0.8370742, 2.579592, 0, 0, 0, 1, 1,
1.028947, 0.2672783, 2.299838, 0, 0, 0, 1, 1,
1.031318, -1.188277, 1.125936, 1, 1, 1, 1, 1,
1.033277, 0.9907674, 0.6622304, 1, 1, 1, 1, 1,
1.037425, 1.278105, 0.4757301, 1, 1, 1, 1, 1,
1.044389, 0.354644, 1.77178, 1, 1, 1, 1, 1,
1.054572, -1.09041, 2.268872, 1, 1, 1, 1, 1,
1.066943, -1.280578, 3.245375, 1, 1, 1, 1, 1,
1.069306, -0.2641822, 1.491587, 1, 1, 1, 1, 1,
1.076686, 0.3124483, 0.8854141, 1, 1, 1, 1, 1,
1.096338, -0.008673962, 0.5340009, 1, 1, 1, 1, 1,
1.098555, 0.9109504, 2.405936, 1, 1, 1, 1, 1,
1.099949, 0.0676301, 3.443135, 1, 1, 1, 1, 1,
1.102694, -0.969621, 0.5835002, 1, 1, 1, 1, 1,
1.105439, -1.235561, 0.8631777, 1, 1, 1, 1, 1,
1.107794, -0.5035769, 1.902256, 1, 1, 1, 1, 1,
1.108466, -1.834534, 2.63009, 1, 1, 1, 1, 1,
1.110925, -0.1774173, 0.9728799, 0, 0, 1, 1, 1,
1.113187, 0.5153978, -0.7985708, 1, 0, 0, 1, 1,
1.114199, 0.08238528, 1.375688, 1, 0, 0, 1, 1,
1.123888, 0.08092543, 1.527626, 1, 0, 0, 1, 1,
1.133255, -1.410038, 0.8618677, 1, 0, 0, 1, 1,
1.133618, 1.683204, 0.6423085, 1, 0, 0, 1, 1,
1.13555, -0.02897625, 0.8715646, 0, 0, 0, 1, 1,
1.135835, 1.042639, -1.732743, 0, 0, 0, 1, 1,
1.138706, 0.4710968, 0.2943854, 0, 0, 0, 1, 1,
1.145267, 0.6834512, 2.200586, 0, 0, 0, 1, 1,
1.149189, -1.617863, 1.838376, 0, 0, 0, 1, 1,
1.15108, -0.9929995, 3.0596, 0, 0, 0, 1, 1,
1.151737, 0.2632315, 0.3313105, 0, 0, 0, 1, 1,
1.161472, 2.209934, -0.06770945, 1, 1, 1, 1, 1,
1.162615, -0.3533358, 2.659181, 1, 1, 1, 1, 1,
1.168051, -0.8902215, 2.017832, 1, 1, 1, 1, 1,
1.16927, 0.3178759, 2.157077, 1, 1, 1, 1, 1,
1.199239, -0.4146276, 2.07807, 1, 1, 1, 1, 1,
1.209402, 0.9819123, -1.528235, 1, 1, 1, 1, 1,
1.211531, 1.728674, 1.761548, 1, 1, 1, 1, 1,
1.212343, 0.3543523, 1.603008, 1, 1, 1, 1, 1,
1.217586, 0.235533, 1.989373, 1, 1, 1, 1, 1,
1.218331, 0.4160413, 2.086761, 1, 1, 1, 1, 1,
1.219239, 0.5399947, 2.607248, 1, 1, 1, 1, 1,
1.219462, 0.9936858, 1.515459, 1, 1, 1, 1, 1,
1.228844, 1.51638, 0.5413186, 1, 1, 1, 1, 1,
1.230454, -1.271951, 4.676019, 1, 1, 1, 1, 1,
1.240449, -0.2664567, 1.794003, 1, 1, 1, 1, 1,
1.24241, 0.5141249, 0.8203112, 0, 0, 1, 1, 1,
1.247569, -0.3636159, 1.31338, 1, 0, 0, 1, 1,
1.247571, 0.09951957, 0.3834555, 1, 0, 0, 1, 1,
1.247925, -0.4272497, 0.08328882, 1, 0, 0, 1, 1,
1.250401, 1.13668, 2.447072, 1, 0, 0, 1, 1,
1.25418, 1.131461, 0.105088, 1, 0, 0, 1, 1,
1.256196, -0.5263737, -0.215447, 0, 0, 0, 1, 1,
1.260924, -2.174839, 3.787206, 0, 0, 0, 1, 1,
1.266552, -1.050301, 2.871791, 0, 0, 0, 1, 1,
1.267879, 1.565899, 0.6369349, 0, 0, 0, 1, 1,
1.271415, 1.618963, 0.5239405, 0, 0, 0, 1, 1,
1.274907, -0.413167, 0.1762514, 0, 0, 0, 1, 1,
1.290513, -1.474244, 2.40485, 0, 0, 0, 1, 1,
1.302395, -1.352088, 3.623045, 1, 1, 1, 1, 1,
1.311126, -0.4125443, 1.333252, 1, 1, 1, 1, 1,
1.313337, -0.8117217, 2.643199, 1, 1, 1, 1, 1,
1.31781, -0.05331986, 1.800895, 1, 1, 1, 1, 1,
1.327114, 0.1887448, 1.092861, 1, 1, 1, 1, 1,
1.327459, -0.7298918, 1.182825, 1, 1, 1, 1, 1,
1.328983, -2.025788, 1.134346, 1, 1, 1, 1, 1,
1.329113, -0.2065866, 1.391021, 1, 1, 1, 1, 1,
1.34239, 0.5160466, 0.1649206, 1, 1, 1, 1, 1,
1.346157, 0.7492166, 1.955872, 1, 1, 1, 1, 1,
1.349316, -0.6578788, 2.211543, 1, 1, 1, 1, 1,
1.36675, -0.1238319, -0.04128601, 1, 1, 1, 1, 1,
1.36687, -0.392451, 3.118435, 1, 1, 1, 1, 1,
1.37078, -0.6973826, 2.865993, 1, 1, 1, 1, 1,
1.370816, 1.276459, 0.7843206, 1, 1, 1, 1, 1,
1.375012, -0.5146039, 1.336379, 0, 0, 1, 1, 1,
1.376837, 0.007261153, 1.680094, 1, 0, 0, 1, 1,
1.378328, 0.6455851, 1.343351, 1, 0, 0, 1, 1,
1.381173, 0.6475117, 2.465218, 1, 0, 0, 1, 1,
1.40212, 2.68646, 0.3032071, 1, 0, 0, 1, 1,
1.403583, 0.4446555, 1.809178, 1, 0, 0, 1, 1,
1.411423, 0.7013446, 0.5080627, 0, 0, 0, 1, 1,
1.415435, 2.242104, 0.9435266, 0, 0, 0, 1, 1,
1.422539, -1.225996, 3.240432, 0, 0, 0, 1, 1,
1.426239, -0.7734396, 3.048245, 0, 0, 0, 1, 1,
1.433417, -0.428652, 1.045636, 0, 0, 0, 1, 1,
1.447469, 0.5481942, 0.4778277, 0, 0, 0, 1, 1,
1.450373, -1.543559, 2.136578, 0, 0, 0, 1, 1,
1.455337, 0.383423, 1.01201, 1, 1, 1, 1, 1,
1.461062, 0.4754891, 0.4001256, 1, 1, 1, 1, 1,
1.467735, -0.3817894, 1.659607, 1, 1, 1, 1, 1,
1.495507, -0.2925914, 3.278891, 1, 1, 1, 1, 1,
1.506529, 0.8886051, 2.646455, 1, 1, 1, 1, 1,
1.517434, -0.3883055, 2.124377, 1, 1, 1, 1, 1,
1.550266, 0.9089004, 1.27983, 1, 1, 1, 1, 1,
1.55437, -0.7828932, 1.915552, 1, 1, 1, 1, 1,
1.56616, 1.695906, 0.7954295, 1, 1, 1, 1, 1,
1.572156, 0.2994311, 1.00068, 1, 1, 1, 1, 1,
1.57275, 1.135602, 1.050337, 1, 1, 1, 1, 1,
1.587655, 0.08896938, 0.7787165, 1, 1, 1, 1, 1,
1.587823, 0.4357131, 0.6462893, 1, 1, 1, 1, 1,
1.6031, -2.834999, 1.915391, 1, 1, 1, 1, 1,
1.609227, 0.9055044, -0.5725809, 1, 1, 1, 1, 1,
1.614727, -0.0813541, 2.904846, 0, 0, 1, 1, 1,
1.615704, 0.750029, 2.229369, 1, 0, 0, 1, 1,
1.642853, -0.6218688, 0.9258895, 1, 0, 0, 1, 1,
1.66009, 0.5943165, 1.271723, 1, 0, 0, 1, 1,
1.669648, -0.6553915, -0.1257043, 1, 0, 0, 1, 1,
1.671717, 1.52843, 2.003312, 1, 0, 0, 1, 1,
1.687923, 1.133606, 0.9240665, 0, 0, 0, 1, 1,
1.695494, 0.6685779, 2.568191, 0, 0, 0, 1, 1,
1.699805, -0.6385898, 3.476994, 0, 0, 0, 1, 1,
1.700477, -0.5252101, 2.804585, 0, 0, 0, 1, 1,
1.724847, 0.07148896, 1.944374, 0, 0, 0, 1, 1,
1.732246, 1.141845, 1.765053, 0, 0, 0, 1, 1,
1.747759, -0.8865432, 1.910759, 0, 0, 0, 1, 1,
1.767725, -0.6172562, 1.958073, 1, 1, 1, 1, 1,
1.794036, 0.2069291, 1.330827, 1, 1, 1, 1, 1,
1.815472, -1.707778, 1.987398, 1, 1, 1, 1, 1,
1.825263, 0.2629308, 0.4996792, 1, 1, 1, 1, 1,
1.838512, -0.5713397, 1.284302, 1, 1, 1, 1, 1,
1.853033, -0.1724613, 1.028853, 1, 1, 1, 1, 1,
1.858029, 1.146283, 1.085458, 1, 1, 1, 1, 1,
1.860053, 0.6865149, 0.7140217, 1, 1, 1, 1, 1,
1.865367, 0.6203774, 2.08169, 1, 1, 1, 1, 1,
1.876942, 1.350255, 2.08466, 1, 1, 1, 1, 1,
1.89475, 0.5246379, 1.294298, 1, 1, 1, 1, 1,
1.899541, 0.1636953, 1.921613, 1, 1, 1, 1, 1,
1.907508, 1.27633, 1.165506, 1, 1, 1, 1, 1,
1.908331, -0.7124147, 1.592019, 1, 1, 1, 1, 1,
1.920407, -1.0695, 1.547281, 1, 1, 1, 1, 1,
1.955675, -1.998494, 2.140279, 0, 0, 1, 1, 1,
1.965856, -0.4895275, 1.600324, 1, 0, 0, 1, 1,
1.987444, 1.041381, 1.602318, 1, 0, 0, 1, 1,
1.988254, 0.1752803, 1.057209, 1, 0, 0, 1, 1,
2.002142, 0.002362887, 1.328061, 1, 0, 0, 1, 1,
2.013921, -0.6319178, 2.86088, 1, 0, 0, 1, 1,
2.026109, -0.7158272, 1.765904, 0, 0, 0, 1, 1,
2.085342, 0.1718529, -0.4144031, 0, 0, 0, 1, 1,
2.093203, 1.257997, -1.101229, 0, 0, 0, 1, 1,
2.127614, 0.3782766, 3.073134, 0, 0, 0, 1, 1,
2.147094, 1.635648, 1.938633, 0, 0, 0, 1, 1,
2.163944, -0.3856442, 1.298825, 0, 0, 0, 1, 1,
2.176298, -0.2316617, 2.80265, 0, 0, 0, 1, 1,
2.230365, 0.5638547, 2.235388, 1, 1, 1, 1, 1,
2.30563, 0.6496375, 1.176468, 1, 1, 1, 1, 1,
2.332753, -0.9229031, 2.691009, 1, 1, 1, 1, 1,
2.351633, -2.498722, 1.78253, 1, 1, 1, 1, 1,
2.380325, -0.1305745, 2.098189, 1, 1, 1, 1, 1,
2.457833, -1.262541, 2.24654, 1, 1, 1, 1, 1,
2.805938, 0.01268987, 1.229406, 1, 1, 1, 1, 1
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
var radius = 9.484442;
var distance = 33.3137;
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
mvMatrix.translate( 0.2084579, -0.01937556, 0.5689399 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.3137);
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
