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
-2.957651, -0.6790056, -1.937886, 1, 0, 0, 1,
-2.944549, -1.35639, -2.851133, 1, 0.007843138, 0, 1,
-2.916721, -0.2645323, -1.148352, 1, 0.01176471, 0, 1,
-2.725498, 1.263434, -3.480432, 1, 0.01960784, 0, 1,
-2.709422, -0.2312563, -1.913435, 1, 0.02352941, 0, 1,
-2.653423, 0.837246, -1.297533, 1, 0.03137255, 0, 1,
-2.649075, -1.523015, -1.760547, 1, 0.03529412, 0, 1,
-2.646005, 0.6007859, -1.328876, 1, 0.04313726, 0, 1,
-2.572887, -0.7378377, -1.747988, 1, 0.04705882, 0, 1,
-2.370241, -1.13263, -2.407393, 1, 0.05490196, 0, 1,
-2.369964, 0.07409258, -1.763378, 1, 0.05882353, 0, 1,
-2.282995, -0.7264614, -1.405786, 1, 0.06666667, 0, 1,
-2.204313, -0.8541195, -2.467582, 1, 0.07058824, 0, 1,
-2.188767, -0.3301943, -1.399621, 1, 0.07843138, 0, 1,
-2.171343, -0.7156058, -0.4049489, 1, 0.08235294, 0, 1,
-2.152092, 0.1811436, -3.61213, 1, 0.09019608, 0, 1,
-2.14716, 0.5367835, -0.9528021, 1, 0.09411765, 0, 1,
-2.135436, -0.5090064, -1.352241, 1, 0.1019608, 0, 1,
-2.086709, -0.8268152, -1.544415, 1, 0.1098039, 0, 1,
-2.026853, 0.2292702, -1.506479, 1, 0.1137255, 0, 1,
-1.995798, -0.6027527, -0.6788189, 1, 0.1215686, 0, 1,
-1.992212, -0.7807166, -1.641377, 1, 0.1254902, 0, 1,
-1.975041, -0.09873515, -0.1689918, 1, 0.1333333, 0, 1,
-1.947127, 0.4010517, -2.183216, 1, 0.1372549, 0, 1,
-1.935184, -1.748811, -1.956754, 1, 0.145098, 0, 1,
-1.933048, -0.03798161, -0.7419972, 1, 0.1490196, 0, 1,
-1.931502, -0.6137046, -1.613044, 1, 0.1568628, 0, 1,
-1.910664, -0.3138302, -2.363867, 1, 0.1607843, 0, 1,
-1.907348, -0.4291798, -0.8152884, 1, 0.1686275, 0, 1,
-1.855552, 0.9511122, -0.9617357, 1, 0.172549, 0, 1,
-1.853691, -0.7898119, -0.001246425, 1, 0.1803922, 0, 1,
-1.83191, 0.859866, -2.336664, 1, 0.1843137, 0, 1,
-1.783955, -0.09621853, -0.280699, 1, 0.1921569, 0, 1,
-1.772098, -0.4258055, -1.850953, 1, 0.1960784, 0, 1,
-1.752524, 0.9393307, 0.3274135, 1, 0.2039216, 0, 1,
-1.751889, 0.880725, -2.094721, 1, 0.2117647, 0, 1,
-1.748304, 0.6267023, -0.6026589, 1, 0.2156863, 0, 1,
-1.73002, 0.1293129, -1.737885, 1, 0.2235294, 0, 1,
-1.714164, 0.8418661, -1.996272, 1, 0.227451, 0, 1,
-1.711913, 0.3235203, -1.427911, 1, 0.2352941, 0, 1,
-1.711511, -1.674073, -3.83355, 1, 0.2392157, 0, 1,
-1.709627, -0.5405412, -1.829689, 1, 0.2470588, 0, 1,
-1.70606, 0.2103423, -1.582309, 1, 0.2509804, 0, 1,
-1.68786, 1.975138, 1.763217, 1, 0.2588235, 0, 1,
-1.677402, -1.479229, -1.636174, 1, 0.2627451, 0, 1,
-1.671349, -0.8599312, -0.7048527, 1, 0.2705882, 0, 1,
-1.659933, -1.074696, -2.415481, 1, 0.2745098, 0, 1,
-1.651082, -0.9503051, -2.443974, 1, 0.282353, 0, 1,
-1.649981, 1.288769, -0.3775922, 1, 0.2862745, 0, 1,
-1.647269, -0.1667671, -1.636971, 1, 0.2941177, 0, 1,
-1.646838, -0.3499837, -2.275858, 1, 0.3019608, 0, 1,
-1.645677, 0.2268772, -3.245907, 1, 0.3058824, 0, 1,
-1.644489, -0.1711391, -1.613294, 1, 0.3137255, 0, 1,
-1.63656, 0.8134916, 0.4581603, 1, 0.3176471, 0, 1,
-1.635474, 1.110996, -0.666679, 1, 0.3254902, 0, 1,
-1.628111, -0.334033, -2.99605, 1, 0.3294118, 0, 1,
-1.625118, -0.2190022, -3.498962, 1, 0.3372549, 0, 1,
-1.62058, -1.069041, -2.225192, 1, 0.3411765, 0, 1,
-1.606955, 0.8575146, -0.7178749, 1, 0.3490196, 0, 1,
-1.594668, -0.8778684, -1.826124, 1, 0.3529412, 0, 1,
-1.580525, -1.481231, -2.270189, 1, 0.3607843, 0, 1,
-1.565591, 0.08317804, -1.829129, 1, 0.3647059, 0, 1,
-1.557075, -0.4003114, -1.923003, 1, 0.372549, 0, 1,
-1.555219, -0.3071247, -2.263938, 1, 0.3764706, 0, 1,
-1.553831, -0.8864853, -0.6513278, 1, 0.3843137, 0, 1,
-1.540652, -1.441654, -3.103, 1, 0.3882353, 0, 1,
-1.534637, 0.5028067, -0.8008176, 1, 0.3960784, 0, 1,
-1.524572, -1.481807, -2.922219, 1, 0.4039216, 0, 1,
-1.52439, 1.188189, -1.754356, 1, 0.4078431, 0, 1,
-1.521017, 0.1082212, -2.342321, 1, 0.4156863, 0, 1,
-1.517705, -0.1363684, -2.17311, 1, 0.4196078, 0, 1,
-1.516623, 0.008747964, -1.087559, 1, 0.427451, 0, 1,
-1.515592, -0.7406578, -2.301171, 1, 0.4313726, 0, 1,
-1.503795, -0.7907676, -2.558892, 1, 0.4392157, 0, 1,
-1.496096, 1.269022, -1.56664, 1, 0.4431373, 0, 1,
-1.491191, -0.06969474, -2.110293, 1, 0.4509804, 0, 1,
-1.4873, -0.4149996, -1.225768, 1, 0.454902, 0, 1,
-1.464368, 1.412737, 0.3665152, 1, 0.4627451, 0, 1,
-1.46358, 1.860975, -1.736388, 1, 0.4666667, 0, 1,
-1.462709, -1.044882, -3.725651, 1, 0.4745098, 0, 1,
-1.453155, 2.276769, -1.777362, 1, 0.4784314, 0, 1,
-1.452825, -0.04942454, -1.789114, 1, 0.4862745, 0, 1,
-1.433568, -1.095576, -0.566525, 1, 0.4901961, 0, 1,
-1.428768, 0.7641577, -0.3195143, 1, 0.4980392, 0, 1,
-1.42776, 0.8251618, 0.8409226, 1, 0.5058824, 0, 1,
-1.418686, 1.227017, -0.7495563, 1, 0.509804, 0, 1,
-1.402845, -0.5585345, -2.653274, 1, 0.5176471, 0, 1,
-1.392778, -0.5003005, -2.961818, 1, 0.5215687, 0, 1,
-1.387067, 0.8941869, 0.4152456, 1, 0.5294118, 0, 1,
-1.376647, -0.4126303, -1.338659, 1, 0.5333334, 0, 1,
-1.371103, -0.1080066, -3.619625, 1, 0.5411765, 0, 1,
-1.367617, 0.2287855, -2.143352, 1, 0.5450981, 0, 1,
-1.364696, 0.1333069, -0.7321138, 1, 0.5529412, 0, 1,
-1.357519, -0.469815, -2.240738, 1, 0.5568628, 0, 1,
-1.354379, 0.08795156, -0.3339104, 1, 0.5647059, 0, 1,
-1.338991, -0.4643414, -0.5460419, 1, 0.5686275, 0, 1,
-1.334137, -2.269752, -1.268994, 1, 0.5764706, 0, 1,
-1.319798, -0.3543713, -1.510636, 1, 0.5803922, 0, 1,
-1.302562, 0.9721242, 0.5634152, 1, 0.5882353, 0, 1,
-1.290286, -1.204362, -2.49649, 1, 0.5921569, 0, 1,
-1.283489, 0.0172153, 0.02186495, 1, 0.6, 0, 1,
-1.276361, -0.8690704, -1.070465, 1, 0.6078432, 0, 1,
-1.270648, 1.248039, -0.9420403, 1, 0.6117647, 0, 1,
-1.267745, 0.9136966, -0.3522328, 1, 0.6196079, 0, 1,
-1.26756, -0.9705958, -2.13608, 1, 0.6235294, 0, 1,
-1.266328, 0.8937895, -1.124504, 1, 0.6313726, 0, 1,
-1.261916, 1.349548, -1.26546, 1, 0.6352941, 0, 1,
-1.250538, -0.02301705, -1.100977, 1, 0.6431373, 0, 1,
-1.245728, 0.5513927, -0.9553559, 1, 0.6470588, 0, 1,
-1.232946, -1.171284, -1.198353, 1, 0.654902, 0, 1,
-1.231925, 1.24055, -1.738728, 1, 0.6588235, 0, 1,
-1.212351, -1.377561, -1.611115, 1, 0.6666667, 0, 1,
-1.201464, -2.536923, -2.796571, 1, 0.6705883, 0, 1,
-1.201097, -0.5652789, -0.9178351, 1, 0.6784314, 0, 1,
-1.200307, -0.1066053, 0.9176771, 1, 0.682353, 0, 1,
-1.199788, -0.7826852, -2.149609, 1, 0.6901961, 0, 1,
-1.194123, -1.382826, -2.63622, 1, 0.6941177, 0, 1,
-1.192839, 0.5696717, -1.251508, 1, 0.7019608, 0, 1,
-1.184674, 1.411762, -1.097596, 1, 0.7098039, 0, 1,
-1.18249, -0.7239766, -1.107798, 1, 0.7137255, 0, 1,
-1.181297, 0.920365, -0.678287, 1, 0.7215686, 0, 1,
-1.179999, 0.143166, -1.6601, 1, 0.7254902, 0, 1,
-1.179808, -1.018155, -4.349154, 1, 0.7333333, 0, 1,
-1.172153, 0.6733899, -0.5511757, 1, 0.7372549, 0, 1,
-1.171434, -0.7158983, -4.401095, 1, 0.7450981, 0, 1,
-1.154158, 0.8669853, -0.5687395, 1, 0.7490196, 0, 1,
-1.140797, 0.3808885, -1.269754, 1, 0.7568628, 0, 1,
-1.139118, 0.7312918, -1.534199, 1, 0.7607843, 0, 1,
-1.127926, 1.115654, -0.5341629, 1, 0.7686275, 0, 1,
-1.116091, 0.1190723, -1.054013, 1, 0.772549, 0, 1,
-1.111527, 1.959866, 0.8795263, 1, 0.7803922, 0, 1,
-1.109273, 1.039516, -1.235939, 1, 0.7843137, 0, 1,
-1.106122, 0.211005, -0.1825215, 1, 0.7921569, 0, 1,
-1.103408, -0.5610645, -3.269894, 1, 0.7960784, 0, 1,
-1.089241, -0.5800856, -1.93242, 1, 0.8039216, 0, 1,
-1.088808, -0.6750295, -0.9879687, 1, 0.8117647, 0, 1,
-1.088035, -0.3777735, -2.552154, 1, 0.8156863, 0, 1,
-1.086465, -0.6501986, -1.977661, 1, 0.8235294, 0, 1,
-1.082729, -0.38949, -0.8519692, 1, 0.827451, 0, 1,
-1.082062, 0.5952163, -0.8098174, 1, 0.8352941, 0, 1,
-1.081597, 1.397681, -0.3421374, 1, 0.8392157, 0, 1,
-1.075686, 0.07808078, -1.786727, 1, 0.8470588, 0, 1,
-1.075309, -0.05572508, -1.079015, 1, 0.8509804, 0, 1,
-1.075279, -0.06083773, -1.774328, 1, 0.8588235, 0, 1,
-1.071636, -1.160893, -3.315372, 1, 0.8627451, 0, 1,
-1.070823, 0.198662, -1.935197, 1, 0.8705882, 0, 1,
-1.067988, 2.256601, -1.502239, 1, 0.8745098, 0, 1,
-1.063244, -0.6959994, -2.038921, 1, 0.8823529, 0, 1,
-1.062973, -0.1546939, -1.812329, 1, 0.8862745, 0, 1,
-1.058835, 0.2499608, -1.241474, 1, 0.8941177, 0, 1,
-1.057483, 0.6655421, -1.346596, 1, 0.8980392, 0, 1,
-1.057344, 1.222395, 0.1893686, 1, 0.9058824, 0, 1,
-1.05696, -0.4119362, -1.521141, 1, 0.9137255, 0, 1,
-1.051017, -0.4514702, -3.226526, 1, 0.9176471, 0, 1,
-1.050966, 1.141923, -0.3720282, 1, 0.9254902, 0, 1,
-1.050607, -0.454857, -0.5747976, 1, 0.9294118, 0, 1,
-1.050018, 1.491384, -1.70841, 1, 0.9372549, 0, 1,
-1.048862, 0.7625549, -2.098177, 1, 0.9411765, 0, 1,
-1.04561, -0.06118766, -2.17608, 1, 0.9490196, 0, 1,
-1.04127, 1.474746, 0.8249493, 1, 0.9529412, 0, 1,
-1.019122, -0.5258819, -1.016914, 1, 0.9607843, 0, 1,
-1.014318, -0.7580873, -2.354329, 1, 0.9647059, 0, 1,
-1.008705, -1.751745, -2.477467, 1, 0.972549, 0, 1,
-0.9932999, 0.9434896, -0.5369523, 1, 0.9764706, 0, 1,
-0.9824764, -0.5555705, -1.472051, 1, 0.9843137, 0, 1,
-0.9791914, -1.833899, -3.429948, 1, 0.9882353, 0, 1,
-0.975867, -1.3998, -3.361803, 1, 0.9960784, 0, 1,
-0.9691509, -0.8867506, -4.364361, 0.9960784, 1, 0, 1,
-0.9668174, -1.122398, -2.666886, 0.9921569, 1, 0, 1,
-0.966054, -1.337385, -1.28501, 0.9843137, 1, 0, 1,
-0.9650981, 1.692366, -0.4555887, 0.9803922, 1, 0, 1,
-0.9613318, 0.02276098, -3.688984, 0.972549, 1, 0, 1,
-0.9560068, 1.196007, -0.8582538, 0.9686275, 1, 0, 1,
-0.954094, 1.134084, -1.207731, 0.9607843, 1, 0, 1,
-0.9512082, 0.7175686, -0.9832568, 0.9568627, 1, 0, 1,
-0.9413033, -0.433585, -2.655351, 0.9490196, 1, 0, 1,
-0.9302713, -0.8465552, -3.05666, 0.945098, 1, 0, 1,
-0.9273106, -1.627144, -2.429308, 0.9372549, 1, 0, 1,
-0.9269507, 0.8308197, -1.301589, 0.9333333, 1, 0, 1,
-0.9261844, -0.2475514, -2.819717, 0.9254902, 1, 0, 1,
-0.9259963, -0.1735584, -2.578086, 0.9215686, 1, 0, 1,
-0.9248869, 0.9400692, -1.600897, 0.9137255, 1, 0, 1,
-0.9232985, -0.6017559, -2.898687, 0.9098039, 1, 0, 1,
-0.9173847, -1.514057, -1.863804, 0.9019608, 1, 0, 1,
-0.9149734, 0.6973804, 0.3563908, 0.8941177, 1, 0, 1,
-0.9120042, -0.9442163, -0.8571916, 0.8901961, 1, 0, 1,
-0.9101207, 1.733196, 0.3672039, 0.8823529, 1, 0, 1,
-0.9064375, 0.7026818, -1.104371, 0.8784314, 1, 0, 1,
-0.9047961, 2.820059, -0.8274399, 0.8705882, 1, 0, 1,
-0.8893492, 1.244927, -0.09713022, 0.8666667, 1, 0, 1,
-0.8874635, -0.4280376, -2.601674, 0.8588235, 1, 0, 1,
-0.8848086, -1.378066, -3.290432, 0.854902, 1, 0, 1,
-0.8842135, 1.239293, 1.277326, 0.8470588, 1, 0, 1,
-0.8835654, -0.390756, -2.674363, 0.8431373, 1, 0, 1,
-0.8816515, 0.3777207, -0.8928393, 0.8352941, 1, 0, 1,
-0.8800153, 0.1946117, -1.430162, 0.8313726, 1, 0, 1,
-0.8786067, 0.481361, -0.4863559, 0.8235294, 1, 0, 1,
-0.8715661, -0.5257881, -1.771701, 0.8196079, 1, 0, 1,
-0.8711908, 1.099303, -0.454942, 0.8117647, 1, 0, 1,
-0.8703986, -0.4584019, -4.527998, 0.8078431, 1, 0, 1,
-0.8682958, -0.0001356023, -2.909276, 0.8, 1, 0, 1,
-0.8550495, -0.04065823, -1.613386, 0.7921569, 1, 0, 1,
-0.8521945, -0.8686754, -2.854786, 0.7882353, 1, 0, 1,
-0.8498006, -1.342064, -2.314793, 0.7803922, 1, 0, 1,
-0.8399937, -0.02063806, -0.6573466, 0.7764706, 1, 0, 1,
-0.8372648, -1.368153, -2.30305, 0.7686275, 1, 0, 1,
-0.8337158, 0.8280848, 0.1584811, 0.7647059, 1, 0, 1,
-0.8328499, -1.300665, -2.915572, 0.7568628, 1, 0, 1,
-0.8207352, 0.9343798, -1.230453, 0.7529412, 1, 0, 1,
-0.818932, 0.01127752, -2.297768, 0.7450981, 1, 0, 1,
-0.8076671, 0.9792207, -1.298486, 0.7411765, 1, 0, 1,
-0.8021176, -0.05550645, -3.40389, 0.7333333, 1, 0, 1,
-0.8016994, -1.094167, -3.157942, 0.7294118, 1, 0, 1,
-0.8005533, 1.092411, -1.315387, 0.7215686, 1, 0, 1,
-0.8002902, -0.3442134, -1.541744, 0.7176471, 1, 0, 1,
-0.7925029, -0.2026666, -2.861135, 0.7098039, 1, 0, 1,
-0.7885624, -0.2708691, -1.780658, 0.7058824, 1, 0, 1,
-0.7875243, -1.701778, -3.773222, 0.6980392, 1, 0, 1,
-0.7853007, -1.495867, -3.31275, 0.6901961, 1, 0, 1,
-0.7811868, -0.2286553, -2.609055, 0.6862745, 1, 0, 1,
-0.7790977, 0.06463608, -0.05788907, 0.6784314, 1, 0, 1,
-0.7780376, 0.1112128, -1.278894, 0.6745098, 1, 0, 1,
-0.7755571, -0.6216437, -2.64598, 0.6666667, 1, 0, 1,
-0.7690384, -0.4575192, -4.41247, 0.6627451, 1, 0, 1,
-0.7689709, -0.755601, -3.692751, 0.654902, 1, 0, 1,
-0.7672344, 0.5051092, -0.7566836, 0.6509804, 1, 0, 1,
-0.7616202, -0.01570936, -1.371191, 0.6431373, 1, 0, 1,
-0.7585741, -1.972439, -2.015768, 0.6392157, 1, 0, 1,
-0.7554253, 0.7680209, -0.7471256, 0.6313726, 1, 0, 1,
-0.7514969, 0.2036596, -1.035493, 0.627451, 1, 0, 1,
-0.7499397, 0.1485222, -1.516269, 0.6196079, 1, 0, 1,
-0.7438798, -1.319113, -3.530907, 0.6156863, 1, 0, 1,
-0.7376309, -1.285544, -2.780544, 0.6078432, 1, 0, 1,
-0.7372192, -1.206232, -1.000725, 0.6039216, 1, 0, 1,
-0.7342843, -0.6559913, -1.052271, 0.5960785, 1, 0, 1,
-0.733754, 0.3913314, -0.4005383, 0.5882353, 1, 0, 1,
-0.7316801, -0.1653799, -1.355171, 0.5843138, 1, 0, 1,
-0.7286805, -0.6506866, -1.480495, 0.5764706, 1, 0, 1,
-0.7223772, -1.662953, -3.262053, 0.572549, 1, 0, 1,
-0.7124833, -0.02244519, -0.4805891, 0.5647059, 1, 0, 1,
-0.7086071, 1.539616, -0.2262369, 0.5607843, 1, 0, 1,
-0.7072629, -1.924063, -2.624578, 0.5529412, 1, 0, 1,
-0.7066119, -2.625674, -3.419052, 0.5490196, 1, 0, 1,
-0.7038173, -0.5367833, -1.796296, 0.5411765, 1, 0, 1,
-0.7036283, -0.3129916, -2.41327, 0.5372549, 1, 0, 1,
-0.7009505, -0.2694628, -2.305436, 0.5294118, 1, 0, 1,
-0.6975558, -1.302296, -2.333322, 0.5254902, 1, 0, 1,
-0.6959648, 0.8536013, 0.5000437, 0.5176471, 1, 0, 1,
-0.695403, 0.3952117, -1.469881, 0.5137255, 1, 0, 1,
-0.6928942, 0.1060911, -3.513705, 0.5058824, 1, 0, 1,
-0.6895317, -0.04419639, -1.261668, 0.5019608, 1, 0, 1,
-0.6840354, -0.859907, -2.168299, 0.4941176, 1, 0, 1,
-0.6838547, 0.3388607, -0.6270832, 0.4862745, 1, 0, 1,
-0.6804873, -0.7276313, -2.235452, 0.4823529, 1, 0, 1,
-0.6749367, -2.218433, -3.3135, 0.4745098, 1, 0, 1,
-0.6749138, 0.4119706, -1.792468, 0.4705882, 1, 0, 1,
-0.6742339, -0.6441181, -3.279876, 0.4627451, 1, 0, 1,
-0.6737913, -0.5806342, -3.431578, 0.4588235, 1, 0, 1,
-0.6726791, -1.176042, -3.472319, 0.4509804, 1, 0, 1,
-0.6633023, 1.871723, 1.992669, 0.4470588, 1, 0, 1,
-0.6615751, 1.092953, -0.1136467, 0.4392157, 1, 0, 1,
-0.6591687, -1.459521, -4.239603, 0.4352941, 1, 0, 1,
-0.6576751, -1.833329, -3.348588, 0.427451, 1, 0, 1,
-0.6561508, -0.6034973, -1.339425, 0.4235294, 1, 0, 1,
-0.6492509, 1.05229, -1.209468, 0.4156863, 1, 0, 1,
-0.6492103, -0.3731909, -0.7098848, 0.4117647, 1, 0, 1,
-0.6479499, 1.13178, 0.6051518, 0.4039216, 1, 0, 1,
-0.6465186, 0.3282582, -1.262527, 0.3960784, 1, 0, 1,
-0.6450329, -0.7836041, -3.141318, 0.3921569, 1, 0, 1,
-0.641465, -2.22561, -3.139126, 0.3843137, 1, 0, 1,
-0.6341943, -0.2882817, -2.550169, 0.3803922, 1, 0, 1,
-0.6319451, -0.2553966, -1.908034, 0.372549, 1, 0, 1,
-0.6306674, 0.538875, 0.06849097, 0.3686275, 1, 0, 1,
-0.6300958, -0.8659542, -2.672005, 0.3607843, 1, 0, 1,
-0.6271678, 0.4997923, -1.063239, 0.3568628, 1, 0, 1,
-0.6240583, -0.44392, -0.7273328, 0.3490196, 1, 0, 1,
-0.6218131, -0.690295, -2.099439, 0.345098, 1, 0, 1,
-0.6155353, 0.9410752, -1.854634, 0.3372549, 1, 0, 1,
-0.6136775, -1.023011, -1.159819, 0.3333333, 1, 0, 1,
-0.607677, -1.085937, -1.684043, 0.3254902, 1, 0, 1,
-0.6056014, -0.412098, -4.496475, 0.3215686, 1, 0, 1,
-0.605275, 0.8177574, -1.957553, 0.3137255, 1, 0, 1,
-0.6045921, 0.4321316, -1.745328, 0.3098039, 1, 0, 1,
-0.602421, -0.8482153, -1.988129, 0.3019608, 1, 0, 1,
-0.6009784, 1.039496, 1.621126, 0.2941177, 1, 0, 1,
-0.5973179, -0.9797039, -2.945612, 0.2901961, 1, 0, 1,
-0.5887675, 0.4837289, -1.07463, 0.282353, 1, 0, 1,
-0.5884475, -1.296312, -3.399822, 0.2784314, 1, 0, 1,
-0.5846026, 2.992426, 0.1377739, 0.2705882, 1, 0, 1,
-0.5826173, 1.137111, -0.2673645, 0.2666667, 1, 0, 1,
-0.5818596, -0.9254729, -3.282804, 0.2588235, 1, 0, 1,
-0.5783471, 0.2363014, -1.347108, 0.254902, 1, 0, 1,
-0.578337, 0.3267196, -0.2507549, 0.2470588, 1, 0, 1,
-0.5712419, -1.564383, -3.563286, 0.2431373, 1, 0, 1,
-0.567762, 0.409974, 0.1371937, 0.2352941, 1, 0, 1,
-0.5616441, -0.3807101, -1.506948, 0.2313726, 1, 0, 1,
-0.556465, -1.522296, -2.617474, 0.2235294, 1, 0, 1,
-0.5555524, -1.176892, -2.403539, 0.2196078, 1, 0, 1,
-0.5534405, 0.02625123, -2.265109, 0.2117647, 1, 0, 1,
-0.5484982, -0.6323054, -2.120951, 0.2078431, 1, 0, 1,
-0.5461197, 0.4431984, -0.07358985, 0.2, 1, 0, 1,
-0.5434286, 0.422445, 1.184369, 0.1921569, 1, 0, 1,
-0.5431566, 0.1748007, -1.77873, 0.1882353, 1, 0, 1,
-0.5362133, 1.082795, 0.8912883, 0.1803922, 1, 0, 1,
-0.536165, -0.7345581, -3.090475, 0.1764706, 1, 0, 1,
-0.5358239, 0.3626856, 0.7869369, 0.1686275, 1, 0, 1,
-0.5314051, 2.472569, -1.560037, 0.1647059, 1, 0, 1,
-0.5278012, 0.4314021, -0.4008323, 0.1568628, 1, 0, 1,
-0.5267405, 0.1779738, -0.358634, 0.1529412, 1, 0, 1,
-0.5246347, -0.1983734, -3.025819, 0.145098, 1, 0, 1,
-0.5235637, 1.505044, 0.9412858, 0.1411765, 1, 0, 1,
-0.5214942, -0.9937335, -1.050056, 0.1333333, 1, 0, 1,
-0.5208278, 0.164675, -0.8087098, 0.1294118, 1, 0, 1,
-0.5167785, 0.7145258, -0.07970294, 0.1215686, 1, 0, 1,
-0.5125623, 1.211091, -0.3992545, 0.1176471, 1, 0, 1,
-0.504189, -0.5465127, -3.836706, 0.1098039, 1, 0, 1,
-0.4979197, -0.3771213, -3.650856, 0.1058824, 1, 0, 1,
-0.4953927, -0.9805336, -1.273628, 0.09803922, 1, 0, 1,
-0.4951285, 1.008979, -0.1739829, 0.09019608, 1, 0, 1,
-0.4937976, -0.3606673, -3.395134, 0.08627451, 1, 0, 1,
-0.4857677, 0.5987836, 0.2554109, 0.07843138, 1, 0, 1,
-0.483403, -1.998778, -3.776433, 0.07450981, 1, 0, 1,
-0.4787059, 1.561535, 0.1790729, 0.06666667, 1, 0, 1,
-0.4769191, 0.5931904, -0.9068671, 0.0627451, 1, 0, 1,
-0.4723497, -0.01629066, -0.2723001, 0.05490196, 1, 0, 1,
-0.4716677, 0.1363209, -3.27592, 0.05098039, 1, 0, 1,
-0.4695873, 1.120713, -1.831151, 0.04313726, 1, 0, 1,
-0.46711, -0.5583548, -4.153769, 0.03921569, 1, 0, 1,
-0.4633618, 0.7631183, -0.5360721, 0.03137255, 1, 0, 1,
-0.4625242, 0.5115795, -1.340984, 0.02745098, 1, 0, 1,
-0.4600898, 0.6406726, 0.4625929, 0.01960784, 1, 0, 1,
-0.4560087, -0.111944, -1.04768, 0.01568628, 1, 0, 1,
-0.4550661, 0.50133, -2.027363, 0.007843138, 1, 0, 1,
-0.4529611, 0.06073101, -0.8747835, 0.003921569, 1, 0, 1,
-0.4510175, 0.7742167, -1.175028, 0, 1, 0.003921569, 1,
-0.4481209, 0.5410163, -2.319934, 0, 1, 0.01176471, 1,
-0.4386592, 0.08566441, -0.8445492, 0, 1, 0.01568628, 1,
-0.4275441, 0.4300955, -0.4966545, 0, 1, 0.02352941, 1,
-0.4260041, -0.9314841, -4.212483, 0, 1, 0.02745098, 1,
-0.4238982, -0.147969, -3.658535, 0, 1, 0.03529412, 1,
-0.4216683, 0.07433467, -2.411358, 0, 1, 0.03921569, 1,
-0.4188856, -0.4564112, -2.865078, 0, 1, 0.04705882, 1,
-0.4172791, -0.6899284, -0.1757095, 0, 1, 0.05098039, 1,
-0.4109031, 0.15365, -3.39938, 0, 1, 0.05882353, 1,
-0.4087531, -1.242419, -4.638013, 0, 1, 0.0627451, 1,
-0.4086159, 0.1496845, -0.2882304, 0, 1, 0.07058824, 1,
-0.4082515, 1.555714, 0.566326, 0, 1, 0.07450981, 1,
-0.4066914, -1.57, -2.213218, 0, 1, 0.08235294, 1,
-0.405131, 0.9978369, -1.065195, 0, 1, 0.08627451, 1,
-0.3990504, -0.3016348, -1.832595, 0, 1, 0.09411765, 1,
-0.3967224, -1.649924, -3.026589, 0, 1, 0.1019608, 1,
-0.3948696, 0.8085507, -0.1772873, 0, 1, 0.1058824, 1,
-0.392234, -0.836965, -1.376369, 0, 1, 0.1137255, 1,
-0.3920079, -0.3456291, -1.169951, 0, 1, 0.1176471, 1,
-0.3916173, -1.246041, -3.435256, 0, 1, 0.1254902, 1,
-0.3868149, 2.648948, 0.1933468, 0, 1, 0.1294118, 1,
-0.3819726, 0.8443776, 1.099901, 0, 1, 0.1372549, 1,
-0.3802522, -0.3315852, -1.894387, 0, 1, 0.1411765, 1,
-0.3717415, -1.788086, -3.149883, 0, 1, 0.1490196, 1,
-0.3705917, -0.6416158, -3.007281, 0, 1, 0.1529412, 1,
-0.3700255, -0.9863126, -2.975154, 0, 1, 0.1607843, 1,
-0.3680996, -0.5110431, -1.916179, 0, 1, 0.1647059, 1,
-0.3629873, 0.1509516, -1.40712, 0, 1, 0.172549, 1,
-0.3558355, 0.8607307, -0.3965124, 0, 1, 0.1764706, 1,
-0.3548903, 1.197107, 0.1973627, 0, 1, 0.1843137, 1,
-0.3539546, 0.4032037, 1.131513, 0, 1, 0.1882353, 1,
-0.3493666, -0.1432227, -0.5581332, 0, 1, 0.1960784, 1,
-0.3433541, -1.16432, -1.549098, 0, 1, 0.2039216, 1,
-0.3427296, 1.015965, -1.083405, 0, 1, 0.2078431, 1,
-0.3402073, -2.231074, -2.502944, 0, 1, 0.2156863, 1,
-0.3386902, -1.448036, -2.907449, 0, 1, 0.2196078, 1,
-0.335668, 0.1858459, -0.2555462, 0, 1, 0.227451, 1,
-0.3338048, 0.6190942, -0.3556052, 0, 1, 0.2313726, 1,
-0.3295592, -1.511969, -2.928051, 0, 1, 0.2392157, 1,
-0.3290385, 0.4623074, 0.1196853, 0, 1, 0.2431373, 1,
-0.3210293, -0.1002507, -2.493649, 0, 1, 0.2509804, 1,
-0.3152691, 0.6547095, -1.404427, 0, 1, 0.254902, 1,
-0.3050565, 3.714997, 0.9713803, 0, 1, 0.2627451, 1,
-0.3032488, -0.1777643, -1.57086, 0, 1, 0.2666667, 1,
-0.3021443, 0.3351015, -0.6123589, 0, 1, 0.2745098, 1,
-0.2976055, -1.9197, -2.458572, 0, 1, 0.2784314, 1,
-0.2964366, -0.285176, -2.191269, 0, 1, 0.2862745, 1,
-0.2940512, -1.007848, -4.085131, 0, 1, 0.2901961, 1,
-0.292784, 0.0933198, -2.284374, 0, 1, 0.2980392, 1,
-0.289267, -1.943173, -3.162891, 0, 1, 0.3058824, 1,
-0.2836935, -2.191254, -3.81767, 0, 1, 0.3098039, 1,
-0.2814386, 1.849761, -0.1977407, 0, 1, 0.3176471, 1,
-0.2783881, 0.4472896, -0.4152194, 0, 1, 0.3215686, 1,
-0.2777155, 0.3891585, -1.742651, 0, 1, 0.3294118, 1,
-0.2763574, 0.7860349, 0.2837224, 0, 1, 0.3333333, 1,
-0.2762948, -1.983692, -3.621985, 0, 1, 0.3411765, 1,
-0.2682863, -0.9301797, -3.020558, 0, 1, 0.345098, 1,
-0.2652678, -0.3908577, -2.55646, 0, 1, 0.3529412, 1,
-0.2652042, -0.7387807, -2.537249, 0, 1, 0.3568628, 1,
-0.263484, 1.066265, -0.02831147, 0, 1, 0.3647059, 1,
-0.2631395, -0.05713711, -0.2224809, 0, 1, 0.3686275, 1,
-0.2622311, 0.9920238, 0.3638649, 0, 1, 0.3764706, 1,
-0.2610838, 2.512952, 0.4061209, 0, 1, 0.3803922, 1,
-0.2610234, 1.206543, -2.30228, 0, 1, 0.3882353, 1,
-0.2580667, -0.08031967, -1.540361, 0, 1, 0.3921569, 1,
-0.2577892, 1.384836, -0.2769347, 0, 1, 0.4, 1,
-0.2558126, 0.6711691, 1.137718, 0, 1, 0.4078431, 1,
-0.2550246, 2.869877, 0.2556154, 0, 1, 0.4117647, 1,
-0.2547475, 0.5303848, -0.327368, 0, 1, 0.4196078, 1,
-0.2537903, 0.7888132, -0.09995048, 0, 1, 0.4235294, 1,
-0.2516757, -2.175446, -2.108392, 0, 1, 0.4313726, 1,
-0.2432112, -0.1304217, -2.970976, 0, 1, 0.4352941, 1,
-0.241658, 0.7881324, -0.01831164, 0, 1, 0.4431373, 1,
-0.241304, 0.7156309, -0.3396097, 0, 1, 0.4470588, 1,
-0.2377472, 1.187203, -0.3491474, 0, 1, 0.454902, 1,
-0.2369481, 0.7770075, 1.188671, 0, 1, 0.4588235, 1,
-0.2354795, 0.9852858, 0.7898045, 0, 1, 0.4666667, 1,
-0.2344429, -0.9295136, -4.008411, 0, 1, 0.4705882, 1,
-0.232278, -0.1042183, -2.666978, 0, 1, 0.4784314, 1,
-0.2317996, 0.0942046, -2.605391, 0, 1, 0.4823529, 1,
-0.2313847, 0.9816683, 0.426546, 0, 1, 0.4901961, 1,
-0.2220179, 0.3930999, -2.273024, 0, 1, 0.4941176, 1,
-0.2211262, -0.2538837, 0.2400545, 0, 1, 0.5019608, 1,
-0.219828, 2.19516, 0.1908658, 0, 1, 0.509804, 1,
-0.2145534, 0.6561066, 0.6648065, 0, 1, 0.5137255, 1,
-0.2129875, -0.8360954, -2.048113, 0, 1, 0.5215687, 1,
-0.2115095, -0.7681167, -3.701872, 0, 1, 0.5254902, 1,
-0.2112587, -2.434478, -1.978469, 0, 1, 0.5333334, 1,
-0.207352, 0.7295473, -0.36151, 0, 1, 0.5372549, 1,
-0.2040818, 0.8799468, -1.286435, 0, 1, 0.5450981, 1,
-0.2010096, 0.1524924, -1.03954, 0, 1, 0.5490196, 1,
-0.2002554, 0.1809261, -0.006067308, 0, 1, 0.5568628, 1,
-0.1985847, 0.06232813, -3.291964, 0, 1, 0.5607843, 1,
-0.1966852, 0.3101439, 0.6047236, 0, 1, 0.5686275, 1,
-0.1937707, 0.4394162, -1.540247, 0, 1, 0.572549, 1,
-0.191081, -0.04197882, -3.428189, 0, 1, 0.5803922, 1,
-0.1899527, 0.125871, -2.234263, 0, 1, 0.5843138, 1,
-0.1892399, -1.546621, -3.850676, 0, 1, 0.5921569, 1,
-0.1807936, 0.3021043, -1.090263, 0, 1, 0.5960785, 1,
-0.1802518, 1.353087, 0.1937319, 0, 1, 0.6039216, 1,
-0.1736971, 0.1923743, -0.3247041, 0, 1, 0.6117647, 1,
-0.1728134, -1.288764, -0.8171701, 0, 1, 0.6156863, 1,
-0.1723381, 0.4662727, 0.973087, 0, 1, 0.6235294, 1,
-0.1706418, -0.2238893, -1.879678, 0, 1, 0.627451, 1,
-0.1669825, -0.1039002, -1.765416, 0, 1, 0.6352941, 1,
-0.1649455, 0.9793399, 0.07465916, 0, 1, 0.6392157, 1,
-0.156814, -1.150526, -1.614682, 0, 1, 0.6470588, 1,
-0.1547316, -2.126131, -2.304651, 0, 1, 0.6509804, 1,
-0.1450991, -1.933841, -4.570563, 0, 1, 0.6588235, 1,
-0.1434408, -1.705795, -2.635578, 0, 1, 0.6627451, 1,
-0.1409945, -1.012228, -2.93332, 0, 1, 0.6705883, 1,
-0.1373927, 0.2347238, -1.259742, 0, 1, 0.6745098, 1,
-0.1364392, -0.8705782, -3.380183, 0, 1, 0.682353, 1,
-0.1346448, -0.5006883, -0.9933229, 0, 1, 0.6862745, 1,
-0.1283375, 0.001723539, -0.3034623, 0, 1, 0.6941177, 1,
-0.124252, 0.1181207, -0.3485865, 0, 1, 0.7019608, 1,
-0.118965, -0.6258705, -2.848818, 0, 1, 0.7058824, 1,
-0.1179933, 0.692494, -0.1559158, 0, 1, 0.7137255, 1,
-0.1174428, -1.515713, -2.260268, 0, 1, 0.7176471, 1,
-0.1139804, 1.206426, 1.913156, 0, 1, 0.7254902, 1,
-0.1120462, 0.6782412, 1.404832, 0, 1, 0.7294118, 1,
-0.1120163, -0.5601322, -3.11763, 0, 1, 0.7372549, 1,
-0.1109892, 1.718388, 0.7244624, 0, 1, 0.7411765, 1,
-0.1105838, -1.54555, -3.063037, 0, 1, 0.7490196, 1,
-0.107555, -0.4032623, -1.380725, 0, 1, 0.7529412, 1,
-0.105299, -0.4796065, -2.684369, 0, 1, 0.7607843, 1,
-0.1008834, 0.118722, 1.029008, 0, 1, 0.7647059, 1,
-0.1006893, 0.2489851, 0.2036928, 0, 1, 0.772549, 1,
-0.09759516, -0.2350058, -3.186668, 0, 1, 0.7764706, 1,
-0.09352111, -0.3550141, -3.759768, 0, 1, 0.7843137, 1,
-0.08629525, 0.916572, 1.438539, 0, 1, 0.7882353, 1,
-0.08465787, 0.5841315, -0.01620507, 0, 1, 0.7960784, 1,
-0.08256406, -1.964494, -2.78526, 0, 1, 0.8039216, 1,
-0.08175527, 1.969525, 0.6607431, 0, 1, 0.8078431, 1,
-0.0806187, -1.077657, -2.766188, 0, 1, 0.8156863, 1,
-0.08014626, 0.1343051, -0.6919348, 0, 1, 0.8196079, 1,
-0.07611943, -0.07556453, -0.8165591, 0, 1, 0.827451, 1,
-0.07508489, -1.333579, -4.873845, 0, 1, 0.8313726, 1,
-0.07279106, -0.1635004, -2.246118, 0, 1, 0.8392157, 1,
-0.07222266, -0.05124336, -3.109014, 0, 1, 0.8431373, 1,
-0.07015736, -1.865873, -1.438325, 0, 1, 0.8509804, 1,
-0.06246987, 0.9593366, -0.5050715, 0, 1, 0.854902, 1,
-0.0622043, -0.2312854, -4.165691, 0, 1, 0.8627451, 1,
-0.06100952, -0.1724671, -5.639193, 0, 1, 0.8666667, 1,
-0.05979998, -0.3586637, -2.050747, 0, 1, 0.8745098, 1,
-0.04816473, -0.4690878, -3.641369, 0, 1, 0.8784314, 1,
-0.04768606, 0.3504182, -1.627887, 0, 1, 0.8862745, 1,
-0.04593607, 1.252441, 1.283272, 0, 1, 0.8901961, 1,
-0.0438392, 0.8567461, -0.6977413, 0, 1, 0.8980392, 1,
-0.04246994, -0.01852758, -1.694664, 0, 1, 0.9058824, 1,
-0.04243849, 2.19903, 0.08450821, 0, 1, 0.9098039, 1,
-0.0387575, -0.5975338, -2.776936, 0, 1, 0.9176471, 1,
-0.03713825, 0.1898598, -0.8936762, 0, 1, 0.9215686, 1,
-0.03233293, 2.644398, 0.2643287, 0, 1, 0.9294118, 1,
-0.02957077, 1.433083, -0.3533339, 0, 1, 0.9333333, 1,
-0.02577806, -0.7111933, -3.464687, 0, 1, 0.9411765, 1,
-0.01514919, 1.502766, -0.3862102, 0, 1, 0.945098, 1,
-0.01309492, 1.958554, 0.3688152, 0, 1, 0.9529412, 1,
-0.01009243, 1.09426, -0.415971, 0, 1, 0.9568627, 1,
-0.001893696, 1.134501, -0.2782263, 0, 1, 0.9647059, 1,
-0.0006514011, -0.6327567, -2.373103, 0, 1, 0.9686275, 1,
0.003204099, 1.614881, 0.7177391, 0, 1, 0.9764706, 1,
0.005057342, -0.04748496, 2.643621, 0, 1, 0.9803922, 1,
0.01262921, -0.3366281, 0.8800017, 0, 1, 0.9882353, 1,
0.016492, -0.6804147, 3.500502, 0, 1, 0.9921569, 1,
0.02141874, -0.2287235, 0.9309493, 0, 1, 1, 1,
0.02649988, 0.94777, -0.3624707, 0, 0.9921569, 1, 1,
0.02698602, -1.875139, 3.224122, 0, 0.9882353, 1, 1,
0.02739594, -0.1999516, 2.502451, 0, 0.9803922, 1, 1,
0.02933029, 1.9595, -0.2408978, 0, 0.9764706, 1, 1,
0.03143336, -3.027478, 2.748457, 0, 0.9686275, 1, 1,
0.03444577, -1.51963, 2.928958, 0, 0.9647059, 1, 1,
0.0385513, 0.3860347, 1.165422, 0, 0.9568627, 1, 1,
0.04221052, -0.09413566, 3.183874, 0, 0.9529412, 1, 1,
0.0473808, 1.552693, 0.8772779, 0, 0.945098, 1, 1,
0.04987791, -2.396293, 2.710605, 0, 0.9411765, 1, 1,
0.06187208, -0.2079401, 2.820863, 0, 0.9333333, 1, 1,
0.0632831, -1.664273, 1.33127, 0, 0.9294118, 1, 1,
0.06425117, -0.7443824, 3.522732, 0, 0.9215686, 1, 1,
0.06534749, 1.188231, -0.6337594, 0, 0.9176471, 1, 1,
0.06698006, 0.4585283, 0.5359578, 0, 0.9098039, 1, 1,
0.06716112, -0.1763159, 2.972338, 0, 0.9058824, 1, 1,
0.06787632, -0.02303073, 1.020304, 0, 0.8980392, 1, 1,
0.07041986, -0.1604533, 3.14962, 0, 0.8901961, 1, 1,
0.07052819, 1.566399, 0.390214, 0, 0.8862745, 1, 1,
0.0743106, -1.991642, 1.29822, 0, 0.8784314, 1, 1,
0.07844382, 0.4424125, 0.932579, 0, 0.8745098, 1, 1,
0.07912582, -1.119888, 3.583336, 0, 0.8666667, 1, 1,
0.08038792, 0.3244682, 1.351417, 0, 0.8627451, 1, 1,
0.08229733, -0.3602536, 2.137389, 0, 0.854902, 1, 1,
0.08331378, 0.01728562, 0.6967961, 0, 0.8509804, 1, 1,
0.08461586, -1.102907, 2.153957, 0, 0.8431373, 1, 1,
0.08546712, -2.056461, 2.830884, 0, 0.8392157, 1, 1,
0.08757674, -0.7086027, 1.601125, 0, 0.8313726, 1, 1,
0.08961231, -0.2617635, 3.158906, 0, 0.827451, 1, 1,
0.08999195, -0.5507774, 1.721642, 0, 0.8196079, 1, 1,
0.09145217, 0.3761398, 0.9222848, 0, 0.8156863, 1, 1,
0.09286816, -1.165035, 2.468012, 0, 0.8078431, 1, 1,
0.0933703, 0.5138353, -0.8015316, 0, 0.8039216, 1, 1,
0.09448857, -0.2352709, 0.4593451, 0, 0.7960784, 1, 1,
0.09671686, -0.7284905, 3.814783, 0, 0.7882353, 1, 1,
0.09801223, 1.814643, -0.2357349, 0, 0.7843137, 1, 1,
0.1011402, -1.427536, 3.316075, 0, 0.7764706, 1, 1,
0.1037782, 0.2003369, -1.160104, 0, 0.772549, 1, 1,
0.1045585, 2.544356, 1.54447, 0, 0.7647059, 1, 1,
0.1107995, 0.05990146, 1.221055, 0, 0.7607843, 1, 1,
0.1117004, -0.01327989, 1.734393, 0, 0.7529412, 1, 1,
0.1121368, 1.560742, 0.7618995, 0, 0.7490196, 1, 1,
0.117232, 0.2803113, 1.299717, 0, 0.7411765, 1, 1,
0.1239708, 0.709703, -1.304447, 0, 0.7372549, 1, 1,
0.1240031, -2.305315, 3.168855, 0, 0.7294118, 1, 1,
0.1268729, -0.5005995, 3.640401, 0, 0.7254902, 1, 1,
0.1274735, 1.261216, -0.7856961, 0, 0.7176471, 1, 1,
0.1308745, 0.7431934, 2.176323, 0, 0.7137255, 1, 1,
0.1340065, 1.909007, 0.5901207, 0, 0.7058824, 1, 1,
0.1361207, -1.150036, 2.121163, 0, 0.6980392, 1, 1,
0.141273, 0.7514916, 1.291376, 0, 0.6941177, 1, 1,
0.1459119, 2.343192, -0.4825054, 0, 0.6862745, 1, 1,
0.1472463, 0.3839758, 1.474333, 0, 0.682353, 1, 1,
0.1488735, -0.2124138, 2.664889, 0, 0.6745098, 1, 1,
0.1509304, -0.7619011, 3.41206, 0, 0.6705883, 1, 1,
0.1583378, -1.862919, 4.370535, 0, 0.6627451, 1, 1,
0.1607921, 1.184352, 0.9650674, 0, 0.6588235, 1, 1,
0.1619729, -0.03548736, 0.8981604, 0, 0.6509804, 1, 1,
0.1620668, -0.5400497, 1.409578, 0, 0.6470588, 1, 1,
0.1636751, -0.9050655, 3.907864, 0, 0.6392157, 1, 1,
0.1637337, -0.76699, 3.491055, 0, 0.6352941, 1, 1,
0.1689183, 1.374911, 1.166036, 0, 0.627451, 1, 1,
0.1770063, 0.3924526, 0.9555248, 0, 0.6235294, 1, 1,
0.1797744, -1.641235, 2.168678, 0, 0.6156863, 1, 1,
0.1801298, 1.061914, -1.035222, 0, 0.6117647, 1, 1,
0.1850004, -1.190357, 2.613095, 0, 0.6039216, 1, 1,
0.1855816, -0.0253623, 2.318537, 0, 0.5960785, 1, 1,
0.1871831, -0.1877109, 2.561113, 0, 0.5921569, 1, 1,
0.1875271, -0.1346282, 1.856382, 0, 0.5843138, 1, 1,
0.1901835, 0.3440802, 1.323726, 0, 0.5803922, 1, 1,
0.1908171, -1.276814, 2.770285, 0, 0.572549, 1, 1,
0.1926512, -0.7095003, 3.660443, 0, 0.5686275, 1, 1,
0.1936841, -0.4260625, 3.235641, 0, 0.5607843, 1, 1,
0.1947576, 0.1570891, 1.048136, 0, 0.5568628, 1, 1,
0.1960153, 0.3259575, 1.738629, 0, 0.5490196, 1, 1,
0.1976508, -0.3243791, 1.913011, 0, 0.5450981, 1, 1,
0.1979087, -1.220158, 4.684262, 0, 0.5372549, 1, 1,
0.197926, 0.7836226, -0.7150624, 0, 0.5333334, 1, 1,
0.1987748, -1.494361, 2.327804, 0, 0.5254902, 1, 1,
0.1993927, -0.07327807, 1.499478, 0, 0.5215687, 1, 1,
0.2001714, -0.7969617, 2.541857, 0, 0.5137255, 1, 1,
0.2013528, 0.00427417, 0.2707544, 0, 0.509804, 1, 1,
0.2093297, -0.4921696, 3.469767, 0, 0.5019608, 1, 1,
0.209383, 0.1532016, 2.425279, 0, 0.4941176, 1, 1,
0.2114316, -0.1539938, 1.62251, 0, 0.4901961, 1, 1,
0.2116351, -0.2940916, 2.8353, 0, 0.4823529, 1, 1,
0.2191348, 1.465872, 1.332426, 0, 0.4784314, 1, 1,
0.2191754, -0.6370224, 3.674728, 0, 0.4705882, 1, 1,
0.2205232, -1.524814, 3.702127, 0, 0.4666667, 1, 1,
0.2241234, 0.9648309, 1.258955, 0, 0.4588235, 1, 1,
0.231116, 1.546223, 1.163928, 0, 0.454902, 1, 1,
0.2313559, 0.3065654, 0.4049441, 0, 0.4470588, 1, 1,
0.2319017, -0.6642037, 3.655866, 0, 0.4431373, 1, 1,
0.2353085, 0.4668647, 1.355465, 0, 0.4352941, 1, 1,
0.2358917, -1.32915, 2.393665, 0, 0.4313726, 1, 1,
0.2419802, -0.3356827, 2.292158, 0, 0.4235294, 1, 1,
0.2546764, -0.2668669, 0.7956107, 0, 0.4196078, 1, 1,
0.2601886, -1.515201, 2.764222, 0, 0.4117647, 1, 1,
0.261341, 0.4967231, 0.326811, 0, 0.4078431, 1, 1,
0.2635076, -0.8611534, 4.142892, 0, 0.4, 1, 1,
0.2675655, 0.1294874, 1.226319, 0, 0.3921569, 1, 1,
0.2675974, 0.8492287, 1.207191, 0, 0.3882353, 1, 1,
0.268154, 0.002400149, 1.453875, 0, 0.3803922, 1, 1,
0.2689518, 0.5908319, -0.4200613, 0, 0.3764706, 1, 1,
0.2781537, 0.187861, 2.616427, 0, 0.3686275, 1, 1,
0.2819405, -1.074532, 4.354605, 0, 0.3647059, 1, 1,
0.2831362, -1.111236, 2.095891, 0, 0.3568628, 1, 1,
0.288147, -1.269476, -0.06290177, 0, 0.3529412, 1, 1,
0.3062153, -1.388437, 3.542804, 0, 0.345098, 1, 1,
0.3076468, -0.4512938, 3.280153, 0, 0.3411765, 1, 1,
0.3087091, 2.406994, -0.4008019, 0, 0.3333333, 1, 1,
0.31341, 0.1625784, 1.433659, 0, 0.3294118, 1, 1,
0.3136838, 0.7378989, -0.6253344, 0, 0.3215686, 1, 1,
0.3169143, 1.87807, -0.4933707, 0, 0.3176471, 1, 1,
0.3228461, -0.7245051, 2.76422, 0, 0.3098039, 1, 1,
0.3256326, -0.6896066, 2.401285, 0, 0.3058824, 1, 1,
0.3294207, -0.2669087, 2.17872, 0, 0.2980392, 1, 1,
0.3362084, 0.9710035, 0.6870782, 0, 0.2901961, 1, 1,
0.3437754, -1.143405, 1.551527, 0, 0.2862745, 1, 1,
0.3483359, 0.5601771, 1.190481, 0, 0.2784314, 1, 1,
0.3500158, 1.279214, 0.7845767, 0, 0.2745098, 1, 1,
0.3502195, 0.1329345, 0.386378, 0, 0.2666667, 1, 1,
0.3507056, -0.7726133, 2.574755, 0, 0.2627451, 1, 1,
0.3509187, 0.4503832, 0.9524305, 0, 0.254902, 1, 1,
0.3520432, 0.3329377, 1.09557, 0, 0.2509804, 1, 1,
0.3525991, 0.1441783, 2.162935, 0, 0.2431373, 1, 1,
0.3532154, 0.2116729, 0.9201142, 0, 0.2392157, 1, 1,
0.3533833, -2.13699, 2.967304, 0, 0.2313726, 1, 1,
0.3538515, -0.3277726, 1.38448, 0, 0.227451, 1, 1,
0.36608, -0.6691294, 3.270195, 0, 0.2196078, 1, 1,
0.3664797, 0.47334, -0.03462565, 0, 0.2156863, 1, 1,
0.369015, -1.127069, 3.858043, 0, 0.2078431, 1, 1,
0.3704826, 0.2220811, 0.8502923, 0, 0.2039216, 1, 1,
0.3708772, -1.011237, 2.725994, 0, 0.1960784, 1, 1,
0.3738764, -0.8158722, 2.507445, 0, 0.1882353, 1, 1,
0.3772496, -1.657491, 3.447092, 0, 0.1843137, 1, 1,
0.3821578, -0.8316832, 2.361866, 0, 0.1764706, 1, 1,
0.3890355, 0.4806911, 0.4733323, 0, 0.172549, 1, 1,
0.3897077, 0.1421021, 2.84506, 0, 0.1647059, 1, 1,
0.3922416, -0.7279601, 2.426857, 0, 0.1607843, 1, 1,
0.3934139, -0.02518441, 2.98603, 0, 0.1529412, 1, 1,
0.3981876, 0.2818298, 2.04554, 0, 0.1490196, 1, 1,
0.4024766, 0.9241349, 0.03962859, 0, 0.1411765, 1, 1,
0.4042034, -0.2430643, 3.326288, 0, 0.1372549, 1, 1,
0.407076, 0.6228089, 0.4702229, 0, 0.1294118, 1, 1,
0.4098503, -0.5220154, 1.837285, 0, 0.1254902, 1, 1,
0.4103088, -0.4848453, 3.036221, 0, 0.1176471, 1, 1,
0.4163784, 0.7569149, 0.9984003, 0, 0.1137255, 1, 1,
0.4225987, 0.2517558, 0.6518991, 0, 0.1058824, 1, 1,
0.4286048, -0.4964509, 2.663878, 0, 0.09803922, 1, 1,
0.4320959, 0.4118806, 0.4116274, 0, 0.09411765, 1, 1,
0.440899, 0.3953366, -0.1985405, 0, 0.08627451, 1, 1,
0.4412981, 0.418446, -0.01246181, 0, 0.08235294, 1, 1,
0.4427146, -0.5316986, 1.541935, 0, 0.07450981, 1, 1,
0.4429414, 1.019881, -0.2766333, 0, 0.07058824, 1, 1,
0.4572716, -0.7926623, 2.556999, 0, 0.0627451, 1, 1,
0.4578416, 0.7214684, -0.1670404, 0, 0.05882353, 1, 1,
0.4585893, -0.2913789, 1.57385, 0, 0.05098039, 1, 1,
0.4642274, 1.449347, -0.6183861, 0, 0.04705882, 1, 1,
0.4660706, 0.6342277, 1.026639, 0, 0.03921569, 1, 1,
0.4707108, 0.5831456, 2.554791, 0, 0.03529412, 1, 1,
0.4716327, 1.79037, -0.6550429, 0, 0.02745098, 1, 1,
0.473775, -1.242993, 1.778736, 0, 0.02352941, 1, 1,
0.4746387, -0.01491602, 2.199446, 0, 0.01568628, 1, 1,
0.4764479, 1.597419, 1.379128, 0, 0.01176471, 1, 1,
0.4795372, 1.373457, -0.6413466, 0, 0.003921569, 1, 1,
0.4803217, -0.9426594, 2.316535, 0.003921569, 0, 1, 1,
0.4807485, -0.2081703, 2.61194, 0.007843138, 0, 1, 1,
0.4868087, 1.684498, 2.209368, 0.01568628, 0, 1, 1,
0.4905797, -0.9291401, 2.00348, 0.01960784, 0, 1, 1,
0.4940131, -0.7542328, 3.788059, 0.02745098, 0, 1, 1,
0.4941055, 0.6374547, 1.714477, 0.03137255, 0, 1, 1,
0.4957565, -2.701306, 3.738576, 0.03921569, 0, 1, 1,
0.4984173, 0.6024072, 0.02731725, 0.04313726, 0, 1, 1,
0.4989058, -0.82845, 3.079281, 0.05098039, 0, 1, 1,
0.5001103, 0.5101051, -1.052962, 0.05490196, 0, 1, 1,
0.5005597, 0.7950046, 0.3904732, 0.0627451, 0, 1, 1,
0.505708, -1.868311, 1.200901, 0.06666667, 0, 1, 1,
0.510194, -1.241575, 3.424918, 0.07450981, 0, 1, 1,
0.5109287, 1.597597, -0.8898132, 0.07843138, 0, 1, 1,
0.5185473, 1.623113, 2.350686, 0.08627451, 0, 1, 1,
0.5232296, -1.308372, 3.938229, 0.09019608, 0, 1, 1,
0.5241415, 0.6456704, -0.2473276, 0.09803922, 0, 1, 1,
0.5248636, 1.634808, 1.96595, 0.1058824, 0, 1, 1,
0.5305255, 1.669727, -0.6942458, 0.1098039, 0, 1, 1,
0.5316808, -0.9382739, 0.1257357, 0.1176471, 0, 1, 1,
0.5379938, 0.7154255, -0.06618893, 0.1215686, 0, 1, 1,
0.5486235, -0.2547207, 3.557675, 0.1294118, 0, 1, 1,
0.5570482, -0.7409015, 2.606013, 0.1333333, 0, 1, 1,
0.5596565, -0.9226285, 4.397482, 0.1411765, 0, 1, 1,
0.5626227, -0.3379577, 3.564861, 0.145098, 0, 1, 1,
0.5667056, -1.850991, 1.190552, 0.1529412, 0, 1, 1,
0.5671807, -0.3294697, 1.332371, 0.1568628, 0, 1, 1,
0.5707808, -0.7692536, 1.649404, 0.1647059, 0, 1, 1,
0.5717647, -0.9201505, 3.563639, 0.1686275, 0, 1, 1,
0.5735551, 0.5975271, 1.153896, 0.1764706, 0, 1, 1,
0.5740863, -0.1445798, 1.457162, 0.1803922, 0, 1, 1,
0.5758337, -0.572476, 0.629474, 0.1882353, 0, 1, 1,
0.5766171, -0.8311061, 4.001162, 0.1921569, 0, 1, 1,
0.5811464, -1.162631, 3.489609, 0.2, 0, 1, 1,
0.5823029, 0.8530667, -0.9674315, 0.2078431, 0, 1, 1,
0.5832813, 2.883455, -0.925948, 0.2117647, 0, 1, 1,
0.5857344, 0.06494343, -0.01836988, 0.2196078, 0, 1, 1,
0.5862904, 0.4252684, 0.8773556, 0.2235294, 0, 1, 1,
0.5893577, -0.4965549, 0.4323666, 0.2313726, 0, 1, 1,
0.589924, -1.421479, 2.219703, 0.2352941, 0, 1, 1,
0.5903176, 1.440219, 1.397971, 0.2431373, 0, 1, 1,
0.5921075, -0.4287612, 1.446373, 0.2470588, 0, 1, 1,
0.5998201, -0.8066396, 2.836202, 0.254902, 0, 1, 1,
0.6055149, 0.2854405, 0.3132638, 0.2588235, 0, 1, 1,
0.605972, 0.643613, 2.52032, 0.2666667, 0, 1, 1,
0.6178821, 0.1845604, 2.672983, 0.2705882, 0, 1, 1,
0.6265281, -1.198762, 0.7449073, 0.2784314, 0, 1, 1,
0.6305346, -0.1897455, 2.774305, 0.282353, 0, 1, 1,
0.6321383, 0.6937756, 0.4786138, 0.2901961, 0, 1, 1,
0.6399888, 1.805353, 0.3976297, 0.2941177, 0, 1, 1,
0.645669, 1.477431, 0.6838368, 0.3019608, 0, 1, 1,
0.6481062, -0.8778583, 2.753025, 0.3098039, 0, 1, 1,
0.6489192, 1.042979, 0.3996851, 0.3137255, 0, 1, 1,
0.6489323, -0.9766536, 2.817449, 0.3215686, 0, 1, 1,
0.6514077, 1.973562, 1.338549, 0.3254902, 0, 1, 1,
0.6517612, -0.5998715, 2.534394, 0.3333333, 0, 1, 1,
0.6548104, -0.7539642, 3.52643, 0.3372549, 0, 1, 1,
0.6610556, 0.4311757, 1.795428, 0.345098, 0, 1, 1,
0.6693197, 0.7978818, 0.5993087, 0.3490196, 0, 1, 1,
0.6708494, -0.8906257, 1.732197, 0.3568628, 0, 1, 1,
0.6740215, -0.6753399, 1.915055, 0.3607843, 0, 1, 1,
0.6761357, 0.4954604, -0.5388168, 0.3686275, 0, 1, 1,
0.6813995, 1.916861, -0.1449914, 0.372549, 0, 1, 1,
0.6836159, 1.161396, 0.5402808, 0.3803922, 0, 1, 1,
0.6841412, 0.9310308, 0.7623332, 0.3843137, 0, 1, 1,
0.6947467, -0.8273879, 1.59021, 0.3921569, 0, 1, 1,
0.6951305, 2.229803, 1.299312, 0.3960784, 0, 1, 1,
0.6975384, -0.7886525, 4.274555, 0.4039216, 0, 1, 1,
0.6982376, 1.469406, 2.083578, 0.4117647, 0, 1, 1,
0.70654, -1.698933, 2.338261, 0.4156863, 0, 1, 1,
0.7087215, -0.7121299, 1.50325, 0.4235294, 0, 1, 1,
0.7091219, -1.94328, 4.11849, 0.427451, 0, 1, 1,
0.709461, -0.9345331, 2.162906, 0.4352941, 0, 1, 1,
0.7145026, -1.808612, 3.395748, 0.4392157, 0, 1, 1,
0.7202215, 0.07603928, 0.9897899, 0.4470588, 0, 1, 1,
0.7211355, 0.08361859, 1.356627, 0.4509804, 0, 1, 1,
0.7220856, 1.217817, -1.142529, 0.4588235, 0, 1, 1,
0.7258094, -1.947647, 3.052736, 0.4627451, 0, 1, 1,
0.7291836, 1.011562, 2.300827, 0.4705882, 0, 1, 1,
0.7404533, 0.2459278, 1.790636, 0.4745098, 0, 1, 1,
0.746331, 1.343281, 0.06670552, 0.4823529, 0, 1, 1,
0.7470077, 0.1228219, 0.0153414, 0.4862745, 0, 1, 1,
0.7474756, -0.9144725, 1.700904, 0.4941176, 0, 1, 1,
0.7498434, -0.4505642, 1.677618, 0.5019608, 0, 1, 1,
0.7522654, -0.748716, 2.337401, 0.5058824, 0, 1, 1,
0.755853, -0.467532, 1.186005, 0.5137255, 0, 1, 1,
0.7579739, 0.4084781, 1.169724, 0.5176471, 0, 1, 1,
0.7591389, 0.4996626, 1.052004, 0.5254902, 0, 1, 1,
0.7606919, -0.05839007, 2.126898, 0.5294118, 0, 1, 1,
0.7619483, 0.5456242, 0.5492399, 0.5372549, 0, 1, 1,
0.7624764, 0.3695713, 0.422182, 0.5411765, 0, 1, 1,
0.7655954, 0.9671594, 0.2800747, 0.5490196, 0, 1, 1,
0.7714024, -0.9097027, 2.054557, 0.5529412, 0, 1, 1,
0.7741171, 0.1445506, 1.087671, 0.5607843, 0, 1, 1,
0.7784067, 0.000343092, -0.07405483, 0.5647059, 0, 1, 1,
0.7856864, -0.6627186, 0.5867191, 0.572549, 0, 1, 1,
0.800932, -0.1258301, 2.09556, 0.5764706, 0, 1, 1,
0.8019851, 0.6230342, 0.963587, 0.5843138, 0, 1, 1,
0.8030729, 0.1161731, 2.295215, 0.5882353, 0, 1, 1,
0.8058714, 0.3075337, -0.9690034, 0.5960785, 0, 1, 1,
0.8106372, -2.418284, 2.483229, 0.6039216, 0, 1, 1,
0.8113273, 0.2356437, 0.7972589, 0.6078432, 0, 1, 1,
0.8151159, -1.01524, 0.175163, 0.6156863, 0, 1, 1,
0.8162395, -0.744308, 2.778153, 0.6196079, 0, 1, 1,
0.8162704, 0.9745345, 0.8823509, 0.627451, 0, 1, 1,
0.816412, -0.1415347, 2.447221, 0.6313726, 0, 1, 1,
0.8172696, -0.2459571, 2.052804, 0.6392157, 0, 1, 1,
0.8339691, 1.096737, 2.192955, 0.6431373, 0, 1, 1,
0.8359948, 0.2317721, 2.324934, 0.6509804, 0, 1, 1,
0.8388097, -0.4469506, 2.833578, 0.654902, 0, 1, 1,
0.8392758, -1.575121, 4.3467, 0.6627451, 0, 1, 1,
0.8424186, 1.20131, 1.984717, 0.6666667, 0, 1, 1,
0.8449128, 1.301819, 0.6113107, 0.6745098, 0, 1, 1,
0.8458407, 0.6464338, -0.1521616, 0.6784314, 0, 1, 1,
0.8469895, -0.8222784, 2.332366, 0.6862745, 0, 1, 1,
0.8478268, 1.029327, 0.08083524, 0.6901961, 0, 1, 1,
0.8487319, -0.2042835, 4.190987, 0.6980392, 0, 1, 1,
0.849049, -0.4600165, -0.2195377, 0.7058824, 0, 1, 1,
0.8564466, 0.3113626, 1.154882, 0.7098039, 0, 1, 1,
0.8580142, 0.5732393, 2.392191, 0.7176471, 0, 1, 1,
0.8585818, 1.248079, -0.4730598, 0.7215686, 0, 1, 1,
0.864575, -0.7203689, 0.9978279, 0.7294118, 0, 1, 1,
0.8708966, -1.926337, 2.818408, 0.7333333, 0, 1, 1,
0.8718457, 1.070649, 1.689322, 0.7411765, 0, 1, 1,
0.8730128, 1.167583, 1.194411, 0.7450981, 0, 1, 1,
0.8759812, -0.6932042, 0.9701133, 0.7529412, 0, 1, 1,
0.8779862, -1.488522, 3.521024, 0.7568628, 0, 1, 1,
0.884014, -0.1392324, 4.102506, 0.7647059, 0, 1, 1,
0.8871772, -2.38278, 3.405325, 0.7686275, 0, 1, 1,
0.8990704, 1.086246, 2.301291, 0.7764706, 0, 1, 1,
0.9007361, 0.8447259, 0.7281169, 0.7803922, 0, 1, 1,
0.915782, -1.307215, 2.128148, 0.7882353, 0, 1, 1,
0.9170095, 2.733727, -0.2417927, 0.7921569, 0, 1, 1,
0.9170801, 1.747313, -0.5059319, 0.8, 0, 1, 1,
0.9179555, 1.233504, -0.405693, 0.8078431, 0, 1, 1,
0.9256056, 0.7623556, 1.568106, 0.8117647, 0, 1, 1,
0.9283487, 1.474564, 0.7073604, 0.8196079, 0, 1, 1,
0.9320407, 2.385488, 0.2827567, 0.8235294, 0, 1, 1,
0.9390681, 0.8538889, 0.5266365, 0.8313726, 0, 1, 1,
0.9399348, 0.6410549, -0.001337809, 0.8352941, 0, 1, 1,
0.9432906, 0.3585687, 1.619368, 0.8431373, 0, 1, 1,
0.9608567, 1.063877, 0.5004717, 0.8470588, 0, 1, 1,
0.9661283, 0.8311178, -0.104001, 0.854902, 0, 1, 1,
0.9694976, -0.6451266, 0.9587574, 0.8588235, 0, 1, 1,
0.9725008, 0.4674214, 2.664261, 0.8666667, 0, 1, 1,
0.9747036, 0.1310688, 0.06346811, 0.8705882, 0, 1, 1,
0.9776568, -0.487093, 1.916015, 0.8784314, 0, 1, 1,
0.9781181, -0.3266604, 2.219889, 0.8823529, 0, 1, 1,
0.9846504, -0.4977248, 1.366516, 0.8901961, 0, 1, 1,
0.9858782, 0.5829046, 1.455388, 0.8941177, 0, 1, 1,
0.986986, -1.050501, 2.551579, 0.9019608, 0, 1, 1,
0.9918967, 1.10546, 1.74105, 0.9098039, 0, 1, 1,
0.9954897, 1.071744, 1.259955, 0.9137255, 0, 1, 1,
1.000626, 0.4262876, 0.336307, 0.9215686, 0, 1, 1,
1.004411, 0.6720426, 0.2213246, 0.9254902, 0, 1, 1,
1.00543, 0.2903302, 1.358855, 0.9333333, 0, 1, 1,
1.005687, 1.906962, 0.1092721, 0.9372549, 0, 1, 1,
1.011448, 0.424602, 0.03743873, 0.945098, 0, 1, 1,
1.012065, 0.7489293, 1.169849, 0.9490196, 0, 1, 1,
1.013584, 0.3732001, 1.737859, 0.9568627, 0, 1, 1,
1.023584, 0.3967892, 2.156148, 0.9607843, 0, 1, 1,
1.040483, -0.8349328, 2.229601, 0.9686275, 0, 1, 1,
1.043472, -1.310364, 1.86426, 0.972549, 0, 1, 1,
1.04836, 0.4253691, 2.071454, 0.9803922, 0, 1, 1,
1.049143, 2.100422, -0.856746, 0.9843137, 0, 1, 1,
1.051564, -1.112025, 0.6002504, 0.9921569, 0, 1, 1,
1.061113, -1.316174, 2.434664, 0.9960784, 0, 1, 1,
1.067562, 0.1752884, -0.4951187, 1, 0, 0.9960784, 1,
1.072183, 0.2835192, 3.251818, 1, 0, 0.9882353, 1,
1.072508, -0.1328991, 1.898606, 1, 0, 0.9843137, 1,
1.073413, 0.4504902, 1.83998, 1, 0, 0.9764706, 1,
1.081171, 0.2156341, 3.187006, 1, 0, 0.972549, 1,
1.083756, 0.7049381, 0.9103392, 1, 0, 0.9647059, 1,
1.089257, 2.230998, -0.5862262, 1, 0, 0.9607843, 1,
1.09448, -0.7032394, 3.031216, 1, 0, 0.9529412, 1,
1.102683, -0.3005933, 2.290363, 1, 0, 0.9490196, 1,
1.106161, -0.2032188, 0.9941839, 1, 0, 0.9411765, 1,
1.106468, -0.6049371, 3.196161, 1, 0, 0.9372549, 1,
1.116924, -0.0308088, 3.316082, 1, 0, 0.9294118, 1,
1.118088, 0.05607705, 1.561251, 1, 0, 0.9254902, 1,
1.119429, -1.079192, 3.32354, 1, 0, 0.9176471, 1,
1.12126, 0.4469334, 1.479638, 1, 0, 0.9137255, 1,
1.121682, -0.5326727, 1.730722, 1, 0, 0.9058824, 1,
1.123695, 1.09853, 0.548405, 1, 0, 0.9019608, 1,
1.13033, 0.5322477, 2.393989, 1, 0, 0.8941177, 1,
1.133106, 0.2899194, 2.339927, 1, 0, 0.8862745, 1,
1.150949, -0.1705547, 0.9746441, 1, 0, 0.8823529, 1,
1.152452, -0.8991489, 1.675667, 1, 0, 0.8745098, 1,
1.158567, -0.709228, 2.017542, 1, 0, 0.8705882, 1,
1.161437, -0.570657, 2.23916, 1, 0, 0.8627451, 1,
1.171392, 1.204892, -0.6350888, 1, 0, 0.8588235, 1,
1.18, 1.146395, 0.5122122, 1, 0, 0.8509804, 1,
1.188747, 1.323624, 0.1783267, 1, 0, 0.8470588, 1,
1.190329, 0.3257625, 1.330124, 1, 0, 0.8392157, 1,
1.192298, 0.110016, 0.7881899, 1, 0, 0.8352941, 1,
1.200171, 1.403962, 0.4128985, 1, 0, 0.827451, 1,
1.200768, 0.5555955, 0.7117322, 1, 0, 0.8235294, 1,
1.201572, -0.5609989, 3.363407, 1, 0, 0.8156863, 1,
1.204627, 0.3726207, 1.070547, 1, 0, 0.8117647, 1,
1.206062, 0.1911518, 1.169778, 1, 0, 0.8039216, 1,
1.207224, -0.01682012, 2.496768, 1, 0, 0.7960784, 1,
1.207254, -0.1710785, 0.1923425, 1, 0, 0.7921569, 1,
1.214174, -0.4673521, 4.116638, 1, 0, 0.7843137, 1,
1.214906, 0.8144972, 1.33238, 1, 0, 0.7803922, 1,
1.219213, 1.428749, -0.4992045, 1, 0, 0.772549, 1,
1.220853, -0.9649677, 1.792328, 1, 0, 0.7686275, 1,
1.222169, -0.2556935, 2.402673, 1, 0, 0.7607843, 1,
1.22289, -0.2941718, 0.9586918, 1, 0, 0.7568628, 1,
1.222998, -0.265337, 1.674436, 1, 0, 0.7490196, 1,
1.223482, 2.448037, -1.259663, 1, 0, 0.7450981, 1,
1.22631, 1.893736, 2.105101, 1, 0, 0.7372549, 1,
1.227944, 0.1175289, 2.208388, 1, 0, 0.7333333, 1,
1.233683, 1.467882, 1.04967, 1, 0, 0.7254902, 1,
1.234471, 0.5514036, 1.453837, 1, 0, 0.7215686, 1,
1.236127, 0.5331472, 1.168924, 1, 0, 0.7137255, 1,
1.236199, -0.3478142, 1.225496, 1, 0, 0.7098039, 1,
1.256064, -1.225559, 3.689958, 1, 0, 0.7019608, 1,
1.257124, 0.8091215, 0.09645747, 1, 0, 0.6941177, 1,
1.258382, 1.090622, 1.208927, 1, 0, 0.6901961, 1,
1.260909, -0.6280758, 1.941277, 1, 0, 0.682353, 1,
1.262469, -0.2128205, 2.26952, 1, 0, 0.6784314, 1,
1.280225, -0.3448209, 0.6246844, 1, 0, 0.6705883, 1,
1.281785, -0.00108856, 1.942225, 1, 0, 0.6666667, 1,
1.287136, 0.9040024, 0.00628254, 1, 0, 0.6588235, 1,
1.289798, 0.3025229, 0.9092894, 1, 0, 0.654902, 1,
1.290883, -1.786064, 1.946479, 1, 0, 0.6470588, 1,
1.309922, 0.9988297, 2.925624, 1, 0, 0.6431373, 1,
1.311513, 0.1996891, 0.7579389, 1, 0, 0.6352941, 1,
1.312522, 1.167963, 1.82487, 1, 0, 0.6313726, 1,
1.324016, 1.207424, 0.6800438, 1, 0, 0.6235294, 1,
1.324679, -1.381819, 0.1168496, 1, 0, 0.6196079, 1,
1.328477, 1.501846, 0.4832754, 1, 0, 0.6117647, 1,
1.33162, 0.2614216, 0.8504177, 1, 0, 0.6078432, 1,
1.331679, -1.818318, 3.836379, 1, 0, 0.6, 1,
1.340065, 0.5473506, 0.1238922, 1, 0, 0.5921569, 1,
1.340735, 1.699915, -1.320769, 1, 0, 0.5882353, 1,
1.349749, -1.066539, 0.3328965, 1, 0, 0.5803922, 1,
1.353262, 1.122927, -0.2052775, 1, 0, 0.5764706, 1,
1.363508, -0.4249785, 3.105208, 1, 0, 0.5686275, 1,
1.365073, -0.9034859, 0.8826979, 1, 0, 0.5647059, 1,
1.373926, 0.1715183, 1.197716, 1, 0, 0.5568628, 1,
1.374521, 1.35995, 1.139625, 1, 0, 0.5529412, 1,
1.385184, 1.230994, 1.734409, 1, 0, 0.5450981, 1,
1.385829, 0.2845865, 1.753564, 1, 0, 0.5411765, 1,
1.387054, 0.9911245, 0.8949904, 1, 0, 0.5333334, 1,
1.391876, 0.6700899, 0.1787676, 1, 0, 0.5294118, 1,
1.392636, 0.8506052, 1.519967, 1, 0, 0.5215687, 1,
1.397973, -0.05791126, -0.102814, 1, 0, 0.5176471, 1,
1.400999, 0.5442075, -0.7585568, 1, 0, 0.509804, 1,
1.401349, -0.2334819, 1.221263, 1, 0, 0.5058824, 1,
1.402139, 0.8189644, 1.486231, 1, 0, 0.4980392, 1,
1.402503, 0.6879575, 2.033378, 1, 0, 0.4901961, 1,
1.405325, -0.6708806, 0.04206377, 1, 0, 0.4862745, 1,
1.411436, -0.0027219, 3.7078, 1, 0, 0.4784314, 1,
1.41387, 1.537376, 1.045032, 1, 0, 0.4745098, 1,
1.428377, -1.003168, 1.221859, 1, 0, 0.4666667, 1,
1.448907, -0.9754953, 3.998343, 1, 0, 0.4627451, 1,
1.44926, -0.2858399, 0.7213535, 1, 0, 0.454902, 1,
1.449891, 0.7587231, 1.650537, 1, 0, 0.4509804, 1,
1.45351, -0.2319682, 1.489064, 1, 0, 0.4431373, 1,
1.456423, -1.313781, 2.813383, 1, 0, 0.4392157, 1,
1.460127, -1.024636, 3.360609, 1, 0, 0.4313726, 1,
1.462742, 0.4955917, 1.434772, 1, 0, 0.427451, 1,
1.462886, 0.2415681, 0.6512603, 1, 0, 0.4196078, 1,
1.469414, 0.6817734, 0.5042443, 1, 0, 0.4156863, 1,
1.477757, 0.03079087, 1.968743, 1, 0, 0.4078431, 1,
1.503123, -1.172871, 2.562627, 1, 0, 0.4039216, 1,
1.524937, -1.404847, 2.022847, 1, 0, 0.3960784, 1,
1.530959, -0.0554131, 0.7422232, 1, 0, 0.3882353, 1,
1.531591, 0.1594032, 1.109567, 1, 0, 0.3843137, 1,
1.533244, 1.285136, 0.9072613, 1, 0, 0.3764706, 1,
1.534283, 1.128515, 0.7183868, 1, 0, 0.372549, 1,
1.539962, -0.7368739, 2.079252, 1, 0, 0.3647059, 1,
1.540275, -1.798703, 2.87393, 1, 0, 0.3607843, 1,
1.547929, 0.09143691, 1.700758, 1, 0, 0.3529412, 1,
1.592713, -1.167183, 2.530532, 1, 0, 0.3490196, 1,
1.606881, -0.8023136, 3.564998, 1, 0, 0.3411765, 1,
1.614493, -0.5288944, 1.227061, 1, 0, 0.3372549, 1,
1.631989, 0.3914276, 3.054336, 1, 0, 0.3294118, 1,
1.633148, 1.429171, -0.9085476, 1, 0, 0.3254902, 1,
1.639726, -1.003743, 0.1728262, 1, 0, 0.3176471, 1,
1.657562, -0.5883607, 0.2198241, 1, 0, 0.3137255, 1,
1.661157, -0.1981474, 1.417294, 1, 0, 0.3058824, 1,
1.661498, -0.7570255, 2.741422, 1, 0, 0.2980392, 1,
1.676584, -0.01970159, 1.712217, 1, 0, 0.2941177, 1,
1.712242, -0.5234515, 1.468669, 1, 0, 0.2862745, 1,
1.724391, -1.974955, 2.030417, 1, 0, 0.282353, 1,
1.73037, -1.520694, 1.808648, 1, 0, 0.2745098, 1,
1.741204, -0.2384531, 4.183999, 1, 0, 0.2705882, 1,
1.773437, -0.6351659, 0.5468131, 1, 0, 0.2627451, 1,
1.778205, 0.5151111, 2.643558, 1, 0, 0.2588235, 1,
1.780034, 1.458169, -0.01186772, 1, 0, 0.2509804, 1,
1.801081, -0.3755469, 1.70295, 1, 0, 0.2470588, 1,
1.817058, -0.2727071, 1.937554, 1, 0, 0.2392157, 1,
1.904291, -0.1066336, 1.349255, 1, 0, 0.2352941, 1,
1.926975, 0.3871396, 2.689165, 1, 0, 0.227451, 1,
1.936787, -0.2782357, 1.324097, 1, 0, 0.2235294, 1,
1.956928, -0.6837443, 1.874061, 1, 0, 0.2156863, 1,
1.980262, -0.6671922, 2.446162, 1, 0, 0.2117647, 1,
2.017251, 1.776879, -1.427747, 1, 0, 0.2039216, 1,
2.030355, 0.7033874, 0.184337, 1, 0, 0.1960784, 1,
2.034367, 0.04537242, 2.64536, 1, 0, 0.1921569, 1,
2.076289, -0.9548019, 1.321074, 1, 0, 0.1843137, 1,
2.105808, -0.5113907, 1.900752, 1, 0, 0.1803922, 1,
2.106966, -1.269014, 1.733012, 1, 0, 0.172549, 1,
2.113501, 0.5160316, 2.328343, 1, 0, 0.1686275, 1,
2.122256, 0.8008713, 1.552562, 1, 0, 0.1607843, 1,
2.144793, -0.9246459, 1.66988, 1, 0, 0.1568628, 1,
2.148652, 0.981949, 0.09904914, 1, 0, 0.1490196, 1,
2.158536, 0.3689896, 1.926522, 1, 0, 0.145098, 1,
2.159109, 0.4294349, 0.1625632, 1, 0, 0.1372549, 1,
2.169487, 0.3990552, 0.6692149, 1, 0, 0.1333333, 1,
2.192595, 0.6514794, 1.897529, 1, 0, 0.1254902, 1,
2.220675, -1.358562, 2.367106, 1, 0, 0.1215686, 1,
2.232961, -2.782433, 0.8926718, 1, 0, 0.1137255, 1,
2.25638, 1.361325, 1.954957, 1, 0, 0.1098039, 1,
2.35456, 0.2885533, 2.655162, 1, 0, 0.1019608, 1,
2.452758, 0.0776699, 1.434054, 1, 0, 0.09411765, 1,
2.469528, -0.876479, 3.159967, 1, 0, 0.09019608, 1,
2.48947, 0.1614663, 1.612206, 1, 0, 0.08235294, 1,
2.504506, 1.239639, 1.049667, 1, 0, 0.07843138, 1,
2.519802, -0.5627792, 2.132785, 1, 0, 0.07058824, 1,
2.53988, 0.6194775, 1.364948, 1, 0, 0.06666667, 1,
2.571989, 2.647325, 0.4520436, 1, 0, 0.05882353, 1,
2.590171, 1.50526, 1.508524, 1, 0, 0.05490196, 1,
2.650809, 0.4098967, 2.393622, 1, 0, 0.04705882, 1,
2.654011, -0.06213186, 3.095493, 1, 0, 0.04313726, 1,
2.677843, 0.06838371, 3.186512, 1, 0, 0.03529412, 1,
2.730991, 2.353217, -0.08283775, 1, 0, 0.03137255, 1,
2.764196, 0.9551268, 0.9734871, 1, 0, 0.02352941, 1,
2.829998, 2.143613, 2.571317, 1, 0, 0.01960784, 1,
2.887359, -1.024581, 1.427699, 1, 0, 0.01176471, 1,
3.011665, -0.08082402, 3.049036, 1, 0, 0.007843138, 1
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
0.0270071, -4.170327, -7.389018, 0, -0.5, 0.5, 0.5,
0.0270071, -4.170327, -7.389018, 1, -0.5, 0.5, 0.5,
0.0270071, -4.170327, -7.389018, 1, 1.5, 0.5, 0.5,
0.0270071, -4.170327, -7.389018, 0, 1.5, 0.5, 0.5
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
-3.96945, 0.3437595, -7.389018, 0, -0.5, 0.5, 0.5,
-3.96945, 0.3437595, -7.389018, 1, -0.5, 0.5, 0.5,
-3.96945, 0.3437595, -7.389018, 1, 1.5, 0.5, 0.5,
-3.96945, 0.3437595, -7.389018, 0, 1.5, 0.5, 0.5
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
-3.96945, -4.170327, -0.4774654, 0, -0.5, 0.5, 0.5,
-3.96945, -4.170327, -0.4774654, 1, -0.5, 0.5, 0.5,
-3.96945, -4.170327, -0.4774654, 1, 1.5, 0.5, 0.5,
-3.96945, -4.170327, -0.4774654, 0, 1.5, 0.5, 0.5
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
-2, -3.128615, -5.794044,
3, -3.128615, -5.794044,
-2, -3.128615, -5.794044,
-2, -3.302233, -6.059874,
-1, -3.128615, -5.794044,
-1, -3.302233, -6.059874,
0, -3.128615, -5.794044,
0, -3.302233, -6.059874,
1, -3.128615, -5.794044,
1, -3.302233, -6.059874,
2, -3.128615, -5.794044,
2, -3.302233, -6.059874,
3, -3.128615, -5.794044,
3, -3.302233, -6.059874
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
-2, -3.649471, -6.591531, 0, -0.5, 0.5, 0.5,
-2, -3.649471, -6.591531, 1, -0.5, 0.5, 0.5,
-2, -3.649471, -6.591531, 1, 1.5, 0.5, 0.5,
-2, -3.649471, -6.591531, 0, 1.5, 0.5, 0.5,
-1, -3.649471, -6.591531, 0, -0.5, 0.5, 0.5,
-1, -3.649471, -6.591531, 1, -0.5, 0.5, 0.5,
-1, -3.649471, -6.591531, 1, 1.5, 0.5, 0.5,
-1, -3.649471, -6.591531, 0, 1.5, 0.5, 0.5,
0, -3.649471, -6.591531, 0, -0.5, 0.5, 0.5,
0, -3.649471, -6.591531, 1, -0.5, 0.5, 0.5,
0, -3.649471, -6.591531, 1, 1.5, 0.5, 0.5,
0, -3.649471, -6.591531, 0, 1.5, 0.5, 0.5,
1, -3.649471, -6.591531, 0, -0.5, 0.5, 0.5,
1, -3.649471, -6.591531, 1, -0.5, 0.5, 0.5,
1, -3.649471, -6.591531, 1, 1.5, 0.5, 0.5,
1, -3.649471, -6.591531, 0, 1.5, 0.5, 0.5,
2, -3.649471, -6.591531, 0, -0.5, 0.5, 0.5,
2, -3.649471, -6.591531, 1, -0.5, 0.5, 0.5,
2, -3.649471, -6.591531, 1, 1.5, 0.5, 0.5,
2, -3.649471, -6.591531, 0, 1.5, 0.5, 0.5,
3, -3.649471, -6.591531, 0, -0.5, 0.5, 0.5,
3, -3.649471, -6.591531, 1, -0.5, 0.5, 0.5,
3, -3.649471, -6.591531, 1, 1.5, 0.5, 0.5,
3, -3.649471, -6.591531, 0, 1.5, 0.5, 0.5
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
-3.047191, -3, -5.794044,
-3.047191, 3, -5.794044,
-3.047191, -3, -5.794044,
-3.200901, -3, -6.059874,
-3.047191, -2, -5.794044,
-3.200901, -2, -6.059874,
-3.047191, -1, -5.794044,
-3.200901, -1, -6.059874,
-3.047191, 0, -5.794044,
-3.200901, 0, -6.059874,
-3.047191, 1, -5.794044,
-3.200901, 1, -6.059874,
-3.047191, 2, -5.794044,
-3.200901, 2, -6.059874,
-3.047191, 3, -5.794044,
-3.200901, 3, -6.059874
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
-3.50832, -3, -6.591531, 0, -0.5, 0.5, 0.5,
-3.50832, -3, -6.591531, 1, -0.5, 0.5, 0.5,
-3.50832, -3, -6.591531, 1, 1.5, 0.5, 0.5,
-3.50832, -3, -6.591531, 0, 1.5, 0.5, 0.5,
-3.50832, -2, -6.591531, 0, -0.5, 0.5, 0.5,
-3.50832, -2, -6.591531, 1, -0.5, 0.5, 0.5,
-3.50832, -2, -6.591531, 1, 1.5, 0.5, 0.5,
-3.50832, -2, -6.591531, 0, 1.5, 0.5, 0.5,
-3.50832, -1, -6.591531, 0, -0.5, 0.5, 0.5,
-3.50832, -1, -6.591531, 1, -0.5, 0.5, 0.5,
-3.50832, -1, -6.591531, 1, 1.5, 0.5, 0.5,
-3.50832, -1, -6.591531, 0, 1.5, 0.5, 0.5,
-3.50832, 0, -6.591531, 0, -0.5, 0.5, 0.5,
-3.50832, 0, -6.591531, 1, -0.5, 0.5, 0.5,
-3.50832, 0, -6.591531, 1, 1.5, 0.5, 0.5,
-3.50832, 0, -6.591531, 0, 1.5, 0.5, 0.5,
-3.50832, 1, -6.591531, 0, -0.5, 0.5, 0.5,
-3.50832, 1, -6.591531, 1, -0.5, 0.5, 0.5,
-3.50832, 1, -6.591531, 1, 1.5, 0.5, 0.5,
-3.50832, 1, -6.591531, 0, 1.5, 0.5, 0.5,
-3.50832, 2, -6.591531, 0, -0.5, 0.5, 0.5,
-3.50832, 2, -6.591531, 1, -0.5, 0.5, 0.5,
-3.50832, 2, -6.591531, 1, 1.5, 0.5, 0.5,
-3.50832, 2, -6.591531, 0, 1.5, 0.5, 0.5,
-3.50832, 3, -6.591531, 0, -0.5, 0.5, 0.5,
-3.50832, 3, -6.591531, 1, -0.5, 0.5, 0.5,
-3.50832, 3, -6.591531, 1, 1.5, 0.5, 0.5,
-3.50832, 3, -6.591531, 0, 1.5, 0.5, 0.5
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
-3.047191, -3.128615, -4,
-3.047191, -3.128615, 4,
-3.047191, -3.128615, -4,
-3.200901, -3.302233, -4,
-3.047191, -3.128615, -2,
-3.200901, -3.302233, -2,
-3.047191, -3.128615, 0,
-3.200901, -3.302233, 0,
-3.047191, -3.128615, 2,
-3.200901, -3.302233, 2,
-3.047191, -3.128615, 4,
-3.200901, -3.302233, 4
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
-3.50832, -3.649471, -4, 0, -0.5, 0.5, 0.5,
-3.50832, -3.649471, -4, 1, -0.5, 0.5, 0.5,
-3.50832, -3.649471, -4, 1, 1.5, 0.5, 0.5,
-3.50832, -3.649471, -4, 0, 1.5, 0.5, 0.5,
-3.50832, -3.649471, -2, 0, -0.5, 0.5, 0.5,
-3.50832, -3.649471, -2, 1, -0.5, 0.5, 0.5,
-3.50832, -3.649471, -2, 1, 1.5, 0.5, 0.5,
-3.50832, -3.649471, -2, 0, 1.5, 0.5, 0.5,
-3.50832, -3.649471, 0, 0, -0.5, 0.5, 0.5,
-3.50832, -3.649471, 0, 1, -0.5, 0.5, 0.5,
-3.50832, -3.649471, 0, 1, 1.5, 0.5, 0.5,
-3.50832, -3.649471, 0, 0, 1.5, 0.5, 0.5,
-3.50832, -3.649471, 2, 0, -0.5, 0.5, 0.5,
-3.50832, -3.649471, 2, 1, -0.5, 0.5, 0.5,
-3.50832, -3.649471, 2, 1, 1.5, 0.5, 0.5,
-3.50832, -3.649471, 2, 0, 1.5, 0.5, 0.5,
-3.50832, -3.649471, 4, 0, -0.5, 0.5, 0.5,
-3.50832, -3.649471, 4, 1, -0.5, 0.5, 0.5,
-3.50832, -3.649471, 4, 1, 1.5, 0.5, 0.5,
-3.50832, -3.649471, 4, 0, 1.5, 0.5, 0.5
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
-3.047191, -3.128615, -5.794044,
-3.047191, 3.816134, -5.794044,
-3.047191, -3.128615, 4.839114,
-3.047191, 3.816134, 4.839114,
-3.047191, -3.128615, -5.794044,
-3.047191, -3.128615, 4.839114,
-3.047191, 3.816134, -5.794044,
-3.047191, 3.816134, 4.839114,
-3.047191, -3.128615, -5.794044,
3.101205, -3.128615, -5.794044,
-3.047191, -3.128615, 4.839114,
3.101205, -3.128615, 4.839114,
-3.047191, 3.816134, -5.794044,
3.101205, 3.816134, -5.794044,
-3.047191, 3.816134, 4.839114,
3.101205, 3.816134, 4.839114,
3.101205, -3.128615, -5.794044,
3.101205, 3.816134, -5.794044,
3.101205, -3.128615, 4.839114,
3.101205, 3.816134, 4.839114,
3.101205, -3.128615, -5.794044,
3.101205, -3.128615, 4.839114,
3.101205, 3.816134, -5.794044,
3.101205, 3.816134, 4.839114
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
var radius = 7.534546;
var distance = 33.52205;
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
mvMatrix.translate( -0.0270071, -0.3437595, 0.4774654 );
mvMatrix.scale( 1.32498, 1.173045, 0.7661411 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.52205);
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
gamma-Nonalactone<-read.table("gamma-Nonalactone.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-gamma-Nonalactone$V2
```

```
## Error in eval(expr, envir, enclos): object 'Nonalactone' not found
```

```r
y<-gamma-Nonalactone$V3
```

```
## Error in eval(expr, envir, enclos): object 'Nonalactone' not found
```

```r
z<-gamma-Nonalactone$V4
```

```
## Error in eval(expr, envir, enclos): object 'Nonalactone' not found
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
-2.957651, -0.6790056, -1.937886, 0, 0, 1, 1, 1,
-2.944549, -1.35639, -2.851133, 1, 0, 0, 1, 1,
-2.916721, -0.2645323, -1.148352, 1, 0, 0, 1, 1,
-2.725498, 1.263434, -3.480432, 1, 0, 0, 1, 1,
-2.709422, -0.2312563, -1.913435, 1, 0, 0, 1, 1,
-2.653423, 0.837246, -1.297533, 1, 0, 0, 1, 1,
-2.649075, -1.523015, -1.760547, 0, 0, 0, 1, 1,
-2.646005, 0.6007859, -1.328876, 0, 0, 0, 1, 1,
-2.572887, -0.7378377, -1.747988, 0, 0, 0, 1, 1,
-2.370241, -1.13263, -2.407393, 0, 0, 0, 1, 1,
-2.369964, 0.07409258, -1.763378, 0, 0, 0, 1, 1,
-2.282995, -0.7264614, -1.405786, 0, 0, 0, 1, 1,
-2.204313, -0.8541195, -2.467582, 0, 0, 0, 1, 1,
-2.188767, -0.3301943, -1.399621, 1, 1, 1, 1, 1,
-2.171343, -0.7156058, -0.4049489, 1, 1, 1, 1, 1,
-2.152092, 0.1811436, -3.61213, 1, 1, 1, 1, 1,
-2.14716, 0.5367835, -0.9528021, 1, 1, 1, 1, 1,
-2.135436, -0.5090064, -1.352241, 1, 1, 1, 1, 1,
-2.086709, -0.8268152, -1.544415, 1, 1, 1, 1, 1,
-2.026853, 0.2292702, -1.506479, 1, 1, 1, 1, 1,
-1.995798, -0.6027527, -0.6788189, 1, 1, 1, 1, 1,
-1.992212, -0.7807166, -1.641377, 1, 1, 1, 1, 1,
-1.975041, -0.09873515, -0.1689918, 1, 1, 1, 1, 1,
-1.947127, 0.4010517, -2.183216, 1, 1, 1, 1, 1,
-1.935184, -1.748811, -1.956754, 1, 1, 1, 1, 1,
-1.933048, -0.03798161, -0.7419972, 1, 1, 1, 1, 1,
-1.931502, -0.6137046, -1.613044, 1, 1, 1, 1, 1,
-1.910664, -0.3138302, -2.363867, 1, 1, 1, 1, 1,
-1.907348, -0.4291798, -0.8152884, 0, 0, 1, 1, 1,
-1.855552, 0.9511122, -0.9617357, 1, 0, 0, 1, 1,
-1.853691, -0.7898119, -0.001246425, 1, 0, 0, 1, 1,
-1.83191, 0.859866, -2.336664, 1, 0, 0, 1, 1,
-1.783955, -0.09621853, -0.280699, 1, 0, 0, 1, 1,
-1.772098, -0.4258055, -1.850953, 1, 0, 0, 1, 1,
-1.752524, 0.9393307, 0.3274135, 0, 0, 0, 1, 1,
-1.751889, 0.880725, -2.094721, 0, 0, 0, 1, 1,
-1.748304, 0.6267023, -0.6026589, 0, 0, 0, 1, 1,
-1.73002, 0.1293129, -1.737885, 0, 0, 0, 1, 1,
-1.714164, 0.8418661, -1.996272, 0, 0, 0, 1, 1,
-1.711913, 0.3235203, -1.427911, 0, 0, 0, 1, 1,
-1.711511, -1.674073, -3.83355, 0, 0, 0, 1, 1,
-1.709627, -0.5405412, -1.829689, 1, 1, 1, 1, 1,
-1.70606, 0.2103423, -1.582309, 1, 1, 1, 1, 1,
-1.68786, 1.975138, 1.763217, 1, 1, 1, 1, 1,
-1.677402, -1.479229, -1.636174, 1, 1, 1, 1, 1,
-1.671349, -0.8599312, -0.7048527, 1, 1, 1, 1, 1,
-1.659933, -1.074696, -2.415481, 1, 1, 1, 1, 1,
-1.651082, -0.9503051, -2.443974, 1, 1, 1, 1, 1,
-1.649981, 1.288769, -0.3775922, 1, 1, 1, 1, 1,
-1.647269, -0.1667671, -1.636971, 1, 1, 1, 1, 1,
-1.646838, -0.3499837, -2.275858, 1, 1, 1, 1, 1,
-1.645677, 0.2268772, -3.245907, 1, 1, 1, 1, 1,
-1.644489, -0.1711391, -1.613294, 1, 1, 1, 1, 1,
-1.63656, 0.8134916, 0.4581603, 1, 1, 1, 1, 1,
-1.635474, 1.110996, -0.666679, 1, 1, 1, 1, 1,
-1.628111, -0.334033, -2.99605, 1, 1, 1, 1, 1,
-1.625118, -0.2190022, -3.498962, 0, 0, 1, 1, 1,
-1.62058, -1.069041, -2.225192, 1, 0, 0, 1, 1,
-1.606955, 0.8575146, -0.7178749, 1, 0, 0, 1, 1,
-1.594668, -0.8778684, -1.826124, 1, 0, 0, 1, 1,
-1.580525, -1.481231, -2.270189, 1, 0, 0, 1, 1,
-1.565591, 0.08317804, -1.829129, 1, 0, 0, 1, 1,
-1.557075, -0.4003114, -1.923003, 0, 0, 0, 1, 1,
-1.555219, -0.3071247, -2.263938, 0, 0, 0, 1, 1,
-1.553831, -0.8864853, -0.6513278, 0, 0, 0, 1, 1,
-1.540652, -1.441654, -3.103, 0, 0, 0, 1, 1,
-1.534637, 0.5028067, -0.8008176, 0, 0, 0, 1, 1,
-1.524572, -1.481807, -2.922219, 0, 0, 0, 1, 1,
-1.52439, 1.188189, -1.754356, 0, 0, 0, 1, 1,
-1.521017, 0.1082212, -2.342321, 1, 1, 1, 1, 1,
-1.517705, -0.1363684, -2.17311, 1, 1, 1, 1, 1,
-1.516623, 0.008747964, -1.087559, 1, 1, 1, 1, 1,
-1.515592, -0.7406578, -2.301171, 1, 1, 1, 1, 1,
-1.503795, -0.7907676, -2.558892, 1, 1, 1, 1, 1,
-1.496096, 1.269022, -1.56664, 1, 1, 1, 1, 1,
-1.491191, -0.06969474, -2.110293, 1, 1, 1, 1, 1,
-1.4873, -0.4149996, -1.225768, 1, 1, 1, 1, 1,
-1.464368, 1.412737, 0.3665152, 1, 1, 1, 1, 1,
-1.46358, 1.860975, -1.736388, 1, 1, 1, 1, 1,
-1.462709, -1.044882, -3.725651, 1, 1, 1, 1, 1,
-1.453155, 2.276769, -1.777362, 1, 1, 1, 1, 1,
-1.452825, -0.04942454, -1.789114, 1, 1, 1, 1, 1,
-1.433568, -1.095576, -0.566525, 1, 1, 1, 1, 1,
-1.428768, 0.7641577, -0.3195143, 1, 1, 1, 1, 1,
-1.42776, 0.8251618, 0.8409226, 0, 0, 1, 1, 1,
-1.418686, 1.227017, -0.7495563, 1, 0, 0, 1, 1,
-1.402845, -0.5585345, -2.653274, 1, 0, 0, 1, 1,
-1.392778, -0.5003005, -2.961818, 1, 0, 0, 1, 1,
-1.387067, 0.8941869, 0.4152456, 1, 0, 0, 1, 1,
-1.376647, -0.4126303, -1.338659, 1, 0, 0, 1, 1,
-1.371103, -0.1080066, -3.619625, 0, 0, 0, 1, 1,
-1.367617, 0.2287855, -2.143352, 0, 0, 0, 1, 1,
-1.364696, 0.1333069, -0.7321138, 0, 0, 0, 1, 1,
-1.357519, -0.469815, -2.240738, 0, 0, 0, 1, 1,
-1.354379, 0.08795156, -0.3339104, 0, 0, 0, 1, 1,
-1.338991, -0.4643414, -0.5460419, 0, 0, 0, 1, 1,
-1.334137, -2.269752, -1.268994, 0, 0, 0, 1, 1,
-1.319798, -0.3543713, -1.510636, 1, 1, 1, 1, 1,
-1.302562, 0.9721242, 0.5634152, 1, 1, 1, 1, 1,
-1.290286, -1.204362, -2.49649, 1, 1, 1, 1, 1,
-1.283489, 0.0172153, 0.02186495, 1, 1, 1, 1, 1,
-1.276361, -0.8690704, -1.070465, 1, 1, 1, 1, 1,
-1.270648, 1.248039, -0.9420403, 1, 1, 1, 1, 1,
-1.267745, 0.9136966, -0.3522328, 1, 1, 1, 1, 1,
-1.26756, -0.9705958, -2.13608, 1, 1, 1, 1, 1,
-1.266328, 0.8937895, -1.124504, 1, 1, 1, 1, 1,
-1.261916, 1.349548, -1.26546, 1, 1, 1, 1, 1,
-1.250538, -0.02301705, -1.100977, 1, 1, 1, 1, 1,
-1.245728, 0.5513927, -0.9553559, 1, 1, 1, 1, 1,
-1.232946, -1.171284, -1.198353, 1, 1, 1, 1, 1,
-1.231925, 1.24055, -1.738728, 1, 1, 1, 1, 1,
-1.212351, -1.377561, -1.611115, 1, 1, 1, 1, 1,
-1.201464, -2.536923, -2.796571, 0, 0, 1, 1, 1,
-1.201097, -0.5652789, -0.9178351, 1, 0, 0, 1, 1,
-1.200307, -0.1066053, 0.9176771, 1, 0, 0, 1, 1,
-1.199788, -0.7826852, -2.149609, 1, 0, 0, 1, 1,
-1.194123, -1.382826, -2.63622, 1, 0, 0, 1, 1,
-1.192839, 0.5696717, -1.251508, 1, 0, 0, 1, 1,
-1.184674, 1.411762, -1.097596, 0, 0, 0, 1, 1,
-1.18249, -0.7239766, -1.107798, 0, 0, 0, 1, 1,
-1.181297, 0.920365, -0.678287, 0, 0, 0, 1, 1,
-1.179999, 0.143166, -1.6601, 0, 0, 0, 1, 1,
-1.179808, -1.018155, -4.349154, 0, 0, 0, 1, 1,
-1.172153, 0.6733899, -0.5511757, 0, 0, 0, 1, 1,
-1.171434, -0.7158983, -4.401095, 0, 0, 0, 1, 1,
-1.154158, 0.8669853, -0.5687395, 1, 1, 1, 1, 1,
-1.140797, 0.3808885, -1.269754, 1, 1, 1, 1, 1,
-1.139118, 0.7312918, -1.534199, 1, 1, 1, 1, 1,
-1.127926, 1.115654, -0.5341629, 1, 1, 1, 1, 1,
-1.116091, 0.1190723, -1.054013, 1, 1, 1, 1, 1,
-1.111527, 1.959866, 0.8795263, 1, 1, 1, 1, 1,
-1.109273, 1.039516, -1.235939, 1, 1, 1, 1, 1,
-1.106122, 0.211005, -0.1825215, 1, 1, 1, 1, 1,
-1.103408, -0.5610645, -3.269894, 1, 1, 1, 1, 1,
-1.089241, -0.5800856, -1.93242, 1, 1, 1, 1, 1,
-1.088808, -0.6750295, -0.9879687, 1, 1, 1, 1, 1,
-1.088035, -0.3777735, -2.552154, 1, 1, 1, 1, 1,
-1.086465, -0.6501986, -1.977661, 1, 1, 1, 1, 1,
-1.082729, -0.38949, -0.8519692, 1, 1, 1, 1, 1,
-1.082062, 0.5952163, -0.8098174, 1, 1, 1, 1, 1,
-1.081597, 1.397681, -0.3421374, 0, 0, 1, 1, 1,
-1.075686, 0.07808078, -1.786727, 1, 0, 0, 1, 1,
-1.075309, -0.05572508, -1.079015, 1, 0, 0, 1, 1,
-1.075279, -0.06083773, -1.774328, 1, 0, 0, 1, 1,
-1.071636, -1.160893, -3.315372, 1, 0, 0, 1, 1,
-1.070823, 0.198662, -1.935197, 1, 0, 0, 1, 1,
-1.067988, 2.256601, -1.502239, 0, 0, 0, 1, 1,
-1.063244, -0.6959994, -2.038921, 0, 0, 0, 1, 1,
-1.062973, -0.1546939, -1.812329, 0, 0, 0, 1, 1,
-1.058835, 0.2499608, -1.241474, 0, 0, 0, 1, 1,
-1.057483, 0.6655421, -1.346596, 0, 0, 0, 1, 1,
-1.057344, 1.222395, 0.1893686, 0, 0, 0, 1, 1,
-1.05696, -0.4119362, -1.521141, 0, 0, 0, 1, 1,
-1.051017, -0.4514702, -3.226526, 1, 1, 1, 1, 1,
-1.050966, 1.141923, -0.3720282, 1, 1, 1, 1, 1,
-1.050607, -0.454857, -0.5747976, 1, 1, 1, 1, 1,
-1.050018, 1.491384, -1.70841, 1, 1, 1, 1, 1,
-1.048862, 0.7625549, -2.098177, 1, 1, 1, 1, 1,
-1.04561, -0.06118766, -2.17608, 1, 1, 1, 1, 1,
-1.04127, 1.474746, 0.8249493, 1, 1, 1, 1, 1,
-1.019122, -0.5258819, -1.016914, 1, 1, 1, 1, 1,
-1.014318, -0.7580873, -2.354329, 1, 1, 1, 1, 1,
-1.008705, -1.751745, -2.477467, 1, 1, 1, 1, 1,
-0.9932999, 0.9434896, -0.5369523, 1, 1, 1, 1, 1,
-0.9824764, -0.5555705, -1.472051, 1, 1, 1, 1, 1,
-0.9791914, -1.833899, -3.429948, 1, 1, 1, 1, 1,
-0.975867, -1.3998, -3.361803, 1, 1, 1, 1, 1,
-0.9691509, -0.8867506, -4.364361, 1, 1, 1, 1, 1,
-0.9668174, -1.122398, -2.666886, 0, 0, 1, 1, 1,
-0.966054, -1.337385, -1.28501, 1, 0, 0, 1, 1,
-0.9650981, 1.692366, -0.4555887, 1, 0, 0, 1, 1,
-0.9613318, 0.02276098, -3.688984, 1, 0, 0, 1, 1,
-0.9560068, 1.196007, -0.8582538, 1, 0, 0, 1, 1,
-0.954094, 1.134084, -1.207731, 1, 0, 0, 1, 1,
-0.9512082, 0.7175686, -0.9832568, 0, 0, 0, 1, 1,
-0.9413033, -0.433585, -2.655351, 0, 0, 0, 1, 1,
-0.9302713, -0.8465552, -3.05666, 0, 0, 0, 1, 1,
-0.9273106, -1.627144, -2.429308, 0, 0, 0, 1, 1,
-0.9269507, 0.8308197, -1.301589, 0, 0, 0, 1, 1,
-0.9261844, -0.2475514, -2.819717, 0, 0, 0, 1, 1,
-0.9259963, -0.1735584, -2.578086, 0, 0, 0, 1, 1,
-0.9248869, 0.9400692, -1.600897, 1, 1, 1, 1, 1,
-0.9232985, -0.6017559, -2.898687, 1, 1, 1, 1, 1,
-0.9173847, -1.514057, -1.863804, 1, 1, 1, 1, 1,
-0.9149734, 0.6973804, 0.3563908, 1, 1, 1, 1, 1,
-0.9120042, -0.9442163, -0.8571916, 1, 1, 1, 1, 1,
-0.9101207, 1.733196, 0.3672039, 1, 1, 1, 1, 1,
-0.9064375, 0.7026818, -1.104371, 1, 1, 1, 1, 1,
-0.9047961, 2.820059, -0.8274399, 1, 1, 1, 1, 1,
-0.8893492, 1.244927, -0.09713022, 1, 1, 1, 1, 1,
-0.8874635, -0.4280376, -2.601674, 1, 1, 1, 1, 1,
-0.8848086, -1.378066, -3.290432, 1, 1, 1, 1, 1,
-0.8842135, 1.239293, 1.277326, 1, 1, 1, 1, 1,
-0.8835654, -0.390756, -2.674363, 1, 1, 1, 1, 1,
-0.8816515, 0.3777207, -0.8928393, 1, 1, 1, 1, 1,
-0.8800153, 0.1946117, -1.430162, 1, 1, 1, 1, 1,
-0.8786067, 0.481361, -0.4863559, 0, 0, 1, 1, 1,
-0.8715661, -0.5257881, -1.771701, 1, 0, 0, 1, 1,
-0.8711908, 1.099303, -0.454942, 1, 0, 0, 1, 1,
-0.8703986, -0.4584019, -4.527998, 1, 0, 0, 1, 1,
-0.8682958, -0.0001356023, -2.909276, 1, 0, 0, 1, 1,
-0.8550495, -0.04065823, -1.613386, 1, 0, 0, 1, 1,
-0.8521945, -0.8686754, -2.854786, 0, 0, 0, 1, 1,
-0.8498006, -1.342064, -2.314793, 0, 0, 0, 1, 1,
-0.8399937, -0.02063806, -0.6573466, 0, 0, 0, 1, 1,
-0.8372648, -1.368153, -2.30305, 0, 0, 0, 1, 1,
-0.8337158, 0.8280848, 0.1584811, 0, 0, 0, 1, 1,
-0.8328499, -1.300665, -2.915572, 0, 0, 0, 1, 1,
-0.8207352, 0.9343798, -1.230453, 0, 0, 0, 1, 1,
-0.818932, 0.01127752, -2.297768, 1, 1, 1, 1, 1,
-0.8076671, 0.9792207, -1.298486, 1, 1, 1, 1, 1,
-0.8021176, -0.05550645, -3.40389, 1, 1, 1, 1, 1,
-0.8016994, -1.094167, -3.157942, 1, 1, 1, 1, 1,
-0.8005533, 1.092411, -1.315387, 1, 1, 1, 1, 1,
-0.8002902, -0.3442134, -1.541744, 1, 1, 1, 1, 1,
-0.7925029, -0.2026666, -2.861135, 1, 1, 1, 1, 1,
-0.7885624, -0.2708691, -1.780658, 1, 1, 1, 1, 1,
-0.7875243, -1.701778, -3.773222, 1, 1, 1, 1, 1,
-0.7853007, -1.495867, -3.31275, 1, 1, 1, 1, 1,
-0.7811868, -0.2286553, -2.609055, 1, 1, 1, 1, 1,
-0.7790977, 0.06463608, -0.05788907, 1, 1, 1, 1, 1,
-0.7780376, 0.1112128, -1.278894, 1, 1, 1, 1, 1,
-0.7755571, -0.6216437, -2.64598, 1, 1, 1, 1, 1,
-0.7690384, -0.4575192, -4.41247, 1, 1, 1, 1, 1,
-0.7689709, -0.755601, -3.692751, 0, 0, 1, 1, 1,
-0.7672344, 0.5051092, -0.7566836, 1, 0, 0, 1, 1,
-0.7616202, -0.01570936, -1.371191, 1, 0, 0, 1, 1,
-0.7585741, -1.972439, -2.015768, 1, 0, 0, 1, 1,
-0.7554253, 0.7680209, -0.7471256, 1, 0, 0, 1, 1,
-0.7514969, 0.2036596, -1.035493, 1, 0, 0, 1, 1,
-0.7499397, 0.1485222, -1.516269, 0, 0, 0, 1, 1,
-0.7438798, -1.319113, -3.530907, 0, 0, 0, 1, 1,
-0.7376309, -1.285544, -2.780544, 0, 0, 0, 1, 1,
-0.7372192, -1.206232, -1.000725, 0, 0, 0, 1, 1,
-0.7342843, -0.6559913, -1.052271, 0, 0, 0, 1, 1,
-0.733754, 0.3913314, -0.4005383, 0, 0, 0, 1, 1,
-0.7316801, -0.1653799, -1.355171, 0, 0, 0, 1, 1,
-0.7286805, -0.6506866, -1.480495, 1, 1, 1, 1, 1,
-0.7223772, -1.662953, -3.262053, 1, 1, 1, 1, 1,
-0.7124833, -0.02244519, -0.4805891, 1, 1, 1, 1, 1,
-0.7086071, 1.539616, -0.2262369, 1, 1, 1, 1, 1,
-0.7072629, -1.924063, -2.624578, 1, 1, 1, 1, 1,
-0.7066119, -2.625674, -3.419052, 1, 1, 1, 1, 1,
-0.7038173, -0.5367833, -1.796296, 1, 1, 1, 1, 1,
-0.7036283, -0.3129916, -2.41327, 1, 1, 1, 1, 1,
-0.7009505, -0.2694628, -2.305436, 1, 1, 1, 1, 1,
-0.6975558, -1.302296, -2.333322, 1, 1, 1, 1, 1,
-0.6959648, 0.8536013, 0.5000437, 1, 1, 1, 1, 1,
-0.695403, 0.3952117, -1.469881, 1, 1, 1, 1, 1,
-0.6928942, 0.1060911, -3.513705, 1, 1, 1, 1, 1,
-0.6895317, -0.04419639, -1.261668, 1, 1, 1, 1, 1,
-0.6840354, -0.859907, -2.168299, 1, 1, 1, 1, 1,
-0.6838547, 0.3388607, -0.6270832, 0, 0, 1, 1, 1,
-0.6804873, -0.7276313, -2.235452, 1, 0, 0, 1, 1,
-0.6749367, -2.218433, -3.3135, 1, 0, 0, 1, 1,
-0.6749138, 0.4119706, -1.792468, 1, 0, 0, 1, 1,
-0.6742339, -0.6441181, -3.279876, 1, 0, 0, 1, 1,
-0.6737913, -0.5806342, -3.431578, 1, 0, 0, 1, 1,
-0.6726791, -1.176042, -3.472319, 0, 0, 0, 1, 1,
-0.6633023, 1.871723, 1.992669, 0, 0, 0, 1, 1,
-0.6615751, 1.092953, -0.1136467, 0, 0, 0, 1, 1,
-0.6591687, -1.459521, -4.239603, 0, 0, 0, 1, 1,
-0.6576751, -1.833329, -3.348588, 0, 0, 0, 1, 1,
-0.6561508, -0.6034973, -1.339425, 0, 0, 0, 1, 1,
-0.6492509, 1.05229, -1.209468, 0, 0, 0, 1, 1,
-0.6492103, -0.3731909, -0.7098848, 1, 1, 1, 1, 1,
-0.6479499, 1.13178, 0.6051518, 1, 1, 1, 1, 1,
-0.6465186, 0.3282582, -1.262527, 1, 1, 1, 1, 1,
-0.6450329, -0.7836041, -3.141318, 1, 1, 1, 1, 1,
-0.641465, -2.22561, -3.139126, 1, 1, 1, 1, 1,
-0.6341943, -0.2882817, -2.550169, 1, 1, 1, 1, 1,
-0.6319451, -0.2553966, -1.908034, 1, 1, 1, 1, 1,
-0.6306674, 0.538875, 0.06849097, 1, 1, 1, 1, 1,
-0.6300958, -0.8659542, -2.672005, 1, 1, 1, 1, 1,
-0.6271678, 0.4997923, -1.063239, 1, 1, 1, 1, 1,
-0.6240583, -0.44392, -0.7273328, 1, 1, 1, 1, 1,
-0.6218131, -0.690295, -2.099439, 1, 1, 1, 1, 1,
-0.6155353, 0.9410752, -1.854634, 1, 1, 1, 1, 1,
-0.6136775, -1.023011, -1.159819, 1, 1, 1, 1, 1,
-0.607677, -1.085937, -1.684043, 1, 1, 1, 1, 1,
-0.6056014, -0.412098, -4.496475, 0, 0, 1, 1, 1,
-0.605275, 0.8177574, -1.957553, 1, 0, 0, 1, 1,
-0.6045921, 0.4321316, -1.745328, 1, 0, 0, 1, 1,
-0.602421, -0.8482153, -1.988129, 1, 0, 0, 1, 1,
-0.6009784, 1.039496, 1.621126, 1, 0, 0, 1, 1,
-0.5973179, -0.9797039, -2.945612, 1, 0, 0, 1, 1,
-0.5887675, 0.4837289, -1.07463, 0, 0, 0, 1, 1,
-0.5884475, -1.296312, -3.399822, 0, 0, 0, 1, 1,
-0.5846026, 2.992426, 0.1377739, 0, 0, 0, 1, 1,
-0.5826173, 1.137111, -0.2673645, 0, 0, 0, 1, 1,
-0.5818596, -0.9254729, -3.282804, 0, 0, 0, 1, 1,
-0.5783471, 0.2363014, -1.347108, 0, 0, 0, 1, 1,
-0.578337, 0.3267196, -0.2507549, 0, 0, 0, 1, 1,
-0.5712419, -1.564383, -3.563286, 1, 1, 1, 1, 1,
-0.567762, 0.409974, 0.1371937, 1, 1, 1, 1, 1,
-0.5616441, -0.3807101, -1.506948, 1, 1, 1, 1, 1,
-0.556465, -1.522296, -2.617474, 1, 1, 1, 1, 1,
-0.5555524, -1.176892, -2.403539, 1, 1, 1, 1, 1,
-0.5534405, 0.02625123, -2.265109, 1, 1, 1, 1, 1,
-0.5484982, -0.6323054, -2.120951, 1, 1, 1, 1, 1,
-0.5461197, 0.4431984, -0.07358985, 1, 1, 1, 1, 1,
-0.5434286, 0.422445, 1.184369, 1, 1, 1, 1, 1,
-0.5431566, 0.1748007, -1.77873, 1, 1, 1, 1, 1,
-0.5362133, 1.082795, 0.8912883, 1, 1, 1, 1, 1,
-0.536165, -0.7345581, -3.090475, 1, 1, 1, 1, 1,
-0.5358239, 0.3626856, 0.7869369, 1, 1, 1, 1, 1,
-0.5314051, 2.472569, -1.560037, 1, 1, 1, 1, 1,
-0.5278012, 0.4314021, -0.4008323, 1, 1, 1, 1, 1,
-0.5267405, 0.1779738, -0.358634, 0, 0, 1, 1, 1,
-0.5246347, -0.1983734, -3.025819, 1, 0, 0, 1, 1,
-0.5235637, 1.505044, 0.9412858, 1, 0, 0, 1, 1,
-0.5214942, -0.9937335, -1.050056, 1, 0, 0, 1, 1,
-0.5208278, 0.164675, -0.8087098, 1, 0, 0, 1, 1,
-0.5167785, 0.7145258, -0.07970294, 1, 0, 0, 1, 1,
-0.5125623, 1.211091, -0.3992545, 0, 0, 0, 1, 1,
-0.504189, -0.5465127, -3.836706, 0, 0, 0, 1, 1,
-0.4979197, -0.3771213, -3.650856, 0, 0, 0, 1, 1,
-0.4953927, -0.9805336, -1.273628, 0, 0, 0, 1, 1,
-0.4951285, 1.008979, -0.1739829, 0, 0, 0, 1, 1,
-0.4937976, -0.3606673, -3.395134, 0, 0, 0, 1, 1,
-0.4857677, 0.5987836, 0.2554109, 0, 0, 0, 1, 1,
-0.483403, -1.998778, -3.776433, 1, 1, 1, 1, 1,
-0.4787059, 1.561535, 0.1790729, 1, 1, 1, 1, 1,
-0.4769191, 0.5931904, -0.9068671, 1, 1, 1, 1, 1,
-0.4723497, -0.01629066, -0.2723001, 1, 1, 1, 1, 1,
-0.4716677, 0.1363209, -3.27592, 1, 1, 1, 1, 1,
-0.4695873, 1.120713, -1.831151, 1, 1, 1, 1, 1,
-0.46711, -0.5583548, -4.153769, 1, 1, 1, 1, 1,
-0.4633618, 0.7631183, -0.5360721, 1, 1, 1, 1, 1,
-0.4625242, 0.5115795, -1.340984, 1, 1, 1, 1, 1,
-0.4600898, 0.6406726, 0.4625929, 1, 1, 1, 1, 1,
-0.4560087, -0.111944, -1.04768, 1, 1, 1, 1, 1,
-0.4550661, 0.50133, -2.027363, 1, 1, 1, 1, 1,
-0.4529611, 0.06073101, -0.8747835, 1, 1, 1, 1, 1,
-0.4510175, 0.7742167, -1.175028, 1, 1, 1, 1, 1,
-0.4481209, 0.5410163, -2.319934, 1, 1, 1, 1, 1,
-0.4386592, 0.08566441, -0.8445492, 0, 0, 1, 1, 1,
-0.4275441, 0.4300955, -0.4966545, 1, 0, 0, 1, 1,
-0.4260041, -0.9314841, -4.212483, 1, 0, 0, 1, 1,
-0.4238982, -0.147969, -3.658535, 1, 0, 0, 1, 1,
-0.4216683, 0.07433467, -2.411358, 1, 0, 0, 1, 1,
-0.4188856, -0.4564112, -2.865078, 1, 0, 0, 1, 1,
-0.4172791, -0.6899284, -0.1757095, 0, 0, 0, 1, 1,
-0.4109031, 0.15365, -3.39938, 0, 0, 0, 1, 1,
-0.4087531, -1.242419, -4.638013, 0, 0, 0, 1, 1,
-0.4086159, 0.1496845, -0.2882304, 0, 0, 0, 1, 1,
-0.4082515, 1.555714, 0.566326, 0, 0, 0, 1, 1,
-0.4066914, -1.57, -2.213218, 0, 0, 0, 1, 1,
-0.405131, 0.9978369, -1.065195, 0, 0, 0, 1, 1,
-0.3990504, -0.3016348, -1.832595, 1, 1, 1, 1, 1,
-0.3967224, -1.649924, -3.026589, 1, 1, 1, 1, 1,
-0.3948696, 0.8085507, -0.1772873, 1, 1, 1, 1, 1,
-0.392234, -0.836965, -1.376369, 1, 1, 1, 1, 1,
-0.3920079, -0.3456291, -1.169951, 1, 1, 1, 1, 1,
-0.3916173, -1.246041, -3.435256, 1, 1, 1, 1, 1,
-0.3868149, 2.648948, 0.1933468, 1, 1, 1, 1, 1,
-0.3819726, 0.8443776, 1.099901, 1, 1, 1, 1, 1,
-0.3802522, -0.3315852, -1.894387, 1, 1, 1, 1, 1,
-0.3717415, -1.788086, -3.149883, 1, 1, 1, 1, 1,
-0.3705917, -0.6416158, -3.007281, 1, 1, 1, 1, 1,
-0.3700255, -0.9863126, -2.975154, 1, 1, 1, 1, 1,
-0.3680996, -0.5110431, -1.916179, 1, 1, 1, 1, 1,
-0.3629873, 0.1509516, -1.40712, 1, 1, 1, 1, 1,
-0.3558355, 0.8607307, -0.3965124, 1, 1, 1, 1, 1,
-0.3548903, 1.197107, 0.1973627, 0, 0, 1, 1, 1,
-0.3539546, 0.4032037, 1.131513, 1, 0, 0, 1, 1,
-0.3493666, -0.1432227, -0.5581332, 1, 0, 0, 1, 1,
-0.3433541, -1.16432, -1.549098, 1, 0, 0, 1, 1,
-0.3427296, 1.015965, -1.083405, 1, 0, 0, 1, 1,
-0.3402073, -2.231074, -2.502944, 1, 0, 0, 1, 1,
-0.3386902, -1.448036, -2.907449, 0, 0, 0, 1, 1,
-0.335668, 0.1858459, -0.2555462, 0, 0, 0, 1, 1,
-0.3338048, 0.6190942, -0.3556052, 0, 0, 0, 1, 1,
-0.3295592, -1.511969, -2.928051, 0, 0, 0, 1, 1,
-0.3290385, 0.4623074, 0.1196853, 0, 0, 0, 1, 1,
-0.3210293, -0.1002507, -2.493649, 0, 0, 0, 1, 1,
-0.3152691, 0.6547095, -1.404427, 0, 0, 0, 1, 1,
-0.3050565, 3.714997, 0.9713803, 1, 1, 1, 1, 1,
-0.3032488, -0.1777643, -1.57086, 1, 1, 1, 1, 1,
-0.3021443, 0.3351015, -0.6123589, 1, 1, 1, 1, 1,
-0.2976055, -1.9197, -2.458572, 1, 1, 1, 1, 1,
-0.2964366, -0.285176, -2.191269, 1, 1, 1, 1, 1,
-0.2940512, -1.007848, -4.085131, 1, 1, 1, 1, 1,
-0.292784, 0.0933198, -2.284374, 1, 1, 1, 1, 1,
-0.289267, -1.943173, -3.162891, 1, 1, 1, 1, 1,
-0.2836935, -2.191254, -3.81767, 1, 1, 1, 1, 1,
-0.2814386, 1.849761, -0.1977407, 1, 1, 1, 1, 1,
-0.2783881, 0.4472896, -0.4152194, 1, 1, 1, 1, 1,
-0.2777155, 0.3891585, -1.742651, 1, 1, 1, 1, 1,
-0.2763574, 0.7860349, 0.2837224, 1, 1, 1, 1, 1,
-0.2762948, -1.983692, -3.621985, 1, 1, 1, 1, 1,
-0.2682863, -0.9301797, -3.020558, 1, 1, 1, 1, 1,
-0.2652678, -0.3908577, -2.55646, 0, 0, 1, 1, 1,
-0.2652042, -0.7387807, -2.537249, 1, 0, 0, 1, 1,
-0.263484, 1.066265, -0.02831147, 1, 0, 0, 1, 1,
-0.2631395, -0.05713711, -0.2224809, 1, 0, 0, 1, 1,
-0.2622311, 0.9920238, 0.3638649, 1, 0, 0, 1, 1,
-0.2610838, 2.512952, 0.4061209, 1, 0, 0, 1, 1,
-0.2610234, 1.206543, -2.30228, 0, 0, 0, 1, 1,
-0.2580667, -0.08031967, -1.540361, 0, 0, 0, 1, 1,
-0.2577892, 1.384836, -0.2769347, 0, 0, 0, 1, 1,
-0.2558126, 0.6711691, 1.137718, 0, 0, 0, 1, 1,
-0.2550246, 2.869877, 0.2556154, 0, 0, 0, 1, 1,
-0.2547475, 0.5303848, -0.327368, 0, 0, 0, 1, 1,
-0.2537903, 0.7888132, -0.09995048, 0, 0, 0, 1, 1,
-0.2516757, -2.175446, -2.108392, 1, 1, 1, 1, 1,
-0.2432112, -0.1304217, -2.970976, 1, 1, 1, 1, 1,
-0.241658, 0.7881324, -0.01831164, 1, 1, 1, 1, 1,
-0.241304, 0.7156309, -0.3396097, 1, 1, 1, 1, 1,
-0.2377472, 1.187203, -0.3491474, 1, 1, 1, 1, 1,
-0.2369481, 0.7770075, 1.188671, 1, 1, 1, 1, 1,
-0.2354795, 0.9852858, 0.7898045, 1, 1, 1, 1, 1,
-0.2344429, -0.9295136, -4.008411, 1, 1, 1, 1, 1,
-0.232278, -0.1042183, -2.666978, 1, 1, 1, 1, 1,
-0.2317996, 0.0942046, -2.605391, 1, 1, 1, 1, 1,
-0.2313847, 0.9816683, 0.426546, 1, 1, 1, 1, 1,
-0.2220179, 0.3930999, -2.273024, 1, 1, 1, 1, 1,
-0.2211262, -0.2538837, 0.2400545, 1, 1, 1, 1, 1,
-0.219828, 2.19516, 0.1908658, 1, 1, 1, 1, 1,
-0.2145534, 0.6561066, 0.6648065, 1, 1, 1, 1, 1,
-0.2129875, -0.8360954, -2.048113, 0, 0, 1, 1, 1,
-0.2115095, -0.7681167, -3.701872, 1, 0, 0, 1, 1,
-0.2112587, -2.434478, -1.978469, 1, 0, 0, 1, 1,
-0.207352, 0.7295473, -0.36151, 1, 0, 0, 1, 1,
-0.2040818, 0.8799468, -1.286435, 1, 0, 0, 1, 1,
-0.2010096, 0.1524924, -1.03954, 1, 0, 0, 1, 1,
-0.2002554, 0.1809261, -0.006067308, 0, 0, 0, 1, 1,
-0.1985847, 0.06232813, -3.291964, 0, 0, 0, 1, 1,
-0.1966852, 0.3101439, 0.6047236, 0, 0, 0, 1, 1,
-0.1937707, 0.4394162, -1.540247, 0, 0, 0, 1, 1,
-0.191081, -0.04197882, -3.428189, 0, 0, 0, 1, 1,
-0.1899527, 0.125871, -2.234263, 0, 0, 0, 1, 1,
-0.1892399, -1.546621, -3.850676, 0, 0, 0, 1, 1,
-0.1807936, 0.3021043, -1.090263, 1, 1, 1, 1, 1,
-0.1802518, 1.353087, 0.1937319, 1, 1, 1, 1, 1,
-0.1736971, 0.1923743, -0.3247041, 1, 1, 1, 1, 1,
-0.1728134, -1.288764, -0.8171701, 1, 1, 1, 1, 1,
-0.1723381, 0.4662727, 0.973087, 1, 1, 1, 1, 1,
-0.1706418, -0.2238893, -1.879678, 1, 1, 1, 1, 1,
-0.1669825, -0.1039002, -1.765416, 1, 1, 1, 1, 1,
-0.1649455, 0.9793399, 0.07465916, 1, 1, 1, 1, 1,
-0.156814, -1.150526, -1.614682, 1, 1, 1, 1, 1,
-0.1547316, -2.126131, -2.304651, 1, 1, 1, 1, 1,
-0.1450991, -1.933841, -4.570563, 1, 1, 1, 1, 1,
-0.1434408, -1.705795, -2.635578, 1, 1, 1, 1, 1,
-0.1409945, -1.012228, -2.93332, 1, 1, 1, 1, 1,
-0.1373927, 0.2347238, -1.259742, 1, 1, 1, 1, 1,
-0.1364392, -0.8705782, -3.380183, 1, 1, 1, 1, 1,
-0.1346448, -0.5006883, -0.9933229, 0, 0, 1, 1, 1,
-0.1283375, 0.001723539, -0.3034623, 1, 0, 0, 1, 1,
-0.124252, 0.1181207, -0.3485865, 1, 0, 0, 1, 1,
-0.118965, -0.6258705, -2.848818, 1, 0, 0, 1, 1,
-0.1179933, 0.692494, -0.1559158, 1, 0, 0, 1, 1,
-0.1174428, -1.515713, -2.260268, 1, 0, 0, 1, 1,
-0.1139804, 1.206426, 1.913156, 0, 0, 0, 1, 1,
-0.1120462, 0.6782412, 1.404832, 0, 0, 0, 1, 1,
-0.1120163, -0.5601322, -3.11763, 0, 0, 0, 1, 1,
-0.1109892, 1.718388, 0.7244624, 0, 0, 0, 1, 1,
-0.1105838, -1.54555, -3.063037, 0, 0, 0, 1, 1,
-0.107555, -0.4032623, -1.380725, 0, 0, 0, 1, 1,
-0.105299, -0.4796065, -2.684369, 0, 0, 0, 1, 1,
-0.1008834, 0.118722, 1.029008, 1, 1, 1, 1, 1,
-0.1006893, 0.2489851, 0.2036928, 1, 1, 1, 1, 1,
-0.09759516, -0.2350058, -3.186668, 1, 1, 1, 1, 1,
-0.09352111, -0.3550141, -3.759768, 1, 1, 1, 1, 1,
-0.08629525, 0.916572, 1.438539, 1, 1, 1, 1, 1,
-0.08465787, 0.5841315, -0.01620507, 1, 1, 1, 1, 1,
-0.08256406, -1.964494, -2.78526, 1, 1, 1, 1, 1,
-0.08175527, 1.969525, 0.6607431, 1, 1, 1, 1, 1,
-0.0806187, -1.077657, -2.766188, 1, 1, 1, 1, 1,
-0.08014626, 0.1343051, -0.6919348, 1, 1, 1, 1, 1,
-0.07611943, -0.07556453, -0.8165591, 1, 1, 1, 1, 1,
-0.07508489, -1.333579, -4.873845, 1, 1, 1, 1, 1,
-0.07279106, -0.1635004, -2.246118, 1, 1, 1, 1, 1,
-0.07222266, -0.05124336, -3.109014, 1, 1, 1, 1, 1,
-0.07015736, -1.865873, -1.438325, 1, 1, 1, 1, 1,
-0.06246987, 0.9593366, -0.5050715, 0, 0, 1, 1, 1,
-0.0622043, -0.2312854, -4.165691, 1, 0, 0, 1, 1,
-0.06100952, -0.1724671, -5.639193, 1, 0, 0, 1, 1,
-0.05979998, -0.3586637, -2.050747, 1, 0, 0, 1, 1,
-0.04816473, -0.4690878, -3.641369, 1, 0, 0, 1, 1,
-0.04768606, 0.3504182, -1.627887, 1, 0, 0, 1, 1,
-0.04593607, 1.252441, 1.283272, 0, 0, 0, 1, 1,
-0.0438392, 0.8567461, -0.6977413, 0, 0, 0, 1, 1,
-0.04246994, -0.01852758, -1.694664, 0, 0, 0, 1, 1,
-0.04243849, 2.19903, 0.08450821, 0, 0, 0, 1, 1,
-0.0387575, -0.5975338, -2.776936, 0, 0, 0, 1, 1,
-0.03713825, 0.1898598, -0.8936762, 0, 0, 0, 1, 1,
-0.03233293, 2.644398, 0.2643287, 0, 0, 0, 1, 1,
-0.02957077, 1.433083, -0.3533339, 1, 1, 1, 1, 1,
-0.02577806, -0.7111933, -3.464687, 1, 1, 1, 1, 1,
-0.01514919, 1.502766, -0.3862102, 1, 1, 1, 1, 1,
-0.01309492, 1.958554, 0.3688152, 1, 1, 1, 1, 1,
-0.01009243, 1.09426, -0.415971, 1, 1, 1, 1, 1,
-0.001893696, 1.134501, -0.2782263, 1, 1, 1, 1, 1,
-0.0006514011, -0.6327567, -2.373103, 1, 1, 1, 1, 1,
0.003204099, 1.614881, 0.7177391, 1, 1, 1, 1, 1,
0.005057342, -0.04748496, 2.643621, 1, 1, 1, 1, 1,
0.01262921, -0.3366281, 0.8800017, 1, 1, 1, 1, 1,
0.016492, -0.6804147, 3.500502, 1, 1, 1, 1, 1,
0.02141874, -0.2287235, 0.9309493, 1, 1, 1, 1, 1,
0.02649988, 0.94777, -0.3624707, 1, 1, 1, 1, 1,
0.02698602, -1.875139, 3.224122, 1, 1, 1, 1, 1,
0.02739594, -0.1999516, 2.502451, 1, 1, 1, 1, 1,
0.02933029, 1.9595, -0.2408978, 0, 0, 1, 1, 1,
0.03143336, -3.027478, 2.748457, 1, 0, 0, 1, 1,
0.03444577, -1.51963, 2.928958, 1, 0, 0, 1, 1,
0.0385513, 0.3860347, 1.165422, 1, 0, 0, 1, 1,
0.04221052, -0.09413566, 3.183874, 1, 0, 0, 1, 1,
0.0473808, 1.552693, 0.8772779, 1, 0, 0, 1, 1,
0.04987791, -2.396293, 2.710605, 0, 0, 0, 1, 1,
0.06187208, -0.2079401, 2.820863, 0, 0, 0, 1, 1,
0.0632831, -1.664273, 1.33127, 0, 0, 0, 1, 1,
0.06425117, -0.7443824, 3.522732, 0, 0, 0, 1, 1,
0.06534749, 1.188231, -0.6337594, 0, 0, 0, 1, 1,
0.06698006, 0.4585283, 0.5359578, 0, 0, 0, 1, 1,
0.06716112, -0.1763159, 2.972338, 0, 0, 0, 1, 1,
0.06787632, -0.02303073, 1.020304, 1, 1, 1, 1, 1,
0.07041986, -0.1604533, 3.14962, 1, 1, 1, 1, 1,
0.07052819, 1.566399, 0.390214, 1, 1, 1, 1, 1,
0.0743106, -1.991642, 1.29822, 1, 1, 1, 1, 1,
0.07844382, 0.4424125, 0.932579, 1, 1, 1, 1, 1,
0.07912582, -1.119888, 3.583336, 1, 1, 1, 1, 1,
0.08038792, 0.3244682, 1.351417, 1, 1, 1, 1, 1,
0.08229733, -0.3602536, 2.137389, 1, 1, 1, 1, 1,
0.08331378, 0.01728562, 0.6967961, 1, 1, 1, 1, 1,
0.08461586, -1.102907, 2.153957, 1, 1, 1, 1, 1,
0.08546712, -2.056461, 2.830884, 1, 1, 1, 1, 1,
0.08757674, -0.7086027, 1.601125, 1, 1, 1, 1, 1,
0.08961231, -0.2617635, 3.158906, 1, 1, 1, 1, 1,
0.08999195, -0.5507774, 1.721642, 1, 1, 1, 1, 1,
0.09145217, 0.3761398, 0.9222848, 1, 1, 1, 1, 1,
0.09286816, -1.165035, 2.468012, 0, 0, 1, 1, 1,
0.0933703, 0.5138353, -0.8015316, 1, 0, 0, 1, 1,
0.09448857, -0.2352709, 0.4593451, 1, 0, 0, 1, 1,
0.09671686, -0.7284905, 3.814783, 1, 0, 0, 1, 1,
0.09801223, 1.814643, -0.2357349, 1, 0, 0, 1, 1,
0.1011402, -1.427536, 3.316075, 1, 0, 0, 1, 1,
0.1037782, 0.2003369, -1.160104, 0, 0, 0, 1, 1,
0.1045585, 2.544356, 1.54447, 0, 0, 0, 1, 1,
0.1107995, 0.05990146, 1.221055, 0, 0, 0, 1, 1,
0.1117004, -0.01327989, 1.734393, 0, 0, 0, 1, 1,
0.1121368, 1.560742, 0.7618995, 0, 0, 0, 1, 1,
0.117232, 0.2803113, 1.299717, 0, 0, 0, 1, 1,
0.1239708, 0.709703, -1.304447, 0, 0, 0, 1, 1,
0.1240031, -2.305315, 3.168855, 1, 1, 1, 1, 1,
0.1268729, -0.5005995, 3.640401, 1, 1, 1, 1, 1,
0.1274735, 1.261216, -0.7856961, 1, 1, 1, 1, 1,
0.1308745, 0.7431934, 2.176323, 1, 1, 1, 1, 1,
0.1340065, 1.909007, 0.5901207, 1, 1, 1, 1, 1,
0.1361207, -1.150036, 2.121163, 1, 1, 1, 1, 1,
0.141273, 0.7514916, 1.291376, 1, 1, 1, 1, 1,
0.1459119, 2.343192, -0.4825054, 1, 1, 1, 1, 1,
0.1472463, 0.3839758, 1.474333, 1, 1, 1, 1, 1,
0.1488735, -0.2124138, 2.664889, 1, 1, 1, 1, 1,
0.1509304, -0.7619011, 3.41206, 1, 1, 1, 1, 1,
0.1583378, -1.862919, 4.370535, 1, 1, 1, 1, 1,
0.1607921, 1.184352, 0.9650674, 1, 1, 1, 1, 1,
0.1619729, -0.03548736, 0.8981604, 1, 1, 1, 1, 1,
0.1620668, -0.5400497, 1.409578, 1, 1, 1, 1, 1,
0.1636751, -0.9050655, 3.907864, 0, 0, 1, 1, 1,
0.1637337, -0.76699, 3.491055, 1, 0, 0, 1, 1,
0.1689183, 1.374911, 1.166036, 1, 0, 0, 1, 1,
0.1770063, 0.3924526, 0.9555248, 1, 0, 0, 1, 1,
0.1797744, -1.641235, 2.168678, 1, 0, 0, 1, 1,
0.1801298, 1.061914, -1.035222, 1, 0, 0, 1, 1,
0.1850004, -1.190357, 2.613095, 0, 0, 0, 1, 1,
0.1855816, -0.0253623, 2.318537, 0, 0, 0, 1, 1,
0.1871831, -0.1877109, 2.561113, 0, 0, 0, 1, 1,
0.1875271, -0.1346282, 1.856382, 0, 0, 0, 1, 1,
0.1901835, 0.3440802, 1.323726, 0, 0, 0, 1, 1,
0.1908171, -1.276814, 2.770285, 0, 0, 0, 1, 1,
0.1926512, -0.7095003, 3.660443, 0, 0, 0, 1, 1,
0.1936841, -0.4260625, 3.235641, 1, 1, 1, 1, 1,
0.1947576, 0.1570891, 1.048136, 1, 1, 1, 1, 1,
0.1960153, 0.3259575, 1.738629, 1, 1, 1, 1, 1,
0.1976508, -0.3243791, 1.913011, 1, 1, 1, 1, 1,
0.1979087, -1.220158, 4.684262, 1, 1, 1, 1, 1,
0.197926, 0.7836226, -0.7150624, 1, 1, 1, 1, 1,
0.1987748, -1.494361, 2.327804, 1, 1, 1, 1, 1,
0.1993927, -0.07327807, 1.499478, 1, 1, 1, 1, 1,
0.2001714, -0.7969617, 2.541857, 1, 1, 1, 1, 1,
0.2013528, 0.00427417, 0.2707544, 1, 1, 1, 1, 1,
0.2093297, -0.4921696, 3.469767, 1, 1, 1, 1, 1,
0.209383, 0.1532016, 2.425279, 1, 1, 1, 1, 1,
0.2114316, -0.1539938, 1.62251, 1, 1, 1, 1, 1,
0.2116351, -0.2940916, 2.8353, 1, 1, 1, 1, 1,
0.2191348, 1.465872, 1.332426, 1, 1, 1, 1, 1,
0.2191754, -0.6370224, 3.674728, 0, 0, 1, 1, 1,
0.2205232, -1.524814, 3.702127, 1, 0, 0, 1, 1,
0.2241234, 0.9648309, 1.258955, 1, 0, 0, 1, 1,
0.231116, 1.546223, 1.163928, 1, 0, 0, 1, 1,
0.2313559, 0.3065654, 0.4049441, 1, 0, 0, 1, 1,
0.2319017, -0.6642037, 3.655866, 1, 0, 0, 1, 1,
0.2353085, 0.4668647, 1.355465, 0, 0, 0, 1, 1,
0.2358917, -1.32915, 2.393665, 0, 0, 0, 1, 1,
0.2419802, -0.3356827, 2.292158, 0, 0, 0, 1, 1,
0.2546764, -0.2668669, 0.7956107, 0, 0, 0, 1, 1,
0.2601886, -1.515201, 2.764222, 0, 0, 0, 1, 1,
0.261341, 0.4967231, 0.326811, 0, 0, 0, 1, 1,
0.2635076, -0.8611534, 4.142892, 0, 0, 0, 1, 1,
0.2675655, 0.1294874, 1.226319, 1, 1, 1, 1, 1,
0.2675974, 0.8492287, 1.207191, 1, 1, 1, 1, 1,
0.268154, 0.002400149, 1.453875, 1, 1, 1, 1, 1,
0.2689518, 0.5908319, -0.4200613, 1, 1, 1, 1, 1,
0.2781537, 0.187861, 2.616427, 1, 1, 1, 1, 1,
0.2819405, -1.074532, 4.354605, 1, 1, 1, 1, 1,
0.2831362, -1.111236, 2.095891, 1, 1, 1, 1, 1,
0.288147, -1.269476, -0.06290177, 1, 1, 1, 1, 1,
0.3062153, -1.388437, 3.542804, 1, 1, 1, 1, 1,
0.3076468, -0.4512938, 3.280153, 1, 1, 1, 1, 1,
0.3087091, 2.406994, -0.4008019, 1, 1, 1, 1, 1,
0.31341, 0.1625784, 1.433659, 1, 1, 1, 1, 1,
0.3136838, 0.7378989, -0.6253344, 1, 1, 1, 1, 1,
0.3169143, 1.87807, -0.4933707, 1, 1, 1, 1, 1,
0.3228461, -0.7245051, 2.76422, 1, 1, 1, 1, 1,
0.3256326, -0.6896066, 2.401285, 0, 0, 1, 1, 1,
0.3294207, -0.2669087, 2.17872, 1, 0, 0, 1, 1,
0.3362084, 0.9710035, 0.6870782, 1, 0, 0, 1, 1,
0.3437754, -1.143405, 1.551527, 1, 0, 0, 1, 1,
0.3483359, 0.5601771, 1.190481, 1, 0, 0, 1, 1,
0.3500158, 1.279214, 0.7845767, 1, 0, 0, 1, 1,
0.3502195, 0.1329345, 0.386378, 0, 0, 0, 1, 1,
0.3507056, -0.7726133, 2.574755, 0, 0, 0, 1, 1,
0.3509187, 0.4503832, 0.9524305, 0, 0, 0, 1, 1,
0.3520432, 0.3329377, 1.09557, 0, 0, 0, 1, 1,
0.3525991, 0.1441783, 2.162935, 0, 0, 0, 1, 1,
0.3532154, 0.2116729, 0.9201142, 0, 0, 0, 1, 1,
0.3533833, -2.13699, 2.967304, 0, 0, 0, 1, 1,
0.3538515, -0.3277726, 1.38448, 1, 1, 1, 1, 1,
0.36608, -0.6691294, 3.270195, 1, 1, 1, 1, 1,
0.3664797, 0.47334, -0.03462565, 1, 1, 1, 1, 1,
0.369015, -1.127069, 3.858043, 1, 1, 1, 1, 1,
0.3704826, 0.2220811, 0.8502923, 1, 1, 1, 1, 1,
0.3708772, -1.011237, 2.725994, 1, 1, 1, 1, 1,
0.3738764, -0.8158722, 2.507445, 1, 1, 1, 1, 1,
0.3772496, -1.657491, 3.447092, 1, 1, 1, 1, 1,
0.3821578, -0.8316832, 2.361866, 1, 1, 1, 1, 1,
0.3890355, 0.4806911, 0.4733323, 1, 1, 1, 1, 1,
0.3897077, 0.1421021, 2.84506, 1, 1, 1, 1, 1,
0.3922416, -0.7279601, 2.426857, 1, 1, 1, 1, 1,
0.3934139, -0.02518441, 2.98603, 1, 1, 1, 1, 1,
0.3981876, 0.2818298, 2.04554, 1, 1, 1, 1, 1,
0.4024766, 0.9241349, 0.03962859, 1, 1, 1, 1, 1,
0.4042034, -0.2430643, 3.326288, 0, 0, 1, 1, 1,
0.407076, 0.6228089, 0.4702229, 1, 0, 0, 1, 1,
0.4098503, -0.5220154, 1.837285, 1, 0, 0, 1, 1,
0.4103088, -0.4848453, 3.036221, 1, 0, 0, 1, 1,
0.4163784, 0.7569149, 0.9984003, 1, 0, 0, 1, 1,
0.4225987, 0.2517558, 0.6518991, 1, 0, 0, 1, 1,
0.4286048, -0.4964509, 2.663878, 0, 0, 0, 1, 1,
0.4320959, 0.4118806, 0.4116274, 0, 0, 0, 1, 1,
0.440899, 0.3953366, -0.1985405, 0, 0, 0, 1, 1,
0.4412981, 0.418446, -0.01246181, 0, 0, 0, 1, 1,
0.4427146, -0.5316986, 1.541935, 0, 0, 0, 1, 1,
0.4429414, 1.019881, -0.2766333, 0, 0, 0, 1, 1,
0.4572716, -0.7926623, 2.556999, 0, 0, 0, 1, 1,
0.4578416, 0.7214684, -0.1670404, 1, 1, 1, 1, 1,
0.4585893, -0.2913789, 1.57385, 1, 1, 1, 1, 1,
0.4642274, 1.449347, -0.6183861, 1, 1, 1, 1, 1,
0.4660706, 0.6342277, 1.026639, 1, 1, 1, 1, 1,
0.4707108, 0.5831456, 2.554791, 1, 1, 1, 1, 1,
0.4716327, 1.79037, -0.6550429, 1, 1, 1, 1, 1,
0.473775, -1.242993, 1.778736, 1, 1, 1, 1, 1,
0.4746387, -0.01491602, 2.199446, 1, 1, 1, 1, 1,
0.4764479, 1.597419, 1.379128, 1, 1, 1, 1, 1,
0.4795372, 1.373457, -0.6413466, 1, 1, 1, 1, 1,
0.4803217, -0.9426594, 2.316535, 1, 1, 1, 1, 1,
0.4807485, -0.2081703, 2.61194, 1, 1, 1, 1, 1,
0.4868087, 1.684498, 2.209368, 1, 1, 1, 1, 1,
0.4905797, -0.9291401, 2.00348, 1, 1, 1, 1, 1,
0.4940131, -0.7542328, 3.788059, 1, 1, 1, 1, 1,
0.4941055, 0.6374547, 1.714477, 0, 0, 1, 1, 1,
0.4957565, -2.701306, 3.738576, 1, 0, 0, 1, 1,
0.4984173, 0.6024072, 0.02731725, 1, 0, 0, 1, 1,
0.4989058, -0.82845, 3.079281, 1, 0, 0, 1, 1,
0.5001103, 0.5101051, -1.052962, 1, 0, 0, 1, 1,
0.5005597, 0.7950046, 0.3904732, 1, 0, 0, 1, 1,
0.505708, -1.868311, 1.200901, 0, 0, 0, 1, 1,
0.510194, -1.241575, 3.424918, 0, 0, 0, 1, 1,
0.5109287, 1.597597, -0.8898132, 0, 0, 0, 1, 1,
0.5185473, 1.623113, 2.350686, 0, 0, 0, 1, 1,
0.5232296, -1.308372, 3.938229, 0, 0, 0, 1, 1,
0.5241415, 0.6456704, -0.2473276, 0, 0, 0, 1, 1,
0.5248636, 1.634808, 1.96595, 0, 0, 0, 1, 1,
0.5305255, 1.669727, -0.6942458, 1, 1, 1, 1, 1,
0.5316808, -0.9382739, 0.1257357, 1, 1, 1, 1, 1,
0.5379938, 0.7154255, -0.06618893, 1, 1, 1, 1, 1,
0.5486235, -0.2547207, 3.557675, 1, 1, 1, 1, 1,
0.5570482, -0.7409015, 2.606013, 1, 1, 1, 1, 1,
0.5596565, -0.9226285, 4.397482, 1, 1, 1, 1, 1,
0.5626227, -0.3379577, 3.564861, 1, 1, 1, 1, 1,
0.5667056, -1.850991, 1.190552, 1, 1, 1, 1, 1,
0.5671807, -0.3294697, 1.332371, 1, 1, 1, 1, 1,
0.5707808, -0.7692536, 1.649404, 1, 1, 1, 1, 1,
0.5717647, -0.9201505, 3.563639, 1, 1, 1, 1, 1,
0.5735551, 0.5975271, 1.153896, 1, 1, 1, 1, 1,
0.5740863, -0.1445798, 1.457162, 1, 1, 1, 1, 1,
0.5758337, -0.572476, 0.629474, 1, 1, 1, 1, 1,
0.5766171, -0.8311061, 4.001162, 1, 1, 1, 1, 1,
0.5811464, -1.162631, 3.489609, 0, 0, 1, 1, 1,
0.5823029, 0.8530667, -0.9674315, 1, 0, 0, 1, 1,
0.5832813, 2.883455, -0.925948, 1, 0, 0, 1, 1,
0.5857344, 0.06494343, -0.01836988, 1, 0, 0, 1, 1,
0.5862904, 0.4252684, 0.8773556, 1, 0, 0, 1, 1,
0.5893577, -0.4965549, 0.4323666, 1, 0, 0, 1, 1,
0.589924, -1.421479, 2.219703, 0, 0, 0, 1, 1,
0.5903176, 1.440219, 1.397971, 0, 0, 0, 1, 1,
0.5921075, -0.4287612, 1.446373, 0, 0, 0, 1, 1,
0.5998201, -0.8066396, 2.836202, 0, 0, 0, 1, 1,
0.6055149, 0.2854405, 0.3132638, 0, 0, 0, 1, 1,
0.605972, 0.643613, 2.52032, 0, 0, 0, 1, 1,
0.6178821, 0.1845604, 2.672983, 0, 0, 0, 1, 1,
0.6265281, -1.198762, 0.7449073, 1, 1, 1, 1, 1,
0.6305346, -0.1897455, 2.774305, 1, 1, 1, 1, 1,
0.6321383, 0.6937756, 0.4786138, 1, 1, 1, 1, 1,
0.6399888, 1.805353, 0.3976297, 1, 1, 1, 1, 1,
0.645669, 1.477431, 0.6838368, 1, 1, 1, 1, 1,
0.6481062, -0.8778583, 2.753025, 1, 1, 1, 1, 1,
0.6489192, 1.042979, 0.3996851, 1, 1, 1, 1, 1,
0.6489323, -0.9766536, 2.817449, 1, 1, 1, 1, 1,
0.6514077, 1.973562, 1.338549, 1, 1, 1, 1, 1,
0.6517612, -0.5998715, 2.534394, 1, 1, 1, 1, 1,
0.6548104, -0.7539642, 3.52643, 1, 1, 1, 1, 1,
0.6610556, 0.4311757, 1.795428, 1, 1, 1, 1, 1,
0.6693197, 0.7978818, 0.5993087, 1, 1, 1, 1, 1,
0.6708494, -0.8906257, 1.732197, 1, 1, 1, 1, 1,
0.6740215, -0.6753399, 1.915055, 1, 1, 1, 1, 1,
0.6761357, 0.4954604, -0.5388168, 0, 0, 1, 1, 1,
0.6813995, 1.916861, -0.1449914, 1, 0, 0, 1, 1,
0.6836159, 1.161396, 0.5402808, 1, 0, 0, 1, 1,
0.6841412, 0.9310308, 0.7623332, 1, 0, 0, 1, 1,
0.6947467, -0.8273879, 1.59021, 1, 0, 0, 1, 1,
0.6951305, 2.229803, 1.299312, 1, 0, 0, 1, 1,
0.6975384, -0.7886525, 4.274555, 0, 0, 0, 1, 1,
0.6982376, 1.469406, 2.083578, 0, 0, 0, 1, 1,
0.70654, -1.698933, 2.338261, 0, 0, 0, 1, 1,
0.7087215, -0.7121299, 1.50325, 0, 0, 0, 1, 1,
0.7091219, -1.94328, 4.11849, 0, 0, 0, 1, 1,
0.709461, -0.9345331, 2.162906, 0, 0, 0, 1, 1,
0.7145026, -1.808612, 3.395748, 0, 0, 0, 1, 1,
0.7202215, 0.07603928, 0.9897899, 1, 1, 1, 1, 1,
0.7211355, 0.08361859, 1.356627, 1, 1, 1, 1, 1,
0.7220856, 1.217817, -1.142529, 1, 1, 1, 1, 1,
0.7258094, -1.947647, 3.052736, 1, 1, 1, 1, 1,
0.7291836, 1.011562, 2.300827, 1, 1, 1, 1, 1,
0.7404533, 0.2459278, 1.790636, 1, 1, 1, 1, 1,
0.746331, 1.343281, 0.06670552, 1, 1, 1, 1, 1,
0.7470077, 0.1228219, 0.0153414, 1, 1, 1, 1, 1,
0.7474756, -0.9144725, 1.700904, 1, 1, 1, 1, 1,
0.7498434, -0.4505642, 1.677618, 1, 1, 1, 1, 1,
0.7522654, -0.748716, 2.337401, 1, 1, 1, 1, 1,
0.755853, -0.467532, 1.186005, 1, 1, 1, 1, 1,
0.7579739, 0.4084781, 1.169724, 1, 1, 1, 1, 1,
0.7591389, 0.4996626, 1.052004, 1, 1, 1, 1, 1,
0.7606919, -0.05839007, 2.126898, 1, 1, 1, 1, 1,
0.7619483, 0.5456242, 0.5492399, 0, 0, 1, 1, 1,
0.7624764, 0.3695713, 0.422182, 1, 0, 0, 1, 1,
0.7655954, 0.9671594, 0.2800747, 1, 0, 0, 1, 1,
0.7714024, -0.9097027, 2.054557, 1, 0, 0, 1, 1,
0.7741171, 0.1445506, 1.087671, 1, 0, 0, 1, 1,
0.7784067, 0.000343092, -0.07405483, 1, 0, 0, 1, 1,
0.7856864, -0.6627186, 0.5867191, 0, 0, 0, 1, 1,
0.800932, -0.1258301, 2.09556, 0, 0, 0, 1, 1,
0.8019851, 0.6230342, 0.963587, 0, 0, 0, 1, 1,
0.8030729, 0.1161731, 2.295215, 0, 0, 0, 1, 1,
0.8058714, 0.3075337, -0.9690034, 0, 0, 0, 1, 1,
0.8106372, -2.418284, 2.483229, 0, 0, 0, 1, 1,
0.8113273, 0.2356437, 0.7972589, 0, 0, 0, 1, 1,
0.8151159, -1.01524, 0.175163, 1, 1, 1, 1, 1,
0.8162395, -0.744308, 2.778153, 1, 1, 1, 1, 1,
0.8162704, 0.9745345, 0.8823509, 1, 1, 1, 1, 1,
0.816412, -0.1415347, 2.447221, 1, 1, 1, 1, 1,
0.8172696, -0.2459571, 2.052804, 1, 1, 1, 1, 1,
0.8339691, 1.096737, 2.192955, 1, 1, 1, 1, 1,
0.8359948, 0.2317721, 2.324934, 1, 1, 1, 1, 1,
0.8388097, -0.4469506, 2.833578, 1, 1, 1, 1, 1,
0.8392758, -1.575121, 4.3467, 1, 1, 1, 1, 1,
0.8424186, 1.20131, 1.984717, 1, 1, 1, 1, 1,
0.8449128, 1.301819, 0.6113107, 1, 1, 1, 1, 1,
0.8458407, 0.6464338, -0.1521616, 1, 1, 1, 1, 1,
0.8469895, -0.8222784, 2.332366, 1, 1, 1, 1, 1,
0.8478268, 1.029327, 0.08083524, 1, 1, 1, 1, 1,
0.8487319, -0.2042835, 4.190987, 1, 1, 1, 1, 1,
0.849049, -0.4600165, -0.2195377, 0, 0, 1, 1, 1,
0.8564466, 0.3113626, 1.154882, 1, 0, 0, 1, 1,
0.8580142, 0.5732393, 2.392191, 1, 0, 0, 1, 1,
0.8585818, 1.248079, -0.4730598, 1, 0, 0, 1, 1,
0.864575, -0.7203689, 0.9978279, 1, 0, 0, 1, 1,
0.8708966, -1.926337, 2.818408, 1, 0, 0, 1, 1,
0.8718457, 1.070649, 1.689322, 0, 0, 0, 1, 1,
0.8730128, 1.167583, 1.194411, 0, 0, 0, 1, 1,
0.8759812, -0.6932042, 0.9701133, 0, 0, 0, 1, 1,
0.8779862, -1.488522, 3.521024, 0, 0, 0, 1, 1,
0.884014, -0.1392324, 4.102506, 0, 0, 0, 1, 1,
0.8871772, -2.38278, 3.405325, 0, 0, 0, 1, 1,
0.8990704, 1.086246, 2.301291, 0, 0, 0, 1, 1,
0.9007361, 0.8447259, 0.7281169, 1, 1, 1, 1, 1,
0.915782, -1.307215, 2.128148, 1, 1, 1, 1, 1,
0.9170095, 2.733727, -0.2417927, 1, 1, 1, 1, 1,
0.9170801, 1.747313, -0.5059319, 1, 1, 1, 1, 1,
0.9179555, 1.233504, -0.405693, 1, 1, 1, 1, 1,
0.9256056, 0.7623556, 1.568106, 1, 1, 1, 1, 1,
0.9283487, 1.474564, 0.7073604, 1, 1, 1, 1, 1,
0.9320407, 2.385488, 0.2827567, 1, 1, 1, 1, 1,
0.9390681, 0.8538889, 0.5266365, 1, 1, 1, 1, 1,
0.9399348, 0.6410549, -0.001337809, 1, 1, 1, 1, 1,
0.9432906, 0.3585687, 1.619368, 1, 1, 1, 1, 1,
0.9608567, 1.063877, 0.5004717, 1, 1, 1, 1, 1,
0.9661283, 0.8311178, -0.104001, 1, 1, 1, 1, 1,
0.9694976, -0.6451266, 0.9587574, 1, 1, 1, 1, 1,
0.9725008, 0.4674214, 2.664261, 1, 1, 1, 1, 1,
0.9747036, 0.1310688, 0.06346811, 0, 0, 1, 1, 1,
0.9776568, -0.487093, 1.916015, 1, 0, 0, 1, 1,
0.9781181, -0.3266604, 2.219889, 1, 0, 0, 1, 1,
0.9846504, -0.4977248, 1.366516, 1, 0, 0, 1, 1,
0.9858782, 0.5829046, 1.455388, 1, 0, 0, 1, 1,
0.986986, -1.050501, 2.551579, 1, 0, 0, 1, 1,
0.9918967, 1.10546, 1.74105, 0, 0, 0, 1, 1,
0.9954897, 1.071744, 1.259955, 0, 0, 0, 1, 1,
1.000626, 0.4262876, 0.336307, 0, 0, 0, 1, 1,
1.004411, 0.6720426, 0.2213246, 0, 0, 0, 1, 1,
1.00543, 0.2903302, 1.358855, 0, 0, 0, 1, 1,
1.005687, 1.906962, 0.1092721, 0, 0, 0, 1, 1,
1.011448, 0.424602, 0.03743873, 0, 0, 0, 1, 1,
1.012065, 0.7489293, 1.169849, 1, 1, 1, 1, 1,
1.013584, 0.3732001, 1.737859, 1, 1, 1, 1, 1,
1.023584, 0.3967892, 2.156148, 1, 1, 1, 1, 1,
1.040483, -0.8349328, 2.229601, 1, 1, 1, 1, 1,
1.043472, -1.310364, 1.86426, 1, 1, 1, 1, 1,
1.04836, 0.4253691, 2.071454, 1, 1, 1, 1, 1,
1.049143, 2.100422, -0.856746, 1, 1, 1, 1, 1,
1.051564, -1.112025, 0.6002504, 1, 1, 1, 1, 1,
1.061113, -1.316174, 2.434664, 1, 1, 1, 1, 1,
1.067562, 0.1752884, -0.4951187, 1, 1, 1, 1, 1,
1.072183, 0.2835192, 3.251818, 1, 1, 1, 1, 1,
1.072508, -0.1328991, 1.898606, 1, 1, 1, 1, 1,
1.073413, 0.4504902, 1.83998, 1, 1, 1, 1, 1,
1.081171, 0.2156341, 3.187006, 1, 1, 1, 1, 1,
1.083756, 0.7049381, 0.9103392, 1, 1, 1, 1, 1,
1.089257, 2.230998, -0.5862262, 0, 0, 1, 1, 1,
1.09448, -0.7032394, 3.031216, 1, 0, 0, 1, 1,
1.102683, -0.3005933, 2.290363, 1, 0, 0, 1, 1,
1.106161, -0.2032188, 0.9941839, 1, 0, 0, 1, 1,
1.106468, -0.6049371, 3.196161, 1, 0, 0, 1, 1,
1.116924, -0.0308088, 3.316082, 1, 0, 0, 1, 1,
1.118088, 0.05607705, 1.561251, 0, 0, 0, 1, 1,
1.119429, -1.079192, 3.32354, 0, 0, 0, 1, 1,
1.12126, 0.4469334, 1.479638, 0, 0, 0, 1, 1,
1.121682, -0.5326727, 1.730722, 0, 0, 0, 1, 1,
1.123695, 1.09853, 0.548405, 0, 0, 0, 1, 1,
1.13033, 0.5322477, 2.393989, 0, 0, 0, 1, 1,
1.133106, 0.2899194, 2.339927, 0, 0, 0, 1, 1,
1.150949, -0.1705547, 0.9746441, 1, 1, 1, 1, 1,
1.152452, -0.8991489, 1.675667, 1, 1, 1, 1, 1,
1.158567, -0.709228, 2.017542, 1, 1, 1, 1, 1,
1.161437, -0.570657, 2.23916, 1, 1, 1, 1, 1,
1.171392, 1.204892, -0.6350888, 1, 1, 1, 1, 1,
1.18, 1.146395, 0.5122122, 1, 1, 1, 1, 1,
1.188747, 1.323624, 0.1783267, 1, 1, 1, 1, 1,
1.190329, 0.3257625, 1.330124, 1, 1, 1, 1, 1,
1.192298, 0.110016, 0.7881899, 1, 1, 1, 1, 1,
1.200171, 1.403962, 0.4128985, 1, 1, 1, 1, 1,
1.200768, 0.5555955, 0.7117322, 1, 1, 1, 1, 1,
1.201572, -0.5609989, 3.363407, 1, 1, 1, 1, 1,
1.204627, 0.3726207, 1.070547, 1, 1, 1, 1, 1,
1.206062, 0.1911518, 1.169778, 1, 1, 1, 1, 1,
1.207224, -0.01682012, 2.496768, 1, 1, 1, 1, 1,
1.207254, -0.1710785, 0.1923425, 0, 0, 1, 1, 1,
1.214174, -0.4673521, 4.116638, 1, 0, 0, 1, 1,
1.214906, 0.8144972, 1.33238, 1, 0, 0, 1, 1,
1.219213, 1.428749, -0.4992045, 1, 0, 0, 1, 1,
1.220853, -0.9649677, 1.792328, 1, 0, 0, 1, 1,
1.222169, -0.2556935, 2.402673, 1, 0, 0, 1, 1,
1.22289, -0.2941718, 0.9586918, 0, 0, 0, 1, 1,
1.222998, -0.265337, 1.674436, 0, 0, 0, 1, 1,
1.223482, 2.448037, -1.259663, 0, 0, 0, 1, 1,
1.22631, 1.893736, 2.105101, 0, 0, 0, 1, 1,
1.227944, 0.1175289, 2.208388, 0, 0, 0, 1, 1,
1.233683, 1.467882, 1.04967, 0, 0, 0, 1, 1,
1.234471, 0.5514036, 1.453837, 0, 0, 0, 1, 1,
1.236127, 0.5331472, 1.168924, 1, 1, 1, 1, 1,
1.236199, -0.3478142, 1.225496, 1, 1, 1, 1, 1,
1.256064, -1.225559, 3.689958, 1, 1, 1, 1, 1,
1.257124, 0.8091215, 0.09645747, 1, 1, 1, 1, 1,
1.258382, 1.090622, 1.208927, 1, 1, 1, 1, 1,
1.260909, -0.6280758, 1.941277, 1, 1, 1, 1, 1,
1.262469, -0.2128205, 2.26952, 1, 1, 1, 1, 1,
1.280225, -0.3448209, 0.6246844, 1, 1, 1, 1, 1,
1.281785, -0.00108856, 1.942225, 1, 1, 1, 1, 1,
1.287136, 0.9040024, 0.00628254, 1, 1, 1, 1, 1,
1.289798, 0.3025229, 0.9092894, 1, 1, 1, 1, 1,
1.290883, -1.786064, 1.946479, 1, 1, 1, 1, 1,
1.309922, 0.9988297, 2.925624, 1, 1, 1, 1, 1,
1.311513, 0.1996891, 0.7579389, 1, 1, 1, 1, 1,
1.312522, 1.167963, 1.82487, 1, 1, 1, 1, 1,
1.324016, 1.207424, 0.6800438, 0, 0, 1, 1, 1,
1.324679, -1.381819, 0.1168496, 1, 0, 0, 1, 1,
1.328477, 1.501846, 0.4832754, 1, 0, 0, 1, 1,
1.33162, 0.2614216, 0.8504177, 1, 0, 0, 1, 1,
1.331679, -1.818318, 3.836379, 1, 0, 0, 1, 1,
1.340065, 0.5473506, 0.1238922, 1, 0, 0, 1, 1,
1.340735, 1.699915, -1.320769, 0, 0, 0, 1, 1,
1.349749, -1.066539, 0.3328965, 0, 0, 0, 1, 1,
1.353262, 1.122927, -0.2052775, 0, 0, 0, 1, 1,
1.363508, -0.4249785, 3.105208, 0, 0, 0, 1, 1,
1.365073, -0.9034859, 0.8826979, 0, 0, 0, 1, 1,
1.373926, 0.1715183, 1.197716, 0, 0, 0, 1, 1,
1.374521, 1.35995, 1.139625, 0, 0, 0, 1, 1,
1.385184, 1.230994, 1.734409, 1, 1, 1, 1, 1,
1.385829, 0.2845865, 1.753564, 1, 1, 1, 1, 1,
1.387054, 0.9911245, 0.8949904, 1, 1, 1, 1, 1,
1.391876, 0.6700899, 0.1787676, 1, 1, 1, 1, 1,
1.392636, 0.8506052, 1.519967, 1, 1, 1, 1, 1,
1.397973, -0.05791126, -0.102814, 1, 1, 1, 1, 1,
1.400999, 0.5442075, -0.7585568, 1, 1, 1, 1, 1,
1.401349, -0.2334819, 1.221263, 1, 1, 1, 1, 1,
1.402139, 0.8189644, 1.486231, 1, 1, 1, 1, 1,
1.402503, 0.6879575, 2.033378, 1, 1, 1, 1, 1,
1.405325, -0.6708806, 0.04206377, 1, 1, 1, 1, 1,
1.411436, -0.0027219, 3.7078, 1, 1, 1, 1, 1,
1.41387, 1.537376, 1.045032, 1, 1, 1, 1, 1,
1.428377, -1.003168, 1.221859, 1, 1, 1, 1, 1,
1.448907, -0.9754953, 3.998343, 1, 1, 1, 1, 1,
1.44926, -0.2858399, 0.7213535, 0, 0, 1, 1, 1,
1.449891, 0.7587231, 1.650537, 1, 0, 0, 1, 1,
1.45351, -0.2319682, 1.489064, 1, 0, 0, 1, 1,
1.456423, -1.313781, 2.813383, 1, 0, 0, 1, 1,
1.460127, -1.024636, 3.360609, 1, 0, 0, 1, 1,
1.462742, 0.4955917, 1.434772, 1, 0, 0, 1, 1,
1.462886, 0.2415681, 0.6512603, 0, 0, 0, 1, 1,
1.469414, 0.6817734, 0.5042443, 0, 0, 0, 1, 1,
1.477757, 0.03079087, 1.968743, 0, 0, 0, 1, 1,
1.503123, -1.172871, 2.562627, 0, 0, 0, 1, 1,
1.524937, -1.404847, 2.022847, 0, 0, 0, 1, 1,
1.530959, -0.0554131, 0.7422232, 0, 0, 0, 1, 1,
1.531591, 0.1594032, 1.109567, 0, 0, 0, 1, 1,
1.533244, 1.285136, 0.9072613, 1, 1, 1, 1, 1,
1.534283, 1.128515, 0.7183868, 1, 1, 1, 1, 1,
1.539962, -0.7368739, 2.079252, 1, 1, 1, 1, 1,
1.540275, -1.798703, 2.87393, 1, 1, 1, 1, 1,
1.547929, 0.09143691, 1.700758, 1, 1, 1, 1, 1,
1.592713, -1.167183, 2.530532, 1, 1, 1, 1, 1,
1.606881, -0.8023136, 3.564998, 1, 1, 1, 1, 1,
1.614493, -0.5288944, 1.227061, 1, 1, 1, 1, 1,
1.631989, 0.3914276, 3.054336, 1, 1, 1, 1, 1,
1.633148, 1.429171, -0.9085476, 1, 1, 1, 1, 1,
1.639726, -1.003743, 0.1728262, 1, 1, 1, 1, 1,
1.657562, -0.5883607, 0.2198241, 1, 1, 1, 1, 1,
1.661157, -0.1981474, 1.417294, 1, 1, 1, 1, 1,
1.661498, -0.7570255, 2.741422, 1, 1, 1, 1, 1,
1.676584, -0.01970159, 1.712217, 1, 1, 1, 1, 1,
1.712242, -0.5234515, 1.468669, 0, 0, 1, 1, 1,
1.724391, -1.974955, 2.030417, 1, 0, 0, 1, 1,
1.73037, -1.520694, 1.808648, 1, 0, 0, 1, 1,
1.741204, -0.2384531, 4.183999, 1, 0, 0, 1, 1,
1.773437, -0.6351659, 0.5468131, 1, 0, 0, 1, 1,
1.778205, 0.5151111, 2.643558, 1, 0, 0, 1, 1,
1.780034, 1.458169, -0.01186772, 0, 0, 0, 1, 1,
1.801081, -0.3755469, 1.70295, 0, 0, 0, 1, 1,
1.817058, -0.2727071, 1.937554, 0, 0, 0, 1, 1,
1.904291, -0.1066336, 1.349255, 0, 0, 0, 1, 1,
1.926975, 0.3871396, 2.689165, 0, 0, 0, 1, 1,
1.936787, -0.2782357, 1.324097, 0, 0, 0, 1, 1,
1.956928, -0.6837443, 1.874061, 0, 0, 0, 1, 1,
1.980262, -0.6671922, 2.446162, 1, 1, 1, 1, 1,
2.017251, 1.776879, -1.427747, 1, 1, 1, 1, 1,
2.030355, 0.7033874, 0.184337, 1, 1, 1, 1, 1,
2.034367, 0.04537242, 2.64536, 1, 1, 1, 1, 1,
2.076289, -0.9548019, 1.321074, 1, 1, 1, 1, 1,
2.105808, -0.5113907, 1.900752, 1, 1, 1, 1, 1,
2.106966, -1.269014, 1.733012, 1, 1, 1, 1, 1,
2.113501, 0.5160316, 2.328343, 1, 1, 1, 1, 1,
2.122256, 0.8008713, 1.552562, 1, 1, 1, 1, 1,
2.144793, -0.9246459, 1.66988, 1, 1, 1, 1, 1,
2.148652, 0.981949, 0.09904914, 1, 1, 1, 1, 1,
2.158536, 0.3689896, 1.926522, 1, 1, 1, 1, 1,
2.159109, 0.4294349, 0.1625632, 1, 1, 1, 1, 1,
2.169487, 0.3990552, 0.6692149, 1, 1, 1, 1, 1,
2.192595, 0.6514794, 1.897529, 1, 1, 1, 1, 1,
2.220675, -1.358562, 2.367106, 0, 0, 1, 1, 1,
2.232961, -2.782433, 0.8926718, 1, 0, 0, 1, 1,
2.25638, 1.361325, 1.954957, 1, 0, 0, 1, 1,
2.35456, 0.2885533, 2.655162, 1, 0, 0, 1, 1,
2.452758, 0.0776699, 1.434054, 1, 0, 0, 1, 1,
2.469528, -0.876479, 3.159967, 1, 0, 0, 1, 1,
2.48947, 0.1614663, 1.612206, 0, 0, 0, 1, 1,
2.504506, 1.239639, 1.049667, 0, 0, 0, 1, 1,
2.519802, -0.5627792, 2.132785, 0, 0, 0, 1, 1,
2.53988, 0.6194775, 1.364948, 0, 0, 0, 1, 1,
2.571989, 2.647325, 0.4520436, 0, 0, 0, 1, 1,
2.590171, 1.50526, 1.508524, 0, 0, 0, 1, 1,
2.650809, 0.4098967, 2.393622, 0, 0, 0, 1, 1,
2.654011, -0.06213186, 3.095493, 1, 1, 1, 1, 1,
2.677843, 0.06838371, 3.186512, 1, 1, 1, 1, 1,
2.730991, 2.353217, -0.08283775, 1, 1, 1, 1, 1,
2.764196, 0.9551268, 0.9734871, 1, 1, 1, 1, 1,
2.829998, 2.143613, 2.571317, 1, 1, 1, 1, 1,
2.887359, -1.024581, 1.427699, 1, 1, 1, 1, 1,
3.011665, -0.08082402, 3.049036, 1, 1, 1, 1, 1
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
var radius = 9.39532;
var distance = 33.00066;
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
mvMatrix.translate( -0.02700722, -0.3437595, 0.4774654 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.00066);
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