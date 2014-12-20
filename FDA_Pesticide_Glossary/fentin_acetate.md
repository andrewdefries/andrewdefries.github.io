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
-3.15143, 0.1556656, 0.1485081, 1, 0, 0, 1,
-3.042969, 0.6736075, -2.44101, 1, 0.007843138, 0, 1,
-3.001822, 0.2742699, 0.5472639, 1, 0.01176471, 0, 1,
-2.982816, -0.3529733, -0.394363, 1, 0.01960784, 0, 1,
-2.772845, -1.635483, -2.979734, 1, 0.02352941, 0, 1,
-2.764226, -1.431672, -2.690969, 1, 0.03137255, 0, 1,
-2.666512, 0.8862839, -1.173719, 1, 0.03529412, 0, 1,
-2.491267, 0.6611522, -1.851942, 1, 0.04313726, 0, 1,
-2.368178, -0.03297838, -2.222069, 1, 0.04705882, 0, 1,
-2.358063, 0.3798155, -1.828353, 1, 0.05490196, 0, 1,
-2.353819, -1.266522, -1.455998, 1, 0.05882353, 0, 1,
-2.232205, -1.160654, -0.6408849, 1, 0.06666667, 0, 1,
-2.14255, -0.5628847, -2.800382, 1, 0.07058824, 0, 1,
-2.128085, -0.01329072, -2.812367, 1, 0.07843138, 0, 1,
-2.126397, 1.228505, -0.9470235, 1, 0.08235294, 0, 1,
-2.096842, -0.2943067, -1.63847, 1, 0.09019608, 0, 1,
-2.091082, -1.322449, -3.075729, 1, 0.09411765, 0, 1,
-2.07473, 0.6554922, -2.047971, 1, 0.1019608, 0, 1,
-2.05909, 1.767039, 0.5489227, 1, 0.1098039, 0, 1,
-2.027842, 1.176694, 0.8090353, 1, 0.1137255, 0, 1,
-2.012227, 1.319862, -1.038105, 1, 0.1215686, 0, 1,
-1.991731, -1.679932, -2.660427, 1, 0.1254902, 0, 1,
-1.986611, 0.7327109, -0.7092919, 1, 0.1333333, 0, 1,
-1.976207, 0.8979837, -1.507325, 1, 0.1372549, 0, 1,
-1.9753, 0.8403466, -1.094766, 1, 0.145098, 0, 1,
-1.96439, -0.7479799, -2.535655, 1, 0.1490196, 0, 1,
-1.946963, 0.1643571, -0.9671004, 1, 0.1568628, 0, 1,
-1.859879, -0.6897792, -2.376526, 1, 0.1607843, 0, 1,
-1.828645, -0.2622978, -2.109803, 1, 0.1686275, 0, 1,
-1.821779, -0.774136, 0.05144065, 1, 0.172549, 0, 1,
-1.812762, 1.797301, -2.161028, 1, 0.1803922, 0, 1,
-1.808203, 0.09748051, -2.151824, 1, 0.1843137, 0, 1,
-1.803872, 1.931535, -1.407555, 1, 0.1921569, 0, 1,
-1.799745, 0.2984456, -1.788101, 1, 0.1960784, 0, 1,
-1.757781, 0.3016245, 1.078199, 1, 0.2039216, 0, 1,
-1.748553, 1.18287, -1.710097, 1, 0.2117647, 0, 1,
-1.719001, -0.6806308, -0.9709873, 1, 0.2156863, 0, 1,
-1.715666, 0.6482494, -1.558151, 1, 0.2235294, 0, 1,
-1.701415, 0.6361137, -1.936566, 1, 0.227451, 0, 1,
-1.685152, -0.6433768, -3.680421, 1, 0.2352941, 0, 1,
-1.667959, -1.180251, -1.200515, 1, 0.2392157, 0, 1,
-1.664926, 0.583114, -1.168259, 1, 0.2470588, 0, 1,
-1.640185, -0.4435591, -1.669117, 1, 0.2509804, 0, 1,
-1.631533, 0.6114888, -1.887888, 1, 0.2588235, 0, 1,
-1.611413, 0.02161833, -2.040467, 1, 0.2627451, 0, 1,
-1.603032, -1.366631, -3.216684, 1, 0.2705882, 0, 1,
-1.601616, 1.725953, -1.081535, 1, 0.2745098, 0, 1,
-1.596433, 0.3683235, -0.9689708, 1, 0.282353, 0, 1,
-1.579296, -1.249607, -1.061911, 1, 0.2862745, 0, 1,
-1.578731, 0.8378546, -0.7467673, 1, 0.2941177, 0, 1,
-1.574785, 0.0376733, -0.9014121, 1, 0.3019608, 0, 1,
-1.559321, -1.743217, -1.574273, 1, 0.3058824, 0, 1,
-1.556797, -0.003687127, -1.497336, 1, 0.3137255, 0, 1,
-1.54121, 0.8379722, -1.095098, 1, 0.3176471, 0, 1,
-1.536854, 0.7694805, 0.6475901, 1, 0.3254902, 0, 1,
-1.53283, -0.02073472, -2.374968, 1, 0.3294118, 0, 1,
-1.513893, 0.01767025, -0.8478978, 1, 0.3372549, 0, 1,
-1.507166, 1.592429, -0.6484579, 1, 0.3411765, 0, 1,
-1.506875, 0.2602408, -1.269074, 1, 0.3490196, 0, 1,
-1.487658, 0.4635329, -2.629494, 1, 0.3529412, 0, 1,
-1.481135, -1.259374, -1.571751, 1, 0.3607843, 0, 1,
-1.468736, 0.6408813, -1.944588, 1, 0.3647059, 0, 1,
-1.457876, -0.003856644, -3.612342, 1, 0.372549, 0, 1,
-1.44518, 0.5608732, -2.184033, 1, 0.3764706, 0, 1,
-1.432334, 1.624991, -1.37026, 1, 0.3843137, 0, 1,
-1.424285, 0.05226709, -0.5870324, 1, 0.3882353, 0, 1,
-1.408727, 0.779799, -1.5319, 1, 0.3960784, 0, 1,
-1.396153, 2.03075, -2.262925, 1, 0.4039216, 0, 1,
-1.387264, -2.133713, -2.68105, 1, 0.4078431, 0, 1,
-1.368428, -0.8320901, -2.205012, 1, 0.4156863, 0, 1,
-1.366149, -0.6926143, -1.270462, 1, 0.4196078, 0, 1,
-1.365876, -0.5882215, -2.882111, 1, 0.427451, 0, 1,
-1.365122, 2.098383, -1.091945, 1, 0.4313726, 0, 1,
-1.361874, 0.7698595, -0.5362376, 1, 0.4392157, 0, 1,
-1.360857, 1.256911, -2.046508, 1, 0.4431373, 0, 1,
-1.357995, -0.7867031, -0.9120292, 1, 0.4509804, 0, 1,
-1.355907, 0.5749975, -1.653249, 1, 0.454902, 0, 1,
-1.353599, -1.526448, -2.583064, 1, 0.4627451, 0, 1,
-1.341124, 0.3299363, -1.77108, 1, 0.4666667, 0, 1,
-1.333701, -0.09508055, -3.155299, 1, 0.4745098, 0, 1,
-1.32575, 0.6271171, -0.02054363, 1, 0.4784314, 0, 1,
-1.325114, -0.01434978, -1.782171, 1, 0.4862745, 0, 1,
-1.323582, 0.3949984, -1.528071, 1, 0.4901961, 0, 1,
-1.323026, 0.2428225, -1.493098, 1, 0.4980392, 0, 1,
-1.322309, 1.377554, -1.599174, 1, 0.5058824, 0, 1,
-1.319686, 0.6441287, 0.2210584, 1, 0.509804, 0, 1,
-1.317798, -0.658806, -0.5122035, 1, 0.5176471, 0, 1,
-1.313796, -0.6873026, -2.560833, 1, 0.5215687, 0, 1,
-1.311804, -1.810422, -1.502945, 1, 0.5294118, 0, 1,
-1.311215, 0.1143784, -2.87402, 1, 0.5333334, 0, 1,
-1.304054, 0.1176305, -0.7220198, 1, 0.5411765, 0, 1,
-1.293193, 0.2572651, -2.980472, 1, 0.5450981, 0, 1,
-1.289412, -1.322318, -3.731635, 1, 0.5529412, 0, 1,
-1.28927, -0.5143741, -1.487285, 1, 0.5568628, 0, 1,
-1.285383, 1.012449, -0.1586959, 1, 0.5647059, 0, 1,
-1.283774, 0.9051303, 0.5780144, 1, 0.5686275, 0, 1,
-1.2814, 0.3302012, -3.330452, 1, 0.5764706, 0, 1,
-1.28087, -0.08913714, -2.361872, 1, 0.5803922, 0, 1,
-1.279767, -0.8290391, -3.238746, 1, 0.5882353, 0, 1,
-1.274476, 1.092308, -1.05779, 1, 0.5921569, 0, 1,
-1.274366, -1.511679, -2.742623, 1, 0.6, 0, 1,
-1.251179, -0.3899702, -1.042721, 1, 0.6078432, 0, 1,
-1.24879, -1.173278, -1.778722, 1, 0.6117647, 0, 1,
-1.236496, -0.7758266, -2.139429, 1, 0.6196079, 0, 1,
-1.235368, -0.5904472, -2.513243, 1, 0.6235294, 0, 1,
-1.234878, -1.157123, -2.145049, 1, 0.6313726, 0, 1,
-1.231937, -1.689149, -2.644037, 1, 0.6352941, 0, 1,
-1.227298, 0.5094922, -2.158888, 1, 0.6431373, 0, 1,
-1.218015, 0.1503023, -2.029671, 1, 0.6470588, 0, 1,
-1.215533, 0.06959981, -2.148686, 1, 0.654902, 0, 1,
-1.209364, 1.584401, -0.2321138, 1, 0.6588235, 0, 1,
-1.203345, 0.4998695, -1.097476, 1, 0.6666667, 0, 1,
-1.201189, 1.046991, 0.2102638, 1, 0.6705883, 0, 1,
-1.199989, 2.310857, -1.165913, 1, 0.6784314, 0, 1,
-1.199445, -1.011121, -3.148012, 1, 0.682353, 0, 1,
-1.198167, 0.08518936, -3.182712, 1, 0.6901961, 0, 1,
-1.18212, 0.5540012, -0.6477423, 1, 0.6941177, 0, 1,
-1.174143, -0.1711457, -2.370512, 1, 0.7019608, 0, 1,
-1.17052, -0.1086566, -1.467908, 1, 0.7098039, 0, 1,
-1.170008, -0.2292509, -1.238679, 1, 0.7137255, 0, 1,
-1.162271, -0.4151844, -3.40227, 1, 0.7215686, 0, 1,
-1.1557, -0.8012962, -0.4095767, 1, 0.7254902, 0, 1,
-1.151344, 0.3599109, -2.325081, 1, 0.7333333, 0, 1,
-1.146916, 0.5362464, -1.870891, 1, 0.7372549, 0, 1,
-1.145915, -1.600034, -4.315633, 1, 0.7450981, 0, 1,
-1.144194, -0.6699002, -2.372164, 1, 0.7490196, 0, 1,
-1.140172, 0.6558358, -0.8933135, 1, 0.7568628, 0, 1,
-1.133315, -1.382424, -4.132097, 1, 0.7607843, 0, 1,
-1.130396, 0.5764896, -0.9656038, 1, 0.7686275, 0, 1,
-1.129419, -0.6216191, -0.1498923, 1, 0.772549, 0, 1,
-1.113107, -0.3141921, -2.920638, 1, 0.7803922, 0, 1,
-1.111805, -2.179367, -2.823998, 1, 0.7843137, 0, 1,
-1.106288, 0.6441519, -0.4900132, 1, 0.7921569, 0, 1,
-1.09279, -0.3847037, -1.985961, 1, 0.7960784, 0, 1,
-1.086482, -0.2509267, -2.444648, 1, 0.8039216, 0, 1,
-1.084584, 0.4934859, -0.6741236, 1, 0.8117647, 0, 1,
-1.077262, -1.520214, -0.1468229, 1, 0.8156863, 0, 1,
-1.07639, -0.5028389, -1.423238, 1, 0.8235294, 0, 1,
-1.074334, -0.7265516, -2.548413, 1, 0.827451, 0, 1,
-1.073608, 1.194711, -1.00917, 1, 0.8352941, 0, 1,
-1.070141, -1.700208, -1.656129, 1, 0.8392157, 0, 1,
-1.068535, -0.3597093, -2.221171, 1, 0.8470588, 0, 1,
-1.060191, 0.1008406, -2.701663, 1, 0.8509804, 0, 1,
-1.058463, 0.1470105, 0.07655233, 1, 0.8588235, 0, 1,
-1.057673, 0.5697958, -0.9642648, 1, 0.8627451, 0, 1,
-1.050157, 2.047747, -2.020547, 1, 0.8705882, 0, 1,
-1.046105, 0.8735014, -2.953256, 1, 0.8745098, 0, 1,
-1.044973, -0.5163324, -2.380135, 1, 0.8823529, 0, 1,
-1.041947, -0.4974096, -1.920224, 1, 0.8862745, 0, 1,
-1.029155, 1.043294, -1.698731, 1, 0.8941177, 0, 1,
-1.028121, 0.1145697, -1.475367, 1, 0.8980392, 0, 1,
-1.027421, -0.892092, -1.601719, 1, 0.9058824, 0, 1,
-1.02052, -0.3302532, -1.504773, 1, 0.9137255, 0, 1,
-1.016099, 0.5595796, -1.32562, 1, 0.9176471, 0, 1,
-1.008232, 1.194908, -0.1336021, 1, 0.9254902, 0, 1,
-1.003916, 1.576801, -0.9817786, 1, 0.9294118, 0, 1,
-1.003592, -1.204695, 0.1183214, 1, 0.9372549, 0, 1,
-0.9947715, 0.9164749, 0.3753866, 1, 0.9411765, 0, 1,
-0.9920181, -1.317076, -1.919394, 1, 0.9490196, 0, 1,
-0.9908289, -0.9419258, -3.879776, 1, 0.9529412, 0, 1,
-0.9833326, -2.18964, -1.768351, 1, 0.9607843, 0, 1,
-0.9789343, 0.208581, -0.7841537, 1, 0.9647059, 0, 1,
-0.9679503, -0.5571104, -0.8751637, 1, 0.972549, 0, 1,
-0.9613949, -1.400738, -2.056381, 1, 0.9764706, 0, 1,
-0.9587878, -1.266187, -3.745694, 1, 0.9843137, 0, 1,
-0.9570349, 0.2117085, -1.427369, 1, 0.9882353, 0, 1,
-0.9522405, 1.650391, -0.2762578, 1, 0.9960784, 0, 1,
-0.9460258, 1.505403, 0.07261825, 0.9960784, 1, 0, 1,
-0.942071, -0.01337662, -1.321867, 0.9921569, 1, 0, 1,
-0.9341182, 0.3197644, -1.444509, 0.9843137, 1, 0, 1,
-0.9237362, -0.810158, -2.666491, 0.9803922, 1, 0, 1,
-0.9163855, 1.914085, -0.998171, 0.972549, 1, 0, 1,
-0.9161262, 1.780717, -2.202275, 0.9686275, 1, 0, 1,
-0.9134229, 0.04836593, -2.582167, 0.9607843, 1, 0, 1,
-0.9124117, -0.8386816, -4.078748, 0.9568627, 1, 0, 1,
-0.91002, -0.4493529, -2.164184, 0.9490196, 1, 0, 1,
-0.9047878, -0.3067979, -1.557364, 0.945098, 1, 0, 1,
-0.9008122, -0.1640434, -3.260947, 0.9372549, 1, 0, 1,
-0.8958802, 0.9667789, -2.55938, 0.9333333, 1, 0, 1,
-0.895336, 0.7189282, -1.025862, 0.9254902, 1, 0, 1,
-0.8917712, 0.688442, 0.8489025, 0.9215686, 1, 0, 1,
-0.8881318, -0.6840639, -1.825135, 0.9137255, 1, 0, 1,
-0.8873364, -2.31277, -0.05061135, 0.9098039, 1, 0, 1,
-0.8856221, 1.394974, -1.323581, 0.9019608, 1, 0, 1,
-0.88442, 0.9441882, -0.2796939, 0.8941177, 1, 0, 1,
-0.8825432, -0.1520844, -0.4950485, 0.8901961, 1, 0, 1,
-0.8744393, 1.371167, -1.74421, 0.8823529, 1, 0, 1,
-0.8742118, -1.416863, -1.974267, 0.8784314, 1, 0, 1,
-0.8735838, 1.90207, -0.7155005, 0.8705882, 1, 0, 1,
-0.8727525, 0.06257752, -1.738417, 0.8666667, 1, 0, 1,
-0.8683577, -0.85829, -3.541004, 0.8588235, 1, 0, 1,
-0.8619912, 1.26018, -0.3570728, 0.854902, 1, 0, 1,
-0.86152, -0.5684257, -3.46435, 0.8470588, 1, 0, 1,
-0.8548241, -0.3934677, -2.468853, 0.8431373, 1, 0, 1,
-0.8547175, -1.341162, -1.726442, 0.8352941, 1, 0, 1,
-0.8429375, -0.5121177, -1.973956, 0.8313726, 1, 0, 1,
-0.8382185, 0.4558447, -2.065191, 0.8235294, 1, 0, 1,
-0.8339117, 1.201499, -1.041816, 0.8196079, 1, 0, 1,
-0.8314729, 0.0443688, -1.252897, 0.8117647, 1, 0, 1,
-0.8302833, -0.4413134, -0.843348, 0.8078431, 1, 0, 1,
-0.8296847, -0.408874, -1.857929, 0.8, 1, 0, 1,
-0.8203728, 0.2784309, -2.307295, 0.7921569, 1, 0, 1,
-0.8198013, 0.7452739, -2.422362, 0.7882353, 1, 0, 1,
-0.8111189, -0.3088347, -1.230053, 0.7803922, 1, 0, 1,
-0.8080732, -0.2544161, -1.244022, 0.7764706, 1, 0, 1,
-0.8012595, -0.7542314, -3.088023, 0.7686275, 1, 0, 1,
-0.7995313, 1.382342, -1.33927, 0.7647059, 1, 0, 1,
-0.794728, 0.6617791, -2.07683, 0.7568628, 1, 0, 1,
-0.7937637, -0.2553502, -3.291458, 0.7529412, 1, 0, 1,
-0.7867191, -0.541252, -0.9863592, 0.7450981, 1, 0, 1,
-0.7823716, -0.01746487, 0.8102103, 0.7411765, 1, 0, 1,
-0.7793675, 0.8098584, -1.145251, 0.7333333, 1, 0, 1,
-0.7754632, 1.22126, -0.9327053, 0.7294118, 1, 0, 1,
-0.7740647, -0.7723112, -2.507368, 0.7215686, 1, 0, 1,
-0.7709071, 1.409702, -0.2119928, 0.7176471, 1, 0, 1,
-0.7643301, 0.2216296, -0.3261473, 0.7098039, 1, 0, 1,
-0.7601095, 0.1921893, -1.505929, 0.7058824, 1, 0, 1,
-0.7579082, -0.994357, -3.897686, 0.6980392, 1, 0, 1,
-0.7549242, 1.53052, -1.014554, 0.6901961, 1, 0, 1,
-0.7475593, 3.219074, -0.1229276, 0.6862745, 1, 0, 1,
-0.7460747, -0.3046835, -3.861082, 0.6784314, 1, 0, 1,
-0.7418641, -1.716897, -2.93304, 0.6745098, 1, 0, 1,
-0.7389489, 1.661662, -0.3276708, 0.6666667, 1, 0, 1,
-0.7368206, 0.03578193, -1.089252, 0.6627451, 1, 0, 1,
-0.7367522, -0.1667869, -2.114469, 0.654902, 1, 0, 1,
-0.7358653, 1.19653, 1.502218, 0.6509804, 1, 0, 1,
-0.7307822, -0.1742123, -1.712161, 0.6431373, 1, 0, 1,
-0.7303155, 0.4833094, 0.8473184, 0.6392157, 1, 0, 1,
-0.7298992, 1.064949, -0.8231776, 0.6313726, 1, 0, 1,
-0.7273757, 1.38094, 0.1526483, 0.627451, 1, 0, 1,
-0.7214596, -0.3565565, -3.992282, 0.6196079, 1, 0, 1,
-0.712807, -0.5050057, -2.198887, 0.6156863, 1, 0, 1,
-0.712509, -0.2561287, -1.928799, 0.6078432, 1, 0, 1,
-0.7100347, 1.65771, -0.03147273, 0.6039216, 1, 0, 1,
-0.7017763, 1.000316, 0.7431386, 0.5960785, 1, 0, 1,
-0.7003683, -1.459779, -3.933332, 0.5882353, 1, 0, 1,
-0.6924908, -0.4934816, -0.6832821, 0.5843138, 1, 0, 1,
-0.6912503, 0.4108576, -0.6691774, 0.5764706, 1, 0, 1,
-0.6901557, -0.6213248, -1.894201, 0.572549, 1, 0, 1,
-0.688341, 0.7961698, -0.6263833, 0.5647059, 1, 0, 1,
-0.68827, 0.3318551, -0.1762176, 0.5607843, 1, 0, 1,
-0.6875705, -0.1471718, -2.456751, 0.5529412, 1, 0, 1,
-0.6836992, -0.1704813, -1.878756, 0.5490196, 1, 0, 1,
-0.6731358, -0.7504409, -4.442213, 0.5411765, 1, 0, 1,
-0.6718511, -0.01331356, -0.4635948, 0.5372549, 1, 0, 1,
-0.668138, -1.45936, -3.298578, 0.5294118, 1, 0, 1,
-0.6639299, -0.01849401, -1.11428, 0.5254902, 1, 0, 1,
-0.6628487, -1.157091, -3.309355, 0.5176471, 1, 0, 1,
-0.6602737, 0.7036608, -1.450773, 0.5137255, 1, 0, 1,
-0.6574963, -0.4727735, -1.865822, 0.5058824, 1, 0, 1,
-0.6563507, 0.7159325, -1.429477, 0.5019608, 1, 0, 1,
-0.653861, 1.194582, -1.148303, 0.4941176, 1, 0, 1,
-0.6534334, 0.5173028, -3.286729, 0.4862745, 1, 0, 1,
-0.6496272, -1.955465, -3.598791, 0.4823529, 1, 0, 1,
-0.6461165, 0.9390882, -0.3052356, 0.4745098, 1, 0, 1,
-0.6457261, 0.505908, -1.076467, 0.4705882, 1, 0, 1,
-0.6417249, 2.50136, -1.254031, 0.4627451, 1, 0, 1,
-0.6372061, -0.4573888, -2.838967, 0.4588235, 1, 0, 1,
-0.6370035, -1.057282, -3.483535, 0.4509804, 1, 0, 1,
-0.6362526, -1.142572, -2.88927, 0.4470588, 1, 0, 1,
-0.6358556, -1.58276, -2.315815, 0.4392157, 1, 0, 1,
-0.6293468, 0.884968, -2.020703, 0.4352941, 1, 0, 1,
-0.6274542, 0.8949742, -0.9115135, 0.427451, 1, 0, 1,
-0.6259117, 0.9330369, 0.7031278, 0.4235294, 1, 0, 1,
-0.6152251, -0.6345867, -2.838328, 0.4156863, 1, 0, 1,
-0.6150579, -0.2423932, -1.76149, 0.4117647, 1, 0, 1,
-0.6144479, 1.533539, 0.8854574, 0.4039216, 1, 0, 1,
-0.6136371, -0.09077426, -2.213195, 0.3960784, 1, 0, 1,
-0.6086219, -0.1925175, -1.476497, 0.3921569, 1, 0, 1,
-0.6084149, 1.428651, -1.546432, 0.3843137, 1, 0, 1,
-0.6064494, -0.110123, 0.8980693, 0.3803922, 1, 0, 1,
-0.6063882, -0.4337785, -3.53105, 0.372549, 1, 0, 1,
-0.6057697, 0.01024696, -0.06869688, 0.3686275, 1, 0, 1,
-0.6001754, -0.02588682, -0.05351929, 0.3607843, 1, 0, 1,
-0.5881341, -1.1764, -4.911609, 0.3568628, 1, 0, 1,
-0.5801633, -1.725386, -1.908344, 0.3490196, 1, 0, 1,
-0.5759997, 0.1164816, -1.493076, 0.345098, 1, 0, 1,
-0.5714065, -0.09480774, -0.9341601, 0.3372549, 1, 0, 1,
-0.5694847, 1.024246, -0.9827067, 0.3333333, 1, 0, 1,
-0.5648437, -0.9480088, -3.290911, 0.3254902, 1, 0, 1,
-0.5624635, 0.2594408, -0.4314224, 0.3215686, 1, 0, 1,
-0.5623411, -1.386167, -0.9201813, 0.3137255, 1, 0, 1,
-0.5620433, -0.7719802, -3.81362, 0.3098039, 1, 0, 1,
-0.5592016, -2.295692, -3.255603, 0.3019608, 1, 0, 1,
-0.5589089, 1.549275, 0.138518, 0.2941177, 1, 0, 1,
-0.5586279, -0.1543991, -1.745468, 0.2901961, 1, 0, 1,
-0.5579765, 0.02984115, -4.002916, 0.282353, 1, 0, 1,
-0.5522828, 0.7560279, -0.1517065, 0.2784314, 1, 0, 1,
-0.551953, 0.02461725, 0.2267919, 0.2705882, 1, 0, 1,
-0.5511471, 1.910764, 1.247739, 0.2666667, 1, 0, 1,
-0.5472249, -0.2033624, -0.7030966, 0.2588235, 1, 0, 1,
-0.5445724, 1.265881, -0.7463679, 0.254902, 1, 0, 1,
-0.542582, 0.6224627, -1.534768, 0.2470588, 1, 0, 1,
-0.5362208, 0.4971839, -1.280595, 0.2431373, 1, 0, 1,
-0.5343866, -1.246943, -3.194595, 0.2352941, 1, 0, 1,
-0.5334686, -0.5641552, -1.80992, 0.2313726, 1, 0, 1,
-0.530341, -0.3327434, -2.814845, 0.2235294, 1, 0, 1,
-0.5283188, -1.817817, -2.953277, 0.2196078, 1, 0, 1,
-0.5281889, 0.3756597, -2.522603, 0.2117647, 1, 0, 1,
-0.5243405, 1.04343, -0.285862, 0.2078431, 1, 0, 1,
-0.5225561, -1.858733, -2.983111, 0.2, 1, 0, 1,
-0.5220312, 0.6113436, -0.6440569, 0.1921569, 1, 0, 1,
-0.5209609, -0.7632718, -2.401712, 0.1882353, 1, 0, 1,
-0.520724, 0.0900749, -0.6104082, 0.1803922, 1, 0, 1,
-0.5188508, -1.522926, -2.242289, 0.1764706, 1, 0, 1,
-0.5164381, 1.104089, 0.3753894, 0.1686275, 1, 0, 1,
-0.5151134, -0.5352034, -2.7054, 0.1647059, 1, 0, 1,
-0.5082192, -0.4747455, -3.579937, 0.1568628, 1, 0, 1,
-0.508076, -0.7728834, -0.7650117, 0.1529412, 1, 0, 1,
-0.5072621, -0.329292, 0.5623872, 0.145098, 1, 0, 1,
-0.5064443, 0.04712106, -0.8361713, 0.1411765, 1, 0, 1,
-0.5017244, -0.2244066, -1.162003, 0.1333333, 1, 0, 1,
-0.4940664, -1.155316, -1.402228, 0.1294118, 1, 0, 1,
-0.4939341, 0.5405825, -1.147423, 0.1215686, 1, 0, 1,
-0.4935695, 1.835093, 1.145159, 0.1176471, 1, 0, 1,
-0.4905188, 0.09707388, -0.7941597, 0.1098039, 1, 0, 1,
-0.4878669, -0.1378133, -1.494932, 0.1058824, 1, 0, 1,
-0.485116, -1.580084, -2.395503, 0.09803922, 1, 0, 1,
-0.4833275, -1.057074, -1.456218, 0.09019608, 1, 0, 1,
-0.4811904, -1.05253, -2.224289, 0.08627451, 1, 0, 1,
-0.4765318, -0.7213444, -2.713255, 0.07843138, 1, 0, 1,
-0.473095, 0.6407117, 0.224198, 0.07450981, 1, 0, 1,
-0.4697637, -0.403212, -2.303217, 0.06666667, 1, 0, 1,
-0.4697547, 0.06464604, -0.5125763, 0.0627451, 1, 0, 1,
-0.4697079, 0.2293417, -1.308581, 0.05490196, 1, 0, 1,
-0.4695372, -0.7097675, -2.368816, 0.05098039, 1, 0, 1,
-0.4666183, 0.2152245, -1.60277, 0.04313726, 1, 0, 1,
-0.4607672, -0.371317, -3.698987, 0.03921569, 1, 0, 1,
-0.453428, -1.35349, -2.279811, 0.03137255, 1, 0, 1,
-0.4524437, 0.08513982, -1.704016, 0.02745098, 1, 0, 1,
-0.4400734, 0.945172, -0.6542374, 0.01960784, 1, 0, 1,
-0.4383902, -0.1671442, -1.629698, 0.01568628, 1, 0, 1,
-0.438142, -0.6456971, -3.663323, 0.007843138, 1, 0, 1,
-0.4328035, -0.0143021, -2.125687, 0.003921569, 1, 0, 1,
-0.4261149, 0.4657441, -1.123738, 0, 1, 0.003921569, 1,
-0.4244442, 0.5713682, 0.08483246, 0, 1, 0.01176471, 1,
-0.4172024, -0.6157588, -3.502236, 0, 1, 0.01568628, 1,
-0.4157244, 0.92316, 0.3730316, 0, 1, 0.02352941, 1,
-0.4152859, -0.1374352, -2.960308, 0, 1, 0.02745098, 1,
-0.4078704, 0.3395444, -1.673915, 0, 1, 0.03529412, 1,
-0.4070176, 0.04031216, -2.819031, 0, 1, 0.03921569, 1,
-0.4043126, -0.5435855, -0.6579815, 0, 1, 0.04705882, 1,
-0.4007363, 1.313591, -0.6486987, 0, 1, 0.05098039, 1,
-0.4000293, -0.3717758, -1.833102, 0, 1, 0.05882353, 1,
-0.3941803, 0.8533863, -1.708794, 0, 1, 0.0627451, 1,
-0.3909932, 1.791841, 0.7788589, 0, 1, 0.07058824, 1,
-0.3850075, 0.04244808, -0.2196407, 0, 1, 0.07450981, 1,
-0.3837734, 0.7560281, -1.002924, 0, 1, 0.08235294, 1,
-0.3824637, 0.995976, -1.519203, 0, 1, 0.08627451, 1,
-0.3823198, 1.657593, 0.3719752, 0, 1, 0.09411765, 1,
-0.3817977, 1.728514, -0.2863629, 0, 1, 0.1019608, 1,
-0.3811617, -0.6637074, -2.497321, 0, 1, 0.1058824, 1,
-0.3778332, 0.945574, -0.6199576, 0, 1, 0.1137255, 1,
-0.3767536, -2.641158, -3.498452, 0, 1, 0.1176471, 1,
-0.3729218, 0.6873929, -0.3456978, 0, 1, 0.1254902, 1,
-0.3710014, -0.6623832, -3.217448, 0, 1, 0.1294118, 1,
-0.367999, -0.2728277, -2.281419, 0, 1, 0.1372549, 1,
-0.3640375, 2.717862, -1.189343, 0, 1, 0.1411765, 1,
-0.3611102, 0.4516124, -0.6964083, 0, 1, 0.1490196, 1,
-0.3609889, -0.5501698, -3.022958, 0, 1, 0.1529412, 1,
-0.3595587, -0.5962303, -2.925018, 0, 1, 0.1607843, 1,
-0.3558638, -0.706405, -2.711605, 0, 1, 0.1647059, 1,
-0.3515725, 1.973644, -1.117063, 0, 1, 0.172549, 1,
-0.3510104, 1.493527, 0.7371828, 0, 1, 0.1764706, 1,
-0.3490135, -0.6899431, -1.627323, 0, 1, 0.1843137, 1,
-0.3431717, -0.2199583, -2.183416, 0, 1, 0.1882353, 1,
-0.3410854, 0.2736984, 0.1211603, 0, 1, 0.1960784, 1,
-0.3386971, 0.5001125, 0.6404213, 0, 1, 0.2039216, 1,
-0.3365278, 2.121582, -1.391921, 0, 1, 0.2078431, 1,
-0.3323067, 0.08867729, -1.516904, 0, 1, 0.2156863, 1,
-0.3320729, -0.7662791, -3.352281, 0, 1, 0.2196078, 1,
-0.3302085, 0.267919, -1.464674, 0, 1, 0.227451, 1,
-0.3271947, 0.0166759, -0.3192338, 0, 1, 0.2313726, 1,
-0.323019, -1.730494, -2.808314, 0, 1, 0.2392157, 1,
-0.3198472, -1.428185, -4.004752, 0, 1, 0.2431373, 1,
-0.3174615, -1.25279, -3.180553, 0, 1, 0.2509804, 1,
-0.3106879, 0.03596362, -1.812179, 0, 1, 0.254902, 1,
-0.3096797, -1.02731, -2.873394, 0, 1, 0.2627451, 1,
-0.3084104, 3.318333, -0.8889788, 0, 1, 0.2666667, 1,
-0.3049705, 0.690494, -0.2258381, 0, 1, 0.2745098, 1,
-0.3049277, -1.074983, -2.479017, 0, 1, 0.2784314, 1,
-0.3010778, -0.6628877, -2.09889, 0, 1, 0.2862745, 1,
-0.3001485, 1.462603, 0.8689662, 0, 1, 0.2901961, 1,
-0.2999652, -1.016461, -4.339091, 0, 1, 0.2980392, 1,
-0.2992093, 0.1449888, -1.965071, 0, 1, 0.3058824, 1,
-0.2969392, -0.7239795, -3.0732, 0, 1, 0.3098039, 1,
-0.2959183, -1.049405, -1.435997, 0, 1, 0.3176471, 1,
-0.2946686, -1.159359, -4.334713, 0, 1, 0.3215686, 1,
-0.2913311, -1.799865, -1.510479, 0, 1, 0.3294118, 1,
-0.2857546, -0.4473904, -1.821115, 0, 1, 0.3333333, 1,
-0.2836965, 0.08081739, 0.1206909, 0, 1, 0.3411765, 1,
-0.2811453, 0.6753032, -1.453726, 0, 1, 0.345098, 1,
-0.2809049, -0.8141367, -4.082062, 0, 1, 0.3529412, 1,
-0.2800382, 1.241623, 0.432465, 0, 1, 0.3568628, 1,
-0.2777707, -0.79103, -3.691546, 0, 1, 0.3647059, 1,
-0.2761787, 0.3478594, -0.4346958, 0, 1, 0.3686275, 1,
-0.2746302, 1.306335, 1.091182, 0, 1, 0.3764706, 1,
-0.273829, 0.6816555, -0.2648171, 0, 1, 0.3803922, 1,
-0.2717214, -2.127413, -3.770563, 0, 1, 0.3882353, 1,
-0.271302, 0.2929817, -0.02152794, 0, 1, 0.3921569, 1,
-0.2672559, 0.6061911, -1.342728, 0, 1, 0.4, 1,
-0.2641613, -0.4873372, -2.138759, 0, 1, 0.4078431, 1,
-0.2632152, 2.036284, 0.1392042, 0, 1, 0.4117647, 1,
-0.2615052, -1.006622, -3.436927, 0, 1, 0.4196078, 1,
-0.2613924, 2.279258, -2.455028, 0, 1, 0.4235294, 1,
-0.256791, -0.114357, -1.734245, 0, 1, 0.4313726, 1,
-0.2565838, -1.46923, -3.241872, 0, 1, 0.4352941, 1,
-0.2562478, -1.436177, -3.243455, 0, 1, 0.4431373, 1,
-0.2556521, -0.5808781, -2.080141, 0, 1, 0.4470588, 1,
-0.2550065, -0.05866791, -1.343193, 0, 1, 0.454902, 1,
-0.2544068, 0.5345928, -1.78756, 0, 1, 0.4588235, 1,
-0.2543974, -1.443661, -1.965744, 0, 1, 0.4666667, 1,
-0.2530129, -0.2072886, -0.718132, 0, 1, 0.4705882, 1,
-0.2511496, -0.97461, -1.927569, 0, 1, 0.4784314, 1,
-0.2490496, 0.1722674, -0.368767, 0, 1, 0.4823529, 1,
-0.2464566, -1.284823, -2.210154, 0, 1, 0.4901961, 1,
-0.2455754, -0.418765, -1.344891, 0, 1, 0.4941176, 1,
-0.2390707, -1.302046, -4.259512, 0, 1, 0.5019608, 1,
-0.2372383, 0.8402919, -0.8705819, 0, 1, 0.509804, 1,
-0.2335749, 0.2511157, -2.416208, 0, 1, 0.5137255, 1,
-0.2315701, -1.065037, -2.273548, 0, 1, 0.5215687, 1,
-0.2287926, -0.5940055, -2.085012, 0, 1, 0.5254902, 1,
-0.226901, -0.2995964, -1.681674, 0, 1, 0.5333334, 1,
-0.224301, 0.4565092, -0.7706754, 0, 1, 0.5372549, 1,
-0.2226789, -0.2902055, -1.136322, 0, 1, 0.5450981, 1,
-0.2224209, 0.374961, 0.7758047, 0, 1, 0.5490196, 1,
-0.2208477, -0.8991355, -4.226096, 0, 1, 0.5568628, 1,
-0.2206499, 0.6187447, 0.005418686, 0, 1, 0.5607843, 1,
-0.2188766, -0.3517687, -1.517869, 0, 1, 0.5686275, 1,
-0.2157041, 2.025878, -2.596895, 0, 1, 0.572549, 1,
-0.2070873, 0.042728, -1.388583, 0, 1, 0.5803922, 1,
-0.2014854, -1.792658, -3.714764, 0, 1, 0.5843138, 1,
-0.1987105, -1.338642, -2.86811, 0, 1, 0.5921569, 1,
-0.1978156, 0.6989335, -0.5505672, 0, 1, 0.5960785, 1,
-0.1930154, -0.5983759, -2.336579, 0, 1, 0.6039216, 1,
-0.1913479, -0.2247839, -2.241411, 0, 1, 0.6117647, 1,
-0.1756252, -0.7137203, -2.511748, 0, 1, 0.6156863, 1,
-0.1739735, -0.6137066, -3.371947, 0, 1, 0.6235294, 1,
-0.1703648, -0.8410724, -3.179675, 0, 1, 0.627451, 1,
-0.1691743, 0.1416123, 0.5690261, 0, 1, 0.6352941, 1,
-0.1669313, 0.2174112, -0.1521963, 0, 1, 0.6392157, 1,
-0.1625018, -0.8036999, -2.904102, 0, 1, 0.6470588, 1,
-0.1597776, 0.5465233, -0.9198852, 0, 1, 0.6509804, 1,
-0.1596075, 1.082112, -0.1269759, 0, 1, 0.6588235, 1,
-0.1566916, 2.143387, 0.3887388, 0, 1, 0.6627451, 1,
-0.1542818, -0.501093, -2.170964, 0, 1, 0.6705883, 1,
-0.1538448, 0.4842612, -1.449625, 0, 1, 0.6745098, 1,
-0.1480284, 0.3242515, 0.4496568, 0, 1, 0.682353, 1,
-0.1411164, 0.7483903, 1.152729, 0, 1, 0.6862745, 1,
-0.1406048, 0.5061422, 0.3335478, 0, 1, 0.6941177, 1,
-0.1377687, 0.2962228, -1.120214, 0, 1, 0.7019608, 1,
-0.1372427, 0.3873982, -0.09033692, 0, 1, 0.7058824, 1,
-0.1365209, -0.1220578, -2.661362, 0, 1, 0.7137255, 1,
-0.1280554, 0.4640327, -1.902823, 0, 1, 0.7176471, 1,
-0.1276661, 0.4689566, -0.1470278, 0, 1, 0.7254902, 1,
-0.1274663, -0.1323106, -2.746269, 0, 1, 0.7294118, 1,
-0.1207147, -0.2399358, -2.408019, 0, 1, 0.7372549, 1,
-0.1163455, -1.465991, -1.873233, 0, 1, 0.7411765, 1,
-0.1153513, -0.1364383, -2.427566, 0, 1, 0.7490196, 1,
-0.1090116, 1.143822, -0.08845967, 0, 1, 0.7529412, 1,
-0.1086262, -0.3663667, -2.454463, 0, 1, 0.7607843, 1,
-0.1041231, 1.003436, -0.7177365, 0, 1, 0.7647059, 1,
-0.1037186, -0.0773759, -2.434431, 0, 1, 0.772549, 1,
-0.1021701, 0.8854191, -0.3716872, 0, 1, 0.7764706, 1,
-0.1020305, 1.124095, -0.2191885, 0, 1, 0.7843137, 1,
-0.09781957, -0.2715933, -3.831574, 0, 1, 0.7882353, 1,
-0.09142985, 1.302717, -1.438143, 0, 1, 0.7960784, 1,
-0.08947267, -0.2088418, -2.706954, 0, 1, 0.8039216, 1,
-0.08813923, 0.4858896, 0.5528173, 0, 1, 0.8078431, 1,
-0.0865284, -1.612082, -3.292357, 0, 1, 0.8156863, 1,
-0.08597634, 1.049595, -0.5024951, 0, 1, 0.8196079, 1,
-0.07771656, 0.619095, -0.9079176, 0, 1, 0.827451, 1,
-0.07662529, -0.7854205, -2.22034, 0, 1, 0.8313726, 1,
-0.07598703, -1.594913, -4.221402, 0, 1, 0.8392157, 1,
-0.07486847, -0.4021799, -3.287303, 0, 1, 0.8431373, 1,
-0.0735124, -0.1042805, -2.166772, 0, 1, 0.8509804, 1,
-0.0716901, 0.4248612, 0.1661721, 0, 1, 0.854902, 1,
-0.0705572, -0.1806713, -1.804972, 0, 1, 0.8627451, 1,
-0.06769258, 0.07791822, -0.4364592, 0, 1, 0.8666667, 1,
-0.06619673, -0.009791171, -1.840911, 0, 1, 0.8745098, 1,
-0.06522723, 0.05824202, -0.006615465, 0, 1, 0.8784314, 1,
-0.06322418, 2.059903, 0.3615807, 0, 1, 0.8862745, 1,
-0.06069895, -0.5988937, -3.874417, 0, 1, 0.8901961, 1,
-0.05830764, -0.05556536, -1.352224, 0, 1, 0.8980392, 1,
-0.05779508, -0.7447678, -5.176768, 0, 1, 0.9058824, 1,
-0.05760803, 0.9890277, -0.8026696, 0, 1, 0.9098039, 1,
-0.0518814, -0.516048, -3.581728, 0, 1, 0.9176471, 1,
-0.04109942, -1.158813, -2.870945, 0, 1, 0.9215686, 1,
-0.03945426, 0.599022, 1.357658, 0, 1, 0.9294118, 1,
-0.03721894, -1.041541, -1.306752, 0, 1, 0.9333333, 1,
-0.03676206, 1.813067, -1.754296, 0, 1, 0.9411765, 1,
-0.03671451, -0.7152774, -3.262208, 0, 1, 0.945098, 1,
-0.03669239, 1.470123, 0.01369972, 0, 1, 0.9529412, 1,
-0.03374875, -1.779673, -4.779954, 0, 1, 0.9568627, 1,
-0.02845688, 0.1181508, 1.895467, 0, 1, 0.9647059, 1,
-0.02842533, -0.3152186, -3.069605, 0, 1, 0.9686275, 1,
-0.02137967, -0.5862867, -3.434455, 0, 1, 0.9764706, 1,
-0.02073404, 0.6951715, 0.02603232, 0, 1, 0.9803922, 1,
-0.01707471, 1.701581, 0.699747, 0, 1, 0.9882353, 1,
-0.01341257, 0.4525086, 0.6766769, 0, 1, 0.9921569, 1,
-0.005224138, -1.386872, -1.433029, 0, 1, 1, 1,
-0.0003400247, 1.83956, 1.226062, 0, 0.9921569, 1, 1,
0.00306825, -0.4685529, 0.5889706, 0, 0.9882353, 1, 1,
0.004922264, -0.1805514, 3.382747, 0, 0.9803922, 1, 1,
0.009570345, 0.5265654, 0.223099, 0, 0.9764706, 1, 1,
0.01161258, 0.1841729, 1.352682, 0, 0.9686275, 1, 1,
0.01434284, 1.091339, -1.33156, 0, 0.9647059, 1, 1,
0.01467014, -0.003474244, 2.507389, 0, 0.9568627, 1, 1,
0.01699651, -0.8777592, 3.823214, 0, 0.9529412, 1, 1,
0.0182526, 0.5611723, -0.564041, 0, 0.945098, 1, 1,
0.01845533, 0.2915411, 0.07968016, 0, 0.9411765, 1, 1,
0.02061279, 0.9263657, -0.6380768, 0, 0.9333333, 1, 1,
0.0209384, 1.115208, -0.1741459, 0, 0.9294118, 1, 1,
0.02227186, 0.0124408, 1.654557, 0, 0.9215686, 1, 1,
0.02345574, 1.749506, -1.638118, 0, 0.9176471, 1, 1,
0.02492231, -0.796265, 3.013909, 0, 0.9098039, 1, 1,
0.0265909, 0.668542, -0.6141402, 0, 0.9058824, 1, 1,
0.02667782, 0.8579835, 0.9614226, 0, 0.8980392, 1, 1,
0.02913106, -0.3140943, 3.298535, 0, 0.8901961, 1, 1,
0.03045266, 0.3173156, -1.30349, 0, 0.8862745, 1, 1,
0.03353259, -0.7285204, 3.047507, 0, 0.8784314, 1, 1,
0.03517367, -1.575156, 5.125611, 0, 0.8745098, 1, 1,
0.03569751, -1.170082, 2.809628, 0, 0.8666667, 1, 1,
0.0386718, -1.062218, 2.550036, 0, 0.8627451, 1, 1,
0.03964574, 0.3992749, -0.005581748, 0, 0.854902, 1, 1,
0.04216829, -0.4776766, 2.923986, 0, 0.8509804, 1, 1,
0.05354576, 0.1590093, 0.111403, 0, 0.8431373, 1, 1,
0.05552252, -0.2366299, 3.669871, 0, 0.8392157, 1, 1,
0.06030844, 0.3342377, 0.3600089, 0, 0.8313726, 1, 1,
0.06031094, -0.8039848, 1.905272, 0, 0.827451, 1, 1,
0.06537982, -1.569646, 3.250671, 0, 0.8196079, 1, 1,
0.07815954, 0.1080796, 0.7188507, 0, 0.8156863, 1, 1,
0.08108171, 2.553893, 0.5465664, 0, 0.8078431, 1, 1,
0.08214191, 2.177398, -1.290615, 0, 0.8039216, 1, 1,
0.08315122, 1.432874, -3.084108, 0, 0.7960784, 1, 1,
0.08911584, -0.8731789, 1.743512, 0, 0.7882353, 1, 1,
0.09047096, 0.5509741, 0.5259072, 0, 0.7843137, 1, 1,
0.09199309, 0.5745986, -0.3976377, 0, 0.7764706, 1, 1,
0.09687693, 0.6616514, -0.07840071, 0, 0.772549, 1, 1,
0.09875082, -0.7590064, 3.168305, 0, 0.7647059, 1, 1,
0.09926993, -1.452713, 4.654972, 0, 0.7607843, 1, 1,
0.102768, -1.3909, 3.360207, 0, 0.7529412, 1, 1,
0.1075056, 0.2587554, 1.787232, 0, 0.7490196, 1, 1,
0.1077164, 0.2660023, 1.985782, 0, 0.7411765, 1, 1,
0.112876, 1.060452, 0.0204521, 0, 0.7372549, 1, 1,
0.1143404, 1.041048, -1.236188, 0, 0.7294118, 1, 1,
0.1181803, -0.1287695, 2.773002, 0, 0.7254902, 1, 1,
0.120562, -0.8490544, 3.580343, 0, 0.7176471, 1, 1,
0.1218127, 0.629648, 0.51367, 0, 0.7137255, 1, 1,
0.1224019, 1.203022, 0.2802156, 0, 0.7058824, 1, 1,
0.1233428, -1.955138, 2.670344, 0, 0.6980392, 1, 1,
0.1242651, -1.634512, 2.680846, 0, 0.6941177, 1, 1,
0.1243106, -0.06687272, 2.385994, 0, 0.6862745, 1, 1,
0.1260781, 0.302904, -0.5261447, 0, 0.682353, 1, 1,
0.1263051, 0.903051, -0.01282728, 0, 0.6745098, 1, 1,
0.1273128, 0.9749712, 0.3832258, 0, 0.6705883, 1, 1,
0.1314923, -0.001020807, -0.4496604, 0, 0.6627451, 1, 1,
0.1315288, 0.1842914, 0.02355397, 0, 0.6588235, 1, 1,
0.1349092, 0.2825378, 1.551501, 0, 0.6509804, 1, 1,
0.1380718, -0.6449862, 2.998741, 0, 0.6470588, 1, 1,
0.1382075, 0.6174174, 0.008954348, 0, 0.6392157, 1, 1,
0.1395205, 0.3656402, -0.1232711, 0, 0.6352941, 1, 1,
0.140819, -0.875331, 3.767333, 0, 0.627451, 1, 1,
0.1457168, 0.02525747, 0.2620534, 0, 0.6235294, 1, 1,
0.148496, 0.3411753, -0.9974963, 0, 0.6156863, 1, 1,
0.1486688, 1.600532, 0.9768445, 0, 0.6117647, 1, 1,
0.1488859, -0.7291732, 2.7258, 0, 0.6039216, 1, 1,
0.1498847, 0.4181952, 1.71176, 0, 0.5960785, 1, 1,
0.1499849, -1.466237, 1.519638, 0, 0.5921569, 1, 1,
0.1513939, 1.20106, 0.3442573, 0, 0.5843138, 1, 1,
0.1516786, -0.0972124, 0.8650064, 0, 0.5803922, 1, 1,
0.1526332, 1.217554, 1.130724, 0, 0.572549, 1, 1,
0.1527103, -0.5993755, 2.928688, 0, 0.5686275, 1, 1,
0.1547859, 0.3457437, 1.417722, 0, 0.5607843, 1, 1,
0.1594467, -0.7539819, 3.321359, 0, 0.5568628, 1, 1,
0.1598453, -0.09325243, 1.1196, 0, 0.5490196, 1, 1,
0.1601873, -1.256464, 3.27585, 0, 0.5450981, 1, 1,
0.1603553, -0.2328901, 2.405683, 0, 0.5372549, 1, 1,
0.1653463, -1.019548, 4.79285, 0, 0.5333334, 1, 1,
0.1686629, -2.388118, 3.333691, 0, 0.5254902, 1, 1,
0.1694503, -0.02615394, 5.422029, 0, 0.5215687, 1, 1,
0.172271, 1.035165, -0.4636316, 0, 0.5137255, 1, 1,
0.1737204, -0.3880043, 3.883695, 0, 0.509804, 1, 1,
0.1754211, -0.7880127, 1.647788, 0, 0.5019608, 1, 1,
0.1804315, 0.1083234, -0.3057332, 0, 0.4941176, 1, 1,
0.1819441, -0.1520219, 2.872061, 0, 0.4901961, 1, 1,
0.1822188, 0.3729265, -0.09016997, 0, 0.4823529, 1, 1,
0.1865976, 0.8339228, -1.347643, 0, 0.4784314, 1, 1,
0.1909088, 0.3612711, -0.09584839, 0, 0.4705882, 1, 1,
0.1940225, -0.9414027, 2.093012, 0, 0.4666667, 1, 1,
0.1957729, 0.1276291, 0.6909835, 0, 0.4588235, 1, 1,
0.1969153, -0.3899203, 2.252504, 0, 0.454902, 1, 1,
0.2033312, -0.0132742, 2.473039, 0, 0.4470588, 1, 1,
0.2079398, -0.1989623, 2.351916, 0, 0.4431373, 1, 1,
0.2083459, 0.398609, 0.8857895, 0, 0.4352941, 1, 1,
0.2112527, 0.1925526, 0.9844176, 0, 0.4313726, 1, 1,
0.213168, 0.3038587, 2.1891, 0, 0.4235294, 1, 1,
0.215191, 2.251322, -0.3665273, 0, 0.4196078, 1, 1,
0.217638, -0.6843619, 3.349314, 0, 0.4117647, 1, 1,
0.2304881, 0.9829032, 1.524954, 0, 0.4078431, 1, 1,
0.2316429, -0.5111478, 1.586316, 0, 0.4, 1, 1,
0.2316703, 2.767732, -0.6666584, 0, 0.3921569, 1, 1,
0.2349291, -1.306742, 2.006216, 0, 0.3882353, 1, 1,
0.2351902, 0.07630029, 1.583406, 0, 0.3803922, 1, 1,
0.236828, 0.2744238, 1.655022, 0, 0.3764706, 1, 1,
0.238435, -0.540808, 3.046747, 0, 0.3686275, 1, 1,
0.2459465, -0.7873006, 2.647382, 0, 0.3647059, 1, 1,
0.2488435, 0.1797041, 1.9345, 0, 0.3568628, 1, 1,
0.2507553, 1.358153, -0.8574227, 0, 0.3529412, 1, 1,
0.2509546, -0.3001008, 2.413294, 0, 0.345098, 1, 1,
0.2515084, -0.2541276, 3.104364, 0, 0.3411765, 1, 1,
0.2603454, -0.2081013, 1.35308, 0, 0.3333333, 1, 1,
0.2652821, 0.4504901, -0.9953433, 0, 0.3294118, 1, 1,
0.2662801, 2.209685, -0.8657007, 0, 0.3215686, 1, 1,
0.2714484, 0.1656166, 0.6978481, 0, 0.3176471, 1, 1,
0.2733861, -0.6017863, 2.466897, 0, 0.3098039, 1, 1,
0.2757437, -1.750088, 2.967822, 0, 0.3058824, 1, 1,
0.2807826, 0.8957452, 0.2857384, 0, 0.2980392, 1, 1,
0.2821599, 1.222339, -0.3600289, 0, 0.2901961, 1, 1,
0.2835266, 0.7296503, 0.2250129, 0, 0.2862745, 1, 1,
0.284257, 0.6282883, 0.7677711, 0, 0.2784314, 1, 1,
0.2852002, 0.7627204, 0.6772653, 0, 0.2745098, 1, 1,
0.2920512, 0.2353295, 0.8217265, 0, 0.2666667, 1, 1,
0.2927736, -0.7176078, 2.935816, 0, 0.2627451, 1, 1,
0.2937583, -0.1173255, 1.695533, 0, 0.254902, 1, 1,
0.2953563, 0.05813134, -0.5209568, 0, 0.2509804, 1, 1,
0.295923, -0.3302591, 0.6529812, 0, 0.2431373, 1, 1,
0.299679, 0.2885305, 0.9683524, 0, 0.2392157, 1, 1,
0.3031271, -0.8407406, 2.454056, 0, 0.2313726, 1, 1,
0.3044623, -0.1204269, 2.692696, 0, 0.227451, 1, 1,
0.3045499, 0.7128144, 1.43593, 0, 0.2196078, 1, 1,
0.3099033, -1.900633, 2.680279, 0, 0.2156863, 1, 1,
0.312848, -0.1347502, 2.124388, 0, 0.2078431, 1, 1,
0.313626, 0.2978275, 0.9654566, 0, 0.2039216, 1, 1,
0.3173488, 2.374633, 0.5838857, 0, 0.1960784, 1, 1,
0.3221211, -0.2489787, 2.10943, 0, 0.1882353, 1, 1,
0.3229882, 1.186802, -0.7674372, 0, 0.1843137, 1, 1,
0.3236606, 1.28967, -0.2263697, 0, 0.1764706, 1, 1,
0.3253278, 1.536733, 0.9187163, 0, 0.172549, 1, 1,
0.3263105, 1.752461, -1.731514, 0, 0.1647059, 1, 1,
0.3286486, 1.41244, -0.2295313, 0, 0.1607843, 1, 1,
0.3299814, 0.08855074, 0.901293, 0, 0.1529412, 1, 1,
0.3300593, 1.007362, -2.477843, 0, 0.1490196, 1, 1,
0.3308313, -0.1481159, 2.274402, 0, 0.1411765, 1, 1,
0.3318461, 1.977074, 0.6116862, 0, 0.1372549, 1, 1,
0.3327151, 0.8876218, 1.311655, 0, 0.1294118, 1, 1,
0.3363976, -0.3717243, 3.912077, 0, 0.1254902, 1, 1,
0.3380876, -0.2805528, 0.964378, 0, 0.1176471, 1, 1,
0.3401341, 1.287404, 0.0523457, 0, 0.1137255, 1, 1,
0.3404172, -0.7675332, 5.075764, 0, 0.1058824, 1, 1,
0.3425341, 1.259135, 0.4773066, 0, 0.09803922, 1, 1,
0.3425628, -1.168352, 3.56859, 0, 0.09411765, 1, 1,
0.3505896, 0.2366598, 2.311341, 0, 0.08627451, 1, 1,
0.3641241, 1.038793, 1.456465, 0, 0.08235294, 1, 1,
0.3643847, -1.266847, 1.598268, 0, 0.07450981, 1, 1,
0.3665203, 0.7978445, 0.59974, 0, 0.07058824, 1, 1,
0.3697611, 0.2947131, 1.09932, 0, 0.0627451, 1, 1,
0.3707387, -1.855789, 1.670293, 0, 0.05882353, 1, 1,
0.3725544, 0.6279488, -1.089564, 0, 0.05098039, 1, 1,
0.3748237, 0.6771563, -0.1005886, 0, 0.04705882, 1, 1,
0.3750794, -0.02702085, 1.113065, 0, 0.03921569, 1, 1,
0.3806569, -0.5114872, 2.600175, 0, 0.03529412, 1, 1,
0.3827682, 0.744401, 1.356525, 0, 0.02745098, 1, 1,
0.3836597, -0.7168755, 3.288755, 0, 0.02352941, 1, 1,
0.38662, -0.5078248, 2.919904, 0, 0.01568628, 1, 1,
0.3890849, -1.091349, 1.809055, 0, 0.01176471, 1, 1,
0.3961155, -0.4693691, 0.9864474, 0, 0.003921569, 1, 1,
0.3964764, -0.5722733, 1.050555, 0.003921569, 0, 1, 1,
0.4110863, 1.078237, 0.8435347, 0.007843138, 0, 1, 1,
0.4116815, 0.8312218, -2.265414, 0.01568628, 0, 1, 1,
0.4135862, 0.5267105, 0.2394184, 0.01960784, 0, 1, 1,
0.4172574, 0.8276553, 0.574507, 0.02745098, 0, 1, 1,
0.4182591, 0.324703, -0.8016365, 0.03137255, 0, 1, 1,
0.4202147, -0.285057, 1.825881, 0.03921569, 0, 1, 1,
0.436335, -0.4761172, 2.575959, 0.04313726, 0, 1, 1,
0.4436401, -0.5815027, 2.479122, 0.05098039, 0, 1, 1,
0.4441624, 0.04374415, 1.782038, 0.05490196, 0, 1, 1,
0.4445378, -0.009818224, 1.639878, 0.0627451, 0, 1, 1,
0.4504409, 0.6435833, 0.09799138, 0.06666667, 0, 1, 1,
0.4510764, 1.54591, -0.8729332, 0.07450981, 0, 1, 1,
0.4530891, -0.209251, 2.496974, 0.07843138, 0, 1, 1,
0.455106, -0.2187055, 2.197281, 0.08627451, 0, 1, 1,
0.4664589, -0.1499672, 2.181668, 0.09019608, 0, 1, 1,
0.4672855, -0.949956, 3.655038, 0.09803922, 0, 1, 1,
0.4697705, 1.452754, 0.4178184, 0.1058824, 0, 1, 1,
0.4764746, 0.8476271, 1.021462, 0.1098039, 0, 1, 1,
0.4823626, -0.4486579, 1.355963, 0.1176471, 0, 1, 1,
0.4826679, -2.736262, 2.211237, 0.1215686, 0, 1, 1,
0.4830842, -1.169192, 3.301404, 0.1294118, 0, 1, 1,
0.4840864, 0.7141192, 1.108468, 0.1333333, 0, 1, 1,
0.4876943, 1.000021, -0.07308164, 0.1411765, 0, 1, 1,
0.4902335, 0.2674123, 1.647615, 0.145098, 0, 1, 1,
0.4934396, -0.9315842, 1.223595, 0.1529412, 0, 1, 1,
0.4962037, 0.2000593, 0.4033235, 0.1568628, 0, 1, 1,
0.5010203, 0.5739785, -0.6586965, 0.1647059, 0, 1, 1,
0.5019095, -1.485294, 3.789184, 0.1686275, 0, 1, 1,
0.5044845, -1.338109, 2.899877, 0.1764706, 0, 1, 1,
0.5047461, 2.280361, 0.6530445, 0.1803922, 0, 1, 1,
0.5105416, 1.417207, 2.342156, 0.1882353, 0, 1, 1,
0.5180233, 0.6541834, -1.133266, 0.1921569, 0, 1, 1,
0.5210158, -0.8087584, 2.876144, 0.2, 0, 1, 1,
0.5216817, 1.230332, 1.63513, 0.2078431, 0, 1, 1,
0.5218084, -1.620751, 3.328983, 0.2117647, 0, 1, 1,
0.5219901, -1.828661, 1.873046, 0.2196078, 0, 1, 1,
0.5243767, 1.589969, 0.9350048, 0.2235294, 0, 1, 1,
0.5327531, 3.259263, -0.4156467, 0.2313726, 0, 1, 1,
0.5345925, 0.3061926, 2.149234, 0.2352941, 0, 1, 1,
0.538058, 1.555853, -1.631617, 0.2431373, 0, 1, 1,
0.5389728, -1.144064, 2.852465, 0.2470588, 0, 1, 1,
0.5403744, -0.191279, 3.166453, 0.254902, 0, 1, 1,
0.5426967, -0.5375082, 2.544935, 0.2588235, 0, 1, 1,
0.5514183, 0.6626775, 0.2570363, 0.2666667, 0, 1, 1,
0.5531408, -0.9652252, 2.529793, 0.2705882, 0, 1, 1,
0.5570052, -0.5729418, -0.1355867, 0.2784314, 0, 1, 1,
0.56124, -0.7495716, 3.228515, 0.282353, 0, 1, 1,
0.5631593, -1.520381, 0.6733494, 0.2901961, 0, 1, 1,
0.5632094, 0.9445458, -1.384261, 0.2941177, 0, 1, 1,
0.5674317, 0.6864447, 1.119043, 0.3019608, 0, 1, 1,
0.5706701, -0.1139336, 1.052164, 0.3098039, 0, 1, 1,
0.5709676, -0.5553125, 4.214841, 0.3137255, 0, 1, 1,
0.5711224, -0.3469187, 2.782521, 0.3215686, 0, 1, 1,
0.5721078, -0.1713613, 1.385446, 0.3254902, 0, 1, 1,
0.5732233, -1.518618, 5.215747, 0.3333333, 0, 1, 1,
0.5733995, 0.104958, 2.072798, 0.3372549, 0, 1, 1,
0.5736376, -0.4555036, 1.88583, 0.345098, 0, 1, 1,
0.5802658, -0.5251008, 1.222438, 0.3490196, 0, 1, 1,
0.5812178, -0.7055901, 1.104235, 0.3568628, 0, 1, 1,
0.5819519, -0.4902181, -0.4007376, 0.3607843, 0, 1, 1,
0.5838705, -0.5486054, 0.4245244, 0.3686275, 0, 1, 1,
0.5853013, 0.7114073, 3.415245, 0.372549, 0, 1, 1,
0.5917208, -1.34417, 4.013344, 0.3803922, 0, 1, 1,
0.5973438, 0.5115976, 1.794682, 0.3843137, 0, 1, 1,
0.5975189, 0.5529446, 1.231524, 0.3921569, 0, 1, 1,
0.597715, -1.094191, 2.166174, 0.3960784, 0, 1, 1,
0.599161, 1.194648, 0.4621455, 0.4039216, 0, 1, 1,
0.5992978, -1.773662, 2.815587, 0.4117647, 0, 1, 1,
0.6008243, -0.7309795, 2.610041, 0.4156863, 0, 1, 1,
0.6023566, -0.5598955, 3.52122, 0.4235294, 0, 1, 1,
0.6126166, -0.2126253, 1.086766, 0.427451, 0, 1, 1,
0.6141489, 0.2208486, 1.450251, 0.4352941, 0, 1, 1,
0.6174688, 0.131467, 1.042945, 0.4392157, 0, 1, 1,
0.6176503, -0.03719889, 0.8280557, 0.4470588, 0, 1, 1,
0.6188065, 0.4331053, 1.06848, 0.4509804, 0, 1, 1,
0.6267833, -0.336623, 2.945114, 0.4588235, 0, 1, 1,
0.630196, 0.6411796, 0.7233134, 0.4627451, 0, 1, 1,
0.6314006, 0.629062, 0.5517809, 0.4705882, 0, 1, 1,
0.6339149, -0.1476395, 1.471881, 0.4745098, 0, 1, 1,
0.6365073, -1.204171, 1.10845, 0.4823529, 0, 1, 1,
0.6401886, -0.3607123, 1.815267, 0.4862745, 0, 1, 1,
0.6424578, 0.6653901, 0.5940427, 0.4941176, 0, 1, 1,
0.6451238, -1.235777, 3.194108, 0.5019608, 0, 1, 1,
0.6476743, 2.135675, 1.194244, 0.5058824, 0, 1, 1,
0.6510428, -1.89735, 4.169346, 0.5137255, 0, 1, 1,
0.6529141, 2.157379, -1.63615, 0.5176471, 0, 1, 1,
0.6534129, 0.4104731, 0.1458068, 0.5254902, 0, 1, 1,
0.6536329, -0.3456229, 1.743063, 0.5294118, 0, 1, 1,
0.6558908, 0.8073651, 1.317071, 0.5372549, 0, 1, 1,
0.6567762, -0.1827376, 0.5743158, 0.5411765, 0, 1, 1,
0.6601907, -0.486843, 2.309655, 0.5490196, 0, 1, 1,
0.6605502, 0.7770895, 1.525748, 0.5529412, 0, 1, 1,
0.663969, 0.2434822, 1.759498, 0.5607843, 0, 1, 1,
0.6640421, -0.5085001, 2.360804, 0.5647059, 0, 1, 1,
0.6640671, 1.666061, 0.4700095, 0.572549, 0, 1, 1,
0.6667676, 0.5974787, 2.175169, 0.5764706, 0, 1, 1,
0.6784379, -0.8261286, 1.540909, 0.5843138, 0, 1, 1,
0.679197, 0.3578854, -0.694486, 0.5882353, 0, 1, 1,
0.6798417, -0.6515582, 3.648334, 0.5960785, 0, 1, 1,
0.6821681, -1.124615, 2.957405, 0.6039216, 0, 1, 1,
0.6824716, 0.3096472, 1.026325, 0.6078432, 0, 1, 1,
0.6828089, -0.8691508, 2.760825, 0.6156863, 0, 1, 1,
0.6867959, 1.081176, -0.05807861, 0.6196079, 0, 1, 1,
0.6868564, -0.8717109, 2.92294, 0.627451, 0, 1, 1,
0.6889701, -0.6256877, 1.821218, 0.6313726, 0, 1, 1,
0.6981372, -1.678013, 3.701919, 0.6392157, 0, 1, 1,
0.6983076, 1.233838, -0.265484, 0.6431373, 0, 1, 1,
0.6983279, -0.478438, 1.317826, 0.6509804, 0, 1, 1,
0.7017672, 0.9262185, 0.2607188, 0.654902, 0, 1, 1,
0.7038233, 1.199956, 0.4768402, 0.6627451, 0, 1, 1,
0.7347509, 0.009410057, 1.006646, 0.6666667, 0, 1, 1,
0.7349908, -0.7351665, 2.052624, 0.6745098, 0, 1, 1,
0.7379724, -1.004687, 2.91041, 0.6784314, 0, 1, 1,
0.7385186, 0.4416203, -0.4425675, 0.6862745, 0, 1, 1,
0.7393687, 0.1344296, 1.694015, 0.6901961, 0, 1, 1,
0.7458773, -0.5347785, 3.388704, 0.6980392, 0, 1, 1,
0.7468166, 0.1195203, 0.7496128, 0.7058824, 0, 1, 1,
0.74718, 1.227619, 1.394877, 0.7098039, 0, 1, 1,
0.7473922, -0.5735164, -0.3122658, 0.7176471, 0, 1, 1,
0.7489666, 0.5372356, 1.464389, 0.7215686, 0, 1, 1,
0.7499869, 0.4046037, 1.569109, 0.7294118, 0, 1, 1,
0.7571917, -1.273745, 2.86701, 0.7333333, 0, 1, 1,
0.7617961, 1.019744, 0.276941, 0.7411765, 0, 1, 1,
0.766786, -0.6163425, 4.367698, 0.7450981, 0, 1, 1,
0.7745433, -0.1483689, 1.789443, 0.7529412, 0, 1, 1,
0.7752922, 0.6214544, 1.430683, 0.7568628, 0, 1, 1,
0.7777216, 0.7851536, 0.8440292, 0.7647059, 0, 1, 1,
0.7809932, 0.9678259, -0.0615171, 0.7686275, 0, 1, 1,
0.785997, -1.526664, 3.582227, 0.7764706, 0, 1, 1,
0.7876567, 0.07534222, 1.87378, 0.7803922, 0, 1, 1,
0.7879961, 0.8385769, 1.388349, 0.7882353, 0, 1, 1,
0.7947495, -0.493949, 2.164055, 0.7921569, 0, 1, 1,
0.7960053, -0.01850703, 2.229043, 0.8, 0, 1, 1,
0.8009599, -1.672022, 3.403643, 0.8078431, 0, 1, 1,
0.8048541, 0.3968062, 0.872191, 0.8117647, 0, 1, 1,
0.805864, 1.605914, -0.3431731, 0.8196079, 0, 1, 1,
0.8074037, -1.270857, 1.599671, 0.8235294, 0, 1, 1,
0.8116676, 0.6137501, 0.802577, 0.8313726, 0, 1, 1,
0.8152115, -0.4156935, 0.5331477, 0.8352941, 0, 1, 1,
0.8188981, 0.0820302, 2.100429, 0.8431373, 0, 1, 1,
0.8223365, -1.086247, 2.935026, 0.8470588, 0, 1, 1,
0.8225154, -1.159115, 2.513345, 0.854902, 0, 1, 1,
0.8235937, -1.214747, 3.543776, 0.8588235, 0, 1, 1,
0.8247899, -1.677367, 3.349288, 0.8666667, 0, 1, 1,
0.8288066, -1.0084, 3.127048, 0.8705882, 0, 1, 1,
0.8288542, -1.021345, 1.864562, 0.8784314, 0, 1, 1,
0.8289086, 0.241348, 0.05697146, 0.8823529, 0, 1, 1,
0.830198, -0.6238079, 1.471223, 0.8901961, 0, 1, 1,
0.8388392, -0.9186529, 3.593977, 0.8941177, 0, 1, 1,
0.8422082, -0.9206083, 1.85748, 0.9019608, 0, 1, 1,
0.8437114, -0.2032884, 1.995122, 0.9098039, 0, 1, 1,
0.845121, 0.414035, 1.776336, 0.9137255, 0, 1, 1,
0.8468572, 0.2140883, 1.222383, 0.9215686, 0, 1, 1,
0.8522938, 1.29022, 1.973246, 0.9254902, 0, 1, 1,
0.8672461, 1.338052, 1.296921, 0.9333333, 0, 1, 1,
0.8707463, -0.1378427, 2.738572, 0.9372549, 0, 1, 1,
0.8823952, -2.181204, 2.975796, 0.945098, 0, 1, 1,
0.885341, 1.147388, 0.5407955, 0.9490196, 0, 1, 1,
0.8869216, 0.203664, 2.39262, 0.9568627, 0, 1, 1,
0.8978822, 0.6769113, 0.2585776, 0.9607843, 0, 1, 1,
0.903142, -1.445065, 2.722685, 0.9686275, 0, 1, 1,
0.9180402, 0.2973614, 2.062302, 0.972549, 0, 1, 1,
0.9238201, 0.2751742, 0.7834823, 0.9803922, 0, 1, 1,
0.9277776, -0.8389305, 1.923007, 0.9843137, 0, 1, 1,
0.928132, -0.1838516, 3.682554, 0.9921569, 0, 1, 1,
0.9288898, -0.3914222, 3.048184, 0.9960784, 0, 1, 1,
0.9335242, -0.4463596, 0.7855589, 1, 0, 0.9960784, 1,
0.9380245, 1.117003, 0.7041994, 1, 0, 0.9882353, 1,
0.9392239, 0.5389674, 1.105639, 1, 0, 0.9843137, 1,
0.9400946, 1.17938, -1.670205, 1, 0, 0.9764706, 1,
0.9477829, 0.1808831, -0.158299, 1, 0, 0.972549, 1,
0.9479292, 0.3540063, 0.8290027, 1, 0, 0.9647059, 1,
0.9518194, 0.9860009, -0.01239597, 1, 0, 0.9607843, 1,
0.9694864, 1.479748, 1.958236, 1, 0, 0.9529412, 1,
0.9728618, -0.4078831, 2.763653, 1, 0, 0.9490196, 1,
0.976358, -0.5087364, 0.4070832, 1, 0, 0.9411765, 1,
0.9773273, -0.363647, 1.287702, 1, 0, 0.9372549, 1,
0.9776129, -0.2412979, 4.376896, 1, 0, 0.9294118, 1,
0.980065, 1.112523, 0.5979759, 1, 0, 0.9254902, 1,
0.9888012, 1.02955, -0.02829084, 1, 0, 0.9176471, 1,
0.9927762, -1.00895, 1.263069, 1, 0, 0.9137255, 1,
0.9934196, 0.6005012, 2.246455, 1, 0, 0.9058824, 1,
0.9986785, 2.059201, -1.125193, 1, 0, 0.9019608, 1,
1.003221, 0.7586711, 2.324394, 1, 0, 0.8941177, 1,
1.013372, -0.6785493, 1.847193, 1, 0, 0.8862745, 1,
1.0147, 0.6618488, 1.608353, 1, 0, 0.8823529, 1,
1.027841, -0.327775, 2.346832, 1, 0, 0.8745098, 1,
1.033126, -0.8954565, 1.86054, 1, 0, 0.8705882, 1,
1.033563, 0.4526319, 2.002385, 1, 0, 0.8627451, 1,
1.0396, 0.695904, 0.9026384, 1, 0, 0.8588235, 1,
1.044443, -0.02676762, -0.7599905, 1, 0, 0.8509804, 1,
1.044724, 0.7568127, 0.9280415, 1, 0, 0.8470588, 1,
1.049536, 2.452318, -0.05216831, 1, 0, 0.8392157, 1,
1.053567, 0.6518213, 2.427212, 1, 0, 0.8352941, 1,
1.063507, 1.170822, 1.646397, 1, 0, 0.827451, 1,
1.064821, -0.316486, 2.205425, 1, 0, 0.8235294, 1,
1.068397, 0.5760144, 0.4436139, 1, 0, 0.8156863, 1,
1.071808, 1.243403, 0.449336, 1, 0, 0.8117647, 1,
1.071851, 0.07543514, 1.744535, 1, 0, 0.8039216, 1,
1.077428, -1.022292, 2.109782, 1, 0, 0.7960784, 1,
1.080019, 1.28272, 1.100816, 1, 0, 0.7921569, 1,
1.084105, -0.7139439, 1.648092, 1, 0, 0.7843137, 1,
1.091472, 1.757299, 0.5712739, 1, 0, 0.7803922, 1,
1.099076, -1.199175, 2.689526, 1, 0, 0.772549, 1,
1.101094, -0.5563205, 3.77065, 1, 0, 0.7686275, 1,
1.102804, -0.2165276, 3.064533, 1, 0, 0.7607843, 1,
1.112948, -0.133589, 1.886666, 1, 0, 0.7568628, 1,
1.114481, -0.6356415, 3.405404, 1, 0, 0.7490196, 1,
1.116837, -0.2866966, 1.174311, 1, 0, 0.7450981, 1,
1.121697, -0.06993695, 3.18156, 1, 0, 0.7372549, 1,
1.128201, -0.1115775, 2.944312, 1, 0, 0.7333333, 1,
1.138743, 1.325362, 2.536281, 1, 0, 0.7254902, 1,
1.145698, 0.5353281, 1.822757, 1, 0, 0.7215686, 1,
1.146275, -1.83222, 4.290808, 1, 0, 0.7137255, 1,
1.149608, -0.2513386, 0.3583469, 1, 0, 0.7098039, 1,
1.151078, 1.507399, 0.5319206, 1, 0, 0.7019608, 1,
1.155064, -0.6119872, 1.661337, 1, 0, 0.6941177, 1,
1.159567, -1.234458, 1.901312, 1, 0, 0.6901961, 1,
1.161231, -0.4358295, 1.793049, 1, 0, 0.682353, 1,
1.165834, -0.572314, 2.556855, 1, 0, 0.6784314, 1,
1.17535, -1.07158, 3.829633, 1, 0, 0.6705883, 1,
1.177455, -0.4464941, 1.647429, 1, 0, 0.6666667, 1,
1.182121, 1.046214, -0.2692776, 1, 0, 0.6588235, 1,
1.187343, 1.160206, 0.6307598, 1, 0, 0.654902, 1,
1.190401, 0.2404181, 1.937177, 1, 0, 0.6470588, 1,
1.194113, -0.4317133, 1.872414, 1, 0, 0.6431373, 1,
1.197866, -0.1124838, 0.6307943, 1, 0, 0.6352941, 1,
1.199407, -0.0784094, 0.8612089, 1, 0, 0.6313726, 1,
1.202015, -0.714143, 1.709718, 1, 0, 0.6235294, 1,
1.211408, -0.8262645, 1.10523, 1, 0, 0.6196079, 1,
1.213638, 0.316454, 1.700087, 1, 0, 0.6117647, 1,
1.213803, -0.6755792, 2.675271, 1, 0, 0.6078432, 1,
1.21811, 2.018466, -1.646616, 1, 0, 0.6, 1,
1.22286, 0.964635, 0.8952083, 1, 0, 0.5921569, 1,
1.236841, 0.3211607, -0.2637855, 1, 0, 0.5882353, 1,
1.237412, -0.4615089, 2.79651, 1, 0, 0.5803922, 1,
1.241732, 1.212893, 2.393479, 1, 0, 0.5764706, 1,
1.246534, -0.6024573, 0.9435498, 1, 0, 0.5686275, 1,
1.249075, -0.1158445, 1.900968, 1, 0, 0.5647059, 1,
1.250269, -0.6305382, 3.100973, 1, 0, 0.5568628, 1,
1.253517, -1.193022, 3.110889, 1, 0, 0.5529412, 1,
1.260709, 1.776721, 0.2296875, 1, 0, 0.5450981, 1,
1.272316, -0.09822401, 1.798207, 1, 0, 0.5411765, 1,
1.277874, 0.2679319, 1.621834, 1, 0, 0.5333334, 1,
1.31758, -0.2766211, 1.778098, 1, 0, 0.5294118, 1,
1.319403, -0.7226785, 1.231811, 1, 0, 0.5215687, 1,
1.321589, -1.520046, 4.019854, 1, 0, 0.5176471, 1,
1.330881, 0.4420201, 0.02208197, 1, 0, 0.509804, 1,
1.33926, 0.3647973, 1.209316, 1, 0, 0.5058824, 1,
1.340468, 0.3316988, 1.48305, 1, 0, 0.4980392, 1,
1.352643, 0.4817292, -0.5778689, 1, 0, 0.4901961, 1,
1.360693, 2.070687, -0.3493513, 1, 0, 0.4862745, 1,
1.362006, -1.219688, 3.23554, 1, 0, 0.4784314, 1,
1.365877, -0.7915027, 1.927762, 1, 0, 0.4745098, 1,
1.381291, 0.6147866, 1.438737, 1, 0, 0.4666667, 1,
1.388104, 0.5269231, 0.5250223, 1, 0, 0.4627451, 1,
1.390406, -0.2207494, 2.859601, 1, 0, 0.454902, 1,
1.392692, 0.2017704, 2.669908, 1, 0, 0.4509804, 1,
1.402032, -0.1116028, 1.613946, 1, 0, 0.4431373, 1,
1.404667, 0.3902757, 0.3682834, 1, 0, 0.4392157, 1,
1.404949, 0.005214676, 1.404071, 1, 0, 0.4313726, 1,
1.411056, -0.7093462, 2.363461, 1, 0, 0.427451, 1,
1.412081, -0.9957404, 2.439483, 1, 0, 0.4196078, 1,
1.415058, -1.0121, 2.76562, 1, 0, 0.4156863, 1,
1.429077, 0.5886931, 0.8143712, 1, 0, 0.4078431, 1,
1.450229, 0.5584008, 1.207981, 1, 0, 0.4039216, 1,
1.450271, -0.6162732, 2.425106, 1, 0, 0.3960784, 1,
1.455658, 0.09477671, 1.692133, 1, 0, 0.3882353, 1,
1.459147, 0.7865774, 1.452911, 1, 0, 0.3843137, 1,
1.469348, 1.430589, -1.079226, 1, 0, 0.3764706, 1,
1.471662, 2.067423, -1.288601, 1, 0, 0.372549, 1,
1.488746, -0.433639, 0.8229278, 1, 0, 0.3647059, 1,
1.498818, -0.4562189, 1.57895, 1, 0, 0.3607843, 1,
1.50146, -0.9847071, 2.66437, 1, 0, 0.3529412, 1,
1.506953, 0.5515901, 4.122509, 1, 0, 0.3490196, 1,
1.510766, 0.6646861, 1.743786, 1, 0, 0.3411765, 1,
1.513493, 0.3815292, 1.821308, 1, 0, 0.3372549, 1,
1.515006, 0.5891345, 0.6085898, 1, 0, 0.3294118, 1,
1.52589, 0.1299663, 0.7146153, 1, 0, 0.3254902, 1,
1.537374, -0.8414032, 2.123435, 1, 0, 0.3176471, 1,
1.553449, 0.9700285, 1.19484, 1, 0, 0.3137255, 1,
1.555071, -0.5869135, -1.149715, 1, 0, 0.3058824, 1,
1.562982, 1.081167, -1.377217, 1, 0, 0.2980392, 1,
1.567048, -0.03229449, 2.873214, 1, 0, 0.2941177, 1,
1.571755, -0.5422567, 1.635539, 1, 0, 0.2862745, 1,
1.576916, 2.328606, 1.037217, 1, 0, 0.282353, 1,
1.589069, 0.4293656, 0.2877568, 1, 0, 0.2745098, 1,
1.596496, 0.6534922, 2.260996, 1, 0, 0.2705882, 1,
1.613064, -0.6229357, 3.112562, 1, 0, 0.2627451, 1,
1.616475, -1.311828, 1.555374, 1, 0, 0.2588235, 1,
1.622499, 0.4184604, 2.181949, 1, 0, 0.2509804, 1,
1.623608, 1.22685, 1.396263, 1, 0, 0.2470588, 1,
1.627187, -0.2021236, 1.413919, 1, 0, 0.2392157, 1,
1.631725, -3.028208, 1.960993, 1, 0, 0.2352941, 1,
1.645186, -0.138952, 1.592779, 1, 0, 0.227451, 1,
1.655792, 1.061256, 2.072788, 1, 0, 0.2235294, 1,
1.658521, -0.6956558, 1.847927, 1, 0, 0.2156863, 1,
1.676316, 0.4950626, 0.0577304, 1, 0, 0.2117647, 1,
1.718229, 0.6659336, 0.5534494, 1, 0, 0.2039216, 1,
1.755939, 0.6845174, 0.4930228, 1, 0, 0.1960784, 1,
1.766464, 0.7918698, 1.122103, 1, 0, 0.1921569, 1,
1.781352, -0.2256244, 0.9212914, 1, 0, 0.1843137, 1,
1.7883, 0.6387042, 1.381345, 1, 0, 0.1803922, 1,
1.792401, 1.821495, 0.8090388, 1, 0, 0.172549, 1,
1.818285, 0.2614711, -0.20572, 1, 0, 0.1686275, 1,
1.852054, -1.601819, 3.364646, 1, 0, 0.1607843, 1,
1.886537, 0.3193498, 0.7732212, 1, 0, 0.1568628, 1,
1.903702, -1.44768, 1.584277, 1, 0, 0.1490196, 1,
1.905775, 0.7383628, 0.0404438, 1, 0, 0.145098, 1,
1.917413, -1.552008, 1.421243, 1, 0, 0.1372549, 1,
1.968835, 1.169601, 0.3722231, 1, 0, 0.1333333, 1,
1.990139, 0.9916152, -0.2563452, 1, 0, 0.1254902, 1,
1.994614, -0.8061651, 2.545414, 1, 0, 0.1215686, 1,
2.047854, -1.534862, 3.624852, 1, 0, 0.1137255, 1,
2.093548, -0.6341194, 0.4402308, 1, 0, 0.1098039, 1,
2.111944, -0.4940616, 2.049057, 1, 0, 0.1019608, 1,
2.144898, -0.380707, 3.185913, 1, 0, 0.09411765, 1,
2.231219, -0.3824038, -0.1953941, 1, 0, 0.09019608, 1,
2.233952, 0.475977, 2.179309, 1, 0, 0.08235294, 1,
2.28277, -0.6295907, 1.87121, 1, 0, 0.07843138, 1,
2.322423, -0.675279, 4.90262, 1, 0, 0.07058824, 1,
2.330928, -0.5425006, 1.445996, 1, 0, 0.06666667, 1,
2.368331, -0.9796698, 2.332131, 1, 0, 0.05882353, 1,
2.375813, 0.4802704, 0.3049838, 1, 0, 0.05490196, 1,
2.426251, 1.437158, -1.318938, 1, 0, 0.04705882, 1,
2.426734, -0.367972, 0.3837677, 1, 0, 0.04313726, 1,
2.473178, -0.1532011, 2.646881, 1, 0, 0.03529412, 1,
2.88204, -0.8840948, 2.057485, 1, 0, 0.03137255, 1,
2.889039, 0.9370639, 1.589168, 1, 0, 0.02352941, 1,
2.9249, 0.4419202, 0.431795, 1, 0, 0.01960784, 1,
3.100455, -1.096254, 1.337387, 1, 0, 0.01176471, 1,
3.292398, -0.009150643, 1.248457, 1, 0, 0.007843138, 1
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
0.07048368, -4.103947, -6.973264, 0, -0.5, 0.5, 0.5,
0.07048368, -4.103947, -6.973264, 1, -0.5, 0.5, 0.5,
0.07048368, -4.103947, -6.973264, 1, 1.5, 0.5, 0.5,
0.07048368, -4.103947, -6.973264, 0, 1.5, 0.5, 0.5
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
-4.243659, 0.1450626, -6.973264, 0, -0.5, 0.5, 0.5,
-4.243659, 0.1450626, -6.973264, 1, -0.5, 0.5, 0.5,
-4.243659, 0.1450626, -6.973264, 1, 1.5, 0.5, 0.5,
-4.243659, 0.1450626, -6.973264, 0, 1.5, 0.5, 0.5
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
-4.243659, -4.103947, 0.1226304, 0, -0.5, 0.5, 0.5,
-4.243659, -4.103947, 0.1226304, 1, -0.5, 0.5, 0.5,
-4.243659, -4.103947, 0.1226304, 1, 1.5, 0.5, 0.5,
-4.243659, -4.103947, 0.1226304, 0, 1.5, 0.5, 0.5
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
-3, -3.123406, -5.33575,
3, -3.123406, -5.33575,
-3, -3.123406, -5.33575,
-3, -3.28683, -5.608669,
-2, -3.123406, -5.33575,
-2, -3.28683, -5.608669,
-1, -3.123406, -5.33575,
-1, -3.28683, -5.608669,
0, -3.123406, -5.33575,
0, -3.28683, -5.608669,
1, -3.123406, -5.33575,
1, -3.28683, -5.608669,
2, -3.123406, -5.33575,
2, -3.28683, -5.608669,
3, -3.123406, -5.33575,
3, -3.28683, -5.608669
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
-3, -3.613677, -6.154507, 0, -0.5, 0.5, 0.5,
-3, -3.613677, -6.154507, 1, -0.5, 0.5, 0.5,
-3, -3.613677, -6.154507, 1, 1.5, 0.5, 0.5,
-3, -3.613677, -6.154507, 0, 1.5, 0.5, 0.5,
-2, -3.613677, -6.154507, 0, -0.5, 0.5, 0.5,
-2, -3.613677, -6.154507, 1, -0.5, 0.5, 0.5,
-2, -3.613677, -6.154507, 1, 1.5, 0.5, 0.5,
-2, -3.613677, -6.154507, 0, 1.5, 0.5, 0.5,
-1, -3.613677, -6.154507, 0, -0.5, 0.5, 0.5,
-1, -3.613677, -6.154507, 1, -0.5, 0.5, 0.5,
-1, -3.613677, -6.154507, 1, 1.5, 0.5, 0.5,
-1, -3.613677, -6.154507, 0, 1.5, 0.5, 0.5,
0, -3.613677, -6.154507, 0, -0.5, 0.5, 0.5,
0, -3.613677, -6.154507, 1, -0.5, 0.5, 0.5,
0, -3.613677, -6.154507, 1, 1.5, 0.5, 0.5,
0, -3.613677, -6.154507, 0, 1.5, 0.5, 0.5,
1, -3.613677, -6.154507, 0, -0.5, 0.5, 0.5,
1, -3.613677, -6.154507, 1, -0.5, 0.5, 0.5,
1, -3.613677, -6.154507, 1, 1.5, 0.5, 0.5,
1, -3.613677, -6.154507, 0, 1.5, 0.5, 0.5,
2, -3.613677, -6.154507, 0, -0.5, 0.5, 0.5,
2, -3.613677, -6.154507, 1, -0.5, 0.5, 0.5,
2, -3.613677, -6.154507, 1, 1.5, 0.5, 0.5,
2, -3.613677, -6.154507, 0, 1.5, 0.5, 0.5,
3, -3.613677, -6.154507, 0, -0.5, 0.5, 0.5,
3, -3.613677, -6.154507, 1, -0.5, 0.5, 0.5,
3, -3.613677, -6.154507, 1, 1.5, 0.5, 0.5,
3, -3.613677, -6.154507, 0, 1.5, 0.5, 0.5
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
-3.248088, -3, -5.33575,
-3.248088, 3, -5.33575,
-3.248088, -3, -5.33575,
-3.414016, -3, -5.608669,
-3.248088, -2, -5.33575,
-3.414016, -2, -5.608669,
-3.248088, -1, -5.33575,
-3.414016, -1, -5.608669,
-3.248088, 0, -5.33575,
-3.414016, 0, -5.608669,
-3.248088, 1, -5.33575,
-3.414016, 1, -5.608669,
-3.248088, 2, -5.33575,
-3.414016, 2, -5.608669,
-3.248088, 3, -5.33575,
-3.414016, 3, -5.608669
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
-3.745873, -3, -6.154507, 0, -0.5, 0.5, 0.5,
-3.745873, -3, -6.154507, 1, -0.5, 0.5, 0.5,
-3.745873, -3, -6.154507, 1, 1.5, 0.5, 0.5,
-3.745873, -3, -6.154507, 0, 1.5, 0.5, 0.5,
-3.745873, -2, -6.154507, 0, -0.5, 0.5, 0.5,
-3.745873, -2, -6.154507, 1, -0.5, 0.5, 0.5,
-3.745873, -2, -6.154507, 1, 1.5, 0.5, 0.5,
-3.745873, -2, -6.154507, 0, 1.5, 0.5, 0.5,
-3.745873, -1, -6.154507, 0, -0.5, 0.5, 0.5,
-3.745873, -1, -6.154507, 1, -0.5, 0.5, 0.5,
-3.745873, -1, -6.154507, 1, 1.5, 0.5, 0.5,
-3.745873, -1, -6.154507, 0, 1.5, 0.5, 0.5,
-3.745873, 0, -6.154507, 0, -0.5, 0.5, 0.5,
-3.745873, 0, -6.154507, 1, -0.5, 0.5, 0.5,
-3.745873, 0, -6.154507, 1, 1.5, 0.5, 0.5,
-3.745873, 0, -6.154507, 0, 1.5, 0.5, 0.5,
-3.745873, 1, -6.154507, 0, -0.5, 0.5, 0.5,
-3.745873, 1, -6.154507, 1, -0.5, 0.5, 0.5,
-3.745873, 1, -6.154507, 1, 1.5, 0.5, 0.5,
-3.745873, 1, -6.154507, 0, 1.5, 0.5, 0.5,
-3.745873, 2, -6.154507, 0, -0.5, 0.5, 0.5,
-3.745873, 2, -6.154507, 1, -0.5, 0.5, 0.5,
-3.745873, 2, -6.154507, 1, 1.5, 0.5, 0.5,
-3.745873, 2, -6.154507, 0, 1.5, 0.5, 0.5,
-3.745873, 3, -6.154507, 0, -0.5, 0.5, 0.5,
-3.745873, 3, -6.154507, 1, -0.5, 0.5, 0.5,
-3.745873, 3, -6.154507, 1, 1.5, 0.5, 0.5,
-3.745873, 3, -6.154507, 0, 1.5, 0.5, 0.5
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
-3.248088, -3.123406, -4,
-3.248088, -3.123406, 4,
-3.248088, -3.123406, -4,
-3.414016, -3.28683, -4,
-3.248088, -3.123406, -2,
-3.414016, -3.28683, -2,
-3.248088, -3.123406, 0,
-3.414016, -3.28683, 0,
-3.248088, -3.123406, 2,
-3.414016, -3.28683, 2,
-3.248088, -3.123406, 4,
-3.414016, -3.28683, 4
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
-3.745873, -3.613677, -4, 0, -0.5, 0.5, 0.5,
-3.745873, -3.613677, -4, 1, -0.5, 0.5, 0.5,
-3.745873, -3.613677, -4, 1, 1.5, 0.5, 0.5,
-3.745873, -3.613677, -4, 0, 1.5, 0.5, 0.5,
-3.745873, -3.613677, -2, 0, -0.5, 0.5, 0.5,
-3.745873, -3.613677, -2, 1, -0.5, 0.5, 0.5,
-3.745873, -3.613677, -2, 1, 1.5, 0.5, 0.5,
-3.745873, -3.613677, -2, 0, 1.5, 0.5, 0.5,
-3.745873, -3.613677, 0, 0, -0.5, 0.5, 0.5,
-3.745873, -3.613677, 0, 1, -0.5, 0.5, 0.5,
-3.745873, -3.613677, 0, 1, 1.5, 0.5, 0.5,
-3.745873, -3.613677, 0, 0, 1.5, 0.5, 0.5,
-3.745873, -3.613677, 2, 0, -0.5, 0.5, 0.5,
-3.745873, -3.613677, 2, 1, -0.5, 0.5, 0.5,
-3.745873, -3.613677, 2, 1, 1.5, 0.5, 0.5,
-3.745873, -3.613677, 2, 0, 1.5, 0.5, 0.5,
-3.745873, -3.613677, 4, 0, -0.5, 0.5, 0.5,
-3.745873, -3.613677, 4, 1, -0.5, 0.5, 0.5,
-3.745873, -3.613677, 4, 1, 1.5, 0.5, 0.5,
-3.745873, -3.613677, 4, 0, 1.5, 0.5, 0.5
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
-3.248088, -3.123406, -5.33575,
-3.248088, 3.413532, -5.33575,
-3.248088, -3.123406, 5.581011,
-3.248088, 3.413532, 5.581011,
-3.248088, -3.123406, -5.33575,
-3.248088, -3.123406, 5.581011,
-3.248088, 3.413532, -5.33575,
-3.248088, 3.413532, 5.581011,
-3.248088, -3.123406, -5.33575,
3.389055, -3.123406, -5.33575,
-3.248088, -3.123406, 5.581011,
3.389055, -3.123406, 5.581011,
-3.248088, 3.413532, -5.33575,
3.389055, 3.413532, -5.33575,
-3.248088, 3.413532, 5.581011,
3.389055, 3.413532, 5.581011,
3.389055, -3.123406, -5.33575,
3.389055, 3.413532, -5.33575,
3.389055, -3.123406, 5.581011,
3.389055, 3.413532, 5.581011,
3.389055, -3.123406, -5.33575,
3.389055, -3.123406, 5.581011,
3.389055, 3.413532, -5.33575,
3.389055, 3.413532, 5.581011
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
var radius = 7.663299;
var distance = 34.09488;
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
mvMatrix.translate( -0.07048368, -0.1450626, -0.1226304 );
mvMatrix.scale( 1.248385, 1.267521, 0.7589896 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.09488);
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
fentin_acetate<-read.table("fentin_acetate.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-fentin_acetate$V2
```

```
## Error in eval(expr, envir, enclos): object 'fentin_acetate' not found
```

```r
y<-fentin_acetate$V3
```

```
## Error in eval(expr, envir, enclos): object 'fentin_acetate' not found
```

```r
z<-fentin_acetate$V4
```

```
## Error in eval(expr, envir, enclos): object 'fentin_acetate' not found
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
-3.15143, 0.1556656, 0.1485081, 0, 0, 1, 1, 1,
-3.042969, 0.6736075, -2.44101, 1, 0, 0, 1, 1,
-3.001822, 0.2742699, 0.5472639, 1, 0, 0, 1, 1,
-2.982816, -0.3529733, -0.394363, 1, 0, 0, 1, 1,
-2.772845, -1.635483, -2.979734, 1, 0, 0, 1, 1,
-2.764226, -1.431672, -2.690969, 1, 0, 0, 1, 1,
-2.666512, 0.8862839, -1.173719, 0, 0, 0, 1, 1,
-2.491267, 0.6611522, -1.851942, 0, 0, 0, 1, 1,
-2.368178, -0.03297838, -2.222069, 0, 0, 0, 1, 1,
-2.358063, 0.3798155, -1.828353, 0, 0, 0, 1, 1,
-2.353819, -1.266522, -1.455998, 0, 0, 0, 1, 1,
-2.232205, -1.160654, -0.6408849, 0, 0, 0, 1, 1,
-2.14255, -0.5628847, -2.800382, 0, 0, 0, 1, 1,
-2.128085, -0.01329072, -2.812367, 1, 1, 1, 1, 1,
-2.126397, 1.228505, -0.9470235, 1, 1, 1, 1, 1,
-2.096842, -0.2943067, -1.63847, 1, 1, 1, 1, 1,
-2.091082, -1.322449, -3.075729, 1, 1, 1, 1, 1,
-2.07473, 0.6554922, -2.047971, 1, 1, 1, 1, 1,
-2.05909, 1.767039, 0.5489227, 1, 1, 1, 1, 1,
-2.027842, 1.176694, 0.8090353, 1, 1, 1, 1, 1,
-2.012227, 1.319862, -1.038105, 1, 1, 1, 1, 1,
-1.991731, -1.679932, -2.660427, 1, 1, 1, 1, 1,
-1.986611, 0.7327109, -0.7092919, 1, 1, 1, 1, 1,
-1.976207, 0.8979837, -1.507325, 1, 1, 1, 1, 1,
-1.9753, 0.8403466, -1.094766, 1, 1, 1, 1, 1,
-1.96439, -0.7479799, -2.535655, 1, 1, 1, 1, 1,
-1.946963, 0.1643571, -0.9671004, 1, 1, 1, 1, 1,
-1.859879, -0.6897792, -2.376526, 1, 1, 1, 1, 1,
-1.828645, -0.2622978, -2.109803, 0, 0, 1, 1, 1,
-1.821779, -0.774136, 0.05144065, 1, 0, 0, 1, 1,
-1.812762, 1.797301, -2.161028, 1, 0, 0, 1, 1,
-1.808203, 0.09748051, -2.151824, 1, 0, 0, 1, 1,
-1.803872, 1.931535, -1.407555, 1, 0, 0, 1, 1,
-1.799745, 0.2984456, -1.788101, 1, 0, 0, 1, 1,
-1.757781, 0.3016245, 1.078199, 0, 0, 0, 1, 1,
-1.748553, 1.18287, -1.710097, 0, 0, 0, 1, 1,
-1.719001, -0.6806308, -0.9709873, 0, 0, 0, 1, 1,
-1.715666, 0.6482494, -1.558151, 0, 0, 0, 1, 1,
-1.701415, 0.6361137, -1.936566, 0, 0, 0, 1, 1,
-1.685152, -0.6433768, -3.680421, 0, 0, 0, 1, 1,
-1.667959, -1.180251, -1.200515, 0, 0, 0, 1, 1,
-1.664926, 0.583114, -1.168259, 1, 1, 1, 1, 1,
-1.640185, -0.4435591, -1.669117, 1, 1, 1, 1, 1,
-1.631533, 0.6114888, -1.887888, 1, 1, 1, 1, 1,
-1.611413, 0.02161833, -2.040467, 1, 1, 1, 1, 1,
-1.603032, -1.366631, -3.216684, 1, 1, 1, 1, 1,
-1.601616, 1.725953, -1.081535, 1, 1, 1, 1, 1,
-1.596433, 0.3683235, -0.9689708, 1, 1, 1, 1, 1,
-1.579296, -1.249607, -1.061911, 1, 1, 1, 1, 1,
-1.578731, 0.8378546, -0.7467673, 1, 1, 1, 1, 1,
-1.574785, 0.0376733, -0.9014121, 1, 1, 1, 1, 1,
-1.559321, -1.743217, -1.574273, 1, 1, 1, 1, 1,
-1.556797, -0.003687127, -1.497336, 1, 1, 1, 1, 1,
-1.54121, 0.8379722, -1.095098, 1, 1, 1, 1, 1,
-1.536854, 0.7694805, 0.6475901, 1, 1, 1, 1, 1,
-1.53283, -0.02073472, -2.374968, 1, 1, 1, 1, 1,
-1.513893, 0.01767025, -0.8478978, 0, 0, 1, 1, 1,
-1.507166, 1.592429, -0.6484579, 1, 0, 0, 1, 1,
-1.506875, 0.2602408, -1.269074, 1, 0, 0, 1, 1,
-1.487658, 0.4635329, -2.629494, 1, 0, 0, 1, 1,
-1.481135, -1.259374, -1.571751, 1, 0, 0, 1, 1,
-1.468736, 0.6408813, -1.944588, 1, 0, 0, 1, 1,
-1.457876, -0.003856644, -3.612342, 0, 0, 0, 1, 1,
-1.44518, 0.5608732, -2.184033, 0, 0, 0, 1, 1,
-1.432334, 1.624991, -1.37026, 0, 0, 0, 1, 1,
-1.424285, 0.05226709, -0.5870324, 0, 0, 0, 1, 1,
-1.408727, 0.779799, -1.5319, 0, 0, 0, 1, 1,
-1.396153, 2.03075, -2.262925, 0, 0, 0, 1, 1,
-1.387264, -2.133713, -2.68105, 0, 0, 0, 1, 1,
-1.368428, -0.8320901, -2.205012, 1, 1, 1, 1, 1,
-1.366149, -0.6926143, -1.270462, 1, 1, 1, 1, 1,
-1.365876, -0.5882215, -2.882111, 1, 1, 1, 1, 1,
-1.365122, 2.098383, -1.091945, 1, 1, 1, 1, 1,
-1.361874, 0.7698595, -0.5362376, 1, 1, 1, 1, 1,
-1.360857, 1.256911, -2.046508, 1, 1, 1, 1, 1,
-1.357995, -0.7867031, -0.9120292, 1, 1, 1, 1, 1,
-1.355907, 0.5749975, -1.653249, 1, 1, 1, 1, 1,
-1.353599, -1.526448, -2.583064, 1, 1, 1, 1, 1,
-1.341124, 0.3299363, -1.77108, 1, 1, 1, 1, 1,
-1.333701, -0.09508055, -3.155299, 1, 1, 1, 1, 1,
-1.32575, 0.6271171, -0.02054363, 1, 1, 1, 1, 1,
-1.325114, -0.01434978, -1.782171, 1, 1, 1, 1, 1,
-1.323582, 0.3949984, -1.528071, 1, 1, 1, 1, 1,
-1.323026, 0.2428225, -1.493098, 1, 1, 1, 1, 1,
-1.322309, 1.377554, -1.599174, 0, 0, 1, 1, 1,
-1.319686, 0.6441287, 0.2210584, 1, 0, 0, 1, 1,
-1.317798, -0.658806, -0.5122035, 1, 0, 0, 1, 1,
-1.313796, -0.6873026, -2.560833, 1, 0, 0, 1, 1,
-1.311804, -1.810422, -1.502945, 1, 0, 0, 1, 1,
-1.311215, 0.1143784, -2.87402, 1, 0, 0, 1, 1,
-1.304054, 0.1176305, -0.7220198, 0, 0, 0, 1, 1,
-1.293193, 0.2572651, -2.980472, 0, 0, 0, 1, 1,
-1.289412, -1.322318, -3.731635, 0, 0, 0, 1, 1,
-1.28927, -0.5143741, -1.487285, 0, 0, 0, 1, 1,
-1.285383, 1.012449, -0.1586959, 0, 0, 0, 1, 1,
-1.283774, 0.9051303, 0.5780144, 0, 0, 0, 1, 1,
-1.2814, 0.3302012, -3.330452, 0, 0, 0, 1, 1,
-1.28087, -0.08913714, -2.361872, 1, 1, 1, 1, 1,
-1.279767, -0.8290391, -3.238746, 1, 1, 1, 1, 1,
-1.274476, 1.092308, -1.05779, 1, 1, 1, 1, 1,
-1.274366, -1.511679, -2.742623, 1, 1, 1, 1, 1,
-1.251179, -0.3899702, -1.042721, 1, 1, 1, 1, 1,
-1.24879, -1.173278, -1.778722, 1, 1, 1, 1, 1,
-1.236496, -0.7758266, -2.139429, 1, 1, 1, 1, 1,
-1.235368, -0.5904472, -2.513243, 1, 1, 1, 1, 1,
-1.234878, -1.157123, -2.145049, 1, 1, 1, 1, 1,
-1.231937, -1.689149, -2.644037, 1, 1, 1, 1, 1,
-1.227298, 0.5094922, -2.158888, 1, 1, 1, 1, 1,
-1.218015, 0.1503023, -2.029671, 1, 1, 1, 1, 1,
-1.215533, 0.06959981, -2.148686, 1, 1, 1, 1, 1,
-1.209364, 1.584401, -0.2321138, 1, 1, 1, 1, 1,
-1.203345, 0.4998695, -1.097476, 1, 1, 1, 1, 1,
-1.201189, 1.046991, 0.2102638, 0, 0, 1, 1, 1,
-1.199989, 2.310857, -1.165913, 1, 0, 0, 1, 1,
-1.199445, -1.011121, -3.148012, 1, 0, 0, 1, 1,
-1.198167, 0.08518936, -3.182712, 1, 0, 0, 1, 1,
-1.18212, 0.5540012, -0.6477423, 1, 0, 0, 1, 1,
-1.174143, -0.1711457, -2.370512, 1, 0, 0, 1, 1,
-1.17052, -0.1086566, -1.467908, 0, 0, 0, 1, 1,
-1.170008, -0.2292509, -1.238679, 0, 0, 0, 1, 1,
-1.162271, -0.4151844, -3.40227, 0, 0, 0, 1, 1,
-1.1557, -0.8012962, -0.4095767, 0, 0, 0, 1, 1,
-1.151344, 0.3599109, -2.325081, 0, 0, 0, 1, 1,
-1.146916, 0.5362464, -1.870891, 0, 0, 0, 1, 1,
-1.145915, -1.600034, -4.315633, 0, 0, 0, 1, 1,
-1.144194, -0.6699002, -2.372164, 1, 1, 1, 1, 1,
-1.140172, 0.6558358, -0.8933135, 1, 1, 1, 1, 1,
-1.133315, -1.382424, -4.132097, 1, 1, 1, 1, 1,
-1.130396, 0.5764896, -0.9656038, 1, 1, 1, 1, 1,
-1.129419, -0.6216191, -0.1498923, 1, 1, 1, 1, 1,
-1.113107, -0.3141921, -2.920638, 1, 1, 1, 1, 1,
-1.111805, -2.179367, -2.823998, 1, 1, 1, 1, 1,
-1.106288, 0.6441519, -0.4900132, 1, 1, 1, 1, 1,
-1.09279, -0.3847037, -1.985961, 1, 1, 1, 1, 1,
-1.086482, -0.2509267, -2.444648, 1, 1, 1, 1, 1,
-1.084584, 0.4934859, -0.6741236, 1, 1, 1, 1, 1,
-1.077262, -1.520214, -0.1468229, 1, 1, 1, 1, 1,
-1.07639, -0.5028389, -1.423238, 1, 1, 1, 1, 1,
-1.074334, -0.7265516, -2.548413, 1, 1, 1, 1, 1,
-1.073608, 1.194711, -1.00917, 1, 1, 1, 1, 1,
-1.070141, -1.700208, -1.656129, 0, 0, 1, 1, 1,
-1.068535, -0.3597093, -2.221171, 1, 0, 0, 1, 1,
-1.060191, 0.1008406, -2.701663, 1, 0, 0, 1, 1,
-1.058463, 0.1470105, 0.07655233, 1, 0, 0, 1, 1,
-1.057673, 0.5697958, -0.9642648, 1, 0, 0, 1, 1,
-1.050157, 2.047747, -2.020547, 1, 0, 0, 1, 1,
-1.046105, 0.8735014, -2.953256, 0, 0, 0, 1, 1,
-1.044973, -0.5163324, -2.380135, 0, 0, 0, 1, 1,
-1.041947, -0.4974096, -1.920224, 0, 0, 0, 1, 1,
-1.029155, 1.043294, -1.698731, 0, 0, 0, 1, 1,
-1.028121, 0.1145697, -1.475367, 0, 0, 0, 1, 1,
-1.027421, -0.892092, -1.601719, 0, 0, 0, 1, 1,
-1.02052, -0.3302532, -1.504773, 0, 0, 0, 1, 1,
-1.016099, 0.5595796, -1.32562, 1, 1, 1, 1, 1,
-1.008232, 1.194908, -0.1336021, 1, 1, 1, 1, 1,
-1.003916, 1.576801, -0.9817786, 1, 1, 1, 1, 1,
-1.003592, -1.204695, 0.1183214, 1, 1, 1, 1, 1,
-0.9947715, 0.9164749, 0.3753866, 1, 1, 1, 1, 1,
-0.9920181, -1.317076, -1.919394, 1, 1, 1, 1, 1,
-0.9908289, -0.9419258, -3.879776, 1, 1, 1, 1, 1,
-0.9833326, -2.18964, -1.768351, 1, 1, 1, 1, 1,
-0.9789343, 0.208581, -0.7841537, 1, 1, 1, 1, 1,
-0.9679503, -0.5571104, -0.8751637, 1, 1, 1, 1, 1,
-0.9613949, -1.400738, -2.056381, 1, 1, 1, 1, 1,
-0.9587878, -1.266187, -3.745694, 1, 1, 1, 1, 1,
-0.9570349, 0.2117085, -1.427369, 1, 1, 1, 1, 1,
-0.9522405, 1.650391, -0.2762578, 1, 1, 1, 1, 1,
-0.9460258, 1.505403, 0.07261825, 1, 1, 1, 1, 1,
-0.942071, -0.01337662, -1.321867, 0, 0, 1, 1, 1,
-0.9341182, 0.3197644, -1.444509, 1, 0, 0, 1, 1,
-0.9237362, -0.810158, -2.666491, 1, 0, 0, 1, 1,
-0.9163855, 1.914085, -0.998171, 1, 0, 0, 1, 1,
-0.9161262, 1.780717, -2.202275, 1, 0, 0, 1, 1,
-0.9134229, 0.04836593, -2.582167, 1, 0, 0, 1, 1,
-0.9124117, -0.8386816, -4.078748, 0, 0, 0, 1, 1,
-0.91002, -0.4493529, -2.164184, 0, 0, 0, 1, 1,
-0.9047878, -0.3067979, -1.557364, 0, 0, 0, 1, 1,
-0.9008122, -0.1640434, -3.260947, 0, 0, 0, 1, 1,
-0.8958802, 0.9667789, -2.55938, 0, 0, 0, 1, 1,
-0.895336, 0.7189282, -1.025862, 0, 0, 0, 1, 1,
-0.8917712, 0.688442, 0.8489025, 0, 0, 0, 1, 1,
-0.8881318, -0.6840639, -1.825135, 1, 1, 1, 1, 1,
-0.8873364, -2.31277, -0.05061135, 1, 1, 1, 1, 1,
-0.8856221, 1.394974, -1.323581, 1, 1, 1, 1, 1,
-0.88442, 0.9441882, -0.2796939, 1, 1, 1, 1, 1,
-0.8825432, -0.1520844, -0.4950485, 1, 1, 1, 1, 1,
-0.8744393, 1.371167, -1.74421, 1, 1, 1, 1, 1,
-0.8742118, -1.416863, -1.974267, 1, 1, 1, 1, 1,
-0.8735838, 1.90207, -0.7155005, 1, 1, 1, 1, 1,
-0.8727525, 0.06257752, -1.738417, 1, 1, 1, 1, 1,
-0.8683577, -0.85829, -3.541004, 1, 1, 1, 1, 1,
-0.8619912, 1.26018, -0.3570728, 1, 1, 1, 1, 1,
-0.86152, -0.5684257, -3.46435, 1, 1, 1, 1, 1,
-0.8548241, -0.3934677, -2.468853, 1, 1, 1, 1, 1,
-0.8547175, -1.341162, -1.726442, 1, 1, 1, 1, 1,
-0.8429375, -0.5121177, -1.973956, 1, 1, 1, 1, 1,
-0.8382185, 0.4558447, -2.065191, 0, 0, 1, 1, 1,
-0.8339117, 1.201499, -1.041816, 1, 0, 0, 1, 1,
-0.8314729, 0.0443688, -1.252897, 1, 0, 0, 1, 1,
-0.8302833, -0.4413134, -0.843348, 1, 0, 0, 1, 1,
-0.8296847, -0.408874, -1.857929, 1, 0, 0, 1, 1,
-0.8203728, 0.2784309, -2.307295, 1, 0, 0, 1, 1,
-0.8198013, 0.7452739, -2.422362, 0, 0, 0, 1, 1,
-0.8111189, -0.3088347, -1.230053, 0, 0, 0, 1, 1,
-0.8080732, -0.2544161, -1.244022, 0, 0, 0, 1, 1,
-0.8012595, -0.7542314, -3.088023, 0, 0, 0, 1, 1,
-0.7995313, 1.382342, -1.33927, 0, 0, 0, 1, 1,
-0.794728, 0.6617791, -2.07683, 0, 0, 0, 1, 1,
-0.7937637, -0.2553502, -3.291458, 0, 0, 0, 1, 1,
-0.7867191, -0.541252, -0.9863592, 1, 1, 1, 1, 1,
-0.7823716, -0.01746487, 0.8102103, 1, 1, 1, 1, 1,
-0.7793675, 0.8098584, -1.145251, 1, 1, 1, 1, 1,
-0.7754632, 1.22126, -0.9327053, 1, 1, 1, 1, 1,
-0.7740647, -0.7723112, -2.507368, 1, 1, 1, 1, 1,
-0.7709071, 1.409702, -0.2119928, 1, 1, 1, 1, 1,
-0.7643301, 0.2216296, -0.3261473, 1, 1, 1, 1, 1,
-0.7601095, 0.1921893, -1.505929, 1, 1, 1, 1, 1,
-0.7579082, -0.994357, -3.897686, 1, 1, 1, 1, 1,
-0.7549242, 1.53052, -1.014554, 1, 1, 1, 1, 1,
-0.7475593, 3.219074, -0.1229276, 1, 1, 1, 1, 1,
-0.7460747, -0.3046835, -3.861082, 1, 1, 1, 1, 1,
-0.7418641, -1.716897, -2.93304, 1, 1, 1, 1, 1,
-0.7389489, 1.661662, -0.3276708, 1, 1, 1, 1, 1,
-0.7368206, 0.03578193, -1.089252, 1, 1, 1, 1, 1,
-0.7367522, -0.1667869, -2.114469, 0, 0, 1, 1, 1,
-0.7358653, 1.19653, 1.502218, 1, 0, 0, 1, 1,
-0.7307822, -0.1742123, -1.712161, 1, 0, 0, 1, 1,
-0.7303155, 0.4833094, 0.8473184, 1, 0, 0, 1, 1,
-0.7298992, 1.064949, -0.8231776, 1, 0, 0, 1, 1,
-0.7273757, 1.38094, 0.1526483, 1, 0, 0, 1, 1,
-0.7214596, -0.3565565, -3.992282, 0, 0, 0, 1, 1,
-0.712807, -0.5050057, -2.198887, 0, 0, 0, 1, 1,
-0.712509, -0.2561287, -1.928799, 0, 0, 0, 1, 1,
-0.7100347, 1.65771, -0.03147273, 0, 0, 0, 1, 1,
-0.7017763, 1.000316, 0.7431386, 0, 0, 0, 1, 1,
-0.7003683, -1.459779, -3.933332, 0, 0, 0, 1, 1,
-0.6924908, -0.4934816, -0.6832821, 0, 0, 0, 1, 1,
-0.6912503, 0.4108576, -0.6691774, 1, 1, 1, 1, 1,
-0.6901557, -0.6213248, -1.894201, 1, 1, 1, 1, 1,
-0.688341, 0.7961698, -0.6263833, 1, 1, 1, 1, 1,
-0.68827, 0.3318551, -0.1762176, 1, 1, 1, 1, 1,
-0.6875705, -0.1471718, -2.456751, 1, 1, 1, 1, 1,
-0.6836992, -0.1704813, -1.878756, 1, 1, 1, 1, 1,
-0.6731358, -0.7504409, -4.442213, 1, 1, 1, 1, 1,
-0.6718511, -0.01331356, -0.4635948, 1, 1, 1, 1, 1,
-0.668138, -1.45936, -3.298578, 1, 1, 1, 1, 1,
-0.6639299, -0.01849401, -1.11428, 1, 1, 1, 1, 1,
-0.6628487, -1.157091, -3.309355, 1, 1, 1, 1, 1,
-0.6602737, 0.7036608, -1.450773, 1, 1, 1, 1, 1,
-0.6574963, -0.4727735, -1.865822, 1, 1, 1, 1, 1,
-0.6563507, 0.7159325, -1.429477, 1, 1, 1, 1, 1,
-0.653861, 1.194582, -1.148303, 1, 1, 1, 1, 1,
-0.6534334, 0.5173028, -3.286729, 0, 0, 1, 1, 1,
-0.6496272, -1.955465, -3.598791, 1, 0, 0, 1, 1,
-0.6461165, 0.9390882, -0.3052356, 1, 0, 0, 1, 1,
-0.6457261, 0.505908, -1.076467, 1, 0, 0, 1, 1,
-0.6417249, 2.50136, -1.254031, 1, 0, 0, 1, 1,
-0.6372061, -0.4573888, -2.838967, 1, 0, 0, 1, 1,
-0.6370035, -1.057282, -3.483535, 0, 0, 0, 1, 1,
-0.6362526, -1.142572, -2.88927, 0, 0, 0, 1, 1,
-0.6358556, -1.58276, -2.315815, 0, 0, 0, 1, 1,
-0.6293468, 0.884968, -2.020703, 0, 0, 0, 1, 1,
-0.6274542, 0.8949742, -0.9115135, 0, 0, 0, 1, 1,
-0.6259117, 0.9330369, 0.7031278, 0, 0, 0, 1, 1,
-0.6152251, -0.6345867, -2.838328, 0, 0, 0, 1, 1,
-0.6150579, -0.2423932, -1.76149, 1, 1, 1, 1, 1,
-0.6144479, 1.533539, 0.8854574, 1, 1, 1, 1, 1,
-0.6136371, -0.09077426, -2.213195, 1, 1, 1, 1, 1,
-0.6086219, -0.1925175, -1.476497, 1, 1, 1, 1, 1,
-0.6084149, 1.428651, -1.546432, 1, 1, 1, 1, 1,
-0.6064494, -0.110123, 0.8980693, 1, 1, 1, 1, 1,
-0.6063882, -0.4337785, -3.53105, 1, 1, 1, 1, 1,
-0.6057697, 0.01024696, -0.06869688, 1, 1, 1, 1, 1,
-0.6001754, -0.02588682, -0.05351929, 1, 1, 1, 1, 1,
-0.5881341, -1.1764, -4.911609, 1, 1, 1, 1, 1,
-0.5801633, -1.725386, -1.908344, 1, 1, 1, 1, 1,
-0.5759997, 0.1164816, -1.493076, 1, 1, 1, 1, 1,
-0.5714065, -0.09480774, -0.9341601, 1, 1, 1, 1, 1,
-0.5694847, 1.024246, -0.9827067, 1, 1, 1, 1, 1,
-0.5648437, -0.9480088, -3.290911, 1, 1, 1, 1, 1,
-0.5624635, 0.2594408, -0.4314224, 0, 0, 1, 1, 1,
-0.5623411, -1.386167, -0.9201813, 1, 0, 0, 1, 1,
-0.5620433, -0.7719802, -3.81362, 1, 0, 0, 1, 1,
-0.5592016, -2.295692, -3.255603, 1, 0, 0, 1, 1,
-0.5589089, 1.549275, 0.138518, 1, 0, 0, 1, 1,
-0.5586279, -0.1543991, -1.745468, 1, 0, 0, 1, 1,
-0.5579765, 0.02984115, -4.002916, 0, 0, 0, 1, 1,
-0.5522828, 0.7560279, -0.1517065, 0, 0, 0, 1, 1,
-0.551953, 0.02461725, 0.2267919, 0, 0, 0, 1, 1,
-0.5511471, 1.910764, 1.247739, 0, 0, 0, 1, 1,
-0.5472249, -0.2033624, -0.7030966, 0, 0, 0, 1, 1,
-0.5445724, 1.265881, -0.7463679, 0, 0, 0, 1, 1,
-0.542582, 0.6224627, -1.534768, 0, 0, 0, 1, 1,
-0.5362208, 0.4971839, -1.280595, 1, 1, 1, 1, 1,
-0.5343866, -1.246943, -3.194595, 1, 1, 1, 1, 1,
-0.5334686, -0.5641552, -1.80992, 1, 1, 1, 1, 1,
-0.530341, -0.3327434, -2.814845, 1, 1, 1, 1, 1,
-0.5283188, -1.817817, -2.953277, 1, 1, 1, 1, 1,
-0.5281889, 0.3756597, -2.522603, 1, 1, 1, 1, 1,
-0.5243405, 1.04343, -0.285862, 1, 1, 1, 1, 1,
-0.5225561, -1.858733, -2.983111, 1, 1, 1, 1, 1,
-0.5220312, 0.6113436, -0.6440569, 1, 1, 1, 1, 1,
-0.5209609, -0.7632718, -2.401712, 1, 1, 1, 1, 1,
-0.520724, 0.0900749, -0.6104082, 1, 1, 1, 1, 1,
-0.5188508, -1.522926, -2.242289, 1, 1, 1, 1, 1,
-0.5164381, 1.104089, 0.3753894, 1, 1, 1, 1, 1,
-0.5151134, -0.5352034, -2.7054, 1, 1, 1, 1, 1,
-0.5082192, -0.4747455, -3.579937, 1, 1, 1, 1, 1,
-0.508076, -0.7728834, -0.7650117, 0, 0, 1, 1, 1,
-0.5072621, -0.329292, 0.5623872, 1, 0, 0, 1, 1,
-0.5064443, 0.04712106, -0.8361713, 1, 0, 0, 1, 1,
-0.5017244, -0.2244066, -1.162003, 1, 0, 0, 1, 1,
-0.4940664, -1.155316, -1.402228, 1, 0, 0, 1, 1,
-0.4939341, 0.5405825, -1.147423, 1, 0, 0, 1, 1,
-0.4935695, 1.835093, 1.145159, 0, 0, 0, 1, 1,
-0.4905188, 0.09707388, -0.7941597, 0, 0, 0, 1, 1,
-0.4878669, -0.1378133, -1.494932, 0, 0, 0, 1, 1,
-0.485116, -1.580084, -2.395503, 0, 0, 0, 1, 1,
-0.4833275, -1.057074, -1.456218, 0, 0, 0, 1, 1,
-0.4811904, -1.05253, -2.224289, 0, 0, 0, 1, 1,
-0.4765318, -0.7213444, -2.713255, 0, 0, 0, 1, 1,
-0.473095, 0.6407117, 0.224198, 1, 1, 1, 1, 1,
-0.4697637, -0.403212, -2.303217, 1, 1, 1, 1, 1,
-0.4697547, 0.06464604, -0.5125763, 1, 1, 1, 1, 1,
-0.4697079, 0.2293417, -1.308581, 1, 1, 1, 1, 1,
-0.4695372, -0.7097675, -2.368816, 1, 1, 1, 1, 1,
-0.4666183, 0.2152245, -1.60277, 1, 1, 1, 1, 1,
-0.4607672, -0.371317, -3.698987, 1, 1, 1, 1, 1,
-0.453428, -1.35349, -2.279811, 1, 1, 1, 1, 1,
-0.4524437, 0.08513982, -1.704016, 1, 1, 1, 1, 1,
-0.4400734, 0.945172, -0.6542374, 1, 1, 1, 1, 1,
-0.4383902, -0.1671442, -1.629698, 1, 1, 1, 1, 1,
-0.438142, -0.6456971, -3.663323, 1, 1, 1, 1, 1,
-0.4328035, -0.0143021, -2.125687, 1, 1, 1, 1, 1,
-0.4261149, 0.4657441, -1.123738, 1, 1, 1, 1, 1,
-0.4244442, 0.5713682, 0.08483246, 1, 1, 1, 1, 1,
-0.4172024, -0.6157588, -3.502236, 0, 0, 1, 1, 1,
-0.4157244, 0.92316, 0.3730316, 1, 0, 0, 1, 1,
-0.4152859, -0.1374352, -2.960308, 1, 0, 0, 1, 1,
-0.4078704, 0.3395444, -1.673915, 1, 0, 0, 1, 1,
-0.4070176, 0.04031216, -2.819031, 1, 0, 0, 1, 1,
-0.4043126, -0.5435855, -0.6579815, 1, 0, 0, 1, 1,
-0.4007363, 1.313591, -0.6486987, 0, 0, 0, 1, 1,
-0.4000293, -0.3717758, -1.833102, 0, 0, 0, 1, 1,
-0.3941803, 0.8533863, -1.708794, 0, 0, 0, 1, 1,
-0.3909932, 1.791841, 0.7788589, 0, 0, 0, 1, 1,
-0.3850075, 0.04244808, -0.2196407, 0, 0, 0, 1, 1,
-0.3837734, 0.7560281, -1.002924, 0, 0, 0, 1, 1,
-0.3824637, 0.995976, -1.519203, 0, 0, 0, 1, 1,
-0.3823198, 1.657593, 0.3719752, 1, 1, 1, 1, 1,
-0.3817977, 1.728514, -0.2863629, 1, 1, 1, 1, 1,
-0.3811617, -0.6637074, -2.497321, 1, 1, 1, 1, 1,
-0.3778332, 0.945574, -0.6199576, 1, 1, 1, 1, 1,
-0.3767536, -2.641158, -3.498452, 1, 1, 1, 1, 1,
-0.3729218, 0.6873929, -0.3456978, 1, 1, 1, 1, 1,
-0.3710014, -0.6623832, -3.217448, 1, 1, 1, 1, 1,
-0.367999, -0.2728277, -2.281419, 1, 1, 1, 1, 1,
-0.3640375, 2.717862, -1.189343, 1, 1, 1, 1, 1,
-0.3611102, 0.4516124, -0.6964083, 1, 1, 1, 1, 1,
-0.3609889, -0.5501698, -3.022958, 1, 1, 1, 1, 1,
-0.3595587, -0.5962303, -2.925018, 1, 1, 1, 1, 1,
-0.3558638, -0.706405, -2.711605, 1, 1, 1, 1, 1,
-0.3515725, 1.973644, -1.117063, 1, 1, 1, 1, 1,
-0.3510104, 1.493527, 0.7371828, 1, 1, 1, 1, 1,
-0.3490135, -0.6899431, -1.627323, 0, 0, 1, 1, 1,
-0.3431717, -0.2199583, -2.183416, 1, 0, 0, 1, 1,
-0.3410854, 0.2736984, 0.1211603, 1, 0, 0, 1, 1,
-0.3386971, 0.5001125, 0.6404213, 1, 0, 0, 1, 1,
-0.3365278, 2.121582, -1.391921, 1, 0, 0, 1, 1,
-0.3323067, 0.08867729, -1.516904, 1, 0, 0, 1, 1,
-0.3320729, -0.7662791, -3.352281, 0, 0, 0, 1, 1,
-0.3302085, 0.267919, -1.464674, 0, 0, 0, 1, 1,
-0.3271947, 0.0166759, -0.3192338, 0, 0, 0, 1, 1,
-0.323019, -1.730494, -2.808314, 0, 0, 0, 1, 1,
-0.3198472, -1.428185, -4.004752, 0, 0, 0, 1, 1,
-0.3174615, -1.25279, -3.180553, 0, 0, 0, 1, 1,
-0.3106879, 0.03596362, -1.812179, 0, 0, 0, 1, 1,
-0.3096797, -1.02731, -2.873394, 1, 1, 1, 1, 1,
-0.3084104, 3.318333, -0.8889788, 1, 1, 1, 1, 1,
-0.3049705, 0.690494, -0.2258381, 1, 1, 1, 1, 1,
-0.3049277, -1.074983, -2.479017, 1, 1, 1, 1, 1,
-0.3010778, -0.6628877, -2.09889, 1, 1, 1, 1, 1,
-0.3001485, 1.462603, 0.8689662, 1, 1, 1, 1, 1,
-0.2999652, -1.016461, -4.339091, 1, 1, 1, 1, 1,
-0.2992093, 0.1449888, -1.965071, 1, 1, 1, 1, 1,
-0.2969392, -0.7239795, -3.0732, 1, 1, 1, 1, 1,
-0.2959183, -1.049405, -1.435997, 1, 1, 1, 1, 1,
-0.2946686, -1.159359, -4.334713, 1, 1, 1, 1, 1,
-0.2913311, -1.799865, -1.510479, 1, 1, 1, 1, 1,
-0.2857546, -0.4473904, -1.821115, 1, 1, 1, 1, 1,
-0.2836965, 0.08081739, 0.1206909, 1, 1, 1, 1, 1,
-0.2811453, 0.6753032, -1.453726, 1, 1, 1, 1, 1,
-0.2809049, -0.8141367, -4.082062, 0, 0, 1, 1, 1,
-0.2800382, 1.241623, 0.432465, 1, 0, 0, 1, 1,
-0.2777707, -0.79103, -3.691546, 1, 0, 0, 1, 1,
-0.2761787, 0.3478594, -0.4346958, 1, 0, 0, 1, 1,
-0.2746302, 1.306335, 1.091182, 1, 0, 0, 1, 1,
-0.273829, 0.6816555, -0.2648171, 1, 0, 0, 1, 1,
-0.2717214, -2.127413, -3.770563, 0, 0, 0, 1, 1,
-0.271302, 0.2929817, -0.02152794, 0, 0, 0, 1, 1,
-0.2672559, 0.6061911, -1.342728, 0, 0, 0, 1, 1,
-0.2641613, -0.4873372, -2.138759, 0, 0, 0, 1, 1,
-0.2632152, 2.036284, 0.1392042, 0, 0, 0, 1, 1,
-0.2615052, -1.006622, -3.436927, 0, 0, 0, 1, 1,
-0.2613924, 2.279258, -2.455028, 0, 0, 0, 1, 1,
-0.256791, -0.114357, -1.734245, 1, 1, 1, 1, 1,
-0.2565838, -1.46923, -3.241872, 1, 1, 1, 1, 1,
-0.2562478, -1.436177, -3.243455, 1, 1, 1, 1, 1,
-0.2556521, -0.5808781, -2.080141, 1, 1, 1, 1, 1,
-0.2550065, -0.05866791, -1.343193, 1, 1, 1, 1, 1,
-0.2544068, 0.5345928, -1.78756, 1, 1, 1, 1, 1,
-0.2543974, -1.443661, -1.965744, 1, 1, 1, 1, 1,
-0.2530129, -0.2072886, -0.718132, 1, 1, 1, 1, 1,
-0.2511496, -0.97461, -1.927569, 1, 1, 1, 1, 1,
-0.2490496, 0.1722674, -0.368767, 1, 1, 1, 1, 1,
-0.2464566, -1.284823, -2.210154, 1, 1, 1, 1, 1,
-0.2455754, -0.418765, -1.344891, 1, 1, 1, 1, 1,
-0.2390707, -1.302046, -4.259512, 1, 1, 1, 1, 1,
-0.2372383, 0.8402919, -0.8705819, 1, 1, 1, 1, 1,
-0.2335749, 0.2511157, -2.416208, 1, 1, 1, 1, 1,
-0.2315701, -1.065037, -2.273548, 0, 0, 1, 1, 1,
-0.2287926, -0.5940055, -2.085012, 1, 0, 0, 1, 1,
-0.226901, -0.2995964, -1.681674, 1, 0, 0, 1, 1,
-0.224301, 0.4565092, -0.7706754, 1, 0, 0, 1, 1,
-0.2226789, -0.2902055, -1.136322, 1, 0, 0, 1, 1,
-0.2224209, 0.374961, 0.7758047, 1, 0, 0, 1, 1,
-0.2208477, -0.8991355, -4.226096, 0, 0, 0, 1, 1,
-0.2206499, 0.6187447, 0.005418686, 0, 0, 0, 1, 1,
-0.2188766, -0.3517687, -1.517869, 0, 0, 0, 1, 1,
-0.2157041, 2.025878, -2.596895, 0, 0, 0, 1, 1,
-0.2070873, 0.042728, -1.388583, 0, 0, 0, 1, 1,
-0.2014854, -1.792658, -3.714764, 0, 0, 0, 1, 1,
-0.1987105, -1.338642, -2.86811, 0, 0, 0, 1, 1,
-0.1978156, 0.6989335, -0.5505672, 1, 1, 1, 1, 1,
-0.1930154, -0.5983759, -2.336579, 1, 1, 1, 1, 1,
-0.1913479, -0.2247839, -2.241411, 1, 1, 1, 1, 1,
-0.1756252, -0.7137203, -2.511748, 1, 1, 1, 1, 1,
-0.1739735, -0.6137066, -3.371947, 1, 1, 1, 1, 1,
-0.1703648, -0.8410724, -3.179675, 1, 1, 1, 1, 1,
-0.1691743, 0.1416123, 0.5690261, 1, 1, 1, 1, 1,
-0.1669313, 0.2174112, -0.1521963, 1, 1, 1, 1, 1,
-0.1625018, -0.8036999, -2.904102, 1, 1, 1, 1, 1,
-0.1597776, 0.5465233, -0.9198852, 1, 1, 1, 1, 1,
-0.1596075, 1.082112, -0.1269759, 1, 1, 1, 1, 1,
-0.1566916, 2.143387, 0.3887388, 1, 1, 1, 1, 1,
-0.1542818, -0.501093, -2.170964, 1, 1, 1, 1, 1,
-0.1538448, 0.4842612, -1.449625, 1, 1, 1, 1, 1,
-0.1480284, 0.3242515, 0.4496568, 1, 1, 1, 1, 1,
-0.1411164, 0.7483903, 1.152729, 0, 0, 1, 1, 1,
-0.1406048, 0.5061422, 0.3335478, 1, 0, 0, 1, 1,
-0.1377687, 0.2962228, -1.120214, 1, 0, 0, 1, 1,
-0.1372427, 0.3873982, -0.09033692, 1, 0, 0, 1, 1,
-0.1365209, -0.1220578, -2.661362, 1, 0, 0, 1, 1,
-0.1280554, 0.4640327, -1.902823, 1, 0, 0, 1, 1,
-0.1276661, 0.4689566, -0.1470278, 0, 0, 0, 1, 1,
-0.1274663, -0.1323106, -2.746269, 0, 0, 0, 1, 1,
-0.1207147, -0.2399358, -2.408019, 0, 0, 0, 1, 1,
-0.1163455, -1.465991, -1.873233, 0, 0, 0, 1, 1,
-0.1153513, -0.1364383, -2.427566, 0, 0, 0, 1, 1,
-0.1090116, 1.143822, -0.08845967, 0, 0, 0, 1, 1,
-0.1086262, -0.3663667, -2.454463, 0, 0, 0, 1, 1,
-0.1041231, 1.003436, -0.7177365, 1, 1, 1, 1, 1,
-0.1037186, -0.0773759, -2.434431, 1, 1, 1, 1, 1,
-0.1021701, 0.8854191, -0.3716872, 1, 1, 1, 1, 1,
-0.1020305, 1.124095, -0.2191885, 1, 1, 1, 1, 1,
-0.09781957, -0.2715933, -3.831574, 1, 1, 1, 1, 1,
-0.09142985, 1.302717, -1.438143, 1, 1, 1, 1, 1,
-0.08947267, -0.2088418, -2.706954, 1, 1, 1, 1, 1,
-0.08813923, 0.4858896, 0.5528173, 1, 1, 1, 1, 1,
-0.0865284, -1.612082, -3.292357, 1, 1, 1, 1, 1,
-0.08597634, 1.049595, -0.5024951, 1, 1, 1, 1, 1,
-0.07771656, 0.619095, -0.9079176, 1, 1, 1, 1, 1,
-0.07662529, -0.7854205, -2.22034, 1, 1, 1, 1, 1,
-0.07598703, -1.594913, -4.221402, 1, 1, 1, 1, 1,
-0.07486847, -0.4021799, -3.287303, 1, 1, 1, 1, 1,
-0.0735124, -0.1042805, -2.166772, 1, 1, 1, 1, 1,
-0.0716901, 0.4248612, 0.1661721, 0, 0, 1, 1, 1,
-0.0705572, -0.1806713, -1.804972, 1, 0, 0, 1, 1,
-0.06769258, 0.07791822, -0.4364592, 1, 0, 0, 1, 1,
-0.06619673, -0.009791171, -1.840911, 1, 0, 0, 1, 1,
-0.06522723, 0.05824202, -0.006615465, 1, 0, 0, 1, 1,
-0.06322418, 2.059903, 0.3615807, 1, 0, 0, 1, 1,
-0.06069895, -0.5988937, -3.874417, 0, 0, 0, 1, 1,
-0.05830764, -0.05556536, -1.352224, 0, 0, 0, 1, 1,
-0.05779508, -0.7447678, -5.176768, 0, 0, 0, 1, 1,
-0.05760803, 0.9890277, -0.8026696, 0, 0, 0, 1, 1,
-0.0518814, -0.516048, -3.581728, 0, 0, 0, 1, 1,
-0.04109942, -1.158813, -2.870945, 0, 0, 0, 1, 1,
-0.03945426, 0.599022, 1.357658, 0, 0, 0, 1, 1,
-0.03721894, -1.041541, -1.306752, 1, 1, 1, 1, 1,
-0.03676206, 1.813067, -1.754296, 1, 1, 1, 1, 1,
-0.03671451, -0.7152774, -3.262208, 1, 1, 1, 1, 1,
-0.03669239, 1.470123, 0.01369972, 1, 1, 1, 1, 1,
-0.03374875, -1.779673, -4.779954, 1, 1, 1, 1, 1,
-0.02845688, 0.1181508, 1.895467, 1, 1, 1, 1, 1,
-0.02842533, -0.3152186, -3.069605, 1, 1, 1, 1, 1,
-0.02137967, -0.5862867, -3.434455, 1, 1, 1, 1, 1,
-0.02073404, 0.6951715, 0.02603232, 1, 1, 1, 1, 1,
-0.01707471, 1.701581, 0.699747, 1, 1, 1, 1, 1,
-0.01341257, 0.4525086, 0.6766769, 1, 1, 1, 1, 1,
-0.005224138, -1.386872, -1.433029, 1, 1, 1, 1, 1,
-0.0003400247, 1.83956, 1.226062, 1, 1, 1, 1, 1,
0.00306825, -0.4685529, 0.5889706, 1, 1, 1, 1, 1,
0.004922264, -0.1805514, 3.382747, 1, 1, 1, 1, 1,
0.009570345, 0.5265654, 0.223099, 0, 0, 1, 1, 1,
0.01161258, 0.1841729, 1.352682, 1, 0, 0, 1, 1,
0.01434284, 1.091339, -1.33156, 1, 0, 0, 1, 1,
0.01467014, -0.003474244, 2.507389, 1, 0, 0, 1, 1,
0.01699651, -0.8777592, 3.823214, 1, 0, 0, 1, 1,
0.0182526, 0.5611723, -0.564041, 1, 0, 0, 1, 1,
0.01845533, 0.2915411, 0.07968016, 0, 0, 0, 1, 1,
0.02061279, 0.9263657, -0.6380768, 0, 0, 0, 1, 1,
0.0209384, 1.115208, -0.1741459, 0, 0, 0, 1, 1,
0.02227186, 0.0124408, 1.654557, 0, 0, 0, 1, 1,
0.02345574, 1.749506, -1.638118, 0, 0, 0, 1, 1,
0.02492231, -0.796265, 3.013909, 0, 0, 0, 1, 1,
0.0265909, 0.668542, -0.6141402, 0, 0, 0, 1, 1,
0.02667782, 0.8579835, 0.9614226, 1, 1, 1, 1, 1,
0.02913106, -0.3140943, 3.298535, 1, 1, 1, 1, 1,
0.03045266, 0.3173156, -1.30349, 1, 1, 1, 1, 1,
0.03353259, -0.7285204, 3.047507, 1, 1, 1, 1, 1,
0.03517367, -1.575156, 5.125611, 1, 1, 1, 1, 1,
0.03569751, -1.170082, 2.809628, 1, 1, 1, 1, 1,
0.0386718, -1.062218, 2.550036, 1, 1, 1, 1, 1,
0.03964574, 0.3992749, -0.005581748, 1, 1, 1, 1, 1,
0.04216829, -0.4776766, 2.923986, 1, 1, 1, 1, 1,
0.05354576, 0.1590093, 0.111403, 1, 1, 1, 1, 1,
0.05552252, -0.2366299, 3.669871, 1, 1, 1, 1, 1,
0.06030844, 0.3342377, 0.3600089, 1, 1, 1, 1, 1,
0.06031094, -0.8039848, 1.905272, 1, 1, 1, 1, 1,
0.06537982, -1.569646, 3.250671, 1, 1, 1, 1, 1,
0.07815954, 0.1080796, 0.7188507, 1, 1, 1, 1, 1,
0.08108171, 2.553893, 0.5465664, 0, 0, 1, 1, 1,
0.08214191, 2.177398, -1.290615, 1, 0, 0, 1, 1,
0.08315122, 1.432874, -3.084108, 1, 0, 0, 1, 1,
0.08911584, -0.8731789, 1.743512, 1, 0, 0, 1, 1,
0.09047096, 0.5509741, 0.5259072, 1, 0, 0, 1, 1,
0.09199309, 0.5745986, -0.3976377, 1, 0, 0, 1, 1,
0.09687693, 0.6616514, -0.07840071, 0, 0, 0, 1, 1,
0.09875082, -0.7590064, 3.168305, 0, 0, 0, 1, 1,
0.09926993, -1.452713, 4.654972, 0, 0, 0, 1, 1,
0.102768, -1.3909, 3.360207, 0, 0, 0, 1, 1,
0.1075056, 0.2587554, 1.787232, 0, 0, 0, 1, 1,
0.1077164, 0.2660023, 1.985782, 0, 0, 0, 1, 1,
0.112876, 1.060452, 0.0204521, 0, 0, 0, 1, 1,
0.1143404, 1.041048, -1.236188, 1, 1, 1, 1, 1,
0.1181803, -0.1287695, 2.773002, 1, 1, 1, 1, 1,
0.120562, -0.8490544, 3.580343, 1, 1, 1, 1, 1,
0.1218127, 0.629648, 0.51367, 1, 1, 1, 1, 1,
0.1224019, 1.203022, 0.2802156, 1, 1, 1, 1, 1,
0.1233428, -1.955138, 2.670344, 1, 1, 1, 1, 1,
0.1242651, -1.634512, 2.680846, 1, 1, 1, 1, 1,
0.1243106, -0.06687272, 2.385994, 1, 1, 1, 1, 1,
0.1260781, 0.302904, -0.5261447, 1, 1, 1, 1, 1,
0.1263051, 0.903051, -0.01282728, 1, 1, 1, 1, 1,
0.1273128, 0.9749712, 0.3832258, 1, 1, 1, 1, 1,
0.1314923, -0.001020807, -0.4496604, 1, 1, 1, 1, 1,
0.1315288, 0.1842914, 0.02355397, 1, 1, 1, 1, 1,
0.1349092, 0.2825378, 1.551501, 1, 1, 1, 1, 1,
0.1380718, -0.6449862, 2.998741, 1, 1, 1, 1, 1,
0.1382075, 0.6174174, 0.008954348, 0, 0, 1, 1, 1,
0.1395205, 0.3656402, -0.1232711, 1, 0, 0, 1, 1,
0.140819, -0.875331, 3.767333, 1, 0, 0, 1, 1,
0.1457168, 0.02525747, 0.2620534, 1, 0, 0, 1, 1,
0.148496, 0.3411753, -0.9974963, 1, 0, 0, 1, 1,
0.1486688, 1.600532, 0.9768445, 1, 0, 0, 1, 1,
0.1488859, -0.7291732, 2.7258, 0, 0, 0, 1, 1,
0.1498847, 0.4181952, 1.71176, 0, 0, 0, 1, 1,
0.1499849, -1.466237, 1.519638, 0, 0, 0, 1, 1,
0.1513939, 1.20106, 0.3442573, 0, 0, 0, 1, 1,
0.1516786, -0.0972124, 0.8650064, 0, 0, 0, 1, 1,
0.1526332, 1.217554, 1.130724, 0, 0, 0, 1, 1,
0.1527103, -0.5993755, 2.928688, 0, 0, 0, 1, 1,
0.1547859, 0.3457437, 1.417722, 1, 1, 1, 1, 1,
0.1594467, -0.7539819, 3.321359, 1, 1, 1, 1, 1,
0.1598453, -0.09325243, 1.1196, 1, 1, 1, 1, 1,
0.1601873, -1.256464, 3.27585, 1, 1, 1, 1, 1,
0.1603553, -0.2328901, 2.405683, 1, 1, 1, 1, 1,
0.1653463, -1.019548, 4.79285, 1, 1, 1, 1, 1,
0.1686629, -2.388118, 3.333691, 1, 1, 1, 1, 1,
0.1694503, -0.02615394, 5.422029, 1, 1, 1, 1, 1,
0.172271, 1.035165, -0.4636316, 1, 1, 1, 1, 1,
0.1737204, -0.3880043, 3.883695, 1, 1, 1, 1, 1,
0.1754211, -0.7880127, 1.647788, 1, 1, 1, 1, 1,
0.1804315, 0.1083234, -0.3057332, 1, 1, 1, 1, 1,
0.1819441, -0.1520219, 2.872061, 1, 1, 1, 1, 1,
0.1822188, 0.3729265, -0.09016997, 1, 1, 1, 1, 1,
0.1865976, 0.8339228, -1.347643, 1, 1, 1, 1, 1,
0.1909088, 0.3612711, -0.09584839, 0, 0, 1, 1, 1,
0.1940225, -0.9414027, 2.093012, 1, 0, 0, 1, 1,
0.1957729, 0.1276291, 0.6909835, 1, 0, 0, 1, 1,
0.1969153, -0.3899203, 2.252504, 1, 0, 0, 1, 1,
0.2033312, -0.0132742, 2.473039, 1, 0, 0, 1, 1,
0.2079398, -0.1989623, 2.351916, 1, 0, 0, 1, 1,
0.2083459, 0.398609, 0.8857895, 0, 0, 0, 1, 1,
0.2112527, 0.1925526, 0.9844176, 0, 0, 0, 1, 1,
0.213168, 0.3038587, 2.1891, 0, 0, 0, 1, 1,
0.215191, 2.251322, -0.3665273, 0, 0, 0, 1, 1,
0.217638, -0.6843619, 3.349314, 0, 0, 0, 1, 1,
0.2304881, 0.9829032, 1.524954, 0, 0, 0, 1, 1,
0.2316429, -0.5111478, 1.586316, 0, 0, 0, 1, 1,
0.2316703, 2.767732, -0.6666584, 1, 1, 1, 1, 1,
0.2349291, -1.306742, 2.006216, 1, 1, 1, 1, 1,
0.2351902, 0.07630029, 1.583406, 1, 1, 1, 1, 1,
0.236828, 0.2744238, 1.655022, 1, 1, 1, 1, 1,
0.238435, -0.540808, 3.046747, 1, 1, 1, 1, 1,
0.2459465, -0.7873006, 2.647382, 1, 1, 1, 1, 1,
0.2488435, 0.1797041, 1.9345, 1, 1, 1, 1, 1,
0.2507553, 1.358153, -0.8574227, 1, 1, 1, 1, 1,
0.2509546, -0.3001008, 2.413294, 1, 1, 1, 1, 1,
0.2515084, -0.2541276, 3.104364, 1, 1, 1, 1, 1,
0.2603454, -0.2081013, 1.35308, 1, 1, 1, 1, 1,
0.2652821, 0.4504901, -0.9953433, 1, 1, 1, 1, 1,
0.2662801, 2.209685, -0.8657007, 1, 1, 1, 1, 1,
0.2714484, 0.1656166, 0.6978481, 1, 1, 1, 1, 1,
0.2733861, -0.6017863, 2.466897, 1, 1, 1, 1, 1,
0.2757437, -1.750088, 2.967822, 0, 0, 1, 1, 1,
0.2807826, 0.8957452, 0.2857384, 1, 0, 0, 1, 1,
0.2821599, 1.222339, -0.3600289, 1, 0, 0, 1, 1,
0.2835266, 0.7296503, 0.2250129, 1, 0, 0, 1, 1,
0.284257, 0.6282883, 0.7677711, 1, 0, 0, 1, 1,
0.2852002, 0.7627204, 0.6772653, 1, 0, 0, 1, 1,
0.2920512, 0.2353295, 0.8217265, 0, 0, 0, 1, 1,
0.2927736, -0.7176078, 2.935816, 0, 0, 0, 1, 1,
0.2937583, -0.1173255, 1.695533, 0, 0, 0, 1, 1,
0.2953563, 0.05813134, -0.5209568, 0, 0, 0, 1, 1,
0.295923, -0.3302591, 0.6529812, 0, 0, 0, 1, 1,
0.299679, 0.2885305, 0.9683524, 0, 0, 0, 1, 1,
0.3031271, -0.8407406, 2.454056, 0, 0, 0, 1, 1,
0.3044623, -0.1204269, 2.692696, 1, 1, 1, 1, 1,
0.3045499, 0.7128144, 1.43593, 1, 1, 1, 1, 1,
0.3099033, -1.900633, 2.680279, 1, 1, 1, 1, 1,
0.312848, -0.1347502, 2.124388, 1, 1, 1, 1, 1,
0.313626, 0.2978275, 0.9654566, 1, 1, 1, 1, 1,
0.3173488, 2.374633, 0.5838857, 1, 1, 1, 1, 1,
0.3221211, -0.2489787, 2.10943, 1, 1, 1, 1, 1,
0.3229882, 1.186802, -0.7674372, 1, 1, 1, 1, 1,
0.3236606, 1.28967, -0.2263697, 1, 1, 1, 1, 1,
0.3253278, 1.536733, 0.9187163, 1, 1, 1, 1, 1,
0.3263105, 1.752461, -1.731514, 1, 1, 1, 1, 1,
0.3286486, 1.41244, -0.2295313, 1, 1, 1, 1, 1,
0.3299814, 0.08855074, 0.901293, 1, 1, 1, 1, 1,
0.3300593, 1.007362, -2.477843, 1, 1, 1, 1, 1,
0.3308313, -0.1481159, 2.274402, 1, 1, 1, 1, 1,
0.3318461, 1.977074, 0.6116862, 0, 0, 1, 1, 1,
0.3327151, 0.8876218, 1.311655, 1, 0, 0, 1, 1,
0.3363976, -0.3717243, 3.912077, 1, 0, 0, 1, 1,
0.3380876, -0.2805528, 0.964378, 1, 0, 0, 1, 1,
0.3401341, 1.287404, 0.0523457, 1, 0, 0, 1, 1,
0.3404172, -0.7675332, 5.075764, 1, 0, 0, 1, 1,
0.3425341, 1.259135, 0.4773066, 0, 0, 0, 1, 1,
0.3425628, -1.168352, 3.56859, 0, 0, 0, 1, 1,
0.3505896, 0.2366598, 2.311341, 0, 0, 0, 1, 1,
0.3641241, 1.038793, 1.456465, 0, 0, 0, 1, 1,
0.3643847, -1.266847, 1.598268, 0, 0, 0, 1, 1,
0.3665203, 0.7978445, 0.59974, 0, 0, 0, 1, 1,
0.3697611, 0.2947131, 1.09932, 0, 0, 0, 1, 1,
0.3707387, -1.855789, 1.670293, 1, 1, 1, 1, 1,
0.3725544, 0.6279488, -1.089564, 1, 1, 1, 1, 1,
0.3748237, 0.6771563, -0.1005886, 1, 1, 1, 1, 1,
0.3750794, -0.02702085, 1.113065, 1, 1, 1, 1, 1,
0.3806569, -0.5114872, 2.600175, 1, 1, 1, 1, 1,
0.3827682, 0.744401, 1.356525, 1, 1, 1, 1, 1,
0.3836597, -0.7168755, 3.288755, 1, 1, 1, 1, 1,
0.38662, -0.5078248, 2.919904, 1, 1, 1, 1, 1,
0.3890849, -1.091349, 1.809055, 1, 1, 1, 1, 1,
0.3961155, -0.4693691, 0.9864474, 1, 1, 1, 1, 1,
0.3964764, -0.5722733, 1.050555, 1, 1, 1, 1, 1,
0.4110863, 1.078237, 0.8435347, 1, 1, 1, 1, 1,
0.4116815, 0.8312218, -2.265414, 1, 1, 1, 1, 1,
0.4135862, 0.5267105, 0.2394184, 1, 1, 1, 1, 1,
0.4172574, 0.8276553, 0.574507, 1, 1, 1, 1, 1,
0.4182591, 0.324703, -0.8016365, 0, 0, 1, 1, 1,
0.4202147, -0.285057, 1.825881, 1, 0, 0, 1, 1,
0.436335, -0.4761172, 2.575959, 1, 0, 0, 1, 1,
0.4436401, -0.5815027, 2.479122, 1, 0, 0, 1, 1,
0.4441624, 0.04374415, 1.782038, 1, 0, 0, 1, 1,
0.4445378, -0.009818224, 1.639878, 1, 0, 0, 1, 1,
0.4504409, 0.6435833, 0.09799138, 0, 0, 0, 1, 1,
0.4510764, 1.54591, -0.8729332, 0, 0, 0, 1, 1,
0.4530891, -0.209251, 2.496974, 0, 0, 0, 1, 1,
0.455106, -0.2187055, 2.197281, 0, 0, 0, 1, 1,
0.4664589, -0.1499672, 2.181668, 0, 0, 0, 1, 1,
0.4672855, -0.949956, 3.655038, 0, 0, 0, 1, 1,
0.4697705, 1.452754, 0.4178184, 0, 0, 0, 1, 1,
0.4764746, 0.8476271, 1.021462, 1, 1, 1, 1, 1,
0.4823626, -0.4486579, 1.355963, 1, 1, 1, 1, 1,
0.4826679, -2.736262, 2.211237, 1, 1, 1, 1, 1,
0.4830842, -1.169192, 3.301404, 1, 1, 1, 1, 1,
0.4840864, 0.7141192, 1.108468, 1, 1, 1, 1, 1,
0.4876943, 1.000021, -0.07308164, 1, 1, 1, 1, 1,
0.4902335, 0.2674123, 1.647615, 1, 1, 1, 1, 1,
0.4934396, -0.9315842, 1.223595, 1, 1, 1, 1, 1,
0.4962037, 0.2000593, 0.4033235, 1, 1, 1, 1, 1,
0.5010203, 0.5739785, -0.6586965, 1, 1, 1, 1, 1,
0.5019095, -1.485294, 3.789184, 1, 1, 1, 1, 1,
0.5044845, -1.338109, 2.899877, 1, 1, 1, 1, 1,
0.5047461, 2.280361, 0.6530445, 1, 1, 1, 1, 1,
0.5105416, 1.417207, 2.342156, 1, 1, 1, 1, 1,
0.5180233, 0.6541834, -1.133266, 1, 1, 1, 1, 1,
0.5210158, -0.8087584, 2.876144, 0, 0, 1, 1, 1,
0.5216817, 1.230332, 1.63513, 1, 0, 0, 1, 1,
0.5218084, -1.620751, 3.328983, 1, 0, 0, 1, 1,
0.5219901, -1.828661, 1.873046, 1, 0, 0, 1, 1,
0.5243767, 1.589969, 0.9350048, 1, 0, 0, 1, 1,
0.5327531, 3.259263, -0.4156467, 1, 0, 0, 1, 1,
0.5345925, 0.3061926, 2.149234, 0, 0, 0, 1, 1,
0.538058, 1.555853, -1.631617, 0, 0, 0, 1, 1,
0.5389728, -1.144064, 2.852465, 0, 0, 0, 1, 1,
0.5403744, -0.191279, 3.166453, 0, 0, 0, 1, 1,
0.5426967, -0.5375082, 2.544935, 0, 0, 0, 1, 1,
0.5514183, 0.6626775, 0.2570363, 0, 0, 0, 1, 1,
0.5531408, -0.9652252, 2.529793, 0, 0, 0, 1, 1,
0.5570052, -0.5729418, -0.1355867, 1, 1, 1, 1, 1,
0.56124, -0.7495716, 3.228515, 1, 1, 1, 1, 1,
0.5631593, -1.520381, 0.6733494, 1, 1, 1, 1, 1,
0.5632094, 0.9445458, -1.384261, 1, 1, 1, 1, 1,
0.5674317, 0.6864447, 1.119043, 1, 1, 1, 1, 1,
0.5706701, -0.1139336, 1.052164, 1, 1, 1, 1, 1,
0.5709676, -0.5553125, 4.214841, 1, 1, 1, 1, 1,
0.5711224, -0.3469187, 2.782521, 1, 1, 1, 1, 1,
0.5721078, -0.1713613, 1.385446, 1, 1, 1, 1, 1,
0.5732233, -1.518618, 5.215747, 1, 1, 1, 1, 1,
0.5733995, 0.104958, 2.072798, 1, 1, 1, 1, 1,
0.5736376, -0.4555036, 1.88583, 1, 1, 1, 1, 1,
0.5802658, -0.5251008, 1.222438, 1, 1, 1, 1, 1,
0.5812178, -0.7055901, 1.104235, 1, 1, 1, 1, 1,
0.5819519, -0.4902181, -0.4007376, 1, 1, 1, 1, 1,
0.5838705, -0.5486054, 0.4245244, 0, 0, 1, 1, 1,
0.5853013, 0.7114073, 3.415245, 1, 0, 0, 1, 1,
0.5917208, -1.34417, 4.013344, 1, 0, 0, 1, 1,
0.5973438, 0.5115976, 1.794682, 1, 0, 0, 1, 1,
0.5975189, 0.5529446, 1.231524, 1, 0, 0, 1, 1,
0.597715, -1.094191, 2.166174, 1, 0, 0, 1, 1,
0.599161, 1.194648, 0.4621455, 0, 0, 0, 1, 1,
0.5992978, -1.773662, 2.815587, 0, 0, 0, 1, 1,
0.6008243, -0.7309795, 2.610041, 0, 0, 0, 1, 1,
0.6023566, -0.5598955, 3.52122, 0, 0, 0, 1, 1,
0.6126166, -0.2126253, 1.086766, 0, 0, 0, 1, 1,
0.6141489, 0.2208486, 1.450251, 0, 0, 0, 1, 1,
0.6174688, 0.131467, 1.042945, 0, 0, 0, 1, 1,
0.6176503, -0.03719889, 0.8280557, 1, 1, 1, 1, 1,
0.6188065, 0.4331053, 1.06848, 1, 1, 1, 1, 1,
0.6267833, -0.336623, 2.945114, 1, 1, 1, 1, 1,
0.630196, 0.6411796, 0.7233134, 1, 1, 1, 1, 1,
0.6314006, 0.629062, 0.5517809, 1, 1, 1, 1, 1,
0.6339149, -0.1476395, 1.471881, 1, 1, 1, 1, 1,
0.6365073, -1.204171, 1.10845, 1, 1, 1, 1, 1,
0.6401886, -0.3607123, 1.815267, 1, 1, 1, 1, 1,
0.6424578, 0.6653901, 0.5940427, 1, 1, 1, 1, 1,
0.6451238, -1.235777, 3.194108, 1, 1, 1, 1, 1,
0.6476743, 2.135675, 1.194244, 1, 1, 1, 1, 1,
0.6510428, -1.89735, 4.169346, 1, 1, 1, 1, 1,
0.6529141, 2.157379, -1.63615, 1, 1, 1, 1, 1,
0.6534129, 0.4104731, 0.1458068, 1, 1, 1, 1, 1,
0.6536329, -0.3456229, 1.743063, 1, 1, 1, 1, 1,
0.6558908, 0.8073651, 1.317071, 0, 0, 1, 1, 1,
0.6567762, -0.1827376, 0.5743158, 1, 0, 0, 1, 1,
0.6601907, -0.486843, 2.309655, 1, 0, 0, 1, 1,
0.6605502, 0.7770895, 1.525748, 1, 0, 0, 1, 1,
0.663969, 0.2434822, 1.759498, 1, 0, 0, 1, 1,
0.6640421, -0.5085001, 2.360804, 1, 0, 0, 1, 1,
0.6640671, 1.666061, 0.4700095, 0, 0, 0, 1, 1,
0.6667676, 0.5974787, 2.175169, 0, 0, 0, 1, 1,
0.6784379, -0.8261286, 1.540909, 0, 0, 0, 1, 1,
0.679197, 0.3578854, -0.694486, 0, 0, 0, 1, 1,
0.6798417, -0.6515582, 3.648334, 0, 0, 0, 1, 1,
0.6821681, -1.124615, 2.957405, 0, 0, 0, 1, 1,
0.6824716, 0.3096472, 1.026325, 0, 0, 0, 1, 1,
0.6828089, -0.8691508, 2.760825, 1, 1, 1, 1, 1,
0.6867959, 1.081176, -0.05807861, 1, 1, 1, 1, 1,
0.6868564, -0.8717109, 2.92294, 1, 1, 1, 1, 1,
0.6889701, -0.6256877, 1.821218, 1, 1, 1, 1, 1,
0.6981372, -1.678013, 3.701919, 1, 1, 1, 1, 1,
0.6983076, 1.233838, -0.265484, 1, 1, 1, 1, 1,
0.6983279, -0.478438, 1.317826, 1, 1, 1, 1, 1,
0.7017672, 0.9262185, 0.2607188, 1, 1, 1, 1, 1,
0.7038233, 1.199956, 0.4768402, 1, 1, 1, 1, 1,
0.7347509, 0.009410057, 1.006646, 1, 1, 1, 1, 1,
0.7349908, -0.7351665, 2.052624, 1, 1, 1, 1, 1,
0.7379724, -1.004687, 2.91041, 1, 1, 1, 1, 1,
0.7385186, 0.4416203, -0.4425675, 1, 1, 1, 1, 1,
0.7393687, 0.1344296, 1.694015, 1, 1, 1, 1, 1,
0.7458773, -0.5347785, 3.388704, 1, 1, 1, 1, 1,
0.7468166, 0.1195203, 0.7496128, 0, 0, 1, 1, 1,
0.74718, 1.227619, 1.394877, 1, 0, 0, 1, 1,
0.7473922, -0.5735164, -0.3122658, 1, 0, 0, 1, 1,
0.7489666, 0.5372356, 1.464389, 1, 0, 0, 1, 1,
0.7499869, 0.4046037, 1.569109, 1, 0, 0, 1, 1,
0.7571917, -1.273745, 2.86701, 1, 0, 0, 1, 1,
0.7617961, 1.019744, 0.276941, 0, 0, 0, 1, 1,
0.766786, -0.6163425, 4.367698, 0, 0, 0, 1, 1,
0.7745433, -0.1483689, 1.789443, 0, 0, 0, 1, 1,
0.7752922, 0.6214544, 1.430683, 0, 0, 0, 1, 1,
0.7777216, 0.7851536, 0.8440292, 0, 0, 0, 1, 1,
0.7809932, 0.9678259, -0.0615171, 0, 0, 0, 1, 1,
0.785997, -1.526664, 3.582227, 0, 0, 0, 1, 1,
0.7876567, 0.07534222, 1.87378, 1, 1, 1, 1, 1,
0.7879961, 0.8385769, 1.388349, 1, 1, 1, 1, 1,
0.7947495, -0.493949, 2.164055, 1, 1, 1, 1, 1,
0.7960053, -0.01850703, 2.229043, 1, 1, 1, 1, 1,
0.8009599, -1.672022, 3.403643, 1, 1, 1, 1, 1,
0.8048541, 0.3968062, 0.872191, 1, 1, 1, 1, 1,
0.805864, 1.605914, -0.3431731, 1, 1, 1, 1, 1,
0.8074037, -1.270857, 1.599671, 1, 1, 1, 1, 1,
0.8116676, 0.6137501, 0.802577, 1, 1, 1, 1, 1,
0.8152115, -0.4156935, 0.5331477, 1, 1, 1, 1, 1,
0.8188981, 0.0820302, 2.100429, 1, 1, 1, 1, 1,
0.8223365, -1.086247, 2.935026, 1, 1, 1, 1, 1,
0.8225154, -1.159115, 2.513345, 1, 1, 1, 1, 1,
0.8235937, -1.214747, 3.543776, 1, 1, 1, 1, 1,
0.8247899, -1.677367, 3.349288, 1, 1, 1, 1, 1,
0.8288066, -1.0084, 3.127048, 0, 0, 1, 1, 1,
0.8288542, -1.021345, 1.864562, 1, 0, 0, 1, 1,
0.8289086, 0.241348, 0.05697146, 1, 0, 0, 1, 1,
0.830198, -0.6238079, 1.471223, 1, 0, 0, 1, 1,
0.8388392, -0.9186529, 3.593977, 1, 0, 0, 1, 1,
0.8422082, -0.9206083, 1.85748, 1, 0, 0, 1, 1,
0.8437114, -0.2032884, 1.995122, 0, 0, 0, 1, 1,
0.845121, 0.414035, 1.776336, 0, 0, 0, 1, 1,
0.8468572, 0.2140883, 1.222383, 0, 0, 0, 1, 1,
0.8522938, 1.29022, 1.973246, 0, 0, 0, 1, 1,
0.8672461, 1.338052, 1.296921, 0, 0, 0, 1, 1,
0.8707463, -0.1378427, 2.738572, 0, 0, 0, 1, 1,
0.8823952, -2.181204, 2.975796, 0, 0, 0, 1, 1,
0.885341, 1.147388, 0.5407955, 1, 1, 1, 1, 1,
0.8869216, 0.203664, 2.39262, 1, 1, 1, 1, 1,
0.8978822, 0.6769113, 0.2585776, 1, 1, 1, 1, 1,
0.903142, -1.445065, 2.722685, 1, 1, 1, 1, 1,
0.9180402, 0.2973614, 2.062302, 1, 1, 1, 1, 1,
0.9238201, 0.2751742, 0.7834823, 1, 1, 1, 1, 1,
0.9277776, -0.8389305, 1.923007, 1, 1, 1, 1, 1,
0.928132, -0.1838516, 3.682554, 1, 1, 1, 1, 1,
0.9288898, -0.3914222, 3.048184, 1, 1, 1, 1, 1,
0.9335242, -0.4463596, 0.7855589, 1, 1, 1, 1, 1,
0.9380245, 1.117003, 0.7041994, 1, 1, 1, 1, 1,
0.9392239, 0.5389674, 1.105639, 1, 1, 1, 1, 1,
0.9400946, 1.17938, -1.670205, 1, 1, 1, 1, 1,
0.9477829, 0.1808831, -0.158299, 1, 1, 1, 1, 1,
0.9479292, 0.3540063, 0.8290027, 1, 1, 1, 1, 1,
0.9518194, 0.9860009, -0.01239597, 0, 0, 1, 1, 1,
0.9694864, 1.479748, 1.958236, 1, 0, 0, 1, 1,
0.9728618, -0.4078831, 2.763653, 1, 0, 0, 1, 1,
0.976358, -0.5087364, 0.4070832, 1, 0, 0, 1, 1,
0.9773273, -0.363647, 1.287702, 1, 0, 0, 1, 1,
0.9776129, -0.2412979, 4.376896, 1, 0, 0, 1, 1,
0.980065, 1.112523, 0.5979759, 0, 0, 0, 1, 1,
0.9888012, 1.02955, -0.02829084, 0, 0, 0, 1, 1,
0.9927762, -1.00895, 1.263069, 0, 0, 0, 1, 1,
0.9934196, 0.6005012, 2.246455, 0, 0, 0, 1, 1,
0.9986785, 2.059201, -1.125193, 0, 0, 0, 1, 1,
1.003221, 0.7586711, 2.324394, 0, 0, 0, 1, 1,
1.013372, -0.6785493, 1.847193, 0, 0, 0, 1, 1,
1.0147, 0.6618488, 1.608353, 1, 1, 1, 1, 1,
1.027841, -0.327775, 2.346832, 1, 1, 1, 1, 1,
1.033126, -0.8954565, 1.86054, 1, 1, 1, 1, 1,
1.033563, 0.4526319, 2.002385, 1, 1, 1, 1, 1,
1.0396, 0.695904, 0.9026384, 1, 1, 1, 1, 1,
1.044443, -0.02676762, -0.7599905, 1, 1, 1, 1, 1,
1.044724, 0.7568127, 0.9280415, 1, 1, 1, 1, 1,
1.049536, 2.452318, -0.05216831, 1, 1, 1, 1, 1,
1.053567, 0.6518213, 2.427212, 1, 1, 1, 1, 1,
1.063507, 1.170822, 1.646397, 1, 1, 1, 1, 1,
1.064821, -0.316486, 2.205425, 1, 1, 1, 1, 1,
1.068397, 0.5760144, 0.4436139, 1, 1, 1, 1, 1,
1.071808, 1.243403, 0.449336, 1, 1, 1, 1, 1,
1.071851, 0.07543514, 1.744535, 1, 1, 1, 1, 1,
1.077428, -1.022292, 2.109782, 1, 1, 1, 1, 1,
1.080019, 1.28272, 1.100816, 0, 0, 1, 1, 1,
1.084105, -0.7139439, 1.648092, 1, 0, 0, 1, 1,
1.091472, 1.757299, 0.5712739, 1, 0, 0, 1, 1,
1.099076, -1.199175, 2.689526, 1, 0, 0, 1, 1,
1.101094, -0.5563205, 3.77065, 1, 0, 0, 1, 1,
1.102804, -0.2165276, 3.064533, 1, 0, 0, 1, 1,
1.112948, -0.133589, 1.886666, 0, 0, 0, 1, 1,
1.114481, -0.6356415, 3.405404, 0, 0, 0, 1, 1,
1.116837, -0.2866966, 1.174311, 0, 0, 0, 1, 1,
1.121697, -0.06993695, 3.18156, 0, 0, 0, 1, 1,
1.128201, -0.1115775, 2.944312, 0, 0, 0, 1, 1,
1.138743, 1.325362, 2.536281, 0, 0, 0, 1, 1,
1.145698, 0.5353281, 1.822757, 0, 0, 0, 1, 1,
1.146275, -1.83222, 4.290808, 1, 1, 1, 1, 1,
1.149608, -0.2513386, 0.3583469, 1, 1, 1, 1, 1,
1.151078, 1.507399, 0.5319206, 1, 1, 1, 1, 1,
1.155064, -0.6119872, 1.661337, 1, 1, 1, 1, 1,
1.159567, -1.234458, 1.901312, 1, 1, 1, 1, 1,
1.161231, -0.4358295, 1.793049, 1, 1, 1, 1, 1,
1.165834, -0.572314, 2.556855, 1, 1, 1, 1, 1,
1.17535, -1.07158, 3.829633, 1, 1, 1, 1, 1,
1.177455, -0.4464941, 1.647429, 1, 1, 1, 1, 1,
1.182121, 1.046214, -0.2692776, 1, 1, 1, 1, 1,
1.187343, 1.160206, 0.6307598, 1, 1, 1, 1, 1,
1.190401, 0.2404181, 1.937177, 1, 1, 1, 1, 1,
1.194113, -0.4317133, 1.872414, 1, 1, 1, 1, 1,
1.197866, -0.1124838, 0.6307943, 1, 1, 1, 1, 1,
1.199407, -0.0784094, 0.8612089, 1, 1, 1, 1, 1,
1.202015, -0.714143, 1.709718, 0, 0, 1, 1, 1,
1.211408, -0.8262645, 1.10523, 1, 0, 0, 1, 1,
1.213638, 0.316454, 1.700087, 1, 0, 0, 1, 1,
1.213803, -0.6755792, 2.675271, 1, 0, 0, 1, 1,
1.21811, 2.018466, -1.646616, 1, 0, 0, 1, 1,
1.22286, 0.964635, 0.8952083, 1, 0, 0, 1, 1,
1.236841, 0.3211607, -0.2637855, 0, 0, 0, 1, 1,
1.237412, -0.4615089, 2.79651, 0, 0, 0, 1, 1,
1.241732, 1.212893, 2.393479, 0, 0, 0, 1, 1,
1.246534, -0.6024573, 0.9435498, 0, 0, 0, 1, 1,
1.249075, -0.1158445, 1.900968, 0, 0, 0, 1, 1,
1.250269, -0.6305382, 3.100973, 0, 0, 0, 1, 1,
1.253517, -1.193022, 3.110889, 0, 0, 0, 1, 1,
1.260709, 1.776721, 0.2296875, 1, 1, 1, 1, 1,
1.272316, -0.09822401, 1.798207, 1, 1, 1, 1, 1,
1.277874, 0.2679319, 1.621834, 1, 1, 1, 1, 1,
1.31758, -0.2766211, 1.778098, 1, 1, 1, 1, 1,
1.319403, -0.7226785, 1.231811, 1, 1, 1, 1, 1,
1.321589, -1.520046, 4.019854, 1, 1, 1, 1, 1,
1.330881, 0.4420201, 0.02208197, 1, 1, 1, 1, 1,
1.33926, 0.3647973, 1.209316, 1, 1, 1, 1, 1,
1.340468, 0.3316988, 1.48305, 1, 1, 1, 1, 1,
1.352643, 0.4817292, -0.5778689, 1, 1, 1, 1, 1,
1.360693, 2.070687, -0.3493513, 1, 1, 1, 1, 1,
1.362006, -1.219688, 3.23554, 1, 1, 1, 1, 1,
1.365877, -0.7915027, 1.927762, 1, 1, 1, 1, 1,
1.381291, 0.6147866, 1.438737, 1, 1, 1, 1, 1,
1.388104, 0.5269231, 0.5250223, 1, 1, 1, 1, 1,
1.390406, -0.2207494, 2.859601, 0, 0, 1, 1, 1,
1.392692, 0.2017704, 2.669908, 1, 0, 0, 1, 1,
1.402032, -0.1116028, 1.613946, 1, 0, 0, 1, 1,
1.404667, 0.3902757, 0.3682834, 1, 0, 0, 1, 1,
1.404949, 0.005214676, 1.404071, 1, 0, 0, 1, 1,
1.411056, -0.7093462, 2.363461, 1, 0, 0, 1, 1,
1.412081, -0.9957404, 2.439483, 0, 0, 0, 1, 1,
1.415058, -1.0121, 2.76562, 0, 0, 0, 1, 1,
1.429077, 0.5886931, 0.8143712, 0, 0, 0, 1, 1,
1.450229, 0.5584008, 1.207981, 0, 0, 0, 1, 1,
1.450271, -0.6162732, 2.425106, 0, 0, 0, 1, 1,
1.455658, 0.09477671, 1.692133, 0, 0, 0, 1, 1,
1.459147, 0.7865774, 1.452911, 0, 0, 0, 1, 1,
1.469348, 1.430589, -1.079226, 1, 1, 1, 1, 1,
1.471662, 2.067423, -1.288601, 1, 1, 1, 1, 1,
1.488746, -0.433639, 0.8229278, 1, 1, 1, 1, 1,
1.498818, -0.4562189, 1.57895, 1, 1, 1, 1, 1,
1.50146, -0.9847071, 2.66437, 1, 1, 1, 1, 1,
1.506953, 0.5515901, 4.122509, 1, 1, 1, 1, 1,
1.510766, 0.6646861, 1.743786, 1, 1, 1, 1, 1,
1.513493, 0.3815292, 1.821308, 1, 1, 1, 1, 1,
1.515006, 0.5891345, 0.6085898, 1, 1, 1, 1, 1,
1.52589, 0.1299663, 0.7146153, 1, 1, 1, 1, 1,
1.537374, -0.8414032, 2.123435, 1, 1, 1, 1, 1,
1.553449, 0.9700285, 1.19484, 1, 1, 1, 1, 1,
1.555071, -0.5869135, -1.149715, 1, 1, 1, 1, 1,
1.562982, 1.081167, -1.377217, 1, 1, 1, 1, 1,
1.567048, -0.03229449, 2.873214, 1, 1, 1, 1, 1,
1.571755, -0.5422567, 1.635539, 0, 0, 1, 1, 1,
1.576916, 2.328606, 1.037217, 1, 0, 0, 1, 1,
1.589069, 0.4293656, 0.2877568, 1, 0, 0, 1, 1,
1.596496, 0.6534922, 2.260996, 1, 0, 0, 1, 1,
1.613064, -0.6229357, 3.112562, 1, 0, 0, 1, 1,
1.616475, -1.311828, 1.555374, 1, 0, 0, 1, 1,
1.622499, 0.4184604, 2.181949, 0, 0, 0, 1, 1,
1.623608, 1.22685, 1.396263, 0, 0, 0, 1, 1,
1.627187, -0.2021236, 1.413919, 0, 0, 0, 1, 1,
1.631725, -3.028208, 1.960993, 0, 0, 0, 1, 1,
1.645186, -0.138952, 1.592779, 0, 0, 0, 1, 1,
1.655792, 1.061256, 2.072788, 0, 0, 0, 1, 1,
1.658521, -0.6956558, 1.847927, 0, 0, 0, 1, 1,
1.676316, 0.4950626, 0.0577304, 1, 1, 1, 1, 1,
1.718229, 0.6659336, 0.5534494, 1, 1, 1, 1, 1,
1.755939, 0.6845174, 0.4930228, 1, 1, 1, 1, 1,
1.766464, 0.7918698, 1.122103, 1, 1, 1, 1, 1,
1.781352, -0.2256244, 0.9212914, 1, 1, 1, 1, 1,
1.7883, 0.6387042, 1.381345, 1, 1, 1, 1, 1,
1.792401, 1.821495, 0.8090388, 1, 1, 1, 1, 1,
1.818285, 0.2614711, -0.20572, 1, 1, 1, 1, 1,
1.852054, -1.601819, 3.364646, 1, 1, 1, 1, 1,
1.886537, 0.3193498, 0.7732212, 1, 1, 1, 1, 1,
1.903702, -1.44768, 1.584277, 1, 1, 1, 1, 1,
1.905775, 0.7383628, 0.0404438, 1, 1, 1, 1, 1,
1.917413, -1.552008, 1.421243, 1, 1, 1, 1, 1,
1.968835, 1.169601, 0.3722231, 1, 1, 1, 1, 1,
1.990139, 0.9916152, -0.2563452, 1, 1, 1, 1, 1,
1.994614, -0.8061651, 2.545414, 0, 0, 1, 1, 1,
2.047854, -1.534862, 3.624852, 1, 0, 0, 1, 1,
2.093548, -0.6341194, 0.4402308, 1, 0, 0, 1, 1,
2.111944, -0.4940616, 2.049057, 1, 0, 0, 1, 1,
2.144898, -0.380707, 3.185913, 1, 0, 0, 1, 1,
2.231219, -0.3824038, -0.1953941, 1, 0, 0, 1, 1,
2.233952, 0.475977, 2.179309, 0, 0, 0, 1, 1,
2.28277, -0.6295907, 1.87121, 0, 0, 0, 1, 1,
2.322423, -0.675279, 4.90262, 0, 0, 0, 1, 1,
2.330928, -0.5425006, 1.445996, 0, 0, 0, 1, 1,
2.368331, -0.9796698, 2.332131, 0, 0, 0, 1, 1,
2.375813, 0.4802704, 0.3049838, 0, 0, 0, 1, 1,
2.426251, 1.437158, -1.318938, 0, 0, 0, 1, 1,
2.426734, -0.367972, 0.3837677, 1, 1, 1, 1, 1,
2.473178, -0.1532011, 2.646881, 1, 1, 1, 1, 1,
2.88204, -0.8840948, 2.057485, 1, 1, 1, 1, 1,
2.889039, 0.9370639, 1.589168, 1, 1, 1, 1, 1,
2.9249, 0.4419202, 0.431795, 1, 1, 1, 1, 1,
3.100455, -1.096254, 1.337387, 1, 1, 1, 1, 1,
3.292398, -0.009150643, 1.248457, 1, 1, 1, 1, 1
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
var radius = 9.521399;
var distance = 33.44351;
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
mvMatrix.translate( -0.07048368, -0.1450627, -0.1226304 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.44351);
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
