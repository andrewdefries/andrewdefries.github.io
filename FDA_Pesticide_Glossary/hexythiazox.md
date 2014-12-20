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
-3.192618, -0.0467845, -0.8408237, 1, 0, 0, 1,
-3.144134, 1.165237, -0.7614498, 1, 0.007843138, 0, 1,
-2.943054, -1.104303, -2.6081, 1, 0.01176471, 0, 1,
-2.864766, -1.047006, -1.067899, 1, 0.01960784, 0, 1,
-2.722081, 1.557998, 0.6742917, 1, 0.02352941, 0, 1,
-2.713754, -0.2709248, -2.64692, 1, 0.03137255, 0, 1,
-2.625486, 1.010157, -1.384484, 1, 0.03529412, 0, 1,
-2.548767, -0.7242978, -1.046725, 1, 0.04313726, 0, 1,
-2.468002, 1.831273, -1.546352, 1, 0.04705882, 0, 1,
-2.437782, -0.9893863, -0.5238875, 1, 0.05490196, 0, 1,
-2.416386, 0.4399706, 0.5247419, 1, 0.05882353, 0, 1,
-2.279529, -1.226286, -2.748044, 1, 0.06666667, 0, 1,
-2.277232, 1.445649, -1.003618, 1, 0.07058824, 0, 1,
-2.255236, 0.2664387, -0.9865177, 1, 0.07843138, 0, 1,
-2.20255, -0.710388, -2.08369, 1, 0.08235294, 0, 1,
-2.176706, 0.1667243, -0.5339516, 1, 0.09019608, 0, 1,
-2.150123, 0.4825773, -1.339957, 1, 0.09411765, 0, 1,
-2.137836, -0.5674466, -0.5777305, 1, 0.1019608, 0, 1,
-2.109229, -0.2350772, -1.382528, 1, 0.1098039, 0, 1,
-2.092748, 0.1473273, -3.508713, 1, 0.1137255, 0, 1,
-2.061937, 0.1626163, -1.498643, 1, 0.1215686, 0, 1,
-2.03694, -0.07173151, -0.8994793, 1, 0.1254902, 0, 1,
-2.009499, -0.7325764, -2.388304, 1, 0.1333333, 0, 1,
-2.006401, 1.233491, -0.9722397, 1, 0.1372549, 0, 1,
-1.997656, 0.8876012, -3.282232, 1, 0.145098, 0, 1,
-1.980205, 1.634704, -1.911028, 1, 0.1490196, 0, 1,
-1.968666, -0.1433996, -1.286802, 1, 0.1568628, 0, 1,
-1.954185, 0.1598627, -0.34703, 1, 0.1607843, 0, 1,
-1.932856, -0.5453274, -2.567973, 1, 0.1686275, 0, 1,
-1.92333, 0.9606453, 1.006344, 1, 0.172549, 0, 1,
-1.923051, 1.150578, -0.4196917, 1, 0.1803922, 0, 1,
-1.88859, -1.02424, -2.023377, 1, 0.1843137, 0, 1,
-1.887344, 0.7965752, -3.490491, 1, 0.1921569, 0, 1,
-1.877524, -0.1429025, -2.755467, 1, 0.1960784, 0, 1,
-1.861487, -0.1122928, -1.644091, 1, 0.2039216, 0, 1,
-1.85686, 0.212441, -2.620227, 1, 0.2117647, 0, 1,
-1.848504, -1.2366, -2.873987, 1, 0.2156863, 0, 1,
-1.834338, -0.03981091, -0.286507, 1, 0.2235294, 0, 1,
-1.82109, 1.728691, -0.7853522, 1, 0.227451, 0, 1,
-1.80857, 0.6975141, -3.200204, 1, 0.2352941, 0, 1,
-1.806847, -1.981596, -3.362906, 1, 0.2392157, 0, 1,
-1.798804, -1.349192, -1.746264, 1, 0.2470588, 0, 1,
-1.784184, -0.7796997, -2.759444, 1, 0.2509804, 0, 1,
-1.767447, 0.172943, -1.57969, 1, 0.2588235, 0, 1,
-1.746945, -0.4177576, -3.279911, 1, 0.2627451, 0, 1,
-1.74529, 0.1882878, -1.848664, 1, 0.2705882, 0, 1,
-1.711536, -1.288108, -1.630573, 1, 0.2745098, 0, 1,
-1.701303, 0.2361761, -0.3912328, 1, 0.282353, 0, 1,
-1.699241, 0.3394044, -1.194868, 1, 0.2862745, 0, 1,
-1.673929, -0.7618411, -2.494884, 1, 0.2941177, 0, 1,
-1.668139, 1.199819, -0.8905542, 1, 0.3019608, 0, 1,
-1.657834, 0.6043407, -2.494769, 1, 0.3058824, 0, 1,
-1.639723, 0.4457895, -2.064079, 1, 0.3137255, 0, 1,
-1.637366, 0.3067481, -1.045776, 1, 0.3176471, 0, 1,
-1.635648, -0.2740457, -0.8061872, 1, 0.3254902, 0, 1,
-1.629542, 0.5743775, -1.629723, 1, 0.3294118, 0, 1,
-1.610364, -1.192388, -2.198841, 1, 0.3372549, 0, 1,
-1.601368, 0.9747875, 0.2090049, 1, 0.3411765, 0, 1,
-1.57123, 1.682774, 1.048518, 1, 0.3490196, 0, 1,
-1.54895, -0.7028278, -0.8974133, 1, 0.3529412, 0, 1,
-1.548933, 0.5138953, -2.738174, 1, 0.3607843, 0, 1,
-1.548473, 1.308369, 0.08702568, 1, 0.3647059, 0, 1,
-1.523394, 0.6168201, -3.635747, 1, 0.372549, 0, 1,
-1.523351, -0.2720652, -2.285285, 1, 0.3764706, 0, 1,
-1.512058, 0.8101623, -0.461183, 1, 0.3843137, 0, 1,
-1.490523, 0.0003875093, -1.180221, 1, 0.3882353, 0, 1,
-1.48985, -0.8062908, -1.548057, 1, 0.3960784, 0, 1,
-1.48168, 0.3549176, -2.71729, 1, 0.4039216, 0, 1,
-1.478404, 0.423481, -0.5114096, 1, 0.4078431, 0, 1,
-1.476748, -1.319374, -2.206035, 1, 0.4156863, 0, 1,
-1.467126, 0.8673564, -0.2670189, 1, 0.4196078, 0, 1,
-1.463241, -0.6717932, -1.634274, 1, 0.427451, 0, 1,
-1.461995, 0.7815906, -0.5048666, 1, 0.4313726, 0, 1,
-1.460986, -0.8390855, -3.045546, 1, 0.4392157, 0, 1,
-1.457447, -0.6632576, -2.0197, 1, 0.4431373, 0, 1,
-1.443959, 1.770276, 0.2175478, 1, 0.4509804, 0, 1,
-1.439364, 1.171965, -2.588497, 1, 0.454902, 0, 1,
-1.424673, 0.3581016, -1.818629, 1, 0.4627451, 0, 1,
-1.412848, 0.007010558, -2.048745, 1, 0.4666667, 0, 1,
-1.39401, -0.7186183, -3.291726, 1, 0.4745098, 0, 1,
-1.389307, -0.7169527, 0.1677888, 1, 0.4784314, 0, 1,
-1.37362, -2.233629, -2.562994, 1, 0.4862745, 0, 1,
-1.368837, -0.7506292, -1.709216, 1, 0.4901961, 0, 1,
-1.364635, 0.368835, 0.4483566, 1, 0.4980392, 0, 1,
-1.360339, 1.470436, -0.7296813, 1, 0.5058824, 0, 1,
-1.356266, 0.3514638, -0.712109, 1, 0.509804, 0, 1,
-1.353263, -0.519995, -1.971249, 1, 0.5176471, 0, 1,
-1.353044, 0.6167676, -0.5749601, 1, 0.5215687, 0, 1,
-1.350603, 0.6749433, -0.9194784, 1, 0.5294118, 0, 1,
-1.350518, 0.9727823, -1.599659, 1, 0.5333334, 0, 1,
-1.340859, -1.515118, -1.533424, 1, 0.5411765, 0, 1,
-1.340491, 1.339949, -0.1232345, 1, 0.5450981, 0, 1,
-1.320932, 0.4803514, -0.1422965, 1, 0.5529412, 0, 1,
-1.317272, 0.5364527, 0.6284821, 1, 0.5568628, 0, 1,
-1.315178, 0.6629322, -2.853196, 1, 0.5647059, 0, 1,
-1.308058, -0.3409538, -0.9531055, 1, 0.5686275, 0, 1,
-1.307721, -0.7080479, -1.720809, 1, 0.5764706, 0, 1,
-1.306717, 0.2507797, 0.2624118, 1, 0.5803922, 0, 1,
-1.302332, 0.7528823, 0.7881578, 1, 0.5882353, 0, 1,
-1.301791, 0.02711939, 0.1857416, 1, 0.5921569, 0, 1,
-1.299238, -0.4695631, -3.335566, 1, 0.6, 0, 1,
-1.289701, 0.1881038, -3.246476, 1, 0.6078432, 0, 1,
-1.288906, 1.260217, -0.4990778, 1, 0.6117647, 0, 1,
-1.286081, 2.280674, -2.985383, 1, 0.6196079, 0, 1,
-1.284655, 0.5979959, -1.366424, 1, 0.6235294, 0, 1,
-1.282658, -0.4978052, -0.3888465, 1, 0.6313726, 0, 1,
-1.282239, 0.2721017, -1.286259, 1, 0.6352941, 0, 1,
-1.280898, 1.991373, -0.001767344, 1, 0.6431373, 0, 1,
-1.275481, -0.009589726, -3.623382, 1, 0.6470588, 0, 1,
-1.273157, 1.051832, -1.926521, 1, 0.654902, 0, 1,
-1.269728, -0.6787947, -2.277609, 1, 0.6588235, 0, 1,
-1.261746, -0.9742209, -1.900207, 1, 0.6666667, 0, 1,
-1.255205, 0.7273057, -0.7672861, 1, 0.6705883, 0, 1,
-1.254264, 0.1918918, 0.1112579, 1, 0.6784314, 0, 1,
-1.239266, 0.4362303, -1.264267, 1, 0.682353, 0, 1,
-1.235841, 0.9376318, 0.502082, 1, 0.6901961, 0, 1,
-1.231967, 1.644335, 0.6247201, 1, 0.6941177, 0, 1,
-1.226006, -1.318335, -3.29054, 1, 0.7019608, 0, 1,
-1.225404, -0.7578018, 0.4731838, 1, 0.7098039, 0, 1,
-1.222427, 0.4296479, -2.164452, 1, 0.7137255, 0, 1,
-1.220445, 0.7860035, 0.1490039, 1, 0.7215686, 0, 1,
-1.211695, -2.008759, -3.723512, 1, 0.7254902, 0, 1,
-1.20766, 0.6520786, 0.2042354, 1, 0.7333333, 0, 1,
-1.205188, -0.07570817, -0.5245214, 1, 0.7372549, 0, 1,
-1.204409, 0.1438859, -0.7252629, 1, 0.7450981, 0, 1,
-1.196311, -0.9115346, -1.454904, 1, 0.7490196, 0, 1,
-1.195142, -0.4282802, -1.706733, 1, 0.7568628, 0, 1,
-1.190637, 0.3879208, 0.9194755, 1, 0.7607843, 0, 1,
-1.186199, 1.029105, -1.177483, 1, 0.7686275, 0, 1,
-1.182917, -0.1598384, -1.927298, 1, 0.772549, 0, 1,
-1.179624, -0.4355162, -3.63278, 1, 0.7803922, 0, 1,
-1.176005, -0.9225937, -1.37472, 1, 0.7843137, 0, 1,
-1.161016, -0.5451868, -1.10862, 1, 0.7921569, 0, 1,
-1.159031, 1.779878, -0.5673045, 1, 0.7960784, 0, 1,
-1.152541, -0.5690397, -1.978832, 1, 0.8039216, 0, 1,
-1.149779, -0.3594637, -2.625455, 1, 0.8117647, 0, 1,
-1.143614, -0.3780926, -1.817427, 1, 0.8156863, 0, 1,
-1.14144, -0.2372651, -0.8974733, 1, 0.8235294, 0, 1,
-1.140815, 1.251738, -0.1479795, 1, 0.827451, 0, 1,
-1.135835, -0.536183, -1.21676, 1, 0.8352941, 0, 1,
-1.134812, -0.4617215, -1.730141, 1, 0.8392157, 0, 1,
-1.129057, -1.399297, -1.075064, 1, 0.8470588, 0, 1,
-1.127261, -0.4607934, -0.1092692, 1, 0.8509804, 0, 1,
-1.125562, -1.272705, -2.568837, 1, 0.8588235, 0, 1,
-1.115435, -1.056549, -2.878309, 1, 0.8627451, 0, 1,
-1.111719, -0.1653795, -1.085669, 1, 0.8705882, 0, 1,
-1.106865, -0.1948681, -1.640947, 1, 0.8745098, 0, 1,
-1.102498, 0.9309966, -1.405462, 1, 0.8823529, 0, 1,
-1.095196, 0.4320158, -2.066997, 1, 0.8862745, 0, 1,
-1.092867, -1.071813, -1.801391, 1, 0.8941177, 0, 1,
-1.091167, -2.599707, -2.344244, 1, 0.8980392, 0, 1,
-1.089046, -1.427936, -1.35739, 1, 0.9058824, 0, 1,
-1.082862, 0.6770852, 0.6709849, 1, 0.9137255, 0, 1,
-1.074614, -1.471172, -0.7680126, 1, 0.9176471, 0, 1,
-1.073877, 1.440889, 0.1282688, 1, 0.9254902, 0, 1,
-1.060117, -0.7076129, -3.368086, 1, 0.9294118, 0, 1,
-1.054282, 0.7398993, -2.612212, 1, 0.9372549, 0, 1,
-1.04997, -1.192588, -3.198294, 1, 0.9411765, 0, 1,
-1.049625, -0.3425901, 0.1807425, 1, 0.9490196, 0, 1,
-1.0425, 1.046772, 1.260493, 1, 0.9529412, 0, 1,
-1.036895, 1.021188, -2.594401, 1, 0.9607843, 0, 1,
-1.033635, 0.3289892, -0.2342029, 1, 0.9647059, 0, 1,
-1.03141, 0.4723228, -0.9386908, 1, 0.972549, 0, 1,
-1.028838, 0.5170475, -2.67186, 1, 0.9764706, 0, 1,
-1.024325, 1.811048, -1.494002, 1, 0.9843137, 0, 1,
-1.021187, -0.6938726, -1.128698, 1, 0.9882353, 0, 1,
-1.020254, 0.1238184, -2.071723, 1, 0.9960784, 0, 1,
-1.015833, 0.305824, -2.223359, 0.9960784, 1, 0, 1,
-1.011382, 1.665531, 0.09180981, 0.9921569, 1, 0, 1,
-0.9976379, 0.5731009, -1.095879, 0.9843137, 1, 0, 1,
-0.9975787, 0.5958067, 0.6206023, 0.9803922, 1, 0, 1,
-0.9954044, 0.2901156, -1.837776, 0.972549, 1, 0, 1,
-0.9945037, 0.3107425, -1.695332, 0.9686275, 1, 0, 1,
-0.9858271, -1.053307, -0.5982872, 0.9607843, 1, 0, 1,
-0.9843639, 0.05741093, -2.066587, 0.9568627, 1, 0, 1,
-0.9822491, 2.58518, 0.09696375, 0.9490196, 1, 0, 1,
-0.981074, -0.8345044, -3.721951, 0.945098, 1, 0, 1,
-0.9763184, 0.3323786, -0.8235511, 0.9372549, 1, 0, 1,
-0.9757079, -0.4320036, -3.621178, 0.9333333, 1, 0, 1,
-0.9750478, 0.1517714, -1.518792, 0.9254902, 1, 0, 1,
-0.9744167, 0.02731954, -2.743205, 0.9215686, 1, 0, 1,
-0.9737477, -0.05922775, -1.619252, 0.9137255, 1, 0, 1,
-0.9724166, 1.405239, -1.401053, 0.9098039, 1, 0, 1,
-0.9717727, -0.2011774, -2.491158, 0.9019608, 1, 0, 1,
-0.9696065, 1.384449, 0.4597329, 0.8941177, 1, 0, 1,
-0.9566413, 0.7489055, 0.3946005, 0.8901961, 1, 0, 1,
-0.9551143, -0.5668774, -1.719384, 0.8823529, 1, 0, 1,
-0.9522415, -1.358991, -3.805351, 0.8784314, 1, 0, 1,
-0.9492431, 1.588614, 1.371534, 0.8705882, 1, 0, 1,
-0.9490362, -0.2981493, -0.7932733, 0.8666667, 1, 0, 1,
-0.9392539, -0.7931474, -3.442157, 0.8588235, 1, 0, 1,
-0.9390001, 1.148302, 2.346879, 0.854902, 1, 0, 1,
-0.9380889, -0.3388081, -3.67026, 0.8470588, 1, 0, 1,
-0.9356613, 0.9795343, -3.482674, 0.8431373, 1, 0, 1,
-0.9274753, -0.089713, -2.533716, 0.8352941, 1, 0, 1,
-0.92221, 0.5136216, -0.5439088, 0.8313726, 1, 0, 1,
-0.9143677, 0.548616, -2.733539, 0.8235294, 1, 0, 1,
-0.9137266, -0.1554479, -0.4984203, 0.8196079, 1, 0, 1,
-0.9110785, -1.276436, -1.020903, 0.8117647, 1, 0, 1,
-0.9067646, -0.0621831, 0.1527509, 0.8078431, 1, 0, 1,
-0.9065683, -0.4006371, -2.318542, 0.8, 1, 0, 1,
-0.9035248, -0.1911025, -2.884015, 0.7921569, 1, 0, 1,
-0.8927946, -1.183674, -3.20285, 0.7882353, 1, 0, 1,
-0.8826612, 0.8265502, -0.6875629, 0.7803922, 1, 0, 1,
-0.878401, -0.2147185, -1.604568, 0.7764706, 1, 0, 1,
-0.8775649, 1.653041, -0.7815053, 0.7686275, 1, 0, 1,
-0.8771268, -2.410053, -1.296629, 0.7647059, 1, 0, 1,
-0.8660641, 1.434024, -1.157527, 0.7568628, 1, 0, 1,
-0.8546646, 2.237954, 0.6043161, 0.7529412, 1, 0, 1,
-0.8476597, 1.996913, -0.5180237, 0.7450981, 1, 0, 1,
-0.8420537, 0.8134058, -2.061138, 0.7411765, 1, 0, 1,
-0.8409461, -0.07323552, -2.82328, 0.7333333, 1, 0, 1,
-0.8377858, -1.143664, -2.453212, 0.7294118, 1, 0, 1,
-0.835775, -0.5341656, -1.025815, 0.7215686, 1, 0, 1,
-0.8354431, 0.655071, -0.6234239, 0.7176471, 1, 0, 1,
-0.8352346, -1.599364, -2.880502, 0.7098039, 1, 0, 1,
-0.8322842, 0.2794272, -2.546813, 0.7058824, 1, 0, 1,
-0.8263237, 1.015182, -0.4851981, 0.6980392, 1, 0, 1,
-0.82364, -0.2238762, -1.862769, 0.6901961, 1, 0, 1,
-0.8186798, 0.8251212, -1.899841, 0.6862745, 1, 0, 1,
-0.8150565, -1.50241, -2.743982, 0.6784314, 1, 0, 1,
-0.8076693, -1.88604, -2.197173, 0.6745098, 1, 0, 1,
-0.8003832, 0.3292612, -0.5689813, 0.6666667, 1, 0, 1,
-0.7917616, -1.146911, -3.335913, 0.6627451, 1, 0, 1,
-0.7747252, -0.909331, -1.963981, 0.654902, 1, 0, 1,
-0.7723809, -1.41743, -0.775126, 0.6509804, 1, 0, 1,
-0.7667348, 0.6467497, -1.117444, 0.6431373, 1, 0, 1,
-0.7634095, 0.03061226, -2.90417, 0.6392157, 1, 0, 1,
-0.760446, -0.8447846, -2.485135, 0.6313726, 1, 0, 1,
-0.7584159, 0.9973421, -1.999557, 0.627451, 1, 0, 1,
-0.7552706, -0.3853857, -1.762964, 0.6196079, 1, 0, 1,
-0.7465405, -0.2628063, -3.134946, 0.6156863, 1, 0, 1,
-0.7448172, -0.6416603, -5.00701, 0.6078432, 1, 0, 1,
-0.741922, -0.7088961, -1.81546, 0.6039216, 1, 0, 1,
-0.7343805, -0.5323808, -3.422743, 0.5960785, 1, 0, 1,
-0.7213867, -0.5669242, -3.441854, 0.5882353, 1, 0, 1,
-0.7206375, -1.546567, -1.795831, 0.5843138, 1, 0, 1,
-0.7170874, -0.4430872, -2.95118, 0.5764706, 1, 0, 1,
-0.7129903, 0.00272639, -1.619061, 0.572549, 1, 0, 1,
-0.7121642, 1.083255, -0.2900651, 0.5647059, 1, 0, 1,
-0.711901, -1.018366, -3.101744, 0.5607843, 1, 0, 1,
-0.7066873, 0.2540703, -0.4829069, 0.5529412, 1, 0, 1,
-0.7023717, -1.950575, -1.61587, 0.5490196, 1, 0, 1,
-0.701066, 0.9718575, -0.662509, 0.5411765, 1, 0, 1,
-0.6985533, 0.3881716, -0.5620852, 0.5372549, 1, 0, 1,
-0.6966429, 0.4757332, -0.6534274, 0.5294118, 1, 0, 1,
-0.6964134, 0.1372088, -0.5769722, 0.5254902, 1, 0, 1,
-0.6949736, 1.021998, 0.131567, 0.5176471, 1, 0, 1,
-0.6948016, 0.7926588, -0.8026392, 0.5137255, 1, 0, 1,
-0.6896585, -0.1240719, -1.599521, 0.5058824, 1, 0, 1,
-0.6866972, -1.50612, -1.457084, 0.5019608, 1, 0, 1,
-0.6864494, -0.8484941, -2.048259, 0.4941176, 1, 0, 1,
-0.6853147, -0.3378529, -1.487612, 0.4862745, 1, 0, 1,
-0.6806996, 0.3054487, 0.3924077, 0.4823529, 1, 0, 1,
-0.6768774, -0.3829398, -2.392918, 0.4745098, 1, 0, 1,
-0.6727337, 0.9089004, -0.2572976, 0.4705882, 1, 0, 1,
-0.6719167, -1.281751, -2.522592, 0.4627451, 1, 0, 1,
-0.667999, 0.1447669, 0.2996791, 0.4588235, 1, 0, 1,
-0.6669459, 0.1371753, -2.255584, 0.4509804, 1, 0, 1,
-0.6662787, -1.129408, -1.680919, 0.4470588, 1, 0, 1,
-0.6558531, 0.6344232, -1.275448, 0.4392157, 1, 0, 1,
-0.6549959, -1.175519, -2.988039, 0.4352941, 1, 0, 1,
-0.6549767, -0.5269711, -4.292244, 0.427451, 1, 0, 1,
-0.649088, 0.2742816, -1.208315, 0.4235294, 1, 0, 1,
-0.6475511, 1.594018, -2.234695, 0.4156863, 1, 0, 1,
-0.6475464, -0.6685445, -1.043157, 0.4117647, 1, 0, 1,
-0.6406943, 0.6697108, -2.325395, 0.4039216, 1, 0, 1,
-0.6290819, -0.7765312, -3.752684, 0.3960784, 1, 0, 1,
-0.628412, 0.3004607, -2.68495, 0.3921569, 1, 0, 1,
-0.6275094, 1.136012, -0.3752831, 0.3843137, 1, 0, 1,
-0.6205887, 0.1878818, -0.6776078, 0.3803922, 1, 0, 1,
-0.6181602, -1.439943, -2.901125, 0.372549, 1, 0, 1,
-0.607327, -1.417364, -1.984331, 0.3686275, 1, 0, 1,
-0.6060256, -0.7347925, -2.374823, 0.3607843, 1, 0, 1,
-0.6046378, -0.6509521, -1.234462, 0.3568628, 1, 0, 1,
-0.6034769, 1.270221, -0.4425748, 0.3490196, 1, 0, 1,
-0.5980373, 1.429195, 1.311066, 0.345098, 1, 0, 1,
-0.5935946, 1.190203, 0.270155, 0.3372549, 1, 0, 1,
-0.5828759, 1.508899, -1.177394, 0.3333333, 1, 0, 1,
-0.5783398, -0.7430373, -3.890514, 0.3254902, 1, 0, 1,
-0.5735008, 2.163908, -0.099069, 0.3215686, 1, 0, 1,
-0.5734521, -0.7865039, -0.6282964, 0.3137255, 1, 0, 1,
-0.5734364, -0.6021092, -2.297918, 0.3098039, 1, 0, 1,
-0.5712757, -0.1649622, -0.4973173, 0.3019608, 1, 0, 1,
-0.5671896, 1.335675, 1.107994, 0.2941177, 1, 0, 1,
-0.5642512, -0.5279009, -1.690135, 0.2901961, 1, 0, 1,
-0.5577995, 0.548413, -1.18827, 0.282353, 1, 0, 1,
-0.5559326, -0.2521729, -1.775546, 0.2784314, 1, 0, 1,
-0.5542325, -1.454802, -2.028931, 0.2705882, 1, 0, 1,
-0.5514548, 0.5101724, -2.001591, 0.2666667, 1, 0, 1,
-0.550505, -0.6197721, -1.094328, 0.2588235, 1, 0, 1,
-0.5471987, -1.14398, -3.532751, 0.254902, 1, 0, 1,
-0.54653, -1.847113, -4.57924, 0.2470588, 1, 0, 1,
-0.5450517, -0.359889, -1.232255, 0.2431373, 1, 0, 1,
-0.5356138, 0.7693381, 0.07213772, 0.2352941, 1, 0, 1,
-0.534655, 1.117491, -1.168544, 0.2313726, 1, 0, 1,
-0.5332034, 0.712825, -0.2375719, 0.2235294, 1, 0, 1,
-0.5300338, 2.12084, -0.8020563, 0.2196078, 1, 0, 1,
-0.5281523, 0.05393534, -1.468726, 0.2117647, 1, 0, 1,
-0.5241973, -0.6878459, -1.588944, 0.2078431, 1, 0, 1,
-0.5234166, -0.3754332, -1.433453, 0.2, 1, 0, 1,
-0.5230366, -0.9118467, -2.683407, 0.1921569, 1, 0, 1,
-0.5208986, 0.3933689, -3.03705, 0.1882353, 1, 0, 1,
-0.5105817, 1.540125, 2.61793, 0.1803922, 1, 0, 1,
-0.510461, -1.655881, -3.808509, 0.1764706, 1, 0, 1,
-0.5097367, -0.7931064, -2.487962, 0.1686275, 1, 0, 1,
-0.5016852, 0.7914184, -0.6588795, 0.1647059, 1, 0, 1,
-0.4987258, 1.153983, -2.155457, 0.1568628, 1, 0, 1,
-0.4977462, 2.240057, 0.2303999, 0.1529412, 1, 0, 1,
-0.4944743, -1.268958, -4.119849, 0.145098, 1, 0, 1,
-0.4937235, 0.2358001, -1.27288, 0.1411765, 1, 0, 1,
-0.4934202, 0.2155661, -1.390743, 0.1333333, 1, 0, 1,
-0.4933815, 1.710802, -2.835365, 0.1294118, 1, 0, 1,
-0.4916854, -0.3278292, -1.255282, 0.1215686, 1, 0, 1,
-0.4835217, 0.6903189, -1.945665, 0.1176471, 1, 0, 1,
-0.4815001, 0.5707303, 0.1646665, 0.1098039, 1, 0, 1,
-0.4747745, -1.535485, -3.351271, 0.1058824, 1, 0, 1,
-0.4746453, 0.7395544, -1.67981, 0.09803922, 1, 0, 1,
-0.4664057, 1.060224, -1.124252, 0.09019608, 1, 0, 1,
-0.464522, -0.2823001, -2.880162, 0.08627451, 1, 0, 1,
-0.4632781, -0.2968769, -1.792098, 0.07843138, 1, 0, 1,
-0.4632213, -1.281941, -3.452531, 0.07450981, 1, 0, 1,
-0.4629392, 0.06587084, -0.8441834, 0.06666667, 1, 0, 1,
-0.4625205, -0.1377454, -1.619051, 0.0627451, 1, 0, 1,
-0.4615974, -0.2362001, -1.539543, 0.05490196, 1, 0, 1,
-0.4596021, 1.644148, -0.9095082, 0.05098039, 1, 0, 1,
-0.4544358, -1.218517, -2.517154, 0.04313726, 1, 0, 1,
-0.4529973, 0.3207029, 0.136101, 0.03921569, 1, 0, 1,
-0.4481439, 0.6011982, 0.5260453, 0.03137255, 1, 0, 1,
-0.447224, 1.07026, -0.02539074, 0.02745098, 1, 0, 1,
-0.4423725, -1.142339, -3.812235, 0.01960784, 1, 0, 1,
-0.4383137, 0.4827997, -1.510151, 0.01568628, 1, 0, 1,
-0.4312962, 0.6415908, -0.9842466, 0.007843138, 1, 0, 1,
-0.4312147, 1.035885, 0.5398673, 0.003921569, 1, 0, 1,
-0.428966, 0.9770733, 0.1248467, 0, 1, 0.003921569, 1,
-0.4288604, 1.209687, 0.2245422, 0, 1, 0.01176471, 1,
-0.4273896, 0.2005314, -1.049243, 0, 1, 0.01568628, 1,
-0.4239025, -1.233598, -3.515203, 0, 1, 0.02352941, 1,
-0.4208008, -1.051, -3.173362, 0, 1, 0.02745098, 1,
-0.4201319, 0.7664312, -0.6252103, 0, 1, 0.03529412, 1,
-0.41935, 1.182042, 0.341814, 0, 1, 0.03921569, 1,
-0.4176527, -1.005543, -1.796669, 0, 1, 0.04705882, 1,
-0.4151014, -1.683195, -3.014498, 0, 1, 0.05098039, 1,
-0.4143831, -0.2417565, -4.149039, 0, 1, 0.05882353, 1,
-0.4124207, 0.9253621, -2.220343, 0, 1, 0.0627451, 1,
-0.4123399, 0.005274732, -2.04343, 0, 1, 0.07058824, 1,
-0.4118154, -0.9082373, -0.760905, 0, 1, 0.07450981, 1,
-0.4097246, 0.1835178, 0.02871198, 0, 1, 0.08235294, 1,
-0.4055157, 0.750591, -0.5754167, 0, 1, 0.08627451, 1,
-0.4043668, -0.6577446, -2.81567, 0, 1, 0.09411765, 1,
-0.4036558, -0.1975012, -0.5833156, 0, 1, 0.1019608, 1,
-0.4006013, 1.113892, 0.707657, 0, 1, 0.1058824, 1,
-0.399612, 0.4520314, -1.949142, 0, 1, 0.1137255, 1,
-0.3984869, -0.56169, -0.7875597, 0, 1, 0.1176471, 1,
-0.3954881, -0.8111333, -3.507, 0, 1, 0.1254902, 1,
-0.3887243, -0.2720717, -2.726247, 0, 1, 0.1294118, 1,
-0.3861359, 0.5234108, -0.5919023, 0, 1, 0.1372549, 1,
-0.3852688, 0.7366936, -1.693927, 0, 1, 0.1411765, 1,
-0.3840994, -0.4748267, -1.403298, 0, 1, 0.1490196, 1,
-0.3806222, 0.7442693, -2.116588, 0, 1, 0.1529412, 1,
-0.3786234, -0.9947714, -1.258518, 0, 1, 0.1607843, 1,
-0.3732185, -0.9800979, -2.878153, 0, 1, 0.1647059, 1,
-0.3721413, 0.9416538, 0.04534112, 0, 1, 0.172549, 1,
-0.3627728, 2.029988, -0.9706942, 0, 1, 0.1764706, 1,
-0.3599465, -0.4933452, -4.657232, 0, 1, 0.1843137, 1,
-0.3571866, -1.725712, -3.44605, 0, 1, 0.1882353, 1,
-0.3571163, -0.5411373, -2.442696, 0, 1, 0.1960784, 1,
-0.3558569, 0.1158711, 0.3580558, 0, 1, 0.2039216, 1,
-0.3555893, -0.4948252, -1.1612, 0, 1, 0.2078431, 1,
-0.3552599, -0.2433603, -2.521083, 0, 1, 0.2156863, 1,
-0.3547584, 0.6807771, 0.2139718, 0, 1, 0.2196078, 1,
-0.3525089, 1.14795, 0.09201223, 0, 1, 0.227451, 1,
-0.351857, 0.2977541, -0.8897296, 0, 1, 0.2313726, 1,
-0.3510862, 1.14528, 0.2741321, 0, 1, 0.2392157, 1,
-0.3438278, -0.03685434, -1.409287, 0, 1, 0.2431373, 1,
-0.3435827, -0.9900897, -2.678208, 0, 1, 0.2509804, 1,
-0.3379019, -0.2359554, -2.543845, 0, 1, 0.254902, 1,
-0.33636, -0.5359401, -3.704501, 0, 1, 0.2627451, 1,
-0.3340818, 0.2076402, -0.205487, 0, 1, 0.2666667, 1,
-0.3337206, -0.3783346, -2.86619, 0, 1, 0.2745098, 1,
-0.3331073, -1.200454, -2.578127, 0, 1, 0.2784314, 1,
-0.3320196, -0.9678951, -2.994495, 0, 1, 0.2862745, 1,
-0.330392, -0.9246796, -4.30804, 0, 1, 0.2901961, 1,
-0.3301843, 0.2464558, -1.090292, 0, 1, 0.2980392, 1,
-0.3278686, -1.022605, -2.923664, 0, 1, 0.3058824, 1,
-0.3262064, -1.468717, -2.336002, 0, 1, 0.3098039, 1,
-0.3230348, 0.43386, 0.2796775, 0, 1, 0.3176471, 1,
-0.3203078, -0.01033582, -3.099828, 0, 1, 0.3215686, 1,
-0.3181286, 2.241005, -1.051171, 0, 1, 0.3294118, 1,
-0.309363, 0.9276029, -0.1066094, 0, 1, 0.3333333, 1,
-0.3034317, -0.2403028, -0.3995058, 0, 1, 0.3411765, 1,
-0.2958571, 0.0475856, -0.7449402, 0, 1, 0.345098, 1,
-0.2955587, 0.01479269, -1.494669, 0, 1, 0.3529412, 1,
-0.2914305, -0.08190032, -1.504804, 0, 1, 0.3568628, 1,
-0.2873997, 0.09100432, -2.66235, 0, 1, 0.3647059, 1,
-0.2855327, -1.529911, -1.98467, 0, 1, 0.3686275, 1,
-0.2835572, 0.001010419, -2.014198, 0, 1, 0.3764706, 1,
-0.2824318, -1.328268, -1.16125, 0, 1, 0.3803922, 1,
-0.2786505, 0.2877958, -0.1386995, 0, 1, 0.3882353, 1,
-0.275678, -1.590577, -1.694404, 0, 1, 0.3921569, 1,
-0.2741654, -0.01631465, -0.4940233, 0, 1, 0.4, 1,
-0.2741255, 0.09942907, -2.264536, 0, 1, 0.4078431, 1,
-0.2715803, -0.7551103, -2.255571, 0, 1, 0.4117647, 1,
-0.2713059, 0.1254074, -0.849147, 0, 1, 0.4196078, 1,
-0.2700799, 0.0866737, -2.866601, 0, 1, 0.4235294, 1,
-0.2689022, 1.814253, 0.1217076, 0, 1, 0.4313726, 1,
-0.2677133, 0.7085475, -1.615703, 0, 1, 0.4352941, 1,
-0.2674055, 0.9640726, 0.5453746, 0, 1, 0.4431373, 1,
-0.2656229, -2.256686, -0.9696916, 0, 1, 0.4470588, 1,
-0.2654068, -1.526952, -2.467345, 0, 1, 0.454902, 1,
-0.2645838, 0.3713846, -0.3053584, 0, 1, 0.4588235, 1,
-0.2645611, -0.1261031, -2.525902, 0, 1, 0.4666667, 1,
-0.2633146, -0.6703735, -2.225909, 0, 1, 0.4705882, 1,
-0.2611725, 0.7795232, 0.6874092, 0, 1, 0.4784314, 1,
-0.2610922, 0.03692854, -1.480767, 0, 1, 0.4823529, 1,
-0.2567034, 0.03382178, -1.864787, 0, 1, 0.4901961, 1,
-0.2566157, 0.1188237, -2.383307, 0, 1, 0.4941176, 1,
-0.2557655, -0.566835, -2.159678, 0, 1, 0.5019608, 1,
-0.2549882, -0.889544, -1.434877, 0, 1, 0.509804, 1,
-0.2549074, -0.2014544, -3.25995, 0, 1, 0.5137255, 1,
-0.2492468, 1.789998, 0.9328278, 0, 1, 0.5215687, 1,
-0.2491791, 1.181308, -1.359115, 0, 1, 0.5254902, 1,
-0.2489198, 0.2764461, 0.4685401, 0, 1, 0.5333334, 1,
-0.2475639, -1.87211, -2.893072, 0, 1, 0.5372549, 1,
-0.244093, -0.6083406, -4.173168, 0, 1, 0.5450981, 1,
-0.2337042, 1.059337, -2.05109, 0, 1, 0.5490196, 1,
-0.231867, 0.6801171, -0.2511174, 0, 1, 0.5568628, 1,
-0.2289249, -0.4785873, -1.957857, 0, 1, 0.5607843, 1,
-0.2241728, -2.393048, -2.967854, 0, 1, 0.5686275, 1,
-0.2232816, 1.511091, 0.2233926, 0, 1, 0.572549, 1,
-0.2203671, 1.00416, 0.4058954, 0, 1, 0.5803922, 1,
-0.217279, 1.307209, -1.393949, 0, 1, 0.5843138, 1,
-0.2165099, 0.9207926, -0.9445277, 0, 1, 0.5921569, 1,
-0.2142943, 0.5457258, -0.9542428, 0, 1, 0.5960785, 1,
-0.2059423, 0.03345, -2.951544, 0, 1, 0.6039216, 1,
-0.2046448, 0.08696514, -1.613613, 0, 1, 0.6117647, 1,
-0.2042174, -0.4628615, -3.515912, 0, 1, 0.6156863, 1,
-0.2030828, -0.3736826, -3.151553, 0, 1, 0.6235294, 1,
-0.2022528, 0.3770804, -1.018172, 0, 1, 0.627451, 1,
-0.1913958, -0.6625525, -2.896156, 0, 1, 0.6352941, 1,
-0.1909308, -0.933475, -1.725903, 0, 1, 0.6392157, 1,
-0.1850839, 0.2881117, -1.117679, 0, 1, 0.6470588, 1,
-0.1818573, -0.7434235, -3.026169, 0, 1, 0.6509804, 1,
-0.1790278, -0.6368068, -2.635468, 0, 1, 0.6588235, 1,
-0.1787827, -0.03046693, -1.085712, 0, 1, 0.6627451, 1,
-0.171275, -0.6315577, -3.447619, 0, 1, 0.6705883, 1,
-0.168565, 0.2600241, -1.136197, 0, 1, 0.6745098, 1,
-0.1648939, -1.8931, -1.725138, 0, 1, 0.682353, 1,
-0.1643969, -0.05347182, -1.221094, 0, 1, 0.6862745, 1,
-0.1641153, -1.605233, -2.45715, 0, 1, 0.6941177, 1,
-0.1618754, -2.777564, -2.534981, 0, 1, 0.7019608, 1,
-0.1580255, -0.4297364, -0.9655633, 0, 1, 0.7058824, 1,
-0.1553692, -1.117961, -4.730365, 0, 1, 0.7137255, 1,
-0.1550277, 0.1982129, -0.6997359, 0, 1, 0.7176471, 1,
-0.1501837, 1.736911, 0.3025726, 0, 1, 0.7254902, 1,
-0.1450261, -0.9358299, -3.170672, 0, 1, 0.7294118, 1,
-0.1407315, 1.038227, 0.1779547, 0, 1, 0.7372549, 1,
-0.1405441, -0.538466, -3.257051, 0, 1, 0.7411765, 1,
-0.1321783, -0.6643248, -2.458138, 0, 1, 0.7490196, 1,
-0.1260959, 1.054291, -0.407374, 0, 1, 0.7529412, 1,
-0.1243967, -1.162974, -3.579386, 0, 1, 0.7607843, 1,
-0.1222274, 1.229124, 0.4966555, 0, 1, 0.7647059, 1,
-0.1203841, -0.7360771, -1.969585, 0, 1, 0.772549, 1,
-0.1202265, 0.1888305, -0.1254012, 0, 1, 0.7764706, 1,
-0.1193834, -1.410265, -1.921047, 0, 1, 0.7843137, 1,
-0.1187905, 0.3099537, -0.6597235, 0, 1, 0.7882353, 1,
-0.1183628, -1.605847, -4.247103, 0, 1, 0.7960784, 1,
-0.1151011, 0.3945525, -0.3638898, 0, 1, 0.8039216, 1,
-0.1146768, -1.113746, -3.809234, 0, 1, 0.8078431, 1,
-0.1136264, -0.05872414, -2.19712, 0, 1, 0.8156863, 1,
-0.107124, -1.490869, -3.11111, 0, 1, 0.8196079, 1,
-0.1041746, 0.2707234, 1.455233, 0, 1, 0.827451, 1,
-0.1035618, -0.6024773, -1.7447, 0, 1, 0.8313726, 1,
-0.1002274, 0.5704942, 0.1652259, 0, 1, 0.8392157, 1,
-0.09590169, -1.261833, -3.508173, 0, 1, 0.8431373, 1,
-0.09537818, 0.1566176, -0.8096494, 0, 1, 0.8509804, 1,
-0.08972205, -0.351534, -2.833598, 0, 1, 0.854902, 1,
-0.08446554, -1.178966, -2.675673, 0, 1, 0.8627451, 1,
-0.08245356, 1.39494, 0.3892821, 0, 1, 0.8666667, 1,
-0.08200307, -1.258477, -4.120032, 0, 1, 0.8745098, 1,
-0.07827191, 0.5369151, -1.23185, 0, 1, 0.8784314, 1,
-0.0778015, 0.664539, -1.408071, 0, 1, 0.8862745, 1,
-0.07716157, 1.163158, -0.08780667, 0, 1, 0.8901961, 1,
-0.07702582, -0.2926028, -2.74453, 0, 1, 0.8980392, 1,
-0.0753749, 1.466533, 0.1542967, 0, 1, 0.9058824, 1,
-0.0753485, -2.249014, -4.262542, 0, 1, 0.9098039, 1,
-0.0746309, 0.9860094, 0.5313887, 0, 1, 0.9176471, 1,
-0.0724031, 0.4642931, -1.364295, 0, 1, 0.9215686, 1,
-0.0723513, 0.4319289, -1.357909, 0, 1, 0.9294118, 1,
-0.07188081, -1.856081, -5.459251, 0, 1, 0.9333333, 1,
-0.0689107, -0.8990532, -2.070543, 0, 1, 0.9411765, 1,
-0.0688433, 1.270174, -0.2821233, 0, 1, 0.945098, 1,
-0.06861913, -0.06655406, -2.17233, 0, 1, 0.9529412, 1,
-0.05979708, 1.431314, -0.0515046, 0, 1, 0.9568627, 1,
-0.05873303, -0.1214492, -4.240057, 0, 1, 0.9647059, 1,
-0.0580703, -0.7255485, -3.493803, 0, 1, 0.9686275, 1,
-0.05718474, -0.3286645, -3.245962, 0, 1, 0.9764706, 1,
-0.05556381, 0.5245587, 0.3844226, 0, 1, 0.9803922, 1,
-0.05545242, -0.08715983, -2.426014, 0, 1, 0.9882353, 1,
-0.05437822, 0.2061056, -0.09606995, 0, 1, 0.9921569, 1,
-0.05395281, 1.256886, -0.747182, 0, 1, 1, 1,
-0.05180093, 0.6297607, 0.7719898, 0, 0.9921569, 1, 1,
-0.0507116, -0.9331837, -2.924393, 0, 0.9882353, 1, 1,
-0.04353126, 1.178746, -0.2737405, 0, 0.9803922, 1, 1,
-0.04194149, -0.9793018, -3.573434, 0, 0.9764706, 1, 1,
-0.03855169, -0.9432403, -3.20851, 0, 0.9686275, 1, 1,
-0.03778544, 0.5108525, 1.229795, 0, 0.9647059, 1, 1,
-0.03366496, -0.4184138, -3.971967, 0, 0.9568627, 1, 1,
-0.02874808, -0.2840351, -3.212857, 0, 0.9529412, 1, 1,
-0.01963972, -1.224548, -1.795902, 0, 0.945098, 1, 1,
-0.01930643, -0.6412386, -4.327046, 0, 0.9411765, 1, 1,
-0.0172649, -0.4371943, -3.176218, 0, 0.9333333, 1, 1,
-0.01698793, 1.674483, -0.4557622, 0, 0.9294118, 1, 1,
-0.01299056, 0.1636126, -0.1531515, 0, 0.9215686, 1, 1,
-0.01230248, 0.6173601, -1.550074, 0, 0.9176471, 1, 1,
-0.01149379, 0.3648449, 1.640671, 0, 0.9098039, 1, 1,
-0.01033933, -1.304759, -2.707193, 0, 0.9058824, 1, 1,
-0.009745272, -0.7151117, -2.078618, 0, 0.8980392, 1, 1,
-0.005712508, 1.289824, -0.2389656, 0, 0.8901961, 1, 1,
-0.005519108, -0.180955, -2.586721, 0, 0.8862745, 1, 1,
0.003898307, -1.663567, 3.244031, 0, 0.8784314, 1, 1,
0.005167118, 0.4870855, -1.088866, 0, 0.8745098, 1, 1,
0.006684985, -0.6143916, 2.921566, 0, 0.8666667, 1, 1,
0.009884327, -0.1800984, 2.001522, 0, 0.8627451, 1, 1,
0.0118632, 0.138786, -0.6046576, 0, 0.854902, 1, 1,
0.01263566, -2.634764, 4.796783, 0, 0.8509804, 1, 1,
0.01546003, 0.2503998, 0.1809052, 0, 0.8431373, 1, 1,
0.01554695, 1.068766, -0.1422515, 0, 0.8392157, 1, 1,
0.01766163, -0.4916743, 3.364769, 0, 0.8313726, 1, 1,
0.02009996, 0.8659715, 0.5495232, 0, 0.827451, 1, 1,
0.02079725, -1.671253, 3.424749, 0, 0.8196079, 1, 1,
0.02268955, -0.217637, 3.112402, 0, 0.8156863, 1, 1,
0.02315334, 0.2963558, 0.2661603, 0, 0.8078431, 1, 1,
0.02334346, 0.1284881, 0.4771403, 0, 0.8039216, 1, 1,
0.02376216, -0.1238011, 3.933886, 0, 0.7960784, 1, 1,
0.02405663, -0.3040397, 2.489159, 0, 0.7882353, 1, 1,
0.02483788, -1.046526, 2.780203, 0, 0.7843137, 1, 1,
0.03400342, -0.9249947, 3.349404, 0, 0.7764706, 1, 1,
0.03505048, -0.008719746, 3.695211, 0, 0.772549, 1, 1,
0.03709205, 1.121752, 0.8170839, 0, 0.7647059, 1, 1,
0.0374075, 0.03785184, 1.227508, 0, 0.7607843, 1, 1,
0.03742683, 0.175312, 0.190011, 0, 0.7529412, 1, 1,
0.03860901, 0.8378371, -1.386188, 0, 0.7490196, 1, 1,
0.0395617, -0.1600427, 2.955233, 0, 0.7411765, 1, 1,
0.04283051, 0.9505861, -1.642332, 0, 0.7372549, 1, 1,
0.04344457, 0.04385459, 1.337948, 0, 0.7294118, 1, 1,
0.04608394, 0.07665347, 0.5780528, 0, 0.7254902, 1, 1,
0.04812666, 0.9967743, 0.9075861, 0, 0.7176471, 1, 1,
0.04968742, -1.690623, 2.354908, 0, 0.7137255, 1, 1,
0.05376459, -0.4282638, 2.179916, 0, 0.7058824, 1, 1,
0.05482167, -0.8927926, 1.467627, 0, 0.6980392, 1, 1,
0.05600671, 1.927998, -0.1942084, 0, 0.6941177, 1, 1,
0.05699332, -1.301134, 2.848375, 0, 0.6862745, 1, 1,
0.059204, 0.3086839, 0.5472034, 0, 0.682353, 1, 1,
0.06584504, 0.8719168, 0.09159068, 0, 0.6745098, 1, 1,
0.06672263, 0.8736879, 0.5639963, 0, 0.6705883, 1, 1,
0.08729447, -0.6359093, 3.68934, 0, 0.6627451, 1, 1,
0.08814794, 1.20082, -0.4599563, 0, 0.6588235, 1, 1,
0.09475492, -2.254092, 4.44714, 0, 0.6509804, 1, 1,
0.09556904, -0.550817, 2.616527, 0, 0.6470588, 1, 1,
0.09723174, 1.141785, 0.8561213, 0, 0.6392157, 1, 1,
0.09822237, 0.2270052, 0.5042363, 0, 0.6352941, 1, 1,
0.09913049, -0.7416334, 4.824003, 0, 0.627451, 1, 1,
0.1003315, -0.9140908, 4.207818, 0, 0.6235294, 1, 1,
0.1046581, 2.318276, 1.040913, 0, 0.6156863, 1, 1,
0.1070286, 0.3588562, 0.105189, 0, 0.6117647, 1, 1,
0.1072177, 1.900599, -0.1222074, 0, 0.6039216, 1, 1,
0.1103002, -0.4170913, 3.180378, 0, 0.5960785, 1, 1,
0.1113037, 0.3711996, 0.9565287, 0, 0.5921569, 1, 1,
0.1129295, -0.8733089, 2.229848, 0, 0.5843138, 1, 1,
0.1144303, -2.263428, 3.124611, 0, 0.5803922, 1, 1,
0.1180234, 0.1040331, 0.9032215, 0, 0.572549, 1, 1,
0.1198021, -0.7453513, 2.473259, 0, 0.5686275, 1, 1,
0.1219141, -0.04610053, 2.521628, 0, 0.5607843, 1, 1,
0.1239004, -1.562899, 1.46864, 0, 0.5568628, 1, 1,
0.1251174, 1.572124, 0.5083538, 0, 0.5490196, 1, 1,
0.1261604, 0.6563835, -0.4582947, 0, 0.5450981, 1, 1,
0.131262, -1.296934, 0.7062002, 0, 0.5372549, 1, 1,
0.1375405, -0.1346162, 3.183333, 0, 0.5333334, 1, 1,
0.1409021, 0.0754567, -0.8552163, 0, 0.5254902, 1, 1,
0.1421291, -1.694563, 3.140354, 0, 0.5215687, 1, 1,
0.1508199, 0.2075746, 1.507929, 0, 0.5137255, 1, 1,
0.1510672, -0.1162412, 1.30555, 0, 0.509804, 1, 1,
0.1556472, -0.4389582, 2.760865, 0, 0.5019608, 1, 1,
0.1572378, -0.2882405, 2.04227, 0, 0.4941176, 1, 1,
0.1589134, 1.135782, -1.268776, 0, 0.4901961, 1, 1,
0.1593713, 2.720283, 0.5661865, 0, 0.4823529, 1, 1,
0.1596389, 0.7612156, 1.533427, 0, 0.4784314, 1, 1,
0.1597296, 0.3368469, 0.05656812, 0, 0.4705882, 1, 1,
0.1603681, -0.8957574, 1.983761, 0, 0.4666667, 1, 1,
0.16095, 0.1478083, 0.5601173, 0, 0.4588235, 1, 1,
0.1661886, 1.266322, 0.5580142, 0, 0.454902, 1, 1,
0.1683486, 1.458329, 0.2000087, 0, 0.4470588, 1, 1,
0.1683911, -0.9169407, 4.000912, 0, 0.4431373, 1, 1,
0.1777947, -0.2176932, 2.69704, 0, 0.4352941, 1, 1,
0.1785856, -0.6109287, 3.419932, 0, 0.4313726, 1, 1,
0.1806708, -0.4985657, 3.13792, 0, 0.4235294, 1, 1,
0.1809118, -0.2525336, 1.916174, 0, 0.4196078, 1, 1,
0.1851078, 0.5499094, -0.6747882, 0, 0.4117647, 1, 1,
0.1888464, -0.2993523, 0.5378323, 0, 0.4078431, 1, 1,
0.192437, 1.290528, 0.4142124, 0, 0.4, 1, 1,
0.1968684, 1.29579, -0.8375577, 0, 0.3921569, 1, 1,
0.1971609, -0.768432, 1.893237, 0, 0.3882353, 1, 1,
0.2006415, 1.041665, 0.2444149, 0, 0.3803922, 1, 1,
0.2101259, 0.08087858, -1.271703, 0, 0.3764706, 1, 1,
0.2128677, -0.517459, 2.979981, 0, 0.3686275, 1, 1,
0.2145468, -0.7135963, 2.698102, 0, 0.3647059, 1, 1,
0.219435, -0.8854864, 3.480787, 0, 0.3568628, 1, 1,
0.220291, -0.4827933, 1.27365, 0, 0.3529412, 1, 1,
0.2205723, -0.2267798, 3.607725, 0, 0.345098, 1, 1,
0.2259165, 0.6870432, 1.235403, 0, 0.3411765, 1, 1,
0.2261026, -2.64772, 2.700646, 0, 0.3333333, 1, 1,
0.2262314, -0.6599583, 2.130407, 0, 0.3294118, 1, 1,
0.2269877, 1.153997, 0.1256229, 0, 0.3215686, 1, 1,
0.2293189, -0.04785261, 1.359356, 0, 0.3176471, 1, 1,
0.2354232, 0.2560821, 0.9166104, 0, 0.3098039, 1, 1,
0.2355992, -1.157636, 3.850826, 0, 0.3058824, 1, 1,
0.2358096, 2.268571, -0.1013401, 0, 0.2980392, 1, 1,
0.2364568, 0.2845344, 1.612566, 0, 0.2901961, 1, 1,
0.2365293, -0.6279513, 1.455706, 0, 0.2862745, 1, 1,
0.2378002, -0.8792133, 4.648171, 0, 0.2784314, 1, 1,
0.2398605, -0.2366906, 3.690749, 0, 0.2745098, 1, 1,
0.242739, -1.165383, 2.989192, 0, 0.2666667, 1, 1,
0.2473944, 1.196874, -1.040516, 0, 0.2627451, 1, 1,
0.2491616, -0.09423027, 1.445545, 0, 0.254902, 1, 1,
0.2570061, -0.7178894, 2.52889, 0, 0.2509804, 1, 1,
0.2581816, -2.114558, 4.447292, 0, 0.2431373, 1, 1,
0.2592336, 0.4357173, 0.9267423, 0, 0.2392157, 1, 1,
0.2606505, -1.021799, 2.004674, 0, 0.2313726, 1, 1,
0.2617328, -0.7604331, 3.679429, 0, 0.227451, 1, 1,
0.2631438, 1.22269, 1.50201, 0, 0.2196078, 1, 1,
0.2657113, -0.3045536, 3.814552, 0, 0.2156863, 1, 1,
0.2661543, 0.5834082, 0.6951482, 0, 0.2078431, 1, 1,
0.2681741, 0.1740462, 0.5524784, 0, 0.2039216, 1, 1,
0.2688489, -0.2600051, 2.136436, 0, 0.1960784, 1, 1,
0.2721278, 1.124164, 1.646154, 0, 0.1882353, 1, 1,
0.2800995, 0.2490521, 1.48887, 0, 0.1843137, 1, 1,
0.2819868, -0.6983358, 3.558812, 0, 0.1764706, 1, 1,
0.2835389, -0.4323525, 4.152657, 0, 0.172549, 1, 1,
0.2862929, -0.2964655, 2.187945, 0, 0.1647059, 1, 1,
0.2924867, 1.070122, -0.4955537, 0, 0.1607843, 1, 1,
0.297605, -0.4901043, 2.116832, 0, 0.1529412, 1, 1,
0.2993792, -1.244387, 0.7345592, 0, 0.1490196, 1, 1,
0.2994947, 0.821429, 1.857737, 0, 0.1411765, 1, 1,
0.3022242, -0.7598906, 2.017543, 0, 0.1372549, 1, 1,
0.3059092, -0.4049972, 3.489142, 0, 0.1294118, 1, 1,
0.3154614, 0.8902524, 0.7912142, 0, 0.1254902, 1, 1,
0.3193157, 0.159502, 1.858935, 0, 0.1176471, 1, 1,
0.3297814, 0.6334394, 1.943832, 0, 0.1137255, 1, 1,
0.3308493, -2.280696, 2.941046, 0, 0.1058824, 1, 1,
0.3312541, -0.6312259, 2.965413, 0, 0.09803922, 1, 1,
0.3339185, 0.4160053, 1.164116, 0, 0.09411765, 1, 1,
0.3357277, 0.6154199, 0.8326567, 0, 0.08627451, 1, 1,
0.3380735, -0.1470524, 2.497296, 0, 0.08235294, 1, 1,
0.3395419, -0.6252849, 5.12899, 0, 0.07450981, 1, 1,
0.3407826, -0.9488507, 0.335912, 0, 0.07058824, 1, 1,
0.3496039, 0.9361805, -1.197164, 0, 0.0627451, 1, 1,
0.3533415, 0.6958163, -0.2440422, 0, 0.05882353, 1, 1,
0.3574525, -1.46238, 3.622894, 0, 0.05098039, 1, 1,
0.36344, 0.6906837, 0.4863077, 0, 0.04705882, 1, 1,
0.3689657, 1.145175, 0.1534176, 0, 0.03921569, 1, 1,
0.3728773, 1.127783, -1.056728, 0, 0.03529412, 1, 1,
0.3764628, 0.3668469, 0.3971168, 0, 0.02745098, 1, 1,
0.3825593, -0.613189, 1.190443, 0, 0.02352941, 1, 1,
0.3833292, 0.3106973, 1.557523, 0, 0.01568628, 1, 1,
0.3841944, -0.7752588, 2.337665, 0, 0.01176471, 1, 1,
0.3854202, -0.700625, 2.565384, 0, 0.003921569, 1, 1,
0.3883907, -0.165102, 1.439917, 0.003921569, 0, 1, 1,
0.3948713, 0.3350056, -0.3613169, 0.007843138, 0, 1, 1,
0.3974562, -0.4116219, 2.304569, 0.01568628, 0, 1, 1,
0.3984566, 0.8344714, -1.806237, 0.01960784, 0, 1, 1,
0.4020019, -0.8706371, 2.690797, 0.02745098, 0, 1, 1,
0.402097, 0.05459694, 1.928848, 0.03137255, 0, 1, 1,
0.4080175, -0.379003, 2.531661, 0.03921569, 0, 1, 1,
0.4095032, -0.2914469, 1.833008, 0.04313726, 0, 1, 1,
0.4206884, 1.038165, 1.040883, 0.05098039, 0, 1, 1,
0.4212418, -0.01084195, 1.507376, 0.05490196, 0, 1, 1,
0.4305796, 0.551039, -0.00367584, 0.0627451, 0, 1, 1,
0.4310869, 0.4334458, 0.5475374, 0.06666667, 0, 1, 1,
0.4313655, -1.366354, 2.821129, 0.07450981, 0, 1, 1,
0.4357522, 0.4002762, 1.975841, 0.07843138, 0, 1, 1,
0.4365651, 0.7924181, 1.022094, 0.08627451, 0, 1, 1,
0.4381163, 1.260631, 0.3990357, 0.09019608, 0, 1, 1,
0.4403519, -0.2718195, 4.024291, 0.09803922, 0, 1, 1,
0.440506, 1.867955, 0.8349373, 0.1058824, 0, 1, 1,
0.4406325, 0.8060191, 0.3578345, 0.1098039, 0, 1, 1,
0.4413561, -0.5720843, 2.108825, 0.1176471, 0, 1, 1,
0.443834, 0.306798, 1.484218, 0.1215686, 0, 1, 1,
0.4553578, -0.6563004, 2.936285, 0.1294118, 0, 1, 1,
0.4554377, 0.6473544, 0.31386, 0.1333333, 0, 1, 1,
0.4561917, -0.1453664, 2.025529, 0.1411765, 0, 1, 1,
0.4640645, 0.1609497, -0.3097365, 0.145098, 0, 1, 1,
0.4652157, 2.83767, -0.956921, 0.1529412, 0, 1, 1,
0.4687002, 1.396696, -0.3827969, 0.1568628, 0, 1, 1,
0.4702984, -1.423916, 2.708526, 0.1647059, 0, 1, 1,
0.4711669, -0.623343, 3.231619, 0.1686275, 0, 1, 1,
0.4720432, 0.5949919, 0.3813624, 0.1764706, 0, 1, 1,
0.4731134, -1.977276, 4.06774, 0.1803922, 0, 1, 1,
0.4771108, -0.3197309, 1.766023, 0.1882353, 0, 1, 1,
0.478749, -1.084095, 2.091653, 0.1921569, 0, 1, 1,
0.4817994, 0.4238495, -0.5535882, 0.2, 0, 1, 1,
0.4819987, 0.7876623, 2.140502, 0.2078431, 0, 1, 1,
0.4841928, 0.1245597, 3.745945, 0.2117647, 0, 1, 1,
0.4846433, -1.216413, 1.20836, 0.2196078, 0, 1, 1,
0.4861878, -1.710135, 1.52948, 0.2235294, 0, 1, 1,
0.4899768, 1.006734, 1.178104, 0.2313726, 0, 1, 1,
0.4911804, 0.4771277, 1.110617, 0.2352941, 0, 1, 1,
0.4916129, 0.6501127, 1.17354, 0.2431373, 0, 1, 1,
0.4987082, 0.6518456, 0.6243401, 0.2470588, 0, 1, 1,
0.5048248, -0.1700646, 2.385154, 0.254902, 0, 1, 1,
0.5060396, 1.159475, 0.8730966, 0.2588235, 0, 1, 1,
0.5073433, 1.120735, 0.8342636, 0.2666667, 0, 1, 1,
0.5089929, 2.050589, 0.8789055, 0.2705882, 0, 1, 1,
0.5109386, -0.01846252, 0.6567066, 0.2784314, 0, 1, 1,
0.5132515, 0.183441, 1.471204, 0.282353, 0, 1, 1,
0.5155674, 0.7807395, -0.53102, 0.2901961, 0, 1, 1,
0.5203798, -0.5244625, 1.505384, 0.2941177, 0, 1, 1,
0.5230875, 1.719528, -0.8964757, 0.3019608, 0, 1, 1,
0.5245876, 0.1422969, 1.257159, 0.3098039, 0, 1, 1,
0.5252873, 0.8037421, 1.68142, 0.3137255, 0, 1, 1,
0.5275381, 1.101992, 1.472054, 0.3215686, 0, 1, 1,
0.5356741, -0.5250387, 3.328312, 0.3254902, 0, 1, 1,
0.5405109, -0.7663378, 3.697221, 0.3333333, 0, 1, 1,
0.5476167, -0.6756, 2.996485, 0.3372549, 0, 1, 1,
0.5539102, 1.234033, 0.05568124, 0.345098, 0, 1, 1,
0.5622483, -0.4650781, 1.951803, 0.3490196, 0, 1, 1,
0.5632363, 0.678439, -0.5762694, 0.3568628, 0, 1, 1,
0.5653746, 0.766458, 0.7938551, 0.3607843, 0, 1, 1,
0.5691239, 0.2637523, 0.5064948, 0.3686275, 0, 1, 1,
0.5739547, -1.166711, 1.794479, 0.372549, 0, 1, 1,
0.5749912, 0.8008518, 1.254335, 0.3803922, 0, 1, 1,
0.5785662, 0.5696334, 1.664047, 0.3843137, 0, 1, 1,
0.581175, 0.1985241, 1.02721, 0.3921569, 0, 1, 1,
0.5872639, -0.9037308, 1.706315, 0.3960784, 0, 1, 1,
0.5891939, -1.355992, 1.346592, 0.4039216, 0, 1, 1,
0.5896743, -0.9357445, 1.994186, 0.4117647, 0, 1, 1,
0.5963911, 0.6295491, -0.968729, 0.4156863, 0, 1, 1,
0.6010113, -0.1436806, 3.744758, 0.4235294, 0, 1, 1,
0.6017377, -1.20652, 2.595062, 0.427451, 0, 1, 1,
0.6059901, -0.9514796, 1.301669, 0.4352941, 0, 1, 1,
0.6087766, 1.346437, 0.0317427, 0.4392157, 0, 1, 1,
0.6109385, -1.179474, 4.542545, 0.4470588, 0, 1, 1,
0.6200995, 0.4663242, 0.7139283, 0.4509804, 0, 1, 1,
0.6207068, -1.472671, 3.084084, 0.4588235, 0, 1, 1,
0.6208482, -1.616112, 1.939067, 0.4627451, 0, 1, 1,
0.6250648, -1.014758, 1.880657, 0.4705882, 0, 1, 1,
0.6254079, 2.015335, 1.481892, 0.4745098, 0, 1, 1,
0.6291381, -0.4731131, 1.624113, 0.4823529, 0, 1, 1,
0.6296546, 0.4322788, 0.7545556, 0.4862745, 0, 1, 1,
0.6315764, -0.1289969, 0.2648895, 0.4941176, 0, 1, 1,
0.632889, -1.082298, -0.2066624, 0.5019608, 0, 1, 1,
0.6340011, -1.073807, 1.986106, 0.5058824, 0, 1, 1,
0.6347725, 1.352491, -0.8712301, 0.5137255, 0, 1, 1,
0.6371809, -0.008011024, 1.343106, 0.5176471, 0, 1, 1,
0.6391882, -0.7818499, 1.180014, 0.5254902, 0, 1, 1,
0.6421226, 0.5425409, 0.632514, 0.5294118, 0, 1, 1,
0.6441164, 0.7810663, 0.0453081, 0.5372549, 0, 1, 1,
0.6507937, 1.658244, 0.626655, 0.5411765, 0, 1, 1,
0.6508531, -0.8826677, 2.35692, 0.5490196, 0, 1, 1,
0.658617, -0.8477966, 2.10852, 0.5529412, 0, 1, 1,
0.664947, 1.64668, 1.276363, 0.5607843, 0, 1, 1,
0.6677601, 0.1440089, 1.620112, 0.5647059, 0, 1, 1,
0.6707395, -1.856664, 1.307449, 0.572549, 0, 1, 1,
0.6810182, 0.1285206, 1.761267, 0.5764706, 0, 1, 1,
0.6811066, -0.3638428, 1.158552, 0.5843138, 0, 1, 1,
0.6893884, -1.105575, 2.293458, 0.5882353, 0, 1, 1,
0.6925507, -0.2173876, 0.7472928, 0.5960785, 0, 1, 1,
0.693046, -0.2311357, 2.392033, 0.6039216, 0, 1, 1,
0.6944689, 0.5069543, -0.4977178, 0.6078432, 0, 1, 1,
0.6979672, 1.030265, 1.543742, 0.6156863, 0, 1, 1,
0.6981039, 0.3880048, 1.312359, 0.6196079, 0, 1, 1,
0.6982775, -0.7089573, 2.248449, 0.627451, 0, 1, 1,
0.7040074, -0.609359, 1.781589, 0.6313726, 0, 1, 1,
0.7086555, -0.3923276, 1.479344, 0.6392157, 0, 1, 1,
0.7095703, 0.5143913, 1.068749, 0.6431373, 0, 1, 1,
0.7101853, -0.5617718, 2.042138, 0.6509804, 0, 1, 1,
0.7120467, -1.820017, 1.22717, 0.654902, 0, 1, 1,
0.7125534, 1.60801, -0.1470477, 0.6627451, 0, 1, 1,
0.7163981, 0.1465899, 0.5851721, 0.6666667, 0, 1, 1,
0.7176955, 1.623736, 1.156747, 0.6745098, 0, 1, 1,
0.7185752, 1.215967, 0.09875758, 0.6784314, 0, 1, 1,
0.7224066, -0.660122, 3.628509, 0.6862745, 0, 1, 1,
0.7247043, -0.188637, 3.887506, 0.6901961, 0, 1, 1,
0.7320015, 0.9111874, 1.200756, 0.6980392, 0, 1, 1,
0.7328197, -0.9222537, 1.865779, 0.7058824, 0, 1, 1,
0.7352362, 0.3800524, -0.2537847, 0.7098039, 0, 1, 1,
0.7355087, -1.045889, 2.897436, 0.7176471, 0, 1, 1,
0.736223, -1.888228, 1.499713, 0.7215686, 0, 1, 1,
0.7369265, -0.8355712, 1.898305, 0.7294118, 0, 1, 1,
0.7438652, 1.418683, 2.064488, 0.7333333, 0, 1, 1,
0.7448338, 0.6849405, 1.150705, 0.7411765, 0, 1, 1,
0.7472994, -0.8132386, 3.561481, 0.7450981, 0, 1, 1,
0.7495317, -0.1405271, 1.794855, 0.7529412, 0, 1, 1,
0.7504795, 1.366148, -0.2138338, 0.7568628, 0, 1, 1,
0.7626425, -1.166588, 2.845994, 0.7647059, 0, 1, 1,
0.7629892, 0.3120174, 0.9774987, 0.7686275, 0, 1, 1,
0.7737914, 0.3306044, 2.935491, 0.7764706, 0, 1, 1,
0.7754469, -1.793865, 2.151863, 0.7803922, 0, 1, 1,
0.7864192, -1.153955, 3.187388, 0.7882353, 0, 1, 1,
0.7903955, -1.236103, 1.447044, 0.7921569, 0, 1, 1,
0.7938635, 0.65306, 1.690627, 0.8, 0, 1, 1,
0.7980323, -0.651045, 1.501146, 0.8078431, 0, 1, 1,
0.8006425, 0.001255989, 2.808482, 0.8117647, 0, 1, 1,
0.8074485, -1.939956, 2.33445, 0.8196079, 0, 1, 1,
0.8106143, 0.3015869, -0.7999478, 0.8235294, 0, 1, 1,
0.8111892, -0.2475161, 1.157828, 0.8313726, 0, 1, 1,
0.8122461, -0.9362037, 3.972128, 0.8352941, 0, 1, 1,
0.8139975, 0.7077199, 2.160439, 0.8431373, 0, 1, 1,
0.8160477, -0.932484, 2.271211, 0.8470588, 0, 1, 1,
0.8194795, 1.232523, 0.5345063, 0.854902, 0, 1, 1,
0.8232007, -0.821959, 3.878808, 0.8588235, 0, 1, 1,
0.824343, 1.350572, 0.513184, 0.8666667, 0, 1, 1,
0.834923, -0.206799, -0.9923865, 0.8705882, 0, 1, 1,
0.8431666, 0.7859278, 1.639826, 0.8784314, 0, 1, 1,
0.8545614, -0.4791515, 2.38795, 0.8823529, 0, 1, 1,
0.856537, -0.9799644, 2.776378, 0.8901961, 0, 1, 1,
0.8643512, -0.7854843, 2.776424, 0.8941177, 0, 1, 1,
0.8687741, -0.5734993, 1.702599, 0.9019608, 0, 1, 1,
0.870541, 0.8704048, 0.3060001, 0.9098039, 0, 1, 1,
0.8793775, -0.1266814, 1.92968, 0.9137255, 0, 1, 1,
0.8815477, -0.3195455, 2.382646, 0.9215686, 0, 1, 1,
0.8894957, -1.276238, 2.085688, 0.9254902, 0, 1, 1,
0.8914117, 0.5263292, 1.08081, 0.9333333, 0, 1, 1,
0.8971257, 1.400297, -0.4356565, 0.9372549, 0, 1, 1,
0.9008561, 1.304544, 1.123687, 0.945098, 0, 1, 1,
0.9023868, 0.6881324, -1.658706, 0.9490196, 0, 1, 1,
0.903274, 0.9075208, 0.5479095, 0.9568627, 0, 1, 1,
0.9104741, 0.9910682, 0.5010962, 0.9607843, 0, 1, 1,
0.9113867, 0.2588633, 1.953677, 0.9686275, 0, 1, 1,
0.9126866, -0.2644873, 2.094734, 0.972549, 0, 1, 1,
0.9175267, -0.75092, 2.341068, 0.9803922, 0, 1, 1,
0.9175353, 0.1623962, 0.480981, 0.9843137, 0, 1, 1,
0.9184703, 0.55249, 2.111304, 0.9921569, 0, 1, 1,
0.922444, -0.2851985, 0.09784594, 0.9960784, 0, 1, 1,
0.9256015, -0.4681805, 2.210874, 1, 0, 0.9960784, 1,
0.9306161, -0.5925901, 2.160717, 1, 0, 0.9882353, 1,
0.9366676, 0.1217229, 2.004695, 1, 0, 0.9843137, 1,
0.9428138, 0.4811464, 1.135249, 1, 0, 0.9764706, 1,
0.944187, 0.4932894, 2.286501, 1, 0, 0.972549, 1,
0.9549444, 1.186553, 0.6649584, 1, 0, 0.9647059, 1,
0.9620728, -1.003469, 1.85087, 1, 0, 0.9607843, 1,
0.9698064, -0.5941343, 1.530193, 1, 0, 0.9529412, 1,
0.9754184, 0.543454, 1.334747, 1, 0, 0.9490196, 1,
0.9761957, -0.1473573, 0.7838016, 1, 0, 0.9411765, 1,
0.9762119, 0.1232628, -0.2004904, 1, 0, 0.9372549, 1,
0.9850599, 0.2338263, 1.568023, 1, 0, 0.9294118, 1,
0.9926053, 0.1395413, -0.3362635, 1, 0, 0.9254902, 1,
0.9935261, 1.104736, 1.016313, 1, 0, 0.9176471, 1,
0.993665, 2.047733, 0.6788857, 1, 0, 0.9137255, 1,
0.9948805, 0.4118588, 1.45989, 1, 0, 0.9058824, 1,
1.005548, 0.4342752, 1.530704, 1, 0, 0.9019608, 1,
1.021393, 0.004534067, -0.4074593, 1, 0, 0.8941177, 1,
1.023402, 1.467767, -0.5478793, 1, 0, 0.8862745, 1,
1.033455, 0.6798541, 2.585726, 1, 0, 0.8823529, 1,
1.037985, 0.05788067, 1.162842, 1, 0, 0.8745098, 1,
1.047621, -0.636418, 3.107085, 1, 0, 0.8705882, 1,
1.052166, 0.01540274, 1.100507, 1, 0, 0.8627451, 1,
1.054106, 0.9339206, 0.9721417, 1, 0, 0.8588235, 1,
1.058823, -0.6657172, 0.6222513, 1, 0, 0.8509804, 1,
1.06277, 1.200398, -0.05446618, 1, 0, 0.8470588, 1,
1.063447, -0.6556137, 2.050845, 1, 0, 0.8392157, 1,
1.063967, 0.4120263, 0.8094599, 1, 0, 0.8352941, 1,
1.065993, -1.126622, 2.259591, 1, 0, 0.827451, 1,
1.066244, -1.349336, 2.563526, 1, 0, 0.8235294, 1,
1.072833, 0.176447, 2.273073, 1, 0, 0.8156863, 1,
1.07444, -0.08890302, 2.583219, 1, 0, 0.8117647, 1,
1.083767, 1.07657, 3.036214, 1, 0, 0.8039216, 1,
1.084427, -1.540649, 1.70277, 1, 0, 0.7960784, 1,
1.089049, 0.7062775, 0.3607791, 1, 0, 0.7921569, 1,
1.09432, -0.6720616, 3.935358, 1, 0, 0.7843137, 1,
1.095418, -1.529632, 1.969785, 1, 0, 0.7803922, 1,
1.106702, -1.684487, 4.901971, 1, 0, 0.772549, 1,
1.108449, -1.015626, 2.522389, 1, 0, 0.7686275, 1,
1.111494, 0.831027, 0.2743884, 1, 0, 0.7607843, 1,
1.115604, -0.8863995, 2.358428, 1, 0, 0.7568628, 1,
1.116096, -1.086218, 2.593523, 1, 0, 0.7490196, 1,
1.125299, 1.473203, 1.047662, 1, 0, 0.7450981, 1,
1.127632, -0.9755938, 2.105197, 1, 0, 0.7372549, 1,
1.151075, 2.155958, -0.7042142, 1, 0, 0.7333333, 1,
1.153893, 0.7264867, 1.856218, 1, 0, 0.7254902, 1,
1.164827, 1.525928, 0.1000955, 1, 0, 0.7215686, 1,
1.168907, -0.4092663, 3.684407, 1, 0, 0.7137255, 1,
1.173555, 1.86304, 0.9721968, 1, 0, 0.7098039, 1,
1.174861, -1.814655, 0.5351222, 1, 0, 0.7019608, 1,
1.187755, 1.612394, 1.90546, 1, 0, 0.6941177, 1,
1.191454, 0.3373311, -0.3234397, 1, 0, 0.6901961, 1,
1.194826, 0.5664118, 1.087349, 1, 0, 0.682353, 1,
1.201416, 2.047359, 1.12876, 1, 0, 0.6784314, 1,
1.201747, -0.3506778, 0.1035119, 1, 0, 0.6705883, 1,
1.201899, 0.2271393, 1.956447, 1, 0, 0.6666667, 1,
1.203654, -2.735319, 1.83775, 1, 0, 0.6588235, 1,
1.204003, -0.6126648, 2.560986, 1, 0, 0.654902, 1,
1.206827, -0.5505478, 2.377846, 1, 0, 0.6470588, 1,
1.207616, -0.7851183, 1.036391, 1, 0, 0.6431373, 1,
1.211228, 0.4693056, 2.267649, 1, 0, 0.6352941, 1,
1.213439, 1.335765, 0.7853083, 1, 0, 0.6313726, 1,
1.215133, 1.076495, 0.1555913, 1, 0, 0.6235294, 1,
1.220936, -0.4062931, 3.531239, 1, 0, 0.6196079, 1,
1.224085, 1.621384, 0.7817486, 1, 0, 0.6117647, 1,
1.23296, -1.768061, 3.567774, 1, 0, 0.6078432, 1,
1.249403, 0.917492, 0.8580133, 1, 0, 0.6, 1,
1.250946, 0.8253402, 0.9313619, 1, 0, 0.5921569, 1,
1.256023, -0.008562444, 0.4939815, 1, 0, 0.5882353, 1,
1.256996, 0.04582121, 1.921103, 1, 0, 0.5803922, 1,
1.260681, 2.378433, 2.557386, 1, 0, 0.5764706, 1,
1.263672, -0.3046741, 2.744833, 1, 0, 0.5686275, 1,
1.270108, 1.302077, 0.4762507, 1, 0, 0.5647059, 1,
1.278197, -0.9806942, 1.990088, 1, 0, 0.5568628, 1,
1.282964, 0.9413258, 0.7121122, 1, 0, 0.5529412, 1,
1.295906, -1.918028, 3.750767, 1, 0, 0.5450981, 1,
1.297197, 0.3982819, 0.6362426, 1, 0, 0.5411765, 1,
1.302989, 0.4542549, 0.5670713, 1, 0, 0.5333334, 1,
1.318718, -0.6457359, 2.905221, 1, 0, 0.5294118, 1,
1.320441, -0.8727001, 1.850471, 1, 0, 0.5215687, 1,
1.321658, -0.9950666, 2.836778, 1, 0, 0.5176471, 1,
1.323052, 0.3743966, 1.14939, 1, 0, 0.509804, 1,
1.333746, 2.706866, 1.361669, 1, 0, 0.5058824, 1,
1.342152, -0.6029981, 3.289935, 1, 0, 0.4980392, 1,
1.345277, 0.4780253, 1.364858, 1, 0, 0.4901961, 1,
1.347875, 0.4254487, 2.250416, 1, 0, 0.4862745, 1,
1.36072, 0.1880223, 0.9395929, 1, 0, 0.4784314, 1,
1.366402, 0.5436465, -0.1335616, 1, 0, 0.4745098, 1,
1.369798, 1.036705, 0.1973532, 1, 0, 0.4666667, 1,
1.374043, 0.9469798, -0.7914702, 1, 0, 0.4627451, 1,
1.383226, 1.738545, -0.7672868, 1, 0, 0.454902, 1,
1.401141, 0.3681757, 2.072049, 1, 0, 0.4509804, 1,
1.402544, 0.5939271, 1.475927, 1, 0, 0.4431373, 1,
1.405864, -1.743404, -0.04445374, 1, 0, 0.4392157, 1,
1.408988, 0.5796857, 2.865302, 1, 0, 0.4313726, 1,
1.410159, -0.8163192, 2.985414, 1, 0, 0.427451, 1,
1.412782, 0.7794094, 1.804889, 1, 0, 0.4196078, 1,
1.42373, 1.213037, 0.2564297, 1, 0, 0.4156863, 1,
1.426283, -1.968153, 4.287941, 1, 0, 0.4078431, 1,
1.443091, -0.2916667, 2.729676, 1, 0, 0.4039216, 1,
1.482737, 1.201144, 0.6389385, 1, 0, 0.3960784, 1,
1.486006, 0.6346279, 1.763134, 1, 0, 0.3882353, 1,
1.494339, -1.667158, 2.092366, 1, 0, 0.3843137, 1,
1.497711, 0.3837298, 2.293325, 1, 0, 0.3764706, 1,
1.499412, 0.1739849, 2.452699, 1, 0, 0.372549, 1,
1.511641, 1.160017, 1.209444, 1, 0, 0.3647059, 1,
1.520312, -1.31998, 1.607964, 1, 0, 0.3607843, 1,
1.526654, -0.1162467, 2.706251, 1, 0, 0.3529412, 1,
1.550653, -2.221895, 2.527984, 1, 0, 0.3490196, 1,
1.560595, -2.030723, 2.614391, 1, 0, 0.3411765, 1,
1.562659, 1.464511, 2.840497, 1, 0, 0.3372549, 1,
1.566698, -1.372104, 2.859242, 1, 0, 0.3294118, 1,
1.614314, -0.6889172, 2.246782, 1, 0, 0.3254902, 1,
1.617214, -1.483904, 2.0095, 1, 0, 0.3176471, 1,
1.61977, -0.3531773, 0.462949, 1, 0, 0.3137255, 1,
1.633011, -0.0633199, 1.316739, 1, 0, 0.3058824, 1,
1.640384, 0.6947616, 1.047434, 1, 0, 0.2980392, 1,
1.64925, -0.07389247, 2.555526, 1, 0, 0.2941177, 1,
1.659352, -0.05796899, 1.950667, 1, 0, 0.2862745, 1,
1.670435, 2.575855, 1.488701, 1, 0, 0.282353, 1,
1.67774, -0.2545626, 2.632967, 1, 0, 0.2745098, 1,
1.680161, 1.602799, 0.3315311, 1, 0, 0.2705882, 1,
1.682762, -2.555346, 1.219573, 1, 0, 0.2627451, 1,
1.68618, 0.9724019, 1.445533, 1, 0, 0.2588235, 1,
1.690571, -0.1780025, 1.381346, 1, 0, 0.2509804, 1,
1.713053, -0.5338807, 3.164544, 1, 0, 0.2470588, 1,
1.714353, 0.2760668, 1.456563, 1, 0, 0.2392157, 1,
1.726869, -1.012768, 3.02404, 1, 0, 0.2352941, 1,
1.734913, 1.642453, 0.03028389, 1, 0, 0.227451, 1,
1.765932, 1.207629, 0.9294608, 1, 0, 0.2235294, 1,
1.782842, -1.022835, 1.66925, 1, 0, 0.2156863, 1,
1.788552, -0.2206267, 2.599653, 1, 0, 0.2117647, 1,
1.808971, -0.41289, 2.249526, 1, 0, 0.2039216, 1,
1.813358, -0.497601, 2.49234, 1, 0, 0.1960784, 1,
1.815679, -0.04581457, -0.0778068, 1, 0, 0.1921569, 1,
1.821177, -0.2203399, -0.6808591, 1, 0, 0.1843137, 1,
1.821669, -0.8178289, 2.305818, 1, 0, 0.1803922, 1,
1.830873, -0.40823, 1.232014, 1, 0, 0.172549, 1,
1.840343, 0.2462711, 1.790789, 1, 0, 0.1686275, 1,
1.876301, -1.752107, 1.985983, 1, 0, 0.1607843, 1,
1.898625, 1.465873, -0.4408112, 1, 0, 0.1568628, 1,
1.926065, 0.8355948, 2.100654, 1, 0, 0.1490196, 1,
1.95566, 0.07577485, -1.0713, 1, 0, 0.145098, 1,
1.960562, 0.4857175, 0.788808, 1, 0, 0.1372549, 1,
1.970742, -0.5831369, 0.8769458, 1, 0, 0.1333333, 1,
2.02291, 0.7404357, 0.8466292, 1, 0, 0.1254902, 1,
2.074049, -0.2206446, 1.463816, 1, 0, 0.1215686, 1,
2.081042, -1.531883, 2.32012, 1, 0, 0.1137255, 1,
2.092321, -0.52368, 1.535188, 1, 0, 0.1098039, 1,
2.109411, 2.147408, 0.01125801, 1, 0, 0.1019608, 1,
2.12192, -0.7497935, 1.327044, 1, 0, 0.09411765, 1,
2.16917, -0.4717172, 3.354835, 1, 0, 0.09019608, 1,
2.188127, 0.4440416, 0.7166274, 1, 0, 0.08235294, 1,
2.197752, 0.8381826, 2.592729, 1, 0, 0.07843138, 1,
2.238178, -0.4291079, 3.051987, 1, 0, 0.07058824, 1,
2.27636, 1.472253, 1.101864, 1, 0, 0.06666667, 1,
2.375494, -0.1948903, 1.244183, 1, 0, 0.05882353, 1,
2.430233, -0.4796737, 2.774378, 1, 0, 0.05490196, 1,
2.527686, 0.2154213, 0.9707851, 1, 0, 0.04705882, 1,
2.590707, -0.2271551, 1.363833, 1, 0, 0.04313726, 1,
2.648068, -0.7077495, 1.068396, 1, 0, 0.03529412, 1,
2.758414, -2.140673, 0.8942833, 1, 0, 0.03137255, 1,
2.843408, -0.5777759, 1.764967, 1, 0, 0.02352941, 1,
2.953706, -0.08458635, 1.630904, 1, 0, 0.01960784, 1,
3.006402, -0.08708685, 0.06951189, 1, 0, 0.01176471, 1,
3.802196, 0.8324139, 2.372926, 1, 0, 0.007843138, 1
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
0.3047893, -3.729346, -7.253958, 0, -0.5, 0.5, 0.5,
0.3047893, -3.729346, -7.253958, 1, -0.5, 0.5, 0.5,
0.3047893, -3.729346, -7.253958, 1, 1.5, 0.5, 0.5,
0.3047893, -3.729346, -7.253958, 0, 1.5, 0.5, 0.5
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
-4.378239, 0.0300529, -7.253958, 0, -0.5, 0.5, 0.5,
-4.378239, 0.0300529, -7.253958, 1, -0.5, 0.5, 0.5,
-4.378239, 0.0300529, -7.253958, 1, 1.5, 0.5, 0.5,
-4.378239, 0.0300529, -7.253958, 0, 1.5, 0.5, 0.5
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
-4.378239, -3.729346, -0.1651306, 0, -0.5, 0.5, 0.5,
-4.378239, -3.729346, -0.1651306, 1, -0.5, 0.5, 0.5,
-4.378239, -3.729346, -0.1651306, 1, 1.5, 0.5, 0.5,
-4.378239, -3.729346, -0.1651306, 0, 1.5, 0.5, 0.5
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
-3, -2.861793, -5.618075,
3, -2.861793, -5.618075,
-3, -2.861793, -5.618075,
-3, -3.006385, -5.890722,
-2, -2.861793, -5.618075,
-2, -3.006385, -5.890722,
-1, -2.861793, -5.618075,
-1, -3.006385, -5.890722,
0, -2.861793, -5.618075,
0, -3.006385, -5.890722,
1, -2.861793, -5.618075,
1, -3.006385, -5.890722,
2, -2.861793, -5.618075,
2, -3.006385, -5.890722,
3, -2.861793, -5.618075,
3, -3.006385, -5.890722
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
-3, -3.295569, -6.436017, 0, -0.5, 0.5, 0.5,
-3, -3.295569, -6.436017, 1, -0.5, 0.5, 0.5,
-3, -3.295569, -6.436017, 1, 1.5, 0.5, 0.5,
-3, -3.295569, -6.436017, 0, 1.5, 0.5, 0.5,
-2, -3.295569, -6.436017, 0, -0.5, 0.5, 0.5,
-2, -3.295569, -6.436017, 1, -0.5, 0.5, 0.5,
-2, -3.295569, -6.436017, 1, 1.5, 0.5, 0.5,
-2, -3.295569, -6.436017, 0, 1.5, 0.5, 0.5,
-1, -3.295569, -6.436017, 0, -0.5, 0.5, 0.5,
-1, -3.295569, -6.436017, 1, -0.5, 0.5, 0.5,
-1, -3.295569, -6.436017, 1, 1.5, 0.5, 0.5,
-1, -3.295569, -6.436017, 0, 1.5, 0.5, 0.5,
0, -3.295569, -6.436017, 0, -0.5, 0.5, 0.5,
0, -3.295569, -6.436017, 1, -0.5, 0.5, 0.5,
0, -3.295569, -6.436017, 1, 1.5, 0.5, 0.5,
0, -3.295569, -6.436017, 0, 1.5, 0.5, 0.5,
1, -3.295569, -6.436017, 0, -0.5, 0.5, 0.5,
1, -3.295569, -6.436017, 1, -0.5, 0.5, 0.5,
1, -3.295569, -6.436017, 1, 1.5, 0.5, 0.5,
1, -3.295569, -6.436017, 0, 1.5, 0.5, 0.5,
2, -3.295569, -6.436017, 0, -0.5, 0.5, 0.5,
2, -3.295569, -6.436017, 1, -0.5, 0.5, 0.5,
2, -3.295569, -6.436017, 1, 1.5, 0.5, 0.5,
2, -3.295569, -6.436017, 0, 1.5, 0.5, 0.5,
3, -3.295569, -6.436017, 0, -0.5, 0.5, 0.5,
3, -3.295569, -6.436017, 1, -0.5, 0.5, 0.5,
3, -3.295569, -6.436017, 1, 1.5, 0.5, 0.5,
3, -3.295569, -6.436017, 0, 1.5, 0.5, 0.5
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
-3.29754, -2, -5.618075,
-3.29754, 2, -5.618075,
-3.29754, -2, -5.618075,
-3.477656, -2, -5.890722,
-3.29754, -1, -5.618075,
-3.477656, -1, -5.890722,
-3.29754, 0, -5.618075,
-3.477656, 0, -5.890722,
-3.29754, 1, -5.618075,
-3.477656, 1, -5.890722,
-3.29754, 2, -5.618075,
-3.477656, 2, -5.890722
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
-3.837889, -2, -6.436017, 0, -0.5, 0.5, 0.5,
-3.837889, -2, -6.436017, 1, -0.5, 0.5, 0.5,
-3.837889, -2, -6.436017, 1, 1.5, 0.5, 0.5,
-3.837889, -2, -6.436017, 0, 1.5, 0.5, 0.5,
-3.837889, -1, -6.436017, 0, -0.5, 0.5, 0.5,
-3.837889, -1, -6.436017, 1, -0.5, 0.5, 0.5,
-3.837889, -1, -6.436017, 1, 1.5, 0.5, 0.5,
-3.837889, -1, -6.436017, 0, 1.5, 0.5, 0.5,
-3.837889, 0, -6.436017, 0, -0.5, 0.5, 0.5,
-3.837889, 0, -6.436017, 1, -0.5, 0.5, 0.5,
-3.837889, 0, -6.436017, 1, 1.5, 0.5, 0.5,
-3.837889, 0, -6.436017, 0, 1.5, 0.5, 0.5,
-3.837889, 1, -6.436017, 0, -0.5, 0.5, 0.5,
-3.837889, 1, -6.436017, 1, -0.5, 0.5, 0.5,
-3.837889, 1, -6.436017, 1, 1.5, 0.5, 0.5,
-3.837889, 1, -6.436017, 0, 1.5, 0.5, 0.5,
-3.837889, 2, -6.436017, 0, -0.5, 0.5, 0.5,
-3.837889, 2, -6.436017, 1, -0.5, 0.5, 0.5,
-3.837889, 2, -6.436017, 1, 1.5, 0.5, 0.5,
-3.837889, 2, -6.436017, 0, 1.5, 0.5, 0.5
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
-3.29754, -2.861793, -4,
-3.29754, -2.861793, 4,
-3.29754, -2.861793, -4,
-3.477656, -3.006385, -4,
-3.29754, -2.861793, -2,
-3.477656, -3.006385, -2,
-3.29754, -2.861793, 0,
-3.477656, -3.006385, 0,
-3.29754, -2.861793, 2,
-3.477656, -3.006385, 2,
-3.29754, -2.861793, 4,
-3.477656, -3.006385, 4
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
-3.837889, -3.295569, -4, 0, -0.5, 0.5, 0.5,
-3.837889, -3.295569, -4, 1, -0.5, 0.5, 0.5,
-3.837889, -3.295569, -4, 1, 1.5, 0.5, 0.5,
-3.837889, -3.295569, -4, 0, 1.5, 0.5, 0.5,
-3.837889, -3.295569, -2, 0, -0.5, 0.5, 0.5,
-3.837889, -3.295569, -2, 1, -0.5, 0.5, 0.5,
-3.837889, -3.295569, -2, 1, 1.5, 0.5, 0.5,
-3.837889, -3.295569, -2, 0, 1.5, 0.5, 0.5,
-3.837889, -3.295569, 0, 0, -0.5, 0.5, 0.5,
-3.837889, -3.295569, 0, 1, -0.5, 0.5, 0.5,
-3.837889, -3.295569, 0, 1, 1.5, 0.5, 0.5,
-3.837889, -3.295569, 0, 0, 1.5, 0.5, 0.5,
-3.837889, -3.295569, 2, 0, -0.5, 0.5, 0.5,
-3.837889, -3.295569, 2, 1, -0.5, 0.5, 0.5,
-3.837889, -3.295569, 2, 1, 1.5, 0.5, 0.5,
-3.837889, -3.295569, 2, 0, 1.5, 0.5, 0.5,
-3.837889, -3.295569, 4, 0, -0.5, 0.5, 0.5,
-3.837889, -3.295569, 4, 1, -0.5, 0.5, 0.5,
-3.837889, -3.295569, 4, 1, 1.5, 0.5, 0.5,
-3.837889, -3.295569, 4, 0, 1.5, 0.5, 0.5
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
-3.29754, -2.861793, -5.618075,
-3.29754, 2.921898, -5.618075,
-3.29754, -2.861793, 5.287814,
-3.29754, 2.921898, 5.287814,
-3.29754, -2.861793, -5.618075,
-3.29754, -2.861793, 5.287814,
-3.29754, 2.921898, -5.618075,
-3.29754, 2.921898, 5.287814,
-3.29754, -2.861793, -5.618075,
3.907119, -2.861793, -5.618075,
-3.29754, -2.861793, 5.287814,
3.907119, -2.861793, 5.287814,
-3.29754, 2.921898, -5.618075,
3.907119, 2.921898, -5.618075,
-3.29754, 2.921898, 5.287814,
3.907119, 2.921898, 5.287814,
3.907119, -2.861793, -5.618075,
3.907119, 2.921898, -5.618075,
3.907119, -2.861793, 5.287814,
3.907119, 2.921898, 5.287814,
3.907119, -2.861793, -5.618075,
3.907119, -2.861793, 5.287814,
3.907119, 2.921898, -5.618075,
3.907119, 2.921898, 5.287814
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
var radius = 7.632311;
var distance = 33.95701;
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
mvMatrix.translate( -0.3047893, -0.0300529, 0.1651306 );
mvMatrix.scale( 1.145398, 1.426806, 0.7566741 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.95701);
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
hexythiazox<-read.table("hexythiazox.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-hexythiazox$V2
```

```
## Error in eval(expr, envir, enclos): object 'hexythiazox' not found
```

```r
y<-hexythiazox$V3
```

```
## Error in eval(expr, envir, enclos): object 'hexythiazox' not found
```

```r
z<-hexythiazox$V4
```

```
## Error in eval(expr, envir, enclos): object 'hexythiazox' not found
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
-3.192618, -0.0467845, -0.8408237, 0, 0, 1, 1, 1,
-3.144134, 1.165237, -0.7614498, 1, 0, 0, 1, 1,
-2.943054, -1.104303, -2.6081, 1, 0, 0, 1, 1,
-2.864766, -1.047006, -1.067899, 1, 0, 0, 1, 1,
-2.722081, 1.557998, 0.6742917, 1, 0, 0, 1, 1,
-2.713754, -0.2709248, -2.64692, 1, 0, 0, 1, 1,
-2.625486, 1.010157, -1.384484, 0, 0, 0, 1, 1,
-2.548767, -0.7242978, -1.046725, 0, 0, 0, 1, 1,
-2.468002, 1.831273, -1.546352, 0, 0, 0, 1, 1,
-2.437782, -0.9893863, -0.5238875, 0, 0, 0, 1, 1,
-2.416386, 0.4399706, 0.5247419, 0, 0, 0, 1, 1,
-2.279529, -1.226286, -2.748044, 0, 0, 0, 1, 1,
-2.277232, 1.445649, -1.003618, 0, 0, 0, 1, 1,
-2.255236, 0.2664387, -0.9865177, 1, 1, 1, 1, 1,
-2.20255, -0.710388, -2.08369, 1, 1, 1, 1, 1,
-2.176706, 0.1667243, -0.5339516, 1, 1, 1, 1, 1,
-2.150123, 0.4825773, -1.339957, 1, 1, 1, 1, 1,
-2.137836, -0.5674466, -0.5777305, 1, 1, 1, 1, 1,
-2.109229, -0.2350772, -1.382528, 1, 1, 1, 1, 1,
-2.092748, 0.1473273, -3.508713, 1, 1, 1, 1, 1,
-2.061937, 0.1626163, -1.498643, 1, 1, 1, 1, 1,
-2.03694, -0.07173151, -0.8994793, 1, 1, 1, 1, 1,
-2.009499, -0.7325764, -2.388304, 1, 1, 1, 1, 1,
-2.006401, 1.233491, -0.9722397, 1, 1, 1, 1, 1,
-1.997656, 0.8876012, -3.282232, 1, 1, 1, 1, 1,
-1.980205, 1.634704, -1.911028, 1, 1, 1, 1, 1,
-1.968666, -0.1433996, -1.286802, 1, 1, 1, 1, 1,
-1.954185, 0.1598627, -0.34703, 1, 1, 1, 1, 1,
-1.932856, -0.5453274, -2.567973, 0, 0, 1, 1, 1,
-1.92333, 0.9606453, 1.006344, 1, 0, 0, 1, 1,
-1.923051, 1.150578, -0.4196917, 1, 0, 0, 1, 1,
-1.88859, -1.02424, -2.023377, 1, 0, 0, 1, 1,
-1.887344, 0.7965752, -3.490491, 1, 0, 0, 1, 1,
-1.877524, -0.1429025, -2.755467, 1, 0, 0, 1, 1,
-1.861487, -0.1122928, -1.644091, 0, 0, 0, 1, 1,
-1.85686, 0.212441, -2.620227, 0, 0, 0, 1, 1,
-1.848504, -1.2366, -2.873987, 0, 0, 0, 1, 1,
-1.834338, -0.03981091, -0.286507, 0, 0, 0, 1, 1,
-1.82109, 1.728691, -0.7853522, 0, 0, 0, 1, 1,
-1.80857, 0.6975141, -3.200204, 0, 0, 0, 1, 1,
-1.806847, -1.981596, -3.362906, 0, 0, 0, 1, 1,
-1.798804, -1.349192, -1.746264, 1, 1, 1, 1, 1,
-1.784184, -0.7796997, -2.759444, 1, 1, 1, 1, 1,
-1.767447, 0.172943, -1.57969, 1, 1, 1, 1, 1,
-1.746945, -0.4177576, -3.279911, 1, 1, 1, 1, 1,
-1.74529, 0.1882878, -1.848664, 1, 1, 1, 1, 1,
-1.711536, -1.288108, -1.630573, 1, 1, 1, 1, 1,
-1.701303, 0.2361761, -0.3912328, 1, 1, 1, 1, 1,
-1.699241, 0.3394044, -1.194868, 1, 1, 1, 1, 1,
-1.673929, -0.7618411, -2.494884, 1, 1, 1, 1, 1,
-1.668139, 1.199819, -0.8905542, 1, 1, 1, 1, 1,
-1.657834, 0.6043407, -2.494769, 1, 1, 1, 1, 1,
-1.639723, 0.4457895, -2.064079, 1, 1, 1, 1, 1,
-1.637366, 0.3067481, -1.045776, 1, 1, 1, 1, 1,
-1.635648, -0.2740457, -0.8061872, 1, 1, 1, 1, 1,
-1.629542, 0.5743775, -1.629723, 1, 1, 1, 1, 1,
-1.610364, -1.192388, -2.198841, 0, 0, 1, 1, 1,
-1.601368, 0.9747875, 0.2090049, 1, 0, 0, 1, 1,
-1.57123, 1.682774, 1.048518, 1, 0, 0, 1, 1,
-1.54895, -0.7028278, -0.8974133, 1, 0, 0, 1, 1,
-1.548933, 0.5138953, -2.738174, 1, 0, 0, 1, 1,
-1.548473, 1.308369, 0.08702568, 1, 0, 0, 1, 1,
-1.523394, 0.6168201, -3.635747, 0, 0, 0, 1, 1,
-1.523351, -0.2720652, -2.285285, 0, 0, 0, 1, 1,
-1.512058, 0.8101623, -0.461183, 0, 0, 0, 1, 1,
-1.490523, 0.0003875093, -1.180221, 0, 0, 0, 1, 1,
-1.48985, -0.8062908, -1.548057, 0, 0, 0, 1, 1,
-1.48168, 0.3549176, -2.71729, 0, 0, 0, 1, 1,
-1.478404, 0.423481, -0.5114096, 0, 0, 0, 1, 1,
-1.476748, -1.319374, -2.206035, 1, 1, 1, 1, 1,
-1.467126, 0.8673564, -0.2670189, 1, 1, 1, 1, 1,
-1.463241, -0.6717932, -1.634274, 1, 1, 1, 1, 1,
-1.461995, 0.7815906, -0.5048666, 1, 1, 1, 1, 1,
-1.460986, -0.8390855, -3.045546, 1, 1, 1, 1, 1,
-1.457447, -0.6632576, -2.0197, 1, 1, 1, 1, 1,
-1.443959, 1.770276, 0.2175478, 1, 1, 1, 1, 1,
-1.439364, 1.171965, -2.588497, 1, 1, 1, 1, 1,
-1.424673, 0.3581016, -1.818629, 1, 1, 1, 1, 1,
-1.412848, 0.007010558, -2.048745, 1, 1, 1, 1, 1,
-1.39401, -0.7186183, -3.291726, 1, 1, 1, 1, 1,
-1.389307, -0.7169527, 0.1677888, 1, 1, 1, 1, 1,
-1.37362, -2.233629, -2.562994, 1, 1, 1, 1, 1,
-1.368837, -0.7506292, -1.709216, 1, 1, 1, 1, 1,
-1.364635, 0.368835, 0.4483566, 1, 1, 1, 1, 1,
-1.360339, 1.470436, -0.7296813, 0, 0, 1, 1, 1,
-1.356266, 0.3514638, -0.712109, 1, 0, 0, 1, 1,
-1.353263, -0.519995, -1.971249, 1, 0, 0, 1, 1,
-1.353044, 0.6167676, -0.5749601, 1, 0, 0, 1, 1,
-1.350603, 0.6749433, -0.9194784, 1, 0, 0, 1, 1,
-1.350518, 0.9727823, -1.599659, 1, 0, 0, 1, 1,
-1.340859, -1.515118, -1.533424, 0, 0, 0, 1, 1,
-1.340491, 1.339949, -0.1232345, 0, 0, 0, 1, 1,
-1.320932, 0.4803514, -0.1422965, 0, 0, 0, 1, 1,
-1.317272, 0.5364527, 0.6284821, 0, 0, 0, 1, 1,
-1.315178, 0.6629322, -2.853196, 0, 0, 0, 1, 1,
-1.308058, -0.3409538, -0.9531055, 0, 0, 0, 1, 1,
-1.307721, -0.7080479, -1.720809, 0, 0, 0, 1, 1,
-1.306717, 0.2507797, 0.2624118, 1, 1, 1, 1, 1,
-1.302332, 0.7528823, 0.7881578, 1, 1, 1, 1, 1,
-1.301791, 0.02711939, 0.1857416, 1, 1, 1, 1, 1,
-1.299238, -0.4695631, -3.335566, 1, 1, 1, 1, 1,
-1.289701, 0.1881038, -3.246476, 1, 1, 1, 1, 1,
-1.288906, 1.260217, -0.4990778, 1, 1, 1, 1, 1,
-1.286081, 2.280674, -2.985383, 1, 1, 1, 1, 1,
-1.284655, 0.5979959, -1.366424, 1, 1, 1, 1, 1,
-1.282658, -0.4978052, -0.3888465, 1, 1, 1, 1, 1,
-1.282239, 0.2721017, -1.286259, 1, 1, 1, 1, 1,
-1.280898, 1.991373, -0.001767344, 1, 1, 1, 1, 1,
-1.275481, -0.009589726, -3.623382, 1, 1, 1, 1, 1,
-1.273157, 1.051832, -1.926521, 1, 1, 1, 1, 1,
-1.269728, -0.6787947, -2.277609, 1, 1, 1, 1, 1,
-1.261746, -0.9742209, -1.900207, 1, 1, 1, 1, 1,
-1.255205, 0.7273057, -0.7672861, 0, 0, 1, 1, 1,
-1.254264, 0.1918918, 0.1112579, 1, 0, 0, 1, 1,
-1.239266, 0.4362303, -1.264267, 1, 0, 0, 1, 1,
-1.235841, 0.9376318, 0.502082, 1, 0, 0, 1, 1,
-1.231967, 1.644335, 0.6247201, 1, 0, 0, 1, 1,
-1.226006, -1.318335, -3.29054, 1, 0, 0, 1, 1,
-1.225404, -0.7578018, 0.4731838, 0, 0, 0, 1, 1,
-1.222427, 0.4296479, -2.164452, 0, 0, 0, 1, 1,
-1.220445, 0.7860035, 0.1490039, 0, 0, 0, 1, 1,
-1.211695, -2.008759, -3.723512, 0, 0, 0, 1, 1,
-1.20766, 0.6520786, 0.2042354, 0, 0, 0, 1, 1,
-1.205188, -0.07570817, -0.5245214, 0, 0, 0, 1, 1,
-1.204409, 0.1438859, -0.7252629, 0, 0, 0, 1, 1,
-1.196311, -0.9115346, -1.454904, 1, 1, 1, 1, 1,
-1.195142, -0.4282802, -1.706733, 1, 1, 1, 1, 1,
-1.190637, 0.3879208, 0.9194755, 1, 1, 1, 1, 1,
-1.186199, 1.029105, -1.177483, 1, 1, 1, 1, 1,
-1.182917, -0.1598384, -1.927298, 1, 1, 1, 1, 1,
-1.179624, -0.4355162, -3.63278, 1, 1, 1, 1, 1,
-1.176005, -0.9225937, -1.37472, 1, 1, 1, 1, 1,
-1.161016, -0.5451868, -1.10862, 1, 1, 1, 1, 1,
-1.159031, 1.779878, -0.5673045, 1, 1, 1, 1, 1,
-1.152541, -0.5690397, -1.978832, 1, 1, 1, 1, 1,
-1.149779, -0.3594637, -2.625455, 1, 1, 1, 1, 1,
-1.143614, -0.3780926, -1.817427, 1, 1, 1, 1, 1,
-1.14144, -0.2372651, -0.8974733, 1, 1, 1, 1, 1,
-1.140815, 1.251738, -0.1479795, 1, 1, 1, 1, 1,
-1.135835, -0.536183, -1.21676, 1, 1, 1, 1, 1,
-1.134812, -0.4617215, -1.730141, 0, 0, 1, 1, 1,
-1.129057, -1.399297, -1.075064, 1, 0, 0, 1, 1,
-1.127261, -0.4607934, -0.1092692, 1, 0, 0, 1, 1,
-1.125562, -1.272705, -2.568837, 1, 0, 0, 1, 1,
-1.115435, -1.056549, -2.878309, 1, 0, 0, 1, 1,
-1.111719, -0.1653795, -1.085669, 1, 0, 0, 1, 1,
-1.106865, -0.1948681, -1.640947, 0, 0, 0, 1, 1,
-1.102498, 0.9309966, -1.405462, 0, 0, 0, 1, 1,
-1.095196, 0.4320158, -2.066997, 0, 0, 0, 1, 1,
-1.092867, -1.071813, -1.801391, 0, 0, 0, 1, 1,
-1.091167, -2.599707, -2.344244, 0, 0, 0, 1, 1,
-1.089046, -1.427936, -1.35739, 0, 0, 0, 1, 1,
-1.082862, 0.6770852, 0.6709849, 0, 0, 0, 1, 1,
-1.074614, -1.471172, -0.7680126, 1, 1, 1, 1, 1,
-1.073877, 1.440889, 0.1282688, 1, 1, 1, 1, 1,
-1.060117, -0.7076129, -3.368086, 1, 1, 1, 1, 1,
-1.054282, 0.7398993, -2.612212, 1, 1, 1, 1, 1,
-1.04997, -1.192588, -3.198294, 1, 1, 1, 1, 1,
-1.049625, -0.3425901, 0.1807425, 1, 1, 1, 1, 1,
-1.0425, 1.046772, 1.260493, 1, 1, 1, 1, 1,
-1.036895, 1.021188, -2.594401, 1, 1, 1, 1, 1,
-1.033635, 0.3289892, -0.2342029, 1, 1, 1, 1, 1,
-1.03141, 0.4723228, -0.9386908, 1, 1, 1, 1, 1,
-1.028838, 0.5170475, -2.67186, 1, 1, 1, 1, 1,
-1.024325, 1.811048, -1.494002, 1, 1, 1, 1, 1,
-1.021187, -0.6938726, -1.128698, 1, 1, 1, 1, 1,
-1.020254, 0.1238184, -2.071723, 1, 1, 1, 1, 1,
-1.015833, 0.305824, -2.223359, 1, 1, 1, 1, 1,
-1.011382, 1.665531, 0.09180981, 0, 0, 1, 1, 1,
-0.9976379, 0.5731009, -1.095879, 1, 0, 0, 1, 1,
-0.9975787, 0.5958067, 0.6206023, 1, 0, 0, 1, 1,
-0.9954044, 0.2901156, -1.837776, 1, 0, 0, 1, 1,
-0.9945037, 0.3107425, -1.695332, 1, 0, 0, 1, 1,
-0.9858271, -1.053307, -0.5982872, 1, 0, 0, 1, 1,
-0.9843639, 0.05741093, -2.066587, 0, 0, 0, 1, 1,
-0.9822491, 2.58518, 0.09696375, 0, 0, 0, 1, 1,
-0.981074, -0.8345044, -3.721951, 0, 0, 0, 1, 1,
-0.9763184, 0.3323786, -0.8235511, 0, 0, 0, 1, 1,
-0.9757079, -0.4320036, -3.621178, 0, 0, 0, 1, 1,
-0.9750478, 0.1517714, -1.518792, 0, 0, 0, 1, 1,
-0.9744167, 0.02731954, -2.743205, 0, 0, 0, 1, 1,
-0.9737477, -0.05922775, -1.619252, 1, 1, 1, 1, 1,
-0.9724166, 1.405239, -1.401053, 1, 1, 1, 1, 1,
-0.9717727, -0.2011774, -2.491158, 1, 1, 1, 1, 1,
-0.9696065, 1.384449, 0.4597329, 1, 1, 1, 1, 1,
-0.9566413, 0.7489055, 0.3946005, 1, 1, 1, 1, 1,
-0.9551143, -0.5668774, -1.719384, 1, 1, 1, 1, 1,
-0.9522415, -1.358991, -3.805351, 1, 1, 1, 1, 1,
-0.9492431, 1.588614, 1.371534, 1, 1, 1, 1, 1,
-0.9490362, -0.2981493, -0.7932733, 1, 1, 1, 1, 1,
-0.9392539, -0.7931474, -3.442157, 1, 1, 1, 1, 1,
-0.9390001, 1.148302, 2.346879, 1, 1, 1, 1, 1,
-0.9380889, -0.3388081, -3.67026, 1, 1, 1, 1, 1,
-0.9356613, 0.9795343, -3.482674, 1, 1, 1, 1, 1,
-0.9274753, -0.089713, -2.533716, 1, 1, 1, 1, 1,
-0.92221, 0.5136216, -0.5439088, 1, 1, 1, 1, 1,
-0.9143677, 0.548616, -2.733539, 0, 0, 1, 1, 1,
-0.9137266, -0.1554479, -0.4984203, 1, 0, 0, 1, 1,
-0.9110785, -1.276436, -1.020903, 1, 0, 0, 1, 1,
-0.9067646, -0.0621831, 0.1527509, 1, 0, 0, 1, 1,
-0.9065683, -0.4006371, -2.318542, 1, 0, 0, 1, 1,
-0.9035248, -0.1911025, -2.884015, 1, 0, 0, 1, 1,
-0.8927946, -1.183674, -3.20285, 0, 0, 0, 1, 1,
-0.8826612, 0.8265502, -0.6875629, 0, 0, 0, 1, 1,
-0.878401, -0.2147185, -1.604568, 0, 0, 0, 1, 1,
-0.8775649, 1.653041, -0.7815053, 0, 0, 0, 1, 1,
-0.8771268, -2.410053, -1.296629, 0, 0, 0, 1, 1,
-0.8660641, 1.434024, -1.157527, 0, 0, 0, 1, 1,
-0.8546646, 2.237954, 0.6043161, 0, 0, 0, 1, 1,
-0.8476597, 1.996913, -0.5180237, 1, 1, 1, 1, 1,
-0.8420537, 0.8134058, -2.061138, 1, 1, 1, 1, 1,
-0.8409461, -0.07323552, -2.82328, 1, 1, 1, 1, 1,
-0.8377858, -1.143664, -2.453212, 1, 1, 1, 1, 1,
-0.835775, -0.5341656, -1.025815, 1, 1, 1, 1, 1,
-0.8354431, 0.655071, -0.6234239, 1, 1, 1, 1, 1,
-0.8352346, -1.599364, -2.880502, 1, 1, 1, 1, 1,
-0.8322842, 0.2794272, -2.546813, 1, 1, 1, 1, 1,
-0.8263237, 1.015182, -0.4851981, 1, 1, 1, 1, 1,
-0.82364, -0.2238762, -1.862769, 1, 1, 1, 1, 1,
-0.8186798, 0.8251212, -1.899841, 1, 1, 1, 1, 1,
-0.8150565, -1.50241, -2.743982, 1, 1, 1, 1, 1,
-0.8076693, -1.88604, -2.197173, 1, 1, 1, 1, 1,
-0.8003832, 0.3292612, -0.5689813, 1, 1, 1, 1, 1,
-0.7917616, -1.146911, -3.335913, 1, 1, 1, 1, 1,
-0.7747252, -0.909331, -1.963981, 0, 0, 1, 1, 1,
-0.7723809, -1.41743, -0.775126, 1, 0, 0, 1, 1,
-0.7667348, 0.6467497, -1.117444, 1, 0, 0, 1, 1,
-0.7634095, 0.03061226, -2.90417, 1, 0, 0, 1, 1,
-0.760446, -0.8447846, -2.485135, 1, 0, 0, 1, 1,
-0.7584159, 0.9973421, -1.999557, 1, 0, 0, 1, 1,
-0.7552706, -0.3853857, -1.762964, 0, 0, 0, 1, 1,
-0.7465405, -0.2628063, -3.134946, 0, 0, 0, 1, 1,
-0.7448172, -0.6416603, -5.00701, 0, 0, 0, 1, 1,
-0.741922, -0.7088961, -1.81546, 0, 0, 0, 1, 1,
-0.7343805, -0.5323808, -3.422743, 0, 0, 0, 1, 1,
-0.7213867, -0.5669242, -3.441854, 0, 0, 0, 1, 1,
-0.7206375, -1.546567, -1.795831, 0, 0, 0, 1, 1,
-0.7170874, -0.4430872, -2.95118, 1, 1, 1, 1, 1,
-0.7129903, 0.00272639, -1.619061, 1, 1, 1, 1, 1,
-0.7121642, 1.083255, -0.2900651, 1, 1, 1, 1, 1,
-0.711901, -1.018366, -3.101744, 1, 1, 1, 1, 1,
-0.7066873, 0.2540703, -0.4829069, 1, 1, 1, 1, 1,
-0.7023717, -1.950575, -1.61587, 1, 1, 1, 1, 1,
-0.701066, 0.9718575, -0.662509, 1, 1, 1, 1, 1,
-0.6985533, 0.3881716, -0.5620852, 1, 1, 1, 1, 1,
-0.6966429, 0.4757332, -0.6534274, 1, 1, 1, 1, 1,
-0.6964134, 0.1372088, -0.5769722, 1, 1, 1, 1, 1,
-0.6949736, 1.021998, 0.131567, 1, 1, 1, 1, 1,
-0.6948016, 0.7926588, -0.8026392, 1, 1, 1, 1, 1,
-0.6896585, -0.1240719, -1.599521, 1, 1, 1, 1, 1,
-0.6866972, -1.50612, -1.457084, 1, 1, 1, 1, 1,
-0.6864494, -0.8484941, -2.048259, 1, 1, 1, 1, 1,
-0.6853147, -0.3378529, -1.487612, 0, 0, 1, 1, 1,
-0.6806996, 0.3054487, 0.3924077, 1, 0, 0, 1, 1,
-0.6768774, -0.3829398, -2.392918, 1, 0, 0, 1, 1,
-0.6727337, 0.9089004, -0.2572976, 1, 0, 0, 1, 1,
-0.6719167, -1.281751, -2.522592, 1, 0, 0, 1, 1,
-0.667999, 0.1447669, 0.2996791, 1, 0, 0, 1, 1,
-0.6669459, 0.1371753, -2.255584, 0, 0, 0, 1, 1,
-0.6662787, -1.129408, -1.680919, 0, 0, 0, 1, 1,
-0.6558531, 0.6344232, -1.275448, 0, 0, 0, 1, 1,
-0.6549959, -1.175519, -2.988039, 0, 0, 0, 1, 1,
-0.6549767, -0.5269711, -4.292244, 0, 0, 0, 1, 1,
-0.649088, 0.2742816, -1.208315, 0, 0, 0, 1, 1,
-0.6475511, 1.594018, -2.234695, 0, 0, 0, 1, 1,
-0.6475464, -0.6685445, -1.043157, 1, 1, 1, 1, 1,
-0.6406943, 0.6697108, -2.325395, 1, 1, 1, 1, 1,
-0.6290819, -0.7765312, -3.752684, 1, 1, 1, 1, 1,
-0.628412, 0.3004607, -2.68495, 1, 1, 1, 1, 1,
-0.6275094, 1.136012, -0.3752831, 1, 1, 1, 1, 1,
-0.6205887, 0.1878818, -0.6776078, 1, 1, 1, 1, 1,
-0.6181602, -1.439943, -2.901125, 1, 1, 1, 1, 1,
-0.607327, -1.417364, -1.984331, 1, 1, 1, 1, 1,
-0.6060256, -0.7347925, -2.374823, 1, 1, 1, 1, 1,
-0.6046378, -0.6509521, -1.234462, 1, 1, 1, 1, 1,
-0.6034769, 1.270221, -0.4425748, 1, 1, 1, 1, 1,
-0.5980373, 1.429195, 1.311066, 1, 1, 1, 1, 1,
-0.5935946, 1.190203, 0.270155, 1, 1, 1, 1, 1,
-0.5828759, 1.508899, -1.177394, 1, 1, 1, 1, 1,
-0.5783398, -0.7430373, -3.890514, 1, 1, 1, 1, 1,
-0.5735008, 2.163908, -0.099069, 0, 0, 1, 1, 1,
-0.5734521, -0.7865039, -0.6282964, 1, 0, 0, 1, 1,
-0.5734364, -0.6021092, -2.297918, 1, 0, 0, 1, 1,
-0.5712757, -0.1649622, -0.4973173, 1, 0, 0, 1, 1,
-0.5671896, 1.335675, 1.107994, 1, 0, 0, 1, 1,
-0.5642512, -0.5279009, -1.690135, 1, 0, 0, 1, 1,
-0.5577995, 0.548413, -1.18827, 0, 0, 0, 1, 1,
-0.5559326, -0.2521729, -1.775546, 0, 0, 0, 1, 1,
-0.5542325, -1.454802, -2.028931, 0, 0, 0, 1, 1,
-0.5514548, 0.5101724, -2.001591, 0, 0, 0, 1, 1,
-0.550505, -0.6197721, -1.094328, 0, 0, 0, 1, 1,
-0.5471987, -1.14398, -3.532751, 0, 0, 0, 1, 1,
-0.54653, -1.847113, -4.57924, 0, 0, 0, 1, 1,
-0.5450517, -0.359889, -1.232255, 1, 1, 1, 1, 1,
-0.5356138, 0.7693381, 0.07213772, 1, 1, 1, 1, 1,
-0.534655, 1.117491, -1.168544, 1, 1, 1, 1, 1,
-0.5332034, 0.712825, -0.2375719, 1, 1, 1, 1, 1,
-0.5300338, 2.12084, -0.8020563, 1, 1, 1, 1, 1,
-0.5281523, 0.05393534, -1.468726, 1, 1, 1, 1, 1,
-0.5241973, -0.6878459, -1.588944, 1, 1, 1, 1, 1,
-0.5234166, -0.3754332, -1.433453, 1, 1, 1, 1, 1,
-0.5230366, -0.9118467, -2.683407, 1, 1, 1, 1, 1,
-0.5208986, 0.3933689, -3.03705, 1, 1, 1, 1, 1,
-0.5105817, 1.540125, 2.61793, 1, 1, 1, 1, 1,
-0.510461, -1.655881, -3.808509, 1, 1, 1, 1, 1,
-0.5097367, -0.7931064, -2.487962, 1, 1, 1, 1, 1,
-0.5016852, 0.7914184, -0.6588795, 1, 1, 1, 1, 1,
-0.4987258, 1.153983, -2.155457, 1, 1, 1, 1, 1,
-0.4977462, 2.240057, 0.2303999, 0, 0, 1, 1, 1,
-0.4944743, -1.268958, -4.119849, 1, 0, 0, 1, 1,
-0.4937235, 0.2358001, -1.27288, 1, 0, 0, 1, 1,
-0.4934202, 0.2155661, -1.390743, 1, 0, 0, 1, 1,
-0.4933815, 1.710802, -2.835365, 1, 0, 0, 1, 1,
-0.4916854, -0.3278292, -1.255282, 1, 0, 0, 1, 1,
-0.4835217, 0.6903189, -1.945665, 0, 0, 0, 1, 1,
-0.4815001, 0.5707303, 0.1646665, 0, 0, 0, 1, 1,
-0.4747745, -1.535485, -3.351271, 0, 0, 0, 1, 1,
-0.4746453, 0.7395544, -1.67981, 0, 0, 0, 1, 1,
-0.4664057, 1.060224, -1.124252, 0, 0, 0, 1, 1,
-0.464522, -0.2823001, -2.880162, 0, 0, 0, 1, 1,
-0.4632781, -0.2968769, -1.792098, 0, 0, 0, 1, 1,
-0.4632213, -1.281941, -3.452531, 1, 1, 1, 1, 1,
-0.4629392, 0.06587084, -0.8441834, 1, 1, 1, 1, 1,
-0.4625205, -0.1377454, -1.619051, 1, 1, 1, 1, 1,
-0.4615974, -0.2362001, -1.539543, 1, 1, 1, 1, 1,
-0.4596021, 1.644148, -0.9095082, 1, 1, 1, 1, 1,
-0.4544358, -1.218517, -2.517154, 1, 1, 1, 1, 1,
-0.4529973, 0.3207029, 0.136101, 1, 1, 1, 1, 1,
-0.4481439, 0.6011982, 0.5260453, 1, 1, 1, 1, 1,
-0.447224, 1.07026, -0.02539074, 1, 1, 1, 1, 1,
-0.4423725, -1.142339, -3.812235, 1, 1, 1, 1, 1,
-0.4383137, 0.4827997, -1.510151, 1, 1, 1, 1, 1,
-0.4312962, 0.6415908, -0.9842466, 1, 1, 1, 1, 1,
-0.4312147, 1.035885, 0.5398673, 1, 1, 1, 1, 1,
-0.428966, 0.9770733, 0.1248467, 1, 1, 1, 1, 1,
-0.4288604, 1.209687, 0.2245422, 1, 1, 1, 1, 1,
-0.4273896, 0.2005314, -1.049243, 0, 0, 1, 1, 1,
-0.4239025, -1.233598, -3.515203, 1, 0, 0, 1, 1,
-0.4208008, -1.051, -3.173362, 1, 0, 0, 1, 1,
-0.4201319, 0.7664312, -0.6252103, 1, 0, 0, 1, 1,
-0.41935, 1.182042, 0.341814, 1, 0, 0, 1, 1,
-0.4176527, -1.005543, -1.796669, 1, 0, 0, 1, 1,
-0.4151014, -1.683195, -3.014498, 0, 0, 0, 1, 1,
-0.4143831, -0.2417565, -4.149039, 0, 0, 0, 1, 1,
-0.4124207, 0.9253621, -2.220343, 0, 0, 0, 1, 1,
-0.4123399, 0.005274732, -2.04343, 0, 0, 0, 1, 1,
-0.4118154, -0.9082373, -0.760905, 0, 0, 0, 1, 1,
-0.4097246, 0.1835178, 0.02871198, 0, 0, 0, 1, 1,
-0.4055157, 0.750591, -0.5754167, 0, 0, 0, 1, 1,
-0.4043668, -0.6577446, -2.81567, 1, 1, 1, 1, 1,
-0.4036558, -0.1975012, -0.5833156, 1, 1, 1, 1, 1,
-0.4006013, 1.113892, 0.707657, 1, 1, 1, 1, 1,
-0.399612, 0.4520314, -1.949142, 1, 1, 1, 1, 1,
-0.3984869, -0.56169, -0.7875597, 1, 1, 1, 1, 1,
-0.3954881, -0.8111333, -3.507, 1, 1, 1, 1, 1,
-0.3887243, -0.2720717, -2.726247, 1, 1, 1, 1, 1,
-0.3861359, 0.5234108, -0.5919023, 1, 1, 1, 1, 1,
-0.3852688, 0.7366936, -1.693927, 1, 1, 1, 1, 1,
-0.3840994, -0.4748267, -1.403298, 1, 1, 1, 1, 1,
-0.3806222, 0.7442693, -2.116588, 1, 1, 1, 1, 1,
-0.3786234, -0.9947714, -1.258518, 1, 1, 1, 1, 1,
-0.3732185, -0.9800979, -2.878153, 1, 1, 1, 1, 1,
-0.3721413, 0.9416538, 0.04534112, 1, 1, 1, 1, 1,
-0.3627728, 2.029988, -0.9706942, 1, 1, 1, 1, 1,
-0.3599465, -0.4933452, -4.657232, 0, 0, 1, 1, 1,
-0.3571866, -1.725712, -3.44605, 1, 0, 0, 1, 1,
-0.3571163, -0.5411373, -2.442696, 1, 0, 0, 1, 1,
-0.3558569, 0.1158711, 0.3580558, 1, 0, 0, 1, 1,
-0.3555893, -0.4948252, -1.1612, 1, 0, 0, 1, 1,
-0.3552599, -0.2433603, -2.521083, 1, 0, 0, 1, 1,
-0.3547584, 0.6807771, 0.2139718, 0, 0, 0, 1, 1,
-0.3525089, 1.14795, 0.09201223, 0, 0, 0, 1, 1,
-0.351857, 0.2977541, -0.8897296, 0, 0, 0, 1, 1,
-0.3510862, 1.14528, 0.2741321, 0, 0, 0, 1, 1,
-0.3438278, -0.03685434, -1.409287, 0, 0, 0, 1, 1,
-0.3435827, -0.9900897, -2.678208, 0, 0, 0, 1, 1,
-0.3379019, -0.2359554, -2.543845, 0, 0, 0, 1, 1,
-0.33636, -0.5359401, -3.704501, 1, 1, 1, 1, 1,
-0.3340818, 0.2076402, -0.205487, 1, 1, 1, 1, 1,
-0.3337206, -0.3783346, -2.86619, 1, 1, 1, 1, 1,
-0.3331073, -1.200454, -2.578127, 1, 1, 1, 1, 1,
-0.3320196, -0.9678951, -2.994495, 1, 1, 1, 1, 1,
-0.330392, -0.9246796, -4.30804, 1, 1, 1, 1, 1,
-0.3301843, 0.2464558, -1.090292, 1, 1, 1, 1, 1,
-0.3278686, -1.022605, -2.923664, 1, 1, 1, 1, 1,
-0.3262064, -1.468717, -2.336002, 1, 1, 1, 1, 1,
-0.3230348, 0.43386, 0.2796775, 1, 1, 1, 1, 1,
-0.3203078, -0.01033582, -3.099828, 1, 1, 1, 1, 1,
-0.3181286, 2.241005, -1.051171, 1, 1, 1, 1, 1,
-0.309363, 0.9276029, -0.1066094, 1, 1, 1, 1, 1,
-0.3034317, -0.2403028, -0.3995058, 1, 1, 1, 1, 1,
-0.2958571, 0.0475856, -0.7449402, 1, 1, 1, 1, 1,
-0.2955587, 0.01479269, -1.494669, 0, 0, 1, 1, 1,
-0.2914305, -0.08190032, -1.504804, 1, 0, 0, 1, 1,
-0.2873997, 0.09100432, -2.66235, 1, 0, 0, 1, 1,
-0.2855327, -1.529911, -1.98467, 1, 0, 0, 1, 1,
-0.2835572, 0.001010419, -2.014198, 1, 0, 0, 1, 1,
-0.2824318, -1.328268, -1.16125, 1, 0, 0, 1, 1,
-0.2786505, 0.2877958, -0.1386995, 0, 0, 0, 1, 1,
-0.275678, -1.590577, -1.694404, 0, 0, 0, 1, 1,
-0.2741654, -0.01631465, -0.4940233, 0, 0, 0, 1, 1,
-0.2741255, 0.09942907, -2.264536, 0, 0, 0, 1, 1,
-0.2715803, -0.7551103, -2.255571, 0, 0, 0, 1, 1,
-0.2713059, 0.1254074, -0.849147, 0, 0, 0, 1, 1,
-0.2700799, 0.0866737, -2.866601, 0, 0, 0, 1, 1,
-0.2689022, 1.814253, 0.1217076, 1, 1, 1, 1, 1,
-0.2677133, 0.7085475, -1.615703, 1, 1, 1, 1, 1,
-0.2674055, 0.9640726, 0.5453746, 1, 1, 1, 1, 1,
-0.2656229, -2.256686, -0.9696916, 1, 1, 1, 1, 1,
-0.2654068, -1.526952, -2.467345, 1, 1, 1, 1, 1,
-0.2645838, 0.3713846, -0.3053584, 1, 1, 1, 1, 1,
-0.2645611, -0.1261031, -2.525902, 1, 1, 1, 1, 1,
-0.2633146, -0.6703735, -2.225909, 1, 1, 1, 1, 1,
-0.2611725, 0.7795232, 0.6874092, 1, 1, 1, 1, 1,
-0.2610922, 0.03692854, -1.480767, 1, 1, 1, 1, 1,
-0.2567034, 0.03382178, -1.864787, 1, 1, 1, 1, 1,
-0.2566157, 0.1188237, -2.383307, 1, 1, 1, 1, 1,
-0.2557655, -0.566835, -2.159678, 1, 1, 1, 1, 1,
-0.2549882, -0.889544, -1.434877, 1, 1, 1, 1, 1,
-0.2549074, -0.2014544, -3.25995, 1, 1, 1, 1, 1,
-0.2492468, 1.789998, 0.9328278, 0, 0, 1, 1, 1,
-0.2491791, 1.181308, -1.359115, 1, 0, 0, 1, 1,
-0.2489198, 0.2764461, 0.4685401, 1, 0, 0, 1, 1,
-0.2475639, -1.87211, -2.893072, 1, 0, 0, 1, 1,
-0.244093, -0.6083406, -4.173168, 1, 0, 0, 1, 1,
-0.2337042, 1.059337, -2.05109, 1, 0, 0, 1, 1,
-0.231867, 0.6801171, -0.2511174, 0, 0, 0, 1, 1,
-0.2289249, -0.4785873, -1.957857, 0, 0, 0, 1, 1,
-0.2241728, -2.393048, -2.967854, 0, 0, 0, 1, 1,
-0.2232816, 1.511091, 0.2233926, 0, 0, 0, 1, 1,
-0.2203671, 1.00416, 0.4058954, 0, 0, 0, 1, 1,
-0.217279, 1.307209, -1.393949, 0, 0, 0, 1, 1,
-0.2165099, 0.9207926, -0.9445277, 0, 0, 0, 1, 1,
-0.2142943, 0.5457258, -0.9542428, 1, 1, 1, 1, 1,
-0.2059423, 0.03345, -2.951544, 1, 1, 1, 1, 1,
-0.2046448, 0.08696514, -1.613613, 1, 1, 1, 1, 1,
-0.2042174, -0.4628615, -3.515912, 1, 1, 1, 1, 1,
-0.2030828, -0.3736826, -3.151553, 1, 1, 1, 1, 1,
-0.2022528, 0.3770804, -1.018172, 1, 1, 1, 1, 1,
-0.1913958, -0.6625525, -2.896156, 1, 1, 1, 1, 1,
-0.1909308, -0.933475, -1.725903, 1, 1, 1, 1, 1,
-0.1850839, 0.2881117, -1.117679, 1, 1, 1, 1, 1,
-0.1818573, -0.7434235, -3.026169, 1, 1, 1, 1, 1,
-0.1790278, -0.6368068, -2.635468, 1, 1, 1, 1, 1,
-0.1787827, -0.03046693, -1.085712, 1, 1, 1, 1, 1,
-0.171275, -0.6315577, -3.447619, 1, 1, 1, 1, 1,
-0.168565, 0.2600241, -1.136197, 1, 1, 1, 1, 1,
-0.1648939, -1.8931, -1.725138, 1, 1, 1, 1, 1,
-0.1643969, -0.05347182, -1.221094, 0, 0, 1, 1, 1,
-0.1641153, -1.605233, -2.45715, 1, 0, 0, 1, 1,
-0.1618754, -2.777564, -2.534981, 1, 0, 0, 1, 1,
-0.1580255, -0.4297364, -0.9655633, 1, 0, 0, 1, 1,
-0.1553692, -1.117961, -4.730365, 1, 0, 0, 1, 1,
-0.1550277, 0.1982129, -0.6997359, 1, 0, 0, 1, 1,
-0.1501837, 1.736911, 0.3025726, 0, 0, 0, 1, 1,
-0.1450261, -0.9358299, -3.170672, 0, 0, 0, 1, 1,
-0.1407315, 1.038227, 0.1779547, 0, 0, 0, 1, 1,
-0.1405441, -0.538466, -3.257051, 0, 0, 0, 1, 1,
-0.1321783, -0.6643248, -2.458138, 0, 0, 0, 1, 1,
-0.1260959, 1.054291, -0.407374, 0, 0, 0, 1, 1,
-0.1243967, -1.162974, -3.579386, 0, 0, 0, 1, 1,
-0.1222274, 1.229124, 0.4966555, 1, 1, 1, 1, 1,
-0.1203841, -0.7360771, -1.969585, 1, 1, 1, 1, 1,
-0.1202265, 0.1888305, -0.1254012, 1, 1, 1, 1, 1,
-0.1193834, -1.410265, -1.921047, 1, 1, 1, 1, 1,
-0.1187905, 0.3099537, -0.6597235, 1, 1, 1, 1, 1,
-0.1183628, -1.605847, -4.247103, 1, 1, 1, 1, 1,
-0.1151011, 0.3945525, -0.3638898, 1, 1, 1, 1, 1,
-0.1146768, -1.113746, -3.809234, 1, 1, 1, 1, 1,
-0.1136264, -0.05872414, -2.19712, 1, 1, 1, 1, 1,
-0.107124, -1.490869, -3.11111, 1, 1, 1, 1, 1,
-0.1041746, 0.2707234, 1.455233, 1, 1, 1, 1, 1,
-0.1035618, -0.6024773, -1.7447, 1, 1, 1, 1, 1,
-0.1002274, 0.5704942, 0.1652259, 1, 1, 1, 1, 1,
-0.09590169, -1.261833, -3.508173, 1, 1, 1, 1, 1,
-0.09537818, 0.1566176, -0.8096494, 1, 1, 1, 1, 1,
-0.08972205, -0.351534, -2.833598, 0, 0, 1, 1, 1,
-0.08446554, -1.178966, -2.675673, 1, 0, 0, 1, 1,
-0.08245356, 1.39494, 0.3892821, 1, 0, 0, 1, 1,
-0.08200307, -1.258477, -4.120032, 1, 0, 0, 1, 1,
-0.07827191, 0.5369151, -1.23185, 1, 0, 0, 1, 1,
-0.0778015, 0.664539, -1.408071, 1, 0, 0, 1, 1,
-0.07716157, 1.163158, -0.08780667, 0, 0, 0, 1, 1,
-0.07702582, -0.2926028, -2.74453, 0, 0, 0, 1, 1,
-0.0753749, 1.466533, 0.1542967, 0, 0, 0, 1, 1,
-0.0753485, -2.249014, -4.262542, 0, 0, 0, 1, 1,
-0.0746309, 0.9860094, 0.5313887, 0, 0, 0, 1, 1,
-0.0724031, 0.4642931, -1.364295, 0, 0, 0, 1, 1,
-0.0723513, 0.4319289, -1.357909, 0, 0, 0, 1, 1,
-0.07188081, -1.856081, -5.459251, 1, 1, 1, 1, 1,
-0.0689107, -0.8990532, -2.070543, 1, 1, 1, 1, 1,
-0.0688433, 1.270174, -0.2821233, 1, 1, 1, 1, 1,
-0.06861913, -0.06655406, -2.17233, 1, 1, 1, 1, 1,
-0.05979708, 1.431314, -0.0515046, 1, 1, 1, 1, 1,
-0.05873303, -0.1214492, -4.240057, 1, 1, 1, 1, 1,
-0.0580703, -0.7255485, -3.493803, 1, 1, 1, 1, 1,
-0.05718474, -0.3286645, -3.245962, 1, 1, 1, 1, 1,
-0.05556381, 0.5245587, 0.3844226, 1, 1, 1, 1, 1,
-0.05545242, -0.08715983, -2.426014, 1, 1, 1, 1, 1,
-0.05437822, 0.2061056, -0.09606995, 1, 1, 1, 1, 1,
-0.05395281, 1.256886, -0.747182, 1, 1, 1, 1, 1,
-0.05180093, 0.6297607, 0.7719898, 1, 1, 1, 1, 1,
-0.0507116, -0.9331837, -2.924393, 1, 1, 1, 1, 1,
-0.04353126, 1.178746, -0.2737405, 1, 1, 1, 1, 1,
-0.04194149, -0.9793018, -3.573434, 0, 0, 1, 1, 1,
-0.03855169, -0.9432403, -3.20851, 1, 0, 0, 1, 1,
-0.03778544, 0.5108525, 1.229795, 1, 0, 0, 1, 1,
-0.03366496, -0.4184138, -3.971967, 1, 0, 0, 1, 1,
-0.02874808, -0.2840351, -3.212857, 1, 0, 0, 1, 1,
-0.01963972, -1.224548, -1.795902, 1, 0, 0, 1, 1,
-0.01930643, -0.6412386, -4.327046, 0, 0, 0, 1, 1,
-0.0172649, -0.4371943, -3.176218, 0, 0, 0, 1, 1,
-0.01698793, 1.674483, -0.4557622, 0, 0, 0, 1, 1,
-0.01299056, 0.1636126, -0.1531515, 0, 0, 0, 1, 1,
-0.01230248, 0.6173601, -1.550074, 0, 0, 0, 1, 1,
-0.01149379, 0.3648449, 1.640671, 0, 0, 0, 1, 1,
-0.01033933, -1.304759, -2.707193, 0, 0, 0, 1, 1,
-0.009745272, -0.7151117, -2.078618, 1, 1, 1, 1, 1,
-0.005712508, 1.289824, -0.2389656, 1, 1, 1, 1, 1,
-0.005519108, -0.180955, -2.586721, 1, 1, 1, 1, 1,
0.003898307, -1.663567, 3.244031, 1, 1, 1, 1, 1,
0.005167118, 0.4870855, -1.088866, 1, 1, 1, 1, 1,
0.006684985, -0.6143916, 2.921566, 1, 1, 1, 1, 1,
0.009884327, -0.1800984, 2.001522, 1, 1, 1, 1, 1,
0.0118632, 0.138786, -0.6046576, 1, 1, 1, 1, 1,
0.01263566, -2.634764, 4.796783, 1, 1, 1, 1, 1,
0.01546003, 0.2503998, 0.1809052, 1, 1, 1, 1, 1,
0.01554695, 1.068766, -0.1422515, 1, 1, 1, 1, 1,
0.01766163, -0.4916743, 3.364769, 1, 1, 1, 1, 1,
0.02009996, 0.8659715, 0.5495232, 1, 1, 1, 1, 1,
0.02079725, -1.671253, 3.424749, 1, 1, 1, 1, 1,
0.02268955, -0.217637, 3.112402, 1, 1, 1, 1, 1,
0.02315334, 0.2963558, 0.2661603, 0, 0, 1, 1, 1,
0.02334346, 0.1284881, 0.4771403, 1, 0, 0, 1, 1,
0.02376216, -0.1238011, 3.933886, 1, 0, 0, 1, 1,
0.02405663, -0.3040397, 2.489159, 1, 0, 0, 1, 1,
0.02483788, -1.046526, 2.780203, 1, 0, 0, 1, 1,
0.03400342, -0.9249947, 3.349404, 1, 0, 0, 1, 1,
0.03505048, -0.008719746, 3.695211, 0, 0, 0, 1, 1,
0.03709205, 1.121752, 0.8170839, 0, 0, 0, 1, 1,
0.0374075, 0.03785184, 1.227508, 0, 0, 0, 1, 1,
0.03742683, 0.175312, 0.190011, 0, 0, 0, 1, 1,
0.03860901, 0.8378371, -1.386188, 0, 0, 0, 1, 1,
0.0395617, -0.1600427, 2.955233, 0, 0, 0, 1, 1,
0.04283051, 0.9505861, -1.642332, 0, 0, 0, 1, 1,
0.04344457, 0.04385459, 1.337948, 1, 1, 1, 1, 1,
0.04608394, 0.07665347, 0.5780528, 1, 1, 1, 1, 1,
0.04812666, 0.9967743, 0.9075861, 1, 1, 1, 1, 1,
0.04968742, -1.690623, 2.354908, 1, 1, 1, 1, 1,
0.05376459, -0.4282638, 2.179916, 1, 1, 1, 1, 1,
0.05482167, -0.8927926, 1.467627, 1, 1, 1, 1, 1,
0.05600671, 1.927998, -0.1942084, 1, 1, 1, 1, 1,
0.05699332, -1.301134, 2.848375, 1, 1, 1, 1, 1,
0.059204, 0.3086839, 0.5472034, 1, 1, 1, 1, 1,
0.06584504, 0.8719168, 0.09159068, 1, 1, 1, 1, 1,
0.06672263, 0.8736879, 0.5639963, 1, 1, 1, 1, 1,
0.08729447, -0.6359093, 3.68934, 1, 1, 1, 1, 1,
0.08814794, 1.20082, -0.4599563, 1, 1, 1, 1, 1,
0.09475492, -2.254092, 4.44714, 1, 1, 1, 1, 1,
0.09556904, -0.550817, 2.616527, 1, 1, 1, 1, 1,
0.09723174, 1.141785, 0.8561213, 0, 0, 1, 1, 1,
0.09822237, 0.2270052, 0.5042363, 1, 0, 0, 1, 1,
0.09913049, -0.7416334, 4.824003, 1, 0, 0, 1, 1,
0.1003315, -0.9140908, 4.207818, 1, 0, 0, 1, 1,
0.1046581, 2.318276, 1.040913, 1, 0, 0, 1, 1,
0.1070286, 0.3588562, 0.105189, 1, 0, 0, 1, 1,
0.1072177, 1.900599, -0.1222074, 0, 0, 0, 1, 1,
0.1103002, -0.4170913, 3.180378, 0, 0, 0, 1, 1,
0.1113037, 0.3711996, 0.9565287, 0, 0, 0, 1, 1,
0.1129295, -0.8733089, 2.229848, 0, 0, 0, 1, 1,
0.1144303, -2.263428, 3.124611, 0, 0, 0, 1, 1,
0.1180234, 0.1040331, 0.9032215, 0, 0, 0, 1, 1,
0.1198021, -0.7453513, 2.473259, 0, 0, 0, 1, 1,
0.1219141, -0.04610053, 2.521628, 1, 1, 1, 1, 1,
0.1239004, -1.562899, 1.46864, 1, 1, 1, 1, 1,
0.1251174, 1.572124, 0.5083538, 1, 1, 1, 1, 1,
0.1261604, 0.6563835, -0.4582947, 1, 1, 1, 1, 1,
0.131262, -1.296934, 0.7062002, 1, 1, 1, 1, 1,
0.1375405, -0.1346162, 3.183333, 1, 1, 1, 1, 1,
0.1409021, 0.0754567, -0.8552163, 1, 1, 1, 1, 1,
0.1421291, -1.694563, 3.140354, 1, 1, 1, 1, 1,
0.1508199, 0.2075746, 1.507929, 1, 1, 1, 1, 1,
0.1510672, -0.1162412, 1.30555, 1, 1, 1, 1, 1,
0.1556472, -0.4389582, 2.760865, 1, 1, 1, 1, 1,
0.1572378, -0.2882405, 2.04227, 1, 1, 1, 1, 1,
0.1589134, 1.135782, -1.268776, 1, 1, 1, 1, 1,
0.1593713, 2.720283, 0.5661865, 1, 1, 1, 1, 1,
0.1596389, 0.7612156, 1.533427, 1, 1, 1, 1, 1,
0.1597296, 0.3368469, 0.05656812, 0, 0, 1, 1, 1,
0.1603681, -0.8957574, 1.983761, 1, 0, 0, 1, 1,
0.16095, 0.1478083, 0.5601173, 1, 0, 0, 1, 1,
0.1661886, 1.266322, 0.5580142, 1, 0, 0, 1, 1,
0.1683486, 1.458329, 0.2000087, 1, 0, 0, 1, 1,
0.1683911, -0.9169407, 4.000912, 1, 0, 0, 1, 1,
0.1777947, -0.2176932, 2.69704, 0, 0, 0, 1, 1,
0.1785856, -0.6109287, 3.419932, 0, 0, 0, 1, 1,
0.1806708, -0.4985657, 3.13792, 0, 0, 0, 1, 1,
0.1809118, -0.2525336, 1.916174, 0, 0, 0, 1, 1,
0.1851078, 0.5499094, -0.6747882, 0, 0, 0, 1, 1,
0.1888464, -0.2993523, 0.5378323, 0, 0, 0, 1, 1,
0.192437, 1.290528, 0.4142124, 0, 0, 0, 1, 1,
0.1968684, 1.29579, -0.8375577, 1, 1, 1, 1, 1,
0.1971609, -0.768432, 1.893237, 1, 1, 1, 1, 1,
0.2006415, 1.041665, 0.2444149, 1, 1, 1, 1, 1,
0.2101259, 0.08087858, -1.271703, 1, 1, 1, 1, 1,
0.2128677, -0.517459, 2.979981, 1, 1, 1, 1, 1,
0.2145468, -0.7135963, 2.698102, 1, 1, 1, 1, 1,
0.219435, -0.8854864, 3.480787, 1, 1, 1, 1, 1,
0.220291, -0.4827933, 1.27365, 1, 1, 1, 1, 1,
0.2205723, -0.2267798, 3.607725, 1, 1, 1, 1, 1,
0.2259165, 0.6870432, 1.235403, 1, 1, 1, 1, 1,
0.2261026, -2.64772, 2.700646, 1, 1, 1, 1, 1,
0.2262314, -0.6599583, 2.130407, 1, 1, 1, 1, 1,
0.2269877, 1.153997, 0.1256229, 1, 1, 1, 1, 1,
0.2293189, -0.04785261, 1.359356, 1, 1, 1, 1, 1,
0.2354232, 0.2560821, 0.9166104, 1, 1, 1, 1, 1,
0.2355992, -1.157636, 3.850826, 0, 0, 1, 1, 1,
0.2358096, 2.268571, -0.1013401, 1, 0, 0, 1, 1,
0.2364568, 0.2845344, 1.612566, 1, 0, 0, 1, 1,
0.2365293, -0.6279513, 1.455706, 1, 0, 0, 1, 1,
0.2378002, -0.8792133, 4.648171, 1, 0, 0, 1, 1,
0.2398605, -0.2366906, 3.690749, 1, 0, 0, 1, 1,
0.242739, -1.165383, 2.989192, 0, 0, 0, 1, 1,
0.2473944, 1.196874, -1.040516, 0, 0, 0, 1, 1,
0.2491616, -0.09423027, 1.445545, 0, 0, 0, 1, 1,
0.2570061, -0.7178894, 2.52889, 0, 0, 0, 1, 1,
0.2581816, -2.114558, 4.447292, 0, 0, 0, 1, 1,
0.2592336, 0.4357173, 0.9267423, 0, 0, 0, 1, 1,
0.2606505, -1.021799, 2.004674, 0, 0, 0, 1, 1,
0.2617328, -0.7604331, 3.679429, 1, 1, 1, 1, 1,
0.2631438, 1.22269, 1.50201, 1, 1, 1, 1, 1,
0.2657113, -0.3045536, 3.814552, 1, 1, 1, 1, 1,
0.2661543, 0.5834082, 0.6951482, 1, 1, 1, 1, 1,
0.2681741, 0.1740462, 0.5524784, 1, 1, 1, 1, 1,
0.2688489, -0.2600051, 2.136436, 1, 1, 1, 1, 1,
0.2721278, 1.124164, 1.646154, 1, 1, 1, 1, 1,
0.2800995, 0.2490521, 1.48887, 1, 1, 1, 1, 1,
0.2819868, -0.6983358, 3.558812, 1, 1, 1, 1, 1,
0.2835389, -0.4323525, 4.152657, 1, 1, 1, 1, 1,
0.2862929, -0.2964655, 2.187945, 1, 1, 1, 1, 1,
0.2924867, 1.070122, -0.4955537, 1, 1, 1, 1, 1,
0.297605, -0.4901043, 2.116832, 1, 1, 1, 1, 1,
0.2993792, -1.244387, 0.7345592, 1, 1, 1, 1, 1,
0.2994947, 0.821429, 1.857737, 1, 1, 1, 1, 1,
0.3022242, -0.7598906, 2.017543, 0, 0, 1, 1, 1,
0.3059092, -0.4049972, 3.489142, 1, 0, 0, 1, 1,
0.3154614, 0.8902524, 0.7912142, 1, 0, 0, 1, 1,
0.3193157, 0.159502, 1.858935, 1, 0, 0, 1, 1,
0.3297814, 0.6334394, 1.943832, 1, 0, 0, 1, 1,
0.3308493, -2.280696, 2.941046, 1, 0, 0, 1, 1,
0.3312541, -0.6312259, 2.965413, 0, 0, 0, 1, 1,
0.3339185, 0.4160053, 1.164116, 0, 0, 0, 1, 1,
0.3357277, 0.6154199, 0.8326567, 0, 0, 0, 1, 1,
0.3380735, -0.1470524, 2.497296, 0, 0, 0, 1, 1,
0.3395419, -0.6252849, 5.12899, 0, 0, 0, 1, 1,
0.3407826, -0.9488507, 0.335912, 0, 0, 0, 1, 1,
0.3496039, 0.9361805, -1.197164, 0, 0, 0, 1, 1,
0.3533415, 0.6958163, -0.2440422, 1, 1, 1, 1, 1,
0.3574525, -1.46238, 3.622894, 1, 1, 1, 1, 1,
0.36344, 0.6906837, 0.4863077, 1, 1, 1, 1, 1,
0.3689657, 1.145175, 0.1534176, 1, 1, 1, 1, 1,
0.3728773, 1.127783, -1.056728, 1, 1, 1, 1, 1,
0.3764628, 0.3668469, 0.3971168, 1, 1, 1, 1, 1,
0.3825593, -0.613189, 1.190443, 1, 1, 1, 1, 1,
0.3833292, 0.3106973, 1.557523, 1, 1, 1, 1, 1,
0.3841944, -0.7752588, 2.337665, 1, 1, 1, 1, 1,
0.3854202, -0.700625, 2.565384, 1, 1, 1, 1, 1,
0.3883907, -0.165102, 1.439917, 1, 1, 1, 1, 1,
0.3948713, 0.3350056, -0.3613169, 1, 1, 1, 1, 1,
0.3974562, -0.4116219, 2.304569, 1, 1, 1, 1, 1,
0.3984566, 0.8344714, -1.806237, 1, 1, 1, 1, 1,
0.4020019, -0.8706371, 2.690797, 1, 1, 1, 1, 1,
0.402097, 0.05459694, 1.928848, 0, 0, 1, 1, 1,
0.4080175, -0.379003, 2.531661, 1, 0, 0, 1, 1,
0.4095032, -0.2914469, 1.833008, 1, 0, 0, 1, 1,
0.4206884, 1.038165, 1.040883, 1, 0, 0, 1, 1,
0.4212418, -0.01084195, 1.507376, 1, 0, 0, 1, 1,
0.4305796, 0.551039, -0.00367584, 1, 0, 0, 1, 1,
0.4310869, 0.4334458, 0.5475374, 0, 0, 0, 1, 1,
0.4313655, -1.366354, 2.821129, 0, 0, 0, 1, 1,
0.4357522, 0.4002762, 1.975841, 0, 0, 0, 1, 1,
0.4365651, 0.7924181, 1.022094, 0, 0, 0, 1, 1,
0.4381163, 1.260631, 0.3990357, 0, 0, 0, 1, 1,
0.4403519, -0.2718195, 4.024291, 0, 0, 0, 1, 1,
0.440506, 1.867955, 0.8349373, 0, 0, 0, 1, 1,
0.4406325, 0.8060191, 0.3578345, 1, 1, 1, 1, 1,
0.4413561, -0.5720843, 2.108825, 1, 1, 1, 1, 1,
0.443834, 0.306798, 1.484218, 1, 1, 1, 1, 1,
0.4553578, -0.6563004, 2.936285, 1, 1, 1, 1, 1,
0.4554377, 0.6473544, 0.31386, 1, 1, 1, 1, 1,
0.4561917, -0.1453664, 2.025529, 1, 1, 1, 1, 1,
0.4640645, 0.1609497, -0.3097365, 1, 1, 1, 1, 1,
0.4652157, 2.83767, -0.956921, 1, 1, 1, 1, 1,
0.4687002, 1.396696, -0.3827969, 1, 1, 1, 1, 1,
0.4702984, -1.423916, 2.708526, 1, 1, 1, 1, 1,
0.4711669, -0.623343, 3.231619, 1, 1, 1, 1, 1,
0.4720432, 0.5949919, 0.3813624, 1, 1, 1, 1, 1,
0.4731134, -1.977276, 4.06774, 1, 1, 1, 1, 1,
0.4771108, -0.3197309, 1.766023, 1, 1, 1, 1, 1,
0.478749, -1.084095, 2.091653, 1, 1, 1, 1, 1,
0.4817994, 0.4238495, -0.5535882, 0, 0, 1, 1, 1,
0.4819987, 0.7876623, 2.140502, 1, 0, 0, 1, 1,
0.4841928, 0.1245597, 3.745945, 1, 0, 0, 1, 1,
0.4846433, -1.216413, 1.20836, 1, 0, 0, 1, 1,
0.4861878, -1.710135, 1.52948, 1, 0, 0, 1, 1,
0.4899768, 1.006734, 1.178104, 1, 0, 0, 1, 1,
0.4911804, 0.4771277, 1.110617, 0, 0, 0, 1, 1,
0.4916129, 0.6501127, 1.17354, 0, 0, 0, 1, 1,
0.4987082, 0.6518456, 0.6243401, 0, 0, 0, 1, 1,
0.5048248, -0.1700646, 2.385154, 0, 0, 0, 1, 1,
0.5060396, 1.159475, 0.8730966, 0, 0, 0, 1, 1,
0.5073433, 1.120735, 0.8342636, 0, 0, 0, 1, 1,
0.5089929, 2.050589, 0.8789055, 0, 0, 0, 1, 1,
0.5109386, -0.01846252, 0.6567066, 1, 1, 1, 1, 1,
0.5132515, 0.183441, 1.471204, 1, 1, 1, 1, 1,
0.5155674, 0.7807395, -0.53102, 1, 1, 1, 1, 1,
0.5203798, -0.5244625, 1.505384, 1, 1, 1, 1, 1,
0.5230875, 1.719528, -0.8964757, 1, 1, 1, 1, 1,
0.5245876, 0.1422969, 1.257159, 1, 1, 1, 1, 1,
0.5252873, 0.8037421, 1.68142, 1, 1, 1, 1, 1,
0.5275381, 1.101992, 1.472054, 1, 1, 1, 1, 1,
0.5356741, -0.5250387, 3.328312, 1, 1, 1, 1, 1,
0.5405109, -0.7663378, 3.697221, 1, 1, 1, 1, 1,
0.5476167, -0.6756, 2.996485, 1, 1, 1, 1, 1,
0.5539102, 1.234033, 0.05568124, 1, 1, 1, 1, 1,
0.5622483, -0.4650781, 1.951803, 1, 1, 1, 1, 1,
0.5632363, 0.678439, -0.5762694, 1, 1, 1, 1, 1,
0.5653746, 0.766458, 0.7938551, 1, 1, 1, 1, 1,
0.5691239, 0.2637523, 0.5064948, 0, 0, 1, 1, 1,
0.5739547, -1.166711, 1.794479, 1, 0, 0, 1, 1,
0.5749912, 0.8008518, 1.254335, 1, 0, 0, 1, 1,
0.5785662, 0.5696334, 1.664047, 1, 0, 0, 1, 1,
0.581175, 0.1985241, 1.02721, 1, 0, 0, 1, 1,
0.5872639, -0.9037308, 1.706315, 1, 0, 0, 1, 1,
0.5891939, -1.355992, 1.346592, 0, 0, 0, 1, 1,
0.5896743, -0.9357445, 1.994186, 0, 0, 0, 1, 1,
0.5963911, 0.6295491, -0.968729, 0, 0, 0, 1, 1,
0.6010113, -0.1436806, 3.744758, 0, 0, 0, 1, 1,
0.6017377, -1.20652, 2.595062, 0, 0, 0, 1, 1,
0.6059901, -0.9514796, 1.301669, 0, 0, 0, 1, 1,
0.6087766, 1.346437, 0.0317427, 0, 0, 0, 1, 1,
0.6109385, -1.179474, 4.542545, 1, 1, 1, 1, 1,
0.6200995, 0.4663242, 0.7139283, 1, 1, 1, 1, 1,
0.6207068, -1.472671, 3.084084, 1, 1, 1, 1, 1,
0.6208482, -1.616112, 1.939067, 1, 1, 1, 1, 1,
0.6250648, -1.014758, 1.880657, 1, 1, 1, 1, 1,
0.6254079, 2.015335, 1.481892, 1, 1, 1, 1, 1,
0.6291381, -0.4731131, 1.624113, 1, 1, 1, 1, 1,
0.6296546, 0.4322788, 0.7545556, 1, 1, 1, 1, 1,
0.6315764, -0.1289969, 0.2648895, 1, 1, 1, 1, 1,
0.632889, -1.082298, -0.2066624, 1, 1, 1, 1, 1,
0.6340011, -1.073807, 1.986106, 1, 1, 1, 1, 1,
0.6347725, 1.352491, -0.8712301, 1, 1, 1, 1, 1,
0.6371809, -0.008011024, 1.343106, 1, 1, 1, 1, 1,
0.6391882, -0.7818499, 1.180014, 1, 1, 1, 1, 1,
0.6421226, 0.5425409, 0.632514, 1, 1, 1, 1, 1,
0.6441164, 0.7810663, 0.0453081, 0, 0, 1, 1, 1,
0.6507937, 1.658244, 0.626655, 1, 0, 0, 1, 1,
0.6508531, -0.8826677, 2.35692, 1, 0, 0, 1, 1,
0.658617, -0.8477966, 2.10852, 1, 0, 0, 1, 1,
0.664947, 1.64668, 1.276363, 1, 0, 0, 1, 1,
0.6677601, 0.1440089, 1.620112, 1, 0, 0, 1, 1,
0.6707395, -1.856664, 1.307449, 0, 0, 0, 1, 1,
0.6810182, 0.1285206, 1.761267, 0, 0, 0, 1, 1,
0.6811066, -0.3638428, 1.158552, 0, 0, 0, 1, 1,
0.6893884, -1.105575, 2.293458, 0, 0, 0, 1, 1,
0.6925507, -0.2173876, 0.7472928, 0, 0, 0, 1, 1,
0.693046, -0.2311357, 2.392033, 0, 0, 0, 1, 1,
0.6944689, 0.5069543, -0.4977178, 0, 0, 0, 1, 1,
0.6979672, 1.030265, 1.543742, 1, 1, 1, 1, 1,
0.6981039, 0.3880048, 1.312359, 1, 1, 1, 1, 1,
0.6982775, -0.7089573, 2.248449, 1, 1, 1, 1, 1,
0.7040074, -0.609359, 1.781589, 1, 1, 1, 1, 1,
0.7086555, -0.3923276, 1.479344, 1, 1, 1, 1, 1,
0.7095703, 0.5143913, 1.068749, 1, 1, 1, 1, 1,
0.7101853, -0.5617718, 2.042138, 1, 1, 1, 1, 1,
0.7120467, -1.820017, 1.22717, 1, 1, 1, 1, 1,
0.7125534, 1.60801, -0.1470477, 1, 1, 1, 1, 1,
0.7163981, 0.1465899, 0.5851721, 1, 1, 1, 1, 1,
0.7176955, 1.623736, 1.156747, 1, 1, 1, 1, 1,
0.7185752, 1.215967, 0.09875758, 1, 1, 1, 1, 1,
0.7224066, -0.660122, 3.628509, 1, 1, 1, 1, 1,
0.7247043, -0.188637, 3.887506, 1, 1, 1, 1, 1,
0.7320015, 0.9111874, 1.200756, 1, 1, 1, 1, 1,
0.7328197, -0.9222537, 1.865779, 0, 0, 1, 1, 1,
0.7352362, 0.3800524, -0.2537847, 1, 0, 0, 1, 1,
0.7355087, -1.045889, 2.897436, 1, 0, 0, 1, 1,
0.736223, -1.888228, 1.499713, 1, 0, 0, 1, 1,
0.7369265, -0.8355712, 1.898305, 1, 0, 0, 1, 1,
0.7438652, 1.418683, 2.064488, 1, 0, 0, 1, 1,
0.7448338, 0.6849405, 1.150705, 0, 0, 0, 1, 1,
0.7472994, -0.8132386, 3.561481, 0, 0, 0, 1, 1,
0.7495317, -0.1405271, 1.794855, 0, 0, 0, 1, 1,
0.7504795, 1.366148, -0.2138338, 0, 0, 0, 1, 1,
0.7626425, -1.166588, 2.845994, 0, 0, 0, 1, 1,
0.7629892, 0.3120174, 0.9774987, 0, 0, 0, 1, 1,
0.7737914, 0.3306044, 2.935491, 0, 0, 0, 1, 1,
0.7754469, -1.793865, 2.151863, 1, 1, 1, 1, 1,
0.7864192, -1.153955, 3.187388, 1, 1, 1, 1, 1,
0.7903955, -1.236103, 1.447044, 1, 1, 1, 1, 1,
0.7938635, 0.65306, 1.690627, 1, 1, 1, 1, 1,
0.7980323, -0.651045, 1.501146, 1, 1, 1, 1, 1,
0.8006425, 0.001255989, 2.808482, 1, 1, 1, 1, 1,
0.8074485, -1.939956, 2.33445, 1, 1, 1, 1, 1,
0.8106143, 0.3015869, -0.7999478, 1, 1, 1, 1, 1,
0.8111892, -0.2475161, 1.157828, 1, 1, 1, 1, 1,
0.8122461, -0.9362037, 3.972128, 1, 1, 1, 1, 1,
0.8139975, 0.7077199, 2.160439, 1, 1, 1, 1, 1,
0.8160477, -0.932484, 2.271211, 1, 1, 1, 1, 1,
0.8194795, 1.232523, 0.5345063, 1, 1, 1, 1, 1,
0.8232007, -0.821959, 3.878808, 1, 1, 1, 1, 1,
0.824343, 1.350572, 0.513184, 1, 1, 1, 1, 1,
0.834923, -0.206799, -0.9923865, 0, 0, 1, 1, 1,
0.8431666, 0.7859278, 1.639826, 1, 0, 0, 1, 1,
0.8545614, -0.4791515, 2.38795, 1, 0, 0, 1, 1,
0.856537, -0.9799644, 2.776378, 1, 0, 0, 1, 1,
0.8643512, -0.7854843, 2.776424, 1, 0, 0, 1, 1,
0.8687741, -0.5734993, 1.702599, 1, 0, 0, 1, 1,
0.870541, 0.8704048, 0.3060001, 0, 0, 0, 1, 1,
0.8793775, -0.1266814, 1.92968, 0, 0, 0, 1, 1,
0.8815477, -0.3195455, 2.382646, 0, 0, 0, 1, 1,
0.8894957, -1.276238, 2.085688, 0, 0, 0, 1, 1,
0.8914117, 0.5263292, 1.08081, 0, 0, 0, 1, 1,
0.8971257, 1.400297, -0.4356565, 0, 0, 0, 1, 1,
0.9008561, 1.304544, 1.123687, 0, 0, 0, 1, 1,
0.9023868, 0.6881324, -1.658706, 1, 1, 1, 1, 1,
0.903274, 0.9075208, 0.5479095, 1, 1, 1, 1, 1,
0.9104741, 0.9910682, 0.5010962, 1, 1, 1, 1, 1,
0.9113867, 0.2588633, 1.953677, 1, 1, 1, 1, 1,
0.9126866, -0.2644873, 2.094734, 1, 1, 1, 1, 1,
0.9175267, -0.75092, 2.341068, 1, 1, 1, 1, 1,
0.9175353, 0.1623962, 0.480981, 1, 1, 1, 1, 1,
0.9184703, 0.55249, 2.111304, 1, 1, 1, 1, 1,
0.922444, -0.2851985, 0.09784594, 1, 1, 1, 1, 1,
0.9256015, -0.4681805, 2.210874, 1, 1, 1, 1, 1,
0.9306161, -0.5925901, 2.160717, 1, 1, 1, 1, 1,
0.9366676, 0.1217229, 2.004695, 1, 1, 1, 1, 1,
0.9428138, 0.4811464, 1.135249, 1, 1, 1, 1, 1,
0.944187, 0.4932894, 2.286501, 1, 1, 1, 1, 1,
0.9549444, 1.186553, 0.6649584, 1, 1, 1, 1, 1,
0.9620728, -1.003469, 1.85087, 0, 0, 1, 1, 1,
0.9698064, -0.5941343, 1.530193, 1, 0, 0, 1, 1,
0.9754184, 0.543454, 1.334747, 1, 0, 0, 1, 1,
0.9761957, -0.1473573, 0.7838016, 1, 0, 0, 1, 1,
0.9762119, 0.1232628, -0.2004904, 1, 0, 0, 1, 1,
0.9850599, 0.2338263, 1.568023, 1, 0, 0, 1, 1,
0.9926053, 0.1395413, -0.3362635, 0, 0, 0, 1, 1,
0.9935261, 1.104736, 1.016313, 0, 0, 0, 1, 1,
0.993665, 2.047733, 0.6788857, 0, 0, 0, 1, 1,
0.9948805, 0.4118588, 1.45989, 0, 0, 0, 1, 1,
1.005548, 0.4342752, 1.530704, 0, 0, 0, 1, 1,
1.021393, 0.004534067, -0.4074593, 0, 0, 0, 1, 1,
1.023402, 1.467767, -0.5478793, 0, 0, 0, 1, 1,
1.033455, 0.6798541, 2.585726, 1, 1, 1, 1, 1,
1.037985, 0.05788067, 1.162842, 1, 1, 1, 1, 1,
1.047621, -0.636418, 3.107085, 1, 1, 1, 1, 1,
1.052166, 0.01540274, 1.100507, 1, 1, 1, 1, 1,
1.054106, 0.9339206, 0.9721417, 1, 1, 1, 1, 1,
1.058823, -0.6657172, 0.6222513, 1, 1, 1, 1, 1,
1.06277, 1.200398, -0.05446618, 1, 1, 1, 1, 1,
1.063447, -0.6556137, 2.050845, 1, 1, 1, 1, 1,
1.063967, 0.4120263, 0.8094599, 1, 1, 1, 1, 1,
1.065993, -1.126622, 2.259591, 1, 1, 1, 1, 1,
1.066244, -1.349336, 2.563526, 1, 1, 1, 1, 1,
1.072833, 0.176447, 2.273073, 1, 1, 1, 1, 1,
1.07444, -0.08890302, 2.583219, 1, 1, 1, 1, 1,
1.083767, 1.07657, 3.036214, 1, 1, 1, 1, 1,
1.084427, -1.540649, 1.70277, 1, 1, 1, 1, 1,
1.089049, 0.7062775, 0.3607791, 0, 0, 1, 1, 1,
1.09432, -0.6720616, 3.935358, 1, 0, 0, 1, 1,
1.095418, -1.529632, 1.969785, 1, 0, 0, 1, 1,
1.106702, -1.684487, 4.901971, 1, 0, 0, 1, 1,
1.108449, -1.015626, 2.522389, 1, 0, 0, 1, 1,
1.111494, 0.831027, 0.2743884, 1, 0, 0, 1, 1,
1.115604, -0.8863995, 2.358428, 0, 0, 0, 1, 1,
1.116096, -1.086218, 2.593523, 0, 0, 0, 1, 1,
1.125299, 1.473203, 1.047662, 0, 0, 0, 1, 1,
1.127632, -0.9755938, 2.105197, 0, 0, 0, 1, 1,
1.151075, 2.155958, -0.7042142, 0, 0, 0, 1, 1,
1.153893, 0.7264867, 1.856218, 0, 0, 0, 1, 1,
1.164827, 1.525928, 0.1000955, 0, 0, 0, 1, 1,
1.168907, -0.4092663, 3.684407, 1, 1, 1, 1, 1,
1.173555, 1.86304, 0.9721968, 1, 1, 1, 1, 1,
1.174861, -1.814655, 0.5351222, 1, 1, 1, 1, 1,
1.187755, 1.612394, 1.90546, 1, 1, 1, 1, 1,
1.191454, 0.3373311, -0.3234397, 1, 1, 1, 1, 1,
1.194826, 0.5664118, 1.087349, 1, 1, 1, 1, 1,
1.201416, 2.047359, 1.12876, 1, 1, 1, 1, 1,
1.201747, -0.3506778, 0.1035119, 1, 1, 1, 1, 1,
1.201899, 0.2271393, 1.956447, 1, 1, 1, 1, 1,
1.203654, -2.735319, 1.83775, 1, 1, 1, 1, 1,
1.204003, -0.6126648, 2.560986, 1, 1, 1, 1, 1,
1.206827, -0.5505478, 2.377846, 1, 1, 1, 1, 1,
1.207616, -0.7851183, 1.036391, 1, 1, 1, 1, 1,
1.211228, 0.4693056, 2.267649, 1, 1, 1, 1, 1,
1.213439, 1.335765, 0.7853083, 1, 1, 1, 1, 1,
1.215133, 1.076495, 0.1555913, 0, 0, 1, 1, 1,
1.220936, -0.4062931, 3.531239, 1, 0, 0, 1, 1,
1.224085, 1.621384, 0.7817486, 1, 0, 0, 1, 1,
1.23296, -1.768061, 3.567774, 1, 0, 0, 1, 1,
1.249403, 0.917492, 0.8580133, 1, 0, 0, 1, 1,
1.250946, 0.8253402, 0.9313619, 1, 0, 0, 1, 1,
1.256023, -0.008562444, 0.4939815, 0, 0, 0, 1, 1,
1.256996, 0.04582121, 1.921103, 0, 0, 0, 1, 1,
1.260681, 2.378433, 2.557386, 0, 0, 0, 1, 1,
1.263672, -0.3046741, 2.744833, 0, 0, 0, 1, 1,
1.270108, 1.302077, 0.4762507, 0, 0, 0, 1, 1,
1.278197, -0.9806942, 1.990088, 0, 0, 0, 1, 1,
1.282964, 0.9413258, 0.7121122, 0, 0, 0, 1, 1,
1.295906, -1.918028, 3.750767, 1, 1, 1, 1, 1,
1.297197, 0.3982819, 0.6362426, 1, 1, 1, 1, 1,
1.302989, 0.4542549, 0.5670713, 1, 1, 1, 1, 1,
1.318718, -0.6457359, 2.905221, 1, 1, 1, 1, 1,
1.320441, -0.8727001, 1.850471, 1, 1, 1, 1, 1,
1.321658, -0.9950666, 2.836778, 1, 1, 1, 1, 1,
1.323052, 0.3743966, 1.14939, 1, 1, 1, 1, 1,
1.333746, 2.706866, 1.361669, 1, 1, 1, 1, 1,
1.342152, -0.6029981, 3.289935, 1, 1, 1, 1, 1,
1.345277, 0.4780253, 1.364858, 1, 1, 1, 1, 1,
1.347875, 0.4254487, 2.250416, 1, 1, 1, 1, 1,
1.36072, 0.1880223, 0.9395929, 1, 1, 1, 1, 1,
1.366402, 0.5436465, -0.1335616, 1, 1, 1, 1, 1,
1.369798, 1.036705, 0.1973532, 1, 1, 1, 1, 1,
1.374043, 0.9469798, -0.7914702, 1, 1, 1, 1, 1,
1.383226, 1.738545, -0.7672868, 0, 0, 1, 1, 1,
1.401141, 0.3681757, 2.072049, 1, 0, 0, 1, 1,
1.402544, 0.5939271, 1.475927, 1, 0, 0, 1, 1,
1.405864, -1.743404, -0.04445374, 1, 0, 0, 1, 1,
1.408988, 0.5796857, 2.865302, 1, 0, 0, 1, 1,
1.410159, -0.8163192, 2.985414, 1, 0, 0, 1, 1,
1.412782, 0.7794094, 1.804889, 0, 0, 0, 1, 1,
1.42373, 1.213037, 0.2564297, 0, 0, 0, 1, 1,
1.426283, -1.968153, 4.287941, 0, 0, 0, 1, 1,
1.443091, -0.2916667, 2.729676, 0, 0, 0, 1, 1,
1.482737, 1.201144, 0.6389385, 0, 0, 0, 1, 1,
1.486006, 0.6346279, 1.763134, 0, 0, 0, 1, 1,
1.494339, -1.667158, 2.092366, 0, 0, 0, 1, 1,
1.497711, 0.3837298, 2.293325, 1, 1, 1, 1, 1,
1.499412, 0.1739849, 2.452699, 1, 1, 1, 1, 1,
1.511641, 1.160017, 1.209444, 1, 1, 1, 1, 1,
1.520312, -1.31998, 1.607964, 1, 1, 1, 1, 1,
1.526654, -0.1162467, 2.706251, 1, 1, 1, 1, 1,
1.550653, -2.221895, 2.527984, 1, 1, 1, 1, 1,
1.560595, -2.030723, 2.614391, 1, 1, 1, 1, 1,
1.562659, 1.464511, 2.840497, 1, 1, 1, 1, 1,
1.566698, -1.372104, 2.859242, 1, 1, 1, 1, 1,
1.614314, -0.6889172, 2.246782, 1, 1, 1, 1, 1,
1.617214, -1.483904, 2.0095, 1, 1, 1, 1, 1,
1.61977, -0.3531773, 0.462949, 1, 1, 1, 1, 1,
1.633011, -0.0633199, 1.316739, 1, 1, 1, 1, 1,
1.640384, 0.6947616, 1.047434, 1, 1, 1, 1, 1,
1.64925, -0.07389247, 2.555526, 1, 1, 1, 1, 1,
1.659352, -0.05796899, 1.950667, 0, 0, 1, 1, 1,
1.670435, 2.575855, 1.488701, 1, 0, 0, 1, 1,
1.67774, -0.2545626, 2.632967, 1, 0, 0, 1, 1,
1.680161, 1.602799, 0.3315311, 1, 0, 0, 1, 1,
1.682762, -2.555346, 1.219573, 1, 0, 0, 1, 1,
1.68618, 0.9724019, 1.445533, 1, 0, 0, 1, 1,
1.690571, -0.1780025, 1.381346, 0, 0, 0, 1, 1,
1.713053, -0.5338807, 3.164544, 0, 0, 0, 1, 1,
1.714353, 0.2760668, 1.456563, 0, 0, 0, 1, 1,
1.726869, -1.012768, 3.02404, 0, 0, 0, 1, 1,
1.734913, 1.642453, 0.03028389, 0, 0, 0, 1, 1,
1.765932, 1.207629, 0.9294608, 0, 0, 0, 1, 1,
1.782842, -1.022835, 1.66925, 0, 0, 0, 1, 1,
1.788552, -0.2206267, 2.599653, 1, 1, 1, 1, 1,
1.808971, -0.41289, 2.249526, 1, 1, 1, 1, 1,
1.813358, -0.497601, 2.49234, 1, 1, 1, 1, 1,
1.815679, -0.04581457, -0.0778068, 1, 1, 1, 1, 1,
1.821177, -0.2203399, -0.6808591, 1, 1, 1, 1, 1,
1.821669, -0.8178289, 2.305818, 1, 1, 1, 1, 1,
1.830873, -0.40823, 1.232014, 1, 1, 1, 1, 1,
1.840343, 0.2462711, 1.790789, 1, 1, 1, 1, 1,
1.876301, -1.752107, 1.985983, 1, 1, 1, 1, 1,
1.898625, 1.465873, -0.4408112, 1, 1, 1, 1, 1,
1.926065, 0.8355948, 2.100654, 1, 1, 1, 1, 1,
1.95566, 0.07577485, -1.0713, 1, 1, 1, 1, 1,
1.960562, 0.4857175, 0.788808, 1, 1, 1, 1, 1,
1.970742, -0.5831369, 0.8769458, 1, 1, 1, 1, 1,
2.02291, 0.7404357, 0.8466292, 1, 1, 1, 1, 1,
2.074049, -0.2206446, 1.463816, 0, 0, 1, 1, 1,
2.081042, -1.531883, 2.32012, 1, 0, 0, 1, 1,
2.092321, -0.52368, 1.535188, 1, 0, 0, 1, 1,
2.109411, 2.147408, 0.01125801, 1, 0, 0, 1, 1,
2.12192, -0.7497935, 1.327044, 1, 0, 0, 1, 1,
2.16917, -0.4717172, 3.354835, 1, 0, 0, 1, 1,
2.188127, 0.4440416, 0.7166274, 0, 0, 0, 1, 1,
2.197752, 0.8381826, 2.592729, 0, 0, 0, 1, 1,
2.238178, -0.4291079, 3.051987, 0, 0, 0, 1, 1,
2.27636, 1.472253, 1.101864, 0, 0, 0, 1, 1,
2.375494, -0.1948903, 1.244183, 0, 0, 0, 1, 1,
2.430233, -0.4796737, 2.774378, 0, 0, 0, 1, 1,
2.527686, 0.2154213, 0.9707851, 0, 0, 0, 1, 1,
2.590707, -0.2271551, 1.363833, 1, 1, 1, 1, 1,
2.648068, -0.7077495, 1.068396, 1, 1, 1, 1, 1,
2.758414, -2.140673, 0.8942833, 1, 1, 1, 1, 1,
2.843408, -0.5777759, 1.764967, 1, 1, 1, 1, 1,
2.953706, -0.08458635, 1.630904, 1, 1, 1, 1, 1,
3.006402, -0.08708685, 0.06951189, 1, 1, 1, 1, 1,
3.802196, 0.8324139, 2.372926, 1, 1, 1, 1, 1
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
var radius = 9.484308;
var distance = 33.31323;
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
mvMatrix.translate( -0.3047895, -0.0300529, 0.1651306 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.31323);
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
