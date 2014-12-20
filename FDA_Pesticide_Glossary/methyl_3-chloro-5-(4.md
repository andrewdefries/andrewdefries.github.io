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
-3.228947, 1.999889, -2.641005, 1, 0, 0, 1,
-3.117613, 0.6181738, -1.889071, 1, 0.007843138, 0, 1,
-3.115177, 0.001543833, -2.336787, 1, 0.01176471, 0, 1,
-2.915548, 0.900351, 0.1892984, 1, 0.01960784, 0, 1,
-2.868371, -0.02140199, -1.9303, 1, 0.02352941, 0, 1,
-2.600421, -0.01917714, -1.3804, 1, 0.03137255, 0, 1,
-2.577775, -0.273058, -0.05677237, 1, 0.03529412, 0, 1,
-2.573977, 1.538421, -0.9908358, 1, 0.04313726, 0, 1,
-2.457395, 0.1942333, 0.1454911, 1, 0.04705882, 0, 1,
-2.391808, -0.4064786, -2.050391, 1, 0.05490196, 0, 1,
-2.367539, -2.580595, -1.893295, 1, 0.05882353, 0, 1,
-2.350452, -0.2738827, -1.213555, 1, 0.06666667, 0, 1,
-2.32572, 1.591618, -3.132963, 1, 0.07058824, 0, 1,
-2.290154, 0.4297346, -1.642465, 1, 0.07843138, 0, 1,
-2.230205, 0.126355, -2.725225, 1, 0.08235294, 0, 1,
-2.20559, 0.7520837, 0.2242302, 1, 0.09019608, 0, 1,
-2.175221, -2.270265, -2.958399, 1, 0.09411765, 0, 1,
-2.172294, 0.8469567, -1.831211, 1, 0.1019608, 0, 1,
-2.170583, 0.9452711, -1.677338, 1, 0.1098039, 0, 1,
-2.164882, -1.202852, -2.285157, 1, 0.1137255, 0, 1,
-2.140042, 1.147573, 0.5821415, 1, 0.1215686, 0, 1,
-2.138236, 0.9161049, -0.1294141, 1, 0.1254902, 0, 1,
-2.107745, -0.938694, -0.06500173, 1, 0.1333333, 0, 1,
-2.048304, -0.8176074, -2.172377, 1, 0.1372549, 0, 1,
-2.025596, -0.3477257, 0.3044249, 1, 0.145098, 0, 1,
-2.02162, -0.2510937, -2.526145, 1, 0.1490196, 0, 1,
-2.014585, 1.335307, -0.4181764, 1, 0.1568628, 0, 1,
-2.005678, 0.6212325, 0.6111608, 1, 0.1607843, 0, 1,
-2.005164, 0.0345925, -1.532645, 1, 0.1686275, 0, 1,
-1.977619, 1.623474, -0.4593833, 1, 0.172549, 0, 1,
-1.959874, -1.458417, -3.079751, 1, 0.1803922, 0, 1,
-1.915841, -0.9192185, -2.619884, 1, 0.1843137, 0, 1,
-1.882319, -0.9367387, -3.673934, 1, 0.1921569, 0, 1,
-1.877185, -0.8864763, -2.239595, 1, 0.1960784, 0, 1,
-1.861758, 0.332635, -1.420836, 1, 0.2039216, 0, 1,
-1.856437, 1.87958, -2.202731, 1, 0.2117647, 0, 1,
-1.854496, -0.2758432, -0.4694447, 1, 0.2156863, 0, 1,
-1.845677, -1.072639, -3.37281, 1, 0.2235294, 0, 1,
-1.824602, -0.2979579, -0.8810123, 1, 0.227451, 0, 1,
-1.823324, 0.02990416, -1.109038, 1, 0.2352941, 0, 1,
-1.8131, 1.790416, -0.544811, 1, 0.2392157, 0, 1,
-1.803525, -1.887468, -1.50604, 1, 0.2470588, 0, 1,
-1.797955, 0.393063, -2.84816, 1, 0.2509804, 0, 1,
-1.793381, 0.4245769, -1.671407, 1, 0.2588235, 0, 1,
-1.763706, 0.8959695, -1.050873, 1, 0.2627451, 0, 1,
-1.762277, -0.008277378, -1.231566, 1, 0.2705882, 0, 1,
-1.75755, -1.893266, -1.732134, 1, 0.2745098, 0, 1,
-1.74279, -2.241941, -2.282892, 1, 0.282353, 0, 1,
-1.729632, -0.4637218, -2.165523, 1, 0.2862745, 0, 1,
-1.717345, 0.1485231, -0.9139856, 1, 0.2941177, 0, 1,
-1.716976, 0.3058333, -1.522175, 1, 0.3019608, 0, 1,
-1.714635, -0.9000769, -1.34651, 1, 0.3058824, 0, 1,
-1.712414, 1.46392, -1.857963, 1, 0.3137255, 0, 1,
-1.702689, -0.5533161, -2.717371, 1, 0.3176471, 0, 1,
-1.699415, -0.1008551, -0.6115856, 1, 0.3254902, 0, 1,
-1.694859, -0.1963213, -3.939526, 1, 0.3294118, 0, 1,
-1.683056, 0.8214767, -1.88469, 1, 0.3372549, 0, 1,
-1.678649, 0.3722498, -1.504334, 1, 0.3411765, 0, 1,
-1.677978, 0.5046462, -0.7767488, 1, 0.3490196, 0, 1,
-1.63998, -0.04536594, -2.043344, 1, 0.3529412, 0, 1,
-1.639173, 1.406834, -0.5651293, 1, 0.3607843, 0, 1,
-1.603299, 0.1710785, -1.039773, 1, 0.3647059, 0, 1,
-1.602062, -0.8785945, -0.4411501, 1, 0.372549, 0, 1,
-1.59015, -1.154358, -2.206968, 1, 0.3764706, 0, 1,
-1.586049, 1.375901, 0.71078, 1, 0.3843137, 0, 1,
-1.58083, -0.7050394, -2.041172, 1, 0.3882353, 0, 1,
-1.559693, 0.5417874, -0.4061333, 1, 0.3960784, 0, 1,
-1.558589, -0.1415704, -3.178777, 1, 0.4039216, 0, 1,
-1.557343, -0.8400853, -2.402763, 1, 0.4078431, 0, 1,
-1.551353, 1.332383, -0.6830035, 1, 0.4156863, 0, 1,
-1.550055, 0.8790562, -0.1488368, 1, 0.4196078, 0, 1,
-1.548719, -1.192786, -3.064138, 1, 0.427451, 0, 1,
-1.542677, 0.947677, 0.7029056, 1, 0.4313726, 0, 1,
-1.541573, -0.6066889, -0.9333243, 1, 0.4392157, 0, 1,
-1.533214, 0.4762473, -0.4736096, 1, 0.4431373, 0, 1,
-1.532453, -1.345636, -2.21646, 1, 0.4509804, 0, 1,
-1.526656, 1.10475, 0.3594591, 1, 0.454902, 0, 1,
-1.518404, 0.04397239, -3.73661, 1, 0.4627451, 0, 1,
-1.511659, -1.949854, -2.67197, 1, 0.4666667, 0, 1,
-1.508563, 0.5163499, -1.988299, 1, 0.4745098, 0, 1,
-1.50641, -0.3004368, -2.901981, 1, 0.4784314, 0, 1,
-1.501415, 0.3110374, -2.287056, 1, 0.4862745, 0, 1,
-1.467649, -1.134019, -1.318856, 1, 0.4901961, 0, 1,
-1.460114, 0.729853, 0.0438991, 1, 0.4980392, 0, 1,
-1.456039, 1.954155, -1.44852, 1, 0.5058824, 0, 1,
-1.453116, -1.018114, -4.838523, 1, 0.509804, 0, 1,
-1.439335, 1.346117, -2.256972, 1, 0.5176471, 0, 1,
-1.43784, -0.1568263, -1.71618, 1, 0.5215687, 0, 1,
-1.416647, 0.6838928, -2.823835, 1, 0.5294118, 0, 1,
-1.41161, -0.09512889, -2.6546, 1, 0.5333334, 0, 1,
-1.398914, 1.464771, -1.666624, 1, 0.5411765, 0, 1,
-1.380917, -0.2039154, -2.759106, 1, 0.5450981, 0, 1,
-1.373996, -1.417551, -0.9838748, 1, 0.5529412, 0, 1,
-1.367011, -1.189697, -2.912974, 1, 0.5568628, 0, 1,
-1.364363, -1.284318, -0.9405531, 1, 0.5647059, 0, 1,
-1.356733, 0.03167587, -0.6098759, 1, 0.5686275, 0, 1,
-1.348443, -0.07983243, -2.109499, 1, 0.5764706, 0, 1,
-1.343573, -0.2862384, -1.972304, 1, 0.5803922, 0, 1,
-1.335478, 1.2244, -0.4468297, 1, 0.5882353, 0, 1,
-1.331633, -0.02679122, -2.810163, 1, 0.5921569, 0, 1,
-1.326319, -1.040119, -2.335079, 1, 0.6, 0, 1,
-1.324843, -0.4976387, -3.020802, 1, 0.6078432, 0, 1,
-1.313342, -0.5574952, -2.214667, 1, 0.6117647, 0, 1,
-1.30669, -0.08034662, -2.06068, 1, 0.6196079, 0, 1,
-1.300532, -0.5481642, -2.376648, 1, 0.6235294, 0, 1,
-1.286164, -0.8330331, -1.798734, 1, 0.6313726, 0, 1,
-1.279215, 1.388774, 0.7619473, 1, 0.6352941, 0, 1,
-1.275591, -2.3422, -1.967805, 1, 0.6431373, 0, 1,
-1.26898, -0.3256107, -2.591447, 1, 0.6470588, 0, 1,
-1.266979, -0.8199036, -3.390645, 1, 0.654902, 0, 1,
-1.253039, 1.275427, -0.8972529, 1, 0.6588235, 0, 1,
-1.2515, -1.040744, -3.936417, 1, 0.6666667, 0, 1,
-1.240342, 1.131006, -0.9262303, 1, 0.6705883, 0, 1,
-1.240201, -0.2349999, -2.242924, 1, 0.6784314, 0, 1,
-1.239098, 1.058931, -0.5240898, 1, 0.682353, 0, 1,
-1.232701, -0.4371231, -0.4680946, 1, 0.6901961, 0, 1,
-1.22882, 1.453318, -1.807024, 1, 0.6941177, 0, 1,
-1.223584, 0.6933866, -0.8413491, 1, 0.7019608, 0, 1,
-1.22242, -0.6963113, -1.7662, 1, 0.7098039, 0, 1,
-1.207385, 0.8740131, -1.203932, 1, 0.7137255, 0, 1,
-1.205135, 1.069882, -0.682089, 1, 0.7215686, 0, 1,
-1.203622, 0.870815, -0.0581437, 1, 0.7254902, 0, 1,
-1.197081, 1.033179, -1.299032, 1, 0.7333333, 0, 1,
-1.192937, 1.312364, -1.002053, 1, 0.7372549, 0, 1,
-1.191154, -2.33111, -1.986855, 1, 0.7450981, 0, 1,
-1.186485, -0.70648, -1.694024, 1, 0.7490196, 0, 1,
-1.178959, -1.451104, -2.186502, 1, 0.7568628, 0, 1,
-1.177436, 0.5154501, 1.178781, 1, 0.7607843, 0, 1,
-1.176176, 1.770388, -0.4946882, 1, 0.7686275, 0, 1,
-1.174027, 0.3993228, -1.89418, 1, 0.772549, 0, 1,
-1.173306, -0.2794554, -1.474038, 1, 0.7803922, 0, 1,
-1.172057, 1.374598, -0.0803973, 1, 0.7843137, 0, 1,
-1.169126, 0.1480818, -1.583042, 1, 0.7921569, 0, 1,
-1.16504, 0.4303228, -0.3380838, 1, 0.7960784, 0, 1,
-1.160187, 0.2787658, -0.8794825, 1, 0.8039216, 0, 1,
-1.146877, -0.05185708, 1.090157, 1, 0.8117647, 0, 1,
-1.14629, -0.7759011, -3.467603, 1, 0.8156863, 0, 1,
-1.145804, 0.3510734, -0.3429101, 1, 0.8235294, 0, 1,
-1.13374, -0.9466209, -2.911489, 1, 0.827451, 0, 1,
-1.131208, -0.5808658, -2.945542, 1, 0.8352941, 0, 1,
-1.128197, -0.01351609, -2.332546, 1, 0.8392157, 0, 1,
-1.115713, -1.254585, -2.083215, 1, 0.8470588, 0, 1,
-1.114769, 0.625246, -1.246966, 1, 0.8509804, 0, 1,
-1.108707, -0.3308626, -2.372955, 1, 0.8588235, 0, 1,
-1.107522, -1.429378, -3.111054, 1, 0.8627451, 0, 1,
-1.102214, -0.4893933, -2.973206, 1, 0.8705882, 0, 1,
-1.097227, 0.3932456, -2.114693, 1, 0.8745098, 0, 1,
-1.094496, 1.255794, -1.665849, 1, 0.8823529, 0, 1,
-1.079056, -1.781115, -2.185897, 1, 0.8862745, 0, 1,
-1.071911, 0.7894044, 0.1767525, 1, 0.8941177, 0, 1,
-1.067324, -0.1327803, -2.181819, 1, 0.8980392, 0, 1,
-1.066211, 0.2755856, -1.18165, 1, 0.9058824, 0, 1,
-1.066018, -1.565128, -2.810167, 1, 0.9137255, 0, 1,
-1.061433, 0.8382718, 0.4619982, 1, 0.9176471, 0, 1,
-1.060133, 1.241013, -1.23442, 1, 0.9254902, 0, 1,
-1.059775, -0.4337641, -3.009102, 1, 0.9294118, 0, 1,
-1.057292, 1.244253, -1.973699, 1, 0.9372549, 0, 1,
-1.0568, -0.3865222, -1.488065, 1, 0.9411765, 0, 1,
-1.052642, -2.589816, -3.070889, 1, 0.9490196, 0, 1,
-1.05125, 0.2060162, -1.550294, 1, 0.9529412, 0, 1,
-1.050935, 0.8683758, -1.828467, 1, 0.9607843, 0, 1,
-1.045981, -0.372555, -1.869891, 1, 0.9647059, 0, 1,
-1.045299, -1.261661, -1.551756, 1, 0.972549, 0, 1,
-1.043414, -0.8699173, -2.146423, 1, 0.9764706, 0, 1,
-1.037058, 1.03636, -2.394825, 1, 0.9843137, 0, 1,
-1.027898, -1.707317, -1.734153, 1, 0.9882353, 0, 1,
-1.024424, 0.02084689, -2.836423, 1, 0.9960784, 0, 1,
-1.020723, -1.152934, -1.03814, 0.9960784, 1, 0, 1,
-1.017299, 0.8795983, -0.1654123, 0.9921569, 1, 0, 1,
-1.013169, 0.3653467, -0.2067626, 0.9843137, 1, 0, 1,
-1.009639, 0.1203293, -3.185244, 0.9803922, 1, 0, 1,
-1.008857, 0.7838193, -1.619286, 0.972549, 1, 0, 1,
-0.9781682, -0.8896068, -0.2600128, 0.9686275, 1, 0, 1,
-0.9781286, -1.670771, -3.854511, 0.9607843, 1, 0, 1,
-0.9780248, -0.1266282, -1.368653, 0.9568627, 1, 0, 1,
-0.9745691, 0.37077, 0.1117902, 0.9490196, 1, 0, 1,
-0.9706851, -0.4000905, -2.35462, 0.945098, 1, 0, 1,
-0.9701684, -1.061474, -3.727726, 0.9372549, 1, 0, 1,
-0.9678711, -0.3539331, -1.845155, 0.9333333, 1, 0, 1,
-0.9678016, -0.0933003, -0.8322718, 0.9254902, 1, 0, 1,
-0.959071, 1.051297, -1.302177, 0.9215686, 1, 0, 1,
-0.9497105, 0.3929573, -0.6509809, 0.9137255, 1, 0, 1,
-0.9435543, 3.090897, -0.1234924, 0.9098039, 1, 0, 1,
-0.9392689, -0.8252272, -0.5645045, 0.9019608, 1, 0, 1,
-0.936807, 0.2499809, -1.532398, 0.8941177, 1, 0, 1,
-0.9356354, -0.6893482, -1.876635, 0.8901961, 1, 0, 1,
-0.9333514, -0.05457006, -1.990387, 0.8823529, 1, 0, 1,
-0.9269406, -0.4396235, -1.327516, 0.8784314, 1, 0, 1,
-0.9134276, 0.4750884, -2.320042, 0.8705882, 1, 0, 1,
-0.9103135, -1.214438, -1.798836, 0.8666667, 1, 0, 1,
-0.9097248, -0.1557378, -2.174562, 0.8588235, 1, 0, 1,
-0.9075955, 0.7726949, -1.4554, 0.854902, 1, 0, 1,
-0.9037267, 0.8899227, -0.06468181, 0.8470588, 1, 0, 1,
-0.891978, 0.8363797, 0.8587801, 0.8431373, 1, 0, 1,
-0.8913702, 0.3167378, -2.21256, 0.8352941, 1, 0, 1,
-0.8773796, -1.403204, -3.073592, 0.8313726, 1, 0, 1,
-0.8743057, -0.6368048, -3.438105, 0.8235294, 1, 0, 1,
-0.8715402, 1.327038, -0.5659375, 0.8196079, 1, 0, 1,
-0.8696296, -2.28173, -2.587985, 0.8117647, 1, 0, 1,
-0.8662063, 0.2154755, -2.747893, 0.8078431, 1, 0, 1,
-0.8644854, -1.024096, -2.804726, 0.8, 1, 0, 1,
-0.8601866, -0.4239941, -1.289657, 0.7921569, 1, 0, 1,
-0.8502147, 1.102848, -1.543143, 0.7882353, 1, 0, 1,
-0.8491404, -0.4340728, -1.439652, 0.7803922, 1, 0, 1,
-0.8452414, 0.8284039, -1.64193, 0.7764706, 1, 0, 1,
-0.844116, 0.4338116, -0.8512353, 0.7686275, 1, 0, 1,
-0.8424144, -0.3220626, -1.820122, 0.7647059, 1, 0, 1,
-0.8404441, 0.3502865, -1.82915, 0.7568628, 1, 0, 1,
-0.837423, 0.5802327, -1.636501, 0.7529412, 1, 0, 1,
-0.8363515, -0.3975433, -1.23693, 0.7450981, 1, 0, 1,
-0.8342633, -0.5073451, -1.463412, 0.7411765, 1, 0, 1,
-0.8279824, 1.487458, 0.2955357, 0.7333333, 1, 0, 1,
-0.8275576, -0.06589387, -1.470017, 0.7294118, 1, 0, 1,
-0.8248377, -0.5323699, -1.809325, 0.7215686, 1, 0, 1,
-0.8194178, -0.2204439, -1.23662, 0.7176471, 1, 0, 1,
-0.8178555, -1.412598, -2.612564, 0.7098039, 1, 0, 1,
-0.8151064, 0.9098681, 0.2127397, 0.7058824, 1, 0, 1,
-0.8148984, -0.535213, -0.4578525, 0.6980392, 1, 0, 1,
-0.8148875, -0.4477661, -1.097844, 0.6901961, 1, 0, 1,
-0.8109881, 0.2686286, -1.805677, 0.6862745, 1, 0, 1,
-0.8060201, -1.151627, -1.689243, 0.6784314, 1, 0, 1,
-0.802008, -1.087418, -3.085649, 0.6745098, 1, 0, 1,
-0.8007793, 0.7396604, -0.7400234, 0.6666667, 1, 0, 1,
-0.7990741, -1.246057, -2.066863, 0.6627451, 1, 0, 1,
-0.797122, -0.06423045, -2.00548, 0.654902, 1, 0, 1,
-0.7878457, 0.03748119, -2.785992, 0.6509804, 1, 0, 1,
-0.7862562, -0.1821878, -3.337515, 0.6431373, 1, 0, 1,
-0.7858142, 1.289807, -2.449451, 0.6392157, 1, 0, 1,
-0.784071, -0.009587222, -0.8681725, 0.6313726, 1, 0, 1,
-0.7777086, 1.046493, -1.050768, 0.627451, 1, 0, 1,
-0.7766553, 0.5957611, -1.706686, 0.6196079, 1, 0, 1,
-0.7764847, -0.3369638, -2.934042, 0.6156863, 1, 0, 1,
-0.7736701, 0.9077188, -1.896104, 0.6078432, 1, 0, 1,
-0.7682132, 0.01228478, -0.08128718, 0.6039216, 1, 0, 1,
-0.7623627, 0.2432067, -1.349061, 0.5960785, 1, 0, 1,
-0.7595615, -0.2627302, -2.519518, 0.5882353, 1, 0, 1,
-0.7582538, 1.325835, 0.95244, 0.5843138, 1, 0, 1,
-0.7568176, -0.9921185, -1.957086, 0.5764706, 1, 0, 1,
-0.7536272, 1.58738, -0.121566, 0.572549, 1, 0, 1,
-0.747382, -0.5609834, -4.705221, 0.5647059, 1, 0, 1,
-0.745607, -0.2215463, -2.072807, 0.5607843, 1, 0, 1,
-0.7383773, -0.6194497, -1.663348, 0.5529412, 1, 0, 1,
-0.7226062, -1.63703, -2.302127, 0.5490196, 1, 0, 1,
-0.7195668, -0.6149629, -1.799627, 0.5411765, 1, 0, 1,
-0.7192827, 0.5187852, 0.2920279, 0.5372549, 1, 0, 1,
-0.7179655, 1.049009, 0.3290867, 0.5294118, 1, 0, 1,
-0.7173566, 1.750678, -0.1692482, 0.5254902, 1, 0, 1,
-0.7171664, -0.2878534, -0.09829168, 0.5176471, 1, 0, 1,
-0.7156947, -0.2830521, -2.736302, 0.5137255, 1, 0, 1,
-0.714969, 0.03918605, -0.7858783, 0.5058824, 1, 0, 1,
-0.7149341, -0.4346129, -1.70311, 0.5019608, 1, 0, 1,
-0.7130794, -0.9941081, -4.63307, 0.4941176, 1, 0, 1,
-0.7120864, 1.004978, -1.392254, 0.4862745, 1, 0, 1,
-0.7102628, 1.237862, 0.4506046, 0.4823529, 1, 0, 1,
-0.7059841, -1.541406, -2.920985, 0.4745098, 1, 0, 1,
-0.7037097, -0.3571341, -1.936857, 0.4705882, 1, 0, 1,
-0.7030309, -0.7459741, -2.600958, 0.4627451, 1, 0, 1,
-0.7012535, -1.051464, -2.678564, 0.4588235, 1, 0, 1,
-0.6996282, -0.2850101, -1.17349, 0.4509804, 1, 0, 1,
-0.6980401, 1.31463, 0.3991195, 0.4470588, 1, 0, 1,
-0.6979305, 0.5559413, -1.194268, 0.4392157, 1, 0, 1,
-0.6975257, -0.4586244, -1.10498, 0.4352941, 1, 0, 1,
-0.692358, 2.400545, 0.4570986, 0.427451, 1, 0, 1,
-0.6873304, 1.078264, -1.181062, 0.4235294, 1, 0, 1,
-0.6865336, 0.4215096, -1.857957, 0.4156863, 1, 0, 1,
-0.6847705, 0.7378054, -1.201566, 0.4117647, 1, 0, 1,
-0.6795359, -0.8572978, -3.913028, 0.4039216, 1, 0, 1,
-0.6756634, -1.842243, -2.250522, 0.3960784, 1, 0, 1,
-0.6694548, -1.45838, -3.020901, 0.3921569, 1, 0, 1,
-0.6692254, 0.2417882, -0.4576535, 0.3843137, 1, 0, 1,
-0.6588751, 0.1295856, -0.9232613, 0.3803922, 1, 0, 1,
-0.6587436, -0.02550636, -2.076394, 0.372549, 1, 0, 1,
-0.6566951, 0.1457186, -1.122509, 0.3686275, 1, 0, 1,
-0.6538115, 2.268953, 1.076258, 0.3607843, 1, 0, 1,
-0.6527236, -0.08488332, -1.63975, 0.3568628, 1, 0, 1,
-0.6514719, 0.688602, -1.291172, 0.3490196, 1, 0, 1,
-0.6498882, 0.4136632, -3.030756, 0.345098, 1, 0, 1,
-0.6433138, -0.9754204, -0.9199644, 0.3372549, 1, 0, 1,
-0.6359174, -0.4028929, -3.219405, 0.3333333, 1, 0, 1,
-0.6292268, -0.5824698, -2.3442, 0.3254902, 1, 0, 1,
-0.623932, 1.144809, -0.4392415, 0.3215686, 1, 0, 1,
-0.6225411, -0.0899998, -2.231243, 0.3137255, 1, 0, 1,
-0.6214727, 0.4649818, -1.355662, 0.3098039, 1, 0, 1,
-0.6154601, -1.146244, -2.205327, 0.3019608, 1, 0, 1,
-0.6150287, 0.4637049, -1.120596, 0.2941177, 1, 0, 1,
-0.6139787, -2.020076, -3.275951, 0.2901961, 1, 0, 1,
-0.6087609, 0.1897633, -1.288415, 0.282353, 1, 0, 1,
-0.6079861, -0.9164413, -4.427286, 0.2784314, 1, 0, 1,
-0.6055081, 0.888424, -0.8846873, 0.2705882, 1, 0, 1,
-0.5966949, -0.7844632, -2.801385, 0.2666667, 1, 0, 1,
-0.5956814, 1.015621, -0.850562, 0.2588235, 1, 0, 1,
-0.5953419, -0.1560794, -1.614679, 0.254902, 1, 0, 1,
-0.5951905, -0.3281589, -0.4248943, 0.2470588, 1, 0, 1,
-0.5918508, -0.6422319, -0.549916, 0.2431373, 1, 0, 1,
-0.5889533, -0.9585835, -3.563717, 0.2352941, 1, 0, 1,
-0.5861152, -0.285, -1.986007, 0.2313726, 1, 0, 1,
-0.5859349, 1.259505, -0.01616766, 0.2235294, 1, 0, 1,
-0.5856556, -0.3685544, -1.341075, 0.2196078, 1, 0, 1,
-0.584644, 0.08937119, -2.872696, 0.2117647, 1, 0, 1,
-0.5826841, -2.397451, -4.633019, 0.2078431, 1, 0, 1,
-0.58024, 0.6653123, -0.7629355, 0.2, 1, 0, 1,
-0.5781026, -0.8928462, -2.896091, 0.1921569, 1, 0, 1,
-0.5778183, 1.18449, -1.292885, 0.1882353, 1, 0, 1,
-0.5736764, -0.4903263, -2.971214, 0.1803922, 1, 0, 1,
-0.5734683, 0.2917123, 1.329112, 0.1764706, 1, 0, 1,
-0.5670265, -0.01210919, -2.740511, 0.1686275, 1, 0, 1,
-0.5660101, 1.30038, -0.279686, 0.1647059, 1, 0, 1,
-0.5651456, 1.301609, -0.4203764, 0.1568628, 1, 0, 1,
-0.5630025, -0.09105331, -1.771503, 0.1529412, 1, 0, 1,
-0.5627737, 0.6624935, -1.223174, 0.145098, 1, 0, 1,
-0.5561091, 1.47457, 0.4787561, 0.1411765, 1, 0, 1,
-0.5552076, 0.4129902, -1.956988, 0.1333333, 1, 0, 1,
-0.5534533, -0.7234674, -2.263189, 0.1294118, 1, 0, 1,
-0.553202, 0.007815681, -0.6747248, 0.1215686, 1, 0, 1,
-0.5526204, 0.4944822, 0.5321859, 0.1176471, 1, 0, 1,
-0.5485978, -1.954642, -1.858158, 0.1098039, 1, 0, 1,
-0.5443315, -1.101162, -2.704442, 0.1058824, 1, 0, 1,
-0.5418146, -1.983857, -4.90823, 0.09803922, 1, 0, 1,
-0.5405802, 0.6627121, -1.673333, 0.09019608, 1, 0, 1,
-0.5361289, -0.5687987, -2.4238, 0.08627451, 1, 0, 1,
-0.5358349, -0.1061204, -2.058953, 0.07843138, 1, 0, 1,
-0.5269653, -0.7414836, -2.803511, 0.07450981, 1, 0, 1,
-0.5261878, -0.4165176, -3.035353, 0.06666667, 1, 0, 1,
-0.5249031, -1.111154, -2.318264, 0.0627451, 1, 0, 1,
-0.5206062, -2.394805, -4.082809, 0.05490196, 1, 0, 1,
-0.519944, -1.174221, -2.229747, 0.05098039, 1, 0, 1,
-0.5175197, 1.488879, -1.009573, 0.04313726, 1, 0, 1,
-0.5103253, -0.1778492, -0.9630923, 0.03921569, 1, 0, 1,
-0.509922, 0.4019169, -0.8548859, 0.03137255, 1, 0, 1,
-0.5089336, -0.08262978, -0.3181713, 0.02745098, 1, 0, 1,
-0.5082656, 1.056176, -3.298122, 0.01960784, 1, 0, 1,
-0.5074302, 0.5271136, -1.016557, 0.01568628, 1, 0, 1,
-0.5017298, -0.3017087, -3.157844, 0.007843138, 1, 0, 1,
-0.4901995, 1.381811, 0.9874764, 0.003921569, 1, 0, 1,
-0.4884318, 0.8241756, 0.5761264, 0, 1, 0.003921569, 1,
-0.4850897, -0.3054183, -1.234984, 0, 1, 0.01176471, 1,
-0.4839087, -0.1181592, -1.346439, 0, 1, 0.01568628, 1,
-0.4817466, -0.5722164, -1.115164, 0, 1, 0.02352941, 1,
-0.4810675, 0.2845855, -2.099047, 0, 1, 0.02745098, 1,
-0.4804244, -0.7910379, 0.355892, 0, 1, 0.03529412, 1,
-0.4737912, -0.2320458, -3.069007, 0, 1, 0.03921569, 1,
-0.4605395, 0.3697172, -2.210876, 0, 1, 0.04705882, 1,
-0.460099, -2.205766, -1.151499, 0, 1, 0.05098039, 1,
-0.4574401, 1.105707, -0.3690712, 0, 1, 0.05882353, 1,
-0.4479462, -0.6381511, -1.952895, 0, 1, 0.0627451, 1,
-0.4466689, -1.512622, -1.955078, 0, 1, 0.07058824, 1,
-0.4450826, 2.02259, 0.3602311, 0, 1, 0.07450981, 1,
-0.4436569, 0.5300226, -1.724498, 0, 1, 0.08235294, 1,
-0.4426601, -1.024321, -4.937872, 0, 1, 0.08627451, 1,
-0.4391532, 0.7407184, -0.6090749, 0, 1, 0.09411765, 1,
-0.4256362, -0.3956046, -1.358834, 0, 1, 0.1019608, 1,
-0.420457, -1.969397, -2.773175, 0, 1, 0.1058824, 1,
-0.4190773, 0.4385895, -1.520189, 0, 1, 0.1137255, 1,
-0.4107079, 2.307463, 1.817624, 0, 1, 0.1176471, 1,
-0.4058046, -0.6823761, -3.371364, 0, 1, 0.1254902, 1,
-0.3996646, -3.148051, -3.5971, 0, 1, 0.1294118, 1,
-0.3949618, 0.5463747, -0.9160104, 0, 1, 0.1372549, 1,
-0.3923366, -0.9052505, -3.037698, 0, 1, 0.1411765, 1,
-0.3912759, 1.927851, 0.4777599, 0, 1, 0.1490196, 1,
-0.3814692, -1.468479, -3.723816, 0, 1, 0.1529412, 1,
-0.3799571, -0.1665098, 1.427746, 0, 1, 0.1607843, 1,
-0.3764379, 1.497975, -0.8708887, 0, 1, 0.1647059, 1,
-0.3741724, 0.3977924, -0.44802, 0, 1, 0.172549, 1,
-0.3726025, -0.3330684, -0.7490226, 0, 1, 0.1764706, 1,
-0.3715553, 0.248424, -0.1411964, 0, 1, 0.1843137, 1,
-0.3705824, 0.3589279, -0.7830611, 0, 1, 0.1882353, 1,
-0.3678008, -0.2741905, -2.648786, 0, 1, 0.1960784, 1,
-0.3675803, 0.3485584, -0.0825853, 0, 1, 0.2039216, 1,
-0.3671553, 1.931094, 0.2141006, 0, 1, 0.2078431, 1,
-0.3669738, 0.06385473, 0.29218, 0, 1, 0.2156863, 1,
-0.3666406, 1.457896, -1.48655, 0, 1, 0.2196078, 1,
-0.3491816, -0.1710442, -3.251406, 0, 1, 0.227451, 1,
-0.3456772, -0.9408908, -1.108523, 0, 1, 0.2313726, 1,
-0.3444273, 0.6740641, -0.3911845, 0, 1, 0.2392157, 1,
-0.3430486, -0.05760295, -1.432552, 0, 1, 0.2431373, 1,
-0.3408277, -0.7726904, -2.968373, 0, 1, 0.2509804, 1,
-0.3331194, -1.278275, -1.458053, 0, 1, 0.254902, 1,
-0.3234036, 0.2227232, 0.1182358, 0, 1, 0.2627451, 1,
-0.3203894, 2.08951, 0.8250771, 0, 1, 0.2666667, 1,
-0.3193991, 1.441362, -1.571546, 0, 1, 0.2745098, 1,
-0.3172551, -1.325278, -2.785429, 0, 1, 0.2784314, 1,
-0.3167352, 0.8879826, -2.331684, 0, 1, 0.2862745, 1,
-0.3105752, 0.02697486, -2.342543, 0, 1, 0.2901961, 1,
-0.3090529, 0.5014967, -0.8819916, 0, 1, 0.2980392, 1,
-0.308792, 0.5071779, -1.651361, 0, 1, 0.3058824, 1,
-0.3086109, 0.1265399, -1.10949, 0, 1, 0.3098039, 1,
-0.3050386, 0.1644692, -2.8739, 0, 1, 0.3176471, 1,
-0.30237, -0.1668228, -1.737766, 0, 1, 0.3215686, 1,
-0.3012422, 2.200953, 0.7045709, 0, 1, 0.3294118, 1,
-0.2972864, 0.1976995, -2.085539, 0, 1, 0.3333333, 1,
-0.2970368, 0.4454637, -0.5147961, 0, 1, 0.3411765, 1,
-0.2954203, -0.9995452, -3.430181, 0, 1, 0.345098, 1,
-0.2939273, 0.8283594, -0.3651368, 0, 1, 0.3529412, 1,
-0.2937578, 0.7842306, -1.634995, 0, 1, 0.3568628, 1,
-0.2929415, -0.2826576, -2.050751, 0, 1, 0.3647059, 1,
-0.2883767, -0.69538, -1.425775, 0, 1, 0.3686275, 1,
-0.2846636, 0.5769895, -0.732278, 0, 1, 0.3764706, 1,
-0.2839726, -0.2157161, -2.6682, 0, 1, 0.3803922, 1,
-0.2808765, -1.341686, -2.060997, 0, 1, 0.3882353, 1,
-0.2773751, -0.936052, -2.50654, 0, 1, 0.3921569, 1,
-0.2759145, 0.1816649, -0.4063288, 0, 1, 0.4, 1,
-0.2751219, 0.2625403, -1.790284, 0, 1, 0.4078431, 1,
-0.2740327, -1.280875, -3.086539, 0, 1, 0.4117647, 1,
-0.2719592, -0.8855183, -2.863487, 0, 1, 0.4196078, 1,
-0.2701658, -1.283228, -4.902802, 0, 1, 0.4235294, 1,
-0.2691098, -1.966677, -3.530108, 0, 1, 0.4313726, 1,
-0.267486, -0.4255423, -0.6261483, 0, 1, 0.4352941, 1,
-0.2654508, -0.01801204, -0.7400818, 0, 1, 0.4431373, 1,
-0.2630844, -0.4963351, -3.112654, 0, 1, 0.4470588, 1,
-0.2568536, -0.2176139, -2.813257, 0, 1, 0.454902, 1,
-0.2567911, 0.6229553, 0.1613754, 0, 1, 0.4588235, 1,
-0.2544019, -0.1939377, -1.697336, 0, 1, 0.4666667, 1,
-0.2519257, 1.542675, -0.2308272, 0, 1, 0.4705882, 1,
-0.2500386, 2.085894, 0.3405151, 0, 1, 0.4784314, 1,
-0.2492497, -0.8261596, -3.766271, 0, 1, 0.4823529, 1,
-0.2470009, -1.618916, -2.969533, 0, 1, 0.4901961, 1,
-0.2468236, 0.3582229, 0.01082945, 0, 1, 0.4941176, 1,
-0.2448266, -1.104804, -1.881877, 0, 1, 0.5019608, 1,
-0.2413955, 0.6234251, -1.121216, 0, 1, 0.509804, 1,
-0.2373929, 0.5974559, -1.211673, 0, 1, 0.5137255, 1,
-0.2369313, -0.5409808, -1.82951, 0, 1, 0.5215687, 1,
-0.2364778, 0.715393, -0.7904799, 0, 1, 0.5254902, 1,
-0.234282, -0.8787807, -1.317846, 0, 1, 0.5333334, 1,
-0.2307587, -0.3875161, -2.699437, 0, 1, 0.5372549, 1,
-0.2305198, 1.205945, 0.3052686, 0, 1, 0.5450981, 1,
-0.2297583, -1.080141, -2.535117, 0, 1, 0.5490196, 1,
-0.2285446, -1.059381, -3.045364, 0, 1, 0.5568628, 1,
-0.2279173, -0.8897454, -3.612379, 0, 1, 0.5607843, 1,
-0.2275236, -0.2131657, -2.062899, 0, 1, 0.5686275, 1,
-0.2204319, -1.209506, -2.692847, 0, 1, 0.572549, 1,
-0.2203137, -0.9892524, -4.168994, 0, 1, 0.5803922, 1,
-0.2193201, 0.7243278, -1.146397, 0, 1, 0.5843138, 1,
-0.2048317, 0.1776556, -3.116669, 0, 1, 0.5921569, 1,
-0.2046911, -2.203999, -2.692328, 0, 1, 0.5960785, 1,
-0.1973479, -1.17822, -1.908192, 0, 1, 0.6039216, 1,
-0.1902064, -2.409785, -5.568959, 0, 1, 0.6117647, 1,
-0.1893272, 1.74548, -0.6318748, 0, 1, 0.6156863, 1,
-0.1891921, 1.310659, -0.9281157, 0, 1, 0.6235294, 1,
-0.1854553, -0.9595851, -2.173936, 0, 1, 0.627451, 1,
-0.1834943, -0.9690326, -0.9097204, 0, 1, 0.6352941, 1,
-0.1802535, -0.9995679, -3.15913, 0, 1, 0.6392157, 1,
-0.1699177, -0.4564031, -3.959405, 0, 1, 0.6470588, 1,
-0.1687238, 1.478136, 1.604632, 0, 1, 0.6509804, 1,
-0.1629429, 0.5622554, -0.5415908, 0, 1, 0.6588235, 1,
-0.1597599, -0.696303, -2.533726, 0, 1, 0.6627451, 1,
-0.1596881, 0.1315354, -0.8444755, 0, 1, 0.6705883, 1,
-0.157724, 0.6769134, -0.3782309, 0, 1, 0.6745098, 1,
-0.15595, -2.326187, -3.312048, 0, 1, 0.682353, 1,
-0.1543833, -0.4026229, -2.950206, 0, 1, 0.6862745, 1,
-0.1504692, 0.3340849, 0.119683, 0, 1, 0.6941177, 1,
-0.1487428, -0.1148744, -1.393774, 0, 1, 0.7019608, 1,
-0.1481231, 0.09651179, -2.238149, 0, 1, 0.7058824, 1,
-0.1435774, -0.5425725, -0.8191969, 0, 1, 0.7137255, 1,
-0.1396432, -0.7521766, -4.289656, 0, 1, 0.7176471, 1,
-0.139521, -0.4399739, -2.334316, 0, 1, 0.7254902, 1,
-0.1385502, 2.357823, -0.11291, 0, 1, 0.7294118, 1,
-0.1360305, 0.01500753, -2.059003, 0, 1, 0.7372549, 1,
-0.1356462, -0.4085835, -2.619293, 0, 1, 0.7411765, 1,
-0.1342338, -0.3278829, -3.019649, 0, 1, 0.7490196, 1,
-0.133289, 0.2931165, -1.584508, 0, 1, 0.7529412, 1,
-0.1270012, -1.554608, -3.019396, 0, 1, 0.7607843, 1,
-0.1245517, -0.4828234, -2.705006, 0, 1, 0.7647059, 1,
-0.1232507, 0.03810324, -0.6757962, 0, 1, 0.772549, 1,
-0.117606, 1.34933, 0.3884144, 0, 1, 0.7764706, 1,
-0.1174384, -1.193359, -3.353432, 0, 1, 0.7843137, 1,
-0.1137547, -0.1790949, -3.351242, 0, 1, 0.7882353, 1,
-0.1091688, 0.001586428, -0.568979, 0, 1, 0.7960784, 1,
-0.1090696, 0.2615245, -1.401121, 0, 1, 0.8039216, 1,
-0.1058354, -0.1923731, -2.460586, 0, 1, 0.8078431, 1,
-0.1040916, -0.498616, -3.18342, 0, 1, 0.8156863, 1,
-0.09799428, 0.7212497, 0.3898413, 0, 1, 0.8196079, 1,
-0.09737186, -0.09175065, -3.415275, 0, 1, 0.827451, 1,
-0.09514988, -0.2791513, -4.882704, 0, 1, 0.8313726, 1,
-0.0950922, 0.05297265, -3.125374, 0, 1, 0.8392157, 1,
-0.09369613, 0.6720485, 0.3384548, 0, 1, 0.8431373, 1,
-0.08810242, -0.7703505, -2.189816, 0, 1, 0.8509804, 1,
-0.08666623, -0.1970721, -2.606638, 0, 1, 0.854902, 1,
-0.08562981, -1.026916, -3.676844, 0, 1, 0.8627451, 1,
-0.08356638, 0.4608375, -0.5156796, 0, 1, 0.8666667, 1,
-0.08151043, 0.8441604, 2.389042, 0, 1, 0.8745098, 1,
-0.0768491, -0.1192546, -2.776513, 0, 1, 0.8784314, 1,
-0.07546312, -2.01535, -2.97779, 0, 1, 0.8862745, 1,
-0.07458989, -0.3222654, -1.971604, 0, 1, 0.8901961, 1,
-0.06651097, -0.1077465, -2.630622, 0, 1, 0.8980392, 1,
-0.06588369, -0.6861892, -4.759288, 0, 1, 0.9058824, 1,
-0.06095938, 0.5520287, -0.2562851, 0, 1, 0.9098039, 1,
-0.05883829, 0.2424864, 0.3114333, 0, 1, 0.9176471, 1,
-0.05791807, -0.2373986, -3.873983, 0, 1, 0.9215686, 1,
-0.05026272, -1.424112, -2.703599, 0, 1, 0.9294118, 1,
-0.0453727, -1.300226, -4.374429, 0, 1, 0.9333333, 1,
-0.04461301, 0.7733116, 1.613367, 0, 1, 0.9411765, 1,
-0.04345223, 0.05717566, -1.181842, 0, 1, 0.945098, 1,
-0.03810242, 0.3062254, -0.3855019, 0, 1, 0.9529412, 1,
-0.02962054, -0.6612387, -3.351588, 0, 1, 0.9568627, 1,
-0.02258053, -0.7824392, -4.141502, 0, 1, 0.9647059, 1,
-0.02199253, 0.5731694, -0.2085774, 0, 1, 0.9686275, 1,
-0.01969537, -1.632943, -3.153865, 0, 1, 0.9764706, 1,
-0.01279534, 1.321733, 0.5207171, 0, 1, 0.9803922, 1,
-0.01156544, 0.2344182, 1.095346, 0, 1, 0.9882353, 1,
-0.01085388, 1.360723, 0.6312568, 0, 1, 0.9921569, 1,
-0.01030901, 1.557086, 1.349547, 0, 1, 1, 1,
-0.01014835, -0.2476464, -3.667004, 0, 0.9921569, 1, 1,
-0.006141759, 0.1572776, 0.4398706, 0, 0.9882353, 1, 1,
-0.005429668, -0.8206413, -5.316418, 0, 0.9803922, 1, 1,
0.0008117189, 1.267393, -0.6346031, 0, 0.9764706, 1, 1,
0.007269357, -1.002924, 1.530786, 0, 0.9686275, 1, 1,
0.008726749, -0.3219203, 3.647996, 0, 0.9647059, 1, 1,
0.009859559, -0.268048, 4.63874, 0, 0.9568627, 1, 1,
0.01090743, 0.2142337, 0.6694878, 0, 0.9529412, 1, 1,
0.01223162, 0.3141541, 0.4725521, 0, 0.945098, 1, 1,
0.01258003, 0.04278285, 0.994561, 0, 0.9411765, 1, 1,
0.01421238, -0.5156111, 1.069268, 0, 0.9333333, 1, 1,
0.01437098, 1.24968, -1.027964, 0, 0.9294118, 1, 1,
0.01597551, 0.2229336, 0.1710734, 0, 0.9215686, 1, 1,
0.02305272, -0.4843839, 5.793728, 0, 0.9176471, 1, 1,
0.02514519, 1.039248, 0.8570938, 0, 0.9098039, 1, 1,
0.02585845, -1.937958, 4.342909, 0, 0.9058824, 1, 1,
0.03072745, -1.662786, 2.67593, 0, 0.8980392, 1, 1,
0.03156473, -0.8789909, 2.47727, 0, 0.8901961, 1, 1,
0.03176555, 1.794608, 1.37953, 0, 0.8862745, 1, 1,
0.03180095, -0.4218332, 3.081607, 0, 0.8784314, 1, 1,
0.03414906, 1.058511, 0.7603973, 0, 0.8745098, 1, 1,
0.03602232, -0.9814111, 3.091052, 0, 0.8666667, 1, 1,
0.04096634, 1.487858, -1.171057, 0, 0.8627451, 1, 1,
0.04302625, 0.6810328, 1.401645, 0, 0.854902, 1, 1,
0.05049135, -0.0138454, 2.058865, 0, 0.8509804, 1, 1,
0.0563013, -0.4383924, 4.01569, 0, 0.8431373, 1, 1,
0.05881309, 1.41172, -0.1722427, 0, 0.8392157, 1, 1,
0.05996565, -0.9782656, 5.216426, 0, 0.8313726, 1, 1,
0.06034912, 0.07983035, 1.349631, 0, 0.827451, 1, 1,
0.06224479, 0.8974502, -0.1187924, 0, 0.8196079, 1, 1,
0.06364504, -0.7198521, 5.64144, 0, 0.8156863, 1, 1,
0.06534272, 0.5767168, 0.6782491, 0, 0.8078431, 1, 1,
0.06638668, -0.2292171, 1.892026, 0, 0.8039216, 1, 1,
0.06650097, 0.8630081, 2.101077, 0, 0.7960784, 1, 1,
0.06657267, 1.378228, -2.712747, 0, 0.7882353, 1, 1,
0.06684313, 0.4094737, -0.4919385, 0, 0.7843137, 1, 1,
0.06770992, -0.530125, 3.394374, 0, 0.7764706, 1, 1,
0.0692869, 0.6556522, 0.1863574, 0, 0.772549, 1, 1,
0.06938943, 1.057864, -0.7892101, 0, 0.7647059, 1, 1,
0.06989839, 1.608752, -0.7518119, 0, 0.7607843, 1, 1,
0.07142903, -0.7786019, 3.192053, 0, 0.7529412, 1, 1,
0.07197398, -0.06937659, 3.078675, 0, 0.7490196, 1, 1,
0.07684116, -0.2439971, 2.152311, 0, 0.7411765, 1, 1,
0.07775071, 1.252968, -0.06081599, 0, 0.7372549, 1, 1,
0.08128934, 0.9022927, 0.5391446, 0, 0.7294118, 1, 1,
0.08604629, -1.363968, 2.127371, 0, 0.7254902, 1, 1,
0.08625932, -0.2435555, 2.769083, 0, 0.7176471, 1, 1,
0.08776608, 1.338397, -1.179436, 0, 0.7137255, 1, 1,
0.08827208, -0.7851453, 2.539597, 0, 0.7058824, 1, 1,
0.08840529, -0.6649941, 3.332483, 0, 0.6980392, 1, 1,
0.09022741, 1.320999, 0.3079103, 0, 0.6941177, 1, 1,
0.09170583, 0.7653214, -0.538532, 0, 0.6862745, 1, 1,
0.09289511, 0.2458083, 0.348011, 0, 0.682353, 1, 1,
0.09435641, -0.6273718, 1.971722, 0, 0.6745098, 1, 1,
0.09525879, 0.9789898, -0.4019015, 0, 0.6705883, 1, 1,
0.09572681, -0.9504951, 4.241988, 0, 0.6627451, 1, 1,
0.1002512, -0.01168367, 1.487026, 0, 0.6588235, 1, 1,
0.1011254, 0.4975852, -0.3103655, 0, 0.6509804, 1, 1,
0.1049975, 2.489695, -0.2041264, 0, 0.6470588, 1, 1,
0.1050169, -0.81817, 1.948629, 0, 0.6392157, 1, 1,
0.1107071, 2.286454, -0.4439237, 0, 0.6352941, 1, 1,
0.1161955, 0.3769355, -0.6603862, 0, 0.627451, 1, 1,
0.1225656, 0.2135782, 1.938593, 0, 0.6235294, 1, 1,
0.1229032, -0.1210258, 1.983834, 0, 0.6156863, 1, 1,
0.1276574, -0.0790587, 0.8139677, 0, 0.6117647, 1, 1,
0.127688, -0.536895, 4.932641, 0, 0.6039216, 1, 1,
0.1308389, 0.1233609, 1.746765, 0, 0.5960785, 1, 1,
0.132213, -1.022807, 4.138878, 0, 0.5921569, 1, 1,
0.1347423, 0.0165664, 0.06812007, 0, 0.5843138, 1, 1,
0.1382221, 0.802451, 0.1433275, 0, 0.5803922, 1, 1,
0.1388899, 0.2144497, 1.717373, 0, 0.572549, 1, 1,
0.14014, 0.4273269, 1.276372, 0, 0.5686275, 1, 1,
0.1403115, -0.4809084, 2.562169, 0, 0.5607843, 1, 1,
0.1440572, -0.4033826, 2.88254, 0, 0.5568628, 1, 1,
0.14427, 0.8528131, -1.482399, 0, 0.5490196, 1, 1,
0.1445289, 1.597232, -0.02017082, 0, 0.5450981, 1, 1,
0.1487694, -0.6628955, 2.819882, 0, 0.5372549, 1, 1,
0.1505782, -0.5686547, 1.851941, 0, 0.5333334, 1, 1,
0.1547444, 1.284546, -0.04412019, 0, 0.5254902, 1, 1,
0.1610907, -1.267724, 1.72116, 0, 0.5215687, 1, 1,
0.1631272, 1.444021, 0.1782249, 0, 0.5137255, 1, 1,
0.163306, -1.666321, 4.550924, 0, 0.509804, 1, 1,
0.163485, 0.5131103, 1.543101, 0, 0.5019608, 1, 1,
0.1682512, 0.9022889, 0.6195448, 0, 0.4941176, 1, 1,
0.1761979, 0.9155065, 0.6057287, 0, 0.4901961, 1, 1,
0.1835433, 0.1585724, -0.6192427, 0, 0.4823529, 1, 1,
0.1841145, 0.03571254, 1.176295, 0, 0.4784314, 1, 1,
0.1950604, -0.08772013, 1.723579, 0, 0.4705882, 1, 1,
0.2003959, 0.1888881, 0.6403657, 0, 0.4666667, 1, 1,
0.2013633, 2.289603, -0.4280753, 0, 0.4588235, 1, 1,
0.2015287, -0.7151254, 2.835261, 0, 0.454902, 1, 1,
0.2056031, 0.09339312, 1.754774, 0, 0.4470588, 1, 1,
0.2099279, -0.1790762, -0.7748733, 0, 0.4431373, 1, 1,
0.2121898, 0.1493034, 1.701939, 0, 0.4352941, 1, 1,
0.2166774, 0.5894712, 1.273985, 0, 0.4313726, 1, 1,
0.2168364, 1.641796, 0.8329673, 0, 0.4235294, 1, 1,
0.217985, 0.1561832, 2.369605, 0, 0.4196078, 1, 1,
0.2182491, 1.243402, -0.06055474, 0, 0.4117647, 1, 1,
0.2201195, -1.131284, 3.251619, 0, 0.4078431, 1, 1,
0.220182, 2.122536, 2.336448, 0, 0.4, 1, 1,
0.2202268, 1.07309, 1.715183, 0, 0.3921569, 1, 1,
0.2250284, -0.6088771, 2.796678, 0, 0.3882353, 1, 1,
0.2284418, -1.376576, 4.12361, 0, 0.3803922, 1, 1,
0.2309218, -0.02304347, 1.082186, 0, 0.3764706, 1, 1,
0.2311458, -1.111088, 4.411997, 0, 0.3686275, 1, 1,
0.2317517, -0.4936306, 1.932002, 0, 0.3647059, 1, 1,
0.2318517, -0.3568576, 2.816431, 0, 0.3568628, 1, 1,
0.2341223, 0.2500699, 1.02323, 0, 0.3529412, 1, 1,
0.2345714, 1.555234, 1.476777, 0, 0.345098, 1, 1,
0.2373668, 0.5444751, 0.6609503, 0, 0.3411765, 1, 1,
0.2388262, -1.633995, 3.818678, 0, 0.3333333, 1, 1,
0.2389663, 0.1668281, 0.009698831, 0, 0.3294118, 1, 1,
0.239964, 1.48104, -0.2518491, 0, 0.3215686, 1, 1,
0.2428339, 0.4314791, 1.027462, 0, 0.3176471, 1, 1,
0.243993, 0.7067873, 0.3911836, 0, 0.3098039, 1, 1,
0.2479748, 0.1026029, 1.514482, 0, 0.3058824, 1, 1,
0.2514679, 0.3637924, -0.5535745, 0, 0.2980392, 1, 1,
0.2527574, -1.294608, 3.475794, 0, 0.2901961, 1, 1,
0.2614623, -1.779822, 3.998774, 0, 0.2862745, 1, 1,
0.2636414, 0.9106326, -0.2614719, 0, 0.2784314, 1, 1,
0.2656798, 0.3843479, -0.1574171, 0, 0.2745098, 1, 1,
0.2691968, 0.2669486, 2.68988, 0, 0.2666667, 1, 1,
0.2711804, 0.8420127, 0.07609195, 0, 0.2627451, 1, 1,
0.2753779, 0.1923136, 0.08351094, 0, 0.254902, 1, 1,
0.2755274, -0.707166, 1.892882, 0, 0.2509804, 1, 1,
0.2766018, 0.8201662, -0.02209749, 0, 0.2431373, 1, 1,
0.2838314, 2.22903, -1.757445, 0, 0.2392157, 1, 1,
0.2868043, -1.070039, 1.573433, 0, 0.2313726, 1, 1,
0.2872843, 1.677761, 0.6058664, 0, 0.227451, 1, 1,
0.2878161, -0.624213, 2.54455, 0, 0.2196078, 1, 1,
0.3026108, 0.1403033, 0.38502, 0, 0.2156863, 1, 1,
0.3027437, -0.9979725, 4.692246, 0, 0.2078431, 1, 1,
0.3034731, -0.227064, 3.134038, 0, 0.2039216, 1, 1,
0.3086984, 0.3303861, -0.009884953, 0, 0.1960784, 1, 1,
0.3124914, -1.193022, 3.89362, 0, 0.1882353, 1, 1,
0.3146318, -0.3020421, 1.773016, 0, 0.1843137, 1, 1,
0.323965, 0.4634448, 0.3814436, 0, 0.1764706, 1, 1,
0.3266018, 0.7525144, -0.6825685, 0, 0.172549, 1, 1,
0.331088, -0.3252289, 1.997222, 0, 0.1647059, 1, 1,
0.3321368, 0.9251015, -0.6769742, 0, 0.1607843, 1, 1,
0.3339194, 0.4455496, -0.3639441, 0, 0.1529412, 1, 1,
0.3384354, 0.01849013, 3.765545, 0, 0.1490196, 1, 1,
0.3457529, 0.06086557, 2.247983, 0, 0.1411765, 1, 1,
0.3490382, -0.6203814, 1.438398, 0, 0.1372549, 1, 1,
0.3503116, 0.2186446, 1.567799, 0, 0.1294118, 1, 1,
0.3515788, -1.988913, 2.116132, 0, 0.1254902, 1, 1,
0.3598184, 3.082193, -0.0702564, 0, 0.1176471, 1, 1,
0.3605363, 0.03370905, 2.428464, 0, 0.1137255, 1, 1,
0.3679093, -1.136108, 1.659561, 0, 0.1058824, 1, 1,
0.3721049, -0.9224933, 2.021904, 0, 0.09803922, 1, 1,
0.3805843, -1.141257, 3.872093, 0, 0.09411765, 1, 1,
0.3819747, 1.762453, 0.340929, 0, 0.08627451, 1, 1,
0.3823383, -0.3001253, -0.3604523, 0, 0.08235294, 1, 1,
0.3840292, -1.106759, 3.410885, 0, 0.07450981, 1, 1,
0.3871926, 0.8762968, 0.1310822, 0, 0.07058824, 1, 1,
0.3882013, -0.02173253, 4.804176, 0, 0.0627451, 1, 1,
0.3889502, -1.888802, 1.976663, 0, 0.05882353, 1, 1,
0.3906697, 0.4664112, -2.573054, 0, 0.05098039, 1, 1,
0.3966099, 1.716361, 0.4316067, 0, 0.04705882, 1, 1,
0.4011506, -0.9181391, 2.155959, 0, 0.03921569, 1, 1,
0.4066269, -0.1004867, 2.234596, 0, 0.03529412, 1, 1,
0.4087054, -0.9945716, 2.217247, 0, 0.02745098, 1, 1,
0.4091908, 0.8606042, 0.7482805, 0, 0.02352941, 1, 1,
0.409825, -0.9545826, 3.337072, 0, 0.01568628, 1, 1,
0.4111816, -1.151063, 1.418703, 0, 0.01176471, 1, 1,
0.4157928, -0.4630762, 2.311594, 0, 0.003921569, 1, 1,
0.4204127, -0.1918484, 2.959239, 0.003921569, 0, 1, 1,
0.4239974, -0.4061917, 0.9141089, 0.007843138, 0, 1, 1,
0.4251133, -0.4874557, 3.48248, 0.01568628, 0, 1, 1,
0.4306958, -0.9170681, 2.872652, 0.01960784, 0, 1, 1,
0.4332729, 1.165104, -0.07048145, 0.02745098, 0, 1, 1,
0.4346001, 0.5841551, 1.796453, 0.03137255, 0, 1, 1,
0.4353348, -0.6785589, 3.177285, 0.03921569, 0, 1, 1,
0.4355508, -0.2934394, 1.365404, 0.04313726, 0, 1, 1,
0.4358624, -0.9075358, 1.257436, 0.05098039, 0, 1, 1,
0.4360588, 1.116296, 1.352939, 0.05490196, 0, 1, 1,
0.451485, -0.957931, 1.887012, 0.0627451, 0, 1, 1,
0.4533119, -1.665225, 3.002254, 0.06666667, 0, 1, 1,
0.4613736, -0.6558347, 3.023158, 0.07450981, 0, 1, 1,
0.4630108, 0.2039858, 0.6186724, 0.07843138, 0, 1, 1,
0.4650705, 0.4032944, 1.137929, 0.08627451, 0, 1, 1,
0.4675179, -0.1700407, 3.816205, 0.09019608, 0, 1, 1,
0.468197, 0.2628257, 1.596269, 0.09803922, 0, 1, 1,
0.470297, -1.564153, 2.354819, 0.1058824, 0, 1, 1,
0.4754881, 1.744038, 0.1315926, 0.1098039, 0, 1, 1,
0.4759299, 1.964653, 1.304582, 0.1176471, 0, 1, 1,
0.4768786, -0.6850677, 4.367287, 0.1215686, 0, 1, 1,
0.4808139, 0.8398014, 0.7560629, 0.1294118, 0, 1, 1,
0.484993, -0.1643437, 1.795166, 0.1333333, 0, 1, 1,
0.4883015, 1.294635, 1.675198, 0.1411765, 0, 1, 1,
0.4900965, -0.8691055, 1.855732, 0.145098, 0, 1, 1,
0.4908808, -0.7392293, 3.527813, 0.1529412, 0, 1, 1,
0.4918615, 0.07284246, 1.822742, 0.1568628, 0, 1, 1,
0.4928166, -2.396068, 1.941777, 0.1647059, 0, 1, 1,
0.4951916, -1.152884, 1.68714, 0.1686275, 0, 1, 1,
0.4979874, -0.4639621, 3.769833, 0.1764706, 0, 1, 1,
0.5045341, -0.4244904, 1.234836, 0.1803922, 0, 1, 1,
0.506482, -0.1902193, 0.2461802, 0.1882353, 0, 1, 1,
0.5080343, -0.9773591, 3.407337, 0.1921569, 0, 1, 1,
0.5132093, -1.340499, 2.556076, 0.2, 0, 1, 1,
0.5181158, -0.9542627, 2.062537, 0.2078431, 0, 1, 1,
0.5290989, 0.08597528, 1.535617, 0.2117647, 0, 1, 1,
0.5328922, -0.7135289, 2.466668, 0.2196078, 0, 1, 1,
0.5382562, -1.489139, 2.476996, 0.2235294, 0, 1, 1,
0.5384936, -1.087198, 2.098167, 0.2313726, 0, 1, 1,
0.5401426, -0.001312055, 1.380298, 0.2352941, 0, 1, 1,
0.5402139, 0.1787574, 0.6529905, 0.2431373, 0, 1, 1,
0.5480551, 0.3616664, 0.726386, 0.2470588, 0, 1, 1,
0.5485191, -0.4057116, 0.1492827, 0.254902, 0, 1, 1,
0.5487806, -0.4701838, 1.422038, 0.2588235, 0, 1, 1,
0.5494149, 0.574635, 0.7223205, 0.2666667, 0, 1, 1,
0.5494375, 0.2107994, 2.57241, 0.2705882, 0, 1, 1,
0.5508249, 1.170359, -0.284451, 0.2784314, 0, 1, 1,
0.554951, -0.9531871, 2.583601, 0.282353, 0, 1, 1,
0.557084, 1.546544, -0.03409472, 0.2901961, 0, 1, 1,
0.5596351, -0.2704857, 1.948688, 0.2941177, 0, 1, 1,
0.5632089, -0.8542852, 1.611981, 0.3019608, 0, 1, 1,
0.5653147, -1.778024, 1.786147, 0.3098039, 0, 1, 1,
0.5664126, 2.605954, 2.184633, 0.3137255, 0, 1, 1,
0.566852, 0.6868626, 0.59027, 0.3215686, 0, 1, 1,
0.5686058, 0.1820724, 1.316044, 0.3254902, 0, 1, 1,
0.5709333, 0.7281048, 1.847333, 0.3333333, 0, 1, 1,
0.5712219, 1.078557, -0.3992108, 0.3372549, 0, 1, 1,
0.5725098, -0.4425118, 0.4649986, 0.345098, 0, 1, 1,
0.5736894, -0.6518499, 2.279569, 0.3490196, 0, 1, 1,
0.5792276, -0.1912461, 2.792188, 0.3568628, 0, 1, 1,
0.5796193, -0.734982, 3.115981, 0.3607843, 0, 1, 1,
0.5859395, 0.4840618, 0.6088252, 0.3686275, 0, 1, 1,
0.5906711, -1.132565, 3.86634, 0.372549, 0, 1, 1,
0.5911394, -1.082119, 2.480626, 0.3803922, 0, 1, 1,
0.5981378, 0.05778437, 0.8427454, 0.3843137, 0, 1, 1,
0.6021896, -3.292154, 3.62344, 0.3921569, 0, 1, 1,
0.6079286, -1.21209, 1.124014, 0.3960784, 0, 1, 1,
0.6125474, 0.4256557, 1.048921, 0.4039216, 0, 1, 1,
0.6180657, -1.73847, 2.141846, 0.4117647, 0, 1, 1,
0.618785, 0.6043893, -1.375282, 0.4156863, 0, 1, 1,
0.6206758, 1.131717, 0.7026749, 0.4235294, 0, 1, 1,
0.6253852, 1.377298, 0.756655, 0.427451, 0, 1, 1,
0.6306347, -1.085464, 2.278094, 0.4352941, 0, 1, 1,
0.6341196, 0.2452823, 1.704174, 0.4392157, 0, 1, 1,
0.6344334, 0.9876347, 0.235959, 0.4470588, 0, 1, 1,
0.6357051, 1.314364, -0.6924464, 0.4509804, 0, 1, 1,
0.6366476, 0.6731034, 0.345197, 0.4588235, 0, 1, 1,
0.643625, -0.7510163, 1.880906, 0.4627451, 0, 1, 1,
0.6468599, 1.034772, 0.01612302, 0.4705882, 0, 1, 1,
0.6579461, -0.1300499, 1.187461, 0.4745098, 0, 1, 1,
0.6603215, -0.3879566, 2.376833, 0.4823529, 0, 1, 1,
0.6609187, -1.44367, 1.9479, 0.4862745, 0, 1, 1,
0.6674656, 0.8345361, 2.150649, 0.4941176, 0, 1, 1,
0.667672, -0.04364592, 2.404776, 0.5019608, 0, 1, 1,
0.6709508, -0.9539206, 0.9993219, 0.5058824, 0, 1, 1,
0.6732958, -2.027475, 3.126806, 0.5137255, 0, 1, 1,
0.6788663, 2.308126, 1.832961, 0.5176471, 0, 1, 1,
0.6825632, 0.002683054, 1.203446, 0.5254902, 0, 1, 1,
0.6877833, 0.3266114, 2.576836, 0.5294118, 0, 1, 1,
0.6905104, 0.5208159, -0.4836154, 0.5372549, 0, 1, 1,
0.6911117, -0.04743129, 2.692469, 0.5411765, 0, 1, 1,
0.6933091, -2.144237, 2.592647, 0.5490196, 0, 1, 1,
0.6939217, -0.7592202, 2.66176, 0.5529412, 0, 1, 1,
0.6946014, -0.5182347, 2.372537, 0.5607843, 0, 1, 1,
0.6948519, -1.314787, 2.532188, 0.5647059, 0, 1, 1,
0.7011836, 0.2736477, 1.74827, 0.572549, 0, 1, 1,
0.7052068, 0.5476198, 0.8274311, 0.5764706, 0, 1, 1,
0.7068124, 1.193724, -0.004213102, 0.5843138, 0, 1, 1,
0.7097134, 0.9798643, 0.2835982, 0.5882353, 0, 1, 1,
0.7115349, 1.384181, -0.8719541, 0.5960785, 0, 1, 1,
0.7146721, 1.137126, -0.27011, 0.6039216, 0, 1, 1,
0.7182041, -0.4574423, 2.362032, 0.6078432, 0, 1, 1,
0.7187452, -0.8989832, 2.812765, 0.6156863, 0, 1, 1,
0.7194422, 0.5113814, 0.3231802, 0.6196079, 0, 1, 1,
0.7283064, 1.855049, 1.217904, 0.627451, 0, 1, 1,
0.7353134, 1.206901, 1.238387, 0.6313726, 0, 1, 1,
0.7471489, -0.8426152, 2.754764, 0.6392157, 0, 1, 1,
0.751651, -0.7081015, 1.575355, 0.6431373, 0, 1, 1,
0.7651163, -0.4917714, 2.996382, 0.6509804, 0, 1, 1,
0.7708465, 0.4456238, -0.03861056, 0.654902, 0, 1, 1,
0.7739934, 0.2488629, 1.347577, 0.6627451, 0, 1, 1,
0.7764646, 0.1340454, -0.4081359, 0.6666667, 0, 1, 1,
0.7774075, -0.686394, 3.410532, 0.6745098, 0, 1, 1,
0.7787581, 1.391398, -0.7966838, 0.6784314, 0, 1, 1,
0.778999, 0.0940758, 1.556824, 0.6862745, 0, 1, 1,
0.7809337, 1.515066, -0.3241814, 0.6901961, 0, 1, 1,
0.7818428, -1.389117, 4.235729, 0.6980392, 0, 1, 1,
0.7818695, 1.664274, 1.089151, 0.7058824, 0, 1, 1,
0.789125, -0.27889, 0.7878137, 0.7098039, 0, 1, 1,
0.7895523, -1.716616, 2.535874, 0.7176471, 0, 1, 1,
0.790287, -0.189736, 2.326628, 0.7215686, 0, 1, 1,
0.7905896, -0.03122811, 1.041352, 0.7294118, 0, 1, 1,
0.7940361, 0.2819995, -0.7854744, 0.7333333, 0, 1, 1,
0.7972682, -0.2673117, 3.01725, 0.7411765, 0, 1, 1,
0.8005888, 0.8986881, -1.363835, 0.7450981, 0, 1, 1,
0.8036253, 0.265148, 1.833048, 0.7529412, 0, 1, 1,
0.8057172, -1.647485, 1.992169, 0.7568628, 0, 1, 1,
0.8065299, 0.3607418, 0.6438977, 0.7647059, 0, 1, 1,
0.8080076, -1.158492, 2.503619, 0.7686275, 0, 1, 1,
0.8090943, 1.024432, -0.459116, 0.7764706, 0, 1, 1,
0.8121434, -0.8785769, 2.024047, 0.7803922, 0, 1, 1,
0.8164279, -1.90565, 2.810157, 0.7882353, 0, 1, 1,
0.8196145, 0.2347975, 0.9556748, 0.7921569, 0, 1, 1,
0.819632, 0.3553747, 1.638077, 0.8, 0, 1, 1,
0.8262677, 0.404647, 0.7612998, 0.8078431, 0, 1, 1,
0.8280388, -0.4317973, 2.070845, 0.8117647, 0, 1, 1,
0.8292862, 0.2468384, 2.720995, 0.8196079, 0, 1, 1,
0.8303152, -0.4514054, 2.660474, 0.8235294, 0, 1, 1,
0.8317175, -0.4554266, 0.575804, 0.8313726, 0, 1, 1,
0.8418378, -1.685956, 2.524487, 0.8352941, 0, 1, 1,
0.8437167, -1.83628, 2.935993, 0.8431373, 0, 1, 1,
0.8445879, 0.5867631, 2.655958, 0.8470588, 0, 1, 1,
0.8448856, 0.3548585, 0.878414, 0.854902, 0, 1, 1,
0.8467306, -1.041634, 3.458394, 0.8588235, 0, 1, 1,
0.8530006, 0.9634708, 1.641575, 0.8666667, 0, 1, 1,
0.8557399, 0.4933801, 2.44414, 0.8705882, 0, 1, 1,
0.8580672, 1.060999, -0.1771733, 0.8784314, 0, 1, 1,
0.8647845, 0.08422527, 1.189628, 0.8823529, 0, 1, 1,
0.8696548, -0.6479895, 1.647175, 0.8901961, 0, 1, 1,
0.8732705, 1.653514, 0.573571, 0.8941177, 0, 1, 1,
0.8784082, 0.03637507, 2.150292, 0.9019608, 0, 1, 1,
0.8813528, 0.01010776, 2.347867, 0.9098039, 0, 1, 1,
0.883014, 0.1035915, 1.4176, 0.9137255, 0, 1, 1,
0.8840375, -0.3243609, 2.988481, 0.9215686, 0, 1, 1,
0.8875127, 1.049293, 1.73673, 0.9254902, 0, 1, 1,
0.893014, 0.648638, 0.358442, 0.9333333, 0, 1, 1,
0.9042156, -1.3158, 2.540605, 0.9372549, 0, 1, 1,
0.9113637, -1.573044, 2.825067, 0.945098, 0, 1, 1,
0.9119913, -0.7716677, 1.958689, 0.9490196, 0, 1, 1,
0.9130566, -0.4206191, -0.06788094, 0.9568627, 0, 1, 1,
0.9153, -0.1116996, 1.170122, 0.9607843, 0, 1, 1,
0.9308345, 0.9387046, 1.696244, 0.9686275, 0, 1, 1,
0.9372078, -0.09590281, 2.745104, 0.972549, 0, 1, 1,
0.9395769, -0.6709396, 1.729064, 0.9803922, 0, 1, 1,
0.9410607, 1.287844, 0.4118012, 0.9843137, 0, 1, 1,
0.9416608, 0.477973, 0.8354218, 0.9921569, 0, 1, 1,
0.9443474, -2.005874, 2.620075, 0.9960784, 0, 1, 1,
0.9489831, -0.4576451, 1.561546, 1, 0, 0.9960784, 1,
0.9529316, 0.9566061, 2.507975, 1, 0, 0.9882353, 1,
0.9534247, 0.003961092, 2.704471, 1, 0, 0.9843137, 1,
0.9598354, -0.0466724, 2.645737, 1, 0, 0.9764706, 1,
0.9605135, 0.7930237, 0.2750788, 1, 0, 0.972549, 1,
0.9618503, -1.009765, 2.418292, 1, 0, 0.9647059, 1,
0.9630165, -0.8728774, 2.058257, 1, 0, 0.9607843, 1,
0.9651126, 0.9565213, 1.980962, 1, 0, 0.9529412, 1,
0.9677556, 0.2304036, 2.038784, 1, 0, 0.9490196, 1,
0.9706867, 1.289818, -0.4995033, 1, 0, 0.9411765, 1,
0.9708603, -0.9826173, 2.221547, 1, 0, 0.9372549, 1,
0.9746418, 0.1610186, 1.481988, 1, 0, 0.9294118, 1,
0.9790339, -0.4664797, 2.80663, 1, 0, 0.9254902, 1,
0.9805904, 0.8351367, 1.575145, 1, 0, 0.9176471, 1,
0.9859823, 0.3619554, 2.126777, 1, 0, 0.9137255, 1,
0.9920014, -0.79343, 2.6731, 1, 0, 0.9058824, 1,
1.000014, -0.574492, 4.433353, 1, 0, 0.9019608, 1,
1.000774, 0.2002266, 0.9634599, 1, 0, 0.8941177, 1,
1.002224, 0.08560992, 1.903928, 1, 0, 0.8862745, 1,
1.018796, -1.221365, 3.412099, 1, 0, 0.8823529, 1,
1.019524, 0.1324893, 1.245587, 1, 0, 0.8745098, 1,
1.023105, -0.859412, 2.620377, 1, 0, 0.8705882, 1,
1.028521, 2.609895, -0.7439308, 1, 0, 0.8627451, 1,
1.030654, 1.761737, 0.8460268, 1, 0, 0.8588235, 1,
1.031685, 0.2327855, 0.7890358, 1, 0, 0.8509804, 1,
1.03287, -0.6562527, 1.239228, 1, 0, 0.8470588, 1,
1.035489, -1.368027, 2.509491, 1, 0, 0.8392157, 1,
1.044851, -2.444763, 3.298269, 1, 0, 0.8352941, 1,
1.049887, -0.772925, 2.744956, 1, 0, 0.827451, 1,
1.055775, -1.423683, 1.204335, 1, 0, 0.8235294, 1,
1.058563, 0.9381309, 0.9811853, 1, 0, 0.8156863, 1,
1.070568, 0.07496205, 2.570499, 1, 0, 0.8117647, 1,
1.073843, -1.172963, 3.271733, 1, 0, 0.8039216, 1,
1.077488, 0.8726943, 1.14266, 1, 0, 0.7960784, 1,
1.079412, -2.085603, 3.155001, 1, 0, 0.7921569, 1,
1.097304, -1.485762, 1.284853, 1, 0, 0.7843137, 1,
1.099694, -0.7154294, 2.544633, 1, 0, 0.7803922, 1,
1.106136, 1.347665, -0.5353497, 1, 0, 0.772549, 1,
1.106268, 1.547825, 0.1755721, 1, 0, 0.7686275, 1,
1.115947, -0.5387793, 2.640365, 1, 0, 0.7607843, 1,
1.118737, 1.032973, -0.6012439, 1, 0, 0.7568628, 1,
1.119456, 1.325144, 3.103958, 1, 0, 0.7490196, 1,
1.120646, -0.3810845, 2.490946, 1, 0, 0.7450981, 1,
1.124978, -1.8672, 3.474533, 1, 0, 0.7372549, 1,
1.134585, -2.338095, 2.406962, 1, 0, 0.7333333, 1,
1.142838, 0.7678139, 2.705037, 1, 0, 0.7254902, 1,
1.143967, 0.7772228, 0.8862943, 1, 0, 0.7215686, 1,
1.153697, -1.092127, 2.682877, 1, 0, 0.7137255, 1,
1.157421, 0.4955149, 0.230393, 1, 0, 0.7098039, 1,
1.160692, -0.285322, 1.38026, 1, 0, 0.7019608, 1,
1.162846, -0.9649596, 1.232864, 1, 0, 0.6941177, 1,
1.164879, 0.06113742, 0.4887345, 1, 0, 0.6901961, 1,
1.171378, -0.1339709, 2.220355, 1, 0, 0.682353, 1,
1.176781, -0.09746838, 3.095043, 1, 0, 0.6784314, 1,
1.191307, 0.698254, -0.4526615, 1, 0, 0.6705883, 1,
1.193138, 0.7480433, 1.583564, 1, 0, 0.6666667, 1,
1.19689, -0.1758107, 1.799199, 1, 0, 0.6588235, 1,
1.214806, -1.07681, 0.1570178, 1, 0, 0.654902, 1,
1.214975, 0.5653183, 0.6545246, 1, 0, 0.6470588, 1,
1.222205, -0.8624579, 2.935829, 1, 0, 0.6431373, 1,
1.22359, 0.2520619, -0.213225, 1, 0, 0.6352941, 1,
1.227906, -0.4623583, 2.559875, 1, 0, 0.6313726, 1,
1.235962, -0.8737769, 2.183379, 1, 0, 0.6235294, 1,
1.239356, 0.6503426, 0.1835741, 1, 0, 0.6196079, 1,
1.240778, 0.4445609, 3.036288, 1, 0, 0.6117647, 1,
1.256464, -0.2496152, 2.092965, 1, 0, 0.6078432, 1,
1.262186, -0.9187956, 1.675039, 1, 0, 0.6, 1,
1.267592, -0.9447103, 1.729503, 1, 0, 0.5921569, 1,
1.272189, -0.5311033, 1.691403, 1, 0, 0.5882353, 1,
1.274716, -0.9383768, 3.828985, 1, 0, 0.5803922, 1,
1.27591, 0.2545653, 1.40286, 1, 0, 0.5764706, 1,
1.276887, -0.4621657, 1.256742, 1, 0, 0.5686275, 1,
1.285615, 0.5475358, 0.9120254, 1, 0, 0.5647059, 1,
1.289596, -0.815008, 3.797854, 1, 0, 0.5568628, 1,
1.295951, 1.781646, 2.098759, 1, 0, 0.5529412, 1,
1.301533, -0.01159331, 2.405652, 1, 0, 0.5450981, 1,
1.301872, 0.5751082, 1.36017, 1, 0, 0.5411765, 1,
1.304829, 0.7011892, 2.198103, 1, 0, 0.5333334, 1,
1.317125, 0.05934397, -0.5017886, 1, 0, 0.5294118, 1,
1.320814, -0.3887423, 2.47173, 1, 0, 0.5215687, 1,
1.348174, 0.5988854, 0.9833632, 1, 0, 0.5176471, 1,
1.348839, -0.7436686, 1.090869, 1, 0, 0.509804, 1,
1.351326, 0.3833926, 1.720559, 1, 0, 0.5058824, 1,
1.36792, 0.2101244, -0.3051648, 1, 0, 0.4980392, 1,
1.378192, -0.2713944, 2.66127, 1, 0, 0.4901961, 1,
1.383963, -0.9851897, 1.34813, 1, 0, 0.4862745, 1,
1.38604, 0.6632901, 0.836376, 1, 0, 0.4784314, 1,
1.389451, 1.265963, 2.119948, 1, 0, 0.4745098, 1,
1.413682, -1.233271, 0.5416729, 1, 0, 0.4666667, 1,
1.419455, 0.2177651, -1.322423, 1, 0, 0.4627451, 1,
1.435841, -1.61434, 3.013179, 1, 0, 0.454902, 1,
1.437274, 1.166473, 0.2284357, 1, 0, 0.4509804, 1,
1.441284, -1.228902, 0.7750215, 1, 0, 0.4431373, 1,
1.450939, -0.1337617, 2.30835, 1, 0, 0.4392157, 1,
1.454625, -0.6588693, 2.441802, 1, 0, 0.4313726, 1,
1.456206, 0.9607072, 0.9605393, 1, 0, 0.427451, 1,
1.469454, -0.6804993, 1.942044, 1, 0, 0.4196078, 1,
1.469978, -0.1884582, 2.022392, 1, 0, 0.4156863, 1,
1.472649, 0.6697381, 0.9964855, 1, 0, 0.4078431, 1,
1.477798, -0.07334735, 2.22781, 1, 0, 0.4039216, 1,
1.484256, -0.3857516, 1.337809, 1, 0, 0.3960784, 1,
1.495715, 0.02687173, 1.100245, 1, 0, 0.3882353, 1,
1.505936, 0.2558095, 0.1392767, 1, 0, 0.3843137, 1,
1.509851, -0.2660911, 2.157924, 1, 0, 0.3764706, 1,
1.519048, -0.5108472, 1.128416, 1, 0, 0.372549, 1,
1.522401, -0.55488, 2.548066, 1, 0, 0.3647059, 1,
1.530843, 0.7071742, 1.714259, 1, 0, 0.3607843, 1,
1.542148, -0.5103813, 1.430342, 1, 0, 0.3529412, 1,
1.556497, -0.5858352, 1.001873, 1, 0, 0.3490196, 1,
1.559048, 1.179829, 1.650514, 1, 0, 0.3411765, 1,
1.5621, -1.536142, 2.409486, 1, 0, 0.3372549, 1,
1.587068, 1.039704, 1.393881, 1, 0, 0.3294118, 1,
1.594968, 0.7468339, 1.817052, 1, 0, 0.3254902, 1,
1.630738, -0.2606059, 1.892341, 1, 0, 0.3176471, 1,
1.630897, -0.3480447, 1.289815, 1, 0, 0.3137255, 1,
1.644658, -0.6069794, 3.833424, 1, 0, 0.3058824, 1,
1.647864, -1.264899, 2.773574, 1, 0, 0.2980392, 1,
1.652179, 0.00886079, 3.274455, 1, 0, 0.2941177, 1,
1.653909, -0.1976508, 0.7117219, 1, 0, 0.2862745, 1,
1.655816, -0.1827525, 2.296296, 1, 0, 0.282353, 1,
1.662843, -0.3156044, 0.003866476, 1, 0, 0.2745098, 1,
1.670882, 0.08506265, 1.104869, 1, 0, 0.2705882, 1,
1.689627, -0.1699762, 1.185329, 1, 0, 0.2627451, 1,
1.723428, -0.2652689, 2.72723, 1, 0, 0.2588235, 1,
1.734915, -2.773854, 1.643467, 1, 0, 0.2509804, 1,
1.759927, -1.075352, 1.829204, 1, 0, 0.2470588, 1,
1.761622, -0.3066753, 3.215889, 1, 0, 0.2392157, 1,
1.779578, -1.027697, 2.123651, 1, 0, 0.2352941, 1,
1.788209, 0.3956543, 0.2423516, 1, 0, 0.227451, 1,
1.819589, -1.276751, -0.6294088, 1, 0, 0.2235294, 1,
1.85024, 0.3104748, 2.153569, 1, 0, 0.2156863, 1,
1.854958, -0.1262668, 2.933421, 1, 0, 0.2117647, 1,
1.903957, 0.4761879, 1.92354, 1, 0, 0.2039216, 1,
1.907531, 0.1414661, 1.142868, 1, 0, 0.1960784, 1,
1.917895, 0.3636774, 0.9065366, 1, 0, 0.1921569, 1,
1.931151, 0.2000028, 2.346512, 1, 0, 0.1843137, 1,
1.947957, 1.63876, 1.053103, 1, 0, 0.1803922, 1,
1.950632, 0.1667246, 0.7572936, 1, 0, 0.172549, 1,
1.964882, 0.7405013, 2.183364, 1, 0, 0.1686275, 1,
1.982061, 0.2875236, 0.333131, 1, 0, 0.1607843, 1,
1.985288, 1.168076, 1.858831, 1, 0, 0.1568628, 1,
1.98533, 0.4429951, 2.605322, 1, 0, 0.1490196, 1,
2.014589, 0.5843553, -0.2988515, 1, 0, 0.145098, 1,
2.02619, -0.7542654, 1.850037, 1, 0, 0.1372549, 1,
2.037405, -0.6773236, 2.647039, 1, 0, 0.1333333, 1,
2.067882, 0.1459462, 2.528411, 1, 0, 0.1254902, 1,
2.070913, -0.6625054, 2.138223, 1, 0, 0.1215686, 1,
2.123633, -0.04879832, 0.9985278, 1, 0, 0.1137255, 1,
2.131677, 0.3420822, 3.39832, 1, 0, 0.1098039, 1,
2.224351, 1.791006, 1.139615, 1, 0, 0.1019608, 1,
2.225529, -1.289763, 1.794164, 1, 0, 0.09411765, 1,
2.226, 1.416777, 0.8842787, 1, 0, 0.09019608, 1,
2.25801, -0.2182451, 0.6677318, 1, 0, 0.08235294, 1,
2.308796, -2.00305, 1.563039, 1, 0, 0.07843138, 1,
2.380104, -1.535636, 3.105766, 1, 0, 0.07058824, 1,
2.429861, -0.3431506, 2.525872, 1, 0, 0.06666667, 1,
2.461411, 0.9325183, 2.699769, 1, 0, 0.05882353, 1,
2.47067, 2.459091, -0.4616892, 1, 0, 0.05490196, 1,
2.474463, 0.6073191, 2.509072, 1, 0, 0.04705882, 1,
2.479797, 0.06805755, 0.6208591, 1, 0, 0.04313726, 1,
2.554584, -0.2021571, 2.578884, 1, 0, 0.03529412, 1,
2.96506, -0.1506309, 2.497407, 1, 0, 0.03137255, 1,
3.137582, 1.10941, -1.239337, 1, 0, 0.02352941, 1,
3.157666, 1.664363, 1.041735, 1, 0, 0.01960784, 1,
3.178806, 0.9468172, -0.1405228, 1, 0, 0.01176471, 1,
3.232949, -0.0186119, 0.62323, 1, 0, 0.007843138, 1
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
0.002000809, -4.374081, -7.494935, 0, -0.5, 0.5, 0.5,
0.002000809, -4.374081, -7.494935, 1, -0.5, 0.5, 0.5,
0.002000809, -4.374081, -7.494935, 1, 1.5, 0.5, 0.5,
0.002000809, -4.374081, -7.494935, 0, 1.5, 0.5, 0.5
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
-4.324239, -0.1006286, -7.494935, 0, -0.5, 0.5, 0.5,
-4.324239, -0.1006286, -7.494935, 1, -0.5, 0.5, 0.5,
-4.324239, -0.1006286, -7.494935, 1, 1.5, 0.5, 0.5,
-4.324239, -0.1006286, -7.494935, 0, 1.5, 0.5, 0.5
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
-4.324239, -4.374081, 0.1123846, 0, -0.5, 0.5, 0.5,
-4.324239, -4.374081, 0.1123846, 1, -0.5, 0.5, 0.5,
-4.324239, -4.374081, 0.1123846, 1, 1.5, 0.5, 0.5,
-4.324239, -4.374081, 0.1123846, 0, 1.5, 0.5, 0.5
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
-3, -3.3879, -5.739399,
3, -3.3879, -5.739399,
-3, -3.3879, -5.739399,
-3, -3.552263, -6.031989,
-2, -3.3879, -5.739399,
-2, -3.552263, -6.031989,
-1, -3.3879, -5.739399,
-1, -3.552263, -6.031989,
0, -3.3879, -5.739399,
0, -3.552263, -6.031989,
1, -3.3879, -5.739399,
1, -3.552263, -6.031989,
2, -3.3879, -5.739399,
2, -3.552263, -6.031989,
3, -3.3879, -5.739399,
3, -3.552263, -6.031989
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
-3, -3.880991, -6.617167, 0, -0.5, 0.5, 0.5,
-3, -3.880991, -6.617167, 1, -0.5, 0.5, 0.5,
-3, -3.880991, -6.617167, 1, 1.5, 0.5, 0.5,
-3, -3.880991, -6.617167, 0, 1.5, 0.5, 0.5,
-2, -3.880991, -6.617167, 0, -0.5, 0.5, 0.5,
-2, -3.880991, -6.617167, 1, -0.5, 0.5, 0.5,
-2, -3.880991, -6.617167, 1, 1.5, 0.5, 0.5,
-2, -3.880991, -6.617167, 0, 1.5, 0.5, 0.5,
-1, -3.880991, -6.617167, 0, -0.5, 0.5, 0.5,
-1, -3.880991, -6.617167, 1, -0.5, 0.5, 0.5,
-1, -3.880991, -6.617167, 1, 1.5, 0.5, 0.5,
-1, -3.880991, -6.617167, 0, 1.5, 0.5, 0.5,
0, -3.880991, -6.617167, 0, -0.5, 0.5, 0.5,
0, -3.880991, -6.617167, 1, -0.5, 0.5, 0.5,
0, -3.880991, -6.617167, 1, 1.5, 0.5, 0.5,
0, -3.880991, -6.617167, 0, 1.5, 0.5, 0.5,
1, -3.880991, -6.617167, 0, -0.5, 0.5, 0.5,
1, -3.880991, -6.617167, 1, -0.5, 0.5, 0.5,
1, -3.880991, -6.617167, 1, 1.5, 0.5, 0.5,
1, -3.880991, -6.617167, 0, 1.5, 0.5, 0.5,
2, -3.880991, -6.617167, 0, -0.5, 0.5, 0.5,
2, -3.880991, -6.617167, 1, -0.5, 0.5, 0.5,
2, -3.880991, -6.617167, 1, 1.5, 0.5, 0.5,
2, -3.880991, -6.617167, 0, 1.5, 0.5, 0.5,
3, -3.880991, -6.617167, 0, -0.5, 0.5, 0.5,
3, -3.880991, -6.617167, 1, -0.5, 0.5, 0.5,
3, -3.880991, -6.617167, 1, 1.5, 0.5, 0.5,
3, -3.880991, -6.617167, 0, 1.5, 0.5, 0.5
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
-3.325876, -3, -5.739399,
-3.325876, 3, -5.739399,
-3.325876, -3, -5.739399,
-3.49227, -3, -6.031989,
-3.325876, -2, -5.739399,
-3.49227, -2, -6.031989,
-3.325876, -1, -5.739399,
-3.49227, -1, -6.031989,
-3.325876, 0, -5.739399,
-3.49227, 0, -6.031989,
-3.325876, 1, -5.739399,
-3.49227, 1, -6.031989,
-3.325876, 2, -5.739399,
-3.49227, 2, -6.031989,
-3.325876, 3, -5.739399,
-3.49227, 3, -6.031989
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
-3.825057, -3, -6.617167, 0, -0.5, 0.5, 0.5,
-3.825057, -3, -6.617167, 1, -0.5, 0.5, 0.5,
-3.825057, -3, -6.617167, 1, 1.5, 0.5, 0.5,
-3.825057, -3, -6.617167, 0, 1.5, 0.5, 0.5,
-3.825057, -2, -6.617167, 0, -0.5, 0.5, 0.5,
-3.825057, -2, -6.617167, 1, -0.5, 0.5, 0.5,
-3.825057, -2, -6.617167, 1, 1.5, 0.5, 0.5,
-3.825057, -2, -6.617167, 0, 1.5, 0.5, 0.5,
-3.825057, -1, -6.617167, 0, -0.5, 0.5, 0.5,
-3.825057, -1, -6.617167, 1, -0.5, 0.5, 0.5,
-3.825057, -1, -6.617167, 1, 1.5, 0.5, 0.5,
-3.825057, -1, -6.617167, 0, 1.5, 0.5, 0.5,
-3.825057, 0, -6.617167, 0, -0.5, 0.5, 0.5,
-3.825057, 0, -6.617167, 1, -0.5, 0.5, 0.5,
-3.825057, 0, -6.617167, 1, 1.5, 0.5, 0.5,
-3.825057, 0, -6.617167, 0, 1.5, 0.5, 0.5,
-3.825057, 1, -6.617167, 0, -0.5, 0.5, 0.5,
-3.825057, 1, -6.617167, 1, -0.5, 0.5, 0.5,
-3.825057, 1, -6.617167, 1, 1.5, 0.5, 0.5,
-3.825057, 1, -6.617167, 0, 1.5, 0.5, 0.5,
-3.825057, 2, -6.617167, 0, -0.5, 0.5, 0.5,
-3.825057, 2, -6.617167, 1, -0.5, 0.5, 0.5,
-3.825057, 2, -6.617167, 1, 1.5, 0.5, 0.5,
-3.825057, 2, -6.617167, 0, 1.5, 0.5, 0.5,
-3.825057, 3, -6.617167, 0, -0.5, 0.5, 0.5,
-3.825057, 3, -6.617167, 1, -0.5, 0.5, 0.5,
-3.825057, 3, -6.617167, 1, 1.5, 0.5, 0.5,
-3.825057, 3, -6.617167, 0, 1.5, 0.5, 0.5
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
-3.325876, -3.3879, -4,
-3.325876, -3.3879, 4,
-3.325876, -3.3879, -4,
-3.49227, -3.552263, -4,
-3.325876, -3.3879, -2,
-3.49227, -3.552263, -2,
-3.325876, -3.3879, 0,
-3.49227, -3.552263, 0,
-3.325876, -3.3879, 2,
-3.49227, -3.552263, 2,
-3.325876, -3.3879, 4,
-3.49227, -3.552263, 4
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
-3.825057, -3.880991, -4, 0, -0.5, 0.5, 0.5,
-3.825057, -3.880991, -4, 1, -0.5, 0.5, 0.5,
-3.825057, -3.880991, -4, 1, 1.5, 0.5, 0.5,
-3.825057, -3.880991, -4, 0, 1.5, 0.5, 0.5,
-3.825057, -3.880991, -2, 0, -0.5, 0.5, 0.5,
-3.825057, -3.880991, -2, 1, -0.5, 0.5, 0.5,
-3.825057, -3.880991, -2, 1, 1.5, 0.5, 0.5,
-3.825057, -3.880991, -2, 0, 1.5, 0.5, 0.5,
-3.825057, -3.880991, 0, 0, -0.5, 0.5, 0.5,
-3.825057, -3.880991, 0, 1, -0.5, 0.5, 0.5,
-3.825057, -3.880991, 0, 1, 1.5, 0.5, 0.5,
-3.825057, -3.880991, 0, 0, 1.5, 0.5, 0.5,
-3.825057, -3.880991, 2, 0, -0.5, 0.5, 0.5,
-3.825057, -3.880991, 2, 1, -0.5, 0.5, 0.5,
-3.825057, -3.880991, 2, 1, 1.5, 0.5, 0.5,
-3.825057, -3.880991, 2, 0, 1.5, 0.5, 0.5,
-3.825057, -3.880991, 4, 0, -0.5, 0.5, 0.5,
-3.825057, -3.880991, 4, 1, -0.5, 0.5, 0.5,
-3.825057, -3.880991, 4, 1, 1.5, 0.5, 0.5,
-3.825057, -3.880991, 4, 0, 1.5, 0.5, 0.5
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
-3.325876, -3.3879, -5.739399,
-3.325876, 3.186643, -5.739399,
-3.325876, -3.3879, 5.964169,
-3.325876, 3.186643, 5.964169,
-3.325876, -3.3879, -5.739399,
-3.325876, -3.3879, 5.964169,
-3.325876, 3.186643, -5.739399,
-3.325876, 3.186643, 5.964169,
-3.325876, -3.3879, -5.739399,
3.329877, -3.3879, -5.739399,
-3.325876, -3.3879, 5.964169,
3.329877, -3.3879, 5.964169,
-3.325876, 3.186643, -5.739399,
3.329877, 3.186643, -5.739399,
-3.325876, 3.186643, 5.964169,
3.329877, 3.186643, 5.964169,
3.329877, -3.3879, -5.739399,
3.329877, 3.186643, -5.739399,
3.329877, -3.3879, 5.964169,
3.329877, 3.186643, 5.964169,
3.329877, -3.3879, -5.739399,
3.329877, -3.3879, 5.964169,
3.329877, 3.186643, -5.739399,
3.329877, 3.186643, 5.964169
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
var radius = 8.000754;
var distance = 35.59626;
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
mvMatrix.translate( -0.002000809, 0.1006286, -0.1123846 );
mvMatrix.scale( 1.299713, 1.315768, 0.7391397 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.59626);
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


