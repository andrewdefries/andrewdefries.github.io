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
-3.250002, 1.134769, -0.8914591, 1, 0, 0, 1,
-3.171231, -0.2849157, -0.9761466, 1, 0.007843138, 0, 1,
-2.988133, -0.2682323, -1.613429, 1, 0.01176471, 0, 1,
-2.926096, 1.726391, -2.208238, 1, 0.01960784, 0, 1,
-2.885682, 1.319132, -0.5692303, 1, 0.02352941, 0, 1,
-2.825089, 0.9847557, 0.4791086, 1, 0.03137255, 0, 1,
-2.635334, 1.569355, -1.643923, 1, 0.03529412, 0, 1,
-2.504793, 1.020698, -0.1009305, 1, 0.04313726, 0, 1,
-2.478589, 0.5174923, -3.149933, 1, 0.04705882, 0, 1,
-2.456081, -1.621799, -2.87921, 1, 0.05490196, 0, 1,
-2.445038, 0.2372444, -1.356258, 1, 0.05882353, 0, 1,
-2.384761, -0.7492392, -0.5590646, 1, 0.06666667, 0, 1,
-2.373441, -0.2314284, -0.2954572, 1, 0.07058824, 0, 1,
-2.342986, 0.05433202, -1.645645, 1, 0.07843138, 0, 1,
-2.252457, -1.42385, -2.619073, 1, 0.08235294, 0, 1,
-2.230545, 2.001853, -2.399356, 1, 0.09019608, 0, 1,
-2.16763, -0.1693099, -2.421072, 1, 0.09411765, 0, 1,
-2.114245, -0.2169587, -1.121319, 1, 0.1019608, 0, 1,
-2.108093, 0.05361747, -1.561974, 1, 0.1098039, 0, 1,
-2.106263, -1.380215, -2.054651, 1, 0.1137255, 0, 1,
-2.103888, 1.085445, -0.04845741, 1, 0.1215686, 0, 1,
-2.089866, -0.5819384, -0.3584701, 1, 0.1254902, 0, 1,
-2.061481, -1.600778, -2.475127, 1, 0.1333333, 0, 1,
-2.021594, 0.1890426, 0.8069678, 1, 0.1372549, 0, 1,
-2.011601, -0.2424157, -2.191385, 1, 0.145098, 0, 1,
-1.997949, 0.1368079, -0.2252197, 1, 0.1490196, 0, 1,
-1.977807, -1.373331, -0.8869053, 1, 0.1568628, 0, 1,
-1.957415, 0.5123463, 1.696679, 1, 0.1607843, 0, 1,
-1.951169, 0.9963344, -1.684507, 1, 0.1686275, 0, 1,
-1.948691, -1.515864, -2.375688, 1, 0.172549, 0, 1,
-1.937984, 2.185277, 0.301659, 1, 0.1803922, 0, 1,
-1.935462, 0.8564848, -0.1519642, 1, 0.1843137, 0, 1,
-1.911411, 1.336778, -0.9121644, 1, 0.1921569, 0, 1,
-1.870426, -0.9706317, -2.8117, 1, 0.1960784, 0, 1,
-1.870099, 0.3110102, -1.467173, 1, 0.2039216, 0, 1,
-1.864804, -2.154533, -2.454014, 1, 0.2117647, 0, 1,
-1.819509, -0.2496208, -2.266594, 1, 0.2156863, 0, 1,
-1.810788, 0.7196792, -2.321451, 1, 0.2235294, 0, 1,
-1.799493, 0.3362958, -1.122401, 1, 0.227451, 0, 1,
-1.787821, -0.153129, -2.793463, 1, 0.2352941, 0, 1,
-1.782145, 1.093973, 0.8050704, 1, 0.2392157, 0, 1,
-1.780863, -1.956323, -1.903979, 1, 0.2470588, 0, 1,
-1.778374, -1.070614, -2.371996, 1, 0.2509804, 0, 1,
-1.752786, 0.8890095, -0.8093922, 1, 0.2588235, 0, 1,
-1.732442, -1.275752, -1.918674, 1, 0.2627451, 0, 1,
-1.730631, -0.499466, -2.189853, 1, 0.2705882, 0, 1,
-1.718176, 0.1590242, -0.6173372, 1, 0.2745098, 0, 1,
-1.704192, -0.03593563, -1.948238, 1, 0.282353, 0, 1,
-1.700627, -0.4666249, -1.312358, 1, 0.2862745, 0, 1,
-1.696576, -0.7711403, -3.56947, 1, 0.2941177, 0, 1,
-1.686503, -0.2095519, -1.475517, 1, 0.3019608, 0, 1,
-1.684937, -0.4169551, -2.534605, 1, 0.3058824, 0, 1,
-1.669709, -0.6039326, -0.01316899, 1, 0.3137255, 0, 1,
-1.649902, 0.04893149, -1.86244, 1, 0.3176471, 0, 1,
-1.647531, -0.9352025, -1.835114, 1, 0.3254902, 0, 1,
-1.632195, 1.180987, -2.091964, 1, 0.3294118, 0, 1,
-1.608791, -0.1887346, -1.460314, 1, 0.3372549, 0, 1,
-1.597207, -1.78792, -3.197885, 1, 0.3411765, 0, 1,
-1.591389, -0.4745325, -1.329712, 1, 0.3490196, 0, 1,
-1.587877, -0.1364009, -0.9287412, 1, 0.3529412, 0, 1,
-1.576403, -0.231262, -1.852077, 1, 0.3607843, 0, 1,
-1.564154, 0.1938182, -1.667661, 1, 0.3647059, 0, 1,
-1.560466, -0.2784468, -1.629059, 1, 0.372549, 0, 1,
-1.54443, -1.704024, -2.194051, 1, 0.3764706, 0, 1,
-1.541044, -0.9561656, -1.889817, 1, 0.3843137, 0, 1,
-1.538628, -0.5757883, -1.846887, 1, 0.3882353, 0, 1,
-1.521088, -0.8622373, -1.761665, 1, 0.3960784, 0, 1,
-1.51537, -0.2434761, -0.521014, 1, 0.4039216, 0, 1,
-1.506507, -0.231648, -2.618376, 1, 0.4078431, 0, 1,
-1.50328, -0.0267106, -3.71463, 1, 0.4156863, 0, 1,
-1.464618, -1.271318, -1.220843, 1, 0.4196078, 0, 1,
-1.449509, -0.5666155, -1.621562, 1, 0.427451, 0, 1,
-1.443859, 0.9097812, -1.177408, 1, 0.4313726, 0, 1,
-1.421992, -0.6523743, -2.830397, 1, 0.4392157, 0, 1,
-1.396069, 0.0154576, -2.194384, 1, 0.4431373, 0, 1,
-1.386159, -1.592353, -0.8009613, 1, 0.4509804, 0, 1,
-1.384474, 0.03469883, -1.903331, 1, 0.454902, 0, 1,
-1.372309, -0.5594405, -3.831903, 1, 0.4627451, 0, 1,
-1.366471, 0.619229, -2.86704, 1, 0.4666667, 0, 1,
-1.362525, 3.710398, 0.8574356, 1, 0.4745098, 0, 1,
-1.360193, -0.04407468, 0.3255634, 1, 0.4784314, 0, 1,
-1.354836, 2.814816, -1.23442, 1, 0.4862745, 0, 1,
-1.345823, -0.009365707, -3.296597, 1, 0.4901961, 0, 1,
-1.330141, 0.720701, -0.9170188, 1, 0.4980392, 0, 1,
-1.323263, -0.6141847, -3.845506, 1, 0.5058824, 0, 1,
-1.322549, -0.6262785, -1.503026, 1, 0.509804, 0, 1,
-1.30881, -2.138356, -2.666936, 1, 0.5176471, 0, 1,
-1.303774, 1.968128, -0.1660091, 1, 0.5215687, 0, 1,
-1.279951, 0.6232647, 0.03163712, 1, 0.5294118, 0, 1,
-1.275096, -1.814768, -4.132351, 1, 0.5333334, 0, 1,
-1.267791, -1.364408, -3.169365, 1, 0.5411765, 0, 1,
-1.248526, 0.3076417, 0.1511846, 1, 0.5450981, 0, 1,
-1.242384, 2.115987, -1.230125, 1, 0.5529412, 0, 1,
-1.242243, -0.9474049, -3.164811, 1, 0.5568628, 0, 1,
-1.241268, 2.459816, 0.3222599, 1, 0.5647059, 0, 1,
-1.231385, 0.475885, -1.44782, 1, 0.5686275, 0, 1,
-1.22961, -1.213138, -1.923696, 1, 0.5764706, 0, 1,
-1.217942, -0.9709536, -1.269146, 1, 0.5803922, 0, 1,
-1.217214, 0.2262288, -1.074777, 1, 0.5882353, 0, 1,
-1.217101, -0.5385966, -3.83971, 1, 0.5921569, 0, 1,
-1.208465, 0.2485709, -0.70898, 1, 0.6, 0, 1,
-1.208005, -0.4358936, -3.629902, 1, 0.6078432, 0, 1,
-1.190578, 0.5823689, -0.8078101, 1, 0.6117647, 0, 1,
-1.186977, 0.7154751, -0.3919598, 1, 0.6196079, 0, 1,
-1.181732, 2.006932, -1.485908, 1, 0.6235294, 0, 1,
-1.175992, -0.8257882, -2.233479, 1, 0.6313726, 0, 1,
-1.172488, 0.3949141, 0.2757322, 1, 0.6352941, 0, 1,
-1.162155, 0.7730941, -1.191069, 1, 0.6431373, 0, 1,
-1.16212, 0.2543477, -0.4232881, 1, 0.6470588, 0, 1,
-1.159301, 0.1421387, -2.268877, 1, 0.654902, 0, 1,
-1.15668, 0.2551184, -1.215619, 1, 0.6588235, 0, 1,
-1.156453, -1.695848, -0.682161, 1, 0.6666667, 0, 1,
-1.155644, 0.2921079, -1.408385, 1, 0.6705883, 0, 1,
-1.153856, -0.4249826, -1.515412, 1, 0.6784314, 0, 1,
-1.149451, -1.072674, -0.7336649, 1, 0.682353, 0, 1,
-1.146893, -0.8413864, -1.750121, 1, 0.6901961, 0, 1,
-1.146447, 0.9817716, -1.042998, 1, 0.6941177, 0, 1,
-1.145761, -0.3744887, -3.507788, 1, 0.7019608, 0, 1,
-1.1374, -0.9314159, -3.728078, 1, 0.7098039, 0, 1,
-1.135715, 0.3341045, -0.3109704, 1, 0.7137255, 0, 1,
-1.132973, 0.6295699, -0.9037523, 1, 0.7215686, 0, 1,
-1.121528, 1.098029, -1.568983, 1, 0.7254902, 0, 1,
-1.105463, 1.018165, 0.1699686, 1, 0.7333333, 0, 1,
-1.090871, 1.760939, 0.5138551, 1, 0.7372549, 0, 1,
-1.089523, -0.3676528, -2.710283, 1, 0.7450981, 0, 1,
-1.089169, 0.04086412, 0.08272752, 1, 0.7490196, 0, 1,
-1.088882, 2.005512, -1.096984, 1, 0.7568628, 0, 1,
-1.087149, 1.408389, -0.6677089, 1, 0.7607843, 0, 1,
-1.086329, -0.5349716, -3.065804, 1, 0.7686275, 0, 1,
-1.080172, -0.0002813694, -2.239264, 1, 0.772549, 0, 1,
-1.078989, 0.5410935, -4.115333, 1, 0.7803922, 0, 1,
-1.078921, 0.05673735, -2.216902, 1, 0.7843137, 0, 1,
-1.077807, 0.1816464, -0.8443235, 1, 0.7921569, 0, 1,
-1.076519, -0.3600735, -2.698578, 1, 0.7960784, 0, 1,
-1.074878, -0.326213, -0.5398784, 1, 0.8039216, 0, 1,
-1.06914, 0.0135393, -0.8902606, 1, 0.8117647, 0, 1,
-1.067776, -0.07010314, -2.130256, 1, 0.8156863, 0, 1,
-1.067339, 0.05176693, -2.127387, 1, 0.8235294, 0, 1,
-1.064511, 1.22546, -3.096834, 1, 0.827451, 0, 1,
-1.061512, -0.3256625, -2.151024, 1, 0.8352941, 0, 1,
-1.058831, -1.39641, -3.5541, 1, 0.8392157, 0, 1,
-1.050021, -2.004285, -0.09310256, 1, 0.8470588, 0, 1,
-1.049998, 0.8203985, -1.456731, 1, 0.8509804, 0, 1,
-1.041244, 1.102007, 0.01497809, 1, 0.8588235, 0, 1,
-1.023008, 0.5114378, -1.10717, 1, 0.8627451, 0, 1,
-1.021029, -2.724226, -3.214823, 1, 0.8705882, 0, 1,
-1.009215, -1.340449, -3.666618, 1, 0.8745098, 0, 1,
-0.9948076, 1.91636, -0.6845597, 1, 0.8823529, 0, 1,
-0.9844003, -1.13421, -1.871675, 1, 0.8862745, 0, 1,
-0.980118, -0.3237865, -1.509313, 1, 0.8941177, 0, 1,
-0.9789478, 0.3246711, -0.1993163, 1, 0.8980392, 0, 1,
-0.9723507, 0.1979103, -1.419625, 1, 0.9058824, 0, 1,
-0.9679332, 0.7081828, -1.182624, 1, 0.9137255, 0, 1,
-0.9675022, 0.1121848, -3.060606, 1, 0.9176471, 0, 1,
-0.9632633, 2.424551, -1.359194, 1, 0.9254902, 0, 1,
-0.9549733, -0.1025732, -1.398772, 1, 0.9294118, 0, 1,
-0.9483572, -0.9450113, -1.693887, 1, 0.9372549, 0, 1,
-0.9478727, -0.1825397, 1.29852, 1, 0.9411765, 0, 1,
-0.942816, -0.3024611, -0.9314756, 1, 0.9490196, 0, 1,
-0.9383879, -0.02436786, -1.778561, 1, 0.9529412, 0, 1,
-0.931592, -0.9683652, -2.229363, 1, 0.9607843, 0, 1,
-0.9293587, 0.6975994, -1.81845, 1, 0.9647059, 0, 1,
-0.9274269, 0.9009855, 0.2946521, 1, 0.972549, 0, 1,
-0.9202123, 0.4363776, -0.4446634, 1, 0.9764706, 0, 1,
-0.9159799, -0.7578695, -2.168376, 1, 0.9843137, 0, 1,
-0.9097396, -0.942875, -1.275512, 1, 0.9882353, 0, 1,
-0.9071912, -0.01114302, -0.2861531, 1, 0.9960784, 0, 1,
-0.9069415, -0.8649875, -3.226046, 0.9960784, 1, 0, 1,
-0.9054325, -0.1638973, -1.966354, 0.9921569, 1, 0, 1,
-0.8977495, 0.265357, -1.28528, 0.9843137, 1, 0, 1,
-0.8886749, -1.524269, -3.607917, 0.9803922, 1, 0, 1,
-0.869666, 0.347048, -0.6114147, 0.972549, 1, 0, 1,
-0.8665246, 0.5061613, -0.5124493, 0.9686275, 1, 0, 1,
-0.8644974, -0.2155079, -0.412575, 0.9607843, 1, 0, 1,
-0.8638104, 1.375162, 0.9813462, 0.9568627, 1, 0, 1,
-0.8489969, -1.043969, -4.198591, 0.9490196, 1, 0, 1,
-0.8459849, -0.2131617, -1.175672, 0.945098, 1, 0, 1,
-0.8426823, -0.1299507, -1.716481, 0.9372549, 1, 0, 1,
-0.8424509, -0.9186414, -2.74813, 0.9333333, 1, 0, 1,
-0.8353783, 1.749814, 0.5124428, 0.9254902, 1, 0, 1,
-0.834788, 0.2618708, -2.651411, 0.9215686, 1, 0, 1,
-0.8278589, -1.044438, -1.39297, 0.9137255, 1, 0, 1,
-0.824324, 1.102298, 0.9073267, 0.9098039, 1, 0, 1,
-0.8239391, 1.452773, 0.6775236, 0.9019608, 1, 0, 1,
-0.8219253, 1.101766, -2.18545, 0.8941177, 1, 0, 1,
-0.8174115, 0.9150981, -0.7512897, 0.8901961, 1, 0, 1,
-0.814078, 0.1507942, -2.80086, 0.8823529, 1, 0, 1,
-0.8139245, 0.2815465, -1.148316, 0.8784314, 1, 0, 1,
-0.8128923, 0.3751756, -2.211447, 0.8705882, 1, 0, 1,
-0.8094759, -0.5376049, -2.75526, 0.8666667, 1, 0, 1,
-0.8077102, 1.43149, -0.02014036, 0.8588235, 1, 0, 1,
-0.8074817, -1.149752, -2.735576, 0.854902, 1, 0, 1,
-0.8016958, -0.3926111, -1.999415, 0.8470588, 1, 0, 1,
-0.7955375, -0.0918926, -0.6413657, 0.8431373, 1, 0, 1,
-0.7938534, 0.2696992, -1.538373, 0.8352941, 1, 0, 1,
-0.7874741, -0.2231717, -1.351614, 0.8313726, 1, 0, 1,
-0.7854698, 0.3622935, -2.531352, 0.8235294, 1, 0, 1,
-0.7805861, 0.03754359, -1.841163, 0.8196079, 1, 0, 1,
-0.7777224, 0.5475197, 0.2097486, 0.8117647, 1, 0, 1,
-0.7767865, 0.09199239, -1.225948, 0.8078431, 1, 0, 1,
-0.7721375, -1.463934, -3.083435, 0.8, 1, 0, 1,
-0.7687892, 1.3325, -0.8675579, 0.7921569, 1, 0, 1,
-0.7680427, 0.4055029, -2.526783, 0.7882353, 1, 0, 1,
-0.7669895, 0.9216525, -1.784756, 0.7803922, 1, 0, 1,
-0.7669215, 0.231656, -3.649765, 0.7764706, 1, 0, 1,
-0.7523668, 0.9149727, 0.4320437, 0.7686275, 1, 0, 1,
-0.7490262, 0.6301233, -0.6153767, 0.7647059, 1, 0, 1,
-0.746622, -0.5509139, -1.635301, 0.7568628, 1, 0, 1,
-0.738111, 0.5547836, -1.875519, 0.7529412, 1, 0, 1,
-0.7354333, 1.038345, -2.506385, 0.7450981, 1, 0, 1,
-0.7352293, 0.2287573, -2.52529, 0.7411765, 1, 0, 1,
-0.7321302, 0.7626298, -0.3576103, 0.7333333, 1, 0, 1,
-0.7274437, -0.01536176, 0.7905264, 0.7294118, 1, 0, 1,
-0.7251467, -0.3438981, -1.108505, 0.7215686, 1, 0, 1,
-0.7224985, 0.3951549, -0.7832463, 0.7176471, 1, 0, 1,
-0.7208238, -0.1622018, -1.380584, 0.7098039, 1, 0, 1,
-0.7105824, -0.4414002, -3.711763, 0.7058824, 1, 0, 1,
-0.7099084, 1.003353, -1.545268, 0.6980392, 1, 0, 1,
-0.7087292, -0.05327389, -2.31076, 0.6901961, 1, 0, 1,
-0.7086547, 0.7881463, 0.6473765, 0.6862745, 1, 0, 1,
-0.7058491, -0.8112663, -3.085234, 0.6784314, 1, 0, 1,
-0.7018562, -0.6314834, -1.957986, 0.6745098, 1, 0, 1,
-0.6992259, 0.551462, -0.05989918, 0.6666667, 1, 0, 1,
-0.6974278, -0.2889079, -2.280829, 0.6627451, 1, 0, 1,
-0.6938968, -0.2534148, -2.215562, 0.654902, 1, 0, 1,
-0.6907916, 0.0812113, -2.500185, 0.6509804, 1, 0, 1,
-0.6880403, 0.5887987, -1.667784, 0.6431373, 1, 0, 1,
-0.6828119, 1.104486, -0.9663594, 0.6392157, 1, 0, 1,
-0.6825987, -1.476259, -2.095332, 0.6313726, 1, 0, 1,
-0.6799294, 1.272481, -0.2944896, 0.627451, 1, 0, 1,
-0.6709422, 1.90334, 0.2718083, 0.6196079, 1, 0, 1,
-0.6705382, -1.438525, -2.378996, 0.6156863, 1, 0, 1,
-0.6704124, -1.048493, -2.620946, 0.6078432, 1, 0, 1,
-0.6666929, -1.116587, -2.67882, 0.6039216, 1, 0, 1,
-0.6565664, -0.1340735, -3.999558, 0.5960785, 1, 0, 1,
-0.6545757, 0.1692598, -1.344792, 0.5882353, 1, 0, 1,
-0.6515508, -0.002891499, 0.2438974, 0.5843138, 1, 0, 1,
-0.6514897, -0.650201, -2.041625, 0.5764706, 1, 0, 1,
-0.6427012, 0.705716, -0.5322285, 0.572549, 1, 0, 1,
-0.6415489, -1.10174, -0.2936233, 0.5647059, 1, 0, 1,
-0.6361336, 1.933556, -1.05067, 0.5607843, 1, 0, 1,
-0.6327599, 1.198332, -1.284379, 0.5529412, 1, 0, 1,
-0.6323379, -1.356255, -2.652292, 0.5490196, 1, 0, 1,
-0.6319585, -1.134022, -3.331108, 0.5411765, 1, 0, 1,
-0.6307179, -1.63289, -2.887177, 0.5372549, 1, 0, 1,
-0.6263778, -0.7224332, -4.627232, 0.5294118, 1, 0, 1,
-0.6229932, -0.3119824, -2.974594, 0.5254902, 1, 0, 1,
-0.6228571, 1.252671, 0.8761304, 0.5176471, 1, 0, 1,
-0.6205276, 1.076633, -0.4879113, 0.5137255, 1, 0, 1,
-0.6203259, 0.6096207, -1.947187, 0.5058824, 1, 0, 1,
-0.6174057, -0.7293549, -1.833584, 0.5019608, 1, 0, 1,
-0.6153045, 0.09932309, -1.154953, 0.4941176, 1, 0, 1,
-0.6146981, -0.2676325, -1.567768, 0.4862745, 1, 0, 1,
-0.6135763, 1.947917, -1.412241, 0.4823529, 1, 0, 1,
-0.6048755, -0.06582218, -0.5549818, 0.4745098, 1, 0, 1,
-0.5985381, -0.3599328, -2.051655, 0.4705882, 1, 0, 1,
-0.5951958, 0.1907701, -1.12146, 0.4627451, 1, 0, 1,
-0.5903786, -1.121229, -2.846948, 0.4588235, 1, 0, 1,
-0.5894664, 0.3998877, -1.108813, 0.4509804, 1, 0, 1,
-0.5850126, 0.1421407, -0.4254768, 0.4470588, 1, 0, 1,
-0.5810869, 0.1240945, -0.09577244, 0.4392157, 1, 0, 1,
-0.5784909, -1.389676, -1.976685, 0.4352941, 1, 0, 1,
-0.57772, -1.048039, -1.910895, 0.427451, 1, 0, 1,
-0.572973, 0.8420833, -1.063444, 0.4235294, 1, 0, 1,
-0.571847, 0.8128775, -0.5915614, 0.4156863, 1, 0, 1,
-0.5717562, -0.4036128, -2.721624, 0.4117647, 1, 0, 1,
-0.5698044, 1.459248, -1.796982, 0.4039216, 1, 0, 1,
-0.5665212, -0.8666463, -3.124333, 0.3960784, 1, 0, 1,
-0.5647274, -0.8078912, -2.912225, 0.3921569, 1, 0, 1,
-0.5626845, 0.3150356, -2.532609, 0.3843137, 1, 0, 1,
-0.5620567, -0.09888522, -1.809076, 0.3803922, 1, 0, 1,
-0.5614879, -0.8264223, -3.434684, 0.372549, 1, 0, 1,
-0.558857, -0.5981624, -3.185447, 0.3686275, 1, 0, 1,
-0.5555221, 2.623046, -0.1629843, 0.3607843, 1, 0, 1,
-0.5546349, -0.2886651, -1.205373, 0.3568628, 1, 0, 1,
-0.5543474, -0.1347485, -0.7748321, 0.3490196, 1, 0, 1,
-0.5514088, -0.8674529, -2.161969, 0.345098, 1, 0, 1,
-0.5506782, 0.3460076, -1.394899, 0.3372549, 1, 0, 1,
-0.5496749, 1.009634, -0.03199806, 0.3333333, 1, 0, 1,
-0.5461203, -0.6380864, -3.08975, 0.3254902, 1, 0, 1,
-0.5457975, 1.635216, -1.13904, 0.3215686, 1, 0, 1,
-0.5454619, -0.9403921, -3.746409, 0.3137255, 1, 0, 1,
-0.5424113, -0.1251525, -2.589218, 0.3098039, 1, 0, 1,
-0.5376097, -0.8364714, -2.006755, 0.3019608, 1, 0, 1,
-0.5339996, -1.010707, -2.723955, 0.2941177, 1, 0, 1,
-0.5294744, 2.386624, -0.2212616, 0.2901961, 1, 0, 1,
-0.5260564, -0.4449993, -3.16729, 0.282353, 1, 0, 1,
-0.524036, -1.444368, -1.293999, 0.2784314, 1, 0, 1,
-0.5240066, 0.2972477, -1.819903, 0.2705882, 1, 0, 1,
-0.519209, -1.305156, -3.564413, 0.2666667, 1, 0, 1,
-0.5191476, 0.2337019, -0.4084201, 0.2588235, 1, 0, 1,
-0.5182711, -0.813674, -0.2122731, 0.254902, 1, 0, 1,
-0.5118245, -1.222107, -3.36596, 0.2470588, 1, 0, 1,
-0.5060889, 1.129517, -1.816202, 0.2431373, 1, 0, 1,
-0.5017509, 0.8340343, 0.3825343, 0.2352941, 1, 0, 1,
-0.4978983, -2.284752, -4.564395, 0.2313726, 1, 0, 1,
-0.4931401, -0.920863, -3.098112, 0.2235294, 1, 0, 1,
-0.4890079, 0.07673541, -3.421984, 0.2196078, 1, 0, 1,
-0.4857419, 1.381888, -0.5313089, 0.2117647, 1, 0, 1,
-0.4837514, 1.693768, -0.1814054, 0.2078431, 1, 0, 1,
-0.4786507, 0.461511, -0.1823129, 0.2, 1, 0, 1,
-0.4732405, -1.293476, -3.064138, 0.1921569, 1, 0, 1,
-0.4725116, 1.827313, 0.005116256, 0.1882353, 1, 0, 1,
-0.463351, -0.6336614, -1.81897, 0.1803922, 1, 0, 1,
-0.4554446, 0.7798755, -1.448782, 0.1764706, 1, 0, 1,
-0.4540044, -0.328445, -0.158048, 0.1686275, 1, 0, 1,
-0.449585, -1.429433, -2.029891, 0.1647059, 1, 0, 1,
-0.4493587, -0.001877783, -1.242576, 0.1568628, 1, 0, 1,
-0.4485256, -0.4273981, -3.258202, 0.1529412, 1, 0, 1,
-0.4453336, 0.8910746, -1.040395, 0.145098, 1, 0, 1,
-0.4450041, -0.4309693, -3.163072, 0.1411765, 1, 0, 1,
-0.4426755, 1.149233, -0.1844053, 0.1333333, 1, 0, 1,
-0.441984, 2.368084, -0.5225084, 0.1294118, 1, 0, 1,
-0.4397849, 0.3191554, -1.03098, 0.1215686, 1, 0, 1,
-0.4388279, -0.4152547, -0.7196809, 0.1176471, 1, 0, 1,
-0.4376654, -0.6410155, -1.574116, 0.1098039, 1, 0, 1,
-0.436748, 1.225649, -1.382226, 0.1058824, 1, 0, 1,
-0.4355337, 0.1105149, -1.960747, 0.09803922, 1, 0, 1,
-0.4338169, -0.3084402, -3.001509, 0.09019608, 1, 0, 1,
-0.4331153, 0.819962, -1.777229, 0.08627451, 1, 0, 1,
-0.4257701, 1.385617, 0.5425442, 0.07843138, 1, 0, 1,
-0.4256194, -1.043948, -2.588245, 0.07450981, 1, 0, 1,
-0.4251836, 1.578531, -0.1374774, 0.06666667, 1, 0, 1,
-0.4213092, -0.6051384, -2.197123, 0.0627451, 1, 0, 1,
-0.4194334, -0.370989, -3.228797, 0.05490196, 1, 0, 1,
-0.4096224, 1.547167, 0.277396, 0.05098039, 1, 0, 1,
-0.4094305, 0.4586217, -1.905049, 0.04313726, 1, 0, 1,
-0.4091533, 0.03556754, -2.725592, 0.03921569, 1, 0, 1,
-0.4078202, 0.006382217, -1.325391, 0.03137255, 1, 0, 1,
-0.4072094, -0.1956187, -2.04301, 0.02745098, 1, 0, 1,
-0.4051125, 0.4406603, -0.4004278, 0.01960784, 1, 0, 1,
-0.4034422, -0.4546472, -2.750545, 0.01568628, 1, 0, 1,
-0.402865, -1.699667, -4.108071, 0.007843138, 1, 0, 1,
-0.4003232, -1.095259, -1.4238, 0.003921569, 1, 0, 1,
-0.3916134, -0.4407006, -2.80864, 0, 1, 0.003921569, 1,
-0.3878083, -1.688619, -4.890501, 0, 1, 0.01176471, 1,
-0.3864723, -0.1775681, -0.8120684, 0, 1, 0.01568628, 1,
-0.3839539, 0.909594, -0.5497628, 0, 1, 0.02352941, 1,
-0.3814725, -0.4149745, -3.094796, 0, 1, 0.02745098, 1,
-0.3790509, -0.04560677, -1.463427, 0, 1, 0.03529412, 1,
-0.3780673, 1.340459, 1.827058, 0, 1, 0.03921569, 1,
-0.3779151, 0.8168392, -1.317785, 0, 1, 0.04705882, 1,
-0.3760627, -1.335159, -1.876803, 0, 1, 0.05098039, 1,
-0.3717315, -1.241653, -3.977968, 0, 1, 0.05882353, 1,
-0.367986, 1.650288, -1.434847, 0, 1, 0.0627451, 1,
-0.3663214, -0.067059, 0.1874845, 0, 1, 0.07058824, 1,
-0.3632177, 0.8317777, 0.2408475, 0, 1, 0.07450981, 1,
-0.3620113, 0.2072334, -2.096286, 0, 1, 0.08235294, 1,
-0.3614339, 1.025479, -1.569344, 0, 1, 0.08627451, 1,
-0.361032, -0.2334345, -2.047594, 0, 1, 0.09411765, 1,
-0.3588712, -3.49103, -2.718506, 0, 1, 0.1019608, 1,
-0.356829, 1.097387, -0.09547211, 0, 1, 0.1058824, 1,
-0.3544273, -0.6727099, -2.959329, 0, 1, 0.1137255, 1,
-0.3472914, -1.142789, -3.334045, 0, 1, 0.1176471, 1,
-0.3449292, 0.4351257, -2.916847, 0, 1, 0.1254902, 1,
-0.3449285, 0.0991402, -0.7816265, 0, 1, 0.1294118, 1,
-0.3404936, 1.032931, -0.6442945, 0, 1, 0.1372549, 1,
-0.3402292, -0.1874936, -2.513559, 0, 1, 0.1411765, 1,
-0.3390364, 1.465863, -0.3262143, 0, 1, 0.1490196, 1,
-0.3384634, 0.6558629, 0.04684095, 0, 1, 0.1529412, 1,
-0.3382018, 0.9942023, 1.167247, 0, 1, 0.1607843, 1,
-0.3339536, -0.4420406, -3.619382, 0, 1, 0.1647059, 1,
-0.3328671, -2.348931, -2.497053, 0, 1, 0.172549, 1,
-0.332683, 0.458755, -0.8750765, 0, 1, 0.1764706, 1,
-0.3320133, 0.1415411, -2.145082, 0, 1, 0.1843137, 1,
-0.3287214, 0.2324709, 0.1281672, 0, 1, 0.1882353, 1,
-0.3256083, 2.982774, -1.30419, 0, 1, 0.1960784, 1,
-0.3254503, -0.8175642, -2.143609, 0, 1, 0.2039216, 1,
-0.3246205, -0.3687155, -2.298325, 0, 1, 0.2078431, 1,
-0.3240697, -0.1577449, -1.434994, 0, 1, 0.2156863, 1,
-0.3206996, -0.350202, -2.005638, 0, 1, 0.2196078, 1,
-0.3173397, -0.5857913, -3.553083, 0, 1, 0.227451, 1,
-0.312617, -0.3536061, -1.655494, 0, 1, 0.2313726, 1,
-0.3116261, 0.3606623, 0.5993862, 0, 1, 0.2392157, 1,
-0.3093071, -0.005507471, -1.206323, 0, 1, 0.2431373, 1,
-0.3071074, -1.648791, -3.42057, 0, 1, 0.2509804, 1,
-0.3050593, 0.2233782, -0.8413852, 0, 1, 0.254902, 1,
-0.3045926, 0.9144233, -1.373701, 0, 1, 0.2627451, 1,
-0.3011087, -0.3143146, -3.590005, 0, 1, 0.2666667, 1,
-0.2993982, 1.658817, 0.3869614, 0, 1, 0.2745098, 1,
-0.2949722, 0.6227776, 0.1634655, 0, 1, 0.2784314, 1,
-0.2915255, 2.629889, -0.05613488, 0, 1, 0.2862745, 1,
-0.2908891, 1.697243, -1.812582, 0, 1, 0.2901961, 1,
-0.2908748, 0.5215741, 0.8807719, 0, 1, 0.2980392, 1,
-0.2896217, 0.9647701, -0.4362307, 0, 1, 0.3058824, 1,
-0.2812885, -0.2107581, -2.185687, 0, 1, 0.3098039, 1,
-0.2769578, 0.2150463, 0.5372629, 0, 1, 0.3176471, 1,
-0.2730219, 0.4120322, -1.581494, 0, 1, 0.3215686, 1,
-0.2634257, -0.9660144, -1.864954, 0, 1, 0.3294118, 1,
-0.2558723, -0.2306409, -1.592088, 0, 1, 0.3333333, 1,
-0.2544947, 0.008367443, -2.516443, 0, 1, 0.3411765, 1,
-0.2530648, -0.3365862, -2.377079, 0, 1, 0.345098, 1,
-0.2525063, 2.034067, 0.2639983, 0, 1, 0.3529412, 1,
-0.2500562, -1.363619, -2.508937, 0, 1, 0.3568628, 1,
-0.247086, 1.341561, -1.139204, 0, 1, 0.3647059, 1,
-0.2459745, 2.437367, 1.332017, 0, 1, 0.3686275, 1,
-0.2448317, 1.160163, 1.56006, 0, 1, 0.3764706, 1,
-0.2443201, 0.7943915, -0.5967189, 0, 1, 0.3803922, 1,
-0.2360073, 0.337392, 0.2881735, 0, 1, 0.3882353, 1,
-0.2304106, -0.1566244, -0.9661747, 0, 1, 0.3921569, 1,
-0.2200657, 0.9239062, 1.340585, 0, 1, 0.4, 1,
-0.2178803, 1.131947, 0.1364299, 0, 1, 0.4078431, 1,
-0.2134139, 0.7972446, 0.3479943, 0, 1, 0.4117647, 1,
-0.2124175, -0.2785428, -2.273282, 0, 1, 0.4196078, 1,
-0.2095714, 1.876935, -0.8462262, 0, 1, 0.4235294, 1,
-0.2087378, -0.8211085, -4.307365, 0, 1, 0.4313726, 1,
-0.2076932, 1.464485, -0.456936, 0, 1, 0.4352941, 1,
-0.2068487, -1.020119, -2.309387, 0, 1, 0.4431373, 1,
-0.2051559, 1.507196, -1.095886, 0, 1, 0.4470588, 1,
-0.1979186, 0.626709, -1.164628, 0, 1, 0.454902, 1,
-0.192559, 0.9945665, 0.6502767, 0, 1, 0.4588235, 1,
-0.1876524, 0.1901053, 0.1915927, 0, 1, 0.4666667, 1,
-0.1857246, 1.238576, 0.3835542, 0, 1, 0.4705882, 1,
-0.1830544, -0.3230945, -3.900974, 0, 1, 0.4784314, 1,
-0.1811517, -0.208714, -1.999877, 0, 1, 0.4823529, 1,
-0.1804721, 1.380269, -1.499882, 0, 1, 0.4901961, 1,
-0.177483, -0.8860667, -1.661742, 0, 1, 0.4941176, 1,
-0.1765322, 0.3987708, 0.1400105, 0, 1, 0.5019608, 1,
-0.176201, -0.1813427, -3.770448, 0, 1, 0.509804, 1,
-0.171279, -0.6064391, -2.815331, 0, 1, 0.5137255, 1,
-0.1700454, 0.918286, -1.728042, 0, 1, 0.5215687, 1,
-0.1699751, 0.799758, -2.183214, 0, 1, 0.5254902, 1,
-0.1690255, -1.00064, -2.765657, 0, 1, 0.5333334, 1,
-0.1681649, -0.6215796, -4.148478, 0, 1, 0.5372549, 1,
-0.1670436, -1.523158, -2.918325, 0, 1, 0.5450981, 1,
-0.1629625, -1.01503, -3.365367, 0, 1, 0.5490196, 1,
-0.1612568, -0.8462168, -5.323989, 0, 1, 0.5568628, 1,
-0.1555134, -0.4665249, -1.332327, 0, 1, 0.5607843, 1,
-0.1539187, -0.2415071, -3.547418, 0, 1, 0.5686275, 1,
-0.1522723, -0.5749153, -2.100355, 0, 1, 0.572549, 1,
-0.1510358, -0.8368624, -3.042106, 0, 1, 0.5803922, 1,
-0.1509221, 0.6901158, 1.900136, 0, 1, 0.5843138, 1,
-0.149736, -0.1836971, -2.938881, 0, 1, 0.5921569, 1,
-0.1492148, -0.5431595, -2.54634, 0, 1, 0.5960785, 1,
-0.148768, -2.430293, -2.275977, 0, 1, 0.6039216, 1,
-0.1466118, 1.387312, 0.3906815, 0, 1, 0.6117647, 1,
-0.1441722, 0.6499862, -0.1177574, 0, 1, 0.6156863, 1,
-0.1435852, 2.476593, -1.014247, 0, 1, 0.6235294, 1,
-0.1427393, 0.6597712, 1.556002, 0, 1, 0.627451, 1,
-0.1419638, 0.7473257, -1.320153, 0, 1, 0.6352941, 1,
-0.1384502, 0.3875629, 0.1590523, 0, 1, 0.6392157, 1,
-0.1375522, 1.664244, -0.9211433, 0, 1, 0.6470588, 1,
-0.1338215, 1.200647, -1.51273, 0, 1, 0.6509804, 1,
-0.1332941, -1.371161, -2.814235, 0, 1, 0.6588235, 1,
-0.1332932, -0.3403417, -3.296537, 0, 1, 0.6627451, 1,
-0.1306155, -0.5735696, -3.31713, 0, 1, 0.6705883, 1,
-0.1289553, 1.587737, -0.9677275, 0, 1, 0.6745098, 1,
-0.1273024, 0.5599325, 0.2763005, 0, 1, 0.682353, 1,
-0.122256, -1.427585, -2.351016, 0, 1, 0.6862745, 1,
-0.1212358, 0.3297359, -0.0006607799, 0, 1, 0.6941177, 1,
-0.1211226, 0.2650656, -0.4763289, 0, 1, 0.7019608, 1,
-0.1193475, 0.3205747, -1.307215, 0, 1, 0.7058824, 1,
-0.1178065, -0.473867, -3.277733, 0, 1, 0.7137255, 1,
-0.1173043, -1.862836, -4.054459, 0, 1, 0.7176471, 1,
-0.1155921, -1.166856, -3.78527, 0, 1, 0.7254902, 1,
-0.1127368, 0.1569476, -0.967197, 0, 1, 0.7294118, 1,
-0.1100143, -0.05372088, -2.104264, 0, 1, 0.7372549, 1,
-0.108001, 1.454813, -0.8960793, 0, 1, 0.7411765, 1,
-0.1031753, -1.530401, -2.059013, 0, 1, 0.7490196, 1,
-0.1018479, -0.5028287, -5.0058, 0, 1, 0.7529412, 1,
-0.100733, -0.7438002, -3.587876, 0, 1, 0.7607843, 1,
-0.1001905, 0.07550352, -2.954399, 0, 1, 0.7647059, 1,
-0.09857894, -1.359364, -1.997835, 0, 1, 0.772549, 1,
-0.09339584, -0.393215, -3.923419, 0, 1, 0.7764706, 1,
-0.09323695, 0.2803595, -1.570012, 0, 1, 0.7843137, 1,
-0.09211724, 2.228073, 0.9834335, 0, 1, 0.7882353, 1,
-0.08726731, -0.4174835, -3.216543, 0, 1, 0.7960784, 1,
-0.08724942, 0.6119608, 0.0357695, 0, 1, 0.8039216, 1,
-0.08704733, 0.5050588, -1.080017, 0, 1, 0.8078431, 1,
-0.0812627, 0.1704284, -1.876963, 0, 1, 0.8156863, 1,
-0.078206, -0.8848571, -2.655973, 0, 1, 0.8196079, 1,
-0.07404707, 1.384016, 1.790408, 0, 1, 0.827451, 1,
-0.0734499, 0.6614613, -0.6832246, 0, 1, 0.8313726, 1,
-0.07036952, 0.3161504, 1.195925, 0, 1, 0.8392157, 1,
-0.06397811, -1.410671, -1.645321, 0, 1, 0.8431373, 1,
-0.06285537, 1.312415, 1.031931, 0, 1, 0.8509804, 1,
-0.05861884, -0.1650869, -4.211123, 0, 1, 0.854902, 1,
-0.05631939, 2.865082, 0.5964713, 0, 1, 0.8627451, 1,
-0.04990391, -0.3838018, -3.264403, 0, 1, 0.8666667, 1,
-0.04906942, -0.1190776, -0.8450158, 0, 1, 0.8745098, 1,
-0.0417842, -0.3067548, -2.445973, 0, 1, 0.8784314, 1,
-0.04174072, 1.291459, -2.341197, 0, 1, 0.8862745, 1,
-0.03814859, 0.4631835, 1.347379, 0, 1, 0.8901961, 1,
-0.03491735, 0.5660908, 1.046026, 0, 1, 0.8980392, 1,
-0.03151224, -0.008090784, -3.334101, 0, 1, 0.9058824, 1,
-0.0285034, -0.8311549, -4.223747, 0, 1, 0.9098039, 1,
-0.02810043, -0.653844, -2.499571, 0, 1, 0.9176471, 1,
-0.02798527, -2.333858, -1.826092, 0, 1, 0.9215686, 1,
-0.02599474, -0.1487178, -3.857816, 0, 1, 0.9294118, 1,
-0.0218804, 0.5720307, -1.18978, 0, 1, 0.9333333, 1,
-0.0188163, 0.405567, -0.2905668, 0, 1, 0.9411765, 1,
-0.01782721, 1.273713, 0.8981034, 0, 1, 0.945098, 1,
-0.0171516, 0.3174384, 1.370164, 0, 1, 0.9529412, 1,
-0.01643798, -1.06931, -5.549084, 0, 1, 0.9568627, 1,
-0.01101701, 1.547733, 0.4472443, 0, 1, 0.9647059, 1,
-0.001321468, 0.3881739, 0.4173422, 0, 1, 0.9686275, 1,
-0.0005419479, -0.9424424, -2.880388, 0, 1, 0.9764706, 1,
0.0008687919, 1.485224, -0.4802697, 0, 1, 0.9803922, 1,
0.00156088, -0.7233911, 2.827477, 0, 1, 0.9882353, 1,
0.004012865, -0.7708741, 2.950361, 0, 1, 0.9921569, 1,
0.006024074, -1.698965, 2.194238, 0, 1, 1, 1,
0.01006494, -0.766377, 2.953568, 0, 0.9921569, 1, 1,
0.0103157, -0.5316886, 2.707253, 0, 0.9882353, 1, 1,
0.01330007, 1.526943, 0.959332, 0, 0.9803922, 1, 1,
0.01558591, -0.08562019, 2.625324, 0, 0.9764706, 1, 1,
0.02400686, 0.768616, -0.3161035, 0, 0.9686275, 1, 1,
0.0291109, 1.135159, 0.1672881, 0, 0.9647059, 1, 1,
0.0305278, -0.09147418, 3.097827, 0, 0.9568627, 1, 1,
0.03214998, 0.7895086, -0.3066675, 0, 0.9529412, 1, 1,
0.03620314, -0.2774652, 3.879301, 0, 0.945098, 1, 1,
0.03785085, 1.106989, -0.6301126, 0, 0.9411765, 1, 1,
0.0385521, -1.416157, 4.837593, 0, 0.9333333, 1, 1,
0.0391412, -0.6117045, 3.290616, 0, 0.9294118, 1, 1,
0.0434505, -1.498619, 4.10889, 0, 0.9215686, 1, 1,
0.04404019, 0.7804875, -1.679868, 0, 0.9176471, 1, 1,
0.0450373, -0.3037503, 2.535793, 0, 0.9098039, 1, 1,
0.04615028, -1.421888, 3.978647, 0, 0.9058824, 1, 1,
0.05724867, -0.4382918, 2.447316, 0, 0.8980392, 1, 1,
0.05925044, -1.044316, 4.517276, 0, 0.8901961, 1, 1,
0.06006087, -0.9132142, 3.968723, 0, 0.8862745, 1, 1,
0.06121873, -0.2068864, 1.927617, 0, 0.8784314, 1, 1,
0.06238745, 1.21605, -1.060871, 0, 0.8745098, 1, 1,
0.06401727, 1.425878, 0.2923049, 0, 0.8666667, 1, 1,
0.07130803, -1.893162, 2.567671, 0, 0.8627451, 1, 1,
0.07549024, 0.1929924, -0.4740315, 0, 0.854902, 1, 1,
0.07595024, 0.7111127, -0.6616336, 0, 0.8509804, 1, 1,
0.07987273, 1.723369, -0.07789075, 0, 0.8431373, 1, 1,
0.08401244, -1.723997, 3.129478, 0, 0.8392157, 1, 1,
0.0860264, -1.119174, 0.6804125, 0, 0.8313726, 1, 1,
0.09049556, 0.3564202, 0.8280056, 0, 0.827451, 1, 1,
0.0952201, -1.162011, 0.8738198, 0, 0.8196079, 1, 1,
0.09826954, -1.266836, 4.261759, 0, 0.8156863, 1, 1,
0.09858259, -0.4862222, 1.101884, 0, 0.8078431, 1, 1,
0.1005653, 0.5164177, -1.158672, 0, 0.8039216, 1, 1,
0.1032702, 0.2430442, -0.2547688, 0, 0.7960784, 1, 1,
0.1062223, -1.584763, 2.679037, 0, 0.7882353, 1, 1,
0.1097915, 0.6950711, -0.02927009, 0, 0.7843137, 1, 1,
0.1105312, 0.6771748, 0.6075349, 0, 0.7764706, 1, 1,
0.1111218, 0.9191169, -2.359228, 0, 0.772549, 1, 1,
0.1191913, 0.2902743, 0.8090066, 0, 0.7647059, 1, 1,
0.1219017, -0.04784056, 1.260493, 0, 0.7607843, 1, 1,
0.1223519, -0.007834219, 3.437706, 0, 0.7529412, 1, 1,
0.1225776, -1.8095, 2.541336, 0, 0.7490196, 1, 1,
0.1246689, -0.2188897, 2.266448, 0, 0.7411765, 1, 1,
0.1281556, 0.06396247, 0.4975403, 0, 0.7372549, 1, 1,
0.1319986, -0.5943922, 4.439005, 0, 0.7294118, 1, 1,
0.1371652, 0.5485702, -0.5566862, 0, 0.7254902, 1, 1,
0.1389766, 0.973035, 1.003347, 0, 0.7176471, 1, 1,
0.1477879, -1.232314, 3.180646, 0, 0.7137255, 1, 1,
0.1493359, -0.4388463, 0.411485, 0, 0.7058824, 1, 1,
0.1502796, -0.3677768, 1.841787, 0, 0.6980392, 1, 1,
0.151494, -2.407605, 4.661938, 0, 0.6941177, 1, 1,
0.1550046, -0.6945591, 3.335609, 0, 0.6862745, 1, 1,
0.1552692, 1.162554, 0.1672544, 0, 0.682353, 1, 1,
0.1613442, -0.6174998, 2.562562, 0, 0.6745098, 1, 1,
0.161533, 1.802706, -1.906085, 0, 0.6705883, 1, 1,
0.1619592, 2.34341, -0.9451171, 0, 0.6627451, 1, 1,
0.1637597, -1.515388, 2.665824, 0, 0.6588235, 1, 1,
0.165056, -0.7455154, 3.526628, 0, 0.6509804, 1, 1,
0.1661315, 1.252538, -1.391902, 0, 0.6470588, 1, 1,
0.1789535, 0.9064826, 0.09633068, 0, 0.6392157, 1, 1,
0.1801576, 0.2559656, 0.1992747, 0, 0.6352941, 1, 1,
0.1816473, -0.4970757, 2.901079, 0, 0.627451, 1, 1,
0.1867815, 0.5415511, 0.2628669, 0, 0.6235294, 1, 1,
0.1869169, 1.020571, 0.1194748, 0, 0.6156863, 1, 1,
0.1870531, 0.9891039, 1.294894, 0, 0.6117647, 1, 1,
0.1891141, 1.001055, -1.576847, 0, 0.6039216, 1, 1,
0.1999535, -0.8025216, 2.29164, 0, 0.5960785, 1, 1,
0.2005408, -0.4781948, 1.802054, 0, 0.5921569, 1, 1,
0.2011314, 1.025945, 0.9307334, 0, 0.5843138, 1, 1,
0.2025908, -0.02968614, 0.5595027, 0, 0.5803922, 1, 1,
0.2031721, -0.1933919, 1.409826, 0, 0.572549, 1, 1,
0.2057269, 0.2541215, -0.8793344, 0, 0.5686275, 1, 1,
0.2071159, 2.253948, 0.2466987, 0, 0.5607843, 1, 1,
0.2079955, 0.7173072, -0.2606828, 0, 0.5568628, 1, 1,
0.2158105, -0.5727686, 2.990489, 0, 0.5490196, 1, 1,
0.2203218, 0.2171983, 0.8461575, 0, 0.5450981, 1, 1,
0.2210793, 1.158432, 1.456408, 0, 0.5372549, 1, 1,
0.2228102, 0.1155852, 1.448905, 0, 0.5333334, 1, 1,
0.2231856, -0.5797384, 3.793531, 0, 0.5254902, 1, 1,
0.2321514, -1.078582, 3.183363, 0, 0.5215687, 1, 1,
0.2333339, 1.586929, -1.497438, 0, 0.5137255, 1, 1,
0.2333554, -0.4164096, 2.751814, 0, 0.509804, 1, 1,
0.2419653, -1.706324, 2.684922, 0, 0.5019608, 1, 1,
0.2435693, 1.958513, 0.6890727, 0, 0.4941176, 1, 1,
0.2464178, -0.1310575, 1.599423, 0, 0.4901961, 1, 1,
0.2472804, -0.9842662, 2.197051, 0, 0.4823529, 1, 1,
0.2487777, 0.658738, 1.576671, 0, 0.4784314, 1, 1,
0.2491481, 0.5097269, 0.4330495, 0, 0.4705882, 1, 1,
0.2529373, -1.182296, 3.10654, 0, 0.4666667, 1, 1,
0.2539928, 0.2995509, 0.3916162, 0, 0.4588235, 1, 1,
0.2611777, -1.559245, 2.970858, 0, 0.454902, 1, 1,
0.2619218, 0.5542793, 0.9579206, 0, 0.4470588, 1, 1,
0.2634886, -1.008962, 3.746125, 0, 0.4431373, 1, 1,
0.2641129, -0.4399301, 2.243365, 0, 0.4352941, 1, 1,
0.2743202, -0.005555733, -1.25638, 0, 0.4313726, 1, 1,
0.2778777, 0.8270236, -0.3713196, 0, 0.4235294, 1, 1,
0.2780541, -0.1466845, 0.8935331, 0, 0.4196078, 1, 1,
0.2809818, -0.6536098, 4.611354, 0, 0.4117647, 1, 1,
0.2819093, 1.161452, -0.8697341, 0, 0.4078431, 1, 1,
0.2844034, 0.2808771, 0.5076713, 0, 0.4, 1, 1,
0.2861611, 2.206592, -0.8027996, 0, 0.3921569, 1, 1,
0.2877226, 0.5246673, 1.312345, 0, 0.3882353, 1, 1,
0.2903694, 1.704249, 0.1446589, 0, 0.3803922, 1, 1,
0.2957169, 0.1014168, 1.595742, 0, 0.3764706, 1, 1,
0.2958663, 0.6277812, 0.699169, 0, 0.3686275, 1, 1,
0.2967376, -0.3764384, 1.723335, 0, 0.3647059, 1, 1,
0.2977248, 0.8628302, 0.2131005, 0, 0.3568628, 1, 1,
0.3020809, -0.02832917, 2.303204, 0, 0.3529412, 1, 1,
0.3032086, -2.121529, 3.841269, 0, 0.345098, 1, 1,
0.3041668, -1.225525, 1.309516, 0, 0.3411765, 1, 1,
0.3047918, 0.07152236, 2.035778, 0, 0.3333333, 1, 1,
0.3112259, 1.478855, 0.6703911, 0, 0.3294118, 1, 1,
0.3137292, 0.2816437, 1.440139, 0, 0.3215686, 1, 1,
0.3143707, -1.394979, 2.683084, 0, 0.3176471, 1, 1,
0.3191752, -0.1380001, 0.1100283, 0, 0.3098039, 1, 1,
0.3192638, 0.9483187, 0.2073137, 0, 0.3058824, 1, 1,
0.3259138, 0.8537893, 1.347288, 0, 0.2980392, 1, 1,
0.3266761, 0.4176894, 2.972446, 0, 0.2901961, 1, 1,
0.327915, -0.4137317, 3.998946, 0, 0.2862745, 1, 1,
0.328714, 0.4155256, 1.767245, 0, 0.2784314, 1, 1,
0.335228, 0.04674453, 1.74511, 0, 0.2745098, 1, 1,
0.3354374, 1.180531, 1.644321, 0, 0.2666667, 1, 1,
0.3373046, 1.006659, 0.06914895, 0, 0.2627451, 1, 1,
0.3410652, -0.8961377, 3.529646, 0, 0.254902, 1, 1,
0.3414405, 2.093473, -0.2276714, 0, 0.2509804, 1, 1,
0.3472208, 0.4059992, 1.114325, 0, 0.2431373, 1, 1,
0.3480664, -0.4100431, 3.988419, 0, 0.2392157, 1, 1,
0.3523529, 0.6672511, 0.866836, 0, 0.2313726, 1, 1,
0.3545617, -0.2360883, -2.232063, 0, 0.227451, 1, 1,
0.3579148, -2.937026, 3.215624, 0, 0.2196078, 1, 1,
0.3621393, 1.353599, -0.5764619, 0, 0.2156863, 1, 1,
0.3623441, -0.4976563, 3.128778, 0, 0.2078431, 1, 1,
0.3636238, -1.170401, 2.081488, 0, 0.2039216, 1, 1,
0.3701421, -0.1144061, 1.42845, 0, 0.1960784, 1, 1,
0.3741107, 0.4945525, 0.3749914, 0, 0.1882353, 1, 1,
0.3760054, -0.2487535, 1.022385, 0, 0.1843137, 1, 1,
0.3799034, 1.106037, -0.1619919, 0, 0.1764706, 1, 1,
0.3800082, 0.4727803, 0.4057169, 0, 0.172549, 1, 1,
0.3906267, -1.213175, 2.873969, 0, 0.1647059, 1, 1,
0.3916785, -0.2228381, 3.790468, 0, 0.1607843, 1, 1,
0.3922452, -0.0481995, 3.240116, 0, 0.1529412, 1, 1,
0.3939, 1.758873, -0.7130842, 0, 0.1490196, 1, 1,
0.3963005, -0.3585191, 1.108727, 0, 0.1411765, 1, 1,
0.3966398, 1.701907, -0.3424207, 0, 0.1372549, 1, 1,
0.3975207, -0.172235, 1.757795, 0, 0.1294118, 1, 1,
0.3986967, 0.7731371, -1.510185, 0, 0.1254902, 1, 1,
0.408203, -0.15357, 2.20212, 0, 0.1176471, 1, 1,
0.4093868, 0.9547954, 1.377054, 0, 0.1137255, 1, 1,
0.4096246, 1.722787, -0.7220357, 0, 0.1058824, 1, 1,
0.4099197, -1.425713, 2.644828, 0, 0.09803922, 1, 1,
0.4142932, 1.012824, 1.893929, 0, 0.09411765, 1, 1,
0.4168158, -0.8451624, 3.94766, 0, 0.08627451, 1, 1,
0.4168659, -0.2481225, 0.6171605, 0, 0.08235294, 1, 1,
0.4168849, 0.2026135, 0.3546241, 0, 0.07450981, 1, 1,
0.4175545, -0.100096, 1.040012, 0, 0.07058824, 1, 1,
0.4178429, -0.4240737, 1.34034, 0, 0.0627451, 1, 1,
0.4269504, -0.300473, 2.412289, 0, 0.05882353, 1, 1,
0.4290405, 0.694965, 0.641376, 0, 0.05098039, 1, 1,
0.4310071, -0.1778221, 1.750325, 0, 0.04705882, 1, 1,
0.4326852, -0.385805, 2.269547, 0, 0.03921569, 1, 1,
0.4345452, -1.948663, 1.491302, 0, 0.03529412, 1, 1,
0.4346595, 0.9536431, 0.6469847, 0, 0.02745098, 1, 1,
0.4370071, 0.3614651, 1.91689, 0, 0.02352941, 1, 1,
0.4406423, -0.4983182, 1.223017, 0, 0.01568628, 1, 1,
0.4407863, -0.5088193, 3.219717, 0, 0.01176471, 1, 1,
0.4420534, 0.534086, -0.9680405, 0, 0.003921569, 1, 1,
0.4427091, -1.277869, 3.267101, 0.003921569, 0, 1, 1,
0.448395, -0.71798, 2.768374, 0.007843138, 0, 1, 1,
0.4507812, 0.7174129, 0.1355444, 0.01568628, 0, 1, 1,
0.4525957, 1.10731, -0.07942773, 0.01960784, 0, 1, 1,
0.4572213, 0.4329704, 0.9242895, 0.02745098, 0, 1, 1,
0.457302, -1.348906, 2.331123, 0.03137255, 0, 1, 1,
0.4644154, 0.4801613, 1.769301, 0.03921569, 0, 1, 1,
0.4651914, 0.1552959, 1.266384, 0.04313726, 0, 1, 1,
0.4662237, -0.4340159, 2.17555, 0.05098039, 0, 1, 1,
0.469047, 0.8412749, -1.2465, 0.05490196, 0, 1, 1,
0.4694936, -0.03970574, 0.9580703, 0.0627451, 0, 1, 1,
0.46991, -0.3281918, 0.4633504, 0.06666667, 0, 1, 1,
0.4702775, -1.50627, 5.015565, 0.07450981, 0, 1, 1,
0.4710444, 1.311523, 1.086026, 0.07843138, 0, 1, 1,
0.4714135, 0.6173821, 1.564056, 0.08627451, 0, 1, 1,
0.4722882, 0.5262877, 0.4029727, 0.09019608, 0, 1, 1,
0.472627, -0.9361928, 3.163705, 0.09803922, 0, 1, 1,
0.4825632, 2.959196, 1.179825, 0.1058824, 0, 1, 1,
0.4884752, 0.9566176, 0.2548581, 0.1098039, 0, 1, 1,
0.4911332, -1.874424, 1.353217, 0.1176471, 0, 1, 1,
0.4924678, -0.6102172, 3.04124, 0.1215686, 0, 1, 1,
0.4949465, 0.8088003, 0.358226, 0.1294118, 0, 1, 1,
0.4954657, 1.485072, 0.03683478, 0.1333333, 0, 1, 1,
0.4956819, 0.5132231, 0.3800951, 0.1411765, 0, 1, 1,
0.4967279, -0.6766817, 0.6879461, 0.145098, 0, 1, 1,
0.4969037, 1.138726, -0.1446071, 0.1529412, 0, 1, 1,
0.4974496, -1.219147, 2.403153, 0.1568628, 0, 1, 1,
0.5000917, 0.9105282, 1.126988, 0.1647059, 0, 1, 1,
0.5025735, -0.4849441, 0.7381554, 0.1686275, 0, 1, 1,
0.5062199, 0.9328983, -1.049984, 0.1764706, 0, 1, 1,
0.5117033, -1.119099, 2.663287, 0.1803922, 0, 1, 1,
0.5121093, -0.6606644, 2.459034, 0.1882353, 0, 1, 1,
0.5182062, 2.661886, 0.9771257, 0.1921569, 0, 1, 1,
0.5182499, 0.3274014, 0.6383048, 0.2, 0, 1, 1,
0.5183481, -1.560613, 2.865526, 0.2078431, 0, 1, 1,
0.5197188, -1.188697, 2.725368, 0.2117647, 0, 1, 1,
0.5228145, -0.03877256, 0.7076381, 0.2196078, 0, 1, 1,
0.5241283, 1.132152, 0.9339519, 0.2235294, 0, 1, 1,
0.5253474, -1.46652, 4.124031, 0.2313726, 0, 1, 1,
0.5274364, 0.6176736, 0.4254215, 0.2352941, 0, 1, 1,
0.5280682, -0.6828938, 1.540767, 0.2431373, 0, 1, 1,
0.5311095, -0.2202584, 1.791827, 0.2470588, 0, 1, 1,
0.5322994, 0.9753975, 0.03998267, 0.254902, 0, 1, 1,
0.535551, 0.6570529, -1.188816, 0.2588235, 0, 1, 1,
0.5398798, 0.6949341, 0.6157014, 0.2666667, 0, 1, 1,
0.5458995, 0.0862108, 1.799993, 0.2705882, 0, 1, 1,
0.5487907, -0.3690429, 1.874364, 0.2784314, 0, 1, 1,
0.5538006, 0.8063833, 0.2964834, 0.282353, 0, 1, 1,
0.5583199, 0.3589615, 0.9531912, 0.2901961, 0, 1, 1,
0.563161, 0.4106314, 0.6697918, 0.2941177, 0, 1, 1,
0.5665882, -1.502148, 0.6797396, 0.3019608, 0, 1, 1,
0.5673775, 0.1597674, 0.9771898, 0.3098039, 0, 1, 1,
0.5686058, -0.9794342, 1.548489, 0.3137255, 0, 1, 1,
0.5704433, 0.7125246, 0.669058, 0.3215686, 0, 1, 1,
0.5733879, -1.215135, 1.512815, 0.3254902, 0, 1, 1,
0.577667, -0.4801858, 1.391818, 0.3333333, 0, 1, 1,
0.5866441, -0.9461146, 2.804582, 0.3372549, 0, 1, 1,
0.5903335, -1.12788, 3.739636, 0.345098, 0, 1, 1,
0.593488, 1.244862, 1.271229, 0.3490196, 0, 1, 1,
0.5968942, 0.5790343, -0.1852224, 0.3568628, 0, 1, 1,
0.5972558, 1.724916, 1.752055, 0.3607843, 0, 1, 1,
0.5976174, 0.5391204, 1.610931, 0.3686275, 0, 1, 1,
0.6011679, -1.66187, 1.785034, 0.372549, 0, 1, 1,
0.6017336, 0.7494274, 1.860013, 0.3803922, 0, 1, 1,
0.6052613, -0.3733708, 0.5006394, 0.3843137, 0, 1, 1,
0.6073474, 0.2810491, 0.003104199, 0.3921569, 0, 1, 1,
0.6102527, 2.233027, 1.19619, 0.3960784, 0, 1, 1,
0.6139576, 0.3878926, 2.255365, 0.4039216, 0, 1, 1,
0.614657, -0.1248477, 1.004671, 0.4117647, 0, 1, 1,
0.6156422, 2.649101, 0.02988748, 0.4156863, 0, 1, 1,
0.6157939, -1.138123, 2.99926, 0.4235294, 0, 1, 1,
0.6174794, 1.405105, -0.984846, 0.427451, 0, 1, 1,
0.6204765, -0.05719073, 2.073875, 0.4352941, 0, 1, 1,
0.6213495, 0.2176346, 0.8486815, 0.4392157, 0, 1, 1,
0.6224753, 0.3445641, 0.9406278, 0.4470588, 0, 1, 1,
0.6224988, 0.4870613, 0.47536, 0.4509804, 0, 1, 1,
0.6227561, 1.237964, 0.3195725, 0.4588235, 0, 1, 1,
0.6236399, 1.691526, 0.6914215, 0.4627451, 0, 1, 1,
0.6308548, 1.168033, -1.136677, 0.4705882, 0, 1, 1,
0.6360018, 1.054795, 0.5224916, 0.4745098, 0, 1, 1,
0.6401159, -1.395056, 0.6738281, 0.4823529, 0, 1, 1,
0.6462463, 1.029115, 2.344385, 0.4862745, 0, 1, 1,
0.6518439, -0.7754508, 2.182356, 0.4941176, 0, 1, 1,
0.6610202, -0.8065423, 1.308519, 0.5019608, 0, 1, 1,
0.6636001, -0.4004724, 2.069094, 0.5058824, 0, 1, 1,
0.6675452, 2.205826, 0.1071659, 0.5137255, 0, 1, 1,
0.6706301, 0.05091994, 0.8181725, 0.5176471, 0, 1, 1,
0.6724023, -0.7090209, 3.396007, 0.5254902, 0, 1, 1,
0.6737123, 1.304239, 0.5224789, 0.5294118, 0, 1, 1,
0.6793306, -0.7074658, 4.688178, 0.5372549, 0, 1, 1,
0.6799574, -1.925069, 1.901571, 0.5411765, 0, 1, 1,
0.6841138, 0.3692149, 1.396472, 0.5490196, 0, 1, 1,
0.6934744, -1.099409, 1.096778, 0.5529412, 0, 1, 1,
0.6976816, -0.8468108, 2.617156, 0.5607843, 0, 1, 1,
0.698123, 1.12301, 0.2719549, 0.5647059, 0, 1, 1,
0.7029651, 0.2172393, 2.009392, 0.572549, 0, 1, 1,
0.7045937, -1.04473, 2.530388, 0.5764706, 0, 1, 1,
0.7129632, 1.770531, -0.5472269, 0.5843138, 0, 1, 1,
0.727258, 1.559917, -0.8400715, 0.5882353, 0, 1, 1,
0.7278154, -1.656963, 1.559894, 0.5960785, 0, 1, 1,
0.7319946, -0.1683837, 1.519409, 0.6039216, 0, 1, 1,
0.7343137, -0.7826933, 2.26984, 0.6078432, 0, 1, 1,
0.7384593, 0.595429, -0.9323273, 0.6156863, 0, 1, 1,
0.7408887, -0.805028, 3.337742, 0.6196079, 0, 1, 1,
0.7416614, -1.080786, 3.823972, 0.627451, 0, 1, 1,
0.7458942, -2.522228, 3.282747, 0.6313726, 0, 1, 1,
0.7459717, 1.283847, 0.2699403, 0.6392157, 0, 1, 1,
0.7503343, 0.3194867, -0.1173819, 0.6431373, 0, 1, 1,
0.7516417, -0.268021, 1.596049, 0.6509804, 0, 1, 1,
0.7519984, 1.553289, 1.101454, 0.654902, 0, 1, 1,
0.7566826, 0.05298657, 2.597053, 0.6627451, 0, 1, 1,
0.7596916, 1.010146, 2.134349, 0.6666667, 0, 1, 1,
0.7747701, -0.5638506, 3.803306, 0.6745098, 0, 1, 1,
0.778536, 2.016224, -0.5792727, 0.6784314, 0, 1, 1,
0.787513, 0.9025099, 1.315971, 0.6862745, 0, 1, 1,
0.7981122, -0.17523, 0.6979198, 0.6901961, 0, 1, 1,
0.8057454, -0.7218493, 2.579266, 0.6980392, 0, 1, 1,
0.8077072, -1.0913, 1.473307, 0.7058824, 0, 1, 1,
0.8088943, -0.08434968, 0.5421133, 0.7098039, 0, 1, 1,
0.8122498, 0.05433834, 1.259878, 0.7176471, 0, 1, 1,
0.813164, -0.6212064, 3.339112, 0.7215686, 0, 1, 1,
0.8144743, 1.801635, 0.9262074, 0.7294118, 0, 1, 1,
0.8176758, -2.122294, 3.087616, 0.7333333, 0, 1, 1,
0.8185003, -0.2458487, 0.7835183, 0.7411765, 0, 1, 1,
0.8188134, -0.1651622, -0.008259654, 0.7450981, 0, 1, 1,
0.8193917, 0.5699368, 0.4299382, 0.7529412, 0, 1, 1,
0.8229049, -0.1480157, 3.087633, 0.7568628, 0, 1, 1,
0.8287911, -1.61883, 4.03053, 0.7647059, 0, 1, 1,
0.8288457, -2.281185, 2.995319, 0.7686275, 0, 1, 1,
0.8351938, 0.8679693, 0.329349, 0.7764706, 0, 1, 1,
0.8383869, 1.168854, 1.714308, 0.7803922, 0, 1, 1,
0.8390538, -0.7576129, -0.1922653, 0.7882353, 0, 1, 1,
0.8412357, 0.5535991, 2.378525, 0.7921569, 0, 1, 1,
0.8428253, -0.09910831, 1.025037, 0.8, 0, 1, 1,
0.8515813, -0.5150529, 3.086398, 0.8078431, 0, 1, 1,
0.8590912, 1.13988, 0.5484158, 0.8117647, 0, 1, 1,
0.8608837, -0.1947212, 1.092761, 0.8196079, 0, 1, 1,
0.8616599, 0.2043166, 2.241874, 0.8235294, 0, 1, 1,
0.8668665, -1.211747, 1.935407, 0.8313726, 0, 1, 1,
0.8735074, -1.000114, 1.564541, 0.8352941, 0, 1, 1,
0.8819417, -0.6040912, 3.032081, 0.8431373, 0, 1, 1,
0.8856, -0.481969, 2.763182, 0.8470588, 0, 1, 1,
0.8898127, 0.7486636, -0.06814094, 0.854902, 0, 1, 1,
0.8996181, 1.947099, 1.074669, 0.8588235, 0, 1, 1,
0.9003495, -0.9832253, 2.302029, 0.8666667, 0, 1, 1,
0.9011084, -1.987101, 1.427308, 0.8705882, 0, 1, 1,
0.9023341, 0.2092765, 0.5172966, 0.8784314, 0, 1, 1,
0.904977, -1.842306, 2.883176, 0.8823529, 0, 1, 1,
0.9074023, -0.3316093, 2.922321, 0.8901961, 0, 1, 1,
0.9130213, -0.3705851, 3.127994, 0.8941177, 0, 1, 1,
0.9130535, -2.677599, 3.216819, 0.9019608, 0, 1, 1,
0.9154556, -0.04227186, 0.3354561, 0.9098039, 0, 1, 1,
0.9175547, 2.136177, 0.7266676, 0.9137255, 0, 1, 1,
0.9207697, -0.2834429, 1.223436, 0.9215686, 0, 1, 1,
0.9246958, -0.7341951, 0.7336243, 0.9254902, 0, 1, 1,
0.9297407, -0.8322535, 2.685636, 0.9333333, 0, 1, 1,
0.9311084, 1.55916, -0.5350367, 0.9372549, 0, 1, 1,
0.9371658, 0.3489116, 1.467859, 0.945098, 0, 1, 1,
0.9450137, 0.2847459, 0.6298096, 0.9490196, 0, 1, 1,
0.9493363, -0.6669983, 3.522555, 0.9568627, 0, 1, 1,
0.9523256, 0.4355038, 0.4157296, 0.9607843, 0, 1, 1,
0.9525295, 1.738054, -0.1624116, 0.9686275, 0, 1, 1,
0.9574717, -0.5763416, 2.710947, 0.972549, 0, 1, 1,
0.9576411, 0.4616857, 0.6456735, 0.9803922, 0, 1, 1,
0.9627239, 0.6772757, 2.472929, 0.9843137, 0, 1, 1,
0.9647922, 0.006790642, 1.711647, 0.9921569, 0, 1, 1,
0.9665393, -1.666507, 3.126154, 0.9960784, 0, 1, 1,
0.9709293, 1.376764, -0.9143708, 1, 0, 0.9960784, 1,
0.9743579, 0.9660484, 2.714522, 1, 0, 0.9882353, 1,
0.9743628, -0.04838649, 1.262195, 1, 0, 0.9843137, 1,
0.9800709, -1.378968, 2.126425, 1, 0, 0.9764706, 1,
0.9820924, 2.564057, 0.8157645, 1, 0, 0.972549, 1,
0.9854243, 0.6174335, 1.773507, 1, 0, 0.9647059, 1,
0.994531, 1.796706, 0.108671, 1, 0, 0.9607843, 1,
0.9972941, 0.4931977, 0.7163022, 1, 0, 0.9529412, 1,
0.9981376, -1.330765, 1.555211, 1, 0, 0.9490196, 1,
1.004324, 2.070966, 1.602163, 1, 0, 0.9411765, 1,
1.006383, 0.07206145, 2.165331, 1, 0, 0.9372549, 1,
1.009175, 0.6563565, 2.530172, 1, 0, 0.9294118, 1,
1.030744, -0.2855176, 1.021056, 1, 0, 0.9254902, 1,
1.033648, 0.9402598, -0.2423606, 1, 0, 0.9176471, 1,
1.037969, -1.10111, 2.208962, 1, 0, 0.9137255, 1,
1.038091, 2.190669, -0.03511697, 1, 0, 0.9058824, 1,
1.038955, -0.7266731, 3.34757, 1, 0, 0.9019608, 1,
1.044605, 0.06485584, 2.386431, 1, 0, 0.8941177, 1,
1.059549, -1.411946, 2.172192, 1, 0, 0.8862745, 1,
1.065188, 0.2795035, 2.322203, 1, 0, 0.8823529, 1,
1.065992, 1.019879, 1.250518, 1, 0, 0.8745098, 1,
1.067631, -0.4192573, 2.655367, 1, 0, 0.8705882, 1,
1.071438, -1.404666, 1.855983, 1, 0, 0.8627451, 1,
1.075503, -0.6502793, 2.736633, 1, 0, 0.8588235, 1,
1.075783, 1.055031, 0.3595948, 1, 0, 0.8509804, 1,
1.079033, 1.779088, -2.175652, 1, 0, 0.8470588, 1,
1.080835, -1.006386, 1.809346, 1, 0, 0.8392157, 1,
1.081364, -0.3174898, 3.386159, 1, 0, 0.8352941, 1,
1.092389, -0.3688695, 2.591478, 1, 0, 0.827451, 1,
1.096452, -0.8778743, 3.080662, 1, 0, 0.8235294, 1,
1.097599, -0.9736376, 2.922187, 1, 0, 0.8156863, 1,
1.098485, -2.053369, 2.2491, 1, 0, 0.8117647, 1,
1.102364, 1.480349, 2.669385, 1, 0, 0.8039216, 1,
1.102665, 1.412575, 0.1767751, 1, 0, 0.7960784, 1,
1.115452, -0.5062012, 2.156862, 1, 0, 0.7921569, 1,
1.123708, -0.03442296, 1.097046, 1, 0, 0.7843137, 1,
1.128587, 0.2159153, 0.34639, 1, 0, 0.7803922, 1,
1.140365, 0.4529153, 1.270752, 1, 0, 0.772549, 1,
1.156521, 0.3530865, -0.2797496, 1, 0, 0.7686275, 1,
1.160489, 0.9109742, 1.442652, 1, 0, 0.7607843, 1,
1.174183, -0.8234259, 2.831055, 1, 0, 0.7568628, 1,
1.180993, -0.9757099, 0.7794864, 1, 0, 0.7490196, 1,
1.181293, 0.3808139, 0.8409423, 1, 0, 0.7450981, 1,
1.189634, -1.355951, 2.238238, 1, 0, 0.7372549, 1,
1.190816, 0.7711644, 0.6449625, 1, 0, 0.7333333, 1,
1.193676, -0.6187117, 1.817173, 1, 0, 0.7254902, 1,
1.202383, 0.534611, 2.432688, 1, 0, 0.7215686, 1,
1.20367, -0.1549146, 1.089739, 1, 0, 0.7137255, 1,
1.216825, 0.1625254, 2.017495, 1, 0, 0.7098039, 1,
1.237453, 0.3582183, -0.9592094, 1, 0, 0.7019608, 1,
1.264026, -0.09289094, -0.1631616, 1, 0, 0.6941177, 1,
1.2699, -1.599004, 2.659629, 1, 0, 0.6901961, 1,
1.277001, -0.6267071, 1.749273, 1, 0, 0.682353, 1,
1.283147, -1.091561, -0.9258892, 1, 0, 0.6784314, 1,
1.292247, 1.375753, 1.305203, 1, 0, 0.6705883, 1,
1.293218, 1.542761, -1.018998, 1, 0, 0.6666667, 1,
1.302177, -1.001654, 0.2193603, 1, 0, 0.6588235, 1,
1.303532, -0.1173064, -0.4331988, 1, 0, 0.654902, 1,
1.307899, 1.050943, -0.4607456, 1, 0, 0.6470588, 1,
1.309716, 0.5516176, 0.6313524, 1, 0, 0.6431373, 1,
1.311229, 1.227624, 0.3655602, 1, 0, 0.6352941, 1,
1.315768, 0.2883365, 0.2570645, 1, 0, 0.6313726, 1,
1.325909, 1.00607, 1.170716, 1, 0, 0.6235294, 1,
1.335352, -0.8701813, 2.57209, 1, 0, 0.6196079, 1,
1.341628, 0.1575209, 1.211638, 1, 0, 0.6117647, 1,
1.349465, 1.178032, -0.4371893, 1, 0, 0.6078432, 1,
1.35245, -0.7612927, 2.628738, 1, 0, 0.6, 1,
1.360269, -1.36629, 1.945951, 1, 0, 0.5921569, 1,
1.365882, -2.19102, 1.240374, 1, 0, 0.5882353, 1,
1.371984, 1.572196, 0.937732, 1, 0, 0.5803922, 1,
1.405246, 0.355656, 1.889551, 1, 0, 0.5764706, 1,
1.410829, -0.2907056, 2.591964, 1, 0, 0.5686275, 1,
1.419186, -0.8503633, 3.637177, 1, 0, 0.5647059, 1,
1.424138, -0.3216772, 1.426325, 1, 0, 0.5568628, 1,
1.434917, 0.5378705, -0.143628, 1, 0, 0.5529412, 1,
1.438153, -0.0244674, 0.3171676, 1, 0, 0.5450981, 1,
1.440943, 1.142865, 1.62553, 1, 0, 0.5411765, 1,
1.448335, -0.4314989, 2.101641, 1, 0, 0.5333334, 1,
1.449695, -0.5464005, 0.7351123, 1, 0, 0.5294118, 1,
1.455163, 0.956478, 3.09596, 1, 0, 0.5215687, 1,
1.472381, -0.6948955, 5.092408, 1, 0, 0.5176471, 1,
1.479827, 0.6397551, 1.615926, 1, 0, 0.509804, 1,
1.487602, 1.237307, 0.3472745, 1, 0, 0.5058824, 1,
1.4915, -1.835121, 2.844801, 1, 0, 0.4980392, 1,
1.49677, 0.1271791, 0.09020505, 1, 0, 0.4901961, 1,
1.503573, 0.1987357, -0.9889662, 1, 0, 0.4862745, 1,
1.508666, 0.8624794, 1.362274, 1, 0, 0.4784314, 1,
1.509793, 0.3117763, 0.9738355, 1, 0, 0.4745098, 1,
1.511785, 1.410669, 0.8944535, 1, 0, 0.4666667, 1,
1.52761, -1.197706, 2.165241, 1, 0, 0.4627451, 1,
1.528406, -1.279474, 1.438376, 1, 0, 0.454902, 1,
1.530132, -0.9235042, 2.400593, 1, 0, 0.4509804, 1,
1.539355, 0.7497604, 0.5281239, 1, 0, 0.4431373, 1,
1.561289, 1.453691, 1.93568, 1, 0, 0.4392157, 1,
1.563229, 1.402713, 0.612719, 1, 0, 0.4313726, 1,
1.564501, -0.6852126, 1.829236, 1, 0, 0.427451, 1,
1.565651, -0.09914307, 2.443954, 1, 0, 0.4196078, 1,
1.575232, 1.438811, 2.108049, 1, 0, 0.4156863, 1,
1.588297, -2.524464, 2.613332, 1, 0, 0.4078431, 1,
1.605152, -0.4075779, 2.796812, 1, 0, 0.4039216, 1,
1.610039, -0.08688343, 0.5507637, 1, 0, 0.3960784, 1,
1.627, 0.5186397, 1.292676, 1, 0, 0.3882353, 1,
1.628766, -1.061694, 2.49116, 1, 0, 0.3843137, 1,
1.635112, 0.2506269, -0.3868695, 1, 0, 0.3764706, 1,
1.651037, -0.358026, 3.061499, 1, 0, 0.372549, 1,
1.655187, -0.6347264, 2.701956, 1, 0, 0.3647059, 1,
1.671875, -0.07311732, 0.6814883, 1, 0, 0.3607843, 1,
1.681322, 2.000066, 2.584138, 1, 0, 0.3529412, 1,
1.683092, 0.03817907, 1.221036, 1, 0, 0.3490196, 1,
1.692069, -0.8029583, 1.021639, 1, 0, 0.3411765, 1,
1.700696, -0.1267661, 1.454033, 1, 0, 0.3372549, 1,
1.706094, 1.792957, 0.938248, 1, 0, 0.3294118, 1,
1.715136, -0.9446128, 3.642792, 1, 0, 0.3254902, 1,
1.726821, -0.642427, 1.559836, 1, 0, 0.3176471, 1,
1.727731, -0.2728536, 1.112851, 1, 0, 0.3137255, 1,
1.758491, -0.1952386, 1.934645, 1, 0, 0.3058824, 1,
1.785147, 2.427185, 0.2975453, 1, 0, 0.2980392, 1,
1.786217, 0.08108023, 0.2613259, 1, 0, 0.2941177, 1,
1.793409, 1.394473, -0.04175218, 1, 0, 0.2862745, 1,
1.814901, -1.30434, 1.873532, 1, 0, 0.282353, 1,
1.833993, -0.819526, 2.508597, 1, 0, 0.2745098, 1,
1.836701, 0.8946652, 2.254312, 1, 0, 0.2705882, 1,
1.838833, 0.105584, 2.326167, 1, 0, 0.2627451, 1,
1.844449, 0.8172574, 1.468646, 1, 0, 0.2588235, 1,
1.857231, 0.7793688, 1.228212, 1, 0, 0.2509804, 1,
1.85918, 0.3637169, 2.492133, 1, 0, 0.2470588, 1,
1.875658, 2.851173, 0.9763213, 1, 0, 0.2392157, 1,
1.885444, 0.2272073, 1.78642, 1, 0, 0.2352941, 1,
1.89646, -1.145707, 1.456316, 1, 0, 0.227451, 1,
1.911073, 1.255749, -0.2240274, 1, 0, 0.2235294, 1,
1.924662, -1.207491, 2.801028, 1, 0, 0.2156863, 1,
1.930623, 0.2948804, 0.7136914, 1, 0, 0.2117647, 1,
1.933907, 0.06082246, 1.299107, 1, 0, 0.2039216, 1,
1.935827, -0.2402943, 0.6941316, 1, 0, 0.1960784, 1,
1.939737, -1.558359, 4.536426, 1, 0, 0.1921569, 1,
1.942022, -0.7076684, 0.26548, 1, 0, 0.1843137, 1,
1.959119, 1.230169, 0.4123878, 1, 0, 0.1803922, 1,
1.96316, 0.6524205, 1.263425, 1, 0, 0.172549, 1,
1.99551, -1.054469, 3.51631, 1, 0, 0.1686275, 1,
1.998931, 1.557131, 1.112977, 1, 0, 0.1607843, 1,
2.116894, 1.075365, 1.05806, 1, 0, 0.1568628, 1,
2.118189, 0.3032894, 0.9352397, 1, 0, 0.1490196, 1,
2.128177, 1.138768, 1.711947, 1, 0, 0.145098, 1,
2.144684, 2.374862, 2.201176, 1, 0, 0.1372549, 1,
2.14753, 0.631057, -0.3503969, 1, 0, 0.1333333, 1,
2.170804, -1.542576, 3.644861, 1, 0, 0.1254902, 1,
2.172531, 0.1961847, 0.9346874, 1, 0, 0.1215686, 1,
2.23806, 0.548474, 2.66355, 1, 0, 0.1137255, 1,
2.264774, -0.7772226, -0.1649675, 1, 0, 0.1098039, 1,
2.303297, 0.5708973, 0.6463861, 1, 0, 0.1019608, 1,
2.313267, -1.861671, 3.730092, 1, 0, 0.09411765, 1,
2.336035, -0.5119907, 2.321518, 1, 0, 0.09019608, 1,
2.356747, 0.6669358, 0.648586, 1, 0, 0.08235294, 1,
2.377239, 0.5657395, 1.876544, 1, 0, 0.07843138, 1,
2.387496, -0.0373762, 1.146293, 1, 0, 0.07058824, 1,
2.403714, -2.100675, 2.40438, 1, 0, 0.06666667, 1,
2.49877, 0.1066982, 1.297114, 1, 0, 0.05882353, 1,
2.520686, 0.4617674, 1.558433, 1, 0, 0.05490196, 1,
2.642057, 1.345363, 0.5665389, 1, 0, 0.04705882, 1,
2.664443, 0.1222989, 0.4620645, 1, 0, 0.04313726, 1,
2.703581, -0.3611968, 2.447237, 1, 0, 0.03529412, 1,
2.728921, 0.8543789, 1.564536, 1, 0, 0.03137255, 1,
3.032813, 0.8916635, 2.480776, 1, 0, 0.02352941, 1,
3.238922, 0.3200017, 2.646155, 1, 0, 0.01960784, 1,
3.275951, 0.2330577, 1.281176, 1, 0, 0.01176471, 1,
3.986968, 1.043846, 1.169821, 1, 0, 0.007843138, 1
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
0.3684831, -4.711672, -7.352817, 0, -0.5, 0.5, 0.5,
0.3684831, -4.711672, -7.352817, 1, -0.5, 0.5, 0.5,
0.3684831, -4.711672, -7.352817, 1, 1.5, 0.5, 0.5,
0.3684831, -4.711672, -7.352817, 0, 1.5, 0.5, 0.5
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
-4.476668, 0.1096842, -7.352817, 0, -0.5, 0.5, 0.5,
-4.476668, 0.1096842, -7.352817, 1, -0.5, 0.5, 0.5,
-4.476668, 0.1096842, -7.352817, 1, 1.5, 0.5, 0.5,
-4.476668, 0.1096842, -7.352817, 0, 1.5, 0.5, 0.5
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
-4.476668, -4.711672, -0.228338, 0, -0.5, 0.5, 0.5,
-4.476668, -4.711672, -0.228338, 1, -0.5, 0.5, 0.5,
-4.476668, -4.711672, -0.228338, 1, 1.5, 0.5, 0.5,
-4.476668, -4.711672, -0.228338, 0, 1.5, 0.5, 0.5
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
-2, -3.599051, -5.708706,
2, -3.599051, -5.708706,
-2, -3.599051, -5.708706,
-2, -3.784488, -5.982725,
0, -3.599051, -5.708706,
0, -3.784488, -5.982725,
2, -3.599051, -5.708706,
2, -3.784488, -5.982725
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
"0",
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
-2, -4.155362, -6.530761, 0, -0.5, 0.5, 0.5,
-2, -4.155362, -6.530761, 1, -0.5, 0.5, 0.5,
-2, -4.155362, -6.530761, 1, 1.5, 0.5, 0.5,
-2, -4.155362, -6.530761, 0, 1.5, 0.5, 0.5,
0, -4.155362, -6.530761, 0, -0.5, 0.5, 0.5,
0, -4.155362, -6.530761, 1, -0.5, 0.5, 0.5,
0, -4.155362, -6.530761, 1, 1.5, 0.5, 0.5,
0, -4.155362, -6.530761, 0, 1.5, 0.5, 0.5,
2, -4.155362, -6.530761, 0, -0.5, 0.5, 0.5,
2, -4.155362, -6.530761, 1, -0.5, 0.5, 0.5,
2, -4.155362, -6.530761, 1, 1.5, 0.5, 0.5,
2, -4.155362, -6.530761, 0, 1.5, 0.5, 0.5
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
-3.358556, -2, -5.708706,
-3.358556, 2, -5.708706,
-3.358556, -2, -5.708706,
-3.544908, -2, -5.982725,
-3.358556, 0, -5.708706,
-3.544908, 0, -5.982725,
-3.358556, 2, -5.708706,
-3.544908, 2, -5.982725
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
-3.917612, -2, -6.530761, 0, -0.5, 0.5, 0.5,
-3.917612, -2, -6.530761, 1, -0.5, 0.5, 0.5,
-3.917612, -2, -6.530761, 1, 1.5, 0.5, 0.5,
-3.917612, -2, -6.530761, 0, 1.5, 0.5, 0.5,
-3.917612, 0, -6.530761, 0, -0.5, 0.5, 0.5,
-3.917612, 0, -6.530761, 1, -0.5, 0.5, 0.5,
-3.917612, 0, -6.530761, 1, 1.5, 0.5, 0.5,
-3.917612, 0, -6.530761, 0, 1.5, 0.5, 0.5,
-3.917612, 2, -6.530761, 0, -0.5, 0.5, 0.5,
-3.917612, 2, -6.530761, 1, -0.5, 0.5, 0.5,
-3.917612, 2, -6.530761, 1, 1.5, 0.5, 0.5,
-3.917612, 2, -6.530761, 0, 1.5, 0.5, 0.5
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
-3.358556, -3.599051, -4,
-3.358556, -3.599051, 4,
-3.358556, -3.599051, -4,
-3.544908, -3.784488, -4,
-3.358556, -3.599051, -2,
-3.544908, -3.784488, -2,
-3.358556, -3.599051, 0,
-3.544908, -3.784488, 0,
-3.358556, -3.599051, 2,
-3.544908, -3.784488, 2,
-3.358556, -3.599051, 4,
-3.544908, -3.784488, 4
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
-3.917612, -4.155362, -4, 0, -0.5, 0.5, 0.5,
-3.917612, -4.155362, -4, 1, -0.5, 0.5, 0.5,
-3.917612, -4.155362, -4, 1, 1.5, 0.5, 0.5,
-3.917612, -4.155362, -4, 0, 1.5, 0.5, 0.5,
-3.917612, -4.155362, -2, 0, -0.5, 0.5, 0.5,
-3.917612, -4.155362, -2, 1, -0.5, 0.5, 0.5,
-3.917612, -4.155362, -2, 1, 1.5, 0.5, 0.5,
-3.917612, -4.155362, -2, 0, 1.5, 0.5, 0.5,
-3.917612, -4.155362, 0, 0, -0.5, 0.5, 0.5,
-3.917612, -4.155362, 0, 1, -0.5, 0.5, 0.5,
-3.917612, -4.155362, 0, 1, 1.5, 0.5, 0.5,
-3.917612, -4.155362, 0, 0, 1.5, 0.5, 0.5,
-3.917612, -4.155362, 2, 0, -0.5, 0.5, 0.5,
-3.917612, -4.155362, 2, 1, -0.5, 0.5, 0.5,
-3.917612, -4.155362, 2, 1, 1.5, 0.5, 0.5,
-3.917612, -4.155362, 2, 0, 1.5, 0.5, 0.5,
-3.917612, -4.155362, 4, 0, -0.5, 0.5, 0.5,
-3.917612, -4.155362, 4, 1, -0.5, 0.5, 0.5,
-3.917612, -4.155362, 4, 1, 1.5, 0.5, 0.5,
-3.917612, -4.155362, 4, 0, 1.5, 0.5, 0.5
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
-3.358556, -3.599051, -5.708706,
-3.358556, 3.81842, -5.708706,
-3.358556, -3.599051, 5.25203,
-3.358556, 3.81842, 5.25203,
-3.358556, -3.599051, -5.708706,
-3.358556, -3.599051, 5.25203,
-3.358556, 3.81842, -5.708706,
-3.358556, 3.81842, 5.25203,
-3.358556, -3.599051, -5.708706,
4.095522, -3.599051, -5.708706,
-3.358556, -3.599051, 5.25203,
4.095522, -3.599051, 5.25203,
-3.358556, 3.81842, -5.708706,
4.095522, 3.81842, -5.708706,
-3.358556, 3.81842, 5.25203,
4.095522, 3.81842, 5.25203,
4.095522, -3.599051, -5.708706,
4.095522, 3.81842, -5.708706,
4.095522, -3.599051, 5.25203,
4.095522, 3.81842, 5.25203,
4.095522, -3.599051, -5.708706,
4.095522, -3.599051, 5.25203,
4.095522, 3.81842, -5.708706,
4.095522, 3.81842, 5.25203
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
var radius = 8.11088;
var distance = 36.08622;
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
mvMatrix.translate( -0.3684831, -0.1096842, 0.228338 );
mvMatrix.scale( 1.176489, 1.182295, 0.8000962 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.08622);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
diamide<-read.table("diamide.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-diamide$V2
```

```
## Error in eval(expr, envir, enclos): object 'diamide' not found
```

```r
y<-diamide$V3
```

```
## Error in eval(expr, envir, enclos): object 'diamide' not found
```

```r
z<-diamide$V4
```

```
## Error in eval(expr, envir, enclos): object 'diamide' not found
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
-3.250002, 1.134769, -0.8914591, 0, 0, 1, 1, 1,
-3.171231, -0.2849157, -0.9761466, 1, 0, 0, 1, 1,
-2.988133, -0.2682323, -1.613429, 1, 0, 0, 1, 1,
-2.926096, 1.726391, -2.208238, 1, 0, 0, 1, 1,
-2.885682, 1.319132, -0.5692303, 1, 0, 0, 1, 1,
-2.825089, 0.9847557, 0.4791086, 1, 0, 0, 1, 1,
-2.635334, 1.569355, -1.643923, 0, 0, 0, 1, 1,
-2.504793, 1.020698, -0.1009305, 0, 0, 0, 1, 1,
-2.478589, 0.5174923, -3.149933, 0, 0, 0, 1, 1,
-2.456081, -1.621799, -2.87921, 0, 0, 0, 1, 1,
-2.445038, 0.2372444, -1.356258, 0, 0, 0, 1, 1,
-2.384761, -0.7492392, -0.5590646, 0, 0, 0, 1, 1,
-2.373441, -0.2314284, -0.2954572, 0, 0, 0, 1, 1,
-2.342986, 0.05433202, -1.645645, 1, 1, 1, 1, 1,
-2.252457, -1.42385, -2.619073, 1, 1, 1, 1, 1,
-2.230545, 2.001853, -2.399356, 1, 1, 1, 1, 1,
-2.16763, -0.1693099, -2.421072, 1, 1, 1, 1, 1,
-2.114245, -0.2169587, -1.121319, 1, 1, 1, 1, 1,
-2.108093, 0.05361747, -1.561974, 1, 1, 1, 1, 1,
-2.106263, -1.380215, -2.054651, 1, 1, 1, 1, 1,
-2.103888, 1.085445, -0.04845741, 1, 1, 1, 1, 1,
-2.089866, -0.5819384, -0.3584701, 1, 1, 1, 1, 1,
-2.061481, -1.600778, -2.475127, 1, 1, 1, 1, 1,
-2.021594, 0.1890426, 0.8069678, 1, 1, 1, 1, 1,
-2.011601, -0.2424157, -2.191385, 1, 1, 1, 1, 1,
-1.997949, 0.1368079, -0.2252197, 1, 1, 1, 1, 1,
-1.977807, -1.373331, -0.8869053, 1, 1, 1, 1, 1,
-1.957415, 0.5123463, 1.696679, 1, 1, 1, 1, 1,
-1.951169, 0.9963344, -1.684507, 0, 0, 1, 1, 1,
-1.948691, -1.515864, -2.375688, 1, 0, 0, 1, 1,
-1.937984, 2.185277, 0.301659, 1, 0, 0, 1, 1,
-1.935462, 0.8564848, -0.1519642, 1, 0, 0, 1, 1,
-1.911411, 1.336778, -0.9121644, 1, 0, 0, 1, 1,
-1.870426, -0.9706317, -2.8117, 1, 0, 0, 1, 1,
-1.870099, 0.3110102, -1.467173, 0, 0, 0, 1, 1,
-1.864804, -2.154533, -2.454014, 0, 0, 0, 1, 1,
-1.819509, -0.2496208, -2.266594, 0, 0, 0, 1, 1,
-1.810788, 0.7196792, -2.321451, 0, 0, 0, 1, 1,
-1.799493, 0.3362958, -1.122401, 0, 0, 0, 1, 1,
-1.787821, -0.153129, -2.793463, 0, 0, 0, 1, 1,
-1.782145, 1.093973, 0.8050704, 0, 0, 0, 1, 1,
-1.780863, -1.956323, -1.903979, 1, 1, 1, 1, 1,
-1.778374, -1.070614, -2.371996, 1, 1, 1, 1, 1,
-1.752786, 0.8890095, -0.8093922, 1, 1, 1, 1, 1,
-1.732442, -1.275752, -1.918674, 1, 1, 1, 1, 1,
-1.730631, -0.499466, -2.189853, 1, 1, 1, 1, 1,
-1.718176, 0.1590242, -0.6173372, 1, 1, 1, 1, 1,
-1.704192, -0.03593563, -1.948238, 1, 1, 1, 1, 1,
-1.700627, -0.4666249, -1.312358, 1, 1, 1, 1, 1,
-1.696576, -0.7711403, -3.56947, 1, 1, 1, 1, 1,
-1.686503, -0.2095519, -1.475517, 1, 1, 1, 1, 1,
-1.684937, -0.4169551, -2.534605, 1, 1, 1, 1, 1,
-1.669709, -0.6039326, -0.01316899, 1, 1, 1, 1, 1,
-1.649902, 0.04893149, -1.86244, 1, 1, 1, 1, 1,
-1.647531, -0.9352025, -1.835114, 1, 1, 1, 1, 1,
-1.632195, 1.180987, -2.091964, 1, 1, 1, 1, 1,
-1.608791, -0.1887346, -1.460314, 0, 0, 1, 1, 1,
-1.597207, -1.78792, -3.197885, 1, 0, 0, 1, 1,
-1.591389, -0.4745325, -1.329712, 1, 0, 0, 1, 1,
-1.587877, -0.1364009, -0.9287412, 1, 0, 0, 1, 1,
-1.576403, -0.231262, -1.852077, 1, 0, 0, 1, 1,
-1.564154, 0.1938182, -1.667661, 1, 0, 0, 1, 1,
-1.560466, -0.2784468, -1.629059, 0, 0, 0, 1, 1,
-1.54443, -1.704024, -2.194051, 0, 0, 0, 1, 1,
-1.541044, -0.9561656, -1.889817, 0, 0, 0, 1, 1,
-1.538628, -0.5757883, -1.846887, 0, 0, 0, 1, 1,
-1.521088, -0.8622373, -1.761665, 0, 0, 0, 1, 1,
-1.51537, -0.2434761, -0.521014, 0, 0, 0, 1, 1,
-1.506507, -0.231648, -2.618376, 0, 0, 0, 1, 1,
-1.50328, -0.0267106, -3.71463, 1, 1, 1, 1, 1,
-1.464618, -1.271318, -1.220843, 1, 1, 1, 1, 1,
-1.449509, -0.5666155, -1.621562, 1, 1, 1, 1, 1,
-1.443859, 0.9097812, -1.177408, 1, 1, 1, 1, 1,
-1.421992, -0.6523743, -2.830397, 1, 1, 1, 1, 1,
-1.396069, 0.0154576, -2.194384, 1, 1, 1, 1, 1,
-1.386159, -1.592353, -0.8009613, 1, 1, 1, 1, 1,
-1.384474, 0.03469883, -1.903331, 1, 1, 1, 1, 1,
-1.372309, -0.5594405, -3.831903, 1, 1, 1, 1, 1,
-1.366471, 0.619229, -2.86704, 1, 1, 1, 1, 1,
-1.362525, 3.710398, 0.8574356, 1, 1, 1, 1, 1,
-1.360193, -0.04407468, 0.3255634, 1, 1, 1, 1, 1,
-1.354836, 2.814816, -1.23442, 1, 1, 1, 1, 1,
-1.345823, -0.009365707, -3.296597, 1, 1, 1, 1, 1,
-1.330141, 0.720701, -0.9170188, 1, 1, 1, 1, 1,
-1.323263, -0.6141847, -3.845506, 0, 0, 1, 1, 1,
-1.322549, -0.6262785, -1.503026, 1, 0, 0, 1, 1,
-1.30881, -2.138356, -2.666936, 1, 0, 0, 1, 1,
-1.303774, 1.968128, -0.1660091, 1, 0, 0, 1, 1,
-1.279951, 0.6232647, 0.03163712, 1, 0, 0, 1, 1,
-1.275096, -1.814768, -4.132351, 1, 0, 0, 1, 1,
-1.267791, -1.364408, -3.169365, 0, 0, 0, 1, 1,
-1.248526, 0.3076417, 0.1511846, 0, 0, 0, 1, 1,
-1.242384, 2.115987, -1.230125, 0, 0, 0, 1, 1,
-1.242243, -0.9474049, -3.164811, 0, 0, 0, 1, 1,
-1.241268, 2.459816, 0.3222599, 0, 0, 0, 1, 1,
-1.231385, 0.475885, -1.44782, 0, 0, 0, 1, 1,
-1.22961, -1.213138, -1.923696, 0, 0, 0, 1, 1,
-1.217942, -0.9709536, -1.269146, 1, 1, 1, 1, 1,
-1.217214, 0.2262288, -1.074777, 1, 1, 1, 1, 1,
-1.217101, -0.5385966, -3.83971, 1, 1, 1, 1, 1,
-1.208465, 0.2485709, -0.70898, 1, 1, 1, 1, 1,
-1.208005, -0.4358936, -3.629902, 1, 1, 1, 1, 1,
-1.190578, 0.5823689, -0.8078101, 1, 1, 1, 1, 1,
-1.186977, 0.7154751, -0.3919598, 1, 1, 1, 1, 1,
-1.181732, 2.006932, -1.485908, 1, 1, 1, 1, 1,
-1.175992, -0.8257882, -2.233479, 1, 1, 1, 1, 1,
-1.172488, 0.3949141, 0.2757322, 1, 1, 1, 1, 1,
-1.162155, 0.7730941, -1.191069, 1, 1, 1, 1, 1,
-1.16212, 0.2543477, -0.4232881, 1, 1, 1, 1, 1,
-1.159301, 0.1421387, -2.268877, 1, 1, 1, 1, 1,
-1.15668, 0.2551184, -1.215619, 1, 1, 1, 1, 1,
-1.156453, -1.695848, -0.682161, 1, 1, 1, 1, 1,
-1.155644, 0.2921079, -1.408385, 0, 0, 1, 1, 1,
-1.153856, -0.4249826, -1.515412, 1, 0, 0, 1, 1,
-1.149451, -1.072674, -0.7336649, 1, 0, 0, 1, 1,
-1.146893, -0.8413864, -1.750121, 1, 0, 0, 1, 1,
-1.146447, 0.9817716, -1.042998, 1, 0, 0, 1, 1,
-1.145761, -0.3744887, -3.507788, 1, 0, 0, 1, 1,
-1.1374, -0.9314159, -3.728078, 0, 0, 0, 1, 1,
-1.135715, 0.3341045, -0.3109704, 0, 0, 0, 1, 1,
-1.132973, 0.6295699, -0.9037523, 0, 0, 0, 1, 1,
-1.121528, 1.098029, -1.568983, 0, 0, 0, 1, 1,
-1.105463, 1.018165, 0.1699686, 0, 0, 0, 1, 1,
-1.090871, 1.760939, 0.5138551, 0, 0, 0, 1, 1,
-1.089523, -0.3676528, -2.710283, 0, 0, 0, 1, 1,
-1.089169, 0.04086412, 0.08272752, 1, 1, 1, 1, 1,
-1.088882, 2.005512, -1.096984, 1, 1, 1, 1, 1,
-1.087149, 1.408389, -0.6677089, 1, 1, 1, 1, 1,
-1.086329, -0.5349716, -3.065804, 1, 1, 1, 1, 1,
-1.080172, -0.0002813694, -2.239264, 1, 1, 1, 1, 1,
-1.078989, 0.5410935, -4.115333, 1, 1, 1, 1, 1,
-1.078921, 0.05673735, -2.216902, 1, 1, 1, 1, 1,
-1.077807, 0.1816464, -0.8443235, 1, 1, 1, 1, 1,
-1.076519, -0.3600735, -2.698578, 1, 1, 1, 1, 1,
-1.074878, -0.326213, -0.5398784, 1, 1, 1, 1, 1,
-1.06914, 0.0135393, -0.8902606, 1, 1, 1, 1, 1,
-1.067776, -0.07010314, -2.130256, 1, 1, 1, 1, 1,
-1.067339, 0.05176693, -2.127387, 1, 1, 1, 1, 1,
-1.064511, 1.22546, -3.096834, 1, 1, 1, 1, 1,
-1.061512, -0.3256625, -2.151024, 1, 1, 1, 1, 1,
-1.058831, -1.39641, -3.5541, 0, 0, 1, 1, 1,
-1.050021, -2.004285, -0.09310256, 1, 0, 0, 1, 1,
-1.049998, 0.8203985, -1.456731, 1, 0, 0, 1, 1,
-1.041244, 1.102007, 0.01497809, 1, 0, 0, 1, 1,
-1.023008, 0.5114378, -1.10717, 1, 0, 0, 1, 1,
-1.021029, -2.724226, -3.214823, 1, 0, 0, 1, 1,
-1.009215, -1.340449, -3.666618, 0, 0, 0, 1, 1,
-0.9948076, 1.91636, -0.6845597, 0, 0, 0, 1, 1,
-0.9844003, -1.13421, -1.871675, 0, 0, 0, 1, 1,
-0.980118, -0.3237865, -1.509313, 0, 0, 0, 1, 1,
-0.9789478, 0.3246711, -0.1993163, 0, 0, 0, 1, 1,
-0.9723507, 0.1979103, -1.419625, 0, 0, 0, 1, 1,
-0.9679332, 0.7081828, -1.182624, 0, 0, 0, 1, 1,
-0.9675022, 0.1121848, -3.060606, 1, 1, 1, 1, 1,
-0.9632633, 2.424551, -1.359194, 1, 1, 1, 1, 1,
-0.9549733, -0.1025732, -1.398772, 1, 1, 1, 1, 1,
-0.9483572, -0.9450113, -1.693887, 1, 1, 1, 1, 1,
-0.9478727, -0.1825397, 1.29852, 1, 1, 1, 1, 1,
-0.942816, -0.3024611, -0.9314756, 1, 1, 1, 1, 1,
-0.9383879, -0.02436786, -1.778561, 1, 1, 1, 1, 1,
-0.931592, -0.9683652, -2.229363, 1, 1, 1, 1, 1,
-0.9293587, 0.6975994, -1.81845, 1, 1, 1, 1, 1,
-0.9274269, 0.9009855, 0.2946521, 1, 1, 1, 1, 1,
-0.9202123, 0.4363776, -0.4446634, 1, 1, 1, 1, 1,
-0.9159799, -0.7578695, -2.168376, 1, 1, 1, 1, 1,
-0.9097396, -0.942875, -1.275512, 1, 1, 1, 1, 1,
-0.9071912, -0.01114302, -0.2861531, 1, 1, 1, 1, 1,
-0.9069415, -0.8649875, -3.226046, 1, 1, 1, 1, 1,
-0.9054325, -0.1638973, -1.966354, 0, 0, 1, 1, 1,
-0.8977495, 0.265357, -1.28528, 1, 0, 0, 1, 1,
-0.8886749, -1.524269, -3.607917, 1, 0, 0, 1, 1,
-0.869666, 0.347048, -0.6114147, 1, 0, 0, 1, 1,
-0.8665246, 0.5061613, -0.5124493, 1, 0, 0, 1, 1,
-0.8644974, -0.2155079, -0.412575, 1, 0, 0, 1, 1,
-0.8638104, 1.375162, 0.9813462, 0, 0, 0, 1, 1,
-0.8489969, -1.043969, -4.198591, 0, 0, 0, 1, 1,
-0.8459849, -0.2131617, -1.175672, 0, 0, 0, 1, 1,
-0.8426823, -0.1299507, -1.716481, 0, 0, 0, 1, 1,
-0.8424509, -0.9186414, -2.74813, 0, 0, 0, 1, 1,
-0.8353783, 1.749814, 0.5124428, 0, 0, 0, 1, 1,
-0.834788, 0.2618708, -2.651411, 0, 0, 0, 1, 1,
-0.8278589, -1.044438, -1.39297, 1, 1, 1, 1, 1,
-0.824324, 1.102298, 0.9073267, 1, 1, 1, 1, 1,
-0.8239391, 1.452773, 0.6775236, 1, 1, 1, 1, 1,
-0.8219253, 1.101766, -2.18545, 1, 1, 1, 1, 1,
-0.8174115, 0.9150981, -0.7512897, 1, 1, 1, 1, 1,
-0.814078, 0.1507942, -2.80086, 1, 1, 1, 1, 1,
-0.8139245, 0.2815465, -1.148316, 1, 1, 1, 1, 1,
-0.8128923, 0.3751756, -2.211447, 1, 1, 1, 1, 1,
-0.8094759, -0.5376049, -2.75526, 1, 1, 1, 1, 1,
-0.8077102, 1.43149, -0.02014036, 1, 1, 1, 1, 1,
-0.8074817, -1.149752, -2.735576, 1, 1, 1, 1, 1,
-0.8016958, -0.3926111, -1.999415, 1, 1, 1, 1, 1,
-0.7955375, -0.0918926, -0.6413657, 1, 1, 1, 1, 1,
-0.7938534, 0.2696992, -1.538373, 1, 1, 1, 1, 1,
-0.7874741, -0.2231717, -1.351614, 1, 1, 1, 1, 1,
-0.7854698, 0.3622935, -2.531352, 0, 0, 1, 1, 1,
-0.7805861, 0.03754359, -1.841163, 1, 0, 0, 1, 1,
-0.7777224, 0.5475197, 0.2097486, 1, 0, 0, 1, 1,
-0.7767865, 0.09199239, -1.225948, 1, 0, 0, 1, 1,
-0.7721375, -1.463934, -3.083435, 1, 0, 0, 1, 1,
-0.7687892, 1.3325, -0.8675579, 1, 0, 0, 1, 1,
-0.7680427, 0.4055029, -2.526783, 0, 0, 0, 1, 1,
-0.7669895, 0.9216525, -1.784756, 0, 0, 0, 1, 1,
-0.7669215, 0.231656, -3.649765, 0, 0, 0, 1, 1,
-0.7523668, 0.9149727, 0.4320437, 0, 0, 0, 1, 1,
-0.7490262, 0.6301233, -0.6153767, 0, 0, 0, 1, 1,
-0.746622, -0.5509139, -1.635301, 0, 0, 0, 1, 1,
-0.738111, 0.5547836, -1.875519, 0, 0, 0, 1, 1,
-0.7354333, 1.038345, -2.506385, 1, 1, 1, 1, 1,
-0.7352293, 0.2287573, -2.52529, 1, 1, 1, 1, 1,
-0.7321302, 0.7626298, -0.3576103, 1, 1, 1, 1, 1,
-0.7274437, -0.01536176, 0.7905264, 1, 1, 1, 1, 1,
-0.7251467, -0.3438981, -1.108505, 1, 1, 1, 1, 1,
-0.7224985, 0.3951549, -0.7832463, 1, 1, 1, 1, 1,
-0.7208238, -0.1622018, -1.380584, 1, 1, 1, 1, 1,
-0.7105824, -0.4414002, -3.711763, 1, 1, 1, 1, 1,
-0.7099084, 1.003353, -1.545268, 1, 1, 1, 1, 1,
-0.7087292, -0.05327389, -2.31076, 1, 1, 1, 1, 1,
-0.7086547, 0.7881463, 0.6473765, 1, 1, 1, 1, 1,
-0.7058491, -0.8112663, -3.085234, 1, 1, 1, 1, 1,
-0.7018562, -0.6314834, -1.957986, 1, 1, 1, 1, 1,
-0.6992259, 0.551462, -0.05989918, 1, 1, 1, 1, 1,
-0.6974278, -0.2889079, -2.280829, 1, 1, 1, 1, 1,
-0.6938968, -0.2534148, -2.215562, 0, 0, 1, 1, 1,
-0.6907916, 0.0812113, -2.500185, 1, 0, 0, 1, 1,
-0.6880403, 0.5887987, -1.667784, 1, 0, 0, 1, 1,
-0.6828119, 1.104486, -0.9663594, 1, 0, 0, 1, 1,
-0.6825987, -1.476259, -2.095332, 1, 0, 0, 1, 1,
-0.6799294, 1.272481, -0.2944896, 1, 0, 0, 1, 1,
-0.6709422, 1.90334, 0.2718083, 0, 0, 0, 1, 1,
-0.6705382, -1.438525, -2.378996, 0, 0, 0, 1, 1,
-0.6704124, -1.048493, -2.620946, 0, 0, 0, 1, 1,
-0.6666929, -1.116587, -2.67882, 0, 0, 0, 1, 1,
-0.6565664, -0.1340735, -3.999558, 0, 0, 0, 1, 1,
-0.6545757, 0.1692598, -1.344792, 0, 0, 0, 1, 1,
-0.6515508, -0.002891499, 0.2438974, 0, 0, 0, 1, 1,
-0.6514897, -0.650201, -2.041625, 1, 1, 1, 1, 1,
-0.6427012, 0.705716, -0.5322285, 1, 1, 1, 1, 1,
-0.6415489, -1.10174, -0.2936233, 1, 1, 1, 1, 1,
-0.6361336, 1.933556, -1.05067, 1, 1, 1, 1, 1,
-0.6327599, 1.198332, -1.284379, 1, 1, 1, 1, 1,
-0.6323379, -1.356255, -2.652292, 1, 1, 1, 1, 1,
-0.6319585, -1.134022, -3.331108, 1, 1, 1, 1, 1,
-0.6307179, -1.63289, -2.887177, 1, 1, 1, 1, 1,
-0.6263778, -0.7224332, -4.627232, 1, 1, 1, 1, 1,
-0.6229932, -0.3119824, -2.974594, 1, 1, 1, 1, 1,
-0.6228571, 1.252671, 0.8761304, 1, 1, 1, 1, 1,
-0.6205276, 1.076633, -0.4879113, 1, 1, 1, 1, 1,
-0.6203259, 0.6096207, -1.947187, 1, 1, 1, 1, 1,
-0.6174057, -0.7293549, -1.833584, 1, 1, 1, 1, 1,
-0.6153045, 0.09932309, -1.154953, 1, 1, 1, 1, 1,
-0.6146981, -0.2676325, -1.567768, 0, 0, 1, 1, 1,
-0.6135763, 1.947917, -1.412241, 1, 0, 0, 1, 1,
-0.6048755, -0.06582218, -0.5549818, 1, 0, 0, 1, 1,
-0.5985381, -0.3599328, -2.051655, 1, 0, 0, 1, 1,
-0.5951958, 0.1907701, -1.12146, 1, 0, 0, 1, 1,
-0.5903786, -1.121229, -2.846948, 1, 0, 0, 1, 1,
-0.5894664, 0.3998877, -1.108813, 0, 0, 0, 1, 1,
-0.5850126, 0.1421407, -0.4254768, 0, 0, 0, 1, 1,
-0.5810869, 0.1240945, -0.09577244, 0, 0, 0, 1, 1,
-0.5784909, -1.389676, -1.976685, 0, 0, 0, 1, 1,
-0.57772, -1.048039, -1.910895, 0, 0, 0, 1, 1,
-0.572973, 0.8420833, -1.063444, 0, 0, 0, 1, 1,
-0.571847, 0.8128775, -0.5915614, 0, 0, 0, 1, 1,
-0.5717562, -0.4036128, -2.721624, 1, 1, 1, 1, 1,
-0.5698044, 1.459248, -1.796982, 1, 1, 1, 1, 1,
-0.5665212, -0.8666463, -3.124333, 1, 1, 1, 1, 1,
-0.5647274, -0.8078912, -2.912225, 1, 1, 1, 1, 1,
-0.5626845, 0.3150356, -2.532609, 1, 1, 1, 1, 1,
-0.5620567, -0.09888522, -1.809076, 1, 1, 1, 1, 1,
-0.5614879, -0.8264223, -3.434684, 1, 1, 1, 1, 1,
-0.558857, -0.5981624, -3.185447, 1, 1, 1, 1, 1,
-0.5555221, 2.623046, -0.1629843, 1, 1, 1, 1, 1,
-0.5546349, -0.2886651, -1.205373, 1, 1, 1, 1, 1,
-0.5543474, -0.1347485, -0.7748321, 1, 1, 1, 1, 1,
-0.5514088, -0.8674529, -2.161969, 1, 1, 1, 1, 1,
-0.5506782, 0.3460076, -1.394899, 1, 1, 1, 1, 1,
-0.5496749, 1.009634, -0.03199806, 1, 1, 1, 1, 1,
-0.5461203, -0.6380864, -3.08975, 1, 1, 1, 1, 1,
-0.5457975, 1.635216, -1.13904, 0, 0, 1, 1, 1,
-0.5454619, -0.9403921, -3.746409, 1, 0, 0, 1, 1,
-0.5424113, -0.1251525, -2.589218, 1, 0, 0, 1, 1,
-0.5376097, -0.8364714, -2.006755, 1, 0, 0, 1, 1,
-0.5339996, -1.010707, -2.723955, 1, 0, 0, 1, 1,
-0.5294744, 2.386624, -0.2212616, 1, 0, 0, 1, 1,
-0.5260564, -0.4449993, -3.16729, 0, 0, 0, 1, 1,
-0.524036, -1.444368, -1.293999, 0, 0, 0, 1, 1,
-0.5240066, 0.2972477, -1.819903, 0, 0, 0, 1, 1,
-0.519209, -1.305156, -3.564413, 0, 0, 0, 1, 1,
-0.5191476, 0.2337019, -0.4084201, 0, 0, 0, 1, 1,
-0.5182711, -0.813674, -0.2122731, 0, 0, 0, 1, 1,
-0.5118245, -1.222107, -3.36596, 0, 0, 0, 1, 1,
-0.5060889, 1.129517, -1.816202, 1, 1, 1, 1, 1,
-0.5017509, 0.8340343, 0.3825343, 1, 1, 1, 1, 1,
-0.4978983, -2.284752, -4.564395, 1, 1, 1, 1, 1,
-0.4931401, -0.920863, -3.098112, 1, 1, 1, 1, 1,
-0.4890079, 0.07673541, -3.421984, 1, 1, 1, 1, 1,
-0.4857419, 1.381888, -0.5313089, 1, 1, 1, 1, 1,
-0.4837514, 1.693768, -0.1814054, 1, 1, 1, 1, 1,
-0.4786507, 0.461511, -0.1823129, 1, 1, 1, 1, 1,
-0.4732405, -1.293476, -3.064138, 1, 1, 1, 1, 1,
-0.4725116, 1.827313, 0.005116256, 1, 1, 1, 1, 1,
-0.463351, -0.6336614, -1.81897, 1, 1, 1, 1, 1,
-0.4554446, 0.7798755, -1.448782, 1, 1, 1, 1, 1,
-0.4540044, -0.328445, -0.158048, 1, 1, 1, 1, 1,
-0.449585, -1.429433, -2.029891, 1, 1, 1, 1, 1,
-0.4493587, -0.001877783, -1.242576, 1, 1, 1, 1, 1,
-0.4485256, -0.4273981, -3.258202, 0, 0, 1, 1, 1,
-0.4453336, 0.8910746, -1.040395, 1, 0, 0, 1, 1,
-0.4450041, -0.4309693, -3.163072, 1, 0, 0, 1, 1,
-0.4426755, 1.149233, -0.1844053, 1, 0, 0, 1, 1,
-0.441984, 2.368084, -0.5225084, 1, 0, 0, 1, 1,
-0.4397849, 0.3191554, -1.03098, 1, 0, 0, 1, 1,
-0.4388279, -0.4152547, -0.7196809, 0, 0, 0, 1, 1,
-0.4376654, -0.6410155, -1.574116, 0, 0, 0, 1, 1,
-0.436748, 1.225649, -1.382226, 0, 0, 0, 1, 1,
-0.4355337, 0.1105149, -1.960747, 0, 0, 0, 1, 1,
-0.4338169, -0.3084402, -3.001509, 0, 0, 0, 1, 1,
-0.4331153, 0.819962, -1.777229, 0, 0, 0, 1, 1,
-0.4257701, 1.385617, 0.5425442, 0, 0, 0, 1, 1,
-0.4256194, -1.043948, -2.588245, 1, 1, 1, 1, 1,
-0.4251836, 1.578531, -0.1374774, 1, 1, 1, 1, 1,
-0.4213092, -0.6051384, -2.197123, 1, 1, 1, 1, 1,
-0.4194334, -0.370989, -3.228797, 1, 1, 1, 1, 1,
-0.4096224, 1.547167, 0.277396, 1, 1, 1, 1, 1,
-0.4094305, 0.4586217, -1.905049, 1, 1, 1, 1, 1,
-0.4091533, 0.03556754, -2.725592, 1, 1, 1, 1, 1,
-0.4078202, 0.006382217, -1.325391, 1, 1, 1, 1, 1,
-0.4072094, -0.1956187, -2.04301, 1, 1, 1, 1, 1,
-0.4051125, 0.4406603, -0.4004278, 1, 1, 1, 1, 1,
-0.4034422, -0.4546472, -2.750545, 1, 1, 1, 1, 1,
-0.402865, -1.699667, -4.108071, 1, 1, 1, 1, 1,
-0.4003232, -1.095259, -1.4238, 1, 1, 1, 1, 1,
-0.3916134, -0.4407006, -2.80864, 1, 1, 1, 1, 1,
-0.3878083, -1.688619, -4.890501, 1, 1, 1, 1, 1,
-0.3864723, -0.1775681, -0.8120684, 0, 0, 1, 1, 1,
-0.3839539, 0.909594, -0.5497628, 1, 0, 0, 1, 1,
-0.3814725, -0.4149745, -3.094796, 1, 0, 0, 1, 1,
-0.3790509, -0.04560677, -1.463427, 1, 0, 0, 1, 1,
-0.3780673, 1.340459, 1.827058, 1, 0, 0, 1, 1,
-0.3779151, 0.8168392, -1.317785, 1, 0, 0, 1, 1,
-0.3760627, -1.335159, -1.876803, 0, 0, 0, 1, 1,
-0.3717315, -1.241653, -3.977968, 0, 0, 0, 1, 1,
-0.367986, 1.650288, -1.434847, 0, 0, 0, 1, 1,
-0.3663214, -0.067059, 0.1874845, 0, 0, 0, 1, 1,
-0.3632177, 0.8317777, 0.2408475, 0, 0, 0, 1, 1,
-0.3620113, 0.2072334, -2.096286, 0, 0, 0, 1, 1,
-0.3614339, 1.025479, -1.569344, 0, 0, 0, 1, 1,
-0.361032, -0.2334345, -2.047594, 1, 1, 1, 1, 1,
-0.3588712, -3.49103, -2.718506, 1, 1, 1, 1, 1,
-0.356829, 1.097387, -0.09547211, 1, 1, 1, 1, 1,
-0.3544273, -0.6727099, -2.959329, 1, 1, 1, 1, 1,
-0.3472914, -1.142789, -3.334045, 1, 1, 1, 1, 1,
-0.3449292, 0.4351257, -2.916847, 1, 1, 1, 1, 1,
-0.3449285, 0.0991402, -0.7816265, 1, 1, 1, 1, 1,
-0.3404936, 1.032931, -0.6442945, 1, 1, 1, 1, 1,
-0.3402292, -0.1874936, -2.513559, 1, 1, 1, 1, 1,
-0.3390364, 1.465863, -0.3262143, 1, 1, 1, 1, 1,
-0.3384634, 0.6558629, 0.04684095, 1, 1, 1, 1, 1,
-0.3382018, 0.9942023, 1.167247, 1, 1, 1, 1, 1,
-0.3339536, -0.4420406, -3.619382, 1, 1, 1, 1, 1,
-0.3328671, -2.348931, -2.497053, 1, 1, 1, 1, 1,
-0.332683, 0.458755, -0.8750765, 1, 1, 1, 1, 1,
-0.3320133, 0.1415411, -2.145082, 0, 0, 1, 1, 1,
-0.3287214, 0.2324709, 0.1281672, 1, 0, 0, 1, 1,
-0.3256083, 2.982774, -1.30419, 1, 0, 0, 1, 1,
-0.3254503, -0.8175642, -2.143609, 1, 0, 0, 1, 1,
-0.3246205, -0.3687155, -2.298325, 1, 0, 0, 1, 1,
-0.3240697, -0.1577449, -1.434994, 1, 0, 0, 1, 1,
-0.3206996, -0.350202, -2.005638, 0, 0, 0, 1, 1,
-0.3173397, -0.5857913, -3.553083, 0, 0, 0, 1, 1,
-0.312617, -0.3536061, -1.655494, 0, 0, 0, 1, 1,
-0.3116261, 0.3606623, 0.5993862, 0, 0, 0, 1, 1,
-0.3093071, -0.005507471, -1.206323, 0, 0, 0, 1, 1,
-0.3071074, -1.648791, -3.42057, 0, 0, 0, 1, 1,
-0.3050593, 0.2233782, -0.8413852, 0, 0, 0, 1, 1,
-0.3045926, 0.9144233, -1.373701, 1, 1, 1, 1, 1,
-0.3011087, -0.3143146, -3.590005, 1, 1, 1, 1, 1,
-0.2993982, 1.658817, 0.3869614, 1, 1, 1, 1, 1,
-0.2949722, 0.6227776, 0.1634655, 1, 1, 1, 1, 1,
-0.2915255, 2.629889, -0.05613488, 1, 1, 1, 1, 1,
-0.2908891, 1.697243, -1.812582, 1, 1, 1, 1, 1,
-0.2908748, 0.5215741, 0.8807719, 1, 1, 1, 1, 1,
-0.2896217, 0.9647701, -0.4362307, 1, 1, 1, 1, 1,
-0.2812885, -0.2107581, -2.185687, 1, 1, 1, 1, 1,
-0.2769578, 0.2150463, 0.5372629, 1, 1, 1, 1, 1,
-0.2730219, 0.4120322, -1.581494, 1, 1, 1, 1, 1,
-0.2634257, -0.9660144, -1.864954, 1, 1, 1, 1, 1,
-0.2558723, -0.2306409, -1.592088, 1, 1, 1, 1, 1,
-0.2544947, 0.008367443, -2.516443, 1, 1, 1, 1, 1,
-0.2530648, -0.3365862, -2.377079, 1, 1, 1, 1, 1,
-0.2525063, 2.034067, 0.2639983, 0, 0, 1, 1, 1,
-0.2500562, -1.363619, -2.508937, 1, 0, 0, 1, 1,
-0.247086, 1.341561, -1.139204, 1, 0, 0, 1, 1,
-0.2459745, 2.437367, 1.332017, 1, 0, 0, 1, 1,
-0.2448317, 1.160163, 1.56006, 1, 0, 0, 1, 1,
-0.2443201, 0.7943915, -0.5967189, 1, 0, 0, 1, 1,
-0.2360073, 0.337392, 0.2881735, 0, 0, 0, 1, 1,
-0.2304106, -0.1566244, -0.9661747, 0, 0, 0, 1, 1,
-0.2200657, 0.9239062, 1.340585, 0, 0, 0, 1, 1,
-0.2178803, 1.131947, 0.1364299, 0, 0, 0, 1, 1,
-0.2134139, 0.7972446, 0.3479943, 0, 0, 0, 1, 1,
-0.2124175, -0.2785428, -2.273282, 0, 0, 0, 1, 1,
-0.2095714, 1.876935, -0.8462262, 0, 0, 0, 1, 1,
-0.2087378, -0.8211085, -4.307365, 1, 1, 1, 1, 1,
-0.2076932, 1.464485, -0.456936, 1, 1, 1, 1, 1,
-0.2068487, -1.020119, -2.309387, 1, 1, 1, 1, 1,
-0.2051559, 1.507196, -1.095886, 1, 1, 1, 1, 1,
-0.1979186, 0.626709, -1.164628, 1, 1, 1, 1, 1,
-0.192559, 0.9945665, 0.6502767, 1, 1, 1, 1, 1,
-0.1876524, 0.1901053, 0.1915927, 1, 1, 1, 1, 1,
-0.1857246, 1.238576, 0.3835542, 1, 1, 1, 1, 1,
-0.1830544, -0.3230945, -3.900974, 1, 1, 1, 1, 1,
-0.1811517, -0.208714, -1.999877, 1, 1, 1, 1, 1,
-0.1804721, 1.380269, -1.499882, 1, 1, 1, 1, 1,
-0.177483, -0.8860667, -1.661742, 1, 1, 1, 1, 1,
-0.1765322, 0.3987708, 0.1400105, 1, 1, 1, 1, 1,
-0.176201, -0.1813427, -3.770448, 1, 1, 1, 1, 1,
-0.171279, -0.6064391, -2.815331, 1, 1, 1, 1, 1,
-0.1700454, 0.918286, -1.728042, 0, 0, 1, 1, 1,
-0.1699751, 0.799758, -2.183214, 1, 0, 0, 1, 1,
-0.1690255, -1.00064, -2.765657, 1, 0, 0, 1, 1,
-0.1681649, -0.6215796, -4.148478, 1, 0, 0, 1, 1,
-0.1670436, -1.523158, -2.918325, 1, 0, 0, 1, 1,
-0.1629625, -1.01503, -3.365367, 1, 0, 0, 1, 1,
-0.1612568, -0.8462168, -5.323989, 0, 0, 0, 1, 1,
-0.1555134, -0.4665249, -1.332327, 0, 0, 0, 1, 1,
-0.1539187, -0.2415071, -3.547418, 0, 0, 0, 1, 1,
-0.1522723, -0.5749153, -2.100355, 0, 0, 0, 1, 1,
-0.1510358, -0.8368624, -3.042106, 0, 0, 0, 1, 1,
-0.1509221, 0.6901158, 1.900136, 0, 0, 0, 1, 1,
-0.149736, -0.1836971, -2.938881, 0, 0, 0, 1, 1,
-0.1492148, -0.5431595, -2.54634, 1, 1, 1, 1, 1,
-0.148768, -2.430293, -2.275977, 1, 1, 1, 1, 1,
-0.1466118, 1.387312, 0.3906815, 1, 1, 1, 1, 1,
-0.1441722, 0.6499862, -0.1177574, 1, 1, 1, 1, 1,
-0.1435852, 2.476593, -1.014247, 1, 1, 1, 1, 1,
-0.1427393, 0.6597712, 1.556002, 1, 1, 1, 1, 1,
-0.1419638, 0.7473257, -1.320153, 1, 1, 1, 1, 1,
-0.1384502, 0.3875629, 0.1590523, 1, 1, 1, 1, 1,
-0.1375522, 1.664244, -0.9211433, 1, 1, 1, 1, 1,
-0.1338215, 1.200647, -1.51273, 1, 1, 1, 1, 1,
-0.1332941, -1.371161, -2.814235, 1, 1, 1, 1, 1,
-0.1332932, -0.3403417, -3.296537, 1, 1, 1, 1, 1,
-0.1306155, -0.5735696, -3.31713, 1, 1, 1, 1, 1,
-0.1289553, 1.587737, -0.9677275, 1, 1, 1, 1, 1,
-0.1273024, 0.5599325, 0.2763005, 1, 1, 1, 1, 1,
-0.122256, -1.427585, -2.351016, 0, 0, 1, 1, 1,
-0.1212358, 0.3297359, -0.0006607799, 1, 0, 0, 1, 1,
-0.1211226, 0.2650656, -0.4763289, 1, 0, 0, 1, 1,
-0.1193475, 0.3205747, -1.307215, 1, 0, 0, 1, 1,
-0.1178065, -0.473867, -3.277733, 1, 0, 0, 1, 1,
-0.1173043, -1.862836, -4.054459, 1, 0, 0, 1, 1,
-0.1155921, -1.166856, -3.78527, 0, 0, 0, 1, 1,
-0.1127368, 0.1569476, -0.967197, 0, 0, 0, 1, 1,
-0.1100143, -0.05372088, -2.104264, 0, 0, 0, 1, 1,
-0.108001, 1.454813, -0.8960793, 0, 0, 0, 1, 1,
-0.1031753, -1.530401, -2.059013, 0, 0, 0, 1, 1,
-0.1018479, -0.5028287, -5.0058, 0, 0, 0, 1, 1,
-0.100733, -0.7438002, -3.587876, 0, 0, 0, 1, 1,
-0.1001905, 0.07550352, -2.954399, 1, 1, 1, 1, 1,
-0.09857894, -1.359364, -1.997835, 1, 1, 1, 1, 1,
-0.09339584, -0.393215, -3.923419, 1, 1, 1, 1, 1,
-0.09323695, 0.2803595, -1.570012, 1, 1, 1, 1, 1,
-0.09211724, 2.228073, 0.9834335, 1, 1, 1, 1, 1,
-0.08726731, -0.4174835, -3.216543, 1, 1, 1, 1, 1,
-0.08724942, 0.6119608, 0.0357695, 1, 1, 1, 1, 1,
-0.08704733, 0.5050588, -1.080017, 1, 1, 1, 1, 1,
-0.0812627, 0.1704284, -1.876963, 1, 1, 1, 1, 1,
-0.078206, -0.8848571, -2.655973, 1, 1, 1, 1, 1,
-0.07404707, 1.384016, 1.790408, 1, 1, 1, 1, 1,
-0.0734499, 0.6614613, -0.6832246, 1, 1, 1, 1, 1,
-0.07036952, 0.3161504, 1.195925, 1, 1, 1, 1, 1,
-0.06397811, -1.410671, -1.645321, 1, 1, 1, 1, 1,
-0.06285537, 1.312415, 1.031931, 1, 1, 1, 1, 1,
-0.05861884, -0.1650869, -4.211123, 0, 0, 1, 1, 1,
-0.05631939, 2.865082, 0.5964713, 1, 0, 0, 1, 1,
-0.04990391, -0.3838018, -3.264403, 1, 0, 0, 1, 1,
-0.04906942, -0.1190776, -0.8450158, 1, 0, 0, 1, 1,
-0.0417842, -0.3067548, -2.445973, 1, 0, 0, 1, 1,
-0.04174072, 1.291459, -2.341197, 1, 0, 0, 1, 1,
-0.03814859, 0.4631835, 1.347379, 0, 0, 0, 1, 1,
-0.03491735, 0.5660908, 1.046026, 0, 0, 0, 1, 1,
-0.03151224, -0.008090784, -3.334101, 0, 0, 0, 1, 1,
-0.0285034, -0.8311549, -4.223747, 0, 0, 0, 1, 1,
-0.02810043, -0.653844, -2.499571, 0, 0, 0, 1, 1,
-0.02798527, -2.333858, -1.826092, 0, 0, 0, 1, 1,
-0.02599474, -0.1487178, -3.857816, 0, 0, 0, 1, 1,
-0.0218804, 0.5720307, -1.18978, 1, 1, 1, 1, 1,
-0.0188163, 0.405567, -0.2905668, 1, 1, 1, 1, 1,
-0.01782721, 1.273713, 0.8981034, 1, 1, 1, 1, 1,
-0.0171516, 0.3174384, 1.370164, 1, 1, 1, 1, 1,
-0.01643798, -1.06931, -5.549084, 1, 1, 1, 1, 1,
-0.01101701, 1.547733, 0.4472443, 1, 1, 1, 1, 1,
-0.001321468, 0.3881739, 0.4173422, 1, 1, 1, 1, 1,
-0.0005419479, -0.9424424, -2.880388, 1, 1, 1, 1, 1,
0.0008687919, 1.485224, -0.4802697, 1, 1, 1, 1, 1,
0.00156088, -0.7233911, 2.827477, 1, 1, 1, 1, 1,
0.004012865, -0.7708741, 2.950361, 1, 1, 1, 1, 1,
0.006024074, -1.698965, 2.194238, 1, 1, 1, 1, 1,
0.01006494, -0.766377, 2.953568, 1, 1, 1, 1, 1,
0.0103157, -0.5316886, 2.707253, 1, 1, 1, 1, 1,
0.01330007, 1.526943, 0.959332, 1, 1, 1, 1, 1,
0.01558591, -0.08562019, 2.625324, 0, 0, 1, 1, 1,
0.02400686, 0.768616, -0.3161035, 1, 0, 0, 1, 1,
0.0291109, 1.135159, 0.1672881, 1, 0, 0, 1, 1,
0.0305278, -0.09147418, 3.097827, 1, 0, 0, 1, 1,
0.03214998, 0.7895086, -0.3066675, 1, 0, 0, 1, 1,
0.03620314, -0.2774652, 3.879301, 1, 0, 0, 1, 1,
0.03785085, 1.106989, -0.6301126, 0, 0, 0, 1, 1,
0.0385521, -1.416157, 4.837593, 0, 0, 0, 1, 1,
0.0391412, -0.6117045, 3.290616, 0, 0, 0, 1, 1,
0.0434505, -1.498619, 4.10889, 0, 0, 0, 1, 1,
0.04404019, 0.7804875, -1.679868, 0, 0, 0, 1, 1,
0.0450373, -0.3037503, 2.535793, 0, 0, 0, 1, 1,
0.04615028, -1.421888, 3.978647, 0, 0, 0, 1, 1,
0.05724867, -0.4382918, 2.447316, 1, 1, 1, 1, 1,
0.05925044, -1.044316, 4.517276, 1, 1, 1, 1, 1,
0.06006087, -0.9132142, 3.968723, 1, 1, 1, 1, 1,
0.06121873, -0.2068864, 1.927617, 1, 1, 1, 1, 1,
0.06238745, 1.21605, -1.060871, 1, 1, 1, 1, 1,
0.06401727, 1.425878, 0.2923049, 1, 1, 1, 1, 1,
0.07130803, -1.893162, 2.567671, 1, 1, 1, 1, 1,
0.07549024, 0.1929924, -0.4740315, 1, 1, 1, 1, 1,
0.07595024, 0.7111127, -0.6616336, 1, 1, 1, 1, 1,
0.07987273, 1.723369, -0.07789075, 1, 1, 1, 1, 1,
0.08401244, -1.723997, 3.129478, 1, 1, 1, 1, 1,
0.0860264, -1.119174, 0.6804125, 1, 1, 1, 1, 1,
0.09049556, 0.3564202, 0.8280056, 1, 1, 1, 1, 1,
0.0952201, -1.162011, 0.8738198, 1, 1, 1, 1, 1,
0.09826954, -1.266836, 4.261759, 1, 1, 1, 1, 1,
0.09858259, -0.4862222, 1.101884, 0, 0, 1, 1, 1,
0.1005653, 0.5164177, -1.158672, 1, 0, 0, 1, 1,
0.1032702, 0.2430442, -0.2547688, 1, 0, 0, 1, 1,
0.1062223, -1.584763, 2.679037, 1, 0, 0, 1, 1,
0.1097915, 0.6950711, -0.02927009, 1, 0, 0, 1, 1,
0.1105312, 0.6771748, 0.6075349, 1, 0, 0, 1, 1,
0.1111218, 0.9191169, -2.359228, 0, 0, 0, 1, 1,
0.1191913, 0.2902743, 0.8090066, 0, 0, 0, 1, 1,
0.1219017, -0.04784056, 1.260493, 0, 0, 0, 1, 1,
0.1223519, -0.007834219, 3.437706, 0, 0, 0, 1, 1,
0.1225776, -1.8095, 2.541336, 0, 0, 0, 1, 1,
0.1246689, -0.2188897, 2.266448, 0, 0, 0, 1, 1,
0.1281556, 0.06396247, 0.4975403, 0, 0, 0, 1, 1,
0.1319986, -0.5943922, 4.439005, 1, 1, 1, 1, 1,
0.1371652, 0.5485702, -0.5566862, 1, 1, 1, 1, 1,
0.1389766, 0.973035, 1.003347, 1, 1, 1, 1, 1,
0.1477879, -1.232314, 3.180646, 1, 1, 1, 1, 1,
0.1493359, -0.4388463, 0.411485, 1, 1, 1, 1, 1,
0.1502796, -0.3677768, 1.841787, 1, 1, 1, 1, 1,
0.151494, -2.407605, 4.661938, 1, 1, 1, 1, 1,
0.1550046, -0.6945591, 3.335609, 1, 1, 1, 1, 1,
0.1552692, 1.162554, 0.1672544, 1, 1, 1, 1, 1,
0.1613442, -0.6174998, 2.562562, 1, 1, 1, 1, 1,
0.161533, 1.802706, -1.906085, 1, 1, 1, 1, 1,
0.1619592, 2.34341, -0.9451171, 1, 1, 1, 1, 1,
0.1637597, -1.515388, 2.665824, 1, 1, 1, 1, 1,
0.165056, -0.7455154, 3.526628, 1, 1, 1, 1, 1,
0.1661315, 1.252538, -1.391902, 1, 1, 1, 1, 1,
0.1789535, 0.9064826, 0.09633068, 0, 0, 1, 1, 1,
0.1801576, 0.2559656, 0.1992747, 1, 0, 0, 1, 1,
0.1816473, -0.4970757, 2.901079, 1, 0, 0, 1, 1,
0.1867815, 0.5415511, 0.2628669, 1, 0, 0, 1, 1,
0.1869169, 1.020571, 0.1194748, 1, 0, 0, 1, 1,
0.1870531, 0.9891039, 1.294894, 1, 0, 0, 1, 1,
0.1891141, 1.001055, -1.576847, 0, 0, 0, 1, 1,
0.1999535, -0.8025216, 2.29164, 0, 0, 0, 1, 1,
0.2005408, -0.4781948, 1.802054, 0, 0, 0, 1, 1,
0.2011314, 1.025945, 0.9307334, 0, 0, 0, 1, 1,
0.2025908, -0.02968614, 0.5595027, 0, 0, 0, 1, 1,
0.2031721, -0.1933919, 1.409826, 0, 0, 0, 1, 1,
0.2057269, 0.2541215, -0.8793344, 0, 0, 0, 1, 1,
0.2071159, 2.253948, 0.2466987, 1, 1, 1, 1, 1,
0.2079955, 0.7173072, -0.2606828, 1, 1, 1, 1, 1,
0.2158105, -0.5727686, 2.990489, 1, 1, 1, 1, 1,
0.2203218, 0.2171983, 0.8461575, 1, 1, 1, 1, 1,
0.2210793, 1.158432, 1.456408, 1, 1, 1, 1, 1,
0.2228102, 0.1155852, 1.448905, 1, 1, 1, 1, 1,
0.2231856, -0.5797384, 3.793531, 1, 1, 1, 1, 1,
0.2321514, -1.078582, 3.183363, 1, 1, 1, 1, 1,
0.2333339, 1.586929, -1.497438, 1, 1, 1, 1, 1,
0.2333554, -0.4164096, 2.751814, 1, 1, 1, 1, 1,
0.2419653, -1.706324, 2.684922, 1, 1, 1, 1, 1,
0.2435693, 1.958513, 0.6890727, 1, 1, 1, 1, 1,
0.2464178, -0.1310575, 1.599423, 1, 1, 1, 1, 1,
0.2472804, -0.9842662, 2.197051, 1, 1, 1, 1, 1,
0.2487777, 0.658738, 1.576671, 1, 1, 1, 1, 1,
0.2491481, 0.5097269, 0.4330495, 0, 0, 1, 1, 1,
0.2529373, -1.182296, 3.10654, 1, 0, 0, 1, 1,
0.2539928, 0.2995509, 0.3916162, 1, 0, 0, 1, 1,
0.2611777, -1.559245, 2.970858, 1, 0, 0, 1, 1,
0.2619218, 0.5542793, 0.9579206, 1, 0, 0, 1, 1,
0.2634886, -1.008962, 3.746125, 1, 0, 0, 1, 1,
0.2641129, -0.4399301, 2.243365, 0, 0, 0, 1, 1,
0.2743202, -0.005555733, -1.25638, 0, 0, 0, 1, 1,
0.2778777, 0.8270236, -0.3713196, 0, 0, 0, 1, 1,
0.2780541, -0.1466845, 0.8935331, 0, 0, 0, 1, 1,
0.2809818, -0.6536098, 4.611354, 0, 0, 0, 1, 1,
0.2819093, 1.161452, -0.8697341, 0, 0, 0, 1, 1,
0.2844034, 0.2808771, 0.5076713, 0, 0, 0, 1, 1,
0.2861611, 2.206592, -0.8027996, 1, 1, 1, 1, 1,
0.2877226, 0.5246673, 1.312345, 1, 1, 1, 1, 1,
0.2903694, 1.704249, 0.1446589, 1, 1, 1, 1, 1,
0.2957169, 0.1014168, 1.595742, 1, 1, 1, 1, 1,
0.2958663, 0.6277812, 0.699169, 1, 1, 1, 1, 1,
0.2967376, -0.3764384, 1.723335, 1, 1, 1, 1, 1,
0.2977248, 0.8628302, 0.2131005, 1, 1, 1, 1, 1,
0.3020809, -0.02832917, 2.303204, 1, 1, 1, 1, 1,
0.3032086, -2.121529, 3.841269, 1, 1, 1, 1, 1,
0.3041668, -1.225525, 1.309516, 1, 1, 1, 1, 1,
0.3047918, 0.07152236, 2.035778, 1, 1, 1, 1, 1,
0.3112259, 1.478855, 0.6703911, 1, 1, 1, 1, 1,
0.3137292, 0.2816437, 1.440139, 1, 1, 1, 1, 1,
0.3143707, -1.394979, 2.683084, 1, 1, 1, 1, 1,
0.3191752, -0.1380001, 0.1100283, 1, 1, 1, 1, 1,
0.3192638, 0.9483187, 0.2073137, 0, 0, 1, 1, 1,
0.3259138, 0.8537893, 1.347288, 1, 0, 0, 1, 1,
0.3266761, 0.4176894, 2.972446, 1, 0, 0, 1, 1,
0.327915, -0.4137317, 3.998946, 1, 0, 0, 1, 1,
0.328714, 0.4155256, 1.767245, 1, 0, 0, 1, 1,
0.335228, 0.04674453, 1.74511, 1, 0, 0, 1, 1,
0.3354374, 1.180531, 1.644321, 0, 0, 0, 1, 1,
0.3373046, 1.006659, 0.06914895, 0, 0, 0, 1, 1,
0.3410652, -0.8961377, 3.529646, 0, 0, 0, 1, 1,
0.3414405, 2.093473, -0.2276714, 0, 0, 0, 1, 1,
0.3472208, 0.4059992, 1.114325, 0, 0, 0, 1, 1,
0.3480664, -0.4100431, 3.988419, 0, 0, 0, 1, 1,
0.3523529, 0.6672511, 0.866836, 0, 0, 0, 1, 1,
0.3545617, -0.2360883, -2.232063, 1, 1, 1, 1, 1,
0.3579148, -2.937026, 3.215624, 1, 1, 1, 1, 1,
0.3621393, 1.353599, -0.5764619, 1, 1, 1, 1, 1,
0.3623441, -0.4976563, 3.128778, 1, 1, 1, 1, 1,
0.3636238, -1.170401, 2.081488, 1, 1, 1, 1, 1,
0.3701421, -0.1144061, 1.42845, 1, 1, 1, 1, 1,
0.3741107, 0.4945525, 0.3749914, 1, 1, 1, 1, 1,
0.3760054, -0.2487535, 1.022385, 1, 1, 1, 1, 1,
0.3799034, 1.106037, -0.1619919, 1, 1, 1, 1, 1,
0.3800082, 0.4727803, 0.4057169, 1, 1, 1, 1, 1,
0.3906267, -1.213175, 2.873969, 1, 1, 1, 1, 1,
0.3916785, -0.2228381, 3.790468, 1, 1, 1, 1, 1,
0.3922452, -0.0481995, 3.240116, 1, 1, 1, 1, 1,
0.3939, 1.758873, -0.7130842, 1, 1, 1, 1, 1,
0.3963005, -0.3585191, 1.108727, 1, 1, 1, 1, 1,
0.3966398, 1.701907, -0.3424207, 0, 0, 1, 1, 1,
0.3975207, -0.172235, 1.757795, 1, 0, 0, 1, 1,
0.3986967, 0.7731371, -1.510185, 1, 0, 0, 1, 1,
0.408203, -0.15357, 2.20212, 1, 0, 0, 1, 1,
0.4093868, 0.9547954, 1.377054, 1, 0, 0, 1, 1,
0.4096246, 1.722787, -0.7220357, 1, 0, 0, 1, 1,
0.4099197, -1.425713, 2.644828, 0, 0, 0, 1, 1,
0.4142932, 1.012824, 1.893929, 0, 0, 0, 1, 1,
0.4168158, -0.8451624, 3.94766, 0, 0, 0, 1, 1,
0.4168659, -0.2481225, 0.6171605, 0, 0, 0, 1, 1,
0.4168849, 0.2026135, 0.3546241, 0, 0, 0, 1, 1,
0.4175545, -0.100096, 1.040012, 0, 0, 0, 1, 1,
0.4178429, -0.4240737, 1.34034, 0, 0, 0, 1, 1,
0.4269504, -0.300473, 2.412289, 1, 1, 1, 1, 1,
0.4290405, 0.694965, 0.641376, 1, 1, 1, 1, 1,
0.4310071, -0.1778221, 1.750325, 1, 1, 1, 1, 1,
0.4326852, -0.385805, 2.269547, 1, 1, 1, 1, 1,
0.4345452, -1.948663, 1.491302, 1, 1, 1, 1, 1,
0.4346595, 0.9536431, 0.6469847, 1, 1, 1, 1, 1,
0.4370071, 0.3614651, 1.91689, 1, 1, 1, 1, 1,
0.4406423, -0.4983182, 1.223017, 1, 1, 1, 1, 1,
0.4407863, -0.5088193, 3.219717, 1, 1, 1, 1, 1,
0.4420534, 0.534086, -0.9680405, 1, 1, 1, 1, 1,
0.4427091, -1.277869, 3.267101, 1, 1, 1, 1, 1,
0.448395, -0.71798, 2.768374, 1, 1, 1, 1, 1,
0.4507812, 0.7174129, 0.1355444, 1, 1, 1, 1, 1,
0.4525957, 1.10731, -0.07942773, 1, 1, 1, 1, 1,
0.4572213, 0.4329704, 0.9242895, 1, 1, 1, 1, 1,
0.457302, -1.348906, 2.331123, 0, 0, 1, 1, 1,
0.4644154, 0.4801613, 1.769301, 1, 0, 0, 1, 1,
0.4651914, 0.1552959, 1.266384, 1, 0, 0, 1, 1,
0.4662237, -0.4340159, 2.17555, 1, 0, 0, 1, 1,
0.469047, 0.8412749, -1.2465, 1, 0, 0, 1, 1,
0.4694936, -0.03970574, 0.9580703, 1, 0, 0, 1, 1,
0.46991, -0.3281918, 0.4633504, 0, 0, 0, 1, 1,
0.4702775, -1.50627, 5.015565, 0, 0, 0, 1, 1,
0.4710444, 1.311523, 1.086026, 0, 0, 0, 1, 1,
0.4714135, 0.6173821, 1.564056, 0, 0, 0, 1, 1,
0.4722882, 0.5262877, 0.4029727, 0, 0, 0, 1, 1,
0.472627, -0.9361928, 3.163705, 0, 0, 0, 1, 1,
0.4825632, 2.959196, 1.179825, 0, 0, 0, 1, 1,
0.4884752, 0.9566176, 0.2548581, 1, 1, 1, 1, 1,
0.4911332, -1.874424, 1.353217, 1, 1, 1, 1, 1,
0.4924678, -0.6102172, 3.04124, 1, 1, 1, 1, 1,
0.4949465, 0.8088003, 0.358226, 1, 1, 1, 1, 1,
0.4954657, 1.485072, 0.03683478, 1, 1, 1, 1, 1,
0.4956819, 0.5132231, 0.3800951, 1, 1, 1, 1, 1,
0.4967279, -0.6766817, 0.6879461, 1, 1, 1, 1, 1,
0.4969037, 1.138726, -0.1446071, 1, 1, 1, 1, 1,
0.4974496, -1.219147, 2.403153, 1, 1, 1, 1, 1,
0.5000917, 0.9105282, 1.126988, 1, 1, 1, 1, 1,
0.5025735, -0.4849441, 0.7381554, 1, 1, 1, 1, 1,
0.5062199, 0.9328983, -1.049984, 1, 1, 1, 1, 1,
0.5117033, -1.119099, 2.663287, 1, 1, 1, 1, 1,
0.5121093, -0.6606644, 2.459034, 1, 1, 1, 1, 1,
0.5182062, 2.661886, 0.9771257, 1, 1, 1, 1, 1,
0.5182499, 0.3274014, 0.6383048, 0, 0, 1, 1, 1,
0.5183481, -1.560613, 2.865526, 1, 0, 0, 1, 1,
0.5197188, -1.188697, 2.725368, 1, 0, 0, 1, 1,
0.5228145, -0.03877256, 0.7076381, 1, 0, 0, 1, 1,
0.5241283, 1.132152, 0.9339519, 1, 0, 0, 1, 1,
0.5253474, -1.46652, 4.124031, 1, 0, 0, 1, 1,
0.5274364, 0.6176736, 0.4254215, 0, 0, 0, 1, 1,
0.5280682, -0.6828938, 1.540767, 0, 0, 0, 1, 1,
0.5311095, -0.2202584, 1.791827, 0, 0, 0, 1, 1,
0.5322994, 0.9753975, 0.03998267, 0, 0, 0, 1, 1,
0.535551, 0.6570529, -1.188816, 0, 0, 0, 1, 1,
0.5398798, 0.6949341, 0.6157014, 0, 0, 0, 1, 1,
0.5458995, 0.0862108, 1.799993, 0, 0, 0, 1, 1,
0.5487907, -0.3690429, 1.874364, 1, 1, 1, 1, 1,
0.5538006, 0.8063833, 0.2964834, 1, 1, 1, 1, 1,
0.5583199, 0.3589615, 0.9531912, 1, 1, 1, 1, 1,
0.563161, 0.4106314, 0.6697918, 1, 1, 1, 1, 1,
0.5665882, -1.502148, 0.6797396, 1, 1, 1, 1, 1,
0.5673775, 0.1597674, 0.9771898, 1, 1, 1, 1, 1,
0.5686058, -0.9794342, 1.548489, 1, 1, 1, 1, 1,
0.5704433, 0.7125246, 0.669058, 1, 1, 1, 1, 1,
0.5733879, -1.215135, 1.512815, 1, 1, 1, 1, 1,
0.577667, -0.4801858, 1.391818, 1, 1, 1, 1, 1,
0.5866441, -0.9461146, 2.804582, 1, 1, 1, 1, 1,
0.5903335, -1.12788, 3.739636, 1, 1, 1, 1, 1,
0.593488, 1.244862, 1.271229, 1, 1, 1, 1, 1,
0.5968942, 0.5790343, -0.1852224, 1, 1, 1, 1, 1,
0.5972558, 1.724916, 1.752055, 1, 1, 1, 1, 1,
0.5976174, 0.5391204, 1.610931, 0, 0, 1, 1, 1,
0.6011679, -1.66187, 1.785034, 1, 0, 0, 1, 1,
0.6017336, 0.7494274, 1.860013, 1, 0, 0, 1, 1,
0.6052613, -0.3733708, 0.5006394, 1, 0, 0, 1, 1,
0.6073474, 0.2810491, 0.003104199, 1, 0, 0, 1, 1,
0.6102527, 2.233027, 1.19619, 1, 0, 0, 1, 1,
0.6139576, 0.3878926, 2.255365, 0, 0, 0, 1, 1,
0.614657, -0.1248477, 1.004671, 0, 0, 0, 1, 1,
0.6156422, 2.649101, 0.02988748, 0, 0, 0, 1, 1,
0.6157939, -1.138123, 2.99926, 0, 0, 0, 1, 1,
0.6174794, 1.405105, -0.984846, 0, 0, 0, 1, 1,
0.6204765, -0.05719073, 2.073875, 0, 0, 0, 1, 1,
0.6213495, 0.2176346, 0.8486815, 0, 0, 0, 1, 1,
0.6224753, 0.3445641, 0.9406278, 1, 1, 1, 1, 1,
0.6224988, 0.4870613, 0.47536, 1, 1, 1, 1, 1,
0.6227561, 1.237964, 0.3195725, 1, 1, 1, 1, 1,
0.6236399, 1.691526, 0.6914215, 1, 1, 1, 1, 1,
0.6308548, 1.168033, -1.136677, 1, 1, 1, 1, 1,
0.6360018, 1.054795, 0.5224916, 1, 1, 1, 1, 1,
0.6401159, -1.395056, 0.6738281, 1, 1, 1, 1, 1,
0.6462463, 1.029115, 2.344385, 1, 1, 1, 1, 1,
0.6518439, -0.7754508, 2.182356, 1, 1, 1, 1, 1,
0.6610202, -0.8065423, 1.308519, 1, 1, 1, 1, 1,
0.6636001, -0.4004724, 2.069094, 1, 1, 1, 1, 1,
0.6675452, 2.205826, 0.1071659, 1, 1, 1, 1, 1,
0.6706301, 0.05091994, 0.8181725, 1, 1, 1, 1, 1,
0.6724023, -0.7090209, 3.396007, 1, 1, 1, 1, 1,
0.6737123, 1.304239, 0.5224789, 1, 1, 1, 1, 1,
0.6793306, -0.7074658, 4.688178, 0, 0, 1, 1, 1,
0.6799574, -1.925069, 1.901571, 1, 0, 0, 1, 1,
0.6841138, 0.3692149, 1.396472, 1, 0, 0, 1, 1,
0.6934744, -1.099409, 1.096778, 1, 0, 0, 1, 1,
0.6976816, -0.8468108, 2.617156, 1, 0, 0, 1, 1,
0.698123, 1.12301, 0.2719549, 1, 0, 0, 1, 1,
0.7029651, 0.2172393, 2.009392, 0, 0, 0, 1, 1,
0.7045937, -1.04473, 2.530388, 0, 0, 0, 1, 1,
0.7129632, 1.770531, -0.5472269, 0, 0, 0, 1, 1,
0.727258, 1.559917, -0.8400715, 0, 0, 0, 1, 1,
0.7278154, -1.656963, 1.559894, 0, 0, 0, 1, 1,
0.7319946, -0.1683837, 1.519409, 0, 0, 0, 1, 1,
0.7343137, -0.7826933, 2.26984, 0, 0, 0, 1, 1,
0.7384593, 0.595429, -0.9323273, 1, 1, 1, 1, 1,
0.7408887, -0.805028, 3.337742, 1, 1, 1, 1, 1,
0.7416614, -1.080786, 3.823972, 1, 1, 1, 1, 1,
0.7458942, -2.522228, 3.282747, 1, 1, 1, 1, 1,
0.7459717, 1.283847, 0.2699403, 1, 1, 1, 1, 1,
0.7503343, 0.3194867, -0.1173819, 1, 1, 1, 1, 1,
0.7516417, -0.268021, 1.596049, 1, 1, 1, 1, 1,
0.7519984, 1.553289, 1.101454, 1, 1, 1, 1, 1,
0.7566826, 0.05298657, 2.597053, 1, 1, 1, 1, 1,
0.7596916, 1.010146, 2.134349, 1, 1, 1, 1, 1,
0.7747701, -0.5638506, 3.803306, 1, 1, 1, 1, 1,
0.778536, 2.016224, -0.5792727, 1, 1, 1, 1, 1,
0.787513, 0.9025099, 1.315971, 1, 1, 1, 1, 1,
0.7981122, -0.17523, 0.6979198, 1, 1, 1, 1, 1,
0.8057454, -0.7218493, 2.579266, 1, 1, 1, 1, 1,
0.8077072, -1.0913, 1.473307, 0, 0, 1, 1, 1,
0.8088943, -0.08434968, 0.5421133, 1, 0, 0, 1, 1,
0.8122498, 0.05433834, 1.259878, 1, 0, 0, 1, 1,
0.813164, -0.6212064, 3.339112, 1, 0, 0, 1, 1,
0.8144743, 1.801635, 0.9262074, 1, 0, 0, 1, 1,
0.8176758, -2.122294, 3.087616, 1, 0, 0, 1, 1,
0.8185003, -0.2458487, 0.7835183, 0, 0, 0, 1, 1,
0.8188134, -0.1651622, -0.008259654, 0, 0, 0, 1, 1,
0.8193917, 0.5699368, 0.4299382, 0, 0, 0, 1, 1,
0.8229049, -0.1480157, 3.087633, 0, 0, 0, 1, 1,
0.8287911, -1.61883, 4.03053, 0, 0, 0, 1, 1,
0.8288457, -2.281185, 2.995319, 0, 0, 0, 1, 1,
0.8351938, 0.8679693, 0.329349, 0, 0, 0, 1, 1,
0.8383869, 1.168854, 1.714308, 1, 1, 1, 1, 1,
0.8390538, -0.7576129, -0.1922653, 1, 1, 1, 1, 1,
0.8412357, 0.5535991, 2.378525, 1, 1, 1, 1, 1,
0.8428253, -0.09910831, 1.025037, 1, 1, 1, 1, 1,
0.8515813, -0.5150529, 3.086398, 1, 1, 1, 1, 1,
0.8590912, 1.13988, 0.5484158, 1, 1, 1, 1, 1,
0.8608837, -0.1947212, 1.092761, 1, 1, 1, 1, 1,
0.8616599, 0.2043166, 2.241874, 1, 1, 1, 1, 1,
0.8668665, -1.211747, 1.935407, 1, 1, 1, 1, 1,
0.8735074, -1.000114, 1.564541, 1, 1, 1, 1, 1,
0.8819417, -0.6040912, 3.032081, 1, 1, 1, 1, 1,
0.8856, -0.481969, 2.763182, 1, 1, 1, 1, 1,
0.8898127, 0.7486636, -0.06814094, 1, 1, 1, 1, 1,
0.8996181, 1.947099, 1.074669, 1, 1, 1, 1, 1,
0.9003495, -0.9832253, 2.302029, 1, 1, 1, 1, 1,
0.9011084, -1.987101, 1.427308, 0, 0, 1, 1, 1,
0.9023341, 0.2092765, 0.5172966, 1, 0, 0, 1, 1,
0.904977, -1.842306, 2.883176, 1, 0, 0, 1, 1,
0.9074023, -0.3316093, 2.922321, 1, 0, 0, 1, 1,
0.9130213, -0.3705851, 3.127994, 1, 0, 0, 1, 1,
0.9130535, -2.677599, 3.216819, 1, 0, 0, 1, 1,
0.9154556, -0.04227186, 0.3354561, 0, 0, 0, 1, 1,
0.9175547, 2.136177, 0.7266676, 0, 0, 0, 1, 1,
0.9207697, -0.2834429, 1.223436, 0, 0, 0, 1, 1,
0.9246958, -0.7341951, 0.7336243, 0, 0, 0, 1, 1,
0.9297407, -0.8322535, 2.685636, 0, 0, 0, 1, 1,
0.9311084, 1.55916, -0.5350367, 0, 0, 0, 1, 1,
0.9371658, 0.3489116, 1.467859, 0, 0, 0, 1, 1,
0.9450137, 0.2847459, 0.6298096, 1, 1, 1, 1, 1,
0.9493363, -0.6669983, 3.522555, 1, 1, 1, 1, 1,
0.9523256, 0.4355038, 0.4157296, 1, 1, 1, 1, 1,
0.9525295, 1.738054, -0.1624116, 1, 1, 1, 1, 1,
0.9574717, -0.5763416, 2.710947, 1, 1, 1, 1, 1,
0.9576411, 0.4616857, 0.6456735, 1, 1, 1, 1, 1,
0.9627239, 0.6772757, 2.472929, 1, 1, 1, 1, 1,
0.9647922, 0.006790642, 1.711647, 1, 1, 1, 1, 1,
0.9665393, -1.666507, 3.126154, 1, 1, 1, 1, 1,
0.9709293, 1.376764, -0.9143708, 1, 1, 1, 1, 1,
0.9743579, 0.9660484, 2.714522, 1, 1, 1, 1, 1,
0.9743628, -0.04838649, 1.262195, 1, 1, 1, 1, 1,
0.9800709, -1.378968, 2.126425, 1, 1, 1, 1, 1,
0.9820924, 2.564057, 0.8157645, 1, 1, 1, 1, 1,
0.9854243, 0.6174335, 1.773507, 1, 1, 1, 1, 1,
0.994531, 1.796706, 0.108671, 0, 0, 1, 1, 1,
0.9972941, 0.4931977, 0.7163022, 1, 0, 0, 1, 1,
0.9981376, -1.330765, 1.555211, 1, 0, 0, 1, 1,
1.004324, 2.070966, 1.602163, 1, 0, 0, 1, 1,
1.006383, 0.07206145, 2.165331, 1, 0, 0, 1, 1,
1.009175, 0.6563565, 2.530172, 1, 0, 0, 1, 1,
1.030744, -0.2855176, 1.021056, 0, 0, 0, 1, 1,
1.033648, 0.9402598, -0.2423606, 0, 0, 0, 1, 1,
1.037969, -1.10111, 2.208962, 0, 0, 0, 1, 1,
1.038091, 2.190669, -0.03511697, 0, 0, 0, 1, 1,
1.038955, -0.7266731, 3.34757, 0, 0, 0, 1, 1,
1.044605, 0.06485584, 2.386431, 0, 0, 0, 1, 1,
1.059549, -1.411946, 2.172192, 0, 0, 0, 1, 1,
1.065188, 0.2795035, 2.322203, 1, 1, 1, 1, 1,
1.065992, 1.019879, 1.250518, 1, 1, 1, 1, 1,
1.067631, -0.4192573, 2.655367, 1, 1, 1, 1, 1,
1.071438, -1.404666, 1.855983, 1, 1, 1, 1, 1,
1.075503, -0.6502793, 2.736633, 1, 1, 1, 1, 1,
1.075783, 1.055031, 0.3595948, 1, 1, 1, 1, 1,
1.079033, 1.779088, -2.175652, 1, 1, 1, 1, 1,
1.080835, -1.006386, 1.809346, 1, 1, 1, 1, 1,
1.081364, -0.3174898, 3.386159, 1, 1, 1, 1, 1,
1.092389, -0.3688695, 2.591478, 1, 1, 1, 1, 1,
1.096452, -0.8778743, 3.080662, 1, 1, 1, 1, 1,
1.097599, -0.9736376, 2.922187, 1, 1, 1, 1, 1,
1.098485, -2.053369, 2.2491, 1, 1, 1, 1, 1,
1.102364, 1.480349, 2.669385, 1, 1, 1, 1, 1,
1.102665, 1.412575, 0.1767751, 1, 1, 1, 1, 1,
1.115452, -0.5062012, 2.156862, 0, 0, 1, 1, 1,
1.123708, -0.03442296, 1.097046, 1, 0, 0, 1, 1,
1.128587, 0.2159153, 0.34639, 1, 0, 0, 1, 1,
1.140365, 0.4529153, 1.270752, 1, 0, 0, 1, 1,
1.156521, 0.3530865, -0.2797496, 1, 0, 0, 1, 1,
1.160489, 0.9109742, 1.442652, 1, 0, 0, 1, 1,
1.174183, -0.8234259, 2.831055, 0, 0, 0, 1, 1,
1.180993, -0.9757099, 0.7794864, 0, 0, 0, 1, 1,
1.181293, 0.3808139, 0.8409423, 0, 0, 0, 1, 1,
1.189634, -1.355951, 2.238238, 0, 0, 0, 1, 1,
1.190816, 0.7711644, 0.6449625, 0, 0, 0, 1, 1,
1.193676, -0.6187117, 1.817173, 0, 0, 0, 1, 1,
1.202383, 0.534611, 2.432688, 0, 0, 0, 1, 1,
1.20367, -0.1549146, 1.089739, 1, 1, 1, 1, 1,
1.216825, 0.1625254, 2.017495, 1, 1, 1, 1, 1,
1.237453, 0.3582183, -0.9592094, 1, 1, 1, 1, 1,
1.264026, -0.09289094, -0.1631616, 1, 1, 1, 1, 1,
1.2699, -1.599004, 2.659629, 1, 1, 1, 1, 1,
1.277001, -0.6267071, 1.749273, 1, 1, 1, 1, 1,
1.283147, -1.091561, -0.9258892, 1, 1, 1, 1, 1,
1.292247, 1.375753, 1.305203, 1, 1, 1, 1, 1,
1.293218, 1.542761, -1.018998, 1, 1, 1, 1, 1,
1.302177, -1.001654, 0.2193603, 1, 1, 1, 1, 1,
1.303532, -0.1173064, -0.4331988, 1, 1, 1, 1, 1,
1.307899, 1.050943, -0.4607456, 1, 1, 1, 1, 1,
1.309716, 0.5516176, 0.6313524, 1, 1, 1, 1, 1,
1.311229, 1.227624, 0.3655602, 1, 1, 1, 1, 1,
1.315768, 0.2883365, 0.2570645, 1, 1, 1, 1, 1,
1.325909, 1.00607, 1.170716, 0, 0, 1, 1, 1,
1.335352, -0.8701813, 2.57209, 1, 0, 0, 1, 1,
1.341628, 0.1575209, 1.211638, 1, 0, 0, 1, 1,
1.349465, 1.178032, -0.4371893, 1, 0, 0, 1, 1,
1.35245, -0.7612927, 2.628738, 1, 0, 0, 1, 1,
1.360269, -1.36629, 1.945951, 1, 0, 0, 1, 1,
1.365882, -2.19102, 1.240374, 0, 0, 0, 1, 1,
1.371984, 1.572196, 0.937732, 0, 0, 0, 1, 1,
1.405246, 0.355656, 1.889551, 0, 0, 0, 1, 1,
1.410829, -0.2907056, 2.591964, 0, 0, 0, 1, 1,
1.419186, -0.8503633, 3.637177, 0, 0, 0, 1, 1,
1.424138, -0.3216772, 1.426325, 0, 0, 0, 1, 1,
1.434917, 0.5378705, -0.143628, 0, 0, 0, 1, 1,
1.438153, -0.0244674, 0.3171676, 1, 1, 1, 1, 1,
1.440943, 1.142865, 1.62553, 1, 1, 1, 1, 1,
1.448335, -0.4314989, 2.101641, 1, 1, 1, 1, 1,
1.449695, -0.5464005, 0.7351123, 1, 1, 1, 1, 1,
1.455163, 0.956478, 3.09596, 1, 1, 1, 1, 1,
1.472381, -0.6948955, 5.092408, 1, 1, 1, 1, 1,
1.479827, 0.6397551, 1.615926, 1, 1, 1, 1, 1,
1.487602, 1.237307, 0.3472745, 1, 1, 1, 1, 1,
1.4915, -1.835121, 2.844801, 1, 1, 1, 1, 1,
1.49677, 0.1271791, 0.09020505, 1, 1, 1, 1, 1,
1.503573, 0.1987357, -0.9889662, 1, 1, 1, 1, 1,
1.508666, 0.8624794, 1.362274, 1, 1, 1, 1, 1,
1.509793, 0.3117763, 0.9738355, 1, 1, 1, 1, 1,
1.511785, 1.410669, 0.8944535, 1, 1, 1, 1, 1,
1.52761, -1.197706, 2.165241, 1, 1, 1, 1, 1,
1.528406, -1.279474, 1.438376, 0, 0, 1, 1, 1,
1.530132, -0.9235042, 2.400593, 1, 0, 0, 1, 1,
1.539355, 0.7497604, 0.5281239, 1, 0, 0, 1, 1,
1.561289, 1.453691, 1.93568, 1, 0, 0, 1, 1,
1.563229, 1.402713, 0.612719, 1, 0, 0, 1, 1,
1.564501, -0.6852126, 1.829236, 1, 0, 0, 1, 1,
1.565651, -0.09914307, 2.443954, 0, 0, 0, 1, 1,
1.575232, 1.438811, 2.108049, 0, 0, 0, 1, 1,
1.588297, -2.524464, 2.613332, 0, 0, 0, 1, 1,
1.605152, -0.4075779, 2.796812, 0, 0, 0, 1, 1,
1.610039, -0.08688343, 0.5507637, 0, 0, 0, 1, 1,
1.627, 0.5186397, 1.292676, 0, 0, 0, 1, 1,
1.628766, -1.061694, 2.49116, 0, 0, 0, 1, 1,
1.635112, 0.2506269, -0.3868695, 1, 1, 1, 1, 1,
1.651037, -0.358026, 3.061499, 1, 1, 1, 1, 1,
1.655187, -0.6347264, 2.701956, 1, 1, 1, 1, 1,
1.671875, -0.07311732, 0.6814883, 1, 1, 1, 1, 1,
1.681322, 2.000066, 2.584138, 1, 1, 1, 1, 1,
1.683092, 0.03817907, 1.221036, 1, 1, 1, 1, 1,
1.692069, -0.8029583, 1.021639, 1, 1, 1, 1, 1,
1.700696, -0.1267661, 1.454033, 1, 1, 1, 1, 1,
1.706094, 1.792957, 0.938248, 1, 1, 1, 1, 1,
1.715136, -0.9446128, 3.642792, 1, 1, 1, 1, 1,
1.726821, -0.642427, 1.559836, 1, 1, 1, 1, 1,
1.727731, -0.2728536, 1.112851, 1, 1, 1, 1, 1,
1.758491, -0.1952386, 1.934645, 1, 1, 1, 1, 1,
1.785147, 2.427185, 0.2975453, 1, 1, 1, 1, 1,
1.786217, 0.08108023, 0.2613259, 1, 1, 1, 1, 1,
1.793409, 1.394473, -0.04175218, 0, 0, 1, 1, 1,
1.814901, -1.30434, 1.873532, 1, 0, 0, 1, 1,
1.833993, -0.819526, 2.508597, 1, 0, 0, 1, 1,
1.836701, 0.8946652, 2.254312, 1, 0, 0, 1, 1,
1.838833, 0.105584, 2.326167, 1, 0, 0, 1, 1,
1.844449, 0.8172574, 1.468646, 1, 0, 0, 1, 1,
1.857231, 0.7793688, 1.228212, 0, 0, 0, 1, 1,
1.85918, 0.3637169, 2.492133, 0, 0, 0, 1, 1,
1.875658, 2.851173, 0.9763213, 0, 0, 0, 1, 1,
1.885444, 0.2272073, 1.78642, 0, 0, 0, 1, 1,
1.89646, -1.145707, 1.456316, 0, 0, 0, 1, 1,
1.911073, 1.255749, -0.2240274, 0, 0, 0, 1, 1,
1.924662, -1.207491, 2.801028, 0, 0, 0, 1, 1,
1.930623, 0.2948804, 0.7136914, 1, 1, 1, 1, 1,
1.933907, 0.06082246, 1.299107, 1, 1, 1, 1, 1,
1.935827, -0.2402943, 0.6941316, 1, 1, 1, 1, 1,
1.939737, -1.558359, 4.536426, 1, 1, 1, 1, 1,
1.942022, -0.7076684, 0.26548, 1, 1, 1, 1, 1,
1.959119, 1.230169, 0.4123878, 1, 1, 1, 1, 1,
1.96316, 0.6524205, 1.263425, 1, 1, 1, 1, 1,
1.99551, -1.054469, 3.51631, 1, 1, 1, 1, 1,
1.998931, 1.557131, 1.112977, 1, 1, 1, 1, 1,
2.116894, 1.075365, 1.05806, 1, 1, 1, 1, 1,
2.118189, 0.3032894, 0.9352397, 1, 1, 1, 1, 1,
2.128177, 1.138768, 1.711947, 1, 1, 1, 1, 1,
2.144684, 2.374862, 2.201176, 1, 1, 1, 1, 1,
2.14753, 0.631057, -0.3503969, 1, 1, 1, 1, 1,
2.170804, -1.542576, 3.644861, 1, 1, 1, 1, 1,
2.172531, 0.1961847, 0.9346874, 0, 0, 1, 1, 1,
2.23806, 0.548474, 2.66355, 1, 0, 0, 1, 1,
2.264774, -0.7772226, -0.1649675, 1, 0, 0, 1, 1,
2.303297, 0.5708973, 0.6463861, 1, 0, 0, 1, 1,
2.313267, -1.861671, 3.730092, 1, 0, 0, 1, 1,
2.336035, -0.5119907, 2.321518, 1, 0, 0, 1, 1,
2.356747, 0.6669358, 0.648586, 0, 0, 0, 1, 1,
2.377239, 0.5657395, 1.876544, 0, 0, 0, 1, 1,
2.387496, -0.0373762, 1.146293, 0, 0, 0, 1, 1,
2.403714, -2.100675, 2.40438, 0, 0, 0, 1, 1,
2.49877, 0.1066982, 1.297114, 0, 0, 0, 1, 1,
2.520686, 0.4617674, 1.558433, 0, 0, 0, 1, 1,
2.642057, 1.345363, 0.5665389, 0, 0, 0, 1, 1,
2.664443, 0.1222989, 0.4620645, 1, 1, 1, 1, 1,
2.703581, -0.3611968, 2.447237, 1, 1, 1, 1, 1,
2.728921, 0.8543789, 1.564536, 1, 1, 1, 1, 1,
3.032813, 0.8916635, 2.480776, 1, 1, 1, 1, 1,
3.238922, 0.3200017, 2.646155, 1, 1, 1, 1, 1,
3.275951, 0.2330577, 1.281176, 1, 1, 1, 1, 1,
3.986968, 1.043846, 1.169821, 1, 1, 1, 1, 1
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
var radius = 9.988145;
var distance = 35.08294;
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
mvMatrix.translate( -0.3684831, -0.1096845, 0.228338 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.08294);
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
