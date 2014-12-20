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
-3.106743, -1.177356, -2.421366, 1, 0, 0, 1,
-2.785404, -0.1808425, -2.09432, 1, 0.007843138, 0, 1,
-2.770657, 0.3199612, -1.1412, 1, 0.01176471, 0, 1,
-2.762884, 0.4321087, -3.058976, 1, 0.01960784, 0, 1,
-2.527471, -0.1603321, -2.689058, 1, 0.02352941, 0, 1,
-2.51696, -1.052728, 0.5420407, 1, 0.03137255, 0, 1,
-2.487546, 1.32359, 0.9801062, 1, 0.03529412, 0, 1,
-2.393334, 0.02977025, -0.8257779, 1, 0.04313726, 0, 1,
-2.370799, -0.8368759, -1.289154, 1, 0.04705882, 0, 1,
-2.272236, -0.7860093, -1.20266, 1, 0.05490196, 0, 1,
-2.169644, -0.6243235, -1.100553, 1, 0.05882353, 0, 1,
-2.150231, 1.374327, -1.387452, 1, 0.06666667, 0, 1,
-2.115895, 0.5774906, -1.916806, 1, 0.07058824, 0, 1,
-2.114963, -0.5571755, -3.003952, 1, 0.07843138, 0, 1,
-2.111009, -1.918259, -1.225288, 1, 0.08235294, 0, 1,
-2.098704, 1.383888, -1.331267, 1, 0.09019608, 0, 1,
-2.096269, -1.309536, -2.489245, 1, 0.09411765, 0, 1,
-2.08917, -2.102145, -3.891631, 1, 0.1019608, 0, 1,
-2.038207, -0.2855472, -0.9709673, 1, 0.1098039, 0, 1,
-2.033018, -0.2469817, -2.068847, 1, 0.1137255, 0, 1,
-2.026712, -1.098255, -0.8436558, 1, 0.1215686, 0, 1,
-2.003439, -0.5618179, 0.5163282, 1, 0.1254902, 0, 1,
-1.986293, -0.9838725, -2.612859, 1, 0.1333333, 0, 1,
-1.94153, -0.7854785, -2.515386, 1, 0.1372549, 0, 1,
-1.937262, -0.2712432, -0.1969211, 1, 0.145098, 0, 1,
-1.932202, -0.1137818, -2.342788, 1, 0.1490196, 0, 1,
-1.927821, -0.5300959, 1.056401, 1, 0.1568628, 0, 1,
-1.879969, 0.381052, -1.804168, 1, 0.1607843, 0, 1,
-1.873889, 0.1768551, -0.3499683, 1, 0.1686275, 0, 1,
-1.872106, -0.4524196, -1.247091, 1, 0.172549, 0, 1,
-1.863984, -0.3592885, -2.042527, 1, 0.1803922, 0, 1,
-1.852275, -0.02496175, -0.9560854, 1, 0.1843137, 0, 1,
-1.851263, 0.4202268, -0.783327, 1, 0.1921569, 0, 1,
-1.845132, 0.6886647, -1.703986, 1, 0.1960784, 0, 1,
-1.821318, 0.7043554, -2.335464, 1, 0.2039216, 0, 1,
-1.808845, 0.112122, -1.077321, 1, 0.2117647, 0, 1,
-1.786068, -0.03373402, -0.6615835, 1, 0.2156863, 0, 1,
-1.780895, -0.5515623, -1.475107, 1, 0.2235294, 0, 1,
-1.770219, 1.707801, -1.016136, 1, 0.227451, 0, 1,
-1.751284, -0.17473, -0.6899551, 1, 0.2352941, 0, 1,
-1.746637, 0.3167596, -1.469311, 1, 0.2392157, 0, 1,
-1.745959, -1.250122, -1.951417, 1, 0.2470588, 0, 1,
-1.742557, 1.24542, 0.1507655, 1, 0.2509804, 0, 1,
-1.730385, 0.02628649, 0.252565, 1, 0.2588235, 0, 1,
-1.726871, 1.95843, -1.456463, 1, 0.2627451, 0, 1,
-1.715356, -0.4598133, -1.742332, 1, 0.2705882, 0, 1,
-1.710806, 0.8211692, -0.8428198, 1, 0.2745098, 0, 1,
-1.706583, -0.1342404, -0.1296588, 1, 0.282353, 0, 1,
-1.700621, -1.684628, -4.341336, 1, 0.2862745, 0, 1,
-1.692361, 1.285131, -0.9215274, 1, 0.2941177, 0, 1,
-1.683146, 2.061709, -0.8930683, 1, 0.3019608, 0, 1,
-1.682347, -0.4305397, -1.424257, 1, 0.3058824, 0, 1,
-1.671771, -0.5641072, -1.262306, 1, 0.3137255, 0, 1,
-1.66307, -0.4922129, -2.324172, 1, 0.3176471, 0, 1,
-1.642021, -0.1563322, -0.6838655, 1, 0.3254902, 0, 1,
-1.638448, -0.3789372, -3.710935, 1, 0.3294118, 0, 1,
-1.637622, -0.3843806, -1.304755, 1, 0.3372549, 0, 1,
-1.633946, -1.350138, -1.839888, 1, 0.3411765, 0, 1,
-1.62801, 0.4636399, -1.239796, 1, 0.3490196, 0, 1,
-1.618906, 0.1162198, -3.18027, 1, 0.3529412, 0, 1,
-1.618612, 0.3627659, 0.05940769, 1, 0.3607843, 0, 1,
-1.612941, -0.1310378, -1.854621, 1, 0.3647059, 0, 1,
-1.606587, 0.08646884, -1.765128, 1, 0.372549, 0, 1,
-1.598498, -0.9638718, -1.464803, 1, 0.3764706, 0, 1,
-1.590554, -1.404121, -3.644421, 1, 0.3843137, 0, 1,
-1.574921, 0.2077186, -2.238901, 1, 0.3882353, 0, 1,
-1.551353, 0.1357038, -0.6227796, 1, 0.3960784, 0, 1,
-1.546218, -0.7204162, -1.13469, 1, 0.4039216, 0, 1,
-1.508322, -0.3313826, -2.014178, 1, 0.4078431, 0, 1,
-1.492753, -0.1790885, -0.0826358, 1, 0.4156863, 0, 1,
-1.488518, -0.2492552, -2.221578, 1, 0.4196078, 0, 1,
-1.480147, -1.34485, -2.788488, 1, 0.427451, 0, 1,
-1.472837, -0.997767, -3.216261, 1, 0.4313726, 0, 1,
-1.471266, -0.1287992, -1.625921, 1, 0.4392157, 0, 1,
-1.470852, -0.2421393, -0.1676718, 1, 0.4431373, 0, 1,
-1.466287, -0.1320898, -0.8288037, 1, 0.4509804, 0, 1,
-1.464741, 1.892552, 1.434282, 1, 0.454902, 0, 1,
-1.460782, -0.3508168, 0.1615492, 1, 0.4627451, 0, 1,
-1.45388, 1.003699, 0.3375544, 1, 0.4666667, 0, 1,
-1.43346, 1.340702, -0.2966533, 1, 0.4745098, 0, 1,
-1.426015, 1.217367, -2.491227, 1, 0.4784314, 0, 1,
-1.410903, 6.361481e-05, -2.388104, 1, 0.4862745, 0, 1,
-1.391511, -0.9451621, -1.845838, 1, 0.4901961, 0, 1,
-1.389513, -0.8512496, -0.8451158, 1, 0.4980392, 0, 1,
-1.382327, -0.01537905, 0.1567336, 1, 0.5058824, 0, 1,
-1.382137, 0.1049962, -0.1567446, 1, 0.509804, 0, 1,
-1.380975, -0.2067791, -2.423813, 1, 0.5176471, 0, 1,
-1.375994, -1.414652, -2.084062, 1, 0.5215687, 0, 1,
-1.373751, -0.6611027, -2.782841, 1, 0.5294118, 0, 1,
-1.371388, 1.401483, 0.3136963, 1, 0.5333334, 0, 1,
-1.36596, 0.5713881, -1.882369, 1, 0.5411765, 0, 1,
-1.358419, 0.357876, -1.438848, 1, 0.5450981, 0, 1,
-1.322058, 1.578735, 1.115496, 1, 0.5529412, 0, 1,
-1.320829, 0.6854488, -0.6373037, 1, 0.5568628, 0, 1,
-1.320826, -1.626278, -2.073673, 1, 0.5647059, 0, 1,
-1.317148, 0.5475127, -3.868832, 1, 0.5686275, 0, 1,
-1.305215, 1.012131, -0.5993742, 1, 0.5764706, 0, 1,
-1.297016, 1.427927, -1.754398, 1, 0.5803922, 0, 1,
-1.288352, -0.532854, -2.370745, 1, 0.5882353, 0, 1,
-1.283721, 0.2314779, -2.060994, 1, 0.5921569, 0, 1,
-1.275514, 0.9204065, 0.08221681, 1, 0.6, 0, 1,
-1.271539, -2.348858, -2.245615, 1, 0.6078432, 0, 1,
-1.2667, -0.6763324, -3.262041, 1, 0.6117647, 0, 1,
-1.260031, 0.7307323, -1.261029, 1, 0.6196079, 0, 1,
-1.248764, 0.3181942, -2.789009, 1, 0.6235294, 0, 1,
-1.238393, -1.205204, -2.236482, 1, 0.6313726, 0, 1,
-1.233019, -0.5707542, -1.819999, 1, 0.6352941, 0, 1,
-1.231213, -1.404487, -2.450512, 1, 0.6431373, 0, 1,
-1.223843, 0.5252311, -0.7973632, 1, 0.6470588, 0, 1,
-1.219315, 0.801055, 0.4375081, 1, 0.654902, 0, 1,
-1.218959, 1.460938, -0.1959555, 1, 0.6588235, 0, 1,
-1.215084, 2.095194, -1.339958, 1, 0.6666667, 0, 1,
-1.211196, -1.6912, -2.837573, 1, 0.6705883, 0, 1,
-1.192369, 0.9494051, -1.009048, 1, 0.6784314, 0, 1,
-1.190684, -0.3669177, -2.708941, 1, 0.682353, 0, 1,
-1.189064, 0.06112036, -0.4063105, 1, 0.6901961, 0, 1,
-1.181477, 0.3997041, -2.16264, 1, 0.6941177, 0, 1,
-1.179262, -0.9522173, -1.168195, 1, 0.7019608, 0, 1,
-1.172301, -0.6589164, -1.600245, 1, 0.7098039, 0, 1,
-1.157167, -2.294953, -0.4730674, 1, 0.7137255, 0, 1,
-1.142997, -0.7174619, -2.870236, 1, 0.7215686, 0, 1,
-1.137778, -0.9541996, -1.499468, 1, 0.7254902, 0, 1,
-1.123728, 1.531218, -0.6026358, 1, 0.7333333, 0, 1,
-1.121379, -2.105134, -4.092804, 1, 0.7372549, 0, 1,
-1.120768, -0.2473559, -1.656758, 1, 0.7450981, 0, 1,
-1.109433, 0.4459593, -0.6312189, 1, 0.7490196, 0, 1,
-1.109395, 0.09580998, -1.703734, 1, 0.7568628, 0, 1,
-1.096177, 0.08415997, -2.714884, 1, 0.7607843, 0, 1,
-1.089443, 0.5444887, -2.167389, 1, 0.7686275, 0, 1,
-1.087322, 0.4455766, 0.2121994, 1, 0.772549, 0, 1,
-1.08718, -1.739839, -1.242227, 1, 0.7803922, 0, 1,
-1.077052, -0.2659056, -1.113302, 1, 0.7843137, 0, 1,
-1.072679, -2.588642, -3.89627, 1, 0.7921569, 0, 1,
-1.07068, -0.4863884, -1.434532, 1, 0.7960784, 0, 1,
-1.057999, -1.263724, -2.72379, 1, 0.8039216, 0, 1,
-1.05235, -2.464278, -2.297158, 1, 0.8117647, 0, 1,
-1.049598, -0.9222936, -1.255666, 1, 0.8156863, 0, 1,
-1.044949, 1.903769, -0.4265472, 1, 0.8235294, 0, 1,
-1.04484, 0.9963546, -1.442741, 1, 0.827451, 0, 1,
-1.044017, 0.1994473, -1.551824, 1, 0.8352941, 0, 1,
-1.041005, -0.03299911, -0.9984285, 1, 0.8392157, 0, 1,
-1.039617, 1.491763, -1.320681, 1, 0.8470588, 0, 1,
-1.036749, 0.1063839, -0.8748851, 1, 0.8509804, 0, 1,
-1.035043, -0.471895, -3.053465, 1, 0.8588235, 0, 1,
-1.033653, 0.1019424, -0.1238917, 1, 0.8627451, 0, 1,
-1.032989, 0.6183347, 0.2948311, 1, 0.8705882, 0, 1,
-1.028165, 0.9655628, -0.7535043, 1, 0.8745098, 0, 1,
-1.027004, -0.7785124, -0.3270944, 1, 0.8823529, 0, 1,
-1.021073, 0.1852829, -0.5584879, 1, 0.8862745, 0, 1,
-1.01866, -1.942644, -2.630651, 1, 0.8941177, 0, 1,
-1.016857, -1.451562, -2.576458, 1, 0.8980392, 0, 1,
-1.013705, 0.09640993, -1.532668, 1, 0.9058824, 0, 1,
-1.010994, -1.303847, -1.381599, 1, 0.9137255, 0, 1,
-1.001739, 1.597102, -1.235218, 1, 0.9176471, 0, 1,
-0.999039, 1.042307, -1.902784, 1, 0.9254902, 0, 1,
-0.9987994, 0.9862086, -1.23895, 1, 0.9294118, 0, 1,
-0.9891675, 0.1956621, -1.844343, 1, 0.9372549, 0, 1,
-0.9826892, 0.4366807, -2.638629, 1, 0.9411765, 0, 1,
-0.9811627, 1.607988, -0.6912438, 1, 0.9490196, 0, 1,
-0.9811572, 0.03514281, -0.5360024, 1, 0.9529412, 0, 1,
-0.9724403, 0.1759537, 0.8377569, 1, 0.9607843, 0, 1,
-0.960477, -0.1818475, -3.063592, 1, 0.9647059, 0, 1,
-0.9602903, -2.686905, -2.301974, 1, 0.972549, 0, 1,
-0.9599258, -1.85152, -4.717944, 1, 0.9764706, 0, 1,
-0.9533043, 0.7175421, -0.9069121, 1, 0.9843137, 0, 1,
-0.9494818, -0.2170611, -3.128695, 1, 0.9882353, 0, 1,
-0.9457189, -1.977118, -3.682626, 1, 0.9960784, 0, 1,
-0.9456606, -0.7938905, 0.04270719, 0.9960784, 1, 0, 1,
-0.944962, -0.9079725, -2.961645, 0.9921569, 1, 0, 1,
-0.9384008, 1.151962, 0.01295249, 0.9843137, 1, 0, 1,
-0.9372509, 0.5590418, -0.8356127, 0.9803922, 1, 0, 1,
-0.930256, -0.1251305, -2.453349, 0.972549, 1, 0, 1,
-0.9154935, -0.6959873, -2.648285, 0.9686275, 1, 0, 1,
-0.912477, 1.366727, -0.2960361, 0.9607843, 1, 0, 1,
-0.9086649, 1.502475, -0.8481196, 0.9568627, 1, 0, 1,
-0.9055597, -2.207974, -1.283084, 0.9490196, 1, 0, 1,
-0.8939848, -0.1623684, -1.639466, 0.945098, 1, 0, 1,
-0.8925185, -1.206187, -3.440572, 0.9372549, 1, 0, 1,
-0.8881573, -0.9639803, -2.636223, 0.9333333, 1, 0, 1,
-0.8795398, 0.4030979, -0.5425305, 0.9254902, 1, 0, 1,
-0.8766634, -0.008001019, -0.9513133, 0.9215686, 1, 0, 1,
-0.8708623, 1.180816, -0.8244792, 0.9137255, 1, 0, 1,
-0.8700058, 0.865367, -0.4127962, 0.9098039, 1, 0, 1,
-0.8637398, -0.3923621, -0.7570634, 0.9019608, 1, 0, 1,
-0.8635017, -0.0703776, -0.6686234, 0.8941177, 1, 0, 1,
-0.8607481, 0.3665952, -1.124689, 0.8901961, 1, 0, 1,
-0.8547868, 0.6458059, -1.02848, 0.8823529, 1, 0, 1,
-0.8536716, 0.2180383, -1.884467, 0.8784314, 1, 0, 1,
-0.8536119, -0.5396131, -2.801048, 0.8705882, 1, 0, 1,
-0.8533588, -1.58097, -3.237466, 0.8666667, 1, 0, 1,
-0.8451412, -0.7379867, -1.746432, 0.8588235, 1, 0, 1,
-0.8419601, 0.04390137, -1.502336, 0.854902, 1, 0, 1,
-0.8174527, 0.01826045, -2.304524, 0.8470588, 1, 0, 1,
-0.8140969, -0.6888637, -2.977104, 0.8431373, 1, 0, 1,
-0.8081095, 0.9113308, -1.214322, 0.8352941, 1, 0, 1,
-0.8018543, -2.406569, -3.380064, 0.8313726, 1, 0, 1,
-0.7895434, 1.2081, -0.5562152, 0.8235294, 1, 0, 1,
-0.7845145, 0.09417873, -0.4204069, 0.8196079, 1, 0, 1,
-0.782281, -0.6262835, -2.572937, 0.8117647, 1, 0, 1,
-0.7751148, -0.1962669, -2.535578, 0.8078431, 1, 0, 1,
-0.7748883, -0.9326225, -1.734622, 0.8, 1, 0, 1,
-0.7729889, 1.706743, 1.861635, 0.7921569, 1, 0, 1,
-0.770469, 1.042928, -1.007917, 0.7882353, 1, 0, 1,
-0.7702898, 0.214132, -2.055037, 0.7803922, 1, 0, 1,
-0.7696019, -0.1371989, -2.382455, 0.7764706, 1, 0, 1,
-0.7632279, 0.1563256, -0.2026189, 0.7686275, 1, 0, 1,
-0.7604454, -1.231964, -2.631078, 0.7647059, 1, 0, 1,
-0.7566735, 0.8714032, -0.5952716, 0.7568628, 1, 0, 1,
-0.7552763, -0.7336074, -2.231809, 0.7529412, 1, 0, 1,
-0.7357696, -0.1312398, -1.778148, 0.7450981, 1, 0, 1,
-0.7348272, -0.8376509, -2.064213, 0.7411765, 1, 0, 1,
-0.7327377, 0.7805364, -0.6178901, 0.7333333, 1, 0, 1,
-0.7304041, 0.4175211, -1.543626, 0.7294118, 1, 0, 1,
-0.7300184, 0.1688772, -1.184647, 0.7215686, 1, 0, 1,
-0.7297686, 2.956291, -0.6784014, 0.7176471, 1, 0, 1,
-0.7289156, -0.716385, -3.83901, 0.7098039, 1, 0, 1,
-0.7243233, -0.7713208, -2.152946, 0.7058824, 1, 0, 1,
-0.7222483, 0.1795737, -0.0501529, 0.6980392, 1, 0, 1,
-0.7104481, 1.110917, -0.9310212, 0.6901961, 1, 0, 1,
-0.7098421, 1.337973, -0.1860852, 0.6862745, 1, 0, 1,
-0.7072523, -0.4580431, -1.824684, 0.6784314, 1, 0, 1,
-0.7018033, -0.7596979, -3.350513, 0.6745098, 1, 0, 1,
-0.701219, 0.8812512, -0.9593554, 0.6666667, 1, 0, 1,
-0.6994423, -1.728783, -3.232601, 0.6627451, 1, 0, 1,
-0.6956915, -0.4365343, -1.547403, 0.654902, 1, 0, 1,
-0.6930255, 0.08745921, -2.653688, 0.6509804, 1, 0, 1,
-0.691492, -0.1858387, -0.04973937, 0.6431373, 1, 0, 1,
-0.6897097, 2.148753, 0.4370881, 0.6392157, 1, 0, 1,
-0.6880486, -0.5551145, -2.11354, 0.6313726, 1, 0, 1,
-0.6833554, 1.308934, 0.8848428, 0.627451, 1, 0, 1,
-0.6815789, 0.8423085, -0.3163413, 0.6196079, 1, 0, 1,
-0.6814817, 0.06844191, -1.717315, 0.6156863, 1, 0, 1,
-0.6813308, -0.4154006, -0.6037828, 0.6078432, 1, 0, 1,
-0.6738757, 0.5327886, -0.5608421, 0.6039216, 1, 0, 1,
-0.6676908, 1.552572, -0.225045, 0.5960785, 1, 0, 1,
-0.667597, -1.289965, -3.235197, 0.5882353, 1, 0, 1,
-0.6670158, 0.8558366, -0.894032, 0.5843138, 1, 0, 1,
-0.6629056, -2.136206, -3.669224, 0.5764706, 1, 0, 1,
-0.6596779, 1.717599, -0.7058071, 0.572549, 1, 0, 1,
-0.658923, -1.216386, -1.568111, 0.5647059, 1, 0, 1,
-0.6583762, -0.8246999, 0.2209819, 0.5607843, 1, 0, 1,
-0.6548759, 1.451189, -1.339423, 0.5529412, 1, 0, 1,
-0.6528628, -0.0753547, -2.085129, 0.5490196, 1, 0, 1,
-0.6506431, -0.1135631, 1.118382, 0.5411765, 1, 0, 1,
-0.6494443, -0.6828954, -0.9913631, 0.5372549, 1, 0, 1,
-0.6453619, 0.2903275, -0.2250747, 0.5294118, 1, 0, 1,
-0.6373232, 2.396734, 0.9985373, 0.5254902, 1, 0, 1,
-0.6299497, -0.3865992, -0.2021859, 0.5176471, 1, 0, 1,
-0.6282277, -0.0260983, -3.555021, 0.5137255, 1, 0, 1,
-0.6277676, -0.4627885, -1.832215, 0.5058824, 1, 0, 1,
-0.6251214, -0.7971084, -2.835224, 0.5019608, 1, 0, 1,
-0.6195206, -0.5839666, -2.168537, 0.4941176, 1, 0, 1,
-0.6186885, -1.75474, -2.880843, 0.4862745, 1, 0, 1,
-0.6155442, 0.1487212, -1.112188, 0.4823529, 1, 0, 1,
-0.6106833, -0.8739223, -1.236523, 0.4745098, 1, 0, 1,
-0.6082477, 0.235973, -2.738375, 0.4705882, 1, 0, 1,
-0.6076062, 1.629327, 0.5160751, 0.4627451, 1, 0, 1,
-0.6021787, 0.1868272, -1.721911, 0.4588235, 1, 0, 1,
-0.5963733, -0.3043509, -2.84325, 0.4509804, 1, 0, 1,
-0.5963494, 0.5016668, 0.3782481, 0.4470588, 1, 0, 1,
-0.5953135, 0.3379689, -2.227235, 0.4392157, 1, 0, 1,
-0.5949996, 1.664561, -0.9224555, 0.4352941, 1, 0, 1,
-0.5946688, -0.9411418, -1.333012, 0.427451, 1, 0, 1,
-0.5946112, 1.017013, -2.522663, 0.4235294, 1, 0, 1,
-0.5876442, -1.486492, -3.349905, 0.4156863, 1, 0, 1,
-0.581352, -1.140071, -2.014464, 0.4117647, 1, 0, 1,
-0.5804467, -0.1666391, -1.636194, 0.4039216, 1, 0, 1,
-0.5774003, 1.15525, -1.658087, 0.3960784, 1, 0, 1,
-0.5730581, 0.2806049, -0.9748051, 0.3921569, 1, 0, 1,
-0.5718607, -0.8906738, -4.171436, 0.3843137, 1, 0, 1,
-0.5611969, 1.430352, -0.9187404, 0.3803922, 1, 0, 1,
-0.5593777, -0.3235098, -2.986315, 0.372549, 1, 0, 1,
-0.5575615, 0.1409033, -1.478972, 0.3686275, 1, 0, 1,
-0.5529701, -1.998619, -1.135521, 0.3607843, 1, 0, 1,
-0.5509408, 0.8818829, -2.387647, 0.3568628, 1, 0, 1,
-0.5505089, 0.7581531, -1.523914, 0.3490196, 1, 0, 1,
-0.5466349, 0.2035087, -0.6408232, 0.345098, 1, 0, 1,
-0.5424976, -0.1672604, -2.746006, 0.3372549, 1, 0, 1,
-0.5399016, -0.1369566, -1.699573, 0.3333333, 1, 0, 1,
-0.5390326, -0.8431515, -3.259099, 0.3254902, 1, 0, 1,
-0.5383703, 0.3450263, -0.6946498, 0.3215686, 1, 0, 1,
-0.537371, -0.1159417, -3.578809, 0.3137255, 1, 0, 1,
-0.5372398, 0.7794928, -1.372745, 0.3098039, 1, 0, 1,
-0.535127, -0.7298314, -1.417798, 0.3019608, 1, 0, 1,
-0.5313247, 1.097693, 0.480479, 0.2941177, 1, 0, 1,
-0.5313165, 1.062171, -0.01795162, 0.2901961, 1, 0, 1,
-0.5301855, 0.2789863, -1.022902, 0.282353, 1, 0, 1,
-0.5292269, -1.380373, -3.408353, 0.2784314, 1, 0, 1,
-0.5248856, 0.2459825, -1.489544, 0.2705882, 1, 0, 1,
-0.5242003, 1.166522, -0.2831485, 0.2666667, 1, 0, 1,
-0.5238221, -1.314971, -2.325244, 0.2588235, 1, 0, 1,
-0.5179282, 0.3652245, -0.3826472, 0.254902, 1, 0, 1,
-0.5159, 1.195599, -0.155566, 0.2470588, 1, 0, 1,
-0.5142744, -1.700466, -2.593069, 0.2431373, 1, 0, 1,
-0.5080768, -0.05362338, -1.199103, 0.2352941, 1, 0, 1,
-0.5079515, -1.282964, -2.931456, 0.2313726, 1, 0, 1,
-0.5058681, 0.6104843, 0.7961153, 0.2235294, 1, 0, 1,
-0.5044367, 1.480487, -0.3699281, 0.2196078, 1, 0, 1,
-0.504209, -1.628147, -3.995897, 0.2117647, 1, 0, 1,
-0.5034776, -1.272684, -3.665424, 0.2078431, 1, 0, 1,
-0.5029601, 0.02454643, -1.043958, 0.2, 1, 0, 1,
-0.5022331, 1.146386, -0.5205172, 0.1921569, 1, 0, 1,
-0.4983934, 0.03181329, -0.1971943, 0.1882353, 1, 0, 1,
-0.4948931, -1.053794, -1.142835, 0.1803922, 1, 0, 1,
-0.4930921, -0.5484176, -4.368617, 0.1764706, 1, 0, 1,
-0.4897653, 0.09587258, -2.774093, 0.1686275, 1, 0, 1,
-0.4878375, 0.6612945, -1.930255, 0.1647059, 1, 0, 1,
-0.4813907, 1.320334, -1.704984, 0.1568628, 1, 0, 1,
-0.4766316, 0.2427052, -0.9531214, 0.1529412, 1, 0, 1,
-0.4734943, -0.6221061, -2.050666, 0.145098, 1, 0, 1,
-0.4694244, -1.707263, -4.148804, 0.1411765, 1, 0, 1,
-0.4689625, 0.2296686, 0.02042771, 0.1333333, 1, 0, 1,
-0.4627108, -1.194936, -1.547247, 0.1294118, 1, 0, 1,
-0.4608626, 0.7082201, -1.156623, 0.1215686, 1, 0, 1,
-0.4585111, 0.2971011, -0.8871607, 0.1176471, 1, 0, 1,
-0.4559872, -0.6153682, -1.901011, 0.1098039, 1, 0, 1,
-0.455578, -0.3496335, -2.548208, 0.1058824, 1, 0, 1,
-0.4552476, 0.6695747, -0.2406395, 0.09803922, 1, 0, 1,
-0.4503754, 1.554545, -1.733063, 0.09019608, 1, 0, 1,
-0.449532, 1.359783, -1.836556, 0.08627451, 1, 0, 1,
-0.4466594, -0.03307142, -2.981488, 0.07843138, 1, 0, 1,
-0.4454032, 1.272499, 0.5992156, 0.07450981, 1, 0, 1,
-0.4434799, 1.36839, -0.634508, 0.06666667, 1, 0, 1,
-0.4431096, 0.3377547, -1.303371, 0.0627451, 1, 0, 1,
-0.4418169, -0.5066497, -2.520139, 0.05490196, 1, 0, 1,
-0.4400732, -0.2566769, -2.907083, 0.05098039, 1, 0, 1,
-0.4398437, 1.011879, -0.4921873, 0.04313726, 1, 0, 1,
-0.4381886, -1.607912, -1.876715, 0.03921569, 1, 0, 1,
-0.4364368, 0.5973459, -2.160029, 0.03137255, 1, 0, 1,
-0.4336896, -0.1246736, -1.828791, 0.02745098, 1, 0, 1,
-0.4307894, 1.575615, 0.1283999, 0.01960784, 1, 0, 1,
-0.4304916, -0.9320448, -3.717466, 0.01568628, 1, 0, 1,
-0.4283575, -1.260655, -1.651498, 0.007843138, 1, 0, 1,
-0.424963, 0.5605822, -0.5850784, 0.003921569, 1, 0, 1,
-0.4231838, -0.4062046, -0.8841856, 0, 1, 0.003921569, 1,
-0.4230058, -0.4984673, -3.374363, 0, 1, 0.01176471, 1,
-0.4214, 0.2101, 1.16243, 0, 1, 0.01568628, 1,
-0.4193615, 0.1133799, -3.498453, 0, 1, 0.02352941, 1,
-0.4182127, -2.345734, -3.4669, 0, 1, 0.02745098, 1,
-0.4154852, 0.77552, 0.1147767, 0, 1, 0.03529412, 1,
-0.4122984, 0.4104033, -1.762003, 0, 1, 0.03921569, 1,
-0.4088165, -1.224417, -3.176303, 0, 1, 0.04705882, 1,
-0.4076769, 0.793099, -0.08747625, 0, 1, 0.05098039, 1,
-0.407169, -0.2915764, -2.335679, 0, 1, 0.05882353, 1,
-0.4064744, -0.06138324, -0.8400219, 0, 1, 0.0627451, 1,
-0.4023821, 2.162675, 0.1659064, 0, 1, 0.07058824, 1,
-0.4006152, 0.3969699, -0.3297534, 0, 1, 0.07450981, 1,
-0.3998216, 1.106559, -0.3688025, 0, 1, 0.08235294, 1,
-0.3989162, -0.9515544, -5.410566, 0, 1, 0.08627451, 1,
-0.3943928, 0.03085366, -1.972048, 0, 1, 0.09411765, 1,
-0.3880147, -0.9151633, -4.332202, 0, 1, 0.1019608, 1,
-0.384229, -0.280235, -1.386962, 0, 1, 0.1058824, 1,
-0.3834812, -0.2114306, -1.717128, 0, 1, 0.1137255, 1,
-0.3821202, -0.004721665, -0.8161231, 0, 1, 0.1176471, 1,
-0.3802601, -0.1144878, -3.384059, 0, 1, 0.1254902, 1,
-0.3785625, -1.110152, -2.874839, 0, 1, 0.1294118, 1,
-0.3783173, 0.8753036, 1.54446, 0, 1, 0.1372549, 1,
-0.3741054, 1.285175, 0.5160111, 0, 1, 0.1411765, 1,
-0.3718245, 0.06960621, -2.516487, 0, 1, 0.1490196, 1,
-0.3674353, -0.8349294, -3.094968, 0, 1, 0.1529412, 1,
-0.3664478, 0.5140106, -0.1683918, 0, 1, 0.1607843, 1,
-0.3664167, -0.9246698, -4.40555, 0, 1, 0.1647059, 1,
-0.365527, 0.3035863, 0.2755315, 0, 1, 0.172549, 1,
-0.3653513, 0.3832274, -2.139341, 0, 1, 0.1764706, 1,
-0.3647251, 0.09607339, -1.554132, 0, 1, 0.1843137, 1,
-0.3619512, 1.520107, 0.2409566, 0, 1, 0.1882353, 1,
-0.3601912, 1.263327, 1.116874, 0, 1, 0.1960784, 1,
-0.3595727, -0.04438295, -1.728873, 0, 1, 0.2039216, 1,
-0.358313, 0.7062237, -0.8162416, 0, 1, 0.2078431, 1,
-0.3537114, -0.4818237, -1.800176, 0, 1, 0.2156863, 1,
-0.3519397, 0.05482887, -1.710943, 0, 1, 0.2196078, 1,
-0.3512981, -0.1647293, -2.033408, 0, 1, 0.227451, 1,
-0.3512501, 0.4016502, -1.612136, 0, 1, 0.2313726, 1,
-0.3467995, -0.1855223, -2.691578, 0, 1, 0.2392157, 1,
-0.3437123, 1.057619, -0.1998458, 0, 1, 0.2431373, 1,
-0.343639, -0.8682902, -2.050875, 0, 1, 0.2509804, 1,
-0.3421564, 0.2563141, -1.540035, 0, 1, 0.254902, 1,
-0.3397103, 0.04410731, -1.032067, 0, 1, 0.2627451, 1,
-0.3376302, -0.6141733, -3.332997, 0, 1, 0.2666667, 1,
-0.3298919, -0.5581206, -1.837823, 0, 1, 0.2745098, 1,
-0.3249756, 0.4513955, -0.7008841, 0, 1, 0.2784314, 1,
-0.3244263, -0.3008984, -1.455752, 0, 1, 0.2862745, 1,
-0.3219743, 0.4507562, -2.530028, 0, 1, 0.2901961, 1,
-0.3217164, -1.116996, -3.934449, 0, 1, 0.2980392, 1,
-0.3179612, -0.8402805, -1.426334, 0, 1, 0.3058824, 1,
-0.3169736, 0.09937254, 0.1837002, 0, 1, 0.3098039, 1,
-0.3159266, 2.195739, -2.548258, 0, 1, 0.3176471, 1,
-0.3129721, -0.3128024, -3.23578, 0, 1, 0.3215686, 1,
-0.3077434, -2.258759, -3.677938, 0, 1, 0.3294118, 1,
-0.301301, -1.289243, -1.448809, 0, 1, 0.3333333, 1,
-0.2995506, 0.7750246, -0.5317422, 0, 1, 0.3411765, 1,
-0.2983509, 0.2153071, -1.299207, 0, 1, 0.345098, 1,
-0.2937115, -0.9959673, -2.262101, 0, 1, 0.3529412, 1,
-0.2914142, -1.620596, -2.993007, 0, 1, 0.3568628, 1,
-0.2910763, 0.7087984, -0.1343308, 0, 1, 0.3647059, 1,
-0.2893145, -1.196076, -2.472135, 0, 1, 0.3686275, 1,
-0.2872603, -0.6426457, -2.494949, 0, 1, 0.3764706, 1,
-0.2863536, 0.01798728, -1.688109, 0, 1, 0.3803922, 1,
-0.2852185, -0.3689785, -2.661599, 0, 1, 0.3882353, 1,
-0.2838147, -1.389233, -3.395299, 0, 1, 0.3921569, 1,
-0.2792373, 1.672826, -0.4603879, 0, 1, 0.4, 1,
-0.2735815, -1.415704, -2.462948, 0, 1, 0.4078431, 1,
-0.2699941, 0.2446488, -1.750577, 0, 1, 0.4117647, 1,
-0.2685203, -0.3897294, -1.711197, 0, 1, 0.4196078, 1,
-0.2647821, -2.127532, -3.498221, 0, 1, 0.4235294, 1,
-0.2645008, 1.385029, 1.924659, 0, 1, 0.4313726, 1,
-0.2636382, -0.6978902, -5.341483, 0, 1, 0.4352941, 1,
-0.2627978, -0.7294417, -1.861868, 0, 1, 0.4431373, 1,
-0.2620455, 1.030475, -0.7440646, 0, 1, 0.4470588, 1,
-0.2609076, 0.05644327, 0.4153312, 0, 1, 0.454902, 1,
-0.2575477, -1.069772, -3.041371, 0, 1, 0.4588235, 1,
-0.2562921, 0.951744, -1.248029, 0, 1, 0.4666667, 1,
-0.2534417, 0.07544807, -1.201177, 0, 1, 0.4705882, 1,
-0.2464059, -1.296975, -2.801598, 0, 1, 0.4784314, 1,
-0.2455256, 1.820982, 0.1409395, 0, 1, 0.4823529, 1,
-0.2395457, 0.5394387, -0.880034, 0, 1, 0.4901961, 1,
-0.2374899, 0.3813369, -2.378583, 0, 1, 0.4941176, 1,
-0.2299575, 0.3631893, -0.559377, 0, 1, 0.5019608, 1,
-0.226774, 2.63803, -0.5581841, 0, 1, 0.509804, 1,
-0.2254511, -0.9028879, -3.355808, 0, 1, 0.5137255, 1,
-0.2253011, -0.3474509, -2.173184, 0, 1, 0.5215687, 1,
-0.2241371, 2.688703, -0.349451, 0, 1, 0.5254902, 1,
-0.223322, -0.7454591, -1.979945, 0, 1, 0.5333334, 1,
-0.2214292, 0.033949, -1.52808, 0, 1, 0.5372549, 1,
-0.2213773, 0.944153, -0.1430796, 0, 1, 0.5450981, 1,
-0.2198309, -0.2066498, -2.98625, 0, 1, 0.5490196, 1,
-0.2174022, -1.257485, -3.463301, 0, 1, 0.5568628, 1,
-0.2151558, -0.7733516, -4.321522, 0, 1, 0.5607843, 1,
-0.2149074, 0.1252024, -2.162883, 0, 1, 0.5686275, 1,
-0.210378, 0.1845664, -1.688734, 0, 1, 0.572549, 1,
-0.2073877, -1.34852, -3.113661, 0, 1, 0.5803922, 1,
-0.20579, 1.69655, -0.7814547, 0, 1, 0.5843138, 1,
-0.2044675, 0.06870807, -0.5720975, 0, 1, 0.5921569, 1,
-0.2024089, -0.501502, -2.985197, 0, 1, 0.5960785, 1,
-0.1996485, -1.938584, -4.759173, 0, 1, 0.6039216, 1,
-0.1966362, 0.7003233, -0.3455049, 0, 1, 0.6117647, 1,
-0.1829471, 0.09844938, -0.8946587, 0, 1, 0.6156863, 1,
-0.1807717, 1.855268, -0.005932806, 0, 1, 0.6235294, 1,
-0.1760749, -0.3863558, -2.750458, 0, 1, 0.627451, 1,
-0.1756768, 0.0974596, -0.6785048, 0, 1, 0.6352941, 1,
-0.173934, 1.149155, 0.3637601, 0, 1, 0.6392157, 1,
-0.1708319, 0.9663824, 1.816187, 0, 1, 0.6470588, 1,
-0.1677374, 0.2743815, -1.293026, 0, 1, 0.6509804, 1,
-0.1676964, -0.2430134, -2.334695, 0, 1, 0.6588235, 1,
-0.1643423, -2.067353, -5.102233, 0, 1, 0.6627451, 1,
-0.1638865, 0.2380817, 0.3565605, 0, 1, 0.6705883, 1,
-0.1618084, 1.315109, 2.329266, 0, 1, 0.6745098, 1,
-0.1600297, -2.438599, -2.213033, 0, 1, 0.682353, 1,
-0.1551232, 0.462871, -0.05529979, 0, 1, 0.6862745, 1,
-0.1513311, -0.2694857, -0.9837387, 0, 1, 0.6941177, 1,
-0.1477911, 1.440921, -0.560597, 0, 1, 0.7019608, 1,
-0.1440058, 2.109189, -2.146915, 0, 1, 0.7058824, 1,
-0.143255, -2.521231, -3.158585, 0, 1, 0.7137255, 1,
-0.1410847, -0.1739102, -4.548933, 0, 1, 0.7176471, 1,
-0.1380794, -0.5400063, -2.022131, 0, 1, 0.7254902, 1,
-0.1374719, -1.153687, -1.195901, 0, 1, 0.7294118, 1,
-0.1358393, 2.413093, -0.02947178, 0, 1, 0.7372549, 1,
-0.1350199, 1.284254, -0.7817827, 0, 1, 0.7411765, 1,
-0.1342321, 0.2034592, -0.7218857, 0, 1, 0.7490196, 1,
-0.1302103, -0.355813, -3.719973, 0, 1, 0.7529412, 1,
-0.1228117, 1.252941, -0.8599503, 0, 1, 0.7607843, 1,
-0.121868, -0.03410939, -1.481053, 0, 1, 0.7647059, 1,
-0.1213154, -0.6820365, -3.690562, 0, 1, 0.772549, 1,
-0.1189749, -1.101332, -2.482274, 0, 1, 0.7764706, 1,
-0.1062037, 0.2326193, -0.746164, 0, 1, 0.7843137, 1,
-0.1035401, 0.1589885, 1.362093, 0, 1, 0.7882353, 1,
-0.1031901, 0.6045716, 1.49224, 0, 1, 0.7960784, 1,
-0.1024283, -0.1570754, -3.35594, 0, 1, 0.8039216, 1,
-0.1004662, -0.8233652, -3.278053, 0, 1, 0.8078431, 1,
-0.09865323, -0.8726443, -3.400294, 0, 1, 0.8156863, 1,
-0.09565897, 1.497375, -0.05895635, 0, 1, 0.8196079, 1,
-0.09534847, -0.8245758, -2.047483, 0, 1, 0.827451, 1,
-0.09532017, -1.616382, -2.555538, 0, 1, 0.8313726, 1,
-0.09201212, 1.04839, -0.1496235, 0, 1, 0.8392157, 1,
-0.08939485, -2.399144, -1.097798, 0, 1, 0.8431373, 1,
-0.08551017, -1.637754, -2.468615, 0, 1, 0.8509804, 1,
-0.08500646, 1.506056, -0.1714621, 0, 1, 0.854902, 1,
-0.08314615, -0.8317444, -3.856743, 0, 1, 0.8627451, 1,
-0.07351922, 0.6496245, -0.05860025, 0, 1, 0.8666667, 1,
-0.07248613, -1.16749, -2.385136, 0, 1, 0.8745098, 1,
-0.0700044, 1.383525, 0.4869639, 0, 1, 0.8784314, 1,
-0.06822124, -0.634708, -4.024532, 0, 1, 0.8862745, 1,
-0.06513943, 1.897283, -0.4740443, 0, 1, 0.8901961, 1,
-0.06480536, -1.030967, -3.51291, 0, 1, 0.8980392, 1,
-0.06158179, 0.193924, -0.2613984, 0, 1, 0.9058824, 1,
-0.06083315, -0.4908551, -3.900609, 0, 1, 0.9098039, 1,
-0.05921531, 0.6498634, -1.098171, 0, 1, 0.9176471, 1,
-0.05580397, -0.06897663, -1.531336, 0, 1, 0.9215686, 1,
-0.05229717, -0.6595321, -2.920409, 0, 1, 0.9294118, 1,
-0.047791, 0.30509, -0.9491903, 0, 1, 0.9333333, 1,
-0.04748401, 0.280513, -0.4922465, 0, 1, 0.9411765, 1,
-0.04519082, 2.057938, -1.829614, 0, 1, 0.945098, 1,
-0.04445206, -0.6817754, -3.263936, 0, 1, 0.9529412, 1,
-0.04189716, 0.09616498, 0.8643389, 0, 1, 0.9568627, 1,
-0.0417854, -1.482304, -4.066874, 0, 1, 0.9647059, 1,
-0.04053744, -1.096903, -2.209477, 0, 1, 0.9686275, 1,
-0.03719001, -0.19505, -2.759094, 0, 1, 0.9764706, 1,
-0.02896827, 0.1947711, 0.2518973, 0, 1, 0.9803922, 1,
-0.02775238, -0.05748033, -2.027465, 0, 1, 0.9882353, 1,
-0.02709724, -0.1427447, -3.933324, 0, 1, 0.9921569, 1,
-0.02558475, 1.906368, 0.05253869, 0, 1, 1, 1,
-0.01913095, -0.8629723, -2.679568, 0, 0.9921569, 1, 1,
-0.01841598, -0.546797, -2.960833, 0, 0.9882353, 1, 1,
-0.01766326, -1.923766, -2.86829, 0, 0.9803922, 1, 1,
-0.01443627, -0.4151796, -3.007261, 0, 0.9764706, 1, 1,
-0.01270207, 2.847773, 1.63061, 0, 0.9686275, 1, 1,
-0.01014055, -0.3826351, -4.494793, 0, 0.9647059, 1, 1,
-0.009940142, -0.872641, -5.23655, 0, 0.9568627, 1, 1,
-0.008592239, -1.925365, -3.048489, 0, 0.9529412, 1, 1,
-0.006010586, 1.998797, 1.65774, 0, 0.945098, 1, 1,
-0.00195059, -0.2311306, -2.060115, 0, 0.9411765, 1, 1,
0.006387984, 2.061913, 0.5969642, 0, 0.9333333, 1, 1,
0.009938254, 0.06046836, 0.651795, 0, 0.9294118, 1, 1,
0.01354726, -0.6204346, 1.367174, 0, 0.9215686, 1, 1,
0.02351619, -0.522101, 1.961621, 0, 0.9176471, 1, 1,
0.02629601, -0.455579, 2.909477, 0, 0.9098039, 1, 1,
0.02899639, -1.0077, 2.390321, 0, 0.9058824, 1, 1,
0.03939782, -0.7605259, 3.582168, 0, 0.8980392, 1, 1,
0.04052978, -1.700559, 2.736595, 0, 0.8901961, 1, 1,
0.05196841, -0.3346925, 0.9900818, 0, 0.8862745, 1, 1,
0.0615068, -0.8047966, 1.790697, 0, 0.8784314, 1, 1,
0.06287754, -0.2722986, 3.724823, 0, 0.8745098, 1, 1,
0.06350441, -0.5292175, 3.618762, 0, 0.8666667, 1, 1,
0.06351313, -0.7616886, 2.853204, 0, 0.8627451, 1, 1,
0.06883854, -1.756776, 2.72399, 0, 0.854902, 1, 1,
0.07434617, 2.300885, 0.5354257, 0, 0.8509804, 1, 1,
0.08483814, 0.7917415, -0.02570083, 0, 0.8431373, 1, 1,
0.085096, -0.3821976, 2.890736, 0, 0.8392157, 1, 1,
0.08572291, 0.2123944, 1.310625, 0, 0.8313726, 1, 1,
0.08745848, 0.01575062, -0.1722866, 0, 0.827451, 1, 1,
0.09105358, -0.5661561, 2.334644, 0, 0.8196079, 1, 1,
0.091731, -0.4905434, 3.233834, 0, 0.8156863, 1, 1,
0.09253778, -0.3110908, 4.115797, 0, 0.8078431, 1, 1,
0.09360248, -0.9349525, 2.828111, 0, 0.8039216, 1, 1,
0.09737348, 0.3399698, -1.324077, 0, 0.7960784, 1, 1,
0.09916998, 1.001793, 1.730816, 0, 0.7882353, 1, 1,
0.1049304, 0.140291, 2.60846, 0, 0.7843137, 1, 1,
0.1087898, 1.423348, 2.031738, 0, 0.7764706, 1, 1,
0.110742, -1.854915, 3.220383, 0, 0.772549, 1, 1,
0.1110595, -1.455488, 2.427502, 0, 0.7647059, 1, 1,
0.1116214, 0.1512698, 2.654732, 0, 0.7607843, 1, 1,
0.1144672, -0.7908563, 2.147993, 0, 0.7529412, 1, 1,
0.1182829, 1.782587, 0.682659, 0, 0.7490196, 1, 1,
0.1187202, 1.325094, -0.9370816, 0, 0.7411765, 1, 1,
0.1191906, -0.396533, 3.036173, 0, 0.7372549, 1, 1,
0.1226306, -0.4030533, 2.536099, 0, 0.7294118, 1, 1,
0.1278375, -0.2247434, 4.09757, 0, 0.7254902, 1, 1,
0.1283393, 0.1230696, 1.074592, 0, 0.7176471, 1, 1,
0.128765, 0.7490894, 1.142465, 0, 0.7137255, 1, 1,
0.1302674, -0.2925132, 1.550993, 0, 0.7058824, 1, 1,
0.1304816, 0.8153749, -0.02477989, 0, 0.6980392, 1, 1,
0.132567, 1.13017, 0.3939744, 0, 0.6941177, 1, 1,
0.1339873, -1.300371, 2.688822, 0, 0.6862745, 1, 1,
0.1342405, 1.003895, 1.46633, 0, 0.682353, 1, 1,
0.1373405, 0.7435921, -0.1822283, 0, 0.6745098, 1, 1,
0.1402404, 0.3673941, 0.4249341, 0, 0.6705883, 1, 1,
0.1450393, 0.01912817, 0.3844361, 0, 0.6627451, 1, 1,
0.1461423, 0.02146576, 1.561085, 0, 0.6588235, 1, 1,
0.1473125, 1.597453, -0.03077076, 0, 0.6509804, 1, 1,
0.1507916, -0.2509384, 2.205061, 0, 0.6470588, 1, 1,
0.1515902, 0.9418092, 0.01211288, 0, 0.6392157, 1, 1,
0.1559525, -0.4327058, 1.997092, 0, 0.6352941, 1, 1,
0.1645516, 0.1607417, -0.01204575, 0, 0.627451, 1, 1,
0.1662717, 0.3113933, 0.033784, 0, 0.6235294, 1, 1,
0.1691407, -0.7746109, 2.824172, 0, 0.6156863, 1, 1,
0.1702935, 2.643733, 1.570675, 0, 0.6117647, 1, 1,
0.1727049, 0.5195844, -1.257087, 0, 0.6039216, 1, 1,
0.1734881, -1.177369, 1.638885, 0, 0.5960785, 1, 1,
0.1739919, 0.2915443, 0.1494185, 0, 0.5921569, 1, 1,
0.1748455, 0.4751889, 0.6281718, 0, 0.5843138, 1, 1,
0.1757141, -0.3482251, 0.8776518, 0, 0.5803922, 1, 1,
0.1806493, 0.5459553, 0.1376011, 0, 0.572549, 1, 1,
0.1815952, -0.685711, 3.099876, 0, 0.5686275, 1, 1,
0.1824597, 0.8483073, -0.9558883, 0, 0.5607843, 1, 1,
0.1837354, -1.123969, 3.510952, 0, 0.5568628, 1, 1,
0.1876466, -0.7215792, 3.347092, 0, 0.5490196, 1, 1,
0.1889053, 0.06423089, 1.43418, 0, 0.5450981, 1, 1,
0.1925212, -0.2185642, 2.38781, 0, 0.5372549, 1, 1,
0.1934705, -0.7646135, 0.9097692, 0, 0.5333334, 1, 1,
0.1973061, -0.2959537, 2.256624, 0, 0.5254902, 1, 1,
0.1989801, 1.771841, 0.8357414, 0, 0.5215687, 1, 1,
0.1993564, -0.487712, 3.510059, 0, 0.5137255, 1, 1,
0.199443, -0.05577389, 2.745158, 0, 0.509804, 1, 1,
0.1999745, 0.4632586, 1.478439, 0, 0.5019608, 1, 1,
0.200093, -2.051484, 1.923101, 0, 0.4941176, 1, 1,
0.2058659, 0.7661179, -1.196469, 0, 0.4901961, 1, 1,
0.206986, 0.3770678, 0.9621592, 0, 0.4823529, 1, 1,
0.2100349, -0.2168518, 4.234151, 0, 0.4784314, 1, 1,
0.2125581, -0.2028154, 2.270862, 0, 0.4705882, 1, 1,
0.2132479, -0.325424, 3.051816, 0, 0.4666667, 1, 1,
0.2208976, -0.1162311, 2.329532, 0, 0.4588235, 1, 1,
0.223638, 0.7724299, 2.953832, 0, 0.454902, 1, 1,
0.2287601, 0.9726587, -0.1848177, 0, 0.4470588, 1, 1,
0.230244, -0.9994754, 2.665877, 0, 0.4431373, 1, 1,
0.230771, -1.662161, 4.406457, 0, 0.4352941, 1, 1,
0.2308654, 2.38444, 1.723074, 0, 0.4313726, 1, 1,
0.2323375, 0.3960369, -0.06346595, 0, 0.4235294, 1, 1,
0.2328604, -1.137173, 2.396485, 0, 0.4196078, 1, 1,
0.2354858, -0.6162132, 1.110498, 0, 0.4117647, 1, 1,
0.23797, 1.861658, -0.7831638, 0, 0.4078431, 1, 1,
0.2397713, -0.2190817, 2.043561, 0, 0.4, 1, 1,
0.2413726, -1.019511, 2.344602, 0, 0.3921569, 1, 1,
0.2429047, 0.3902895, 1.338694, 0, 0.3882353, 1, 1,
0.2468617, -0.2565326, 0.7102386, 0, 0.3803922, 1, 1,
0.2479682, -1.959594, 1.472955, 0, 0.3764706, 1, 1,
0.248699, 1.471317, 0.9700535, 0, 0.3686275, 1, 1,
0.2507934, -0.3907938, 2.432114, 0, 0.3647059, 1, 1,
0.2513114, -0.1584167, 3.382794, 0, 0.3568628, 1, 1,
0.2567676, 0.4736787, -0.009357891, 0, 0.3529412, 1, 1,
0.2567808, -1.591428, 2.719743, 0, 0.345098, 1, 1,
0.2586765, -1.193733, 2.642245, 0, 0.3411765, 1, 1,
0.2605218, -0.4174857, 1.682864, 0, 0.3333333, 1, 1,
0.2642772, 0.2130966, -0.7000322, 0, 0.3294118, 1, 1,
0.2650475, -0.6931361, 3.832806, 0, 0.3215686, 1, 1,
0.2690626, 0.7480853, 1.460077, 0, 0.3176471, 1, 1,
0.2734965, -0.1431185, 3.232601, 0, 0.3098039, 1, 1,
0.2745778, -2.044391, 1.842082, 0, 0.3058824, 1, 1,
0.2758447, 0.2325058, 1.850801, 0, 0.2980392, 1, 1,
0.281934, -1.811218, 2.327541, 0, 0.2901961, 1, 1,
0.2841899, 1.4521, 0.1511867, 0, 0.2862745, 1, 1,
0.2842939, 0.3746856, 0.5038624, 0, 0.2784314, 1, 1,
0.2848776, 0.09890535, 0.7229359, 0, 0.2745098, 1, 1,
0.2851168, -0.4932474, 1.981375, 0, 0.2666667, 1, 1,
0.2852878, 0.2527541, 2.658598, 0, 0.2627451, 1, 1,
0.291711, -0.2657519, 2.883249, 0, 0.254902, 1, 1,
0.2947289, -0.191442, 1.365456, 0, 0.2509804, 1, 1,
0.29897, 1.43659, 0.9296558, 0, 0.2431373, 1, 1,
0.3034285, 0.7336975, -0.2296074, 0, 0.2392157, 1, 1,
0.3129054, -0.1946547, 1.021188, 0, 0.2313726, 1, 1,
0.3134646, 0.7710026, 2.536379, 0, 0.227451, 1, 1,
0.3141642, -2.496084, 2.877066, 0, 0.2196078, 1, 1,
0.3143658, 1.553588, 1.0257, 0, 0.2156863, 1, 1,
0.315212, -0.7244574, 2.578191, 0, 0.2078431, 1, 1,
0.3181603, 1.944355, -0.5825357, 0, 0.2039216, 1, 1,
0.3183811, -0.8803045, 3.015517, 0, 0.1960784, 1, 1,
0.3184513, -0.3415981, 1.190809, 0, 0.1882353, 1, 1,
0.3190619, -1.238248, 2.407433, 0, 0.1843137, 1, 1,
0.3192206, -0.4253566, 3.198688, 0, 0.1764706, 1, 1,
0.3201349, 0.3972721, 1.064179, 0, 0.172549, 1, 1,
0.3260073, 1.383018, -0.4414398, 0, 0.1647059, 1, 1,
0.3268301, -1.432579, 1.79321, 0, 0.1607843, 1, 1,
0.3272696, 0.1444245, 1.113143, 0, 0.1529412, 1, 1,
0.3333375, 1.164202, -0.6267281, 0, 0.1490196, 1, 1,
0.3348102, -0.9675746, 2.901513, 0, 0.1411765, 1, 1,
0.338001, -0.3055991, 1.871471, 0, 0.1372549, 1, 1,
0.344836, 0.06387375, 3.91046, 0, 0.1294118, 1, 1,
0.3448449, 0.4744596, 0.7625529, 0, 0.1254902, 1, 1,
0.3464146, 1.582077, -1.029523, 0, 0.1176471, 1, 1,
0.3475126, 0.4937299, 1.5817, 0, 0.1137255, 1, 1,
0.3488581, -0.338649, 1.402472, 0, 0.1058824, 1, 1,
0.3549622, -0.007420835, -0.629081, 0, 0.09803922, 1, 1,
0.3592643, 1.744503, 0.9210253, 0, 0.09411765, 1, 1,
0.3639526, 0.05837261, 1.435597, 0, 0.08627451, 1, 1,
0.3754847, 0.2556009, 1.696548, 0, 0.08235294, 1, 1,
0.375557, -1.582622, 1.36414, 0, 0.07450981, 1, 1,
0.382031, 0.9926885, -0.4397874, 0, 0.07058824, 1, 1,
0.3846241, 0.1549145, 1.123466, 0, 0.0627451, 1, 1,
0.3872659, -0.3915428, 1.793184, 0, 0.05882353, 1, 1,
0.3879728, -0.348467, 1.697786, 0, 0.05098039, 1, 1,
0.3924819, -0.03047487, 0.6402633, 0, 0.04705882, 1, 1,
0.3932257, 0.2721343, 3.097722, 0, 0.03921569, 1, 1,
0.3947309, 0.3043227, 1.475004, 0, 0.03529412, 1, 1,
0.4013798, 2.206352, 1.054949, 0, 0.02745098, 1, 1,
0.4028088, 1.442834, 1.605779, 0, 0.02352941, 1, 1,
0.4034488, -1.381937, 3.698532, 0, 0.01568628, 1, 1,
0.405461, -0.4500644, 1.00626, 0, 0.01176471, 1, 1,
0.4054791, -1.015262, 3.213076, 0, 0.003921569, 1, 1,
0.408962, 0.9321386, -0.331912, 0.003921569, 0, 1, 1,
0.4098257, 1.062292, 1.811424, 0.007843138, 0, 1, 1,
0.4142189, 0.01081306, 2.675127, 0.01568628, 0, 1, 1,
0.4165349, -0.2081929, 0.893792, 0.01960784, 0, 1, 1,
0.4201856, 1.309238, 0.6296725, 0.02745098, 0, 1, 1,
0.4231828, 0.08459288, 2.317003, 0.03137255, 0, 1, 1,
0.4279506, 0.05587315, 1.237273, 0.03921569, 0, 1, 1,
0.4316915, -1.986513, 2.32604, 0.04313726, 0, 1, 1,
0.4319216, -0.6958484, 3.763462, 0.05098039, 0, 1, 1,
0.434395, -1.083744, 2.506697, 0.05490196, 0, 1, 1,
0.4378522, 0.6415861, -0.3714541, 0.0627451, 0, 1, 1,
0.4449283, -1.086313, 1.52367, 0.06666667, 0, 1, 1,
0.446356, -1.541684, 3.761127, 0.07450981, 0, 1, 1,
0.447874, -1.468144, 3.153305, 0.07843138, 0, 1, 1,
0.4526913, -0.4471489, 2.973053, 0.08627451, 0, 1, 1,
0.4535766, -0.6183041, 3.71506, 0.09019608, 0, 1, 1,
0.4596422, -0.2604336, 3.552279, 0.09803922, 0, 1, 1,
0.4620654, 0.070598, 0.2461644, 0.1058824, 0, 1, 1,
0.464001, -0.6097972, 3.840397, 0.1098039, 0, 1, 1,
0.4652955, -0.7773579, 2.489946, 0.1176471, 0, 1, 1,
0.4673788, 1.274829, 0.9004143, 0.1215686, 0, 1, 1,
0.4710447, -0.9072386, 4.552639, 0.1294118, 0, 1, 1,
0.4716928, 0.1819717, 1.019933, 0.1333333, 0, 1, 1,
0.474177, 1.470081, 0.1539535, 0.1411765, 0, 1, 1,
0.4745178, 0.9513732, 0.1230995, 0.145098, 0, 1, 1,
0.4801828, 1.772175, 0.4151959, 0.1529412, 0, 1, 1,
0.4925677, -0.646488, 3.949426, 0.1568628, 0, 1, 1,
0.4955661, -0.4977415, 3.351936, 0.1647059, 0, 1, 1,
0.4965346, 1.530788, -1.189072, 0.1686275, 0, 1, 1,
0.5001765, 0.1195879, 1.415096, 0.1764706, 0, 1, 1,
0.5061775, -0.3866986, 0.7795129, 0.1803922, 0, 1, 1,
0.5077713, -0.006739302, -0.3860343, 0.1882353, 0, 1, 1,
0.5079121, 0.6503218, 1.086117, 0.1921569, 0, 1, 1,
0.5162792, 0.04119029, 1.516107, 0.2, 0, 1, 1,
0.519008, 0.9813082, 0.9514052, 0.2078431, 0, 1, 1,
0.5203556, -0.4320165, 3.414583, 0.2117647, 0, 1, 1,
0.5281121, -0.5836512, 1.652089, 0.2196078, 0, 1, 1,
0.5343338, 1.061921, -0.9720422, 0.2235294, 0, 1, 1,
0.5415391, -0.3731212, 1.390569, 0.2313726, 0, 1, 1,
0.5501651, 0.8156424, -0.008363621, 0.2352941, 0, 1, 1,
0.5584839, -0.5669139, 0.9189515, 0.2431373, 0, 1, 1,
0.5645572, 0.4844626, -0.1857858, 0.2470588, 0, 1, 1,
0.565459, -1.531215, 4.385395, 0.254902, 0, 1, 1,
0.5665234, 1.129261, 0.9448857, 0.2588235, 0, 1, 1,
0.5803006, 0.9606302, -0.3287218, 0.2666667, 0, 1, 1,
0.582324, -0.1371174, 1.399212, 0.2705882, 0, 1, 1,
0.582679, 0.5808281, 1.591123, 0.2784314, 0, 1, 1,
0.5875952, 1.640962, -1.910147, 0.282353, 0, 1, 1,
0.5876327, 0.904065, 1.012349, 0.2901961, 0, 1, 1,
0.5925826, -1.047899, 0.8635506, 0.2941177, 0, 1, 1,
0.5950359, 1.761608, 1.813111, 0.3019608, 0, 1, 1,
0.5991834, 0.1238451, 1.772494, 0.3098039, 0, 1, 1,
0.6013802, -0.009377986, 1.362981, 0.3137255, 0, 1, 1,
0.6038747, -0.1636942, 2.184504, 0.3215686, 0, 1, 1,
0.6052231, -0.8105282, 3.209353, 0.3254902, 0, 1, 1,
0.6082953, 1.147677, -0.1188047, 0.3333333, 0, 1, 1,
0.6107728, 1.175574, -0.5419872, 0.3372549, 0, 1, 1,
0.6151596, 2.127619, -1.22047, 0.345098, 0, 1, 1,
0.6194323, -0.3827394, 0.7226222, 0.3490196, 0, 1, 1,
0.6194774, -0.4412486, 2.105549, 0.3568628, 0, 1, 1,
0.6220358, -0.1155681, 1.476775, 0.3607843, 0, 1, 1,
0.6264631, 1.270684, -0.3289409, 0.3686275, 0, 1, 1,
0.6311767, 2.124074, 0.8795394, 0.372549, 0, 1, 1,
0.6314684, -0.7863929, 3.9824, 0.3803922, 0, 1, 1,
0.6393865, -0.4387058, 3.00924, 0.3843137, 0, 1, 1,
0.6407055, 0.6131368, 0.5947703, 0.3921569, 0, 1, 1,
0.6408321, 1.089341, 0.510654, 0.3960784, 0, 1, 1,
0.6429493, -0.5602821, 1.557338, 0.4039216, 0, 1, 1,
0.6465778, 0.2709316, 2.695331, 0.4117647, 0, 1, 1,
0.6471603, -0.915692, 0.7277934, 0.4156863, 0, 1, 1,
0.649906, 1.099019, 1.081511, 0.4235294, 0, 1, 1,
0.657986, 0.1246428, 2.177265, 0.427451, 0, 1, 1,
0.6615591, 0.2719542, -0.07486035, 0.4352941, 0, 1, 1,
0.66373, 0.3044067, 0.8392492, 0.4392157, 0, 1, 1,
0.6712011, 0.5050629, 0.6065608, 0.4470588, 0, 1, 1,
0.6768689, -0.7991377, 1.694486, 0.4509804, 0, 1, 1,
0.6789713, -0.4111013, 1.927884, 0.4588235, 0, 1, 1,
0.6793393, 1.001575, -0.9457761, 0.4627451, 0, 1, 1,
0.6838673, -0.8743065, 4.961418, 0.4705882, 0, 1, 1,
0.6882558, 0.5213392, 2.435006, 0.4745098, 0, 1, 1,
0.691442, 0.619294, 0.9986548, 0.4823529, 0, 1, 1,
0.695505, -1.457113, 2.717366, 0.4862745, 0, 1, 1,
0.69598, -0.9019865, 3.156737, 0.4941176, 0, 1, 1,
0.696727, -0.5994303, 2.392804, 0.5019608, 0, 1, 1,
0.6976169, 0.9580531, -0.1049415, 0.5058824, 0, 1, 1,
0.6987935, -0.0284998, 2.045971, 0.5137255, 0, 1, 1,
0.6996995, -0.1256122, 1.652627, 0.5176471, 0, 1, 1,
0.7038434, 1.374927, 0.8671554, 0.5254902, 0, 1, 1,
0.7066568, -0.2009979, 1.842679, 0.5294118, 0, 1, 1,
0.7066654, 0.5499236, 1.876347, 0.5372549, 0, 1, 1,
0.7073135, -0.2012107, 3.594649, 0.5411765, 0, 1, 1,
0.7101806, 0.1052365, 0.999916, 0.5490196, 0, 1, 1,
0.7103973, -0.7262363, 3.614623, 0.5529412, 0, 1, 1,
0.7141568, -1.244127, 2.160508, 0.5607843, 0, 1, 1,
0.717172, 0.3850346, -0.02959171, 0.5647059, 0, 1, 1,
0.7215696, 0.1306276, 1.628245, 0.572549, 0, 1, 1,
0.7222742, -1.535732, 1.712208, 0.5764706, 0, 1, 1,
0.7278625, 1.138636, 1.809489, 0.5843138, 0, 1, 1,
0.7287164, 1.122745, 0.4957498, 0.5882353, 0, 1, 1,
0.7299806, 0.476, -0.5217209, 0.5960785, 0, 1, 1,
0.7300368, -0.4439825, 3.9342, 0.6039216, 0, 1, 1,
0.7312997, 1.503359, 1.252437, 0.6078432, 0, 1, 1,
0.7358481, 0.04884258, 1.758353, 0.6156863, 0, 1, 1,
0.7449138, -1.220702, 2.366102, 0.6196079, 0, 1, 1,
0.7449192, 0.4007932, 0.0823364, 0.627451, 0, 1, 1,
0.7459081, 1.34341, 0.792185, 0.6313726, 0, 1, 1,
0.7481886, 0.08528809, 2.270802, 0.6392157, 0, 1, 1,
0.7490243, -0.4797612, 2.645692, 0.6431373, 0, 1, 1,
0.7507533, -0.7973113, 3.180758, 0.6509804, 0, 1, 1,
0.7512735, 0.4955087, 2.081811, 0.654902, 0, 1, 1,
0.7552097, -1.274777, 1.900159, 0.6627451, 0, 1, 1,
0.7579608, -0.1659057, -0.1267727, 0.6666667, 0, 1, 1,
0.7611245, -1.114001, 3.254121, 0.6745098, 0, 1, 1,
0.7627037, 0.3405477, 0.41539, 0.6784314, 0, 1, 1,
0.7639601, 0.82687, 0.05536475, 0.6862745, 0, 1, 1,
0.7668405, 0.0410877, 1.931473, 0.6901961, 0, 1, 1,
0.7691594, -0.5675343, 1.537874, 0.6980392, 0, 1, 1,
0.7693456, -0.4624377, 0.4453836, 0.7058824, 0, 1, 1,
0.7749072, -1.343627, 0.5007761, 0.7098039, 0, 1, 1,
0.7762734, 0.05764314, 0.7771621, 0.7176471, 0, 1, 1,
0.7766203, -0.1110519, 2.473684, 0.7215686, 0, 1, 1,
0.7842297, 0.00826204, 1.510567, 0.7294118, 0, 1, 1,
0.7858726, -0.8135093, 1.472183, 0.7333333, 0, 1, 1,
0.7875616, -0.2184473, 3.334584, 0.7411765, 0, 1, 1,
0.7902004, 0.3182434, 2.004388, 0.7450981, 0, 1, 1,
0.7902634, -2.420181, 2.257926, 0.7529412, 0, 1, 1,
0.7931814, -1.506907, 2.585205, 0.7568628, 0, 1, 1,
0.7953411, -1.237349, 1.445653, 0.7647059, 0, 1, 1,
0.7958205, -1.03973, 2.675118, 0.7686275, 0, 1, 1,
0.7981614, -1.610538, 0.5260321, 0.7764706, 0, 1, 1,
0.8087155, 0.8027403, -0.3640483, 0.7803922, 0, 1, 1,
0.8170523, -0.8843824, 3.580427, 0.7882353, 0, 1, 1,
0.821565, 1.536649, 0.9546302, 0.7921569, 0, 1, 1,
0.8217523, 0.1808533, 1.237515, 0.8, 0, 1, 1,
0.8342847, -0.3963986, 1.53271, 0.8078431, 0, 1, 1,
0.836003, 1.010189, 1.892443, 0.8117647, 0, 1, 1,
0.8385086, -0.7098249, 1.370331, 0.8196079, 0, 1, 1,
0.8387088, -1.453742, 1.29196, 0.8235294, 0, 1, 1,
0.8403419, -0.8976289, 0.7196605, 0.8313726, 0, 1, 1,
0.8408144, -1.373635, 2.02135, 0.8352941, 0, 1, 1,
0.8434145, 1.090613, 2.323062, 0.8431373, 0, 1, 1,
0.8481721, -1.460956, 1.361949, 0.8470588, 0, 1, 1,
0.8489628, -0.2124623, 1.785373, 0.854902, 0, 1, 1,
0.8509908, 0.3766215, 1.14913, 0.8588235, 0, 1, 1,
0.857304, 0.3906013, 3.054106, 0.8666667, 0, 1, 1,
0.8649974, 2.707408, -1.241559, 0.8705882, 0, 1, 1,
0.8661171, -0.5070068, 2.690638, 0.8784314, 0, 1, 1,
0.8669967, 0.8481017, 2.020241, 0.8823529, 0, 1, 1,
0.8676369, 0.6321476, 2.118499, 0.8901961, 0, 1, 1,
0.8714442, -0.1388134, 0.2652282, 0.8941177, 0, 1, 1,
0.8734933, 0.2137837, 4.106254, 0.9019608, 0, 1, 1,
0.8741758, -0.8001845, 1.423303, 0.9098039, 0, 1, 1,
0.8761081, -1.876863, 1.707921, 0.9137255, 0, 1, 1,
0.8828865, 0.3136102, 0.4450108, 0.9215686, 0, 1, 1,
0.8865562, 0.6272567, 1.009856, 0.9254902, 0, 1, 1,
0.8890491, -0.05146261, 4.120193, 0.9333333, 0, 1, 1,
0.8913925, 2.927147, 0.609177, 0.9372549, 0, 1, 1,
0.8940714, 1.502514, 1.062298, 0.945098, 0, 1, 1,
0.8949036, 1.386128, 0.9681802, 0.9490196, 0, 1, 1,
0.895549, -0.557076, 2.33442, 0.9568627, 0, 1, 1,
0.8962691, 0.3358054, 2.317103, 0.9607843, 0, 1, 1,
0.898353, 0.3180477, 2.643862, 0.9686275, 0, 1, 1,
0.9048746, -0.7706798, 3.318594, 0.972549, 0, 1, 1,
0.9099178, -1.274562, 2.156471, 0.9803922, 0, 1, 1,
0.914063, 0.9997737, 0.06140257, 0.9843137, 0, 1, 1,
0.9153311, -0.7556277, 3.449167, 0.9921569, 0, 1, 1,
0.9221494, 1.18816, -0.5397146, 0.9960784, 0, 1, 1,
0.9308906, -0.3963295, 1.0978, 1, 0, 0.9960784, 1,
0.9368913, 2.327967, 1.105443, 1, 0, 0.9882353, 1,
0.9387728, 1.242419, 1.841368, 1, 0, 0.9843137, 1,
0.9474357, 0.2050146, 2.932749, 1, 0, 0.9764706, 1,
0.9492726, -0.8969569, -0.136674, 1, 0, 0.972549, 1,
0.9502438, -1.638527, 2.979564, 1, 0, 0.9647059, 1,
0.9517122, 0.9644071, -0.8886855, 1, 0, 0.9607843, 1,
0.9528379, 1.552439, 2.445783, 1, 0, 0.9529412, 1,
0.9587817, -1.255248, 2.402827, 1, 0, 0.9490196, 1,
0.9596539, -1.660222, 3.077287, 1, 0, 0.9411765, 1,
0.9615161, 0.5746897, 0.1646759, 1, 0, 0.9372549, 1,
0.9621001, 0.6620702, 0.9202156, 1, 0, 0.9294118, 1,
0.966848, 0.1243568, 2.326147, 1, 0, 0.9254902, 1,
0.9679877, -0.2762878, 1.69822, 1, 0, 0.9176471, 1,
0.9716184, -0.8844485, 3.615392, 1, 0, 0.9137255, 1,
0.9764562, -0.7337984, 2.947285, 1, 0, 0.9058824, 1,
0.9821169, 0.1951649, -0.8029705, 1, 0, 0.9019608, 1,
0.9828607, 0.3523295, 2.06342, 1, 0, 0.8941177, 1,
0.991147, -0.0178713, 1.36411, 1, 0, 0.8862745, 1,
0.9981956, -1.773879, 1.541269, 1, 0, 0.8823529, 1,
0.9989177, -0.732312, 2.992741, 1, 0, 0.8745098, 1,
1.00126, 2.053317, 2.903104, 1, 0, 0.8705882, 1,
1.028363, -1.528383, 2.463128, 1, 0, 0.8627451, 1,
1.029167, 0.2721287, 1.55504, 1, 0, 0.8588235, 1,
1.034245, 0.1659722, 1.472622, 1, 0, 0.8509804, 1,
1.041982, 1.071885, 1.221903, 1, 0, 0.8470588, 1,
1.049367, 1.810825, 1.98274, 1, 0, 0.8392157, 1,
1.05203, -0.3961886, 1.114766, 1, 0, 0.8352941, 1,
1.052867, 0.8480983, -0.02332164, 1, 0, 0.827451, 1,
1.064176, 0.8694443, 0.3403968, 1, 0, 0.8235294, 1,
1.069019, 0.2420257, 2.362236, 1, 0, 0.8156863, 1,
1.073303, -0.8800231, 3.031806, 1, 0, 0.8117647, 1,
1.075336, 0.2878309, 0.5349548, 1, 0, 0.8039216, 1,
1.080045, 1.26463, 1.615196, 1, 0, 0.7960784, 1,
1.081374, -0.1028459, 0.4552245, 1, 0, 0.7921569, 1,
1.085649, -0.339354, 2.189107, 1, 0, 0.7843137, 1,
1.085696, 0.8749642, 2.505158, 1, 0, 0.7803922, 1,
1.092449, -1.684314, 2.455621, 1, 0, 0.772549, 1,
1.098373, -1.509369, 3.587222, 1, 0, 0.7686275, 1,
1.100035, -0.4936368, 0.5004655, 1, 0, 0.7607843, 1,
1.104675, -0.7595248, 1.585218, 1, 0, 0.7568628, 1,
1.104954, 1.939716, 1.656919, 1, 0, 0.7490196, 1,
1.106588, 1.387311, 1.798084, 1, 0, 0.7450981, 1,
1.107632, 0.5076222, -0.9532197, 1, 0, 0.7372549, 1,
1.111111, -1.058991, 2.676575, 1, 0, 0.7333333, 1,
1.114889, 1.497762, -0.5729064, 1, 0, 0.7254902, 1,
1.122684, -0.2445307, 1.477506, 1, 0, 0.7215686, 1,
1.135531, 0.651036, 1.419941, 1, 0, 0.7137255, 1,
1.138557, -0.005788277, 1.75852, 1, 0, 0.7098039, 1,
1.153075, 0.7942623, -0.227783, 1, 0, 0.7019608, 1,
1.155309, 0.3410654, 1.938535, 1, 0, 0.6941177, 1,
1.156185, -1.488937, 2.065562, 1, 0, 0.6901961, 1,
1.157117, -0.6653401, 2.589856, 1, 0, 0.682353, 1,
1.158789, 1.455146, 0.8003579, 1, 0, 0.6784314, 1,
1.173165, -1.184017, 4.634442, 1, 0, 0.6705883, 1,
1.179214, 1.016986, 0.6245586, 1, 0, 0.6666667, 1,
1.205245, -0.9373717, 1.448198, 1, 0, 0.6588235, 1,
1.209221, 0.6735192, 1.265465, 1, 0, 0.654902, 1,
1.225949, 0.7627887, 0.921974, 1, 0, 0.6470588, 1,
1.228392, 0.1583407, 2.324088, 1, 0, 0.6431373, 1,
1.228835, -0.5876475, 2.245855, 1, 0, 0.6352941, 1,
1.233742, 0.2682922, 1.983534, 1, 0, 0.6313726, 1,
1.233782, -0.9975117, 1.369943, 1, 0, 0.6235294, 1,
1.238388, 1.7597, -0.4172517, 1, 0, 0.6196079, 1,
1.24565, 0.1833368, 0.588601, 1, 0, 0.6117647, 1,
1.27163, -1.801843, 1.09822, 1, 0, 0.6078432, 1,
1.282645, 0.1543622, 0.719313, 1, 0, 0.6, 1,
1.282831, -1.940017, 3.364014, 1, 0, 0.5921569, 1,
1.288091, 0.6465296, 1.062761, 1, 0, 0.5882353, 1,
1.301414, 0.9087944, 0.1488687, 1, 0, 0.5803922, 1,
1.316343, -0.5947024, 1.931293, 1, 0, 0.5764706, 1,
1.318164, 1.594466, 0.3865309, 1, 0, 0.5686275, 1,
1.321414, 3.06666, 0.1315906, 1, 0, 0.5647059, 1,
1.326029, -1.105648, 2.499597, 1, 0, 0.5568628, 1,
1.339267, 0.1086178, 1.612781, 1, 0, 0.5529412, 1,
1.345282, -0.2761756, 1.929548, 1, 0, 0.5450981, 1,
1.348983, -0.2318715, 1.595365, 1, 0, 0.5411765, 1,
1.362599, 1.385813, 1.330456, 1, 0, 0.5333334, 1,
1.365031, -1.612639, 1.34748, 1, 0, 0.5294118, 1,
1.366639, 0.364208, 0.749137, 1, 0, 0.5215687, 1,
1.380903, -0.7840046, 0.2399361, 1, 0, 0.5176471, 1,
1.383461, 0.8579531, 0.8418787, 1, 0, 0.509804, 1,
1.387721, 1.014536, 2.460221, 1, 0, 0.5058824, 1,
1.391317, 0.8845548, 0.7833929, 1, 0, 0.4980392, 1,
1.393427, -0.9007258, 2.886407, 1, 0, 0.4901961, 1,
1.401024, 0.07280446, 1.961624, 1, 0, 0.4862745, 1,
1.403788, -0.1121975, 3.113427, 1, 0, 0.4784314, 1,
1.43236, 1.202049, 1.319259, 1, 0, 0.4745098, 1,
1.442319, 0.6016851, 1.602244, 1, 0, 0.4666667, 1,
1.448036, -0.3211684, 2.003834, 1, 0, 0.4627451, 1,
1.451483, -1.139888, -0.1884899, 1, 0, 0.454902, 1,
1.462296, -0.5603412, -0.04788631, 1, 0, 0.4509804, 1,
1.462695, -2.263982, 1.817949, 1, 0, 0.4431373, 1,
1.467581, 0.2232052, 1.188521, 1, 0, 0.4392157, 1,
1.484982, -0.2294496, 2.594458, 1, 0, 0.4313726, 1,
1.491068, -0.7637144, 1.633258, 1, 0, 0.427451, 1,
1.492501, 0.788005, 0.367835, 1, 0, 0.4196078, 1,
1.49555, -0.2648969, -0.2509227, 1, 0, 0.4156863, 1,
1.503967, -1.226969, 2.255102, 1, 0, 0.4078431, 1,
1.510916, -0.9997063, 2.965216, 1, 0, 0.4039216, 1,
1.515402, 0.5540475, 1.204037, 1, 0, 0.3960784, 1,
1.521123, -0.9379815, 1.701407, 1, 0, 0.3882353, 1,
1.524261, 0.3298387, 0.4043461, 1, 0, 0.3843137, 1,
1.524668, -1.168741, 2.899709, 1, 0, 0.3764706, 1,
1.544917, 2.43778, -0.1431033, 1, 0, 0.372549, 1,
1.550509, 1.18733, 0.4108915, 1, 0, 0.3647059, 1,
1.552023, -0.2519687, -0.4267233, 1, 0, 0.3607843, 1,
1.555531, -0.3344471, 2.966594, 1, 0, 0.3529412, 1,
1.556519, -1.731749, 2.207798, 1, 0, 0.3490196, 1,
1.55911, -0.3092844, 1.816986, 1, 0, 0.3411765, 1,
1.559663, -1.799136, 4.703074, 1, 0, 0.3372549, 1,
1.563567, -1.411812, 3.528745, 1, 0, 0.3294118, 1,
1.590217, -2.191583, 2.576749, 1, 0, 0.3254902, 1,
1.595716, 2.6821, 0.839089, 1, 0, 0.3176471, 1,
1.595803, 0.9338053, 1.545131, 1, 0, 0.3137255, 1,
1.597121, 0.7094179, 2.165772, 1, 0, 0.3058824, 1,
1.614206, -0.149402, 1.877666, 1, 0, 0.2980392, 1,
1.633506, 0.6607693, 0.3037532, 1, 0, 0.2941177, 1,
1.639137, -0.6837171, 2.379223, 1, 0, 0.2862745, 1,
1.650737, -0.1360654, 0.6342745, 1, 0, 0.282353, 1,
1.674926, 0.05758555, 0.1324335, 1, 0, 0.2745098, 1,
1.715755, 1.426842, -0.1841903, 1, 0, 0.2705882, 1,
1.728045, 0.5795515, 2.10498, 1, 0, 0.2627451, 1,
1.783641, -0.265, 2.054792, 1, 0, 0.2588235, 1,
1.808942, 0.400481, 0.533685, 1, 0, 0.2509804, 1,
1.812129, -2.212798, 2.283768, 1, 0, 0.2470588, 1,
1.820184, 0.06113277, 1.759419, 1, 0, 0.2392157, 1,
1.830981, 0.2664757, -0.05095297, 1, 0, 0.2352941, 1,
1.840882, -0.3398142, 3.025325, 1, 0, 0.227451, 1,
1.846301, -0.4730564, 0.5922652, 1, 0, 0.2235294, 1,
1.864079, 0.2325592, 0.3985173, 1, 0, 0.2156863, 1,
1.871111, 0.02997915, 0.5429154, 1, 0, 0.2117647, 1,
1.880603, -2.278374, 1.741086, 1, 0, 0.2039216, 1,
1.884677, 0.5924271, 1.727468, 1, 0, 0.1960784, 1,
1.886506, 1.295138, 0.5186172, 1, 0, 0.1921569, 1,
1.908792, 0.5729468, 1.421777, 1, 0, 0.1843137, 1,
1.934839, -0.4902212, 0.912096, 1, 0, 0.1803922, 1,
2.005129, 0.2086005, 1.719637, 1, 0, 0.172549, 1,
2.062588, 0.03243412, 2.853104, 1, 0, 0.1686275, 1,
2.075717, 1.097626, 0.9599604, 1, 0, 0.1607843, 1,
2.084358, -0.6346104, 0.9654457, 1, 0, 0.1568628, 1,
2.10372, 1.341442, 1.125008, 1, 0, 0.1490196, 1,
2.108974, 0.2855499, 0.975238, 1, 0, 0.145098, 1,
2.109833, -1.877255, 3.39723, 1, 0, 0.1372549, 1,
2.149887, -2.173182, 1.745542, 1, 0, 0.1333333, 1,
2.175774, 0.6063008, 0.2415442, 1, 0, 0.1254902, 1,
2.177359, -0.7824798, 2.476183, 1, 0, 0.1215686, 1,
2.177976, 0.1602151, 2.367482, 1, 0, 0.1137255, 1,
2.184427, -0.8306693, 2.17892, 1, 0, 0.1098039, 1,
2.204839, 1.977506, 0.6615874, 1, 0, 0.1019608, 1,
2.250242, 1.827881, -0.2237597, 1, 0, 0.09411765, 1,
2.250483, -0.3725465, 2.798403, 1, 0, 0.09019608, 1,
2.271983, -1.018273, 3.70835, 1, 0, 0.08235294, 1,
2.304958, -1.201679, 1.65207, 1, 0, 0.07843138, 1,
2.308418, -2.331918, 0.9792546, 1, 0, 0.07058824, 1,
2.323094, -1.046595, 2.787525, 1, 0, 0.06666667, 1,
2.355531, 1.019052, 1.630125, 1, 0, 0.05882353, 1,
2.386517, -1.540858, 3.040721, 1, 0, 0.05490196, 1,
2.443008, -0.8461971, 1.002685, 1, 0, 0.04705882, 1,
2.63245, -1.153469, 2.473931, 1, 0, 0.04313726, 1,
2.687721, 0.562431, 0.9284333, 1, 0, 0.03529412, 1,
2.889246, -1.289755, 1.364379, 1, 0, 0.03137255, 1,
2.914559, 1.447248, 1.647116, 1, 0, 0.02352941, 1,
3.020175, -1.502068, 1.291039, 1, 0, 0.01960784, 1,
3.232543, -1.611796, 2.459747, 1, 0, 0.01176471, 1,
3.569789, -0.7959383, -0.2157767, 1, 0, 0.007843138, 1
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
0.2315228, -3.662135, -7.168617, 0, -0.5, 0.5, 0.5,
0.2315228, -3.662135, -7.168617, 1, -0.5, 0.5, 0.5,
0.2315228, -3.662135, -7.168617, 1, 1.5, 0.5, 0.5,
0.2315228, -3.662135, -7.168617, 0, 1.5, 0.5, 0.5
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
-4.238415, 0.1898774, -7.168617, 0, -0.5, 0.5, 0.5,
-4.238415, 0.1898774, -7.168617, 1, -0.5, 0.5, 0.5,
-4.238415, 0.1898774, -7.168617, 1, 1.5, 0.5, 0.5,
-4.238415, 0.1898774, -7.168617, 0, 1.5, 0.5, 0.5
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
-4.238415, -3.662135, -0.2245741, 0, -0.5, 0.5, 0.5,
-4.238415, -3.662135, -0.2245741, 1, -0.5, 0.5, 0.5,
-4.238415, -3.662135, -0.2245741, 1, 1.5, 0.5, 0.5,
-4.238415, -3.662135, -0.2245741, 0, 1.5, 0.5, 0.5
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
-3, -2.773209, -5.566145,
3, -2.773209, -5.566145,
-3, -2.773209, -5.566145,
-3, -2.921363, -5.833224,
-2, -2.773209, -5.566145,
-2, -2.921363, -5.833224,
-1, -2.773209, -5.566145,
-1, -2.921363, -5.833224,
0, -2.773209, -5.566145,
0, -2.921363, -5.833224,
1, -2.773209, -5.566145,
1, -2.921363, -5.833224,
2, -2.773209, -5.566145,
2, -2.921363, -5.833224,
3, -2.773209, -5.566145,
3, -2.921363, -5.833224
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
-3, -3.217672, -6.367381, 0, -0.5, 0.5, 0.5,
-3, -3.217672, -6.367381, 1, -0.5, 0.5, 0.5,
-3, -3.217672, -6.367381, 1, 1.5, 0.5, 0.5,
-3, -3.217672, -6.367381, 0, 1.5, 0.5, 0.5,
-2, -3.217672, -6.367381, 0, -0.5, 0.5, 0.5,
-2, -3.217672, -6.367381, 1, -0.5, 0.5, 0.5,
-2, -3.217672, -6.367381, 1, 1.5, 0.5, 0.5,
-2, -3.217672, -6.367381, 0, 1.5, 0.5, 0.5,
-1, -3.217672, -6.367381, 0, -0.5, 0.5, 0.5,
-1, -3.217672, -6.367381, 1, -0.5, 0.5, 0.5,
-1, -3.217672, -6.367381, 1, 1.5, 0.5, 0.5,
-1, -3.217672, -6.367381, 0, 1.5, 0.5, 0.5,
0, -3.217672, -6.367381, 0, -0.5, 0.5, 0.5,
0, -3.217672, -6.367381, 1, -0.5, 0.5, 0.5,
0, -3.217672, -6.367381, 1, 1.5, 0.5, 0.5,
0, -3.217672, -6.367381, 0, 1.5, 0.5, 0.5,
1, -3.217672, -6.367381, 0, -0.5, 0.5, 0.5,
1, -3.217672, -6.367381, 1, -0.5, 0.5, 0.5,
1, -3.217672, -6.367381, 1, 1.5, 0.5, 0.5,
1, -3.217672, -6.367381, 0, 1.5, 0.5, 0.5,
2, -3.217672, -6.367381, 0, -0.5, 0.5, 0.5,
2, -3.217672, -6.367381, 1, -0.5, 0.5, 0.5,
2, -3.217672, -6.367381, 1, 1.5, 0.5, 0.5,
2, -3.217672, -6.367381, 0, 1.5, 0.5, 0.5,
3, -3.217672, -6.367381, 0, -0.5, 0.5, 0.5,
3, -3.217672, -6.367381, 1, -0.5, 0.5, 0.5,
3, -3.217672, -6.367381, 1, 1.5, 0.5, 0.5,
3, -3.217672, -6.367381, 0, 1.5, 0.5, 0.5
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
-3.206891, -2, -5.566145,
-3.206891, 3, -5.566145,
-3.206891, -2, -5.566145,
-3.378812, -2, -5.833224,
-3.206891, -1, -5.566145,
-3.378812, -1, -5.833224,
-3.206891, 0, -5.566145,
-3.378812, 0, -5.833224,
-3.206891, 1, -5.566145,
-3.378812, 1, -5.833224,
-3.206891, 2, -5.566145,
-3.378812, 2, -5.833224,
-3.206891, 3, -5.566145,
-3.378812, 3, -5.833224
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
-3.722653, -2, -6.367381, 0, -0.5, 0.5, 0.5,
-3.722653, -2, -6.367381, 1, -0.5, 0.5, 0.5,
-3.722653, -2, -6.367381, 1, 1.5, 0.5, 0.5,
-3.722653, -2, -6.367381, 0, 1.5, 0.5, 0.5,
-3.722653, -1, -6.367381, 0, -0.5, 0.5, 0.5,
-3.722653, -1, -6.367381, 1, -0.5, 0.5, 0.5,
-3.722653, -1, -6.367381, 1, 1.5, 0.5, 0.5,
-3.722653, -1, -6.367381, 0, 1.5, 0.5, 0.5,
-3.722653, 0, -6.367381, 0, -0.5, 0.5, 0.5,
-3.722653, 0, -6.367381, 1, -0.5, 0.5, 0.5,
-3.722653, 0, -6.367381, 1, 1.5, 0.5, 0.5,
-3.722653, 0, -6.367381, 0, 1.5, 0.5, 0.5,
-3.722653, 1, -6.367381, 0, -0.5, 0.5, 0.5,
-3.722653, 1, -6.367381, 1, -0.5, 0.5, 0.5,
-3.722653, 1, -6.367381, 1, 1.5, 0.5, 0.5,
-3.722653, 1, -6.367381, 0, 1.5, 0.5, 0.5,
-3.722653, 2, -6.367381, 0, -0.5, 0.5, 0.5,
-3.722653, 2, -6.367381, 1, -0.5, 0.5, 0.5,
-3.722653, 2, -6.367381, 1, 1.5, 0.5, 0.5,
-3.722653, 2, -6.367381, 0, 1.5, 0.5, 0.5,
-3.722653, 3, -6.367381, 0, -0.5, 0.5, 0.5,
-3.722653, 3, -6.367381, 1, -0.5, 0.5, 0.5,
-3.722653, 3, -6.367381, 1, 1.5, 0.5, 0.5,
-3.722653, 3, -6.367381, 0, 1.5, 0.5, 0.5
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
-3.206891, -2.773209, -4,
-3.206891, -2.773209, 4,
-3.206891, -2.773209, -4,
-3.378812, -2.921363, -4,
-3.206891, -2.773209, -2,
-3.378812, -2.921363, -2,
-3.206891, -2.773209, 0,
-3.378812, -2.921363, 0,
-3.206891, -2.773209, 2,
-3.378812, -2.921363, 2,
-3.206891, -2.773209, 4,
-3.378812, -2.921363, 4
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
-3.722653, -3.217672, -4, 0, -0.5, 0.5, 0.5,
-3.722653, -3.217672, -4, 1, -0.5, 0.5, 0.5,
-3.722653, -3.217672, -4, 1, 1.5, 0.5, 0.5,
-3.722653, -3.217672, -4, 0, 1.5, 0.5, 0.5,
-3.722653, -3.217672, -2, 0, -0.5, 0.5, 0.5,
-3.722653, -3.217672, -2, 1, -0.5, 0.5, 0.5,
-3.722653, -3.217672, -2, 1, 1.5, 0.5, 0.5,
-3.722653, -3.217672, -2, 0, 1.5, 0.5, 0.5,
-3.722653, -3.217672, 0, 0, -0.5, 0.5, 0.5,
-3.722653, -3.217672, 0, 1, -0.5, 0.5, 0.5,
-3.722653, -3.217672, 0, 1, 1.5, 0.5, 0.5,
-3.722653, -3.217672, 0, 0, 1.5, 0.5, 0.5,
-3.722653, -3.217672, 2, 0, -0.5, 0.5, 0.5,
-3.722653, -3.217672, 2, 1, -0.5, 0.5, 0.5,
-3.722653, -3.217672, 2, 1, 1.5, 0.5, 0.5,
-3.722653, -3.217672, 2, 0, 1.5, 0.5, 0.5,
-3.722653, -3.217672, 4, 0, -0.5, 0.5, 0.5,
-3.722653, -3.217672, 4, 1, -0.5, 0.5, 0.5,
-3.722653, -3.217672, 4, 1, 1.5, 0.5, 0.5,
-3.722653, -3.217672, 4, 0, 1.5, 0.5, 0.5
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
-3.206891, -2.773209, -5.566145,
-3.206891, 3.152964, -5.566145,
-3.206891, -2.773209, 5.116997,
-3.206891, 3.152964, 5.116997,
-3.206891, -2.773209, -5.566145,
-3.206891, -2.773209, 5.116997,
-3.206891, 3.152964, -5.566145,
-3.206891, 3.152964, 5.116997,
-3.206891, -2.773209, -5.566145,
3.669937, -2.773209, -5.566145,
-3.206891, -2.773209, 5.116997,
3.669937, -2.773209, 5.116997,
-3.206891, 3.152964, -5.566145,
3.669937, 3.152964, -5.566145,
-3.206891, 3.152964, 5.116997,
3.669937, 3.152964, 5.116997,
3.669937, -2.773209, -5.566145,
3.669937, 3.152964, -5.566145,
3.669937, -2.773209, 5.116997,
3.669937, 3.152964, 5.116997,
3.669937, -2.773209, -5.566145,
3.669937, -2.773209, 5.116997,
3.669937, 3.152964, -5.566145,
3.669937, 3.152964, 5.116997
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
var radius = 7.486016;
var distance = 33.30613;
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
mvMatrix.translate( -0.2315228, -0.1898774, 0.2245741 );
mvMatrix.scale( 1.177, 1.36581, 0.7576447 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.30613);
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
ethephon<-read.table("ethephon.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-ethephon$V2
```

```
## Error in eval(expr, envir, enclos): object 'ethephon' not found
```

```r
y<-ethephon$V3
```

```
## Error in eval(expr, envir, enclos): object 'ethephon' not found
```

```r
z<-ethephon$V4
```

```
## Error in eval(expr, envir, enclos): object 'ethephon' not found
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
-3.106743, -1.177356, -2.421366, 0, 0, 1, 1, 1,
-2.785404, -0.1808425, -2.09432, 1, 0, 0, 1, 1,
-2.770657, 0.3199612, -1.1412, 1, 0, 0, 1, 1,
-2.762884, 0.4321087, -3.058976, 1, 0, 0, 1, 1,
-2.527471, -0.1603321, -2.689058, 1, 0, 0, 1, 1,
-2.51696, -1.052728, 0.5420407, 1, 0, 0, 1, 1,
-2.487546, 1.32359, 0.9801062, 0, 0, 0, 1, 1,
-2.393334, 0.02977025, -0.8257779, 0, 0, 0, 1, 1,
-2.370799, -0.8368759, -1.289154, 0, 0, 0, 1, 1,
-2.272236, -0.7860093, -1.20266, 0, 0, 0, 1, 1,
-2.169644, -0.6243235, -1.100553, 0, 0, 0, 1, 1,
-2.150231, 1.374327, -1.387452, 0, 0, 0, 1, 1,
-2.115895, 0.5774906, -1.916806, 0, 0, 0, 1, 1,
-2.114963, -0.5571755, -3.003952, 1, 1, 1, 1, 1,
-2.111009, -1.918259, -1.225288, 1, 1, 1, 1, 1,
-2.098704, 1.383888, -1.331267, 1, 1, 1, 1, 1,
-2.096269, -1.309536, -2.489245, 1, 1, 1, 1, 1,
-2.08917, -2.102145, -3.891631, 1, 1, 1, 1, 1,
-2.038207, -0.2855472, -0.9709673, 1, 1, 1, 1, 1,
-2.033018, -0.2469817, -2.068847, 1, 1, 1, 1, 1,
-2.026712, -1.098255, -0.8436558, 1, 1, 1, 1, 1,
-2.003439, -0.5618179, 0.5163282, 1, 1, 1, 1, 1,
-1.986293, -0.9838725, -2.612859, 1, 1, 1, 1, 1,
-1.94153, -0.7854785, -2.515386, 1, 1, 1, 1, 1,
-1.937262, -0.2712432, -0.1969211, 1, 1, 1, 1, 1,
-1.932202, -0.1137818, -2.342788, 1, 1, 1, 1, 1,
-1.927821, -0.5300959, 1.056401, 1, 1, 1, 1, 1,
-1.879969, 0.381052, -1.804168, 1, 1, 1, 1, 1,
-1.873889, 0.1768551, -0.3499683, 0, 0, 1, 1, 1,
-1.872106, -0.4524196, -1.247091, 1, 0, 0, 1, 1,
-1.863984, -0.3592885, -2.042527, 1, 0, 0, 1, 1,
-1.852275, -0.02496175, -0.9560854, 1, 0, 0, 1, 1,
-1.851263, 0.4202268, -0.783327, 1, 0, 0, 1, 1,
-1.845132, 0.6886647, -1.703986, 1, 0, 0, 1, 1,
-1.821318, 0.7043554, -2.335464, 0, 0, 0, 1, 1,
-1.808845, 0.112122, -1.077321, 0, 0, 0, 1, 1,
-1.786068, -0.03373402, -0.6615835, 0, 0, 0, 1, 1,
-1.780895, -0.5515623, -1.475107, 0, 0, 0, 1, 1,
-1.770219, 1.707801, -1.016136, 0, 0, 0, 1, 1,
-1.751284, -0.17473, -0.6899551, 0, 0, 0, 1, 1,
-1.746637, 0.3167596, -1.469311, 0, 0, 0, 1, 1,
-1.745959, -1.250122, -1.951417, 1, 1, 1, 1, 1,
-1.742557, 1.24542, 0.1507655, 1, 1, 1, 1, 1,
-1.730385, 0.02628649, 0.252565, 1, 1, 1, 1, 1,
-1.726871, 1.95843, -1.456463, 1, 1, 1, 1, 1,
-1.715356, -0.4598133, -1.742332, 1, 1, 1, 1, 1,
-1.710806, 0.8211692, -0.8428198, 1, 1, 1, 1, 1,
-1.706583, -0.1342404, -0.1296588, 1, 1, 1, 1, 1,
-1.700621, -1.684628, -4.341336, 1, 1, 1, 1, 1,
-1.692361, 1.285131, -0.9215274, 1, 1, 1, 1, 1,
-1.683146, 2.061709, -0.8930683, 1, 1, 1, 1, 1,
-1.682347, -0.4305397, -1.424257, 1, 1, 1, 1, 1,
-1.671771, -0.5641072, -1.262306, 1, 1, 1, 1, 1,
-1.66307, -0.4922129, -2.324172, 1, 1, 1, 1, 1,
-1.642021, -0.1563322, -0.6838655, 1, 1, 1, 1, 1,
-1.638448, -0.3789372, -3.710935, 1, 1, 1, 1, 1,
-1.637622, -0.3843806, -1.304755, 0, 0, 1, 1, 1,
-1.633946, -1.350138, -1.839888, 1, 0, 0, 1, 1,
-1.62801, 0.4636399, -1.239796, 1, 0, 0, 1, 1,
-1.618906, 0.1162198, -3.18027, 1, 0, 0, 1, 1,
-1.618612, 0.3627659, 0.05940769, 1, 0, 0, 1, 1,
-1.612941, -0.1310378, -1.854621, 1, 0, 0, 1, 1,
-1.606587, 0.08646884, -1.765128, 0, 0, 0, 1, 1,
-1.598498, -0.9638718, -1.464803, 0, 0, 0, 1, 1,
-1.590554, -1.404121, -3.644421, 0, 0, 0, 1, 1,
-1.574921, 0.2077186, -2.238901, 0, 0, 0, 1, 1,
-1.551353, 0.1357038, -0.6227796, 0, 0, 0, 1, 1,
-1.546218, -0.7204162, -1.13469, 0, 0, 0, 1, 1,
-1.508322, -0.3313826, -2.014178, 0, 0, 0, 1, 1,
-1.492753, -0.1790885, -0.0826358, 1, 1, 1, 1, 1,
-1.488518, -0.2492552, -2.221578, 1, 1, 1, 1, 1,
-1.480147, -1.34485, -2.788488, 1, 1, 1, 1, 1,
-1.472837, -0.997767, -3.216261, 1, 1, 1, 1, 1,
-1.471266, -0.1287992, -1.625921, 1, 1, 1, 1, 1,
-1.470852, -0.2421393, -0.1676718, 1, 1, 1, 1, 1,
-1.466287, -0.1320898, -0.8288037, 1, 1, 1, 1, 1,
-1.464741, 1.892552, 1.434282, 1, 1, 1, 1, 1,
-1.460782, -0.3508168, 0.1615492, 1, 1, 1, 1, 1,
-1.45388, 1.003699, 0.3375544, 1, 1, 1, 1, 1,
-1.43346, 1.340702, -0.2966533, 1, 1, 1, 1, 1,
-1.426015, 1.217367, -2.491227, 1, 1, 1, 1, 1,
-1.410903, 6.361481e-05, -2.388104, 1, 1, 1, 1, 1,
-1.391511, -0.9451621, -1.845838, 1, 1, 1, 1, 1,
-1.389513, -0.8512496, -0.8451158, 1, 1, 1, 1, 1,
-1.382327, -0.01537905, 0.1567336, 0, 0, 1, 1, 1,
-1.382137, 0.1049962, -0.1567446, 1, 0, 0, 1, 1,
-1.380975, -0.2067791, -2.423813, 1, 0, 0, 1, 1,
-1.375994, -1.414652, -2.084062, 1, 0, 0, 1, 1,
-1.373751, -0.6611027, -2.782841, 1, 0, 0, 1, 1,
-1.371388, 1.401483, 0.3136963, 1, 0, 0, 1, 1,
-1.36596, 0.5713881, -1.882369, 0, 0, 0, 1, 1,
-1.358419, 0.357876, -1.438848, 0, 0, 0, 1, 1,
-1.322058, 1.578735, 1.115496, 0, 0, 0, 1, 1,
-1.320829, 0.6854488, -0.6373037, 0, 0, 0, 1, 1,
-1.320826, -1.626278, -2.073673, 0, 0, 0, 1, 1,
-1.317148, 0.5475127, -3.868832, 0, 0, 0, 1, 1,
-1.305215, 1.012131, -0.5993742, 0, 0, 0, 1, 1,
-1.297016, 1.427927, -1.754398, 1, 1, 1, 1, 1,
-1.288352, -0.532854, -2.370745, 1, 1, 1, 1, 1,
-1.283721, 0.2314779, -2.060994, 1, 1, 1, 1, 1,
-1.275514, 0.9204065, 0.08221681, 1, 1, 1, 1, 1,
-1.271539, -2.348858, -2.245615, 1, 1, 1, 1, 1,
-1.2667, -0.6763324, -3.262041, 1, 1, 1, 1, 1,
-1.260031, 0.7307323, -1.261029, 1, 1, 1, 1, 1,
-1.248764, 0.3181942, -2.789009, 1, 1, 1, 1, 1,
-1.238393, -1.205204, -2.236482, 1, 1, 1, 1, 1,
-1.233019, -0.5707542, -1.819999, 1, 1, 1, 1, 1,
-1.231213, -1.404487, -2.450512, 1, 1, 1, 1, 1,
-1.223843, 0.5252311, -0.7973632, 1, 1, 1, 1, 1,
-1.219315, 0.801055, 0.4375081, 1, 1, 1, 1, 1,
-1.218959, 1.460938, -0.1959555, 1, 1, 1, 1, 1,
-1.215084, 2.095194, -1.339958, 1, 1, 1, 1, 1,
-1.211196, -1.6912, -2.837573, 0, 0, 1, 1, 1,
-1.192369, 0.9494051, -1.009048, 1, 0, 0, 1, 1,
-1.190684, -0.3669177, -2.708941, 1, 0, 0, 1, 1,
-1.189064, 0.06112036, -0.4063105, 1, 0, 0, 1, 1,
-1.181477, 0.3997041, -2.16264, 1, 0, 0, 1, 1,
-1.179262, -0.9522173, -1.168195, 1, 0, 0, 1, 1,
-1.172301, -0.6589164, -1.600245, 0, 0, 0, 1, 1,
-1.157167, -2.294953, -0.4730674, 0, 0, 0, 1, 1,
-1.142997, -0.7174619, -2.870236, 0, 0, 0, 1, 1,
-1.137778, -0.9541996, -1.499468, 0, 0, 0, 1, 1,
-1.123728, 1.531218, -0.6026358, 0, 0, 0, 1, 1,
-1.121379, -2.105134, -4.092804, 0, 0, 0, 1, 1,
-1.120768, -0.2473559, -1.656758, 0, 0, 0, 1, 1,
-1.109433, 0.4459593, -0.6312189, 1, 1, 1, 1, 1,
-1.109395, 0.09580998, -1.703734, 1, 1, 1, 1, 1,
-1.096177, 0.08415997, -2.714884, 1, 1, 1, 1, 1,
-1.089443, 0.5444887, -2.167389, 1, 1, 1, 1, 1,
-1.087322, 0.4455766, 0.2121994, 1, 1, 1, 1, 1,
-1.08718, -1.739839, -1.242227, 1, 1, 1, 1, 1,
-1.077052, -0.2659056, -1.113302, 1, 1, 1, 1, 1,
-1.072679, -2.588642, -3.89627, 1, 1, 1, 1, 1,
-1.07068, -0.4863884, -1.434532, 1, 1, 1, 1, 1,
-1.057999, -1.263724, -2.72379, 1, 1, 1, 1, 1,
-1.05235, -2.464278, -2.297158, 1, 1, 1, 1, 1,
-1.049598, -0.9222936, -1.255666, 1, 1, 1, 1, 1,
-1.044949, 1.903769, -0.4265472, 1, 1, 1, 1, 1,
-1.04484, 0.9963546, -1.442741, 1, 1, 1, 1, 1,
-1.044017, 0.1994473, -1.551824, 1, 1, 1, 1, 1,
-1.041005, -0.03299911, -0.9984285, 0, 0, 1, 1, 1,
-1.039617, 1.491763, -1.320681, 1, 0, 0, 1, 1,
-1.036749, 0.1063839, -0.8748851, 1, 0, 0, 1, 1,
-1.035043, -0.471895, -3.053465, 1, 0, 0, 1, 1,
-1.033653, 0.1019424, -0.1238917, 1, 0, 0, 1, 1,
-1.032989, 0.6183347, 0.2948311, 1, 0, 0, 1, 1,
-1.028165, 0.9655628, -0.7535043, 0, 0, 0, 1, 1,
-1.027004, -0.7785124, -0.3270944, 0, 0, 0, 1, 1,
-1.021073, 0.1852829, -0.5584879, 0, 0, 0, 1, 1,
-1.01866, -1.942644, -2.630651, 0, 0, 0, 1, 1,
-1.016857, -1.451562, -2.576458, 0, 0, 0, 1, 1,
-1.013705, 0.09640993, -1.532668, 0, 0, 0, 1, 1,
-1.010994, -1.303847, -1.381599, 0, 0, 0, 1, 1,
-1.001739, 1.597102, -1.235218, 1, 1, 1, 1, 1,
-0.999039, 1.042307, -1.902784, 1, 1, 1, 1, 1,
-0.9987994, 0.9862086, -1.23895, 1, 1, 1, 1, 1,
-0.9891675, 0.1956621, -1.844343, 1, 1, 1, 1, 1,
-0.9826892, 0.4366807, -2.638629, 1, 1, 1, 1, 1,
-0.9811627, 1.607988, -0.6912438, 1, 1, 1, 1, 1,
-0.9811572, 0.03514281, -0.5360024, 1, 1, 1, 1, 1,
-0.9724403, 0.1759537, 0.8377569, 1, 1, 1, 1, 1,
-0.960477, -0.1818475, -3.063592, 1, 1, 1, 1, 1,
-0.9602903, -2.686905, -2.301974, 1, 1, 1, 1, 1,
-0.9599258, -1.85152, -4.717944, 1, 1, 1, 1, 1,
-0.9533043, 0.7175421, -0.9069121, 1, 1, 1, 1, 1,
-0.9494818, -0.2170611, -3.128695, 1, 1, 1, 1, 1,
-0.9457189, -1.977118, -3.682626, 1, 1, 1, 1, 1,
-0.9456606, -0.7938905, 0.04270719, 1, 1, 1, 1, 1,
-0.944962, -0.9079725, -2.961645, 0, 0, 1, 1, 1,
-0.9384008, 1.151962, 0.01295249, 1, 0, 0, 1, 1,
-0.9372509, 0.5590418, -0.8356127, 1, 0, 0, 1, 1,
-0.930256, -0.1251305, -2.453349, 1, 0, 0, 1, 1,
-0.9154935, -0.6959873, -2.648285, 1, 0, 0, 1, 1,
-0.912477, 1.366727, -0.2960361, 1, 0, 0, 1, 1,
-0.9086649, 1.502475, -0.8481196, 0, 0, 0, 1, 1,
-0.9055597, -2.207974, -1.283084, 0, 0, 0, 1, 1,
-0.8939848, -0.1623684, -1.639466, 0, 0, 0, 1, 1,
-0.8925185, -1.206187, -3.440572, 0, 0, 0, 1, 1,
-0.8881573, -0.9639803, -2.636223, 0, 0, 0, 1, 1,
-0.8795398, 0.4030979, -0.5425305, 0, 0, 0, 1, 1,
-0.8766634, -0.008001019, -0.9513133, 0, 0, 0, 1, 1,
-0.8708623, 1.180816, -0.8244792, 1, 1, 1, 1, 1,
-0.8700058, 0.865367, -0.4127962, 1, 1, 1, 1, 1,
-0.8637398, -0.3923621, -0.7570634, 1, 1, 1, 1, 1,
-0.8635017, -0.0703776, -0.6686234, 1, 1, 1, 1, 1,
-0.8607481, 0.3665952, -1.124689, 1, 1, 1, 1, 1,
-0.8547868, 0.6458059, -1.02848, 1, 1, 1, 1, 1,
-0.8536716, 0.2180383, -1.884467, 1, 1, 1, 1, 1,
-0.8536119, -0.5396131, -2.801048, 1, 1, 1, 1, 1,
-0.8533588, -1.58097, -3.237466, 1, 1, 1, 1, 1,
-0.8451412, -0.7379867, -1.746432, 1, 1, 1, 1, 1,
-0.8419601, 0.04390137, -1.502336, 1, 1, 1, 1, 1,
-0.8174527, 0.01826045, -2.304524, 1, 1, 1, 1, 1,
-0.8140969, -0.6888637, -2.977104, 1, 1, 1, 1, 1,
-0.8081095, 0.9113308, -1.214322, 1, 1, 1, 1, 1,
-0.8018543, -2.406569, -3.380064, 1, 1, 1, 1, 1,
-0.7895434, 1.2081, -0.5562152, 0, 0, 1, 1, 1,
-0.7845145, 0.09417873, -0.4204069, 1, 0, 0, 1, 1,
-0.782281, -0.6262835, -2.572937, 1, 0, 0, 1, 1,
-0.7751148, -0.1962669, -2.535578, 1, 0, 0, 1, 1,
-0.7748883, -0.9326225, -1.734622, 1, 0, 0, 1, 1,
-0.7729889, 1.706743, 1.861635, 1, 0, 0, 1, 1,
-0.770469, 1.042928, -1.007917, 0, 0, 0, 1, 1,
-0.7702898, 0.214132, -2.055037, 0, 0, 0, 1, 1,
-0.7696019, -0.1371989, -2.382455, 0, 0, 0, 1, 1,
-0.7632279, 0.1563256, -0.2026189, 0, 0, 0, 1, 1,
-0.7604454, -1.231964, -2.631078, 0, 0, 0, 1, 1,
-0.7566735, 0.8714032, -0.5952716, 0, 0, 0, 1, 1,
-0.7552763, -0.7336074, -2.231809, 0, 0, 0, 1, 1,
-0.7357696, -0.1312398, -1.778148, 1, 1, 1, 1, 1,
-0.7348272, -0.8376509, -2.064213, 1, 1, 1, 1, 1,
-0.7327377, 0.7805364, -0.6178901, 1, 1, 1, 1, 1,
-0.7304041, 0.4175211, -1.543626, 1, 1, 1, 1, 1,
-0.7300184, 0.1688772, -1.184647, 1, 1, 1, 1, 1,
-0.7297686, 2.956291, -0.6784014, 1, 1, 1, 1, 1,
-0.7289156, -0.716385, -3.83901, 1, 1, 1, 1, 1,
-0.7243233, -0.7713208, -2.152946, 1, 1, 1, 1, 1,
-0.7222483, 0.1795737, -0.0501529, 1, 1, 1, 1, 1,
-0.7104481, 1.110917, -0.9310212, 1, 1, 1, 1, 1,
-0.7098421, 1.337973, -0.1860852, 1, 1, 1, 1, 1,
-0.7072523, -0.4580431, -1.824684, 1, 1, 1, 1, 1,
-0.7018033, -0.7596979, -3.350513, 1, 1, 1, 1, 1,
-0.701219, 0.8812512, -0.9593554, 1, 1, 1, 1, 1,
-0.6994423, -1.728783, -3.232601, 1, 1, 1, 1, 1,
-0.6956915, -0.4365343, -1.547403, 0, 0, 1, 1, 1,
-0.6930255, 0.08745921, -2.653688, 1, 0, 0, 1, 1,
-0.691492, -0.1858387, -0.04973937, 1, 0, 0, 1, 1,
-0.6897097, 2.148753, 0.4370881, 1, 0, 0, 1, 1,
-0.6880486, -0.5551145, -2.11354, 1, 0, 0, 1, 1,
-0.6833554, 1.308934, 0.8848428, 1, 0, 0, 1, 1,
-0.6815789, 0.8423085, -0.3163413, 0, 0, 0, 1, 1,
-0.6814817, 0.06844191, -1.717315, 0, 0, 0, 1, 1,
-0.6813308, -0.4154006, -0.6037828, 0, 0, 0, 1, 1,
-0.6738757, 0.5327886, -0.5608421, 0, 0, 0, 1, 1,
-0.6676908, 1.552572, -0.225045, 0, 0, 0, 1, 1,
-0.667597, -1.289965, -3.235197, 0, 0, 0, 1, 1,
-0.6670158, 0.8558366, -0.894032, 0, 0, 0, 1, 1,
-0.6629056, -2.136206, -3.669224, 1, 1, 1, 1, 1,
-0.6596779, 1.717599, -0.7058071, 1, 1, 1, 1, 1,
-0.658923, -1.216386, -1.568111, 1, 1, 1, 1, 1,
-0.6583762, -0.8246999, 0.2209819, 1, 1, 1, 1, 1,
-0.6548759, 1.451189, -1.339423, 1, 1, 1, 1, 1,
-0.6528628, -0.0753547, -2.085129, 1, 1, 1, 1, 1,
-0.6506431, -0.1135631, 1.118382, 1, 1, 1, 1, 1,
-0.6494443, -0.6828954, -0.9913631, 1, 1, 1, 1, 1,
-0.6453619, 0.2903275, -0.2250747, 1, 1, 1, 1, 1,
-0.6373232, 2.396734, 0.9985373, 1, 1, 1, 1, 1,
-0.6299497, -0.3865992, -0.2021859, 1, 1, 1, 1, 1,
-0.6282277, -0.0260983, -3.555021, 1, 1, 1, 1, 1,
-0.6277676, -0.4627885, -1.832215, 1, 1, 1, 1, 1,
-0.6251214, -0.7971084, -2.835224, 1, 1, 1, 1, 1,
-0.6195206, -0.5839666, -2.168537, 1, 1, 1, 1, 1,
-0.6186885, -1.75474, -2.880843, 0, 0, 1, 1, 1,
-0.6155442, 0.1487212, -1.112188, 1, 0, 0, 1, 1,
-0.6106833, -0.8739223, -1.236523, 1, 0, 0, 1, 1,
-0.6082477, 0.235973, -2.738375, 1, 0, 0, 1, 1,
-0.6076062, 1.629327, 0.5160751, 1, 0, 0, 1, 1,
-0.6021787, 0.1868272, -1.721911, 1, 0, 0, 1, 1,
-0.5963733, -0.3043509, -2.84325, 0, 0, 0, 1, 1,
-0.5963494, 0.5016668, 0.3782481, 0, 0, 0, 1, 1,
-0.5953135, 0.3379689, -2.227235, 0, 0, 0, 1, 1,
-0.5949996, 1.664561, -0.9224555, 0, 0, 0, 1, 1,
-0.5946688, -0.9411418, -1.333012, 0, 0, 0, 1, 1,
-0.5946112, 1.017013, -2.522663, 0, 0, 0, 1, 1,
-0.5876442, -1.486492, -3.349905, 0, 0, 0, 1, 1,
-0.581352, -1.140071, -2.014464, 1, 1, 1, 1, 1,
-0.5804467, -0.1666391, -1.636194, 1, 1, 1, 1, 1,
-0.5774003, 1.15525, -1.658087, 1, 1, 1, 1, 1,
-0.5730581, 0.2806049, -0.9748051, 1, 1, 1, 1, 1,
-0.5718607, -0.8906738, -4.171436, 1, 1, 1, 1, 1,
-0.5611969, 1.430352, -0.9187404, 1, 1, 1, 1, 1,
-0.5593777, -0.3235098, -2.986315, 1, 1, 1, 1, 1,
-0.5575615, 0.1409033, -1.478972, 1, 1, 1, 1, 1,
-0.5529701, -1.998619, -1.135521, 1, 1, 1, 1, 1,
-0.5509408, 0.8818829, -2.387647, 1, 1, 1, 1, 1,
-0.5505089, 0.7581531, -1.523914, 1, 1, 1, 1, 1,
-0.5466349, 0.2035087, -0.6408232, 1, 1, 1, 1, 1,
-0.5424976, -0.1672604, -2.746006, 1, 1, 1, 1, 1,
-0.5399016, -0.1369566, -1.699573, 1, 1, 1, 1, 1,
-0.5390326, -0.8431515, -3.259099, 1, 1, 1, 1, 1,
-0.5383703, 0.3450263, -0.6946498, 0, 0, 1, 1, 1,
-0.537371, -0.1159417, -3.578809, 1, 0, 0, 1, 1,
-0.5372398, 0.7794928, -1.372745, 1, 0, 0, 1, 1,
-0.535127, -0.7298314, -1.417798, 1, 0, 0, 1, 1,
-0.5313247, 1.097693, 0.480479, 1, 0, 0, 1, 1,
-0.5313165, 1.062171, -0.01795162, 1, 0, 0, 1, 1,
-0.5301855, 0.2789863, -1.022902, 0, 0, 0, 1, 1,
-0.5292269, -1.380373, -3.408353, 0, 0, 0, 1, 1,
-0.5248856, 0.2459825, -1.489544, 0, 0, 0, 1, 1,
-0.5242003, 1.166522, -0.2831485, 0, 0, 0, 1, 1,
-0.5238221, -1.314971, -2.325244, 0, 0, 0, 1, 1,
-0.5179282, 0.3652245, -0.3826472, 0, 0, 0, 1, 1,
-0.5159, 1.195599, -0.155566, 0, 0, 0, 1, 1,
-0.5142744, -1.700466, -2.593069, 1, 1, 1, 1, 1,
-0.5080768, -0.05362338, -1.199103, 1, 1, 1, 1, 1,
-0.5079515, -1.282964, -2.931456, 1, 1, 1, 1, 1,
-0.5058681, 0.6104843, 0.7961153, 1, 1, 1, 1, 1,
-0.5044367, 1.480487, -0.3699281, 1, 1, 1, 1, 1,
-0.504209, -1.628147, -3.995897, 1, 1, 1, 1, 1,
-0.5034776, -1.272684, -3.665424, 1, 1, 1, 1, 1,
-0.5029601, 0.02454643, -1.043958, 1, 1, 1, 1, 1,
-0.5022331, 1.146386, -0.5205172, 1, 1, 1, 1, 1,
-0.4983934, 0.03181329, -0.1971943, 1, 1, 1, 1, 1,
-0.4948931, -1.053794, -1.142835, 1, 1, 1, 1, 1,
-0.4930921, -0.5484176, -4.368617, 1, 1, 1, 1, 1,
-0.4897653, 0.09587258, -2.774093, 1, 1, 1, 1, 1,
-0.4878375, 0.6612945, -1.930255, 1, 1, 1, 1, 1,
-0.4813907, 1.320334, -1.704984, 1, 1, 1, 1, 1,
-0.4766316, 0.2427052, -0.9531214, 0, 0, 1, 1, 1,
-0.4734943, -0.6221061, -2.050666, 1, 0, 0, 1, 1,
-0.4694244, -1.707263, -4.148804, 1, 0, 0, 1, 1,
-0.4689625, 0.2296686, 0.02042771, 1, 0, 0, 1, 1,
-0.4627108, -1.194936, -1.547247, 1, 0, 0, 1, 1,
-0.4608626, 0.7082201, -1.156623, 1, 0, 0, 1, 1,
-0.4585111, 0.2971011, -0.8871607, 0, 0, 0, 1, 1,
-0.4559872, -0.6153682, -1.901011, 0, 0, 0, 1, 1,
-0.455578, -0.3496335, -2.548208, 0, 0, 0, 1, 1,
-0.4552476, 0.6695747, -0.2406395, 0, 0, 0, 1, 1,
-0.4503754, 1.554545, -1.733063, 0, 0, 0, 1, 1,
-0.449532, 1.359783, -1.836556, 0, 0, 0, 1, 1,
-0.4466594, -0.03307142, -2.981488, 0, 0, 0, 1, 1,
-0.4454032, 1.272499, 0.5992156, 1, 1, 1, 1, 1,
-0.4434799, 1.36839, -0.634508, 1, 1, 1, 1, 1,
-0.4431096, 0.3377547, -1.303371, 1, 1, 1, 1, 1,
-0.4418169, -0.5066497, -2.520139, 1, 1, 1, 1, 1,
-0.4400732, -0.2566769, -2.907083, 1, 1, 1, 1, 1,
-0.4398437, 1.011879, -0.4921873, 1, 1, 1, 1, 1,
-0.4381886, -1.607912, -1.876715, 1, 1, 1, 1, 1,
-0.4364368, 0.5973459, -2.160029, 1, 1, 1, 1, 1,
-0.4336896, -0.1246736, -1.828791, 1, 1, 1, 1, 1,
-0.4307894, 1.575615, 0.1283999, 1, 1, 1, 1, 1,
-0.4304916, -0.9320448, -3.717466, 1, 1, 1, 1, 1,
-0.4283575, -1.260655, -1.651498, 1, 1, 1, 1, 1,
-0.424963, 0.5605822, -0.5850784, 1, 1, 1, 1, 1,
-0.4231838, -0.4062046, -0.8841856, 1, 1, 1, 1, 1,
-0.4230058, -0.4984673, -3.374363, 1, 1, 1, 1, 1,
-0.4214, 0.2101, 1.16243, 0, 0, 1, 1, 1,
-0.4193615, 0.1133799, -3.498453, 1, 0, 0, 1, 1,
-0.4182127, -2.345734, -3.4669, 1, 0, 0, 1, 1,
-0.4154852, 0.77552, 0.1147767, 1, 0, 0, 1, 1,
-0.4122984, 0.4104033, -1.762003, 1, 0, 0, 1, 1,
-0.4088165, -1.224417, -3.176303, 1, 0, 0, 1, 1,
-0.4076769, 0.793099, -0.08747625, 0, 0, 0, 1, 1,
-0.407169, -0.2915764, -2.335679, 0, 0, 0, 1, 1,
-0.4064744, -0.06138324, -0.8400219, 0, 0, 0, 1, 1,
-0.4023821, 2.162675, 0.1659064, 0, 0, 0, 1, 1,
-0.4006152, 0.3969699, -0.3297534, 0, 0, 0, 1, 1,
-0.3998216, 1.106559, -0.3688025, 0, 0, 0, 1, 1,
-0.3989162, -0.9515544, -5.410566, 0, 0, 0, 1, 1,
-0.3943928, 0.03085366, -1.972048, 1, 1, 1, 1, 1,
-0.3880147, -0.9151633, -4.332202, 1, 1, 1, 1, 1,
-0.384229, -0.280235, -1.386962, 1, 1, 1, 1, 1,
-0.3834812, -0.2114306, -1.717128, 1, 1, 1, 1, 1,
-0.3821202, -0.004721665, -0.8161231, 1, 1, 1, 1, 1,
-0.3802601, -0.1144878, -3.384059, 1, 1, 1, 1, 1,
-0.3785625, -1.110152, -2.874839, 1, 1, 1, 1, 1,
-0.3783173, 0.8753036, 1.54446, 1, 1, 1, 1, 1,
-0.3741054, 1.285175, 0.5160111, 1, 1, 1, 1, 1,
-0.3718245, 0.06960621, -2.516487, 1, 1, 1, 1, 1,
-0.3674353, -0.8349294, -3.094968, 1, 1, 1, 1, 1,
-0.3664478, 0.5140106, -0.1683918, 1, 1, 1, 1, 1,
-0.3664167, -0.9246698, -4.40555, 1, 1, 1, 1, 1,
-0.365527, 0.3035863, 0.2755315, 1, 1, 1, 1, 1,
-0.3653513, 0.3832274, -2.139341, 1, 1, 1, 1, 1,
-0.3647251, 0.09607339, -1.554132, 0, 0, 1, 1, 1,
-0.3619512, 1.520107, 0.2409566, 1, 0, 0, 1, 1,
-0.3601912, 1.263327, 1.116874, 1, 0, 0, 1, 1,
-0.3595727, -0.04438295, -1.728873, 1, 0, 0, 1, 1,
-0.358313, 0.7062237, -0.8162416, 1, 0, 0, 1, 1,
-0.3537114, -0.4818237, -1.800176, 1, 0, 0, 1, 1,
-0.3519397, 0.05482887, -1.710943, 0, 0, 0, 1, 1,
-0.3512981, -0.1647293, -2.033408, 0, 0, 0, 1, 1,
-0.3512501, 0.4016502, -1.612136, 0, 0, 0, 1, 1,
-0.3467995, -0.1855223, -2.691578, 0, 0, 0, 1, 1,
-0.3437123, 1.057619, -0.1998458, 0, 0, 0, 1, 1,
-0.343639, -0.8682902, -2.050875, 0, 0, 0, 1, 1,
-0.3421564, 0.2563141, -1.540035, 0, 0, 0, 1, 1,
-0.3397103, 0.04410731, -1.032067, 1, 1, 1, 1, 1,
-0.3376302, -0.6141733, -3.332997, 1, 1, 1, 1, 1,
-0.3298919, -0.5581206, -1.837823, 1, 1, 1, 1, 1,
-0.3249756, 0.4513955, -0.7008841, 1, 1, 1, 1, 1,
-0.3244263, -0.3008984, -1.455752, 1, 1, 1, 1, 1,
-0.3219743, 0.4507562, -2.530028, 1, 1, 1, 1, 1,
-0.3217164, -1.116996, -3.934449, 1, 1, 1, 1, 1,
-0.3179612, -0.8402805, -1.426334, 1, 1, 1, 1, 1,
-0.3169736, 0.09937254, 0.1837002, 1, 1, 1, 1, 1,
-0.3159266, 2.195739, -2.548258, 1, 1, 1, 1, 1,
-0.3129721, -0.3128024, -3.23578, 1, 1, 1, 1, 1,
-0.3077434, -2.258759, -3.677938, 1, 1, 1, 1, 1,
-0.301301, -1.289243, -1.448809, 1, 1, 1, 1, 1,
-0.2995506, 0.7750246, -0.5317422, 1, 1, 1, 1, 1,
-0.2983509, 0.2153071, -1.299207, 1, 1, 1, 1, 1,
-0.2937115, -0.9959673, -2.262101, 0, 0, 1, 1, 1,
-0.2914142, -1.620596, -2.993007, 1, 0, 0, 1, 1,
-0.2910763, 0.7087984, -0.1343308, 1, 0, 0, 1, 1,
-0.2893145, -1.196076, -2.472135, 1, 0, 0, 1, 1,
-0.2872603, -0.6426457, -2.494949, 1, 0, 0, 1, 1,
-0.2863536, 0.01798728, -1.688109, 1, 0, 0, 1, 1,
-0.2852185, -0.3689785, -2.661599, 0, 0, 0, 1, 1,
-0.2838147, -1.389233, -3.395299, 0, 0, 0, 1, 1,
-0.2792373, 1.672826, -0.4603879, 0, 0, 0, 1, 1,
-0.2735815, -1.415704, -2.462948, 0, 0, 0, 1, 1,
-0.2699941, 0.2446488, -1.750577, 0, 0, 0, 1, 1,
-0.2685203, -0.3897294, -1.711197, 0, 0, 0, 1, 1,
-0.2647821, -2.127532, -3.498221, 0, 0, 0, 1, 1,
-0.2645008, 1.385029, 1.924659, 1, 1, 1, 1, 1,
-0.2636382, -0.6978902, -5.341483, 1, 1, 1, 1, 1,
-0.2627978, -0.7294417, -1.861868, 1, 1, 1, 1, 1,
-0.2620455, 1.030475, -0.7440646, 1, 1, 1, 1, 1,
-0.2609076, 0.05644327, 0.4153312, 1, 1, 1, 1, 1,
-0.2575477, -1.069772, -3.041371, 1, 1, 1, 1, 1,
-0.2562921, 0.951744, -1.248029, 1, 1, 1, 1, 1,
-0.2534417, 0.07544807, -1.201177, 1, 1, 1, 1, 1,
-0.2464059, -1.296975, -2.801598, 1, 1, 1, 1, 1,
-0.2455256, 1.820982, 0.1409395, 1, 1, 1, 1, 1,
-0.2395457, 0.5394387, -0.880034, 1, 1, 1, 1, 1,
-0.2374899, 0.3813369, -2.378583, 1, 1, 1, 1, 1,
-0.2299575, 0.3631893, -0.559377, 1, 1, 1, 1, 1,
-0.226774, 2.63803, -0.5581841, 1, 1, 1, 1, 1,
-0.2254511, -0.9028879, -3.355808, 1, 1, 1, 1, 1,
-0.2253011, -0.3474509, -2.173184, 0, 0, 1, 1, 1,
-0.2241371, 2.688703, -0.349451, 1, 0, 0, 1, 1,
-0.223322, -0.7454591, -1.979945, 1, 0, 0, 1, 1,
-0.2214292, 0.033949, -1.52808, 1, 0, 0, 1, 1,
-0.2213773, 0.944153, -0.1430796, 1, 0, 0, 1, 1,
-0.2198309, -0.2066498, -2.98625, 1, 0, 0, 1, 1,
-0.2174022, -1.257485, -3.463301, 0, 0, 0, 1, 1,
-0.2151558, -0.7733516, -4.321522, 0, 0, 0, 1, 1,
-0.2149074, 0.1252024, -2.162883, 0, 0, 0, 1, 1,
-0.210378, 0.1845664, -1.688734, 0, 0, 0, 1, 1,
-0.2073877, -1.34852, -3.113661, 0, 0, 0, 1, 1,
-0.20579, 1.69655, -0.7814547, 0, 0, 0, 1, 1,
-0.2044675, 0.06870807, -0.5720975, 0, 0, 0, 1, 1,
-0.2024089, -0.501502, -2.985197, 1, 1, 1, 1, 1,
-0.1996485, -1.938584, -4.759173, 1, 1, 1, 1, 1,
-0.1966362, 0.7003233, -0.3455049, 1, 1, 1, 1, 1,
-0.1829471, 0.09844938, -0.8946587, 1, 1, 1, 1, 1,
-0.1807717, 1.855268, -0.005932806, 1, 1, 1, 1, 1,
-0.1760749, -0.3863558, -2.750458, 1, 1, 1, 1, 1,
-0.1756768, 0.0974596, -0.6785048, 1, 1, 1, 1, 1,
-0.173934, 1.149155, 0.3637601, 1, 1, 1, 1, 1,
-0.1708319, 0.9663824, 1.816187, 1, 1, 1, 1, 1,
-0.1677374, 0.2743815, -1.293026, 1, 1, 1, 1, 1,
-0.1676964, -0.2430134, -2.334695, 1, 1, 1, 1, 1,
-0.1643423, -2.067353, -5.102233, 1, 1, 1, 1, 1,
-0.1638865, 0.2380817, 0.3565605, 1, 1, 1, 1, 1,
-0.1618084, 1.315109, 2.329266, 1, 1, 1, 1, 1,
-0.1600297, -2.438599, -2.213033, 1, 1, 1, 1, 1,
-0.1551232, 0.462871, -0.05529979, 0, 0, 1, 1, 1,
-0.1513311, -0.2694857, -0.9837387, 1, 0, 0, 1, 1,
-0.1477911, 1.440921, -0.560597, 1, 0, 0, 1, 1,
-0.1440058, 2.109189, -2.146915, 1, 0, 0, 1, 1,
-0.143255, -2.521231, -3.158585, 1, 0, 0, 1, 1,
-0.1410847, -0.1739102, -4.548933, 1, 0, 0, 1, 1,
-0.1380794, -0.5400063, -2.022131, 0, 0, 0, 1, 1,
-0.1374719, -1.153687, -1.195901, 0, 0, 0, 1, 1,
-0.1358393, 2.413093, -0.02947178, 0, 0, 0, 1, 1,
-0.1350199, 1.284254, -0.7817827, 0, 0, 0, 1, 1,
-0.1342321, 0.2034592, -0.7218857, 0, 0, 0, 1, 1,
-0.1302103, -0.355813, -3.719973, 0, 0, 0, 1, 1,
-0.1228117, 1.252941, -0.8599503, 0, 0, 0, 1, 1,
-0.121868, -0.03410939, -1.481053, 1, 1, 1, 1, 1,
-0.1213154, -0.6820365, -3.690562, 1, 1, 1, 1, 1,
-0.1189749, -1.101332, -2.482274, 1, 1, 1, 1, 1,
-0.1062037, 0.2326193, -0.746164, 1, 1, 1, 1, 1,
-0.1035401, 0.1589885, 1.362093, 1, 1, 1, 1, 1,
-0.1031901, 0.6045716, 1.49224, 1, 1, 1, 1, 1,
-0.1024283, -0.1570754, -3.35594, 1, 1, 1, 1, 1,
-0.1004662, -0.8233652, -3.278053, 1, 1, 1, 1, 1,
-0.09865323, -0.8726443, -3.400294, 1, 1, 1, 1, 1,
-0.09565897, 1.497375, -0.05895635, 1, 1, 1, 1, 1,
-0.09534847, -0.8245758, -2.047483, 1, 1, 1, 1, 1,
-0.09532017, -1.616382, -2.555538, 1, 1, 1, 1, 1,
-0.09201212, 1.04839, -0.1496235, 1, 1, 1, 1, 1,
-0.08939485, -2.399144, -1.097798, 1, 1, 1, 1, 1,
-0.08551017, -1.637754, -2.468615, 1, 1, 1, 1, 1,
-0.08500646, 1.506056, -0.1714621, 0, 0, 1, 1, 1,
-0.08314615, -0.8317444, -3.856743, 1, 0, 0, 1, 1,
-0.07351922, 0.6496245, -0.05860025, 1, 0, 0, 1, 1,
-0.07248613, -1.16749, -2.385136, 1, 0, 0, 1, 1,
-0.0700044, 1.383525, 0.4869639, 1, 0, 0, 1, 1,
-0.06822124, -0.634708, -4.024532, 1, 0, 0, 1, 1,
-0.06513943, 1.897283, -0.4740443, 0, 0, 0, 1, 1,
-0.06480536, -1.030967, -3.51291, 0, 0, 0, 1, 1,
-0.06158179, 0.193924, -0.2613984, 0, 0, 0, 1, 1,
-0.06083315, -0.4908551, -3.900609, 0, 0, 0, 1, 1,
-0.05921531, 0.6498634, -1.098171, 0, 0, 0, 1, 1,
-0.05580397, -0.06897663, -1.531336, 0, 0, 0, 1, 1,
-0.05229717, -0.6595321, -2.920409, 0, 0, 0, 1, 1,
-0.047791, 0.30509, -0.9491903, 1, 1, 1, 1, 1,
-0.04748401, 0.280513, -0.4922465, 1, 1, 1, 1, 1,
-0.04519082, 2.057938, -1.829614, 1, 1, 1, 1, 1,
-0.04445206, -0.6817754, -3.263936, 1, 1, 1, 1, 1,
-0.04189716, 0.09616498, 0.8643389, 1, 1, 1, 1, 1,
-0.0417854, -1.482304, -4.066874, 1, 1, 1, 1, 1,
-0.04053744, -1.096903, -2.209477, 1, 1, 1, 1, 1,
-0.03719001, -0.19505, -2.759094, 1, 1, 1, 1, 1,
-0.02896827, 0.1947711, 0.2518973, 1, 1, 1, 1, 1,
-0.02775238, -0.05748033, -2.027465, 1, 1, 1, 1, 1,
-0.02709724, -0.1427447, -3.933324, 1, 1, 1, 1, 1,
-0.02558475, 1.906368, 0.05253869, 1, 1, 1, 1, 1,
-0.01913095, -0.8629723, -2.679568, 1, 1, 1, 1, 1,
-0.01841598, -0.546797, -2.960833, 1, 1, 1, 1, 1,
-0.01766326, -1.923766, -2.86829, 1, 1, 1, 1, 1,
-0.01443627, -0.4151796, -3.007261, 0, 0, 1, 1, 1,
-0.01270207, 2.847773, 1.63061, 1, 0, 0, 1, 1,
-0.01014055, -0.3826351, -4.494793, 1, 0, 0, 1, 1,
-0.009940142, -0.872641, -5.23655, 1, 0, 0, 1, 1,
-0.008592239, -1.925365, -3.048489, 1, 0, 0, 1, 1,
-0.006010586, 1.998797, 1.65774, 1, 0, 0, 1, 1,
-0.00195059, -0.2311306, -2.060115, 0, 0, 0, 1, 1,
0.006387984, 2.061913, 0.5969642, 0, 0, 0, 1, 1,
0.009938254, 0.06046836, 0.651795, 0, 0, 0, 1, 1,
0.01354726, -0.6204346, 1.367174, 0, 0, 0, 1, 1,
0.02351619, -0.522101, 1.961621, 0, 0, 0, 1, 1,
0.02629601, -0.455579, 2.909477, 0, 0, 0, 1, 1,
0.02899639, -1.0077, 2.390321, 0, 0, 0, 1, 1,
0.03939782, -0.7605259, 3.582168, 1, 1, 1, 1, 1,
0.04052978, -1.700559, 2.736595, 1, 1, 1, 1, 1,
0.05196841, -0.3346925, 0.9900818, 1, 1, 1, 1, 1,
0.0615068, -0.8047966, 1.790697, 1, 1, 1, 1, 1,
0.06287754, -0.2722986, 3.724823, 1, 1, 1, 1, 1,
0.06350441, -0.5292175, 3.618762, 1, 1, 1, 1, 1,
0.06351313, -0.7616886, 2.853204, 1, 1, 1, 1, 1,
0.06883854, -1.756776, 2.72399, 1, 1, 1, 1, 1,
0.07434617, 2.300885, 0.5354257, 1, 1, 1, 1, 1,
0.08483814, 0.7917415, -0.02570083, 1, 1, 1, 1, 1,
0.085096, -0.3821976, 2.890736, 1, 1, 1, 1, 1,
0.08572291, 0.2123944, 1.310625, 1, 1, 1, 1, 1,
0.08745848, 0.01575062, -0.1722866, 1, 1, 1, 1, 1,
0.09105358, -0.5661561, 2.334644, 1, 1, 1, 1, 1,
0.091731, -0.4905434, 3.233834, 1, 1, 1, 1, 1,
0.09253778, -0.3110908, 4.115797, 0, 0, 1, 1, 1,
0.09360248, -0.9349525, 2.828111, 1, 0, 0, 1, 1,
0.09737348, 0.3399698, -1.324077, 1, 0, 0, 1, 1,
0.09916998, 1.001793, 1.730816, 1, 0, 0, 1, 1,
0.1049304, 0.140291, 2.60846, 1, 0, 0, 1, 1,
0.1087898, 1.423348, 2.031738, 1, 0, 0, 1, 1,
0.110742, -1.854915, 3.220383, 0, 0, 0, 1, 1,
0.1110595, -1.455488, 2.427502, 0, 0, 0, 1, 1,
0.1116214, 0.1512698, 2.654732, 0, 0, 0, 1, 1,
0.1144672, -0.7908563, 2.147993, 0, 0, 0, 1, 1,
0.1182829, 1.782587, 0.682659, 0, 0, 0, 1, 1,
0.1187202, 1.325094, -0.9370816, 0, 0, 0, 1, 1,
0.1191906, -0.396533, 3.036173, 0, 0, 0, 1, 1,
0.1226306, -0.4030533, 2.536099, 1, 1, 1, 1, 1,
0.1278375, -0.2247434, 4.09757, 1, 1, 1, 1, 1,
0.1283393, 0.1230696, 1.074592, 1, 1, 1, 1, 1,
0.128765, 0.7490894, 1.142465, 1, 1, 1, 1, 1,
0.1302674, -0.2925132, 1.550993, 1, 1, 1, 1, 1,
0.1304816, 0.8153749, -0.02477989, 1, 1, 1, 1, 1,
0.132567, 1.13017, 0.3939744, 1, 1, 1, 1, 1,
0.1339873, -1.300371, 2.688822, 1, 1, 1, 1, 1,
0.1342405, 1.003895, 1.46633, 1, 1, 1, 1, 1,
0.1373405, 0.7435921, -0.1822283, 1, 1, 1, 1, 1,
0.1402404, 0.3673941, 0.4249341, 1, 1, 1, 1, 1,
0.1450393, 0.01912817, 0.3844361, 1, 1, 1, 1, 1,
0.1461423, 0.02146576, 1.561085, 1, 1, 1, 1, 1,
0.1473125, 1.597453, -0.03077076, 1, 1, 1, 1, 1,
0.1507916, -0.2509384, 2.205061, 1, 1, 1, 1, 1,
0.1515902, 0.9418092, 0.01211288, 0, 0, 1, 1, 1,
0.1559525, -0.4327058, 1.997092, 1, 0, 0, 1, 1,
0.1645516, 0.1607417, -0.01204575, 1, 0, 0, 1, 1,
0.1662717, 0.3113933, 0.033784, 1, 0, 0, 1, 1,
0.1691407, -0.7746109, 2.824172, 1, 0, 0, 1, 1,
0.1702935, 2.643733, 1.570675, 1, 0, 0, 1, 1,
0.1727049, 0.5195844, -1.257087, 0, 0, 0, 1, 1,
0.1734881, -1.177369, 1.638885, 0, 0, 0, 1, 1,
0.1739919, 0.2915443, 0.1494185, 0, 0, 0, 1, 1,
0.1748455, 0.4751889, 0.6281718, 0, 0, 0, 1, 1,
0.1757141, -0.3482251, 0.8776518, 0, 0, 0, 1, 1,
0.1806493, 0.5459553, 0.1376011, 0, 0, 0, 1, 1,
0.1815952, -0.685711, 3.099876, 0, 0, 0, 1, 1,
0.1824597, 0.8483073, -0.9558883, 1, 1, 1, 1, 1,
0.1837354, -1.123969, 3.510952, 1, 1, 1, 1, 1,
0.1876466, -0.7215792, 3.347092, 1, 1, 1, 1, 1,
0.1889053, 0.06423089, 1.43418, 1, 1, 1, 1, 1,
0.1925212, -0.2185642, 2.38781, 1, 1, 1, 1, 1,
0.1934705, -0.7646135, 0.9097692, 1, 1, 1, 1, 1,
0.1973061, -0.2959537, 2.256624, 1, 1, 1, 1, 1,
0.1989801, 1.771841, 0.8357414, 1, 1, 1, 1, 1,
0.1993564, -0.487712, 3.510059, 1, 1, 1, 1, 1,
0.199443, -0.05577389, 2.745158, 1, 1, 1, 1, 1,
0.1999745, 0.4632586, 1.478439, 1, 1, 1, 1, 1,
0.200093, -2.051484, 1.923101, 1, 1, 1, 1, 1,
0.2058659, 0.7661179, -1.196469, 1, 1, 1, 1, 1,
0.206986, 0.3770678, 0.9621592, 1, 1, 1, 1, 1,
0.2100349, -0.2168518, 4.234151, 1, 1, 1, 1, 1,
0.2125581, -0.2028154, 2.270862, 0, 0, 1, 1, 1,
0.2132479, -0.325424, 3.051816, 1, 0, 0, 1, 1,
0.2208976, -0.1162311, 2.329532, 1, 0, 0, 1, 1,
0.223638, 0.7724299, 2.953832, 1, 0, 0, 1, 1,
0.2287601, 0.9726587, -0.1848177, 1, 0, 0, 1, 1,
0.230244, -0.9994754, 2.665877, 1, 0, 0, 1, 1,
0.230771, -1.662161, 4.406457, 0, 0, 0, 1, 1,
0.2308654, 2.38444, 1.723074, 0, 0, 0, 1, 1,
0.2323375, 0.3960369, -0.06346595, 0, 0, 0, 1, 1,
0.2328604, -1.137173, 2.396485, 0, 0, 0, 1, 1,
0.2354858, -0.6162132, 1.110498, 0, 0, 0, 1, 1,
0.23797, 1.861658, -0.7831638, 0, 0, 0, 1, 1,
0.2397713, -0.2190817, 2.043561, 0, 0, 0, 1, 1,
0.2413726, -1.019511, 2.344602, 1, 1, 1, 1, 1,
0.2429047, 0.3902895, 1.338694, 1, 1, 1, 1, 1,
0.2468617, -0.2565326, 0.7102386, 1, 1, 1, 1, 1,
0.2479682, -1.959594, 1.472955, 1, 1, 1, 1, 1,
0.248699, 1.471317, 0.9700535, 1, 1, 1, 1, 1,
0.2507934, -0.3907938, 2.432114, 1, 1, 1, 1, 1,
0.2513114, -0.1584167, 3.382794, 1, 1, 1, 1, 1,
0.2567676, 0.4736787, -0.009357891, 1, 1, 1, 1, 1,
0.2567808, -1.591428, 2.719743, 1, 1, 1, 1, 1,
0.2586765, -1.193733, 2.642245, 1, 1, 1, 1, 1,
0.2605218, -0.4174857, 1.682864, 1, 1, 1, 1, 1,
0.2642772, 0.2130966, -0.7000322, 1, 1, 1, 1, 1,
0.2650475, -0.6931361, 3.832806, 1, 1, 1, 1, 1,
0.2690626, 0.7480853, 1.460077, 1, 1, 1, 1, 1,
0.2734965, -0.1431185, 3.232601, 1, 1, 1, 1, 1,
0.2745778, -2.044391, 1.842082, 0, 0, 1, 1, 1,
0.2758447, 0.2325058, 1.850801, 1, 0, 0, 1, 1,
0.281934, -1.811218, 2.327541, 1, 0, 0, 1, 1,
0.2841899, 1.4521, 0.1511867, 1, 0, 0, 1, 1,
0.2842939, 0.3746856, 0.5038624, 1, 0, 0, 1, 1,
0.2848776, 0.09890535, 0.7229359, 1, 0, 0, 1, 1,
0.2851168, -0.4932474, 1.981375, 0, 0, 0, 1, 1,
0.2852878, 0.2527541, 2.658598, 0, 0, 0, 1, 1,
0.291711, -0.2657519, 2.883249, 0, 0, 0, 1, 1,
0.2947289, -0.191442, 1.365456, 0, 0, 0, 1, 1,
0.29897, 1.43659, 0.9296558, 0, 0, 0, 1, 1,
0.3034285, 0.7336975, -0.2296074, 0, 0, 0, 1, 1,
0.3129054, -0.1946547, 1.021188, 0, 0, 0, 1, 1,
0.3134646, 0.7710026, 2.536379, 1, 1, 1, 1, 1,
0.3141642, -2.496084, 2.877066, 1, 1, 1, 1, 1,
0.3143658, 1.553588, 1.0257, 1, 1, 1, 1, 1,
0.315212, -0.7244574, 2.578191, 1, 1, 1, 1, 1,
0.3181603, 1.944355, -0.5825357, 1, 1, 1, 1, 1,
0.3183811, -0.8803045, 3.015517, 1, 1, 1, 1, 1,
0.3184513, -0.3415981, 1.190809, 1, 1, 1, 1, 1,
0.3190619, -1.238248, 2.407433, 1, 1, 1, 1, 1,
0.3192206, -0.4253566, 3.198688, 1, 1, 1, 1, 1,
0.3201349, 0.3972721, 1.064179, 1, 1, 1, 1, 1,
0.3260073, 1.383018, -0.4414398, 1, 1, 1, 1, 1,
0.3268301, -1.432579, 1.79321, 1, 1, 1, 1, 1,
0.3272696, 0.1444245, 1.113143, 1, 1, 1, 1, 1,
0.3333375, 1.164202, -0.6267281, 1, 1, 1, 1, 1,
0.3348102, -0.9675746, 2.901513, 1, 1, 1, 1, 1,
0.338001, -0.3055991, 1.871471, 0, 0, 1, 1, 1,
0.344836, 0.06387375, 3.91046, 1, 0, 0, 1, 1,
0.3448449, 0.4744596, 0.7625529, 1, 0, 0, 1, 1,
0.3464146, 1.582077, -1.029523, 1, 0, 0, 1, 1,
0.3475126, 0.4937299, 1.5817, 1, 0, 0, 1, 1,
0.3488581, -0.338649, 1.402472, 1, 0, 0, 1, 1,
0.3549622, -0.007420835, -0.629081, 0, 0, 0, 1, 1,
0.3592643, 1.744503, 0.9210253, 0, 0, 0, 1, 1,
0.3639526, 0.05837261, 1.435597, 0, 0, 0, 1, 1,
0.3754847, 0.2556009, 1.696548, 0, 0, 0, 1, 1,
0.375557, -1.582622, 1.36414, 0, 0, 0, 1, 1,
0.382031, 0.9926885, -0.4397874, 0, 0, 0, 1, 1,
0.3846241, 0.1549145, 1.123466, 0, 0, 0, 1, 1,
0.3872659, -0.3915428, 1.793184, 1, 1, 1, 1, 1,
0.3879728, -0.348467, 1.697786, 1, 1, 1, 1, 1,
0.3924819, -0.03047487, 0.6402633, 1, 1, 1, 1, 1,
0.3932257, 0.2721343, 3.097722, 1, 1, 1, 1, 1,
0.3947309, 0.3043227, 1.475004, 1, 1, 1, 1, 1,
0.4013798, 2.206352, 1.054949, 1, 1, 1, 1, 1,
0.4028088, 1.442834, 1.605779, 1, 1, 1, 1, 1,
0.4034488, -1.381937, 3.698532, 1, 1, 1, 1, 1,
0.405461, -0.4500644, 1.00626, 1, 1, 1, 1, 1,
0.4054791, -1.015262, 3.213076, 1, 1, 1, 1, 1,
0.408962, 0.9321386, -0.331912, 1, 1, 1, 1, 1,
0.4098257, 1.062292, 1.811424, 1, 1, 1, 1, 1,
0.4142189, 0.01081306, 2.675127, 1, 1, 1, 1, 1,
0.4165349, -0.2081929, 0.893792, 1, 1, 1, 1, 1,
0.4201856, 1.309238, 0.6296725, 1, 1, 1, 1, 1,
0.4231828, 0.08459288, 2.317003, 0, 0, 1, 1, 1,
0.4279506, 0.05587315, 1.237273, 1, 0, 0, 1, 1,
0.4316915, -1.986513, 2.32604, 1, 0, 0, 1, 1,
0.4319216, -0.6958484, 3.763462, 1, 0, 0, 1, 1,
0.434395, -1.083744, 2.506697, 1, 0, 0, 1, 1,
0.4378522, 0.6415861, -0.3714541, 1, 0, 0, 1, 1,
0.4449283, -1.086313, 1.52367, 0, 0, 0, 1, 1,
0.446356, -1.541684, 3.761127, 0, 0, 0, 1, 1,
0.447874, -1.468144, 3.153305, 0, 0, 0, 1, 1,
0.4526913, -0.4471489, 2.973053, 0, 0, 0, 1, 1,
0.4535766, -0.6183041, 3.71506, 0, 0, 0, 1, 1,
0.4596422, -0.2604336, 3.552279, 0, 0, 0, 1, 1,
0.4620654, 0.070598, 0.2461644, 0, 0, 0, 1, 1,
0.464001, -0.6097972, 3.840397, 1, 1, 1, 1, 1,
0.4652955, -0.7773579, 2.489946, 1, 1, 1, 1, 1,
0.4673788, 1.274829, 0.9004143, 1, 1, 1, 1, 1,
0.4710447, -0.9072386, 4.552639, 1, 1, 1, 1, 1,
0.4716928, 0.1819717, 1.019933, 1, 1, 1, 1, 1,
0.474177, 1.470081, 0.1539535, 1, 1, 1, 1, 1,
0.4745178, 0.9513732, 0.1230995, 1, 1, 1, 1, 1,
0.4801828, 1.772175, 0.4151959, 1, 1, 1, 1, 1,
0.4925677, -0.646488, 3.949426, 1, 1, 1, 1, 1,
0.4955661, -0.4977415, 3.351936, 1, 1, 1, 1, 1,
0.4965346, 1.530788, -1.189072, 1, 1, 1, 1, 1,
0.5001765, 0.1195879, 1.415096, 1, 1, 1, 1, 1,
0.5061775, -0.3866986, 0.7795129, 1, 1, 1, 1, 1,
0.5077713, -0.006739302, -0.3860343, 1, 1, 1, 1, 1,
0.5079121, 0.6503218, 1.086117, 1, 1, 1, 1, 1,
0.5162792, 0.04119029, 1.516107, 0, 0, 1, 1, 1,
0.519008, 0.9813082, 0.9514052, 1, 0, 0, 1, 1,
0.5203556, -0.4320165, 3.414583, 1, 0, 0, 1, 1,
0.5281121, -0.5836512, 1.652089, 1, 0, 0, 1, 1,
0.5343338, 1.061921, -0.9720422, 1, 0, 0, 1, 1,
0.5415391, -0.3731212, 1.390569, 1, 0, 0, 1, 1,
0.5501651, 0.8156424, -0.008363621, 0, 0, 0, 1, 1,
0.5584839, -0.5669139, 0.9189515, 0, 0, 0, 1, 1,
0.5645572, 0.4844626, -0.1857858, 0, 0, 0, 1, 1,
0.565459, -1.531215, 4.385395, 0, 0, 0, 1, 1,
0.5665234, 1.129261, 0.9448857, 0, 0, 0, 1, 1,
0.5803006, 0.9606302, -0.3287218, 0, 0, 0, 1, 1,
0.582324, -0.1371174, 1.399212, 0, 0, 0, 1, 1,
0.582679, 0.5808281, 1.591123, 1, 1, 1, 1, 1,
0.5875952, 1.640962, -1.910147, 1, 1, 1, 1, 1,
0.5876327, 0.904065, 1.012349, 1, 1, 1, 1, 1,
0.5925826, -1.047899, 0.8635506, 1, 1, 1, 1, 1,
0.5950359, 1.761608, 1.813111, 1, 1, 1, 1, 1,
0.5991834, 0.1238451, 1.772494, 1, 1, 1, 1, 1,
0.6013802, -0.009377986, 1.362981, 1, 1, 1, 1, 1,
0.6038747, -0.1636942, 2.184504, 1, 1, 1, 1, 1,
0.6052231, -0.8105282, 3.209353, 1, 1, 1, 1, 1,
0.6082953, 1.147677, -0.1188047, 1, 1, 1, 1, 1,
0.6107728, 1.175574, -0.5419872, 1, 1, 1, 1, 1,
0.6151596, 2.127619, -1.22047, 1, 1, 1, 1, 1,
0.6194323, -0.3827394, 0.7226222, 1, 1, 1, 1, 1,
0.6194774, -0.4412486, 2.105549, 1, 1, 1, 1, 1,
0.6220358, -0.1155681, 1.476775, 1, 1, 1, 1, 1,
0.6264631, 1.270684, -0.3289409, 0, 0, 1, 1, 1,
0.6311767, 2.124074, 0.8795394, 1, 0, 0, 1, 1,
0.6314684, -0.7863929, 3.9824, 1, 0, 0, 1, 1,
0.6393865, -0.4387058, 3.00924, 1, 0, 0, 1, 1,
0.6407055, 0.6131368, 0.5947703, 1, 0, 0, 1, 1,
0.6408321, 1.089341, 0.510654, 1, 0, 0, 1, 1,
0.6429493, -0.5602821, 1.557338, 0, 0, 0, 1, 1,
0.6465778, 0.2709316, 2.695331, 0, 0, 0, 1, 1,
0.6471603, -0.915692, 0.7277934, 0, 0, 0, 1, 1,
0.649906, 1.099019, 1.081511, 0, 0, 0, 1, 1,
0.657986, 0.1246428, 2.177265, 0, 0, 0, 1, 1,
0.6615591, 0.2719542, -0.07486035, 0, 0, 0, 1, 1,
0.66373, 0.3044067, 0.8392492, 0, 0, 0, 1, 1,
0.6712011, 0.5050629, 0.6065608, 1, 1, 1, 1, 1,
0.6768689, -0.7991377, 1.694486, 1, 1, 1, 1, 1,
0.6789713, -0.4111013, 1.927884, 1, 1, 1, 1, 1,
0.6793393, 1.001575, -0.9457761, 1, 1, 1, 1, 1,
0.6838673, -0.8743065, 4.961418, 1, 1, 1, 1, 1,
0.6882558, 0.5213392, 2.435006, 1, 1, 1, 1, 1,
0.691442, 0.619294, 0.9986548, 1, 1, 1, 1, 1,
0.695505, -1.457113, 2.717366, 1, 1, 1, 1, 1,
0.69598, -0.9019865, 3.156737, 1, 1, 1, 1, 1,
0.696727, -0.5994303, 2.392804, 1, 1, 1, 1, 1,
0.6976169, 0.9580531, -0.1049415, 1, 1, 1, 1, 1,
0.6987935, -0.0284998, 2.045971, 1, 1, 1, 1, 1,
0.6996995, -0.1256122, 1.652627, 1, 1, 1, 1, 1,
0.7038434, 1.374927, 0.8671554, 1, 1, 1, 1, 1,
0.7066568, -0.2009979, 1.842679, 1, 1, 1, 1, 1,
0.7066654, 0.5499236, 1.876347, 0, 0, 1, 1, 1,
0.7073135, -0.2012107, 3.594649, 1, 0, 0, 1, 1,
0.7101806, 0.1052365, 0.999916, 1, 0, 0, 1, 1,
0.7103973, -0.7262363, 3.614623, 1, 0, 0, 1, 1,
0.7141568, -1.244127, 2.160508, 1, 0, 0, 1, 1,
0.717172, 0.3850346, -0.02959171, 1, 0, 0, 1, 1,
0.7215696, 0.1306276, 1.628245, 0, 0, 0, 1, 1,
0.7222742, -1.535732, 1.712208, 0, 0, 0, 1, 1,
0.7278625, 1.138636, 1.809489, 0, 0, 0, 1, 1,
0.7287164, 1.122745, 0.4957498, 0, 0, 0, 1, 1,
0.7299806, 0.476, -0.5217209, 0, 0, 0, 1, 1,
0.7300368, -0.4439825, 3.9342, 0, 0, 0, 1, 1,
0.7312997, 1.503359, 1.252437, 0, 0, 0, 1, 1,
0.7358481, 0.04884258, 1.758353, 1, 1, 1, 1, 1,
0.7449138, -1.220702, 2.366102, 1, 1, 1, 1, 1,
0.7449192, 0.4007932, 0.0823364, 1, 1, 1, 1, 1,
0.7459081, 1.34341, 0.792185, 1, 1, 1, 1, 1,
0.7481886, 0.08528809, 2.270802, 1, 1, 1, 1, 1,
0.7490243, -0.4797612, 2.645692, 1, 1, 1, 1, 1,
0.7507533, -0.7973113, 3.180758, 1, 1, 1, 1, 1,
0.7512735, 0.4955087, 2.081811, 1, 1, 1, 1, 1,
0.7552097, -1.274777, 1.900159, 1, 1, 1, 1, 1,
0.7579608, -0.1659057, -0.1267727, 1, 1, 1, 1, 1,
0.7611245, -1.114001, 3.254121, 1, 1, 1, 1, 1,
0.7627037, 0.3405477, 0.41539, 1, 1, 1, 1, 1,
0.7639601, 0.82687, 0.05536475, 1, 1, 1, 1, 1,
0.7668405, 0.0410877, 1.931473, 1, 1, 1, 1, 1,
0.7691594, -0.5675343, 1.537874, 1, 1, 1, 1, 1,
0.7693456, -0.4624377, 0.4453836, 0, 0, 1, 1, 1,
0.7749072, -1.343627, 0.5007761, 1, 0, 0, 1, 1,
0.7762734, 0.05764314, 0.7771621, 1, 0, 0, 1, 1,
0.7766203, -0.1110519, 2.473684, 1, 0, 0, 1, 1,
0.7842297, 0.00826204, 1.510567, 1, 0, 0, 1, 1,
0.7858726, -0.8135093, 1.472183, 1, 0, 0, 1, 1,
0.7875616, -0.2184473, 3.334584, 0, 0, 0, 1, 1,
0.7902004, 0.3182434, 2.004388, 0, 0, 0, 1, 1,
0.7902634, -2.420181, 2.257926, 0, 0, 0, 1, 1,
0.7931814, -1.506907, 2.585205, 0, 0, 0, 1, 1,
0.7953411, -1.237349, 1.445653, 0, 0, 0, 1, 1,
0.7958205, -1.03973, 2.675118, 0, 0, 0, 1, 1,
0.7981614, -1.610538, 0.5260321, 0, 0, 0, 1, 1,
0.8087155, 0.8027403, -0.3640483, 1, 1, 1, 1, 1,
0.8170523, -0.8843824, 3.580427, 1, 1, 1, 1, 1,
0.821565, 1.536649, 0.9546302, 1, 1, 1, 1, 1,
0.8217523, 0.1808533, 1.237515, 1, 1, 1, 1, 1,
0.8342847, -0.3963986, 1.53271, 1, 1, 1, 1, 1,
0.836003, 1.010189, 1.892443, 1, 1, 1, 1, 1,
0.8385086, -0.7098249, 1.370331, 1, 1, 1, 1, 1,
0.8387088, -1.453742, 1.29196, 1, 1, 1, 1, 1,
0.8403419, -0.8976289, 0.7196605, 1, 1, 1, 1, 1,
0.8408144, -1.373635, 2.02135, 1, 1, 1, 1, 1,
0.8434145, 1.090613, 2.323062, 1, 1, 1, 1, 1,
0.8481721, -1.460956, 1.361949, 1, 1, 1, 1, 1,
0.8489628, -0.2124623, 1.785373, 1, 1, 1, 1, 1,
0.8509908, 0.3766215, 1.14913, 1, 1, 1, 1, 1,
0.857304, 0.3906013, 3.054106, 1, 1, 1, 1, 1,
0.8649974, 2.707408, -1.241559, 0, 0, 1, 1, 1,
0.8661171, -0.5070068, 2.690638, 1, 0, 0, 1, 1,
0.8669967, 0.8481017, 2.020241, 1, 0, 0, 1, 1,
0.8676369, 0.6321476, 2.118499, 1, 0, 0, 1, 1,
0.8714442, -0.1388134, 0.2652282, 1, 0, 0, 1, 1,
0.8734933, 0.2137837, 4.106254, 1, 0, 0, 1, 1,
0.8741758, -0.8001845, 1.423303, 0, 0, 0, 1, 1,
0.8761081, -1.876863, 1.707921, 0, 0, 0, 1, 1,
0.8828865, 0.3136102, 0.4450108, 0, 0, 0, 1, 1,
0.8865562, 0.6272567, 1.009856, 0, 0, 0, 1, 1,
0.8890491, -0.05146261, 4.120193, 0, 0, 0, 1, 1,
0.8913925, 2.927147, 0.609177, 0, 0, 0, 1, 1,
0.8940714, 1.502514, 1.062298, 0, 0, 0, 1, 1,
0.8949036, 1.386128, 0.9681802, 1, 1, 1, 1, 1,
0.895549, -0.557076, 2.33442, 1, 1, 1, 1, 1,
0.8962691, 0.3358054, 2.317103, 1, 1, 1, 1, 1,
0.898353, 0.3180477, 2.643862, 1, 1, 1, 1, 1,
0.9048746, -0.7706798, 3.318594, 1, 1, 1, 1, 1,
0.9099178, -1.274562, 2.156471, 1, 1, 1, 1, 1,
0.914063, 0.9997737, 0.06140257, 1, 1, 1, 1, 1,
0.9153311, -0.7556277, 3.449167, 1, 1, 1, 1, 1,
0.9221494, 1.18816, -0.5397146, 1, 1, 1, 1, 1,
0.9308906, -0.3963295, 1.0978, 1, 1, 1, 1, 1,
0.9368913, 2.327967, 1.105443, 1, 1, 1, 1, 1,
0.9387728, 1.242419, 1.841368, 1, 1, 1, 1, 1,
0.9474357, 0.2050146, 2.932749, 1, 1, 1, 1, 1,
0.9492726, -0.8969569, -0.136674, 1, 1, 1, 1, 1,
0.9502438, -1.638527, 2.979564, 1, 1, 1, 1, 1,
0.9517122, 0.9644071, -0.8886855, 0, 0, 1, 1, 1,
0.9528379, 1.552439, 2.445783, 1, 0, 0, 1, 1,
0.9587817, -1.255248, 2.402827, 1, 0, 0, 1, 1,
0.9596539, -1.660222, 3.077287, 1, 0, 0, 1, 1,
0.9615161, 0.5746897, 0.1646759, 1, 0, 0, 1, 1,
0.9621001, 0.6620702, 0.9202156, 1, 0, 0, 1, 1,
0.966848, 0.1243568, 2.326147, 0, 0, 0, 1, 1,
0.9679877, -0.2762878, 1.69822, 0, 0, 0, 1, 1,
0.9716184, -0.8844485, 3.615392, 0, 0, 0, 1, 1,
0.9764562, -0.7337984, 2.947285, 0, 0, 0, 1, 1,
0.9821169, 0.1951649, -0.8029705, 0, 0, 0, 1, 1,
0.9828607, 0.3523295, 2.06342, 0, 0, 0, 1, 1,
0.991147, -0.0178713, 1.36411, 0, 0, 0, 1, 1,
0.9981956, -1.773879, 1.541269, 1, 1, 1, 1, 1,
0.9989177, -0.732312, 2.992741, 1, 1, 1, 1, 1,
1.00126, 2.053317, 2.903104, 1, 1, 1, 1, 1,
1.028363, -1.528383, 2.463128, 1, 1, 1, 1, 1,
1.029167, 0.2721287, 1.55504, 1, 1, 1, 1, 1,
1.034245, 0.1659722, 1.472622, 1, 1, 1, 1, 1,
1.041982, 1.071885, 1.221903, 1, 1, 1, 1, 1,
1.049367, 1.810825, 1.98274, 1, 1, 1, 1, 1,
1.05203, -0.3961886, 1.114766, 1, 1, 1, 1, 1,
1.052867, 0.8480983, -0.02332164, 1, 1, 1, 1, 1,
1.064176, 0.8694443, 0.3403968, 1, 1, 1, 1, 1,
1.069019, 0.2420257, 2.362236, 1, 1, 1, 1, 1,
1.073303, -0.8800231, 3.031806, 1, 1, 1, 1, 1,
1.075336, 0.2878309, 0.5349548, 1, 1, 1, 1, 1,
1.080045, 1.26463, 1.615196, 1, 1, 1, 1, 1,
1.081374, -0.1028459, 0.4552245, 0, 0, 1, 1, 1,
1.085649, -0.339354, 2.189107, 1, 0, 0, 1, 1,
1.085696, 0.8749642, 2.505158, 1, 0, 0, 1, 1,
1.092449, -1.684314, 2.455621, 1, 0, 0, 1, 1,
1.098373, -1.509369, 3.587222, 1, 0, 0, 1, 1,
1.100035, -0.4936368, 0.5004655, 1, 0, 0, 1, 1,
1.104675, -0.7595248, 1.585218, 0, 0, 0, 1, 1,
1.104954, 1.939716, 1.656919, 0, 0, 0, 1, 1,
1.106588, 1.387311, 1.798084, 0, 0, 0, 1, 1,
1.107632, 0.5076222, -0.9532197, 0, 0, 0, 1, 1,
1.111111, -1.058991, 2.676575, 0, 0, 0, 1, 1,
1.114889, 1.497762, -0.5729064, 0, 0, 0, 1, 1,
1.122684, -0.2445307, 1.477506, 0, 0, 0, 1, 1,
1.135531, 0.651036, 1.419941, 1, 1, 1, 1, 1,
1.138557, -0.005788277, 1.75852, 1, 1, 1, 1, 1,
1.153075, 0.7942623, -0.227783, 1, 1, 1, 1, 1,
1.155309, 0.3410654, 1.938535, 1, 1, 1, 1, 1,
1.156185, -1.488937, 2.065562, 1, 1, 1, 1, 1,
1.157117, -0.6653401, 2.589856, 1, 1, 1, 1, 1,
1.158789, 1.455146, 0.8003579, 1, 1, 1, 1, 1,
1.173165, -1.184017, 4.634442, 1, 1, 1, 1, 1,
1.179214, 1.016986, 0.6245586, 1, 1, 1, 1, 1,
1.205245, -0.9373717, 1.448198, 1, 1, 1, 1, 1,
1.209221, 0.6735192, 1.265465, 1, 1, 1, 1, 1,
1.225949, 0.7627887, 0.921974, 1, 1, 1, 1, 1,
1.228392, 0.1583407, 2.324088, 1, 1, 1, 1, 1,
1.228835, -0.5876475, 2.245855, 1, 1, 1, 1, 1,
1.233742, 0.2682922, 1.983534, 1, 1, 1, 1, 1,
1.233782, -0.9975117, 1.369943, 0, 0, 1, 1, 1,
1.238388, 1.7597, -0.4172517, 1, 0, 0, 1, 1,
1.24565, 0.1833368, 0.588601, 1, 0, 0, 1, 1,
1.27163, -1.801843, 1.09822, 1, 0, 0, 1, 1,
1.282645, 0.1543622, 0.719313, 1, 0, 0, 1, 1,
1.282831, -1.940017, 3.364014, 1, 0, 0, 1, 1,
1.288091, 0.6465296, 1.062761, 0, 0, 0, 1, 1,
1.301414, 0.9087944, 0.1488687, 0, 0, 0, 1, 1,
1.316343, -0.5947024, 1.931293, 0, 0, 0, 1, 1,
1.318164, 1.594466, 0.3865309, 0, 0, 0, 1, 1,
1.321414, 3.06666, 0.1315906, 0, 0, 0, 1, 1,
1.326029, -1.105648, 2.499597, 0, 0, 0, 1, 1,
1.339267, 0.1086178, 1.612781, 0, 0, 0, 1, 1,
1.345282, -0.2761756, 1.929548, 1, 1, 1, 1, 1,
1.348983, -0.2318715, 1.595365, 1, 1, 1, 1, 1,
1.362599, 1.385813, 1.330456, 1, 1, 1, 1, 1,
1.365031, -1.612639, 1.34748, 1, 1, 1, 1, 1,
1.366639, 0.364208, 0.749137, 1, 1, 1, 1, 1,
1.380903, -0.7840046, 0.2399361, 1, 1, 1, 1, 1,
1.383461, 0.8579531, 0.8418787, 1, 1, 1, 1, 1,
1.387721, 1.014536, 2.460221, 1, 1, 1, 1, 1,
1.391317, 0.8845548, 0.7833929, 1, 1, 1, 1, 1,
1.393427, -0.9007258, 2.886407, 1, 1, 1, 1, 1,
1.401024, 0.07280446, 1.961624, 1, 1, 1, 1, 1,
1.403788, -0.1121975, 3.113427, 1, 1, 1, 1, 1,
1.43236, 1.202049, 1.319259, 1, 1, 1, 1, 1,
1.442319, 0.6016851, 1.602244, 1, 1, 1, 1, 1,
1.448036, -0.3211684, 2.003834, 1, 1, 1, 1, 1,
1.451483, -1.139888, -0.1884899, 0, 0, 1, 1, 1,
1.462296, -0.5603412, -0.04788631, 1, 0, 0, 1, 1,
1.462695, -2.263982, 1.817949, 1, 0, 0, 1, 1,
1.467581, 0.2232052, 1.188521, 1, 0, 0, 1, 1,
1.484982, -0.2294496, 2.594458, 1, 0, 0, 1, 1,
1.491068, -0.7637144, 1.633258, 1, 0, 0, 1, 1,
1.492501, 0.788005, 0.367835, 0, 0, 0, 1, 1,
1.49555, -0.2648969, -0.2509227, 0, 0, 0, 1, 1,
1.503967, -1.226969, 2.255102, 0, 0, 0, 1, 1,
1.510916, -0.9997063, 2.965216, 0, 0, 0, 1, 1,
1.515402, 0.5540475, 1.204037, 0, 0, 0, 1, 1,
1.521123, -0.9379815, 1.701407, 0, 0, 0, 1, 1,
1.524261, 0.3298387, 0.4043461, 0, 0, 0, 1, 1,
1.524668, -1.168741, 2.899709, 1, 1, 1, 1, 1,
1.544917, 2.43778, -0.1431033, 1, 1, 1, 1, 1,
1.550509, 1.18733, 0.4108915, 1, 1, 1, 1, 1,
1.552023, -0.2519687, -0.4267233, 1, 1, 1, 1, 1,
1.555531, -0.3344471, 2.966594, 1, 1, 1, 1, 1,
1.556519, -1.731749, 2.207798, 1, 1, 1, 1, 1,
1.55911, -0.3092844, 1.816986, 1, 1, 1, 1, 1,
1.559663, -1.799136, 4.703074, 1, 1, 1, 1, 1,
1.563567, -1.411812, 3.528745, 1, 1, 1, 1, 1,
1.590217, -2.191583, 2.576749, 1, 1, 1, 1, 1,
1.595716, 2.6821, 0.839089, 1, 1, 1, 1, 1,
1.595803, 0.9338053, 1.545131, 1, 1, 1, 1, 1,
1.597121, 0.7094179, 2.165772, 1, 1, 1, 1, 1,
1.614206, -0.149402, 1.877666, 1, 1, 1, 1, 1,
1.633506, 0.6607693, 0.3037532, 1, 1, 1, 1, 1,
1.639137, -0.6837171, 2.379223, 0, 0, 1, 1, 1,
1.650737, -0.1360654, 0.6342745, 1, 0, 0, 1, 1,
1.674926, 0.05758555, 0.1324335, 1, 0, 0, 1, 1,
1.715755, 1.426842, -0.1841903, 1, 0, 0, 1, 1,
1.728045, 0.5795515, 2.10498, 1, 0, 0, 1, 1,
1.783641, -0.265, 2.054792, 1, 0, 0, 1, 1,
1.808942, 0.400481, 0.533685, 0, 0, 0, 1, 1,
1.812129, -2.212798, 2.283768, 0, 0, 0, 1, 1,
1.820184, 0.06113277, 1.759419, 0, 0, 0, 1, 1,
1.830981, 0.2664757, -0.05095297, 0, 0, 0, 1, 1,
1.840882, -0.3398142, 3.025325, 0, 0, 0, 1, 1,
1.846301, -0.4730564, 0.5922652, 0, 0, 0, 1, 1,
1.864079, 0.2325592, 0.3985173, 0, 0, 0, 1, 1,
1.871111, 0.02997915, 0.5429154, 1, 1, 1, 1, 1,
1.880603, -2.278374, 1.741086, 1, 1, 1, 1, 1,
1.884677, 0.5924271, 1.727468, 1, 1, 1, 1, 1,
1.886506, 1.295138, 0.5186172, 1, 1, 1, 1, 1,
1.908792, 0.5729468, 1.421777, 1, 1, 1, 1, 1,
1.934839, -0.4902212, 0.912096, 1, 1, 1, 1, 1,
2.005129, 0.2086005, 1.719637, 1, 1, 1, 1, 1,
2.062588, 0.03243412, 2.853104, 1, 1, 1, 1, 1,
2.075717, 1.097626, 0.9599604, 1, 1, 1, 1, 1,
2.084358, -0.6346104, 0.9654457, 1, 1, 1, 1, 1,
2.10372, 1.341442, 1.125008, 1, 1, 1, 1, 1,
2.108974, 0.2855499, 0.975238, 1, 1, 1, 1, 1,
2.109833, -1.877255, 3.39723, 1, 1, 1, 1, 1,
2.149887, -2.173182, 1.745542, 1, 1, 1, 1, 1,
2.175774, 0.6063008, 0.2415442, 1, 1, 1, 1, 1,
2.177359, -0.7824798, 2.476183, 0, 0, 1, 1, 1,
2.177976, 0.1602151, 2.367482, 1, 0, 0, 1, 1,
2.184427, -0.8306693, 2.17892, 1, 0, 0, 1, 1,
2.204839, 1.977506, 0.6615874, 1, 0, 0, 1, 1,
2.250242, 1.827881, -0.2237597, 1, 0, 0, 1, 1,
2.250483, -0.3725465, 2.798403, 1, 0, 0, 1, 1,
2.271983, -1.018273, 3.70835, 0, 0, 0, 1, 1,
2.304958, -1.201679, 1.65207, 0, 0, 0, 1, 1,
2.308418, -2.331918, 0.9792546, 0, 0, 0, 1, 1,
2.323094, -1.046595, 2.787525, 0, 0, 0, 1, 1,
2.355531, 1.019052, 1.630125, 0, 0, 0, 1, 1,
2.386517, -1.540858, 3.040721, 0, 0, 0, 1, 1,
2.443008, -0.8461971, 1.002685, 0, 0, 0, 1, 1,
2.63245, -1.153469, 2.473931, 1, 1, 1, 1, 1,
2.687721, 0.562431, 0.9284333, 1, 1, 1, 1, 1,
2.889246, -1.289755, 1.364379, 1, 1, 1, 1, 1,
2.914559, 1.447248, 1.647116, 1, 1, 1, 1, 1,
3.020175, -1.502068, 1.291039, 1, 1, 1, 1, 1,
3.232543, -1.611796, 2.459747, 1, 1, 1, 1, 1,
3.569789, -0.7959383, -0.2157767, 1, 1, 1, 1, 1
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
var radius = 9.341357;
var distance = 32.81112;
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
mvMatrix.translate( -0.231523, -0.1898773, 0.2245741 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.81112);
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
