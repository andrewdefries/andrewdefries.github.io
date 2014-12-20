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
-3.021504, -0.6610547, -3.291441, 1, 0, 0, 1,
-2.84292, 1.470924, -0.7744765, 1, 0.007843138, 0, 1,
-2.683065, 1.363682, 0.4927074, 1, 0.01176471, 0, 1,
-2.633224, -0.6597648, -1.584557, 1, 0.01960784, 0, 1,
-2.611548, 1.465075, 1.969671, 1, 0.02352941, 0, 1,
-2.533995, -0.7514841, -2.353467, 1, 0.03137255, 0, 1,
-2.522763, -0.1390319, -2.361105, 1, 0.03529412, 0, 1,
-2.47933, 1.114119, -0.3057926, 1, 0.04313726, 0, 1,
-2.386457, -1.0877, -1.728767, 1, 0.04705882, 0, 1,
-2.341847, 0.15185, -1.393982, 1, 0.05490196, 0, 1,
-2.331605, -1.669191, -3.08939, 1, 0.05882353, 0, 1,
-2.299081, 0.709834, -1.740091, 1, 0.06666667, 0, 1,
-2.25223, 1.360181, -2.908523, 1, 0.07058824, 0, 1,
-2.231376, 0.3148874, -2.908452, 1, 0.07843138, 0, 1,
-2.205749, -0.6522943, 1.091904, 1, 0.08235294, 0, 1,
-2.181951, -1.554894, -4.176224, 1, 0.09019608, 0, 1,
-2.156384, -0.1224282, -1.351149, 1, 0.09411765, 0, 1,
-2.114999, 1.318259, -1.25788, 1, 0.1019608, 0, 1,
-2.11036, 0.2953131, -1.258839, 1, 0.1098039, 0, 1,
-2.108539, 1.314195, 1.647871, 1, 0.1137255, 0, 1,
-2.084969, 0.5954918, -3.95527, 1, 0.1215686, 0, 1,
-2.067274, 0.3310064, -2.461383, 1, 0.1254902, 0, 1,
-2.039932, 1.096746, -1.400835, 1, 0.1333333, 0, 1,
-2.031528, -1.956714, -1.587002, 1, 0.1372549, 0, 1,
-2.028018, -0.4023744, -0.1788818, 1, 0.145098, 0, 1,
-1.966495, 0.6275412, -1.389437, 1, 0.1490196, 0, 1,
-1.952852, -1.099729, -1.284073, 1, 0.1568628, 0, 1,
-1.928129, 0.8887731, -1.431559, 1, 0.1607843, 0, 1,
-1.920119, 1.569196, -0.498784, 1, 0.1686275, 0, 1,
-1.917252, 2.102548, -1.02681, 1, 0.172549, 0, 1,
-1.892194, -0.7832868, -1.170845, 1, 0.1803922, 0, 1,
-1.891142, -0.3710776, 0.3280118, 1, 0.1843137, 0, 1,
-1.874251, -1.662584, -2.559179, 1, 0.1921569, 0, 1,
-1.87129, -3.212101, -3.044415, 1, 0.1960784, 0, 1,
-1.803858, -0.9236008, -3.297069, 1, 0.2039216, 0, 1,
-1.793487, -0.7328573, -1.019025, 1, 0.2117647, 0, 1,
-1.786242, -0.635979, -2.007437, 1, 0.2156863, 0, 1,
-1.785872, 0.8810604, -1.56417, 1, 0.2235294, 0, 1,
-1.7756, -1.10946, -2.36855, 1, 0.227451, 0, 1,
-1.768373, 0.865729, -1.180344, 1, 0.2352941, 0, 1,
-1.752873, -2.131177, -3.602171, 1, 0.2392157, 0, 1,
-1.750545, -0.07539701, -1.864856, 1, 0.2470588, 0, 1,
-1.732191, -1.018991, -1.212661, 1, 0.2509804, 0, 1,
-1.720799, -0.4951963, -1.771136, 1, 0.2588235, 0, 1,
-1.719115, -0.1285053, -2.795396, 1, 0.2627451, 0, 1,
-1.713707, 0.3866119, -2.835092, 1, 0.2705882, 0, 1,
-1.710065, -0.2963609, -5.126515, 1, 0.2745098, 0, 1,
-1.70755, 0.5327212, -0.939124, 1, 0.282353, 0, 1,
-1.696238, 0.5071646, -1.925701, 1, 0.2862745, 0, 1,
-1.689671, 0.3824719, -1.54049, 1, 0.2941177, 0, 1,
-1.688675, -0.7908143, -2.094188, 1, 0.3019608, 0, 1,
-1.676934, -0.3282909, -2.99262, 1, 0.3058824, 0, 1,
-1.675545, -1.100608, -3.277162, 1, 0.3137255, 0, 1,
-1.669729, -0.6618598, -1.562908, 1, 0.3176471, 0, 1,
-1.664573, 0.2718358, -0.9076258, 1, 0.3254902, 0, 1,
-1.620594, -0.7155028, -4.581332, 1, 0.3294118, 0, 1,
-1.618381, -0.09553576, -2.527802, 1, 0.3372549, 0, 1,
-1.614372, 0.4491071, -1.468905, 1, 0.3411765, 0, 1,
-1.60717, -1.532564, -3.154179, 1, 0.3490196, 0, 1,
-1.607133, 0.3951155, -1.991663, 1, 0.3529412, 0, 1,
-1.579032, 1.827435, -2.135473, 1, 0.3607843, 0, 1,
-1.576322, 0.2124514, -0.9625194, 1, 0.3647059, 0, 1,
-1.567253, -0.2314716, -1.73795, 1, 0.372549, 0, 1,
-1.561248, -1.476497, -1.797067, 1, 0.3764706, 0, 1,
-1.558776, -0.7757181, 0.9931287, 1, 0.3843137, 0, 1,
-1.556177, -1.135516, -3.214324, 1, 0.3882353, 0, 1,
-1.554775, 0.7791338, -1.398332, 1, 0.3960784, 0, 1,
-1.55473, -0.3158849, -0.09702572, 1, 0.4039216, 0, 1,
-1.553968, -1.301433, -2.186825, 1, 0.4078431, 0, 1,
-1.526358, -0.3487377, -0.4598066, 1, 0.4156863, 0, 1,
-1.521261, -1.07233, -1.627187, 1, 0.4196078, 0, 1,
-1.512951, -0.8369514, -1.90749, 1, 0.427451, 0, 1,
-1.499021, -1.893349, -4.105909, 1, 0.4313726, 0, 1,
-1.498362, -0.4123544, -3.084948, 1, 0.4392157, 0, 1,
-1.498079, 1.159685, -1.502149, 1, 0.4431373, 0, 1,
-1.495346, 1.209324, -2.325089, 1, 0.4509804, 0, 1,
-1.49232, -0.3188577, -1.607413, 1, 0.454902, 0, 1,
-1.492103, -0.7975679, -2.34138, 1, 0.4627451, 0, 1,
-1.478093, -0.9163697, -1.635138, 1, 0.4666667, 0, 1,
-1.47334, 0.4093121, 0.5503689, 1, 0.4745098, 0, 1,
-1.462408, -1.351247, -2.723895, 1, 0.4784314, 0, 1,
-1.462307, -0.3404624, -1.60712, 1, 0.4862745, 0, 1,
-1.457587, -0.2875514, -3.365691, 1, 0.4901961, 0, 1,
-1.455376, 1.356089, -0.7372542, 1, 0.4980392, 0, 1,
-1.454563, -0.3528057, -1.168299, 1, 0.5058824, 0, 1,
-1.433701, -0.1609422, -3.042464, 1, 0.509804, 0, 1,
-1.431671, 0.06022207, -0.592503, 1, 0.5176471, 0, 1,
-1.421781, -1.447391, -3.669681, 1, 0.5215687, 0, 1,
-1.414271, -1.584772, -2.169271, 1, 0.5294118, 0, 1,
-1.394032, -1.188349, -4.805483, 1, 0.5333334, 0, 1,
-1.391853, -0.3648414, -2.96159, 1, 0.5411765, 0, 1,
-1.388672, 0.4374287, -1.531565, 1, 0.5450981, 0, 1,
-1.386026, -0.2573698, -2.582987, 1, 0.5529412, 0, 1,
-1.364701, 0.7245882, -2.537865, 1, 0.5568628, 0, 1,
-1.361348, -0.3776148, -1.85167, 1, 0.5647059, 0, 1,
-1.346479, 0.3878641, -1.022679, 1, 0.5686275, 0, 1,
-1.34528, -1.475136, -2.043865, 1, 0.5764706, 0, 1,
-1.340153, 0.1441415, -1.729192, 1, 0.5803922, 0, 1,
-1.339894, -0.9024902, -1.117405, 1, 0.5882353, 0, 1,
-1.337578, -0.1638549, -0.4414386, 1, 0.5921569, 0, 1,
-1.32765, 0.2530192, -1.174189, 1, 0.6, 0, 1,
-1.325624, 1.845456, -2.259807, 1, 0.6078432, 0, 1,
-1.320714, 0.9190071, -2.031983, 1, 0.6117647, 0, 1,
-1.309726, 1.26364, -0.05432015, 1, 0.6196079, 0, 1,
-1.303502, 1.186868, -1.291686, 1, 0.6235294, 0, 1,
-1.302937, 0.9702972, -1.828505, 1, 0.6313726, 0, 1,
-1.297633, -0.352192, -0.795536, 1, 0.6352941, 0, 1,
-1.292782, -0.4365578, -3.110149, 1, 0.6431373, 0, 1,
-1.290016, -1.832535, -3.497815, 1, 0.6470588, 0, 1,
-1.278378, -1.361631, -3.228196, 1, 0.654902, 0, 1,
-1.277651, 2.205648, -1.216652, 1, 0.6588235, 0, 1,
-1.27274, 0.296066, -1.189327, 1, 0.6666667, 0, 1,
-1.26908, 0.9949517, -0.7499823, 1, 0.6705883, 0, 1,
-1.267684, -0.08469157, -1.332995, 1, 0.6784314, 0, 1,
-1.253877, -0.334851, -3.010084, 1, 0.682353, 0, 1,
-1.253309, -0.0463745, -2.035218, 1, 0.6901961, 0, 1,
-1.252764, -0.5956114, -1.977546, 1, 0.6941177, 0, 1,
-1.248132, -0.2553859, -1.058458, 1, 0.7019608, 0, 1,
-1.243746, 0.8630732, -0.3622615, 1, 0.7098039, 0, 1,
-1.237527, 1.503902, -1.57011, 1, 0.7137255, 0, 1,
-1.234353, 1.218788, -2.300725, 1, 0.7215686, 0, 1,
-1.233713, -1.76932, -3.306514, 1, 0.7254902, 0, 1,
-1.232709, 0.08077653, -2.233385, 1, 0.7333333, 0, 1,
-1.222246, -3.3806, -4.793235, 1, 0.7372549, 0, 1,
-1.22148, -1.86198, -3.903024, 1, 0.7450981, 0, 1,
-1.218972, -1.737941, -2.165941, 1, 0.7490196, 0, 1,
-1.216741, 0.08022121, -1.428354, 1, 0.7568628, 0, 1,
-1.211483, 1.018631, -2.255509, 1, 0.7607843, 0, 1,
-1.200764, 0.477957, -1.664689, 1, 0.7686275, 0, 1,
-1.199208, 0.6616424, -1.040887, 1, 0.772549, 0, 1,
-1.184117, -0.7239006, -3.282779, 1, 0.7803922, 0, 1,
-1.183439, -0.6617184, -3.694098, 1, 0.7843137, 0, 1,
-1.182665, 1.954415, 1.10417, 1, 0.7921569, 0, 1,
-1.182312, -0.01906396, -3.263932, 1, 0.7960784, 0, 1,
-1.161507, 1.118, 0.1841649, 1, 0.8039216, 0, 1,
-1.161135, -0.7601736, -2.334315, 1, 0.8117647, 0, 1,
-1.159372, -0.2764225, -1.948027, 1, 0.8156863, 0, 1,
-1.157032, -0.02075695, -2.199826, 1, 0.8235294, 0, 1,
-1.155378, -0.5256295, -1.60933, 1, 0.827451, 0, 1,
-1.155323, 0.3985955, -0.7770084, 1, 0.8352941, 0, 1,
-1.153593, 0.6885983, -0.8814757, 1, 0.8392157, 0, 1,
-1.14038, -0.7727262, -3.350532, 1, 0.8470588, 0, 1,
-1.13975, -1.185102, -1.777586, 1, 0.8509804, 0, 1,
-1.134877, -0.6408517, -1.910156, 1, 0.8588235, 0, 1,
-1.13369, 0.3462661, -0.6717449, 1, 0.8627451, 0, 1,
-1.119617, -0.1673096, -1.728153, 1, 0.8705882, 0, 1,
-1.107733, -0.8713295, -2.622865, 1, 0.8745098, 0, 1,
-1.104667, 0.5312386, -0.5006108, 1, 0.8823529, 0, 1,
-1.104158, -1.104298, -1.023868, 1, 0.8862745, 0, 1,
-1.102795, 1.919232, -0.330074, 1, 0.8941177, 0, 1,
-1.101726, 1.014313, -1.062843, 1, 0.8980392, 0, 1,
-1.098342, 0.1119002, -2.98146, 1, 0.9058824, 0, 1,
-1.09164, -0.9381455, -3.689477, 1, 0.9137255, 0, 1,
-1.083861, 1.559214, -1.041698, 1, 0.9176471, 0, 1,
-1.083003, 0.6606915, 0.2407914, 1, 0.9254902, 0, 1,
-1.078509, -0.2137354, -0.7356582, 1, 0.9294118, 0, 1,
-1.077991, 0.1405885, -1.832499, 1, 0.9372549, 0, 1,
-1.067394, 0.4429777, -2.195373, 1, 0.9411765, 0, 1,
-1.063867, -0.2422039, -1.150792, 1, 0.9490196, 0, 1,
-1.057624, 0.2082991, 1.637915, 1, 0.9529412, 0, 1,
-1.051318, 0.4200201, -0.4308325, 1, 0.9607843, 0, 1,
-1.049765, 0.6671737, -3.189929, 1, 0.9647059, 0, 1,
-1.048625, -0.6274955, -0.1648478, 1, 0.972549, 0, 1,
-1.040814, 0.1854033, -0.8286921, 1, 0.9764706, 0, 1,
-1.040032, -0.6329448, -2.243877, 1, 0.9843137, 0, 1,
-1.036424, -0.4027101, -2.700033, 1, 0.9882353, 0, 1,
-1.03544, 0.9999736, 0.3269434, 1, 0.9960784, 0, 1,
-1.034726, 0.4582493, -0.6903247, 0.9960784, 1, 0, 1,
-1.034621, 1.170664, -1.915056, 0.9921569, 1, 0, 1,
-1.030724, -0.2690282, -3.63101, 0.9843137, 1, 0, 1,
-1.021397, 0.4597511, 0.2224839, 0.9803922, 1, 0, 1,
-1.019076, -0.7516159, -2.395102, 0.972549, 1, 0, 1,
-1.015882, 0.6533808, -1.352117, 0.9686275, 1, 0, 1,
-1.012465, -2.63552, -2.299841, 0.9607843, 1, 0, 1,
-1.01035, -0.1707779, -1.801309, 0.9568627, 1, 0, 1,
-1.007606, 0.2463358, -1.12043, 0.9490196, 1, 0, 1,
-1.004108, 0.7014881, -1.389139, 0.945098, 1, 0, 1,
-0.9904755, -0.2275232, -3.739347, 0.9372549, 1, 0, 1,
-0.9840376, 1.178473, -1.265612, 0.9333333, 1, 0, 1,
-0.9763443, -1.633286, -2.293232, 0.9254902, 1, 0, 1,
-0.9626802, -0.6607411, -1.550799, 0.9215686, 1, 0, 1,
-0.9566965, 0.08851305, -1.390967, 0.9137255, 1, 0, 1,
-0.9527578, -0.1763973, -2.786661, 0.9098039, 1, 0, 1,
-0.9481436, -1.42486, -1.981619, 0.9019608, 1, 0, 1,
-0.9469361, 0.5549855, -2.151712, 0.8941177, 1, 0, 1,
-0.945706, -0.5888646, -3.109047, 0.8901961, 1, 0, 1,
-0.9359478, 0.2851172, 0.1466058, 0.8823529, 1, 0, 1,
-0.9351848, 0.8023691, -0.2327648, 0.8784314, 1, 0, 1,
-0.930973, 0.7816008, 0.7282413, 0.8705882, 1, 0, 1,
-0.9265596, 0.1000592, -0.2793855, 0.8666667, 1, 0, 1,
-0.9256443, -0.7150257, -3.248624, 0.8588235, 1, 0, 1,
-0.9255425, 0.5659713, -2.859194, 0.854902, 1, 0, 1,
-0.9214402, -0.4174848, -2.804469, 0.8470588, 1, 0, 1,
-0.9005568, 0.438354, 0.5253879, 0.8431373, 1, 0, 1,
-0.8962371, 2.376377, -1.080801, 0.8352941, 1, 0, 1,
-0.8943467, 1.653141, -1.019539, 0.8313726, 1, 0, 1,
-0.8925146, 0.1524829, -0.09047541, 0.8235294, 1, 0, 1,
-0.8910707, 0.2939505, -0.5460815, 0.8196079, 1, 0, 1,
-0.8905913, -1.005064, -2.586997, 0.8117647, 1, 0, 1,
-0.8877295, -1.502869, -3.270376, 0.8078431, 1, 0, 1,
-0.8859619, 1.429763, -0.8478157, 0.8, 1, 0, 1,
-0.8820877, 2.539119, 0.5077426, 0.7921569, 1, 0, 1,
-0.8697889, -1.151678, -1.44536, 0.7882353, 1, 0, 1,
-0.8687466, 0.4662592, -1.470833, 0.7803922, 1, 0, 1,
-0.8684492, 0.3308135, -2.67397, 0.7764706, 1, 0, 1,
-0.8613929, -0.697347, -2.958086, 0.7686275, 1, 0, 1,
-0.8448865, -0.7489892, -2.731703, 0.7647059, 1, 0, 1,
-0.8443679, 1.550078, -1.626993, 0.7568628, 1, 0, 1,
-0.8440869, -0.5685169, -2.388829, 0.7529412, 1, 0, 1,
-0.8429992, 0.04917131, -1.392968, 0.7450981, 1, 0, 1,
-0.8391245, 1.196308, -0.3523552, 0.7411765, 1, 0, 1,
-0.8376054, 3.349033, -0.9269267, 0.7333333, 1, 0, 1,
-0.8337176, 0.7123541, -1.987737, 0.7294118, 1, 0, 1,
-0.8328847, -0.9769804, -1.550338, 0.7215686, 1, 0, 1,
-0.8301046, 0.09296734, -1.596231, 0.7176471, 1, 0, 1,
-0.8284462, -1.825511, -3.240485, 0.7098039, 1, 0, 1,
-0.828029, 1.067258, 0.3073321, 0.7058824, 1, 0, 1,
-0.8229864, -0.2704816, -3.252472, 0.6980392, 1, 0, 1,
-0.8207951, -1.132667, -2.696386, 0.6901961, 1, 0, 1,
-0.8204261, 1.961397, -0.5215138, 0.6862745, 1, 0, 1,
-0.81808, -2.68834, -3.092552, 0.6784314, 1, 0, 1,
-0.8178307, -0.3500057, -0.9106094, 0.6745098, 1, 0, 1,
-0.8021552, -1.513207, -2.331548, 0.6666667, 1, 0, 1,
-0.7934631, -1.058756, -1.233793, 0.6627451, 1, 0, 1,
-0.7881853, 0.4589562, 0.2576416, 0.654902, 1, 0, 1,
-0.7867758, -0.002169863, -3.469891, 0.6509804, 1, 0, 1,
-0.7840713, 0.5964061, -0.9613752, 0.6431373, 1, 0, 1,
-0.7815805, 0.2283172, -1.619604, 0.6392157, 1, 0, 1,
-0.7772655, -1.035764, -3.598516, 0.6313726, 1, 0, 1,
-0.7694116, 1.861918, -0.1488489, 0.627451, 1, 0, 1,
-0.7657099, -1.747464, -4.026496, 0.6196079, 1, 0, 1,
-0.7629716, 1.282157, -0.5087141, 0.6156863, 1, 0, 1,
-0.7553341, 0.6846726, 0.1373361, 0.6078432, 1, 0, 1,
-0.7548411, 0.2842668, -0.1675432, 0.6039216, 1, 0, 1,
-0.7535794, -1.223262, -3.117272, 0.5960785, 1, 0, 1,
-0.7507976, -0.1404121, -3.703801, 0.5882353, 1, 0, 1,
-0.7504405, 1.113622, -1.13947, 0.5843138, 1, 0, 1,
-0.7430067, 0.3671182, -0.5166413, 0.5764706, 1, 0, 1,
-0.7428999, 0.6036844, -1.083621, 0.572549, 1, 0, 1,
-0.735867, -0.7319505, -1.801055, 0.5647059, 1, 0, 1,
-0.7352492, -0.06893244, -1.51136, 0.5607843, 1, 0, 1,
-0.7350462, 1.025379, 0.9058409, 0.5529412, 1, 0, 1,
-0.7339872, 0.003643733, -2.908249, 0.5490196, 1, 0, 1,
-0.7308937, 0.8975574, -0.2826722, 0.5411765, 1, 0, 1,
-0.7253737, 1.692373, -0.5944352, 0.5372549, 1, 0, 1,
-0.7247864, 0.2465657, 0.08750428, 0.5294118, 1, 0, 1,
-0.7191762, -0.7421303, -1.792631, 0.5254902, 1, 0, 1,
-0.7189752, -0.6398306, -2.352852, 0.5176471, 1, 0, 1,
-0.7179892, 0.4378079, -0.5386438, 0.5137255, 1, 0, 1,
-0.7139006, -0.5221315, -2.828145, 0.5058824, 1, 0, 1,
-0.7115573, 0.2237408, -2.115513, 0.5019608, 1, 0, 1,
-0.7079916, 2.065634, 0.6539492, 0.4941176, 1, 0, 1,
-0.7076767, -0.7275993, -2.894367, 0.4862745, 1, 0, 1,
-0.6948307, 0.4912135, -0.1827249, 0.4823529, 1, 0, 1,
-0.6864536, -0.2180861, -3.100535, 0.4745098, 1, 0, 1,
-0.6855108, -0.7863947, -3.638904, 0.4705882, 1, 0, 1,
-0.6849499, -1.532393, -3.206324, 0.4627451, 1, 0, 1,
-0.6822961, -1.055394, -3.587613, 0.4588235, 1, 0, 1,
-0.6816951, -1.59341, -4.012827, 0.4509804, 1, 0, 1,
-0.6812301, 0.6891085, -3.035945, 0.4470588, 1, 0, 1,
-0.6806221, -0.6750682, -0.6914852, 0.4392157, 1, 0, 1,
-0.6789863, -0.537823, -2.195451, 0.4352941, 1, 0, 1,
-0.6788815, -0.6264394, -1.605215, 0.427451, 1, 0, 1,
-0.6778921, 0.7611757, -0.9240451, 0.4235294, 1, 0, 1,
-0.6773311, -0.2460758, -2.448222, 0.4156863, 1, 0, 1,
-0.6754135, 0.0667608, -1.401605, 0.4117647, 1, 0, 1,
-0.6734843, -0.15832, 0.4142912, 0.4039216, 1, 0, 1,
-0.6683775, -0.5724281, -2.119056, 0.3960784, 1, 0, 1,
-0.6668263, -0.5790771, -3.155649, 0.3921569, 1, 0, 1,
-0.6647391, -0.3712547, -2.833716, 0.3843137, 1, 0, 1,
-0.664508, -1.152091, -2.150863, 0.3803922, 1, 0, 1,
-0.6575966, -0.01189253, -0.5233473, 0.372549, 1, 0, 1,
-0.6510763, -0.769963, -3.091112, 0.3686275, 1, 0, 1,
-0.6495231, 2.032268, -1.362886, 0.3607843, 1, 0, 1,
-0.6495218, 0.6346167, 1.225945, 0.3568628, 1, 0, 1,
-0.6457903, -0.847123, -2.056283, 0.3490196, 1, 0, 1,
-0.6445051, -1.011575, -2.027394, 0.345098, 1, 0, 1,
-0.6423383, 0.07498705, -1.312901, 0.3372549, 1, 0, 1,
-0.6405845, 0.5528208, -2.715268, 0.3333333, 1, 0, 1,
-0.6374393, -1.109007, -4.563755, 0.3254902, 1, 0, 1,
-0.6309371, -0.5165516, -3.33254, 0.3215686, 1, 0, 1,
-0.6279851, -1.148716, -1.983556, 0.3137255, 1, 0, 1,
-0.6238272, -0.3064317, -0.3577431, 0.3098039, 1, 0, 1,
-0.6210663, -0.1026856, -1.655278, 0.3019608, 1, 0, 1,
-0.6181264, -0.5684404, -1.471174, 0.2941177, 1, 0, 1,
-0.6181112, -1.142704, -1.780169, 0.2901961, 1, 0, 1,
-0.6171979, 1.298277, -0.2522227, 0.282353, 1, 0, 1,
-0.6162384, 1.227724, -1.406072, 0.2784314, 1, 0, 1,
-0.6159195, -1.100753, -2.714678, 0.2705882, 1, 0, 1,
-0.6005647, 0.6942518, -1.679083, 0.2666667, 1, 0, 1,
-0.5988236, -0.6279421, -3.008248, 0.2588235, 1, 0, 1,
-0.5970993, 0.1874266, 1.033466, 0.254902, 1, 0, 1,
-0.5914069, 0.8531725, -2.757865, 0.2470588, 1, 0, 1,
-0.5913742, 0.3683723, 0.0411178, 0.2431373, 1, 0, 1,
-0.582853, -0.7387704, -0.4174328, 0.2352941, 1, 0, 1,
-0.5824058, -0.4124108, -2.140766, 0.2313726, 1, 0, 1,
-0.5819037, 0.5980938, -1.341431, 0.2235294, 1, 0, 1,
-0.5792124, -0.1064687, -2.22428, 0.2196078, 1, 0, 1,
-0.5778548, 0.7938273, 0.8314868, 0.2117647, 1, 0, 1,
-0.5719212, -2.053509, -3.460817, 0.2078431, 1, 0, 1,
-0.5717095, 1.252534, -1.344954, 0.2, 1, 0, 1,
-0.5707479, 1.067832, -0.6662675, 0.1921569, 1, 0, 1,
-0.5643135, 0.287385, -0.6610821, 0.1882353, 1, 0, 1,
-0.5643042, -0.1746555, -1.672317, 0.1803922, 1, 0, 1,
-0.5642219, -0.353813, -0.429817, 0.1764706, 1, 0, 1,
-0.5622955, -0.9347014, -3.34559, 0.1686275, 1, 0, 1,
-0.5585459, 0.1915406, -1.961719, 0.1647059, 1, 0, 1,
-0.5583714, -1.508014, -2.258648, 0.1568628, 1, 0, 1,
-0.5541371, -1.200493, -2.440728, 0.1529412, 1, 0, 1,
-0.5494506, 0.9488479, -0.358457, 0.145098, 1, 0, 1,
-0.5477085, -0.3229962, -1.968925, 0.1411765, 1, 0, 1,
-0.5471798, -0.194643, -2.016848, 0.1333333, 1, 0, 1,
-0.5463371, -0.6601944, -2.870268, 0.1294118, 1, 0, 1,
-0.5450235, 1.086336, -1.266722, 0.1215686, 1, 0, 1,
-0.5447466, -0.326949, -1.919225, 0.1176471, 1, 0, 1,
-0.5444119, 1.014292, -2.730361, 0.1098039, 1, 0, 1,
-0.538843, 0.548117, -1.632743, 0.1058824, 1, 0, 1,
-0.5316736, 0.5107216, -0.08012989, 0.09803922, 1, 0, 1,
-0.5314604, 1.042074, -1.131126, 0.09019608, 1, 0, 1,
-0.5302207, 0.6211467, -2.42745, 0.08627451, 1, 0, 1,
-0.5285574, 0.968769, 0.3820229, 0.07843138, 1, 0, 1,
-0.5285098, -0.07809011, -1.046418, 0.07450981, 1, 0, 1,
-0.5283138, -2.692978, -3.021933, 0.06666667, 1, 0, 1,
-0.5278229, -1.862579, -1.304953, 0.0627451, 1, 0, 1,
-0.5245388, 0.4395329, -2.012512, 0.05490196, 1, 0, 1,
-0.5118477, -0.3125185, -2.45255, 0.05098039, 1, 0, 1,
-0.5097234, -0.1842667, -2.250439, 0.04313726, 1, 0, 1,
-0.5019529, -1.556014, -3.840827, 0.03921569, 1, 0, 1,
-0.5015253, -0.5726971, -3.13163, 0.03137255, 1, 0, 1,
-0.5013244, -0.4077087, -3.807839, 0.02745098, 1, 0, 1,
-0.4984998, -0.02886428, -0.2256336, 0.01960784, 1, 0, 1,
-0.4927905, -0.4689966, -1.747864, 0.01568628, 1, 0, 1,
-0.4899577, -1.427752, -2.726412, 0.007843138, 1, 0, 1,
-0.4841754, 0.008441866, -0.738782, 0.003921569, 1, 0, 1,
-0.4838938, -0.5976443, -1.118549, 0, 1, 0.003921569, 1,
-0.4776996, 0.9239566, -0.8068181, 0, 1, 0.01176471, 1,
-0.4723682, 1.891214, 1.004819, 0, 1, 0.01568628, 1,
-0.4704261, -0.2315796, -2.296285, 0, 1, 0.02352941, 1,
-0.4634416, -2.095098, -2.113007, 0, 1, 0.02745098, 1,
-0.4612267, 0.2681458, -0.0132595, 0, 1, 0.03529412, 1,
-0.4604145, -0.8358466, -1.053832, 0, 1, 0.03921569, 1,
-0.4592711, 0.7077808, -1.966524, 0, 1, 0.04705882, 1,
-0.4552234, -2.496253, -1.197558, 0, 1, 0.05098039, 1,
-0.4494997, 0.6600184, -1.369661, 0, 1, 0.05882353, 1,
-0.4473495, 1.064326, 0.9833757, 0, 1, 0.0627451, 1,
-0.444107, -1.082044, -2.298414, 0, 1, 0.07058824, 1,
-0.4386539, -0.8227378, -4.111555, 0, 1, 0.07450981, 1,
-0.4371058, 1.352189, 0.7644656, 0, 1, 0.08235294, 1,
-0.4361679, 0.3194642, -1.388292, 0, 1, 0.08627451, 1,
-0.435912, -0.1949333, -2.390548, 0, 1, 0.09411765, 1,
-0.4340508, -0.03436689, -1.70022, 0, 1, 0.1019608, 1,
-0.431412, 0.2365849, -1.249302, 0, 1, 0.1058824, 1,
-0.4296331, -0.09554013, -3.353102, 0, 1, 0.1137255, 1,
-0.4246328, 0.2190859, -0.66583, 0, 1, 0.1176471, 1,
-0.4240566, -0.2808264, -0.4253892, 0, 1, 0.1254902, 1,
-0.4180108, -0.1380816, -4.142843, 0, 1, 0.1294118, 1,
-0.4120255, -2.024984, -4.067648, 0, 1, 0.1372549, 1,
-0.4099814, 1.330053, -0.6862539, 0, 1, 0.1411765, 1,
-0.4078373, 0.1581877, -2.336771, 0, 1, 0.1490196, 1,
-0.4052016, 0.215279, -0.06786886, 0, 1, 0.1529412, 1,
-0.400709, 0.4787733, 0.6460682, 0, 1, 0.1607843, 1,
-0.3916562, -0.937282, -3.010172, 0, 1, 0.1647059, 1,
-0.3899363, -0.246778, -0.6573179, 0, 1, 0.172549, 1,
-0.384167, 1.176394, -1.504583, 0, 1, 0.1764706, 1,
-0.380131, -0.6542389, -1.648541, 0, 1, 0.1843137, 1,
-0.3719872, -0.7507842, -2.321571, 0, 1, 0.1882353, 1,
-0.3704133, 2.119452, -0.2984812, 0, 1, 0.1960784, 1,
-0.3684467, -0.3498378, -2.018447, 0, 1, 0.2039216, 1,
-0.3676524, -0.8020608, -2.569996, 0, 1, 0.2078431, 1,
-0.3671101, -1.491811, -3.390425, 0, 1, 0.2156863, 1,
-0.3612107, 0.9672565, -1.230323, 0, 1, 0.2196078, 1,
-0.3569307, 0.6529253, -1.319847, 0, 1, 0.227451, 1,
-0.3547817, 0.187745, -0.5133254, 0, 1, 0.2313726, 1,
-0.3535188, -1.45642, -2.351405, 0, 1, 0.2392157, 1,
-0.3508233, 0.6164723, -0.3482786, 0, 1, 0.2431373, 1,
-0.3492353, 1.217873, 1.220815, 0, 1, 0.2509804, 1,
-0.3467953, 0.637262, -2.838044, 0, 1, 0.254902, 1,
-0.3462534, 0.4925269, -0.01057938, 0, 1, 0.2627451, 1,
-0.3447126, -2.197774, -4.719943, 0, 1, 0.2666667, 1,
-0.3446747, 1.95107, 1.199432, 0, 1, 0.2745098, 1,
-0.3376491, -1.220778, -2.523879, 0, 1, 0.2784314, 1,
-0.3302001, -0.471058, -1.54352, 0, 1, 0.2862745, 1,
-0.3283482, 0.2778318, -0.9496852, 0, 1, 0.2901961, 1,
-0.3281906, -0.8453767, -3.276487, 0, 1, 0.2980392, 1,
-0.3280959, -0.3737573, -1.825288, 0, 1, 0.3058824, 1,
-0.3253307, -0.2558845, -1.879963, 0, 1, 0.3098039, 1,
-0.3244291, -0.7413977, -3.298189, 0, 1, 0.3176471, 1,
-0.3230524, -0.155521, -1.92754, 0, 1, 0.3215686, 1,
-0.3220685, -1.292499, -1.118872, 0, 1, 0.3294118, 1,
-0.3171975, 1.357077, 0.7572743, 0, 1, 0.3333333, 1,
-0.3159453, -0.9537003, -0.5893231, 0, 1, 0.3411765, 1,
-0.3150554, 1.185318, 0.5838504, 0, 1, 0.345098, 1,
-0.3129372, 0.5810905, 2.27157, 0, 1, 0.3529412, 1,
-0.3111497, -0.4847843, -0.5281436, 0, 1, 0.3568628, 1,
-0.3075139, 0.1793128, -1.809665, 0, 1, 0.3647059, 1,
-0.2969311, -0.3956534, -3.21172, 0, 1, 0.3686275, 1,
-0.2948682, -2.207401, -4.039349, 0, 1, 0.3764706, 1,
-0.2933906, -0.5821447, -0.9142954, 0, 1, 0.3803922, 1,
-0.291342, -0.4068712, -3.127493, 0, 1, 0.3882353, 1,
-0.2902203, -0.6285934, -2.512664, 0, 1, 0.3921569, 1,
-0.2883425, -2.338598, -1.955723, 0, 1, 0.4, 1,
-0.2883113, 0.4811552, -0.1962606, 0, 1, 0.4078431, 1,
-0.2814383, 0.6832205, -0.02757078, 0, 1, 0.4117647, 1,
-0.2796364, -1.818636, -4.566374, 0, 1, 0.4196078, 1,
-0.2711587, -0.6365659, -2.808404, 0, 1, 0.4235294, 1,
-0.2655914, -0.7053797, -4.47137, 0, 1, 0.4313726, 1,
-0.2613161, -0.2373011, -2.766379, 0, 1, 0.4352941, 1,
-0.2565755, 0.6815468, -0.1895564, 0, 1, 0.4431373, 1,
-0.2564423, 0.2002219, -0.7810397, 0, 1, 0.4470588, 1,
-0.2552921, -1.374073, -4.485082, 0, 1, 0.454902, 1,
-0.2538309, -1.977791, -2.790813, 0, 1, 0.4588235, 1,
-0.2537386, 0.6581309, -1.43358, 0, 1, 0.4666667, 1,
-0.2492811, 1.016599, -0.2549358, 0, 1, 0.4705882, 1,
-0.2479461, 0.08774541, -1.178992, 0, 1, 0.4784314, 1,
-0.2470604, -0.6250656, -3.786821, 0, 1, 0.4823529, 1,
-0.2467619, 0.6319084, 0.3913053, 0, 1, 0.4901961, 1,
-0.2432701, 0.7097847, -1.321402, 0, 1, 0.4941176, 1,
-0.2423125, -0.1900717, -2.237597, 0, 1, 0.5019608, 1,
-0.2348027, -1.227841, -2.813131, 0, 1, 0.509804, 1,
-0.2312146, -0.5856296, -1.688449, 0, 1, 0.5137255, 1,
-0.2256756, -2.848638, -3.077248, 0, 1, 0.5215687, 1,
-0.2160858, 1.456106, -1.027856, 0, 1, 0.5254902, 1,
-0.2006845, -2.055706, -2.534665, 0, 1, 0.5333334, 1,
-0.1983828, -1.79765, -1.814949, 0, 1, 0.5372549, 1,
-0.1983135, -1.359109, -3.316088, 0, 1, 0.5450981, 1,
-0.1976865, -0.01607603, -2.136813, 0, 1, 0.5490196, 1,
-0.1951059, -1.19118, -2.28605, 0, 1, 0.5568628, 1,
-0.1907586, 0.2633244, -0.0180294, 0, 1, 0.5607843, 1,
-0.1861071, -0.06918447, -0.6025746, 0, 1, 0.5686275, 1,
-0.1854323, -0.3033037, -2.117903, 0, 1, 0.572549, 1,
-0.1851212, 0.8969463, -1.055942, 0, 1, 0.5803922, 1,
-0.1723659, 0.2338044, 0.3113854, 0, 1, 0.5843138, 1,
-0.1714697, 1.114435, 0.2978674, 0, 1, 0.5921569, 1,
-0.1683566, -0.5839496, -2.03811, 0, 1, 0.5960785, 1,
-0.1606871, -2.124421, -2.625501, 0, 1, 0.6039216, 1,
-0.1594608, 0.5476813, -1.964588, 0, 1, 0.6117647, 1,
-0.1520025, -1.348973, -2.517109, 0, 1, 0.6156863, 1,
-0.146966, 1.662393, 0.5341923, 0, 1, 0.6235294, 1,
-0.1455168, 1.481785, 0.8646434, 0, 1, 0.627451, 1,
-0.1429574, 1.201579, 0.5047107, 0, 1, 0.6352941, 1,
-0.1375562, -2.346448, -2.098433, 0, 1, 0.6392157, 1,
-0.1348523, 2.016685, -0.01717648, 0, 1, 0.6470588, 1,
-0.132293, 0.8952762, -0.2248106, 0, 1, 0.6509804, 1,
-0.129314, 0.3225563, 1.130834, 0, 1, 0.6588235, 1,
-0.1279556, 0.3866723, 1.11859, 0, 1, 0.6627451, 1,
-0.1273721, -0.421773, -3.476638, 0, 1, 0.6705883, 1,
-0.1214821, 1.874192, -1.127801, 0, 1, 0.6745098, 1,
-0.1185368, -0.6759924, -2.425466, 0, 1, 0.682353, 1,
-0.1135004, -1.168475, -1.433457, 0, 1, 0.6862745, 1,
-0.1118331, 1.195452, 0.3521433, 0, 1, 0.6941177, 1,
-0.1088543, -0.7669871, -2.782975, 0, 1, 0.7019608, 1,
-0.1080825, -2.542132, -3.494266, 0, 1, 0.7058824, 1,
-0.105932, 0.3161545, 0.1317535, 0, 1, 0.7137255, 1,
-0.1029967, -0.1697172, -1.817632, 0, 1, 0.7176471, 1,
-0.09628808, 0.4078822, -1.226342, 0, 1, 0.7254902, 1,
-0.09219059, 1.521876, 1.610424, 0, 1, 0.7294118, 1,
-0.09165224, -0.2653572, -2.263866, 0, 1, 0.7372549, 1,
-0.09054175, -0.5764919, -3.615621, 0, 1, 0.7411765, 1,
-0.0884808, 1.194223, 0.1971638, 0, 1, 0.7490196, 1,
-0.08419503, -0.9950774, -5.085535, 0, 1, 0.7529412, 1,
-0.08417573, -0.247081, -0.7235701, 0, 1, 0.7607843, 1,
-0.08263192, -1.290681, -3.311008, 0, 1, 0.7647059, 1,
-0.07755964, -0.7160814, -2.003955, 0, 1, 0.772549, 1,
-0.07707009, 1.287603, 0.3767971, 0, 1, 0.7764706, 1,
-0.07681938, 0.02846923, -0.497983, 0, 1, 0.7843137, 1,
-0.07612479, 0.5562161, -0.3674698, 0, 1, 0.7882353, 1,
-0.07524058, -1.718777, -4.944494, 0, 1, 0.7960784, 1,
-0.06923851, -1.502501, -2.403871, 0, 1, 0.8039216, 1,
-0.0665926, 0.01223141, -1.651478, 0, 1, 0.8078431, 1,
-0.05998442, -0.3047039, -3.693063, 0, 1, 0.8156863, 1,
-0.05643512, -0.3509265, -2.779844, 0, 1, 0.8196079, 1,
-0.05295979, 1.063557, -0.06567471, 0, 1, 0.827451, 1,
-0.05102625, -1.360185, -3.802222, 0, 1, 0.8313726, 1,
-0.05000867, -1.015663, -1.375209, 0, 1, 0.8392157, 1,
-0.04737645, 0.6581321, -2.35595, 0, 1, 0.8431373, 1,
-0.046683, -0.01862677, -2.169668, 0, 1, 0.8509804, 1,
-0.04439704, 0.04799843, -0.9478171, 0, 1, 0.854902, 1,
-0.04175076, 0.02510524, -2.183904, 0, 1, 0.8627451, 1,
-0.04169124, 1.078633, -0.1621924, 0, 1, 0.8666667, 1,
-0.03894316, 0.224358, 0.09927391, 0, 1, 0.8745098, 1,
-0.03183415, -0.001789665, -3.294312, 0, 1, 0.8784314, 1,
-0.03182997, -0.8076926, -3.453241, 0, 1, 0.8862745, 1,
-0.02868838, 0.4612789, -0.5181404, 0, 1, 0.8901961, 1,
-0.02811182, -0.06146129, -2.637378, 0, 1, 0.8980392, 1,
-0.0260373, 0.8103626, -0.9643648, 0, 1, 0.9058824, 1,
-0.02590035, 1.359268, -1.029766, 0, 1, 0.9098039, 1,
-0.02500952, 1.018863, 0.4193179, 0, 1, 0.9176471, 1,
-0.02497205, -0.4733229, -2.194371, 0, 1, 0.9215686, 1,
-0.02018709, 1.04705, -1.244989, 0, 1, 0.9294118, 1,
-0.01715533, -0.2778793, -1.241927, 0, 1, 0.9333333, 1,
-0.0168524, -0.3107808, -3.044315, 0, 1, 0.9411765, 1,
-0.01586105, -0.02843419, -0.5827489, 0, 1, 0.945098, 1,
-0.01449912, 2.086702, -0.7116948, 0, 1, 0.9529412, 1,
-0.01244453, -0.1823817, -0.6283485, 0, 1, 0.9568627, 1,
-0.01073274, -1.115099, -1.677264, 0, 1, 0.9647059, 1,
-0.006390273, 1.163751, 2.546673, 0, 1, 0.9686275, 1,
-0.004246037, -1.986084, -3.500529, 0, 1, 0.9764706, 1,
-0.003732376, -0.3122009, -2.569664, 0, 1, 0.9803922, 1,
-0.001955271, 0.2027587, -0.6807439, 0, 1, 0.9882353, 1,
0.001036924, -0.2519681, 3.506848, 0, 1, 0.9921569, 1,
0.005150449, 0.5529173, -0.2270026, 0, 1, 1, 1,
0.009266418, 0.4461539, -0.2775818, 0, 0.9921569, 1, 1,
0.01134902, 0.4576079, -0.02768546, 0, 0.9882353, 1, 1,
0.01367954, 1.683519, -0.6496904, 0, 0.9803922, 1, 1,
0.01459923, -0.03967342, 2.730061, 0, 0.9764706, 1, 1,
0.01476607, -0.205004, 1.913569, 0, 0.9686275, 1, 1,
0.01517756, -0.0704409, 3.524603, 0, 0.9647059, 1, 1,
0.01710638, -0.07274464, 2.540848, 0, 0.9568627, 1, 1,
0.01759591, -1.685645, 3.890327, 0, 0.9529412, 1, 1,
0.02445246, 0.9560297, -0.8940098, 0, 0.945098, 1, 1,
0.03115822, 1.858587, -0.04269274, 0, 0.9411765, 1, 1,
0.0321313, 0.4784059, 0.2821531, 0, 0.9333333, 1, 1,
0.03293702, 0.1455067, -0.1282142, 0, 0.9294118, 1, 1,
0.03348897, -0.516959, 2.521142, 0, 0.9215686, 1, 1,
0.03370808, 0.3818955, -0.3589527, 0, 0.9176471, 1, 1,
0.03663705, 0.9545327, 0.6983031, 0, 0.9098039, 1, 1,
0.04051495, -0.6700073, 2.882983, 0, 0.9058824, 1, 1,
0.04180618, 0.8602844, 0.598437, 0, 0.8980392, 1, 1,
0.04495498, -0.4641775, 2.831307, 0, 0.8901961, 1, 1,
0.04552718, -1.501276, 4.290771, 0, 0.8862745, 1, 1,
0.04692479, -0.6463047, 4.90581, 0, 0.8784314, 1, 1,
0.05059678, -0.2701538, 2.383819, 0, 0.8745098, 1, 1,
0.05120265, -0.3431984, 2.650979, 0, 0.8666667, 1, 1,
0.05623518, 0.4496946, 0.07267268, 0, 0.8627451, 1, 1,
0.0601405, 1.166324, 0.1225669, 0, 0.854902, 1, 1,
0.0622606, 1.658337, 2.418883, 0, 0.8509804, 1, 1,
0.06473561, -0.1639468, 3.909509, 0, 0.8431373, 1, 1,
0.06560315, -1.258752, 1.632486, 0, 0.8392157, 1, 1,
0.065781, 1.154855, 1.644083, 0, 0.8313726, 1, 1,
0.06648681, -0.455319, 3.96934, 0, 0.827451, 1, 1,
0.06973416, -1.807364, 3.715449, 0, 0.8196079, 1, 1,
0.07229194, 1.097447, -1.055448, 0, 0.8156863, 1, 1,
0.07634503, -0.5318679, 2.835333, 0, 0.8078431, 1, 1,
0.07849877, 0.0805885, 0.08003339, 0, 0.8039216, 1, 1,
0.07992148, -0.463705, 2.98254, 0, 0.7960784, 1, 1,
0.08009975, -0.8698906, 2.026406, 0, 0.7882353, 1, 1,
0.08012757, 0.2980677, 1.68596, 0, 0.7843137, 1, 1,
0.08347543, -1.107441, 2.587839, 0, 0.7764706, 1, 1,
0.08826538, 0.7344661, -1.804557, 0, 0.772549, 1, 1,
0.08968148, 0.9763162, 1.237636, 0, 0.7647059, 1, 1,
0.09891232, -0.9324728, 2.382789, 0, 0.7607843, 1, 1,
0.1044621, -1.229798, 4.88284, 0, 0.7529412, 1, 1,
0.1054922, -0.9197488, 3.48602, 0, 0.7490196, 1, 1,
0.1078241, 0.2914432, 0.2589528, 0, 0.7411765, 1, 1,
0.1110011, -0.5473237, 1.368657, 0, 0.7372549, 1, 1,
0.1135195, -1.299027, 3.62909, 0, 0.7294118, 1, 1,
0.1138889, 0.9917759, -1.992791, 0, 0.7254902, 1, 1,
0.1139642, 0.6762797, 0.09822397, 0, 0.7176471, 1, 1,
0.1161851, 1.546168, -1.312038, 0, 0.7137255, 1, 1,
0.116489, -0.2075467, 2.78344, 0, 0.7058824, 1, 1,
0.1174369, 0.3293743, 0.67455, 0, 0.6980392, 1, 1,
0.1199363, -0.1071885, 3.537589, 0, 0.6941177, 1, 1,
0.125191, -1.109981, 2.989966, 0, 0.6862745, 1, 1,
0.1272373, 0.1749331, -0.542276, 0, 0.682353, 1, 1,
0.129227, 0.1951516, 0.2199705, 0, 0.6745098, 1, 1,
0.1306629, -0.4352366, 3.239099, 0, 0.6705883, 1, 1,
0.1309912, 0.6281594, 0.9894356, 0, 0.6627451, 1, 1,
0.1344177, -0.4356538, 2.090306, 0, 0.6588235, 1, 1,
0.1357294, 2.11174, -0.7577474, 0, 0.6509804, 1, 1,
0.1380244, 1.298999, -0.2352187, 0, 0.6470588, 1, 1,
0.1386901, 1.1043, -0.6454798, 0, 0.6392157, 1, 1,
0.1421248, 0.1219663, 0.2260522, 0, 0.6352941, 1, 1,
0.1483292, -0.2051696, 2.002581, 0, 0.627451, 1, 1,
0.1509167, 0.9287652, -0.5437183, 0, 0.6235294, 1, 1,
0.1517219, 1.369087, 1.673243, 0, 0.6156863, 1, 1,
0.1578771, 1.888825, -0.4783645, 0, 0.6117647, 1, 1,
0.1596178, -1.187158, 1.666229, 0, 0.6039216, 1, 1,
0.1619504, -0.05208043, 0.817642, 0, 0.5960785, 1, 1,
0.1658934, 0.03429129, 1.59634, 0, 0.5921569, 1, 1,
0.1662433, 1.356183, -0.8059421, 0, 0.5843138, 1, 1,
0.1674596, -0.5866896, 3.282971, 0, 0.5803922, 1, 1,
0.1700969, -0.7633926, 2.531955, 0, 0.572549, 1, 1,
0.1775376, -2.135767, 4.228256, 0, 0.5686275, 1, 1,
0.1783147, 0.6145009, 1.78161, 0, 0.5607843, 1, 1,
0.1820763, 0.5549282, 0.5559213, 0, 0.5568628, 1, 1,
0.1856337, -0.1695485, 2.160423, 0, 0.5490196, 1, 1,
0.1910945, -0.2949308, 2.64031, 0, 0.5450981, 1, 1,
0.1928851, -1.401133, 4.465546, 0, 0.5372549, 1, 1,
0.1930422, -0.2274216, 3.363494, 0, 0.5333334, 1, 1,
0.1935747, -0.4051179, 2.15644, 0, 0.5254902, 1, 1,
0.1947099, 0.2355259, 1.388555, 0, 0.5215687, 1, 1,
0.1947616, -0.9418807, 2.848761, 0, 0.5137255, 1, 1,
0.1972389, 0.1500167, 1.040019, 0, 0.509804, 1, 1,
0.2009617, 1.162908, -0.8956452, 0, 0.5019608, 1, 1,
0.2014132, 1.007227, -0.3827668, 0, 0.4941176, 1, 1,
0.2021111, -1.989622, 4.714747, 0, 0.4901961, 1, 1,
0.2026452, -0.218113, 3.302667, 0, 0.4823529, 1, 1,
0.2041015, 0.9576979, 0.8457063, 0, 0.4784314, 1, 1,
0.2081534, -0.2270711, 2.090847, 0, 0.4705882, 1, 1,
0.2088764, 1.194516, 1.516162, 0, 0.4666667, 1, 1,
0.2142157, -0.04455193, 1.532884, 0, 0.4588235, 1, 1,
0.2167947, -0.7794234, 1.658498, 0, 0.454902, 1, 1,
0.2176486, 0.08953188, 0.2940824, 0, 0.4470588, 1, 1,
0.2204379, -0.4340424, 2.782877, 0, 0.4431373, 1, 1,
0.2310874, -0.9242285, 4.277943, 0, 0.4352941, 1, 1,
0.2330213, -0.4688882, 1.305278, 0, 0.4313726, 1, 1,
0.2346231, 0.4682578, 1.132075, 0, 0.4235294, 1, 1,
0.2451691, -0.1298085, 3.289346, 0, 0.4196078, 1, 1,
0.2473117, -0.9760379, 2.563592, 0, 0.4117647, 1, 1,
0.2511718, -2.53041, 3.950265, 0, 0.4078431, 1, 1,
0.258007, -0.3621423, 2.868065, 0, 0.4, 1, 1,
0.2586017, 0.1798884, 0.5425265, 0, 0.3921569, 1, 1,
0.259405, 0.4083076, 0.1769747, 0, 0.3882353, 1, 1,
0.2656595, 0.8403642, -0.9281799, 0, 0.3803922, 1, 1,
0.26581, 0.06708488, 2.895378, 0, 0.3764706, 1, 1,
0.266908, 2.936362, 1.55533, 0, 0.3686275, 1, 1,
0.2718296, -0.4460764, 1.350479, 0, 0.3647059, 1, 1,
0.2730002, -0.08457404, 1.820559, 0, 0.3568628, 1, 1,
0.2735235, -0.4301974, 0.2132725, 0, 0.3529412, 1, 1,
0.2786538, -0.1042643, 3.337217, 0, 0.345098, 1, 1,
0.2809213, 0.4746293, 0.3635788, 0, 0.3411765, 1, 1,
0.2850094, 1.157915, -0.4739148, 0, 0.3333333, 1, 1,
0.285611, -0.9726588, 2.673542, 0, 0.3294118, 1, 1,
0.2860434, -1.102897, 3.495933, 0, 0.3215686, 1, 1,
0.2887527, -0.6363212, 2.215538, 0, 0.3176471, 1, 1,
0.2906477, 1.29507, 0.3103641, 0, 0.3098039, 1, 1,
0.2918519, 0.8307231, 0.1798191, 0, 0.3058824, 1, 1,
0.293329, 0.2988149, 0.4713936, 0, 0.2980392, 1, 1,
0.2936339, -0.9370548, 2.769909, 0, 0.2901961, 1, 1,
0.2963983, -0.06357693, 1.244142, 0, 0.2862745, 1, 1,
0.2967351, -0.01301066, -0.3575818, 0, 0.2784314, 1, 1,
0.296815, -0.1894854, 3.143594, 0, 0.2745098, 1, 1,
0.2978901, 1.046405, -0.8623812, 0, 0.2666667, 1, 1,
0.3007626, 1.031233, -0.6866375, 0, 0.2627451, 1, 1,
0.3072958, -0.5915862, -0.4280861, 0, 0.254902, 1, 1,
0.3077745, 0.9866239, 0.3429515, 0, 0.2509804, 1, 1,
0.3085576, 1.882957, 2.442634, 0, 0.2431373, 1, 1,
0.3124178, 0.9356965, 1.41421, 0, 0.2392157, 1, 1,
0.3170271, 0.530807, 0.8413712, 0, 0.2313726, 1, 1,
0.3191772, 0.3696119, -0.1948879, 0, 0.227451, 1, 1,
0.3193558, 0.4457941, -0.7419093, 0, 0.2196078, 1, 1,
0.3200517, 0.2315324, -0.01558955, 0, 0.2156863, 1, 1,
0.3220713, -0.9178891, 3.046385, 0, 0.2078431, 1, 1,
0.3225271, 0.3595435, -0.1845747, 0, 0.2039216, 1, 1,
0.3231771, 0.315293, 0.6539475, 0, 0.1960784, 1, 1,
0.3234032, -0.5903407, 2.76339, 0, 0.1882353, 1, 1,
0.3269678, -0.5553587, 1.178015, 0, 0.1843137, 1, 1,
0.3282963, 0.7990363, -0.01141881, 0, 0.1764706, 1, 1,
0.3302391, -1.673875, 0.8306528, 0, 0.172549, 1, 1,
0.3310699, 0.8012537, 0.1542496, 0, 0.1647059, 1, 1,
0.3318708, 1.247364, 0.1243954, 0, 0.1607843, 1, 1,
0.3389126, -1.009057, 2.916437, 0, 0.1529412, 1, 1,
0.339555, -0.6898782, 2.904607, 0, 0.1490196, 1, 1,
0.3405468, -0.8779862, 2.936301, 0, 0.1411765, 1, 1,
0.3427008, 0.3275264, 1.412095, 0, 0.1372549, 1, 1,
0.3484776, -0.3180246, 1.511216, 0, 0.1294118, 1, 1,
0.3485277, 0.4714913, 1.531866, 0, 0.1254902, 1, 1,
0.3502526, -0.6937946, 0.5163512, 0, 0.1176471, 1, 1,
0.3504154, 0.4888314, -1.236032, 0, 0.1137255, 1, 1,
0.3526604, 1.465142, 0.9043192, 0, 0.1058824, 1, 1,
0.355897, 0.5680692, 0.6163637, 0, 0.09803922, 1, 1,
0.3637903, -1.641644, 3.016584, 0, 0.09411765, 1, 1,
0.3664225, 0.8018919, 0.6385326, 0, 0.08627451, 1, 1,
0.3699643, -1.022062, 1.594115, 0, 0.08235294, 1, 1,
0.3715197, -0.178743, 2.08587, 0, 0.07450981, 1, 1,
0.3730773, 0.1751422, 1.633598, 0, 0.07058824, 1, 1,
0.3764683, -0.1034913, 2.176244, 0, 0.0627451, 1, 1,
0.3790608, -0.2168055, 2.841129, 0, 0.05882353, 1, 1,
0.3863014, 1.351869, 0.4991744, 0, 0.05098039, 1, 1,
0.3874119, -1.942976, 2.869778, 0, 0.04705882, 1, 1,
0.3953972, 1.767353, -0.2859401, 0, 0.03921569, 1, 1,
0.4005319, 0.778618, 1.40646, 0, 0.03529412, 1, 1,
0.4005623, 0.9167229, 1.071338, 0, 0.02745098, 1, 1,
0.4013879, 1.357127, -0.3011457, 0, 0.02352941, 1, 1,
0.4211544, 2.170681, -0.9327903, 0, 0.01568628, 1, 1,
0.4248448, 1.525879, 1.108845, 0, 0.01176471, 1, 1,
0.426536, -0.5414891, 2.243893, 0, 0.003921569, 1, 1,
0.4301047, -0.7389105, 3.287764, 0.003921569, 0, 1, 1,
0.4338808, 0.8456859, 1.323925, 0.007843138, 0, 1, 1,
0.4365168, -0.6488094, 2.216859, 0.01568628, 0, 1, 1,
0.4380211, -2.158275, 2.324585, 0.01960784, 0, 1, 1,
0.4402191, 0.9182935, -0.2600909, 0.02745098, 0, 1, 1,
0.4410964, -1.379441, 3.235231, 0.03137255, 0, 1, 1,
0.4432165, 1.482167, 0.206389, 0.03921569, 0, 1, 1,
0.4432914, -0.3613127, 2.946518, 0.04313726, 0, 1, 1,
0.4460991, 0.3217345, 0.338801, 0.05098039, 0, 1, 1,
0.4471246, 1.216471, 1.104546, 0.05490196, 0, 1, 1,
0.4515848, -0.9787152, 2.380535, 0.0627451, 0, 1, 1,
0.4527241, -1.045985, 2.474204, 0.06666667, 0, 1, 1,
0.4560559, 0.3419642, 0.90864, 0.07450981, 0, 1, 1,
0.4583758, 0.8751323, 0.5463095, 0.07843138, 0, 1, 1,
0.459178, -1.115936, 3.43939, 0.08627451, 0, 1, 1,
0.4681003, -0.4767563, 3.576807, 0.09019608, 0, 1, 1,
0.4689093, 0.6647863, 0.926171, 0.09803922, 0, 1, 1,
0.4708257, 0.8525559, 0.184446, 0.1058824, 0, 1, 1,
0.4717253, 1.143973, 2.121936, 0.1098039, 0, 1, 1,
0.474216, 1.455844, 0.04260934, 0.1176471, 0, 1, 1,
0.4768839, -0.9896346, 2.479988, 0.1215686, 0, 1, 1,
0.4782481, 1.488781, -0.2059302, 0.1294118, 0, 1, 1,
0.4784988, -0.1318176, 2.944574, 0.1333333, 0, 1, 1,
0.4788705, 0.3585872, 2.363666, 0.1411765, 0, 1, 1,
0.4863481, 0.2393315, 2.335078, 0.145098, 0, 1, 1,
0.4883654, -0.5694515, 3.284591, 0.1529412, 0, 1, 1,
0.4994896, 0.5528477, 0.8323177, 0.1568628, 0, 1, 1,
0.5019158, 0.05342579, 1.658543, 0.1647059, 0, 1, 1,
0.5057778, -0.7226332, 2.053611, 0.1686275, 0, 1, 1,
0.5067536, 0.6531309, 1.159715, 0.1764706, 0, 1, 1,
0.5118812, 0.3066637, 1.472784, 0.1803922, 0, 1, 1,
0.5169129, -0.4412169, 4.129409, 0.1882353, 0, 1, 1,
0.5188887, -0.7510895, 2.17292, 0.1921569, 0, 1, 1,
0.526421, 0.02662572, 0.1882377, 0.2, 0, 1, 1,
0.5340144, -1.430683, -0.01725731, 0.2078431, 0, 1, 1,
0.5384908, 0.767532, 1.615955, 0.2117647, 0, 1, 1,
0.5388308, -0.3117143, 1.362517, 0.2196078, 0, 1, 1,
0.5392922, 1.360313, 1.473247, 0.2235294, 0, 1, 1,
0.5428894, 1.900874, -1.108877, 0.2313726, 0, 1, 1,
0.5522254, -1.883139, 2.989707, 0.2352941, 0, 1, 1,
0.5529737, 0.6875232, 0.8780956, 0.2431373, 0, 1, 1,
0.5532765, 0.3622806, 1.693795, 0.2470588, 0, 1, 1,
0.5536242, 0.2137975, 2.135695, 0.254902, 0, 1, 1,
0.5536917, -0.5665859, 2.63113, 0.2588235, 0, 1, 1,
0.5552948, -0.3481402, 1.23011, 0.2666667, 0, 1, 1,
0.5554432, -1.268216, 3.800532, 0.2705882, 0, 1, 1,
0.5584781, 0.2067901, 0.7078098, 0.2784314, 0, 1, 1,
0.5630644, -0.2791461, 1.171919, 0.282353, 0, 1, 1,
0.5631286, -0.8516947, 1.701887, 0.2901961, 0, 1, 1,
0.563444, -0.2987169, 2.893291, 0.2941177, 0, 1, 1,
0.5699305, 0.6362092, 1.483496, 0.3019608, 0, 1, 1,
0.5705247, 0.456562, 1.809261, 0.3098039, 0, 1, 1,
0.5727903, -0.371482, 3.754747, 0.3137255, 0, 1, 1,
0.5728955, -2.787946, 3.347569, 0.3215686, 0, 1, 1,
0.5738699, 0.8449919, 1.100704, 0.3254902, 0, 1, 1,
0.5751812, 0.4904103, -0.146667, 0.3333333, 0, 1, 1,
0.5754373, 0.5169054, 0.6333703, 0.3372549, 0, 1, 1,
0.5844578, 1.003848, 0.1276763, 0.345098, 0, 1, 1,
0.5854342, -0.1683498, 3.587973, 0.3490196, 0, 1, 1,
0.5973706, -0.008106546, 1.602869, 0.3568628, 0, 1, 1,
0.5989777, 2.031286, 1.346398, 0.3607843, 0, 1, 1,
0.6097339, -1.011584, 2.007046, 0.3686275, 0, 1, 1,
0.6129102, -0.8709952, 4.003155, 0.372549, 0, 1, 1,
0.6132973, -0.1365673, 0.4752731, 0.3803922, 0, 1, 1,
0.6166058, 0.2443265, -0.2446414, 0.3843137, 0, 1, 1,
0.6183494, 0.8266995, -0.133845, 0.3921569, 0, 1, 1,
0.6196049, -1.290307, 4.924979, 0.3960784, 0, 1, 1,
0.6215883, 0.455485, 1.182706, 0.4039216, 0, 1, 1,
0.6217237, 0.4604192, 1.285167, 0.4117647, 0, 1, 1,
0.6239685, 1.17286, 0.1902545, 0.4156863, 0, 1, 1,
0.6245794, 0.4432075, 1.833602, 0.4235294, 0, 1, 1,
0.6281085, 0.301351, 1.176528, 0.427451, 0, 1, 1,
0.6294541, 2.194901, -0.3077773, 0.4352941, 0, 1, 1,
0.630442, -0.1353874, 2.441978, 0.4392157, 0, 1, 1,
0.6340044, -0.3729882, 1.170439, 0.4470588, 0, 1, 1,
0.6364492, 0.8766384, -1.134946, 0.4509804, 0, 1, 1,
0.6400927, -0.3552998, 0.104383, 0.4588235, 0, 1, 1,
0.6449762, 0.3415165, 0.9063025, 0.4627451, 0, 1, 1,
0.6499031, -0.4174164, 2.589568, 0.4705882, 0, 1, 1,
0.6503934, -0.5663851, 2.80965, 0.4745098, 0, 1, 1,
0.6513141, -0.04768388, 1.25992, 0.4823529, 0, 1, 1,
0.6519323, 1.929458, -1.171059, 0.4862745, 0, 1, 1,
0.6574027, -1.342291, 2.512345, 0.4941176, 0, 1, 1,
0.6591423, -0.6326756, 2.075939, 0.5019608, 0, 1, 1,
0.6620291, 0.09393221, 1.536435, 0.5058824, 0, 1, 1,
0.6651605, -0.2808542, 1.703957, 0.5137255, 0, 1, 1,
0.6654804, 0.400439, 1.801772, 0.5176471, 0, 1, 1,
0.6665838, -1.264347, 3.275284, 0.5254902, 0, 1, 1,
0.6708312, 0.5831788, 1.321524, 0.5294118, 0, 1, 1,
0.6811128, -0.02398203, 2.233003, 0.5372549, 0, 1, 1,
0.6821287, -0.2743569, 1.077421, 0.5411765, 0, 1, 1,
0.6837853, -0.6843532, 1.924841, 0.5490196, 0, 1, 1,
0.6875522, 0.02835229, 1.092563, 0.5529412, 0, 1, 1,
0.6919476, -1.456327, 1.427405, 0.5607843, 0, 1, 1,
0.7000147, -0.5270234, 1.6815, 0.5647059, 0, 1, 1,
0.702887, 2.295211, -1.2102, 0.572549, 0, 1, 1,
0.7031834, -1.042595, 3.677251, 0.5764706, 0, 1, 1,
0.7120463, 1.547331, 1.169226, 0.5843138, 0, 1, 1,
0.7132615, 0.04942368, -0.02425505, 0.5882353, 0, 1, 1,
0.7169306, -0.4582306, 0.3677836, 0.5960785, 0, 1, 1,
0.7379048, -0.2346138, 2.317423, 0.6039216, 0, 1, 1,
0.7426749, 0.1258282, -0.710678, 0.6078432, 0, 1, 1,
0.7438059, 0.4074472, 2.011133, 0.6156863, 0, 1, 1,
0.7447034, -0.8364347, 2.564332, 0.6196079, 0, 1, 1,
0.7468651, 0.1639415, 1.774289, 0.627451, 0, 1, 1,
0.7473783, 1.970523, 1.142646, 0.6313726, 0, 1, 1,
0.7474638, -1.305544, 4.773427, 0.6392157, 0, 1, 1,
0.7500877, -0.5013548, 1.334733, 0.6431373, 0, 1, 1,
0.7515701, -0.003511047, 1.043382, 0.6509804, 0, 1, 1,
0.752629, 0.2757061, 3.482681, 0.654902, 0, 1, 1,
0.7539366, -0.2982765, 3.383115, 0.6627451, 0, 1, 1,
0.7551941, 0.1852095, 2.199632, 0.6666667, 0, 1, 1,
0.7558197, -0.694632, 0.6306174, 0.6745098, 0, 1, 1,
0.7624103, -1.205642, 2.025847, 0.6784314, 0, 1, 1,
0.766115, -0.2204857, 2.365375, 0.6862745, 0, 1, 1,
0.7666156, -2.082631, 2.146226, 0.6901961, 0, 1, 1,
0.7685712, 0.7173434, 0.3321447, 0.6980392, 0, 1, 1,
0.7689117, 1.218442, 0.5953232, 0.7058824, 0, 1, 1,
0.7717493, -0.4494024, 2.895864, 0.7098039, 0, 1, 1,
0.7739637, 0.7218786, -0.4885852, 0.7176471, 0, 1, 1,
0.7767962, -1.62702, 1.885386, 0.7215686, 0, 1, 1,
0.7772925, -0.2969955, 3.023221, 0.7294118, 0, 1, 1,
0.7787712, -0.494372, 3.571061, 0.7333333, 0, 1, 1,
0.8045003, -0.7602196, 2.070883, 0.7411765, 0, 1, 1,
0.8147293, -0.4003095, 0.7312281, 0.7450981, 0, 1, 1,
0.8147601, -1.144322, 1.132991, 0.7529412, 0, 1, 1,
0.8157786, 0.1857526, -0.2063307, 0.7568628, 0, 1, 1,
0.8210006, 0.7522231, 1.262397, 0.7647059, 0, 1, 1,
0.8337939, -0.4227085, 2.491162, 0.7686275, 0, 1, 1,
0.8354565, 2.140108, -0.4348603, 0.7764706, 0, 1, 1,
0.8412512, -0.3516454, 0.3106306, 0.7803922, 0, 1, 1,
0.8442112, 1.81638, 0.5868598, 0.7882353, 0, 1, 1,
0.8454645, 0.8478237, 3.987644, 0.7921569, 0, 1, 1,
0.850893, 0.8024759, -1.144367, 0.8, 0, 1, 1,
0.8552077, -0.6818267, 3.352778, 0.8078431, 0, 1, 1,
0.8576323, 0.2998761, 0.9750119, 0.8117647, 0, 1, 1,
0.8577695, -0.7277026, 3.243804, 0.8196079, 0, 1, 1,
0.8595837, -0.5100698, 3.812362, 0.8235294, 0, 1, 1,
0.8799101, -0.281724, 1.438316, 0.8313726, 0, 1, 1,
0.8801816, 0.2999685, 0.9627501, 0.8352941, 0, 1, 1,
0.8826846, -0.1347026, 3.513545, 0.8431373, 0, 1, 1,
0.8896372, 0.6783202, 1.213877, 0.8470588, 0, 1, 1,
0.8943728, 0.1856826, 0.1864213, 0.854902, 0, 1, 1,
0.895382, 0.6826152, 0.625678, 0.8588235, 0, 1, 1,
0.8959578, -0.3650096, 0.4764199, 0.8666667, 0, 1, 1,
0.8971722, 0.4898444, 1.470817, 0.8705882, 0, 1, 1,
0.9061, 0.282441, 3.214601, 0.8784314, 0, 1, 1,
0.9090765, 1.323841, 0.8773147, 0.8823529, 0, 1, 1,
0.9127793, 0.4658709, -0.4365101, 0.8901961, 0, 1, 1,
0.9128292, -0.2040493, 1.065703, 0.8941177, 0, 1, 1,
0.9259338, -0.6412467, 2.961977, 0.9019608, 0, 1, 1,
0.9287339, -0.8747309, 2.505349, 0.9098039, 0, 1, 1,
0.941451, 0.8677207, 0.3140195, 0.9137255, 0, 1, 1,
0.9436177, 0.2176295, 0.7734591, 0.9215686, 0, 1, 1,
0.9455608, -0.4322623, 2.096457, 0.9254902, 0, 1, 1,
0.9549325, 1.030304, 1.204264, 0.9333333, 0, 1, 1,
0.9550163, -0.5141025, 3.577408, 0.9372549, 0, 1, 1,
0.9557858, 1.493132, -0.3784528, 0.945098, 0, 1, 1,
0.956576, 1.770052, -0.2899765, 0.9490196, 0, 1, 1,
0.964587, -1.085982, 2.538789, 0.9568627, 0, 1, 1,
0.9649652, -2.457263, 3.35977, 0.9607843, 0, 1, 1,
0.9652575, -0.1316982, 0.9824762, 0.9686275, 0, 1, 1,
0.9688492, -0.7349957, 2.257553, 0.972549, 0, 1, 1,
0.971183, -0.01898772, -0.1179493, 0.9803922, 0, 1, 1,
0.9729074, 0.1437936, 1.086251, 0.9843137, 0, 1, 1,
0.9756818, 0.8402963, 2.041975, 0.9921569, 0, 1, 1,
0.9774666, -1.151803, 2.523527, 0.9960784, 0, 1, 1,
0.9801603, 0.3931375, -1.955611, 1, 0, 0.9960784, 1,
0.9815159, -0.7428637, 2.916715, 1, 0, 0.9882353, 1,
0.9830451, 0.170121, -0.1968079, 1, 0, 0.9843137, 1,
0.9969407, 1.276615, -0.3737766, 1, 0, 0.9764706, 1,
0.9976628, -0.7264443, 4.691879, 1, 0, 0.972549, 1,
0.997963, 0.3748126, 1.397975, 1, 0, 0.9647059, 1,
1.004132, -0.663044, 3.090676, 1, 0, 0.9607843, 1,
1.006871, 0.1895302, 0.9025247, 1, 0, 0.9529412, 1,
1.009892, 0.0241944, 2.233835, 1, 0, 0.9490196, 1,
1.010074, -1.149118, 3.512685, 1, 0, 0.9411765, 1,
1.010572, -1.011641, 2.439101, 1, 0, 0.9372549, 1,
1.019799, -0.3098112, 2.982977, 1, 0, 0.9294118, 1,
1.019922, -0.68575, 2.237142, 1, 0, 0.9254902, 1,
1.020075, 1.874433, -0.01848703, 1, 0, 0.9176471, 1,
1.02326, -0.6837807, 1.370425, 1, 0, 0.9137255, 1,
1.023298, -0.7709693, 1.369101, 1, 0, 0.9058824, 1,
1.023516, -1.201609, 4.68517, 1, 0, 0.9019608, 1,
1.029084, 0.8839983, 0.2815706, 1, 0, 0.8941177, 1,
1.032862, -0.1228093, 1.388747, 1, 0, 0.8862745, 1,
1.033539, 0.1663858, 1.702617, 1, 0, 0.8823529, 1,
1.033927, 0.5747234, 1.382605, 1, 0, 0.8745098, 1,
1.035469, 0.01500869, 1.541147, 1, 0, 0.8705882, 1,
1.036482, -0.8631654, 4.343219, 1, 0, 0.8627451, 1,
1.038028, 0.4301129, 2.04423, 1, 0, 0.8588235, 1,
1.043595, 0.01937126, 1.242211, 1, 0, 0.8509804, 1,
1.045133, -0.4267887, 1.179607, 1, 0, 0.8470588, 1,
1.046927, 2.010523, 1.329591, 1, 0, 0.8392157, 1,
1.049477, 0.726711, 1.615083, 1, 0, 0.8352941, 1,
1.053781, 1.234998, 0.8736631, 1, 0, 0.827451, 1,
1.054975, 1.028543, 0.9496293, 1, 0, 0.8235294, 1,
1.055874, -0.7345545, 1.04899, 1, 0, 0.8156863, 1,
1.072438, -0.3099971, 3.24646, 1, 0, 0.8117647, 1,
1.074294, 0.8813429, -0.02755529, 1, 0, 0.8039216, 1,
1.079832, -0.4365445, 0.9761814, 1, 0, 0.7960784, 1,
1.085764, 0.4898707, 1.550817, 1, 0, 0.7921569, 1,
1.088194, 1.302005, 0.8970365, 1, 0, 0.7843137, 1,
1.091375, -0.7639496, 1.758532, 1, 0, 0.7803922, 1,
1.092119, 0.0306531, 2.27595, 1, 0, 0.772549, 1,
1.093472, 0.2637056, 1.413613, 1, 0, 0.7686275, 1,
1.096302, -1.118655, 1.683051, 1, 0, 0.7607843, 1,
1.101032, -0.2168666, 1.543156, 1, 0, 0.7568628, 1,
1.110506, 1.705854, -0.2811292, 1, 0, 0.7490196, 1,
1.114056, -2.819026, 2.704852, 1, 0, 0.7450981, 1,
1.116757, 0.7022921, 0.6608405, 1, 0, 0.7372549, 1,
1.119528, -0.1283104, 0.2151861, 1, 0, 0.7333333, 1,
1.124688, 0.566874, 2.372058, 1, 0, 0.7254902, 1,
1.12733, -1.265929, 2.651138, 1, 0, 0.7215686, 1,
1.127533, -0.2774112, 2.307751, 1, 0, 0.7137255, 1,
1.128094, -1.896786, 3.235233, 1, 0, 0.7098039, 1,
1.128362, -0.01397535, 0.958364, 1, 0, 0.7019608, 1,
1.139424, -0.07547823, 2.022262, 1, 0, 0.6941177, 1,
1.140388, 0.2488434, 1.612664, 1, 0, 0.6901961, 1,
1.148506, 1.070579, -0.9459675, 1, 0, 0.682353, 1,
1.150534, 0.6225769, 0.5509526, 1, 0, 0.6784314, 1,
1.154462, 1.471146, 0.5312157, 1, 0, 0.6705883, 1,
1.154579, 0.5998209, 0.6295137, 1, 0, 0.6666667, 1,
1.160374, -1.474393, 2.653525, 1, 0, 0.6588235, 1,
1.161445, -0.4546472, 3.990761, 1, 0, 0.654902, 1,
1.167377, -0.2416916, -0.1984059, 1, 0, 0.6470588, 1,
1.179202, -0.5820854, 1.946049, 1, 0, 0.6431373, 1,
1.184891, 0.1461247, 1.91669, 1, 0, 0.6352941, 1,
1.202473, 0.4897437, 0.6325822, 1, 0, 0.6313726, 1,
1.204713, 0.0238286, 0.6302684, 1, 0, 0.6235294, 1,
1.217648, -0.1137267, 1.46102, 1, 0, 0.6196079, 1,
1.221698, -1.133691, 2.454859, 1, 0, 0.6117647, 1,
1.222027, 1.919408, 0.06433388, 1, 0, 0.6078432, 1,
1.252918, 2.017142, -0.8093625, 1, 0, 0.6, 1,
1.253017, -0.3656356, 2.136173, 1, 0, 0.5921569, 1,
1.258888, -1.878565, 3.831237, 1, 0, 0.5882353, 1,
1.261797, -0.5502453, 1.598605, 1, 0, 0.5803922, 1,
1.262698, 0.5703004, 2.829815, 1, 0, 0.5764706, 1,
1.265162, -0.4218673, 3.021074, 1, 0, 0.5686275, 1,
1.265348, 1.198415, 1.327836, 1, 0, 0.5647059, 1,
1.282096, -0.601062, 3.009061, 1, 0, 0.5568628, 1,
1.284202, -0.8091664, 2.636659, 1, 0, 0.5529412, 1,
1.312063, -0.4125201, 0.6895692, 1, 0, 0.5450981, 1,
1.326586, 0.613188, 2.533035, 1, 0, 0.5411765, 1,
1.333943, -0.4794496, 2.230903, 1, 0, 0.5333334, 1,
1.334638, -1.496342, 3.340041, 1, 0, 0.5294118, 1,
1.346725, -1.242776, 2.753756, 1, 0, 0.5215687, 1,
1.353484, -1.38595, 1.512637, 1, 0, 0.5176471, 1,
1.361979, 0.7543521, 0.6108851, 1, 0, 0.509804, 1,
1.372768, 1.092387, 0.9586123, 1, 0, 0.5058824, 1,
1.374872, 1.985587, 0.8919121, 1, 0, 0.4980392, 1,
1.382095, 1.16046, 1.312054, 1, 0, 0.4901961, 1,
1.384121, 1.653968, 0.8039747, 1, 0, 0.4862745, 1,
1.387217, 0.9185776, 0.4664016, 1, 0, 0.4784314, 1,
1.392032, 0.5926048, 0.5668412, 1, 0, 0.4745098, 1,
1.400565, -1.234553, 1.307011, 1, 0, 0.4666667, 1,
1.401814, 1.06158, 1.511175, 1, 0, 0.4627451, 1,
1.407708, 0.1386706, 2.022608, 1, 0, 0.454902, 1,
1.412373, 0.1056549, 1.129638, 1, 0, 0.4509804, 1,
1.418216, 0.702747, 0.1068117, 1, 0, 0.4431373, 1,
1.419736, 0.5808371, -0.341474, 1, 0, 0.4392157, 1,
1.420569, -1.946123, 2.646411, 1, 0, 0.4313726, 1,
1.431019, 0.3274099, -1.187723, 1, 0, 0.427451, 1,
1.434704, -0.329486, 1.684656, 1, 0, 0.4196078, 1,
1.441297, -0.9363006, 1.280573, 1, 0, 0.4156863, 1,
1.442044, -1.383189, 2.696855, 1, 0, 0.4078431, 1,
1.456941, 0.1797612, 1.11877, 1, 0, 0.4039216, 1,
1.458422, 0.8068237, 0.885779, 1, 0, 0.3960784, 1,
1.465079, -0.4709507, 1.96699, 1, 0, 0.3882353, 1,
1.465665, 1.451481, 0.1985042, 1, 0, 0.3843137, 1,
1.468975, 0.09747279, 3.394543, 1, 0, 0.3764706, 1,
1.473013, -1.350857, 2.771083, 1, 0, 0.372549, 1,
1.485292, 2.089429, -0.6102625, 1, 0, 0.3647059, 1,
1.499589, 0.4661874, 1.085551, 1, 0, 0.3607843, 1,
1.502734, -0.82749, 1.367683, 1, 0, 0.3529412, 1,
1.522021, 0.5639561, 1.478447, 1, 0, 0.3490196, 1,
1.525164, -0.1427988, 0.9332311, 1, 0, 0.3411765, 1,
1.530607, 0.8610311, -0.1147474, 1, 0, 0.3372549, 1,
1.535819, -0.9812232, 3.246581, 1, 0, 0.3294118, 1,
1.551054, -1.252938, 1.713964, 1, 0, 0.3254902, 1,
1.55468, -0.4634148, 2.202371, 1, 0, 0.3176471, 1,
1.560554, -1.606998, 2.057833, 1, 0, 0.3137255, 1,
1.561912, 0.635487, 1.452601, 1, 0, 0.3058824, 1,
1.593317, -0.960905, 1.260476, 1, 0, 0.2980392, 1,
1.598068, -1.009861, 2.621238, 1, 0, 0.2941177, 1,
1.606196, 1.828782, 0.2117809, 1, 0, 0.2862745, 1,
1.612048, 0.4853942, 0.884367, 1, 0, 0.282353, 1,
1.613117, 2.486338, -0.9559271, 1, 0, 0.2745098, 1,
1.637558, -0.2113165, 0.3487509, 1, 0, 0.2705882, 1,
1.648317, -0.6278663, 0.9715303, 1, 0, 0.2627451, 1,
1.669521, -1.66468, 2.173573, 1, 0, 0.2588235, 1,
1.701354, -0.4354181, 2.589494, 1, 0, 0.2509804, 1,
1.701438, -1.531692, 1.681033, 1, 0, 0.2470588, 1,
1.733108, -0.09587543, 1.018467, 1, 0, 0.2392157, 1,
1.735109, -0.08543689, 1.035106, 1, 0, 0.2352941, 1,
1.767789, 1.809195, 1.322187, 1, 0, 0.227451, 1,
1.775003, 0.5713627, 0.9053175, 1, 0, 0.2235294, 1,
1.790782, 0.6809994, 1.697243, 1, 0, 0.2156863, 1,
1.792015, 1.539787, 2.430978, 1, 0, 0.2117647, 1,
1.837769, -1.535817, 1.584546, 1, 0, 0.2039216, 1,
1.864539, 0.4928982, 2.634942, 1, 0, 0.1960784, 1,
1.894469, 1.217622, 1.96682, 1, 0, 0.1921569, 1,
1.901234, 1.279376, 1.167302, 1, 0, 0.1843137, 1,
1.912633, 1.665929, 0.9247579, 1, 0, 0.1803922, 1,
1.919645, 0.3078798, -0.2370382, 1, 0, 0.172549, 1,
1.928995, 1.400035, 1.360446, 1, 0, 0.1686275, 1,
1.934629, 0.9101468, -0.842669, 1, 0, 0.1607843, 1,
1.978287, -1.408881, 2.764151, 1, 0, 0.1568628, 1,
1.983973, 1.190084, 0.4436176, 1, 0, 0.1490196, 1,
1.989892, 1.104579, 0.7759755, 1, 0, 0.145098, 1,
1.999094, -0.106342, 0.08781438, 1, 0, 0.1372549, 1,
2.039846, -1.109248, 2.601364, 1, 0, 0.1333333, 1,
2.040467, 1.082547, 0.5744914, 1, 0, 0.1254902, 1,
2.041842, -1.628953, 2.911729, 1, 0, 0.1215686, 1,
2.047111, -0.510583, 1.180689, 1, 0, 0.1137255, 1,
2.077346, 0.9303149, 2.005649, 1, 0, 0.1098039, 1,
2.110496, -0.4929583, 0.01586421, 1, 0, 0.1019608, 1,
2.11588, 1.335075, 0.9556381, 1, 0, 0.09411765, 1,
2.121362, 1.285571, 2.967556, 1, 0, 0.09019608, 1,
2.124108, 1.010638, 0.959962, 1, 0, 0.08235294, 1,
2.191908, 0.1990916, 2.143263, 1, 0, 0.07843138, 1,
2.201329, -0.6342645, 2.08929, 1, 0, 0.07058824, 1,
2.34417, 2.529514, 0.5990931, 1, 0, 0.06666667, 1,
2.4439, -0.5492646, 3.324415, 1, 0, 0.05882353, 1,
2.455797, -0.6417255, 2.632236, 1, 0, 0.05490196, 1,
2.473497, -0.4916874, 4.002062, 1, 0, 0.04705882, 1,
2.582336, 0.7237136, 1.133907, 1, 0, 0.04313726, 1,
2.582786, -0.8932469, 2.288013, 1, 0, 0.03529412, 1,
2.59317, 0.6303635, 1.235202, 1, 0, 0.03137255, 1,
2.621279, 1.160055, 2.993301, 1, 0, 0.02352941, 1,
2.888123, 0.4047675, 0.2357521, 1, 0, 0.01960784, 1,
3.131595, 0.01573989, 1.632205, 1, 0, 0.01176471, 1,
3.148746, -0.293764, 2.394021, 1, 0, 0.007843138, 1
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
0.06362116, -4.521273, -6.830244, 0, -0.5, 0.5, 0.5,
0.06362116, -4.521273, -6.830244, 1, -0.5, 0.5, 0.5,
0.06362116, -4.521273, -6.830244, 1, 1.5, 0.5, 0.5,
0.06362116, -4.521273, -6.830244, 0, 1.5, 0.5, 0.5
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
-4.067362, -0.01578367, -6.830244, 0, -0.5, 0.5, 0.5,
-4.067362, -0.01578367, -6.830244, 1, -0.5, 0.5, 0.5,
-4.067362, -0.01578367, -6.830244, 1, 1.5, 0.5, 0.5,
-4.067362, -0.01578367, -6.830244, 0, 1.5, 0.5, 0.5
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
-4.067362, -4.521273, -0.1007683, 0, -0.5, 0.5, 0.5,
-4.067362, -4.521273, -0.1007683, 1, -0.5, 0.5, 0.5,
-4.067362, -4.521273, -0.1007683, 1, 1.5, 0.5, 0.5,
-4.067362, -4.521273, -0.1007683, 0, 1.5, 0.5, 0.5
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
-3, -3.481545, -5.277288,
3, -3.481545, -5.277288,
-3, -3.481545, -5.277288,
-3, -3.654833, -5.536114,
-2, -3.481545, -5.277288,
-2, -3.654833, -5.536114,
-1, -3.481545, -5.277288,
-1, -3.654833, -5.536114,
0, -3.481545, -5.277288,
0, -3.654833, -5.536114,
1, -3.481545, -5.277288,
1, -3.654833, -5.536114,
2, -3.481545, -5.277288,
2, -3.654833, -5.536114,
3, -3.481545, -5.277288,
3, -3.654833, -5.536114
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
-3, -4.001409, -6.053766, 0, -0.5, 0.5, 0.5,
-3, -4.001409, -6.053766, 1, -0.5, 0.5, 0.5,
-3, -4.001409, -6.053766, 1, 1.5, 0.5, 0.5,
-3, -4.001409, -6.053766, 0, 1.5, 0.5, 0.5,
-2, -4.001409, -6.053766, 0, -0.5, 0.5, 0.5,
-2, -4.001409, -6.053766, 1, -0.5, 0.5, 0.5,
-2, -4.001409, -6.053766, 1, 1.5, 0.5, 0.5,
-2, -4.001409, -6.053766, 0, 1.5, 0.5, 0.5,
-1, -4.001409, -6.053766, 0, -0.5, 0.5, 0.5,
-1, -4.001409, -6.053766, 1, -0.5, 0.5, 0.5,
-1, -4.001409, -6.053766, 1, 1.5, 0.5, 0.5,
-1, -4.001409, -6.053766, 0, 1.5, 0.5, 0.5,
0, -4.001409, -6.053766, 0, -0.5, 0.5, 0.5,
0, -4.001409, -6.053766, 1, -0.5, 0.5, 0.5,
0, -4.001409, -6.053766, 1, 1.5, 0.5, 0.5,
0, -4.001409, -6.053766, 0, 1.5, 0.5, 0.5,
1, -4.001409, -6.053766, 0, -0.5, 0.5, 0.5,
1, -4.001409, -6.053766, 1, -0.5, 0.5, 0.5,
1, -4.001409, -6.053766, 1, 1.5, 0.5, 0.5,
1, -4.001409, -6.053766, 0, 1.5, 0.5, 0.5,
2, -4.001409, -6.053766, 0, -0.5, 0.5, 0.5,
2, -4.001409, -6.053766, 1, -0.5, 0.5, 0.5,
2, -4.001409, -6.053766, 1, 1.5, 0.5, 0.5,
2, -4.001409, -6.053766, 0, 1.5, 0.5, 0.5,
3, -4.001409, -6.053766, 0, -0.5, 0.5, 0.5,
3, -4.001409, -6.053766, 1, -0.5, 0.5, 0.5,
3, -4.001409, -6.053766, 1, 1.5, 0.5, 0.5,
3, -4.001409, -6.053766, 0, 1.5, 0.5, 0.5
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
-3.114058, -3, -5.277288,
-3.114058, 3, -5.277288,
-3.114058, -3, -5.277288,
-3.272942, -3, -5.536114,
-3.114058, -2, -5.277288,
-3.272942, -2, -5.536114,
-3.114058, -1, -5.277288,
-3.272942, -1, -5.536114,
-3.114058, 0, -5.277288,
-3.272942, 0, -5.536114,
-3.114058, 1, -5.277288,
-3.272942, 1, -5.536114,
-3.114058, 2, -5.277288,
-3.272942, 2, -5.536114,
-3.114058, 3, -5.277288,
-3.272942, 3, -5.536114
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
-3.59071, -3, -6.053766, 0, -0.5, 0.5, 0.5,
-3.59071, -3, -6.053766, 1, -0.5, 0.5, 0.5,
-3.59071, -3, -6.053766, 1, 1.5, 0.5, 0.5,
-3.59071, -3, -6.053766, 0, 1.5, 0.5, 0.5,
-3.59071, -2, -6.053766, 0, -0.5, 0.5, 0.5,
-3.59071, -2, -6.053766, 1, -0.5, 0.5, 0.5,
-3.59071, -2, -6.053766, 1, 1.5, 0.5, 0.5,
-3.59071, -2, -6.053766, 0, 1.5, 0.5, 0.5,
-3.59071, -1, -6.053766, 0, -0.5, 0.5, 0.5,
-3.59071, -1, -6.053766, 1, -0.5, 0.5, 0.5,
-3.59071, -1, -6.053766, 1, 1.5, 0.5, 0.5,
-3.59071, -1, -6.053766, 0, 1.5, 0.5, 0.5,
-3.59071, 0, -6.053766, 0, -0.5, 0.5, 0.5,
-3.59071, 0, -6.053766, 1, -0.5, 0.5, 0.5,
-3.59071, 0, -6.053766, 1, 1.5, 0.5, 0.5,
-3.59071, 0, -6.053766, 0, 1.5, 0.5, 0.5,
-3.59071, 1, -6.053766, 0, -0.5, 0.5, 0.5,
-3.59071, 1, -6.053766, 1, -0.5, 0.5, 0.5,
-3.59071, 1, -6.053766, 1, 1.5, 0.5, 0.5,
-3.59071, 1, -6.053766, 0, 1.5, 0.5, 0.5,
-3.59071, 2, -6.053766, 0, -0.5, 0.5, 0.5,
-3.59071, 2, -6.053766, 1, -0.5, 0.5, 0.5,
-3.59071, 2, -6.053766, 1, 1.5, 0.5, 0.5,
-3.59071, 2, -6.053766, 0, 1.5, 0.5, 0.5,
-3.59071, 3, -6.053766, 0, -0.5, 0.5, 0.5,
-3.59071, 3, -6.053766, 1, -0.5, 0.5, 0.5,
-3.59071, 3, -6.053766, 1, 1.5, 0.5, 0.5,
-3.59071, 3, -6.053766, 0, 1.5, 0.5, 0.5
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
-3.114058, -3.481545, -4,
-3.114058, -3.481545, 4,
-3.114058, -3.481545, -4,
-3.272942, -3.654833, -4,
-3.114058, -3.481545, -2,
-3.272942, -3.654833, -2,
-3.114058, -3.481545, 0,
-3.272942, -3.654833, 0,
-3.114058, -3.481545, 2,
-3.272942, -3.654833, 2,
-3.114058, -3.481545, 4,
-3.272942, -3.654833, 4
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
-3.59071, -4.001409, -4, 0, -0.5, 0.5, 0.5,
-3.59071, -4.001409, -4, 1, -0.5, 0.5, 0.5,
-3.59071, -4.001409, -4, 1, 1.5, 0.5, 0.5,
-3.59071, -4.001409, -4, 0, 1.5, 0.5, 0.5,
-3.59071, -4.001409, -2, 0, -0.5, 0.5, 0.5,
-3.59071, -4.001409, -2, 1, -0.5, 0.5, 0.5,
-3.59071, -4.001409, -2, 1, 1.5, 0.5, 0.5,
-3.59071, -4.001409, -2, 0, 1.5, 0.5, 0.5,
-3.59071, -4.001409, 0, 0, -0.5, 0.5, 0.5,
-3.59071, -4.001409, 0, 1, -0.5, 0.5, 0.5,
-3.59071, -4.001409, 0, 1, 1.5, 0.5, 0.5,
-3.59071, -4.001409, 0, 0, 1.5, 0.5, 0.5,
-3.59071, -4.001409, 2, 0, -0.5, 0.5, 0.5,
-3.59071, -4.001409, 2, 1, -0.5, 0.5, 0.5,
-3.59071, -4.001409, 2, 1, 1.5, 0.5, 0.5,
-3.59071, -4.001409, 2, 0, 1.5, 0.5, 0.5,
-3.59071, -4.001409, 4, 0, -0.5, 0.5, 0.5,
-3.59071, -4.001409, 4, 1, -0.5, 0.5, 0.5,
-3.59071, -4.001409, 4, 1, 1.5, 0.5, 0.5,
-3.59071, -4.001409, 4, 0, 1.5, 0.5, 0.5
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
-3.114058, -3.481545, -5.277288,
-3.114058, 3.449978, -5.277288,
-3.114058, -3.481545, 5.075751,
-3.114058, 3.449978, 5.075751,
-3.114058, -3.481545, -5.277288,
-3.114058, -3.481545, 5.075751,
-3.114058, 3.449978, -5.277288,
-3.114058, 3.449978, 5.075751,
-3.114058, -3.481545, -5.277288,
3.2413, -3.481545, -5.277288,
-3.114058, -3.481545, 5.075751,
3.2413, -3.481545, 5.075751,
-3.114058, 3.449978, -5.277288,
3.2413, 3.449978, -5.277288,
-3.114058, 3.449978, 5.075751,
3.2413, 3.449978, 5.075751,
3.2413, -3.481545, -5.277288,
3.2413, 3.449978, -5.277288,
3.2413, -3.481545, 5.075751,
3.2413, 3.449978, 5.075751,
3.2413, -3.481545, -5.277288,
3.2413, -3.481545, 5.075751,
3.2413, 3.449978, -5.277288,
3.2413, 3.449978, 5.075751
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
var radius = 7.468516;
var distance = 33.22827;
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
mvMatrix.translate( -0.06362116, 0.01578367, 0.1007683 );
mvMatrix.scale( 1.270598, 1.164983, 0.7799745 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.22827);
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
levamisole<-read.table("levamisole.xyz")
```

```
## Error in read.table("levamisole.xyz"): no lines available in input
```

```r
x<-levamisole$V2
```

```
## Error in eval(expr, envir, enclos): object 'levamisole' not found
```

```r
y<-levamisole$V3
```

```
## Error in eval(expr, envir, enclos): object 'levamisole' not found
```

```r
z<-levamisole$V4
```

```
## Error in eval(expr, envir, enclos): object 'levamisole' not found
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
-3.021504, -0.6610547, -3.291441, 0, 0, 1, 1, 1,
-2.84292, 1.470924, -0.7744765, 1, 0, 0, 1, 1,
-2.683065, 1.363682, 0.4927074, 1, 0, 0, 1, 1,
-2.633224, -0.6597648, -1.584557, 1, 0, 0, 1, 1,
-2.611548, 1.465075, 1.969671, 1, 0, 0, 1, 1,
-2.533995, -0.7514841, -2.353467, 1, 0, 0, 1, 1,
-2.522763, -0.1390319, -2.361105, 0, 0, 0, 1, 1,
-2.47933, 1.114119, -0.3057926, 0, 0, 0, 1, 1,
-2.386457, -1.0877, -1.728767, 0, 0, 0, 1, 1,
-2.341847, 0.15185, -1.393982, 0, 0, 0, 1, 1,
-2.331605, -1.669191, -3.08939, 0, 0, 0, 1, 1,
-2.299081, 0.709834, -1.740091, 0, 0, 0, 1, 1,
-2.25223, 1.360181, -2.908523, 0, 0, 0, 1, 1,
-2.231376, 0.3148874, -2.908452, 1, 1, 1, 1, 1,
-2.205749, -0.6522943, 1.091904, 1, 1, 1, 1, 1,
-2.181951, -1.554894, -4.176224, 1, 1, 1, 1, 1,
-2.156384, -0.1224282, -1.351149, 1, 1, 1, 1, 1,
-2.114999, 1.318259, -1.25788, 1, 1, 1, 1, 1,
-2.11036, 0.2953131, -1.258839, 1, 1, 1, 1, 1,
-2.108539, 1.314195, 1.647871, 1, 1, 1, 1, 1,
-2.084969, 0.5954918, -3.95527, 1, 1, 1, 1, 1,
-2.067274, 0.3310064, -2.461383, 1, 1, 1, 1, 1,
-2.039932, 1.096746, -1.400835, 1, 1, 1, 1, 1,
-2.031528, -1.956714, -1.587002, 1, 1, 1, 1, 1,
-2.028018, -0.4023744, -0.1788818, 1, 1, 1, 1, 1,
-1.966495, 0.6275412, -1.389437, 1, 1, 1, 1, 1,
-1.952852, -1.099729, -1.284073, 1, 1, 1, 1, 1,
-1.928129, 0.8887731, -1.431559, 1, 1, 1, 1, 1,
-1.920119, 1.569196, -0.498784, 0, 0, 1, 1, 1,
-1.917252, 2.102548, -1.02681, 1, 0, 0, 1, 1,
-1.892194, -0.7832868, -1.170845, 1, 0, 0, 1, 1,
-1.891142, -0.3710776, 0.3280118, 1, 0, 0, 1, 1,
-1.874251, -1.662584, -2.559179, 1, 0, 0, 1, 1,
-1.87129, -3.212101, -3.044415, 1, 0, 0, 1, 1,
-1.803858, -0.9236008, -3.297069, 0, 0, 0, 1, 1,
-1.793487, -0.7328573, -1.019025, 0, 0, 0, 1, 1,
-1.786242, -0.635979, -2.007437, 0, 0, 0, 1, 1,
-1.785872, 0.8810604, -1.56417, 0, 0, 0, 1, 1,
-1.7756, -1.10946, -2.36855, 0, 0, 0, 1, 1,
-1.768373, 0.865729, -1.180344, 0, 0, 0, 1, 1,
-1.752873, -2.131177, -3.602171, 0, 0, 0, 1, 1,
-1.750545, -0.07539701, -1.864856, 1, 1, 1, 1, 1,
-1.732191, -1.018991, -1.212661, 1, 1, 1, 1, 1,
-1.720799, -0.4951963, -1.771136, 1, 1, 1, 1, 1,
-1.719115, -0.1285053, -2.795396, 1, 1, 1, 1, 1,
-1.713707, 0.3866119, -2.835092, 1, 1, 1, 1, 1,
-1.710065, -0.2963609, -5.126515, 1, 1, 1, 1, 1,
-1.70755, 0.5327212, -0.939124, 1, 1, 1, 1, 1,
-1.696238, 0.5071646, -1.925701, 1, 1, 1, 1, 1,
-1.689671, 0.3824719, -1.54049, 1, 1, 1, 1, 1,
-1.688675, -0.7908143, -2.094188, 1, 1, 1, 1, 1,
-1.676934, -0.3282909, -2.99262, 1, 1, 1, 1, 1,
-1.675545, -1.100608, -3.277162, 1, 1, 1, 1, 1,
-1.669729, -0.6618598, -1.562908, 1, 1, 1, 1, 1,
-1.664573, 0.2718358, -0.9076258, 1, 1, 1, 1, 1,
-1.620594, -0.7155028, -4.581332, 1, 1, 1, 1, 1,
-1.618381, -0.09553576, -2.527802, 0, 0, 1, 1, 1,
-1.614372, 0.4491071, -1.468905, 1, 0, 0, 1, 1,
-1.60717, -1.532564, -3.154179, 1, 0, 0, 1, 1,
-1.607133, 0.3951155, -1.991663, 1, 0, 0, 1, 1,
-1.579032, 1.827435, -2.135473, 1, 0, 0, 1, 1,
-1.576322, 0.2124514, -0.9625194, 1, 0, 0, 1, 1,
-1.567253, -0.2314716, -1.73795, 0, 0, 0, 1, 1,
-1.561248, -1.476497, -1.797067, 0, 0, 0, 1, 1,
-1.558776, -0.7757181, 0.9931287, 0, 0, 0, 1, 1,
-1.556177, -1.135516, -3.214324, 0, 0, 0, 1, 1,
-1.554775, 0.7791338, -1.398332, 0, 0, 0, 1, 1,
-1.55473, -0.3158849, -0.09702572, 0, 0, 0, 1, 1,
-1.553968, -1.301433, -2.186825, 0, 0, 0, 1, 1,
-1.526358, -0.3487377, -0.4598066, 1, 1, 1, 1, 1,
-1.521261, -1.07233, -1.627187, 1, 1, 1, 1, 1,
-1.512951, -0.8369514, -1.90749, 1, 1, 1, 1, 1,
-1.499021, -1.893349, -4.105909, 1, 1, 1, 1, 1,
-1.498362, -0.4123544, -3.084948, 1, 1, 1, 1, 1,
-1.498079, 1.159685, -1.502149, 1, 1, 1, 1, 1,
-1.495346, 1.209324, -2.325089, 1, 1, 1, 1, 1,
-1.49232, -0.3188577, -1.607413, 1, 1, 1, 1, 1,
-1.492103, -0.7975679, -2.34138, 1, 1, 1, 1, 1,
-1.478093, -0.9163697, -1.635138, 1, 1, 1, 1, 1,
-1.47334, 0.4093121, 0.5503689, 1, 1, 1, 1, 1,
-1.462408, -1.351247, -2.723895, 1, 1, 1, 1, 1,
-1.462307, -0.3404624, -1.60712, 1, 1, 1, 1, 1,
-1.457587, -0.2875514, -3.365691, 1, 1, 1, 1, 1,
-1.455376, 1.356089, -0.7372542, 1, 1, 1, 1, 1,
-1.454563, -0.3528057, -1.168299, 0, 0, 1, 1, 1,
-1.433701, -0.1609422, -3.042464, 1, 0, 0, 1, 1,
-1.431671, 0.06022207, -0.592503, 1, 0, 0, 1, 1,
-1.421781, -1.447391, -3.669681, 1, 0, 0, 1, 1,
-1.414271, -1.584772, -2.169271, 1, 0, 0, 1, 1,
-1.394032, -1.188349, -4.805483, 1, 0, 0, 1, 1,
-1.391853, -0.3648414, -2.96159, 0, 0, 0, 1, 1,
-1.388672, 0.4374287, -1.531565, 0, 0, 0, 1, 1,
-1.386026, -0.2573698, -2.582987, 0, 0, 0, 1, 1,
-1.364701, 0.7245882, -2.537865, 0, 0, 0, 1, 1,
-1.361348, -0.3776148, -1.85167, 0, 0, 0, 1, 1,
-1.346479, 0.3878641, -1.022679, 0, 0, 0, 1, 1,
-1.34528, -1.475136, -2.043865, 0, 0, 0, 1, 1,
-1.340153, 0.1441415, -1.729192, 1, 1, 1, 1, 1,
-1.339894, -0.9024902, -1.117405, 1, 1, 1, 1, 1,
-1.337578, -0.1638549, -0.4414386, 1, 1, 1, 1, 1,
-1.32765, 0.2530192, -1.174189, 1, 1, 1, 1, 1,
-1.325624, 1.845456, -2.259807, 1, 1, 1, 1, 1,
-1.320714, 0.9190071, -2.031983, 1, 1, 1, 1, 1,
-1.309726, 1.26364, -0.05432015, 1, 1, 1, 1, 1,
-1.303502, 1.186868, -1.291686, 1, 1, 1, 1, 1,
-1.302937, 0.9702972, -1.828505, 1, 1, 1, 1, 1,
-1.297633, -0.352192, -0.795536, 1, 1, 1, 1, 1,
-1.292782, -0.4365578, -3.110149, 1, 1, 1, 1, 1,
-1.290016, -1.832535, -3.497815, 1, 1, 1, 1, 1,
-1.278378, -1.361631, -3.228196, 1, 1, 1, 1, 1,
-1.277651, 2.205648, -1.216652, 1, 1, 1, 1, 1,
-1.27274, 0.296066, -1.189327, 1, 1, 1, 1, 1,
-1.26908, 0.9949517, -0.7499823, 0, 0, 1, 1, 1,
-1.267684, -0.08469157, -1.332995, 1, 0, 0, 1, 1,
-1.253877, -0.334851, -3.010084, 1, 0, 0, 1, 1,
-1.253309, -0.0463745, -2.035218, 1, 0, 0, 1, 1,
-1.252764, -0.5956114, -1.977546, 1, 0, 0, 1, 1,
-1.248132, -0.2553859, -1.058458, 1, 0, 0, 1, 1,
-1.243746, 0.8630732, -0.3622615, 0, 0, 0, 1, 1,
-1.237527, 1.503902, -1.57011, 0, 0, 0, 1, 1,
-1.234353, 1.218788, -2.300725, 0, 0, 0, 1, 1,
-1.233713, -1.76932, -3.306514, 0, 0, 0, 1, 1,
-1.232709, 0.08077653, -2.233385, 0, 0, 0, 1, 1,
-1.222246, -3.3806, -4.793235, 0, 0, 0, 1, 1,
-1.22148, -1.86198, -3.903024, 0, 0, 0, 1, 1,
-1.218972, -1.737941, -2.165941, 1, 1, 1, 1, 1,
-1.216741, 0.08022121, -1.428354, 1, 1, 1, 1, 1,
-1.211483, 1.018631, -2.255509, 1, 1, 1, 1, 1,
-1.200764, 0.477957, -1.664689, 1, 1, 1, 1, 1,
-1.199208, 0.6616424, -1.040887, 1, 1, 1, 1, 1,
-1.184117, -0.7239006, -3.282779, 1, 1, 1, 1, 1,
-1.183439, -0.6617184, -3.694098, 1, 1, 1, 1, 1,
-1.182665, 1.954415, 1.10417, 1, 1, 1, 1, 1,
-1.182312, -0.01906396, -3.263932, 1, 1, 1, 1, 1,
-1.161507, 1.118, 0.1841649, 1, 1, 1, 1, 1,
-1.161135, -0.7601736, -2.334315, 1, 1, 1, 1, 1,
-1.159372, -0.2764225, -1.948027, 1, 1, 1, 1, 1,
-1.157032, -0.02075695, -2.199826, 1, 1, 1, 1, 1,
-1.155378, -0.5256295, -1.60933, 1, 1, 1, 1, 1,
-1.155323, 0.3985955, -0.7770084, 1, 1, 1, 1, 1,
-1.153593, 0.6885983, -0.8814757, 0, 0, 1, 1, 1,
-1.14038, -0.7727262, -3.350532, 1, 0, 0, 1, 1,
-1.13975, -1.185102, -1.777586, 1, 0, 0, 1, 1,
-1.134877, -0.6408517, -1.910156, 1, 0, 0, 1, 1,
-1.13369, 0.3462661, -0.6717449, 1, 0, 0, 1, 1,
-1.119617, -0.1673096, -1.728153, 1, 0, 0, 1, 1,
-1.107733, -0.8713295, -2.622865, 0, 0, 0, 1, 1,
-1.104667, 0.5312386, -0.5006108, 0, 0, 0, 1, 1,
-1.104158, -1.104298, -1.023868, 0, 0, 0, 1, 1,
-1.102795, 1.919232, -0.330074, 0, 0, 0, 1, 1,
-1.101726, 1.014313, -1.062843, 0, 0, 0, 1, 1,
-1.098342, 0.1119002, -2.98146, 0, 0, 0, 1, 1,
-1.09164, -0.9381455, -3.689477, 0, 0, 0, 1, 1,
-1.083861, 1.559214, -1.041698, 1, 1, 1, 1, 1,
-1.083003, 0.6606915, 0.2407914, 1, 1, 1, 1, 1,
-1.078509, -0.2137354, -0.7356582, 1, 1, 1, 1, 1,
-1.077991, 0.1405885, -1.832499, 1, 1, 1, 1, 1,
-1.067394, 0.4429777, -2.195373, 1, 1, 1, 1, 1,
-1.063867, -0.2422039, -1.150792, 1, 1, 1, 1, 1,
-1.057624, 0.2082991, 1.637915, 1, 1, 1, 1, 1,
-1.051318, 0.4200201, -0.4308325, 1, 1, 1, 1, 1,
-1.049765, 0.6671737, -3.189929, 1, 1, 1, 1, 1,
-1.048625, -0.6274955, -0.1648478, 1, 1, 1, 1, 1,
-1.040814, 0.1854033, -0.8286921, 1, 1, 1, 1, 1,
-1.040032, -0.6329448, -2.243877, 1, 1, 1, 1, 1,
-1.036424, -0.4027101, -2.700033, 1, 1, 1, 1, 1,
-1.03544, 0.9999736, 0.3269434, 1, 1, 1, 1, 1,
-1.034726, 0.4582493, -0.6903247, 1, 1, 1, 1, 1,
-1.034621, 1.170664, -1.915056, 0, 0, 1, 1, 1,
-1.030724, -0.2690282, -3.63101, 1, 0, 0, 1, 1,
-1.021397, 0.4597511, 0.2224839, 1, 0, 0, 1, 1,
-1.019076, -0.7516159, -2.395102, 1, 0, 0, 1, 1,
-1.015882, 0.6533808, -1.352117, 1, 0, 0, 1, 1,
-1.012465, -2.63552, -2.299841, 1, 0, 0, 1, 1,
-1.01035, -0.1707779, -1.801309, 0, 0, 0, 1, 1,
-1.007606, 0.2463358, -1.12043, 0, 0, 0, 1, 1,
-1.004108, 0.7014881, -1.389139, 0, 0, 0, 1, 1,
-0.9904755, -0.2275232, -3.739347, 0, 0, 0, 1, 1,
-0.9840376, 1.178473, -1.265612, 0, 0, 0, 1, 1,
-0.9763443, -1.633286, -2.293232, 0, 0, 0, 1, 1,
-0.9626802, -0.6607411, -1.550799, 0, 0, 0, 1, 1,
-0.9566965, 0.08851305, -1.390967, 1, 1, 1, 1, 1,
-0.9527578, -0.1763973, -2.786661, 1, 1, 1, 1, 1,
-0.9481436, -1.42486, -1.981619, 1, 1, 1, 1, 1,
-0.9469361, 0.5549855, -2.151712, 1, 1, 1, 1, 1,
-0.945706, -0.5888646, -3.109047, 1, 1, 1, 1, 1,
-0.9359478, 0.2851172, 0.1466058, 1, 1, 1, 1, 1,
-0.9351848, 0.8023691, -0.2327648, 1, 1, 1, 1, 1,
-0.930973, 0.7816008, 0.7282413, 1, 1, 1, 1, 1,
-0.9265596, 0.1000592, -0.2793855, 1, 1, 1, 1, 1,
-0.9256443, -0.7150257, -3.248624, 1, 1, 1, 1, 1,
-0.9255425, 0.5659713, -2.859194, 1, 1, 1, 1, 1,
-0.9214402, -0.4174848, -2.804469, 1, 1, 1, 1, 1,
-0.9005568, 0.438354, 0.5253879, 1, 1, 1, 1, 1,
-0.8962371, 2.376377, -1.080801, 1, 1, 1, 1, 1,
-0.8943467, 1.653141, -1.019539, 1, 1, 1, 1, 1,
-0.8925146, 0.1524829, -0.09047541, 0, 0, 1, 1, 1,
-0.8910707, 0.2939505, -0.5460815, 1, 0, 0, 1, 1,
-0.8905913, -1.005064, -2.586997, 1, 0, 0, 1, 1,
-0.8877295, -1.502869, -3.270376, 1, 0, 0, 1, 1,
-0.8859619, 1.429763, -0.8478157, 1, 0, 0, 1, 1,
-0.8820877, 2.539119, 0.5077426, 1, 0, 0, 1, 1,
-0.8697889, -1.151678, -1.44536, 0, 0, 0, 1, 1,
-0.8687466, 0.4662592, -1.470833, 0, 0, 0, 1, 1,
-0.8684492, 0.3308135, -2.67397, 0, 0, 0, 1, 1,
-0.8613929, -0.697347, -2.958086, 0, 0, 0, 1, 1,
-0.8448865, -0.7489892, -2.731703, 0, 0, 0, 1, 1,
-0.8443679, 1.550078, -1.626993, 0, 0, 0, 1, 1,
-0.8440869, -0.5685169, -2.388829, 0, 0, 0, 1, 1,
-0.8429992, 0.04917131, -1.392968, 1, 1, 1, 1, 1,
-0.8391245, 1.196308, -0.3523552, 1, 1, 1, 1, 1,
-0.8376054, 3.349033, -0.9269267, 1, 1, 1, 1, 1,
-0.8337176, 0.7123541, -1.987737, 1, 1, 1, 1, 1,
-0.8328847, -0.9769804, -1.550338, 1, 1, 1, 1, 1,
-0.8301046, 0.09296734, -1.596231, 1, 1, 1, 1, 1,
-0.8284462, -1.825511, -3.240485, 1, 1, 1, 1, 1,
-0.828029, 1.067258, 0.3073321, 1, 1, 1, 1, 1,
-0.8229864, -0.2704816, -3.252472, 1, 1, 1, 1, 1,
-0.8207951, -1.132667, -2.696386, 1, 1, 1, 1, 1,
-0.8204261, 1.961397, -0.5215138, 1, 1, 1, 1, 1,
-0.81808, -2.68834, -3.092552, 1, 1, 1, 1, 1,
-0.8178307, -0.3500057, -0.9106094, 1, 1, 1, 1, 1,
-0.8021552, -1.513207, -2.331548, 1, 1, 1, 1, 1,
-0.7934631, -1.058756, -1.233793, 1, 1, 1, 1, 1,
-0.7881853, 0.4589562, 0.2576416, 0, 0, 1, 1, 1,
-0.7867758, -0.002169863, -3.469891, 1, 0, 0, 1, 1,
-0.7840713, 0.5964061, -0.9613752, 1, 0, 0, 1, 1,
-0.7815805, 0.2283172, -1.619604, 1, 0, 0, 1, 1,
-0.7772655, -1.035764, -3.598516, 1, 0, 0, 1, 1,
-0.7694116, 1.861918, -0.1488489, 1, 0, 0, 1, 1,
-0.7657099, -1.747464, -4.026496, 0, 0, 0, 1, 1,
-0.7629716, 1.282157, -0.5087141, 0, 0, 0, 1, 1,
-0.7553341, 0.6846726, 0.1373361, 0, 0, 0, 1, 1,
-0.7548411, 0.2842668, -0.1675432, 0, 0, 0, 1, 1,
-0.7535794, -1.223262, -3.117272, 0, 0, 0, 1, 1,
-0.7507976, -0.1404121, -3.703801, 0, 0, 0, 1, 1,
-0.7504405, 1.113622, -1.13947, 0, 0, 0, 1, 1,
-0.7430067, 0.3671182, -0.5166413, 1, 1, 1, 1, 1,
-0.7428999, 0.6036844, -1.083621, 1, 1, 1, 1, 1,
-0.735867, -0.7319505, -1.801055, 1, 1, 1, 1, 1,
-0.7352492, -0.06893244, -1.51136, 1, 1, 1, 1, 1,
-0.7350462, 1.025379, 0.9058409, 1, 1, 1, 1, 1,
-0.7339872, 0.003643733, -2.908249, 1, 1, 1, 1, 1,
-0.7308937, 0.8975574, -0.2826722, 1, 1, 1, 1, 1,
-0.7253737, 1.692373, -0.5944352, 1, 1, 1, 1, 1,
-0.7247864, 0.2465657, 0.08750428, 1, 1, 1, 1, 1,
-0.7191762, -0.7421303, -1.792631, 1, 1, 1, 1, 1,
-0.7189752, -0.6398306, -2.352852, 1, 1, 1, 1, 1,
-0.7179892, 0.4378079, -0.5386438, 1, 1, 1, 1, 1,
-0.7139006, -0.5221315, -2.828145, 1, 1, 1, 1, 1,
-0.7115573, 0.2237408, -2.115513, 1, 1, 1, 1, 1,
-0.7079916, 2.065634, 0.6539492, 1, 1, 1, 1, 1,
-0.7076767, -0.7275993, -2.894367, 0, 0, 1, 1, 1,
-0.6948307, 0.4912135, -0.1827249, 1, 0, 0, 1, 1,
-0.6864536, -0.2180861, -3.100535, 1, 0, 0, 1, 1,
-0.6855108, -0.7863947, -3.638904, 1, 0, 0, 1, 1,
-0.6849499, -1.532393, -3.206324, 1, 0, 0, 1, 1,
-0.6822961, -1.055394, -3.587613, 1, 0, 0, 1, 1,
-0.6816951, -1.59341, -4.012827, 0, 0, 0, 1, 1,
-0.6812301, 0.6891085, -3.035945, 0, 0, 0, 1, 1,
-0.6806221, -0.6750682, -0.6914852, 0, 0, 0, 1, 1,
-0.6789863, -0.537823, -2.195451, 0, 0, 0, 1, 1,
-0.6788815, -0.6264394, -1.605215, 0, 0, 0, 1, 1,
-0.6778921, 0.7611757, -0.9240451, 0, 0, 0, 1, 1,
-0.6773311, -0.2460758, -2.448222, 0, 0, 0, 1, 1,
-0.6754135, 0.0667608, -1.401605, 1, 1, 1, 1, 1,
-0.6734843, -0.15832, 0.4142912, 1, 1, 1, 1, 1,
-0.6683775, -0.5724281, -2.119056, 1, 1, 1, 1, 1,
-0.6668263, -0.5790771, -3.155649, 1, 1, 1, 1, 1,
-0.6647391, -0.3712547, -2.833716, 1, 1, 1, 1, 1,
-0.664508, -1.152091, -2.150863, 1, 1, 1, 1, 1,
-0.6575966, -0.01189253, -0.5233473, 1, 1, 1, 1, 1,
-0.6510763, -0.769963, -3.091112, 1, 1, 1, 1, 1,
-0.6495231, 2.032268, -1.362886, 1, 1, 1, 1, 1,
-0.6495218, 0.6346167, 1.225945, 1, 1, 1, 1, 1,
-0.6457903, -0.847123, -2.056283, 1, 1, 1, 1, 1,
-0.6445051, -1.011575, -2.027394, 1, 1, 1, 1, 1,
-0.6423383, 0.07498705, -1.312901, 1, 1, 1, 1, 1,
-0.6405845, 0.5528208, -2.715268, 1, 1, 1, 1, 1,
-0.6374393, -1.109007, -4.563755, 1, 1, 1, 1, 1,
-0.6309371, -0.5165516, -3.33254, 0, 0, 1, 1, 1,
-0.6279851, -1.148716, -1.983556, 1, 0, 0, 1, 1,
-0.6238272, -0.3064317, -0.3577431, 1, 0, 0, 1, 1,
-0.6210663, -0.1026856, -1.655278, 1, 0, 0, 1, 1,
-0.6181264, -0.5684404, -1.471174, 1, 0, 0, 1, 1,
-0.6181112, -1.142704, -1.780169, 1, 0, 0, 1, 1,
-0.6171979, 1.298277, -0.2522227, 0, 0, 0, 1, 1,
-0.6162384, 1.227724, -1.406072, 0, 0, 0, 1, 1,
-0.6159195, -1.100753, -2.714678, 0, 0, 0, 1, 1,
-0.6005647, 0.6942518, -1.679083, 0, 0, 0, 1, 1,
-0.5988236, -0.6279421, -3.008248, 0, 0, 0, 1, 1,
-0.5970993, 0.1874266, 1.033466, 0, 0, 0, 1, 1,
-0.5914069, 0.8531725, -2.757865, 0, 0, 0, 1, 1,
-0.5913742, 0.3683723, 0.0411178, 1, 1, 1, 1, 1,
-0.582853, -0.7387704, -0.4174328, 1, 1, 1, 1, 1,
-0.5824058, -0.4124108, -2.140766, 1, 1, 1, 1, 1,
-0.5819037, 0.5980938, -1.341431, 1, 1, 1, 1, 1,
-0.5792124, -0.1064687, -2.22428, 1, 1, 1, 1, 1,
-0.5778548, 0.7938273, 0.8314868, 1, 1, 1, 1, 1,
-0.5719212, -2.053509, -3.460817, 1, 1, 1, 1, 1,
-0.5717095, 1.252534, -1.344954, 1, 1, 1, 1, 1,
-0.5707479, 1.067832, -0.6662675, 1, 1, 1, 1, 1,
-0.5643135, 0.287385, -0.6610821, 1, 1, 1, 1, 1,
-0.5643042, -0.1746555, -1.672317, 1, 1, 1, 1, 1,
-0.5642219, -0.353813, -0.429817, 1, 1, 1, 1, 1,
-0.5622955, -0.9347014, -3.34559, 1, 1, 1, 1, 1,
-0.5585459, 0.1915406, -1.961719, 1, 1, 1, 1, 1,
-0.5583714, -1.508014, -2.258648, 1, 1, 1, 1, 1,
-0.5541371, -1.200493, -2.440728, 0, 0, 1, 1, 1,
-0.5494506, 0.9488479, -0.358457, 1, 0, 0, 1, 1,
-0.5477085, -0.3229962, -1.968925, 1, 0, 0, 1, 1,
-0.5471798, -0.194643, -2.016848, 1, 0, 0, 1, 1,
-0.5463371, -0.6601944, -2.870268, 1, 0, 0, 1, 1,
-0.5450235, 1.086336, -1.266722, 1, 0, 0, 1, 1,
-0.5447466, -0.326949, -1.919225, 0, 0, 0, 1, 1,
-0.5444119, 1.014292, -2.730361, 0, 0, 0, 1, 1,
-0.538843, 0.548117, -1.632743, 0, 0, 0, 1, 1,
-0.5316736, 0.5107216, -0.08012989, 0, 0, 0, 1, 1,
-0.5314604, 1.042074, -1.131126, 0, 0, 0, 1, 1,
-0.5302207, 0.6211467, -2.42745, 0, 0, 0, 1, 1,
-0.5285574, 0.968769, 0.3820229, 0, 0, 0, 1, 1,
-0.5285098, -0.07809011, -1.046418, 1, 1, 1, 1, 1,
-0.5283138, -2.692978, -3.021933, 1, 1, 1, 1, 1,
-0.5278229, -1.862579, -1.304953, 1, 1, 1, 1, 1,
-0.5245388, 0.4395329, -2.012512, 1, 1, 1, 1, 1,
-0.5118477, -0.3125185, -2.45255, 1, 1, 1, 1, 1,
-0.5097234, -0.1842667, -2.250439, 1, 1, 1, 1, 1,
-0.5019529, -1.556014, -3.840827, 1, 1, 1, 1, 1,
-0.5015253, -0.5726971, -3.13163, 1, 1, 1, 1, 1,
-0.5013244, -0.4077087, -3.807839, 1, 1, 1, 1, 1,
-0.4984998, -0.02886428, -0.2256336, 1, 1, 1, 1, 1,
-0.4927905, -0.4689966, -1.747864, 1, 1, 1, 1, 1,
-0.4899577, -1.427752, -2.726412, 1, 1, 1, 1, 1,
-0.4841754, 0.008441866, -0.738782, 1, 1, 1, 1, 1,
-0.4838938, -0.5976443, -1.118549, 1, 1, 1, 1, 1,
-0.4776996, 0.9239566, -0.8068181, 1, 1, 1, 1, 1,
-0.4723682, 1.891214, 1.004819, 0, 0, 1, 1, 1,
-0.4704261, -0.2315796, -2.296285, 1, 0, 0, 1, 1,
-0.4634416, -2.095098, -2.113007, 1, 0, 0, 1, 1,
-0.4612267, 0.2681458, -0.0132595, 1, 0, 0, 1, 1,
-0.4604145, -0.8358466, -1.053832, 1, 0, 0, 1, 1,
-0.4592711, 0.7077808, -1.966524, 1, 0, 0, 1, 1,
-0.4552234, -2.496253, -1.197558, 0, 0, 0, 1, 1,
-0.4494997, 0.6600184, -1.369661, 0, 0, 0, 1, 1,
-0.4473495, 1.064326, 0.9833757, 0, 0, 0, 1, 1,
-0.444107, -1.082044, -2.298414, 0, 0, 0, 1, 1,
-0.4386539, -0.8227378, -4.111555, 0, 0, 0, 1, 1,
-0.4371058, 1.352189, 0.7644656, 0, 0, 0, 1, 1,
-0.4361679, 0.3194642, -1.388292, 0, 0, 0, 1, 1,
-0.435912, -0.1949333, -2.390548, 1, 1, 1, 1, 1,
-0.4340508, -0.03436689, -1.70022, 1, 1, 1, 1, 1,
-0.431412, 0.2365849, -1.249302, 1, 1, 1, 1, 1,
-0.4296331, -0.09554013, -3.353102, 1, 1, 1, 1, 1,
-0.4246328, 0.2190859, -0.66583, 1, 1, 1, 1, 1,
-0.4240566, -0.2808264, -0.4253892, 1, 1, 1, 1, 1,
-0.4180108, -0.1380816, -4.142843, 1, 1, 1, 1, 1,
-0.4120255, -2.024984, -4.067648, 1, 1, 1, 1, 1,
-0.4099814, 1.330053, -0.6862539, 1, 1, 1, 1, 1,
-0.4078373, 0.1581877, -2.336771, 1, 1, 1, 1, 1,
-0.4052016, 0.215279, -0.06786886, 1, 1, 1, 1, 1,
-0.400709, 0.4787733, 0.6460682, 1, 1, 1, 1, 1,
-0.3916562, -0.937282, -3.010172, 1, 1, 1, 1, 1,
-0.3899363, -0.246778, -0.6573179, 1, 1, 1, 1, 1,
-0.384167, 1.176394, -1.504583, 1, 1, 1, 1, 1,
-0.380131, -0.6542389, -1.648541, 0, 0, 1, 1, 1,
-0.3719872, -0.7507842, -2.321571, 1, 0, 0, 1, 1,
-0.3704133, 2.119452, -0.2984812, 1, 0, 0, 1, 1,
-0.3684467, -0.3498378, -2.018447, 1, 0, 0, 1, 1,
-0.3676524, -0.8020608, -2.569996, 1, 0, 0, 1, 1,
-0.3671101, -1.491811, -3.390425, 1, 0, 0, 1, 1,
-0.3612107, 0.9672565, -1.230323, 0, 0, 0, 1, 1,
-0.3569307, 0.6529253, -1.319847, 0, 0, 0, 1, 1,
-0.3547817, 0.187745, -0.5133254, 0, 0, 0, 1, 1,
-0.3535188, -1.45642, -2.351405, 0, 0, 0, 1, 1,
-0.3508233, 0.6164723, -0.3482786, 0, 0, 0, 1, 1,
-0.3492353, 1.217873, 1.220815, 0, 0, 0, 1, 1,
-0.3467953, 0.637262, -2.838044, 0, 0, 0, 1, 1,
-0.3462534, 0.4925269, -0.01057938, 1, 1, 1, 1, 1,
-0.3447126, -2.197774, -4.719943, 1, 1, 1, 1, 1,
-0.3446747, 1.95107, 1.199432, 1, 1, 1, 1, 1,
-0.3376491, -1.220778, -2.523879, 1, 1, 1, 1, 1,
-0.3302001, -0.471058, -1.54352, 1, 1, 1, 1, 1,
-0.3283482, 0.2778318, -0.9496852, 1, 1, 1, 1, 1,
-0.3281906, -0.8453767, -3.276487, 1, 1, 1, 1, 1,
-0.3280959, -0.3737573, -1.825288, 1, 1, 1, 1, 1,
-0.3253307, -0.2558845, -1.879963, 1, 1, 1, 1, 1,
-0.3244291, -0.7413977, -3.298189, 1, 1, 1, 1, 1,
-0.3230524, -0.155521, -1.92754, 1, 1, 1, 1, 1,
-0.3220685, -1.292499, -1.118872, 1, 1, 1, 1, 1,
-0.3171975, 1.357077, 0.7572743, 1, 1, 1, 1, 1,
-0.3159453, -0.9537003, -0.5893231, 1, 1, 1, 1, 1,
-0.3150554, 1.185318, 0.5838504, 1, 1, 1, 1, 1,
-0.3129372, 0.5810905, 2.27157, 0, 0, 1, 1, 1,
-0.3111497, -0.4847843, -0.5281436, 1, 0, 0, 1, 1,
-0.3075139, 0.1793128, -1.809665, 1, 0, 0, 1, 1,
-0.2969311, -0.3956534, -3.21172, 1, 0, 0, 1, 1,
-0.2948682, -2.207401, -4.039349, 1, 0, 0, 1, 1,
-0.2933906, -0.5821447, -0.9142954, 1, 0, 0, 1, 1,
-0.291342, -0.4068712, -3.127493, 0, 0, 0, 1, 1,
-0.2902203, -0.6285934, -2.512664, 0, 0, 0, 1, 1,
-0.2883425, -2.338598, -1.955723, 0, 0, 0, 1, 1,
-0.2883113, 0.4811552, -0.1962606, 0, 0, 0, 1, 1,
-0.2814383, 0.6832205, -0.02757078, 0, 0, 0, 1, 1,
-0.2796364, -1.818636, -4.566374, 0, 0, 0, 1, 1,
-0.2711587, -0.6365659, -2.808404, 0, 0, 0, 1, 1,
-0.2655914, -0.7053797, -4.47137, 1, 1, 1, 1, 1,
-0.2613161, -0.2373011, -2.766379, 1, 1, 1, 1, 1,
-0.2565755, 0.6815468, -0.1895564, 1, 1, 1, 1, 1,
-0.2564423, 0.2002219, -0.7810397, 1, 1, 1, 1, 1,
-0.2552921, -1.374073, -4.485082, 1, 1, 1, 1, 1,
-0.2538309, -1.977791, -2.790813, 1, 1, 1, 1, 1,
-0.2537386, 0.6581309, -1.43358, 1, 1, 1, 1, 1,
-0.2492811, 1.016599, -0.2549358, 1, 1, 1, 1, 1,
-0.2479461, 0.08774541, -1.178992, 1, 1, 1, 1, 1,
-0.2470604, -0.6250656, -3.786821, 1, 1, 1, 1, 1,
-0.2467619, 0.6319084, 0.3913053, 1, 1, 1, 1, 1,
-0.2432701, 0.7097847, -1.321402, 1, 1, 1, 1, 1,
-0.2423125, -0.1900717, -2.237597, 1, 1, 1, 1, 1,
-0.2348027, -1.227841, -2.813131, 1, 1, 1, 1, 1,
-0.2312146, -0.5856296, -1.688449, 1, 1, 1, 1, 1,
-0.2256756, -2.848638, -3.077248, 0, 0, 1, 1, 1,
-0.2160858, 1.456106, -1.027856, 1, 0, 0, 1, 1,
-0.2006845, -2.055706, -2.534665, 1, 0, 0, 1, 1,
-0.1983828, -1.79765, -1.814949, 1, 0, 0, 1, 1,
-0.1983135, -1.359109, -3.316088, 1, 0, 0, 1, 1,
-0.1976865, -0.01607603, -2.136813, 1, 0, 0, 1, 1,
-0.1951059, -1.19118, -2.28605, 0, 0, 0, 1, 1,
-0.1907586, 0.2633244, -0.0180294, 0, 0, 0, 1, 1,
-0.1861071, -0.06918447, -0.6025746, 0, 0, 0, 1, 1,
-0.1854323, -0.3033037, -2.117903, 0, 0, 0, 1, 1,
-0.1851212, 0.8969463, -1.055942, 0, 0, 0, 1, 1,
-0.1723659, 0.2338044, 0.3113854, 0, 0, 0, 1, 1,
-0.1714697, 1.114435, 0.2978674, 0, 0, 0, 1, 1,
-0.1683566, -0.5839496, -2.03811, 1, 1, 1, 1, 1,
-0.1606871, -2.124421, -2.625501, 1, 1, 1, 1, 1,
-0.1594608, 0.5476813, -1.964588, 1, 1, 1, 1, 1,
-0.1520025, -1.348973, -2.517109, 1, 1, 1, 1, 1,
-0.146966, 1.662393, 0.5341923, 1, 1, 1, 1, 1,
-0.1455168, 1.481785, 0.8646434, 1, 1, 1, 1, 1,
-0.1429574, 1.201579, 0.5047107, 1, 1, 1, 1, 1,
-0.1375562, -2.346448, -2.098433, 1, 1, 1, 1, 1,
-0.1348523, 2.016685, -0.01717648, 1, 1, 1, 1, 1,
-0.132293, 0.8952762, -0.2248106, 1, 1, 1, 1, 1,
-0.129314, 0.3225563, 1.130834, 1, 1, 1, 1, 1,
-0.1279556, 0.3866723, 1.11859, 1, 1, 1, 1, 1,
-0.1273721, -0.421773, -3.476638, 1, 1, 1, 1, 1,
-0.1214821, 1.874192, -1.127801, 1, 1, 1, 1, 1,
-0.1185368, -0.6759924, -2.425466, 1, 1, 1, 1, 1,
-0.1135004, -1.168475, -1.433457, 0, 0, 1, 1, 1,
-0.1118331, 1.195452, 0.3521433, 1, 0, 0, 1, 1,
-0.1088543, -0.7669871, -2.782975, 1, 0, 0, 1, 1,
-0.1080825, -2.542132, -3.494266, 1, 0, 0, 1, 1,
-0.105932, 0.3161545, 0.1317535, 1, 0, 0, 1, 1,
-0.1029967, -0.1697172, -1.817632, 1, 0, 0, 1, 1,
-0.09628808, 0.4078822, -1.226342, 0, 0, 0, 1, 1,
-0.09219059, 1.521876, 1.610424, 0, 0, 0, 1, 1,
-0.09165224, -0.2653572, -2.263866, 0, 0, 0, 1, 1,
-0.09054175, -0.5764919, -3.615621, 0, 0, 0, 1, 1,
-0.0884808, 1.194223, 0.1971638, 0, 0, 0, 1, 1,
-0.08419503, -0.9950774, -5.085535, 0, 0, 0, 1, 1,
-0.08417573, -0.247081, -0.7235701, 0, 0, 0, 1, 1,
-0.08263192, -1.290681, -3.311008, 1, 1, 1, 1, 1,
-0.07755964, -0.7160814, -2.003955, 1, 1, 1, 1, 1,
-0.07707009, 1.287603, 0.3767971, 1, 1, 1, 1, 1,
-0.07681938, 0.02846923, -0.497983, 1, 1, 1, 1, 1,
-0.07612479, 0.5562161, -0.3674698, 1, 1, 1, 1, 1,
-0.07524058, -1.718777, -4.944494, 1, 1, 1, 1, 1,
-0.06923851, -1.502501, -2.403871, 1, 1, 1, 1, 1,
-0.0665926, 0.01223141, -1.651478, 1, 1, 1, 1, 1,
-0.05998442, -0.3047039, -3.693063, 1, 1, 1, 1, 1,
-0.05643512, -0.3509265, -2.779844, 1, 1, 1, 1, 1,
-0.05295979, 1.063557, -0.06567471, 1, 1, 1, 1, 1,
-0.05102625, -1.360185, -3.802222, 1, 1, 1, 1, 1,
-0.05000867, -1.015663, -1.375209, 1, 1, 1, 1, 1,
-0.04737645, 0.6581321, -2.35595, 1, 1, 1, 1, 1,
-0.046683, -0.01862677, -2.169668, 1, 1, 1, 1, 1,
-0.04439704, 0.04799843, -0.9478171, 0, 0, 1, 1, 1,
-0.04175076, 0.02510524, -2.183904, 1, 0, 0, 1, 1,
-0.04169124, 1.078633, -0.1621924, 1, 0, 0, 1, 1,
-0.03894316, 0.224358, 0.09927391, 1, 0, 0, 1, 1,
-0.03183415, -0.001789665, -3.294312, 1, 0, 0, 1, 1,
-0.03182997, -0.8076926, -3.453241, 1, 0, 0, 1, 1,
-0.02868838, 0.4612789, -0.5181404, 0, 0, 0, 1, 1,
-0.02811182, -0.06146129, -2.637378, 0, 0, 0, 1, 1,
-0.0260373, 0.8103626, -0.9643648, 0, 0, 0, 1, 1,
-0.02590035, 1.359268, -1.029766, 0, 0, 0, 1, 1,
-0.02500952, 1.018863, 0.4193179, 0, 0, 0, 1, 1,
-0.02497205, -0.4733229, -2.194371, 0, 0, 0, 1, 1,
-0.02018709, 1.04705, -1.244989, 0, 0, 0, 1, 1,
-0.01715533, -0.2778793, -1.241927, 1, 1, 1, 1, 1,
-0.0168524, -0.3107808, -3.044315, 1, 1, 1, 1, 1,
-0.01586105, -0.02843419, -0.5827489, 1, 1, 1, 1, 1,
-0.01449912, 2.086702, -0.7116948, 1, 1, 1, 1, 1,
-0.01244453, -0.1823817, -0.6283485, 1, 1, 1, 1, 1,
-0.01073274, -1.115099, -1.677264, 1, 1, 1, 1, 1,
-0.006390273, 1.163751, 2.546673, 1, 1, 1, 1, 1,
-0.004246037, -1.986084, -3.500529, 1, 1, 1, 1, 1,
-0.003732376, -0.3122009, -2.569664, 1, 1, 1, 1, 1,
-0.001955271, 0.2027587, -0.6807439, 1, 1, 1, 1, 1,
0.001036924, -0.2519681, 3.506848, 1, 1, 1, 1, 1,
0.005150449, 0.5529173, -0.2270026, 1, 1, 1, 1, 1,
0.009266418, 0.4461539, -0.2775818, 1, 1, 1, 1, 1,
0.01134902, 0.4576079, -0.02768546, 1, 1, 1, 1, 1,
0.01367954, 1.683519, -0.6496904, 1, 1, 1, 1, 1,
0.01459923, -0.03967342, 2.730061, 0, 0, 1, 1, 1,
0.01476607, -0.205004, 1.913569, 1, 0, 0, 1, 1,
0.01517756, -0.0704409, 3.524603, 1, 0, 0, 1, 1,
0.01710638, -0.07274464, 2.540848, 1, 0, 0, 1, 1,
0.01759591, -1.685645, 3.890327, 1, 0, 0, 1, 1,
0.02445246, 0.9560297, -0.8940098, 1, 0, 0, 1, 1,
0.03115822, 1.858587, -0.04269274, 0, 0, 0, 1, 1,
0.0321313, 0.4784059, 0.2821531, 0, 0, 0, 1, 1,
0.03293702, 0.1455067, -0.1282142, 0, 0, 0, 1, 1,
0.03348897, -0.516959, 2.521142, 0, 0, 0, 1, 1,
0.03370808, 0.3818955, -0.3589527, 0, 0, 0, 1, 1,
0.03663705, 0.9545327, 0.6983031, 0, 0, 0, 1, 1,
0.04051495, -0.6700073, 2.882983, 0, 0, 0, 1, 1,
0.04180618, 0.8602844, 0.598437, 1, 1, 1, 1, 1,
0.04495498, -0.4641775, 2.831307, 1, 1, 1, 1, 1,
0.04552718, -1.501276, 4.290771, 1, 1, 1, 1, 1,
0.04692479, -0.6463047, 4.90581, 1, 1, 1, 1, 1,
0.05059678, -0.2701538, 2.383819, 1, 1, 1, 1, 1,
0.05120265, -0.3431984, 2.650979, 1, 1, 1, 1, 1,
0.05623518, 0.4496946, 0.07267268, 1, 1, 1, 1, 1,
0.0601405, 1.166324, 0.1225669, 1, 1, 1, 1, 1,
0.0622606, 1.658337, 2.418883, 1, 1, 1, 1, 1,
0.06473561, -0.1639468, 3.909509, 1, 1, 1, 1, 1,
0.06560315, -1.258752, 1.632486, 1, 1, 1, 1, 1,
0.065781, 1.154855, 1.644083, 1, 1, 1, 1, 1,
0.06648681, -0.455319, 3.96934, 1, 1, 1, 1, 1,
0.06973416, -1.807364, 3.715449, 1, 1, 1, 1, 1,
0.07229194, 1.097447, -1.055448, 1, 1, 1, 1, 1,
0.07634503, -0.5318679, 2.835333, 0, 0, 1, 1, 1,
0.07849877, 0.0805885, 0.08003339, 1, 0, 0, 1, 1,
0.07992148, -0.463705, 2.98254, 1, 0, 0, 1, 1,
0.08009975, -0.8698906, 2.026406, 1, 0, 0, 1, 1,
0.08012757, 0.2980677, 1.68596, 1, 0, 0, 1, 1,
0.08347543, -1.107441, 2.587839, 1, 0, 0, 1, 1,
0.08826538, 0.7344661, -1.804557, 0, 0, 0, 1, 1,
0.08968148, 0.9763162, 1.237636, 0, 0, 0, 1, 1,
0.09891232, -0.9324728, 2.382789, 0, 0, 0, 1, 1,
0.1044621, -1.229798, 4.88284, 0, 0, 0, 1, 1,
0.1054922, -0.9197488, 3.48602, 0, 0, 0, 1, 1,
0.1078241, 0.2914432, 0.2589528, 0, 0, 0, 1, 1,
0.1110011, -0.5473237, 1.368657, 0, 0, 0, 1, 1,
0.1135195, -1.299027, 3.62909, 1, 1, 1, 1, 1,
0.1138889, 0.9917759, -1.992791, 1, 1, 1, 1, 1,
0.1139642, 0.6762797, 0.09822397, 1, 1, 1, 1, 1,
0.1161851, 1.546168, -1.312038, 1, 1, 1, 1, 1,
0.116489, -0.2075467, 2.78344, 1, 1, 1, 1, 1,
0.1174369, 0.3293743, 0.67455, 1, 1, 1, 1, 1,
0.1199363, -0.1071885, 3.537589, 1, 1, 1, 1, 1,
0.125191, -1.109981, 2.989966, 1, 1, 1, 1, 1,
0.1272373, 0.1749331, -0.542276, 1, 1, 1, 1, 1,
0.129227, 0.1951516, 0.2199705, 1, 1, 1, 1, 1,
0.1306629, -0.4352366, 3.239099, 1, 1, 1, 1, 1,
0.1309912, 0.6281594, 0.9894356, 1, 1, 1, 1, 1,
0.1344177, -0.4356538, 2.090306, 1, 1, 1, 1, 1,
0.1357294, 2.11174, -0.7577474, 1, 1, 1, 1, 1,
0.1380244, 1.298999, -0.2352187, 1, 1, 1, 1, 1,
0.1386901, 1.1043, -0.6454798, 0, 0, 1, 1, 1,
0.1421248, 0.1219663, 0.2260522, 1, 0, 0, 1, 1,
0.1483292, -0.2051696, 2.002581, 1, 0, 0, 1, 1,
0.1509167, 0.9287652, -0.5437183, 1, 0, 0, 1, 1,
0.1517219, 1.369087, 1.673243, 1, 0, 0, 1, 1,
0.1578771, 1.888825, -0.4783645, 1, 0, 0, 1, 1,
0.1596178, -1.187158, 1.666229, 0, 0, 0, 1, 1,
0.1619504, -0.05208043, 0.817642, 0, 0, 0, 1, 1,
0.1658934, 0.03429129, 1.59634, 0, 0, 0, 1, 1,
0.1662433, 1.356183, -0.8059421, 0, 0, 0, 1, 1,
0.1674596, -0.5866896, 3.282971, 0, 0, 0, 1, 1,
0.1700969, -0.7633926, 2.531955, 0, 0, 0, 1, 1,
0.1775376, -2.135767, 4.228256, 0, 0, 0, 1, 1,
0.1783147, 0.6145009, 1.78161, 1, 1, 1, 1, 1,
0.1820763, 0.5549282, 0.5559213, 1, 1, 1, 1, 1,
0.1856337, -0.1695485, 2.160423, 1, 1, 1, 1, 1,
0.1910945, -0.2949308, 2.64031, 1, 1, 1, 1, 1,
0.1928851, -1.401133, 4.465546, 1, 1, 1, 1, 1,
0.1930422, -0.2274216, 3.363494, 1, 1, 1, 1, 1,
0.1935747, -0.4051179, 2.15644, 1, 1, 1, 1, 1,
0.1947099, 0.2355259, 1.388555, 1, 1, 1, 1, 1,
0.1947616, -0.9418807, 2.848761, 1, 1, 1, 1, 1,
0.1972389, 0.1500167, 1.040019, 1, 1, 1, 1, 1,
0.2009617, 1.162908, -0.8956452, 1, 1, 1, 1, 1,
0.2014132, 1.007227, -0.3827668, 1, 1, 1, 1, 1,
0.2021111, -1.989622, 4.714747, 1, 1, 1, 1, 1,
0.2026452, -0.218113, 3.302667, 1, 1, 1, 1, 1,
0.2041015, 0.9576979, 0.8457063, 1, 1, 1, 1, 1,
0.2081534, -0.2270711, 2.090847, 0, 0, 1, 1, 1,
0.2088764, 1.194516, 1.516162, 1, 0, 0, 1, 1,
0.2142157, -0.04455193, 1.532884, 1, 0, 0, 1, 1,
0.2167947, -0.7794234, 1.658498, 1, 0, 0, 1, 1,
0.2176486, 0.08953188, 0.2940824, 1, 0, 0, 1, 1,
0.2204379, -0.4340424, 2.782877, 1, 0, 0, 1, 1,
0.2310874, -0.9242285, 4.277943, 0, 0, 0, 1, 1,
0.2330213, -0.4688882, 1.305278, 0, 0, 0, 1, 1,
0.2346231, 0.4682578, 1.132075, 0, 0, 0, 1, 1,
0.2451691, -0.1298085, 3.289346, 0, 0, 0, 1, 1,
0.2473117, -0.9760379, 2.563592, 0, 0, 0, 1, 1,
0.2511718, -2.53041, 3.950265, 0, 0, 0, 1, 1,
0.258007, -0.3621423, 2.868065, 0, 0, 0, 1, 1,
0.2586017, 0.1798884, 0.5425265, 1, 1, 1, 1, 1,
0.259405, 0.4083076, 0.1769747, 1, 1, 1, 1, 1,
0.2656595, 0.8403642, -0.9281799, 1, 1, 1, 1, 1,
0.26581, 0.06708488, 2.895378, 1, 1, 1, 1, 1,
0.266908, 2.936362, 1.55533, 1, 1, 1, 1, 1,
0.2718296, -0.4460764, 1.350479, 1, 1, 1, 1, 1,
0.2730002, -0.08457404, 1.820559, 1, 1, 1, 1, 1,
0.2735235, -0.4301974, 0.2132725, 1, 1, 1, 1, 1,
0.2786538, -0.1042643, 3.337217, 1, 1, 1, 1, 1,
0.2809213, 0.4746293, 0.3635788, 1, 1, 1, 1, 1,
0.2850094, 1.157915, -0.4739148, 1, 1, 1, 1, 1,
0.285611, -0.9726588, 2.673542, 1, 1, 1, 1, 1,
0.2860434, -1.102897, 3.495933, 1, 1, 1, 1, 1,
0.2887527, -0.6363212, 2.215538, 1, 1, 1, 1, 1,
0.2906477, 1.29507, 0.3103641, 1, 1, 1, 1, 1,
0.2918519, 0.8307231, 0.1798191, 0, 0, 1, 1, 1,
0.293329, 0.2988149, 0.4713936, 1, 0, 0, 1, 1,
0.2936339, -0.9370548, 2.769909, 1, 0, 0, 1, 1,
0.2963983, -0.06357693, 1.244142, 1, 0, 0, 1, 1,
0.2967351, -0.01301066, -0.3575818, 1, 0, 0, 1, 1,
0.296815, -0.1894854, 3.143594, 1, 0, 0, 1, 1,
0.2978901, 1.046405, -0.8623812, 0, 0, 0, 1, 1,
0.3007626, 1.031233, -0.6866375, 0, 0, 0, 1, 1,
0.3072958, -0.5915862, -0.4280861, 0, 0, 0, 1, 1,
0.3077745, 0.9866239, 0.3429515, 0, 0, 0, 1, 1,
0.3085576, 1.882957, 2.442634, 0, 0, 0, 1, 1,
0.3124178, 0.9356965, 1.41421, 0, 0, 0, 1, 1,
0.3170271, 0.530807, 0.8413712, 0, 0, 0, 1, 1,
0.3191772, 0.3696119, -0.1948879, 1, 1, 1, 1, 1,
0.3193558, 0.4457941, -0.7419093, 1, 1, 1, 1, 1,
0.3200517, 0.2315324, -0.01558955, 1, 1, 1, 1, 1,
0.3220713, -0.9178891, 3.046385, 1, 1, 1, 1, 1,
0.3225271, 0.3595435, -0.1845747, 1, 1, 1, 1, 1,
0.3231771, 0.315293, 0.6539475, 1, 1, 1, 1, 1,
0.3234032, -0.5903407, 2.76339, 1, 1, 1, 1, 1,
0.3269678, -0.5553587, 1.178015, 1, 1, 1, 1, 1,
0.3282963, 0.7990363, -0.01141881, 1, 1, 1, 1, 1,
0.3302391, -1.673875, 0.8306528, 1, 1, 1, 1, 1,
0.3310699, 0.8012537, 0.1542496, 1, 1, 1, 1, 1,
0.3318708, 1.247364, 0.1243954, 1, 1, 1, 1, 1,
0.3389126, -1.009057, 2.916437, 1, 1, 1, 1, 1,
0.339555, -0.6898782, 2.904607, 1, 1, 1, 1, 1,
0.3405468, -0.8779862, 2.936301, 1, 1, 1, 1, 1,
0.3427008, 0.3275264, 1.412095, 0, 0, 1, 1, 1,
0.3484776, -0.3180246, 1.511216, 1, 0, 0, 1, 1,
0.3485277, 0.4714913, 1.531866, 1, 0, 0, 1, 1,
0.3502526, -0.6937946, 0.5163512, 1, 0, 0, 1, 1,
0.3504154, 0.4888314, -1.236032, 1, 0, 0, 1, 1,
0.3526604, 1.465142, 0.9043192, 1, 0, 0, 1, 1,
0.355897, 0.5680692, 0.6163637, 0, 0, 0, 1, 1,
0.3637903, -1.641644, 3.016584, 0, 0, 0, 1, 1,
0.3664225, 0.8018919, 0.6385326, 0, 0, 0, 1, 1,
0.3699643, -1.022062, 1.594115, 0, 0, 0, 1, 1,
0.3715197, -0.178743, 2.08587, 0, 0, 0, 1, 1,
0.3730773, 0.1751422, 1.633598, 0, 0, 0, 1, 1,
0.3764683, -0.1034913, 2.176244, 0, 0, 0, 1, 1,
0.3790608, -0.2168055, 2.841129, 1, 1, 1, 1, 1,
0.3863014, 1.351869, 0.4991744, 1, 1, 1, 1, 1,
0.3874119, -1.942976, 2.869778, 1, 1, 1, 1, 1,
0.3953972, 1.767353, -0.2859401, 1, 1, 1, 1, 1,
0.4005319, 0.778618, 1.40646, 1, 1, 1, 1, 1,
0.4005623, 0.9167229, 1.071338, 1, 1, 1, 1, 1,
0.4013879, 1.357127, -0.3011457, 1, 1, 1, 1, 1,
0.4211544, 2.170681, -0.9327903, 1, 1, 1, 1, 1,
0.4248448, 1.525879, 1.108845, 1, 1, 1, 1, 1,
0.426536, -0.5414891, 2.243893, 1, 1, 1, 1, 1,
0.4301047, -0.7389105, 3.287764, 1, 1, 1, 1, 1,
0.4338808, 0.8456859, 1.323925, 1, 1, 1, 1, 1,
0.4365168, -0.6488094, 2.216859, 1, 1, 1, 1, 1,
0.4380211, -2.158275, 2.324585, 1, 1, 1, 1, 1,
0.4402191, 0.9182935, -0.2600909, 1, 1, 1, 1, 1,
0.4410964, -1.379441, 3.235231, 0, 0, 1, 1, 1,
0.4432165, 1.482167, 0.206389, 1, 0, 0, 1, 1,
0.4432914, -0.3613127, 2.946518, 1, 0, 0, 1, 1,
0.4460991, 0.3217345, 0.338801, 1, 0, 0, 1, 1,
0.4471246, 1.216471, 1.104546, 1, 0, 0, 1, 1,
0.4515848, -0.9787152, 2.380535, 1, 0, 0, 1, 1,
0.4527241, -1.045985, 2.474204, 0, 0, 0, 1, 1,
0.4560559, 0.3419642, 0.90864, 0, 0, 0, 1, 1,
0.4583758, 0.8751323, 0.5463095, 0, 0, 0, 1, 1,
0.459178, -1.115936, 3.43939, 0, 0, 0, 1, 1,
0.4681003, -0.4767563, 3.576807, 0, 0, 0, 1, 1,
0.4689093, 0.6647863, 0.926171, 0, 0, 0, 1, 1,
0.4708257, 0.8525559, 0.184446, 0, 0, 0, 1, 1,
0.4717253, 1.143973, 2.121936, 1, 1, 1, 1, 1,
0.474216, 1.455844, 0.04260934, 1, 1, 1, 1, 1,
0.4768839, -0.9896346, 2.479988, 1, 1, 1, 1, 1,
0.4782481, 1.488781, -0.2059302, 1, 1, 1, 1, 1,
0.4784988, -0.1318176, 2.944574, 1, 1, 1, 1, 1,
0.4788705, 0.3585872, 2.363666, 1, 1, 1, 1, 1,
0.4863481, 0.2393315, 2.335078, 1, 1, 1, 1, 1,
0.4883654, -0.5694515, 3.284591, 1, 1, 1, 1, 1,
0.4994896, 0.5528477, 0.8323177, 1, 1, 1, 1, 1,
0.5019158, 0.05342579, 1.658543, 1, 1, 1, 1, 1,
0.5057778, -0.7226332, 2.053611, 1, 1, 1, 1, 1,
0.5067536, 0.6531309, 1.159715, 1, 1, 1, 1, 1,
0.5118812, 0.3066637, 1.472784, 1, 1, 1, 1, 1,
0.5169129, -0.4412169, 4.129409, 1, 1, 1, 1, 1,
0.5188887, -0.7510895, 2.17292, 1, 1, 1, 1, 1,
0.526421, 0.02662572, 0.1882377, 0, 0, 1, 1, 1,
0.5340144, -1.430683, -0.01725731, 1, 0, 0, 1, 1,
0.5384908, 0.767532, 1.615955, 1, 0, 0, 1, 1,
0.5388308, -0.3117143, 1.362517, 1, 0, 0, 1, 1,
0.5392922, 1.360313, 1.473247, 1, 0, 0, 1, 1,
0.5428894, 1.900874, -1.108877, 1, 0, 0, 1, 1,
0.5522254, -1.883139, 2.989707, 0, 0, 0, 1, 1,
0.5529737, 0.6875232, 0.8780956, 0, 0, 0, 1, 1,
0.5532765, 0.3622806, 1.693795, 0, 0, 0, 1, 1,
0.5536242, 0.2137975, 2.135695, 0, 0, 0, 1, 1,
0.5536917, -0.5665859, 2.63113, 0, 0, 0, 1, 1,
0.5552948, -0.3481402, 1.23011, 0, 0, 0, 1, 1,
0.5554432, -1.268216, 3.800532, 0, 0, 0, 1, 1,
0.5584781, 0.2067901, 0.7078098, 1, 1, 1, 1, 1,
0.5630644, -0.2791461, 1.171919, 1, 1, 1, 1, 1,
0.5631286, -0.8516947, 1.701887, 1, 1, 1, 1, 1,
0.563444, -0.2987169, 2.893291, 1, 1, 1, 1, 1,
0.5699305, 0.6362092, 1.483496, 1, 1, 1, 1, 1,
0.5705247, 0.456562, 1.809261, 1, 1, 1, 1, 1,
0.5727903, -0.371482, 3.754747, 1, 1, 1, 1, 1,
0.5728955, -2.787946, 3.347569, 1, 1, 1, 1, 1,
0.5738699, 0.8449919, 1.100704, 1, 1, 1, 1, 1,
0.5751812, 0.4904103, -0.146667, 1, 1, 1, 1, 1,
0.5754373, 0.5169054, 0.6333703, 1, 1, 1, 1, 1,
0.5844578, 1.003848, 0.1276763, 1, 1, 1, 1, 1,
0.5854342, -0.1683498, 3.587973, 1, 1, 1, 1, 1,
0.5973706, -0.008106546, 1.602869, 1, 1, 1, 1, 1,
0.5989777, 2.031286, 1.346398, 1, 1, 1, 1, 1,
0.6097339, -1.011584, 2.007046, 0, 0, 1, 1, 1,
0.6129102, -0.8709952, 4.003155, 1, 0, 0, 1, 1,
0.6132973, -0.1365673, 0.4752731, 1, 0, 0, 1, 1,
0.6166058, 0.2443265, -0.2446414, 1, 0, 0, 1, 1,
0.6183494, 0.8266995, -0.133845, 1, 0, 0, 1, 1,
0.6196049, -1.290307, 4.924979, 1, 0, 0, 1, 1,
0.6215883, 0.455485, 1.182706, 0, 0, 0, 1, 1,
0.6217237, 0.4604192, 1.285167, 0, 0, 0, 1, 1,
0.6239685, 1.17286, 0.1902545, 0, 0, 0, 1, 1,
0.6245794, 0.4432075, 1.833602, 0, 0, 0, 1, 1,
0.6281085, 0.301351, 1.176528, 0, 0, 0, 1, 1,
0.6294541, 2.194901, -0.3077773, 0, 0, 0, 1, 1,
0.630442, -0.1353874, 2.441978, 0, 0, 0, 1, 1,
0.6340044, -0.3729882, 1.170439, 1, 1, 1, 1, 1,
0.6364492, 0.8766384, -1.134946, 1, 1, 1, 1, 1,
0.6400927, -0.3552998, 0.104383, 1, 1, 1, 1, 1,
0.6449762, 0.3415165, 0.9063025, 1, 1, 1, 1, 1,
0.6499031, -0.4174164, 2.589568, 1, 1, 1, 1, 1,
0.6503934, -0.5663851, 2.80965, 1, 1, 1, 1, 1,
0.6513141, -0.04768388, 1.25992, 1, 1, 1, 1, 1,
0.6519323, 1.929458, -1.171059, 1, 1, 1, 1, 1,
0.6574027, -1.342291, 2.512345, 1, 1, 1, 1, 1,
0.6591423, -0.6326756, 2.075939, 1, 1, 1, 1, 1,
0.6620291, 0.09393221, 1.536435, 1, 1, 1, 1, 1,
0.6651605, -0.2808542, 1.703957, 1, 1, 1, 1, 1,
0.6654804, 0.400439, 1.801772, 1, 1, 1, 1, 1,
0.6665838, -1.264347, 3.275284, 1, 1, 1, 1, 1,
0.6708312, 0.5831788, 1.321524, 1, 1, 1, 1, 1,
0.6811128, -0.02398203, 2.233003, 0, 0, 1, 1, 1,
0.6821287, -0.2743569, 1.077421, 1, 0, 0, 1, 1,
0.6837853, -0.6843532, 1.924841, 1, 0, 0, 1, 1,
0.6875522, 0.02835229, 1.092563, 1, 0, 0, 1, 1,
0.6919476, -1.456327, 1.427405, 1, 0, 0, 1, 1,
0.7000147, -0.5270234, 1.6815, 1, 0, 0, 1, 1,
0.702887, 2.295211, -1.2102, 0, 0, 0, 1, 1,
0.7031834, -1.042595, 3.677251, 0, 0, 0, 1, 1,
0.7120463, 1.547331, 1.169226, 0, 0, 0, 1, 1,
0.7132615, 0.04942368, -0.02425505, 0, 0, 0, 1, 1,
0.7169306, -0.4582306, 0.3677836, 0, 0, 0, 1, 1,
0.7379048, -0.2346138, 2.317423, 0, 0, 0, 1, 1,
0.7426749, 0.1258282, -0.710678, 0, 0, 0, 1, 1,
0.7438059, 0.4074472, 2.011133, 1, 1, 1, 1, 1,
0.7447034, -0.8364347, 2.564332, 1, 1, 1, 1, 1,
0.7468651, 0.1639415, 1.774289, 1, 1, 1, 1, 1,
0.7473783, 1.970523, 1.142646, 1, 1, 1, 1, 1,
0.7474638, -1.305544, 4.773427, 1, 1, 1, 1, 1,
0.7500877, -0.5013548, 1.334733, 1, 1, 1, 1, 1,
0.7515701, -0.003511047, 1.043382, 1, 1, 1, 1, 1,
0.752629, 0.2757061, 3.482681, 1, 1, 1, 1, 1,
0.7539366, -0.2982765, 3.383115, 1, 1, 1, 1, 1,
0.7551941, 0.1852095, 2.199632, 1, 1, 1, 1, 1,
0.7558197, -0.694632, 0.6306174, 1, 1, 1, 1, 1,
0.7624103, -1.205642, 2.025847, 1, 1, 1, 1, 1,
0.766115, -0.2204857, 2.365375, 1, 1, 1, 1, 1,
0.7666156, -2.082631, 2.146226, 1, 1, 1, 1, 1,
0.7685712, 0.7173434, 0.3321447, 1, 1, 1, 1, 1,
0.7689117, 1.218442, 0.5953232, 0, 0, 1, 1, 1,
0.7717493, -0.4494024, 2.895864, 1, 0, 0, 1, 1,
0.7739637, 0.7218786, -0.4885852, 1, 0, 0, 1, 1,
0.7767962, -1.62702, 1.885386, 1, 0, 0, 1, 1,
0.7772925, -0.2969955, 3.023221, 1, 0, 0, 1, 1,
0.7787712, -0.494372, 3.571061, 1, 0, 0, 1, 1,
0.8045003, -0.7602196, 2.070883, 0, 0, 0, 1, 1,
0.8147293, -0.4003095, 0.7312281, 0, 0, 0, 1, 1,
0.8147601, -1.144322, 1.132991, 0, 0, 0, 1, 1,
0.8157786, 0.1857526, -0.2063307, 0, 0, 0, 1, 1,
0.8210006, 0.7522231, 1.262397, 0, 0, 0, 1, 1,
0.8337939, -0.4227085, 2.491162, 0, 0, 0, 1, 1,
0.8354565, 2.140108, -0.4348603, 0, 0, 0, 1, 1,
0.8412512, -0.3516454, 0.3106306, 1, 1, 1, 1, 1,
0.8442112, 1.81638, 0.5868598, 1, 1, 1, 1, 1,
0.8454645, 0.8478237, 3.987644, 1, 1, 1, 1, 1,
0.850893, 0.8024759, -1.144367, 1, 1, 1, 1, 1,
0.8552077, -0.6818267, 3.352778, 1, 1, 1, 1, 1,
0.8576323, 0.2998761, 0.9750119, 1, 1, 1, 1, 1,
0.8577695, -0.7277026, 3.243804, 1, 1, 1, 1, 1,
0.8595837, -0.5100698, 3.812362, 1, 1, 1, 1, 1,
0.8799101, -0.281724, 1.438316, 1, 1, 1, 1, 1,
0.8801816, 0.2999685, 0.9627501, 1, 1, 1, 1, 1,
0.8826846, -0.1347026, 3.513545, 1, 1, 1, 1, 1,
0.8896372, 0.6783202, 1.213877, 1, 1, 1, 1, 1,
0.8943728, 0.1856826, 0.1864213, 1, 1, 1, 1, 1,
0.895382, 0.6826152, 0.625678, 1, 1, 1, 1, 1,
0.8959578, -0.3650096, 0.4764199, 1, 1, 1, 1, 1,
0.8971722, 0.4898444, 1.470817, 0, 0, 1, 1, 1,
0.9061, 0.282441, 3.214601, 1, 0, 0, 1, 1,
0.9090765, 1.323841, 0.8773147, 1, 0, 0, 1, 1,
0.9127793, 0.4658709, -0.4365101, 1, 0, 0, 1, 1,
0.9128292, -0.2040493, 1.065703, 1, 0, 0, 1, 1,
0.9259338, -0.6412467, 2.961977, 1, 0, 0, 1, 1,
0.9287339, -0.8747309, 2.505349, 0, 0, 0, 1, 1,
0.941451, 0.8677207, 0.3140195, 0, 0, 0, 1, 1,
0.9436177, 0.2176295, 0.7734591, 0, 0, 0, 1, 1,
0.9455608, -0.4322623, 2.096457, 0, 0, 0, 1, 1,
0.9549325, 1.030304, 1.204264, 0, 0, 0, 1, 1,
0.9550163, -0.5141025, 3.577408, 0, 0, 0, 1, 1,
0.9557858, 1.493132, -0.3784528, 0, 0, 0, 1, 1,
0.956576, 1.770052, -0.2899765, 1, 1, 1, 1, 1,
0.964587, -1.085982, 2.538789, 1, 1, 1, 1, 1,
0.9649652, -2.457263, 3.35977, 1, 1, 1, 1, 1,
0.9652575, -0.1316982, 0.9824762, 1, 1, 1, 1, 1,
0.9688492, -0.7349957, 2.257553, 1, 1, 1, 1, 1,
0.971183, -0.01898772, -0.1179493, 1, 1, 1, 1, 1,
0.9729074, 0.1437936, 1.086251, 1, 1, 1, 1, 1,
0.9756818, 0.8402963, 2.041975, 1, 1, 1, 1, 1,
0.9774666, -1.151803, 2.523527, 1, 1, 1, 1, 1,
0.9801603, 0.3931375, -1.955611, 1, 1, 1, 1, 1,
0.9815159, -0.7428637, 2.916715, 1, 1, 1, 1, 1,
0.9830451, 0.170121, -0.1968079, 1, 1, 1, 1, 1,
0.9969407, 1.276615, -0.3737766, 1, 1, 1, 1, 1,
0.9976628, -0.7264443, 4.691879, 1, 1, 1, 1, 1,
0.997963, 0.3748126, 1.397975, 1, 1, 1, 1, 1,
1.004132, -0.663044, 3.090676, 0, 0, 1, 1, 1,
1.006871, 0.1895302, 0.9025247, 1, 0, 0, 1, 1,
1.009892, 0.0241944, 2.233835, 1, 0, 0, 1, 1,
1.010074, -1.149118, 3.512685, 1, 0, 0, 1, 1,
1.010572, -1.011641, 2.439101, 1, 0, 0, 1, 1,
1.019799, -0.3098112, 2.982977, 1, 0, 0, 1, 1,
1.019922, -0.68575, 2.237142, 0, 0, 0, 1, 1,
1.020075, 1.874433, -0.01848703, 0, 0, 0, 1, 1,
1.02326, -0.6837807, 1.370425, 0, 0, 0, 1, 1,
1.023298, -0.7709693, 1.369101, 0, 0, 0, 1, 1,
1.023516, -1.201609, 4.68517, 0, 0, 0, 1, 1,
1.029084, 0.8839983, 0.2815706, 0, 0, 0, 1, 1,
1.032862, -0.1228093, 1.388747, 0, 0, 0, 1, 1,
1.033539, 0.1663858, 1.702617, 1, 1, 1, 1, 1,
1.033927, 0.5747234, 1.382605, 1, 1, 1, 1, 1,
1.035469, 0.01500869, 1.541147, 1, 1, 1, 1, 1,
1.036482, -0.8631654, 4.343219, 1, 1, 1, 1, 1,
1.038028, 0.4301129, 2.04423, 1, 1, 1, 1, 1,
1.043595, 0.01937126, 1.242211, 1, 1, 1, 1, 1,
1.045133, -0.4267887, 1.179607, 1, 1, 1, 1, 1,
1.046927, 2.010523, 1.329591, 1, 1, 1, 1, 1,
1.049477, 0.726711, 1.615083, 1, 1, 1, 1, 1,
1.053781, 1.234998, 0.8736631, 1, 1, 1, 1, 1,
1.054975, 1.028543, 0.9496293, 1, 1, 1, 1, 1,
1.055874, -0.7345545, 1.04899, 1, 1, 1, 1, 1,
1.072438, -0.3099971, 3.24646, 1, 1, 1, 1, 1,
1.074294, 0.8813429, -0.02755529, 1, 1, 1, 1, 1,
1.079832, -0.4365445, 0.9761814, 1, 1, 1, 1, 1,
1.085764, 0.4898707, 1.550817, 0, 0, 1, 1, 1,
1.088194, 1.302005, 0.8970365, 1, 0, 0, 1, 1,
1.091375, -0.7639496, 1.758532, 1, 0, 0, 1, 1,
1.092119, 0.0306531, 2.27595, 1, 0, 0, 1, 1,
1.093472, 0.2637056, 1.413613, 1, 0, 0, 1, 1,
1.096302, -1.118655, 1.683051, 1, 0, 0, 1, 1,
1.101032, -0.2168666, 1.543156, 0, 0, 0, 1, 1,
1.110506, 1.705854, -0.2811292, 0, 0, 0, 1, 1,
1.114056, -2.819026, 2.704852, 0, 0, 0, 1, 1,
1.116757, 0.7022921, 0.6608405, 0, 0, 0, 1, 1,
1.119528, -0.1283104, 0.2151861, 0, 0, 0, 1, 1,
1.124688, 0.566874, 2.372058, 0, 0, 0, 1, 1,
1.12733, -1.265929, 2.651138, 0, 0, 0, 1, 1,
1.127533, -0.2774112, 2.307751, 1, 1, 1, 1, 1,
1.128094, -1.896786, 3.235233, 1, 1, 1, 1, 1,
1.128362, -0.01397535, 0.958364, 1, 1, 1, 1, 1,
1.139424, -0.07547823, 2.022262, 1, 1, 1, 1, 1,
1.140388, 0.2488434, 1.612664, 1, 1, 1, 1, 1,
1.148506, 1.070579, -0.9459675, 1, 1, 1, 1, 1,
1.150534, 0.6225769, 0.5509526, 1, 1, 1, 1, 1,
1.154462, 1.471146, 0.5312157, 1, 1, 1, 1, 1,
1.154579, 0.5998209, 0.6295137, 1, 1, 1, 1, 1,
1.160374, -1.474393, 2.653525, 1, 1, 1, 1, 1,
1.161445, -0.4546472, 3.990761, 1, 1, 1, 1, 1,
1.167377, -0.2416916, -0.1984059, 1, 1, 1, 1, 1,
1.179202, -0.5820854, 1.946049, 1, 1, 1, 1, 1,
1.184891, 0.1461247, 1.91669, 1, 1, 1, 1, 1,
1.202473, 0.4897437, 0.6325822, 1, 1, 1, 1, 1,
1.204713, 0.0238286, 0.6302684, 0, 0, 1, 1, 1,
1.217648, -0.1137267, 1.46102, 1, 0, 0, 1, 1,
1.221698, -1.133691, 2.454859, 1, 0, 0, 1, 1,
1.222027, 1.919408, 0.06433388, 1, 0, 0, 1, 1,
1.252918, 2.017142, -0.8093625, 1, 0, 0, 1, 1,
1.253017, -0.3656356, 2.136173, 1, 0, 0, 1, 1,
1.258888, -1.878565, 3.831237, 0, 0, 0, 1, 1,
1.261797, -0.5502453, 1.598605, 0, 0, 0, 1, 1,
1.262698, 0.5703004, 2.829815, 0, 0, 0, 1, 1,
1.265162, -0.4218673, 3.021074, 0, 0, 0, 1, 1,
1.265348, 1.198415, 1.327836, 0, 0, 0, 1, 1,
1.282096, -0.601062, 3.009061, 0, 0, 0, 1, 1,
1.284202, -0.8091664, 2.636659, 0, 0, 0, 1, 1,
1.312063, -0.4125201, 0.6895692, 1, 1, 1, 1, 1,
1.326586, 0.613188, 2.533035, 1, 1, 1, 1, 1,
1.333943, -0.4794496, 2.230903, 1, 1, 1, 1, 1,
1.334638, -1.496342, 3.340041, 1, 1, 1, 1, 1,
1.346725, -1.242776, 2.753756, 1, 1, 1, 1, 1,
1.353484, -1.38595, 1.512637, 1, 1, 1, 1, 1,
1.361979, 0.7543521, 0.6108851, 1, 1, 1, 1, 1,
1.372768, 1.092387, 0.9586123, 1, 1, 1, 1, 1,
1.374872, 1.985587, 0.8919121, 1, 1, 1, 1, 1,
1.382095, 1.16046, 1.312054, 1, 1, 1, 1, 1,
1.384121, 1.653968, 0.8039747, 1, 1, 1, 1, 1,
1.387217, 0.9185776, 0.4664016, 1, 1, 1, 1, 1,
1.392032, 0.5926048, 0.5668412, 1, 1, 1, 1, 1,
1.400565, -1.234553, 1.307011, 1, 1, 1, 1, 1,
1.401814, 1.06158, 1.511175, 1, 1, 1, 1, 1,
1.407708, 0.1386706, 2.022608, 0, 0, 1, 1, 1,
1.412373, 0.1056549, 1.129638, 1, 0, 0, 1, 1,
1.418216, 0.702747, 0.1068117, 1, 0, 0, 1, 1,
1.419736, 0.5808371, -0.341474, 1, 0, 0, 1, 1,
1.420569, -1.946123, 2.646411, 1, 0, 0, 1, 1,
1.431019, 0.3274099, -1.187723, 1, 0, 0, 1, 1,
1.434704, -0.329486, 1.684656, 0, 0, 0, 1, 1,
1.441297, -0.9363006, 1.280573, 0, 0, 0, 1, 1,
1.442044, -1.383189, 2.696855, 0, 0, 0, 1, 1,
1.456941, 0.1797612, 1.11877, 0, 0, 0, 1, 1,
1.458422, 0.8068237, 0.885779, 0, 0, 0, 1, 1,
1.465079, -0.4709507, 1.96699, 0, 0, 0, 1, 1,
1.465665, 1.451481, 0.1985042, 0, 0, 0, 1, 1,
1.468975, 0.09747279, 3.394543, 1, 1, 1, 1, 1,
1.473013, -1.350857, 2.771083, 1, 1, 1, 1, 1,
1.485292, 2.089429, -0.6102625, 1, 1, 1, 1, 1,
1.499589, 0.4661874, 1.085551, 1, 1, 1, 1, 1,
1.502734, -0.82749, 1.367683, 1, 1, 1, 1, 1,
1.522021, 0.5639561, 1.478447, 1, 1, 1, 1, 1,
1.525164, -0.1427988, 0.9332311, 1, 1, 1, 1, 1,
1.530607, 0.8610311, -0.1147474, 1, 1, 1, 1, 1,
1.535819, -0.9812232, 3.246581, 1, 1, 1, 1, 1,
1.551054, -1.252938, 1.713964, 1, 1, 1, 1, 1,
1.55468, -0.4634148, 2.202371, 1, 1, 1, 1, 1,
1.560554, -1.606998, 2.057833, 1, 1, 1, 1, 1,
1.561912, 0.635487, 1.452601, 1, 1, 1, 1, 1,
1.593317, -0.960905, 1.260476, 1, 1, 1, 1, 1,
1.598068, -1.009861, 2.621238, 1, 1, 1, 1, 1,
1.606196, 1.828782, 0.2117809, 0, 0, 1, 1, 1,
1.612048, 0.4853942, 0.884367, 1, 0, 0, 1, 1,
1.613117, 2.486338, -0.9559271, 1, 0, 0, 1, 1,
1.637558, -0.2113165, 0.3487509, 1, 0, 0, 1, 1,
1.648317, -0.6278663, 0.9715303, 1, 0, 0, 1, 1,
1.669521, -1.66468, 2.173573, 1, 0, 0, 1, 1,
1.701354, -0.4354181, 2.589494, 0, 0, 0, 1, 1,
1.701438, -1.531692, 1.681033, 0, 0, 0, 1, 1,
1.733108, -0.09587543, 1.018467, 0, 0, 0, 1, 1,
1.735109, -0.08543689, 1.035106, 0, 0, 0, 1, 1,
1.767789, 1.809195, 1.322187, 0, 0, 0, 1, 1,
1.775003, 0.5713627, 0.9053175, 0, 0, 0, 1, 1,
1.790782, 0.6809994, 1.697243, 0, 0, 0, 1, 1,
1.792015, 1.539787, 2.430978, 1, 1, 1, 1, 1,
1.837769, -1.535817, 1.584546, 1, 1, 1, 1, 1,
1.864539, 0.4928982, 2.634942, 1, 1, 1, 1, 1,
1.894469, 1.217622, 1.96682, 1, 1, 1, 1, 1,
1.901234, 1.279376, 1.167302, 1, 1, 1, 1, 1,
1.912633, 1.665929, 0.9247579, 1, 1, 1, 1, 1,
1.919645, 0.3078798, -0.2370382, 1, 1, 1, 1, 1,
1.928995, 1.400035, 1.360446, 1, 1, 1, 1, 1,
1.934629, 0.9101468, -0.842669, 1, 1, 1, 1, 1,
1.978287, -1.408881, 2.764151, 1, 1, 1, 1, 1,
1.983973, 1.190084, 0.4436176, 1, 1, 1, 1, 1,
1.989892, 1.104579, 0.7759755, 1, 1, 1, 1, 1,
1.999094, -0.106342, 0.08781438, 1, 1, 1, 1, 1,
2.039846, -1.109248, 2.601364, 1, 1, 1, 1, 1,
2.040467, 1.082547, 0.5744914, 1, 1, 1, 1, 1,
2.041842, -1.628953, 2.911729, 0, 0, 1, 1, 1,
2.047111, -0.510583, 1.180689, 1, 0, 0, 1, 1,
2.077346, 0.9303149, 2.005649, 1, 0, 0, 1, 1,
2.110496, -0.4929583, 0.01586421, 1, 0, 0, 1, 1,
2.11588, 1.335075, 0.9556381, 1, 0, 0, 1, 1,
2.121362, 1.285571, 2.967556, 1, 0, 0, 1, 1,
2.124108, 1.010638, 0.959962, 0, 0, 0, 1, 1,
2.191908, 0.1990916, 2.143263, 0, 0, 0, 1, 1,
2.201329, -0.6342645, 2.08929, 0, 0, 0, 1, 1,
2.34417, 2.529514, 0.5990931, 0, 0, 0, 1, 1,
2.4439, -0.5492646, 3.324415, 0, 0, 0, 1, 1,
2.455797, -0.6417255, 2.632236, 0, 0, 0, 1, 1,
2.473497, -0.4916874, 4.002062, 0, 0, 0, 1, 1,
2.582336, 0.7237136, 1.133907, 1, 1, 1, 1, 1,
2.582786, -0.8932469, 2.288013, 1, 1, 1, 1, 1,
2.59317, 0.6303635, 1.235202, 1, 1, 1, 1, 1,
2.621279, 1.160055, 2.993301, 1, 1, 1, 1, 1,
2.888123, 0.4047675, 0.2357521, 1, 1, 1, 1, 1,
3.131595, 0.01573989, 1.632205, 1, 1, 1, 1, 1,
3.148746, -0.293764, 2.394021, 1, 1, 1, 1, 1
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
var radius = 9.337018;
var distance = 32.79588;
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
mvMatrix.translate( -0.06362104, 0.01578355, 0.1007683 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.79588);
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
