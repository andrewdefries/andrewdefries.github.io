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
-3.057988, -0.7136725, 0.3512594, 1, 0, 0, 1,
-2.934634, -0.7595032, -1.065476, 1, 0.007843138, 0, 1,
-2.881206, -0.9009122, -2.640539, 1, 0.01176471, 0, 1,
-2.870688, -0.7863232, -1.114726, 1, 0.01960784, 0, 1,
-2.791267, -1.041298, -3.581506, 1, 0.02352941, 0, 1,
-2.733965, -1.600244, -1.87819, 1, 0.03137255, 0, 1,
-2.441557, -0.2688742, -3.396128, 1, 0.03529412, 0, 1,
-2.296504, 0.7068803, -2.803041, 1, 0.04313726, 0, 1,
-2.271346, 0.2958059, -2.272231, 1, 0.04705882, 0, 1,
-2.23988, -1.755239, -2.412037, 1, 0.05490196, 0, 1,
-2.222055, 0.1259677, -1.012958, 1, 0.05882353, 0, 1,
-2.221843, -0.3754992, 0.3674839, 1, 0.06666667, 0, 1,
-2.218951, -0.7956851, -2.025897, 1, 0.07058824, 0, 1,
-2.209501, -0.1518873, -3.506499, 1, 0.07843138, 0, 1,
-2.205475, 0.922847, -2.342268, 1, 0.08235294, 0, 1,
-2.190659, 0.7929885, -0.7610413, 1, 0.09019608, 0, 1,
-2.144203, 0.4291424, -1.448627, 1, 0.09411765, 0, 1,
-2.083008, 0.3891915, -2.642631, 1, 0.1019608, 0, 1,
-2.082176, -0.5777538, -2.309718, 1, 0.1098039, 0, 1,
-2.079545, 1.764055, -1.660677, 1, 0.1137255, 0, 1,
-2.07759, 2.114561, -1.040813, 1, 0.1215686, 0, 1,
-2.07666, 0.2596588, -4.106461, 1, 0.1254902, 0, 1,
-2.054803, -0.3977724, -1.782744, 1, 0.1333333, 0, 1,
-2.042983, 1.138271, 0.2049115, 1, 0.1372549, 0, 1,
-2.030998, 1.450032, -2.043405, 1, 0.145098, 0, 1,
-1.999492, -0.4893404, -2.696885, 1, 0.1490196, 0, 1,
-1.986757, 0.5853391, -0.07374582, 1, 0.1568628, 0, 1,
-1.982518, -1.136451, -1.121055, 1, 0.1607843, 0, 1,
-1.977479, 0.4409016, -0.2769975, 1, 0.1686275, 0, 1,
-1.97498, -1.592588, -1.611069, 1, 0.172549, 0, 1,
-1.93705, 0.5100932, -0.2140121, 1, 0.1803922, 0, 1,
-1.927341, -0.2789685, 0.3232725, 1, 0.1843137, 0, 1,
-1.922043, 0.4933111, -1.723175, 1, 0.1921569, 0, 1,
-1.891977, 1.209501, -2.568015, 1, 0.1960784, 0, 1,
-1.8859, 1.820373, -0.1026974, 1, 0.2039216, 0, 1,
-1.87692, 0.07979601, -0.4413142, 1, 0.2117647, 0, 1,
-1.867686, 0.5753716, -0.8098468, 1, 0.2156863, 0, 1,
-1.856165, -0.2246674, -0.1751948, 1, 0.2235294, 0, 1,
-1.853517, -1.516677, -2.333668, 1, 0.227451, 0, 1,
-1.853455, -0.8644109, -3.15006, 1, 0.2352941, 0, 1,
-1.849262, -0.5782449, -2.226215, 1, 0.2392157, 0, 1,
-1.847571, 0.08477512, -0.7580691, 1, 0.2470588, 0, 1,
-1.83255, -0.4600944, -1.900142, 1, 0.2509804, 0, 1,
-1.822018, -0.2957304, -0.9532162, 1, 0.2588235, 0, 1,
-1.799737, 2.241468, -2.15439, 1, 0.2627451, 0, 1,
-1.795892, 0.6021188, -2.096869, 1, 0.2705882, 0, 1,
-1.793582, 0.5640343, -2.005665, 1, 0.2745098, 0, 1,
-1.789296, 0.6062059, -1.395919, 1, 0.282353, 0, 1,
-1.768166, 0.3647093, -0.7236076, 1, 0.2862745, 0, 1,
-1.760961, 0.6299684, -1.859956, 1, 0.2941177, 0, 1,
-1.75495, -0.8629032, -1.599731, 1, 0.3019608, 0, 1,
-1.731698, 0.09989548, -3.228187, 1, 0.3058824, 0, 1,
-1.714213, 0.2312517, -1.088253, 1, 0.3137255, 0, 1,
-1.704751, 1.1719, -1.150074, 1, 0.3176471, 0, 1,
-1.696434, -0.9022585, -1.839725, 1, 0.3254902, 0, 1,
-1.690557, 0.08014482, -0.8710914, 1, 0.3294118, 0, 1,
-1.659253, -0.1836264, -1.874194, 1, 0.3372549, 0, 1,
-1.657724, -0.1249259, -0.566416, 1, 0.3411765, 0, 1,
-1.649993, 0.5405091, -1.590549, 1, 0.3490196, 0, 1,
-1.649804, 0.120584, -2.968372, 1, 0.3529412, 0, 1,
-1.647435, 0.1013572, -0.7499347, 1, 0.3607843, 0, 1,
-1.643625, -0.4598698, -2.448172, 1, 0.3647059, 0, 1,
-1.642875, -0.6019737, -0.83341, 1, 0.372549, 0, 1,
-1.630989, -1.723437, -1.703943, 1, 0.3764706, 0, 1,
-1.627865, 2.421755, -2.112356, 1, 0.3843137, 0, 1,
-1.6153, 0.9836124, 0.1181224, 1, 0.3882353, 0, 1,
-1.577769, -1.632079, -3.301691, 1, 0.3960784, 0, 1,
-1.572935, -0.4483151, -2.13948, 1, 0.4039216, 0, 1,
-1.560365, 1.048574, -0.5896136, 1, 0.4078431, 0, 1,
-1.557944, -0.2724236, -0.7169319, 1, 0.4156863, 0, 1,
-1.55108, -0.6714512, -0.7851338, 1, 0.4196078, 0, 1,
-1.543479, -0.4918562, -2.671635, 1, 0.427451, 0, 1,
-1.530626, 0.1647017, -0.5939395, 1, 0.4313726, 0, 1,
-1.525104, 0.2760521, -1.41841, 1, 0.4392157, 0, 1,
-1.517079, 0.3947162, -1.719033, 1, 0.4431373, 0, 1,
-1.497709, 0.3616658, -3.329318, 1, 0.4509804, 0, 1,
-1.49292, -1.228563, -2.35183, 1, 0.454902, 0, 1,
-1.484689, 0.785886, -0.8849962, 1, 0.4627451, 0, 1,
-1.477909, 0.1869248, -1.236643, 1, 0.4666667, 0, 1,
-1.475329, -0.05664675, -0.2194961, 1, 0.4745098, 0, 1,
-1.473399, 1.115991, -0.7036433, 1, 0.4784314, 0, 1,
-1.465237, -2.122145, -1.110824, 1, 0.4862745, 0, 1,
-1.458399, -0.09390712, -0.7510278, 1, 0.4901961, 0, 1,
-1.457366, 1.065508, -1.820862, 1, 0.4980392, 0, 1,
-1.44494, -0.7855783, -1.802522, 1, 0.5058824, 0, 1,
-1.437961, 0.8689835, -0.305795, 1, 0.509804, 0, 1,
-1.423515, -0.6449988, -3.288273, 1, 0.5176471, 0, 1,
-1.420981, -1.192218, -2.290688, 1, 0.5215687, 0, 1,
-1.418462, -1.527776, -3.235851, 1, 0.5294118, 0, 1,
-1.410694, -2.134179, -2.177157, 1, 0.5333334, 0, 1,
-1.402513, -0.2685509, 0.7509842, 1, 0.5411765, 0, 1,
-1.393539, 0.04277282, -3.969142, 1, 0.5450981, 0, 1,
-1.391674, 1.339972, -1.055169, 1, 0.5529412, 0, 1,
-1.387839, 0.6026455, -0.6850798, 1, 0.5568628, 0, 1,
-1.364995, -0.4669982, -0.5045127, 1, 0.5647059, 0, 1,
-1.364311, 0.1249207, -3.196854, 1, 0.5686275, 0, 1,
-1.36054, -0.8081407, -1.535578, 1, 0.5764706, 0, 1,
-1.359401, 1.216143, -1.427032, 1, 0.5803922, 0, 1,
-1.357798, -0.2270028, -2.184565, 1, 0.5882353, 0, 1,
-1.347923, 0.2779845, -0.7721226, 1, 0.5921569, 0, 1,
-1.342917, 0.1267753, -0.7143428, 1, 0.6, 0, 1,
-1.333272, -0.787952, -2.208714, 1, 0.6078432, 0, 1,
-1.330773, -0.2779812, -2.614349, 1, 0.6117647, 0, 1,
-1.330344, 0.01997582, -1.669899, 1, 0.6196079, 0, 1,
-1.327924, 0.673396, -2.631725, 1, 0.6235294, 0, 1,
-1.321636, 0.08016729, -3.481773, 1, 0.6313726, 0, 1,
-1.319741, 1.242321, -1.96454, 1, 0.6352941, 0, 1,
-1.313507, 0.4976968, -0.6297327, 1, 0.6431373, 0, 1,
-1.308328, -1.230535, -1.568733, 1, 0.6470588, 0, 1,
-1.295993, -1.964169, -3.328954, 1, 0.654902, 0, 1,
-1.288094, -0.7224486, -1.669712, 1, 0.6588235, 0, 1,
-1.284761, -0.6176761, -0.1030012, 1, 0.6666667, 0, 1,
-1.273329, 0.7807574, -0.06509908, 1, 0.6705883, 0, 1,
-1.258996, -0.5332214, -2.538574, 1, 0.6784314, 0, 1,
-1.255959, 1.447983, -1.225393, 1, 0.682353, 0, 1,
-1.255236, 1.058107, 0.1809041, 1, 0.6901961, 0, 1,
-1.251416, 0.8531367, 0.0790804, 1, 0.6941177, 0, 1,
-1.246774, -0.1094695, -0.6973614, 1, 0.7019608, 0, 1,
-1.244603, 0.1829678, -2.064827, 1, 0.7098039, 0, 1,
-1.243705, -0.3993132, -1.367418, 1, 0.7137255, 0, 1,
-1.241504, -1.082843, -0.6107646, 1, 0.7215686, 0, 1,
-1.217109, -0.5294682, -1.464415, 1, 0.7254902, 0, 1,
-1.215553, 1.203828, -0.5069284, 1, 0.7333333, 0, 1,
-1.21503, -0.9225841, -1.651926, 1, 0.7372549, 0, 1,
-1.214524, -1.418249, -1.810136, 1, 0.7450981, 0, 1,
-1.211857, 1.406201, -0.6305801, 1, 0.7490196, 0, 1,
-1.203922, -0.9790204, 0.370021, 1, 0.7568628, 0, 1,
-1.201897, -0.8425522, -0.789956, 1, 0.7607843, 0, 1,
-1.200792, 0.1244684, -4.182688, 1, 0.7686275, 0, 1,
-1.199383, -1.050804, -3.013953, 1, 0.772549, 0, 1,
-1.196129, -0.9646204, -1.183218, 1, 0.7803922, 0, 1,
-1.19024, -1.102634, -1.089638, 1, 0.7843137, 0, 1,
-1.185158, -1.102106, -3.025351, 1, 0.7921569, 0, 1,
-1.184583, 0.2024103, -1.395907, 1, 0.7960784, 0, 1,
-1.183762, -0.1074749, -2.339688, 1, 0.8039216, 0, 1,
-1.178247, 0.05046874, -1.640951, 1, 0.8117647, 0, 1,
-1.177835, 0.4159219, -1.169399, 1, 0.8156863, 0, 1,
-1.1775, 0.3529103, -2.312989, 1, 0.8235294, 0, 1,
-1.172187, 0.5240799, 0.4542307, 1, 0.827451, 0, 1,
-1.165823, 0.7683704, -1.84685, 1, 0.8352941, 0, 1,
-1.151921, 0.5616956, -0.9600983, 1, 0.8392157, 0, 1,
-1.151594, -1.859305, -0.4720781, 1, 0.8470588, 0, 1,
-1.14687, 1.477102, 0.2741209, 1, 0.8509804, 0, 1,
-1.143034, 0.7425147, -0.9736366, 1, 0.8588235, 0, 1,
-1.142119, 1.917196, 0.06407406, 1, 0.8627451, 0, 1,
-1.141117, -0.3128076, -2.425966, 1, 0.8705882, 0, 1,
-1.139433, 0.1540606, -2.598728, 1, 0.8745098, 0, 1,
-1.135182, -0.3641193, -2.179977, 1, 0.8823529, 0, 1,
-1.132565, -2.279468, -3.585609, 1, 0.8862745, 0, 1,
-1.132274, -0.1858284, -1.720204, 1, 0.8941177, 0, 1,
-1.125295, -0.8322096, -0.2580363, 1, 0.8980392, 0, 1,
-1.108067, 2.508982, -1.011752, 1, 0.9058824, 0, 1,
-1.103267, 1.178097, -0.9011736, 1, 0.9137255, 0, 1,
-1.090378, -0.7768576, -3.830819, 1, 0.9176471, 0, 1,
-1.08697, 0.1126823, -2.29196, 1, 0.9254902, 0, 1,
-1.085531, 0.574046, -0.1689189, 1, 0.9294118, 0, 1,
-1.084938, -0.5027452, -0.7252416, 1, 0.9372549, 0, 1,
-1.083736, 1.60421, -1.931621, 1, 0.9411765, 0, 1,
-1.074512, -0.3884806, -1.02195, 1, 0.9490196, 0, 1,
-1.056601, 0.6895151, -1.417237, 1, 0.9529412, 0, 1,
-1.050515, -1.245131, -3.597994, 1, 0.9607843, 0, 1,
-1.046836, 1.597494, -0.2211719, 1, 0.9647059, 0, 1,
-1.045173, 0.02626707, 0.5319834, 1, 0.972549, 0, 1,
-1.044175, -0.6043363, -3.220041, 1, 0.9764706, 0, 1,
-1.038783, -1.831352, -1.857695, 1, 0.9843137, 0, 1,
-1.038711, -0.5972496, -3.380394, 1, 0.9882353, 0, 1,
-1.032733, -0.3313337, -1.473683, 1, 0.9960784, 0, 1,
-1.0273, -0.5300094, -2.347772, 0.9960784, 1, 0, 1,
-1.023929, -0.05513969, -0.9212126, 0.9921569, 1, 0, 1,
-1.022703, -0.7589406, -2.894366, 0.9843137, 1, 0, 1,
-1.022265, 0.5436159, -1.926074, 0.9803922, 1, 0, 1,
-1.021877, -1.285104, -3.136329, 0.972549, 1, 0, 1,
-1.018101, -1.277241, -2.70665, 0.9686275, 1, 0, 1,
-1.015124, 1.732307, -1.504479, 0.9607843, 1, 0, 1,
-1.01156, 0.6627705, -0.2956253, 0.9568627, 1, 0, 1,
-1.01038, -1.460422, -3.179263, 0.9490196, 1, 0, 1,
-1.008162, 0.5417994, -0.3138888, 0.945098, 1, 0, 1,
-1.002196, -1.09278, -1.279413, 0.9372549, 1, 0, 1,
-1.001052, -1.513581, -2.909006, 0.9333333, 1, 0, 1,
-1.000347, 0.1937728, 0.2044068, 0.9254902, 1, 0, 1,
-0.9981164, -0.9929257, -1.283828, 0.9215686, 1, 0, 1,
-0.9949819, -1.08047, -2.307353, 0.9137255, 1, 0, 1,
-0.9934789, -1.807243, -1.738083, 0.9098039, 1, 0, 1,
-0.9894331, -0.02802035, -0.2271222, 0.9019608, 1, 0, 1,
-0.9868141, 0.6943274, 0.5107636, 0.8941177, 1, 0, 1,
-0.9826186, 0.5417328, -2.354865, 0.8901961, 1, 0, 1,
-0.9716446, 1.226997, -1.352411, 0.8823529, 1, 0, 1,
-0.9608762, 2.003143, -0.5918915, 0.8784314, 1, 0, 1,
-0.950298, -0.5295715, -3.290223, 0.8705882, 1, 0, 1,
-0.9390101, -0.9289094, -2.673385, 0.8666667, 1, 0, 1,
-0.9382149, -1.839886, -4.239391, 0.8588235, 1, 0, 1,
-0.9363323, -0.3672915, -1.354692, 0.854902, 1, 0, 1,
-0.9334682, 0.570982, 0.1501833, 0.8470588, 1, 0, 1,
-0.9300968, 0.9395456, -0.0525577, 0.8431373, 1, 0, 1,
-0.9186419, -1.063048, 0.03112745, 0.8352941, 1, 0, 1,
-0.9128523, -0.781198, -0.7918188, 0.8313726, 1, 0, 1,
-0.9116008, -0.87265, -2.407299, 0.8235294, 1, 0, 1,
-0.9071944, -0.908148, -2.626204, 0.8196079, 1, 0, 1,
-0.9066964, -0.3150526, -3.094836, 0.8117647, 1, 0, 1,
-0.8903023, -1.493497, -2.557991, 0.8078431, 1, 0, 1,
-0.8886484, 0.3487509, -0.8857017, 0.8, 1, 0, 1,
-0.8869397, -2.148322, -2.211347, 0.7921569, 1, 0, 1,
-0.8837323, -1.046912, -1.347918, 0.7882353, 1, 0, 1,
-0.8818398, -0.8293275, -2.264334, 0.7803922, 1, 0, 1,
-0.8771033, -0.1634136, -2.508791, 0.7764706, 1, 0, 1,
-0.8692536, 1.482433, -0.5541761, 0.7686275, 1, 0, 1,
-0.8642482, -1.51171, -2.462774, 0.7647059, 1, 0, 1,
-0.8614307, 0.3329421, -0.5599586, 0.7568628, 1, 0, 1,
-0.8572642, 0.2435427, -1.100252, 0.7529412, 1, 0, 1,
-0.8567052, 0.296185, -0.8574083, 0.7450981, 1, 0, 1,
-0.8561912, 0.4300685, -0.2173209, 0.7411765, 1, 0, 1,
-0.8546173, 1.158264, -1.05622, 0.7333333, 1, 0, 1,
-0.8468941, -0.7711237, -0.5278871, 0.7294118, 1, 0, 1,
-0.8392222, 0.06440267, -0.3976657, 0.7215686, 1, 0, 1,
-0.8346565, 0.3088645, -0.8459527, 0.7176471, 1, 0, 1,
-0.8327503, 0.1900599, -0.8804857, 0.7098039, 1, 0, 1,
-0.8313087, 1.725481, -2.041505, 0.7058824, 1, 0, 1,
-0.8300115, 0.3249417, -1.864189, 0.6980392, 1, 0, 1,
-0.8288905, 0.2921122, 0.2142704, 0.6901961, 1, 0, 1,
-0.8230126, 1.825488, 0.7553647, 0.6862745, 1, 0, 1,
-0.8172083, 0.9163932, -0.02812707, 0.6784314, 1, 0, 1,
-0.8142443, -0.473227, -2.061686, 0.6745098, 1, 0, 1,
-0.8117642, -0.7416756, -2.851154, 0.6666667, 1, 0, 1,
-0.8089749, 0.1339551, -2.08012, 0.6627451, 1, 0, 1,
-0.8054347, -0.03186435, -0.474409, 0.654902, 1, 0, 1,
-0.7941474, -0.8727179, -2.050753, 0.6509804, 1, 0, 1,
-0.7902766, -0.1176634, -2.23314, 0.6431373, 1, 0, 1,
-0.780696, -0.6890461, -2.714602, 0.6392157, 1, 0, 1,
-0.779646, 1.602017, 1.57846, 0.6313726, 1, 0, 1,
-0.7785738, -0.3322429, -3.491769, 0.627451, 1, 0, 1,
-0.7770843, 1.905002, -1.476453, 0.6196079, 1, 0, 1,
-0.7745282, 0.4851035, -1.139804, 0.6156863, 1, 0, 1,
-0.774192, 0.8929447, 0.7702141, 0.6078432, 1, 0, 1,
-0.7720479, 1.094636, -1.98516, 0.6039216, 1, 0, 1,
-0.7612089, -0.3686804, -1.641457, 0.5960785, 1, 0, 1,
-0.7571767, -0.5060061, -1.589454, 0.5882353, 1, 0, 1,
-0.7475547, -0.5454511, -2.608126, 0.5843138, 1, 0, 1,
-0.741147, 0.7707614, -0.1948987, 0.5764706, 1, 0, 1,
-0.7307366, -1.047532, -3.287941, 0.572549, 1, 0, 1,
-0.7303298, 0.6423309, -1.550424, 0.5647059, 1, 0, 1,
-0.7295622, 0.817589, -2.518386, 0.5607843, 1, 0, 1,
-0.721162, 0.001198854, -2.13781, 0.5529412, 1, 0, 1,
-0.7196328, -1.143954, -2.816145, 0.5490196, 1, 0, 1,
-0.7190594, 0.09801129, -2.970994, 0.5411765, 1, 0, 1,
-0.7172228, 1.399349, 0.2760748, 0.5372549, 1, 0, 1,
-0.7169997, 0.8136839, -1.071561, 0.5294118, 1, 0, 1,
-0.7133566, -0.6778346, -1.379787, 0.5254902, 1, 0, 1,
-0.712165, -0.8297523, -1.017326, 0.5176471, 1, 0, 1,
-0.7058578, 0.8037944, 0.3402637, 0.5137255, 1, 0, 1,
-0.7049589, -0.01713156, -2.388717, 0.5058824, 1, 0, 1,
-0.7009881, -0.3233581, -1.481129, 0.5019608, 1, 0, 1,
-0.6950932, -0.4160534, -2.181938, 0.4941176, 1, 0, 1,
-0.6890288, 0.4794919, 1.463922, 0.4862745, 1, 0, 1,
-0.6772227, 1.627424, -0.8752192, 0.4823529, 1, 0, 1,
-0.6723577, -1.527131, -1.410702, 0.4745098, 1, 0, 1,
-0.6702462, -0.6373082, -2.135877, 0.4705882, 1, 0, 1,
-0.6681921, -0.08919318, -1.633237, 0.4627451, 1, 0, 1,
-0.6639213, 0.1323676, -2.496541, 0.4588235, 1, 0, 1,
-0.6510488, -0.6512522, -1.748794, 0.4509804, 1, 0, 1,
-0.6420609, 0.9303451, -2.204604, 0.4470588, 1, 0, 1,
-0.6400895, 0.2580671, -1.24382, 0.4392157, 1, 0, 1,
-0.6369973, -0.4759721, -1.409685, 0.4352941, 1, 0, 1,
-0.6335857, -1.847692, -4.207688, 0.427451, 1, 0, 1,
-0.6329108, -1.551341, -2.677334, 0.4235294, 1, 0, 1,
-0.631794, 0.2169179, -0.5694066, 0.4156863, 1, 0, 1,
-0.6314514, -0.4563689, -2.444314, 0.4117647, 1, 0, 1,
-0.6268576, 0.6305463, -2.798648, 0.4039216, 1, 0, 1,
-0.6231679, 0.282169, -1.915458, 0.3960784, 1, 0, 1,
-0.6192992, 1.570224, 0.6862322, 0.3921569, 1, 0, 1,
-0.6192752, 1.469771, -1.202657, 0.3843137, 1, 0, 1,
-0.6113771, 0.3374149, -1.787631, 0.3803922, 1, 0, 1,
-0.6099818, -0.09828067, -0.9484757, 0.372549, 1, 0, 1,
-0.6077051, -0.5193193, -3.315109, 0.3686275, 1, 0, 1,
-0.6059797, -1.976497, -2.210015, 0.3607843, 1, 0, 1,
-0.6056874, -0.6088197, -1.304179, 0.3568628, 1, 0, 1,
-0.6028813, -0.1738703, -1.937319, 0.3490196, 1, 0, 1,
-0.6006969, -0.1328235, -0.8037165, 0.345098, 1, 0, 1,
-0.6002141, 1.392936, -0.5492263, 0.3372549, 1, 0, 1,
-0.599407, 1.783144, -0.5110418, 0.3333333, 1, 0, 1,
-0.5965208, 0.9296071, 0.5457823, 0.3254902, 1, 0, 1,
-0.5936916, 2.792365, -0.1213667, 0.3215686, 1, 0, 1,
-0.591849, -1.049144, -2.852265, 0.3137255, 1, 0, 1,
-0.5873945, -1.44248, -2.811303, 0.3098039, 1, 0, 1,
-0.5863425, 0.4186539, -1.225368, 0.3019608, 1, 0, 1,
-0.5846016, 0.4244069, -3.620256, 0.2941177, 1, 0, 1,
-0.5807853, -1.751413, -1.474525, 0.2901961, 1, 0, 1,
-0.5736589, -0.3286769, -3.629748, 0.282353, 1, 0, 1,
-0.5731531, 0.3076664, -2.302091, 0.2784314, 1, 0, 1,
-0.57008, -0.2228441, -2.787841, 0.2705882, 1, 0, 1,
-0.5676761, 1.634548, 1.332515, 0.2666667, 1, 0, 1,
-0.5663113, 0.02159141, -1.761974, 0.2588235, 1, 0, 1,
-0.5609556, 0.2260198, -1.399901, 0.254902, 1, 0, 1,
-0.5596772, -0.6084526, -1.855527, 0.2470588, 1, 0, 1,
-0.5563484, 0.494524, 0.30712, 0.2431373, 1, 0, 1,
-0.5554014, 1.549098, 0.08347271, 0.2352941, 1, 0, 1,
-0.5537337, 1.037262, -0.8456649, 0.2313726, 1, 0, 1,
-0.5502504, -0.1911149, -2.923305, 0.2235294, 1, 0, 1,
-0.5487425, 1.45559, -0.939153, 0.2196078, 1, 0, 1,
-0.5425199, -0.139031, -2.596857, 0.2117647, 1, 0, 1,
-0.5408272, 0.2536643, -0.5118755, 0.2078431, 1, 0, 1,
-0.5388471, -1.081207, -3.372706, 0.2, 1, 0, 1,
-0.5384524, -0.1746572, -0.6021938, 0.1921569, 1, 0, 1,
-0.5366291, -1.314523, -3.195366, 0.1882353, 1, 0, 1,
-0.5364997, 0.7006341, -0.3607645, 0.1803922, 1, 0, 1,
-0.5348573, 0.3687404, -0.5287287, 0.1764706, 1, 0, 1,
-0.5294616, 0.4076443, -1.385746, 0.1686275, 1, 0, 1,
-0.5266117, -1.654817, -2.786059, 0.1647059, 1, 0, 1,
-0.5261371, 0.5760719, 1.384297, 0.1568628, 1, 0, 1,
-0.5254387, 1.541326, -1.613818, 0.1529412, 1, 0, 1,
-0.5233719, 0.7442148, -0.8971472, 0.145098, 1, 0, 1,
-0.5209408, 1.373186, 0.1532782, 0.1411765, 1, 0, 1,
-0.5199876, -0.9142878, -2.296062, 0.1333333, 1, 0, 1,
-0.5168704, -1.806694, -1.33514, 0.1294118, 1, 0, 1,
-0.5167014, -0.391012, -2.100176, 0.1215686, 1, 0, 1,
-0.5155382, 0.8966614, 0.9072354, 0.1176471, 1, 0, 1,
-0.5152588, 0.6252896, -2.363201, 0.1098039, 1, 0, 1,
-0.5102525, 2.107976, -1.35282, 0.1058824, 1, 0, 1,
-0.5060737, 0.1387773, -1.174055, 0.09803922, 1, 0, 1,
-0.5007777, 1.405651, 0.913853, 0.09019608, 1, 0, 1,
-0.4981612, -0.4296944, -1.493377, 0.08627451, 1, 0, 1,
-0.4945546, 0.857226, -0.1750673, 0.07843138, 1, 0, 1,
-0.4865309, 0.1370201, -0.5438896, 0.07450981, 1, 0, 1,
-0.4863828, 0.632785, 0.4740337, 0.06666667, 1, 0, 1,
-0.4863794, 0.4663593, -1.97023, 0.0627451, 1, 0, 1,
-0.4822094, 1.631868, -2.155287, 0.05490196, 1, 0, 1,
-0.4817686, 1.524354, -2.133657, 0.05098039, 1, 0, 1,
-0.4768206, -0.5821579, -3.718822, 0.04313726, 1, 0, 1,
-0.4743471, 0.2668795, -2.517812, 0.03921569, 1, 0, 1,
-0.4727578, 1.698804, 0.08456548, 0.03137255, 1, 0, 1,
-0.4710456, 1.191675, -0.2523414, 0.02745098, 1, 0, 1,
-0.4709298, 1.036426, 0.03223603, 0.01960784, 1, 0, 1,
-0.4707856, -2.063854, -2.977364, 0.01568628, 1, 0, 1,
-0.4661857, 0.5893979, -0.8437002, 0.007843138, 1, 0, 1,
-0.4652234, -0.34728, -3.060405, 0.003921569, 1, 0, 1,
-0.4638482, 1.030685, -1.119027, 0, 1, 0.003921569, 1,
-0.4631673, 1.17667, 0.5264102, 0, 1, 0.01176471, 1,
-0.457604, -1.532161, -0.5629695, 0, 1, 0.01568628, 1,
-0.4519702, 0.7555569, -0.112833, 0, 1, 0.02352941, 1,
-0.4519317, 1.149416, -0.22491, 0, 1, 0.02745098, 1,
-0.4469371, 0.2896977, 0.1214837, 0, 1, 0.03529412, 1,
-0.4214161, 1.229223, -0.6300107, 0, 1, 0.03921569, 1,
-0.4205246, 1.190647, -2.113366, 0, 1, 0.04705882, 1,
-0.4141127, -0.134891, -1.189733, 0, 1, 0.05098039, 1,
-0.4128327, 1.611521, 0.1412989, 0, 1, 0.05882353, 1,
-0.4087344, 0.9971949, 1.477209, 0, 1, 0.0627451, 1,
-0.4073078, 1.053083, 0.1220865, 0, 1, 0.07058824, 1,
-0.3966083, 0.6094421, -0.4626878, 0, 1, 0.07450981, 1,
-0.3965519, -0.008546563, -1.707948, 0, 1, 0.08235294, 1,
-0.3962996, 0.2742372, -2.060958, 0, 1, 0.08627451, 1,
-0.3929261, 0.3598212, 1.028751, 0, 1, 0.09411765, 1,
-0.3906679, 0.3988939, -0.07050284, 0, 1, 0.1019608, 1,
-0.3891415, 0.777016, -0.00969179, 0, 1, 0.1058824, 1,
-0.3880257, 0.223227, -2.199054, 0, 1, 0.1137255, 1,
-0.3842181, -0.9321778, -4.476151, 0, 1, 0.1176471, 1,
-0.381859, -0.3468879, -2.580746, 0, 1, 0.1254902, 1,
-0.381503, -0.6030534, -0.7322512, 0, 1, 0.1294118, 1,
-0.3788002, -1.012049, -2.930113, 0, 1, 0.1372549, 1,
-0.3748594, 0.8522044, -0.2848257, 0, 1, 0.1411765, 1,
-0.3735739, -0.8493146, -2.844916, 0, 1, 0.1490196, 1,
-0.372742, -0.07196701, -2.138612, 0, 1, 0.1529412, 1,
-0.3724087, 0.4426316, 1.492199, 0, 1, 0.1607843, 1,
-0.3701328, -0.1324309, -1.46816, 0, 1, 0.1647059, 1,
-0.3680304, -0.2224959, -2.838995, 0, 1, 0.172549, 1,
-0.3676194, -1.045438, -3.596292, 0, 1, 0.1764706, 1,
-0.3621822, 0.5254003, -0.1825322, 0, 1, 0.1843137, 1,
-0.3600277, -1.217809, -4.097315, 0, 1, 0.1882353, 1,
-0.3578292, 0.0607723, -1.449127, 0, 1, 0.1960784, 1,
-0.3553165, -0.1141246, -0.7722998, 0, 1, 0.2039216, 1,
-0.3464114, 1.339248, 0.9482306, 0, 1, 0.2078431, 1,
-0.3413498, 1.152122, -0.649853, 0, 1, 0.2156863, 1,
-0.3399877, -0.006883665, -2.527547, 0, 1, 0.2196078, 1,
-0.3393444, 0.0864833, -1.563011, 0, 1, 0.227451, 1,
-0.3355929, 0.7486588, -1.096247, 0, 1, 0.2313726, 1,
-0.3347912, -1.388983, -3.541566, 0, 1, 0.2392157, 1,
-0.3296983, 1.175112, 0.4290501, 0, 1, 0.2431373, 1,
-0.3265812, 0.03957814, -0.2394236, 0, 1, 0.2509804, 1,
-0.3252621, 1.268485, 0.226621, 0, 1, 0.254902, 1,
-0.3233295, -0.01937692, -0.6052124, 0, 1, 0.2627451, 1,
-0.3219211, 0.3242979, 1.15643, 0, 1, 0.2666667, 1,
-0.3218829, -0.2245588, -1.044542, 0, 1, 0.2745098, 1,
-0.3209904, 0.5780736, -1.803607, 0, 1, 0.2784314, 1,
-0.3202222, 1.303321, -1.635239, 0, 1, 0.2862745, 1,
-0.3200296, -0.7666044, -2.563256, 0, 1, 0.2901961, 1,
-0.3140693, -1.045068, -1.672113, 0, 1, 0.2980392, 1,
-0.3120051, 0.345348, -3.218624, 0, 1, 0.3058824, 1,
-0.3115275, -0.2919883, 0.1745105, 0, 1, 0.3098039, 1,
-0.310749, -0.375878, -1.338353, 0, 1, 0.3176471, 1,
-0.3100499, 1.167007, 2.030225, 0, 1, 0.3215686, 1,
-0.3089464, 1.301898, 1.22881, 0, 1, 0.3294118, 1,
-0.307528, 1.932491, -0.5828501, 0, 1, 0.3333333, 1,
-0.2995614, 1.252265, 0.3957492, 0, 1, 0.3411765, 1,
-0.2973477, -1.572223, -3.958635, 0, 1, 0.345098, 1,
-0.292021, -1.206508, -3.236963, 0, 1, 0.3529412, 1,
-0.2906946, -0.795512, -2.755738, 0, 1, 0.3568628, 1,
-0.2900031, 0.2724677, -2.03671, 0, 1, 0.3647059, 1,
-0.2877667, 0.2629295, -1.600519, 0, 1, 0.3686275, 1,
-0.2868075, 1.038395, -0.5232801, 0, 1, 0.3764706, 1,
-0.2818171, 1.240203, -1.967714, 0, 1, 0.3803922, 1,
-0.2817071, -0.232934, -0.9977731, 0, 1, 0.3882353, 1,
-0.2814891, 1.64976, 1.457328, 0, 1, 0.3921569, 1,
-0.2811858, 0.4129621, -0.4964138, 0, 1, 0.4, 1,
-0.2798666, 0.3822298, -0.9736804, 0, 1, 0.4078431, 1,
-0.2778538, -0.1970438, -3.222382, 0, 1, 0.4117647, 1,
-0.2775508, 0.5296404, 0.5395696, 0, 1, 0.4196078, 1,
-0.2752835, -0.3099018, -2.375236, 0, 1, 0.4235294, 1,
-0.2730547, -0.6599547, -1.471721, 0, 1, 0.4313726, 1,
-0.2698599, 0.2189162, -1.006493, 0, 1, 0.4352941, 1,
-0.2680586, -0.2119681, -2.893106, 0, 1, 0.4431373, 1,
-0.2620028, 0.01239765, -2.147192, 0, 1, 0.4470588, 1,
-0.2586772, -0.01291432, -0.8711053, 0, 1, 0.454902, 1,
-0.2569538, 0.8957812, -0.669439, 0, 1, 0.4588235, 1,
-0.2568873, 0.9761381, -0.4646956, 0, 1, 0.4666667, 1,
-0.2520387, -0.9047011, -1.695516, 0, 1, 0.4705882, 1,
-0.246047, -0.215764, -2.069062, 0, 1, 0.4784314, 1,
-0.2457734, -1.735457, -3.125056, 0, 1, 0.4823529, 1,
-0.2415781, 1.111799, 0.158031, 0, 1, 0.4901961, 1,
-0.2414188, -0.5369142, -2.11409, 0, 1, 0.4941176, 1,
-0.2399634, 0.6660467, -0.8670111, 0, 1, 0.5019608, 1,
-0.2398245, 0.5606155, 0.156429, 0, 1, 0.509804, 1,
-0.2377696, -1.878124, -4.221907, 0, 1, 0.5137255, 1,
-0.2348987, 0.3880938, -0.8350687, 0, 1, 0.5215687, 1,
-0.2342891, 0.2661859, -1.301252, 0, 1, 0.5254902, 1,
-0.2265985, 1.598478, -0.759692, 0, 1, 0.5333334, 1,
-0.2258723, 0.8261351, -1.642501, 0, 1, 0.5372549, 1,
-0.2237757, 0.3261916, 0.7376204, 0, 1, 0.5450981, 1,
-0.2223662, -0.1489112, -1.829703, 0, 1, 0.5490196, 1,
-0.2218743, -0.5081107, -0.6622501, 0, 1, 0.5568628, 1,
-0.2213026, 0.5531351, 0.9135744, 0, 1, 0.5607843, 1,
-0.2203995, 1.671019, -1.130795, 0, 1, 0.5686275, 1,
-0.2158248, -0.2160956, -3.932858, 0, 1, 0.572549, 1,
-0.2083912, -1.042135, -2.188916, 0, 1, 0.5803922, 1,
-0.2052209, -0.4798266, -3.565474, 0, 1, 0.5843138, 1,
-0.2037209, 0.4095436, -1.370435, 0, 1, 0.5921569, 1,
-0.1927298, -0.2073421, -1.662517, 0, 1, 0.5960785, 1,
-0.1883778, 1.672803, -0.8900037, 0, 1, 0.6039216, 1,
-0.1877951, 0.3473361, -0.5463925, 0, 1, 0.6117647, 1,
-0.1821176, -0.8388666, -1.777566, 0, 1, 0.6156863, 1,
-0.1810616, 1.927382, -0.6236293, 0, 1, 0.6235294, 1,
-0.1785221, 0.3052731, -0.08568215, 0, 1, 0.627451, 1,
-0.1782635, -0.02514046, -1.530995, 0, 1, 0.6352941, 1,
-0.1753782, -1.035211, -3.018928, 0, 1, 0.6392157, 1,
-0.1713846, -0.192696, -2.148365, 0, 1, 0.6470588, 1,
-0.1574166, -0.9482038, -2.593122, 0, 1, 0.6509804, 1,
-0.1542369, 2.950158, 0.7909953, 0, 1, 0.6588235, 1,
-0.1523724, 2.090676, -1.190641, 0, 1, 0.6627451, 1,
-0.1516613, -0.002299624, -1.588761, 0, 1, 0.6705883, 1,
-0.1480875, 0.05334036, -1.899836, 0, 1, 0.6745098, 1,
-0.1465198, -0.2810442, -3.215494, 0, 1, 0.682353, 1,
-0.1455823, -0.04049938, -0.7920917, 0, 1, 0.6862745, 1,
-0.145441, -0.313235, -3.410762, 0, 1, 0.6941177, 1,
-0.1432565, 1.467858, -1.103248, 0, 1, 0.7019608, 1,
-0.1420681, 0.3049157, -1.26919, 0, 1, 0.7058824, 1,
-0.1409733, -0.1110515, -1.273925, 0, 1, 0.7137255, 1,
-0.1378988, 0.8442729, 0.09262133, 0, 1, 0.7176471, 1,
-0.136885, -1.397472, -3.878608, 0, 1, 0.7254902, 1,
-0.1343942, -0.4153841, -2.738329, 0, 1, 0.7294118, 1,
-0.1279916, 1.702512, -0.7250404, 0, 1, 0.7372549, 1,
-0.1155174, 0.6316674, -1.56101, 0, 1, 0.7411765, 1,
-0.1086024, -1.012153, -2.999764, 0, 1, 0.7490196, 1,
-0.1047326, -0.3505873, -1.484917, 0, 1, 0.7529412, 1,
-0.1030064, -0.3984087, -4.419645, 0, 1, 0.7607843, 1,
-0.1010424, 1.133869, 0.6768764, 0, 1, 0.7647059, 1,
-0.09998838, -0.07409879, -1.617939, 0, 1, 0.772549, 1,
-0.08723414, -1.681683, -3.46071, 0, 1, 0.7764706, 1,
-0.08562085, -0.1881911, -2.666121, 0, 1, 0.7843137, 1,
-0.08320263, -0.3248514, -2.388638, 0, 1, 0.7882353, 1,
-0.07487454, 0.1865346, -0.7713739, 0, 1, 0.7960784, 1,
-0.07392774, -1.708913, -0.5641112, 0, 1, 0.8039216, 1,
-0.07267749, 0.05524161, 0.331338, 0, 1, 0.8078431, 1,
-0.06828055, -0.1198155, -1.963006, 0, 1, 0.8156863, 1,
-0.06814822, -0.657819, -3.597015, 0, 1, 0.8196079, 1,
-0.0663674, -1.961563, -4.141634, 0, 1, 0.827451, 1,
-0.06548854, -2.283596, -3.260174, 0, 1, 0.8313726, 1,
-0.0652106, -0.5853709, -2.353176, 0, 1, 0.8392157, 1,
-0.06232253, -1.93707, -3.003783, 0, 1, 0.8431373, 1,
-0.05564107, 0.7480787, -1.216636, 0, 1, 0.8509804, 1,
-0.05495065, 0.9754667, 0.9733599, 0, 1, 0.854902, 1,
-0.05475479, -0.8185574, -1.417639, 0, 1, 0.8627451, 1,
-0.05454723, 1.656617, -0.1843647, 0, 1, 0.8666667, 1,
-0.05342186, -1.3366, -6.062305, 0, 1, 0.8745098, 1,
-0.05181427, 1.183155, -0.1938855, 0, 1, 0.8784314, 1,
-0.05093358, -0.7959231, -4.558258, 0, 1, 0.8862745, 1,
-0.04944864, -0.8648049, -1.589323, 0, 1, 0.8901961, 1,
-0.04379221, 1.788333, 0.01619778, 0, 1, 0.8980392, 1,
-0.04284493, -0.8168357, -2.63769, 0, 1, 0.9058824, 1,
-0.04214179, -0.5435597, -2.294563, 0, 1, 0.9098039, 1,
-0.04182824, -0.1019478, -0.2776671, 0, 1, 0.9176471, 1,
-0.03892109, -1.138058, -2.093653, 0, 1, 0.9215686, 1,
-0.0350412, -0.3978668, -1.985731, 0, 1, 0.9294118, 1,
-0.03455808, 1.069536, 0.5181193, 0, 1, 0.9333333, 1,
-0.03316919, -1.082735, -2.837579, 0, 1, 0.9411765, 1,
-0.02839205, -1.394084, -2.857378, 0, 1, 0.945098, 1,
-0.02513832, -0.3568138, -2.61853, 0, 1, 0.9529412, 1,
-0.01794975, 1.058354, 0.5271287, 0, 1, 0.9568627, 1,
-0.01414758, -1.724353, -2.007303, 0, 1, 0.9647059, 1,
-0.01343168, 0.7640018, 0.3528945, 0, 1, 0.9686275, 1,
-0.01343055, 0.3906701, 1.65093, 0, 1, 0.9764706, 1,
-0.0129768, 1.25548, 0.5949584, 0, 1, 0.9803922, 1,
-0.01230351, 0.4828658, -0.1921515, 0, 1, 0.9882353, 1,
-0.01163626, -1.905245, -2.966869, 0, 1, 0.9921569, 1,
-0.00930957, 0.05269352, 1.188702, 0, 1, 1, 1,
-0.008716486, 0.2798988, -0.8395014, 0, 0.9921569, 1, 1,
-0.008106908, 1.073027, 0.6289704, 0, 0.9882353, 1, 1,
-0.005595234, -1.258992, -3.45983, 0, 0.9803922, 1, 1,
-0.003709154, 0.2289956, 0.8183625, 0, 0.9764706, 1, 1,
0.00239124, 0.7254604, 0.2256359, 0, 0.9686275, 1, 1,
0.002420363, -2.454336, 3.306353, 0, 0.9647059, 1, 1,
0.003493349, 0.7783665, 0.9700827, 0, 0.9568627, 1, 1,
0.00727896, -0.08417359, 2.785824, 0, 0.9529412, 1, 1,
0.01056513, 1.01678, 0.9408299, 0, 0.945098, 1, 1,
0.01598238, 0.5251521, -0.978778, 0, 0.9411765, 1, 1,
0.01899288, -0.1193424, 2.492557, 0, 0.9333333, 1, 1,
0.02028666, 1.140745, -1.678248, 0, 0.9294118, 1, 1,
0.02688107, -0.9860532, 3.983332, 0, 0.9215686, 1, 1,
0.02909247, -0.06953951, 2.602435, 0, 0.9176471, 1, 1,
0.03055467, -0.6091773, 2.591231, 0, 0.9098039, 1, 1,
0.03176221, 0.4083483, -1.426477, 0, 0.9058824, 1, 1,
0.03182704, -0.119478, 3.017875, 0, 0.8980392, 1, 1,
0.03228539, -0.3153812, 3.731067, 0, 0.8901961, 1, 1,
0.0336978, 0.8796222, 1.679008, 0, 0.8862745, 1, 1,
0.03751299, 1.322375, -0.3123158, 0, 0.8784314, 1, 1,
0.03816075, -1.691576, 2.347189, 0, 0.8745098, 1, 1,
0.03830483, 1.685934, 0.9348574, 0, 0.8666667, 1, 1,
0.04142416, 2.164168, -0.6209412, 0, 0.8627451, 1, 1,
0.04472601, 0.2280004, 0.7204785, 0, 0.854902, 1, 1,
0.04544106, 0.06775931, 0.6087683, 0, 0.8509804, 1, 1,
0.04711096, -0.280732, 3.594416, 0, 0.8431373, 1, 1,
0.04758623, 1.23026, -1.065263, 0, 0.8392157, 1, 1,
0.05067021, 0.5520276, -0.5272203, 0, 0.8313726, 1, 1,
0.05288846, -0.7405884, 3.351048, 0, 0.827451, 1, 1,
0.05431059, -0.5016835, 1.049873, 0, 0.8196079, 1, 1,
0.0595498, -0.83962, 3.311364, 0, 0.8156863, 1, 1,
0.06139166, 1.273746, -1.179408, 0, 0.8078431, 1, 1,
0.06496915, 0.3138088, 0.6195178, 0, 0.8039216, 1, 1,
0.0660029, 0.7348385, -0.01447985, 0, 0.7960784, 1, 1,
0.07435126, 0.5586329, 0.2052552, 0, 0.7882353, 1, 1,
0.07476297, 1.217689, -0.7205469, 0, 0.7843137, 1, 1,
0.07731633, 0.4079164, -0.2528542, 0, 0.7764706, 1, 1,
0.07788009, 0.6142981, 1.704206, 0, 0.772549, 1, 1,
0.07980284, -0.2628767, 1.561612, 0, 0.7647059, 1, 1,
0.08116338, -1.554892, 3.550203, 0, 0.7607843, 1, 1,
0.08206877, 0.0201594, 1.637623, 0, 0.7529412, 1, 1,
0.08257104, 1.11519, 0.2564785, 0, 0.7490196, 1, 1,
0.0832978, -2.592339, 2.764697, 0, 0.7411765, 1, 1,
0.08468507, 1.21405, 1.936436, 0, 0.7372549, 1, 1,
0.09216736, -1.403243, 3.004195, 0, 0.7294118, 1, 1,
0.09257849, -0.09262957, 1.061647, 0, 0.7254902, 1, 1,
0.09290662, -1.310463, 3.223435, 0, 0.7176471, 1, 1,
0.09382836, 0.4191435, -0.2750296, 0, 0.7137255, 1, 1,
0.1061887, 1.804736, 0.6172426, 0, 0.7058824, 1, 1,
0.1068101, 1.069045, 0.8854342, 0, 0.6980392, 1, 1,
0.1071571, 2.050574, 0.3354718, 0, 0.6941177, 1, 1,
0.1103809, -0.721662, 4.241471, 0, 0.6862745, 1, 1,
0.1113062, -0.4937573, 3.688907, 0, 0.682353, 1, 1,
0.1149129, 1.126157, -0.6989065, 0, 0.6745098, 1, 1,
0.1157012, 0.1732128, 0.8912225, 0, 0.6705883, 1, 1,
0.1164124, -0.5480689, 2.467515, 0, 0.6627451, 1, 1,
0.1231345, -0.02242829, 1.357361, 0, 0.6588235, 1, 1,
0.1241007, -1.296018, 5.415635, 0, 0.6509804, 1, 1,
0.1340565, -2.34059, 2.527251, 0, 0.6470588, 1, 1,
0.1388844, 1.372068, 0.9711665, 0, 0.6392157, 1, 1,
0.1403017, 0.962826, -0.1815658, 0, 0.6352941, 1, 1,
0.1406902, 0.590284, 1.958217, 0, 0.627451, 1, 1,
0.143505, -0.9039859, 2.880878, 0, 0.6235294, 1, 1,
0.1436408, -0.08810336, 3.468638, 0, 0.6156863, 1, 1,
0.1466117, -0.4501684, 3.849654, 0, 0.6117647, 1, 1,
0.1539689, 0.8057061, 0.01070151, 0, 0.6039216, 1, 1,
0.1543199, 0.6609338, 1.504803, 0, 0.5960785, 1, 1,
0.1544846, -1.135355, 1.342598, 0, 0.5921569, 1, 1,
0.1544887, 0.1060712, 3.227675, 0, 0.5843138, 1, 1,
0.1547911, 1.282173, -1.491881, 0, 0.5803922, 1, 1,
0.1573674, 0.4100078, 0.259769, 0, 0.572549, 1, 1,
0.1576139, -1.10474, 2.704182, 0, 0.5686275, 1, 1,
0.1653797, -1.756261, 2.542419, 0, 0.5607843, 1, 1,
0.1743489, 0.2484676, -0.06526914, 0, 0.5568628, 1, 1,
0.175669, -0.241014, 2.4429, 0, 0.5490196, 1, 1,
0.1816785, 0.04308039, 1.014225, 0, 0.5450981, 1, 1,
0.1818707, 0.4693135, 0.4630738, 0, 0.5372549, 1, 1,
0.1833576, -0.4736495, 2.535524, 0, 0.5333334, 1, 1,
0.1864274, -1.027516, 3.49784, 0, 0.5254902, 1, 1,
0.1866284, -2.34284, 2.307911, 0, 0.5215687, 1, 1,
0.1882599, 0.4080119, -0.4593292, 0, 0.5137255, 1, 1,
0.1887462, 0.5349866, 0.6861418, 0, 0.509804, 1, 1,
0.1897744, -0.1759458, 2.030522, 0, 0.5019608, 1, 1,
0.1953842, 0.1966421, 0.1277143, 0, 0.4941176, 1, 1,
0.1979325, 0.8185576, -0.4065697, 0, 0.4901961, 1, 1,
0.1985471, 0.5514125, -0.7102752, 0, 0.4823529, 1, 1,
0.2041537, 0.388389, 0.7846602, 0, 0.4784314, 1, 1,
0.2068021, -1.235202, 2.040137, 0, 0.4705882, 1, 1,
0.2083275, -0.6301624, 4.102835, 0, 0.4666667, 1, 1,
0.2141398, -0.4677738, 2.364556, 0, 0.4588235, 1, 1,
0.2193908, -1.350656, 2.229789, 0, 0.454902, 1, 1,
0.2200982, 0.08126249, 1.300847, 0, 0.4470588, 1, 1,
0.2251269, 1.832016, -0.5559574, 0, 0.4431373, 1, 1,
0.2306688, -0.6254874, 2.966721, 0, 0.4352941, 1, 1,
0.2341756, -0.08836658, 1.814674, 0, 0.4313726, 1, 1,
0.234411, 1.075389, -1.042152, 0, 0.4235294, 1, 1,
0.2349886, -0.08419578, 0.154613, 0, 0.4196078, 1, 1,
0.2355495, -1.098534, 2.412338, 0, 0.4117647, 1, 1,
0.2377294, 0.7586781, 0.9395826, 0, 0.4078431, 1, 1,
0.2421462, -1.041145, 3.236387, 0, 0.4, 1, 1,
0.2427112, -1.499819, 3.080326, 0, 0.3921569, 1, 1,
0.246784, 1.543171, 0.3520196, 0, 0.3882353, 1, 1,
0.2485068, -0.1723106, 2.123447, 0, 0.3803922, 1, 1,
0.2516648, -0.478808, 4.683078, 0, 0.3764706, 1, 1,
0.2545222, 0.06877518, 0.1577169, 0, 0.3686275, 1, 1,
0.255277, 1.02855, -1.529481, 0, 0.3647059, 1, 1,
0.2557029, -0.86681, 2.814341, 0, 0.3568628, 1, 1,
0.258407, 0.6800244, 0.4529077, 0, 0.3529412, 1, 1,
0.2609611, -0.2614412, 1.087004, 0, 0.345098, 1, 1,
0.2620669, 0.2167534, -0.2757572, 0, 0.3411765, 1, 1,
0.2658303, 3.190175, -0.8973128, 0, 0.3333333, 1, 1,
0.2675069, -2.310512, 4.912131, 0, 0.3294118, 1, 1,
0.2687155, 1.208703, 2.081739, 0, 0.3215686, 1, 1,
0.2688831, -0.02391355, 1.103863, 0, 0.3176471, 1, 1,
0.2690568, -1.656619, 3.447777, 0, 0.3098039, 1, 1,
0.2692173, 0.4820755, 1.274025, 0, 0.3058824, 1, 1,
0.2714438, 1.594852, 0.9956461, 0, 0.2980392, 1, 1,
0.2741425, 0.5825008, 2.01287, 0, 0.2901961, 1, 1,
0.2800284, -0.6558239, 3.884177, 0, 0.2862745, 1, 1,
0.2810725, -0.04828643, -0.3296823, 0, 0.2784314, 1, 1,
0.2884066, 1.194247, -0.5340332, 0, 0.2745098, 1, 1,
0.2884434, 0.09645212, 0.153534, 0, 0.2666667, 1, 1,
0.291941, -0.8678492, 2.335747, 0, 0.2627451, 1, 1,
0.2988597, -0.5377648, 3.281492, 0, 0.254902, 1, 1,
0.2991819, -0.1027152, 1.015055, 0, 0.2509804, 1, 1,
0.2992856, 0.314476, 0.4454225, 0, 0.2431373, 1, 1,
0.2997807, -1.096415, 2.178458, 0, 0.2392157, 1, 1,
0.3033418, -0.7398525, 3.796161, 0, 0.2313726, 1, 1,
0.3046224, 0.02977307, 0.5725518, 0, 0.227451, 1, 1,
0.3072362, -0.4341413, 1.578677, 0, 0.2196078, 1, 1,
0.3086053, -2.535379, 1.854874, 0, 0.2156863, 1, 1,
0.3091346, 0.05003976, 1.107702, 0, 0.2078431, 1, 1,
0.3101181, -0.2865992, 2.669908, 0, 0.2039216, 1, 1,
0.3105803, -1.116141, 3.16824, 0, 0.1960784, 1, 1,
0.3132614, -1.492847, 2.570622, 0, 0.1882353, 1, 1,
0.3154112, 0.9017958, 0.5295742, 0, 0.1843137, 1, 1,
0.315481, -0.4688143, 2.991958, 0, 0.1764706, 1, 1,
0.3164939, -0.1556705, 2.337676, 0, 0.172549, 1, 1,
0.320099, 0.4012284, 1.04825, 0, 0.1647059, 1, 1,
0.3202521, 0.6554398, -0.08973147, 0, 0.1607843, 1, 1,
0.3231519, 2.116052, 0.9262617, 0, 0.1529412, 1, 1,
0.3242213, 0.1521086, 0.1604412, 0, 0.1490196, 1, 1,
0.3265576, -0.2191756, 1.979943, 0, 0.1411765, 1, 1,
0.3268839, 0.9010308, -1.488559, 0, 0.1372549, 1, 1,
0.3280485, -0.3448545, 2.38213, 0, 0.1294118, 1, 1,
0.3297571, 0.2717054, -0.7818124, 0, 0.1254902, 1, 1,
0.3320009, -2.25648, 1.651001, 0, 0.1176471, 1, 1,
0.344952, 0.9397582, -0.1905004, 0, 0.1137255, 1, 1,
0.3471364, 1.658957, -1.005995, 0, 0.1058824, 1, 1,
0.347268, 1.329053, 0.02225491, 0, 0.09803922, 1, 1,
0.3473076, 0.4868299, 1.060964, 0, 0.09411765, 1, 1,
0.3533368, -2.319521, 2.908487, 0, 0.08627451, 1, 1,
0.3536126, 3.194185, -1.935066, 0, 0.08235294, 1, 1,
0.3537608, -0.2838298, 2.238162, 0, 0.07450981, 1, 1,
0.3543276, 0.8936616, -1.267968, 0, 0.07058824, 1, 1,
0.3560389, -0.2203661, 4.137983, 0, 0.0627451, 1, 1,
0.3561496, 0.1204207, 2.131603, 0, 0.05882353, 1, 1,
0.3590969, -0.1693165, 0.3730187, 0, 0.05098039, 1, 1,
0.3610464, 0.5082208, 1.237272, 0, 0.04705882, 1, 1,
0.3622299, 0.5328119, -0.255283, 0, 0.03921569, 1, 1,
0.3628263, -0.009010565, 2.561373, 0, 0.03529412, 1, 1,
0.3678826, -1.122594, 3.677178, 0, 0.02745098, 1, 1,
0.3685247, 1.180506, 1.12928, 0, 0.02352941, 1, 1,
0.3706649, -1.8584, 1.917387, 0, 0.01568628, 1, 1,
0.3732353, 1.414272, 1.514276, 0, 0.01176471, 1, 1,
0.3771476, -0.1259262, 2.81002, 0, 0.003921569, 1, 1,
0.3824134, 0.6120507, -0.05491351, 0.003921569, 0, 1, 1,
0.3878297, 0.8730717, -2.43103, 0.007843138, 0, 1, 1,
0.387928, 0.6083224, 0.001937114, 0.01568628, 0, 1, 1,
0.3914079, 0.07676595, 1.403107, 0.01960784, 0, 1, 1,
0.394503, 0.3047207, 0.3640642, 0.02745098, 0, 1, 1,
0.3976874, 0.7012566, -1.258676, 0.03137255, 0, 1, 1,
0.4060897, 0.166561, 2.329983, 0.03921569, 0, 1, 1,
0.4133768, 1.334928, 1.845286, 0.04313726, 0, 1, 1,
0.4154126, -0.5250132, 2.306896, 0.05098039, 0, 1, 1,
0.4186573, 0.125201, 2.125712, 0.05490196, 0, 1, 1,
0.4239327, 0.323815, 0.2387095, 0.0627451, 0, 1, 1,
0.4245697, -0.2118772, 4.130559, 0.06666667, 0, 1, 1,
0.4248873, 0.4546098, 0.5381246, 0.07450981, 0, 1, 1,
0.4293566, 2.064706, -1.229469, 0.07843138, 0, 1, 1,
0.4314656, -0.8224975, 2.08394, 0.08627451, 0, 1, 1,
0.4368598, -0.5579387, 2.716743, 0.09019608, 0, 1, 1,
0.4474814, -1.713323, 3.026066, 0.09803922, 0, 1, 1,
0.4478755, 0.2951419, -0.123621, 0.1058824, 0, 1, 1,
0.4503665, 0.54607, 0.9373377, 0.1098039, 0, 1, 1,
0.4513523, -0.5231965, 2.706612, 0.1176471, 0, 1, 1,
0.4607634, 0.4481592, 0.9714352, 0.1215686, 0, 1, 1,
0.4660571, -1.020042, 1.519962, 0.1294118, 0, 1, 1,
0.4856721, 1.152929, 0.5890579, 0.1333333, 0, 1, 1,
0.486866, -7.041354e-05, 0.4857805, 0.1411765, 0, 1, 1,
0.4881825, 0.7403376, 1.418407, 0.145098, 0, 1, 1,
0.4940138, -0.7574723, 1.310088, 0.1529412, 0, 1, 1,
0.5025615, -0.6670078, 2.756283, 0.1568628, 0, 1, 1,
0.5139223, -0.9487485, 1.298197, 0.1647059, 0, 1, 1,
0.5146471, -1.256569, 2.468912, 0.1686275, 0, 1, 1,
0.5214592, 1.149495, 0.3553325, 0.1764706, 0, 1, 1,
0.5218206, -0.2620967, 1.79132, 0.1803922, 0, 1, 1,
0.5282587, -0.2358966, 1.522643, 0.1882353, 0, 1, 1,
0.5325761, 0.4424384, 2.250936, 0.1921569, 0, 1, 1,
0.5359631, 0.869729, 1.880374, 0.2, 0, 1, 1,
0.5394395, -0.6634751, 3.362264, 0.2078431, 0, 1, 1,
0.5418248, -2.003512, 2.233346, 0.2117647, 0, 1, 1,
0.5463943, 0.2793934, 1.524116, 0.2196078, 0, 1, 1,
0.5471123, -0.3010946, 0.6818084, 0.2235294, 0, 1, 1,
0.5499932, -0.8732536, 3.339515, 0.2313726, 0, 1, 1,
0.550525, -1.821255, 1.907927, 0.2352941, 0, 1, 1,
0.5508174, -0.5015035, 2.97013, 0.2431373, 0, 1, 1,
0.5550238, -0.283839, 0.9684395, 0.2470588, 0, 1, 1,
0.5577273, -1.520675, 2.039666, 0.254902, 0, 1, 1,
0.5580142, 0.93497, -0.7362673, 0.2588235, 0, 1, 1,
0.5586572, 0.7951337, 0.8468393, 0.2666667, 0, 1, 1,
0.5685468, 0.5711089, 1.53051, 0.2705882, 0, 1, 1,
0.5729614, -0.2351481, 1.59823, 0.2784314, 0, 1, 1,
0.5730094, 0.3345552, 0.9916524, 0.282353, 0, 1, 1,
0.5734749, -0.7474806, 0.6523439, 0.2901961, 0, 1, 1,
0.5743302, 0.3577565, 1.88622, 0.2941177, 0, 1, 1,
0.5763924, 0.9108247, 0.1742439, 0.3019608, 0, 1, 1,
0.5780997, -0.8461556, 1.443752, 0.3098039, 0, 1, 1,
0.5787671, -0.01532532, 3.578118, 0.3137255, 0, 1, 1,
0.5825303, -1.386752, 1.810909, 0.3215686, 0, 1, 1,
0.5839198, -0.1853485, 3.42145, 0.3254902, 0, 1, 1,
0.5881369, 0.8369647, 1.554455, 0.3333333, 0, 1, 1,
0.590582, -0.1336591, 1.914967, 0.3372549, 0, 1, 1,
0.5968469, -0.8671103, 2.203959, 0.345098, 0, 1, 1,
0.6075674, 0.5231765, 1.439874, 0.3490196, 0, 1, 1,
0.6098238, 1.719557, 1.640932, 0.3568628, 0, 1, 1,
0.6116852, 0.2473493, 1.780488, 0.3607843, 0, 1, 1,
0.6144374, -1.215161, 2.965338, 0.3686275, 0, 1, 1,
0.6185176, 0.2423302, 2.66843, 0.372549, 0, 1, 1,
0.6225619, -0.4231609, 1.514312, 0.3803922, 0, 1, 1,
0.6258923, 0.3411572, 1.929168, 0.3843137, 0, 1, 1,
0.6296275, 0.530383, -0.1948111, 0.3921569, 0, 1, 1,
0.6313606, -0.714247, 3.935073, 0.3960784, 0, 1, 1,
0.6412497, -0.3886057, 2.813835, 0.4039216, 0, 1, 1,
0.6435493, 0.9187304, 1.415463, 0.4117647, 0, 1, 1,
0.6438807, -1.688756, 3.128744, 0.4156863, 0, 1, 1,
0.6502619, 0.3314914, 1.878027, 0.4235294, 0, 1, 1,
0.6518209, -0.1169264, 2.698714, 0.427451, 0, 1, 1,
0.6563953, 0.2074636, 3.298289, 0.4352941, 0, 1, 1,
0.6639004, 0.5674257, 0.1937504, 0.4392157, 0, 1, 1,
0.6647477, -1.940214, 2.646876, 0.4470588, 0, 1, 1,
0.6672283, -0.1972284, 2.013656, 0.4509804, 0, 1, 1,
0.6695737, -0.6992738, 1.876031, 0.4588235, 0, 1, 1,
0.6752772, -0.8392944, 1.31619, 0.4627451, 0, 1, 1,
0.6782807, 1.424426, 0.4673461, 0.4705882, 0, 1, 1,
0.6792231, 0.2845892, 0.8264027, 0.4745098, 0, 1, 1,
0.6830286, 2.269157, -1.059757, 0.4823529, 0, 1, 1,
0.6831847, 0.454619, 1.076286, 0.4862745, 0, 1, 1,
0.6856965, 0.1976798, 0.5311389, 0.4941176, 0, 1, 1,
0.6858671, -2.026071, 2.453316, 0.5019608, 0, 1, 1,
0.6865469, 0.7271893, 0.1786374, 0.5058824, 0, 1, 1,
0.6867137, 0.1307015, 0.8487335, 0.5137255, 0, 1, 1,
0.6880623, -0.06268372, 1.233925, 0.5176471, 0, 1, 1,
0.6931636, 0.065946, 1.535591, 0.5254902, 0, 1, 1,
0.6985065, 0.4756606, 1.416291, 0.5294118, 0, 1, 1,
0.7035839, 0.05322133, 0.8280387, 0.5372549, 0, 1, 1,
0.7073816, -2.075829, 2.180549, 0.5411765, 0, 1, 1,
0.7100075, 0.6414795, 0.8327363, 0.5490196, 0, 1, 1,
0.7101353, -0.2668176, 2.557413, 0.5529412, 0, 1, 1,
0.7102849, 0.2187667, 1.901617, 0.5607843, 0, 1, 1,
0.7128686, -1.909612, 2.267851, 0.5647059, 0, 1, 1,
0.7129069, -1.389524, 3.365991, 0.572549, 0, 1, 1,
0.7131649, -1.369538, 2.313294, 0.5764706, 0, 1, 1,
0.7179766, -0.4106647, 1.214449, 0.5843138, 0, 1, 1,
0.719069, 0.924793, 1.364662, 0.5882353, 0, 1, 1,
0.7213249, 1.100068, 1.226703, 0.5960785, 0, 1, 1,
0.722413, 0.853239, -0.1026897, 0.6039216, 0, 1, 1,
0.7234418, 0.3739495, 0.03698, 0.6078432, 0, 1, 1,
0.7236074, -0.3471822, 2.108561, 0.6156863, 0, 1, 1,
0.7315048, -0.3151668, 1.337358, 0.6196079, 0, 1, 1,
0.7455778, 2.474593, -0.4046593, 0.627451, 0, 1, 1,
0.7502283, -1.148799, 2.773633, 0.6313726, 0, 1, 1,
0.7517755, -1.237279, 2.518167, 0.6392157, 0, 1, 1,
0.7528188, 2.289042, -0.3827914, 0.6431373, 0, 1, 1,
0.7572451, 0.4848209, 1.410115, 0.6509804, 0, 1, 1,
0.7572854, 0.4614942, 2.314498, 0.654902, 0, 1, 1,
0.763919, -0.6609716, 2.45845, 0.6627451, 0, 1, 1,
0.768926, 0.5770054, -1.169247, 0.6666667, 0, 1, 1,
0.7695427, -0.9473509, 3.851839, 0.6745098, 0, 1, 1,
0.7700689, -2.234577, 3.236572, 0.6784314, 0, 1, 1,
0.7731558, 1.64208, 3.107309, 0.6862745, 0, 1, 1,
0.7795964, 0.7528819, -0.2535473, 0.6901961, 0, 1, 1,
0.7843875, -1.520397, 4.012441, 0.6980392, 0, 1, 1,
0.7921357, 0.1093701, 0.8088829, 0.7058824, 0, 1, 1,
0.7924266, 0.2991744, 0.1701209, 0.7098039, 0, 1, 1,
0.7947763, 1.084596, 1.172067, 0.7176471, 0, 1, 1,
0.7955308, -0.7231386, 2.061849, 0.7215686, 0, 1, 1,
0.7964658, 0.9149143, 1.506811, 0.7294118, 0, 1, 1,
0.8004965, 1.356215, 1.951456, 0.7333333, 0, 1, 1,
0.8005515, -0.05306027, 1.040714, 0.7411765, 0, 1, 1,
0.80255, -0.04868006, 2.859143, 0.7450981, 0, 1, 1,
0.8059891, 1.411984, 0.2248209, 0.7529412, 0, 1, 1,
0.8079458, 0.8577536, 0.5137388, 0.7568628, 0, 1, 1,
0.8135118, 1.518716, -1.533502, 0.7647059, 0, 1, 1,
0.8177411, 0.4974238, 2.008993, 0.7686275, 0, 1, 1,
0.822395, -0.7762051, 3.927787, 0.7764706, 0, 1, 1,
0.8225812, 0.3834292, 1.735355, 0.7803922, 0, 1, 1,
0.8228, 1.663278, 1.701119, 0.7882353, 0, 1, 1,
0.8242844, 0.3280243, -0.9652553, 0.7921569, 0, 1, 1,
0.8295774, -1.544409, 2.113013, 0.8, 0, 1, 1,
0.8303924, 0.3790971, 1.67167, 0.8078431, 0, 1, 1,
0.8439511, 1.742751, 0.2593547, 0.8117647, 0, 1, 1,
0.8442359, 0.1940845, 1.010048, 0.8196079, 0, 1, 1,
0.8512288, 0.2806801, -1.06957, 0.8235294, 0, 1, 1,
0.8519086, 0.972846, 1.583905, 0.8313726, 0, 1, 1,
0.8538995, -0.6321998, 1.04231, 0.8352941, 0, 1, 1,
0.8563199, -0.09853852, 1.959423, 0.8431373, 0, 1, 1,
0.8600886, -1.498211, 2.348367, 0.8470588, 0, 1, 1,
0.8654773, -0.9443927, 1.773986, 0.854902, 0, 1, 1,
0.8696094, 0.3050227, 1.55663, 0.8588235, 0, 1, 1,
0.8697128, -0.5882629, 1.318101, 0.8666667, 0, 1, 1,
0.8708698, -0.4572017, 4.268383, 0.8705882, 0, 1, 1,
0.8719523, 2.159253, 1.108565, 0.8784314, 0, 1, 1,
0.8722249, 0.6490731, -0.5347995, 0.8823529, 0, 1, 1,
0.8730371, -0.3335588, 1.066475, 0.8901961, 0, 1, 1,
0.8743618, -0.4205374, 0.9625223, 0.8941177, 0, 1, 1,
0.8747959, 1.159156, -0.1774809, 0.9019608, 0, 1, 1,
0.8749482, 0.08724217, 1.376965, 0.9098039, 0, 1, 1,
0.8770818, -0.1572943, 2.711141, 0.9137255, 0, 1, 1,
0.8860012, 0.450814, 1.999763, 0.9215686, 0, 1, 1,
0.8875817, 1.203588, -0.361021, 0.9254902, 0, 1, 1,
0.8881934, 0.3703984, 2.629, 0.9333333, 0, 1, 1,
0.8926289, -0.8390414, 3.17283, 0.9372549, 0, 1, 1,
0.892684, -1.165038, 4.4744, 0.945098, 0, 1, 1,
0.8990726, 0.3927615, 0.5597728, 0.9490196, 0, 1, 1,
0.8994136, -2.380392, 3.1979, 0.9568627, 0, 1, 1,
0.9106719, -0.1320869, 1.686366, 0.9607843, 0, 1, 1,
0.9115127, -0.3816114, 1.928291, 0.9686275, 0, 1, 1,
0.9206302, -0.236437, 2.621198, 0.972549, 0, 1, 1,
0.9254449, -1.016356, 3.627796, 0.9803922, 0, 1, 1,
0.9266967, 1.187033, 2.491712, 0.9843137, 0, 1, 1,
0.9277431, 1.081465, 0.8145968, 0.9921569, 0, 1, 1,
0.9312596, 0.7772777, 1.731066, 0.9960784, 0, 1, 1,
0.9322091, 0.3127331, 1.064989, 1, 0, 0.9960784, 1,
0.9472777, 2.944323, 0.4005451, 1, 0, 0.9882353, 1,
0.9543824, 0.04731625, 0.8967122, 1, 0, 0.9843137, 1,
0.9558359, -0.6341599, 1.721767, 1, 0, 0.9764706, 1,
0.9569688, -0.04222506, 0.1651603, 1, 0, 0.972549, 1,
0.9643359, -0.2675433, 0.808391, 1, 0, 0.9647059, 1,
0.9688142, -2.856728, 2.801231, 1, 0, 0.9607843, 1,
0.9760413, -0.1266961, 2.513074, 1, 0, 0.9529412, 1,
0.9778844, 2.354475, 1.692364, 1, 0, 0.9490196, 1,
0.9824405, 0.9384943, 0.6130323, 1, 0, 0.9411765, 1,
1.011423, 1.146303, 1.476334, 1, 0, 0.9372549, 1,
1.026601, -0.9044995, 1.411137, 1, 0, 0.9294118, 1,
1.029658, 0.952967, 1.92619, 1, 0, 0.9254902, 1,
1.029919, -0.04136524, 0.1865572, 1, 0, 0.9176471, 1,
1.04317, -0.9580591, 2.581145, 1, 0, 0.9137255, 1,
1.043558, 0.5118356, 2.178944, 1, 0, 0.9058824, 1,
1.04397, -0.8044931, 3.328296, 1, 0, 0.9019608, 1,
1.044588, -0.6027095, 2.059735, 1, 0, 0.8941177, 1,
1.048247, 0.5223045, 2.181395, 1, 0, 0.8862745, 1,
1.057311, -0.1194696, 0.630142, 1, 0, 0.8823529, 1,
1.057921, 0.3574622, 1.624249, 1, 0, 0.8745098, 1,
1.05936, -0.5304199, 0.5140796, 1, 0, 0.8705882, 1,
1.062238, 1.498213, 0.3572541, 1, 0, 0.8627451, 1,
1.063149, -0.5636559, 1.206496, 1, 0, 0.8588235, 1,
1.063974, 0.9559692, 0.752538, 1, 0, 0.8509804, 1,
1.067643, -0.4491653, 1.431252, 1, 0, 0.8470588, 1,
1.08143, 0.05026328, 3.520623, 1, 0, 0.8392157, 1,
1.084667, 0.3568193, 1.280969, 1, 0, 0.8352941, 1,
1.088571, 0.1926517, 1.60473, 1, 0, 0.827451, 1,
1.089901, -0.525455, 1.432924, 1, 0, 0.8235294, 1,
1.09018, -0.08376728, 0.6502377, 1, 0, 0.8156863, 1,
1.096698, 0.26162, 1.363915, 1, 0, 0.8117647, 1,
1.102206, 0.5564845, 1.336684, 1, 0, 0.8039216, 1,
1.107759, -0.09983703, 2.157344, 1, 0, 0.7960784, 1,
1.13224, -0.7718111, 1.596445, 1, 0, 0.7921569, 1,
1.135862, 1.776318, 0.8727469, 1, 0, 0.7843137, 1,
1.147288, -0.6165242, 2.415395, 1, 0, 0.7803922, 1,
1.149178, 0.02907498, 0.08296277, 1, 0, 0.772549, 1,
1.156054, 0.4825011, 0.610285, 1, 0, 0.7686275, 1,
1.166215, 1.036931, 1.998394, 1, 0, 0.7607843, 1,
1.16644, -0.1696935, -0.4294364, 1, 0, 0.7568628, 1,
1.169001, -1.308011, 2.584004, 1, 0, 0.7490196, 1,
1.171873, -1.01387, 1.466398, 1, 0, 0.7450981, 1,
1.172164, -1.823542, 2.096781, 1, 0, 0.7372549, 1,
1.184856, 1.042936, 1.878406, 1, 0, 0.7333333, 1,
1.192461, -0.6691498, 2.311015, 1, 0, 0.7254902, 1,
1.201731, -0.515687, 2.093441, 1, 0, 0.7215686, 1,
1.212905, 1.273622, 0.1582093, 1, 0, 0.7137255, 1,
1.216406, 0.5730075, 1.770632, 1, 0, 0.7098039, 1,
1.21937, 0.886182, 0.7154166, 1, 0, 0.7019608, 1,
1.220958, 1.552615, 0.5265014, 1, 0, 0.6941177, 1,
1.223945, 2.255614, 0.7298734, 1, 0, 0.6901961, 1,
1.224486, 0.7374368, 1.540235, 1, 0, 0.682353, 1,
1.23668, -1.089052, 2.569651, 1, 0, 0.6784314, 1,
1.248218, -0.5779537, 2.398728, 1, 0, 0.6705883, 1,
1.25451, 1.337313, 0.1165153, 1, 0, 0.6666667, 1,
1.257237, 0.8044534, 2.122403, 1, 0, 0.6588235, 1,
1.266671, -1.245386, 2.044436, 1, 0, 0.654902, 1,
1.27608, 0.03505826, 1.881637, 1, 0, 0.6470588, 1,
1.276112, 0.5811684, 0.9643651, 1, 0, 0.6431373, 1,
1.276892, 0.7767659, 2.268698, 1, 0, 0.6352941, 1,
1.281957, -0.2401739, 1.876652, 1, 0, 0.6313726, 1,
1.286806, -0.2309161, 1.376314, 1, 0, 0.6235294, 1,
1.288942, -1.87948, 2.931169, 1, 0, 0.6196079, 1,
1.293835, -0.9689105, 1.465773, 1, 0, 0.6117647, 1,
1.295787, 0.6160178, 2.606145, 1, 0, 0.6078432, 1,
1.299764, 1.13029, 0.1948404, 1, 0, 0.6, 1,
1.301439, -0.9777253, 1.848416, 1, 0, 0.5921569, 1,
1.313033, 0.3204648, 1.384596, 1, 0, 0.5882353, 1,
1.314827, 0.01397729, 2.853411, 1, 0, 0.5803922, 1,
1.329728, 0.9793677, 2.052423, 1, 0, 0.5764706, 1,
1.353806, -0.9032267, 1.390227, 1, 0, 0.5686275, 1,
1.354406, -0.6151102, 2.785461, 1, 0, 0.5647059, 1,
1.356656, -1.970038, 0.5147474, 1, 0, 0.5568628, 1,
1.393141, -1.123313, 2.338364, 1, 0, 0.5529412, 1,
1.396384, -0.970593, 1.561204, 1, 0, 0.5450981, 1,
1.39775, 1.476861, 1.663856, 1, 0, 0.5411765, 1,
1.398219, -1.170753, 0.5481943, 1, 0, 0.5333334, 1,
1.401842, 0.7315984, -0.1861488, 1, 0, 0.5294118, 1,
1.406471, 0.2293326, 2.640315, 1, 0, 0.5215687, 1,
1.416031, 0.195575, 1.586606, 1, 0, 0.5176471, 1,
1.418581, 0.7554889, 1.053221, 1, 0, 0.509804, 1,
1.419209, -0.6072869, 1.063294, 1, 0, 0.5058824, 1,
1.435604, -0.3193248, 1.355586, 1, 0, 0.4980392, 1,
1.439981, 0.107071, 3.621086, 1, 0, 0.4901961, 1,
1.44448, 0.5625873, 0.609302, 1, 0, 0.4862745, 1,
1.446461, 0.09770814, 1.280139, 1, 0, 0.4784314, 1,
1.460828, -0.7833136, 2.401693, 1, 0, 0.4745098, 1,
1.465123, 0.3184388, 0.8977877, 1, 0, 0.4666667, 1,
1.467001, 0.4253531, 2.075921, 1, 0, 0.4627451, 1,
1.467135, -1.549416, 0.9044595, 1, 0, 0.454902, 1,
1.484684, -1.001136, 1.244879, 1, 0, 0.4509804, 1,
1.484723, -1.33972, 4.064951, 1, 0, 0.4431373, 1,
1.498081, 1.278553, 0.3375774, 1, 0, 0.4392157, 1,
1.498387, 0.4900371, 1.320729, 1, 0, 0.4313726, 1,
1.511737, -0.9984294, 3.038302, 1, 0, 0.427451, 1,
1.520061, 1.114494, 0.2889865, 1, 0, 0.4196078, 1,
1.521758, 0.2286138, 2.75491, 1, 0, 0.4156863, 1,
1.52857, -2.147014, 3.552776, 1, 0, 0.4078431, 1,
1.529817, -0.2687556, 2.654639, 1, 0, 0.4039216, 1,
1.53472, -1.056866, 1.72498, 1, 0, 0.3960784, 1,
1.538263, -0.6617249, 1.282761, 1, 0, 0.3882353, 1,
1.543643, -1.677873, 3.849661, 1, 0, 0.3843137, 1,
1.544053, 0.4003213, 0.112132, 1, 0, 0.3764706, 1,
1.546487, -0.6107699, 1.867997, 1, 0, 0.372549, 1,
1.556812, 1.151865, 0.2299097, 1, 0, 0.3647059, 1,
1.5573, -0.5181984, 2.262942, 1, 0, 0.3607843, 1,
1.559966, 1.421541, 0.7917321, 1, 0, 0.3529412, 1,
1.567662, 0.4529796, 1.270527, 1, 0, 0.3490196, 1,
1.575143, -1.064471, 3.095819, 1, 0, 0.3411765, 1,
1.61261, 0.9219157, 0.9049026, 1, 0, 0.3372549, 1,
1.633089, 1.188703, 1.012634, 1, 0, 0.3294118, 1,
1.649825, 0.3817415, 1.318006, 1, 0, 0.3254902, 1,
1.652694, 0.1548819, 1.557565, 1, 0, 0.3176471, 1,
1.655927, 0.07521666, 1.060327, 1, 0, 0.3137255, 1,
1.662545, 0.1612031, 0.7121511, 1, 0, 0.3058824, 1,
1.688844, -0.543503, 2.889282, 1, 0, 0.2980392, 1,
1.697596, 0.8290168, 1.607007, 1, 0, 0.2941177, 1,
1.703941, 1.572429, -0.6834497, 1, 0, 0.2862745, 1,
1.720411, 0.6544762, 1.102437, 1, 0, 0.282353, 1,
1.724206, -0.9067864, -0.3757022, 1, 0, 0.2745098, 1,
1.735401, -0.6298099, 2.26627, 1, 0, 0.2705882, 1,
1.764953, 0.4182546, 0.8041964, 1, 0, 0.2627451, 1,
1.791365, -0.1135425, 2.499107, 1, 0, 0.2588235, 1,
1.800336, 0.7680979, 0.8538867, 1, 0, 0.2509804, 1,
1.80178, 0.361107, 2.220285, 1, 0, 0.2470588, 1,
1.803419, -0.07057146, -0.1490104, 1, 0, 0.2392157, 1,
1.804099, 0.1778033, 0.3533258, 1, 0, 0.2352941, 1,
1.815256, -1.343545, 1.681108, 1, 0, 0.227451, 1,
1.846531, -1.076894, 0.780028, 1, 0, 0.2235294, 1,
1.852228, -0.2260016, 2.455278, 1, 0, 0.2156863, 1,
1.856794, -0.3422475, 0.8869584, 1, 0, 0.2117647, 1,
1.863295, -0.6579705, 1.31231, 1, 0, 0.2039216, 1,
1.88476, -0.3847256, 2.682386, 1, 0, 0.1960784, 1,
1.888861, 0.3585826, 1.973342, 1, 0, 0.1921569, 1,
1.892227, -0.8326741, 1.646291, 1, 0, 0.1843137, 1,
1.89586, -2.297994, 1.617242, 1, 0, 0.1803922, 1,
1.91432, 2.898849, 2.765617, 1, 0, 0.172549, 1,
1.916573, 0.8241491, 2.031363, 1, 0, 0.1686275, 1,
1.922907, 0.7551886, -0.5599558, 1, 0, 0.1607843, 1,
1.925977, -0.3621967, 1.713637, 1, 0, 0.1568628, 1,
1.928889, -0.4549162, 2.966134, 1, 0, 0.1490196, 1,
1.937922, 0.2414671, 2.060372, 1, 0, 0.145098, 1,
1.959074, 0.4108143, 0.5535684, 1, 0, 0.1372549, 1,
1.980014, 0.2986262, 0.1572179, 1, 0, 0.1333333, 1,
1.98502, -0.7009856, 1.106589, 1, 0, 0.1254902, 1,
2.024382, 1.750375, 1.157747, 1, 0, 0.1215686, 1,
2.048825, -0.2138795, 1.967269, 1, 0, 0.1137255, 1,
2.100405, -0.2732589, 1.626296, 1, 0, 0.1098039, 1,
2.106739, -0.6898842, 1.913168, 1, 0, 0.1019608, 1,
2.1092, -0.3759761, 3.227557, 1, 0, 0.09411765, 1,
2.121552, -0.2071106, 0.9413666, 1, 0, 0.09019608, 1,
2.13063, 0.4594736, 0.5889644, 1, 0, 0.08235294, 1,
2.177693, 0.08116042, 2.817704, 1, 0, 0.07843138, 1,
2.216422, 0.1193797, 1.545828, 1, 0, 0.07058824, 1,
2.331263, -0.5546805, 1.067087, 1, 0, 0.06666667, 1,
2.338524, -0.1532391, 1.831955, 1, 0, 0.05882353, 1,
2.36473, 0.2063492, 0.9392414, 1, 0, 0.05490196, 1,
2.393708, 0.6382205, 2.508716, 1, 0, 0.04705882, 1,
2.443954, -0.6364367, 0.3385007, 1, 0, 0.04313726, 1,
2.536685, 1.761201, 1.896301, 1, 0, 0.03529412, 1,
2.604315, -1.082558, 2.25133, 1, 0, 0.03137255, 1,
2.617602, 1.426537, 2.056045, 1, 0, 0.02352941, 1,
2.624105, -0.5944518, 0.6070081, 1, 0, 0.01960784, 1,
2.709731, 0.4536904, 2.084279, 1, 0, 0.01176471, 1,
3.869343, 0.2200527, -0.9954864, 1, 0, 0.007843138, 1
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
0.4056773, -3.882358, -8.007815, 0, -0.5, 0.5, 0.5,
0.4056773, -3.882358, -8.007815, 1, -0.5, 0.5, 0.5,
0.4056773, -3.882358, -8.007815, 1, 1.5, 0.5, 0.5,
0.4056773, -3.882358, -8.007815, 0, 1.5, 0.5, 0.5
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
-4.232171, 0.1687288, -8.007815, 0, -0.5, 0.5, 0.5,
-4.232171, 0.1687288, -8.007815, 1, -0.5, 0.5, 0.5,
-4.232171, 0.1687288, -8.007815, 1, 1.5, 0.5, 0.5,
-4.232171, 0.1687288, -8.007815, 0, 1.5, 0.5, 0.5
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
-4.232171, -3.882358, -0.3233349, 0, -0.5, 0.5, 0.5,
-4.232171, -3.882358, -0.3233349, 1, -0.5, 0.5, 0.5,
-4.232171, -3.882358, -0.3233349, 1, 1.5, 0.5, 0.5,
-4.232171, -3.882358, -0.3233349, 0, 1.5, 0.5, 0.5
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
-3, -2.947492, -6.234474,
3, -2.947492, -6.234474,
-3, -2.947492, -6.234474,
-3, -3.103302, -6.530031,
-2, -2.947492, -6.234474,
-2, -3.103302, -6.530031,
-1, -2.947492, -6.234474,
-1, -3.103302, -6.530031,
0, -2.947492, -6.234474,
0, -3.103302, -6.530031,
1, -2.947492, -6.234474,
1, -3.103302, -6.530031,
2, -2.947492, -6.234474,
2, -3.103302, -6.530031,
3, -2.947492, -6.234474,
3, -3.103302, -6.530031
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
-3, -3.414925, -7.121145, 0, -0.5, 0.5, 0.5,
-3, -3.414925, -7.121145, 1, -0.5, 0.5, 0.5,
-3, -3.414925, -7.121145, 1, 1.5, 0.5, 0.5,
-3, -3.414925, -7.121145, 0, 1.5, 0.5, 0.5,
-2, -3.414925, -7.121145, 0, -0.5, 0.5, 0.5,
-2, -3.414925, -7.121145, 1, -0.5, 0.5, 0.5,
-2, -3.414925, -7.121145, 1, 1.5, 0.5, 0.5,
-2, -3.414925, -7.121145, 0, 1.5, 0.5, 0.5,
-1, -3.414925, -7.121145, 0, -0.5, 0.5, 0.5,
-1, -3.414925, -7.121145, 1, -0.5, 0.5, 0.5,
-1, -3.414925, -7.121145, 1, 1.5, 0.5, 0.5,
-1, -3.414925, -7.121145, 0, 1.5, 0.5, 0.5,
0, -3.414925, -7.121145, 0, -0.5, 0.5, 0.5,
0, -3.414925, -7.121145, 1, -0.5, 0.5, 0.5,
0, -3.414925, -7.121145, 1, 1.5, 0.5, 0.5,
0, -3.414925, -7.121145, 0, 1.5, 0.5, 0.5,
1, -3.414925, -7.121145, 0, -0.5, 0.5, 0.5,
1, -3.414925, -7.121145, 1, -0.5, 0.5, 0.5,
1, -3.414925, -7.121145, 1, 1.5, 0.5, 0.5,
1, -3.414925, -7.121145, 0, 1.5, 0.5, 0.5,
2, -3.414925, -7.121145, 0, -0.5, 0.5, 0.5,
2, -3.414925, -7.121145, 1, -0.5, 0.5, 0.5,
2, -3.414925, -7.121145, 1, 1.5, 0.5, 0.5,
2, -3.414925, -7.121145, 0, 1.5, 0.5, 0.5,
3, -3.414925, -7.121145, 0, -0.5, 0.5, 0.5,
3, -3.414925, -7.121145, 1, -0.5, 0.5, 0.5,
3, -3.414925, -7.121145, 1, 1.5, 0.5, 0.5,
3, -3.414925, -7.121145, 0, 1.5, 0.5, 0.5
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
-3.161898, -2, -6.234474,
-3.161898, 3, -6.234474,
-3.161898, -2, -6.234474,
-3.340277, -2, -6.530031,
-3.161898, -1, -6.234474,
-3.340277, -1, -6.530031,
-3.161898, 0, -6.234474,
-3.340277, 0, -6.530031,
-3.161898, 1, -6.234474,
-3.340277, 1, -6.530031,
-3.161898, 2, -6.234474,
-3.340277, 2, -6.530031,
-3.161898, 3, -6.234474,
-3.340277, 3, -6.530031
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
-3.697034, -2, -7.121145, 0, -0.5, 0.5, 0.5,
-3.697034, -2, -7.121145, 1, -0.5, 0.5, 0.5,
-3.697034, -2, -7.121145, 1, 1.5, 0.5, 0.5,
-3.697034, -2, -7.121145, 0, 1.5, 0.5, 0.5,
-3.697034, -1, -7.121145, 0, -0.5, 0.5, 0.5,
-3.697034, -1, -7.121145, 1, -0.5, 0.5, 0.5,
-3.697034, -1, -7.121145, 1, 1.5, 0.5, 0.5,
-3.697034, -1, -7.121145, 0, 1.5, 0.5, 0.5,
-3.697034, 0, -7.121145, 0, -0.5, 0.5, 0.5,
-3.697034, 0, -7.121145, 1, -0.5, 0.5, 0.5,
-3.697034, 0, -7.121145, 1, 1.5, 0.5, 0.5,
-3.697034, 0, -7.121145, 0, 1.5, 0.5, 0.5,
-3.697034, 1, -7.121145, 0, -0.5, 0.5, 0.5,
-3.697034, 1, -7.121145, 1, -0.5, 0.5, 0.5,
-3.697034, 1, -7.121145, 1, 1.5, 0.5, 0.5,
-3.697034, 1, -7.121145, 0, 1.5, 0.5, 0.5,
-3.697034, 2, -7.121145, 0, -0.5, 0.5, 0.5,
-3.697034, 2, -7.121145, 1, -0.5, 0.5, 0.5,
-3.697034, 2, -7.121145, 1, 1.5, 0.5, 0.5,
-3.697034, 2, -7.121145, 0, 1.5, 0.5, 0.5,
-3.697034, 3, -7.121145, 0, -0.5, 0.5, 0.5,
-3.697034, 3, -7.121145, 1, -0.5, 0.5, 0.5,
-3.697034, 3, -7.121145, 1, 1.5, 0.5, 0.5,
-3.697034, 3, -7.121145, 0, 1.5, 0.5, 0.5
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
-3.161898, -2.947492, -6,
-3.161898, -2.947492, 4,
-3.161898, -2.947492, -6,
-3.340277, -3.103302, -6,
-3.161898, -2.947492, -4,
-3.340277, -3.103302, -4,
-3.161898, -2.947492, -2,
-3.340277, -3.103302, -2,
-3.161898, -2.947492, 0,
-3.340277, -3.103302, 0,
-3.161898, -2.947492, 2,
-3.340277, -3.103302, 2,
-3.161898, -2.947492, 4,
-3.340277, -3.103302, 4
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
-3.697034, -3.414925, -6, 0, -0.5, 0.5, 0.5,
-3.697034, -3.414925, -6, 1, -0.5, 0.5, 0.5,
-3.697034, -3.414925, -6, 1, 1.5, 0.5, 0.5,
-3.697034, -3.414925, -6, 0, 1.5, 0.5, 0.5,
-3.697034, -3.414925, -4, 0, -0.5, 0.5, 0.5,
-3.697034, -3.414925, -4, 1, -0.5, 0.5, 0.5,
-3.697034, -3.414925, -4, 1, 1.5, 0.5, 0.5,
-3.697034, -3.414925, -4, 0, 1.5, 0.5, 0.5,
-3.697034, -3.414925, -2, 0, -0.5, 0.5, 0.5,
-3.697034, -3.414925, -2, 1, -0.5, 0.5, 0.5,
-3.697034, -3.414925, -2, 1, 1.5, 0.5, 0.5,
-3.697034, -3.414925, -2, 0, 1.5, 0.5, 0.5,
-3.697034, -3.414925, 0, 0, -0.5, 0.5, 0.5,
-3.697034, -3.414925, 0, 1, -0.5, 0.5, 0.5,
-3.697034, -3.414925, 0, 1, 1.5, 0.5, 0.5,
-3.697034, -3.414925, 0, 0, 1.5, 0.5, 0.5,
-3.697034, -3.414925, 2, 0, -0.5, 0.5, 0.5,
-3.697034, -3.414925, 2, 1, -0.5, 0.5, 0.5,
-3.697034, -3.414925, 2, 1, 1.5, 0.5, 0.5,
-3.697034, -3.414925, 2, 0, 1.5, 0.5, 0.5,
-3.697034, -3.414925, 4, 0, -0.5, 0.5, 0.5,
-3.697034, -3.414925, 4, 1, -0.5, 0.5, 0.5,
-3.697034, -3.414925, 4, 1, 1.5, 0.5, 0.5,
-3.697034, -3.414925, 4, 0, 1.5, 0.5, 0.5
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
-3.161898, -2.947492, -6.234474,
-3.161898, 3.284949, -6.234474,
-3.161898, -2.947492, 5.587804,
-3.161898, 3.284949, 5.587804,
-3.161898, -2.947492, -6.234474,
-3.161898, -2.947492, 5.587804,
-3.161898, 3.284949, -6.234474,
-3.161898, 3.284949, 5.587804,
-3.161898, -2.947492, -6.234474,
3.973253, -2.947492, -6.234474,
-3.161898, -2.947492, 5.587804,
3.973253, -2.947492, 5.587804,
-3.161898, 3.284949, -6.234474,
3.973253, 3.284949, -6.234474,
-3.161898, 3.284949, 5.587804,
3.973253, 3.284949, 5.587804,
3.973253, -2.947492, -6.234474,
3.973253, 3.284949, -6.234474,
3.973253, -2.947492, 5.587804,
3.973253, 3.284949, 5.587804,
3.973253, -2.947492, -6.234474,
3.973253, -2.947492, 5.587804,
3.973253, 3.284949, -6.234474,
3.973253, 3.284949, 5.587804
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
var radius = 8.089761;
var distance = 35.99226;
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
mvMatrix.translate( -0.4056773, -0.1687288, 0.3233349 );
mvMatrix.scale( 1.225876, 1.403432, 0.7398581 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.99226);
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
imidazolidine<-read.table("imidazolidine.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-imidazolidine$V2
```

```
## Error in eval(expr, envir, enclos): object 'imidazolidine' not found
```

```r
y<-imidazolidine$V3
```

```
## Error in eval(expr, envir, enclos): object 'imidazolidine' not found
```

```r
z<-imidazolidine$V4
```

```
## Error in eval(expr, envir, enclos): object 'imidazolidine' not found
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
-3.057988, -0.7136725, 0.3512594, 0, 0, 1, 1, 1,
-2.934634, -0.7595032, -1.065476, 1, 0, 0, 1, 1,
-2.881206, -0.9009122, -2.640539, 1, 0, 0, 1, 1,
-2.870688, -0.7863232, -1.114726, 1, 0, 0, 1, 1,
-2.791267, -1.041298, -3.581506, 1, 0, 0, 1, 1,
-2.733965, -1.600244, -1.87819, 1, 0, 0, 1, 1,
-2.441557, -0.2688742, -3.396128, 0, 0, 0, 1, 1,
-2.296504, 0.7068803, -2.803041, 0, 0, 0, 1, 1,
-2.271346, 0.2958059, -2.272231, 0, 0, 0, 1, 1,
-2.23988, -1.755239, -2.412037, 0, 0, 0, 1, 1,
-2.222055, 0.1259677, -1.012958, 0, 0, 0, 1, 1,
-2.221843, -0.3754992, 0.3674839, 0, 0, 0, 1, 1,
-2.218951, -0.7956851, -2.025897, 0, 0, 0, 1, 1,
-2.209501, -0.1518873, -3.506499, 1, 1, 1, 1, 1,
-2.205475, 0.922847, -2.342268, 1, 1, 1, 1, 1,
-2.190659, 0.7929885, -0.7610413, 1, 1, 1, 1, 1,
-2.144203, 0.4291424, -1.448627, 1, 1, 1, 1, 1,
-2.083008, 0.3891915, -2.642631, 1, 1, 1, 1, 1,
-2.082176, -0.5777538, -2.309718, 1, 1, 1, 1, 1,
-2.079545, 1.764055, -1.660677, 1, 1, 1, 1, 1,
-2.07759, 2.114561, -1.040813, 1, 1, 1, 1, 1,
-2.07666, 0.2596588, -4.106461, 1, 1, 1, 1, 1,
-2.054803, -0.3977724, -1.782744, 1, 1, 1, 1, 1,
-2.042983, 1.138271, 0.2049115, 1, 1, 1, 1, 1,
-2.030998, 1.450032, -2.043405, 1, 1, 1, 1, 1,
-1.999492, -0.4893404, -2.696885, 1, 1, 1, 1, 1,
-1.986757, 0.5853391, -0.07374582, 1, 1, 1, 1, 1,
-1.982518, -1.136451, -1.121055, 1, 1, 1, 1, 1,
-1.977479, 0.4409016, -0.2769975, 0, 0, 1, 1, 1,
-1.97498, -1.592588, -1.611069, 1, 0, 0, 1, 1,
-1.93705, 0.5100932, -0.2140121, 1, 0, 0, 1, 1,
-1.927341, -0.2789685, 0.3232725, 1, 0, 0, 1, 1,
-1.922043, 0.4933111, -1.723175, 1, 0, 0, 1, 1,
-1.891977, 1.209501, -2.568015, 1, 0, 0, 1, 1,
-1.8859, 1.820373, -0.1026974, 0, 0, 0, 1, 1,
-1.87692, 0.07979601, -0.4413142, 0, 0, 0, 1, 1,
-1.867686, 0.5753716, -0.8098468, 0, 0, 0, 1, 1,
-1.856165, -0.2246674, -0.1751948, 0, 0, 0, 1, 1,
-1.853517, -1.516677, -2.333668, 0, 0, 0, 1, 1,
-1.853455, -0.8644109, -3.15006, 0, 0, 0, 1, 1,
-1.849262, -0.5782449, -2.226215, 0, 0, 0, 1, 1,
-1.847571, 0.08477512, -0.7580691, 1, 1, 1, 1, 1,
-1.83255, -0.4600944, -1.900142, 1, 1, 1, 1, 1,
-1.822018, -0.2957304, -0.9532162, 1, 1, 1, 1, 1,
-1.799737, 2.241468, -2.15439, 1, 1, 1, 1, 1,
-1.795892, 0.6021188, -2.096869, 1, 1, 1, 1, 1,
-1.793582, 0.5640343, -2.005665, 1, 1, 1, 1, 1,
-1.789296, 0.6062059, -1.395919, 1, 1, 1, 1, 1,
-1.768166, 0.3647093, -0.7236076, 1, 1, 1, 1, 1,
-1.760961, 0.6299684, -1.859956, 1, 1, 1, 1, 1,
-1.75495, -0.8629032, -1.599731, 1, 1, 1, 1, 1,
-1.731698, 0.09989548, -3.228187, 1, 1, 1, 1, 1,
-1.714213, 0.2312517, -1.088253, 1, 1, 1, 1, 1,
-1.704751, 1.1719, -1.150074, 1, 1, 1, 1, 1,
-1.696434, -0.9022585, -1.839725, 1, 1, 1, 1, 1,
-1.690557, 0.08014482, -0.8710914, 1, 1, 1, 1, 1,
-1.659253, -0.1836264, -1.874194, 0, 0, 1, 1, 1,
-1.657724, -0.1249259, -0.566416, 1, 0, 0, 1, 1,
-1.649993, 0.5405091, -1.590549, 1, 0, 0, 1, 1,
-1.649804, 0.120584, -2.968372, 1, 0, 0, 1, 1,
-1.647435, 0.1013572, -0.7499347, 1, 0, 0, 1, 1,
-1.643625, -0.4598698, -2.448172, 1, 0, 0, 1, 1,
-1.642875, -0.6019737, -0.83341, 0, 0, 0, 1, 1,
-1.630989, -1.723437, -1.703943, 0, 0, 0, 1, 1,
-1.627865, 2.421755, -2.112356, 0, 0, 0, 1, 1,
-1.6153, 0.9836124, 0.1181224, 0, 0, 0, 1, 1,
-1.577769, -1.632079, -3.301691, 0, 0, 0, 1, 1,
-1.572935, -0.4483151, -2.13948, 0, 0, 0, 1, 1,
-1.560365, 1.048574, -0.5896136, 0, 0, 0, 1, 1,
-1.557944, -0.2724236, -0.7169319, 1, 1, 1, 1, 1,
-1.55108, -0.6714512, -0.7851338, 1, 1, 1, 1, 1,
-1.543479, -0.4918562, -2.671635, 1, 1, 1, 1, 1,
-1.530626, 0.1647017, -0.5939395, 1, 1, 1, 1, 1,
-1.525104, 0.2760521, -1.41841, 1, 1, 1, 1, 1,
-1.517079, 0.3947162, -1.719033, 1, 1, 1, 1, 1,
-1.497709, 0.3616658, -3.329318, 1, 1, 1, 1, 1,
-1.49292, -1.228563, -2.35183, 1, 1, 1, 1, 1,
-1.484689, 0.785886, -0.8849962, 1, 1, 1, 1, 1,
-1.477909, 0.1869248, -1.236643, 1, 1, 1, 1, 1,
-1.475329, -0.05664675, -0.2194961, 1, 1, 1, 1, 1,
-1.473399, 1.115991, -0.7036433, 1, 1, 1, 1, 1,
-1.465237, -2.122145, -1.110824, 1, 1, 1, 1, 1,
-1.458399, -0.09390712, -0.7510278, 1, 1, 1, 1, 1,
-1.457366, 1.065508, -1.820862, 1, 1, 1, 1, 1,
-1.44494, -0.7855783, -1.802522, 0, 0, 1, 1, 1,
-1.437961, 0.8689835, -0.305795, 1, 0, 0, 1, 1,
-1.423515, -0.6449988, -3.288273, 1, 0, 0, 1, 1,
-1.420981, -1.192218, -2.290688, 1, 0, 0, 1, 1,
-1.418462, -1.527776, -3.235851, 1, 0, 0, 1, 1,
-1.410694, -2.134179, -2.177157, 1, 0, 0, 1, 1,
-1.402513, -0.2685509, 0.7509842, 0, 0, 0, 1, 1,
-1.393539, 0.04277282, -3.969142, 0, 0, 0, 1, 1,
-1.391674, 1.339972, -1.055169, 0, 0, 0, 1, 1,
-1.387839, 0.6026455, -0.6850798, 0, 0, 0, 1, 1,
-1.364995, -0.4669982, -0.5045127, 0, 0, 0, 1, 1,
-1.364311, 0.1249207, -3.196854, 0, 0, 0, 1, 1,
-1.36054, -0.8081407, -1.535578, 0, 0, 0, 1, 1,
-1.359401, 1.216143, -1.427032, 1, 1, 1, 1, 1,
-1.357798, -0.2270028, -2.184565, 1, 1, 1, 1, 1,
-1.347923, 0.2779845, -0.7721226, 1, 1, 1, 1, 1,
-1.342917, 0.1267753, -0.7143428, 1, 1, 1, 1, 1,
-1.333272, -0.787952, -2.208714, 1, 1, 1, 1, 1,
-1.330773, -0.2779812, -2.614349, 1, 1, 1, 1, 1,
-1.330344, 0.01997582, -1.669899, 1, 1, 1, 1, 1,
-1.327924, 0.673396, -2.631725, 1, 1, 1, 1, 1,
-1.321636, 0.08016729, -3.481773, 1, 1, 1, 1, 1,
-1.319741, 1.242321, -1.96454, 1, 1, 1, 1, 1,
-1.313507, 0.4976968, -0.6297327, 1, 1, 1, 1, 1,
-1.308328, -1.230535, -1.568733, 1, 1, 1, 1, 1,
-1.295993, -1.964169, -3.328954, 1, 1, 1, 1, 1,
-1.288094, -0.7224486, -1.669712, 1, 1, 1, 1, 1,
-1.284761, -0.6176761, -0.1030012, 1, 1, 1, 1, 1,
-1.273329, 0.7807574, -0.06509908, 0, 0, 1, 1, 1,
-1.258996, -0.5332214, -2.538574, 1, 0, 0, 1, 1,
-1.255959, 1.447983, -1.225393, 1, 0, 0, 1, 1,
-1.255236, 1.058107, 0.1809041, 1, 0, 0, 1, 1,
-1.251416, 0.8531367, 0.0790804, 1, 0, 0, 1, 1,
-1.246774, -0.1094695, -0.6973614, 1, 0, 0, 1, 1,
-1.244603, 0.1829678, -2.064827, 0, 0, 0, 1, 1,
-1.243705, -0.3993132, -1.367418, 0, 0, 0, 1, 1,
-1.241504, -1.082843, -0.6107646, 0, 0, 0, 1, 1,
-1.217109, -0.5294682, -1.464415, 0, 0, 0, 1, 1,
-1.215553, 1.203828, -0.5069284, 0, 0, 0, 1, 1,
-1.21503, -0.9225841, -1.651926, 0, 0, 0, 1, 1,
-1.214524, -1.418249, -1.810136, 0, 0, 0, 1, 1,
-1.211857, 1.406201, -0.6305801, 1, 1, 1, 1, 1,
-1.203922, -0.9790204, 0.370021, 1, 1, 1, 1, 1,
-1.201897, -0.8425522, -0.789956, 1, 1, 1, 1, 1,
-1.200792, 0.1244684, -4.182688, 1, 1, 1, 1, 1,
-1.199383, -1.050804, -3.013953, 1, 1, 1, 1, 1,
-1.196129, -0.9646204, -1.183218, 1, 1, 1, 1, 1,
-1.19024, -1.102634, -1.089638, 1, 1, 1, 1, 1,
-1.185158, -1.102106, -3.025351, 1, 1, 1, 1, 1,
-1.184583, 0.2024103, -1.395907, 1, 1, 1, 1, 1,
-1.183762, -0.1074749, -2.339688, 1, 1, 1, 1, 1,
-1.178247, 0.05046874, -1.640951, 1, 1, 1, 1, 1,
-1.177835, 0.4159219, -1.169399, 1, 1, 1, 1, 1,
-1.1775, 0.3529103, -2.312989, 1, 1, 1, 1, 1,
-1.172187, 0.5240799, 0.4542307, 1, 1, 1, 1, 1,
-1.165823, 0.7683704, -1.84685, 1, 1, 1, 1, 1,
-1.151921, 0.5616956, -0.9600983, 0, 0, 1, 1, 1,
-1.151594, -1.859305, -0.4720781, 1, 0, 0, 1, 1,
-1.14687, 1.477102, 0.2741209, 1, 0, 0, 1, 1,
-1.143034, 0.7425147, -0.9736366, 1, 0, 0, 1, 1,
-1.142119, 1.917196, 0.06407406, 1, 0, 0, 1, 1,
-1.141117, -0.3128076, -2.425966, 1, 0, 0, 1, 1,
-1.139433, 0.1540606, -2.598728, 0, 0, 0, 1, 1,
-1.135182, -0.3641193, -2.179977, 0, 0, 0, 1, 1,
-1.132565, -2.279468, -3.585609, 0, 0, 0, 1, 1,
-1.132274, -0.1858284, -1.720204, 0, 0, 0, 1, 1,
-1.125295, -0.8322096, -0.2580363, 0, 0, 0, 1, 1,
-1.108067, 2.508982, -1.011752, 0, 0, 0, 1, 1,
-1.103267, 1.178097, -0.9011736, 0, 0, 0, 1, 1,
-1.090378, -0.7768576, -3.830819, 1, 1, 1, 1, 1,
-1.08697, 0.1126823, -2.29196, 1, 1, 1, 1, 1,
-1.085531, 0.574046, -0.1689189, 1, 1, 1, 1, 1,
-1.084938, -0.5027452, -0.7252416, 1, 1, 1, 1, 1,
-1.083736, 1.60421, -1.931621, 1, 1, 1, 1, 1,
-1.074512, -0.3884806, -1.02195, 1, 1, 1, 1, 1,
-1.056601, 0.6895151, -1.417237, 1, 1, 1, 1, 1,
-1.050515, -1.245131, -3.597994, 1, 1, 1, 1, 1,
-1.046836, 1.597494, -0.2211719, 1, 1, 1, 1, 1,
-1.045173, 0.02626707, 0.5319834, 1, 1, 1, 1, 1,
-1.044175, -0.6043363, -3.220041, 1, 1, 1, 1, 1,
-1.038783, -1.831352, -1.857695, 1, 1, 1, 1, 1,
-1.038711, -0.5972496, -3.380394, 1, 1, 1, 1, 1,
-1.032733, -0.3313337, -1.473683, 1, 1, 1, 1, 1,
-1.0273, -0.5300094, -2.347772, 1, 1, 1, 1, 1,
-1.023929, -0.05513969, -0.9212126, 0, 0, 1, 1, 1,
-1.022703, -0.7589406, -2.894366, 1, 0, 0, 1, 1,
-1.022265, 0.5436159, -1.926074, 1, 0, 0, 1, 1,
-1.021877, -1.285104, -3.136329, 1, 0, 0, 1, 1,
-1.018101, -1.277241, -2.70665, 1, 0, 0, 1, 1,
-1.015124, 1.732307, -1.504479, 1, 0, 0, 1, 1,
-1.01156, 0.6627705, -0.2956253, 0, 0, 0, 1, 1,
-1.01038, -1.460422, -3.179263, 0, 0, 0, 1, 1,
-1.008162, 0.5417994, -0.3138888, 0, 0, 0, 1, 1,
-1.002196, -1.09278, -1.279413, 0, 0, 0, 1, 1,
-1.001052, -1.513581, -2.909006, 0, 0, 0, 1, 1,
-1.000347, 0.1937728, 0.2044068, 0, 0, 0, 1, 1,
-0.9981164, -0.9929257, -1.283828, 0, 0, 0, 1, 1,
-0.9949819, -1.08047, -2.307353, 1, 1, 1, 1, 1,
-0.9934789, -1.807243, -1.738083, 1, 1, 1, 1, 1,
-0.9894331, -0.02802035, -0.2271222, 1, 1, 1, 1, 1,
-0.9868141, 0.6943274, 0.5107636, 1, 1, 1, 1, 1,
-0.9826186, 0.5417328, -2.354865, 1, 1, 1, 1, 1,
-0.9716446, 1.226997, -1.352411, 1, 1, 1, 1, 1,
-0.9608762, 2.003143, -0.5918915, 1, 1, 1, 1, 1,
-0.950298, -0.5295715, -3.290223, 1, 1, 1, 1, 1,
-0.9390101, -0.9289094, -2.673385, 1, 1, 1, 1, 1,
-0.9382149, -1.839886, -4.239391, 1, 1, 1, 1, 1,
-0.9363323, -0.3672915, -1.354692, 1, 1, 1, 1, 1,
-0.9334682, 0.570982, 0.1501833, 1, 1, 1, 1, 1,
-0.9300968, 0.9395456, -0.0525577, 1, 1, 1, 1, 1,
-0.9186419, -1.063048, 0.03112745, 1, 1, 1, 1, 1,
-0.9128523, -0.781198, -0.7918188, 1, 1, 1, 1, 1,
-0.9116008, -0.87265, -2.407299, 0, 0, 1, 1, 1,
-0.9071944, -0.908148, -2.626204, 1, 0, 0, 1, 1,
-0.9066964, -0.3150526, -3.094836, 1, 0, 0, 1, 1,
-0.8903023, -1.493497, -2.557991, 1, 0, 0, 1, 1,
-0.8886484, 0.3487509, -0.8857017, 1, 0, 0, 1, 1,
-0.8869397, -2.148322, -2.211347, 1, 0, 0, 1, 1,
-0.8837323, -1.046912, -1.347918, 0, 0, 0, 1, 1,
-0.8818398, -0.8293275, -2.264334, 0, 0, 0, 1, 1,
-0.8771033, -0.1634136, -2.508791, 0, 0, 0, 1, 1,
-0.8692536, 1.482433, -0.5541761, 0, 0, 0, 1, 1,
-0.8642482, -1.51171, -2.462774, 0, 0, 0, 1, 1,
-0.8614307, 0.3329421, -0.5599586, 0, 0, 0, 1, 1,
-0.8572642, 0.2435427, -1.100252, 0, 0, 0, 1, 1,
-0.8567052, 0.296185, -0.8574083, 1, 1, 1, 1, 1,
-0.8561912, 0.4300685, -0.2173209, 1, 1, 1, 1, 1,
-0.8546173, 1.158264, -1.05622, 1, 1, 1, 1, 1,
-0.8468941, -0.7711237, -0.5278871, 1, 1, 1, 1, 1,
-0.8392222, 0.06440267, -0.3976657, 1, 1, 1, 1, 1,
-0.8346565, 0.3088645, -0.8459527, 1, 1, 1, 1, 1,
-0.8327503, 0.1900599, -0.8804857, 1, 1, 1, 1, 1,
-0.8313087, 1.725481, -2.041505, 1, 1, 1, 1, 1,
-0.8300115, 0.3249417, -1.864189, 1, 1, 1, 1, 1,
-0.8288905, 0.2921122, 0.2142704, 1, 1, 1, 1, 1,
-0.8230126, 1.825488, 0.7553647, 1, 1, 1, 1, 1,
-0.8172083, 0.9163932, -0.02812707, 1, 1, 1, 1, 1,
-0.8142443, -0.473227, -2.061686, 1, 1, 1, 1, 1,
-0.8117642, -0.7416756, -2.851154, 1, 1, 1, 1, 1,
-0.8089749, 0.1339551, -2.08012, 1, 1, 1, 1, 1,
-0.8054347, -0.03186435, -0.474409, 0, 0, 1, 1, 1,
-0.7941474, -0.8727179, -2.050753, 1, 0, 0, 1, 1,
-0.7902766, -0.1176634, -2.23314, 1, 0, 0, 1, 1,
-0.780696, -0.6890461, -2.714602, 1, 0, 0, 1, 1,
-0.779646, 1.602017, 1.57846, 1, 0, 0, 1, 1,
-0.7785738, -0.3322429, -3.491769, 1, 0, 0, 1, 1,
-0.7770843, 1.905002, -1.476453, 0, 0, 0, 1, 1,
-0.7745282, 0.4851035, -1.139804, 0, 0, 0, 1, 1,
-0.774192, 0.8929447, 0.7702141, 0, 0, 0, 1, 1,
-0.7720479, 1.094636, -1.98516, 0, 0, 0, 1, 1,
-0.7612089, -0.3686804, -1.641457, 0, 0, 0, 1, 1,
-0.7571767, -0.5060061, -1.589454, 0, 0, 0, 1, 1,
-0.7475547, -0.5454511, -2.608126, 0, 0, 0, 1, 1,
-0.741147, 0.7707614, -0.1948987, 1, 1, 1, 1, 1,
-0.7307366, -1.047532, -3.287941, 1, 1, 1, 1, 1,
-0.7303298, 0.6423309, -1.550424, 1, 1, 1, 1, 1,
-0.7295622, 0.817589, -2.518386, 1, 1, 1, 1, 1,
-0.721162, 0.001198854, -2.13781, 1, 1, 1, 1, 1,
-0.7196328, -1.143954, -2.816145, 1, 1, 1, 1, 1,
-0.7190594, 0.09801129, -2.970994, 1, 1, 1, 1, 1,
-0.7172228, 1.399349, 0.2760748, 1, 1, 1, 1, 1,
-0.7169997, 0.8136839, -1.071561, 1, 1, 1, 1, 1,
-0.7133566, -0.6778346, -1.379787, 1, 1, 1, 1, 1,
-0.712165, -0.8297523, -1.017326, 1, 1, 1, 1, 1,
-0.7058578, 0.8037944, 0.3402637, 1, 1, 1, 1, 1,
-0.7049589, -0.01713156, -2.388717, 1, 1, 1, 1, 1,
-0.7009881, -0.3233581, -1.481129, 1, 1, 1, 1, 1,
-0.6950932, -0.4160534, -2.181938, 1, 1, 1, 1, 1,
-0.6890288, 0.4794919, 1.463922, 0, 0, 1, 1, 1,
-0.6772227, 1.627424, -0.8752192, 1, 0, 0, 1, 1,
-0.6723577, -1.527131, -1.410702, 1, 0, 0, 1, 1,
-0.6702462, -0.6373082, -2.135877, 1, 0, 0, 1, 1,
-0.6681921, -0.08919318, -1.633237, 1, 0, 0, 1, 1,
-0.6639213, 0.1323676, -2.496541, 1, 0, 0, 1, 1,
-0.6510488, -0.6512522, -1.748794, 0, 0, 0, 1, 1,
-0.6420609, 0.9303451, -2.204604, 0, 0, 0, 1, 1,
-0.6400895, 0.2580671, -1.24382, 0, 0, 0, 1, 1,
-0.6369973, -0.4759721, -1.409685, 0, 0, 0, 1, 1,
-0.6335857, -1.847692, -4.207688, 0, 0, 0, 1, 1,
-0.6329108, -1.551341, -2.677334, 0, 0, 0, 1, 1,
-0.631794, 0.2169179, -0.5694066, 0, 0, 0, 1, 1,
-0.6314514, -0.4563689, -2.444314, 1, 1, 1, 1, 1,
-0.6268576, 0.6305463, -2.798648, 1, 1, 1, 1, 1,
-0.6231679, 0.282169, -1.915458, 1, 1, 1, 1, 1,
-0.6192992, 1.570224, 0.6862322, 1, 1, 1, 1, 1,
-0.6192752, 1.469771, -1.202657, 1, 1, 1, 1, 1,
-0.6113771, 0.3374149, -1.787631, 1, 1, 1, 1, 1,
-0.6099818, -0.09828067, -0.9484757, 1, 1, 1, 1, 1,
-0.6077051, -0.5193193, -3.315109, 1, 1, 1, 1, 1,
-0.6059797, -1.976497, -2.210015, 1, 1, 1, 1, 1,
-0.6056874, -0.6088197, -1.304179, 1, 1, 1, 1, 1,
-0.6028813, -0.1738703, -1.937319, 1, 1, 1, 1, 1,
-0.6006969, -0.1328235, -0.8037165, 1, 1, 1, 1, 1,
-0.6002141, 1.392936, -0.5492263, 1, 1, 1, 1, 1,
-0.599407, 1.783144, -0.5110418, 1, 1, 1, 1, 1,
-0.5965208, 0.9296071, 0.5457823, 1, 1, 1, 1, 1,
-0.5936916, 2.792365, -0.1213667, 0, 0, 1, 1, 1,
-0.591849, -1.049144, -2.852265, 1, 0, 0, 1, 1,
-0.5873945, -1.44248, -2.811303, 1, 0, 0, 1, 1,
-0.5863425, 0.4186539, -1.225368, 1, 0, 0, 1, 1,
-0.5846016, 0.4244069, -3.620256, 1, 0, 0, 1, 1,
-0.5807853, -1.751413, -1.474525, 1, 0, 0, 1, 1,
-0.5736589, -0.3286769, -3.629748, 0, 0, 0, 1, 1,
-0.5731531, 0.3076664, -2.302091, 0, 0, 0, 1, 1,
-0.57008, -0.2228441, -2.787841, 0, 0, 0, 1, 1,
-0.5676761, 1.634548, 1.332515, 0, 0, 0, 1, 1,
-0.5663113, 0.02159141, -1.761974, 0, 0, 0, 1, 1,
-0.5609556, 0.2260198, -1.399901, 0, 0, 0, 1, 1,
-0.5596772, -0.6084526, -1.855527, 0, 0, 0, 1, 1,
-0.5563484, 0.494524, 0.30712, 1, 1, 1, 1, 1,
-0.5554014, 1.549098, 0.08347271, 1, 1, 1, 1, 1,
-0.5537337, 1.037262, -0.8456649, 1, 1, 1, 1, 1,
-0.5502504, -0.1911149, -2.923305, 1, 1, 1, 1, 1,
-0.5487425, 1.45559, -0.939153, 1, 1, 1, 1, 1,
-0.5425199, -0.139031, -2.596857, 1, 1, 1, 1, 1,
-0.5408272, 0.2536643, -0.5118755, 1, 1, 1, 1, 1,
-0.5388471, -1.081207, -3.372706, 1, 1, 1, 1, 1,
-0.5384524, -0.1746572, -0.6021938, 1, 1, 1, 1, 1,
-0.5366291, -1.314523, -3.195366, 1, 1, 1, 1, 1,
-0.5364997, 0.7006341, -0.3607645, 1, 1, 1, 1, 1,
-0.5348573, 0.3687404, -0.5287287, 1, 1, 1, 1, 1,
-0.5294616, 0.4076443, -1.385746, 1, 1, 1, 1, 1,
-0.5266117, -1.654817, -2.786059, 1, 1, 1, 1, 1,
-0.5261371, 0.5760719, 1.384297, 1, 1, 1, 1, 1,
-0.5254387, 1.541326, -1.613818, 0, 0, 1, 1, 1,
-0.5233719, 0.7442148, -0.8971472, 1, 0, 0, 1, 1,
-0.5209408, 1.373186, 0.1532782, 1, 0, 0, 1, 1,
-0.5199876, -0.9142878, -2.296062, 1, 0, 0, 1, 1,
-0.5168704, -1.806694, -1.33514, 1, 0, 0, 1, 1,
-0.5167014, -0.391012, -2.100176, 1, 0, 0, 1, 1,
-0.5155382, 0.8966614, 0.9072354, 0, 0, 0, 1, 1,
-0.5152588, 0.6252896, -2.363201, 0, 0, 0, 1, 1,
-0.5102525, 2.107976, -1.35282, 0, 0, 0, 1, 1,
-0.5060737, 0.1387773, -1.174055, 0, 0, 0, 1, 1,
-0.5007777, 1.405651, 0.913853, 0, 0, 0, 1, 1,
-0.4981612, -0.4296944, -1.493377, 0, 0, 0, 1, 1,
-0.4945546, 0.857226, -0.1750673, 0, 0, 0, 1, 1,
-0.4865309, 0.1370201, -0.5438896, 1, 1, 1, 1, 1,
-0.4863828, 0.632785, 0.4740337, 1, 1, 1, 1, 1,
-0.4863794, 0.4663593, -1.97023, 1, 1, 1, 1, 1,
-0.4822094, 1.631868, -2.155287, 1, 1, 1, 1, 1,
-0.4817686, 1.524354, -2.133657, 1, 1, 1, 1, 1,
-0.4768206, -0.5821579, -3.718822, 1, 1, 1, 1, 1,
-0.4743471, 0.2668795, -2.517812, 1, 1, 1, 1, 1,
-0.4727578, 1.698804, 0.08456548, 1, 1, 1, 1, 1,
-0.4710456, 1.191675, -0.2523414, 1, 1, 1, 1, 1,
-0.4709298, 1.036426, 0.03223603, 1, 1, 1, 1, 1,
-0.4707856, -2.063854, -2.977364, 1, 1, 1, 1, 1,
-0.4661857, 0.5893979, -0.8437002, 1, 1, 1, 1, 1,
-0.4652234, -0.34728, -3.060405, 1, 1, 1, 1, 1,
-0.4638482, 1.030685, -1.119027, 1, 1, 1, 1, 1,
-0.4631673, 1.17667, 0.5264102, 1, 1, 1, 1, 1,
-0.457604, -1.532161, -0.5629695, 0, 0, 1, 1, 1,
-0.4519702, 0.7555569, -0.112833, 1, 0, 0, 1, 1,
-0.4519317, 1.149416, -0.22491, 1, 0, 0, 1, 1,
-0.4469371, 0.2896977, 0.1214837, 1, 0, 0, 1, 1,
-0.4214161, 1.229223, -0.6300107, 1, 0, 0, 1, 1,
-0.4205246, 1.190647, -2.113366, 1, 0, 0, 1, 1,
-0.4141127, -0.134891, -1.189733, 0, 0, 0, 1, 1,
-0.4128327, 1.611521, 0.1412989, 0, 0, 0, 1, 1,
-0.4087344, 0.9971949, 1.477209, 0, 0, 0, 1, 1,
-0.4073078, 1.053083, 0.1220865, 0, 0, 0, 1, 1,
-0.3966083, 0.6094421, -0.4626878, 0, 0, 0, 1, 1,
-0.3965519, -0.008546563, -1.707948, 0, 0, 0, 1, 1,
-0.3962996, 0.2742372, -2.060958, 0, 0, 0, 1, 1,
-0.3929261, 0.3598212, 1.028751, 1, 1, 1, 1, 1,
-0.3906679, 0.3988939, -0.07050284, 1, 1, 1, 1, 1,
-0.3891415, 0.777016, -0.00969179, 1, 1, 1, 1, 1,
-0.3880257, 0.223227, -2.199054, 1, 1, 1, 1, 1,
-0.3842181, -0.9321778, -4.476151, 1, 1, 1, 1, 1,
-0.381859, -0.3468879, -2.580746, 1, 1, 1, 1, 1,
-0.381503, -0.6030534, -0.7322512, 1, 1, 1, 1, 1,
-0.3788002, -1.012049, -2.930113, 1, 1, 1, 1, 1,
-0.3748594, 0.8522044, -0.2848257, 1, 1, 1, 1, 1,
-0.3735739, -0.8493146, -2.844916, 1, 1, 1, 1, 1,
-0.372742, -0.07196701, -2.138612, 1, 1, 1, 1, 1,
-0.3724087, 0.4426316, 1.492199, 1, 1, 1, 1, 1,
-0.3701328, -0.1324309, -1.46816, 1, 1, 1, 1, 1,
-0.3680304, -0.2224959, -2.838995, 1, 1, 1, 1, 1,
-0.3676194, -1.045438, -3.596292, 1, 1, 1, 1, 1,
-0.3621822, 0.5254003, -0.1825322, 0, 0, 1, 1, 1,
-0.3600277, -1.217809, -4.097315, 1, 0, 0, 1, 1,
-0.3578292, 0.0607723, -1.449127, 1, 0, 0, 1, 1,
-0.3553165, -0.1141246, -0.7722998, 1, 0, 0, 1, 1,
-0.3464114, 1.339248, 0.9482306, 1, 0, 0, 1, 1,
-0.3413498, 1.152122, -0.649853, 1, 0, 0, 1, 1,
-0.3399877, -0.006883665, -2.527547, 0, 0, 0, 1, 1,
-0.3393444, 0.0864833, -1.563011, 0, 0, 0, 1, 1,
-0.3355929, 0.7486588, -1.096247, 0, 0, 0, 1, 1,
-0.3347912, -1.388983, -3.541566, 0, 0, 0, 1, 1,
-0.3296983, 1.175112, 0.4290501, 0, 0, 0, 1, 1,
-0.3265812, 0.03957814, -0.2394236, 0, 0, 0, 1, 1,
-0.3252621, 1.268485, 0.226621, 0, 0, 0, 1, 1,
-0.3233295, -0.01937692, -0.6052124, 1, 1, 1, 1, 1,
-0.3219211, 0.3242979, 1.15643, 1, 1, 1, 1, 1,
-0.3218829, -0.2245588, -1.044542, 1, 1, 1, 1, 1,
-0.3209904, 0.5780736, -1.803607, 1, 1, 1, 1, 1,
-0.3202222, 1.303321, -1.635239, 1, 1, 1, 1, 1,
-0.3200296, -0.7666044, -2.563256, 1, 1, 1, 1, 1,
-0.3140693, -1.045068, -1.672113, 1, 1, 1, 1, 1,
-0.3120051, 0.345348, -3.218624, 1, 1, 1, 1, 1,
-0.3115275, -0.2919883, 0.1745105, 1, 1, 1, 1, 1,
-0.310749, -0.375878, -1.338353, 1, 1, 1, 1, 1,
-0.3100499, 1.167007, 2.030225, 1, 1, 1, 1, 1,
-0.3089464, 1.301898, 1.22881, 1, 1, 1, 1, 1,
-0.307528, 1.932491, -0.5828501, 1, 1, 1, 1, 1,
-0.2995614, 1.252265, 0.3957492, 1, 1, 1, 1, 1,
-0.2973477, -1.572223, -3.958635, 1, 1, 1, 1, 1,
-0.292021, -1.206508, -3.236963, 0, 0, 1, 1, 1,
-0.2906946, -0.795512, -2.755738, 1, 0, 0, 1, 1,
-0.2900031, 0.2724677, -2.03671, 1, 0, 0, 1, 1,
-0.2877667, 0.2629295, -1.600519, 1, 0, 0, 1, 1,
-0.2868075, 1.038395, -0.5232801, 1, 0, 0, 1, 1,
-0.2818171, 1.240203, -1.967714, 1, 0, 0, 1, 1,
-0.2817071, -0.232934, -0.9977731, 0, 0, 0, 1, 1,
-0.2814891, 1.64976, 1.457328, 0, 0, 0, 1, 1,
-0.2811858, 0.4129621, -0.4964138, 0, 0, 0, 1, 1,
-0.2798666, 0.3822298, -0.9736804, 0, 0, 0, 1, 1,
-0.2778538, -0.1970438, -3.222382, 0, 0, 0, 1, 1,
-0.2775508, 0.5296404, 0.5395696, 0, 0, 0, 1, 1,
-0.2752835, -0.3099018, -2.375236, 0, 0, 0, 1, 1,
-0.2730547, -0.6599547, -1.471721, 1, 1, 1, 1, 1,
-0.2698599, 0.2189162, -1.006493, 1, 1, 1, 1, 1,
-0.2680586, -0.2119681, -2.893106, 1, 1, 1, 1, 1,
-0.2620028, 0.01239765, -2.147192, 1, 1, 1, 1, 1,
-0.2586772, -0.01291432, -0.8711053, 1, 1, 1, 1, 1,
-0.2569538, 0.8957812, -0.669439, 1, 1, 1, 1, 1,
-0.2568873, 0.9761381, -0.4646956, 1, 1, 1, 1, 1,
-0.2520387, -0.9047011, -1.695516, 1, 1, 1, 1, 1,
-0.246047, -0.215764, -2.069062, 1, 1, 1, 1, 1,
-0.2457734, -1.735457, -3.125056, 1, 1, 1, 1, 1,
-0.2415781, 1.111799, 0.158031, 1, 1, 1, 1, 1,
-0.2414188, -0.5369142, -2.11409, 1, 1, 1, 1, 1,
-0.2399634, 0.6660467, -0.8670111, 1, 1, 1, 1, 1,
-0.2398245, 0.5606155, 0.156429, 1, 1, 1, 1, 1,
-0.2377696, -1.878124, -4.221907, 1, 1, 1, 1, 1,
-0.2348987, 0.3880938, -0.8350687, 0, 0, 1, 1, 1,
-0.2342891, 0.2661859, -1.301252, 1, 0, 0, 1, 1,
-0.2265985, 1.598478, -0.759692, 1, 0, 0, 1, 1,
-0.2258723, 0.8261351, -1.642501, 1, 0, 0, 1, 1,
-0.2237757, 0.3261916, 0.7376204, 1, 0, 0, 1, 1,
-0.2223662, -0.1489112, -1.829703, 1, 0, 0, 1, 1,
-0.2218743, -0.5081107, -0.6622501, 0, 0, 0, 1, 1,
-0.2213026, 0.5531351, 0.9135744, 0, 0, 0, 1, 1,
-0.2203995, 1.671019, -1.130795, 0, 0, 0, 1, 1,
-0.2158248, -0.2160956, -3.932858, 0, 0, 0, 1, 1,
-0.2083912, -1.042135, -2.188916, 0, 0, 0, 1, 1,
-0.2052209, -0.4798266, -3.565474, 0, 0, 0, 1, 1,
-0.2037209, 0.4095436, -1.370435, 0, 0, 0, 1, 1,
-0.1927298, -0.2073421, -1.662517, 1, 1, 1, 1, 1,
-0.1883778, 1.672803, -0.8900037, 1, 1, 1, 1, 1,
-0.1877951, 0.3473361, -0.5463925, 1, 1, 1, 1, 1,
-0.1821176, -0.8388666, -1.777566, 1, 1, 1, 1, 1,
-0.1810616, 1.927382, -0.6236293, 1, 1, 1, 1, 1,
-0.1785221, 0.3052731, -0.08568215, 1, 1, 1, 1, 1,
-0.1782635, -0.02514046, -1.530995, 1, 1, 1, 1, 1,
-0.1753782, -1.035211, -3.018928, 1, 1, 1, 1, 1,
-0.1713846, -0.192696, -2.148365, 1, 1, 1, 1, 1,
-0.1574166, -0.9482038, -2.593122, 1, 1, 1, 1, 1,
-0.1542369, 2.950158, 0.7909953, 1, 1, 1, 1, 1,
-0.1523724, 2.090676, -1.190641, 1, 1, 1, 1, 1,
-0.1516613, -0.002299624, -1.588761, 1, 1, 1, 1, 1,
-0.1480875, 0.05334036, -1.899836, 1, 1, 1, 1, 1,
-0.1465198, -0.2810442, -3.215494, 1, 1, 1, 1, 1,
-0.1455823, -0.04049938, -0.7920917, 0, 0, 1, 1, 1,
-0.145441, -0.313235, -3.410762, 1, 0, 0, 1, 1,
-0.1432565, 1.467858, -1.103248, 1, 0, 0, 1, 1,
-0.1420681, 0.3049157, -1.26919, 1, 0, 0, 1, 1,
-0.1409733, -0.1110515, -1.273925, 1, 0, 0, 1, 1,
-0.1378988, 0.8442729, 0.09262133, 1, 0, 0, 1, 1,
-0.136885, -1.397472, -3.878608, 0, 0, 0, 1, 1,
-0.1343942, -0.4153841, -2.738329, 0, 0, 0, 1, 1,
-0.1279916, 1.702512, -0.7250404, 0, 0, 0, 1, 1,
-0.1155174, 0.6316674, -1.56101, 0, 0, 0, 1, 1,
-0.1086024, -1.012153, -2.999764, 0, 0, 0, 1, 1,
-0.1047326, -0.3505873, -1.484917, 0, 0, 0, 1, 1,
-0.1030064, -0.3984087, -4.419645, 0, 0, 0, 1, 1,
-0.1010424, 1.133869, 0.6768764, 1, 1, 1, 1, 1,
-0.09998838, -0.07409879, -1.617939, 1, 1, 1, 1, 1,
-0.08723414, -1.681683, -3.46071, 1, 1, 1, 1, 1,
-0.08562085, -0.1881911, -2.666121, 1, 1, 1, 1, 1,
-0.08320263, -0.3248514, -2.388638, 1, 1, 1, 1, 1,
-0.07487454, 0.1865346, -0.7713739, 1, 1, 1, 1, 1,
-0.07392774, -1.708913, -0.5641112, 1, 1, 1, 1, 1,
-0.07267749, 0.05524161, 0.331338, 1, 1, 1, 1, 1,
-0.06828055, -0.1198155, -1.963006, 1, 1, 1, 1, 1,
-0.06814822, -0.657819, -3.597015, 1, 1, 1, 1, 1,
-0.0663674, -1.961563, -4.141634, 1, 1, 1, 1, 1,
-0.06548854, -2.283596, -3.260174, 1, 1, 1, 1, 1,
-0.0652106, -0.5853709, -2.353176, 1, 1, 1, 1, 1,
-0.06232253, -1.93707, -3.003783, 1, 1, 1, 1, 1,
-0.05564107, 0.7480787, -1.216636, 1, 1, 1, 1, 1,
-0.05495065, 0.9754667, 0.9733599, 0, 0, 1, 1, 1,
-0.05475479, -0.8185574, -1.417639, 1, 0, 0, 1, 1,
-0.05454723, 1.656617, -0.1843647, 1, 0, 0, 1, 1,
-0.05342186, -1.3366, -6.062305, 1, 0, 0, 1, 1,
-0.05181427, 1.183155, -0.1938855, 1, 0, 0, 1, 1,
-0.05093358, -0.7959231, -4.558258, 1, 0, 0, 1, 1,
-0.04944864, -0.8648049, -1.589323, 0, 0, 0, 1, 1,
-0.04379221, 1.788333, 0.01619778, 0, 0, 0, 1, 1,
-0.04284493, -0.8168357, -2.63769, 0, 0, 0, 1, 1,
-0.04214179, -0.5435597, -2.294563, 0, 0, 0, 1, 1,
-0.04182824, -0.1019478, -0.2776671, 0, 0, 0, 1, 1,
-0.03892109, -1.138058, -2.093653, 0, 0, 0, 1, 1,
-0.0350412, -0.3978668, -1.985731, 0, 0, 0, 1, 1,
-0.03455808, 1.069536, 0.5181193, 1, 1, 1, 1, 1,
-0.03316919, -1.082735, -2.837579, 1, 1, 1, 1, 1,
-0.02839205, -1.394084, -2.857378, 1, 1, 1, 1, 1,
-0.02513832, -0.3568138, -2.61853, 1, 1, 1, 1, 1,
-0.01794975, 1.058354, 0.5271287, 1, 1, 1, 1, 1,
-0.01414758, -1.724353, -2.007303, 1, 1, 1, 1, 1,
-0.01343168, 0.7640018, 0.3528945, 1, 1, 1, 1, 1,
-0.01343055, 0.3906701, 1.65093, 1, 1, 1, 1, 1,
-0.0129768, 1.25548, 0.5949584, 1, 1, 1, 1, 1,
-0.01230351, 0.4828658, -0.1921515, 1, 1, 1, 1, 1,
-0.01163626, -1.905245, -2.966869, 1, 1, 1, 1, 1,
-0.00930957, 0.05269352, 1.188702, 1, 1, 1, 1, 1,
-0.008716486, 0.2798988, -0.8395014, 1, 1, 1, 1, 1,
-0.008106908, 1.073027, 0.6289704, 1, 1, 1, 1, 1,
-0.005595234, -1.258992, -3.45983, 1, 1, 1, 1, 1,
-0.003709154, 0.2289956, 0.8183625, 0, 0, 1, 1, 1,
0.00239124, 0.7254604, 0.2256359, 1, 0, 0, 1, 1,
0.002420363, -2.454336, 3.306353, 1, 0, 0, 1, 1,
0.003493349, 0.7783665, 0.9700827, 1, 0, 0, 1, 1,
0.00727896, -0.08417359, 2.785824, 1, 0, 0, 1, 1,
0.01056513, 1.01678, 0.9408299, 1, 0, 0, 1, 1,
0.01598238, 0.5251521, -0.978778, 0, 0, 0, 1, 1,
0.01899288, -0.1193424, 2.492557, 0, 0, 0, 1, 1,
0.02028666, 1.140745, -1.678248, 0, 0, 0, 1, 1,
0.02688107, -0.9860532, 3.983332, 0, 0, 0, 1, 1,
0.02909247, -0.06953951, 2.602435, 0, 0, 0, 1, 1,
0.03055467, -0.6091773, 2.591231, 0, 0, 0, 1, 1,
0.03176221, 0.4083483, -1.426477, 0, 0, 0, 1, 1,
0.03182704, -0.119478, 3.017875, 1, 1, 1, 1, 1,
0.03228539, -0.3153812, 3.731067, 1, 1, 1, 1, 1,
0.0336978, 0.8796222, 1.679008, 1, 1, 1, 1, 1,
0.03751299, 1.322375, -0.3123158, 1, 1, 1, 1, 1,
0.03816075, -1.691576, 2.347189, 1, 1, 1, 1, 1,
0.03830483, 1.685934, 0.9348574, 1, 1, 1, 1, 1,
0.04142416, 2.164168, -0.6209412, 1, 1, 1, 1, 1,
0.04472601, 0.2280004, 0.7204785, 1, 1, 1, 1, 1,
0.04544106, 0.06775931, 0.6087683, 1, 1, 1, 1, 1,
0.04711096, -0.280732, 3.594416, 1, 1, 1, 1, 1,
0.04758623, 1.23026, -1.065263, 1, 1, 1, 1, 1,
0.05067021, 0.5520276, -0.5272203, 1, 1, 1, 1, 1,
0.05288846, -0.7405884, 3.351048, 1, 1, 1, 1, 1,
0.05431059, -0.5016835, 1.049873, 1, 1, 1, 1, 1,
0.0595498, -0.83962, 3.311364, 1, 1, 1, 1, 1,
0.06139166, 1.273746, -1.179408, 0, 0, 1, 1, 1,
0.06496915, 0.3138088, 0.6195178, 1, 0, 0, 1, 1,
0.0660029, 0.7348385, -0.01447985, 1, 0, 0, 1, 1,
0.07435126, 0.5586329, 0.2052552, 1, 0, 0, 1, 1,
0.07476297, 1.217689, -0.7205469, 1, 0, 0, 1, 1,
0.07731633, 0.4079164, -0.2528542, 1, 0, 0, 1, 1,
0.07788009, 0.6142981, 1.704206, 0, 0, 0, 1, 1,
0.07980284, -0.2628767, 1.561612, 0, 0, 0, 1, 1,
0.08116338, -1.554892, 3.550203, 0, 0, 0, 1, 1,
0.08206877, 0.0201594, 1.637623, 0, 0, 0, 1, 1,
0.08257104, 1.11519, 0.2564785, 0, 0, 0, 1, 1,
0.0832978, -2.592339, 2.764697, 0, 0, 0, 1, 1,
0.08468507, 1.21405, 1.936436, 0, 0, 0, 1, 1,
0.09216736, -1.403243, 3.004195, 1, 1, 1, 1, 1,
0.09257849, -0.09262957, 1.061647, 1, 1, 1, 1, 1,
0.09290662, -1.310463, 3.223435, 1, 1, 1, 1, 1,
0.09382836, 0.4191435, -0.2750296, 1, 1, 1, 1, 1,
0.1061887, 1.804736, 0.6172426, 1, 1, 1, 1, 1,
0.1068101, 1.069045, 0.8854342, 1, 1, 1, 1, 1,
0.1071571, 2.050574, 0.3354718, 1, 1, 1, 1, 1,
0.1103809, -0.721662, 4.241471, 1, 1, 1, 1, 1,
0.1113062, -0.4937573, 3.688907, 1, 1, 1, 1, 1,
0.1149129, 1.126157, -0.6989065, 1, 1, 1, 1, 1,
0.1157012, 0.1732128, 0.8912225, 1, 1, 1, 1, 1,
0.1164124, -0.5480689, 2.467515, 1, 1, 1, 1, 1,
0.1231345, -0.02242829, 1.357361, 1, 1, 1, 1, 1,
0.1241007, -1.296018, 5.415635, 1, 1, 1, 1, 1,
0.1340565, -2.34059, 2.527251, 1, 1, 1, 1, 1,
0.1388844, 1.372068, 0.9711665, 0, 0, 1, 1, 1,
0.1403017, 0.962826, -0.1815658, 1, 0, 0, 1, 1,
0.1406902, 0.590284, 1.958217, 1, 0, 0, 1, 1,
0.143505, -0.9039859, 2.880878, 1, 0, 0, 1, 1,
0.1436408, -0.08810336, 3.468638, 1, 0, 0, 1, 1,
0.1466117, -0.4501684, 3.849654, 1, 0, 0, 1, 1,
0.1539689, 0.8057061, 0.01070151, 0, 0, 0, 1, 1,
0.1543199, 0.6609338, 1.504803, 0, 0, 0, 1, 1,
0.1544846, -1.135355, 1.342598, 0, 0, 0, 1, 1,
0.1544887, 0.1060712, 3.227675, 0, 0, 0, 1, 1,
0.1547911, 1.282173, -1.491881, 0, 0, 0, 1, 1,
0.1573674, 0.4100078, 0.259769, 0, 0, 0, 1, 1,
0.1576139, -1.10474, 2.704182, 0, 0, 0, 1, 1,
0.1653797, -1.756261, 2.542419, 1, 1, 1, 1, 1,
0.1743489, 0.2484676, -0.06526914, 1, 1, 1, 1, 1,
0.175669, -0.241014, 2.4429, 1, 1, 1, 1, 1,
0.1816785, 0.04308039, 1.014225, 1, 1, 1, 1, 1,
0.1818707, 0.4693135, 0.4630738, 1, 1, 1, 1, 1,
0.1833576, -0.4736495, 2.535524, 1, 1, 1, 1, 1,
0.1864274, -1.027516, 3.49784, 1, 1, 1, 1, 1,
0.1866284, -2.34284, 2.307911, 1, 1, 1, 1, 1,
0.1882599, 0.4080119, -0.4593292, 1, 1, 1, 1, 1,
0.1887462, 0.5349866, 0.6861418, 1, 1, 1, 1, 1,
0.1897744, -0.1759458, 2.030522, 1, 1, 1, 1, 1,
0.1953842, 0.1966421, 0.1277143, 1, 1, 1, 1, 1,
0.1979325, 0.8185576, -0.4065697, 1, 1, 1, 1, 1,
0.1985471, 0.5514125, -0.7102752, 1, 1, 1, 1, 1,
0.2041537, 0.388389, 0.7846602, 1, 1, 1, 1, 1,
0.2068021, -1.235202, 2.040137, 0, 0, 1, 1, 1,
0.2083275, -0.6301624, 4.102835, 1, 0, 0, 1, 1,
0.2141398, -0.4677738, 2.364556, 1, 0, 0, 1, 1,
0.2193908, -1.350656, 2.229789, 1, 0, 0, 1, 1,
0.2200982, 0.08126249, 1.300847, 1, 0, 0, 1, 1,
0.2251269, 1.832016, -0.5559574, 1, 0, 0, 1, 1,
0.2306688, -0.6254874, 2.966721, 0, 0, 0, 1, 1,
0.2341756, -0.08836658, 1.814674, 0, 0, 0, 1, 1,
0.234411, 1.075389, -1.042152, 0, 0, 0, 1, 1,
0.2349886, -0.08419578, 0.154613, 0, 0, 0, 1, 1,
0.2355495, -1.098534, 2.412338, 0, 0, 0, 1, 1,
0.2377294, 0.7586781, 0.9395826, 0, 0, 0, 1, 1,
0.2421462, -1.041145, 3.236387, 0, 0, 0, 1, 1,
0.2427112, -1.499819, 3.080326, 1, 1, 1, 1, 1,
0.246784, 1.543171, 0.3520196, 1, 1, 1, 1, 1,
0.2485068, -0.1723106, 2.123447, 1, 1, 1, 1, 1,
0.2516648, -0.478808, 4.683078, 1, 1, 1, 1, 1,
0.2545222, 0.06877518, 0.1577169, 1, 1, 1, 1, 1,
0.255277, 1.02855, -1.529481, 1, 1, 1, 1, 1,
0.2557029, -0.86681, 2.814341, 1, 1, 1, 1, 1,
0.258407, 0.6800244, 0.4529077, 1, 1, 1, 1, 1,
0.2609611, -0.2614412, 1.087004, 1, 1, 1, 1, 1,
0.2620669, 0.2167534, -0.2757572, 1, 1, 1, 1, 1,
0.2658303, 3.190175, -0.8973128, 1, 1, 1, 1, 1,
0.2675069, -2.310512, 4.912131, 1, 1, 1, 1, 1,
0.2687155, 1.208703, 2.081739, 1, 1, 1, 1, 1,
0.2688831, -0.02391355, 1.103863, 1, 1, 1, 1, 1,
0.2690568, -1.656619, 3.447777, 1, 1, 1, 1, 1,
0.2692173, 0.4820755, 1.274025, 0, 0, 1, 1, 1,
0.2714438, 1.594852, 0.9956461, 1, 0, 0, 1, 1,
0.2741425, 0.5825008, 2.01287, 1, 0, 0, 1, 1,
0.2800284, -0.6558239, 3.884177, 1, 0, 0, 1, 1,
0.2810725, -0.04828643, -0.3296823, 1, 0, 0, 1, 1,
0.2884066, 1.194247, -0.5340332, 1, 0, 0, 1, 1,
0.2884434, 0.09645212, 0.153534, 0, 0, 0, 1, 1,
0.291941, -0.8678492, 2.335747, 0, 0, 0, 1, 1,
0.2988597, -0.5377648, 3.281492, 0, 0, 0, 1, 1,
0.2991819, -0.1027152, 1.015055, 0, 0, 0, 1, 1,
0.2992856, 0.314476, 0.4454225, 0, 0, 0, 1, 1,
0.2997807, -1.096415, 2.178458, 0, 0, 0, 1, 1,
0.3033418, -0.7398525, 3.796161, 0, 0, 0, 1, 1,
0.3046224, 0.02977307, 0.5725518, 1, 1, 1, 1, 1,
0.3072362, -0.4341413, 1.578677, 1, 1, 1, 1, 1,
0.3086053, -2.535379, 1.854874, 1, 1, 1, 1, 1,
0.3091346, 0.05003976, 1.107702, 1, 1, 1, 1, 1,
0.3101181, -0.2865992, 2.669908, 1, 1, 1, 1, 1,
0.3105803, -1.116141, 3.16824, 1, 1, 1, 1, 1,
0.3132614, -1.492847, 2.570622, 1, 1, 1, 1, 1,
0.3154112, 0.9017958, 0.5295742, 1, 1, 1, 1, 1,
0.315481, -0.4688143, 2.991958, 1, 1, 1, 1, 1,
0.3164939, -0.1556705, 2.337676, 1, 1, 1, 1, 1,
0.320099, 0.4012284, 1.04825, 1, 1, 1, 1, 1,
0.3202521, 0.6554398, -0.08973147, 1, 1, 1, 1, 1,
0.3231519, 2.116052, 0.9262617, 1, 1, 1, 1, 1,
0.3242213, 0.1521086, 0.1604412, 1, 1, 1, 1, 1,
0.3265576, -0.2191756, 1.979943, 1, 1, 1, 1, 1,
0.3268839, 0.9010308, -1.488559, 0, 0, 1, 1, 1,
0.3280485, -0.3448545, 2.38213, 1, 0, 0, 1, 1,
0.3297571, 0.2717054, -0.7818124, 1, 0, 0, 1, 1,
0.3320009, -2.25648, 1.651001, 1, 0, 0, 1, 1,
0.344952, 0.9397582, -0.1905004, 1, 0, 0, 1, 1,
0.3471364, 1.658957, -1.005995, 1, 0, 0, 1, 1,
0.347268, 1.329053, 0.02225491, 0, 0, 0, 1, 1,
0.3473076, 0.4868299, 1.060964, 0, 0, 0, 1, 1,
0.3533368, -2.319521, 2.908487, 0, 0, 0, 1, 1,
0.3536126, 3.194185, -1.935066, 0, 0, 0, 1, 1,
0.3537608, -0.2838298, 2.238162, 0, 0, 0, 1, 1,
0.3543276, 0.8936616, -1.267968, 0, 0, 0, 1, 1,
0.3560389, -0.2203661, 4.137983, 0, 0, 0, 1, 1,
0.3561496, 0.1204207, 2.131603, 1, 1, 1, 1, 1,
0.3590969, -0.1693165, 0.3730187, 1, 1, 1, 1, 1,
0.3610464, 0.5082208, 1.237272, 1, 1, 1, 1, 1,
0.3622299, 0.5328119, -0.255283, 1, 1, 1, 1, 1,
0.3628263, -0.009010565, 2.561373, 1, 1, 1, 1, 1,
0.3678826, -1.122594, 3.677178, 1, 1, 1, 1, 1,
0.3685247, 1.180506, 1.12928, 1, 1, 1, 1, 1,
0.3706649, -1.8584, 1.917387, 1, 1, 1, 1, 1,
0.3732353, 1.414272, 1.514276, 1, 1, 1, 1, 1,
0.3771476, -0.1259262, 2.81002, 1, 1, 1, 1, 1,
0.3824134, 0.6120507, -0.05491351, 1, 1, 1, 1, 1,
0.3878297, 0.8730717, -2.43103, 1, 1, 1, 1, 1,
0.387928, 0.6083224, 0.001937114, 1, 1, 1, 1, 1,
0.3914079, 0.07676595, 1.403107, 1, 1, 1, 1, 1,
0.394503, 0.3047207, 0.3640642, 1, 1, 1, 1, 1,
0.3976874, 0.7012566, -1.258676, 0, 0, 1, 1, 1,
0.4060897, 0.166561, 2.329983, 1, 0, 0, 1, 1,
0.4133768, 1.334928, 1.845286, 1, 0, 0, 1, 1,
0.4154126, -0.5250132, 2.306896, 1, 0, 0, 1, 1,
0.4186573, 0.125201, 2.125712, 1, 0, 0, 1, 1,
0.4239327, 0.323815, 0.2387095, 1, 0, 0, 1, 1,
0.4245697, -0.2118772, 4.130559, 0, 0, 0, 1, 1,
0.4248873, 0.4546098, 0.5381246, 0, 0, 0, 1, 1,
0.4293566, 2.064706, -1.229469, 0, 0, 0, 1, 1,
0.4314656, -0.8224975, 2.08394, 0, 0, 0, 1, 1,
0.4368598, -0.5579387, 2.716743, 0, 0, 0, 1, 1,
0.4474814, -1.713323, 3.026066, 0, 0, 0, 1, 1,
0.4478755, 0.2951419, -0.123621, 0, 0, 0, 1, 1,
0.4503665, 0.54607, 0.9373377, 1, 1, 1, 1, 1,
0.4513523, -0.5231965, 2.706612, 1, 1, 1, 1, 1,
0.4607634, 0.4481592, 0.9714352, 1, 1, 1, 1, 1,
0.4660571, -1.020042, 1.519962, 1, 1, 1, 1, 1,
0.4856721, 1.152929, 0.5890579, 1, 1, 1, 1, 1,
0.486866, -7.041354e-05, 0.4857805, 1, 1, 1, 1, 1,
0.4881825, 0.7403376, 1.418407, 1, 1, 1, 1, 1,
0.4940138, -0.7574723, 1.310088, 1, 1, 1, 1, 1,
0.5025615, -0.6670078, 2.756283, 1, 1, 1, 1, 1,
0.5139223, -0.9487485, 1.298197, 1, 1, 1, 1, 1,
0.5146471, -1.256569, 2.468912, 1, 1, 1, 1, 1,
0.5214592, 1.149495, 0.3553325, 1, 1, 1, 1, 1,
0.5218206, -0.2620967, 1.79132, 1, 1, 1, 1, 1,
0.5282587, -0.2358966, 1.522643, 1, 1, 1, 1, 1,
0.5325761, 0.4424384, 2.250936, 1, 1, 1, 1, 1,
0.5359631, 0.869729, 1.880374, 0, 0, 1, 1, 1,
0.5394395, -0.6634751, 3.362264, 1, 0, 0, 1, 1,
0.5418248, -2.003512, 2.233346, 1, 0, 0, 1, 1,
0.5463943, 0.2793934, 1.524116, 1, 0, 0, 1, 1,
0.5471123, -0.3010946, 0.6818084, 1, 0, 0, 1, 1,
0.5499932, -0.8732536, 3.339515, 1, 0, 0, 1, 1,
0.550525, -1.821255, 1.907927, 0, 0, 0, 1, 1,
0.5508174, -0.5015035, 2.97013, 0, 0, 0, 1, 1,
0.5550238, -0.283839, 0.9684395, 0, 0, 0, 1, 1,
0.5577273, -1.520675, 2.039666, 0, 0, 0, 1, 1,
0.5580142, 0.93497, -0.7362673, 0, 0, 0, 1, 1,
0.5586572, 0.7951337, 0.8468393, 0, 0, 0, 1, 1,
0.5685468, 0.5711089, 1.53051, 0, 0, 0, 1, 1,
0.5729614, -0.2351481, 1.59823, 1, 1, 1, 1, 1,
0.5730094, 0.3345552, 0.9916524, 1, 1, 1, 1, 1,
0.5734749, -0.7474806, 0.6523439, 1, 1, 1, 1, 1,
0.5743302, 0.3577565, 1.88622, 1, 1, 1, 1, 1,
0.5763924, 0.9108247, 0.1742439, 1, 1, 1, 1, 1,
0.5780997, -0.8461556, 1.443752, 1, 1, 1, 1, 1,
0.5787671, -0.01532532, 3.578118, 1, 1, 1, 1, 1,
0.5825303, -1.386752, 1.810909, 1, 1, 1, 1, 1,
0.5839198, -0.1853485, 3.42145, 1, 1, 1, 1, 1,
0.5881369, 0.8369647, 1.554455, 1, 1, 1, 1, 1,
0.590582, -0.1336591, 1.914967, 1, 1, 1, 1, 1,
0.5968469, -0.8671103, 2.203959, 1, 1, 1, 1, 1,
0.6075674, 0.5231765, 1.439874, 1, 1, 1, 1, 1,
0.6098238, 1.719557, 1.640932, 1, 1, 1, 1, 1,
0.6116852, 0.2473493, 1.780488, 1, 1, 1, 1, 1,
0.6144374, -1.215161, 2.965338, 0, 0, 1, 1, 1,
0.6185176, 0.2423302, 2.66843, 1, 0, 0, 1, 1,
0.6225619, -0.4231609, 1.514312, 1, 0, 0, 1, 1,
0.6258923, 0.3411572, 1.929168, 1, 0, 0, 1, 1,
0.6296275, 0.530383, -0.1948111, 1, 0, 0, 1, 1,
0.6313606, -0.714247, 3.935073, 1, 0, 0, 1, 1,
0.6412497, -0.3886057, 2.813835, 0, 0, 0, 1, 1,
0.6435493, 0.9187304, 1.415463, 0, 0, 0, 1, 1,
0.6438807, -1.688756, 3.128744, 0, 0, 0, 1, 1,
0.6502619, 0.3314914, 1.878027, 0, 0, 0, 1, 1,
0.6518209, -0.1169264, 2.698714, 0, 0, 0, 1, 1,
0.6563953, 0.2074636, 3.298289, 0, 0, 0, 1, 1,
0.6639004, 0.5674257, 0.1937504, 0, 0, 0, 1, 1,
0.6647477, -1.940214, 2.646876, 1, 1, 1, 1, 1,
0.6672283, -0.1972284, 2.013656, 1, 1, 1, 1, 1,
0.6695737, -0.6992738, 1.876031, 1, 1, 1, 1, 1,
0.6752772, -0.8392944, 1.31619, 1, 1, 1, 1, 1,
0.6782807, 1.424426, 0.4673461, 1, 1, 1, 1, 1,
0.6792231, 0.2845892, 0.8264027, 1, 1, 1, 1, 1,
0.6830286, 2.269157, -1.059757, 1, 1, 1, 1, 1,
0.6831847, 0.454619, 1.076286, 1, 1, 1, 1, 1,
0.6856965, 0.1976798, 0.5311389, 1, 1, 1, 1, 1,
0.6858671, -2.026071, 2.453316, 1, 1, 1, 1, 1,
0.6865469, 0.7271893, 0.1786374, 1, 1, 1, 1, 1,
0.6867137, 0.1307015, 0.8487335, 1, 1, 1, 1, 1,
0.6880623, -0.06268372, 1.233925, 1, 1, 1, 1, 1,
0.6931636, 0.065946, 1.535591, 1, 1, 1, 1, 1,
0.6985065, 0.4756606, 1.416291, 1, 1, 1, 1, 1,
0.7035839, 0.05322133, 0.8280387, 0, 0, 1, 1, 1,
0.7073816, -2.075829, 2.180549, 1, 0, 0, 1, 1,
0.7100075, 0.6414795, 0.8327363, 1, 0, 0, 1, 1,
0.7101353, -0.2668176, 2.557413, 1, 0, 0, 1, 1,
0.7102849, 0.2187667, 1.901617, 1, 0, 0, 1, 1,
0.7128686, -1.909612, 2.267851, 1, 0, 0, 1, 1,
0.7129069, -1.389524, 3.365991, 0, 0, 0, 1, 1,
0.7131649, -1.369538, 2.313294, 0, 0, 0, 1, 1,
0.7179766, -0.4106647, 1.214449, 0, 0, 0, 1, 1,
0.719069, 0.924793, 1.364662, 0, 0, 0, 1, 1,
0.7213249, 1.100068, 1.226703, 0, 0, 0, 1, 1,
0.722413, 0.853239, -0.1026897, 0, 0, 0, 1, 1,
0.7234418, 0.3739495, 0.03698, 0, 0, 0, 1, 1,
0.7236074, -0.3471822, 2.108561, 1, 1, 1, 1, 1,
0.7315048, -0.3151668, 1.337358, 1, 1, 1, 1, 1,
0.7455778, 2.474593, -0.4046593, 1, 1, 1, 1, 1,
0.7502283, -1.148799, 2.773633, 1, 1, 1, 1, 1,
0.7517755, -1.237279, 2.518167, 1, 1, 1, 1, 1,
0.7528188, 2.289042, -0.3827914, 1, 1, 1, 1, 1,
0.7572451, 0.4848209, 1.410115, 1, 1, 1, 1, 1,
0.7572854, 0.4614942, 2.314498, 1, 1, 1, 1, 1,
0.763919, -0.6609716, 2.45845, 1, 1, 1, 1, 1,
0.768926, 0.5770054, -1.169247, 1, 1, 1, 1, 1,
0.7695427, -0.9473509, 3.851839, 1, 1, 1, 1, 1,
0.7700689, -2.234577, 3.236572, 1, 1, 1, 1, 1,
0.7731558, 1.64208, 3.107309, 1, 1, 1, 1, 1,
0.7795964, 0.7528819, -0.2535473, 1, 1, 1, 1, 1,
0.7843875, -1.520397, 4.012441, 1, 1, 1, 1, 1,
0.7921357, 0.1093701, 0.8088829, 0, 0, 1, 1, 1,
0.7924266, 0.2991744, 0.1701209, 1, 0, 0, 1, 1,
0.7947763, 1.084596, 1.172067, 1, 0, 0, 1, 1,
0.7955308, -0.7231386, 2.061849, 1, 0, 0, 1, 1,
0.7964658, 0.9149143, 1.506811, 1, 0, 0, 1, 1,
0.8004965, 1.356215, 1.951456, 1, 0, 0, 1, 1,
0.8005515, -0.05306027, 1.040714, 0, 0, 0, 1, 1,
0.80255, -0.04868006, 2.859143, 0, 0, 0, 1, 1,
0.8059891, 1.411984, 0.2248209, 0, 0, 0, 1, 1,
0.8079458, 0.8577536, 0.5137388, 0, 0, 0, 1, 1,
0.8135118, 1.518716, -1.533502, 0, 0, 0, 1, 1,
0.8177411, 0.4974238, 2.008993, 0, 0, 0, 1, 1,
0.822395, -0.7762051, 3.927787, 0, 0, 0, 1, 1,
0.8225812, 0.3834292, 1.735355, 1, 1, 1, 1, 1,
0.8228, 1.663278, 1.701119, 1, 1, 1, 1, 1,
0.8242844, 0.3280243, -0.9652553, 1, 1, 1, 1, 1,
0.8295774, -1.544409, 2.113013, 1, 1, 1, 1, 1,
0.8303924, 0.3790971, 1.67167, 1, 1, 1, 1, 1,
0.8439511, 1.742751, 0.2593547, 1, 1, 1, 1, 1,
0.8442359, 0.1940845, 1.010048, 1, 1, 1, 1, 1,
0.8512288, 0.2806801, -1.06957, 1, 1, 1, 1, 1,
0.8519086, 0.972846, 1.583905, 1, 1, 1, 1, 1,
0.8538995, -0.6321998, 1.04231, 1, 1, 1, 1, 1,
0.8563199, -0.09853852, 1.959423, 1, 1, 1, 1, 1,
0.8600886, -1.498211, 2.348367, 1, 1, 1, 1, 1,
0.8654773, -0.9443927, 1.773986, 1, 1, 1, 1, 1,
0.8696094, 0.3050227, 1.55663, 1, 1, 1, 1, 1,
0.8697128, -0.5882629, 1.318101, 1, 1, 1, 1, 1,
0.8708698, -0.4572017, 4.268383, 0, 0, 1, 1, 1,
0.8719523, 2.159253, 1.108565, 1, 0, 0, 1, 1,
0.8722249, 0.6490731, -0.5347995, 1, 0, 0, 1, 1,
0.8730371, -0.3335588, 1.066475, 1, 0, 0, 1, 1,
0.8743618, -0.4205374, 0.9625223, 1, 0, 0, 1, 1,
0.8747959, 1.159156, -0.1774809, 1, 0, 0, 1, 1,
0.8749482, 0.08724217, 1.376965, 0, 0, 0, 1, 1,
0.8770818, -0.1572943, 2.711141, 0, 0, 0, 1, 1,
0.8860012, 0.450814, 1.999763, 0, 0, 0, 1, 1,
0.8875817, 1.203588, -0.361021, 0, 0, 0, 1, 1,
0.8881934, 0.3703984, 2.629, 0, 0, 0, 1, 1,
0.8926289, -0.8390414, 3.17283, 0, 0, 0, 1, 1,
0.892684, -1.165038, 4.4744, 0, 0, 0, 1, 1,
0.8990726, 0.3927615, 0.5597728, 1, 1, 1, 1, 1,
0.8994136, -2.380392, 3.1979, 1, 1, 1, 1, 1,
0.9106719, -0.1320869, 1.686366, 1, 1, 1, 1, 1,
0.9115127, -0.3816114, 1.928291, 1, 1, 1, 1, 1,
0.9206302, -0.236437, 2.621198, 1, 1, 1, 1, 1,
0.9254449, -1.016356, 3.627796, 1, 1, 1, 1, 1,
0.9266967, 1.187033, 2.491712, 1, 1, 1, 1, 1,
0.9277431, 1.081465, 0.8145968, 1, 1, 1, 1, 1,
0.9312596, 0.7772777, 1.731066, 1, 1, 1, 1, 1,
0.9322091, 0.3127331, 1.064989, 1, 1, 1, 1, 1,
0.9472777, 2.944323, 0.4005451, 1, 1, 1, 1, 1,
0.9543824, 0.04731625, 0.8967122, 1, 1, 1, 1, 1,
0.9558359, -0.6341599, 1.721767, 1, 1, 1, 1, 1,
0.9569688, -0.04222506, 0.1651603, 1, 1, 1, 1, 1,
0.9643359, -0.2675433, 0.808391, 1, 1, 1, 1, 1,
0.9688142, -2.856728, 2.801231, 0, 0, 1, 1, 1,
0.9760413, -0.1266961, 2.513074, 1, 0, 0, 1, 1,
0.9778844, 2.354475, 1.692364, 1, 0, 0, 1, 1,
0.9824405, 0.9384943, 0.6130323, 1, 0, 0, 1, 1,
1.011423, 1.146303, 1.476334, 1, 0, 0, 1, 1,
1.026601, -0.9044995, 1.411137, 1, 0, 0, 1, 1,
1.029658, 0.952967, 1.92619, 0, 0, 0, 1, 1,
1.029919, -0.04136524, 0.1865572, 0, 0, 0, 1, 1,
1.04317, -0.9580591, 2.581145, 0, 0, 0, 1, 1,
1.043558, 0.5118356, 2.178944, 0, 0, 0, 1, 1,
1.04397, -0.8044931, 3.328296, 0, 0, 0, 1, 1,
1.044588, -0.6027095, 2.059735, 0, 0, 0, 1, 1,
1.048247, 0.5223045, 2.181395, 0, 0, 0, 1, 1,
1.057311, -0.1194696, 0.630142, 1, 1, 1, 1, 1,
1.057921, 0.3574622, 1.624249, 1, 1, 1, 1, 1,
1.05936, -0.5304199, 0.5140796, 1, 1, 1, 1, 1,
1.062238, 1.498213, 0.3572541, 1, 1, 1, 1, 1,
1.063149, -0.5636559, 1.206496, 1, 1, 1, 1, 1,
1.063974, 0.9559692, 0.752538, 1, 1, 1, 1, 1,
1.067643, -0.4491653, 1.431252, 1, 1, 1, 1, 1,
1.08143, 0.05026328, 3.520623, 1, 1, 1, 1, 1,
1.084667, 0.3568193, 1.280969, 1, 1, 1, 1, 1,
1.088571, 0.1926517, 1.60473, 1, 1, 1, 1, 1,
1.089901, -0.525455, 1.432924, 1, 1, 1, 1, 1,
1.09018, -0.08376728, 0.6502377, 1, 1, 1, 1, 1,
1.096698, 0.26162, 1.363915, 1, 1, 1, 1, 1,
1.102206, 0.5564845, 1.336684, 1, 1, 1, 1, 1,
1.107759, -0.09983703, 2.157344, 1, 1, 1, 1, 1,
1.13224, -0.7718111, 1.596445, 0, 0, 1, 1, 1,
1.135862, 1.776318, 0.8727469, 1, 0, 0, 1, 1,
1.147288, -0.6165242, 2.415395, 1, 0, 0, 1, 1,
1.149178, 0.02907498, 0.08296277, 1, 0, 0, 1, 1,
1.156054, 0.4825011, 0.610285, 1, 0, 0, 1, 1,
1.166215, 1.036931, 1.998394, 1, 0, 0, 1, 1,
1.16644, -0.1696935, -0.4294364, 0, 0, 0, 1, 1,
1.169001, -1.308011, 2.584004, 0, 0, 0, 1, 1,
1.171873, -1.01387, 1.466398, 0, 0, 0, 1, 1,
1.172164, -1.823542, 2.096781, 0, 0, 0, 1, 1,
1.184856, 1.042936, 1.878406, 0, 0, 0, 1, 1,
1.192461, -0.6691498, 2.311015, 0, 0, 0, 1, 1,
1.201731, -0.515687, 2.093441, 0, 0, 0, 1, 1,
1.212905, 1.273622, 0.1582093, 1, 1, 1, 1, 1,
1.216406, 0.5730075, 1.770632, 1, 1, 1, 1, 1,
1.21937, 0.886182, 0.7154166, 1, 1, 1, 1, 1,
1.220958, 1.552615, 0.5265014, 1, 1, 1, 1, 1,
1.223945, 2.255614, 0.7298734, 1, 1, 1, 1, 1,
1.224486, 0.7374368, 1.540235, 1, 1, 1, 1, 1,
1.23668, -1.089052, 2.569651, 1, 1, 1, 1, 1,
1.248218, -0.5779537, 2.398728, 1, 1, 1, 1, 1,
1.25451, 1.337313, 0.1165153, 1, 1, 1, 1, 1,
1.257237, 0.8044534, 2.122403, 1, 1, 1, 1, 1,
1.266671, -1.245386, 2.044436, 1, 1, 1, 1, 1,
1.27608, 0.03505826, 1.881637, 1, 1, 1, 1, 1,
1.276112, 0.5811684, 0.9643651, 1, 1, 1, 1, 1,
1.276892, 0.7767659, 2.268698, 1, 1, 1, 1, 1,
1.281957, -0.2401739, 1.876652, 1, 1, 1, 1, 1,
1.286806, -0.2309161, 1.376314, 0, 0, 1, 1, 1,
1.288942, -1.87948, 2.931169, 1, 0, 0, 1, 1,
1.293835, -0.9689105, 1.465773, 1, 0, 0, 1, 1,
1.295787, 0.6160178, 2.606145, 1, 0, 0, 1, 1,
1.299764, 1.13029, 0.1948404, 1, 0, 0, 1, 1,
1.301439, -0.9777253, 1.848416, 1, 0, 0, 1, 1,
1.313033, 0.3204648, 1.384596, 0, 0, 0, 1, 1,
1.314827, 0.01397729, 2.853411, 0, 0, 0, 1, 1,
1.329728, 0.9793677, 2.052423, 0, 0, 0, 1, 1,
1.353806, -0.9032267, 1.390227, 0, 0, 0, 1, 1,
1.354406, -0.6151102, 2.785461, 0, 0, 0, 1, 1,
1.356656, -1.970038, 0.5147474, 0, 0, 0, 1, 1,
1.393141, -1.123313, 2.338364, 0, 0, 0, 1, 1,
1.396384, -0.970593, 1.561204, 1, 1, 1, 1, 1,
1.39775, 1.476861, 1.663856, 1, 1, 1, 1, 1,
1.398219, -1.170753, 0.5481943, 1, 1, 1, 1, 1,
1.401842, 0.7315984, -0.1861488, 1, 1, 1, 1, 1,
1.406471, 0.2293326, 2.640315, 1, 1, 1, 1, 1,
1.416031, 0.195575, 1.586606, 1, 1, 1, 1, 1,
1.418581, 0.7554889, 1.053221, 1, 1, 1, 1, 1,
1.419209, -0.6072869, 1.063294, 1, 1, 1, 1, 1,
1.435604, -0.3193248, 1.355586, 1, 1, 1, 1, 1,
1.439981, 0.107071, 3.621086, 1, 1, 1, 1, 1,
1.44448, 0.5625873, 0.609302, 1, 1, 1, 1, 1,
1.446461, 0.09770814, 1.280139, 1, 1, 1, 1, 1,
1.460828, -0.7833136, 2.401693, 1, 1, 1, 1, 1,
1.465123, 0.3184388, 0.8977877, 1, 1, 1, 1, 1,
1.467001, 0.4253531, 2.075921, 1, 1, 1, 1, 1,
1.467135, -1.549416, 0.9044595, 0, 0, 1, 1, 1,
1.484684, -1.001136, 1.244879, 1, 0, 0, 1, 1,
1.484723, -1.33972, 4.064951, 1, 0, 0, 1, 1,
1.498081, 1.278553, 0.3375774, 1, 0, 0, 1, 1,
1.498387, 0.4900371, 1.320729, 1, 0, 0, 1, 1,
1.511737, -0.9984294, 3.038302, 1, 0, 0, 1, 1,
1.520061, 1.114494, 0.2889865, 0, 0, 0, 1, 1,
1.521758, 0.2286138, 2.75491, 0, 0, 0, 1, 1,
1.52857, -2.147014, 3.552776, 0, 0, 0, 1, 1,
1.529817, -0.2687556, 2.654639, 0, 0, 0, 1, 1,
1.53472, -1.056866, 1.72498, 0, 0, 0, 1, 1,
1.538263, -0.6617249, 1.282761, 0, 0, 0, 1, 1,
1.543643, -1.677873, 3.849661, 0, 0, 0, 1, 1,
1.544053, 0.4003213, 0.112132, 1, 1, 1, 1, 1,
1.546487, -0.6107699, 1.867997, 1, 1, 1, 1, 1,
1.556812, 1.151865, 0.2299097, 1, 1, 1, 1, 1,
1.5573, -0.5181984, 2.262942, 1, 1, 1, 1, 1,
1.559966, 1.421541, 0.7917321, 1, 1, 1, 1, 1,
1.567662, 0.4529796, 1.270527, 1, 1, 1, 1, 1,
1.575143, -1.064471, 3.095819, 1, 1, 1, 1, 1,
1.61261, 0.9219157, 0.9049026, 1, 1, 1, 1, 1,
1.633089, 1.188703, 1.012634, 1, 1, 1, 1, 1,
1.649825, 0.3817415, 1.318006, 1, 1, 1, 1, 1,
1.652694, 0.1548819, 1.557565, 1, 1, 1, 1, 1,
1.655927, 0.07521666, 1.060327, 1, 1, 1, 1, 1,
1.662545, 0.1612031, 0.7121511, 1, 1, 1, 1, 1,
1.688844, -0.543503, 2.889282, 1, 1, 1, 1, 1,
1.697596, 0.8290168, 1.607007, 1, 1, 1, 1, 1,
1.703941, 1.572429, -0.6834497, 0, 0, 1, 1, 1,
1.720411, 0.6544762, 1.102437, 1, 0, 0, 1, 1,
1.724206, -0.9067864, -0.3757022, 1, 0, 0, 1, 1,
1.735401, -0.6298099, 2.26627, 1, 0, 0, 1, 1,
1.764953, 0.4182546, 0.8041964, 1, 0, 0, 1, 1,
1.791365, -0.1135425, 2.499107, 1, 0, 0, 1, 1,
1.800336, 0.7680979, 0.8538867, 0, 0, 0, 1, 1,
1.80178, 0.361107, 2.220285, 0, 0, 0, 1, 1,
1.803419, -0.07057146, -0.1490104, 0, 0, 0, 1, 1,
1.804099, 0.1778033, 0.3533258, 0, 0, 0, 1, 1,
1.815256, -1.343545, 1.681108, 0, 0, 0, 1, 1,
1.846531, -1.076894, 0.780028, 0, 0, 0, 1, 1,
1.852228, -0.2260016, 2.455278, 0, 0, 0, 1, 1,
1.856794, -0.3422475, 0.8869584, 1, 1, 1, 1, 1,
1.863295, -0.6579705, 1.31231, 1, 1, 1, 1, 1,
1.88476, -0.3847256, 2.682386, 1, 1, 1, 1, 1,
1.888861, 0.3585826, 1.973342, 1, 1, 1, 1, 1,
1.892227, -0.8326741, 1.646291, 1, 1, 1, 1, 1,
1.89586, -2.297994, 1.617242, 1, 1, 1, 1, 1,
1.91432, 2.898849, 2.765617, 1, 1, 1, 1, 1,
1.916573, 0.8241491, 2.031363, 1, 1, 1, 1, 1,
1.922907, 0.7551886, -0.5599558, 1, 1, 1, 1, 1,
1.925977, -0.3621967, 1.713637, 1, 1, 1, 1, 1,
1.928889, -0.4549162, 2.966134, 1, 1, 1, 1, 1,
1.937922, 0.2414671, 2.060372, 1, 1, 1, 1, 1,
1.959074, 0.4108143, 0.5535684, 1, 1, 1, 1, 1,
1.980014, 0.2986262, 0.1572179, 1, 1, 1, 1, 1,
1.98502, -0.7009856, 1.106589, 1, 1, 1, 1, 1,
2.024382, 1.750375, 1.157747, 0, 0, 1, 1, 1,
2.048825, -0.2138795, 1.967269, 1, 0, 0, 1, 1,
2.100405, -0.2732589, 1.626296, 1, 0, 0, 1, 1,
2.106739, -0.6898842, 1.913168, 1, 0, 0, 1, 1,
2.1092, -0.3759761, 3.227557, 1, 0, 0, 1, 1,
2.121552, -0.2071106, 0.9413666, 1, 0, 0, 1, 1,
2.13063, 0.4594736, 0.5889644, 0, 0, 0, 1, 1,
2.177693, 0.08116042, 2.817704, 0, 0, 0, 1, 1,
2.216422, 0.1193797, 1.545828, 0, 0, 0, 1, 1,
2.331263, -0.5546805, 1.067087, 0, 0, 0, 1, 1,
2.338524, -0.1532391, 1.831955, 0, 0, 0, 1, 1,
2.36473, 0.2063492, 0.9392414, 0, 0, 0, 1, 1,
2.393708, 0.6382205, 2.508716, 0, 0, 0, 1, 1,
2.443954, -0.6364367, 0.3385007, 1, 1, 1, 1, 1,
2.536685, 1.761201, 1.896301, 1, 1, 1, 1, 1,
2.604315, -1.082558, 2.25133, 1, 1, 1, 1, 1,
2.617602, 1.426537, 2.056045, 1, 1, 1, 1, 1,
2.624105, -0.5944518, 0.6070081, 1, 1, 1, 1, 1,
2.709731, 0.4536904, 2.084279, 1, 1, 1, 1, 1,
3.869343, 0.2200527, -0.9954864, 1, 1, 1, 1, 1
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
var radius = 9.933087;
var distance = 34.88955;
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
mvMatrix.translate( -0.4056773, -0.1687287, 0.3233349 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.88955);
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
