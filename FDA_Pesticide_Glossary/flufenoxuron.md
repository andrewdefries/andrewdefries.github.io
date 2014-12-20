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
-3.314089, 0.8578624, 0.1241291, 1, 0, 0, 1,
-3.284321, 0.09576453, 0.3301909, 1, 0.007843138, 0, 1,
-2.996624, 1.279161, 0.4942605, 1, 0.01176471, 0, 1,
-2.824715, 0.88751, -0.4823162, 1, 0.01960784, 0, 1,
-2.746068, -0.9639848, -0.4043192, 1, 0.02352941, 0, 1,
-2.682864, -0.7705037, -2.981151, 1, 0.03137255, 0, 1,
-2.618347, -0.06916432, -0.9052474, 1, 0.03529412, 0, 1,
-2.575481, 1.305563, -0.4013528, 1, 0.04313726, 0, 1,
-2.564767, 0.6957037, -2.021106, 1, 0.04705882, 0, 1,
-2.536101, 0.8569204, -2.629071, 1, 0.05490196, 0, 1,
-2.490509, -0.3834542, -1.617821, 1, 0.05882353, 0, 1,
-2.409516, 0.7460356, -0.05595376, 1, 0.06666667, 0, 1,
-2.397105, -0.08909238, -1.714963, 1, 0.07058824, 0, 1,
-2.374559, -0.1350817, -2.249095, 1, 0.07843138, 0, 1,
-2.362757, 0.2274128, -1.703795, 1, 0.08235294, 0, 1,
-2.333331, 0.1083015, -1.131056, 1, 0.09019608, 0, 1,
-2.320751, -1.153527, -2.18047, 1, 0.09411765, 0, 1,
-2.272751, 0.783641, -0.2275459, 1, 0.1019608, 0, 1,
-2.245825, 0.5084992, -0.09284695, 1, 0.1098039, 0, 1,
-2.243645, -0.1881056, -0.3440106, 1, 0.1137255, 0, 1,
-2.172716, 0.8489095, -2.754525, 1, 0.1215686, 0, 1,
-2.133118, -0.5922821, -3.61509, 1, 0.1254902, 0, 1,
-2.092645, 0.2191399, -1.041107, 1, 0.1333333, 0, 1,
-2.057834, -0.7289626, -0.1686497, 1, 0.1372549, 0, 1,
-2.057793, -0.3008158, -3.182891, 1, 0.145098, 0, 1,
-2.052544, -0.0377571, -2.984807, 1, 0.1490196, 0, 1,
-2.034712, 0.4178413, -2.906376, 1, 0.1568628, 0, 1,
-2.008926, 1.254149, -2.597006, 1, 0.1607843, 0, 1,
-2.00151, 1.469071, -0.828629, 1, 0.1686275, 0, 1,
-2.000344, 0.4933591, 0.3312331, 1, 0.172549, 0, 1,
-1.998386, -0.1312795, -1.161623, 1, 0.1803922, 0, 1,
-1.993601, -0.9356133, -1.54846, 1, 0.1843137, 0, 1,
-1.950181, 0.8013579, -0.7286577, 1, 0.1921569, 0, 1,
-1.945769, 0.4779252, -1.654037, 1, 0.1960784, 0, 1,
-1.928702, -0.6685104, -0.5391663, 1, 0.2039216, 0, 1,
-1.921039, 0.08989903, -2.66619, 1, 0.2117647, 0, 1,
-1.896619, 0.5526429, -2.646084, 1, 0.2156863, 0, 1,
-1.896475, -1.505519, -4.178292, 1, 0.2235294, 0, 1,
-1.887543, 0.1236355, 0.7705247, 1, 0.227451, 0, 1,
-1.851662, -0.3105986, -1.090632, 1, 0.2352941, 0, 1,
-1.791884, -0.5422468, -1.878059, 1, 0.2392157, 0, 1,
-1.786926, -1.023014, -1.548643, 1, 0.2470588, 0, 1,
-1.783601, -1.620725, -3.787929, 1, 0.2509804, 0, 1,
-1.765594, -3.386967, -1.977597, 1, 0.2588235, 0, 1,
-1.718822, 0.6329693, -1.681706, 1, 0.2627451, 0, 1,
-1.717968, -0.9374236, -3.191672, 1, 0.2705882, 0, 1,
-1.707185, -0.5987594, -1.884268, 1, 0.2745098, 0, 1,
-1.702069, -0.5354232, -1.831688, 1, 0.282353, 0, 1,
-1.690651, -0.2474529, -0.4299457, 1, 0.2862745, 0, 1,
-1.68366, -0.7055895, -2.715913, 1, 0.2941177, 0, 1,
-1.680317, 2.190161, 0.1465466, 1, 0.3019608, 0, 1,
-1.674619, 1.162929, -0.2331064, 1, 0.3058824, 0, 1,
-1.672056, -1.314355, -2.275997, 1, 0.3137255, 0, 1,
-1.669141, -0.1383236, -0.3026412, 1, 0.3176471, 0, 1,
-1.661661, 1.167158, -1.955087, 1, 0.3254902, 0, 1,
-1.637253, -0.4383688, -1.336824, 1, 0.3294118, 0, 1,
-1.63026, 0.5927966, 0.2008082, 1, 0.3372549, 0, 1,
-1.623832, -1.357627, -1.94217, 1, 0.3411765, 0, 1,
-1.620562, 0.5746782, -1.061266, 1, 0.3490196, 0, 1,
-1.616807, 0.3163962, -0.5789533, 1, 0.3529412, 0, 1,
-1.601929, -0.8850106, -1.275362, 1, 0.3607843, 0, 1,
-1.599253, -0.8880082, -3.068049, 1, 0.3647059, 0, 1,
-1.591365, 0.7165561, -2.435058, 1, 0.372549, 0, 1,
-1.583215, 0.02513336, -1.410893, 1, 0.3764706, 0, 1,
-1.580976, 0.9448958, -1.859776, 1, 0.3843137, 0, 1,
-1.578777, -0.07313386, 0.04660072, 1, 0.3882353, 0, 1,
-1.564688, -1.266285, -3.84902, 1, 0.3960784, 0, 1,
-1.557975, -0.2760621, 0.1384727, 1, 0.4039216, 0, 1,
-1.552176, 0.8111169, 0.1998459, 1, 0.4078431, 0, 1,
-1.530909, -0.5760704, -1.71964, 1, 0.4156863, 0, 1,
-1.521147, -0.4248167, -1.469998, 1, 0.4196078, 0, 1,
-1.51227, -0.01546483, -1.807854, 1, 0.427451, 0, 1,
-1.509367, -0.6779788, -3.467288, 1, 0.4313726, 0, 1,
-1.507171, 0.3967955, -0.5728655, 1, 0.4392157, 0, 1,
-1.494749, 1.0908, -0.3705042, 1, 0.4431373, 0, 1,
-1.49456, -0.6353399, -1.042815, 1, 0.4509804, 0, 1,
-1.489592, -0.06231454, 0.2854798, 1, 0.454902, 0, 1,
-1.480461, 1.580718, 0.4172416, 1, 0.4627451, 0, 1,
-1.476402, 1.600268, -0.8464654, 1, 0.4666667, 0, 1,
-1.474112, 0.8946949, -0.2567357, 1, 0.4745098, 0, 1,
-1.469515, 0.1207392, -1.763538, 1, 0.4784314, 0, 1,
-1.467408, -0.9398617, -2.961875, 1, 0.4862745, 0, 1,
-1.46676, 0.8343775, -1.115331, 1, 0.4901961, 0, 1,
-1.463313, -0.03372427, -2.159237, 1, 0.4980392, 0, 1,
-1.460512, -0.9023155, -2.986207, 1, 0.5058824, 0, 1,
-1.459986, 1.066078, -1.86428, 1, 0.509804, 0, 1,
-1.457637, 0.04188031, -1.534136, 1, 0.5176471, 0, 1,
-1.453193, 0.8162905, -0.620977, 1, 0.5215687, 0, 1,
-1.444978, 1.003322, -0.8165099, 1, 0.5294118, 0, 1,
-1.44374, -0.7058375, -1.424651, 1, 0.5333334, 0, 1,
-1.42901, -0.4412623, -3.082662, 1, 0.5411765, 0, 1,
-1.427226, -0.6568868, -2.052612, 1, 0.5450981, 0, 1,
-1.411466, 1.560876, -1.569425, 1, 0.5529412, 0, 1,
-1.406534, 0.7795985, -0.689602, 1, 0.5568628, 0, 1,
-1.389391, 0.1502293, -2.228199, 1, 0.5647059, 0, 1,
-1.388524, -0.321346, -1.329506, 1, 0.5686275, 0, 1,
-1.375911, 0.1459334, -1.766311, 1, 0.5764706, 0, 1,
-1.341392, 1.777565, 1.093553, 1, 0.5803922, 0, 1,
-1.341105, -0.5595275, -1.662345, 1, 0.5882353, 0, 1,
-1.339229, -0.01728734, -1.685669, 1, 0.5921569, 0, 1,
-1.331816, -0.330516, -2.072337, 1, 0.6, 0, 1,
-1.324878, -1.071849, -1.538005, 1, 0.6078432, 0, 1,
-1.306245, 1.173137, -0.8139679, 1, 0.6117647, 0, 1,
-1.306167, 1.478528, 0.3790111, 1, 0.6196079, 0, 1,
-1.304936, -0.3652277, -1.633211, 1, 0.6235294, 0, 1,
-1.30387, 0.1912926, -1.597811, 1, 0.6313726, 0, 1,
-1.299905, -0.05432267, -0.6036592, 1, 0.6352941, 0, 1,
-1.29613, -1.301774, -3.503414, 1, 0.6431373, 0, 1,
-1.293491, 0.497078, -2.925723, 1, 0.6470588, 0, 1,
-1.287966, 1.175572, -0.3327386, 1, 0.654902, 0, 1,
-1.286446, 2.483402, -1.664984, 1, 0.6588235, 0, 1,
-1.280079, 0.5636466, -2.157795, 1, 0.6666667, 0, 1,
-1.277778, 0.3322847, -2.461564, 1, 0.6705883, 0, 1,
-1.271901, 0.5322837, -0.602753, 1, 0.6784314, 0, 1,
-1.266485, 0.7395984, -1.105176, 1, 0.682353, 0, 1,
-1.262069, -1.163152, -2.698243, 1, 0.6901961, 0, 1,
-1.242949, 0.3964906, -2.081369, 1, 0.6941177, 0, 1,
-1.23091, 0.1921952, -0.9406045, 1, 0.7019608, 0, 1,
-1.220991, 0.310535, -1.008434, 1, 0.7098039, 0, 1,
-1.220796, 0.5545997, -1.441773, 1, 0.7137255, 0, 1,
-1.218279, -0.9200449, -2.220891, 1, 0.7215686, 0, 1,
-1.213566, -2.107915, -2.950001, 1, 0.7254902, 0, 1,
-1.20503, -0.3166211, -1.812524, 1, 0.7333333, 0, 1,
-1.198812, 0.3426147, -1.408925, 1, 0.7372549, 0, 1,
-1.169929, -1.584698, -2.845426, 1, 0.7450981, 0, 1,
-1.162959, 0.03709665, -1.448993, 1, 0.7490196, 0, 1,
-1.161808, 0.7532747, -1.612518, 1, 0.7568628, 0, 1,
-1.160884, 0.4438285, -2.084623, 1, 0.7607843, 0, 1,
-1.160013, 0.8311389, -1.536791, 1, 0.7686275, 0, 1,
-1.149629, 0.3549336, -0.849974, 1, 0.772549, 0, 1,
-1.149541, -0.8063843, -1.404944, 1, 0.7803922, 0, 1,
-1.137247, 0.2390243, -3.20894, 1, 0.7843137, 0, 1,
-1.136545, 0.9538249, -1.037706, 1, 0.7921569, 0, 1,
-1.134474, -0.0009917414, -1.52705, 1, 0.7960784, 0, 1,
-1.122984, -0.1917258, -2.843072, 1, 0.8039216, 0, 1,
-1.122566, 1.128101, -0.6752786, 1, 0.8117647, 0, 1,
-1.115462, 0.9299554, -2.159767, 1, 0.8156863, 0, 1,
-1.109707, 1.047064, -0.5874698, 1, 0.8235294, 0, 1,
-1.104563, -0.02312365, -1.975028, 1, 0.827451, 0, 1,
-1.09593, 2.150931, 0.5777985, 1, 0.8352941, 0, 1,
-1.089426, -0.8381022, -2.933977, 1, 0.8392157, 0, 1,
-1.084992, 0.6733065, -0.8935645, 1, 0.8470588, 0, 1,
-1.082913, 1.143471, -0.4363383, 1, 0.8509804, 0, 1,
-1.079163, -1.228768, -2.975577, 1, 0.8588235, 0, 1,
-1.069172, -2.061558, -4.311832, 1, 0.8627451, 0, 1,
-1.064253, -0.4749034, -3.355415, 1, 0.8705882, 0, 1,
-1.062067, 0.1022912, -1.82716, 1, 0.8745098, 0, 1,
-1.06179, -0.1618556, -2.624738, 1, 0.8823529, 0, 1,
-1.059084, -0.5849636, -2.780185, 1, 0.8862745, 0, 1,
-1.058731, 0.1517467, -2.366901, 1, 0.8941177, 0, 1,
-1.05271, -1.930589, -3.309139, 1, 0.8980392, 0, 1,
-1.051184, -1.490445, -4.387818, 1, 0.9058824, 0, 1,
-1.044056, -1.316561, -1.028463, 1, 0.9137255, 0, 1,
-1.03772, 2.04915, -1.372545, 1, 0.9176471, 0, 1,
-1.036657, -0.5629793, -1.868796, 1, 0.9254902, 0, 1,
-1.036399, -0.448176, -2.068962, 1, 0.9294118, 0, 1,
-1.03608, -0.6213885, -3.016589, 1, 0.9372549, 0, 1,
-1.035407, -0.72113, -3.095568, 1, 0.9411765, 0, 1,
-1.034863, -0.7396881, -0.5560025, 1, 0.9490196, 0, 1,
-1.031103, 0.4857486, -0.7835761, 1, 0.9529412, 0, 1,
-1.030266, -2.132846, -1.96957, 1, 0.9607843, 0, 1,
-1.014969, -0.362763, -1.111084, 1, 0.9647059, 0, 1,
-1.013814, -0.6203656, -0.6458014, 1, 0.972549, 0, 1,
-1.012697, -1.251308, -2.818531, 1, 0.9764706, 0, 1,
-1.012175, -0.02072391, -0.1868734, 1, 0.9843137, 0, 1,
-1.012053, 0.7337663, -0.1867744, 1, 0.9882353, 0, 1,
-1.011707, 0.6459394, -1.065691, 1, 0.9960784, 0, 1,
-1.01119, -1.003345, -2.037469, 0.9960784, 1, 0, 1,
-1.010144, -0.1336609, -0.6585911, 0.9921569, 1, 0, 1,
-1.009769, -0.7796261, -3.570256, 0.9843137, 1, 0, 1,
-1.002893, -1.34219, -2.619296, 0.9803922, 1, 0, 1,
-0.999438, 0.3811663, -0.7366046, 0.972549, 1, 0, 1,
-0.9980853, -1.032901, -2.253729, 0.9686275, 1, 0, 1,
-0.9966535, -0.5479648, -2.982966, 0.9607843, 1, 0, 1,
-0.9909026, -0.3422461, -2.359711, 0.9568627, 1, 0, 1,
-0.9758965, -0.4115224, -1.975915, 0.9490196, 1, 0, 1,
-0.9741446, -1.571005, -3.701558, 0.945098, 1, 0, 1,
-0.9696596, -0.7862933, -2.010554, 0.9372549, 1, 0, 1,
-0.9686419, 1.840627, -0.6777064, 0.9333333, 1, 0, 1,
-0.9679608, -0.403408, -1.469672, 0.9254902, 1, 0, 1,
-0.9594351, 1.925397, -1.463429, 0.9215686, 1, 0, 1,
-0.9528214, 1.824965, -1.667328, 0.9137255, 1, 0, 1,
-0.9513519, 0.9012523, 0.5236781, 0.9098039, 1, 0, 1,
-0.9482424, -0.6412291, -0.4254265, 0.9019608, 1, 0, 1,
-0.9412608, -1.855968, -1.075818, 0.8941177, 1, 0, 1,
-0.9409824, 1.472089, -1.516738, 0.8901961, 1, 0, 1,
-0.9375938, -1.37707, -1.361056, 0.8823529, 1, 0, 1,
-0.9313357, 1.522151, 0.6028728, 0.8784314, 1, 0, 1,
-0.92622, -1.618909, -2.735685, 0.8705882, 1, 0, 1,
-0.9261646, 1.868156, -0.7063484, 0.8666667, 1, 0, 1,
-0.9183716, 0.5740931, -0.7010736, 0.8588235, 1, 0, 1,
-0.9137565, -0.5276132, -2.253503, 0.854902, 1, 0, 1,
-0.9125197, -0.9163972, -2.602693, 0.8470588, 1, 0, 1,
-0.9114738, 1.323852, 0.6421518, 0.8431373, 1, 0, 1,
-0.9101728, -1.013519, -4.17836, 0.8352941, 1, 0, 1,
-0.9031757, -0.3213366, -0.7354019, 0.8313726, 1, 0, 1,
-0.9013206, -0.03183217, -1.331029, 0.8235294, 1, 0, 1,
-0.8925374, -0.261525, -0.3788878, 0.8196079, 1, 0, 1,
-0.8922965, 1.069908, -2.264713, 0.8117647, 1, 0, 1,
-0.8922645, 0.6392161, -1.396169, 0.8078431, 1, 0, 1,
-0.8914, -0.625577, -1.94099, 0.8, 1, 0, 1,
-0.8895612, 0.2007412, -1.313671, 0.7921569, 1, 0, 1,
-0.8875783, -0.8286731, -2.271346, 0.7882353, 1, 0, 1,
-0.8839538, 0.4495135, -1.772881, 0.7803922, 1, 0, 1,
-0.8751962, 0.6865046, 0.7145891, 0.7764706, 1, 0, 1,
-0.8737677, 0.6677824, -0.7407594, 0.7686275, 1, 0, 1,
-0.8598839, 0.2986737, -1.783607, 0.7647059, 1, 0, 1,
-0.8569955, -0.3670129, -2.94957, 0.7568628, 1, 0, 1,
-0.8465571, 0.4920306, -1.052465, 0.7529412, 1, 0, 1,
-0.8430688, -0.124305, -2.350086, 0.7450981, 1, 0, 1,
-0.8423357, 1.042652, -1.877251, 0.7411765, 1, 0, 1,
-0.8419253, -0.9151669, -1.923365, 0.7333333, 1, 0, 1,
-0.8414046, -0.02360823, -1.552278, 0.7294118, 1, 0, 1,
-0.8402772, 0.0902761, -2.451079, 0.7215686, 1, 0, 1,
-0.8377442, 0.2329613, 0.5114707, 0.7176471, 1, 0, 1,
-0.8357847, 1.115661, 0.4648714, 0.7098039, 1, 0, 1,
-0.8280002, -0.2958274, -2.8235, 0.7058824, 1, 0, 1,
-0.8274771, -0.1805871, -2.430485, 0.6980392, 1, 0, 1,
-0.8234199, -0.6011651, -2.436448, 0.6901961, 1, 0, 1,
-0.8212493, 0.681152, -0.1556159, 0.6862745, 1, 0, 1,
-0.8211265, -1.142998, -3.623843, 0.6784314, 1, 0, 1,
-0.8196863, -1.089175, -2.845025, 0.6745098, 1, 0, 1,
-0.8166701, -0.9976981, -2.722487, 0.6666667, 1, 0, 1,
-0.8134053, 0.2360497, 0.1291567, 0.6627451, 1, 0, 1,
-0.7975159, -0.5401032, -2.755447, 0.654902, 1, 0, 1,
-0.7954451, -0.4429322, -0.5920954, 0.6509804, 1, 0, 1,
-0.7927189, -0.159483, -2.096892, 0.6431373, 1, 0, 1,
-0.78879, 0.3271987, -0.3166297, 0.6392157, 1, 0, 1,
-0.7872908, 1.524074, -0.6662677, 0.6313726, 1, 0, 1,
-0.7819803, 1.678742, -0.5084088, 0.627451, 1, 0, 1,
-0.781432, -0.5282043, -1.627134, 0.6196079, 1, 0, 1,
-0.7811546, 0.6513521, -2.7252, 0.6156863, 1, 0, 1,
-0.7735248, -2.21079, -1.481966, 0.6078432, 1, 0, 1,
-0.7724237, -1.611745, -3.508454, 0.6039216, 1, 0, 1,
-0.758867, -0.1027762, -1.015708, 0.5960785, 1, 0, 1,
-0.758547, -0.4074683, -2.150925, 0.5882353, 1, 0, 1,
-0.7577887, -0.8686794, -2.198931, 0.5843138, 1, 0, 1,
-0.7572802, -0.4534301, -1.847098, 0.5764706, 1, 0, 1,
-0.7552364, 0.6815073, 0.2642584, 0.572549, 1, 0, 1,
-0.7548962, -0.8472115, -3.331132, 0.5647059, 1, 0, 1,
-0.7546683, 1.532551, -0.3692091, 0.5607843, 1, 0, 1,
-0.7485564, -0.6567806, -1.763872, 0.5529412, 1, 0, 1,
-0.7483444, 0.6891728, 0.9801806, 0.5490196, 1, 0, 1,
-0.739606, -0.5524291, -1.628497, 0.5411765, 1, 0, 1,
-0.7372712, -0.9063835, -1.748742, 0.5372549, 1, 0, 1,
-0.7250854, 0.5624375, -1.465092, 0.5294118, 1, 0, 1,
-0.7204017, 0.8656815, -1.083008, 0.5254902, 1, 0, 1,
-0.7195939, -0.2224313, -0.7262489, 0.5176471, 1, 0, 1,
-0.715717, 0.519742, 0.591271, 0.5137255, 1, 0, 1,
-0.7125022, 0.6364906, -0.3613116, 0.5058824, 1, 0, 1,
-0.7040257, -0.6204106, -2.34264, 0.5019608, 1, 0, 1,
-0.701004, -1.055509, -1.92854, 0.4941176, 1, 0, 1,
-0.6993366, -0.4767268, -2.668639, 0.4862745, 1, 0, 1,
-0.6985011, -1.117519, -2.260672, 0.4823529, 1, 0, 1,
-0.6963434, 0.991605, -0.2211453, 0.4745098, 1, 0, 1,
-0.6913083, 1.969754, -2.303923, 0.4705882, 1, 0, 1,
-0.6893139, -0.3706266, -3.553853, 0.4627451, 1, 0, 1,
-0.6826914, 1.250701, 1.022524, 0.4588235, 1, 0, 1,
-0.6765356, 1.148531, -0.1511383, 0.4509804, 1, 0, 1,
-0.6759382, -0.9338276, -1.983429, 0.4470588, 1, 0, 1,
-0.6691855, -0.2682937, -2.125153, 0.4392157, 1, 0, 1,
-0.663285, -1.091004, -2.70233, 0.4352941, 1, 0, 1,
-0.6577216, -0.3443855, -2.602987, 0.427451, 1, 0, 1,
-0.6571179, 1.653227, -1.784753, 0.4235294, 1, 0, 1,
-0.6555907, -1.177817, -1.428879, 0.4156863, 1, 0, 1,
-0.6500534, -1.306057, -1.937299, 0.4117647, 1, 0, 1,
-0.6446148, 0.5662923, 0.6821632, 0.4039216, 1, 0, 1,
-0.6434664, -1.219852, -0.8143486, 0.3960784, 1, 0, 1,
-0.6288121, 2.777071, 0.2006387, 0.3921569, 1, 0, 1,
-0.6253322, -0.5136961, -1.946817, 0.3843137, 1, 0, 1,
-0.6223887, 0.6575546, -0.9111362, 0.3803922, 1, 0, 1,
-0.6190017, -0.3361914, -2.701965, 0.372549, 1, 0, 1,
-0.6171116, 0.4354654, -1.001996, 0.3686275, 1, 0, 1,
-0.6127462, 1.292537, -0.410376, 0.3607843, 1, 0, 1,
-0.6121646, -0.4868442, -2.141418, 0.3568628, 1, 0, 1,
-0.6103885, -0.04207186, -0.01135723, 0.3490196, 1, 0, 1,
-0.6038393, -0.6812935, -1.660428, 0.345098, 1, 0, 1,
-0.5979279, -0.02574403, -0.4761626, 0.3372549, 1, 0, 1,
-0.5975307, 1.169215, 0.8670871, 0.3333333, 1, 0, 1,
-0.5938196, 0.05837526, -1.254282, 0.3254902, 1, 0, 1,
-0.5932719, 2.247213, 0.5275085, 0.3215686, 1, 0, 1,
-0.5924904, 1.000794, 0.3089532, 0.3137255, 1, 0, 1,
-0.5905989, -0.5177545, -3.595848, 0.3098039, 1, 0, 1,
-0.5904235, -2.00286, -3.727456, 0.3019608, 1, 0, 1,
-0.5891992, -0.3061497, -1.007173, 0.2941177, 1, 0, 1,
-0.5837131, 0.2038777, -2.364524, 0.2901961, 1, 0, 1,
-0.5829518, -0.1432352, -0.9215882, 0.282353, 1, 0, 1,
-0.5807419, -1.048601, -3.127582, 0.2784314, 1, 0, 1,
-0.5778527, -0.1746846, -2.512677, 0.2705882, 1, 0, 1,
-0.576652, -0.5037613, -2.347735, 0.2666667, 1, 0, 1,
-0.5765935, 0.9437049, 0.249908, 0.2588235, 1, 0, 1,
-0.5743976, -1.275656, -2.734236, 0.254902, 1, 0, 1,
-0.5714088, 0.3615535, -2.686838, 0.2470588, 1, 0, 1,
-0.5708945, -0.1312521, -0.3465776, 0.2431373, 1, 0, 1,
-0.5699599, 1.162043, -0.5389331, 0.2352941, 1, 0, 1,
-0.569815, 0.7168707, -0.7012185, 0.2313726, 1, 0, 1,
-0.5688618, 0.2490866, -3.35245, 0.2235294, 1, 0, 1,
-0.5676569, -0.1054448, -0.8092433, 0.2196078, 1, 0, 1,
-0.5632458, -1.284303, -1.391627, 0.2117647, 1, 0, 1,
-0.5594874, -0.2689677, -4.51771, 0.2078431, 1, 0, 1,
-0.5583652, -0.8543681, -3.284138, 0.2, 1, 0, 1,
-0.553945, -1.990889, -3.329892, 0.1921569, 1, 0, 1,
-0.5513757, -0.04435811, -1.138622, 0.1882353, 1, 0, 1,
-0.5512726, -0.4435935, -3.122381, 0.1803922, 1, 0, 1,
-0.5473791, -1.100123, -3.502246, 0.1764706, 1, 0, 1,
-0.5472693, 1.723545, -1.213696, 0.1686275, 1, 0, 1,
-0.546586, -0.07746772, -1.329695, 0.1647059, 1, 0, 1,
-0.5447518, 0.7191232, -0.8421011, 0.1568628, 1, 0, 1,
-0.5444627, 1.280931, 0.7139881, 0.1529412, 1, 0, 1,
-0.5432876, -0.133032, -2.699049, 0.145098, 1, 0, 1,
-0.5369775, -1.143349, -2.837856, 0.1411765, 1, 0, 1,
-0.5353914, -1.46459, -2.832541, 0.1333333, 1, 0, 1,
-0.5331738, 0.3463583, -0.9685808, 0.1294118, 1, 0, 1,
-0.532341, -0.6864333, -2.929514, 0.1215686, 1, 0, 1,
-0.5263041, -0.7086137, -3.994988, 0.1176471, 1, 0, 1,
-0.5248591, 0.2525719, -0.6138815, 0.1098039, 1, 0, 1,
-0.5128448, -0.5236709, -1.240235, 0.1058824, 1, 0, 1,
-0.5050831, -1.366853, -3.362189, 0.09803922, 1, 0, 1,
-0.5049298, -0.4271154, -1.326716, 0.09019608, 1, 0, 1,
-0.5047523, -0.9166084, -4.088247, 0.08627451, 1, 0, 1,
-0.5028589, -0.4102471, -0.7441025, 0.07843138, 1, 0, 1,
-0.4994398, 0.4702029, -0.7219729, 0.07450981, 1, 0, 1,
-0.4956443, 0.526036, -2.08428, 0.06666667, 1, 0, 1,
-0.4917094, -2.040024, -3.583629, 0.0627451, 1, 0, 1,
-0.4901474, 0.4165624, -0.09213394, 0.05490196, 1, 0, 1,
-0.4873126, -0.7803088, -3.123405, 0.05098039, 1, 0, 1,
-0.4859483, -0.03906943, -1.965603, 0.04313726, 1, 0, 1,
-0.4820785, 0.9067693, -1.458281, 0.03921569, 1, 0, 1,
-0.481075, -0.4805569, -2.785019, 0.03137255, 1, 0, 1,
-0.469641, 1.703054, 0.8815052, 0.02745098, 1, 0, 1,
-0.4637288, -1.005587, -1.900392, 0.01960784, 1, 0, 1,
-0.4625928, 0.253773, -0.8620463, 0.01568628, 1, 0, 1,
-0.4601641, -2.044342, -4.008195, 0.007843138, 1, 0, 1,
-0.459201, -1.064568, -0.6886488, 0.003921569, 1, 0, 1,
-0.4575354, -0.8861081, -3.259456, 0, 1, 0.003921569, 1,
-0.4571892, 0.3721924, -0.499165, 0, 1, 0.01176471, 1,
-0.456473, 1.753525, 0.3045541, 0, 1, 0.01568628, 1,
-0.44904, -0.4346451, -3.43352, 0, 1, 0.02352941, 1,
-0.4490358, -2.332507, -2.305595, 0, 1, 0.02745098, 1,
-0.443933, -1.059952, -1.787102, 0, 1, 0.03529412, 1,
-0.4431421, 1.460096, -1.461909, 0, 1, 0.03921569, 1,
-0.4387249, 0.1924957, -1.353459, 0, 1, 0.04705882, 1,
-0.4310574, 0.3325314, -0.1833156, 0, 1, 0.05098039, 1,
-0.4310262, -1.053298, -2.68806, 0, 1, 0.05882353, 1,
-0.4265698, 0.3338014, -0.7427784, 0, 1, 0.0627451, 1,
-0.4240081, 1.000826, 0.6104869, 0, 1, 0.07058824, 1,
-0.4189754, -1.011127, -2.515262, 0, 1, 0.07450981, 1,
-0.4183813, 0.9277881, 1.041605, 0, 1, 0.08235294, 1,
-0.4180504, -0.1376076, -3.525803, 0, 1, 0.08627451, 1,
-0.415203, 0.1434628, -0.6327552, 0, 1, 0.09411765, 1,
-0.4115894, 0.8485899, -0.1597556, 0, 1, 0.1019608, 1,
-0.4101667, -1.091361, -3.88142, 0, 1, 0.1058824, 1,
-0.4060277, -0.02344981, -1.675537, 0, 1, 0.1137255, 1,
-0.4019029, -0.3302854, -2.191138, 0, 1, 0.1176471, 1,
-0.3948378, 0.1635886, -1.988075, 0, 1, 0.1254902, 1,
-0.3928931, 0.1347276, 0.07988404, 0, 1, 0.1294118, 1,
-0.3914841, 1.241297, -0.7068725, 0, 1, 0.1372549, 1,
-0.387464, 0.1348529, -2.076414, 0, 1, 0.1411765, 1,
-0.3865678, 0.8922902, -1.433991, 0, 1, 0.1490196, 1,
-0.3737232, -0.7645765, -3.67391, 0, 1, 0.1529412, 1,
-0.3722908, 0.0792345, 0.04798907, 0, 1, 0.1607843, 1,
-0.3643721, 0.6237576, 1.275725, 0, 1, 0.1647059, 1,
-0.3586136, -1.80733, -1.211103, 0, 1, 0.172549, 1,
-0.3584621, 0.9051824, -1.13487, 0, 1, 0.1764706, 1,
-0.3571202, -0.572544, -3.263323, 0, 1, 0.1843137, 1,
-0.354513, 2.125107, 0.5632986, 0, 1, 0.1882353, 1,
-0.353664, 0.5112316, -1.051941, 0, 1, 0.1960784, 1,
-0.3523677, -1.195114, -3.869035, 0, 1, 0.2039216, 1,
-0.3489937, 0.4338437, -2.524703, 0, 1, 0.2078431, 1,
-0.3462421, 0.4518931, 0.4353613, 0, 1, 0.2156863, 1,
-0.3456255, 1.678239, -0.771639, 0, 1, 0.2196078, 1,
-0.3453327, -0.9475683, -2.265327, 0, 1, 0.227451, 1,
-0.3439592, -1.544099, -2.964027, 0, 1, 0.2313726, 1,
-0.3414605, -1.718436, -4.757913, 0, 1, 0.2392157, 1,
-0.3364884, 1.293786, -0.1939862, 0, 1, 0.2431373, 1,
-0.3353342, -1.648059, -2.214716, 0, 1, 0.2509804, 1,
-0.3345643, 0.6636949, -0.2530214, 0, 1, 0.254902, 1,
-0.3335854, -0.2367058, -3.438071, 0, 1, 0.2627451, 1,
-0.3312944, -1.007958, -2.524287, 0, 1, 0.2666667, 1,
-0.3256121, 0.3919812, -2.410042, 0, 1, 0.2745098, 1,
-0.324974, 0.3187102, 0.1053936, 0, 1, 0.2784314, 1,
-0.3244846, 0.5207531, -0.5693663, 0, 1, 0.2862745, 1,
-0.3243145, -0.3134601, -0.09640823, 0, 1, 0.2901961, 1,
-0.3218674, 0.345275, -0.7811555, 0, 1, 0.2980392, 1,
-0.3056823, 0.8255455, -0.04277362, 0, 1, 0.3058824, 1,
-0.3025962, -0.484715, -4.284714, 0, 1, 0.3098039, 1,
-0.3024334, 0.8123381, -1.102926, 0, 1, 0.3176471, 1,
-0.3005511, 0.380693, -1.67891, 0, 1, 0.3215686, 1,
-0.3005384, 1.984818, 1.714295, 0, 1, 0.3294118, 1,
-0.2982883, -0.6267258, -2.425899, 0, 1, 0.3333333, 1,
-0.2973031, 0.6775463, -0.3505253, 0, 1, 0.3411765, 1,
-0.2908508, 0.5246124, -0.8806647, 0, 1, 0.345098, 1,
-0.290376, -2.128893, -2.210392, 0, 1, 0.3529412, 1,
-0.2902144, -1.996427, -2.845834, 0, 1, 0.3568628, 1,
-0.2894068, -2.119809, -3.178644, 0, 1, 0.3647059, 1,
-0.2891253, 1.403445, -0.3312445, 0, 1, 0.3686275, 1,
-0.2831691, -0.2429067, -1.422256, 0, 1, 0.3764706, 1,
-0.2765136, 1.599884, -0.04780371, 0, 1, 0.3803922, 1,
-0.2762934, 0.1131828, -2.149307, 0, 1, 0.3882353, 1,
-0.2756955, -0.5229301, -2.327538, 0, 1, 0.3921569, 1,
-0.275158, 2.549158, -1.26804, 0, 1, 0.4, 1,
-0.2738785, 0.2057897, 0.06625358, 0, 1, 0.4078431, 1,
-0.2692439, -1.18757, -1.845307, 0, 1, 0.4117647, 1,
-0.2667253, 1.029636, -0.445912, 0, 1, 0.4196078, 1,
-0.2614988, -0.954061, -3.434165, 0, 1, 0.4235294, 1,
-0.2600064, -0.9284637, -2.961435, 0, 1, 0.4313726, 1,
-0.2573508, 0.279626, -0.2856464, 0, 1, 0.4352941, 1,
-0.2549776, -0.771406, -1.95804, 0, 1, 0.4431373, 1,
-0.2527591, 0.7926156, -0.8700605, 0, 1, 0.4470588, 1,
-0.2480357, -0.3525334, -2.14817, 0, 1, 0.454902, 1,
-0.2478047, 0.4525033, 0.2884528, 0, 1, 0.4588235, 1,
-0.2474726, -1.40799, -2.905364, 0, 1, 0.4666667, 1,
-0.2445978, -0.6264406, -1.746711, 0, 1, 0.4705882, 1,
-0.2441175, -1.034157, -2.829633, 0, 1, 0.4784314, 1,
-0.2438789, -0.4622239, -2.100731, 0, 1, 0.4823529, 1,
-0.2362047, 0.9824176, 0.7132878, 0, 1, 0.4901961, 1,
-0.2331465, 0.92553, -1.297263, 0, 1, 0.4941176, 1,
-0.2313855, 1.46486, 1.74353, 0, 1, 0.5019608, 1,
-0.2272267, -0.2604327, -2.750039, 0, 1, 0.509804, 1,
-0.2260317, 0.6889611, 0.9097371, 0, 1, 0.5137255, 1,
-0.2246026, -1.118875, -2.709106, 0, 1, 0.5215687, 1,
-0.2236927, 0.3993252, -0.1042737, 0, 1, 0.5254902, 1,
-0.2225726, 1.091599, -0.3780645, 0, 1, 0.5333334, 1,
-0.2223239, 0.2819897, -1.455038, 0, 1, 0.5372549, 1,
-0.2181567, 0.9419054, 1.565488, 0, 1, 0.5450981, 1,
-0.2178337, -0.793219, -1.72079, 0, 1, 0.5490196, 1,
-0.2141279, 0.5880923, 0.644753, 0, 1, 0.5568628, 1,
-0.2139292, -0.5566129, -2.374317, 0, 1, 0.5607843, 1,
-0.2093229, 0.2427696, -0.8238589, 0, 1, 0.5686275, 1,
-0.2043735, 1.155872, -0.3879977, 0, 1, 0.572549, 1,
-0.1990404, -0.4310294, -3.219954, 0, 1, 0.5803922, 1,
-0.1909349, 0.6263009, -2.4401, 0, 1, 0.5843138, 1,
-0.1901055, 1.771635, 0.5195863, 0, 1, 0.5921569, 1,
-0.1877324, -0.1678682, -1.855285, 0, 1, 0.5960785, 1,
-0.1782086, -0.6693186, -2.123348, 0, 1, 0.6039216, 1,
-0.1780807, -0.4232774, -4.2098, 0, 1, 0.6117647, 1,
-0.1757642, -0.8274572, -2.412632, 0, 1, 0.6156863, 1,
-0.1733815, 0.3578269, -2.088543, 0, 1, 0.6235294, 1,
-0.1586952, -2.036038, -3.056948, 0, 1, 0.627451, 1,
-0.1561801, 0.3130188, -0.438565, 0, 1, 0.6352941, 1,
-0.1537275, 0.8857242, 0.9110202, 0, 1, 0.6392157, 1,
-0.1481145, -1.462759, -3.126236, 0, 1, 0.6470588, 1,
-0.142107, -0.6741773, -2.150624, 0, 1, 0.6509804, 1,
-0.1420294, -0.1993233, -3.564856, 0, 1, 0.6588235, 1,
-0.1406923, -0.2692364, -2.924235, 0, 1, 0.6627451, 1,
-0.1395673, -1.248595, -3.290998, 0, 1, 0.6705883, 1,
-0.1394321, 0.4922053, 1.415268, 0, 1, 0.6745098, 1,
-0.1333313, -0.531238, -3.547668, 0, 1, 0.682353, 1,
-0.1322674, 1.308486, 1.819548, 0, 1, 0.6862745, 1,
-0.127095, -2.032125, -2.083676, 0, 1, 0.6941177, 1,
-0.1144425, -0.8313871, -2.759221, 0, 1, 0.7019608, 1,
-0.1138895, 0.8995341, 1.057711, 0, 1, 0.7058824, 1,
-0.1125907, 0.6520367, -0.9193109, 0, 1, 0.7137255, 1,
-0.1109281, 1.088006, -1.576547, 0, 1, 0.7176471, 1,
-0.1095809, 0.3284864, -1.936497, 0, 1, 0.7254902, 1,
-0.1009213, 1.052687, 0.7818393, 0, 1, 0.7294118, 1,
-0.1006953, 1.244972, 0.2958576, 0, 1, 0.7372549, 1,
-0.09907501, 0.6424517, 2.071308, 0, 1, 0.7411765, 1,
-0.09673725, -1.457641, -3.407423, 0, 1, 0.7490196, 1,
-0.09631179, -1.25531, -3.955274, 0, 1, 0.7529412, 1,
-0.09456377, 2.581568, 1.03628, 0, 1, 0.7607843, 1,
-0.09273461, -1.240398, -3.228674, 0, 1, 0.7647059, 1,
-0.09063371, 2.22876, -0.5013069, 0, 1, 0.772549, 1,
-0.08967866, 0.3978311, -0.8751011, 0, 1, 0.7764706, 1,
-0.08965123, -0.5972881, -1.248467, 0, 1, 0.7843137, 1,
-0.08884053, -0.8313535, -3.474358, 0, 1, 0.7882353, 1,
-0.0851727, 0.8446227, 1.242096, 0, 1, 0.7960784, 1,
-0.07860241, 0.1268445, 0.3742566, 0, 1, 0.8039216, 1,
-0.07844787, 0.4105464, -1.634881, 0, 1, 0.8078431, 1,
-0.06713216, 0.1514295, -2.942129, 0, 1, 0.8156863, 1,
-0.06361549, -0.8059999, -4.409218, 0, 1, 0.8196079, 1,
-0.06028081, -0.885934, -3.056871, 0, 1, 0.827451, 1,
-0.05659416, 1.15223, 0.2786578, 0, 1, 0.8313726, 1,
-0.05062345, 0.05922728, -1.427508, 0, 1, 0.8392157, 1,
-0.04940645, -0.6556901, -4.976056, 0, 1, 0.8431373, 1,
-0.04828644, 0.2639188, -0.4825586, 0, 1, 0.8509804, 1,
-0.04507903, -0.1604374, -1.728453, 0, 1, 0.854902, 1,
-0.02825588, -0.09605933, -2.501771, 0, 1, 0.8627451, 1,
-0.02511035, -0.4757665, -3.072062, 0, 1, 0.8666667, 1,
-0.02352102, 0.7114245, 0.1950685, 0, 1, 0.8745098, 1,
-0.02302709, -1.384324, -2.947155, 0, 1, 0.8784314, 1,
-0.01532228, -0.7451972, -2.839366, 0, 1, 0.8862745, 1,
-0.01521316, -1.848077, -3.314543, 0, 1, 0.8901961, 1,
-0.01058638, 0.04425662, -0.6959217, 0, 1, 0.8980392, 1,
-0.006998024, -0.7143335, -3.60157, 0, 1, 0.9058824, 1,
0.001607759, 0.1263667, 0.4646574, 0, 1, 0.9098039, 1,
0.00161001, -0.09785126, 2.428516, 0, 1, 0.9176471, 1,
0.003916651, -0.3508517, 3.756127, 0, 1, 0.9215686, 1,
0.007596972, -2.760618, 2.326012, 0, 1, 0.9294118, 1,
0.01524901, 0.4160486, -1.658689, 0, 1, 0.9333333, 1,
0.01678878, 0.9196234, 0.1035381, 0, 1, 0.9411765, 1,
0.02014878, 1.459278, 0.9961494, 0, 1, 0.945098, 1,
0.02059139, 0.7928542, -1.092713, 0, 1, 0.9529412, 1,
0.02066421, -1.592889, 2.230744, 0, 1, 0.9568627, 1,
0.02530219, -0.552191, 4.264833, 0, 1, 0.9647059, 1,
0.02557841, -0.5781116, 3.807466, 0, 1, 0.9686275, 1,
0.02726191, -1.904364, 2.395002, 0, 1, 0.9764706, 1,
0.0285065, 0.9549343, 0.007806768, 0, 1, 0.9803922, 1,
0.03348668, -0.498752, 4.260887, 0, 1, 0.9882353, 1,
0.03435279, -0.1899984, 5.156592, 0, 1, 0.9921569, 1,
0.03877999, 1.65252, -0.8105595, 0, 1, 1, 1,
0.04110286, 0.5736581, -0.2302071, 0, 0.9921569, 1, 1,
0.04378188, 1.051785, -0.6723415, 0, 0.9882353, 1, 1,
0.04432879, -0.3629793, 2.300505, 0, 0.9803922, 1, 1,
0.04864602, -1.002823, 3.241086, 0, 0.9764706, 1, 1,
0.05200636, -1.592615, 5.013383, 0, 0.9686275, 1, 1,
0.05387035, -0.4266362, 3.267334, 0, 0.9647059, 1, 1,
0.05516903, 0.7852957, 0.410504, 0, 0.9568627, 1, 1,
0.05606374, 1.582522, 1.941363, 0, 0.9529412, 1, 1,
0.0588979, 1.73049, 0.1962326, 0, 0.945098, 1, 1,
0.05977079, -0.4442799, 1.939309, 0, 0.9411765, 1, 1,
0.06080223, 1.762815, -0.6581331, 0, 0.9333333, 1, 1,
0.06725056, -0.5102692, 2.418, 0, 0.9294118, 1, 1,
0.06946263, 0.05127678, 0.9658421, 0, 0.9215686, 1, 1,
0.07257077, -0.3428476, 3.368788, 0, 0.9176471, 1, 1,
0.08014608, -0.1902863, 2.80446, 0, 0.9098039, 1, 1,
0.08042535, 0.9539464, -0.6154789, 0, 0.9058824, 1, 1,
0.08088592, 1.803561, 0.9093501, 0, 0.8980392, 1, 1,
0.0844241, -0.995558, 2.528167, 0, 0.8901961, 1, 1,
0.0856615, -0.6980301, 5.105388, 0, 0.8862745, 1, 1,
0.08816369, 0.8697832, 0.7522591, 0, 0.8784314, 1, 1,
0.08831556, -0.04937769, 1.814239, 0, 0.8745098, 1, 1,
0.08957162, 1.553135, -0.7202038, 0, 0.8666667, 1, 1,
0.09122722, -0.2659414, 2.635096, 0, 0.8627451, 1, 1,
0.0915657, 0.2548455, -0.4175655, 0, 0.854902, 1, 1,
0.09232581, -1.406137, 3.682634, 0, 0.8509804, 1, 1,
0.09454096, 0.05591009, 1.398405, 0, 0.8431373, 1, 1,
0.09743759, 1.664024, -0.2249299, 0, 0.8392157, 1, 1,
0.1002642, 1.4136, 0.5321935, 0, 0.8313726, 1, 1,
0.1012587, -0.157844, 2.256296, 0, 0.827451, 1, 1,
0.1103936, 0.7974608, -0.254411, 0, 0.8196079, 1, 1,
0.113771, 0.3271961, -0.561996, 0, 0.8156863, 1, 1,
0.1138516, -0.1955569, 2.533086, 0, 0.8078431, 1, 1,
0.1156009, -0.4624467, 2.241359, 0, 0.8039216, 1, 1,
0.12008, 0.1180156, 0.5214046, 0, 0.7960784, 1, 1,
0.1248871, 1.137892, -0.05342968, 0, 0.7882353, 1, 1,
0.1259473, -1.522476, 1.881421, 0, 0.7843137, 1, 1,
0.1264492, -0.06888511, 2.094564, 0, 0.7764706, 1, 1,
0.1341242, -0.9190328, 3.114493, 0, 0.772549, 1, 1,
0.1342095, -0.1330737, 0.7999493, 0, 0.7647059, 1, 1,
0.1388729, -0.8073739, 2.771327, 0, 0.7607843, 1, 1,
0.1452341, -0.1854833, 1.395225, 0, 0.7529412, 1, 1,
0.1491237, -0.4178505, 1.670029, 0, 0.7490196, 1, 1,
0.1516415, -0.6445954, 1.84377, 0, 0.7411765, 1, 1,
0.1543753, 0.4195961, 1.557632, 0, 0.7372549, 1, 1,
0.157926, 0.2405292, 1.010761, 0, 0.7294118, 1, 1,
0.1585104, 1.01763, -1.155535, 0, 0.7254902, 1, 1,
0.1608077, -1.174566, 2.459231, 0, 0.7176471, 1, 1,
0.1663406, 0.4875339, 0.4916451, 0, 0.7137255, 1, 1,
0.1668732, 0.5167155, 0.7264091, 0, 0.7058824, 1, 1,
0.1687244, -1.74465, 3.1274, 0, 0.6980392, 1, 1,
0.1687653, 1.379012, -0.2497027, 0, 0.6941177, 1, 1,
0.1770849, 0.01100278, -1.000262, 0, 0.6862745, 1, 1,
0.1874115, 1.149859, -0.8220935, 0, 0.682353, 1, 1,
0.1876798, -0.06319613, 2.423886, 0, 0.6745098, 1, 1,
0.1879499, 0.06979865, 0.4094802, 0, 0.6705883, 1, 1,
0.1886469, 0.1997157, 0.3692538, 0, 0.6627451, 1, 1,
0.1893228, 0.3218627, 2.415387, 0, 0.6588235, 1, 1,
0.1973705, 2.213061, 0.3804632, 0, 0.6509804, 1, 1,
0.1973795, 1.326174, -0.3138413, 0, 0.6470588, 1, 1,
0.200004, -0.9044905, 3.531799, 0, 0.6392157, 1, 1,
0.2057925, 0.8080574, -0.4283777, 0, 0.6352941, 1, 1,
0.2058201, 1.578509, -0.3488049, 0, 0.627451, 1, 1,
0.2141481, 0.846898, -1.348918, 0, 0.6235294, 1, 1,
0.2176171, 0.5217543, 0.5980387, 0, 0.6156863, 1, 1,
0.2199893, -0.5422927, 3.312966, 0, 0.6117647, 1, 1,
0.2216301, 0.9408358, 0.864826, 0, 0.6039216, 1, 1,
0.2229154, 2.005802, 0.1507664, 0, 0.5960785, 1, 1,
0.2230274, 1.730268, 0.19212, 0, 0.5921569, 1, 1,
0.2232045, -1.013775, 2.701296, 0, 0.5843138, 1, 1,
0.2302393, -0.4041093, 3.971631, 0, 0.5803922, 1, 1,
0.2312825, 1.14818, 0.714346, 0, 0.572549, 1, 1,
0.2324879, 0.3328719, 0.8125944, 0, 0.5686275, 1, 1,
0.2339924, -0.07924727, 4.074053, 0, 0.5607843, 1, 1,
0.2351539, 0.3056988, 1.327849, 0, 0.5568628, 1, 1,
0.2384173, 0.6547332, 0.8116161, 0, 0.5490196, 1, 1,
0.2405763, -0.9372744, 3.063117, 0, 0.5450981, 1, 1,
0.2410083, -0.009245795, 1.670932, 0, 0.5372549, 1, 1,
0.2418915, -0.979123, 3.645785, 0, 0.5333334, 1, 1,
0.2463464, 0.3765296, -0.4448968, 0, 0.5254902, 1, 1,
0.2467775, -0.6931509, 3.189974, 0, 0.5215687, 1, 1,
0.2521651, 0.3480856, -0.3526471, 0, 0.5137255, 1, 1,
0.2538003, -0.5926176, 2.321417, 0, 0.509804, 1, 1,
0.2608145, -2.343152, 2.898863, 0, 0.5019608, 1, 1,
0.26083, 0.001563058, 3.933862, 0, 0.4941176, 1, 1,
0.2645123, 0.9442906, 0.3964798, 0, 0.4901961, 1, 1,
0.2668502, 1.764692, 0.2836264, 0, 0.4823529, 1, 1,
0.2676438, 0.5743197, -0.09011713, 0, 0.4784314, 1, 1,
0.2682128, -2.142316, 2.081835, 0, 0.4705882, 1, 1,
0.2689259, 0.5258475, 1.782875, 0, 0.4666667, 1, 1,
0.274609, -1.741166, 4.409556, 0, 0.4588235, 1, 1,
0.2837904, -2.163539, 4.133754, 0, 0.454902, 1, 1,
0.2848077, 0.4687345, 1.85432, 0, 0.4470588, 1, 1,
0.2855825, -0.5624714, 2.58166, 0, 0.4431373, 1, 1,
0.287082, 0.5297897, -0.3703265, 0, 0.4352941, 1, 1,
0.2906365, -1.527088, 3.559808, 0, 0.4313726, 1, 1,
0.2907192, -2.875441, 2.794443, 0, 0.4235294, 1, 1,
0.293213, -0.8122704, 4.266492, 0, 0.4196078, 1, 1,
0.2934191, 1.134186, -1.03281, 0, 0.4117647, 1, 1,
0.2967169, 0.6746601, -0.2257123, 0, 0.4078431, 1, 1,
0.3074105, 0.1953769, 1.2971, 0, 0.4, 1, 1,
0.3110418, 0.9849361, 1.621109, 0, 0.3921569, 1, 1,
0.3121358, 0.3898398, 0.5022676, 0, 0.3882353, 1, 1,
0.3175285, -1.233893, 3.849823, 0, 0.3803922, 1, 1,
0.3214644, -0.616178, 2.55533, 0, 0.3764706, 1, 1,
0.324752, -0.3208611, 1.138366, 0, 0.3686275, 1, 1,
0.325109, 0.3104208, 1.057891, 0, 0.3647059, 1, 1,
0.3297612, -0.5021843, 1.899341, 0, 0.3568628, 1, 1,
0.3301988, 1.202965, 1.06794, 0, 0.3529412, 1, 1,
0.3311202, -0.4522487, 1.420597, 0, 0.345098, 1, 1,
0.3349109, -0.7626444, 1.238193, 0, 0.3411765, 1, 1,
0.3442855, -1.181367, 2.116305, 0, 0.3333333, 1, 1,
0.3466442, 1.187454, 0.2106153, 0, 0.3294118, 1, 1,
0.3483186, -0.7566016, 3.204829, 0, 0.3215686, 1, 1,
0.3491417, -0.1634663, 0.9960092, 0, 0.3176471, 1, 1,
0.3561584, 0.791607, -0.01086225, 0, 0.3098039, 1, 1,
0.3634351, -0.7655472, 3.870529, 0, 0.3058824, 1, 1,
0.3635437, 1.453514, 0.741922, 0, 0.2980392, 1, 1,
0.3667452, 0.3359076, -0.1463111, 0, 0.2901961, 1, 1,
0.3667517, 1.08828, 1.140669, 0, 0.2862745, 1, 1,
0.367351, -0.6851175, 2.890332, 0, 0.2784314, 1, 1,
0.372295, -0.1232744, 1.6253, 0, 0.2745098, 1, 1,
0.376824, -1.234681, 3.351191, 0, 0.2666667, 1, 1,
0.379711, -1.046578, 1.261329, 0, 0.2627451, 1, 1,
0.3802447, -0.8587271, 3.13245, 0, 0.254902, 1, 1,
0.3849123, 0.09660844, -0.007510284, 0, 0.2509804, 1, 1,
0.3874267, 0.5132098, 0.8506517, 0, 0.2431373, 1, 1,
0.3892873, -1.00719, 2.969386, 0, 0.2392157, 1, 1,
0.3981, 0.7524238, 0.8437538, 0, 0.2313726, 1, 1,
0.4035629, -0.6222017, 1.257244, 0, 0.227451, 1, 1,
0.4060516, 0.3874267, 1.01863, 0, 0.2196078, 1, 1,
0.4063382, 1.680848, -0.08163907, 0, 0.2156863, 1, 1,
0.4066039, 0.9806184, 0.5753657, 0, 0.2078431, 1, 1,
0.4072196, -0.5196605, 4.681101, 0, 0.2039216, 1, 1,
0.4082727, -0.3221039, 2.68229, 0, 0.1960784, 1, 1,
0.4101478, 0.6845372, -0.3812017, 0, 0.1882353, 1, 1,
0.4139101, -0.4674087, 2.054921, 0, 0.1843137, 1, 1,
0.4151713, -0.2503618, 2.083342, 0, 0.1764706, 1, 1,
0.4157917, 0.6148725, -0.8860053, 0, 0.172549, 1, 1,
0.4169565, 1.317131, 1.408428, 0, 0.1647059, 1, 1,
0.4178267, -1.521379, 2.610821, 0, 0.1607843, 1, 1,
0.4212884, -0.3570739, 4.006675, 0, 0.1529412, 1, 1,
0.4238002, 0.8253584, -0.8141888, 0, 0.1490196, 1, 1,
0.4280494, 0.9179003, 0.5492873, 0, 0.1411765, 1, 1,
0.4347282, -1.702968, 1.673384, 0, 0.1372549, 1, 1,
0.435519, -0.6537525, 1.105508, 0, 0.1294118, 1, 1,
0.435862, 0.08005475, -0.02522443, 0, 0.1254902, 1, 1,
0.4407987, -0.3002823, 1.56584, 0, 0.1176471, 1, 1,
0.4525698, 1.817606, -1.360156, 0, 0.1137255, 1, 1,
0.453355, 0.2404116, 1.279995, 0, 0.1058824, 1, 1,
0.4671494, -0.6678724, 1.929181, 0, 0.09803922, 1, 1,
0.4681564, -0.1414462, 2.906631, 0, 0.09411765, 1, 1,
0.4760564, -0.05556664, 0.5294995, 0, 0.08627451, 1, 1,
0.4763827, 0.03109748, 1.46423, 0, 0.08235294, 1, 1,
0.4774809, -0.4669781, 0.3050274, 0, 0.07450981, 1, 1,
0.4788627, -0.6174714, 4.517568, 0, 0.07058824, 1, 1,
0.4828686, 0.5386292, -0.1122166, 0, 0.0627451, 1, 1,
0.483415, -0.9299487, 2.558985, 0, 0.05882353, 1, 1,
0.4843182, -0.8734184, 3.585967, 0, 0.05098039, 1, 1,
0.4881651, -1.346873, 1.511317, 0, 0.04705882, 1, 1,
0.4905322, -0.4899091, 1.49694, 0, 0.03921569, 1, 1,
0.4913949, -1.053695, 2.231781, 0, 0.03529412, 1, 1,
0.4928829, 0.3964001, 0.7146674, 0, 0.02745098, 1, 1,
0.4954274, -3.303493, 4.632946, 0, 0.02352941, 1, 1,
0.4954906, -1.144051, 2.971507, 0, 0.01568628, 1, 1,
0.5046071, -0.5743821, 3.748458, 0, 0.01176471, 1, 1,
0.505066, 0.768414, 2.013041, 0, 0.003921569, 1, 1,
0.5053908, -0.3254567, -0.6248603, 0.003921569, 0, 1, 1,
0.5092665, 0.05655584, 0.2612239, 0.007843138, 0, 1, 1,
0.5118999, 0.8193775, 0.229725, 0.01568628, 0, 1, 1,
0.5143026, -0.7258877, 2.258153, 0.01960784, 0, 1, 1,
0.5149161, -0.2759894, 3.208086, 0.02745098, 0, 1, 1,
0.5156505, -0.8330563, 2.776943, 0.03137255, 0, 1, 1,
0.5186371, 0.3522262, 1.360695, 0.03921569, 0, 1, 1,
0.5192489, 0.464733, 2.177272, 0.04313726, 0, 1, 1,
0.5202037, -0.3837225, 4.800794, 0.05098039, 0, 1, 1,
0.5245003, 0.837799, -0.1342021, 0.05490196, 0, 1, 1,
0.5278475, -0.04491855, 1.947438, 0.0627451, 0, 1, 1,
0.5281678, -0.1402437, 1.62162, 0.06666667, 0, 1, 1,
0.5282782, 0.01850817, 1.607009, 0.07450981, 0, 1, 1,
0.532494, 0.7248242, 0.1095754, 0.07843138, 0, 1, 1,
0.5324979, -0.881595, 0.1165649, 0.08627451, 0, 1, 1,
0.5336438, 0.2564376, 2.175881, 0.09019608, 0, 1, 1,
0.5340026, -0.804163, 1.560446, 0.09803922, 0, 1, 1,
0.5393946, -2.008854, 1.253923, 0.1058824, 0, 1, 1,
0.5416933, 1.400965, 1.337561, 0.1098039, 0, 1, 1,
0.5422628, 0.4402418, -0.4409285, 0.1176471, 0, 1, 1,
0.5443005, 0.3394804, 0.6269351, 0.1215686, 0, 1, 1,
0.546285, -0.09594643, 2.492017, 0.1294118, 0, 1, 1,
0.5553485, -0.3867617, 2.678827, 0.1333333, 0, 1, 1,
0.5604761, 0.8457795, 2.057312, 0.1411765, 0, 1, 1,
0.5618979, 0.6190862, 1.745842, 0.145098, 0, 1, 1,
0.5692223, 0.06948253, 0.3942505, 0.1529412, 0, 1, 1,
0.5734627, 0.04241387, 0.4775749, 0.1568628, 0, 1, 1,
0.5748907, 0.4945724, 3.089594, 0.1647059, 0, 1, 1,
0.5770016, -0.1900118, 2.15166, 0.1686275, 0, 1, 1,
0.5772933, -0.4679881, 2.877197, 0.1764706, 0, 1, 1,
0.5782539, 1.850254, -1.261896, 0.1803922, 0, 1, 1,
0.5820113, 0.6294488, 1.603548, 0.1882353, 0, 1, 1,
0.5849444, 0.3422474, 1.019947, 0.1921569, 0, 1, 1,
0.5946493, -0.4572939, 3.132868, 0.2, 0, 1, 1,
0.5975649, -0.1993666, 2.658481, 0.2078431, 0, 1, 1,
0.6007534, -0.571757, 3.127163, 0.2117647, 0, 1, 1,
0.6098823, -1.074172, 3.112081, 0.2196078, 0, 1, 1,
0.6104493, -0.7654889, 2.842351, 0.2235294, 0, 1, 1,
0.6152866, -0.501863, 2.595986, 0.2313726, 0, 1, 1,
0.6158686, -0.4072447, 3.262422, 0.2352941, 0, 1, 1,
0.6207214, -0.06800363, 2.295438, 0.2431373, 0, 1, 1,
0.621123, -0.5024061, 2.091877, 0.2470588, 0, 1, 1,
0.6222627, -1.612951, 1.463944, 0.254902, 0, 1, 1,
0.6248481, 0.662057, 1.076122, 0.2588235, 0, 1, 1,
0.6264111, 0.7165271, 2.023545, 0.2666667, 0, 1, 1,
0.6290537, 0.01171487, 1.301694, 0.2705882, 0, 1, 1,
0.6356323, -1.057059, 2.936105, 0.2784314, 0, 1, 1,
0.6372659, -0.2604357, 3.3101, 0.282353, 0, 1, 1,
0.6418888, -0.5391611, 4.623988, 0.2901961, 0, 1, 1,
0.6432471, 0.5928162, 1.176008, 0.2941177, 0, 1, 1,
0.6482212, -1.067508, 3.581421, 0.3019608, 0, 1, 1,
0.6493163, 1.066952, 2.676867, 0.3098039, 0, 1, 1,
0.6568292, 0.4857363, 1.372195, 0.3137255, 0, 1, 1,
0.6658702, 1.009439, 1.033069, 0.3215686, 0, 1, 1,
0.6658729, -0.2099852, -0.5966241, 0.3254902, 0, 1, 1,
0.6667594, 1.024825, -0.07141376, 0.3333333, 0, 1, 1,
0.6678275, -0.2559865, 0.4745755, 0.3372549, 0, 1, 1,
0.6679914, 2.301904, 0.5582939, 0.345098, 0, 1, 1,
0.6749904, -1.041738, 0.4357829, 0.3490196, 0, 1, 1,
0.6773617, 0.2095539, 1.033012, 0.3568628, 0, 1, 1,
0.6822686, 1.427847, 0.7937842, 0.3607843, 0, 1, 1,
0.6839257, -1.259976, 2.032658, 0.3686275, 0, 1, 1,
0.6861078, -0.1923745, 1.954, 0.372549, 0, 1, 1,
0.6864901, 0.8318542, -0.485548, 0.3803922, 0, 1, 1,
0.6879494, -0.5640043, 1.164191, 0.3843137, 0, 1, 1,
0.6953737, -0.6429149, 3.674504, 0.3921569, 0, 1, 1,
0.6954424, -0.102857, -0.1522629, 0.3960784, 0, 1, 1,
0.6955669, 0.6870936, 0.3859085, 0.4039216, 0, 1, 1,
0.7018238, 0.5170118, 1.609045, 0.4117647, 0, 1, 1,
0.7028798, -0.7449026, 2.997537, 0.4156863, 0, 1, 1,
0.7054852, 0.6281258, -1.341116, 0.4235294, 0, 1, 1,
0.7068251, -0.3527806, 1.636848, 0.427451, 0, 1, 1,
0.7111888, -0.3644688, 2.823755, 0.4352941, 0, 1, 1,
0.7193255, -0.8001426, 1.232877, 0.4392157, 0, 1, 1,
0.7220786, -0.8748074, 4.168723, 0.4470588, 0, 1, 1,
0.7265272, 0.1246091, 2.857644, 0.4509804, 0, 1, 1,
0.727283, 1.991955, 0.7710944, 0.4588235, 0, 1, 1,
0.727421, -0.2413403, 2.022943, 0.4627451, 0, 1, 1,
0.7317717, -1.662698, 1.528027, 0.4705882, 0, 1, 1,
0.7339866, 0.72891, -0.1507391, 0.4745098, 0, 1, 1,
0.7414727, 0.8222904, -0.0003476474, 0.4823529, 0, 1, 1,
0.7430736, -0.3291545, 1.249484, 0.4862745, 0, 1, 1,
0.7504448, 1.242056, -1.57088, 0.4941176, 0, 1, 1,
0.7511886, -0.3198805, 1.668369, 0.5019608, 0, 1, 1,
0.7523366, 1.079465, 0.04417522, 0.5058824, 0, 1, 1,
0.7573759, -0.4527124, 3.295858, 0.5137255, 0, 1, 1,
0.7585335, -0.3068328, 0.4035608, 0.5176471, 0, 1, 1,
0.7589045, 0.6055651, 0.03804529, 0.5254902, 0, 1, 1,
0.7595277, 0.7732818, 0.2523619, 0.5294118, 0, 1, 1,
0.7625327, 0.1068899, 1.147117, 0.5372549, 0, 1, 1,
0.7635249, 0.8052286, 1.119997, 0.5411765, 0, 1, 1,
0.769142, -0.5869762, 4.182339, 0.5490196, 0, 1, 1,
0.7710184, -0.4645995, 2.750112, 0.5529412, 0, 1, 1,
0.771025, -0.3250895, 2.372405, 0.5607843, 0, 1, 1,
0.7747437, 0.4873737, 1.815884, 0.5647059, 0, 1, 1,
0.7782749, -0.396777, 0.6292399, 0.572549, 0, 1, 1,
0.7828258, 0.111503, 1.274383, 0.5764706, 0, 1, 1,
0.7861782, 0.6069318, 1.525715, 0.5843138, 0, 1, 1,
0.7884643, 2.071171, 1.566318, 0.5882353, 0, 1, 1,
0.7921014, 0.0156048, -1.318957, 0.5960785, 0, 1, 1,
0.7930831, 0.4848006, 2.143682, 0.6039216, 0, 1, 1,
0.8003169, 0.4155621, 2.277728, 0.6078432, 0, 1, 1,
0.8008718, 0.5098166, 0.6762177, 0.6156863, 0, 1, 1,
0.8026771, -1.482741, 2.66427, 0.6196079, 0, 1, 1,
0.8029138, 0.6132963, 0.3853069, 0.627451, 0, 1, 1,
0.8090924, 0.1016761, 0.4874536, 0.6313726, 0, 1, 1,
0.8112783, 0.6884032, 1.293218, 0.6392157, 0, 1, 1,
0.8130426, 2.13915, -0.4429383, 0.6431373, 0, 1, 1,
0.8153119, -1.354154, 1.833292, 0.6509804, 0, 1, 1,
0.8154697, 0.158446, 0.9672854, 0.654902, 0, 1, 1,
0.8172598, 0.9359924, 3.02406, 0.6627451, 0, 1, 1,
0.8174039, 0.4237373, 3.695254, 0.6666667, 0, 1, 1,
0.8240434, -2.556619, 4.196037, 0.6745098, 0, 1, 1,
0.8253158, 0.08598188, 0.8711217, 0.6784314, 0, 1, 1,
0.8291709, -0.4167479, 3.950692, 0.6862745, 0, 1, 1,
0.8325648, -0.7278559, 2.09604, 0.6901961, 0, 1, 1,
0.8339549, -1.369233, 3.178279, 0.6980392, 0, 1, 1,
0.8348342, -1.523441, 2.832492, 0.7058824, 0, 1, 1,
0.8365925, 0.2401756, 0.920989, 0.7098039, 0, 1, 1,
0.8379494, -0.8867531, 1.503928, 0.7176471, 0, 1, 1,
0.8380339, -1.263768, 4.110072, 0.7215686, 0, 1, 1,
0.8392208, -0.3333937, 1.122573, 0.7294118, 0, 1, 1,
0.8394263, -0.5030519, 3.71155, 0.7333333, 0, 1, 1,
0.8405081, 1.3233, 0.7110165, 0.7411765, 0, 1, 1,
0.8410681, 1.224956, 1.852045, 0.7450981, 0, 1, 1,
0.8421899, 0.2448304, -0.03239346, 0.7529412, 0, 1, 1,
0.842995, 0.1230194, 0.1166245, 0.7568628, 0, 1, 1,
0.8446924, 0.2395717, 1.104354, 0.7647059, 0, 1, 1,
0.8462625, -0.7772436, 2.489748, 0.7686275, 0, 1, 1,
0.8491451, 1.427189, 1.539822, 0.7764706, 0, 1, 1,
0.8511965, -0.6550483, 2.658559, 0.7803922, 0, 1, 1,
0.8526014, 2.469043, 0.1745485, 0.7882353, 0, 1, 1,
0.8534601, 0.5750168, 0.02263542, 0.7921569, 0, 1, 1,
0.8538449, -0.3955495, 2.062651, 0.8, 0, 1, 1,
0.8562471, 0.02388799, 1.334014, 0.8078431, 0, 1, 1,
0.8567119, 0.5487233, 1.524681, 0.8117647, 0, 1, 1,
0.8598202, -0.710088, 3.047623, 0.8196079, 0, 1, 1,
0.8629507, 0.3829364, 1.444252, 0.8235294, 0, 1, 1,
0.8662488, -0.1094591, 1.585374, 0.8313726, 0, 1, 1,
0.8679233, 0.6354765, 2.409238, 0.8352941, 0, 1, 1,
0.8693414, 0.9095931, 0.9531986, 0.8431373, 0, 1, 1,
0.8765609, -0.2631905, 2.397589, 0.8470588, 0, 1, 1,
0.8817489, 0.3924685, 1.073174, 0.854902, 0, 1, 1,
0.8915579, -1.587996, 2.314418, 0.8588235, 0, 1, 1,
0.8926078, 1.243042, 1.2474, 0.8666667, 0, 1, 1,
0.8967806, 0.309036, 0.4370568, 0.8705882, 0, 1, 1,
0.9055285, 0.1102128, 2.944421, 0.8784314, 0, 1, 1,
0.9055808, -0.4332408, 4.507623, 0.8823529, 0, 1, 1,
0.9118704, 2.683168, -0.7577438, 0.8901961, 0, 1, 1,
0.9184594, -0.9686865, 1.16399, 0.8941177, 0, 1, 1,
0.9234877, 0.2142935, 0.3069401, 0.9019608, 0, 1, 1,
0.9241785, -1.233479, 3.750411, 0.9098039, 0, 1, 1,
0.9248915, -0.9722131, 2.196807, 0.9137255, 0, 1, 1,
0.9281105, 0.8627827, 1.610237, 0.9215686, 0, 1, 1,
0.9282202, -3.215312, 2.659301, 0.9254902, 0, 1, 1,
0.931325, -0.4932702, 2.345689, 0.9333333, 0, 1, 1,
0.9334336, -1.077091, 3.187349, 0.9372549, 0, 1, 1,
0.9471726, 0.7948927, 1.112605, 0.945098, 0, 1, 1,
0.9475902, 0.9322531, -0.570773, 0.9490196, 0, 1, 1,
0.9478637, -1.186228, 0.9398497, 0.9568627, 0, 1, 1,
0.953743, 0.3100704, 1.626446, 0.9607843, 0, 1, 1,
0.9584431, 0.02379432, 1.992355, 0.9686275, 0, 1, 1,
0.9614331, 1.339587, 0.7346976, 0.972549, 0, 1, 1,
0.9627045, 0.1720661, 0.397802, 0.9803922, 0, 1, 1,
0.964924, 1.434533, -1.406877, 0.9843137, 0, 1, 1,
0.9666659, 1.437901, 1.052055, 0.9921569, 0, 1, 1,
0.9668354, -0.7535968, 2.59223, 0.9960784, 0, 1, 1,
0.9772041, 1.340234, 0.9814228, 1, 0, 0.9960784, 1,
0.9790425, 0.747512, 2.23626, 1, 0, 0.9882353, 1,
0.9806058, -0.6768853, 2.407569, 1, 0, 0.9843137, 1,
0.9832966, 1.704462, -0.9758302, 1, 0, 0.9764706, 1,
0.9868097, -1.632626, 0.7427433, 1, 0, 0.972549, 1,
1.005036, 0.75467, 1.609661, 1, 0, 0.9647059, 1,
1.008296, -0.4206478, 3.580551, 1, 0, 0.9607843, 1,
1.009288, -0.7799288, 4.026373, 1, 0, 0.9529412, 1,
1.018361, 0.2793193, 0.2216003, 1, 0, 0.9490196, 1,
1.02189, 1.306063, 0.6698295, 1, 0, 0.9411765, 1,
1.02479, 0.9091704, 1.083771, 1, 0, 0.9372549, 1,
1.026624, 0.2932036, 1.821815, 1, 0, 0.9294118, 1,
1.037923, 1.476072, 2.36013, 1, 0, 0.9254902, 1,
1.054391, -1.003172, 2.896063, 1, 0, 0.9176471, 1,
1.055791, 0.8975471, -1.572494, 1, 0, 0.9137255, 1,
1.058848, -0.9457312, 2.40013, 1, 0, 0.9058824, 1,
1.059424, -0.09688368, -1.88787, 1, 0, 0.9019608, 1,
1.068336, 0.9865066, 2.721635, 1, 0, 0.8941177, 1,
1.071356, 0.0350429, 2.622282, 1, 0, 0.8862745, 1,
1.074285, -0.1880878, 1.742518, 1, 0, 0.8823529, 1,
1.076174, -1.461755, 2.806395, 1, 0, 0.8745098, 1,
1.077286, -1.584799, 3.734335, 1, 0, 0.8705882, 1,
1.078943, -1.754239, 2.080041, 1, 0, 0.8627451, 1,
1.079007, 0.05645344, 0.5632647, 1, 0, 0.8588235, 1,
1.081677, 0.8995941, 0.2609031, 1, 0, 0.8509804, 1,
1.084237, -0.6031088, 2.373378, 1, 0, 0.8470588, 1,
1.088753, -0.9191659, 3.199813, 1, 0, 0.8392157, 1,
1.103458, 2.182524, 0.5049685, 1, 0, 0.8352941, 1,
1.104686, -0.7047638, 1.017729, 1, 0, 0.827451, 1,
1.105714, 0.6662132, 2.188791, 1, 0, 0.8235294, 1,
1.106825, -0.2044001, 1.081156, 1, 0, 0.8156863, 1,
1.108576, -0.1195376, 2.354223, 1, 0, 0.8117647, 1,
1.110811, -0.3534827, 2.198545, 1, 0, 0.8039216, 1,
1.112873, 0.3137102, 1.56125, 1, 0, 0.7960784, 1,
1.114058, -2.333648, 2.472169, 1, 0, 0.7921569, 1,
1.114344, -0.6833292, 2.566135, 1, 0, 0.7843137, 1,
1.123906, -0.7862204, 3.619923, 1, 0, 0.7803922, 1,
1.128983, -1.827819, 2.073867, 1, 0, 0.772549, 1,
1.129335, 1.36894, 0.666856, 1, 0, 0.7686275, 1,
1.143507, 0.4683515, 1.882882, 1, 0, 0.7607843, 1,
1.146187, -0.4897819, 1.161439, 1, 0, 0.7568628, 1,
1.150095, 0.08319677, 2.392167, 1, 0, 0.7490196, 1,
1.162048, 0.3454914, -0.4696622, 1, 0, 0.7450981, 1,
1.168689, 0.4102081, 3.132672, 1, 0, 0.7372549, 1,
1.17002, -0.5538814, 3.074517, 1, 0, 0.7333333, 1,
1.170161, 0.129519, 2.291651, 1, 0, 0.7254902, 1,
1.170652, 0.9032961, -1.601579, 1, 0, 0.7215686, 1,
1.176091, 0.3963523, 2.32415, 1, 0, 0.7137255, 1,
1.18841, -0.881138, 1.699993, 1, 0, 0.7098039, 1,
1.190908, 0.3334133, 2.844323, 1, 0, 0.7019608, 1,
1.195316, 0.585075, 0.7248088, 1, 0, 0.6941177, 1,
1.198994, 1.93099, 0.2474521, 1, 0, 0.6901961, 1,
1.200387, -0.4102885, 3.260517, 1, 0, 0.682353, 1,
1.204784, 0.7111928, 1.920424, 1, 0, 0.6784314, 1,
1.214327, -0.836713, 2.006598, 1, 0, 0.6705883, 1,
1.215253, -0.5511024, 3.089921, 1, 0, 0.6666667, 1,
1.220023, -0.2742057, 2.205686, 1, 0, 0.6588235, 1,
1.220889, -0.007416614, 0.2149529, 1, 0, 0.654902, 1,
1.221948, 0.2105055, 0.2144402, 1, 0, 0.6470588, 1,
1.230267, -0.4290919, 0.8376009, 1, 0, 0.6431373, 1,
1.233841, -1.163392, 1.41459, 1, 0, 0.6352941, 1,
1.235393, -2.556766, 2.751618, 1, 0, 0.6313726, 1,
1.236001, 0.8533095, 1.858942, 1, 0, 0.6235294, 1,
1.237955, -1.054587, 1.328794, 1, 0, 0.6196079, 1,
1.243847, -1.149012, 1.95181, 1, 0, 0.6117647, 1,
1.244365, -0.397544, 0.9474185, 1, 0, 0.6078432, 1,
1.251318, 0.3618131, 1.43142, 1, 0, 0.6, 1,
1.251883, -0.8757959, 2.347468, 1, 0, 0.5921569, 1,
1.264301, 1.815287, -0.6161233, 1, 0, 0.5882353, 1,
1.269391, -0.7013167, 3.028654, 1, 0, 0.5803922, 1,
1.279286, 1.637059, -1.579008, 1, 0, 0.5764706, 1,
1.303488, -0.1995107, 2.502097, 1, 0, 0.5686275, 1,
1.304197, 0.555329, 1.186209, 1, 0, 0.5647059, 1,
1.319511, 1.067406, -1.037685, 1, 0, 0.5568628, 1,
1.325793, -1.02194, 0.7530044, 1, 0, 0.5529412, 1,
1.339382, 1.538463, 2.230066, 1, 0, 0.5450981, 1,
1.342941, 0.7708421, 0.9923967, 1, 0, 0.5411765, 1,
1.371994, 1.48009, 1.164106, 1, 0, 0.5333334, 1,
1.382973, 1.391369, 2.642496, 1, 0, 0.5294118, 1,
1.384563, 1.20382, 1.905385, 1, 0, 0.5215687, 1,
1.38507, 1.237782, 1.844329, 1, 0, 0.5176471, 1,
1.399574, -0.3409258, 0.6171204, 1, 0, 0.509804, 1,
1.401264, 0.8150709, 0.277176, 1, 0, 0.5058824, 1,
1.401681, 0.1455111, 1.486525, 1, 0, 0.4980392, 1,
1.402546, 0.1244761, 2.726689, 1, 0, 0.4901961, 1,
1.438262, -1.418751, 3.97387, 1, 0, 0.4862745, 1,
1.440871, 1.661674, 1.008437, 1, 0, 0.4784314, 1,
1.452537, 1.417647, 0.9354396, 1, 0, 0.4745098, 1,
1.455681, 0.6069039, 0.9499715, 1, 0, 0.4666667, 1,
1.474919, -0.2487838, 3.099876, 1, 0, 0.4627451, 1,
1.475917, -0.7046316, 2.230544, 1, 0, 0.454902, 1,
1.477787, 0.4917538, 1.154329, 1, 0, 0.4509804, 1,
1.501817, -0.4072753, 2.907853, 1, 0, 0.4431373, 1,
1.516905, 0.264907, 2.878093, 1, 0, 0.4392157, 1,
1.520116, -1.196946, 2.168158, 1, 0, 0.4313726, 1,
1.528643, 0.5978457, 1.437028, 1, 0, 0.427451, 1,
1.52889, -0.1932878, 2.884646, 1, 0, 0.4196078, 1,
1.529722, -0.2894252, 1.347495, 1, 0, 0.4156863, 1,
1.529917, 1.186466, 1.733323, 1, 0, 0.4078431, 1,
1.533713, 0.5426697, 1.075081, 1, 0, 0.4039216, 1,
1.545104, 0.9327255, -0.11195, 1, 0, 0.3960784, 1,
1.557844, -0.07232663, 2.113142, 1, 0, 0.3882353, 1,
1.561198, -0.1409703, 2.780192, 1, 0, 0.3843137, 1,
1.564097, 0.3688922, 2.165332, 1, 0, 0.3764706, 1,
1.56525, -1.862531, 3.227034, 1, 0, 0.372549, 1,
1.570875, 1.164191, 2.15287, 1, 0, 0.3647059, 1,
1.576211, -0.2443437, 3.03188, 1, 0, 0.3607843, 1,
1.604285, 0.1538452, 3.080598, 1, 0, 0.3529412, 1,
1.606993, -0.2474794, 1.536843, 1, 0, 0.3490196, 1,
1.610432, -0.6784362, 1.162611, 1, 0, 0.3411765, 1,
1.630901, -0.7229246, 2.311614, 1, 0, 0.3372549, 1,
1.665552, -0.5311745, 2.4738, 1, 0, 0.3294118, 1,
1.677467, 2.11718, 1.23724, 1, 0, 0.3254902, 1,
1.684326, 2.113387, 1.08837, 1, 0, 0.3176471, 1,
1.689731, -1.733414, 2.229998, 1, 0, 0.3137255, 1,
1.69263, 1.625721, 1.318744, 1, 0, 0.3058824, 1,
1.697311, 0.1664842, 1.334102, 1, 0, 0.2980392, 1,
1.702385, -0.288018, 1.231042, 1, 0, 0.2941177, 1,
1.718236, -0.9985205, 4.577556, 1, 0, 0.2862745, 1,
1.74024, -0.5763251, 2.044665, 1, 0, 0.282353, 1,
1.741556, -0.2699466, 1.832908, 1, 0, 0.2745098, 1,
1.763796, 0.3524127, 2.669088, 1, 0, 0.2705882, 1,
1.777391, -0.5024292, 1.235006, 1, 0, 0.2627451, 1,
1.779466, 0.05010066, 0.1930519, 1, 0, 0.2588235, 1,
1.786731, -1.461722, 3.417158, 1, 0, 0.2509804, 1,
1.788109, 0.8933876, 0.7350329, 1, 0, 0.2470588, 1,
1.791611, -0.1048449, 0.8571384, 1, 0, 0.2392157, 1,
1.798649, 0.2060756, 1.702031, 1, 0, 0.2352941, 1,
1.802247, 1.300624, -0.8633065, 1, 0, 0.227451, 1,
1.825282, -0.1560562, 1.451213, 1, 0, 0.2235294, 1,
1.837389, -0.5134286, 3.495319, 1, 0, 0.2156863, 1,
1.85028, 1.609427, 2.187957, 1, 0, 0.2117647, 1,
1.854094, -0.3457117, 2.823226, 1, 0, 0.2039216, 1,
1.861888, -1.087506, 1.375306, 1, 0, 0.1960784, 1,
1.862378, -0.2385187, 1.34622, 1, 0, 0.1921569, 1,
1.886098, -1.813858, 2.882474, 1, 0, 0.1843137, 1,
1.9025, -0.05524433, 1.689133, 1, 0, 0.1803922, 1,
1.91092, 0.3801108, 1.839006, 1, 0, 0.172549, 1,
1.915685, 1.7092, -0.3109149, 1, 0, 0.1686275, 1,
1.919746, -0.5384701, 1.513642, 1, 0, 0.1607843, 1,
1.965787, 0.09910505, 1.514689, 1, 0, 0.1568628, 1,
2.006557, 0.50648, 1.542038, 1, 0, 0.1490196, 1,
2.013043, -0.6280204, 0.1501162, 1, 0, 0.145098, 1,
2.021997, -1.158922, 1.329548, 1, 0, 0.1372549, 1,
2.028317, -0.462236, 0.06660426, 1, 0, 0.1333333, 1,
2.049253, 1.432565, 0.9426874, 1, 0, 0.1254902, 1,
2.169613, 0.5888761, 1.207574, 1, 0, 0.1215686, 1,
2.190063, -0.815102, 1.395987, 1, 0, 0.1137255, 1,
2.205202, 0.09200889, 1.165376, 1, 0, 0.1098039, 1,
2.276896, 0.6569144, 0.1170503, 1, 0, 0.1019608, 1,
2.344887, -0.07909393, 1.264839, 1, 0, 0.09411765, 1,
2.365963, -0.6401234, 2.340094, 1, 0, 0.09019608, 1,
2.371787, -0.5515071, -1.064079, 1, 0, 0.08235294, 1,
2.379987, 0.4888002, 1.21758, 1, 0, 0.07843138, 1,
2.392314, -0.7131171, 0.1663682, 1, 0, 0.07058824, 1,
2.393675, -1.83825, 3.513174, 1, 0, 0.06666667, 1,
2.396865, 0.3214214, 0.5988868, 1, 0, 0.05882353, 1,
2.43777, -1.672083, -0.9097186, 1, 0, 0.05490196, 1,
2.478084, -0.7644303, 0.833945, 1, 0, 0.04705882, 1,
2.515121, -0.2014523, 0.5403787, 1, 0, 0.04313726, 1,
2.551684, -0.8874497, 1.838163, 1, 0, 0.03529412, 1,
2.605959, -1.3116, 2.339975, 1, 0, 0.03137255, 1,
2.62489, -0.02494923, 5.996308, 1, 0, 0.02352941, 1,
2.782204, 1.499369, 1.592199, 1, 0, 0.01960784, 1,
2.841532, -0.03990734, 1.104129, 1, 0, 0.01176471, 1,
2.979132, -0.8977718, 1.538995, 1, 0, 0.007843138, 1
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
-0.1674781, -4.431772, -6.835871, 0, -0.5, 0.5, 0.5,
-0.1674781, -4.431772, -6.835871, 1, -0.5, 0.5, 0.5,
-0.1674781, -4.431772, -6.835871, 1, 1.5, 0.5, 0.5,
-0.1674781, -4.431772, -6.835871, 0, 1.5, 0.5, 0.5
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
-4.38079, -0.3049484, -6.835871, 0, -0.5, 0.5, 0.5,
-4.38079, -0.3049484, -6.835871, 1, -0.5, 0.5, 0.5,
-4.38079, -0.3049484, -6.835871, 1, 1.5, 0.5, 0.5,
-4.38079, -0.3049484, -6.835871, 0, 1.5, 0.5, 0.5
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
-4.38079, -4.431772, 0.5101261, 0, -0.5, 0.5, 0.5,
-4.38079, -4.431772, 0.5101261, 1, -0.5, 0.5, 0.5,
-4.38079, -4.431772, 0.5101261, 1, 1.5, 0.5, 0.5,
-4.38079, -4.431772, 0.5101261, 0, 1.5, 0.5, 0.5
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
-3, -3.479428, -5.140641,
2, -3.479428, -5.140641,
-3, -3.479428, -5.140641,
-3, -3.638152, -5.42318,
-2, -3.479428, -5.140641,
-2, -3.638152, -5.42318,
-1, -3.479428, -5.140641,
-1, -3.638152, -5.42318,
0, -3.479428, -5.140641,
0, -3.638152, -5.42318,
1, -3.479428, -5.140641,
1, -3.638152, -5.42318,
2, -3.479428, -5.140641,
2, -3.638152, -5.42318
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
-3, -3.9556, -5.988256, 0, -0.5, 0.5, 0.5,
-3, -3.9556, -5.988256, 1, -0.5, 0.5, 0.5,
-3, -3.9556, -5.988256, 1, 1.5, 0.5, 0.5,
-3, -3.9556, -5.988256, 0, 1.5, 0.5, 0.5,
-2, -3.9556, -5.988256, 0, -0.5, 0.5, 0.5,
-2, -3.9556, -5.988256, 1, -0.5, 0.5, 0.5,
-2, -3.9556, -5.988256, 1, 1.5, 0.5, 0.5,
-2, -3.9556, -5.988256, 0, 1.5, 0.5, 0.5,
-1, -3.9556, -5.988256, 0, -0.5, 0.5, 0.5,
-1, -3.9556, -5.988256, 1, -0.5, 0.5, 0.5,
-1, -3.9556, -5.988256, 1, 1.5, 0.5, 0.5,
-1, -3.9556, -5.988256, 0, 1.5, 0.5, 0.5,
0, -3.9556, -5.988256, 0, -0.5, 0.5, 0.5,
0, -3.9556, -5.988256, 1, -0.5, 0.5, 0.5,
0, -3.9556, -5.988256, 1, 1.5, 0.5, 0.5,
0, -3.9556, -5.988256, 0, 1.5, 0.5, 0.5,
1, -3.9556, -5.988256, 0, -0.5, 0.5, 0.5,
1, -3.9556, -5.988256, 1, -0.5, 0.5, 0.5,
1, -3.9556, -5.988256, 1, 1.5, 0.5, 0.5,
1, -3.9556, -5.988256, 0, 1.5, 0.5, 0.5,
2, -3.9556, -5.988256, 0, -0.5, 0.5, 0.5,
2, -3.9556, -5.988256, 1, -0.5, 0.5, 0.5,
2, -3.9556, -5.988256, 1, 1.5, 0.5, 0.5,
2, -3.9556, -5.988256, 0, 1.5, 0.5, 0.5
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
-3.408487, -3, -5.140641,
-3.408487, 2, -5.140641,
-3.408487, -3, -5.140641,
-3.570537, -3, -5.42318,
-3.408487, -2, -5.140641,
-3.570537, -2, -5.42318,
-3.408487, -1, -5.140641,
-3.570537, -1, -5.42318,
-3.408487, 0, -5.140641,
-3.570537, 0, -5.42318,
-3.408487, 1, -5.140641,
-3.570537, 1, -5.42318,
-3.408487, 2, -5.140641,
-3.570537, 2, -5.42318
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
-3.894638, -3, -5.988256, 0, -0.5, 0.5, 0.5,
-3.894638, -3, -5.988256, 1, -0.5, 0.5, 0.5,
-3.894638, -3, -5.988256, 1, 1.5, 0.5, 0.5,
-3.894638, -3, -5.988256, 0, 1.5, 0.5, 0.5,
-3.894638, -2, -5.988256, 0, -0.5, 0.5, 0.5,
-3.894638, -2, -5.988256, 1, -0.5, 0.5, 0.5,
-3.894638, -2, -5.988256, 1, 1.5, 0.5, 0.5,
-3.894638, -2, -5.988256, 0, 1.5, 0.5, 0.5,
-3.894638, -1, -5.988256, 0, -0.5, 0.5, 0.5,
-3.894638, -1, -5.988256, 1, -0.5, 0.5, 0.5,
-3.894638, -1, -5.988256, 1, 1.5, 0.5, 0.5,
-3.894638, -1, -5.988256, 0, 1.5, 0.5, 0.5,
-3.894638, 0, -5.988256, 0, -0.5, 0.5, 0.5,
-3.894638, 0, -5.988256, 1, -0.5, 0.5, 0.5,
-3.894638, 0, -5.988256, 1, 1.5, 0.5, 0.5,
-3.894638, 0, -5.988256, 0, 1.5, 0.5, 0.5,
-3.894638, 1, -5.988256, 0, -0.5, 0.5, 0.5,
-3.894638, 1, -5.988256, 1, -0.5, 0.5, 0.5,
-3.894638, 1, -5.988256, 1, 1.5, 0.5, 0.5,
-3.894638, 1, -5.988256, 0, 1.5, 0.5, 0.5,
-3.894638, 2, -5.988256, 0, -0.5, 0.5, 0.5,
-3.894638, 2, -5.988256, 1, -0.5, 0.5, 0.5,
-3.894638, 2, -5.988256, 1, 1.5, 0.5, 0.5,
-3.894638, 2, -5.988256, 0, 1.5, 0.5, 0.5
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
-3.408487, -3.479428, -4,
-3.408487, -3.479428, 4,
-3.408487, -3.479428, -4,
-3.570537, -3.638152, -4,
-3.408487, -3.479428, -2,
-3.570537, -3.638152, -2,
-3.408487, -3.479428, 0,
-3.570537, -3.638152, 0,
-3.408487, -3.479428, 2,
-3.570537, -3.638152, 2,
-3.408487, -3.479428, 4,
-3.570537, -3.638152, 4
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
-3.894638, -3.9556, -4, 0, -0.5, 0.5, 0.5,
-3.894638, -3.9556, -4, 1, -0.5, 0.5, 0.5,
-3.894638, -3.9556, -4, 1, 1.5, 0.5, 0.5,
-3.894638, -3.9556, -4, 0, 1.5, 0.5, 0.5,
-3.894638, -3.9556, -2, 0, -0.5, 0.5, 0.5,
-3.894638, -3.9556, -2, 1, -0.5, 0.5, 0.5,
-3.894638, -3.9556, -2, 1, 1.5, 0.5, 0.5,
-3.894638, -3.9556, -2, 0, 1.5, 0.5, 0.5,
-3.894638, -3.9556, 0, 0, -0.5, 0.5, 0.5,
-3.894638, -3.9556, 0, 1, -0.5, 0.5, 0.5,
-3.894638, -3.9556, 0, 1, 1.5, 0.5, 0.5,
-3.894638, -3.9556, 0, 0, 1.5, 0.5, 0.5,
-3.894638, -3.9556, 2, 0, -0.5, 0.5, 0.5,
-3.894638, -3.9556, 2, 1, -0.5, 0.5, 0.5,
-3.894638, -3.9556, 2, 1, 1.5, 0.5, 0.5,
-3.894638, -3.9556, 2, 0, 1.5, 0.5, 0.5,
-3.894638, -3.9556, 4, 0, -0.5, 0.5, 0.5,
-3.894638, -3.9556, 4, 1, -0.5, 0.5, 0.5,
-3.894638, -3.9556, 4, 1, 1.5, 0.5, 0.5,
-3.894638, -3.9556, 4, 0, 1.5, 0.5, 0.5
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
-3.408487, -3.479428, -5.140641,
-3.408487, 2.869531, -5.140641,
-3.408487, -3.479428, 6.160893,
-3.408487, 2.869531, 6.160893,
-3.408487, -3.479428, -5.140641,
-3.408487, -3.479428, 6.160893,
-3.408487, 2.869531, -5.140641,
-3.408487, 2.869531, 6.160893,
-3.408487, -3.479428, -5.140641,
3.073531, -3.479428, -5.140641,
-3.408487, -3.479428, 6.160893,
3.073531, -3.479428, 6.160893,
-3.408487, 2.869531, -5.140641,
3.073531, 2.869531, -5.140641,
-3.408487, 2.869531, 6.160893,
3.073531, 2.869531, 6.160893,
3.073531, -3.479428, -5.140641,
3.073531, 2.869531, -5.140641,
3.073531, -3.479428, 6.160893,
3.073531, 2.869531, 6.160893,
3.073531, -3.479428, -5.140641,
3.073531, -3.479428, 6.160893,
3.073531, 2.869531, -5.140641,
3.073531, 2.869531, 6.160893
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
var radius = 7.739044;
var distance = 34.43188;
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
mvMatrix.translate( 0.1674781, 0.3049484, -0.5101261 );
mvMatrix.scale( 1.290895, 1.317949, 0.7403956 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.43188);
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
flufenoxuron<-read.table("flufenoxuron.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-flufenoxuron$V2
```

```
## Error in eval(expr, envir, enclos): object 'flufenoxuron' not found
```

```r
y<-flufenoxuron$V3
```

```
## Error in eval(expr, envir, enclos): object 'flufenoxuron' not found
```

```r
z<-flufenoxuron$V4
```

```
## Error in eval(expr, envir, enclos): object 'flufenoxuron' not found
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
-3.314089, 0.8578624, 0.1241291, 0, 0, 1, 1, 1,
-3.284321, 0.09576453, 0.3301909, 1, 0, 0, 1, 1,
-2.996624, 1.279161, 0.4942605, 1, 0, 0, 1, 1,
-2.824715, 0.88751, -0.4823162, 1, 0, 0, 1, 1,
-2.746068, -0.9639848, -0.4043192, 1, 0, 0, 1, 1,
-2.682864, -0.7705037, -2.981151, 1, 0, 0, 1, 1,
-2.618347, -0.06916432, -0.9052474, 0, 0, 0, 1, 1,
-2.575481, 1.305563, -0.4013528, 0, 0, 0, 1, 1,
-2.564767, 0.6957037, -2.021106, 0, 0, 0, 1, 1,
-2.536101, 0.8569204, -2.629071, 0, 0, 0, 1, 1,
-2.490509, -0.3834542, -1.617821, 0, 0, 0, 1, 1,
-2.409516, 0.7460356, -0.05595376, 0, 0, 0, 1, 1,
-2.397105, -0.08909238, -1.714963, 0, 0, 0, 1, 1,
-2.374559, -0.1350817, -2.249095, 1, 1, 1, 1, 1,
-2.362757, 0.2274128, -1.703795, 1, 1, 1, 1, 1,
-2.333331, 0.1083015, -1.131056, 1, 1, 1, 1, 1,
-2.320751, -1.153527, -2.18047, 1, 1, 1, 1, 1,
-2.272751, 0.783641, -0.2275459, 1, 1, 1, 1, 1,
-2.245825, 0.5084992, -0.09284695, 1, 1, 1, 1, 1,
-2.243645, -0.1881056, -0.3440106, 1, 1, 1, 1, 1,
-2.172716, 0.8489095, -2.754525, 1, 1, 1, 1, 1,
-2.133118, -0.5922821, -3.61509, 1, 1, 1, 1, 1,
-2.092645, 0.2191399, -1.041107, 1, 1, 1, 1, 1,
-2.057834, -0.7289626, -0.1686497, 1, 1, 1, 1, 1,
-2.057793, -0.3008158, -3.182891, 1, 1, 1, 1, 1,
-2.052544, -0.0377571, -2.984807, 1, 1, 1, 1, 1,
-2.034712, 0.4178413, -2.906376, 1, 1, 1, 1, 1,
-2.008926, 1.254149, -2.597006, 1, 1, 1, 1, 1,
-2.00151, 1.469071, -0.828629, 0, 0, 1, 1, 1,
-2.000344, 0.4933591, 0.3312331, 1, 0, 0, 1, 1,
-1.998386, -0.1312795, -1.161623, 1, 0, 0, 1, 1,
-1.993601, -0.9356133, -1.54846, 1, 0, 0, 1, 1,
-1.950181, 0.8013579, -0.7286577, 1, 0, 0, 1, 1,
-1.945769, 0.4779252, -1.654037, 1, 0, 0, 1, 1,
-1.928702, -0.6685104, -0.5391663, 0, 0, 0, 1, 1,
-1.921039, 0.08989903, -2.66619, 0, 0, 0, 1, 1,
-1.896619, 0.5526429, -2.646084, 0, 0, 0, 1, 1,
-1.896475, -1.505519, -4.178292, 0, 0, 0, 1, 1,
-1.887543, 0.1236355, 0.7705247, 0, 0, 0, 1, 1,
-1.851662, -0.3105986, -1.090632, 0, 0, 0, 1, 1,
-1.791884, -0.5422468, -1.878059, 0, 0, 0, 1, 1,
-1.786926, -1.023014, -1.548643, 1, 1, 1, 1, 1,
-1.783601, -1.620725, -3.787929, 1, 1, 1, 1, 1,
-1.765594, -3.386967, -1.977597, 1, 1, 1, 1, 1,
-1.718822, 0.6329693, -1.681706, 1, 1, 1, 1, 1,
-1.717968, -0.9374236, -3.191672, 1, 1, 1, 1, 1,
-1.707185, -0.5987594, -1.884268, 1, 1, 1, 1, 1,
-1.702069, -0.5354232, -1.831688, 1, 1, 1, 1, 1,
-1.690651, -0.2474529, -0.4299457, 1, 1, 1, 1, 1,
-1.68366, -0.7055895, -2.715913, 1, 1, 1, 1, 1,
-1.680317, 2.190161, 0.1465466, 1, 1, 1, 1, 1,
-1.674619, 1.162929, -0.2331064, 1, 1, 1, 1, 1,
-1.672056, -1.314355, -2.275997, 1, 1, 1, 1, 1,
-1.669141, -0.1383236, -0.3026412, 1, 1, 1, 1, 1,
-1.661661, 1.167158, -1.955087, 1, 1, 1, 1, 1,
-1.637253, -0.4383688, -1.336824, 1, 1, 1, 1, 1,
-1.63026, 0.5927966, 0.2008082, 0, 0, 1, 1, 1,
-1.623832, -1.357627, -1.94217, 1, 0, 0, 1, 1,
-1.620562, 0.5746782, -1.061266, 1, 0, 0, 1, 1,
-1.616807, 0.3163962, -0.5789533, 1, 0, 0, 1, 1,
-1.601929, -0.8850106, -1.275362, 1, 0, 0, 1, 1,
-1.599253, -0.8880082, -3.068049, 1, 0, 0, 1, 1,
-1.591365, 0.7165561, -2.435058, 0, 0, 0, 1, 1,
-1.583215, 0.02513336, -1.410893, 0, 0, 0, 1, 1,
-1.580976, 0.9448958, -1.859776, 0, 0, 0, 1, 1,
-1.578777, -0.07313386, 0.04660072, 0, 0, 0, 1, 1,
-1.564688, -1.266285, -3.84902, 0, 0, 0, 1, 1,
-1.557975, -0.2760621, 0.1384727, 0, 0, 0, 1, 1,
-1.552176, 0.8111169, 0.1998459, 0, 0, 0, 1, 1,
-1.530909, -0.5760704, -1.71964, 1, 1, 1, 1, 1,
-1.521147, -0.4248167, -1.469998, 1, 1, 1, 1, 1,
-1.51227, -0.01546483, -1.807854, 1, 1, 1, 1, 1,
-1.509367, -0.6779788, -3.467288, 1, 1, 1, 1, 1,
-1.507171, 0.3967955, -0.5728655, 1, 1, 1, 1, 1,
-1.494749, 1.0908, -0.3705042, 1, 1, 1, 1, 1,
-1.49456, -0.6353399, -1.042815, 1, 1, 1, 1, 1,
-1.489592, -0.06231454, 0.2854798, 1, 1, 1, 1, 1,
-1.480461, 1.580718, 0.4172416, 1, 1, 1, 1, 1,
-1.476402, 1.600268, -0.8464654, 1, 1, 1, 1, 1,
-1.474112, 0.8946949, -0.2567357, 1, 1, 1, 1, 1,
-1.469515, 0.1207392, -1.763538, 1, 1, 1, 1, 1,
-1.467408, -0.9398617, -2.961875, 1, 1, 1, 1, 1,
-1.46676, 0.8343775, -1.115331, 1, 1, 1, 1, 1,
-1.463313, -0.03372427, -2.159237, 1, 1, 1, 1, 1,
-1.460512, -0.9023155, -2.986207, 0, 0, 1, 1, 1,
-1.459986, 1.066078, -1.86428, 1, 0, 0, 1, 1,
-1.457637, 0.04188031, -1.534136, 1, 0, 0, 1, 1,
-1.453193, 0.8162905, -0.620977, 1, 0, 0, 1, 1,
-1.444978, 1.003322, -0.8165099, 1, 0, 0, 1, 1,
-1.44374, -0.7058375, -1.424651, 1, 0, 0, 1, 1,
-1.42901, -0.4412623, -3.082662, 0, 0, 0, 1, 1,
-1.427226, -0.6568868, -2.052612, 0, 0, 0, 1, 1,
-1.411466, 1.560876, -1.569425, 0, 0, 0, 1, 1,
-1.406534, 0.7795985, -0.689602, 0, 0, 0, 1, 1,
-1.389391, 0.1502293, -2.228199, 0, 0, 0, 1, 1,
-1.388524, -0.321346, -1.329506, 0, 0, 0, 1, 1,
-1.375911, 0.1459334, -1.766311, 0, 0, 0, 1, 1,
-1.341392, 1.777565, 1.093553, 1, 1, 1, 1, 1,
-1.341105, -0.5595275, -1.662345, 1, 1, 1, 1, 1,
-1.339229, -0.01728734, -1.685669, 1, 1, 1, 1, 1,
-1.331816, -0.330516, -2.072337, 1, 1, 1, 1, 1,
-1.324878, -1.071849, -1.538005, 1, 1, 1, 1, 1,
-1.306245, 1.173137, -0.8139679, 1, 1, 1, 1, 1,
-1.306167, 1.478528, 0.3790111, 1, 1, 1, 1, 1,
-1.304936, -0.3652277, -1.633211, 1, 1, 1, 1, 1,
-1.30387, 0.1912926, -1.597811, 1, 1, 1, 1, 1,
-1.299905, -0.05432267, -0.6036592, 1, 1, 1, 1, 1,
-1.29613, -1.301774, -3.503414, 1, 1, 1, 1, 1,
-1.293491, 0.497078, -2.925723, 1, 1, 1, 1, 1,
-1.287966, 1.175572, -0.3327386, 1, 1, 1, 1, 1,
-1.286446, 2.483402, -1.664984, 1, 1, 1, 1, 1,
-1.280079, 0.5636466, -2.157795, 1, 1, 1, 1, 1,
-1.277778, 0.3322847, -2.461564, 0, 0, 1, 1, 1,
-1.271901, 0.5322837, -0.602753, 1, 0, 0, 1, 1,
-1.266485, 0.7395984, -1.105176, 1, 0, 0, 1, 1,
-1.262069, -1.163152, -2.698243, 1, 0, 0, 1, 1,
-1.242949, 0.3964906, -2.081369, 1, 0, 0, 1, 1,
-1.23091, 0.1921952, -0.9406045, 1, 0, 0, 1, 1,
-1.220991, 0.310535, -1.008434, 0, 0, 0, 1, 1,
-1.220796, 0.5545997, -1.441773, 0, 0, 0, 1, 1,
-1.218279, -0.9200449, -2.220891, 0, 0, 0, 1, 1,
-1.213566, -2.107915, -2.950001, 0, 0, 0, 1, 1,
-1.20503, -0.3166211, -1.812524, 0, 0, 0, 1, 1,
-1.198812, 0.3426147, -1.408925, 0, 0, 0, 1, 1,
-1.169929, -1.584698, -2.845426, 0, 0, 0, 1, 1,
-1.162959, 0.03709665, -1.448993, 1, 1, 1, 1, 1,
-1.161808, 0.7532747, -1.612518, 1, 1, 1, 1, 1,
-1.160884, 0.4438285, -2.084623, 1, 1, 1, 1, 1,
-1.160013, 0.8311389, -1.536791, 1, 1, 1, 1, 1,
-1.149629, 0.3549336, -0.849974, 1, 1, 1, 1, 1,
-1.149541, -0.8063843, -1.404944, 1, 1, 1, 1, 1,
-1.137247, 0.2390243, -3.20894, 1, 1, 1, 1, 1,
-1.136545, 0.9538249, -1.037706, 1, 1, 1, 1, 1,
-1.134474, -0.0009917414, -1.52705, 1, 1, 1, 1, 1,
-1.122984, -0.1917258, -2.843072, 1, 1, 1, 1, 1,
-1.122566, 1.128101, -0.6752786, 1, 1, 1, 1, 1,
-1.115462, 0.9299554, -2.159767, 1, 1, 1, 1, 1,
-1.109707, 1.047064, -0.5874698, 1, 1, 1, 1, 1,
-1.104563, -0.02312365, -1.975028, 1, 1, 1, 1, 1,
-1.09593, 2.150931, 0.5777985, 1, 1, 1, 1, 1,
-1.089426, -0.8381022, -2.933977, 0, 0, 1, 1, 1,
-1.084992, 0.6733065, -0.8935645, 1, 0, 0, 1, 1,
-1.082913, 1.143471, -0.4363383, 1, 0, 0, 1, 1,
-1.079163, -1.228768, -2.975577, 1, 0, 0, 1, 1,
-1.069172, -2.061558, -4.311832, 1, 0, 0, 1, 1,
-1.064253, -0.4749034, -3.355415, 1, 0, 0, 1, 1,
-1.062067, 0.1022912, -1.82716, 0, 0, 0, 1, 1,
-1.06179, -0.1618556, -2.624738, 0, 0, 0, 1, 1,
-1.059084, -0.5849636, -2.780185, 0, 0, 0, 1, 1,
-1.058731, 0.1517467, -2.366901, 0, 0, 0, 1, 1,
-1.05271, -1.930589, -3.309139, 0, 0, 0, 1, 1,
-1.051184, -1.490445, -4.387818, 0, 0, 0, 1, 1,
-1.044056, -1.316561, -1.028463, 0, 0, 0, 1, 1,
-1.03772, 2.04915, -1.372545, 1, 1, 1, 1, 1,
-1.036657, -0.5629793, -1.868796, 1, 1, 1, 1, 1,
-1.036399, -0.448176, -2.068962, 1, 1, 1, 1, 1,
-1.03608, -0.6213885, -3.016589, 1, 1, 1, 1, 1,
-1.035407, -0.72113, -3.095568, 1, 1, 1, 1, 1,
-1.034863, -0.7396881, -0.5560025, 1, 1, 1, 1, 1,
-1.031103, 0.4857486, -0.7835761, 1, 1, 1, 1, 1,
-1.030266, -2.132846, -1.96957, 1, 1, 1, 1, 1,
-1.014969, -0.362763, -1.111084, 1, 1, 1, 1, 1,
-1.013814, -0.6203656, -0.6458014, 1, 1, 1, 1, 1,
-1.012697, -1.251308, -2.818531, 1, 1, 1, 1, 1,
-1.012175, -0.02072391, -0.1868734, 1, 1, 1, 1, 1,
-1.012053, 0.7337663, -0.1867744, 1, 1, 1, 1, 1,
-1.011707, 0.6459394, -1.065691, 1, 1, 1, 1, 1,
-1.01119, -1.003345, -2.037469, 1, 1, 1, 1, 1,
-1.010144, -0.1336609, -0.6585911, 0, 0, 1, 1, 1,
-1.009769, -0.7796261, -3.570256, 1, 0, 0, 1, 1,
-1.002893, -1.34219, -2.619296, 1, 0, 0, 1, 1,
-0.999438, 0.3811663, -0.7366046, 1, 0, 0, 1, 1,
-0.9980853, -1.032901, -2.253729, 1, 0, 0, 1, 1,
-0.9966535, -0.5479648, -2.982966, 1, 0, 0, 1, 1,
-0.9909026, -0.3422461, -2.359711, 0, 0, 0, 1, 1,
-0.9758965, -0.4115224, -1.975915, 0, 0, 0, 1, 1,
-0.9741446, -1.571005, -3.701558, 0, 0, 0, 1, 1,
-0.9696596, -0.7862933, -2.010554, 0, 0, 0, 1, 1,
-0.9686419, 1.840627, -0.6777064, 0, 0, 0, 1, 1,
-0.9679608, -0.403408, -1.469672, 0, 0, 0, 1, 1,
-0.9594351, 1.925397, -1.463429, 0, 0, 0, 1, 1,
-0.9528214, 1.824965, -1.667328, 1, 1, 1, 1, 1,
-0.9513519, 0.9012523, 0.5236781, 1, 1, 1, 1, 1,
-0.9482424, -0.6412291, -0.4254265, 1, 1, 1, 1, 1,
-0.9412608, -1.855968, -1.075818, 1, 1, 1, 1, 1,
-0.9409824, 1.472089, -1.516738, 1, 1, 1, 1, 1,
-0.9375938, -1.37707, -1.361056, 1, 1, 1, 1, 1,
-0.9313357, 1.522151, 0.6028728, 1, 1, 1, 1, 1,
-0.92622, -1.618909, -2.735685, 1, 1, 1, 1, 1,
-0.9261646, 1.868156, -0.7063484, 1, 1, 1, 1, 1,
-0.9183716, 0.5740931, -0.7010736, 1, 1, 1, 1, 1,
-0.9137565, -0.5276132, -2.253503, 1, 1, 1, 1, 1,
-0.9125197, -0.9163972, -2.602693, 1, 1, 1, 1, 1,
-0.9114738, 1.323852, 0.6421518, 1, 1, 1, 1, 1,
-0.9101728, -1.013519, -4.17836, 1, 1, 1, 1, 1,
-0.9031757, -0.3213366, -0.7354019, 1, 1, 1, 1, 1,
-0.9013206, -0.03183217, -1.331029, 0, 0, 1, 1, 1,
-0.8925374, -0.261525, -0.3788878, 1, 0, 0, 1, 1,
-0.8922965, 1.069908, -2.264713, 1, 0, 0, 1, 1,
-0.8922645, 0.6392161, -1.396169, 1, 0, 0, 1, 1,
-0.8914, -0.625577, -1.94099, 1, 0, 0, 1, 1,
-0.8895612, 0.2007412, -1.313671, 1, 0, 0, 1, 1,
-0.8875783, -0.8286731, -2.271346, 0, 0, 0, 1, 1,
-0.8839538, 0.4495135, -1.772881, 0, 0, 0, 1, 1,
-0.8751962, 0.6865046, 0.7145891, 0, 0, 0, 1, 1,
-0.8737677, 0.6677824, -0.7407594, 0, 0, 0, 1, 1,
-0.8598839, 0.2986737, -1.783607, 0, 0, 0, 1, 1,
-0.8569955, -0.3670129, -2.94957, 0, 0, 0, 1, 1,
-0.8465571, 0.4920306, -1.052465, 0, 0, 0, 1, 1,
-0.8430688, -0.124305, -2.350086, 1, 1, 1, 1, 1,
-0.8423357, 1.042652, -1.877251, 1, 1, 1, 1, 1,
-0.8419253, -0.9151669, -1.923365, 1, 1, 1, 1, 1,
-0.8414046, -0.02360823, -1.552278, 1, 1, 1, 1, 1,
-0.8402772, 0.0902761, -2.451079, 1, 1, 1, 1, 1,
-0.8377442, 0.2329613, 0.5114707, 1, 1, 1, 1, 1,
-0.8357847, 1.115661, 0.4648714, 1, 1, 1, 1, 1,
-0.8280002, -0.2958274, -2.8235, 1, 1, 1, 1, 1,
-0.8274771, -0.1805871, -2.430485, 1, 1, 1, 1, 1,
-0.8234199, -0.6011651, -2.436448, 1, 1, 1, 1, 1,
-0.8212493, 0.681152, -0.1556159, 1, 1, 1, 1, 1,
-0.8211265, -1.142998, -3.623843, 1, 1, 1, 1, 1,
-0.8196863, -1.089175, -2.845025, 1, 1, 1, 1, 1,
-0.8166701, -0.9976981, -2.722487, 1, 1, 1, 1, 1,
-0.8134053, 0.2360497, 0.1291567, 1, 1, 1, 1, 1,
-0.7975159, -0.5401032, -2.755447, 0, 0, 1, 1, 1,
-0.7954451, -0.4429322, -0.5920954, 1, 0, 0, 1, 1,
-0.7927189, -0.159483, -2.096892, 1, 0, 0, 1, 1,
-0.78879, 0.3271987, -0.3166297, 1, 0, 0, 1, 1,
-0.7872908, 1.524074, -0.6662677, 1, 0, 0, 1, 1,
-0.7819803, 1.678742, -0.5084088, 1, 0, 0, 1, 1,
-0.781432, -0.5282043, -1.627134, 0, 0, 0, 1, 1,
-0.7811546, 0.6513521, -2.7252, 0, 0, 0, 1, 1,
-0.7735248, -2.21079, -1.481966, 0, 0, 0, 1, 1,
-0.7724237, -1.611745, -3.508454, 0, 0, 0, 1, 1,
-0.758867, -0.1027762, -1.015708, 0, 0, 0, 1, 1,
-0.758547, -0.4074683, -2.150925, 0, 0, 0, 1, 1,
-0.7577887, -0.8686794, -2.198931, 0, 0, 0, 1, 1,
-0.7572802, -0.4534301, -1.847098, 1, 1, 1, 1, 1,
-0.7552364, 0.6815073, 0.2642584, 1, 1, 1, 1, 1,
-0.7548962, -0.8472115, -3.331132, 1, 1, 1, 1, 1,
-0.7546683, 1.532551, -0.3692091, 1, 1, 1, 1, 1,
-0.7485564, -0.6567806, -1.763872, 1, 1, 1, 1, 1,
-0.7483444, 0.6891728, 0.9801806, 1, 1, 1, 1, 1,
-0.739606, -0.5524291, -1.628497, 1, 1, 1, 1, 1,
-0.7372712, -0.9063835, -1.748742, 1, 1, 1, 1, 1,
-0.7250854, 0.5624375, -1.465092, 1, 1, 1, 1, 1,
-0.7204017, 0.8656815, -1.083008, 1, 1, 1, 1, 1,
-0.7195939, -0.2224313, -0.7262489, 1, 1, 1, 1, 1,
-0.715717, 0.519742, 0.591271, 1, 1, 1, 1, 1,
-0.7125022, 0.6364906, -0.3613116, 1, 1, 1, 1, 1,
-0.7040257, -0.6204106, -2.34264, 1, 1, 1, 1, 1,
-0.701004, -1.055509, -1.92854, 1, 1, 1, 1, 1,
-0.6993366, -0.4767268, -2.668639, 0, 0, 1, 1, 1,
-0.6985011, -1.117519, -2.260672, 1, 0, 0, 1, 1,
-0.6963434, 0.991605, -0.2211453, 1, 0, 0, 1, 1,
-0.6913083, 1.969754, -2.303923, 1, 0, 0, 1, 1,
-0.6893139, -0.3706266, -3.553853, 1, 0, 0, 1, 1,
-0.6826914, 1.250701, 1.022524, 1, 0, 0, 1, 1,
-0.6765356, 1.148531, -0.1511383, 0, 0, 0, 1, 1,
-0.6759382, -0.9338276, -1.983429, 0, 0, 0, 1, 1,
-0.6691855, -0.2682937, -2.125153, 0, 0, 0, 1, 1,
-0.663285, -1.091004, -2.70233, 0, 0, 0, 1, 1,
-0.6577216, -0.3443855, -2.602987, 0, 0, 0, 1, 1,
-0.6571179, 1.653227, -1.784753, 0, 0, 0, 1, 1,
-0.6555907, -1.177817, -1.428879, 0, 0, 0, 1, 1,
-0.6500534, -1.306057, -1.937299, 1, 1, 1, 1, 1,
-0.6446148, 0.5662923, 0.6821632, 1, 1, 1, 1, 1,
-0.6434664, -1.219852, -0.8143486, 1, 1, 1, 1, 1,
-0.6288121, 2.777071, 0.2006387, 1, 1, 1, 1, 1,
-0.6253322, -0.5136961, -1.946817, 1, 1, 1, 1, 1,
-0.6223887, 0.6575546, -0.9111362, 1, 1, 1, 1, 1,
-0.6190017, -0.3361914, -2.701965, 1, 1, 1, 1, 1,
-0.6171116, 0.4354654, -1.001996, 1, 1, 1, 1, 1,
-0.6127462, 1.292537, -0.410376, 1, 1, 1, 1, 1,
-0.6121646, -0.4868442, -2.141418, 1, 1, 1, 1, 1,
-0.6103885, -0.04207186, -0.01135723, 1, 1, 1, 1, 1,
-0.6038393, -0.6812935, -1.660428, 1, 1, 1, 1, 1,
-0.5979279, -0.02574403, -0.4761626, 1, 1, 1, 1, 1,
-0.5975307, 1.169215, 0.8670871, 1, 1, 1, 1, 1,
-0.5938196, 0.05837526, -1.254282, 1, 1, 1, 1, 1,
-0.5932719, 2.247213, 0.5275085, 0, 0, 1, 1, 1,
-0.5924904, 1.000794, 0.3089532, 1, 0, 0, 1, 1,
-0.5905989, -0.5177545, -3.595848, 1, 0, 0, 1, 1,
-0.5904235, -2.00286, -3.727456, 1, 0, 0, 1, 1,
-0.5891992, -0.3061497, -1.007173, 1, 0, 0, 1, 1,
-0.5837131, 0.2038777, -2.364524, 1, 0, 0, 1, 1,
-0.5829518, -0.1432352, -0.9215882, 0, 0, 0, 1, 1,
-0.5807419, -1.048601, -3.127582, 0, 0, 0, 1, 1,
-0.5778527, -0.1746846, -2.512677, 0, 0, 0, 1, 1,
-0.576652, -0.5037613, -2.347735, 0, 0, 0, 1, 1,
-0.5765935, 0.9437049, 0.249908, 0, 0, 0, 1, 1,
-0.5743976, -1.275656, -2.734236, 0, 0, 0, 1, 1,
-0.5714088, 0.3615535, -2.686838, 0, 0, 0, 1, 1,
-0.5708945, -0.1312521, -0.3465776, 1, 1, 1, 1, 1,
-0.5699599, 1.162043, -0.5389331, 1, 1, 1, 1, 1,
-0.569815, 0.7168707, -0.7012185, 1, 1, 1, 1, 1,
-0.5688618, 0.2490866, -3.35245, 1, 1, 1, 1, 1,
-0.5676569, -0.1054448, -0.8092433, 1, 1, 1, 1, 1,
-0.5632458, -1.284303, -1.391627, 1, 1, 1, 1, 1,
-0.5594874, -0.2689677, -4.51771, 1, 1, 1, 1, 1,
-0.5583652, -0.8543681, -3.284138, 1, 1, 1, 1, 1,
-0.553945, -1.990889, -3.329892, 1, 1, 1, 1, 1,
-0.5513757, -0.04435811, -1.138622, 1, 1, 1, 1, 1,
-0.5512726, -0.4435935, -3.122381, 1, 1, 1, 1, 1,
-0.5473791, -1.100123, -3.502246, 1, 1, 1, 1, 1,
-0.5472693, 1.723545, -1.213696, 1, 1, 1, 1, 1,
-0.546586, -0.07746772, -1.329695, 1, 1, 1, 1, 1,
-0.5447518, 0.7191232, -0.8421011, 1, 1, 1, 1, 1,
-0.5444627, 1.280931, 0.7139881, 0, 0, 1, 1, 1,
-0.5432876, -0.133032, -2.699049, 1, 0, 0, 1, 1,
-0.5369775, -1.143349, -2.837856, 1, 0, 0, 1, 1,
-0.5353914, -1.46459, -2.832541, 1, 0, 0, 1, 1,
-0.5331738, 0.3463583, -0.9685808, 1, 0, 0, 1, 1,
-0.532341, -0.6864333, -2.929514, 1, 0, 0, 1, 1,
-0.5263041, -0.7086137, -3.994988, 0, 0, 0, 1, 1,
-0.5248591, 0.2525719, -0.6138815, 0, 0, 0, 1, 1,
-0.5128448, -0.5236709, -1.240235, 0, 0, 0, 1, 1,
-0.5050831, -1.366853, -3.362189, 0, 0, 0, 1, 1,
-0.5049298, -0.4271154, -1.326716, 0, 0, 0, 1, 1,
-0.5047523, -0.9166084, -4.088247, 0, 0, 0, 1, 1,
-0.5028589, -0.4102471, -0.7441025, 0, 0, 0, 1, 1,
-0.4994398, 0.4702029, -0.7219729, 1, 1, 1, 1, 1,
-0.4956443, 0.526036, -2.08428, 1, 1, 1, 1, 1,
-0.4917094, -2.040024, -3.583629, 1, 1, 1, 1, 1,
-0.4901474, 0.4165624, -0.09213394, 1, 1, 1, 1, 1,
-0.4873126, -0.7803088, -3.123405, 1, 1, 1, 1, 1,
-0.4859483, -0.03906943, -1.965603, 1, 1, 1, 1, 1,
-0.4820785, 0.9067693, -1.458281, 1, 1, 1, 1, 1,
-0.481075, -0.4805569, -2.785019, 1, 1, 1, 1, 1,
-0.469641, 1.703054, 0.8815052, 1, 1, 1, 1, 1,
-0.4637288, -1.005587, -1.900392, 1, 1, 1, 1, 1,
-0.4625928, 0.253773, -0.8620463, 1, 1, 1, 1, 1,
-0.4601641, -2.044342, -4.008195, 1, 1, 1, 1, 1,
-0.459201, -1.064568, -0.6886488, 1, 1, 1, 1, 1,
-0.4575354, -0.8861081, -3.259456, 1, 1, 1, 1, 1,
-0.4571892, 0.3721924, -0.499165, 1, 1, 1, 1, 1,
-0.456473, 1.753525, 0.3045541, 0, 0, 1, 1, 1,
-0.44904, -0.4346451, -3.43352, 1, 0, 0, 1, 1,
-0.4490358, -2.332507, -2.305595, 1, 0, 0, 1, 1,
-0.443933, -1.059952, -1.787102, 1, 0, 0, 1, 1,
-0.4431421, 1.460096, -1.461909, 1, 0, 0, 1, 1,
-0.4387249, 0.1924957, -1.353459, 1, 0, 0, 1, 1,
-0.4310574, 0.3325314, -0.1833156, 0, 0, 0, 1, 1,
-0.4310262, -1.053298, -2.68806, 0, 0, 0, 1, 1,
-0.4265698, 0.3338014, -0.7427784, 0, 0, 0, 1, 1,
-0.4240081, 1.000826, 0.6104869, 0, 0, 0, 1, 1,
-0.4189754, -1.011127, -2.515262, 0, 0, 0, 1, 1,
-0.4183813, 0.9277881, 1.041605, 0, 0, 0, 1, 1,
-0.4180504, -0.1376076, -3.525803, 0, 0, 0, 1, 1,
-0.415203, 0.1434628, -0.6327552, 1, 1, 1, 1, 1,
-0.4115894, 0.8485899, -0.1597556, 1, 1, 1, 1, 1,
-0.4101667, -1.091361, -3.88142, 1, 1, 1, 1, 1,
-0.4060277, -0.02344981, -1.675537, 1, 1, 1, 1, 1,
-0.4019029, -0.3302854, -2.191138, 1, 1, 1, 1, 1,
-0.3948378, 0.1635886, -1.988075, 1, 1, 1, 1, 1,
-0.3928931, 0.1347276, 0.07988404, 1, 1, 1, 1, 1,
-0.3914841, 1.241297, -0.7068725, 1, 1, 1, 1, 1,
-0.387464, 0.1348529, -2.076414, 1, 1, 1, 1, 1,
-0.3865678, 0.8922902, -1.433991, 1, 1, 1, 1, 1,
-0.3737232, -0.7645765, -3.67391, 1, 1, 1, 1, 1,
-0.3722908, 0.0792345, 0.04798907, 1, 1, 1, 1, 1,
-0.3643721, 0.6237576, 1.275725, 1, 1, 1, 1, 1,
-0.3586136, -1.80733, -1.211103, 1, 1, 1, 1, 1,
-0.3584621, 0.9051824, -1.13487, 1, 1, 1, 1, 1,
-0.3571202, -0.572544, -3.263323, 0, 0, 1, 1, 1,
-0.354513, 2.125107, 0.5632986, 1, 0, 0, 1, 1,
-0.353664, 0.5112316, -1.051941, 1, 0, 0, 1, 1,
-0.3523677, -1.195114, -3.869035, 1, 0, 0, 1, 1,
-0.3489937, 0.4338437, -2.524703, 1, 0, 0, 1, 1,
-0.3462421, 0.4518931, 0.4353613, 1, 0, 0, 1, 1,
-0.3456255, 1.678239, -0.771639, 0, 0, 0, 1, 1,
-0.3453327, -0.9475683, -2.265327, 0, 0, 0, 1, 1,
-0.3439592, -1.544099, -2.964027, 0, 0, 0, 1, 1,
-0.3414605, -1.718436, -4.757913, 0, 0, 0, 1, 1,
-0.3364884, 1.293786, -0.1939862, 0, 0, 0, 1, 1,
-0.3353342, -1.648059, -2.214716, 0, 0, 0, 1, 1,
-0.3345643, 0.6636949, -0.2530214, 0, 0, 0, 1, 1,
-0.3335854, -0.2367058, -3.438071, 1, 1, 1, 1, 1,
-0.3312944, -1.007958, -2.524287, 1, 1, 1, 1, 1,
-0.3256121, 0.3919812, -2.410042, 1, 1, 1, 1, 1,
-0.324974, 0.3187102, 0.1053936, 1, 1, 1, 1, 1,
-0.3244846, 0.5207531, -0.5693663, 1, 1, 1, 1, 1,
-0.3243145, -0.3134601, -0.09640823, 1, 1, 1, 1, 1,
-0.3218674, 0.345275, -0.7811555, 1, 1, 1, 1, 1,
-0.3056823, 0.8255455, -0.04277362, 1, 1, 1, 1, 1,
-0.3025962, -0.484715, -4.284714, 1, 1, 1, 1, 1,
-0.3024334, 0.8123381, -1.102926, 1, 1, 1, 1, 1,
-0.3005511, 0.380693, -1.67891, 1, 1, 1, 1, 1,
-0.3005384, 1.984818, 1.714295, 1, 1, 1, 1, 1,
-0.2982883, -0.6267258, -2.425899, 1, 1, 1, 1, 1,
-0.2973031, 0.6775463, -0.3505253, 1, 1, 1, 1, 1,
-0.2908508, 0.5246124, -0.8806647, 1, 1, 1, 1, 1,
-0.290376, -2.128893, -2.210392, 0, 0, 1, 1, 1,
-0.2902144, -1.996427, -2.845834, 1, 0, 0, 1, 1,
-0.2894068, -2.119809, -3.178644, 1, 0, 0, 1, 1,
-0.2891253, 1.403445, -0.3312445, 1, 0, 0, 1, 1,
-0.2831691, -0.2429067, -1.422256, 1, 0, 0, 1, 1,
-0.2765136, 1.599884, -0.04780371, 1, 0, 0, 1, 1,
-0.2762934, 0.1131828, -2.149307, 0, 0, 0, 1, 1,
-0.2756955, -0.5229301, -2.327538, 0, 0, 0, 1, 1,
-0.275158, 2.549158, -1.26804, 0, 0, 0, 1, 1,
-0.2738785, 0.2057897, 0.06625358, 0, 0, 0, 1, 1,
-0.2692439, -1.18757, -1.845307, 0, 0, 0, 1, 1,
-0.2667253, 1.029636, -0.445912, 0, 0, 0, 1, 1,
-0.2614988, -0.954061, -3.434165, 0, 0, 0, 1, 1,
-0.2600064, -0.9284637, -2.961435, 1, 1, 1, 1, 1,
-0.2573508, 0.279626, -0.2856464, 1, 1, 1, 1, 1,
-0.2549776, -0.771406, -1.95804, 1, 1, 1, 1, 1,
-0.2527591, 0.7926156, -0.8700605, 1, 1, 1, 1, 1,
-0.2480357, -0.3525334, -2.14817, 1, 1, 1, 1, 1,
-0.2478047, 0.4525033, 0.2884528, 1, 1, 1, 1, 1,
-0.2474726, -1.40799, -2.905364, 1, 1, 1, 1, 1,
-0.2445978, -0.6264406, -1.746711, 1, 1, 1, 1, 1,
-0.2441175, -1.034157, -2.829633, 1, 1, 1, 1, 1,
-0.2438789, -0.4622239, -2.100731, 1, 1, 1, 1, 1,
-0.2362047, 0.9824176, 0.7132878, 1, 1, 1, 1, 1,
-0.2331465, 0.92553, -1.297263, 1, 1, 1, 1, 1,
-0.2313855, 1.46486, 1.74353, 1, 1, 1, 1, 1,
-0.2272267, -0.2604327, -2.750039, 1, 1, 1, 1, 1,
-0.2260317, 0.6889611, 0.9097371, 1, 1, 1, 1, 1,
-0.2246026, -1.118875, -2.709106, 0, 0, 1, 1, 1,
-0.2236927, 0.3993252, -0.1042737, 1, 0, 0, 1, 1,
-0.2225726, 1.091599, -0.3780645, 1, 0, 0, 1, 1,
-0.2223239, 0.2819897, -1.455038, 1, 0, 0, 1, 1,
-0.2181567, 0.9419054, 1.565488, 1, 0, 0, 1, 1,
-0.2178337, -0.793219, -1.72079, 1, 0, 0, 1, 1,
-0.2141279, 0.5880923, 0.644753, 0, 0, 0, 1, 1,
-0.2139292, -0.5566129, -2.374317, 0, 0, 0, 1, 1,
-0.2093229, 0.2427696, -0.8238589, 0, 0, 0, 1, 1,
-0.2043735, 1.155872, -0.3879977, 0, 0, 0, 1, 1,
-0.1990404, -0.4310294, -3.219954, 0, 0, 0, 1, 1,
-0.1909349, 0.6263009, -2.4401, 0, 0, 0, 1, 1,
-0.1901055, 1.771635, 0.5195863, 0, 0, 0, 1, 1,
-0.1877324, -0.1678682, -1.855285, 1, 1, 1, 1, 1,
-0.1782086, -0.6693186, -2.123348, 1, 1, 1, 1, 1,
-0.1780807, -0.4232774, -4.2098, 1, 1, 1, 1, 1,
-0.1757642, -0.8274572, -2.412632, 1, 1, 1, 1, 1,
-0.1733815, 0.3578269, -2.088543, 1, 1, 1, 1, 1,
-0.1586952, -2.036038, -3.056948, 1, 1, 1, 1, 1,
-0.1561801, 0.3130188, -0.438565, 1, 1, 1, 1, 1,
-0.1537275, 0.8857242, 0.9110202, 1, 1, 1, 1, 1,
-0.1481145, -1.462759, -3.126236, 1, 1, 1, 1, 1,
-0.142107, -0.6741773, -2.150624, 1, 1, 1, 1, 1,
-0.1420294, -0.1993233, -3.564856, 1, 1, 1, 1, 1,
-0.1406923, -0.2692364, -2.924235, 1, 1, 1, 1, 1,
-0.1395673, -1.248595, -3.290998, 1, 1, 1, 1, 1,
-0.1394321, 0.4922053, 1.415268, 1, 1, 1, 1, 1,
-0.1333313, -0.531238, -3.547668, 1, 1, 1, 1, 1,
-0.1322674, 1.308486, 1.819548, 0, 0, 1, 1, 1,
-0.127095, -2.032125, -2.083676, 1, 0, 0, 1, 1,
-0.1144425, -0.8313871, -2.759221, 1, 0, 0, 1, 1,
-0.1138895, 0.8995341, 1.057711, 1, 0, 0, 1, 1,
-0.1125907, 0.6520367, -0.9193109, 1, 0, 0, 1, 1,
-0.1109281, 1.088006, -1.576547, 1, 0, 0, 1, 1,
-0.1095809, 0.3284864, -1.936497, 0, 0, 0, 1, 1,
-0.1009213, 1.052687, 0.7818393, 0, 0, 0, 1, 1,
-0.1006953, 1.244972, 0.2958576, 0, 0, 0, 1, 1,
-0.09907501, 0.6424517, 2.071308, 0, 0, 0, 1, 1,
-0.09673725, -1.457641, -3.407423, 0, 0, 0, 1, 1,
-0.09631179, -1.25531, -3.955274, 0, 0, 0, 1, 1,
-0.09456377, 2.581568, 1.03628, 0, 0, 0, 1, 1,
-0.09273461, -1.240398, -3.228674, 1, 1, 1, 1, 1,
-0.09063371, 2.22876, -0.5013069, 1, 1, 1, 1, 1,
-0.08967866, 0.3978311, -0.8751011, 1, 1, 1, 1, 1,
-0.08965123, -0.5972881, -1.248467, 1, 1, 1, 1, 1,
-0.08884053, -0.8313535, -3.474358, 1, 1, 1, 1, 1,
-0.0851727, 0.8446227, 1.242096, 1, 1, 1, 1, 1,
-0.07860241, 0.1268445, 0.3742566, 1, 1, 1, 1, 1,
-0.07844787, 0.4105464, -1.634881, 1, 1, 1, 1, 1,
-0.06713216, 0.1514295, -2.942129, 1, 1, 1, 1, 1,
-0.06361549, -0.8059999, -4.409218, 1, 1, 1, 1, 1,
-0.06028081, -0.885934, -3.056871, 1, 1, 1, 1, 1,
-0.05659416, 1.15223, 0.2786578, 1, 1, 1, 1, 1,
-0.05062345, 0.05922728, -1.427508, 1, 1, 1, 1, 1,
-0.04940645, -0.6556901, -4.976056, 1, 1, 1, 1, 1,
-0.04828644, 0.2639188, -0.4825586, 1, 1, 1, 1, 1,
-0.04507903, -0.1604374, -1.728453, 0, 0, 1, 1, 1,
-0.02825588, -0.09605933, -2.501771, 1, 0, 0, 1, 1,
-0.02511035, -0.4757665, -3.072062, 1, 0, 0, 1, 1,
-0.02352102, 0.7114245, 0.1950685, 1, 0, 0, 1, 1,
-0.02302709, -1.384324, -2.947155, 1, 0, 0, 1, 1,
-0.01532228, -0.7451972, -2.839366, 1, 0, 0, 1, 1,
-0.01521316, -1.848077, -3.314543, 0, 0, 0, 1, 1,
-0.01058638, 0.04425662, -0.6959217, 0, 0, 0, 1, 1,
-0.006998024, -0.7143335, -3.60157, 0, 0, 0, 1, 1,
0.001607759, 0.1263667, 0.4646574, 0, 0, 0, 1, 1,
0.00161001, -0.09785126, 2.428516, 0, 0, 0, 1, 1,
0.003916651, -0.3508517, 3.756127, 0, 0, 0, 1, 1,
0.007596972, -2.760618, 2.326012, 0, 0, 0, 1, 1,
0.01524901, 0.4160486, -1.658689, 1, 1, 1, 1, 1,
0.01678878, 0.9196234, 0.1035381, 1, 1, 1, 1, 1,
0.02014878, 1.459278, 0.9961494, 1, 1, 1, 1, 1,
0.02059139, 0.7928542, -1.092713, 1, 1, 1, 1, 1,
0.02066421, -1.592889, 2.230744, 1, 1, 1, 1, 1,
0.02530219, -0.552191, 4.264833, 1, 1, 1, 1, 1,
0.02557841, -0.5781116, 3.807466, 1, 1, 1, 1, 1,
0.02726191, -1.904364, 2.395002, 1, 1, 1, 1, 1,
0.0285065, 0.9549343, 0.007806768, 1, 1, 1, 1, 1,
0.03348668, -0.498752, 4.260887, 1, 1, 1, 1, 1,
0.03435279, -0.1899984, 5.156592, 1, 1, 1, 1, 1,
0.03877999, 1.65252, -0.8105595, 1, 1, 1, 1, 1,
0.04110286, 0.5736581, -0.2302071, 1, 1, 1, 1, 1,
0.04378188, 1.051785, -0.6723415, 1, 1, 1, 1, 1,
0.04432879, -0.3629793, 2.300505, 1, 1, 1, 1, 1,
0.04864602, -1.002823, 3.241086, 0, 0, 1, 1, 1,
0.05200636, -1.592615, 5.013383, 1, 0, 0, 1, 1,
0.05387035, -0.4266362, 3.267334, 1, 0, 0, 1, 1,
0.05516903, 0.7852957, 0.410504, 1, 0, 0, 1, 1,
0.05606374, 1.582522, 1.941363, 1, 0, 0, 1, 1,
0.0588979, 1.73049, 0.1962326, 1, 0, 0, 1, 1,
0.05977079, -0.4442799, 1.939309, 0, 0, 0, 1, 1,
0.06080223, 1.762815, -0.6581331, 0, 0, 0, 1, 1,
0.06725056, -0.5102692, 2.418, 0, 0, 0, 1, 1,
0.06946263, 0.05127678, 0.9658421, 0, 0, 0, 1, 1,
0.07257077, -0.3428476, 3.368788, 0, 0, 0, 1, 1,
0.08014608, -0.1902863, 2.80446, 0, 0, 0, 1, 1,
0.08042535, 0.9539464, -0.6154789, 0, 0, 0, 1, 1,
0.08088592, 1.803561, 0.9093501, 1, 1, 1, 1, 1,
0.0844241, -0.995558, 2.528167, 1, 1, 1, 1, 1,
0.0856615, -0.6980301, 5.105388, 1, 1, 1, 1, 1,
0.08816369, 0.8697832, 0.7522591, 1, 1, 1, 1, 1,
0.08831556, -0.04937769, 1.814239, 1, 1, 1, 1, 1,
0.08957162, 1.553135, -0.7202038, 1, 1, 1, 1, 1,
0.09122722, -0.2659414, 2.635096, 1, 1, 1, 1, 1,
0.0915657, 0.2548455, -0.4175655, 1, 1, 1, 1, 1,
0.09232581, -1.406137, 3.682634, 1, 1, 1, 1, 1,
0.09454096, 0.05591009, 1.398405, 1, 1, 1, 1, 1,
0.09743759, 1.664024, -0.2249299, 1, 1, 1, 1, 1,
0.1002642, 1.4136, 0.5321935, 1, 1, 1, 1, 1,
0.1012587, -0.157844, 2.256296, 1, 1, 1, 1, 1,
0.1103936, 0.7974608, -0.254411, 1, 1, 1, 1, 1,
0.113771, 0.3271961, -0.561996, 1, 1, 1, 1, 1,
0.1138516, -0.1955569, 2.533086, 0, 0, 1, 1, 1,
0.1156009, -0.4624467, 2.241359, 1, 0, 0, 1, 1,
0.12008, 0.1180156, 0.5214046, 1, 0, 0, 1, 1,
0.1248871, 1.137892, -0.05342968, 1, 0, 0, 1, 1,
0.1259473, -1.522476, 1.881421, 1, 0, 0, 1, 1,
0.1264492, -0.06888511, 2.094564, 1, 0, 0, 1, 1,
0.1341242, -0.9190328, 3.114493, 0, 0, 0, 1, 1,
0.1342095, -0.1330737, 0.7999493, 0, 0, 0, 1, 1,
0.1388729, -0.8073739, 2.771327, 0, 0, 0, 1, 1,
0.1452341, -0.1854833, 1.395225, 0, 0, 0, 1, 1,
0.1491237, -0.4178505, 1.670029, 0, 0, 0, 1, 1,
0.1516415, -0.6445954, 1.84377, 0, 0, 0, 1, 1,
0.1543753, 0.4195961, 1.557632, 0, 0, 0, 1, 1,
0.157926, 0.2405292, 1.010761, 1, 1, 1, 1, 1,
0.1585104, 1.01763, -1.155535, 1, 1, 1, 1, 1,
0.1608077, -1.174566, 2.459231, 1, 1, 1, 1, 1,
0.1663406, 0.4875339, 0.4916451, 1, 1, 1, 1, 1,
0.1668732, 0.5167155, 0.7264091, 1, 1, 1, 1, 1,
0.1687244, -1.74465, 3.1274, 1, 1, 1, 1, 1,
0.1687653, 1.379012, -0.2497027, 1, 1, 1, 1, 1,
0.1770849, 0.01100278, -1.000262, 1, 1, 1, 1, 1,
0.1874115, 1.149859, -0.8220935, 1, 1, 1, 1, 1,
0.1876798, -0.06319613, 2.423886, 1, 1, 1, 1, 1,
0.1879499, 0.06979865, 0.4094802, 1, 1, 1, 1, 1,
0.1886469, 0.1997157, 0.3692538, 1, 1, 1, 1, 1,
0.1893228, 0.3218627, 2.415387, 1, 1, 1, 1, 1,
0.1973705, 2.213061, 0.3804632, 1, 1, 1, 1, 1,
0.1973795, 1.326174, -0.3138413, 1, 1, 1, 1, 1,
0.200004, -0.9044905, 3.531799, 0, 0, 1, 1, 1,
0.2057925, 0.8080574, -0.4283777, 1, 0, 0, 1, 1,
0.2058201, 1.578509, -0.3488049, 1, 0, 0, 1, 1,
0.2141481, 0.846898, -1.348918, 1, 0, 0, 1, 1,
0.2176171, 0.5217543, 0.5980387, 1, 0, 0, 1, 1,
0.2199893, -0.5422927, 3.312966, 1, 0, 0, 1, 1,
0.2216301, 0.9408358, 0.864826, 0, 0, 0, 1, 1,
0.2229154, 2.005802, 0.1507664, 0, 0, 0, 1, 1,
0.2230274, 1.730268, 0.19212, 0, 0, 0, 1, 1,
0.2232045, -1.013775, 2.701296, 0, 0, 0, 1, 1,
0.2302393, -0.4041093, 3.971631, 0, 0, 0, 1, 1,
0.2312825, 1.14818, 0.714346, 0, 0, 0, 1, 1,
0.2324879, 0.3328719, 0.8125944, 0, 0, 0, 1, 1,
0.2339924, -0.07924727, 4.074053, 1, 1, 1, 1, 1,
0.2351539, 0.3056988, 1.327849, 1, 1, 1, 1, 1,
0.2384173, 0.6547332, 0.8116161, 1, 1, 1, 1, 1,
0.2405763, -0.9372744, 3.063117, 1, 1, 1, 1, 1,
0.2410083, -0.009245795, 1.670932, 1, 1, 1, 1, 1,
0.2418915, -0.979123, 3.645785, 1, 1, 1, 1, 1,
0.2463464, 0.3765296, -0.4448968, 1, 1, 1, 1, 1,
0.2467775, -0.6931509, 3.189974, 1, 1, 1, 1, 1,
0.2521651, 0.3480856, -0.3526471, 1, 1, 1, 1, 1,
0.2538003, -0.5926176, 2.321417, 1, 1, 1, 1, 1,
0.2608145, -2.343152, 2.898863, 1, 1, 1, 1, 1,
0.26083, 0.001563058, 3.933862, 1, 1, 1, 1, 1,
0.2645123, 0.9442906, 0.3964798, 1, 1, 1, 1, 1,
0.2668502, 1.764692, 0.2836264, 1, 1, 1, 1, 1,
0.2676438, 0.5743197, -0.09011713, 1, 1, 1, 1, 1,
0.2682128, -2.142316, 2.081835, 0, 0, 1, 1, 1,
0.2689259, 0.5258475, 1.782875, 1, 0, 0, 1, 1,
0.274609, -1.741166, 4.409556, 1, 0, 0, 1, 1,
0.2837904, -2.163539, 4.133754, 1, 0, 0, 1, 1,
0.2848077, 0.4687345, 1.85432, 1, 0, 0, 1, 1,
0.2855825, -0.5624714, 2.58166, 1, 0, 0, 1, 1,
0.287082, 0.5297897, -0.3703265, 0, 0, 0, 1, 1,
0.2906365, -1.527088, 3.559808, 0, 0, 0, 1, 1,
0.2907192, -2.875441, 2.794443, 0, 0, 0, 1, 1,
0.293213, -0.8122704, 4.266492, 0, 0, 0, 1, 1,
0.2934191, 1.134186, -1.03281, 0, 0, 0, 1, 1,
0.2967169, 0.6746601, -0.2257123, 0, 0, 0, 1, 1,
0.3074105, 0.1953769, 1.2971, 0, 0, 0, 1, 1,
0.3110418, 0.9849361, 1.621109, 1, 1, 1, 1, 1,
0.3121358, 0.3898398, 0.5022676, 1, 1, 1, 1, 1,
0.3175285, -1.233893, 3.849823, 1, 1, 1, 1, 1,
0.3214644, -0.616178, 2.55533, 1, 1, 1, 1, 1,
0.324752, -0.3208611, 1.138366, 1, 1, 1, 1, 1,
0.325109, 0.3104208, 1.057891, 1, 1, 1, 1, 1,
0.3297612, -0.5021843, 1.899341, 1, 1, 1, 1, 1,
0.3301988, 1.202965, 1.06794, 1, 1, 1, 1, 1,
0.3311202, -0.4522487, 1.420597, 1, 1, 1, 1, 1,
0.3349109, -0.7626444, 1.238193, 1, 1, 1, 1, 1,
0.3442855, -1.181367, 2.116305, 1, 1, 1, 1, 1,
0.3466442, 1.187454, 0.2106153, 1, 1, 1, 1, 1,
0.3483186, -0.7566016, 3.204829, 1, 1, 1, 1, 1,
0.3491417, -0.1634663, 0.9960092, 1, 1, 1, 1, 1,
0.3561584, 0.791607, -0.01086225, 1, 1, 1, 1, 1,
0.3634351, -0.7655472, 3.870529, 0, 0, 1, 1, 1,
0.3635437, 1.453514, 0.741922, 1, 0, 0, 1, 1,
0.3667452, 0.3359076, -0.1463111, 1, 0, 0, 1, 1,
0.3667517, 1.08828, 1.140669, 1, 0, 0, 1, 1,
0.367351, -0.6851175, 2.890332, 1, 0, 0, 1, 1,
0.372295, -0.1232744, 1.6253, 1, 0, 0, 1, 1,
0.376824, -1.234681, 3.351191, 0, 0, 0, 1, 1,
0.379711, -1.046578, 1.261329, 0, 0, 0, 1, 1,
0.3802447, -0.8587271, 3.13245, 0, 0, 0, 1, 1,
0.3849123, 0.09660844, -0.007510284, 0, 0, 0, 1, 1,
0.3874267, 0.5132098, 0.8506517, 0, 0, 0, 1, 1,
0.3892873, -1.00719, 2.969386, 0, 0, 0, 1, 1,
0.3981, 0.7524238, 0.8437538, 0, 0, 0, 1, 1,
0.4035629, -0.6222017, 1.257244, 1, 1, 1, 1, 1,
0.4060516, 0.3874267, 1.01863, 1, 1, 1, 1, 1,
0.4063382, 1.680848, -0.08163907, 1, 1, 1, 1, 1,
0.4066039, 0.9806184, 0.5753657, 1, 1, 1, 1, 1,
0.4072196, -0.5196605, 4.681101, 1, 1, 1, 1, 1,
0.4082727, -0.3221039, 2.68229, 1, 1, 1, 1, 1,
0.4101478, 0.6845372, -0.3812017, 1, 1, 1, 1, 1,
0.4139101, -0.4674087, 2.054921, 1, 1, 1, 1, 1,
0.4151713, -0.2503618, 2.083342, 1, 1, 1, 1, 1,
0.4157917, 0.6148725, -0.8860053, 1, 1, 1, 1, 1,
0.4169565, 1.317131, 1.408428, 1, 1, 1, 1, 1,
0.4178267, -1.521379, 2.610821, 1, 1, 1, 1, 1,
0.4212884, -0.3570739, 4.006675, 1, 1, 1, 1, 1,
0.4238002, 0.8253584, -0.8141888, 1, 1, 1, 1, 1,
0.4280494, 0.9179003, 0.5492873, 1, 1, 1, 1, 1,
0.4347282, -1.702968, 1.673384, 0, 0, 1, 1, 1,
0.435519, -0.6537525, 1.105508, 1, 0, 0, 1, 1,
0.435862, 0.08005475, -0.02522443, 1, 0, 0, 1, 1,
0.4407987, -0.3002823, 1.56584, 1, 0, 0, 1, 1,
0.4525698, 1.817606, -1.360156, 1, 0, 0, 1, 1,
0.453355, 0.2404116, 1.279995, 1, 0, 0, 1, 1,
0.4671494, -0.6678724, 1.929181, 0, 0, 0, 1, 1,
0.4681564, -0.1414462, 2.906631, 0, 0, 0, 1, 1,
0.4760564, -0.05556664, 0.5294995, 0, 0, 0, 1, 1,
0.4763827, 0.03109748, 1.46423, 0, 0, 0, 1, 1,
0.4774809, -0.4669781, 0.3050274, 0, 0, 0, 1, 1,
0.4788627, -0.6174714, 4.517568, 0, 0, 0, 1, 1,
0.4828686, 0.5386292, -0.1122166, 0, 0, 0, 1, 1,
0.483415, -0.9299487, 2.558985, 1, 1, 1, 1, 1,
0.4843182, -0.8734184, 3.585967, 1, 1, 1, 1, 1,
0.4881651, -1.346873, 1.511317, 1, 1, 1, 1, 1,
0.4905322, -0.4899091, 1.49694, 1, 1, 1, 1, 1,
0.4913949, -1.053695, 2.231781, 1, 1, 1, 1, 1,
0.4928829, 0.3964001, 0.7146674, 1, 1, 1, 1, 1,
0.4954274, -3.303493, 4.632946, 1, 1, 1, 1, 1,
0.4954906, -1.144051, 2.971507, 1, 1, 1, 1, 1,
0.5046071, -0.5743821, 3.748458, 1, 1, 1, 1, 1,
0.505066, 0.768414, 2.013041, 1, 1, 1, 1, 1,
0.5053908, -0.3254567, -0.6248603, 1, 1, 1, 1, 1,
0.5092665, 0.05655584, 0.2612239, 1, 1, 1, 1, 1,
0.5118999, 0.8193775, 0.229725, 1, 1, 1, 1, 1,
0.5143026, -0.7258877, 2.258153, 1, 1, 1, 1, 1,
0.5149161, -0.2759894, 3.208086, 1, 1, 1, 1, 1,
0.5156505, -0.8330563, 2.776943, 0, 0, 1, 1, 1,
0.5186371, 0.3522262, 1.360695, 1, 0, 0, 1, 1,
0.5192489, 0.464733, 2.177272, 1, 0, 0, 1, 1,
0.5202037, -0.3837225, 4.800794, 1, 0, 0, 1, 1,
0.5245003, 0.837799, -0.1342021, 1, 0, 0, 1, 1,
0.5278475, -0.04491855, 1.947438, 1, 0, 0, 1, 1,
0.5281678, -0.1402437, 1.62162, 0, 0, 0, 1, 1,
0.5282782, 0.01850817, 1.607009, 0, 0, 0, 1, 1,
0.532494, 0.7248242, 0.1095754, 0, 0, 0, 1, 1,
0.5324979, -0.881595, 0.1165649, 0, 0, 0, 1, 1,
0.5336438, 0.2564376, 2.175881, 0, 0, 0, 1, 1,
0.5340026, -0.804163, 1.560446, 0, 0, 0, 1, 1,
0.5393946, -2.008854, 1.253923, 0, 0, 0, 1, 1,
0.5416933, 1.400965, 1.337561, 1, 1, 1, 1, 1,
0.5422628, 0.4402418, -0.4409285, 1, 1, 1, 1, 1,
0.5443005, 0.3394804, 0.6269351, 1, 1, 1, 1, 1,
0.546285, -0.09594643, 2.492017, 1, 1, 1, 1, 1,
0.5553485, -0.3867617, 2.678827, 1, 1, 1, 1, 1,
0.5604761, 0.8457795, 2.057312, 1, 1, 1, 1, 1,
0.5618979, 0.6190862, 1.745842, 1, 1, 1, 1, 1,
0.5692223, 0.06948253, 0.3942505, 1, 1, 1, 1, 1,
0.5734627, 0.04241387, 0.4775749, 1, 1, 1, 1, 1,
0.5748907, 0.4945724, 3.089594, 1, 1, 1, 1, 1,
0.5770016, -0.1900118, 2.15166, 1, 1, 1, 1, 1,
0.5772933, -0.4679881, 2.877197, 1, 1, 1, 1, 1,
0.5782539, 1.850254, -1.261896, 1, 1, 1, 1, 1,
0.5820113, 0.6294488, 1.603548, 1, 1, 1, 1, 1,
0.5849444, 0.3422474, 1.019947, 1, 1, 1, 1, 1,
0.5946493, -0.4572939, 3.132868, 0, 0, 1, 1, 1,
0.5975649, -0.1993666, 2.658481, 1, 0, 0, 1, 1,
0.6007534, -0.571757, 3.127163, 1, 0, 0, 1, 1,
0.6098823, -1.074172, 3.112081, 1, 0, 0, 1, 1,
0.6104493, -0.7654889, 2.842351, 1, 0, 0, 1, 1,
0.6152866, -0.501863, 2.595986, 1, 0, 0, 1, 1,
0.6158686, -0.4072447, 3.262422, 0, 0, 0, 1, 1,
0.6207214, -0.06800363, 2.295438, 0, 0, 0, 1, 1,
0.621123, -0.5024061, 2.091877, 0, 0, 0, 1, 1,
0.6222627, -1.612951, 1.463944, 0, 0, 0, 1, 1,
0.6248481, 0.662057, 1.076122, 0, 0, 0, 1, 1,
0.6264111, 0.7165271, 2.023545, 0, 0, 0, 1, 1,
0.6290537, 0.01171487, 1.301694, 0, 0, 0, 1, 1,
0.6356323, -1.057059, 2.936105, 1, 1, 1, 1, 1,
0.6372659, -0.2604357, 3.3101, 1, 1, 1, 1, 1,
0.6418888, -0.5391611, 4.623988, 1, 1, 1, 1, 1,
0.6432471, 0.5928162, 1.176008, 1, 1, 1, 1, 1,
0.6482212, -1.067508, 3.581421, 1, 1, 1, 1, 1,
0.6493163, 1.066952, 2.676867, 1, 1, 1, 1, 1,
0.6568292, 0.4857363, 1.372195, 1, 1, 1, 1, 1,
0.6658702, 1.009439, 1.033069, 1, 1, 1, 1, 1,
0.6658729, -0.2099852, -0.5966241, 1, 1, 1, 1, 1,
0.6667594, 1.024825, -0.07141376, 1, 1, 1, 1, 1,
0.6678275, -0.2559865, 0.4745755, 1, 1, 1, 1, 1,
0.6679914, 2.301904, 0.5582939, 1, 1, 1, 1, 1,
0.6749904, -1.041738, 0.4357829, 1, 1, 1, 1, 1,
0.6773617, 0.2095539, 1.033012, 1, 1, 1, 1, 1,
0.6822686, 1.427847, 0.7937842, 1, 1, 1, 1, 1,
0.6839257, -1.259976, 2.032658, 0, 0, 1, 1, 1,
0.6861078, -0.1923745, 1.954, 1, 0, 0, 1, 1,
0.6864901, 0.8318542, -0.485548, 1, 0, 0, 1, 1,
0.6879494, -0.5640043, 1.164191, 1, 0, 0, 1, 1,
0.6953737, -0.6429149, 3.674504, 1, 0, 0, 1, 1,
0.6954424, -0.102857, -0.1522629, 1, 0, 0, 1, 1,
0.6955669, 0.6870936, 0.3859085, 0, 0, 0, 1, 1,
0.7018238, 0.5170118, 1.609045, 0, 0, 0, 1, 1,
0.7028798, -0.7449026, 2.997537, 0, 0, 0, 1, 1,
0.7054852, 0.6281258, -1.341116, 0, 0, 0, 1, 1,
0.7068251, -0.3527806, 1.636848, 0, 0, 0, 1, 1,
0.7111888, -0.3644688, 2.823755, 0, 0, 0, 1, 1,
0.7193255, -0.8001426, 1.232877, 0, 0, 0, 1, 1,
0.7220786, -0.8748074, 4.168723, 1, 1, 1, 1, 1,
0.7265272, 0.1246091, 2.857644, 1, 1, 1, 1, 1,
0.727283, 1.991955, 0.7710944, 1, 1, 1, 1, 1,
0.727421, -0.2413403, 2.022943, 1, 1, 1, 1, 1,
0.7317717, -1.662698, 1.528027, 1, 1, 1, 1, 1,
0.7339866, 0.72891, -0.1507391, 1, 1, 1, 1, 1,
0.7414727, 0.8222904, -0.0003476474, 1, 1, 1, 1, 1,
0.7430736, -0.3291545, 1.249484, 1, 1, 1, 1, 1,
0.7504448, 1.242056, -1.57088, 1, 1, 1, 1, 1,
0.7511886, -0.3198805, 1.668369, 1, 1, 1, 1, 1,
0.7523366, 1.079465, 0.04417522, 1, 1, 1, 1, 1,
0.7573759, -0.4527124, 3.295858, 1, 1, 1, 1, 1,
0.7585335, -0.3068328, 0.4035608, 1, 1, 1, 1, 1,
0.7589045, 0.6055651, 0.03804529, 1, 1, 1, 1, 1,
0.7595277, 0.7732818, 0.2523619, 1, 1, 1, 1, 1,
0.7625327, 0.1068899, 1.147117, 0, 0, 1, 1, 1,
0.7635249, 0.8052286, 1.119997, 1, 0, 0, 1, 1,
0.769142, -0.5869762, 4.182339, 1, 0, 0, 1, 1,
0.7710184, -0.4645995, 2.750112, 1, 0, 0, 1, 1,
0.771025, -0.3250895, 2.372405, 1, 0, 0, 1, 1,
0.7747437, 0.4873737, 1.815884, 1, 0, 0, 1, 1,
0.7782749, -0.396777, 0.6292399, 0, 0, 0, 1, 1,
0.7828258, 0.111503, 1.274383, 0, 0, 0, 1, 1,
0.7861782, 0.6069318, 1.525715, 0, 0, 0, 1, 1,
0.7884643, 2.071171, 1.566318, 0, 0, 0, 1, 1,
0.7921014, 0.0156048, -1.318957, 0, 0, 0, 1, 1,
0.7930831, 0.4848006, 2.143682, 0, 0, 0, 1, 1,
0.8003169, 0.4155621, 2.277728, 0, 0, 0, 1, 1,
0.8008718, 0.5098166, 0.6762177, 1, 1, 1, 1, 1,
0.8026771, -1.482741, 2.66427, 1, 1, 1, 1, 1,
0.8029138, 0.6132963, 0.3853069, 1, 1, 1, 1, 1,
0.8090924, 0.1016761, 0.4874536, 1, 1, 1, 1, 1,
0.8112783, 0.6884032, 1.293218, 1, 1, 1, 1, 1,
0.8130426, 2.13915, -0.4429383, 1, 1, 1, 1, 1,
0.8153119, -1.354154, 1.833292, 1, 1, 1, 1, 1,
0.8154697, 0.158446, 0.9672854, 1, 1, 1, 1, 1,
0.8172598, 0.9359924, 3.02406, 1, 1, 1, 1, 1,
0.8174039, 0.4237373, 3.695254, 1, 1, 1, 1, 1,
0.8240434, -2.556619, 4.196037, 1, 1, 1, 1, 1,
0.8253158, 0.08598188, 0.8711217, 1, 1, 1, 1, 1,
0.8291709, -0.4167479, 3.950692, 1, 1, 1, 1, 1,
0.8325648, -0.7278559, 2.09604, 1, 1, 1, 1, 1,
0.8339549, -1.369233, 3.178279, 1, 1, 1, 1, 1,
0.8348342, -1.523441, 2.832492, 0, 0, 1, 1, 1,
0.8365925, 0.2401756, 0.920989, 1, 0, 0, 1, 1,
0.8379494, -0.8867531, 1.503928, 1, 0, 0, 1, 1,
0.8380339, -1.263768, 4.110072, 1, 0, 0, 1, 1,
0.8392208, -0.3333937, 1.122573, 1, 0, 0, 1, 1,
0.8394263, -0.5030519, 3.71155, 1, 0, 0, 1, 1,
0.8405081, 1.3233, 0.7110165, 0, 0, 0, 1, 1,
0.8410681, 1.224956, 1.852045, 0, 0, 0, 1, 1,
0.8421899, 0.2448304, -0.03239346, 0, 0, 0, 1, 1,
0.842995, 0.1230194, 0.1166245, 0, 0, 0, 1, 1,
0.8446924, 0.2395717, 1.104354, 0, 0, 0, 1, 1,
0.8462625, -0.7772436, 2.489748, 0, 0, 0, 1, 1,
0.8491451, 1.427189, 1.539822, 0, 0, 0, 1, 1,
0.8511965, -0.6550483, 2.658559, 1, 1, 1, 1, 1,
0.8526014, 2.469043, 0.1745485, 1, 1, 1, 1, 1,
0.8534601, 0.5750168, 0.02263542, 1, 1, 1, 1, 1,
0.8538449, -0.3955495, 2.062651, 1, 1, 1, 1, 1,
0.8562471, 0.02388799, 1.334014, 1, 1, 1, 1, 1,
0.8567119, 0.5487233, 1.524681, 1, 1, 1, 1, 1,
0.8598202, -0.710088, 3.047623, 1, 1, 1, 1, 1,
0.8629507, 0.3829364, 1.444252, 1, 1, 1, 1, 1,
0.8662488, -0.1094591, 1.585374, 1, 1, 1, 1, 1,
0.8679233, 0.6354765, 2.409238, 1, 1, 1, 1, 1,
0.8693414, 0.9095931, 0.9531986, 1, 1, 1, 1, 1,
0.8765609, -0.2631905, 2.397589, 1, 1, 1, 1, 1,
0.8817489, 0.3924685, 1.073174, 1, 1, 1, 1, 1,
0.8915579, -1.587996, 2.314418, 1, 1, 1, 1, 1,
0.8926078, 1.243042, 1.2474, 1, 1, 1, 1, 1,
0.8967806, 0.309036, 0.4370568, 0, 0, 1, 1, 1,
0.9055285, 0.1102128, 2.944421, 1, 0, 0, 1, 1,
0.9055808, -0.4332408, 4.507623, 1, 0, 0, 1, 1,
0.9118704, 2.683168, -0.7577438, 1, 0, 0, 1, 1,
0.9184594, -0.9686865, 1.16399, 1, 0, 0, 1, 1,
0.9234877, 0.2142935, 0.3069401, 1, 0, 0, 1, 1,
0.9241785, -1.233479, 3.750411, 0, 0, 0, 1, 1,
0.9248915, -0.9722131, 2.196807, 0, 0, 0, 1, 1,
0.9281105, 0.8627827, 1.610237, 0, 0, 0, 1, 1,
0.9282202, -3.215312, 2.659301, 0, 0, 0, 1, 1,
0.931325, -0.4932702, 2.345689, 0, 0, 0, 1, 1,
0.9334336, -1.077091, 3.187349, 0, 0, 0, 1, 1,
0.9471726, 0.7948927, 1.112605, 0, 0, 0, 1, 1,
0.9475902, 0.9322531, -0.570773, 1, 1, 1, 1, 1,
0.9478637, -1.186228, 0.9398497, 1, 1, 1, 1, 1,
0.953743, 0.3100704, 1.626446, 1, 1, 1, 1, 1,
0.9584431, 0.02379432, 1.992355, 1, 1, 1, 1, 1,
0.9614331, 1.339587, 0.7346976, 1, 1, 1, 1, 1,
0.9627045, 0.1720661, 0.397802, 1, 1, 1, 1, 1,
0.964924, 1.434533, -1.406877, 1, 1, 1, 1, 1,
0.9666659, 1.437901, 1.052055, 1, 1, 1, 1, 1,
0.9668354, -0.7535968, 2.59223, 1, 1, 1, 1, 1,
0.9772041, 1.340234, 0.9814228, 1, 1, 1, 1, 1,
0.9790425, 0.747512, 2.23626, 1, 1, 1, 1, 1,
0.9806058, -0.6768853, 2.407569, 1, 1, 1, 1, 1,
0.9832966, 1.704462, -0.9758302, 1, 1, 1, 1, 1,
0.9868097, -1.632626, 0.7427433, 1, 1, 1, 1, 1,
1.005036, 0.75467, 1.609661, 1, 1, 1, 1, 1,
1.008296, -0.4206478, 3.580551, 0, 0, 1, 1, 1,
1.009288, -0.7799288, 4.026373, 1, 0, 0, 1, 1,
1.018361, 0.2793193, 0.2216003, 1, 0, 0, 1, 1,
1.02189, 1.306063, 0.6698295, 1, 0, 0, 1, 1,
1.02479, 0.9091704, 1.083771, 1, 0, 0, 1, 1,
1.026624, 0.2932036, 1.821815, 1, 0, 0, 1, 1,
1.037923, 1.476072, 2.36013, 0, 0, 0, 1, 1,
1.054391, -1.003172, 2.896063, 0, 0, 0, 1, 1,
1.055791, 0.8975471, -1.572494, 0, 0, 0, 1, 1,
1.058848, -0.9457312, 2.40013, 0, 0, 0, 1, 1,
1.059424, -0.09688368, -1.88787, 0, 0, 0, 1, 1,
1.068336, 0.9865066, 2.721635, 0, 0, 0, 1, 1,
1.071356, 0.0350429, 2.622282, 0, 0, 0, 1, 1,
1.074285, -0.1880878, 1.742518, 1, 1, 1, 1, 1,
1.076174, -1.461755, 2.806395, 1, 1, 1, 1, 1,
1.077286, -1.584799, 3.734335, 1, 1, 1, 1, 1,
1.078943, -1.754239, 2.080041, 1, 1, 1, 1, 1,
1.079007, 0.05645344, 0.5632647, 1, 1, 1, 1, 1,
1.081677, 0.8995941, 0.2609031, 1, 1, 1, 1, 1,
1.084237, -0.6031088, 2.373378, 1, 1, 1, 1, 1,
1.088753, -0.9191659, 3.199813, 1, 1, 1, 1, 1,
1.103458, 2.182524, 0.5049685, 1, 1, 1, 1, 1,
1.104686, -0.7047638, 1.017729, 1, 1, 1, 1, 1,
1.105714, 0.6662132, 2.188791, 1, 1, 1, 1, 1,
1.106825, -0.2044001, 1.081156, 1, 1, 1, 1, 1,
1.108576, -0.1195376, 2.354223, 1, 1, 1, 1, 1,
1.110811, -0.3534827, 2.198545, 1, 1, 1, 1, 1,
1.112873, 0.3137102, 1.56125, 1, 1, 1, 1, 1,
1.114058, -2.333648, 2.472169, 0, 0, 1, 1, 1,
1.114344, -0.6833292, 2.566135, 1, 0, 0, 1, 1,
1.123906, -0.7862204, 3.619923, 1, 0, 0, 1, 1,
1.128983, -1.827819, 2.073867, 1, 0, 0, 1, 1,
1.129335, 1.36894, 0.666856, 1, 0, 0, 1, 1,
1.143507, 0.4683515, 1.882882, 1, 0, 0, 1, 1,
1.146187, -0.4897819, 1.161439, 0, 0, 0, 1, 1,
1.150095, 0.08319677, 2.392167, 0, 0, 0, 1, 1,
1.162048, 0.3454914, -0.4696622, 0, 0, 0, 1, 1,
1.168689, 0.4102081, 3.132672, 0, 0, 0, 1, 1,
1.17002, -0.5538814, 3.074517, 0, 0, 0, 1, 1,
1.170161, 0.129519, 2.291651, 0, 0, 0, 1, 1,
1.170652, 0.9032961, -1.601579, 0, 0, 0, 1, 1,
1.176091, 0.3963523, 2.32415, 1, 1, 1, 1, 1,
1.18841, -0.881138, 1.699993, 1, 1, 1, 1, 1,
1.190908, 0.3334133, 2.844323, 1, 1, 1, 1, 1,
1.195316, 0.585075, 0.7248088, 1, 1, 1, 1, 1,
1.198994, 1.93099, 0.2474521, 1, 1, 1, 1, 1,
1.200387, -0.4102885, 3.260517, 1, 1, 1, 1, 1,
1.204784, 0.7111928, 1.920424, 1, 1, 1, 1, 1,
1.214327, -0.836713, 2.006598, 1, 1, 1, 1, 1,
1.215253, -0.5511024, 3.089921, 1, 1, 1, 1, 1,
1.220023, -0.2742057, 2.205686, 1, 1, 1, 1, 1,
1.220889, -0.007416614, 0.2149529, 1, 1, 1, 1, 1,
1.221948, 0.2105055, 0.2144402, 1, 1, 1, 1, 1,
1.230267, -0.4290919, 0.8376009, 1, 1, 1, 1, 1,
1.233841, -1.163392, 1.41459, 1, 1, 1, 1, 1,
1.235393, -2.556766, 2.751618, 1, 1, 1, 1, 1,
1.236001, 0.8533095, 1.858942, 0, 0, 1, 1, 1,
1.237955, -1.054587, 1.328794, 1, 0, 0, 1, 1,
1.243847, -1.149012, 1.95181, 1, 0, 0, 1, 1,
1.244365, -0.397544, 0.9474185, 1, 0, 0, 1, 1,
1.251318, 0.3618131, 1.43142, 1, 0, 0, 1, 1,
1.251883, -0.8757959, 2.347468, 1, 0, 0, 1, 1,
1.264301, 1.815287, -0.6161233, 0, 0, 0, 1, 1,
1.269391, -0.7013167, 3.028654, 0, 0, 0, 1, 1,
1.279286, 1.637059, -1.579008, 0, 0, 0, 1, 1,
1.303488, -0.1995107, 2.502097, 0, 0, 0, 1, 1,
1.304197, 0.555329, 1.186209, 0, 0, 0, 1, 1,
1.319511, 1.067406, -1.037685, 0, 0, 0, 1, 1,
1.325793, -1.02194, 0.7530044, 0, 0, 0, 1, 1,
1.339382, 1.538463, 2.230066, 1, 1, 1, 1, 1,
1.342941, 0.7708421, 0.9923967, 1, 1, 1, 1, 1,
1.371994, 1.48009, 1.164106, 1, 1, 1, 1, 1,
1.382973, 1.391369, 2.642496, 1, 1, 1, 1, 1,
1.384563, 1.20382, 1.905385, 1, 1, 1, 1, 1,
1.38507, 1.237782, 1.844329, 1, 1, 1, 1, 1,
1.399574, -0.3409258, 0.6171204, 1, 1, 1, 1, 1,
1.401264, 0.8150709, 0.277176, 1, 1, 1, 1, 1,
1.401681, 0.1455111, 1.486525, 1, 1, 1, 1, 1,
1.402546, 0.1244761, 2.726689, 1, 1, 1, 1, 1,
1.438262, -1.418751, 3.97387, 1, 1, 1, 1, 1,
1.440871, 1.661674, 1.008437, 1, 1, 1, 1, 1,
1.452537, 1.417647, 0.9354396, 1, 1, 1, 1, 1,
1.455681, 0.6069039, 0.9499715, 1, 1, 1, 1, 1,
1.474919, -0.2487838, 3.099876, 1, 1, 1, 1, 1,
1.475917, -0.7046316, 2.230544, 0, 0, 1, 1, 1,
1.477787, 0.4917538, 1.154329, 1, 0, 0, 1, 1,
1.501817, -0.4072753, 2.907853, 1, 0, 0, 1, 1,
1.516905, 0.264907, 2.878093, 1, 0, 0, 1, 1,
1.520116, -1.196946, 2.168158, 1, 0, 0, 1, 1,
1.528643, 0.5978457, 1.437028, 1, 0, 0, 1, 1,
1.52889, -0.1932878, 2.884646, 0, 0, 0, 1, 1,
1.529722, -0.2894252, 1.347495, 0, 0, 0, 1, 1,
1.529917, 1.186466, 1.733323, 0, 0, 0, 1, 1,
1.533713, 0.5426697, 1.075081, 0, 0, 0, 1, 1,
1.545104, 0.9327255, -0.11195, 0, 0, 0, 1, 1,
1.557844, -0.07232663, 2.113142, 0, 0, 0, 1, 1,
1.561198, -0.1409703, 2.780192, 0, 0, 0, 1, 1,
1.564097, 0.3688922, 2.165332, 1, 1, 1, 1, 1,
1.56525, -1.862531, 3.227034, 1, 1, 1, 1, 1,
1.570875, 1.164191, 2.15287, 1, 1, 1, 1, 1,
1.576211, -0.2443437, 3.03188, 1, 1, 1, 1, 1,
1.604285, 0.1538452, 3.080598, 1, 1, 1, 1, 1,
1.606993, -0.2474794, 1.536843, 1, 1, 1, 1, 1,
1.610432, -0.6784362, 1.162611, 1, 1, 1, 1, 1,
1.630901, -0.7229246, 2.311614, 1, 1, 1, 1, 1,
1.665552, -0.5311745, 2.4738, 1, 1, 1, 1, 1,
1.677467, 2.11718, 1.23724, 1, 1, 1, 1, 1,
1.684326, 2.113387, 1.08837, 1, 1, 1, 1, 1,
1.689731, -1.733414, 2.229998, 1, 1, 1, 1, 1,
1.69263, 1.625721, 1.318744, 1, 1, 1, 1, 1,
1.697311, 0.1664842, 1.334102, 1, 1, 1, 1, 1,
1.702385, -0.288018, 1.231042, 1, 1, 1, 1, 1,
1.718236, -0.9985205, 4.577556, 0, 0, 1, 1, 1,
1.74024, -0.5763251, 2.044665, 1, 0, 0, 1, 1,
1.741556, -0.2699466, 1.832908, 1, 0, 0, 1, 1,
1.763796, 0.3524127, 2.669088, 1, 0, 0, 1, 1,
1.777391, -0.5024292, 1.235006, 1, 0, 0, 1, 1,
1.779466, 0.05010066, 0.1930519, 1, 0, 0, 1, 1,
1.786731, -1.461722, 3.417158, 0, 0, 0, 1, 1,
1.788109, 0.8933876, 0.7350329, 0, 0, 0, 1, 1,
1.791611, -0.1048449, 0.8571384, 0, 0, 0, 1, 1,
1.798649, 0.2060756, 1.702031, 0, 0, 0, 1, 1,
1.802247, 1.300624, -0.8633065, 0, 0, 0, 1, 1,
1.825282, -0.1560562, 1.451213, 0, 0, 0, 1, 1,
1.837389, -0.5134286, 3.495319, 0, 0, 0, 1, 1,
1.85028, 1.609427, 2.187957, 1, 1, 1, 1, 1,
1.854094, -0.3457117, 2.823226, 1, 1, 1, 1, 1,
1.861888, -1.087506, 1.375306, 1, 1, 1, 1, 1,
1.862378, -0.2385187, 1.34622, 1, 1, 1, 1, 1,
1.886098, -1.813858, 2.882474, 1, 1, 1, 1, 1,
1.9025, -0.05524433, 1.689133, 1, 1, 1, 1, 1,
1.91092, 0.3801108, 1.839006, 1, 1, 1, 1, 1,
1.915685, 1.7092, -0.3109149, 1, 1, 1, 1, 1,
1.919746, -0.5384701, 1.513642, 1, 1, 1, 1, 1,
1.965787, 0.09910505, 1.514689, 1, 1, 1, 1, 1,
2.006557, 0.50648, 1.542038, 1, 1, 1, 1, 1,
2.013043, -0.6280204, 0.1501162, 1, 1, 1, 1, 1,
2.021997, -1.158922, 1.329548, 1, 1, 1, 1, 1,
2.028317, -0.462236, 0.06660426, 1, 1, 1, 1, 1,
2.049253, 1.432565, 0.9426874, 1, 1, 1, 1, 1,
2.169613, 0.5888761, 1.207574, 0, 0, 1, 1, 1,
2.190063, -0.815102, 1.395987, 1, 0, 0, 1, 1,
2.205202, 0.09200889, 1.165376, 1, 0, 0, 1, 1,
2.276896, 0.6569144, 0.1170503, 1, 0, 0, 1, 1,
2.344887, -0.07909393, 1.264839, 1, 0, 0, 1, 1,
2.365963, -0.6401234, 2.340094, 1, 0, 0, 1, 1,
2.371787, -0.5515071, -1.064079, 0, 0, 0, 1, 1,
2.379987, 0.4888002, 1.21758, 0, 0, 0, 1, 1,
2.392314, -0.7131171, 0.1663682, 0, 0, 0, 1, 1,
2.393675, -1.83825, 3.513174, 0, 0, 0, 1, 1,
2.396865, 0.3214214, 0.5988868, 0, 0, 0, 1, 1,
2.43777, -1.672083, -0.9097186, 0, 0, 0, 1, 1,
2.478084, -0.7644303, 0.833945, 0, 0, 0, 1, 1,
2.515121, -0.2014523, 0.5403787, 1, 1, 1, 1, 1,
2.551684, -0.8874497, 1.838163, 1, 1, 1, 1, 1,
2.605959, -1.3116, 2.339975, 1, 1, 1, 1, 1,
2.62489, -0.02494923, 5.996308, 1, 1, 1, 1, 1,
2.782204, 1.499369, 1.592199, 1, 1, 1, 1, 1,
2.841532, -0.03990734, 1.104129, 1, 1, 1, 1, 1,
2.979132, -0.8977718, 1.538995, 1, 1, 1, 1, 1
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
var radius = 9.585022;
var distance = 33.66698;
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
mvMatrix.translate( 0.1674782, 0.3049486, -0.5101261 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.66698);
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
