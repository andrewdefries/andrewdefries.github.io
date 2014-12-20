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
-3.657796, 1.980212, -1.755432, 1, 0, 0, 1,
-3.447643, 0.7309439, -0.6396204, 1, 0.007843138, 0, 1,
-2.606307, 1.054007, -0.5250015, 1, 0.01176471, 0, 1,
-2.586254, 0.6313694, -0.8856971, 1, 0.01960784, 0, 1,
-2.455553, 0.3718483, 0.1725162, 1, 0.02352941, 0, 1,
-2.422821, -0.6400154, -2.363907, 1, 0.03137255, 0, 1,
-2.399627, 1.023617, -0.5474721, 1, 0.03529412, 0, 1,
-2.369069, -0.7088815, -2.328087, 1, 0.04313726, 0, 1,
-2.316853, -0.6138948, -0.5822025, 1, 0.04705882, 0, 1,
-2.265087, -0.05873641, -2.383897, 1, 0.05490196, 0, 1,
-2.259022, 2.021403, -0.9124417, 1, 0.05882353, 0, 1,
-2.254729, 0.0192442, -2.230647, 1, 0.06666667, 0, 1,
-2.25466, 0.9949654, -2.139889, 1, 0.07058824, 0, 1,
-2.225056, 0.9702271, -0.7992486, 1, 0.07843138, 0, 1,
-2.194292, 0.5230256, -0.8201901, 1, 0.08235294, 0, 1,
-2.149711, 0.4248525, -0.8768069, 1, 0.09019608, 0, 1,
-2.137749, -0.3110633, -2.512714, 1, 0.09411765, 0, 1,
-2.095827, 0.9879769, -3.99235, 1, 0.1019608, 0, 1,
-2.059151, 1.793671, -2.300304, 1, 0.1098039, 0, 1,
-2.038243, 1.458926, -0.94745, 1, 0.1137255, 0, 1,
-2.016143, 1.695552, -1.931584, 1, 0.1215686, 0, 1,
-2.003808, -1.999706, -2.245777, 1, 0.1254902, 0, 1,
-2.003328, 0.4086352, 0.06149749, 1, 0.1333333, 0, 1,
-1.986472, 1.455804, -1.344248, 1, 0.1372549, 0, 1,
-1.981185, -0.6204179, -2.672236, 1, 0.145098, 0, 1,
-1.980162, -0.7544016, -3.481268, 1, 0.1490196, 0, 1,
-1.972892, 1.645432, -0.8959607, 1, 0.1568628, 0, 1,
-1.965228, -0.4293168, -2.676037, 1, 0.1607843, 0, 1,
-1.956967, -0.6068501, -1.379703, 1, 0.1686275, 0, 1,
-1.927287, 1.557968, -2.357897, 1, 0.172549, 0, 1,
-1.911323, -1.043766, -2.601991, 1, 0.1803922, 0, 1,
-1.905635, -0.4102408, -2.833592, 1, 0.1843137, 0, 1,
-1.899007, 0.05452667, -1.06293, 1, 0.1921569, 0, 1,
-1.890484, -0.6621574, -2.137627, 1, 0.1960784, 0, 1,
-1.883607, -0.4488466, -5.216632, 1, 0.2039216, 0, 1,
-1.882749, 0.04379017, -1.630762, 1, 0.2117647, 0, 1,
-1.867526, 0.4673271, -1.31523, 1, 0.2156863, 0, 1,
-1.859939, -0.6807266, -3.046855, 1, 0.2235294, 0, 1,
-1.8588, -0.2566533, -1.998923, 1, 0.227451, 0, 1,
-1.847598, 0.223844, -3.025027, 1, 0.2352941, 0, 1,
-1.83726, 0.4835231, -0.963814, 1, 0.2392157, 0, 1,
-1.834943, 0.6711257, -2.001053, 1, 0.2470588, 0, 1,
-1.833455, -0.2576923, -1.198831, 1, 0.2509804, 0, 1,
-1.825735, 0.9423578, 0.5602006, 1, 0.2588235, 0, 1,
-1.810313, 0.1794442, -1.174204, 1, 0.2627451, 0, 1,
-1.808461, -0.8049336, -2.575572, 1, 0.2705882, 0, 1,
-1.790865, 0.731679, -1.2208, 1, 0.2745098, 0, 1,
-1.778827, 1.191171, 0.01911801, 1, 0.282353, 0, 1,
-1.77842, 0.6657777, -1.099325, 1, 0.2862745, 0, 1,
-1.76928, -0.3666666, 0.006566341, 1, 0.2941177, 0, 1,
-1.752355, -0.2288587, -3.143022, 1, 0.3019608, 0, 1,
-1.725217, 1.692251, -1.924404, 1, 0.3058824, 0, 1,
-1.722565, -0.4135002, -0.04568174, 1, 0.3137255, 0, 1,
-1.718464, -1.268018, -2.425902, 1, 0.3176471, 0, 1,
-1.705518, -1.61904, -1.785082, 1, 0.3254902, 0, 1,
-1.705461, 0.1557883, -1.729439, 1, 0.3294118, 0, 1,
-1.694528, -1.70047, -1.775052, 1, 0.3372549, 0, 1,
-1.688612, 0.6465694, -2.658332, 1, 0.3411765, 0, 1,
-1.654777, 1.97334, 0.2116428, 1, 0.3490196, 0, 1,
-1.653337, -2.367023, -2.015674, 1, 0.3529412, 0, 1,
-1.648404, -0.4359711, -0.3379107, 1, 0.3607843, 0, 1,
-1.625897, 0.6219169, -1.302374, 1, 0.3647059, 0, 1,
-1.603874, -0.2486569, -0.5832224, 1, 0.372549, 0, 1,
-1.602457, 0.680201, -0.4019741, 1, 0.3764706, 0, 1,
-1.590193, -1.045491, -4.184026, 1, 0.3843137, 0, 1,
-1.587806, -0.07351214, 0.9076543, 1, 0.3882353, 0, 1,
-1.584388, -0.2298581, -2.822129, 1, 0.3960784, 0, 1,
-1.562588, 0.8419065, -0.5318292, 1, 0.4039216, 0, 1,
-1.559724, -0.4089643, -1.892319, 1, 0.4078431, 0, 1,
-1.541182, -0.4624428, -1.852108, 1, 0.4156863, 0, 1,
-1.535105, -0.2772814, -2.816153, 1, 0.4196078, 0, 1,
-1.528611, 1.750936, 0.3967857, 1, 0.427451, 0, 1,
-1.525919, 1.192952, -0.8461844, 1, 0.4313726, 0, 1,
-1.523346, -0.9868228, -2.766598, 1, 0.4392157, 0, 1,
-1.522601, 0.2307617, -1.517562, 1, 0.4431373, 0, 1,
-1.514532, 0.1889996, -1.910252, 1, 0.4509804, 0, 1,
-1.509856, -1.202408, -1.727255, 1, 0.454902, 0, 1,
-1.508711, 0.698108, -3.488777, 1, 0.4627451, 0, 1,
-1.505924, -0.0113998, -2.576565, 1, 0.4666667, 0, 1,
-1.505106, 1.080416, 0.3360439, 1, 0.4745098, 0, 1,
-1.503312, -1.45438, -2.414868, 1, 0.4784314, 0, 1,
-1.489667, -1.93544, -1.779528, 1, 0.4862745, 0, 1,
-1.485515, 0.3871775, -1.017509, 1, 0.4901961, 0, 1,
-1.443494, -0.5930452, -2.980207, 1, 0.4980392, 0, 1,
-1.443382, 0.2369048, 0.6381372, 1, 0.5058824, 0, 1,
-1.422363, -0.728815, -2.605317, 1, 0.509804, 0, 1,
-1.407596, 0.3370958, 0.7965105, 1, 0.5176471, 0, 1,
-1.40334, 1.152094, -1.006065, 1, 0.5215687, 0, 1,
-1.403261, -1.409002, -2.024427, 1, 0.5294118, 0, 1,
-1.400084, -0.5282468, -3.571301, 1, 0.5333334, 0, 1,
-1.39819, 0.8423783, -1.787577, 1, 0.5411765, 0, 1,
-1.395636, 0.2450126, -0.7729694, 1, 0.5450981, 0, 1,
-1.388707, -1.533086, -2.698704, 1, 0.5529412, 0, 1,
-1.387416, -0.4672866, -1.020993, 1, 0.5568628, 0, 1,
-1.361485, 0.8526561, 0.1079492, 1, 0.5647059, 0, 1,
-1.361236, 0.9300517, -1.763573, 1, 0.5686275, 0, 1,
-1.351938, 0.2455304, -0.03536732, 1, 0.5764706, 0, 1,
-1.340557, -0.2158696, -2.015699, 1, 0.5803922, 0, 1,
-1.336327, 0.8588057, -1.184979, 1, 0.5882353, 0, 1,
-1.324427, -0.6859799, -0.7093766, 1, 0.5921569, 0, 1,
-1.32243, 0.3707185, 0.3931677, 1, 0.6, 0, 1,
-1.321269, 0.9092051, -0.9593009, 1, 0.6078432, 0, 1,
-1.316754, -0.9584091, -3.239077, 1, 0.6117647, 0, 1,
-1.314076, 0.5086846, -1.575524, 1, 0.6196079, 0, 1,
-1.310967, -3.061061, -2.156791, 1, 0.6235294, 0, 1,
-1.295993, 1.454268, -1.100079, 1, 0.6313726, 0, 1,
-1.293817, 0.0353047, -0.6653229, 1, 0.6352941, 0, 1,
-1.283836, 0.66361, -1.930823, 1, 0.6431373, 0, 1,
-1.279513, -0.4514701, -0.5370401, 1, 0.6470588, 0, 1,
-1.278627, 0.5050091, -1.161891, 1, 0.654902, 0, 1,
-1.278028, -0.9432562, -4.018532, 1, 0.6588235, 0, 1,
-1.271078, 0.7852989, -1.080505, 1, 0.6666667, 0, 1,
-1.265073, 0.4648156, -0.6012164, 1, 0.6705883, 0, 1,
-1.25929, 2.135465, -1.593817, 1, 0.6784314, 0, 1,
-1.258491, 0.9425499, -1.125965, 1, 0.682353, 0, 1,
-1.256938, 0.6774775, -1.223772, 1, 0.6901961, 0, 1,
-1.256481, 0.1969166, -1.623942, 1, 0.6941177, 0, 1,
-1.256469, -2.646871, -3.405704, 1, 0.7019608, 0, 1,
-1.256316, -0.5006235, 0.09172235, 1, 0.7098039, 0, 1,
-1.250146, -0.07807757, -2.25126, 1, 0.7137255, 0, 1,
-1.24234, -0.7370712, -1.335846, 1, 0.7215686, 0, 1,
-1.236842, 2.302259, -0.04759734, 1, 0.7254902, 0, 1,
-1.235655, -1.295312, -4.206754, 1, 0.7333333, 0, 1,
-1.231691, -2.392905, -1.886833, 1, 0.7372549, 0, 1,
-1.223677, 0.03340654, -2.884739, 1, 0.7450981, 0, 1,
-1.223163, 0.3866496, -0.9258166, 1, 0.7490196, 0, 1,
-1.219223, 0.8156295, -2.487341, 1, 0.7568628, 0, 1,
-1.215782, -0.4499185, -2.440455, 1, 0.7607843, 0, 1,
-1.21377, 0.5015342, -1.657737, 1, 0.7686275, 0, 1,
-1.209727, -1.615508, -4.620682, 1, 0.772549, 0, 1,
-1.205686, 0.04199946, -0.7298859, 1, 0.7803922, 0, 1,
-1.205616, 0.5368022, -1.20009, 1, 0.7843137, 0, 1,
-1.193637, -1.075043, -1.302205, 1, 0.7921569, 0, 1,
-1.189193, -1.000524, -1.976995, 1, 0.7960784, 0, 1,
-1.188924, -0.0813943, -1.019978, 1, 0.8039216, 0, 1,
-1.187333, -1.269815, -4.149805, 1, 0.8117647, 0, 1,
-1.181272, -0.3613906, -2.131631, 1, 0.8156863, 0, 1,
-1.175251, -1.425314, -1.047449, 1, 0.8235294, 0, 1,
-1.167587, 0.1927944, -0.9134359, 1, 0.827451, 0, 1,
-1.160368, -0.1476262, -1.593336, 1, 0.8352941, 0, 1,
-1.156913, -0.7726927, -1.002955, 1, 0.8392157, 0, 1,
-1.151084, 0.2151436, 1.504732, 1, 0.8470588, 0, 1,
-1.144992, -0.1140072, -2.009249, 1, 0.8509804, 0, 1,
-1.140326, 0.8220472, -3.28286, 1, 0.8588235, 0, 1,
-1.131141, -0.5971635, -2.217964, 1, 0.8627451, 0, 1,
-1.12974, 0.5150371, -0.7200403, 1, 0.8705882, 0, 1,
-1.123373, -0.01002114, -1.578196, 1, 0.8745098, 0, 1,
-1.119876, -0.9010922, -1.561759, 1, 0.8823529, 0, 1,
-1.11528, 1.056599, -1.490411, 1, 0.8862745, 0, 1,
-1.114797, -2.065997, -3.006102, 1, 0.8941177, 0, 1,
-1.110455, -0.5811932, -2.793329, 1, 0.8980392, 0, 1,
-1.104443, -1.196974, -2.192083, 1, 0.9058824, 0, 1,
-1.1044, -0.05021108, -1.67864, 1, 0.9137255, 0, 1,
-1.103051, -0.6562428, -2.029776, 1, 0.9176471, 0, 1,
-1.10216, 0.9112555, -1.159877, 1, 0.9254902, 0, 1,
-1.101083, 0.01593503, -1.603595, 1, 0.9294118, 0, 1,
-1.092371, 0.3421354, -0.7947114, 1, 0.9372549, 0, 1,
-1.085244, -0.2127165, -3.853758, 1, 0.9411765, 0, 1,
-1.083625, -0.3212217, -2.801849, 1, 0.9490196, 0, 1,
-1.074585, -0.8125771, -2.39584, 1, 0.9529412, 0, 1,
-1.066412, -2.46821, -2.036014, 1, 0.9607843, 0, 1,
-1.058708, -0.6173296, -3.566226, 1, 0.9647059, 0, 1,
-1.053047, -0.9939705, -2.723084, 1, 0.972549, 0, 1,
-1.043874, 1.126729, 1.244219, 1, 0.9764706, 0, 1,
-1.04252, -1.198932, -2.962227, 1, 0.9843137, 0, 1,
-1.033779, 0.3358709, -0.01359473, 1, 0.9882353, 0, 1,
-1.032507, 0.9474485, -0.687555, 1, 0.9960784, 0, 1,
-1.031614, 1.367442, 1.345714, 0.9960784, 1, 0, 1,
-1.025874, -0.3955183, -2.758348, 0.9921569, 1, 0, 1,
-1.021879, 1.253278, 0.007772268, 0.9843137, 1, 0, 1,
-1.00267, 0.9737079, -1.36499, 0.9803922, 1, 0, 1,
-1.001229, 1.054477, -0.8525379, 0.972549, 1, 0, 1,
-1.001092, 0.8383062, 0.686191, 0.9686275, 1, 0, 1,
-0.9984799, 0.854387, 0.03391563, 0.9607843, 1, 0, 1,
-0.9977523, 0.5400555, -2.306721, 0.9568627, 1, 0, 1,
-0.9973989, 1.71691, 0.7105199, 0.9490196, 1, 0, 1,
-0.9829564, -0.2727011, -2.43538, 0.945098, 1, 0, 1,
-0.9811289, -0.5107458, -3.385971, 0.9372549, 1, 0, 1,
-0.9740008, 2.276385, -1.998332, 0.9333333, 1, 0, 1,
-0.9735738, -0.5382681, -2.40252, 0.9254902, 1, 0, 1,
-0.9717127, -0.7767197, -3.465878, 0.9215686, 1, 0, 1,
-0.9686339, 0.2986061, -3.001012, 0.9137255, 1, 0, 1,
-0.9678057, 0.7554101, -2.280126, 0.9098039, 1, 0, 1,
-0.9599903, -0.6305228, -1.430284, 0.9019608, 1, 0, 1,
-0.9594162, -0.9091049, -3.283314, 0.8941177, 1, 0, 1,
-0.9579175, 0.8490781, -1.238081, 0.8901961, 1, 0, 1,
-0.9492363, 1.192037, -0.3364516, 0.8823529, 1, 0, 1,
-0.9472178, 0.7755368, -0.7782644, 0.8784314, 1, 0, 1,
-0.9370909, -0.2512457, -0.7176988, 0.8705882, 1, 0, 1,
-0.9368535, -1.072729, -3.774704, 0.8666667, 1, 0, 1,
-0.9294339, 1.406991, -2.299353, 0.8588235, 1, 0, 1,
-0.9252942, 0.04338435, -0.2829241, 0.854902, 1, 0, 1,
-0.9184166, -0.521385, -0.8580232, 0.8470588, 1, 0, 1,
-0.9139344, -1.114771, -2.989176, 0.8431373, 1, 0, 1,
-0.9075936, -0.7898961, -2.911623, 0.8352941, 1, 0, 1,
-0.9053, 2.087886, -0.04007882, 0.8313726, 1, 0, 1,
-0.9008331, -0.6623685, -2.708475, 0.8235294, 1, 0, 1,
-0.9005258, 0.276852, -1.538372, 0.8196079, 1, 0, 1,
-0.8962327, -1.672005, -2.869043, 0.8117647, 1, 0, 1,
-0.8947704, 1.024272, 2.500111, 0.8078431, 1, 0, 1,
-0.8802977, 0.6575066, -0.2225255, 0.8, 1, 0, 1,
-0.8802466, 0.8115209, 0.3163295, 0.7921569, 1, 0, 1,
-0.8751178, 0.4907606, -3.007604, 0.7882353, 1, 0, 1,
-0.8708684, 0.3392968, -1.528471, 0.7803922, 1, 0, 1,
-0.8683134, -1.018138, -1.089383, 0.7764706, 1, 0, 1,
-0.8672004, -1.090844, -1.460802, 0.7686275, 1, 0, 1,
-0.8623869, 0.5064439, -1.63554, 0.7647059, 1, 0, 1,
-0.8574615, 0.4883424, 0.3942033, 0.7568628, 1, 0, 1,
-0.8529723, -0.6351684, -3.370808, 0.7529412, 1, 0, 1,
-0.83723, 1.35562, -0.8167409, 0.7450981, 1, 0, 1,
-0.8347456, -1.855133, -2.970638, 0.7411765, 1, 0, 1,
-0.8341973, 0.1383365, -1.026144, 0.7333333, 1, 0, 1,
-0.8299153, 0.5556268, 0.3293956, 0.7294118, 1, 0, 1,
-0.8229637, 1.022752, -0.7955476, 0.7215686, 1, 0, 1,
-0.8157279, 0.09689488, -1.076397, 0.7176471, 1, 0, 1,
-0.8085431, -0.9250115, -0.4099356, 0.7098039, 1, 0, 1,
-0.807677, 1.174713, -1.80995, 0.7058824, 1, 0, 1,
-0.8075171, 1.19805, -0.07269675, 0.6980392, 1, 0, 1,
-0.8057823, -0.9050217, -2.691715, 0.6901961, 1, 0, 1,
-0.8009061, 1.415526, 0.7467549, 0.6862745, 1, 0, 1,
-0.8002468, -0.2098055, -1.933467, 0.6784314, 1, 0, 1,
-0.7905319, 1.125054, -0.29976, 0.6745098, 1, 0, 1,
-0.7846177, 0.6532621, -0.2965698, 0.6666667, 1, 0, 1,
-0.7820892, -0.1359049, -3.260531, 0.6627451, 1, 0, 1,
-0.7801169, -0.2412865, -2.227533, 0.654902, 1, 0, 1,
-0.7792879, -1.371586, -1.394269, 0.6509804, 1, 0, 1,
-0.7779418, -0.26576, -1.884784, 0.6431373, 1, 0, 1,
-0.7740422, -1.151862, -3.102427, 0.6392157, 1, 0, 1,
-0.7704195, 1.23435, -0.7162895, 0.6313726, 1, 0, 1,
-0.7627478, -0.9949294, -2.176534, 0.627451, 1, 0, 1,
-0.7618865, 1.237679, -1.489797, 0.6196079, 1, 0, 1,
-0.7588163, -0.5643401, -0.5112631, 0.6156863, 1, 0, 1,
-0.7495723, 0.4369336, -1.329078, 0.6078432, 1, 0, 1,
-0.7485726, -0.3851664, -0.1302244, 0.6039216, 1, 0, 1,
-0.7425044, -0.4088847, -0.8948041, 0.5960785, 1, 0, 1,
-0.7409327, -1.146646, -3.938208, 0.5882353, 1, 0, 1,
-0.7408963, -1.255354, -4.124289, 0.5843138, 1, 0, 1,
-0.7377635, -0.4230388, -2.235712, 0.5764706, 1, 0, 1,
-0.7351703, -0.345458, -3.418776, 0.572549, 1, 0, 1,
-0.7296332, 0.4917073, 0.3318468, 0.5647059, 1, 0, 1,
-0.7291088, -1.841114, -2.683882, 0.5607843, 1, 0, 1,
-0.7283101, -0.132358, -2.608173, 0.5529412, 1, 0, 1,
-0.7276981, 0.1313534, -1.198659, 0.5490196, 1, 0, 1,
-0.723691, -1.147503, -2.287024, 0.5411765, 1, 0, 1,
-0.7204996, 0.39026, -1.630999, 0.5372549, 1, 0, 1,
-0.7203744, 0.8914818, -1.392224, 0.5294118, 1, 0, 1,
-0.7175359, -0.4887499, -3.5872, 0.5254902, 1, 0, 1,
-0.7172147, 1.700702, -0.3076498, 0.5176471, 1, 0, 1,
-0.7169865, 0.02225985, -0.6893269, 0.5137255, 1, 0, 1,
-0.7128547, -1.513507, -1.961809, 0.5058824, 1, 0, 1,
-0.7121282, 0.2035509, -1.473694, 0.5019608, 1, 0, 1,
-0.7083659, -0.4317772, -1.154435, 0.4941176, 1, 0, 1,
-0.7037233, -0.3091712, -1.480362, 0.4862745, 1, 0, 1,
-0.6973806, 0.7029731, -1.391623, 0.4823529, 1, 0, 1,
-0.6969217, 1.479903, -0.8016776, 0.4745098, 1, 0, 1,
-0.6930975, -0.5912478, -3.378483, 0.4705882, 1, 0, 1,
-0.6926869, 0.9451982, -0.04794018, 0.4627451, 1, 0, 1,
-0.6919532, -0.1621595, -0.53202, 0.4588235, 1, 0, 1,
-0.686525, 0.8123868, 0.08135286, 0.4509804, 1, 0, 1,
-0.6857396, -0.6736832, -1.045986, 0.4470588, 1, 0, 1,
-0.682148, 0.2655838, -0.463427, 0.4392157, 1, 0, 1,
-0.680099, 3.274506, -1.24675, 0.4352941, 1, 0, 1,
-0.6775561, -0.8562921, -1.34122, 0.427451, 1, 0, 1,
-0.6743805, -0.9179584, -1.012161, 0.4235294, 1, 0, 1,
-0.6734602, 0.8402976, 0.02522968, 0.4156863, 1, 0, 1,
-0.6696709, -0.9097928, -1.494889, 0.4117647, 1, 0, 1,
-0.6647993, -0.7557324, -1.581058, 0.4039216, 1, 0, 1,
-0.6370115, 0.4776599, -1.609591, 0.3960784, 1, 0, 1,
-0.6369818, 1.459441, 2.449718, 0.3921569, 1, 0, 1,
-0.6359422, 1.58569, 2.251073, 0.3843137, 1, 0, 1,
-0.6353167, -0.9842867, -3.913161, 0.3803922, 1, 0, 1,
-0.6343896, -0.9844785, -4.629696, 0.372549, 1, 0, 1,
-0.6330538, 1.647832, -1.803412, 0.3686275, 1, 0, 1,
-0.6307099, -2.159774, -3.892091, 0.3607843, 1, 0, 1,
-0.6290138, -0.8921081, -0.8001417, 0.3568628, 1, 0, 1,
-0.6284565, 0.4178582, -1.086319, 0.3490196, 1, 0, 1,
-0.6282101, 0.3453135, -0.7563863, 0.345098, 1, 0, 1,
-0.6220652, -0.2246862, -2.352236, 0.3372549, 1, 0, 1,
-0.6203923, -1.466531, -2.996453, 0.3333333, 1, 0, 1,
-0.6196396, 0.6992199, -1.585583, 0.3254902, 1, 0, 1,
-0.6182297, -0.086165, -2.19292, 0.3215686, 1, 0, 1,
-0.6135972, -1.051285, -3.566483, 0.3137255, 1, 0, 1,
-0.6097286, 0.2387146, 1.157969, 0.3098039, 1, 0, 1,
-0.6070665, 1.151037, -0.6097535, 0.3019608, 1, 0, 1,
-0.6056347, 1.234287, 0.1505191, 0.2941177, 1, 0, 1,
-0.604103, 2.012108, 0.1587615, 0.2901961, 1, 0, 1,
-0.5989556, 0.6114625, -1.958517, 0.282353, 1, 0, 1,
-0.5984868, 2.05138, 0.3029928, 0.2784314, 1, 0, 1,
-0.5941573, -0.8651543, -2.80917, 0.2705882, 1, 0, 1,
-0.5903015, 0.2011669, -1.68958, 0.2666667, 1, 0, 1,
-0.5876368, 0.2375782, -0.6813211, 0.2588235, 1, 0, 1,
-0.5867409, 0.7758412, -1.672441, 0.254902, 1, 0, 1,
-0.5863353, -1.306932, -2.50438, 0.2470588, 1, 0, 1,
-0.5752897, -0.6845001, -1.782127, 0.2431373, 1, 0, 1,
-0.5750238, -0.2641258, -2.555176, 0.2352941, 1, 0, 1,
-0.5733302, -0.5308759, -3.571412, 0.2313726, 1, 0, 1,
-0.5731152, -0.4749481, -2.271004, 0.2235294, 1, 0, 1,
-0.5696499, -0.6311177, -1.174555, 0.2196078, 1, 0, 1,
-0.5674991, 0.527018, -0.2785503, 0.2117647, 1, 0, 1,
-0.5605863, -0.04960638, 0.4949136, 0.2078431, 1, 0, 1,
-0.5575839, 0.2279552, -0.7357766, 0.2, 1, 0, 1,
-0.5571734, 0.7378765, -1.264103, 0.1921569, 1, 0, 1,
-0.5568227, -0.8780674, -3.586829, 0.1882353, 1, 0, 1,
-0.5567616, 0.8062469, 3.134308, 0.1803922, 1, 0, 1,
-0.5560281, -0.3779427, -3.691298, 0.1764706, 1, 0, 1,
-0.5535911, -0.7201861, -2.12989, 0.1686275, 1, 0, 1,
-0.5531399, -0.254764, -2.501446, 0.1647059, 1, 0, 1,
-0.5518867, -0.5562599, -1.939064, 0.1568628, 1, 0, 1,
-0.5507193, 0.4902799, -1.183035, 0.1529412, 1, 0, 1,
-0.5451111, -1.615648, -1.124002, 0.145098, 1, 0, 1,
-0.5388739, 1.392836, 0.3458813, 0.1411765, 1, 0, 1,
-0.5371669, -1.557878, -2.943596, 0.1333333, 1, 0, 1,
-0.529691, 0.6518385, -0.8305946, 0.1294118, 1, 0, 1,
-0.5291825, 0.7040331, -1.056836, 0.1215686, 1, 0, 1,
-0.5274789, -0.5270005, -0.3007376, 0.1176471, 1, 0, 1,
-0.5272941, -0.3993234, -1.994557, 0.1098039, 1, 0, 1,
-0.5272482, 0.7340239, 2.115418, 0.1058824, 1, 0, 1,
-0.5248301, 0.9244053, -0.9306868, 0.09803922, 1, 0, 1,
-0.5138392, -0.9367374, -2.215481, 0.09019608, 1, 0, 1,
-0.4977684, 1.451641, 0.6829408, 0.08627451, 1, 0, 1,
-0.4907573, 0.7904584, -1.471055, 0.07843138, 1, 0, 1,
-0.4891804, 1.60903, 2.149822, 0.07450981, 1, 0, 1,
-0.4837233, 0.9331657, -1.353611, 0.06666667, 1, 0, 1,
-0.4832776, -0.6869062, -2.916967, 0.0627451, 1, 0, 1,
-0.4784692, 0.1825761, -1.740552, 0.05490196, 1, 0, 1,
-0.4770134, 0.2353612, -0.4790471, 0.05098039, 1, 0, 1,
-0.4702747, 0.04198624, -1.156451, 0.04313726, 1, 0, 1,
-0.4701135, 0.8897678, 0.1438445, 0.03921569, 1, 0, 1,
-0.4686448, -1.713268, -2.895573, 0.03137255, 1, 0, 1,
-0.4643347, -0.06794321, -3.4354, 0.02745098, 1, 0, 1,
-0.4636777, 1.060924, -0.9674489, 0.01960784, 1, 0, 1,
-0.4582689, 1.243697, 1.538237, 0.01568628, 1, 0, 1,
-0.4563755, -0.8896989, -2.507319, 0.007843138, 1, 0, 1,
-0.4556053, -0.3117468, -2.941784, 0.003921569, 1, 0, 1,
-0.4544395, 2.086666, -2.43576, 0, 1, 0.003921569, 1,
-0.4536321, -0.5088905, -0.5917276, 0, 1, 0.01176471, 1,
-0.4510639, -0.8369709, -0.8346508, 0, 1, 0.01568628, 1,
-0.4507523, 0.6246672, -0.1026029, 0, 1, 0.02352941, 1,
-0.4480675, 0.8269511, 1.694646, 0, 1, 0.02745098, 1,
-0.4432051, -0.66363, -3.59599, 0, 1, 0.03529412, 1,
-0.4400315, 1.454409, -0.2341454, 0, 1, 0.03921569, 1,
-0.4330733, -0.03871779, -3.527252, 0, 1, 0.04705882, 1,
-0.4312883, 0.7847369, 0.3543887, 0, 1, 0.05098039, 1,
-0.4307117, 0.78647, -1.120711, 0, 1, 0.05882353, 1,
-0.4304432, 1.05373, 0.3353962, 0, 1, 0.0627451, 1,
-0.4295193, -1.05988, -2.789251, 0, 1, 0.07058824, 1,
-0.4282365, 0.9580835, -1.532208, 0, 1, 0.07450981, 1,
-0.4277927, 0.7975432, -0.06863791, 0, 1, 0.08235294, 1,
-0.4255605, -0.8653668, -1.047249, 0, 1, 0.08627451, 1,
-0.4253024, 0.6059105, -0.05627223, 0, 1, 0.09411765, 1,
-0.424429, 1.522289, -1.179478, 0, 1, 0.1019608, 1,
-0.4224665, 0.9324094, -0.7705259, 0, 1, 0.1058824, 1,
-0.4180938, -0.8931934, -3.040085, 0, 1, 0.1137255, 1,
-0.4172719, 0.5758107, -0.9482049, 0, 1, 0.1176471, 1,
-0.4151415, 0.01315247, -0.6113554, 0, 1, 0.1254902, 1,
-0.413466, -0.4815382, -4.565509, 0, 1, 0.1294118, 1,
-0.413443, 1.093568, -0.3906814, 0, 1, 0.1372549, 1,
-0.4115404, -1.094581, -2.68732, 0, 1, 0.1411765, 1,
-0.4058535, 0.3266546, 0.4141719, 0, 1, 0.1490196, 1,
-0.4055738, -0.7527589, -3.329313, 0, 1, 0.1529412, 1,
-0.4054406, 0.5686902, -1.222261, 0, 1, 0.1607843, 1,
-0.404485, -0.06213015, -1.698032, 0, 1, 0.1647059, 1,
-0.4017153, -1.204852, -2.222091, 0, 1, 0.172549, 1,
-0.4009995, 0.3100412, 0.4659738, 0, 1, 0.1764706, 1,
-0.3987775, -0.5824702, -3.903732, 0, 1, 0.1843137, 1,
-0.3953438, -0.9331895, -0.5762197, 0, 1, 0.1882353, 1,
-0.39352, 1.514255, 0.3873952, 0, 1, 0.1960784, 1,
-0.3836577, 0.5056594, -0.1528357, 0, 1, 0.2039216, 1,
-0.3832236, -0.5835432, -2.480703, 0, 1, 0.2078431, 1,
-0.3824031, -1.735038, -2.83209, 0, 1, 0.2156863, 1,
-0.3814943, 0.8624584, 0.3240866, 0, 1, 0.2196078, 1,
-0.3810461, 0.5611577, -0.8876251, 0, 1, 0.227451, 1,
-0.3773238, -1.701416, -4.926373, 0, 1, 0.2313726, 1,
-0.3751782, 0.7868765, 0.9699355, 0, 1, 0.2392157, 1,
-0.3686917, -1.119061, -2.561322, 0, 1, 0.2431373, 1,
-0.3652027, 0.4654984, -0.5277142, 0, 1, 0.2509804, 1,
-0.3634042, -1.091352, -3.098164, 0, 1, 0.254902, 1,
-0.3550534, 0.09382185, -2.436979, 0, 1, 0.2627451, 1,
-0.3544261, -0.1932213, -1.730269, 0, 1, 0.2666667, 1,
-0.3544076, -1.122702, -4.715437, 0, 1, 0.2745098, 1,
-0.3533341, 1.400758, 0.05202145, 0, 1, 0.2784314, 1,
-0.3485741, 0.3932521, -0.1735762, 0, 1, 0.2862745, 1,
-0.3465934, -0.2935375, -2.992757, 0, 1, 0.2901961, 1,
-0.3465832, 0.6265356, -0.4068165, 0, 1, 0.2980392, 1,
-0.3444737, -0.9475729, -2.404082, 0, 1, 0.3058824, 1,
-0.342337, 0.3648452, -2.806066, 0, 1, 0.3098039, 1,
-0.340652, 0.1096071, -3.050461, 0, 1, 0.3176471, 1,
-0.3401904, 0.1432742, 1.937808, 0, 1, 0.3215686, 1,
-0.3328505, -0.2822821, -2.174496, 0, 1, 0.3294118, 1,
-0.3243347, -0.3175294, -5.115401, 0, 1, 0.3333333, 1,
-0.323381, -0.6678124, -4.614651, 0, 1, 0.3411765, 1,
-0.3213835, 0.4380539, 0.8477958, 0, 1, 0.345098, 1,
-0.320259, 0.09815885, 0.750209, 0, 1, 0.3529412, 1,
-0.3166398, -0.09290905, -2.384827, 0, 1, 0.3568628, 1,
-0.3146273, -2.373277, -4.040292, 0, 1, 0.3647059, 1,
-0.3131316, 0.2142145, 1.131981, 0, 1, 0.3686275, 1,
-0.3099769, 0.4567717, -0.4325728, 0, 1, 0.3764706, 1,
-0.3085654, -1.695108, -2.836701, 0, 1, 0.3803922, 1,
-0.3012143, -1.58228, -2.91025, 0, 1, 0.3882353, 1,
-0.2955741, 1.57255, 0.4261599, 0, 1, 0.3921569, 1,
-0.295228, -0.7962282, -2.60982, 0, 1, 0.4, 1,
-0.2928038, 0.1414213, -3.754303, 0, 1, 0.4078431, 1,
-0.2926422, -0.813999, -2.912064, 0, 1, 0.4117647, 1,
-0.2912336, 0.3676922, -0.4265563, 0, 1, 0.4196078, 1,
-0.2896797, 1.786254, -2.008999, 0, 1, 0.4235294, 1,
-0.2862667, -0.8062022, -3.430286, 0, 1, 0.4313726, 1,
-0.2858242, 0.180169, -0.7339073, 0, 1, 0.4352941, 1,
-0.283051, 1.372607, 0.6776159, 0, 1, 0.4431373, 1,
-0.2779638, 0.2962036, -1.641868, 0, 1, 0.4470588, 1,
-0.2749841, -0.3752044, -2.312884, 0, 1, 0.454902, 1,
-0.2739185, 0.6768557, -0.3144583, 0, 1, 0.4588235, 1,
-0.2723906, -0.08085035, -1.109498, 0, 1, 0.4666667, 1,
-0.2720292, 0.910955, -0.7906416, 0, 1, 0.4705882, 1,
-0.2709955, -0.4542727, -2.582088, 0, 1, 0.4784314, 1,
-0.2693695, -0.1901147, -2.570753, 0, 1, 0.4823529, 1,
-0.269355, -1.096808, -4.414449, 0, 1, 0.4901961, 1,
-0.2670564, -1.857411, -2.613132, 0, 1, 0.4941176, 1,
-0.2635574, 0.7028781, 0.8838483, 0, 1, 0.5019608, 1,
-0.2606261, 0.616387, -1.529049, 0, 1, 0.509804, 1,
-0.260431, 0.01223259, -0.3060469, 0, 1, 0.5137255, 1,
-0.2599026, -1.776414, -3.262676, 0, 1, 0.5215687, 1,
-0.2561742, -1.6612, -2.046649, 0, 1, 0.5254902, 1,
-0.2528785, -0.4366886, -3.93897, 0, 1, 0.5333334, 1,
-0.2504702, -0.8592145, -2.308739, 0, 1, 0.5372549, 1,
-0.2491953, -0.5666498, -3.232524, 0, 1, 0.5450981, 1,
-0.2483717, 0.3493037, 0.2150624, 0, 1, 0.5490196, 1,
-0.2414242, 0.5621544, -1.503587, 0, 1, 0.5568628, 1,
-0.2387791, -0.1493132, -0.7921247, 0, 1, 0.5607843, 1,
-0.236581, -2.091647, -2.684418, 0, 1, 0.5686275, 1,
-0.233455, -0.5318952, -3.814359, 0, 1, 0.572549, 1,
-0.231184, -1.150828, -5.030719, 0, 1, 0.5803922, 1,
-0.2195868, -1.097961, -1.784762, 0, 1, 0.5843138, 1,
-0.2177014, -1.01108, -3.902588, 0, 1, 0.5921569, 1,
-0.2118965, 1.237439, 1.338268, 0, 1, 0.5960785, 1,
-0.2117699, -1.781823, -3.473234, 0, 1, 0.6039216, 1,
-0.2108704, 0.8890495, 0.6302565, 0, 1, 0.6117647, 1,
-0.2056179, -0.6240182, -3.290214, 0, 1, 0.6156863, 1,
-0.2053016, 1.466539, 0.5275708, 0, 1, 0.6235294, 1,
-0.2038799, -0.1864402, -1.148334, 0, 1, 0.627451, 1,
-0.2024958, 0.9355538, -0.08815265, 0, 1, 0.6352941, 1,
-0.2005871, -1.224997, -4.021743, 0, 1, 0.6392157, 1,
-0.2004731, 0.6831763, -0.7476742, 0, 1, 0.6470588, 1,
-0.1910482, 0.5825471, 0.8804069, 0, 1, 0.6509804, 1,
-0.1887786, -1.14929, -2.173886, 0, 1, 0.6588235, 1,
-0.1870853, 0.4885853, -0.1076706, 0, 1, 0.6627451, 1,
-0.1836824, 2.482708, 0.9695491, 0, 1, 0.6705883, 1,
-0.1831795, -0.6431431, -2.662544, 0, 1, 0.6745098, 1,
-0.1824643, 0.3931338, -0.3945477, 0, 1, 0.682353, 1,
-0.1816995, -0.02123432, -0.3051161, 0, 1, 0.6862745, 1,
-0.1784073, -0.1942492, -2.071881, 0, 1, 0.6941177, 1,
-0.1716149, 0.1307096, -2.71605, 0, 1, 0.7019608, 1,
-0.1695224, 0.7780371, 2.149131, 0, 1, 0.7058824, 1,
-0.1686035, -0.3926173, -3.286381, 0, 1, 0.7137255, 1,
-0.1664376, -0.722365, -2.053943, 0, 1, 0.7176471, 1,
-0.1638719, -0.1369867, -0.5645395, 0, 1, 0.7254902, 1,
-0.1624247, 0.2663426, -0.7709306, 0, 1, 0.7294118, 1,
-0.1619211, 0.8759024, 1.513027, 0, 1, 0.7372549, 1,
-0.1607472, 0.3048203, -0.4486338, 0, 1, 0.7411765, 1,
-0.1605139, -0.6770576, -4.052725, 0, 1, 0.7490196, 1,
-0.1602594, -0.8548451, -1.180468, 0, 1, 0.7529412, 1,
-0.1597628, -0.1851829, -1.151722, 0, 1, 0.7607843, 1,
-0.1566708, -0.6903233, -4.257423, 0, 1, 0.7647059, 1,
-0.1565918, -0.9814384, -2.536444, 0, 1, 0.772549, 1,
-0.1562944, -0.3211444, -1.275916, 0, 1, 0.7764706, 1,
-0.1562554, 0.4810796, 1.683459, 0, 1, 0.7843137, 1,
-0.1558442, 0.8165221, 0.802521, 0, 1, 0.7882353, 1,
-0.1531981, 0.2685641, -0.8608856, 0, 1, 0.7960784, 1,
-0.1501327, -0.1405578, -1.762359, 0, 1, 0.8039216, 1,
-0.1468592, 1.373627, -0.01522841, 0, 1, 0.8078431, 1,
-0.1466279, 0.7061346, 0.7303472, 0, 1, 0.8156863, 1,
-0.1437667, 0.7040412, 1.418145, 0, 1, 0.8196079, 1,
-0.1431749, -0.2345954, -4.119656, 0, 1, 0.827451, 1,
-0.1248074, -1.532544, -2.079664, 0, 1, 0.8313726, 1,
-0.122065, 0.5098947, 0.9300243, 0, 1, 0.8392157, 1,
-0.1218347, -0.6456022, -3.653476, 0, 1, 0.8431373, 1,
-0.1141715, 1.264216, 0.8781672, 0, 1, 0.8509804, 1,
-0.1115021, 2.588648, 0.3499978, 0, 1, 0.854902, 1,
-0.1109251, 0.6035308, 0.8105832, 0, 1, 0.8627451, 1,
-0.1101035, -0.9738666, -3.135073, 0, 1, 0.8666667, 1,
-0.109617, -0.9849758, -0.4219572, 0, 1, 0.8745098, 1,
-0.1077194, 0.07920948, -1.399265, 0, 1, 0.8784314, 1,
-0.1067513, -1.243194, -3.350082, 0, 1, 0.8862745, 1,
-0.1040882, -0.5919159, -3.603703, 0, 1, 0.8901961, 1,
-0.1033092, 0.5332546, -0.3250468, 0, 1, 0.8980392, 1,
-0.0991485, 0.1532731, -0.604061, 0, 1, 0.9058824, 1,
-0.09591991, 1.35621, -0.1036133, 0, 1, 0.9098039, 1,
-0.09182872, -0.01409462, -3.241171, 0, 1, 0.9176471, 1,
-0.09041163, 0.3716053, 0.9480382, 0, 1, 0.9215686, 1,
-0.08737141, 0.233132, -0.6962586, 0, 1, 0.9294118, 1,
-0.08178884, -0.716417, -2.579359, 0, 1, 0.9333333, 1,
-0.08048911, -0.2362509, -3.265184, 0, 1, 0.9411765, 1,
-0.07809856, 1.252642, 0.4496815, 0, 1, 0.945098, 1,
-0.07587686, -0.3668981, -1.450001, 0, 1, 0.9529412, 1,
-0.07445145, 0.6529694, 0.238301, 0, 1, 0.9568627, 1,
-0.07153104, 0.9532308, 0.2978802, 0, 1, 0.9647059, 1,
-0.07109167, -1.05526, -3.043919, 0, 1, 0.9686275, 1,
-0.06476381, 0.0344418, -1.372294, 0, 1, 0.9764706, 1,
-0.06229683, 0.538994, -0.06746668, 0, 1, 0.9803922, 1,
-0.05971868, 0.9474463, 1.021646, 0, 1, 0.9882353, 1,
-0.05901109, -1.255626, -3.97328, 0, 1, 0.9921569, 1,
-0.05551811, -0.2577102, -2.565744, 0, 1, 1, 1,
-0.05528932, 0.08835658, -0.2849421, 0, 0.9921569, 1, 1,
-0.05435506, -0.8901785, -4.585478, 0, 0.9882353, 1, 1,
-0.0481752, 1.608857, 1.354759, 0, 0.9803922, 1, 1,
-0.04505428, 0.3538423, -1.295756, 0, 0.9764706, 1, 1,
-0.04330504, -0.6762503, -3.726414, 0, 0.9686275, 1, 1,
-0.03886689, -0.2791988, -3.673727, 0, 0.9647059, 1, 1,
-0.03837774, 0.2294374, 0.9749465, 0, 0.9568627, 1, 1,
-0.03534854, 0.0805033, -0.741222, 0, 0.9529412, 1, 1,
-0.03469579, -0.1480446, -1.933789, 0, 0.945098, 1, 1,
-0.0303049, 1.193749, 0.1130901, 0, 0.9411765, 1, 1,
-0.02731466, -0.5890437, -2.460475, 0, 0.9333333, 1, 1,
-0.02721064, 1.232585, -1.867611, 0, 0.9294118, 1, 1,
-0.02206806, 1.629134, -1.782602, 0, 0.9215686, 1, 1,
-0.0174845, -1.392891, -4.778646, 0, 0.9176471, 1, 1,
-0.007943454, -0.6018828, -3.625646, 0, 0.9098039, 1, 1,
-0.00377127, -1.479992, -2.906383, 0, 0.9058824, 1, 1,
-0.003488102, 1.683417, -1.129352, 0, 0.8980392, 1, 1,
-0.001971099, 1.141458, -1.046903, 0, 0.8901961, 1, 1,
0.005712024, 0.9936078, 0.02030799, 0, 0.8862745, 1, 1,
0.00659701, 0.1537655, -1.250682, 0, 0.8784314, 1, 1,
0.01448253, -1.494583, 2.93275, 0, 0.8745098, 1, 1,
0.01729379, -0.03239355, 4.011525, 0, 0.8666667, 1, 1,
0.02470493, 0.2662541, -0.04110702, 0, 0.8627451, 1, 1,
0.02659408, 0.8365806, 0.6442466, 0, 0.854902, 1, 1,
0.02673234, 0.3617631, 0.8627821, 0, 0.8509804, 1, 1,
0.02854196, 1.2488, 1.808232, 0, 0.8431373, 1, 1,
0.02870458, 0.2960404, 1.025995, 0, 0.8392157, 1, 1,
0.03160573, 0.6356117, -0.1836509, 0, 0.8313726, 1, 1,
0.03505039, 1.206693, 2.123201, 0, 0.827451, 1, 1,
0.03523355, -1.570679, 2.677504, 0, 0.8196079, 1, 1,
0.03681805, 0.689949, -0.248708, 0, 0.8156863, 1, 1,
0.03831577, -0.4194348, 3.666503, 0, 0.8078431, 1, 1,
0.03945571, 2.277529, 0.4813272, 0, 0.8039216, 1, 1,
0.04365604, 0.1974939, -0.1611253, 0, 0.7960784, 1, 1,
0.04394371, 0.008077142, 2.609559, 0, 0.7882353, 1, 1,
0.04439571, 0.02718624, 0.6236584, 0, 0.7843137, 1, 1,
0.05129711, 0.1893796, 0.508701, 0, 0.7764706, 1, 1,
0.05257813, -0.07700343, 3.054263, 0, 0.772549, 1, 1,
0.05422819, -0.4804124, 5.231944, 0, 0.7647059, 1, 1,
0.05484112, -0.5651612, 3.254024, 0, 0.7607843, 1, 1,
0.0554246, 1.090696, 1.723717, 0, 0.7529412, 1, 1,
0.05849475, 0.6802735, 2.021968, 0, 0.7490196, 1, 1,
0.0630713, 0.0586357, 2.296702, 0, 0.7411765, 1, 1,
0.0655541, -0.7769579, 2.447568, 0, 0.7372549, 1, 1,
0.06740002, 0.2497332, -0.6556075, 0, 0.7294118, 1, 1,
0.06756365, 0.92441, 1.068324, 0, 0.7254902, 1, 1,
0.06942312, 0.5639628, 0.4460121, 0, 0.7176471, 1, 1,
0.07325943, -0.9225628, 2.225361, 0, 0.7137255, 1, 1,
0.07700565, -0.7639003, 3.83321, 0, 0.7058824, 1, 1,
0.07929069, -0.1094617, 2.445626, 0, 0.6980392, 1, 1,
0.0814839, 0.2331773, -0.2307518, 0, 0.6941177, 1, 1,
0.08831818, -0.7421779, 4.30376, 0, 0.6862745, 1, 1,
0.09047934, -1.194616, 3.540545, 0, 0.682353, 1, 1,
0.09172966, 1.393388, -0.2111102, 0, 0.6745098, 1, 1,
0.0925214, 0.6478409, 1.257309, 0, 0.6705883, 1, 1,
0.09282813, -0.420325, 2.946584, 0, 0.6627451, 1, 1,
0.09368113, -2.040766, 3.039032, 0, 0.6588235, 1, 1,
0.09688447, -1.961134, 4.652064, 0, 0.6509804, 1, 1,
0.1054025, -0.9059435, 2.467991, 0, 0.6470588, 1, 1,
0.1066814, -1.311249, 3.263604, 0, 0.6392157, 1, 1,
0.1082118, -0.6564241, 3.521639, 0, 0.6352941, 1, 1,
0.1159954, 0.6504161, -0.5754923, 0, 0.627451, 1, 1,
0.1185161, 0.246489, 0.9212691, 0, 0.6235294, 1, 1,
0.1199728, -0.0788909, 1.445112, 0, 0.6156863, 1, 1,
0.120676, 1.645723, -1.835866, 0, 0.6117647, 1, 1,
0.1208776, 1.112839, 0.3239148, 0, 0.6039216, 1, 1,
0.1211468, 2.133288, 1.137055, 0, 0.5960785, 1, 1,
0.1242336, 0.2599322, 0.03560182, 0, 0.5921569, 1, 1,
0.1313428, 0.6327311, -0.5081319, 0, 0.5843138, 1, 1,
0.1345993, 0.3990177, -0.5907215, 0, 0.5803922, 1, 1,
0.1370122, -1.099089, 2.720384, 0, 0.572549, 1, 1,
0.1387864, -1.034891, 2.121974, 0, 0.5686275, 1, 1,
0.1389127, 0.03113792, 2.316576, 0, 0.5607843, 1, 1,
0.1392439, -0.7139699, 4.14864, 0, 0.5568628, 1, 1,
0.140962, -1.086415, 1.953445, 0, 0.5490196, 1, 1,
0.1587321, -0.5052416, 4.17125, 0, 0.5450981, 1, 1,
0.1594842, -0.922197, 3.073663, 0, 0.5372549, 1, 1,
0.1601954, 1.308663, 0.4446427, 0, 0.5333334, 1, 1,
0.1686052, 1.228087, 1.75612, 0, 0.5254902, 1, 1,
0.1762919, -0.9032382, 3.472384, 0, 0.5215687, 1, 1,
0.1790966, -0.7427694, 2.473168, 0, 0.5137255, 1, 1,
0.179371, -0.3859165, 2.554729, 0, 0.509804, 1, 1,
0.1802913, 1.441018, -0.6873025, 0, 0.5019608, 1, 1,
0.1820958, -0.8769983, 2.049685, 0, 0.4941176, 1, 1,
0.1821827, 1.262729, 1.8011, 0, 0.4901961, 1, 1,
0.1885047, -0.2420143, 2.48055, 0, 0.4823529, 1, 1,
0.19288, -0.724159, 2.16381, 0, 0.4784314, 1, 1,
0.1933792, -0.1261241, 2.747497, 0, 0.4705882, 1, 1,
0.195614, 1.046709, 2.75058, 0, 0.4666667, 1, 1,
0.1963255, -0.2921966, 2.794166, 0, 0.4588235, 1, 1,
0.1966679, -1.531356, 2.776363, 0, 0.454902, 1, 1,
0.1976463, -0.7699743, 1.49719, 0, 0.4470588, 1, 1,
0.2022263, 0.4972865, -0.4450629, 0, 0.4431373, 1, 1,
0.2026697, 0.3893342, -0.5525949, 0, 0.4352941, 1, 1,
0.2133269, -0.3020153, 2.591569, 0, 0.4313726, 1, 1,
0.2152645, -0.1118936, 0.8093763, 0, 0.4235294, 1, 1,
0.2158275, 0.2245564, 0.2492506, 0, 0.4196078, 1, 1,
0.2172897, 0.1714396, 1.932771, 0, 0.4117647, 1, 1,
0.2235649, 1.967282, 1.248657, 0, 0.4078431, 1, 1,
0.2274355, -0.6151224, 4.234483, 0, 0.4, 1, 1,
0.2313566, 0.4390353, 0.4254241, 0, 0.3921569, 1, 1,
0.2345553, 0.7929935, -0.2793585, 0, 0.3882353, 1, 1,
0.2390809, -0.009002002, 0.008500482, 0, 0.3803922, 1, 1,
0.2408949, 1.038338, -0.4028923, 0, 0.3764706, 1, 1,
0.2441291, 0.9339924, -1.138844, 0, 0.3686275, 1, 1,
0.247641, 0.6611445, 1.900202, 0, 0.3647059, 1, 1,
0.2575552, 1.437884, 0.3720887, 0, 0.3568628, 1, 1,
0.2583355, -0.0891443, 4.209091, 0, 0.3529412, 1, 1,
0.2630692, -0.3782559, 2.296287, 0, 0.345098, 1, 1,
0.2642877, -0.8303056, 2.038358, 0, 0.3411765, 1, 1,
0.2652586, 0.3060613, 0.8902825, 0, 0.3333333, 1, 1,
0.2709426, -0.4956838, 1.667226, 0, 0.3294118, 1, 1,
0.2745132, 0.242102, -0.0462565, 0, 0.3215686, 1, 1,
0.2810137, -0.08798214, 2.126695, 0, 0.3176471, 1, 1,
0.2824984, 0.7888246, -0.958706, 0, 0.3098039, 1, 1,
0.2835551, -1.327314, 2.376121, 0, 0.3058824, 1, 1,
0.2881236, 0.7097023, -0.7509675, 0, 0.2980392, 1, 1,
0.2909347, -1.351093, 1.381892, 0, 0.2901961, 1, 1,
0.2920334, 0.3059453, 1.670486, 0, 0.2862745, 1, 1,
0.2927971, -0.03313164, 1.995497, 0, 0.2784314, 1, 1,
0.2976527, 0.8159643, 1.703683, 0, 0.2745098, 1, 1,
0.300817, -0.6785703, 2.693244, 0, 0.2666667, 1, 1,
0.3019097, 0.7008033, -1.487586, 0, 0.2627451, 1, 1,
0.3025499, 0.8591846, -1.315282, 0, 0.254902, 1, 1,
0.3063035, -1.302957, 3.029052, 0, 0.2509804, 1, 1,
0.3075742, -0.4880191, 2.632219, 0, 0.2431373, 1, 1,
0.3093376, -2.055801, 3.626621, 0, 0.2392157, 1, 1,
0.3139389, -0.2958522, 2.723338, 0, 0.2313726, 1, 1,
0.3162157, -3.166805, 2.331161, 0, 0.227451, 1, 1,
0.3196068, -0.5156828, 2.993724, 0, 0.2196078, 1, 1,
0.3258953, -0.8740869, 2.975605, 0, 0.2156863, 1, 1,
0.3259436, 0.9140159, -0.868403, 0, 0.2078431, 1, 1,
0.3344457, -1.082276, 3.689326, 0, 0.2039216, 1, 1,
0.3351178, 0.09965157, 0.6662961, 0, 0.1960784, 1, 1,
0.33659, -0.6544675, 2.495302, 0, 0.1882353, 1, 1,
0.3404696, -0.01541687, 1.317852, 0, 0.1843137, 1, 1,
0.3487402, -0.4175639, 4.188304, 0, 0.1764706, 1, 1,
0.3513133, -1.58326, 2.894958, 0, 0.172549, 1, 1,
0.353026, 1.096926, 1.286434, 0, 0.1647059, 1, 1,
0.3534267, -0.263156, 1.264796, 0, 0.1607843, 1, 1,
0.3574707, -1.121172, 5.711629, 0, 0.1529412, 1, 1,
0.3593072, -1.604919, 3.358107, 0, 0.1490196, 1, 1,
0.3601085, -0.9334185, 3.486255, 0, 0.1411765, 1, 1,
0.3619724, -0.01896149, 1.955353, 0, 0.1372549, 1, 1,
0.3636675, 0.01261673, 1.495875, 0, 0.1294118, 1, 1,
0.3675303, 0.6272035, 0.5719934, 0, 0.1254902, 1, 1,
0.3679152, 0.01078062, 2.350664, 0, 0.1176471, 1, 1,
0.3720678, -1.590973, 5.158311, 0, 0.1137255, 1, 1,
0.3742721, 0.1314261, 1.832301, 0, 0.1058824, 1, 1,
0.3769641, 0.4253671, 0.3745862, 0, 0.09803922, 1, 1,
0.3773587, -0.7105916, 4.307165, 0, 0.09411765, 1, 1,
0.3786064, -0.3578168, 2.207019, 0, 0.08627451, 1, 1,
0.3804708, 0.1356197, 0.4608133, 0, 0.08235294, 1, 1,
0.3830909, -0.630345, 2.325078, 0, 0.07450981, 1, 1,
0.3848384, 0.8835011, 0.4240362, 0, 0.07058824, 1, 1,
0.3875539, 1.087384, -1.255078, 0, 0.0627451, 1, 1,
0.3880872, -1.829658, 3.012657, 0, 0.05882353, 1, 1,
0.3918008, 0.08865063, -0.349739, 0, 0.05098039, 1, 1,
0.3922192, 0.6581898, 1.753847, 0, 0.04705882, 1, 1,
0.3927655, 0.5493117, -0.840737, 0, 0.03921569, 1, 1,
0.400531, 1.586547, 1.310179, 0, 0.03529412, 1, 1,
0.4006568, 1.017629, 0.3538242, 0, 0.02745098, 1, 1,
0.4064761, -1.399585, 2.174593, 0, 0.02352941, 1, 1,
0.4081915, 2.370381, 0.6337701, 0, 0.01568628, 1, 1,
0.4127355, 0.2856975, 0.921548, 0, 0.01176471, 1, 1,
0.4133461, 1.62982, 0.6645374, 0, 0.003921569, 1, 1,
0.4157, -0.4350694, 2.462064, 0.003921569, 0, 1, 1,
0.4158916, -0.2660204, 3.263696, 0.007843138, 0, 1, 1,
0.4162111, -0.635507, 3.737628, 0.01568628, 0, 1, 1,
0.4230404, -1.032725, 2.126613, 0.01960784, 0, 1, 1,
0.4239441, 0.7132882, 1.103327, 0.02745098, 0, 1, 1,
0.4243207, 1.453957, 0.1800685, 0.03137255, 0, 1, 1,
0.4262944, 0.3386144, 1.479351, 0.03921569, 0, 1, 1,
0.4263403, 0.6627057, 0.6756537, 0.04313726, 0, 1, 1,
0.4294438, 0.1261377, -0.6667172, 0.05098039, 0, 1, 1,
0.4305159, -1.247615, 3.289904, 0.05490196, 0, 1, 1,
0.4315266, -1.104789, 1.893474, 0.0627451, 0, 1, 1,
0.4337332, -0.3931333, 2.625821, 0.06666667, 0, 1, 1,
0.441388, 2.28687, 0.8965305, 0.07450981, 0, 1, 1,
0.4440473, -1.112759, 3.504343, 0.07843138, 0, 1, 1,
0.4462651, -0.2427739, 2.117274, 0.08627451, 0, 1, 1,
0.4466417, 0.7019715, 1.045677, 0.09019608, 0, 1, 1,
0.4474014, -1.698007, 3.357193, 0.09803922, 0, 1, 1,
0.4494963, -1.006721, 2.596546, 0.1058824, 0, 1, 1,
0.4549255, -1.648522, 1.024249, 0.1098039, 0, 1, 1,
0.4598533, -0.2914083, 1.339869, 0.1176471, 0, 1, 1,
0.4623625, -1.485028, -0.07113709, 0.1215686, 0, 1, 1,
0.4691373, -0.4006382, 1.24298, 0.1294118, 0, 1, 1,
0.4695701, -0.4368026, 0.08736935, 0.1333333, 0, 1, 1,
0.4714144, -0.1021144, 1.543621, 0.1411765, 0, 1, 1,
0.4738293, -0.02788023, 4.818461, 0.145098, 0, 1, 1,
0.4750537, 0.8873187, 0.1119483, 0.1529412, 0, 1, 1,
0.4760392, 1.651325, 0.3902281, 0.1568628, 0, 1, 1,
0.4823176, 1.567861, 0.2611306, 0.1647059, 0, 1, 1,
0.4842156, -0.6636897, 2.509317, 0.1686275, 0, 1, 1,
0.4848056, 0.4053554, 2.683594, 0.1764706, 0, 1, 1,
0.4903108, 0.6212586, 0.1671207, 0.1803922, 0, 1, 1,
0.4943658, 1.228779, 0.6419142, 0.1882353, 0, 1, 1,
0.4969582, 1.1168, 0.1174916, 0.1921569, 0, 1, 1,
0.4985715, -0.7535058, 2.721917, 0.2, 0, 1, 1,
0.4988616, -0.2708957, 2.575928, 0.2078431, 0, 1, 1,
0.5012795, 0.3823227, 1.952383, 0.2117647, 0, 1, 1,
0.5018108, 0.349303, 1.555384, 0.2196078, 0, 1, 1,
0.504771, -0.9588993, 3.240304, 0.2235294, 0, 1, 1,
0.5061028, 0.1349186, 1.01173, 0.2313726, 0, 1, 1,
0.5096533, -0.17334, 0.3786415, 0.2352941, 0, 1, 1,
0.5147948, -2.604047, 4.420126, 0.2431373, 0, 1, 1,
0.5149875, 1.680943, 1.11703, 0.2470588, 0, 1, 1,
0.5163158, -1.577418, 3.530357, 0.254902, 0, 1, 1,
0.5167, 0.2598171, 2.008399, 0.2588235, 0, 1, 1,
0.5183706, 1.332635, -0.003120335, 0.2666667, 0, 1, 1,
0.5210391, -1.397768, 4.776453, 0.2705882, 0, 1, 1,
0.5229404, 0.5486229, -0.1987987, 0.2784314, 0, 1, 1,
0.5288112, 0.1190835, 1.610857, 0.282353, 0, 1, 1,
0.5301595, -0.8342369, 3.520374, 0.2901961, 0, 1, 1,
0.5308297, -1.269388, 2.451722, 0.2941177, 0, 1, 1,
0.5318865, -0.6496593, 5.295139, 0.3019608, 0, 1, 1,
0.5324587, 1.280992, -0.112944, 0.3098039, 0, 1, 1,
0.5413157, 1.293275, -0.7215218, 0.3137255, 0, 1, 1,
0.5460044, 1.027236, -0.01607766, 0.3215686, 0, 1, 1,
0.5462515, -0.3575941, 3.710575, 0.3254902, 0, 1, 1,
0.5550764, -0.2165019, 0.9419987, 0.3333333, 0, 1, 1,
0.5565979, -1.067521, 2.622336, 0.3372549, 0, 1, 1,
0.5580406, 0.5939394, 1.559927, 0.345098, 0, 1, 1,
0.5588554, -0.6339101, 2.07036, 0.3490196, 0, 1, 1,
0.5593838, -0.6038381, 2.920183, 0.3568628, 0, 1, 1,
0.5630764, -0.3950664, 2.323759, 0.3607843, 0, 1, 1,
0.5640776, -1.170092, 0.8272249, 0.3686275, 0, 1, 1,
0.5707148, -1.183296, 1.984113, 0.372549, 0, 1, 1,
0.5739163, -0.1714212, 2.771737, 0.3803922, 0, 1, 1,
0.573919, -0.3116286, 2.530315, 0.3843137, 0, 1, 1,
0.5753011, -0.8295901, 2.076532, 0.3921569, 0, 1, 1,
0.5831116, -0.636104, 1.404062, 0.3960784, 0, 1, 1,
0.5894446, 0.3509211, -0.7106431, 0.4039216, 0, 1, 1,
0.5897887, -0.5531486, 0.8866458, 0.4117647, 0, 1, 1,
0.5903889, 0.3023823, 0.8187013, 0.4156863, 0, 1, 1,
0.6016033, -0.3651299, 3.762396, 0.4235294, 0, 1, 1,
0.6064332, -1.304767, 2.854386, 0.427451, 0, 1, 1,
0.6069524, 1.589702, 2.71997, 0.4352941, 0, 1, 1,
0.609814, -0.7009631, 4.066309, 0.4392157, 0, 1, 1,
0.6112532, -0.7662551, 1.398161, 0.4470588, 0, 1, 1,
0.6137726, 1.324475, 1.045159, 0.4509804, 0, 1, 1,
0.6151257, -1.007169, 2.828613, 0.4588235, 0, 1, 1,
0.6190416, -0.08344755, 3.334528, 0.4627451, 0, 1, 1,
0.6213542, 1.017042, 0.4496992, 0.4705882, 0, 1, 1,
0.6233926, 0.5025217, 1.483701, 0.4745098, 0, 1, 1,
0.6243114, -1.134952, 1.231631, 0.4823529, 0, 1, 1,
0.63107, 1.01914, 1.112333, 0.4862745, 0, 1, 1,
0.6400989, -0.6141462, 1.726817, 0.4941176, 0, 1, 1,
0.6416642, -0.2326198, 1.031519, 0.5019608, 0, 1, 1,
0.6466125, 0.6491503, 0.3031515, 0.5058824, 0, 1, 1,
0.6562212, 0.5520179, -0.2872517, 0.5137255, 0, 1, 1,
0.6580139, 0.4702613, -1.463892, 0.5176471, 0, 1, 1,
0.6592686, 2.456294, 0.8557312, 0.5254902, 0, 1, 1,
0.6624816, 1.824047, 2.602882, 0.5294118, 0, 1, 1,
0.6634207, -0.326768, 1.263205, 0.5372549, 0, 1, 1,
0.6636037, -1.355427, 5.052421, 0.5411765, 0, 1, 1,
0.6691598, 0.5834312, 1.312643, 0.5490196, 0, 1, 1,
0.6692309, 0.9187558, 0.09857929, 0.5529412, 0, 1, 1,
0.6692626, 0.1665704, 1.381698, 0.5607843, 0, 1, 1,
0.6741659, 0.2313607, 0.8122411, 0.5647059, 0, 1, 1,
0.679692, 1.681448, -0.2002036, 0.572549, 0, 1, 1,
0.680744, -0.8374909, 2.11709, 0.5764706, 0, 1, 1,
0.6816295, 1.761355, -0.3583044, 0.5843138, 0, 1, 1,
0.6920965, -0.5975125, 3.99868, 0.5882353, 0, 1, 1,
0.6963784, -0.3017205, 2.662571, 0.5960785, 0, 1, 1,
0.6973718, -0.3763446, 1.405115, 0.6039216, 0, 1, 1,
0.6986424, -0.9100643, 2.548873, 0.6078432, 0, 1, 1,
0.6998562, -2.281532, 3.60133, 0.6156863, 0, 1, 1,
0.7041696, -0.9942908, 2.807072, 0.6196079, 0, 1, 1,
0.7041765, -1.541067, 3.500839, 0.627451, 0, 1, 1,
0.7048388, 0.2396748, 0.7231801, 0.6313726, 0, 1, 1,
0.7084539, 1.103031, 2.089082, 0.6392157, 0, 1, 1,
0.715286, 0.2025722, 1.065314, 0.6431373, 0, 1, 1,
0.7171568, 1.125413, -0.5964056, 0.6509804, 0, 1, 1,
0.7289842, -0.1345853, 2.328029, 0.654902, 0, 1, 1,
0.7291159, -0.9486449, 3.269655, 0.6627451, 0, 1, 1,
0.7297981, 0.7304465, 0.9281942, 0.6666667, 0, 1, 1,
0.7322053, 1.039033, 1.982587, 0.6745098, 0, 1, 1,
0.7365971, 0.4644506, 0.01031072, 0.6784314, 0, 1, 1,
0.7374756, -0.1637782, 1.328217, 0.6862745, 0, 1, 1,
0.7394312, -1.500383, 3.61453, 0.6901961, 0, 1, 1,
0.7406334, 0.6139327, 0.2319433, 0.6980392, 0, 1, 1,
0.7414208, 1.110188, 1.466747, 0.7058824, 0, 1, 1,
0.7414741, 0.470101, 1.635731, 0.7098039, 0, 1, 1,
0.7531571, -0.5989338, 2.733776, 0.7176471, 0, 1, 1,
0.7545076, 1.14653, -1.379953, 0.7215686, 0, 1, 1,
0.7558388, 0.9547585, 1.095212, 0.7294118, 0, 1, 1,
0.7596325, 1.198077, 0.3288904, 0.7333333, 0, 1, 1,
0.76142, -0.1259259, 2.801421, 0.7411765, 0, 1, 1,
0.7629789, -0.4633628, 3.083967, 0.7450981, 0, 1, 1,
0.7683983, -0.6376138, 1.569335, 0.7529412, 0, 1, 1,
0.7688079, -0.04342941, 0.9044985, 0.7568628, 0, 1, 1,
0.769973, -2.226004, 2.920882, 0.7647059, 0, 1, 1,
0.7785137, -2.168523, 2.595972, 0.7686275, 0, 1, 1,
0.7813904, 1.552465, 0.6330351, 0.7764706, 0, 1, 1,
0.7830322, 0.1517782, 0.1754417, 0.7803922, 0, 1, 1,
0.7872337, 0.4846918, 0.8275458, 0.7882353, 0, 1, 1,
0.7883337, 1.068008, 0.9492405, 0.7921569, 0, 1, 1,
0.789465, 1.437067, -0.5154887, 0.8, 0, 1, 1,
0.7908748, 2.669691, -0.491062, 0.8078431, 0, 1, 1,
0.8008497, -0.7800412, 3.815694, 0.8117647, 0, 1, 1,
0.8026587, 1.644034, -0.4544979, 0.8196079, 0, 1, 1,
0.8040645, 0.4339256, 2.310321, 0.8235294, 0, 1, 1,
0.8045096, 0.6897445, 0.8635857, 0.8313726, 0, 1, 1,
0.8054711, 1.10338, 1.130922, 0.8352941, 0, 1, 1,
0.8070355, 0.3592674, -1.7334, 0.8431373, 0, 1, 1,
0.8080368, -1.521244, 4.473608, 0.8470588, 0, 1, 1,
0.814224, -0.5074276, 2.415178, 0.854902, 0, 1, 1,
0.8210362, -1.162306, 1.637989, 0.8588235, 0, 1, 1,
0.8231442, -0.6258442, 1.866772, 0.8666667, 0, 1, 1,
0.8255647, 0.3088579, 0.8875443, 0.8705882, 0, 1, 1,
0.8295853, -0.01926764, 1.692426, 0.8784314, 0, 1, 1,
0.8367217, -0.3862081, 2.422702, 0.8823529, 0, 1, 1,
0.8380201, 1.115185, 0.8479307, 0.8901961, 0, 1, 1,
0.8419003, -1.872462, 2.744752, 0.8941177, 0, 1, 1,
0.8447613, 1.817633, -0.6578162, 0.9019608, 0, 1, 1,
0.8473737, 0.1014183, 2.346135, 0.9098039, 0, 1, 1,
0.8481447, -0.4515243, 1.875826, 0.9137255, 0, 1, 1,
0.8501233, -0.8079957, 3.005952, 0.9215686, 0, 1, 1,
0.8599533, 1.144519, -1.060581, 0.9254902, 0, 1, 1,
0.8600661, 0.6113802, -0.0131225, 0.9333333, 0, 1, 1,
0.8608425, 0.1263289, 1.847052, 0.9372549, 0, 1, 1,
0.8625452, -0.1529327, 1.264293, 0.945098, 0, 1, 1,
0.866612, 0.2178286, 1.750646, 0.9490196, 0, 1, 1,
0.8735403, 1.003111, 3.133807, 0.9568627, 0, 1, 1,
0.8847566, 1.299475, -0.9180807, 0.9607843, 0, 1, 1,
0.8851119, 0.3283368, 0.6483622, 0.9686275, 0, 1, 1,
0.8889869, -0.9614578, 3.394618, 0.972549, 0, 1, 1,
0.8958125, 1.062744, -0.01961223, 0.9803922, 0, 1, 1,
0.89947, -1.41738, 3.144485, 0.9843137, 0, 1, 1,
0.9054346, 1.067476, 1.09349, 0.9921569, 0, 1, 1,
0.9057494, -0.553162, 1.213247, 0.9960784, 0, 1, 1,
0.9062749, -1.049172, 2.75286, 1, 0, 0.9960784, 1,
0.9063361, -1.2116, 3.567134, 1, 0, 0.9882353, 1,
0.9128079, -1.736533, 2.519181, 1, 0, 0.9843137, 1,
0.9151237, 0.7773852, 0.02943888, 1, 0, 0.9764706, 1,
0.9152279, -0.2060997, 1.732849, 1, 0, 0.972549, 1,
0.9154369, 0.1297442, -0.03909527, 1, 0, 0.9647059, 1,
0.9172974, -0.6103142, 1.614154, 1, 0, 0.9607843, 1,
0.9193252, 0.08701916, 1.008415, 1, 0, 0.9529412, 1,
0.928637, 0.1497519, 0.09732305, 1, 0, 0.9490196, 1,
0.9352565, 0.8772189, 1.534984, 1, 0, 0.9411765, 1,
0.9388981, -2.765887, 3.589042, 1, 0, 0.9372549, 1,
0.9438837, -0.2200633, 2.227948, 1, 0, 0.9294118, 1,
0.9449694, 0.643457, -0.715699, 1, 0, 0.9254902, 1,
0.96195, 1.655988, 1.954121, 1, 0, 0.9176471, 1,
0.9674623, -1.384232, 2.96677, 1, 0, 0.9137255, 1,
0.9686101, -1.642534, 1.197852, 1, 0, 0.9058824, 1,
0.9693487, 0.6506453, 0.3441226, 1, 0, 0.9019608, 1,
0.9706454, -0.6511853, -0.06215048, 1, 0, 0.8941177, 1,
0.9730588, 0.4337747, 2.393152, 1, 0, 0.8862745, 1,
0.9749276, 0.2481177, 0.4904003, 1, 0, 0.8823529, 1,
0.9761716, -0.3634413, 3.238999, 1, 0, 0.8745098, 1,
0.9784802, -0.5709504, 2.753399, 1, 0, 0.8705882, 1,
0.9795141, 1.005475, -0.7692761, 1, 0, 0.8627451, 1,
0.9889424, 0.3488521, 0.9206123, 1, 0, 0.8588235, 1,
0.9922336, -2.534084, 2.519044, 1, 0, 0.8509804, 1,
1.009131, 0.2589645, 0.7664819, 1, 0, 0.8470588, 1,
1.011016, -2.087527, 1.913852, 1, 0, 0.8392157, 1,
1.017123, 1.392884, 2.297242, 1, 0, 0.8352941, 1,
1.017723, 1.796729, 0.8697402, 1, 0, 0.827451, 1,
1.019245, -1.531352, 3.00793, 1, 0, 0.8235294, 1,
1.020366, -1.361399, 0.3713433, 1, 0, 0.8156863, 1,
1.032235, 0.3112049, 0.8886833, 1, 0, 0.8117647, 1,
1.032884, -1.421947, 2.162983, 1, 0, 0.8039216, 1,
1.037644, 0.9519283, 2.060052, 1, 0, 0.7960784, 1,
1.038296, -0.2295796, 1.128503, 1, 0, 0.7921569, 1,
1.041738, 0.6402666, -0.3118516, 1, 0, 0.7843137, 1,
1.057005, 0.5579608, 1.054971, 1, 0, 0.7803922, 1,
1.058579, 0.5225611, 0.08124431, 1, 0, 0.772549, 1,
1.06562, 1.185423, 1.496872, 1, 0, 0.7686275, 1,
1.067164, 0.5213516, 0.8036433, 1, 0, 0.7607843, 1,
1.06985, -2.179712, 4.768746, 1, 0, 0.7568628, 1,
1.073601, 1.585388, -0.5710627, 1, 0, 0.7490196, 1,
1.074368, 0.5555119, 0.9856963, 1, 0, 0.7450981, 1,
1.076266, 1.260223, -1.046375, 1, 0, 0.7372549, 1,
1.090731, 0.2171483, 3.496694, 1, 0, 0.7333333, 1,
1.092524, -2.052391, 3.814236, 1, 0, 0.7254902, 1,
1.10205, -0.5707329, 1.681568, 1, 0, 0.7215686, 1,
1.105022, 1.126228, 1.964267, 1, 0, 0.7137255, 1,
1.10765, 0.7650549, 2.449197, 1, 0, 0.7098039, 1,
1.113361, 0.05507412, 1.138691, 1, 0, 0.7019608, 1,
1.119284, -0.2387418, 1.931697, 1, 0, 0.6941177, 1,
1.11943, -0.8848961, 2.554053, 1, 0, 0.6901961, 1,
1.120458, 0.1760669, 0.6851122, 1, 0, 0.682353, 1,
1.122728, -0.873658, 4.201249, 1, 0, 0.6784314, 1,
1.124423, 0.7056077, 0.7575471, 1, 0, 0.6705883, 1,
1.125421, -0.4387683, 2.465111, 1, 0, 0.6666667, 1,
1.125598, -0.8299267, 2.898584, 1, 0, 0.6588235, 1,
1.146534, 0.1680292, 1.269217, 1, 0, 0.654902, 1,
1.160267, -0.7188289, 4.013787, 1, 0, 0.6470588, 1,
1.160897, 0.266814, 2.065913, 1, 0, 0.6431373, 1,
1.163069, -0.466013, 1.269366, 1, 0, 0.6352941, 1,
1.168231, 1.512506, -0.7329739, 1, 0, 0.6313726, 1,
1.169798, -0.5659509, 3.109428, 1, 0, 0.6235294, 1,
1.174865, 0.9744777, 0.7210845, 1, 0, 0.6196079, 1,
1.176486, 1.67113, 1.245461, 1, 0, 0.6117647, 1,
1.180844, 0.009400468, 0.8890471, 1, 0, 0.6078432, 1,
1.18293, 1.377052, 0.1622654, 1, 0, 0.6, 1,
1.193727, 0.7999677, -0.3829831, 1, 0, 0.5921569, 1,
1.195004, 0.8201496, 1.662208, 1, 0, 0.5882353, 1,
1.197753, -0.1873855, 1.284385, 1, 0, 0.5803922, 1,
1.198437, -1.362655, 3.405317, 1, 0, 0.5764706, 1,
1.206641, 0.917418, 1.461086, 1, 0, 0.5686275, 1,
1.21012, -0.7890064, 1.644591, 1, 0, 0.5647059, 1,
1.217728, -0.1388345, 3.936437, 1, 0, 0.5568628, 1,
1.224006, -2.004548, 2.825457, 1, 0, 0.5529412, 1,
1.228416, 0.4110662, -0.2736375, 1, 0, 0.5450981, 1,
1.237474, -1.345983, 2.024139, 1, 0, 0.5411765, 1,
1.253722, -0.04846555, 1.823593, 1, 0, 0.5333334, 1,
1.262582, 0.8718559, 1.837954, 1, 0, 0.5294118, 1,
1.269112, -0.6797618, 2.158298, 1, 0, 0.5215687, 1,
1.271583, 1.12277, -0.3021671, 1, 0, 0.5176471, 1,
1.285068, 0.01944419, 1.137876, 1, 0, 0.509804, 1,
1.290181, -1.894767, 2.329599, 1, 0, 0.5058824, 1,
1.295362, -0.2535712, -0.2044067, 1, 0, 0.4980392, 1,
1.303562, 2.026251, -0.1297404, 1, 0, 0.4901961, 1,
1.305728, 1.673133, 1.782105, 1, 0, 0.4862745, 1,
1.334131, 1.236498, 1.245096, 1, 0, 0.4784314, 1,
1.335845, -0.3728313, 2.723171, 1, 0, 0.4745098, 1,
1.339323, 0.2932675, 3.341106, 1, 0, 0.4666667, 1,
1.3511, 1.715217, 0.2682767, 1, 0, 0.4627451, 1,
1.353315, -0.1138274, -0.5420318, 1, 0, 0.454902, 1,
1.388162, 0.5193734, 0.2664255, 1, 0, 0.4509804, 1,
1.394534, 0.7327027, 0.5202911, 1, 0, 0.4431373, 1,
1.405077, -1.110214, 0.734078, 1, 0, 0.4392157, 1,
1.407268, -0.3377776, 2.072141, 1, 0, 0.4313726, 1,
1.41317, 1.929026, -0.3060026, 1, 0, 0.427451, 1,
1.42721, -0.3689822, 2.216831, 1, 0, 0.4196078, 1,
1.433798, 1.175816, 1.620016, 1, 0, 0.4156863, 1,
1.440371, 0.6951134, 2.174472, 1, 0, 0.4078431, 1,
1.440717, -2.642174, 2.29326, 1, 0, 0.4039216, 1,
1.442849, 1.276783, 0.1423238, 1, 0, 0.3960784, 1,
1.458786, 1.830817, 2.602062, 1, 0, 0.3882353, 1,
1.465097, 0.7319731, 1.728121, 1, 0, 0.3843137, 1,
1.467709, 0.08051821, 0.02227218, 1, 0, 0.3764706, 1,
1.477918, -0.8944641, 2.951256, 1, 0, 0.372549, 1,
1.478414, 0.3709441, 2.360862, 1, 0, 0.3647059, 1,
1.481382, -1.204037, 3.340678, 1, 0, 0.3607843, 1,
1.4922, 0.1701093, 0.1191984, 1, 0, 0.3529412, 1,
1.500024, -1.09923, 1.22703, 1, 0, 0.3490196, 1,
1.517751, -2.382268, 0.7708734, 1, 0, 0.3411765, 1,
1.537284, -0.65977, 0.9902242, 1, 0, 0.3372549, 1,
1.538658, 0.4332065, 0.9849088, 1, 0, 0.3294118, 1,
1.539059, -1.732168, 1.631944, 1, 0, 0.3254902, 1,
1.539828, 1.258019, 0.7559654, 1, 0, 0.3176471, 1,
1.553056, 0.5973262, 0.7404244, 1, 0, 0.3137255, 1,
1.553814, -1.023316, 1.289096, 1, 0, 0.3058824, 1,
1.554993, -0.2398145, 1.453829, 1, 0, 0.2980392, 1,
1.559979, 0.3899562, 0.2194516, 1, 0, 0.2941177, 1,
1.570456, -0.2096868, 0.8664419, 1, 0, 0.2862745, 1,
1.606902, -1.153736, 0.4611324, 1, 0, 0.282353, 1,
1.607227, 1.735494, 1.105246, 1, 0, 0.2745098, 1,
1.614242, -1.914626, 1.599775, 1, 0, 0.2705882, 1,
1.623455, 1.259507, 1.04548, 1, 0, 0.2627451, 1,
1.628974, 0.9518521, 2.553759, 1, 0, 0.2588235, 1,
1.631026, -0.4566646, 1.735579, 1, 0, 0.2509804, 1,
1.638305, -0.03363901, 0.7086408, 1, 0, 0.2470588, 1,
1.643963, 0.8857917, 1.291572, 1, 0, 0.2392157, 1,
1.650461, 0.562983, 2.075982, 1, 0, 0.2352941, 1,
1.658983, -1.296584, 1.376841, 1, 0, 0.227451, 1,
1.660358, 1.00421, 0.4546908, 1, 0, 0.2235294, 1,
1.66241, 0.8963567, 2.321275, 1, 0, 0.2156863, 1,
1.671769, 0.04420025, 2.297644, 1, 0, 0.2117647, 1,
1.69235, -0.2037763, 2.532207, 1, 0, 0.2039216, 1,
1.731605, -0.5464919, 1.733676, 1, 0, 0.1960784, 1,
1.779483, -0.3077438, 2.863196, 1, 0, 0.1921569, 1,
1.788112, -1.134457, 3.29569, 1, 0, 0.1843137, 1,
1.790315, 0.1529028, 1.54556, 1, 0, 0.1803922, 1,
1.816563, 1.145386, 1.801674, 1, 0, 0.172549, 1,
1.831565, -0.3117505, 1.936139, 1, 0, 0.1686275, 1,
1.838482, -0.3471803, 1.412678, 1, 0, 0.1607843, 1,
1.891956, -0.2829876, 1.712788, 1, 0, 0.1568628, 1,
1.902626, -1.895098, 2.801366, 1, 0, 0.1490196, 1,
1.909744, 0.1267156, 2.989861, 1, 0, 0.145098, 1,
1.971292, -0.3043871, 3.392451, 1, 0, 0.1372549, 1,
2.03009, 0.4079011, 2.751099, 1, 0, 0.1333333, 1,
2.041847, -0.6377324, 2.415237, 1, 0, 0.1254902, 1,
2.095675, -0.5067045, 2.227145, 1, 0, 0.1215686, 1,
2.111297, -0.06594492, 2.991149, 1, 0, 0.1137255, 1,
2.142967, 0.1232105, 0.6324453, 1, 0, 0.1098039, 1,
2.17929, -0.322289, -0.1776595, 1, 0, 0.1019608, 1,
2.245821, -0.4349364, 0.8286132, 1, 0, 0.09411765, 1,
2.279355, 0.03094859, 0.7696605, 1, 0, 0.09019608, 1,
2.288397, -0.4435206, 0.5883493, 1, 0, 0.08235294, 1,
2.301471, 0.1321844, -0.5760267, 1, 0, 0.07843138, 1,
2.33353, 2.324516, 1.304134, 1, 0, 0.07058824, 1,
2.335486, 0.05460658, 1.227701, 1, 0, 0.06666667, 1,
2.377227, -1.332567, 3.480437, 1, 0, 0.05882353, 1,
2.387409, 0.01203548, 1.52079, 1, 0, 0.05490196, 1,
2.406896, -0.4314964, 1.22346, 1, 0, 0.04705882, 1,
2.413936, -0.1946727, 0.2850743, 1, 0, 0.04313726, 1,
2.420903, 1.023172, 0.2129219, 1, 0, 0.03529412, 1,
2.617374, 1.705526, 0.578424, 1, 0, 0.03137255, 1,
2.674905, -0.2976002, 0.006761122, 1, 0, 0.02352941, 1,
2.685557, -0.2216108, 3.332823, 1, 0, 0.01960784, 1,
3.107606, 0.4282708, 1.090492, 1, 0, 0.01176471, 1,
3.165215, 1.139565, 0.7051089, 1, 0, 0.007843138, 1
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
-0.2462901, -4.258607, -7.068973, 0, -0.5, 0.5, 0.5,
-0.2462901, -4.258607, -7.068973, 1, -0.5, 0.5, 0.5,
-0.2462901, -4.258607, -7.068973, 1, 1.5, 0.5, 0.5,
-0.2462901, -4.258607, -7.068973, 0, 1.5, 0.5, 0.5
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
-4.814296, 0.05385029, -7.068973, 0, -0.5, 0.5, 0.5,
-4.814296, 0.05385029, -7.068973, 1, -0.5, 0.5, 0.5,
-4.814296, 0.05385029, -7.068973, 1, 1.5, 0.5, 0.5,
-4.814296, 0.05385029, -7.068973, 0, 1.5, 0.5, 0.5
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
-4.814296, -4.258607, 0.2474983, 0, -0.5, 0.5, 0.5,
-4.814296, -4.258607, 0.2474983, 1, -0.5, 0.5, 0.5,
-4.814296, -4.258607, 0.2474983, 1, 1.5, 0.5, 0.5,
-4.814296, -4.258607, 0.2474983, 0, 1.5, 0.5, 0.5
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
-3, -3.263425, -5.380556,
3, -3.263425, -5.380556,
-3, -3.263425, -5.380556,
-3, -3.429288, -5.661959,
-2, -3.263425, -5.380556,
-2, -3.429288, -5.661959,
-1, -3.263425, -5.380556,
-1, -3.429288, -5.661959,
0, -3.263425, -5.380556,
0, -3.429288, -5.661959,
1, -3.263425, -5.380556,
1, -3.429288, -5.661959,
2, -3.263425, -5.380556,
2, -3.429288, -5.661959,
3, -3.263425, -5.380556,
3, -3.429288, -5.661959
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
-3, -3.761016, -6.224764, 0, -0.5, 0.5, 0.5,
-3, -3.761016, -6.224764, 1, -0.5, 0.5, 0.5,
-3, -3.761016, -6.224764, 1, 1.5, 0.5, 0.5,
-3, -3.761016, -6.224764, 0, 1.5, 0.5, 0.5,
-2, -3.761016, -6.224764, 0, -0.5, 0.5, 0.5,
-2, -3.761016, -6.224764, 1, -0.5, 0.5, 0.5,
-2, -3.761016, -6.224764, 1, 1.5, 0.5, 0.5,
-2, -3.761016, -6.224764, 0, 1.5, 0.5, 0.5,
-1, -3.761016, -6.224764, 0, -0.5, 0.5, 0.5,
-1, -3.761016, -6.224764, 1, -0.5, 0.5, 0.5,
-1, -3.761016, -6.224764, 1, 1.5, 0.5, 0.5,
-1, -3.761016, -6.224764, 0, 1.5, 0.5, 0.5,
0, -3.761016, -6.224764, 0, -0.5, 0.5, 0.5,
0, -3.761016, -6.224764, 1, -0.5, 0.5, 0.5,
0, -3.761016, -6.224764, 1, 1.5, 0.5, 0.5,
0, -3.761016, -6.224764, 0, 1.5, 0.5, 0.5,
1, -3.761016, -6.224764, 0, -0.5, 0.5, 0.5,
1, -3.761016, -6.224764, 1, -0.5, 0.5, 0.5,
1, -3.761016, -6.224764, 1, 1.5, 0.5, 0.5,
1, -3.761016, -6.224764, 0, 1.5, 0.5, 0.5,
2, -3.761016, -6.224764, 0, -0.5, 0.5, 0.5,
2, -3.761016, -6.224764, 1, -0.5, 0.5, 0.5,
2, -3.761016, -6.224764, 1, 1.5, 0.5, 0.5,
2, -3.761016, -6.224764, 0, 1.5, 0.5, 0.5,
3, -3.761016, -6.224764, 0, -0.5, 0.5, 0.5,
3, -3.761016, -6.224764, 1, -0.5, 0.5, 0.5,
3, -3.761016, -6.224764, 1, 1.5, 0.5, 0.5,
3, -3.761016, -6.224764, 0, 1.5, 0.5, 0.5
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
-3.760141, -3, -5.380556,
-3.760141, 3, -5.380556,
-3.760141, -3, -5.380556,
-3.935833, -3, -5.661959,
-3.760141, -2, -5.380556,
-3.935833, -2, -5.661959,
-3.760141, -1, -5.380556,
-3.935833, -1, -5.661959,
-3.760141, 0, -5.380556,
-3.935833, 0, -5.661959,
-3.760141, 1, -5.380556,
-3.935833, 1, -5.661959,
-3.760141, 2, -5.380556,
-3.935833, 2, -5.661959,
-3.760141, 3, -5.380556,
-3.935833, 3, -5.661959
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
-4.287219, -3, -6.224764, 0, -0.5, 0.5, 0.5,
-4.287219, -3, -6.224764, 1, -0.5, 0.5, 0.5,
-4.287219, -3, -6.224764, 1, 1.5, 0.5, 0.5,
-4.287219, -3, -6.224764, 0, 1.5, 0.5, 0.5,
-4.287219, -2, -6.224764, 0, -0.5, 0.5, 0.5,
-4.287219, -2, -6.224764, 1, -0.5, 0.5, 0.5,
-4.287219, -2, -6.224764, 1, 1.5, 0.5, 0.5,
-4.287219, -2, -6.224764, 0, 1.5, 0.5, 0.5,
-4.287219, -1, -6.224764, 0, -0.5, 0.5, 0.5,
-4.287219, -1, -6.224764, 1, -0.5, 0.5, 0.5,
-4.287219, -1, -6.224764, 1, 1.5, 0.5, 0.5,
-4.287219, -1, -6.224764, 0, 1.5, 0.5, 0.5,
-4.287219, 0, -6.224764, 0, -0.5, 0.5, 0.5,
-4.287219, 0, -6.224764, 1, -0.5, 0.5, 0.5,
-4.287219, 0, -6.224764, 1, 1.5, 0.5, 0.5,
-4.287219, 0, -6.224764, 0, 1.5, 0.5, 0.5,
-4.287219, 1, -6.224764, 0, -0.5, 0.5, 0.5,
-4.287219, 1, -6.224764, 1, -0.5, 0.5, 0.5,
-4.287219, 1, -6.224764, 1, 1.5, 0.5, 0.5,
-4.287219, 1, -6.224764, 0, 1.5, 0.5, 0.5,
-4.287219, 2, -6.224764, 0, -0.5, 0.5, 0.5,
-4.287219, 2, -6.224764, 1, -0.5, 0.5, 0.5,
-4.287219, 2, -6.224764, 1, 1.5, 0.5, 0.5,
-4.287219, 2, -6.224764, 0, 1.5, 0.5, 0.5,
-4.287219, 3, -6.224764, 0, -0.5, 0.5, 0.5,
-4.287219, 3, -6.224764, 1, -0.5, 0.5, 0.5,
-4.287219, 3, -6.224764, 1, 1.5, 0.5, 0.5,
-4.287219, 3, -6.224764, 0, 1.5, 0.5, 0.5
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
-3.760141, -3.263425, -4,
-3.760141, -3.263425, 4,
-3.760141, -3.263425, -4,
-3.935833, -3.429288, -4,
-3.760141, -3.263425, -2,
-3.935833, -3.429288, -2,
-3.760141, -3.263425, 0,
-3.935833, -3.429288, 0,
-3.760141, -3.263425, 2,
-3.935833, -3.429288, 2,
-3.760141, -3.263425, 4,
-3.935833, -3.429288, 4
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
-4.287219, -3.761016, -4, 0, -0.5, 0.5, 0.5,
-4.287219, -3.761016, -4, 1, -0.5, 0.5, 0.5,
-4.287219, -3.761016, -4, 1, 1.5, 0.5, 0.5,
-4.287219, -3.761016, -4, 0, 1.5, 0.5, 0.5,
-4.287219, -3.761016, -2, 0, -0.5, 0.5, 0.5,
-4.287219, -3.761016, -2, 1, -0.5, 0.5, 0.5,
-4.287219, -3.761016, -2, 1, 1.5, 0.5, 0.5,
-4.287219, -3.761016, -2, 0, 1.5, 0.5, 0.5,
-4.287219, -3.761016, 0, 0, -0.5, 0.5, 0.5,
-4.287219, -3.761016, 0, 1, -0.5, 0.5, 0.5,
-4.287219, -3.761016, 0, 1, 1.5, 0.5, 0.5,
-4.287219, -3.761016, 0, 0, 1.5, 0.5, 0.5,
-4.287219, -3.761016, 2, 0, -0.5, 0.5, 0.5,
-4.287219, -3.761016, 2, 1, -0.5, 0.5, 0.5,
-4.287219, -3.761016, 2, 1, 1.5, 0.5, 0.5,
-4.287219, -3.761016, 2, 0, 1.5, 0.5, 0.5,
-4.287219, -3.761016, 4, 0, -0.5, 0.5, 0.5,
-4.287219, -3.761016, 4, 1, -0.5, 0.5, 0.5,
-4.287219, -3.761016, 4, 1, 1.5, 0.5, 0.5,
-4.287219, -3.761016, 4, 0, 1.5, 0.5, 0.5
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
-3.760141, -3.263425, -5.380556,
-3.760141, 3.371125, -5.380556,
-3.760141, -3.263425, 5.875553,
-3.760141, 3.371125, 5.875553,
-3.760141, -3.263425, -5.380556,
-3.760141, -3.263425, 5.875553,
-3.760141, 3.371125, -5.380556,
-3.760141, 3.371125, 5.875553,
-3.760141, -3.263425, -5.380556,
3.267561, -3.263425, -5.380556,
-3.760141, -3.263425, 5.875553,
3.267561, -3.263425, 5.875553,
-3.760141, 3.371125, -5.380556,
3.267561, 3.371125, -5.380556,
-3.760141, 3.371125, 5.875553,
3.267561, 3.371125, 5.875553,
3.267561, -3.263425, -5.380556,
3.267561, 3.371125, -5.380556,
3.267561, -3.263425, 5.875553,
3.267561, 3.371125, 5.875553,
3.267561, -3.263425, -5.380556,
3.267561, -3.263425, 5.875553,
3.267561, 3.371125, -5.380556,
3.267561, 3.371125, 5.875553
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
var radius = 7.922117;
var distance = 35.24639;
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
mvMatrix.translate( 0.2462901, -0.05385029, -0.2474983 );
mvMatrix.scale( 1.218826, 1.291052, 0.7609688 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.24639);
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
dimethomorph<-read.table("dimethomorph.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-dimethomorph$V2
```

```
## Error in eval(expr, envir, enclos): object 'dimethomorph' not found
```

```r
y<-dimethomorph$V3
```

```
## Error in eval(expr, envir, enclos): object 'dimethomorph' not found
```

```r
z<-dimethomorph$V4
```

```
## Error in eval(expr, envir, enclos): object 'dimethomorph' not found
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
-3.657796, 1.980212, -1.755432, 0, 0, 1, 1, 1,
-3.447643, 0.7309439, -0.6396204, 1, 0, 0, 1, 1,
-2.606307, 1.054007, -0.5250015, 1, 0, 0, 1, 1,
-2.586254, 0.6313694, -0.8856971, 1, 0, 0, 1, 1,
-2.455553, 0.3718483, 0.1725162, 1, 0, 0, 1, 1,
-2.422821, -0.6400154, -2.363907, 1, 0, 0, 1, 1,
-2.399627, 1.023617, -0.5474721, 0, 0, 0, 1, 1,
-2.369069, -0.7088815, -2.328087, 0, 0, 0, 1, 1,
-2.316853, -0.6138948, -0.5822025, 0, 0, 0, 1, 1,
-2.265087, -0.05873641, -2.383897, 0, 0, 0, 1, 1,
-2.259022, 2.021403, -0.9124417, 0, 0, 0, 1, 1,
-2.254729, 0.0192442, -2.230647, 0, 0, 0, 1, 1,
-2.25466, 0.9949654, -2.139889, 0, 0, 0, 1, 1,
-2.225056, 0.9702271, -0.7992486, 1, 1, 1, 1, 1,
-2.194292, 0.5230256, -0.8201901, 1, 1, 1, 1, 1,
-2.149711, 0.4248525, -0.8768069, 1, 1, 1, 1, 1,
-2.137749, -0.3110633, -2.512714, 1, 1, 1, 1, 1,
-2.095827, 0.9879769, -3.99235, 1, 1, 1, 1, 1,
-2.059151, 1.793671, -2.300304, 1, 1, 1, 1, 1,
-2.038243, 1.458926, -0.94745, 1, 1, 1, 1, 1,
-2.016143, 1.695552, -1.931584, 1, 1, 1, 1, 1,
-2.003808, -1.999706, -2.245777, 1, 1, 1, 1, 1,
-2.003328, 0.4086352, 0.06149749, 1, 1, 1, 1, 1,
-1.986472, 1.455804, -1.344248, 1, 1, 1, 1, 1,
-1.981185, -0.6204179, -2.672236, 1, 1, 1, 1, 1,
-1.980162, -0.7544016, -3.481268, 1, 1, 1, 1, 1,
-1.972892, 1.645432, -0.8959607, 1, 1, 1, 1, 1,
-1.965228, -0.4293168, -2.676037, 1, 1, 1, 1, 1,
-1.956967, -0.6068501, -1.379703, 0, 0, 1, 1, 1,
-1.927287, 1.557968, -2.357897, 1, 0, 0, 1, 1,
-1.911323, -1.043766, -2.601991, 1, 0, 0, 1, 1,
-1.905635, -0.4102408, -2.833592, 1, 0, 0, 1, 1,
-1.899007, 0.05452667, -1.06293, 1, 0, 0, 1, 1,
-1.890484, -0.6621574, -2.137627, 1, 0, 0, 1, 1,
-1.883607, -0.4488466, -5.216632, 0, 0, 0, 1, 1,
-1.882749, 0.04379017, -1.630762, 0, 0, 0, 1, 1,
-1.867526, 0.4673271, -1.31523, 0, 0, 0, 1, 1,
-1.859939, -0.6807266, -3.046855, 0, 0, 0, 1, 1,
-1.8588, -0.2566533, -1.998923, 0, 0, 0, 1, 1,
-1.847598, 0.223844, -3.025027, 0, 0, 0, 1, 1,
-1.83726, 0.4835231, -0.963814, 0, 0, 0, 1, 1,
-1.834943, 0.6711257, -2.001053, 1, 1, 1, 1, 1,
-1.833455, -0.2576923, -1.198831, 1, 1, 1, 1, 1,
-1.825735, 0.9423578, 0.5602006, 1, 1, 1, 1, 1,
-1.810313, 0.1794442, -1.174204, 1, 1, 1, 1, 1,
-1.808461, -0.8049336, -2.575572, 1, 1, 1, 1, 1,
-1.790865, 0.731679, -1.2208, 1, 1, 1, 1, 1,
-1.778827, 1.191171, 0.01911801, 1, 1, 1, 1, 1,
-1.77842, 0.6657777, -1.099325, 1, 1, 1, 1, 1,
-1.76928, -0.3666666, 0.006566341, 1, 1, 1, 1, 1,
-1.752355, -0.2288587, -3.143022, 1, 1, 1, 1, 1,
-1.725217, 1.692251, -1.924404, 1, 1, 1, 1, 1,
-1.722565, -0.4135002, -0.04568174, 1, 1, 1, 1, 1,
-1.718464, -1.268018, -2.425902, 1, 1, 1, 1, 1,
-1.705518, -1.61904, -1.785082, 1, 1, 1, 1, 1,
-1.705461, 0.1557883, -1.729439, 1, 1, 1, 1, 1,
-1.694528, -1.70047, -1.775052, 0, 0, 1, 1, 1,
-1.688612, 0.6465694, -2.658332, 1, 0, 0, 1, 1,
-1.654777, 1.97334, 0.2116428, 1, 0, 0, 1, 1,
-1.653337, -2.367023, -2.015674, 1, 0, 0, 1, 1,
-1.648404, -0.4359711, -0.3379107, 1, 0, 0, 1, 1,
-1.625897, 0.6219169, -1.302374, 1, 0, 0, 1, 1,
-1.603874, -0.2486569, -0.5832224, 0, 0, 0, 1, 1,
-1.602457, 0.680201, -0.4019741, 0, 0, 0, 1, 1,
-1.590193, -1.045491, -4.184026, 0, 0, 0, 1, 1,
-1.587806, -0.07351214, 0.9076543, 0, 0, 0, 1, 1,
-1.584388, -0.2298581, -2.822129, 0, 0, 0, 1, 1,
-1.562588, 0.8419065, -0.5318292, 0, 0, 0, 1, 1,
-1.559724, -0.4089643, -1.892319, 0, 0, 0, 1, 1,
-1.541182, -0.4624428, -1.852108, 1, 1, 1, 1, 1,
-1.535105, -0.2772814, -2.816153, 1, 1, 1, 1, 1,
-1.528611, 1.750936, 0.3967857, 1, 1, 1, 1, 1,
-1.525919, 1.192952, -0.8461844, 1, 1, 1, 1, 1,
-1.523346, -0.9868228, -2.766598, 1, 1, 1, 1, 1,
-1.522601, 0.2307617, -1.517562, 1, 1, 1, 1, 1,
-1.514532, 0.1889996, -1.910252, 1, 1, 1, 1, 1,
-1.509856, -1.202408, -1.727255, 1, 1, 1, 1, 1,
-1.508711, 0.698108, -3.488777, 1, 1, 1, 1, 1,
-1.505924, -0.0113998, -2.576565, 1, 1, 1, 1, 1,
-1.505106, 1.080416, 0.3360439, 1, 1, 1, 1, 1,
-1.503312, -1.45438, -2.414868, 1, 1, 1, 1, 1,
-1.489667, -1.93544, -1.779528, 1, 1, 1, 1, 1,
-1.485515, 0.3871775, -1.017509, 1, 1, 1, 1, 1,
-1.443494, -0.5930452, -2.980207, 1, 1, 1, 1, 1,
-1.443382, 0.2369048, 0.6381372, 0, 0, 1, 1, 1,
-1.422363, -0.728815, -2.605317, 1, 0, 0, 1, 1,
-1.407596, 0.3370958, 0.7965105, 1, 0, 0, 1, 1,
-1.40334, 1.152094, -1.006065, 1, 0, 0, 1, 1,
-1.403261, -1.409002, -2.024427, 1, 0, 0, 1, 1,
-1.400084, -0.5282468, -3.571301, 1, 0, 0, 1, 1,
-1.39819, 0.8423783, -1.787577, 0, 0, 0, 1, 1,
-1.395636, 0.2450126, -0.7729694, 0, 0, 0, 1, 1,
-1.388707, -1.533086, -2.698704, 0, 0, 0, 1, 1,
-1.387416, -0.4672866, -1.020993, 0, 0, 0, 1, 1,
-1.361485, 0.8526561, 0.1079492, 0, 0, 0, 1, 1,
-1.361236, 0.9300517, -1.763573, 0, 0, 0, 1, 1,
-1.351938, 0.2455304, -0.03536732, 0, 0, 0, 1, 1,
-1.340557, -0.2158696, -2.015699, 1, 1, 1, 1, 1,
-1.336327, 0.8588057, -1.184979, 1, 1, 1, 1, 1,
-1.324427, -0.6859799, -0.7093766, 1, 1, 1, 1, 1,
-1.32243, 0.3707185, 0.3931677, 1, 1, 1, 1, 1,
-1.321269, 0.9092051, -0.9593009, 1, 1, 1, 1, 1,
-1.316754, -0.9584091, -3.239077, 1, 1, 1, 1, 1,
-1.314076, 0.5086846, -1.575524, 1, 1, 1, 1, 1,
-1.310967, -3.061061, -2.156791, 1, 1, 1, 1, 1,
-1.295993, 1.454268, -1.100079, 1, 1, 1, 1, 1,
-1.293817, 0.0353047, -0.6653229, 1, 1, 1, 1, 1,
-1.283836, 0.66361, -1.930823, 1, 1, 1, 1, 1,
-1.279513, -0.4514701, -0.5370401, 1, 1, 1, 1, 1,
-1.278627, 0.5050091, -1.161891, 1, 1, 1, 1, 1,
-1.278028, -0.9432562, -4.018532, 1, 1, 1, 1, 1,
-1.271078, 0.7852989, -1.080505, 1, 1, 1, 1, 1,
-1.265073, 0.4648156, -0.6012164, 0, 0, 1, 1, 1,
-1.25929, 2.135465, -1.593817, 1, 0, 0, 1, 1,
-1.258491, 0.9425499, -1.125965, 1, 0, 0, 1, 1,
-1.256938, 0.6774775, -1.223772, 1, 0, 0, 1, 1,
-1.256481, 0.1969166, -1.623942, 1, 0, 0, 1, 1,
-1.256469, -2.646871, -3.405704, 1, 0, 0, 1, 1,
-1.256316, -0.5006235, 0.09172235, 0, 0, 0, 1, 1,
-1.250146, -0.07807757, -2.25126, 0, 0, 0, 1, 1,
-1.24234, -0.7370712, -1.335846, 0, 0, 0, 1, 1,
-1.236842, 2.302259, -0.04759734, 0, 0, 0, 1, 1,
-1.235655, -1.295312, -4.206754, 0, 0, 0, 1, 1,
-1.231691, -2.392905, -1.886833, 0, 0, 0, 1, 1,
-1.223677, 0.03340654, -2.884739, 0, 0, 0, 1, 1,
-1.223163, 0.3866496, -0.9258166, 1, 1, 1, 1, 1,
-1.219223, 0.8156295, -2.487341, 1, 1, 1, 1, 1,
-1.215782, -0.4499185, -2.440455, 1, 1, 1, 1, 1,
-1.21377, 0.5015342, -1.657737, 1, 1, 1, 1, 1,
-1.209727, -1.615508, -4.620682, 1, 1, 1, 1, 1,
-1.205686, 0.04199946, -0.7298859, 1, 1, 1, 1, 1,
-1.205616, 0.5368022, -1.20009, 1, 1, 1, 1, 1,
-1.193637, -1.075043, -1.302205, 1, 1, 1, 1, 1,
-1.189193, -1.000524, -1.976995, 1, 1, 1, 1, 1,
-1.188924, -0.0813943, -1.019978, 1, 1, 1, 1, 1,
-1.187333, -1.269815, -4.149805, 1, 1, 1, 1, 1,
-1.181272, -0.3613906, -2.131631, 1, 1, 1, 1, 1,
-1.175251, -1.425314, -1.047449, 1, 1, 1, 1, 1,
-1.167587, 0.1927944, -0.9134359, 1, 1, 1, 1, 1,
-1.160368, -0.1476262, -1.593336, 1, 1, 1, 1, 1,
-1.156913, -0.7726927, -1.002955, 0, 0, 1, 1, 1,
-1.151084, 0.2151436, 1.504732, 1, 0, 0, 1, 1,
-1.144992, -0.1140072, -2.009249, 1, 0, 0, 1, 1,
-1.140326, 0.8220472, -3.28286, 1, 0, 0, 1, 1,
-1.131141, -0.5971635, -2.217964, 1, 0, 0, 1, 1,
-1.12974, 0.5150371, -0.7200403, 1, 0, 0, 1, 1,
-1.123373, -0.01002114, -1.578196, 0, 0, 0, 1, 1,
-1.119876, -0.9010922, -1.561759, 0, 0, 0, 1, 1,
-1.11528, 1.056599, -1.490411, 0, 0, 0, 1, 1,
-1.114797, -2.065997, -3.006102, 0, 0, 0, 1, 1,
-1.110455, -0.5811932, -2.793329, 0, 0, 0, 1, 1,
-1.104443, -1.196974, -2.192083, 0, 0, 0, 1, 1,
-1.1044, -0.05021108, -1.67864, 0, 0, 0, 1, 1,
-1.103051, -0.6562428, -2.029776, 1, 1, 1, 1, 1,
-1.10216, 0.9112555, -1.159877, 1, 1, 1, 1, 1,
-1.101083, 0.01593503, -1.603595, 1, 1, 1, 1, 1,
-1.092371, 0.3421354, -0.7947114, 1, 1, 1, 1, 1,
-1.085244, -0.2127165, -3.853758, 1, 1, 1, 1, 1,
-1.083625, -0.3212217, -2.801849, 1, 1, 1, 1, 1,
-1.074585, -0.8125771, -2.39584, 1, 1, 1, 1, 1,
-1.066412, -2.46821, -2.036014, 1, 1, 1, 1, 1,
-1.058708, -0.6173296, -3.566226, 1, 1, 1, 1, 1,
-1.053047, -0.9939705, -2.723084, 1, 1, 1, 1, 1,
-1.043874, 1.126729, 1.244219, 1, 1, 1, 1, 1,
-1.04252, -1.198932, -2.962227, 1, 1, 1, 1, 1,
-1.033779, 0.3358709, -0.01359473, 1, 1, 1, 1, 1,
-1.032507, 0.9474485, -0.687555, 1, 1, 1, 1, 1,
-1.031614, 1.367442, 1.345714, 1, 1, 1, 1, 1,
-1.025874, -0.3955183, -2.758348, 0, 0, 1, 1, 1,
-1.021879, 1.253278, 0.007772268, 1, 0, 0, 1, 1,
-1.00267, 0.9737079, -1.36499, 1, 0, 0, 1, 1,
-1.001229, 1.054477, -0.8525379, 1, 0, 0, 1, 1,
-1.001092, 0.8383062, 0.686191, 1, 0, 0, 1, 1,
-0.9984799, 0.854387, 0.03391563, 1, 0, 0, 1, 1,
-0.9977523, 0.5400555, -2.306721, 0, 0, 0, 1, 1,
-0.9973989, 1.71691, 0.7105199, 0, 0, 0, 1, 1,
-0.9829564, -0.2727011, -2.43538, 0, 0, 0, 1, 1,
-0.9811289, -0.5107458, -3.385971, 0, 0, 0, 1, 1,
-0.9740008, 2.276385, -1.998332, 0, 0, 0, 1, 1,
-0.9735738, -0.5382681, -2.40252, 0, 0, 0, 1, 1,
-0.9717127, -0.7767197, -3.465878, 0, 0, 0, 1, 1,
-0.9686339, 0.2986061, -3.001012, 1, 1, 1, 1, 1,
-0.9678057, 0.7554101, -2.280126, 1, 1, 1, 1, 1,
-0.9599903, -0.6305228, -1.430284, 1, 1, 1, 1, 1,
-0.9594162, -0.9091049, -3.283314, 1, 1, 1, 1, 1,
-0.9579175, 0.8490781, -1.238081, 1, 1, 1, 1, 1,
-0.9492363, 1.192037, -0.3364516, 1, 1, 1, 1, 1,
-0.9472178, 0.7755368, -0.7782644, 1, 1, 1, 1, 1,
-0.9370909, -0.2512457, -0.7176988, 1, 1, 1, 1, 1,
-0.9368535, -1.072729, -3.774704, 1, 1, 1, 1, 1,
-0.9294339, 1.406991, -2.299353, 1, 1, 1, 1, 1,
-0.9252942, 0.04338435, -0.2829241, 1, 1, 1, 1, 1,
-0.9184166, -0.521385, -0.8580232, 1, 1, 1, 1, 1,
-0.9139344, -1.114771, -2.989176, 1, 1, 1, 1, 1,
-0.9075936, -0.7898961, -2.911623, 1, 1, 1, 1, 1,
-0.9053, 2.087886, -0.04007882, 1, 1, 1, 1, 1,
-0.9008331, -0.6623685, -2.708475, 0, 0, 1, 1, 1,
-0.9005258, 0.276852, -1.538372, 1, 0, 0, 1, 1,
-0.8962327, -1.672005, -2.869043, 1, 0, 0, 1, 1,
-0.8947704, 1.024272, 2.500111, 1, 0, 0, 1, 1,
-0.8802977, 0.6575066, -0.2225255, 1, 0, 0, 1, 1,
-0.8802466, 0.8115209, 0.3163295, 1, 0, 0, 1, 1,
-0.8751178, 0.4907606, -3.007604, 0, 0, 0, 1, 1,
-0.8708684, 0.3392968, -1.528471, 0, 0, 0, 1, 1,
-0.8683134, -1.018138, -1.089383, 0, 0, 0, 1, 1,
-0.8672004, -1.090844, -1.460802, 0, 0, 0, 1, 1,
-0.8623869, 0.5064439, -1.63554, 0, 0, 0, 1, 1,
-0.8574615, 0.4883424, 0.3942033, 0, 0, 0, 1, 1,
-0.8529723, -0.6351684, -3.370808, 0, 0, 0, 1, 1,
-0.83723, 1.35562, -0.8167409, 1, 1, 1, 1, 1,
-0.8347456, -1.855133, -2.970638, 1, 1, 1, 1, 1,
-0.8341973, 0.1383365, -1.026144, 1, 1, 1, 1, 1,
-0.8299153, 0.5556268, 0.3293956, 1, 1, 1, 1, 1,
-0.8229637, 1.022752, -0.7955476, 1, 1, 1, 1, 1,
-0.8157279, 0.09689488, -1.076397, 1, 1, 1, 1, 1,
-0.8085431, -0.9250115, -0.4099356, 1, 1, 1, 1, 1,
-0.807677, 1.174713, -1.80995, 1, 1, 1, 1, 1,
-0.8075171, 1.19805, -0.07269675, 1, 1, 1, 1, 1,
-0.8057823, -0.9050217, -2.691715, 1, 1, 1, 1, 1,
-0.8009061, 1.415526, 0.7467549, 1, 1, 1, 1, 1,
-0.8002468, -0.2098055, -1.933467, 1, 1, 1, 1, 1,
-0.7905319, 1.125054, -0.29976, 1, 1, 1, 1, 1,
-0.7846177, 0.6532621, -0.2965698, 1, 1, 1, 1, 1,
-0.7820892, -0.1359049, -3.260531, 1, 1, 1, 1, 1,
-0.7801169, -0.2412865, -2.227533, 0, 0, 1, 1, 1,
-0.7792879, -1.371586, -1.394269, 1, 0, 0, 1, 1,
-0.7779418, -0.26576, -1.884784, 1, 0, 0, 1, 1,
-0.7740422, -1.151862, -3.102427, 1, 0, 0, 1, 1,
-0.7704195, 1.23435, -0.7162895, 1, 0, 0, 1, 1,
-0.7627478, -0.9949294, -2.176534, 1, 0, 0, 1, 1,
-0.7618865, 1.237679, -1.489797, 0, 0, 0, 1, 1,
-0.7588163, -0.5643401, -0.5112631, 0, 0, 0, 1, 1,
-0.7495723, 0.4369336, -1.329078, 0, 0, 0, 1, 1,
-0.7485726, -0.3851664, -0.1302244, 0, 0, 0, 1, 1,
-0.7425044, -0.4088847, -0.8948041, 0, 0, 0, 1, 1,
-0.7409327, -1.146646, -3.938208, 0, 0, 0, 1, 1,
-0.7408963, -1.255354, -4.124289, 0, 0, 0, 1, 1,
-0.7377635, -0.4230388, -2.235712, 1, 1, 1, 1, 1,
-0.7351703, -0.345458, -3.418776, 1, 1, 1, 1, 1,
-0.7296332, 0.4917073, 0.3318468, 1, 1, 1, 1, 1,
-0.7291088, -1.841114, -2.683882, 1, 1, 1, 1, 1,
-0.7283101, -0.132358, -2.608173, 1, 1, 1, 1, 1,
-0.7276981, 0.1313534, -1.198659, 1, 1, 1, 1, 1,
-0.723691, -1.147503, -2.287024, 1, 1, 1, 1, 1,
-0.7204996, 0.39026, -1.630999, 1, 1, 1, 1, 1,
-0.7203744, 0.8914818, -1.392224, 1, 1, 1, 1, 1,
-0.7175359, -0.4887499, -3.5872, 1, 1, 1, 1, 1,
-0.7172147, 1.700702, -0.3076498, 1, 1, 1, 1, 1,
-0.7169865, 0.02225985, -0.6893269, 1, 1, 1, 1, 1,
-0.7128547, -1.513507, -1.961809, 1, 1, 1, 1, 1,
-0.7121282, 0.2035509, -1.473694, 1, 1, 1, 1, 1,
-0.7083659, -0.4317772, -1.154435, 1, 1, 1, 1, 1,
-0.7037233, -0.3091712, -1.480362, 0, 0, 1, 1, 1,
-0.6973806, 0.7029731, -1.391623, 1, 0, 0, 1, 1,
-0.6969217, 1.479903, -0.8016776, 1, 0, 0, 1, 1,
-0.6930975, -0.5912478, -3.378483, 1, 0, 0, 1, 1,
-0.6926869, 0.9451982, -0.04794018, 1, 0, 0, 1, 1,
-0.6919532, -0.1621595, -0.53202, 1, 0, 0, 1, 1,
-0.686525, 0.8123868, 0.08135286, 0, 0, 0, 1, 1,
-0.6857396, -0.6736832, -1.045986, 0, 0, 0, 1, 1,
-0.682148, 0.2655838, -0.463427, 0, 0, 0, 1, 1,
-0.680099, 3.274506, -1.24675, 0, 0, 0, 1, 1,
-0.6775561, -0.8562921, -1.34122, 0, 0, 0, 1, 1,
-0.6743805, -0.9179584, -1.012161, 0, 0, 0, 1, 1,
-0.6734602, 0.8402976, 0.02522968, 0, 0, 0, 1, 1,
-0.6696709, -0.9097928, -1.494889, 1, 1, 1, 1, 1,
-0.6647993, -0.7557324, -1.581058, 1, 1, 1, 1, 1,
-0.6370115, 0.4776599, -1.609591, 1, 1, 1, 1, 1,
-0.6369818, 1.459441, 2.449718, 1, 1, 1, 1, 1,
-0.6359422, 1.58569, 2.251073, 1, 1, 1, 1, 1,
-0.6353167, -0.9842867, -3.913161, 1, 1, 1, 1, 1,
-0.6343896, -0.9844785, -4.629696, 1, 1, 1, 1, 1,
-0.6330538, 1.647832, -1.803412, 1, 1, 1, 1, 1,
-0.6307099, -2.159774, -3.892091, 1, 1, 1, 1, 1,
-0.6290138, -0.8921081, -0.8001417, 1, 1, 1, 1, 1,
-0.6284565, 0.4178582, -1.086319, 1, 1, 1, 1, 1,
-0.6282101, 0.3453135, -0.7563863, 1, 1, 1, 1, 1,
-0.6220652, -0.2246862, -2.352236, 1, 1, 1, 1, 1,
-0.6203923, -1.466531, -2.996453, 1, 1, 1, 1, 1,
-0.6196396, 0.6992199, -1.585583, 1, 1, 1, 1, 1,
-0.6182297, -0.086165, -2.19292, 0, 0, 1, 1, 1,
-0.6135972, -1.051285, -3.566483, 1, 0, 0, 1, 1,
-0.6097286, 0.2387146, 1.157969, 1, 0, 0, 1, 1,
-0.6070665, 1.151037, -0.6097535, 1, 0, 0, 1, 1,
-0.6056347, 1.234287, 0.1505191, 1, 0, 0, 1, 1,
-0.604103, 2.012108, 0.1587615, 1, 0, 0, 1, 1,
-0.5989556, 0.6114625, -1.958517, 0, 0, 0, 1, 1,
-0.5984868, 2.05138, 0.3029928, 0, 0, 0, 1, 1,
-0.5941573, -0.8651543, -2.80917, 0, 0, 0, 1, 1,
-0.5903015, 0.2011669, -1.68958, 0, 0, 0, 1, 1,
-0.5876368, 0.2375782, -0.6813211, 0, 0, 0, 1, 1,
-0.5867409, 0.7758412, -1.672441, 0, 0, 0, 1, 1,
-0.5863353, -1.306932, -2.50438, 0, 0, 0, 1, 1,
-0.5752897, -0.6845001, -1.782127, 1, 1, 1, 1, 1,
-0.5750238, -0.2641258, -2.555176, 1, 1, 1, 1, 1,
-0.5733302, -0.5308759, -3.571412, 1, 1, 1, 1, 1,
-0.5731152, -0.4749481, -2.271004, 1, 1, 1, 1, 1,
-0.5696499, -0.6311177, -1.174555, 1, 1, 1, 1, 1,
-0.5674991, 0.527018, -0.2785503, 1, 1, 1, 1, 1,
-0.5605863, -0.04960638, 0.4949136, 1, 1, 1, 1, 1,
-0.5575839, 0.2279552, -0.7357766, 1, 1, 1, 1, 1,
-0.5571734, 0.7378765, -1.264103, 1, 1, 1, 1, 1,
-0.5568227, -0.8780674, -3.586829, 1, 1, 1, 1, 1,
-0.5567616, 0.8062469, 3.134308, 1, 1, 1, 1, 1,
-0.5560281, -0.3779427, -3.691298, 1, 1, 1, 1, 1,
-0.5535911, -0.7201861, -2.12989, 1, 1, 1, 1, 1,
-0.5531399, -0.254764, -2.501446, 1, 1, 1, 1, 1,
-0.5518867, -0.5562599, -1.939064, 1, 1, 1, 1, 1,
-0.5507193, 0.4902799, -1.183035, 0, 0, 1, 1, 1,
-0.5451111, -1.615648, -1.124002, 1, 0, 0, 1, 1,
-0.5388739, 1.392836, 0.3458813, 1, 0, 0, 1, 1,
-0.5371669, -1.557878, -2.943596, 1, 0, 0, 1, 1,
-0.529691, 0.6518385, -0.8305946, 1, 0, 0, 1, 1,
-0.5291825, 0.7040331, -1.056836, 1, 0, 0, 1, 1,
-0.5274789, -0.5270005, -0.3007376, 0, 0, 0, 1, 1,
-0.5272941, -0.3993234, -1.994557, 0, 0, 0, 1, 1,
-0.5272482, 0.7340239, 2.115418, 0, 0, 0, 1, 1,
-0.5248301, 0.9244053, -0.9306868, 0, 0, 0, 1, 1,
-0.5138392, -0.9367374, -2.215481, 0, 0, 0, 1, 1,
-0.4977684, 1.451641, 0.6829408, 0, 0, 0, 1, 1,
-0.4907573, 0.7904584, -1.471055, 0, 0, 0, 1, 1,
-0.4891804, 1.60903, 2.149822, 1, 1, 1, 1, 1,
-0.4837233, 0.9331657, -1.353611, 1, 1, 1, 1, 1,
-0.4832776, -0.6869062, -2.916967, 1, 1, 1, 1, 1,
-0.4784692, 0.1825761, -1.740552, 1, 1, 1, 1, 1,
-0.4770134, 0.2353612, -0.4790471, 1, 1, 1, 1, 1,
-0.4702747, 0.04198624, -1.156451, 1, 1, 1, 1, 1,
-0.4701135, 0.8897678, 0.1438445, 1, 1, 1, 1, 1,
-0.4686448, -1.713268, -2.895573, 1, 1, 1, 1, 1,
-0.4643347, -0.06794321, -3.4354, 1, 1, 1, 1, 1,
-0.4636777, 1.060924, -0.9674489, 1, 1, 1, 1, 1,
-0.4582689, 1.243697, 1.538237, 1, 1, 1, 1, 1,
-0.4563755, -0.8896989, -2.507319, 1, 1, 1, 1, 1,
-0.4556053, -0.3117468, -2.941784, 1, 1, 1, 1, 1,
-0.4544395, 2.086666, -2.43576, 1, 1, 1, 1, 1,
-0.4536321, -0.5088905, -0.5917276, 1, 1, 1, 1, 1,
-0.4510639, -0.8369709, -0.8346508, 0, 0, 1, 1, 1,
-0.4507523, 0.6246672, -0.1026029, 1, 0, 0, 1, 1,
-0.4480675, 0.8269511, 1.694646, 1, 0, 0, 1, 1,
-0.4432051, -0.66363, -3.59599, 1, 0, 0, 1, 1,
-0.4400315, 1.454409, -0.2341454, 1, 0, 0, 1, 1,
-0.4330733, -0.03871779, -3.527252, 1, 0, 0, 1, 1,
-0.4312883, 0.7847369, 0.3543887, 0, 0, 0, 1, 1,
-0.4307117, 0.78647, -1.120711, 0, 0, 0, 1, 1,
-0.4304432, 1.05373, 0.3353962, 0, 0, 0, 1, 1,
-0.4295193, -1.05988, -2.789251, 0, 0, 0, 1, 1,
-0.4282365, 0.9580835, -1.532208, 0, 0, 0, 1, 1,
-0.4277927, 0.7975432, -0.06863791, 0, 0, 0, 1, 1,
-0.4255605, -0.8653668, -1.047249, 0, 0, 0, 1, 1,
-0.4253024, 0.6059105, -0.05627223, 1, 1, 1, 1, 1,
-0.424429, 1.522289, -1.179478, 1, 1, 1, 1, 1,
-0.4224665, 0.9324094, -0.7705259, 1, 1, 1, 1, 1,
-0.4180938, -0.8931934, -3.040085, 1, 1, 1, 1, 1,
-0.4172719, 0.5758107, -0.9482049, 1, 1, 1, 1, 1,
-0.4151415, 0.01315247, -0.6113554, 1, 1, 1, 1, 1,
-0.413466, -0.4815382, -4.565509, 1, 1, 1, 1, 1,
-0.413443, 1.093568, -0.3906814, 1, 1, 1, 1, 1,
-0.4115404, -1.094581, -2.68732, 1, 1, 1, 1, 1,
-0.4058535, 0.3266546, 0.4141719, 1, 1, 1, 1, 1,
-0.4055738, -0.7527589, -3.329313, 1, 1, 1, 1, 1,
-0.4054406, 0.5686902, -1.222261, 1, 1, 1, 1, 1,
-0.404485, -0.06213015, -1.698032, 1, 1, 1, 1, 1,
-0.4017153, -1.204852, -2.222091, 1, 1, 1, 1, 1,
-0.4009995, 0.3100412, 0.4659738, 1, 1, 1, 1, 1,
-0.3987775, -0.5824702, -3.903732, 0, 0, 1, 1, 1,
-0.3953438, -0.9331895, -0.5762197, 1, 0, 0, 1, 1,
-0.39352, 1.514255, 0.3873952, 1, 0, 0, 1, 1,
-0.3836577, 0.5056594, -0.1528357, 1, 0, 0, 1, 1,
-0.3832236, -0.5835432, -2.480703, 1, 0, 0, 1, 1,
-0.3824031, -1.735038, -2.83209, 1, 0, 0, 1, 1,
-0.3814943, 0.8624584, 0.3240866, 0, 0, 0, 1, 1,
-0.3810461, 0.5611577, -0.8876251, 0, 0, 0, 1, 1,
-0.3773238, -1.701416, -4.926373, 0, 0, 0, 1, 1,
-0.3751782, 0.7868765, 0.9699355, 0, 0, 0, 1, 1,
-0.3686917, -1.119061, -2.561322, 0, 0, 0, 1, 1,
-0.3652027, 0.4654984, -0.5277142, 0, 0, 0, 1, 1,
-0.3634042, -1.091352, -3.098164, 0, 0, 0, 1, 1,
-0.3550534, 0.09382185, -2.436979, 1, 1, 1, 1, 1,
-0.3544261, -0.1932213, -1.730269, 1, 1, 1, 1, 1,
-0.3544076, -1.122702, -4.715437, 1, 1, 1, 1, 1,
-0.3533341, 1.400758, 0.05202145, 1, 1, 1, 1, 1,
-0.3485741, 0.3932521, -0.1735762, 1, 1, 1, 1, 1,
-0.3465934, -0.2935375, -2.992757, 1, 1, 1, 1, 1,
-0.3465832, 0.6265356, -0.4068165, 1, 1, 1, 1, 1,
-0.3444737, -0.9475729, -2.404082, 1, 1, 1, 1, 1,
-0.342337, 0.3648452, -2.806066, 1, 1, 1, 1, 1,
-0.340652, 0.1096071, -3.050461, 1, 1, 1, 1, 1,
-0.3401904, 0.1432742, 1.937808, 1, 1, 1, 1, 1,
-0.3328505, -0.2822821, -2.174496, 1, 1, 1, 1, 1,
-0.3243347, -0.3175294, -5.115401, 1, 1, 1, 1, 1,
-0.323381, -0.6678124, -4.614651, 1, 1, 1, 1, 1,
-0.3213835, 0.4380539, 0.8477958, 1, 1, 1, 1, 1,
-0.320259, 0.09815885, 0.750209, 0, 0, 1, 1, 1,
-0.3166398, -0.09290905, -2.384827, 1, 0, 0, 1, 1,
-0.3146273, -2.373277, -4.040292, 1, 0, 0, 1, 1,
-0.3131316, 0.2142145, 1.131981, 1, 0, 0, 1, 1,
-0.3099769, 0.4567717, -0.4325728, 1, 0, 0, 1, 1,
-0.3085654, -1.695108, -2.836701, 1, 0, 0, 1, 1,
-0.3012143, -1.58228, -2.91025, 0, 0, 0, 1, 1,
-0.2955741, 1.57255, 0.4261599, 0, 0, 0, 1, 1,
-0.295228, -0.7962282, -2.60982, 0, 0, 0, 1, 1,
-0.2928038, 0.1414213, -3.754303, 0, 0, 0, 1, 1,
-0.2926422, -0.813999, -2.912064, 0, 0, 0, 1, 1,
-0.2912336, 0.3676922, -0.4265563, 0, 0, 0, 1, 1,
-0.2896797, 1.786254, -2.008999, 0, 0, 0, 1, 1,
-0.2862667, -0.8062022, -3.430286, 1, 1, 1, 1, 1,
-0.2858242, 0.180169, -0.7339073, 1, 1, 1, 1, 1,
-0.283051, 1.372607, 0.6776159, 1, 1, 1, 1, 1,
-0.2779638, 0.2962036, -1.641868, 1, 1, 1, 1, 1,
-0.2749841, -0.3752044, -2.312884, 1, 1, 1, 1, 1,
-0.2739185, 0.6768557, -0.3144583, 1, 1, 1, 1, 1,
-0.2723906, -0.08085035, -1.109498, 1, 1, 1, 1, 1,
-0.2720292, 0.910955, -0.7906416, 1, 1, 1, 1, 1,
-0.2709955, -0.4542727, -2.582088, 1, 1, 1, 1, 1,
-0.2693695, -0.1901147, -2.570753, 1, 1, 1, 1, 1,
-0.269355, -1.096808, -4.414449, 1, 1, 1, 1, 1,
-0.2670564, -1.857411, -2.613132, 1, 1, 1, 1, 1,
-0.2635574, 0.7028781, 0.8838483, 1, 1, 1, 1, 1,
-0.2606261, 0.616387, -1.529049, 1, 1, 1, 1, 1,
-0.260431, 0.01223259, -0.3060469, 1, 1, 1, 1, 1,
-0.2599026, -1.776414, -3.262676, 0, 0, 1, 1, 1,
-0.2561742, -1.6612, -2.046649, 1, 0, 0, 1, 1,
-0.2528785, -0.4366886, -3.93897, 1, 0, 0, 1, 1,
-0.2504702, -0.8592145, -2.308739, 1, 0, 0, 1, 1,
-0.2491953, -0.5666498, -3.232524, 1, 0, 0, 1, 1,
-0.2483717, 0.3493037, 0.2150624, 1, 0, 0, 1, 1,
-0.2414242, 0.5621544, -1.503587, 0, 0, 0, 1, 1,
-0.2387791, -0.1493132, -0.7921247, 0, 0, 0, 1, 1,
-0.236581, -2.091647, -2.684418, 0, 0, 0, 1, 1,
-0.233455, -0.5318952, -3.814359, 0, 0, 0, 1, 1,
-0.231184, -1.150828, -5.030719, 0, 0, 0, 1, 1,
-0.2195868, -1.097961, -1.784762, 0, 0, 0, 1, 1,
-0.2177014, -1.01108, -3.902588, 0, 0, 0, 1, 1,
-0.2118965, 1.237439, 1.338268, 1, 1, 1, 1, 1,
-0.2117699, -1.781823, -3.473234, 1, 1, 1, 1, 1,
-0.2108704, 0.8890495, 0.6302565, 1, 1, 1, 1, 1,
-0.2056179, -0.6240182, -3.290214, 1, 1, 1, 1, 1,
-0.2053016, 1.466539, 0.5275708, 1, 1, 1, 1, 1,
-0.2038799, -0.1864402, -1.148334, 1, 1, 1, 1, 1,
-0.2024958, 0.9355538, -0.08815265, 1, 1, 1, 1, 1,
-0.2005871, -1.224997, -4.021743, 1, 1, 1, 1, 1,
-0.2004731, 0.6831763, -0.7476742, 1, 1, 1, 1, 1,
-0.1910482, 0.5825471, 0.8804069, 1, 1, 1, 1, 1,
-0.1887786, -1.14929, -2.173886, 1, 1, 1, 1, 1,
-0.1870853, 0.4885853, -0.1076706, 1, 1, 1, 1, 1,
-0.1836824, 2.482708, 0.9695491, 1, 1, 1, 1, 1,
-0.1831795, -0.6431431, -2.662544, 1, 1, 1, 1, 1,
-0.1824643, 0.3931338, -0.3945477, 1, 1, 1, 1, 1,
-0.1816995, -0.02123432, -0.3051161, 0, 0, 1, 1, 1,
-0.1784073, -0.1942492, -2.071881, 1, 0, 0, 1, 1,
-0.1716149, 0.1307096, -2.71605, 1, 0, 0, 1, 1,
-0.1695224, 0.7780371, 2.149131, 1, 0, 0, 1, 1,
-0.1686035, -0.3926173, -3.286381, 1, 0, 0, 1, 1,
-0.1664376, -0.722365, -2.053943, 1, 0, 0, 1, 1,
-0.1638719, -0.1369867, -0.5645395, 0, 0, 0, 1, 1,
-0.1624247, 0.2663426, -0.7709306, 0, 0, 0, 1, 1,
-0.1619211, 0.8759024, 1.513027, 0, 0, 0, 1, 1,
-0.1607472, 0.3048203, -0.4486338, 0, 0, 0, 1, 1,
-0.1605139, -0.6770576, -4.052725, 0, 0, 0, 1, 1,
-0.1602594, -0.8548451, -1.180468, 0, 0, 0, 1, 1,
-0.1597628, -0.1851829, -1.151722, 0, 0, 0, 1, 1,
-0.1566708, -0.6903233, -4.257423, 1, 1, 1, 1, 1,
-0.1565918, -0.9814384, -2.536444, 1, 1, 1, 1, 1,
-0.1562944, -0.3211444, -1.275916, 1, 1, 1, 1, 1,
-0.1562554, 0.4810796, 1.683459, 1, 1, 1, 1, 1,
-0.1558442, 0.8165221, 0.802521, 1, 1, 1, 1, 1,
-0.1531981, 0.2685641, -0.8608856, 1, 1, 1, 1, 1,
-0.1501327, -0.1405578, -1.762359, 1, 1, 1, 1, 1,
-0.1468592, 1.373627, -0.01522841, 1, 1, 1, 1, 1,
-0.1466279, 0.7061346, 0.7303472, 1, 1, 1, 1, 1,
-0.1437667, 0.7040412, 1.418145, 1, 1, 1, 1, 1,
-0.1431749, -0.2345954, -4.119656, 1, 1, 1, 1, 1,
-0.1248074, -1.532544, -2.079664, 1, 1, 1, 1, 1,
-0.122065, 0.5098947, 0.9300243, 1, 1, 1, 1, 1,
-0.1218347, -0.6456022, -3.653476, 1, 1, 1, 1, 1,
-0.1141715, 1.264216, 0.8781672, 1, 1, 1, 1, 1,
-0.1115021, 2.588648, 0.3499978, 0, 0, 1, 1, 1,
-0.1109251, 0.6035308, 0.8105832, 1, 0, 0, 1, 1,
-0.1101035, -0.9738666, -3.135073, 1, 0, 0, 1, 1,
-0.109617, -0.9849758, -0.4219572, 1, 0, 0, 1, 1,
-0.1077194, 0.07920948, -1.399265, 1, 0, 0, 1, 1,
-0.1067513, -1.243194, -3.350082, 1, 0, 0, 1, 1,
-0.1040882, -0.5919159, -3.603703, 0, 0, 0, 1, 1,
-0.1033092, 0.5332546, -0.3250468, 0, 0, 0, 1, 1,
-0.0991485, 0.1532731, -0.604061, 0, 0, 0, 1, 1,
-0.09591991, 1.35621, -0.1036133, 0, 0, 0, 1, 1,
-0.09182872, -0.01409462, -3.241171, 0, 0, 0, 1, 1,
-0.09041163, 0.3716053, 0.9480382, 0, 0, 0, 1, 1,
-0.08737141, 0.233132, -0.6962586, 0, 0, 0, 1, 1,
-0.08178884, -0.716417, -2.579359, 1, 1, 1, 1, 1,
-0.08048911, -0.2362509, -3.265184, 1, 1, 1, 1, 1,
-0.07809856, 1.252642, 0.4496815, 1, 1, 1, 1, 1,
-0.07587686, -0.3668981, -1.450001, 1, 1, 1, 1, 1,
-0.07445145, 0.6529694, 0.238301, 1, 1, 1, 1, 1,
-0.07153104, 0.9532308, 0.2978802, 1, 1, 1, 1, 1,
-0.07109167, -1.05526, -3.043919, 1, 1, 1, 1, 1,
-0.06476381, 0.0344418, -1.372294, 1, 1, 1, 1, 1,
-0.06229683, 0.538994, -0.06746668, 1, 1, 1, 1, 1,
-0.05971868, 0.9474463, 1.021646, 1, 1, 1, 1, 1,
-0.05901109, -1.255626, -3.97328, 1, 1, 1, 1, 1,
-0.05551811, -0.2577102, -2.565744, 1, 1, 1, 1, 1,
-0.05528932, 0.08835658, -0.2849421, 1, 1, 1, 1, 1,
-0.05435506, -0.8901785, -4.585478, 1, 1, 1, 1, 1,
-0.0481752, 1.608857, 1.354759, 1, 1, 1, 1, 1,
-0.04505428, 0.3538423, -1.295756, 0, 0, 1, 1, 1,
-0.04330504, -0.6762503, -3.726414, 1, 0, 0, 1, 1,
-0.03886689, -0.2791988, -3.673727, 1, 0, 0, 1, 1,
-0.03837774, 0.2294374, 0.9749465, 1, 0, 0, 1, 1,
-0.03534854, 0.0805033, -0.741222, 1, 0, 0, 1, 1,
-0.03469579, -0.1480446, -1.933789, 1, 0, 0, 1, 1,
-0.0303049, 1.193749, 0.1130901, 0, 0, 0, 1, 1,
-0.02731466, -0.5890437, -2.460475, 0, 0, 0, 1, 1,
-0.02721064, 1.232585, -1.867611, 0, 0, 0, 1, 1,
-0.02206806, 1.629134, -1.782602, 0, 0, 0, 1, 1,
-0.0174845, -1.392891, -4.778646, 0, 0, 0, 1, 1,
-0.007943454, -0.6018828, -3.625646, 0, 0, 0, 1, 1,
-0.00377127, -1.479992, -2.906383, 0, 0, 0, 1, 1,
-0.003488102, 1.683417, -1.129352, 1, 1, 1, 1, 1,
-0.001971099, 1.141458, -1.046903, 1, 1, 1, 1, 1,
0.005712024, 0.9936078, 0.02030799, 1, 1, 1, 1, 1,
0.00659701, 0.1537655, -1.250682, 1, 1, 1, 1, 1,
0.01448253, -1.494583, 2.93275, 1, 1, 1, 1, 1,
0.01729379, -0.03239355, 4.011525, 1, 1, 1, 1, 1,
0.02470493, 0.2662541, -0.04110702, 1, 1, 1, 1, 1,
0.02659408, 0.8365806, 0.6442466, 1, 1, 1, 1, 1,
0.02673234, 0.3617631, 0.8627821, 1, 1, 1, 1, 1,
0.02854196, 1.2488, 1.808232, 1, 1, 1, 1, 1,
0.02870458, 0.2960404, 1.025995, 1, 1, 1, 1, 1,
0.03160573, 0.6356117, -0.1836509, 1, 1, 1, 1, 1,
0.03505039, 1.206693, 2.123201, 1, 1, 1, 1, 1,
0.03523355, -1.570679, 2.677504, 1, 1, 1, 1, 1,
0.03681805, 0.689949, -0.248708, 1, 1, 1, 1, 1,
0.03831577, -0.4194348, 3.666503, 0, 0, 1, 1, 1,
0.03945571, 2.277529, 0.4813272, 1, 0, 0, 1, 1,
0.04365604, 0.1974939, -0.1611253, 1, 0, 0, 1, 1,
0.04394371, 0.008077142, 2.609559, 1, 0, 0, 1, 1,
0.04439571, 0.02718624, 0.6236584, 1, 0, 0, 1, 1,
0.05129711, 0.1893796, 0.508701, 1, 0, 0, 1, 1,
0.05257813, -0.07700343, 3.054263, 0, 0, 0, 1, 1,
0.05422819, -0.4804124, 5.231944, 0, 0, 0, 1, 1,
0.05484112, -0.5651612, 3.254024, 0, 0, 0, 1, 1,
0.0554246, 1.090696, 1.723717, 0, 0, 0, 1, 1,
0.05849475, 0.6802735, 2.021968, 0, 0, 0, 1, 1,
0.0630713, 0.0586357, 2.296702, 0, 0, 0, 1, 1,
0.0655541, -0.7769579, 2.447568, 0, 0, 0, 1, 1,
0.06740002, 0.2497332, -0.6556075, 1, 1, 1, 1, 1,
0.06756365, 0.92441, 1.068324, 1, 1, 1, 1, 1,
0.06942312, 0.5639628, 0.4460121, 1, 1, 1, 1, 1,
0.07325943, -0.9225628, 2.225361, 1, 1, 1, 1, 1,
0.07700565, -0.7639003, 3.83321, 1, 1, 1, 1, 1,
0.07929069, -0.1094617, 2.445626, 1, 1, 1, 1, 1,
0.0814839, 0.2331773, -0.2307518, 1, 1, 1, 1, 1,
0.08831818, -0.7421779, 4.30376, 1, 1, 1, 1, 1,
0.09047934, -1.194616, 3.540545, 1, 1, 1, 1, 1,
0.09172966, 1.393388, -0.2111102, 1, 1, 1, 1, 1,
0.0925214, 0.6478409, 1.257309, 1, 1, 1, 1, 1,
0.09282813, -0.420325, 2.946584, 1, 1, 1, 1, 1,
0.09368113, -2.040766, 3.039032, 1, 1, 1, 1, 1,
0.09688447, -1.961134, 4.652064, 1, 1, 1, 1, 1,
0.1054025, -0.9059435, 2.467991, 1, 1, 1, 1, 1,
0.1066814, -1.311249, 3.263604, 0, 0, 1, 1, 1,
0.1082118, -0.6564241, 3.521639, 1, 0, 0, 1, 1,
0.1159954, 0.6504161, -0.5754923, 1, 0, 0, 1, 1,
0.1185161, 0.246489, 0.9212691, 1, 0, 0, 1, 1,
0.1199728, -0.0788909, 1.445112, 1, 0, 0, 1, 1,
0.120676, 1.645723, -1.835866, 1, 0, 0, 1, 1,
0.1208776, 1.112839, 0.3239148, 0, 0, 0, 1, 1,
0.1211468, 2.133288, 1.137055, 0, 0, 0, 1, 1,
0.1242336, 0.2599322, 0.03560182, 0, 0, 0, 1, 1,
0.1313428, 0.6327311, -0.5081319, 0, 0, 0, 1, 1,
0.1345993, 0.3990177, -0.5907215, 0, 0, 0, 1, 1,
0.1370122, -1.099089, 2.720384, 0, 0, 0, 1, 1,
0.1387864, -1.034891, 2.121974, 0, 0, 0, 1, 1,
0.1389127, 0.03113792, 2.316576, 1, 1, 1, 1, 1,
0.1392439, -0.7139699, 4.14864, 1, 1, 1, 1, 1,
0.140962, -1.086415, 1.953445, 1, 1, 1, 1, 1,
0.1587321, -0.5052416, 4.17125, 1, 1, 1, 1, 1,
0.1594842, -0.922197, 3.073663, 1, 1, 1, 1, 1,
0.1601954, 1.308663, 0.4446427, 1, 1, 1, 1, 1,
0.1686052, 1.228087, 1.75612, 1, 1, 1, 1, 1,
0.1762919, -0.9032382, 3.472384, 1, 1, 1, 1, 1,
0.1790966, -0.7427694, 2.473168, 1, 1, 1, 1, 1,
0.179371, -0.3859165, 2.554729, 1, 1, 1, 1, 1,
0.1802913, 1.441018, -0.6873025, 1, 1, 1, 1, 1,
0.1820958, -0.8769983, 2.049685, 1, 1, 1, 1, 1,
0.1821827, 1.262729, 1.8011, 1, 1, 1, 1, 1,
0.1885047, -0.2420143, 2.48055, 1, 1, 1, 1, 1,
0.19288, -0.724159, 2.16381, 1, 1, 1, 1, 1,
0.1933792, -0.1261241, 2.747497, 0, 0, 1, 1, 1,
0.195614, 1.046709, 2.75058, 1, 0, 0, 1, 1,
0.1963255, -0.2921966, 2.794166, 1, 0, 0, 1, 1,
0.1966679, -1.531356, 2.776363, 1, 0, 0, 1, 1,
0.1976463, -0.7699743, 1.49719, 1, 0, 0, 1, 1,
0.2022263, 0.4972865, -0.4450629, 1, 0, 0, 1, 1,
0.2026697, 0.3893342, -0.5525949, 0, 0, 0, 1, 1,
0.2133269, -0.3020153, 2.591569, 0, 0, 0, 1, 1,
0.2152645, -0.1118936, 0.8093763, 0, 0, 0, 1, 1,
0.2158275, 0.2245564, 0.2492506, 0, 0, 0, 1, 1,
0.2172897, 0.1714396, 1.932771, 0, 0, 0, 1, 1,
0.2235649, 1.967282, 1.248657, 0, 0, 0, 1, 1,
0.2274355, -0.6151224, 4.234483, 0, 0, 0, 1, 1,
0.2313566, 0.4390353, 0.4254241, 1, 1, 1, 1, 1,
0.2345553, 0.7929935, -0.2793585, 1, 1, 1, 1, 1,
0.2390809, -0.009002002, 0.008500482, 1, 1, 1, 1, 1,
0.2408949, 1.038338, -0.4028923, 1, 1, 1, 1, 1,
0.2441291, 0.9339924, -1.138844, 1, 1, 1, 1, 1,
0.247641, 0.6611445, 1.900202, 1, 1, 1, 1, 1,
0.2575552, 1.437884, 0.3720887, 1, 1, 1, 1, 1,
0.2583355, -0.0891443, 4.209091, 1, 1, 1, 1, 1,
0.2630692, -0.3782559, 2.296287, 1, 1, 1, 1, 1,
0.2642877, -0.8303056, 2.038358, 1, 1, 1, 1, 1,
0.2652586, 0.3060613, 0.8902825, 1, 1, 1, 1, 1,
0.2709426, -0.4956838, 1.667226, 1, 1, 1, 1, 1,
0.2745132, 0.242102, -0.0462565, 1, 1, 1, 1, 1,
0.2810137, -0.08798214, 2.126695, 1, 1, 1, 1, 1,
0.2824984, 0.7888246, -0.958706, 1, 1, 1, 1, 1,
0.2835551, -1.327314, 2.376121, 0, 0, 1, 1, 1,
0.2881236, 0.7097023, -0.7509675, 1, 0, 0, 1, 1,
0.2909347, -1.351093, 1.381892, 1, 0, 0, 1, 1,
0.2920334, 0.3059453, 1.670486, 1, 0, 0, 1, 1,
0.2927971, -0.03313164, 1.995497, 1, 0, 0, 1, 1,
0.2976527, 0.8159643, 1.703683, 1, 0, 0, 1, 1,
0.300817, -0.6785703, 2.693244, 0, 0, 0, 1, 1,
0.3019097, 0.7008033, -1.487586, 0, 0, 0, 1, 1,
0.3025499, 0.8591846, -1.315282, 0, 0, 0, 1, 1,
0.3063035, -1.302957, 3.029052, 0, 0, 0, 1, 1,
0.3075742, -0.4880191, 2.632219, 0, 0, 0, 1, 1,
0.3093376, -2.055801, 3.626621, 0, 0, 0, 1, 1,
0.3139389, -0.2958522, 2.723338, 0, 0, 0, 1, 1,
0.3162157, -3.166805, 2.331161, 1, 1, 1, 1, 1,
0.3196068, -0.5156828, 2.993724, 1, 1, 1, 1, 1,
0.3258953, -0.8740869, 2.975605, 1, 1, 1, 1, 1,
0.3259436, 0.9140159, -0.868403, 1, 1, 1, 1, 1,
0.3344457, -1.082276, 3.689326, 1, 1, 1, 1, 1,
0.3351178, 0.09965157, 0.6662961, 1, 1, 1, 1, 1,
0.33659, -0.6544675, 2.495302, 1, 1, 1, 1, 1,
0.3404696, -0.01541687, 1.317852, 1, 1, 1, 1, 1,
0.3487402, -0.4175639, 4.188304, 1, 1, 1, 1, 1,
0.3513133, -1.58326, 2.894958, 1, 1, 1, 1, 1,
0.353026, 1.096926, 1.286434, 1, 1, 1, 1, 1,
0.3534267, -0.263156, 1.264796, 1, 1, 1, 1, 1,
0.3574707, -1.121172, 5.711629, 1, 1, 1, 1, 1,
0.3593072, -1.604919, 3.358107, 1, 1, 1, 1, 1,
0.3601085, -0.9334185, 3.486255, 1, 1, 1, 1, 1,
0.3619724, -0.01896149, 1.955353, 0, 0, 1, 1, 1,
0.3636675, 0.01261673, 1.495875, 1, 0, 0, 1, 1,
0.3675303, 0.6272035, 0.5719934, 1, 0, 0, 1, 1,
0.3679152, 0.01078062, 2.350664, 1, 0, 0, 1, 1,
0.3720678, -1.590973, 5.158311, 1, 0, 0, 1, 1,
0.3742721, 0.1314261, 1.832301, 1, 0, 0, 1, 1,
0.3769641, 0.4253671, 0.3745862, 0, 0, 0, 1, 1,
0.3773587, -0.7105916, 4.307165, 0, 0, 0, 1, 1,
0.3786064, -0.3578168, 2.207019, 0, 0, 0, 1, 1,
0.3804708, 0.1356197, 0.4608133, 0, 0, 0, 1, 1,
0.3830909, -0.630345, 2.325078, 0, 0, 0, 1, 1,
0.3848384, 0.8835011, 0.4240362, 0, 0, 0, 1, 1,
0.3875539, 1.087384, -1.255078, 0, 0, 0, 1, 1,
0.3880872, -1.829658, 3.012657, 1, 1, 1, 1, 1,
0.3918008, 0.08865063, -0.349739, 1, 1, 1, 1, 1,
0.3922192, 0.6581898, 1.753847, 1, 1, 1, 1, 1,
0.3927655, 0.5493117, -0.840737, 1, 1, 1, 1, 1,
0.400531, 1.586547, 1.310179, 1, 1, 1, 1, 1,
0.4006568, 1.017629, 0.3538242, 1, 1, 1, 1, 1,
0.4064761, -1.399585, 2.174593, 1, 1, 1, 1, 1,
0.4081915, 2.370381, 0.6337701, 1, 1, 1, 1, 1,
0.4127355, 0.2856975, 0.921548, 1, 1, 1, 1, 1,
0.4133461, 1.62982, 0.6645374, 1, 1, 1, 1, 1,
0.4157, -0.4350694, 2.462064, 1, 1, 1, 1, 1,
0.4158916, -0.2660204, 3.263696, 1, 1, 1, 1, 1,
0.4162111, -0.635507, 3.737628, 1, 1, 1, 1, 1,
0.4230404, -1.032725, 2.126613, 1, 1, 1, 1, 1,
0.4239441, 0.7132882, 1.103327, 1, 1, 1, 1, 1,
0.4243207, 1.453957, 0.1800685, 0, 0, 1, 1, 1,
0.4262944, 0.3386144, 1.479351, 1, 0, 0, 1, 1,
0.4263403, 0.6627057, 0.6756537, 1, 0, 0, 1, 1,
0.4294438, 0.1261377, -0.6667172, 1, 0, 0, 1, 1,
0.4305159, -1.247615, 3.289904, 1, 0, 0, 1, 1,
0.4315266, -1.104789, 1.893474, 1, 0, 0, 1, 1,
0.4337332, -0.3931333, 2.625821, 0, 0, 0, 1, 1,
0.441388, 2.28687, 0.8965305, 0, 0, 0, 1, 1,
0.4440473, -1.112759, 3.504343, 0, 0, 0, 1, 1,
0.4462651, -0.2427739, 2.117274, 0, 0, 0, 1, 1,
0.4466417, 0.7019715, 1.045677, 0, 0, 0, 1, 1,
0.4474014, -1.698007, 3.357193, 0, 0, 0, 1, 1,
0.4494963, -1.006721, 2.596546, 0, 0, 0, 1, 1,
0.4549255, -1.648522, 1.024249, 1, 1, 1, 1, 1,
0.4598533, -0.2914083, 1.339869, 1, 1, 1, 1, 1,
0.4623625, -1.485028, -0.07113709, 1, 1, 1, 1, 1,
0.4691373, -0.4006382, 1.24298, 1, 1, 1, 1, 1,
0.4695701, -0.4368026, 0.08736935, 1, 1, 1, 1, 1,
0.4714144, -0.1021144, 1.543621, 1, 1, 1, 1, 1,
0.4738293, -0.02788023, 4.818461, 1, 1, 1, 1, 1,
0.4750537, 0.8873187, 0.1119483, 1, 1, 1, 1, 1,
0.4760392, 1.651325, 0.3902281, 1, 1, 1, 1, 1,
0.4823176, 1.567861, 0.2611306, 1, 1, 1, 1, 1,
0.4842156, -0.6636897, 2.509317, 1, 1, 1, 1, 1,
0.4848056, 0.4053554, 2.683594, 1, 1, 1, 1, 1,
0.4903108, 0.6212586, 0.1671207, 1, 1, 1, 1, 1,
0.4943658, 1.228779, 0.6419142, 1, 1, 1, 1, 1,
0.4969582, 1.1168, 0.1174916, 1, 1, 1, 1, 1,
0.4985715, -0.7535058, 2.721917, 0, 0, 1, 1, 1,
0.4988616, -0.2708957, 2.575928, 1, 0, 0, 1, 1,
0.5012795, 0.3823227, 1.952383, 1, 0, 0, 1, 1,
0.5018108, 0.349303, 1.555384, 1, 0, 0, 1, 1,
0.504771, -0.9588993, 3.240304, 1, 0, 0, 1, 1,
0.5061028, 0.1349186, 1.01173, 1, 0, 0, 1, 1,
0.5096533, -0.17334, 0.3786415, 0, 0, 0, 1, 1,
0.5147948, -2.604047, 4.420126, 0, 0, 0, 1, 1,
0.5149875, 1.680943, 1.11703, 0, 0, 0, 1, 1,
0.5163158, -1.577418, 3.530357, 0, 0, 0, 1, 1,
0.5167, 0.2598171, 2.008399, 0, 0, 0, 1, 1,
0.5183706, 1.332635, -0.003120335, 0, 0, 0, 1, 1,
0.5210391, -1.397768, 4.776453, 0, 0, 0, 1, 1,
0.5229404, 0.5486229, -0.1987987, 1, 1, 1, 1, 1,
0.5288112, 0.1190835, 1.610857, 1, 1, 1, 1, 1,
0.5301595, -0.8342369, 3.520374, 1, 1, 1, 1, 1,
0.5308297, -1.269388, 2.451722, 1, 1, 1, 1, 1,
0.5318865, -0.6496593, 5.295139, 1, 1, 1, 1, 1,
0.5324587, 1.280992, -0.112944, 1, 1, 1, 1, 1,
0.5413157, 1.293275, -0.7215218, 1, 1, 1, 1, 1,
0.5460044, 1.027236, -0.01607766, 1, 1, 1, 1, 1,
0.5462515, -0.3575941, 3.710575, 1, 1, 1, 1, 1,
0.5550764, -0.2165019, 0.9419987, 1, 1, 1, 1, 1,
0.5565979, -1.067521, 2.622336, 1, 1, 1, 1, 1,
0.5580406, 0.5939394, 1.559927, 1, 1, 1, 1, 1,
0.5588554, -0.6339101, 2.07036, 1, 1, 1, 1, 1,
0.5593838, -0.6038381, 2.920183, 1, 1, 1, 1, 1,
0.5630764, -0.3950664, 2.323759, 1, 1, 1, 1, 1,
0.5640776, -1.170092, 0.8272249, 0, 0, 1, 1, 1,
0.5707148, -1.183296, 1.984113, 1, 0, 0, 1, 1,
0.5739163, -0.1714212, 2.771737, 1, 0, 0, 1, 1,
0.573919, -0.3116286, 2.530315, 1, 0, 0, 1, 1,
0.5753011, -0.8295901, 2.076532, 1, 0, 0, 1, 1,
0.5831116, -0.636104, 1.404062, 1, 0, 0, 1, 1,
0.5894446, 0.3509211, -0.7106431, 0, 0, 0, 1, 1,
0.5897887, -0.5531486, 0.8866458, 0, 0, 0, 1, 1,
0.5903889, 0.3023823, 0.8187013, 0, 0, 0, 1, 1,
0.6016033, -0.3651299, 3.762396, 0, 0, 0, 1, 1,
0.6064332, -1.304767, 2.854386, 0, 0, 0, 1, 1,
0.6069524, 1.589702, 2.71997, 0, 0, 0, 1, 1,
0.609814, -0.7009631, 4.066309, 0, 0, 0, 1, 1,
0.6112532, -0.7662551, 1.398161, 1, 1, 1, 1, 1,
0.6137726, 1.324475, 1.045159, 1, 1, 1, 1, 1,
0.6151257, -1.007169, 2.828613, 1, 1, 1, 1, 1,
0.6190416, -0.08344755, 3.334528, 1, 1, 1, 1, 1,
0.6213542, 1.017042, 0.4496992, 1, 1, 1, 1, 1,
0.6233926, 0.5025217, 1.483701, 1, 1, 1, 1, 1,
0.6243114, -1.134952, 1.231631, 1, 1, 1, 1, 1,
0.63107, 1.01914, 1.112333, 1, 1, 1, 1, 1,
0.6400989, -0.6141462, 1.726817, 1, 1, 1, 1, 1,
0.6416642, -0.2326198, 1.031519, 1, 1, 1, 1, 1,
0.6466125, 0.6491503, 0.3031515, 1, 1, 1, 1, 1,
0.6562212, 0.5520179, -0.2872517, 1, 1, 1, 1, 1,
0.6580139, 0.4702613, -1.463892, 1, 1, 1, 1, 1,
0.6592686, 2.456294, 0.8557312, 1, 1, 1, 1, 1,
0.6624816, 1.824047, 2.602882, 1, 1, 1, 1, 1,
0.6634207, -0.326768, 1.263205, 0, 0, 1, 1, 1,
0.6636037, -1.355427, 5.052421, 1, 0, 0, 1, 1,
0.6691598, 0.5834312, 1.312643, 1, 0, 0, 1, 1,
0.6692309, 0.9187558, 0.09857929, 1, 0, 0, 1, 1,
0.6692626, 0.1665704, 1.381698, 1, 0, 0, 1, 1,
0.6741659, 0.2313607, 0.8122411, 1, 0, 0, 1, 1,
0.679692, 1.681448, -0.2002036, 0, 0, 0, 1, 1,
0.680744, -0.8374909, 2.11709, 0, 0, 0, 1, 1,
0.6816295, 1.761355, -0.3583044, 0, 0, 0, 1, 1,
0.6920965, -0.5975125, 3.99868, 0, 0, 0, 1, 1,
0.6963784, -0.3017205, 2.662571, 0, 0, 0, 1, 1,
0.6973718, -0.3763446, 1.405115, 0, 0, 0, 1, 1,
0.6986424, -0.9100643, 2.548873, 0, 0, 0, 1, 1,
0.6998562, -2.281532, 3.60133, 1, 1, 1, 1, 1,
0.7041696, -0.9942908, 2.807072, 1, 1, 1, 1, 1,
0.7041765, -1.541067, 3.500839, 1, 1, 1, 1, 1,
0.7048388, 0.2396748, 0.7231801, 1, 1, 1, 1, 1,
0.7084539, 1.103031, 2.089082, 1, 1, 1, 1, 1,
0.715286, 0.2025722, 1.065314, 1, 1, 1, 1, 1,
0.7171568, 1.125413, -0.5964056, 1, 1, 1, 1, 1,
0.7289842, -0.1345853, 2.328029, 1, 1, 1, 1, 1,
0.7291159, -0.9486449, 3.269655, 1, 1, 1, 1, 1,
0.7297981, 0.7304465, 0.9281942, 1, 1, 1, 1, 1,
0.7322053, 1.039033, 1.982587, 1, 1, 1, 1, 1,
0.7365971, 0.4644506, 0.01031072, 1, 1, 1, 1, 1,
0.7374756, -0.1637782, 1.328217, 1, 1, 1, 1, 1,
0.7394312, -1.500383, 3.61453, 1, 1, 1, 1, 1,
0.7406334, 0.6139327, 0.2319433, 1, 1, 1, 1, 1,
0.7414208, 1.110188, 1.466747, 0, 0, 1, 1, 1,
0.7414741, 0.470101, 1.635731, 1, 0, 0, 1, 1,
0.7531571, -0.5989338, 2.733776, 1, 0, 0, 1, 1,
0.7545076, 1.14653, -1.379953, 1, 0, 0, 1, 1,
0.7558388, 0.9547585, 1.095212, 1, 0, 0, 1, 1,
0.7596325, 1.198077, 0.3288904, 1, 0, 0, 1, 1,
0.76142, -0.1259259, 2.801421, 0, 0, 0, 1, 1,
0.7629789, -0.4633628, 3.083967, 0, 0, 0, 1, 1,
0.7683983, -0.6376138, 1.569335, 0, 0, 0, 1, 1,
0.7688079, -0.04342941, 0.9044985, 0, 0, 0, 1, 1,
0.769973, -2.226004, 2.920882, 0, 0, 0, 1, 1,
0.7785137, -2.168523, 2.595972, 0, 0, 0, 1, 1,
0.7813904, 1.552465, 0.6330351, 0, 0, 0, 1, 1,
0.7830322, 0.1517782, 0.1754417, 1, 1, 1, 1, 1,
0.7872337, 0.4846918, 0.8275458, 1, 1, 1, 1, 1,
0.7883337, 1.068008, 0.9492405, 1, 1, 1, 1, 1,
0.789465, 1.437067, -0.5154887, 1, 1, 1, 1, 1,
0.7908748, 2.669691, -0.491062, 1, 1, 1, 1, 1,
0.8008497, -0.7800412, 3.815694, 1, 1, 1, 1, 1,
0.8026587, 1.644034, -0.4544979, 1, 1, 1, 1, 1,
0.8040645, 0.4339256, 2.310321, 1, 1, 1, 1, 1,
0.8045096, 0.6897445, 0.8635857, 1, 1, 1, 1, 1,
0.8054711, 1.10338, 1.130922, 1, 1, 1, 1, 1,
0.8070355, 0.3592674, -1.7334, 1, 1, 1, 1, 1,
0.8080368, -1.521244, 4.473608, 1, 1, 1, 1, 1,
0.814224, -0.5074276, 2.415178, 1, 1, 1, 1, 1,
0.8210362, -1.162306, 1.637989, 1, 1, 1, 1, 1,
0.8231442, -0.6258442, 1.866772, 1, 1, 1, 1, 1,
0.8255647, 0.3088579, 0.8875443, 0, 0, 1, 1, 1,
0.8295853, -0.01926764, 1.692426, 1, 0, 0, 1, 1,
0.8367217, -0.3862081, 2.422702, 1, 0, 0, 1, 1,
0.8380201, 1.115185, 0.8479307, 1, 0, 0, 1, 1,
0.8419003, -1.872462, 2.744752, 1, 0, 0, 1, 1,
0.8447613, 1.817633, -0.6578162, 1, 0, 0, 1, 1,
0.8473737, 0.1014183, 2.346135, 0, 0, 0, 1, 1,
0.8481447, -0.4515243, 1.875826, 0, 0, 0, 1, 1,
0.8501233, -0.8079957, 3.005952, 0, 0, 0, 1, 1,
0.8599533, 1.144519, -1.060581, 0, 0, 0, 1, 1,
0.8600661, 0.6113802, -0.0131225, 0, 0, 0, 1, 1,
0.8608425, 0.1263289, 1.847052, 0, 0, 0, 1, 1,
0.8625452, -0.1529327, 1.264293, 0, 0, 0, 1, 1,
0.866612, 0.2178286, 1.750646, 1, 1, 1, 1, 1,
0.8735403, 1.003111, 3.133807, 1, 1, 1, 1, 1,
0.8847566, 1.299475, -0.9180807, 1, 1, 1, 1, 1,
0.8851119, 0.3283368, 0.6483622, 1, 1, 1, 1, 1,
0.8889869, -0.9614578, 3.394618, 1, 1, 1, 1, 1,
0.8958125, 1.062744, -0.01961223, 1, 1, 1, 1, 1,
0.89947, -1.41738, 3.144485, 1, 1, 1, 1, 1,
0.9054346, 1.067476, 1.09349, 1, 1, 1, 1, 1,
0.9057494, -0.553162, 1.213247, 1, 1, 1, 1, 1,
0.9062749, -1.049172, 2.75286, 1, 1, 1, 1, 1,
0.9063361, -1.2116, 3.567134, 1, 1, 1, 1, 1,
0.9128079, -1.736533, 2.519181, 1, 1, 1, 1, 1,
0.9151237, 0.7773852, 0.02943888, 1, 1, 1, 1, 1,
0.9152279, -0.2060997, 1.732849, 1, 1, 1, 1, 1,
0.9154369, 0.1297442, -0.03909527, 1, 1, 1, 1, 1,
0.9172974, -0.6103142, 1.614154, 0, 0, 1, 1, 1,
0.9193252, 0.08701916, 1.008415, 1, 0, 0, 1, 1,
0.928637, 0.1497519, 0.09732305, 1, 0, 0, 1, 1,
0.9352565, 0.8772189, 1.534984, 1, 0, 0, 1, 1,
0.9388981, -2.765887, 3.589042, 1, 0, 0, 1, 1,
0.9438837, -0.2200633, 2.227948, 1, 0, 0, 1, 1,
0.9449694, 0.643457, -0.715699, 0, 0, 0, 1, 1,
0.96195, 1.655988, 1.954121, 0, 0, 0, 1, 1,
0.9674623, -1.384232, 2.96677, 0, 0, 0, 1, 1,
0.9686101, -1.642534, 1.197852, 0, 0, 0, 1, 1,
0.9693487, 0.6506453, 0.3441226, 0, 0, 0, 1, 1,
0.9706454, -0.6511853, -0.06215048, 0, 0, 0, 1, 1,
0.9730588, 0.4337747, 2.393152, 0, 0, 0, 1, 1,
0.9749276, 0.2481177, 0.4904003, 1, 1, 1, 1, 1,
0.9761716, -0.3634413, 3.238999, 1, 1, 1, 1, 1,
0.9784802, -0.5709504, 2.753399, 1, 1, 1, 1, 1,
0.9795141, 1.005475, -0.7692761, 1, 1, 1, 1, 1,
0.9889424, 0.3488521, 0.9206123, 1, 1, 1, 1, 1,
0.9922336, -2.534084, 2.519044, 1, 1, 1, 1, 1,
1.009131, 0.2589645, 0.7664819, 1, 1, 1, 1, 1,
1.011016, -2.087527, 1.913852, 1, 1, 1, 1, 1,
1.017123, 1.392884, 2.297242, 1, 1, 1, 1, 1,
1.017723, 1.796729, 0.8697402, 1, 1, 1, 1, 1,
1.019245, -1.531352, 3.00793, 1, 1, 1, 1, 1,
1.020366, -1.361399, 0.3713433, 1, 1, 1, 1, 1,
1.032235, 0.3112049, 0.8886833, 1, 1, 1, 1, 1,
1.032884, -1.421947, 2.162983, 1, 1, 1, 1, 1,
1.037644, 0.9519283, 2.060052, 1, 1, 1, 1, 1,
1.038296, -0.2295796, 1.128503, 0, 0, 1, 1, 1,
1.041738, 0.6402666, -0.3118516, 1, 0, 0, 1, 1,
1.057005, 0.5579608, 1.054971, 1, 0, 0, 1, 1,
1.058579, 0.5225611, 0.08124431, 1, 0, 0, 1, 1,
1.06562, 1.185423, 1.496872, 1, 0, 0, 1, 1,
1.067164, 0.5213516, 0.8036433, 1, 0, 0, 1, 1,
1.06985, -2.179712, 4.768746, 0, 0, 0, 1, 1,
1.073601, 1.585388, -0.5710627, 0, 0, 0, 1, 1,
1.074368, 0.5555119, 0.9856963, 0, 0, 0, 1, 1,
1.076266, 1.260223, -1.046375, 0, 0, 0, 1, 1,
1.090731, 0.2171483, 3.496694, 0, 0, 0, 1, 1,
1.092524, -2.052391, 3.814236, 0, 0, 0, 1, 1,
1.10205, -0.5707329, 1.681568, 0, 0, 0, 1, 1,
1.105022, 1.126228, 1.964267, 1, 1, 1, 1, 1,
1.10765, 0.7650549, 2.449197, 1, 1, 1, 1, 1,
1.113361, 0.05507412, 1.138691, 1, 1, 1, 1, 1,
1.119284, -0.2387418, 1.931697, 1, 1, 1, 1, 1,
1.11943, -0.8848961, 2.554053, 1, 1, 1, 1, 1,
1.120458, 0.1760669, 0.6851122, 1, 1, 1, 1, 1,
1.122728, -0.873658, 4.201249, 1, 1, 1, 1, 1,
1.124423, 0.7056077, 0.7575471, 1, 1, 1, 1, 1,
1.125421, -0.4387683, 2.465111, 1, 1, 1, 1, 1,
1.125598, -0.8299267, 2.898584, 1, 1, 1, 1, 1,
1.146534, 0.1680292, 1.269217, 1, 1, 1, 1, 1,
1.160267, -0.7188289, 4.013787, 1, 1, 1, 1, 1,
1.160897, 0.266814, 2.065913, 1, 1, 1, 1, 1,
1.163069, -0.466013, 1.269366, 1, 1, 1, 1, 1,
1.168231, 1.512506, -0.7329739, 1, 1, 1, 1, 1,
1.169798, -0.5659509, 3.109428, 0, 0, 1, 1, 1,
1.174865, 0.9744777, 0.7210845, 1, 0, 0, 1, 1,
1.176486, 1.67113, 1.245461, 1, 0, 0, 1, 1,
1.180844, 0.009400468, 0.8890471, 1, 0, 0, 1, 1,
1.18293, 1.377052, 0.1622654, 1, 0, 0, 1, 1,
1.193727, 0.7999677, -0.3829831, 1, 0, 0, 1, 1,
1.195004, 0.8201496, 1.662208, 0, 0, 0, 1, 1,
1.197753, -0.1873855, 1.284385, 0, 0, 0, 1, 1,
1.198437, -1.362655, 3.405317, 0, 0, 0, 1, 1,
1.206641, 0.917418, 1.461086, 0, 0, 0, 1, 1,
1.21012, -0.7890064, 1.644591, 0, 0, 0, 1, 1,
1.217728, -0.1388345, 3.936437, 0, 0, 0, 1, 1,
1.224006, -2.004548, 2.825457, 0, 0, 0, 1, 1,
1.228416, 0.4110662, -0.2736375, 1, 1, 1, 1, 1,
1.237474, -1.345983, 2.024139, 1, 1, 1, 1, 1,
1.253722, -0.04846555, 1.823593, 1, 1, 1, 1, 1,
1.262582, 0.8718559, 1.837954, 1, 1, 1, 1, 1,
1.269112, -0.6797618, 2.158298, 1, 1, 1, 1, 1,
1.271583, 1.12277, -0.3021671, 1, 1, 1, 1, 1,
1.285068, 0.01944419, 1.137876, 1, 1, 1, 1, 1,
1.290181, -1.894767, 2.329599, 1, 1, 1, 1, 1,
1.295362, -0.2535712, -0.2044067, 1, 1, 1, 1, 1,
1.303562, 2.026251, -0.1297404, 1, 1, 1, 1, 1,
1.305728, 1.673133, 1.782105, 1, 1, 1, 1, 1,
1.334131, 1.236498, 1.245096, 1, 1, 1, 1, 1,
1.335845, -0.3728313, 2.723171, 1, 1, 1, 1, 1,
1.339323, 0.2932675, 3.341106, 1, 1, 1, 1, 1,
1.3511, 1.715217, 0.2682767, 1, 1, 1, 1, 1,
1.353315, -0.1138274, -0.5420318, 0, 0, 1, 1, 1,
1.388162, 0.5193734, 0.2664255, 1, 0, 0, 1, 1,
1.394534, 0.7327027, 0.5202911, 1, 0, 0, 1, 1,
1.405077, -1.110214, 0.734078, 1, 0, 0, 1, 1,
1.407268, -0.3377776, 2.072141, 1, 0, 0, 1, 1,
1.41317, 1.929026, -0.3060026, 1, 0, 0, 1, 1,
1.42721, -0.3689822, 2.216831, 0, 0, 0, 1, 1,
1.433798, 1.175816, 1.620016, 0, 0, 0, 1, 1,
1.440371, 0.6951134, 2.174472, 0, 0, 0, 1, 1,
1.440717, -2.642174, 2.29326, 0, 0, 0, 1, 1,
1.442849, 1.276783, 0.1423238, 0, 0, 0, 1, 1,
1.458786, 1.830817, 2.602062, 0, 0, 0, 1, 1,
1.465097, 0.7319731, 1.728121, 0, 0, 0, 1, 1,
1.467709, 0.08051821, 0.02227218, 1, 1, 1, 1, 1,
1.477918, -0.8944641, 2.951256, 1, 1, 1, 1, 1,
1.478414, 0.3709441, 2.360862, 1, 1, 1, 1, 1,
1.481382, -1.204037, 3.340678, 1, 1, 1, 1, 1,
1.4922, 0.1701093, 0.1191984, 1, 1, 1, 1, 1,
1.500024, -1.09923, 1.22703, 1, 1, 1, 1, 1,
1.517751, -2.382268, 0.7708734, 1, 1, 1, 1, 1,
1.537284, -0.65977, 0.9902242, 1, 1, 1, 1, 1,
1.538658, 0.4332065, 0.9849088, 1, 1, 1, 1, 1,
1.539059, -1.732168, 1.631944, 1, 1, 1, 1, 1,
1.539828, 1.258019, 0.7559654, 1, 1, 1, 1, 1,
1.553056, 0.5973262, 0.7404244, 1, 1, 1, 1, 1,
1.553814, -1.023316, 1.289096, 1, 1, 1, 1, 1,
1.554993, -0.2398145, 1.453829, 1, 1, 1, 1, 1,
1.559979, 0.3899562, 0.2194516, 1, 1, 1, 1, 1,
1.570456, -0.2096868, 0.8664419, 0, 0, 1, 1, 1,
1.606902, -1.153736, 0.4611324, 1, 0, 0, 1, 1,
1.607227, 1.735494, 1.105246, 1, 0, 0, 1, 1,
1.614242, -1.914626, 1.599775, 1, 0, 0, 1, 1,
1.623455, 1.259507, 1.04548, 1, 0, 0, 1, 1,
1.628974, 0.9518521, 2.553759, 1, 0, 0, 1, 1,
1.631026, -0.4566646, 1.735579, 0, 0, 0, 1, 1,
1.638305, -0.03363901, 0.7086408, 0, 0, 0, 1, 1,
1.643963, 0.8857917, 1.291572, 0, 0, 0, 1, 1,
1.650461, 0.562983, 2.075982, 0, 0, 0, 1, 1,
1.658983, -1.296584, 1.376841, 0, 0, 0, 1, 1,
1.660358, 1.00421, 0.4546908, 0, 0, 0, 1, 1,
1.66241, 0.8963567, 2.321275, 0, 0, 0, 1, 1,
1.671769, 0.04420025, 2.297644, 1, 1, 1, 1, 1,
1.69235, -0.2037763, 2.532207, 1, 1, 1, 1, 1,
1.731605, -0.5464919, 1.733676, 1, 1, 1, 1, 1,
1.779483, -0.3077438, 2.863196, 1, 1, 1, 1, 1,
1.788112, -1.134457, 3.29569, 1, 1, 1, 1, 1,
1.790315, 0.1529028, 1.54556, 1, 1, 1, 1, 1,
1.816563, 1.145386, 1.801674, 1, 1, 1, 1, 1,
1.831565, -0.3117505, 1.936139, 1, 1, 1, 1, 1,
1.838482, -0.3471803, 1.412678, 1, 1, 1, 1, 1,
1.891956, -0.2829876, 1.712788, 1, 1, 1, 1, 1,
1.902626, -1.895098, 2.801366, 1, 1, 1, 1, 1,
1.909744, 0.1267156, 2.989861, 1, 1, 1, 1, 1,
1.971292, -0.3043871, 3.392451, 1, 1, 1, 1, 1,
2.03009, 0.4079011, 2.751099, 1, 1, 1, 1, 1,
2.041847, -0.6377324, 2.415237, 1, 1, 1, 1, 1,
2.095675, -0.5067045, 2.227145, 0, 0, 1, 1, 1,
2.111297, -0.06594492, 2.991149, 1, 0, 0, 1, 1,
2.142967, 0.1232105, 0.6324453, 1, 0, 0, 1, 1,
2.17929, -0.322289, -0.1776595, 1, 0, 0, 1, 1,
2.245821, -0.4349364, 0.8286132, 1, 0, 0, 1, 1,
2.279355, 0.03094859, 0.7696605, 1, 0, 0, 1, 1,
2.288397, -0.4435206, 0.5883493, 0, 0, 0, 1, 1,
2.301471, 0.1321844, -0.5760267, 0, 0, 0, 1, 1,
2.33353, 2.324516, 1.304134, 0, 0, 0, 1, 1,
2.335486, 0.05460658, 1.227701, 0, 0, 0, 1, 1,
2.377227, -1.332567, 3.480437, 0, 0, 0, 1, 1,
2.387409, 0.01203548, 1.52079, 0, 0, 0, 1, 1,
2.406896, -0.4314964, 1.22346, 0, 0, 0, 1, 1,
2.413936, -0.1946727, 0.2850743, 1, 1, 1, 1, 1,
2.420903, 1.023172, 0.2129219, 1, 1, 1, 1, 1,
2.617374, 1.705526, 0.578424, 1, 1, 1, 1, 1,
2.674905, -0.2976002, 0.006761122, 1, 1, 1, 1, 1,
2.685557, -0.2216108, 3.332823, 1, 1, 1, 1, 1,
3.107606, 0.4282708, 1.090492, 1, 1, 1, 1, 1,
3.165215, 1.139565, 0.7051089, 1, 1, 1, 1, 1
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
var radius = 9.780744;
var distance = 34.35445;
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
mvMatrix.translate( 0.2462902, -0.05385017, -0.2474983 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.35445);
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
