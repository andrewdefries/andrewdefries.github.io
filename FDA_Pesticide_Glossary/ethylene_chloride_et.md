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
-3.507762, 0.5599211, -0.6655221, 1, 0, 0, 1,
-2.955197, 0.03097613, -1.419212, 1, 0.007843138, 0, 1,
-2.65408, -0.7712156, -1.419164, 1, 0.01176471, 0, 1,
-2.530121, 0.3763115, -1.174802, 1, 0.01960784, 0, 1,
-2.473506, -0.8347036, -3.201466, 1, 0.02352941, 0, 1,
-2.438704, 0.9074326, -3.098132, 1, 0.03137255, 0, 1,
-2.324254, 0.7836246, 0.05011778, 1, 0.03529412, 0, 1,
-2.317558, -0.5112636, -0.2137817, 1, 0.04313726, 0, 1,
-2.22804, 2.541834, -1.594517, 1, 0.04705882, 0, 1,
-2.185367, 0.8342013, -1.861155, 1, 0.05490196, 0, 1,
-2.149532, -0.1792845, -2.027151, 1, 0.05882353, 0, 1,
-2.082868, 0.5997163, -2.643802, 1, 0.06666667, 0, 1,
-2.066344, -2.276011, -1.649044, 1, 0.07058824, 0, 1,
-2.012998, 1.142736, -0.381543, 1, 0.07843138, 0, 1,
-2.011856, 0.8629623, -2.342432, 1, 0.08235294, 0, 1,
-2.002003, 2.472208, 0.676342, 1, 0.09019608, 0, 1,
-1.994172, 0.498313, -1.202987, 1, 0.09411765, 0, 1,
-1.943888, -1.689844, -1.122999, 1, 0.1019608, 0, 1,
-1.941186, 0.5043356, -1.396531, 1, 0.1098039, 0, 1,
-1.925746, 0.9116965, 0.2613879, 1, 0.1137255, 0, 1,
-1.903839, -0.9058795, -1.491238, 1, 0.1215686, 0, 1,
-1.858885, -0.3339255, -2.902838, 1, 0.1254902, 0, 1,
-1.850623, -1.603162, -2.568681, 1, 0.1333333, 0, 1,
-1.826827, -1.244574, -2.348704, 1, 0.1372549, 0, 1,
-1.813871, -0.5380111, -1.875057, 1, 0.145098, 0, 1,
-1.784806, -0.441156, -1.726323, 1, 0.1490196, 0, 1,
-1.77154, -0.05261873, 0.4574605, 1, 0.1568628, 0, 1,
-1.742667, 0.1547666, -0.7302101, 1, 0.1607843, 0, 1,
-1.74041, 1.569348, -2.053309, 1, 0.1686275, 0, 1,
-1.722554, -0.2083592, -1.25035, 1, 0.172549, 0, 1,
-1.714806, 0.6163824, -0.5750377, 1, 0.1803922, 0, 1,
-1.713291, -0.8813875, -1.149168, 1, 0.1843137, 0, 1,
-1.698822, 1.301131, -1.451767, 1, 0.1921569, 0, 1,
-1.692594, -0.3730924, -2.306318, 1, 0.1960784, 0, 1,
-1.685361, -0.942278, -1.727312, 1, 0.2039216, 0, 1,
-1.653257, -0.5069216, -2.706954, 1, 0.2117647, 0, 1,
-1.643916, 0.05022588, -2.571012, 1, 0.2156863, 0, 1,
-1.630334, -0.4393664, -4.856782, 1, 0.2235294, 0, 1,
-1.628458, -0.1574528, -1.190053, 1, 0.227451, 0, 1,
-1.612748, 0.3012491, -2.394212, 1, 0.2352941, 0, 1,
-1.60365, 0.6252651, 0.4962974, 1, 0.2392157, 0, 1,
-1.584988, 0.8391546, 0.04813209, 1, 0.2470588, 0, 1,
-1.57608, -1.277893, -2.125296, 1, 0.2509804, 0, 1,
-1.572833, 0.1543709, -0.2271365, 1, 0.2588235, 0, 1,
-1.569323, 0.3850199, -1.855243, 1, 0.2627451, 0, 1,
-1.56199, -1.047526, -0.5436987, 1, 0.2705882, 0, 1,
-1.507498, -0.1723914, -0.9199405, 1, 0.2745098, 0, 1,
-1.505918, -1.338566, -1.165012, 1, 0.282353, 0, 1,
-1.498588, 0.8191403, -1.220035, 1, 0.2862745, 0, 1,
-1.498467, -0.09422096, -0.9831945, 1, 0.2941177, 0, 1,
-1.487357, -0.3664782, -2.129326, 1, 0.3019608, 0, 1,
-1.454065, 0.9445851, -1.58078, 1, 0.3058824, 0, 1,
-1.449589, -0.3714133, -3.236786, 1, 0.3137255, 0, 1,
-1.436399, 0.9685225, -1.280856, 1, 0.3176471, 0, 1,
-1.436144, -0.2307665, -2.009531, 1, 0.3254902, 0, 1,
-1.428622, 2.136588, -1.086515, 1, 0.3294118, 0, 1,
-1.419037, 1.773956, -1.030903, 1, 0.3372549, 0, 1,
-1.415777, -0.5546679, -2.507754, 1, 0.3411765, 0, 1,
-1.405889, 0.5863811, 0.2235592, 1, 0.3490196, 0, 1,
-1.403363, 0.2402711, -2.220912, 1, 0.3529412, 0, 1,
-1.39504, -1.46637, -2.617666, 1, 0.3607843, 0, 1,
-1.391155, -3.017286, -3.493651, 1, 0.3647059, 0, 1,
-1.388103, -0.1549793, -1.89144, 1, 0.372549, 0, 1,
-1.384936, 0.00560516, -1.073519, 1, 0.3764706, 0, 1,
-1.372234, 0.05224074, -0.1820924, 1, 0.3843137, 0, 1,
-1.369635, 0.2948855, -1.726005, 1, 0.3882353, 0, 1,
-1.354095, 1.451064, 0.062267, 1, 0.3960784, 0, 1,
-1.348048, -1.51096, -1.816459, 1, 0.4039216, 0, 1,
-1.344999, 0.2112082, -1.33889, 1, 0.4078431, 0, 1,
-1.33567, -0.260225, -2.708629, 1, 0.4156863, 0, 1,
-1.329211, 0.5327541, -0.6898999, 1, 0.4196078, 0, 1,
-1.324617, 0.02294817, -1.762471, 1, 0.427451, 0, 1,
-1.316699, 0.3929534, -1.654262, 1, 0.4313726, 0, 1,
-1.307409, 1.062593, -0.9679158, 1, 0.4392157, 0, 1,
-1.304347, -0.9631014, -1.848408, 1, 0.4431373, 0, 1,
-1.30107, 0.3732976, -0.9722838, 1, 0.4509804, 0, 1,
-1.28871, -0.7481574, -2.792531, 1, 0.454902, 0, 1,
-1.283552, 1.892217, -1.810078, 1, 0.4627451, 0, 1,
-1.26834, 0.287184, 0.1565147, 1, 0.4666667, 0, 1,
-1.261519, -1.413897, -2.200157, 1, 0.4745098, 0, 1,
-1.260542, 2.632623, -2.320805, 1, 0.4784314, 0, 1,
-1.255122, -0.7321775, -2.054538, 1, 0.4862745, 0, 1,
-1.254772, -0.4446765, -2.243414, 1, 0.4901961, 0, 1,
-1.244287, 0.8626124, -0.1654349, 1, 0.4980392, 0, 1,
-1.239498, 0.4178986, -1.621425, 1, 0.5058824, 0, 1,
-1.237502, 1.171696, -0.400834, 1, 0.509804, 0, 1,
-1.221144, -1.055735, -2.897986, 1, 0.5176471, 0, 1,
-1.218565, 0.7885797, 0.6517751, 1, 0.5215687, 0, 1,
-1.217426, -0.3652504, -1.389742, 1, 0.5294118, 0, 1,
-1.206034, -0.728722, -2.703167, 1, 0.5333334, 0, 1,
-1.204735, 0.7115705, -1.888273, 1, 0.5411765, 0, 1,
-1.204376, 1.464322, 1.25289, 1, 0.5450981, 0, 1,
-1.204117, -0.7971326, -2.642733, 1, 0.5529412, 0, 1,
-1.195244, 1.114475, 2.023628, 1, 0.5568628, 0, 1,
-1.189883, -1.79791, -2.440349, 1, 0.5647059, 0, 1,
-1.182651, 1.10878, -0.188447, 1, 0.5686275, 0, 1,
-1.177944, -1.023262, -3.229884, 1, 0.5764706, 0, 1,
-1.160831, -1.132956, -1.712565, 1, 0.5803922, 0, 1,
-1.156664, 2.551625, 1.409487, 1, 0.5882353, 0, 1,
-1.149823, 1.259773, -0.16248, 1, 0.5921569, 0, 1,
-1.143873, 0.2380758, -2.262372, 1, 0.6, 0, 1,
-1.141568, -1.587994, -2.069861, 1, 0.6078432, 0, 1,
-1.136094, -1.357283, -1.582022, 1, 0.6117647, 0, 1,
-1.133918, 0.5930333, -2.39119, 1, 0.6196079, 0, 1,
-1.12955, 0.5453489, -0.5251841, 1, 0.6235294, 0, 1,
-1.127446, 0.5904207, -1.477291, 1, 0.6313726, 0, 1,
-1.122993, -0.1712161, -3.089471, 1, 0.6352941, 0, 1,
-1.120577, 0.7441053, 0.8603637, 1, 0.6431373, 0, 1,
-1.118604, 0.445666, -2.136734, 1, 0.6470588, 0, 1,
-1.11421, -0.5295523, -1.618595, 1, 0.654902, 0, 1,
-1.114151, -1.248698, -3.680155, 1, 0.6588235, 0, 1,
-1.106128, -1.009942, -1.663494, 1, 0.6666667, 0, 1,
-1.104398, -0.8772745, -2.528767, 1, 0.6705883, 0, 1,
-1.102885, -0.9803161, -0.8584587, 1, 0.6784314, 0, 1,
-1.096722, -0.6850668, -2.468711, 1, 0.682353, 0, 1,
-1.094751, -0.7774326, -2.965833, 1, 0.6901961, 0, 1,
-1.09457, -1.313622, -1.410572, 1, 0.6941177, 0, 1,
-1.084636, 0.4731281, -1.366015, 1, 0.7019608, 0, 1,
-1.084157, -1.08151, -2.220237, 1, 0.7098039, 0, 1,
-1.081273, -0.4660401, -0.08361421, 1, 0.7137255, 0, 1,
-1.077557, -1.345796, -3.570179, 1, 0.7215686, 0, 1,
-1.071156, -1.059525, -3.224744, 1, 0.7254902, 0, 1,
-1.069515, -1.223862, -3.106675, 1, 0.7333333, 0, 1,
-1.064696, -0.2937229, -2.99539, 1, 0.7372549, 0, 1,
-1.063696, -1.55663, -2.175205, 1, 0.7450981, 0, 1,
-1.056882, -0.1859237, -1.153848, 1, 0.7490196, 0, 1,
-1.056373, -0.1738837, -1.207046, 1, 0.7568628, 0, 1,
-1.05346, 0.3039781, -0.1915407, 1, 0.7607843, 0, 1,
-1.05154, 2.019903, -1.32801, 1, 0.7686275, 0, 1,
-1.047894, 0.5985475, -1.367331, 1, 0.772549, 0, 1,
-1.047421, 0.8177241, -0.4584626, 1, 0.7803922, 0, 1,
-1.04523, 0.4120007, -1.235111, 1, 0.7843137, 0, 1,
-1.044031, 1.125877, -0.4030761, 1, 0.7921569, 0, 1,
-1.042888, 0.6371197, -1.928186, 1, 0.7960784, 0, 1,
-1.042592, -1.456213, -3.379859, 1, 0.8039216, 0, 1,
-1.042024, -0.6662176, -3.406205, 1, 0.8117647, 0, 1,
-1.040219, -2.001819, -0.325925, 1, 0.8156863, 0, 1,
-1.035951, 1.122884, -0.2728782, 1, 0.8235294, 0, 1,
-1.034705, -0.3566243, -1.892761, 1, 0.827451, 0, 1,
-1.029436, -0.05435489, -1.936025, 1, 0.8352941, 0, 1,
-1.024178, -0.1260453, -3.369067, 1, 0.8392157, 0, 1,
-1.022586, 0.4989724, -3.134678, 1, 0.8470588, 0, 1,
-1.020026, 0.9457933, -0.8991226, 1, 0.8509804, 0, 1,
-1.019795, 1.579788, -0.9280634, 1, 0.8588235, 0, 1,
-1.016761, 0.04629186, -0.1551564, 1, 0.8627451, 0, 1,
-1.001589, -0.1737175, -2.589874, 1, 0.8705882, 0, 1,
-1.000539, -0.4809803, -0.7853558, 1, 0.8745098, 0, 1,
-0.9982536, -1.092538, -0.8075859, 1, 0.8823529, 0, 1,
-0.9904025, -2.974696, -2.408832, 1, 0.8862745, 0, 1,
-0.9890617, -0.03281093, -2.625201, 1, 0.8941177, 0, 1,
-0.9878423, -0.1565684, -1.421279, 1, 0.8980392, 0, 1,
-0.9877957, -0.308645, -2.002428, 1, 0.9058824, 0, 1,
-0.9877416, 1.924817, 0.1809337, 1, 0.9137255, 0, 1,
-0.9758505, -0.1890605, -1.128996, 1, 0.9176471, 0, 1,
-0.9757039, 1.199674, 1.254168, 1, 0.9254902, 0, 1,
-0.9746494, -0.2299313, -1.993608, 1, 0.9294118, 0, 1,
-0.9734172, 1.429562, -0.7031918, 1, 0.9372549, 0, 1,
-0.9722005, -0.7224011, -2.247451, 1, 0.9411765, 0, 1,
-0.9718549, -0.6309518, -2.108035, 1, 0.9490196, 0, 1,
-0.9689456, -0.6337506, -1.701253, 1, 0.9529412, 0, 1,
-0.9616525, 0.5291442, -0.2828973, 1, 0.9607843, 0, 1,
-0.9573116, -1.809796, -1.984972, 1, 0.9647059, 0, 1,
-0.9547188, 0.3899404, -1.065817, 1, 0.972549, 0, 1,
-0.9481618, -0.335705, -0.4709036, 1, 0.9764706, 0, 1,
-0.9476784, 0.1340872, -0.8114671, 1, 0.9843137, 0, 1,
-0.9430848, 1.208023, -1.73459, 1, 0.9882353, 0, 1,
-0.9356793, -0.4674729, -0.7593627, 1, 0.9960784, 0, 1,
-0.9340979, 0.6251902, -0.420785, 0.9960784, 1, 0, 1,
-0.9302709, -0.04214187, -2.081134, 0.9921569, 1, 0, 1,
-0.9301333, 0.6150479, -0.3460997, 0.9843137, 1, 0, 1,
-0.9279804, 1.765453, 0.3468994, 0.9803922, 1, 0, 1,
-0.9257631, 0.3009054, -0.8083906, 0.972549, 1, 0, 1,
-0.9242013, -1.293481, -2.339391, 0.9686275, 1, 0, 1,
-0.9237668, -0.4817272, -2.31597, 0.9607843, 1, 0, 1,
-0.9168807, 0.05070064, 0.6803521, 0.9568627, 1, 0, 1,
-0.9167001, 0.4553777, -1.897347, 0.9490196, 1, 0, 1,
-0.9166899, -0.2970596, -1.059999, 0.945098, 1, 0, 1,
-0.9110134, 0.2448519, -0.821965, 0.9372549, 1, 0, 1,
-0.9085507, -1.149799, -3.152972, 0.9333333, 1, 0, 1,
-0.8993507, -1.791754, -2.631896, 0.9254902, 1, 0, 1,
-0.894685, 0.5077891, 0.711161, 0.9215686, 1, 0, 1,
-0.8933639, -0.9408634, -2.003343, 0.9137255, 1, 0, 1,
-0.8837885, 0.07807534, -3.040397, 0.9098039, 1, 0, 1,
-0.8831412, -0.9324191, -2.49195, 0.9019608, 1, 0, 1,
-0.8822275, 0.5552212, -1.741281, 0.8941177, 1, 0, 1,
-0.8778035, -0.5324268, -3.680295, 0.8901961, 1, 0, 1,
-0.8724555, 0.6758313, -2.352037, 0.8823529, 1, 0, 1,
-0.8695654, -1.536887, -3.832515, 0.8784314, 1, 0, 1,
-0.8694249, -0.7866625, -1.767327, 0.8705882, 1, 0, 1,
-0.864806, -0.616136, -3.592866, 0.8666667, 1, 0, 1,
-0.8465043, -0.4514905, -2.093114, 0.8588235, 1, 0, 1,
-0.8461673, 0.3190666, -1.468345, 0.854902, 1, 0, 1,
-0.8450205, 0.9479813, -0.7699996, 0.8470588, 1, 0, 1,
-0.8397001, -0.7456056, -3.118134, 0.8431373, 1, 0, 1,
-0.8385704, 1.191198, 0.8000354, 0.8352941, 1, 0, 1,
-0.8362713, -1.005381, -2.426852, 0.8313726, 1, 0, 1,
-0.8253278, -0.1362485, -3.891099, 0.8235294, 1, 0, 1,
-0.823368, 1.023897, -2.807915, 0.8196079, 1, 0, 1,
-0.8233587, 0.172942, -1.34425, 0.8117647, 1, 0, 1,
-0.8185571, 1.955621, -1.222199, 0.8078431, 1, 0, 1,
-0.8162524, -1.377018, -1.740516, 0.8, 1, 0, 1,
-0.8113136, 1.645079, 0.05918929, 0.7921569, 1, 0, 1,
-0.8039675, 1.751934, -0.009636086, 0.7882353, 1, 0, 1,
-0.8013039, 0.02964549, -1.669813, 0.7803922, 1, 0, 1,
-0.7910226, 0.4702005, -2.077647, 0.7764706, 1, 0, 1,
-0.7903194, -1.937132, -3.170632, 0.7686275, 1, 0, 1,
-0.7850409, -0.8284366, -4.092222, 0.7647059, 1, 0, 1,
-0.7836597, -0.4206792, -2.158753, 0.7568628, 1, 0, 1,
-0.7788842, -1.083787, -3.013887, 0.7529412, 1, 0, 1,
-0.7736567, -0.8185862, -2.571125, 0.7450981, 1, 0, 1,
-0.7704867, -0.5183694, -1.158489, 0.7411765, 1, 0, 1,
-0.7668661, 0.4138229, -1.400501, 0.7333333, 1, 0, 1,
-0.7616596, -2.028441, -3.201163, 0.7294118, 1, 0, 1,
-0.7466596, -0.981154, -2.247942, 0.7215686, 1, 0, 1,
-0.7394196, 1.273586, -0.3191973, 0.7176471, 1, 0, 1,
-0.7342676, -3.018393, -0.9627692, 0.7098039, 1, 0, 1,
-0.7341144, 0.1322459, -0.4622427, 0.7058824, 1, 0, 1,
-0.7295577, 0.4860634, -1.688346, 0.6980392, 1, 0, 1,
-0.7289911, 0.5936512, -0.6286185, 0.6901961, 1, 0, 1,
-0.7238875, 0.1867128, -0.4379863, 0.6862745, 1, 0, 1,
-0.723882, -0.02866241, -2.611593, 0.6784314, 1, 0, 1,
-0.7235371, 0.425337, -1.320827, 0.6745098, 1, 0, 1,
-0.7163525, 0.9251656, -0.06468365, 0.6666667, 1, 0, 1,
-0.7113223, -0.265817, -1.302455, 0.6627451, 1, 0, 1,
-0.7111716, 0.2476873, -1.723009, 0.654902, 1, 0, 1,
-0.7092155, -0.4408901, -1.695585, 0.6509804, 1, 0, 1,
-0.7088531, 0.5700265, -2.112257, 0.6431373, 1, 0, 1,
-0.7083139, 0.4386114, -2.33743, 0.6392157, 1, 0, 1,
-0.6985487, 0.9303709, 0.5947257, 0.6313726, 1, 0, 1,
-0.6872919, 0.1904219, -0.5733123, 0.627451, 1, 0, 1,
-0.6784742, 0.8222955, -0.596669, 0.6196079, 1, 0, 1,
-0.6768203, -1.363867, -3.637528, 0.6156863, 1, 0, 1,
-0.6726957, -0.7675495, -3.671668, 0.6078432, 1, 0, 1,
-0.6712104, 1.214933, -0.04783298, 0.6039216, 1, 0, 1,
-0.6692454, -0.8807986, -3.318415, 0.5960785, 1, 0, 1,
-0.6576135, 1.633357, -0.7185871, 0.5882353, 1, 0, 1,
-0.6544096, 1.680139, 0.1597835, 0.5843138, 1, 0, 1,
-0.6507541, -0.3820501, -1.883112, 0.5764706, 1, 0, 1,
-0.6493503, 0.645209, -1.657874, 0.572549, 1, 0, 1,
-0.6473479, -0.1080667, -2.145477, 0.5647059, 1, 0, 1,
-0.6472582, -0.5948718, -2.215015, 0.5607843, 1, 0, 1,
-0.6427142, -3.162186, -3.214281, 0.5529412, 1, 0, 1,
-0.6399785, 0.6089067, -2.158991, 0.5490196, 1, 0, 1,
-0.6347716, 0.6916541, -1.75774, 0.5411765, 1, 0, 1,
-0.6345364, -0.2581138, -1.347327, 0.5372549, 1, 0, 1,
-0.6328266, -0.5590179, -4.119068, 0.5294118, 1, 0, 1,
-0.6287099, -1.735599, -1.947294, 0.5254902, 1, 0, 1,
-0.6284304, 2.127155, 1.204918, 0.5176471, 1, 0, 1,
-0.6271631, 0.3760829, -2.630201, 0.5137255, 1, 0, 1,
-0.6204167, 0.2119025, -1.118548, 0.5058824, 1, 0, 1,
-0.6136831, -0.3174523, -0.4371583, 0.5019608, 1, 0, 1,
-0.6136237, 0.1406537, -0.8466396, 0.4941176, 1, 0, 1,
-0.6135172, -1.087471, -3.506996, 0.4862745, 1, 0, 1,
-0.6110386, 2.823548, 0.7809551, 0.4823529, 1, 0, 1,
-0.6076261, -0.04100614, -2.124644, 0.4745098, 1, 0, 1,
-0.6050494, 0.8992215, -2.245093, 0.4705882, 1, 0, 1,
-0.5982955, 1.094358, -0.5673851, 0.4627451, 1, 0, 1,
-0.5940503, 1.413965, -1.463261, 0.4588235, 1, 0, 1,
-0.5934767, 1.031235, -2.013773, 0.4509804, 1, 0, 1,
-0.5904123, 0.02451918, -1.582405, 0.4470588, 1, 0, 1,
-0.5828936, 0.3250631, -2.620336, 0.4392157, 1, 0, 1,
-0.5804872, 1.095431, -3.29156, 0.4352941, 1, 0, 1,
-0.5770261, 0.4939523, 1.048498, 0.427451, 1, 0, 1,
-0.5749584, -0.1974458, -1.907703, 0.4235294, 1, 0, 1,
-0.5728559, -0.687252, -2.142975, 0.4156863, 1, 0, 1,
-0.5722433, -0.8826349, -2.830657, 0.4117647, 1, 0, 1,
-0.5713735, -0.06880232, -3.13513, 0.4039216, 1, 0, 1,
-0.564844, -1.03633, -4.551655, 0.3960784, 1, 0, 1,
-0.5639638, -0.619825, -3.390483, 0.3921569, 1, 0, 1,
-0.5626433, -0.8887674, -5.163007, 0.3843137, 1, 0, 1,
-0.5596858, 0.6449152, -0.6505098, 0.3803922, 1, 0, 1,
-0.5580881, -0.1245463, -1.959548, 0.372549, 1, 0, 1,
-0.5547614, 1.594238, -0.7101703, 0.3686275, 1, 0, 1,
-0.5544965, 1.270516, -0.8245586, 0.3607843, 1, 0, 1,
-0.5544804, -0.1111509, -1.299514, 0.3568628, 1, 0, 1,
-0.554188, 0.8946118, 0.1798349, 0.3490196, 1, 0, 1,
-0.5526016, -0.6280227, -1.867834, 0.345098, 1, 0, 1,
-0.5435024, 1.608562, 0.3040387, 0.3372549, 1, 0, 1,
-0.53794, 0.1991669, -1.733546, 0.3333333, 1, 0, 1,
-0.5364224, 0.6425269, -1.510883, 0.3254902, 1, 0, 1,
-0.5343547, 0.2970778, -0.6084891, 0.3215686, 1, 0, 1,
-0.5329553, 0.5746917, 0.06940047, 0.3137255, 1, 0, 1,
-0.5266302, -0.6424742, -2.445847, 0.3098039, 1, 0, 1,
-0.5226035, 0.9045687, -0.2591388, 0.3019608, 1, 0, 1,
-0.5226035, -0.4651377, -2.888347, 0.2941177, 1, 0, 1,
-0.5211818, 0.401899, -2.667524, 0.2901961, 1, 0, 1,
-0.5194219, -2.03135, -2.276721, 0.282353, 1, 0, 1,
-0.5163417, 0.1921496, -1.983491, 0.2784314, 1, 0, 1,
-0.5162684, 1.042235, -1.014712, 0.2705882, 1, 0, 1,
-0.5146375, 0.8030676, -0.3101894, 0.2666667, 1, 0, 1,
-0.5120327, 1.64979, 0.0405375, 0.2588235, 1, 0, 1,
-0.5114197, 0.2464307, -0.585143, 0.254902, 1, 0, 1,
-0.5113441, -1.660416, -3.679845, 0.2470588, 1, 0, 1,
-0.5029994, 0.8568341, -1.731593, 0.2431373, 1, 0, 1,
-0.4968342, -0.5449896, -2.124007, 0.2352941, 1, 0, 1,
-0.4958782, -0.7409354, -2.087005, 0.2313726, 1, 0, 1,
-0.4917409, 0.1066797, -1.039446, 0.2235294, 1, 0, 1,
-0.4851827, -0.8558653, -1.5973, 0.2196078, 1, 0, 1,
-0.4848474, -1.201685, -2.731844, 0.2117647, 1, 0, 1,
-0.4840946, 0.1784456, 0.8622084, 0.2078431, 1, 0, 1,
-0.4820868, -0.2988836, -3.934964, 0.2, 1, 0, 1,
-0.4778886, -1.582324, -2.379858, 0.1921569, 1, 0, 1,
-0.4725451, 0.6852323, -0.7512841, 0.1882353, 1, 0, 1,
-0.4680462, 0.284842, -2.010222, 0.1803922, 1, 0, 1,
-0.4669333, 0.4054128, -3.48159, 0.1764706, 1, 0, 1,
-0.4659714, 1.442814, -1.035661, 0.1686275, 1, 0, 1,
-0.4655682, -0.4647367, -1.742097, 0.1647059, 1, 0, 1,
-0.4629065, 0.01248928, -0.6228148, 0.1568628, 1, 0, 1,
-0.4603025, -2.216037, -2.754058, 0.1529412, 1, 0, 1,
-0.4594452, 1.401719, -0.00319185, 0.145098, 1, 0, 1,
-0.4580975, 0.9530709, -1.711511, 0.1411765, 1, 0, 1,
-0.4554836, 0.1744252, -2.502148, 0.1333333, 1, 0, 1,
-0.4513475, 0.2275091, 0.3725499, 0.1294118, 1, 0, 1,
-0.4453741, -1.000257, -0.6015111, 0.1215686, 1, 0, 1,
-0.4442258, -0.05237611, -2.35333, 0.1176471, 1, 0, 1,
-0.4412821, -1.980816, -3.589713, 0.1098039, 1, 0, 1,
-0.4312864, -1.099084, -1.330273, 0.1058824, 1, 0, 1,
-0.4304963, 0.7442735, 0.6273896, 0.09803922, 1, 0, 1,
-0.4285759, -1.031653, -3.532849, 0.09019608, 1, 0, 1,
-0.4277294, 1.706592, 1.078161, 0.08627451, 1, 0, 1,
-0.4269211, 0.6028357, -1.741571, 0.07843138, 1, 0, 1,
-0.4263271, -0.1095987, -0.829038, 0.07450981, 1, 0, 1,
-0.4248296, -0.7956885, -2.717324, 0.06666667, 1, 0, 1,
-0.4242993, -0.6842358, -2.299654, 0.0627451, 1, 0, 1,
-0.4209559, -1.180538, -3.543927, 0.05490196, 1, 0, 1,
-0.4145904, -1.538266, -3.467848, 0.05098039, 1, 0, 1,
-0.4143673, 0.2905436, -0.6045098, 0.04313726, 1, 0, 1,
-0.4139256, -0.2514794, -3.679304, 0.03921569, 1, 0, 1,
-0.4117599, -0.9567083, -2.808698, 0.03137255, 1, 0, 1,
-0.4113948, 0.6856002, -0.2650668, 0.02745098, 1, 0, 1,
-0.4090793, 0.3673365, 0.038731, 0.01960784, 1, 0, 1,
-0.4086232, 0.1451874, -2.221335, 0.01568628, 1, 0, 1,
-0.4076863, -0.1499842, -1.907395, 0.007843138, 1, 0, 1,
-0.4062687, -0.4155985, -4.066043, 0.003921569, 1, 0, 1,
-0.4053343, -0.6187844, -3.793875, 0, 1, 0.003921569, 1,
-0.4030258, -0.8823285, -1.691669, 0, 1, 0.01176471, 1,
-0.3988135, 0.5492203, 0.1272931, 0, 1, 0.01568628, 1,
-0.3951903, -1.304059, -4.049054, 0, 1, 0.02352941, 1,
-0.3905561, 0.7447163, -1.253773, 0, 1, 0.02745098, 1,
-0.388227, 1.137605, 0.2551674, 0, 1, 0.03529412, 1,
-0.3872042, 1.196827, -0.8968102, 0, 1, 0.03921569, 1,
-0.386364, 0.7424597, -1.353809, 0, 1, 0.04705882, 1,
-0.386069, -3.015445, -2.032783, 0, 1, 0.05098039, 1,
-0.3858839, 0.08843304, -1.779008, 0, 1, 0.05882353, 1,
-0.385104, -0.9319903, -2.192475, 0, 1, 0.0627451, 1,
-0.3762883, 0.3008226, 0.6838699, 0, 1, 0.07058824, 1,
-0.3735973, -0.9763749, -2.366678, 0, 1, 0.07450981, 1,
-0.3730044, -0.8647451, -1.150446, 0, 1, 0.08235294, 1,
-0.3702289, 0.3625208, -1.184276, 0, 1, 0.08627451, 1,
-0.3692402, 1.224621, -1.629361, 0, 1, 0.09411765, 1,
-0.3679819, 0.5960703, 0.4584301, 0, 1, 0.1019608, 1,
-0.3669136, -0.1637608, -2.108878, 0, 1, 0.1058824, 1,
-0.3662135, -1.821364, -2.263278, 0, 1, 0.1137255, 1,
-0.3641929, -0.07639174, -0.09329591, 0, 1, 0.1176471, 1,
-0.3606488, 0.6307195, -1.09529, 0, 1, 0.1254902, 1,
-0.3588271, -1.047901, -3.442622, 0, 1, 0.1294118, 1,
-0.3571569, -0.1967772, -4.099629, 0, 1, 0.1372549, 1,
-0.3491773, -0.3645952, -2.037856, 0, 1, 0.1411765, 1,
-0.3464559, -1.048141, -3.116537, 0, 1, 0.1490196, 1,
-0.3397244, -0.4978293, -3.433279, 0, 1, 0.1529412, 1,
-0.3392378, -1.526946, -4.995546, 0, 1, 0.1607843, 1,
-0.3365619, 1.342797, 0.3496847, 0, 1, 0.1647059, 1,
-0.3350244, 0.7815811, 1.39415, 0, 1, 0.172549, 1,
-0.3348096, -0.8242058, -2.497833, 0, 1, 0.1764706, 1,
-0.3292235, 0.2018394, -0.2365354, 0, 1, 0.1843137, 1,
-0.3207739, 0.8285949, -1.347847, 0, 1, 0.1882353, 1,
-0.3183759, -0.4266496, -1.340494, 0, 1, 0.1960784, 1,
-0.317016, -1.63117, -2.333819, 0, 1, 0.2039216, 1,
-0.3094999, 1.786417, 0.1447159, 0, 1, 0.2078431, 1,
-0.3093706, 1.933547, -1.203581, 0, 1, 0.2156863, 1,
-0.3063398, 0.8421367, -0.5278645, 0, 1, 0.2196078, 1,
-0.3055094, -1.25682, -0.5119056, 0, 1, 0.227451, 1,
-0.2997002, -0.3734154, -3.391058, 0, 1, 0.2313726, 1,
-0.2953982, -1.298681, -1.330341, 0, 1, 0.2392157, 1,
-0.2952155, -0.0245264, -0.1738329, 0, 1, 0.2431373, 1,
-0.2869805, -0.5800868, -0.9900998, 0, 1, 0.2509804, 1,
-0.2841124, 0.8455826, -1.452207, 0, 1, 0.254902, 1,
-0.2813719, -0.5079896, -2.397435, 0, 1, 0.2627451, 1,
-0.2802009, -0.09095184, -1.758067, 0, 1, 0.2666667, 1,
-0.2793424, 1.17653, -0.04107096, 0, 1, 0.2745098, 1,
-0.2769448, 0.8421661, -1.117357, 0, 1, 0.2784314, 1,
-0.2762355, 0.3898103, -0.495744, 0, 1, 0.2862745, 1,
-0.2746486, 0.2045144, 1.206654, 0, 1, 0.2901961, 1,
-0.2717406, -0.07191537, -3.431556, 0, 1, 0.2980392, 1,
-0.2711625, -0.8156356, -3.342556, 0, 1, 0.3058824, 1,
-0.2706552, -0.9932072, -1.538858, 0, 1, 0.3098039, 1,
-0.2666227, -1.574951, -1.670714, 0, 1, 0.3176471, 1,
-0.2659824, -0.1022721, -1.693956, 0, 1, 0.3215686, 1,
-0.2648022, -0.6516627, -2.80001, 0, 1, 0.3294118, 1,
-0.2647497, -1.445033, -5.153171, 0, 1, 0.3333333, 1,
-0.2630962, -0.1854419, -2.353462, 0, 1, 0.3411765, 1,
-0.2613115, 0.3567808, -1.424855, 0, 1, 0.345098, 1,
-0.2587765, -1.943835, -2.795676, 0, 1, 0.3529412, 1,
-0.2563144, 0.3918981, -2.374506, 0, 1, 0.3568628, 1,
-0.2529308, -0.5518665, -4.041629, 0, 1, 0.3647059, 1,
-0.2529127, 0.9096547, 1.157899, 0, 1, 0.3686275, 1,
-0.250688, -1.44088, -2.125467, 0, 1, 0.3764706, 1,
-0.2502452, 1.014409, -0.5966822, 0, 1, 0.3803922, 1,
-0.2421317, 1.091475, 0.5414441, 0, 1, 0.3882353, 1,
-0.2391711, 0.5302083, 0.003745231, 0, 1, 0.3921569, 1,
-0.2366637, -1.431244, -1.386647, 0, 1, 0.4, 1,
-0.2323199, 2.180636, -0.3001685, 0, 1, 0.4078431, 1,
-0.2302764, 0.8294095, -2.580739, 0, 1, 0.4117647, 1,
-0.2275889, 0.1572665, -1.706388, 0, 1, 0.4196078, 1,
-0.2268076, -0.335375, -1.58531, 0, 1, 0.4235294, 1,
-0.2258093, 0.2873807, -0.6373487, 0, 1, 0.4313726, 1,
-0.2220524, 0.4211726, 0.1555331, 0, 1, 0.4352941, 1,
-0.2165929, -1.098466, -4.035464, 0, 1, 0.4431373, 1,
-0.2154929, 0.4442469, -0.8958111, 0, 1, 0.4470588, 1,
-0.209602, 0.2224749, -0.4008996, 0, 1, 0.454902, 1,
-0.2039735, -0.8706445, -4.751832, 0, 1, 0.4588235, 1,
-0.198632, -1.510389, -2.82877, 0, 1, 0.4666667, 1,
-0.1973469, 1.250676, 0.2936475, 0, 1, 0.4705882, 1,
-0.1966768, -0.5982879, -1.103247, 0, 1, 0.4784314, 1,
-0.1966286, -0.6811134, -3.344245, 0, 1, 0.4823529, 1,
-0.1950184, 0.4700449, -0.2854179, 0, 1, 0.4901961, 1,
-0.1947832, -0.3865051, -1.108732, 0, 1, 0.4941176, 1,
-0.1946798, -0.0817197, 0.1201172, 0, 1, 0.5019608, 1,
-0.1938477, -0.5155549, -1.061676, 0, 1, 0.509804, 1,
-0.1917773, 3.481498, 1.212875, 0, 1, 0.5137255, 1,
-0.1891277, -1.784319, -4.36655, 0, 1, 0.5215687, 1,
-0.1890369, 0.7453254, -0.1727549, 0, 1, 0.5254902, 1,
-0.1871575, 2.132255, -0.9990064, 0, 1, 0.5333334, 1,
-0.184237, -0.8006925, -2.898701, 0, 1, 0.5372549, 1,
-0.1813072, -0.9884195, -2.337039, 0, 1, 0.5450981, 1,
-0.181164, 2.100682, -1.968598, 0, 1, 0.5490196, 1,
-0.1796146, 0.9307317, -0.4136931, 0, 1, 0.5568628, 1,
-0.1764414, 0.406935, -1.122943, 0, 1, 0.5607843, 1,
-0.1752127, 0.01864818, -0.2834525, 0, 1, 0.5686275, 1,
-0.1738056, 0.5154384, 1.084635, 0, 1, 0.572549, 1,
-0.1710241, 0.08611303, -0.4866271, 0, 1, 0.5803922, 1,
-0.169729, 0.4781993, -1.755143, 0, 1, 0.5843138, 1,
-0.1654689, 0.5921302, 0.01724309, 0, 1, 0.5921569, 1,
-0.1650907, -1.299798, -3.141388, 0, 1, 0.5960785, 1,
-0.1643043, -0.06413335, -2.756253, 0, 1, 0.6039216, 1,
-0.1608682, -0.08997516, -3.622939, 0, 1, 0.6117647, 1,
-0.1564666, 1.31661, -0.8409171, 0, 1, 0.6156863, 1,
-0.1506894, -0.299234, -2.158337, 0, 1, 0.6235294, 1,
-0.1485777, 0.5975453, -0.4129343, 0, 1, 0.627451, 1,
-0.1467647, 0.2074452, -0.202996, 0, 1, 0.6352941, 1,
-0.1464512, -0.6833988, -3.129189, 0, 1, 0.6392157, 1,
-0.1397986, 0.2437982, 0.9128982, 0, 1, 0.6470588, 1,
-0.1385689, 1.185913, -1.909533, 0, 1, 0.6509804, 1,
-0.1347799, 0.1387587, -1.042759, 0, 1, 0.6588235, 1,
-0.1299975, 0.4761397, -0.8175594, 0, 1, 0.6627451, 1,
-0.1299395, -0.6126601, -4.533546, 0, 1, 0.6705883, 1,
-0.128557, 2.186694, -1.064168, 0, 1, 0.6745098, 1,
-0.1228009, 1.199244, 0.4709454, 0, 1, 0.682353, 1,
-0.1196301, 0.009490372, -1.612361, 0, 1, 0.6862745, 1,
-0.1184401, 1.306103, 0.4815514, 0, 1, 0.6941177, 1,
-0.1174434, -1.003858, -3.520937, 0, 1, 0.7019608, 1,
-0.1104258, 0.02738784, -2.14703, 0, 1, 0.7058824, 1,
-0.1087512, 0.3347891, 0.1015719, 0, 1, 0.7137255, 1,
-0.1086948, -0.3925643, -2.113469, 0, 1, 0.7176471, 1,
-0.1083944, -0.8272811, -2.813516, 0, 1, 0.7254902, 1,
-0.1066532, 0.6882968, 0.3850247, 0, 1, 0.7294118, 1,
-0.1060709, -0.1444378, -2.445323, 0, 1, 0.7372549, 1,
-0.1018363, 0.1827008, 0.5407999, 0, 1, 0.7411765, 1,
-0.09976314, -0.02349802, -2.904913, 0, 1, 0.7490196, 1,
-0.09865378, -0.3588699, -2.953812, 0, 1, 0.7529412, 1,
-0.09762715, -0.4336773, -3.617892, 0, 1, 0.7607843, 1,
-0.09655643, 0.8621744, -0.2090105, 0, 1, 0.7647059, 1,
-0.09586274, -0.621527, -4.549755, 0, 1, 0.772549, 1,
-0.09435181, 0.1576491, 1.204125, 0, 1, 0.7764706, 1,
-0.09432708, -0.3795473, -3.597579, 0, 1, 0.7843137, 1,
-0.0903736, -1.499898, -4.056817, 0, 1, 0.7882353, 1,
-0.08968954, -1.196427, -2.626773, 0, 1, 0.7960784, 1,
-0.08915962, -1.455696, -4.75564, 0, 1, 0.8039216, 1,
-0.08854686, -0.6071884, -4.324208, 0, 1, 0.8078431, 1,
-0.08491093, 0.05508484, -1.153015, 0, 1, 0.8156863, 1,
-0.07849318, 1.177688, 0.4710645, 0, 1, 0.8196079, 1,
-0.07691762, 0.5027015, 0.07198402, 0, 1, 0.827451, 1,
-0.07667667, 1.010516, -0.9335118, 0, 1, 0.8313726, 1,
-0.07533427, 0.545083, -1.43442, 0, 1, 0.8392157, 1,
-0.07258268, -1.60432, -3.58918, 0, 1, 0.8431373, 1,
-0.06786407, -2.42476, -2.796865, 0, 1, 0.8509804, 1,
-0.06674203, -0.7709355, -3.023048, 0, 1, 0.854902, 1,
-0.06369624, 1.005954, 1.734722, 0, 1, 0.8627451, 1,
-0.06320649, -1.268545, -1.890632, 0, 1, 0.8666667, 1,
-0.06269828, -0.2321769, -3.755854, 0, 1, 0.8745098, 1,
-0.06050896, 0.1360424, -0.08978544, 0, 1, 0.8784314, 1,
-0.05912717, 0.9886687, -0.834941, 0, 1, 0.8862745, 1,
-0.05900886, -2.14814, -3.175737, 0, 1, 0.8901961, 1,
-0.05802469, -1.088997, -2.636809, 0, 1, 0.8980392, 1,
-0.05270407, 1.273399, -0.4576315, 0, 1, 0.9058824, 1,
-0.05116966, 1.262873, 0.3988658, 0, 1, 0.9098039, 1,
-0.04912705, 1.641396, -1.570314, 0, 1, 0.9176471, 1,
-0.04063698, 0.04441462, -0.8759413, 0, 1, 0.9215686, 1,
-0.0395192, -0.2160305, -4.234136, 0, 1, 0.9294118, 1,
-0.03910338, 0.5854116, -0.3151635, 0, 1, 0.9333333, 1,
-0.03858203, -1.562273, -3.893393, 0, 1, 0.9411765, 1,
-0.03488942, 1.089338, -0.6235591, 0, 1, 0.945098, 1,
-0.03110912, 0.8967497, -0.65913, 0, 1, 0.9529412, 1,
-0.03007519, -2.206734, -4.346449, 0, 1, 0.9568627, 1,
-0.02378006, 0.7130277, -1.061732, 0, 1, 0.9647059, 1,
-0.02348481, 0.08037344, -0.06901687, 0, 1, 0.9686275, 1,
-0.02324801, 0.8895259, 1.577619, 0, 1, 0.9764706, 1,
-0.02284336, 0.6082811, -0.04271797, 0, 1, 0.9803922, 1,
-0.02269764, 1.929278, 0.5395426, 0, 1, 0.9882353, 1,
-0.01609632, -1.232432, -4.047097, 0, 1, 0.9921569, 1,
-0.007844849, -0.7175809, -3.675264, 0, 1, 1, 1,
-0.005995729, 0.1840818, 0.7535753, 0, 0.9921569, 1, 1,
-0.005628983, -0.8519255, -3.361306, 0, 0.9882353, 1, 1,
-0.003821459, 0.3711999, 0.7399079, 0, 0.9803922, 1, 1,
-0.003217138, -1.82495, -3.838573, 0, 0.9764706, 1, 1,
-0.001325595, 0.456052, 0.618048, 0, 0.9686275, 1, 1,
-0.0004720809, -1.807544, -3.113358, 0, 0.9647059, 1, 1,
0.0005695091, -1.388334, 1.754142, 0, 0.9568627, 1, 1,
0.002635066, -0.04682181, 3.706529, 0, 0.9529412, 1, 1,
0.003262115, 1.381874, 0.3577377, 0, 0.945098, 1, 1,
0.009260126, 0.1199104, -1.533079, 0, 0.9411765, 1, 1,
0.0109383, 0.4612758, 2.110536, 0, 0.9333333, 1, 1,
0.01297854, -0.5614334, 3.030404, 0, 0.9294118, 1, 1,
0.01508705, -1.304886, 4.057327, 0, 0.9215686, 1, 1,
0.01720827, -0.3199984, 2.617415, 0, 0.9176471, 1, 1,
0.01988313, -0.6486359, 3.387212, 0, 0.9098039, 1, 1,
0.02240766, -0.3534213, 1.901116, 0, 0.9058824, 1, 1,
0.02434111, 0.7353686, 0.8213431, 0, 0.8980392, 1, 1,
0.02637023, -0.9200624, 2.310751, 0, 0.8901961, 1, 1,
0.0303544, 1.253662, -1.173997, 0, 0.8862745, 1, 1,
0.03039949, -0.5545531, 3.925577, 0, 0.8784314, 1, 1,
0.03071698, -0.1274718, 2.90862, 0, 0.8745098, 1, 1,
0.03234551, -0.626844, 2.09467, 0, 0.8666667, 1, 1,
0.03244049, 0.1524869, -0.01752875, 0, 0.8627451, 1, 1,
0.03631924, -0.1808889, 2.981735, 0, 0.854902, 1, 1,
0.03954186, 0.544355, 0.7960733, 0, 0.8509804, 1, 1,
0.04053874, -0.9488872, 4.161058, 0, 0.8431373, 1, 1,
0.04079442, -1.20337, 2.880708, 0, 0.8392157, 1, 1,
0.04533859, -0.9541101, 4.444819, 0, 0.8313726, 1, 1,
0.0460992, -1.297437, 3.270525, 0, 0.827451, 1, 1,
0.04847685, 0.1987053, 0.7391771, 0, 0.8196079, 1, 1,
0.05181643, -0.4856478, 2.423425, 0, 0.8156863, 1, 1,
0.052837, 1.080172, 0.9789824, 0, 0.8078431, 1, 1,
0.05419273, -0.1953309, 2.779466, 0, 0.8039216, 1, 1,
0.05431355, 1.224287, -1.335349, 0, 0.7960784, 1, 1,
0.05462016, 0.009687285, 0.277957, 0, 0.7882353, 1, 1,
0.05835867, -0.9086397, 3.48872, 0, 0.7843137, 1, 1,
0.05886423, -0.7652615, 3.445472, 0, 0.7764706, 1, 1,
0.06288417, 0.8899384, -0.8639751, 0, 0.772549, 1, 1,
0.07518058, -0.2751218, 3.494683, 0, 0.7647059, 1, 1,
0.07657379, -0.3567255, 2.110068, 0, 0.7607843, 1, 1,
0.07741836, -0.177895, 4.178974, 0, 0.7529412, 1, 1,
0.07794833, -0.8012372, 1.914704, 0, 0.7490196, 1, 1,
0.07880696, -1.058273, 2.448895, 0, 0.7411765, 1, 1,
0.07947256, -2.079042, 3.200037, 0, 0.7372549, 1, 1,
0.08578813, -0.4636985, 2.842524, 0, 0.7294118, 1, 1,
0.0859265, 0.02772095, 0.04785255, 0, 0.7254902, 1, 1,
0.0882197, 1.334487, -1.589514, 0, 0.7176471, 1, 1,
0.08847138, 0.3464749, 0.4751463, 0, 0.7137255, 1, 1,
0.08901605, 2.25098, -0.1943462, 0, 0.7058824, 1, 1,
0.089054, -0.4964425, 1.721878, 0, 0.6980392, 1, 1,
0.09026438, -1.027017, 5.275447, 0, 0.6941177, 1, 1,
0.09183561, 0.6984159, 0.9783068, 0, 0.6862745, 1, 1,
0.0928014, -0.6028234, 2.6853, 0, 0.682353, 1, 1,
0.09454785, 0.8216407, -0.2639333, 0, 0.6745098, 1, 1,
0.09647121, -1.742693, 2.729374, 0, 0.6705883, 1, 1,
0.09799641, 1.250363, -0.2417001, 0, 0.6627451, 1, 1,
0.1027456, 0.7166172, -1.701718, 0, 0.6588235, 1, 1,
0.1029313, -0.554267, 3.881603, 0, 0.6509804, 1, 1,
0.1043952, 1.016138, -0.1363021, 0, 0.6470588, 1, 1,
0.1061212, 0.3056215, -1.051613, 0, 0.6392157, 1, 1,
0.1081428, 1.479729, 0.0444927, 0, 0.6352941, 1, 1,
0.1116365, 0.8967683, -0.4404578, 0, 0.627451, 1, 1,
0.113325, 0.03770629, 0.6573344, 0, 0.6235294, 1, 1,
0.1136148, -2.316746, 2.383052, 0, 0.6156863, 1, 1,
0.1139561, -0.7386175, 3.068949, 0, 0.6117647, 1, 1,
0.1144658, -0.9029511, 2.45588, 0, 0.6039216, 1, 1,
0.121637, -2.267861, 2.413442, 0, 0.5960785, 1, 1,
0.124907, -0.2278847, 1.885771, 0, 0.5921569, 1, 1,
0.1274646, 2.071212, 0.3881133, 0, 0.5843138, 1, 1,
0.1276489, -0.9366134, 2.953229, 0, 0.5803922, 1, 1,
0.1340451, 0.255222, -0.2168574, 0, 0.572549, 1, 1,
0.1411143, -0.8183011, 3.958016, 0, 0.5686275, 1, 1,
0.1469676, -0.02861675, 1.386724, 0, 0.5607843, 1, 1,
0.1473666, -0.2431805, 1.043684, 0, 0.5568628, 1, 1,
0.1612412, 1.104403, -0.4012699, 0, 0.5490196, 1, 1,
0.1741029, -0.2730535, 3.220989, 0, 0.5450981, 1, 1,
0.175808, 0.01499747, 1.051393, 0, 0.5372549, 1, 1,
0.1769621, 0.5289679, -0.2654292, 0, 0.5333334, 1, 1,
0.179282, -0.6965888, 2.193052, 0, 0.5254902, 1, 1,
0.1813202, 0.006717045, 0.9817117, 0, 0.5215687, 1, 1,
0.1853558, 0.06072037, 0.3276152, 0, 0.5137255, 1, 1,
0.1856792, -0.02688794, -0.1712073, 0, 0.509804, 1, 1,
0.1882359, -0.3107364, 3.054314, 0, 0.5019608, 1, 1,
0.188941, -0.3464507, 2.276136, 0, 0.4941176, 1, 1,
0.1897171, -1.49859, 4.005058, 0, 0.4901961, 1, 1,
0.1899067, 0.6869181, 0.6271855, 0, 0.4823529, 1, 1,
0.1909632, -1.709219, 2.594501, 0, 0.4784314, 1, 1,
0.1921908, 0.1373436, -0.4071385, 0, 0.4705882, 1, 1,
0.1937431, 1.213331, -2.550474, 0, 0.4666667, 1, 1,
0.1990846, -1.240103, 0.9534902, 0, 0.4588235, 1, 1,
0.1996073, -0.4878704, 3.676631, 0, 0.454902, 1, 1,
0.2001663, 0.8590358, -0.08495323, 0, 0.4470588, 1, 1,
0.201686, -0.5777516, 4.26076, 0, 0.4431373, 1, 1,
0.2056285, 1.242787, -3.01051, 0, 0.4352941, 1, 1,
0.214513, -0.2661278, 2.18525, 0, 0.4313726, 1, 1,
0.2191833, -0.275729, 4.06576, 0, 0.4235294, 1, 1,
0.2221752, 0.02772654, 3.024449, 0, 0.4196078, 1, 1,
0.2276608, 0.01212006, 2.279076, 0, 0.4117647, 1, 1,
0.2298545, -0.7533666, 3.63779, 0, 0.4078431, 1, 1,
0.2302787, 0.7339657, -2.066822, 0, 0.4, 1, 1,
0.2339115, -0.9235843, 4.152618, 0, 0.3921569, 1, 1,
0.2421394, 0.4445916, 1.27171, 0, 0.3882353, 1, 1,
0.2436132, 0.759954, -0.9108137, 0, 0.3803922, 1, 1,
0.2451583, -0.8784019, 0.8859223, 0, 0.3764706, 1, 1,
0.2471932, 0.2980141, -0.01469412, 0, 0.3686275, 1, 1,
0.2482031, 0.1953726, 1.715632, 0, 0.3647059, 1, 1,
0.2485003, -0.2096822, 3.191698, 0, 0.3568628, 1, 1,
0.2486474, -0.6912187, 2.788818, 0, 0.3529412, 1, 1,
0.2504795, 0.3786032, -0.5390326, 0, 0.345098, 1, 1,
0.2508885, 0.9123327, 0.9969419, 0, 0.3411765, 1, 1,
0.2559439, 0.4998029, 0.8762949, 0, 0.3333333, 1, 1,
0.2617006, 1.607557, 0.06653155, 0, 0.3294118, 1, 1,
0.2644115, -0.11168, 1.628181, 0, 0.3215686, 1, 1,
0.2654463, 0.5039208, 0.307624, 0, 0.3176471, 1, 1,
0.2657467, -0.1796253, 3.100158, 0, 0.3098039, 1, 1,
0.2666397, -0.1995186, 2.43827, 0, 0.3058824, 1, 1,
0.2678792, 0.9630436, 0.4391918, 0, 0.2980392, 1, 1,
0.2742852, -0.3314134, 2.446898, 0, 0.2901961, 1, 1,
0.275626, -1.72394, 3.903028, 0, 0.2862745, 1, 1,
0.2797946, 1.294928, -0.4407011, 0, 0.2784314, 1, 1,
0.2822464, 0.2018266, 2.05711, 0, 0.2745098, 1, 1,
0.2830455, -0.01104113, 3.626896, 0, 0.2666667, 1, 1,
0.2839757, 0.5271911, 1.000173, 0, 0.2627451, 1, 1,
0.2850617, -0.3008131, 3.213715, 0, 0.254902, 1, 1,
0.2856586, -0.5767829, 3.687783, 0, 0.2509804, 1, 1,
0.2879226, -0.04425272, -0.6040488, 0, 0.2431373, 1, 1,
0.2879719, -1.97099, 2.559283, 0, 0.2392157, 1, 1,
0.2923179, 0.0267074, 1.636296, 0, 0.2313726, 1, 1,
0.2936577, 0.2425744, -0.7291859, 0, 0.227451, 1, 1,
0.2938966, -0.749368, 5.20875, 0, 0.2196078, 1, 1,
0.2976525, 1.632698, -0.3409573, 0, 0.2156863, 1, 1,
0.3032459, -0.2560967, 1.911629, 0, 0.2078431, 1, 1,
0.3083906, 1.350675, 0.2044915, 0, 0.2039216, 1, 1,
0.309201, 0.2051109, 1.266828, 0, 0.1960784, 1, 1,
0.3104604, 0.0707924, 0.7093155, 0, 0.1882353, 1, 1,
0.3122044, 1.812678, -0.06873204, 0, 0.1843137, 1, 1,
0.3126979, -0.8754247, 2.210161, 0, 0.1764706, 1, 1,
0.318919, -0.7613124, 2.528459, 0, 0.172549, 1, 1,
0.3247569, 0.7518787, 1.966159, 0, 0.1647059, 1, 1,
0.3255756, -1.272576, 2.302114, 0, 0.1607843, 1, 1,
0.3257039, 0.0924255, 0.7237352, 0, 0.1529412, 1, 1,
0.3264299, 2.496264, 0.1847406, 0, 0.1490196, 1, 1,
0.3275378, 0.1464058, 2.003166, 0, 0.1411765, 1, 1,
0.331636, -0.5778322, 3.566926, 0, 0.1372549, 1, 1,
0.3347609, 0.1998255, 0.8391743, 0, 0.1294118, 1, 1,
0.3358071, -0.5305406, 1.634552, 0, 0.1254902, 1, 1,
0.3387667, -0.3300097, 2.333259, 0, 0.1176471, 1, 1,
0.34714, -0.2132031, 1.145943, 0, 0.1137255, 1, 1,
0.3479333, 0.2008887, 2.050491, 0, 0.1058824, 1, 1,
0.3488103, 0.3003701, 0.1375632, 0, 0.09803922, 1, 1,
0.3510091, -1.094061, 1.789899, 0, 0.09411765, 1, 1,
0.3545964, 1.032009, -0.05245823, 0, 0.08627451, 1, 1,
0.3561133, -0.800934, 1.285625, 0, 0.08235294, 1, 1,
0.3598298, -1.394916, 2.863076, 0, 0.07450981, 1, 1,
0.3608212, 1.640133, 0.2667161, 0, 0.07058824, 1, 1,
0.3634752, 0.05778049, 2.142895, 0, 0.0627451, 1, 1,
0.3695171, 0.8385283, 0.08039258, 0, 0.05882353, 1, 1,
0.3742666, 0.678426, 1.151756, 0, 0.05098039, 1, 1,
0.3774047, -1.169647, 2.461207, 0, 0.04705882, 1, 1,
0.381909, -0.05457684, 0.3227102, 0, 0.03921569, 1, 1,
0.382201, -1.77064, 4.536929, 0, 0.03529412, 1, 1,
0.3838184, 1.024478, 1.242656, 0, 0.02745098, 1, 1,
0.3891914, -0.9606314, 3.624964, 0, 0.02352941, 1, 1,
0.3900242, -1.961063, 2.243845, 0, 0.01568628, 1, 1,
0.3926855, 0.06623716, 1.522893, 0, 0.01176471, 1, 1,
0.3962091, -0.9299118, 4.102211, 0, 0.003921569, 1, 1,
0.3991716, 2.483485, 1.621802, 0.003921569, 0, 1, 1,
0.3997816, 1.03231, 0.9426543, 0.007843138, 0, 1, 1,
0.4060974, -1.486721, 3.769804, 0.01568628, 0, 1, 1,
0.4061672, -1.106861, 2.621675, 0.01960784, 0, 1, 1,
0.4086103, 1.775864, 0.3004453, 0.02745098, 0, 1, 1,
0.4224091, -1.379271, 3.293376, 0.03137255, 0, 1, 1,
0.4230323, 0.6394074, 0.8781708, 0.03921569, 0, 1, 1,
0.4255483, -0.618265, 1.697437, 0.04313726, 0, 1, 1,
0.4270707, -0.01321016, 1.801042, 0.05098039, 0, 1, 1,
0.4279167, -1.357816, 3.327509, 0.05490196, 0, 1, 1,
0.429597, 0.5005141, 0.493626, 0.0627451, 0, 1, 1,
0.4308714, -0.4874208, 1.630084, 0.06666667, 0, 1, 1,
0.4326417, 1.228238, -0.2423498, 0.07450981, 0, 1, 1,
0.4340769, 1.665558, 1.364025, 0.07843138, 0, 1, 1,
0.4352909, -0.5326804, 2.412337, 0.08627451, 0, 1, 1,
0.4368706, 1.233849, 0.8685266, 0.09019608, 0, 1, 1,
0.4381537, -2.263671, 3.718015, 0.09803922, 0, 1, 1,
0.4385746, -1.925663, 3.036793, 0.1058824, 0, 1, 1,
0.4386578, -0.5316406, 3.64708, 0.1098039, 0, 1, 1,
0.4400286, 0.3578543, 1.756015, 0.1176471, 0, 1, 1,
0.4411632, -0.9458084, 0.7139142, 0.1215686, 0, 1, 1,
0.4431411, -0.5356646, 4.453444, 0.1294118, 0, 1, 1,
0.4466376, 2.172285, -1.746432, 0.1333333, 0, 1, 1,
0.4498911, 1.149642, 0.9900097, 0.1411765, 0, 1, 1,
0.4534061, 1.115973, 0.3179393, 0.145098, 0, 1, 1,
0.4537831, 0.07247758, 0.0797511, 0.1529412, 0, 1, 1,
0.453924, -0.40991, 3.089289, 0.1568628, 0, 1, 1,
0.4550622, 0.3506046, 0.0687302, 0.1647059, 0, 1, 1,
0.456234, -1.106272, 2.595044, 0.1686275, 0, 1, 1,
0.4580549, 0.1609818, -0.1628957, 0.1764706, 0, 1, 1,
0.4582908, -0.4318486, 3.107334, 0.1803922, 0, 1, 1,
0.4608722, 0.9315351, 0.1010081, 0.1882353, 0, 1, 1,
0.463707, -0.05678063, 0.8000481, 0.1921569, 0, 1, 1,
0.4678419, -0.1780006, 0.2845643, 0.2, 0, 1, 1,
0.4754466, -0.7301091, 1.440433, 0.2078431, 0, 1, 1,
0.4795139, 0.7838554, 1.517414, 0.2117647, 0, 1, 1,
0.4812619, 0.9526442, -0.9668777, 0.2196078, 0, 1, 1,
0.4842876, 0.08758561, 0.5046047, 0.2235294, 0, 1, 1,
0.485812, 0.4310096, 0.6757523, 0.2313726, 0, 1, 1,
0.4911481, 0.1848488, 2.305305, 0.2352941, 0, 1, 1,
0.4937322, 1.358141, 0.5327597, 0.2431373, 0, 1, 1,
0.4938446, -0.1093943, 3.146999, 0.2470588, 0, 1, 1,
0.4946047, 0.5688816, 0.7650551, 0.254902, 0, 1, 1,
0.4998332, 0.5369473, 1.766117, 0.2588235, 0, 1, 1,
0.5002611, 1.334283, 0.5207601, 0.2666667, 0, 1, 1,
0.5033764, -2.627719, 2.177439, 0.2705882, 0, 1, 1,
0.5043225, -0.5554476, 1.905859, 0.2784314, 0, 1, 1,
0.5073406, -0.2040531, 0.6289319, 0.282353, 0, 1, 1,
0.5081518, 0.2982885, 1.101223, 0.2901961, 0, 1, 1,
0.5121175, -0.4443895, 0.915549, 0.2941177, 0, 1, 1,
0.5161005, 0.9896556, 1.612741, 0.3019608, 0, 1, 1,
0.5186763, -1.75891, 3.015394, 0.3098039, 0, 1, 1,
0.5222681, 2.673671, 1.981352, 0.3137255, 0, 1, 1,
0.5254344, 0.6238944, 2.147951, 0.3215686, 0, 1, 1,
0.5259385, -1.202572, 3.130223, 0.3254902, 0, 1, 1,
0.525969, -1.242867, 2.728936, 0.3333333, 0, 1, 1,
0.5321608, -1.220131, 2.308592, 0.3372549, 0, 1, 1,
0.537864, -1.304118, 2.611387, 0.345098, 0, 1, 1,
0.5388984, -0.1289149, 2.804852, 0.3490196, 0, 1, 1,
0.5389529, -1.235646, 2.881058, 0.3568628, 0, 1, 1,
0.5478555, 0.8248871, 0.9412786, 0.3607843, 0, 1, 1,
0.5495924, 1.2151, 1.865139, 0.3686275, 0, 1, 1,
0.5551156, 0.09780769, 0.3845858, 0.372549, 0, 1, 1,
0.5579026, -1.092362, 2.748876, 0.3803922, 0, 1, 1,
0.561262, 0.09818617, 2.158246, 0.3843137, 0, 1, 1,
0.5642438, -0.3310239, 1.67236, 0.3921569, 0, 1, 1,
0.5661508, 1.893829, 1.506988, 0.3960784, 0, 1, 1,
0.56775, 0.3484576, 0.150815, 0.4039216, 0, 1, 1,
0.5686772, 0.7414405, 1.144118, 0.4117647, 0, 1, 1,
0.5786688, -0.769645, 0.7979664, 0.4156863, 0, 1, 1,
0.5801845, -1.178753, 3.073791, 0.4235294, 0, 1, 1,
0.5879008, -0.8656886, 1.279947, 0.427451, 0, 1, 1,
0.5920965, 0.6411411, 0.7630832, 0.4352941, 0, 1, 1,
0.5921981, 1.0378, -0.02786952, 0.4392157, 0, 1, 1,
0.594508, -0.6041009, 2.301692, 0.4470588, 0, 1, 1,
0.5984998, -0.4876863, 2.657063, 0.4509804, 0, 1, 1,
0.5993148, 0.5203305, 1.257719, 0.4588235, 0, 1, 1,
0.6020375, -0.568181, 2.884942, 0.4627451, 0, 1, 1,
0.6031806, 0.1105221, -0.2731596, 0.4705882, 0, 1, 1,
0.6045122, 0.03437065, 2.034425, 0.4745098, 0, 1, 1,
0.6068205, 1.357788, 2.253532, 0.4823529, 0, 1, 1,
0.6079456, 1.289089, 0.4024845, 0.4862745, 0, 1, 1,
0.6090561, 0.6310605, 0.9491519, 0.4941176, 0, 1, 1,
0.6101842, 0.4471183, -0.6634178, 0.5019608, 0, 1, 1,
0.6105229, -0.6652724, 2.664407, 0.5058824, 0, 1, 1,
0.6134303, -1.265539, 3.394008, 0.5137255, 0, 1, 1,
0.6141496, 0.8549019, 0.4074508, 0.5176471, 0, 1, 1,
0.6160794, 0.7520233, 0.6939906, 0.5254902, 0, 1, 1,
0.6181771, -0.2907823, 2.216989, 0.5294118, 0, 1, 1,
0.6206945, -0.3680522, 3.341244, 0.5372549, 0, 1, 1,
0.630595, -1.315868, 2.606225, 0.5411765, 0, 1, 1,
0.6321469, 1.465416, 0.7880501, 0.5490196, 0, 1, 1,
0.6321585, -0.6430043, 1.96781, 0.5529412, 0, 1, 1,
0.6335195, 0.8085971, 1.911779, 0.5607843, 0, 1, 1,
0.6339202, -0.3363989, 0.6200013, 0.5647059, 0, 1, 1,
0.6355032, -1.356081, 1.326599, 0.572549, 0, 1, 1,
0.637607, -0.1025619, 2.332225, 0.5764706, 0, 1, 1,
0.6379009, 1.073358, 0.1138988, 0.5843138, 0, 1, 1,
0.6435412, -0.8518254, 2.123397, 0.5882353, 0, 1, 1,
0.6437333, -1.16194, 0.0200932, 0.5960785, 0, 1, 1,
0.6441381, 0.04689596, 2.11401, 0.6039216, 0, 1, 1,
0.6489024, 1.326475, 1.503132, 0.6078432, 0, 1, 1,
0.6518393, -0.006621351, 1.666705, 0.6156863, 0, 1, 1,
0.6561257, 0.2235797, 2.664599, 0.6196079, 0, 1, 1,
0.6639004, 0.9445766, 0.3779739, 0.627451, 0, 1, 1,
0.6656194, 1.923957, 0.6620086, 0.6313726, 0, 1, 1,
0.6698939, 0.784107, 3.230228, 0.6392157, 0, 1, 1,
0.6700493, -0.4250068, 3.456083, 0.6431373, 0, 1, 1,
0.6728709, 0.2233978, 1.046994, 0.6509804, 0, 1, 1,
0.6760958, 1.638818, -0.7458238, 0.654902, 0, 1, 1,
0.677345, -1.099509, 1.630578, 0.6627451, 0, 1, 1,
0.6807119, -1.480037, 3.498381, 0.6666667, 0, 1, 1,
0.6870173, -1.240132, 1.683377, 0.6745098, 0, 1, 1,
0.6878125, -0.5636769, 2.823739, 0.6784314, 0, 1, 1,
0.6925467, 1.14998, 2.821225, 0.6862745, 0, 1, 1,
0.6977712, -0.1405834, 1.806692, 0.6901961, 0, 1, 1,
0.7003039, 0.968959, -0.07656846, 0.6980392, 0, 1, 1,
0.7095971, 0.0941782, 1.526252, 0.7058824, 0, 1, 1,
0.7117249, 1.182643, 0.507808, 0.7098039, 0, 1, 1,
0.71539, 0.8186574, 1.0349, 0.7176471, 0, 1, 1,
0.7191991, -0.161185, 4.100801, 0.7215686, 0, 1, 1,
0.7213212, 0.8224007, 2.598303, 0.7294118, 0, 1, 1,
0.7220623, -0.4243135, 3.384293, 0.7333333, 0, 1, 1,
0.7229217, 0.4377511, 0.5477659, 0.7411765, 0, 1, 1,
0.7265911, -0.4510391, 3.101554, 0.7450981, 0, 1, 1,
0.7268996, -0.3120386, 2.856587, 0.7529412, 0, 1, 1,
0.7269944, 0.6330346, -0.597239, 0.7568628, 0, 1, 1,
0.7284734, -0.8540033, 3.011549, 0.7647059, 0, 1, 1,
0.7346372, -0.1304296, 0.03561416, 0.7686275, 0, 1, 1,
0.7448441, -1.300866, 2.878271, 0.7764706, 0, 1, 1,
0.7491122, 1.645648, 0.03560774, 0.7803922, 0, 1, 1,
0.7494572, 0.6126097, 1.57395, 0.7882353, 0, 1, 1,
0.7494774, -1.862711, 3.088919, 0.7921569, 0, 1, 1,
0.753969, 0.2298632, 1.683062, 0.8, 0, 1, 1,
0.7560309, -0.5399845, 2.627674, 0.8078431, 0, 1, 1,
0.7594324, -0.9914913, 0.2528882, 0.8117647, 0, 1, 1,
0.7613509, 0.1369964, 2.023979, 0.8196079, 0, 1, 1,
0.7634301, 0.5659213, 0.4058068, 0.8235294, 0, 1, 1,
0.7826847, -1.879613, 3.246603, 0.8313726, 0, 1, 1,
0.7868993, -0.6015725, 3.605972, 0.8352941, 0, 1, 1,
0.7894083, -1.112021, 0.3009727, 0.8431373, 0, 1, 1,
0.7949244, -0.6025462, 0.9493223, 0.8470588, 0, 1, 1,
0.795823, -0.9071876, 3.359778, 0.854902, 0, 1, 1,
0.7965674, 0.2184648, 1.08394, 0.8588235, 0, 1, 1,
0.8041452, 0.2739706, 1.813086, 0.8666667, 0, 1, 1,
0.8156859, 1.547439, -0.9163127, 0.8705882, 0, 1, 1,
0.8207548, -0.3843082, 2.492782, 0.8784314, 0, 1, 1,
0.8210135, 0.8764751, 0.9932975, 0.8823529, 0, 1, 1,
0.8211173, 0.09540165, 1.893304, 0.8901961, 0, 1, 1,
0.8234279, -0.1534988, 2.13753, 0.8941177, 0, 1, 1,
0.8255154, -2.388323, 1.539368, 0.9019608, 0, 1, 1,
0.8272828, 0.4846042, 2.349024, 0.9098039, 0, 1, 1,
0.8284227, -0.3181903, 2.692187, 0.9137255, 0, 1, 1,
0.834411, 0.6346155, 1.819258, 0.9215686, 0, 1, 1,
0.8347007, 0.6029397, 1.662967, 0.9254902, 0, 1, 1,
0.837974, -1.321552, 1.198702, 0.9333333, 0, 1, 1,
0.8419747, -2.381722, 3.920331, 0.9372549, 0, 1, 1,
0.8419909, -1.329215, 3.237574, 0.945098, 0, 1, 1,
0.8441407, -0.8595023, 1.814472, 0.9490196, 0, 1, 1,
0.8541443, 0.3797262, 1.66611, 0.9568627, 0, 1, 1,
0.8558468, 0.8721101, 0.3683231, 0.9607843, 0, 1, 1,
0.8647587, 0.7431742, 0.9706445, 0.9686275, 0, 1, 1,
0.8658912, 0.4509321, 1.524165, 0.972549, 0, 1, 1,
0.8667964, -0.5811868, 2.889236, 0.9803922, 0, 1, 1,
0.867009, 0.2126466, 2.127856, 0.9843137, 0, 1, 1,
0.8703222, 0.5428889, 3.18311, 0.9921569, 0, 1, 1,
0.8716455, 1.921697, -0.1213169, 0.9960784, 0, 1, 1,
0.874517, -0.08738025, 2.737751, 1, 0, 0.9960784, 1,
0.885109, -0.7228234, 2.214889, 1, 0, 0.9882353, 1,
0.8876396, 0.3923232, 1.428451, 1, 0, 0.9843137, 1,
0.8876522, -1.798185, 3.804008, 1, 0, 0.9764706, 1,
0.8891321, -1.600662, 4.008236, 1, 0, 0.972549, 1,
0.8924339, 1.823077, 0.8449735, 1, 0, 0.9647059, 1,
0.8951823, 1.593146, 1.397439, 1, 0, 0.9607843, 1,
0.8974569, -0.3553775, 2.101114, 1, 0, 0.9529412, 1,
0.899393, 0.2743191, 2.184819, 1, 0, 0.9490196, 1,
0.8999431, 0.7422785, 2.3033, 1, 0, 0.9411765, 1,
0.9024626, -0.691086, 2.581934, 1, 0, 0.9372549, 1,
0.9032222, -0.3509443, 1.871401, 1, 0, 0.9294118, 1,
0.9092165, -0.9442781, 0.7467615, 1, 0, 0.9254902, 1,
0.9103251, 1.258319, 0.5508587, 1, 0, 0.9176471, 1,
0.9105359, 0.02631906, 1.569241, 1, 0, 0.9137255, 1,
0.9160399, -0.5228626, 1.275892, 1, 0, 0.9058824, 1,
0.9167724, 0.8027761, 2.565351, 1, 0, 0.9019608, 1,
0.9189214, -1.421959, 1.004786, 1, 0, 0.8941177, 1,
0.9227928, -0.0777788, 0.03484598, 1, 0, 0.8862745, 1,
0.9250009, -0.1974726, 1.675888, 1, 0, 0.8823529, 1,
0.9268202, 1.055955, 2.611342, 1, 0, 0.8745098, 1,
0.9299578, -0.194707, 0.4604982, 1, 0, 0.8705882, 1,
0.9319516, -0.3410521, 1.159495, 1, 0, 0.8627451, 1,
0.9341437, -0.815116, 2.657003, 1, 0, 0.8588235, 1,
0.9351644, -0.008303481, 0.5205411, 1, 0, 0.8509804, 1,
0.93906, 0.05326883, 2.25945, 1, 0, 0.8470588, 1,
0.9393852, -0.1910952, 1.511939, 1, 0, 0.8392157, 1,
0.9532226, 0.4480902, 1.223284, 1, 0, 0.8352941, 1,
0.9597951, -1.619229, 2.067509, 1, 0, 0.827451, 1,
0.9604965, -0.247074, 0.1497207, 1, 0, 0.8235294, 1,
0.961754, -0.147037, 1.640608, 1, 0, 0.8156863, 1,
0.9656597, 0.1836586, 2.046611, 1, 0, 0.8117647, 1,
0.9708717, -1.276026, 3.279277, 1, 0, 0.8039216, 1,
0.9741431, -0.5112341, 0.9220299, 1, 0, 0.7960784, 1,
0.9779839, -0.9270319, 3.625612, 1, 0, 0.7921569, 1,
0.9816359, -0.312815, 2.211683, 1, 0, 0.7843137, 1,
0.9900324, -0.1102147, 3.231655, 1, 0, 0.7803922, 1,
0.99528, -0.09823707, 2.488206, 1, 0, 0.772549, 1,
1.003585, 0.1664908, -0.4303176, 1, 0, 0.7686275, 1,
1.004738, 0.08300865, 2.277931, 1, 0, 0.7607843, 1,
1.005896, -0.4157562, 1.404431, 1, 0, 0.7568628, 1,
1.009894, -0.3512107, 1.280936, 1, 0, 0.7490196, 1,
1.013552, -0.01668614, 3.329375, 1, 0, 0.7450981, 1,
1.026496, 1.07369, 0.9807039, 1, 0, 0.7372549, 1,
1.029805, 0.8821037, 1.679389, 1, 0, 0.7333333, 1,
1.033017, 1.013121, 0.2296946, 1, 0, 0.7254902, 1,
1.03513, -0.8783242, 0.7817832, 1, 0, 0.7215686, 1,
1.0356, 2.71345, 0.9051057, 1, 0, 0.7137255, 1,
1.040967, -0.2908173, 1.256858, 1, 0, 0.7098039, 1,
1.041052, 0.9313761, -0.4515252, 1, 0, 0.7019608, 1,
1.043798, 1.757898, 0.5689246, 1, 0, 0.6941177, 1,
1.046189, -0.7219869, 2.725507, 1, 0, 0.6901961, 1,
1.057979, -1.796378, 0.5091208, 1, 0, 0.682353, 1,
1.060171, -0.3293294, 1.785124, 1, 0, 0.6784314, 1,
1.062114, -0.01997552, 2.823085, 1, 0, 0.6705883, 1,
1.068808, 1.934444, -0.5996206, 1, 0, 0.6666667, 1,
1.072883, -0.5372372, 3.159518, 1, 0, 0.6588235, 1,
1.084765, 1.004392, 1.15887, 1, 0, 0.654902, 1,
1.085166, 0.08857429, 2.687519, 1, 0, 0.6470588, 1,
1.101977, -1.706457, 2.003631, 1, 0, 0.6431373, 1,
1.107918, -1.947846, 2.842248, 1, 0, 0.6352941, 1,
1.108322, -0.7577885, 2.177495, 1, 0, 0.6313726, 1,
1.119941, -1.037004, 1.589609, 1, 0, 0.6235294, 1,
1.130927, 0.473529, 1.20913, 1, 0, 0.6196079, 1,
1.134587, 1.950292, 2.176027, 1, 0, 0.6117647, 1,
1.142194, 1.594543, 0.6754087, 1, 0, 0.6078432, 1,
1.151621, -0.1995383, 1.351254, 1, 0, 0.6, 1,
1.157365, 0.5930514, 1.228782, 1, 0, 0.5921569, 1,
1.157663, -1.397663, 2.788086, 1, 0, 0.5882353, 1,
1.159543, 0.222879, 3.429671, 1, 0, 0.5803922, 1,
1.164739, 0.09499525, 1.213959, 1, 0, 0.5764706, 1,
1.208503, 0.5675574, 0.6462032, 1, 0, 0.5686275, 1,
1.220003, 0.1037967, 3.928901, 1, 0, 0.5647059, 1,
1.224445, -0.3582797, 1.638942, 1, 0, 0.5568628, 1,
1.236901, 0.1306483, 1.737615, 1, 0, 0.5529412, 1,
1.250028, 0.8151836, 1.41426, 1, 0, 0.5450981, 1,
1.250946, -0.2492116, 1.208073, 1, 0, 0.5411765, 1,
1.260615, -0.849261, 1.794547, 1, 0, 0.5333334, 1,
1.266897, -1.497243, 1.646897, 1, 0, 0.5294118, 1,
1.268228, 0.5331538, -0.770398, 1, 0, 0.5215687, 1,
1.278661, -0.4610708, 3.06396, 1, 0, 0.5176471, 1,
1.281152, -2.017219, 1.867412, 1, 0, 0.509804, 1,
1.291736, 0.9274355, 0.3109058, 1, 0, 0.5058824, 1,
1.299963, -0.26083, 1.863897, 1, 0, 0.4980392, 1,
1.301444, -1.155906, 1.752411, 1, 0, 0.4901961, 1,
1.303868, 0.7183591, 0.6572363, 1, 0, 0.4862745, 1,
1.304178, 0.2765278, 3.178868, 1, 0, 0.4784314, 1,
1.306181, 1.631553, -0.6817299, 1, 0, 0.4745098, 1,
1.309002, 0.5577388, 0.4881649, 1, 0, 0.4666667, 1,
1.313576, 0.671377, 0.6501931, 1, 0, 0.4627451, 1,
1.318525, -1.612626, 0.9637712, 1, 0, 0.454902, 1,
1.320059, -0.05625227, 1.145357, 1, 0, 0.4509804, 1,
1.32173, -0.410925, 2.259979, 1, 0, 0.4431373, 1,
1.32795, -0.3514872, 1.129055, 1, 0, 0.4392157, 1,
1.331162, 0.06620905, 2.440667, 1, 0, 0.4313726, 1,
1.339339, 1.862659, -0.2903779, 1, 0, 0.427451, 1,
1.345274, -1.341699, 2.519941, 1, 0, 0.4196078, 1,
1.348561, 0.07849407, 1.28521, 1, 0, 0.4156863, 1,
1.36143, 2.500541, -1.238237, 1, 0, 0.4078431, 1,
1.366991, 0.06306099, 1.954654, 1, 0, 0.4039216, 1,
1.374862, -0.5048596, 2.381374, 1, 0, 0.3960784, 1,
1.377932, -0.7548547, 2.120051, 1, 0, 0.3882353, 1,
1.378656, -0.2310123, 1.5522, 1, 0, 0.3843137, 1,
1.378932, -0.8130071, 3.882439, 1, 0, 0.3764706, 1,
1.380869, -0.0605472, 0.9078748, 1, 0, 0.372549, 1,
1.38722, 0.3394852, 1.416879, 1, 0, 0.3647059, 1,
1.390351, -0.01931936, 1.765017, 1, 0, 0.3607843, 1,
1.393163, 0.3909439, 2.543349, 1, 0, 0.3529412, 1,
1.409968, 2.082647, -0.4444897, 1, 0, 0.3490196, 1,
1.417667, -0.8215592, 2.576475, 1, 0, 0.3411765, 1,
1.417787, -0.7266368, 1.807725, 1, 0, 0.3372549, 1,
1.422042, 1.225441, 0.06019133, 1, 0, 0.3294118, 1,
1.440961, -0.173938, 2.887156, 1, 0, 0.3254902, 1,
1.446052, -0.1125208, 0.4453605, 1, 0, 0.3176471, 1,
1.447542, -0.6635152, 2.255472, 1, 0, 0.3137255, 1,
1.452275, 0.5489718, 1.056516, 1, 0, 0.3058824, 1,
1.452981, 1.405632, -0.03862424, 1, 0, 0.2980392, 1,
1.463204, -0.1067149, 1.255323, 1, 0, 0.2941177, 1,
1.470339, 0.5568426, 2.286371, 1, 0, 0.2862745, 1,
1.481541, 0.3712646, 1.495242, 1, 0, 0.282353, 1,
1.511573, 0.07477298, 0.4408191, 1, 0, 0.2745098, 1,
1.515661, 0.2140436, 2.354734, 1, 0, 0.2705882, 1,
1.517964, 2.652748, 0.1878685, 1, 0, 0.2627451, 1,
1.524417, 0.5877258, 1.194869, 1, 0, 0.2588235, 1,
1.535654, 1.195076, 1.131815, 1, 0, 0.2509804, 1,
1.541443, -1.320934, 0.8186612, 1, 0, 0.2470588, 1,
1.548368, -0.5969367, 2.717121, 1, 0, 0.2392157, 1,
1.5771, -1.042199, 1.961383, 1, 0, 0.2352941, 1,
1.584752, 1.277932, 0.9010209, 1, 0, 0.227451, 1,
1.585396, -0.5168707, 2.548382, 1, 0, 0.2235294, 1,
1.588641, -0.9443219, 2.210573, 1, 0, 0.2156863, 1,
1.605994, 0.890065, 0.6161397, 1, 0, 0.2117647, 1,
1.611598, 2.130074, 1.565134, 1, 0, 0.2039216, 1,
1.639352, -0.05759995, 1.477775, 1, 0, 0.1960784, 1,
1.6462, -0.1304694, 2.009581, 1, 0, 0.1921569, 1,
1.646581, 1.167329, 1.698563, 1, 0, 0.1843137, 1,
1.647209, -0.5365655, 0.133398, 1, 0, 0.1803922, 1,
1.654966, 0.7352171, 0.2633233, 1, 0, 0.172549, 1,
1.677286, 0.7990479, 0.0771815, 1, 0, 0.1686275, 1,
1.744551, -1.129318, 2.429873, 1, 0, 0.1607843, 1,
1.748277, 0.3680094, 1.520269, 1, 0, 0.1568628, 1,
1.772595, 0.6491693, 1.986894, 1, 0, 0.1490196, 1,
1.785572, 0.4297899, 0.693489, 1, 0, 0.145098, 1,
1.795092, -0.8581581, 1.400112, 1, 0, 0.1372549, 1,
1.815025, -0.5822287, 2.187337, 1, 0, 0.1333333, 1,
1.842688, -0.3126437, 1.608606, 1, 0, 0.1254902, 1,
1.844249, 0.2138863, 3.098816, 1, 0, 0.1215686, 1,
1.853313, -1.206053, 1.273127, 1, 0, 0.1137255, 1,
1.888441, -0.8591322, 2.414117, 1, 0, 0.1098039, 1,
1.893508, -0.4141755, 0.1787199, 1, 0, 0.1019608, 1,
1.968684, -1.014118, 3.399786, 1, 0, 0.09411765, 1,
1.978857, 1.55593, 0.3170891, 1, 0, 0.09019608, 1,
1.99237, 0.8006603, 0.9361823, 1, 0, 0.08235294, 1,
2.049701, -0.247742, 0.3849114, 1, 0, 0.07843138, 1,
2.088748, 0.635506, 2.850652, 1, 0, 0.07058824, 1,
2.212998, -1.661256, 2.551879, 1, 0, 0.06666667, 1,
2.248748, -0.8092339, 1.245744, 1, 0, 0.05882353, 1,
2.296317, 0.4328122, 3.29263, 1, 0, 0.05490196, 1,
2.352662, -0.08639541, 1.113726, 1, 0, 0.04705882, 1,
2.385932, -0.4590666, 1.499223, 1, 0, 0.04313726, 1,
2.417473, -0.7311326, 0.4161386, 1, 0, 0.03529412, 1,
2.688003, -0.09660418, 0.7294876, 1, 0, 0.03137255, 1,
2.754935, -0.7525977, 3.553832, 1, 0, 0.02352941, 1,
2.773645, 1.120046, 1.459497, 1, 0, 0.01960784, 1,
2.824766, -0.6565686, 1.588306, 1, 0, 0.01176471, 1,
2.843359, 0.7210318, 0.8706135, 1, 0, 0.007843138, 1
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
-0.3322015, -4.28829, -6.932325, 0, -0.5, 0.5, 0.5,
-0.3322015, -4.28829, -6.932325, 1, -0.5, 0.5, 0.5,
-0.3322015, -4.28829, -6.932325, 1, 1.5, 0.5, 0.5,
-0.3322015, -4.28829, -6.932325, 0, 1.5, 0.5, 0.5
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
-4.584277, 0.1596558, -6.932325, 0, -0.5, 0.5, 0.5,
-4.584277, 0.1596558, -6.932325, 1, -0.5, 0.5, 0.5,
-4.584277, 0.1596558, -6.932325, 1, 1.5, 0.5, 0.5,
-4.584277, 0.1596558, -6.932325, 0, 1.5, 0.5, 0.5
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
-4.584277, -4.28829, 0.05622005, 0, -0.5, 0.5, 0.5,
-4.584277, -4.28829, 0.05622005, 1, -0.5, 0.5, 0.5,
-4.584277, -4.28829, 0.05622005, 1, 1.5, 0.5, 0.5,
-4.584277, -4.28829, 0.05622005, 0, 1.5, 0.5, 0.5
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
-3, -3.261841, -5.319583,
2, -3.261841, -5.319583,
-3, -3.261841, -5.319583,
-3, -3.432916, -5.588374,
-2, -3.261841, -5.319583,
-2, -3.432916, -5.588374,
-1, -3.261841, -5.319583,
-1, -3.432916, -5.588374,
0, -3.261841, -5.319583,
0, -3.432916, -5.588374,
1, -3.261841, -5.319583,
1, -3.432916, -5.588374,
2, -3.261841, -5.319583,
2, -3.432916, -5.588374
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
-3, -3.775066, -6.125954, 0, -0.5, 0.5, 0.5,
-3, -3.775066, -6.125954, 1, -0.5, 0.5, 0.5,
-3, -3.775066, -6.125954, 1, 1.5, 0.5, 0.5,
-3, -3.775066, -6.125954, 0, 1.5, 0.5, 0.5,
-2, -3.775066, -6.125954, 0, -0.5, 0.5, 0.5,
-2, -3.775066, -6.125954, 1, -0.5, 0.5, 0.5,
-2, -3.775066, -6.125954, 1, 1.5, 0.5, 0.5,
-2, -3.775066, -6.125954, 0, 1.5, 0.5, 0.5,
-1, -3.775066, -6.125954, 0, -0.5, 0.5, 0.5,
-1, -3.775066, -6.125954, 1, -0.5, 0.5, 0.5,
-1, -3.775066, -6.125954, 1, 1.5, 0.5, 0.5,
-1, -3.775066, -6.125954, 0, 1.5, 0.5, 0.5,
0, -3.775066, -6.125954, 0, -0.5, 0.5, 0.5,
0, -3.775066, -6.125954, 1, -0.5, 0.5, 0.5,
0, -3.775066, -6.125954, 1, 1.5, 0.5, 0.5,
0, -3.775066, -6.125954, 0, 1.5, 0.5, 0.5,
1, -3.775066, -6.125954, 0, -0.5, 0.5, 0.5,
1, -3.775066, -6.125954, 1, -0.5, 0.5, 0.5,
1, -3.775066, -6.125954, 1, 1.5, 0.5, 0.5,
1, -3.775066, -6.125954, 0, 1.5, 0.5, 0.5,
2, -3.775066, -6.125954, 0, -0.5, 0.5, 0.5,
2, -3.775066, -6.125954, 1, -0.5, 0.5, 0.5,
2, -3.775066, -6.125954, 1, 1.5, 0.5, 0.5,
2, -3.775066, -6.125954, 0, 1.5, 0.5, 0.5
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
-3.603029, -3, -5.319583,
-3.603029, 3, -5.319583,
-3.603029, -3, -5.319583,
-3.76657, -3, -5.588374,
-3.603029, -2, -5.319583,
-3.76657, -2, -5.588374,
-3.603029, -1, -5.319583,
-3.76657, -1, -5.588374,
-3.603029, 0, -5.319583,
-3.76657, 0, -5.588374,
-3.603029, 1, -5.319583,
-3.76657, 1, -5.588374,
-3.603029, 2, -5.319583,
-3.76657, 2, -5.588374,
-3.603029, 3, -5.319583,
-3.76657, 3, -5.588374
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
-4.093653, -3, -6.125954, 0, -0.5, 0.5, 0.5,
-4.093653, -3, -6.125954, 1, -0.5, 0.5, 0.5,
-4.093653, -3, -6.125954, 1, 1.5, 0.5, 0.5,
-4.093653, -3, -6.125954, 0, 1.5, 0.5, 0.5,
-4.093653, -2, -6.125954, 0, -0.5, 0.5, 0.5,
-4.093653, -2, -6.125954, 1, -0.5, 0.5, 0.5,
-4.093653, -2, -6.125954, 1, 1.5, 0.5, 0.5,
-4.093653, -2, -6.125954, 0, 1.5, 0.5, 0.5,
-4.093653, -1, -6.125954, 0, -0.5, 0.5, 0.5,
-4.093653, -1, -6.125954, 1, -0.5, 0.5, 0.5,
-4.093653, -1, -6.125954, 1, 1.5, 0.5, 0.5,
-4.093653, -1, -6.125954, 0, 1.5, 0.5, 0.5,
-4.093653, 0, -6.125954, 0, -0.5, 0.5, 0.5,
-4.093653, 0, -6.125954, 1, -0.5, 0.5, 0.5,
-4.093653, 0, -6.125954, 1, 1.5, 0.5, 0.5,
-4.093653, 0, -6.125954, 0, 1.5, 0.5, 0.5,
-4.093653, 1, -6.125954, 0, -0.5, 0.5, 0.5,
-4.093653, 1, -6.125954, 1, -0.5, 0.5, 0.5,
-4.093653, 1, -6.125954, 1, 1.5, 0.5, 0.5,
-4.093653, 1, -6.125954, 0, 1.5, 0.5, 0.5,
-4.093653, 2, -6.125954, 0, -0.5, 0.5, 0.5,
-4.093653, 2, -6.125954, 1, -0.5, 0.5, 0.5,
-4.093653, 2, -6.125954, 1, 1.5, 0.5, 0.5,
-4.093653, 2, -6.125954, 0, 1.5, 0.5, 0.5,
-4.093653, 3, -6.125954, 0, -0.5, 0.5, 0.5,
-4.093653, 3, -6.125954, 1, -0.5, 0.5, 0.5,
-4.093653, 3, -6.125954, 1, 1.5, 0.5, 0.5,
-4.093653, 3, -6.125954, 0, 1.5, 0.5, 0.5
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
-3.603029, -3.261841, -4,
-3.603029, -3.261841, 4,
-3.603029, -3.261841, -4,
-3.76657, -3.432916, -4,
-3.603029, -3.261841, -2,
-3.76657, -3.432916, -2,
-3.603029, -3.261841, 0,
-3.76657, -3.432916, 0,
-3.603029, -3.261841, 2,
-3.76657, -3.432916, 2,
-3.603029, -3.261841, 4,
-3.76657, -3.432916, 4
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
-4.093653, -3.775066, -4, 0, -0.5, 0.5, 0.5,
-4.093653, -3.775066, -4, 1, -0.5, 0.5, 0.5,
-4.093653, -3.775066, -4, 1, 1.5, 0.5, 0.5,
-4.093653, -3.775066, -4, 0, 1.5, 0.5, 0.5,
-4.093653, -3.775066, -2, 0, -0.5, 0.5, 0.5,
-4.093653, -3.775066, -2, 1, -0.5, 0.5, 0.5,
-4.093653, -3.775066, -2, 1, 1.5, 0.5, 0.5,
-4.093653, -3.775066, -2, 0, 1.5, 0.5, 0.5,
-4.093653, -3.775066, 0, 0, -0.5, 0.5, 0.5,
-4.093653, -3.775066, 0, 1, -0.5, 0.5, 0.5,
-4.093653, -3.775066, 0, 1, 1.5, 0.5, 0.5,
-4.093653, -3.775066, 0, 0, 1.5, 0.5, 0.5,
-4.093653, -3.775066, 2, 0, -0.5, 0.5, 0.5,
-4.093653, -3.775066, 2, 1, -0.5, 0.5, 0.5,
-4.093653, -3.775066, 2, 1, 1.5, 0.5, 0.5,
-4.093653, -3.775066, 2, 0, 1.5, 0.5, 0.5,
-4.093653, -3.775066, 4, 0, -0.5, 0.5, 0.5,
-4.093653, -3.775066, 4, 1, -0.5, 0.5, 0.5,
-4.093653, -3.775066, 4, 1, 1.5, 0.5, 0.5,
-4.093653, -3.775066, 4, 0, 1.5, 0.5, 0.5
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
-3.603029, -3.261841, -5.319583,
-3.603029, 3.581153, -5.319583,
-3.603029, -3.261841, 5.432024,
-3.603029, 3.581153, 5.432024,
-3.603029, -3.261841, -5.319583,
-3.603029, -3.261841, 5.432024,
-3.603029, 3.581153, -5.319583,
-3.603029, 3.581153, 5.432024,
-3.603029, -3.261841, -5.319583,
2.938626, -3.261841, -5.319583,
-3.603029, -3.261841, 5.432024,
2.938626, -3.261841, 5.432024,
-3.603029, 3.581153, -5.319583,
2.938626, 3.581153, -5.319583,
-3.603029, 3.581153, 5.432024,
2.938626, 3.581153, 5.432024,
2.938626, -3.261841, -5.319583,
2.938626, 3.581153, -5.319583,
2.938626, -3.261841, 5.432024,
2.938626, 3.581153, 5.432024,
2.938626, -3.261841, -5.319583,
2.938626, -3.261841, 5.432024,
2.938626, 3.581153, -5.319583,
2.938626, 3.581153, 5.432024
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
var radius = 7.649481;
var distance = 34.03341;
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
mvMatrix.translate( 0.3322015, -0.1596558, -0.05622005 );
mvMatrix.scale( 1.264324, 1.208648, 0.7692589 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.03341);
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
ethylene_chloride_et<-read.table("ethylene_chloride_et.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 6 elements
```

```r
x<-ethylene_chloride_et$V2
```

```
## Error in eval(expr, envir, enclos): object 'ethylene_chloride_et' not found
```

```r
y<-ethylene_chloride_et$V3
```

```
## Error in eval(expr, envir, enclos): object 'ethylene_chloride_et' not found
```

```r
z<-ethylene_chloride_et$V4
```

```
## Error in eval(expr, envir, enclos): object 'ethylene_chloride_et' not found
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
-3.507762, 0.5599211, -0.6655221, 0, 0, 1, 1, 1,
-2.955197, 0.03097613, -1.419212, 1, 0, 0, 1, 1,
-2.65408, -0.7712156, -1.419164, 1, 0, 0, 1, 1,
-2.530121, 0.3763115, -1.174802, 1, 0, 0, 1, 1,
-2.473506, -0.8347036, -3.201466, 1, 0, 0, 1, 1,
-2.438704, 0.9074326, -3.098132, 1, 0, 0, 1, 1,
-2.324254, 0.7836246, 0.05011778, 0, 0, 0, 1, 1,
-2.317558, -0.5112636, -0.2137817, 0, 0, 0, 1, 1,
-2.22804, 2.541834, -1.594517, 0, 0, 0, 1, 1,
-2.185367, 0.8342013, -1.861155, 0, 0, 0, 1, 1,
-2.149532, -0.1792845, -2.027151, 0, 0, 0, 1, 1,
-2.082868, 0.5997163, -2.643802, 0, 0, 0, 1, 1,
-2.066344, -2.276011, -1.649044, 0, 0, 0, 1, 1,
-2.012998, 1.142736, -0.381543, 1, 1, 1, 1, 1,
-2.011856, 0.8629623, -2.342432, 1, 1, 1, 1, 1,
-2.002003, 2.472208, 0.676342, 1, 1, 1, 1, 1,
-1.994172, 0.498313, -1.202987, 1, 1, 1, 1, 1,
-1.943888, -1.689844, -1.122999, 1, 1, 1, 1, 1,
-1.941186, 0.5043356, -1.396531, 1, 1, 1, 1, 1,
-1.925746, 0.9116965, 0.2613879, 1, 1, 1, 1, 1,
-1.903839, -0.9058795, -1.491238, 1, 1, 1, 1, 1,
-1.858885, -0.3339255, -2.902838, 1, 1, 1, 1, 1,
-1.850623, -1.603162, -2.568681, 1, 1, 1, 1, 1,
-1.826827, -1.244574, -2.348704, 1, 1, 1, 1, 1,
-1.813871, -0.5380111, -1.875057, 1, 1, 1, 1, 1,
-1.784806, -0.441156, -1.726323, 1, 1, 1, 1, 1,
-1.77154, -0.05261873, 0.4574605, 1, 1, 1, 1, 1,
-1.742667, 0.1547666, -0.7302101, 1, 1, 1, 1, 1,
-1.74041, 1.569348, -2.053309, 0, 0, 1, 1, 1,
-1.722554, -0.2083592, -1.25035, 1, 0, 0, 1, 1,
-1.714806, 0.6163824, -0.5750377, 1, 0, 0, 1, 1,
-1.713291, -0.8813875, -1.149168, 1, 0, 0, 1, 1,
-1.698822, 1.301131, -1.451767, 1, 0, 0, 1, 1,
-1.692594, -0.3730924, -2.306318, 1, 0, 0, 1, 1,
-1.685361, -0.942278, -1.727312, 0, 0, 0, 1, 1,
-1.653257, -0.5069216, -2.706954, 0, 0, 0, 1, 1,
-1.643916, 0.05022588, -2.571012, 0, 0, 0, 1, 1,
-1.630334, -0.4393664, -4.856782, 0, 0, 0, 1, 1,
-1.628458, -0.1574528, -1.190053, 0, 0, 0, 1, 1,
-1.612748, 0.3012491, -2.394212, 0, 0, 0, 1, 1,
-1.60365, 0.6252651, 0.4962974, 0, 0, 0, 1, 1,
-1.584988, 0.8391546, 0.04813209, 1, 1, 1, 1, 1,
-1.57608, -1.277893, -2.125296, 1, 1, 1, 1, 1,
-1.572833, 0.1543709, -0.2271365, 1, 1, 1, 1, 1,
-1.569323, 0.3850199, -1.855243, 1, 1, 1, 1, 1,
-1.56199, -1.047526, -0.5436987, 1, 1, 1, 1, 1,
-1.507498, -0.1723914, -0.9199405, 1, 1, 1, 1, 1,
-1.505918, -1.338566, -1.165012, 1, 1, 1, 1, 1,
-1.498588, 0.8191403, -1.220035, 1, 1, 1, 1, 1,
-1.498467, -0.09422096, -0.9831945, 1, 1, 1, 1, 1,
-1.487357, -0.3664782, -2.129326, 1, 1, 1, 1, 1,
-1.454065, 0.9445851, -1.58078, 1, 1, 1, 1, 1,
-1.449589, -0.3714133, -3.236786, 1, 1, 1, 1, 1,
-1.436399, 0.9685225, -1.280856, 1, 1, 1, 1, 1,
-1.436144, -0.2307665, -2.009531, 1, 1, 1, 1, 1,
-1.428622, 2.136588, -1.086515, 1, 1, 1, 1, 1,
-1.419037, 1.773956, -1.030903, 0, 0, 1, 1, 1,
-1.415777, -0.5546679, -2.507754, 1, 0, 0, 1, 1,
-1.405889, 0.5863811, 0.2235592, 1, 0, 0, 1, 1,
-1.403363, 0.2402711, -2.220912, 1, 0, 0, 1, 1,
-1.39504, -1.46637, -2.617666, 1, 0, 0, 1, 1,
-1.391155, -3.017286, -3.493651, 1, 0, 0, 1, 1,
-1.388103, -0.1549793, -1.89144, 0, 0, 0, 1, 1,
-1.384936, 0.00560516, -1.073519, 0, 0, 0, 1, 1,
-1.372234, 0.05224074, -0.1820924, 0, 0, 0, 1, 1,
-1.369635, 0.2948855, -1.726005, 0, 0, 0, 1, 1,
-1.354095, 1.451064, 0.062267, 0, 0, 0, 1, 1,
-1.348048, -1.51096, -1.816459, 0, 0, 0, 1, 1,
-1.344999, 0.2112082, -1.33889, 0, 0, 0, 1, 1,
-1.33567, -0.260225, -2.708629, 1, 1, 1, 1, 1,
-1.329211, 0.5327541, -0.6898999, 1, 1, 1, 1, 1,
-1.324617, 0.02294817, -1.762471, 1, 1, 1, 1, 1,
-1.316699, 0.3929534, -1.654262, 1, 1, 1, 1, 1,
-1.307409, 1.062593, -0.9679158, 1, 1, 1, 1, 1,
-1.304347, -0.9631014, -1.848408, 1, 1, 1, 1, 1,
-1.30107, 0.3732976, -0.9722838, 1, 1, 1, 1, 1,
-1.28871, -0.7481574, -2.792531, 1, 1, 1, 1, 1,
-1.283552, 1.892217, -1.810078, 1, 1, 1, 1, 1,
-1.26834, 0.287184, 0.1565147, 1, 1, 1, 1, 1,
-1.261519, -1.413897, -2.200157, 1, 1, 1, 1, 1,
-1.260542, 2.632623, -2.320805, 1, 1, 1, 1, 1,
-1.255122, -0.7321775, -2.054538, 1, 1, 1, 1, 1,
-1.254772, -0.4446765, -2.243414, 1, 1, 1, 1, 1,
-1.244287, 0.8626124, -0.1654349, 1, 1, 1, 1, 1,
-1.239498, 0.4178986, -1.621425, 0, 0, 1, 1, 1,
-1.237502, 1.171696, -0.400834, 1, 0, 0, 1, 1,
-1.221144, -1.055735, -2.897986, 1, 0, 0, 1, 1,
-1.218565, 0.7885797, 0.6517751, 1, 0, 0, 1, 1,
-1.217426, -0.3652504, -1.389742, 1, 0, 0, 1, 1,
-1.206034, -0.728722, -2.703167, 1, 0, 0, 1, 1,
-1.204735, 0.7115705, -1.888273, 0, 0, 0, 1, 1,
-1.204376, 1.464322, 1.25289, 0, 0, 0, 1, 1,
-1.204117, -0.7971326, -2.642733, 0, 0, 0, 1, 1,
-1.195244, 1.114475, 2.023628, 0, 0, 0, 1, 1,
-1.189883, -1.79791, -2.440349, 0, 0, 0, 1, 1,
-1.182651, 1.10878, -0.188447, 0, 0, 0, 1, 1,
-1.177944, -1.023262, -3.229884, 0, 0, 0, 1, 1,
-1.160831, -1.132956, -1.712565, 1, 1, 1, 1, 1,
-1.156664, 2.551625, 1.409487, 1, 1, 1, 1, 1,
-1.149823, 1.259773, -0.16248, 1, 1, 1, 1, 1,
-1.143873, 0.2380758, -2.262372, 1, 1, 1, 1, 1,
-1.141568, -1.587994, -2.069861, 1, 1, 1, 1, 1,
-1.136094, -1.357283, -1.582022, 1, 1, 1, 1, 1,
-1.133918, 0.5930333, -2.39119, 1, 1, 1, 1, 1,
-1.12955, 0.5453489, -0.5251841, 1, 1, 1, 1, 1,
-1.127446, 0.5904207, -1.477291, 1, 1, 1, 1, 1,
-1.122993, -0.1712161, -3.089471, 1, 1, 1, 1, 1,
-1.120577, 0.7441053, 0.8603637, 1, 1, 1, 1, 1,
-1.118604, 0.445666, -2.136734, 1, 1, 1, 1, 1,
-1.11421, -0.5295523, -1.618595, 1, 1, 1, 1, 1,
-1.114151, -1.248698, -3.680155, 1, 1, 1, 1, 1,
-1.106128, -1.009942, -1.663494, 1, 1, 1, 1, 1,
-1.104398, -0.8772745, -2.528767, 0, 0, 1, 1, 1,
-1.102885, -0.9803161, -0.8584587, 1, 0, 0, 1, 1,
-1.096722, -0.6850668, -2.468711, 1, 0, 0, 1, 1,
-1.094751, -0.7774326, -2.965833, 1, 0, 0, 1, 1,
-1.09457, -1.313622, -1.410572, 1, 0, 0, 1, 1,
-1.084636, 0.4731281, -1.366015, 1, 0, 0, 1, 1,
-1.084157, -1.08151, -2.220237, 0, 0, 0, 1, 1,
-1.081273, -0.4660401, -0.08361421, 0, 0, 0, 1, 1,
-1.077557, -1.345796, -3.570179, 0, 0, 0, 1, 1,
-1.071156, -1.059525, -3.224744, 0, 0, 0, 1, 1,
-1.069515, -1.223862, -3.106675, 0, 0, 0, 1, 1,
-1.064696, -0.2937229, -2.99539, 0, 0, 0, 1, 1,
-1.063696, -1.55663, -2.175205, 0, 0, 0, 1, 1,
-1.056882, -0.1859237, -1.153848, 1, 1, 1, 1, 1,
-1.056373, -0.1738837, -1.207046, 1, 1, 1, 1, 1,
-1.05346, 0.3039781, -0.1915407, 1, 1, 1, 1, 1,
-1.05154, 2.019903, -1.32801, 1, 1, 1, 1, 1,
-1.047894, 0.5985475, -1.367331, 1, 1, 1, 1, 1,
-1.047421, 0.8177241, -0.4584626, 1, 1, 1, 1, 1,
-1.04523, 0.4120007, -1.235111, 1, 1, 1, 1, 1,
-1.044031, 1.125877, -0.4030761, 1, 1, 1, 1, 1,
-1.042888, 0.6371197, -1.928186, 1, 1, 1, 1, 1,
-1.042592, -1.456213, -3.379859, 1, 1, 1, 1, 1,
-1.042024, -0.6662176, -3.406205, 1, 1, 1, 1, 1,
-1.040219, -2.001819, -0.325925, 1, 1, 1, 1, 1,
-1.035951, 1.122884, -0.2728782, 1, 1, 1, 1, 1,
-1.034705, -0.3566243, -1.892761, 1, 1, 1, 1, 1,
-1.029436, -0.05435489, -1.936025, 1, 1, 1, 1, 1,
-1.024178, -0.1260453, -3.369067, 0, 0, 1, 1, 1,
-1.022586, 0.4989724, -3.134678, 1, 0, 0, 1, 1,
-1.020026, 0.9457933, -0.8991226, 1, 0, 0, 1, 1,
-1.019795, 1.579788, -0.9280634, 1, 0, 0, 1, 1,
-1.016761, 0.04629186, -0.1551564, 1, 0, 0, 1, 1,
-1.001589, -0.1737175, -2.589874, 1, 0, 0, 1, 1,
-1.000539, -0.4809803, -0.7853558, 0, 0, 0, 1, 1,
-0.9982536, -1.092538, -0.8075859, 0, 0, 0, 1, 1,
-0.9904025, -2.974696, -2.408832, 0, 0, 0, 1, 1,
-0.9890617, -0.03281093, -2.625201, 0, 0, 0, 1, 1,
-0.9878423, -0.1565684, -1.421279, 0, 0, 0, 1, 1,
-0.9877957, -0.308645, -2.002428, 0, 0, 0, 1, 1,
-0.9877416, 1.924817, 0.1809337, 0, 0, 0, 1, 1,
-0.9758505, -0.1890605, -1.128996, 1, 1, 1, 1, 1,
-0.9757039, 1.199674, 1.254168, 1, 1, 1, 1, 1,
-0.9746494, -0.2299313, -1.993608, 1, 1, 1, 1, 1,
-0.9734172, 1.429562, -0.7031918, 1, 1, 1, 1, 1,
-0.9722005, -0.7224011, -2.247451, 1, 1, 1, 1, 1,
-0.9718549, -0.6309518, -2.108035, 1, 1, 1, 1, 1,
-0.9689456, -0.6337506, -1.701253, 1, 1, 1, 1, 1,
-0.9616525, 0.5291442, -0.2828973, 1, 1, 1, 1, 1,
-0.9573116, -1.809796, -1.984972, 1, 1, 1, 1, 1,
-0.9547188, 0.3899404, -1.065817, 1, 1, 1, 1, 1,
-0.9481618, -0.335705, -0.4709036, 1, 1, 1, 1, 1,
-0.9476784, 0.1340872, -0.8114671, 1, 1, 1, 1, 1,
-0.9430848, 1.208023, -1.73459, 1, 1, 1, 1, 1,
-0.9356793, -0.4674729, -0.7593627, 1, 1, 1, 1, 1,
-0.9340979, 0.6251902, -0.420785, 1, 1, 1, 1, 1,
-0.9302709, -0.04214187, -2.081134, 0, 0, 1, 1, 1,
-0.9301333, 0.6150479, -0.3460997, 1, 0, 0, 1, 1,
-0.9279804, 1.765453, 0.3468994, 1, 0, 0, 1, 1,
-0.9257631, 0.3009054, -0.8083906, 1, 0, 0, 1, 1,
-0.9242013, -1.293481, -2.339391, 1, 0, 0, 1, 1,
-0.9237668, -0.4817272, -2.31597, 1, 0, 0, 1, 1,
-0.9168807, 0.05070064, 0.6803521, 0, 0, 0, 1, 1,
-0.9167001, 0.4553777, -1.897347, 0, 0, 0, 1, 1,
-0.9166899, -0.2970596, -1.059999, 0, 0, 0, 1, 1,
-0.9110134, 0.2448519, -0.821965, 0, 0, 0, 1, 1,
-0.9085507, -1.149799, -3.152972, 0, 0, 0, 1, 1,
-0.8993507, -1.791754, -2.631896, 0, 0, 0, 1, 1,
-0.894685, 0.5077891, 0.711161, 0, 0, 0, 1, 1,
-0.8933639, -0.9408634, -2.003343, 1, 1, 1, 1, 1,
-0.8837885, 0.07807534, -3.040397, 1, 1, 1, 1, 1,
-0.8831412, -0.9324191, -2.49195, 1, 1, 1, 1, 1,
-0.8822275, 0.5552212, -1.741281, 1, 1, 1, 1, 1,
-0.8778035, -0.5324268, -3.680295, 1, 1, 1, 1, 1,
-0.8724555, 0.6758313, -2.352037, 1, 1, 1, 1, 1,
-0.8695654, -1.536887, -3.832515, 1, 1, 1, 1, 1,
-0.8694249, -0.7866625, -1.767327, 1, 1, 1, 1, 1,
-0.864806, -0.616136, -3.592866, 1, 1, 1, 1, 1,
-0.8465043, -0.4514905, -2.093114, 1, 1, 1, 1, 1,
-0.8461673, 0.3190666, -1.468345, 1, 1, 1, 1, 1,
-0.8450205, 0.9479813, -0.7699996, 1, 1, 1, 1, 1,
-0.8397001, -0.7456056, -3.118134, 1, 1, 1, 1, 1,
-0.8385704, 1.191198, 0.8000354, 1, 1, 1, 1, 1,
-0.8362713, -1.005381, -2.426852, 1, 1, 1, 1, 1,
-0.8253278, -0.1362485, -3.891099, 0, 0, 1, 1, 1,
-0.823368, 1.023897, -2.807915, 1, 0, 0, 1, 1,
-0.8233587, 0.172942, -1.34425, 1, 0, 0, 1, 1,
-0.8185571, 1.955621, -1.222199, 1, 0, 0, 1, 1,
-0.8162524, -1.377018, -1.740516, 1, 0, 0, 1, 1,
-0.8113136, 1.645079, 0.05918929, 1, 0, 0, 1, 1,
-0.8039675, 1.751934, -0.009636086, 0, 0, 0, 1, 1,
-0.8013039, 0.02964549, -1.669813, 0, 0, 0, 1, 1,
-0.7910226, 0.4702005, -2.077647, 0, 0, 0, 1, 1,
-0.7903194, -1.937132, -3.170632, 0, 0, 0, 1, 1,
-0.7850409, -0.8284366, -4.092222, 0, 0, 0, 1, 1,
-0.7836597, -0.4206792, -2.158753, 0, 0, 0, 1, 1,
-0.7788842, -1.083787, -3.013887, 0, 0, 0, 1, 1,
-0.7736567, -0.8185862, -2.571125, 1, 1, 1, 1, 1,
-0.7704867, -0.5183694, -1.158489, 1, 1, 1, 1, 1,
-0.7668661, 0.4138229, -1.400501, 1, 1, 1, 1, 1,
-0.7616596, -2.028441, -3.201163, 1, 1, 1, 1, 1,
-0.7466596, -0.981154, -2.247942, 1, 1, 1, 1, 1,
-0.7394196, 1.273586, -0.3191973, 1, 1, 1, 1, 1,
-0.7342676, -3.018393, -0.9627692, 1, 1, 1, 1, 1,
-0.7341144, 0.1322459, -0.4622427, 1, 1, 1, 1, 1,
-0.7295577, 0.4860634, -1.688346, 1, 1, 1, 1, 1,
-0.7289911, 0.5936512, -0.6286185, 1, 1, 1, 1, 1,
-0.7238875, 0.1867128, -0.4379863, 1, 1, 1, 1, 1,
-0.723882, -0.02866241, -2.611593, 1, 1, 1, 1, 1,
-0.7235371, 0.425337, -1.320827, 1, 1, 1, 1, 1,
-0.7163525, 0.9251656, -0.06468365, 1, 1, 1, 1, 1,
-0.7113223, -0.265817, -1.302455, 1, 1, 1, 1, 1,
-0.7111716, 0.2476873, -1.723009, 0, 0, 1, 1, 1,
-0.7092155, -0.4408901, -1.695585, 1, 0, 0, 1, 1,
-0.7088531, 0.5700265, -2.112257, 1, 0, 0, 1, 1,
-0.7083139, 0.4386114, -2.33743, 1, 0, 0, 1, 1,
-0.6985487, 0.9303709, 0.5947257, 1, 0, 0, 1, 1,
-0.6872919, 0.1904219, -0.5733123, 1, 0, 0, 1, 1,
-0.6784742, 0.8222955, -0.596669, 0, 0, 0, 1, 1,
-0.6768203, -1.363867, -3.637528, 0, 0, 0, 1, 1,
-0.6726957, -0.7675495, -3.671668, 0, 0, 0, 1, 1,
-0.6712104, 1.214933, -0.04783298, 0, 0, 0, 1, 1,
-0.6692454, -0.8807986, -3.318415, 0, 0, 0, 1, 1,
-0.6576135, 1.633357, -0.7185871, 0, 0, 0, 1, 1,
-0.6544096, 1.680139, 0.1597835, 0, 0, 0, 1, 1,
-0.6507541, -0.3820501, -1.883112, 1, 1, 1, 1, 1,
-0.6493503, 0.645209, -1.657874, 1, 1, 1, 1, 1,
-0.6473479, -0.1080667, -2.145477, 1, 1, 1, 1, 1,
-0.6472582, -0.5948718, -2.215015, 1, 1, 1, 1, 1,
-0.6427142, -3.162186, -3.214281, 1, 1, 1, 1, 1,
-0.6399785, 0.6089067, -2.158991, 1, 1, 1, 1, 1,
-0.6347716, 0.6916541, -1.75774, 1, 1, 1, 1, 1,
-0.6345364, -0.2581138, -1.347327, 1, 1, 1, 1, 1,
-0.6328266, -0.5590179, -4.119068, 1, 1, 1, 1, 1,
-0.6287099, -1.735599, -1.947294, 1, 1, 1, 1, 1,
-0.6284304, 2.127155, 1.204918, 1, 1, 1, 1, 1,
-0.6271631, 0.3760829, -2.630201, 1, 1, 1, 1, 1,
-0.6204167, 0.2119025, -1.118548, 1, 1, 1, 1, 1,
-0.6136831, -0.3174523, -0.4371583, 1, 1, 1, 1, 1,
-0.6136237, 0.1406537, -0.8466396, 1, 1, 1, 1, 1,
-0.6135172, -1.087471, -3.506996, 0, 0, 1, 1, 1,
-0.6110386, 2.823548, 0.7809551, 1, 0, 0, 1, 1,
-0.6076261, -0.04100614, -2.124644, 1, 0, 0, 1, 1,
-0.6050494, 0.8992215, -2.245093, 1, 0, 0, 1, 1,
-0.5982955, 1.094358, -0.5673851, 1, 0, 0, 1, 1,
-0.5940503, 1.413965, -1.463261, 1, 0, 0, 1, 1,
-0.5934767, 1.031235, -2.013773, 0, 0, 0, 1, 1,
-0.5904123, 0.02451918, -1.582405, 0, 0, 0, 1, 1,
-0.5828936, 0.3250631, -2.620336, 0, 0, 0, 1, 1,
-0.5804872, 1.095431, -3.29156, 0, 0, 0, 1, 1,
-0.5770261, 0.4939523, 1.048498, 0, 0, 0, 1, 1,
-0.5749584, -0.1974458, -1.907703, 0, 0, 0, 1, 1,
-0.5728559, -0.687252, -2.142975, 0, 0, 0, 1, 1,
-0.5722433, -0.8826349, -2.830657, 1, 1, 1, 1, 1,
-0.5713735, -0.06880232, -3.13513, 1, 1, 1, 1, 1,
-0.564844, -1.03633, -4.551655, 1, 1, 1, 1, 1,
-0.5639638, -0.619825, -3.390483, 1, 1, 1, 1, 1,
-0.5626433, -0.8887674, -5.163007, 1, 1, 1, 1, 1,
-0.5596858, 0.6449152, -0.6505098, 1, 1, 1, 1, 1,
-0.5580881, -0.1245463, -1.959548, 1, 1, 1, 1, 1,
-0.5547614, 1.594238, -0.7101703, 1, 1, 1, 1, 1,
-0.5544965, 1.270516, -0.8245586, 1, 1, 1, 1, 1,
-0.5544804, -0.1111509, -1.299514, 1, 1, 1, 1, 1,
-0.554188, 0.8946118, 0.1798349, 1, 1, 1, 1, 1,
-0.5526016, -0.6280227, -1.867834, 1, 1, 1, 1, 1,
-0.5435024, 1.608562, 0.3040387, 1, 1, 1, 1, 1,
-0.53794, 0.1991669, -1.733546, 1, 1, 1, 1, 1,
-0.5364224, 0.6425269, -1.510883, 1, 1, 1, 1, 1,
-0.5343547, 0.2970778, -0.6084891, 0, 0, 1, 1, 1,
-0.5329553, 0.5746917, 0.06940047, 1, 0, 0, 1, 1,
-0.5266302, -0.6424742, -2.445847, 1, 0, 0, 1, 1,
-0.5226035, 0.9045687, -0.2591388, 1, 0, 0, 1, 1,
-0.5226035, -0.4651377, -2.888347, 1, 0, 0, 1, 1,
-0.5211818, 0.401899, -2.667524, 1, 0, 0, 1, 1,
-0.5194219, -2.03135, -2.276721, 0, 0, 0, 1, 1,
-0.5163417, 0.1921496, -1.983491, 0, 0, 0, 1, 1,
-0.5162684, 1.042235, -1.014712, 0, 0, 0, 1, 1,
-0.5146375, 0.8030676, -0.3101894, 0, 0, 0, 1, 1,
-0.5120327, 1.64979, 0.0405375, 0, 0, 0, 1, 1,
-0.5114197, 0.2464307, -0.585143, 0, 0, 0, 1, 1,
-0.5113441, -1.660416, -3.679845, 0, 0, 0, 1, 1,
-0.5029994, 0.8568341, -1.731593, 1, 1, 1, 1, 1,
-0.4968342, -0.5449896, -2.124007, 1, 1, 1, 1, 1,
-0.4958782, -0.7409354, -2.087005, 1, 1, 1, 1, 1,
-0.4917409, 0.1066797, -1.039446, 1, 1, 1, 1, 1,
-0.4851827, -0.8558653, -1.5973, 1, 1, 1, 1, 1,
-0.4848474, -1.201685, -2.731844, 1, 1, 1, 1, 1,
-0.4840946, 0.1784456, 0.8622084, 1, 1, 1, 1, 1,
-0.4820868, -0.2988836, -3.934964, 1, 1, 1, 1, 1,
-0.4778886, -1.582324, -2.379858, 1, 1, 1, 1, 1,
-0.4725451, 0.6852323, -0.7512841, 1, 1, 1, 1, 1,
-0.4680462, 0.284842, -2.010222, 1, 1, 1, 1, 1,
-0.4669333, 0.4054128, -3.48159, 1, 1, 1, 1, 1,
-0.4659714, 1.442814, -1.035661, 1, 1, 1, 1, 1,
-0.4655682, -0.4647367, -1.742097, 1, 1, 1, 1, 1,
-0.4629065, 0.01248928, -0.6228148, 1, 1, 1, 1, 1,
-0.4603025, -2.216037, -2.754058, 0, 0, 1, 1, 1,
-0.4594452, 1.401719, -0.00319185, 1, 0, 0, 1, 1,
-0.4580975, 0.9530709, -1.711511, 1, 0, 0, 1, 1,
-0.4554836, 0.1744252, -2.502148, 1, 0, 0, 1, 1,
-0.4513475, 0.2275091, 0.3725499, 1, 0, 0, 1, 1,
-0.4453741, -1.000257, -0.6015111, 1, 0, 0, 1, 1,
-0.4442258, -0.05237611, -2.35333, 0, 0, 0, 1, 1,
-0.4412821, -1.980816, -3.589713, 0, 0, 0, 1, 1,
-0.4312864, -1.099084, -1.330273, 0, 0, 0, 1, 1,
-0.4304963, 0.7442735, 0.6273896, 0, 0, 0, 1, 1,
-0.4285759, -1.031653, -3.532849, 0, 0, 0, 1, 1,
-0.4277294, 1.706592, 1.078161, 0, 0, 0, 1, 1,
-0.4269211, 0.6028357, -1.741571, 0, 0, 0, 1, 1,
-0.4263271, -0.1095987, -0.829038, 1, 1, 1, 1, 1,
-0.4248296, -0.7956885, -2.717324, 1, 1, 1, 1, 1,
-0.4242993, -0.6842358, -2.299654, 1, 1, 1, 1, 1,
-0.4209559, -1.180538, -3.543927, 1, 1, 1, 1, 1,
-0.4145904, -1.538266, -3.467848, 1, 1, 1, 1, 1,
-0.4143673, 0.2905436, -0.6045098, 1, 1, 1, 1, 1,
-0.4139256, -0.2514794, -3.679304, 1, 1, 1, 1, 1,
-0.4117599, -0.9567083, -2.808698, 1, 1, 1, 1, 1,
-0.4113948, 0.6856002, -0.2650668, 1, 1, 1, 1, 1,
-0.4090793, 0.3673365, 0.038731, 1, 1, 1, 1, 1,
-0.4086232, 0.1451874, -2.221335, 1, 1, 1, 1, 1,
-0.4076863, -0.1499842, -1.907395, 1, 1, 1, 1, 1,
-0.4062687, -0.4155985, -4.066043, 1, 1, 1, 1, 1,
-0.4053343, -0.6187844, -3.793875, 1, 1, 1, 1, 1,
-0.4030258, -0.8823285, -1.691669, 1, 1, 1, 1, 1,
-0.3988135, 0.5492203, 0.1272931, 0, 0, 1, 1, 1,
-0.3951903, -1.304059, -4.049054, 1, 0, 0, 1, 1,
-0.3905561, 0.7447163, -1.253773, 1, 0, 0, 1, 1,
-0.388227, 1.137605, 0.2551674, 1, 0, 0, 1, 1,
-0.3872042, 1.196827, -0.8968102, 1, 0, 0, 1, 1,
-0.386364, 0.7424597, -1.353809, 1, 0, 0, 1, 1,
-0.386069, -3.015445, -2.032783, 0, 0, 0, 1, 1,
-0.3858839, 0.08843304, -1.779008, 0, 0, 0, 1, 1,
-0.385104, -0.9319903, -2.192475, 0, 0, 0, 1, 1,
-0.3762883, 0.3008226, 0.6838699, 0, 0, 0, 1, 1,
-0.3735973, -0.9763749, -2.366678, 0, 0, 0, 1, 1,
-0.3730044, -0.8647451, -1.150446, 0, 0, 0, 1, 1,
-0.3702289, 0.3625208, -1.184276, 0, 0, 0, 1, 1,
-0.3692402, 1.224621, -1.629361, 1, 1, 1, 1, 1,
-0.3679819, 0.5960703, 0.4584301, 1, 1, 1, 1, 1,
-0.3669136, -0.1637608, -2.108878, 1, 1, 1, 1, 1,
-0.3662135, -1.821364, -2.263278, 1, 1, 1, 1, 1,
-0.3641929, -0.07639174, -0.09329591, 1, 1, 1, 1, 1,
-0.3606488, 0.6307195, -1.09529, 1, 1, 1, 1, 1,
-0.3588271, -1.047901, -3.442622, 1, 1, 1, 1, 1,
-0.3571569, -0.1967772, -4.099629, 1, 1, 1, 1, 1,
-0.3491773, -0.3645952, -2.037856, 1, 1, 1, 1, 1,
-0.3464559, -1.048141, -3.116537, 1, 1, 1, 1, 1,
-0.3397244, -0.4978293, -3.433279, 1, 1, 1, 1, 1,
-0.3392378, -1.526946, -4.995546, 1, 1, 1, 1, 1,
-0.3365619, 1.342797, 0.3496847, 1, 1, 1, 1, 1,
-0.3350244, 0.7815811, 1.39415, 1, 1, 1, 1, 1,
-0.3348096, -0.8242058, -2.497833, 1, 1, 1, 1, 1,
-0.3292235, 0.2018394, -0.2365354, 0, 0, 1, 1, 1,
-0.3207739, 0.8285949, -1.347847, 1, 0, 0, 1, 1,
-0.3183759, -0.4266496, -1.340494, 1, 0, 0, 1, 1,
-0.317016, -1.63117, -2.333819, 1, 0, 0, 1, 1,
-0.3094999, 1.786417, 0.1447159, 1, 0, 0, 1, 1,
-0.3093706, 1.933547, -1.203581, 1, 0, 0, 1, 1,
-0.3063398, 0.8421367, -0.5278645, 0, 0, 0, 1, 1,
-0.3055094, -1.25682, -0.5119056, 0, 0, 0, 1, 1,
-0.2997002, -0.3734154, -3.391058, 0, 0, 0, 1, 1,
-0.2953982, -1.298681, -1.330341, 0, 0, 0, 1, 1,
-0.2952155, -0.0245264, -0.1738329, 0, 0, 0, 1, 1,
-0.2869805, -0.5800868, -0.9900998, 0, 0, 0, 1, 1,
-0.2841124, 0.8455826, -1.452207, 0, 0, 0, 1, 1,
-0.2813719, -0.5079896, -2.397435, 1, 1, 1, 1, 1,
-0.2802009, -0.09095184, -1.758067, 1, 1, 1, 1, 1,
-0.2793424, 1.17653, -0.04107096, 1, 1, 1, 1, 1,
-0.2769448, 0.8421661, -1.117357, 1, 1, 1, 1, 1,
-0.2762355, 0.3898103, -0.495744, 1, 1, 1, 1, 1,
-0.2746486, 0.2045144, 1.206654, 1, 1, 1, 1, 1,
-0.2717406, -0.07191537, -3.431556, 1, 1, 1, 1, 1,
-0.2711625, -0.8156356, -3.342556, 1, 1, 1, 1, 1,
-0.2706552, -0.9932072, -1.538858, 1, 1, 1, 1, 1,
-0.2666227, -1.574951, -1.670714, 1, 1, 1, 1, 1,
-0.2659824, -0.1022721, -1.693956, 1, 1, 1, 1, 1,
-0.2648022, -0.6516627, -2.80001, 1, 1, 1, 1, 1,
-0.2647497, -1.445033, -5.153171, 1, 1, 1, 1, 1,
-0.2630962, -0.1854419, -2.353462, 1, 1, 1, 1, 1,
-0.2613115, 0.3567808, -1.424855, 1, 1, 1, 1, 1,
-0.2587765, -1.943835, -2.795676, 0, 0, 1, 1, 1,
-0.2563144, 0.3918981, -2.374506, 1, 0, 0, 1, 1,
-0.2529308, -0.5518665, -4.041629, 1, 0, 0, 1, 1,
-0.2529127, 0.9096547, 1.157899, 1, 0, 0, 1, 1,
-0.250688, -1.44088, -2.125467, 1, 0, 0, 1, 1,
-0.2502452, 1.014409, -0.5966822, 1, 0, 0, 1, 1,
-0.2421317, 1.091475, 0.5414441, 0, 0, 0, 1, 1,
-0.2391711, 0.5302083, 0.003745231, 0, 0, 0, 1, 1,
-0.2366637, -1.431244, -1.386647, 0, 0, 0, 1, 1,
-0.2323199, 2.180636, -0.3001685, 0, 0, 0, 1, 1,
-0.2302764, 0.8294095, -2.580739, 0, 0, 0, 1, 1,
-0.2275889, 0.1572665, -1.706388, 0, 0, 0, 1, 1,
-0.2268076, -0.335375, -1.58531, 0, 0, 0, 1, 1,
-0.2258093, 0.2873807, -0.6373487, 1, 1, 1, 1, 1,
-0.2220524, 0.4211726, 0.1555331, 1, 1, 1, 1, 1,
-0.2165929, -1.098466, -4.035464, 1, 1, 1, 1, 1,
-0.2154929, 0.4442469, -0.8958111, 1, 1, 1, 1, 1,
-0.209602, 0.2224749, -0.4008996, 1, 1, 1, 1, 1,
-0.2039735, -0.8706445, -4.751832, 1, 1, 1, 1, 1,
-0.198632, -1.510389, -2.82877, 1, 1, 1, 1, 1,
-0.1973469, 1.250676, 0.2936475, 1, 1, 1, 1, 1,
-0.1966768, -0.5982879, -1.103247, 1, 1, 1, 1, 1,
-0.1966286, -0.6811134, -3.344245, 1, 1, 1, 1, 1,
-0.1950184, 0.4700449, -0.2854179, 1, 1, 1, 1, 1,
-0.1947832, -0.3865051, -1.108732, 1, 1, 1, 1, 1,
-0.1946798, -0.0817197, 0.1201172, 1, 1, 1, 1, 1,
-0.1938477, -0.5155549, -1.061676, 1, 1, 1, 1, 1,
-0.1917773, 3.481498, 1.212875, 1, 1, 1, 1, 1,
-0.1891277, -1.784319, -4.36655, 0, 0, 1, 1, 1,
-0.1890369, 0.7453254, -0.1727549, 1, 0, 0, 1, 1,
-0.1871575, 2.132255, -0.9990064, 1, 0, 0, 1, 1,
-0.184237, -0.8006925, -2.898701, 1, 0, 0, 1, 1,
-0.1813072, -0.9884195, -2.337039, 1, 0, 0, 1, 1,
-0.181164, 2.100682, -1.968598, 1, 0, 0, 1, 1,
-0.1796146, 0.9307317, -0.4136931, 0, 0, 0, 1, 1,
-0.1764414, 0.406935, -1.122943, 0, 0, 0, 1, 1,
-0.1752127, 0.01864818, -0.2834525, 0, 0, 0, 1, 1,
-0.1738056, 0.5154384, 1.084635, 0, 0, 0, 1, 1,
-0.1710241, 0.08611303, -0.4866271, 0, 0, 0, 1, 1,
-0.169729, 0.4781993, -1.755143, 0, 0, 0, 1, 1,
-0.1654689, 0.5921302, 0.01724309, 0, 0, 0, 1, 1,
-0.1650907, -1.299798, -3.141388, 1, 1, 1, 1, 1,
-0.1643043, -0.06413335, -2.756253, 1, 1, 1, 1, 1,
-0.1608682, -0.08997516, -3.622939, 1, 1, 1, 1, 1,
-0.1564666, 1.31661, -0.8409171, 1, 1, 1, 1, 1,
-0.1506894, -0.299234, -2.158337, 1, 1, 1, 1, 1,
-0.1485777, 0.5975453, -0.4129343, 1, 1, 1, 1, 1,
-0.1467647, 0.2074452, -0.202996, 1, 1, 1, 1, 1,
-0.1464512, -0.6833988, -3.129189, 1, 1, 1, 1, 1,
-0.1397986, 0.2437982, 0.9128982, 1, 1, 1, 1, 1,
-0.1385689, 1.185913, -1.909533, 1, 1, 1, 1, 1,
-0.1347799, 0.1387587, -1.042759, 1, 1, 1, 1, 1,
-0.1299975, 0.4761397, -0.8175594, 1, 1, 1, 1, 1,
-0.1299395, -0.6126601, -4.533546, 1, 1, 1, 1, 1,
-0.128557, 2.186694, -1.064168, 1, 1, 1, 1, 1,
-0.1228009, 1.199244, 0.4709454, 1, 1, 1, 1, 1,
-0.1196301, 0.009490372, -1.612361, 0, 0, 1, 1, 1,
-0.1184401, 1.306103, 0.4815514, 1, 0, 0, 1, 1,
-0.1174434, -1.003858, -3.520937, 1, 0, 0, 1, 1,
-0.1104258, 0.02738784, -2.14703, 1, 0, 0, 1, 1,
-0.1087512, 0.3347891, 0.1015719, 1, 0, 0, 1, 1,
-0.1086948, -0.3925643, -2.113469, 1, 0, 0, 1, 1,
-0.1083944, -0.8272811, -2.813516, 0, 0, 0, 1, 1,
-0.1066532, 0.6882968, 0.3850247, 0, 0, 0, 1, 1,
-0.1060709, -0.1444378, -2.445323, 0, 0, 0, 1, 1,
-0.1018363, 0.1827008, 0.5407999, 0, 0, 0, 1, 1,
-0.09976314, -0.02349802, -2.904913, 0, 0, 0, 1, 1,
-0.09865378, -0.3588699, -2.953812, 0, 0, 0, 1, 1,
-0.09762715, -0.4336773, -3.617892, 0, 0, 0, 1, 1,
-0.09655643, 0.8621744, -0.2090105, 1, 1, 1, 1, 1,
-0.09586274, -0.621527, -4.549755, 1, 1, 1, 1, 1,
-0.09435181, 0.1576491, 1.204125, 1, 1, 1, 1, 1,
-0.09432708, -0.3795473, -3.597579, 1, 1, 1, 1, 1,
-0.0903736, -1.499898, -4.056817, 1, 1, 1, 1, 1,
-0.08968954, -1.196427, -2.626773, 1, 1, 1, 1, 1,
-0.08915962, -1.455696, -4.75564, 1, 1, 1, 1, 1,
-0.08854686, -0.6071884, -4.324208, 1, 1, 1, 1, 1,
-0.08491093, 0.05508484, -1.153015, 1, 1, 1, 1, 1,
-0.07849318, 1.177688, 0.4710645, 1, 1, 1, 1, 1,
-0.07691762, 0.5027015, 0.07198402, 1, 1, 1, 1, 1,
-0.07667667, 1.010516, -0.9335118, 1, 1, 1, 1, 1,
-0.07533427, 0.545083, -1.43442, 1, 1, 1, 1, 1,
-0.07258268, -1.60432, -3.58918, 1, 1, 1, 1, 1,
-0.06786407, -2.42476, -2.796865, 1, 1, 1, 1, 1,
-0.06674203, -0.7709355, -3.023048, 0, 0, 1, 1, 1,
-0.06369624, 1.005954, 1.734722, 1, 0, 0, 1, 1,
-0.06320649, -1.268545, -1.890632, 1, 0, 0, 1, 1,
-0.06269828, -0.2321769, -3.755854, 1, 0, 0, 1, 1,
-0.06050896, 0.1360424, -0.08978544, 1, 0, 0, 1, 1,
-0.05912717, 0.9886687, -0.834941, 1, 0, 0, 1, 1,
-0.05900886, -2.14814, -3.175737, 0, 0, 0, 1, 1,
-0.05802469, -1.088997, -2.636809, 0, 0, 0, 1, 1,
-0.05270407, 1.273399, -0.4576315, 0, 0, 0, 1, 1,
-0.05116966, 1.262873, 0.3988658, 0, 0, 0, 1, 1,
-0.04912705, 1.641396, -1.570314, 0, 0, 0, 1, 1,
-0.04063698, 0.04441462, -0.8759413, 0, 0, 0, 1, 1,
-0.0395192, -0.2160305, -4.234136, 0, 0, 0, 1, 1,
-0.03910338, 0.5854116, -0.3151635, 1, 1, 1, 1, 1,
-0.03858203, -1.562273, -3.893393, 1, 1, 1, 1, 1,
-0.03488942, 1.089338, -0.6235591, 1, 1, 1, 1, 1,
-0.03110912, 0.8967497, -0.65913, 1, 1, 1, 1, 1,
-0.03007519, -2.206734, -4.346449, 1, 1, 1, 1, 1,
-0.02378006, 0.7130277, -1.061732, 1, 1, 1, 1, 1,
-0.02348481, 0.08037344, -0.06901687, 1, 1, 1, 1, 1,
-0.02324801, 0.8895259, 1.577619, 1, 1, 1, 1, 1,
-0.02284336, 0.6082811, -0.04271797, 1, 1, 1, 1, 1,
-0.02269764, 1.929278, 0.5395426, 1, 1, 1, 1, 1,
-0.01609632, -1.232432, -4.047097, 1, 1, 1, 1, 1,
-0.007844849, -0.7175809, -3.675264, 1, 1, 1, 1, 1,
-0.005995729, 0.1840818, 0.7535753, 1, 1, 1, 1, 1,
-0.005628983, -0.8519255, -3.361306, 1, 1, 1, 1, 1,
-0.003821459, 0.3711999, 0.7399079, 1, 1, 1, 1, 1,
-0.003217138, -1.82495, -3.838573, 0, 0, 1, 1, 1,
-0.001325595, 0.456052, 0.618048, 1, 0, 0, 1, 1,
-0.0004720809, -1.807544, -3.113358, 1, 0, 0, 1, 1,
0.0005695091, -1.388334, 1.754142, 1, 0, 0, 1, 1,
0.002635066, -0.04682181, 3.706529, 1, 0, 0, 1, 1,
0.003262115, 1.381874, 0.3577377, 1, 0, 0, 1, 1,
0.009260126, 0.1199104, -1.533079, 0, 0, 0, 1, 1,
0.0109383, 0.4612758, 2.110536, 0, 0, 0, 1, 1,
0.01297854, -0.5614334, 3.030404, 0, 0, 0, 1, 1,
0.01508705, -1.304886, 4.057327, 0, 0, 0, 1, 1,
0.01720827, -0.3199984, 2.617415, 0, 0, 0, 1, 1,
0.01988313, -0.6486359, 3.387212, 0, 0, 0, 1, 1,
0.02240766, -0.3534213, 1.901116, 0, 0, 0, 1, 1,
0.02434111, 0.7353686, 0.8213431, 1, 1, 1, 1, 1,
0.02637023, -0.9200624, 2.310751, 1, 1, 1, 1, 1,
0.0303544, 1.253662, -1.173997, 1, 1, 1, 1, 1,
0.03039949, -0.5545531, 3.925577, 1, 1, 1, 1, 1,
0.03071698, -0.1274718, 2.90862, 1, 1, 1, 1, 1,
0.03234551, -0.626844, 2.09467, 1, 1, 1, 1, 1,
0.03244049, 0.1524869, -0.01752875, 1, 1, 1, 1, 1,
0.03631924, -0.1808889, 2.981735, 1, 1, 1, 1, 1,
0.03954186, 0.544355, 0.7960733, 1, 1, 1, 1, 1,
0.04053874, -0.9488872, 4.161058, 1, 1, 1, 1, 1,
0.04079442, -1.20337, 2.880708, 1, 1, 1, 1, 1,
0.04533859, -0.9541101, 4.444819, 1, 1, 1, 1, 1,
0.0460992, -1.297437, 3.270525, 1, 1, 1, 1, 1,
0.04847685, 0.1987053, 0.7391771, 1, 1, 1, 1, 1,
0.05181643, -0.4856478, 2.423425, 1, 1, 1, 1, 1,
0.052837, 1.080172, 0.9789824, 0, 0, 1, 1, 1,
0.05419273, -0.1953309, 2.779466, 1, 0, 0, 1, 1,
0.05431355, 1.224287, -1.335349, 1, 0, 0, 1, 1,
0.05462016, 0.009687285, 0.277957, 1, 0, 0, 1, 1,
0.05835867, -0.9086397, 3.48872, 1, 0, 0, 1, 1,
0.05886423, -0.7652615, 3.445472, 1, 0, 0, 1, 1,
0.06288417, 0.8899384, -0.8639751, 0, 0, 0, 1, 1,
0.07518058, -0.2751218, 3.494683, 0, 0, 0, 1, 1,
0.07657379, -0.3567255, 2.110068, 0, 0, 0, 1, 1,
0.07741836, -0.177895, 4.178974, 0, 0, 0, 1, 1,
0.07794833, -0.8012372, 1.914704, 0, 0, 0, 1, 1,
0.07880696, -1.058273, 2.448895, 0, 0, 0, 1, 1,
0.07947256, -2.079042, 3.200037, 0, 0, 0, 1, 1,
0.08578813, -0.4636985, 2.842524, 1, 1, 1, 1, 1,
0.0859265, 0.02772095, 0.04785255, 1, 1, 1, 1, 1,
0.0882197, 1.334487, -1.589514, 1, 1, 1, 1, 1,
0.08847138, 0.3464749, 0.4751463, 1, 1, 1, 1, 1,
0.08901605, 2.25098, -0.1943462, 1, 1, 1, 1, 1,
0.089054, -0.4964425, 1.721878, 1, 1, 1, 1, 1,
0.09026438, -1.027017, 5.275447, 1, 1, 1, 1, 1,
0.09183561, 0.6984159, 0.9783068, 1, 1, 1, 1, 1,
0.0928014, -0.6028234, 2.6853, 1, 1, 1, 1, 1,
0.09454785, 0.8216407, -0.2639333, 1, 1, 1, 1, 1,
0.09647121, -1.742693, 2.729374, 1, 1, 1, 1, 1,
0.09799641, 1.250363, -0.2417001, 1, 1, 1, 1, 1,
0.1027456, 0.7166172, -1.701718, 1, 1, 1, 1, 1,
0.1029313, -0.554267, 3.881603, 1, 1, 1, 1, 1,
0.1043952, 1.016138, -0.1363021, 1, 1, 1, 1, 1,
0.1061212, 0.3056215, -1.051613, 0, 0, 1, 1, 1,
0.1081428, 1.479729, 0.0444927, 1, 0, 0, 1, 1,
0.1116365, 0.8967683, -0.4404578, 1, 0, 0, 1, 1,
0.113325, 0.03770629, 0.6573344, 1, 0, 0, 1, 1,
0.1136148, -2.316746, 2.383052, 1, 0, 0, 1, 1,
0.1139561, -0.7386175, 3.068949, 1, 0, 0, 1, 1,
0.1144658, -0.9029511, 2.45588, 0, 0, 0, 1, 1,
0.121637, -2.267861, 2.413442, 0, 0, 0, 1, 1,
0.124907, -0.2278847, 1.885771, 0, 0, 0, 1, 1,
0.1274646, 2.071212, 0.3881133, 0, 0, 0, 1, 1,
0.1276489, -0.9366134, 2.953229, 0, 0, 0, 1, 1,
0.1340451, 0.255222, -0.2168574, 0, 0, 0, 1, 1,
0.1411143, -0.8183011, 3.958016, 0, 0, 0, 1, 1,
0.1469676, -0.02861675, 1.386724, 1, 1, 1, 1, 1,
0.1473666, -0.2431805, 1.043684, 1, 1, 1, 1, 1,
0.1612412, 1.104403, -0.4012699, 1, 1, 1, 1, 1,
0.1741029, -0.2730535, 3.220989, 1, 1, 1, 1, 1,
0.175808, 0.01499747, 1.051393, 1, 1, 1, 1, 1,
0.1769621, 0.5289679, -0.2654292, 1, 1, 1, 1, 1,
0.179282, -0.6965888, 2.193052, 1, 1, 1, 1, 1,
0.1813202, 0.006717045, 0.9817117, 1, 1, 1, 1, 1,
0.1853558, 0.06072037, 0.3276152, 1, 1, 1, 1, 1,
0.1856792, -0.02688794, -0.1712073, 1, 1, 1, 1, 1,
0.1882359, -0.3107364, 3.054314, 1, 1, 1, 1, 1,
0.188941, -0.3464507, 2.276136, 1, 1, 1, 1, 1,
0.1897171, -1.49859, 4.005058, 1, 1, 1, 1, 1,
0.1899067, 0.6869181, 0.6271855, 1, 1, 1, 1, 1,
0.1909632, -1.709219, 2.594501, 1, 1, 1, 1, 1,
0.1921908, 0.1373436, -0.4071385, 0, 0, 1, 1, 1,
0.1937431, 1.213331, -2.550474, 1, 0, 0, 1, 1,
0.1990846, -1.240103, 0.9534902, 1, 0, 0, 1, 1,
0.1996073, -0.4878704, 3.676631, 1, 0, 0, 1, 1,
0.2001663, 0.8590358, -0.08495323, 1, 0, 0, 1, 1,
0.201686, -0.5777516, 4.26076, 1, 0, 0, 1, 1,
0.2056285, 1.242787, -3.01051, 0, 0, 0, 1, 1,
0.214513, -0.2661278, 2.18525, 0, 0, 0, 1, 1,
0.2191833, -0.275729, 4.06576, 0, 0, 0, 1, 1,
0.2221752, 0.02772654, 3.024449, 0, 0, 0, 1, 1,
0.2276608, 0.01212006, 2.279076, 0, 0, 0, 1, 1,
0.2298545, -0.7533666, 3.63779, 0, 0, 0, 1, 1,
0.2302787, 0.7339657, -2.066822, 0, 0, 0, 1, 1,
0.2339115, -0.9235843, 4.152618, 1, 1, 1, 1, 1,
0.2421394, 0.4445916, 1.27171, 1, 1, 1, 1, 1,
0.2436132, 0.759954, -0.9108137, 1, 1, 1, 1, 1,
0.2451583, -0.8784019, 0.8859223, 1, 1, 1, 1, 1,
0.2471932, 0.2980141, -0.01469412, 1, 1, 1, 1, 1,
0.2482031, 0.1953726, 1.715632, 1, 1, 1, 1, 1,
0.2485003, -0.2096822, 3.191698, 1, 1, 1, 1, 1,
0.2486474, -0.6912187, 2.788818, 1, 1, 1, 1, 1,
0.2504795, 0.3786032, -0.5390326, 1, 1, 1, 1, 1,
0.2508885, 0.9123327, 0.9969419, 1, 1, 1, 1, 1,
0.2559439, 0.4998029, 0.8762949, 1, 1, 1, 1, 1,
0.2617006, 1.607557, 0.06653155, 1, 1, 1, 1, 1,
0.2644115, -0.11168, 1.628181, 1, 1, 1, 1, 1,
0.2654463, 0.5039208, 0.307624, 1, 1, 1, 1, 1,
0.2657467, -0.1796253, 3.100158, 1, 1, 1, 1, 1,
0.2666397, -0.1995186, 2.43827, 0, 0, 1, 1, 1,
0.2678792, 0.9630436, 0.4391918, 1, 0, 0, 1, 1,
0.2742852, -0.3314134, 2.446898, 1, 0, 0, 1, 1,
0.275626, -1.72394, 3.903028, 1, 0, 0, 1, 1,
0.2797946, 1.294928, -0.4407011, 1, 0, 0, 1, 1,
0.2822464, 0.2018266, 2.05711, 1, 0, 0, 1, 1,
0.2830455, -0.01104113, 3.626896, 0, 0, 0, 1, 1,
0.2839757, 0.5271911, 1.000173, 0, 0, 0, 1, 1,
0.2850617, -0.3008131, 3.213715, 0, 0, 0, 1, 1,
0.2856586, -0.5767829, 3.687783, 0, 0, 0, 1, 1,
0.2879226, -0.04425272, -0.6040488, 0, 0, 0, 1, 1,
0.2879719, -1.97099, 2.559283, 0, 0, 0, 1, 1,
0.2923179, 0.0267074, 1.636296, 0, 0, 0, 1, 1,
0.2936577, 0.2425744, -0.7291859, 1, 1, 1, 1, 1,
0.2938966, -0.749368, 5.20875, 1, 1, 1, 1, 1,
0.2976525, 1.632698, -0.3409573, 1, 1, 1, 1, 1,
0.3032459, -0.2560967, 1.911629, 1, 1, 1, 1, 1,
0.3083906, 1.350675, 0.2044915, 1, 1, 1, 1, 1,
0.309201, 0.2051109, 1.266828, 1, 1, 1, 1, 1,
0.3104604, 0.0707924, 0.7093155, 1, 1, 1, 1, 1,
0.3122044, 1.812678, -0.06873204, 1, 1, 1, 1, 1,
0.3126979, -0.8754247, 2.210161, 1, 1, 1, 1, 1,
0.318919, -0.7613124, 2.528459, 1, 1, 1, 1, 1,
0.3247569, 0.7518787, 1.966159, 1, 1, 1, 1, 1,
0.3255756, -1.272576, 2.302114, 1, 1, 1, 1, 1,
0.3257039, 0.0924255, 0.7237352, 1, 1, 1, 1, 1,
0.3264299, 2.496264, 0.1847406, 1, 1, 1, 1, 1,
0.3275378, 0.1464058, 2.003166, 1, 1, 1, 1, 1,
0.331636, -0.5778322, 3.566926, 0, 0, 1, 1, 1,
0.3347609, 0.1998255, 0.8391743, 1, 0, 0, 1, 1,
0.3358071, -0.5305406, 1.634552, 1, 0, 0, 1, 1,
0.3387667, -0.3300097, 2.333259, 1, 0, 0, 1, 1,
0.34714, -0.2132031, 1.145943, 1, 0, 0, 1, 1,
0.3479333, 0.2008887, 2.050491, 1, 0, 0, 1, 1,
0.3488103, 0.3003701, 0.1375632, 0, 0, 0, 1, 1,
0.3510091, -1.094061, 1.789899, 0, 0, 0, 1, 1,
0.3545964, 1.032009, -0.05245823, 0, 0, 0, 1, 1,
0.3561133, -0.800934, 1.285625, 0, 0, 0, 1, 1,
0.3598298, -1.394916, 2.863076, 0, 0, 0, 1, 1,
0.3608212, 1.640133, 0.2667161, 0, 0, 0, 1, 1,
0.3634752, 0.05778049, 2.142895, 0, 0, 0, 1, 1,
0.3695171, 0.8385283, 0.08039258, 1, 1, 1, 1, 1,
0.3742666, 0.678426, 1.151756, 1, 1, 1, 1, 1,
0.3774047, -1.169647, 2.461207, 1, 1, 1, 1, 1,
0.381909, -0.05457684, 0.3227102, 1, 1, 1, 1, 1,
0.382201, -1.77064, 4.536929, 1, 1, 1, 1, 1,
0.3838184, 1.024478, 1.242656, 1, 1, 1, 1, 1,
0.3891914, -0.9606314, 3.624964, 1, 1, 1, 1, 1,
0.3900242, -1.961063, 2.243845, 1, 1, 1, 1, 1,
0.3926855, 0.06623716, 1.522893, 1, 1, 1, 1, 1,
0.3962091, -0.9299118, 4.102211, 1, 1, 1, 1, 1,
0.3991716, 2.483485, 1.621802, 1, 1, 1, 1, 1,
0.3997816, 1.03231, 0.9426543, 1, 1, 1, 1, 1,
0.4060974, -1.486721, 3.769804, 1, 1, 1, 1, 1,
0.4061672, -1.106861, 2.621675, 1, 1, 1, 1, 1,
0.4086103, 1.775864, 0.3004453, 1, 1, 1, 1, 1,
0.4224091, -1.379271, 3.293376, 0, 0, 1, 1, 1,
0.4230323, 0.6394074, 0.8781708, 1, 0, 0, 1, 1,
0.4255483, -0.618265, 1.697437, 1, 0, 0, 1, 1,
0.4270707, -0.01321016, 1.801042, 1, 0, 0, 1, 1,
0.4279167, -1.357816, 3.327509, 1, 0, 0, 1, 1,
0.429597, 0.5005141, 0.493626, 1, 0, 0, 1, 1,
0.4308714, -0.4874208, 1.630084, 0, 0, 0, 1, 1,
0.4326417, 1.228238, -0.2423498, 0, 0, 0, 1, 1,
0.4340769, 1.665558, 1.364025, 0, 0, 0, 1, 1,
0.4352909, -0.5326804, 2.412337, 0, 0, 0, 1, 1,
0.4368706, 1.233849, 0.8685266, 0, 0, 0, 1, 1,
0.4381537, -2.263671, 3.718015, 0, 0, 0, 1, 1,
0.4385746, -1.925663, 3.036793, 0, 0, 0, 1, 1,
0.4386578, -0.5316406, 3.64708, 1, 1, 1, 1, 1,
0.4400286, 0.3578543, 1.756015, 1, 1, 1, 1, 1,
0.4411632, -0.9458084, 0.7139142, 1, 1, 1, 1, 1,
0.4431411, -0.5356646, 4.453444, 1, 1, 1, 1, 1,
0.4466376, 2.172285, -1.746432, 1, 1, 1, 1, 1,
0.4498911, 1.149642, 0.9900097, 1, 1, 1, 1, 1,
0.4534061, 1.115973, 0.3179393, 1, 1, 1, 1, 1,
0.4537831, 0.07247758, 0.0797511, 1, 1, 1, 1, 1,
0.453924, -0.40991, 3.089289, 1, 1, 1, 1, 1,
0.4550622, 0.3506046, 0.0687302, 1, 1, 1, 1, 1,
0.456234, -1.106272, 2.595044, 1, 1, 1, 1, 1,
0.4580549, 0.1609818, -0.1628957, 1, 1, 1, 1, 1,
0.4582908, -0.4318486, 3.107334, 1, 1, 1, 1, 1,
0.4608722, 0.9315351, 0.1010081, 1, 1, 1, 1, 1,
0.463707, -0.05678063, 0.8000481, 1, 1, 1, 1, 1,
0.4678419, -0.1780006, 0.2845643, 0, 0, 1, 1, 1,
0.4754466, -0.7301091, 1.440433, 1, 0, 0, 1, 1,
0.4795139, 0.7838554, 1.517414, 1, 0, 0, 1, 1,
0.4812619, 0.9526442, -0.9668777, 1, 0, 0, 1, 1,
0.4842876, 0.08758561, 0.5046047, 1, 0, 0, 1, 1,
0.485812, 0.4310096, 0.6757523, 1, 0, 0, 1, 1,
0.4911481, 0.1848488, 2.305305, 0, 0, 0, 1, 1,
0.4937322, 1.358141, 0.5327597, 0, 0, 0, 1, 1,
0.4938446, -0.1093943, 3.146999, 0, 0, 0, 1, 1,
0.4946047, 0.5688816, 0.7650551, 0, 0, 0, 1, 1,
0.4998332, 0.5369473, 1.766117, 0, 0, 0, 1, 1,
0.5002611, 1.334283, 0.5207601, 0, 0, 0, 1, 1,
0.5033764, -2.627719, 2.177439, 0, 0, 0, 1, 1,
0.5043225, -0.5554476, 1.905859, 1, 1, 1, 1, 1,
0.5073406, -0.2040531, 0.6289319, 1, 1, 1, 1, 1,
0.5081518, 0.2982885, 1.101223, 1, 1, 1, 1, 1,
0.5121175, -0.4443895, 0.915549, 1, 1, 1, 1, 1,
0.5161005, 0.9896556, 1.612741, 1, 1, 1, 1, 1,
0.5186763, -1.75891, 3.015394, 1, 1, 1, 1, 1,
0.5222681, 2.673671, 1.981352, 1, 1, 1, 1, 1,
0.5254344, 0.6238944, 2.147951, 1, 1, 1, 1, 1,
0.5259385, -1.202572, 3.130223, 1, 1, 1, 1, 1,
0.525969, -1.242867, 2.728936, 1, 1, 1, 1, 1,
0.5321608, -1.220131, 2.308592, 1, 1, 1, 1, 1,
0.537864, -1.304118, 2.611387, 1, 1, 1, 1, 1,
0.5388984, -0.1289149, 2.804852, 1, 1, 1, 1, 1,
0.5389529, -1.235646, 2.881058, 1, 1, 1, 1, 1,
0.5478555, 0.8248871, 0.9412786, 1, 1, 1, 1, 1,
0.5495924, 1.2151, 1.865139, 0, 0, 1, 1, 1,
0.5551156, 0.09780769, 0.3845858, 1, 0, 0, 1, 1,
0.5579026, -1.092362, 2.748876, 1, 0, 0, 1, 1,
0.561262, 0.09818617, 2.158246, 1, 0, 0, 1, 1,
0.5642438, -0.3310239, 1.67236, 1, 0, 0, 1, 1,
0.5661508, 1.893829, 1.506988, 1, 0, 0, 1, 1,
0.56775, 0.3484576, 0.150815, 0, 0, 0, 1, 1,
0.5686772, 0.7414405, 1.144118, 0, 0, 0, 1, 1,
0.5786688, -0.769645, 0.7979664, 0, 0, 0, 1, 1,
0.5801845, -1.178753, 3.073791, 0, 0, 0, 1, 1,
0.5879008, -0.8656886, 1.279947, 0, 0, 0, 1, 1,
0.5920965, 0.6411411, 0.7630832, 0, 0, 0, 1, 1,
0.5921981, 1.0378, -0.02786952, 0, 0, 0, 1, 1,
0.594508, -0.6041009, 2.301692, 1, 1, 1, 1, 1,
0.5984998, -0.4876863, 2.657063, 1, 1, 1, 1, 1,
0.5993148, 0.5203305, 1.257719, 1, 1, 1, 1, 1,
0.6020375, -0.568181, 2.884942, 1, 1, 1, 1, 1,
0.6031806, 0.1105221, -0.2731596, 1, 1, 1, 1, 1,
0.6045122, 0.03437065, 2.034425, 1, 1, 1, 1, 1,
0.6068205, 1.357788, 2.253532, 1, 1, 1, 1, 1,
0.6079456, 1.289089, 0.4024845, 1, 1, 1, 1, 1,
0.6090561, 0.6310605, 0.9491519, 1, 1, 1, 1, 1,
0.6101842, 0.4471183, -0.6634178, 1, 1, 1, 1, 1,
0.6105229, -0.6652724, 2.664407, 1, 1, 1, 1, 1,
0.6134303, -1.265539, 3.394008, 1, 1, 1, 1, 1,
0.6141496, 0.8549019, 0.4074508, 1, 1, 1, 1, 1,
0.6160794, 0.7520233, 0.6939906, 1, 1, 1, 1, 1,
0.6181771, -0.2907823, 2.216989, 1, 1, 1, 1, 1,
0.6206945, -0.3680522, 3.341244, 0, 0, 1, 1, 1,
0.630595, -1.315868, 2.606225, 1, 0, 0, 1, 1,
0.6321469, 1.465416, 0.7880501, 1, 0, 0, 1, 1,
0.6321585, -0.6430043, 1.96781, 1, 0, 0, 1, 1,
0.6335195, 0.8085971, 1.911779, 1, 0, 0, 1, 1,
0.6339202, -0.3363989, 0.6200013, 1, 0, 0, 1, 1,
0.6355032, -1.356081, 1.326599, 0, 0, 0, 1, 1,
0.637607, -0.1025619, 2.332225, 0, 0, 0, 1, 1,
0.6379009, 1.073358, 0.1138988, 0, 0, 0, 1, 1,
0.6435412, -0.8518254, 2.123397, 0, 0, 0, 1, 1,
0.6437333, -1.16194, 0.0200932, 0, 0, 0, 1, 1,
0.6441381, 0.04689596, 2.11401, 0, 0, 0, 1, 1,
0.6489024, 1.326475, 1.503132, 0, 0, 0, 1, 1,
0.6518393, -0.006621351, 1.666705, 1, 1, 1, 1, 1,
0.6561257, 0.2235797, 2.664599, 1, 1, 1, 1, 1,
0.6639004, 0.9445766, 0.3779739, 1, 1, 1, 1, 1,
0.6656194, 1.923957, 0.6620086, 1, 1, 1, 1, 1,
0.6698939, 0.784107, 3.230228, 1, 1, 1, 1, 1,
0.6700493, -0.4250068, 3.456083, 1, 1, 1, 1, 1,
0.6728709, 0.2233978, 1.046994, 1, 1, 1, 1, 1,
0.6760958, 1.638818, -0.7458238, 1, 1, 1, 1, 1,
0.677345, -1.099509, 1.630578, 1, 1, 1, 1, 1,
0.6807119, -1.480037, 3.498381, 1, 1, 1, 1, 1,
0.6870173, -1.240132, 1.683377, 1, 1, 1, 1, 1,
0.6878125, -0.5636769, 2.823739, 1, 1, 1, 1, 1,
0.6925467, 1.14998, 2.821225, 1, 1, 1, 1, 1,
0.6977712, -0.1405834, 1.806692, 1, 1, 1, 1, 1,
0.7003039, 0.968959, -0.07656846, 1, 1, 1, 1, 1,
0.7095971, 0.0941782, 1.526252, 0, 0, 1, 1, 1,
0.7117249, 1.182643, 0.507808, 1, 0, 0, 1, 1,
0.71539, 0.8186574, 1.0349, 1, 0, 0, 1, 1,
0.7191991, -0.161185, 4.100801, 1, 0, 0, 1, 1,
0.7213212, 0.8224007, 2.598303, 1, 0, 0, 1, 1,
0.7220623, -0.4243135, 3.384293, 1, 0, 0, 1, 1,
0.7229217, 0.4377511, 0.5477659, 0, 0, 0, 1, 1,
0.7265911, -0.4510391, 3.101554, 0, 0, 0, 1, 1,
0.7268996, -0.3120386, 2.856587, 0, 0, 0, 1, 1,
0.7269944, 0.6330346, -0.597239, 0, 0, 0, 1, 1,
0.7284734, -0.8540033, 3.011549, 0, 0, 0, 1, 1,
0.7346372, -0.1304296, 0.03561416, 0, 0, 0, 1, 1,
0.7448441, -1.300866, 2.878271, 0, 0, 0, 1, 1,
0.7491122, 1.645648, 0.03560774, 1, 1, 1, 1, 1,
0.7494572, 0.6126097, 1.57395, 1, 1, 1, 1, 1,
0.7494774, -1.862711, 3.088919, 1, 1, 1, 1, 1,
0.753969, 0.2298632, 1.683062, 1, 1, 1, 1, 1,
0.7560309, -0.5399845, 2.627674, 1, 1, 1, 1, 1,
0.7594324, -0.9914913, 0.2528882, 1, 1, 1, 1, 1,
0.7613509, 0.1369964, 2.023979, 1, 1, 1, 1, 1,
0.7634301, 0.5659213, 0.4058068, 1, 1, 1, 1, 1,
0.7826847, -1.879613, 3.246603, 1, 1, 1, 1, 1,
0.7868993, -0.6015725, 3.605972, 1, 1, 1, 1, 1,
0.7894083, -1.112021, 0.3009727, 1, 1, 1, 1, 1,
0.7949244, -0.6025462, 0.9493223, 1, 1, 1, 1, 1,
0.795823, -0.9071876, 3.359778, 1, 1, 1, 1, 1,
0.7965674, 0.2184648, 1.08394, 1, 1, 1, 1, 1,
0.8041452, 0.2739706, 1.813086, 1, 1, 1, 1, 1,
0.8156859, 1.547439, -0.9163127, 0, 0, 1, 1, 1,
0.8207548, -0.3843082, 2.492782, 1, 0, 0, 1, 1,
0.8210135, 0.8764751, 0.9932975, 1, 0, 0, 1, 1,
0.8211173, 0.09540165, 1.893304, 1, 0, 0, 1, 1,
0.8234279, -0.1534988, 2.13753, 1, 0, 0, 1, 1,
0.8255154, -2.388323, 1.539368, 1, 0, 0, 1, 1,
0.8272828, 0.4846042, 2.349024, 0, 0, 0, 1, 1,
0.8284227, -0.3181903, 2.692187, 0, 0, 0, 1, 1,
0.834411, 0.6346155, 1.819258, 0, 0, 0, 1, 1,
0.8347007, 0.6029397, 1.662967, 0, 0, 0, 1, 1,
0.837974, -1.321552, 1.198702, 0, 0, 0, 1, 1,
0.8419747, -2.381722, 3.920331, 0, 0, 0, 1, 1,
0.8419909, -1.329215, 3.237574, 0, 0, 0, 1, 1,
0.8441407, -0.8595023, 1.814472, 1, 1, 1, 1, 1,
0.8541443, 0.3797262, 1.66611, 1, 1, 1, 1, 1,
0.8558468, 0.8721101, 0.3683231, 1, 1, 1, 1, 1,
0.8647587, 0.7431742, 0.9706445, 1, 1, 1, 1, 1,
0.8658912, 0.4509321, 1.524165, 1, 1, 1, 1, 1,
0.8667964, -0.5811868, 2.889236, 1, 1, 1, 1, 1,
0.867009, 0.2126466, 2.127856, 1, 1, 1, 1, 1,
0.8703222, 0.5428889, 3.18311, 1, 1, 1, 1, 1,
0.8716455, 1.921697, -0.1213169, 1, 1, 1, 1, 1,
0.874517, -0.08738025, 2.737751, 1, 1, 1, 1, 1,
0.885109, -0.7228234, 2.214889, 1, 1, 1, 1, 1,
0.8876396, 0.3923232, 1.428451, 1, 1, 1, 1, 1,
0.8876522, -1.798185, 3.804008, 1, 1, 1, 1, 1,
0.8891321, -1.600662, 4.008236, 1, 1, 1, 1, 1,
0.8924339, 1.823077, 0.8449735, 1, 1, 1, 1, 1,
0.8951823, 1.593146, 1.397439, 0, 0, 1, 1, 1,
0.8974569, -0.3553775, 2.101114, 1, 0, 0, 1, 1,
0.899393, 0.2743191, 2.184819, 1, 0, 0, 1, 1,
0.8999431, 0.7422785, 2.3033, 1, 0, 0, 1, 1,
0.9024626, -0.691086, 2.581934, 1, 0, 0, 1, 1,
0.9032222, -0.3509443, 1.871401, 1, 0, 0, 1, 1,
0.9092165, -0.9442781, 0.7467615, 0, 0, 0, 1, 1,
0.9103251, 1.258319, 0.5508587, 0, 0, 0, 1, 1,
0.9105359, 0.02631906, 1.569241, 0, 0, 0, 1, 1,
0.9160399, -0.5228626, 1.275892, 0, 0, 0, 1, 1,
0.9167724, 0.8027761, 2.565351, 0, 0, 0, 1, 1,
0.9189214, -1.421959, 1.004786, 0, 0, 0, 1, 1,
0.9227928, -0.0777788, 0.03484598, 0, 0, 0, 1, 1,
0.9250009, -0.1974726, 1.675888, 1, 1, 1, 1, 1,
0.9268202, 1.055955, 2.611342, 1, 1, 1, 1, 1,
0.9299578, -0.194707, 0.4604982, 1, 1, 1, 1, 1,
0.9319516, -0.3410521, 1.159495, 1, 1, 1, 1, 1,
0.9341437, -0.815116, 2.657003, 1, 1, 1, 1, 1,
0.9351644, -0.008303481, 0.5205411, 1, 1, 1, 1, 1,
0.93906, 0.05326883, 2.25945, 1, 1, 1, 1, 1,
0.9393852, -0.1910952, 1.511939, 1, 1, 1, 1, 1,
0.9532226, 0.4480902, 1.223284, 1, 1, 1, 1, 1,
0.9597951, -1.619229, 2.067509, 1, 1, 1, 1, 1,
0.9604965, -0.247074, 0.1497207, 1, 1, 1, 1, 1,
0.961754, -0.147037, 1.640608, 1, 1, 1, 1, 1,
0.9656597, 0.1836586, 2.046611, 1, 1, 1, 1, 1,
0.9708717, -1.276026, 3.279277, 1, 1, 1, 1, 1,
0.9741431, -0.5112341, 0.9220299, 1, 1, 1, 1, 1,
0.9779839, -0.9270319, 3.625612, 0, 0, 1, 1, 1,
0.9816359, -0.312815, 2.211683, 1, 0, 0, 1, 1,
0.9900324, -0.1102147, 3.231655, 1, 0, 0, 1, 1,
0.99528, -0.09823707, 2.488206, 1, 0, 0, 1, 1,
1.003585, 0.1664908, -0.4303176, 1, 0, 0, 1, 1,
1.004738, 0.08300865, 2.277931, 1, 0, 0, 1, 1,
1.005896, -0.4157562, 1.404431, 0, 0, 0, 1, 1,
1.009894, -0.3512107, 1.280936, 0, 0, 0, 1, 1,
1.013552, -0.01668614, 3.329375, 0, 0, 0, 1, 1,
1.026496, 1.07369, 0.9807039, 0, 0, 0, 1, 1,
1.029805, 0.8821037, 1.679389, 0, 0, 0, 1, 1,
1.033017, 1.013121, 0.2296946, 0, 0, 0, 1, 1,
1.03513, -0.8783242, 0.7817832, 0, 0, 0, 1, 1,
1.0356, 2.71345, 0.9051057, 1, 1, 1, 1, 1,
1.040967, -0.2908173, 1.256858, 1, 1, 1, 1, 1,
1.041052, 0.9313761, -0.4515252, 1, 1, 1, 1, 1,
1.043798, 1.757898, 0.5689246, 1, 1, 1, 1, 1,
1.046189, -0.7219869, 2.725507, 1, 1, 1, 1, 1,
1.057979, -1.796378, 0.5091208, 1, 1, 1, 1, 1,
1.060171, -0.3293294, 1.785124, 1, 1, 1, 1, 1,
1.062114, -0.01997552, 2.823085, 1, 1, 1, 1, 1,
1.068808, 1.934444, -0.5996206, 1, 1, 1, 1, 1,
1.072883, -0.5372372, 3.159518, 1, 1, 1, 1, 1,
1.084765, 1.004392, 1.15887, 1, 1, 1, 1, 1,
1.085166, 0.08857429, 2.687519, 1, 1, 1, 1, 1,
1.101977, -1.706457, 2.003631, 1, 1, 1, 1, 1,
1.107918, -1.947846, 2.842248, 1, 1, 1, 1, 1,
1.108322, -0.7577885, 2.177495, 1, 1, 1, 1, 1,
1.119941, -1.037004, 1.589609, 0, 0, 1, 1, 1,
1.130927, 0.473529, 1.20913, 1, 0, 0, 1, 1,
1.134587, 1.950292, 2.176027, 1, 0, 0, 1, 1,
1.142194, 1.594543, 0.6754087, 1, 0, 0, 1, 1,
1.151621, -0.1995383, 1.351254, 1, 0, 0, 1, 1,
1.157365, 0.5930514, 1.228782, 1, 0, 0, 1, 1,
1.157663, -1.397663, 2.788086, 0, 0, 0, 1, 1,
1.159543, 0.222879, 3.429671, 0, 0, 0, 1, 1,
1.164739, 0.09499525, 1.213959, 0, 0, 0, 1, 1,
1.208503, 0.5675574, 0.6462032, 0, 0, 0, 1, 1,
1.220003, 0.1037967, 3.928901, 0, 0, 0, 1, 1,
1.224445, -0.3582797, 1.638942, 0, 0, 0, 1, 1,
1.236901, 0.1306483, 1.737615, 0, 0, 0, 1, 1,
1.250028, 0.8151836, 1.41426, 1, 1, 1, 1, 1,
1.250946, -0.2492116, 1.208073, 1, 1, 1, 1, 1,
1.260615, -0.849261, 1.794547, 1, 1, 1, 1, 1,
1.266897, -1.497243, 1.646897, 1, 1, 1, 1, 1,
1.268228, 0.5331538, -0.770398, 1, 1, 1, 1, 1,
1.278661, -0.4610708, 3.06396, 1, 1, 1, 1, 1,
1.281152, -2.017219, 1.867412, 1, 1, 1, 1, 1,
1.291736, 0.9274355, 0.3109058, 1, 1, 1, 1, 1,
1.299963, -0.26083, 1.863897, 1, 1, 1, 1, 1,
1.301444, -1.155906, 1.752411, 1, 1, 1, 1, 1,
1.303868, 0.7183591, 0.6572363, 1, 1, 1, 1, 1,
1.304178, 0.2765278, 3.178868, 1, 1, 1, 1, 1,
1.306181, 1.631553, -0.6817299, 1, 1, 1, 1, 1,
1.309002, 0.5577388, 0.4881649, 1, 1, 1, 1, 1,
1.313576, 0.671377, 0.6501931, 1, 1, 1, 1, 1,
1.318525, -1.612626, 0.9637712, 0, 0, 1, 1, 1,
1.320059, -0.05625227, 1.145357, 1, 0, 0, 1, 1,
1.32173, -0.410925, 2.259979, 1, 0, 0, 1, 1,
1.32795, -0.3514872, 1.129055, 1, 0, 0, 1, 1,
1.331162, 0.06620905, 2.440667, 1, 0, 0, 1, 1,
1.339339, 1.862659, -0.2903779, 1, 0, 0, 1, 1,
1.345274, -1.341699, 2.519941, 0, 0, 0, 1, 1,
1.348561, 0.07849407, 1.28521, 0, 0, 0, 1, 1,
1.36143, 2.500541, -1.238237, 0, 0, 0, 1, 1,
1.366991, 0.06306099, 1.954654, 0, 0, 0, 1, 1,
1.374862, -0.5048596, 2.381374, 0, 0, 0, 1, 1,
1.377932, -0.7548547, 2.120051, 0, 0, 0, 1, 1,
1.378656, -0.2310123, 1.5522, 0, 0, 0, 1, 1,
1.378932, -0.8130071, 3.882439, 1, 1, 1, 1, 1,
1.380869, -0.0605472, 0.9078748, 1, 1, 1, 1, 1,
1.38722, 0.3394852, 1.416879, 1, 1, 1, 1, 1,
1.390351, -0.01931936, 1.765017, 1, 1, 1, 1, 1,
1.393163, 0.3909439, 2.543349, 1, 1, 1, 1, 1,
1.409968, 2.082647, -0.4444897, 1, 1, 1, 1, 1,
1.417667, -0.8215592, 2.576475, 1, 1, 1, 1, 1,
1.417787, -0.7266368, 1.807725, 1, 1, 1, 1, 1,
1.422042, 1.225441, 0.06019133, 1, 1, 1, 1, 1,
1.440961, -0.173938, 2.887156, 1, 1, 1, 1, 1,
1.446052, -0.1125208, 0.4453605, 1, 1, 1, 1, 1,
1.447542, -0.6635152, 2.255472, 1, 1, 1, 1, 1,
1.452275, 0.5489718, 1.056516, 1, 1, 1, 1, 1,
1.452981, 1.405632, -0.03862424, 1, 1, 1, 1, 1,
1.463204, -0.1067149, 1.255323, 1, 1, 1, 1, 1,
1.470339, 0.5568426, 2.286371, 0, 0, 1, 1, 1,
1.481541, 0.3712646, 1.495242, 1, 0, 0, 1, 1,
1.511573, 0.07477298, 0.4408191, 1, 0, 0, 1, 1,
1.515661, 0.2140436, 2.354734, 1, 0, 0, 1, 1,
1.517964, 2.652748, 0.1878685, 1, 0, 0, 1, 1,
1.524417, 0.5877258, 1.194869, 1, 0, 0, 1, 1,
1.535654, 1.195076, 1.131815, 0, 0, 0, 1, 1,
1.541443, -1.320934, 0.8186612, 0, 0, 0, 1, 1,
1.548368, -0.5969367, 2.717121, 0, 0, 0, 1, 1,
1.5771, -1.042199, 1.961383, 0, 0, 0, 1, 1,
1.584752, 1.277932, 0.9010209, 0, 0, 0, 1, 1,
1.585396, -0.5168707, 2.548382, 0, 0, 0, 1, 1,
1.588641, -0.9443219, 2.210573, 0, 0, 0, 1, 1,
1.605994, 0.890065, 0.6161397, 1, 1, 1, 1, 1,
1.611598, 2.130074, 1.565134, 1, 1, 1, 1, 1,
1.639352, -0.05759995, 1.477775, 1, 1, 1, 1, 1,
1.6462, -0.1304694, 2.009581, 1, 1, 1, 1, 1,
1.646581, 1.167329, 1.698563, 1, 1, 1, 1, 1,
1.647209, -0.5365655, 0.133398, 1, 1, 1, 1, 1,
1.654966, 0.7352171, 0.2633233, 1, 1, 1, 1, 1,
1.677286, 0.7990479, 0.0771815, 1, 1, 1, 1, 1,
1.744551, -1.129318, 2.429873, 1, 1, 1, 1, 1,
1.748277, 0.3680094, 1.520269, 1, 1, 1, 1, 1,
1.772595, 0.6491693, 1.986894, 1, 1, 1, 1, 1,
1.785572, 0.4297899, 0.693489, 1, 1, 1, 1, 1,
1.795092, -0.8581581, 1.400112, 1, 1, 1, 1, 1,
1.815025, -0.5822287, 2.187337, 1, 1, 1, 1, 1,
1.842688, -0.3126437, 1.608606, 1, 1, 1, 1, 1,
1.844249, 0.2138863, 3.098816, 0, 0, 1, 1, 1,
1.853313, -1.206053, 1.273127, 1, 0, 0, 1, 1,
1.888441, -0.8591322, 2.414117, 1, 0, 0, 1, 1,
1.893508, -0.4141755, 0.1787199, 1, 0, 0, 1, 1,
1.968684, -1.014118, 3.399786, 1, 0, 0, 1, 1,
1.978857, 1.55593, 0.3170891, 1, 0, 0, 1, 1,
1.99237, 0.8006603, 0.9361823, 0, 0, 0, 1, 1,
2.049701, -0.247742, 0.3849114, 0, 0, 0, 1, 1,
2.088748, 0.635506, 2.850652, 0, 0, 0, 1, 1,
2.212998, -1.661256, 2.551879, 0, 0, 0, 1, 1,
2.248748, -0.8092339, 1.245744, 0, 0, 0, 1, 1,
2.296317, 0.4328122, 3.29263, 0, 0, 0, 1, 1,
2.352662, -0.08639541, 1.113726, 0, 0, 0, 1, 1,
2.385932, -0.4590666, 1.499223, 1, 1, 1, 1, 1,
2.417473, -0.7311326, 0.4161386, 1, 1, 1, 1, 1,
2.688003, -0.09660418, 0.7294876, 1, 1, 1, 1, 1,
2.754935, -0.7525977, 3.553832, 1, 1, 1, 1, 1,
2.773645, 1.120046, 1.459497, 1, 1, 1, 1, 1,
2.824766, -0.6565686, 1.588306, 1, 1, 1, 1, 1,
2.843359, 0.7210318, 0.8706135, 1, 1, 1, 1, 1
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
var radius = 9.513086;
var distance = 33.41431;
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
mvMatrix.translate( 0.3322014, -0.159656, -0.05622005 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.41431);
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
