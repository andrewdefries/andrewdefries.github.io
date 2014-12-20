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
-2.933109, 1.513059, -0.1742488, 1, 0, 0, 1,
-2.881103, 0.2660103, -0.4484493, 1, 0.007843138, 0, 1,
-2.836288, -1.497414, -0.2702095, 1, 0.01176471, 0, 1,
-2.595606, 1.114292, -1.681895, 1, 0.01960784, 0, 1,
-2.347174, -0.4112176, -3.506996, 1, 0.02352941, 0, 1,
-2.334526, -0.5409259, -1.250477, 1, 0.03137255, 0, 1,
-2.322198, -0.7754019, -2.651998, 1, 0.03529412, 0, 1,
-2.293601, -0.3557579, -3.694607, 1, 0.04313726, 0, 1,
-2.257711, 0.1978192, -1.17321, 1, 0.04705882, 0, 1,
-2.240966, 1.113134, -1.578079, 1, 0.05490196, 0, 1,
-2.222184, -1.165241, 0.03492678, 1, 0.05882353, 0, 1,
-2.218293, -0.3487159, -2.648386, 1, 0.06666667, 0, 1,
-2.114626, -1.893926, -0.7439072, 1, 0.07058824, 0, 1,
-2.05411, 1.744305, -1.031201, 1, 0.07843138, 0, 1,
-2.045196, 0.9434079, -1.308137, 1, 0.08235294, 0, 1,
-2.029573, -1.446058, -3.182477, 1, 0.09019608, 0, 1,
-2.005314, -0.3680295, -0.4407309, 1, 0.09411765, 0, 1,
-1.996525, 1.573537, -0.3040733, 1, 0.1019608, 0, 1,
-1.989439, -0.4174904, -3.504302, 1, 0.1098039, 0, 1,
-1.977561, -0.6656978, -2.000339, 1, 0.1137255, 0, 1,
-1.92918, 0.7920508, -1.752022, 1, 0.1215686, 0, 1,
-1.922979, -0.4224635, -1.020176, 1, 0.1254902, 0, 1,
-1.920165, -0.1571854, -2.364677, 1, 0.1333333, 0, 1,
-1.912539, 0.3934338, -1.130863, 1, 0.1372549, 0, 1,
-1.904654, 1.536586, -0.3457692, 1, 0.145098, 0, 1,
-1.897026, -0.5497022, -1.314204, 1, 0.1490196, 0, 1,
-1.885681, 0.0146033, -0.7864604, 1, 0.1568628, 0, 1,
-1.868924, -0.5213913, -0.8153713, 1, 0.1607843, 0, 1,
-1.860453, -1.358301, -1.593886, 1, 0.1686275, 0, 1,
-1.858268, -0.387352, -2.836153, 1, 0.172549, 0, 1,
-1.840381, 0.7029635, -2.118922, 1, 0.1803922, 0, 1,
-1.82458, 0.3811118, -1.646543, 1, 0.1843137, 0, 1,
-1.822778, -1.196346, -1.520361, 1, 0.1921569, 0, 1,
-1.812435, 0.8217818, -2.307489, 1, 0.1960784, 0, 1,
-1.796906, -0.6118909, -2.656956, 1, 0.2039216, 0, 1,
-1.77581, -0.2737012, -1.168485, 1, 0.2117647, 0, 1,
-1.773414, 1.34636, -0.3065056, 1, 0.2156863, 0, 1,
-1.77222, -2.331979, -4.997907, 1, 0.2235294, 0, 1,
-1.747537, 0.1795935, -0.7646718, 1, 0.227451, 0, 1,
-1.74624, -0.1423066, -1.4769, 1, 0.2352941, 0, 1,
-1.744239, 0.7722851, -1.730769, 1, 0.2392157, 0, 1,
-1.670751, 0.7041371, -1.229537, 1, 0.2470588, 0, 1,
-1.669539, -1.461235, -2.595213, 1, 0.2509804, 0, 1,
-1.662482, -2.426267, -3.233206, 1, 0.2588235, 0, 1,
-1.655161, 1.12089, 0.6923775, 1, 0.2627451, 0, 1,
-1.648656, 0.4025553, -1.634937, 1, 0.2705882, 0, 1,
-1.64682, -0.7610077, -1.452613, 1, 0.2745098, 0, 1,
-1.619531, -0.8022062, -2.234395, 1, 0.282353, 0, 1,
-1.618163, -0.5374723, -1.096632, 1, 0.2862745, 0, 1,
-1.616594, -0.7318814, -2.328526, 1, 0.2941177, 0, 1,
-1.59825, 0.07814842, -1.674983, 1, 0.3019608, 0, 1,
-1.576937, 0.4279104, -1.022366, 1, 0.3058824, 0, 1,
-1.569784, 0.07649099, -2.373354, 1, 0.3137255, 0, 1,
-1.550148, 0.9482921, -0.1921115, 1, 0.3176471, 0, 1,
-1.538781, 0.09629227, -1.249081, 1, 0.3254902, 0, 1,
-1.521661, -1.372296, -2.757302, 1, 0.3294118, 0, 1,
-1.513225, 1.889114, -1.185499, 1, 0.3372549, 0, 1,
-1.512635, -0.1830384, -1.511852, 1, 0.3411765, 0, 1,
-1.505555, -1.30778, -2.659223, 1, 0.3490196, 0, 1,
-1.47559, 1.447095, -1.504575, 1, 0.3529412, 0, 1,
-1.469331, -1.142962, -1.186871, 1, 0.3607843, 0, 1,
-1.468978, 1.252756, -1.519645, 1, 0.3647059, 0, 1,
-1.467608, -1.154715, -3.382555, 1, 0.372549, 0, 1,
-1.466213, -0.8665476, -2.666056, 1, 0.3764706, 0, 1,
-1.454162, 0.1157584, -1.219223, 1, 0.3843137, 0, 1,
-1.447348, 0.1577661, -1.81329, 1, 0.3882353, 0, 1,
-1.446502, -0.4041716, 1.023497, 1, 0.3960784, 0, 1,
-1.437264, -0.1129236, -0.8445468, 1, 0.4039216, 0, 1,
-1.413479, -0.3864942, -3.61521, 1, 0.4078431, 0, 1,
-1.413044, -0.09394561, -0.8808338, 1, 0.4156863, 0, 1,
-1.410132, -0.7314413, -1.196278, 1, 0.4196078, 0, 1,
-1.402375, 0.5200829, -1.375951, 1, 0.427451, 0, 1,
-1.402194, -0.3822748, -0.7820981, 1, 0.4313726, 0, 1,
-1.397758, 1.786643, 1.693689, 1, 0.4392157, 0, 1,
-1.391043, 1.503421, -0.2060595, 1, 0.4431373, 0, 1,
-1.389975, 1.630455, -2.697024, 1, 0.4509804, 0, 1,
-1.379495, -0.4566889, -2.673653, 1, 0.454902, 0, 1,
-1.378683, -0.1117096, -1.607308, 1, 0.4627451, 0, 1,
-1.368354, 0.5908805, -3.343265, 1, 0.4666667, 0, 1,
-1.358108, 0.3028467, -1.642472, 1, 0.4745098, 0, 1,
-1.357786, 0.1694137, -0.9665359, 1, 0.4784314, 0, 1,
-1.354907, 0.1964075, -0.8728054, 1, 0.4862745, 0, 1,
-1.341252, -0.09263354, -2.625273, 1, 0.4901961, 0, 1,
-1.339121, -0.5379782, -0.3200432, 1, 0.4980392, 0, 1,
-1.331543, -0.4107008, -1.734729, 1, 0.5058824, 0, 1,
-1.327222, -1.587266, -1.866849, 1, 0.509804, 0, 1,
-1.318082, -1.456858, -2.729797, 1, 0.5176471, 0, 1,
-1.315946, 0.3584358, -1.651839, 1, 0.5215687, 0, 1,
-1.312338, -0.3337827, -1.928696, 1, 0.5294118, 0, 1,
-1.305933, -0.7116933, -3.765732, 1, 0.5333334, 0, 1,
-1.299749, -0.7020682, -1.989184, 1, 0.5411765, 0, 1,
-1.290722, -2.204636, -2.926603, 1, 0.5450981, 0, 1,
-1.289602, -0.757772, -1.507094, 1, 0.5529412, 0, 1,
-1.288405, 1.227852, -0.6247405, 1, 0.5568628, 0, 1,
-1.283569, -0.437217, -2.559709, 1, 0.5647059, 0, 1,
-1.281501, 0.3128327, -0.5674009, 1, 0.5686275, 0, 1,
-1.281299, 0.9894101, -3.172813, 1, 0.5764706, 0, 1,
-1.275126, 0.8602917, 0.2448718, 1, 0.5803922, 0, 1,
-1.272314, 1.51304, 1.476404, 1, 0.5882353, 0, 1,
-1.250976, 0.3933237, -0.9113039, 1, 0.5921569, 0, 1,
-1.248166, -1.909725, -2.435568, 1, 0.6, 0, 1,
-1.243902, 0.6518651, -0.794575, 1, 0.6078432, 0, 1,
-1.24334, 0.5840157, -0.06904824, 1, 0.6117647, 0, 1,
-1.242912, 1.422135, -0.3558518, 1, 0.6196079, 0, 1,
-1.241972, 0.6027529, -0.7703032, 1, 0.6235294, 0, 1,
-1.241379, -0.4201782, -2.543858, 1, 0.6313726, 0, 1,
-1.238623, -0.7066092, -3.066813, 1, 0.6352941, 0, 1,
-1.230192, -0.6168701, -0.4378507, 1, 0.6431373, 0, 1,
-1.226627, -1.202684, -1.334224, 1, 0.6470588, 0, 1,
-1.220335, -0.5189926, -3.035959, 1, 0.654902, 0, 1,
-1.220122, 1.107296, 0.1558483, 1, 0.6588235, 0, 1,
-1.209357, 1.163182, -0.8276162, 1, 0.6666667, 0, 1,
-1.204686, 1.094689, 0.6931912, 1, 0.6705883, 0, 1,
-1.190497, -0.423754, -2.151675, 1, 0.6784314, 0, 1,
-1.188626, -1.06494, -2.900853, 1, 0.682353, 0, 1,
-1.18347, -0.739877, -1.353281, 1, 0.6901961, 0, 1,
-1.181035, 1.00315, -2.073997, 1, 0.6941177, 0, 1,
-1.176994, 1.660977, -1.665641, 1, 0.7019608, 0, 1,
-1.166864, -0.5634106, -3.056432, 1, 0.7098039, 0, 1,
-1.166225, -1.221566, -2.858831, 1, 0.7137255, 0, 1,
-1.164718, 1.411519, 0.2927914, 1, 0.7215686, 0, 1,
-1.163601, 1.7437, -1.666744, 1, 0.7254902, 0, 1,
-1.160629, 0.5220981, -1.623839, 1, 0.7333333, 0, 1,
-1.144533, 1.4122, 0.2478141, 1, 0.7372549, 0, 1,
-1.13012, -0.559604, 0.4979786, 1, 0.7450981, 0, 1,
-1.123105, 0.08132333, -0.7045805, 1, 0.7490196, 0, 1,
-1.119937, 0.6382062, -1.329438, 1, 0.7568628, 0, 1,
-1.118084, 2.050593, 0.1871295, 1, 0.7607843, 0, 1,
-1.112303, -0.190347, -0.8428439, 1, 0.7686275, 0, 1,
-1.110696, 0.3926818, -0.5063511, 1, 0.772549, 0, 1,
-1.110142, 1.043421, -0.3755265, 1, 0.7803922, 0, 1,
-1.104572, 0.1808969, -2.281321, 1, 0.7843137, 0, 1,
-1.097034, 1.17942, 0.09055942, 1, 0.7921569, 0, 1,
-1.091204, 0.5285252, -0.2733698, 1, 0.7960784, 0, 1,
-1.08419, -0.5295485, -1.37233, 1, 0.8039216, 0, 1,
-1.081332, -1.15727, -2.585973, 1, 0.8117647, 0, 1,
-1.080662, -0.2890173, -2.664402, 1, 0.8156863, 0, 1,
-1.076311, 0.3262585, 1.4318, 1, 0.8235294, 0, 1,
-1.075008, -3.570115, -5.555445, 1, 0.827451, 0, 1,
-1.071956, -0.2247269, -0.5972921, 1, 0.8352941, 0, 1,
-1.065279, -0.7212675, -1.787839, 1, 0.8392157, 0, 1,
-1.065185, -1.830508, -2.750531, 1, 0.8470588, 0, 1,
-1.063494, 1.287273, -1.178339, 1, 0.8509804, 0, 1,
-1.063265, 0.5710571, -0.1641715, 1, 0.8588235, 0, 1,
-1.061326, 0.8052024, -2.344089, 1, 0.8627451, 0, 1,
-1.058689, 0.008550311, -1.499509, 1, 0.8705882, 0, 1,
-1.057742, 0.006317682, -1.041915, 1, 0.8745098, 0, 1,
-1.050202, 0.2666331, -0.01700176, 1, 0.8823529, 0, 1,
-1.048327, -0.9316074, -2.266319, 1, 0.8862745, 0, 1,
-1.047877, -0.001956614, -0.9317274, 1, 0.8941177, 0, 1,
-1.044252, -0.5852071, -4.604717, 1, 0.8980392, 0, 1,
-1.042905, -2.735239, -2.356705, 1, 0.9058824, 0, 1,
-1.040932, 0.6279574, -2.448507, 1, 0.9137255, 0, 1,
-1.030853, -0.8666343, -3.653232, 1, 0.9176471, 0, 1,
-1.028478, -1.394621, -2.728636, 1, 0.9254902, 0, 1,
-1.0227, 0.1639255, -1.418205, 1, 0.9294118, 0, 1,
-1.01916, -0.6603076, -2.392537, 1, 0.9372549, 0, 1,
-1.012415, 2.224075, -0.9993569, 1, 0.9411765, 0, 1,
-1.004794, -0.6493655, -1.296003, 1, 0.9490196, 0, 1,
-1.003917, -1.090419, -0.3889919, 1, 0.9529412, 0, 1,
-0.9987569, 2.199109, -0.7711473, 1, 0.9607843, 0, 1,
-0.9977245, -0.4647973, -1.724422, 1, 0.9647059, 0, 1,
-0.9973103, 0.2598243, -2.443608, 1, 0.972549, 0, 1,
-0.9948315, 0.1248432, -0.4046253, 1, 0.9764706, 0, 1,
-0.993881, -0.2479029, -3.553123, 1, 0.9843137, 0, 1,
-0.9885526, -0.1290507, -2.870946, 1, 0.9882353, 0, 1,
-0.987187, -1.293731, -1.785709, 1, 0.9960784, 0, 1,
-0.9823347, -1.58535, -3.502322, 0.9960784, 1, 0, 1,
-0.969197, -0.6702468, -2.937053, 0.9921569, 1, 0, 1,
-0.9645278, -1.754866, -3.51944, 0.9843137, 1, 0, 1,
-0.9615354, -0.05163598, -2.512765, 0.9803922, 1, 0, 1,
-0.9610559, 0.7613249, -1.603271, 0.972549, 1, 0, 1,
-0.9604334, -1.263624, -4.441033, 0.9686275, 1, 0, 1,
-0.9555093, -0.6942765, -3.543632, 0.9607843, 1, 0, 1,
-0.9545454, 0.5619287, -1.242884, 0.9568627, 1, 0, 1,
-0.9541878, -0.0142633, -2.786942, 0.9490196, 1, 0, 1,
-0.9516371, 0.5413685, 0.1516999, 0.945098, 1, 0, 1,
-0.9508214, 0.9162447, -1.412214, 0.9372549, 1, 0, 1,
-0.9477609, 0.3250398, -0.9202313, 0.9333333, 1, 0, 1,
-0.9468844, 1.75975, -2.23094, 0.9254902, 1, 0, 1,
-0.9448995, 0.3164235, -1.19574, 0.9215686, 1, 0, 1,
-0.9362944, 0.2398849, 0.5000393, 0.9137255, 1, 0, 1,
-0.9300687, -1.328743, -1.44092, 0.9098039, 1, 0, 1,
-0.9169886, 0.5943906, -2.307931, 0.9019608, 1, 0, 1,
-0.9161914, 0.3157469, -2.217818, 0.8941177, 1, 0, 1,
-0.9071143, 1.144495, -1.49826, 0.8901961, 1, 0, 1,
-0.8984989, 0.6278675, -1.227124, 0.8823529, 1, 0, 1,
-0.8949922, -0.6875355, -2.96289, 0.8784314, 1, 0, 1,
-0.8920287, -0.5879766, -4.73244, 0.8705882, 1, 0, 1,
-0.8901689, 0.3537284, -1.461845, 0.8666667, 1, 0, 1,
-0.8894902, 0.1960991, -2.49417, 0.8588235, 1, 0, 1,
-0.8880066, 0.1121625, -1.56441, 0.854902, 1, 0, 1,
-0.8844128, 1.13361, 0.5382861, 0.8470588, 1, 0, 1,
-0.8807093, 0.3887725, -1.84917, 0.8431373, 1, 0, 1,
-0.878672, 0.9719034, 1.525063, 0.8352941, 1, 0, 1,
-0.8778006, -2.469449, -2.499961, 0.8313726, 1, 0, 1,
-0.8739914, -0.3756894, -1.813028, 0.8235294, 1, 0, 1,
-0.8647963, -1.303296, -1.915685, 0.8196079, 1, 0, 1,
-0.8643946, 1.392387, -0.4475083, 0.8117647, 1, 0, 1,
-0.8540846, -1.221016, -3.233916, 0.8078431, 1, 0, 1,
-0.8428177, 1.404894, -1.074312, 0.8, 1, 0, 1,
-0.842244, 0.6500527, -0.9192952, 0.7921569, 1, 0, 1,
-0.8402095, -0.1697099, -1.482907, 0.7882353, 1, 0, 1,
-0.8390678, -0.6052794, -1.836095, 0.7803922, 1, 0, 1,
-0.8373467, 0.6980739, 0.5165067, 0.7764706, 1, 0, 1,
-0.8303335, 0.4385289, -0.4059828, 0.7686275, 1, 0, 1,
-0.8277655, 1.056065, 1.380537, 0.7647059, 1, 0, 1,
-0.8262454, 1.115873, -0.1796156, 0.7568628, 1, 0, 1,
-0.8201133, 0.4618332, 0.4204573, 0.7529412, 1, 0, 1,
-0.8198748, -0.8885477, -2.450015, 0.7450981, 1, 0, 1,
-0.8165357, 0.1757074, -1.843321, 0.7411765, 1, 0, 1,
-0.8145734, 1.035267, -0.8169069, 0.7333333, 1, 0, 1,
-0.8124338, -0.3790558, -0.9979556, 0.7294118, 1, 0, 1,
-0.8068739, -0.3259269, -1.822286, 0.7215686, 1, 0, 1,
-0.8057965, 1.270286, -0.722835, 0.7176471, 1, 0, 1,
-0.8000279, -0.4446071, -2.429096, 0.7098039, 1, 0, 1,
-0.7969897, -1.677323, -2.544445, 0.7058824, 1, 0, 1,
-0.7947906, 0.8474532, 0.6762018, 0.6980392, 1, 0, 1,
-0.7930463, 0.1356733, -0.008741036, 0.6901961, 1, 0, 1,
-0.7919246, 1.222455, -1.152132, 0.6862745, 1, 0, 1,
-0.7893667, -0.01992346, -2.168599, 0.6784314, 1, 0, 1,
-0.783803, 0.9255821, -1.609674, 0.6745098, 1, 0, 1,
-0.7789957, 0.01943552, -0.2428163, 0.6666667, 1, 0, 1,
-0.7788189, -0.2203877, -1.695414, 0.6627451, 1, 0, 1,
-0.7683968, 0.09519614, -1.008732, 0.654902, 1, 0, 1,
-0.7657815, -0.9021596, -1.289148, 0.6509804, 1, 0, 1,
-0.7595208, -0.1199267, -0.9980829, 0.6431373, 1, 0, 1,
-0.7541515, -0.8865289, -2.661292, 0.6392157, 1, 0, 1,
-0.7497742, 0.5436934, -1.807889, 0.6313726, 1, 0, 1,
-0.7479014, -1.263862, -1.056328, 0.627451, 1, 0, 1,
-0.7463819, -1.257806, -2.171143, 0.6196079, 1, 0, 1,
-0.7460901, 1.984969, 0.4031679, 0.6156863, 1, 0, 1,
-0.7439967, 1.003579, 0.7989129, 0.6078432, 1, 0, 1,
-0.7421387, 0.02138299, -2.570315, 0.6039216, 1, 0, 1,
-0.741449, 0.08232445, -2.091029, 0.5960785, 1, 0, 1,
-0.7352113, 1.856288, 0.2571271, 0.5882353, 1, 0, 1,
-0.7240779, 0.4510981, -0.1928353, 0.5843138, 1, 0, 1,
-0.7203618, 0.7033775, -0.3915836, 0.5764706, 1, 0, 1,
-0.7098791, -0.3627281, -2.489829, 0.572549, 1, 0, 1,
-0.6868296, 0.1108215, -1.96459, 0.5647059, 1, 0, 1,
-0.6807848, 1.37721, -0.1099771, 0.5607843, 1, 0, 1,
-0.6765354, -1.154015, -2.892184, 0.5529412, 1, 0, 1,
-0.6688467, -0.214726, -1.163081, 0.5490196, 1, 0, 1,
-0.6663852, 0.7529076, -0.988323, 0.5411765, 1, 0, 1,
-0.662705, 0.4076988, -3.252193, 0.5372549, 1, 0, 1,
-0.6608495, -2.141063, -4.550917, 0.5294118, 1, 0, 1,
-0.6600502, 1.135226, -0.5417584, 0.5254902, 1, 0, 1,
-0.6583146, 1.416631, -1.620887, 0.5176471, 1, 0, 1,
-0.656643, -1.507669, -3.391781, 0.5137255, 1, 0, 1,
-0.6560162, 1.417747, 0.6809824, 0.5058824, 1, 0, 1,
-0.6505017, 0.3790638, -0.5729358, 0.5019608, 1, 0, 1,
-0.648794, 0.2089267, -0.9180642, 0.4941176, 1, 0, 1,
-0.6398085, -2.126543, -3.768559, 0.4862745, 1, 0, 1,
-0.6325449, 1.007759, -0.5868484, 0.4823529, 1, 0, 1,
-0.6320189, 0.0006731552, 2.10357, 0.4745098, 1, 0, 1,
-0.6304317, 0.9634497, 0.8843945, 0.4705882, 1, 0, 1,
-0.6288956, 1.533571, 0.6684836, 0.4627451, 1, 0, 1,
-0.6239222, -0.6724583, -2.590895, 0.4588235, 1, 0, 1,
-0.6196075, -0.5963166, -3.986228, 0.4509804, 1, 0, 1,
-0.6190026, -2.725628, -3.349754, 0.4470588, 1, 0, 1,
-0.6102748, 0.9667796, 0.03255767, 0.4392157, 1, 0, 1,
-0.6097017, 0.2383707, 0.5310299, 0.4352941, 1, 0, 1,
-0.6071927, -1.230987, -1.002706, 0.427451, 1, 0, 1,
-0.6057073, 0.04136064, -1.765474, 0.4235294, 1, 0, 1,
-0.6023152, 1.160936, -0.6506593, 0.4156863, 1, 0, 1,
-0.5990651, 1.359207, 0.1961408, 0.4117647, 1, 0, 1,
-0.5937486, 1.040734, 0.3999464, 0.4039216, 1, 0, 1,
-0.5827567, 0.6320802, -1.350118, 0.3960784, 1, 0, 1,
-0.579029, 2.139493, 0.03935992, 0.3921569, 1, 0, 1,
-0.5790036, -1.504454, -3.703884, 0.3843137, 1, 0, 1,
-0.577799, -0.02705261, -3.955234, 0.3803922, 1, 0, 1,
-0.5716586, 0.2993469, -2.682473, 0.372549, 1, 0, 1,
-0.5694975, 2.261305, 0.6912663, 0.3686275, 1, 0, 1,
-0.5646514, 1.351492, 0.1220788, 0.3607843, 1, 0, 1,
-0.5640089, 0.4128924, -0.2601469, 0.3568628, 1, 0, 1,
-0.5552036, 0.1333284, -1.684456, 0.3490196, 1, 0, 1,
-0.5531569, -1.869343, -2.285046, 0.345098, 1, 0, 1,
-0.5514711, 0.7734905, -1.292921, 0.3372549, 1, 0, 1,
-0.5492871, 0.4713458, -1.332922, 0.3333333, 1, 0, 1,
-0.5469957, 0.03843985, -1.46844, 0.3254902, 1, 0, 1,
-0.5431984, -0.3687452, -2.075298, 0.3215686, 1, 0, 1,
-0.5402794, -0.284791, -3.161493, 0.3137255, 1, 0, 1,
-0.539359, -0.03506469, -0.5619187, 0.3098039, 1, 0, 1,
-0.5382417, -0.1718093, -0.5338885, 0.3019608, 1, 0, 1,
-0.5379334, 0.04902989, -0.1430485, 0.2941177, 1, 0, 1,
-0.5365948, 0.1613457, -1.926995, 0.2901961, 1, 0, 1,
-0.5330554, -0.5618901, -2.606198, 0.282353, 1, 0, 1,
-0.5291074, -0.6687281, -2.839372, 0.2784314, 1, 0, 1,
-0.5280987, 0.5559425, -0.8407079, 0.2705882, 1, 0, 1,
-0.5278116, 0.6685886, -0.822124, 0.2666667, 1, 0, 1,
-0.5216023, 1.422882, -1.126623, 0.2588235, 1, 0, 1,
-0.5214556, -1.088022, -2.60291, 0.254902, 1, 0, 1,
-0.52116, -0.7702373, 0.2810379, 0.2470588, 1, 0, 1,
-0.520238, 0.3667168, -0.5934171, 0.2431373, 1, 0, 1,
-0.519439, -0.4602605, -0.4032914, 0.2352941, 1, 0, 1,
-0.5189476, -0.2289299, -1.247878, 0.2313726, 1, 0, 1,
-0.5185052, 1.011478, 0.4016141, 0.2235294, 1, 0, 1,
-0.5174436, -1.027201, -0.6096561, 0.2196078, 1, 0, 1,
-0.5171716, -0.6518374, -3.41734, 0.2117647, 1, 0, 1,
-0.51583, 1.253078, -1.190243, 0.2078431, 1, 0, 1,
-0.515247, 0.973671, 0.6357645, 0.2, 1, 0, 1,
-0.5136046, 0.2157725, -1.932996, 0.1921569, 1, 0, 1,
-0.5121292, 0.3153909, -0.7703542, 0.1882353, 1, 0, 1,
-0.5051225, 0.1168406, -3.166476, 0.1803922, 1, 0, 1,
-0.4960621, -0.3147956, -3.131881, 0.1764706, 1, 0, 1,
-0.4939022, 0.4465016, -0.4124062, 0.1686275, 1, 0, 1,
-0.4873599, -0.9786824, -2.921165, 0.1647059, 1, 0, 1,
-0.4866055, 0.5562644, -1.511731, 0.1568628, 1, 0, 1,
-0.4845494, 1.406682, -0.8245669, 0.1529412, 1, 0, 1,
-0.4828694, -1.598458, -1.087361, 0.145098, 1, 0, 1,
-0.4827718, -0.7851887, -1.953984, 0.1411765, 1, 0, 1,
-0.466092, -1.880026, -2.553149, 0.1333333, 1, 0, 1,
-0.4613492, -0.7690729, -2.743505, 0.1294118, 1, 0, 1,
-0.4574643, -1.428925, -2.388677, 0.1215686, 1, 0, 1,
-0.4549598, 1.187979, 0.06595028, 0.1176471, 1, 0, 1,
-0.4497093, 0.3701862, -1.149582, 0.1098039, 1, 0, 1,
-0.4445067, 0.8567913, -0.1103219, 0.1058824, 1, 0, 1,
-0.4428214, -1.188892, -2.729374, 0.09803922, 1, 0, 1,
-0.4354974, 0.215756, -0.5309094, 0.09019608, 1, 0, 1,
-0.4349156, 0.4762188, -2.279185, 0.08627451, 1, 0, 1,
-0.4328708, 1.219108, 1.876765, 0.07843138, 1, 0, 1,
-0.4318995, -0.03855981, -1.909289, 0.07450981, 1, 0, 1,
-0.4317577, 0.2971871, 0.1339633, 0.06666667, 1, 0, 1,
-0.4292596, 0.4371992, -0.732904, 0.0627451, 1, 0, 1,
-0.428105, -0.05370643, -1.295487, 0.05490196, 1, 0, 1,
-0.4200087, 1.801893, -2.847272, 0.05098039, 1, 0, 1,
-0.4177219, -0.7768399, -4.512795, 0.04313726, 1, 0, 1,
-0.4159641, 1.225847, -1.163493, 0.03921569, 1, 0, 1,
-0.4109111, -0.9507754, -2.879489, 0.03137255, 1, 0, 1,
-0.4107755, -0.9161425, -1.947539, 0.02745098, 1, 0, 1,
-0.4096416, -0.9324313, -2.011085, 0.01960784, 1, 0, 1,
-0.407242, 0.602887, -1.489972, 0.01568628, 1, 0, 1,
-0.4060829, -0.2042494, -2.408676, 0.007843138, 1, 0, 1,
-0.4029859, 0.5554666, -1.003085, 0.003921569, 1, 0, 1,
-0.4023887, 0.5576103, -1.908708, 0, 1, 0.003921569, 1,
-0.4017613, -1.17466, -1.609472, 0, 1, 0.01176471, 1,
-0.4001345, -0.7379719, -3.215266, 0, 1, 0.01568628, 1,
-0.3987488, 1.824524, 0.7966167, 0, 1, 0.02352941, 1,
-0.3875174, -1.158276, -3.776971, 0, 1, 0.02745098, 1,
-0.3820417, -1.728693, -2.546254, 0, 1, 0.03529412, 1,
-0.375575, 1.010657, -0.8363928, 0, 1, 0.03921569, 1,
-0.3703502, -0.4993354, -2.338114, 0, 1, 0.04705882, 1,
-0.3700962, -0.9506648, -2.39766, 0, 1, 0.05098039, 1,
-0.3653526, -0.2069537, -3.199273, 0, 1, 0.05882353, 1,
-0.3622498, 0.09732049, -0.7964023, 0, 1, 0.0627451, 1,
-0.3614497, -0.8061293, -1.396219, 0, 1, 0.07058824, 1,
-0.360891, -0.7154952, -2.341193, 0, 1, 0.07450981, 1,
-0.3570444, 0.6817085, -2.116501, 0, 1, 0.08235294, 1,
-0.3549203, -0.2444336, -3.819018, 0, 1, 0.08627451, 1,
-0.3538563, 1.397439, -1.421792, 0, 1, 0.09411765, 1,
-0.3526014, -0.6700606, -3.358943, 0, 1, 0.1019608, 1,
-0.3515864, 0.4390738, -2.056035, 0, 1, 0.1058824, 1,
-0.3501328, -0.3826248, -2.887583, 0, 1, 0.1137255, 1,
-0.3420424, -0.8203471, -2.800995, 0, 1, 0.1176471, 1,
-0.3405726, 0.8209527, -1.278856, 0, 1, 0.1254902, 1,
-0.3376332, 0.4990943, -0.01941677, 0, 1, 0.1294118, 1,
-0.3301721, -0.40848, -2.118604, 0, 1, 0.1372549, 1,
-0.3279495, -0.6500672, -4.169003, 0, 1, 0.1411765, 1,
-0.3274204, -0.6765946, -4.497108, 0, 1, 0.1490196, 1,
-0.3252755, 0.5654219, -0.2923556, 0, 1, 0.1529412, 1,
-0.3241985, 0.03380056, 0.4304889, 0, 1, 0.1607843, 1,
-0.3203848, 0.1997407, -0.5173677, 0, 1, 0.1647059, 1,
-0.3196873, -0.8599328, -2.646127, 0, 1, 0.172549, 1,
-0.3184686, -1.254388, -3.84893, 0, 1, 0.1764706, 1,
-0.317937, 1.164887, -1.09685, 0, 1, 0.1843137, 1,
-0.314528, -2.425214, -0.7100186, 0, 1, 0.1882353, 1,
-0.3134936, 0.4921313, 0.4211228, 0, 1, 0.1960784, 1,
-0.3121329, 0.5342053, -2.343204, 0, 1, 0.2039216, 1,
-0.3109607, -0.7469518, -3.614232, 0, 1, 0.2078431, 1,
-0.3078564, 0.9820268, -1.917026, 0, 1, 0.2156863, 1,
-0.3078475, 1.80878, 0.2691196, 0, 1, 0.2196078, 1,
-0.304818, -0.225122, -2.419173, 0, 1, 0.227451, 1,
-0.3045067, 0.04597714, -2.28912, 0, 1, 0.2313726, 1,
-0.2999923, 0.5884066, -1.405897, 0, 1, 0.2392157, 1,
-0.2939724, -0.8188503, -4.044779, 0, 1, 0.2431373, 1,
-0.2931938, 1.173589, 0.8298212, 0, 1, 0.2509804, 1,
-0.2873572, 1.540124, -1.37998, 0, 1, 0.254902, 1,
-0.2866521, -0.1455021, -1.167757, 0, 1, 0.2627451, 1,
-0.2864802, 0.9916518, -0.3899062, 0, 1, 0.2666667, 1,
-0.2854273, -1.045372, -2.674417, 0, 1, 0.2745098, 1,
-0.2834699, -0.3681448, -3.238723, 0, 1, 0.2784314, 1,
-0.281874, -1.113525, -3.661941, 0, 1, 0.2862745, 1,
-0.2815333, -0.1493247, -1.065701, 0, 1, 0.2901961, 1,
-0.2791753, 0.2339803, -2.367981, 0, 1, 0.2980392, 1,
-0.2761146, -0.8438259, -3.66632, 0, 1, 0.3058824, 1,
-0.2744055, -0.7742473, -3.222425, 0, 1, 0.3098039, 1,
-0.2739478, -1.211047, -4.096409, 0, 1, 0.3176471, 1,
-0.267128, -0.1823481, -2.29985, 0, 1, 0.3215686, 1,
-0.2665226, -1.283596, -2.957537, 0, 1, 0.3294118, 1,
-0.2583134, -0.6565456, -2.991062, 0, 1, 0.3333333, 1,
-0.2574103, 1.011133, -0.3738275, 0, 1, 0.3411765, 1,
-0.2555429, -1.321081, -4.106867, 0, 1, 0.345098, 1,
-0.2511769, -0.8332896, -2.183795, 0, 1, 0.3529412, 1,
-0.2484257, -0.616821, -3.74946, 0, 1, 0.3568628, 1,
-0.2446063, -0.7066641, -2.009017, 0, 1, 0.3647059, 1,
-0.2432204, 0.2745774, -1.250041, 0, 1, 0.3686275, 1,
-0.2412055, -0.1570855, -1.441665, 0, 1, 0.3764706, 1,
-0.2401966, -0.1713594, -0.2863106, 0, 1, 0.3803922, 1,
-0.2375943, 0.3089122, -1.512291, 0, 1, 0.3882353, 1,
-0.2345871, -0.8047806, -3.089336, 0, 1, 0.3921569, 1,
-0.2345618, 1.538672, 0.2501034, 0, 1, 0.4, 1,
-0.231608, -0.1111175, -1.924653, 0, 1, 0.4078431, 1,
-0.2305943, 0.3021719, -2.668295, 0, 1, 0.4117647, 1,
-0.2300117, -0.9103665, -1.808235, 0, 1, 0.4196078, 1,
-0.2293186, 0.02356485, -1.940978, 0, 1, 0.4235294, 1,
-0.2262207, -0.4733961, -4.625992, 0, 1, 0.4313726, 1,
-0.2234064, 0.4709426, 0.5463954, 0, 1, 0.4352941, 1,
-0.2210592, 1.013842, -0.7641584, 0, 1, 0.4431373, 1,
-0.2191388, -0.001929834, -1.921717, 0, 1, 0.4470588, 1,
-0.2148791, 0.7987804, -0.7064566, 0, 1, 0.454902, 1,
-0.2146663, 0.4360992, 1.674065, 0, 1, 0.4588235, 1,
-0.2085526, 0.9618722, 0.552201, 0, 1, 0.4666667, 1,
-0.2080945, 0.709236, -0.9608503, 0, 1, 0.4705882, 1,
-0.1972703, 0.6893418, 0.3515698, 0, 1, 0.4784314, 1,
-0.1970235, -0.4400097, -2.262541, 0, 1, 0.4823529, 1,
-0.196171, 1.501882, -1.451553, 0, 1, 0.4901961, 1,
-0.1947282, -0.541459, -1.526276, 0, 1, 0.4941176, 1,
-0.1934057, -1.199672, -3.004829, 0, 1, 0.5019608, 1,
-0.1914884, -0.4274096, -2.318905, 0, 1, 0.509804, 1,
-0.1852185, -0.4107804, -3.74874, 0, 1, 0.5137255, 1,
-0.1834183, -1.352274, -3.827772, 0, 1, 0.5215687, 1,
-0.1789979, 1.426635, -0.2870071, 0, 1, 0.5254902, 1,
-0.1682745, -0.3586333, -2.799065, 0, 1, 0.5333334, 1,
-0.1677226, 0.7208329, -1.569254, 0, 1, 0.5372549, 1,
-0.1673134, -0.09164573, -3.866403, 0, 1, 0.5450981, 1,
-0.1662733, 1.142861, -1.335332, 0, 1, 0.5490196, 1,
-0.1659197, -0.2017207, -1.585643, 0, 1, 0.5568628, 1,
-0.1649772, -0.8740197, -2.889752, 0, 1, 0.5607843, 1,
-0.1634636, -1.536368, -1.406337, 0, 1, 0.5686275, 1,
-0.1597536, 0.984275, 1.090465, 0, 1, 0.572549, 1,
-0.159217, -0.4830609, -3.050897, 0, 1, 0.5803922, 1,
-0.1555473, -1.279389, -1.998196, 0, 1, 0.5843138, 1,
-0.1531463, -0.1189778, -2.327729, 0, 1, 0.5921569, 1,
-0.1480237, -0.5830163, -4.482957, 0, 1, 0.5960785, 1,
-0.1476648, 0.2824178, -0.3169331, 0, 1, 0.6039216, 1,
-0.1442897, 1.526571, 0.6785994, 0, 1, 0.6117647, 1,
-0.1442774, -0.3437593, -3.350235, 0, 1, 0.6156863, 1,
-0.1401803, -2.357409, -3.549965, 0, 1, 0.6235294, 1,
-0.1380737, 0.9204438, 0.2358573, 0, 1, 0.627451, 1,
-0.1329726, -0.7739502, -2.551452, 0, 1, 0.6352941, 1,
-0.1317592, 0.8367615, -1.45726, 0, 1, 0.6392157, 1,
-0.130501, -0.936506, -2.23911, 0, 1, 0.6470588, 1,
-0.1300326, 0.6433533, -0.5040217, 0, 1, 0.6509804, 1,
-0.1290028, 1.792459, 1.448818, 0, 1, 0.6588235, 1,
-0.1261573, 0.6396384, -0.431895, 0, 1, 0.6627451, 1,
-0.1231723, -0.3210042, -2.219987, 0, 1, 0.6705883, 1,
-0.1211763, 0.3148504, -0.2122668, 0, 1, 0.6745098, 1,
-0.1174822, -1.511867, -3.865309, 0, 1, 0.682353, 1,
-0.1152267, 0.5429552, -0.1825294, 0, 1, 0.6862745, 1,
-0.1034872, 0.7605875, -1.331506, 0, 1, 0.6941177, 1,
-0.1005077, 0.429474, 0.303388, 0, 1, 0.7019608, 1,
-0.09551858, -1.682318, -2.750538, 0, 1, 0.7058824, 1,
-0.09485485, 0.7529271, -1.326213, 0, 1, 0.7137255, 1,
-0.09231748, -0.4178987, -3.601792, 0, 1, 0.7176471, 1,
-0.08515766, -1.445822, -2.51139, 0, 1, 0.7254902, 1,
-0.08190763, -0.3547966, -0.6640069, 0, 1, 0.7294118, 1,
-0.08108115, -0.8728188, -2.208922, 0, 1, 0.7372549, 1,
-0.07165509, -1.242932, -1.813567, 0, 1, 0.7411765, 1,
-0.06744342, -1.706408, -2.77279, 0, 1, 0.7490196, 1,
-0.06575581, -1.102515, -3.677544, 0, 1, 0.7529412, 1,
-0.06491446, -0.3536546, -3.34148, 0, 1, 0.7607843, 1,
-0.06484373, -0.6372294, -3.31544, 0, 1, 0.7647059, 1,
-0.0637177, 0.4196564, -0.8927799, 0, 1, 0.772549, 1,
-0.06127098, -2.36062, -2.040835, 0, 1, 0.7764706, 1,
-0.06105005, -1.479281, -3.527553, 0, 1, 0.7843137, 1,
-0.0583405, -2.449541, -3.085646, 0, 1, 0.7882353, 1,
-0.05790676, 0.1190703, -1.622735, 0, 1, 0.7960784, 1,
-0.05673289, -0.5628324, -2.28891, 0, 1, 0.8039216, 1,
-0.05569239, -0.9492896, -3.666936, 0, 1, 0.8078431, 1,
-0.05336789, 0.1021148, -0.1864598, 0, 1, 0.8156863, 1,
-0.05245937, 0.9992393, 1.147103, 0, 1, 0.8196079, 1,
-0.04988878, -0.6770554, -2.573198, 0, 1, 0.827451, 1,
-0.04632946, 2.297567, -1.327579, 0, 1, 0.8313726, 1,
-0.04249924, -0.350295, -3.980315, 0, 1, 0.8392157, 1,
-0.04134703, -1.621248, -3.58913, 0, 1, 0.8431373, 1,
-0.03829699, 0.8853648, -1.148605, 0, 1, 0.8509804, 1,
-0.03635745, 0.5010545, -0.01729463, 0, 1, 0.854902, 1,
-0.03543628, 1.429438, -0.1563547, 0, 1, 0.8627451, 1,
-0.03411706, 0.5984976, -1.943311, 0, 1, 0.8666667, 1,
-0.03262704, -0.8937212, -4.698893, 0, 1, 0.8745098, 1,
-0.03137389, 0.7160438, -2.587125, 0, 1, 0.8784314, 1,
-0.02797141, 0.48116, -1.376046, 0, 1, 0.8862745, 1,
-0.02568988, 0.689864, 0.7623444, 0, 1, 0.8901961, 1,
-0.02506022, -0.5654605, -2.839727, 0, 1, 0.8980392, 1,
-0.02423231, -0.1142669, -3.504549, 0, 1, 0.9058824, 1,
-0.0225744, -1.236491, -3.331311, 0, 1, 0.9098039, 1,
-0.02175718, 0.1840153, -0.5009351, 0, 1, 0.9176471, 1,
-0.01850762, -0.1938799, -3.446264, 0, 1, 0.9215686, 1,
-0.01766406, 2.293729, 1.216097, 0, 1, 0.9294118, 1,
-0.0153003, 1.131995, 0.9760454, 0, 1, 0.9333333, 1,
-0.01428268, -1.972901, -3.202528, 0, 1, 0.9411765, 1,
-0.01246825, -0.8870707, -0.8718334, 0, 1, 0.945098, 1,
-0.01072612, -0.3688314, -1.426707, 0, 1, 0.9529412, 1,
-0.009779965, 0.1148495, 1.00163, 0, 1, 0.9568627, 1,
-0.008566034, -0.2978632, -2.067225, 0, 1, 0.9647059, 1,
-0.001827178, 0.1524962, 1.555568, 0, 1, 0.9686275, 1,
0.001317133, 0.3879854, 1.004816, 0, 1, 0.9764706, 1,
0.002588291, 0.3140099, -0.06595015, 0, 1, 0.9803922, 1,
0.002909498, -1.083328, 2.19514, 0, 1, 0.9882353, 1,
0.006677794, 1.494348, -0.9156371, 0, 1, 0.9921569, 1,
0.008934207, 1.265668, 0.4060602, 0, 1, 1, 1,
0.0213504, -1.026986, 2.392463, 0, 0.9921569, 1, 1,
0.0262913, -0.9828432, 2.199666, 0, 0.9882353, 1, 1,
0.0267457, -0.03287457, 2.564202, 0, 0.9803922, 1, 1,
0.04013498, -0.5145774, 4.206679, 0, 0.9764706, 1, 1,
0.04427123, 1.027774, -1.011358, 0, 0.9686275, 1, 1,
0.04747251, 0.5557948, 0.6946943, 0, 0.9647059, 1, 1,
0.04903717, 0.7338761, -0.4933261, 0, 0.9568627, 1, 1,
0.04934166, 0.4112289, -1.765088, 0, 0.9529412, 1, 1,
0.04960808, 1.063007, 1.750423, 0, 0.945098, 1, 1,
0.04985831, -0.4441423, 3.839464, 0, 0.9411765, 1, 1,
0.05003859, 0.4298845, 2.172416, 0, 0.9333333, 1, 1,
0.05381573, 1.528268, 1.067801, 0, 0.9294118, 1, 1,
0.05413149, 0.6630899, 0.3575779, 0, 0.9215686, 1, 1,
0.06043015, -0.8570231, 3.600916, 0, 0.9176471, 1, 1,
0.06169092, 0.06446179, 1.772203, 0, 0.9098039, 1, 1,
0.06533339, -1.253858, 1.77581, 0, 0.9058824, 1, 1,
0.06816147, 0.09967241, -1.148226, 0, 0.8980392, 1, 1,
0.06871857, -1.110657, 1.522337, 0, 0.8901961, 1, 1,
0.06926301, -0.04213268, 1.759412, 0, 0.8862745, 1, 1,
0.07024816, -0.6581547, 3.549852, 0, 0.8784314, 1, 1,
0.07600327, 0.6588103, 1.502825, 0, 0.8745098, 1, 1,
0.07811761, 1.031074, 0.1691915, 0, 0.8666667, 1, 1,
0.0782296, 1.156562, 1.477117, 0, 0.8627451, 1, 1,
0.07898501, -1.638915, 2.026879, 0, 0.854902, 1, 1,
0.08085717, -0.4247117, 3.47973, 0, 0.8509804, 1, 1,
0.08176287, 2.440887, 0.2241652, 0, 0.8431373, 1, 1,
0.08373363, -0.6910279, 3.513413, 0, 0.8392157, 1, 1,
0.08444902, -0.4913471, 2.202183, 0, 0.8313726, 1, 1,
0.09421417, 0.2737668, 0.2221023, 0, 0.827451, 1, 1,
0.09858155, -0.1660786, 0.1762853, 0, 0.8196079, 1, 1,
0.105305, -0.4550348, 1.919309, 0, 0.8156863, 1, 1,
0.1073699, 0.6385614, 2.241797, 0, 0.8078431, 1, 1,
0.1087737, -0.5608866, 3.717392, 0, 0.8039216, 1, 1,
0.1139566, -0.5487647, 2.374101, 0, 0.7960784, 1, 1,
0.1142558, -0.2351498, 3.783025, 0, 0.7882353, 1, 1,
0.1171087, -0.1007254, 2.567001, 0, 0.7843137, 1, 1,
0.123879, -0.5795505, 4.203003, 0, 0.7764706, 1, 1,
0.132732, -0.2064826, 0.5103527, 0, 0.772549, 1, 1,
0.133421, -1.050251, 2.30289, 0, 0.7647059, 1, 1,
0.1373255, -1.224251, 2.771407, 0, 0.7607843, 1, 1,
0.1409866, -2.102283, 3.633801, 0, 0.7529412, 1, 1,
0.1420803, 0.005488409, 1.502449, 0, 0.7490196, 1, 1,
0.1422426, -1.572809, 3.28607, 0, 0.7411765, 1, 1,
0.1478934, -0.4673676, 4.142904, 0, 0.7372549, 1, 1,
0.1503614, -0.1137806, 0.8652942, 0, 0.7294118, 1, 1,
0.1514151, -0.7398055, 1.586987, 0, 0.7254902, 1, 1,
0.1525192, 1.076612, 1.046331, 0, 0.7176471, 1, 1,
0.1575942, -0.4702861, 2.15977, 0, 0.7137255, 1, 1,
0.1593167, 0.8084812, 0.02153321, 0, 0.7058824, 1, 1,
0.1614117, 0.2005543, -1.144628, 0, 0.6980392, 1, 1,
0.1620312, -1.221469, 3.238328, 0, 0.6941177, 1, 1,
0.1638667, 0.3489434, 0.426208, 0, 0.6862745, 1, 1,
0.166801, -0.1299151, 2.806018, 0, 0.682353, 1, 1,
0.1695428, -0.04195221, 3.149922, 0, 0.6745098, 1, 1,
0.1703437, 1.325752, 0.3473368, 0, 0.6705883, 1, 1,
0.1746244, -1.070992, 2.486457, 0, 0.6627451, 1, 1,
0.1754881, 0.8382785, -0.2210915, 0, 0.6588235, 1, 1,
0.1803974, -0.2845587, 2.273679, 0, 0.6509804, 1, 1,
0.1845823, 1.084711, 0.7533478, 0, 0.6470588, 1, 1,
0.187415, 0.7214418, 1.368594, 0, 0.6392157, 1, 1,
0.1878365, 2.408984, -0.8058352, 0, 0.6352941, 1, 1,
0.197173, -0.2626088, 4.164405, 0, 0.627451, 1, 1,
0.200185, 0.3247743, 0.5004503, 0, 0.6235294, 1, 1,
0.2026713, 0.3521356, 0.8611243, 0, 0.6156863, 1, 1,
0.2031116, 0.3056633, 0.4693639, 0, 0.6117647, 1, 1,
0.2063863, 0.4662351, 0.3013807, 0, 0.6039216, 1, 1,
0.2109475, -0.9741474, 2.691111, 0, 0.5960785, 1, 1,
0.2147309, -1.128078, 1.564818, 0, 0.5921569, 1, 1,
0.221301, -0.06959055, 1.097336, 0, 0.5843138, 1, 1,
0.2222343, 0.0006081988, 0.2804786, 0, 0.5803922, 1, 1,
0.2222875, 0.4085004, 0.2207882, 0, 0.572549, 1, 1,
0.2295928, 0.2052847, 1.542965, 0, 0.5686275, 1, 1,
0.2379095, -3.556835, 2.998021, 0, 0.5607843, 1, 1,
0.2382222, -0.4074319, 0.7471908, 0, 0.5568628, 1, 1,
0.2397381, 0.6981981, -0.4460701, 0, 0.5490196, 1, 1,
0.2423472, -0.351078, 2.756821, 0, 0.5450981, 1, 1,
0.2444171, 1.762732, -0.2092051, 0, 0.5372549, 1, 1,
0.2449716, -0.8520803, 3.684368, 0, 0.5333334, 1, 1,
0.2470325, -0.2530914, 3.464715, 0, 0.5254902, 1, 1,
0.2494011, -0.6659511, 2.690604, 0, 0.5215687, 1, 1,
0.2502815, -0.7294068, 3.521922, 0, 0.5137255, 1, 1,
0.2513607, -0.9433125, 2.976512, 0, 0.509804, 1, 1,
0.2575682, -0.3994761, 2.772991, 0, 0.5019608, 1, 1,
0.2601288, -0.1534206, 4.257353, 0, 0.4941176, 1, 1,
0.2621148, -0.9386867, 2.190955, 0, 0.4901961, 1, 1,
0.2628366, -0.5465631, 2.363828, 0, 0.4823529, 1, 1,
0.2650971, -0.02820249, 1.573565, 0, 0.4784314, 1, 1,
0.2652279, 0.6275045, 0.120517, 0, 0.4705882, 1, 1,
0.2665117, -1.083708, 0.7214317, 0, 0.4666667, 1, 1,
0.2692143, -0.3532385, 2.277992, 0, 0.4588235, 1, 1,
0.2698074, -2.240883, 2.713737, 0, 0.454902, 1, 1,
0.2701717, 0.5294558, 0.2943015, 0, 0.4470588, 1, 1,
0.2706981, 0.2943763, 0.9676437, 0, 0.4431373, 1, 1,
0.2708475, 0.142251, 2.763887, 0, 0.4352941, 1, 1,
0.2712969, -0.01748009, 0.06532681, 0, 0.4313726, 1, 1,
0.2760887, 0.6463636, 0.3949321, 0, 0.4235294, 1, 1,
0.2767833, 2.000258, -1.002885, 0, 0.4196078, 1, 1,
0.2823508, -0.7113969, 2.073069, 0, 0.4117647, 1, 1,
0.2828697, -0.688856, 1.816787, 0, 0.4078431, 1, 1,
0.2834339, 0.1966912, 0.7534955, 0, 0.4, 1, 1,
0.2841931, -1.610418, 1.714322, 0, 0.3921569, 1, 1,
0.2855142, -0.3541798, 2.986971, 0, 0.3882353, 1, 1,
0.2866892, -0.5187134, 2.426474, 0, 0.3803922, 1, 1,
0.291418, 2.428745, 1.475714, 0, 0.3764706, 1, 1,
0.29173, 1.636702, 0.8291813, 0, 0.3686275, 1, 1,
0.2933225, 0.0710552, 0.3565019, 0, 0.3647059, 1, 1,
0.3030877, 2.839686, -0.3172114, 0, 0.3568628, 1, 1,
0.3040573, -0.140263, 2.198696, 0, 0.3529412, 1, 1,
0.304286, 0.007983883, 2.218051, 0, 0.345098, 1, 1,
0.3054845, -1.42405, 4.101243, 0, 0.3411765, 1, 1,
0.3078154, 0.4725839, 0.8482267, 0, 0.3333333, 1, 1,
0.3104108, 1.005616, -0.6885355, 0, 0.3294118, 1, 1,
0.3108799, -1.561375, 3.067809, 0, 0.3215686, 1, 1,
0.3118012, 0.6532446, 1.149997, 0, 0.3176471, 1, 1,
0.3140905, 0.08764452, 0.5037062, 0, 0.3098039, 1, 1,
0.3189403, -0.02061466, 1.845391, 0, 0.3058824, 1, 1,
0.321566, -0.4614173, 2.829486, 0, 0.2980392, 1, 1,
0.3224258, 0.1509483, 2.501936, 0, 0.2901961, 1, 1,
0.3230965, 1.003723, -0.3619783, 0, 0.2862745, 1, 1,
0.3273886, 0.1543669, -0.209067, 0, 0.2784314, 1, 1,
0.3339565, -2.140185, 2.965212, 0, 0.2745098, 1, 1,
0.3343974, -0.06615462, 1.992333, 0, 0.2666667, 1, 1,
0.3376053, 0.4538948, 0.4787314, 0, 0.2627451, 1, 1,
0.3411261, -0.3065428, 2.5953, 0, 0.254902, 1, 1,
0.3537448, 0.3429267, 1.080277, 0, 0.2509804, 1, 1,
0.359349, -0.4758085, 3.178942, 0, 0.2431373, 1, 1,
0.3661803, -2.602509, 3.179226, 0, 0.2392157, 1, 1,
0.3699358, -1.571636, 4.878822, 0, 0.2313726, 1, 1,
0.37392, 0.6035984, 0.1535043, 0, 0.227451, 1, 1,
0.3776767, -1.807491, 3.889112, 0, 0.2196078, 1, 1,
0.3791689, -1.17015, 2.586903, 0, 0.2156863, 1, 1,
0.3837077, -0.3485152, 0.8821002, 0, 0.2078431, 1, 1,
0.3868951, 0.7881755, 1.533136, 0, 0.2039216, 1, 1,
0.3893819, 0.2138785, 0.7608613, 0, 0.1960784, 1, 1,
0.3894803, 0.2131433, 2.28067, 0, 0.1882353, 1, 1,
0.3905987, 2.014578, 0.4718336, 0, 0.1843137, 1, 1,
0.3932669, -0.306168, 1.810237, 0, 0.1764706, 1, 1,
0.3953521, 1.261243, -0.1683959, 0, 0.172549, 1, 1,
0.3998926, -0.1264002, 2.419255, 0, 0.1647059, 1, 1,
0.4032631, -0.4758044, 3.457479, 0, 0.1607843, 1, 1,
0.4060177, 1.531252, 0.6563334, 0, 0.1529412, 1, 1,
0.4060639, 1.310264, -0.5210723, 0, 0.1490196, 1, 1,
0.406736, 1.591132, -0.9153723, 0, 0.1411765, 1, 1,
0.4099284, -1.793279, 3.092749, 0, 0.1372549, 1, 1,
0.4102396, -0.7917936, 1.453025, 0, 0.1294118, 1, 1,
0.4132249, 0.005067973, 2.68556, 0, 0.1254902, 1, 1,
0.4177935, -1.792002, 2.901489, 0, 0.1176471, 1, 1,
0.421798, 0.04327637, 1.835232, 0, 0.1137255, 1, 1,
0.4225134, 2.27259, 0.5670912, 0, 0.1058824, 1, 1,
0.4243718, -0.2539276, 1.881489, 0, 0.09803922, 1, 1,
0.4243809, 0.3746874, 0.600367, 0, 0.09411765, 1, 1,
0.4247835, -0.612102, -1.021356, 0, 0.08627451, 1, 1,
0.4321698, -1.999492, 3.363963, 0, 0.08235294, 1, 1,
0.4324691, 0.6382957, -0.6497309, 0, 0.07450981, 1, 1,
0.4383596, 1.285828, -1.135371, 0, 0.07058824, 1, 1,
0.4410722, -0.3567405, 1.92391, 0, 0.0627451, 1, 1,
0.441727, 0.9317552, 0.5197903, 0, 0.05882353, 1, 1,
0.4421569, 0.5401999, 2.811891, 0, 0.05098039, 1, 1,
0.448926, -1.025222, 1.924972, 0, 0.04705882, 1, 1,
0.4500927, -1.092605, 2.043071, 0, 0.03921569, 1, 1,
0.453835, -0.4841601, 2.530594, 0, 0.03529412, 1, 1,
0.4559763, 1.918368, -0.254131, 0, 0.02745098, 1, 1,
0.4615662, -1.281344, 1.325261, 0, 0.02352941, 1, 1,
0.4616545, -1.307999, 2.60278, 0, 0.01568628, 1, 1,
0.4616733, -1.961125, 1.982073, 0, 0.01176471, 1, 1,
0.4683023, 1.158917, 0.8231221, 0, 0.003921569, 1, 1,
0.4684712, 0.5521166, -0.528596, 0.003921569, 0, 1, 1,
0.473215, -1.172575, 3.579055, 0.007843138, 0, 1, 1,
0.4749952, -1.030861, 3.37162, 0.01568628, 0, 1, 1,
0.4753412, 0.9202546, -0.5544179, 0.01960784, 0, 1, 1,
0.4771975, -1.125326, 1.175268, 0.02745098, 0, 1, 1,
0.4790691, -0.4457996, 2.254909, 0.03137255, 0, 1, 1,
0.4799889, 0.2091395, 0.9900545, 0.03921569, 0, 1, 1,
0.4814769, 0.3537983, 1.11433, 0.04313726, 0, 1, 1,
0.4905618, -0.3160678, 0.4460776, 0.05098039, 0, 1, 1,
0.4974463, 0.9966297, -0.1578139, 0.05490196, 0, 1, 1,
0.4976267, -0.5732682, 2.845448, 0.0627451, 0, 1, 1,
0.4996544, -0.2875037, 2.961659, 0.06666667, 0, 1, 1,
0.500262, -0.2632311, 1.857257, 0.07450981, 0, 1, 1,
0.5028898, 0.5937082, 1.263266, 0.07843138, 0, 1, 1,
0.5053564, -0.1783858, 1.01273, 0.08627451, 0, 1, 1,
0.5096916, 0.5242069, 1.080989, 0.09019608, 0, 1, 1,
0.5122102, 1.267934, -1.562441, 0.09803922, 0, 1, 1,
0.5148627, -0.518551, 2.862975, 0.1058824, 0, 1, 1,
0.5159268, -0.5077744, 1.92573, 0.1098039, 0, 1, 1,
0.5187954, -0.5667243, 0.6352753, 0.1176471, 0, 1, 1,
0.5193136, -1.454133, 1.285855, 0.1215686, 0, 1, 1,
0.5195826, 0.08735438, 2.36058, 0.1294118, 0, 1, 1,
0.5196149, 0.7302881, 1.402709, 0.1333333, 0, 1, 1,
0.5237532, -0.9413494, 1.908669, 0.1411765, 0, 1, 1,
0.5255764, 1.083349, 0.9613422, 0.145098, 0, 1, 1,
0.5267438, 0.1234059, 2.303378, 0.1529412, 0, 1, 1,
0.5334748, 0.4975268, -0.0555112, 0.1568628, 0, 1, 1,
0.5375431, 1.370946, 1.944106, 0.1647059, 0, 1, 1,
0.5405335, -2.103623, 1.951596, 0.1686275, 0, 1, 1,
0.5432449, -1.632917, 3.452966, 0.1764706, 0, 1, 1,
0.5439811, -2.484304, 2.716741, 0.1803922, 0, 1, 1,
0.5484416, -0.4651754, 2.545126, 0.1882353, 0, 1, 1,
0.5523847, 0.4816634, 0.8430752, 0.1921569, 0, 1, 1,
0.5556896, -0.3956037, 2.001168, 0.2, 0, 1, 1,
0.5559986, -1.349472, 1.64773, 0.2078431, 0, 1, 1,
0.5560302, 1.037568, 0.716413, 0.2117647, 0, 1, 1,
0.5678353, -1.280455, 3.740603, 0.2196078, 0, 1, 1,
0.5722102, 0.6143696, 1.129925, 0.2235294, 0, 1, 1,
0.5752496, -0.2444866, 1.191564, 0.2313726, 0, 1, 1,
0.5764754, 1.104359, -1.207515, 0.2352941, 0, 1, 1,
0.5791996, -0.4740032, 1.761871, 0.2431373, 0, 1, 1,
0.579634, 0.597002, 1.918471, 0.2470588, 0, 1, 1,
0.5871954, 1.18324, 0.5397927, 0.254902, 0, 1, 1,
0.592998, 0.9650881, -1.38849, 0.2588235, 0, 1, 1,
0.594806, -0.008338002, 0.4135222, 0.2666667, 0, 1, 1,
0.5973436, 0.3566957, 1.224068, 0.2705882, 0, 1, 1,
0.5973939, -0.2761536, 3.719966, 0.2784314, 0, 1, 1,
0.5999527, -0.1510584, 1.656798, 0.282353, 0, 1, 1,
0.6017381, -1.452554, 2.804312, 0.2901961, 0, 1, 1,
0.6061825, 0.3077863, 2.322619, 0.2941177, 0, 1, 1,
0.6080988, -1.242002, 3.026771, 0.3019608, 0, 1, 1,
0.6106508, -1.890159, 5.117599, 0.3098039, 0, 1, 1,
0.6131173, -0.4346088, 0.6178008, 0.3137255, 0, 1, 1,
0.6156254, 0.2746949, 1.293458, 0.3215686, 0, 1, 1,
0.6169203, 0.3270354, 1.771929, 0.3254902, 0, 1, 1,
0.6169987, 0.3877948, 1.76096, 0.3333333, 0, 1, 1,
0.6195408, 0.3998305, 0.316207, 0.3372549, 0, 1, 1,
0.621774, 0.1519508, 0.9020487, 0.345098, 0, 1, 1,
0.6222836, 1.080331, 0.7099835, 0.3490196, 0, 1, 1,
0.6231211, 1.274186, -0.7623824, 0.3568628, 0, 1, 1,
0.6232529, 0.9654157, -0.7285836, 0.3607843, 0, 1, 1,
0.623485, -0.05333436, 0.8570073, 0.3686275, 0, 1, 1,
0.6273992, 0.2229844, -0.4921363, 0.372549, 0, 1, 1,
0.630007, -0.2117815, 2.258431, 0.3803922, 0, 1, 1,
0.6302146, -1.305466, 2.961548, 0.3843137, 0, 1, 1,
0.6321908, 0.3879109, 2.016679, 0.3921569, 0, 1, 1,
0.6346715, -1.989967, 3.445022, 0.3960784, 0, 1, 1,
0.6371261, 0.1288198, 0.2722766, 0.4039216, 0, 1, 1,
0.6391485, 1.17785, 0.1560725, 0.4117647, 0, 1, 1,
0.6396134, 0.365252, 0.3620853, 0.4156863, 0, 1, 1,
0.6396951, -0.8011384, 4.040494, 0.4235294, 0, 1, 1,
0.6427505, -0.3952716, 0.70711, 0.427451, 0, 1, 1,
0.648614, 0.008836347, 1.987345, 0.4352941, 0, 1, 1,
0.6494734, 0.03903482, 3.491781, 0.4392157, 0, 1, 1,
0.6553431, -0.7371033, 3.121931, 0.4470588, 0, 1, 1,
0.6693079, -0.5318652, 1.340228, 0.4509804, 0, 1, 1,
0.6704602, -0.4064355, 2.163195, 0.4588235, 0, 1, 1,
0.6776565, -0.3514539, 1.478737, 0.4627451, 0, 1, 1,
0.6808386, -1.815171, 2.830355, 0.4705882, 0, 1, 1,
0.6838064, 0.7339544, 1.678336, 0.4745098, 0, 1, 1,
0.6904442, -0.3597617, 2.250947, 0.4823529, 0, 1, 1,
0.6921884, -0.1063025, 0.7207611, 0.4862745, 0, 1, 1,
0.6928217, -0.3524752, 1.433784, 0.4941176, 0, 1, 1,
0.6937057, 0.1111119, 0.2126904, 0.5019608, 0, 1, 1,
0.6949831, 0.2307583, 1.880615, 0.5058824, 0, 1, 1,
0.6979185, -2.419717, 2.908008, 0.5137255, 0, 1, 1,
0.7002492, 2.245769, 0.3601217, 0.5176471, 0, 1, 1,
0.7113299, 0.2906734, 2.277771, 0.5254902, 0, 1, 1,
0.7211865, 0.7394603, 0.7620862, 0.5294118, 0, 1, 1,
0.7212911, -0.1134462, 2.077708, 0.5372549, 0, 1, 1,
0.7214543, 0.8792645, 0.8114059, 0.5411765, 0, 1, 1,
0.7228871, 0.9601007, -0.1696509, 0.5490196, 0, 1, 1,
0.724056, -0.5014938, 1.553729, 0.5529412, 0, 1, 1,
0.7247747, -0.4468306, 2.39876, 0.5607843, 0, 1, 1,
0.7294528, -0.8905761, 1.573532, 0.5647059, 0, 1, 1,
0.7355294, 0.7663502, -0.505592, 0.572549, 0, 1, 1,
0.7365888, 1.381817, -0.2289284, 0.5764706, 0, 1, 1,
0.738179, 0.8536284, -0.4689783, 0.5843138, 0, 1, 1,
0.7382129, 1.192179, 1.90718, 0.5882353, 0, 1, 1,
0.7409418, 0.06297582, 0.5556079, 0.5960785, 0, 1, 1,
0.7578407, -0.5047089, 2.292784, 0.6039216, 0, 1, 1,
0.761583, 0.1313075, 2.412067, 0.6078432, 0, 1, 1,
0.7628292, 0.036026, 0.3477464, 0.6156863, 0, 1, 1,
0.7675173, 0.8654016, 0.0412025, 0.6196079, 0, 1, 1,
0.7683391, 0.02255465, 0.4819548, 0.627451, 0, 1, 1,
0.7694771, -0.01055018, 0.8623227, 0.6313726, 0, 1, 1,
0.7700964, 0.9054038, 1.244516, 0.6392157, 0, 1, 1,
0.7748609, -0.7600387, 2.604525, 0.6431373, 0, 1, 1,
0.7793064, 0.7934254, -1.244821, 0.6509804, 0, 1, 1,
0.7869931, -2.042938, 4.095996, 0.654902, 0, 1, 1,
0.7872636, -1.305245, 2.255038, 0.6627451, 0, 1, 1,
0.7902011, 0.7694153, 0.1648809, 0.6666667, 0, 1, 1,
0.7956672, 0.1097682, 2.110536, 0.6745098, 0, 1, 1,
0.7962819, -2.40379, 3.216408, 0.6784314, 0, 1, 1,
0.8016497, 1.325905, 0.3444004, 0.6862745, 0, 1, 1,
0.8046733, 2.183539, -0.9319453, 0.6901961, 0, 1, 1,
0.8120762, 0.8776942, -0.7933723, 0.6980392, 0, 1, 1,
0.8142793, 0.1021511, -0.5234529, 0.7058824, 0, 1, 1,
0.8189142, -0.8936997, 1.001261, 0.7098039, 0, 1, 1,
0.8207367, -2.377073, 2.134279, 0.7176471, 0, 1, 1,
0.8245131, 1.19852, 1.028279, 0.7215686, 0, 1, 1,
0.826106, 0.759691, 1.635967, 0.7294118, 0, 1, 1,
0.8284276, 0.4428898, 0.0561754, 0.7333333, 0, 1, 1,
0.8294185, 1.087089, 0.6400098, 0.7411765, 0, 1, 1,
0.8355318, -0.08383413, 2.551789, 0.7450981, 0, 1, 1,
0.8368343, -0.8896563, 2.910501, 0.7529412, 0, 1, 1,
0.8371506, -0.1592982, 1.617755, 0.7568628, 0, 1, 1,
0.8374885, -0.2059146, 2.399172, 0.7647059, 0, 1, 1,
0.8403648, 2.360498, -2.125165, 0.7686275, 0, 1, 1,
0.8444843, 0.0161165, 2.676383, 0.7764706, 0, 1, 1,
0.8505177, -0.4725839, 4.104913, 0.7803922, 0, 1, 1,
0.8554899, 0.4467892, 0.5935729, 0.7882353, 0, 1, 1,
0.8653848, -0.1612491, 2.495859, 0.7921569, 0, 1, 1,
0.8655143, 1.099235, 1.805691, 0.8, 0, 1, 1,
0.8707411, 0.973188, -2.014621, 0.8078431, 0, 1, 1,
0.8837053, 1.090981, -1.29138, 0.8117647, 0, 1, 1,
0.8857394, 0.4984729, 0.2379854, 0.8196079, 0, 1, 1,
0.8918209, 0.7124076, 2.947446, 0.8235294, 0, 1, 1,
0.8948801, -0.788662, 3.691305, 0.8313726, 0, 1, 1,
0.910555, 0.4658471, -0.04695237, 0.8352941, 0, 1, 1,
0.9143454, 1.504543, 0.4406153, 0.8431373, 0, 1, 1,
0.9207484, -1.437965, 2.691607, 0.8470588, 0, 1, 1,
0.9246014, 0.5812054, -0.1715078, 0.854902, 0, 1, 1,
0.9258903, -0.7896822, 3.954759, 0.8588235, 0, 1, 1,
0.9280102, -0.2517435, 2.081279, 0.8666667, 0, 1, 1,
0.9354718, -1.381056, 3.172317, 0.8705882, 0, 1, 1,
0.9390362, 0.8493807, 0.4364223, 0.8784314, 0, 1, 1,
0.9392419, 0.2262312, 1.822932, 0.8823529, 0, 1, 1,
0.9409202, -1.388256, 3.508663, 0.8901961, 0, 1, 1,
0.9427283, 0.06851148, 2.25474, 0.8941177, 0, 1, 1,
0.9453525, -1.229677, 1.410779, 0.9019608, 0, 1, 1,
0.9459441, 0.8015099, 0.450013, 0.9098039, 0, 1, 1,
0.9540914, -0.9454391, 1.521633, 0.9137255, 0, 1, 1,
0.9541025, 0.03245503, 1.10534, 0.9215686, 0, 1, 1,
0.9543681, -1.59644, 1.536991, 0.9254902, 0, 1, 1,
0.9544411, 1.53954, 1.312212, 0.9333333, 0, 1, 1,
0.9548373, 0.1500984, 1.345046, 0.9372549, 0, 1, 1,
0.9548866, 0.134795, 0.8608091, 0.945098, 0, 1, 1,
0.959582, 0.8908609, 1.0488, 0.9490196, 0, 1, 1,
0.9596763, 0.9342481, 4.038746, 0.9568627, 0, 1, 1,
0.9648135, -1.43827, 1.203149, 0.9607843, 0, 1, 1,
0.9678923, -0.236792, 0.7941399, 0.9686275, 0, 1, 1,
0.9694289, -2.24503, 2.908098, 0.972549, 0, 1, 1,
0.9699075, 1.049958, -0.2614776, 0.9803922, 0, 1, 1,
0.9764018, -1.319534, 4.823295, 0.9843137, 0, 1, 1,
0.9843876, 0.1976038, 2.896385, 0.9921569, 0, 1, 1,
0.9954734, 1.605661, 2.864965, 0.9960784, 0, 1, 1,
0.9976392, -0.2041513, 1.633562, 1, 0, 0.9960784, 1,
0.9998925, 0.641214, 0.2525068, 1, 0, 0.9882353, 1,
1.000791, 3.300552, -0.1137058, 1, 0, 0.9843137, 1,
1.00271, -0.3822973, 2.404165, 1, 0, 0.9764706, 1,
1.008803, 0.1515626, 4.161893, 1, 0, 0.972549, 1,
1.009812, 0.6974144, 2.124755, 1, 0, 0.9647059, 1,
1.011455, -1.141054, 1.153872, 1, 0, 0.9607843, 1,
1.011652, 0.1780421, 1.36114, 1, 0, 0.9529412, 1,
1.015349, 0.5442665, -0.1448341, 1, 0, 0.9490196, 1,
1.019565, -0.5579205, 2.722914, 1, 0, 0.9411765, 1,
1.022712, 0.40655, 2.071368, 1, 0, 0.9372549, 1,
1.023712, 0.06145981, 1.787734, 1, 0, 0.9294118, 1,
1.02503, 0.1601901, -0.2643099, 1, 0, 0.9254902, 1,
1.025467, -0.04573901, 0.6529008, 1, 0, 0.9176471, 1,
1.028207, 0.2256902, 1.656798, 1, 0, 0.9137255, 1,
1.02983, -0.4492857, 1.589904, 1, 0, 0.9058824, 1,
1.032395, -0.9985611, 3.048711, 1, 0, 0.9019608, 1,
1.034858, 0.4442266, 0.07138211, 1, 0, 0.8941177, 1,
1.038653, -0.6755563, 1.500748, 1, 0, 0.8862745, 1,
1.040458, 0.1061566, 1.616721, 1, 0, 0.8823529, 1,
1.042461, -1.339981, 3.71079, 1, 0, 0.8745098, 1,
1.045342, -0.9702035, 1.619912, 1, 0, 0.8705882, 1,
1.046624, 1.000346, -0.6408603, 1, 0, 0.8627451, 1,
1.052312, 2.337961, -0.2876072, 1, 0, 0.8588235, 1,
1.052465, -0.8329746, 0.9563978, 1, 0, 0.8509804, 1,
1.053305, 0.5811653, 1.458129, 1, 0, 0.8470588, 1,
1.053908, -0.06442422, 0.008554319, 1, 0, 0.8392157, 1,
1.054096, 0.2087637, 1.641914, 1, 0, 0.8352941, 1,
1.05583, 0.7609828, 0.3549125, 1, 0, 0.827451, 1,
1.056295, 1.991059, 0.72615, 1, 0, 0.8235294, 1,
1.063858, 0.4913898, 0.6457167, 1, 0, 0.8156863, 1,
1.070475, 0.5264754, 0.7547536, 1, 0, 0.8117647, 1,
1.075648, 0.6791528, 0.758826, 1, 0, 0.8039216, 1,
1.077252, 0.8971741, 1.963057, 1, 0, 0.7960784, 1,
1.078072, 0.7514845, 1.063613, 1, 0, 0.7921569, 1,
1.087013, 0.3962387, 2.034638, 1, 0, 0.7843137, 1,
1.093337, 1.038035, -0.9236658, 1, 0, 0.7803922, 1,
1.09956, 0.6498775, 1.690241, 1, 0, 0.772549, 1,
1.099818, -0.1749036, 0.3257166, 1, 0, 0.7686275, 1,
1.103192, 0.435888, 0.5403337, 1, 0, 0.7607843, 1,
1.103623, 0.2605754, 0.8746995, 1, 0, 0.7568628, 1,
1.109848, -1.468674, 3.355413, 1, 0, 0.7490196, 1,
1.110094, -0.03378175, 2.303696, 1, 0, 0.7450981, 1,
1.12167, 0.2204842, 1.066844, 1, 0, 0.7372549, 1,
1.126315, 1.913365, -0.6945335, 1, 0, 0.7333333, 1,
1.136925, 1.614231, 0.8581982, 1, 0, 0.7254902, 1,
1.138324, -1.587465, 2.151587, 1, 0, 0.7215686, 1,
1.144654, -1.093472, 2.87886, 1, 0, 0.7137255, 1,
1.169913, -1.170877, 2.879671, 1, 0, 0.7098039, 1,
1.170889, -0.5451686, -0.1486367, 1, 0, 0.7019608, 1,
1.171097, 0.3241138, 0.9819957, 1, 0, 0.6941177, 1,
1.177434, 0.5498371, 0.375599, 1, 0, 0.6901961, 1,
1.18103, -0.9931499, 3.293541, 1, 0, 0.682353, 1,
1.190265, 1.198494, 1.00351, 1, 0, 0.6784314, 1,
1.191023, -1.583535, 0.1381027, 1, 0, 0.6705883, 1,
1.194672, 0.2060955, 1.175872, 1, 0, 0.6666667, 1,
1.197934, 0.1729376, 0.6902894, 1, 0, 0.6588235, 1,
1.199608, -1.197144, 3.619538, 1, 0, 0.654902, 1,
1.201725, 0.4844156, -0.4482855, 1, 0, 0.6470588, 1,
1.218067, 1.004143, 2.003382, 1, 0, 0.6431373, 1,
1.227585, 0.5682473, 0.9984674, 1, 0, 0.6352941, 1,
1.231071, -0.004467651, 0.764464, 1, 0, 0.6313726, 1,
1.233145, -0.03831972, 1.532558, 1, 0, 0.6235294, 1,
1.239717, 1.473405, 1.205697, 1, 0, 0.6196079, 1,
1.245183, 2.236206, 0.5699638, 1, 0, 0.6117647, 1,
1.252511, -1.993471, 0.8710695, 1, 0, 0.6078432, 1,
1.267633, 0.3848041, 0.6944641, 1, 0, 0.6, 1,
1.267726, -1.024708, 2.074515, 1, 0, 0.5921569, 1,
1.284763, 0.06000472, 2.452528, 1, 0, 0.5882353, 1,
1.291213, -1.106171, 2.656307, 1, 0, 0.5803922, 1,
1.294834, -1.961598, 2.449154, 1, 0, 0.5764706, 1,
1.313175, 0.8709559, 2.071217, 1, 0, 0.5686275, 1,
1.313678, 1.239491, 1.252562, 1, 0, 0.5647059, 1,
1.316918, -1.183709, 2.54204, 1, 0, 0.5568628, 1,
1.318681, -0.6058816, 2.160696, 1, 0, 0.5529412, 1,
1.33406, -0.1103714, 2.494988, 1, 0, 0.5450981, 1,
1.337425, 0.4948722, 1.442025, 1, 0, 0.5411765, 1,
1.344086, -0.257625, 2.020493, 1, 0, 0.5333334, 1,
1.344908, -0.3435203, 0.8500417, 1, 0, 0.5294118, 1,
1.347476, -1.788366, 2.477103, 1, 0, 0.5215687, 1,
1.350535, 0.4254826, 2.075199, 1, 0, 0.5176471, 1,
1.350724, -0.2159354, 2.596381, 1, 0, 0.509804, 1,
1.352047, 0.9038453, 0.9206139, 1, 0, 0.5058824, 1,
1.354148, -0.633193, 2.430568, 1, 0, 0.4980392, 1,
1.360137, -0.1953841, 1.446109, 1, 0, 0.4901961, 1,
1.360824, 1.061444, 1.012192, 1, 0, 0.4862745, 1,
1.361726, -0.8696559, 2.651224, 1, 0, 0.4784314, 1,
1.371552, -0.6466841, 1.480276, 1, 0, 0.4745098, 1,
1.372639, -0.3664536, 1.145943, 1, 0, 0.4666667, 1,
1.378929, 0.2211509, 2.742651, 1, 0, 0.4627451, 1,
1.38722, 0.8760111, 1.050478, 1, 0, 0.454902, 1,
1.389128, 1.006309, 2.371645, 1, 0, 0.4509804, 1,
1.404866, -0.3538943, 0.0849907, 1, 0, 0.4431373, 1,
1.405783, -0.7377636, 4.939355, 1, 0, 0.4392157, 1,
1.418972, -0.6071758, 0.5857918, 1, 0, 0.4313726, 1,
1.426541, -1.151362, 2.387325, 1, 0, 0.427451, 1,
1.433375, -0.9664881, 2.325531, 1, 0, 0.4196078, 1,
1.441506, 0.7650001, 2.55821, 1, 0, 0.4156863, 1,
1.451105, 0.3605781, 0.2360509, 1, 0, 0.4078431, 1,
1.463946, -0.09753868, 1.509906, 1, 0, 0.4039216, 1,
1.464711, -0.9462826, 1.24328, 1, 0, 0.3960784, 1,
1.477109, -0.01121413, 2.759014, 1, 0, 0.3882353, 1,
1.480178, -0.06731974, 3.083949, 1, 0, 0.3843137, 1,
1.483402, 0.6267611, 1.358625, 1, 0, 0.3764706, 1,
1.49808, 0.2824959, 1.308206, 1, 0, 0.372549, 1,
1.525243, -0.4275881, 2.41608, 1, 0, 0.3647059, 1,
1.527397, 1.140435, -0.4822207, 1, 0, 0.3607843, 1,
1.531107, -0.7827808, 0.1472098, 1, 0, 0.3529412, 1,
1.537352, 0.08799933, -0.1285158, 1, 0, 0.3490196, 1,
1.539553, -0.5913565, 3.603944, 1, 0, 0.3411765, 1,
1.542954, 0.1039121, 1.567617, 1, 0, 0.3372549, 1,
1.556565, -0.7120534, 2.583449, 1, 0, 0.3294118, 1,
1.557708, 0.3029595, 0.1018511, 1, 0, 0.3254902, 1,
1.557956, 0.9934183, 3.901589, 1, 0, 0.3176471, 1,
1.565451, -0.9286511, 0.517819, 1, 0, 0.3137255, 1,
1.566214, -0.3834855, 3.774009, 1, 0, 0.3058824, 1,
1.591884, 0.6132162, 0.9091461, 1, 0, 0.2980392, 1,
1.595175, -1.03547, 2.35549, 1, 0, 0.2941177, 1,
1.597315, -1.638771, 3.249976, 1, 0, 0.2862745, 1,
1.633988, -1.584168, 2.922487, 1, 0, 0.282353, 1,
1.634978, 1.108273, -0.02397477, 1, 0, 0.2745098, 1,
1.63527, 0.5725368, 1.791692, 1, 0, 0.2705882, 1,
1.643379, 0.8867772, 2.142613, 1, 0, 0.2627451, 1,
1.657837, 0.02483356, 0.2489289, 1, 0, 0.2588235, 1,
1.668172, 1.574651, 1.28948, 1, 0, 0.2509804, 1,
1.670381, 0.209001, 1.537738, 1, 0, 0.2470588, 1,
1.673757, -0.705583, 1.922865, 1, 0, 0.2392157, 1,
1.691216, 1.138083, 0.7576126, 1, 0, 0.2352941, 1,
1.692255, 1.298428, 1.497553, 1, 0, 0.227451, 1,
1.69386, 0.3033301, 2.338312, 1, 0, 0.2235294, 1,
1.740236, 1.874798, 1.72077, 1, 0, 0.2156863, 1,
1.746728, -0.04050325, 2.704313, 1, 0, 0.2117647, 1,
1.773637, -2.402885, 1.966939, 1, 0, 0.2039216, 1,
1.794857, 0.4709393, 1.358456, 1, 0, 0.1960784, 1,
1.834552, -1.535896, 1.974078, 1, 0, 0.1921569, 1,
1.839778, -1.083076, 2.197581, 1, 0, 0.1843137, 1,
1.844388, -0.7432604, 3.299899, 1, 0, 0.1803922, 1,
1.859529, -0.1057728, 1.689303, 1, 0, 0.172549, 1,
1.867976, 0.4447768, 3.113606, 1, 0, 0.1686275, 1,
1.895175, 1.808124, -0.120719, 1, 0, 0.1607843, 1,
1.903533, 0.8578482, 0.7144801, 1, 0, 0.1568628, 1,
1.910203, -0.3877918, 2.73923, 1, 0, 0.1490196, 1,
1.92514, -2.22603, 4.205787, 1, 0, 0.145098, 1,
1.957631, 0.1713764, 0.4249907, 1, 0, 0.1372549, 1,
1.966259, -0.4232515, 2.799302, 1, 0, 0.1333333, 1,
1.979426, -2.107136, 3.650537, 1, 0, 0.1254902, 1,
1.996003, -0.1467928, 3.194563, 1, 0, 0.1215686, 1,
1.996278, -0.1041585, 1.761484, 1, 0, 0.1137255, 1,
2.010483, -1.415711, 2.236803, 1, 0, 0.1098039, 1,
2.025676, 0.4389728, 2.345305, 1, 0, 0.1019608, 1,
2.055599, 0.5919835, 1.000594, 1, 0, 0.09411765, 1,
2.075506, 0.4393789, 1.09882, 1, 0, 0.09019608, 1,
2.080499, 0.6136147, 1.146355, 1, 0, 0.08235294, 1,
2.14427, -0.8267817, 0.31057, 1, 0, 0.07843138, 1,
2.150955, -0.03499409, 1.603179, 1, 0, 0.07058824, 1,
2.222535, -0.9341987, 2.575526, 1, 0, 0.06666667, 1,
2.234326, -0.8449129, 1.250073, 1, 0, 0.05882353, 1,
2.251354, 0.2687853, 0.4995626, 1, 0, 0.05490196, 1,
2.271116, -2.370357, 1.997671, 1, 0, 0.04705882, 1,
2.276953, -1.000949, 2.146681, 1, 0, 0.04313726, 1,
2.390379, 0.5576909, 0.3127277, 1, 0, 0.03529412, 1,
2.410207, 1.401175, 0.3183298, 1, 0, 0.03137255, 1,
2.449013, -0.07876501, 0.418067, 1, 0, 0.02352941, 1,
2.717656, 0.3494293, 1.388974, 1, 0, 0.01960784, 1,
3.397918, -0.06813999, 1.483348, 1, 0, 0.01176471, 1,
3.442933, -0.5349556, 2.223365, 1, 0, 0.007843138, 1
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
0.2549118, -4.734693, -7.364525, 0, -0.5, 0.5, 0.5,
0.2549118, -4.734693, -7.364525, 1, -0.5, 0.5, 0.5,
0.2549118, -4.734693, -7.364525, 1, 1.5, 0.5, 0.5,
0.2549118, -4.734693, -7.364525, 0, 1.5, 0.5, 0.5
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
-4.013848, -0.1347812, -7.364525, 0, -0.5, 0.5, 0.5,
-4.013848, -0.1347812, -7.364525, 1, -0.5, 0.5, 0.5,
-4.013848, -0.1347812, -7.364525, 1, 1.5, 0.5, 0.5,
-4.013848, -0.1347812, -7.364525, 0, 1.5, 0.5, 0.5
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
-4.013848, -4.734693, -0.2189231, 0, -0.5, 0.5, 0.5,
-4.013848, -4.734693, -0.2189231, 1, -0.5, 0.5, 0.5,
-4.013848, -4.734693, -0.2189231, 1, 1.5, 0.5, 0.5,
-4.013848, -4.734693, -0.2189231, 0, 1.5, 0.5, 0.5
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
-2, -3.673175, -5.71554,
3, -3.673175, -5.71554,
-2, -3.673175, -5.71554,
-2, -3.850095, -5.990371,
-1, -3.673175, -5.71554,
-1, -3.850095, -5.990371,
0, -3.673175, -5.71554,
0, -3.850095, -5.990371,
1, -3.673175, -5.71554,
1, -3.850095, -5.990371,
2, -3.673175, -5.71554,
2, -3.850095, -5.990371,
3, -3.673175, -5.71554,
3, -3.850095, -5.990371
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
-2, -4.203934, -6.540033, 0, -0.5, 0.5, 0.5,
-2, -4.203934, -6.540033, 1, -0.5, 0.5, 0.5,
-2, -4.203934, -6.540033, 1, 1.5, 0.5, 0.5,
-2, -4.203934, -6.540033, 0, 1.5, 0.5, 0.5,
-1, -4.203934, -6.540033, 0, -0.5, 0.5, 0.5,
-1, -4.203934, -6.540033, 1, -0.5, 0.5, 0.5,
-1, -4.203934, -6.540033, 1, 1.5, 0.5, 0.5,
-1, -4.203934, -6.540033, 0, 1.5, 0.5, 0.5,
0, -4.203934, -6.540033, 0, -0.5, 0.5, 0.5,
0, -4.203934, -6.540033, 1, -0.5, 0.5, 0.5,
0, -4.203934, -6.540033, 1, 1.5, 0.5, 0.5,
0, -4.203934, -6.540033, 0, 1.5, 0.5, 0.5,
1, -4.203934, -6.540033, 0, -0.5, 0.5, 0.5,
1, -4.203934, -6.540033, 1, -0.5, 0.5, 0.5,
1, -4.203934, -6.540033, 1, 1.5, 0.5, 0.5,
1, -4.203934, -6.540033, 0, 1.5, 0.5, 0.5,
2, -4.203934, -6.540033, 0, -0.5, 0.5, 0.5,
2, -4.203934, -6.540033, 1, -0.5, 0.5, 0.5,
2, -4.203934, -6.540033, 1, 1.5, 0.5, 0.5,
2, -4.203934, -6.540033, 0, 1.5, 0.5, 0.5,
3, -4.203934, -6.540033, 0, -0.5, 0.5, 0.5,
3, -4.203934, -6.540033, 1, -0.5, 0.5, 0.5,
3, -4.203934, -6.540033, 1, 1.5, 0.5, 0.5,
3, -4.203934, -6.540033, 0, 1.5, 0.5, 0.5
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
-3.02875, -3, -5.71554,
-3.02875, 3, -5.71554,
-3.02875, -3, -5.71554,
-3.192933, -3, -5.990371,
-3.02875, -2, -5.71554,
-3.192933, -2, -5.990371,
-3.02875, -1, -5.71554,
-3.192933, -1, -5.990371,
-3.02875, 0, -5.71554,
-3.192933, 0, -5.990371,
-3.02875, 1, -5.71554,
-3.192933, 1, -5.990371,
-3.02875, 2, -5.71554,
-3.192933, 2, -5.990371,
-3.02875, 3, -5.71554,
-3.192933, 3, -5.990371
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
-3.521299, -3, -6.540033, 0, -0.5, 0.5, 0.5,
-3.521299, -3, -6.540033, 1, -0.5, 0.5, 0.5,
-3.521299, -3, -6.540033, 1, 1.5, 0.5, 0.5,
-3.521299, -3, -6.540033, 0, 1.5, 0.5, 0.5,
-3.521299, -2, -6.540033, 0, -0.5, 0.5, 0.5,
-3.521299, -2, -6.540033, 1, -0.5, 0.5, 0.5,
-3.521299, -2, -6.540033, 1, 1.5, 0.5, 0.5,
-3.521299, -2, -6.540033, 0, 1.5, 0.5, 0.5,
-3.521299, -1, -6.540033, 0, -0.5, 0.5, 0.5,
-3.521299, -1, -6.540033, 1, -0.5, 0.5, 0.5,
-3.521299, -1, -6.540033, 1, 1.5, 0.5, 0.5,
-3.521299, -1, -6.540033, 0, 1.5, 0.5, 0.5,
-3.521299, 0, -6.540033, 0, -0.5, 0.5, 0.5,
-3.521299, 0, -6.540033, 1, -0.5, 0.5, 0.5,
-3.521299, 0, -6.540033, 1, 1.5, 0.5, 0.5,
-3.521299, 0, -6.540033, 0, 1.5, 0.5, 0.5,
-3.521299, 1, -6.540033, 0, -0.5, 0.5, 0.5,
-3.521299, 1, -6.540033, 1, -0.5, 0.5, 0.5,
-3.521299, 1, -6.540033, 1, 1.5, 0.5, 0.5,
-3.521299, 1, -6.540033, 0, 1.5, 0.5, 0.5,
-3.521299, 2, -6.540033, 0, -0.5, 0.5, 0.5,
-3.521299, 2, -6.540033, 1, -0.5, 0.5, 0.5,
-3.521299, 2, -6.540033, 1, 1.5, 0.5, 0.5,
-3.521299, 2, -6.540033, 0, 1.5, 0.5, 0.5,
-3.521299, 3, -6.540033, 0, -0.5, 0.5, 0.5,
-3.521299, 3, -6.540033, 1, -0.5, 0.5, 0.5,
-3.521299, 3, -6.540033, 1, 1.5, 0.5, 0.5,
-3.521299, 3, -6.540033, 0, 1.5, 0.5, 0.5
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
-3.02875, -3.673175, -4,
-3.02875, -3.673175, 4,
-3.02875, -3.673175, -4,
-3.192933, -3.850095, -4,
-3.02875, -3.673175, -2,
-3.192933, -3.850095, -2,
-3.02875, -3.673175, 0,
-3.192933, -3.850095, 0,
-3.02875, -3.673175, 2,
-3.192933, -3.850095, 2,
-3.02875, -3.673175, 4,
-3.192933, -3.850095, 4
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
-3.521299, -4.203934, -4, 0, -0.5, 0.5, 0.5,
-3.521299, -4.203934, -4, 1, -0.5, 0.5, 0.5,
-3.521299, -4.203934, -4, 1, 1.5, 0.5, 0.5,
-3.521299, -4.203934, -4, 0, 1.5, 0.5, 0.5,
-3.521299, -4.203934, -2, 0, -0.5, 0.5, 0.5,
-3.521299, -4.203934, -2, 1, -0.5, 0.5, 0.5,
-3.521299, -4.203934, -2, 1, 1.5, 0.5, 0.5,
-3.521299, -4.203934, -2, 0, 1.5, 0.5, 0.5,
-3.521299, -4.203934, 0, 0, -0.5, 0.5, 0.5,
-3.521299, -4.203934, 0, 1, -0.5, 0.5, 0.5,
-3.521299, -4.203934, 0, 1, 1.5, 0.5, 0.5,
-3.521299, -4.203934, 0, 0, 1.5, 0.5, 0.5,
-3.521299, -4.203934, 2, 0, -0.5, 0.5, 0.5,
-3.521299, -4.203934, 2, 1, -0.5, 0.5, 0.5,
-3.521299, -4.203934, 2, 1, 1.5, 0.5, 0.5,
-3.521299, -4.203934, 2, 0, 1.5, 0.5, 0.5,
-3.521299, -4.203934, 4, 0, -0.5, 0.5, 0.5,
-3.521299, -4.203934, 4, 1, -0.5, 0.5, 0.5,
-3.521299, -4.203934, 4, 1, 1.5, 0.5, 0.5,
-3.521299, -4.203934, 4, 0, 1.5, 0.5, 0.5
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
-3.02875, -3.673175, -5.71554,
-3.02875, 3.403612, -5.71554,
-3.02875, -3.673175, 5.277694,
-3.02875, 3.403612, 5.277694,
-3.02875, -3.673175, -5.71554,
-3.02875, -3.673175, 5.277694,
-3.02875, 3.403612, -5.71554,
-3.02875, 3.403612, 5.277694,
-3.02875, -3.673175, -5.71554,
3.538573, -3.673175, -5.71554,
-3.02875, -3.673175, 5.277694,
3.538573, -3.673175, 5.277694,
-3.02875, 3.403612, -5.71554,
3.538573, 3.403612, -5.71554,
-3.02875, 3.403612, 5.277694,
3.538573, 3.403612, 5.277694,
3.538573, -3.673175, -5.71554,
3.538573, 3.403612, -5.71554,
3.538573, -3.673175, 5.277694,
3.538573, 3.403612, 5.277694,
3.538573, -3.673175, -5.71554,
3.538573, -3.673175, 5.277694,
3.538573, 3.403612, -5.71554,
3.538573, 3.403612, 5.277694
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
var radius = 7.812591;
var distance = 34.7591;
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
mvMatrix.translate( -0.2549118, 0.1347812, 0.2189231 );
mvMatrix.scale( 1.286236, 1.193639, 0.7683932 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.7591);
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
disodium_hydrogen_ar<-read.table("disodium_hydrogen_ar.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-disodium_hydrogen_ar$V2
```

```
## Error in eval(expr, envir, enclos): object 'disodium_hydrogen_ar' not found
```

```r
y<-disodium_hydrogen_ar$V3
```

```
## Error in eval(expr, envir, enclos): object 'disodium_hydrogen_ar' not found
```

```r
z<-disodium_hydrogen_ar$V4
```

```
## Error in eval(expr, envir, enclos): object 'disodium_hydrogen_ar' not found
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
-2.933109, 1.513059, -0.1742488, 0, 0, 1, 1, 1,
-2.881103, 0.2660103, -0.4484493, 1, 0, 0, 1, 1,
-2.836288, -1.497414, -0.2702095, 1, 0, 0, 1, 1,
-2.595606, 1.114292, -1.681895, 1, 0, 0, 1, 1,
-2.347174, -0.4112176, -3.506996, 1, 0, 0, 1, 1,
-2.334526, -0.5409259, -1.250477, 1, 0, 0, 1, 1,
-2.322198, -0.7754019, -2.651998, 0, 0, 0, 1, 1,
-2.293601, -0.3557579, -3.694607, 0, 0, 0, 1, 1,
-2.257711, 0.1978192, -1.17321, 0, 0, 0, 1, 1,
-2.240966, 1.113134, -1.578079, 0, 0, 0, 1, 1,
-2.222184, -1.165241, 0.03492678, 0, 0, 0, 1, 1,
-2.218293, -0.3487159, -2.648386, 0, 0, 0, 1, 1,
-2.114626, -1.893926, -0.7439072, 0, 0, 0, 1, 1,
-2.05411, 1.744305, -1.031201, 1, 1, 1, 1, 1,
-2.045196, 0.9434079, -1.308137, 1, 1, 1, 1, 1,
-2.029573, -1.446058, -3.182477, 1, 1, 1, 1, 1,
-2.005314, -0.3680295, -0.4407309, 1, 1, 1, 1, 1,
-1.996525, 1.573537, -0.3040733, 1, 1, 1, 1, 1,
-1.989439, -0.4174904, -3.504302, 1, 1, 1, 1, 1,
-1.977561, -0.6656978, -2.000339, 1, 1, 1, 1, 1,
-1.92918, 0.7920508, -1.752022, 1, 1, 1, 1, 1,
-1.922979, -0.4224635, -1.020176, 1, 1, 1, 1, 1,
-1.920165, -0.1571854, -2.364677, 1, 1, 1, 1, 1,
-1.912539, 0.3934338, -1.130863, 1, 1, 1, 1, 1,
-1.904654, 1.536586, -0.3457692, 1, 1, 1, 1, 1,
-1.897026, -0.5497022, -1.314204, 1, 1, 1, 1, 1,
-1.885681, 0.0146033, -0.7864604, 1, 1, 1, 1, 1,
-1.868924, -0.5213913, -0.8153713, 1, 1, 1, 1, 1,
-1.860453, -1.358301, -1.593886, 0, 0, 1, 1, 1,
-1.858268, -0.387352, -2.836153, 1, 0, 0, 1, 1,
-1.840381, 0.7029635, -2.118922, 1, 0, 0, 1, 1,
-1.82458, 0.3811118, -1.646543, 1, 0, 0, 1, 1,
-1.822778, -1.196346, -1.520361, 1, 0, 0, 1, 1,
-1.812435, 0.8217818, -2.307489, 1, 0, 0, 1, 1,
-1.796906, -0.6118909, -2.656956, 0, 0, 0, 1, 1,
-1.77581, -0.2737012, -1.168485, 0, 0, 0, 1, 1,
-1.773414, 1.34636, -0.3065056, 0, 0, 0, 1, 1,
-1.77222, -2.331979, -4.997907, 0, 0, 0, 1, 1,
-1.747537, 0.1795935, -0.7646718, 0, 0, 0, 1, 1,
-1.74624, -0.1423066, -1.4769, 0, 0, 0, 1, 1,
-1.744239, 0.7722851, -1.730769, 0, 0, 0, 1, 1,
-1.670751, 0.7041371, -1.229537, 1, 1, 1, 1, 1,
-1.669539, -1.461235, -2.595213, 1, 1, 1, 1, 1,
-1.662482, -2.426267, -3.233206, 1, 1, 1, 1, 1,
-1.655161, 1.12089, 0.6923775, 1, 1, 1, 1, 1,
-1.648656, 0.4025553, -1.634937, 1, 1, 1, 1, 1,
-1.64682, -0.7610077, -1.452613, 1, 1, 1, 1, 1,
-1.619531, -0.8022062, -2.234395, 1, 1, 1, 1, 1,
-1.618163, -0.5374723, -1.096632, 1, 1, 1, 1, 1,
-1.616594, -0.7318814, -2.328526, 1, 1, 1, 1, 1,
-1.59825, 0.07814842, -1.674983, 1, 1, 1, 1, 1,
-1.576937, 0.4279104, -1.022366, 1, 1, 1, 1, 1,
-1.569784, 0.07649099, -2.373354, 1, 1, 1, 1, 1,
-1.550148, 0.9482921, -0.1921115, 1, 1, 1, 1, 1,
-1.538781, 0.09629227, -1.249081, 1, 1, 1, 1, 1,
-1.521661, -1.372296, -2.757302, 1, 1, 1, 1, 1,
-1.513225, 1.889114, -1.185499, 0, 0, 1, 1, 1,
-1.512635, -0.1830384, -1.511852, 1, 0, 0, 1, 1,
-1.505555, -1.30778, -2.659223, 1, 0, 0, 1, 1,
-1.47559, 1.447095, -1.504575, 1, 0, 0, 1, 1,
-1.469331, -1.142962, -1.186871, 1, 0, 0, 1, 1,
-1.468978, 1.252756, -1.519645, 1, 0, 0, 1, 1,
-1.467608, -1.154715, -3.382555, 0, 0, 0, 1, 1,
-1.466213, -0.8665476, -2.666056, 0, 0, 0, 1, 1,
-1.454162, 0.1157584, -1.219223, 0, 0, 0, 1, 1,
-1.447348, 0.1577661, -1.81329, 0, 0, 0, 1, 1,
-1.446502, -0.4041716, 1.023497, 0, 0, 0, 1, 1,
-1.437264, -0.1129236, -0.8445468, 0, 0, 0, 1, 1,
-1.413479, -0.3864942, -3.61521, 0, 0, 0, 1, 1,
-1.413044, -0.09394561, -0.8808338, 1, 1, 1, 1, 1,
-1.410132, -0.7314413, -1.196278, 1, 1, 1, 1, 1,
-1.402375, 0.5200829, -1.375951, 1, 1, 1, 1, 1,
-1.402194, -0.3822748, -0.7820981, 1, 1, 1, 1, 1,
-1.397758, 1.786643, 1.693689, 1, 1, 1, 1, 1,
-1.391043, 1.503421, -0.2060595, 1, 1, 1, 1, 1,
-1.389975, 1.630455, -2.697024, 1, 1, 1, 1, 1,
-1.379495, -0.4566889, -2.673653, 1, 1, 1, 1, 1,
-1.378683, -0.1117096, -1.607308, 1, 1, 1, 1, 1,
-1.368354, 0.5908805, -3.343265, 1, 1, 1, 1, 1,
-1.358108, 0.3028467, -1.642472, 1, 1, 1, 1, 1,
-1.357786, 0.1694137, -0.9665359, 1, 1, 1, 1, 1,
-1.354907, 0.1964075, -0.8728054, 1, 1, 1, 1, 1,
-1.341252, -0.09263354, -2.625273, 1, 1, 1, 1, 1,
-1.339121, -0.5379782, -0.3200432, 1, 1, 1, 1, 1,
-1.331543, -0.4107008, -1.734729, 0, 0, 1, 1, 1,
-1.327222, -1.587266, -1.866849, 1, 0, 0, 1, 1,
-1.318082, -1.456858, -2.729797, 1, 0, 0, 1, 1,
-1.315946, 0.3584358, -1.651839, 1, 0, 0, 1, 1,
-1.312338, -0.3337827, -1.928696, 1, 0, 0, 1, 1,
-1.305933, -0.7116933, -3.765732, 1, 0, 0, 1, 1,
-1.299749, -0.7020682, -1.989184, 0, 0, 0, 1, 1,
-1.290722, -2.204636, -2.926603, 0, 0, 0, 1, 1,
-1.289602, -0.757772, -1.507094, 0, 0, 0, 1, 1,
-1.288405, 1.227852, -0.6247405, 0, 0, 0, 1, 1,
-1.283569, -0.437217, -2.559709, 0, 0, 0, 1, 1,
-1.281501, 0.3128327, -0.5674009, 0, 0, 0, 1, 1,
-1.281299, 0.9894101, -3.172813, 0, 0, 0, 1, 1,
-1.275126, 0.8602917, 0.2448718, 1, 1, 1, 1, 1,
-1.272314, 1.51304, 1.476404, 1, 1, 1, 1, 1,
-1.250976, 0.3933237, -0.9113039, 1, 1, 1, 1, 1,
-1.248166, -1.909725, -2.435568, 1, 1, 1, 1, 1,
-1.243902, 0.6518651, -0.794575, 1, 1, 1, 1, 1,
-1.24334, 0.5840157, -0.06904824, 1, 1, 1, 1, 1,
-1.242912, 1.422135, -0.3558518, 1, 1, 1, 1, 1,
-1.241972, 0.6027529, -0.7703032, 1, 1, 1, 1, 1,
-1.241379, -0.4201782, -2.543858, 1, 1, 1, 1, 1,
-1.238623, -0.7066092, -3.066813, 1, 1, 1, 1, 1,
-1.230192, -0.6168701, -0.4378507, 1, 1, 1, 1, 1,
-1.226627, -1.202684, -1.334224, 1, 1, 1, 1, 1,
-1.220335, -0.5189926, -3.035959, 1, 1, 1, 1, 1,
-1.220122, 1.107296, 0.1558483, 1, 1, 1, 1, 1,
-1.209357, 1.163182, -0.8276162, 1, 1, 1, 1, 1,
-1.204686, 1.094689, 0.6931912, 0, 0, 1, 1, 1,
-1.190497, -0.423754, -2.151675, 1, 0, 0, 1, 1,
-1.188626, -1.06494, -2.900853, 1, 0, 0, 1, 1,
-1.18347, -0.739877, -1.353281, 1, 0, 0, 1, 1,
-1.181035, 1.00315, -2.073997, 1, 0, 0, 1, 1,
-1.176994, 1.660977, -1.665641, 1, 0, 0, 1, 1,
-1.166864, -0.5634106, -3.056432, 0, 0, 0, 1, 1,
-1.166225, -1.221566, -2.858831, 0, 0, 0, 1, 1,
-1.164718, 1.411519, 0.2927914, 0, 0, 0, 1, 1,
-1.163601, 1.7437, -1.666744, 0, 0, 0, 1, 1,
-1.160629, 0.5220981, -1.623839, 0, 0, 0, 1, 1,
-1.144533, 1.4122, 0.2478141, 0, 0, 0, 1, 1,
-1.13012, -0.559604, 0.4979786, 0, 0, 0, 1, 1,
-1.123105, 0.08132333, -0.7045805, 1, 1, 1, 1, 1,
-1.119937, 0.6382062, -1.329438, 1, 1, 1, 1, 1,
-1.118084, 2.050593, 0.1871295, 1, 1, 1, 1, 1,
-1.112303, -0.190347, -0.8428439, 1, 1, 1, 1, 1,
-1.110696, 0.3926818, -0.5063511, 1, 1, 1, 1, 1,
-1.110142, 1.043421, -0.3755265, 1, 1, 1, 1, 1,
-1.104572, 0.1808969, -2.281321, 1, 1, 1, 1, 1,
-1.097034, 1.17942, 0.09055942, 1, 1, 1, 1, 1,
-1.091204, 0.5285252, -0.2733698, 1, 1, 1, 1, 1,
-1.08419, -0.5295485, -1.37233, 1, 1, 1, 1, 1,
-1.081332, -1.15727, -2.585973, 1, 1, 1, 1, 1,
-1.080662, -0.2890173, -2.664402, 1, 1, 1, 1, 1,
-1.076311, 0.3262585, 1.4318, 1, 1, 1, 1, 1,
-1.075008, -3.570115, -5.555445, 1, 1, 1, 1, 1,
-1.071956, -0.2247269, -0.5972921, 1, 1, 1, 1, 1,
-1.065279, -0.7212675, -1.787839, 0, 0, 1, 1, 1,
-1.065185, -1.830508, -2.750531, 1, 0, 0, 1, 1,
-1.063494, 1.287273, -1.178339, 1, 0, 0, 1, 1,
-1.063265, 0.5710571, -0.1641715, 1, 0, 0, 1, 1,
-1.061326, 0.8052024, -2.344089, 1, 0, 0, 1, 1,
-1.058689, 0.008550311, -1.499509, 1, 0, 0, 1, 1,
-1.057742, 0.006317682, -1.041915, 0, 0, 0, 1, 1,
-1.050202, 0.2666331, -0.01700176, 0, 0, 0, 1, 1,
-1.048327, -0.9316074, -2.266319, 0, 0, 0, 1, 1,
-1.047877, -0.001956614, -0.9317274, 0, 0, 0, 1, 1,
-1.044252, -0.5852071, -4.604717, 0, 0, 0, 1, 1,
-1.042905, -2.735239, -2.356705, 0, 0, 0, 1, 1,
-1.040932, 0.6279574, -2.448507, 0, 0, 0, 1, 1,
-1.030853, -0.8666343, -3.653232, 1, 1, 1, 1, 1,
-1.028478, -1.394621, -2.728636, 1, 1, 1, 1, 1,
-1.0227, 0.1639255, -1.418205, 1, 1, 1, 1, 1,
-1.01916, -0.6603076, -2.392537, 1, 1, 1, 1, 1,
-1.012415, 2.224075, -0.9993569, 1, 1, 1, 1, 1,
-1.004794, -0.6493655, -1.296003, 1, 1, 1, 1, 1,
-1.003917, -1.090419, -0.3889919, 1, 1, 1, 1, 1,
-0.9987569, 2.199109, -0.7711473, 1, 1, 1, 1, 1,
-0.9977245, -0.4647973, -1.724422, 1, 1, 1, 1, 1,
-0.9973103, 0.2598243, -2.443608, 1, 1, 1, 1, 1,
-0.9948315, 0.1248432, -0.4046253, 1, 1, 1, 1, 1,
-0.993881, -0.2479029, -3.553123, 1, 1, 1, 1, 1,
-0.9885526, -0.1290507, -2.870946, 1, 1, 1, 1, 1,
-0.987187, -1.293731, -1.785709, 1, 1, 1, 1, 1,
-0.9823347, -1.58535, -3.502322, 1, 1, 1, 1, 1,
-0.969197, -0.6702468, -2.937053, 0, 0, 1, 1, 1,
-0.9645278, -1.754866, -3.51944, 1, 0, 0, 1, 1,
-0.9615354, -0.05163598, -2.512765, 1, 0, 0, 1, 1,
-0.9610559, 0.7613249, -1.603271, 1, 0, 0, 1, 1,
-0.9604334, -1.263624, -4.441033, 1, 0, 0, 1, 1,
-0.9555093, -0.6942765, -3.543632, 1, 0, 0, 1, 1,
-0.9545454, 0.5619287, -1.242884, 0, 0, 0, 1, 1,
-0.9541878, -0.0142633, -2.786942, 0, 0, 0, 1, 1,
-0.9516371, 0.5413685, 0.1516999, 0, 0, 0, 1, 1,
-0.9508214, 0.9162447, -1.412214, 0, 0, 0, 1, 1,
-0.9477609, 0.3250398, -0.9202313, 0, 0, 0, 1, 1,
-0.9468844, 1.75975, -2.23094, 0, 0, 0, 1, 1,
-0.9448995, 0.3164235, -1.19574, 0, 0, 0, 1, 1,
-0.9362944, 0.2398849, 0.5000393, 1, 1, 1, 1, 1,
-0.9300687, -1.328743, -1.44092, 1, 1, 1, 1, 1,
-0.9169886, 0.5943906, -2.307931, 1, 1, 1, 1, 1,
-0.9161914, 0.3157469, -2.217818, 1, 1, 1, 1, 1,
-0.9071143, 1.144495, -1.49826, 1, 1, 1, 1, 1,
-0.8984989, 0.6278675, -1.227124, 1, 1, 1, 1, 1,
-0.8949922, -0.6875355, -2.96289, 1, 1, 1, 1, 1,
-0.8920287, -0.5879766, -4.73244, 1, 1, 1, 1, 1,
-0.8901689, 0.3537284, -1.461845, 1, 1, 1, 1, 1,
-0.8894902, 0.1960991, -2.49417, 1, 1, 1, 1, 1,
-0.8880066, 0.1121625, -1.56441, 1, 1, 1, 1, 1,
-0.8844128, 1.13361, 0.5382861, 1, 1, 1, 1, 1,
-0.8807093, 0.3887725, -1.84917, 1, 1, 1, 1, 1,
-0.878672, 0.9719034, 1.525063, 1, 1, 1, 1, 1,
-0.8778006, -2.469449, -2.499961, 1, 1, 1, 1, 1,
-0.8739914, -0.3756894, -1.813028, 0, 0, 1, 1, 1,
-0.8647963, -1.303296, -1.915685, 1, 0, 0, 1, 1,
-0.8643946, 1.392387, -0.4475083, 1, 0, 0, 1, 1,
-0.8540846, -1.221016, -3.233916, 1, 0, 0, 1, 1,
-0.8428177, 1.404894, -1.074312, 1, 0, 0, 1, 1,
-0.842244, 0.6500527, -0.9192952, 1, 0, 0, 1, 1,
-0.8402095, -0.1697099, -1.482907, 0, 0, 0, 1, 1,
-0.8390678, -0.6052794, -1.836095, 0, 0, 0, 1, 1,
-0.8373467, 0.6980739, 0.5165067, 0, 0, 0, 1, 1,
-0.8303335, 0.4385289, -0.4059828, 0, 0, 0, 1, 1,
-0.8277655, 1.056065, 1.380537, 0, 0, 0, 1, 1,
-0.8262454, 1.115873, -0.1796156, 0, 0, 0, 1, 1,
-0.8201133, 0.4618332, 0.4204573, 0, 0, 0, 1, 1,
-0.8198748, -0.8885477, -2.450015, 1, 1, 1, 1, 1,
-0.8165357, 0.1757074, -1.843321, 1, 1, 1, 1, 1,
-0.8145734, 1.035267, -0.8169069, 1, 1, 1, 1, 1,
-0.8124338, -0.3790558, -0.9979556, 1, 1, 1, 1, 1,
-0.8068739, -0.3259269, -1.822286, 1, 1, 1, 1, 1,
-0.8057965, 1.270286, -0.722835, 1, 1, 1, 1, 1,
-0.8000279, -0.4446071, -2.429096, 1, 1, 1, 1, 1,
-0.7969897, -1.677323, -2.544445, 1, 1, 1, 1, 1,
-0.7947906, 0.8474532, 0.6762018, 1, 1, 1, 1, 1,
-0.7930463, 0.1356733, -0.008741036, 1, 1, 1, 1, 1,
-0.7919246, 1.222455, -1.152132, 1, 1, 1, 1, 1,
-0.7893667, -0.01992346, -2.168599, 1, 1, 1, 1, 1,
-0.783803, 0.9255821, -1.609674, 1, 1, 1, 1, 1,
-0.7789957, 0.01943552, -0.2428163, 1, 1, 1, 1, 1,
-0.7788189, -0.2203877, -1.695414, 1, 1, 1, 1, 1,
-0.7683968, 0.09519614, -1.008732, 0, 0, 1, 1, 1,
-0.7657815, -0.9021596, -1.289148, 1, 0, 0, 1, 1,
-0.7595208, -0.1199267, -0.9980829, 1, 0, 0, 1, 1,
-0.7541515, -0.8865289, -2.661292, 1, 0, 0, 1, 1,
-0.7497742, 0.5436934, -1.807889, 1, 0, 0, 1, 1,
-0.7479014, -1.263862, -1.056328, 1, 0, 0, 1, 1,
-0.7463819, -1.257806, -2.171143, 0, 0, 0, 1, 1,
-0.7460901, 1.984969, 0.4031679, 0, 0, 0, 1, 1,
-0.7439967, 1.003579, 0.7989129, 0, 0, 0, 1, 1,
-0.7421387, 0.02138299, -2.570315, 0, 0, 0, 1, 1,
-0.741449, 0.08232445, -2.091029, 0, 0, 0, 1, 1,
-0.7352113, 1.856288, 0.2571271, 0, 0, 0, 1, 1,
-0.7240779, 0.4510981, -0.1928353, 0, 0, 0, 1, 1,
-0.7203618, 0.7033775, -0.3915836, 1, 1, 1, 1, 1,
-0.7098791, -0.3627281, -2.489829, 1, 1, 1, 1, 1,
-0.6868296, 0.1108215, -1.96459, 1, 1, 1, 1, 1,
-0.6807848, 1.37721, -0.1099771, 1, 1, 1, 1, 1,
-0.6765354, -1.154015, -2.892184, 1, 1, 1, 1, 1,
-0.6688467, -0.214726, -1.163081, 1, 1, 1, 1, 1,
-0.6663852, 0.7529076, -0.988323, 1, 1, 1, 1, 1,
-0.662705, 0.4076988, -3.252193, 1, 1, 1, 1, 1,
-0.6608495, -2.141063, -4.550917, 1, 1, 1, 1, 1,
-0.6600502, 1.135226, -0.5417584, 1, 1, 1, 1, 1,
-0.6583146, 1.416631, -1.620887, 1, 1, 1, 1, 1,
-0.656643, -1.507669, -3.391781, 1, 1, 1, 1, 1,
-0.6560162, 1.417747, 0.6809824, 1, 1, 1, 1, 1,
-0.6505017, 0.3790638, -0.5729358, 1, 1, 1, 1, 1,
-0.648794, 0.2089267, -0.9180642, 1, 1, 1, 1, 1,
-0.6398085, -2.126543, -3.768559, 0, 0, 1, 1, 1,
-0.6325449, 1.007759, -0.5868484, 1, 0, 0, 1, 1,
-0.6320189, 0.0006731552, 2.10357, 1, 0, 0, 1, 1,
-0.6304317, 0.9634497, 0.8843945, 1, 0, 0, 1, 1,
-0.6288956, 1.533571, 0.6684836, 1, 0, 0, 1, 1,
-0.6239222, -0.6724583, -2.590895, 1, 0, 0, 1, 1,
-0.6196075, -0.5963166, -3.986228, 0, 0, 0, 1, 1,
-0.6190026, -2.725628, -3.349754, 0, 0, 0, 1, 1,
-0.6102748, 0.9667796, 0.03255767, 0, 0, 0, 1, 1,
-0.6097017, 0.2383707, 0.5310299, 0, 0, 0, 1, 1,
-0.6071927, -1.230987, -1.002706, 0, 0, 0, 1, 1,
-0.6057073, 0.04136064, -1.765474, 0, 0, 0, 1, 1,
-0.6023152, 1.160936, -0.6506593, 0, 0, 0, 1, 1,
-0.5990651, 1.359207, 0.1961408, 1, 1, 1, 1, 1,
-0.5937486, 1.040734, 0.3999464, 1, 1, 1, 1, 1,
-0.5827567, 0.6320802, -1.350118, 1, 1, 1, 1, 1,
-0.579029, 2.139493, 0.03935992, 1, 1, 1, 1, 1,
-0.5790036, -1.504454, -3.703884, 1, 1, 1, 1, 1,
-0.577799, -0.02705261, -3.955234, 1, 1, 1, 1, 1,
-0.5716586, 0.2993469, -2.682473, 1, 1, 1, 1, 1,
-0.5694975, 2.261305, 0.6912663, 1, 1, 1, 1, 1,
-0.5646514, 1.351492, 0.1220788, 1, 1, 1, 1, 1,
-0.5640089, 0.4128924, -0.2601469, 1, 1, 1, 1, 1,
-0.5552036, 0.1333284, -1.684456, 1, 1, 1, 1, 1,
-0.5531569, -1.869343, -2.285046, 1, 1, 1, 1, 1,
-0.5514711, 0.7734905, -1.292921, 1, 1, 1, 1, 1,
-0.5492871, 0.4713458, -1.332922, 1, 1, 1, 1, 1,
-0.5469957, 0.03843985, -1.46844, 1, 1, 1, 1, 1,
-0.5431984, -0.3687452, -2.075298, 0, 0, 1, 1, 1,
-0.5402794, -0.284791, -3.161493, 1, 0, 0, 1, 1,
-0.539359, -0.03506469, -0.5619187, 1, 0, 0, 1, 1,
-0.5382417, -0.1718093, -0.5338885, 1, 0, 0, 1, 1,
-0.5379334, 0.04902989, -0.1430485, 1, 0, 0, 1, 1,
-0.5365948, 0.1613457, -1.926995, 1, 0, 0, 1, 1,
-0.5330554, -0.5618901, -2.606198, 0, 0, 0, 1, 1,
-0.5291074, -0.6687281, -2.839372, 0, 0, 0, 1, 1,
-0.5280987, 0.5559425, -0.8407079, 0, 0, 0, 1, 1,
-0.5278116, 0.6685886, -0.822124, 0, 0, 0, 1, 1,
-0.5216023, 1.422882, -1.126623, 0, 0, 0, 1, 1,
-0.5214556, -1.088022, -2.60291, 0, 0, 0, 1, 1,
-0.52116, -0.7702373, 0.2810379, 0, 0, 0, 1, 1,
-0.520238, 0.3667168, -0.5934171, 1, 1, 1, 1, 1,
-0.519439, -0.4602605, -0.4032914, 1, 1, 1, 1, 1,
-0.5189476, -0.2289299, -1.247878, 1, 1, 1, 1, 1,
-0.5185052, 1.011478, 0.4016141, 1, 1, 1, 1, 1,
-0.5174436, -1.027201, -0.6096561, 1, 1, 1, 1, 1,
-0.5171716, -0.6518374, -3.41734, 1, 1, 1, 1, 1,
-0.51583, 1.253078, -1.190243, 1, 1, 1, 1, 1,
-0.515247, 0.973671, 0.6357645, 1, 1, 1, 1, 1,
-0.5136046, 0.2157725, -1.932996, 1, 1, 1, 1, 1,
-0.5121292, 0.3153909, -0.7703542, 1, 1, 1, 1, 1,
-0.5051225, 0.1168406, -3.166476, 1, 1, 1, 1, 1,
-0.4960621, -0.3147956, -3.131881, 1, 1, 1, 1, 1,
-0.4939022, 0.4465016, -0.4124062, 1, 1, 1, 1, 1,
-0.4873599, -0.9786824, -2.921165, 1, 1, 1, 1, 1,
-0.4866055, 0.5562644, -1.511731, 1, 1, 1, 1, 1,
-0.4845494, 1.406682, -0.8245669, 0, 0, 1, 1, 1,
-0.4828694, -1.598458, -1.087361, 1, 0, 0, 1, 1,
-0.4827718, -0.7851887, -1.953984, 1, 0, 0, 1, 1,
-0.466092, -1.880026, -2.553149, 1, 0, 0, 1, 1,
-0.4613492, -0.7690729, -2.743505, 1, 0, 0, 1, 1,
-0.4574643, -1.428925, -2.388677, 1, 0, 0, 1, 1,
-0.4549598, 1.187979, 0.06595028, 0, 0, 0, 1, 1,
-0.4497093, 0.3701862, -1.149582, 0, 0, 0, 1, 1,
-0.4445067, 0.8567913, -0.1103219, 0, 0, 0, 1, 1,
-0.4428214, -1.188892, -2.729374, 0, 0, 0, 1, 1,
-0.4354974, 0.215756, -0.5309094, 0, 0, 0, 1, 1,
-0.4349156, 0.4762188, -2.279185, 0, 0, 0, 1, 1,
-0.4328708, 1.219108, 1.876765, 0, 0, 0, 1, 1,
-0.4318995, -0.03855981, -1.909289, 1, 1, 1, 1, 1,
-0.4317577, 0.2971871, 0.1339633, 1, 1, 1, 1, 1,
-0.4292596, 0.4371992, -0.732904, 1, 1, 1, 1, 1,
-0.428105, -0.05370643, -1.295487, 1, 1, 1, 1, 1,
-0.4200087, 1.801893, -2.847272, 1, 1, 1, 1, 1,
-0.4177219, -0.7768399, -4.512795, 1, 1, 1, 1, 1,
-0.4159641, 1.225847, -1.163493, 1, 1, 1, 1, 1,
-0.4109111, -0.9507754, -2.879489, 1, 1, 1, 1, 1,
-0.4107755, -0.9161425, -1.947539, 1, 1, 1, 1, 1,
-0.4096416, -0.9324313, -2.011085, 1, 1, 1, 1, 1,
-0.407242, 0.602887, -1.489972, 1, 1, 1, 1, 1,
-0.4060829, -0.2042494, -2.408676, 1, 1, 1, 1, 1,
-0.4029859, 0.5554666, -1.003085, 1, 1, 1, 1, 1,
-0.4023887, 0.5576103, -1.908708, 1, 1, 1, 1, 1,
-0.4017613, -1.17466, -1.609472, 1, 1, 1, 1, 1,
-0.4001345, -0.7379719, -3.215266, 0, 0, 1, 1, 1,
-0.3987488, 1.824524, 0.7966167, 1, 0, 0, 1, 1,
-0.3875174, -1.158276, -3.776971, 1, 0, 0, 1, 1,
-0.3820417, -1.728693, -2.546254, 1, 0, 0, 1, 1,
-0.375575, 1.010657, -0.8363928, 1, 0, 0, 1, 1,
-0.3703502, -0.4993354, -2.338114, 1, 0, 0, 1, 1,
-0.3700962, -0.9506648, -2.39766, 0, 0, 0, 1, 1,
-0.3653526, -0.2069537, -3.199273, 0, 0, 0, 1, 1,
-0.3622498, 0.09732049, -0.7964023, 0, 0, 0, 1, 1,
-0.3614497, -0.8061293, -1.396219, 0, 0, 0, 1, 1,
-0.360891, -0.7154952, -2.341193, 0, 0, 0, 1, 1,
-0.3570444, 0.6817085, -2.116501, 0, 0, 0, 1, 1,
-0.3549203, -0.2444336, -3.819018, 0, 0, 0, 1, 1,
-0.3538563, 1.397439, -1.421792, 1, 1, 1, 1, 1,
-0.3526014, -0.6700606, -3.358943, 1, 1, 1, 1, 1,
-0.3515864, 0.4390738, -2.056035, 1, 1, 1, 1, 1,
-0.3501328, -0.3826248, -2.887583, 1, 1, 1, 1, 1,
-0.3420424, -0.8203471, -2.800995, 1, 1, 1, 1, 1,
-0.3405726, 0.8209527, -1.278856, 1, 1, 1, 1, 1,
-0.3376332, 0.4990943, -0.01941677, 1, 1, 1, 1, 1,
-0.3301721, -0.40848, -2.118604, 1, 1, 1, 1, 1,
-0.3279495, -0.6500672, -4.169003, 1, 1, 1, 1, 1,
-0.3274204, -0.6765946, -4.497108, 1, 1, 1, 1, 1,
-0.3252755, 0.5654219, -0.2923556, 1, 1, 1, 1, 1,
-0.3241985, 0.03380056, 0.4304889, 1, 1, 1, 1, 1,
-0.3203848, 0.1997407, -0.5173677, 1, 1, 1, 1, 1,
-0.3196873, -0.8599328, -2.646127, 1, 1, 1, 1, 1,
-0.3184686, -1.254388, -3.84893, 1, 1, 1, 1, 1,
-0.317937, 1.164887, -1.09685, 0, 0, 1, 1, 1,
-0.314528, -2.425214, -0.7100186, 1, 0, 0, 1, 1,
-0.3134936, 0.4921313, 0.4211228, 1, 0, 0, 1, 1,
-0.3121329, 0.5342053, -2.343204, 1, 0, 0, 1, 1,
-0.3109607, -0.7469518, -3.614232, 1, 0, 0, 1, 1,
-0.3078564, 0.9820268, -1.917026, 1, 0, 0, 1, 1,
-0.3078475, 1.80878, 0.2691196, 0, 0, 0, 1, 1,
-0.304818, -0.225122, -2.419173, 0, 0, 0, 1, 1,
-0.3045067, 0.04597714, -2.28912, 0, 0, 0, 1, 1,
-0.2999923, 0.5884066, -1.405897, 0, 0, 0, 1, 1,
-0.2939724, -0.8188503, -4.044779, 0, 0, 0, 1, 1,
-0.2931938, 1.173589, 0.8298212, 0, 0, 0, 1, 1,
-0.2873572, 1.540124, -1.37998, 0, 0, 0, 1, 1,
-0.2866521, -0.1455021, -1.167757, 1, 1, 1, 1, 1,
-0.2864802, 0.9916518, -0.3899062, 1, 1, 1, 1, 1,
-0.2854273, -1.045372, -2.674417, 1, 1, 1, 1, 1,
-0.2834699, -0.3681448, -3.238723, 1, 1, 1, 1, 1,
-0.281874, -1.113525, -3.661941, 1, 1, 1, 1, 1,
-0.2815333, -0.1493247, -1.065701, 1, 1, 1, 1, 1,
-0.2791753, 0.2339803, -2.367981, 1, 1, 1, 1, 1,
-0.2761146, -0.8438259, -3.66632, 1, 1, 1, 1, 1,
-0.2744055, -0.7742473, -3.222425, 1, 1, 1, 1, 1,
-0.2739478, -1.211047, -4.096409, 1, 1, 1, 1, 1,
-0.267128, -0.1823481, -2.29985, 1, 1, 1, 1, 1,
-0.2665226, -1.283596, -2.957537, 1, 1, 1, 1, 1,
-0.2583134, -0.6565456, -2.991062, 1, 1, 1, 1, 1,
-0.2574103, 1.011133, -0.3738275, 1, 1, 1, 1, 1,
-0.2555429, -1.321081, -4.106867, 1, 1, 1, 1, 1,
-0.2511769, -0.8332896, -2.183795, 0, 0, 1, 1, 1,
-0.2484257, -0.616821, -3.74946, 1, 0, 0, 1, 1,
-0.2446063, -0.7066641, -2.009017, 1, 0, 0, 1, 1,
-0.2432204, 0.2745774, -1.250041, 1, 0, 0, 1, 1,
-0.2412055, -0.1570855, -1.441665, 1, 0, 0, 1, 1,
-0.2401966, -0.1713594, -0.2863106, 1, 0, 0, 1, 1,
-0.2375943, 0.3089122, -1.512291, 0, 0, 0, 1, 1,
-0.2345871, -0.8047806, -3.089336, 0, 0, 0, 1, 1,
-0.2345618, 1.538672, 0.2501034, 0, 0, 0, 1, 1,
-0.231608, -0.1111175, -1.924653, 0, 0, 0, 1, 1,
-0.2305943, 0.3021719, -2.668295, 0, 0, 0, 1, 1,
-0.2300117, -0.9103665, -1.808235, 0, 0, 0, 1, 1,
-0.2293186, 0.02356485, -1.940978, 0, 0, 0, 1, 1,
-0.2262207, -0.4733961, -4.625992, 1, 1, 1, 1, 1,
-0.2234064, 0.4709426, 0.5463954, 1, 1, 1, 1, 1,
-0.2210592, 1.013842, -0.7641584, 1, 1, 1, 1, 1,
-0.2191388, -0.001929834, -1.921717, 1, 1, 1, 1, 1,
-0.2148791, 0.7987804, -0.7064566, 1, 1, 1, 1, 1,
-0.2146663, 0.4360992, 1.674065, 1, 1, 1, 1, 1,
-0.2085526, 0.9618722, 0.552201, 1, 1, 1, 1, 1,
-0.2080945, 0.709236, -0.9608503, 1, 1, 1, 1, 1,
-0.1972703, 0.6893418, 0.3515698, 1, 1, 1, 1, 1,
-0.1970235, -0.4400097, -2.262541, 1, 1, 1, 1, 1,
-0.196171, 1.501882, -1.451553, 1, 1, 1, 1, 1,
-0.1947282, -0.541459, -1.526276, 1, 1, 1, 1, 1,
-0.1934057, -1.199672, -3.004829, 1, 1, 1, 1, 1,
-0.1914884, -0.4274096, -2.318905, 1, 1, 1, 1, 1,
-0.1852185, -0.4107804, -3.74874, 1, 1, 1, 1, 1,
-0.1834183, -1.352274, -3.827772, 0, 0, 1, 1, 1,
-0.1789979, 1.426635, -0.2870071, 1, 0, 0, 1, 1,
-0.1682745, -0.3586333, -2.799065, 1, 0, 0, 1, 1,
-0.1677226, 0.7208329, -1.569254, 1, 0, 0, 1, 1,
-0.1673134, -0.09164573, -3.866403, 1, 0, 0, 1, 1,
-0.1662733, 1.142861, -1.335332, 1, 0, 0, 1, 1,
-0.1659197, -0.2017207, -1.585643, 0, 0, 0, 1, 1,
-0.1649772, -0.8740197, -2.889752, 0, 0, 0, 1, 1,
-0.1634636, -1.536368, -1.406337, 0, 0, 0, 1, 1,
-0.1597536, 0.984275, 1.090465, 0, 0, 0, 1, 1,
-0.159217, -0.4830609, -3.050897, 0, 0, 0, 1, 1,
-0.1555473, -1.279389, -1.998196, 0, 0, 0, 1, 1,
-0.1531463, -0.1189778, -2.327729, 0, 0, 0, 1, 1,
-0.1480237, -0.5830163, -4.482957, 1, 1, 1, 1, 1,
-0.1476648, 0.2824178, -0.3169331, 1, 1, 1, 1, 1,
-0.1442897, 1.526571, 0.6785994, 1, 1, 1, 1, 1,
-0.1442774, -0.3437593, -3.350235, 1, 1, 1, 1, 1,
-0.1401803, -2.357409, -3.549965, 1, 1, 1, 1, 1,
-0.1380737, 0.9204438, 0.2358573, 1, 1, 1, 1, 1,
-0.1329726, -0.7739502, -2.551452, 1, 1, 1, 1, 1,
-0.1317592, 0.8367615, -1.45726, 1, 1, 1, 1, 1,
-0.130501, -0.936506, -2.23911, 1, 1, 1, 1, 1,
-0.1300326, 0.6433533, -0.5040217, 1, 1, 1, 1, 1,
-0.1290028, 1.792459, 1.448818, 1, 1, 1, 1, 1,
-0.1261573, 0.6396384, -0.431895, 1, 1, 1, 1, 1,
-0.1231723, -0.3210042, -2.219987, 1, 1, 1, 1, 1,
-0.1211763, 0.3148504, -0.2122668, 1, 1, 1, 1, 1,
-0.1174822, -1.511867, -3.865309, 1, 1, 1, 1, 1,
-0.1152267, 0.5429552, -0.1825294, 0, 0, 1, 1, 1,
-0.1034872, 0.7605875, -1.331506, 1, 0, 0, 1, 1,
-0.1005077, 0.429474, 0.303388, 1, 0, 0, 1, 1,
-0.09551858, -1.682318, -2.750538, 1, 0, 0, 1, 1,
-0.09485485, 0.7529271, -1.326213, 1, 0, 0, 1, 1,
-0.09231748, -0.4178987, -3.601792, 1, 0, 0, 1, 1,
-0.08515766, -1.445822, -2.51139, 0, 0, 0, 1, 1,
-0.08190763, -0.3547966, -0.6640069, 0, 0, 0, 1, 1,
-0.08108115, -0.8728188, -2.208922, 0, 0, 0, 1, 1,
-0.07165509, -1.242932, -1.813567, 0, 0, 0, 1, 1,
-0.06744342, -1.706408, -2.77279, 0, 0, 0, 1, 1,
-0.06575581, -1.102515, -3.677544, 0, 0, 0, 1, 1,
-0.06491446, -0.3536546, -3.34148, 0, 0, 0, 1, 1,
-0.06484373, -0.6372294, -3.31544, 1, 1, 1, 1, 1,
-0.0637177, 0.4196564, -0.8927799, 1, 1, 1, 1, 1,
-0.06127098, -2.36062, -2.040835, 1, 1, 1, 1, 1,
-0.06105005, -1.479281, -3.527553, 1, 1, 1, 1, 1,
-0.0583405, -2.449541, -3.085646, 1, 1, 1, 1, 1,
-0.05790676, 0.1190703, -1.622735, 1, 1, 1, 1, 1,
-0.05673289, -0.5628324, -2.28891, 1, 1, 1, 1, 1,
-0.05569239, -0.9492896, -3.666936, 1, 1, 1, 1, 1,
-0.05336789, 0.1021148, -0.1864598, 1, 1, 1, 1, 1,
-0.05245937, 0.9992393, 1.147103, 1, 1, 1, 1, 1,
-0.04988878, -0.6770554, -2.573198, 1, 1, 1, 1, 1,
-0.04632946, 2.297567, -1.327579, 1, 1, 1, 1, 1,
-0.04249924, -0.350295, -3.980315, 1, 1, 1, 1, 1,
-0.04134703, -1.621248, -3.58913, 1, 1, 1, 1, 1,
-0.03829699, 0.8853648, -1.148605, 1, 1, 1, 1, 1,
-0.03635745, 0.5010545, -0.01729463, 0, 0, 1, 1, 1,
-0.03543628, 1.429438, -0.1563547, 1, 0, 0, 1, 1,
-0.03411706, 0.5984976, -1.943311, 1, 0, 0, 1, 1,
-0.03262704, -0.8937212, -4.698893, 1, 0, 0, 1, 1,
-0.03137389, 0.7160438, -2.587125, 1, 0, 0, 1, 1,
-0.02797141, 0.48116, -1.376046, 1, 0, 0, 1, 1,
-0.02568988, 0.689864, 0.7623444, 0, 0, 0, 1, 1,
-0.02506022, -0.5654605, -2.839727, 0, 0, 0, 1, 1,
-0.02423231, -0.1142669, -3.504549, 0, 0, 0, 1, 1,
-0.0225744, -1.236491, -3.331311, 0, 0, 0, 1, 1,
-0.02175718, 0.1840153, -0.5009351, 0, 0, 0, 1, 1,
-0.01850762, -0.1938799, -3.446264, 0, 0, 0, 1, 1,
-0.01766406, 2.293729, 1.216097, 0, 0, 0, 1, 1,
-0.0153003, 1.131995, 0.9760454, 1, 1, 1, 1, 1,
-0.01428268, -1.972901, -3.202528, 1, 1, 1, 1, 1,
-0.01246825, -0.8870707, -0.8718334, 1, 1, 1, 1, 1,
-0.01072612, -0.3688314, -1.426707, 1, 1, 1, 1, 1,
-0.009779965, 0.1148495, 1.00163, 1, 1, 1, 1, 1,
-0.008566034, -0.2978632, -2.067225, 1, 1, 1, 1, 1,
-0.001827178, 0.1524962, 1.555568, 1, 1, 1, 1, 1,
0.001317133, 0.3879854, 1.004816, 1, 1, 1, 1, 1,
0.002588291, 0.3140099, -0.06595015, 1, 1, 1, 1, 1,
0.002909498, -1.083328, 2.19514, 1, 1, 1, 1, 1,
0.006677794, 1.494348, -0.9156371, 1, 1, 1, 1, 1,
0.008934207, 1.265668, 0.4060602, 1, 1, 1, 1, 1,
0.0213504, -1.026986, 2.392463, 1, 1, 1, 1, 1,
0.0262913, -0.9828432, 2.199666, 1, 1, 1, 1, 1,
0.0267457, -0.03287457, 2.564202, 1, 1, 1, 1, 1,
0.04013498, -0.5145774, 4.206679, 0, 0, 1, 1, 1,
0.04427123, 1.027774, -1.011358, 1, 0, 0, 1, 1,
0.04747251, 0.5557948, 0.6946943, 1, 0, 0, 1, 1,
0.04903717, 0.7338761, -0.4933261, 1, 0, 0, 1, 1,
0.04934166, 0.4112289, -1.765088, 1, 0, 0, 1, 1,
0.04960808, 1.063007, 1.750423, 1, 0, 0, 1, 1,
0.04985831, -0.4441423, 3.839464, 0, 0, 0, 1, 1,
0.05003859, 0.4298845, 2.172416, 0, 0, 0, 1, 1,
0.05381573, 1.528268, 1.067801, 0, 0, 0, 1, 1,
0.05413149, 0.6630899, 0.3575779, 0, 0, 0, 1, 1,
0.06043015, -0.8570231, 3.600916, 0, 0, 0, 1, 1,
0.06169092, 0.06446179, 1.772203, 0, 0, 0, 1, 1,
0.06533339, -1.253858, 1.77581, 0, 0, 0, 1, 1,
0.06816147, 0.09967241, -1.148226, 1, 1, 1, 1, 1,
0.06871857, -1.110657, 1.522337, 1, 1, 1, 1, 1,
0.06926301, -0.04213268, 1.759412, 1, 1, 1, 1, 1,
0.07024816, -0.6581547, 3.549852, 1, 1, 1, 1, 1,
0.07600327, 0.6588103, 1.502825, 1, 1, 1, 1, 1,
0.07811761, 1.031074, 0.1691915, 1, 1, 1, 1, 1,
0.0782296, 1.156562, 1.477117, 1, 1, 1, 1, 1,
0.07898501, -1.638915, 2.026879, 1, 1, 1, 1, 1,
0.08085717, -0.4247117, 3.47973, 1, 1, 1, 1, 1,
0.08176287, 2.440887, 0.2241652, 1, 1, 1, 1, 1,
0.08373363, -0.6910279, 3.513413, 1, 1, 1, 1, 1,
0.08444902, -0.4913471, 2.202183, 1, 1, 1, 1, 1,
0.09421417, 0.2737668, 0.2221023, 1, 1, 1, 1, 1,
0.09858155, -0.1660786, 0.1762853, 1, 1, 1, 1, 1,
0.105305, -0.4550348, 1.919309, 1, 1, 1, 1, 1,
0.1073699, 0.6385614, 2.241797, 0, 0, 1, 1, 1,
0.1087737, -0.5608866, 3.717392, 1, 0, 0, 1, 1,
0.1139566, -0.5487647, 2.374101, 1, 0, 0, 1, 1,
0.1142558, -0.2351498, 3.783025, 1, 0, 0, 1, 1,
0.1171087, -0.1007254, 2.567001, 1, 0, 0, 1, 1,
0.123879, -0.5795505, 4.203003, 1, 0, 0, 1, 1,
0.132732, -0.2064826, 0.5103527, 0, 0, 0, 1, 1,
0.133421, -1.050251, 2.30289, 0, 0, 0, 1, 1,
0.1373255, -1.224251, 2.771407, 0, 0, 0, 1, 1,
0.1409866, -2.102283, 3.633801, 0, 0, 0, 1, 1,
0.1420803, 0.005488409, 1.502449, 0, 0, 0, 1, 1,
0.1422426, -1.572809, 3.28607, 0, 0, 0, 1, 1,
0.1478934, -0.4673676, 4.142904, 0, 0, 0, 1, 1,
0.1503614, -0.1137806, 0.8652942, 1, 1, 1, 1, 1,
0.1514151, -0.7398055, 1.586987, 1, 1, 1, 1, 1,
0.1525192, 1.076612, 1.046331, 1, 1, 1, 1, 1,
0.1575942, -0.4702861, 2.15977, 1, 1, 1, 1, 1,
0.1593167, 0.8084812, 0.02153321, 1, 1, 1, 1, 1,
0.1614117, 0.2005543, -1.144628, 1, 1, 1, 1, 1,
0.1620312, -1.221469, 3.238328, 1, 1, 1, 1, 1,
0.1638667, 0.3489434, 0.426208, 1, 1, 1, 1, 1,
0.166801, -0.1299151, 2.806018, 1, 1, 1, 1, 1,
0.1695428, -0.04195221, 3.149922, 1, 1, 1, 1, 1,
0.1703437, 1.325752, 0.3473368, 1, 1, 1, 1, 1,
0.1746244, -1.070992, 2.486457, 1, 1, 1, 1, 1,
0.1754881, 0.8382785, -0.2210915, 1, 1, 1, 1, 1,
0.1803974, -0.2845587, 2.273679, 1, 1, 1, 1, 1,
0.1845823, 1.084711, 0.7533478, 1, 1, 1, 1, 1,
0.187415, 0.7214418, 1.368594, 0, 0, 1, 1, 1,
0.1878365, 2.408984, -0.8058352, 1, 0, 0, 1, 1,
0.197173, -0.2626088, 4.164405, 1, 0, 0, 1, 1,
0.200185, 0.3247743, 0.5004503, 1, 0, 0, 1, 1,
0.2026713, 0.3521356, 0.8611243, 1, 0, 0, 1, 1,
0.2031116, 0.3056633, 0.4693639, 1, 0, 0, 1, 1,
0.2063863, 0.4662351, 0.3013807, 0, 0, 0, 1, 1,
0.2109475, -0.9741474, 2.691111, 0, 0, 0, 1, 1,
0.2147309, -1.128078, 1.564818, 0, 0, 0, 1, 1,
0.221301, -0.06959055, 1.097336, 0, 0, 0, 1, 1,
0.2222343, 0.0006081988, 0.2804786, 0, 0, 0, 1, 1,
0.2222875, 0.4085004, 0.2207882, 0, 0, 0, 1, 1,
0.2295928, 0.2052847, 1.542965, 0, 0, 0, 1, 1,
0.2379095, -3.556835, 2.998021, 1, 1, 1, 1, 1,
0.2382222, -0.4074319, 0.7471908, 1, 1, 1, 1, 1,
0.2397381, 0.6981981, -0.4460701, 1, 1, 1, 1, 1,
0.2423472, -0.351078, 2.756821, 1, 1, 1, 1, 1,
0.2444171, 1.762732, -0.2092051, 1, 1, 1, 1, 1,
0.2449716, -0.8520803, 3.684368, 1, 1, 1, 1, 1,
0.2470325, -0.2530914, 3.464715, 1, 1, 1, 1, 1,
0.2494011, -0.6659511, 2.690604, 1, 1, 1, 1, 1,
0.2502815, -0.7294068, 3.521922, 1, 1, 1, 1, 1,
0.2513607, -0.9433125, 2.976512, 1, 1, 1, 1, 1,
0.2575682, -0.3994761, 2.772991, 1, 1, 1, 1, 1,
0.2601288, -0.1534206, 4.257353, 1, 1, 1, 1, 1,
0.2621148, -0.9386867, 2.190955, 1, 1, 1, 1, 1,
0.2628366, -0.5465631, 2.363828, 1, 1, 1, 1, 1,
0.2650971, -0.02820249, 1.573565, 1, 1, 1, 1, 1,
0.2652279, 0.6275045, 0.120517, 0, 0, 1, 1, 1,
0.2665117, -1.083708, 0.7214317, 1, 0, 0, 1, 1,
0.2692143, -0.3532385, 2.277992, 1, 0, 0, 1, 1,
0.2698074, -2.240883, 2.713737, 1, 0, 0, 1, 1,
0.2701717, 0.5294558, 0.2943015, 1, 0, 0, 1, 1,
0.2706981, 0.2943763, 0.9676437, 1, 0, 0, 1, 1,
0.2708475, 0.142251, 2.763887, 0, 0, 0, 1, 1,
0.2712969, -0.01748009, 0.06532681, 0, 0, 0, 1, 1,
0.2760887, 0.6463636, 0.3949321, 0, 0, 0, 1, 1,
0.2767833, 2.000258, -1.002885, 0, 0, 0, 1, 1,
0.2823508, -0.7113969, 2.073069, 0, 0, 0, 1, 1,
0.2828697, -0.688856, 1.816787, 0, 0, 0, 1, 1,
0.2834339, 0.1966912, 0.7534955, 0, 0, 0, 1, 1,
0.2841931, -1.610418, 1.714322, 1, 1, 1, 1, 1,
0.2855142, -0.3541798, 2.986971, 1, 1, 1, 1, 1,
0.2866892, -0.5187134, 2.426474, 1, 1, 1, 1, 1,
0.291418, 2.428745, 1.475714, 1, 1, 1, 1, 1,
0.29173, 1.636702, 0.8291813, 1, 1, 1, 1, 1,
0.2933225, 0.0710552, 0.3565019, 1, 1, 1, 1, 1,
0.3030877, 2.839686, -0.3172114, 1, 1, 1, 1, 1,
0.3040573, -0.140263, 2.198696, 1, 1, 1, 1, 1,
0.304286, 0.007983883, 2.218051, 1, 1, 1, 1, 1,
0.3054845, -1.42405, 4.101243, 1, 1, 1, 1, 1,
0.3078154, 0.4725839, 0.8482267, 1, 1, 1, 1, 1,
0.3104108, 1.005616, -0.6885355, 1, 1, 1, 1, 1,
0.3108799, -1.561375, 3.067809, 1, 1, 1, 1, 1,
0.3118012, 0.6532446, 1.149997, 1, 1, 1, 1, 1,
0.3140905, 0.08764452, 0.5037062, 1, 1, 1, 1, 1,
0.3189403, -0.02061466, 1.845391, 0, 0, 1, 1, 1,
0.321566, -0.4614173, 2.829486, 1, 0, 0, 1, 1,
0.3224258, 0.1509483, 2.501936, 1, 0, 0, 1, 1,
0.3230965, 1.003723, -0.3619783, 1, 0, 0, 1, 1,
0.3273886, 0.1543669, -0.209067, 1, 0, 0, 1, 1,
0.3339565, -2.140185, 2.965212, 1, 0, 0, 1, 1,
0.3343974, -0.06615462, 1.992333, 0, 0, 0, 1, 1,
0.3376053, 0.4538948, 0.4787314, 0, 0, 0, 1, 1,
0.3411261, -0.3065428, 2.5953, 0, 0, 0, 1, 1,
0.3537448, 0.3429267, 1.080277, 0, 0, 0, 1, 1,
0.359349, -0.4758085, 3.178942, 0, 0, 0, 1, 1,
0.3661803, -2.602509, 3.179226, 0, 0, 0, 1, 1,
0.3699358, -1.571636, 4.878822, 0, 0, 0, 1, 1,
0.37392, 0.6035984, 0.1535043, 1, 1, 1, 1, 1,
0.3776767, -1.807491, 3.889112, 1, 1, 1, 1, 1,
0.3791689, -1.17015, 2.586903, 1, 1, 1, 1, 1,
0.3837077, -0.3485152, 0.8821002, 1, 1, 1, 1, 1,
0.3868951, 0.7881755, 1.533136, 1, 1, 1, 1, 1,
0.3893819, 0.2138785, 0.7608613, 1, 1, 1, 1, 1,
0.3894803, 0.2131433, 2.28067, 1, 1, 1, 1, 1,
0.3905987, 2.014578, 0.4718336, 1, 1, 1, 1, 1,
0.3932669, -0.306168, 1.810237, 1, 1, 1, 1, 1,
0.3953521, 1.261243, -0.1683959, 1, 1, 1, 1, 1,
0.3998926, -0.1264002, 2.419255, 1, 1, 1, 1, 1,
0.4032631, -0.4758044, 3.457479, 1, 1, 1, 1, 1,
0.4060177, 1.531252, 0.6563334, 1, 1, 1, 1, 1,
0.4060639, 1.310264, -0.5210723, 1, 1, 1, 1, 1,
0.406736, 1.591132, -0.9153723, 1, 1, 1, 1, 1,
0.4099284, -1.793279, 3.092749, 0, 0, 1, 1, 1,
0.4102396, -0.7917936, 1.453025, 1, 0, 0, 1, 1,
0.4132249, 0.005067973, 2.68556, 1, 0, 0, 1, 1,
0.4177935, -1.792002, 2.901489, 1, 0, 0, 1, 1,
0.421798, 0.04327637, 1.835232, 1, 0, 0, 1, 1,
0.4225134, 2.27259, 0.5670912, 1, 0, 0, 1, 1,
0.4243718, -0.2539276, 1.881489, 0, 0, 0, 1, 1,
0.4243809, 0.3746874, 0.600367, 0, 0, 0, 1, 1,
0.4247835, -0.612102, -1.021356, 0, 0, 0, 1, 1,
0.4321698, -1.999492, 3.363963, 0, 0, 0, 1, 1,
0.4324691, 0.6382957, -0.6497309, 0, 0, 0, 1, 1,
0.4383596, 1.285828, -1.135371, 0, 0, 0, 1, 1,
0.4410722, -0.3567405, 1.92391, 0, 0, 0, 1, 1,
0.441727, 0.9317552, 0.5197903, 1, 1, 1, 1, 1,
0.4421569, 0.5401999, 2.811891, 1, 1, 1, 1, 1,
0.448926, -1.025222, 1.924972, 1, 1, 1, 1, 1,
0.4500927, -1.092605, 2.043071, 1, 1, 1, 1, 1,
0.453835, -0.4841601, 2.530594, 1, 1, 1, 1, 1,
0.4559763, 1.918368, -0.254131, 1, 1, 1, 1, 1,
0.4615662, -1.281344, 1.325261, 1, 1, 1, 1, 1,
0.4616545, -1.307999, 2.60278, 1, 1, 1, 1, 1,
0.4616733, -1.961125, 1.982073, 1, 1, 1, 1, 1,
0.4683023, 1.158917, 0.8231221, 1, 1, 1, 1, 1,
0.4684712, 0.5521166, -0.528596, 1, 1, 1, 1, 1,
0.473215, -1.172575, 3.579055, 1, 1, 1, 1, 1,
0.4749952, -1.030861, 3.37162, 1, 1, 1, 1, 1,
0.4753412, 0.9202546, -0.5544179, 1, 1, 1, 1, 1,
0.4771975, -1.125326, 1.175268, 1, 1, 1, 1, 1,
0.4790691, -0.4457996, 2.254909, 0, 0, 1, 1, 1,
0.4799889, 0.2091395, 0.9900545, 1, 0, 0, 1, 1,
0.4814769, 0.3537983, 1.11433, 1, 0, 0, 1, 1,
0.4905618, -0.3160678, 0.4460776, 1, 0, 0, 1, 1,
0.4974463, 0.9966297, -0.1578139, 1, 0, 0, 1, 1,
0.4976267, -0.5732682, 2.845448, 1, 0, 0, 1, 1,
0.4996544, -0.2875037, 2.961659, 0, 0, 0, 1, 1,
0.500262, -0.2632311, 1.857257, 0, 0, 0, 1, 1,
0.5028898, 0.5937082, 1.263266, 0, 0, 0, 1, 1,
0.5053564, -0.1783858, 1.01273, 0, 0, 0, 1, 1,
0.5096916, 0.5242069, 1.080989, 0, 0, 0, 1, 1,
0.5122102, 1.267934, -1.562441, 0, 0, 0, 1, 1,
0.5148627, -0.518551, 2.862975, 0, 0, 0, 1, 1,
0.5159268, -0.5077744, 1.92573, 1, 1, 1, 1, 1,
0.5187954, -0.5667243, 0.6352753, 1, 1, 1, 1, 1,
0.5193136, -1.454133, 1.285855, 1, 1, 1, 1, 1,
0.5195826, 0.08735438, 2.36058, 1, 1, 1, 1, 1,
0.5196149, 0.7302881, 1.402709, 1, 1, 1, 1, 1,
0.5237532, -0.9413494, 1.908669, 1, 1, 1, 1, 1,
0.5255764, 1.083349, 0.9613422, 1, 1, 1, 1, 1,
0.5267438, 0.1234059, 2.303378, 1, 1, 1, 1, 1,
0.5334748, 0.4975268, -0.0555112, 1, 1, 1, 1, 1,
0.5375431, 1.370946, 1.944106, 1, 1, 1, 1, 1,
0.5405335, -2.103623, 1.951596, 1, 1, 1, 1, 1,
0.5432449, -1.632917, 3.452966, 1, 1, 1, 1, 1,
0.5439811, -2.484304, 2.716741, 1, 1, 1, 1, 1,
0.5484416, -0.4651754, 2.545126, 1, 1, 1, 1, 1,
0.5523847, 0.4816634, 0.8430752, 1, 1, 1, 1, 1,
0.5556896, -0.3956037, 2.001168, 0, 0, 1, 1, 1,
0.5559986, -1.349472, 1.64773, 1, 0, 0, 1, 1,
0.5560302, 1.037568, 0.716413, 1, 0, 0, 1, 1,
0.5678353, -1.280455, 3.740603, 1, 0, 0, 1, 1,
0.5722102, 0.6143696, 1.129925, 1, 0, 0, 1, 1,
0.5752496, -0.2444866, 1.191564, 1, 0, 0, 1, 1,
0.5764754, 1.104359, -1.207515, 0, 0, 0, 1, 1,
0.5791996, -0.4740032, 1.761871, 0, 0, 0, 1, 1,
0.579634, 0.597002, 1.918471, 0, 0, 0, 1, 1,
0.5871954, 1.18324, 0.5397927, 0, 0, 0, 1, 1,
0.592998, 0.9650881, -1.38849, 0, 0, 0, 1, 1,
0.594806, -0.008338002, 0.4135222, 0, 0, 0, 1, 1,
0.5973436, 0.3566957, 1.224068, 0, 0, 0, 1, 1,
0.5973939, -0.2761536, 3.719966, 1, 1, 1, 1, 1,
0.5999527, -0.1510584, 1.656798, 1, 1, 1, 1, 1,
0.6017381, -1.452554, 2.804312, 1, 1, 1, 1, 1,
0.6061825, 0.3077863, 2.322619, 1, 1, 1, 1, 1,
0.6080988, -1.242002, 3.026771, 1, 1, 1, 1, 1,
0.6106508, -1.890159, 5.117599, 1, 1, 1, 1, 1,
0.6131173, -0.4346088, 0.6178008, 1, 1, 1, 1, 1,
0.6156254, 0.2746949, 1.293458, 1, 1, 1, 1, 1,
0.6169203, 0.3270354, 1.771929, 1, 1, 1, 1, 1,
0.6169987, 0.3877948, 1.76096, 1, 1, 1, 1, 1,
0.6195408, 0.3998305, 0.316207, 1, 1, 1, 1, 1,
0.621774, 0.1519508, 0.9020487, 1, 1, 1, 1, 1,
0.6222836, 1.080331, 0.7099835, 1, 1, 1, 1, 1,
0.6231211, 1.274186, -0.7623824, 1, 1, 1, 1, 1,
0.6232529, 0.9654157, -0.7285836, 1, 1, 1, 1, 1,
0.623485, -0.05333436, 0.8570073, 0, 0, 1, 1, 1,
0.6273992, 0.2229844, -0.4921363, 1, 0, 0, 1, 1,
0.630007, -0.2117815, 2.258431, 1, 0, 0, 1, 1,
0.6302146, -1.305466, 2.961548, 1, 0, 0, 1, 1,
0.6321908, 0.3879109, 2.016679, 1, 0, 0, 1, 1,
0.6346715, -1.989967, 3.445022, 1, 0, 0, 1, 1,
0.6371261, 0.1288198, 0.2722766, 0, 0, 0, 1, 1,
0.6391485, 1.17785, 0.1560725, 0, 0, 0, 1, 1,
0.6396134, 0.365252, 0.3620853, 0, 0, 0, 1, 1,
0.6396951, -0.8011384, 4.040494, 0, 0, 0, 1, 1,
0.6427505, -0.3952716, 0.70711, 0, 0, 0, 1, 1,
0.648614, 0.008836347, 1.987345, 0, 0, 0, 1, 1,
0.6494734, 0.03903482, 3.491781, 0, 0, 0, 1, 1,
0.6553431, -0.7371033, 3.121931, 1, 1, 1, 1, 1,
0.6693079, -0.5318652, 1.340228, 1, 1, 1, 1, 1,
0.6704602, -0.4064355, 2.163195, 1, 1, 1, 1, 1,
0.6776565, -0.3514539, 1.478737, 1, 1, 1, 1, 1,
0.6808386, -1.815171, 2.830355, 1, 1, 1, 1, 1,
0.6838064, 0.7339544, 1.678336, 1, 1, 1, 1, 1,
0.6904442, -0.3597617, 2.250947, 1, 1, 1, 1, 1,
0.6921884, -0.1063025, 0.7207611, 1, 1, 1, 1, 1,
0.6928217, -0.3524752, 1.433784, 1, 1, 1, 1, 1,
0.6937057, 0.1111119, 0.2126904, 1, 1, 1, 1, 1,
0.6949831, 0.2307583, 1.880615, 1, 1, 1, 1, 1,
0.6979185, -2.419717, 2.908008, 1, 1, 1, 1, 1,
0.7002492, 2.245769, 0.3601217, 1, 1, 1, 1, 1,
0.7113299, 0.2906734, 2.277771, 1, 1, 1, 1, 1,
0.7211865, 0.7394603, 0.7620862, 1, 1, 1, 1, 1,
0.7212911, -0.1134462, 2.077708, 0, 0, 1, 1, 1,
0.7214543, 0.8792645, 0.8114059, 1, 0, 0, 1, 1,
0.7228871, 0.9601007, -0.1696509, 1, 0, 0, 1, 1,
0.724056, -0.5014938, 1.553729, 1, 0, 0, 1, 1,
0.7247747, -0.4468306, 2.39876, 1, 0, 0, 1, 1,
0.7294528, -0.8905761, 1.573532, 1, 0, 0, 1, 1,
0.7355294, 0.7663502, -0.505592, 0, 0, 0, 1, 1,
0.7365888, 1.381817, -0.2289284, 0, 0, 0, 1, 1,
0.738179, 0.8536284, -0.4689783, 0, 0, 0, 1, 1,
0.7382129, 1.192179, 1.90718, 0, 0, 0, 1, 1,
0.7409418, 0.06297582, 0.5556079, 0, 0, 0, 1, 1,
0.7578407, -0.5047089, 2.292784, 0, 0, 0, 1, 1,
0.761583, 0.1313075, 2.412067, 0, 0, 0, 1, 1,
0.7628292, 0.036026, 0.3477464, 1, 1, 1, 1, 1,
0.7675173, 0.8654016, 0.0412025, 1, 1, 1, 1, 1,
0.7683391, 0.02255465, 0.4819548, 1, 1, 1, 1, 1,
0.7694771, -0.01055018, 0.8623227, 1, 1, 1, 1, 1,
0.7700964, 0.9054038, 1.244516, 1, 1, 1, 1, 1,
0.7748609, -0.7600387, 2.604525, 1, 1, 1, 1, 1,
0.7793064, 0.7934254, -1.244821, 1, 1, 1, 1, 1,
0.7869931, -2.042938, 4.095996, 1, 1, 1, 1, 1,
0.7872636, -1.305245, 2.255038, 1, 1, 1, 1, 1,
0.7902011, 0.7694153, 0.1648809, 1, 1, 1, 1, 1,
0.7956672, 0.1097682, 2.110536, 1, 1, 1, 1, 1,
0.7962819, -2.40379, 3.216408, 1, 1, 1, 1, 1,
0.8016497, 1.325905, 0.3444004, 1, 1, 1, 1, 1,
0.8046733, 2.183539, -0.9319453, 1, 1, 1, 1, 1,
0.8120762, 0.8776942, -0.7933723, 1, 1, 1, 1, 1,
0.8142793, 0.1021511, -0.5234529, 0, 0, 1, 1, 1,
0.8189142, -0.8936997, 1.001261, 1, 0, 0, 1, 1,
0.8207367, -2.377073, 2.134279, 1, 0, 0, 1, 1,
0.8245131, 1.19852, 1.028279, 1, 0, 0, 1, 1,
0.826106, 0.759691, 1.635967, 1, 0, 0, 1, 1,
0.8284276, 0.4428898, 0.0561754, 1, 0, 0, 1, 1,
0.8294185, 1.087089, 0.6400098, 0, 0, 0, 1, 1,
0.8355318, -0.08383413, 2.551789, 0, 0, 0, 1, 1,
0.8368343, -0.8896563, 2.910501, 0, 0, 0, 1, 1,
0.8371506, -0.1592982, 1.617755, 0, 0, 0, 1, 1,
0.8374885, -0.2059146, 2.399172, 0, 0, 0, 1, 1,
0.8403648, 2.360498, -2.125165, 0, 0, 0, 1, 1,
0.8444843, 0.0161165, 2.676383, 0, 0, 0, 1, 1,
0.8505177, -0.4725839, 4.104913, 1, 1, 1, 1, 1,
0.8554899, 0.4467892, 0.5935729, 1, 1, 1, 1, 1,
0.8653848, -0.1612491, 2.495859, 1, 1, 1, 1, 1,
0.8655143, 1.099235, 1.805691, 1, 1, 1, 1, 1,
0.8707411, 0.973188, -2.014621, 1, 1, 1, 1, 1,
0.8837053, 1.090981, -1.29138, 1, 1, 1, 1, 1,
0.8857394, 0.4984729, 0.2379854, 1, 1, 1, 1, 1,
0.8918209, 0.7124076, 2.947446, 1, 1, 1, 1, 1,
0.8948801, -0.788662, 3.691305, 1, 1, 1, 1, 1,
0.910555, 0.4658471, -0.04695237, 1, 1, 1, 1, 1,
0.9143454, 1.504543, 0.4406153, 1, 1, 1, 1, 1,
0.9207484, -1.437965, 2.691607, 1, 1, 1, 1, 1,
0.9246014, 0.5812054, -0.1715078, 1, 1, 1, 1, 1,
0.9258903, -0.7896822, 3.954759, 1, 1, 1, 1, 1,
0.9280102, -0.2517435, 2.081279, 1, 1, 1, 1, 1,
0.9354718, -1.381056, 3.172317, 0, 0, 1, 1, 1,
0.9390362, 0.8493807, 0.4364223, 1, 0, 0, 1, 1,
0.9392419, 0.2262312, 1.822932, 1, 0, 0, 1, 1,
0.9409202, -1.388256, 3.508663, 1, 0, 0, 1, 1,
0.9427283, 0.06851148, 2.25474, 1, 0, 0, 1, 1,
0.9453525, -1.229677, 1.410779, 1, 0, 0, 1, 1,
0.9459441, 0.8015099, 0.450013, 0, 0, 0, 1, 1,
0.9540914, -0.9454391, 1.521633, 0, 0, 0, 1, 1,
0.9541025, 0.03245503, 1.10534, 0, 0, 0, 1, 1,
0.9543681, -1.59644, 1.536991, 0, 0, 0, 1, 1,
0.9544411, 1.53954, 1.312212, 0, 0, 0, 1, 1,
0.9548373, 0.1500984, 1.345046, 0, 0, 0, 1, 1,
0.9548866, 0.134795, 0.8608091, 0, 0, 0, 1, 1,
0.959582, 0.8908609, 1.0488, 1, 1, 1, 1, 1,
0.9596763, 0.9342481, 4.038746, 1, 1, 1, 1, 1,
0.9648135, -1.43827, 1.203149, 1, 1, 1, 1, 1,
0.9678923, -0.236792, 0.7941399, 1, 1, 1, 1, 1,
0.9694289, -2.24503, 2.908098, 1, 1, 1, 1, 1,
0.9699075, 1.049958, -0.2614776, 1, 1, 1, 1, 1,
0.9764018, -1.319534, 4.823295, 1, 1, 1, 1, 1,
0.9843876, 0.1976038, 2.896385, 1, 1, 1, 1, 1,
0.9954734, 1.605661, 2.864965, 1, 1, 1, 1, 1,
0.9976392, -0.2041513, 1.633562, 1, 1, 1, 1, 1,
0.9998925, 0.641214, 0.2525068, 1, 1, 1, 1, 1,
1.000791, 3.300552, -0.1137058, 1, 1, 1, 1, 1,
1.00271, -0.3822973, 2.404165, 1, 1, 1, 1, 1,
1.008803, 0.1515626, 4.161893, 1, 1, 1, 1, 1,
1.009812, 0.6974144, 2.124755, 1, 1, 1, 1, 1,
1.011455, -1.141054, 1.153872, 0, 0, 1, 1, 1,
1.011652, 0.1780421, 1.36114, 1, 0, 0, 1, 1,
1.015349, 0.5442665, -0.1448341, 1, 0, 0, 1, 1,
1.019565, -0.5579205, 2.722914, 1, 0, 0, 1, 1,
1.022712, 0.40655, 2.071368, 1, 0, 0, 1, 1,
1.023712, 0.06145981, 1.787734, 1, 0, 0, 1, 1,
1.02503, 0.1601901, -0.2643099, 0, 0, 0, 1, 1,
1.025467, -0.04573901, 0.6529008, 0, 0, 0, 1, 1,
1.028207, 0.2256902, 1.656798, 0, 0, 0, 1, 1,
1.02983, -0.4492857, 1.589904, 0, 0, 0, 1, 1,
1.032395, -0.9985611, 3.048711, 0, 0, 0, 1, 1,
1.034858, 0.4442266, 0.07138211, 0, 0, 0, 1, 1,
1.038653, -0.6755563, 1.500748, 0, 0, 0, 1, 1,
1.040458, 0.1061566, 1.616721, 1, 1, 1, 1, 1,
1.042461, -1.339981, 3.71079, 1, 1, 1, 1, 1,
1.045342, -0.9702035, 1.619912, 1, 1, 1, 1, 1,
1.046624, 1.000346, -0.6408603, 1, 1, 1, 1, 1,
1.052312, 2.337961, -0.2876072, 1, 1, 1, 1, 1,
1.052465, -0.8329746, 0.9563978, 1, 1, 1, 1, 1,
1.053305, 0.5811653, 1.458129, 1, 1, 1, 1, 1,
1.053908, -0.06442422, 0.008554319, 1, 1, 1, 1, 1,
1.054096, 0.2087637, 1.641914, 1, 1, 1, 1, 1,
1.05583, 0.7609828, 0.3549125, 1, 1, 1, 1, 1,
1.056295, 1.991059, 0.72615, 1, 1, 1, 1, 1,
1.063858, 0.4913898, 0.6457167, 1, 1, 1, 1, 1,
1.070475, 0.5264754, 0.7547536, 1, 1, 1, 1, 1,
1.075648, 0.6791528, 0.758826, 1, 1, 1, 1, 1,
1.077252, 0.8971741, 1.963057, 1, 1, 1, 1, 1,
1.078072, 0.7514845, 1.063613, 0, 0, 1, 1, 1,
1.087013, 0.3962387, 2.034638, 1, 0, 0, 1, 1,
1.093337, 1.038035, -0.9236658, 1, 0, 0, 1, 1,
1.09956, 0.6498775, 1.690241, 1, 0, 0, 1, 1,
1.099818, -0.1749036, 0.3257166, 1, 0, 0, 1, 1,
1.103192, 0.435888, 0.5403337, 1, 0, 0, 1, 1,
1.103623, 0.2605754, 0.8746995, 0, 0, 0, 1, 1,
1.109848, -1.468674, 3.355413, 0, 0, 0, 1, 1,
1.110094, -0.03378175, 2.303696, 0, 0, 0, 1, 1,
1.12167, 0.2204842, 1.066844, 0, 0, 0, 1, 1,
1.126315, 1.913365, -0.6945335, 0, 0, 0, 1, 1,
1.136925, 1.614231, 0.8581982, 0, 0, 0, 1, 1,
1.138324, -1.587465, 2.151587, 0, 0, 0, 1, 1,
1.144654, -1.093472, 2.87886, 1, 1, 1, 1, 1,
1.169913, -1.170877, 2.879671, 1, 1, 1, 1, 1,
1.170889, -0.5451686, -0.1486367, 1, 1, 1, 1, 1,
1.171097, 0.3241138, 0.9819957, 1, 1, 1, 1, 1,
1.177434, 0.5498371, 0.375599, 1, 1, 1, 1, 1,
1.18103, -0.9931499, 3.293541, 1, 1, 1, 1, 1,
1.190265, 1.198494, 1.00351, 1, 1, 1, 1, 1,
1.191023, -1.583535, 0.1381027, 1, 1, 1, 1, 1,
1.194672, 0.2060955, 1.175872, 1, 1, 1, 1, 1,
1.197934, 0.1729376, 0.6902894, 1, 1, 1, 1, 1,
1.199608, -1.197144, 3.619538, 1, 1, 1, 1, 1,
1.201725, 0.4844156, -0.4482855, 1, 1, 1, 1, 1,
1.218067, 1.004143, 2.003382, 1, 1, 1, 1, 1,
1.227585, 0.5682473, 0.9984674, 1, 1, 1, 1, 1,
1.231071, -0.004467651, 0.764464, 1, 1, 1, 1, 1,
1.233145, -0.03831972, 1.532558, 0, 0, 1, 1, 1,
1.239717, 1.473405, 1.205697, 1, 0, 0, 1, 1,
1.245183, 2.236206, 0.5699638, 1, 0, 0, 1, 1,
1.252511, -1.993471, 0.8710695, 1, 0, 0, 1, 1,
1.267633, 0.3848041, 0.6944641, 1, 0, 0, 1, 1,
1.267726, -1.024708, 2.074515, 1, 0, 0, 1, 1,
1.284763, 0.06000472, 2.452528, 0, 0, 0, 1, 1,
1.291213, -1.106171, 2.656307, 0, 0, 0, 1, 1,
1.294834, -1.961598, 2.449154, 0, 0, 0, 1, 1,
1.313175, 0.8709559, 2.071217, 0, 0, 0, 1, 1,
1.313678, 1.239491, 1.252562, 0, 0, 0, 1, 1,
1.316918, -1.183709, 2.54204, 0, 0, 0, 1, 1,
1.318681, -0.6058816, 2.160696, 0, 0, 0, 1, 1,
1.33406, -0.1103714, 2.494988, 1, 1, 1, 1, 1,
1.337425, 0.4948722, 1.442025, 1, 1, 1, 1, 1,
1.344086, -0.257625, 2.020493, 1, 1, 1, 1, 1,
1.344908, -0.3435203, 0.8500417, 1, 1, 1, 1, 1,
1.347476, -1.788366, 2.477103, 1, 1, 1, 1, 1,
1.350535, 0.4254826, 2.075199, 1, 1, 1, 1, 1,
1.350724, -0.2159354, 2.596381, 1, 1, 1, 1, 1,
1.352047, 0.9038453, 0.9206139, 1, 1, 1, 1, 1,
1.354148, -0.633193, 2.430568, 1, 1, 1, 1, 1,
1.360137, -0.1953841, 1.446109, 1, 1, 1, 1, 1,
1.360824, 1.061444, 1.012192, 1, 1, 1, 1, 1,
1.361726, -0.8696559, 2.651224, 1, 1, 1, 1, 1,
1.371552, -0.6466841, 1.480276, 1, 1, 1, 1, 1,
1.372639, -0.3664536, 1.145943, 1, 1, 1, 1, 1,
1.378929, 0.2211509, 2.742651, 1, 1, 1, 1, 1,
1.38722, 0.8760111, 1.050478, 0, 0, 1, 1, 1,
1.389128, 1.006309, 2.371645, 1, 0, 0, 1, 1,
1.404866, -0.3538943, 0.0849907, 1, 0, 0, 1, 1,
1.405783, -0.7377636, 4.939355, 1, 0, 0, 1, 1,
1.418972, -0.6071758, 0.5857918, 1, 0, 0, 1, 1,
1.426541, -1.151362, 2.387325, 1, 0, 0, 1, 1,
1.433375, -0.9664881, 2.325531, 0, 0, 0, 1, 1,
1.441506, 0.7650001, 2.55821, 0, 0, 0, 1, 1,
1.451105, 0.3605781, 0.2360509, 0, 0, 0, 1, 1,
1.463946, -0.09753868, 1.509906, 0, 0, 0, 1, 1,
1.464711, -0.9462826, 1.24328, 0, 0, 0, 1, 1,
1.477109, -0.01121413, 2.759014, 0, 0, 0, 1, 1,
1.480178, -0.06731974, 3.083949, 0, 0, 0, 1, 1,
1.483402, 0.6267611, 1.358625, 1, 1, 1, 1, 1,
1.49808, 0.2824959, 1.308206, 1, 1, 1, 1, 1,
1.525243, -0.4275881, 2.41608, 1, 1, 1, 1, 1,
1.527397, 1.140435, -0.4822207, 1, 1, 1, 1, 1,
1.531107, -0.7827808, 0.1472098, 1, 1, 1, 1, 1,
1.537352, 0.08799933, -0.1285158, 1, 1, 1, 1, 1,
1.539553, -0.5913565, 3.603944, 1, 1, 1, 1, 1,
1.542954, 0.1039121, 1.567617, 1, 1, 1, 1, 1,
1.556565, -0.7120534, 2.583449, 1, 1, 1, 1, 1,
1.557708, 0.3029595, 0.1018511, 1, 1, 1, 1, 1,
1.557956, 0.9934183, 3.901589, 1, 1, 1, 1, 1,
1.565451, -0.9286511, 0.517819, 1, 1, 1, 1, 1,
1.566214, -0.3834855, 3.774009, 1, 1, 1, 1, 1,
1.591884, 0.6132162, 0.9091461, 1, 1, 1, 1, 1,
1.595175, -1.03547, 2.35549, 1, 1, 1, 1, 1,
1.597315, -1.638771, 3.249976, 0, 0, 1, 1, 1,
1.633988, -1.584168, 2.922487, 1, 0, 0, 1, 1,
1.634978, 1.108273, -0.02397477, 1, 0, 0, 1, 1,
1.63527, 0.5725368, 1.791692, 1, 0, 0, 1, 1,
1.643379, 0.8867772, 2.142613, 1, 0, 0, 1, 1,
1.657837, 0.02483356, 0.2489289, 1, 0, 0, 1, 1,
1.668172, 1.574651, 1.28948, 0, 0, 0, 1, 1,
1.670381, 0.209001, 1.537738, 0, 0, 0, 1, 1,
1.673757, -0.705583, 1.922865, 0, 0, 0, 1, 1,
1.691216, 1.138083, 0.7576126, 0, 0, 0, 1, 1,
1.692255, 1.298428, 1.497553, 0, 0, 0, 1, 1,
1.69386, 0.3033301, 2.338312, 0, 0, 0, 1, 1,
1.740236, 1.874798, 1.72077, 0, 0, 0, 1, 1,
1.746728, -0.04050325, 2.704313, 1, 1, 1, 1, 1,
1.773637, -2.402885, 1.966939, 1, 1, 1, 1, 1,
1.794857, 0.4709393, 1.358456, 1, 1, 1, 1, 1,
1.834552, -1.535896, 1.974078, 1, 1, 1, 1, 1,
1.839778, -1.083076, 2.197581, 1, 1, 1, 1, 1,
1.844388, -0.7432604, 3.299899, 1, 1, 1, 1, 1,
1.859529, -0.1057728, 1.689303, 1, 1, 1, 1, 1,
1.867976, 0.4447768, 3.113606, 1, 1, 1, 1, 1,
1.895175, 1.808124, -0.120719, 1, 1, 1, 1, 1,
1.903533, 0.8578482, 0.7144801, 1, 1, 1, 1, 1,
1.910203, -0.3877918, 2.73923, 1, 1, 1, 1, 1,
1.92514, -2.22603, 4.205787, 1, 1, 1, 1, 1,
1.957631, 0.1713764, 0.4249907, 1, 1, 1, 1, 1,
1.966259, -0.4232515, 2.799302, 1, 1, 1, 1, 1,
1.979426, -2.107136, 3.650537, 1, 1, 1, 1, 1,
1.996003, -0.1467928, 3.194563, 0, 0, 1, 1, 1,
1.996278, -0.1041585, 1.761484, 1, 0, 0, 1, 1,
2.010483, -1.415711, 2.236803, 1, 0, 0, 1, 1,
2.025676, 0.4389728, 2.345305, 1, 0, 0, 1, 1,
2.055599, 0.5919835, 1.000594, 1, 0, 0, 1, 1,
2.075506, 0.4393789, 1.09882, 1, 0, 0, 1, 1,
2.080499, 0.6136147, 1.146355, 0, 0, 0, 1, 1,
2.14427, -0.8267817, 0.31057, 0, 0, 0, 1, 1,
2.150955, -0.03499409, 1.603179, 0, 0, 0, 1, 1,
2.222535, -0.9341987, 2.575526, 0, 0, 0, 1, 1,
2.234326, -0.8449129, 1.250073, 0, 0, 0, 1, 1,
2.251354, 0.2687853, 0.4995626, 0, 0, 0, 1, 1,
2.271116, -2.370357, 1.997671, 0, 0, 0, 1, 1,
2.276953, -1.000949, 2.146681, 1, 1, 1, 1, 1,
2.390379, 0.5576909, 0.3127277, 1, 1, 1, 1, 1,
2.410207, 1.401175, 0.3183298, 1, 1, 1, 1, 1,
2.449013, -0.07876501, 0.418067, 1, 1, 1, 1, 1,
2.717656, 0.3494293, 1.388974, 1, 1, 1, 1, 1,
3.397918, -0.06813999, 1.483348, 1, 1, 1, 1, 1,
3.442933, -0.5349556, 2.223365, 1, 1, 1, 1, 1
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
var radius = 9.675199;
var distance = 33.98373;
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
mvMatrix.translate( -0.2549118, 0.1347814, 0.2189231 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.98373);
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
