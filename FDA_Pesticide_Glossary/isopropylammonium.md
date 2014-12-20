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
-2.691608, 0.4097364, -0.09164924, 1, 0, 0, 1,
-2.671085, 0.0001490036, -1.895195, 1, 0.007843138, 0, 1,
-2.645371, -0.02041623, -2.621216, 1, 0.01176471, 0, 1,
-2.618438, -2.089907, -0.628723, 1, 0.01960784, 0, 1,
-2.544165, -1.012059, -0.4065417, 1, 0.02352941, 0, 1,
-2.540601, 0.7234459, -1.411722, 1, 0.03137255, 0, 1,
-2.524061, -0.4251888, -0.07289608, 1, 0.03529412, 0, 1,
-2.518987, 1.703159, -0.6194153, 1, 0.04313726, 0, 1,
-2.488752, -1.045706, -2.569358, 1, 0.04705882, 0, 1,
-2.448737, -1.420472, -1.165892, 1, 0.05490196, 0, 1,
-2.445028, -0.02001511, -2.532131, 1, 0.05882353, 0, 1,
-2.439661, -0.7282696, -2.738206, 1, 0.06666667, 0, 1,
-2.344546, 0.1172314, -1.678711, 1, 0.07058824, 0, 1,
-2.318316, -0.7190346, -0.774038, 1, 0.07843138, 0, 1,
-2.299143, -0.2673815, -2.153176, 1, 0.08235294, 0, 1,
-2.268802, -0.5953225, -3.230451, 1, 0.09019608, 0, 1,
-2.219948, 0.2863412, -2.37525, 1, 0.09411765, 0, 1,
-2.107866, -0.09082413, -0.5447773, 1, 0.1019608, 0, 1,
-2.106502, 1.161736, -1.987872, 1, 0.1098039, 0, 1,
-2.101527, -2.078384, -3.497269, 1, 0.1137255, 0, 1,
-2.079802, 0.371689, -1.487757, 1, 0.1215686, 0, 1,
-2.021462, -1.455953, -1.993182, 1, 0.1254902, 0, 1,
-1.988174, -0.7124466, -3.585565, 1, 0.1333333, 0, 1,
-1.984931, 0.4765678, -0.5583174, 1, 0.1372549, 0, 1,
-1.949628, -1.548323, -2.227063, 1, 0.145098, 0, 1,
-1.930807, -1.899296, -1.821136, 1, 0.1490196, 0, 1,
-1.927283, 0.9664411, -1.018191, 1, 0.1568628, 0, 1,
-1.914957, 0.3029665, -0.9153981, 1, 0.1607843, 0, 1,
-1.898129, -0.3035545, -2.541823, 1, 0.1686275, 0, 1,
-1.877164, -0.5637022, -1.428719, 1, 0.172549, 0, 1,
-1.868341, 0.8652477, -1.426484, 1, 0.1803922, 0, 1,
-1.850917, -0.7787866, -2.102955, 1, 0.1843137, 0, 1,
-1.843973, 0.2091297, -2.012136, 1, 0.1921569, 0, 1,
-1.835817, 0.8095587, -1.469447, 1, 0.1960784, 0, 1,
-1.829257, -1.08157, -1.223669, 1, 0.2039216, 0, 1,
-1.825783, 0.1537175, -1.727375, 1, 0.2117647, 0, 1,
-1.79557, 0.2261762, -2.25909, 1, 0.2156863, 0, 1,
-1.792992, -0.9744435, -1.55502, 1, 0.2235294, 0, 1,
-1.786103, 0.975675, -0.208079, 1, 0.227451, 0, 1,
-1.76061, 0.1419027, -2.598704, 1, 0.2352941, 0, 1,
-1.754949, 0.1345232, -2.024292, 1, 0.2392157, 0, 1,
-1.750314, 0.3077522, -2.434702, 1, 0.2470588, 0, 1,
-1.734783, 0.1287402, -2.489939, 1, 0.2509804, 0, 1,
-1.715509, -0.2511143, -1.142239, 1, 0.2588235, 0, 1,
-1.711083, 0.5863827, -2.386615, 1, 0.2627451, 0, 1,
-1.706198, 3.341802, -0.7642173, 1, 0.2705882, 0, 1,
-1.704354, -0.9708691, -1.380069, 1, 0.2745098, 0, 1,
-1.699645, 0.4255971, -2.363408, 1, 0.282353, 0, 1,
-1.696606, -0.7027853, -1.48528, 1, 0.2862745, 0, 1,
-1.695806, -0.01788794, -1.067361, 1, 0.2941177, 0, 1,
-1.692539, -1.123528, -1.297758, 1, 0.3019608, 0, 1,
-1.690365, -0.3595181, -1.772984, 1, 0.3058824, 0, 1,
-1.688313, 1.576112, -0.6576648, 1, 0.3137255, 0, 1,
-1.677716, 0.3668864, -2.179832, 1, 0.3176471, 0, 1,
-1.672475, 0.4671507, -2.661204, 1, 0.3254902, 0, 1,
-1.672358, -0.1685266, 0.7180794, 1, 0.3294118, 0, 1,
-1.651692, -0.5254806, -1.204924, 1, 0.3372549, 0, 1,
-1.642874, 0.9615001, -1.999009, 1, 0.3411765, 0, 1,
-1.635295, 0.5301934, -2.50153, 1, 0.3490196, 0, 1,
-1.62492, 0.1925101, -0.7953304, 1, 0.3529412, 0, 1,
-1.613001, 0.9430957, -2.449942, 1, 0.3607843, 0, 1,
-1.609114, 0.643726, -0.1461908, 1, 0.3647059, 0, 1,
-1.58113, -0.5465802, -1.133315, 1, 0.372549, 0, 1,
-1.579095, -1.33277, -2.616872, 1, 0.3764706, 0, 1,
-1.571237, -0.1723989, -2.689961, 1, 0.3843137, 0, 1,
-1.568413, 1.020515, -1.515773, 1, 0.3882353, 0, 1,
-1.567598, 1.63348, -0.02636763, 1, 0.3960784, 0, 1,
-1.559301, 0.2509064, -3.023644, 1, 0.4039216, 0, 1,
-1.558464, 1.096133, 1.816583, 1, 0.4078431, 0, 1,
-1.550572, 0.1372534, -0.865102, 1, 0.4156863, 0, 1,
-1.542221, 0.5681233, -0.7894043, 1, 0.4196078, 0, 1,
-1.533464, 0.6964239, -1.180642, 1, 0.427451, 0, 1,
-1.526111, -0.3020826, -2.506433, 1, 0.4313726, 0, 1,
-1.525191, 1.34562, -1.114666, 1, 0.4392157, 0, 1,
-1.524535, -0.58047, -1.075967, 1, 0.4431373, 0, 1,
-1.504166, 0.7222663, -1.792335, 1, 0.4509804, 0, 1,
-1.501972, -1.430399, -2.31434, 1, 0.454902, 0, 1,
-1.497842, 0.1368254, -1.803256, 1, 0.4627451, 0, 1,
-1.489239, -0.3718072, -1.44541, 1, 0.4666667, 0, 1,
-1.488385, -0.8811762, -3.977717, 1, 0.4745098, 0, 1,
-1.480585, -0.5474038, -1.247912, 1, 0.4784314, 0, 1,
-1.475752, -0.6853445, -2.889611, 1, 0.4862745, 0, 1,
-1.470009, -0.3216228, -1.375979, 1, 0.4901961, 0, 1,
-1.429157, 0.1528102, -1.257098, 1, 0.4980392, 0, 1,
-1.427325, -0.1075025, -2.765508, 1, 0.5058824, 0, 1,
-1.41225, 2.115489, 0.4010744, 1, 0.509804, 0, 1,
-1.41049, 0.7401908, 0.04619846, 1, 0.5176471, 0, 1,
-1.40863, 0.06799157, -0.0390975, 1, 0.5215687, 0, 1,
-1.395395, -0.1137252, 0.02651484, 1, 0.5294118, 0, 1,
-1.382114, -1.633939, -2.677838, 1, 0.5333334, 0, 1,
-1.372107, -0.1290853, -0.5253707, 1, 0.5411765, 0, 1,
-1.366487, -0.5025159, -1.908089, 1, 0.5450981, 0, 1,
-1.355785, -1.232408, -0.9103775, 1, 0.5529412, 0, 1,
-1.34795, 2.203134, -0.5735548, 1, 0.5568628, 0, 1,
-1.345646, -0.128402, -1.014242, 1, 0.5647059, 0, 1,
-1.335587, -0.573117, -1.001139, 1, 0.5686275, 0, 1,
-1.333315, -0.3070319, 0.6391001, 1, 0.5764706, 0, 1,
-1.330968, 0.299649, -1.933882, 1, 0.5803922, 0, 1,
-1.329349, 0.3305649, -2.832541, 1, 0.5882353, 0, 1,
-1.32159, -2.232385, -2.685396, 1, 0.5921569, 0, 1,
-1.319899, 0.3342846, -1.428255, 1, 0.6, 0, 1,
-1.319875, -2.14843, -1.203793, 1, 0.6078432, 0, 1,
-1.319118, 0.5437368, 0.9951944, 1, 0.6117647, 0, 1,
-1.316933, 1.195467, -1.363303, 1, 0.6196079, 0, 1,
-1.306864, -0.6743357, -1.548883, 1, 0.6235294, 0, 1,
-1.303527, -1.116215, -4.222234, 1, 0.6313726, 0, 1,
-1.293799, -1.506092, -3.629086, 1, 0.6352941, 0, 1,
-1.28398, 0.150504, -2.024782, 1, 0.6431373, 0, 1,
-1.281674, 0.4171617, -2.66431, 1, 0.6470588, 0, 1,
-1.27204, -1.654142, -1.897971, 1, 0.654902, 0, 1,
-1.269961, 0.5699798, -0.3716144, 1, 0.6588235, 0, 1,
-1.26799, -2.017535, -1.605362, 1, 0.6666667, 0, 1,
-1.265646, -0.425775, -0.5740508, 1, 0.6705883, 0, 1,
-1.26139, -1.305988, -1.515491, 1, 0.6784314, 0, 1,
-1.254647, 0.2210279, -1.566876, 1, 0.682353, 0, 1,
-1.249414, -0.3906823, -0.1973738, 1, 0.6901961, 0, 1,
-1.246448, 0.2369662, 0.1826226, 1, 0.6941177, 0, 1,
-1.243158, 0.03142275, -1.296283, 1, 0.7019608, 0, 1,
-1.238417, 0.8152016, -1.112306, 1, 0.7098039, 0, 1,
-1.233692, 0.9006834, -0.8358476, 1, 0.7137255, 0, 1,
-1.224147, -0.8761379, -2.572092, 1, 0.7215686, 0, 1,
-1.223279, -2.083811, -0.1549368, 1, 0.7254902, 0, 1,
-1.217485, 0.785459, -1.301888, 1, 0.7333333, 0, 1,
-1.216067, -0.663986, -3.585905, 1, 0.7372549, 0, 1,
-1.212467, 1.091616, -2.425272, 1, 0.7450981, 0, 1,
-1.210367, -0.7510028, -2.195614, 1, 0.7490196, 0, 1,
-1.20396, -0.126824, 0.5366467, 1, 0.7568628, 0, 1,
-1.199061, -0.1276588, -1.584424, 1, 0.7607843, 0, 1,
-1.189257, 1.301421, -0.9226255, 1, 0.7686275, 0, 1,
-1.186968, 0.9917268, -0.3159494, 1, 0.772549, 0, 1,
-1.185188, 0.9195762, -0.3294543, 1, 0.7803922, 0, 1,
-1.183311, -0.3465408, -1.260785, 1, 0.7843137, 0, 1,
-1.179588, 0.2279916, -1.253182, 1, 0.7921569, 0, 1,
-1.177986, -2.019283, -1.241888, 1, 0.7960784, 0, 1,
-1.176725, -0.3863704, -0.9550998, 1, 0.8039216, 0, 1,
-1.159255, 1.204506, 0.1613668, 1, 0.8117647, 0, 1,
-1.154512, -0.206852, -3.023879, 1, 0.8156863, 0, 1,
-1.151995, 1.117987, -2.657703, 1, 0.8235294, 0, 1,
-1.147197, -0.6976293, -3.458349, 1, 0.827451, 0, 1,
-1.146915, -0.3037023, -2.626164, 1, 0.8352941, 0, 1,
-1.140174, -0.3097955, -0.9922553, 1, 0.8392157, 0, 1,
-1.137305, 0.9475802, -0.5956972, 1, 0.8470588, 0, 1,
-1.134094, 0.6771788, -0.829674, 1, 0.8509804, 0, 1,
-1.126707, -0.7249491, -2.149422, 1, 0.8588235, 0, 1,
-1.115416, -0.5283677, -0.3847438, 1, 0.8627451, 0, 1,
-1.106374, -0.5667555, -2.523365, 1, 0.8705882, 0, 1,
-1.094115, 1.537197, 0.1581291, 1, 0.8745098, 0, 1,
-1.091366, 0.2208226, -2.680824, 1, 0.8823529, 0, 1,
-1.088314, 0.422152, 0.9046132, 1, 0.8862745, 0, 1,
-1.087981, 0.6827221, -1.973027, 1, 0.8941177, 0, 1,
-1.084902, -1.29806, -0.196307, 1, 0.8980392, 0, 1,
-1.080712, 0.9817869, -0.1962139, 1, 0.9058824, 0, 1,
-1.078643, -0.588717, -3.579395, 1, 0.9137255, 0, 1,
-1.075265, -0.7630129, -2.487926, 1, 0.9176471, 0, 1,
-1.069723, 0.9205319, -1.753359, 1, 0.9254902, 0, 1,
-1.062201, 0.4554213, -1.274004, 1, 0.9294118, 0, 1,
-1.060908, 1.155049, 1.876048, 1, 0.9372549, 0, 1,
-1.058312, 0.8847419, -1.018975, 1, 0.9411765, 0, 1,
-1.057298, -0.4616851, -1.367057, 1, 0.9490196, 0, 1,
-1.051633, -0.627511, -2.862656, 1, 0.9529412, 0, 1,
-1.049736, -0.7893836, 0.2238122, 1, 0.9607843, 0, 1,
-1.046451, -0.9197001, -1.332886, 1, 0.9647059, 0, 1,
-1.041671, 0.9827018, 0.197276, 1, 0.972549, 0, 1,
-1.033803, -2.170085, -1.266749, 1, 0.9764706, 0, 1,
-1.033746, -0.557723, -0.01150606, 1, 0.9843137, 0, 1,
-1.023281, -1.361339, -1.694221, 1, 0.9882353, 0, 1,
-1.020376, -0.8779736, -2.382354, 1, 0.9960784, 0, 1,
-1.018573, -0.6585737, -1.842732, 0.9960784, 1, 0, 1,
-1.018086, 0.5057737, 0.9746228, 0.9921569, 1, 0, 1,
-1.0028, -0.3243018, -1.116709, 0.9843137, 1, 0, 1,
-0.9986877, -0.4091547, -1.540954, 0.9803922, 1, 0, 1,
-0.9870219, -0.9278474, -3.141153, 0.972549, 1, 0, 1,
-0.9719434, 0.4288764, -1.756018, 0.9686275, 1, 0, 1,
-0.9718421, -1.416093, -2.517263, 0.9607843, 1, 0, 1,
-0.9629199, -0.3715883, -2.689129, 0.9568627, 1, 0, 1,
-0.9624172, 1.349399, 1.056209, 0.9490196, 1, 0, 1,
-0.9613197, 0.7489131, -0.3943129, 0.945098, 1, 0, 1,
-0.9611672, 0.4174369, -1.364833, 0.9372549, 1, 0, 1,
-0.9577999, -1.254292, -2.05669, 0.9333333, 1, 0, 1,
-0.9570948, -0.6944339, -1.544549, 0.9254902, 1, 0, 1,
-0.9538716, 0.5548857, -1.88166, 0.9215686, 1, 0, 1,
-0.9531285, -0.9175833, -1.734798, 0.9137255, 1, 0, 1,
-0.9507926, -1.976576, -2.598387, 0.9098039, 1, 0, 1,
-0.9485537, 0.2809975, 0.5658626, 0.9019608, 1, 0, 1,
-0.94575, 0.9942276, 0.2700771, 0.8941177, 1, 0, 1,
-0.9451163, 0.3812343, -0.9144011, 0.8901961, 1, 0, 1,
-0.9434075, -0.2327517, -3.091232, 0.8823529, 1, 0, 1,
-0.934232, -1.295172, -3.418212, 0.8784314, 1, 0, 1,
-0.9328147, 0.7351659, -0.5016, 0.8705882, 1, 0, 1,
-0.9299766, -0.2200812, -0.6509296, 0.8666667, 1, 0, 1,
-0.929809, -0.874137, -0.8519678, 0.8588235, 1, 0, 1,
-0.9267962, 0.2461384, -0.4145617, 0.854902, 1, 0, 1,
-0.9173093, -0.247077, -1.65593, 0.8470588, 1, 0, 1,
-0.9170616, -0.2180524, -2.38719, 0.8431373, 1, 0, 1,
-0.9162997, -0.6072924, -1.594716, 0.8352941, 1, 0, 1,
-0.9123003, 0.717577, -0.160921, 0.8313726, 1, 0, 1,
-0.9119805, -0.01590604, -2.058966, 0.8235294, 1, 0, 1,
-0.9081002, -0.8460817, -1.2478, 0.8196079, 1, 0, 1,
-0.9045359, 0.3687119, 0.3619295, 0.8117647, 1, 0, 1,
-0.9043771, 1.900726, -1.674545, 0.8078431, 1, 0, 1,
-0.8985476, -0.4991009, -2.475134, 0.8, 1, 0, 1,
-0.8902193, -1.021122, -3.549285, 0.7921569, 1, 0, 1,
-0.8837946, -1.243111, -2.234905, 0.7882353, 1, 0, 1,
-0.8781006, 0.5035523, -1.363122, 0.7803922, 1, 0, 1,
-0.8739523, -0.1448604, -0.1566677, 0.7764706, 1, 0, 1,
-0.8679104, -1.042192, -1.765048, 0.7686275, 1, 0, 1,
-0.8604395, 0.7587951, -0.9139454, 0.7647059, 1, 0, 1,
-0.8586214, 0.5626565, -0.9549859, 0.7568628, 1, 0, 1,
-0.8556553, 0.816494, -0.08152492, 0.7529412, 1, 0, 1,
-0.8546551, -1.552188, -2.253107, 0.7450981, 1, 0, 1,
-0.8536213, -0.02516505, -2.872981, 0.7411765, 1, 0, 1,
-0.8530151, 0.6509817, -0.5551367, 0.7333333, 1, 0, 1,
-0.8505195, -1.187297, -3.22034, 0.7294118, 1, 0, 1,
-0.848913, -1.020921, -2.373768, 0.7215686, 1, 0, 1,
-0.8456739, 1.015581, -0.3610689, 0.7176471, 1, 0, 1,
-0.8374772, 0.1008565, -1.926336, 0.7098039, 1, 0, 1,
-0.8346315, -0.6229396, -2.702536, 0.7058824, 1, 0, 1,
-0.8276796, -0.2257993, -0.8038362, 0.6980392, 1, 0, 1,
-0.8264071, -0.449468, -2.226252, 0.6901961, 1, 0, 1,
-0.825679, 0.7177149, -2.439225, 0.6862745, 1, 0, 1,
-0.823988, -1.751336, -2.43116, 0.6784314, 1, 0, 1,
-0.8159888, 1.12557, -0.2151956, 0.6745098, 1, 0, 1,
-0.8127121, -0.8366916, -3.920923, 0.6666667, 1, 0, 1,
-0.8120513, -0.07319583, -2.724203, 0.6627451, 1, 0, 1,
-0.8071333, 0.5844852, -2.410422, 0.654902, 1, 0, 1,
-0.8063289, 0.4622237, -0.8641918, 0.6509804, 1, 0, 1,
-0.7981115, 1.525093, -3.520239, 0.6431373, 1, 0, 1,
-0.798063, -0.6301264, -1.367133, 0.6392157, 1, 0, 1,
-0.7967884, -0.2758423, -2.205681, 0.6313726, 1, 0, 1,
-0.7889088, -0.3703097, -2.776635, 0.627451, 1, 0, 1,
-0.7875642, -0.5422235, -1.946358, 0.6196079, 1, 0, 1,
-0.7859399, 0.13585, -1.209592, 0.6156863, 1, 0, 1,
-0.785879, -0.3493528, -0.5814395, 0.6078432, 1, 0, 1,
-0.7804348, -0.7442181, -3.090245, 0.6039216, 1, 0, 1,
-0.7795173, -0.5500852, -2.453018, 0.5960785, 1, 0, 1,
-0.7759437, -0.9040022, -2.43381, 0.5882353, 1, 0, 1,
-0.7706767, -0.1155424, -2.10386, 0.5843138, 1, 0, 1,
-0.7699481, -2.618221, -2.464232, 0.5764706, 1, 0, 1,
-0.7680308, 3.452604, -0.758553, 0.572549, 1, 0, 1,
-0.7677238, 0.1317304, -2.180526, 0.5647059, 1, 0, 1,
-0.7645469, 2.422626, 0.1427233, 0.5607843, 1, 0, 1,
-0.7630885, 0.6016688, -0.8471026, 0.5529412, 1, 0, 1,
-0.7629476, -1.845647, -2.854141, 0.5490196, 1, 0, 1,
-0.7583259, -0.01852416, -2.047348, 0.5411765, 1, 0, 1,
-0.7561648, -1.850093, -3.09335, 0.5372549, 1, 0, 1,
-0.7541685, -0.6259982, -2.23878, 0.5294118, 1, 0, 1,
-0.7534971, 0.846076, -1.161364, 0.5254902, 1, 0, 1,
-0.7491694, 1.561757, -0.5557437, 0.5176471, 1, 0, 1,
-0.7468179, -0.9409405, -1.828182, 0.5137255, 1, 0, 1,
-0.7403343, -1.165151, -3.598603, 0.5058824, 1, 0, 1,
-0.7396175, 0.07583051, -1.123098, 0.5019608, 1, 0, 1,
-0.7394777, -0.9978533, -2.569294, 0.4941176, 1, 0, 1,
-0.7344931, -0.1189236, -1.222204, 0.4862745, 1, 0, 1,
-0.7308024, -0.2069651, -1.489684, 0.4823529, 1, 0, 1,
-0.7242005, -0.07455453, -3.022158, 0.4745098, 1, 0, 1,
-0.7202809, -1.593967, -3.849452, 0.4705882, 1, 0, 1,
-0.7173405, 0.7387533, -1.20453, 0.4627451, 1, 0, 1,
-0.7135143, -1.244828, -2.992587, 0.4588235, 1, 0, 1,
-0.7109729, -1.077134, -2.675101, 0.4509804, 1, 0, 1,
-0.7104567, -0.2968818, -2.857557, 0.4470588, 1, 0, 1,
-0.710213, -1.687035, -2.722789, 0.4392157, 1, 0, 1,
-0.7017589, 2.919172, -0.3377979, 0.4352941, 1, 0, 1,
-0.6995881, -0.7377251, -1.571271, 0.427451, 1, 0, 1,
-0.6944281, 1.197187, -0.624716, 0.4235294, 1, 0, 1,
-0.6912816, 1.534174, -0.521985, 0.4156863, 1, 0, 1,
-0.6861683, -0.2614616, -2.164838, 0.4117647, 1, 0, 1,
-0.6859807, -1.260951, -1.766932, 0.4039216, 1, 0, 1,
-0.6810988, 0.9880906, -0.4440548, 0.3960784, 1, 0, 1,
-0.6751491, -1.391279, -2.624069, 0.3921569, 1, 0, 1,
-0.6708494, -1.482082, -4.535456, 0.3843137, 1, 0, 1,
-0.6682554, -0.3224823, -1.409209, 0.3803922, 1, 0, 1,
-0.6653419, 0.07768948, -1.208103, 0.372549, 1, 0, 1,
-0.6634701, 0.9462854, -0.1895879, 0.3686275, 1, 0, 1,
-0.6630273, 0.2766489, -0.8774374, 0.3607843, 1, 0, 1,
-0.6605833, -0.3139959, -0.9534672, 0.3568628, 1, 0, 1,
-0.6570961, -0.6338431, -1.696396, 0.3490196, 1, 0, 1,
-0.6532766, -0.8184534, -2.792565, 0.345098, 1, 0, 1,
-0.649412, -0.8494204, -2.586218, 0.3372549, 1, 0, 1,
-0.6491347, -0.9305507, -1.662363, 0.3333333, 1, 0, 1,
-0.648922, -0.3970302, -0.4723939, 0.3254902, 1, 0, 1,
-0.6480771, -2.549616, -2.324499, 0.3215686, 1, 0, 1,
-0.6325871, -0.2737838, -0.9023252, 0.3137255, 1, 0, 1,
-0.6265094, -0.8666256, -2.973741, 0.3098039, 1, 0, 1,
-0.626186, -0.4540789, -0.5489726, 0.3019608, 1, 0, 1,
-0.6259563, 0.3131883, -2.051102, 0.2941177, 1, 0, 1,
-0.6253113, 1.81655, -1.455277, 0.2901961, 1, 0, 1,
-0.6204001, -0.806526, -1.902958, 0.282353, 1, 0, 1,
-0.6191875, -0.5706804, -1.898659, 0.2784314, 1, 0, 1,
-0.6191736, -0.3009359, -1.737721, 0.2705882, 1, 0, 1,
-0.617945, 0.6551596, -3.069329, 0.2666667, 1, 0, 1,
-0.616087, 1.198067, 2.235013, 0.2588235, 1, 0, 1,
-0.6153376, -0.6214933, -2.872851, 0.254902, 1, 0, 1,
-0.6145718, 1.916742, -0.1917164, 0.2470588, 1, 0, 1,
-0.6094239, -1.82923, -3.435284, 0.2431373, 1, 0, 1,
-0.6045973, 0.5235526, -2.122908, 0.2352941, 1, 0, 1,
-0.6003464, -0.5462101, -3.442396, 0.2313726, 1, 0, 1,
-0.5979681, 1.130437, -0.09515326, 0.2235294, 1, 0, 1,
-0.5959266, 0.5685883, 1.31684, 0.2196078, 1, 0, 1,
-0.5957698, 1.624042, -2.804127, 0.2117647, 1, 0, 1,
-0.5897558, 0.8763289, 0.4115588, 0.2078431, 1, 0, 1,
-0.5873755, -0.4061391, -0.5657648, 0.2, 1, 0, 1,
-0.5815352, -0.8287581, -2.465422, 0.1921569, 1, 0, 1,
-0.5802215, 1.300964, -0.9326462, 0.1882353, 1, 0, 1,
-0.5761261, 0.3412303, -1.898288, 0.1803922, 1, 0, 1,
-0.5758485, -0.540475, -2.821259, 0.1764706, 1, 0, 1,
-0.57467, 1.721632, -0.4301284, 0.1686275, 1, 0, 1,
-0.5737221, 0.597613, -1.534563, 0.1647059, 1, 0, 1,
-0.5735403, -0.1678676, -2.732189, 0.1568628, 1, 0, 1,
-0.569873, 0.3040781, -1.833004, 0.1529412, 1, 0, 1,
-0.5693595, 1.408192, 0.4367689, 0.145098, 1, 0, 1,
-0.5638441, -0.9269471, -1.693416, 0.1411765, 1, 0, 1,
-0.5637589, -0.7162586, -4.420876, 0.1333333, 1, 0, 1,
-0.5601934, 0.4967951, -0.4646711, 0.1294118, 1, 0, 1,
-0.5580027, 0.6714517, 0.0917875, 0.1215686, 1, 0, 1,
-0.5547149, 1.091648, -0.9727425, 0.1176471, 1, 0, 1,
-0.549684, -0.2578297, -1.634841, 0.1098039, 1, 0, 1,
-0.5475538, -0.2800694, -3.037148, 0.1058824, 1, 0, 1,
-0.5470882, 0.8475873, -0.07182136, 0.09803922, 1, 0, 1,
-0.5403897, -0.110891, -1.976768, 0.09019608, 1, 0, 1,
-0.535948, 1.406453, -1.745844, 0.08627451, 1, 0, 1,
-0.535738, -0.06269548, -1.596982, 0.07843138, 1, 0, 1,
-0.530553, 0.941636, 0.8307603, 0.07450981, 1, 0, 1,
-0.5285912, 1.294083, 1.3979, 0.06666667, 1, 0, 1,
-0.526087, 0.8884367, -0.4034176, 0.0627451, 1, 0, 1,
-0.5246246, 0.8947784, -0.9249469, 0.05490196, 1, 0, 1,
-0.5217142, 1.580233, -0.1813913, 0.05098039, 1, 0, 1,
-0.517566, -2.184989, -1.683393, 0.04313726, 1, 0, 1,
-0.5165243, -0.5477636, -2.343378, 0.03921569, 1, 0, 1,
-0.5147403, 0.811173, 0.1395608, 0.03137255, 1, 0, 1,
-0.5061829, 0.2711558, -1.743576, 0.02745098, 1, 0, 1,
-0.5053573, 0.9234694, -1.035655, 0.01960784, 1, 0, 1,
-0.5048429, 0.8096168, 1.795917, 0.01568628, 1, 0, 1,
-0.504602, -0.5131815, -0.9793677, 0.007843138, 1, 0, 1,
-0.5043896, -1.212555, -2.065138, 0.003921569, 1, 0, 1,
-0.5033928, 0.9074664, -2.689105, 0, 1, 0.003921569, 1,
-0.5019101, 0.3212713, 1.32815, 0, 1, 0.01176471, 1,
-0.5007924, -1.025672, -3.079061, 0, 1, 0.01568628, 1,
-0.4976704, 0.6270905, -1.053284, 0, 1, 0.02352941, 1,
-0.4942362, -0.2227652, -2.717853, 0, 1, 0.02745098, 1,
-0.4940403, 0.4557568, -0.8757201, 0, 1, 0.03529412, 1,
-0.4925182, 0.4878465, -1.563109, 0, 1, 0.03921569, 1,
-0.4891433, -0.6518024, -2.044445, 0, 1, 0.04705882, 1,
-0.4875794, -0.3538875, -1.997749, 0, 1, 0.05098039, 1,
-0.4867681, -0.3440468, -4.259219, 0, 1, 0.05882353, 1,
-0.484909, 0.4564156, -1.148325, 0, 1, 0.0627451, 1,
-0.4794902, 0.04515586, -0.2740641, 0, 1, 0.07058824, 1,
-0.4769475, 0.8544498, -0.1748741, 0, 1, 0.07450981, 1,
-0.4743817, 1.703953, 0.1734056, 0, 1, 0.08235294, 1,
-0.469881, 0.9271899, 0.3419413, 0, 1, 0.08627451, 1,
-0.4690098, 0.2678931, -1.760026, 0, 1, 0.09411765, 1,
-0.4679876, -0.859231, -1.625057, 0, 1, 0.1019608, 1,
-0.4657903, -1.455675, -1.528604, 0, 1, 0.1058824, 1,
-0.4628913, 0.6798267, -0.8973227, 0, 1, 0.1137255, 1,
-0.4627941, 0.1969838, -0.8971027, 0, 1, 0.1176471, 1,
-0.458185, -0.7712892, -1.997239, 0, 1, 0.1254902, 1,
-0.4548425, -0.5032636, -2.766385, 0, 1, 0.1294118, 1,
-0.4548371, -0.3542277, -3.420258, 0, 1, 0.1372549, 1,
-0.4468459, 0.3520047, -0.3928985, 0, 1, 0.1411765, 1,
-0.4465921, -0.3149422, -3.027945, 0, 1, 0.1490196, 1,
-0.4411453, 0.5592647, -1.71971, 0, 1, 0.1529412, 1,
-0.4402208, 0.641169, 0.9566985, 0, 1, 0.1607843, 1,
-0.4398029, -0.1828699, -1.113101, 0, 1, 0.1647059, 1,
-0.4390899, 1.45542, -1.046982, 0, 1, 0.172549, 1,
-0.4335719, 0.658201, -0.4681045, 0, 1, 0.1764706, 1,
-0.4307687, 0.1379983, -0.345508, 0, 1, 0.1843137, 1,
-0.4302035, 1.244694, -0.09595137, 0, 1, 0.1882353, 1,
-0.4274141, 0.3394958, -0.766682, 0, 1, 0.1960784, 1,
-0.4249581, -0.3518057, -1.656536, 0, 1, 0.2039216, 1,
-0.4220316, 1.806762, 0.8750796, 0, 1, 0.2078431, 1,
-0.421414, 0.170001, -0.6451764, 0, 1, 0.2156863, 1,
-0.4196412, 0.2354755, -3.389753, 0, 1, 0.2196078, 1,
-0.4125357, -0.2740096, -3.12263, 0, 1, 0.227451, 1,
-0.4098169, 0.4289004, -1.876332, 0, 1, 0.2313726, 1,
-0.4082103, -0.1522674, -4.119796, 0, 1, 0.2392157, 1,
-0.4072566, 2.047235, 1.046744, 0, 1, 0.2431373, 1,
-0.4065127, -0.6501505, -1.951042, 0, 1, 0.2509804, 1,
-0.4040176, -1.846284, -3.912724, 0, 1, 0.254902, 1,
-0.3996291, 1.299488, -0.687465, 0, 1, 0.2627451, 1,
-0.399547, -0.2861626, -2.524121, 0, 1, 0.2666667, 1,
-0.3938965, -1.268412, -0.6225673, 0, 1, 0.2745098, 1,
-0.393203, -0.4749722, -4.368883, 0, 1, 0.2784314, 1,
-0.3908226, 0.7734271, 0.9190212, 0, 1, 0.2862745, 1,
-0.3904258, -1.532851, -4.20444, 0, 1, 0.2901961, 1,
-0.3890539, -0.09665059, -1.916386, 0, 1, 0.2980392, 1,
-0.3833162, -0.9737961, -3.732687, 0, 1, 0.3058824, 1,
-0.3818694, -1.159634, -2.565399, 0, 1, 0.3098039, 1,
-0.3814711, -0.244309, -1.409651, 0, 1, 0.3176471, 1,
-0.3805798, -0.7908754, -4.230032, 0, 1, 0.3215686, 1,
-0.3761419, 0.6664575, -1.519289, 0, 1, 0.3294118, 1,
-0.3740315, -0.7127857, -2.407355, 0, 1, 0.3333333, 1,
-0.3710431, -1.967289, -5.529335, 0, 1, 0.3411765, 1,
-0.3621365, 0.2010459, -1.374909, 0, 1, 0.345098, 1,
-0.3570478, 0.9419147, 0.2426881, 0, 1, 0.3529412, 1,
-0.3532309, -0.5526318, -2.49699, 0, 1, 0.3568628, 1,
-0.3498862, -1.04676, -3.318909, 0, 1, 0.3647059, 1,
-0.3466542, 0.6768795, -1.769698, 0, 1, 0.3686275, 1,
-0.3464258, 0.775116, -0.7187189, 0, 1, 0.3764706, 1,
-0.3455376, 0.9113472, 0.4942912, 0, 1, 0.3803922, 1,
-0.3437512, 0.8839356, -0.9435743, 0, 1, 0.3882353, 1,
-0.3418404, -1.096081, -2.248623, 0, 1, 0.3921569, 1,
-0.3415127, 0.5997672, -0.6638581, 0, 1, 0.4, 1,
-0.3384824, 0.1749304, -1.012983, 0, 1, 0.4078431, 1,
-0.3325859, 0.5278444, -2.633649, 0, 1, 0.4117647, 1,
-0.3323816, -1.297132, -0.6674996, 0, 1, 0.4196078, 1,
-0.3291253, 0.7880635, -1.134125, 0, 1, 0.4235294, 1,
-0.328599, -0.9887607, -2.596931, 0, 1, 0.4313726, 1,
-0.3273524, 0.2452603, -2.028798, 0, 1, 0.4352941, 1,
-0.3259279, 0.08285941, -1.222046, 0, 1, 0.4431373, 1,
-0.3247575, 0.8698781, -0.5887901, 0, 1, 0.4470588, 1,
-0.3217418, 0.3056323, -1.693864, 0, 1, 0.454902, 1,
-0.320223, -1.1799, -1.590786, 0, 1, 0.4588235, 1,
-0.3192659, 0.1865601, -0.443099, 0, 1, 0.4666667, 1,
-0.3164475, -0.8312243, -2.730191, 0, 1, 0.4705882, 1,
-0.3157524, -1.914726, -3.584186, 0, 1, 0.4784314, 1,
-0.3142141, 0.7834038, -0.3619506, 0, 1, 0.4823529, 1,
-0.3140793, -0.6854088, -3.898963, 0, 1, 0.4901961, 1,
-0.308751, 1.412817, 1.363961, 0, 1, 0.4941176, 1,
-0.3087035, 1.380426, 0.3374902, 0, 1, 0.5019608, 1,
-0.3014261, 0.3401499, -0.4259821, 0, 1, 0.509804, 1,
-0.2977181, 1.417038, -0.242327, 0, 1, 0.5137255, 1,
-0.2969526, -1.925131, -2.747352, 0, 1, 0.5215687, 1,
-0.2939829, -0.5587062, -4.076335, 0, 1, 0.5254902, 1,
-0.2939435, 1.375298, 1.4831, 0, 1, 0.5333334, 1,
-0.2853098, -1.763633, -2.220477, 0, 1, 0.5372549, 1,
-0.284246, -1.748601, -2.864616, 0, 1, 0.5450981, 1,
-0.2840492, -0.8322369, -3.301866, 0, 1, 0.5490196, 1,
-0.2827515, -0.3211399, -2.866432, 0, 1, 0.5568628, 1,
-0.2808993, -0.2076568, -4.072834, 0, 1, 0.5607843, 1,
-0.277399, -0.366461, -2.778545, 0, 1, 0.5686275, 1,
-0.2730555, 0.5620682, -1.956289, 0, 1, 0.572549, 1,
-0.2682233, -0.834207, -3.036562, 0, 1, 0.5803922, 1,
-0.2615514, -1.703982, -3.951281, 0, 1, 0.5843138, 1,
-0.2576849, 2.656605, 1.31663, 0, 1, 0.5921569, 1,
-0.2544186, 0.6194243, -0.3137906, 0, 1, 0.5960785, 1,
-0.2529835, -1.176618, -0.895311, 0, 1, 0.6039216, 1,
-0.2525519, 0.3000266, -0.5458958, 0, 1, 0.6117647, 1,
-0.2519515, -1.040097, -2.866479, 0, 1, 0.6156863, 1,
-0.2511764, -0.941903, -2.260794, 0, 1, 0.6235294, 1,
-0.2491, 1.470606, -1.392025, 0, 1, 0.627451, 1,
-0.2490284, 0.4068957, -0.2117413, 0, 1, 0.6352941, 1,
-0.2452347, -0.1094558, -0.007188296, 0, 1, 0.6392157, 1,
-0.2376271, 0.1209653, -2.13835, 0, 1, 0.6470588, 1,
-0.228443, 0.1484769, -1.118059, 0, 1, 0.6509804, 1,
-0.2280336, 1.132349, 0.06613316, 0, 1, 0.6588235, 1,
-0.2239973, 2.383744, 0.7377859, 0, 1, 0.6627451, 1,
-0.2215447, -0.5640374, -2.630911, 0, 1, 0.6705883, 1,
-0.220766, 0.9452338, -0.03309269, 0, 1, 0.6745098, 1,
-0.220368, 0.5689, 0.1160128, 0, 1, 0.682353, 1,
-0.2113022, -0.9291999, -3.624231, 0, 1, 0.6862745, 1,
-0.2056928, 0.9683604, 0.2215952, 0, 1, 0.6941177, 1,
-0.2045078, -0.5078545, -3.757491, 0, 1, 0.7019608, 1,
-0.1975108, -0.7550316, -0.6239603, 0, 1, 0.7058824, 1,
-0.1951378, 0.4427275, -0.639241, 0, 1, 0.7137255, 1,
-0.1934796, -0.8443393, -2.87566, 0, 1, 0.7176471, 1,
-0.1921738, -0.4769103, -3.084829, 0, 1, 0.7254902, 1,
-0.1909828, 0.1294183, -1.389434, 0, 1, 0.7294118, 1,
-0.1794672, 1.45804, -1.018349, 0, 1, 0.7372549, 1,
-0.1770294, 0.7100682, -1.161913, 0, 1, 0.7411765, 1,
-0.1729333, 0.4176416, -0.2832339, 0, 1, 0.7490196, 1,
-0.1709845, 0.1521138, 0.773425, 0, 1, 0.7529412, 1,
-0.1693061, -0.9889392, -3.828598, 0, 1, 0.7607843, 1,
-0.1669852, 0.110877, -3.504092, 0, 1, 0.7647059, 1,
-0.1651376, -0.3921802, -0.4659885, 0, 1, 0.772549, 1,
-0.1611501, 2.031545, -0.4865257, 0, 1, 0.7764706, 1,
-0.1593093, 0.06189694, -2.533319, 0, 1, 0.7843137, 1,
-0.1587908, -1.111983, -2.414222, 0, 1, 0.7882353, 1,
-0.1581009, -0.1238995, -0.6812154, 0, 1, 0.7960784, 1,
-0.1565469, -0.8414264, -1.159478, 0, 1, 0.8039216, 1,
-0.1544957, 0.7504152, 0.004492405, 0, 1, 0.8078431, 1,
-0.1534411, 0.2306629, -1.440814, 0, 1, 0.8156863, 1,
-0.1501578, -0.2515113, -3.031137, 0, 1, 0.8196079, 1,
-0.1483659, -0.05513295, -1.615502, 0, 1, 0.827451, 1,
-0.1438992, -0.7713404, -4.140059, 0, 1, 0.8313726, 1,
-0.1421753, -1.681379, -4.091801, 0, 1, 0.8392157, 1,
-0.1407699, 0.8181006, 1.687749, 0, 1, 0.8431373, 1,
-0.1347602, -0.1693837, -4.170609, 0, 1, 0.8509804, 1,
-0.1279331, -1.117004, -3.19656, 0, 1, 0.854902, 1,
-0.1271703, -0.3312984, -2.004667, 0, 1, 0.8627451, 1,
-0.1270357, 0.2748472, -0.155954, 0, 1, 0.8666667, 1,
-0.1266594, -0.4139327, -3.91858, 0, 1, 0.8745098, 1,
-0.1244873, -0.003280722, -0.5655044, 0, 1, 0.8784314, 1,
-0.1221598, 0.9994277, 1.318849, 0, 1, 0.8862745, 1,
-0.1202063, -0.3768946, -4.034579, 0, 1, 0.8901961, 1,
-0.1164683, -2.879309, -3.726193, 0, 1, 0.8980392, 1,
-0.1163709, 0.3505146, -0.2376167, 0, 1, 0.9058824, 1,
-0.1153876, -0.10253, -3.729958, 0, 1, 0.9098039, 1,
-0.1082311, -0.2547837, -2.061423, 0, 1, 0.9176471, 1,
-0.1053397, 0.1482528, -0.5331101, 0, 1, 0.9215686, 1,
-0.09946558, 1.134804, 0.8402732, 0, 1, 0.9294118, 1,
-0.09839922, 0.7033896, 0.0909509, 0, 1, 0.9333333, 1,
-0.09471513, 1.562893, 0.4133536, 0, 1, 0.9411765, 1,
-0.09272033, 0.5364027, 0.09349921, 0, 1, 0.945098, 1,
-0.09164611, 0.9475711, -0.0921977, 0, 1, 0.9529412, 1,
-0.08956037, -0.1273407, -1.661594, 0, 1, 0.9568627, 1,
-0.08663744, -0.3874729, -4.419621, 0, 1, 0.9647059, 1,
-0.08201703, 1.073939, -0.3660361, 0, 1, 0.9686275, 1,
-0.0807645, -0.6013958, -3.02446, 0, 1, 0.9764706, 1,
-0.08032425, 0.1145252, 0.7524349, 0, 1, 0.9803922, 1,
-0.07934573, 0.1104327, -1.738076, 0, 1, 0.9882353, 1,
-0.07466979, 0.5417897, -1.179788, 0, 1, 0.9921569, 1,
-0.07032399, 1.090787, 0.6713529, 0, 1, 1, 1,
-0.06898969, -1.504118, -2.549966, 0, 0.9921569, 1, 1,
-0.06893264, 1.180546, -1.092623, 0, 0.9882353, 1, 1,
-0.06783374, -1.283593, -4.074716, 0, 0.9803922, 1, 1,
-0.0576863, 1.86627, 1.164005, 0, 0.9764706, 1, 1,
-0.05191362, 0.7543842, -0.1730195, 0, 0.9686275, 1, 1,
-0.04794466, -0.9559737, -2.185942, 0, 0.9647059, 1, 1,
-0.04576552, 1.153762, -2.115396, 0, 0.9568627, 1, 1,
-0.03912047, 0.3489663, -0.4149931, 0, 0.9529412, 1, 1,
-0.03697395, -1.21045, -2.931684, 0, 0.945098, 1, 1,
-0.03293313, 2.530328, -0.6651626, 0, 0.9411765, 1, 1,
-0.03248251, 0.3202294, -1.853987, 0, 0.9333333, 1, 1,
-0.03141658, -0.4108866, -1.763335, 0, 0.9294118, 1, 1,
-0.03125179, -2.579871, -3.073803, 0, 0.9215686, 1, 1,
-0.027692, 0.2239394, 0.3250277, 0, 0.9176471, 1, 1,
-0.02673275, 1.720301, -0.840842, 0, 0.9098039, 1, 1,
-0.01873321, 0.8632807, 1.724678, 0, 0.9058824, 1, 1,
-0.0157523, 1.414785, -1.630326, 0, 0.8980392, 1, 1,
-0.008702346, 1.599901, -1.16664, 0, 0.8901961, 1, 1,
-0.008109144, -0.1428855, -3.806628, 0, 0.8862745, 1, 1,
-0.006610993, 0.01190751, 0.1252008, 0, 0.8784314, 1, 1,
-0.003324097, -0.02133444, -3.914972, 0, 0.8745098, 1, 1,
-0.002064706, -0.5573739, -2.6557, 0, 0.8666667, 1, 1,
0.00255513, -1.740037, 1.806861, 0, 0.8627451, 1, 1,
0.005671313, -0.3628235, 3.457259, 0, 0.854902, 1, 1,
0.006688798, -0.5534735, 3.362134, 0, 0.8509804, 1, 1,
0.01352239, -0.1381176, 2.459983, 0, 0.8431373, 1, 1,
0.01393186, -1.424897, 3.504995, 0, 0.8392157, 1, 1,
0.01575464, -0.267394, 3.415639, 0, 0.8313726, 1, 1,
0.01676564, -1.040995, 3.436669, 0, 0.827451, 1, 1,
0.01728423, -0.1360731, 1.992456, 0, 0.8196079, 1, 1,
0.02162643, 0.1305499, -0.4629405, 0, 0.8156863, 1, 1,
0.02249544, 0.08272118, 0.1515343, 0, 0.8078431, 1, 1,
0.02254631, 0.5008826, -0.4844355, 0, 0.8039216, 1, 1,
0.02540711, -0.2699814, 3.210306, 0, 0.7960784, 1, 1,
0.02967148, -1.501192, 2.940114, 0, 0.7882353, 1, 1,
0.03457405, 0.6177287, 0.02822067, 0, 0.7843137, 1, 1,
0.03670454, 1.32767, -0.6718709, 0, 0.7764706, 1, 1,
0.04159047, -0.8725604, 2.380987, 0, 0.772549, 1, 1,
0.04494384, 0.4439092, 1.312725, 0, 0.7647059, 1, 1,
0.0461519, 0.7018949, 0.3661648, 0, 0.7607843, 1, 1,
0.04676699, -0.3018135, 1.271239, 0, 0.7529412, 1, 1,
0.05280323, -0.7269079, 1.763615, 0, 0.7490196, 1, 1,
0.05502642, -2.286231, 2.972921, 0, 0.7411765, 1, 1,
0.05634538, -2.014066, 3.295404, 0, 0.7372549, 1, 1,
0.05931524, -0.1746423, 2.126151, 0, 0.7294118, 1, 1,
0.06291094, 0.275023, 0.5494485, 0, 0.7254902, 1, 1,
0.06303687, -1.235646, 1.92061, 0, 0.7176471, 1, 1,
0.067236, -0.6345618, 2.448553, 0, 0.7137255, 1, 1,
0.06819697, -0.2154597, 2.599551, 0, 0.7058824, 1, 1,
0.0759519, 0.9978805, -0.9284072, 0, 0.6980392, 1, 1,
0.07975709, 0.4558755, 0.4056302, 0, 0.6941177, 1, 1,
0.08192486, -2.169319, 3.909029, 0, 0.6862745, 1, 1,
0.0827577, -0.3286847, 2.836787, 0, 0.682353, 1, 1,
0.08963713, -1.157962, 2.387995, 0, 0.6745098, 1, 1,
0.09468919, -0.2563621, 5.399507, 0, 0.6705883, 1, 1,
0.09530455, -1.187377, 2.61894, 0, 0.6627451, 1, 1,
0.1045469, -0.1948961, 3.774213, 0, 0.6588235, 1, 1,
0.1077562, 0.5333878, -1.012391, 0, 0.6509804, 1, 1,
0.1084134, 1.20419, -0.3490748, 0, 0.6470588, 1, 1,
0.1099357, -2.258361, 2.719249, 0, 0.6392157, 1, 1,
0.1140728, -0.7364374, 3.718446, 0, 0.6352941, 1, 1,
0.115979, -0.8869113, 2.855611, 0, 0.627451, 1, 1,
0.1190537, 0.007765715, 1.693277, 0, 0.6235294, 1, 1,
0.1203453, -1.842076, 3.248286, 0, 0.6156863, 1, 1,
0.1235966, -1.894501, 2.294625, 0, 0.6117647, 1, 1,
0.1242328, 0.1485369, 1.691915, 0, 0.6039216, 1, 1,
0.1307084, -0.9208297, 4.554667, 0, 0.5960785, 1, 1,
0.1335164, -0.2343109, 2.423093, 0, 0.5921569, 1, 1,
0.1379725, -0.9417441, 3.46431, 0, 0.5843138, 1, 1,
0.1413522, -0.9247245, 2.915054, 0, 0.5803922, 1, 1,
0.1428224, 0.05906746, 1.703058, 0, 0.572549, 1, 1,
0.1438978, 0.532601, -1.259055, 0, 0.5686275, 1, 1,
0.1456528, -1.122806, 2.52389, 0, 0.5607843, 1, 1,
0.1457757, -1.56346, 2.102092, 0, 0.5568628, 1, 1,
0.1505972, -1.370869, 2.123044, 0, 0.5490196, 1, 1,
0.1515692, -0.03716332, 2.742309, 0, 0.5450981, 1, 1,
0.1553687, -0.480402, 2.495527, 0, 0.5372549, 1, 1,
0.1571529, -0.4188336, 3.494148, 0, 0.5333334, 1, 1,
0.1589491, -0.1377969, 2.823456, 0, 0.5254902, 1, 1,
0.1605362, 1.002452, 0.6393302, 0, 0.5215687, 1, 1,
0.1626585, 1.490599, 1.943981, 0, 0.5137255, 1, 1,
0.1629105, 1.070021, 1.524422, 0, 0.509804, 1, 1,
0.1642265, -0.8448868, 3.472409, 0, 0.5019608, 1, 1,
0.1677768, 1.08319, -1.413258, 0, 0.4941176, 1, 1,
0.1684416, -0.3018292, 2.881964, 0, 0.4901961, 1, 1,
0.1684939, -0.174257, 2.508904, 0, 0.4823529, 1, 1,
0.1688987, -0.220378, 2.359111, 0, 0.4784314, 1, 1,
0.1691325, -1.271376, 3.550008, 0, 0.4705882, 1, 1,
0.1714128, 1.118136, -0.2968797, 0, 0.4666667, 1, 1,
0.1767072, 0.5361225, 1.600996, 0, 0.4588235, 1, 1,
0.1777413, 1.184895, 0.7956121, 0, 0.454902, 1, 1,
0.1788158, 2.509679, -0.07878531, 0, 0.4470588, 1, 1,
0.1798493, -0.2410683, 2.660838, 0, 0.4431373, 1, 1,
0.1805667, 1.354534, -1.801654, 0, 0.4352941, 1, 1,
0.1847117, 0.1379393, 0.4106018, 0, 0.4313726, 1, 1,
0.186467, -0.4244699, 3.582789, 0, 0.4235294, 1, 1,
0.1894107, -0.06187019, 2.330605, 0, 0.4196078, 1, 1,
0.1925029, 1.427438, 0.9631289, 0, 0.4117647, 1, 1,
0.1926117, 0.9368399, -0.8988895, 0, 0.4078431, 1, 1,
0.1968049, -1.095183, 0.7014991, 0, 0.4, 1, 1,
0.1992071, 1.64786, 0.7523757, 0, 0.3921569, 1, 1,
0.203425, -0.04161264, 2.313148, 0, 0.3882353, 1, 1,
0.2035679, -0.7636171, 4.324372, 0, 0.3803922, 1, 1,
0.2074589, -0.2929413, 1.75088, 0, 0.3764706, 1, 1,
0.2100783, -1.039569, 4.002869, 0, 0.3686275, 1, 1,
0.2106532, -0.4924392, 3.637833, 0, 0.3647059, 1, 1,
0.2118255, -0.6246947, 2.6935, 0, 0.3568628, 1, 1,
0.2142487, -0.4953483, 0.9274089, 0, 0.3529412, 1, 1,
0.2164984, 0.6494229, -0.2932624, 0, 0.345098, 1, 1,
0.2195533, 0.03045117, 0.6765313, 0, 0.3411765, 1, 1,
0.220342, 1.573452, -1.475076, 0, 0.3333333, 1, 1,
0.2279706, 0.1765582, 2.569464, 0, 0.3294118, 1, 1,
0.2331217, -1.166081, 3.421109, 0, 0.3215686, 1, 1,
0.2379243, -0.2730305, 2.304991, 0, 0.3176471, 1, 1,
0.2384213, 0.8205652, 0.3028015, 0, 0.3098039, 1, 1,
0.239096, -0.611691, 1.546767, 0, 0.3058824, 1, 1,
0.2395345, -1.718896, 2.992561, 0, 0.2980392, 1, 1,
0.2412385, 1.407764, -0.8121839, 0, 0.2901961, 1, 1,
0.2441454, 0.5255439, 0.6151124, 0, 0.2862745, 1, 1,
0.2442689, -0.3674011, 4.074108, 0, 0.2784314, 1, 1,
0.2442763, 0.5171546, 2.272276, 0, 0.2745098, 1, 1,
0.2449602, -2.160602, 1.392011, 0, 0.2666667, 1, 1,
0.2496877, 1.854491, 1.348786, 0, 0.2627451, 1, 1,
0.2579971, -0.9722952, 2.395472, 0, 0.254902, 1, 1,
0.2596646, 1.533636, -0.9245892, 0, 0.2509804, 1, 1,
0.2617157, 0.2316844, 0.9218241, 0, 0.2431373, 1, 1,
0.2620821, 0.3185394, 0.3984824, 0, 0.2392157, 1, 1,
0.2660374, 0.1759918, 0.3587233, 0, 0.2313726, 1, 1,
0.2680362, -0.03555181, 2.542456, 0, 0.227451, 1, 1,
0.2683549, -0.8833967, 2.953339, 0, 0.2196078, 1, 1,
0.272217, -0.03926906, 2.036405, 0, 0.2156863, 1, 1,
0.2726037, -0.372409, 2.549447, 0, 0.2078431, 1, 1,
0.2749163, 0.1888424, -0.6914491, 0, 0.2039216, 1, 1,
0.2755383, -0.4643315, 1.252824, 0, 0.1960784, 1, 1,
0.2760951, -0.6031741, 1.97247, 0, 0.1882353, 1, 1,
0.2773817, -0.7949755, 3.830164, 0, 0.1843137, 1, 1,
0.2782587, -1.987918, 1.799213, 0, 0.1764706, 1, 1,
0.2793031, -0.2412473, 2.054313, 0, 0.172549, 1, 1,
0.2815959, 0.817096, 0.2593777, 0, 0.1647059, 1, 1,
0.2821633, -0.2648558, 4.564159, 0, 0.1607843, 1, 1,
0.2931114, -1.589107, 2.878665, 0, 0.1529412, 1, 1,
0.2931579, 1.82368, -0.1214187, 0, 0.1490196, 1, 1,
0.2945664, -0.9212536, 2.436193, 0, 0.1411765, 1, 1,
0.3017271, 0.03242883, 2.289129, 0, 0.1372549, 1, 1,
0.3038373, -0.002910142, 1.112287, 0, 0.1294118, 1, 1,
0.306613, -1.00786, 2.957221, 0, 0.1254902, 1, 1,
0.3095748, 0.7678417, 0.04057172, 0, 0.1176471, 1, 1,
0.3119622, 0.0118188, 0.1266758, 0, 0.1137255, 1, 1,
0.3164576, -0.1922841, 1.294675, 0, 0.1058824, 1, 1,
0.3187263, 0.4623088, 0.9754021, 0, 0.09803922, 1, 1,
0.3248608, 0.3751747, -0.5400489, 0, 0.09411765, 1, 1,
0.3335412, -2.101001, 4.64807, 0, 0.08627451, 1, 1,
0.3355334, -0.93709, 2.181007, 0, 0.08235294, 1, 1,
0.3357856, 0.1694686, 1.333383, 0, 0.07450981, 1, 1,
0.3372948, 0.1239405, 1.196562, 0, 0.07058824, 1, 1,
0.3380698, 0.4771744, 1.516959, 0, 0.0627451, 1, 1,
0.3388481, -0.9487278, 2.577662, 0, 0.05882353, 1, 1,
0.3424678, 0.972437, 0.2063953, 0, 0.05098039, 1, 1,
0.3429216, -1.819281, 3.073211, 0, 0.04705882, 1, 1,
0.3466223, 0.3389808, -0.679585, 0, 0.03921569, 1, 1,
0.3478616, -1.7212, 3.08744, 0, 0.03529412, 1, 1,
0.3511902, -1.580125, 4.269205, 0, 0.02745098, 1, 1,
0.3533329, 1.122181, -1.731744, 0, 0.02352941, 1, 1,
0.3570835, -0.955013, 1.848341, 0, 0.01568628, 1, 1,
0.3573099, -1.383483, 2.35227, 0, 0.01176471, 1, 1,
0.3598766, 1.078919, 1.211812, 0, 0.003921569, 1, 1,
0.36233, 1.298271, 1.134912, 0.003921569, 0, 1, 1,
0.363328, 0.005627095, 1.861253, 0.007843138, 0, 1, 1,
0.3637609, 0.3336031, -0.1970462, 0.01568628, 0, 1, 1,
0.3787546, 0.539169, 1.918589, 0.01960784, 0, 1, 1,
0.3802292, 0.5711093, 0.5572857, 0.02745098, 0, 1, 1,
0.3831354, 1.607453, -0.2145663, 0.03137255, 0, 1, 1,
0.3867345, -0.6267107, 3.177886, 0.03921569, 0, 1, 1,
0.3871163, 0.0415272, 0.9170864, 0.04313726, 0, 1, 1,
0.388539, -2.219901, 4.249823, 0.05098039, 0, 1, 1,
0.3954034, 1.349281, 1.725304, 0.05490196, 0, 1, 1,
0.3980274, -0.1407624, 1.84905, 0.0627451, 0, 1, 1,
0.3991757, -1.68247, 2.118709, 0.06666667, 0, 1, 1,
0.4024501, 2.339229, 0.3135466, 0.07450981, 0, 1, 1,
0.4084556, 1.16808, 1.825297, 0.07843138, 0, 1, 1,
0.4113253, 0.9741938, 1.35885, 0.08627451, 0, 1, 1,
0.4117424, -0.5355813, 3.175616, 0.09019608, 0, 1, 1,
0.4128189, 0.2925784, 2.375502, 0.09803922, 0, 1, 1,
0.4149139, -0.5462683, 2.488783, 0.1058824, 0, 1, 1,
0.4155057, -0.1590503, 2.757107, 0.1098039, 0, 1, 1,
0.4166382, -1.090132, 3.191397, 0.1176471, 0, 1, 1,
0.423032, -0.2096645, 1.20317, 0.1215686, 0, 1, 1,
0.4231942, 0.5585698, 1.60901, 0.1294118, 0, 1, 1,
0.4256552, 1.125742, 1.282078, 0.1333333, 0, 1, 1,
0.4307917, 1.576124, -0.4632055, 0.1411765, 0, 1, 1,
0.4315788, 0.3257766, -0.509079, 0.145098, 0, 1, 1,
0.4364808, -0.9027835, 4.110725, 0.1529412, 0, 1, 1,
0.4413045, 1.47004, 0.6174108, 0.1568628, 0, 1, 1,
0.4433433, -0.07665513, 1.816602, 0.1647059, 0, 1, 1,
0.4505523, -0.4415659, 2.744124, 0.1686275, 0, 1, 1,
0.4547045, -0.1062283, 1.493853, 0.1764706, 0, 1, 1,
0.4605421, -0.07087768, 1.874965, 0.1803922, 0, 1, 1,
0.4611288, 0.6305158, 1.060402, 0.1882353, 0, 1, 1,
0.4615287, -0.8428346, 2.702435, 0.1921569, 0, 1, 1,
0.4706412, -1.313446, 4.408171, 0.2, 0, 1, 1,
0.4713306, 0.01370141, 0.8535955, 0.2078431, 0, 1, 1,
0.479298, 0.757292, -2.100203, 0.2117647, 0, 1, 1,
0.4803673, 0.639303, 1.435311, 0.2196078, 0, 1, 1,
0.4866495, -0.8984004, 2.991626, 0.2235294, 0, 1, 1,
0.4904983, 2.029559, 0.3985905, 0.2313726, 0, 1, 1,
0.4977429, -1.497739, 3.790404, 0.2352941, 0, 1, 1,
0.50218, -1.1867, 4.543627, 0.2431373, 0, 1, 1,
0.5071263, 0.5748544, 0.8413414, 0.2470588, 0, 1, 1,
0.5091043, -0.2729652, 2.25917, 0.254902, 0, 1, 1,
0.5101936, -0.4759573, 1.472036, 0.2588235, 0, 1, 1,
0.5168792, 0.5337254, 1.817381, 0.2666667, 0, 1, 1,
0.5177131, 1.403082, -1.55161, 0.2705882, 0, 1, 1,
0.5191978, 1.404663, 1.936679, 0.2784314, 0, 1, 1,
0.5192889, -0.6602589, 2.548348, 0.282353, 0, 1, 1,
0.5208705, -0.01816268, 1.80677, 0.2901961, 0, 1, 1,
0.527612, 0.09507019, 1.470553, 0.2941177, 0, 1, 1,
0.5285292, 0.5584303, 1.466609, 0.3019608, 0, 1, 1,
0.5321949, 0.117215, 0.2365275, 0.3098039, 0, 1, 1,
0.5355236, 0.05725448, 1.873469, 0.3137255, 0, 1, 1,
0.5392213, -0.1896324, 0.8933991, 0.3215686, 0, 1, 1,
0.5451954, 0.6602979, 0.435871, 0.3254902, 0, 1, 1,
0.548485, 0.2461686, 2.932204, 0.3333333, 0, 1, 1,
0.5591568, -0.06031119, 0.6473671, 0.3372549, 0, 1, 1,
0.5671139, -1.955555, 5.12514, 0.345098, 0, 1, 1,
0.5696433, -0.4035687, 1.596318, 0.3490196, 0, 1, 1,
0.5697117, 1.192011, 1.145795, 0.3568628, 0, 1, 1,
0.569923, -1.020932, 2.655694, 0.3607843, 0, 1, 1,
0.5728852, -1.303596, 3.049567, 0.3686275, 0, 1, 1,
0.5742023, 0.7117633, 0.7306765, 0.372549, 0, 1, 1,
0.5818466, 0.4104469, 0.03386426, 0.3803922, 0, 1, 1,
0.582261, -1.127999, 2.01391, 0.3843137, 0, 1, 1,
0.5837913, 1.680461, 3.618825, 0.3921569, 0, 1, 1,
0.5938891, 0.419481, 1.665233, 0.3960784, 0, 1, 1,
0.6019108, -0.3129818, 0.451148, 0.4039216, 0, 1, 1,
0.6023604, 1.698026, -1.478071, 0.4117647, 0, 1, 1,
0.6071221, -0.6529436, 0.4684596, 0.4156863, 0, 1, 1,
0.6110305, -1.12087, 2.966555, 0.4235294, 0, 1, 1,
0.6225032, 0.9805351, 0.5084437, 0.427451, 0, 1, 1,
0.625119, -1.08647, 3.726826, 0.4352941, 0, 1, 1,
0.6277953, 0.4868591, 0.09988982, 0.4392157, 0, 1, 1,
0.6299955, -1.597323, 2.192428, 0.4470588, 0, 1, 1,
0.6346166, -0.08620419, 1.795186, 0.4509804, 0, 1, 1,
0.6393678, -1.821777, 3.177769, 0.4588235, 0, 1, 1,
0.6397142, 1.316742, 1.065464, 0.4627451, 0, 1, 1,
0.6505988, 0.9719744, -1.614158, 0.4705882, 0, 1, 1,
0.6510753, -1.052274, 3.949477, 0.4745098, 0, 1, 1,
0.6522436, 0.3323179, 0.04439894, 0.4823529, 0, 1, 1,
0.6593633, -1.012965, 3.728507, 0.4862745, 0, 1, 1,
0.6608515, -0.49883, 2.321292, 0.4941176, 0, 1, 1,
0.6726356, 1.37082, -0.4786165, 0.5019608, 0, 1, 1,
0.6744161, -0.4605838, 3.066578, 0.5058824, 0, 1, 1,
0.679701, 0.2161954, 0.6289965, 0.5137255, 0, 1, 1,
0.6801264, -0.3714084, 2.286541, 0.5176471, 0, 1, 1,
0.6827716, 0.7577595, 0.3716526, 0.5254902, 0, 1, 1,
0.6857706, 0.4340233, 0.1767634, 0.5294118, 0, 1, 1,
0.6878865, 0.2582234, 0.6083447, 0.5372549, 0, 1, 1,
0.6948614, -0.1100973, 2.355803, 0.5411765, 0, 1, 1,
0.6955444, -2.487947, 4.939472, 0.5490196, 0, 1, 1,
0.7001311, -0.3179573, 3.100707, 0.5529412, 0, 1, 1,
0.702401, -0.6819063, 3.028327, 0.5607843, 0, 1, 1,
0.703762, 1.317293, 1.825609, 0.5647059, 0, 1, 1,
0.7105314, -0.3346068, 1.285735, 0.572549, 0, 1, 1,
0.7191408, -0.6979362, 2.233265, 0.5764706, 0, 1, 1,
0.720319, 1.361094, 0.2944393, 0.5843138, 0, 1, 1,
0.7223051, 1.950749, -0.3854728, 0.5882353, 0, 1, 1,
0.7224947, -0.5240618, 2.17055, 0.5960785, 0, 1, 1,
0.7239598, -0.3231784, 3.626912, 0.6039216, 0, 1, 1,
0.725835, 0.576371, 1.280631, 0.6078432, 0, 1, 1,
0.7282182, -0.6403544, 2.582864, 0.6156863, 0, 1, 1,
0.7302392, 0.0448055, 2.787901, 0.6196079, 0, 1, 1,
0.7348637, 1.297569, 1.02391, 0.627451, 0, 1, 1,
0.7409896, -0.3560669, 1.500569, 0.6313726, 0, 1, 1,
0.7411698, 0.5171154, 2.006191, 0.6392157, 0, 1, 1,
0.74618, -0.9473752, 0.575447, 0.6431373, 0, 1, 1,
0.7480507, 0.8755027, -0.06497058, 0.6509804, 0, 1, 1,
0.7546934, -1.236142, 1.861788, 0.654902, 0, 1, 1,
0.7713057, -1.440815, 2.336295, 0.6627451, 0, 1, 1,
0.7720143, -0.2328135, 1.948657, 0.6666667, 0, 1, 1,
0.7792591, -0.3081871, 2.034349, 0.6745098, 0, 1, 1,
0.7802985, -0.6401701, 1.201477, 0.6784314, 0, 1, 1,
0.7819518, 2.186271, 0.6214885, 0.6862745, 0, 1, 1,
0.7825528, 0.03124478, 0.3448952, 0.6901961, 0, 1, 1,
0.7845399, 0.9853452, 1.766531, 0.6980392, 0, 1, 1,
0.7851442, -1.229547, 2.488678, 0.7058824, 0, 1, 1,
0.7855099, -0.6251891, 3.96834, 0.7098039, 0, 1, 1,
0.7870389, -0.1858307, 2.804675, 0.7176471, 0, 1, 1,
0.7991719, 0.9491501, 0.6964437, 0.7215686, 0, 1, 1,
0.8012764, 0.2859945, 1.547754, 0.7294118, 0, 1, 1,
0.8037243, -0.3977036, 2.303279, 0.7333333, 0, 1, 1,
0.8066921, 2.249479, 0.7504066, 0.7411765, 0, 1, 1,
0.8087006, 0.9664043, -0.3757107, 0.7450981, 0, 1, 1,
0.8105501, 1.753171, 0.4569921, 0.7529412, 0, 1, 1,
0.8116478, -0.4166387, 3.285736, 0.7568628, 0, 1, 1,
0.8122105, -0.8497846, 1.666741, 0.7647059, 0, 1, 1,
0.816581, 0.7912617, -0.3258964, 0.7686275, 0, 1, 1,
0.829637, -1.448226, 1.823812, 0.7764706, 0, 1, 1,
0.8310441, -0.3017308, 1.177555, 0.7803922, 0, 1, 1,
0.8326462, 0.01545805, 0.5010244, 0.7882353, 0, 1, 1,
0.8368251, 0.2941557, 2.665868, 0.7921569, 0, 1, 1,
0.8373034, -0.3500113, 2.582949, 0.8, 0, 1, 1,
0.8404713, -0.9477143, 3.040311, 0.8078431, 0, 1, 1,
0.8410819, -1.030035, 4.091934, 0.8117647, 0, 1, 1,
0.8418065, 1.311714, 0.9178122, 0.8196079, 0, 1, 1,
0.8428413, 1.302697, 1.282194, 0.8235294, 0, 1, 1,
0.845594, -1.115769, 4.831456, 0.8313726, 0, 1, 1,
0.8459814, 0.4848499, 0.5936083, 0.8352941, 0, 1, 1,
0.8462832, 0.8488238, -0.06310121, 0.8431373, 0, 1, 1,
0.8464264, 0.7165217, 0.7516392, 0.8470588, 0, 1, 1,
0.8464854, 1.612746, 0.7587873, 0.854902, 0, 1, 1,
0.8474064, 0.1301298, 2.695863, 0.8588235, 0, 1, 1,
0.8524594, 1.390714, -0.008914712, 0.8666667, 0, 1, 1,
0.8529972, -0.6576909, 2.590276, 0.8705882, 0, 1, 1,
0.8602808, -0.7749963, 3.73333, 0.8784314, 0, 1, 1,
0.8624431, -0.2777861, 0.1193399, 0.8823529, 0, 1, 1,
0.8700758, 0.7731744, -0.211263, 0.8901961, 0, 1, 1,
0.8737448, -0.4621261, -0.02422036, 0.8941177, 0, 1, 1,
0.8747306, -0.7290471, 1.906145, 0.9019608, 0, 1, 1,
0.8766738, 0.9394336, 0.2325069, 0.9098039, 0, 1, 1,
0.8873633, -0.04743629, 2.927216, 0.9137255, 0, 1, 1,
0.8943883, -0.570504, 1.843491, 0.9215686, 0, 1, 1,
0.9049761, 0.3269556, 2.166556, 0.9254902, 0, 1, 1,
0.9166853, -0.9740341, 1.376254, 0.9333333, 0, 1, 1,
0.9209712, -1.426711, 2.057835, 0.9372549, 0, 1, 1,
0.9369725, 0.6268562, -1.013877, 0.945098, 0, 1, 1,
0.9379418, 0.47724, -0.4576907, 0.9490196, 0, 1, 1,
0.9397267, 0.1896698, 3.378715, 0.9568627, 0, 1, 1,
0.9432622, 0.0393725, 2.665783, 0.9607843, 0, 1, 1,
0.956459, -0.9634242, 2.438145, 0.9686275, 0, 1, 1,
0.9571109, -0.7799463, 1.664649, 0.972549, 0, 1, 1,
0.9595993, 0.2844867, 2.166253, 0.9803922, 0, 1, 1,
0.9637116, 0.4518588, -0.2724712, 0.9843137, 0, 1, 1,
0.9656308, 0.7834065, -0.3009583, 0.9921569, 0, 1, 1,
0.9678622, 2.87286, 0.9684363, 0.9960784, 0, 1, 1,
0.9703404, 1.703589, 0.2601277, 1, 0, 0.9960784, 1,
0.9718588, -0.8174981, 1.591407, 1, 0, 0.9882353, 1,
0.9720989, 1.660079, 1.791831, 1, 0, 0.9843137, 1,
0.9724224, 0.3521174, 2.853147, 1, 0, 0.9764706, 1,
0.9730871, 0.5471743, 1.223987, 1, 0, 0.972549, 1,
0.9773357, -1.405444, 3.054872, 1, 0, 0.9647059, 1,
0.9815422, 1.062169, 0.9200729, 1, 0, 0.9607843, 1,
0.9853488, 1.120947, 1.985489, 1, 0, 0.9529412, 1,
0.9872685, -0.815905, 2.874078, 1, 0, 0.9490196, 1,
0.9942465, -0.4452162, 2.562412, 1, 0, 0.9411765, 1,
1.014187, -0.08807781, 2.59092, 1, 0, 0.9372549, 1,
1.020531, -0.08473417, 0.006440856, 1, 0, 0.9294118, 1,
1.021816, 1.020999, 1.817034, 1, 0, 0.9254902, 1,
1.029844, 0.734728, 1.193528, 1, 0, 0.9176471, 1,
1.032858, 0.6143378, 0.4155901, 1, 0, 0.9137255, 1,
1.038677, -0.5361242, 1.628854, 1, 0, 0.9058824, 1,
1.040249, -1.861347, 2.901933, 1, 0, 0.9019608, 1,
1.048863, -0.6909712, 3.987533, 1, 0, 0.8941177, 1,
1.055437, 2.081048, 0.461186, 1, 0, 0.8862745, 1,
1.057304, -0.1550577, 2.538842, 1, 0, 0.8823529, 1,
1.062953, 0.6242036, 1.492895, 1, 0, 0.8745098, 1,
1.064184, 1.639457, -0.7934659, 1, 0, 0.8705882, 1,
1.065145, -1.330674, 3.349907, 1, 0, 0.8627451, 1,
1.072971, 0.5405242, 2.050183, 1, 0, 0.8588235, 1,
1.097541, -0.7242679, 2.793356, 1, 0, 0.8509804, 1,
1.097971, 0.5105631, 1.021841, 1, 0, 0.8470588, 1,
1.098493, 0.471709, 1.102174, 1, 0, 0.8392157, 1,
1.105971, 0.4410107, 2.270452, 1, 0, 0.8352941, 1,
1.107489, -1.425652, 4.317265, 1, 0, 0.827451, 1,
1.113351, 0.5691651, 0.8616332, 1, 0, 0.8235294, 1,
1.113605, 0.2301541, 1.095097, 1, 0, 0.8156863, 1,
1.117195, 0.2491316, 0.8616894, 1, 0, 0.8117647, 1,
1.122317, -0.3252866, 2.88465, 1, 0, 0.8039216, 1,
1.126266, 0.3854251, 1.336704, 1, 0, 0.7960784, 1,
1.128306, 0.6007813, 1.615043, 1, 0, 0.7921569, 1,
1.131659, 0.7587291, 2.320121, 1, 0, 0.7843137, 1,
1.138066, -1.034223, 0.7546937, 1, 0, 0.7803922, 1,
1.145393, -0.1828983, 1.912596, 1, 0, 0.772549, 1,
1.1455, 0.3644198, 0.8834717, 1, 0, 0.7686275, 1,
1.146338, 0.9409735, -1.145449, 1, 0, 0.7607843, 1,
1.150121, -0.8494007, 3.158208, 1, 0, 0.7568628, 1,
1.155115, 1.719152, -0.1213816, 1, 0, 0.7490196, 1,
1.156602, 1.095404, 0.4805034, 1, 0, 0.7450981, 1,
1.160318, -1.854474, 2.369366, 1, 0, 0.7372549, 1,
1.16398, -0.3460196, 1.016572, 1, 0, 0.7333333, 1,
1.178482, 0.4382947, 3.537617, 1, 0, 0.7254902, 1,
1.186719, -0.2244992, 1.673469, 1, 0, 0.7215686, 1,
1.187879, 0.6298757, 1.356407, 1, 0, 0.7137255, 1,
1.189361, 1.410969, -0.4296118, 1, 0, 0.7098039, 1,
1.204681, -0.6136471, 2.434152, 1, 0, 0.7019608, 1,
1.208277, -0.02661531, 2.688779, 1, 0, 0.6941177, 1,
1.210222, -0.1045855, 2.377367, 1, 0, 0.6901961, 1,
1.218384, -0.7339938, 1.14671, 1, 0, 0.682353, 1,
1.221315, -0.541177, 0.3224348, 1, 0, 0.6784314, 1,
1.221667, -1.12451, 3.514533, 1, 0, 0.6705883, 1,
1.224172, -1.227648, 2.87431, 1, 0, 0.6666667, 1,
1.230005, 0.1772216, 2.090017, 1, 0, 0.6588235, 1,
1.232048, 1.567156, 3.079115, 1, 0, 0.654902, 1,
1.239228, 0.4159756, 0.2504466, 1, 0, 0.6470588, 1,
1.256949, 0.7267504, 0.2120668, 1, 0, 0.6431373, 1,
1.259553, 0.3867138, 2.20239, 1, 0, 0.6352941, 1,
1.267596, 0.2017395, 2.341022, 1, 0, 0.6313726, 1,
1.275283, -0.339, 2.243346, 1, 0, 0.6235294, 1,
1.309814, -1.688835, 2.184571, 1, 0, 0.6196079, 1,
1.314968, 0.07158709, 2.254052, 1, 0, 0.6117647, 1,
1.315445, 1.861718, 0.8849667, 1, 0, 0.6078432, 1,
1.318178, -0.4887806, 0.9799212, 1, 0, 0.6, 1,
1.324406, 2.65704, 0.6908723, 1, 0, 0.5921569, 1,
1.328975, -0.2350147, 1.874867, 1, 0, 0.5882353, 1,
1.330112, -0.04144242, 0.7324165, 1, 0, 0.5803922, 1,
1.332288, -0.8205745, 2.80509, 1, 0, 0.5764706, 1,
1.341213, -1.073996, 3.654861, 1, 0, 0.5686275, 1,
1.342947, 1.052477, -0.4956178, 1, 0, 0.5647059, 1,
1.359913, 0.6857741, 2.261636, 1, 0, 0.5568628, 1,
1.362993, 2.23689, 0.6324974, 1, 0, 0.5529412, 1,
1.36683, 1.350507, 2.120915, 1, 0, 0.5450981, 1,
1.368703, -0.6935291, 3.802235, 1, 0, 0.5411765, 1,
1.37278, -0.8575651, 2.214016, 1, 0, 0.5333334, 1,
1.383835, -0.830529, 2.623034, 1, 0, 0.5294118, 1,
1.385813, -1.796673, 3.067775, 1, 0, 0.5215687, 1,
1.389539, 0.3502436, 1.607099, 1, 0, 0.5176471, 1,
1.390118, 0.297674, 2.734865, 1, 0, 0.509804, 1,
1.409448, -0.1695696, 0.7849039, 1, 0, 0.5058824, 1,
1.409559, 1.972149, -0.7233383, 1, 0, 0.4980392, 1,
1.412417, 1.146601, 1.08425, 1, 0, 0.4901961, 1,
1.418316, -0.02398209, 2.175686, 1, 0, 0.4862745, 1,
1.434373, -0.04818979, 1.316517, 1, 0, 0.4784314, 1,
1.43727, 1.45839, 1.33796, 1, 0, 0.4745098, 1,
1.450312, -0.2266541, 0.9032915, 1, 0, 0.4666667, 1,
1.459851, -0.1750916, 2.906515, 1, 0, 0.4627451, 1,
1.48307, 0.2445473, 2.235068, 1, 0, 0.454902, 1,
1.494842, -0.4304465, 3.266421, 1, 0, 0.4509804, 1,
1.507908, 0.5467304, -1.027969, 1, 0, 0.4431373, 1,
1.517694, -0.4486174, 1.622985, 1, 0, 0.4392157, 1,
1.523875, -3.128284, 3.069908, 1, 0, 0.4313726, 1,
1.523987, -0.7082622, 2.84435, 1, 0, 0.427451, 1,
1.524885, 0.9620824, -0.1016617, 1, 0, 0.4196078, 1,
1.540926, -0.3342116, 1.491589, 1, 0, 0.4156863, 1,
1.550857, -0.003100155, 2.006509, 1, 0, 0.4078431, 1,
1.558509, 0.4050806, 2.026373, 1, 0, 0.4039216, 1,
1.562567, 1.264386, 1.438836, 1, 0, 0.3960784, 1,
1.567332, 1.231182, 0.9340518, 1, 0, 0.3882353, 1,
1.572396, 0.2338571, 1.103943, 1, 0, 0.3843137, 1,
1.57554, -0.4745564, 1.6308, 1, 0, 0.3764706, 1,
1.579093, -0.5080388, 2.83308, 1, 0, 0.372549, 1,
1.59988, -0.6398229, 0.879759, 1, 0, 0.3647059, 1,
1.611373, -0.4852582, 1.600146, 1, 0, 0.3607843, 1,
1.616594, -0.6783902, 2.154292, 1, 0, 0.3529412, 1,
1.641597, -0.3142234, 2.544096, 1, 0, 0.3490196, 1,
1.646788, 0.05001535, 0.09062474, 1, 0, 0.3411765, 1,
1.680665, 0.8589916, 1.384128, 1, 0, 0.3372549, 1,
1.681399, 1.107032, 0.425773, 1, 0, 0.3294118, 1,
1.68174, 0.775721, 0.9605513, 1, 0, 0.3254902, 1,
1.68732, -1.164847, 3.049239, 1, 0, 0.3176471, 1,
1.696841, -2.400762, 3.87611, 1, 0, 0.3137255, 1,
1.708485, 0.462789, 0.2742579, 1, 0, 0.3058824, 1,
1.717495, -0.6664023, 2.580729, 1, 0, 0.2980392, 1,
1.728741, -0.7099187, 3.332179, 1, 0, 0.2941177, 1,
1.74757, -0.3905546, 0.1098586, 1, 0, 0.2862745, 1,
1.755952, -1.74083, 2.063992, 1, 0, 0.282353, 1,
1.772146, 0.3178039, 1.657072, 1, 0, 0.2745098, 1,
1.773483, 0.2810003, 0.9853265, 1, 0, 0.2705882, 1,
1.774692, 0.9580401, 2.828289, 1, 0, 0.2627451, 1,
1.788273, 1.367426, 1.287774, 1, 0, 0.2588235, 1,
1.788677, 0.4653691, 1.781731, 1, 0, 0.2509804, 1,
1.789373, 1.05347, -1.053074, 1, 0, 0.2470588, 1,
1.793362, -0.3664126, 1.752568, 1, 0, 0.2392157, 1,
1.80212, 0.5658813, 1.204035, 1, 0, 0.2352941, 1,
1.807787, -0.1504822, 0.7433341, 1, 0, 0.227451, 1,
1.821682, 0.5571865, 1.520763, 1, 0, 0.2235294, 1,
1.846306, -0.7324739, 1.863325, 1, 0, 0.2156863, 1,
1.859608, 1.461483, 1.669082, 1, 0, 0.2117647, 1,
1.893589, 0.9815747, 1.302084, 1, 0, 0.2039216, 1,
1.897689, 0.2641992, 0.9525223, 1, 0, 0.1960784, 1,
1.93894, 0.2024416, 1.737079, 1, 0, 0.1921569, 1,
1.946619, 0.7414858, 1.638605, 1, 0, 0.1843137, 1,
1.971173, -0.2289347, 1.718099, 1, 0, 0.1803922, 1,
1.980716, -0.03514617, 2.959398, 1, 0, 0.172549, 1,
1.985926, 1.058753, 0.9638498, 1, 0, 0.1686275, 1,
2.003018, -0.1397451, 0.7951549, 1, 0, 0.1607843, 1,
2.005411, -0.7950929, 2.185513, 1, 0, 0.1568628, 1,
2.026272, 0.1465587, -0.02711044, 1, 0, 0.1490196, 1,
2.027713, 0.515534, 1.111615, 1, 0, 0.145098, 1,
2.033618, -1.560359, 1.812991, 1, 0, 0.1372549, 1,
2.034431, -0.9288304, 2.53267, 1, 0, 0.1333333, 1,
2.051015, -1.983614, 1.575023, 1, 0, 0.1254902, 1,
2.05535, -0.1432869, 1.883967, 1, 0, 0.1215686, 1,
2.062617, -0.07955506, 1.103158, 1, 0, 0.1137255, 1,
2.089118, 0.5204228, 0.7878578, 1, 0, 0.1098039, 1,
2.099815, -0.4699821, 1.649184, 1, 0, 0.1019608, 1,
2.109314, 1.003654, 2.771842, 1, 0, 0.09411765, 1,
2.140871, -0.3990078, 1.813682, 1, 0, 0.09019608, 1,
2.223232, -0.5888599, 1.3377, 1, 0, 0.08235294, 1,
2.224165, -0.3903233, 3.583162, 1, 0, 0.07843138, 1,
2.255832, 0.1233922, 1.352401, 1, 0, 0.07058824, 1,
2.275471, -1.342178, 2.675932, 1, 0, 0.06666667, 1,
2.3469, 0.9784182, 1.305479, 1, 0, 0.05882353, 1,
2.435252, -0.09638292, 1.646144, 1, 0, 0.05490196, 1,
2.448847, -1.059523, 2.78674, 1, 0, 0.04705882, 1,
2.456228, 0.830157, 1.650409, 1, 0, 0.04313726, 1,
2.488644, -0.0579062, 3.007483, 1, 0, 0.03529412, 1,
2.568667, 0.7544641, 0.9178199, 1, 0, 0.03137255, 1,
2.726058, -0.5611661, 2.566046, 1, 0, 0.02352941, 1,
2.916476, 0.8144101, 1.514322, 1, 0, 0.01960784, 1,
3.362288, -0.5288376, 2.173603, 1, 0, 0.01176471, 1,
3.532329, 0.479203, 2.490333, 1, 0, 0.007843138, 1
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
0.4203608, -4.243744, -7.381774, 0, -0.5, 0.5, 0.5,
0.4203608, -4.243744, -7.381774, 1, -0.5, 0.5, 0.5,
0.4203608, -4.243744, -7.381774, 1, 1.5, 0.5, 0.5,
0.4203608, -4.243744, -7.381774, 0, 1.5, 0.5, 0.5
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
-3.746565, 0.1621599, -7.381774, 0, -0.5, 0.5, 0.5,
-3.746565, 0.1621599, -7.381774, 1, -0.5, 0.5, 0.5,
-3.746565, 0.1621599, -7.381774, 1, 1.5, 0.5, 0.5,
-3.746565, 0.1621599, -7.381774, 0, 1.5, 0.5, 0.5
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
-3.746565, -4.243744, -0.06491423, 0, -0.5, 0.5, 0.5,
-3.746565, -4.243744, -0.06491423, 1, -0.5, 0.5, 0.5,
-3.746565, -4.243744, -0.06491423, 1, 1.5, 0.5, 0.5,
-3.746565, -4.243744, -0.06491423, 0, 1.5, 0.5, 0.5
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
-2, -3.226997, -5.693268,
3, -3.226997, -5.693268,
-2, -3.226997, -5.693268,
-2, -3.396455, -5.974686,
-1, -3.226997, -5.693268,
-1, -3.396455, -5.974686,
0, -3.226997, -5.693268,
0, -3.396455, -5.974686,
1, -3.226997, -5.693268,
1, -3.396455, -5.974686,
2, -3.226997, -5.693268,
2, -3.396455, -5.974686,
3, -3.226997, -5.693268,
3, -3.396455, -5.974686
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
-2, -3.735371, -6.537521, 0, -0.5, 0.5, 0.5,
-2, -3.735371, -6.537521, 1, -0.5, 0.5, 0.5,
-2, -3.735371, -6.537521, 1, 1.5, 0.5, 0.5,
-2, -3.735371, -6.537521, 0, 1.5, 0.5, 0.5,
-1, -3.735371, -6.537521, 0, -0.5, 0.5, 0.5,
-1, -3.735371, -6.537521, 1, -0.5, 0.5, 0.5,
-1, -3.735371, -6.537521, 1, 1.5, 0.5, 0.5,
-1, -3.735371, -6.537521, 0, 1.5, 0.5, 0.5,
0, -3.735371, -6.537521, 0, -0.5, 0.5, 0.5,
0, -3.735371, -6.537521, 1, -0.5, 0.5, 0.5,
0, -3.735371, -6.537521, 1, 1.5, 0.5, 0.5,
0, -3.735371, -6.537521, 0, 1.5, 0.5, 0.5,
1, -3.735371, -6.537521, 0, -0.5, 0.5, 0.5,
1, -3.735371, -6.537521, 1, -0.5, 0.5, 0.5,
1, -3.735371, -6.537521, 1, 1.5, 0.5, 0.5,
1, -3.735371, -6.537521, 0, 1.5, 0.5, 0.5,
2, -3.735371, -6.537521, 0, -0.5, 0.5, 0.5,
2, -3.735371, -6.537521, 1, -0.5, 0.5, 0.5,
2, -3.735371, -6.537521, 1, 1.5, 0.5, 0.5,
2, -3.735371, -6.537521, 0, 1.5, 0.5, 0.5,
3, -3.735371, -6.537521, 0, -0.5, 0.5, 0.5,
3, -3.735371, -6.537521, 1, -0.5, 0.5, 0.5,
3, -3.735371, -6.537521, 1, 1.5, 0.5, 0.5,
3, -3.735371, -6.537521, 0, 1.5, 0.5, 0.5
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
-2.784967, -3, -5.693268,
-2.784967, 3, -5.693268,
-2.784967, -3, -5.693268,
-2.945233, -3, -5.974686,
-2.784967, -2, -5.693268,
-2.945233, -2, -5.974686,
-2.784967, -1, -5.693268,
-2.945233, -1, -5.974686,
-2.784967, 0, -5.693268,
-2.945233, 0, -5.974686,
-2.784967, 1, -5.693268,
-2.945233, 1, -5.974686,
-2.784967, 2, -5.693268,
-2.945233, 2, -5.974686,
-2.784967, 3, -5.693268,
-2.945233, 3, -5.974686
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
-3.265766, -3, -6.537521, 0, -0.5, 0.5, 0.5,
-3.265766, -3, -6.537521, 1, -0.5, 0.5, 0.5,
-3.265766, -3, -6.537521, 1, 1.5, 0.5, 0.5,
-3.265766, -3, -6.537521, 0, 1.5, 0.5, 0.5,
-3.265766, -2, -6.537521, 0, -0.5, 0.5, 0.5,
-3.265766, -2, -6.537521, 1, -0.5, 0.5, 0.5,
-3.265766, -2, -6.537521, 1, 1.5, 0.5, 0.5,
-3.265766, -2, -6.537521, 0, 1.5, 0.5, 0.5,
-3.265766, -1, -6.537521, 0, -0.5, 0.5, 0.5,
-3.265766, -1, -6.537521, 1, -0.5, 0.5, 0.5,
-3.265766, -1, -6.537521, 1, 1.5, 0.5, 0.5,
-3.265766, -1, -6.537521, 0, 1.5, 0.5, 0.5,
-3.265766, 0, -6.537521, 0, -0.5, 0.5, 0.5,
-3.265766, 0, -6.537521, 1, -0.5, 0.5, 0.5,
-3.265766, 0, -6.537521, 1, 1.5, 0.5, 0.5,
-3.265766, 0, -6.537521, 0, 1.5, 0.5, 0.5,
-3.265766, 1, -6.537521, 0, -0.5, 0.5, 0.5,
-3.265766, 1, -6.537521, 1, -0.5, 0.5, 0.5,
-3.265766, 1, -6.537521, 1, 1.5, 0.5, 0.5,
-3.265766, 1, -6.537521, 0, 1.5, 0.5, 0.5,
-3.265766, 2, -6.537521, 0, -0.5, 0.5, 0.5,
-3.265766, 2, -6.537521, 1, -0.5, 0.5, 0.5,
-3.265766, 2, -6.537521, 1, 1.5, 0.5, 0.5,
-3.265766, 2, -6.537521, 0, 1.5, 0.5, 0.5,
-3.265766, 3, -6.537521, 0, -0.5, 0.5, 0.5,
-3.265766, 3, -6.537521, 1, -0.5, 0.5, 0.5,
-3.265766, 3, -6.537521, 1, 1.5, 0.5, 0.5,
-3.265766, 3, -6.537521, 0, 1.5, 0.5, 0.5
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
-2.784967, -3.226997, -4,
-2.784967, -3.226997, 4,
-2.784967, -3.226997, -4,
-2.945233, -3.396455, -4,
-2.784967, -3.226997, -2,
-2.945233, -3.396455, -2,
-2.784967, -3.226997, 0,
-2.945233, -3.396455, 0,
-2.784967, -3.226997, 2,
-2.945233, -3.396455, 2,
-2.784967, -3.226997, 4,
-2.945233, -3.396455, 4
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
-3.265766, -3.735371, -4, 0, -0.5, 0.5, 0.5,
-3.265766, -3.735371, -4, 1, -0.5, 0.5, 0.5,
-3.265766, -3.735371, -4, 1, 1.5, 0.5, 0.5,
-3.265766, -3.735371, -4, 0, 1.5, 0.5, 0.5,
-3.265766, -3.735371, -2, 0, -0.5, 0.5, 0.5,
-3.265766, -3.735371, -2, 1, -0.5, 0.5, 0.5,
-3.265766, -3.735371, -2, 1, 1.5, 0.5, 0.5,
-3.265766, -3.735371, -2, 0, 1.5, 0.5, 0.5,
-3.265766, -3.735371, 0, 0, -0.5, 0.5, 0.5,
-3.265766, -3.735371, 0, 1, -0.5, 0.5, 0.5,
-3.265766, -3.735371, 0, 1, 1.5, 0.5, 0.5,
-3.265766, -3.735371, 0, 0, 1.5, 0.5, 0.5,
-3.265766, -3.735371, 2, 0, -0.5, 0.5, 0.5,
-3.265766, -3.735371, 2, 1, -0.5, 0.5, 0.5,
-3.265766, -3.735371, 2, 1, 1.5, 0.5, 0.5,
-3.265766, -3.735371, 2, 0, 1.5, 0.5, 0.5,
-3.265766, -3.735371, 4, 0, -0.5, 0.5, 0.5,
-3.265766, -3.735371, 4, 1, -0.5, 0.5, 0.5,
-3.265766, -3.735371, 4, 1, 1.5, 0.5, 0.5,
-3.265766, -3.735371, 4, 0, 1.5, 0.5, 0.5
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
-2.784967, -3.226997, -5.693268,
-2.784967, 3.551317, -5.693268,
-2.784967, -3.226997, 5.56344,
-2.784967, 3.551317, 5.56344,
-2.784967, -3.226997, -5.693268,
-2.784967, -3.226997, 5.56344,
-2.784967, 3.551317, -5.693268,
-2.784967, 3.551317, 5.56344,
-2.784967, -3.226997, -5.693268,
3.625688, -3.226997, -5.693268,
-2.784967, -3.226997, 5.56344,
3.625688, -3.226997, 5.56344,
-2.784967, 3.551317, -5.693268,
3.625688, 3.551317, -5.693268,
-2.784967, 3.551317, 5.56344,
3.625688, 3.551317, 5.56344,
3.625688, -3.226997, -5.693268,
3.625688, 3.551317, -5.693268,
3.625688, -3.226997, 5.56344,
3.625688, 3.551317, 5.56344,
3.625688, -3.226997, -5.693268,
3.625688, -3.226997, 5.56344,
3.625688, 3.551317, -5.693268,
3.625688, 3.551317, 5.56344
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
var radius = 7.806999;
var distance = 34.73422;
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
mvMatrix.translate( -0.4203608, -0.1621599, 0.06491423 );
mvMatrix.scale( 1.316727, 1.245307, 0.7498711 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.73422);
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
isopropylammonium<-read.table("isopropylammonium.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-isopropylammonium$V2
```

```
## Error in eval(expr, envir, enclos): object 'isopropylammonium' not found
```

```r
y<-isopropylammonium$V3
```

```
## Error in eval(expr, envir, enclos): object 'isopropylammonium' not found
```

```r
z<-isopropylammonium$V4
```

```
## Error in eval(expr, envir, enclos): object 'isopropylammonium' not found
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
-2.691608, 0.4097364, -0.09164924, 0, 0, 1, 1, 1,
-2.671085, 0.0001490036, -1.895195, 1, 0, 0, 1, 1,
-2.645371, -0.02041623, -2.621216, 1, 0, 0, 1, 1,
-2.618438, -2.089907, -0.628723, 1, 0, 0, 1, 1,
-2.544165, -1.012059, -0.4065417, 1, 0, 0, 1, 1,
-2.540601, 0.7234459, -1.411722, 1, 0, 0, 1, 1,
-2.524061, -0.4251888, -0.07289608, 0, 0, 0, 1, 1,
-2.518987, 1.703159, -0.6194153, 0, 0, 0, 1, 1,
-2.488752, -1.045706, -2.569358, 0, 0, 0, 1, 1,
-2.448737, -1.420472, -1.165892, 0, 0, 0, 1, 1,
-2.445028, -0.02001511, -2.532131, 0, 0, 0, 1, 1,
-2.439661, -0.7282696, -2.738206, 0, 0, 0, 1, 1,
-2.344546, 0.1172314, -1.678711, 0, 0, 0, 1, 1,
-2.318316, -0.7190346, -0.774038, 1, 1, 1, 1, 1,
-2.299143, -0.2673815, -2.153176, 1, 1, 1, 1, 1,
-2.268802, -0.5953225, -3.230451, 1, 1, 1, 1, 1,
-2.219948, 0.2863412, -2.37525, 1, 1, 1, 1, 1,
-2.107866, -0.09082413, -0.5447773, 1, 1, 1, 1, 1,
-2.106502, 1.161736, -1.987872, 1, 1, 1, 1, 1,
-2.101527, -2.078384, -3.497269, 1, 1, 1, 1, 1,
-2.079802, 0.371689, -1.487757, 1, 1, 1, 1, 1,
-2.021462, -1.455953, -1.993182, 1, 1, 1, 1, 1,
-1.988174, -0.7124466, -3.585565, 1, 1, 1, 1, 1,
-1.984931, 0.4765678, -0.5583174, 1, 1, 1, 1, 1,
-1.949628, -1.548323, -2.227063, 1, 1, 1, 1, 1,
-1.930807, -1.899296, -1.821136, 1, 1, 1, 1, 1,
-1.927283, 0.9664411, -1.018191, 1, 1, 1, 1, 1,
-1.914957, 0.3029665, -0.9153981, 1, 1, 1, 1, 1,
-1.898129, -0.3035545, -2.541823, 0, 0, 1, 1, 1,
-1.877164, -0.5637022, -1.428719, 1, 0, 0, 1, 1,
-1.868341, 0.8652477, -1.426484, 1, 0, 0, 1, 1,
-1.850917, -0.7787866, -2.102955, 1, 0, 0, 1, 1,
-1.843973, 0.2091297, -2.012136, 1, 0, 0, 1, 1,
-1.835817, 0.8095587, -1.469447, 1, 0, 0, 1, 1,
-1.829257, -1.08157, -1.223669, 0, 0, 0, 1, 1,
-1.825783, 0.1537175, -1.727375, 0, 0, 0, 1, 1,
-1.79557, 0.2261762, -2.25909, 0, 0, 0, 1, 1,
-1.792992, -0.9744435, -1.55502, 0, 0, 0, 1, 1,
-1.786103, 0.975675, -0.208079, 0, 0, 0, 1, 1,
-1.76061, 0.1419027, -2.598704, 0, 0, 0, 1, 1,
-1.754949, 0.1345232, -2.024292, 0, 0, 0, 1, 1,
-1.750314, 0.3077522, -2.434702, 1, 1, 1, 1, 1,
-1.734783, 0.1287402, -2.489939, 1, 1, 1, 1, 1,
-1.715509, -0.2511143, -1.142239, 1, 1, 1, 1, 1,
-1.711083, 0.5863827, -2.386615, 1, 1, 1, 1, 1,
-1.706198, 3.341802, -0.7642173, 1, 1, 1, 1, 1,
-1.704354, -0.9708691, -1.380069, 1, 1, 1, 1, 1,
-1.699645, 0.4255971, -2.363408, 1, 1, 1, 1, 1,
-1.696606, -0.7027853, -1.48528, 1, 1, 1, 1, 1,
-1.695806, -0.01788794, -1.067361, 1, 1, 1, 1, 1,
-1.692539, -1.123528, -1.297758, 1, 1, 1, 1, 1,
-1.690365, -0.3595181, -1.772984, 1, 1, 1, 1, 1,
-1.688313, 1.576112, -0.6576648, 1, 1, 1, 1, 1,
-1.677716, 0.3668864, -2.179832, 1, 1, 1, 1, 1,
-1.672475, 0.4671507, -2.661204, 1, 1, 1, 1, 1,
-1.672358, -0.1685266, 0.7180794, 1, 1, 1, 1, 1,
-1.651692, -0.5254806, -1.204924, 0, 0, 1, 1, 1,
-1.642874, 0.9615001, -1.999009, 1, 0, 0, 1, 1,
-1.635295, 0.5301934, -2.50153, 1, 0, 0, 1, 1,
-1.62492, 0.1925101, -0.7953304, 1, 0, 0, 1, 1,
-1.613001, 0.9430957, -2.449942, 1, 0, 0, 1, 1,
-1.609114, 0.643726, -0.1461908, 1, 0, 0, 1, 1,
-1.58113, -0.5465802, -1.133315, 0, 0, 0, 1, 1,
-1.579095, -1.33277, -2.616872, 0, 0, 0, 1, 1,
-1.571237, -0.1723989, -2.689961, 0, 0, 0, 1, 1,
-1.568413, 1.020515, -1.515773, 0, 0, 0, 1, 1,
-1.567598, 1.63348, -0.02636763, 0, 0, 0, 1, 1,
-1.559301, 0.2509064, -3.023644, 0, 0, 0, 1, 1,
-1.558464, 1.096133, 1.816583, 0, 0, 0, 1, 1,
-1.550572, 0.1372534, -0.865102, 1, 1, 1, 1, 1,
-1.542221, 0.5681233, -0.7894043, 1, 1, 1, 1, 1,
-1.533464, 0.6964239, -1.180642, 1, 1, 1, 1, 1,
-1.526111, -0.3020826, -2.506433, 1, 1, 1, 1, 1,
-1.525191, 1.34562, -1.114666, 1, 1, 1, 1, 1,
-1.524535, -0.58047, -1.075967, 1, 1, 1, 1, 1,
-1.504166, 0.7222663, -1.792335, 1, 1, 1, 1, 1,
-1.501972, -1.430399, -2.31434, 1, 1, 1, 1, 1,
-1.497842, 0.1368254, -1.803256, 1, 1, 1, 1, 1,
-1.489239, -0.3718072, -1.44541, 1, 1, 1, 1, 1,
-1.488385, -0.8811762, -3.977717, 1, 1, 1, 1, 1,
-1.480585, -0.5474038, -1.247912, 1, 1, 1, 1, 1,
-1.475752, -0.6853445, -2.889611, 1, 1, 1, 1, 1,
-1.470009, -0.3216228, -1.375979, 1, 1, 1, 1, 1,
-1.429157, 0.1528102, -1.257098, 1, 1, 1, 1, 1,
-1.427325, -0.1075025, -2.765508, 0, 0, 1, 1, 1,
-1.41225, 2.115489, 0.4010744, 1, 0, 0, 1, 1,
-1.41049, 0.7401908, 0.04619846, 1, 0, 0, 1, 1,
-1.40863, 0.06799157, -0.0390975, 1, 0, 0, 1, 1,
-1.395395, -0.1137252, 0.02651484, 1, 0, 0, 1, 1,
-1.382114, -1.633939, -2.677838, 1, 0, 0, 1, 1,
-1.372107, -0.1290853, -0.5253707, 0, 0, 0, 1, 1,
-1.366487, -0.5025159, -1.908089, 0, 0, 0, 1, 1,
-1.355785, -1.232408, -0.9103775, 0, 0, 0, 1, 1,
-1.34795, 2.203134, -0.5735548, 0, 0, 0, 1, 1,
-1.345646, -0.128402, -1.014242, 0, 0, 0, 1, 1,
-1.335587, -0.573117, -1.001139, 0, 0, 0, 1, 1,
-1.333315, -0.3070319, 0.6391001, 0, 0, 0, 1, 1,
-1.330968, 0.299649, -1.933882, 1, 1, 1, 1, 1,
-1.329349, 0.3305649, -2.832541, 1, 1, 1, 1, 1,
-1.32159, -2.232385, -2.685396, 1, 1, 1, 1, 1,
-1.319899, 0.3342846, -1.428255, 1, 1, 1, 1, 1,
-1.319875, -2.14843, -1.203793, 1, 1, 1, 1, 1,
-1.319118, 0.5437368, 0.9951944, 1, 1, 1, 1, 1,
-1.316933, 1.195467, -1.363303, 1, 1, 1, 1, 1,
-1.306864, -0.6743357, -1.548883, 1, 1, 1, 1, 1,
-1.303527, -1.116215, -4.222234, 1, 1, 1, 1, 1,
-1.293799, -1.506092, -3.629086, 1, 1, 1, 1, 1,
-1.28398, 0.150504, -2.024782, 1, 1, 1, 1, 1,
-1.281674, 0.4171617, -2.66431, 1, 1, 1, 1, 1,
-1.27204, -1.654142, -1.897971, 1, 1, 1, 1, 1,
-1.269961, 0.5699798, -0.3716144, 1, 1, 1, 1, 1,
-1.26799, -2.017535, -1.605362, 1, 1, 1, 1, 1,
-1.265646, -0.425775, -0.5740508, 0, 0, 1, 1, 1,
-1.26139, -1.305988, -1.515491, 1, 0, 0, 1, 1,
-1.254647, 0.2210279, -1.566876, 1, 0, 0, 1, 1,
-1.249414, -0.3906823, -0.1973738, 1, 0, 0, 1, 1,
-1.246448, 0.2369662, 0.1826226, 1, 0, 0, 1, 1,
-1.243158, 0.03142275, -1.296283, 1, 0, 0, 1, 1,
-1.238417, 0.8152016, -1.112306, 0, 0, 0, 1, 1,
-1.233692, 0.9006834, -0.8358476, 0, 0, 0, 1, 1,
-1.224147, -0.8761379, -2.572092, 0, 0, 0, 1, 1,
-1.223279, -2.083811, -0.1549368, 0, 0, 0, 1, 1,
-1.217485, 0.785459, -1.301888, 0, 0, 0, 1, 1,
-1.216067, -0.663986, -3.585905, 0, 0, 0, 1, 1,
-1.212467, 1.091616, -2.425272, 0, 0, 0, 1, 1,
-1.210367, -0.7510028, -2.195614, 1, 1, 1, 1, 1,
-1.20396, -0.126824, 0.5366467, 1, 1, 1, 1, 1,
-1.199061, -0.1276588, -1.584424, 1, 1, 1, 1, 1,
-1.189257, 1.301421, -0.9226255, 1, 1, 1, 1, 1,
-1.186968, 0.9917268, -0.3159494, 1, 1, 1, 1, 1,
-1.185188, 0.9195762, -0.3294543, 1, 1, 1, 1, 1,
-1.183311, -0.3465408, -1.260785, 1, 1, 1, 1, 1,
-1.179588, 0.2279916, -1.253182, 1, 1, 1, 1, 1,
-1.177986, -2.019283, -1.241888, 1, 1, 1, 1, 1,
-1.176725, -0.3863704, -0.9550998, 1, 1, 1, 1, 1,
-1.159255, 1.204506, 0.1613668, 1, 1, 1, 1, 1,
-1.154512, -0.206852, -3.023879, 1, 1, 1, 1, 1,
-1.151995, 1.117987, -2.657703, 1, 1, 1, 1, 1,
-1.147197, -0.6976293, -3.458349, 1, 1, 1, 1, 1,
-1.146915, -0.3037023, -2.626164, 1, 1, 1, 1, 1,
-1.140174, -0.3097955, -0.9922553, 0, 0, 1, 1, 1,
-1.137305, 0.9475802, -0.5956972, 1, 0, 0, 1, 1,
-1.134094, 0.6771788, -0.829674, 1, 0, 0, 1, 1,
-1.126707, -0.7249491, -2.149422, 1, 0, 0, 1, 1,
-1.115416, -0.5283677, -0.3847438, 1, 0, 0, 1, 1,
-1.106374, -0.5667555, -2.523365, 1, 0, 0, 1, 1,
-1.094115, 1.537197, 0.1581291, 0, 0, 0, 1, 1,
-1.091366, 0.2208226, -2.680824, 0, 0, 0, 1, 1,
-1.088314, 0.422152, 0.9046132, 0, 0, 0, 1, 1,
-1.087981, 0.6827221, -1.973027, 0, 0, 0, 1, 1,
-1.084902, -1.29806, -0.196307, 0, 0, 0, 1, 1,
-1.080712, 0.9817869, -0.1962139, 0, 0, 0, 1, 1,
-1.078643, -0.588717, -3.579395, 0, 0, 0, 1, 1,
-1.075265, -0.7630129, -2.487926, 1, 1, 1, 1, 1,
-1.069723, 0.9205319, -1.753359, 1, 1, 1, 1, 1,
-1.062201, 0.4554213, -1.274004, 1, 1, 1, 1, 1,
-1.060908, 1.155049, 1.876048, 1, 1, 1, 1, 1,
-1.058312, 0.8847419, -1.018975, 1, 1, 1, 1, 1,
-1.057298, -0.4616851, -1.367057, 1, 1, 1, 1, 1,
-1.051633, -0.627511, -2.862656, 1, 1, 1, 1, 1,
-1.049736, -0.7893836, 0.2238122, 1, 1, 1, 1, 1,
-1.046451, -0.9197001, -1.332886, 1, 1, 1, 1, 1,
-1.041671, 0.9827018, 0.197276, 1, 1, 1, 1, 1,
-1.033803, -2.170085, -1.266749, 1, 1, 1, 1, 1,
-1.033746, -0.557723, -0.01150606, 1, 1, 1, 1, 1,
-1.023281, -1.361339, -1.694221, 1, 1, 1, 1, 1,
-1.020376, -0.8779736, -2.382354, 1, 1, 1, 1, 1,
-1.018573, -0.6585737, -1.842732, 1, 1, 1, 1, 1,
-1.018086, 0.5057737, 0.9746228, 0, 0, 1, 1, 1,
-1.0028, -0.3243018, -1.116709, 1, 0, 0, 1, 1,
-0.9986877, -0.4091547, -1.540954, 1, 0, 0, 1, 1,
-0.9870219, -0.9278474, -3.141153, 1, 0, 0, 1, 1,
-0.9719434, 0.4288764, -1.756018, 1, 0, 0, 1, 1,
-0.9718421, -1.416093, -2.517263, 1, 0, 0, 1, 1,
-0.9629199, -0.3715883, -2.689129, 0, 0, 0, 1, 1,
-0.9624172, 1.349399, 1.056209, 0, 0, 0, 1, 1,
-0.9613197, 0.7489131, -0.3943129, 0, 0, 0, 1, 1,
-0.9611672, 0.4174369, -1.364833, 0, 0, 0, 1, 1,
-0.9577999, -1.254292, -2.05669, 0, 0, 0, 1, 1,
-0.9570948, -0.6944339, -1.544549, 0, 0, 0, 1, 1,
-0.9538716, 0.5548857, -1.88166, 0, 0, 0, 1, 1,
-0.9531285, -0.9175833, -1.734798, 1, 1, 1, 1, 1,
-0.9507926, -1.976576, -2.598387, 1, 1, 1, 1, 1,
-0.9485537, 0.2809975, 0.5658626, 1, 1, 1, 1, 1,
-0.94575, 0.9942276, 0.2700771, 1, 1, 1, 1, 1,
-0.9451163, 0.3812343, -0.9144011, 1, 1, 1, 1, 1,
-0.9434075, -0.2327517, -3.091232, 1, 1, 1, 1, 1,
-0.934232, -1.295172, -3.418212, 1, 1, 1, 1, 1,
-0.9328147, 0.7351659, -0.5016, 1, 1, 1, 1, 1,
-0.9299766, -0.2200812, -0.6509296, 1, 1, 1, 1, 1,
-0.929809, -0.874137, -0.8519678, 1, 1, 1, 1, 1,
-0.9267962, 0.2461384, -0.4145617, 1, 1, 1, 1, 1,
-0.9173093, -0.247077, -1.65593, 1, 1, 1, 1, 1,
-0.9170616, -0.2180524, -2.38719, 1, 1, 1, 1, 1,
-0.9162997, -0.6072924, -1.594716, 1, 1, 1, 1, 1,
-0.9123003, 0.717577, -0.160921, 1, 1, 1, 1, 1,
-0.9119805, -0.01590604, -2.058966, 0, 0, 1, 1, 1,
-0.9081002, -0.8460817, -1.2478, 1, 0, 0, 1, 1,
-0.9045359, 0.3687119, 0.3619295, 1, 0, 0, 1, 1,
-0.9043771, 1.900726, -1.674545, 1, 0, 0, 1, 1,
-0.8985476, -0.4991009, -2.475134, 1, 0, 0, 1, 1,
-0.8902193, -1.021122, -3.549285, 1, 0, 0, 1, 1,
-0.8837946, -1.243111, -2.234905, 0, 0, 0, 1, 1,
-0.8781006, 0.5035523, -1.363122, 0, 0, 0, 1, 1,
-0.8739523, -0.1448604, -0.1566677, 0, 0, 0, 1, 1,
-0.8679104, -1.042192, -1.765048, 0, 0, 0, 1, 1,
-0.8604395, 0.7587951, -0.9139454, 0, 0, 0, 1, 1,
-0.8586214, 0.5626565, -0.9549859, 0, 0, 0, 1, 1,
-0.8556553, 0.816494, -0.08152492, 0, 0, 0, 1, 1,
-0.8546551, -1.552188, -2.253107, 1, 1, 1, 1, 1,
-0.8536213, -0.02516505, -2.872981, 1, 1, 1, 1, 1,
-0.8530151, 0.6509817, -0.5551367, 1, 1, 1, 1, 1,
-0.8505195, -1.187297, -3.22034, 1, 1, 1, 1, 1,
-0.848913, -1.020921, -2.373768, 1, 1, 1, 1, 1,
-0.8456739, 1.015581, -0.3610689, 1, 1, 1, 1, 1,
-0.8374772, 0.1008565, -1.926336, 1, 1, 1, 1, 1,
-0.8346315, -0.6229396, -2.702536, 1, 1, 1, 1, 1,
-0.8276796, -0.2257993, -0.8038362, 1, 1, 1, 1, 1,
-0.8264071, -0.449468, -2.226252, 1, 1, 1, 1, 1,
-0.825679, 0.7177149, -2.439225, 1, 1, 1, 1, 1,
-0.823988, -1.751336, -2.43116, 1, 1, 1, 1, 1,
-0.8159888, 1.12557, -0.2151956, 1, 1, 1, 1, 1,
-0.8127121, -0.8366916, -3.920923, 1, 1, 1, 1, 1,
-0.8120513, -0.07319583, -2.724203, 1, 1, 1, 1, 1,
-0.8071333, 0.5844852, -2.410422, 0, 0, 1, 1, 1,
-0.8063289, 0.4622237, -0.8641918, 1, 0, 0, 1, 1,
-0.7981115, 1.525093, -3.520239, 1, 0, 0, 1, 1,
-0.798063, -0.6301264, -1.367133, 1, 0, 0, 1, 1,
-0.7967884, -0.2758423, -2.205681, 1, 0, 0, 1, 1,
-0.7889088, -0.3703097, -2.776635, 1, 0, 0, 1, 1,
-0.7875642, -0.5422235, -1.946358, 0, 0, 0, 1, 1,
-0.7859399, 0.13585, -1.209592, 0, 0, 0, 1, 1,
-0.785879, -0.3493528, -0.5814395, 0, 0, 0, 1, 1,
-0.7804348, -0.7442181, -3.090245, 0, 0, 0, 1, 1,
-0.7795173, -0.5500852, -2.453018, 0, 0, 0, 1, 1,
-0.7759437, -0.9040022, -2.43381, 0, 0, 0, 1, 1,
-0.7706767, -0.1155424, -2.10386, 0, 0, 0, 1, 1,
-0.7699481, -2.618221, -2.464232, 1, 1, 1, 1, 1,
-0.7680308, 3.452604, -0.758553, 1, 1, 1, 1, 1,
-0.7677238, 0.1317304, -2.180526, 1, 1, 1, 1, 1,
-0.7645469, 2.422626, 0.1427233, 1, 1, 1, 1, 1,
-0.7630885, 0.6016688, -0.8471026, 1, 1, 1, 1, 1,
-0.7629476, -1.845647, -2.854141, 1, 1, 1, 1, 1,
-0.7583259, -0.01852416, -2.047348, 1, 1, 1, 1, 1,
-0.7561648, -1.850093, -3.09335, 1, 1, 1, 1, 1,
-0.7541685, -0.6259982, -2.23878, 1, 1, 1, 1, 1,
-0.7534971, 0.846076, -1.161364, 1, 1, 1, 1, 1,
-0.7491694, 1.561757, -0.5557437, 1, 1, 1, 1, 1,
-0.7468179, -0.9409405, -1.828182, 1, 1, 1, 1, 1,
-0.7403343, -1.165151, -3.598603, 1, 1, 1, 1, 1,
-0.7396175, 0.07583051, -1.123098, 1, 1, 1, 1, 1,
-0.7394777, -0.9978533, -2.569294, 1, 1, 1, 1, 1,
-0.7344931, -0.1189236, -1.222204, 0, 0, 1, 1, 1,
-0.7308024, -0.2069651, -1.489684, 1, 0, 0, 1, 1,
-0.7242005, -0.07455453, -3.022158, 1, 0, 0, 1, 1,
-0.7202809, -1.593967, -3.849452, 1, 0, 0, 1, 1,
-0.7173405, 0.7387533, -1.20453, 1, 0, 0, 1, 1,
-0.7135143, -1.244828, -2.992587, 1, 0, 0, 1, 1,
-0.7109729, -1.077134, -2.675101, 0, 0, 0, 1, 1,
-0.7104567, -0.2968818, -2.857557, 0, 0, 0, 1, 1,
-0.710213, -1.687035, -2.722789, 0, 0, 0, 1, 1,
-0.7017589, 2.919172, -0.3377979, 0, 0, 0, 1, 1,
-0.6995881, -0.7377251, -1.571271, 0, 0, 0, 1, 1,
-0.6944281, 1.197187, -0.624716, 0, 0, 0, 1, 1,
-0.6912816, 1.534174, -0.521985, 0, 0, 0, 1, 1,
-0.6861683, -0.2614616, -2.164838, 1, 1, 1, 1, 1,
-0.6859807, -1.260951, -1.766932, 1, 1, 1, 1, 1,
-0.6810988, 0.9880906, -0.4440548, 1, 1, 1, 1, 1,
-0.6751491, -1.391279, -2.624069, 1, 1, 1, 1, 1,
-0.6708494, -1.482082, -4.535456, 1, 1, 1, 1, 1,
-0.6682554, -0.3224823, -1.409209, 1, 1, 1, 1, 1,
-0.6653419, 0.07768948, -1.208103, 1, 1, 1, 1, 1,
-0.6634701, 0.9462854, -0.1895879, 1, 1, 1, 1, 1,
-0.6630273, 0.2766489, -0.8774374, 1, 1, 1, 1, 1,
-0.6605833, -0.3139959, -0.9534672, 1, 1, 1, 1, 1,
-0.6570961, -0.6338431, -1.696396, 1, 1, 1, 1, 1,
-0.6532766, -0.8184534, -2.792565, 1, 1, 1, 1, 1,
-0.649412, -0.8494204, -2.586218, 1, 1, 1, 1, 1,
-0.6491347, -0.9305507, -1.662363, 1, 1, 1, 1, 1,
-0.648922, -0.3970302, -0.4723939, 1, 1, 1, 1, 1,
-0.6480771, -2.549616, -2.324499, 0, 0, 1, 1, 1,
-0.6325871, -0.2737838, -0.9023252, 1, 0, 0, 1, 1,
-0.6265094, -0.8666256, -2.973741, 1, 0, 0, 1, 1,
-0.626186, -0.4540789, -0.5489726, 1, 0, 0, 1, 1,
-0.6259563, 0.3131883, -2.051102, 1, 0, 0, 1, 1,
-0.6253113, 1.81655, -1.455277, 1, 0, 0, 1, 1,
-0.6204001, -0.806526, -1.902958, 0, 0, 0, 1, 1,
-0.6191875, -0.5706804, -1.898659, 0, 0, 0, 1, 1,
-0.6191736, -0.3009359, -1.737721, 0, 0, 0, 1, 1,
-0.617945, 0.6551596, -3.069329, 0, 0, 0, 1, 1,
-0.616087, 1.198067, 2.235013, 0, 0, 0, 1, 1,
-0.6153376, -0.6214933, -2.872851, 0, 0, 0, 1, 1,
-0.6145718, 1.916742, -0.1917164, 0, 0, 0, 1, 1,
-0.6094239, -1.82923, -3.435284, 1, 1, 1, 1, 1,
-0.6045973, 0.5235526, -2.122908, 1, 1, 1, 1, 1,
-0.6003464, -0.5462101, -3.442396, 1, 1, 1, 1, 1,
-0.5979681, 1.130437, -0.09515326, 1, 1, 1, 1, 1,
-0.5959266, 0.5685883, 1.31684, 1, 1, 1, 1, 1,
-0.5957698, 1.624042, -2.804127, 1, 1, 1, 1, 1,
-0.5897558, 0.8763289, 0.4115588, 1, 1, 1, 1, 1,
-0.5873755, -0.4061391, -0.5657648, 1, 1, 1, 1, 1,
-0.5815352, -0.8287581, -2.465422, 1, 1, 1, 1, 1,
-0.5802215, 1.300964, -0.9326462, 1, 1, 1, 1, 1,
-0.5761261, 0.3412303, -1.898288, 1, 1, 1, 1, 1,
-0.5758485, -0.540475, -2.821259, 1, 1, 1, 1, 1,
-0.57467, 1.721632, -0.4301284, 1, 1, 1, 1, 1,
-0.5737221, 0.597613, -1.534563, 1, 1, 1, 1, 1,
-0.5735403, -0.1678676, -2.732189, 1, 1, 1, 1, 1,
-0.569873, 0.3040781, -1.833004, 0, 0, 1, 1, 1,
-0.5693595, 1.408192, 0.4367689, 1, 0, 0, 1, 1,
-0.5638441, -0.9269471, -1.693416, 1, 0, 0, 1, 1,
-0.5637589, -0.7162586, -4.420876, 1, 0, 0, 1, 1,
-0.5601934, 0.4967951, -0.4646711, 1, 0, 0, 1, 1,
-0.5580027, 0.6714517, 0.0917875, 1, 0, 0, 1, 1,
-0.5547149, 1.091648, -0.9727425, 0, 0, 0, 1, 1,
-0.549684, -0.2578297, -1.634841, 0, 0, 0, 1, 1,
-0.5475538, -0.2800694, -3.037148, 0, 0, 0, 1, 1,
-0.5470882, 0.8475873, -0.07182136, 0, 0, 0, 1, 1,
-0.5403897, -0.110891, -1.976768, 0, 0, 0, 1, 1,
-0.535948, 1.406453, -1.745844, 0, 0, 0, 1, 1,
-0.535738, -0.06269548, -1.596982, 0, 0, 0, 1, 1,
-0.530553, 0.941636, 0.8307603, 1, 1, 1, 1, 1,
-0.5285912, 1.294083, 1.3979, 1, 1, 1, 1, 1,
-0.526087, 0.8884367, -0.4034176, 1, 1, 1, 1, 1,
-0.5246246, 0.8947784, -0.9249469, 1, 1, 1, 1, 1,
-0.5217142, 1.580233, -0.1813913, 1, 1, 1, 1, 1,
-0.517566, -2.184989, -1.683393, 1, 1, 1, 1, 1,
-0.5165243, -0.5477636, -2.343378, 1, 1, 1, 1, 1,
-0.5147403, 0.811173, 0.1395608, 1, 1, 1, 1, 1,
-0.5061829, 0.2711558, -1.743576, 1, 1, 1, 1, 1,
-0.5053573, 0.9234694, -1.035655, 1, 1, 1, 1, 1,
-0.5048429, 0.8096168, 1.795917, 1, 1, 1, 1, 1,
-0.504602, -0.5131815, -0.9793677, 1, 1, 1, 1, 1,
-0.5043896, -1.212555, -2.065138, 1, 1, 1, 1, 1,
-0.5033928, 0.9074664, -2.689105, 1, 1, 1, 1, 1,
-0.5019101, 0.3212713, 1.32815, 1, 1, 1, 1, 1,
-0.5007924, -1.025672, -3.079061, 0, 0, 1, 1, 1,
-0.4976704, 0.6270905, -1.053284, 1, 0, 0, 1, 1,
-0.4942362, -0.2227652, -2.717853, 1, 0, 0, 1, 1,
-0.4940403, 0.4557568, -0.8757201, 1, 0, 0, 1, 1,
-0.4925182, 0.4878465, -1.563109, 1, 0, 0, 1, 1,
-0.4891433, -0.6518024, -2.044445, 1, 0, 0, 1, 1,
-0.4875794, -0.3538875, -1.997749, 0, 0, 0, 1, 1,
-0.4867681, -0.3440468, -4.259219, 0, 0, 0, 1, 1,
-0.484909, 0.4564156, -1.148325, 0, 0, 0, 1, 1,
-0.4794902, 0.04515586, -0.2740641, 0, 0, 0, 1, 1,
-0.4769475, 0.8544498, -0.1748741, 0, 0, 0, 1, 1,
-0.4743817, 1.703953, 0.1734056, 0, 0, 0, 1, 1,
-0.469881, 0.9271899, 0.3419413, 0, 0, 0, 1, 1,
-0.4690098, 0.2678931, -1.760026, 1, 1, 1, 1, 1,
-0.4679876, -0.859231, -1.625057, 1, 1, 1, 1, 1,
-0.4657903, -1.455675, -1.528604, 1, 1, 1, 1, 1,
-0.4628913, 0.6798267, -0.8973227, 1, 1, 1, 1, 1,
-0.4627941, 0.1969838, -0.8971027, 1, 1, 1, 1, 1,
-0.458185, -0.7712892, -1.997239, 1, 1, 1, 1, 1,
-0.4548425, -0.5032636, -2.766385, 1, 1, 1, 1, 1,
-0.4548371, -0.3542277, -3.420258, 1, 1, 1, 1, 1,
-0.4468459, 0.3520047, -0.3928985, 1, 1, 1, 1, 1,
-0.4465921, -0.3149422, -3.027945, 1, 1, 1, 1, 1,
-0.4411453, 0.5592647, -1.71971, 1, 1, 1, 1, 1,
-0.4402208, 0.641169, 0.9566985, 1, 1, 1, 1, 1,
-0.4398029, -0.1828699, -1.113101, 1, 1, 1, 1, 1,
-0.4390899, 1.45542, -1.046982, 1, 1, 1, 1, 1,
-0.4335719, 0.658201, -0.4681045, 1, 1, 1, 1, 1,
-0.4307687, 0.1379983, -0.345508, 0, 0, 1, 1, 1,
-0.4302035, 1.244694, -0.09595137, 1, 0, 0, 1, 1,
-0.4274141, 0.3394958, -0.766682, 1, 0, 0, 1, 1,
-0.4249581, -0.3518057, -1.656536, 1, 0, 0, 1, 1,
-0.4220316, 1.806762, 0.8750796, 1, 0, 0, 1, 1,
-0.421414, 0.170001, -0.6451764, 1, 0, 0, 1, 1,
-0.4196412, 0.2354755, -3.389753, 0, 0, 0, 1, 1,
-0.4125357, -0.2740096, -3.12263, 0, 0, 0, 1, 1,
-0.4098169, 0.4289004, -1.876332, 0, 0, 0, 1, 1,
-0.4082103, -0.1522674, -4.119796, 0, 0, 0, 1, 1,
-0.4072566, 2.047235, 1.046744, 0, 0, 0, 1, 1,
-0.4065127, -0.6501505, -1.951042, 0, 0, 0, 1, 1,
-0.4040176, -1.846284, -3.912724, 0, 0, 0, 1, 1,
-0.3996291, 1.299488, -0.687465, 1, 1, 1, 1, 1,
-0.399547, -0.2861626, -2.524121, 1, 1, 1, 1, 1,
-0.3938965, -1.268412, -0.6225673, 1, 1, 1, 1, 1,
-0.393203, -0.4749722, -4.368883, 1, 1, 1, 1, 1,
-0.3908226, 0.7734271, 0.9190212, 1, 1, 1, 1, 1,
-0.3904258, -1.532851, -4.20444, 1, 1, 1, 1, 1,
-0.3890539, -0.09665059, -1.916386, 1, 1, 1, 1, 1,
-0.3833162, -0.9737961, -3.732687, 1, 1, 1, 1, 1,
-0.3818694, -1.159634, -2.565399, 1, 1, 1, 1, 1,
-0.3814711, -0.244309, -1.409651, 1, 1, 1, 1, 1,
-0.3805798, -0.7908754, -4.230032, 1, 1, 1, 1, 1,
-0.3761419, 0.6664575, -1.519289, 1, 1, 1, 1, 1,
-0.3740315, -0.7127857, -2.407355, 1, 1, 1, 1, 1,
-0.3710431, -1.967289, -5.529335, 1, 1, 1, 1, 1,
-0.3621365, 0.2010459, -1.374909, 1, 1, 1, 1, 1,
-0.3570478, 0.9419147, 0.2426881, 0, 0, 1, 1, 1,
-0.3532309, -0.5526318, -2.49699, 1, 0, 0, 1, 1,
-0.3498862, -1.04676, -3.318909, 1, 0, 0, 1, 1,
-0.3466542, 0.6768795, -1.769698, 1, 0, 0, 1, 1,
-0.3464258, 0.775116, -0.7187189, 1, 0, 0, 1, 1,
-0.3455376, 0.9113472, 0.4942912, 1, 0, 0, 1, 1,
-0.3437512, 0.8839356, -0.9435743, 0, 0, 0, 1, 1,
-0.3418404, -1.096081, -2.248623, 0, 0, 0, 1, 1,
-0.3415127, 0.5997672, -0.6638581, 0, 0, 0, 1, 1,
-0.3384824, 0.1749304, -1.012983, 0, 0, 0, 1, 1,
-0.3325859, 0.5278444, -2.633649, 0, 0, 0, 1, 1,
-0.3323816, -1.297132, -0.6674996, 0, 0, 0, 1, 1,
-0.3291253, 0.7880635, -1.134125, 0, 0, 0, 1, 1,
-0.328599, -0.9887607, -2.596931, 1, 1, 1, 1, 1,
-0.3273524, 0.2452603, -2.028798, 1, 1, 1, 1, 1,
-0.3259279, 0.08285941, -1.222046, 1, 1, 1, 1, 1,
-0.3247575, 0.8698781, -0.5887901, 1, 1, 1, 1, 1,
-0.3217418, 0.3056323, -1.693864, 1, 1, 1, 1, 1,
-0.320223, -1.1799, -1.590786, 1, 1, 1, 1, 1,
-0.3192659, 0.1865601, -0.443099, 1, 1, 1, 1, 1,
-0.3164475, -0.8312243, -2.730191, 1, 1, 1, 1, 1,
-0.3157524, -1.914726, -3.584186, 1, 1, 1, 1, 1,
-0.3142141, 0.7834038, -0.3619506, 1, 1, 1, 1, 1,
-0.3140793, -0.6854088, -3.898963, 1, 1, 1, 1, 1,
-0.308751, 1.412817, 1.363961, 1, 1, 1, 1, 1,
-0.3087035, 1.380426, 0.3374902, 1, 1, 1, 1, 1,
-0.3014261, 0.3401499, -0.4259821, 1, 1, 1, 1, 1,
-0.2977181, 1.417038, -0.242327, 1, 1, 1, 1, 1,
-0.2969526, -1.925131, -2.747352, 0, 0, 1, 1, 1,
-0.2939829, -0.5587062, -4.076335, 1, 0, 0, 1, 1,
-0.2939435, 1.375298, 1.4831, 1, 0, 0, 1, 1,
-0.2853098, -1.763633, -2.220477, 1, 0, 0, 1, 1,
-0.284246, -1.748601, -2.864616, 1, 0, 0, 1, 1,
-0.2840492, -0.8322369, -3.301866, 1, 0, 0, 1, 1,
-0.2827515, -0.3211399, -2.866432, 0, 0, 0, 1, 1,
-0.2808993, -0.2076568, -4.072834, 0, 0, 0, 1, 1,
-0.277399, -0.366461, -2.778545, 0, 0, 0, 1, 1,
-0.2730555, 0.5620682, -1.956289, 0, 0, 0, 1, 1,
-0.2682233, -0.834207, -3.036562, 0, 0, 0, 1, 1,
-0.2615514, -1.703982, -3.951281, 0, 0, 0, 1, 1,
-0.2576849, 2.656605, 1.31663, 0, 0, 0, 1, 1,
-0.2544186, 0.6194243, -0.3137906, 1, 1, 1, 1, 1,
-0.2529835, -1.176618, -0.895311, 1, 1, 1, 1, 1,
-0.2525519, 0.3000266, -0.5458958, 1, 1, 1, 1, 1,
-0.2519515, -1.040097, -2.866479, 1, 1, 1, 1, 1,
-0.2511764, -0.941903, -2.260794, 1, 1, 1, 1, 1,
-0.2491, 1.470606, -1.392025, 1, 1, 1, 1, 1,
-0.2490284, 0.4068957, -0.2117413, 1, 1, 1, 1, 1,
-0.2452347, -0.1094558, -0.007188296, 1, 1, 1, 1, 1,
-0.2376271, 0.1209653, -2.13835, 1, 1, 1, 1, 1,
-0.228443, 0.1484769, -1.118059, 1, 1, 1, 1, 1,
-0.2280336, 1.132349, 0.06613316, 1, 1, 1, 1, 1,
-0.2239973, 2.383744, 0.7377859, 1, 1, 1, 1, 1,
-0.2215447, -0.5640374, -2.630911, 1, 1, 1, 1, 1,
-0.220766, 0.9452338, -0.03309269, 1, 1, 1, 1, 1,
-0.220368, 0.5689, 0.1160128, 1, 1, 1, 1, 1,
-0.2113022, -0.9291999, -3.624231, 0, 0, 1, 1, 1,
-0.2056928, 0.9683604, 0.2215952, 1, 0, 0, 1, 1,
-0.2045078, -0.5078545, -3.757491, 1, 0, 0, 1, 1,
-0.1975108, -0.7550316, -0.6239603, 1, 0, 0, 1, 1,
-0.1951378, 0.4427275, -0.639241, 1, 0, 0, 1, 1,
-0.1934796, -0.8443393, -2.87566, 1, 0, 0, 1, 1,
-0.1921738, -0.4769103, -3.084829, 0, 0, 0, 1, 1,
-0.1909828, 0.1294183, -1.389434, 0, 0, 0, 1, 1,
-0.1794672, 1.45804, -1.018349, 0, 0, 0, 1, 1,
-0.1770294, 0.7100682, -1.161913, 0, 0, 0, 1, 1,
-0.1729333, 0.4176416, -0.2832339, 0, 0, 0, 1, 1,
-0.1709845, 0.1521138, 0.773425, 0, 0, 0, 1, 1,
-0.1693061, -0.9889392, -3.828598, 0, 0, 0, 1, 1,
-0.1669852, 0.110877, -3.504092, 1, 1, 1, 1, 1,
-0.1651376, -0.3921802, -0.4659885, 1, 1, 1, 1, 1,
-0.1611501, 2.031545, -0.4865257, 1, 1, 1, 1, 1,
-0.1593093, 0.06189694, -2.533319, 1, 1, 1, 1, 1,
-0.1587908, -1.111983, -2.414222, 1, 1, 1, 1, 1,
-0.1581009, -0.1238995, -0.6812154, 1, 1, 1, 1, 1,
-0.1565469, -0.8414264, -1.159478, 1, 1, 1, 1, 1,
-0.1544957, 0.7504152, 0.004492405, 1, 1, 1, 1, 1,
-0.1534411, 0.2306629, -1.440814, 1, 1, 1, 1, 1,
-0.1501578, -0.2515113, -3.031137, 1, 1, 1, 1, 1,
-0.1483659, -0.05513295, -1.615502, 1, 1, 1, 1, 1,
-0.1438992, -0.7713404, -4.140059, 1, 1, 1, 1, 1,
-0.1421753, -1.681379, -4.091801, 1, 1, 1, 1, 1,
-0.1407699, 0.8181006, 1.687749, 1, 1, 1, 1, 1,
-0.1347602, -0.1693837, -4.170609, 1, 1, 1, 1, 1,
-0.1279331, -1.117004, -3.19656, 0, 0, 1, 1, 1,
-0.1271703, -0.3312984, -2.004667, 1, 0, 0, 1, 1,
-0.1270357, 0.2748472, -0.155954, 1, 0, 0, 1, 1,
-0.1266594, -0.4139327, -3.91858, 1, 0, 0, 1, 1,
-0.1244873, -0.003280722, -0.5655044, 1, 0, 0, 1, 1,
-0.1221598, 0.9994277, 1.318849, 1, 0, 0, 1, 1,
-0.1202063, -0.3768946, -4.034579, 0, 0, 0, 1, 1,
-0.1164683, -2.879309, -3.726193, 0, 0, 0, 1, 1,
-0.1163709, 0.3505146, -0.2376167, 0, 0, 0, 1, 1,
-0.1153876, -0.10253, -3.729958, 0, 0, 0, 1, 1,
-0.1082311, -0.2547837, -2.061423, 0, 0, 0, 1, 1,
-0.1053397, 0.1482528, -0.5331101, 0, 0, 0, 1, 1,
-0.09946558, 1.134804, 0.8402732, 0, 0, 0, 1, 1,
-0.09839922, 0.7033896, 0.0909509, 1, 1, 1, 1, 1,
-0.09471513, 1.562893, 0.4133536, 1, 1, 1, 1, 1,
-0.09272033, 0.5364027, 0.09349921, 1, 1, 1, 1, 1,
-0.09164611, 0.9475711, -0.0921977, 1, 1, 1, 1, 1,
-0.08956037, -0.1273407, -1.661594, 1, 1, 1, 1, 1,
-0.08663744, -0.3874729, -4.419621, 1, 1, 1, 1, 1,
-0.08201703, 1.073939, -0.3660361, 1, 1, 1, 1, 1,
-0.0807645, -0.6013958, -3.02446, 1, 1, 1, 1, 1,
-0.08032425, 0.1145252, 0.7524349, 1, 1, 1, 1, 1,
-0.07934573, 0.1104327, -1.738076, 1, 1, 1, 1, 1,
-0.07466979, 0.5417897, -1.179788, 1, 1, 1, 1, 1,
-0.07032399, 1.090787, 0.6713529, 1, 1, 1, 1, 1,
-0.06898969, -1.504118, -2.549966, 1, 1, 1, 1, 1,
-0.06893264, 1.180546, -1.092623, 1, 1, 1, 1, 1,
-0.06783374, -1.283593, -4.074716, 1, 1, 1, 1, 1,
-0.0576863, 1.86627, 1.164005, 0, 0, 1, 1, 1,
-0.05191362, 0.7543842, -0.1730195, 1, 0, 0, 1, 1,
-0.04794466, -0.9559737, -2.185942, 1, 0, 0, 1, 1,
-0.04576552, 1.153762, -2.115396, 1, 0, 0, 1, 1,
-0.03912047, 0.3489663, -0.4149931, 1, 0, 0, 1, 1,
-0.03697395, -1.21045, -2.931684, 1, 0, 0, 1, 1,
-0.03293313, 2.530328, -0.6651626, 0, 0, 0, 1, 1,
-0.03248251, 0.3202294, -1.853987, 0, 0, 0, 1, 1,
-0.03141658, -0.4108866, -1.763335, 0, 0, 0, 1, 1,
-0.03125179, -2.579871, -3.073803, 0, 0, 0, 1, 1,
-0.027692, 0.2239394, 0.3250277, 0, 0, 0, 1, 1,
-0.02673275, 1.720301, -0.840842, 0, 0, 0, 1, 1,
-0.01873321, 0.8632807, 1.724678, 0, 0, 0, 1, 1,
-0.0157523, 1.414785, -1.630326, 1, 1, 1, 1, 1,
-0.008702346, 1.599901, -1.16664, 1, 1, 1, 1, 1,
-0.008109144, -0.1428855, -3.806628, 1, 1, 1, 1, 1,
-0.006610993, 0.01190751, 0.1252008, 1, 1, 1, 1, 1,
-0.003324097, -0.02133444, -3.914972, 1, 1, 1, 1, 1,
-0.002064706, -0.5573739, -2.6557, 1, 1, 1, 1, 1,
0.00255513, -1.740037, 1.806861, 1, 1, 1, 1, 1,
0.005671313, -0.3628235, 3.457259, 1, 1, 1, 1, 1,
0.006688798, -0.5534735, 3.362134, 1, 1, 1, 1, 1,
0.01352239, -0.1381176, 2.459983, 1, 1, 1, 1, 1,
0.01393186, -1.424897, 3.504995, 1, 1, 1, 1, 1,
0.01575464, -0.267394, 3.415639, 1, 1, 1, 1, 1,
0.01676564, -1.040995, 3.436669, 1, 1, 1, 1, 1,
0.01728423, -0.1360731, 1.992456, 1, 1, 1, 1, 1,
0.02162643, 0.1305499, -0.4629405, 1, 1, 1, 1, 1,
0.02249544, 0.08272118, 0.1515343, 0, 0, 1, 1, 1,
0.02254631, 0.5008826, -0.4844355, 1, 0, 0, 1, 1,
0.02540711, -0.2699814, 3.210306, 1, 0, 0, 1, 1,
0.02967148, -1.501192, 2.940114, 1, 0, 0, 1, 1,
0.03457405, 0.6177287, 0.02822067, 1, 0, 0, 1, 1,
0.03670454, 1.32767, -0.6718709, 1, 0, 0, 1, 1,
0.04159047, -0.8725604, 2.380987, 0, 0, 0, 1, 1,
0.04494384, 0.4439092, 1.312725, 0, 0, 0, 1, 1,
0.0461519, 0.7018949, 0.3661648, 0, 0, 0, 1, 1,
0.04676699, -0.3018135, 1.271239, 0, 0, 0, 1, 1,
0.05280323, -0.7269079, 1.763615, 0, 0, 0, 1, 1,
0.05502642, -2.286231, 2.972921, 0, 0, 0, 1, 1,
0.05634538, -2.014066, 3.295404, 0, 0, 0, 1, 1,
0.05931524, -0.1746423, 2.126151, 1, 1, 1, 1, 1,
0.06291094, 0.275023, 0.5494485, 1, 1, 1, 1, 1,
0.06303687, -1.235646, 1.92061, 1, 1, 1, 1, 1,
0.067236, -0.6345618, 2.448553, 1, 1, 1, 1, 1,
0.06819697, -0.2154597, 2.599551, 1, 1, 1, 1, 1,
0.0759519, 0.9978805, -0.9284072, 1, 1, 1, 1, 1,
0.07975709, 0.4558755, 0.4056302, 1, 1, 1, 1, 1,
0.08192486, -2.169319, 3.909029, 1, 1, 1, 1, 1,
0.0827577, -0.3286847, 2.836787, 1, 1, 1, 1, 1,
0.08963713, -1.157962, 2.387995, 1, 1, 1, 1, 1,
0.09468919, -0.2563621, 5.399507, 1, 1, 1, 1, 1,
0.09530455, -1.187377, 2.61894, 1, 1, 1, 1, 1,
0.1045469, -0.1948961, 3.774213, 1, 1, 1, 1, 1,
0.1077562, 0.5333878, -1.012391, 1, 1, 1, 1, 1,
0.1084134, 1.20419, -0.3490748, 1, 1, 1, 1, 1,
0.1099357, -2.258361, 2.719249, 0, 0, 1, 1, 1,
0.1140728, -0.7364374, 3.718446, 1, 0, 0, 1, 1,
0.115979, -0.8869113, 2.855611, 1, 0, 0, 1, 1,
0.1190537, 0.007765715, 1.693277, 1, 0, 0, 1, 1,
0.1203453, -1.842076, 3.248286, 1, 0, 0, 1, 1,
0.1235966, -1.894501, 2.294625, 1, 0, 0, 1, 1,
0.1242328, 0.1485369, 1.691915, 0, 0, 0, 1, 1,
0.1307084, -0.9208297, 4.554667, 0, 0, 0, 1, 1,
0.1335164, -0.2343109, 2.423093, 0, 0, 0, 1, 1,
0.1379725, -0.9417441, 3.46431, 0, 0, 0, 1, 1,
0.1413522, -0.9247245, 2.915054, 0, 0, 0, 1, 1,
0.1428224, 0.05906746, 1.703058, 0, 0, 0, 1, 1,
0.1438978, 0.532601, -1.259055, 0, 0, 0, 1, 1,
0.1456528, -1.122806, 2.52389, 1, 1, 1, 1, 1,
0.1457757, -1.56346, 2.102092, 1, 1, 1, 1, 1,
0.1505972, -1.370869, 2.123044, 1, 1, 1, 1, 1,
0.1515692, -0.03716332, 2.742309, 1, 1, 1, 1, 1,
0.1553687, -0.480402, 2.495527, 1, 1, 1, 1, 1,
0.1571529, -0.4188336, 3.494148, 1, 1, 1, 1, 1,
0.1589491, -0.1377969, 2.823456, 1, 1, 1, 1, 1,
0.1605362, 1.002452, 0.6393302, 1, 1, 1, 1, 1,
0.1626585, 1.490599, 1.943981, 1, 1, 1, 1, 1,
0.1629105, 1.070021, 1.524422, 1, 1, 1, 1, 1,
0.1642265, -0.8448868, 3.472409, 1, 1, 1, 1, 1,
0.1677768, 1.08319, -1.413258, 1, 1, 1, 1, 1,
0.1684416, -0.3018292, 2.881964, 1, 1, 1, 1, 1,
0.1684939, -0.174257, 2.508904, 1, 1, 1, 1, 1,
0.1688987, -0.220378, 2.359111, 1, 1, 1, 1, 1,
0.1691325, -1.271376, 3.550008, 0, 0, 1, 1, 1,
0.1714128, 1.118136, -0.2968797, 1, 0, 0, 1, 1,
0.1767072, 0.5361225, 1.600996, 1, 0, 0, 1, 1,
0.1777413, 1.184895, 0.7956121, 1, 0, 0, 1, 1,
0.1788158, 2.509679, -0.07878531, 1, 0, 0, 1, 1,
0.1798493, -0.2410683, 2.660838, 1, 0, 0, 1, 1,
0.1805667, 1.354534, -1.801654, 0, 0, 0, 1, 1,
0.1847117, 0.1379393, 0.4106018, 0, 0, 0, 1, 1,
0.186467, -0.4244699, 3.582789, 0, 0, 0, 1, 1,
0.1894107, -0.06187019, 2.330605, 0, 0, 0, 1, 1,
0.1925029, 1.427438, 0.9631289, 0, 0, 0, 1, 1,
0.1926117, 0.9368399, -0.8988895, 0, 0, 0, 1, 1,
0.1968049, -1.095183, 0.7014991, 0, 0, 0, 1, 1,
0.1992071, 1.64786, 0.7523757, 1, 1, 1, 1, 1,
0.203425, -0.04161264, 2.313148, 1, 1, 1, 1, 1,
0.2035679, -0.7636171, 4.324372, 1, 1, 1, 1, 1,
0.2074589, -0.2929413, 1.75088, 1, 1, 1, 1, 1,
0.2100783, -1.039569, 4.002869, 1, 1, 1, 1, 1,
0.2106532, -0.4924392, 3.637833, 1, 1, 1, 1, 1,
0.2118255, -0.6246947, 2.6935, 1, 1, 1, 1, 1,
0.2142487, -0.4953483, 0.9274089, 1, 1, 1, 1, 1,
0.2164984, 0.6494229, -0.2932624, 1, 1, 1, 1, 1,
0.2195533, 0.03045117, 0.6765313, 1, 1, 1, 1, 1,
0.220342, 1.573452, -1.475076, 1, 1, 1, 1, 1,
0.2279706, 0.1765582, 2.569464, 1, 1, 1, 1, 1,
0.2331217, -1.166081, 3.421109, 1, 1, 1, 1, 1,
0.2379243, -0.2730305, 2.304991, 1, 1, 1, 1, 1,
0.2384213, 0.8205652, 0.3028015, 1, 1, 1, 1, 1,
0.239096, -0.611691, 1.546767, 0, 0, 1, 1, 1,
0.2395345, -1.718896, 2.992561, 1, 0, 0, 1, 1,
0.2412385, 1.407764, -0.8121839, 1, 0, 0, 1, 1,
0.2441454, 0.5255439, 0.6151124, 1, 0, 0, 1, 1,
0.2442689, -0.3674011, 4.074108, 1, 0, 0, 1, 1,
0.2442763, 0.5171546, 2.272276, 1, 0, 0, 1, 1,
0.2449602, -2.160602, 1.392011, 0, 0, 0, 1, 1,
0.2496877, 1.854491, 1.348786, 0, 0, 0, 1, 1,
0.2579971, -0.9722952, 2.395472, 0, 0, 0, 1, 1,
0.2596646, 1.533636, -0.9245892, 0, 0, 0, 1, 1,
0.2617157, 0.2316844, 0.9218241, 0, 0, 0, 1, 1,
0.2620821, 0.3185394, 0.3984824, 0, 0, 0, 1, 1,
0.2660374, 0.1759918, 0.3587233, 0, 0, 0, 1, 1,
0.2680362, -0.03555181, 2.542456, 1, 1, 1, 1, 1,
0.2683549, -0.8833967, 2.953339, 1, 1, 1, 1, 1,
0.272217, -0.03926906, 2.036405, 1, 1, 1, 1, 1,
0.2726037, -0.372409, 2.549447, 1, 1, 1, 1, 1,
0.2749163, 0.1888424, -0.6914491, 1, 1, 1, 1, 1,
0.2755383, -0.4643315, 1.252824, 1, 1, 1, 1, 1,
0.2760951, -0.6031741, 1.97247, 1, 1, 1, 1, 1,
0.2773817, -0.7949755, 3.830164, 1, 1, 1, 1, 1,
0.2782587, -1.987918, 1.799213, 1, 1, 1, 1, 1,
0.2793031, -0.2412473, 2.054313, 1, 1, 1, 1, 1,
0.2815959, 0.817096, 0.2593777, 1, 1, 1, 1, 1,
0.2821633, -0.2648558, 4.564159, 1, 1, 1, 1, 1,
0.2931114, -1.589107, 2.878665, 1, 1, 1, 1, 1,
0.2931579, 1.82368, -0.1214187, 1, 1, 1, 1, 1,
0.2945664, -0.9212536, 2.436193, 1, 1, 1, 1, 1,
0.3017271, 0.03242883, 2.289129, 0, 0, 1, 1, 1,
0.3038373, -0.002910142, 1.112287, 1, 0, 0, 1, 1,
0.306613, -1.00786, 2.957221, 1, 0, 0, 1, 1,
0.3095748, 0.7678417, 0.04057172, 1, 0, 0, 1, 1,
0.3119622, 0.0118188, 0.1266758, 1, 0, 0, 1, 1,
0.3164576, -0.1922841, 1.294675, 1, 0, 0, 1, 1,
0.3187263, 0.4623088, 0.9754021, 0, 0, 0, 1, 1,
0.3248608, 0.3751747, -0.5400489, 0, 0, 0, 1, 1,
0.3335412, -2.101001, 4.64807, 0, 0, 0, 1, 1,
0.3355334, -0.93709, 2.181007, 0, 0, 0, 1, 1,
0.3357856, 0.1694686, 1.333383, 0, 0, 0, 1, 1,
0.3372948, 0.1239405, 1.196562, 0, 0, 0, 1, 1,
0.3380698, 0.4771744, 1.516959, 0, 0, 0, 1, 1,
0.3388481, -0.9487278, 2.577662, 1, 1, 1, 1, 1,
0.3424678, 0.972437, 0.2063953, 1, 1, 1, 1, 1,
0.3429216, -1.819281, 3.073211, 1, 1, 1, 1, 1,
0.3466223, 0.3389808, -0.679585, 1, 1, 1, 1, 1,
0.3478616, -1.7212, 3.08744, 1, 1, 1, 1, 1,
0.3511902, -1.580125, 4.269205, 1, 1, 1, 1, 1,
0.3533329, 1.122181, -1.731744, 1, 1, 1, 1, 1,
0.3570835, -0.955013, 1.848341, 1, 1, 1, 1, 1,
0.3573099, -1.383483, 2.35227, 1, 1, 1, 1, 1,
0.3598766, 1.078919, 1.211812, 1, 1, 1, 1, 1,
0.36233, 1.298271, 1.134912, 1, 1, 1, 1, 1,
0.363328, 0.005627095, 1.861253, 1, 1, 1, 1, 1,
0.3637609, 0.3336031, -0.1970462, 1, 1, 1, 1, 1,
0.3787546, 0.539169, 1.918589, 1, 1, 1, 1, 1,
0.3802292, 0.5711093, 0.5572857, 1, 1, 1, 1, 1,
0.3831354, 1.607453, -0.2145663, 0, 0, 1, 1, 1,
0.3867345, -0.6267107, 3.177886, 1, 0, 0, 1, 1,
0.3871163, 0.0415272, 0.9170864, 1, 0, 0, 1, 1,
0.388539, -2.219901, 4.249823, 1, 0, 0, 1, 1,
0.3954034, 1.349281, 1.725304, 1, 0, 0, 1, 1,
0.3980274, -0.1407624, 1.84905, 1, 0, 0, 1, 1,
0.3991757, -1.68247, 2.118709, 0, 0, 0, 1, 1,
0.4024501, 2.339229, 0.3135466, 0, 0, 0, 1, 1,
0.4084556, 1.16808, 1.825297, 0, 0, 0, 1, 1,
0.4113253, 0.9741938, 1.35885, 0, 0, 0, 1, 1,
0.4117424, -0.5355813, 3.175616, 0, 0, 0, 1, 1,
0.4128189, 0.2925784, 2.375502, 0, 0, 0, 1, 1,
0.4149139, -0.5462683, 2.488783, 0, 0, 0, 1, 1,
0.4155057, -0.1590503, 2.757107, 1, 1, 1, 1, 1,
0.4166382, -1.090132, 3.191397, 1, 1, 1, 1, 1,
0.423032, -0.2096645, 1.20317, 1, 1, 1, 1, 1,
0.4231942, 0.5585698, 1.60901, 1, 1, 1, 1, 1,
0.4256552, 1.125742, 1.282078, 1, 1, 1, 1, 1,
0.4307917, 1.576124, -0.4632055, 1, 1, 1, 1, 1,
0.4315788, 0.3257766, -0.509079, 1, 1, 1, 1, 1,
0.4364808, -0.9027835, 4.110725, 1, 1, 1, 1, 1,
0.4413045, 1.47004, 0.6174108, 1, 1, 1, 1, 1,
0.4433433, -0.07665513, 1.816602, 1, 1, 1, 1, 1,
0.4505523, -0.4415659, 2.744124, 1, 1, 1, 1, 1,
0.4547045, -0.1062283, 1.493853, 1, 1, 1, 1, 1,
0.4605421, -0.07087768, 1.874965, 1, 1, 1, 1, 1,
0.4611288, 0.6305158, 1.060402, 1, 1, 1, 1, 1,
0.4615287, -0.8428346, 2.702435, 1, 1, 1, 1, 1,
0.4706412, -1.313446, 4.408171, 0, 0, 1, 1, 1,
0.4713306, 0.01370141, 0.8535955, 1, 0, 0, 1, 1,
0.479298, 0.757292, -2.100203, 1, 0, 0, 1, 1,
0.4803673, 0.639303, 1.435311, 1, 0, 0, 1, 1,
0.4866495, -0.8984004, 2.991626, 1, 0, 0, 1, 1,
0.4904983, 2.029559, 0.3985905, 1, 0, 0, 1, 1,
0.4977429, -1.497739, 3.790404, 0, 0, 0, 1, 1,
0.50218, -1.1867, 4.543627, 0, 0, 0, 1, 1,
0.5071263, 0.5748544, 0.8413414, 0, 0, 0, 1, 1,
0.5091043, -0.2729652, 2.25917, 0, 0, 0, 1, 1,
0.5101936, -0.4759573, 1.472036, 0, 0, 0, 1, 1,
0.5168792, 0.5337254, 1.817381, 0, 0, 0, 1, 1,
0.5177131, 1.403082, -1.55161, 0, 0, 0, 1, 1,
0.5191978, 1.404663, 1.936679, 1, 1, 1, 1, 1,
0.5192889, -0.6602589, 2.548348, 1, 1, 1, 1, 1,
0.5208705, -0.01816268, 1.80677, 1, 1, 1, 1, 1,
0.527612, 0.09507019, 1.470553, 1, 1, 1, 1, 1,
0.5285292, 0.5584303, 1.466609, 1, 1, 1, 1, 1,
0.5321949, 0.117215, 0.2365275, 1, 1, 1, 1, 1,
0.5355236, 0.05725448, 1.873469, 1, 1, 1, 1, 1,
0.5392213, -0.1896324, 0.8933991, 1, 1, 1, 1, 1,
0.5451954, 0.6602979, 0.435871, 1, 1, 1, 1, 1,
0.548485, 0.2461686, 2.932204, 1, 1, 1, 1, 1,
0.5591568, -0.06031119, 0.6473671, 1, 1, 1, 1, 1,
0.5671139, -1.955555, 5.12514, 1, 1, 1, 1, 1,
0.5696433, -0.4035687, 1.596318, 1, 1, 1, 1, 1,
0.5697117, 1.192011, 1.145795, 1, 1, 1, 1, 1,
0.569923, -1.020932, 2.655694, 1, 1, 1, 1, 1,
0.5728852, -1.303596, 3.049567, 0, 0, 1, 1, 1,
0.5742023, 0.7117633, 0.7306765, 1, 0, 0, 1, 1,
0.5818466, 0.4104469, 0.03386426, 1, 0, 0, 1, 1,
0.582261, -1.127999, 2.01391, 1, 0, 0, 1, 1,
0.5837913, 1.680461, 3.618825, 1, 0, 0, 1, 1,
0.5938891, 0.419481, 1.665233, 1, 0, 0, 1, 1,
0.6019108, -0.3129818, 0.451148, 0, 0, 0, 1, 1,
0.6023604, 1.698026, -1.478071, 0, 0, 0, 1, 1,
0.6071221, -0.6529436, 0.4684596, 0, 0, 0, 1, 1,
0.6110305, -1.12087, 2.966555, 0, 0, 0, 1, 1,
0.6225032, 0.9805351, 0.5084437, 0, 0, 0, 1, 1,
0.625119, -1.08647, 3.726826, 0, 0, 0, 1, 1,
0.6277953, 0.4868591, 0.09988982, 0, 0, 0, 1, 1,
0.6299955, -1.597323, 2.192428, 1, 1, 1, 1, 1,
0.6346166, -0.08620419, 1.795186, 1, 1, 1, 1, 1,
0.6393678, -1.821777, 3.177769, 1, 1, 1, 1, 1,
0.6397142, 1.316742, 1.065464, 1, 1, 1, 1, 1,
0.6505988, 0.9719744, -1.614158, 1, 1, 1, 1, 1,
0.6510753, -1.052274, 3.949477, 1, 1, 1, 1, 1,
0.6522436, 0.3323179, 0.04439894, 1, 1, 1, 1, 1,
0.6593633, -1.012965, 3.728507, 1, 1, 1, 1, 1,
0.6608515, -0.49883, 2.321292, 1, 1, 1, 1, 1,
0.6726356, 1.37082, -0.4786165, 1, 1, 1, 1, 1,
0.6744161, -0.4605838, 3.066578, 1, 1, 1, 1, 1,
0.679701, 0.2161954, 0.6289965, 1, 1, 1, 1, 1,
0.6801264, -0.3714084, 2.286541, 1, 1, 1, 1, 1,
0.6827716, 0.7577595, 0.3716526, 1, 1, 1, 1, 1,
0.6857706, 0.4340233, 0.1767634, 1, 1, 1, 1, 1,
0.6878865, 0.2582234, 0.6083447, 0, 0, 1, 1, 1,
0.6948614, -0.1100973, 2.355803, 1, 0, 0, 1, 1,
0.6955444, -2.487947, 4.939472, 1, 0, 0, 1, 1,
0.7001311, -0.3179573, 3.100707, 1, 0, 0, 1, 1,
0.702401, -0.6819063, 3.028327, 1, 0, 0, 1, 1,
0.703762, 1.317293, 1.825609, 1, 0, 0, 1, 1,
0.7105314, -0.3346068, 1.285735, 0, 0, 0, 1, 1,
0.7191408, -0.6979362, 2.233265, 0, 0, 0, 1, 1,
0.720319, 1.361094, 0.2944393, 0, 0, 0, 1, 1,
0.7223051, 1.950749, -0.3854728, 0, 0, 0, 1, 1,
0.7224947, -0.5240618, 2.17055, 0, 0, 0, 1, 1,
0.7239598, -0.3231784, 3.626912, 0, 0, 0, 1, 1,
0.725835, 0.576371, 1.280631, 0, 0, 0, 1, 1,
0.7282182, -0.6403544, 2.582864, 1, 1, 1, 1, 1,
0.7302392, 0.0448055, 2.787901, 1, 1, 1, 1, 1,
0.7348637, 1.297569, 1.02391, 1, 1, 1, 1, 1,
0.7409896, -0.3560669, 1.500569, 1, 1, 1, 1, 1,
0.7411698, 0.5171154, 2.006191, 1, 1, 1, 1, 1,
0.74618, -0.9473752, 0.575447, 1, 1, 1, 1, 1,
0.7480507, 0.8755027, -0.06497058, 1, 1, 1, 1, 1,
0.7546934, -1.236142, 1.861788, 1, 1, 1, 1, 1,
0.7713057, -1.440815, 2.336295, 1, 1, 1, 1, 1,
0.7720143, -0.2328135, 1.948657, 1, 1, 1, 1, 1,
0.7792591, -0.3081871, 2.034349, 1, 1, 1, 1, 1,
0.7802985, -0.6401701, 1.201477, 1, 1, 1, 1, 1,
0.7819518, 2.186271, 0.6214885, 1, 1, 1, 1, 1,
0.7825528, 0.03124478, 0.3448952, 1, 1, 1, 1, 1,
0.7845399, 0.9853452, 1.766531, 1, 1, 1, 1, 1,
0.7851442, -1.229547, 2.488678, 0, 0, 1, 1, 1,
0.7855099, -0.6251891, 3.96834, 1, 0, 0, 1, 1,
0.7870389, -0.1858307, 2.804675, 1, 0, 0, 1, 1,
0.7991719, 0.9491501, 0.6964437, 1, 0, 0, 1, 1,
0.8012764, 0.2859945, 1.547754, 1, 0, 0, 1, 1,
0.8037243, -0.3977036, 2.303279, 1, 0, 0, 1, 1,
0.8066921, 2.249479, 0.7504066, 0, 0, 0, 1, 1,
0.8087006, 0.9664043, -0.3757107, 0, 0, 0, 1, 1,
0.8105501, 1.753171, 0.4569921, 0, 0, 0, 1, 1,
0.8116478, -0.4166387, 3.285736, 0, 0, 0, 1, 1,
0.8122105, -0.8497846, 1.666741, 0, 0, 0, 1, 1,
0.816581, 0.7912617, -0.3258964, 0, 0, 0, 1, 1,
0.829637, -1.448226, 1.823812, 0, 0, 0, 1, 1,
0.8310441, -0.3017308, 1.177555, 1, 1, 1, 1, 1,
0.8326462, 0.01545805, 0.5010244, 1, 1, 1, 1, 1,
0.8368251, 0.2941557, 2.665868, 1, 1, 1, 1, 1,
0.8373034, -0.3500113, 2.582949, 1, 1, 1, 1, 1,
0.8404713, -0.9477143, 3.040311, 1, 1, 1, 1, 1,
0.8410819, -1.030035, 4.091934, 1, 1, 1, 1, 1,
0.8418065, 1.311714, 0.9178122, 1, 1, 1, 1, 1,
0.8428413, 1.302697, 1.282194, 1, 1, 1, 1, 1,
0.845594, -1.115769, 4.831456, 1, 1, 1, 1, 1,
0.8459814, 0.4848499, 0.5936083, 1, 1, 1, 1, 1,
0.8462832, 0.8488238, -0.06310121, 1, 1, 1, 1, 1,
0.8464264, 0.7165217, 0.7516392, 1, 1, 1, 1, 1,
0.8464854, 1.612746, 0.7587873, 1, 1, 1, 1, 1,
0.8474064, 0.1301298, 2.695863, 1, 1, 1, 1, 1,
0.8524594, 1.390714, -0.008914712, 1, 1, 1, 1, 1,
0.8529972, -0.6576909, 2.590276, 0, 0, 1, 1, 1,
0.8602808, -0.7749963, 3.73333, 1, 0, 0, 1, 1,
0.8624431, -0.2777861, 0.1193399, 1, 0, 0, 1, 1,
0.8700758, 0.7731744, -0.211263, 1, 0, 0, 1, 1,
0.8737448, -0.4621261, -0.02422036, 1, 0, 0, 1, 1,
0.8747306, -0.7290471, 1.906145, 1, 0, 0, 1, 1,
0.8766738, 0.9394336, 0.2325069, 0, 0, 0, 1, 1,
0.8873633, -0.04743629, 2.927216, 0, 0, 0, 1, 1,
0.8943883, -0.570504, 1.843491, 0, 0, 0, 1, 1,
0.9049761, 0.3269556, 2.166556, 0, 0, 0, 1, 1,
0.9166853, -0.9740341, 1.376254, 0, 0, 0, 1, 1,
0.9209712, -1.426711, 2.057835, 0, 0, 0, 1, 1,
0.9369725, 0.6268562, -1.013877, 0, 0, 0, 1, 1,
0.9379418, 0.47724, -0.4576907, 1, 1, 1, 1, 1,
0.9397267, 0.1896698, 3.378715, 1, 1, 1, 1, 1,
0.9432622, 0.0393725, 2.665783, 1, 1, 1, 1, 1,
0.956459, -0.9634242, 2.438145, 1, 1, 1, 1, 1,
0.9571109, -0.7799463, 1.664649, 1, 1, 1, 1, 1,
0.9595993, 0.2844867, 2.166253, 1, 1, 1, 1, 1,
0.9637116, 0.4518588, -0.2724712, 1, 1, 1, 1, 1,
0.9656308, 0.7834065, -0.3009583, 1, 1, 1, 1, 1,
0.9678622, 2.87286, 0.9684363, 1, 1, 1, 1, 1,
0.9703404, 1.703589, 0.2601277, 1, 1, 1, 1, 1,
0.9718588, -0.8174981, 1.591407, 1, 1, 1, 1, 1,
0.9720989, 1.660079, 1.791831, 1, 1, 1, 1, 1,
0.9724224, 0.3521174, 2.853147, 1, 1, 1, 1, 1,
0.9730871, 0.5471743, 1.223987, 1, 1, 1, 1, 1,
0.9773357, -1.405444, 3.054872, 1, 1, 1, 1, 1,
0.9815422, 1.062169, 0.9200729, 0, 0, 1, 1, 1,
0.9853488, 1.120947, 1.985489, 1, 0, 0, 1, 1,
0.9872685, -0.815905, 2.874078, 1, 0, 0, 1, 1,
0.9942465, -0.4452162, 2.562412, 1, 0, 0, 1, 1,
1.014187, -0.08807781, 2.59092, 1, 0, 0, 1, 1,
1.020531, -0.08473417, 0.006440856, 1, 0, 0, 1, 1,
1.021816, 1.020999, 1.817034, 0, 0, 0, 1, 1,
1.029844, 0.734728, 1.193528, 0, 0, 0, 1, 1,
1.032858, 0.6143378, 0.4155901, 0, 0, 0, 1, 1,
1.038677, -0.5361242, 1.628854, 0, 0, 0, 1, 1,
1.040249, -1.861347, 2.901933, 0, 0, 0, 1, 1,
1.048863, -0.6909712, 3.987533, 0, 0, 0, 1, 1,
1.055437, 2.081048, 0.461186, 0, 0, 0, 1, 1,
1.057304, -0.1550577, 2.538842, 1, 1, 1, 1, 1,
1.062953, 0.6242036, 1.492895, 1, 1, 1, 1, 1,
1.064184, 1.639457, -0.7934659, 1, 1, 1, 1, 1,
1.065145, -1.330674, 3.349907, 1, 1, 1, 1, 1,
1.072971, 0.5405242, 2.050183, 1, 1, 1, 1, 1,
1.097541, -0.7242679, 2.793356, 1, 1, 1, 1, 1,
1.097971, 0.5105631, 1.021841, 1, 1, 1, 1, 1,
1.098493, 0.471709, 1.102174, 1, 1, 1, 1, 1,
1.105971, 0.4410107, 2.270452, 1, 1, 1, 1, 1,
1.107489, -1.425652, 4.317265, 1, 1, 1, 1, 1,
1.113351, 0.5691651, 0.8616332, 1, 1, 1, 1, 1,
1.113605, 0.2301541, 1.095097, 1, 1, 1, 1, 1,
1.117195, 0.2491316, 0.8616894, 1, 1, 1, 1, 1,
1.122317, -0.3252866, 2.88465, 1, 1, 1, 1, 1,
1.126266, 0.3854251, 1.336704, 1, 1, 1, 1, 1,
1.128306, 0.6007813, 1.615043, 0, 0, 1, 1, 1,
1.131659, 0.7587291, 2.320121, 1, 0, 0, 1, 1,
1.138066, -1.034223, 0.7546937, 1, 0, 0, 1, 1,
1.145393, -0.1828983, 1.912596, 1, 0, 0, 1, 1,
1.1455, 0.3644198, 0.8834717, 1, 0, 0, 1, 1,
1.146338, 0.9409735, -1.145449, 1, 0, 0, 1, 1,
1.150121, -0.8494007, 3.158208, 0, 0, 0, 1, 1,
1.155115, 1.719152, -0.1213816, 0, 0, 0, 1, 1,
1.156602, 1.095404, 0.4805034, 0, 0, 0, 1, 1,
1.160318, -1.854474, 2.369366, 0, 0, 0, 1, 1,
1.16398, -0.3460196, 1.016572, 0, 0, 0, 1, 1,
1.178482, 0.4382947, 3.537617, 0, 0, 0, 1, 1,
1.186719, -0.2244992, 1.673469, 0, 0, 0, 1, 1,
1.187879, 0.6298757, 1.356407, 1, 1, 1, 1, 1,
1.189361, 1.410969, -0.4296118, 1, 1, 1, 1, 1,
1.204681, -0.6136471, 2.434152, 1, 1, 1, 1, 1,
1.208277, -0.02661531, 2.688779, 1, 1, 1, 1, 1,
1.210222, -0.1045855, 2.377367, 1, 1, 1, 1, 1,
1.218384, -0.7339938, 1.14671, 1, 1, 1, 1, 1,
1.221315, -0.541177, 0.3224348, 1, 1, 1, 1, 1,
1.221667, -1.12451, 3.514533, 1, 1, 1, 1, 1,
1.224172, -1.227648, 2.87431, 1, 1, 1, 1, 1,
1.230005, 0.1772216, 2.090017, 1, 1, 1, 1, 1,
1.232048, 1.567156, 3.079115, 1, 1, 1, 1, 1,
1.239228, 0.4159756, 0.2504466, 1, 1, 1, 1, 1,
1.256949, 0.7267504, 0.2120668, 1, 1, 1, 1, 1,
1.259553, 0.3867138, 2.20239, 1, 1, 1, 1, 1,
1.267596, 0.2017395, 2.341022, 1, 1, 1, 1, 1,
1.275283, -0.339, 2.243346, 0, 0, 1, 1, 1,
1.309814, -1.688835, 2.184571, 1, 0, 0, 1, 1,
1.314968, 0.07158709, 2.254052, 1, 0, 0, 1, 1,
1.315445, 1.861718, 0.8849667, 1, 0, 0, 1, 1,
1.318178, -0.4887806, 0.9799212, 1, 0, 0, 1, 1,
1.324406, 2.65704, 0.6908723, 1, 0, 0, 1, 1,
1.328975, -0.2350147, 1.874867, 0, 0, 0, 1, 1,
1.330112, -0.04144242, 0.7324165, 0, 0, 0, 1, 1,
1.332288, -0.8205745, 2.80509, 0, 0, 0, 1, 1,
1.341213, -1.073996, 3.654861, 0, 0, 0, 1, 1,
1.342947, 1.052477, -0.4956178, 0, 0, 0, 1, 1,
1.359913, 0.6857741, 2.261636, 0, 0, 0, 1, 1,
1.362993, 2.23689, 0.6324974, 0, 0, 0, 1, 1,
1.36683, 1.350507, 2.120915, 1, 1, 1, 1, 1,
1.368703, -0.6935291, 3.802235, 1, 1, 1, 1, 1,
1.37278, -0.8575651, 2.214016, 1, 1, 1, 1, 1,
1.383835, -0.830529, 2.623034, 1, 1, 1, 1, 1,
1.385813, -1.796673, 3.067775, 1, 1, 1, 1, 1,
1.389539, 0.3502436, 1.607099, 1, 1, 1, 1, 1,
1.390118, 0.297674, 2.734865, 1, 1, 1, 1, 1,
1.409448, -0.1695696, 0.7849039, 1, 1, 1, 1, 1,
1.409559, 1.972149, -0.7233383, 1, 1, 1, 1, 1,
1.412417, 1.146601, 1.08425, 1, 1, 1, 1, 1,
1.418316, -0.02398209, 2.175686, 1, 1, 1, 1, 1,
1.434373, -0.04818979, 1.316517, 1, 1, 1, 1, 1,
1.43727, 1.45839, 1.33796, 1, 1, 1, 1, 1,
1.450312, -0.2266541, 0.9032915, 1, 1, 1, 1, 1,
1.459851, -0.1750916, 2.906515, 1, 1, 1, 1, 1,
1.48307, 0.2445473, 2.235068, 0, 0, 1, 1, 1,
1.494842, -0.4304465, 3.266421, 1, 0, 0, 1, 1,
1.507908, 0.5467304, -1.027969, 1, 0, 0, 1, 1,
1.517694, -0.4486174, 1.622985, 1, 0, 0, 1, 1,
1.523875, -3.128284, 3.069908, 1, 0, 0, 1, 1,
1.523987, -0.7082622, 2.84435, 1, 0, 0, 1, 1,
1.524885, 0.9620824, -0.1016617, 0, 0, 0, 1, 1,
1.540926, -0.3342116, 1.491589, 0, 0, 0, 1, 1,
1.550857, -0.003100155, 2.006509, 0, 0, 0, 1, 1,
1.558509, 0.4050806, 2.026373, 0, 0, 0, 1, 1,
1.562567, 1.264386, 1.438836, 0, 0, 0, 1, 1,
1.567332, 1.231182, 0.9340518, 0, 0, 0, 1, 1,
1.572396, 0.2338571, 1.103943, 0, 0, 0, 1, 1,
1.57554, -0.4745564, 1.6308, 1, 1, 1, 1, 1,
1.579093, -0.5080388, 2.83308, 1, 1, 1, 1, 1,
1.59988, -0.6398229, 0.879759, 1, 1, 1, 1, 1,
1.611373, -0.4852582, 1.600146, 1, 1, 1, 1, 1,
1.616594, -0.6783902, 2.154292, 1, 1, 1, 1, 1,
1.641597, -0.3142234, 2.544096, 1, 1, 1, 1, 1,
1.646788, 0.05001535, 0.09062474, 1, 1, 1, 1, 1,
1.680665, 0.8589916, 1.384128, 1, 1, 1, 1, 1,
1.681399, 1.107032, 0.425773, 1, 1, 1, 1, 1,
1.68174, 0.775721, 0.9605513, 1, 1, 1, 1, 1,
1.68732, -1.164847, 3.049239, 1, 1, 1, 1, 1,
1.696841, -2.400762, 3.87611, 1, 1, 1, 1, 1,
1.708485, 0.462789, 0.2742579, 1, 1, 1, 1, 1,
1.717495, -0.6664023, 2.580729, 1, 1, 1, 1, 1,
1.728741, -0.7099187, 3.332179, 1, 1, 1, 1, 1,
1.74757, -0.3905546, 0.1098586, 0, 0, 1, 1, 1,
1.755952, -1.74083, 2.063992, 1, 0, 0, 1, 1,
1.772146, 0.3178039, 1.657072, 1, 0, 0, 1, 1,
1.773483, 0.2810003, 0.9853265, 1, 0, 0, 1, 1,
1.774692, 0.9580401, 2.828289, 1, 0, 0, 1, 1,
1.788273, 1.367426, 1.287774, 1, 0, 0, 1, 1,
1.788677, 0.4653691, 1.781731, 0, 0, 0, 1, 1,
1.789373, 1.05347, -1.053074, 0, 0, 0, 1, 1,
1.793362, -0.3664126, 1.752568, 0, 0, 0, 1, 1,
1.80212, 0.5658813, 1.204035, 0, 0, 0, 1, 1,
1.807787, -0.1504822, 0.7433341, 0, 0, 0, 1, 1,
1.821682, 0.5571865, 1.520763, 0, 0, 0, 1, 1,
1.846306, -0.7324739, 1.863325, 0, 0, 0, 1, 1,
1.859608, 1.461483, 1.669082, 1, 1, 1, 1, 1,
1.893589, 0.9815747, 1.302084, 1, 1, 1, 1, 1,
1.897689, 0.2641992, 0.9525223, 1, 1, 1, 1, 1,
1.93894, 0.2024416, 1.737079, 1, 1, 1, 1, 1,
1.946619, 0.7414858, 1.638605, 1, 1, 1, 1, 1,
1.971173, -0.2289347, 1.718099, 1, 1, 1, 1, 1,
1.980716, -0.03514617, 2.959398, 1, 1, 1, 1, 1,
1.985926, 1.058753, 0.9638498, 1, 1, 1, 1, 1,
2.003018, -0.1397451, 0.7951549, 1, 1, 1, 1, 1,
2.005411, -0.7950929, 2.185513, 1, 1, 1, 1, 1,
2.026272, 0.1465587, -0.02711044, 1, 1, 1, 1, 1,
2.027713, 0.515534, 1.111615, 1, 1, 1, 1, 1,
2.033618, -1.560359, 1.812991, 1, 1, 1, 1, 1,
2.034431, -0.9288304, 2.53267, 1, 1, 1, 1, 1,
2.051015, -1.983614, 1.575023, 1, 1, 1, 1, 1,
2.05535, -0.1432869, 1.883967, 0, 0, 1, 1, 1,
2.062617, -0.07955506, 1.103158, 1, 0, 0, 1, 1,
2.089118, 0.5204228, 0.7878578, 1, 0, 0, 1, 1,
2.099815, -0.4699821, 1.649184, 1, 0, 0, 1, 1,
2.109314, 1.003654, 2.771842, 1, 0, 0, 1, 1,
2.140871, -0.3990078, 1.813682, 1, 0, 0, 1, 1,
2.223232, -0.5888599, 1.3377, 0, 0, 0, 1, 1,
2.224165, -0.3903233, 3.583162, 0, 0, 0, 1, 1,
2.255832, 0.1233922, 1.352401, 0, 0, 0, 1, 1,
2.275471, -1.342178, 2.675932, 0, 0, 0, 1, 1,
2.3469, 0.9784182, 1.305479, 0, 0, 0, 1, 1,
2.435252, -0.09638292, 1.646144, 0, 0, 0, 1, 1,
2.448847, -1.059523, 2.78674, 0, 0, 0, 1, 1,
2.456228, 0.830157, 1.650409, 1, 1, 1, 1, 1,
2.488644, -0.0579062, 3.007483, 1, 1, 1, 1, 1,
2.568667, 0.7544641, 0.9178199, 1, 1, 1, 1, 1,
2.726058, -0.5611661, 2.566046, 1, 1, 1, 1, 1,
2.916476, 0.8144101, 1.514322, 1, 1, 1, 1, 1,
3.362288, -0.5288376, 2.173603, 1, 1, 1, 1, 1,
3.532329, 0.479203, 2.490333, 1, 1, 1, 1, 1
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
var radius = 9.659036;
var distance = 33.92696;
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
mvMatrix.translate( -0.4203609, -0.1621599, 0.06491423 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.92696);
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
