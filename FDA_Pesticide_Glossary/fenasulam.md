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
-3.093891, 0.3123412, -1.195358, 1, 0, 0, 1,
-2.682558, 1.272761, -1.738888, 1, 0.007843138, 0, 1,
-2.674364, -0.4267911, -2.368322, 1, 0.01176471, 0, 1,
-2.549171, 0.7931702, -1.452409, 1, 0.01960784, 0, 1,
-2.401091, 1.097668, -2.657022, 1, 0.02352941, 0, 1,
-2.29021, 0.4412639, -3.07704, 1, 0.03137255, 0, 1,
-2.219459, 1.501211, -1.231623, 1, 0.03529412, 0, 1,
-2.210692, 0.7872954, -2.346982, 1, 0.04313726, 0, 1,
-2.207584, 0.08954123, -0.9536646, 1, 0.04705882, 0, 1,
-2.173928, 0.7588803, -0.9615314, 1, 0.05490196, 0, 1,
-2.133491, 0.7278954, -0.6740735, 1, 0.05882353, 0, 1,
-2.125946, 0.4826337, -0.9067118, 1, 0.06666667, 0, 1,
-2.063855, -1.566893, -3.717891, 1, 0.07058824, 0, 1,
-2.060882, 0.5870578, -2.506724, 1, 0.07843138, 0, 1,
-1.99409, -0.3535976, -2.828148, 1, 0.08235294, 0, 1,
-1.978854, -2.130583, -3.403141, 1, 0.09019608, 0, 1,
-1.965415, -0.1803451, -2.286048, 1, 0.09411765, 0, 1,
-1.958985, 1.619394, -0.3570082, 1, 0.1019608, 0, 1,
-1.95177, 0.1335566, -1.000288, 1, 0.1098039, 0, 1,
-1.944003, -0.6028792, -1.659652, 1, 0.1137255, 0, 1,
-1.904994, -1.440596, -3.816166, 1, 0.1215686, 0, 1,
-1.88647, 1.242035, 0.7147053, 1, 0.1254902, 0, 1,
-1.856289, 0.1862949, -1.311403, 1, 0.1333333, 0, 1,
-1.85618, 2.039912, -1.453534, 1, 0.1372549, 0, 1,
-1.848693, -0.08708072, -1.365634, 1, 0.145098, 0, 1,
-1.823971, 0.2101513, -2.946478, 1, 0.1490196, 0, 1,
-1.816087, -2.234136, -3.214342, 1, 0.1568628, 0, 1,
-1.814893, 0.4892281, -1.092786, 1, 0.1607843, 0, 1,
-1.773021, -0.1283062, -2.503145, 1, 0.1686275, 0, 1,
-1.772072, 0.3524864, -1.551799, 1, 0.172549, 0, 1,
-1.752171, -0.823069, -2.818708, 1, 0.1803922, 0, 1,
-1.7461, -1.176722, -3.419382, 1, 0.1843137, 0, 1,
-1.731233, 1.046464, -1.09854, 1, 0.1921569, 0, 1,
-1.722705, 1.215486, -0.2650493, 1, 0.1960784, 0, 1,
-1.707129, 1.440919, -0.355076, 1, 0.2039216, 0, 1,
-1.705482, -0.2598663, -1.617545, 1, 0.2117647, 0, 1,
-1.700544, 1.087393, -3.478001, 1, 0.2156863, 0, 1,
-1.695185, 1.296777, -0.2136343, 1, 0.2235294, 0, 1,
-1.665762, -0.9399508, -0.2067425, 1, 0.227451, 0, 1,
-1.645199, -0.4142271, -0.6988975, 1, 0.2352941, 0, 1,
-1.632415, 2.671466, 0.730244, 1, 0.2392157, 0, 1,
-1.623772, 0.1408769, -1.805059, 1, 0.2470588, 0, 1,
-1.62165, -0.9018105, -0.7096218, 1, 0.2509804, 0, 1,
-1.619915, -0.3744863, -2.825613, 1, 0.2588235, 0, 1,
-1.617198, 0.7925811, -2.228183, 1, 0.2627451, 0, 1,
-1.615456, -1.898709, -2.106212, 1, 0.2705882, 0, 1,
-1.599827, 1.145182, -1.441462, 1, 0.2745098, 0, 1,
-1.595721, -0.1957719, -3.376861, 1, 0.282353, 0, 1,
-1.591253, 1.614626, -1.617715, 1, 0.2862745, 0, 1,
-1.58916, 0.5076809, -0.6347827, 1, 0.2941177, 0, 1,
-1.586499, 0.2646114, -0.5452237, 1, 0.3019608, 0, 1,
-1.577572, -0.04702489, -2.430702, 1, 0.3058824, 0, 1,
-1.575063, -0.7325807, -1.691296, 1, 0.3137255, 0, 1,
-1.574489, -0.09902999, -0.9334263, 1, 0.3176471, 0, 1,
-1.55862, -0.3871362, -2.538869, 1, 0.3254902, 0, 1,
-1.556887, -0.7370921, -3.263378, 1, 0.3294118, 0, 1,
-1.550053, -0.02166258, -2.548551, 1, 0.3372549, 0, 1,
-1.545588, -0.3054075, -1.722718, 1, 0.3411765, 0, 1,
-1.54074, 0.51197, -0.06291796, 1, 0.3490196, 0, 1,
-1.538911, 0.7224621, -2.517275, 1, 0.3529412, 0, 1,
-1.538703, 0.4352562, -2.567025, 1, 0.3607843, 0, 1,
-1.519683, 0.1589663, -1.371854, 1, 0.3647059, 0, 1,
-1.507866, -1.210508, -3.002429, 1, 0.372549, 0, 1,
-1.506853, 0.09711693, -3.000192, 1, 0.3764706, 0, 1,
-1.502377, 2.5512, 2.178334, 1, 0.3843137, 0, 1,
-1.500641, 0.161871, -2.273374, 1, 0.3882353, 0, 1,
-1.490221, -0.5265339, -0.6500785, 1, 0.3960784, 0, 1,
-1.480373, 1.976575, -1.14784, 1, 0.4039216, 0, 1,
-1.461253, 0.4387438, -0.1320065, 1, 0.4078431, 0, 1,
-1.460546, 0.8526375, -1.164821, 1, 0.4156863, 0, 1,
-1.449425, 0.6304466, -1.932669, 1, 0.4196078, 0, 1,
-1.443554, 0.09124202, -1.695012, 1, 0.427451, 0, 1,
-1.43543, 0.9453349, -1.606361, 1, 0.4313726, 0, 1,
-1.434856, -0.181201, -0.6265609, 1, 0.4392157, 0, 1,
-1.424843, 2.462972, -1.324445, 1, 0.4431373, 0, 1,
-1.420008, -1.957537, -3.814662, 1, 0.4509804, 0, 1,
-1.418988, -0.4022566, -1.929083, 1, 0.454902, 0, 1,
-1.413123, 0.2692704, 0.2219332, 1, 0.4627451, 0, 1,
-1.408875, 0.5467088, -0.5135341, 1, 0.4666667, 0, 1,
-1.407452, 1.201547, -0.9562844, 1, 0.4745098, 0, 1,
-1.39938, -1.06568, -0.9479007, 1, 0.4784314, 0, 1,
-1.396466, -1.416006, -2.02603, 1, 0.4862745, 0, 1,
-1.396132, -0.7240072, -2.473672, 1, 0.4901961, 0, 1,
-1.383887, 0.8725141, -0.5487431, 1, 0.4980392, 0, 1,
-1.376019, -0.3376166, -1.897125, 1, 0.5058824, 0, 1,
-1.373702, -0.4795341, -1.745516, 1, 0.509804, 0, 1,
-1.368341, -1.289211, -2.360553, 1, 0.5176471, 0, 1,
-1.365965, -0.2005223, -1.716977, 1, 0.5215687, 0, 1,
-1.360687, -0.05935226, -1.651841, 1, 0.5294118, 0, 1,
-1.337147, -0.4701457, 0.2428371, 1, 0.5333334, 0, 1,
-1.327838, -2.095838, -2.337083, 1, 0.5411765, 0, 1,
-1.325662, -0.2470639, -1.928707, 1, 0.5450981, 0, 1,
-1.323647, 1.130697, -0.5367213, 1, 0.5529412, 0, 1,
-1.308801, 1.176646, -2.230316, 1, 0.5568628, 0, 1,
-1.302651, -0.3257266, -2.735078, 1, 0.5647059, 0, 1,
-1.301581, 0.3317285, -2.525051, 1, 0.5686275, 0, 1,
-1.238479, 0.5937937, -2.797272, 1, 0.5764706, 0, 1,
-1.237654, 0.5162176, -1.009134, 1, 0.5803922, 0, 1,
-1.235769, 0.4918863, -1.103038, 1, 0.5882353, 0, 1,
-1.235364, 0.6705222, -2.069269, 1, 0.5921569, 0, 1,
-1.225831, 1.158415, 0.8903373, 1, 0.6, 0, 1,
-1.222881, 2.394313, 1.732192, 1, 0.6078432, 0, 1,
-1.195996, -0.8452343, -1.123973, 1, 0.6117647, 0, 1,
-1.188732, -0.742417, -1.814496, 1, 0.6196079, 0, 1,
-1.184018, -0.8606663, -1.557878, 1, 0.6235294, 0, 1,
-1.179217, -0.4114738, -1.698988, 1, 0.6313726, 0, 1,
-1.178046, 1.676217, -2.128811, 1, 0.6352941, 0, 1,
-1.166788, 1.273283, -0.6257271, 1, 0.6431373, 0, 1,
-1.164755, -0.3434157, -1.561803, 1, 0.6470588, 0, 1,
-1.156329, 0.6220394, -0.1523398, 1, 0.654902, 0, 1,
-1.155097, 1.244235, 0.4542002, 1, 0.6588235, 0, 1,
-1.153982, -0.737325, -2.584574, 1, 0.6666667, 0, 1,
-1.148137, 0.4340865, -1.773919, 1, 0.6705883, 0, 1,
-1.138659, 0.5176806, -1.627509, 1, 0.6784314, 0, 1,
-1.132998, -1.47663, -4.125439, 1, 0.682353, 0, 1,
-1.126326, 0.4700324, 1.246403, 1, 0.6901961, 0, 1,
-1.126117, 0.3682098, -0.6685192, 1, 0.6941177, 0, 1,
-1.116723, -0.007177163, -1.935719, 1, 0.7019608, 0, 1,
-1.112668, -1.244296, -2.37553, 1, 0.7098039, 0, 1,
-1.110353, 0.2933797, -1.54251, 1, 0.7137255, 0, 1,
-1.11004, 1.246789, -1.209355, 1, 0.7215686, 0, 1,
-1.108297, -0.8350598, -2.564074, 1, 0.7254902, 0, 1,
-1.101757, -1.333826, -3.706681, 1, 0.7333333, 0, 1,
-1.100461, 1.369254, 0.06217833, 1, 0.7372549, 0, 1,
-1.073724, -0.02857258, 0.06195266, 1, 0.7450981, 0, 1,
-1.072732, -0.4201151, -0.4684521, 1, 0.7490196, 0, 1,
-1.063584, 0.01979973, -3.055527, 1, 0.7568628, 0, 1,
-1.058273, -0.499494, 0.1071108, 1, 0.7607843, 0, 1,
-1.055046, 0.9261601, -1.59617, 1, 0.7686275, 0, 1,
-1.054963, -0.6431924, -0.9965892, 1, 0.772549, 0, 1,
-1.054422, 0.3308806, -1.258076, 1, 0.7803922, 0, 1,
-1.051884, 0.7754343, -1.762536, 1, 0.7843137, 0, 1,
-1.051331, -0.4895323, -4.189285, 1, 0.7921569, 0, 1,
-1.04343, -0.02630674, -2.842026, 1, 0.7960784, 0, 1,
-1.028982, -1.725468, -1.366702, 1, 0.8039216, 0, 1,
-1.024875, -1.149273, -1.428555, 1, 0.8117647, 0, 1,
-1.021708, -0.9529165, -2.877871, 1, 0.8156863, 0, 1,
-1.011937, -0.8453407, -2.453504, 1, 0.8235294, 0, 1,
-1.00811, 0.5218403, -0.03788023, 1, 0.827451, 0, 1,
-1.007892, 0.1335195, -0.7090734, 1, 0.8352941, 0, 1,
-1.004532, 2.228607, 2.000895, 1, 0.8392157, 0, 1,
-1.00233, -0.07238643, -1.606545, 1, 0.8470588, 0, 1,
-1.001997, 1.450308, -0.6958367, 1, 0.8509804, 0, 1,
-1.000276, 0.777006, -0.505244, 1, 0.8588235, 0, 1,
-0.9928587, -0.7440349, -1.659704, 1, 0.8627451, 0, 1,
-0.9890435, -0.8922061, -2.807997, 1, 0.8705882, 0, 1,
-0.9888149, -0.514769, -1.307366, 1, 0.8745098, 0, 1,
-0.986802, -0.7962994, -1.208493, 1, 0.8823529, 0, 1,
-0.9855558, 0.5435857, -2.19303, 1, 0.8862745, 0, 1,
-0.9854445, -1.413412, -3.236823, 1, 0.8941177, 0, 1,
-0.9764941, -0.1361448, -0.4459001, 1, 0.8980392, 0, 1,
-0.9754718, -1.301573, -1.912643, 1, 0.9058824, 0, 1,
-0.9743973, 1.346053, -0.3984483, 1, 0.9137255, 0, 1,
-0.9720067, -0.03601206, -1.096875, 1, 0.9176471, 0, 1,
-0.9708883, 0.4904691, -2.08647, 1, 0.9254902, 0, 1,
-0.9630259, -0.7309623, -1.86468, 1, 0.9294118, 0, 1,
-0.9622859, -0.5269026, -0.9895813, 1, 0.9372549, 0, 1,
-0.9615365, -1.172027, -2.352599, 1, 0.9411765, 0, 1,
-0.952149, -0.3692094, -2.176711, 1, 0.9490196, 0, 1,
-0.9510516, -0.6746725, -1.937168, 1, 0.9529412, 0, 1,
-0.948921, 1.078309, -1.071814, 1, 0.9607843, 0, 1,
-0.947965, -0.01901177, -0.5375729, 1, 0.9647059, 0, 1,
-0.9458867, 1.32278, -1.147193, 1, 0.972549, 0, 1,
-0.9430729, -0.8060308, -0.2007207, 1, 0.9764706, 0, 1,
-0.9347388, 0.3702437, 0.1429901, 1, 0.9843137, 0, 1,
-0.9304224, 1.169684, 0.3250338, 1, 0.9882353, 0, 1,
-0.9291198, -0.719952, -2.48165, 1, 0.9960784, 0, 1,
-0.9242092, -1.025457, -0.9670889, 0.9960784, 1, 0, 1,
-0.9225289, 0.3681568, -0.4366249, 0.9921569, 1, 0, 1,
-0.9211546, -0.9999229, -3.476954, 0.9843137, 1, 0, 1,
-0.9198793, -0.1546496, -1.465539, 0.9803922, 1, 0, 1,
-0.9189332, 0.7618515, -0.02114789, 0.972549, 1, 0, 1,
-0.9109107, -0.2665659, -1.834209, 0.9686275, 1, 0, 1,
-0.9078649, -0.4197942, -3.552449, 0.9607843, 1, 0, 1,
-0.9050893, -2.210917, -3.059885, 0.9568627, 1, 0, 1,
-0.8989838, 1.444113, -0.8669746, 0.9490196, 1, 0, 1,
-0.8968976, -0.2805698, -1.835239, 0.945098, 1, 0, 1,
-0.8833449, 0.4615298, 1.019188, 0.9372549, 1, 0, 1,
-0.879209, -0.4040386, -2.245462, 0.9333333, 1, 0, 1,
-0.8775888, -0.5766292, -3.949681, 0.9254902, 1, 0, 1,
-0.8743829, 2.027171, 0.6609831, 0.9215686, 1, 0, 1,
-0.8736013, 0.1529821, -0.2532384, 0.9137255, 1, 0, 1,
-0.8658709, -1.107189, -2.770799, 0.9098039, 1, 0, 1,
-0.8638681, -0.2328694, -0.3983268, 0.9019608, 1, 0, 1,
-0.861959, -0.4759077, -1.100106, 0.8941177, 1, 0, 1,
-0.8576007, -0.9632145, -3.099164, 0.8901961, 1, 0, 1,
-0.8525743, -0.176552, -2.597038, 0.8823529, 1, 0, 1,
-0.850625, 0.5002441, -0.9693627, 0.8784314, 1, 0, 1,
-0.8480451, 1.268885, -0.05241854, 0.8705882, 1, 0, 1,
-0.8441489, 0.4855766, -1.285467, 0.8666667, 1, 0, 1,
-0.8404192, 0.7236164, -1.494065, 0.8588235, 1, 0, 1,
-0.8391642, 1.825341, -2.551213, 0.854902, 1, 0, 1,
-0.8387032, -0.4019416, -1.805993, 0.8470588, 1, 0, 1,
-0.8369281, 0.3842331, -0.4059331, 0.8431373, 1, 0, 1,
-0.8367929, -0.4042086, -0.4788294, 0.8352941, 1, 0, 1,
-0.8346711, -0.798563, -1.531076, 0.8313726, 1, 0, 1,
-0.830762, -1.210221, -3.466609, 0.8235294, 1, 0, 1,
-0.8263213, 0.8322697, -1.899177, 0.8196079, 1, 0, 1,
-0.8240531, -1.031232, -2.141574, 0.8117647, 1, 0, 1,
-0.8230082, -0.8813183, -2.560158, 0.8078431, 1, 0, 1,
-0.8221363, -0.5657992, -1.354194, 0.8, 1, 0, 1,
-0.8194276, -0.1614014, -2.186856, 0.7921569, 1, 0, 1,
-0.8193809, 0.06348856, -1.540154, 0.7882353, 1, 0, 1,
-0.8095747, -1.271878, -3.828098, 0.7803922, 1, 0, 1,
-0.8086281, -2.167067, -1.184412, 0.7764706, 1, 0, 1,
-0.8086008, -0.227153, -0.8092741, 0.7686275, 1, 0, 1,
-0.8056231, 0.9905306, -1.197029, 0.7647059, 1, 0, 1,
-0.8054032, -1.09734, -1.295849, 0.7568628, 1, 0, 1,
-0.8049561, 0.6947346, -0.7497993, 0.7529412, 1, 0, 1,
-0.8024521, 1.589982, -3.106349, 0.7450981, 1, 0, 1,
-0.7934974, -0.5752212, -2.014107, 0.7411765, 1, 0, 1,
-0.7877703, -1.178293, -1.579244, 0.7333333, 1, 0, 1,
-0.7834846, -1.886728, -1.81796, 0.7294118, 1, 0, 1,
-0.7773311, -0.9739792, -3.040608, 0.7215686, 1, 0, 1,
-0.7716082, 0.5396076, -3.20492, 0.7176471, 1, 0, 1,
-0.7664775, 0.4655994, -2.265103, 0.7098039, 1, 0, 1,
-0.7638754, 0.06155317, -1.084554, 0.7058824, 1, 0, 1,
-0.7627453, 0.4604907, -1.863289, 0.6980392, 1, 0, 1,
-0.7594975, -0.5587173, -3.505463, 0.6901961, 1, 0, 1,
-0.7530352, -0.441208, -1.178391, 0.6862745, 1, 0, 1,
-0.7451333, 2.644231, 0.5523488, 0.6784314, 1, 0, 1,
-0.7392924, 0.3947539, -1.117681, 0.6745098, 1, 0, 1,
-0.7391779, -0.002097387, -1.163367, 0.6666667, 1, 0, 1,
-0.7330004, 0.1578662, -2.061325, 0.6627451, 1, 0, 1,
-0.73141, -0.1530152, -2.315982, 0.654902, 1, 0, 1,
-0.7312043, 0.3717071, -1.873552, 0.6509804, 1, 0, 1,
-0.7297248, 1.327278, 0.8853271, 0.6431373, 1, 0, 1,
-0.7281112, 0.8492057, -0.6800724, 0.6392157, 1, 0, 1,
-0.7258451, -0.2953676, -1.834801, 0.6313726, 1, 0, 1,
-0.7230973, 0.3015707, -1.455784, 0.627451, 1, 0, 1,
-0.722778, -0.05025835, 0.2135766, 0.6196079, 1, 0, 1,
-0.7176787, 1.768641, 1.784171, 0.6156863, 1, 0, 1,
-0.7176132, -0.8213874, -1.675332, 0.6078432, 1, 0, 1,
-0.7139794, 0.250169, -1.124528, 0.6039216, 1, 0, 1,
-0.712993, -0.3518078, -2.319769, 0.5960785, 1, 0, 1,
-0.7111478, -0.7361829, -2.247957, 0.5882353, 1, 0, 1,
-0.7099255, -0.9974334, -2.27093, 0.5843138, 1, 0, 1,
-0.701602, -0.8152264, -1.642015, 0.5764706, 1, 0, 1,
-0.7007503, 1.556971, -0.02718265, 0.572549, 1, 0, 1,
-0.6974164, 0.8387133, -1.012093, 0.5647059, 1, 0, 1,
-0.6958579, -0.9737317, -2.695892, 0.5607843, 1, 0, 1,
-0.6928782, -0.1775141, -2.136558, 0.5529412, 1, 0, 1,
-0.6849568, -0.2599423, -2.324308, 0.5490196, 1, 0, 1,
-0.6840084, -1.969418, -3.566327, 0.5411765, 1, 0, 1,
-0.6819766, -0.6143178, -2.517443, 0.5372549, 1, 0, 1,
-0.6812326, 0.9754516, 0.3390984, 0.5294118, 1, 0, 1,
-0.6760646, -0.7431751, -1.147386, 0.5254902, 1, 0, 1,
-0.6760308, -0.8901184, -0.9289248, 0.5176471, 1, 0, 1,
-0.6736566, 0.9008234, -1.748078, 0.5137255, 1, 0, 1,
-0.6663467, -1.424439, -1.942636, 0.5058824, 1, 0, 1,
-0.665939, 0.1893258, -1.948345, 0.5019608, 1, 0, 1,
-0.6536489, -0.4356908, -1.210901, 0.4941176, 1, 0, 1,
-0.6517355, 0.2904165, -0.2987202, 0.4862745, 1, 0, 1,
-0.6508339, -2.754412, -2.858578, 0.4823529, 1, 0, 1,
-0.6476419, 1.2011, -0.5974373, 0.4745098, 1, 0, 1,
-0.6440973, 0.3809987, 0.02663975, 0.4705882, 1, 0, 1,
-0.6438869, -0.8028684, -1.42357, 0.4627451, 1, 0, 1,
-0.6420591, 0.874979, -1.064329, 0.4588235, 1, 0, 1,
-0.6397814, 0.05356612, -1.923781, 0.4509804, 1, 0, 1,
-0.6388566, 0.986563, -2.202661, 0.4470588, 1, 0, 1,
-0.6370279, 1.307283, 0.222584, 0.4392157, 1, 0, 1,
-0.63563, 0.2156527, -0.9855333, 0.4352941, 1, 0, 1,
-0.6342862, -0.3507255, -2.331921, 0.427451, 1, 0, 1,
-0.6307005, -0.72661, 0.2716121, 0.4235294, 1, 0, 1,
-0.6259073, -1.111094, -1.957589, 0.4156863, 1, 0, 1,
-0.6240965, -0.9604029, -1.797251, 0.4117647, 1, 0, 1,
-0.6233948, 0.6362829, -1.195201, 0.4039216, 1, 0, 1,
-0.61862, -0.7166551, -1.362087, 0.3960784, 1, 0, 1,
-0.6160561, -1.351873, -2.218652, 0.3921569, 1, 0, 1,
-0.6125196, 1.518423, -0.7911551, 0.3843137, 1, 0, 1,
-0.606906, -2.432961, -1.907841, 0.3803922, 1, 0, 1,
-0.605229, -0.2333165, -2.217252, 0.372549, 1, 0, 1,
-0.6030089, -1.020212, -1.267583, 0.3686275, 1, 0, 1,
-0.5933561, 0.2727425, -0.6636739, 0.3607843, 1, 0, 1,
-0.5894199, 0.5737437, 0.8038331, 0.3568628, 1, 0, 1,
-0.5866824, -0.1426205, -0.8369212, 0.3490196, 1, 0, 1,
-0.5855929, 0.3266998, -2.397628, 0.345098, 1, 0, 1,
-0.5835643, 0.1031709, -1.83695, 0.3372549, 1, 0, 1,
-0.5803358, 0.7932126, -0.2095774, 0.3333333, 1, 0, 1,
-0.5737167, -1.357447, -1.325097, 0.3254902, 1, 0, 1,
-0.5716121, -0.6209938, -2.149434, 0.3215686, 1, 0, 1,
-0.5710711, -0.6402756, -1.806786, 0.3137255, 1, 0, 1,
-0.5680863, 0.5423449, -0.6810758, 0.3098039, 1, 0, 1,
-0.5618024, 0.5366848, 0.4284627, 0.3019608, 1, 0, 1,
-0.5601557, -0.2098993, -2.706178, 0.2941177, 1, 0, 1,
-0.5490027, 0.6664263, 0.5956004, 0.2901961, 1, 0, 1,
-0.545348, 1.195205, -1.050152, 0.282353, 1, 0, 1,
-0.5448013, -0.3751785, -1.077714, 0.2784314, 1, 0, 1,
-0.5442095, -0.03746255, 0.3279888, 0.2705882, 1, 0, 1,
-0.5405192, -0.4178655, -2.734351, 0.2666667, 1, 0, 1,
-0.5387395, 0.5407883, -1.957506, 0.2588235, 1, 0, 1,
-0.5385459, 0.3653177, -0.4126417, 0.254902, 1, 0, 1,
-0.5366674, 0.2683823, -1.784801, 0.2470588, 1, 0, 1,
-0.5343766, 0.0993358, -1.715256, 0.2431373, 1, 0, 1,
-0.5339765, -1.536479, -1.987323, 0.2352941, 1, 0, 1,
-0.5235988, -0.4962046, -3.395324, 0.2313726, 1, 0, 1,
-0.5195021, -0.1541241, -0.1752677, 0.2235294, 1, 0, 1,
-0.5138274, 0.5944161, -0.2054667, 0.2196078, 1, 0, 1,
-0.5070934, 0.6028694, -0.6602484, 0.2117647, 1, 0, 1,
-0.5028331, 1.091681, 0.316277, 0.2078431, 1, 0, 1,
-0.5005112, -0.8903815, -3.053471, 0.2, 1, 0, 1,
-0.493792, 1.191531, -0.2985883, 0.1921569, 1, 0, 1,
-0.4916703, 1.626386, -0.9477932, 0.1882353, 1, 0, 1,
-0.4786506, 1.047177, -0.5812476, 0.1803922, 1, 0, 1,
-0.4784817, 0.6914904, -2.269101, 0.1764706, 1, 0, 1,
-0.4773875, -1.092713, -1.050374, 0.1686275, 1, 0, 1,
-0.4767191, -1.45549, -3.861759, 0.1647059, 1, 0, 1,
-0.4655367, -1.180591, -3.623803, 0.1568628, 1, 0, 1,
-0.4645087, 0.2799481, -2.062384, 0.1529412, 1, 0, 1,
-0.4635963, 2.889663, -2.342507, 0.145098, 1, 0, 1,
-0.4571758, 0.0140917, -2.448527, 0.1411765, 1, 0, 1,
-0.4552129, 0.2220143, -1.513343, 0.1333333, 1, 0, 1,
-0.4503246, 0.1024029, -2.005634, 0.1294118, 1, 0, 1,
-0.4454953, -0.2193577, -2.255556, 0.1215686, 1, 0, 1,
-0.443394, -1.936218, -2.563731, 0.1176471, 1, 0, 1,
-0.4426612, 0.6946121, -1.274823, 0.1098039, 1, 0, 1,
-0.4406294, -0.4593371, -1.939025, 0.1058824, 1, 0, 1,
-0.4393114, 1.225265, 0.7523796, 0.09803922, 1, 0, 1,
-0.4351174, 2.084066, 0.4835416, 0.09019608, 1, 0, 1,
-0.4344836, -0.1627215, -1.228234, 0.08627451, 1, 0, 1,
-0.4322083, -0.2670608, -2.162252, 0.07843138, 1, 0, 1,
-0.4310543, 0.5282785, -0.9035703, 0.07450981, 1, 0, 1,
-0.4304651, -0.142677, -3.469801, 0.06666667, 1, 0, 1,
-0.4288751, -0.2459438, -1.370287, 0.0627451, 1, 0, 1,
-0.4260993, 1.199531, -0.4021962, 0.05490196, 1, 0, 1,
-0.417391, 1.034634, 0.2338397, 0.05098039, 1, 0, 1,
-0.4167819, -0.8916015, -3.077262, 0.04313726, 1, 0, 1,
-0.416768, 1.131196, 1.202751, 0.03921569, 1, 0, 1,
-0.4163509, 0.007304775, -0.8755278, 0.03137255, 1, 0, 1,
-0.4108537, -0.8100159, -1.89201, 0.02745098, 1, 0, 1,
-0.4097169, 0.1428008, -1.558183, 0.01960784, 1, 0, 1,
-0.408687, -1.292977, -1.693398, 0.01568628, 1, 0, 1,
-0.4066079, 1.828088, -1.769095, 0.007843138, 1, 0, 1,
-0.3995124, -0.7954385, -2.446134, 0.003921569, 1, 0, 1,
-0.3976268, 0.009389138, -2.251354, 0, 1, 0.003921569, 1,
-0.3970295, 1.11185, -0.6363368, 0, 1, 0.01176471, 1,
-0.3967602, -0.1691488, -1.783036, 0, 1, 0.01568628, 1,
-0.3899331, -0.8408031, -1.367162, 0, 1, 0.02352941, 1,
-0.3880181, -0.4433471, -1.58849, 0, 1, 0.02745098, 1,
-0.382213, -0.7376068, -2.676335, 0, 1, 0.03529412, 1,
-0.3798719, 0.2066258, -1.117085, 0, 1, 0.03921569, 1,
-0.3791109, 0.9234233, -0.6999027, 0, 1, 0.04705882, 1,
-0.3747265, -0.0424712, -2.519021, 0, 1, 0.05098039, 1,
-0.3725978, 0.9170105, -0.7166704, 0, 1, 0.05882353, 1,
-0.3682046, -1.526283, -3.899623, 0, 1, 0.0627451, 1,
-0.3663875, 1.181709, 0.02433296, 0, 1, 0.07058824, 1,
-0.3654029, -1.54481, -2.534337, 0, 1, 0.07450981, 1,
-0.3647658, 2.10428, 0.2395346, 0, 1, 0.08235294, 1,
-0.3647341, -1.116528, -3.728647, 0, 1, 0.08627451, 1,
-0.3638349, -0.03837226, -3.068937, 0, 1, 0.09411765, 1,
-0.3618119, -1.023443, -4.351049, 0, 1, 0.1019608, 1,
-0.3526254, 0.6971287, -0.9098434, 0, 1, 0.1058824, 1,
-0.3511049, -1.419331, -2.221535, 0, 1, 0.1137255, 1,
-0.349614, 1.437694, 0.1241844, 0, 1, 0.1176471, 1,
-0.3477734, 0.3966795, -0.9235415, 0, 1, 0.1254902, 1,
-0.344376, 0.2335032, 0.1204586, 0, 1, 0.1294118, 1,
-0.3436815, -0.2750168, -2.549959, 0, 1, 0.1372549, 1,
-0.3429783, 0.4347657, -0.7709092, 0, 1, 0.1411765, 1,
-0.3325201, -0.3253372, -1.019458, 0, 1, 0.1490196, 1,
-0.3315006, -0.5453015, -2.346577, 0, 1, 0.1529412, 1,
-0.3309596, -0.3310646, -2.799397, 0, 1, 0.1607843, 1,
-0.3295918, -0.2500689, -2.017074, 0, 1, 0.1647059, 1,
-0.3284743, 0.6758234, 0.7450463, 0, 1, 0.172549, 1,
-0.326878, -1.147268, -2.273026, 0, 1, 0.1764706, 1,
-0.32453, 0.5201062, -2.617909, 0, 1, 0.1843137, 1,
-0.324481, 0.007841823, -2.190095, 0, 1, 0.1882353, 1,
-0.3181183, -0.8131177, -3.557804, 0, 1, 0.1960784, 1,
-0.3155706, 0.1536852, -2.108757, 0, 1, 0.2039216, 1,
-0.3133362, 0.4149036, -1.336211, 0, 1, 0.2078431, 1,
-0.3129698, -0.01555239, -0.8676623, 0, 1, 0.2156863, 1,
-0.3121467, 0.8802013, -0.1998397, 0, 1, 0.2196078, 1,
-0.3091934, 0.5037038, 1.208787, 0, 1, 0.227451, 1,
-0.3077604, 0.5142385, -0.5595144, 0, 1, 0.2313726, 1,
-0.3064738, 0.3209409, 0.294504, 0, 1, 0.2392157, 1,
-0.3063139, 0.1043203, 1.132612, 0, 1, 0.2431373, 1,
-0.3060679, 1.556604, -0.3052077, 0, 1, 0.2509804, 1,
-0.3050424, 2.589608, -0.1701787, 0, 1, 0.254902, 1,
-0.3036245, -0.375772, -2.76717, 0, 1, 0.2627451, 1,
-0.3032233, 0.1160467, -1.348788, 0, 1, 0.2666667, 1,
-0.303212, -1.493021, -2.719041, 0, 1, 0.2745098, 1,
-0.3031985, -1.544632, -2.669794, 0, 1, 0.2784314, 1,
-0.2991418, -0.5657305, -1.476608, 0, 1, 0.2862745, 1,
-0.2941984, -0.6666327, -2.246937, 0, 1, 0.2901961, 1,
-0.2857432, 1.509752, -1.325299, 0, 1, 0.2980392, 1,
-0.2854725, 1.078112, 0.1980487, 0, 1, 0.3058824, 1,
-0.284832, -1.029704, -3.096293, 0, 1, 0.3098039, 1,
-0.2764232, 0.08114948, -1.306033, 0, 1, 0.3176471, 1,
-0.2762354, 0.580204, -0.7226674, 0, 1, 0.3215686, 1,
-0.2711478, 1.751001, 1.544043, 0, 1, 0.3294118, 1,
-0.2691187, 0.5212159, -1.574421, 0, 1, 0.3333333, 1,
-0.2669255, 0.451706, -0.6537529, 0, 1, 0.3411765, 1,
-0.2662489, -1.388506, -2.742219, 0, 1, 0.345098, 1,
-0.259441, -0.09276643, -1.013661, 0, 1, 0.3529412, 1,
-0.2591317, 0.7254098, -1.446089, 0, 1, 0.3568628, 1,
-0.258485, -0.1542855, -2.65671, 0, 1, 0.3647059, 1,
-0.2577827, -0.8233202, -3.17767, 0, 1, 0.3686275, 1,
-0.2566259, -1.337435, -2.747216, 0, 1, 0.3764706, 1,
-0.2539424, -0.7338312, -0.9664977, 0, 1, 0.3803922, 1,
-0.2529666, -0.6607993, -2.152921, 0, 1, 0.3882353, 1,
-0.2453893, 0.07873509, -2.829584, 0, 1, 0.3921569, 1,
-0.2418351, -1.211187, -3.642833, 0, 1, 0.4, 1,
-0.2302203, -0.1709432, -2.066132, 0, 1, 0.4078431, 1,
-0.2249689, -0.06585065, -1.661618, 0, 1, 0.4117647, 1,
-0.2247575, -1.280951, -2.507932, 0, 1, 0.4196078, 1,
-0.2241939, -1.209484, -2.666783, 0, 1, 0.4235294, 1,
-0.2231567, -1.031754, -2.517355, 0, 1, 0.4313726, 1,
-0.218668, -0.339166, -2.560675, 0, 1, 0.4352941, 1,
-0.2149669, 0.239418, -0.3709873, 0, 1, 0.4431373, 1,
-0.2104602, -1.527673, -3.366124, 0, 1, 0.4470588, 1,
-0.2078916, -0.2267124, -2.256073, 0, 1, 0.454902, 1,
-0.2064165, 1.578967, 2.431729, 0, 1, 0.4588235, 1,
-0.2037834, 0.1699125, -0.1996888, 0, 1, 0.4666667, 1,
-0.2032237, -1.758147, -2.588208, 0, 1, 0.4705882, 1,
-0.2030385, -0.497922, -3.077329, 0, 1, 0.4784314, 1,
-0.2021758, 0.955182, -2.851143, 0, 1, 0.4823529, 1,
-0.2016507, 1.047529, -0.6676278, 0, 1, 0.4901961, 1,
-0.1863656, -0.7675964, -0.7738039, 0, 1, 0.4941176, 1,
-0.1854542, -0.3724957, -1.33229, 0, 1, 0.5019608, 1,
-0.1849381, 0.7304653, 0.007457044, 0, 1, 0.509804, 1,
-0.1841234, -0.1164704, -1.144618, 0, 1, 0.5137255, 1,
-0.1839936, 0.8766975, -2.069712, 0, 1, 0.5215687, 1,
-0.1836158, 1.612107, -0.8716571, 0, 1, 0.5254902, 1,
-0.183178, 1.422151, 1.321584, 0, 1, 0.5333334, 1,
-0.1824232, 0.6612888, -0.03875536, 0, 1, 0.5372549, 1,
-0.1819225, 0.05567632, -2.104821, 0, 1, 0.5450981, 1,
-0.1798622, 0.9587202, 0.7306269, 0, 1, 0.5490196, 1,
-0.179259, 0.986912, 0.4733186, 0, 1, 0.5568628, 1,
-0.1781735, -0.4084655, -3.642113, 0, 1, 0.5607843, 1,
-0.1775422, 0.7353879, 0.9049401, 0, 1, 0.5686275, 1,
-0.1770593, 0.6677477, -0.6813433, 0, 1, 0.572549, 1,
-0.1745268, -2.015631, -3.925816, 0, 1, 0.5803922, 1,
-0.1695485, 0.8000776, 0.4529404, 0, 1, 0.5843138, 1,
-0.1693387, 0.01213278, -0.7652333, 0, 1, 0.5921569, 1,
-0.1692862, 0.8004394, -0.9369619, 0, 1, 0.5960785, 1,
-0.1676558, 0.991892, -1.318829, 0, 1, 0.6039216, 1,
-0.166948, -0.8358438, -3.046637, 0, 1, 0.6117647, 1,
-0.1667553, 0.08595288, -1.058707, 0, 1, 0.6156863, 1,
-0.1661928, -0.3883424, -4.058308, 0, 1, 0.6235294, 1,
-0.1656777, -0.6161522, -6.099543, 0, 1, 0.627451, 1,
-0.1647754, 0.1502809, -1.712438, 0, 1, 0.6352941, 1,
-0.1636253, -1.233147, -1.273573, 0, 1, 0.6392157, 1,
-0.163349, 0.6475674, -1.015894, 0, 1, 0.6470588, 1,
-0.1591167, -0.1279364, -3.397148, 0, 1, 0.6509804, 1,
-0.156918, -0.448884, -4.63105, 0, 1, 0.6588235, 1,
-0.1534986, 1.187508, -1.17504, 0, 1, 0.6627451, 1,
-0.1505918, 1.401908, -0.3535765, 0, 1, 0.6705883, 1,
-0.1454362, 0.6872426, 1.005976, 0, 1, 0.6745098, 1,
-0.1435172, -0.1410842, -2.079491, 0, 1, 0.682353, 1,
-0.1433327, -0.03478024, -1.379599, 0, 1, 0.6862745, 1,
-0.1414028, -0.4923729, -3.337086, 0, 1, 0.6941177, 1,
-0.141036, -0.6326821, -2.903324, 0, 1, 0.7019608, 1,
-0.1401256, -0.8306746, -2.033705, 0, 1, 0.7058824, 1,
-0.1391093, 0.6635367, 0.4493437, 0, 1, 0.7137255, 1,
-0.1379783, 1.741077, -0.8746772, 0, 1, 0.7176471, 1,
-0.1376925, 0.4164184, -1.879668, 0, 1, 0.7254902, 1,
-0.1287275, 0.5599418, -1.092554, 0, 1, 0.7294118, 1,
-0.1159487, 0.7420778, -0.7777291, 0, 1, 0.7372549, 1,
-0.11501, 0.8364583, -0.3605697, 0, 1, 0.7411765, 1,
-0.1141186, 0.151537, -0.1925734, 0, 1, 0.7490196, 1,
-0.1140729, 1.454885, 1.086917, 0, 1, 0.7529412, 1,
-0.1084409, 0.9425752, 0.9558415, 0, 1, 0.7607843, 1,
-0.09809306, 1.215881, 0.2382875, 0, 1, 0.7647059, 1,
-0.09677064, -0.1058536, -2.043459, 0, 1, 0.772549, 1,
-0.09476265, -1.188882, -3.183372, 0, 1, 0.7764706, 1,
-0.09473149, 0.2781564, 0.3969686, 0, 1, 0.7843137, 1,
-0.09052829, -0.1286634, -3.296457, 0, 1, 0.7882353, 1,
-0.08655084, 0.6314458, -0.09893657, 0, 1, 0.7960784, 1,
-0.08416199, -1.35302, -2.5106, 0, 1, 0.8039216, 1,
-0.08216286, -0.364467, -4.294066, 0, 1, 0.8078431, 1,
-0.08186354, 1.126011, -0.9400976, 0, 1, 0.8156863, 1,
-0.07988228, 0.9012461, 0.5107534, 0, 1, 0.8196079, 1,
-0.07880238, 0.1040566, -1.362979, 0, 1, 0.827451, 1,
-0.07867331, 1.840266, -0.7984624, 0, 1, 0.8313726, 1,
-0.07389659, -0.1384087, -1.773633, 0, 1, 0.8392157, 1,
-0.07058891, -1.412974, -1.45406, 0, 1, 0.8431373, 1,
-0.0670876, 1.450267, 0.09242815, 0, 1, 0.8509804, 1,
-0.06320269, -1.383542, -3.812776, 0, 1, 0.854902, 1,
-0.05983004, -0.8849586, -2.987876, 0, 1, 0.8627451, 1,
-0.05901291, -2.697902, -3.810616, 0, 1, 0.8666667, 1,
-0.05713865, -0.4326795, -1.394473, 0, 1, 0.8745098, 1,
-0.05403004, -0.1783691, -2.231602, 0, 1, 0.8784314, 1,
-0.05323378, -0.6368067, -5.089863, 0, 1, 0.8862745, 1,
-0.04686737, 0.2312457, 0.450733, 0, 1, 0.8901961, 1,
-0.04559756, 1.153252, -0.7017567, 0, 1, 0.8980392, 1,
-0.04110032, -2.65582, -3.181351, 0, 1, 0.9058824, 1,
-0.04014912, -0.2568849, -3.115575, 0, 1, 0.9098039, 1,
-0.03985278, 1.790282, -0.4264091, 0, 1, 0.9176471, 1,
-0.0346941, 1.118708, 0.3660675, 0, 1, 0.9215686, 1,
-0.02987599, 1.337024, -1.222441, 0, 1, 0.9294118, 1,
-0.0284663, 0.3196079, -1.570696, 0, 1, 0.9333333, 1,
-0.02838097, 2.053528, 0.3028327, 0, 1, 0.9411765, 1,
-0.02551805, -0.7507325, -3.616542, 0, 1, 0.945098, 1,
-0.02035875, -1.032162, -4.493215, 0, 1, 0.9529412, 1,
-0.01837749, -0.4011096, -3.832469, 0, 1, 0.9568627, 1,
-0.01749338, -1.480011, -2.715827, 0, 1, 0.9647059, 1,
-0.01658827, -0.2782416, -4.537249, 0, 1, 0.9686275, 1,
-0.005801936, 0.3298343, 0.6782367, 0, 1, 0.9764706, 1,
-0.003864997, -1.152578, -3.27976, 0, 1, 0.9803922, 1,
-0.002666139, -0.1362199, -4.41672, 0, 1, 0.9882353, 1,
-0.0003757693, -0.209891, -4.091232, 0, 1, 0.9921569, 1,
0.000133949, 1.878666, 0.5404978, 0, 1, 1, 1,
0.0007014937, -0.9255635, 3.693889, 0, 0.9921569, 1, 1,
0.001444643, -2.477367, 3.432646, 0, 0.9882353, 1, 1,
0.002807842, 0.8278243, 0.06849851, 0, 0.9803922, 1, 1,
0.006743495, 1.322113, 0.5733953, 0, 0.9764706, 1, 1,
0.008905249, -0.1430355, 2.813489, 0, 0.9686275, 1, 1,
0.01187491, 1.530563, -1.903633, 0, 0.9647059, 1, 1,
0.01408461, 0.142425, 1.439203, 0, 0.9568627, 1, 1,
0.01649103, 0.4465357, 0.1570087, 0, 0.9529412, 1, 1,
0.01930933, -0.3480285, 3.373877, 0, 0.945098, 1, 1,
0.02214707, 0.02632752, 1.297191, 0, 0.9411765, 1, 1,
0.02439787, -0.2516471, 1.745028, 0, 0.9333333, 1, 1,
0.03377008, 1.047302, 2.014396, 0, 0.9294118, 1, 1,
0.03443975, 0.8314521, -0.8343872, 0, 0.9215686, 1, 1,
0.03462227, 2.629732, 0.4397984, 0, 0.9176471, 1, 1,
0.03561846, 0.07215512, 1.124075, 0, 0.9098039, 1, 1,
0.0394774, -1.065766, 3.517045, 0, 0.9058824, 1, 1,
0.04167735, -0.3721994, 2.449367, 0, 0.8980392, 1, 1,
0.04259698, 0.1820051, 0.1212832, 0, 0.8901961, 1, 1,
0.04266578, 0.7570221, -0.06497642, 0, 0.8862745, 1, 1,
0.04412483, -0.3393883, 3.346547, 0, 0.8784314, 1, 1,
0.04569072, -0.0441037, 0.4939128, 0, 0.8745098, 1, 1,
0.04994656, 0.7045576, 0.3853879, 0, 0.8666667, 1, 1,
0.05108076, 1.053825, 1.165319, 0, 0.8627451, 1, 1,
0.05198098, -0.8027125, 3.415857, 0, 0.854902, 1, 1,
0.05202292, 1.243658, -0.03704558, 0, 0.8509804, 1, 1,
0.05303736, -1.687107, 4.612059, 0, 0.8431373, 1, 1,
0.05331019, -0.901354, 4.400873, 0, 0.8392157, 1, 1,
0.0545003, -0.6885985, 4.090253, 0, 0.8313726, 1, 1,
0.05613124, -0.6592133, 1.859373, 0, 0.827451, 1, 1,
0.06633733, 0.9854786, 1.853262, 0, 0.8196079, 1, 1,
0.06715705, -0.8425573, 3.61616, 0, 0.8156863, 1, 1,
0.07006807, 0.2121831, 2.918932, 0, 0.8078431, 1, 1,
0.07140195, -0.2429817, 2.941616, 0, 0.8039216, 1, 1,
0.07354153, 0.3036785, 0.1874685, 0, 0.7960784, 1, 1,
0.07592715, 0.2439533, 0.2389136, 0, 0.7882353, 1, 1,
0.07616652, 1.091689, -0.3341801, 0, 0.7843137, 1, 1,
0.08134089, 0.1208026, 2.819403, 0, 0.7764706, 1, 1,
0.08157419, 1.157374, 0.6750324, 0, 0.772549, 1, 1,
0.08495359, 0.4126193, -0.3420528, 0, 0.7647059, 1, 1,
0.08734199, -0.3797044, 4.552593, 0, 0.7607843, 1, 1,
0.08846658, -0.4785079, 1.908419, 0, 0.7529412, 1, 1,
0.0893779, -1.635366, 3.741783, 0, 0.7490196, 1, 1,
0.0914184, -0.7620377, 3.149382, 0, 0.7411765, 1, 1,
0.09243886, -1.392077, 2.652508, 0, 0.7372549, 1, 1,
0.09486886, -1.676731, 3.169726, 0, 0.7294118, 1, 1,
0.09819262, 0.4848712, 1.157237, 0, 0.7254902, 1, 1,
0.1021547, -0.3281035, 4.128221, 0, 0.7176471, 1, 1,
0.1060277, 1.511701, 0.709996, 0, 0.7137255, 1, 1,
0.1084964, 0.1200247, 0.3521975, 0, 0.7058824, 1, 1,
0.1090976, 0.346033, -0.1146804, 0, 0.6980392, 1, 1,
0.1099634, -1.162108, 1.999848, 0, 0.6941177, 1, 1,
0.1132483, -0.4411746, 2.562295, 0, 0.6862745, 1, 1,
0.1150408, -0.4911255, 2.499563, 0, 0.682353, 1, 1,
0.1182896, 0.4064043, -0.1625587, 0, 0.6745098, 1, 1,
0.1272809, -0.144032, 2.30261, 0, 0.6705883, 1, 1,
0.1279802, -0.4614275, 2.239083, 0, 0.6627451, 1, 1,
0.1296755, 0.4528238, 0.4502754, 0, 0.6588235, 1, 1,
0.1317368, 1.389989, -0.07980202, 0, 0.6509804, 1, 1,
0.1328352, 0.1695118, 0.2400786, 0, 0.6470588, 1, 1,
0.1361198, -1.402372, 2.273041, 0, 0.6392157, 1, 1,
0.1375707, 0.3418812, -0.03484913, 0, 0.6352941, 1, 1,
0.1384106, -0.3903688, 3.524711, 0, 0.627451, 1, 1,
0.1391436, 0.8787956, 1.728747, 0, 0.6235294, 1, 1,
0.1410775, -0.4415611, 2.780358, 0, 0.6156863, 1, 1,
0.1418392, 1.513832, 0.7835854, 0, 0.6117647, 1, 1,
0.1422165, 0.894502, -0.09010749, 0, 0.6039216, 1, 1,
0.1505912, 1.757482, -0.7985653, 0, 0.5960785, 1, 1,
0.1514081, -0.3999484, 3.764619, 0, 0.5921569, 1, 1,
0.154307, -1.805481, 2.869979, 0, 0.5843138, 1, 1,
0.1547114, 0.5659755, -1.170449, 0, 0.5803922, 1, 1,
0.1581272, -1.576679, 3.408305, 0, 0.572549, 1, 1,
0.16324, 0.2341762, 1.541547, 0, 0.5686275, 1, 1,
0.1680999, 0.3545477, 0.5291266, 0, 0.5607843, 1, 1,
0.1689984, -0.3287717, 4.100784, 0, 0.5568628, 1, 1,
0.1708175, -0.2497929, 1.154611, 0, 0.5490196, 1, 1,
0.1732307, -1.724709, 4.016816, 0, 0.5450981, 1, 1,
0.1753599, 0.06803568, -0.1470977, 0, 0.5372549, 1, 1,
0.1794768, -0.1555176, 3.381627, 0, 0.5333334, 1, 1,
0.1830604, 0.7834534, 0.2366545, 0, 0.5254902, 1, 1,
0.1843944, 0.8289037, 1.339986, 0, 0.5215687, 1, 1,
0.1865492, 1.797921, 0.6244478, 0, 0.5137255, 1, 1,
0.1868837, -0.04914561, -0.05167192, 0, 0.509804, 1, 1,
0.1887954, -0.05991873, 0.3454286, 0, 0.5019608, 1, 1,
0.189933, -1.243654, 1.512039, 0, 0.4941176, 1, 1,
0.1907382, -0.2910455, 3.439026, 0, 0.4901961, 1, 1,
0.1944143, -0.7188922, 5.157862, 0, 0.4823529, 1, 1,
0.1972596, 1.045112, -0.7368762, 0, 0.4784314, 1, 1,
0.1977959, 0.3832506, -0.05734164, 0, 0.4705882, 1, 1,
0.1988656, 2.123137, 0.03282352, 0, 0.4666667, 1, 1,
0.2010609, -1.27967, 2.456139, 0, 0.4588235, 1, 1,
0.2098851, 0.9110855, 2.221688, 0, 0.454902, 1, 1,
0.210353, -0.09206255, 1.356109, 0, 0.4470588, 1, 1,
0.2142715, 1.012341, -0.4126278, 0, 0.4431373, 1, 1,
0.2143956, -0.3191267, 1.49689, 0, 0.4352941, 1, 1,
0.2150492, -0.6481311, 4.794713, 0, 0.4313726, 1, 1,
0.2170386, 2.168445, -0.889003, 0, 0.4235294, 1, 1,
0.2186358, -0.6129807, 3.704563, 0, 0.4196078, 1, 1,
0.2226913, 1.735388, 0.271966, 0, 0.4117647, 1, 1,
0.2250728, 1.553027, -0.6736533, 0, 0.4078431, 1, 1,
0.2274611, -0.4570898, 1.151063, 0, 0.4, 1, 1,
0.2337311, -0.6509772, 3.426401, 0, 0.3921569, 1, 1,
0.2361384, -1.794376, 3.405735, 0, 0.3882353, 1, 1,
0.2364166, 2.046436, 0.2057294, 0, 0.3803922, 1, 1,
0.2381934, 0.2305802, 1.421885, 0, 0.3764706, 1, 1,
0.2389016, 0.06128729, 1.826668, 0, 0.3686275, 1, 1,
0.2409769, -0.5894461, 3.232349, 0, 0.3647059, 1, 1,
0.2432766, -0.6400459, 3.060028, 0, 0.3568628, 1, 1,
0.2435169, 0.1543603, 2.115373, 0, 0.3529412, 1, 1,
0.2447594, 1.923775, 0.3690006, 0, 0.345098, 1, 1,
0.2491437, -1.141148, 2.212011, 0, 0.3411765, 1, 1,
0.2492713, -1.370619, 3.909982, 0, 0.3333333, 1, 1,
0.2501698, -0.6922354, 1.376311, 0, 0.3294118, 1, 1,
0.2663918, -1.358406, 4.49603, 0, 0.3215686, 1, 1,
0.2688931, -0.4575352, 2.119136, 0, 0.3176471, 1, 1,
0.2746574, -1.304435, 2.110997, 0, 0.3098039, 1, 1,
0.2784092, -0.4459522, 4.046422, 0, 0.3058824, 1, 1,
0.2867675, 1.249611, 1.38678, 0, 0.2980392, 1, 1,
0.2896907, 0.534728, 0.3449936, 0, 0.2901961, 1, 1,
0.2929866, -1.108715, 3.184381, 0, 0.2862745, 1, 1,
0.2947052, -0.01320431, 2.102314, 0, 0.2784314, 1, 1,
0.2951035, -0.1658588, 2.972156, 0, 0.2745098, 1, 1,
0.2961259, -0.8440719, 1.725247, 0, 0.2666667, 1, 1,
0.2983743, 0.3017972, 0.7800853, 0, 0.2627451, 1, 1,
0.3126341, -1.975267, 3.793421, 0, 0.254902, 1, 1,
0.3131253, -1.20414, 4.865036, 0, 0.2509804, 1, 1,
0.3151268, 0.1264637, -0.1913983, 0, 0.2431373, 1, 1,
0.3218544, 0.9891587, 1.086106, 0, 0.2392157, 1, 1,
0.3261756, 1.394107, -1.11363, 0, 0.2313726, 1, 1,
0.3278752, -0.4269818, 2.500922, 0, 0.227451, 1, 1,
0.3280677, 0.565791, 1.013384, 0, 0.2196078, 1, 1,
0.3282251, 0.9036355, 0.7083504, 0, 0.2156863, 1, 1,
0.3322989, -0.8600172, 1.588007, 0, 0.2078431, 1, 1,
0.3352979, 1.288666, 0.9701647, 0, 0.2039216, 1, 1,
0.3392665, -0.750105, 2.766628, 0, 0.1960784, 1, 1,
0.3404372, 1.511089, -0.05539483, 0, 0.1882353, 1, 1,
0.3448787, -0.7237134, 1.227336, 0, 0.1843137, 1, 1,
0.3461411, -0.3969361, 1.222181, 0, 0.1764706, 1, 1,
0.3474614, -1.036184, 1.218483, 0, 0.172549, 1, 1,
0.3481216, -0.2120363, 0.755325, 0, 0.1647059, 1, 1,
0.3498969, -0.9429829, 4.172721, 0, 0.1607843, 1, 1,
0.3542431, 1.092586, 1.741458, 0, 0.1529412, 1, 1,
0.3565587, 0.6861802, 0.1966664, 0, 0.1490196, 1, 1,
0.3578195, -0.5275611, 2.933493, 0, 0.1411765, 1, 1,
0.3631058, 1.862097, 1.888163, 0, 0.1372549, 1, 1,
0.3656243, 0.2117593, 0.4343275, 0, 0.1294118, 1, 1,
0.3677724, 0.5471157, 0.6414534, 0, 0.1254902, 1, 1,
0.3677824, 1.460987, 1.247587, 0, 0.1176471, 1, 1,
0.3694953, -0.3368963, 2.229143, 0, 0.1137255, 1, 1,
0.3739453, -0.2947738, 1.94077, 0, 0.1058824, 1, 1,
0.3754379, 0.09650794, 1.70542, 0, 0.09803922, 1, 1,
0.3823444, -0.1620308, 1.699468, 0, 0.09411765, 1, 1,
0.3852428, 0.3208953, 0.3210064, 0, 0.08627451, 1, 1,
0.392948, 0.4355089, 0.5298587, 0, 0.08235294, 1, 1,
0.404807, 0.1223967, 0.562012, 0, 0.07450981, 1, 1,
0.405764, 0.7903073, 1.11922, 0, 0.07058824, 1, 1,
0.4098528, -0.9030941, 2.395384, 0, 0.0627451, 1, 1,
0.4118642, 1.497744, 0.7817311, 0, 0.05882353, 1, 1,
0.4137251, 1.026145, 0.4824305, 0, 0.05098039, 1, 1,
0.4142081, 2.476971, -1.071438, 0, 0.04705882, 1, 1,
0.4162101, 0.9549476, 1.380703, 0, 0.03921569, 1, 1,
0.4189835, 1.263838, -0.895884, 0, 0.03529412, 1, 1,
0.4263692, 0.8306439, -2.419723, 0, 0.02745098, 1, 1,
0.4277761, -0.5213369, 3.418901, 0, 0.02352941, 1, 1,
0.4307209, -0.6501014, 0.9735816, 0, 0.01568628, 1, 1,
0.435122, -0.0004602182, 3.434777, 0, 0.01176471, 1, 1,
0.452314, -0.5048554, 3.329132, 0, 0.003921569, 1, 1,
0.4524537, -0.765272, 2.571243, 0.003921569, 0, 1, 1,
0.4549578, -0.2055661, 2.452481, 0.007843138, 0, 1, 1,
0.4558053, -0.2681148, 1.020492, 0.01568628, 0, 1, 1,
0.45884, 0.1967199, 0.1293534, 0.01960784, 0, 1, 1,
0.4643117, 0.3794994, 0.1038968, 0.02745098, 0, 1, 1,
0.4710534, 0.01895651, -0.5185802, 0.03137255, 0, 1, 1,
0.4724466, -0.166116, 0.6050887, 0.03921569, 0, 1, 1,
0.472551, 0.8394145, 1.647863, 0.04313726, 0, 1, 1,
0.473628, 3.110189, 0.06756541, 0.05098039, 0, 1, 1,
0.4773501, 0.6225676, 0.3036215, 0.05490196, 0, 1, 1,
0.4781986, 0.08972659, 0.6091035, 0.0627451, 0, 1, 1,
0.4809402, 0.3460564, 2.258957, 0.06666667, 0, 1, 1,
0.4887061, -0.1056916, 2.465507, 0.07450981, 0, 1, 1,
0.489991, 1.367151, 1.554425, 0.07843138, 0, 1, 1,
0.4915174, 0.05092659, 1.516191, 0.08627451, 0, 1, 1,
0.4937704, -0.1218922, 1.615304, 0.09019608, 0, 1, 1,
0.5091146, 0.5764057, 2.14738, 0.09803922, 0, 1, 1,
0.5154306, -1.42478, 2.579829, 0.1058824, 0, 1, 1,
0.5255978, -0.3743101, -0.7074307, 0.1098039, 0, 1, 1,
0.52945, 0.3804356, 2.188522, 0.1176471, 0, 1, 1,
0.5297443, -0.2941169, 2.778192, 0.1215686, 0, 1, 1,
0.537343, 1.514839, 1.219373, 0.1294118, 0, 1, 1,
0.5414646, 0.557027, -1.570104, 0.1333333, 0, 1, 1,
0.5444309, -0.8545679, 3.024329, 0.1411765, 0, 1, 1,
0.551567, 0.8040277, 1.552579, 0.145098, 0, 1, 1,
0.5540223, -0.1575474, 1.271114, 0.1529412, 0, 1, 1,
0.5560356, 0.2867151, 0.8931395, 0.1568628, 0, 1, 1,
0.5560378, -0.9167452, 2.910608, 0.1647059, 0, 1, 1,
0.5567387, 1.792293, 0.6957867, 0.1686275, 0, 1, 1,
0.558899, 0.5879207, 2.330125, 0.1764706, 0, 1, 1,
0.5604507, 1.966347, -0.3442847, 0.1803922, 0, 1, 1,
0.5606581, -0.8988886, 3.238697, 0.1882353, 0, 1, 1,
0.5686709, -1.32142, 2.699709, 0.1921569, 0, 1, 1,
0.5693648, 0.1150652, 2.190253, 0.2, 0, 1, 1,
0.5693784, 0.5788394, -0.1236108, 0.2078431, 0, 1, 1,
0.5719913, -0.7138359, 3.745819, 0.2117647, 0, 1, 1,
0.5761449, 0.8732662, 0.7936251, 0.2196078, 0, 1, 1,
0.5929368, 0.1688356, 0.2720777, 0.2235294, 0, 1, 1,
0.5963848, -1.727734, 2.927226, 0.2313726, 0, 1, 1,
0.5972716, -0.8193817, 1.280433, 0.2352941, 0, 1, 1,
0.5992678, 0.7658467, 0.8242511, 0.2431373, 0, 1, 1,
0.6024114, 0.8699279, 1.14811, 0.2470588, 0, 1, 1,
0.6024383, -0.389573, 2.76468, 0.254902, 0, 1, 1,
0.6040907, 2.210224, -1.323748, 0.2588235, 0, 1, 1,
0.6105873, -2.047505, 2.466037, 0.2666667, 0, 1, 1,
0.617285, -0.5719542, 2.528087, 0.2705882, 0, 1, 1,
0.6192015, 1.245129, 1.494291, 0.2784314, 0, 1, 1,
0.6194957, 1.298874, 1.238564, 0.282353, 0, 1, 1,
0.6268921, 0.860632, 1.115849, 0.2901961, 0, 1, 1,
0.6286054, 2.190089, 2.83065, 0.2941177, 0, 1, 1,
0.6308772, 1.30803, 0.4403523, 0.3019608, 0, 1, 1,
0.6339298, 1.090964, -0.9731505, 0.3098039, 0, 1, 1,
0.6389994, -0.3033895, 2.611999, 0.3137255, 0, 1, 1,
0.6394736, -0.4965818, 3.457204, 0.3215686, 0, 1, 1,
0.6395125, 2.588599, -0.4107192, 0.3254902, 0, 1, 1,
0.6399887, 0.2239174, 1.008595, 0.3333333, 0, 1, 1,
0.642103, -1.769055, 2.844872, 0.3372549, 0, 1, 1,
0.6461931, 0.6290383, -1.068648, 0.345098, 0, 1, 1,
0.6464214, -0.1191257, 2.397735, 0.3490196, 0, 1, 1,
0.6477859, -0.3884578, 2.651567, 0.3568628, 0, 1, 1,
0.6493561, -0.1017377, 0.7650196, 0.3607843, 0, 1, 1,
0.6540895, 0.05722275, 0.272864, 0.3686275, 0, 1, 1,
0.6587682, 1.177238, -0.5075682, 0.372549, 0, 1, 1,
0.6590517, -1.767713, 0.9334511, 0.3803922, 0, 1, 1,
0.661185, 0.5880198, -0.3098615, 0.3843137, 0, 1, 1,
0.6646791, -0.1900496, 0.5359604, 0.3921569, 0, 1, 1,
0.6715039, -0.3697514, 4.751594, 0.3960784, 0, 1, 1,
0.6720259, 0.8428767, 1.552159, 0.4039216, 0, 1, 1,
0.6732549, -0.5003877, 3.385034, 0.4117647, 0, 1, 1,
0.6788206, -1.4831, 1.912862, 0.4156863, 0, 1, 1,
0.6824505, 0.5149911, 1.416378, 0.4235294, 0, 1, 1,
0.6826141, 1.089989, 0.675792, 0.427451, 0, 1, 1,
0.6826559, -1.435529, 1.363136, 0.4352941, 0, 1, 1,
0.6961207, 0.425152, 2.178203, 0.4392157, 0, 1, 1,
0.6963054, 1.877222, 0.2870309, 0.4470588, 0, 1, 1,
0.6995625, -2.286229, 1.379619, 0.4509804, 0, 1, 1,
0.6998122, -0.5206029, 1.945477, 0.4588235, 0, 1, 1,
0.7067568, -1.376487, 1.220974, 0.4627451, 0, 1, 1,
0.7077048, -1.974164, 1.391029, 0.4705882, 0, 1, 1,
0.7165527, 0.7301297, 0.6124154, 0.4745098, 0, 1, 1,
0.7190666, -0.09317819, 1.908926, 0.4823529, 0, 1, 1,
0.7302707, -2.276837, 2.343433, 0.4862745, 0, 1, 1,
0.7358689, 0.6379799, 0.7339916, 0.4941176, 0, 1, 1,
0.7406704, -0.5983045, 2.641778, 0.5019608, 0, 1, 1,
0.7430437, 0.8669493, 0.8910277, 0.5058824, 0, 1, 1,
0.7440308, -1.426849, 2.561102, 0.5137255, 0, 1, 1,
0.7442165, -0.6001465, 1.903001, 0.5176471, 0, 1, 1,
0.7487105, -0.2936055, 1.45273, 0.5254902, 0, 1, 1,
0.7491848, -0.6651515, 2.350762, 0.5294118, 0, 1, 1,
0.751369, 0.6453024, 2.568638, 0.5372549, 0, 1, 1,
0.7597563, 0.2705304, 1.205514, 0.5411765, 0, 1, 1,
0.7610706, 0.1302605, 2.064051, 0.5490196, 0, 1, 1,
0.7645759, -1.852504, 5.412845, 0.5529412, 0, 1, 1,
0.7650051, -1.136292, 2.076865, 0.5607843, 0, 1, 1,
0.7661541, 0.5521627, 1.660835, 0.5647059, 0, 1, 1,
0.774531, 0.4091798, 0.5620196, 0.572549, 0, 1, 1,
0.7767217, 1.875741, 1.543239, 0.5764706, 0, 1, 1,
0.7824386, 0.6531181, -0.6771894, 0.5843138, 0, 1, 1,
0.7836462, 0.2593666, 0.4610862, 0.5882353, 0, 1, 1,
0.789569, 0.3695457, 1.416111, 0.5960785, 0, 1, 1,
0.7895954, 1.473031, -0.2901849, 0.6039216, 0, 1, 1,
0.8001701, -0.01956022, -0.3525695, 0.6078432, 0, 1, 1,
0.8003772, 0.5304552, -0.4260007, 0.6156863, 0, 1, 1,
0.8015891, 0.09235045, 1.17463, 0.6196079, 0, 1, 1,
0.8061486, -0.4832485, 1.350545, 0.627451, 0, 1, 1,
0.8139057, -0.8506928, 2.113884, 0.6313726, 0, 1, 1,
0.8157297, -1.004265, 2.561013, 0.6392157, 0, 1, 1,
0.8184075, -0.3448195, 3.945425, 0.6431373, 0, 1, 1,
0.8235867, 2.973709, 1.464039, 0.6509804, 0, 1, 1,
0.8263556, -1.033643, 2.291624, 0.654902, 0, 1, 1,
0.8315902, -0.1916782, 2.265424, 0.6627451, 0, 1, 1,
0.8319181, 1.000462, -1.367823, 0.6666667, 0, 1, 1,
0.8326684, 3.122491, -1.402466, 0.6745098, 0, 1, 1,
0.8337932, 0.5413474, -0.2287212, 0.6784314, 0, 1, 1,
0.8368548, 0.4965009, 1.639973, 0.6862745, 0, 1, 1,
0.8420382, -0.3117639, 2.057471, 0.6901961, 0, 1, 1,
0.8426644, -0.2844037, 2.798447, 0.6980392, 0, 1, 1,
0.8457919, -0.5010039, 2.083395, 0.7058824, 0, 1, 1,
0.846532, 0.1133139, 2.127377, 0.7098039, 0, 1, 1,
0.8469948, 0.7058254, 1.062908, 0.7176471, 0, 1, 1,
0.8471181, 0.009937467, 0.84771, 0.7215686, 0, 1, 1,
0.8508971, -0.3029277, 2.488657, 0.7294118, 0, 1, 1,
0.8518085, 0.6444058, -0.7145361, 0.7333333, 0, 1, 1,
0.8585474, 0.5126876, 0.9092851, 0.7411765, 0, 1, 1,
0.8590055, -0.2443971, 2.951674, 0.7450981, 0, 1, 1,
0.8617252, 0.7547237, 2.159682, 0.7529412, 0, 1, 1,
0.8649253, 1.665882, 0.05464637, 0.7568628, 0, 1, 1,
0.865826, -0.9098104, 5.394591, 0.7647059, 0, 1, 1,
0.8686924, 0.7222131, 0.2477037, 0.7686275, 0, 1, 1,
0.8718332, 0.3747791, 1.593741, 0.7764706, 0, 1, 1,
0.8759066, -0.2692759, 1.606292, 0.7803922, 0, 1, 1,
0.878843, -0.6222744, 3.017516, 0.7882353, 0, 1, 1,
0.8847849, 0.3251601, 1.775478, 0.7921569, 0, 1, 1,
0.8864595, 0.5225483, 1.085014, 0.8, 0, 1, 1,
0.8869533, 0.4629526, 0.7481388, 0.8078431, 0, 1, 1,
0.8888488, 0.1775809, 2.723948, 0.8117647, 0, 1, 1,
0.8897288, 0.1378127, -0.547895, 0.8196079, 0, 1, 1,
0.890106, -2.168159, 2.164987, 0.8235294, 0, 1, 1,
0.8902178, -1.025385, 2.603282, 0.8313726, 0, 1, 1,
0.8912234, 0.7150095, 1.623124, 0.8352941, 0, 1, 1,
0.8961049, 0.320969, 1.208777, 0.8431373, 0, 1, 1,
0.901712, 0.6083902, -0.2648068, 0.8470588, 0, 1, 1,
0.9033849, 1.136452, 1.594333, 0.854902, 0, 1, 1,
0.9132001, 0.6185079, 2.448748, 0.8588235, 0, 1, 1,
0.9190168, -1.766825, 3.123049, 0.8666667, 0, 1, 1,
0.9219559, 0.4718206, -0.06683961, 0.8705882, 0, 1, 1,
0.9241378, 0.2468831, 1.859378, 0.8784314, 0, 1, 1,
0.9250147, -0.1367649, 2.003449, 0.8823529, 0, 1, 1,
0.925046, -0.09989595, 2.263283, 0.8901961, 0, 1, 1,
0.9265748, 0.02574747, 0.02903051, 0.8941177, 0, 1, 1,
0.9292191, 0.09366672, 1.779244, 0.9019608, 0, 1, 1,
0.9316331, 0.9853942, 0.3517074, 0.9098039, 0, 1, 1,
0.931798, 0.1400127, 0.4699458, 0.9137255, 0, 1, 1,
0.9336347, 0.1517073, 2.500646, 0.9215686, 0, 1, 1,
0.9366432, 0.2654675, 2.43831, 0.9254902, 0, 1, 1,
0.9378096, -0.5398991, 0.3736075, 0.9333333, 0, 1, 1,
0.9405397, 0.8090974, 0.4387903, 0.9372549, 0, 1, 1,
0.9439686, -0.2234418, -0.06445522, 0.945098, 0, 1, 1,
0.946377, 0.3358241, 1.645363, 0.9490196, 0, 1, 1,
0.9540873, 1.087033, -0.3893468, 0.9568627, 0, 1, 1,
0.9547409, -1.175438, 1.788819, 0.9607843, 0, 1, 1,
0.9590388, 0.03880458, 2.327355, 0.9686275, 0, 1, 1,
0.9631819, 0.554558, 1.08503, 0.972549, 0, 1, 1,
0.9647285, 0.09540834, -0.6313748, 0.9803922, 0, 1, 1,
0.9661753, -0.4764721, 0.7546093, 0.9843137, 0, 1, 1,
0.9669366, -1.168667, 2.965606, 0.9921569, 0, 1, 1,
0.975069, -1.34218, 2.523697, 0.9960784, 0, 1, 1,
0.9796556, 1.394967, 0.8980531, 1, 0, 0.9960784, 1,
0.9809901, 1.403463, -1.078924, 1, 0, 0.9882353, 1,
0.9815062, 1.390719, 0.9066455, 1, 0, 0.9843137, 1,
0.9902636, -0.28272, 2.181131, 1, 0, 0.9764706, 1,
0.9912373, -0.7621158, 2.764992, 1, 0, 0.972549, 1,
0.9919346, 1.818935, 0.2944227, 1, 0, 0.9647059, 1,
0.9988853, 0.7508866, 1.199098, 1, 0, 0.9607843, 1,
0.9988961, -0.3927817, 3.549771, 1, 0, 0.9529412, 1,
1.002647, -0.9822931, 3.322037, 1, 0, 0.9490196, 1,
1.007474, -0.5287265, 2.007745, 1, 0, 0.9411765, 1,
1.008235, -1.139283, 2.152458, 1, 0, 0.9372549, 1,
1.012124, -0.1298005, 2.186586, 1, 0, 0.9294118, 1,
1.012933, -0.3036879, 2.15603, 1, 0, 0.9254902, 1,
1.013026, 0.04669905, 1.582866, 1, 0, 0.9176471, 1,
1.014657, -0.8894322, 4.039608, 1, 0, 0.9137255, 1,
1.015489, 0.06432963, 2.598858, 1, 0, 0.9058824, 1,
1.018931, 0.5184979, 0.8353997, 1, 0, 0.9019608, 1,
1.02029, 1.030772, -1.351527, 1, 0, 0.8941177, 1,
1.02054, 0.227799, 2.647905, 1, 0, 0.8862745, 1,
1.024308, -1.065896, 1.00655, 1, 0, 0.8823529, 1,
1.034289, 1.301175, 1.787221, 1, 0, 0.8745098, 1,
1.044557, 0.07847114, 2.739065, 1, 0, 0.8705882, 1,
1.045116, 1.092191, 0.9265457, 1, 0, 0.8627451, 1,
1.051739, -0.3936489, 2.750386, 1, 0, 0.8588235, 1,
1.056274, 0.9995494, 1.022021, 1, 0, 0.8509804, 1,
1.057011, -1.965029, 1.918304, 1, 0, 0.8470588, 1,
1.057213, -0.8869191, 1.537717, 1, 0, 0.8392157, 1,
1.061078, 0.1813823, 1.405484, 1, 0, 0.8352941, 1,
1.061105, -0.7096639, 3.799541, 1, 0, 0.827451, 1,
1.072235, 0.1417465, 1.52412, 1, 0, 0.8235294, 1,
1.073193, -0.02573366, 0.03744689, 1, 0, 0.8156863, 1,
1.083143, 0.2128167, 1.991059, 1, 0, 0.8117647, 1,
1.084602, 0.4783628, 1.334882, 1, 0, 0.8039216, 1,
1.088436, -0.842517, 0.4047711, 1, 0, 0.7960784, 1,
1.088879, 1.628545, 1.01622, 1, 0, 0.7921569, 1,
1.092876, -0.0615536, 2.19862, 1, 0, 0.7843137, 1,
1.093492, 0.1678381, 2.47064, 1, 0, 0.7803922, 1,
1.094669, 1.64567, -1.389434, 1, 0, 0.772549, 1,
1.098308, -0.9715425, 2.717402, 1, 0, 0.7686275, 1,
1.108236, -0.5416902, 2.252047, 1, 0, 0.7607843, 1,
1.127518, -1.572127, 2.250134, 1, 0, 0.7568628, 1,
1.141272, 1.643811, 0.8035127, 1, 0, 0.7490196, 1,
1.14196, 0.3715816, 2.071149, 1, 0, 0.7450981, 1,
1.147766, 1.446502, 1.340478, 1, 0, 0.7372549, 1,
1.149631, 1.517413, -0.1393378, 1, 0, 0.7333333, 1,
1.150082, 0.8371104, 1.847577, 1, 0, 0.7254902, 1,
1.152911, -2.019644, 2.162606, 1, 0, 0.7215686, 1,
1.161346, 1.276792, 2.045783, 1, 0, 0.7137255, 1,
1.161519, 0.1154738, 1.97725, 1, 0, 0.7098039, 1,
1.164744, -0.4096273, 1.678704, 1, 0, 0.7019608, 1,
1.166975, 0.07937012, 1.469978, 1, 0, 0.6941177, 1,
1.193084, -1.377687, 3.245159, 1, 0, 0.6901961, 1,
1.193713, -1.482902, 0.2628115, 1, 0, 0.682353, 1,
1.195979, -0.129165, 1.129195, 1, 0, 0.6784314, 1,
1.200043, -2.479988, 2.867673, 1, 0, 0.6705883, 1,
1.201677, -0.6781663, 1.949442, 1, 0, 0.6666667, 1,
1.205602, 1.411407, 0.9182838, 1, 0, 0.6588235, 1,
1.205905, -1.238468, 3.510187, 1, 0, 0.654902, 1,
1.209177, -0.7981611, 4.551271, 1, 0, 0.6470588, 1,
1.221801, 0.1942114, -0.008140643, 1, 0, 0.6431373, 1,
1.226515, -1.376992, 2.670907, 1, 0, 0.6352941, 1,
1.249264, 0.0991829, 1.382541, 1, 0, 0.6313726, 1,
1.25818, -1.549119, 4.049377, 1, 0, 0.6235294, 1,
1.273441, 0.08644155, -0.2991123, 1, 0, 0.6196079, 1,
1.277102, 0.09054238, 1.594461, 1, 0, 0.6117647, 1,
1.279982, -0.3542831, 1.109418, 1, 0, 0.6078432, 1,
1.281985, 1.252215, 0.851204, 1, 0, 0.6, 1,
1.282735, 0.6340365, 2.185342, 1, 0, 0.5921569, 1,
1.290184, 0.1845493, 2.662102, 1, 0, 0.5882353, 1,
1.293671, -0.7891862, 1.834204, 1, 0, 0.5803922, 1,
1.299687, 0.2718194, 1.446715, 1, 0, 0.5764706, 1,
1.306892, -0.6142549, 2.072319, 1, 0, 0.5686275, 1,
1.309063, 0.2086044, 2.745316, 1, 0, 0.5647059, 1,
1.313548, 1.719107, 1.258096, 1, 0, 0.5568628, 1,
1.32247, -0.4381328, 3.781524, 1, 0, 0.5529412, 1,
1.337105, 0.9878638, 1.789105, 1, 0, 0.5450981, 1,
1.339055, -0.6962049, 1.492231, 1, 0, 0.5411765, 1,
1.349365, 2.515505, -0.9372308, 1, 0, 0.5333334, 1,
1.355081, -0.407626, 0.6471568, 1, 0, 0.5294118, 1,
1.360018, -1.604905, 2.762538, 1, 0, 0.5215687, 1,
1.36915, 0.1022762, 1.244466, 1, 0, 0.5176471, 1,
1.389651, 2.418372, -1.283016, 1, 0, 0.509804, 1,
1.389692, -1.047642, 2.213554, 1, 0, 0.5058824, 1,
1.389769, -0.2417216, 2.190511, 1, 0, 0.4980392, 1,
1.396227, -1.050608, 1.039733, 1, 0, 0.4901961, 1,
1.412395, -0.8763623, 2.428489, 1, 0, 0.4862745, 1,
1.413113, -1.393827, 2.317013, 1, 0, 0.4784314, 1,
1.443798, -0.9655249, 1.544855, 1, 0, 0.4745098, 1,
1.45195, 0.1113095, 3.925224, 1, 0, 0.4666667, 1,
1.453544, -1.06228, 0.9082922, 1, 0, 0.4627451, 1,
1.466072, 0.5942568, 2.865399, 1, 0, 0.454902, 1,
1.479434, 0.2477122, 0.1855102, 1, 0, 0.4509804, 1,
1.479978, 1.310884, -0.01771456, 1, 0, 0.4431373, 1,
1.490608, 0.6978816, 1.059545, 1, 0, 0.4392157, 1,
1.49378, 0.06649784, 0.9617148, 1, 0, 0.4313726, 1,
1.505006, -0.7315859, 1.764851, 1, 0, 0.427451, 1,
1.513908, 0.8036724, 0.4677237, 1, 0, 0.4196078, 1,
1.525743, -1.211924, 3.358659, 1, 0, 0.4156863, 1,
1.527864, -0.6602239, 0.9225972, 1, 0, 0.4078431, 1,
1.52917, 1.469458, 2.06794, 1, 0, 0.4039216, 1,
1.531634, 0.05111882, 2.827216, 1, 0, 0.3960784, 1,
1.540573, -0.5302206, 1.311853, 1, 0, 0.3882353, 1,
1.550112, 0.08998307, 3.368001, 1, 0, 0.3843137, 1,
1.555035, -0.6430013, 2.168007, 1, 0, 0.3764706, 1,
1.556191, 1.232006, 2.395902, 1, 0, 0.372549, 1,
1.558303, 1.016096, 0.2987851, 1, 0, 0.3647059, 1,
1.55917, -0.2974825, 2.306601, 1, 0, 0.3607843, 1,
1.560406, 1.191483, -1.014177, 1, 0, 0.3529412, 1,
1.567254, 1.642805, -0.2777323, 1, 0, 0.3490196, 1,
1.573839, -0.1289165, 2.62069, 1, 0, 0.3411765, 1,
1.576627, -0.1481713, 2.217213, 1, 0, 0.3372549, 1,
1.586114, 1.150611, 0.2440399, 1, 0, 0.3294118, 1,
1.590189, -1.525844, 1.789265, 1, 0, 0.3254902, 1,
1.593754, 0.8983015, 1.707062, 1, 0, 0.3176471, 1,
1.594873, -1.590278, 2.878052, 1, 0, 0.3137255, 1,
1.625576, 0.7660269, -1.107297, 1, 0, 0.3058824, 1,
1.637617, 0.5929763, 1.268081, 1, 0, 0.2980392, 1,
1.64737, 0.9610176, 0.8177263, 1, 0, 0.2941177, 1,
1.648225, 0.5725186, 2.152223, 1, 0, 0.2862745, 1,
1.64956, -0.4227045, 1.600353, 1, 0, 0.282353, 1,
1.65309, 0.09675794, 2.627692, 1, 0, 0.2745098, 1,
1.663267, 1.614648, 0.8577294, 1, 0, 0.2705882, 1,
1.679794, -0.5758463, 3.630273, 1, 0, 0.2627451, 1,
1.740176, 0.1615362, 0.8870601, 1, 0, 0.2588235, 1,
1.75096, -0.4437877, 2.389363, 1, 0, 0.2509804, 1,
1.753853, 0.9009342, 1.068044, 1, 0, 0.2470588, 1,
1.754542, -0.5880918, 0.279259, 1, 0, 0.2392157, 1,
1.786548, 1.201163, -0.8583235, 1, 0, 0.2352941, 1,
1.82078, 0.05992411, 1.712166, 1, 0, 0.227451, 1,
1.822566, 0.5016669, 1.337496, 1, 0, 0.2235294, 1,
1.828911, 0.2192383, 1.859173, 1, 0, 0.2156863, 1,
1.847301, -0.7951317, 0.6253693, 1, 0, 0.2117647, 1,
1.856727, -1.720525, 1.429142, 1, 0, 0.2039216, 1,
1.88911, -0.8152913, 1.755314, 1, 0, 0.1960784, 1,
1.892282, -0.5930141, 1.999422, 1, 0, 0.1921569, 1,
1.907848, 0.7592842, 1.496854, 1, 0, 0.1843137, 1,
1.915048, -1.837519, 2.617632, 1, 0, 0.1803922, 1,
1.923261, -0.6856433, 2.955748, 1, 0, 0.172549, 1,
1.933577, -1.571224, 1.764796, 1, 0, 0.1686275, 1,
1.961693, -0.03481141, 0.9979461, 1, 0, 0.1607843, 1,
1.965893, -2.009046, 1.31963, 1, 0, 0.1568628, 1,
1.973374, 0.5847501, 1.883916, 1, 0, 0.1490196, 1,
2.033689, -1.240344, 0.07044305, 1, 0, 0.145098, 1,
2.048028, -0.2681713, 1.386347, 1, 0, 0.1372549, 1,
2.059971, -0.3985496, 1.874648, 1, 0, 0.1333333, 1,
2.086214, -0.05464057, 3.159629, 1, 0, 0.1254902, 1,
2.087702, 1.404393, -0.1511213, 1, 0, 0.1215686, 1,
2.139479, 1.18139, 2.116297, 1, 0, 0.1137255, 1,
2.141107, 0.9765103, 1.850667, 1, 0, 0.1098039, 1,
2.146304, -0.4789967, 4.245319, 1, 0, 0.1019608, 1,
2.170477, -1.394381, 3.352769, 1, 0, 0.09411765, 1,
2.216631, -0.3520676, 3.655372, 1, 0, 0.09019608, 1,
2.326708, -0.01619474, 2.124013, 1, 0, 0.08235294, 1,
2.360878, 1.805702, 0.1691137, 1, 0, 0.07843138, 1,
2.367184, -0.89494, 1.399402, 1, 0, 0.07058824, 1,
2.369349, 0.008626931, 1.43566, 1, 0, 0.06666667, 1,
2.407965, 0.5508816, 2.355696, 1, 0, 0.05882353, 1,
2.431616, -0.5851812, 2.426642, 1, 0, 0.05490196, 1,
2.527248, -0.5570035, 3.674048, 1, 0, 0.04705882, 1,
2.636831, -0.4112141, 2.821522, 1, 0, 0.04313726, 1,
2.725575, -0.1667552, 2.761175, 1, 0, 0.03529412, 1,
2.932673, 1.667903, 0.588348, 1, 0, 0.03137255, 1,
3.04732, 0.6497337, 1.837324, 1, 0, 0.02352941, 1,
3.072958, -0.008462457, 0.5786197, 1, 0, 0.01960784, 1,
3.21754, -0.4641338, 0.9141359, 1, 0, 0.01176471, 1,
3.385146, 0.8972835, -0.1964048, 1, 0, 0.007843138, 1
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
0.1456277, -3.750547, -8.050892, 0, -0.5, 0.5, 0.5,
0.1456277, -3.750547, -8.050892, 1, -0.5, 0.5, 0.5,
0.1456277, -3.750547, -8.050892, 1, 1.5, 0.5, 0.5,
0.1456277, -3.750547, -8.050892, 0, 1.5, 0.5, 0.5
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
-4.192087, 0.1840396, -8.050892, 0, -0.5, 0.5, 0.5,
-4.192087, 0.1840396, -8.050892, 1, -0.5, 0.5, 0.5,
-4.192087, 0.1840396, -8.050892, 1, 1.5, 0.5, 0.5,
-4.192087, 0.1840396, -8.050892, 0, 1.5, 0.5, 0.5
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
-4.192087, -3.750547, -0.3433487, 0, -0.5, 0.5, 0.5,
-4.192087, -3.750547, -0.3433487, 1, -0.5, 0.5, 0.5,
-4.192087, -3.750547, -0.3433487, 1, 1.5, 0.5, 0.5,
-4.192087, -3.750547, -0.3433487, 0, 1.5, 0.5, 0.5
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
-3, -2.842566, -6.272228,
3, -2.842566, -6.272228,
-3, -2.842566, -6.272228,
-3, -2.993896, -6.568673,
-2, -2.842566, -6.272228,
-2, -2.993896, -6.568673,
-1, -2.842566, -6.272228,
-1, -2.993896, -6.568673,
0, -2.842566, -6.272228,
0, -2.993896, -6.568673,
1, -2.842566, -6.272228,
1, -2.993896, -6.568673,
2, -2.842566, -6.272228,
2, -2.993896, -6.568673,
3, -2.842566, -6.272228,
3, -2.993896, -6.568673
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
-3, -3.296556, -7.161561, 0, -0.5, 0.5, 0.5,
-3, -3.296556, -7.161561, 1, -0.5, 0.5, 0.5,
-3, -3.296556, -7.161561, 1, 1.5, 0.5, 0.5,
-3, -3.296556, -7.161561, 0, 1.5, 0.5, 0.5,
-2, -3.296556, -7.161561, 0, -0.5, 0.5, 0.5,
-2, -3.296556, -7.161561, 1, -0.5, 0.5, 0.5,
-2, -3.296556, -7.161561, 1, 1.5, 0.5, 0.5,
-2, -3.296556, -7.161561, 0, 1.5, 0.5, 0.5,
-1, -3.296556, -7.161561, 0, -0.5, 0.5, 0.5,
-1, -3.296556, -7.161561, 1, -0.5, 0.5, 0.5,
-1, -3.296556, -7.161561, 1, 1.5, 0.5, 0.5,
-1, -3.296556, -7.161561, 0, 1.5, 0.5, 0.5,
0, -3.296556, -7.161561, 0, -0.5, 0.5, 0.5,
0, -3.296556, -7.161561, 1, -0.5, 0.5, 0.5,
0, -3.296556, -7.161561, 1, 1.5, 0.5, 0.5,
0, -3.296556, -7.161561, 0, 1.5, 0.5, 0.5,
1, -3.296556, -7.161561, 0, -0.5, 0.5, 0.5,
1, -3.296556, -7.161561, 1, -0.5, 0.5, 0.5,
1, -3.296556, -7.161561, 1, 1.5, 0.5, 0.5,
1, -3.296556, -7.161561, 0, 1.5, 0.5, 0.5,
2, -3.296556, -7.161561, 0, -0.5, 0.5, 0.5,
2, -3.296556, -7.161561, 1, -0.5, 0.5, 0.5,
2, -3.296556, -7.161561, 1, 1.5, 0.5, 0.5,
2, -3.296556, -7.161561, 0, 1.5, 0.5, 0.5,
3, -3.296556, -7.161561, 0, -0.5, 0.5, 0.5,
3, -3.296556, -7.161561, 1, -0.5, 0.5, 0.5,
3, -3.296556, -7.161561, 1, 1.5, 0.5, 0.5,
3, -3.296556, -7.161561, 0, 1.5, 0.5, 0.5
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
-3.191076, -2, -6.272228,
-3.191076, 3, -6.272228,
-3.191076, -2, -6.272228,
-3.357911, -2, -6.568673,
-3.191076, -1, -6.272228,
-3.357911, -1, -6.568673,
-3.191076, 0, -6.272228,
-3.357911, 0, -6.568673,
-3.191076, 1, -6.272228,
-3.357911, 1, -6.568673,
-3.191076, 2, -6.272228,
-3.357911, 2, -6.568673,
-3.191076, 3, -6.272228,
-3.357911, 3, -6.568673
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
-3.691582, -2, -7.161561, 0, -0.5, 0.5, 0.5,
-3.691582, -2, -7.161561, 1, -0.5, 0.5, 0.5,
-3.691582, -2, -7.161561, 1, 1.5, 0.5, 0.5,
-3.691582, -2, -7.161561, 0, 1.5, 0.5, 0.5,
-3.691582, -1, -7.161561, 0, -0.5, 0.5, 0.5,
-3.691582, -1, -7.161561, 1, -0.5, 0.5, 0.5,
-3.691582, -1, -7.161561, 1, 1.5, 0.5, 0.5,
-3.691582, -1, -7.161561, 0, 1.5, 0.5, 0.5,
-3.691582, 0, -7.161561, 0, -0.5, 0.5, 0.5,
-3.691582, 0, -7.161561, 1, -0.5, 0.5, 0.5,
-3.691582, 0, -7.161561, 1, 1.5, 0.5, 0.5,
-3.691582, 0, -7.161561, 0, 1.5, 0.5, 0.5,
-3.691582, 1, -7.161561, 0, -0.5, 0.5, 0.5,
-3.691582, 1, -7.161561, 1, -0.5, 0.5, 0.5,
-3.691582, 1, -7.161561, 1, 1.5, 0.5, 0.5,
-3.691582, 1, -7.161561, 0, 1.5, 0.5, 0.5,
-3.691582, 2, -7.161561, 0, -0.5, 0.5, 0.5,
-3.691582, 2, -7.161561, 1, -0.5, 0.5, 0.5,
-3.691582, 2, -7.161561, 1, 1.5, 0.5, 0.5,
-3.691582, 2, -7.161561, 0, 1.5, 0.5, 0.5,
-3.691582, 3, -7.161561, 0, -0.5, 0.5, 0.5,
-3.691582, 3, -7.161561, 1, -0.5, 0.5, 0.5,
-3.691582, 3, -7.161561, 1, 1.5, 0.5, 0.5,
-3.691582, 3, -7.161561, 0, 1.5, 0.5, 0.5
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
-3.191076, -2.842566, -6,
-3.191076, -2.842566, 4,
-3.191076, -2.842566, -6,
-3.357911, -2.993896, -6,
-3.191076, -2.842566, -4,
-3.357911, -2.993896, -4,
-3.191076, -2.842566, -2,
-3.357911, -2.993896, -2,
-3.191076, -2.842566, 0,
-3.357911, -2.993896, 0,
-3.191076, -2.842566, 2,
-3.357911, -2.993896, 2,
-3.191076, -2.842566, 4,
-3.357911, -2.993896, 4
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
-3.691582, -3.296556, -6, 0, -0.5, 0.5, 0.5,
-3.691582, -3.296556, -6, 1, -0.5, 0.5, 0.5,
-3.691582, -3.296556, -6, 1, 1.5, 0.5, 0.5,
-3.691582, -3.296556, -6, 0, 1.5, 0.5, 0.5,
-3.691582, -3.296556, -4, 0, -0.5, 0.5, 0.5,
-3.691582, -3.296556, -4, 1, -0.5, 0.5, 0.5,
-3.691582, -3.296556, -4, 1, 1.5, 0.5, 0.5,
-3.691582, -3.296556, -4, 0, 1.5, 0.5, 0.5,
-3.691582, -3.296556, -2, 0, -0.5, 0.5, 0.5,
-3.691582, -3.296556, -2, 1, -0.5, 0.5, 0.5,
-3.691582, -3.296556, -2, 1, 1.5, 0.5, 0.5,
-3.691582, -3.296556, -2, 0, 1.5, 0.5, 0.5,
-3.691582, -3.296556, 0, 0, -0.5, 0.5, 0.5,
-3.691582, -3.296556, 0, 1, -0.5, 0.5, 0.5,
-3.691582, -3.296556, 0, 1, 1.5, 0.5, 0.5,
-3.691582, -3.296556, 0, 0, 1.5, 0.5, 0.5,
-3.691582, -3.296556, 2, 0, -0.5, 0.5, 0.5,
-3.691582, -3.296556, 2, 1, -0.5, 0.5, 0.5,
-3.691582, -3.296556, 2, 1, 1.5, 0.5, 0.5,
-3.691582, -3.296556, 2, 0, 1.5, 0.5, 0.5,
-3.691582, -3.296556, 4, 0, -0.5, 0.5, 0.5,
-3.691582, -3.296556, 4, 1, -0.5, 0.5, 0.5,
-3.691582, -3.296556, 4, 1, 1.5, 0.5, 0.5,
-3.691582, -3.296556, 4, 0, 1.5, 0.5, 0.5
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
-3.191076, -2.842566, -6.272228,
-3.191076, 3.210645, -6.272228,
-3.191076, -2.842566, 5.585531,
-3.191076, 3.210645, 5.585531,
-3.191076, -2.842566, -6.272228,
-3.191076, -2.842566, 5.585531,
-3.191076, 3.210645, -6.272228,
-3.191076, 3.210645, 5.585531,
-3.191076, -2.842566, -6.272228,
3.482332, -2.842566, -6.272228,
-3.191076, -2.842566, 5.585531,
3.482332, -2.842566, 5.585531,
-3.191076, 3.210645, -6.272228,
3.482332, 3.210645, -6.272228,
-3.191076, 3.210645, 5.585531,
3.482332, 3.210645, 5.585531,
3.482332, -2.842566, -6.272228,
3.482332, 3.210645, -6.272228,
3.482332, -2.842566, 5.585531,
3.482332, 3.210645, 5.585531,
3.482332, -2.842566, -6.272228,
3.482332, -2.842566, 5.585531,
3.482332, 3.210645, -6.272228,
3.482332, 3.210645, 5.585531
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
var radius = 7.952227;
var distance = 35.38036;
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
mvMatrix.translate( -0.1456277, -0.1840396, 0.3433487 );
mvMatrix.scale( 1.288413, 1.42042, 0.7251036 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.38036);
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
fenasulam<-read.table("fenasulam.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-fenasulam$V2
```

```
## Error in eval(expr, envir, enclos): object 'fenasulam' not found
```

```r
y<-fenasulam$V3
```

```
## Error in eval(expr, envir, enclos): object 'fenasulam' not found
```

```r
z<-fenasulam$V4
```

```
## Error in eval(expr, envir, enclos): object 'fenasulam' not found
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
-3.093891, 0.3123412, -1.195358, 0, 0, 1, 1, 1,
-2.682558, 1.272761, -1.738888, 1, 0, 0, 1, 1,
-2.674364, -0.4267911, -2.368322, 1, 0, 0, 1, 1,
-2.549171, 0.7931702, -1.452409, 1, 0, 0, 1, 1,
-2.401091, 1.097668, -2.657022, 1, 0, 0, 1, 1,
-2.29021, 0.4412639, -3.07704, 1, 0, 0, 1, 1,
-2.219459, 1.501211, -1.231623, 0, 0, 0, 1, 1,
-2.210692, 0.7872954, -2.346982, 0, 0, 0, 1, 1,
-2.207584, 0.08954123, -0.9536646, 0, 0, 0, 1, 1,
-2.173928, 0.7588803, -0.9615314, 0, 0, 0, 1, 1,
-2.133491, 0.7278954, -0.6740735, 0, 0, 0, 1, 1,
-2.125946, 0.4826337, -0.9067118, 0, 0, 0, 1, 1,
-2.063855, -1.566893, -3.717891, 0, 0, 0, 1, 1,
-2.060882, 0.5870578, -2.506724, 1, 1, 1, 1, 1,
-1.99409, -0.3535976, -2.828148, 1, 1, 1, 1, 1,
-1.978854, -2.130583, -3.403141, 1, 1, 1, 1, 1,
-1.965415, -0.1803451, -2.286048, 1, 1, 1, 1, 1,
-1.958985, 1.619394, -0.3570082, 1, 1, 1, 1, 1,
-1.95177, 0.1335566, -1.000288, 1, 1, 1, 1, 1,
-1.944003, -0.6028792, -1.659652, 1, 1, 1, 1, 1,
-1.904994, -1.440596, -3.816166, 1, 1, 1, 1, 1,
-1.88647, 1.242035, 0.7147053, 1, 1, 1, 1, 1,
-1.856289, 0.1862949, -1.311403, 1, 1, 1, 1, 1,
-1.85618, 2.039912, -1.453534, 1, 1, 1, 1, 1,
-1.848693, -0.08708072, -1.365634, 1, 1, 1, 1, 1,
-1.823971, 0.2101513, -2.946478, 1, 1, 1, 1, 1,
-1.816087, -2.234136, -3.214342, 1, 1, 1, 1, 1,
-1.814893, 0.4892281, -1.092786, 1, 1, 1, 1, 1,
-1.773021, -0.1283062, -2.503145, 0, 0, 1, 1, 1,
-1.772072, 0.3524864, -1.551799, 1, 0, 0, 1, 1,
-1.752171, -0.823069, -2.818708, 1, 0, 0, 1, 1,
-1.7461, -1.176722, -3.419382, 1, 0, 0, 1, 1,
-1.731233, 1.046464, -1.09854, 1, 0, 0, 1, 1,
-1.722705, 1.215486, -0.2650493, 1, 0, 0, 1, 1,
-1.707129, 1.440919, -0.355076, 0, 0, 0, 1, 1,
-1.705482, -0.2598663, -1.617545, 0, 0, 0, 1, 1,
-1.700544, 1.087393, -3.478001, 0, 0, 0, 1, 1,
-1.695185, 1.296777, -0.2136343, 0, 0, 0, 1, 1,
-1.665762, -0.9399508, -0.2067425, 0, 0, 0, 1, 1,
-1.645199, -0.4142271, -0.6988975, 0, 0, 0, 1, 1,
-1.632415, 2.671466, 0.730244, 0, 0, 0, 1, 1,
-1.623772, 0.1408769, -1.805059, 1, 1, 1, 1, 1,
-1.62165, -0.9018105, -0.7096218, 1, 1, 1, 1, 1,
-1.619915, -0.3744863, -2.825613, 1, 1, 1, 1, 1,
-1.617198, 0.7925811, -2.228183, 1, 1, 1, 1, 1,
-1.615456, -1.898709, -2.106212, 1, 1, 1, 1, 1,
-1.599827, 1.145182, -1.441462, 1, 1, 1, 1, 1,
-1.595721, -0.1957719, -3.376861, 1, 1, 1, 1, 1,
-1.591253, 1.614626, -1.617715, 1, 1, 1, 1, 1,
-1.58916, 0.5076809, -0.6347827, 1, 1, 1, 1, 1,
-1.586499, 0.2646114, -0.5452237, 1, 1, 1, 1, 1,
-1.577572, -0.04702489, -2.430702, 1, 1, 1, 1, 1,
-1.575063, -0.7325807, -1.691296, 1, 1, 1, 1, 1,
-1.574489, -0.09902999, -0.9334263, 1, 1, 1, 1, 1,
-1.55862, -0.3871362, -2.538869, 1, 1, 1, 1, 1,
-1.556887, -0.7370921, -3.263378, 1, 1, 1, 1, 1,
-1.550053, -0.02166258, -2.548551, 0, 0, 1, 1, 1,
-1.545588, -0.3054075, -1.722718, 1, 0, 0, 1, 1,
-1.54074, 0.51197, -0.06291796, 1, 0, 0, 1, 1,
-1.538911, 0.7224621, -2.517275, 1, 0, 0, 1, 1,
-1.538703, 0.4352562, -2.567025, 1, 0, 0, 1, 1,
-1.519683, 0.1589663, -1.371854, 1, 0, 0, 1, 1,
-1.507866, -1.210508, -3.002429, 0, 0, 0, 1, 1,
-1.506853, 0.09711693, -3.000192, 0, 0, 0, 1, 1,
-1.502377, 2.5512, 2.178334, 0, 0, 0, 1, 1,
-1.500641, 0.161871, -2.273374, 0, 0, 0, 1, 1,
-1.490221, -0.5265339, -0.6500785, 0, 0, 0, 1, 1,
-1.480373, 1.976575, -1.14784, 0, 0, 0, 1, 1,
-1.461253, 0.4387438, -0.1320065, 0, 0, 0, 1, 1,
-1.460546, 0.8526375, -1.164821, 1, 1, 1, 1, 1,
-1.449425, 0.6304466, -1.932669, 1, 1, 1, 1, 1,
-1.443554, 0.09124202, -1.695012, 1, 1, 1, 1, 1,
-1.43543, 0.9453349, -1.606361, 1, 1, 1, 1, 1,
-1.434856, -0.181201, -0.6265609, 1, 1, 1, 1, 1,
-1.424843, 2.462972, -1.324445, 1, 1, 1, 1, 1,
-1.420008, -1.957537, -3.814662, 1, 1, 1, 1, 1,
-1.418988, -0.4022566, -1.929083, 1, 1, 1, 1, 1,
-1.413123, 0.2692704, 0.2219332, 1, 1, 1, 1, 1,
-1.408875, 0.5467088, -0.5135341, 1, 1, 1, 1, 1,
-1.407452, 1.201547, -0.9562844, 1, 1, 1, 1, 1,
-1.39938, -1.06568, -0.9479007, 1, 1, 1, 1, 1,
-1.396466, -1.416006, -2.02603, 1, 1, 1, 1, 1,
-1.396132, -0.7240072, -2.473672, 1, 1, 1, 1, 1,
-1.383887, 0.8725141, -0.5487431, 1, 1, 1, 1, 1,
-1.376019, -0.3376166, -1.897125, 0, 0, 1, 1, 1,
-1.373702, -0.4795341, -1.745516, 1, 0, 0, 1, 1,
-1.368341, -1.289211, -2.360553, 1, 0, 0, 1, 1,
-1.365965, -0.2005223, -1.716977, 1, 0, 0, 1, 1,
-1.360687, -0.05935226, -1.651841, 1, 0, 0, 1, 1,
-1.337147, -0.4701457, 0.2428371, 1, 0, 0, 1, 1,
-1.327838, -2.095838, -2.337083, 0, 0, 0, 1, 1,
-1.325662, -0.2470639, -1.928707, 0, 0, 0, 1, 1,
-1.323647, 1.130697, -0.5367213, 0, 0, 0, 1, 1,
-1.308801, 1.176646, -2.230316, 0, 0, 0, 1, 1,
-1.302651, -0.3257266, -2.735078, 0, 0, 0, 1, 1,
-1.301581, 0.3317285, -2.525051, 0, 0, 0, 1, 1,
-1.238479, 0.5937937, -2.797272, 0, 0, 0, 1, 1,
-1.237654, 0.5162176, -1.009134, 1, 1, 1, 1, 1,
-1.235769, 0.4918863, -1.103038, 1, 1, 1, 1, 1,
-1.235364, 0.6705222, -2.069269, 1, 1, 1, 1, 1,
-1.225831, 1.158415, 0.8903373, 1, 1, 1, 1, 1,
-1.222881, 2.394313, 1.732192, 1, 1, 1, 1, 1,
-1.195996, -0.8452343, -1.123973, 1, 1, 1, 1, 1,
-1.188732, -0.742417, -1.814496, 1, 1, 1, 1, 1,
-1.184018, -0.8606663, -1.557878, 1, 1, 1, 1, 1,
-1.179217, -0.4114738, -1.698988, 1, 1, 1, 1, 1,
-1.178046, 1.676217, -2.128811, 1, 1, 1, 1, 1,
-1.166788, 1.273283, -0.6257271, 1, 1, 1, 1, 1,
-1.164755, -0.3434157, -1.561803, 1, 1, 1, 1, 1,
-1.156329, 0.6220394, -0.1523398, 1, 1, 1, 1, 1,
-1.155097, 1.244235, 0.4542002, 1, 1, 1, 1, 1,
-1.153982, -0.737325, -2.584574, 1, 1, 1, 1, 1,
-1.148137, 0.4340865, -1.773919, 0, 0, 1, 1, 1,
-1.138659, 0.5176806, -1.627509, 1, 0, 0, 1, 1,
-1.132998, -1.47663, -4.125439, 1, 0, 0, 1, 1,
-1.126326, 0.4700324, 1.246403, 1, 0, 0, 1, 1,
-1.126117, 0.3682098, -0.6685192, 1, 0, 0, 1, 1,
-1.116723, -0.007177163, -1.935719, 1, 0, 0, 1, 1,
-1.112668, -1.244296, -2.37553, 0, 0, 0, 1, 1,
-1.110353, 0.2933797, -1.54251, 0, 0, 0, 1, 1,
-1.11004, 1.246789, -1.209355, 0, 0, 0, 1, 1,
-1.108297, -0.8350598, -2.564074, 0, 0, 0, 1, 1,
-1.101757, -1.333826, -3.706681, 0, 0, 0, 1, 1,
-1.100461, 1.369254, 0.06217833, 0, 0, 0, 1, 1,
-1.073724, -0.02857258, 0.06195266, 0, 0, 0, 1, 1,
-1.072732, -0.4201151, -0.4684521, 1, 1, 1, 1, 1,
-1.063584, 0.01979973, -3.055527, 1, 1, 1, 1, 1,
-1.058273, -0.499494, 0.1071108, 1, 1, 1, 1, 1,
-1.055046, 0.9261601, -1.59617, 1, 1, 1, 1, 1,
-1.054963, -0.6431924, -0.9965892, 1, 1, 1, 1, 1,
-1.054422, 0.3308806, -1.258076, 1, 1, 1, 1, 1,
-1.051884, 0.7754343, -1.762536, 1, 1, 1, 1, 1,
-1.051331, -0.4895323, -4.189285, 1, 1, 1, 1, 1,
-1.04343, -0.02630674, -2.842026, 1, 1, 1, 1, 1,
-1.028982, -1.725468, -1.366702, 1, 1, 1, 1, 1,
-1.024875, -1.149273, -1.428555, 1, 1, 1, 1, 1,
-1.021708, -0.9529165, -2.877871, 1, 1, 1, 1, 1,
-1.011937, -0.8453407, -2.453504, 1, 1, 1, 1, 1,
-1.00811, 0.5218403, -0.03788023, 1, 1, 1, 1, 1,
-1.007892, 0.1335195, -0.7090734, 1, 1, 1, 1, 1,
-1.004532, 2.228607, 2.000895, 0, 0, 1, 1, 1,
-1.00233, -0.07238643, -1.606545, 1, 0, 0, 1, 1,
-1.001997, 1.450308, -0.6958367, 1, 0, 0, 1, 1,
-1.000276, 0.777006, -0.505244, 1, 0, 0, 1, 1,
-0.9928587, -0.7440349, -1.659704, 1, 0, 0, 1, 1,
-0.9890435, -0.8922061, -2.807997, 1, 0, 0, 1, 1,
-0.9888149, -0.514769, -1.307366, 0, 0, 0, 1, 1,
-0.986802, -0.7962994, -1.208493, 0, 0, 0, 1, 1,
-0.9855558, 0.5435857, -2.19303, 0, 0, 0, 1, 1,
-0.9854445, -1.413412, -3.236823, 0, 0, 0, 1, 1,
-0.9764941, -0.1361448, -0.4459001, 0, 0, 0, 1, 1,
-0.9754718, -1.301573, -1.912643, 0, 0, 0, 1, 1,
-0.9743973, 1.346053, -0.3984483, 0, 0, 0, 1, 1,
-0.9720067, -0.03601206, -1.096875, 1, 1, 1, 1, 1,
-0.9708883, 0.4904691, -2.08647, 1, 1, 1, 1, 1,
-0.9630259, -0.7309623, -1.86468, 1, 1, 1, 1, 1,
-0.9622859, -0.5269026, -0.9895813, 1, 1, 1, 1, 1,
-0.9615365, -1.172027, -2.352599, 1, 1, 1, 1, 1,
-0.952149, -0.3692094, -2.176711, 1, 1, 1, 1, 1,
-0.9510516, -0.6746725, -1.937168, 1, 1, 1, 1, 1,
-0.948921, 1.078309, -1.071814, 1, 1, 1, 1, 1,
-0.947965, -0.01901177, -0.5375729, 1, 1, 1, 1, 1,
-0.9458867, 1.32278, -1.147193, 1, 1, 1, 1, 1,
-0.9430729, -0.8060308, -0.2007207, 1, 1, 1, 1, 1,
-0.9347388, 0.3702437, 0.1429901, 1, 1, 1, 1, 1,
-0.9304224, 1.169684, 0.3250338, 1, 1, 1, 1, 1,
-0.9291198, -0.719952, -2.48165, 1, 1, 1, 1, 1,
-0.9242092, -1.025457, -0.9670889, 1, 1, 1, 1, 1,
-0.9225289, 0.3681568, -0.4366249, 0, 0, 1, 1, 1,
-0.9211546, -0.9999229, -3.476954, 1, 0, 0, 1, 1,
-0.9198793, -0.1546496, -1.465539, 1, 0, 0, 1, 1,
-0.9189332, 0.7618515, -0.02114789, 1, 0, 0, 1, 1,
-0.9109107, -0.2665659, -1.834209, 1, 0, 0, 1, 1,
-0.9078649, -0.4197942, -3.552449, 1, 0, 0, 1, 1,
-0.9050893, -2.210917, -3.059885, 0, 0, 0, 1, 1,
-0.8989838, 1.444113, -0.8669746, 0, 0, 0, 1, 1,
-0.8968976, -0.2805698, -1.835239, 0, 0, 0, 1, 1,
-0.8833449, 0.4615298, 1.019188, 0, 0, 0, 1, 1,
-0.879209, -0.4040386, -2.245462, 0, 0, 0, 1, 1,
-0.8775888, -0.5766292, -3.949681, 0, 0, 0, 1, 1,
-0.8743829, 2.027171, 0.6609831, 0, 0, 0, 1, 1,
-0.8736013, 0.1529821, -0.2532384, 1, 1, 1, 1, 1,
-0.8658709, -1.107189, -2.770799, 1, 1, 1, 1, 1,
-0.8638681, -0.2328694, -0.3983268, 1, 1, 1, 1, 1,
-0.861959, -0.4759077, -1.100106, 1, 1, 1, 1, 1,
-0.8576007, -0.9632145, -3.099164, 1, 1, 1, 1, 1,
-0.8525743, -0.176552, -2.597038, 1, 1, 1, 1, 1,
-0.850625, 0.5002441, -0.9693627, 1, 1, 1, 1, 1,
-0.8480451, 1.268885, -0.05241854, 1, 1, 1, 1, 1,
-0.8441489, 0.4855766, -1.285467, 1, 1, 1, 1, 1,
-0.8404192, 0.7236164, -1.494065, 1, 1, 1, 1, 1,
-0.8391642, 1.825341, -2.551213, 1, 1, 1, 1, 1,
-0.8387032, -0.4019416, -1.805993, 1, 1, 1, 1, 1,
-0.8369281, 0.3842331, -0.4059331, 1, 1, 1, 1, 1,
-0.8367929, -0.4042086, -0.4788294, 1, 1, 1, 1, 1,
-0.8346711, -0.798563, -1.531076, 1, 1, 1, 1, 1,
-0.830762, -1.210221, -3.466609, 0, 0, 1, 1, 1,
-0.8263213, 0.8322697, -1.899177, 1, 0, 0, 1, 1,
-0.8240531, -1.031232, -2.141574, 1, 0, 0, 1, 1,
-0.8230082, -0.8813183, -2.560158, 1, 0, 0, 1, 1,
-0.8221363, -0.5657992, -1.354194, 1, 0, 0, 1, 1,
-0.8194276, -0.1614014, -2.186856, 1, 0, 0, 1, 1,
-0.8193809, 0.06348856, -1.540154, 0, 0, 0, 1, 1,
-0.8095747, -1.271878, -3.828098, 0, 0, 0, 1, 1,
-0.8086281, -2.167067, -1.184412, 0, 0, 0, 1, 1,
-0.8086008, -0.227153, -0.8092741, 0, 0, 0, 1, 1,
-0.8056231, 0.9905306, -1.197029, 0, 0, 0, 1, 1,
-0.8054032, -1.09734, -1.295849, 0, 0, 0, 1, 1,
-0.8049561, 0.6947346, -0.7497993, 0, 0, 0, 1, 1,
-0.8024521, 1.589982, -3.106349, 1, 1, 1, 1, 1,
-0.7934974, -0.5752212, -2.014107, 1, 1, 1, 1, 1,
-0.7877703, -1.178293, -1.579244, 1, 1, 1, 1, 1,
-0.7834846, -1.886728, -1.81796, 1, 1, 1, 1, 1,
-0.7773311, -0.9739792, -3.040608, 1, 1, 1, 1, 1,
-0.7716082, 0.5396076, -3.20492, 1, 1, 1, 1, 1,
-0.7664775, 0.4655994, -2.265103, 1, 1, 1, 1, 1,
-0.7638754, 0.06155317, -1.084554, 1, 1, 1, 1, 1,
-0.7627453, 0.4604907, -1.863289, 1, 1, 1, 1, 1,
-0.7594975, -0.5587173, -3.505463, 1, 1, 1, 1, 1,
-0.7530352, -0.441208, -1.178391, 1, 1, 1, 1, 1,
-0.7451333, 2.644231, 0.5523488, 1, 1, 1, 1, 1,
-0.7392924, 0.3947539, -1.117681, 1, 1, 1, 1, 1,
-0.7391779, -0.002097387, -1.163367, 1, 1, 1, 1, 1,
-0.7330004, 0.1578662, -2.061325, 1, 1, 1, 1, 1,
-0.73141, -0.1530152, -2.315982, 0, 0, 1, 1, 1,
-0.7312043, 0.3717071, -1.873552, 1, 0, 0, 1, 1,
-0.7297248, 1.327278, 0.8853271, 1, 0, 0, 1, 1,
-0.7281112, 0.8492057, -0.6800724, 1, 0, 0, 1, 1,
-0.7258451, -0.2953676, -1.834801, 1, 0, 0, 1, 1,
-0.7230973, 0.3015707, -1.455784, 1, 0, 0, 1, 1,
-0.722778, -0.05025835, 0.2135766, 0, 0, 0, 1, 1,
-0.7176787, 1.768641, 1.784171, 0, 0, 0, 1, 1,
-0.7176132, -0.8213874, -1.675332, 0, 0, 0, 1, 1,
-0.7139794, 0.250169, -1.124528, 0, 0, 0, 1, 1,
-0.712993, -0.3518078, -2.319769, 0, 0, 0, 1, 1,
-0.7111478, -0.7361829, -2.247957, 0, 0, 0, 1, 1,
-0.7099255, -0.9974334, -2.27093, 0, 0, 0, 1, 1,
-0.701602, -0.8152264, -1.642015, 1, 1, 1, 1, 1,
-0.7007503, 1.556971, -0.02718265, 1, 1, 1, 1, 1,
-0.6974164, 0.8387133, -1.012093, 1, 1, 1, 1, 1,
-0.6958579, -0.9737317, -2.695892, 1, 1, 1, 1, 1,
-0.6928782, -0.1775141, -2.136558, 1, 1, 1, 1, 1,
-0.6849568, -0.2599423, -2.324308, 1, 1, 1, 1, 1,
-0.6840084, -1.969418, -3.566327, 1, 1, 1, 1, 1,
-0.6819766, -0.6143178, -2.517443, 1, 1, 1, 1, 1,
-0.6812326, 0.9754516, 0.3390984, 1, 1, 1, 1, 1,
-0.6760646, -0.7431751, -1.147386, 1, 1, 1, 1, 1,
-0.6760308, -0.8901184, -0.9289248, 1, 1, 1, 1, 1,
-0.6736566, 0.9008234, -1.748078, 1, 1, 1, 1, 1,
-0.6663467, -1.424439, -1.942636, 1, 1, 1, 1, 1,
-0.665939, 0.1893258, -1.948345, 1, 1, 1, 1, 1,
-0.6536489, -0.4356908, -1.210901, 1, 1, 1, 1, 1,
-0.6517355, 0.2904165, -0.2987202, 0, 0, 1, 1, 1,
-0.6508339, -2.754412, -2.858578, 1, 0, 0, 1, 1,
-0.6476419, 1.2011, -0.5974373, 1, 0, 0, 1, 1,
-0.6440973, 0.3809987, 0.02663975, 1, 0, 0, 1, 1,
-0.6438869, -0.8028684, -1.42357, 1, 0, 0, 1, 1,
-0.6420591, 0.874979, -1.064329, 1, 0, 0, 1, 1,
-0.6397814, 0.05356612, -1.923781, 0, 0, 0, 1, 1,
-0.6388566, 0.986563, -2.202661, 0, 0, 0, 1, 1,
-0.6370279, 1.307283, 0.222584, 0, 0, 0, 1, 1,
-0.63563, 0.2156527, -0.9855333, 0, 0, 0, 1, 1,
-0.6342862, -0.3507255, -2.331921, 0, 0, 0, 1, 1,
-0.6307005, -0.72661, 0.2716121, 0, 0, 0, 1, 1,
-0.6259073, -1.111094, -1.957589, 0, 0, 0, 1, 1,
-0.6240965, -0.9604029, -1.797251, 1, 1, 1, 1, 1,
-0.6233948, 0.6362829, -1.195201, 1, 1, 1, 1, 1,
-0.61862, -0.7166551, -1.362087, 1, 1, 1, 1, 1,
-0.6160561, -1.351873, -2.218652, 1, 1, 1, 1, 1,
-0.6125196, 1.518423, -0.7911551, 1, 1, 1, 1, 1,
-0.606906, -2.432961, -1.907841, 1, 1, 1, 1, 1,
-0.605229, -0.2333165, -2.217252, 1, 1, 1, 1, 1,
-0.6030089, -1.020212, -1.267583, 1, 1, 1, 1, 1,
-0.5933561, 0.2727425, -0.6636739, 1, 1, 1, 1, 1,
-0.5894199, 0.5737437, 0.8038331, 1, 1, 1, 1, 1,
-0.5866824, -0.1426205, -0.8369212, 1, 1, 1, 1, 1,
-0.5855929, 0.3266998, -2.397628, 1, 1, 1, 1, 1,
-0.5835643, 0.1031709, -1.83695, 1, 1, 1, 1, 1,
-0.5803358, 0.7932126, -0.2095774, 1, 1, 1, 1, 1,
-0.5737167, -1.357447, -1.325097, 1, 1, 1, 1, 1,
-0.5716121, -0.6209938, -2.149434, 0, 0, 1, 1, 1,
-0.5710711, -0.6402756, -1.806786, 1, 0, 0, 1, 1,
-0.5680863, 0.5423449, -0.6810758, 1, 0, 0, 1, 1,
-0.5618024, 0.5366848, 0.4284627, 1, 0, 0, 1, 1,
-0.5601557, -0.2098993, -2.706178, 1, 0, 0, 1, 1,
-0.5490027, 0.6664263, 0.5956004, 1, 0, 0, 1, 1,
-0.545348, 1.195205, -1.050152, 0, 0, 0, 1, 1,
-0.5448013, -0.3751785, -1.077714, 0, 0, 0, 1, 1,
-0.5442095, -0.03746255, 0.3279888, 0, 0, 0, 1, 1,
-0.5405192, -0.4178655, -2.734351, 0, 0, 0, 1, 1,
-0.5387395, 0.5407883, -1.957506, 0, 0, 0, 1, 1,
-0.5385459, 0.3653177, -0.4126417, 0, 0, 0, 1, 1,
-0.5366674, 0.2683823, -1.784801, 0, 0, 0, 1, 1,
-0.5343766, 0.0993358, -1.715256, 1, 1, 1, 1, 1,
-0.5339765, -1.536479, -1.987323, 1, 1, 1, 1, 1,
-0.5235988, -0.4962046, -3.395324, 1, 1, 1, 1, 1,
-0.5195021, -0.1541241, -0.1752677, 1, 1, 1, 1, 1,
-0.5138274, 0.5944161, -0.2054667, 1, 1, 1, 1, 1,
-0.5070934, 0.6028694, -0.6602484, 1, 1, 1, 1, 1,
-0.5028331, 1.091681, 0.316277, 1, 1, 1, 1, 1,
-0.5005112, -0.8903815, -3.053471, 1, 1, 1, 1, 1,
-0.493792, 1.191531, -0.2985883, 1, 1, 1, 1, 1,
-0.4916703, 1.626386, -0.9477932, 1, 1, 1, 1, 1,
-0.4786506, 1.047177, -0.5812476, 1, 1, 1, 1, 1,
-0.4784817, 0.6914904, -2.269101, 1, 1, 1, 1, 1,
-0.4773875, -1.092713, -1.050374, 1, 1, 1, 1, 1,
-0.4767191, -1.45549, -3.861759, 1, 1, 1, 1, 1,
-0.4655367, -1.180591, -3.623803, 1, 1, 1, 1, 1,
-0.4645087, 0.2799481, -2.062384, 0, 0, 1, 1, 1,
-0.4635963, 2.889663, -2.342507, 1, 0, 0, 1, 1,
-0.4571758, 0.0140917, -2.448527, 1, 0, 0, 1, 1,
-0.4552129, 0.2220143, -1.513343, 1, 0, 0, 1, 1,
-0.4503246, 0.1024029, -2.005634, 1, 0, 0, 1, 1,
-0.4454953, -0.2193577, -2.255556, 1, 0, 0, 1, 1,
-0.443394, -1.936218, -2.563731, 0, 0, 0, 1, 1,
-0.4426612, 0.6946121, -1.274823, 0, 0, 0, 1, 1,
-0.4406294, -0.4593371, -1.939025, 0, 0, 0, 1, 1,
-0.4393114, 1.225265, 0.7523796, 0, 0, 0, 1, 1,
-0.4351174, 2.084066, 0.4835416, 0, 0, 0, 1, 1,
-0.4344836, -0.1627215, -1.228234, 0, 0, 0, 1, 1,
-0.4322083, -0.2670608, -2.162252, 0, 0, 0, 1, 1,
-0.4310543, 0.5282785, -0.9035703, 1, 1, 1, 1, 1,
-0.4304651, -0.142677, -3.469801, 1, 1, 1, 1, 1,
-0.4288751, -0.2459438, -1.370287, 1, 1, 1, 1, 1,
-0.4260993, 1.199531, -0.4021962, 1, 1, 1, 1, 1,
-0.417391, 1.034634, 0.2338397, 1, 1, 1, 1, 1,
-0.4167819, -0.8916015, -3.077262, 1, 1, 1, 1, 1,
-0.416768, 1.131196, 1.202751, 1, 1, 1, 1, 1,
-0.4163509, 0.007304775, -0.8755278, 1, 1, 1, 1, 1,
-0.4108537, -0.8100159, -1.89201, 1, 1, 1, 1, 1,
-0.4097169, 0.1428008, -1.558183, 1, 1, 1, 1, 1,
-0.408687, -1.292977, -1.693398, 1, 1, 1, 1, 1,
-0.4066079, 1.828088, -1.769095, 1, 1, 1, 1, 1,
-0.3995124, -0.7954385, -2.446134, 1, 1, 1, 1, 1,
-0.3976268, 0.009389138, -2.251354, 1, 1, 1, 1, 1,
-0.3970295, 1.11185, -0.6363368, 1, 1, 1, 1, 1,
-0.3967602, -0.1691488, -1.783036, 0, 0, 1, 1, 1,
-0.3899331, -0.8408031, -1.367162, 1, 0, 0, 1, 1,
-0.3880181, -0.4433471, -1.58849, 1, 0, 0, 1, 1,
-0.382213, -0.7376068, -2.676335, 1, 0, 0, 1, 1,
-0.3798719, 0.2066258, -1.117085, 1, 0, 0, 1, 1,
-0.3791109, 0.9234233, -0.6999027, 1, 0, 0, 1, 1,
-0.3747265, -0.0424712, -2.519021, 0, 0, 0, 1, 1,
-0.3725978, 0.9170105, -0.7166704, 0, 0, 0, 1, 1,
-0.3682046, -1.526283, -3.899623, 0, 0, 0, 1, 1,
-0.3663875, 1.181709, 0.02433296, 0, 0, 0, 1, 1,
-0.3654029, -1.54481, -2.534337, 0, 0, 0, 1, 1,
-0.3647658, 2.10428, 0.2395346, 0, 0, 0, 1, 1,
-0.3647341, -1.116528, -3.728647, 0, 0, 0, 1, 1,
-0.3638349, -0.03837226, -3.068937, 1, 1, 1, 1, 1,
-0.3618119, -1.023443, -4.351049, 1, 1, 1, 1, 1,
-0.3526254, 0.6971287, -0.9098434, 1, 1, 1, 1, 1,
-0.3511049, -1.419331, -2.221535, 1, 1, 1, 1, 1,
-0.349614, 1.437694, 0.1241844, 1, 1, 1, 1, 1,
-0.3477734, 0.3966795, -0.9235415, 1, 1, 1, 1, 1,
-0.344376, 0.2335032, 0.1204586, 1, 1, 1, 1, 1,
-0.3436815, -0.2750168, -2.549959, 1, 1, 1, 1, 1,
-0.3429783, 0.4347657, -0.7709092, 1, 1, 1, 1, 1,
-0.3325201, -0.3253372, -1.019458, 1, 1, 1, 1, 1,
-0.3315006, -0.5453015, -2.346577, 1, 1, 1, 1, 1,
-0.3309596, -0.3310646, -2.799397, 1, 1, 1, 1, 1,
-0.3295918, -0.2500689, -2.017074, 1, 1, 1, 1, 1,
-0.3284743, 0.6758234, 0.7450463, 1, 1, 1, 1, 1,
-0.326878, -1.147268, -2.273026, 1, 1, 1, 1, 1,
-0.32453, 0.5201062, -2.617909, 0, 0, 1, 1, 1,
-0.324481, 0.007841823, -2.190095, 1, 0, 0, 1, 1,
-0.3181183, -0.8131177, -3.557804, 1, 0, 0, 1, 1,
-0.3155706, 0.1536852, -2.108757, 1, 0, 0, 1, 1,
-0.3133362, 0.4149036, -1.336211, 1, 0, 0, 1, 1,
-0.3129698, -0.01555239, -0.8676623, 1, 0, 0, 1, 1,
-0.3121467, 0.8802013, -0.1998397, 0, 0, 0, 1, 1,
-0.3091934, 0.5037038, 1.208787, 0, 0, 0, 1, 1,
-0.3077604, 0.5142385, -0.5595144, 0, 0, 0, 1, 1,
-0.3064738, 0.3209409, 0.294504, 0, 0, 0, 1, 1,
-0.3063139, 0.1043203, 1.132612, 0, 0, 0, 1, 1,
-0.3060679, 1.556604, -0.3052077, 0, 0, 0, 1, 1,
-0.3050424, 2.589608, -0.1701787, 0, 0, 0, 1, 1,
-0.3036245, -0.375772, -2.76717, 1, 1, 1, 1, 1,
-0.3032233, 0.1160467, -1.348788, 1, 1, 1, 1, 1,
-0.303212, -1.493021, -2.719041, 1, 1, 1, 1, 1,
-0.3031985, -1.544632, -2.669794, 1, 1, 1, 1, 1,
-0.2991418, -0.5657305, -1.476608, 1, 1, 1, 1, 1,
-0.2941984, -0.6666327, -2.246937, 1, 1, 1, 1, 1,
-0.2857432, 1.509752, -1.325299, 1, 1, 1, 1, 1,
-0.2854725, 1.078112, 0.1980487, 1, 1, 1, 1, 1,
-0.284832, -1.029704, -3.096293, 1, 1, 1, 1, 1,
-0.2764232, 0.08114948, -1.306033, 1, 1, 1, 1, 1,
-0.2762354, 0.580204, -0.7226674, 1, 1, 1, 1, 1,
-0.2711478, 1.751001, 1.544043, 1, 1, 1, 1, 1,
-0.2691187, 0.5212159, -1.574421, 1, 1, 1, 1, 1,
-0.2669255, 0.451706, -0.6537529, 1, 1, 1, 1, 1,
-0.2662489, -1.388506, -2.742219, 1, 1, 1, 1, 1,
-0.259441, -0.09276643, -1.013661, 0, 0, 1, 1, 1,
-0.2591317, 0.7254098, -1.446089, 1, 0, 0, 1, 1,
-0.258485, -0.1542855, -2.65671, 1, 0, 0, 1, 1,
-0.2577827, -0.8233202, -3.17767, 1, 0, 0, 1, 1,
-0.2566259, -1.337435, -2.747216, 1, 0, 0, 1, 1,
-0.2539424, -0.7338312, -0.9664977, 1, 0, 0, 1, 1,
-0.2529666, -0.6607993, -2.152921, 0, 0, 0, 1, 1,
-0.2453893, 0.07873509, -2.829584, 0, 0, 0, 1, 1,
-0.2418351, -1.211187, -3.642833, 0, 0, 0, 1, 1,
-0.2302203, -0.1709432, -2.066132, 0, 0, 0, 1, 1,
-0.2249689, -0.06585065, -1.661618, 0, 0, 0, 1, 1,
-0.2247575, -1.280951, -2.507932, 0, 0, 0, 1, 1,
-0.2241939, -1.209484, -2.666783, 0, 0, 0, 1, 1,
-0.2231567, -1.031754, -2.517355, 1, 1, 1, 1, 1,
-0.218668, -0.339166, -2.560675, 1, 1, 1, 1, 1,
-0.2149669, 0.239418, -0.3709873, 1, 1, 1, 1, 1,
-0.2104602, -1.527673, -3.366124, 1, 1, 1, 1, 1,
-0.2078916, -0.2267124, -2.256073, 1, 1, 1, 1, 1,
-0.2064165, 1.578967, 2.431729, 1, 1, 1, 1, 1,
-0.2037834, 0.1699125, -0.1996888, 1, 1, 1, 1, 1,
-0.2032237, -1.758147, -2.588208, 1, 1, 1, 1, 1,
-0.2030385, -0.497922, -3.077329, 1, 1, 1, 1, 1,
-0.2021758, 0.955182, -2.851143, 1, 1, 1, 1, 1,
-0.2016507, 1.047529, -0.6676278, 1, 1, 1, 1, 1,
-0.1863656, -0.7675964, -0.7738039, 1, 1, 1, 1, 1,
-0.1854542, -0.3724957, -1.33229, 1, 1, 1, 1, 1,
-0.1849381, 0.7304653, 0.007457044, 1, 1, 1, 1, 1,
-0.1841234, -0.1164704, -1.144618, 1, 1, 1, 1, 1,
-0.1839936, 0.8766975, -2.069712, 0, 0, 1, 1, 1,
-0.1836158, 1.612107, -0.8716571, 1, 0, 0, 1, 1,
-0.183178, 1.422151, 1.321584, 1, 0, 0, 1, 1,
-0.1824232, 0.6612888, -0.03875536, 1, 0, 0, 1, 1,
-0.1819225, 0.05567632, -2.104821, 1, 0, 0, 1, 1,
-0.1798622, 0.9587202, 0.7306269, 1, 0, 0, 1, 1,
-0.179259, 0.986912, 0.4733186, 0, 0, 0, 1, 1,
-0.1781735, -0.4084655, -3.642113, 0, 0, 0, 1, 1,
-0.1775422, 0.7353879, 0.9049401, 0, 0, 0, 1, 1,
-0.1770593, 0.6677477, -0.6813433, 0, 0, 0, 1, 1,
-0.1745268, -2.015631, -3.925816, 0, 0, 0, 1, 1,
-0.1695485, 0.8000776, 0.4529404, 0, 0, 0, 1, 1,
-0.1693387, 0.01213278, -0.7652333, 0, 0, 0, 1, 1,
-0.1692862, 0.8004394, -0.9369619, 1, 1, 1, 1, 1,
-0.1676558, 0.991892, -1.318829, 1, 1, 1, 1, 1,
-0.166948, -0.8358438, -3.046637, 1, 1, 1, 1, 1,
-0.1667553, 0.08595288, -1.058707, 1, 1, 1, 1, 1,
-0.1661928, -0.3883424, -4.058308, 1, 1, 1, 1, 1,
-0.1656777, -0.6161522, -6.099543, 1, 1, 1, 1, 1,
-0.1647754, 0.1502809, -1.712438, 1, 1, 1, 1, 1,
-0.1636253, -1.233147, -1.273573, 1, 1, 1, 1, 1,
-0.163349, 0.6475674, -1.015894, 1, 1, 1, 1, 1,
-0.1591167, -0.1279364, -3.397148, 1, 1, 1, 1, 1,
-0.156918, -0.448884, -4.63105, 1, 1, 1, 1, 1,
-0.1534986, 1.187508, -1.17504, 1, 1, 1, 1, 1,
-0.1505918, 1.401908, -0.3535765, 1, 1, 1, 1, 1,
-0.1454362, 0.6872426, 1.005976, 1, 1, 1, 1, 1,
-0.1435172, -0.1410842, -2.079491, 1, 1, 1, 1, 1,
-0.1433327, -0.03478024, -1.379599, 0, 0, 1, 1, 1,
-0.1414028, -0.4923729, -3.337086, 1, 0, 0, 1, 1,
-0.141036, -0.6326821, -2.903324, 1, 0, 0, 1, 1,
-0.1401256, -0.8306746, -2.033705, 1, 0, 0, 1, 1,
-0.1391093, 0.6635367, 0.4493437, 1, 0, 0, 1, 1,
-0.1379783, 1.741077, -0.8746772, 1, 0, 0, 1, 1,
-0.1376925, 0.4164184, -1.879668, 0, 0, 0, 1, 1,
-0.1287275, 0.5599418, -1.092554, 0, 0, 0, 1, 1,
-0.1159487, 0.7420778, -0.7777291, 0, 0, 0, 1, 1,
-0.11501, 0.8364583, -0.3605697, 0, 0, 0, 1, 1,
-0.1141186, 0.151537, -0.1925734, 0, 0, 0, 1, 1,
-0.1140729, 1.454885, 1.086917, 0, 0, 0, 1, 1,
-0.1084409, 0.9425752, 0.9558415, 0, 0, 0, 1, 1,
-0.09809306, 1.215881, 0.2382875, 1, 1, 1, 1, 1,
-0.09677064, -0.1058536, -2.043459, 1, 1, 1, 1, 1,
-0.09476265, -1.188882, -3.183372, 1, 1, 1, 1, 1,
-0.09473149, 0.2781564, 0.3969686, 1, 1, 1, 1, 1,
-0.09052829, -0.1286634, -3.296457, 1, 1, 1, 1, 1,
-0.08655084, 0.6314458, -0.09893657, 1, 1, 1, 1, 1,
-0.08416199, -1.35302, -2.5106, 1, 1, 1, 1, 1,
-0.08216286, -0.364467, -4.294066, 1, 1, 1, 1, 1,
-0.08186354, 1.126011, -0.9400976, 1, 1, 1, 1, 1,
-0.07988228, 0.9012461, 0.5107534, 1, 1, 1, 1, 1,
-0.07880238, 0.1040566, -1.362979, 1, 1, 1, 1, 1,
-0.07867331, 1.840266, -0.7984624, 1, 1, 1, 1, 1,
-0.07389659, -0.1384087, -1.773633, 1, 1, 1, 1, 1,
-0.07058891, -1.412974, -1.45406, 1, 1, 1, 1, 1,
-0.0670876, 1.450267, 0.09242815, 1, 1, 1, 1, 1,
-0.06320269, -1.383542, -3.812776, 0, 0, 1, 1, 1,
-0.05983004, -0.8849586, -2.987876, 1, 0, 0, 1, 1,
-0.05901291, -2.697902, -3.810616, 1, 0, 0, 1, 1,
-0.05713865, -0.4326795, -1.394473, 1, 0, 0, 1, 1,
-0.05403004, -0.1783691, -2.231602, 1, 0, 0, 1, 1,
-0.05323378, -0.6368067, -5.089863, 1, 0, 0, 1, 1,
-0.04686737, 0.2312457, 0.450733, 0, 0, 0, 1, 1,
-0.04559756, 1.153252, -0.7017567, 0, 0, 0, 1, 1,
-0.04110032, -2.65582, -3.181351, 0, 0, 0, 1, 1,
-0.04014912, -0.2568849, -3.115575, 0, 0, 0, 1, 1,
-0.03985278, 1.790282, -0.4264091, 0, 0, 0, 1, 1,
-0.0346941, 1.118708, 0.3660675, 0, 0, 0, 1, 1,
-0.02987599, 1.337024, -1.222441, 0, 0, 0, 1, 1,
-0.0284663, 0.3196079, -1.570696, 1, 1, 1, 1, 1,
-0.02838097, 2.053528, 0.3028327, 1, 1, 1, 1, 1,
-0.02551805, -0.7507325, -3.616542, 1, 1, 1, 1, 1,
-0.02035875, -1.032162, -4.493215, 1, 1, 1, 1, 1,
-0.01837749, -0.4011096, -3.832469, 1, 1, 1, 1, 1,
-0.01749338, -1.480011, -2.715827, 1, 1, 1, 1, 1,
-0.01658827, -0.2782416, -4.537249, 1, 1, 1, 1, 1,
-0.005801936, 0.3298343, 0.6782367, 1, 1, 1, 1, 1,
-0.003864997, -1.152578, -3.27976, 1, 1, 1, 1, 1,
-0.002666139, -0.1362199, -4.41672, 1, 1, 1, 1, 1,
-0.0003757693, -0.209891, -4.091232, 1, 1, 1, 1, 1,
0.000133949, 1.878666, 0.5404978, 1, 1, 1, 1, 1,
0.0007014937, -0.9255635, 3.693889, 1, 1, 1, 1, 1,
0.001444643, -2.477367, 3.432646, 1, 1, 1, 1, 1,
0.002807842, 0.8278243, 0.06849851, 1, 1, 1, 1, 1,
0.006743495, 1.322113, 0.5733953, 0, 0, 1, 1, 1,
0.008905249, -0.1430355, 2.813489, 1, 0, 0, 1, 1,
0.01187491, 1.530563, -1.903633, 1, 0, 0, 1, 1,
0.01408461, 0.142425, 1.439203, 1, 0, 0, 1, 1,
0.01649103, 0.4465357, 0.1570087, 1, 0, 0, 1, 1,
0.01930933, -0.3480285, 3.373877, 1, 0, 0, 1, 1,
0.02214707, 0.02632752, 1.297191, 0, 0, 0, 1, 1,
0.02439787, -0.2516471, 1.745028, 0, 0, 0, 1, 1,
0.03377008, 1.047302, 2.014396, 0, 0, 0, 1, 1,
0.03443975, 0.8314521, -0.8343872, 0, 0, 0, 1, 1,
0.03462227, 2.629732, 0.4397984, 0, 0, 0, 1, 1,
0.03561846, 0.07215512, 1.124075, 0, 0, 0, 1, 1,
0.0394774, -1.065766, 3.517045, 0, 0, 0, 1, 1,
0.04167735, -0.3721994, 2.449367, 1, 1, 1, 1, 1,
0.04259698, 0.1820051, 0.1212832, 1, 1, 1, 1, 1,
0.04266578, 0.7570221, -0.06497642, 1, 1, 1, 1, 1,
0.04412483, -0.3393883, 3.346547, 1, 1, 1, 1, 1,
0.04569072, -0.0441037, 0.4939128, 1, 1, 1, 1, 1,
0.04994656, 0.7045576, 0.3853879, 1, 1, 1, 1, 1,
0.05108076, 1.053825, 1.165319, 1, 1, 1, 1, 1,
0.05198098, -0.8027125, 3.415857, 1, 1, 1, 1, 1,
0.05202292, 1.243658, -0.03704558, 1, 1, 1, 1, 1,
0.05303736, -1.687107, 4.612059, 1, 1, 1, 1, 1,
0.05331019, -0.901354, 4.400873, 1, 1, 1, 1, 1,
0.0545003, -0.6885985, 4.090253, 1, 1, 1, 1, 1,
0.05613124, -0.6592133, 1.859373, 1, 1, 1, 1, 1,
0.06633733, 0.9854786, 1.853262, 1, 1, 1, 1, 1,
0.06715705, -0.8425573, 3.61616, 1, 1, 1, 1, 1,
0.07006807, 0.2121831, 2.918932, 0, 0, 1, 1, 1,
0.07140195, -0.2429817, 2.941616, 1, 0, 0, 1, 1,
0.07354153, 0.3036785, 0.1874685, 1, 0, 0, 1, 1,
0.07592715, 0.2439533, 0.2389136, 1, 0, 0, 1, 1,
0.07616652, 1.091689, -0.3341801, 1, 0, 0, 1, 1,
0.08134089, 0.1208026, 2.819403, 1, 0, 0, 1, 1,
0.08157419, 1.157374, 0.6750324, 0, 0, 0, 1, 1,
0.08495359, 0.4126193, -0.3420528, 0, 0, 0, 1, 1,
0.08734199, -0.3797044, 4.552593, 0, 0, 0, 1, 1,
0.08846658, -0.4785079, 1.908419, 0, 0, 0, 1, 1,
0.0893779, -1.635366, 3.741783, 0, 0, 0, 1, 1,
0.0914184, -0.7620377, 3.149382, 0, 0, 0, 1, 1,
0.09243886, -1.392077, 2.652508, 0, 0, 0, 1, 1,
0.09486886, -1.676731, 3.169726, 1, 1, 1, 1, 1,
0.09819262, 0.4848712, 1.157237, 1, 1, 1, 1, 1,
0.1021547, -0.3281035, 4.128221, 1, 1, 1, 1, 1,
0.1060277, 1.511701, 0.709996, 1, 1, 1, 1, 1,
0.1084964, 0.1200247, 0.3521975, 1, 1, 1, 1, 1,
0.1090976, 0.346033, -0.1146804, 1, 1, 1, 1, 1,
0.1099634, -1.162108, 1.999848, 1, 1, 1, 1, 1,
0.1132483, -0.4411746, 2.562295, 1, 1, 1, 1, 1,
0.1150408, -0.4911255, 2.499563, 1, 1, 1, 1, 1,
0.1182896, 0.4064043, -0.1625587, 1, 1, 1, 1, 1,
0.1272809, -0.144032, 2.30261, 1, 1, 1, 1, 1,
0.1279802, -0.4614275, 2.239083, 1, 1, 1, 1, 1,
0.1296755, 0.4528238, 0.4502754, 1, 1, 1, 1, 1,
0.1317368, 1.389989, -0.07980202, 1, 1, 1, 1, 1,
0.1328352, 0.1695118, 0.2400786, 1, 1, 1, 1, 1,
0.1361198, -1.402372, 2.273041, 0, 0, 1, 1, 1,
0.1375707, 0.3418812, -0.03484913, 1, 0, 0, 1, 1,
0.1384106, -0.3903688, 3.524711, 1, 0, 0, 1, 1,
0.1391436, 0.8787956, 1.728747, 1, 0, 0, 1, 1,
0.1410775, -0.4415611, 2.780358, 1, 0, 0, 1, 1,
0.1418392, 1.513832, 0.7835854, 1, 0, 0, 1, 1,
0.1422165, 0.894502, -0.09010749, 0, 0, 0, 1, 1,
0.1505912, 1.757482, -0.7985653, 0, 0, 0, 1, 1,
0.1514081, -0.3999484, 3.764619, 0, 0, 0, 1, 1,
0.154307, -1.805481, 2.869979, 0, 0, 0, 1, 1,
0.1547114, 0.5659755, -1.170449, 0, 0, 0, 1, 1,
0.1581272, -1.576679, 3.408305, 0, 0, 0, 1, 1,
0.16324, 0.2341762, 1.541547, 0, 0, 0, 1, 1,
0.1680999, 0.3545477, 0.5291266, 1, 1, 1, 1, 1,
0.1689984, -0.3287717, 4.100784, 1, 1, 1, 1, 1,
0.1708175, -0.2497929, 1.154611, 1, 1, 1, 1, 1,
0.1732307, -1.724709, 4.016816, 1, 1, 1, 1, 1,
0.1753599, 0.06803568, -0.1470977, 1, 1, 1, 1, 1,
0.1794768, -0.1555176, 3.381627, 1, 1, 1, 1, 1,
0.1830604, 0.7834534, 0.2366545, 1, 1, 1, 1, 1,
0.1843944, 0.8289037, 1.339986, 1, 1, 1, 1, 1,
0.1865492, 1.797921, 0.6244478, 1, 1, 1, 1, 1,
0.1868837, -0.04914561, -0.05167192, 1, 1, 1, 1, 1,
0.1887954, -0.05991873, 0.3454286, 1, 1, 1, 1, 1,
0.189933, -1.243654, 1.512039, 1, 1, 1, 1, 1,
0.1907382, -0.2910455, 3.439026, 1, 1, 1, 1, 1,
0.1944143, -0.7188922, 5.157862, 1, 1, 1, 1, 1,
0.1972596, 1.045112, -0.7368762, 1, 1, 1, 1, 1,
0.1977959, 0.3832506, -0.05734164, 0, 0, 1, 1, 1,
0.1988656, 2.123137, 0.03282352, 1, 0, 0, 1, 1,
0.2010609, -1.27967, 2.456139, 1, 0, 0, 1, 1,
0.2098851, 0.9110855, 2.221688, 1, 0, 0, 1, 1,
0.210353, -0.09206255, 1.356109, 1, 0, 0, 1, 1,
0.2142715, 1.012341, -0.4126278, 1, 0, 0, 1, 1,
0.2143956, -0.3191267, 1.49689, 0, 0, 0, 1, 1,
0.2150492, -0.6481311, 4.794713, 0, 0, 0, 1, 1,
0.2170386, 2.168445, -0.889003, 0, 0, 0, 1, 1,
0.2186358, -0.6129807, 3.704563, 0, 0, 0, 1, 1,
0.2226913, 1.735388, 0.271966, 0, 0, 0, 1, 1,
0.2250728, 1.553027, -0.6736533, 0, 0, 0, 1, 1,
0.2274611, -0.4570898, 1.151063, 0, 0, 0, 1, 1,
0.2337311, -0.6509772, 3.426401, 1, 1, 1, 1, 1,
0.2361384, -1.794376, 3.405735, 1, 1, 1, 1, 1,
0.2364166, 2.046436, 0.2057294, 1, 1, 1, 1, 1,
0.2381934, 0.2305802, 1.421885, 1, 1, 1, 1, 1,
0.2389016, 0.06128729, 1.826668, 1, 1, 1, 1, 1,
0.2409769, -0.5894461, 3.232349, 1, 1, 1, 1, 1,
0.2432766, -0.6400459, 3.060028, 1, 1, 1, 1, 1,
0.2435169, 0.1543603, 2.115373, 1, 1, 1, 1, 1,
0.2447594, 1.923775, 0.3690006, 1, 1, 1, 1, 1,
0.2491437, -1.141148, 2.212011, 1, 1, 1, 1, 1,
0.2492713, -1.370619, 3.909982, 1, 1, 1, 1, 1,
0.2501698, -0.6922354, 1.376311, 1, 1, 1, 1, 1,
0.2663918, -1.358406, 4.49603, 1, 1, 1, 1, 1,
0.2688931, -0.4575352, 2.119136, 1, 1, 1, 1, 1,
0.2746574, -1.304435, 2.110997, 1, 1, 1, 1, 1,
0.2784092, -0.4459522, 4.046422, 0, 0, 1, 1, 1,
0.2867675, 1.249611, 1.38678, 1, 0, 0, 1, 1,
0.2896907, 0.534728, 0.3449936, 1, 0, 0, 1, 1,
0.2929866, -1.108715, 3.184381, 1, 0, 0, 1, 1,
0.2947052, -0.01320431, 2.102314, 1, 0, 0, 1, 1,
0.2951035, -0.1658588, 2.972156, 1, 0, 0, 1, 1,
0.2961259, -0.8440719, 1.725247, 0, 0, 0, 1, 1,
0.2983743, 0.3017972, 0.7800853, 0, 0, 0, 1, 1,
0.3126341, -1.975267, 3.793421, 0, 0, 0, 1, 1,
0.3131253, -1.20414, 4.865036, 0, 0, 0, 1, 1,
0.3151268, 0.1264637, -0.1913983, 0, 0, 0, 1, 1,
0.3218544, 0.9891587, 1.086106, 0, 0, 0, 1, 1,
0.3261756, 1.394107, -1.11363, 0, 0, 0, 1, 1,
0.3278752, -0.4269818, 2.500922, 1, 1, 1, 1, 1,
0.3280677, 0.565791, 1.013384, 1, 1, 1, 1, 1,
0.3282251, 0.9036355, 0.7083504, 1, 1, 1, 1, 1,
0.3322989, -0.8600172, 1.588007, 1, 1, 1, 1, 1,
0.3352979, 1.288666, 0.9701647, 1, 1, 1, 1, 1,
0.3392665, -0.750105, 2.766628, 1, 1, 1, 1, 1,
0.3404372, 1.511089, -0.05539483, 1, 1, 1, 1, 1,
0.3448787, -0.7237134, 1.227336, 1, 1, 1, 1, 1,
0.3461411, -0.3969361, 1.222181, 1, 1, 1, 1, 1,
0.3474614, -1.036184, 1.218483, 1, 1, 1, 1, 1,
0.3481216, -0.2120363, 0.755325, 1, 1, 1, 1, 1,
0.3498969, -0.9429829, 4.172721, 1, 1, 1, 1, 1,
0.3542431, 1.092586, 1.741458, 1, 1, 1, 1, 1,
0.3565587, 0.6861802, 0.1966664, 1, 1, 1, 1, 1,
0.3578195, -0.5275611, 2.933493, 1, 1, 1, 1, 1,
0.3631058, 1.862097, 1.888163, 0, 0, 1, 1, 1,
0.3656243, 0.2117593, 0.4343275, 1, 0, 0, 1, 1,
0.3677724, 0.5471157, 0.6414534, 1, 0, 0, 1, 1,
0.3677824, 1.460987, 1.247587, 1, 0, 0, 1, 1,
0.3694953, -0.3368963, 2.229143, 1, 0, 0, 1, 1,
0.3739453, -0.2947738, 1.94077, 1, 0, 0, 1, 1,
0.3754379, 0.09650794, 1.70542, 0, 0, 0, 1, 1,
0.3823444, -0.1620308, 1.699468, 0, 0, 0, 1, 1,
0.3852428, 0.3208953, 0.3210064, 0, 0, 0, 1, 1,
0.392948, 0.4355089, 0.5298587, 0, 0, 0, 1, 1,
0.404807, 0.1223967, 0.562012, 0, 0, 0, 1, 1,
0.405764, 0.7903073, 1.11922, 0, 0, 0, 1, 1,
0.4098528, -0.9030941, 2.395384, 0, 0, 0, 1, 1,
0.4118642, 1.497744, 0.7817311, 1, 1, 1, 1, 1,
0.4137251, 1.026145, 0.4824305, 1, 1, 1, 1, 1,
0.4142081, 2.476971, -1.071438, 1, 1, 1, 1, 1,
0.4162101, 0.9549476, 1.380703, 1, 1, 1, 1, 1,
0.4189835, 1.263838, -0.895884, 1, 1, 1, 1, 1,
0.4263692, 0.8306439, -2.419723, 1, 1, 1, 1, 1,
0.4277761, -0.5213369, 3.418901, 1, 1, 1, 1, 1,
0.4307209, -0.6501014, 0.9735816, 1, 1, 1, 1, 1,
0.435122, -0.0004602182, 3.434777, 1, 1, 1, 1, 1,
0.452314, -0.5048554, 3.329132, 1, 1, 1, 1, 1,
0.4524537, -0.765272, 2.571243, 1, 1, 1, 1, 1,
0.4549578, -0.2055661, 2.452481, 1, 1, 1, 1, 1,
0.4558053, -0.2681148, 1.020492, 1, 1, 1, 1, 1,
0.45884, 0.1967199, 0.1293534, 1, 1, 1, 1, 1,
0.4643117, 0.3794994, 0.1038968, 1, 1, 1, 1, 1,
0.4710534, 0.01895651, -0.5185802, 0, 0, 1, 1, 1,
0.4724466, -0.166116, 0.6050887, 1, 0, 0, 1, 1,
0.472551, 0.8394145, 1.647863, 1, 0, 0, 1, 1,
0.473628, 3.110189, 0.06756541, 1, 0, 0, 1, 1,
0.4773501, 0.6225676, 0.3036215, 1, 0, 0, 1, 1,
0.4781986, 0.08972659, 0.6091035, 1, 0, 0, 1, 1,
0.4809402, 0.3460564, 2.258957, 0, 0, 0, 1, 1,
0.4887061, -0.1056916, 2.465507, 0, 0, 0, 1, 1,
0.489991, 1.367151, 1.554425, 0, 0, 0, 1, 1,
0.4915174, 0.05092659, 1.516191, 0, 0, 0, 1, 1,
0.4937704, -0.1218922, 1.615304, 0, 0, 0, 1, 1,
0.5091146, 0.5764057, 2.14738, 0, 0, 0, 1, 1,
0.5154306, -1.42478, 2.579829, 0, 0, 0, 1, 1,
0.5255978, -0.3743101, -0.7074307, 1, 1, 1, 1, 1,
0.52945, 0.3804356, 2.188522, 1, 1, 1, 1, 1,
0.5297443, -0.2941169, 2.778192, 1, 1, 1, 1, 1,
0.537343, 1.514839, 1.219373, 1, 1, 1, 1, 1,
0.5414646, 0.557027, -1.570104, 1, 1, 1, 1, 1,
0.5444309, -0.8545679, 3.024329, 1, 1, 1, 1, 1,
0.551567, 0.8040277, 1.552579, 1, 1, 1, 1, 1,
0.5540223, -0.1575474, 1.271114, 1, 1, 1, 1, 1,
0.5560356, 0.2867151, 0.8931395, 1, 1, 1, 1, 1,
0.5560378, -0.9167452, 2.910608, 1, 1, 1, 1, 1,
0.5567387, 1.792293, 0.6957867, 1, 1, 1, 1, 1,
0.558899, 0.5879207, 2.330125, 1, 1, 1, 1, 1,
0.5604507, 1.966347, -0.3442847, 1, 1, 1, 1, 1,
0.5606581, -0.8988886, 3.238697, 1, 1, 1, 1, 1,
0.5686709, -1.32142, 2.699709, 1, 1, 1, 1, 1,
0.5693648, 0.1150652, 2.190253, 0, 0, 1, 1, 1,
0.5693784, 0.5788394, -0.1236108, 1, 0, 0, 1, 1,
0.5719913, -0.7138359, 3.745819, 1, 0, 0, 1, 1,
0.5761449, 0.8732662, 0.7936251, 1, 0, 0, 1, 1,
0.5929368, 0.1688356, 0.2720777, 1, 0, 0, 1, 1,
0.5963848, -1.727734, 2.927226, 1, 0, 0, 1, 1,
0.5972716, -0.8193817, 1.280433, 0, 0, 0, 1, 1,
0.5992678, 0.7658467, 0.8242511, 0, 0, 0, 1, 1,
0.6024114, 0.8699279, 1.14811, 0, 0, 0, 1, 1,
0.6024383, -0.389573, 2.76468, 0, 0, 0, 1, 1,
0.6040907, 2.210224, -1.323748, 0, 0, 0, 1, 1,
0.6105873, -2.047505, 2.466037, 0, 0, 0, 1, 1,
0.617285, -0.5719542, 2.528087, 0, 0, 0, 1, 1,
0.6192015, 1.245129, 1.494291, 1, 1, 1, 1, 1,
0.6194957, 1.298874, 1.238564, 1, 1, 1, 1, 1,
0.6268921, 0.860632, 1.115849, 1, 1, 1, 1, 1,
0.6286054, 2.190089, 2.83065, 1, 1, 1, 1, 1,
0.6308772, 1.30803, 0.4403523, 1, 1, 1, 1, 1,
0.6339298, 1.090964, -0.9731505, 1, 1, 1, 1, 1,
0.6389994, -0.3033895, 2.611999, 1, 1, 1, 1, 1,
0.6394736, -0.4965818, 3.457204, 1, 1, 1, 1, 1,
0.6395125, 2.588599, -0.4107192, 1, 1, 1, 1, 1,
0.6399887, 0.2239174, 1.008595, 1, 1, 1, 1, 1,
0.642103, -1.769055, 2.844872, 1, 1, 1, 1, 1,
0.6461931, 0.6290383, -1.068648, 1, 1, 1, 1, 1,
0.6464214, -0.1191257, 2.397735, 1, 1, 1, 1, 1,
0.6477859, -0.3884578, 2.651567, 1, 1, 1, 1, 1,
0.6493561, -0.1017377, 0.7650196, 1, 1, 1, 1, 1,
0.6540895, 0.05722275, 0.272864, 0, 0, 1, 1, 1,
0.6587682, 1.177238, -0.5075682, 1, 0, 0, 1, 1,
0.6590517, -1.767713, 0.9334511, 1, 0, 0, 1, 1,
0.661185, 0.5880198, -0.3098615, 1, 0, 0, 1, 1,
0.6646791, -0.1900496, 0.5359604, 1, 0, 0, 1, 1,
0.6715039, -0.3697514, 4.751594, 1, 0, 0, 1, 1,
0.6720259, 0.8428767, 1.552159, 0, 0, 0, 1, 1,
0.6732549, -0.5003877, 3.385034, 0, 0, 0, 1, 1,
0.6788206, -1.4831, 1.912862, 0, 0, 0, 1, 1,
0.6824505, 0.5149911, 1.416378, 0, 0, 0, 1, 1,
0.6826141, 1.089989, 0.675792, 0, 0, 0, 1, 1,
0.6826559, -1.435529, 1.363136, 0, 0, 0, 1, 1,
0.6961207, 0.425152, 2.178203, 0, 0, 0, 1, 1,
0.6963054, 1.877222, 0.2870309, 1, 1, 1, 1, 1,
0.6995625, -2.286229, 1.379619, 1, 1, 1, 1, 1,
0.6998122, -0.5206029, 1.945477, 1, 1, 1, 1, 1,
0.7067568, -1.376487, 1.220974, 1, 1, 1, 1, 1,
0.7077048, -1.974164, 1.391029, 1, 1, 1, 1, 1,
0.7165527, 0.7301297, 0.6124154, 1, 1, 1, 1, 1,
0.7190666, -0.09317819, 1.908926, 1, 1, 1, 1, 1,
0.7302707, -2.276837, 2.343433, 1, 1, 1, 1, 1,
0.7358689, 0.6379799, 0.7339916, 1, 1, 1, 1, 1,
0.7406704, -0.5983045, 2.641778, 1, 1, 1, 1, 1,
0.7430437, 0.8669493, 0.8910277, 1, 1, 1, 1, 1,
0.7440308, -1.426849, 2.561102, 1, 1, 1, 1, 1,
0.7442165, -0.6001465, 1.903001, 1, 1, 1, 1, 1,
0.7487105, -0.2936055, 1.45273, 1, 1, 1, 1, 1,
0.7491848, -0.6651515, 2.350762, 1, 1, 1, 1, 1,
0.751369, 0.6453024, 2.568638, 0, 0, 1, 1, 1,
0.7597563, 0.2705304, 1.205514, 1, 0, 0, 1, 1,
0.7610706, 0.1302605, 2.064051, 1, 0, 0, 1, 1,
0.7645759, -1.852504, 5.412845, 1, 0, 0, 1, 1,
0.7650051, -1.136292, 2.076865, 1, 0, 0, 1, 1,
0.7661541, 0.5521627, 1.660835, 1, 0, 0, 1, 1,
0.774531, 0.4091798, 0.5620196, 0, 0, 0, 1, 1,
0.7767217, 1.875741, 1.543239, 0, 0, 0, 1, 1,
0.7824386, 0.6531181, -0.6771894, 0, 0, 0, 1, 1,
0.7836462, 0.2593666, 0.4610862, 0, 0, 0, 1, 1,
0.789569, 0.3695457, 1.416111, 0, 0, 0, 1, 1,
0.7895954, 1.473031, -0.2901849, 0, 0, 0, 1, 1,
0.8001701, -0.01956022, -0.3525695, 0, 0, 0, 1, 1,
0.8003772, 0.5304552, -0.4260007, 1, 1, 1, 1, 1,
0.8015891, 0.09235045, 1.17463, 1, 1, 1, 1, 1,
0.8061486, -0.4832485, 1.350545, 1, 1, 1, 1, 1,
0.8139057, -0.8506928, 2.113884, 1, 1, 1, 1, 1,
0.8157297, -1.004265, 2.561013, 1, 1, 1, 1, 1,
0.8184075, -0.3448195, 3.945425, 1, 1, 1, 1, 1,
0.8235867, 2.973709, 1.464039, 1, 1, 1, 1, 1,
0.8263556, -1.033643, 2.291624, 1, 1, 1, 1, 1,
0.8315902, -0.1916782, 2.265424, 1, 1, 1, 1, 1,
0.8319181, 1.000462, -1.367823, 1, 1, 1, 1, 1,
0.8326684, 3.122491, -1.402466, 1, 1, 1, 1, 1,
0.8337932, 0.5413474, -0.2287212, 1, 1, 1, 1, 1,
0.8368548, 0.4965009, 1.639973, 1, 1, 1, 1, 1,
0.8420382, -0.3117639, 2.057471, 1, 1, 1, 1, 1,
0.8426644, -0.2844037, 2.798447, 1, 1, 1, 1, 1,
0.8457919, -0.5010039, 2.083395, 0, 0, 1, 1, 1,
0.846532, 0.1133139, 2.127377, 1, 0, 0, 1, 1,
0.8469948, 0.7058254, 1.062908, 1, 0, 0, 1, 1,
0.8471181, 0.009937467, 0.84771, 1, 0, 0, 1, 1,
0.8508971, -0.3029277, 2.488657, 1, 0, 0, 1, 1,
0.8518085, 0.6444058, -0.7145361, 1, 0, 0, 1, 1,
0.8585474, 0.5126876, 0.9092851, 0, 0, 0, 1, 1,
0.8590055, -0.2443971, 2.951674, 0, 0, 0, 1, 1,
0.8617252, 0.7547237, 2.159682, 0, 0, 0, 1, 1,
0.8649253, 1.665882, 0.05464637, 0, 0, 0, 1, 1,
0.865826, -0.9098104, 5.394591, 0, 0, 0, 1, 1,
0.8686924, 0.7222131, 0.2477037, 0, 0, 0, 1, 1,
0.8718332, 0.3747791, 1.593741, 0, 0, 0, 1, 1,
0.8759066, -0.2692759, 1.606292, 1, 1, 1, 1, 1,
0.878843, -0.6222744, 3.017516, 1, 1, 1, 1, 1,
0.8847849, 0.3251601, 1.775478, 1, 1, 1, 1, 1,
0.8864595, 0.5225483, 1.085014, 1, 1, 1, 1, 1,
0.8869533, 0.4629526, 0.7481388, 1, 1, 1, 1, 1,
0.8888488, 0.1775809, 2.723948, 1, 1, 1, 1, 1,
0.8897288, 0.1378127, -0.547895, 1, 1, 1, 1, 1,
0.890106, -2.168159, 2.164987, 1, 1, 1, 1, 1,
0.8902178, -1.025385, 2.603282, 1, 1, 1, 1, 1,
0.8912234, 0.7150095, 1.623124, 1, 1, 1, 1, 1,
0.8961049, 0.320969, 1.208777, 1, 1, 1, 1, 1,
0.901712, 0.6083902, -0.2648068, 1, 1, 1, 1, 1,
0.9033849, 1.136452, 1.594333, 1, 1, 1, 1, 1,
0.9132001, 0.6185079, 2.448748, 1, 1, 1, 1, 1,
0.9190168, -1.766825, 3.123049, 1, 1, 1, 1, 1,
0.9219559, 0.4718206, -0.06683961, 0, 0, 1, 1, 1,
0.9241378, 0.2468831, 1.859378, 1, 0, 0, 1, 1,
0.9250147, -0.1367649, 2.003449, 1, 0, 0, 1, 1,
0.925046, -0.09989595, 2.263283, 1, 0, 0, 1, 1,
0.9265748, 0.02574747, 0.02903051, 1, 0, 0, 1, 1,
0.9292191, 0.09366672, 1.779244, 1, 0, 0, 1, 1,
0.9316331, 0.9853942, 0.3517074, 0, 0, 0, 1, 1,
0.931798, 0.1400127, 0.4699458, 0, 0, 0, 1, 1,
0.9336347, 0.1517073, 2.500646, 0, 0, 0, 1, 1,
0.9366432, 0.2654675, 2.43831, 0, 0, 0, 1, 1,
0.9378096, -0.5398991, 0.3736075, 0, 0, 0, 1, 1,
0.9405397, 0.8090974, 0.4387903, 0, 0, 0, 1, 1,
0.9439686, -0.2234418, -0.06445522, 0, 0, 0, 1, 1,
0.946377, 0.3358241, 1.645363, 1, 1, 1, 1, 1,
0.9540873, 1.087033, -0.3893468, 1, 1, 1, 1, 1,
0.9547409, -1.175438, 1.788819, 1, 1, 1, 1, 1,
0.9590388, 0.03880458, 2.327355, 1, 1, 1, 1, 1,
0.9631819, 0.554558, 1.08503, 1, 1, 1, 1, 1,
0.9647285, 0.09540834, -0.6313748, 1, 1, 1, 1, 1,
0.9661753, -0.4764721, 0.7546093, 1, 1, 1, 1, 1,
0.9669366, -1.168667, 2.965606, 1, 1, 1, 1, 1,
0.975069, -1.34218, 2.523697, 1, 1, 1, 1, 1,
0.9796556, 1.394967, 0.8980531, 1, 1, 1, 1, 1,
0.9809901, 1.403463, -1.078924, 1, 1, 1, 1, 1,
0.9815062, 1.390719, 0.9066455, 1, 1, 1, 1, 1,
0.9902636, -0.28272, 2.181131, 1, 1, 1, 1, 1,
0.9912373, -0.7621158, 2.764992, 1, 1, 1, 1, 1,
0.9919346, 1.818935, 0.2944227, 1, 1, 1, 1, 1,
0.9988853, 0.7508866, 1.199098, 0, 0, 1, 1, 1,
0.9988961, -0.3927817, 3.549771, 1, 0, 0, 1, 1,
1.002647, -0.9822931, 3.322037, 1, 0, 0, 1, 1,
1.007474, -0.5287265, 2.007745, 1, 0, 0, 1, 1,
1.008235, -1.139283, 2.152458, 1, 0, 0, 1, 1,
1.012124, -0.1298005, 2.186586, 1, 0, 0, 1, 1,
1.012933, -0.3036879, 2.15603, 0, 0, 0, 1, 1,
1.013026, 0.04669905, 1.582866, 0, 0, 0, 1, 1,
1.014657, -0.8894322, 4.039608, 0, 0, 0, 1, 1,
1.015489, 0.06432963, 2.598858, 0, 0, 0, 1, 1,
1.018931, 0.5184979, 0.8353997, 0, 0, 0, 1, 1,
1.02029, 1.030772, -1.351527, 0, 0, 0, 1, 1,
1.02054, 0.227799, 2.647905, 0, 0, 0, 1, 1,
1.024308, -1.065896, 1.00655, 1, 1, 1, 1, 1,
1.034289, 1.301175, 1.787221, 1, 1, 1, 1, 1,
1.044557, 0.07847114, 2.739065, 1, 1, 1, 1, 1,
1.045116, 1.092191, 0.9265457, 1, 1, 1, 1, 1,
1.051739, -0.3936489, 2.750386, 1, 1, 1, 1, 1,
1.056274, 0.9995494, 1.022021, 1, 1, 1, 1, 1,
1.057011, -1.965029, 1.918304, 1, 1, 1, 1, 1,
1.057213, -0.8869191, 1.537717, 1, 1, 1, 1, 1,
1.061078, 0.1813823, 1.405484, 1, 1, 1, 1, 1,
1.061105, -0.7096639, 3.799541, 1, 1, 1, 1, 1,
1.072235, 0.1417465, 1.52412, 1, 1, 1, 1, 1,
1.073193, -0.02573366, 0.03744689, 1, 1, 1, 1, 1,
1.083143, 0.2128167, 1.991059, 1, 1, 1, 1, 1,
1.084602, 0.4783628, 1.334882, 1, 1, 1, 1, 1,
1.088436, -0.842517, 0.4047711, 1, 1, 1, 1, 1,
1.088879, 1.628545, 1.01622, 0, 0, 1, 1, 1,
1.092876, -0.0615536, 2.19862, 1, 0, 0, 1, 1,
1.093492, 0.1678381, 2.47064, 1, 0, 0, 1, 1,
1.094669, 1.64567, -1.389434, 1, 0, 0, 1, 1,
1.098308, -0.9715425, 2.717402, 1, 0, 0, 1, 1,
1.108236, -0.5416902, 2.252047, 1, 0, 0, 1, 1,
1.127518, -1.572127, 2.250134, 0, 0, 0, 1, 1,
1.141272, 1.643811, 0.8035127, 0, 0, 0, 1, 1,
1.14196, 0.3715816, 2.071149, 0, 0, 0, 1, 1,
1.147766, 1.446502, 1.340478, 0, 0, 0, 1, 1,
1.149631, 1.517413, -0.1393378, 0, 0, 0, 1, 1,
1.150082, 0.8371104, 1.847577, 0, 0, 0, 1, 1,
1.152911, -2.019644, 2.162606, 0, 0, 0, 1, 1,
1.161346, 1.276792, 2.045783, 1, 1, 1, 1, 1,
1.161519, 0.1154738, 1.97725, 1, 1, 1, 1, 1,
1.164744, -0.4096273, 1.678704, 1, 1, 1, 1, 1,
1.166975, 0.07937012, 1.469978, 1, 1, 1, 1, 1,
1.193084, -1.377687, 3.245159, 1, 1, 1, 1, 1,
1.193713, -1.482902, 0.2628115, 1, 1, 1, 1, 1,
1.195979, -0.129165, 1.129195, 1, 1, 1, 1, 1,
1.200043, -2.479988, 2.867673, 1, 1, 1, 1, 1,
1.201677, -0.6781663, 1.949442, 1, 1, 1, 1, 1,
1.205602, 1.411407, 0.9182838, 1, 1, 1, 1, 1,
1.205905, -1.238468, 3.510187, 1, 1, 1, 1, 1,
1.209177, -0.7981611, 4.551271, 1, 1, 1, 1, 1,
1.221801, 0.1942114, -0.008140643, 1, 1, 1, 1, 1,
1.226515, -1.376992, 2.670907, 1, 1, 1, 1, 1,
1.249264, 0.0991829, 1.382541, 1, 1, 1, 1, 1,
1.25818, -1.549119, 4.049377, 0, 0, 1, 1, 1,
1.273441, 0.08644155, -0.2991123, 1, 0, 0, 1, 1,
1.277102, 0.09054238, 1.594461, 1, 0, 0, 1, 1,
1.279982, -0.3542831, 1.109418, 1, 0, 0, 1, 1,
1.281985, 1.252215, 0.851204, 1, 0, 0, 1, 1,
1.282735, 0.6340365, 2.185342, 1, 0, 0, 1, 1,
1.290184, 0.1845493, 2.662102, 0, 0, 0, 1, 1,
1.293671, -0.7891862, 1.834204, 0, 0, 0, 1, 1,
1.299687, 0.2718194, 1.446715, 0, 0, 0, 1, 1,
1.306892, -0.6142549, 2.072319, 0, 0, 0, 1, 1,
1.309063, 0.2086044, 2.745316, 0, 0, 0, 1, 1,
1.313548, 1.719107, 1.258096, 0, 0, 0, 1, 1,
1.32247, -0.4381328, 3.781524, 0, 0, 0, 1, 1,
1.337105, 0.9878638, 1.789105, 1, 1, 1, 1, 1,
1.339055, -0.6962049, 1.492231, 1, 1, 1, 1, 1,
1.349365, 2.515505, -0.9372308, 1, 1, 1, 1, 1,
1.355081, -0.407626, 0.6471568, 1, 1, 1, 1, 1,
1.360018, -1.604905, 2.762538, 1, 1, 1, 1, 1,
1.36915, 0.1022762, 1.244466, 1, 1, 1, 1, 1,
1.389651, 2.418372, -1.283016, 1, 1, 1, 1, 1,
1.389692, -1.047642, 2.213554, 1, 1, 1, 1, 1,
1.389769, -0.2417216, 2.190511, 1, 1, 1, 1, 1,
1.396227, -1.050608, 1.039733, 1, 1, 1, 1, 1,
1.412395, -0.8763623, 2.428489, 1, 1, 1, 1, 1,
1.413113, -1.393827, 2.317013, 1, 1, 1, 1, 1,
1.443798, -0.9655249, 1.544855, 1, 1, 1, 1, 1,
1.45195, 0.1113095, 3.925224, 1, 1, 1, 1, 1,
1.453544, -1.06228, 0.9082922, 1, 1, 1, 1, 1,
1.466072, 0.5942568, 2.865399, 0, 0, 1, 1, 1,
1.479434, 0.2477122, 0.1855102, 1, 0, 0, 1, 1,
1.479978, 1.310884, -0.01771456, 1, 0, 0, 1, 1,
1.490608, 0.6978816, 1.059545, 1, 0, 0, 1, 1,
1.49378, 0.06649784, 0.9617148, 1, 0, 0, 1, 1,
1.505006, -0.7315859, 1.764851, 1, 0, 0, 1, 1,
1.513908, 0.8036724, 0.4677237, 0, 0, 0, 1, 1,
1.525743, -1.211924, 3.358659, 0, 0, 0, 1, 1,
1.527864, -0.6602239, 0.9225972, 0, 0, 0, 1, 1,
1.52917, 1.469458, 2.06794, 0, 0, 0, 1, 1,
1.531634, 0.05111882, 2.827216, 0, 0, 0, 1, 1,
1.540573, -0.5302206, 1.311853, 0, 0, 0, 1, 1,
1.550112, 0.08998307, 3.368001, 0, 0, 0, 1, 1,
1.555035, -0.6430013, 2.168007, 1, 1, 1, 1, 1,
1.556191, 1.232006, 2.395902, 1, 1, 1, 1, 1,
1.558303, 1.016096, 0.2987851, 1, 1, 1, 1, 1,
1.55917, -0.2974825, 2.306601, 1, 1, 1, 1, 1,
1.560406, 1.191483, -1.014177, 1, 1, 1, 1, 1,
1.567254, 1.642805, -0.2777323, 1, 1, 1, 1, 1,
1.573839, -0.1289165, 2.62069, 1, 1, 1, 1, 1,
1.576627, -0.1481713, 2.217213, 1, 1, 1, 1, 1,
1.586114, 1.150611, 0.2440399, 1, 1, 1, 1, 1,
1.590189, -1.525844, 1.789265, 1, 1, 1, 1, 1,
1.593754, 0.8983015, 1.707062, 1, 1, 1, 1, 1,
1.594873, -1.590278, 2.878052, 1, 1, 1, 1, 1,
1.625576, 0.7660269, -1.107297, 1, 1, 1, 1, 1,
1.637617, 0.5929763, 1.268081, 1, 1, 1, 1, 1,
1.64737, 0.9610176, 0.8177263, 1, 1, 1, 1, 1,
1.648225, 0.5725186, 2.152223, 0, 0, 1, 1, 1,
1.64956, -0.4227045, 1.600353, 1, 0, 0, 1, 1,
1.65309, 0.09675794, 2.627692, 1, 0, 0, 1, 1,
1.663267, 1.614648, 0.8577294, 1, 0, 0, 1, 1,
1.679794, -0.5758463, 3.630273, 1, 0, 0, 1, 1,
1.740176, 0.1615362, 0.8870601, 1, 0, 0, 1, 1,
1.75096, -0.4437877, 2.389363, 0, 0, 0, 1, 1,
1.753853, 0.9009342, 1.068044, 0, 0, 0, 1, 1,
1.754542, -0.5880918, 0.279259, 0, 0, 0, 1, 1,
1.786548, 1.201163, -0.8583235, 0, 0, 0, 1, 1,
1.82078, 0.05992411, 1.712166, 0, 0, 0, 1, 1,
1.822566, 0.5016669, 1.337496, 0, 0, 0, 1, 1,
1.828911, 0.2192383, 1.859173, 0, 0, 0, 1, 1,
1.847301, -0.7951317, 0.6253693, 1, 1, 1, 1, 1,
1.856727, -1.720525, 1.429142, 1, 1, 1, 1, 1,
1.88911, -0.8152913, 1.755314, 1, 1, 1, 1, 1,
1.892282, -0.5930141, 1.999422, 1, 1, 1, 1, 1,
1.907848, 0.7592842, 1.496854, 1, 1, 1, 1, 1,
1.915048, -1.837519, 2.617632, 1, 1, 1, 1, 1,
1.923261, -0.6856433, 2.955748, 1, 1, 1, 1, 1,
1.933577, -1.571224, 1.764796, 1, 1, 1, 1, 1,
1.961693, -0.03481141, 0.9979461, 1, 1, 1, 1, 1,
1.965893, -2.009046, 1.31963, 1, 1, 1, 1, 1,
1.973374, 0.5847501, 1.883916, 1, 1, 1, 1, 1,
2.033689, -1.240344, 0.07044305, 1, 1, 1, 1, 1,
2.048028, -0.2681713, 1.386347, 1, 1, 1, 1, 1,
2.059971, -0.3985496, 1.874648, 1, 1, 1, 1, 1,
2.086214, -0.05464057, 3.159629, 1, 1, 1, 1, 1,
2.087702, 1.404393, -0.1511213, 0, 0, 1, 1, 1,
2.139479, 1.18139, 2.116297, 1, 0, 0, 1, 1,
2.141107, 0.9765103, 1.850667, 1, 0, 0, 1, 1,
2.146304, -0.4789967, 4.245319, 1, 0, 0, 1, 1,
2.170477, -1.394381, 3.352769, 1, 0, 0, 1, 1,
2.216631, -0.3520676, 3.655372, 1, 0, 0, 1, 1,
2.326708, -0.01619474, 2.124013, 0, 0, 0, 1, 1,
2.360878, 1.805702, 0.1691137, 0, 0, 0, 1, 1,
2.367184, -0.89494, 1.399402, 0, 0, 0, 1, 1,
2.369349, 0.008626931, 1.43566, 0, 0, 0, 1, 1,
2.407965, 0.5508816, 2.355696, 0, 0, 0, 1, 1,
2.431616, -0.5851812, 2.426642, 0, 0, 0, 1, 1,
2.527248, -0.5570035, 3.674048, 0, 0, 0, 1, 1,
2.636831, -0.4112141, 2.821522, 1, 1, 1, 1, 1,
2.725575, -0.1667552, 2.761175, 1, 1, 1, 1, 1,
2.932673, 1.667903, 0.588348, 1, 1, 1, 1, 1,
3.04732, 0.6497337, 1.837324, 1, 1, 1, 1, 1,
3.072958, -0.008462457, 0.5786197, 1, 1, 1, 1, 1,
3.21754, -0.4641338, 0.9141359, 1, 1, 1, 1, 1,
3.385146, 0.8972835, -0.1964048, 1, 1, 1, 1, 1
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
var radius = 9.785121;
var distance = 34.36982;
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
mvMatrix.translate( -0.1456277, -0.1840396, 0.3433487 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.36982);
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
