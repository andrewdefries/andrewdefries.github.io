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
-2.931816, 0.2171889, -1.292888, 1, 0, 0, 1,
-2.793197, -1.015487, -3.945219, 1, 0.007843138, 0, 1,
-2.690754, -1.975193, -1.155836, 1, 0.01176471, 0, 1,
-2.496918, -0.2085555, -1.764364, 1, 0.01960784, 0, 1,
-2.493243, 0.1388222, -0.6488973, 1, 0.02352941, 0, 1,
-2.484474, 1.073677, -1.347852, 1, 0.03137255, 0, 1,
-2.376282, 1.446184, -1.096165, 1, 0.03529412, 0, 1,
-2.339472, 0.2445796, -0.885536, 1, 0.04313726, 0, 1,
-2.330597, -0.530937, -2.934946, 1, 0.04705882, 0, 1,
-2.324755, -0.1814686, -1.999575, 1, 0.05490196, 0, 1,
-2.31803, -0.7439693, -1.890689, 1, 0.05882353, 0, 1,
-2.270325, 1.069428, -1.121629, 1, 0.06666667, 0, 1,
-2.261656, -1.015157, -2.476399, 1, 0.07058824, 0, 1,
-2.247779, -1.606493, -1.291366, 1, 0.07843138, 0, 1,
-2.175754, 1.203841, -0.9585686, 1, 0.08235294, 0, 1,
-2.142375, 1.141282, -0.5727416, 1, 0.09019608, 0, 1,
-2.133376, 0.324257, 0.07104961, 1, 0.09411765, 0, 1,
-2.127237, -0.7411591, -2.425217, 1, 0.1019608, 0, 1,
-2.10069, -0.07514656, -2.700544, 1, 0.1098039, 0, 1,
-2.094146, 0.168438, -0.07719087, 1, 0.1137255, 0, 1,
-2.088483, -0.4619384, 0.06885429, 1, 0.1215686, 0, 1,
-2.074886, 0.9831688, -0.3713796, 1, 0.1254902, 0, 1,
-2.045739, -1.497987, -3.368893, 1, 0.1333333, 0, 1,
-2.04313, 0.273825, 0.02654275, 1, 0.1372549, 0, 1,
-2.019974, -1.21684, -4.386901, 1, 0.145098, 0, 1,
-1.993033, -0.3292154, -0.3401114, 1, 0.1490196, 0, 1,
-1.95137, 0.1113533, -0.8274671, 1, 0.1568628, 0, 1,
-1.924149, 1.09748, -1.546633, 1, 0.1607843, 0, 1,
-1.874858, 0.5908141, -1.704655, 1, 0.1686275, 0, 1,
-1.871584, -0.01268795, -1.947497, 1, 0.172549, 0, 1,
-1.867545, 1.23895, -2.23598, 1, 0.1803922, 0, 1,
-1.863325, -0.2857808, -2.021097, 1, 0.1843137, 0, 1,
-1.847869, 0.001046655, -1.009466, 1, 0.1921569, 0, 1,
-1.845055, 0.3283492, -2.933458, 1, 0.1960784, 0, 1,
-1.831436, 1.578255, 1.202806, 1, 0.2039216, 0, 1,
-1.828713, 0.4873758, -2.569367, 1, 0.2117647, 0, 1,
-1.820026, 0.5605558, -0.4961953, 1, 0.2156863, 0, 1,
-1.797157, -0.3722229, -3.516795, 1, 0.2235294, 0, 1,
-1.784406, 0.6297625, -1.852658, 1, 0.227451, 0, 1,
-1.763792, 0.03777689, -1.824064, 1, 0.2352941, 0, 1,
-1.74153, -1.106194, -1.284006, 1, 0.2392157, 0, 1,
-1.739966, 0.9715516, 0.559145, 1, 0.2470588, 0, 1,
-1.713701, 0.04121154, -0.5870841, 1, 0.2509804, 0, 1,
-1.695078, -0.04935831, -1.079515, 1, 0.2588235, 0, 1,
-1.695069, -0.03710685, -2.63773, 1, 0.2627451, 0, 1,
-1.686319, -1.097069, -2.599242, 1, 0.2705882, 0, 1,
-1.650158, -0.4045664, 0.2266146, 1, 0.2745098, 0, 1,
-1.642175, -0.836447, -2.582011, 1, 0.282353, 0, 1,
-1.616824, 0.625238, 0.2608274, 1, 0.2862745, 0, 1,
-1.614728, -0.0844345, -1.657833, 1, 0.2941177, 0, 1,
-1.588876, 0.003596667, -0.6881747, 1, 0.3019608, 0, 1,
-1.584489, 0.6719868, -1.916147, 1, 0.3058824, 0, 1,
-1.561337, 0.3796945, -2.867334, 1, 0.3137255, 0, 1,
-1.561243, -2.022274, -2.589826, 1, 0.3176471, 0, 1,
-1.556125, 0.372371, -2.514526, 1, 0.3254902, 0, 1,
-1.550802, -0.342101, -1.113833, 1, 0.3294118, 0, 1,
-1.550186, 0.365437, -0.2274504, 1, 0.3372549, 0, 1,
-1.537016, 0.9404305, -1.666384, 1, 0.3411765, 0, 1,
-1.529789, 0.259035, -0.2176422, 1, 0.3490196, 0, 1,
-1.521602, -0.6863278, -2.983198, 1, 0.3529412, 0, 1,
-1.521229, -0.3638778, -0.7520061, 1, 0.3607843, 0, 1,
-1.51963, 0.5375144, -0.007358366, 1, 0.3647059, 0, 1,
-1.516181, -0.4318799, -1.24762, 1, 0.372549, 0, 1,
-1.504029, -0.8508645, -1.37942, 1, 0.3764706, 0, 1,
-1.486405, 0.06357407, -2.858297, 1, 0.3843137, 0, 1,
-1.485859, 0.3789049, -1.709553, 1, 0.3882353, 0, 1,
-1.485336, -1.45548, -1.274679, 1, 0.3960784, 0, 1,
-1.484167, -0.867044, -1.393925, 1, 0.4039216, 0, 1,
-1.480641, 1.244165, -1.635486, 1, 0.4078431, 0, 1,
-1.478601, 1.157316, -1.001022, 1, 0.4156863, 0, 1,
-1.476349, -0.8599975, -2.063752, 1, 0.4196078, 0, 1,
-1.472543, -1.133719, -2.506506, 1, 0.427451, 0, 1,
-1.44856, -1.377959, -1.392772, 1, 0.4313726, 0, 1,
-1.429644, 1.052024, -1.501948, 1, 0.4392157, 0, 1,
-1.429177, -0.4995866, -1.068831, 1, 0.4431373, 0, 1,
-1.427385, 0.8530653, -1.089176, 1, 0.4509804, 0, 1,
-1.422481, 1.014066, -1.892243, 1, 0.454902, 0, 1,
-1.403575, 0.1833209, -2.031884, 1, 0.4627451, 0, 1,
-1.402135, -0.9294286, -1.710538, 1, 0.4666667, 0, 1,
-1.392426, 2.716572, -0.07970367, 1, 0.4745098, 0, 1,
-1.386665, 0.7468671, -0.6671258, 1, 0.4784314, 0, 1,
-1.379405, 0.5099088, -0.5304853, 1, 0.4862745, 0, 1,
-1.361252, 0.8036039, -0.4733765, 1, 0.4901961, 0, 1,
-1.360132, -0.7593107, -0.5462373, 1, 0.4980392, 0, 1,
-1.356598, 1.513235, -1.525767, 1, 0.5058824, 0, 1,
-1.355873, 0.8002988, -0.2444418, 1, 0.509804, 0, 1,
-1.34332, 1.428253, -1.432542, 1, 0.5176471, 0, 1,
-1.338565, -0.4841361, -1.789244, 1, 0.5215687, 0, 1,
-1.338087, 0.9388227, -1.269413, 1, 0.5294118, 0, 1,
-1.329484, 0.1671644, -0.5031097, 1, 0.5333334, 0, 1,
-1.324875, -2.309753, -0.9531972, 1, 0.5411765, 0, 1,
-1.316737, 0.2775198, -1.658399, 1, 0.5450981, 0, 1,
-1.316306, -0.3692241, -3.131417, 1, 0.5529412, 0, 1,
-1.307796, -0.3259607, -2.8314, 1, 0.5568628, 0, 1,
-1.298503, 2.111339, -0.8177186, 1, 0.5647059, 0, 1,
-1.2985, 0.2940317, -1.166301, 1, 0.5686275, 0, 1,
-1.296126, -1.094166, -1.92972, 1, 0.5764706, 0, 1,
-1.29397, -0.1779944, -2.256988, 1, 0.5803922, 0, 1,
-1.283428, 1.064967, 0.2483598, 1, 0.5882353, 0, 1,
-1.282577, -1.570989, -2.544578, 1, 0.5921569, 0, 1,
-1.279168, -0.01673233, -1.343578, 1, 0.6, 0, 1,
-1.278018, 0.5549242, -2.192298, 1, 0.6078432, 0, 1,
-1.27208, 0.07582635, -2.545943, 1, 0.6117647, 0, 1,
-1.268258, 0.6365626, 0.6316877, 1, 0.6196079, 0, 1,
-1.262679, -1.028035, -3.006889, 1, 0.6235294, 0, 1,
-1.256832, 1.061651, -1.305455, 1, 0.6313726, 0, 1,
-1.250206, -0.2965657, -2.17335, 1, 0.6352941, 0, 1,
-1.238854, -0.07561338, -1.731899, 1, 0.6431373, 0, 1,
-1.235116, 1.184652, -0.4790967, 1, 0.6470588, 0, 1,
-1.234422, -0.7900626, -1.484136, 1, 0.654902, 0, 1,
-1.230247, 0.4030904, -2.138702, 1, 0.6588235, 0, 1,
-1.226895, -0.1823331, -1.075723, 1, 0.6666667, 0, 1,
-1.225106, 0.5907239, -0.6826376, 1, 0.6705883, 0, 1,
-1.221796, -0.9437176, -2.869096, 1, 0.6784314, 0, 1,
-1.220167, -0.6877713, -1.72929, 1, 0.682353, 0, 1,
-1.210483, -1.424744, -2.541498, 1, 0.6901961, 0, 1,
-1.209773, 0.0477751, -0.5393436, 1, 0.6941177, 0, 1,
-1.202538, -0.3089745, -2.236058, 1, 0.7019608, 0, 1,
-1.198788, -1.323913, -1.926002, 1, 0.7098039, 0, 1,
-1.197425, 0.4895768, -1.833791, 1, 0.7137255, 0, 1,
-1.187125, -0.7065936, -1.51784, 1, 0.7215686, 0, 1,
-1.185261, -0.2523193, -1.195508, 1, 0.7254902, 0, 1,
-1.179713, 0.08374999, -2.264027, 1, 0.7333333, 0, 1,
-1.173547, 2.581921, 0.2080341, 1, 0.7372549, 0, 1,
-1.164714, 1.829605, 1.968171, 1, 0.7450981, 0, 1,
-1.151174, 0.7945433, 0.2936209, 1, 0.7490196, 0, 1,
-1.14854, -0.5982241, -2.258632, 1, 0.7568628, 0, 1,
-1.14707, 0.666177, -1.844372, 1, 0.7607843, 0, 1,
-1.144108, 0.8841583, 0.03211778, 1, 0.7686275, 0, 1,
-1.121556, -0.9814257, -1.910883, 1, 0.772549, 0, 1,
-1.102703, 0.08640921, 0.2390616, 1, 0.7803922, 0, 1,
-1.099557, -0.4025298, -1.809641, 1, 0.7843137, 0, 1,
-1.095334, -1.30054, -2.132578, 1, 0.7921569, 0, 1,
-1.082157, -0.2007062, -1.115654, 1, 0.7960784, 0, 1,
-1.08119, 1.02745, -0.7379134, 1, 0.8039216, 0, 1,
-1.066412, 0.3867392, -2.592897, 1, 0.8117647, 0, 1,
-1.064465, 0.06386811, -2.192153, 1, 0.8156863, 0, 1,
-1.06088, 0.2399372, 0.3548592, 1, 0.8235294, 0, 1,
-1.060377, 1.576701, -1.369831, 1, 0.827451, 0, 1,
-1.058539, -0.3473971, 0.4535405, 1, 0.8352941, 0, 1,
-1.054344, 0.1574149, -1.560143, 1, 0.8392157, 0, 1,
-1.052743, 0.1571565, -1.669002, 1, 0.8470588, 0, 1,
-1.04845, 0.4705985, -0.03041191, 1, 0.8509804, 0, 1,
-1.042987, -0.02360051, -2.650479, 1, 0.8588235, 0, 1,
-1.036848, -1.123556, -2.074082, 1, 0.8627451, 0, 1,
-1.035655, 0.4196793, 0.6958461, 1, 0.8705882, 0, 1,
-1.033833, 0.4689869, -1.579446, 1, 0.8745098, 0, 1,
-1.031954, 0.1588184, -1.349421, 1, 0.8823529, 0, 1,
-1.026433, -0.130033, -1.630795, 1, 0.8862745, 0, 1,
-1.024979, -1.357855, -3.150268, 1, 0.8941177, 0, 1,
-1.023107, -0.3634675, -2.304467, 1, 0.8980392, 0, 1,
-1.014818, 0.4803783, -1.419949, 1, 0.9058824, 0, 1,
-1.010895, 0.1480943, -2.692526, 1, 0.9137255, 0, 1,
-1.010848, -0.4242291, -3.300008, 1, 0.9176471, 0, 1,
-1.004803, -1.670685, -0.855523, 1, 0.9254902, 0, 1,
-1.003795, -1.496805, -2.402204, 1, 0.9294118, 0, 1,
-1.000507, -0.5702828, -2.324553, 1, 0.9372549, 0, 1,
-0.9976574, -0.02911737, -2.092368, 1, 0.9411765, 0, 1,
-0.9957342, 0.04246996, -0.9798068, 1, 0.9490196, 0, 1,
-0.9949179, -1.267704, -2.346761, 1, 0.9529412, 0, 1,
-0.9940908, 0.8749594, -1.094873, 1, 0.9607843, 0, 1,
-0.9916145, -0.6912576, -3.017983, 1, 0.9647059, 0, 1,
-0.9850926, 0.05713945, -2.457311, 1, 0.972549, 0, 1,
-0.9787744, 0.2164362, -3.112056, 1, 0.9764706, 0, 1,
-0.9724798, -0.1057793, -2.42274, 1, 0.9843137, 0, 1,
-0.9662217, -0.2321564, -0.2960067, 1, 0.9882353, 0, 1,
-0.9613101, -2.249671, -3.533917, 1, 0.9960784, 0, 1,
-0.9596951, -0.9663064, -1.77467, 0.9960784, 1, 0, 1,
-0.9560549, -0.07928042, -1.927467, 0.9921569, 1, 0, 1,
-0.9557213, 0.2569996, -0.08029381, 0.9843137, 1, 0, 1,
-0.9555972, 1.387301, -0.2976649, 0.9803922, 1, 0, 1,
-0.9389647, -0.7232763, -2.460998, 0.972549, 1, 0, 1,
-0.9318042, 0.4595944, 1.405178, 0.9686275, 1, 0, 1,
-0.9250332, 0.07528231, -1.278109, 0.9607843, 1, 0, 1,
-0.9200305, -0.4129058, -2.095923, 0.9568627, 1, 0, 1,
-0.9168215, -1.602115, 0.5667101, 0.9490196, 1, 0, 1,
-0.9106971, 0.6317577, 0.3682963, 0.945098, 1, 0, 1,
-0.9086758, 0.7489836, -3.660134, 0.9372549, 1, 0, 1,
-0.9071265, -0.7898318, -1.664176, 0.9333333, 1, 0, 1,
-0.9007807, -0.7428905, -0.6954989, 0.9254902, 1, 0, 1,
-0.8989933, 0.9482527, -1.167528, 0.9215686, 1, 0, 1,
-0.8919305, -0.2258982, -1.29961, 0.9137255, 1, 0, 1,
-0.8906629, -0.7718679, -3.301323, 0.9098039, 1, 0, 1,
-0.887629, -1.803547, -3.047052, 0.9019608, 1, 0, 1,
-0.8777015, -0.6246883, -2.159303, 0.8941177, 1, 0, 1,
-0.8668495, -0.02368178, -1.494653, 0.8901961, 1, 0, 1,
-0.8656439, 0.1416808, -0.6093658, 0.8823529, 1, 0, 1,
-0.8603487, -0.1432745, -2.196143, 0.8784314, 1, 0, 1,
-0.8593872, -0.1447889, -2.592485, 0.8705882, 1, 0, 1,
-0.8564051, 0.7823371, -1.91746, 0.8666667, 1, 0, 1,
-0.8530006, 0.8217852, 0.232881, 0.8588235, 1, 0, 1,
-0.8494071, 0.6119545, -2.275179, 0.854902, 1, 0, 1,
-0.8483236, 0.3627057, -2.275417, 0.8470588, 1, 0, 1,
-0.8452948, 0.4338532, -1.336408, 0.8431373, 1, 0, 1,
-0.8425643, -0.5659762, -1.616147, 0.8352941, 1, 0, 1,
-0.8413256, 0.3337794, -1.160359, 0.8313726, 1, 0, 1,
-0.8410426, -0.7865971, -4.219496, 0.8235294, 1, 0, 1,
-0.8374408, -0.5286698, -2.170414, 0.8196079, 1, 0, 1,
-0.8347148, 0.8673587, -1.423014, 0.8117647, 1, 0, 1,
-0.8332233, -0.5095135, -0.3362883, 0.8078431, 1, 0, 1,
-0.8297606, 0.5942721, -1.04664, 0.8, 1, 0, 1,
-0.8290577, 1.168311, 0.05249159, 0.7921569, 1, 0, 1,
-0.8250517, -0.01007187, -1.344785, 0.7882353, 1, 0, 1,
-0.8243815, 0.8593309, -1.976341, 0.7803922, 1, 0, 1,
-0.8189226, 0.7624025, -0.5213116, 0.7764706, 1, 0, 1,
-0.8145214, -2.003458, -2.620595, 0.7686275, 1, 0, 1,
-0.8132088, 1.137872, -0.3556537, 0.7647059, 1, 0, 1,
-0.8123575, 0.9596212, 0.209511, 0.7568628, 1, 0, 1,
-0.8105298, -0.8210872, -3.989751, 0.7529412, 1, 0, 1,
-0.8035016, 1.180731, -0.4254045, 0.7450981, 1, 0, 1,
-0.795626, -1.862154, -1.269732, 0.7411765, 1, 0, 1,
-0.7952111, -0.6913738, -3.146885, 0.7333333, 1, 0, 1,
-0.7946318, -0.1706908, -1.120375, 0.7294118, 1, 0, 1,
-0.7930952, -1.085943, -2.428912, 0.7215686, 1, 0, 1,
-0.7885187, -0.3555095, -2.200923, 0.7176471, 1, 0, 1,
-0.7863194, 1.067276, -0.1000887, 0.7098039, 1, 0, 1,
-0.7856202, 1.895897, 0.4506415, 0.7058824, 1, 0, 1,
-0.7810208, -1.219112, -1.98566, 0.6980392, 1, 0, 1,
-0.7776077, 0.7012599, -1.463733, 0.6901961, 1, 0, 1,
-0.7748337, -1.029843, -2.226754, 0.6862745, 1, 0, 1,
-0.7718741, -0.3842237, -1.322323, 0.6784314, 1, 0, 1,
-0.7716426, -2.245406, -4.616561, 0.6745098, 1, 0, 1,
-0.771023, 0.8357034, -1.85876, 0.6666667, 1, 0, 1,
-0.7659049, -0.7870302, -2.650357, 0.6627451, 1, 0, 1,
-0.7657459, -1.089787, -2.265363, 0.654902, 1, 0, 1,
-0.7633387, 0.6978349, -1.190098, 0.6509804, 1, 0, 1,
-0.7616373, -0.9740232, -3.254841, 0.6431373, 1, 0, 1,
-0.7599509, 1.33332, 0.7626567, 0.6392157, 1, 0, 1,
-0.7545878, 0.4039534, -1.006704, 0.6313726, 1, 0, 1,
-0.751101, -1.153628, -3.654312, 0.627451, 1, 0, 1,
-0.7507153, 0.3327554, -2.070956, 0.6196079, 1, 0, 1,
-0.739153, 0.5719082, -0.5261145, 0.6156863, 1, 0, 1,
-0.7325804, -0.9572314, -2.257574, 0.6078432, 1, 0, 1,
-0.7280396, 0.8799781, 0.9336579, 0.6039216, 1, 0, 1,
-0.7261834, -2.199005, -1.525546, 0.5960785, 1, 0, 1,
-0.7237233, 2.07393, -0.1993835, 0.5882353, 1, 0, 1,
-0.7191935, -2.591018, -3.047446, 0.5843138, 1, 0, 1,
-0.7152264, 0.5172802, -1.160422, 0.5764706, 1, 0, 1,
-0.7150085, -0.4815136, -1.429866, 0.572549, 1, 0, 1,
-0.7119487, 1.956747, -1.956863, 0.5647059, 1, 0, 1,
-0.6999972, 0.01984254, -1.14282, 0.5607843, 1, 0, 1,
-0.6981178, -1.925395, -1.588851, 0.5529412, 1, 0, 1,
-0.6973863, 0.0635671, -1.294123, 0.5490196, 1, 0, 1,
-0.6972358, -0.06475288, -3.028496, 0.5411765, 1, 0, 1,
-0.6913217, -0.02411411, -1.411191, 0.5372549, 1, 0, 1,
-0.6903181, 2.306279, 1.095829, 0.5294118, 1, 0, 1,
-0.6896545, -0.9404441, -4.231395, 0.5254902, 1, 0, 1,
-0.6876031, 0.2483603, -0.9300727, 0.5176471, 1, 0, 1,
-0.6860527, -0.9228101, -0.8295313, 0.5137255, 1, 0, 1,
-0.6838712, -0.828803, -0.4126739, 0.5058824, 1, 0, 1,
-0.6824371, 0.9469142, -1.022426, 0.5019608, 1, 0, 1,
-0.6766381, 0.2553381, -0.70736, 0.4941176, 1, 0, 1,
-0.6658808, 1.690798, -1.88002, 0.4862745, 1, 0, 1,
-0.6577803, -0.7960544, -0.8726397, 0.4823529, 1, 0, 1,
-0.6554617, -0.4747527, -1.02081, 0.4745098, 1, 0, 1,
-0.6537267, 0.5809893, 0.4310363, 0.4705882, 1, 0, 1,
-0.6526343, 1.578673, 0.654188, 0.4627451, 1, 0, 1,
-0.6511469, -0.271713, -1.486547, 0.4588235, 1, 0, 1,
-0.6486682, -0.65332, 0.09785684, 0.4509804, 1, 0, 1,
-0.6420133, 0.03738509, -1.4335, 0.4470588, 1, 0, 1,
-0.6356394, 0.8521996, 0.2506344, 0.4392157, 1, 0, 1,
-0.6350912, 1.005706, -1.96147, 0.4352941, 1, 0, 1,
-0.6273957, 1.420774, 0.2760382, 0.427451, 1, 0, 1,
-0.6270193, 0.5278774, -1.707093, 0.4235294, 1, 0, 1,
-0.6265633, -1.032789, -2.953907, 0.4156863, 1, 0, 1,
-0.6260206, 3.238908, 0.3476134, 0.4117647, 1, 0, 1,
-0.6235584, 1.197545, 0.1160447, 0.4039216, 1, 0, 1,
-0.6160911, -0.6112762, -1.023682, 0.3960784, 1, 0, 1,
-0.6155466, -0.1324134, -1.895175, 0.3921569, 1, 0, 1,
-0.6147661, -0.7877464, -4.313396, 0.3843137, 1, 0, 1,
-0.614724, 0.07292974, -2.064777, 0.3803922, 1, 0, 1,
-0.6084621, -0.6601993, -2.116717, 0.372549, 1, 0, 1,
-0.6021345, 0.7062901, -0.9759172, 0.3686275, 1, 0, 1,
-0.6005923, 0.01527417, -2.086045, 0.3607843, 1, 0, 1,
-0.5954355, 0.2040737, -2.603323, 0.3568628, 1, 0, 1,
-0.5937918, 0.3935484, -1.800403, 0.3490196, 1, 0, 1,
-0.5912284, 1.241151, -0.6323559, 0.345098, 1, 0, 1,
-0.5873349, -0.07007634, 1.175753, 0.3372549, 1, 0, 1,
-0.5860566, 0.3012316, -3.100718, 0.3333333, 1, 0, 1,
-0.5860016, -0.1893858, -1.232979, 0.3254902, 1, 0, 1,
-0.5850958, 0.9665111, 0.690136, 0.3215686, 1, 0, 1,
-0.5832555, -0.9614179, -3.99996, 0.3137255, 1, 0, 1,
-0.5745908, 0.92167, -0.3184035, 0.3098039, 1, 0, 1,
-0.5735025, 0.5562147, -1.008081, 0.3019608, 1, 0, 1,
-0.5727757, -1.406927, -3.889601, 0.2941177, 1, 0, 1,
-0.5686546, 1.278901, 0.3657022, 0.2901961, 1, 0, 1,
-0.5682187, 1.663471, -0.8762363, 0.282353, 1, 0, 1,
-0.5652078, -0.6907808, -2.680538, 0.2784314, 1, 0, 1,
-0.563206, -1.086005, -3.240491, 0.2705882, 1, 0, 1,
-0.5549116, -1.51107, -2.054424, 0.2666667, 1, 0, 1,
-0.5539942, -1.444075, -1.594594, 0.2588235, 1, 0, 1,
-0.5535066, -1.273225, -1.50889, 0.254902, 1, 0, 1,
-0.5501686, 0.3465192, -1.049675, 0.2470588, 1, 0, 1,
-0.5500597, -0.5768815, -2.494386, 0.2431373, 1, 0, 1,
-0.54611, 0.6464649, -0.1366885, 0.2352941, 1, 0, 1,
-0.54255, -0.8124292, -2.834121, 0.2313726, 1, 0, 1,
-0.5401527, 1.357822, 0.3766188, 0.2235294, 1, 0, 1,
-0.5381351, 1.024497, 0.8796322, 0.2196078, 1, 0, 1,
-0.5373718, -0.2195757, -1.968115, 0.2117647, 1, 0, 1,
-0.5341069, -1.187569, -1.043837, 0.2078431, 1, 0, 1,
-0.5322345, -0.5669898, -1.189655, 0.2, 1, 0, 1,
-0.5321832, 1.548486, -0.4067214, 0.1921569, 1, 0, 1,
-0.5280655, 0.2553966, 0.4944925, 0.1882353, 1, 0, 1,
-0.5169811, -0.280523, -2.739249, 0.1803922, 1, 0, 1,
-0.5148833, 0.5666376, -1.356658, 0.1764706, 1, 0, 1,
-0.5136285, -0.1200779, -1.811571, 0.1686275, 1, 0, 1,
-0.510681, 0.2604961, -1.413296, 0.1647059, 1, 0, 1,
-0.5093204, -0.7159349, -3.663908, 0.1568628, 1, 0, 1,
-0.5072482, -0.1251083, -0.9709989, 0.1529412, 1, 0, 1,
-0.5039719, -0.2778384, -3.890024, 0.145098, 1, 0, 1,
-0.5031089, 0.9054675, -0.7127031, 0.1411765, 1, 0, 1,
-0.4990685, -0.3638881, -0.6007347, 0.1333333, 1, 0, 1,
-0.498948, 0.2138874, -1.693266, 0.1294118, 1, 0, 1,
-0.4968656, -2.288476, -3.807035, 0.1215686, 1, 0, 1,
-0.4951186, -0.8739266, -3.140738, 0.1176471, 1, 0, 1,
-0.4938408, 1.271289, 0.06095925, 0.1098039, 1, 0, 1,
-0.4864604, 0.9333581, 1.394881, 0.1058824, 1, 0, 1,
-0.4846739, 1.575773, 0.09785447, 0.09803922, 1, 0, 1,
-0.4843478, 0.1396891, -2.305614, 0.09019608, 1, 0, 1,
-0.4818349, -0.6399153, -1.566898, 0.08627451, 1, 0, 1,
-0.4730845, -0.6977913, -1.003811, 0.07843138, 1, 0, 1,
-0.4706776, 1.21442, -0.6880202, 0.07450981, 1, 0, 1,
-0.4685508, -0.4653407, -1.84913, 0.06666667, 1, 0, 1,
-0.4662813, 1.055381, 0.4470557, 0.0627451, 1, 0, 1,
-0.4651193, 0.07523987, -1.697442, 0.05490196, 1, 0, 1,
-0.4594422, -0.3461664, -2.932949, 0.05098039, 1, 0, 1,
-0.4593465, 0.240722, -1.8459, 0.04313726, 1, 0, 1,
-0.4510048, -0.4889869, -3.217394, 0.03921569, 1, 0, 1,
-0.4486815, 1.976622, 1.113917, 0.03137255, 1, 0, 1,
-0.4482459, -1.378566, -3.640487, 0.02745098, 1, 0, 1,
-0.4389957, -0.55396, -1.550893, 0.01960784, 1, 0, 1,
-0.4348271, 0.8683549, -1.496846, 0.01568628, 1, 0, 1,
-0.4307491, -0.6659049, -1.73121, 0.007843138, 1, 0, 1,
-0.428152, -0.7951822, -3.220898, 0.003921569, 1, 0, 1,
-0.4250304, 0.2264349, 0.05001967, 0, 1, 0.003921569, 1,
-0.4211821, 1.426074, -0.7073336, 0, 1, 0.01176471, 1,
-0.4205462, -2.024641, -2.558981, 0, 1, 0.01568628, 1,
-0.4164119, -0.5524495, -1.883725, 0, 1, 0.02352941, 1,
-0.4102908, 0.6863797, -1.980214, 0, 1, 0.02745098, 1,
-0.4100799, 0.003869073, -3.300895, 0, 1, 0.03529412, 1,
-0.4091372, -2.688337, -1.155449, 0, 1, 0.03921569, 1,
-0.4043125, -1.0997, -2.01148, 0, 1, 0.04705882, 1,
-0.4029851, -0.837981, -3.199672, 0, 1, 0.05098039, 1,
-0.3997001, 0.09983978, -1.437701, 0, 1, 0.05882353, 1,
-0.3937482, 0.02940878, -2.219513, 0, 1, 0.0627451, 1,
-0.3920309, -1.362325, -1.198998, 0, 1, 0.07058824, 1,
-0.3878693, 1.672375, -0.3756087, 0, 1, 0.07450981, 1,
-0.3805743, -1.319865, -4.848608, 0, 1, 0.08235294, 1,
-0.3757599, -0.3227474, -3.221421, 0, 1, 0.08627451, 1,
-0.3733162, 1.417268, 0.1533239, 0, 1, 0.09411765, 1,
-0.3643907, -0.6640655, -3.89794, 0, 1, 0.1019608, 1,
-0.3631943, 1.745636, 0.1347532, 0, 1, 0.1058824, 1,
-0.3606158, -0.09791012, 0.1642906, 0, 1, 0.1137255, 1,
-0.3585668, -0.2603328, -4.128506, 0, 1, 0.1176471, 1,
-0.3584706, -1.495598, -2.675587, 0, 1, 0.1254902, 1,
-0.3431879, -0.8965003, -2.879822, 0, 1, 0.1294118, 1,
-0.3416414, 0.04753477, -0.9119362, 0, 1, 0.1372549, 1,
-0.3380214, 0.6527474, -0.2063096, 0, 1, 0.1411765, 1,
-0.3325584, 1.022894, -2.363547, 0, 1, 0.1490196, 1,
-0.3240596, -0.1861496, -0.9262627, 0, 1, 0.1529412, 1,
-0.323863, 0.1629566, -0.4799632, 0, 1, 0.1607843, 1,
-0.3238617, 3.045169, -0.308916, 0, 1, 0.1647059, 1,
-0.3220023, 0.4824745, -1.985768, 0, 1, 0.172549, 1,
-0.3189127, -2.386136, -3.560457, 0, 1, 0.1764706, 1,
-0.3146123, -0.01076099, -2.245975, 0, 1, 0.1843137, 1,
-0.3035633, 0.9009296, -0.5394983, 0, 1, 0.1882353, 1,
-0.3032427, 1.21649, -1.25853, 0, 1, 0.1960784, 1,
-0.2962797, -0.7133137, -4.207484, 0, 1, 0.2039216, 1,
-0.291703, 0.3759295, -0.2871171, 0, 1, 0.2078431, 1,
-0.2882537, 0.8990659, -0.3827172, 0, 1, 0.2156863, 1,
-0.2866387, -0.6419994, -2.236616, 0, 1, 0.2196078, 1,
-0.2856978, -0.673857, -1.838377, 0, 1, 0.227451, 1,
-0.2844974, 0.2362768, -2.010081, 0, 1, 0.2313726, 1,
-0.2814415, -1.166226, -2.311189, 0, 1, 0.2392157, 1,
-0.2724608, 0.4904669, -1.081545, 0, 1, 0.2431373, 1,
-0.2628571, -0.2005078, -2.934462, 0, 1, 0.2509804, 1,
-0.2626964, 0.833311, 0.4523031, 0, 1, 0.254902, 1,
-0.2605036, -1.508254, -3.536124, 0, 1, 0.2627451, 1,
-0.2601885, -0.6534235, -2.163333, 0, 1, 0.2666667, 1,
-0.2589222, 0.5120288, -0.1600508, 0, 1, 0.2745098, 1,
-0.2571784, -1.308327, -2.72537, 0, 1, 0.2784314, 1,
-0.2532544, -1.092698, -4.330081, 0, 1, 0.2862745, 1,
-0.2491917, -1.549684, -1.883345, 0, 1, 0.2901961, 1,
-0.2478599, 0.227274, -1.350744, 0, 1, 0.2980392, 1,
-0.2449556, -0.2430056, -2.710919, 0, 1, 0.3058824, 1,
-0.2415021, -0.9505534, -1.692689, 0, 1, 0.3098039, 1,
-0.2395025, 1.09123, -0.9217508, 0, 1, 0.3176471, 1,
-0.2394369, 0.04202823, -2.320343, 0, 1, 0.3215686, 1,
-0.2326311, -0.1955217, -4.251193, 0, 1, 0.3294118, 1,
-0.2275571, -0.9768665, -1.943801, 0, 1, 0.3333333, 1,
-0.225071, 0.7522196, 1.941788, 0, 1, 0.3411765, 1,
-0.2248718, 0.5709849, -0.5277057, 0, 1, 0.345098, 1,
-0.2240561, 1.757927, -2.28382, 0, 1, 0.3529412, 1,
-0.2208642, 0.7193366, -1.048977, 0, 1, 0.3568628, 1,
-0.220092, -0.06973992, -2.623832, 0, 1, 0.3647059, 1,
-0.2156934, -0.7470074, -3.581527, 0, 1, 0.3686275, 1,
-0.2140194, -0.3391157, -1.714743, 0, 1, 0.3764706, 1,
-0.2138655, 0.1064441, -2.224713, 0, 1, 0.3803922, 1,
-0.213506, -0.3450268, -1.735203, 0, 1, 0.3882353, 1,
-0.2130606, 0.08377993, -0.8683541, 0, 1, 0.3921569, 1,
-0.2127594, 0.3490206, -0.7539435, 0, 1, 0.4, 1,
-0.2094637, 2.520717, -0.2818199, 0, 1, 0.4078431, 1,
-0.2092421, -0.855756, -2.902908, 0, 1, 0.4117647, 1,
-0.2019591, 0.2743981, -1.090105, 0, 1, 0.4196078, 1,
-0.1999646, 1.145085, 1.241501, 0, 1, 0.4235294, 1,
-0.1985025, -1.814694, -2.669601, 0, 1, 0.4313726, 1,
-0.1965781, -0.3598986, -1.136633, 0, 1, 0.4352941, 1,
-0.1960413, 0.8681209, -2.848818, 0, 1, 0.4431373, 1,
-0.1950391, -0.1755203, -3.872745, 0, 1, 0.4470588, 1,
-0.1947249, -0.6234546, -3.882992, 0, 1, 0.454902, 1,
-0.1947113, -0.8978741, -3.102691, 0, 1, 0.4588235, 1,
-0.193309, 0.08221047, -1.017345, 0, 1, 0.4666667, 1,
-0.1931406, -0.4681238, -1.884744, 0, 1, 0.4705882, 1,
-0.1913252, 0.3604386, -2.648385, 0, 1, 0.4784314, 1,
-0.1895845, 0.2664898, -1.518954, 0, 1, 0.4823529, 1,
-0.1877178, 0.1073578, -2.29872, 0, 1, 0.4901961, 1,
-0.1876093, 0.9518592, 0.4424711, 0, 1, 0.4941176, 1,
-0.1836975, -1.228493, -2.035067, 0, 1, 0.5019608, 1,
-0.1830907, 2.272228, -1.058508, 0, 1, 0.509804, 1,
-0.179081, 0.6462038, 1.584005, 0, 1, 0.5137255, 1,
-0.1781182, -0.06502794, -1.089537, 0, 1, 0.5215687, 1,
-0.173217, -0.3833666, -3.358051, 0, 1, 0.5254902, 1,
-0.1727705, 0.8312705, 0.5370561, 0, 1, 0.5333334, 1,
-0.1678289, 0.9185075, 0.5445856, 0, 1, 0.5372549, 1,
-0.1634732, -0.7702774, -1.826806, 0, 1, 0.5450981, 1,
-0.1595279, -0.7203341, -2.899447, 0, 1, 0.5490196, 1,
-0.1590373, 0.4570625, 0.7312841, 0, 1, 0.5568628, 1,
-0.1586597, -0.2336123, -2.646531, 0, 1, 0.5607843, 1,
-0.1579929, -0.2079329, -1.846132, 0, 1, 0.5686275, 1,
-0.1559255, 0.6060331, 0.7159132, 0, 1, 0.572549, 1,
-0.1526005, 1.14538, 0.6163556, 0, 1, 0.5803922, 1,
-0.1516135, -0.1145899, -0.7685995, 0, 1, 0.5843138, 1,
-0.1508443, 1.69617, -0.2234752, 0, 1, 0.5921569, 1,
-0.1492466, -0.3847136, -2.613692, 0, 1, 0.5960785, 1,
-0.1456772, 0.4595011, -0.08169112, 0, 1, 0.6039216, 1,
-0.1402634, 1.336419, -0.697114, 0, 1, 0.6117647, 1,
-0.1379583, -0.263839, -0.9841838, 0, 1, 0.6156863, 1,
-0.1364983, 0.1945486, 1.949038, 0, 1, 0.6235294, 1,
-0.1317189, -0.3251928, -1.642152, 0, 1, 0.627451, 1,
-0.1263178, -0.01534995, -3.309508, 0, 1, 0.6352941, 1,
-0.1235411, -0.1278308, -3.072363, 0, 1, 0.6392157, 1,
-0.1232884, -0.1868877, -3.552722, 0, 1, 0.6470588, 1,
-0.1223021, -0.2050512, -2.568864, 0, 1, 0.6509804, 1,
-0.1215316, 0.8370255, -0.5304837, 0, 1, 0.6588235, 1,
-0.1183141, -0.1605664, -2.74272, 0, 1, 0.6627451, 1,
-0.1154202, -0.2791632, -3.478703, 0, 1, 0.6705883, 1,
-0.1128849, -1.899091, -3.135177, 0, 1, 0.6745098, 1,
-0.1113748, -0.3135664, -2.261723, 0, 1, 0.682353, 1,
-0.1109445, -0.8491501, -2.03638, 0, 1, 0.6862745, 1,
-0.1098772, -1.127961, -3.739066, 0, 1, 0.6941177, 1,
-0.1097254, -1.024814, -4.369651, 0, 1, 0.7019608, 1,
-0.1074136, 0.3805184, 0.8800321, 0, 1, 0.7058824, 1,
-0.1071646, 0.1770133, 0.632551, 0, 1, 0.7137255, 1,
-0.1046266, 0.1796429, -0.5928971, 0, 1, 0.7176471, 1,
-0.1036416, 1.77264, -2.427956, 0, 1, 0.7254902, 1,
-0.1019769, -0.8830155, -3.100037, 0, 1, 0.7294118, 1,
-0.1005087, 1.350636, 0.4640735, 0, 1, 0.7372549, 1,
-0.09944317, -1.047169, -3.942859, 0, 1, 0.7411765, 1,
-0.09883573, -1.56285, -2.17561, 0, 1, 0.7490196, 1,
-0.09883431, 1.348009, -1.208555, 0, 1, 0.7529412, 1,
-0.09534444, 0.1318958, -1.006335, 0, 1, 0.7607843, 1,
-0.08849314, 0.6854475, 0.06671135, 0, 1, 0.7647059, 1,
-0.0826566, 0.1581579, -2.241821, 0, 1, 0.772549, 1,
-0.08136106, -1.178365, -1.672368, 0, 1, 0.7764706, 1,
-0.08075636, 0.5840209, 2.364626, 0, 1, 0.7843137, 1,
-0.08062937, 1.330402, 0.8107784, 0, 1, 0.7882353, 1,
-0.07878958, -0.3712987, -3.303957, 0, 1, 0.7960784, 1,
-0.07819429, 0.5985321, 2.234475, 0, 1, 0.8039216, 1,
-0.07258034, 0.2201111, -0.2355527, 0, 1, 0.8078431, 1,
-0.06860008, -0.3063836, -3.858305, 0, 1, 0.8156863, 1,
-0.06515122, 1.437802, -0.5199838, 0, 1, 0.8196079, 1,
-0.06504919, -0.107885, -3.418708, 0, 1, 0.827451, 1,
-0.06394536, -0.4490089, -3.391378, 0, 1, 0.8313726, 1,
-0.06177027, -0.3047184, -4.498495, 0, 1, 0.8392157, 1,
-0.06036671, -0.6754307, -2.065762, 0, 1, 0.8431373, 1,
-0.0590216, 0.3486504, -0.2420252, 0, 1, 0.8509804, 1,
-0.05866604, -1.694606, -4.259257, 0, 1, 0.854902, 1,
-0.05582172, -1.290134, -3.312264, 0, 1, 0.8627451, 1,
-0.05431344, -0.7774425, -2.855393, 0, 1, 0.8666667, 1,
-0.0490358, -0.6574777, -1.445645, 0, 1, 0.8745098, 1,
-0.04626434, -1.040102, -1.21333, 0, 1, 0.8784314, 1,
-0.04602509, -0.07278293, -2.666894, 0, 1, 0.8862745, 1,
-0.04580078, -1.02906, -3.175895, 0, 1, 0.8901961, 1,
-0.04465814, 0.7250103, 1.123153, 0, 1, 0.8980392, 1,
-0.04328499, 0.7958133, -0.7364925, 0, 1, 0.9058824, 1,
-0.04263231, -1.376852, -2.975939, 0, 1, 0.9098039, 1,
-0.04042019, -0.7839535, -5.277348, 0, 1, 0.9176471, 1,
-0.04000309, -0.326914, -2.43165, 0, 1, 0.9215686, 1,
-0.03996677, -2.421211, -3.568027, 0, 1, 0.9294118, 1,
-0.03773254, -0.6270996, -1.605165, 0, 1, 0.9333333, 1,
-0.03327929, -0.948902, -2.586491, 0, 1, 0.9411765, 1,
-0.03059012, -0.1591912, -4.307286, 0, 1, 0.945098, 1,
-0.02933804, 0.06242011, 0.4899493, 0, 1, 0.9529412, 1,
-0.02817392, -0.3442722, -4.09424, 0, 1, 0.9568627, 1,
-0.02696913, -0.3596642, -3.545826, 0, 1, 0.9647059, 1,
-0.01953925, -1.145673, -3.489358, 0, 1, 0.9686275, 1,
-0.01785653, 0.4879707, -0.6254467, 0, 1, 0.9764706, 1,
-0.01529247, 1.391835, -1.126397, 0, 1, 0.9803922, 1,
-0.01396442, -0.849152, -3.833408, 0, 1, 0.9882353, 1,
-0.01352612, 1.652155, -1.118895, 0, 1, 0.9921569, 1,
-0.01315442, 0.2614473, -0.2436205, 0, 1, 1, 1,
-0.01082417, -0.3262229, -2.588387, 0, 0.9921569, 1, 1,
-0.01072199, -0.1074952, -3.232044, 0, 0.9882353, 1, 1,
-0.008549656, -0.1895794, -1.980765, 0, 0.9803922, 1, 1,
-0.006927498, -1.844496, -3.41437, 0, 0.9764706, 1, 1,
-0.006712878, -1.79275, -3.622958, 0, 0.9686275, 1, 1,
-0.005571812, -0.3207815, -3.909009, 0, 0.9647059, 1, 1,
-0.003089805, 1.092238, -0.6187437, 0, 0.9568627, 1, 1,
-0.001962184, 1.033576, 0.6081851, 0, 0.9529412, 1, 1,
-0.001496006, 0.4504773, 1.015848, 0, 0.945098, 1, 1,
0.002216006, -1.83879, 3.540955, 0, 0.9411765, 1, 1,
0.00256419, 0.245168, 0.08144905, 0, 0.9333333, 1, 1,
0.004878941, -0.7662575, 4.094303, 0, 0.9294118, 1, 1,
0.009226993, 0.1911913, 2.332645, 0, 0.9215686, 1, 1,
0.01007684, 1.404608, -1.583175, 0, 0.9176471, 1, 1,
0.01066494, -0.3275743, 3.365838, 0, 0.9098039, 1, 1,
0.02085881, 1.905621, 1.158585, 0, 0.9058824, 1, 1,
0.02136318, 0.3799261, 0.03676376, 0, 0.8980392, 1, 1,
0.02325064, -0.6208138, 2.738847, 0, 0.8901961, 1, 1,
0.02342891, -0.06272008, 3.915345, 0, 0.8862745, 1, 1,
0.02637504, 0.6314679, -0.08616063, 0, 0.8784314, 1, 1,
0.02707238, -1.369364, 1.898743, 0, 0.8745098, 1, 1,
0.02748783, 1.591628, 0.7856313, 0, 0.8666667, 1, 1,
0.02891484, 0.2248536, 0.5888355, 0, 0.8627451, 1, 1,
0.03000661, 0.9121227, -0.5080051, 0, 0.854902, 1, 1,
0.03033382, -1.259144, 2.687567, 0, 0.8509804, 1, 1,
0.03189846, -0.2539732, 3.75889, 0, 0.8431373, 1, 1,
0.03402462, 0.2782404, 1.080189, 0, 0.8392157, 1, 1,
0.03514539, -0.2943656, 2.348425, 0, 0.8313726, 1, 1,
0.03635963, 2.049495, 1.084993, 0, 0.827451, 1, 1,
0.03942069, 0.3946846, -0.5511139, 0, 0.8196079, 1, 1,
0.03948825, 0.6313747, -0.2146884, 0, 0.8156863, 1, 1,
0.04193924, -0.3622968, 1.92488, 0, 0.8078431, 1, 1,
0.04290127, -1.187924, 4.048322, 0, 0.8039216, 1, 1,
0.05021807, -0.2836549, 2.614701, 0, 0.7960784, 1, 1,
0.0540805, 0.448572, 3.855961, 0, 0.7882353, 1, 1,
0.05698881, 0.7423516, -1.164771, 0, 0.7843137, 1, 1,
0.06255443, 1.373823, -0.1217584, 0, 0.7764706, 1, 1,
0.06373742, 0.5905731, -1.313596, 0, 0.772549, 1, 1,
0.06945947, -0.2143011, 1.67364, 0, 0.7647059, 1, 1,
0.07243813, -1.13357, 2.106246, 0, 0.7607843, 1, 1,
0.07243874, 0.005725326, 1.478004, 0, 0.7529412, 1, 1,
0.07503052, -0.01120303, 2.864073, 0, 0.7490196, 1, 1,
0.07513718, -0.1829072, 3.858868, 0, 0.7411765, 1, 1,
0.07981269, 1.047407, 0.3597184, 0, 0.7372549, 1, 1,
0.08834295, -0.9406716, 2.517451, 0, 0.7294118, 1, 1,
0.09163252, -0.2961959, 2.666139, 0, 0.7254902, 1, 1,
0.09674868, 1.199833, -0.8925864, 0, 0.7176471, 1, 1,
0.09994354, -0.4891181, 3.0301, 0, 0.7137255, 1, 1,
0.1021704, -0.01376579, -0.4756192, 0, 0.7058824, 1, 1,
0.1053024, 0.3931598, -1.801072, 0, 0.6980392, 1, 1,
0.1067893, -0.3146241, 1.824759, 0, 0.6941177, 1, 1,
0.1143781, -0.8807724, 2.047437, 0, 0.6862745, 1, 1,
0.1150691, 1.318633, -0.622317, 0, 0.682353, 1, 1,
0.1191314, -0.2334227, 2.075342, 0, 0.6745098, 1, 1,
0.1192386, -0.1782731, 2.906927, 0, 0.6705883, 1, 1,
0.1263886, -0.2641563, 2.084791, 0, 0.6627451, 1, 1,
0.1265816, -0.7156227, 2.33678, 0, 0.6588235, 1, 1,
0.1291112, -0.8666478, 2.152501, 0, 0.6509804, 1, 1,
0.1294975, 0.2924855, 0.3794438, 0, 0.6470588, 1, 1,
0.1295135, -1.581814, 3.333288, 0, 0.6392157, 1, 1,
0.1297168, 1.638857, -0.9689733, 0, 0.6352941, 1, 1,
0.1302763, -0.7790851, 1.548716, 0, 0.627451, 1, 1,
0.1324316, 0.6132679, 1.027119, 0, 0.6235294, 1, 1,
0.1333127, -1.067385, 5.053852, 0, 0.6156863, 1, 1,
0.1344755, -0.7755904, 3.362298, 0, 0.6117647, 1, 1,
0.1372025, -0.8344986, 2.381577, 0, 0.6039216, 1, 1,
0.1374161, 0.1742054, 0.7946704, 0, 0.5960785, 1, 1,
0.1396192, 1.046726, -0.836655, 0, 0.5921569, 1, 1,
0.1397238, -1.610698, 2.984628, 0, 0.5843138, 1, 1,
0.1405351, 0.003881525, 2.076991, 0, 0.5803922, 1, 1,
0.1417624, 0.08597854, 0.09821837, 0, 0.572549, 1, 1,
0.1445632, 0.9604488, -0.6514613, 0, 0.5686275, 1, 1,
0.1507768, 1.477656, 1.228353, 0, 0.5607843, 1, 1,
0.1513108, -0.3361037, 2.465061, 0, 0.5568628, 1, 1,
0.1514297, -0.430402, 3.887986, 0, 0.5490196, 1, 1,
0.1522627, 1.164412, -0.5193236, 0, 0.5450981, 1, 1,
0.1608237, 0.2999316, 0.3453407, 0, 0.5372549, 1, 1,
0.1629773, -0.4416546, 3.151022, 0, 0.5333334, 1, 1,
0.1638353, -1.809565, 3.317667, 0, 0.5254902, 1, 1,
0.1648968, 1.207219, 0.1163046, 0, 0.5215687, 1, 1,
0.1660728, -0.6439051, 2.737542, 0, 0.5137255, 1, 1,
0.1685766, -0.3370309, 1.02986, 0, 0.509804, 1, 1,
0.1738713, -0.7100974, 2.794453, 0, 0.5019608, 1, 1,
0.174078, 0.4757005, 0.138616, 0, 0.4941176, 1, 1,
0.1743508, -0.3746013, 3.636805, 0, 0.4901961, 1, 1,
0.1743554, 1.48363, 1.469248, 0, 0.4823529, 1, 1,
0.178131, -0.7010701, 0.9769795, 0, 0.4784314, 1, 1,
0.1781495, -1.821408, 2.389675, 0, 0.4705882, 1, 1,
0.1854046, -0.6014549, 2.899956, 0, 0.4666667, 1, 1,
0.1893205, -0.08795527, 2.659482, 0, 0.4588235, 1, 1,
0.191789, -0.007140102, 1.847571, 0, 0.454902, 1, 1,
0.1923419, -0.1725418, 4.111764, 0, 0.4470588, 1, 1,
0.1988365, 1.114991, 0.6142706, 0, 0.4431373, 1, 1,
0.1993845, -0.04489738, 2.448389, 0, 0.4352941, 1, 1,
0.2080246, 1.269401, 2.085348, 0, 0.4313726, 1, 1,
0.210637, -0.8409446, 4.223445, 0, 0.4235294, 1, 1,
0.2133131, 1.020922, -0.1113745, 0, 0.4196078, 1, 1,
0.2156444, 0.5818811, 0.9799441, 0, 0.4117647, 1, 1,
0.2168477, -1.063347, 5.240994, 0, 0.4078431, 1, 1,
0.2185875, -0.5100833, 2.62832, 0, 0.4, 1, 1,
0.2189248, -0.6010674, 2.65601, 0, 0.3921569, 1, 1,
0.2197007, 0.2983055, 0.4535002, 0, 0.3882353, 1, 1,
0.2221635, -0.4216141, 2.399806, 0, 0.3803922, 1, 1,
0.22335, 2.058598, 0.6275865, 0, 0.3764706, 1, 1,
0.2263312, 2.03241, -0.2871808, 0, 0.3686275, 1, 1,
0.2266253, -0.7325194, 1.614319, 0, 0.3647059, 1, 1,
0.2296996, 0.2185617, 2.294898, 0, 0.3568628, 1, 1,
0.2351657, 0.9905966, 0.8292297, 0, 0.3529412, 1, 1,
0.2388618, -0.9905208, 1.658665, 0, 0.345098, 1, 1,
0.2420287, -0.7200221, 2.996354, 0, 0.3411765, 1, 1,
0.2439013, -0.4694166, 2.715976, 0, 0.3333333, 1, 1,
0.2445445, -0.8423111, 1.425672, 0, 0.3294118, 1, 1,
0.249305, 0.2367125, 2.332982, 0, 0.3215686, 1, 1,
0.2531297, 0.1426819, 0.7405193, 0, 0.3176471, 1, 1,
0.253754, -0.04501649, 2.069658, 0, 0.3098039, 1, 1,
0.2542916, 0.2640122, 1.299351, 0, 0.3058824, 1, 1,
0.2558303, -0.5367446, 2.302777, 0, 0.2980392, 1, 1,
0.2618474, 2.153532, -0.4686844, 0, 0.2901961, 1, 1,
0.2621776, -0.8463991, 1.850182, 0, 0.2862745, 1, 1,
0.2649813, 0.810366, 0.4719224, 0, 0.2784314, 1, 1,
0.2687845, 1.020814, 1.885945, 0, 0.2745098, 1, 1,
0.269465, -1.624576, 5.155934, 0, 0.2666667, 1, 1,
0.2697031, -0.2985584, 1.824445, 0, 0.2627451, 1, 1,
0.2726035, 1.093848, -0.2026903, 0, 0.254902, 1, 1,
0.2727234, 0.05783914, 2.855193, 0, 0.2509804, 1, 1,
0.2770027, -0.8424303, 3.944505, 0, 0.2431373, 1, 1,
0.2771125, 0.01350313, 0.9492213, 0, 0.2392157, 1, 1,
0.2772861, 0.297224, 0.3203944, 0, 0.2313726, 1, 1,
0.2786866, 1.79876, -1.888832, 0, 0.227451, 1, 1,
0.2788448, 0.2970693, 2.145663, 0, 0.2196078, 1, 1,
0.2832058, 0.178755, 0.00028181, 0, 0.2156863, 1, 1,
0.2870669, -0.1505506, 1.881039, 0, 0.2078431, 1, 1,
0.2872528, 1.568634, 0.2694142, 0, 0.2039216, 1, 1,
0.2914029, 0.2165038, 2.392092, 0, 0.1960784, 1, 1,
0.2937709, -0.1135835, 1.238912, 0, 0.1882353, 1, 1,
0.2979532, 0.8484399, 0.06341353, 0, 0.1843137, 1, 1,
0.3024781, -0.4246002, 2.395928, 0, 0.1764706, 1, 1,
0.3067569, -0.8504071, 2.372358, 0, 0.172549, 1, 1,
0.3082963, -0.2346631, 2.791682, 0, 0.1647059, 1, 1,
0.3171364, -0.5472326, 1.783154, 0, 0.1607843, 1, 1,
0.3200623, -0.5496432, 3.394515, 0, 0.1529412, 1, 1,
0.3244932, -0.2457133, 2.773617, 0, 0.1490196, 1, 1,
0.3254223, -1.327182, 2.553931, 0, 0.1411765, 1, 1,
0.3319968, 0.7590602, 0.7347865, 0, 0.1372549, 1, 1,
0.3377084, -1.907068, 2.241687, 0, 0.1294118, 1, 1,
0.3387809, 0.9197308, -0.2635906, 0, 0.1254902, 1, 1,
0.3432617, 1.550388, -0.4747341, 0, 0.1176471, 1, 1,
0.3464607, -1.115511, 2.300333, 0, 0.1137255, 1, 1,
0.3480415, 0.7871214, 2.623169, 0, 0.1058824, 1, 1,
0.3519944, -0.1270489, -0.5525578, 0, 0.09803922, 1, 1,
0.3541065, 2.028553, -1.684381, 0, 0.09411765, 1, 1,
0.3569974, 0.9995067, 2.032512, 0, 0.08627451, 1, 1,
0.3582437, -0.103519, 3.317497, 0, 0.08235294, 1, 1,
0.3584876, -0.735074, 3.195611, 0, 0.07450981, 1, 1,
0.3631388, -1.03958, 4.01846, 0, 0.07058824, 1, 1,
0.366844, -0.2633255, 1.485425, 0, 0.0627451, 1, 1,
0.3782555, 0.1072383, 1.275452, 0, 0.05882353, 1, 1,
0.378715, 2.090292, 0.4281914, 0, 0.05098039, 1, 1,
0.3825651, -0.8408086, 3.808822, 0, 0.04705882, 1, 1,
0.3842519, 1.54424, 1.650651, 0, 0.03921569, 1, 1,
0.3882303, -1.198937, 2.247336, 0, 0.03529412, 1, 1,
0.3903974, 1.012651, -1.086624, 0, 0.02745098, 1, 1,
0.3912731, -0.8653219, 2.863414, 0, 0.02352941, 1, 1,
0.3917158, 0.7615373, 0.9401017, 0, 0.01568628, 1, 1,
0.392017, -1.241217, 1.44834, 0, 0.01176471, 1, 1,
0.3922154, -0.9511537, 2.669702, 0, 0.003921569, 1, 1,
0.3935915, 0.3592168, 0.3238456, 0.003921569, 0, 1, 1,
0.3961877, 1.585096, 1.601108, 0.007843138, 0, 1, 1,
0.3985935, -0.7537001, 1.958399, 0.01568628, 0, 1, 1,
0.4011301, -0.4912784, 3.676328, 0.01960784, 0, 1, 1,
0.4032932, 0.1888607, 0.09919967, 0.02745098, 0, 1, 1,
0.4061792, 1.015455, -0.7099406, 0.03137255, 0, 1, 1,
0.4120885, -1.176165, 2.377106, 0.03921569, 0, 1, 1,
0.4162759, -0.7325684, 1.59475, 0.04313726, 0, 1, 1,
0.4203417, 0.7681276, 1.433354, 0.05098039, 0, 1, 1,
0.4230695, -2.325077, 3.869627, 0.05490196, 0, 1, 1,
0.4309856, 0.6872792, 1.250216, 0.0627451, 0, 1, 1,
0.4366756, 0.2885086, 1.27996, 0.06666667, 0, 1, 1,
0.4375202, 1.151097, 1.535332, 0.07450981, 0, 1, 1,
0.437817, -0.8991776, 2.875919, 0.07843138, 0, 1, 1,
0.4387548, 1.005716, 0.308145, 0.08627451, 0, 1, 1,
0.4446762, 0.4482843, 0.4093485, 0.09019608, 0, 1, 1,
0.4448737, -1.049188, 4.356264, 0.09803922, 0, 1, 1,
0.4462186, -0.3508106, 0.0221744, 0.1058824, 0, 1, 1,
0.4494935, 0.7364761, 1.023883, 0.1098039, 0, 1, 1,
0.4533771, -1.542623, 2.002953, 0.1176471, 0, 1, 1,
0.4564223, 0.3440216, 2.122134, 0.1215686, 0, 1, 1,
0.4576664, 0.911986, 1.35958, 0.1294118, 0, 1, 1,
0.4602532, 0.2054232, 0.2183031, 0.1333333, 0, 1, 1,
0.463868, 0.1750142, 1.218697, 0.1411765, 0, 1, 1,
0.4701787, -0.7409437, -0.03453998, 0.145098, 0, 1, 1,
0.4707895, -0.6637008, 2.84274, 0.1529412, 0, 1, 1,
0.4708547, -0.8165988, 3.226965, 0.1568628, 0, 1, 1,
0.4709357, 0.1587938, 2.477188, 0.1647059, 0, 1, 1,
0.4734381, 0.8007832, -0.8599283, 0.1686275, 0, 1, 1,
0.4743617, 0.3743865, 0.4463473, 0.1764706, 0, 1, 1,
0.4784425, 1.052785, 0.6216577, 0.1803922, 0, 1, 1,
0.4786652, 0.4082304, 0.8751033, 0.1882353, 0, 1, 1,
0.4860037, -0.4721407, 0.9450286, 0.1921569, 0, 1, 1,
0.4965215, -1.613431, 3.790859, 0.2, 0, 1, 1,
0.5014337, -0.1125171, 3.173973, 0.2078431, 0, 1, 1,
0.502243, 2.142444, -2.002408, 0.2117647, 0, 1, 1,
0.5031496, 1.231476, 0.6200806, 0.2196078, 0, 1, 1,
0.5085919, 0.1882343, 0.3706589, 0.2235294, 0, 1, 1,
0.5120251, 1.123791, -0.4125113, 0.2313726, 0, 1, 1,
0.5122848, 1.084113, 0.858076, 0.2352941, 0, 1, 1,
0.5144081, 1.448694, -0.5978592, 0.2431373, 0, 1, 1,
0.5228011, 1.210298, 0.8388463, 0.2470588, 0, 1, 1,
0.5232434, 0.009061548, 0.4568039, 0.254902, 0, 1, 1,
0.5297594, 2.508615, -0.794562, 0.2588235, 0, 1, 1,
0.5298817, -0.6561211, 2.381897, 0.2666667, 0, 1, 1,
0.5305757, 0.1903163, 0.4754047, 0.2705882, 0, 1, 1,
0.5318661, -0.4759738, 1.495133, 0.2784314, 0, 1, 1,
0.5321649, 1.451842, 0.456361, 0.282353, 0, 1, 1,
0.5379618, -0.2726638, 3.093964, 0.2901961, 0, 1, 1,
0.5390619, 0.3839398, 0.09436852, 0.2941177, 0, 1, 1,
0.5398453, 0.458703, 2.527056, 0.3019608, 0, 1, 1,
0.5399437, -1.077535, 3.724409, 0.3098039, 0, 1, 1,
0.5429127, 0.3773363, 0.63817, 0.3137255, 0, 1, 1,
0.5445538, -0.89281, 2.254515, 0.3215686, 0, 1, 1,
0.5475759, -1.223937, 4.997315, 0.3254902, 0, 1, 1,
0.5503302, -0.8589381, 4.291576, 0.3333333, 0, 1, 1,
0.5608838, 0.6197709, -0.4296132, 0.3372549, 0, 1, 1,
0.5655531, 0.691793, -0.2118648, 0.345098, 0, 1, 1,
0.5673811, -1.238924, 4.445796, 0.3490196, 0, 1, 1,
0.5703153, -1.459127, 2.022412, 0.3568628, 0, 1, 1,
0.572762, -1.087547, 3.795125, 0.3607843, 0, 1, 1,
0.5775917, 0.4926533, 3.276306, 0.3686275, 0, 1, 1,
0.578821, 1.467415, 0.4574145, 0.372549, 0, 1, 1,
0.5826367, 0.3866739, -0.8885529, 0.3803922, 0, 1, 1,
0.5868817, 0.4017441, 1.067986, 0.3843137, 0, 1, 1,
0.5896217, -1.872997, 2.567147, 0.3921569, 0, 1, 1,
0.5899569, 0.6094422, 0.4022245, 0.3960784, 0, 1, 1,
0.5915881, 0.04597755, 1.473304, 0.4039216, 0, 1, 1,
0.593626, -0.7235969, 2.525817, 0.4117647, 0, 1, 1,
0.5959946, -0.9385108, 1.256888, 0.4156863, 0, 1, 1,
0.6067073, -2.09791, 3.896016, 0.4235294, 0, 1, 1,
0.6100162, -0.4305197, 2.270749, 0.427451, 0, 1, 1,
0.6144943, 0.4017007, 0.9364305, 0.4352941, 0, 1, 1,
0.6167483, -1.123327, 1.013488, 0.4392157, 0, 1, 1,
0.6206514, -2.143487, 3.485401, 0.4470588, 0, 1, 1,
0.6217992, 0.5180727, -0.052006, 0.4509804, 0, 1, 1,
0.6222137, 1.116393, -0.4771442, 0.4588235, 0, 1, 1,
0.6259116, 0.2704463, -0.0839463, 0.4627451, 0, 1, 1,
0.6298221, -1.716042, 1.155449, 0.4705882, 0, 1, 1,
0.6300133, 0.5262977, 1.399365, 0.4745098, 0, 1, 1,
0.6301296, 0.3400799, 1.160441, 0.4823529, 0, 1, 1,
0.6366634, 0.4251309, 2.17781, 0.4862745, 0, 1, 1,
0.6372592, 0.5822185, 0.100282, 0.4941176, 0, 1, 1,
0.6391031, -0.05000783, 3.002759, 0.5019608, 0, 1, 1,
0.6417236, 0.3312862, 0.899209, 0.5058824, 0, 1, 1,
0.6422521, -0.3138358, 1.152583, 0.5137255, 0, 1, 1,
0.6454811, -0.3336441, 2.063193, 0.5176471, 0, 1, 1,
0.6491305, -0.3638397, 1.7421, 0.5254902, 0, 1, 1,
0.6513838, 0.2080332, -0.1924745, 0.5294118, 0, 1, 1,
0.6534439, -0.1206129, 0.4549894, 0.5372549, 0, 1, 1,
0.6580185, 0.7230343, 1.390043, 0.5411765, 0, 1, 1,
0.6586844, -0.837553, 2.547669, 0.5490196, 0, 1, 1,
0.6625007, 0.3797166, -0.4610456, 0.5529412, 0, 1, 1,
0.6633959, 0.8767046, -0.6969483, 0.5607843, 0, 1, 1,
0.6653063, 1.026799, -1.691278, 0.5647059, 0, 1, 1,
0.6665488, 0.6408871, 0.3717525, 0.572549, 0, 1, 1,
0.6682068, -0.6873402, 3.318398, 0.5764706, 0, 1, 1,
0.6700429, 1.878508, -0.8065111, 0.5843138, 0, 1, 1,
0.6718061, 1.171936, -0.8869926, 0.5882353, 0, 1, 1,
0.6766325, 0.3501022, 2.002928, 0.5960785, 0, 1, 1,
0.6781947, 0.620223, 1.691762, 0.6039216, 0, 1, 1,
0.6826633, 0.1576495, 2.871491, 0.6078432, 0, 1, 1,
0.6830693, -0.2319164, 1.091746, 0.6156863, 0, 1, 1,
0.6886993, -0.06482337, 1.64146, 0.6196079, 0, 1, 1,
0.6911849, 1.047311, 1.246897, 0.627451, 0, 1, 1,
0.6923443, 0.8906765, 0.57818, 0.6313726, 0, 1, 1,
0.6937508, -0.8665876, 1.722877, 0.6392157, 0, 1, 1,
0.6940826, -0.1843174, 1.755104, 0.6431373, 0, 1, 1,
0.6947005, 0.3984827, 0.1582013, 0.6509804, 0, 1, 1,
0.6958093, 0.1397988, 1.57655, 0.654902, 0, 1, 1,
0.6960008, 0.7879425, -0.3837597, 0.6627451, 0, 1, 1,
0.7030815, -0.09545536, 3.287228, 0.6666667, 0, 1, 1,
0.7051231, -1.027436, 2.563027, 0.6745098, 0, 1, 1,
0.7077711, 0.002542104, 2.536182, 0.6784314, 0, 1, 1,
0.7164366, -0.9069486, 3.259137, 0.6862745, 0, 1, 1,
0.7173637, 0.8662352, 0.8368719, 0.6901961, 0, 1, 1,
0.7211329, -0.8005254, 4.061081, 0.6980392, 0, 1, 1,
0.7227488, 1.618898, 0.265307, 0.7058824, 0, 1, 1,
0.7261737, -2.931425, 3.346138, 0.7098039, 0, 1, 1,
0.7288715, -1.436731, 1.394266, 0.7176471, 0, 1, 1,
0.7311396, -0.9646073, 2.150244, 0.7215686, 0, 1, 1,
0.7317144, -0.5983713, 3.008436, 0.7294118, 0, 1, 1,
0.7354653, 1.735019, 1.2583, 0.7333333, 0, 1, 1,
0.7413333, -0.589253, 1.499112, 0.7411765, 0, 1, 1,
0.7418034, -0.2951137, 1.513822, 0.7450981, 0, 1, 1,
0.742488, -0.8755777, 2.146992, 0.7529412, 0, 1, 1,
0.7428726, 0.315594, 0.8349973, 0.7568628, 0, 1, 1,
0.7463343, -0.5030748, 3.940104, 0.7647059, 0, 1, 1,
0.7476885, -1.999437, 2.553711, 0.7686275, 0, 1, 1,
0.7496559, 0.5863287, 1.977833, 0.7764706, 0, 1, 1,
0.7507334, -0.5411683, 1.126422, 0.7803922, 0, 1, 1,
0.7515312, 1.56909, 1.084689, 0.7882353, 0, 1, 1,
0.7548536, 0.07212512, 0.8739063, 0.7921569, 0, 1, 1,
0.7557559, 0.5512092, -0.7518903, 0.8, 0, 1, 1,
0.761431, 1.20936, -1.761716, 0.8078431, 0, 1, 1,
0.7616818, 1.110592, 2.684062, 0.8117647, 0, 1, 1,
0.7648816, -0.3127712, 1.891166, 0.8196079, 0, 1, 1,
0.7657531, 1.257215, 0.2967279, 0.8235294, 0, 1, 1,
0.7667825, -0.07924657, 2.690514, 0.8313726, 0, 1, 1,
0.7679154, -0.3136338, 3.139847, 0.8352941, 0, 1, 1,
0.7692783, -0.9023321, 1.739811, 0.8431373, 0, 1, 1,
0.7839762, 0.257419, 1.81496, 0.8470588, 0, 1, 1,
0.7867727, 0.964368, 0.5801351, 0.854902, 0, 1, 1,
0.804749, 0.02347308, 1.816835, 0.8588235, 0, 1, 1,
0.8130084, 0.2559519, 1.846689, 0.8666667, 0, 1, 1,
0.8173675, -2.574392, 3.247971, 0.8705882, 0, 1, 1,
0.8208112, 0.2609403, 1.181748, 0.8784314, 0, 1, 1,
0.8214157, -0.8021809, 2.939912, 0.8823529, 0, 1, 1,
0.8240098, -0.1300929, 2.773344, 0.8901961, 0, 1, 1,
0.8266827, -0.7895235, 2.691157, 0.8941177, 0, 1, 1,
0.8323817, 1.5636, -0.8827636, 0.9019608, 0, 1, 1,
0.8364079, 1.568448, 2.606589, 0.9098039, 0, 1, 1,
0.8386607, -0.1658128, 2.853103, 0.9137255, 0, 1, 1,
0.8396971, -1.165636, 1.764092, 0.9215686, 0, 1, 1,
0.8422136, -0.4055113, 1.804385, 0.9254902, 0, 1, 1,
0.8422662, 0.1993442, 0.2308515, 0.9333333, 0, 1, 1,
0.8466176, 0.7444251, 1.847462, 0.9372549, 0, 1, 1,
0.8513653, -0.09267592, 3.318255, 0.945098, 0, 1, 1,
0.8515384, -0.250275, 1.613962, 0.9490196, 0, 1, 1,
0.8518246, 0.1192531, 3.005796, 0.9568627, 0, 1, 1,
0.8558149, -0.267337, 2.335243, 0.9607843, 0, 1, 1,
0.8643674, -1.435682, 1.685105, 0.9686275, 0, 1, 1,
0.8648748, -1.022703, 0.5636668, 0.972549, 0, 1, 1,
0.8673753, -0.1325557, 1.083577, 0.9803922, 0, 1, 1,
0.8725495, -0.1816432, 0.1280911, 0.9843137, 0, 1, 1,
0.8846313, 1.562034, 0.1451022, 0.9921569, 0, 1, 1,
0.8995887, -2.656335, 1.286114, 0.9960784, 0, 1, 1,
0.9039707, 0.6191912, 2.164825, 1, 0, 0.9960784, 1,
0.9055204, 0.8169756, 2.108712, 1, 0, 0.9882353, 1,
0.9092068, 0.4103335, 1.540298, 1, 0, 0.9843137, 1,
0.9092304, -1.251079, 4.616069, 1, 0, 0.9764706, 1,
0.9093319, 2.042502, 1.659343, 1, 0, 0.972549, 1,
0.9153696, 0.06841204, 2.183052, 1, 0, 0.9647059, 1,
0.9241681, -0.2356681, -0.2476558, 1, 0, 0.9607843, 1,
0.9278619, -2.018068, 1.979638, 1, 0, 0.9529412, 1,
0.9294575, -0.4088321, 0.1949961, 1, 0, 0.9490196, 1,
0.9305563, 0.1330882, 0.4743612, 1, 0, 0.9411765, 1,
0.9311778, 1.028341, 0.4020801, 1, 0, 0.9372549, 1,
0.931226, 0.6902257, 1.496588, 1, 0, 0.9294118, 1,
0.9339999, 0.02140096, 2.892409, 1, 0, 0.9254902, 1,
0.9472642, 0.07009684, 1.265601, 1, 0, 0.9176471, 1,
0.9622547, -0.2523749, 0.8937422, 1, 0, 0.9137255, 1,
0.9650395, 1.093736, 0.6987273, 1, 0, 0.9058824, 1,
0.9662343, 0.6901419, -0.746181, 1, 0, 0.9019608, 1,
0.9697676, 0.06184284, 1.873576, 1, 0, 0.8941177, 1,
0.9801037, -0.2885543, 1.530239, 1, 0, 0.8862745, 1,
0.9803317, 1.732294, 0.1186954, 1, 0, 0.8823529, 1,
0.985672, -0.2490377, 0.7058197, 1, 0, 0.8745098, 1,
0.9872627, 1.693135, 1.26138, 1, 0, 0.8705882, 1,
0.9894952, 0.221204, 1.005287, 1, 0, 0.8627451, 1,
0.9964501, -0.250124, 0.9620232, 1, 0, 0.8588235, 1,
0.9986501, -0.2357672, 2.549177, 1, 0, 0.8509804, 1,
1.002098, 0.1576932, 2.185636, 1, 0, 0.8470588, 1,
1.004526, 1.274982, -0.5585715, 1, 0, 0.8392157, 1,
1.016533, 0.246484, -0.7021648, 1, 0, 0.8352941, 1,
1.026639, 0.1705527, 1.877619, 1, 0, 0.827451, 1,
1.02976, 0.9144019, 1.156564, 1, 0, 0.8235294, 1,
1.031641, 0.6272706, 2.465976, 1, 0, 0.8156863, 1,
1.03715, 0.6771213, 2.290829, 1, 0, 0.8117647, 1,
1.039518, 0.2761595, 0.8346105, 1, 0, 0.8039216, 1,
1.040292, -0.09644516, 1.233209, 1, 0, 0.7960784, 1,
1.040379, -0.3276561, 2.537512, 1, 0, 0.7921569, 1,
1.047904, 0.9420128, 1.972285, 1, 0, 0.7843137, 1,
1.052917, -0.5742605, 2.645083, 1, 0, 0.7803922, 1,
1.053374, 0.1795062, 2.125697, 1, 0, 0.772549, 1,
1.058983, -0.8400562, 3.02129, 1, 0, 0.7686275, 1,
1.059858, -0.8341305, 2.66625, 1, 0, 0.7607843, 1,
1.064503, -0.431206, 1.457068, 1, 0, 0.7568628, 1,
1.072017, 0.7706349, 1.872755, 1, 0, 0.7490196, 1,
1.074853, 0.9946367, 0.30029, 1, 0, 0.7450981, 1,
1.076911, -0.1715423, 0.8886768, 1, 0, 0.7372549, 1,
1.078045, 0.04465667, 0.5873213, 1, 0, 0.7333333, 1,
1.082796, -1.298099, 2.301407, 1, 0, 0.7254902, 1,
1.090386, -1.692559, 3.777629, 1, 0, 0.7215686, 1,
1.100493, 2.120961, 2.029037, 1, 0, 0.7137255, 1,
1.103959, -1.052464, 4.723811, 1, 0, 0.7098039, 1,
1.10413, 0.1975657, 2.357639, 1, 0, 0.7019608, 1,
1.121171, -2.845738, 1.614487, 1, 0, 0.6941177, 1,
1.121499, -0.9852757, 3.181871, 1, 0, 0.6901961, 1,
1.126139, -0.5402184, -0.2351639, 1, 0, 0.682353, 1,
1.130599, 2.083041, -0.4384894, 1, 0, 0.6784314, 1,
1.134644, 0.2506278, 1.193489, 1, 0, 0.6705883, 1,
1.141075, 0.1772098, 2.711397, 1, 0, 0.6666667, 1,
1.147079, -0.5181849, 2.368969, 1, 0, 0.6588235, 1,
1.148982, -0.1311141, 0.9620053, 1, 0, 0.654902, 1,
1.156582, -0.2602259, 0.5584255, 1, 0, 0.6470588, 1,
1.156652, -0.8797477, 3.248709, 1, 0, 0.6431373, 1,
1.167871, 0.1421992, 0.4241708, 1, 0, 0.6352941, 1,
1.170719, 1.404446, 1.072876, 1, 0, 0.6313726, 1,
1.191902, 0.8009658, -0.2405896, 1, 0, 0.6235294, 1,
1.194708, 0.03507099, 0.4065425, 1, 0, 0.6196079, 1,
1.208688, -1.737064, 1.068676, 1, 0, 0.6117647, 1,
1.22074, 0.8410676, 0.08742192, 1, 0, 0.6078432, 1,
1.228646, -1.426741, 1.291535, 1, 0, 0.6, 1,
1.228897, 1.811463, 1.096556, 1, 0, 0.5921569, 1,
1.231027, -0.1975755, 1.149592, 1, 0, 0.5882353, 1,
1.234932, 0.3744712, 0.9531171, 1, 0, 0.5803922, 1,
1.239211, 0.3757931, 1.996485, 1, 0, 0.5764706, 1,
1.24277, -0.9694988, 3.491577, 1, 0, 0.5686275, 1,
1.243327, 1.749551, 1.176747, 1, 0, 0.5647059, 1,
1.248442, 1.277936, 1.367748, 1, 0, 0.5568628, 1,
1.252798, 0.5679344, 1.42447, 1, 0, 0.5529412, 1,
1.255916, -0.5637055, 1.336729, 1, 0, 0.5450981, 1,
1.257857, -0.02902816, 3.694123, 1, 0, 0.5411765, 1,
1.27019, -0.8649752, -0.3384036, 1, 0, 0.5333334, 1,
1.288339, -1.130855, 1.743576, 1, 0, 0.5294118, 1,
1.294869, -0.1285614, 1.669032, 1, 0, 0.5215687, 1,
1.302082, -0.2843458, 1.07082, 1, 0, 0.5176471, 1,
1.326662, 0.3762108, 2.791016, 1, 0, 0.509804, 1,
1.341833, -1.932961, 1.507226, 1, 0, 0.5058824, 1,
1.352228, -0.2424437, 1.534989, 1, 0, 0.4980392, 1,
1.35515, 0.548491, 1.604798, 1, 0, 0.4901961, 1,
1.359088, 0.2370627, -0.1833131, 1, 0, 0.4862745, 1,
1.371409, 1.535324, 1.417862, 1, 0, 0.4784314, 1,
1.375956, -2.601654, 4.368966, 1, 0, 0.4745098, 1,
1.376513, -0.01116143, 0.1224207, 1, 0, 0.4666667, 1,
1.376981, -0.5527455, 1.153391, 1, 0, 0.4627451, 1,
1.384882, -0.6432793, 1.862859, 1, 0, 0.454902, 1,
1.389012, 1.648425, 1.894894, 1, 0, 0.4509804, 1,
1.391819, -1.644758, 2.057685, 1, 0, 0.4431373, 1,
1.394459, 1.101712, 0.5711904, 1, 0, 0.4392157, 1,
1.395456, -1.530294, 3.320864, 1, 0, 0.4313726, 1,
1.397528, -0.8450209, 1.031639, 1, 0, 0.427451, 1,
1.400822, 2.190967, -2.444387, 1, 0, 0.4196078, 1,
1.406561, 1.043078, 1.442722, 1, 0, 0.4156863, 1,
1.406996, 1.012198, 1.501788, 1, 0, 0.4078431, 1,
1.420227, -0.271795, 0.7964074, 1, 0, 0.4039216, 1,
1.426169, -0.2693161, 2.88569, 1, 0, 0.3960784, 1,
1.435765, 0.3549774, 2.013795, 1, 0, 0.3882353, 1,
1.47388, -0.5636271, 2.673102, 1, 0, 0.3843137, 1,
1.474406, -0.06978269, -0.8386959, 1, 0, 0.3764706, 1,
1.477079, 1.641127, 0.7157341, 1, 0, 0.372549, 1,
1.480777, -0.8278255, 2.253617, 1, 0, 0.3647059, 1,
1.506747, 0.8609647, 0.9418812, 1, 0, 0.3607843, 1,
1.521362, 1.029983, 2.215547, 1, 0, 0.3529412, 1,
1.523828, -0.1304463, 3.525972, 1, 0, 0.3490196, 1,
1.54577, -0.07665134, 1.993681, 1, 0, 0.3411765, 1,
1.545871, -0.5495463, 0.7616889, 1, 0, 0.3372549, 1,
1.549407, -0.7679267, 2.130482, 1, 0, 0.3294118, 1,
1.556193, 2.082815, 1.497923, 1, 0, 0.3254902, 1,
1.576821, -0.7698811, 3.423286, 1, 0, 0.3176471, 1,
1.581577, -0.7084217, 2.427799, 1, 0, 0.3137255, 1,
1.591247, 0.7255703, 2.451661, 1, 0, 0.3058824, 1,
1.603427, 1.375544, 1.876035, 1, 0, 0.2980392, 1,
1.606734, -0.2258741, 0.1520165, 1, 0, 0.2941177, 1,
1.624035, -0.3449627, 1.552252, 1, 0, 0.2862745, 1,
1.636766, 0.6397421, 1.397309, 1, 0, 0.282353, 1,
1.639336, 0.5240678, 1.494305, 1, 0, 0.2745098, 1,
1.643671, -0.4415311, 1.327509, 1, 0, 0.2705882, 1,
1.644564, -0.3229548, 2.118624, 1, 0, 0.2627451, 1,
1.646926, -2.656228, 3.394465, 1, 0, 0.2588235, 1,
1.651385, -0.6509152, 1.111256, 1, 0, 0.2509804, 1,
1.661049, 0.05834621, 2.629747, 1, 0, 0.2470588, 1,
1.661059, -1.217664, 3.351574, 1, 0, 0.2392157, 1,
1.67479, -0.1758208, 1.550609, 1, 0, 0.2352941, 1,
1.688839, 1.381492, 1.241679, 1, 0, 0.227451, 1,
1.714472, 0.7987192, 2.02205, 1, 0, 0.2235294, 1,
1.716383, 0.8719528, 0.7517962, 1, 0, 0.2156863, 1,
1.718001, 0.5846332, 0.5509767, 1, 0, 0.2117647, 1,
1.73096, 1.820013, 3.228573, 1, 0, 0.2039216, 1,
1.761273, -0.4307617, 1.995553, 1, 0, 0.1960784, 1,
1.772974, 0.8841461, 3.054661, 1, 0, 0.1921569, 1,
1.801568, -1.84773, 2.686737, 1, 0, 0.1843137, 1,
1.802065, 0.5220504, 1.549164, 1, 0, 0.1803922, 1,
1.83389, -0.09608044, -0.01223302, 1, 0, 0.172549, 1,
1.842386, 0.1988943, 2.327433, 1, 0, 0.1686275, 1,
1.844621, 0.3674353, 1.796598, 1, 0, 0.1607843, 1,
1.855394, 0.1371285, 1.977951, 1, 0, 0.1568628, 1,
1.867131, -0.2763974, 3.482275, 1, 0, 0.1490196, 1,
1.871854, 0.9526259, 1.925907, 1, 0, 0.145098, 1,
1.886373, 2.989864, 1.2419, 1, 0, 0.1372549, 1,
1.910414, -1.443807, 1.224836, 1, 0, 0.1333333, 1,
1.911483, -0.6027851, 2.415806, 1, 0, 0.1254902, 1,
1.917592, 0.3577563, 3.391989, 1, 0, 0.1215686, 1,
1.926281, 2.038406, 0.8648039, 1, 0, 0.1137255, 1,
1.949439, 0.4815392, 0.2014685, 1, 0, 0.1098039, 1,
1.967322, 1.188984, 0.6072055, 1, 0, 0.1019608, 1,
1.972505, 1.314151, -0.5468574, 1, 0, 0.09411765, 1,
1.972842, -1.949386, 1.819342, 1, 0, 0.09019608, 1,
2.007705, 0.7149161, 2.066463, 1, 0, 0.08235294, 1,
2.035196, 0.1347849, 1.237456, 1, 0, 0.07843138, 1,
2.052901, -0.6503548, 2.916985, 1, 0, 0.07058824, 1,
2.062342, 0.1907923, 1.154147, 1, 0, 0.06666667, 1,
2.213538, -1.33095, 3.873609, 1, 0, 0.05882353, 1,
2.254665, 1.666963, -0.1148096, 1, 0, 0.05490196, 1,
2.273903, 0.9234092, 0.3097032, 1, 0, 0.04705882, 1,
2.312062, -0.268376, 1.989764, 1, 0, 0.04313726, 1,
2.462262, -0.8607474, 2.52655, 1, 0, 0.03529412, 1,
2.689959, -1.35557, 1.049564, 1, 0, 0.03137255, 1,
2.731417, 0.769728, 0.8760438, 1, 0, 0.02352941, 1,
2.749189, 0.4382117, 0.9737981, 1, 0, 0.01960784, 1,
2.789462, 1.288052, 0.2599636, 1, 0, 0.01176471, 1,
3.263723, 0.4899431, 1.944951, 1, 0, 0.007843138, 1
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
0.1659535, -3.977297, -7.060207, 0, -0.5, 0.5, 0.5,
0.1659535, -3.977297, -7.060207, 1, -0.5, 0.5, 0.5,
0.1659535, -3.977297, -7.060207, 1, 1.5, 0.5, 0.5,
0.1659535, -3.977297, -7.060207, 0, 1.5, 0.5, 0.5
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
-3.98196, 0.1537414, -7.060207, 0, -0.5, 0.5, 0.5,
-3.98196, 0.1537414, -7.060207, 1, -0.5, 0.5, 0.5,
-3.98196, 0.1537414, -7.060207, 1, 1.5, 0.5, 0.5,
-3.98196, 0.1537414, -7.060207, 0, 1.5, 0.5, 0.5
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
-3.98196, -3.977297, -0.01817679, 0, -0.5, 0.5, 0.5,
-3.98196, -3.977297, -0.01817679, 1, -0.5, 0.5, 0.5,
-3.98196, -3.977297, -0.01817679, 1, 1.5, 0.5, 0.5,
-3.98196, -3.977297, -0.01817679, 0, 1.5, 0.5, 0.5
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
-2, -3.02398, -5.435123,
3, -3.02398, -5.435123,
-2, -3.02398, -5.435123,
-2, -3.182866, -5.70597,
-1, -3.02398, -5.435123,
-1, -3.182866, -5.70597,
0, -3.02398, -5.435123,
0, -3.182866, -5.70597,
1, -3.02398, -5.435123,
1, -3.182866, -5.70597,
2, -3.02398, -5.435123,
2, -3.182866, -5.70597,
3, -3.02398, -5.435123,
3, -3.182866, -5.70597
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
-2, -3.500638, -6.247665, 0, -0.5, 0.5, 0.5,
-2, -3.500638, -6.247665, 1, -0.5, 0.5, 0.5,
-2, -3.500638, -6.247665, 1, 1.5, 0.5, 0.5,
-2, -3.500638, -6.247665, 0, 1.5, 0.5, 0.5,
-1, -3.500638, -6.247665, 0, -0.5, 0.5, 0.5,
-1, -3.500638, -6.247665, 1, -0.5, 0.5, 0.5,
-1, -3.500638, -6.247665, 1, 1.5, 0.5, 0.5,
-1, -3.500638, -6.247665, 0, 1.5, 0.5, 0.5,
0, -3.500638, -6.247665, 0, -0.5, 0.5, 0.5,
0, -3.500638, -6.247665, 1, -0.5, 0.5, 0.5,
0, -3.500638, -6.247665, 1, 1.5, 0.5, 0.5,
0, -3.500638, -6.247665, 0, 1.5, 0.5, 0.5,
1, -3.500638, -6.247665, 0, -0.5, 0.5, 0.5,
1, -3.500638, -6.247665, 1, -0.5, 0.5, 0.5,
1, -3.500638, -6.247665, 1, 1.5, 0.5, 0.5,
1, -3.500638, -6.247665, 0, 1.5, 0.5, 0.5,
2, -3.500638, -6.247665, 0, -0.5, 0.5, 0.5,
2, -3.500638, -6.247665, 1, -0.5, 0.5, 0.5,
2, -3.500638, -6.247665, 1, 1.5, 0.5, 0.5,
2, -3.500638, -6.247665, 0, 1.5, 0.5, 0.5,
3, -3.500638, -6.247665, 0, -0.5, 0.5, 0.5,
3, -3.500638, -6.247665, 1, -0.5, 0.5, 0.5,
3, -3.500638, -6.247665, 1, 1.5, 0.5, 0.5,
3, -3.500638, -6.247665, 0, 1.5, 0.5, 0.5
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
-3.024749, -2, -5.435123,
-3.024749, 3, -5.435123,
-3.024749, -2, -5.435123,
-3.184284, -2, -5.70597,
-3.024749, -1, -5.435123,
-3.184284, -1, -5.70597,
-3.024749, 0, -5.435123,
-3.184284, 0, -5.70597,
-3.024749, 1, -5.435123,
-3.184284, 1, -5.70597,
-3.024749, 2, -5.435123,
-3.184284, 2, -5.70597,
-3.024749, 3, -5.435123,
-3.184284, 3, -5.70597
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
-3.503354, -2, -6.247665, 0, -0.5, 0.5, 0.5,
-3.503354, -2, -6.247665, 1, -0.5, 0.5, 0.5,
-3.503354, -2, -6.247665, 1, 1.5, 0.5, 0.5,
-3.503354, -2, -6.247665, 0, 1.5, 0.5, 0.5,
-3.503354, -1, -6.247665, 0, -0.5, 0.5, 0.5,
-3.503354, -1, -6.247665, 1, -0.5, 0.5, 0.5,
-3.503354, -1, -6.247665, 1, 1.5, 0.5, 0.5,
-3.503354, -1, -6.247665, 0, 1.5, 0.5, 0.5,
-3.503354, 0, -6.247665, 0, -0.5, 0.5, 0.5,
-3.503354, 0, -6.247665, 1, -0.5, 0.5, 0.5,
-3.503354, 0, -6.247665, 1, 1.5, 0.5, 0.5,
-3.503354, 0, -6.247665, 0, 1.5, 0.5, 0.5,
-3.503354, 1, -6.247665, 0, -0.5, 0.5, 0.5,
-3.503354, 1, -6.247665, 1, -0.5, 0.5, 0.5,
-3.503354, 1, -6.247665, 1, 1.5, 0.5, 0.5,
-3.503354, 1, -6.247665, 0, 1.5, 0.5, 0.5,
-3.503354, 2, -6.247665, 0, -0.5, 0.5, 0.5,
-3.503354, 2, -6.247665, 1, -0.5, 0.5, 0.5,
-3.503354, 2, -6.247665, 1, 1.5, 0.5, 0.5,
-3.503354, 2, -6.247665, 0, 1.5, 0.5, 0.5,
-3.503354, 3, -6.247665, 0, -0.5, 0.5, 0.5,
-3.503354, 3, -6.247665, 1, -0.5, 0.5, 0.5,
-3.503354, 3, -6.247665, 1, 1.5, 0.5, 0.5,
-3.503354, 3, -6.247665, 0, 1.5, 0.5, 0.5
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
-3.024749, -3.02398, -4,
-3.024749, -3.02398, 4,
-3.024749, -3.02398, -4,
-3.184284, -3.182866, -4,
-3.024749, -3.02398, -2,
-3.184284, -3.182866, -2,
-3.024749, -3.02398, 0,
-3.184284, -3.182866, 0,
-3.024749, -3.02398, 2,
-3.184284, -3.182866, 2,
-3.024749, -3.02398, 4,
-3.184284, -3.182866, 4
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
-3.503354, -3.500638, -4, 0, -0.5, 0.5, 0.5,
-3.503354, -3.500638, -4, 1, -0.5, 0.5, 0.5,
-3.503354, -3.500638, -4, 1, 1.5, 0.5, 0.5,
-3.503354, -3.500638, -4, 0, 1.5, 0.5, 0.5,
-3.503354, -3.500638, -2, 0, -0.5, 0.5, 0.5,
-3.503354, -3.500638, -2, 1, -0.5, 0.5, 0.5,
-3.503354, -3.500638, -2, 1, 1.5, 0.5, 0.5,
-3.503354, -3.500638, -2, 0, 1.5, 0.5, 0.5,
-3.503354, -3.500638, 0, 0, -0.5, 0.5, 0.5,
-3.503354, -3.500638, 0, 1, -0.5, 0.5, 0.5,
-3.503354, -3.500638, 0, 1, 1.5, 0.5, 0.5,
-3.503354, -3.500638, 0, 0, 1.5, 0.5, 0.5,
-3.503354, -3.500638, 2, 0, -0.5, 0.5, 0.5,
-3.503354, -3.500638, 2, 1, -0.5, 0.5, 0.5,
-3.503354, -3.500638, 2, 1, 1.5, 0.5, 0.5,
-3.503354, -3.500638, 2, 0, 1.5, 0.5, 0.5,
-3.503354, -3.500638, 4, 0, -0.5, 0.5, 0.5,
-3.503354, -3.500638, 4, 1, -0.5, 0.5, 0.5,
-3.503354, -3.500638, 4, 1, 1.5, 0.5, 0.5,
-3.503354, -3.500638, 4, 0, 1.5, 0.5, 0.5
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
-3.024749, -3.02398, -5.435123,
-3.024749, 3.331463, -5.435123,
-3.024749, -3.02398, 5.398769,
-3.024749, 3.331463, 5.398769,
-3.024749, -3.02398, -5.435123,
-3.024749, -3.02398, 5.398769,
-3.024749, 3.331463, -5.435123,
-3.024749, 3.331463, 5.398769,
-3.024749, -3.02398, -5.435123,
3.356656, -3.02398, -5.435123,
-3.024749, -3.02398, 5.398769,
3.356656, -3.02398, 5.398769,
-3.024749, 3.331463, -5.435123,
3.356656, 3.331463, -5.435123,
-3.024749, 3.331463, 5.398769,
3.356656, 3.331463, 5.398769,
3.356656, -3.02398, -5.435123,
3.356656, 3.331463, -5.435123,
3.356656, -3.02398, 5.398769,
3.356656, 3.331463, 5.398769,
3.356656, -3.02398, -5.435123,
3.356656, -3.02398, 5.398769,
3.356656, 3.331463, -5.435123,
3.356656, 3.331463, 5.398769
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
var radius = 7.523012;
var distance = 33.47073;
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
mvMatrix.translate( -0.1659535, -0.1537414, 0.01817679 );
mvMatrix.scale( 1.274645, 1.279852, 0.7507945 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.47073);
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
metamitron<-read.table("metamitron.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-metamitron$V2
```

```
## Error in eval(expr, envir, enclos): object 'metamitron' not found
```

```r
y<-metamitron$V3
```

```
## Error in eval(expr, envir, enclos): object 'metamitron' not found
```

```r
z<-metamitron$V4
```

```
## Error in eval(expr, envir, enclos): object 'metamitron' not found
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
-2.931816, 0.2171889, -1.292888, 0, 0, 1, 1, 1,
-2.793197, -1.015487, -3.945219, 1, 0, 0, 1, 1,
-2.690754, -1.975193, -1.155836, 1, 0, 0, 1, 1,
-2.496918, -0.2085555, -1.764364, 1, 0, 0, 1, 1,
-2.493243, 0.1388222, -0.6488973, 1, 0, 0, 1, 1,
-2.484474, 1.073677, -1.347852, 1, 0, 0, 1, 1,
-2.376282, 1.446184, -1.096165, 0, 0, 0, 1, 1,
-2.339472, 0.2445796, -0.885536, 0, 0, 0, 1, 1,
-2.330597, -0.530937, -2.934946, 0, 0, 0, 1, 1,
-2.324755, -0.1814686, -1.999575, 0, 0, 0, 1, 1,
-2.31803, -0.7439693, -1.890689, 0, 0, 0, 1, 1,
-2.270325, 1.069428, -1.121629, 0, 0, 0, 1, 1,
-2.261656, -1.015157, -2.476399, 0, 0, 0, 1, 1,
-2.247779, -1.606493, -1.291366, 1, 1, 1, 1, 1,
-2.175754, 1.203841, -0.9585686, 1, 1, 1, 1, 1,
-2.142375, 1.141282, -0.5727416, 1, 1, 1, 1, 1,
-2.133376, 0.324257, 0.07104961, 1, 1, 1, 1, 1,
-2.127237, -0.7411591, -2.425217, 1, 1, 1, 1, 1,
-2.10069, -0.07514656, -2.700544, 1, 1, 1, 1, 1,
-2.094146, 0.168438, -0.07719087, 1, 1, 1, 1, 1,
-2.088483, -0.4619384, 0.06885429, 1, 1, 1, 1, 1,
-2.074886, 0.9831688, -0.3713796, 1, 1, 1, 1, 1,
-2.045739, -1.497987, -3.368893, 1, 1, 1, 1, 1,
-2.04313, 0.273825, 0.02654275, 1, 1, 1, 1, 1,
-2.019974, -1.21684, -4.386901, 1, 1, 1, 1, 1,
-1.993033, -0.3292154, -0.3401114, 1, 1, 1, 1, 1,
-1.95137, 0.1113533, -0.8274671, 1, 1, 1, 1, 1,
-1.924149, 1.09748, -1.546633, 1, 1, 1, 1, 1,
-1.874858, 0.5908141, -1.704655, 0, 0, 1, 1, 1,
-1.871584, -0.01268795, -1.947497, 1, 0, 0, 1, 1,
-1.867545, 1.23895, -2.23598, 1, 0, 0, 1, 1,
-1.863325, -0.2857808, -2.021097, 1, 0, 0, 1, 1,
-1.847869, 0.001046655, -1.009466, 1, 0, 0, 1, 1,
-1.845055, 0.3283492, -2.933458, 1, 0, 0, 1, 1,
-1.831436, 1.578255, 1.202806, 0, 0, 0, 1, 1,
-1.828713, 0.4873758, -2.569367, 0, 0, 0, 1, 1,
-1.820026, 0.5605558, -0.4961953, 0, 0, 0, 1, 1,
-1.797157, -0.3722229, -3.516795, 0, 0, 0, 1, 1,
-1.784406, 0.6297625, -1.852658, 0, 0, 0, 1, 1,
-1.763792, 0.03777689, -1.824064, 0, 0, 0, 1, 1,
-1.74153, -1.106194, -1.284006, 0, 0, 0, 1, 1,
-1.739966, 0.9715516, 0.559145, 1, 1, 1, 1, 1,
-1.713701, 0.04121154, -0.5870841, 1, 1, 1, 1, 1,
-1.695078, -0.04935831, -1.079515, 1, 1, 1, 1, 1,
-1.695069, -0.03710685, -2.63773, 1, 1, 1, 1, 1,
-1.686319, -1.097069, -2.599242, 1, 1, 1, 1, 1,
-1.650158, -0.4045664, 0.2266146, 1, 1, 1, 1, 1,
-1.642175, -0.836447, -2.582011, 1, 1, 1, 1, 1,
-1.616824, 0.625238, 0.2608274, 1, 1, 1, 1, 1,
-1.614728, -0.0844345, -1.657833, 1, 1, 1, 1, 1,
-1.588876, 0.003596667, -0.6881747, 1, 1, 1, 1, 1,
-1.584489, 0.6719868, -1.916147, 1, 1, 1, 1, 1,
-1.561337, 0.3796945, -2.867334, 1, 1, 1, 1, 1,
-1.561243, -2.022274, -2.589826, 1, 1, 1, 1, 1,
-1.556125, 0.372371, -2.514526, 1, 1, 1, 1, 1,
-1.550802, -0.342101, -1.113833, 1, 1, 1, 1, 1,
-1.550186, 0.365437, -0.2274504, 0, 0, 1, 1, 1,
-1.537016, 0.9404305, -1.666384, 1, 0, 0, 1, 1,
-1.529789, 0.259035, -0.2176422, 1, 0, 0, 1, 1,
-1.521602, -0.6863278, -2.983198, 1, 0, 0, 1, 1,
-1.521229, -0.3638778, -0.7520061, 1, 0, 0, 1, 1,
-1.51963, 0.5375144, -0.007358366, 1, 0, 0, 1, 1,
-1.516181, -0.4318799, -1.24762, 0, 0, 0, 1, 1,
-1.504029, -0.8508645, -1.37942, 0, 0, 0, 1, 1,
-1.486405, 0.06357407, -2.858297, 0, 0, 0, 1, 1,
-1.485859, 0.3789049, -1.709553, 0, 0, 0, 1, 1,
-1.485336, -1.45548, -1.274679, 0, 0, 0, 1, 1,
-1.484167, -0.867044, -1.393925, 0, 0, 0, 1, 1,
-1.480641, 1.244165, -1.635486, 0, 0, 0, 1, 1,
-1.478601, 1.157316, -1.001022, 1, 1, 1, 1, 1,
-1.476349, -0.8599975, -2.063752, 1, 1, 1, 1, 1,
-1.472543, -1.133719, -2.506506, 1, 1, 1, 1, 1,
-1.44856, -1.377959, -1.392772, 1, 1, 1, 1, 1,
-1.429644, 1.052024, -1.501948, 1, 1, 1, 1, 1,
-1.429177, -0.4995866, -1.068831, 1, 1, 1, 1, 1,
-1.427385, 0.8530653, -1.089176, 1, 1, 1, 1, 1,
-1.422481, 1.014066, -1.892243, 1, 1, 1, 1, 1,
-1.403575, 0.1833209, -2.031884, 1, 1, 1, 1, 1,
-1.402135, -0.9294286, -1.710538, 1, 1, 1, 1, 1,
-1.392426, 2.716572, -0.07970367, 1, 1, 1, 1, 1,
-1.386665, 0.7468671, -0.6671258, 1, 1, 1, 1, 1,
-1.379405, 0.5099088, -0.5304853, 1, 1, 1, 1, 1,
-1.361252, 0.8036039, -0.4733765, 1, 1, 1, 1, 1,
-1.360132, -0.7593107, -0.5462373, 1, 1, 1, 1, 1,
-1.356598, 1.513235, -1.525767, 0, 0, 1, 1, 1,
-1.355873, 0.8002988, -0.2444418, 1, 0, 0, 1, 1,
-1.34332, 1.428253, -1.432542, 1, 0, 0, 1, 1,
-1.338565, -0.4841361, -1.789244, 1, 0, 0, 1, 1,
-1.338087, 0.9388227, -1.269413, 1, 0, 0, 1, 1,
-1.329484, 0.1671644, -0.5031097, 1, 0, 0, 1, 1,
-1.324875, -2.309753, -0.9531972, 0, 0, 0, 1, 1,
-1.316737, 0.2775198, -1.658399, 0, 0, 0, 1, 1,
-1.316306, -0.3692241, -3.131417, 0, 0, 0, 1, 1,
-1.307796, -0.3259607, -2.8314, 0, 0, 0, 1, 1,
-1.298503, 2.111339, -0.8177186, 0, 0, 0, 1, 1,
-1.2985, 0.2940317, -1.166301, 0, 0, 0, 1, 1,
-1.296126, -1.094166, -1.92972, 0, 0, 0, 1, 1,
-1.29397, -0.1779944, -2.256988, 1, 1, 1, 1, 1,
-1.283428, 1.064967, 0.2483598, 1, 1, 1, 1, 1,
-1.282577, -1.570989, -2.544578, 1, 1, 1, 1, 1,
-1.279168, -0.01673233, -1.343578, 1, 1, 1, 1, 1,
-1.278018, 0.5549242, -2.192298, 1, 1, 1, 1, 1,
-1.27208, 0.07582635, -2.545943, 1, 1, 1, 1, 1,
-1.268258, 0.6365626, 0.6316877, 1, 1, 1, 1, 1,
-1.262679, -1.028035, -3.006889, 1, 1, 1, 1, 1,
-1.256832, 1.061651, -1.305455, 1, 1, 1, 1, 1,
-1.250206, -0.2965657, -2.17335, 1, 1, 1, 1, 1,
-1.238854, -0.07561338, -1.731899, 1, 1, 1, 1, 1,
-1.235116, 1.184652, -0.4790967, 1, 1, 1, 1, 1,
-1.234422, -0.7900626, -1.484136, 1, 1, 1, 1, 1,
-1.230247, 0.4030904, -2.138702, 1, 1, 1, 1, 1,
-1.226895, -0.1823331, -1.075723, 1, 1, 1, 1, 1,
-1.225106, 0.5907239, -0.6826376, 0, 0, 1, 1, 1,
-1.221796, -0.9437176, -2.869096, 1, 0, 0, 1, 1,
-1.220167, -0.6877713, -1.72929, 1, 0, 0, 1, 1,
-1.210483, -1.424744, -2.541498, 1, 0, 0, 1, 1,
-1.209773, 0.0477751, -0.5393436, 1, 0, 0, 1, 1,
-1.202538, -0.3089745, -2.236058, 1, 0, 0, 1, 1,
-1.198788, -1.323913, -1.926002, 0, 0, 0, 1, 1,
-1.197425, 0.4895768, -1.833791, 0, 0, 0, 1, 1,
-1.187125, -0.7065936, -1.51784, 0, 0, 0, 1, 1,
-1.185261, -0.2523193, -1.195508, 0, 0, 0, 1, 1,
-1.179713, 0.08374999, -2.264027, 0, 0, 0, 1, 1,
-1.173547, 2.581921, 0.2080341, 0, 0, 0, 1, 1,
-1.164714, 1.829605, 1.968171, 0, 0, 0, 1, 1,
-1.151174, 0.7945433, 0.2936209, 1, 1, 1, 1, 1,
-1.14854, -0.5982241, -2.258632, 1, 1, 1, 1, 1,
-1.14707, 0.666177, -1.844372, 1, 1, 1, 1, 1,
-1.144108, 0.8841583, 0.03211778, 1, 1, 1, 1, 1,
-1.121556, -0.9814257, -1.910883, 1, 1, 1, 1, 1,
-1.102703, 0.08640921, 0.2390616, 1, 1, 1, 1, 1,
-1.099557, -0.4025298, -1.809641, 1, 1, 1, 1, 1,
-1.095334, -1.30054, -2.132578, 1, 1, 1, 1, 1,
-1.082157, -0.2007062, -1.115654, 1, 1, 1, 1, 1,
-1.08119, 1.02745, -0.7379134, 1, 1, 1, 1, 1,
-1.066412, 0.3867392, -2.592897, 1, 1, 1, 1, 1,
-1.064465, 0.06386811, -2.192153, 1, 1, 1, 1, 1,
-1.06088, 0.2399372, 0.3548592, 1, 1, 1, 1, 1,
-1.060377, 1.576701, -1.369831, 1, 1, 1, 1, 1,
-1.058539, -0.3473971, 0.4535405, 1, 1, 1, 1, 1,
-1.054344, 0.1574149, -1.560143, 0, 0, 1, 1, 1,
-1.052743, 0.1571565, -1.669002, 1, 0, 0, 1, 1,
-1.04845, 0.4705985, -0.03041191, 1, 0, 0, 1, 1,
-1.042987, -0.02360051, -2.650479, 1, 0, 0, 1, 1,
-1.036848, -1.123556, -2.074082, 1, 0, 0, 1, 1,
-1.035655, 0.4196793, 0.6958461, 1, 0, 0, 1, 1,
-1.033833, 0.4689869, -1.579446, 0, 0, 0, 1, 1,
-1.031954, 0.1588184, -1.349421, 0, 0, 0, 1, 1,
-1.026433, -0.130033, -1.630795, 0, 0, 0, 1, 1,
-1.024979, -1.357855, -3.150268, 0, 0, 0, 1, 1,
-1.023107, -0.3634675, -2.304467, 0, 0, 0, 1, 1,
-1.014818, 0.4803783, -1.419949, 0, 0, 0, 1, 1,
-1.010895, 0.1480943, -2.692526, 0, 0, 0, 1, 1,
-1.010848, -0.4242291, -3.300008, 1, 1, 1, 1, 1,
-1.004803, -1.670685, -0.855523, 1, 1, 1, 1, 1,
-1.003795, -1.496805, -2.402204, 1, 1, 1, 1, 1,
-1.000507, -0.5702828, -2.324553, 1, 1, 1, 1, 1,
-0.9976574, -0.02911737, -2.092368, 1, 1, 1, 1, 1,
-0.9957342, 0.04246996, -0.9798068, 1, 1, 1, 1, 1,
-0.9949179, -1.267704, -2.346761, 1, 1, 1, 1, 1,
-0.9940908, 0.8749594, -1.094873, 1, 1, 1, 1, 1,
-0.9916145, -0.6912576, -3.017983, 1, 1, 1, 1, 1,
-0.9850926, 0.05713945, -2.457311, 1, 1, 1, 1, 1,
-0.9787744, 0.2164362, -3.112056, 1, 1, 1, 1, 1,
-0.9724798, -0.1057793, -2.42274, 1, 1, 1, 1, 1,
-0.9662217, -0.2321564, -0.2960067, 1, 1, 1, 1, 1,
-0.9613101, -2.249671, -3.533917, 1, 1, 1, 1, 1,
-0.9596951, -0.9663064, -1.77467, 1, 1, 1, 1, 1,
-0.9560549, -0.07928042, -1.927467, 0, 0, 1, 1, 1,
-0.9557213, 0.2569996, -0.08029381, 1, 0, 0, 1, 1,
-0.9555972, 1.387301, -0.2976649, 1, 0, 0, 1, 1,
-0.9389647, -0.7232763, -2.460998, 1, 0, 0, 1, 1,
-0.9318042, 0.4595944, 1.405178, 1, 0, 0, 1, 1,
-0.9250332, 0.07528231, -1.278109, 1, 0, 0, 1, 1,
-0.9200305, -0.4129058, -2.095923, 0, 0, 0, 1, 1,
-0.9168215, -1.602115, 0.5667101, 0, 0, 0, 1, 1,
-0.9106971, 0.6317577, 0.3682963, 0, 0, 0, 1, 1,
-0.9086758, 0.7489836, -3.660134, 0, 0, 0, 1, 1,
-0.9071265, -0.7898318, -1.664176, 0, 0, 0, 1, 1,
-0.9007807, -0.7428905, -0.6954989, 0, 0, 0, 1, 1,
-0.8989933, 0.9482527, -1.167528, 0, 0, 0, 1, 1,
-0.8919305, -0.2258982, -1.29961, 1, 1, 1, 1, 1,
-0.8906629, -0.7718679, -3.301323, 1, 1, 1, 1, 1,
-0.887629, -1.803547, -3.047052, 1, 1, 1, 1, 1,
-0.8777015, -0.6246883, -2.159303, 1, 1, 1, 1, 1,
-0.8668495, -0.02368178, -1.494653, 1, 1, 1, 1, 1,
-0.8656439, 0.1416808, -0.6093658, 1, 1, 1, 1, 1,
-0.8603487, -0.1432745, -2.196143, 1, 1, 1, 1, 1,
-0.8593872, -0.1447889, -2.592485, 1, 1, 1, 1, 1,
-0.8564051, 0.7823371, -1.91746, 1, 1, 1, 1, 1,
-0.8530006, 0.8217852, 0.232881, 1, 1, 1, 1, 1,
-0.8494071, 0.6119545, -2.275179, 1, 1, 1, 1, 1,
-0.8483236, 0.3627057, -2.275417, 1, 1, 1, 1, 1,
-0.8452948, 0.4338532, -1.336408, 1, 1, 1, 1, 1,
-0.8425643, -0.5659762, -1.616147, 1, 1, 1, 1, 1,
-0.8413256, 0.3337794, -1.160359, 1, 1, 1, 1, 1,
-0.8410426, -0.7865971, -4.219496, 0, 0, 1, 1, 1,
-0.8374408, -0.5286698, -2.170414, 1, 0, 0, 1, 1,
-0.8347148, 0.8673587, -1.423014, 1, 0, 0, 1, 1,
-0.8332233, -0.5095135, -0.3362883, 1, 0, 0, 1, 1,
-0.8297606, 0.5942721, -1.04664, 1, 0, 0, 1, 1,
-0.8290577, 1.168311, 0.05249159, 1, 0, 0, 1, 1,
-0.8250517, -0.01007187, -1.344785, 0, 0, 0, 1, 1,
-0.8243815, 0.8593309, -1.976341, 0, 0, 0, 1, 1,
-0.8189226, 0.7624025, -0.5213116, 0, 0, 0, 1, 1,
-0.8145214, -2.003458, -2.620595, 0, 0, 0, 1, 1,
-0.8132088, 1.137872, -0.3556537, 0, 0, 0, 1, 1,
-0.8123575, 0.9596212, 0.209511, 0, 0, 0, 1, 1,
-0.8105298, -0.8210872, -3.989751, 0, 0, 0, 1, 1,
-0.8035016, 1.180731, -0.4254045, 1, 1, 1, 1, 1,
-0.795626, -1.862154, -1.269732, 1, 1, 1, 1, 1,
-0.7952111, -0.6913738, -3.146885, 1, 1, 1, 1, 1,
-0.7946318, -0.1706908, -1.120375, 1, 1, 1, 1, 1,
-0.7930952, -1.085943, -2.428912, 1, 1, 1, 1, 1,
-0.7885187, -0.3555095, -2.200923, 1, 1, 1, 1, 1,
-0.7863194, 1.067276, -0.1000887, 1, 1, 1, 1, 1,
-0.7856202, 1.895897, 0.4506415, 1, 1, 1, 1, 1,
-0.7810208, -1.219112, -1.98566, 1, 1, 1, 1, 1,
-0.7776077, 0.7012599, -1.463733, 1, 1, 1, 1, 1,
-0.7748337, -1.029843, -2.226754, 1, 1, 1, 1, 1,
-0.7718741, -0.3842237, -1.322323, 1, 1, 1, 1, 1,
-0.7716426, -2.245406, -4.616561, 1, 1, 1, 1, 1,
-0.771023, 0.8357034, -1.85876, 1, 1, 1, 1, 1,
-0.7659049, -0.7870302, -2.650357, 1, 1, 1, 1, 1,
-0.7657459, -1.089787, -2.265363, 0, 0, 1, 1, 1,
-0.7633387, 0.6978349, -1.190098, 1, 0, 0, 1, 1,
-0.7616373, -0.9740232, -3.254841, 1, 0, 0, 1, 1,
-0.7599509, 1.33332, 0.7626567, 1, 0, 0, 1, 1,
-0.7545878, 0.4039534, -1.006704, 1, 0, 0, 1, 1,
-0.751101, -1.153628, -3.654312, 1, 0, 0, 1, 1,
-0.7507153, 0.3327554, -2.070956, 0, 0, 0, 1, 1,
-0.739153, 0.5719082, -0.5261145, 0, 0, 0, 1, 1,
-0.7325804, -0.9572314, -2.257574, 0, 0, 0, 1, 1,
-0.7280396, 0.8799781, 0.9336579, 0, 0, 0, 1, 1,
-0.7261834, -2.199005, -1.525546, 0, 0, 0, 1, 1,
-0.7237233, 2.07393, -0.1993835, 0, 0, 0, 1, 1,
-0.7191935, -2.591018, -3.047446, 0, 0, 0, 1, 1,
-0.7152264, 0.5172802, -1.160422, 1, 1, 1, 1, 1,
-0.7150085, -0.4815136, -1.429866, 1, 1, 1, 1, 1,
-0.7119487, 1.956747, -1.956863, 1, 1, 1, 1, 1,
-0.6999972, 0.01984254, -1.14282, 1, 1, 1, 1, 1,
-0.6981178, -1.925395, -1.588851, 1, 1, 1, 1, 1,
-0.6973863, 0.0635671, -1.294123, 1, 1, 1, 1, 1,
-0.6972358, -0.06475288, -3.028496, 1, 1, 1, 1, 1,
-0.6913217, -0.02411411, -1.411191, 1, 1, 1, 1, 1,
-0.6903181, 2.306279, 1.095829, 1, 1, 1, 1, 1,
-0.6896545, -0.9404441, -4.231395, 1, 1, 1, 1, 1,
-0.6876031, 0.2483603, -0.9300727, 1, 1, 1, 1, 1,
-0.6860527, -0.9228101, -0.8295313, 1, 1, 1, 1, 1,
-0.6838712, -0.828803, -0.4126739, 1, 1, 1, 1, 1,
-0.6824371, 0.9469142, -1.022426, 1, 1, 1, 1, 1,
-0.6766381, 0.2553381, -0.70736, 1, 1, 1, 1, 1,
-0.6658808, 1.690798, -1.88002, 0, 0, 1, 1, 1,
-0.6577803, -0.7960544, -0.8726397, 1, 0, 0, 1, 1,
-0.6554617, -0.4747527, -1.02081, 1, 0, 0, 1, 1,
-0.6537267, 0.5809893, 0.4310363, 1, 0, 0, 1, 1,
-0.6526343, 1.578673, 0.654188, 1, 0, 0, 1, 1,
-0.6511469, -0.271713, -1.486547, 1, 0, 0, 1, 1,
-0.6486682, -0.65332, 0.09785684, 0, 0, 0, 1, 1,
-0.6420133, 0.03738509, -1.4335, 0, 0, 0, 1, 1,
-0.6356394, 0.8521996, 0.2506344, 0, 0, 0, 1, 1,
-0.6350912, 1.005706, -1.96147, 0, 0, 0, 1, 1,
-0.6273957, 1.420774, 0.2760382, 0, 0, 0, 1, 1,
-0.6270193, 0.5278774, -1.707093, 0, 0, 0, 1, 1,
-0.6265633, -1.032789, -2.953907, 0, 0, 0, 1, 1,
-0.6260206, 3.238908, 0.3476134, 1, 1, 1, 1, 1,
-0.6235584, 1.197545, 0.1160447, 1, 1, 1, 1, 1,
-0.6160911, -0.6112762, -1.023682, 1, 1, 1, 1, 1,
-0.6155466, -0.1324134, -1.895175, 1, 1, 1, 1, 1,
-0.6147661, -0.7877464, -4.313396, 1, 1, 1, 1, 1,
-0.614724, 0.07292974, -2.064777, 1, 1, 1, 1, 1,
-0.6084621, -0.6601993, -2.116717, 1, 1, 1, 1, 1,
-0.6021345, 0.7062901, -0.9759172, 1, 1, 1, 1, 1,
-0.6005923, 0.01527417, -2.086045, 1, 1, 1, 1, 1,
-0.5954355, 0.2040737, -2.603323, 1, 1, 1, 1, 1,
-0.5937918, 0.3935484, -1.800403, 1, 1, 1, 1, 1,
-0.5912284, 1.241151, -0.6323559, 1, 1, 1, 1, 1,
-0.5873349, -0.07007634, 1.175753, 1, 1, 1, 1, 1,
-0.5860566, 0.3012316, -3.100718, 1, 1, 1, 1, 1,
-0.5860016, -0.1893858, -1.232979, 1, 1, 1, 1, 1,
-0.5850958, 0.9665111, 0.690136, 0, 0, 1, 1, 1,
-0.5832555, -0.9614179, -3.99996, 1, 0, 0, 1, 1,
-0.5745908, 0.92167, -0.3184035, 1, 0, 0, 1, 1,
-0.5735025, 0.5562147, -1.008081, 1, 0, 0, 1, 1,
-0.5727757, -1.406927, -3.889601, 1, 0, 0, 1, 1,
-0.5686546, 1.278901, 0.3657022, 1, 0, 0, 1, 1,
-0.5682187, 1.663471, -0.8762363, 0, 0, 0, 1, 1,
-0.5652078, -0.6907808, -2.680538, 0, 0, 0, 1, 1,
-0.563206, -1.086005, -3.240491, 0, 0, 0, 1, 1,
-0.5549116, -1.51107, -2.054424, 0, 0, 0, 1, 1,
-0.5539942, -1.444075, -1.594594, 0, 0, 0, 1, 1,
-0.5535066, -1.273225, -1.50889, 0, 0, 0, 1, 1,
-0.5501686, 0.3465192, -1.049675, 0, 0, 0, 1, 1,
-0.5500597, -0.5768815, -2.494386, 1, 1, 1, 1, 1,
-0.54611, 0.6464649, -0.1366885, 1, 1, 1, 1, 1,
-0.54255, -0.8124292, -2.834121, 1, 1, 1, 1, 1,
-0.5401527, 1.357822, 0.3766188, 1, 1, 1, 1, 1,
-0.5381351, 1.024497, 0.8796322, 1, 1, 1, 1, 1,
-0.5373718, -0.2195757, -1.968115, 1, 1, 1, 1, 1,
-0.5341069, -1.187569, -1.043837, 1, 1, 1, 1, 1,
-0.5322345, -0.5669898, -1.189655, 1, 1, 1, 1, 1,
-0.5321832, 1.548486, -0.4067214, 1, 1, 1, 1, 1,
-0.5280655, 0.2553966, 0.4944925, 1, 1, 1, 1, 1,
-0.5169811, -0.280523, -2.739249, 1, 1, 1, 1, 1,
-0.5148833, 0.5666376, -1.356658, 1, 1, 1, 1, 1,
-0.5136285, -0.1200779, -1.811571, 1, 1, 1, 1, 1,
-0.510681, 0.2604961, -1.413296, 1, 1, 1, 1, 1,
-0.5093204, -0.7159349, -3.663908, 1, 1, 1, 1, 1,
-0.5072482, -0.1251083, -0.9709989, 0, 0, 1, 1, 1,
-0.5039719, -0.2778384, -3.890024, 1, 0, 0, 1, 1,
-0.5031089, 0.9054675, -0.7127031, 1, 0, 0, 1, 1,
-0.4990685, -0.3638881, -0.6007347, 1, 0, 0, 1, 1,
-0.498948, 0.2138874, -1.693266, 1, 0, 0, 1, 1,
-0.4968656, -2.288476, -3.807035, 1, 0, 0, 1, 1,
-0.4951186, -0.8739266, -3.140738, 0, 0, 0, 1, 1,
-0.4938408, 1.271289, 0.06095925, 0, 0, 0, 1, 1,
-0.4864604, 0.9333581, 1.394881, 0, 0, 0, 1, 1,
-0.4846739, 1.575773, 0.09785447, 0, 0, 0, 1, 1,
-0.4843478, 0.1396891, -2.305614, 0, 0, 0, 1, 1,
-0.4818349, -0.6399153, -1.566898, 0, 0, 0, 1, 1,
-0.4730845, -0.6977913, -1.003811, 0, 0, 0, 1, 1,
-0.4706776, 1.21442, -0.6880202, 1, 1, 1, 1, 1,
-0.4685508, -0.4653407, -1.84913, 1, 1, 1, 1, 1,
-0.4662813, 1.055381, 0.4470557, 1, 1, 1, 1, 1,
-0.4651193, 0.07523987, -1.697442, 1, 1, 1, 1, 1,
-0.4594422, -0.3461664, -2.932949, 1, 1, 1, 1, 1,
-0.4593465, 0.240722, -1.8459, 1, 1, 1, 1, 1,
-0.4510048, -0.4889869, -3.217394, 1, 1, 1, 1, 1,
-0.4486815, 1.976622, 1.113917, 1, 1, 1, 1, 1,
-0.4482459, -1.378566, -3.640487, 1, 1, 1, 1, 1,
-0.4389957, -0.55396, -1.550893, 1, 1, 1, 1, 1,
-0.4348271, 0.8683549, -1.496846, 1, 1, 1, 1, 1,
-0.4307491, -0.6659049, -1.73121, 1, 1, 1, 1, 1,
-0.428152, -0.7951822, -3.220898, 1, 1, 1, 1, 1,
-0.4250304, 0.2264349, 0.05001967, 1, 1, 1, 1, 1,
-0.4211821, 1.426074, -0.7073336, 1, 1, 1, 1, 1,
-0.4205462, -2.024641, -2.558981, 0, 0, 1, 1, 1,
-0.4164119, -0.5524495, -1.883725, 1, 0, 0, 1, 1,
-0.4102908, 0.6863797, -1.980214, 1, 0, 0, 1, 1,
-0.4100799, 0.003869073, -3.300895, 1, 0, 0, 1, 1,
-0.4091372, -2.688337, -1.155449, 1, 0, 0, 1, 1,
-0.4043125, -1.0997, -2.01148, 1, 0, 0, 1, 1,
-0.4029851, -0.837981, -3.199672, 0, 0, 0, 1, 1,
-0.3997001, 0.09983978, -1.437701, 0, 0, 0, 1, 1,
-0.3937482, 0.02940878, -2.219513, 0, 0, 0, 1, 1,
-0.3920309, -1.362325, -1.198998, 0, 0, 0, 1, 1,
-0.3878693, 1.672375, -0.3756087, 0, 0, 0, 1, 1,
-0.3805743, -1.319865, -4.848608, 0, 0, 0, 1, 1,
-0.3757599, -0.3227474, -3.221421, 0, 0, 0, 1, 1,
-0.3733162, 1.417268, 0.1533239, 1, 1, 1, 1, 1,
-0.3643907, -0.6640655, -3.89794, 1, 1, 1, 1, 1,
-0.3631943, 1.745636, 0.1347532, 1, 1, 1, 1, 1,
-0.3606158, -0.09791012, 0.1642906, 1, 1, 1, 1, 1,
-0.3585668, -0.2603328, -4.128506, 1, 1, 1, 1, 1,
-0.3584706, -1.495598, -2.675587, 1, 1, 1, 1, 1,
-0.3431879, -0.8965003, -2.879822, 1, 1, 1, 1, 1,
-0.3416414, 0.04753477, -0.9119362, 1, 1, 1, 1, 1,
-0.3380214, 0.6527474, -0.2063096, 1, 1, 1, 1, 1,
-0.3325584, 1.022894, -2.363547, 1, 1, 1, 1, 1,
-0.3240596, -0.1861496, -0.9262627, 1, 1, 1, 1, 1,
-0.323863, 0.1629566, -0.4799632, 1, 1, 1, 1, 1,
-0.3238617, 3.045169, -0.308916, 1, 1, 1, 1, 1,
-0.3220023, 0.4824745, -1.985768, 1, 1, 1, 1, 1,
-0.3189127, -2.386136, -3.560457, 1, 1, 1, 1, 1,
-0.3146123, -0.01076099, -2.245975, 0, 0, 1, 1, 1,
-0.3035633, 0.9009296, -0.5394983, 1, 0, 0, 1, 1,
-0.3032427, 1.21649, -1.25853, 1, 0, 0, 1, 1,
-0.2962797, -0.7133137, -4.207484, 1, 0, 0, 1, 1,
-0.291703, 0.3759295, -0.2871171, 1, 0, 0, 1, 1,
-0.2882537, 0.8990659, -0.3827172, 1, 0, 0, 1, 1,
-0.2866387, -0.6419994, -2.236616, 0, 0, 0, 1, 1,
-0.2856978, -0.673857, -1.838377, 0, 0, 0, 1, 1,
-0.2844974, 0.2362768, -2.010081, 0, 0, 0, 1, 1,
-0.2814415, -1.166226, -2.311189, 0, 0, 0, 1, 1,
-0.2724608, 0.4904669, -1.081545, 0, 0, 0, 1, 1,
-0.2628571, -0.2005078, -2.934462, 0, 0, 0, 1, 1,
-0.2626964, 0.833311, 0.4523031, 0, 0, 0, 1, 1,
-0.2605036, -1.508254, -3.536124, 1, 1, 1, 1, 1,
-0.2601885, -0.6534235, -2.163333, 1, 1, 1, 1, 1,
-0.2589222, 0.5120288, -0.1600508, 1, 1, 1, 1, 1,
-0.2571784, -1.308327, -2.72537, 1, 1, 1, 1, 1,
-0.2532544, -1.092698, -4.330081, 1, 1, 1, 1, 1,
-0.2491917, -1.549684, -1.883345, 1, 1, 1, 1, 1,
-0.2478599, 0.227274, -1.350744, 1, 1, 1, 1, 1,
-0.2449556, -0.2430056, -2.710919, 1, 1, 1, 1, 1,
-0.2415021, -0.9505534, -1.692689, 1, 1, 1, 1, 1,
-0.2395025, 1.09123, -0.9217508, 1, 1, 1, 1, 1,
-0.2394369, 0.04202823, -2.320343, 1, 1, 1, 1, 1,
-0.2326311, -0.1955217, -4.251193, 1, 1, 1, 1, 1,
-0.2275571, -0.9768665, -1.943801, 1, 1, 1, 1, 1,
-0.225071, 0.7522196, 1.941788, 1, 1, 1, 1, 1,
-0.2248718, 0.5709849, -0.5277057, 1, 1, 1, 1, 1,
-0.2240561, 1.757927, -2.28382, 0, 0, 1, 1, 1,
-0.2208642, 0.7193366, -1.048977, 1, 0, 0, 1, 1,
-0.220092, -0.06973992, -2.623832, 1, 0, 0, 1, 1,
-0.2156934, -0.7470074, -3.581527, 1, 0, 0, 1, 1,
-0.2140194, -0.3391157, -1.714743, 1, 0, 0, 1, 1,
-0.2138655, 0.1064441, -2.224713, 1, 0, 0, 1, 1,
-0.213506, -0.3450268, -1.735203, 0, 0, 0, 1, 1,
-0.2130606, 0.08377993, -0.8683541, 0, 0, 0, 1, 1,
-0.2127594, 0.3490206, -0.7539435, 0, 0, 0, 1, 1,
-0.2094637, 2.520717, -0.2818199, 0, 0, 0, 1, 1,
-0.2092421, -0.855756, -2.902908, 0, 0, 0, 1, 1,
-0.2019591, 0.2743981, -1.090105, 0, 0, 0, 1, 1,
-0.1999646, 1.145085, 1.241501, 0, 0, 0, 1, 1,
-0.1985025, -1.814694, -2.669601, 1, 1, 1, 1, 1,
-0.1965781, -0.3598986, -1.136633, 1, 1, 1, 1, 1,
-0.1960413, 0.8681209, -2.848818, 1, 1, 1, 1, 1,
-0.1950391, -0.1755203, -3.872745, 1, 1, 1, 1, 1,
-0.1947249, -0.6234546, -3.882992, 1, 1, 1, 1, 1,
-0.1947113, -0.8978741, -3.102691, 1, 1, 1, 1, 1,
-0.193309, 0.08221047, -1.017345, 1, 1, 1, 1, 1,
-0.1931406, -0.4681238, -1.884744, 1, 1, 1, 1, 1,
-0.1913252, 0.3604386, -2.648385, 1, 1, 1, 1, 1,
-0.1895845, 0.2664898, -1.518954, 1, 1, 1, 1, 1,
-0.1877178, 0.1073578, -2.29872, 1, 1, 1, 1, 1,
-0.1876093, 0.9518592, 0.4424711, 1, 1, 1, 1, 1,
-0.1836975, -1.228493, -2.035067, 1, 1, 1, 1, 1,
-0.1830907, 2.272228, -1.058508, 1, 1, 1, 1, 1,
-0.179081, 0.6462038, 1.584005, 1, 1, 1, 1, 1,
-0.1781182, -0.06502794, -1.089537, 0, 0, 1, 1, 1,
-0.173217, -0.3833666, -3.358051, 1, 0, 0, 1, 1,
-0.1727705, 0.8312705, 0.5370561, 1, 0, 0, 1, 1,
-0.1678289, 0.9185075, 0.5445856, 1, 0, 0, 1, 1,
-0.1634732, -0.7702774, -1.826806, 1, 0, 0, 1, 1,
-0.1595279, -0.7203341, -2.899447, 1, 0, 0, 1, 1,
-0.1590373, 0.4570625, 0.7312841, 0, 0, 0, 1, 1,
-0.1586597, -0.2336123, -2.646531, 0, 0, 0, 1, 1,
-0.1579929, -0.2079329, -1.846132, 0, 0, 0, 1, 1,
-0.1559255, 0.6060331, 0.7159132, 0, 0, 0, 1, 1,
-0.1526005, 1.14538, 0.6163556, 0, 0, 0, 1, 1,
-0.1516135, -0.1145899, -0.7685995, 0, 0, 0, 1, 1,
-0.1508443, 1.69617, -0.2234752, 0, 0, 0, 1, 1,
-0.1492466, -0.3847136, -2.613692, 1, 1, 1, 1, 1,
-0.1456772, 0.4595011, -0.08169112, 1, 1, 1, 1, 1,
-0.1402634, 1.336419, -0.697114, 1, 1, 1, 1, 1,
-0.1379583, -0.263839, -0.9841838, 1, 1, 1, 1, 1,
-0.1364983, 0.1945486, 1.949038, 1, 1, 1, 1, 1,
-0.1317189, -0.3251928, -1.642152, 1, 1, 1, 1, 1,
-0.1263178, -0.01534995, -3.309508, 1, 1, 1, 1, 1,
-0.1235411, -0.1278308, -3.072363, 1, 1, 1, 1, 1,
-0.1232884, -0.1868877, -3.552722, 1, 1, 1, 1, 1,
-0.1223021, -0.2050512, -2.568864, 1, 1, 1, 1, 1,
-0.1215316, 0.8370255, -0.5304837, 1, 1, 1, 1, 1,
-0.1183141, -0.1605664, -2.74272, 1, 1, 1, 1, 1,
-0.1154202, -0.2791632, -3.478703, 1, 1, 1, 1, 1,
-0.1128849, -1.899091, -3.135177, 1, 1, 1, 1, 1,
-0.1113748, -0.3135664, -2.261723, 1, 1, 1, 1, 1,
-0.1109445, -0.8491501, -2.03638, 0, 0, 1, 1, 1,
-0.1098772, -1.127961, -3.739066, 1, 0, 0, 1, 1,
-0.1097254, -1.024814, -4.369651, 1, 0, 0, 1, 1,
-0.1074136, 0.3805184, 0.8800321, 1, 0, 0, 1, 1,
-0.1071646, 0.1770133, 0.632551, 1, 0, 0, 1, 1,
-0.1046266, 0.1796429, -0.5928971, 1, 0, 0, 1, 1,
-0.1036416, 1.77264, -2.427956, 0, 0, 0, 1, 1,
-0.1019769, -0.8830155, -3.100037, 0, 0, 0, 1, 1,
-0.1005087, 1.350636, 0.4640735, 0, 0, 0, 1, 1,
-0.09944317, -1.047169, -3.942859, 0, 0, 0, 1, 1,
-0.09883573, -1.56285, -2.17561, 0, 0, 0, 1, 1,
-0.09883431, 1.348009, -1.208555, 0, 0, 0, 1, 1,
-0.09534444, 0.1318958, -1.006335, 0, 0, 0, 1, 1,
-0.08849314, 0.6854475, 0.06671135, 1, 1, 1, 1, 1,
-0.0826566, 0.1581579, -2.241821, 1, 1, 1, 1, 1,
-0.08136106, -1.178365, -1.672368, 1, 1, 1, 1, 1,
-0.08075636, 0.5840209, 2.364626, 1, 1, 1, 1, 1,
-0.08062937, 1.330402, 0.8107784, 1, 1, 1, 1, 1,
-0.07878958, -0.3712987, -3.303957, 1, 1, 1, 1, 1,
-0.07819429, 0.5985321, 2.234475, 1, 1, 1, 1, 1,
-0.07258034, 0.2201111, -0.2355527, 1, 1, 1, 1, 1,
-0.06860008, -0.3063836, -3.858305, 1, 1, 1, 1, 1,
-0.06515122, 1.437802, -0.5199838, 1, 1, 1, 1, 1,
-0.06504919, -0.107885, -3.418708, 1, 1, 1, 1, 1,
-0.06394536, -0.4490089, -3.391378, 1, 1, 1, 1, 1,
-0.06177027, -0.3047184, -4.498495, 1, 1, 1, 1, 1,
-0.06036671, -0.6754307, -2.065762, 1, 1, 1, 1, 1,
-0.0590216, 0.3486504, -0.2420252, 1, 1, 1, 1, 1,
-0.05866604, -1.694606, -4.259257, 0, 0, 1, 1, 1,
-0.05582172, -1.290134, -3.312264, 1, 0, 0, 1, 1,
-0.05431344, -0.7774425, -2.855393, 1, 0, 0, 1, 1,
-0.0490358, -0.6574777, -1.445645, 1, 0, 0, 1, 1,
-0.04626434, -1.040102, -1.21333, 1, 0, 0, 1, 1,
-0.04602509, -0.07278293, -2.666894, 1, 0, 0, 1, 1,
-0.04580078, -1.02906, -3.175895, 0, 0, 0, 1, 1,
-0.04465814, 0.7250103, 1.123153, 0, 0, 0, 1, 1,
-0.04328499, 0.7958133, -0.7364925, 0, 0, 0, 1, 1,
-0.04263231, -1.376852, -2.975939, 0, 0, 0, 1, 1,
-0.04042019, -0.7839535, -5.277348, 0, 0, 0, 1, 1,
-0.04000309, -0.326914, -2.43165, 0, 0, 0, 1, 1,
-0.03996677, -2.421211, -3.568027, 0, 0, 0, 1, 1,
-0.03773254, -0.6270996, -1.605165, 1, 1, 1, 1, 1,
-0.03327929, -0.948902, -2.586491, 1, 1, 1, 1, 1,
-0.03059012, -0.1591912, -4.307286, 1, 1, 1, 1, 1,
-0.02933804, 0.06242011, 0.4899493, 1, 1, 1, 1, 1,
-0.02817392, -0.3442722, -4.09424, 1, 1, 1, 1, 1,
-0.02696913, -0.3596642, -3.545826, 1, 1, 1, 1, 1,
-0.01953925, -1.145673, -3.489358, 1, 1, 1, 1, 1,
-0.01785653, 0.4879707, -0.6254467, 1, 1, 1, 1, 1,
-0.01529247, 1.391835, -1.126397, 1, 1, 1, 1, 1,
-0.01396442, -0.849152, -3.833408, 1, 1, 1, 1, 1,
-0.01352612, 1.652155, -1.118895, 1, 1, 1, 1, 1,
-0.01315442, 0.2614473, -0.2436205, 1, 1, 1, 1, 1,
-0.01082417, -0.3262229, -2.588387, 1, 1, 1, 1, 1,
-0.01072199, -0.1074952, -3.232044, 1, 1, 1, 1, 1,
-0.008549656, -0.1895794, -1.980765, 1, 1, 1, 1, 1,
-0.006927498, -1.844496, -3.41437, 0, 0, 1, 1, 1,
-0.006712878, -1.79275, -3.622958, 1, 0, 0, 1, 1,
-0.005571812, -0.3207815, -3.909009, 1, 0, 0, 1, 1,
-0.003089805, 1.092238, -0.6187437, 1, 0, 0, 1, 1,
-0.001962184, 1.033576, 0.6081851, 1, 0, 0, 1, 1,
-0.001496006, 0.4504773, 1.015848, 1, 0, 0, 1, 1,
0.002216006, -1.83879, 3.540955, 0, 0, 0, 1, 1,
0.00256419, 0.245168, 0.08144905, 0, 0, 0, 1, 1,
0.004878941, -0.7662575, 4.094303, 0, 0, 0, 1, 1,
0.009226993, 0.1911913, 2.332645, 0, 0, 0, 1, 1,
0.01007684, 1.404608, -1.583175, 0, 0, 0, 1, 1,
0.01066494, -0.3275743, 3.365838, 0, 0, 0, 1, 1,
0.02085881, 1.905621, 1.158585, 0, 0, 0, 1, 1,
0.02136318, 0.3799261, 0.03676376, 1, 1, 1, 1, 1,
0.02325064, -0.6208138, 2.738847, 1, 1, 1, 1, 1,
0.02342891, -0.06272008, 3.915345, 1, 1, 1, 1, 1,
0.02637504, 0.6314679, -0.08616063, 1, 1, 1, 1, 1,
0.02707238, -1.369364, 1.898743, 1, 1, 1, 1, 1,
0.02748783, 1.591628, 0.7856313, 1, 1, 1, 1, 1,
0.02891484, 0.2248536, 0.5888355, 1, 1, 1, 1, 1,
0.03000661, 0.9121227, -0.5080051, 1, 1, 1, 1, 1,
0.03033382, -1.259144, 2.687567, 1, 1, 1, 1, 1,
0.03189846, -0.2539732, 3.75889, 1, 1, 1, 1, 1,
0.03402462, 0.2782404, 1.080189, 1, 1, 1, 1, 1,
0.03514539, -0.2943656, 2.348425, 1, 1, 1, 1, 1,
0.03635963, 2.049495, 1.084993, 1, 1, 1, 1, 1,
0.03942069, 0.3946846, -0.5511139, 1, 1, 1, 1, 1,
0.03948825, 0.6313747, -0.2146884, 1, 1, 1, 1, 1,
0.04193924, -0.3622968, 1.92488, 0, 0, 1, 1, 1,
0.04290127, -1.187924, 4.048322, 1, 0, 0, 1, 1,
0.05021807, -0.2836549, 2.614701, 1, 0, 0, 1, 1,
0.0540805, 0.448572, 3.855961, 1, 0, 0, 1, 1,
0.05698881, 0.7423516, -1.164771, 1, 0, 0, 1, 1,
0.06255443, 1.373823, -0.1217584, 1, 0, 0, 1, 1,
0.06373742, 0.5905731, -1.313596, 0, 0, 0, 1, 1,
0.06945947, -0.2143011, 1.67364, 0, 0, 0, 1, 1,
0.07243813, -1.13357, 2.106246, 0, 0, 0, 1, 1,
0.07243874, 0.005725326, 1.478004, 0, 0, 0, 1, 1,
0.07503052, -0.01120303, 2.864073, 0, 0, 0, 1, 1,
0.07513718, -0.1829072, 3.858868, 0, 0, 0, 1, 1,
0.07981269, 1.047407, 0.3597184, 0, 0, 0, 1, 1,
0.08834295, -0.9406716, 2.517451, 1, 1, 1, 1, 1,
0.09163252, -0.2961959, 2.666139, 1, 1, 1, 1, 1,
0.09674868, 1.199833, -0.8925864, 1, 1, 1, 1, 1,
0.09994354, -0.4891181, 3.0301, 1, 1, 1, 1, 1,
0.1021704, -0.01376579, -0.4756192, 1, 1, 1, 1, 1,
0.1053024, 0.3931598, -1.801072, 1, 1, 1, 1, 1,
0.1067893, -0.3146241, 1.824759, 1, 1, 1, 1, 1,
0.1143781, -0.8807724, 2.047437, 1, 1, 1, 1, 1,
0.1150691, 1.318633, -0.622317, 1, 1, 1, 1, 1,
0.1191314, -0.2334227, 2.075342, 1, 1, 1, 1, 1,
0.1192386, -0.1782731, 2.906927, 1, 1, 1, 1, 1,
0.1263886, -0.2641563, 2.084791, 1, 1, 1, 1, 1,
0.1265816, -0.7156227, 2.33678, 1, 1, 1, 1, 1,
0.1291112, -0.8666478, 2.152501, 1, 1, 1, 1, 1,
0.1294975, 0.2924855, 0.3794438, 1, 1, 1, 1, 1,
0.1295135, -1.581814, 3.333288, 0, 0, 1, 1, 1,
0.1297168, 1.638857, -0.9689733, 1, 0, 0, 1, 1,
0.1302763, -0.7790851, 1.548716, 1, 0, 0, 1, 1,
0.1324316, 0.6132679, 1.027119, 1, 0, 0, 1, 1,
0.1333127, -1.067385, 5.053852, 1, 0, 0, 1, 1,
0.1344755, -0.7755904, 3.362298, 1, 0, 0, 1, 1,
0.1372025, -0.8344986, 2.381577, 0, 0, 0, 1, 1,
0.1374161, 0.1742054, 0.7946704, 0, 0, 0, 1, 1,
0.1396192, 1.046726, -0.836655, 0, 0, 0, 1, 1,
0.1397238, -1.610698, 2.984628, 0, 0, 0, 1, 1,
0.1405351, 0.003881525, 2.076991, 0, 0, 0, 1, 1,
0.1417624, 0.08597854, 0.09821837, 0, 0, 0, 1, 1,
0.1445632, 0.9604488, -0.6514613, 0, 0, 0, 1, 1,
0.1507768, 1.477656, 1.228353, 1, 1, 1, 1, 1,
0.1513108, -0.3361037, 2.465061, 1, 1, 1, 1, 1,
0.1514297, -0.430402, 3.887986, 1, 1, 1, 1, 1,
0.1522627, 1.164412, -0.5193236, 1, 1, 1, 1, 1,
0.1608237, 0.2999316, 0.3453407, 1, 1, 1, 1, 1,
0.1629773, -0.4416546, 3.151022, 1, 1, 1, 1, 1,
0.1638353, -1.809565, 3.317667, 1, 1, 1, 1, 1,
0.1648968, 1.207219, 0.1163046, 1, 1, 1, 1, 1,
0.1660728, -0.6439051, 2.737542, 1, 1, 1, 1, 1,
0.1685766, -0.3370309, 1.02986, 1, 1, 1, 1, 1,
0.1738713, -0.7100974, 2.794453, 1, 1, 1, 1, 1,
0.174078, 0.4757005, 0.138616, 1, 1, 1, 1, 1,
0.1743508, -0.3746013, 3.636805, 1, 1, 1, 1, 1,
0.1743554, 1.48363, 1.469248, 1, 1, 1, 1, 1,
0.178131, -0.7010701, 0.9769795, 1, 1, 1, 1, 1,
0.1781495, -1.821408, 2.389675, 0, 0, 1, 1, 1,
0.1854046, -0.6014549, 2.899956, 1, 0, 0, 1, 1,
0.1893205, -0.08795527, 2.659482, 1, 0, 0, 1, 1,
0.191789, -0.007140102, 1.847571, 1, 0, 0, 1, 1,
0.1923419, -0.1725418, 4.111764, 1, 0, 0, 1, 1,
0.1988365, 1.114991, 0.6142706, 1, 0, 0, 1, 1,
0.1993845, -0.04489738, 2.448389, 0, 0, 0, 1, 1,
0.2080246, 1.269401, 2.085348, 0, 0, 0, 1, 1,
0.210637, -0.8409446, 4.223445, 0, 0, 0, 1, 1,
0.2133131, 1.020922, -0.1113745, 0, 0, 0, 1, 1,
0.2156444, 0.5818811, 0.9799441, 0, 0, 0, 1, 1,
0.2168477, -1.063347, 5.240994, 0, 0, 0, 1, 1,
0.2185875, -0.5100833, 2.62832, 0, 0, 0, 1, 1,
0.2189248, -0.6010674, 2.65601, 1, 1, 1, 1, 1,
0.2197007, 0.2983055, 0.4535002, 1, 1, 1, 1, 1,
0.2221635, -0.4216141, 2.399806, 1, 1, 1, 1, 1,
0.22335, 2.058598, 0.6275865, 1, 1, 1, 1, 1,
0.2263312, 2.03241, -0.2871808, 1, 1, 1, 1, 1,
0.2266253, -0.7325194, 1.614319, 1, 1, 1, 1, 1,
0.2296996, 0.2185617, 2.294898, 1, 1, 1, 1, 1,
0.2351657, 0.9905966, 0.8292297, 1, 1, 1, 1, 1,
0.2388618, -0.9905208, 1.658665, 1, 1, 1, 1, 1,
0.2420287, -0.7200221, 2.996354, 1, 1, 1, 1, 1,
0.2439013, -0.4694166, 2.715976, 1, 1, 1, 1, 1,
0.2445445, -0.8423111, 1.425672, 1, 1, 1, 1, 1,
0.249305, 0.2367125, 2.332982, 1, 1, 1, 1, 1,
0.2531297, 0.1426819, 0.7405193, 1, 1, 1, 1, 1,
0.253754, -0.04501649, 2.069658, 1, 1, 1, 1, 1,
0.2542916, 0.2640122, 1.299351, 0, 0, 1, 1, 1,
0.2558303, -0.5367446, 2.302777, 1, 0, 0, 1, 1,
0.2618474, 2.153532, -0.4686844, 1, 0, 0, 1, 1,
0.2621776, -0.8463991, 1.850182, 1, 0, 0, 1, 1,
0.2649813, 0.810366, 0.4719224, 1, 0, 0, 1, 1,
0.2687845, 1.020814, 1.885945, 1, 0, 0, 1, 1,
0.269465, -1.624576, 5.155934, 0, 0, 0, 1, 1,
0.2697031, -0.2985584, 1.824445, 0, 0, 0, 1, 1,
0.2726035, 1.093848, -0.2026903, 0, 0, 0, 1, 1,
0.2727234, 0.05783914, 2.855193, 0, 0, 0, 1, 1,
0.2770027, -0.8424303, 3.944505, 0, 0, 0, 1, 1,
0.2771125, 0.01350313, 0.9492213, 0, 0, 0, 1, 1,
0.2772861, 0.297224, 0.3203944, 0, 0, 0, 1, 1,
0.2786866, 1.79876, -1.888832, 1, 1, 1, 1, 1,
0.2788448, 0.2970693, 2.145663, 1, 1, 1, 1, 1,
0.2832058, 0.178755, 0.00028181, 1, 1, 1, 1, 1,
0.2870669, -0.1505506, 1.881039, 1, 1, 1, 1, 1,
0.2872528, 1.568634, 0.2694142, 1, 1, 1, 1, 1,
0.2914029, 0.2165038, 2.392092, 1, 1, 1, 1, 1,
0.2937709, -0.1135835, 1.238912, 1, 1, 1, 1, 1,
0.2979532, 0.8484399, 0.06341353, 1, 1, 1, 1, 1,
0.3024781, -0.4246002, 2.395928, 1, 1, 1, 1, 1,
0.3067569, -0.8504071, 2.372358, 1, 1, 1, 1, 1,
0.3082963, -0.2346631, 2.791682, 1, 1, 1, 1, 1,
0.3171364, -0.5472326, 1.783154, 1, 1, 1, 1, 1,
0.3200623, -0.5496432, 3.394515, 1, 1, 1, 1, 1,
0.3244932, -0.2457133, 2.773617, 1, 1, 1, 1, 1,
0.3254223, -1.327182, 2.553931, 1, 1, 1, 1, 1,
0.3319968, 0.7590602, 0.7347865, 0, 0, 1, 1, 1,
0.3377084, -1.907068, 2.241687, 1, 0, 0, 1, 1,
0.3387809, 0.9197308, -0.2635906, 1, 0, 0, 1, 1,
0.3432617, 1.550388, -0.4747341, 1, 0, 0, 1, 1,
0.3464607, -1.115511, 2.300333, 1, 0, 0, 1, 1,
0.3480415, 0.7871214, 2.623169, 1, 0, 0, 1, 1,
0.3519944, -0.1270489, -0.5525578, 0, 0, 0, 1, 1,
0.3541065, 2.028553, -1.684381, 0, 0, 0, 1, 1,
0.3569974, 0.9995067, 2.032512, 0, 0, 0, 1, 1,
0.3582437, -0.103519, 3.317497, 0, 0, 0, 1, 1,
0.3584876, -0.735074, 3.195611, 0, 0, 0, 1, 1,
0.3631388, -1.03958, 4.01846, 0, 0, 0, 1, 1,
0.366844, -0.2633255, 1.485425, 0, 0, 0, 1, 1,
0.3782555, 0.1072383, 1.275452, 1, 1, 1, 1, 1,
0.378715, 2.090292, 0.4281914, 1, 1, 1, 1, 1,
0.3825651, -0.8408086, 3.808822, 1, 1, 1, 1, 1,
0.3842519, 1.54424, 1.650651, 1, 1, 1, 1, 1,
0.3882303, -1.198937, 2.247336, 1, 1, 1, 1, 1,
0.3903974, 1.012651, -1.086624, 1, 1, 1, 1, 1,
0.3912731, -0.8653219, 2.863414, 1, 1, 1, 1, 1,
0.3917158, 0.7615373, 0.9401017, 1, 1, 1, 1, 1,
0.392017, -1.241217, 1.44834, 1, 1, 1, 1, 1,
0.3922154, -0.9511537, 2.669702, 1, 1, 1, 1, 1,
0.3935915, 0.3592168, 0.3238456, 1, 1, 1, 1, 1,
0.3961877, 1.585096, 1.601108, 1, 1, 1, 1, 1,
0.3985935, -0.7537001, 1.958399, 1, 1, 1, 1, 1,
0.4011301, -0.4912784, 3.676328, 1, 1, 1, 1, 1,
0.4032932, 0.1888607, 0.09919967, 1, 1, 1, 1, 1,
0.4061792, 1.015455, -0.7099406, 0, 0, 1, 1, 1,
0.4120885, -1.176165, 2.377106, 1, 0, 0, 1, 1,
0.4162759, -0.7325684, 1.59475, 1, 0, 0, 1, 1,
0.4203417, 0.7681276, 1.433354, 1, 0, 0, 1, 1,
0.4230695, -2.325077, 3.869627, 1, 0, 0, 1, 1,
0.4309856, 0.6872792, 1.250216, 1, 0, 0, 1, 1,
0.4366756, 0.2885086, 1.27996, 0, 0, 0, 1, 1,
0.4375202, 1.151097, 1.535332, 0, 0, 0, 1, 1,
0.437817, -0.8991776, 2.875919, 0, 0, 0, 1, 1,
0.4387548, 1.005716, 0.308145, 0, 0, 0, 1, 1,
0.4446762, 0.4482843, 0.4093485, 0, 0, 0, 1, 1,
0.4448737, -1.049188, 4.356264, 0, 0, 0, 1, 1,
0.4462186, -0.3508106, 0.0221744, 0, 0, 0, 1, 1,
0.4494935, 0.7364761, 1.023883, 1, 1, 1, 1, 1,
0.4533771, -1.542623, 2.002953, 1, 1, 1, 1, 1,
0.4564223, 0.3440216, 2.122134, 1, 1, 1, 1, 1,
0.4576664, 0.911986, 1.35958, 1, 1, 1, 1, 1,
0.4602532, 0.2054232, 0.2183031, 1, 1, 1, 1, 1,
0.463868, 0.1750142, 1.218697, 1, 1, 1, 1, 1,
0.4701787, -0.7409437, -0.03453998, 1, 1, 1, 1, 1,
0.4707895, -0.6637008, 2.84274, 1, 1, 1, 1, 1,
0.4708547, -0.8165988, 3.226965, 1, 1, 1, 1, 1,
0.4709357, 0.1587938, 2.477188, 1, 1, 1, 1, 1,
0.4734381, 0.8007832, -0.8599283, 1, 1, 1, 1, 1,
0.4743617, 0.3743865, 0.4463473, 1, 1, 1, 1, 1,
0.4784425, 1.052785, 0.6216577, 1, 1, 1, 1, 1,
0.4786652, 0.4082304, 0.8751033, 1, 1, 1, 1, 1,
0.4860037, -0.4721407, 0.9450286, 1, 1, 1, 1, 1,
0.4965215, -1.613431, 3.790859, 0, 0, 1, 1, 1,
0.5014337, -0.1125171, 3.173973, 1, 0, 0, 1, 1,
0.502243, 2.142444, -2.002408, 1, 0, 0, 1, 1,
0.5031496, 1.231476, 0.6200806, 1, 0, 0, 1, 1,
0.5085919, 0.1882343, 0.3706589, 1, 0, 0, 1, 1,
0.5120251, 1.123791, -0.4125113, 1, 0, 0, 1, 1,
0.5122848, 1.084113, 0.858076, 0, 0, 0, 1, 1,
0.5144081, 1.448694, -0.5978592, 0, 0, 0, 1, 1,
0.5228011, 1.210298, 0.8388463, 0, 0, 0, 1, 1,
0.5232434, 0.009061548, 0.4568039, 0, 0, 0, 1, 1,
0.5297594, 2.508615, -0.794562, 0, 0, 0, 1, 1,
0.5298817, -0.6561211, 2.381897, 0, 0, 0, 1, 1,
0.5305757, 0.1903163, 0.4754047, 0, 0, 0, 1, 1,
0.5318661, -0.4759738, 1.495133, 1, 1, 1, 1, 1,
0.5321649, 1.451842, 0.456361, 1, 1, 1, 1, 1,
0.5379618, -0.2726638, 3.093964, 1, 1, 1, 1, 1,
0.5390619, 0.3839398, 0.09436852, 1, 1, 1, 1, 1,
0.5398453, 0.458703, 2.527056, 1, 1, 1, 1, 1,
0.5399437, -1.077535, 3.724409, 1, 1, 1, 1, 1,
0.5429127, 0.3773363, 0.63817, 1, 1, 1, 1, 1,
0.5445538, -0.89281, 2.254515, 1, 1, 1, 1, 1,
0.5475759, -1.223937, 4.997315, 1, 1, 1, 1, 1,
0.5503302, -0.8589381, 4.291576, 1, 1, 1, 1, 1,
0.5608838, 0.6197709, -0.4296132, 1, 1, 1, 1, 1,
0.5655531, 0.691793, -0.2118648, 1, 1, 1, 1, 1,
0.5673811, -1.238924, 4.445796, 1, 1, 1, 1, 1,
0.5703153, -1.459127, 2.022412, 1, 1, 1, 1, 1,
0.572762, -1.087547, 3.795125, 1, 1, 1, 1, 1,
0.5775917, 0.4926533, 3.276306, 0, 0, 1, 1, 1,
0.578821, 1.467415, 0.4574145, 1, 0, 0, 1, 1,
0.5826367, 0.3866739, -0.8885529, 1, 0, 0, 1, 1,
0.5868817, 0.4017441, 1.067986, 1, 0, 0, 1, 1,
0.5896217, -1.872997, 2.567147, 1, 0, 0, 1, 1,
0.5899569, 0.6094422, 0.4022245, 1, 0, 0, 1, 1,
0.5915881, 0.04597755, 1.473304, 0, 0, 0, 1, 1,
0.593626, -0.7235969, 2.525817, 0, 0, 0, 1, 1,
0.5959946, -0.9385108, 1.256888, 0, 0, 0, 1, 1,
0.6067073, -2.09791, 3.896016, 0, 0, 0, 1, 1,
0.6100162, -0.4305197, 2.270749, 0, 0, 0, 1, 1,
0.6144943, 0.4017007, 0.9364305, 0, 0, 0, 1, 1,
0.6167483, -1.123327, 1.013488, 0, 0, 0, 1, 1,
0.6206514, -2.143487, 3.485401, 1, 1, 1, 1, 1,
0.6217992, 0.5180727, -0.052006, 1, 1, 1, 1, 1,
0.6222137, 1.116393, -0.4771442, 1, 1, 1, 1, 1,
0.6259116, 0.2704463, -0.0839463, 1, 1, 1, 1, 1,
0.6298221, -1.716042, 1.155449, 1, 1, 1, 1, 1,
0.6300133, 0.5262977, 1.399365, 1, 1, 1, 1, 1,
0.6301296, 0.3400799, 1.160441, 1, 1, 1, 1, 1,
0.6366634, 0.4251309, 2.17781, 1, 1, 1, 1, 1,
0.6372592, 0.5822185, 0.100282, 1, 1, 1, 1, 1,
0.6391031, -0.05000783, 3.002759, 1, 1, 1, 1, 1,
0.6417236, 0.3312862, 0.899209, 1, 1, 1, 1, 1,
0.6422521, -0.3138358, 1.152583, 1, 1, 1, 1, 1,
0.6454811, -0.3336441, 2.063193, 1, 1, 1, 1, 1,
0.6491305, -0.3638397, 1.7421, 1, 1, 1, 1, 1,
0.6513838, 0.2080332, -0.1924745, 1, 1, 1, 1, 1,
0.6534439, -0.1206129, 0.4549894, 0, 0, 1, 1, 1,
0.6580185, 0.7230343, 1.390043, 1, 0, 0, 1, 1,
0.6586844, -0.837553, 2.547669, 1, 0, 0, 1, 1,
0.6625007, 0.3797166, -0.4610456, 1, 0, 0, 1, 1,
0.6633959, 0.8767046, -0.6969483, 1, 0, 0, 1, 1,
0.6653063, 1.026799, -1.691278, 1, 0, 0, 1, 1,
0.6665488, 0.6408871, 0.3717525, 0, 0, 0, 1, 1,
0.6682068, -0.6873402, 3.318398, 0, 0, 0, 1, 1,
0.6700429, 1.878508, -0.8065111, 0, 0, 0, 1, 1,
0.6718061, 1.171936, -0.8869926, 0, 0, 0, 1, 1,
0.6766325, 0.3501022, 2.002928, 0, 0, 0, 1, 1,
0.6781947, 0.620223, 1.691762, 0, 0, 0, 1, 1,
0.6826633, 0.1576495, 2.871491, 0, 0, 0, 1, 1,
0.6830693, -0.2319164, 1.091746, 1, 1, 1, 1, 1,
0.6886993, -0.06482337, 1.64146, 1, 1, 1, 1, 1,
0.6911849, 1.047311, 1.246897, 1, 1, 1, 1, 1,
0.6923443, 0.8906765, 0.57818, 1, 1, 1, 1, 1,
0.6937508, -0.8665876, 1.722877, 1, 1, 1, 1, 1,
0.6940826, -0.1843174, 1.755104, 1, 1, 1, 1, 1,
0.6947005, 0.3984827, 0.1582013, 1, 1, 1, 1, 1,
0.6958093, 0.1397988, 1.57655, 1, 1, 1, 1, 1,
0.6960008, 0.7879425, -0.3837597, 1, 1, 1, 1, 1,
0.7030815, -0.09545536, 3.287228, 1, 1, 1, 1, 1,
0.7051231, -1.027436, 2.563027, 1, 1, 1, 1, 1,
0.7077711, 0.002542104, 2.536182, 1, 1, 1, 1, 1,
0.7164366, -0.9069486, 3.259137, 1, 1, 1, 1, 1,
0.7173637, 0.8662352, 0.8368719, 1, 1, 1, 1, 1,
0.7211329, -0.8005254, 4.061081, 1, 1, 1, 1, 1,
0.7227488, 1.618898, 0.265307, 0, 0, 1, 1, 1,
0.7261737, -2.931425, 3.346138, 1, 0, 0, 1, 1,
0.7288715, -1.436731, 1.394266, 1, 0, 0, 1, 1,
0.7311396, -0.9646073, 2.150244, 1, 0, 0, 1, 1,
0.7317144, -0.5983713, 3.008436, 1, 0, 0, 1, 1,
0.7354653, 1.735019, 1.2583, 1, 0, 0, 1, 1,
0.7413333, -0.589253, 1.499112, 0, 0, 0, 1, 1,
0.7418034, -0.2951137, 1.513822, 0, 0, 0, 1, 1,
0.742488, -0.8755777, 2.146992, 0, 0, 0, 1, 1,
0.7428726, 0.315594, 0.8349973, 0, 0, 0, 1, 1,
0.7463343, -0.5030748, 3.940104, 0, 0, 0, 1, 1,
0.7476885, -1.999437, 2.553711, 0, 0, 0, 1, 1,
0.7496559, 0.5863287, 1.977833, 0, 0, 0, 1, 1,
0.7507334, -0.5411683, 1.126422, 1, 1, 1, 1, 1,
0.7515312, 1.56909, 1.084689, 1, 1, 1, 1, 1,
0.7548536, 0.07212512, 0.8739063, 1, 1, 1, 1, 1,
0.7557559, 0.5512092, -0.7518903, 1, 1, 1, 1, 1,
0.761431, 1.20936, -1.761716, 1, 1, 1, 1, 1,
0.7616818, 1.110592, 2.684062, 1, 1, 1, 1, 1,
0.7648816, -0.3127712, 1.891166, 1, 1, 1, 1, 1,
0.7657531, 1.257215, 0.2967279, 1, 1, 1, 1, 1,
0.7667825, -0.07924657, 2.690514, 1, 1, 1, 1, 1,
0.7679154, -0.3136338, 3.139847, 1, 1, 1, 1, 1,
0.7692783, -0.9023321, 1.739811, 1, 1, 1, 1, 1,
0.7839762, 0.257419, 1.81496, 1, 1, 1, 1, 1,
0.7867727, 0.964368, 0.5801351, 1, 1, 1, 1, 1,
0.804749, 0.02347308, 1.816835, 1, 1, 1, 1, 1,
0.8130084, 0.2559519, 1.846689, 1, 1, 1, 1, 1,
0.8173675, -2.574392, 3.247971, 0, 0, 1, 1, 1,
0.8208112, 0.2609403, 1.181748, 1, 0, 0, 1, 1,
0.8214157, -0.8021809, 2.939912, 1, 0, 0, 1, 1,
0.8240098, -0.1300929, 2.773344, 1, 0, 0, 1, 1,
0.8266827, -0.7895235, 2.691157, 1, 0, 0, 1, 1,
0.8323817, 1.5636, -0.8827636, 1, 0, 0, 1, 1,
0.8364079, 1.568448, 2.606589, 0, 0, 0, 1, 1,
0.8386607, -0.1658128, 2.853103, 0, 0, 0, 1, 1,
0.8396971, -1.165636, 1.764092, 0, 0, 0, 1, 1,
0.8422136, -0.4055113, 1.804385, 0, 0, 0, 1, 1,
0.8422662, 0.1993442, 0.2308515, 0, 0, 0, 1, 1,
0.8466176, 0.7444251, 1.847462, 0, 0, 0, 1, 1,
0.8513653, -0.09267592, 3.318255, 0, 0, 0, 1, 1,
0.8515384, -0.250275, 1.613962, 1, 1, 1, 1, 1,
0.8518246, 0.1192531, 3.005796, 1, 1, 1, 1, 1,
0.8558149, -0.267337, 2.335243, 1, 1, 1, 1, 1,
0.8643674, -1.435682, 1.685105, 1, 1, 1, 1, 1,
0.8648748, -1.022703, 0.5636668, 1, 1, 1, 1, 1,
0.8673753, -0.1325557, 1.083577, 1, 1, 1, 1, 1,
0.8725495, -0.1816432, 0.1280911, 1, 1, 1, 1, 1,
0.8846313, 1.562034, 0.1451022, 1, 1, 1, 1, 1,
0.8995887, -2.656335, 1.286114, 1, 1, 1, 1, 1,
0.9039707, 0.6191912, 2.164825, 1, 1, 1, 1, 1,
0.9055204, 0.8169756, 2.108712, 1, 1, 1, 1, 1,
0.9092068, 0.4103335, 1.540298, 1, 1, 1, 1, 1,
0.9092304, -1.251079, 4.616069, 1, 1, 1, 1, 1,
0.9093319, 2.042502, 1.659343, 1, 1, 1, 1, 1,
0.9153696, 0.06841204, 2.183052, 1, 1, 1, 1, 1,
0.9241681, -0.2356681, -0.2476558, 0, 0, 1, 1, 1,
0.9278619, -2.018068, 1.979638, 1, 0, 0, 1, 1,
0.9294575, -0.4088321, 0.1949961, 1, 0, 0, 1, 1,
0.9305563, 0.1330882, 0.4743612, 1, 0, 0, 1, 1,
0.9311778, 1.028341, 0.4020801, 1, 0, 0, 1, 1,
0.931226, 0.6902257, 1.496588, 1, 0, 0, 1, 1,
0.9339999, 0.02140096, 2.892409, 0, 0, 0, 1, 1,
0.9472642, 0.07009684, 1.265601, 0, 0, 0, 1, 1,
0.9622547, -0.2523749, 0.8937422, 0, 0, 0, 1, 1,
0.9650395, 1.093736, 0.6987273, 0, 0, 0, 1, 1,
0.9662343, 0.6901419, -0.746181, 0, 0, 0, 1, 1,
0.9697676, 0.06184284, 1.873576, 0, 0, 0, 1, 1,
0.9801037, -0.2885543, 1.530239, 0, 0, 0, 1, 1,
0.9803317, 1.732294, 0.1186954, 1, 1, 1, 1, 1,
0.985672, -0.2490377, 0.7058197, 1, 1, 1, 1, 1,
0.9872627, 1.693135, 1.26138, 1, 1, 1, 1, 1,
0.9894952, 0.221204, 1.005287, 1, 1, 1, 1, 1,
0.9964501, -0.250124, 0.9620232, 1, 1, 1, 1, 1,
0.9986501, -0.2357672, 2.549177, 1, 1, 1, 1, 1,
1.002098, 0.1576932, 2.185636, 1, 1, 1, 1, 1,
1.004526, 1.274982, -0.5585715, 1, 1, 1, 1, 1,
1.016533, 0.246484, -0.7021648, 1, 1, 1, 1, 1,
1.026639, 0.1705527, 1.877619, 1, 1, 1, 1, 1,
1.02976, 0.9144019, 1.156564, 1, 1, 1, 1, 1,
1.031641, 0.6272706, 2.465976, 1, 1, 1, 1, 1,
1.03715, 0.6771213, 2.290829, 1, 1, 1, 1, 1,
1.039518, 0.2761595, 0.8346105, 1, 1, 1, 1, 1,
1.040292, -0.09644516, 1.233209, 1, 1, 1, 1, 1,
1.040379, -0.3276561, 2.537512, 0, 0, 1, 1, 1,
1.047904, 0.9420128, 1.972285, 1, 0, 0, 1, 1,
1.052917, -0.5742605, 2.645083, 1, 0, 0, 1, 1,
1.053374, 0.1795062, 2.125697, 1, 0, 0, 1, 1,
1.058983, -0.8400562, 3.02129, 1, 0, 0, 1, 1,
1.059858, -0.8341305, 2.66625, 1, 0, 0, 1, 1,
1.064503, -0.431206, 1.457068, 0, 0, 0, 1, 1,
1.072017, 0.7706349, 1.872755, 0, 0, 0, 1, 1,
1.074853, 0.9946367, 0.30029, 0, 0, 0, 1, 1,
1.076911, -0.1715423, 0.8886768, 0, 0, 0, 1, 1,
1.078045, 0.04465667, 0.5873213, 0, 0, 0, 1, 1,
1.082796, -1.298099, 2.301407, 0, 0, 0, 1, 1,
1.090386, -1.692559, 3.777629, 0, 0, 0, 1, 1,
1.100493, 2.120961, 2.029037, 1, 1, 1, 1, 1,
1.103959, -1.052464, 4.723811, 1, 1, 1, 1, 1,
1.10413, 0.1975657, 2.357639, 1, 1, 1, 1, 1,
1.121171, -2.845738, 1.614487, 1, 1, 1, 1, 1,
1.121499, -0.9852757, 3.181871, 1, 1, 1, 1, 1,
1.126139, -0.5402184, -0.2351639, 1, 1, 1, 1, 1,
1.130599, 2.083041, -0.4384894, 1, 1, 1, 1, 1,
1.134644, 0.2506278, 1.193489, 1, 1, 1, 1, 1,
1.141075, 0.1772098, 2.711397, 1, 1, 1, 1, 1,
1.147079, -0.5181849, 2.368969, 1, 1, 1, 1, 1,
1.148982, -0.1311141, 0.9620053, 1, 1, 1, 1, 1,
1.156582, -0.2602259, 0.5584255, 1, 1, 1, 1, 1,
1.156652, -0.8797477, 3.248709, 1, 1, 1, 1, 1,
1.167871, 0.1421992, 0.4241708, 1, 1, 1, 1, 1,
1.170719, 1.404446, 1.072876, 1, 1, 1, 1, 1,
1.191902, 0.8009658, -0.2405896, 0, 0, 1, 1, 1,
1.194708, 0.03507099, 0.4065425, 1, 0, 0, 1, 1,
1.208688, -1.737064, 1.068676, 1, 0, 0, 1, 1,
1.22074, 0.8410676, 0.08742192, 1, 0, 0, 1, 1,
1.228646, -1.426741, 1.291535, 1, 0, 0, 1, 1,
1.228897, 1.811463, 1.096556, 1, 0, 0, 1, 1,
1.231027, -0.1975755, 1.149592, 0, 0, 0, 1, 1,
1.234932, 0.3744712, 0.9531171, 0, 0, 0, 1, 1,
1.239211, 0.3757931, 1.996485, 0, 0, 0, 1, 1,
1.24277, -0.9694988, 3.491577, 0, 0, 0, 1, 1,
1.243327, 1.749551, 1.176747, 0, 0, 0, 1, 1,
1.248442, 1.277936, 1.367748, 0, 0, 0, 1, 1,
1.252798, 0.5679344, 1.42447, 0, 0, 0, 1, 1,
1.255916, -0.5637055, 1.336729, 1, 1, 1, 1, 1,
1.257857, -0.02902816, 3.694123, 1, 1, 1, 1, 1,
1.27019, -0.8649752, -0.3384036, 1, 1, 1, 1, 1,
1.288339, -1.130855, 1.743576, 1, 1, 1, 1, 1,
1.294869, -0.1285614, 1.669032, 1, 1, 1, 1, 1,
1.302082, -0.2843458, 1.07082, 1, 1, 1, 1, 1,
1.326662, 0.3762108, 2.791016, 1, 1, 1, 1, 1,
1.341833, -1.932961, 1.507226, 1, 1, 1, 1, 1,
1.352228, -0.2424437, 1.534989, 1, 1, 1, 1, 1,
1.35515, 0.548491, 1.604798, 1, 1, 1, 1, 1,
1.359088, 0.2370627, -0.1833131, 1, 1, 1, 1, 1,
1.371409, 1.535324, 1.417862, 1, 1, 1, 1, 1,
1.375956, -2.601654, 4.368966, 1, 1, 1, 1, 1,
1.376513, -0.01116143, 0.1224207, 1, 1, 1, 1, 1,
1.376981, -0.5527455, 1.153391, 1, 1, 1, 1, 1,
1.384882, -0.6432793, 1.862859, 0, 0, 1, 1, 1,
1.389012, 1.648425, 1.894894, 1, 0, 0, 1, 1,
1.391819, -1.644758, 2.057685, 1, 0, 0, 1, 1,
1.394459, 1.101712, 0.5711904, 1, 0, 0, 1, 1,
1.395456, -1.530294, 3.320864, 1, 0, 0, 1, 1,
1.397528, -0.8450209, 1.031639, 1, 0, 0, 1, 1,
1.400822, 2.190967, -2.444387, 0, 0, 0, 1, 1,
1.406561, 1.043078, 1.442722, 0, 0, 0, 1, 1,
1.406996, 1.012198, 1.501788, 0, 0, 0, 1, 1,
1.420227, -0.271795, 0.7964074, 0, 0, 0, 1, 1,
1.426169, -0.2693161, 2.88569, 0, 0, 0, 1, 1,
1.435765, 0.3549774, 2.013795, 0, 0, 0, 1, 1,
1.47388, -0.5636271, 2.673102, 0, 0, 0, 1, 1,
1.474406, -0.06978269, -0.8386959, 1, 1, 1, 1, 1,
1.477079, 1.641127, 0.7157341, 1, 1, 1, 1, 1,
1.480777, -0.8278255, 2.253617, 1, 1, 1, 1, 1,
1.506747, 0.8609647, 0.9418812, 1, 1, 1, 1, 1,
1.521362, 1.029983, 2.215547, 1, 1, 1, 1, 1,
1.523828, -0.1304463, 3.525972, 1, 1, 1, 1, 1,
1.54577, -0.07665134, 1.993681, 1, 1, 1, 1, 1,
1.545871, -0.5495463, 0.7616889, 1, 1, 1, 1, 1,
1.549407, -0.7679267, 2.130482, 1, 1, 1, 1, 1,
1.556193, 2.082815, 1.497923, 1, 1, 1, 1, 1,
1.576821, -0.7698811, 3.423286, 1, 1, 1, 1, 1,
1.581577, -0.7084217, 2.427799, 1, 1, 1, 1, 1,
1.591247, 0.7255703, 2.451661, 1, 1, 1, 1, 1,
1.603427, 1.375544, 1.876035, 1, 1, 1, 1, 1,
1.606734, -0.2258741, 0.1520165, 1, 1, 1, 1, 1,
1.624035, -0.3449627, 1.552252, 0, 0, 1, 1, 1,
1.636766, 0.6397421, 1.397309, 1, 0, 0, 1, 1,
1.639336, 0.5240678, 1.494305, 1, 0, 0, 1, 1,
1.643671, -0.4415311, 1.327509, 1, 0, 0, 1, 1,
1.644564, -0.3229548, 2.118624, 1, 0, 0, 1, 1,
1.646926, -2.656228, 3.394465, 1, 0, 0, 1, 1,
1.651385, -0.6509152, 1.111256, 0, 0, 0, 1, 1,
1.661049, 0.05834621, 2.629747, 0, 0, 0, 1, 1,
1.661059, -1.217664, 3.351574, 0, 0, 0, 1, 1,
1.67479, -0.1758208, 1.550609, 0, 0, 0, 1, 1,
1.688839, 1.381492, 1.241679, 0, 0, 0, 1, 1,
1.714472, 0.7987192, 2.02205, 0, 0, 0, 1, 1,
1.716383, 0.8719528, 0.7517962, 0, 0, 0, 1, 1,
1.718001, 0.5846332, 0.5509767, 1, 1, 1, 1, 1,
1.73096, 1.820013, 3.228573, 1, 1, 1, 1, 1,
1.761273, -0.4307617, 1.995553, 1, 1, 1, 1, 1,
1.772974, 0.8841461, 3.054661, 1, 1, 1, 1, 1,
1.801568, -1.84773, 2.686737, 1, 1, 1, 1, 1,
1.802065, 0.5220504, 1.549164, 1, 1, 1, 1, 1,
1.83389, -0.09608044, -0.01223302, 1, 1, 1, 1, 1,
1.842386, 0.1988943, 2.327433, 1, 1, 1, 1, 1,
1.844621, 0.3674353, 1.796598, 1, 1, 1, 1, 1,
1.855394, 0.1371285, 1.977951, 1, 1, 1, 1, 1,
1.867131, -0.2763974, 3.482275, 1, 1, 1, 1, 1,
1.871854, 0.9526259, 1.925907, 1, 1, 1, 1, 1,
1.886373, 2.989864, 1.2419, 1, 1, 1, 1, 1,
1.910414, -1.443807, 1.224836, 1, 1, 1, 1, 1,
1.911483, -0.6027851, 2.415806, 1, 1, 1, 1, 1,
1.917592, 0.3577563, 3.391989, 0, 0, 1, 1, 1,
1.926281, 2.038406, 0.8648039, 1, 0, 0, 1, 1,
1.949439, 0.4815392, 0.2014685, 1, 0, 0, 1, 1,
1.967322, 1.188984, 0.6072055, 1, 0, 0, 1, 1,
1.972505, 1.314151, -0.5468574, 1, 0, 0, 1, 1,
1.972842, -1.949386, 1.819342, 1, 0, 0, 1, 1,
2.007705, 0.7149161, 2.066463, 0, 0, 0, 1, 1,
2.035196, 0.1347849, 1.237456, 0, 0, 0, 1, 1,
2.052901, -0.6503548, 2.916985, 0, 0, 0, 1, 1,
2.062342, 0.1907923, 1.154147, 0, 0, 0, 1, 1,
2.213538, -1.33095, 3.873609, 0, 0, 0, 1, 1,
2.254665, 1.666963, -0.1148096, 0, 0, 0, 1, 1,
2.273903, 0.9234092, 0.3097032, 0, 0, 0, 1, 1,
2.312062, -0.268376, 1.989764, 1, 1, 1, 1, 1,
2.462262, -0.8607474, 2.52655, 1, 1, 1, 1, 1,
2.689959, -1.35557, 1.049564, 1, 1, 1, 1, 1,
2.731417, 0.769728, 0.8760438, 1, 1, 1, 1, 1,
2.749189, 0.4382117, 0.9737981, 1, 1, 1, 1, 1,
2.789462, 1.288052, 0.2599636, 1, 1, 1, 1, 1,
3.263723, 0.4899431, 1.944951, 1, 1, 1, 1, 1
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
var radius = 9.376332;
var distance = 32.93397;
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
mvMatrix.translate( -0.1659535, -0.1537414, 0.01817679 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.93397);
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
