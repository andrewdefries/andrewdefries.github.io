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
-3.318782, 0.8400991, -1.822342, 1, 0, 0, 1,
-3.27223, 0.6562551, 0.6558169, 1, 0.007843138, 0, 1,
-2.904048, 0.6448651, -2.754883, 1, 0.01176471, 0, 1,
-2.842397, 1.289553, -0.4753793, 1, 0.01960784, 0, 1,
-2.683167, 0.3689755, -1.682804, 1, 0.02352941, 0, 1,
-2.673423, -1.995583, -2.474644, 1, 0.03137255, 0, 1,
-2.502364, -0.3829737, -1.621803, 1, 0.03529412, 0, 1,
-2.473238, 0.0715912, -1.361572, 1, 0.04313726, 0, 1,
-2.441507, -0.354062, -4.126794, 1, 0.04705882, 0, 1,
-2.44146, 0.6576441, -0.1648004, 1, 0.05490196, 0, 1,
-2.33592, 0.4143275, -1.891479, 1, 0.05882353, 0, 1,
-2.296184, -0.9443008, -0.896596, 1, 0.06666667, 0, 1,
-2.285847, -0.4762691, -2.528272, 1, 0.07058824, 0, 1,
-2.27496, -1.774075, -1.799211, 1, 0.07843138, 0, 1,
-2.112755, -0.275702, 0.1525992, 1, 0.08235294, 0, 1,
-2.099871, 0.3379154, -1.932315, 1, 0.09019608, 0, 1,
-2.097596, -1.799101, -3.556681, 1, 0.09411765, 0, 1,
-2.085641, -0.235697, -1.812339, 1, 0.1019608, 0, 1,
-2.050236, -0.9099181, -0.9781526, 1, 0.1098039, 0, 1,
-2.031465, -1.324712, -1.659203, 1, 0.1137255, 0, 1,
-2.026361, 0.008013352, -4.515009, 1, 0.1215686, 0, 1,
-2.011304, -1.226229, -2.982578, 1, 0.1254902, 0, 1,
-2.009832, 0.7229553, -0.5361578, 1, 0.1333333, 0, 1,
-1.973805, -0.0348781, -1.620209, 1, 0.1372549, 0, 1,
-1.933675, 1.871039, -0.4240704, 1, 0.145098, 0, 1,
-1.911278, -0.242682, -1.111737, 1, 0.1490196, 0, 1,
-1.901092, 1.18911, -1.393268, 1, 0.1568628, 0, 1,
-1.887386, -1.22714, -1.90785, 1, 0.1607843, 0, 1,
-1.883166, 1.049903, -1.219378, 1, 0.1686275, 0, 1,
-1.81733, 0.611653, 1.584337, 1, 0.172549, 0, 1,
-1.798982, 0.5579918, -1.230955, 1, 0.1803922, 0, 1,
-1.794072, 1.279169, 0.0727278, 1, 0.1843137, 0, 1,
-1.793635, 1.460322, -0.7951285, 1, 0.1921569, 0, 1,
-1.776039, -0.5541082, -2.177873, 1, 0.1960784, 0, 1,
-1.765207, 0.4184133, -2.138574, 1, 0.2039216, 0, 1,
-1.741716, 1.366544, -0.9885421, 1, 0.2117647, 0, 1,
-1.719218, -0.6880302, -3.647284, 1, 0.2156863, 0, 1,
-1.713234, 0.5869933, -2.023012, 1, 0.2235294, 0, 1,
-1.705815, 0.3278085, -1.444361, 1, 0.227451, 0, 1,
-1.701528, -0.983651, -3.403291, 1, 0.2352941, 0, 1,
-1.700762, 0.49834, -2.096877, 1, 0.2392157, 0, 1,
-1.697094, -1.17003, -2.735853, 1, 0.2470588, 0, 1,
-1.678117, 0.7464551, -2.146873, 1, 0.2509804, 0, 1,
-1.672517, -1.533934, -2.331373, 1, 0.2588235, 0, 1,
-1.660387, -1.442816, -3.209008, 1, 0.2627451, 0, 1,
-1.657916, 1.12809, 0.9232036, 1, 0.2705882, 0, 1,
-1.65232, -0.3869864, -0.4844253, 1, 0.2745098, 0, 1,
-1.649658, -0.9332845, -1.780034, 1, 0.282353, 0, 1,
-1.644216, -0.3569099, 0.5819533, 1, 0.2862745, 0, 1,
-1.631368, -1.46395, -0.6543837, 1, 0.2941177, 0, 1,
-1.630135, 0.9250451, -0.5231752, 1, 0.3019608, 0, 1,
-1.614742, -1.49259, -2.329831, 1, 0.3058824, 0, 1,
-1.609627, 0.3706633, -0.3838856, 1, 0.3137255, 0, 1,
-1.607958, 0.1801644, -2.617364, 1, 0.3176471, 0, 1,
-1.602382, 0.4019365, 0.8774869, 1, 0.3254902, 0, 1,
-1.570678, -0.5012488, -1.211212, 1, 0.3294118, 0, 1,
-1.553031, -0.2136156, -1.505006, 1, 0.3372549, 0, 1,
-1.550282, 0.6163883, -0.2889079, 1, 0.3411765, 0, 1,
-1.544255, -1.089494, -1.267633, 1, 0.3490196, 0, 1,
-1.541616, 0.2355309, -2.459656, 1, 0.3529412, 0, 1,
-1.533834, 0.04412594, -0.1331514, 1, 0.3607843, 0, 1,
-1.531348, -0.547356, -1.786602, 1, 0.3647059, 0, 1,
-1.525809, -0.5193943, -1.304274, 1, 0.372549, 0, 1,
-1.492807, 0.577457, -4.039266, 1, 0.3764706, 0, 1,
-1.488746, 0.9171695, -0.1039058, 1, 0.3843137, 0, 1,
-1.477405, 1.27832, 0.3533942, 1, 0.3882353, 0, 1,
-1.465925, -2.020862, -4.636824, 1, 0.3960784, 0, 1,
-1.454406, 2.123221, -0.5841976, 1, 0.4039216, 0, 1,
-1.445068, 1.180069, -2.098655, 1, 0.4078431, 0, 1,
-1.433921, -1.12886, -3.164662, 1, 0.4156863, 0, 1,
-1.430555, -1.439427, -1.76637, 1, 0.4196078, 0, 1,
-1.426045, -1.561684, -3.657319, 1, 0.427451, 0, 1,
-1.414691, -0.4255128, -3.877673, 1, 0.4313726, 0, 1,
-1.411556, 0.2640005, -0.6685547, 1, 0.4392157, 0, 1,
-1.406425, -0.7548764, -1.529396, 1, 0.4431373, 0, 1,
-1.404924, 0.3312297, -2.601891, 1, 0.4509804, 0, 1,
-1.403653, -0.94766, -3.572016, 1, 0.454902, 0, 1,
-1.401886, -0.3018715, -2.404985, 1, 0.4627451, 0, 1,
-1.396839, -0.7810045, -1.295819, 1, 0.4666667, 0, 1,
-1.396042, -0.06984635, -1.830136, 1, 0.4745098, 0, 1,
-1.395662, 0.5606395, 0.6328297, 1, 0.4784314, 0, 1,
-1.381116, 0.1776538, -3.264463, 1, 0.4862745, 0, 1,
-1.378538, -0.5596411, -1.366771, 1, 0.4901961, 0, 1,
-1.36493, 0.3669897, -0.7483207, 1, 0.4980392, 0, 1,
-1.364911, 0.6955137, 1.315574, 1, 0.5058824, 0, 1,
-1.364642, -0.2619795, -2.113292, 1, 0.509804, 0, 1,
-1.358094, 0.6067047, -1.431008, 1, 0.5176471, 0, 1,
-1.355665, -0.4702669, -3.932516, 1, 0.5215687, 0, 1,
-1.349648, 0.7295958, -1.040954, 1, 0.5294118, 0, 1,
-1.349357, 0.04286169, 1.086628, 1, 0.5333334, 0, 1,
-1.342001, 1.796601, -1.333699, 1, 0.5411765, 0, 1,
-1.334347, -0.3093385, -5.285766, 1, 0.5450981, 0, 1,
-1.332186, 0.1336979, -2.086974, 1, 0.5529412, 0, 1,
-1.33007, -1.187105, -2.778516, 1, 0.5568628, 0, 1,
-1.310272, 0.1673525, -0.5904416, 1, 0.5647059, 0, 1,
-1.30712, -0.04419585, -1.114275, 1, 0.5686275, 0, 1,
-1.306441, -0.4421143, -1.951509, 1, 0.5764706, 0, 1,
-1.301606, 0.923588, 0.6327238, 1, 0.5803922, 0, 1,
-1.287832, 1.733016, 1.350331, 1, 0.5882353, 0, 1,
-1.280441, -1.808922, -2.841123, 1, 0.5921569, 0, 1,
-1.278287, 0.1767612, -3.268326, 1, 0.6, 0, 1,
-1.277164, 0.7660306, -1.834828, 1, 0.6078432, 0, 1,
-1.277081, 0.3965852, -2.503142, 1, 0.6117647, 0, 1,
-1.276035, -1.024315, -1.766135, 1, 0.6196079, 0, 1,
-1.274009, -1.56119, -1.879111, 1, 0.6235294, 0, 1,
-1.267432, 0.1853137, -1.291176, 1, 0.6313726, 0, 1,
-1.266919, 0.3596152, -0.5647053, 1, 0.6352941, 0, 1,
-1.265802, 0.7093579, -0.3981836, 1, 0.6431373, 0, 1,
-1.261974, -1.533873, -2.663569, 1, 0.6470588, 0, 1,
-1.245567, -1.091202, -2.542863, 1, 0.654902, 0, 1,
-1.239866, -0.1017292, -2.283404, 1, 0.6588235, 0, 1,
-1.237849, 1.814585, -0.05445986, 1, 0.6666667, 0, 1,
-1.235737, 1.012035, 0.8684281, 1, 0.6705883, 0, 1,
-1.230956, -0.1538755, -0.1130723, 1, 0.6784314, 0, 1,
-1.225667, 0.1925635, 0.2906645, 1, 0.682353, 0, 1,
-1.210249, 0.04390326, -3.619021, 1, 0.6901961, 0, 1,
-1.207494, 0.2508927, -2.185757, 1, 0.6941177, 0, 1,
-1.206355, -0.02767717, -1.419176, 1, 0.7019608, 0, 1,
-1.196025, 0.2438875, -2.361733, 1, 0.7098039, 0, 1,
-1.188259, 1.297626, -0.7499424, 1, 0.7137255, 0, 1,
-1.183198, 1.593036, -2.946836, 1, 0.7215686, 0, 1,
-1.181059, -0.05570467, -3.104868, 1, 0.7254902, 0, 1,
-1.177528, 0.0005668965, -2.887021, 1, 0.7333333, 0, 1,
-1.159365, 0.242193, -1.141094, 1, 0.7372549, 0, 1,
-1.156009, 1.775153, 0.4139265, 1, 0.7450981, 0, 1,
-1.155183, 0.2433324, -1.223953, 1, 0.7490196, 0, 1,
-1.149091, 0.4612462, -1.739559, 1, 0.7568628, 0, 1,
-1.144809, -0.9633716, -2.818805, 1, 0.7607843, 0, 1,
-1.140434, 0.251372, 0.4889216, 1, 0.7686275, 0, 1,
-1.137924, 1.17462, -1.905292, 1, 0.772549, 0, 1,
-1.135819, -0.02195954, -2.434738, 1, 0.7803922, 0, 1,
-1.134795, -0.04218227, -0.5819085, 1, 0.7843137, 0, 1,
-1.131666, -0.2030327, -0.4715427, 1, 0.7921569, 0, 1,
-1.130475, -0.1072561, 0.4460378, 1, 0.7960784, 0, 1,
-1.124593, 0.4972152, -1.446981, 1, 0.8039216, 0, 1,
-1.122732, 0.07080394, -1.632267, 1, 0.8117647, 0, 1,
-1.115281, 0.8047884, -1.491981, 1, 0.8156863, 0, 1,
-1.112999, -0.9375418, -2.276942, 1, 0.8235294, 0, 1,
-1.105575, -0.004787435, -1.838458, 1, 0.827451, 0, 1,
-1.100293, 0.5642509, -1.959395, 1, 0.8352941, 0, 1,
-1.099209, -1.120786, -1.506232, 1, 0.8392157, 0, 1,
-1.091491, -1.243298, -2.178925, 1, 0.8470588, 0, 1,
-1.089575, 0.3027703, -0.5818796, 1, 0.8509804, 0, 1,
-1.089128, -0.3862742, -2.036135, 1, 0.8588235, 0, 1,
-1.080559, 0.08966728, -0.557705, 1, 0.8627451, 0, 1,
-1.077057, 0.6774657, -1.409124, 1, 0.8705882, 0, 1,
-1.075549, 1.877461, -0.205842, 1, 0.8745098, 0, 1,
-1.07371, -0.1058127, -2.950213, 1, 0.8823529, 0, 1,
-1.06857, -0.5177408, -0.7421889, 1, 0.8862745, 0, 1,
-1.067573, 1.868212, -0.5357404, 1, 0.8941177, 0, 1,
-1.056253, -1.043816, -1.608234, 1, 0.8980392, 0, 1,
-1.041497, 1.109928, -1.318107, 1, 0.9058824, 0, 1,
-1.036278, 0.03792997, -1.793216, 1, 0.9137255, 0, 1,
-1.028868, 2.189809, -0.1098557, 1, 0.9176471, 0, 1,
-1.023065, 0.8612102, -0.5954647, 1, 0.9254902, 0, 1,
-1.022446, 0.117145, -0.9960655, 1, 0.9294118, 0, 1,
-1.021318, 1.460097, -0.1898587, 1, 0.9372549, 0, 1,
-1.015507, -0.3817028, -1.501282, 1, 0.9411765, 0, 1,
-1.011185, 0.4024978, -1.065431, 1, 0.9490196, 0, 1,
-1.00321, -0.8279837, -1.939074, 1, 0.9529412, 0, 1,
-1.002512, -0.6769445, -2.953439, 1, 0.9607843, 0, 1,
-1.001958, -1.460569, -2.248731, 1, 0.9647059, 0, 1,
-0.9982606, 0.2835791, -1.78275, 1, 0.972549, 0, 1,
-0.9962208, 1.444916, -0.6597304, 1, 0.9764706, 0, 1,
-0.9943478, 0.2057029, -1.827033, 1, 0.9843137, 0, 1,
-0.9937071, 0.1807728, -0.8727198, 1, 0.9882353, 0, 1,
-0.9814, -1.94692, -4.206422, 1, 0.9960784, 0, 1,
-0.9654967, 0.02665808, -1.785108, 0.9960784, 1, 0, 1,
-0.9596449, 1.197734, 1.128224, 0.9921569, 1, 0, 1,
-0.956053, 1.760579, 1.147083, 0.9843137, 1, 0, 1,
-0.944492, -1.175206, -0.4699558, 0.9803922, 1, 0, 1,
-0.9434577, 0.03720924, -0.8637533, 0.972549, 1, 0, 1,
-0.9399417, -0.5539017, -2.679984, 0.9686275, 1, 0, 1,
-0.9384626, -2.475236, -1.93014, 0.9607843, 1, 0, 1,
-0.938222, 0.3333206, -1.28498, 0.9568627, 1, 0, 1,
-0.9375984, 0.006018746, -3.200825, 0.9490196, 1, 0, 1,
-0.9370074, 1.79029, -0.4966247, 0.945098, 1, 0, 1,
-0.9332168, 1.109225, -0.7647337, 0.9372549, 1, 0, 1,
-0.9310181, -0.6789378, -0.2949502, 0.9333333, 1, 0, 1,
-0.9254943, 0.4928067, -1.874787, 0.9254902, 1, 0, 1,
-0.9135252, 0.2106956, -3.442092, 0.9215686, 1, 0, 1,
-0.9120179, 0.9672667, -2.466996, 0.9137255, 1, 0, 1,
-0.9101201, 0.424199, -0.450259, 0.9098039, 1, 0, 1,
-0.907796, 0.248203, -0.2447484, 0.9019608, 1, 0, 1,
-0.9023924, -0.1106258, -0.836777, 0.8941177, 1, 0, 1,
-0.8941692, -0.1036104, -0.3621925, 0.8901961, 1, 0, 1,
-0.8919595, -0.7226839, -0.4474587, 0.8823529, 1, 0, 1,
-0.8877176, -2.010483, -1.593266, 0.8784314, 1, 0, 1,
-0.8831347, 0.4983635, -1.961305, 0.8705882, 1, 0, 1,
-0.8795813, 0.7317582, -0.4139022, 0.8666667, 1, 0, 1,
-0.8790038, 0.08150678, -1.800709, 0.8588235, 1, 0, 1,
-0.8554555, -0.09597994, -2.660942, 0.854902, 1, 0, 1,
-0.8528885, 0.6162209, -3.081687, 0.8470588, 1, 0, 1,
-0.8518866, 1.999573, -1.332625, 0.8431373, 1, 0, 1,
-0.8478538, -1.626827, -1.879009, 0.8352941, 1, 0, 1,
-0.841333, 0.5620233, -1.758164, 0.8313726, 1, 0, 1,
-0.8330773, 0.0334925, -0.1852624, 0.8235294, 1, 0, 1,
-0.8282328, 2.158687, 0.2187782, 0.8196079, 1, 0, 1,
-0.8212139, 0.6503693, -1.288474, 0.8117647, 1, 0, 1,
-0.821028, 0.2237187, -2.146985, 0.8078431, 1, 0, 1,
-0.8187119, -0.2253279, 0.528684, 0.8, 1, 0, 1,
-0.8174969, 0.5081415, 0.7538531, 0.7921569, 1, 0, 1,
-0.8140146, -0.7485258, -2.854523, 0.7882353, 1, 0, 1,
-0.8114402, -0.3848621, -3.098626, 0.7803922, 1, 0, 1,
-0.8022416, 0.4448567, -0.6701629, 0.7764706, 1, 0, 1,
-0.8016984, 1.297626, 1.285932, 0.7686275, 1, 0, 1,
-0.798238, 1.366597, -0.9007076, 0.7647059, 1, 0, 1,
-0.7841532, 0.3285378, -0.6597204, 0.7568628, 1, 0, 1,
-0.7794055, 0.9657123, -0.7773505, 0.7529412, 1, 0, 1,
-0.7762507, -0.3971371, -2.437557, 0.7450981, 1, 0, 1,
-0.7733663, -2.757056, -2.542375, 0.7411765, 1, 0, 1,
-0.7715992, -0.5400063, -1.010928, 0.7333333, 1, 0, 1,
-0.7671729, -0.545918, -1.331933, 0.7294118, 1, 0, 1,
-0.7661087, -0.05601528, -1.984179, 0.7215686, 1, 0, 1,
-0.7569237, -0.2943175, -0.7236513, 0.7176471, 1, 0, 1,
-0.7541528, -0.7560105, -1.894258, 0.7098039, 1, 0, 1,
-0.7427917, -2.035135, -2.993407, 0.7058824, 1, 0, 1,
-0.7422585, 0.6215609, -1.351986, 0.6980392, 1, 0, 1,
-0.7400342, -1.111138, -1.083449, 0.6901961, 1, 0, 1,
-0.7372258, 0.4818346, -0.6653174, 0.6862745, 1, 0, 1,
-0.7231624, -1.832579, -1.779265, 0.6784314, 1, 0, 1,
-0.7212361, -0.4720236, -2.968418, 0.6745098, 1, 0, 1,
-0.7115077, -1.063486, -3.97399, 0.6666667, 1, 0, 1,
-0.7110986, 0.4319307, -0.7946297, 0.6627451, 1, 0, 1,
-0.7100673, -0.007193452, -2.619293, 0.654902, 1, 0, 1,
-0.7063268, -0.4967721, -2.716843, 0.6509804, 1, 0, 1,
-0.704405, 1.003726, -0.1257439, 0.6431373, 1, 0, 1,
-0.7026722, 0.4551733, -0.5152224, 0.6392157, 1, 0, 1,
-0.6998503, -1.917465, -2.634602, 0.6313726, 1, 0, 1,
-0.6967544, -0.8778402, -2.145394, 0.627451, 1, 0, 1,
-0.6948504, 1.258952, 0.1017474, 0.6196079, 1, 0, 1,
-0.694759, -1.228721, -2.25859, 0.6156863, 1, 0, 1,
-0.6938797, -0.8327704, -1.056312, 0.6078432, 1, 0, 1,
-0.6931276, 1.119425, -2.492724, 0.6039216, 1, 0, 1,
-0.6915895, -2.015144, -2.091539, 0.5960785, 1, 0, 1,
-0.6890258, -2.532553, -3.431511, 0.5882353, 1, 0, 1,
-0.6827424, -0.4855835, -4.141761, 0.5843138, 1, 0, 1,
-0.6822967, -2.596008, -2.354148, 0.5764706, 1, 0, 1,
-0.6802793, 0.008852173, -1.338229, 0.572549, 1, 0, 1,
-0.6778139, -0.5450554, -0.4307803, 0.5647059, 1, 0, 1,
-0.6765656, -0.6868904, -0.4646388, 0.5607843, 1, 0, 1,
-0.676551, -1.270994, -3.590158, 0.5529412, 1, 0, 1,
-0.675885, -0.141552, -1.916106, 0.5490196, 1, 0, 1,
-0.6675209, 0.4600194, -0.5684533, 0.5411765, 1, 0, 1,
-0.6645878, 0.9778057, -0.2255338, 0.5372549, 1, 0, 1,
-0.6600836, 1.967336, 0.2938936, 0.5294118, 1, 0, 1,
-0.6538587, 0.08664005, 0.4662527, 0.5254902, 1, 0, 1,
-0.6464824, -0.3274739, -2.599934, 0.5176471, 1, 0, 1,
-0.6387075, -1.18882, -0.5798203, 0.5137255, 1, 0, 1,
-0.6377079, 0.6836246, 0.317984, 0.5058824, 1, 0, 1,
-0.6357826, -1.317388, -4.275311, 0.5019608, 1, 0, 1,
-0.6290529, 0.07905951, -0.9397957, 0.4941176, 1, 0, 1,
-0.628011, 0.4798557, -1.336009, 0.4862745, 1, 0, 1,
-0.6174197, 0.4755923, 0.80637, 0.4823529, 1, 0, 1,
-0.6173747, -0.2277299, -0.7747163, 0.4745098, 1, 0, 1,
-0.6155321, -0.526931, -3.727779, 0.4705882, 1, 0, 1,
-0.6117843, -0.5629207, -1.802445, 0.4627451, 1, 0, 1,
-0.6109028, 0.075739, -1.892934, 0.4588235, 1, 0, 1,
-0.6049672, 0.8801105, -1.590438, 0.4509804, 1, 0, 1,
-0.6020344, 0.462234, -0.5017995, 0.4470588, 1, 0, 1,
-0.6019764, 2.512717, 1.007575, 0.4392157, 1, 0, 1,
-0.6017333, -1.046556, -2.578381, 0.4352941, 1, 0, 1,
-0.5971717, -0.1967764, -2.854842, 0.427451, 1, 0, 1,
-0.5937195, 0.5431923, -1.536931, 0.4235294, 1, 0, 1,
-0.5916451, -0.7422357, -3.6206, 0.4156863, 1, 0, 1,
-0.5909798, 0.3352687, 0.2732325, 0.4117647, 1, 0, 1,
-0.5891505, -0.5312626, -2.690128, 0.4039216, 1, 0, 1,
-0.5839875, 1.454034, -0.8908079, 0.3960784, 1, 0, 1,
-0.58283, 0.7644215, 1.150309, 0.3921569, 1, 0, 1,
-0.5803916, 0.3784027, -0.0769062, 0.3843137, 1, 0, 1,
-0.5800781, -0.7378991, -3.621162, 0.3803922, 1, 0, 1,
-0.5774006, 1.068646, -1.727548, 0.372549, 1, 0, 1,
-0.5772118, 0.7179201, -1.169184, 0.3686275, 1, 0, 1,
-0.5744501, -1.616823, -2.467066, 0.3607843, 1, 0, 1,
-0.5730529, 0.479432, -2.114997, 0.3568628, 1, 0, 1,
-0.5719694, 0.9330529, -2.079386, 0.3490196, 1, 0, 1,
-0.5689614, 0.6169159, -1.282985, 0.345098, 1, 0, 1,
-0.5670564, 1.764198, 1.006536, 0.3372549, 1, 0, 1,
-0.565809, 1.611662, -0.7373303, 0.3333333, 1, 0, 1,
-0.563346, 0.7178059, 0.7786983, 0.3254902, 1, 0, 1,
-0.5630685, 2.126133, 0.9593377, 0.3215686, 1, 0, 1,
-0.560913, 0.4606453, -0.3589729, 0.3137255, 1, 0, 1,
-0.5599496, 0.8950788, 1.039868, 0.3098039, 1, 0, 1,
-0.5564086, 1.543383, 0.2916729, 0.3019608, 1, 0, 1,
-0.555004, 0.7293119, 0.1147169, 0.2941177, 1, 0, 1,
-0.5533136, 0.5475566, -1.089069, 0.2901961, 1, 0, 1,
-0.5503083, -0.5781067, -1.268891, 0.282353, 1, 0, 1,
-0.5502307, -0.6548728, -1.092791, 0.2784314, 1, 0, 1,
-0.5467131, 1.817306, 0.2469783, 0.2705882, 1, 0, 1,
-0.5454912, 0.6039703, -1.945036, 0.2666667, 1, 0, 1,
-0.5439288, 0.7946377, -0.8180092, 0.2588235, 1, 0, 1,
-0.5436201, 0.7172066, -0.2854063, 0.254902, 1, 0, 1,
-0.5405555, -0.5701513, -1.71627, 0.2470588, 1, 0, 1,
-0.539511, 0.01933067, -1.673649, 0.2431373, 1, 0, 1,
-0.5391337, -0.4901713, -1.595349, 0.2352941, 1, 0, 1,
-0.5337949, -1.363237, -4.145146, 0.2313726, 1, 0, 1,
-0.5336161, 0.3122363, -1.179994, 0.2235294, 1, 0, 1,
-0.5329645, -0.4011273, -2.711558, 0.2196078, 1, 0, 1,
-0.5306818, 1.277067, 0.4260827, 0.2117647, 1, 0, 1,
-0.5281304, 0.9229179, -1.5109, 0.2078431, 1, 0, 1,
-0.5269726, 1.154617, -0.7434689, 0.2, 1, 0, 1,
-0.5250992, -1.007211, -2.114398, 0.1921569, 1, 0, 1,
-0.5223233, 1.314429, 0.99888, 0.1882353, 1, 0, 1,
-0.5183904, 0.1903652, -0.3806858, 0.1803922, 1, 0, 1,
-0.5179626, 0.2009983, -1.583446, 0.1764706, 1, 0, 1,
-0.5178483, 0.7977366, 0.361753, 0.1686275, 1, 0, 1,
-0.5172492, 1.651923, 0.7565315, 0.1647059, 1, 0, 1,
-0.5154209, 1.610409, -0.2052683, 0.1568628, 1, 0, 1,
-0.5121187, 1.71284, 1.177025, 0.1529412, 1, 0, 1,
-0.5080387, -0.3773661, -3.450311, 0.145098, 1, 0, 1,
-0.5075307, 0.408825, -1.107198, 0.1411765, 1, 0, 1,
-0.5074912, 0.1853064, -1.231854, 0.1333333, 1, 0, 1,
-0.5067675, 2.436965, 0.9836639, 0.1294118, 1, 0, 1,
-0.5054399, -2.011267, -3.333108, 0.1215686, 1, 0, 1,
-0.5052723, -0.05515394, -0.4509409, 0.1176471, 1, 0, 1,
-0.5049835, -0.8668435, -2.416441, 0.1098039, 1, 0, 1,
-0.4934044, -0.6872691, -1.806435, 0.1058824, 1, 0, 1,
-0.4924865, 0.025731, -0.6584162, 0.09803922, 1, 0, 1,
-0.4857669, -1.026786, -1.728381, 0.09019608, 1, 0, 1,
-0.4853025, -0.2118279, -1.646686, 0.08627451, 1, 0, 1,
-0.4736832, 0.0326844, -2.234557, 0.07843138, 1, 0, 1,
-0.4735239, -0.7825439, -2.426915, 0.07450981, 1, 0, 1,
-0.4734656, 0.3143989, -0.9276126, 0.06666667, 1, 0, 1,
-0.4726588, -1.42466, -2.109394, 0.0627451, 1, 0, 1,
-0.4697857, 0.1722445, -1.505751, 0.05490196, 1, 0, 1,
-0.4629955, 1.380501, -1.42262, 0.05098039, 1, 0, 1,
-0.4592335, -0.6165686, -3.264691, 0.04313726, 1, 0, 1,
-0.4585254, -0.9722331, -1.503096, 0.03921569, 1, 0, 1,
-0.4581411, -1.044237, -3.735678, 0.03137255, 1, 0, 1,
-0.4526664, 0.1025617, -2.170523, 0.02745098, 1, 0, 1,
-0.4521306, -2.434335, -4.379377, 0.01960784, 1, 0, 1,
-0.4510172, 1.638256, -0.2107021, 0.01568628, 1, 0, 1,
-0.4375, 0.7870236, -1.438298, 0.007843138, 1, 0, 1,
-0.4331514, -0.7848017, -2.131711, 0.003921569, 1, 0, 1,
-0.4303845, -0.4155126, 0.1020655, 0, 1, 0.003921569, 1,
-0.4257499, -0.7933093, -3.020206, 0, 1, 0.01176471, 1,
-0.425028, -0.9175025, -2.642437, 0, 1, 0.01568628, 1,
-0.4229243, -0.0982053, -2.544954, 0, 1, 0.02352941, 1,
-0.4168014, 0.45152, -0.7698792, 0, 1, 0.02745098, 1,
-0.4159689, 0.8678923, -0.05837438, 0, 1, 0.03529412, 1,
-0.4157346, -0.2854339, -3.352356, 0, 1, 0.03921569, 1,
-0.4140003, -0.9790975, -3.808178, 0, 1, 0.04705882, 1,
-0.4131752, 1.22642, -0.1325923, 0, 1, 0.05098039, 1,
-0.4094257, 0.3864728, 0.6968712, 0, 1, 0.05882353, 1,
-0.4081129, -0.7512123, -4.488691, 0, 1, 0.0627451, 1,
-0.4080919, -0.4082657, -1.955981, 0, 1, 0.07058824, 1,
-0.4012372, 0.2648903, 0.292064, 0, 1, 0.07450981, 1,
-0.398651, 1.276453, 0.1872603, 0, 1, 0.08235294, 1,
-0.3899131, -0.009593833, -0.05845639, 0, 1, 0.08627451, 1,
-0.3881095, -0.03135598, -1.477365, 0, 1, 0.09411765, 1,
-0.384378, -0.02316977, -1.659394, 0, 1, 0.1019608, 1,
-0.3843544, 0.8178936, 1.599204, 0, 1, 0.1058824, 1,
-0.383598, -0.482363, -2.91589, 0, 1, 0.1137255, 1,
-0.378537, -0.7180442, -2.990186, 0, 1, 0.1176471, 1,
-0.3766317, -1.061501, -1.782046, 0, 1, 0.1254902, 1,
-0.3762684, -0.3153568, -1.191281, 0, 1, 0.1294118, 1,
-0.3752127, 0.9521756, 0.04858843, 0, 1, 0.1372549, 1,
-0.3747049, 0.8814462, 0.7421026, 0, 1, 0.1411765, 1,
-0.3714847, -1.110488, -2.991222, 0, 1, 0.1490196, 1,
-0.3713119, 1.456088, -0.5870101, 0, 1, 0.1529412, 1,
-0.3711114, 0.0242536, -1.014517, 0, 1, 0.1607843, 1,
-0.3701819, 1.509885, -0.2334968, 0, 1, 0.1647059, 1,
-0.3680186, 0.03431294, -1.043055, 0, 1, 0.172549, 1,
-0.3606472, -0.5666476, -4.202146, 0, 1, 0.1764706, 1,
-0.3508434, 0.1364188, -2.110794, 0, 1, 0.1843137, 1,
-0.350803, -1.396727, -3.432817, 0, 1, 0.1882353, 1,
-0.3503288, 0.3510115, -0.3763514, 0, 1, 0.1960784, 1,
-0.3501617, 1.439386, 0.9819414, 0, 1, 0.2039216, 1,
-0.3480341, 0.04647072, -0.6291246, 0, 1, 0.2078431, 1,
-0.3440974, -0.7466785, -4.247992, 0, 1, 0.2156863, 1,
-0.3439689, 0.2435109, -0.962662, 0, 1, 0.2196078, 1,
-0.3433052, 1.170986, -0.1356652, 0, 1, 0.227451, 1,
-0.3390879, 0.5997737, -0.5642967, 0, 1, 0.2313726, 1,
-0.3376477, 1.530229, -0.1180451, 0, 1, 0.2392157, 1,
-0.3366446, 1.965571, -1.305977, 0, 1, 0.2431373, 1,
-0.3336652, 0.2909886, -1.019153, 0, 1, 0.2509804, 1,
-0.3309888, 1.035326, -0.5316747, 0, 1, 0.254902, 1,
-0.3293695, 0.7112272, 0.02996796, 0, 1, 0.2627451, 1,
-0.3288709, 0.007486853, -3.293888, 0, 1, 0.2666667, 1,
-0.3239136, -0.7230399, -2.672811, 0, 1, 0.2745098, 1,
-0.3080772, -0.01984055, -1.356083, 0, 1, 0.2784314, 1,
-0.3073688, -1.126427, -3.445383, 0, 1, 0.2862745, 1,
-0.3073145, 0.1958017, -0.7600067, 0, 1, 0.2901961, 1,
-0.3029225, 0.102461, -1.510829, 0, 1, 0.2980392, 1,
-0.3023153, 0.5804899, -0.07061455, 0, 1, 0.3058824, 1,
-0.2975404, -0.1516995, -2.051561, 0, 1, 0.3098039, 1,
-0.2877441, 0.1338368, 0.08183459, 0, 1, 0.3176471, 1,
-0.2857662, 0.3942009, -2.090993, 0, 1, 0.3215686, 1,
-0.2845908, 0.3401718, -0.2805927, 0, 1, 0.3294118, 1,
-0.2840543, -0.6080853, -2.556735, 0, 1, 0.3333333, 1,
-0.2818634, 0.7369386, -1.109936, 0, 1, 0.3411765, 1,
-0.27807, 2.11729, -1.056151, 0, 1, 0.345098, 1,
-0.2773343, -1.151134, -2.801697, 0, 1, 0.3529412, 1,
-0.2705642, 1.827627, 0.7280273, 0, 1, 0.3568628, 1,
-0.2640303, -0.5838035, -0.9441749, 0, 1, 0.3647059, 1,
-0.2620092, 0.5811108, -2.062163, 0, 1, 0.3686275, 1,
-0.2601256, -0.4083584, -2.02644, 0, 1, 0.3764706, 1,
-0.2566147, 0.6283675, -1.752123, 0, 1, 0.3803922, 1,
-0.2543761, -0.8448319, -3.150435, 0, 1, 0.3882353, 1,
-0.2524359, -0.7067766, -1.667813, 0, 1, 0.3921569, 1,
-0.2482138, -1.012066, -3.353344, 0, 1, 0.4, 1,
-0.2476434, -1.716342, -2.477197, 0, 1, 0.4078431, 1,
-0.2468832, -0.04471151, -2.112501, 0, 1, 0.4117647, 1,
-0.2411247, 0.9312137, -0.2941772, 0, 1, 0.4196078, 1,
-0.2403141, 1.268425, -1.41934, 0, 1, 0.4235294, 1,
-0.2331706, -0.001777, -1.121738, 0, 1, 0.4313726, 1,
-0.2289834, -0.6940091, -2.514558, 0, 1, 0.4352941, 1,
-0.2202369, -0.2528765, -3.035695, 0, 1, 0.4431373, 1,
-0.2198433, -0.3991971, -3.625081, 0, 1, 0.4470588, 1,
-0.2173599, -1.832097, -1.772908, 0, 1, 0.454902, 1,
-0.2167437, -1.150509, -2.331211, 0, 1, 0.4588235, 1,
-0.2155915, -0.1537964, -0.2924283, 0, 1, 0.4666667, 1,
-0.2155668, -1.098172, -4.479939, 0, 1, 0.4705882, 1,
-0.2096843, 0.4136544, -0.4128531, 0, 1, 0.4784314, 1,
-0.2057095, -0.2708378, -3.117151, 0, 1, 0.4823529, 1,
-0.2028796, -1.26572, -2.91942, 0, 1, 0.4901961, 1,
-0.1933902, 0.609699, -0.6198363, 0, 1, 0.4941176, 1,
-0.1918082, 0.1472217, -0.002129612, 0, 1, 0.5019608, 1,
-0.1901331, -1.347425, -3.124918, 0, 1, 0.509804, 1,
-0.1884872, 0.01639368, -0.9798099, 0, 1, 0.5137255, 1,
-0.1864281, -2.723169, -3.917811, 0, 1, 0.5215687, 1,
-0.1822766, -0.4432397, -2.520082, 0, 1, 0.5254902, 1,
-0.1802025, -0.1062431, -4.745571, 0, 1, 0.5333334, 1,
-0.1754437, 1.377288, -1.322984, 0, 1, 0.5372549, 1,
-0.1747254, 2.490933, -0.1830363, 0, 1, 0.5450981, 1,
-0.1719293, 0.4954979, 2.004204, 0, 1, 0.5490196, 1,
-0.1702283, 2.181605, -0.786833, 0, 1, 0.5568628, 1,
-0.1674758, 1.32526, -0.8184512, 0, 1, 0.5607843, 1,
-0.1634828, 0.1839243, -0.01224162, 0, 1, 0.5686275, 1,
-0.160152, -0.06406179, -1.9516, 0, 1, 0.572549, 1,
-0.1586947, 1.119162, -0.03089459, 0, 1, 0.5803922, 1,
-0.1561386, -1.224956, -3.662081, 0, 1, 0.5843138, 1,
-0.148129, 0.628538, 0.5821663, 0, 1, 0.5921569, 1,
-0.1472421, 1.074665, -0.406734, 0, 1, 0.5960785, 1,
-0.1434752, 0.213859, 1.359815, 0, 1, 0.6039216, 1,
-0.1433252, -0.7434171, -2.476973, 0, 1, 0.6117647, 1,
-0.1413853, 0.4638889, -0.2841785, 0, 1, 0.6156863, 1,
-0.1407855, -0.1311105, -2.655012, 0, 1, 0.6235294, 1,
-0.1404114, -0.6814553, -4.091858, 0, 1, 0.627451, 1,
-0.1335432, -0.01355265, -2.486713, 0, 1, 0.6352941, 1,
-0.1331217, -1.0003, -4.984304, 0, 1, 0.6392157, 1,
-0.1327939, -0.5113207, -3.070499, 0, 1, 0.6470588, 1,
-0.1327031, -0.08606755, -1.886228, 0, 1, 0.6509804, 1,
-0.1320309, -0.06559488, -1.082958, 0, 1, 0.6588235, 1,
-0.1299889, -0.2495215, -2.88227, 0, 1, 0.6627451, 1,
-0.1298272, 0.1024522, -1.557636, 0, 1, 0.6705883, 1,
-0.1291732, -1.151734, -4.466881, 0, 1, 0.6745098, 1,
-0.1279956, 0.1371549, -1.110371, 0, 1, 0.682353, 1,
-0.1256841, 0.1249432, -1.601719, 0, 1, 0.6862745, 1,
-0.1232679, -1.619415, -2.491001, 0, 1, 0.6941177, 1,
-0.1229055, 0.2241863, 1.414785, 0, 1, 0.7019608, 1,
-0.1224134, -0.3081509, -0.7187169, 0, 1, 0.7058824, 1,
-0.1202317, 0.1276907, 0.1928086, 0, 1, 0.7137255, 1,
-0.1159494, -0.5797908, -2.263281, 0, 1, 0.7176471, 1,
-0.1148197, 0.8456633, 2.008368, 0, 1, 0.7254902, 1,
-0.112413, 0.8445027, 1.057931, 0, 1, 0.7294118, 1,
-0.112284, -1.697803, -3.833118, 0, 1, 0.7372549, 1,
-0.1089138, -1.246243, -2.237953, 0, 1, 0.7411765, 1,
-0.1065939, 1.985446, 0.7410355, 0, 1, 0.7490196, 1,
-0.1053342, -0.6797885, -3.131519, 0, 1, 0.7529412, 1,
-0.1029117, 1.134624, 0.8235731, 0, 1, 0.7607843, 1,
-0.1014965, -0.8875334, -2.103703, 0, 1, 0.7647059, 1,
-0.09716977, -0.4499814, -3.91958, 0, 1, 0.772549, 1,
-0.09622402, 0.1128953, 0.8269836, 0, 1, 0.7764706, 1,
-0.08884166, -0.7420928, -2.45778, 0, 1, 0.7843137, 1,
-0.08837084, -0.8779548, -2.65483, 0, 1, 0.7882353, 1,
-0.08696416, -2.20869, -2.344102, 0, 1, 0.7960784, 1,
-0.08579478, 0.3359163, 0.0686838, 0, 1, 0.8039216, 1,
-0.08296843, 0.3495136, -0.1982288, 0, 1, 0.8078431, 1,
-0.0793546, 0.2349504, -1.566584, 0, 1, 0.8156863, 1,
-0.0777391, 0.9128216, -1.243079, 0, 1, 0.8196079, 1,
-0.07436933, 0.8905497, -0.02673357, 0, 1, 0.827451, 1,
-0.0739159, 0.2075656, 1.311103, 0, 1, 0.8313726, 1,
-0.07253153, -0.5337465, -2.730897, 0, 1, 0.8392157, 1,
-0.06911244, -0.8458278, -4.660918, 0, 1, 0.8431373, 1,
-0.06169683, -0.1107116, -1.680137, 0, 1, 0.8509804, 1,
-0.05811981, -2.096559, -2.516923, 0, 1, 0.854902, 1,
-0.05550499, -0.5815546, -2.71637, 0, 1, 0.8627451, 1,
-0.05277706, -1.448865, -4.896598, 0, 1, 0.8666667, 1,
-0.04945955, 0.1318627, 0.1518357, 0, 1, 0.8745098, 1,
-0.04610591, -0.7064633, -3.506826, 0, 1, 0.8784314, 1,
-0.04568802, 0.4003673, -0.1378243, 0, 1, 0.8862745, 1,
-0.04420564, -0.3776673, -2.927757, 0, 1, 0.8901961, 1,
-0.04212166, -0.435993, -3.137271, 0, 1, 0.8980392, 1,
-0.04003702, -0.6577397, -2.698847, 0, 1, 0.9058824, 1,
-0.03950495, -0.8422812, -4.830872, 0, 1, 0.9098039, 1,
-0.03748216, -0.6796719, -2.563848, 0, 1, 0.9176471, 1,
-0.03079873, 0.01843554, -3.257058, 0, 1, 0.9215686, 1,
-0.02981295, -0.8181092, -4.025869, 0, 1, 0.9294118, 1,
-0.02729203, -0.3673499, -3.290595, 0, 1, 0.9333333, 1,
-0.02608669, -0.7738017, -3.523048, 0, 1, 0.9411765, 1,
-0.02581098, -0.02558304, -4.770828, 0, 1, 0.945098, 1,
-0.02368548, 0.7067665, 0.3808569, 0, 1, 0.9529412, 1,
-0.02189054, -1.510792, -3.890398, 0, 1, 0.9568627, 1,
-0.02074336, -0.1012028, -3.008468, 0, 1, 0.9647059, 1,
-0.01979221, 1.100685, -1.582428, 0, 1, 0.9686275, 1,
-0.0197768, 2.694564, -1.455903, 0, 1, 0.9764706, 1,
-0.01927155, -1.770402, -3.01208, 0, 1, 0.9803922, 1,
-0.01435888, 1.124166, -0.3575156, 0, 1, 0.9882353, 1,
-0.01358686, 1.835996, 0.6642091, 0, 1, 0.9921569, 1,
-0.01106184, -0.1812836, -3.484007, 0, 1, 1, 1,
-0.01046302, 0.135893, 0.6487072, 0, 0.9921569, 1, 1,
-0.009116305, 1.617484, 1.563539, 0, 0.9882353, 1, 1,
-0.00878178, -0.2889073, -3.557204, 0, 0.9803922, 1, 1,
-0.008751531, 1.191713, 1.538285, 0, 0.9764706, 1, 1,
-0.008089624, -0.01467481, -1.892659, 0, 0.9686275, 1, 1,
-0.004061659, 1.284623, -1.484656, 0, 0.9647059, 1, 1,
-0.002971842, 0.7555673, 0.09271671, 0, 0.9568627, 1, 1,
-0.001823424, -0.6984109, -3.960242, 0, 0.9529412, 1, 1,
-0.001363361, 0.8027651, -1.906078, 0, 0.945098, 1, 1,
0.0008967777, -0.4026325, 4.399041, 0, 0.9411765, 1, 1,
0.003141799, -0.4368835, 3.478021, 0, 0.9333333, 1, 1,
0.007388392, 1.591967, 1.362116, 0, 0.9294118, 1, 1,
0.01054993, 0.4906126, 0.9945323, 0, 0.9215686, 1, 1,
0.01277632, -1.11399, 4.672361, 0, 0.9176471, 1, 1,
0.01801451, -0.0159222, 2.818808, 0, 0.9098039, 1, 1,
0.02129667, 1.095627, -1.186716, 0, 0.9058824, 1, 1,
0.02408341, -0.06386366, 3.872665, 0, 0.8980392, 1, 1,
0.02643362, -0.146966, 3.694969, 0, 0.8901961, 1, 1,
0.0276821, 0.1241929, 0.7205287, 0, 0.8862745, 1, 1,
0.03202568, -0.3017899, 2.87903, 0, 0.8784314, 1, 1,
0.03297345, -0.5526024, 3.710923, 0, 0.8745098, 1, 1,
0.03509999, -1.86398, 5.089562, 0, 0.8666667, 1, 1,
0.03791703, -0.7772866, 2.666285, 0, 0.8627451, 1, 1,
0.03955488, -0.7760848, 4.706946, 0, 0.854902, 1, 1,
0.04253288, 0.9830945, 2.054346, 0, 0.8509804, 1, 1,
0.04498181, 0.787555, 1.275044, 0, 0.8431373, 1, 1,
0.04702707, -0.4596727, 2.979118, 0, 0.8392157, 1, 1,
0.05211177, 0.865486, -0.7292117, 0, 0.8313726, 1, 1,
0.05523561, 0.8534763, -0.3093129, 0, 0.827451, 1, 1,
0.05533204, 0.6279547, -0.7148561, 0, 0.8196079, 1, 1,
0.05588154, 0.1524487, 0.6367516, 0, 0.8156863, 1, 1,
0.06124122, 0.8662409, -0.5680412, 0, 0.8078431, 1, 1,
0.07272936, 1.634846, 0.9350488, 0, 0.8039216, 1, 1,
0.07340831, -0.6529642, 5.124635, 0, 0.7960784, 1, 1,
0.07841656, 1.031044, -0.4385222, 0, 0.7882353, 1, 1,
0.08049214, -0.6853946, 2.768787, 0, 0.7843137, 1, 1,
0.08067828, -1.24089, 3.815906, 0, 0.7764706, 1, 1,
0.08159027, -0.2998298, 0.831385, 0, 0.772549, 1, 1,
0.08217981, -0.764352, 3.119352, 0, 0.7647059, 1, 1,
0.08316473, -1.405092, 3.541369, 0, 0.7607843, 1, 1,
0.08976892, 0.5833706, -0.6353414, 0, 0.7529412, 1, 1,
0.09282984, 0.8781158, 0.5638099, 0, 0.7490196, 1, 1,
0.09524355, 0.01022582, 1.749647, 0, 0.7411765, 1, 1,
0.09921888, -0.7948448, 2.309086, 0, 0.7372549, 1, 1,
0.1003351, -1.27203, 3.360614, 0, 0.7294118, 1, 1,
0.1042135, -0.4934889, 1.887656, 0, 0.7254902, 1, 1,
0.1045976, -0.6987427, 2.728719, 0, 0.7176471, 1, 1,
0.1065773, 0.3837942, 0.4082975, 0, 0.7137255, 1, 1,
0.1069166, -1.19417, 3.154957, 0, 0.7058824, 1, 1,
0.109896, -0.7959527, 3.310008, 0, 0.6980392, 1, 1,
0.1117438, 1.236639, -1.072556, 0, 0.6941177, 1, 1,
0.1128171, 0.646468, 2.076451, 0, 0.6862745, 1, 1,
0.1137649, 0.9058469, -0.003209972, 0, 0.682353, 1, 1,
0.1147784, 1.253947, -0.2954663, 0, 0.6745098, 1, 1,
0.1149286, -0.9897604, 4.785756, 0, 0.6705883, 1, 1,
0.1159903, -2.38616, 2.367141, 0, 0.6627451, 1, 1,
0.1168112, 0.2778694, -1.0086, 0, 0.6588235, 1, 1,
0.1168863, 0.09064105, 0.2385091, 0, 0.6509804, 1, 1,
0.1195652, 0.1927429, 0.588013, 0, 0.6470588, 1, 1,
0.1212576, -0.02861343, 2.422221, 0, 0.6392157, 1, 1,
0.1214279, -0.6586797, 2.331395, 0, 0.6352941, 1, 1,
0.1234351, -1.187907, 2.743748, 0, 0.627451, 1, 1,
0.123675, 0.467183, 0.689813, 0, 0.6235294, 1, 1,
0.1268208, 0.6729872, 0.1491832, 0, 0.6156863, 1, 1,
0.1272641, -0.4038461, 2.931965, 0, 0.6117647, 1, 1,
0.1282542, 0.3899313, 0.874065, 0, 0.6039216, 1, 1,
0.1338033, 0.5084367, 2.095662, 0, 0.5960785, 1, 1,
0.1426225, -1.472782, 3.255629, 0, 0.5921569, 1, 1,
0.1443855, -0.0237169, 1.574446, 0, 0.5843138, 1, 1,
0.1469595, -0.4399074, 2.848099, 0, 0.5803922, 1, 1,
0.1500215, 0.6605802, 0.04820232, 0, 0.572549, 1, 1,
0.1507708, -1.162219, 2.870056, 0, 0.5686275, 1, 1,
0.1508768, 0.2107692, 0.6076329, 0, 0.5607843, 1, 1,
0.1527078, 1.070514, -0.7582514, 0, 0.5568628, 1, 1,
0.1538366, -1.001773, 3.566413, 0, 0.5490196, 1, 1,
0.1567533, -0.8526105, 1.353236, 0, 0.5450981, 1, 1,
0.1581148, 0.2938778, 0.1957686, 0, 0.5372549, 1, 1,
0.1593438, 0.389624, 0.358817, 0, 0.5333334, 1, 1,
0.1684716, -1.253536, 4.070328, 0, 0.5254902, 1, 1,
0.1691534, -1.373453, 2.863673, 0, 0.5215687, 1, 1,
0.174487, -1.31535, 2.577625, 0, 0.5137255, 1, 1,
0.1766896, -0.7816556, 3.535194, 0, 0.509804, 1, 1,
0.1799734, -1.48969, 3.303523, 0, 0.5019608, 1, 1,
0.1913812, -0.01997843, 0.7307864, 0, 0.4941176, 1, 1,
0.1948189, 0.463866, -0.06417251, 0, 0.4901961, 1, 1,
0.1991046, -0.7525361, 3.350492, 0, 0.4823529, 1, 1,
0.2018717, 1.81145, -0.5026626, 0, 0.4784314, 1, 1,
0.2074381, 0.3469711, 0.5515319, 0, 0.4705882, 1, 1,
0.2096151, 1.115722, 0.4317635, 0, 0.4666667, 1, 1,
0.2125863, 0.6747099, -1.036406, 0, 0.4588235, 1, 1,
0.2144823, 1.584149, 0.3830969, 0, 0.454902, 1, 1,
0.2149039, -0.4266553, 3.813144, 0, 0.4470588, 1, 1,
0.2181203, -2.091389, 3.325579, 0, 0.4431373, 1, 1,
0.2201545, 0.412393, 0.7318435, 0, 0.4352941, 1, 1,
0.2276499, 2.01528, 3.287652, 0, 0.4313726, 1, 1,
0.2329122, -1.482242, 3.593457, 0, 0.4235294, 1, 1,
0.2387865, -0.9947273, 3.577163, 0, 0.4196078, 1, 1,
0.2390584, 0.8950213, 1.535139, 0, 0.4117647, 1, 1,
0.2437503, -0.4150757, 3.861444, 0, 0.4078431, 1, 1,
0.2439492, -2.58969, 1.311339, 0, 0.4, 1, 1,
0.2457357, -1.253397, 3.420175, 0, 0.3921569, 1, 1,
0.2549431, 0.08512551, 1.576214, 0, 0.3882353, 1, 1,
0.2569661, 0.4219504, 1.143194, 0, 0.3803922, 1, 1,
0.2570548, 0.2014428, 0.9324298, 0, 0.3764706, 1, 1,
0.2620804, -0.7937933, 0.8534963, 0, 0.3686275, 1, 1,
0.2624581, 0.4457764, -1.224075, 0, 0.3647059, 1, 1,
0.2626929, -0.3139041, 2.765631, 0, 0.3568628, 1, 1,
0.2645039, 0.4523224, -1.18823, 0, 0.3529412, 1, 1,
0.2702801, -0.8270987, 3.771694, 0, 0.345098, 1, 1,
0.2722519, -0.557021, 1.75303, 0, 0.3411765, 1, 1,
0.2726272, 0.7581784, -0.547721, 0, 0.3333333, 1, 1,
0.272658, -1.107938, 1.831822, 0, 0.3294118, 1, 1,
0.2735126, -0.5591744, 0.7537761, 0, 0.3215686, 1, 1,
0.2759862, -0.216599, 1.837671, 0, 0.3176471, 1, 1,
0.2770448, 1.163453, 0.2655285, 0, 0.3098039, 1, 1,
0.2779396, 0.246551, 0.9632629, 0, 0.3058824, 1, 1,
0.2781275, 0.3391237, 2.341464, 0, 0.2980392, 1, 1,
0.2804602, -0.9036325, 3.821712, 0, 0.2901961, 1, 1,
0.2813487, 2.356607, 0.4367436, 0, 0.2862745, 1, 1,
0.2814949, -0.5815006, 2.908284, 0, 0.2784314, 1, 1,
0.2832915, 0.1184557, 0.02670419, 0, 0.2745098, 1, 1,
0.2839111, 0.202191, 0.3724161, 0, 0.2666667, 1, 1,
0.2841202, 0.0101604, 0.6497406, 0, 0.2627451, 1, 1,
0.2852965, 0.3518919, 1.878706, 0, 0.254902, 1, 1,
0.2871522, 0.5462242, 2.278331, 0, 0.2509804, 1, 1,
0.2914891, -0.01225703, 1.130625, 0, 0.2431373, 1, 1,
0.2921223, -2.002489, 3.04498, 0, 0.2392157, 1, 1,
0.3009575, -1.163692, 3.408942, 0, 0.2313726, 1, 1,
0.3028755, 1.328033, 1.326609, 0, 0.227451, 1, 1,
0.3061685, -0.8201938, 4.05471, 0, 0.2196078, 1, 1,
0.309888, 0.7879704, 0.9908361, 0, 0.2156863, 1, 1,
0.3103213, 0.5484257, -0.5357739, 0, 0.2078431, 1, 1,
0.3103428, -0.4990795, 2.045999, 0, 0.2039216, 1, 1,
0.3105111, -0.6510792, 3.724401, 0, 0.1960784, 1, 1,
0.3139946, -1.291149, 2.451347, 0, 0.1882353, 1, 1,
0.3183499, 0.5086715, -0.9551487, 0, 0.1843137, 1, 1,
0.3196047, -1.237099, 3.924434, 0, 0.1764706, 1, 1,
0.3217298, -0.6332743, 1.296916, 0, 0.172549, 1, 1,
0.3218562, -0.8605629, 5.128802, 0, 0.1647059, 1, 1,
0.3261677, 1.450178, 0.6825799, 0, 0.1607843, 1, 1,
0.3344259, 1.863589, 0.7776161, 0, 0.1529412, 1, 1,
0.3360428, -0.3396287, 1.769931, 0, 0.1490196, 1, 1,
0.3400885, 1.355737, -0.6023729, 0, 0.1411765, 1, 1,
0.3438759, 2.962898, 0.2499816, 0, 0.1372549, 1, 1,
0.3440655, 0.8488806, -1.401749, 0, 0.1294118, 1, 1,
0.3449671, -0.1729116, 2.253626, 0, 0.1254902, 1, 1,
0.3538159, 0.5040122, 0.3037516, 0, 0.1176471, 1, 1,
0.3558159, -0.002338529, 3.236605, 0, 0.1137255, 1, 1,
0.3594979, 0.1403076, 1.878491, 0, 0.1058824, 1, 1,
0.3597308, 0.150995, 1.116264, 0, 0.09803922, 1, 1,
0.3645339, -0.4472071, 2.975855, 0, 0.09411765, 1, 1,
0.3652926, 0.1026269, 1.179648, 0, 0.08627451, 1, 1,
0.3708197, 0.190221, 0.5506184, 0, 0.08235294, 1, 1,
0.3795052, -1.259867, 2.862067, 0, 0.07450981, 1, 1,
0.3809171, -0.2295085, 1.517927, 0, 0.07058824, 1, 1,
0.3814237, 0.117272, 0.5422575, 0, 0.0627451, 1, 1,
0.381618, 0.63666, 0.1040579, 0, 0.05882353, 1, 1,
0.3859724, 0.6115993, 0.7968081, 0, 0.05098039, 1, 1,
0.3954933, -0.626294, 2.629577, 0, 0.04705882, 1, 1,
0.3968312, -0.560111, 3.379849, 0, 0.03921569, 1, 1,
0.4006599, -0.2415764, 1.677172, 0, 0.03529412, 1, 1,
0.4008095, -2.152053, 2.974044, 0, 0.02745098, 1, 1,
0.4059938, 2.235529, 0.6794949, 0, 0.02352941, 1, 1,
0.4075434, 1.823507, -2.238696, 0, 0.01568628, 1, 1,
0.4082432, 1.109054, 0.912884, 0, 0.01176471, 1, 1,
0.409415, 0.1799762, 0.5536281, 0, 0.003921569, 1, 1,
0.4112847, 0.809362, -0.9552711, 0.003921569, 0, 1, 1,
0.4133285, 0.2455505, 0.172899, 0.007843138, 0, 1, 1,
0.4157051, -0.8922585, 2.795712, 0.01568628, 0, 1, 1,
0.4176814, -0.676171, 2.803332, 0.01960784, 0, 1, 1,
0.4182836, -1.108257, 2.136586, 0.02745098, 0, 1, 1,
0.4212959, 0.6395242, -0.1829219, 0.03137255, 0, 1, 1,
0.424331, -0.2473005, 2.16282, 0.03921569, 0, 1, 1,
0.425458, 0.2314247, -0.3615911, 0.04313726, 0, 1, 1,
0.4262412, 1.989384, 0.05008541, 0.05098039, 0, 1, 1,
0.4270431, -0.4803311, 2.018162, 0.05490196, 0, 1, 1,
0.4274328, 2.372105, -0.1418426, 0.0627451, 0, 1, 1,
0.4283353, 0.09268486, 1.858029, 0.06666667, 0, 1, 1,
0.4317721, 1.218002, -0.3506183, 0.07450981, 0, 1, 1,
0.4338517, -0.6791136, 1.693999, 0.07843138, 0, 1, 1,
0.4342292, -0.2818257, 3.060466, 0.08627451, 0, 1, 1,
0.441794, 2.625815, 0.2492188, 0.09019608, 0, 1, 1,
0.4430174, 2.57189, -0.5497436, 0.09803922, 0, 1, 1,
0.4477482, 0.1914037, 0.7006279, 0.1058824, 0, 1, 1,
0.4491405, -2.437084, 3.323374, 0.1098039, 0, 1, 1,
0.4497123, -1.07796, 2.263154, 0.1176471, 0, 1, 1,
0.4517917, -1.777572, 1.666047, 0.1215686, 0, 1, 1,
0.4520419, -1.689829, 1.791804, 0.1294118, 0, 1, 1,
0.458418, -0.2164483, 2.24323, 0.1333333, 0, 1, 1,
0.4597659, -1.074872, 4.657748, 0.1411765, 0, 1, 1,
0.4609581, -0.3817627, 2.646052, 0.145098, 0, 1, 1,
0.4653597, 0.5414662, -0.09665531, 0.1529412, 0, 1, 1,
0.4665442, 1.253338, -0.1320687, 0.1568628, 0, 1, 1,
0.4735857, -2.369812, 3.005979, 0.1647059, 0, 1, 1,
0.4778924, -0.1907029, 3.30316, 0.1686275, 0, 1, 1,
0.4798177, 2.080415, 1.28892, 0.1764706, 0, 1, 1,
0.4805726, 0.2009387, 0.6471737, 0.1803922, 0, 1, 1,
0.4811987, 0.1522775, 0.08699781, 0.1882353, 0, 1, 1,
0.4823277, -0.01911075, 1.676856, 0.1921569, 0, 1, 1,
0.4887114, -0.616443, 2.323472, 0.2, 0, 1, 1,
0.4917505, 0.4451252, 0.8445223, 0.2078431, 0, 1, 1,
0.5011939, -0.2148427, 2.577234, 0.2117647, 0, 1, 1,
0.5028576, 0.2391595, -0.2671992, 0.2196078, 0, 1, 1,
0.5088806, 2.219114, 1.236181, 0.2235294, 0, 1, 1,
0.5147092, -0.7195383, 3.84505, 0.2313726, 0, 1, 1,
0.5162663, 0.3628236, -0.5518118, 0.2352941, 0, 1, 1,
0.5162905, 0.812254, -1.946673, 0.2431373, 0, 1, 1,
0.517466, 0.202575, 1.053565, 0.2470588, 0, 1, 1,
0.5182568, 1.161157, -0.3864734, 0.254902, 0, 1, 1,
0.5191187, 0.7195817, -0.1247398, 0.2588235, 0, 1, 1,
0.5202568, 0.2204858, 0.7215421, 0.2666667, 0, 1, 1,
0.5215629, 0.514105, 1.255911, 0.2705882, 0, 1, 1,
0.5222201, -0.01782478, 0.8996884, 0.2784314, 0, 1, 1,
0.5340943, 0.4241615, 1.998099, 0.282353, 0, 1, 1,
0.5385381, 0.1908884, -0.1941031, 0.2901961, 0, 1, 1,
0.5390486, -0.1304993, 1.217175, 0.2941177, 0, 1, 1,
0.5400653, 1.607077, 1.754787, 0.3019608, 0, 1, 1,
0.5434982, 0.3386098, 0.1804683, 0.3098039, 0, 1, 1,
0.5451592, -1.159698, 1.294505, 0.3137255, 0, 1, 1,
0.5506192, 1.659995, -0.4308804, 0.3215686, 0, 1, 1,
0.5508185, -0.1867445, 2.521354, 0.3254902, 0, 1, 1,
0.5508737, -0.08385881, -0.1694105, 0.3333333, 0, 1, 1,
0.5511234, -0.8708295, 3.194888, 0.3372549, 0, 1, 1,
0.5532997, 0.00499959, 2.332414, 0.345098, 0, 1, 1,
0.5618558, -0.150044, 1.869906, 0.3490196, 0, 1, 1,
0.5634835, -1.137354, 4.043746, 0.3568628, 0, 1, 1,
0.5662261, 0.1713662, 3.26741, 0.3607843, 0, 1, 1,
0.5667834, -0.6900381, 3.281348, 0.3686275, 0, 1, 1,
0.5695112, 0.3486059, 1.082631, 0.372549, 0, 1, 1,
0.5730894, -0.8453172, 2.544695, 0.3803922, 0, 1, 1,
0.5730963, -0.3839023, 0.6354217, 0.3843137, 0, 1, 1,
0.5765654, 0.2925142, 0.5291578, 0.3921569, 0, 1, 1,
0.5782354, -0.02295296, 0.8150009, 0.3960784, 0, 1, 1,
0.5809196, 0.9715639, 0.4161873, 0.4039216, 0, 1, 1,
0.5849379, 0.1481576, 0.5016977, 0.4117647, 0, 1, 1,
0.592903, -1.425092, 1.808978, 0.4156863, 0, 1, 1,
0.5988418, 0.7001994, -0.9632764, 0.4235294, 0, 1, 1,
0.5994993, 0.4989502, 0.6966915, 0.427451, 0, 1, 1,
0.6069009, 1.07199, -0.4826859, 0.4352941, 0, 1, 1,
0.614852, -0.6924533, 2.069734, 0.4392157, 0, 1, 1,
0.6155408, -0.3249764, 2.230929, 0.4470588, 0, 1, 1,
0.6162656, 1.260692, -0.6189196, 0.4509804, 0, 1, 1,
0.6262948, -0.4368712, 3.383304, 0.4588235, 0, 1, 1,
0.6309429, -1.948401, 2.705595, 0.4627451, 0, 1, 1,
0.6343747, 2.736944, 0.01667687, 0.4705882, 0, 1, 1,
0.6371548, -0.8219703, 4.367603, 0.4745098, 0, 1, 1,
0.637262, -1.077862, 2.420409, 0.4823529, 0, 1, 1,
0.6381986, -1.464178, 3.360729, 0.4862745, 0, 1, 1,
0.6388833, -1.072662, 2.714615, 0.4941176, 0, 1, 1,
0.645759, -0.6563359, 3.16605, 0.5019608, 0, 1, 1,
0.6512898, 0.5895723, 1.519712, 0.5058824, 0, 1, 1,
0.6529483, 0.2175838, 1.577657, 0.5137255, 0, 1, 1,
0.6579, 1.83563, -2.827608, 0.5176471, 0, 1, 1,
0.6592266, 0.4820113, 0.5881512, 0.5254902, 0, 1, 1,
0.6593912, 2.027254, 1.388358, 0.5294118, 0, 1, 1,
0.6599341, -0.3359378, 1.445443, 0.5372549, 0, 1, 1,
0.6600643, -0.6764166, 1.968975, 0.5411765, 0, 1, 1,
0.6639295, 0.8588361, 0.08442052, 0.5490196, 0, 1, 1,
0.6654994, 0.02935782, 0.09753905, 0.5529412, 0, 1, 1,
0.6741854, 0.6958932, 1.582775, 0.5607843, 0, 1, 1,
0.6776063, -0.558807, 2.350027, 0.5647059, 0, 1, 1,
0.6824086, 0.1406183, 1.428628, 0.572549, 0, 1, 1,
0.6937516, 0.6898105, 0.46528, 0.5764706, 0, 1, 1,
0.6974948, -2.068777, 4.78536, 0.5843138, 0, 1, 1,
0.7010844, -1.095707, 3.668557, 0.5882353, 0, 1, 1,
0.7020251, -0.2945308, 1.445689, 0.5960785, 0, 1, 1,
0.702989, -1.42142, 4.953742, 0.6039216, 0, 1, 1,
0.7199098, -1.254444, 3.478637, 0.6078432, 0, 1, 1,
0.7236099, 1.356403, -0.1775859, 0.6156863, 0, 1, 1,
0.7292328, 1.07124, 0.6777761, 0.6196079, 0, 1, 1,
0.7311829, -0.08708273, 0.4189861, 0.627451, 0, 1, 1,
0.7404624, -0.6091312, 2.999689, 0.6313726, 0, 1, 1,
0.7412012, -0.7647468, 1.032364, 0.6392157, 0, 1, 1,
0.7432692, 0.4617998, -0.2495209, 0.6431373, 0, 1, 1,
0.7446662, -1.843158, 3.166617, 0.6509804, 0, 1, 1,
0.7461741, 1.060732, -0.39938, 0.654902, 0, 1, 1,
0.7479585, -0.2824115, 3.315726, 0.6627451, 0, 1, 1,
0.7634335, -0.5853699, 0.4351776, 0.6666667, 0, 1, 1,
0.7666624, 0.7768672, 1.110135, 0.6745098, 0, 1, 1,
0.7693056, -0.868674, 2.922401, 0.6784314, 0, 1, 1,
0.7697948, 0.4910492, 1.229024, 0.6862745, 0, 1, 1,
0.7836701, -2.245809, 2.44809, 0.6901961, 0, 1, 1,
0.7847371, -1.11344, 2.477252, 0.6980392, 0, 1, 1,
0.7905352, -0.7118421, 1.850774, 0.7058824, 0, 1, 1,
0.7909057, -0.412332, 2.15304, 0.7098039, 0, 1, 1,
0.7911854, 0.6513402, -0.4085674, 0.7176471, 0, 1, 1,
0.8009776, 0.2238941, 0.3810328, 0.7215686, 0, 1, 1,
0.8035541, -0.5367352, 1.41871, 0.7294118, 0, 1, 1,
0.8065546, 0.5209327, -0.3117185, 0.7333333, 0, 1, 1,
0.809934, -0.1593845, 1.575614, 0.7411765, 0, 1, 1,
0.8108102, 0.1579111, 1.072599, 0.7450981, 0, 1, 1,
0.8121037, 1.867036, -0.7230191, 0.7529412, 0, 1, 1,
0.8127395, -0.5531361, 2.888009, 0.7568628, 0, 1, 1,
0.8141035, 0.7488108, 0.4153863, 0.7647059, 0, 1, 1,
0.8166049, 0.04315965, 2.604752, 0.7686275, 0, 1, 1,
0.8203268, -1.910275, 3.638293, 0.7764706, 0, 1, 1,
0.8222975, 1.178051, 1.448228, 0.7803922, 0, 1, 1,
0.8292094, 0.5754676, 1.003489, 0.7882353, 0, 1, 1,
0.8376766, -0.2941829, 1.199311, 0.7921569, 0, 1, 1,
0.8391868, 0.1119129, 1.93792, 0.8, 0, 1, 1,
0.8415256, 0.294416, 2.982742, 0.8078431, 0, 1, 1,
0.8445327, 0.8065374, 1.479549, 0.8117647, 0, 1, 1,
0.8469961, 0.3054442, 1.345563, 0.8196079, 0, 1, 1,
0.8487594, 0.3956319, 2.947252, 0.8235294, 0, 1, 1,
0.8545398, 1.308201, 0.6741009, 0.8313726, 0, 1, 1,
0.8549643, 0.4238922, 1.365476, 0.8352941, 0, 1, 1,
0.8613388, -0.283602, 2.651876, 0.8431373, 0, 1, 1,
0.862007, 0.4172024, 1.132747, 0.8470588, 0, 1, 1,
0.8624852, -1.153724, 1.73756, 0.854902, 0, 1, 1,
0.8640478, -0.1777919, 3.181287, 0.8588235, 0, 1, 1,
0.8664921, -1.457322, 1.651992, 0.8666667, 0, 1, 1,
0.8671873, -0.4845181, 0.5005527, 0.8705882, 0, 1, 1,
0.8712038, -0.5279894, 2.793376, 0.8784314, 0, 1, 1,
0.8712336, -0.09103679, 2.313021, 0.8823529, 0, 1, 1,
0.8862552, -0.5236573, 3.817994, 0.8901961, 0, 1, 1,
0.8942904, 1.667842, 1.217128, 0.8941177, 0, 1, 1,
0.8979084, 0.3592132, 0.2602424, 0.9019608, 0, 1, 1,
0.9027932, 1.431711, 1.882021, 0.9098039, 0, 1, 1,
0.9058772, -0.3666333, 2.195239, 0.9137255, 0, 1, 1,
0.9111055, 1.211164, -0.5573627, 0.9215686, 0, 1, 1,
0.912085, 1.210669, 1.029055, 0.9254902, 0, 1, 1,
0.9188475, 0.3140137, 2.463625, 0.9333333, 0, 1, 1,
0.9224085, 0.1431504, 1.324317, 0.9372549, 0, 1, 1,
0.9224432, 1.621936, 1.748378, 0.945098, 0, 1, 1,
0.9230208, 0.5612505, 1.547572, 0.9490196, 0, 1, 1,
0.9272627, -1.171966, 1.645352, 0.9568627, 0, 1, 1,
0.9279391, -0.3880011, -0.01011088, 0.9607843, 0, 1, 1,
0.9291588, -0.8110347, 2.725885, 0.9686275, 0, 1, 1,
0.9304891, -0.3685562, 0.03556548, 0.972549, 0, 1, 1,
0.9320235, 1.675799, -0.9016922, 0.9803922, 0, 1, 1,
0.934006, 0.3051595, 0.0846258, 0.9843137, 0, 1, 1,
0.9354134, 0.07470973, 0.6796786, 0.9921569, 0, 1, 1,
0.941204, 2.877884, 0.3208585, 0.9960784, 0, 1, 1,
0.9418551, 0.4292216, 0.9805548, 1, 0, 0.9960784, 1,
0.9470508, -0.5117634, 3.078196, 1, 0, 0.9882353, 1,
0.9541209, 0.7863737, 0.5904606, 1, 0, 0.9843137, 1,
0.9579869, -0.3801444, 2.349333, 1, 0, 0.9764706, 1,
0.9584626, -1.593652, 1.338668, 1, 0, 0.972549, 1,
0.9635473, 0.6138803, 0.4183664, 1, 0, 0.9647059, 1,
0.9698284, -0.4335919, 3.631166, 1, 0, 0.9607843, 1,
0.9701126, -1.868218, 1.13106, 1, 0, 0.9529412, 1,
0.9726772, 0.6025445, 1.137504, 1, 0, 0.9490196, 1,
0.9740964, -0.1744498, 1.995657, 1, 0, 0.9411765, 1,
0.9753949, 1.280221, 1.708736, 1, 0, 0.9372549, 1,
0.9756324, 0.169574, 1.41415, 1, 0, 0.9294118, 1,
0.9762754, 2.491537, 0.07114747, 1, 0, 0.9254902, 1,
0.9773239, -0.3087519, 1.945042, 1, 0, 0.9176471, 1,
0.9774815, -0.7470607, 1.623318, 1, 0, 0.9137255, 1,
0.9795391, 1.479071, 0.05689929, 1, 0, 0.9058824, 1,
0.9849924, 0.4669062, 0.5536951, 1, 0, 0.9019608, 1,
0.9902803, -0.3353761, 4.097878, 1, 0, 0.8941177, 1,
0.9905297, 0.1697048, 1.423102, 1, 0, 0.8862745, 1,
0.9923899, -1.024947, 2.627944, 1, 0, 0.8823529, 1,
0.9939854, 0.7392349, 1.220494, 1, 0, 0.8745098, 1,
0.9954844, 0.2762204, 0.6233614, 1, 0, 0.8705882, 1,
1.00553, 0.4601179, 1.878271, 1, 0, 0.8627451, 1,
1.006915, 0.6830377, 0.02934445, 1, 0, 0.8588235, 1,
1.009597, 0.3419406, 1.012192, 1, 0, 0.8509804, 1,
1.011925, 0.06244829, -0.06220502, 1, 0, 0.8470588, 1,
1.016064, -0.45536, 0.5208722, 1, 0, 0.8392157, 1,
1.020915, 0.07736399, 1.807234, 1, 0, 0.8352941, 1,
1.023407, 1.090881, 0.7826743, 1, 0, 0.827451, 1,
1.024343, -1.318124, 3.362947, 1, 0, 0.8235294, 1,
1.031938, 0.1194667, 1.005221, 1, 0, 0.8156863, 1,
1.042224, -0.7646366, 1.85854, 1, 0, 0.8117647, 1,
1.044844, -0.5096058, 4.443745, 1, 0, 0.8039216, 1,
1.057424, -1.504514, 2.294368, 1, 0, 0.7960784, 1,
1.057892, 0.2710719, -1.330569, 1, 0, 0.7921569, 1,
1.068611, -0.4818064, 1.005042, 1, 0, 0.7843137, 1,
1.070412, -0.5539784, 2.0279, 1, 0, 0.7803922, 1,
1.0744, -0.7862303, 1.553729, 1, 0, 0.772549, 1,
1.07618, 1.572018, 0.996383, 1, 0, 0.7686275, 1,
1.079434, 0.9232402, 0.8849348, 1, 0, 0.7607843, 1,
1.084223, 1.943441, -0.5344804, 1, 0, 0.7568628, 1,
1.084897, -0.03444076, 3.351439, 1, 0, 0.7490196, 1,
1.086403, 2.052258, -0.09078191, 1, 0, 0.7450981, 1,
1.088195, -0.6337999, 0.9978317, 1, 0, 0.7372549, 1,
1.095433, 0.519504, 0.6465721, 1, 0, 0.7333333, 1,
1.101488, -0.2672897, 1.073418, 1, 0, 0.7254902, 1,
1.112488, 1.063902, -0.06979094, 1, 0, 0.7215686, 1,
1.11308, 1.110664, -1.071664, 1, 0, 0.7137255, 1,
1.117161, 1.200122, 1.039629, 1, 0, 0.7098039, 1,
1.118174, 0.5984813, 1.537797, 1, 0, 0.7019608, 1,
1.125116, 0.361737, -0.6491669, 1, 0, 0.6941177, 1,
1.126364, -0.8229026, 1.005786, 1, 0, 0.6901961, 1,
1.127581, -1.008443, 2.696395, 1, 0, 0.682353, 1,
1.1301, 0.8046046, 0.4757871, 1, 0, 0.6784314, 1,
1.133554, -1.889278, 1.936166, 1, 0, 0.6705883, 1,
1.14491, -2.203816, 2.554412, 1, 0, 0.6666667, 1,
1.148752, -1.172469, 1.117699, 1, 0, 0.6588235, 1,
1.151501, -1.476929, 0.7832419, 1, 0, 0.654902, 1,
1.154942, 0.2723003, 1.632562, 1, 0, 0.6470588, 1,
1.160784, -0.9870784, 2.216331, 1, 0, 0.6431373, 1,
1.170378, -0.3445054, 3.921601, 1, 0, 0.6352941, 1,
1.1771, 0.07036971, 1.02925, 1, 0, 0.6313726, 1,
1.177797, -0.7224324, 1.759934, 1, 0, 0.6235294, 1,
1.181787, 0.7019135, 1.183445, 1, 0, 0.6196079, 1,
1.187138, 1.269974, 1.141883, 1, 0, 0.6117647, 1,
1.194294, 0.5173522, 1.264512, 1, 0, 0.6078432, 1,
1.197459, 0.4666989, -0.02039572, 1, 0, 0.6, 1,
1.202073, 1.470856, -0.3915991, 1, 0, 0.5921569, 1,
1.206905, 0.1108743, 1.125242, 1, 0, 0.5882353, 1,
1.216484, -0.09451979, 1.659557, 1, 0, 0.5803922, 1,
1.217866, -1.12536, 2.965501, 1, 0, 0.5764706, 1,
1.218111, 0.1576247, 0.5832834, 1, 0, 0.5686275, 1,
1.219037, -0.4605387, 2.210611, 1, 0, 0.5647059, 1,
1.229838, -0.2610218, 1.58649, 1, 0, 0.5568628, 1,
1.234065, -0.2471998, -0.9304745, 1, 0, 0.5529412, 1,
1.241452, 0.355574, -0.2317521, 1, 0, 0.5450981, 1,
1.249796, 1.984088, 0.2613901, 1, 0, 0.5411765, 1,
1.250249, -0.9089797, 1.778318, 1, 0, 0.5333334, 1,
1.250867, -1.100633, 2.562863, 1, 0, 0.5294118, 1,
1.261254, 1.018751, -0.9736591, 1, 0, 0.5215687, 1,
1.263938, -0.8681291, 3.033932, 1, 0, 0.5176471, 1,
1.266974, 1.522815, 0.7069051, 1, 0, 0.509804, 1,
1.270947, 0.6997688, 0.6464975, 1, 0, 0.5058824, 1,
1.279869, 1.957847, 1.61354, 1, 0, 0.4980392, 1,
1.281212, -0.297544, 1.495188, 1, 0, 0.4901961, 1,
1.291873, 1.035102, 3.747127, 1, 0, 0.4862745, 1,
1.292353, 1.481677, 0.3916989, 1, 0, 0.4784314, 1,
1.310345, -0.7814302, 1.742761, 1, 0, 0.4745098, 1,
1.335937, 0.4613846, 1.568364, 1, 0, 0.4666667, 1,
1.348938, 1.455924, 2.379068, 1, 0, 0.4627451, 1,
1.351971, -0.05828938, 1.659604, 1, 0, 0.454902, 1,
1.362809, 1.373128, 0.888529, 1, 0, 0.4509804, 1,
1.364843, 1.82128, 0.8307506, 1, 0, 0.4431373, 1,
1.36888, -0.551588, 2.772797, 1, 0, 0.4392157, 1,
1.374019, 0.6752611, 0.754086, 1, 0, 0.4313726, 1,
1.406153, 0.06932616, 1.712371, 1, 0, 0.427451, 1,
1.412723, 1.379362, 0.007981974, 1, 0, 0.4196078, 1,
1.419836, -1.42153, 1.27757, 1, 0, 0.4156863, 1,
1.421972, -0.6132801, 0.7671339, 1, 0, 0.4078431, 1,
1.425753, 0.1388252, 0.4607835, 1, 0, 0.4039216, 1,
1.42949, -0.3124317, 2.849032, 1, 0, 0.3960784, 1,
1.434822, -1.892522, 2.387901, 1, 0, 0.3882353, 1,
1.438937, -0.589447, 2.71657, 1, 0, 0.3843137, 1,
1.46937, 0.2087073, 3.591007, 1, 0, 0.3764706, 1,
1.46962, 1.703319, 0.5556649, 1, 0, 0.372549, 1,
1.501711, 0.402611, 0.7247375, 1, 0, 0.3647059, 1,
1.510889, 0.9220111, 2.389767, 1, 0, 0.3607843, 1,
1.525994, -0.3432996, 1.475775, 1, 0, 0.3529412, 1,
1.532422, 0.311527, 1.730024, 1, 0, 0.3490196, 1,
1.539151, -0.8769039, 1.385612, 1, 0, 0.3411765, 1,
1.540098, 0.2077539, 1.62309, 1, 0, 0.3372549, 1,
1.550722, -0.1064274, 3.173597, 1, 0, 0.3294118, 1,
1.551644, -0.5258335, 2.976742, 1, 0, 0.3254902, 1,
1.552251, 0.1802894, 1.825767, 1, 0, 0.3176471, 1,
1.556154, -1.424201, 1.250001, 1, 0, 0.3137255, 1,
1.561616, -2.404396, 3.171968, 1, 0, 0.3058824, 1,
1.570776, -1.736391, 1.318276, 1, 0, 0.2980392, 1,
1.57375, 1.285771, 1.646532, 1, 0, 0.2941177, 1,
1.597564, -0.6700103, 2.60044, 1, 0, 0.2862745, 1,
1.600933, 0.07077362, 1.853558, 1, 0, 0.282353, 1,
1.615207, -1.954162, 1.806296, 1, 0, 0.2745098, 1,
1.624894, -2.462435, 4.093225, 1, 0, 0.2705882, 1,
1.627621, -0.196729, 2.964912, 1, 0, 0.2627451, 1,
1.636645, -1.857506, 2.620399, 1, 0, 0.2588235, 1,
1.636964, -0.3887157, 1.433176, 1, 0, 0.2509804, 1,
1.638824, 0.6321504, 0.5651149, 1, 0, 0.2470588, 1,
1.64416, 1.390799, 1.360362, 1, 0, 0.2392157, 1,
1.659435, 0.2637112, 2.142657, 1, 0, 0.2352941, 1,
1.676449, -1.117339, 2.768222, 1, 0, 0.227451, 1,
1.686384, 1.126436, 2.030096, 1, 0, 0.2235294, 1,
1.691737, 1.27373, 0.5219404, 1, 0, 0.2156863, 1,
1.704567, 1.839867, -0.2991202, 1, 0, 0.2117647, 1,
1.735393, 0.07647071, 1.220488, 1, 0, 0.2039216, 1,
1.748972, 1.427831, 2.013856, 1, 0, 0.1960784, 1,
1.759329, -0.9215661, 1.908805, 1, 0, 0.1921569, 1,
1.779178, -0.9198715, 2.171823, 1, 0, 0.1843137, 1,
1.800048, 1.01492, 0.4257785, 1, 0, 0.1803922, 1,
1.81357, 1.251391, 2.534196, 1, 0, 0.172549, 1,
1.830791, -1.421367, 2.095941, 1, 0, 0.1686275, 1,
1.849248, 0.7360507, 2.006377, 1, 0, 0.1607843, 1,
1.857877, -1.670955, 1.201102, 1, 0, 0.1568628, 1,
1.868973, 0.4878048, -0.4242921, 1, 0, 0.1490196, 1,
1.881532, 0.02564864, 2.751732, 1, 0, 0.145098, 1,
1.908636, -0.8348922, 0.6582735, 1, 0, 0.1372549, 1,
2.006798, 0.3653662, 0.4799004, 1, 0, 0.1333333, 1,
2.10907, -0.7878627, 3.232863, 1, 0, 0.1254902, 1,
2.13261, -1.826387, 3.888397, 1, 0, 0.1215686, 1,
2.137188, -0.268383, 1.460288, 1, 0, 0.1137255, 1,
2.143805, -1.197569, 2.131567, 1, 0, 0.1098039, 1,
2.17396, 0.4298681, 1.088812, 1, 0, 0.1019608, 1,
2.181497, -0.4687137, 1.781573, 1, 0, 0.09411765, 1,
2.190788, -0.242663, 0.8100837, 1, 0, 0.09019608, 1,
2.195112, -1.663757, 1.432473, 1, 0, 0.08235294, 1,
2.204844, -2.111106, 2.041052, 1, 0, 0.07843138, 1,
2.208529, 0.4821669, 2.787407, 1, 0, 0.07058824, 1,
2.222434, 0.5399349, 1.613407, 1, 0, 0.06666667, 1,
2.253571, 1.95902, 1.660611, 1, 0, 0.05882353, 1,
2.370133, 0.6007568, -0.3393816, 1, 0, 0.05490196, 1,
2.373144, 1.083015, -0.2627927, 1, 0, 0.04705882, 1,
2.379234, -0.4537237, 2.953334, 1, 0, 0.04313726, 1,
2.379772, -0.4296643, 1.68753, 1, 0, 0.03529412, 1,
2.613657, -1.531305, 0.6270826, 1, 0, 0.03137255, 1,
2.613986, -0.4027661, 2.180399, 1, 0, 0.02352941, 1,
2.63932, -0.2910755, 1.802982, 1, 0, 0.01960784, 1,
2.903615, 0.1841792, 0.6752043, 1, 0, 0.01176471, 1,
3.66607, 1.757495, 2.209157, 1, 0, 0.007843138, 1
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
0.1736439, -3.726588, -7.051035, 0, -0.5, 0.5, 0.5,
0.1736439, -3.726588, -7.051035, 1, -0.5, 0.5, 0.5,
0.1736439, -3.726588, -7.051035, 1, 1.5, 0.5, 0.5,
0.1736439, -3.726588, -7.051035, 0, 1.5, 0.5, 0.5
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
-4.502715, 0.1029212, -7.051035, 0, -0.5, 0.5, 0.5,
-4.502715, 0.1029212, -7.051035, 1, -0.5, 0.5, 0.5,
-4.502715, 0.1029212, -7.051035, 1, 1.5, 0.5, 0.5,
-4.502715, 0.1029212, -7.051035, 0, 1.5, 0.5, 0.5
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
-4.502715, -3.726588, -0.07848191, 0, -0.5, 0.5, 0.5,
-4.502715, -3.726588, -0.07848191, 1, -0.5, 0.5, 0.5,
-4.502715, -3.726588, -0.07848191, 1, 1.5, 0.5, 0.5,
-4.502715, -3.726588, -0.07848191, 0, 1.5, 0.5, 0.5
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
-3, -2.842855, -5.441984,
3, -2.842855, -5.441984,
-3, -2.842855, -5.441984,
-3, -2.990144, -5.710159,
-2, -2.842855, -5.441984,
-2, -2.990144, -5.710159,
-1, -2.842855, -5.441984,
-1, -2.990144, -5.710159,
0, -2.842855, -5.441984,
0, -2.990144, -5.710159,
1, -2.842855, -5.441984,
1, -2.990144, -5.710159,
2, -2.842855, -5.441984,
2, -2.990144, -5.710159,
3, -2.842855, -5.441984,
3, -2.990144, -5.710159
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
-3, -3.284721, -6.24651, 0, -0.5, 0.5, 0.5,
-3, -3.284721, -6.24651, 1, -0.5, 0.5, 0.5,
-3, -3.284721, -6.24651, 1, 1.5, 0.5, 0.5,
-3, -3.284721, -6.24651, 0, 1.5, 0.5, 0.5,
-2, -3.284721, -6.24651, 0, -0.5, 0.5, 0.5,
-2, -3.284721, -6.24651, 1, -0.5, 0.5, 0.5,
-2, -3.284721, -6.24651, 1, 1.5, 0.5, 0.5,
-2, -3.284721, -6.24651, 0, 1.5, 0.5, 0.5,
-1, -3.284721, -6.24651, 0, -0.5, 0.5, 0.5,
-1, -3.284721, -6.24651, 1, -0.5, 0.5, 0.5,
-1, -3.284721, -6.24651, 1, 1.5, 0.5, 0.5,
-1, -3.284721, -6.24651, 0, 1.5, 0.5, 0.5,
0, -3.284721, -6.24651, 0, -0.5, 0.5, 0.5,
0, -3.284721, -6.24651, 1, -0.5, 0.5, 0.5,
0, -3.284721, -6.24651, 1, 1.5, 0.5, 0.5,
0, -3.284721, -6.24651, 0, 1.5, 0.5, 0.5,
1, -3.284721, -6.24651, 0, -0.5, 0.5, 0.5,
1, -3.284721, -6.24651, 1, -0.5, 0.5, 0.5,
1, -3.284721, -6.24651, 1, 1.5, 0.5, 0.5,
1, -3.284721, -6.24651, 0, 1.5, 0.5, 0.5,
2, -3.284721, -6.24651, 0, -0.5, 0.5, 0.5,
2, -3.284721, -6.24651, 1, -0.5, 0.5, 0.5,
2, -3.284721, -6.24651, 1, 1.5, 0.5, 0.5,
2, -3.284721, -6.24651, 0, 1.5, 0.5, 0.5,
3, -3.284721, -6.24651, 0, -0.5, 0.5, 0.5,
3, -3.284721, -6.24651, 1, -0.5, 0.5, 0.5,
3, -3.284721, -6.24651, 1, 1.5, 0.5, 0.5,
3, -3.284721, -6.24651, 0, 1.5, 0.5, 0.5
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
-3.423555, -2, -5.441984,
-3.423555, 2, -5.441984,
-3.423555, -2, -5.441984,
-3.603415, -2, -5.710159,
-3.423555, -1, -5.441984,
-3.603415, -1, -5.710159,
-3.423555, 0, -5.441984,
-3.603415, 0, -5.710159,
-3.423555, 1, -5.441984,
-3.603415, 1, -5.710159,
-3.423555, 2, -5.441984,
-3.603415, 2, -5.710159
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
-3.963135, -2, -6.24651, 0, -0.5, 0.5, 0.5,
-3.963135, -2, -6.24651, 1, -0.5, 0.5, 0.5,
-3.963135, -2, -6.24651, 1, 1.5, 0.5, 0.5,
-3.963135, -2, -6.24651, 0, 1.5, 0.5, 0.5,
-3.963135, -1, -6.24651, 0, -0.5, 0.5, 0.5,
-3.963135, -1, -6.24651, 1, -0.5, 0.5, 0.5,
-3.963135, -1, -6.24651, 1, 1.5, 0.5, 0.5,
-3.963135, -1, -6.24651, 0, 1.5, 0.5, 0.5,
-3.963135, 0, -6.24651, 0, -0.5, 0.5, 0.5,
-3.963135, 0, -6.24651, 1, -0.5, 0.5, 0.5,
-3.963135, 0, -6.24651, 1, 1.5, 0.5, 0.5,
-3.963135, 0, -6.24651, 0, 1.5, 0.5, 0.5,
-3.963135, 1, -6.24651, 0, -0.5, 0.5, 0.5,
-3.963135, 1, -6.24651, 1, -0.5, 0.5, 0.5,
-3.963135, 1, -6.24651, 1, 1.5, 0.5, 0.5,
-3.963135, 1, -6.24651, 0, 1.5, 0.5, 0.5,
-3.963135, 2, -6.24651, 0, -0.5, 0.5, 0.5,
-3.963135, 2, -6.24651, 1, -0.5, 0.5, 0.5,
-3.963135, 2, -6.24651, 1, 1.5, 0.5, 0.5,
-3.963135, 2, -6.24651, 0, 1.5, 0.5, 0.5
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
-3.423555, -2.842855, -4,
-3.423555, -2.842855, 4,
-3.423555, -2.842855, -4,
-3.603415, -2.990144, -4,
-3.423555, -2.842855, -2,
-3.603415, -2.990144, -2,
-3.423555, -2.842855, 0,
-3.603415, -2.990144, 0,
-3.423555, -2.842855, 2,
-3.603415, -2.990144, 2,
-3.423555, -2.842855, 4,
-3.603415, -2.990144, 4
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
-3.963135, -3.284721, -4, 0, -0.5, 0.5, 0.5,
-3.963135, -3.284721, -4, 1, -0.5, 0.5, 0.5,
-3.963135, -3.284721, -4, 1, 1.5, 0.5, 0.5,
-3.963135, -3.284721, -4, 0, 1.5, 0.5, 0.5,
-3.963135, -3.284721, -2, 0, -0.5, 0.5, 0.5,
-3.963135, -3.284721, -2, 1, -0.5, 0.5, 0.5,
-3.963135, -3.284721, -2, 1, 1.5, 0.5, 0.5,
-3.963135, -3.284721, -2, 0, 1.5, 0.5, 0.5,
-3.963135, -3.284721, 0, 0, -0.5, 0.5, 0.5,
-3.963135, -3.284721, 0, 1, -0.5, 0.5, 0.5,
-3.963135, -3.284721, 0, 1, 1.5, 0.5, 0.5,
-3.963135, -3.284721, 0, 0, 1.5, 0.5, 0.5,
-3.963135, -3.284721, 2, 0, -0.5, 0.5, 0.5,
-3.963135, -3.284721, 2, 1, -0.5, 0.5, 0.5,
-3.963135, -3.284721, 2, 1, 1.5, 0.5, 0.5,
-3.963135, -3.284721, 2, 0, 1.5, 0.5, 0.5,
-3.963135, -3.284721, 4, 0, -0.5, 0.5, 0.5,
-3.963135, -3.284721, 4, 1, -0.5, 0.5, 0.5,
-3.963135, -3.284721, 4, 1, 1.5, 0.5, 0.5,
-3.963135, -3.284721, 4, 0, 1.5, 0.5, 0.5
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
-3.423555, -2.842855, -5.441984,
-3.423555, 3.048697, -5.441984,
-3.423555, -2.842855, 5.28502,
-3.423555, 3.048697, 5.28502,
-3.423555, -2.842855, -5.441984,
-3.423555, -2.842855, 5.28502,
-3.423555, 3.048697, -5.441984,
-3.423555, 3.048697, 5.28502,
-3.423555, -2.842855, -5.441984,
3.770843, -2.842855, -5.441984,
-3.423555, -2.842855, 5.28502,
3.770843, -2.842855, 5.28502,
-3.423555, 3.048697, -5.441984,
3.770843, 3.048697, -5.441984,
-3.423555, 3.048697, 5.28502,
3.770843, 3.048697, 5.28502,
3.770843, -2.842855, -5.441984,
3.770843, 3.048697, -5.441984,
3.770843, -2.842855, 5.28502,
3.770843, 3.048697, 5.28502,
3.770843, -2.842855, -5.441984,
3.770843, -2.842855, 5.28502,
3.770843, 3.048697, -5.441984,
3.770843, 3.048697, 5.28502
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
var radius = 7.580613;
var distance = 33.72701;
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
mvMatrix.translate( -0.1736439, -0.1029212, 0.07848191 );
mvMatrix.scale( 1.139263, 1.391197, 0.7640817 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.72701);
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
fluroxypyr<-read.table("fluroxypyr.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-fluroxypyr$V2
```

```
## Error in eval(expr, envir, enclos): object 'fluroxypyr' not found
```

```r
y<-fluroxypyr$V3
```

```
## Error in eval(expr, envir, enclos): object 'fluroxypyr' not found
```

```r
z<-fluroxypyr$V4
```

```
## Error in eval(expr, envir, enclos): object 'fluroxypyr' not found
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
-3.318782, 0.8400991, -1.822342, 0, 0, 1, 1, 1,
-3.27223, 0.6562551, 0.6558169, 1, 0, 0, 1, 1,
-2.904048, 0.6448651, -2.754883, 1, 0, 0, 1, 1,
-2.842397, 1.289553, -0.4753793, 1, 0, 0, 1, 1,
-2.683167, 0.3689755, -1.682804, 1, 0, 0, 1, 1,
-2.673423, -1.995583, -2.474644, 1, 0, 0, 1, 1,
-2.502364, -0.3829737, -1.621803, 0, 0, 0, 1, 1,
-2.473238, 0.0715912, -1.361572, 0, 0, 0, 1, 1,
-2.441507, -0.354062, -4.126794, 0, 0, 0, 1, 1,
-2.44146, 0.6576441, -0.1648004, 0, 0, 0, 1, 1,
-2.33592, 0.4143275, -1.891479, 0, 0, 0, 1, 1,
-2.296184, -0.9443008, -0.896596, 0, 0, 0, 1, 1,
-2.285847, -0.4762691, -2.528272, 0, 0, 0, 1, 1,
-2.27496, -1.774075, -1.799211, 1, 1, 1, 1, 1,
-2.112755, -0.275702, 0.1525992, 1, 1, 1, 1, 1,
-2.099871, 0.3379154, -1.932315, 1, 1, 1, 1, 1,
-2.097596, -1.799101, -3.556681, 1, 1, 1, 1, 1,
-2.085641, -0.235697, -1.812339, 1, 1, 1, 1, 1,
-2.050236, -0.9099181, -0.9781526, 1, 1, 1, 1, 1,
-2.031465, -1.324712, -1.659203, 1, 1, 1, 1, 1,
-2.026361, 0.008013352, -4.515009, 1, 1, 1, 1, 1,
-2.011304, -1.226229, -2.982578, 1, 1, 1, 1, 1,
-2.009832, 0.7229553, -0.5361578, 1, 1, 1, 1, 1,
-1.973805, -0.0348781, -1.620209, 1, 1, 1, 1, 1,
-1.933675, 1.871039, -0.4240704, 1, 1, 1, 1, 1,
-1.911278, -0.242682, -1.111737, 1, 1, 1, 1, 1,
-1.901092, 1.18911, -1.393268, 1, 1, 1, 1, 1,
-1.887386, -1.22714, -1.90785, 1, 1, 1, 1, 1,
-1.883166, 1.049903, -1.219378, 0, 0, 1, 1, 1,
-1.81733, 0.611653, 1.584337, 1, 0, 0, 1, 1,
-1.798982, 0.5579918, -1.230955, 1, 0, 0, 1, 1,
-1.794072, 1.279169, 0.0727278, 1, 0, 0, 1, 1,
-1.793635, 1.460322, -0.7951285, 1, 0, 0, 1, 1,
-1.776039, -0.5541082, -2.177873, 1, 0, 0, 1, 1,
-1.765207, 0.4184133, -2.138574, 0, 0, 0, 1, 1,
-1.741716, 1.366544, -0.9885421, 0, 0, 0, 1, 1,
-1.719218, -0.6880302, -3.647284, 0, 0, 0, 1, 1,
-1.713234, 0.5869933, -2.023012, 0, 0, 0, 1, 1,
-1.705815, 0.3278085, -1.444361, 0, 0, 0, 1, 1,
-1.701528, -0.983651, -3.403291, 0, 0, 0, 1, 1,
-1.700762, 0.49834, -2.096877, 0, 0, 0, 1, 1,
-1.697094, -1.17003, -2.735853, 1, 1, 1, 1, 1,
-1.678117, 0.7464551, -2.146873, 1, 1, 1, 1, 1,
-1.672517, -1.533934, -2.331373, 1, 1, 1, 1, 1,
-1.660387, -1.442816, -3.209008, 1, 1, 1, 1, 1,
-1.657916, 1.12809, 0.9232036, 1, 1, 1, 1, 1,
-1.65232, -0.3869864, -0.4844253, 1, 1, 1, 1, 1,
-1.649658, -0.9332845, -1.780034, 1, 1, 1, 1, 1,
-1.644216, -0.3569099, 0.5819533, 1, 1, 1, 1, 1,
-1.631368, -1.46395, -0.6543837, 1, 1, 1, 1, 1,
-1.630135, 0.9250451, -0.5231752, 1, 1, 1, 1, 1,
-1.614742, -1.49259, -2.329831, 1, 1, 1, 1, 1,
-1.609627, 0.3706633, -0.3838856, 1, 1, 1, 1, 1,
-1.607958, 0.1801644, -2.617364, 1, 1, 1, 1, 1,
-1.602382, 0.4019365, 0.8774869, 1, 1, 1, 1, 1,
-1.570678, -0.5012488, -1.211212, 1, 1, 1, 1, 1,
-1.553031, -0.2136156, -1.505006, 0, 0, 1, 1, 1,
-1.550282, 0.6163883, -0.2889079, 1, 0, 0, 1, 1,
-1.544255, -1.089494, -1.267633, 1, 0, 0, 1, 1,
-1.541616, 0.2355309, -2.459656, 1, 0, 0, 1, 1,
-1.533834, 0.04412594, -0.1331514, 1, 0, 0, 1, 1,
-1.531348, -0.547356, -1.786602, 1, 0, 0, 1, 1,
-1.525809, -0.5193943, -1.304274, 0, 0, 0, 1, 1,
-1.492807, 0.577457, -4.039266, 0, 0, 0, 1, 1,
-1.488746, 0.9171695, -0.1039058, 0, 0, 0, 1, 1,
-1.477405, 1.27832, 0.3533942, 0, 0, 0, 1, 1,
-1.465925, -2.020862, -4.636824, 0, 0, 0, 1, 1,
-1.454406, 2.123221, -0.5841976, 0, 0, 0, 1, 1,
-1.445068, 1.180069, -2.098655, 0, 0, 0, 1, 1,
-1.433921, -1.12886, -3.164662, 1, 1, 1, 1, 1,
-1.430555, -1.439427, -1.76637, 1, 1, 1, 1, 1,
-1.426045, -1.561684, -3.657319, 1, 1, 1, 1, 1,
-1.414691, -0.4255128, -3.877673, 1, 1, 1, 1, 1,
-1.411556, 0.2640005, -0.6685547, 1, 1, 1, 1, 1,
-1.406425, -0.7548764, -1.529396, 1, 1, 1, 1, 1,
-1.404924, 0.3312297, -2.601891, 1, 1, 1, 1, 1,
-1.403653, -0.94766, -3.572016, 1, 1, 1, 1, 1,
-1.401886, -0.3018715, -2.404985, 1, 1, 1, 1, 1,
-1.396839, -0.7810045, -1.295819, 1, 1, 1, 1, 1,
-1.396042, -0.06984635, -1.830136, 1, 1, 1, 1, 1,
-1.395662, 0.5606395, 0.6328297, 1, 1, 1, 1, 1,
-1.381116, 0.1776538, -3.264463, 1, 1, 1, 1, 1,
-1.378538, -0.5596411, -1.366771, 1, 1, 1, 1, 1,
-1.36493, 0.3669897, -0.7483207, 1, 1, 1, 1, 1,
-1.364911, 0.6955137, 1.315574, 0, 0, 1, 1, 1,
-1.364642, -0.2619795, -2.113292, 1, 0, 0, 1, 1,
-1.358094, 0.6067047, -1.431008, 1, 0, 0, 1, 1,
-1.355665, -0.4702669, -3.932516, 1, 0, 0, 1, 1,
-1.349648, 0.7295958, -1.040954, 1, 0, 0, 1, 1,
-1.349357, 0.04286169, 1.086628, 1, 0, 0, 1, 1,
-1.342001, 1.796601, -1.333699, 0, 0, 0, 1, 1,
-1.334347, -0.3093385, -5.285766, 0, 0, 0, 1, 1,
-1.332186, 0.1336979, -2.086974, 0, 0, 0, 1, 1,
-1.33007, -1.187105, -2.778516, 0, 0, 0, 1, 1,
-1.310272, 0.1673525, -0.5904416, 0, 0, 0, 1, 1,
-1.30712, -0.04419585, -1.114275, 0, 0, 0, 1, 1,
-1.306441, -0.4421143, -1.951509, 0, 0, 0, 1, 1,
-1.301606, 0.923588, 0.6327238, 1, 1, 1, 1, 1,
-1.287832, 1.733016, 1.350331, 1, 1, 1, 1, 1,
-1.280441, -1.808922, -2.841123, 1, 1, 1, 1, 1,
-1.278287, 0.1767612, -3.268326, 1, 1, 1, 1, 1,
-1.277164, 0.7660306, -1.834828, 1, 1, 1, 1, 1,
-1.277081, 0.3965852, -2.503142, 1, 1, 1, 1, 1,
-1.276035, -1.024315, -1.766135, 1, 1, 1, 1, 1,
-1.274009, -1.56119, -1.879111, 1, 1, 1, 1, 1,
-1.267432, 0.1853137, -1.291176, 1, 1, 1, 1, 1,
-1.266919, 0.3596152, -0.5647053, 1, 1, 1, 1, 1,
-1.265802, 0.7093579, -0.3981836, 1, 1, 1, 1, 1,
-1.261974, -1.533873, -2.663569, 1, 1, 1, 1, 1,
-1.245567, -1.091202, -2.542863, 1, 1, 1, 1, 1,
-1.239866, -0.1017292, -2.283404, 1, 1, 1, 1, 1,
-1.237849, 1.814585, -0.05445986, 1, 1, 1, 1, 1,
-1.235737, 1.012035, 0.8684281, 0, 0, 1, 1, 1,
-1.230956, -0.1538755, -0.1130723, 1, 0, 0, 1, 1,
-1.225667, 0.1925635, 0.2906645, 1, 0, 0, 1, 1,
-1.210249, 0.04390326, -3.619021, 1, 0, 0, 1, 1,
-1.207494, 0.2508927, -2.185757, 1, 0, 0, 1, 1,
-1.206355, -0.02767717, -1.419176, 1, 0, 0, 1, 1,
-1.196025, 0.2438875, -2.361733, 0, 0, 0, 1, 1,
-1.188259, 1.297626, -0.7499424, 0, 0, 0, 1, 1,
-1.183198, 1.593036, -2.946836, 0, 0, 0, 1, 1,
-1.181059, -0.05570467, -3.104868, 0, 0, 0, 1, 1,
-1.177528, 0.0005668965, -2.887021, 0, 0, 0, 1, 1,
-1.159365, 0.242193, -1.141094, 0, 0, 0, 1, 1,
-1.156009, 1.775153, 0.4139265, 0, 0, 0, 1, 1,
-1.155183, 0.2433324, -1.223953, 1, 1, 1, 1, 1,
-1.149091, 0.4612462, -1.739559, 1, 1, 1, 1, 1,
-1.144809, -0.9633716, -2.818805, 1, 1, 1, 1, 1,
-1.140434, 0.251372, 0.4889216, 1, 1, 1, 1, 1,
-1.137924, 1.17462, -1.905292, 1, 1, 1, 1, 1,
-1.135819, -0.02195954, -2.434738, 1, 1, 1, 1, 1,
-1.134795, -0.04218227, -0.5819085, 1, 1, 1, 1, 1,
-1.131666, -0.2030327, -0.4715427, 1, 1, 1, 1, 1,
-1.130475, -0.1072561, 0.4460378, 1, 1, 1, 1, 1,
-1.124593, 0.4972152, -1.446981, 1, 1, 1, 1, 1,
-1.122732, 0.07080394, -1.632267, 1, 1, 1, 1, 1,
-1.115281, 0.8047884, -1.491981, 1, 1, 1, 1, 1,
-1.112999, -0.9375418, -2.276942, 1, 1, 1, 1, 1,
-1.105575, -0.004787435, -1.838458, 1, 1, 1, 1, 1,
-1.100293, 0.5642509, -1.959395, 1, 1, 1, 1, 1,
-1.099209, -1.120786, -1.506232, 0, 0, 1, 1, 1,
-1.091491, -1.243298, -2.178925, 1, 0, 0, 1, 1,
-1.089575, 0.3027703, -0.5818796, 1, 0, 0, 1, 1,
-1.089128, -0.3862742, -2.036135, 1, 0, 0, 1, 1,
-1.080559, 0.08966728, -0.557705, 1, 0, 0, 1, 1,
-1.077057, 0.6774657, -1.409124, 1, 0, 0, 1, 1,
-1.075549, 1.877461, -0.205842, 0, 0, 0, 1, 1,
-1.07371, -0.1058127, -2.950213, 0, 0, 0, 1, 1,
-1.06857, -0.5177408, -0.7421889, 0, 0, 0, 1, 1,
-1.067573, 1.868212, -0.5357404, 0, 0, 0, 1, 1,
-1.056253, -1.043816, -1.608234, 0, 0, 0, 1, 1,
-1.041497, 1.109928, -1.318107, 0, 0, 0, 1, 1,
-1.036278, 0.03792997, -1.793216, 0, 0, 0, 1, 1,
-1.028868, 2.189809, -0.1098557, 1, 1, 1, 1, 1,
-1.023065, 0.8612102, -0.5954647, 1, 1, 1, 1, 1,
-1.022446, 0.117145, -0.9960655, 1, 1, 1, 1, 1,
-1.021318, 1.460097, -0.1898587, 1, 1, 1, 1, 1,
-1.015507, -0.3817028, -1.501282, 1, 1, 1, 1, 1,
-1.011185, 0.4024978, -1.065431, 1, 1, 1, 1, 1,
-1.00321, -0.8279837, -1.939074, 1, 1, 1, 1, 1,
-1.002512, -0.6769445, -2.953439, 1, 1, 1, 1, 1,
-1.001958, -1.460569, -2.248731, 1, 1, 1, 1, 1,
-0.9982606, 0.2835791, -1.78275, 1, 1, 1, 1, 1,
-0.9962208, 1.444916, -0.6597304, 1, 1, 1, 1, 1,
-0.9943478, 0.2057029, -1.827033, 1, 1, 1, 1, 1,
-0.9937071, 0.1807728, -0.8727198, 1, 1, 1, 1, 1,
-0.9814, -1.94692, -4.206422, 1, 1, 1, 1, 1,
-0.9654967, 0.02665808, -1.785108, 1, 1, 1, 1, 1,
-0.9596449, 1.197734, 1.128224, 0, 0, 1, 1, 1,
-0.956053, 1.760579, 1.147083, 1, 0, 0, 1, 1,
-0.944492, -1.175206, -0.4699558, 1, 0, 0, 1, 1,
-0.9434577, 0.03720924, -0.8637533, 1, 0, 0, 1, 1,
-0.9399417, -0.5539017, -2.679984, 1, 0, 0, 1, 1,
-0.9384626, -2.475236, -1.93014, 1, 0, 0, 1, 1,
-0.938222, 0.3333206, -1.28498, 0, 0, 0, 1, 1,
-0.9375984, 0.006018746, -3.200825, 0, 0, 0, 1, 1,
-0.9370074, 1.79029, -0.4966247, 0, 0, 0, 1, 1,
-0.9332168, 1.109225, -0.7647337, 0, 0, 0, 1, 1,
-0.9310181, -0.6789378, -0.2949502, 0, 0, 0, 1, 1,
-0.9254943, 0.4928067, -1.874787, 0, 0, 0, 1, 1,
-0.9135252, 0.2106956, -3.442092, 0, 0, 0, 1, 1,
-0.9120179, 0.9672667, -2.466996, 1, 1, 1, 1, 1,
-0.9101201, 0.424199, -0.450259, 1, 1, 1, 1, 1,
-0.907796, 0.248203, -0.2447484, 1, 1, 1, 1, 1,
-0.9023924, -0.1106258, -0.836777, 1, 1, 1, 1, 1,
-0.8941692, -0.1036104, -0.3621925, 1, 1, 1, 1, 1,
-0.8919595, -0.7226839, -0.4474587, 1, 1, 1, 1, 1,
-0.8877176, -2.010483, -1.593266, 1, 1, 1, 1, 1,
-0.8831347, 0.4983635, -1.961305, 1, 1, 1, 1, 1,
-0.8795813, 0.7317582, -0.4139022, 1, 1, 1, 1, 1,
-0.8790038, 0.08150678, -1.800709, 1, 1, 1, 1, 1,
-0.8554555, -0.09597994, -2.660942, 1, 1, 1, 1, 1,
-0.8528885, 0.6162209, -3.081687, 1, 1, 1, 1, 1,
-0.8518866, 1.999573, -1.332625, 1, 1, 1, 1, 1,
-0.8478538, -1.626827, -1.879009, 1, 1, 1, 1, 1,
-0.841333, 0.5620233, -1.758164, 1, 1, 1, 1, 1,
-0.8330773, 0.0334925, -0.1852624, 0, 0, 1, 1, 1,
-0.8282328, 2.158687, 0.2187782, 1, 0, 0, 1, 1,
-0.8212139, 0.6503693, -1.288474, 1, 0, 0, 1, 1,
-0.821028, 0.2237187, -2.146985, 1, 0, 0, 1, 1,
-0.8187119, -0.2253279, 0.528684, 1, 0, 0, 1, 1,
-0.8174969, 0.5081415, 0.7538531, 1, 0, 0, 1, 1,
-0.8140146, -0.7485258, -2.854523, 0, 0, 0, 1, 1,
-0.8114402, -0.3848621, -3.098626, 0, 0, 0, 1, 1,
-0.8022416, 0.4448567, -0.6701629, 0, 0, 0, 1, 1,
-0.8016984, 1.297626, 1.285932, 0, 0, 0, 1, 1,
-0.798238, 1.366597, -0.9007076, 0, 0, 0, 1, 1,
-0.7841532, 0.3285378, -0.6597204, 0, 0, 0, 1, 1,
-0.7794055, 0.9657123, -0.7773505, 0, 0, 0, 1, 1,
-0.7762507, -0.3971371, -2.437557, 1, 1, 1, 1, 1,
-0.7733663, -2.757056, -2.542375, 1, 1, 1, 1, 1,
-0.7715992, -0.5400063, -1.010928, 1, 1, 1, 1, 1,
-0.7671729, -0.545918, -1.331933, 1, 1, 1, 1, 1,
-0.7661087, -0.05601528, -1.984179, 1, 1, 1, 1, 1,
-0.7569237, -0.2943175, -0.7236513, 1, 1, 1, 1, 1,
-0.7541528, -0.7560105, -1.894258, 1, 1, 1, 1, 1,
-0.7427917, -2.035135, -2.993407, 1, 1, 1, 1, 1,
-0.7422585, 0.6215609, -1.351986, 1, 1, 1, 1, 1,
-0.7400342, -1.111138, -1.083449, 1, 1, 1, 1, 1,
-0.7372258, 0.4818346, -0.6653174, 1, 1, 1, 1, 1,
-0.7231624, -1.832579, -1.779265, 1, 1, 1, 1, 1,
-0.7212361, -0.4720236, -2.968418, 1, 1, 1, 1, 1,
-0.7115077, -1.063486, -3.97399, 1, 1, 1, 1, 1,
-0.7110986, 0.4319307, -0.7946297, 1, 1, 1, 1, 1,
-0.7100673, -0.007193452, -2.619293, 0, 0, 1, 1, 1,
-0.7063268, -0.4967721, -2.716843, 1, 0, 0, 1, 1,
-0.704405, 1.003726, -0.1257439, 1, 0, 0, 1, 1,
-0.7026722, 0.4551733, -0.5152224, 1, 0, 0, 1, 1,
-0.6998503, -1.917465, -2.634602, 1, 0, 0, 1, 1,
-0.6967544, -0.8778402, -2.145394, 1, 0, 0, 1, 1,
-0.6948504, 1.258952, 0.1017474, 0, 0, 0, 1, 1,
-0.694759, -1.228721, -2.25859, 0, 0, 0, 1, 1,
-0.6938797, -0.8327704, -1.056312, 0, 0, 0, 1, 1,
-0.6931276, 1.119425, -2.492724, 0, 0, 0, 1, 1,
-0.6915895, -2.015144, -2.091539, 0, 0, 0, 1, 1,
-0.6890258, -2.532553, -3.431511, 0, 0, 0, 1, 1,
-0.6827424, -0.4855835, -4.141761, 0, 0, 0, 1, 1,
-0.6822967, -2.596008, -2.354148, 1, 1, 1, 1, 1,
-0.6802793, 0.008852173, -1.338229, 1, 1, 1, 1, 1,
-0.6778139, -0.5450554, -0.4307803, 1, 1, 1, 1, 1,
-0.6765656, -0.6868904, -0.4646388, 1, 1, 1, 1, 1,
-0.676551, -1.270994, -3.590158, 1, 1, 1, 1, 1,
-0.675885, -0.141552, -1.916106, 1, 1, 1, 1, 1,
-0.6675209, 0.4600194, -0.5684533, 1, 1, 1, 1, 1,
-0.6645878, 0.9778057, -0.2255338, 1, 1, 1, 1, 1,
-0.6600836, 1.967336, 0.2938936, 1, 1, 1, 1, 1,
-0.6538587, 0.08664005, 0.4662527, 1, 1, 1, 1, 1,
-0.6464824, -0.3274739, -2.599934, 1, 1, 1, 1, 1,
-0.6387075, -1.18882, -0.5798203, 1, 1, 1, 1, 1,
-0.6377079, 0.6836246, 0.317984, 1, 1, 1, 1, 1,
-0.6357826, -1.317388, -4.275311, 1, 1, 1, 1, 1,
-0.6290529, 0.07905951, -0.9397957, 1, 1, 1, 1, 1,
-0.628011, 0.4798557, -1.336009, 0, 0, 1, 1, 1,
-0.6174197, 0.4755923, 0.80637, 1, 0, 0, 1, 1,
-0.6173747, -0.2277299, -0.7747163, 1, 0, 0, 1, 1,
-0.6155321, -0.526931, -3.727779, 1, 0, 0, 1, 1,
-0.6117843, -0.5629207, -1.802445, 1, 0, 0, 1, 1,
-0.6109028, 0.075739, -1.892934, 1, 0, 0, 1, 1,
-0.6049672, 0.8801105, -1.590438, 0, 0, 0, 1, 1,
-0.6020344, 0.462234, -0.5017995, 0, 0, 0, 1, 1,
-0.6019764, 2.512717, 1.007575, 0, 0, 0, 1, 1,
-0.6017333, -1.046556, -2.578381, 0, 0, 0, 1, 1,
-0.5971717, -0.1967764, -2.854842, 0, 0, 0, 1, 1,
-0.5937195, 0.5431923, -1.536931, 0, 0, 0, 1, 1,
-0.5916451, -0.7422357, -3.6206, 0, 0, 0, 1, 1,
-0.5909798, 0.3352687, 0.2732325, 1, 1, 1, 1, 1,
-0.5891505, -0.5312626, -2.690128, 1, 1, 1, 1, 1,
-0.5839875, 1.454034, -0.8908079, 1, 1, 1, 1, 1,
-0.58283, 0.7644215, 1.150309, 1, 1, 1, 1, 1,
-0.5803916, 0.3784027, -0.0769062, 1, 1, 1, 1, 1,
-0.5800781, -0.7378991, -3.621162, 1, 1, 1, 1, 1,
-0.5774006, 1.068646, -1.727548, 1, 1, 1, 1, 1,
-0.5772118, 0.7179201, -1.169184, 1, 1, 1, 1, 1,
-0.5744501, -1.616823, -2.467066, 1, 1, 1, 1, 1,
-0.5730529, 0.479432, -2.114997, 1, 1, 1, 1, 1,
-0.5719694, 0.9330529, -2.079386, 1, 1, 1, 1, 1,
-0.5689614, 0.6169159, -1.282985, 1, 1, 1, 1, 1,
-0.5670564, 1.764198, 1.006536, 1, 1, 1, 1, 1,
-0.565809, 1.611662, -0.7373303, 1, 1, 1, 1, 1,
-0.563346, 0.7178059, 0.7786983, 1, 1, 1, 1, 1,
-0.5630685, 2.126133, 0.9593377, 0, 0, 1, 1, 1,
-0.560913, 0.4606453, -0.3589729, 1, 0, 0, 1, 1,
-0.5599496, 0.8950788, 1.039868, 1, 0, 0, 1, 1,
-0.5564086, 1.543383, 0.2916729, 1, 0, 0, 1, 1,
-0.555004, 0.7293119, 0.1147169, 1, 0, 0, 1, 1,
-0.5533136, 0.5475566, -1.089069, 1, 0, 0, 1, 1,
-0.5503083, -0.5781067, -1.268891, 0, 0, 0, 1, 1,
-0.5502307, -0.6548728, -1.092791, 0, 0, 0, 1, 1,
-0.5467131, 1.817306, 0.2469783, 0, 0, 0, 1, 1,
-0.5454912, 0.6039703, -1.945036, 0, 0, 0, 1, 1,
-0.5439288, 0.7946377, -0.8180092, 0, 0, 0, 1, 1,
-0.5436201, 0.7172066, -0.2854063, 0, 0, 0, 1, 1,
-0.5405555, -0.5701513, -1.71627, 0, 0, 0, 1, 1,
-0.539511, 0.01933067, -1.673649, 1, 1, 1, 1, 1,
-0.5391337, -0.4901713, -1.595349, 1, 1, 1, 1, 1,
-0.5337949, -1.363237, -4.145146, 1, 1, 1, 1, 1,
-0.5336161, 0.3122363, -1.179994, 1, 1, 1, 1, 1,
-0.5329645, -0.4011273, -2.711558, 1, 1, 1, 1, 1,
-0.5306818, 1.277067, 0.4260827, 1, 1, 1, 1, 1,
-0.5281304, 0.9229179, -1.5109, 1, 1, 1, 1, 1,
-0.5269726, 1.154617, -0.7434689, 1, 1, 1, 1, 1,
-0.5250992, -1.007211, -2.114398, 1, 1, 1, 1, 1,
-0.5223233, 1.314429, 0.99888, 1, 1, 1, 1, 1,
-0.5183904, 0.1903652, -0.3806858, 1, 1, 1, 1, 1,
-0.5179626, 0.2009983, -1.583446, 1, 1, 1, 1, 1,
-0.5178483, 0.7977366, 0.361753, 1, 1, 1, 1, 1,
-0.5172492, 1.651923, 0.7565315, 1, 1, 1, 1, 1,
-0.5154209, 1.610409, -0.2052683, 1, 1, 1, 1, 1,
-0.5121187, 1.71284, 1.177025, 0, 0, 1, 1, 1,
-0.5080387, -0.3773661, -3.450311, 1, 0, 0, 1, 1,
-0.5075307, 0.408825, -1.107198, 1, 0, 0, 1, 1,
-0.5074912, 0.1853064, -1.231854, 1, 0, 0, 1, 1,
-0.5067675, 2.436965, 0.9836639, 1, 0, 0, 1, 1,
-0.5054399, -2.011267, -3.333108, 1, 0, 0, 1, 1,
-0.5052723, -0.05515394, -0.4509409, 0, 0, 0, 1, 1,
-0.5049835, -0.8668435, -2.416441, 0, 0, 0, 1, 1,
-0.4934044, -0.6872691, -1.806435, 0, 0, 0, 1, 1,
-0.4924865, 0.025731, -0.6584162, 0, 0, 0, 1, 1,
-0.4857669, -1.026786, -1.728381, 0, 0, 0, 1, 1,
-0.4853025, -0.2118279, -1.646686, 0, 0, 0, 1, 1,
-0.4736832, 0.0326844, -2.234557, 0, 0, 0, 1, 1,
-0.4735239, -0.7825439, -2.426915, 1, 1, 1, 1, 1,
-0.4734656, 0.3143989, -0.9276126, 1, 1, 1, 1, 1,
-0.4726588, -1.42466, -2.109394, 1, 1, 1, 1, 1,
-0.4697857, 0.1722445, -1.505751, 1, 1, 1, 1, 1,
-0.4629955, 1.380501, -1.42262, 1, 1, 1, 1, 1,
-0.4592335, -0.6165686, -3.264691, 1, 1, 1, 1, 1,
-0.4585254, -0.9722331, -1.503096, 1, 1, 1, 1, 1,
-0.4581411, -1.044237, -3.735678, 1, 1, 1, 1, 1,
-0.4526664, 0.1025617, -2.170523, 1, 1, 1, 1, 1,
-0.4521306, -2.434335, -4.379377, 1, 1, 1, 1, 1,
-0.4510172, 1.638256, -0.2107021, 1, 1, 1, 1, 1,
-0.4375, 0.7870236, -1.438298, 1, 1, 1, 1, 1,
-0.4331514, -0.7848017, -2.131711, 1, 1, 1, 1, 1,
-0.4303845, -0.4155126, 0.1020655, 1, 1, 1, 1, 1,
-0.4257499, -0.7933093, -3.020206, 1, 1, 1, 1, 1,
-0.425028, -0.9175025, -2.642437, 0, 0, 1, 1, 1,
-0.4229243, -0.0982053, -2.544954, 1, 0, 0, 1, 1,
-0.4168014, 0.45152, -0.7698792, 1, 0, 0, 1, 1,
-0.4159689, 0.8678923, -0.05837438, 1, 0, 0, 1, 1,
-0.4157346, -0.2854339, -3.352356, 1, 0, 0, 1, 1,
-0.4140003, -0.9790975, -3.808178, 1, 0, 0, 1, 1,
-0.4131752, 1.22642, -0.1325923, 0, 0, 0, 1, 1,
-0.4094257, 0.3864728, 0.6968712, 0, 0, 0, 1, 1,
-0.4081129, -0.7512123, -4.488691, 0, 0, 0, 1, 1,
-0.4080919, -0.4082657, -1.955981, 0, 0, 0, 1, 1,
-0.4012372, 0.2648903, 0.292064, 0, 0, 0, 1, 1,
-0.398651, 1.276453, 0.1872603, 0, 0, 0, 1, 1,
-0.3899131, -0.009593833, -0.05845639, 0, 0, 0, 1, 1,
-0.3881095, -0.03135598, -1.477365, 1, 1, 1, 1, 1,
-0.384378, -0.02316977, -1.659394, 1, 1, 1, 1, 1,
-0.3843544, 0.8178936, 1.599204, 1, 1, 1, 1, 1,
-0.383598, -0.482363, -2.91589, 1, 1, 1, 1, 1,
-0.378537, -0.7180442, -2.990186, 1, 1, 1, 1, 1,
-0.3766317, -1.061501, -1.782046, 1, 1, 1, 1, 1,
-0.3762684, -0.3153568, -1.191281, 1, 1, 1, 1, 1,
-0.3752127, 0.9521756, 0.04858843, 1, 1, 1, 1, 1,
-0.3747049, 0.8814462, 0.7421026, 1, 1, 1, 1, 1,
-0.3714847, -1.110488, -2.991222, 1, 1, 1, 1, 1,
-0.3713119, 1.456088, -0.5870101, 1, 1, 1, 1, 1,
-0.3711114, 0.0242536, -1.014517, 1, 1, 1, 1, 1,
-0.3701819, 1.509885, -0.2334968, 1, 1, 1, 1, 1,
-0.3680186, 0.03431294, -1.043055, 1, 1, 1, 1, 1,
-0.3606472, -0.5666476, -4.202146, 1, 1, 1, 1, 1,
-0.3508434, 0.1364188, -2.110794, 0, 0, 1, 1, 1,
-0.350803, -1.396727, -3.432817, 1, 0, 0, 1, 1,
-0.3503288, 0.3510115, -0.3763514, 1, 0, 0, 1, 1,
-0.3501617, 1.439386, 0.9819414, 1, 0, 0, 1, 1,
-0.3480341, 0.04647072, -0.6291246, 1, 0, 0, 1, 1,
-0.3440974, -0.7466785, -4.247992, 1, 0, 0, 1, 1,
-0.3439689, 0.2435109, -0.962662, 0, 0, 0, 1, 1,
-0.3433052, 1.170986, -0.1356652, 0, 0, 0, 1, 1,
-0.3390879, 0.5997737, -0.5642967, 0, 0, 0, 1, 1,
-0.3376477, 1.530229, -0.1180451, 0, 0, 0, 1, 1,
-0.3366446, 1.965571, -1.305977, 0, 0, 0, 1, 1,
-0.3336652, 0.2909886, -1.019153, 0, 0, 0, 1, 1,
-0.3309888, 1.035326, -0.5316747, 0, 0, 0, 1, 1,
-0.3293695, 0.7112272, 0.02996796, 1, 1, 1, 1, 1,
-0.3288709, 0.007486853, -3.293888, 1, 1, 1, 1, 1,
-0.3239136, -0.7230399, -2.672811, 1, 1, 1, 1, 1,
-0.3080772, -0.01984055, -1.356083, 1, 1, 1, 1, 1,
-0.3073688, -1.126427, -3.445383, 1, 1, 1, 1, 1,
-0.3073145, 0.1958017, -0.7600067, 1, 1, 1, 1, 1,
-0.3029225, 0.102461, -1.510829, 1, 1, 1, 1, 1,
-0.3023153, 0.5804899, -0.07061455, 1, 1, 1, 1, 1,
-0.2975404, -0.1516995, -2.051561, 1, 1, 1, 1, 1,
-0.2877441, 0.1338368, 0.08183459, 1, 1, 1, 1, 1,
-0.2857662, 0.3942009, -2.090993, 1, 1, 1, 1, 1,
-0.2845908, 0.3401718, -0.2805927, 1, 1, 1, 1, 1,
-0.2840543, -0.6080853, -2.556735, 1, 1, 1, 1, 1,
-0.2818634, 0.7369386, -1.109936, 1, 1, 1, 1, 1,
-0.27807, 2.11729, -1.056151, 1, 1, 1, 1, 1,
-0.2773343, -1.151134, -2.801697, 0, 0, 1, 1, 1,
-0.2705642, 1.827627, 0.7280273, 1, 0, 0, 1, 1,
-0.2640303, -0.5838035, -0.9441749, 1, 0, 0, 1, 1,
-0.2620092, 0.5811108, -2.062163, 1, 0, 0, 1, 1,
-0.2601256, -0.4083584, -2.02644, 1, 0, 0, 1, 1,
-0.2566147, 0.6283675, -1.752123, 1, 0, 0, 1, 1,
-0.2543761, -0.8448319, -3.150435, 0, 0, 0, 1, 1,
-0.2524359, -0.7067766, -1.667813, 0, 0, 0, 1, 1,
-0.2482138, -1.012066, -3.353344, 0, 0, 0, 1, 1,
-0.2476434, -1.716342, -2.477197, 0, 0, 0, 1, 1,
-0.2468832, -0.04471151, -2.112501, 0, 0, 0, 1, 1,
-0.2411247, 0.9312137, -0.2941772, 0, 0, 0, 1, 1,
-0.2403141, 1.268425, -1.41934, 0, 0, 0, 1, 1,
-0.2331706, -0.001777, -1.121738, 1, 1, 1, 1, 1,
-0.2289834, -0.6940091, -2.514558, 1, 1, 1, 1, 1,
-0.2202369, -0.2528765, -3.035695, 1, 1, 1, 1, 1,
-0.2198433, -0.3991971, -3.625081, 1, 1, 1, 1, 1,
-0.2173599, -1.832097, -1.772908, 1, 1, 1, 1, 1,
-0.2167437, -1.150509, -2.331211, 1, 1, 1, 1, 1,
-0.2155915, -0.1537964, -0.2924283, 1, 1, 1, 1, 1,
-0.2155668, -1.098172, -4.479939, 1, 1, 1, 1, 1,
-0.2096843, 0.4136544, -0.4128531, 1, 1, 1, 1, 1,
-0.2057095, -0.2708378, -3.117151, 1, 1, 1, 1, 1,
-0.2028796, -1.26572, -2.91942, 1, 1, 1, 1, 1,
-0.1933902, 0.609699, -0.6198363, 1, 1, 1, 1, 1,
-0.1918082, 0.1472217, -0.002129612, 1, 1, 1, 1, 1,
-0.1901331, -1.347425, -3.124918, 1, 1, 1, 1, 1,
-0.1884872, 0.01639368, -0.9798099, 1, 1, 1, 1, 1,
-0.1864281, -2.723169, -3.917811, 0, 0, 1, 1, 1,
-0.1822766, -0.4432397, -2.520082, 1, 0, 0, 1, 1,
-0.1802025, -0.1062431, -4.745571, 1, 0, 0, 1, 1,
-0.1754437, 1.377288, -1.322984, 1, 0, 0, 1, 1,
-0.1747254, 2.490933, -0.1830363, 1, 0, 0, 1, 1,
-0.1719293, 0.4954979, 2.004204, 1, 0, 0, 1, 1,
-0.1702283, 2.181605, -0.786833, 0, 0, 0, 1, 1,
-0.1674758, 1.32526, -0.8184512, 0, 0, 0, 1, 1,
-0.1634828, 0.1839243, -0.01224162, 0, 0, 0, 1, 1,
-0.160152, -0.06406179, -1.9516, 0, 0, 0, 1, 1,
-0.1586947, 1.119162, -0.03089459, 0, 0, 0, 1, 1,
-0.1561386, -1.224956, -3.662081, 0, 0, 0, 1, 1,
-0.148129, 0.628538, 0.5821663, 0, 0, 0, 1, 1,
-0.1472421, 1.074665, -0.406734, 1, 1, 1, 1, 1,
-0.1434752, 0.213859, 1.359815, 1, 1, 1, 1, 1,
-0.1433252, -0.7434171, -2.476973, 1, 1, 1, 1, 1,
-0.1413853, 0.4638889, -0.2841785, 1, 1, 1, 1, 1,
-0.1407855, -0.1311105, -2.655012, 1, 1, 1, 1, 1,
-0.1404114, -0.6814553, -4.091858, 1, 1, 1, 1, 1,
-0.1335432, -0.01355265, -2.486713, 1, 1, 1, 1, 1,
-0.1331217, -1.0003, -4.984304, 1, 1, 1, 1, 1,
-0.1327939, -0.5113207, -3.070499, 1, 1, 1, 1, 1,
-0.1327031, -0.08606755, -1.886228, 1, 1, 1, 1, 1,
-0.1320309, -0.06559488, -1.082958, 1, 1, 1, 1, 1,
-0.1299889, -0.2495215, -2.88227, 1, 1, 1, 1, 1,
-0.1298272, 0.1024522, -1.557636, 1, 1, 1, 1, 1,
-0.1291732, -1.151734, -4.466881, 1, 1, 1, 1, 1,
-0.1279956, 0.1371549, -1.110371, 1, 1, 1, 1, 1,
-0.1256841, 0.1249432, -1.601719, 0, 0, 1, 1, 1,
-0.1232679, -1.619415, -2.491001, 1, 0, 0, 1, 1,
-0.1229055, 0.2241863, 1.414785, 1, 0, 0, 1, 1,
-0.1224134, -0.3081509, -0.7187169, 1, 0, 0, 1, 1,
-0.1202317, 0.1276907, 0.1928086, 1, 0, 0, 1, 1,
-0.1159494, -0.5797908, -2.263281, 1, 0, 0, 1, 1,
-0.1148197, 0.8456633, 2.008368, 0, 0, 0, 1, 1,
-0.112413, 0.8445027, 1.057931, 0, 0, 0, 1, 1,
-0.112284, -1.697803, -3.833118, 0, 0, 0, 1, 1,
-0.1089138, -1.246243, -2.237953, 0, 0, 0, 1, 1,
-0.1065939, 1.985446, 0.7410355, 0, 0, 0, 1, 1,
-0.1053342, -0.6797885, -3.131519, 0, 0, 0, 1, 1,
-0.1029117, 1.134624, 0.8235731, 0, 0, 0, 1, 1,
-0.1014965, -0.8875334, -2.103703, 1, 1, 1, 1, 1,
-0.09716977, -0.4499814, -3.91958, 1, 1, 1, 1, 1,
-0.09622402, 0.1128953, 0.8269836, 1, 1, 1, 1, 1,
-0.08884166, -0.7420928, -2.45778, 1, 1, 1, 1, 1,
-0.08837084, -0.8779548, -2.65483, 1, 1, 1, 1, 1,
-0.08696416, -2.20869, -2.344102, 1, 1, 1, 1, 1,
-0.08579478, 0.3359163, 0.0686838, 1, 1, 1, 1, 1,
-0.08296843, 0.3495136, -0.1982288, 1, 1, 1, 1, 1,
-0.0793546, 0.2349504, -1.566584, 1, 1, 1, 1, 1,
-0.0777391, 0.9128216, -1.243079, 1, 1, 1, 1, 1,
-0.07436933, 0.8905497, -0.02673357, 1, 1, 1, 1, 1,
-0.0739159, 0.2075656, 1.311103, 1, 1, 1, 1, 1,
-0.07253153, -0.5337465, -2.730897, 1, 1, 1, 1, 1,
-0.06911244, -0.8458278, -4.660918, 1, 1, 1, 1, 1,
-0.06169683, -0.1107116, -1.680137, 1, 1, 1, 1, 1,
-0.05811981, -2.096559, -2.516923, 0, 0, 1, 1, 1,
-0.05550499, -0.5815546, -2.71637, 1, 0, 0, 1, 1,
-0.05277706, -1.448865, -4.896598, 1, 0, 0, 1, 1,
-0.04945955, 0.1318627, 0.1518357, 1, 0, 0, 1, 1,
-0.04610591, -0.7064633, -3.506826, 1, 0, 0, 1, 1,
-0.04568802, 0.4003673, -0.1378243, 1, 0, 0, 1, 1,
-0.04420564, -0.3776673, -2.927757, 0, 0, 0, 1, 1,
-0.04212166, -0.435993, -3.137271, 0, 0, 0, 1, 1,
-0.04003702, -0.6577397, -2.698847, 0, 0, 0, 1, 1,
-0.03950495, -0.8422812, -4.830872, 0, 0, 0, 1, 1,
-0.03748216, -0.6796719, -2.563848, 0, 0, 0, 1, 1,
-0.03079873, 0.01843554, -3.257058, 0, 0, 0, 1, 1,
-0.02981295, -0.8181092, -4.025869, 0, 0, 0, 1, 1,
-0.02729203, -0.3673499, -3.290595, 1, 1, 1, 1, 1,
-0.02608669, -0.7738017, -3.523048, 1, 1, 1, 1, 1,
-0.02581098, -0.02558304, -4.770828, 1, 1, 1, 1, 1,
-0.02368548, 0.7067665, 0.3808569, 1, 1, 1, 1, 1,
-0.02189054, -1.510792, -3.890398, 1, 1, 1, 1, 1,
-0.02074336, -0.1012028, -3.008468, 1, 1, 1, 1, 1,
-0.01979221, 1.100685, -1.582428, 1, 1, 1, 1, 1,
-0.0197768, 2.694564, -1.455903, 1, 1, 1, 1, 1,
-0.01927155, -1.770402, -3.01208, 1, 1, 1, 1, 1,
-0.01435888, 1.124166, -0.3575156, 1, 1, 1, 1, 1,
-0.01358686, 1.835996, 0.6642091, 1, 1, 1, 1, 1,
-0.01106184, -0.1812836, -3.484007, 1, 1, 1, 1, 1,
-0.01046302, 0.135893, 0.6487072, 1, 1, 1, 1, 1,
-0.009116305, 1.617484, 1.563539, 1, 1, 1, 1, 1,
-0.00878178, -0.2889073, -3.557204, 1, 1, 1, 1, 1,
-0.008751531, 1.191713, 1.538285, 0, 0, 1, 1, 1,
-0.008089624, -0.01467481, -1.892659, 1, 0, 0, 1, 1,
-0.004061659, 1.284623, -1.484656, 1, 0, 0, 1, 1,
-0.002971842, 0.7555673, 0.09271671, 1, 0, 0, 1, 1,
-0.001823424, -0.6984109, -3.960242, 1, 0, 0, 1, 1,
-0.001363361, 0.8027651, -1.906078, 1, 0, 0, 1, 1,
0.0008967777, -0.4026325, 4.399041, 0, 0, 0, 1, 1,
0.003141799, -0.4368835, 3.478021, 0, 0, 0, 1, 1,
0.007388392, 1.591967, 1.362116, 0, 0, 0, 1, 1,
0.01054993, 0.4906126, 0.9945323, 0, 0, 0, 1, 1,
0.01277632, -1.11399, 4.672361, 0, 0, 0, 1, 1,
0.01801451, -0.0159222, 2.818808, 0, 0, 0, 1, 1,
0.02129667, 1.095627, -1.186716, 0, 0, 0, 1, 1,
0.02408341, -0.06386366, 3.872665, 1, 1, 1, 1, 1,
0.02643362, -0.146966, 3.694969, 1, 1, 1, 1, 1,
0.0276821, 0.1241929, 0.7205287, 1, 1, 1, 1, 1,
0.03202568, -0.3017899, 2.87903, 1, 1, 1, 1, 1,
0.03297345, -0.5526024, 3.710923, 1, 1, 1, 1, 1,
0.03509999, -1.86398, 5.089562, 1, 1, 1, 1, 1,
0.03791703, -0.7772866, 2.666285, 1, 1, 1, 1, 1,
0.03955488, -0.7760848, 4.706946, 1, 1, 1, 1, 1,
0.04253288, 0.9830945, 2.054346, 1, 1, 1, 1, 1,
0.04498181, 0.787555, 1.275044, 1, 1, 1, 1, 1,
0.04702707, -0.4596727, 2.979118, 1, 1, 1, 1, 1,
0.05211177, 0.865486, -0.7292117, 1, 1, 1, 1, 1,
0.05523561, 0.8534763, -0.3093129, 1, 1, 1, 1, 1,
0.05533204, 0.6279547, -0.7148561, 1, 1, 1, 1, 1,
0.05588154, 0.1524487, 0.6367516, 1, 1, 1, 1, 1,
0.06124122, 0.8662409, -0.5680412, 0, 0, 1, 1, 1,
0.07272936, 1.634846, 0.9350488, 1, 0, 0, 1, 1,
0.07340831, -0.6529642, 5.124635, 1, 0, 0, 1, 1,
0.07841656, 1.031044, -0.4385222, 1, 0, 0, 1, 1,
0.08049214, -0.6853946, 2.768787, 1, 0, 0, 1, 1,
0.08067828, -1.24089, 3.815906, 1, 0, 0, 1, 1,
0.08159027, -0.2998298, 0.831385, 0, 0, 0, 1, 1,
0.08217981, -0.764352, 3.119352, 0, 0, 0, 1, 1,
0.08316473, -1.405092, 3.541369, 0, 0, 0, 1, 1,
0.08976892, 0.5833706, -0.6353414, 0, 0, 0, 1, 1,
0.09282984, 0.8781158, 0.5638099, 0, 0, 0, 1, 1,
0.09524355, 0.01022582, 1.749647, 0, 0, 0, 1, 1,
0.09921888, -0.7948448, 2.309086, 0, 0, 0, 1, 1,
0.1003351, -1.27203, 3.360614, 1, 1, 1, 1, 1,
0.1042135, -0.4934889, 1.887656, 1, 1, 1, 1, 1,
0.1045976, -0.6987427, 2.728719, 1, 1, 1, 1, 1,
0.1065773, 0.3837942, 0.4082975, 1, 1, 1, 1, 1,
0.1069166, -1.19417, 3.154957, 1, 1, 1, 1, 1,
0.109896, -0.7959527, 3.310008, 1, 1, 1, 1, 1,
0.1117438, 1.236639, -1.072556, 1, 1, 1, 1, 1,
0.1128171, 0.646468, 2.076451, 1, 1, 1, 1, 1,
0.1137649, 0.9058469, -0.003209972, 1, 1, 1, 1, 1,
0.1147784, 1.253947, -0.2954663, 1, 1, 1, 1, 1,
0.1149286, -0.9897604, 4.785756, 1, 1, 1, 1, 1,
0.1159903, -2.38616, 2.367141, 1, 1, 1, 1, 1,
0.1168112, 0.2778694, -1.0086, 1, 1, 1, 1, 1,
0.1168863, 0.09064105, 0.2385091, 1, 1, 1, 1, 1,
0.1195652, 0.1927429, 0.588013, 1, 1, 1, 1, 1,
0.1212576, -0.02861343, 2.422221, 0, 0, 1, 1, 1,
0.1214279, -0.6586797, 2.331395, 1, 0, 0, 1, 1,
0.1234351, -1.187907, 2.743748, 1, 0, 0, 1, 1,
0.123675, 0.467183, 0.689813, 1, 0, 0, 1, 1,
0.1268208, 0.6729872, 0.1491832, 1, 0, 0, 1, 1,
0.1272641, -0.4038461, 2.931965, 1, 0, 0, 1, 1,
0.1282542, 0.3899313, 0.874065, 0, 0, 0, 1, 1,
0.1338033, 0.5084367, 2.095662, 0, 0, 0, 1, 1,
0.1426225, -1.472782, 3.255629, 0, 0, 0, 1, 1,
0.1443855, -0.0237169, 1.574446, 0, 0, 0, 1, 1,
0.1469595, -0.4399074, 2.848099, 0, 0, 0, 1, 1,
0.1500215, 0.6605802, 0.04820232, 0, 0, 0, 1, 1,
0.1507708, -1.162219, 2.870056, 0, 0, 0, 1, 1,
0.1508768, 0.2107692, 0.6076329, 1, 1, 1, 1, 1,
0.1527078, 1.070514, -0.7582514, 1, 1, 1, 1, 1,
0.1538366, -1.001773, 3.566413, 1, 1, 1, 1, 1,
0.1567533, -0.8526105, 1.353236, 1, 1, 1, 1, 1,
0.1581148, 0.2938778, 0.1957686, 1, 1, 1, 1, 1,
0.1593438, 0.389624, 0.358817, 1, 1, 1, 1, 1,
0.1684716, -1.253536, 4.070328, 1, 1, 1, 1, 1,
0.1691534, -1.373453, 2.863673, 1, 1, 1, 1, 1,
0.174487, -1.31535, 2.577625, 1, 1, 1, 1, 1,
0.1766896, -0.7816556, 3.535194, 1, 1, 1, 1, 1,
0.1799734, -1.48969, 3.303523, 1, 1, 1, 1, 1,
0.1913812, -0.01997843, 0.7307864, 1, 1, 1, 1, 1,
0.1948189, 0.463866, -0.06417251, 1, 1, 1, 1, 1,
0.1991046, -0.7525361, 3.350492, 1, 1, 1, 1, 1,
0.2018717, 1.81145, -0.5026626, 1, 1, 1, 1, 1,
0.2074381, 0.3469711, 0.5515319, 0, 0, 1, 1, 1,
0.2096151, 1.115722, 0.4317635, 1, 0, 0, 1, 1,
0.2125863, 0.6747099, -1.036406, 1, 0, 0, 1, 1,
0.2144823, 1.584149, 0.3830969, 1, 0, 0, 1, 1,
0.2149039, -0.4266553, 3.813144, 1, 0, 0, 1, 1,
0.2181203, -2.091389, 3.325579, 1, 0, 0, 1, 1,
0.2201545, 0.412393, 0.7318435, 0, 0, 0, 1, 1,
0.2276499, 2.01528, 3.287652, 0, 0, 0, 1, 1,
0.2329122, -1.482242, 3.593457, 0, 0, 0, 1, 1,
0.2387865, -0.9947273, 3.577163, 0, 0, 0, 1, 1,
0.2390584, 0.8950213, 1.535139, 0, 0, 0, 1, 1,
0.2437503, -0.4150757, 3.861444, 0, 0, 0, 1, 1,
0.2439492, -2.58969, 1.311339, 0, 0, 0, 1, 1,
0.2457357, -1.253397, 3.420175, 1, 1, 1, 1, 1,
0.2549431, 0.08512551, 1.576214, 1, 1, 1, 1, 1,
0.2569661, 0.4219504, 1.143194, 1, 1, 1, 1, 1,
0.2570548, 0.2014428, 0.9324298, 1, 1, 1, 1, 1,
0.2620804, -0.7937933, 0.8534963, 1, 1, 1, 1, 1,
0.2624581, 0.4457764, -1.224075, 1, 1, 1, 1, 1,
0.2626929, -0.3139041, 2.765631, 1, 1, 1, 1, 1,
0.2645039, 0.4523224, -1.18823, 1, 1, 1, 1, 1,
0.2702801, -0.8270987, 3.771694, 1, 1, 1, 1, 1,
0.2722519, -0.557021, 1.75303, 1, 1, 1, 1, 1,
0.2726272, 0.7581784, -0.547721, 1, 1, 1, 1, 1,
0.272658, -1.107938, 1.831822, 1, 1, 1, 1, 1,
0.2735126, -0.5591744, 0.7537761, 1, 1, 1, 1, 1,
0.2759862, -0.216599, 1.837671, 1, 1, 1, 1, 1,
0.2770448, 1.163453, 0.2655285, 1, 1, 1, 1, 1,
0.2779396, 0.246551, 0.9632629, 0, 0, 1, 1, 1,
0.2781275, 0.3391237, 2.341464, 1, 0, 0, 1, 1,
0.2804602, -0.9036325, 3.821712, 1, 0, 0, 1, 1,
0.2813487, 2.356607, 0.4367436, 1, 0, 0, 1, 1,
0.2814949, -0.5815006, 2.908284, 1, 0, 0, 1, 1,
0.2832915, 0.1184557, 0.02670419, 1, 0, 0, 1, 1,
0.2839111, 0.202191, 0.3724161, 0, 0, 0, 1, 1,
0.2841202, 0.0101604, 0.6497406, 0, 0, 0, 1, 1,
0.2852965, 0.3518919, 1.878706, 0, 0, 0, 1, 1,
0.2871522, 0.5462242, 2.278331, 0, 0, 0, 1, 1,
0.2914891, -0.01225703, 1.130625, 0, 0, 0, 1, 1,
0.2921223, -2.002489, 3.04498, 0, 0, 0, 1, 1,
0.3009575, -1.163692, 3.408942, 0, 0, 0, 1, 1,
0.3028755, 1.328033, 1.326609, 1, 1, 1, 1, 1,
0.3061685, -0.8201938, 4.05471, 1, 1, 1, 1, 1,
0.309888, 0.7879704, 0.9908361, 1, 1, 1, 1, 1,
0.3103213, 0.5484257, -0.5357739, 1, 1, 1, 1, 1,
0.3103428, -0.4990795, 2.045999, 1, 1, 1, 1, 1,
0.3105111, -0.6510792, 3.724401, 1, 1, 1, 1, 1,
0.3139946, -1.291149, 2.451347, 1, 1, 1, 1, 1,
0.3183499, 0.5086715, -0.9551487, 1, 1, 1, 1, 1,
0.3196047, -1.237099, 3.924434, 1, 1, 1, 1, 1,
0.3217298, -0.6332743, 1.296916, 1, 1, 1, 1, 1,
0.3218562, -0.8605629, 5.128802, 1, 1, 1, 1, 1,
0.3261677, 1.450178, 0.6825799, 1, 1, 1, 1, 1,
0.3344259, 1.863589, 0.7776161, 1, 1, 1, 1, 1,
0.3360428, -0.3396287, 1.769931, 1, 1, 1, 1, 1,
0.3400885, 1.355737, -0.6023729, 1, 1, 1, 1, 1,
0.3438759, 2.962898, 0.2499816, 0, 0, 1, 1, 1,
0.3440655, 0.8488806, -1.401749, 1, 0, 0, 1, 1,
0.3449671, -0.1729116, 2.253626, 1, 0, 0, 1, 1,
0.3538159, 0.5040122, 0.3037516, 1, 0, 0, 1, 1,
0.3558159, -0.002338529, 3.236605, 1, 0, 0, 1, 1,
0.3594979, 0.1403076, 1.878491, 1, 0, 0, 1, 1,
0.3597308, 0.150995, 1.116264, 0, 0, 0, 1, 1,
0.3645339, -0.4472071, 2.975855, 0, 0, 0, 1, 1,
0.3652926, 0.1026269, 1.179648, 0, 0, 0, 1, 1,
0.3708197, 0.190221, 0.5506184, 0, 0, 0, 1, 1,
0.3795052, -1.259867, 2.862067, 0, 0, 0, 1, 1,
0.3809171, -0.2295085, 1.517927, 0, 0, 0, 1, 1,
0.3814237, 0.117272, 0.5422575, 0, 0, 0, 1, 1,
0.381618, 0.63666, 0.1040579, 1, 1, 1, 1, 1,
0.3859724, 0.6115993, 0.7968081, 1, 1, 1, 1, 1,
0.3954933, -0.626294, 2.629577, 1, 1, 1, 1, 1,
0.3968312, -0.560111, 3.379849, 1, 1, 1, 1, 1,
0.4006599, -0.2415764, 1.677172, 1, 1, 1, 1, 1,
0.4008095, -2.152053, 2.974044, 1, 1, 1, 1, 1,
0.4059938, 2.235529, 0.6794949, 1, 1, 1, 1, 1,
0.4075434, 1.823507, -2.238696, 1, 1, 1, 1, 1,
0.4082432, 1.109054, 0.912884, 1, 1, 1, 1, 1,
0.409415, 0.1799762, 0.5536281, 1, 1, 1, 1, 1,
0.4112847, 0.809362, -0.9552711, 1, 1, 1, 1, 1,
0.4133285, 0.2455505, 0.172899, 1, 1, 1, 1, 1,
0.4157051, -0.8922585, 2.795712, 1, 1, 1, 1, 1,
0.4176814, -0.676171, 2.803332, 1, 1, 1, 1, 1,
0.4182836, -1.108257, 2.136586, 1, 1, 1, 1, 1,
0.4212959, 0.6395242, -0.1829219, 0, 0, 1, 1, 1,
0.424331, -0.2473005, 2.16282, 1, 0, 0, 1, 1,
0.425458, 0.2314247, -0.3615911, 1, 0, 0, 1, 1,
0.4262412, 1.989384, 0.05008541, 1, 0, 0, 1, 1,
0.4270431, -0.4803311, 2.018162, 1, 0, 0, 1, 1,
0.4274328, 2.372105, -0.1418426, 1, 0, 0, 1, 1,
0.4283353, 0.09268486, 1.858029, 0, 0, 0, 1, 1,
0.4317721, 1.218002, -0.3506183, 0, 0, 0, 1, 1,
0.4338517, -0.6791136, 1.693999, 0, 0, 0, 1, 1,
0.4342292, -0.2818257, 3.060466, 0, 0, 0, 1, 1,
0.441794, 2.625815, 0.2492188, 0, 0, 0, 1, 1,
0.4430174, 2.57189, -0.5497436, 0, 0, 0, 1, 1,
0.4477482, 0.1914037, 0.7006279, 0, 0, 0, 1, 1,
0.4491405, -2.437084, 3.323374, 1, 1, 1, 1, 1,
0.4497123, -1.07796, 2.263154, 1, 1, 1, 1, 1,
0.4517917, -1.777572, 1.666047, 1, 1, 1, 1, 1,
0.4520419, -1.689829, 1.791804, 1, 1, 1, 1, 1,
0.458418, -0.2164483, 2.24323, 1, 1, 1, 1, 1,
0.4597659, -1.074872, 4.657748, 1, 1, 1, 1, 1,
0.4609581, -0.3817627, 2.646052, 1, 1, 1, 1, 1,
0.4653597, 0.5414662, -0.09665531, 1, 1, 1, 1, 1,
0.4665442, 1.253338, -0.1320687, 1, 1, 1, 1, 1,
0.4735857, -2.369812, 3.005979, 1, 1, 1, 1, 1,
0.4778924, -0.1907029, 3.30316, 1, 1, 1, 1, 1,
0.4798177, 2.080415, 1.28892, 1, 1, 1, 1, 1,
0.4805726, 0.2009387, 0.6471737, 1, 1, 1, 1, 1,
0.4811987, 0.1522775, 0.08699781, 1, 1, 1, 1, 1,
0.4823277, -0.01911075, 1.676856, 1, 1, 1, 1, 1,
0.4887114, -0.616443, 2.323472, 0, 0, 1, 1, 1,
0.4917505, 0.4451252, 0.8445223, 1, 0, 0, 1, 1,
0.5011939, -0.2148427, 2.577234, 1, 0, 0, 1, 1,
0.5028576, 0.2391595, -0.2671992, 1, 0, 0, 1, 1,
0.5088806, 2.219114, 1.236181, 1, 0, 0, 1, 1,
0.5147092, -0.7195383, 3.84505, 1, 0, 0, 1, 1,
0.5162663, 0.3628236, -0.5518118, 0, 0, 0, 1, 1,
0.5162905, 0.812254, -1.946673, 0, 0, 0, 1, 1,
0.517466, 0.202575, 1.053565, 0, 0, 0, 1, 1,
0.5182568, 1.161157, -0.3864734, 0, 0, 0, 1, 1,
0.5191187, 0.7195817, -0.1247398, 0, 0, 0, 1, 1,
0.5202568, 0.2204858, 0.7215421, 0, 0, 0, 1, 1,
0.5215629, 0.514105, 1.255911, 0, 0, 0, 1, 1,
0.5222201, -0.01782478, 0.8996884, 1, 1, 1, 1, 1,
0.5340943, 0.4241615, 1.998099, 1, 1, 1, 1, 1,
0.5385381, 0.1908884, -0.1941031, 1, 1, 1, 1, 1,
0.5390486, -0.1304993, 1.217175, 1, 1, 1, 1, 1,
0.5400653, 1.607077, 1.754787, 1, 1, 1, 1, 1,
0.5434982, 0.3386098, 0.1804683, 1, 1, 1, 1, 1,
0.5451592, -1.159698, 1.294505, 1, 1, 1, 1, 1,
0.5506192, 1.659995, -0.4308804, 1, 1, 1, 1, 1,
0.5508185, -0.1867445, 2.521354, 1, 1, 1, 1, 1,
0.5508737, -0.08385881, -0.1694105, 1, 1, 1, 1, 1,
0.5511234, -0.8708295, 3.194888, 1, 1, 1, 1, 1,
0.5532997, 0.00499959, 2.332414, 1, 1, 1, 1, 1,
0.5618558, -0.150044, 1.869906, 1, 1, 1, 1, 1,
0.5634835, -1.137354, 4.043746, 1, 1, 1, 1, 1,
0.5662261, 0.1713662, 3.26741, 1, 1, 1, 1, 1,
0.5667834, -0.6900381, 3.281348, 0, 0, 1, 1, 1,
0.5695112, 0.3486059, 1.082631, 1, 0, 0, 1, 1,
0.5730894, -0.8453172, 2.544695, 1, 0, 0, 1, 1,
0.5730963, -0.3839023, 0.6354217, 1, 0, 0, 1, 1,
0.5765654, 0.2925142, 0.5291578, 1, 0, 0, 1, 1,
0.5782354, -0.02295296, 0.8150009, 1, 0, 0, 1, 1,
0.5809196, 0.9715639, 0.4161873, 0, 0, 0, 1, 1,
0.5849379, 0.1481576, 0.5016977, 0, 0, 0, 1, 1,
0.592903, -1.425092, 1.808978, 0, 0, 0, 1, 1,
0.5988418, 0.7001994, -0.9632764, 0, 0, 0, 1, 1,
0.5994993, 0.4989502, 0.6966915, 0, 0, 0, 1, 1,
0.6069009, 1.07199, -0.4826859, 0, 0, 0, 1, 1,
0.614852, -0.6924533, 2.069734, 0, 0, 0, 1, 1,
0.6155408, -0.3249764, 2.230929, 1, 1, 1, 1, 1,
0.6162656, 1.260692, -0.6189196, 1, 1, 1, 1, 1,
0.6262948, -0.4368712, 3.383304, 1, 1, 1, 1, 1,
0.6309429, -1.948401, 2.705595, 1, 1, 1, 1, 1,
0.6343747, 2.736944, 0.01667687, 1, 1, 1, 1, 1,
0.6371548, -0.8219703, 4.367603, 1, 1, 1, 1, 1,
0.637262, -1.077862, 2.420409, 1, 1, 1, 1, 1,
0.6381986, -1.464178, 3.360729, 1, 1, 1, 1, 1,
0.6388833, -1.072662, 2.714615, 1, 1, 1, 1, 1,
0.645759, -0.6563359, 3.16605, 1, 1, 1, 1, 1,
0.6512898, 0.5895723, 1.519712, 1, 1, 1, 1, 1,
0.6529483, 0.2175838, 1.577657, 1, 1, 1, 1, 1,
0.6579, 1.83563, -2.827608, 1, 1, 1, 1, 1,
0.6592266, 0.4820113, 0.5881512, 1, 1, 1, 1, 1,
0.6593912, 2.027254, 1.388358, 1, 1, 1, 1, 1,
0.6599341, -0.3359378, 1.445443, 0, 0, 1, 1, 1,
0.6600643, -0.6764166, 1.968975, 1, 0, 0, 1, 1,
0.6639295, 0.8588361, 0.08442052, 1, 0, 0, 1, 1,
0.6654994, 0.02935782, 0.09753905, 1, 0, 0, 1, 1,
0.6741854, 0.6958932, 1.582775, 1, 0, 0, 1, 1,
0.6776063, -0.558807, 2.350027, 1, 0, 0, 1, 1,
0.6824086, 0.1406183, 1.428628, 0, 0, 0, 1, 1,
0.6937516, 0.6898105, 0.46528, 0, 0, 0, 1, 1,
0.6974948, -2.068777, 4.78536, 0, 0, 0, 1, 1,
0.7010844, -1.095707, 3.668557, 0, 0, 0, 1, 1,
0.7020251, -0.2945308, 1.445689, 0, 0, 0, 1, 1,
0.702989, -1.42142, 4.953742, 0, 0, 0, 1, 1,
0.7199098, -1.254444, 3.478637, 0, 0, 0, 1, 1,
0.7236099, 1.356403, -0.1775859, 1, 1, 1, 1, 1,
0.7292328, 1.07124, 0.6777761, 1, 1, 1, 1, 1,
0.7311829, -0.08708273, 0.4189861, 1, 1, 1, 1, 1,
0.7404624, -0.6091312, 2.999689, 1, 1, 1, 1, 1,
0.7412012, -0.7647468, 1.032364, 1, 1, 1, 1, 1,
0.7432692, 0.4617998, -0.2495209, 1, 1, 1, 1, 1,
0.7446662, -1.843158, 3.166617, 1, 1, 1, 1, 1,
0.7461741, 1.060732, -0.39938, 1, 1, 1, 1, 1,
0.7479585, -0.2824115, 3.315726, 1, 1, 1, 1, 1,
0.7634335, -0.5853699, 0.4351776, 1, 1, 1, 1, 1,
0.7666624, 0.7768672, 1.110135, 1, 1, 1, 1, 1,
0.7693056, -0.868674, 2.922401, 1, 1, 1, 1, 1,
0.7697948, 0.4910492, 1.229024, 1, 1, 1, 1, 1,
0.7836701, -2.245809, 2.44809, 1, 1, 1, 1, 1,
0.7847371, -1.11344, 2.477252, 1, 1, 1, 1, 1,
0.7905352, -0.7118421, 1.850774, 0, 0, 1, 1, 1,
0.7909057, -0.412332, 2.15304, 1, 0, 0, 1, 1,
0.7911854, 0.6513402, -0.4085674, 1, 0, 0, 1, 1,
0.8009776, 0.2238941, 0.3810328, 1, 0, 0, 1, 1,
0.8035541, -0.5367352, 1.41871, 1, 0, 0, 1, 1,
0.8065546, 0.5209327, -0.3117185, 1, 0, 0, 1, 1,
0.809934, -0.1593845, 1.575614, 0, 0, 0, 1, 1,
0.8108102, 0.1579111, 1.072599, 0, 0, 0, 1, 1,
0.8121037, 1.867036, -0.7230191, 0, 0, 0, 1, 1,
0.8127395, -0.5531361, 2.888009, 0, 0, 0, 1, 1,
0.8141035, 0.7488108, 0.4153863, 0, 0, 0, 1, 1,
0.8166049, 0.04315965, 2.604752, 0, 0, 0, 1, 1,
0.8203268, -1.910275, 3.638293, 0, 0, 0, 1, 1,
0.8222975, 1.178051, 1.448228, 1, 1, 1, 1, 1,
0.8292094, 0.5754676, 1.003489, 1, 1, 1, 1, 1,
0.8376766, -0.2941829, 1.199311, 1, 1, 1, 1, 1,
0.8391868, 0.1119129, 1.93792, 1, 1, 1, 1, 1,
0.8415256, 0.294416, 2.982742, 1, 1, 1, 1, 1,
0.8445327, 0.8065374, 1.479549, 1, 1, 1, 1, 1,
0.8469961, 0.3054442, 1.345563, 1, 1, 1, 1, 1,
0.8487594, 0.3956319, 2.947252, 1, 1, 1, 1, 1,
0.8545398, 1.308201, 0.6741009, 1, 1, 1, 1, 1,
0.8549643, 0.4238922, 1.365476, 1, 1, 1, 1, 1,
0.8613388, -0.283602, 2.651876, 1, 1, 1, 1, 1,
0.862007, 0.4172024, 1.132747, 1, 1, 1, 1, 1,
0.8624852, -1.153724, 1.73756, 1, 1, 1, 1, 1,
0.8640478, -0.1777919, 3.181287, 1, 1, 1, 1, 1,
0.8664921, -1.457322, 1.651992, 1, 1, 1, 1, 1,
0.8671873, -0.4845181, 0.5005527, 0, 0, 1, 1, 1,
0.8712038, -0.5279894, 2.793376, 1, 0, 0, 1, 1,
0.8712336, -0.09103679, 2.313021, 1, 0, 0, 1, 1,
0.8862552, -0.5236573, 3.817994, 1, 0, 0, 1, 1,
0.8942904, 1.667842, 1.217128, 1, 0, 0, 1, 1,
0.8979084, 0.3592132, 0.2602424, 1, 0, 0, 1, 1,
0.9027932, 1.431711, 1.882021, 0, 0, 0, 1, 1,
0.9058772, -0.3666333, 2.195239, 0, 0, 0, 1, 1,
0.9111055, 1.211164, -0.5573627, 0, 0, 0, 1, 1,
0.912085, 1.210669, 1.029055, 0, 0, 0, 1, 1,
0.9188475, 0.3140137, 2.463625, 0, 0, 0, 1, 1,
0.9224085, 0.1431504, 1.324317, 0, 0, 0, 1, 1,
0.9224432, 1.621936, 1.748378, 0, 0, 0, 1, 1,
0.9230208, 0.5612505, 1.547572, 1, 1, 1, 1, 1,
0.9272627, -1.171966, 1.645352, 1, 1, 1, 1, 1,
0.9279391, -0.3880011, -0.01011088, 1, 1, 1, 1, 1,
0.9291588, -0.8110347, 2.725885, 1, 1, 1, 1, 1,
0.9304891, -0.3685562, 0.03556548, 1, 1, 1, 1, 1,
0.9320235, 1.675799, -0.9016922, 1, 1, 1, 1, 1,
0.934006, 0.3051595, 0.0846258, 1, 1, 1, 1, 1,
0.9354134, 0.07470973, 0.6796786, 1, 1, 1, 1, 1,
0.941204, 2.877884, 0.3208585, 1, 1, 1, 1, 1,
0.9418551, 0.4292216, 0.9805548, 1, 1, 1, 1, 1,
0.9470508, -0.5117634, 3.078196, 1, 1, 1, 1, 1,
0.9541209, 0.7863737, 0.5904606, 1, 1, 1, 1, 1,
0.9579869, -0.3801444, 2.349333, 1, 1, 1, 1, 1,
0.9584626, -1.593652, 1.338668, 1, 1, 1, 1, 1,
0.9635473, 0.6138803, 0.4183664, 1, 1, 1, 1, 1,
0.9698284, -0.4335919, 3.631166, 0, 0, 1, 1, 1,
0.9701126, -1.868218, 1.13106, 1, 0, 0, 1, 1,
0.9726772, 0.6025445, 1.137504, 1, 0, 0, 1, 1,
0.9740964, -0.1744498, 1.995657, 1, 0, 0, 1, 1,
0.9753949, 1.280221, 1.708736, 1, 0, 0, 1, 1,
0.9756324, 0.169574, 1.41415, 1, 0, 0, 1, 1,
0.9762754, 2.491537, 0.07114747, 0, 0, 0, 1, 1,
0.9773239, -0.3087519, 1.945042, 0, 0, 0, 1, 1,
0.9774815, -0.7470607, 1.623318, 0, 0, 0, 1, 1,
0.9795391, 1.479071, 0.05689929, 0, 0, 0, 1, 1,
0.9849924, 0.4669062, 0.5536951, 0, 0, 0, 1, 1,
0.9902803, -0.3353761, 4.097878, 0, 0, 0, 1, 1,
0.9905297, 0.1697048, 1.423102, 0, 0, 0, 1, 1,
0.9923899, -1.024947, 2.627944, 1, 1, 1, 1, 1,
0.9939854, 0.7392349, 1.220494, 1, 1, 1, 1, 1,
0.9954844, 0.2762204, 0.6233614, 1, 1, 1, 1, 1,
1.00553, 0.4601179, 1.878271, 1, 1, 1, 1, 1,
1.006915, 0.6830377, 0.02934445, 1, 1, 1, 1, 1,
1.009597, 0.3419406, 1.012192, 1, 1, 1, 1, 1,
1.011925, 0.06244829, -0.06220502, 1, 1, 1, 1, 1,
1.016064, -0.45536, 0.5208722, 1, 1, 1, 1, 1,
1.020915, 0.07736399, 1.807234, 1, 1, 1, 1, 1,
1.023407, 1.090881, 0.7826743, 1, 1, 1, 1, 1,
1.024343, -1.318124, 3.362947, 1, 1, 1, 1, 1,
1.031938, 0.1194667, 1.005221, 1, 1, 1, 1, 1,
1.042224, -0.7646366, 1.85854, 1, 1, 1, 1, 1,
1.044844, -0.5096058, 4.443745, 1, 1, 1, 1, 1,
1.057424, -1.504514, 2.294368, 1, 1, 1, 1, 1,
1.057892, 0.2710719, -1.330569, 0, 0, 1, 1, 1,
1.068611, -0.4818064, 1.005042, 1, 0, 0, 1, 1,
1.070412, -0.5539784, 2.0279, 1, 0, 0, 1, 1,
1.0744, -0.7862303, 1.553729, 1, 0, 0, 1, 1,
1.07618, 1.572018, 0.996383, 1, 0, 0, 1, 1,
1.079434, 0.9232402, 0.8849348, 1, 0, 0, 1, 1,
1.084223, 1.943441, -0.5344804, 0, 0, 0, 1, 1,
1.084897, -0.03444076, 3.351439, 0, 0, 0, 1, 1,
1.086403, 2.052258, -0.09078191, 0, 0, 0, 1, 1,
1.088195, -0.6337999, 0.9978317, 0, 0, 0, 1, 1,
1.095433, 0.519504, 0.6465721, 0, 0, 0, 1, 1,
1.101488, -0.2672897, 1.073418, 0, 0, 0, 1, 1,
1.112488, 1.063902, -0.06979094, 0, 0, 0, 1, 1,
1.11308, 1.110664, -1.071664, 1, 1, 1, 1, 1,
1.117161, 1.200122, 1.039629, 1, 1, 1, 1, 1,
1.118174, 0.5984813, 1.537797, 1, 1, 1, 1, 1,
1.125116, 0.361737, -0.6491669, 1, 1, 1, 1, 1,
1.126364, -0.8229026, 1.005786, 1, 1, 1, 1, 1,
1.127581, -1.008443, 2.696395, 1, 1, 1, 1, 1,
1.1301, 0.8046046, 0.4757871, 1, 1, 1, 1, 1,
1.133554, -1.889278, 1.936166, 1, 1, 1, 1, 1,
1.14491, -2.203816, 2.554412, 1, 1, 1, 1, 1,
1.148752, -1.172469, 1.117699, 1, 1, 1, 1, 1,
1.151501, -1.476929, 0.7832419, 1, 1, 1, 1, 1,
1.154942, 0.2723003, 1.632562, 1, 1, 1, 1, 1,
1.160784, -0.9870784, 2.216331, 1, 1, 1, 1, 1,
1.170378, -0.3445054, 3.921601, 1, 1, 1, 1, 1,
1.1771, 0.07036971, 1.02925, 1, 1, 1, 1, 1,
1.177797, -0.7224324, 1.759934, 0, 0, 1, 1, 1,
1.181787, 0.7019135, 1.183445, 1, 0, 0, 1, 1,
1.187138, 1.269974, 1.141883, 1, 0, 0, 1, 1,
1.194294, 0.5173522, 1.264512, 1, 0, 0, 1, 1,
1.197459, 0.4666989, -0.02039572, 1, 0, 0, 1, 1,
1.202073, 1.470856, -0.3915991, 1, 0, 0, 1, 1,
1.206905, 0.1108743, 1.125242, 0, 0, 0, 1, 1,
1.216484, -0.09451979, 1.659557, 0, 0, 0, 1, 1,
1.217866, -1.12536, 2.965501, 0, 0, 0, 1, 1,
1.218111, 0.1576247, 0.5832834, 0, 0, 0, 1, 1,
1.219037, -0.4605387, 2.210611, 0, 0, 0, 1, 1,
1.229838, -0.2610218, 1.58649, 0, 0, 0, 1, 1,
1.234065, -0.2471998, -0.9304745, 0, 0, 0, 1, 1,
1.241452, 0.355574, -0.2317521, 1, 1, 1, 1, 1,
1.249796, 1.984088, 0.2613901, 1, 1, 1, 1, 1,
1.250249, -0.9089797, 1.778318, 1, 1, 1, 1, 1,
1.250867, -1.100633, 2.562863, 1, 1, 1, 1, 1,
1.261254, 1.018751, -0.9736591, 1, 1, 1, 1, 1,
1.263938, -0.8681291, 3.033932, 1, 1, 1, 1, 1,
1.266974, 1.522815, 0.7069051, 1, 1, 1, 1, 1,
1.270947, 0.6997688, 0.6464975, 1, 1, 1, 1, 1,
1.279869, 1.957847, 1.61354, 1, 1, 1, 1, 1,
1.281212, -0.297544, 1.495188, 1, 1, 1, 1, 1,
1.291873, 1.035102, 3.747127, 1, 1, 1, 1, 1,
1.292353, 1.481677, 0.3916989, 1, 1, 1, 1, 1,
1.310345, -0.7814302, 1.742761, 1, 1, 1, 1, 1,
1.335937, 0.4613846, 1.568364, 1, 1, 1, 1, 1,
1.348938, 1.455924, 2.379068, 1, 1, 1, 1, 1,
1.351971, -0.05828938, 1.659604, 0, 0, 1, 1, 1,
1.362809, 1.373128, 0.888529, 1, 0, 0, 1, 1,
1.364843, 1.82128, 0.8307506, 1, 0, 0, 1, 1,
1.36888, -0.551588, 2.772797, 1, 0, 0, 1, 1,
1.374019, 0.6752611, 0.754086, 1, 0, 0, 1, 1,
1.406153, 0.06932616, 1.712371, 1, 0, 0, 1, 1,
1.412723, 1.379362, 0.007981974, 0, 0, 0, 1, 1,
1.419836, -1.42153, 1.27757, 0, 0, 0, 1, 1,
1.421972, -0.6132801, 0.7671339, 0, 0, 0, 1, 1,
1.425753, 0.1388252, 0.4607835, 0, 0, 0, 1, 1,
1.42949, -0.3124317, 2.849032, 0, 0, 0, 1, 1,
1.434822, -1.892522, 2.387901, 0, 0, 0, 1, 1,
1.438937, -0.589447, 2.71657, 0, 0, 0, 1, 1,
1.46937, 0.2087073, 3.591007, 1, 1, 1, 1, 1,
1.46962, 1.703319, 0.5556649, 1, 1, 1, 1, 1,
1.501711, 0.402611, 0.7247375, 1, 1, 1, 1, 1,
1.510889, 0.9220111, 2.389767, 1, 1, 1, 1, 1,
1.525994, -0.3432996, 1.475775, 1, 1, 1, 1, 1,
1.532422, 0.311527, 1.730024, 1, 1, 1, 1, 1,
1.539151, -0.8769039, 1.385612, 1, 1, 1, 1, 1,
1.540098, 0.2077539, 1.62309, 1, 1, 1, 1, 1,
1.550722, -0.1064274, 3.173597, 1, 1, 1, 1, 1,
1.551644, -0.5258335, 2.976742, 1, 1, 1, 1, 1,
1.552251, 0.1802894, 1.825767, 1, 1, 1, 1, 1,
1.556154, -1.424201, 1.250001, 1, 1, 1, 1, 1,
1.561616, -2.404396, 3.171968, 1, 1, 1, 1, 1,
1.570776, -1.736391, 1.318276, 1, 1, 1, 1, 1,
1.57375, 1.285771, 1.646532, 1, 1, 1, 1, 1,
1.597564, -0.6700103, 2.60044, 0, 0, 1, 1, 1,
1.600933, 0.07077362, 1.853558, 1, 0, 0, 1, 1,
1.615207, -1.954162, 1.806296, 1, 0, 0, 1, 1,
1.624894, -2.462435, 4.093225, 1, 0, 0, 1, 1,
1.627621, -0.196729, 2.964912, 1, 0, 0, 1, 1,
1.636645, -1.857506, 2.620399, 1, 0, 0, 1, 1,
1.636964, -0.3887157, 1.433176, 0, 0, 0, 1, 1,
1.638824, 0.6321504, 0.5651149, 0, 0, 0, 1, 1,
1.64416, 1.390799, 1.360362, 0, 0, 0, 1, 1,
1.659435, 0.2637112, 2.142657, 0, 0, 0, 1, 1,
1.676449, -1.117339, 2.768222, 0, 0, 0, 1, 1,
1.686384, 1.126436, 2.030096, 0, 0, 0, 1, 1,
1.691737, 1.27373, 0.5219404, 0, 0, 0, 1, 1,
1.704567, 1.839867, -0.2991202, 1, 1, 1, 1, 1,
1.735393, 0.07647071, 1.220488, 1, 1, 1, 1, 1,
1.748972, 1.427831, 2.013856, 1, 1, 1, 1, 1,
1.759329, -0.9215661, 1.908805, 1, 1, 1, 1, 1,
1.779178, -0.9198715, 2.171823, 1, 1, 1, 1, 1,
1.800048, 1.01492, 0.4257785, 1, 1, 1, 1, 1,
1.81357, 1.251391, 2.534196, 1, 1, 1, 1, 1,
1.830791, -1.421367, 2.095941, 1, 1, 1, 1, 1,
1.849248, 0.7360507, 2.006377, 1, 1, 1, 1, 1,
1.857877, -1.670955, 1.201102, 1, 1, 1, 1, 1,
1.868973, 0.4878048, -0.4242921, 1, 1, 1, 1, 1,
1.881532, 0.02564864, 2.751732, 1, 1, 1, 1, 1,
1.908636, -0.8348922, 0.6582735, 1, 1, 1, 1, 1,
2.006798, 0.3653662, 0.4799004, 1, 1, 1, 1, 1,
2.10907, -0.7878627, 3.232863, 1, 1, 1, 1, 1,
2.13261, -1.826387, 3.888397, 0, 0, 1, 1, 1,
2.137188, -0.268383, 1.460288, 1, 0, 0, 1, 1,
2.143805, -1.197569, 2.131567, 1, 0, 0, 1, 1,
2.17396, 0.4298681, 1.088812, 1, 0, 0, 1, 1,
2.181497, -0.4687137, 1.781573, 1, 0, 0, 1, 1,
2.190788, -0.242663, 0.8100837, 1, 0, 0, 1, 1,
2.195112, -1.663757, 1.432473, 0, 0, 0, 1, 1,
2.204844, -2.111106, 2.041052, 0, 0, 0, 1, 1,
2.208529, 0.4821669, 2.787407, 0, 0, 0, 1, 1,
2.222434, 0.5399349, 1.613407, 0, 0, 0, 1, 1,
2.253571, 1.95902, 1.660611, 0, 0, 0, 1, 1,
2.370133, 0.6007568, -0.3393816, 0, 0, 0, 1, 1,
2.373144, 1.083015, -0.2627927, 0, 0, 0, 1, 1,
2.379234, -0.4537237, 2.953334, 1, 1, 1, 1, 1,
2.379772, -0.4296643, 1.68753, 1, 1, 1, 1, 1,
2.613657, -1.531305, 0.6270826, 1, 1, 1, 1, 1,
2.613986, -0.4027661, 2.180399, 1, 1, 1, 1, 1,
2.63932, -0.2910755, 1.802982, 1, 1, 1, 1, 1,
2.903615, 0.1841792, 0.6752043, 1, 1, 1, 1, 1,
3.66607, 1.757495, 2.209157, 1, 1, 1, 1, 1
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
var radius = 9.437698;
var distance = 33.14951;
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
mvMatrix.translate( -0.1736441, -0.1029212, 0.07848191 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.14951);
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