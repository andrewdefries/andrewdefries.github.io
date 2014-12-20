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
-3.151218, -0.5613395, -1.638229, 1, 0, 0, 1,
-2.915386, 0.4340909, -0.2234219, 1, 0.007843138, 0, 1,
-2.898336, 0.5165625, -0.5791968, 1, 0.01176471, 0, 1,
-2.739789, -0.1651053, -2.139142, 1, 0.01960784, 0, 1,
-2.651234, 0.926428, -0.2685247, 1, 0.02352941, 0, 1,
-2.538635, -0.687097, -1.636774, 1, 0.03137255, 0, 1,
-2.512781, 0.05353532, -1.035969, 1, 0.03529412, 0, 1,
-2.491502, -0.5666543, -1.286725, 1, 0.04313726, 0, 1,
-2.403417, 0.4676295, -2.27867, 1, 0.04705882, 0, 1,
-2.401461, 1.631168, -1.430265, 1, 0.05490196, 0, 1,
-2.370173, 0.9050656, -1.59652, 1, 0.05882353, 0, 1,
-2.274623, 0.1936659, -1.037692, 1, 0.06666667, 0, 1,
-2.25645, 1.071119, -0.8585791, 1, 0.07058824, 0, 1,
-2.190368, 1.396346, -2.479674, 1, 0.07843138, 0, 1,
-2.162277, -0.6625571, -2.230396, 1, 0.08235294, 0, 1,
-2.142323, 0.6802681, -2.172549, 1, 0.09019608, 0, 1,
-2.070827, -0.4970592, -3.208697, 1, 0.09411765, 0, 1,
-2.06049, 0.9191323, -2.263592, 1, 0.1019608, 0, 1,
-2.040515, 0.0604816, -2.479863, 1, 0.1098039, 0, 1,
-2.003667, 0.002723081, -2.199099, 1, 0.1137255, 0, 1,
-1.968881, -1.681636, -2.471412, 1, 0.1215686, 0, 1,
-1.926326, -0.5602719, -2.453959, 1, 0.1254902, 0, 1,
-1.905816, 1.128436, 0.2759555, 1, 0.1333333, 0, 1,
-1.903929, 0.921909, -0.6485883, 1, 0.1372549, 0, 1,
-1.901104, -0.9875304, -2.616031, 1, 0.145098, 0, 1,
-1.886273, -1.546605, -2.245255, 1, 0.1490196, 0, 1,
-1.878362, 1.704043, -0.5245259, 1, 0.1568628, 0, 1,
-1.862279, -0.5953501, -1.854234, 1, 0.1607843, 0, 1,
-1.844364, -0.386212, -0.1624189, 1, 0.1686275, 0, 1,
-1.827617, -1.804268, -2.506145, 1, 0.172549, 0, 1,
-1.826433, -0.6082904, -1.223902, 1, 0.1803922, 0, 1,
-1.817373, -0.8482131, -1.550313, 1, 0.1843137, 0, 1,
-1.813184, -0.8359962, -2.233922, 1, 0.1921569, 0, 1,
-1.811997, 0.4000107, -1.791893, 1, 0.1960784, 0, 1,
-1.805559, 0.2052941, -2.736675, 1, 0.2039216, 0, 1,
-1.800513, 0.03491645, -0.07557917, 1, 0.2117647, 0, 1,
-1.799359, 1.058104, 0.4728963, 1, 0.2156863, 0, 1,
-1.738657, -0.4770569, -3.997483, 1, 0.2235294, 0, 1,
-1.733924, 0.9806525, -1.547318, 1, 0.227451, 0, 1,
-1.732191, -0.5925092, -3.591924, 1, 0.2352941, 0, 1,
-1.721713, 0.3297489, -0.9830287, 1, 0.2392157, 0, 1,
-1.706863, -0.6753412, -0.5322325, 1, 0.2470588, 0, 1,
-1.701473, 0.3434678, -2.028006, 1, 0.2509804, 0, 1,
-1.692088, 0.6169873, -2.054433, 1, 0.2588235, 0, 1,
-1.663706, 0.5047765, -2.602324, 1, 0.2627451, 0, 1,
-1.661866, -1.693709, -2.944258, 1, 0.2705882, 0, 1,
-1.638435, 0.7960036, -0.3763761, 1, 0.2745098, 0, 1,
-1.618011, 1.518551, 0.1332578, 1, 0.282353, 0, 1,
-1.617981, 0.2472505, -2.136886, 1, 0.2862745, 0, 1,
-1.612248, -0.1021716, -2.113639, 1, 0.2941177, 0, 1,
-1.584184, 0.4526785, 0.9951178, 1, 0.3019608, 0, 1,
-1.579422, -1.753837, -3.077522, 1, 0.3058824, 0, 1,
-1.575873, 1.342987, -1.8572, 1, 0.3137255, 0, 1,
-1.572609, 0.6188658, -2.770185, 1, 0.3176471, 0, 1,
-1.564113, 1.709637, 0.8042541, 1, 0.3254902, 0, 1,
-1.562016, 0.9161322, -0.8047968, 1, 0.3294118, 0, 1,
-1.549325, -0.1962976, -0.3804581, 1, 0.3372549, 0, 1,
-1.538939, -0.492666, -2.464, 1, 0.3411765, 0, 1,
-1.538338, -0.4612494, -0.7418896, 1, 0.3490196, 0, 1,
-1.527038, 0.8307884, -1.922388, 1, 0.3529412, 0, 1,
-1.526256, 1.070894, -0.2966503, 1, 0.3607843, 0, 1,
-1.509094, 0.463699, -0.958227, 1, 0.3647059, 0, 1,
-1.505636, -1.821819, -1.844488, 1, 0.372549, 0, 1,
-1.488072, -0.1660534, -1.147187, 1, 0.3764706, 0, 1,
-1.468804, 0.7692197, -1.30629, 1, 0.3843137, 0, 1,
-1.454754, 0.614812, -1.333907, 1, 0.3882353, 0, 1,
-1.450907, -0.1462477, -2.954007, 1, 0.3960784, 0, 1,
-1.445757, -0.4053602, -2.551715, 1, 0.4039216, 0, 1,
-1.444304, -0.1865335, -0.3497201, 1, 0.4078431, 0, 1,
-1.427679, -0.6940604, -1.604034, 1, 0.4156863, 0, 1,
-1.420172, 1.370041, -0.6154766, 1, 0.4196078, 0, 1,
-1.414618, 0.5335504, -0.6837175, 1, 0.427451, 0, 1,
-1.41043, 0.2299268, 0.3368644, 1, 0.4313726, 0, 1,
-1.404412, 0.9276562, -1.418979, 1, 0.4392157, 0, 1,
-1.402772, -0.07529724, -1.890169, 1, 0.4431373, 0, 1,
-1.394362, 0.3739067, -1.416545, 1, 0.4509804, 0, 1,
-1.377699, 0.5377584, -1.259765, 1, 0.454902, 0, 1,
-1.370376, 1.411097, -1.457397, 1, 0.4627451, 0, 1,
-1.365218, -1.034374, -1.46211, 1, 0.4666667, 0, 1,
-1.362212, -0.3315269, -1.768979, 1, 0.4745098, 0, 1,
-1.360656, -0.1408758, -1.103312, 1, 0.4784314, 0, 1,
-1.356786, 0.6456942, -1.546533, 1, 0.4862745, 0, 1,
-1.349114, 0.9089971, -0.8319561, 1, 0.4901961, 0, 1,
-1.338978, 1.109883, -0.8838365, 1, 0.4980392, 0, 1,
-1.329283, 0.2629348, -1.275752, 1, 0.5058824, 0, 1,
-1.322197, 0.2778108, -0.1011876, 1, 0.509804, 0, 1,
-1.319629, 1.882195, 0.09363498, 1, 0.5176471, 0, 1,
-1.319511, -1.168394, -0.9445916, 1, 0.5215687, 0, 1,
-1.312013, -0.7724015, 0.5228571, 1, 0.5294118, 0, 1,
-1.297856, 0.6141713, -1.15901, 1, 0.5333334, 0, 1,
-1.296755, 0.4473835, -1.308994, 1, 0.5411765, 0, 1,
-1.294802, -0.159592, -2.158682, 1, 0.5450981, 0, 1,
-1.290871, 0.2684031, -1.02417, 1, 0.5529412, 0, 1,
-1.290131, -0.1883688, -1.760456, 1, 0.5568628, 0, 1,
-1.253021, -0.4911087, -2.068084, 1, 0.5647059, 0, 1,
-1.24998, 0.394303, -0.2319977, 1, 0.5686275, 0, 1,
-1.238466, 0.5570487, -3.089901, 1, 0.5764706, 0, 1,
-1.230744, -1.599464, -3.346327, 1, 0.5803922, 0, 1,
-1.229479, 0.5086704, -1.24709, 1, 0.5882353, 0, 1,
-1.229429, 0.3423072, -2.127736, 1, 0.5921569, 0, 1,
-1.225967, 0.2490694, -2.314341, 1, 0.6, 0, 1,
-1.221787, -0.7363545, -2.987105, 1, 0.6078432, 0, 1,
-1.217716, -1.531794, -1.878358, 1, 0.6117647, 0, 1,
-1.214526, -0.6474832, -2.198403, 1, 0.6196079, 0, 1,
-1.211736, 0.5085002, -2.565666, 1, 0.6235294, 0, 1,
-1.210674, 0.451522, -1.572203, 1, 0.6313726, 0, 1,
-1.209109, -0.5367818, -0.1480161, 1, 0.6352941, 0, 1,
-1.20616, -0.8718479, -1.92596, 1, 0.6431373, 0, 1,
-1.202221, 0.4477028, -0.9900854, 1, 0.6470588, 0, 1,
-1.200164, 0.9393139, -2.703947, 1, 0.654902, 0, 1,
-1.179438, 1.393682, 0.2749181, 1, 0.6588235, 0, 1,
-1.179121, 1.432253, -0.3182032, 1, 0.6666667, 0, 1,
-1.171857, -1.402238, -2.550481, 1, 0.6705883, 0, 1,
-1.1717, 0.05727581, -1.238915, 1, 0.6784314, 0, 1,
-1.169257, 0.5869473, -1.028419, 1, 0.682353, 0, 1,
-1.166983, 0.2320317, 0.351688, 1, 0.6901961, 0, 1,
-1.154757, -0.4411116, -2.046174, 1, 0.6941177, 0, 1,
-1.143838, 0.2811707, -1.837679, 1, 0.7019608, 0, 1,
-1.140965, -0.3885995, -0.9467644, 1, 0.7098039, 0, 1,
-1.140183, 0.8733983, -2.832226, 1, 0.7137255, 0, 1,
-1.139452, -0.4419904, -1.542037, 1, 0.7215686, 0, 1,
-1.138123, -0.7332997, -2.352395, 1, 0.7254902, 0, 1,
-1.135469, 0.3589166, -1.041759, 1, 0.7333333, 0, 1,
-1.133412, -0.7405541, -1.264629, 1, 0.7372549, 0, 1,
-1.123794, -0.2975852, -1.384497, 1, 0.7450981, 0, 1,
-1.117278, -0.8436232, -0.722133, 1, 0.7490196, 0, 1,
-1.116515, 1.311312, -0.3933165, 1, 0.7568628, 0, 1,
-1.116304, -1.135754, -3.95768, 1, 0.7607843, 0, 1,
-1.11328, -0.5428351, -2.185592, 1, 0.7686275, 0, 1,
-1.106738, -0.08598585, -0.1400106, 1, 0.772549, 0, 1,
-1.105859, 0.5135345, -2.276584, 1, 0.7803922, 0, 1,
-1.077108, -0.7304606, -2.981786, 1, 0.7843137, 0, 1,
-1.074099, -0.2406912, -0.1981423, 1, 0.7921569, 0, 1,
-1.07165, -0.7726949, -2.431089, 1, 0.7960784, 0, 1,
-1.070856, -1.273319, -3.900492, 1, 0.8039216, 0, 1,
-1.069348, -1.920493, -1.311061, 1, 0.8117647, 0, 1,
-1.067688, -0.329679, -0.05573108, 1, 0.8156863, 0, 1,
-1.065291, -0.5192503, -2.305419, 1, 0.8235294, 0, 1,
-1.064662, 0.2346922, -2.869326, 1, 0.827451, 0, 1,
-1.06353, 0.269723, -3.118172, 1, 0.8352941, 0, 1,
-1.063166, 0.5341948, -0.08764967, 1, 0.8392157, 0, 1,
-1.052075, -0.6096646, -2.768691, 1, 0.8470588, 0, 1,
-1.046226, 1.736833, 0.3254119, 1, 0.8509804, 0, 1,
-1.035829, -0.6643004, -3.245709, 1, 0.8588235, 0, 1,
-1.032975, 0.2692221, -0.7644387, 1, 0.8627451, 0, 1,
-1.029431, -0.1910231, -2.580303, 1, 0.8705882, 0, 1,
-1.024967, 0.2161312, -2.160436, 1, 0.8745098, 0, 1,
-1.022373, -0.2065392, -2.280198, 1, 0.8823529, 0, 1,
-1.016721, -0.4242475, -2.169352, 1, 0.8862745, 0, 1,
-1.012852, 0.1700895, -1.227606, 1, 0.8941177, 0, 1,
-1.006166, 0.2699243, -1.189269, 1, 0.8980392, 0, 1,
-1.005661, 1.326737, 0.4292666, 1, 0.9058824, 0, 1,
-1.000878, -0.439336, -2.391421, 1, 0.9137255, 0, 1,
-0.9896742, -0.5213118, -3.164769, 1, 0.9176471, 0, 1,
-0.9861549, -0.2978873, -2.47314, 1, 0.9254902, 0, 1,
-0.9816289, -0.4096863, -3.09344, 1, 0.9294118, 0, 1,
-0.9672922, -0.00687801, -1.516871, 1, 0.9372549, 0, 1,
-0.9523551, 0.676435, -1.269818, 1, 0.9411765, 0, 1,
-0.9491903, 0.6169261, -1.608072, 1, 0.9490196, 0, 1,
-0.9476489, -0.3448023, -0.3259768, 1, 0.9529412, 0, 1,
-0.9383569, -1.335908, -2.167866, 1, 0.9607843, 0, 1,
-0.9215611, -0.685016, -0.5216998, 1, 0.9647059, 0, 1,
-0.9167355, 1.126929, -1.923437, 1, 0.972549, 0, 1,
-0.9049924, 0.5553234, -2.298722, 1, 0.9764706, 0, 1,
-0.9032641, -0.7750276, -2.287438, 1, 0.9843137, 0, 1,
-0.8964723, 0.5798267, -0.9220412, 1, 0.9882353, 0, 1,
-0.890034, -1.013016, -4.365054, 1, 0.9960784, 0, 1,
-0.8872315, 0.5154794, -0.5497323, 0.9960784, 1, 0, 1,
-0.8865019, 0.8684424, -1.124521, 0.9921569, 1, 0, 1,
-0.8828614, 1.180747, -1.124604, 0.9843137, 1, 0, 1,
-0.8828323, -2.081669, -2.630403, 0.9803922, 1, 0, 1,
-0.8792687, 0.8268676, -1.590018, 0.972549, 1, 0, 1,
-0.8784503, -0.3525013, -4.161172, 0.9686275, 1, 0, 1,
-0.873997, -0.2069066, 0.1458728, 0.9607843, 1, 0, 1,
-0.873771, -0.24112, -0.5535276, 0.9568627, 1, 0, 1,
-0.8735867, -2.098608, -3.683996, 0.9490196, 1, 0, 1,
-0.8684525, 0.1697626, -2.070668, 0.945098, 1, 0, 1,
-0.8647721, -0.8751125, -1.156908, 0.9372549, 1, 0, 1,
-0.8643423, 0.5278134, -0.917926, 0.9333333, 1, 0, 1,
-0.8627053, 0.0586132, -2.083986, 0.9254902, 1, 0, 1,
-0.8620461, -0.6957397, -2.295195, 0.9215686, 1, 0, 1,
-0.8586882, -0.718542, -2.62385, 0.9137255, 1, 0, 1,
-0.8568618, -0.1014524, -4.364967, 0.9098039, 1, 0, 1,
-0.8532175, -0.5728974, -1.791956, 0.9019608, 1, 0, 1,
-0.8525894, -0.08599871, -0.9035431, 0.8941177, 1, 0, 1,
-0.8470813, 1.142743, 0.1587791, 0.8901961, 1, 0, 1,
-0.8426662, -1.121458, -2.281018, 0.8823529, 1, 0, 1,
-0.8407208, 0.05828774, 0.1738856, 0.8784314, 1, 0, 1,
-0.8364739, 0.4046927, -1.35531, 0.8705882, 1, 0, 1,
-0.8316776, 1.456027, -0.9061572, 0.8666667, 1, 0, 1,
-0.8252926, -1.504297, -2.919667, 0.8588235, 1, 0, 1,
-0.8194565, -0.4025981, -2.547118, 0.854902, 1, 0, 1,
-0.8072487, -1.125459, -2.790254, 0.8470588, 1, 0, 1,
-0.7928365, -0.2376783, -0.5324057, 0.8431373, 1, 0, 1,
-0.7870792, -0.3410844, -2.644656, 0.8352941, 1, 0, 1,
-0.7866124, -0.964205, -2.888338, 0.8313726, 1, 0, 1,
-0.7865842, -0.04275769, -0.6745515, 0.8235294, 1, 0, 1,
-0.7863417, 1.147358, 0.7169613, 0.8196079, 1, 0, 1,
-0.7828667, 0.8423771, -0.133388, 0.8117647, 1, 0, 1,
-0.7824904, -1.53997, -3.432308, 0.8078431, 1, 0, 1,
-0.7769226, -0.2208853, -2.371894, 0.8, 1, 0, 1,
-0.7768282, 1.352972, -1.030579, 0.7921569, 1, 0, 1,
-0.7730978, -1.030491, -2.412664, 0.7882353, 1, 0, 1,
-0.7730885, 2.510517, 1.251807, 0.7803922, 1, 0, 1,
-0.7707464, 0.722966, -0.2498856, 0.7764706, 1, 0, 1,
-0.7697608, 0.1531315, -1.857595, 0.7686275, 1, 0, 1,
-0.7640951, 1.660519, -1.970807, 0.7647059, 1, 0, 1,
-0.7624577, -1.170382, -1.952923, 0.7568628, 1, 0, 1,
-0.7591996, 1.637062, 0.1763389, 0.7529412, 1, 0, 1,
-0.7568113, 0.1022052, -1.357534, 0.7450981, 1, 0, 1,
-0.7554044, 0.4760011, 0.1158348, 0.7411765, 1, 0, 1,
-0.7551754, -1.23872, -4.215868, 0.7333333, 1, 0, 1,
-0.7532886, 1.345141, -0.4370783, 0.7294118, 1, 0, 1,
-0.7524717, -1.814126, -2.303315, 0.7215686, 1, 0, 1,
-0.7511502, 0.4335444, -1.446518, 0.7176471, 1, 0, 1,
-0.7495658, 0.1178044, -2.040899, 0.7098039, 1, 0, 1,
-0.7480875, -1.204649, -2.515544, 0.7058824, 1, 0, 1,
-0.7407484, 1.345211, -1.202521, 0.6980392, 1, 0, 1,
-0.7359184, -1.144683, -2.027557, 0.6901961, 1, 0, 1,
-0.735111, -0.8116395, -2.501937, 0.6862745, 1, 0, 1,
-0.7297064, -0.4707389, -3.27319, 0.6784314, 1, 0, 1,
-0.7260661, -0.2621497, -2.653676, 0.6745098, 1, 0, 1,
-0.7257617, -1.79701, -2.965214, 0.6666667, 1, 0, 1,
-0.7254344, -0.794089, -3.781241, 0.6627451, 1, 0, 1,
-0.7237184, -0.4481497, -1.660225, 0.654902, 1, 0, 1,
-0.7224569, -0.4589537, -1.498868, 0.6509804, 1, 0, 1,
-0.7161419, 0.176376, 0.4214863, 0.6431373, 1, 0, 1,
-0.7055091, -0.2568141, -1.99709, 0.6392157, 1, 0, 1,
-0.6992217, -2.156593, -3.251842, 0.6313726, 1, 0, 1,
-0.6912792, 1.410468, 0.7003385, 0.627451, 1, 0, 1,
-0.6908879, 2.287941, 1.352569, 0.6196079, 1, 0, 1,
-0.688125, -0.7283627, -2.912244, 0.6156863, 1, 0, 1,
-0.687678, 0.5187895, -1.027715, 0.6078432, 1, 0, 1,
-0.6825683, -1.088293, -3.344755, 0.6039216, 1, 0, 1,
-0.6796577, 1.41727, 0.5140403, 0.5960785, 1, 0, 1,
-0.6781641, 0.5574475, 0.1490869, 0.5882353, 1, 0, 1,
-0.6753598, -1.013725, -3.251762, 0.5843138, 1, 0, 1,
-0.6729764, 0.1785717, -1.113996, 0.5764706, 1, 0, 1,
-0.6717271, 0.7897352, -0.1450296, 0.572549, 1, 0, 1,
-0.670633, -0.7294403, -3.376206, 0.5647059, 1, 0, 1,
-0.6689978, -1.451766, -1.297996, 0.5607843, 1, 0, 1,
-0.6607072, 0.5953878, -0.4917525, 0.5529412, 1, 0, 1,
-0.6588274, 1.847703, -0.9794474, 0.5490196, 1, 0, 1,
-0.6578509, -0.618352, -2.787705, 0.5411765, 1, 0, 1,
-0.6541054, 0.6571718, 0.7185416, 0.5372549, 1, 0, 1,
-0.6513712, -0.231681, -2.275754, 0.5294118, 1, 0, 1,
-0.6507909, 0.6074163, 1.270226, 0.5254902, 1, 0, 1,
-0.6493748, -0.3436567, -2.303506, 0.5176471, 1, 0, 1,
-0.644784, -0.7046735, -1.209096, 0.5137255, 1, 0, 1,
-0.6415768, 1.245144, -1.61134, 0.5058824, 1, 0, 1,
-0.6378683, -0.1685646, -2.997118, 0.5019608, 1, 0, 1,
-0.6271163, -0.700015, -0.04164191, 0.4941176, 1, 0, 1,
-0.6257384, -0.3701656, -3.70937, 0.4862745, 1, 0, 1,
-0.6253821, 1.776411, -0.9863554, 0.4823529, 1, 0, 1,
-0.6252093, -1.41346, -3.571951, 0.4745098, 1, 0, 1,
-0.6246977, 0.5981486, 0.5734218, 0.4705882, 1, 0, 1,
-0.6233532, -0.2992627, -1.697604, 0.4627451, 1, 0, 1,
-0.6163298, -0.8083557, -2.365486, 0.4588235, 1, 0, 1,
-0.6121669, -0.5262325, -2.076319, 0.4509804, 1, 0, 1,
-0.6107299, 0.9373497, -1.716804, 0.4470588, 1, 0, 1,
-0.6050992, -1.423086, -3.369299, 0.4392157, 1, 0, 1,
-0.6008406, -0.4594255, -0.2262339, 0.4352941, 1, 0, 1,
-0.6005667, 1.465365, -1.371052, 0.427451, 1, 0, 1,
-0.5959983, -0.01223822, -3.041776, 0.4235294, 1, 0, 1,
-0.5831802, -0.9352157, -3.622352, 0.4156863, 1, 0, 1,
-0.5820548, -0.8273808, -1.359668, 0.4117647, 1, 0, 1,
-0.5802285, 0.8841573, -0.4076747, 0.4039216, 1, 0, 1,
-0.5775784, 0.6074381, 0.6950923, 0.3960784, 1, 0, 1,
-0.5748885, -1.438236, -3.029358, 0.3921569, 1, 0, 1,
-0.5739577, -0.4093394, -2.908684, 0.3843137, 1, 0, 1,
-0.5735441, -0.3342949, -1.38437, 0.3803922, 1, 0, 1,
-0.5725837, -0.2151561, -0.5080231, 0.372549, 1, 0, 1,
-0.5693654, -0.2635383, -1.338373, 0.3686275, 1, 0, 1,
-0.5685752, -0.6402359, -4.158263, 0.3607843, 1, 0, 1,
-0.5678754, 0.1877876, -1.547727, 0.3568628, 1, 0, 1,
-0.5671842, 0.9900644, -0.3642314, 0.3490196, 1, 0, 1,
-0.562835, 1.121838, -0.4876579, 0.345098, 1, 0, 1,
-0.5622187, 1.098596, -1.37353, 0.3372549, 1, 0, 1,
-0.5621207, -0.7010842, -2.357446, 0.3333333, 1, 0, 1,
-0.5609346, -0.1953247, -1.185073, 0.3254902, 1, 0, 1,
-0.5589949, -0.3101231, -2.646574, 0.3215686, 1, 0, 1,
-0.5550171, -0.364857, -1.162778, 0.3137255, 1, 0, 1,
-0.5549453, 0.9023829, -0.6979303, 0.3098039, 1, 0, 1,
-0.5542854, -1.184692, -3.72925, 0.3019608, 1, 0, 1,
-0.5530738, -1.066069, -1.180976, 0.2941177, 1, 0, 1,
-0.5530196, 0.1490658, -2.506614, 0.2901961, 1, 0, 1,
-0.5512853, 0.3918851, -0.8014484, 0.282353, 1, 0, 1,
-0.5506556, 1.275364, -1.71113, 0.2784314, 1, 0, 1,
-0.5465985, 0.415079, -2.651433, 0.2705882, 1, 0, 1,
-0.5448193, -0.6127276, -2.772131, 0.2666667, 1, 0, 1,
-0.5413349, 0.4353874, 1.417541, 0.2588235, 1, 0, 1,
-0.5391286, -0.3410316, -0.4840501, 0.254902, 1, 0, 1,
-0.5381764, -0.4743867, -1.67143, 0.2470588, 1, 0, 1,
-0.5310515, 0.08604153, -4.204761, 0.2431373, 1, 0, 1,
-0.5236825, -1.460324, -3.738414, 0.2352941, 1, 0, 1,
-0.5233535, -0.8516399, -2.662743, 0.2313726, 1, 0, 1,
-0.5228301, -1.641774, -2.451016, 0.2235294, 1, 0, 1,
-0.5220065, -0.2071005, -2.786203, 0.2196078, 1, 0, 1,
-0.5214156, -0.5834823, -1.738432, 0.2117647, 1, 0, 1,
-0.5192958, 2.761798, 0.07301317, 0.2078431, 1, 0, 1,
-0.5167408, -1.535768, -3.920128, 0.2, 1, 0, 1,
-0.5153174, -0.6124495, -3.382919, 0.1921569, 1, 0, 1,
-0.5038368, -0.3251462, -1.945031, 0.1882353, 1, 0, 1,
-0.5035515, 0.5071372, -0.3880929, 0.1803922, 1, 0, 1,
-0.5028062, -0.2967638, -2.471716, 0.1764706, 1, 0, 1,
-0.5011791, -2.051163, -3.039136, 0.1686275, 1, 0, 1,
-0.4997641, 0.8301588, -1.526513, 0.1647059, 1, 0, 1,
-0.4932796, -0.1298026, -1.260444, 0.1568628, 1, 0, 1,
-0.486518, -0.4500471, -1.920022, 0.1529412, 1, 0, 1,
-0.4840866, 1.627462, 1.636391, 0.145098, 1, 0, 1,
-0.4835039, 0.1070063, -1.208005, 0.1411765, 1, 0, 1,
-0.482873, -0.4889964, -1.724621, 0.1333333, 1, 0, 1,
-0.4646537, 0.739594, -0.3830419, 0.1294118, 1, 0, 1,
-0.4627803, 1.013162, -1.499532, 0.1215686, 1, 0, 1,
-0.4551612, 0.2749434, 0.05858102, 0.1176471, 1, 0, 1,
-0.4546334, 0.9678625, -0.3035846, 0.1098039, 1, 0, 1,
-0.4544755, 0.8574269, -1.197319, 0.1058824, 1, 0, 1,
-0.4527425, -0.6323037, -1.001333, 0.09803922, 1, 0, 1,
-0.4523987, -0.124475, -1.203282, 0.09019608, 1, 0, 1,
-0.4520265, 0.8767563, -2.198554, 0.08627451, 1, 0, 1,
-0.4475218, -0.2762179, -2.392437, 0.07843138, 1, 0, 1,
-0.446495, -0.2582371, -4.904319, 0.07450981, 1, 0, 1,
-0.4443745, 0.4516383, -0.5725517, 0.06666667, 1, 0, 1,
-0.4443609, 1.319461, 0.61876, 0.0627451, 1, 0, 1,
-0.4424616, 1.210813, 0.7773791, 0.05490196, 1, 0, 1,
-0.4384129, 1.396175, -0.08884928, 0.05098039, 1, 0, 1,
-0.4373396, -0.7015021, -1.605842, 0.04313726, 1, 0, 1,
-0.4340739, -0.442213, -1.044972, 0.03921569, 1, 0, 1,
-0.4307572, 0.08066229, -1.382174, 0.03137255, 1, 0, 1,
-0.430739, 0.6484041, -0.903993, 0.02745098, 1, 0, 1,
-0.4203233, 1.333093, -1.417487, 0.01960784, 1, 0, 1,
-0.4177202, 0.04835231, -2.328211, 0.01568628, 1, 0, 1,
-0.4161282, 1.000494, -0.03556687, 0.007843138, 1, 0, 1,
-0.4157956, -0.3421019, -2.42279, 0.003921569, 1, 0, 1,
-0.413937, -0.7312346, -3.011447, 0, 1, 0.003921569, 1,
-0.4133933, 1.084155, -0.4350359, 0, 1, 0.01176471, 1,
-0.4124628, -0.02574386, -1.506004, 0, 1, 0.01568628, 1,
-0.3970044, 1.203923, -0.09373686, 0, 1, 0.02352941, 1,
-0.3940499, 0.5738124, -0.8332452, 0, 1, 0.02745098, 1,
-0.3928365, -0.3842815, -0.6326111, 0, 1, 0.03529412, 1,
-0.3910586, 1.270329, -0.1871245, 0, 1, 0.03921569, 1,
-0.3884198, -0.9354486, -2.637816, 0, 1, 0.04705882, 1,
-0.3864598, 1.665929, 0.2605736, 0, 1, 0.05098039, 1,
-0.3664075, 0.6344197, -2.193501, 0, 1, 0.05882353, 1,
-0.3606352, -0.5283775, -3.891385, 0, 1, 0.0627451, 1,
-0.3543118, -1.3751, -2.57941, 0, 1, 0.07058824, 1,
-0.3495309, 0.369998, -1.758126, 0, 1, 0.07450981, 1,
-0.3494761, 0.3186029, -0.186923, 0, 1, 0.08235294, 1,
-0.345734, 0.242518, -1.978571, 0, 1, 0.08627451, 1,
-0.3439929, -2.185201, -2.813037, 0, 1, 0.09411765, 1,
-0.3411492, 0.5992271, 0.875693, 0, 1, 0.1019608, 1,
-0.3394693, 0.6733825, -1.002724, 0, 1, 0.1058824, 1,
-0.3386555, 0.4001798, -1.383135, 0, 1, 0.1137255, 1,
-0.3351586, 0.1348811, -3.207327, 0, 1, 0.1176471, 1,
-0.3340422, 0.05956013, -0.8320579, 0, 1, 0.1254902, 1,
-0.3318244, 0.08268723, -0.9547744, 0, 1, 0.1294118, 1,
-0.3266066, -1.139761, -2.002669, 0, 1, 0.1372549, 1,
-0.3236751, -1.269185, -2.368676, 0, 1, 0.1411765, 1,
-0.3205061, 1.812056, -0.9452447, 0, 1, 0.1490196, 1,
-0.3183868, 0.1154258, -0.5100031, 0, 1, 0.1529412, 1,
-0.3153612, -1.522723, -4.09284, 0, 1, 0.1607843, 1,
-0.3139208, -1.478558, -3.10993, 0, 1, 0.1647059, 1,
-0.3099501, 0.2457669, -1.373353, 0, 1, 0.172549, 1,
-0.3066808, -0.2595842, -1.556422, 0, 1, 0.1764706, 1,
-0.3024547, 1.086656, -1.91042, 0, 1, 0.1843137, 1,
-0.3007955, 1.299337, -0.5827746, 0, 1, 0.1882353, 1,
-0.3002577, -0.6944211, -3.75569, 0, 1, 0.1960784, 1,
-0.2994295, 0.6889428, 0.5336347, 0, 1, 0.2039216, 1,
-0.2965688, -0.4383388, -2.927263, 0, 1, 0.2078431, 1,
-0.2959301, -2.972507, -2.523933, 0, 1, 0.2156863, 1,
-0.2860935, 1.416243, 0.3243961, 0, 1, 0.2196078, 1,
-0.2834933, -0.00384337, -1.612427, 0, 1, 0.227451, 1,
-0.2811452, 0.5591506, -1.907295, 0, 1, 0.2313726, 1,
-0.2780485, 0.04984787, -0.3927622, 0, 1, 0.2392157, 1,
-0.277624, 1.066181, 1.065956, 0, 1, 0.2431373, 1,
-0.2733667, 0.5548385, -1.131821, 0, 1, 0.2509804, 1,
-0.2724928, -0.6799956, -2.355863, 0, 1, 0.254902, 1,
-0.2618457, 0.6850214, -0.9732505, 0, 1, 0.2627451, 1,
-0.2612444, 1.405363, 0.6881303, 0, 1, 0.2666667, 1,
-0.2596984, 1.320133, -0.9290248, 0, 1, 0.2745098, 1,
-0.2566844, 0.0116184, -0.2891894, 0, 1, 0.2784314, 1,
-0.2552822, -2.875247, -3.780413, 0, 1, 0.2862745, 1,
-0.2537079, -0.006418159, -2.036746, 0, 1, 0.2901961, 1,
-0.2487302, 0.9785683, -1.720203, 0, 1, 0.2980392, 1,
-0.2471904, 0.1557474, -0.0685057, 0, 1, 0.3058824, 1,
-0.2468726, -1.140063, -2.54698, 0, 1, 0.3098039, 1,
-0.2465088, 0.9145588, 0.7029548, 0, 1, 0.3176471, 1,
-0.2431475, -0.8694767, -2.905984, 0, 1, 0.3215686, 1,
-0.2365423, -0.2500153, -0.7073903, 0, 1, 0.3294118, 1,
-0.23392, -0.02824388, -2.398909, 0, 1, 0.3333333, 1,
-0.2321797, 0.8396918, -0.06540892, 0, 1, 0.3411765, 1,
-0.2288757, -0.5909702, -2.59004, 0, 1, 0.345098, 1,
-0.2252244, 0.7590414, -1.005335, 0, 1, 0.3529412, 1,
-0.2233311, 1.637066, 0.1019006, 0, 1, 0.3568628, 1,
-0.2217159, 1.218323, 0.6412365, 0, 1, 0.3647059, 1,
-0.2202732, -0.4373441, -0.6720956, 0, 1, 0.3686275, 1,
-0.2184958, -0.2076768, -2.511724, 0, 1, 0.3764706, 1,
-0.2149537, -0.8455222, -3.850723, 0, 1, 0.3803922, 1,
-0.2131257, 0.1172686, -1.009075, 0, 1, 0.3882353, 1,
-0.2115219, 0.169086, -0.9637155, 0, 1, 0.3921569, 1,
-0.2097574, -1.506239, -2.654672, 0, 1, 0.4, 1,
-0.2073262, 0.7472466, 0.02071379, 0, 1, 0.4078431, 1,
-0.1990407, -0.2336776, -2.518622, 0, 1, 0.4117647, 1,
-0.1964768, 1.248971, -0.2564042, 0, 1, 0.4196078, 1,
-0.1952397, 0.9914392, -1.087222, 0, 1, 0.4235294, 1,
-0.1934376, -1.286837, -2.540754, 0, 1, 0.4313726, 1,
-0.1932704, -0.2032393, -1.087644, 0, 1, 0.4352941, 1,
-0.1926203, 0.740406, -0.5169373, 0, 1, 0.4431373, 1,
-0.1897837, -0.9019926, -4.197018, 0, 1, 0.4470588, 1,
-0.1797607, 0.7229062, 1.987461, 0, 1, 0.454902, 1,
-0.1763588, -0.746086, -2.67204, 0, 1, 0.4588235, 1,
-0.1739258, -0.09255905, -1.287626, 0, 1, 0.4666667, 1,
-0.1690181, 0.0875327, -0.9707514, 0, 1, 0.4705882, 1,
-0.1689003, 1.534433, -1.656017, 0, 1, 0.4784314, 1,
-0.1655623, -1.649362, -3.443683, 0, 1, 0.4823529, 1,
-0.1605807, -0.5881603, -2.17347, 0, 1, 0.4901961, 1,
-0.1578654, 1.557761, -2.421261, 0, 1, 0.4941176, 1,
-0.1576438, 0.2220868, 0.05143836, 0, 1, 0.5019608, 1,
-0.1572949, -1.450712, -2.815767, 0, 1, 0.509804, 1,
-0.1568571, -2.764283, -3.468144, 0, 1, 0.5137255, 1,
-0.1546688, 1.150979, 0.8782249, 0, 1, 0.5215687, 1,
-0.1498689, 0.07710224, -0.2235744, 0, 1, 0.5254902, 1,
-0.1498147, -0.7262236, -1.913427, 0, 1, 0.5333334, 1,
-0.1482479, 1.052924, -0.1028655, 0, 1, 0.5372549, 1,
-0.1480002, 1.777013, 0.2992065, 0, 1, 0.5450981, 1,
-0.1477794, 1.588104, 1.126959, 0, 1, 0.5490196, 1,
-0.1473688, -0.2724979, -2.344228, 0, 1, 0.5568628, 1,
-0.145437, -1.475549, -4.209348, 0, 1, 0.5607843, 1,
-0.1427805, -0.281825, -1.26867, 0, 1, 0.5686275, 1,
-0.1418734, 1.433842, -1.718716, 0, 1, 0.572549, 1,
-0.1400304, -0.6060626, -3.564564, 0, 1, 0.5803922, 1,
-0.1380986, -0.2815754, -5.024063, 0, 1, 0.5843138, 1,
-0.1377461, -1.479687, -2.66449, 0, 1, 0.5921569, 1,
-0.1357427, -1.308288, -1.353613, 0, 1, 0.5960785, 1,
-0.1341536, -0.3257539, -3.199257, 0, 1, 0.6039216, 1,
-0.1236381, 0.5394729, -1.416866, 0, 1, 0.6117647, 1,
-0.1232156, -0.5768486, -0.2423809, 0, 1, 0.6156863, 1,
-0.1224054, -0.8199095, -3.823887, 0, 1, 0.6235294, 1,
-0.1223369, 1.124211, 1.557584, 0, 1, 0.627451, 1,
-0.1201836, 0.4352059, -0.269095, 0, 1, 0.6352941, 1,
-0.1179343, 1.505229, -0.2533965, 0, 1, 0.6392157, 1,
-0.1178083, -0.08714615, -2.752735, 0, 1, 0.6470588, 1,
-0.1147717, -0.4572142, -3.030752, 0, 1, 0.6509804, 1,
-0.1107043, -0.880827, -3.466728, 0, 1, 0.6588235, 1,
-0.1093953, -0.2737342, -2.68487, 0, 1, 0.6627451, 1,
-0.1093789, -2.028083, -4.134813, 0, 1, 0.6705883, 1,
-0.1032958, 1.136861, 0.4399076, 0, 1, 0.6745098, 1,
-0.1025294, 0.2376166, -2.128241, 0, 1, 0.682353, 1,
-0.1009805, 0.1664667, -1.311569, 0, 1, 0.6862745, 1,
-0.1001338, 0.179679, 0.57422, 0, 1, 0.6941177, 1,
-0.09451329, 0.2632352, -0.8498488, 0, 1, 0.7019608, 1,
-0.09241236, -0.887743, -3.072257, 0, 1, 0.7058824, 1,
-0.09226308, -0.2945138, -4.026308, 0, 1, 0.7137255, 1,
-0.09133191, 0.08812343, -0.42031, 0, 1, 0.7176471, 1,
-0.08580635, -1.160279, -4.427994, 0, 1, 0.7254902, 1,
-0.08367571, -0.2671678, -3.615488, 0, 1, 0.7294118, 1,
-0.08022271, 0.7815305, -0.7005489, 0, 1, 0.7372549, 1,
-0.07980647, 0.9171335, 0.6378121, 0, 1, 0.7411765, 1,
-0.07355851, 0.8280653, -1.404562, 0, 1, 0.7490196, 1,
-0.07334996, 0.03562396, -1.351485, 0, 1, 0.7529412, 1,
-0.07015404, 2.445822, 0.07556406, 0, 1, 0.7607843, 1,
-0.06807135, 0.8968101, 1.940095, 0, 1, 0.7647059, 1,
-0.06517339, 0.5636804, -0.7185816, 0, 1, 0.772549, 1,
-0.06330969, 0.5662696, 1.448814, 0, 1, 0.7764706, 1,
-0.06278245, 0.714772, 0.8448504, 0, 1, 0.7843137, 1,
-0.06191348, 0.7152231, -0.7389358, 0, 1, 0.7882353, 1,
-0.05925262, 0.8606012, 1.214346, 0, 1, 0.7960784, 1,
-0.05809308, -0.3829959, -2.795164, 0, 1, 0.8039216, 1,
-0.05646995, 0.5981401, 0.3935473, 0, 1, 0.8078431, 1,
-0.05113252, 0.02428447, -1.85303, 0, 1, 0.8156863, 1,
-0.04966658, 1.353915, -0.6169541, 0, 1, 0.8196079, 1,
-0.04270037, -0.1507876, -2.533378, 0, 1, 0.827451, 1,
-0.02787026, 1.491844, -1.063946, 0, 1, 0.8313726, 1,
-0.02022688, 0.2094735, 0.5716602, 0, 1, 0.8392157, 1,
-0.01876406, -0.3508075, -3.346676, 0, 1, 0.8431373, 1,
-0.01781498, 0.5549988, -2.099473, 0, 1, 0.8509804, 1,
-0.01725246, 1.521652, 0.8335638, 0, 1, 0.854902, 1,
-0.01574614, -0.6855998, -1.892337, 0, 1, 0.8627451, 1,
-0.01426222, 0.05958949, 0.9262614, 0, 1, 0.8666667, 1,
-0.01336533, 1.482655, 0.8067644, 0, 1, 0.8745098, 1,
-0.00888543, 0.426146, -0.3813301, 0, 1, 0.8784314, 1,
-0.008610334, 0.5015091, -0.4030833, 0, 1, 0.8862745, 1,
-0.006669955, 1.839364, 1.751737, 0, 1, 0.8901961, 1,
-0.00572774, -2.01583, -2.939186, 0, 1, 0.8980392, 1,
-0.001549693, 1.199951, -1.044312, 0, 1, 0.9058824, 1,
0.004984425, 1.094342, 0.1253964, 0, 1, 0.9098039, 1,
0.005948935, -0.8766988, 2.956776, 0, 1, 0.9176471, 1,
0.008453615, 0.9919859, 0.2358681, 0, 1, 0.9215686, 1,
0.009942336, -0.5573226, 3.076651, 0, 1, 0.9294118, 1,
0.01086218, 0.05025785, 1.34013, 0, 1, 0.9333333, 1,
0.01331001, 0.174842, -0.5646383, 0, 1, 0.9411765, 1,
0.01813541, -0.855194, 3.067609, 0, 1, 0.945098, 1,
0.01997526, -1.136901, 3.794456, 0, 1, 0.9529412, 1,
0.02154891, -0.8238845, 3.270743, 0, 1, 0.9568627, 1,
0.02344966, -0.9496931, 1.860309, 0, 1, 0.9647059, 1,
0.02820322, -1.70751, 3.26065, 0, 1, 0.9686275, 1,
0.02871441, -1.786786, 3.809788, 0, 1, 0.9764706, 1,
0.02987357, -0.2551894, 3.393024, 0, 1, 0.9803922, 1,
0.03007802, 1.610128, -0.7564286, 0, 1, 0.9882353, 1,
0.03533339, -0.182756, 2.774932, 0, 1, 0.9921569, 1,
0.03543257, -1.20355, 4.653556, 0, 1, 1, 1,
0.0371668, -1.677717, 3.504911, 0, 0.9921569, 1, 1,
0.03726305, -0.5548024, 3.599509, 0, 0.9882353, 1, 1,
0.03785873, -1.833693, 2.094069, 0, 0.9803922, 1, 1,
0.03792346, -0.6154276, 4.211643, 0, 0.9764706, 1, 1,
0.03865743, -2.355833, 4.036524, 0, 0.9686275, 1, 1,
0.04070088, 0.4411852, -1.83221, 0, 0.9647059, 1, 1,
0.0423191, 0.1186424, 1.34466, 0, 0.9568627, 1, 1,
0.0432383, 0.8963364, -0.5357448, 0, 0.9529412, 1, 1,
0.04450549, 1.053214, 0.4198132, 0, 0.945098, 1, 1,
0.04511582, -0.8456899, 4.76054, 0, 0.9411765, 1, 1,
0.04682918, 0.4940793, 1.085015, 0, 0.9333333, 1, 1,
0.05236841, 0.7103614, 1.584512, 0, 0.9294118, 1, 1,
0.05401425, -0.6742963, 3.726792, 0, 0.9215686, 1, 1,
0.05615326, 0.05828776, 0.4367016, 0, 0.9176471, 1, 1,
0.06721674, -0.2438877, 3.378191, 0, 0.9098039, 1, 1,
0.06762141, 0.6652975, -1.067228, 0, 0.9058824, 1, 1,
0.07234488, 0.8161353, -0.1976135, 0, 0.8980392, 1, 1,
0.07423282, -1.047913, 4.497469, 0, 0.8901961, 1, 1,
0.07444587, 0.7722981, -1.227646, 0, 0.8862745, 1, 1,
0.07658395, 0.06953753, -0.3147916, 0, 0.8784314, 1, 1,
0.08129149, -0.08631245, 2.373883, 0, 0.8745098, 1, 1,
0.08224156, 0.3019498, 0.4612002, 0, 0.8666667, 1, 1,
0.08264589, -0.9446502, 0.4379622, 0, 0.8627451, 1, 1,
0.08585069, 1.456492, -0.9748479, 0, 0.854902, 1, 1,
0.09128457, -1.516392, 3.16011, 0, 0.8509804, 1, 1,
0.09487986, -0.2309544, 3.635217, 0, 0.8431373, 1, 1,
0.09775705, -0.5194356, 3.150476, 0, 0.8392157, 1, 1,
0.1012486, 1.995081, -1.877754, 0, 0.8313726, 1, 1,
0.1022144, -0.01158467, 1.633369, 0, 0.827451, 1, 1,
0.1024507, 0.0143392, 2.066172, 0, 0.8196079, 1, 1,
0.1051406, 0.173286, 1.187908, 0, 0.8156863, 1, 1,
0.1054334, -0.03697832, 0.8647809, 0, 0.8078431, 1, 1,
0.1079436, -0.1495232, 2.87291, 0, 0.8039216, 1, 1,
0.1093373, 1.493118, 0.7617492, 0, 0.7960784, 1, 1,
0.109425, -0.2110029, 4.651661, 0, 0.7882353, 1, 1,
0.111535, 0.8885005, 1.667672, 0, 0.7843137, 1, 1,
0.1133176, 0.5817511, 0.07808716, 0, 0.7764706, 1, 1,
0.1143669, 0.8024067, 0.6110347, 0, 0.772549, 1, 1,
0.1149797, -0.3505962, 0.773437, 0, 0.7647059, 1, 1,
0.1151726, 0.07458029, 1.618353, 0, 0.7607843, 1, 1,
0.115507, -0.2387107, 3.1044, 0, 0.7529412, 1, 1,
0.1161663, -1.870794, 2.502565, 0, 0.7490196, 1, 1,
0.1177255, 0.4293375, 0.7854366, 0, 0.7411765, 1, 1,
0.1291497, -1.661357, 2.777773, 0, 0.7372549, 1, 1,
0.1350194, 0.5755196, 1.458392, 0, 0.7294118, 1, 1,
0.1357298, 1.083699, -1.522501, 0, 0.7254902, 1, 1,
0.1366606, 0.8096746, 1.09253, 0, 0.7176471, 1, 1,
0.1393721, -0.2824416, 2.166551, 0, 0.7137255, 1, 1,
0.1404579, 0.9753721, 0.7598269, 0, 0.7058824, 1, 1,
0.1405596, 0.07401579, -1.017051, 0, 0.6980392, 1, 1,
0.1430235, 0.5097477, 1.10253, 0, 0.6941177, 1, 1,
0.1434842, 0.1809825, 1.29565, 0, 0.6862745, 1, 1,
0.1484172, 1.771543, 1.260717, 0, 0.682353, 1, 1,
0.1491273, 1.049424, -0.82115, 0, 0.6745098, 1, 1,
0.1492455, 0.5233951, 0.01771265, 0, 0.6705883, 1, 1,
0.1502562, -0.6414564, 2.817344, 0, 0.6627451, 1, 1,
0.1511452, -0.1388614, 0.3296329, 0, 0.6588235, 1, 1,
0.1521782, 0.1901847, 0.7822617, 0, 0.6509804, 1, 1,
0.1539575, -1.275191, 3.391065, 0, 0.6470588, 1, 1,
0.1562024, -0.2636232, 3.383168, 0, 0.6392157, 1, 1,
0.1583782, 0.2240914, -0.5001583, 0, 0.6352941, 1, 1,
0.1584771, 0.1443084, 1.229746, 0, 0.627451, 1, 1,
0.1661509, -1.584693, 2.376202, 0, 0.6235294, 1, 1,
0.1676681, -0.4470618, 3.193041, 0, 0.6156863, 1, 1,
0.1691517, 0.8751836, 0.05565255, 0, 0.6117647, 1, 1,
0.1774441, -0.9774442, 2.883222, 0, 0.6039216, 1, 1,
0.1784362, 1.477987, 0.6740513, 0, 0.5960785, 1, 1,
0.1786598, -1.971397, 4.339619, 0, 0.5921569, 1, 1,
0.1787233, -1.199549, 3.353549, 0, 0.5843138, 1, 1,
0.1849648, 1.707636, -0.1948349, 0, 0.5803922, 1, 1,
0.1864236, 0.05240123, 2.244883, 0, 0.572549, 1, 1,
0.19131, -0.8427941, 1.088867, 0, 0.5686275, 1, 1,
0.1927591, 0.3570447, -3.104302, 0, 0.5607843, 1, 1,
0.1935773, 1.349217, -0.8893491, 0, 0.5568628, 1, 1,
0.1965197, 1.182763, 0.07874253, 0, 0.5490196, 1, 1,
0.199592, 0.3999594, 0.4699519, 0, 0.5450981, 1, 1,
0.2001051, -1.027547, 4.361213, 0, 0.5372549, 1, 1,
0.2047841, -0.6323134, 3.1865, 0, 0.5333334, 1, 1,
0.2052323, 0.6468056, -0.07228967, 0, 0.5254902, 1, 1,
0.2086702, -1.458554, 3.997827, 0, 0.5215687, 1, 1,
0.214766, -0.9902216, 3.740582, 0, 0.5137255, 1, 1,
0.216365, 0.441199, 0.1201351, 0, 0.509804, 1, 1,
0.2169684, 2.044878, -1.540228, 0, 0.5019608, 1, 1,
0.2176799, 0.4366288, -0.804594, 0, 0.4941176, 1, 1,
0.2182612, 0.1572132, 0.9091701, 0, 0.4901961, 1, 1,
0.2187553, -0.2873888, 2.61183, 0, 0.4823529, 1, 1,
0.2219285, 1.900102, 0.1864492, 0, 0.4784314, 1, 1,
0.230862, 0.9700402, -1.988952, 0, 0.4705882, 1, 1,
0.2360283, -1.976251, 2.964493, 0, 0.4666667, 1, 1,
0.2383711, -0.1408437, 3.389862, 0, 0.4588235, 1, 1,
0.243184, -0.8591243, 1.507297, 0, 0.454902, 1, 1,
0.243584, 1.136312, 3.103791, 0, 0.4470588, 1, 1,
0.2454638, -0.8335453, 2.263224, 0, 0.4431373, 1, 1,
0.2469514, -0.05448371, -0.06084423, 0, 0.4352941, 1, 1,
0.2480802, -0.003954841, 1.909543, 0, 0.4313726, 1, 1,
0.2519401, -0.1443455, 1.579438, 0, 0.4235294, 1, 1,
0.2532114, -0.8254362, 4.341516, 0, 0.4196078, 1, 1,
0.2557358, -0.4342204, 2.142605, 0, 0.4117647, 1, 1,
0.2560998, 2.178092, -1.088453, 0, 0.4078431, 1, 1,
0.2568647, -0.4763346, 2.924408, 0, 0.4, 1, 1,
0.2573434, -2.195477, 2.819817, 0, 0.3921569, 1, 1,
0.2596285, 0.4497267, 0.2463565, 0, 0.3882353, 1, 1,
0.2602678, -0.3658967, 1.631872, 0, 0.3803922, 1, 1,
0.2615043, -1.321334, 2.218921, 0, 0.3764706, 1, 1,
0.2616923, -0.006087652, 2.483018, 0, 0.3686275, 1, 1,
0.2681296, -0.2015007, 1.794368, 0, 0.3647059, 1, 1,
0.27219, -1.677656, 2.560007, 0, 0.3568628, 1, 1,
0.2740298, 1.054916, 0.6716524, 0, 0.3529412, 1, 1,
0.2763041, -0.473377, 1.626701, 0, 0.345098, 1, 1,
0.2780105, 0.4093137, -0.5996662, 0, 0.3411765, 1, 1,
0.2795098, 0.5176102, 0.786124, 0, 0.3333333, 1, 1,
0.2795891, -0.5752589, 2.882594, 0, 0.3294118, 1, 1,
0.2829678, -0.143254, 2.147313, 0, 0.3215686, 1, 1,
0.2868232, 1.023268, 0.3168901, 0, 0.3176471, 1, 1,
0.290826, 0.8201933, 0.03030662, 0, 0.3098039, 1, 1,
0.2917666, 0.4363174, 1.740709, 0, 0.3058824, 1, 1,
0.2940034, -0.2932498, 1.893503, 0, 0.2980392, 1, 1,
0.2970417, 4.565548e-05, 1.8855, 0, 0.2901961, 1, 1,
0.3058306, -0.8013628, 3.221606, 0, 0.2862745, 1, 1,
0.3061071, -1.010035, 4.343482, 0, 0.2784314, 1, 1,
0.3068953, -0.3993458, 2.21139, 0, 0.2745098, 1, 1,
0.307576, 2.336634, 0.4060952, 0, 0.2666667, 1, 1,
0.313298, 0.5180368, 0.311629, 0, 0.2627451, 1, 1,
0.3135986, 0.7451537, 0.5598029, 0, 0.254902, 1, 1,
0.318602, 0.2858571, -0.2345208, 0, 0.2509804, 1, 1,
0.3203548, -0.1315086, 3.530398, 0, 0.2431373, 1, 1,
0.3204305, -1.03385, 2.226001, 0, 0.2392157, 1, 1,
0.3210323, -1.01864, 3.329751, 0, 0.2313726, 1, 1,
0.321312, -1.00869, 2.739191, 0, 0.227451, 1, 1,
0.3227331, -0.3227059, 2.433102, 0, 0.2196078, 1, 1,
0.3242721, 1.262552, 0.7645994, 0, 0.2156863, 1, 1,
0.3254664, 0.7804931, 1.014906, 0, 0.2078431, 1, 1,
0.3262225, 0.8171077, -0.06527627, 0, 0.2039216, 1, 1,
0.3271841, -0.8257163, 2.759615, 0, 0.1960784, 1, 1,
0.3299438, 0.6255279, 2.061798, 0, 0.1882353, 1, 1,
0.3313105, 1.194287, -0.2507452, 0, 0.1843137, 1, 1,
0.3365974, 0.9410816, -0.7323899, 0, 0.1764706, 1, 1,
0.3421017, 2.126895, -0.5858769, 0, 0.172549, 1, 1,
0.3459525, 0.2142639, 0.4968635, 0, 0.1647059, 1, 1,
0.3505934, -0.07394733, 1.384373, 0, 0.1607843, 1, 1,
0.3550713, 0.6164305, 0.4384437, 0, 0.1529412, 1, 1,
0.3583856, -0.445596, 1.923705, 0, 0.1490196, 1, 1,
0.3592511, -0.1439257, 1.822263, 0, 0.1411765, 1, 1,
0.360233, -1.608499, 1.873872, 0, 0.1372549, 1, 1,
0.3602569, 1.107689, -1.265429, 0, 0.1294118, 1, 1,
0.3647141, 1.424831, 1.35459, 0, 0.1254902, 1, 1,
0.3656697, 0.2639173, 1.321945, 0, 0.1176471, 1, 1,
0.3664013, 1.644762, 1.69837, 0, 0.1137255, 1, 1,
0.3708335, 0.2165803, -1.034688, 0, 0.1058824, 1, 1,
0.3720518, 1.718091, -0.6730801, 0, 0.09803922, 1, 1,
0.3753777, 0.3805476, 0.4244965, 0, 0.09411765, 1, 1,
0.3774082, 1.304903, 0.1992888, 0, 0.08627451, 1, 1,
0.3781344, -0.1004707, 0.7481367, 0, 0.08235294, 1, 1,
0.3798561, -0.769421, 2.863038, 0, 0.07450981, 1, 1,
0.3810357, -0.5621549, 2.135073, 0, 0.07058824, 1, 1,
0.3810827, -0.1144767, 0.4106545, 0, 0.0627451, 1, 1,
0.3876197, 1.689187, -0.8865042, 0, 0.05882353, 1, 1,
0.3892525, -1.211234, 3.66928, 0, 0.05098039, 1, 1,
0.3898012, 0.8247309, 2.20789, 0, 0.04705882, 1, 1,
0.3904278, 1.613338, -0.4629947, 0, 0.03921569, 1, 1,
0.397529, -0.08860777, 0.1575996, 0, 0.03529412, 1, 1,
0.399067, -0.6135064, 1.65653, 0, 0.02745098, 1, 1,
0.4009122, 1.129445, 1.677048, 0, 0.02352941, 1, 1,
0.4026588, 0.06190734, 1.261593, 0, 0.01568628, 1, 1,
0.4064979, 0.1328718, -0.7802463, 0, 0.01176471, 1, 1,
0.4066961, -0.3166981, 2.350345, 0, 0.003921569, 1, 1,
0.4083438, 0.5880932, 1.597662, 0.003921569, 0, 1, 1,
0.4108002, -0.387351, 4.050314, 0.007843138, 0, 1, 1,
0.4184363, 0.0480421, 1.928892, 0.01568628, 0, 1, 1,
0.4203617, -0.9372392, 0.4906301, 0.01960784, 0, 1, 1,
0.4232547, 0.813068, 2.955611, 0.02745098, 0, 1, 1,
0.4273302, -0.9918371, 2.591378, 0.03137255, 0, 1, 1,
0.428885, 1.192432, 1.059427, 0.03921569, 0, 1, 1,
0.4430586, 0.182048, 0.3001808, 0.04313726, 0, 1, 1,
0.445955, -0.5039408, 1.52202, 0.05098039, 0, 1, 1,
0.4515457, 2.183309, 2.04425, 0.05490196, 0, 1, 1,
0.4570126, 0.4091825, 0.1756607, 0.0627451, 0, 1, 1,
0.4609566, 1.287618, 1.040348, 0.06666667, 0, 1, 1,
0.4659791, -1.279434, 3.099002, 0.07450981, 0, 1, 1,
0.4675196, 0.1358619, 0.8525605, 0.07843138, 0, 1, 1,
0.4706552, 1.09892, 2.401949, 0.08627451, 0, 1, 1,
0.4716981, -0.5212418, 2.863398, 0.09019608, 0, 1, 1,
0.4720628, 1.020362, 0.1646749, 0.09803922, 0, 1, 1,
0.4737885, -0.3871526, 0.4499642, 0.1058824, 0, 1, 1,
0.4739801, -0.7846118, 3.038321, 0.1098039, 0, 1, 1,
0.4757179, 1.124979, -0.5781964, 0.1176471, 0, 1, 1,
0.4782877, -0.2845137, 2.760437, 0.1215686, 0, 1, 1,
0.4845571, -0.0375047, 1.962653, 0.1294118, 0, 1, 1,
0.4845938, 1.232158, 0.9438242, 0.1333333, 0, 1, 1,
0.4870593, -0.6347469, 2.263876, 0.1411765, 0, 1, 1,
0.4890472, 1.554407, -0.5911953, 0.145098, 0, 1, 1,
0.4892177, -1.379885, 2.712604, 0.1529412, 0, 1, 1,
0.4908295, 0.8129231, 0.244515, 0.1568628, 0, 1, 1,
0.4912243, -0.808701, 1.664283, 0.1647059, 0, 1, 1,
0.4914066, -2.078655, 2.922115, 0.1686275, 0, 1, 1,
0.4937924, 0.2390216, -0.4625463, 0.1764706, 0, 1, 1,
0.4971715, 0.8132069, 0.2411009, 0.1803922, 0, 1, 1,
0.4976898, 0.1095732, 2.943882, 0.1882353, 0, 1, 1,
0.4979685, 1.156017, -1.102064, 0.1921569, 0, 1, 1,
0.4985484, -0.5548809, 2.917174, 0.2, 0, 1, 1,
0.5029597, 0.2000879, 1.539338, 0.2078431, 0, 1, 1,
0.5076814, -0.6404144, 4.52735, 0.2117647, 0, 1, 1,
0.5082498, 0.1820937, 2.233038, 0.2196078, 0, 1, 1,
0.5099076, 0.3196733, 0.4461009, 0.2235294, 0, 1, 1,
0.5101718, 1.570444, 1.117894, 0.2313726, 0, 1, 1,
0.5164968, -0.2951382, 2.405742, 0.2352941, 0, 1, 1,
0.5179443, -0.5525457, 2.535903, 0.2431373, 0, 1, 1,
0.5289868, 0.5072925, 0.9986923, 0.2470588, 0, 1, 1,
0.5354043, 0.2759864, 0.8781442, 0.254902, 0, 1, 1,
0.5383826, -0.1129908, 2.21988, 0.2588235, 0, 1, 1,
0.5385004, 0.339255, -0.8177739, 0.2666667, 0, 1, 1,
0.5409749, -0.3270349, 1.074342, 0.2705882, 0, 1, 1,
0.541483, -0.8348567, 3.131611, 0.2784314, 0, 1, 1,
0.5427818, 0.4714282, 2.171807, 0.282353, 0, 1, 1,
0.5433673, -0.2117108, 1.007584, 0.2901961, 0, 1, 1,
0.5461016, -0.4293858, 1.956237, 0.2941177, 0, 1, 1,
0.5496956, -0.2911506, 1.154342, 0.3019608, 0, 1, 1,
0.5533422, 0.5921917, 1.916397, 0.3098039, 0, 1, 1,
0.5560586, -0.722966, 4.811402, 0.3137255, 0, 1, 1,
0.5576894, 0.9850253, 1.064339, 0.3215686, 0, 1, 1,
0.5629282, -1.552157, 2.715709, 0.3254902, 0, 1, 1,
0.5643869, 0.8310747, 0.6383042, 0.3333333, 0, 1, 1,
0.5671081, -0.5765371, 1.704759, 0.3372549, 0, 1, 1,
0.5676549, -1.117226, 2.06171, 0.345098, 0, 1, 1,
0.5711033, -0.1588052, 2.531597, 0.3490196, 0, 1, 1,
0.5736099, 1.191716, 1.257844, 0.3568628, 0, 1, 1,
0.5845824, -0.5397504, 2.043199, 0.3607843, 0, 1, 1,
0.5869398, 0.004667024, 2.401497, 0.3686275, 0, 1, 1,
0.5871576, -1.160074, 3.544822, 0.372549, 0, 1, 1,
0.5887027, -0.04316785, 0.3265976, 0.3803922, 0, 1, 1,
0.5932337, -1.704178, 2.709445, 0.3843137, 0, 1, 1,
0.5936201, -0.1393034, -0.1571206, 0.3921569, 0, 1, 1,
0.5972246, 0.6096572, 1.932272, 0.3960784, 0, 1, 1,
0.6052948, 0.5896384, -0.322481, 0.4039216, 0, 1, 1,
0.6063549, -0.2034641, 0.9158718, 0.4117647, 0, 1, 1,
0.6100754, 0.5799197, -0.5728714, 0.4156863, 0, 1, 1,
0.6108131, -0.2045474, 1.282749, 0.4235294, 0, 1, 1,
0.6111447, 0.7848254, 0.8985097, 0.427451, 0, 1, 1,
0.6181889, -0.1112887, 2.879364, 0.4352941, 0, 1, 1,
0.6214705, 0.521119, 0.8263377, 0.4392157, 0, 1, 1,
0.6226803, 0.2526827, 0.8322495, 0.4470588, 0, 1, 1,
0.6231385, 0.5698786, 0.6537589, 0.4509804, 0, 1, 1,
0.6271461, -1.06343, 2.825028, 0.4588235, 0, 1, 1,
0.6352215, -0.3505167, 1.510352, 0.4627451, 0, 1, 1,
0.6362879, -0.1935386, 2.524681, 0.4705882, 0, 1, 1,
0.6418284, 1.53447, 0.4417993, 0.4745098, 0, 1, 1,
0.6433186, -0.2657829, 2.180196, 0.4823529, 0, 1, 1,
0.6445905, -0.5475881, 2.970872, 0.4862745, 0, 1, 1,
0.6468019, 0.5267722, 0.1264115, 0.4941176, 0, 1, 1,
0.6599745, -0.5438416, 3.011046, 0.5019608, 0, 1, 1,
0.6612755, -1.239432, 1.653734, 0.5058824, 0, 1, 1,
0.6626806, 1.322839, 1.232759, 0.5137255, 0, 1, 1,
0.6691608, -0.05452075, 1.049475, 0.5176471, 0, 1, 1,
0.6726201, -0.7528047, 4.038747, 0.5254902, 0, 1, 1,
0.6734622, -0.2132816, 2.046919, 0.5294118, 0, 1, 1,
0.6742293, -0.6654017, 3.362155, 0.5372549, 0, 1, 1,
0.6748912, 1.833512, -0.03420606, 0.5411765, 0, 1, 1,
0.6849165, 0.7786837, -0.131975, 0.5490196, 0, 1, 1,
0.691296, -0.9115667, 3.151634, 0.5529412, 0, 1, 1,
0.693254, 1.101706, 1.063867, 0.5607843, 0, 1, 1,
0.6937052, 1.685413, -0.44476, 0.5647059, 0, 1, 1,
0.694859, 0.9946494, 0.8791637, 0.572549, 0, 1, 1,
0.6951881, -0.4903244, 2.531021, 0.5764706, 0, 1, 1,
0.699316, -1.034566, 3.053616, 0.5843138, 0, 1, 1,
0.7019767, 1.085079, 1.779265, 0.5882353, 0, 1, 1,
0.7048078, 2.977684, 0.08247644, 0.5960785, 0, 1, 1,
0.7096799, 1.715971, 1.390651, 0.6039216, 0, 1, 1,
0.7104003, -1.011981, 1.441062, 0.6078432, 0, 1, 1,
0.7111898, 1.201391, 1.301326, 0.6156863, 0, 1, 1,
0.7145139, 0.6154697, -2.039027, 0.6196079, 0, 1, 1,
0.7163219, -2.53618, 1.548395, 0.627451, 0, 1, 1,
0.7185447, -0.2640579, 4.185792, 0.6313726, 0, 1, 1,
0.7217798, 1.513528, 0.7808284, 0.6392157, 0, 1, 1,
0.7239271, 1.435636, -0.1942248, 0.6431373, 0, 1, 1,
0.7253621, 1.298732, 1.163418, 0.6509804, 0, 1, 1,
0.7290962, -1.309139, 3.751547, 0.654902, 0, 1, 1,
0.7326921, -0.7208881, 3.213529, 0.6627451, 0, 1, 1,
0.7339876, 0.4247362, -0.8731519, 0.6666667, 0, 1, 1,
0.7343381, 0.1729493, 2.28729, 0.6745098, 0, 1, 1,
0.7344639, 0.3402601, -1.075789, 0.6784314, 0, 1, 1,
0.7445258, 0.9108717, 1.081135, 0.6862745, 0, 1, 1,
0.7467017, -0.2233153, 1.997304, 0.6901961, 0, 1, 1,
0.7499698, 0.2588894, 0.4930606, 0.6980392, 0, 1, 1,
0.7503637, -0.4221801, 1.366721, 0.7058824, 0, 1, 1,
0.760776, -1.71964, 3.930492, 0.7098039, 0, 1, 1,
0.7675331, -0.1599518, 0.5960479, 0.7176471, 0, 1, 1,
0.7746058, -1.544124, 2.132963, 0.7215686, 0, 1, 1,
0.7749906, -0.02985618, 1.802775, 0.7294118, 0, 1, 1,
0.7769969, -0.8108702, 0.3815119, 0.7333333, 0, 1, 1,
0.7776165, 0.9102588, 2.027419, 0.7411765, 0, 1, 1,
0.7895357, -0.3245409, 2.205747, 0.7450981, 0, 1, 1,
0.8014165, -0.5237083, 1.629396, 0.7529412, 0, 1, 1,
0.8076181, -0.6083688, 2.799882, 0.7568628, 0, 1, 1,
0.8087868, 0.6641668, 0.2978247, 0.7647059, 0, 1, 1,
0.8151233, -0.2625262, 3.537093, 0.7686275, 0, 1, 1,
0.8173037, 1.834279, 0.8703946, 0.7764706, 0, 1, 1,
0.8202585, 0.2514009, 1.06531, 0.7803922, 0, 1, 1,
0.8218675, 0.1694158, 1.068619, 0.7882353, 0, 1, 1,
0.822943, 0.5245384, 0.2680969, 0.7921569, 0, 1, 1,
0.8235849, 1.950451, -0.4769687, 0.8, 0, 1, 1,
0.825528, 0.8387702, 0.1737708, 0.8078431, 0, 1, 1,
0.8272274, 0.2953467, 1.009969, 0.8117647, 0, 1, 1,
0.8288233, 2.0092, 0.3974054, 0.8196079, 0, 1, 1,
0.8298263, -0.04391138, -0.5745258, 0.8235294, 0, 1, 1,
0.8312445, -1.083433, 2.564854, 0.8313726, 0, 1, 1,
0.8345034, 0.8970867, -0.1384356, 0.8352941, 0, 1, 1,
0.8407335, 0.05373799, 0.1291464, 0.8431373, 0, 1, 1,
0.842051, -0.4802447, 0.9985701, 0.8470588, 0, 1, 1,
0.8421816, -0.4883988, 0.1624818, 0.854902, 0, 1, 1,
0.8434039, -0.2651535, 2.250432, 0.8588235, 0, 1, 1,
0.8458899, -0.287191, 1.438614, 0.8666667, 0, 1, 1,
0.8465931, -0.08240846, 0.5195122, 0.8705882, 0, 1, 1,
0.8499247, 0.03846046, 1.232561, 0.8784314, 0, 1, 1,
0.8555455, 0.7002876, -1.568507, 0.8823529, 0, 1, 1,
0.8583483, 0.1919584, 2.82303, 0.8901961, 0, 1, 1,
0.8755662, 0.4833677, 1.206325, 0.8941177, 0, 1, 1,
0.8761251, -0.5379775, 2.595522, 0.9019608, 0, 1, 1,
0.8772101, 1.184994, 2.126693, 0.9098039, 0, 1, 1,
0.8823254, -0.002988061, 0.7771634, 0.9137255, 0, 1, 1,
0.8894991, -2.793105, 3.264934, 0.9215686, 0, 1, 1,
0.898854, 0.4893468, 1.120425, 0.9254902, 0, 1, 1,
0.9010831, 0.3267442, 0.9243905, 0.9333333, 0, 1, 1,
0.9059134, -1.004982, 2.534157, 0.9372549, 0, 1, 1,
0.9074603, 0.1971926, 2.751535, 0.945098, 0, 1, 1,
0.9083577, -0.8326601, 2.274215, 0.9490196, 0, 1, 1,
0.9106593, -1.104304, 3.080861, 0.9568627, 0, 1, 1,
0.9107239, -1.185146, 2.075525, 0.9607843, 0, 1, 1,
0.9118424, -0.3233016, 1.354783, 0.9686275, 0, 1, 1,
0.91524, -0.05022962, 2.011239, 0.972549, 0, 1, 1,
0.9240478, -1.298526, 1.049421, 0.9803922, 0, 1, 1,
0.9251556, 1.304036, 1.057997, 0.9843137, 0, 1, 1,
0.9298875, 0.6143979, 0.3398908, 0.9921569, 0, 1, 1,
0.9309766, -0.7637108, 3.972184, 0.9960784, 0, 1, 1,
0.9358431, -0.1823543, 2.196954, 1, 0, 0.9960784, 1,
0.9390926, 2.471886, -1.132599, 1, 0, 0.9882353, 1,
0.953171, -1.968573, 3.552828, 1, 0, 0.9843137, 1,
0.9551606, -0.7946829, 2.948038, 1, 0, 0.9764706, 1,
0.9568291, 1.434725, 0.8406034, 1, 0, 0.972549, 1,
0.9598471, -0.6484331, 3.56522, 1, 0, 0.9647059, 1,
0.9628561, -0.533016, 1.785381, 1, 0, 0.9607843, 1,
0.9644383, -1.671465, 2.176004, 1, 0, 0.9529412, 1,
0.9702504, -0.7944281, 2.967064, 1, 0, 0.9490196, 1,
0.9734907, -0.8642584, 3.146828, 1, 0, 0.9411765, 1,
0.9880058, 2.264448, -0.4964335, 1, 0, 0.9372549, 1,
0.9890857, 0.2164788, -0.2038812, 1, 0, 0.9294118, 1,
0.990258, 0.2403118, 1.497548, 1, 0, 0.9254902, 1,
0.9968374, -1.924412, 2.778651, 1, 0, 0.9176471, 1,
1.001395, -0.2415818, 1.315169, 1, 0, 0.9137255, 1,
1.00642, 0.3149503, 1.27026, 1, 0, 0.9058824, 1,
1.01789, 1.091535, -0.2665263, 1, 0, 0.9019608, 1,
1.022839, 0.8555844, -0.4296159, 1, 0, 0.8941177, 1,
1.027634, -0.6195436, 1.755521, 1, 0, 0.8862745, 1,
1.035111, -0.01613899, 1.965003, 1, 0, 0.8823529, 1,
1.036258, 1.308085, 0.2143053, 1, 0, 0.8745098, 1,
1.03645, -0.108575, 1.435236, 1, 0, 0.8705882, 1,
1.037778, -1.317311, 2.689711, 1, 0, 0.8627451, 1,
1.041068, -0.4041813, 1.478088, 1, 0, 0.8588235, 1,
1.043316, 0.7934997, 1.30282, 1, 0, 0.8509804, 1,
1.046459, 0.538102, -0.3394774, 1, 0, 0.8470588, 1,
1.049854, 0.7433506, 1.012082, 1, 0, 0.8392157, 1,
1.057124, 0.149165, 1.710758, 1, 0, 0.8352941, 1,
1.067206, 0.8857375, 1.192871, 1, 0, 0.827451, 1,
1.070157, -1.179841, 0.2630499, 1, 0, 0.8235294, 1,
1.083464, -1.041933, 2.574853, 1, 0, 0.8156863, 1,
1.084948, 0.6630054, 0.5345348, 1, 0, 0.8117647, 1,
1.087803, -0.1908444, 2.665101, 1, 0, 0.8039216, 1,
1.088932, 0.7002657, 2.270577, 1, 0, 0.7960784, 1,
1.096383, -1.671439, 4.430014, 1, 0, 0.7921569, 1,
1.108397, 0.8046536, 1.326009, 1, 0, 0.7843137, 1,
1.123086, 0.2859102, 1.55326, 1, 0, 0.7803922, 1,
1.130834, 0.3083415, 1.39276, 1, 0, 0.772549, 1,
1.136784, 0.8899209, -0.01710178, 1, 0, 0.7686275, 1,
1.147621, 1.017375, 0.1957352, 1, 0, 0.7607843, 1,
1.163973, -1.084018, 4.147304, 1, 0, 0.7568628, 1,
1.169796, 2.11866, 0.1872529, 1, 0, 0.7490196, 1,
1.169911, -1.293007, 1.778527, 1, 0, 0.7450981, 1,
1.172147, 0.009983826, 1.998362, 1, 0, 0.7372549, 1,
1.182652, -0.3356829, 1.507257, 1, 0, 0.7333333, 1,
1.20578, -0.3692472, 2.728053, 1, 0, 0.7254902, 1,
1.213138, -0.07986649, 0.4501944, 1, 0, 0.7215686, 1,
1.218482, -0.7918695, 2.226657, 1, 0, 0.7137255, 1,
1.219321, -0.9487582, 2.639102, 1, 0, 0.7098039, 1,
1.227033, 0.1021304, 1.148295, 1, 0, 0.7019608, 1,
1.228242, -1.367534, 3.022674, 1, 0, 0.6941177, 1,
1.237669, -1.554644, 1.947137, 1, 0, 0.6901961, 1,
1.240193, 0.4040303, 0.1622057, 1, 0, 0.682353, 1,
1.245305, -1.040727, 2.859978, 1, 0, 0.6784314, 1,
1.255795, -0.9340274, 2.827127, 1, 0, 0.6705883, 1,
1.257777, -0.4408678, 3.062938, 1, 0, 0.6666667, 1,
1.26129, -0.9279524, 1.70876, 1, 0, 0.6588235, 1,
1.271633, -0.4700725, 2.325126, 1, 0, 0.654902, 1,
1.276491, -1.474119, 2.541605, 1, 0, 0.6470588, 1,
1.277038, 0.1278675, 1.788469, 1, 0, 0.6431373, 1,
1.281345, -1.167506, 2.420285, 1, 0, 0.6352941, 1,
1.282393, 0.5015757, 1.212331, 1, 0, 0.6313726, 1,
1.282654, 1.244223, 0.979651, 1, 0, 0.6235294, 1,
1.285693, -0.9671093, 2.618217, 1, 0, 0.6196079, 1,
1.315165, -0.5920117, 2.302412, 1, 0, 0.6117647, 1,
1.316417, -0.5505601, 0.1575295, 1, 0, 0.6078432, 1,
1.316666, 1.472671, 1.576193, 1, 0, 0.6, 1,
1.317043, -0.04543292, 2.338623, 1, 0, 0.5921569, 1,
1.323031, -0.2287292, 0.5421858, 1, 0, 0.5882353, 1,
1.323394, -0.9685304, 2.454219, 1, 0, 0.5803922, 1,
1.324333, -1.343169, 1.884562, 1, 0, 0.5764706, 1,
1.324647, -0.09675906, 3.439637, 1, 0, 0.5686275, 1,
1.32991, -0.5435207, 1.949203, 1, 0, 0.5647059, 1,
1.332209, -0.7762299, 0.06122367, 1, 0, 0.5568628, 1,
1.335647, 0.4693922, 1.030883, 1, 0, 0.5529412, 1,
1.336211, 0.6163018, 2.411061, 1, 0, 0.5450981, 1,
1.338032, -1.227954, 1.437524, 1, 0, 0.5411765, 1,
1.341465, 0.3183641, 0.4975854, 1, 0, 0.5333334, 1,
1.343124, -0.2649765, 2.900374, 1, 0, 0.5294118, 1,
1.356409, -1.162818, 2.092659, 1, 0, 0.5215687, 1,
1.359368, 0.7324499, 2.78589, 1, 0, 0.5176471, 1,
1.362168, 0.1217203, -1.01645, 1, 0, 0.509804, 1,
1.363046, -0.1694072, 1.748346, 1, 0, 0.5058824, 1,
1.372074, 0.7167421, 0.7104005, 1, 0, 0.4980392, 1,
1.37361, 2.625149, 0.5022511, 1, 0, 0.4901961, 1,
1.37479, 0.7131853, -0.5181259, 1, 0, 0.4862745, 1,
1.390697, -2.086082, 4.488031, 1, 0, 0.4784314, 1,
1.400499, 0.3822712, 0.8231043, 1, 0, 0.4745098, 1,
1.406125, 0.7826908, 1.13676, 1, 0, 0.4666667, 1,
1.437363, 0.5119286, 1.173383, 1, 0, 0.4627451, 1,
1.438195, -0.9113151, 1.543535, 1, 0, 0.454902, 1,
1.439582, -0.5244809, 1.680572, 1, 0, 0.4509804, 1,
1.451582, -1.493511, 2.708811, 1, 0, 0.4431373, 1,
1.467698, 0.2487941, 2.736547, 1, 0, 0.4392157, 1,
1.485464, 0.239391, 3.171144, 1, 0, 0.4313726, 1,
1.503197, -0.5551922, 1.513486, 1, 0, 0.427451, 1,
1.508695, -0.5338538, 4.009697, 1, 0, 0.4196078, 1,
1.516769, -0.4143313, 1.702581, 1, 0, 0.4156863, 1,
1.520598, 0.7873129, 2.000446, 1, 0, 0.4078431, 1,
1.533526, 1.46885, 1.265327, 1, 0, 0.4039216, 1,
1.555878, 2.091253, -0.07934791, 1, 0, 0.3960784, 1,
1.558283, 0.0616596, 2.094918, 1, 0, 0.3882353, 1,
1.586924, -0.1662333, 1.10573, 1, 0, 0.3843137, 1,
1.596152, -0.0753959, 1.308754, 1, 0, 0.3764706, 1,
1.597229, -0.8646867, 1.914618, 1, 0, 0.372549, 1,
1.603553, 2.019137, -0.2562878, 1, 0, 0.3647059, 1,
1.604129, 1.18544, 2.160758, 1, 0, 0.3607843, 1,
1.62693, -0.03434368, 2.122374, 1, 0, 0.3529412, 1,
1.628429, 0.3862994, 1.879248, 1, 0, 0.3490196, 1,
1.638385, -0.1001728, 1.102748, 1, 0, 0.3411765, 1,
1.645439, 0.7610204, 0.1254928, 1, 0, 0.3372549, 1,
1.648979, 1.226512, 2.411091, 1, 0, 0.3294118, 1,
1.649225, -0.1593042, 1.673993, 1, 0, 0.3254902, 1,
1.669885, 1.473101, 1.187701, 1, 0, 0.3176471, 1,
1.686451, 1.046273, 0.8800595, 1, 0, 0.3137255, 1,
1.690867, 1.81193, 1.013048, 1, 0, 0.3058824, 1,
1.693545, 1.611291, -0.2157345, 1, 0, 0.2980392, 1,
1.697225, 0.3229943, 1.850488, 1, 0, 0.2941177, 1,
1.698378, 0.3833363, 3.141957, 1, 0, 0.2862745, 1,
1.709552, -1.001754, 3.299947, 1, 0, 0.282353, 1,
1.718268, -0.3057566, 2.304612, 1, 0, 0.2745098, 1,
1.718852, -0.9465768, 0.606314, 1, 0, 0.2705882, 1,
1.725589, -0.01506604, 1.360864, 1, 0, 0.2627451, 1,
1.727688, -0.2180702, 0.8896695, 1, 0, 0.2588235, 1,
1.760196, 0.7849512, 1.030431, 1, 0, 0.2509804, 1,
1.778525, 2.412189, 2.292675, 1, 0, 0.2470588, 1,
1.831995, -0.9951738, 1.61067, 1, 0, 0.2392157, 1,
1.839678, 0.8349487, -0.3069171, 1, 0, 0.2352941, 1,
1.840195, -0.1122536, 1.522208, 1, 0, 0.227451, 1,
1.864139, -0.9871314, 3.071059, 1, 0, 0.2235294, 1,
1.873002, 0.3064831, 0.09902276, 1, 0, 0.2156863, 1,
1.880517, -0.7701981, 0.3706206, 1, 0, 0.2117647, 1,
1.903306, 0.01684455, 0.8543061, 1, 0, 0.2039216, 1,
1.939191, 1.257019, 3.199101, 1, 0, 0.1960784, 1,
1.95749, 1.508186, -1.154233, 1, 0, 0.1921569, 1,
1.974719, 0.3395578, -0.1652516, 1, 0, 0.1843137, 1,
1.988615, -0.3697183, 0.7548997, 1, 0, 0.1803922, 1,
2.007122, -0.3176374, 2.993181, 1, 0, 0.172549, 1,
2.010002, -0.06140408, 2.427689, 1, 0, 0.1686275, 1,
2.011982, 0.7740156, 2.448806, 1, 0, 0.1607843, 1,
2.016489, -0.4115702, 2.204564, 1, 0, 0.1568628, 1,
2.046232, -0.9658822, -0.1406993, 1, 0, 0.1490196, 1,
2.049946, 1.289787, -0.9718276, 1, 0, 0.145098, 1,
2.06291, -2.41362, 3.457311, 1, 0, 0.1372549, 1,
2.071993, 0.3019957, 0.4128155, 1, 0, 0.1333333, 1,
2.085438, 0.7937796, 2.272734, 1, 0, 0.1254902, 1,
2.089789, 0.21069, 2.043688, 1, 0, 0.1215686, 1,
2.112584, -0.7654418, 1.462955, 1, 0, 0.1137255, 1,
2.182362, -0.4134006, 2.821275, 1, 0, 0.1098039, 1,
2.199571, -0.647417, 0.1979091, 1, 0, 0.1019608, 1,
2.200988, 1.01703, 2.121488, 1, 0, 0.09411765, 1,
2.248037, 0.7815106, 4.226575, 1, 0, 0.09019608, 1,
2.264185, -1.168941, 2.011415, 1, 0, 0.08235294, 1,
2.279132, -0.4314986, 3.505977, 1, 0, 0.07843138, 1,
2.292512, 0.4165131, 1.550181, 1, 0, 0.07058824, 1,
2.304333, -1.899058, 2.18999, 1, 0, 0.06666667, 1,
2.346773, 0.0965376, 1.634905, 1, 0, 0.05882353, 1,
2.39873, 1.465822, 0.3217958, 1, 0, 0.05490196, 1,
2.432985, 0.3049173, 0.3598026, 1, 0, 0.04705882, 1,
2.548939, 1.194971, 1.033231, 1, 0, 0.04313726, 1,
2.637221, 0.9319085, 0.4040617, 1, 0, 0.03529412, 1,
2.778175, -1.446708, 2.969726, 1, 0, 0.03137255, 1,
2.963851, -1.357148, 0.4655913, 1, 0, 0.02352941, 1,
3.103884, 0.1471641, 0.8660589, 1, 0, 0.01960784, 1,
3.292261, 0.1916156, 2.640367, 1, 0, 0.01176471, 1,
3.620538, 0.6573433, 0.448737, 1, 0, 0.007843138, 1
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
0.2346599, -3.981064, -6.691174, 0, -0.5, 0.5, 0.5,
0.2346599, -3.981064, -6.691174, 1, -0.5, 0.5, 0.5,
0.2346599, -3.981064, -6.691174, 1, 1.5, 0.5, 0.5,
0.2346599, -3.981064, -6.691174, 0, 1.5, 0.5, 0.5
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
-4.299031, 0.002588511, -6.691174, 0, -0.5, 0.5, 0.5,
-4.299031, 0.002588511, -6.691174, 1, -0.5, 0.5, 0.5,
-4.299031, 0.002588511, -6.691174, 1, 1.5, 0.5, 0.5,
-4.299031, 0.002588511, -6.691174, 0, 1.5, 0.5, 0.5
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
-4.299031, -3.981064, -0.1063302, 0, -0.5, 0.5, 0.5,
-4.299031, -3.981064, -0.1063302, 1, -0.5, 0.5, 0.5,
-4.299031, -3.981064, -0.1063302, 1, 1.5, 0.5, 0.5,
-4.299031, -3.981064, -0.1063302, 0, 1.5, 0.5, 0.5
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
-3, -3.061759, -5.171595,
3, -3.061759, -5.171595,
-3, -3.061759, -5.171595,
-3, -3.214977, -5.424858,
-2, -3.061759, -5.171595,
-2, -3.214977, -5.424858,
-1, -3.061759, -5.171595,
-1, -3.214977, -5.424858,
0, -3.061759, -5.171595,
0, -3.214977, -5.424858,
1, -3.061759, -5.171595,
1, -3.214977, -5.424858,
2, -3.061759, -5.171595,
2, -3.214977, -5.424858,
3, -3.061759, -5.171595,
3, -3.214977, -5.424858
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
-3, -3.521412, -5.931384, 0, -0.5, 0.5, 0.5,
-3, -3.521412, -5.931384, 1, -0.5, 0.5, 0.5,
-3, -3.521412, -5.931384, 1, 1.5, 0.5, 0.5,
-3, -3.521412, -5.931384, 0, 1.5, 0.5, 0.5,
-2, -3.521412, -5.931384, 0, -0.5, 0.5, 0.5,
-2, -3.521412, -5.931384, 1, -0.5, 0.5, 0.5,
-2, -3.521412, -5.931384, 1, 1.5, 0.5, 0.5,
-2, -3.521412, -5.931384, 0, 1.5, 0.5, 0.5,
-1, -3.521412, -5.931384, 0, -0.5, 0.5, 0.5,
-1, -3.521412, -5.931384, 1, -0.5, 0.5, 0.5,
-1, -3.521412, -5.931384, 1, 1.5, 0.5, 0.5,
-1, -3.521412, -5.931384, 0, 1.5, 0.5, 0.5,
0, -3.521412, -5.931384, 0, -0.5, 0.5, 0.5,
0, -3.521412, -5.931384, 1, -0.5, 0.5, 0.5,
0, -3.521412, -5.931384, 1, 1.5, 0.5, 0.5,
0, -3.521412, -5.931384, 0, 1.5, 0.5, 0.5,
1, -3.521412, -5.931384, 0, -0.5, 0.5, 0.5,
1, -3.521412, -5.931384, 1, -0.5, 0.5, 0.5,
1, -3.521412, -5.931384, 1, 1.5, 0.5, 0.5,
1, -3.521412, -5.931384, 0, 1.5, 0.5, 0.5,
2, -3.521412, -5.931384, 0, -0.5, 0.5, 0.5,
2, -3.521412, -5.931384, 1, -0.5, 0.5, 0.5,
2, -3.521412, -5.931384, 1, 1.5, 0.5, 0.5,
2, -3.521412, -5.931384, 0, 1.5, 0.5, 0.5,
3, -3.521412, -5.931384, 0, -0.5, 0.5, 0.5,
3, -3.521412, -5.931384, 1, -0.5, 0.5, 0.5,
3, -3.521412, -5.931384, 1, 1.5, 0.5, 0.5,
3, -3.521412, -5.931384, 0, 1.5, 0.5, 0.5
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
-3.252795, -2, -5.171595,
-3.252795, 2, -5.171595,
-3.252795, -2, -5.171595,
-3.427167, -2, -5.424858,
-3.252795, -1, -5.171595,
-3.427167, -1, -5.424858,
-3.252795, 0, -5.171595,
-3.427167, 0, -5.424858,
-3.252795, 1, -5.171595,
-3.427167, 1, -5.424858,
-3.252795, 2, -5.171595,
-3.427167, 2, -5.424858
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
-3.775913, -2, -5.931384, 0, -0.5, 0.5, 0.5,
-3.775913, -2, -5.931384, 1, -0.5, 0.5, 0.5,
-3.775913, -2, -5.931384, 1, 1.5, 0.5, 0.5,
-3.775913, -2, -5.931384, 0, 1.5, 0.5, 0.5,
-3.775913, -1, -5.931384, 0, -0.5, 0.5, 0.5,
-3.775913, -1, -5.931384, 1, -0.5, 0.5, 0.5,
-3.775913, -1, -5.931384, 1, 1.5, 0.5, 0.5,
-3.775913, -1, -5.931384, 0, 1.5, 0.5, 0.5,
-3.775913, 0, -5.931384, 0, -0.5, 0.5, 0.5,
-3.775913, 0, -5.931384, 1, -0.5, 0.5, 0.5,
-3.775913, 0, -5.931384, 1, 1.5, 0.5, 0.5,
-3.775913, 0, -5.931384, 0, 1.5, 0.5, 0.5,
-3.775913, 1, -5.931384, 0, -0.5, 0.5, 0.5,
-3.775913, 1, -5.931384, 1, -0.5, 0.5, 0.5,
-3.775913, 1, -5.931384, 1, 1.5, 0.5, 0.5,
-3.775913, 1, -5.931384, 0, 1.5, 0.5, 0.5,
-3.775913, 2, -5.931384, 0, -0.5, 0.5, 0.5,
-3.775913, 2, -5.931384, 1, -0.5, 0.5, 0.5,
-3.775913, 2, -5.931384, 1, 1.5, 0.5, 0.5,
-3.775913, 2, -5.931384, 0, 1.5, 0.5, 0.5
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
-3.252795, -3.061759, -4,
-3.252795, -3.061759, 4,
-3.252795, -3.061759, -4,
-3.427167, -3.214977, -4,
-3.252795, -3.061759, -2,
-3.427167, -3.214977, -2,
-3.252795, -3.061759, 0,
-3.427167, -3.214977, 0,
-3.252795, -3.061759, 2,
-3.427167, -3.214977, 2,
-3.252795, -3.061759, 4,
-3.427167, -3.214977, 4
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
-3.775913, -3.521412, -4, 0, -0.5, 0.5, 0.5,
-3.775913, -3.521412, -4, 1, -0.5, 0.5, 0.5,
-3.775913, -3.521412, -4, 1, 1.5, 0.5, 0.5,
-3.775913, -3.521412, -4, 0, 1.5, 0.5, 0.5,
-3.775913, -3.521412, -2, 0, -0.5, 0.5, 0.5,
-3.775913, -3.521412, -2, 1, -0.5, 0.5, 0.5,
-3.775913, -3.521412, -2, 1, 1.5, 0.5, 0.5,
-3.775913, -3.521412, -2, 0, 1.5, 0.5, 0.5,
-3.775913, -3.521412, 0, 0, -0.5, 0.5, 0.5,
-3.775913, -3.521412, 0, 1, -0.5, 0.5, 0.5,
-3.775913, -3.521412, 0, 1, 1.5, 0.5, 0.5,
-3.775913, -3.521412, 0, 0, 1.5, 0.5, 0.5,
-3.775913, -3.521412, 2, 0, -0.5, 0.5, 0.5,
-3.775913, -3.521412, 2, 1, -0.5, 0.5, 0.5,
-3.775913, -3.521412, 2, 1, 1.5, 0.5, 0.5,
-3.775913, -3.521412, 2, 0, 1.5, 0.5, 0.5,
-3.775913, -3.521412, 4, 0, -0.5, 0.5, 0.5,
-3.775913, -3.521412, 4, 1, -0.5, 0.5, 0.5,
-3.775913, -3.521412, 4, 1, 1.5, 0.5, 0.5,
-3.775913, -3.521412, 4, 0, 1.5, 0.5, 0.5
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
-3.252795, -3.061759, -5.171595,
-3.252795, 3.066936, -5.171595,
-3.252795, -3.061759, 4.958934,
-3.252795, 3.066936, 4.958934,
-3.252795, -3.061759, -5.171595,
-3.252795, -3.061759, 4.958934,
-3.252795, 3.066936, -5.171595,
-3.252795, 3.066936, 4.958934,
-3.252795, -3.061759, -5.171595,
3.722114, -3.061759, -5.171595,
-3.252795, -3.061759, 4.958934,
3.722114, -3.061759, 4.958934,
-3.252795, 3.066936, -5.171595,
3.722114, 3.066936, -5.171595,
-3.252795, 3.066936, 4.958934,
3.722114, 3.066936, 4.958934,
3.722114, -3.061759, -5.171595,
3.722114, 3.066936, -5.171595,
3.722114, -3.061759, 4.958934,
3.722114, 3.066936, 4.958934,
3.722114, -3.061759, -5.171595,
3.722114, -3.061759, 4.958934,
3.722114, 3.066936, -5.171595,
3.722114, 3.066936, 4.958934
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
var radius = 7.33787;
var distance = 32.64701;
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
mvMatrix.translate( -0.2346599, -0.002588511, 0.1063302 );
mvMatrix.scale( 1.137484, 1.294541, 0.7831624 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.64701);
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
diethyl_thiophosphat<-read.table("diethyl_thiophosphat.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-diethyl_thiophosphat$V2
```

```
## Error in eval(expr, envir, enclos): object 'diethyl_thiophosphat' not found
```

```r
y<-diethyl_thiophosphat$V3
```

```
## Error in eval(expr, envir, enclos): object 'diethyl_thiophosphat' not found
```

```r
z<-diethyl_thiophosphat$V4
```

```
## Error in eval(expr, envir, enclos): object 'diethyl_thiophosphat' not found
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
-3.151218, -0.5613395, -1.638229, 0, 0, 1, 1, 1,
-2.915386, 0.4340909, -0.2234219, 1, 0, 0, 1, 1,
-2.898336, 0.5165625, -0.5791968, 1, 0, 0, 1, 1,
-2.739789, -0.1651053, -2.139142, 1, 0, 0, 1, 1,
-2.651234, 0.926428, -0.2685247, 1, 0, 0, 1, 1,
-2.538635, -0.687097, -1.636774, 1, 0, 0, 1, 1,
-2.512781, 0.05353532, -1.035969, 0, 0, 0, 1, 1,
-2.491502, -0.5666543, -1.286725, 0, 0, 0, 1, 1,
-2.403417, 0.4676295, -2.27867, 0, 0, 0, 1, 1,
-2.401461, 1.631168, -1.430265, 0, 0, 0, 1, 1,
-2.370173, 0.9050656, -1.59652, 0, 0, 0, 1, 1,
-2.274623, 0.1936659, -1.037692, 0, 0, 0, 1, 1,
-2.25645, 1.071119, -0.8585791, 0, 0, 0, 1, 1,
-2.190368, 1.396346, -2.479674, 1, 1, 1, 1, 1,
-2.162277, -0.6625571, -2.230396, 1, 1, 1, 1, 1,
-2.142323, 0.6802681, -2.172549, 1, 1, 1, 1, 1,
-2.070827, -0.4970592, -3.208697, 1, 1, 1, 1, 1,
-2.06049, 0.9191323, -2.263592, 1, 1, 1, 1, 1,
-2.040515, 0.0604816, -2.479863, 1, 1, 1, 1, 1,
-2.003667, 0.002723081, -2.199099, 1, 1, 1, 1, 1,
-1.968881, -1.681636, -2.471412, 1, 1, 1, 1, 1,
-1.926326, -0.5602719, -2.453959, 1, 1, 1, 1, 1,
-1.905816, 1.128436, 0.2759555, 1, 1, 1, 1, 1,
-1.903929, 0.921909, -0.6485883, 1, 1, 1, 1, 1,
-1.901104, -0.9875304, -2.616031, 1, 1, 1, 1, 1,
-1.886273, -1.546605, -2.245255, 1, 1, 1, 1, 1,
-1.878362, 1.704043, -0.5245259, 1, 1, 1, 1, 1,
-1.862279, -0.5953501, -1.854234, 1, 1, 1, 1, 1,
-1.844364, -0.386212, -0.1624189, 0, 0, 1, 1, 1,
-1.827617, -1.804268, -2.506145, 1, 0, 0, 1, 1,
-1.826433, -0.6082904, -1.223902, 1, 0, 0, 1, 1,
-1.817373, -0.8482131, -1.550313, 1, 0, 0, 1, 1,
-1.813184, -0.8359962, -2.233922, 1, 0, 0, 1, 1,
-1.811997, 0.4000107, -1.791893, 1, 0, 0, 1, 1,
-1.805559, 0.2052941, -2.736675, 0, 0, 0, 1, 1,
-1.800513, 0.03491645, -0.07557917, 0, 0, 0, 1, 1,
-1.799359, 1.058104, 0.4728963, 0, 0, 0, 1, 1,
-1.738657, -0.4770569, -3.997483, 0, 0, 0, 1, 1,
-1.733924, 0.9806525, -1.547318, 0, 0, 0, 1, 1,
-1.732191, -0.5925092, -3.591924, 0, 0, 0, 1, 1,
-1.721713, 0.3297489, -0.9830287, 0, 0, 0, 1, 1,
-1.706863, -0.6753412, -0.5322325, 1, 1, 1, 1, 1,
-1.701473, 0.3434678, -2.028006, 1, 1, 1, 1, 1,
-1.692088, 0.6169873, -2.054433, 1, 1, 1, 1, 1,
-1.663706, 0.5047765, -2.602324, 1, 1, 1, 1, 1,
-1.661866, -1.693709, -2.944258, 1, 1, 1, 1, 1,
-1.638435, 0.7960036, -0.3763761, 1, 1, 1, 1, 1,
-1.618011, 1.518551, 0.1332578, 1, 1, 1, 1, 1,
-1.617981, 0.2472505, -2.136886, 1, 1, 1, 1, 1,
-1.612248, -0.1021716, -2.113639, 1, 1, 1, 1, 1,
-1.584184, 0.4526785, 0.9951178, 1, 1, 1, 1, 1,
-1.579422, -1.753837, -3.077522, 1, 1, 1, 1, 1,
-1.575873, 1.342987, -1.8572, 1, 1, 1, 1, 1,
-1.572609, 0.6188658, -2.770185, 1, 1, 1, 1, 1,
-1.564113, 1.709637, 0.8042541, 1, 1, 1, 1, 1,
-1.562016, 0.9161322, -0.8047968, 1, 1, 1, 1, 1,
-1.549325, -0.1962976, -0.3804581, 0, 0, 1, 1, 1,
-1.538939, -0.492666, -2.464, 1, 0, 0, 1, 1,
-1.538338, -0.4612494, -0.7418896, 1, 0, 0, 1, 1,
-1.527038, 0.8307884, -1.922388, 1, 0, 0, 1, 1,
-1.526256, 1.070894, -0.2966503, 1, 0, 0, 1, 1,
-1.509094, 0.463699, -0.958227, 1, 0, 0, 1, 1,
-1.505636, -1.821819, -1.844488, 0, 0, 0, 1, 1,
-1.488072, -0.1660534, -1.147187, 0, 0, 0, 1, 1,
-1.468804, 0.7692197, -1.30629, 0, 0, 0, 1, 1,
-1.454754, 0.614812, -1.333907, 0, 0, 0, 1, 1,
-1.450907, -0.1462477, -2.954007, 0, 0, 0, 1, 1,
-1.445757, -0.4053602, -2.551715, 0, 0, 0, 1, 1,
-1.444304, -0.1865335, -0.3497201, 0, 0, 0, 1, 1,
-1.427679, -0.6940604, -1.604034, 1, 1, 1, 1, 1,
-1.420172, 1.370041, -0.6154766, 1, 1, 1, 1, 1,
-1.414618, 0.5335504, -0.6837175, 1, 1, 1, 1, 1,
-1.41043, 0.2299268, 0.3368644, 1, 1, 1, 1, 1,
-1.404412, 0.9276562, -1.418979, 1, 1, 1, 1, 1,
-1.402772, -0.07529724, -1.890169, 1, 1, 1, 1, 1,
-1.394362, 0.3739067, -1.416545, 1, 1, 1, 1, 1,
-1.377699, 0.5377584, -1.259765, 1, 1, 1, 1, 1,
-1.370376, 1.411097, -1.457397, 1, 1, 1, 1, 1,
-1.365218, -1.034374, -1.46211, 1, 1, 1, 1, 1,
-1.362212, -0.3315269, -1.768979, 1, 1, 1, 1, 1,
-1.360656, -0.1408758, -1.103312, 1, 1, 1, 1, 1,
-1.356786, 0.6456942, -1.546533, 1, 1, 1, 1, 1,
-1.349114, 0.9089971, -0.8319561, 1, 1, 1, 1, 1,
-1.338978, 1.109883, -0.8838365, 1, 1, 1, 1, 1,
-1.329283, 0.2629348, -1.275752, 0, 0, 1, 1, 1,
-1.322197, 0.2778108, -0.1011876, 1, 0, 0, 1, 1,
-1.319629, 1.882195, 0.09363498, 1, 0, 0, 1, 1,
-1.319511, -1.168394, -0.9445916, 1, 0, 0, 1, 1,
-1.312013, -0.7724015, 0.5228571, 1, 0, 0, 1, 1,
-1.297856, 0.6141713, -1.15901, 1, 0, 0, 1, 1,
-1.296755, 0.4473835, -1.308994, 0, 0, 0, 1, 1,
-1.294802, -0.159592, -2.158682, 0, 0, 0, 1, 1,
-1.290871, 0.2684031, -1.02417, 0, 0, 0, 1, 1,
-1.290131, -0.1883688, -1.760456, 0, 0, 0, 1, 1,
-1.253021, -0.4911087, -2.068084, 0, 0, 0, 1, 1,
-1.24998, 0.394303, -0.2319977, 0, 0, 0, 1, 1,
-1.238466, 0.5570487, -3.089901, 0, 0, 0, 1, 1,
-1.230744, -1.599464, -3.346327, 1, 1, 1, 1, 1,
-1.229479, 0.5086704, -1.24709, 1, 1, 1, 1, 1,
-1.229429, 0.3423072, -2.127736, 1, 1, 1, 1, 1,
-1.225967, 0.2490694, -2.314341, 1, 1, 1, 1, 1,
-1.221787, -0.7363545, -2.987105, 1, 1, 1, 1, 1,
-1.217716, -1.531794, -1.878358, 1, 1, 1, 1, 1,
-1.214526, -0.6474832, -2.198403, 1, 1, 1, 1, 1,
-1.211736, 0.5085002, -2.565666, 1, 1, 1, 1, 1,
-1.210674, 0.451522, -1.572203, 1, 1, 1, 1, 1,
-1.209109, -0.5367818, -0.1480161, 1, 1, 1, 1, 1,
-1.20616, -0.8718479, -1.92596, 1, 1, 1, 1, 1,
-1.202221, 0.4477028, -0.9900854, 1, 1, 1, 1, 1,
-1.200164, 0.9393139, -2.703947, 1, 1, 1, 1, 1,
-1.179438, 1.393682, 0.2749181, 1, 1, 1, 1, 1,
-1.179121, 1.432253, -0.3182032, 1, 1, 1, 1, 1,
-1.171857, -1.402238, -2.550481, 0, 0, 1, 1, 1,
-1.1717, 0.05727581, -1.238915, 1, 0, 0, 1, 1,
-1.169257, 0.5869473, -1.028419, 1, 0, 0, 1, 1,
-1.166983, 0.2320317, 0.351688, 1, 0, 0, 1, 1,
-1.154757, -0.4411116, -2.046174, 1, 0, 0, 1, 1,
-1.143838, 0.2811707, -1.837679, 1, 0, 0, 1, 1,
-1.140965, -0.3885995, -0.9467644, 0, 0, 0, 1, 1,
-1.140183, 0.8733983, -2.832226, 0, 0, 0, 1, 1,
-1.139452, -0.4419904, -1.542037, 0, 0, 0, 1, 1,
-1.138123, -0.7332997, -2.352395, 0, 0, 0, 1, 1,
-1.135469, 0.3589166, -1.041759, 0, 0, 0, 1, 1,
-1.133412, -0.7405541, -1.264629, 0, 0, 0, 1, 1,
-1.123794, -0.2975852, -1.384497, 0, 0, 0, 1, 1,
-1.117278, -0.8436232, -0.722133, 1, 1, 1, 1, 1,
-1.116515, 1.311312, -0.3933165, 1, 1, 1, 1, 1,
-1.116304, -1.135754, -3.95768, 1, 1, 1, 1, 1,
-1.11328, -0.5428351, -2.185592, 1, 1, 1, 1, 1,
-1.106738, -0.08598585, -0.1400106, 1, 1, 1, 1, 1,
-1.105859, 0.5135345, -2.276584, 1, 1, 1, 1, 1,
-1.077108, -0.7304606, -2.981786, 1, 1, 1, 1, 1,
-1.074099, -0.2406912, -0.1981423, 1, 1, 1, 1, 1,
-1.07165, -0.7726949, -2.431089, 1, 1, 1, 1, 1,
-1.070856, -1.273319, -3.900492, 1, 1, 1, 1, 1,
-1.069348, -1.920493, -1.311061, 1, 1, 1, 1, 1,
-1.067688, -0.329679, -0.05573108, 1, 1, 1, 1, 1,
-1.065291, -0.5192503, -2.305419, 1, 1, 1, 1, 1,
-1.064662, 0.2346922, -2.869326, 1, 1, 1, 1, 1,
-1.06353, 0.269723, -3.118172, 1, 1, 1, 1, 1,
-1.063166, 0.5341948, -0.08764967, 0, 0, 1, 1, 1,
-1.052075, -0.6096646, -2.768691, 1, 0, 0, 1, 1,
-1.046226, 1.736833, 0.3254119, 1, 0, 0, 1, 1,
-1.035829, -0.6643004, -3.245709, 1, 0, 0, 1, 1,
-1.032975, 0.2692221, -0.7644387, 1, 0, 0, 1, 1,
-1.029431, -0.1910231, -2.580303, 1, 0, 0, 1, 1,
-1.024967, 0.2161312, -2.160436, 0, 0, 0, 1, 1,
-1.022373, -0.2065392, -2.280198, 0, 0, 0, 1, 1,
-1.016721, -0.4242475, -2.169352, 0, 0, 0, 1, 1,
-1.012852, 0.1700895, -1.227606, 0, 0, 0, 1, 1,
-1.006166, 0.2699243, -1.189269, 0, 0, 0, 1, 1,
-1.005661, 1.326737, 0.4292666, 0, 0, 0, 1, 1,
-1.000878, -0.439336, -2.391421, 0, 0, 0, 1, 1,
-0.9896742, -0.5213118, -3.164769, 1, 1, 1, 1, 1,
-0.9861549, -0.2978873, -2.47314, 1, 1, 1, 1, 1,
-0.9816289, -0.4096863, -3.09344, 1, 1, 1, 1, 1,
-0.9672922, -0.00687801, -1.516871, 1, 1, 1, 1, 1,
-0.9523551, 0.676435, -1.269818, 1, 1, 1, 1, 1,
-0.9491903, 0.6169261, -1.608072, 1, 1, 1, 1, 1,
-0.9476489, -0.3448023, -0.3259768, 1, 1, 1, 1, 1,
-0.9383569, -1.335908, -2.167866, 1, 1, 1, 1, 1,
-0.9215611, -0.685016, -0.5216998, 1, 1, 1, 1, 1,
-0.9167355, 1.126929, -1.923437, 1, 1, 1, 1, 1,
-0.9049924, 0.5553234, -2.298722, 1, 1, 1, 1, 1,
-0.9032641, -0.7750276, -2.287438, 1, 1, 1, 1, 1,
-0.8964723, 0.5798267, -0.9220412, 1, 1, 1, 1, 1,
-0.890034, -1.013016, -4.365054, 1, 1, 1, 1, 1,
-0.8872315, 0.5154794, -0.5497323, 1, 1, 1, 1, 1,
-0.8865019, 0.8684424, -1.124521, 0, 0, 1, 1, 1,
-0.8828614, 1.180747, -1.124604, 1, 0, 0, 1, 1,
-0.8828323, -2.081669, -2.630403, 1, 0, 0, 1, 1,
-0.8792687, 0.8268676, -1.590018, 1, 0, 0, 1, 1,
-0.8784503, -0.3525013, -4.161172, 1, 0, 0, 1, 1,
-0.873997, -0.2069066, 0.1458728, 1, 0, 0, 1, 1,
-0.873771, -0.24112, -0.5535276, 0, 0, 0, 1, 1,
-0.8735867, -2.098608, -3.683996, 0, 0, 0, 1, 1,
-0.8684525, 0.1697626, -2.070668, 0, 0, 0, 1, 1,
-0.8647721, -0.8751125, -1.156908, 0, 0, 0, 1, 1,
-0.8643423, 0.5278134, -0.917926, 0, 0, 0, 1, 1,
-0.8627053, 0.0586132, -2.083986, 0, 0, 0, 1, 1,
-0.8620461, -0.6957397, -2.295195, 0, 0, 0, 1, 1,
-0.8586882, -0.718542, -2.62385, 1, 1, 1, 1, 1,
-0.8568618, -0.1014524, -4.364967, 1, 1, 1, 1, 1,
-0.8532175, -0.5728974, -1.791956, 1, 1, 1, 1, 1,
-0.8525894, -0.08599871, -0.9035431, 1, 1, 1, 1, 1,
-0.8470813, 1.142743, 0.1587791, 1, 1, 1, 1, 1,
-0.8426662, -1.121458, -2.281018, 1, 1, 1, 1, 1,
-0.8407208, 0.05828774, 0.1738856, 1, 1, 1, 1, 1,
-0.8364739, 0.4046927, -1.35531, 1, 1, 1, 1, 1,
-0.8316776, 1.456027, -0.9061572, 1, 1, 1, 1, 1,
-0.8252926, -1.504297, -2.919667, 1, 1, 1, 1, 1,
-0.8194565, -0.4025981, -2.547118, 1, 1, 1, 1, 1,
-0.8072487, -1.125459, -2.790254, 1, 1, 1, 1, 1,
-0.7928365, -0.2376783, -0.5324057, 1, 1, 1, 1, 1,
-0.7870792, -0.3410844, -2.644656, 1, 1, 1, 1, 1,
-0.7866124, -0.964205, -2.888338, 1, 1, 1, 1, 1,
-0.7865842, -0.04275769, -0.6745515, 0, 0, 1, 1, 1,
-0.7863417, 1.147358, 0.7169613, 1, 0, 0, 1, 1,
-0.7828667, 0.8423771, -0.133388, 1, 0, 0, 1, 1,
-0.7824904, -1.53997, -3.432308, 1, 0, 0, 1, 1,
-0.7769226, -0.2208853, -2.371894, 1, 0, 0, 1, 1,
-0.7768282, 1.352972, -1.030579, 1, 0, 0, 1, 1,
-0.7730978, -1.030491, -2.412664, 0, 0, 0, 1, 1,
-0.7730885, 2.510517, 1.251807, 0, 0, 0, 1, 1,
-0.7707464, 0.722966, -0.2498856, 0, 0, 0, 1, 1,
-0.7697608, 0.1531315, -1.857595, 0, 0, 0, 1, 1,
-0.7640951, 1.660519, -1.970807, 0, 0, 0, 1, 1,
-0.7624577, -1.170382, -1.952923, 0, 0, 0, 1, 1,
-0.7591996, 1.637062, 0.1763389, 0, 0, 0, 1, 1,
-0.7568113, 0.1022052, -1.357534, 1, 1, 1, 1, 1,
-0.7554044, 0.4760011, 0.1158348, 1, 1, 1, 1, 1,
-0.7551754, -1.23872, -4.215868, 1, 1, 1, 1, 1,
-0.7532886, 1.345141, -0.4370783, 1, 1, 1, 1, 1,
-0.7524717, -1.814126, -2.303315, 1, 1, 1, 1, 1,
-0.7511502, 0.4335444, -1.446518, 1, 1, 1, 1, 1,
-0.7495658, 0.1178044, -2.040899, 1, 1, 1, 1, 1,
-0.7480875, -1.204649, -2.515544, 1, 1, 1, 1, 1,
-0.7407484, 1.345211, -1.202521, 1, 1, 1, 1, 1,
-0.7359184, -1.144683, -2.027557, 1, 1, 1, 1, 1,
-0.735111, -0.8116395, -2.501937, 1, 1, 1, 1, 1,
-0.7297064, -0.4707389, -3.27319, 1, 1, 1, 1, 1,
-0.7260661, -0.2621497, -2.653676, 1, 1, 1, 1, 1,
-0.7257617, -1.79701, -2.965214, 1, 1, 1, 1, 1,
-0.7254344, -0.794089, -3.781241, 1, 1, 1, 1, 1,
-0.7237184, -0.4481497, -1.660225, 0, 0, 1, 1, 1,
-0.7224569, -0.4589537, -1.498868, 1, 0, 0, 1, 1,
-0.7161419, 0.176376, 0.4214863, 1, 0, 0, 1, 1,
-0.7055091, -0.2568141, -1.99709, 1, 0, 0, 1, 1,
-0.6992217, -2.156593, -3.251842, 1, 0, 0, 1, 1,
-0.6912792, 1.410468, 0.7003385, 1, 0, 0, 1, 1,
-0.6908879, 2.287941, 1.352569, 0, 0, 0, 1, 1,
-0.688125, -0.7283627, -2.912244, 0, 0, 0, 1, 1,
-0.687678, 0.5187895, -1.027715, 0, 0, 0, 1, 1,
-0.6825683, -1.088293, -3.344755, 0, 0, 0, 1, 1,
-0.6796577, 1.41727, 0.5140403, 0, 0, 0, 1, 1,
-0.6781641, 0.5574475, 0.1490869, 0, 0, 0, 1, 1,
-0.6753598, -1.013725, -3.251762, 0, 0, 0, 1, 1,
-0.6729764, 0.1785717, -1.113996, 1, 1, 1, 1, 1,
-0.6717271, 0.7897352, -0.1450296, 1, 1, 1, 1, 1,
-0.670633, -0.7294403, -3.376206, 1, 1, 1, 1, 1,
-0.6689978, -1.451766, -1.297996, 1, 1, 1, 1, 1,
-0.6607072, 0.5953878, -0.4917525, 1, 1, 1, 1, 1,
-0.6588274, 1.847703, -0.9794474, 1, 1, 1, 1, 1,
-0.6578509, -0.618352, -2.787705, 1, 1, 1, 1, 1,
-0.6541054, 0.6571718, 0.7185416, 1, 1, 1, 1, 1,
-0.6513712, -0.231681, -2.275754, 1, 1, 1, 1, 1,
-0.6507909, 0.6074163, 1.270226, 1, 1, 1, 1, 1,
-0.6493748, -0.3436567, -2.303506, 1, 1, 1, 1, 1,
-0.644784, -0.7046735, -1.209096, 1, 1, 1, 1, 1,
-0.6415768, 1.245144, -1.61134, 1, 1, 1, 1, 1,
-0.6378683, -0.1685646, -2.997118, 1, 1, 1, 1, 1,
-0.6271163, -0.700015, -0.04164191, 1, 1, 1, 1, 1,
-0.6257384, -0.3701656, -3.70937, 0, 0, 1, 1, 1,
-0.6253821, 1.776411, -0.9863554, 1, 0, 0, 1, 1,
-0.6252093, -1.41346, -3.571951, 1, 0, 0, 1, 1,
-0.6246977, 0.5981486, 0.5734218, 1, 0, 0, 1, 1,
-0.6233532, -0.2992627, -1.697604, 1, 0, 0, 1, 1,
-0.6163298, -0.8083557, -2.365486, 1, 0, 0, 1, 1,
-0.6121669, -0.5262325, -2.076319, 0, 0, 0, 1, 1,
-0.6107299, 0.9373497, -1.716804, 0, 0, 0, 1, 1,
-0.6050992, -1.423086, -3.369299, 0, 0, 0, 1, 1,
-0.6008406, -0.4594255, -0.2262339, 0, 0, 0, 1, 1,
-0.6005667, 1.465365, -1.371052, 0, 0, 0, 1, 1,
-0.5959983, -0.01223822, -3.041776, 0, 0, 0, 1, 1,
-0.5831802, -0.9352157, -3.622352, 0, 0, 0, 1, 1,
-0.5820548, -0.8273808, -1.359668, 1, 1, 1, 1, 1,
-0.5802285, 0.8841573, -0.4076747, 1, 1, 1, 1, 1,
-0.5775784, 0.6074381, 0.6950923, 1, 1, 1, 1, 1,
-0.5748885, -1.438236, -3.029358, 1, 1, 1, 1, 1,
-0.5739577, -0.4093394, -2.908684, 1, 1, 1, 1, 1,
-0.5735441, -0.3342949, -1.38437, 1, 1, 1, 1, 1,
-0.5725837, -0.2151561, -0.5080231, 1, 1, 1, 1, 1,
-0.5693654, -0.2635383, -1.338373, 1, 1, 1, 1, 1,
-0.5685752, -0.6402359, -4.158263, 1, 1, 1, 1, 1,
-0.5678754, 0.1877876, -1.547727, 1, 1, 1, 1, 1,
-0.5671842, 0.9900644, -0.3642314, 1, 1, 1, 1, 1,
-0.562835, 1.121838, -0.4876579, 1, 1, 1, 1, 1,
-0.5622187, 1.098596, -1.37353, 1, 1, 1, 1, 1,
-0.5621207, -0.7010842, -2.357446, 1, 1, 1, 1, 1,
-0.5609346, -0.1953247, -1.185073, 1, 1, 1, 1, 1,
-0.5589949, -0.3101231, -2.646574, 0, 0, 1, 1, 1,
-0.5550171, -0.364857, -1.162778, 1, 0, 0, 1, 1,
-0.5549453, 0.9023829, -0.6979303, 1, 0, 0, 1, 1,
-0.5542854, -1.184692, -3.72925, 1, 0, 0, 1, 1,
-0.5530738, -1.066069, -1.180976, 1, 0, 0, 1, 1,
-0.5530196, 0.1490658, -2.506614, 1, 0, 0, 1, 1,
-0.5512853, 0.3918851, -0.8014484, 0, 0, 0, 1, 1,
-0.5506556, 1.275364, -1.71113, 0, 0, 0, 1, 1,
-0.5465985, 0.415079, -2.651433, 0, 0, 0, 1, 1,
-0.5448193, -0.6127276, -2.772131, 0, 0, 0, 1, 1,
-0.5413349, 0.4353874, 1.417541, 0, 0, 0, 1, 1,
-0.5391286, -0.3410316, -0.4840501, 0, 0, 0, 1, 1,
-0.5381764, -0.4743867, -1.67143, 0, 0, 0, 1, 1,
-0.5310515, 0.08604153, -4.204761, 1, 1, 1, 1, 1,
-0.5236825, -1.460324, -3.738414, 1, 1, 1, 1, 1,
-0.5233535, -0.8516399, -2.662743, 1, 1, 1, 1, 1,
-0.5228301, -1.641774, -2.451016, 1, 1, 1, 1, 1,
-0.5220065, -0.2071005, -2.786203, 1, 1, 1, 1, 1,
-0.5214156, -0.5834823, -1.738432, 1, 1, 1, 1, 1,
-0.5192958, 2.761798, 0.07301317, 1, 1, 1, 1, 1,
-0.5167408, -1.535768, -3.920128, 1, 1, 1, 1, 1,
-0.5153174, -0.6124495, -3.382919, 1, 1, 1, 1, 1,
-0.5038368, -0.3251462, -1.945031, 1, 1, 1, 1, 1,
-0.5035515, 0.5071372, -0.3880929, 1, 1, 1, 1, 1,
-0.5028062, -0.2967638, -2.471716, 1, 1, 1, 1, 1,
-0.5011791, -2.051163, -3.039136, 1, 1, 1, 1, 1,
-0.4997641, 0.8301588, -1.526513, 1, 1, 1, 1, 1,
-0.4932796, -0.1298026, -1.260444, 1, 1, 1, 1, 1,
-0.486518, -0.4500471, -1.920022, 0, 0, 1, 1, 1,
-0.4840866, 1.627462, 1.636391, 1, 0, 0, 1, 1,
-0.4835039, 0.1070063, -1.208005, 1, 0, 0, 1, 1,
-0.482873, -0.4889964, -1.724621, 1, 0, 0, 1, 1,
-0.4646537, 0.739594, -0.3830419, 1, 0, 0, 1, 1,
-0.4627803, 1.013162, -1.499532, 1, 0, 0, 1, 1,
-0.4551612, 0.2749434, 0.05858102, 0, 0, 0, 1, 1,
-0.4546334, 0.9678625, -0.3035846, 0, 0, 0, 1, 1,
-0.4544755, 0.8574269, -1.197319, 0, 0, 0, 1, 1,
-0.4527425, -0.6323037, -1.001333, 0, 0, 0, 1, 1,
-0.4523987, -0.124475, -1.203282, 0, 0, 0, 1, 1,
-0.4520265, 0.8767563, -2.198554, 0, 0, 0, 1, 1,
-0.4475218, -0.2762179, -2.392437, 0, 0, 0, 1, 1,
-0.446495, -0.2582371, -4.904319, 1, 1, 1, 1, 1,
-0.4443745, 0.4516383, -0.5725517, 1, 1, 1, 1, 1,
-0.4443609, 1.319461, 0.61876, 1, 1, 1, 1, 1,
-0.4424616, 1.210813, 0.7773791, 1, 1, 1, 1, 1,
-0.4384129, 1.396175, -0.08884928, 1, 1, 1, 1, 1,
-0.4373396, -0.7015021, -1.605842, 1, 1, 1, 1, 1,
-0.4340739, -0.442213, -1.044972, 1, 1, 1, 1, 1,
-0.4307572, 0.08066229, -1.382174, 1, 1, 1, 1, 1,
-0.430739, 0.6484041, -0.903993, 1, 1, 1, 1, 1,
-0.4203233, 1.333093, -1.417487, 1, 1, 1, 1, 1,
-0.4177202, 0.04835231, -2.328211, 1, 1, 1, 1, 1,
-0.4161282, 1.000494, -0.03556687, 1, 1, 1, 1, 1,
-0.4157956, -0.3421019, -2.42279, 1, 1, 1, 1, 1,
-0.413937, -0.7312346, -3.011447, 1, 1, 1, 1, 1,
-0.4133933, 1.084155, -0.4350359, 1, 1, 1, 1, 1,
-0.4124628, -0.02574386, -1.506004, 0, 0, 1, 1, 1,
-0.3970044, 1.203923, -0.09373686, 1, 0, 0, 1, 1,
-0.3940499, 0.5738124, -0.8332452, 1, 0, 0, 1, 1,
-0.3928365, -0.3842815, -0.6326111, 1, 0, 0, 1, 1,
-0.3910586, 1.270329, -0.1871245, 1, 0, 0, 1, 1,
-0.3884198, -0.9354486, -2.637816, 1, 0, 0, 1, 1,
-0.3864598, 1.665929, 0.2605736, 0, 0, 0, 1, 1,
-0.3664075, 0.6344197, -2.193501, 0, 0, 0, 1, 1,
-0.3606352, -0.5283775, -3.891385, 0, 0, 0, 1, 1,
-0.3543118, -1.3751, -2.57941, 0, 0, 0, 1, 1,
-0.3495309, 0.369998, -1.758126, 0, 0, 0, 1, 1,
-0.3494761, 0.3186029, -0.186923, 0, 0, 0, 1, 1,
-0.345734, 0.242518, -1.978571, 0, 0, 0, 1, 1,
-0.3439929, -2.185201, -2.813037, 1, 1, 1, 1, 1,
-0.3411492, 0.5992271, 0.875693, 1, 1, 1, 1, 1,
-0.3394693, 0.6733825, -1.002724, 1, 1, 1, 1, 1,
-0.3386555, 0.4001798, -1.383135, 1, 1, 1, 1, 1,
-0.3351586, 0.1348811, -3.207327, 1, 1, 1, 1, 1,
-0.3340422, 0.05956013, -0.8320579, 1, 1, 1, 1, 1,
-0.3318244, 0.08268723, -0.9547744, 1, 1, 1, 1, 1,
-0.3266066, -1.139761, -2.002669, 1, 1, 1, 1, 1,
-0.3236751, -1.269185, -2.368676, 1, 1, 1, 1, 1,
-0.3205061, 1.812056, -0.9452447, 1, 1, 1, 1, 1,
-0.3183868, 0.1154258, -0.5100031, 1, 1, 1, 1, 1,
-0.3153612, -1.522723, -4.09284, 1, 1, 1, 1, 1,
-0.3139208, -1.478558, -3.10993, 1, 1, 1, 1, 1,
-0.3099501, 0.2457669, -1.373353, 1, 1, 1, 1, 1,
-0.3066808, -0.2595842, -1.556422, 1, 1, 1, 1, 1,
-0.3024547, 1.086656, -1.91042, 0, 0, 1, 1, 1,
-0.3007955, 1.299337, -0.5827746, 1, 0, 0, 1, 1,
-0.3002577, -0.6944211, -3.75569, 1, 0, 0, 1, 1,
-0.2994295, 0.6889428, 0.5336347, 1, 0, 0, 1, 1,
-0.2965688, -0.4383388, -2.927263, 1, 0, 0, 1, 1,
-0.2959301, -2.972507, -2.523933, 1, 0, 0, 1, 1,
-0.2860935, 1.416243, 0.3243961, 0, 0, 0, 1, 1,
-0.2834933, -0.00384337, -1.612427, 0, 0, 0, 1, 1,
-0.2811452, 0.5591506, -1.907295, 0, 0, 0, 1, 1,
-0.2780485, 0.04984787, -0.3927622, 0, 0, 0, 1, 1,
-0.277624, 1.066181, 1.065956, 0, 0, 0, 1, 1,
-0.2733667, 0.5548385, -1.131821, 0, 0, 0, 1, 1,
-0.2724928, -0.6799956, -2.355863, 0, 0, 0, 1, 1,
-0.2618457, 0.6850214, -0.9732505, 1, 1, 1, 1, 1,
-0.2612444, 1.405363, 0.6881303, 1, 1, 1, 1, 1,
-0.2596984, 1.320133, -0.9290248, 1, 1, 1, 1, 1,
-0.2566844, 0.0116184, -0.2891894, 1, 1, 1, 1, 1,
-0.2552822, -2.875247, -3.780413, 1, 1, 1, 1, 1,
-0.2537079, -0.006418159, -2.036746, 1, 1, 1, 1, 1,
-0.2487302, 0.9785683, -1.720203, 1, 1, 1, 1, 1,
-0.2471904, 0.1557474, -0.0685057, 1, 1, 1, 1, 1,
-0.2468726, -1.140063, -2.54698, 1, 1, 1, 1, 1,
-0.2465088, 0.9145588, 0.7029548, 1, 1, 1, 1, 1,
-0.2431475, -0.8694767, -2.905984, 1, 1, 1, 1, 1,
-0.2365423, -0.2500153, -0.7073903, 1, 1, 1, 1, 1,
-0.23392, -0.02824388, -2.398909, 1, 1, 1, 1, 1,
-0.2321797, 0.8396918, -0.06540892, 1, 1, 1, 1, 1,
-0.2288757, -0.5909702, -2.59004, 1, 1, 1, 1, 1,
-0.2252244, 0.7590414, -1.005335, 0, 0, 1, 1, 1,
-0.2233311, 1.637066, 0.1019006, 1, 0, 0, 1, 1,
-0.2217159, 1.218323, 0.6412365, 1, 0, 0, 1, 1,
-0.2202732, -0.4373441, -0.6720956, 1, 0, 0, 1, 1,
-0.2184958, -0.2076768, -2.511724, 1, 0, 0, 1, 1,
-0.2149537, -0.8455222, -3.850723, 1, 0, 0, 1, 1,
-0.2131257, 0.1172686, -1.009075, 0, 0, 0, 1, 1,
-0.2115219, 0.169086, -0.9637155, 0, 0, 0, 1, 1,
-0.2097574, -1.506239, -2.654672, 0, 0, 0, 1, 1,
-0.2073262, 0.7472466, 0.02071379, 0, 0, 0, 1, 1,
-0.1990407, -0.2336776, -2.518622, 0, 0, 0, 1, 1,
-0.1964768, 1.248971, -0.2564042, 0, 0, 0, 1, 1,
-0.1952397, 0.9914392, -1.087222, 0, 0, 0, 1, 1,
-0.1934376, -1.286837, -2.540754, 1, 1, 1, 1, 1,
-0.1932704, -0.2032393, -1.087644, 1, 1, 1, 1, 1,
-0.1926203, 0.740406, -0.5169373, 1, 1, 1, 1, 1,
-0.1897837, -0.9019926, -4.197018, 1, 1, 1, 1, 1,
-0.1797607, 0.7229062, 1.987461, 1, 1, 1, 1, 1,
-0.1763588, -0.746086, -2.67204, 1, 1, 1, 1, 1,
-0.1739258, -0.09255905, -1.287626, 1, 1, 1, 1, 1,
-0.1690181, 0.0875327, -0.9707514, 1, 1, 1, 1, 1,
-0.1689003, 1.534433, -1.656017, 1, 1, 1, 1, 1,
-0.1655623, -1.649362, -3.443683, 1, 1, 1, 1, 1,
-0.1605807, -0.5881603, -2.17347, 1, 1, 1, 1, 1,
-0.1578654, 1.557761, -2.421261, 1, 1, 1, 1, 1,
-0.1576438, 0.2220868, 0.05143836, 1, 1, 1, 1, 1,
-0.1572949, -1.450712, -2.815767, 1, 1, 1, 1, 1,
-0.1568571, -2.764283, -3.468144, 1, 1, 1, 1, 1,
-0.1546688, 1.150979, 0.8782249, 0, 0, 1, 1, 1,
-0.1498689, 0.07710224, -0.2235744, 1, 0, 0, 1, 1,
-0.1498147, -0.7262236, -1.913427, 1, 0, 0, 1, 1,
-0.1482479, 1.052924, -0.1028655, 1, 0, 0, 1, 1,
-0.1480002, 1.777013, 0.2992065, 1, 0, 0, 1, 1,
-0.1477794, 1.588104, 1.126959, 1, 0, 0, 1, 1,
-0.1473688, -0.2724979, -2.344228, 0, 0, 0, 1, 1,
-0.145437, -1.475549, -4.209348, 0, 0, 0, 1, 1,
-0.1427805, -0.281825, -1.26867, 0, 0, 0, 1, 1,
-0.1418734, 1.433842, -1.718716, 0, 0, 0, 1, 1,
-0.1400304, -0.6060626, -3.564564, 0, 0, 0, 1, 1,
-0.1380986, -0.2815754, -5.024063, 0, 0, 0, 1, 1,
-0.1377461, -1.479687, -2.66449, 0, 0, 0, 1, 1,
-0.1357427, -1.308288, -1.353613, 1, 1, 1, 1, 1,
-0.1341536, -0.3257539, -3.199257, 1, 1, 1, 1, 1,
-0.1236381, 0.5394729, -1.416866, 1, 1, 1, 1, 1,
-0.1232156, -0.5768486, -0.2423809, 1, 1, 1, 1, 1,
-0.1224054, -0.8199095, -3.823887, 1, 1, 1, 1, 1,
-0.1223369, 1.124211, 1.557584, 1, 1, 1, 1, 1,
-0.1201836, 0.4352059, -0.269095, 1, 1, 1, 1, 1,
-0.1179343, 1.505229, -0.2533965, 1, 1, 1, 1, 1,
-0.1178083, -0.08714615, -2.752735, 1, 1, 1, 1, 1,
-0.1147717, -0.4572142, -3.030752, 1, 1, 1, 1, 1,
-0.1107043, -0.880827, -3.466728, 1, 1, 1, 1, 1,
-0.1093953, -0.2737342, -2.68487, 1, 1, 1, 1, 1,
-0.1093789, -2.028083, -4.134813, 1, 1, 1, 1, 1,
-0.1032958, 1.136861, 0.4399076, 1, 1, 1, 1, 1,
-0.1025294, 0.2376166, -2.128241, 1, 1, 1, 1, 1,
-0.1009805, 0.1664667, -1.311569, 0, 0, 1, 1, 1,
-0.1001338, 0.179679, 0.57422, 1, 0, 0, 1, 1,
-0.09451329, 0.2632352, -0.8498488, 1, 0, 0, 1, 1,
-0.09241236, -0.887743, -3.072257, 1, 0, 0, 1, 1,
-0.09226308, -0.2945138, -4.026308, 1, 0, 0, 1, 1,
-0.09133191, 0.08812343, -0.42031, 1, 0, 0, 1, 1,
-0.08580635, -1.160279, -4.427994, 0, 0, 0, 1, 1,
-0.08367571, -0.2671678, -3.615488, 0, 0, 0, 1, 1,
-0.08022271, 0.7815305, -0.7005489, 0, 0, 0, 1, 1,
-0.07980647, 0.9171335, 0.6378121, 0, 0, 0, 1, 1,
-0.07355851, 0.8280653, -1.404562, 0, 0, 0, 1, 1,
-0.07334996, 0.03562396, -1.351485, 0, 0, 0, 1, 1,
-0.07015404, 2.445822, 0.07556406, 0, 0, 0, 1, 1,
-0.06807135, 0.8968101, 1.940095, 1, 1, 1, 1, 1,
-0.06517339, 0.5636804, -0.7185816, 1, 1, 1, 1, 1,
-0.06330969, 0.5662696, 1.448814, 1, 1, 1, 1, 1,
-0.06278245, 0.714772, 0.8448504, 1, 1, 1, 1, 1,
-0.06191348, 0.7152231, -0.7389358, 1, 1, 1, 1, 1,
-0.05925262, 0.8606012, 1.214346, 1, 1, 1, 1, 1,
-0.05809308, -0.3829959, -2.795164, 1, 1, 1, 1, 1,
-0.05646995, 0.5981401, 0.3935473, 1, 1, 1, 1, 1,
-0.05113252, 0.02428447, -1.85303, 1, 1, 1, 1, 1,
-0.04966658, 1.353915, -0.6169541, 1, 1, 1, 1, 1,
-0.04270037, -0.1507876, -2.533378, 1, 1, 1, 1, 1,
-0.02787026, 1.491844, -1.063946, 1, 1, 1, 1, 1,
-0.02022688, 0.2094735, 0.5716602, 1, 1, 1, 1, 1,
-0.01876406, -0.3508075, -3.346676, 1, 1, 1, 1, 1,
-0.01781498, 0.5549988, -2.099473, 1, 1, 1, 1, 1,
-0.01725246, 1.521652, 0.8335638, 0, 0, 1, 1, 1,
-0.01574614, -0.6855998, -1.892337, 1, 0, 0, 1, 1,
-0.01426222, 0.05958949, 0.9262614, 1, 0, 0, 1, 1,
-0.01336533, 1.482655, 0.8067644, 1, 0, 0, 1, 1,
-0.00888543, 0.426146, -0.3813301, 1, 0, 0, 1, 1,
-0.008610334, 0.5015091, -0.4030833, 1, 0, 0, 1, 1,
-0.006669955, 1.839364, 1.751737, 0, 0, 0, 1, 1,
-0.00572774, -2.01583, -2.939186, 0, 0, 0, 1, 1,
-0.001549693, 1.199951, -1.044312, 0, 0, 0, 1, 1,
0.004984425, 1.094342, 0.1253964, 0, 0, 0, 1, 1,
0.005948935, -0.8766988, 2.956776, 0, 0, 0, 1, 1,
0.008453615, 0.9919859, 0.2358681, 0, 0, 0, 1, 1,
0.009942336, -0.5573226, 3.076651, 0, 0, 0, 1, 1,
0.01086218, 0.05025785, 1.34013, 1, 1, 1, 1, 1,
0.01331001, 0.174842, -0.5646383, 1, 1, 1, 1, 1,
0.01813541, -0.855194, 3.067609, 1, 1, 1, 1, 1,
0.01997526, -1.136901, 3.794456, 1, 1, 1, 1, 1,
0.02154891, -0.8238845, 3.270743, 1, 1, 1, 1, 1,
0.02344966, -0.9496931, 1.860309, 1, 1, 1, 1, 1,
0.02820322, -1.70751, 3.26065, 1, 1, 1, 1, 1,
0.02871441, -1.786786, 3.809788, 1, 1, 1, 1, 1,
0.02987357, -0.2551894, 3.393024, 1, 1, 1, 1, 1,
0.03007802, 1.610128, -0.7564286, 1, 1, 1, 1, 1,
0.03533339, -0.182756, 2.774932, 1, 1, 1, 1, 1,
0.03543257, -1.20355, 4.653556, 1, 1, 1, 1, 1,
0.0371668, -1.677717, 3.504911, 1, 1, 1, 1, 1,
0.03726305, -0.5548024, 3.599509, 1, 1, 1, 1, 1,
0.03785873, -1.833693, 2.094069, 1, 1, 1, 1, 1,
0.03792346, -0.6154276, 4.211643, 0, 0, 1, 1, 1,
0.03865743, -2.355833, 4.036524, 1, 0, 0, 1, 1,
0.04070088, 0.4411852, -1.83221, 1, 0, 0, 1, 1,
0.0423191, 0.1186424, 1.34466, 1, 0, 0, 1, 1,
0.0432383, 0.8963364, -0.5357448, 1, 0, 0, 1, 1,
0.04450549, 1.053214, 0.4198132, 1, 0, 0, 1, 1,
0.04511582, -0.8456899, 4.76054, 0, 0, 0, 1, 1,
0.04682918, 0.4940793, 1.085015, 0, 0, 0, 1, 1,
0.05236841, 0.7103614, 1.584512, 0, 0, 0, 1, 1,
0.05401425, -0.6742963, 3.726792, 0, 0, 0, 1, 1,
0.05615326, 0.05828776, 0.4367016, 0, 0, 0, 1, 1,
0.06721674, -0.2438877, 3.378191, 0, 0, 0, 1, 1,
0.06762141, 0.6652975, -1.067228, 0, 0, 0, 1, 1,
0.07234488, 0.8161353, -0.1976135, 1, 1, 1, 1, 1,
0.07423282, -1.047913, 4.497469, 1, 1, 1, 1, 1,
0.07444587, 0.7722981, -1.227646, 1, 1, 1, 1, 1,
0.07658395, 0.06953753, -0.3147916, 1, 1, 1, 1, 1,
0.08129149, -0.08631245, 2.373883, 1, 1, 1, 1, 1,
0.08224156, 0.3019498, 0.4612002, 1, 1, 1, 1, 1,
0.08264589, -0.9446502, 0.4379622, 1, 1, 1, 1, 1,
0.08585069, 1.456492, -0.9748479, 1, 1, 1, 1, 1,
0.09128457, -1.516392, 3.16011, 1, 1, 1, 1, 1,
0.09487986, -0.2309544, 3.635217, 1, 1, 1, 1, 1,
0.09775705, -0.5194356, 3.150476, 1, 1, 1, 1, 1,
0.1012486, 1.995081, -1.877754, 1, 1, 1, 1, 1,
0.1022144, -0.01158467, 1.633369, 1, 1, 1, 1, 1,
0.1024507, 0.0143392, 2.066172, 1, 1, 1, 1, 1,
0.1051406, 0.173286, 1.187908, 1, 1, 1, 1, 1,
0.1054334, -0.03697832, 0.8647809, 0, 0, 1, 1, 1,
0.1079436, -0.1495232, 2.87291, 1, 0, 0, 1, 1,
0.1093373, 1.493118, 0.7617492, 1, 0, 0, 1, 1,
0.109425, -0.2110029, 4.651661, 1, 0, 0, 1, 1,
0.111535, 0.8885005, 1.667672, 1, 0, 0, 1, 1,
0.1133176, 0.5817511, 0.07808716, 1, 0, 0, 1, 1,
0.1143669, 0.8024067, 0.6110347, 0, 0, 0, 1, 1,
0.1149797, -0.3505962, 0.773437, 0, 0, 0, 1, 1,
0.1151726, 0.07458029, 1.618353, 0, 0, 0, 1, 1,
0.115507, -0.2387107, 3.1044, 0, 0, 0, 1, 1,
0.1161663, -1.870794, 2.502565, 0, 0, 0, 1, 1,
0.1177255, 0.4293375, 0.7854366, 0, 0, 0, 1, 1,
0.1291497, -1.661357, 2.777773, 0, 0, 0, 1, 1,
0.1350194, 0.5755196, 1.458392, 1, 1, 1, 1, 1,
0.1357298, 1.083699, -1.522501, 1, 1, 1, 1, 1,
0.1366606, 0.8096746, 1.09253, 1, 1, 1, 1, 1,
0.1393721, -0.2824416, 2.166551, 1, 1, 1, 1, 1,
0.1404579, 0.9753721, 0.7598269, 1, 1, 1, 1, 1,
0.1405596, 0.07401579, -1.017051, 1, 1, 1, 1, 1,
0.1430235, 0.5097477, 1.10253, 1, 1, 1, 1, 1,
0.1434842, 0.1809825, 1.29565, 1, 1, 1, 1, 1,
0.1484172, 1.771543, 1.260717, 1, 1, 1, 1, 1,
0.1491273, 1.049424, -0.82115, 1, 1, 1, 1, 1,
0.1492455, 0.5233951, 0.01771265, 1, 1, 1, 1, 1,
0.1502562, -0.6414564, 2.817344, 1, 1, 1, 1, 1,
0.1511452, -0.1388614, 0.3296329, 1, 1, 1, 1, 1,
0.1521782, 0.1901847, 0.7822617, 1, 1, 1, 1, 1,
0.1539575, -1.275191, 3.391065, 1, 1, 1, 1, 1,
0.1562024, -0.2636232, 3.383168, 0, 0, 1, 1, 1,
0.1583782, 0.2240914, -0.5001583, 1, 0, 0, 1, 1,
0.1584771, 0.1443084, 1.229746, 1, 0, 0, 1, 1,
0.1661509, -1.584693, 2.376202, 1, 0, 0, 1, 1,
0.1676681, -0.4470618, 3.193041, 1, 0, 0, 1, 1,
0.1691517, 0.8751836, 0.05565255, 1, 0, 0, 1, 1,
0.1774441, -0.9774442, 2.883222, 0, 0, 0, 1, 1,
0.1784362, 1.477987, 0.6740513, 0, 0, 0, 1, 1,
0.1786598, -1.971397, 4.339619, 0, 0, 0, 1, 1,
0.1787233, -1.199549, 3.353549, 0, 0, 0, 1, 1,
0.1849648, 1.707636, -0.1948349, 0, 0, 0, 1, 1,
0.1864236, 0.05240123, 2.244883, 0, 0, 0, 1, 1,
0.19131, -0.8427941, 1.088867, 0, 0, 0, 1, 1,
0.1927591, 0.3570447, -3.104302, 1, 1, 1, 1, 1,
0.1935773, 1.349217, -0.8893491, 1, 1, 1, 1, 1,
0.1965197, 1.182763, 0.07874253, 1, 1, 1, 1, 1,
0.199592, 0.3999594, 0.4699519, 1, 1, 1, 1, 1,
0.2001051, -1.027547, 4.361213, 1, 1, 1, 1, 1,
0.2047841, -0.6323134, 3.1865, 1, 1, 1, 1, 1,
0.2052323, 0.6468056, -0.07228967, 1, 1, 1, 1, 1,
0.2086702, -1.458554, 3.997827, 1, 1, 1, 1, 1,
0.214766, -0.9902216, 3.740582, 1, 1, 1, 1, 1,
0.216365, 0.441199, 0.1201351, 1, 1, 1, 1, 1,
0.2169684, 2.044878, -1.540228, 1, 1, 1, 1, 1,
0.2176799, 0.4366288, -0.804594, 1, 1, 1, 1, 1,
0.2182612, 0.1572132, 0.9091701, 1, 1, 1, 1, 1,
0.2187553, -0.2873888, 2.61183, 1, 1, 1, 1, 1,
0.2219285, 1.900102, 0.1864492, 1, 1, 1, 1, 1,
0.230862, 0.9700402, -1.988952, 0, 0, 1, 1, 1,
0.2360283, -1.976251, 2.964493, 1, 0, 0, 1, 1,
0.2383711, -0.1408437, 3.389862, 1, 0, 0, 1, 1,
0.243184, -0.8591243, 1.507297, 1, 0, 0, 1, 1,
0.243584, 1.136312, 3.103791, 1, 0, 0, 1, 1,
0.2454638, -0.8335453, 2.263224, 1, 0, 0, 1, 1,
0.2469514, -0.05448371, -0.06084423, 0, 0, 0, 1, 1,
0.2480802, -0.003954841, 1.909543, 0, 0, 0, 1, 1,
0.2519401, -0.1443455, 1.579438, 0, 0, 0, 1, 1,
0.2532114, -0.8254362, 4.341516, 0, 0, 0, 1, 1,
0.2557358, -0.4342204, 2.142605, 0, 0, 0, 1, 1,
0.2560998, 2.178092, -1.088453, 0, 0, 0, 1, 1,
0.2568647, -0.4763346, 2.924408, 0, 0, 0, 1, 1,
0.2573434, -2.195477, 2.819817, 1, 1, 1, 1, 1,
0.2596285, 0.4497267, 0.2463565, 1, 1, 1, 1, 1,
0.2602678, -0.3658967, 1.631872, 1, 1, 1, 1, 1,
0.2615043, -1.321334, 2.218921, 1, 1, 1, 1, 1,
0.2616923, -0.006087652, 2.483018, 1, 1, 1, 1, 1,
0.2681296, -0.2015007, 1.794368, 1, 1, 1, 1, 1,
0.27219, -1.677656, 2.560007, 1, 1, 1, 1, 1,
0.2740298, 1.054916, 0.6716524, 1, 1, 1, 1, 1,
0.2763041, -0.473377, 1.626701, 1, 1, 1, 1, 1,
0.2780105, 0.4093137, -0.5996662, 1, 1, 1, 1, 1,
0.2795098, 0.5176102, 0.786124, 1, 1, 1, 1, 1,
0.2795891, -0.5752589, 2.882594, 1, 1, 1, 1, 1,
0.2829678, -0.143254, 2.147313, 1, 1, 1, 1, 1,
0.2868232, 1.023268, 0.3168901, 1, 1, 1, 1, 1,
0.290826, 0.8201933, 0.03030662, 1, 1, 1, 1, 1,
0.2917666, 0.4363174, 1.740709, 0, 0, 1, 1, 1,
0.2940034, -0.2932498, 1.893503, 1, 0, 0, 1, 1,
0.2970417, 4.565548e-05, 1.8855, 1, 0, 0, 1, 1,
0.3058306, -0.8013628, 3.221606, 1, 0, 0, 1, 1,
0.3061071, -1.010035, 4.343482, 1, 0, 0, 1, 1,
0.3068953, -0.3993458, 2.21139, 1, 0, 0, 1, 1,
0.307576, 2.336634, 0.4060952, 0, 0, 0, 1, 1,
0.313298, 0.5180368, 0.311629, 0, 0, 0, 1, 1,
0.3135986, 0.7451537, 0.5598029, 0, 0, 0, 1, 1,
0.318602, 0.2858571, -0.2345208, 0, 0, 0, 1, 1,
0.3203548, -0.1315086, 3.530398, 0, 0, 0, 1, 1,
0.3204305, -1.03385, 2.226001, 0, 0, 0, 1, 1,
0.3210323, -1.01864, 3.329751, 0, 0, 0, 1, 1,
0.321312, -1.00869, 2.739191, 1, 1, 1, 1, 1,
0.3227331, -0.3227059, 2.433102, 1, 1, 1, 1, 1,
0.3242721, 1.262552, 0.7645994, 1, 1, 1, 1, 1,
0.3254664, 0.7804931, 1.014906, 1, 1, 1, 1, 1,
0.3262225, 0.8171077, -0.06527627, 1, 1, 1, 1, 1,
0.3271841, -0.8257163, 2.759615, 1, 1, 1, 1, 1,
0.3299438, 0.6255279, 2.061798, 1, 1, 1, 1, 1,
0.3313105, 1.194287, -0.2507452, 1, 1, 1, 1, 1,
0.3365974, 0.9410816, -0.7323899, 1, 1, 1, 1, 1,
0.3421017, 2.126895, -0.5858769, 1, 1, 1, 1, 1,
0.3459525, 0.2142639, 0.4968635, 1, 1, 1, 1, 1,
0.3505934, -0.07394733, 1.384373, 1, 1, 1, 1, 1,
0.3550713, 0.6164305, 0.4384437, 1, 1, 1, 1, 1,
0.3583856, -0.445596, 1.923705, 1, 1, 1, 1, 1,
0.3592511, -0.1439257, 1.822263, 1, 1, 1, 1, 1,
0.360233, -1.608499, 1.873872, 0, 0, 1, 1, 1,
0.3602569, 1.107689, -1.265429, 1, 0, 0, 1, 1,
0.3647141, 1.424831, 1.35459, 1, 0, 0, 1, 1,
0.3656697, 0.2639173, 1.321945, 1, 0, 0, 1, 1,
0.3664013, 1.644762, 1.69837, 1, 0, 0, 1, 1,
0.3708335, 0.2165803, -1.034688, 1, 0, 0, 1, 1,
0.3720518, 1.718091, -0.6730801, 0, 0, 0, 1, 1,
0.3753777, 0.3805476, 0.4244965, 0, 0, 0, 1, 1,
0.3774082, 1.304903, 0.1992888, 0, 0, 0, 1, 1,
0.3781344, -0.1004707, 0.7481367, 0, 0, 0, 1, 1,
0.3798561, -0.769421, 2.863038, 0, 0, 0, 1, 1,
0.3810357, -0.5621549, 2.135073, 0, 0, 0, 1, 1,
0.3810827, -0.1144767, 0.4106545, 0, 0, 0, 1, 1,
0.3876197, 1.689187, -0.8865042, 1, 1, 1, 1, 1,
0.3892525, -1.211234, 3.66928, 1, 1, 1, 1, 1,
0.3898012, 0.8247309, 2.20789, 1, 1, 1, 1, 1,
0.3904278, 1.613338, -0.4629947, 1, 1, 1, 1, 1,
0.397529, -0.08860777, 0.1575996, 1, 1, 1, 1, 1,
0.399067, -0.6135064, 1.65653, 1, 1, 1, 1, 1,
0.4009122, 1.129445, 1.677048, 1, 1, 1, 1, 1,
0.4026588, 0.06190734, 1.261593, 1, 1, 1, 1, 1,
0.4064979, 0.1328718, -0.7802463, 1, 1, 1, 1, 1,
0.4066961, -0.3166981, 2.350345, 1, 1, 1, 1, 1,
0.4083438, 0.5880932, 1.597662, 1, 1, 1, 1, 1,
0.4108002, -0.387351, 4.050314, 1, 1, 1, 1, 1,
0.4184363, 0.0480421, 1.928892, 1, 1, 1, 1, 1,
0.4203617, -0.9372392, 0.4906301, 1, 1, 1, 1, 1,
0.4232547, 0.813068, 2.955611, 1, 1, 1, 1, 1,
0.4273302, -0.9918371, 2.591378, 0, 0, 1, 1, 1,
0.428885, 1.192432, 1.059427, 1, 0, 0, 1, 1,
0.4430586, 0.182048, 0.3001808, 1, 0, 0, 1, 1,
0.445955, -0.5039408, 1.52202, 1, 0, 0, 1, 1,
0.4515457, 2.183309, 2.04425, 1, 0, 0, 1, 1,
0.4570126, 0.4091825, 0.1756607, 1, 0, 0, 1, 1,
0.4609566, 1.287618, 1.040348, 0, 0, 0, 1, 1,
0.4659791, -1.279434, 3.099002, 0, 0, 0, 1, 1,
0.4675196, 0.1358619, 0.8525605, 0, 0, 0, 1, 1,
0.4706552, 1.09892, 2.401949, 0, 0, 0, 1, 1,
0.4716981, -0.5212418, 2.863398, 0, 0, 0, 1, 1,
0.4720628, 1.020362, 0.1646749, 0, 0, 0, 1, 1,
0.4737885, -0.3871526, 0.4499642, 0, 0, 0, 1, 1,
0.4739801, -0.7846118, 3.038321, 1, 1, 1, 1, 1,
0.4757179, 1.124979, -0.5781964, 1, 1, 1, 1, 1,
0.4782877, -0.2845137, 2.760437, 1, 1, 1, 1, 1,
0.4845571, -0.0375047, 1.962653, 1, 1, 1, 1, 1,
0.4845938, 1.232158, 0.9438242, 1, 1, 1, 1, 1,
0.4870593, -0.6347469, 2.263876, 1, 1, 1, 1, 1,
0.4890472, 1.554407, -0.5911953, 1, 1, 1, 1, 1,
0.4892177, -1.379885, 2.712604, 1, 1, 1, 1, 1,
0.4908295, 0.8129231, 0.244515, 1, 1, 1, 1, 1,
0.4912243, -0.808701, 1.664283, 1, 1, 1, 1, 1,
0.4914066, -2.078655, 2.922115, 1, 1, 1, 1, 1,
0.4937924, 0.2390216, -0.4625463, 1, 1, 1, 1, 1,
0.4971715, 0.8132069, 0.2411009, 1, 1, 1, 1, 1,
0.4976898, 0.1095732, 2.943882, 1, 1, 1, 1, 1,
0.4979685, 1.156017, -1.102064, 1, 1, 1, 1, 1,
0.4985484, -0.5548809, 2.917174, 0, 0, 1, 1, 1,
0.5029597, 0.2000879, 1.539338, 1, 0, 0, 1, 1,
0.5076814, -0.6404144, 4.52735, 1, 0, 0, 1, 1,
0.5082498, 0.1820937, 2.233038, 1, 0, 0, 1, 1,
0.5099076, 0.3196733, 0.4461009, 1, 0, 0, 1, 1,
0.5101718, 1.570444, 1.117894, 1, 0, 0, 1, 1,
0.5164968, -0.2951382, 2.405742, 0, 0, 0, 1, 1,
0.5179443, -0.5525457, 2.535903, 0, 0, 0, 1, 1,
0.5289868, 0.5072925, 0.9986923, 0, 0, 0, 1, 1,
0.5354043, 0.2759864, 0.8781442, 0, 0, 0, 1, 1,
0.5383826, -0.1129908, 2.21988, 0, 0, 0, 1, 1,
0.5385004, 0.339255, -0.8177739, 0, 0, 0, 1, 1,
0.5409749, -0.3270349, 1.074342, 0, 0, 0, 1, 1,
0.541483, -0.8348567, 3.131611, 1, 1, 1, 1, 1,
0.5427818, 0.4714282, 2.171807, 1, 1, 1, 1, 1,
0.5433673, -0.2117108, 1.007584, 1, 1, 1, 1, 1,
0.5461016, -0.4293858, 1.956237, 1, 1, 1, 1, 1,
0.5496956, -0.2911506, 1.154342, 1, 1, 1, 1, 1,
0.5533422, 0.5921917, 1.916397, 1, 1, 1, 1, 1,
0.5560586, -0.722966, 4.811402, 1, 1, 1, 1, 1,
0.5576894, 0.9850253, 1.064339, 1, 1, 1, 1, 1,
0.5629282, -1.552157, 2.715709, 1, 1, 1, 1, 1,
0.5643869, 0.8310747, 0.6383042, 1, 1, 1, 1, 1,
0.5671081, -0.5765371, 1.704759, 1, 1, 1, 1, 1,
0.5676549, -1.117226, 2.06171, 1, 1, 1, 1, 1,
0.5711033, -0.1588052, 2.531597, 1, 1, 1, 1, 1,
0.5736099, 1.191716, 1.257844, 1, 1, 1, 1, 1,
0.5845824, -0.5397504, 2.043199, 1, 1, 1, 1, 1,
0.5869398, 0.004667024, 2.401497, 0, 0, 1, 1, 1,
0.5871576, -1.160074, 3.544822, 1, 0, 0, 1, 1,
0.5887027, -0.04316785, 0.3265976, 1, 0, 0, 1, 1,
0.5932337, -1.704178, 2.709445, 1, 0, 0, 1, 1,
0.5936201, -0.1393034, -0.1571206, 1, 0, 0, 1, 1,
0.5972246, 0.6096572, 1.932272, 1, 0, 0, 1, 1,
0.6052948, 0.5896384, -0.322481, 0, 0, 0, 1, 1,
0.6063549, -0.2034641, 0.9158718, 0, 0, 0, 1, 1,
0.6100754, 0.5799197, -0.5728714, 0, 0, 0, 1, 1,
0.6108131, -0.2045474, 1.282749, 0, 0, 0, 1, 1,
0.6111447, 0.7848254, 0.8985097, 0, 0, 0, 1, 1,
0.6181889, -0.1112887, 2.879364, 0, 0, 0, 1, 1,
0.6214705, 0.521119, 0.8263377, 0, 0, 0, 1, 1,
0.6226803, 0.2526827, 0.8322495, 1, 1, 1, 1, 1,
0.6231385, 0.5698786, 0.6537589, 1, 1, 1, 1, 1,
0.6271461, -1.06343, 2.825028, 1, 1, 1, 1, 1,
0.6352215, -0.3505167, 1.510352, 1, 1, 1, 1, 1,
0.6362879, -0.1935386, 2.524681, 1, 1, 1, 1, 1,
0.6418284, 1.53447, 0.4417993, 1, 1, 1, 1, 1,
0.6433186, -0.2657829, 2.180196, 1, 1, 1, 1, 1,
0.6445905, -0.5475881, 2.970872, 1, 1, 1, 1, 1,
0.6468019, 0.5267722, 0.1264115, 1, 1, 1, 1, 1,
0.6599745, -0.5438416, 3.011046, 1, 1, 1, 1, 1,
0.6612755, -1.239432, 1.653734, 1, 1, 1, 1, 1,
0.6626806, 1.322839, 1.232759, 1, 1, 1, 1, 1,
0.6691608, -0.05452075, 1.049475, 1, 1, 1, 1, 1,
0.6726201, -0.7528047, 4.038747, 1, 1, 1, 1, 1,
0.6734622, -0.2132816, 2.046919, 1, 1, 1, 1, 1,
0.6742293, -0.6654017, 3.362155, 0, 0, 1, 1, 1,
0.6748912, 1.833512, -0.03420606, 1, 0, 0, 1, 1,
0.6849165, 0.7786837, -0.131975, 1, 0, 0, 1, 1,
0.691296, -0.9115667, 3.151634, 1, 0, 0, 1, 1,
0.693254, 1.101706, 1.063867, 1, 0, 0, 1, 1,
0.6937052, 1.685413, -0.44476, 1, 0, 0, 1, 1,
0.694859, 0.9946494, 0.8791637, 0, 0, 0, 1, 1,
0.6951881, -0.4903244, 2.531021, 0, 0, 0, 1, 1,
0.699316, -1.034566, 3.053616, 0, 0, 0, 1, 1,
0.7019767, 1.085079, 1.779265, 0, 0, 0, 1, 1,
0.7048078, 2.977684, 0.08247644, 0, 0, 0, 1, 1,
0.7096799, 1.715971, 1.390651, 0, 0, 0, 1, 1,
0.7104003, -1.011981, 1.441062, 0, 0, 0, 1, 1,
0.7111898, 1.201391, 1.301326, 1, 1, 1, 1, 1,
0.7145139, 0.6154697, -2.039027, 1, 1, 1, 1, 1,
0.7163219, -2.53618, 1.548395, 1, 1, 1, 1, 1,
0.7185447, -0.2640579, 4.185792, 1, 1, 1, 1, 1,
0.7217798, 1.513528, 0.7808284, 1, 1, 1, 1, 1,
0.7239271, 1.435636, -0.1942248, 1, 1, 1, 1, 1,
0.7253621, 1.298732, 1.163418, 1, 1, 1, 1, 1,
0.7290962, -1.309139, 3.751547, 1, 1, 1, 1, 1,
0.7326921, -0.7208881, 3.213529, 1, 1, 1, 1, 1,
0.7339876, 0.4247362, -0.8731519, 1, 1, 1, 1, 1,
0.7343381, 0.1729493, 2.28729, 1, 1, 1, 1, 1,
0.7344639, 0.3402601, -1.075789, 1, 1, 1, 1, 1,
0.7445258, 0.9108717, 1.081135, 1, 1, 1, 1, 1,
0.7467017, -0.2233153, 1.997304, 1, 1, 1, 1, 1,
0.7499698, 0.2588894, 0.4930606, 1, 1, 1, 1, 1,
0.7503637, -0.4221801, 1.366721, 0, 0, 1, 1, 1,
0.760776, -1.71964, 3.930492, 1, 0, 0, 1, 1,
0.7675331, -0.1599518, 0.5960479, 1, 0, 0, 1, 1,
0.7746058, -1.544124, 2.132963, 1, 0, 0, 1, 1,
0.7749906, -0.02985618, 1.802775, 1, 0, 0, 1, 1,
0.7769969, -0.8108702, 0.3815119, 1, 0, 0, 1, 1,
0.7776165, 0.9102588, 2.027419, 0, 0, 0, 1, 1,
0.7895357, -0.3245409, 2.205747, 0, 0, 0, 1, 1,
0.8014165, -0.5237083, 1.629396, 0, 0, 0, 1, 1,
0.8076181, -0.6083688, 2.799882, 0, 0, 0, 1, 1,
0.8087868, 0.6641668, 0.2978247, 0, 0, 0, 1, 1,
0.8151233, -0.2625262, 3.537093, 0, 0, 0, 1, 1,
0.8173037, 1.834279, 0.8703946, 0, 0, 0, 1, 1,
0.8202585, 0.2514009, 1.06531, 1, 1, 1, 1, 1,
0.8218675, 0.1694158, 1.068619, 1, 1, 1, 1, 1,
0.822943, 0.5245384, 0.2680969, 1, 1, 1, 1, 1,
0.8235849, 1.950451, -0.4769687, 1, 1, 1, 1, 1,
0.825528, 0.8387702, 0.1737708, 1, 1, 1, 1, 1,
0.8272274, 0.2953467, 1.009969, 1, 1, 1, 1, 1,
0.8288233, 2.0092, 0.3974054, 1, 1, 1, 1, 1,
0.8298263, -0.04391138, -0.5745258, 1, 1, 1, 1, 1,
0.8312445, -1.083433, 2.564854, 1, 1, 1, 1, 1,
0.8345034, 0.8970867, -0.1384356, 1, 1, 1, 1, 1,
0.8407335, 0.05373799, 0.1291464, 1, 1, 1, 1, 1,
0.842051, -0.4802447, 0.9985701, 1, 1, 1, 1, 1,
0.8421816, -0.4883988, 0.1624818, 1, 1, 1, 1, 1,
0.8434039, -0.2651535, 2.250432, 1, 1, 1, 1, 1,
0.8458899, -0.287191, 1.438614, 1, 1, 1, 1, 1,
0.8465931, -0.08240846, 0.5195122, 0, 0, 1, 1, 1,
0.8499247, 0.03846046, 1.232561, 1, 0, 0, 1, 1,
0.8555455, 0.7002876, -1.568507, 1, 0, 0, 1, 1,
0.8583483, 0.1919584, 2.82303, 1, 0, 0, 1, 1,
0.8755662, 0.4833677, 1.206325, 1, 0, 0, 1, 1,
0.8761251, -0.5379775, 2.595522, 1, 0, 0, 1, 1,
0.8772101, 1.184994, 2.126693, 0, 0, 0, 1, 1,
0.8823254, -0.002988061, 0.7771634, 0, 0, 0, 1, 1,
0.8894991, -2.793105, 3.264934, 0, 0, 0, 1, 1,
0.898854, 0.4893468, 1.120425, 0, 0, 0, 1, 1,
0.9010831, 0.3267442, 0.9243905, 0, 0, 0, 1, 1,
0.9059134, -1.004982, 2.534157, 0, 0, 0, 1, 1,
0.9074603, 0.1971926, 2.751535, 0, 0, 0, 1, 1,
0.9083577, -0.8326601, 2.274215, 1, 1, 1, 1, 1,
0.9106593, -1.104304, 3.080861, 1, 1, 1, 1, 1,
0.9107239, -1.185146, 2.075525, 1, 1, 1, 1, 1,
0.9118424, -0.3233016, 1.354783, 1, 1, 1, 1, 1,
0.91524, -0.05022962, 2.011239, 1, 1, 1, 1, 1,
0.9240478, -1.298526, 1.049421, 1, 1, 1, 1, 1,
0.9251556, 1.304036, 1.057997, 1, 1, 1, 1, 1,
0.9298875, 0.6143979, 0.3398908, 1, 1, 1, 1, 1,
0.9309766, -0.7637108, 3.972184, 1, 1, 1, 1, 1,
0.9358431, -0.1823543, 2.196954, 1, 1, 1, 1, 1,
0.9390926, 2.471886, -1.132599, 1, 1, 1, 1, 1,
0.953171, -1.968573, 3.552828, 1, 1, 1, 1, 1,
0.9551606, -0.7946829, 2.948038, 1, 1, 1, 1, 1,
0.9568291, 1.434725, 0.8406034, 1, 1, 1, 1, 1,
0.9598471, -0.6484331, 3.56522, 1, 1, 1, 1, 1,
0.9628561, -0.533016, 1.785381, 0, 0, 1, 1, 1,
0.9644383, -1.671465, 2.176004, 1, 0, 0, 1, 1,
0.9702504, -0.7944281, 2.967064, 1, 0, 0, 1, 1,
0.9734907, -0.8642584, 3.146828, 1, 0, 0, 1, 1,
0.9880058, 2.264448, -0.4964335, 1, 0, 0, 1, 1,
0.9890857, 0.2164788, -0.2038812, 1, 0, 0, 1, 1,
0.990258, 0.2403118, 1.497548, 0, 0, 0, 1, 1,
0.9968374, -1.924412, 2.778651, 0, 0, 0, 1, 1,
1.001395, -0.2415818, 1.315169, 0, 0, 0, 1, 1,
1.00642, 0.3149503, 1.27026, 0, 0, 0, 1, 1,
1.01789, 1.091535, -0.2665263, 0, 0, 0, 1, 1,
1.022839, 0.8555844, -0.4296159, 0, 0, 0, 1, 1,
1.027634, -0.6195436, 1.755521, 0, 0, 0, 1, 1,
1.035111, -0.01613899, 1.965003, 1, 1, 1, 1, 1,
1.036258, 1.308085, 0.2143053, 1, 1, 1, 1, 1,
1.03645, -0.108575, 1.435236, 1, 1, 1, 1, 1,
1.037778, -1.317311, 2.689711, 1, 1, 1, 1, 1,
1.041068, -0.4041813, 1.478088, 1, 1, 1, 1, 1,
1.043316, 0.7934997, 1.30282, 1, 1, 1, 1, 1,
1.046459, 0.538102, -0.3394774, 1, 1, 1, 1, 1,
1.049854, 0.7433506, 1.012082, 1, 1, 1, 1, 1,
1.057124, 0.149165, 1.710758, 1, 1, 1, 1, 1,
1.067206, 0.8857375, 1.192871, 1, 1, 1, 1, 1,
1.070157, -1.179841, 0.2630499, 1, 1, 1, 1, 1,
1.083464, -1.041933, 2.574853, 1, 1, 1, 1, 1,
1.084948, 0.6630054, 0.5345348, 1, 1, 1, 1, 1,
1.087803, -0.1908444, 2.665101, 1, 1, 1, 1, 1,
1.088932, 0.7002657, 2.270577, 1, 1, 1, 1, 1,
1.096383, -1.671439, 4.430014, 0, 0, 1, 1, 1,
1.108397, 0.8046536, 1.326009, 1, 0, 0, 1, 1,
1.123086, 0.2859102, 1.55326, 1, 0, 0, 1, 1,
1.130834, 0.3083415, 1.39276, 1, 0, 0, 1, 1,
1.136784, 0.8899209, -0.01710178, 1, 0, 0, 1, 1,
1.147621, 1.017375, 0.1957352, 1, 0, 0, 1, 1,
1.163973, -1.084018, 4.147304, 0, 0, 0, 1, 1,
1.169796, 2.11866, 0.1872529, 0, 0, 0, 1, 1,
1.169911, -1.293007, 1.778527, 0, 0, 0, 1, 1,
1.172147, 0.009983826, 1.998362, 0, 0, 0, 1, 1,
1.182652, -0.3356829, 1.507257, 0, 0, 0, 1, 1,
1.20578, -0.3692472, 2.728053, 0, 0, 0, 1, 1,
1.213138, -0.07986649, 0.4501944, 0, 0, 0, 1, 1,
1.218482, -0.7918695, 2.226657, 1, 1, 1, 1, 1,
1.219321, -0.9487582, 2.639102, 1, 1, 1, 1, 1,
1.227033, 0.1021304, 1.148295, 1, 1, 1, 1, 1,
1.228242, -1.367534, 3.022674, 1, 1, 1, 1, 1,
1.237669, -1.554644, 1.947137, 1, 1, 1, 1, 1,
1.240193, 0.4040303, 0.1622057, 1, 1, 1, 1, 1,
1.245305, -1.040727, 2.859978, 1, 1, 1, 1, 1,
1.255795, -0.9340274, 2.827127, 1, 1, 1, 1, 1,
1.257777, -0.4408678, 3.062938, 1, 1, 1, 1, 1,
1.26129, -0.9279524, 1.70876, 1, 1, 1, 1, 1,
1.271633, -0.4700725, 2.325126, 1, 1, 1, 1, 1,
1.276491, -1.474119, 2.541605, 1, 1, 1, 1, 1,
1.277038, 0.1278675, 1.788469, 1, 1, 1, 1, 1,
1.281345, -1.167506, 2.420285, 1, 1, 1, 1, 1,
1.282393, 0.5015757, 1.212331, 1, 1, 1, 1, 1,
1.282654, 1.244223, 0.979651, 0, 0, 1, 1, 1,
1.285693, -0.9671093, 2.618217, 1, 0, 0, 1, 1,
1.315165, -0.5920117, 2.302412, 1, 0, 0, 1, 1,
1.316417, -0.5505601, 0.1575295, 1, 0, 0, 1, 1,
1.316666, 1.472671, 1.576193, 1, 0, 0, 1, 1,
1.317043, -0.04543292, 2.338623, 1, 0, 0, 1, 1,
1.323031, -0.2287292, 0.5421858, 0, 0, 0, 1, 1,
1.323394, -0.9685304, 2.454219, 0, 0, 0, 1, 1,
1.324333, -1.343169, 1.884562, 0, 0, 0, 1, 1,
1.324647, -0.09675906, 3.439637, 0, 0, 0, 1, 1,
1.32991, -0.5435207, 1.949203, 0, 0, 0, 1, 1,
1.332209, -0.7762299, 0.06122367, 0, 0, 0, 1, 1,
1.335647, 0.4693922, 1.030883, 0, 0, 0, 1, 1,
1.336211, 0.6163018, 2.411061, 1, 1, 1, 1, 1,
1.338032, -1.227954, 1.437524, 1, 1, 1, 1, 1,
1.341465, 0.3183641, 0.4975854, 1, 1, 1, 1, 1,
1.343124, -0.2649765, 2.900374, 1, 1, 1, 1, 1,
1.356409, -1.162818, 2.092659, 1, 1, 1, 1, 1,
1.359368, 0.7324499, 2.78589, 1, 1, 1, 1, 1,
1.362168, 0.1217203, -1.01645, 1, 1, 1, 1, 1,
1.363046, -0.1694072, 1.748346, 1, 1, 1, 1, 1,
1.372074, 0.7167421, 0.7104005, 1, 1, 1, 1, 1,
1.37361, 2.625149, 0.5022511, 1, 1, 1, 1, 1,
1.37479, 0.7131853, -0.5181259, 1, 1, 1, 1, 1,
1.390697, -2.086082, 4.488031, 1, 1, 1, 1, 1,
1.400499, 0.3822712, 0.8231043, 1, 1, 1, 1, 1,
1.406125, 0.7826908, 1.13676, 1, 1, 1, 1, 1,
1.437363, 0.5119286, 1.173383, 1, 1, 1, 1, 1,
1.438195, -0.9113151, 1.543535, 0, 0, 1, 1, 1,
1.439582, -0.5244809, 1.680572, 1, 0, 0, 1, 1,
1.451582, -1.493511, 2.708811, 1, 0, 0, 1, 1,
1.467698, 0.2487941, 2.736547, 1, 0, 0, 1, 1,
1.485464, 0.239391, 3.171144, 1, 0, 0, 1, 1,
1.503197, -0.5551922, 1.513486, 1, 0, 0, 1, 1,
1.508695, -0.5338538, 4.009697, 0, 0, 0, 1, 1,
1.516769, -0.4143313, 1.702581, 0, 0, 0, 1, 1,
1.520598, 0.7873129, 2.000446, 0, 0, 0, 1, 1,
1.533526, 1.46885, 1.265327, 0, 0, 0, 1, 1,
1.555878, 2.091253, -0.07934791, 0, 0, 0, 1, 1,
1.558283, 0.0616596, 2.094918, 0, 0, 0, 1, 1,
1.586924, -0.1662333, 1.10573, 0, 0, 0, 1, 1,
1.596152, -0.0753959, 1.308754, 1, 1, 1, 1, 1,
1.597229, -0.8646867, 1.914618, 1, 1, 1, 1, 1,
1.603553, 2.019137, -0.2562878, 1, 1, 1, 1, 1,
1.604129, 1.18544, 2.160758, 1, 1, 1, 1, 1,
1.62693, -0.03434368, 2.122374, 1, 1, 1, 1, 1,
1.628429, 0.3862994, 1.879248, 1, 1, 1, 1, 1,
1.638385, -0.1001728, 1.102748, 1, 1, 1, 1, 1,
1.645439, 0.7610204, 0.1254928, 1, 1, 1, 1, 1,
1.648979, 1.226512, 2.411091, 1, 1, 1, 1, 1,
1.649225, -0.1593042, 1.673993, 1, 1, 1, 1, 1,
1.669885, 1.473101, 1.187701, 1, 1, 1, 1, 1,
1.686451, 1.046273, 0.8800595, 1, 1, 1, 1, 1,
1.690867, 1.81193, 1.013048, 1, 1, 1, 1, 1,
1.693545, 1.611291, -0.2157345, 1, 1, 1, 1, 1,
1.697225, 0.3229943, 1.850488, 1, 1, 1, 1, 1,
1.698378, 0.3833363, 3.141957, 0, 0, 1, 1, 1,
1.709552, -1.001754, 3.299947, 1, 0, 0, 1, 1,
1.718268, -0.3057566, 2.304612, 1, 0, 0, 1, 1,
1.718852, -0.9465768, 0.606314, 1, 0, 0, 1, 1,
1.725589, -0.01506604, 1.360864, 1, 0, 0, 1, 1,
1.727688, -0.2180702, 0.8896695, 1, 0, 0, 1, 1,
1.760196, 0.7849512, 1.030431, 0, 0, 0, 1, 1,
1.778525, 2.412189, 2.292675, 0, 0, 0, 1, 1,
1.831995, -0.9951738, 1.61067, 0, 0, 0, 1, 1,
1.839678, 0.8349487, -0.3069171, 0, 0, 0, 1, 1,
1.840195, -0.1122536, 1.522208, 0, 0, 0, 1, 1,
1.864139, -0.9871314, 3.071059, 0, 0, 0, 1, 1,
1.873002, 0.3064831, 0.09902276, 0, 0, 0, 1, 1,
1.880517, -0.7701981, 0.3706206, 1, 1, 1, 1, 1,
1.903306, 0.01684455, 0.8543061, 1, 1, 1, 1, 1,
1.939191, 1.257019, 3.199101, 1, 1, 1, 1, 1,
1.95749, 1.508186, -1.154233, 1, 1, 1, 1, 1,
1.974719, 0.3395578, -0.1652516, 1, 1, 1, 1, 1,
1.988615, -0.3697183, 0.7548997, 1, 1, 1, 1, 1,
2.007122, -0.3176374, 2.993181, 1, 1, 1, 1, 1,
2.010002, -0.06140408, 2.427689, 1, 1, 1, 1, 1,
2.011982, 0.7740156, 2.448806, 1, 1, 1, 1, 1,
2.016489, -0.4115702, 2.204564, 1, 1, 1, 1, 1,
2.046232, -0.9658822, -0.1406993, 1, 1, 1, 1, 1,
2.049946, 1.289787, -0.9718276, 1, 1, 1, 1, 1,
2.06291, -2.41362, 3.457311, 1, 1, 1, 1, 1,
2.071993, 0.3019957, 0.4128155, 1, 1, 1, 1, 1,
2.085438, 0.7937796, 2.272734, 1, 1, 1, 1, 1,
2.089789, 0.21069, 2.043688, 0, 0, 1, 1, 1,
2.112584, -0.7654418, 1.462955, 1, 0, 0, 1, 1,
2.182362, -0.4134006, 2.821275, 1, 0, 0, 1, 1,
2.199571, -0.647417, 0.1979091, 1, 0, 0, 1, 1,
2.200988, 1.01703, 2.121488, 1, 0, 0, 1, 1,
2.248037, 0.7815106, 4.226575, 1, 0, 0, 1, 1,
2.264185, -1.168941, 2.011415, 0, 0, 0, 1, 1,
2.279132, -0.4314986, 3.505977, 0, 0, 0, 1, 1,
2.292512, 0.4165131, 1.550181, 0, 0, 0, 1, 1,
2.304333, -1.899058, 2.18999, 0, 0, 0, 1, 1,
2.346773, 0.0965376, 1.634905, 0, 0, 0, 1, 1,
2.39873, 1.465822, 0.3217958, 0, 0, 0, 1, 1,
2.432985, 0.3049173, 0.3598026, 0, 0, 0, 1, 1,
2.548939, 1.194971, 1.033231, 1, 1, 1, 1, 1,
2.637221, 0.9319085, 0.4040617, 1, 1, 1, 1, 1,
2.778175, -1.446708, 2.969726, 1, 1, 1, 1, 1,
2.963851, -1.357148, 0.4655913, 1, 1, 1, 1, 1,
3.103884, 0.1471641, 0.8660589, 1, 1, 1, 1, 1,
3.292261, 0.1916156, 2.640367, 1, 1, 1, 1, 1,
3.620538, 0.6573433, 0.448737, 1, 1, 1, 1, 1
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
var radius = 9.206998;
var distance = 32.33919;
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
mvMatrix.translate( -0.2346597, -0.002588511, 0.1063302 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.33919);
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
