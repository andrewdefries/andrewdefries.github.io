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
-3.561854, -1.293279, -3.179779, 1, 0, 0, 1,
-3.129796, -0.05988312, -1.80525, 1, 0.007843138, 0, 1,
-3.077935, 1.766255, -1.458024, 1, 0.01176471, 0, 1,
-3.018803, -2.213746, -1.119683, 1, 0.01960784, 0, 1,
-2.780288, 0.5189059, -2.363094, 1, 0.02352941, 0, 1,
-2.622198, 1.427657, -0.2782834, 1, 0.03137255, 0, 1,
-2.61619, 0.5233145, -0.8600197, 1, 0.03529412, 0, 1,
-2.562458, 0.5368403, -1.319555, 1, 0.04313726, 0, 1,
-2.37165, 0.4617147, -2.485885, 1, 0.04705882, 0, 1,
-2.234465, 1.448449, -2.206057, 1, 0.05490196, 0, 1,
-2.227051, 0.08796055, -1.952542, 1, 0.05882353, 0, 1,
-2.208882, 0.1419305, -2.063816, 1, 0.06666667, 0, 1,
-2.192594, -0.6753213, -1.316112, 1, 0.07058824, 0, 1,
-2.111436, -1.506241, -1.200009, 1, 0.07843138, 0, 1,
-2.08987, -0.9300373, -2.358608, 1, 0.08235294, 0, 1,
-2.057531, -1.327929, -2.802372, 1, 0.09019608, 0, 1,
-2.033783, 1.281668, -1.528138, 1, 0.09411765, 0, 1,
-1.997606, -0.6266217, -0.3242486, 1, 0.1019608, 0, 1,
-1.985751, -0.8524546, -2.485352, 1, 0.1098039, 0, 1,
-1.975734, -0.6680105, -1.13715, 1, 0.1137255, 0, 1,
-1.951109, 0.131368, -0.1750982, 1, 0.1215686, 0, 1,
-1.913924, 0.3888214, -0.4468457, 1, 0.1254902, 0, 1,
-1.899192, -1.817273, -2.597631, 1, 0.1333333, 0, 1,
-1.895187, -0.8061508, -0.7722139, 1, 0.1372549, 0, 1,
-1.814243, 0.889793, -2.330455, 1, 0.145098, 0, 1,
-1.798587, 0.5371971, -0.3451225, 1, 0.1490196, 0, 1,
-1.766016, 0.6209452, -0.3470476, 1, 0.1568628, 0, 1,
-1.75345, -1.329165, -2.340252, 1, 0.1607843, 0, 1,
-1.742939, 1.302371, -4.528061, 1, 0.1686275, 0, 1,
-1.742363, -0.6031879, -3.55881, 1, 0.172549, 0, 1,
-1.71265, 0.7923155, -0.06746888, 1, 0.1803922, 0, 1,
-1.705361, -2.129393, -2.469826, 1, 0.1843137, 0, 1,
-1.704909, -1.00215, -2.797386, 1, 0.1921569, 0, 1,
-1.687377, -0.01376526, -0.4973817, 1, 0.1960784, 0, 1,
-1.664394, 0.2022939, -1.933606, 1, 0.2039216, 0, 1,
-1.657028, -0.2709876, -2.194789, 1, 0.2117647, 0, 1,
-1.642983, -0.04143368, -0.3786328, 1, 0.2156863, 0, 1,
-1.63997, 0.263637, -0.6077906, 1, 0.2235294, 0, 1,
-1.633646, 0.0824122, -1.659768, 1, 0.227451, 0, 1,
-1.63192, -0.4584014, -3.874301, 1, 0.2352941, 0, 1,
-1.631753, -0.4715588, -2.327703, 1, 0.2392157, 0, 1,
-1.622602, 0.2616556, -2.151047, 1, 0.2470588, 0, 1,
-1.612286, 0.3113951, -2.231526, 1, 0.2509804, 0, 1,
-1.606663, -0.4039473, -1.230173, 1, 0.2588235, 0, 1,
-1.596321, -0.2054281, -1.46782, 1, 0.2627451, 0, 1,
-1.593954, -0.5226039, -2.179132, 1, 0.2705882, 0, 1,
-1.59388, -0.8264471, -2.966031, 1, 0.2745098, 0, 1,
-1.588999, 1.289042, -0.6483175, 1, 0.282353, 0, 1,
-1.579911, -0.1287345, -1.779425, 1, 0.2862745, 0, 1,
-1.56865, 0.4029033, -2.375689, 1, 0.2941177, 0, 1,
-1.566216, -0.3852412, -1.116907, 1, 0.3019608, 0, 1,
-1.559303, 0.3475701, -1.57304, 1, 0.3058824, 0, 1,
-1.553744, -0.1053639, -2.362625, 1, 0.3137255, 0, 1,
-1.551388, -0.1462843, -3.680159, 1, 0.3176471, 0, 1,
-1.537335, 0.683154, -0.5485032, 1, 0.3254902, 0, 1,
-1.514659, 0.06534974, -2.392123, 1, 0.3294118, 0, 1,
-1.514444, -0.5628943, -2.53292, 1, 0.3372549, 0, 1,
-1.504946, 0.8765069, -3.058801, 1, 0.3411765, 0, 1,
-1.500966, -1.280491, -0.9535358, 1, 0.3490196, 0, 1,
-1.500859, 0.7589729, -0.8619401, 1, 0.3529412, 0, 1,
-1.499018, 1.001619, -0.8620545, 1, 0.3607843, 0, 1,
-1.488244, 1.864228, -1.449195, 1, 0.3647059, 0, 1,
-1.48576, 0.008019255, -2.075882, 1, 0.372549, 0, 1,
-1.474975, -0.5503721, -1.180091, 1, 0.3764706, 0, 1,
-1.46404, 1.135574, 0.08209665, 1, 0.3843137, 0, 1,
-1.463723, 0.9089249, -0.9434707, 1, 0.3882353, 0, 1,
-1.460678, 2.054331, -1.161674, 1, 0.3960784, 0, 1,
-1.460412, 0.8568282, -2.080989, 1, 0.4039216, 0, 1,
-1.457479, -0.9869108, -1.438791, 1, 0.4078431, 0, 1,
-1.456423, -1.571098, -2.7795, 1, 0.4156863, 0, 1,
-1.447838, -0.4614747, -1.616777, 1, 0.4196078, 0, 1,
-1.432624, -0.1744995, -1.439706, 1, 0.427451, 0, 1,
-1.419132, -0.5137091, -2.031837, 1, 0.4313726, 0, 1,
-1.417137, -0.0180636, -0.8256574, 1, 0.4392157, 0, 1,
-1.407629, 0.09337139, -1.8353, 1, 0.4431373, 0, 1,
-1.401863, 0.5783924, -0.4889715, 1, 0.4509804, 0, 1,
-1.39768, -0.8156536, -1.461936, 1, 0.454902, 0, 1,
-1.396379, 0.01134324, -1.762031, 1, 0.4627451, 0, 1,
-1.395434, 0.3925921, -0.7792107, 1, 0.4666667, 0, 1,
-1.392876, 0.9926413, -2.340372, 1, 0.4745098, 0, 1,
-1.376938, -0.7049813, -0.9962831, 1, 0.4784314, 0, 1,
-1.375709, 0.2892227, -1.843209, 1, 0.4862745, 0, 1,
-1.361184, -0.2654712, -0.8764754, 1, 0.4901961, 0, 1,
-1.350911, -0.06038224, -1.197985, 1, 0.4980392, 0, 1,
-1.349273, -0.01553105, -1.091839, 1, 0.5058824, 0, 1,
-1.341504, -1.269059, -4.089993, 1, 0.509804, 0, 1,
-1.33807, -0.06366229, -0.6472365, 1, 0.5176471, 0, 1,
-1.336355, 0.5978495, -1.406686, 1, 0.5215687, 0, 1,
-1.335584, 0.5488963, 0.9014792, 1, 0.5294118, 0, 1,
-1.328657, -1.436695, -0.8947083, 1, 0.5333334, 0, 1,
-1.311012, -1.708723, -3.007595, 1, 0.5411765, 0, 1,
-1.304476, 0.3788844, -2.637501, 1, 0.5450981, 0, 1,
-1.301875, 0.5513214, -1.911424, 1, 0.5529412, 0, 1,
-1.293795, 0.9783971, -1.220113, 1, 0.5568628, 0, 1,
-1.29285, 0.6365962, -1.115491, 1, 0.5647059, 0, 1,
-1.289159, -2.824379, -2.992412, 1, 0.5686275, 0, 1,
-1.27745, -0.9865158, -3.677465, 1, 0.5764706, 0, 1,
-1.277404, -0.3866282, -1.518687, 1, 0.5803922, 0, 1,
-1.274483, 1.814764, -0.5006834, 1, 0.5882353, 0, 1,
-1.273176, 0.7879397, -0.197379, 1, 0.5921569, 0, 1,
-1.266727, -0.3791424, -2.664036, 1, 0.6, 0, 1,
-1.239947, 0.8100485, -1.754478, 1, 0.6078432, 0, 1,
-1.235191, 1.676448, -1.151531, 1, 0.6117647, 0, 1,
-1.229958, -1.971933, -2.419929, 1, 0.6196079, 0, 1,
-1.228245, -0.2095807, -0.5198334, 1, 0.6235294, 0, 1,
-1.227533, -0.6287357, -2.741139, 1, 0.6313726, 0, 1,
-1.224062, 0.4788041, 0.3945273, 1, 0.6352941, 0, 1,
-1.215626, 0.3358459, 0.6724839, 1, 0.6431373, 0, 1,
-1.211654, -0.6462829, -2.299548, 1, 0.6470588, 0, 1,
-1.210641, -0.9292967, -2.274913, 1, 0.654902, 0, 1,
-1.201578, 1.058342, -0.8559538, 1, 0.6588235, 0, 1,
-1.195294, 0.2830711, -0.2984653, 1, 0.6666667, 0, 1,
-1.19197, 0.1898225, -2.568446, 1, 0.6705883, 0, 1,
-1.190717, -0.3284014, -1.999636, 1, 0.6784314, 0, 1,
-1.189417, -0.8747779, -0.938678, 1, 0.682353, 0, 1,
-1.183956, 0.6306137, 1.322893, 1, 0.6901961, 0, 1,
-1.162533, 1.345991, -0.3057837, 1, 0.6941177, 0, 1,
-1.161948, -0.6527491, -2.416313, 1, 0.7019608, 0, 1,
-1.152683, -1.686875, -1.984254, 1, 0.7098039, 0, 1,
-1.151519, -0.7671778, -3.149631, 1, 0.7137255, 0, 1,
-1.150625, -0.02607335, -2.553767, 1, 0.7215686, 0, 1,
-1.146556, -2.018702, -2.27721, 1, 0.7254902, 0, 1,
-1.145482, -0.6709654, -1.731979, 1, 0.7333333, 0, 1,
-1.142176, -0.7238967, -3.151485, 1, 0.7372549, 0, 1,
-1.136956, -0.2383652, -2.710954, 1, 0.7450981, 0, 1,
-1.131552, 1.014616, -0.6735295, 1, 0.7490196, 0, 1,
-1.126554, 1.124878, -1.587895, 1, 0.7568628, 0, 1,
-1.125528, -0.626973, -2.289422, 1, 0.7607843, 0, 1,
-1.125365, -0.7800826, -1.995905, 1, 0.7686275, 0, 1,
-1.119948, -1.59453, -1.825091, 1, 0.772549, 0, 1,
-1.117805, -0.6903817, -2.84175, 1, 0.7803922, 0, 1,
-1.110844, -0.4432746, -3.389399, 1, 0.7843137, 0, 1,
-1.110734, -0.6886476, -2.767101, 1, 0.7921569, 0, 1,
-1.107227, 0.03973503, -1.947101, 1, 0.7960784, 0, 1,
-1.106715, 0.7582687, -0.1862206, 1, 0.8039216, 0, 1,
-1.096778, 0.6359993, -0.8821061, 1, 0.8117647, 0, 1,
-1.073411, 0.8109138, -2.798539, 1, 0.8156863, 0, 1,
-1.056841, 0.8346934, -1.793431, 1, 0.8235294, 0, 1,
-1.053415, 2.185741, -0.3578562, 1, 0.827451, 0, 1,
-1.051129, -0.5516668, -2.973546, 1, 0.8352941, 0, 1,
-1.047909, -0.4392148, -2.988168, 1, 0.8392157, 0, 1,
-1.04316, 0.5732238, -0.3158458, 1, 0.8470588, 0, 1,
-1.040489, -0.6798555, -2.367535, 1, 0.8509804, 0, 1,
-1.038727, -0.3350647, -2.618758, 1, 0.8588235, 0, 1,
-1.031338, -1.535909, -3.024685, 1, 0.8627451, 0, 1,
-1.02256, -0.2132599, -0.5102371, 1, 0.8705882, 0, 1,
-1.013871, -1.206471, -3.168165, 1, 0.8745098, 0, 1,
-1.011473, 0.0574362, -0.7282642, 1, 0.8823529, 0, 1,
-1.009232, 0.1086704, -1.455253, 1, 0.8862745, 0, 1,
-1.005773, -0.1654233, -2.124642, 1, 0.8941177, 0, 1,
-1.003169, 0.5061271, -2.308522, 1, 0.8980392, 0, 1,
-0.9964695, -1.881081, -3.161275, 1, 0.9058824, 0, 1,
-0.9955686, 1.134851, -0.7251766, 1, 0.9137255, 0, 1,
-0.9954489, -0.5129181, -2.90146, 1, 0.9176471, 0, 1,
-0.9938074, 1.33615, 0.3357624, 1, 0.9254902, 0, 1,
-0.9906338, 0.9580936, -1.02347, 1, 0.9294118, 0, 1,
-0.9876415, -0.9603077, -2.058699, 1, 0.9372549, 0, 1,
-0.9820681, 0.04382171, -2.531484, 1, 0.9411765, 0, 1,
-0.9798011, 0.4652729, -2.385073, 1, 0.9490196, 0, 1,
-0.9795862, 0.3149451, -0.9600859, 1, 0.9529412, 0, 1,
-0.9761658, 1.763555, 0.8297555, 1, 0.9607843, 0, 1,
-0.9730023, -0.6939208, 0.06115385, 1, 0.9647059, 0, 1,
-0.9726459, 0.5954388, 1.109686, 1, 0.972549, 0, 1,
-0.9714256, 1.636832, -1.52555, 1, 0.9764706, 0, 1,
-0.9648636, -0.9561725, -1.535388, 1, 0.9843137, 0, 1,
-0.9637789, 0.480956, 0.06139628, 1, 0.9882353, 0, 1,
-0.9625084, 0.2149175, -2.528683, 1, 0.9960784, 0, 1,
-0.9565957, -0.6276934, 0.07216262, 0.9960784, 1, 0, 1,
-0.9509903, -0.0286225, -0.5558673, 0.9921569, 1, 0, 1,
-0.9408276, 0.1875087, -1.382752, 0.9843137, 1, 0, 1,
-0.930035, -0.06381708, -2.449814, 0.9803922, 1, 0, 1,
-0.9234246, -0.392807, -2.343517, 0.972549, 1, 0, 1,
-0.9160854, 0.2510755, -0.5462302, 0.9686275, 1, 0, 1,
-0.9142072, 0.5844123, -1.614852, 0.9607843, 1, 0, 1,
-0.9138908, -0.4749348, -2.405713, 0.9568627, 1, 0, 1,
-0.9109753, -0.7781124, -3.166154, 0.9490196, 1, 0, 1,
-0.9101436, 0.5328393, -1.508508, 0.945098, 1, 0, 1,
-0.9076264, -1.271841, -2.36124, 0.9372549, 1, 0, 1,
-0.8956015, 0.2494067, -0.2034907, 0.9333333, 1, 0, 1,
-0.8955617, -1.835249, -3.551002, 0.9254902, 1, 0, 1,
-0.8932492, -1.089157, -2.098823, 0.9215686, 1, 0, 1,
-0.8912833, -0.147174, -2.75676, 0.9137255, 1, 0, 1,
-0.8903742, 1.02218, 0.1145778, 0.9098039, 1, 0, 1,
-0.8813732, -1.210869, 0.2094912, 0.9019608, 1, 0, 1,
-0.8737814, -0.9992412, -2.926645, 0.8941177, 1, 0, 1,
-0.8666382, -1.237678, -2.603513, 0.8901961, 1, 0, 1,
-0.8650849, 0.7722831, 0.6473296, 0.8823529, 1, 0, 1,
-0.8641737, 0.891494, -1.290533, 0.8784314, 1, 0, 1,
-0.8639725, 0.7028187, -2.103179, 0.8705882, 1, 0, 1,
-0.8632119, -0.1275174, -1.152286, 0.8666667, 1, 0, 1,
-0.860704, 0.2782315, -2.402106, 0.8588235, 1, 0, 1,
-0.8534929, 0.3559398, -0.8734475, 0.854902, 1, 0, 1,
-0.8492582, 0.04577411, -0.9580842, 0.8470588, 1, 0, 1,
-0.8476516, -0.07540097, 0.4700522, 0.8431373, 1, 0, 1,
-0.8468102, -0.5268998, -1.802116, 0.8352941, 1, 0, 1,
-0.8391656, -0.6453713, -3.157979, 0.8313726, 1, 0, 1,
-0.8304802, 0.3683853, -1.640257, 0.8235294, 1, 0, 1,
-0.8276083, -0.1410355, -2.705619, 0.8196079, 1, 0, 1,
-0.8245573, 2.389184, -0.4060539, 0.8117647, 1, 0, 1,
-0.8212279, 0.3934454, -0.8223506, 0.8078431, 1, 0, 1,
-0.8186505, -0.5469018, -3.296123, 0.8, 1, 0, 1,
-0.81639, 0.9290459, -0.9830685, 0.7921569, 1, 0, 1,
-0.8154366, 0.680255, -1.822632, 0.7882353, 1, 0, 1,
-0.8148311, -0.2327148, -3.433913, 0.7803922, 1, 0, 1,
-0.8111299, 0.08796798, -2.742437, 0.7764706, 1, 0, 1,
-0.80908, -0.206607, -3.557311, 0.7686275, 1, 0, 1,
-0.8087167, -0.4247259, -1.854145, 0.7647059, 1, 0, 1,
-0.8080167, -0.3579657, -1.553394, 0.7568628, 1, 0, 1,
-0.8072284, -0.192729, -2.95514, 0.7529412, 1, 0, 1,
-0.8067366, -0.6238243, -2.804846, 0.7450981, 1, 0, 1,
-0.8056795, 0.8560259, 0.4554845, 0.7411765, 1, 0, 1,
-0.8046395, -0.3354701, -2.542836, 0.7333333, 1, 0, 1,
-0.7979923, -0.1294935, -2.064149, 0.7294118, 1, 0, 1,
-0.7968618, 0.9765478, -1.162763, 0.7215686, 1, 0, 1,
-0.7942996, -0.1255997, -2.841786, 0.7176471, 1, 0, 1,
-0.7875333, -0.6211258, -1.680459, 0.7098039, 1, 0, 1,
-0.7851415, -0.544944, -3.644032, 0.7058824, 1, 0, 1,
-0.7830474, -1.130046, -2.398982, 0.6980392, 1, 0, 1,
-0.7766277, 0.4914052, -0.1746769, 0.6901961, 1, 0, 1,
-0.7761644, 0.292152, -1.91483, 0.6862745, 1, 0, 1,
-0.7702556, -1.323206, -1.718969, 0.6784314, 1, 0, 1,
-0.770229, -2.174457, -3.34778, 0.6745098, 1, 0, 1,
-0.7692969, -0.3211183, -1.756578, 0.6666667, 1, 0, 1,
-0.7687981, 0.1201014, -0.6151877, 0.6627451, 1, 0, 1,
-0.7659394, -0.2262955, -1.843091, 0.654902, 1, 0, 1,
-0.7609765, -1.262163, -4.612909, 0.6509804, 1, 0, 1,
-0.7573426, -0.3351312, -1.375132, 0.6431373, 1, 0, 1,
-0.7554326, 0.6793466, -0.7126126, 0.6392157, 1, 0, 1,
-0.7526641, -1.474356, -2.599044, 0.6313726, 1, 0, 1,
-0.7499532, 2.108212, 0.5857242, 0.627451, 1, 0, 1,
-0.7498983, -0.1498571, -1.291716, 0.6196079, 1, 0, 1,
-0.7491367, -1.175184, -2.442285, 0.6156863, 1, 0, 1,
-0.7453845, 1.008373, -1.048344, 0.6078432, 1, 0, 1,
-0.7451293, -0.08344204, -1.268496, 0.6039216, 1, 0, 1,
-0.7449533, 0.5501171, -0.8801479, 0.5960785, 1, 0, 1,
-0.7362281, -0.05830991, -0.3434128, 0.5882353, 1, 0, 1,
-0.7361806, -0.8185855, -1.009581, 0.5843138, 1, 0, 1,
-0.7320561, 0.5087342, -0.5119283, 0.5764706, 1, 0, 1,
-0.7284706, -2.498968, -3.428161, 0.572549, 1, 0, 1,
-0.7230762, 1.669362, 0.2635527, 0.5647059, 1, 0, 1,
-0.7212006, -2.610094, -2.896746, 0.5607843, 1, 0, 1,
-0.7167905, -2.507296, -3.503158, 0.5529412, 1, 0, 1,
-0.7135916, 0.1671007, 1.073789, 0.5490196, 1, 0, 1,
-0.7089783, -0.2638244, -1.381823, 0.5411765, 1, 0, 1,
-0.7083889, 0.8399024, 0.538388, 0.5372549, 1, 0, 1,
-0.7058378, -0.3531733, -3.002836, 0.5294118, 1, 0, 1,
-0.7011945, 0.3264296, -2.248143, 0.5254902, 1, 0, 1,
-0.6926616, 0.1982699, 0.4352694, 0.5176471, 1, 0, 1,
-0.6826138, -1.353115, -1.054262, 0.5137255, 1, 0, 1,
-0.6804006, 0.03858634, -1.11248, 0.5058824, 1, 0, 1,
-0.6762055, 0.4408097, -0.4705556, 0.5019608, 1, 0, 1,
-0.6734324, -0.6636699, -1.271828, 0.4941176, 1, 0, 1,
-0.6725491, -0.8482037, -0.9349279, 0.4862745, 1, 0, 1,
-0.6648425, 0.138417, -2.120519, 0.4823529, 1, 0, 1,
-0.6642788, -0.3088598, -1.12027, 0.4745098, 1, 0, 1,
-0.6589685, -0.6298795, -2.156557, 0.4705882, 1, 0, 1,
-0.6589684, 0.7096893, 1.655395, 0.4627451, 1, 0, 1,
-0.6588243, 0.04743142, -1.64669, 0.4588235, 1, 0, 1,
-0.6575065, 1.071679, -1.634704, 0.4509804, 1, 0, 1,
-0.6553487, 0.3164658, -2.088459, 0.4470588, 1, 0, 1,
-0.6460593, -0.3867273, -2.632116, 0.4392157, 1, 0, 1,
-0.6460522, -0.6156725, -4.707363, 0.4352941, 1, 0, 1,
-0.635962, -1.096085, -2.93117, 0.427451, 1, 0, 1,
-0.6327253, -0.3411181, -4.031158, 0.4235294, 1, 0, 1,
-0.6318753, 0.654995, -0.0108301, 0.4156863, 1, 0, 1,
-0.6292608, 0.658676, -0.7586173, 0.4117647, 1, 0, 1,
-0.6278115, -0.600338, -2.40669, 0.4039216, 1, 0, 1,
-0.626695, 1.845204, -0.305389, 0.3960784, 1, 0, 1,
-0.625108, 0.2644279, -2.222877, 0.3921569, 1, 0, 1,
-0.6197445, 0.9713603, 0.6108923, 0.3843137, 1, 0, 1,
-0.6169605, 0.1428998, -2.459865, 0.3803922, 1, 0, 1,
-0.6167967, -0.08239018, -1.857973, 0.372549, 1, 0, 1,
-0.6163015, 1.158064, -1.272059, 0.3686275, 1, 0, 1,
-0.6153473, -0.1067528, -2.421093, 0.3607843, 1, 0, 1,
-0.6122425, 0.6547458, -2.118615, 0.3568628, 1, 0, 1,
-0.6022935, -0.1118045, -1.97155, 0.3490196, 1, 0, 1,
-0.5936094, -1.37089, -0.9018463, 0.345098, 1, 0, 1,
-0.5936071, 0.3471473, -1.494999, 0.3372549, 1, 0, 1,
-0.588669, 0.2317588, -3.640938, 0.3333333, 1, 0, 1,
-0.5875459, -1.563555, -2.998088, 0.3254902, 1, 0, 1,
-0.5818558, 0.4452004, -1.051131, 0.3215686, 1, 0, 1,
-0.5788945, -0.8844565, -4.519682, 0.3137255, 1, 0, 1,
-0.5768891, -2.160768, -2.904559, 0.3098039, 1, 0, 1,
-0.5748453, -1.318515, -1.543577, 0.3019608, 1, 0, 1,
-0.5743458, -0.3223749, -2.15394, 0.2941177, 1, 0, 1,
-0.5735267, 0.09923469, -2.72691, 0.2901961, 1, 0, 1,
-0.5725598, -0.7118565, -2.278211, 0.282353, 1, 0, 1,
-0.562074, 1.248527, 0.3528179, 0.2784314, 1, 0, 1,
-0.5604393, 1.02685, -1.640288, 0.2705882, 1, 0, 1,
-0.5550562, -0.8221252, -2.748579, 0.2666667, 1, 0, 1,
-0.5519091, -0.2618633, -3.443171, 0.2588235, 1, 0, 1,
-0.5485979, -0.4141634, -3.39193, 0.254902, 1, 0, 1,
-0.5474626, 1.827864, -1.067904, 0.2470588, 1, 0, 1,
-0.5453848, 1.388341, -0.6117025, 0.2431373, 1, 0, 1,
-0.5451508, 1.554918, -0.1959251, 0.2352941, 1, 0, 1,
-0.5446345, 0.5481094, 0.7464434, 0.2313726, 1, 0, 1,
-0.542266, 0.1064053, -1.669178, 0.2235294, 1, 0, 1,
-0.5339761, -0.2148949, -1.11738, 0.2196078, 1, 0, 1,
-0.5330787, -0.2395834, -1.854542, 0.2117647, 1, 0, 1,
-0.5325483, 0.6232118, -2.890148, 0.2078431, 1, 0, 1,
-0.5311256, 1.181991, 0.6704157, 0.2, 1, 0, 1,
-0.5271136, -0.2594114, -1.08145, 0.1921569, 1, 0, 1,
-0.525184, -0.08954988, -0.4479879, 0.1882353, 1, 0, 1,
-0.5218468, -1.573024, -4.095265, 0.1803922, 1, 0, 1,
-0.5090283, 1.188119, -0.3935405, 0.1764706, 1, 0, 1,
-0.5037333, 1.467235, 0.03478051, 0.1686275, 1, 0, 1,
-0.5014651, -0.7086138, -3.04476, 0.1647059, 1, 0, 1,
-0.4970039, -0.4813385, -3.037398, 0.1568628, 1, 0, 1,
-0.4849996, -1.001962, -2.025687, 0.1529412, 1, 0, 1,
-0.4834555, 0.7582381, 0.07374185, 0.145098, 1, 0, 1,
-0.4770084, -0.4397881, -2.539692, 0.1411765, 1, 0, 1,
-0.4764279, 1.202501, -0.5864701, 0.1333333, 1, 0, 1,
-0.4701274, 0.1086152, -1.256954, 0.1294118, 1, 0, 1,
-0.4684002, 1.123474, -1.615589, 0.1215686, 1, 0, 1,
-0.4681876, 0.2753285, -0.8945624, 0.1176471, 1, 0, 1,
-0.4654268, -0.06116782, 0.4296094, 0.1098039, 1, 0, 1,
-0.4617682, 0.8184661, -0.1984542, 0.1058824, 1, 0, 1,
-0.4608025, -1.163363, -4.299309, 0.09803922, 1, 0, 1,
-0.4600199, -1.263248, -2.261307, 0.09019608, 1, 0, 1,
-0.4595698, 0.2849001, -2.082483, 0.08627451, 1, 0, 1,
-0.4583105, 0.9987295, -0.248845, 0.07843138, 1, 0, 1,
-0.4556981, 1.607813, -0.6170292, 0.07450981, 1, 0, 1,
-0.4531984, -0.3068965, -3.291351, 0.06666667, 1, 0, 1,
-0.4519754, 0.1760553, -1.265816, 0.0627451, 1, 0, 1,
-0.4455175, -1.417919, -1.839268, 0.05490196, 1, 0, 1,
-0.44374, 0.1546369, -1.920018, 0.05098039, 1, 0, 1,
-0.4406861, -0.526737, -2.512471, 0.04313726, 1, 0, 1,
-0.4364172, 0.1343753, -2.246548, 0.03921569, 1, 0, 1,
-0.4273941, -0.1354539, -1.517559, 0.03137255, 1, 0, 1,
-0.4224172, -0.1191559, -1.443698, 0.02745098, 1, 0, 1,
-0.4121507, -1.221309, -4.276567, 0.01960784, 1, 0, 1,
-0.4120973, 0.5403666, -1.675061, 0.01568628, 1, 0, 1,
-0.4120139, -0.9260073, -0.8825021, 0.007843138, 1, 0, 1,
-0.4108907, -0.3002903, -2.38402, 0.003921569, 1, 0, 1,
-0.4084845, 1.549367, 1.040419, 0, 1, 0.003921569, 1,
-0.4071358, 1.042556, -0.07056779, 0, 1, 0.01176471, 1,
-0.4030348, -1.218575, -2.085785, 0, 1, 0.01568628, 1,
-0.3996137, -0.9821445, -2.320056, 0, 1, 0.02352941, 1,
-0.3969813, 0.1139519, -2.393195, 0, 1, 0.02745098, 1,
-0.3966711, -0.5270807, -2.134896, 0, 1, 0.03529412, 1,
-0.3962852, 0.6063206, 0.8298963, 0, 1, 0.03921569, 1,
-0.3929892, 0.1457342, 0.2527716, 0, 1, 0.04705882, 1,
-0.3920488, 2.163702, 0.5547132, 0, 1, 0.05098039, 1,
-0.3919782, -1.161651, -2.612431, 0, 1, 0.05882353, 1,
-0.3892383, 0.9162222, 0.861396, 0, 1, 0.0627451, 1,
-0.3884722, -1.609023, -1.75394, 0, 1, 0.07058824, 1,
-0.3878949, 0.4980012, -0.2402176, 0, 1, 0.07450981, 1,
-0.3822804, 1.717448, 1.574518, 0, 1, 0.08235294, 1,
-0.3713412, -0.5074537, -1.844115, 0, 1, 0.08627451, 1,
-0.3696647, 1.023037, 0.03706411, 0, 1, 0.09411765, 1,
-0.3686906, 0.6995513, -0.2276269, 0, 1, 0.1019608, 1,
-0.3670478, 0.7047926, 0.6710974, 0, 1, 0.1058824, 1,
-0.3661563, -0.2949578, -2.065708, 0, 1, 0.1137255, 1,
-0.3643177, 0.6995298, -1.478628, 0, 1, 0.1176471, 1,
-0.3624735, 0.5310959, -0.3521802, 0, 1, 0.1254902, 1,
-0.3584354, 1.00365, 0.2620673, 0, 1, 0.1294118, 1,
-0.356929, 0.04266645, -1.280373, 0, 1, 0.1372549, 1,
-0.3563292, 0.3684882, -1.357045, 0, 1, 0.1411765, 1,
-0.3528293, 0.2266081, -0.2558612, 0, 1, 0.1490196, 1,
-0.3444619, -0.7952969, -2.189509, 0, 1, 0.1529412, 1,
-0.3433803, 1.194377, -0.9902422, 0, 1, 0.1607843, 1,
-0.3350105, 0.4052606, -0.785929, 0, 1, 0.1647059, 1,
-0.3347381, 0.4688944, -0.970395, 0, 1, 0.172549, 1,
-0.3346296, -1.793842, -3.251582, 0, 1, 0.1764706, 1,
-0.3321315, 0.4757945, -0.1906521, 0, 1, 0.1843137, 1,
-0.325006, -0.1973516, -0.8284703, 0, 1, 0.1882353, 1,
-0.3243355, 0.2655317, -1.166689, 0, 1, 0.1960784, 1,
-0.3224119, 2.218948, -0.6158726, 0, 1, 0.2039216, 1,
-0.3201731, -0.2876985, -3.236883, 0, 1, 0.2078431, 1,
-0.319931, 1.534169, -0.21218, 0, 1, 0.2156863, 1,
-0.3177344, -1.769266, -3.422765, 0, 1, 0.2196078, 1,
-0.3131874, -2.396187, -1.615732, 0, 1, 0.227451, 1,
-0.3075587, -0.2018002, -3.339259, 0, 1, 0.2313726, 1,
-0.3046201, -0.03201019, -0.9960282, 0, 1, 0.2392157, 1,
-0.3035041, -0.04131747, -1.056783, 0, 1, 0.2431373, 1,
-0.302304, 0.9851015, -1.096865, 0, 1, 0.2509804, 1,
-0.2970787, -1.740437, -2.292207, 0, 1, 0.254902, 1,
-0.2960025, 1.789694, -1.058058, 0, 1, 0.2627451, 1,
-0.2955271, -1.417143, -0.8788116, 0, 1, 0.2666667, 1,
-0.2921979, 0.7952855, 0.4993492, 0, 1, 0.2745098, 1,
-0.2905746, -0.4540243, -1.597519, 0, 1, 0.2784314, 1,
-0.2872582, -0.0390758, -1.789392, 0, 1, 0.2862745, 1,
-0.285714, -0.1696556, -0.3158785, 0, 1, 0.2901961, 1,
-0.2856608, 2.288801, -0.2828874, 0, 1, 0.2980392, 1,
-0.2852172, -1.05719, -2.861791, 0, 1, 0.3058824, 1,
-0.2851554, -1.023415, -2.352594, 0, 1, 0.3098039, 1,
-0.2842497, 0.484881, -1.727511, 0, 1, 0.3176471, 1,
-0.2821532, 0.1812586, -1.99124, 0, 1, 0.3215686, 1,
-0.2814315, 0.3823006, -1.537812, 0, 1, 0.3294118, 1,
-0.2807345, 0.6285534, 1.203001, 0, 1, 0.3333333, 1,
-0.2800783, -0.2714134, -3.234986, 0, 1, 0.3411765, 1,
-0.2769689, 1.417069, -0.1578826, 0, 1, 0.345098, 1,
-0.2766743, 1.678719, -0.8920442, 0, 1, 0.3529412, 1,
-0.2746546, 0.4390752, 0.2216898, 0, 1, 0.3568628, 1,
-0.2740385, -1.067402, -1.979583, 0, 1, 0.3647059, 1,
-0.2702747, -0.2137331, -3.591194, 0, 1, 0.3686275, 1,
-0.2700962, -0.5411155, -0.398838, 0, 1, 0.3764706, 1,
-0.267747, 0.1470091, -1.162975, 0, 1, 0.3803922, 1,
-0.2657413, -1.321561, -2.255788, 0, 1, 0.3882353, 1,
-0.2652359, 2.056733, -1.256227, 0, 1, 0.3921569, 1,
-0.2640986, -0.8681511, -3.532337, 0, 1, 0.4, 1,
-0.2528042, -0.08614352, -2.7017, 0, 1, 0.4078431, 1,
-0.2507132, 1.455315, -0.1296302, 0, 1, 0.4117647, 1,
-0.2483958, 0.2625809, 1.053011, 0, 1, 0.4196078, 1,
-0.2419945, 1.152515, -0.722834, 0, 1, 0.4235294, 1,
-0.2416571, 1.946491, 0.7131881, 0, 1, 0.4313726, 1,
-0.2396611, 0.9400397, 0.2358205, 0, 1, 0.4352941, 1,
-0.2268492, 0.2248367, -0.8874618, 0, 1, 0.4431373, 1,
-0.2243024, -0.3268943, -1.311528, 0, 1, 0.4470588, 1,
-0.2226742, 0.438884, -0.8067459, 0, 1, 0.454902, 1,
-0.215528, 1.965151, -2.117123, 0, 1, 0.4588235, 1,
-0.2141485, 2.936999, 2.446406, 0, 1, 0.4666667, 1,
-0.2134473, -0.08270224, -3.158934, 0, 1, 0.4705882, 1,
-0.211911, -1.071715, -5.383926, 0, 1, 0.4784314, 1,
-0.2117894, 1.989422, -0.4519463, 0, 1, 0.4823529, 1,
-0.2106416, 0.2597753, -0.9972895, 0, 1, 0.4901961, 1,
-0.2102689, -0.009361622, 0.1779972, 0, 1, 0.4941176, 1,
-0.2075309, 0.3132562, -0.3286966, 0, 1, 0.5019608, 1,
-0.2063226, -0.6798691, -3.300255, 0, 1, 0.509804, 1,
-0.2063055, 0.06503949, -0.6620837, 0, 1, 0.5137255, 1,
-0.2038491, 2.666391, -0.2398371, 0, 1, 0.5215687, 1,
-0.2004142, 0.3277501, -2.439257, 0, 1, 0.5254902, 1,
-0.1971597, 0.6522788, -0.3291822, 0, 1, 0.5333334, 1,
-0.1962585, 0.4687783, 1.219915, 0, 1, 0.5372549, 1,
-0.1942611, 1.004363, -0.1893708, 0, 1, 0.5450981, 1,
-0.1909567, -1.112626, -4.304737, 0, 1, 0.5490196, 1,
-0.1908019, -0.4899963, -2.0476, 0, 1, 0.5568628, 1,
-0.1901605, -1.00542, -1.39852, 0, 1, 0.5607843, 1,
-0.1876141, -0.7422996, -3.060739, 0, 1, 0.5686275, 1,
-0.1854517, -0.583482, -3.105665, 0, 1, 0.572549, 1,
-0.1838545, 0.2045038, -0.8618074, 0, 1, 0.5803922, 1,
-0.1829381, -1.206784, -3.958665, 0, 1, 0.5843138, 1,
-0.1792545, -1.588944, -4.944007, 0, 1, 0.5921569, 1,
-0.1771178, -1.366935, -2.336932, 0, 1, 0.5960785, 1,
-0.1766067, -0.3946601, -2.802675, 0, 1, 0.6039216, 1,
-0.170072, 0.2652786, -2.59989, 0, 1, 0.6117647, 1,
-0.1697847, 1.41338, 0.545228, 0, 1, 0.6156863, 1,
-0.1687801, 0.3005312, -0.9112865, 0, 1, 0.6235294, 1,
-0.1668763, -0.4444656, -3.694586, 0, 1, 0.627451, 1,
-0.1659215, -1.296118, -2.567264, 0, 1, 0.6352941, 1,
-0.1656634, -0.4206352, -1.27394, 0, 1, 0.6392157, 1,
-0.1656555, -0.1284022, -3.787114, 0, 1, 0.6470588, 1,
-0.1636208, 0.2740116, -0.8563842, 0, 1, 0.6509804, 1,
-0.1627204, 0.9548082, 0.2364444, 0, 1, 0.6588235, 1,
-0.1617551, -1.78375, -3.632488, 0, 1, 0.6627451, 1,
-0.1498671, -0.9850837, -2.940114, 0, 1, 0.6705883, 1,
-0.1473453, -0.1290605, -1.980368, 0, 1, 0.6745098, 1,
-0.1468699, -0.7533942, -1.100322, 0, 1, 0.682353, 1,
-0.1402363, -0.392015, -3.910711, 0, 1, 0.6862745, 1,
-0.1348428, 0.6321858, 0.7548249, 0, 1, 0.6941177, 1,
-0.1193359, -0.4475732, -2.542101, 0, 1, 0.7019608, 1,
-0.1189497, -0.8910387, -3.844071, 0, 1, 0.7058824, 1,
-0.1144391, 1.02626, 1.638362, 0, 1, 0.7137255, 1,
-0.1129312, -0.001193743, -0.384817, 0, 1, 0.7176471, 1,
-0.1103557, 1.535787, 0.3253442, 0, 1, 0.7254902, 1,
-0.1099924, -0.4656514, -3.930989, 0, 1, 0.7294118, 1,
-0.1070149, -0.4236017, -4.181096, 0, 1, 0.7372549, 1,
-0.1028228, 1.26817, -0.8324277, 0, 1, 0.7411765, 1,
-0.08991453, 0.3493506, -0.1933211, 0, 1, 0.7490196, 1,
-0.07852744, 1.030293, 0.4026554, 0, 1, 0.7529412, 1,
-0.07810149, -0.2705161, -3.050646, 0, 1, 0.7607843, 1,
-0.07676618, 2.036152, 1.576049, 0, 1, 0.7647059, 1,
-0.07548135, -0.5593122, -2.403228, 0, 1, 0.772549, 1,
-0.06767119, 0.05151504, -0.3170966, 0, 1, 0.7764706, 1,
-0.06069278, -2.123298, -4.471445, 0, 1, 0.7843137, 1,
-0.0597989, 0.009770672, -1.093501, 0, 1, 0.7882353, 1,
-0.05918008, 1.567476, -2.906066, 0, 1, 0.7960784, 1,
-0.05818066, 0.05972207, 0.6179959, 0, 1, 0.8039216, 1,
-0.05655998, -0.5421686, -4.331399, 0, 1, 0.8078431, 1,
-0.05189171, 0.1009367, -1.160197, 0, 1, 0.8156863, 1,
-0.05163588, 2.690716, 0.3476362, 0, 1, 0.8196079, 1,
-0.04662776, -1.583644, -4.821337, 0, 1, 0.827451, 1,
-0.04641571, -0.7239082, 0.0225061, 0, 1, 0.8313726, 1,
-0.04077685, 1.096924, 1.090674, 0, 1, 0.8392157, 1,
-0.03640349, -0.8449926, -3.560827, 0, 1, 0.8431373, 1,
-0.03489875, -0.1460525, -2.32738, 0, 1, 0.8509804, 1,
-0.02851985, -0.001034454, -2.016616, 0, 1, 0.854902, 1,
-0.02372092, 0.2315951, -2.614845, 0, 1, 0.8627451, 1,
-0.02310506, -0.2667679, -3.70544, 0, 1, 0.8666667, 1,
-0.02217942, 0.3553426, 0.1791852, 0, 1, 0.8745098, 1,
-0.02128057, 0.7337282, 0.6453983, 0, 1, 0.8784314, 1,
-0.02030584, -0.5510216, -4.809669, 0, 1, 0.8862745, 1,
-0.01834901, 1.149391, -0.8344551, 0, 1, 0.8901961, 1,
-0.01821093, -0.4491692, -4.010981, 0, 1, 0.8980392, 1,
-0.01789679, -0.4200629, -4.031268, 0, 1, 0.9058824, 1,
-0.01479447, 1.076785, -0.7630048, 0, 1, 0.9098039, 1,
-0.0100484, -0.8448714, -5.161085, 0, 1, 0.9176471, 1,
-0.005185517, 2.124505, -0.7901675, 0, 1, 0.9215686, 1,
-0.004256619, -0.5246845, -3.350549, 0, 1, 0.9294118, 1,
-0.002578378, -1.619196, -4.884044, 0, 1, 0.9333333, 1,
-0.002465733, 0.7075579, 0.7241993, 0, 1, 0.9411765, 1,
-0.001505793, 0.5765283, -0.02752169, 0, 1, 0.945098, 1,
0.002359725, -2.467955, 2.263046, 0, 1, 0.9529412, 1,
0.01031826, 0.7947006, -0.3802393, 0, 1, 0.9568627, 1,
0.01397718, 0.7592739, 0.5811968, 0, 1, 0.9647059, 1,
0.015706, -0.4086162, 2.377254, 0, 1, 0.9686275, 1,
0.01740246, 1.415884, 1.198661, 0, 1, 0.9764706, 1,
0.02318715, 1.128545, -0.4695677, 0, 1, 0.9803922, 1,
0.02419092, -0.04147729, 1.508203, 0, 1, 0.9882353, 1,
0.02929109, -1.471284, 4.318557, 0, 1, 0.9921569, 1,
0.03440099, 1.697924, -2.039065, 0, 1, 1, 1,
0.03468777, -0.3664886, 2.602337, 0, 0.9921569, 1, 1,
0.03794289, 0.5441957, 1.132575, 0, 0.9882353, 1, 1,
0.04093734, 1.50589, -0.3777249, 0, 0.9803922, 1, 1,
0.04226853, 0.5070921, 2.663069, 0, 0.9764706, 1, 1,
0.04288141, -1.651363, 3.444765, 0, 0.9686275, 1, 1,
0.04311018, 1.418881, 0.08365654, 0, 0.9647059, 1, 1,
0.04698713, 0.719806, -0.002719766, 0, 0.9568627, 1, 1,
0.04744699, 0.7682213, -1.264549, 0, 0.9529412, 1, 1,
0.05236364, 1.762528, -1.127318, 0, 0.945098, 1, 1,
0.05647924, -0.8699349, 3.491385, 0, 0.9411765, 1, 1,
0.05659011, 0.05261571, -1.225032, 0, 0.9333333, 1, 1,
0.05864475, 2.117177, -0.2360764, 0, 0.9294118, 1, 1,
0.06019477, -1.48536, 3.043085, 0, 0.9215686, 1, 1,
0.06172446, 0.2257749, 0.3034596, 0, 0.9176471, 1, 1,
0.06219245, -1.165723, -0.02129575, 0, 0.9098039, 1, 1,
0.06848243, 1.441414, 0.9307559, 0, 0.9058824, 1, 1,
0.07073388, 0.03863452, 1.700555, 0, 0.8980392, 1, 1,
0.07387592, -0.8412053, 2.599207, 0, 0.8901961, 1, 1,
0.07994041, 0.4844648, 0.723417, 0, 0.8862745, 1, 1,
0.08283967, -2.445177, 4.282026, 0, 0.8784314, 1, 1,
0.08303922, 2.166079, 2.055967, 0, 0.8745098, 1, 1,
0.08462214, 0.02896709, 2.246669, 0, 0.8666667, 1, 1,
0.08626432, -1.415923, 1.838812, 0, 0.8627451, 1, 1,
0.08846941, -0.9664675, 3.656345, 0, 0.854902, 1, 1,
0.089097, 0.004565006, 1.205019, 0, 0.8509804, 1, 1,
0.08922967, 0.485696, 0.4071091, 0, 0.8431373, 1, 1,
0.09219257, -0.06734487, 1.300543, 0, 0.8392157, 1, 1,
0.09384295, 0.321866, -0.623376, 0, 0.8313726, 1, 1,
0.09535825, -1.517072, 2.413996, 0, 0.827451, 1, 1,
0.09904519, 0.7718248, 0.7424286, 0, 0.8196079, 1, 1,
0.1049625, -1.201143, 3.664617, 0, 0.8156863, 1, 1,
0.1059614, 0.4601642, 0.5124936, 0, 0.8078431, 1, 1,
0.1157076, 1.472276, 0.2819935, 0, 0.8039216, 1, 1,
0.1224527, -0.1176968, 2.743292, 0, 0.7960784, 1, 1,
0.1230769, -1.196816, 3.294403, 0, 0.7882353, 1, 1,
0.1260532, -1.068484, 3.808759, 0, 0.7843137, 1, 1,
0.1271611, 2.144332, 1.337714, 0, 0.7764706, 1, 1,
0.1272797, 0.1201279, 0.5231313, 0, 0.772549, 1, 1,
0.1335671, 2.459996, 0.3609795, 0, 0.7647059, 1, 1,
0.1357645, 1.408893, -0.3220477, 0, 0.7607843, 1, 1,
0.1368805, -1.219534, 2.391249, 0, 0.7529412, 1, 1,
0.1398428, -1.476708, 3.242377, 0, 0.7490196, 1, 1,
0.140661, -0.3349249, 3.441651, 0, 0.7411765, 1, 1,
0.1462725, -0.5337993, 3.387176, 0, 0.7372549, 1, 1,
0.1559193, 1.504504, -0.5961455, 0, 0.7294118, 1, 1,
0.1584582, 0.272772, -0.2160165, 0, 0.7254902, 1, 1,
0.1593045, -0.1503835, 4.223994, 0, 0.7176471, 1, 1,
0.1599257, -0.1778921, 3.860831, 0, 0.7137255, 1, 1,
0.1606547, -0.2101312, 3.409999, 0, 0.7058824, 1, 1,
0.1614554, -0.1163725, 2.220325, 0, 0.6980392, 1, 1,
0.1654939, 1.590637, 0.5296586, 0, 0.6941177, 1, 1,
0.1655364, 1.290928, 0.1991412, 0, 0.6862745, 1, 1,
0.1676032, 2.456378, -1.365427, 0, 0.682353, 1, 1,
0.173176, -0.620451, 3.960416, 0, 0.6745098, 1, 1,
0.1739115, 0.8134254, 1.026621, 0, 0.6705883, 1, 1,
0.1791694, 0.6216148, 0.04097564, 0, 0.6627451, 1, 1,
0.1802753, -1.503293, 2.165926, 0, 0.6588235, 1, 1,
0.1810146, -0.1383976, 1.081008, 0, 0.6509804, 1, 1,
0.1813723, 1.158247, -0.6097439, 0, 0.6470588, 1, 1,
0.1836632, -0.3924587, 2.576104, 0, 0.6392157, 1, 1,
0.1842421, -0.1584149, 1.016337, 0, 0.6352941, 1, 1,
0.1876263, -1.953341, 3.873113, 0, 0.627451, 1, 1,
0.198057, -0.1166309, 1.628248, 0, 0.6235294, 1, 1,
0.1986208, 0.4850402, 0.2733138, 0, 0.6156863, 1, 1,
0.1987983, -1.754666, 3.05163, 0, 0.6117647, 1, 1,
0.2006578, 0.08488405, 0.9623941, 0, 0.6039216, 1, 1,
0.2015486, 0.05952505, 0.6189467, 0, 0.5960785, 1, 1,
0.2021739, 1.345019, 2.980596, 0, 0.5921569, 1, 1,
0.2028486, 0.7049152, 2.105839, 0, 0.5843138, 1, 1,
0.2042598, 0.3952326, 0.1619291, 0, 0.5803922, 1, 1,
0.2072888, -0.2021437, 1.792549, 0, 0.572549, 1, 1,
0.2089435, -0.9018955, 0.3169755, 0, 0.5686275, 1, 1,
0.2104019, -1.975418, 3.329054, 0, 0.5607843, 1, 1,
0.2112134, 1.432651, -0.8052917, 0, 0.5568628, 1, 1,
0.2150153, -0.2179669, 3.970665, 0, 0.5490196, 1, 1,
0.2196142, -0.1992781, 2.454572, 0, 0.5450981, 1, 1,
0.2242932, -0.4918355, 3.244805, 0, 0.5372549, 1, 1,
0.2278527, -0.6172473, 4.397053, 0, 0.5333334, 1, 1,
0.2284535, -0.3136777, 2.837118, 0, 0.5254902, 1, 1,
0.2291785, 0.5835979, -0.7762191, 0, 0.5215687, 1, 1,
0.229827, 1.218201, -0.2137503, 0, 0.5137255, 1, 1,
0.2345555, 0.240077, -1.34032, 0, 0.509804, 1, 1,
0.2453036, -1.781312, 4.247584, 0, 0.5019608, 1, 1,
0.245498, 0.5553634, -0.5545919, 0, 0.4941176, 1, 1,
0.2455792, 0.5340773, 1.075076, 0, 0.4901961, 1, 1,
0.2461842, -2.396818, 4.758741, 0, 0.4823529, 1, 1,
0.2501263, -1.801452, 3.721076, 0, 0.4784314, 1, 1,
0.2509995, -0.321134, 2.421484, 0, 0.4705882, 1, 1,
0.2526011, -0.4453604, 4.496323, 0, 0.4666667, 1, 1,
0.2564339, -0.4778752, 1.712969, 0, 0.4588235, 1, 1,
0.2584805, -0.5090041, 3.672011, 0, 0.454902, 1, 1,
0.2617351, 0.1603602, 0.2629232, 0, 0.4470588, 1, 1,
0.2620696, -0.7388006, 2.122956, 0, 0.4431373, 1, 1,
0.2630672, -0.5697153, 2.221102, 0, 0.4352941, 1, 1,
0.2692303, 0.6388065, 0.1590552, 0, 0.4313726, 1, 1,
0.27068, -0.6355503, 3.853727, 0, 0.4235294, 1, 1,
0.272579, 1.430692, 2.399437, 0, 0.4196078, 1, 1,
0.2752523, 0.4362811, 0.831176, 0, 0.4117647, 1, 1,
0.2768486, 1.122194, -0.6579841, 0, 0.4078431, 1, 1,
0.2771928, -0.758293, 2.6774, 0, 0.4, 1, 1,
0.2786859, 0.315767, 1.384865, 0, 0.3921569, 1, 1,
0.2794281, -2.011046, 2.079092, 0, 0.3882353, 1, 1,
0.2800909, -1.401347, 2.210196, 0, 0.3803922, 1, 1,
0.2823235, -1.32184, 2.722471, 0, 0.3764706, 1, 1,
0.2961369, -0.4743102, 2.629623, 0, 0.3686275, 1, 1,
0.2965661, 0.1714191, 3.032609, 0, 0.3647059, 1, 1,
0.2982087, -0.3815596, 4.45994, 0, 0.3568628, 1, 1,
0.2990055, 1.443464, -0.7090354, 0, 0.3529412, 1, 1,
0.299673, 1.236566, -0.4911807, 0, 0.345098, 1, 1,
0.302187, -0.6817693, 3.887831, 0, 0.3411765, 1, 1,
0.3072983, -0.3605377, 3.248721, 0, 0.3333333, 1, 1,
0.3083167, 0.7458817, 2.210487, 0, 0.3294118, 1, 1,
0.3119895, -0.955638, 3.288329, 0, 0.3215686, 1, 1,
0.3136226, -0.7114131, 2.862917, 0, 0.3176471, 1, 1,
0.3150904, 0.7611262, 0.8797455, 0, 0.3098039, 1, 1,
0.3170233, 0.966312, 2.270191, 0, 0.3058824, 1, 1,
0.3190211, -0.413713, 3.211651, 0, 0.2980392, 1, 1,
0.3237563, 0.08345035, -0.3350072, 0, 0.2901961, 1, 1,
0.3248376, -0.2715766, 0.8720562, 0, 0.2862745, 1, 1,
0.3275042, 0.9230751, 0.4748039, 0, 0.2784314, 1, 1,
0.3283601, 1.583803, 2.303803, 0, 0.2745098, 1, 1,
0.3330195, -0.01036891, 2.991881, 0, 0.2666667, 1, 1,
0.3399228, -0.6915894, 0.8544926, 0, 0.2627451, 1, 1,
0.3418128, 2.223394, 1.335883, 0, 0.254902, 1, 1,
0.3423735, 1.325466, -0.5605326, 0, 0.2509804, 1, 1,
0.3469483, -0.7628847, 2.307109, 0, 0.2431373, 1, 1,
0.347846, 1.708132, -0.144536, 0, 0.2392157, 1, 1,
0.3488878, -0.5321552, 3.07569, 0, 0.2313726, 1, 1,
0.3492821, 0.6447402, 1.40369, 0, 0.227451, 1, 1,
0.3500626, 1.047084, 2.309058, 0, 0.2196078, 1, 1,
0.3526305, -1.39123, 4.058877, 0, 0.2156863, 1, 1,
0.3547003, 0.5477312, 2.551751, 0, 0.2078431, 1, 1,
0.3586136, 0.04711665, 2.070034, 0, 0.2039216, 1, 1,
0.3615151, -0.1099332, 2.456454, 0, 0.1960784, 1, 1,
0.3634147, 0.7369609, 0.673277, 0, 0.1882353, 1, 1,
0.3637307, 2.227024, 1.136134, 0, 0.1843137, 1, 1,
0.3649323, -1.061992, 2.973965, 0, 0.1764706, 1, 1,
0.3663351, -1.404351, 3.644928, 0, 0.172549, 1, 1,
0.3663788, 1.133421, 0.09062429, 0, 0.1647059, 1, 1,
0.371998, -1.168381, 2.329939, 0, 0.1607843, 1, 1,
0.3732942, 0.02591259, 3.219353, 0, 0.1529412, 1, 1,
0.3736661, 0.8579008, 0.6259057, 0, 0.1490196, 1, 1,
0.376423, 0.8225446, 1.728742, 0, 0.1411765, 1, 1,
0.3774325, -0.3687792, 2.12381, 0, 0.1372549, 1, 1,
0.3852595, -0.331741, 2.286911, 0, 0.1294118, 1, 1,
0.3857331, 0.764156, 1.330247, 0, 0.1254902, 1, 1,
0.3872967, 1.623259, -0.2054837, 0, 0.1176471, 1, 1,
0.3873253, -1.166294, 4.192482, 0, 0.1137255, 1, 1,
0.3891742, 0.2913193, 1.678548, 0, 0.1058824, 1, 1,
0.3897114, -0.2389396, 3.781943, 0, 0.09803922, 1, 1,
0.3935044, 0.4465232, 1.002457, 0, 0.09411765, 1, 1,
0.3964688, -1.213003, 1.898536, 0, 0.08627451, 1, 1,
0.401701, 0.6638986, 0.6389533, 0, 0.08235294, 1, 1,
0.403432, -0.08370566, 2.502671, 0, 0.07450981, 1, 1,
0.4043459, -1.660437, 2.560463, 0, 0.07058824, 1, 1,
0.4147659, 0.4570853, 0.6383447, 0, 0.0627451, 1, 1,
0.4257011, -0.2983312, 2.014806, 0, 0.05882353, 1, 1,
0.4408333, 0.5095568, 2.402789, 0, 0.05098039, 1, 1,
0.4438459, 0.3967539, 2.684439, 0, 0.04705882, 1, 1,
0.4445773, -2.107929, 2.720484, 0, 0.03921569, 1, 1,
0.4460496, 1.147293, 1.124245, 0, 0.03529412, 1, 1,
0.4463871, 0.332695, 2.024744, 0, 0.02745098, 1, 1,
0.4565353, 0.2467841, 1.158497, 0, 0.02352941, 1, 1,
0.4610178, -0.1483659, 1.576692, 0, 0.01568628, 1, 1,
0.4624459, 0.6751493, -0.6869921, 0, 0.01176471, 1, 1,
0.4655228, 0.701363, 0.3870639, 0, 0.003921569, 1, 1,
0.4662533, 0.169147, 0.9254731, 0.003921569, 0, 1, 1,
0.4694238, 1.920351, 0.6332513, 0.007843138, 0, 1, 1,
0.46962, 1.576606, 1.545217, 0.01568628, 0, 1, 1,
0.4704103, -0.2399972, 0.9884285, 0.01960784, 0, 1, 1,
0.47401, 2.23514, -0.5293499, 0.02745098, 0, 1, 1,
0.4753541, -0.2196405, 1.353163, 0.03137255, 0, 1, 1,
0.4773538, -0.2781003, 0.9269633, 0.03921569, 0, 1, 1,
0.4777907, 0.04799536, 0.9757919, 0.04313726, 0, 1, 1,
0.4847353, -1.333019, 3.651402, 0.05098039, 0, 1, 1,
0.4883807, 0.5366052, 1.325517, 0.05490196, 0, 1, 1,
0.4980083, -0.1482413, 0.939483, 0.0627451, 0, 1, 1,
0.4988689, -0.7298222, 2.022883, 0.06666667, 0, 1, 1,
0.5041864, -0.7980198, 3.557144, 0.07450981, 0, 1, 1,
0.5042796, 1.255322, -0.5916673, 0.07843138, 0, 1, 1,
0.514385, -1.059545, 3.568574, 0.08627451, 0, 1, 1,
0.5145628, -0.2058101, 1.407808, 0.09019608, 0, 1, 1,
0.5154601, -1.456301, 3.487349, 0.09803922, 0, 1, 1,
0.5158384, 0.297444, 1.2565, 0.1058824, 0, 1, 1,
0.5220648, -0.2866418, 2.125124, 0.1098039, 0, 1, 1,
0.5252073, 1.355965, -0.1940381, 0.1176471, 0, 1, 1,
0.5333576, -0.6120007, 4.170257, 0.1215686, 0, 1, 1,
0.533663, -0.2474492, 2.63302, 0.1294118, 0, 1, 1,
0.5347921, 1.206275, -0.7613568, 0.1333333, 0, 1, 1,
0.5397687, -0.07533459, 0.7740691, 0.1411765, 0, 1, 1,
0.5449088, 0.5335299, -0.9485487, 0.145098, 0, 1, 1,
0.5474693, 0.3926567, 1.83694, 0.1529412, 0, 1, 1,
0.549684, 0.8385658, 0.7040909, 0.1568628, 0, 1, 1,
0.5498461, -0.1066622, 2.265186, 0.1647059, 0, 1, 1,
0.5510148, -2.312725, 2.435934, 0.1686275, 0, 1, 1,
0.5532213, -0.6287963, 0.6271815, 0.1764706, 0, 1, 1,
0.5561925, -1.741314, 1.383953, 0.1803922, 0, 1, 1,
0.5565585, -0.7900664, 4.063858, 0.1882353, 0, 1, 1,
0.5635247, -0.4961987, 1.57863, 0.1921569, 0, 1, 1,
0.5668373, -0.8351447, 3.742955, 0.2, 0, 1, 1,
0.5712153, 0.2864327, 1.909612, 0.2078431, 0, 1, 1,
0.571614, -0.8897217, 2.606878, 0.2117647, 0, 1, 1,
0.5748367, 1.152923, -1.069957, 0.2196078, 0, 1, 1,
0.5773712, 0.3115282, 1.287219, 0.2235294, 0, 1, 1,
0.5820028, -2.243606, 4.583984, 0.2313726, 0, 1, 1,
0.5878263, -0.4429903, 2.059412, 0.2352941, 0, 1, 1,
0.5887099, -1.006589, 5.086776, 0.2431373, 0, 1, 1,
0.5958769, -1.31574, 4.016082, 0.2470588, 0, 1, 1,
0.5975788, -1.609641, 2.190379, 0.254902, 0, 1, 1,
0.5997396, -1.02839, 1.324735, 0.2588235, 0, 1, 1,
0.6005315, -0.7213638, 1.77736, 0.2666667, 0, 1, 1,
0.6008635, -0.8779151, 3.398738, 0.2705882, 0, 1, 1,
0.6016266, -1.640409, 4.462524, 0.2784314, 0, 1, 1,
0.6019473, 1.63563, -0.484082, 0.282353, 0, 1, 1,
0.6033344, 0.9319428, 1.094509, 0.2901961, 0, 1, 1,
0.6040722, -0.5566314, 2.962105, 0.2941177, 0, 1, 1,
0.60758, 0.05490414, 2.258592, 0.3019608, 0, 1, 1,
0.6101152, -0.9222887, 2.222147, 0.3098039, 0, 1, 1,
0.6128011, -0.3278883, 1.340357, 0.3137255, 0, 1, 1,
0.6133335, 0.4047469, 1.617098, 0.3215686, 0, 1, 1,
0.6151491, -0.8177196, 1.081287, 0.3254902, 0, 1, 1,
0.6230636, -1.587986, 4.557539, 0.3333333, 0, 1, 1,
0.6254858, -0.547123, 2.479528, 0.3372549, 0, 1, 1,
0.6255625, -0.4990839, 2.471669, 0.345098, 0, 1, 1,
0.6263564, 0.8403174, -0.3729563, 0.3490196, 0, 1, 1,
0.6291484, 1.948369, -1.171454, 0.3568628, 0, 1, 1,
0.632639, 1.421153, -0.4670447, 0.3607843, 0, 1, 1,
0.6387445, -0.5357251, 1.320553, 0.3686275, 0, 1, 1,
0.6426101, 1.413831, 2.104587, 0.372549, 0, 1, 1,
0.6478053, -0.7932393, 2.587133, 0.3803922, 0, 1, 1,
0.6504252, 0.5041979, 0.9676195, 0.3843137, 0, 1, 1,
0.6592742, -1.763323, 4.774533, 0.3921569, 0, 1, 1,
0.6604749, -0.5572399, 3.019164, 0.3960784, 0, 1, 1,
0.660507, -1.296215, 0.8716452, 0.4039216, 0, 1, 1,
0.6692582, -0.2758617, 3.149113, 0.4117647, 0, 1, 1,
0.6763276, -0.2573188, 1.860588, 0.4156863, 0, 1, 1,
0.6785416, -0.7261819, 2.607527, 0.4235294, 0, 1, 1,
0.6848475, -0.02013505, -0.332935, 0.427451, 0, 1, 1,
0.6850856, -0.5020853, 1.704719, 0.4352941, 0, 1, 1,
0.6899846, -0.158506, 3.095236, 0.4392157, 0, 1, 1,
0.6958262, -0.1169305, 2.816139, 0.4470588, 0, 1, 1,
0.6969116, 0.8643887, 0.5743839, 0.4509804, 0, 1, 1,
0.699346, 1.089361, 1.431384, 0.4588235, 0, 1, 1,
0.7024132, 0.8155794, -0.6741125, 0.4627451, 0, 1, 1,
0.7060118, -1.376949, 2.558782, 0.4705882, 0, 1, 1,
0.7086933, -1.095271, 0.1578052, 0.4745098, 0, 1, 1,
0.7088477, 1.927455, 1.092024, 0.4823529, 0, 1, 1,
0.709344, -0.1148888, 0.9666633, 0.4862745, 0, 1, 1,
0.722109, 0.5839081, 0.694719, 0.4941176, 0, 1, 1,
0.7259421, -0.9657907, 2.498692, 0.5019608, 0, 1, 1,
0.7261924, 1.22886, 0.4280665, 0.5058824, 0, 1, 1,
0.7274494, -0.2370744, 1.422056, 0.5137255, 0, 1, 1,
0.7295753, 0.5065959, 0.1322057, 0.5176471, 0, 1, 1,
0.7299133, -0.1692951, 1.625428, 0.5254902, 0, 1, 1,
0.7309611, 1.745925, 0.706353, 0.5294118, 0, 1, 1,
0.7352649, -0.9565055, 1.371239, 0.5372549, 0, 1, 1,
0.7395223, -0.4530273, 2.485169, 0.5411765, 0, 1, 1,
0.7402323, -1.707953, 2.612259, 0.5490196, 0, 1, 1,
0.7464, -1.109584, 3.414692, 0.5529412, 0, 1, 1,
0.7478499, -0.34247, 1.445801, 0.5607843, 0, 1, 1,
0.7517477, -0.8586695, 2.607881, 0.5647059, 0, 1, 1,
0.7518486, -0.8197632, 1.212377, 0.572549, 0, 1, 1,
0.7566534, 0.3830458, 0.1556086, 0.5764706, 0, 1, 1,
0.7625466, -0.1848263, 1.897565, 0.5843138, 0, 1, 1,
0.7651587, 0.03058409, 1.368638, 0.5882353, 0, 1, 1,
0.7669408, 0.1884904, 2.713125, 0.5960785, 0, 1, 1,
0.7728288, -1.282706, 5.106175, 0.6039216, 0, 1, 1,
0.7734905, -0.00952253, 2.753784, 0.6078432, 0, 1, 1,
0.7779763, -0.5405803, 2.289953, 0.6156863, 0, 1, 1,
0.7779975, -1.373713, 2.895422, 0.6196079, 0, 1, 1,
0.778002, 1.02588, 0.4018754, 0.627451, 0, 1, 1,
0.7806083, -0.004224248, 2.582404, 0.6313726, 0, 1, 1,
0.7864639, 0.1988375, -0.3299236, 0.6392157, 0, 1, 1,
0.7908263, 1.186354, 0.7088344, 0.6431373, 0, 1, 1,
0.7922326, 1.296916, 3.538122, 0.6509804, 0, 1, 1,
0.7928528, -0.787912, 3.556157, 0.654902, 0, 1, 1,
0.7950264, 1.291714, 0.882248, 0.6627451, 0, 1, 1,
0.7987409, 1.848496, -1.54024, 0.6666667, 0, 1, 1,
0.803403, 2.164966, -0.1811083, 0.6745098, 0, 1, 1,
0.8044506, 1.409749, 2.516231, 0.6784314, 0, 1, 1,
0.8074262, -0.5704823, 3.455402, 0.6862745, 0, 1, 1,
0.8089224, -0.06481036, 2.279587, 0.6901961, 0, 1, 1,
0.8097777, 0.01458041, 1.322255, 0.6980392, 0, 1, 1,
0.8108067, 1.935951, 2.223302, 0.7058824, 0, 1, 1,
0.8122953, -0.5248649, 0.09616886, 0.7098039, 0, 1, 1,
0.812471, 0.6237805, -0.6326753, 0.7176471, 0, 1, 1,
0.8140122, 0.1702875, 1.777846, 0.7215686, 0, 1, 1,
0.8146467, -0.1698035, 2.602134, 0.7294118, 0, 1, 1,
0.8149477, 1.354845, 2.685122, 0.7333333, 0, 1, 1,
0.8156701, 0.6442923, 0.3462698, 0.7411765, 0, 1, 1,
0.8235518, 0.4328843, 0.7023977, 0.7450981, 0, 1, 1,
0.8249997, 0.3087487, 1.887501, 0.7529412, 0, 1, 1,
0.8307796, 0.7140893, 1.521026, 0.7568628, 0, 1, 1,
0.8326713, 0.7132636, 1.273463, 0.7647059, 0, 1, 1,
0.8339667, -1.834358, 1.899052, 0.7686275, 0, 1, 1,
0.833995, -0.9185647, 2.257463, 0.7764706, 0, 1, 1,
0.8353978, 0.09213623, 0.7478431, 0.7803922, 0, 1, 1,
0.8360857, 0.2365951, 1.162197, 0.7882353, 0, 1, 1,
0.8421407, -1.701306, 2.690136, 0.7921569, 0, 1, 1,
0.8424733, 0.1432906, 1.564344, 0.8, 0, 1, 1,
0.8519935, 0.6455886, 1.03891, 0.8078431, 0, 1, 1,
0.8558188, -0.08759252, 2.533566, 0.8117647, 0, 1, 1,
0.8620653, 0.4045524, 1.131127, 0.8196079, 0, 1, 1,
0.8649734, -1.067489, 1.942764, 0.8235294, 0, 1, 1,
0.8683124, -0.8377243, 2.945423, 0.8313726, 0, 1, 1,
0.8693947, 1.627996, -0.8746178, 0.8352941, 0, 1, 1,
0.8764036, -0.3422495, 1.642772, 0.8431373, 0, 1, 1,
0.8862889, -0.4500704, 0.7819533, 0.8470588, 0, 1, 1,
0.8899298, 0.2998613, 0.9768447, 0.854902, 0, 1, 1,
0.8900769, 0.7519786, 0.2020199, 0.8588235, 0, 1, 1,
0.9005686, -0.1053958, 1.297682, 0.8666667, 0, 1, 1,
0.9079311, -0.3858965, 1.844179, 0.8705882, 0, 1, 1,
0.910594, -0.2668202, 0.9950089, 0.8784314, 0, 1, 1,
0.9115873, -0.6645836, 0.9035892, 0.8823529, 0, 1, 1,
0.9136439, -0.3545706, 1.048869, 0.8901961, 0, 1, 1,
0.9193684, -0.5017726, 4.091731, 0.8941177, 0, 1, 1,
0.9202719, 0.3047289, 1.077634, 0.9019608, 0, 1, 1,
0.9267566, -1.342983, 3.241251, 0.9098039, 0, 1, 1,
0.9335938, 0.1153577, 1.483213, 0.9137255, 0, 1, 1,
0.947051, -2.434148, 3.430296, 0.9215686, 0, 1, 1,
0.9478189, 1.208594, -0.3984433, 0.9254902, 0, 1, 1,
0.948597, 0.1392904, 1.424057, 0.9333333, 0, 1, 1,
0.950946, -1.084859, 2.804295, 0.9372549, 0, 1, 1,
0.9519587, -0.6739424, 2.490062, 0.945098, 0, 1, 1,
0.9521285, 0.9034586, 1.118039, 0.9490196, 0, 1, 1,
0.9531857, -0.5105169, 1.499319, 0.9568627, 0, 1, 1,
0.9564157, -0.07853056, 1.484094, 0.9607843, 0, 1, 1,
0.9569882, -1.412441, 1.710816, 0.9686275, 0, 1, 1,
0.9575245, -0.1459768, 1.390406, 0.972549, 0, 1, 1,
0.9578999, 1.264245, 0.005194912, 0.9803922, 0, 1, 1,
0.9613274, 0.3732914, 0.3238083, 0.9843137, 0, 1, 1,
0.96272, -1.104711, 2.583096, 0.9921569, 0, 1, 1,
0.9661031, 1.232552, 0.938839, 0.9960784, 0, 1, 1,
0.9714934, 0.3957529, 2.117345, 1, 0, 0.9960784, 1,
0.979397, 0.7931316, -1.070463, 1, 0, 0.9882353, 1,
0.9918322, 0.3297141, 0.2210451, 1, 0, 0.9843137, 1,
0.9921139, 0.03471052, 2.865983, 1, 0, 0.9764706, 1,
0.9971124, -0.3773914, 1.635379, 1, 0, 0.972549, 1,
0.9975917, 0.1748596, 2.255548, 1, 0, 0.9647059, 1,
0.9996569, 0.9206163, 0.1617717, 1, 0, 0.9607843, 1,
1.000226, -0.3052838, 1.598068, 1, 0, 0.9529412, 1,
1.004984, -1.714807, 0.6871305, 1, 0, 0.9490196, 1,
1.00735, 0.757158, 0.4641245, 1, 0, 0.9411765, 1,
1.009118, -1.643426, 2.410134, 1, 0, 0.9372549, 1,
1.016474, -0.6310512, 2.307799, 1, 0, 0.9294118, 1,
1.018468, -1.725848, 2.707892, 1, 0, 0.9254902, 1,
1.019137, -0.5172989, 1.842302, 1, 0, 0.9176471, 1,
1.021193, -0.992421, 0.2859265, 1, 0, 0.9137255, 1,
1.021968, 0.5278885, 1.052387, 1, 0, 0.9058824, 1,
1.026908, 1.312486, -0.1752186, 1, 0, 0.9019608, 1,
1.027137, 0.4940092, 2.193683, 1, 0, 0.8941177, 1,
1.027648, 2.058402, -0.134933, 1, 0, 0.8862745, 1,
1.027821, 1.992117, 1.306443, 1, 0, 0.8823529, 1,
1.029969, 0.7671273, -0.3915103, 1, 0, 0.8745098, 1,
1.03554, 0.5029838, 0.7993756, 1, 0, 0.8705882, 1,
1.037991, 0.7047223, 0.7882719, 1, 0, 0.8627451, 1,
1.048253, 1.247102, 1.008073, 1, 0, 0.8588235, 1,
1.048481, 0.2154003, 0.004581338, 1, 0, 0.8509804, 1,
1.051111, 1.05897, -0.3795151, 1, 0, 0.8470588, 1,
1.052975, 0.639945, 2.506254, 1, 0, 0.8392157, 1,
1.068216, -0.1049601, 0.2657754, 1, 0, 0.8352941, 1,
1.070793, -0.8492751, 1.715096, 1, 0, 0.827451, 1,
1.082976, -0.9737515, 3.206647, 1, 0, 0.8235294, 1,
1.08648, -0.1234153, 0.9386355, 1, 0, 0.8156863, 1,
1.09668, -0.4881707, 1.593243, 1, 0, 0.8117647, 1,
1.103465, 0.07717484, 1.359114, 1, 0, 0.8039216, 1,
1.106635, 1.574981, -0.2837746, 1, 0, 0.7960784, 1,
1.123596, -0.2221326, 1.318929, 1, 0, 0.7921569, 1,
1.124563, -1.221238, 3.036975, 1, 0, 0.7843137, 1,
1.135892, -1.695003, 2.773477, 1, 0, 0.7803922, 1,
1.139018, 1.086643, -0.4084628, 1, 0, 0.772549, 1,
1.14123, 0.6791705, 3.270086, 1, 0, 0.7686275, 1,
1.14151, -0.6682189, 3.043799, 1, 0, 0.7607843, 1,
1.157337, 1.324594, 2.299238, 1, 0, 0.7568628, 1,
1.172143, 0.1213261, 4.474014, 1, 0, 0.7490196, 1,
1.18025, 1.048902, 0.4710958, 1, 0, 0.7450981, 1,
1.18395, 2.138274, 0.6016937, 1, 0, 0.7372549, 1,
1.195233, -0.6757737, 2.691605, 1, 0, 0.7333333, 1,
1.196969, -0.09522431, 2.473326, 1, 0, 0.7254902, 1,
1.197895, -1.256281, 2.292213, 1, 0, 0.7215686, 1,
1.19854, -1.020792, 4.046206, 1, 0, 0.7137255, 1,
1.200872, -0.902878, 1.205354, 1, 0, 0.7098039, 1,
1.203048, 2.14841, -0.8689278, 1, 0, 0.7019608, 1,
1.207228, 0.7575868, -1.301921, 1, 0, 0.6941177, 1,
1.216542, 0.09285415, 1.244959, 1, 0, 0.6901961, 1,
1.230127, 0.4121093, 0.4934186, 1, 0, 0.682353, 1,
1.230954, 0.6423158, 1.879703, 1, 0, 0.6784314, 1,
1.246502, 0.7643421, 0.7974998, 1, 0, 0.6705883, 1,
1.251374, -0.4146734, 1.47626, 1, 0, 0.6666667, 1,
1.258972, -1.827416, 0.2575144, 1, 0, 0.6588235, 1,
1.260162, -0.3529325, 2.940066, 1, 0, 0.654902, 1,
1.262809, -0.7219832, 3.081879, 1, 0, 0.6470588, 1,
1.263127, -0.7266693, 3.215743, 1, 0, 0.6431373, 1,
1.264914, 0.7698467, 0.714547, 1, 0, 0.6352941, 1,
1.264924, 1.379046, 0.185126, 1, 0, 0.6313726, 1,
1.269889, 0.1021814, 1.470726, 1, 0, 0.6235294, 1,
1.282008, -2.479864, 1.891462, 1, 0, 0.6196079, 1,
1.283155, 1.058496, 1.949177, 1, 0, 0.6117647, 1,
1.28743, 1.374086, 0.1229153, 1, 0, 0.6078432, 1,
1.288997, -0.3918437, 1.969401, 1, 0, 0.6, 1,
1.291021, -0.5284757, 3.305972, 1, 0, 0.5921569, 1,
1.295839, -0.4003116, 1.622391, 1, 0, 0.5882353, 1,
1.297416, -1.665817, 1.880223, 1, 0, 0.5803922, 1,
1.298684, -0.987229, 2.821612, 1, 0, 0.5764706, 1,
1.319755, 0.7261746, -0.210467, 1, 0, 0.5686275, 1,
1.338884, -0.108674, 1.839408, 1, 0, 0.5647059, 1,
1.340744, -0.8819814, 0.9578109, 1, 0, 0.5568628, 1,
1.346839, 2.25034, -1.048206, 1, 0, 0.5529412, 1,
1.351067, 1.027867, 0.8700709, 1, 0, 0.5450981, 1,
1.354437, -0.299006, 2.094665, 1, 0, 0.5411765, 1,
1.363422, 0.9890542, 0.02859888, 1, 0, 0.5333334, 1,
1.37357, -0.09292351, 2.125255, 1, 0, 0.5294118, 1,
1.37516, -1.018926, 1.430919, 1, 0, 0.5215687, 1,
1.375452, -0.05456543, 2.459664, 1, 0, 0.5176471, 1,
1.386965, -0.0654723, 0.3309661, 1, 0, 0.509804, 1,
1.394494, 0.1456874, 1.826052, 1, 0, 0.5058824, 1,
1.411539, 0.1918233, 2.486667, 1, 0, 0.4980392, 1,
1.421101, 1.678615, 0.8837257, 1, 0, 0.4901961, 1,
1.425556, -0.3109373, 2.335121, 1, 0, 0.4862745, 1,
1.42564, 0.01447312, 1.078888, 1, 0, 0.4784314, 1,
1.426594, -0.4728146, 1.937498, 1, 0, 0.4745098, 1,
1.433961, 1.14441, 1.667653, 1, 0, 0.4666667, 1,
1.437961, -1.549309, 1.213644, 1, 0, 0.4627451, 1,
1.442229, -2.016324, 0.3284407, 1, 0, 0.454902, 1,
1.44295, -1.215574, 3.220896, 1, 0, 0.4509804, 1,
1.448264, 0.6484661, 1.002472, 1, 0, 0.4431373, 1,
1.448512, -1.380297, 3.118458, 1, 0, 0.4392157, 1,
1.478048, 0.8034785, -0.38256, 1, 0, 0.4313726, 1,
1.489073, 1.402588, 0.7618421, 1, 0, 0.427451, 1,
1.493631, -1.362182, 1.799715, 1, 0, 0.4196078, 1,
1.498894, -0.1798469, 2.056376, 1, 0, 0.4156863, 1,
1.499169, -1.422844, 1.601907, 1, 0, 0.4078431, 1,
1.506321, -0.2637421, 2.388819, 1, 0, 0.4039216, 1,
1.517808, -0.8824191, 0.8587552, 1, 0, 0.3960784, 1,
1.521668, 0.9906438, 0.756365, 1, 0, 0.3882353, 1,
1.529611, 2.891309, -0.4688772, 1, 0, 0.3843137, 1,
1.53145, 0.2620959, -0.2688635, 1, 0, 0.3764706, 1,
1.53546, 0.8853987, 2.558429, 1, 0, 0.372549, 1,
1.551174, 1.465255, 1.458259, 1, 0, 0.3647059, 1,
1.585776, 0.0732213, 2.205848, 1, 0, 0.3607843, 1,
1.594106, 1.183252, 1.756411, 1, 0, 0.3529412, 1,
1.609511, -0.633441, 1.71764, 1, 0, 0.3490196, 1,
1.625035, 0.345883, 2.896716, 1, 0, 0.3411765, 1,
1.630608, 1.368597, 1.02464, 1, 0, 0.3372549, 1,
1.642645, -0.7085999, 0.9441329, 1, 0, 0.3294118, 1,
1.643939, -0.04652933, -0.4485616, 1, 0, 0.3254902, 1,
1.655536, -0.04421265, 1.010664, 1, 0, 0.3176471, 1,
1.663149, 0.2274846, 2.989314, 1, 0, 0.3137255, 1,
1.676896, -1.006245, 0.7584313, 1, 0, 0.3058824, 1,
1.686877, -0.5243656, 0.6425108, 1, 0, 0.2980392, 1,
1.712724, -0.2056873, 2.030686, 1, 0, 0.2941177, 1,
1.714017, 0.5914255, -0.9568517, 1, 0, 0.2862745, 1,
1.719354, 0.1877932, 1.360679, 1, 0, 0.282353, 1,
1.72331, -0.0002784317, 1.261397, 1, 0, 0.2745098, 1,
1.734256, -0.942994, 2.592507, 1, 0, 0.2705882, 1,
1.735149, -0.3250729, 1.147056, 1, 0, 0.2627451, 1,
1.753065, -1.191701, 1.698822, 1, 0, 0.2588235, 1,
1.754197, 1.057301, 2.499518, 1, 0, 0.2509804, 1,
1.758146, -0.3188572, 1.960964, 1, 0, 0.2470588, 1,
1.765625, 0.5892822, 1.72704, 1, 0, 0.2392157, 1,
1.774426, -0.01998748, 0.3829355, 1, 0, 0.2352941, 1,
1.801483, -0.3143205, 1.00863, 1, 0, 0.227451, 1,
1.817057, 0.3007467, 1.413682, 1, 0, 0.2235294, 1,
1.818149, -0.9820344, 4.187218, 1, 0, 0.2156863, 1,
1.823886, -0.5216992, 2.676175, 1, 0, 0.2117647, 1,
1.842858, -0.4305059, 0.1758479, 1, 0, 0.2039216, 1,
1.855804, -0.1190247, 1.055487, 1, 0, 0.1960784, 1,
1.857634, -0.7965077, 1.736001, 1, 0, 0.1921569, 1,
1.861756, 0.7666093, -0.3511591, 1, 0, 0.1843137, 1,
1.884064, 2.333137, 0.7089224, 1, 0, 0.1803922, 1,
1.915051, 0.7854446, 0.4576079, 1, 0, 0.172549, 1,
1.931444, -0.7083833, 2.239949, 1, 0, 0.1686275, 1,
1.94467, 0.3149127, 0.3374283, 1, 0, 0.1607843, 1,
1.952445, 0.2210499, 0.8876864, 1, 0, 0.1568628, 1,
1.952633, 0.3415214, 1.731497, 1, 0, 0.1490196, 1,
1.960003, -1.099699, -0.5059404, 1, 0, 0.145098, 1,
1.960383, -0.45529, 2.2074, 1, 0, 0.1372549, 1,
1.977853, 2.679518, 1.876407, 1, 0, 0.1333333, 1,
2.019451, -0.4360146, 2.033193, 1, 0, 0.1254902, 1,
2.034366, -0.05426535, 3.784494, 1, 0, 0.1215686, 1,
2.045741, 1.625839, 1.621887, 1, 0, 0.1137255, 1,
2.084685, -0.4400953, 1.142444, 1, 0, 0.1098039, 1,
2.087971, 0.6074578, 0.6627306, 1, 0, 0.1019608, 1,
2.095009, 0.6691123, 1.934577, 1, 0, 0.09411765, 1,
2.095547, 2.017026, -0.9061773, 1, 0, 0.09019608, 1,
2.117332, -0.4495217, 0.8801432, 1, 0, 0.08235294, 1,
2.143888, -0.3351762, 1.608653, 1, 0, 0.07843138, 1,
2.156228, 0.01594732, 1.260533, 1, 0, 0.07058824, 1,
2.181836, -0.02208999, 0.3138072, 1, 0, 0.06666667, 1,
2.235407, 0.8452105, 0.3572074, 1, 0, 0.05882353, 1,
2.2791, 1.043954, 1.010579, 1, 0, 0.05490196, 1,
2.327865, 0.4692204, 0.7568547, 1, 0, 0.04705882, 1,
2.39708, -0.9040999, 2.263908, 1, 0, 0.04313726, 1,
2.409543, -0.1866211, 3.860619, 1, 0, 0.03529412, 1,
2.428967, -0.2685017, 0.3672679, 1, 0, 0.03137255, 1,
2.621604, 0.8735851, 1.195875, 1, 0, 0.02352941, 1,
3.012725, 1.734833, 2.199004, 1, 0, 0.01960784, 1,
3.316722, -1.182434, 2.88288, 1, 0, 0.01176471, 1,
3.598585, 0.4722511, -0.231479, 1, 0, 0.007843138, 1
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
0.01836526, -3.800932, -7.161998, 0, -0.5, 0.5, 0.5,
0.01836526, -3.800932, -7.161998, 1, -0.5, 0.5, 0.5,
0.01836526, -3.800932, -7.161998, 1, 1.5, 0.5, 0.5,
0.01836526, -3.800932, -7.161998, 0, 1.5, 0.5, 0.5
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
-4.775548, 0.05630982, -7.161998, 0, -0.5, 0.5, 0.5,
-4.775548, 0.05630982, -7.161998, 1, -0.5, 0.5, 0.5,
-4.775548, 0.05630982, -7.161998, 1, 1.5, 0.5, 0.5,
-4.775548, 0.05630982, -7.161998, 0, 1.5, 0.5, 0.5
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
-4.775548, -3.800932, -0.1388752, 0, -0.5, 0.5, 0.5,
-4.775548, -3.800932, -0.1388752, 1, -0.5, 0.5, 0.5,
-4.775548, -3.800932, -0.1388752, 1, 1.5, 0.5, 0.5,
-4.775548, -3.800932, -0.1388752, 0, 1.5, 0.5, 0.5
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
-2, -2.9108, -5.541277,
2, -2.9108, -5.541277,
-2, -2.9108, -5.541277,
-2, -3.059155, -5.811398,
0, -2.9108, -5.541277,
0, -3.059155, -5.811398,
2, -2.9108, -5.541277,
2, -3.059155, -5.811398
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
"0",
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
-2, -3.355866, -6.351638, 0, -0.5, 0.5, 0.5,
-2, -3.355866, -6.351638, 1, -0.5, 0.5, 0.5,
-2, -3.355866, -6.351638, 1, 1.5, 0.5, 0.5,
-2, -3.355866, -6.351638, 0, 1.5, 0.5, 0.5,
0, -3.355866, -6.351638, 0, -0.5, 0.5, 0.5,
0, -3.355866, -6.351638, 1, -0.5, 0.5, 0.5,
0, -3.355866, -6.351638, 1, 1.5, 0.5, 0.5,
0, -3.355866, -6.351638, 0, 1.5, 0.5, 0.5,
2, -3.355866, -6.351638, 0, -0.5, 0.5, 0.5,
2, -3.355866, -6.351638, 1, -0.5, 0.5, 0.5,
2, -3.355866, -6.351638, 1, 1.5, 0.5, 0.5,
2, -3.355866, -6.351638, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.669261, -2, -5.541277,
-3.669261, 2, -5.541277,
-3.669261, -2, -5.541277,
-3.853642, -2, -5.811398,
-3.669261, -1, -5.541277,
-3.853642, -1, -5.811398,
-3.669261, 0, -5.541277,
-3.853642, 0, -5.811398,
-3.669261, 1, -5.541277,
-3.853642, 1, -5.811398,
-3.669261, 2, -5.541277,
-3.853642, 2, -5.811398
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
-4.222404, -2, -6.351638, 0, -0.5, 0.5, 0.5,
-4.222404, -2, -6.351638, 1, -0.5, 0.5, 0.5,
-4.222404, -2, -6.351638, 1, 1.5, 0.5, 0.5,
-4.222404, -2, -6.351638, 0, 1.5, 0.5, 0.5,
-4.222404, -1, -6.351638, 0, -0.5, 0.5, 0.5,
-4.222404, -1, -6.351638, 1, -0.5, 0.5, 0.5,
-4.222404, -1, -6.351638, 1, 1.5, 0.5, 0.5,
-4.222404, -1, -6.351638, 0, 1.5, 0.5, 0.5,
-4.222404, 0, -6.351638, 0, -0.5, 0.5, 0.5,
-4.222404, 0, -6.351638, 1, -0.5, 0.5, 0.5,
-4.222404, 0, -6.351638, 1, 1.5, 0.5, 0.5,
-4.222404, 0, -6.351638, 0, 1.5, 0.5, 0.5,
-4.222404, 1, -6.351638, 0, -0.5, 0.5, 0.5,
-4.222404, 1, -6.351638, 1, -0.5, 0.5, 0.5,
-4.222404, 1, -6.351638, 1, 1.5, 0.5, 0.5,
-4.222404, 1, -6.351638, 0, 1.5, 0.5, 0.5,
-4.222404, 2, -6.351638, 0, -0.5, 0.5, 0.5,
-4.222404, 2, -6.351638, 1, -0.5, 0.5, 0.5,
-4.222404, 2, -6.351638, 1, 1.5, 0.5, 0.5,
-4.222404, 2, -6.351638, 0, 1.5, 0.5, 0.5
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
-3.669261, -2.9108, -4,
-3.669261, -2.9108, 4,
-3.669261, -2.9108, -4,
-3.853642, -3.059155, -4,
-3.669261, -2.9108, -2,
-3.853642, -3.059155, -2,
-3.669261, -2.9108, 0,
-3.853642, -3.059155, 0,
-3.669261, -2.9108, 2,
-3.853642, -3.059155, 2,
-3.669261, -2.9108, 4,
-3.853642, -3.059155, 4
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
-4.222404, -3.355866, -4, 0, -0.5, 0.5, 0.5,
-4.222404, -3.355866, -4, 1, -0.5, 0.5, 0.5,
-4.222404, -3.355866, -4, 1, 1.5, 0.5, 0.5,
-4.222404, -3.355866, -4, 0, 1.5, 0.5, 0.5,
-4.222404, -3.355866, -2, 0, -0.5, 0.5, 0.5,
-4.222404, -3.355866, -2, 1, -0.5, 0.5, 0.5,
-4.222404, -3.355866, -2, 1, 1.5, 0.5, 0.5,
-4.222404, -3.355866, -2, 0, 1.5, 0.5, 0.5,
-4.222404, -3.355866, 0, 0, -0.5, 0.5, 0.5,
-4.222404, -3.355866, 0, 1, -0.5, 0.5, 0.5,
-4.222404, -3.355866, 0, 1, 1.5, 0.5, 0.5,
-4.222404, -3.355866, 0, 0, 1.5, 0.5, 0.5,
-4.222404, -3.355866, 2, 0, -0.5, 0.5, 0.5,
-4.222404, -3.355866, 2, 1, -0.5, 0.5, 0.5,
-4.222404, -3.355866, 2, 1, 1.5, 0.5, 0.5,
-4.222404, -3.355866, 2, 0, 1.5, 0.5, 0.5,
-4.222404, -3.355866, 4, 0, -0.5, 0.5, 0.5,
-4.222404, -3.355866, 4, 1, -0.5, 0.5, 0.5,
-4.222404, -3.355866, 4, 1, 1.5, 0.5, 0.5,
-4.222404, -3.355866, 4, 0, 1.5, 0.5, 0.5
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
-3.669261, -2.9108, -5.541277,
-3.669261, 3.023419, -5.541277,
-3.669261, -2.9108, 5.263527,
-3.669261, 3.023419, 5.263527,
-3.669261, -2.9108, -5.541277,
-3.669261, -2.9108, 5.263527,
-3.669261, 3.023419, -5.541277,
-3.669261, 3.023419, 5.263527,
-3.669261, -2.9108, -5.541277,
3.705991, -2.9108, -5.541277,
-3.669261, -2.9108, 5.263527,
3.705991, -2.9108, 5.263527,
-3.669261, 3.023419, -5.541277,
3.705991, 3.023419, -5.541277,
-3.669261, 3.023419, 5.263527,
3.705991, 3.023419, 5.263527,
3.705991, -2.9108, -5.541277,
3.705991, 3.023419, -5.541277,
3.705991, -2.9108, 5.263527,
3.705991, 3.023419, 5.263527,
3.705991, -2.9108, -5.541277,
3.705991, -2.9108, 5.263527,
3.705991, 3.023419, -5.541277,
3.705991, 3.023419, 5.263527
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
var radius = 7.670629;
var distance = 34.12749;
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
mvMatrix.translate( -0.01836526, -0.05630982, 0.1388752 );
mvMatrix.scale( 1.124522, 1.397595, 0.7675876 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.12749);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
methyldymron<-read.table("methyldymron.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-methyldymron$V2
```

```
## Error in eval(expr, envir, enclos): object 'methyldymron' not found
```

```r
y<-methyldymron$V3
```

```
## Error in eval(expr, envir, enclos): object 'methyldymron' not found
```

```r
z<-methyldymron$V4
```

```
## Error in eval(expr, envir, enclos): object 'methyldymron' not found
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
-3.561854, -1.293279, -3.179779, 0, 0, 1, 1, 1,
-3.129796, -0.05988312, -1.80525, 1, 0, 0, 1, 1,
-3.077935, 1.766255, -1.458024, 1, 0, 0, 1, 1,
-3.018803, -2.213746, -1.119683, 1, 0, 0, 1, 1,
-2.780288, 0.5189059, -2.363094, 1, 0, 0, 1, 1,
-2.622198, 1.427657, -0.2782834, 1, 0, 0, 1, 1,
-2.61619, 0.5233145, -0.8600197, 0, 0, 0, 1, 1,
-2.562458, 0.5368403, -1.319555, 0, 0, 0, 1, 1,
-2.37165, 0.4617147, -2.485885, 0, 0, 0, 1, 1,
-2.234465, 1.448449, -2.206057, 0, 0, 0, 1, 1,
-2.227051, 0.08796055, -1.952542, 0, 0, 0, 1, 1,
-2.208882, 0.1419305, -2.063816, 0, 0, 0, 1, 1,
-2.192594, -0.6753213, -1.316112, 0, 0, 0, 1, 1,
-2.111436, -1.506241, -1.200009, 1, 1, 1, 1, 1,
-2.08987, -0.9300373, -2.358608, 1, 1, 1, 1, 1,
-2.057531, -1.327929, -2.802372, 1, 1, 1, 1, 1,
-2.033783, 1.281668, -1.528138, 1, 1, 1, 1, 1,
-1.997606, -0.6266217, -0.3242486, 1, 1, 1, 1, 1,
-1.985751, -0.8524546, -2.485352, 1, 1, 1, 1, 1,
-1.975734, -0.6680105, -1.13715, 1, 1, 1, 1, 1,
-1.951109, 0.131368, -0.1750982, 1, 1, 1, 1, 1,
-1.913924, 0.3888214, -0.4468457, 1, 1, 1, 1, 1,
-1.899192, -1.817273, -2.597631, 1, 1, 1, 1, 1,
-1.895187, -0.8061508, -0.7722139, 1, 1, 1, 1, 1,
-1.814243, 0.889793, -2.330455, 1, 1, 1, 1, 1,
-1.798587, 0.5371971, -0.3451225, 1, 1, 1, 1, 1,
-1.766016, 0.6209452, -0.3470476, 1, 1, 1, 1, 1,
-1.75345, -1.329165, -2.340252, 1, 1, 1, 1, 1,
-1.742939, 1.302371, -4.528061, 0, 0, 1, 1, 1,
-1.742363, -0.6031879, -3.55881, 1, 0, 0, 1, 1,
-1.71265, 0.7923155, -0.06746888, 1, 0, 0, 1, 1,
-1.705361, -2.129393, -2.469826, 1, 0, 0, 1, 1,
-1.704909, -1.00215, -2.797386, 1, 0, 0, 1, 1,
-1.687377, -0.01376526, -0.4973817, 1, 0, 0, 1, 1,
-1.664394, 0.2022939, -1.933606, 0, 0, 0, 1, 1,
-1.657028, -0.2709876, -2.194789, 0, 0, 0, 1, 1,
-1.642983, -0.04143368, -0.3786328, 0, 0, 0, 1, 1,
-1.63997, 0.263637, -0.6077906, 0, 0, 0, 1, 1,
-1.633646, 0.0824122, -1.659768, 0, 0, 0, 1, 1,
-1.63192, -0.4584014, -3.874301, 0, 0, 0, 1, 1,
-1.631753, -0.4715588, -2.327703, 0, 0, 0, 1, 1,
-1.622602, 0.2616556, -2.151047, 1, 1, 1, 1, 1,
-1.612286, 0.3113951, -2.231526, 1, 1, 1, 1, 1,
-1.606663, -0.4039473, -1.230173, 1, 1, 1, 1, 1,
-1.596321, -0.2054281, -1.46782, 1, 1, 1, 1, 1,
-1.593954, -0.5226039, -2.179132, 1, 1, 1, 1, 1,
-1.59388, -0.8264471, -2.966031, 1, 1, 1, 1, 1,
-1.588999, 1.289042, -0.6483175, 1, 1, 1, 1, 1,
-1.579911, -0.1287345, -1.779425, 1, 1, 1, 1, 1,
-1.56865, 0.4029033, -2.375689, 1, 1, 1, 1, 1,
-1.566216, -0.3852412, -1.116907, 1, 1, 1, 1, 1,
-1.559303, 0.3475701, -1.57304, 1, 1, 1, 1, 1,
-1.553744, -0.1053639, -2.362625, 1, 1, 1, 1, 1,
-1.551388, -0.1462843, -3.680159, 1, 1, 1, 1, 1,
-1.537335, 0.683154, -0.5485032, 1, 1, 1, 1, 1,
-1.514659, 0.06534974, -2.392123, 1, 1, 1, 1, 1,
-1.514444, -0.5628943, -2.53292, 0, 0, 1, 1, 1,
-1.504946, 0.8765069, -3.058801, 1, 0, 0, 1, 1,
-1.500966, -1.280491, -0.9535358, 1, 0, 0, 1, 1,
-1.500859, 0.7589729, -0.8619401, 1, 0, 0, 1, 1,
-1.499018, 1.001619, -0.8620545, 1, 0, 0, 1, 1,
-1.488244, 1.864228, -1.449195, 1, 0, 0, 1, 1,
-1.48576, 0.008019255, -2.075882, 0, 0, 0, 1, 1,
-1.474975, -0.5503721, -1.180091, 0, 0, 0, 1, 1,
-1.46404, 1.135574, 0.08209665, 0, 0, 0, 1, 1,
-1.463723, 0.9089249, -0.9434707, 0, 0, 0, 1, 1,
-1.460678, 2.054331, -1.161674, 0, 0, 0, 1, 1,
-1.460412, 0.8568282, -2.080989, 0, 0, 0, 1, 1,
-1.457479, -0.9869108, -1.438791, 0, 0, 0, 1, 1,
-1.456423, -1.571098, -2.7795, 1, 1, 1, 1, 1,
-1.447838, -0.4614747, -1.616777, 1, 1, 1, 1, 1,
-1.432624, -0.1744995, -1.439706, 1, 1, 1, 1, 1,
-1.419132, -0.5137091, -2.031837, 1, 1, 1, 1, 1,
-1.417137, -0.0180636, -0.8256574, 1, 1, 1, 1, 1,
-1.407629, 0.09337139, -1.8353, 1, 1, 1, 1, 1,
-1.401863, 0.5783924, -0.4889715, 1, 1, 1, 1, 1,
-1.39768, -0.8156536, -1.461936, 1, 1, 1, 1, 1,
-1.396379, 0.01134324, -1.762031, 1, 1, 1, 1, 1,
-1.395434, 0.3925921, -0.7792107, 1, 1, 1, 1, 1,
-1.392876, 0.9926413, -2.340372, 1, 1, 1, 1, 1,
-1.376938, -0.7049813, -0.9962831, 1, 1, 1, 1, 1,
-1.375709, 0.2892227, -1.843209, 1, 1, 1, 1, 1,
-1.361184, -0.2654712, -0.8764754, 1, 1, 1, 1, 1,
-1.350911, -0.06038224, -1.197985, 1, 1, 1, 1, 1,
-1.349273, -0.01553105, -1.091839, 0, 0, 1, 1, 1,
-1.341504, -1.269059, -4.089993, 1, 0, 0, 1, 1,
-1.33807, -0.06366229, -0.6472365, 1, 0, 0, 1, 1,
-1.336355, 0.5978495, -1.406686, 1, 0, 0, 1, 1,
-1.335584, 0.5488963, 0.9014792, 1, 0, 0, 1, 1,
-1.328657, -1.436695, -0.8947083, 1, 0, 0, 1, 1,
-1.311012, -1.708723, -3.007595, 0, 0, 0, 1, 1,
-1.304476, 0.3788844, -2.637501, 0, 0, 0, 1, 1,
-1.301875, 0.5513214, -1.911424, 0, 0, 0, 1, 1,
-1.293795, 0.9783971, -1.220113, 0, 0, 0, 1, 1,
-1.29285, 0.6365962, -1.115491, 0, 0, 0, 1, 1,
-1.289159, -2.824379, -2.992412, 0, 0, 0, 1, 1,
-1.27745, -0.9865158, -3.677465, 0, 0, 0, 1, 1,
-1.277404, -0.3866282, -1.518687, 1, 1, 1, 1, 1,
-1.274483, 1.814764, -0.5006834, 1, 1, 1, 1, 1,
-1.273176, 0.7879397, -0.197379, 1, 1, 1, 1, 1,
-1.266727, -0.3791424, -2.664036, 1, 1, 1, 1, 1,
-1.239947, 0.8100485, -1.754478, 1, 1, 1, 1, 1,
-1.235191, 1.676448, -1.151531, 1, 1, 1, 1, 1,
-1.229958, -1.971933, -2.419929, 1, 1, 1, 1, 1,
-1.228245, -0.2095807, -0.5198334, 1, 1, 1, 1, 1,
-1.227533, -0.6287357, -2.741139, 1, 1, 1, 1, 1,
-1.224062, 0.4788041, 0.3945273, 1, 1, 1, 1, 1,
-1.215626, 0.3358459, 0.6724839, 1, 1, 1, 1, 1,
-1.211654, -0.6462829, -2.299548, 1, 1, 1, 1, 1,
-1.210641, -0.9292967, -2.274913, 1, 1, 1, 1, 1,
-1.201578, 1.058342, -0.8559538, 1, 1, 1, 1, 1,
-1.195294, 0.2830711, -0.2984653, 1, 1, 1, 1, 1,
-1.19197, 0.1898225, -2.568446, 0, 0, 1, 1, 1,
-1.190717, -0.3284014, -1.999636, 1, 0, 0, 1, 1,
-1.189417, -0.8747779, -0.938678, 1, 0, 0, 1, 1,
-1.183956, 0.6306137, 1.322893, 1, 0, 0, 1, 1,
-1.162533, 1.345991, -0.3057837, 1, 0, 0, 1, 1,
-1.161948, -0.6527491, -2.416313, 1, 0, 0, 1, 1,
-1.152683, -1.686875, -1.984254, 0, 0, 0, 1, 1,
-1.151519, -0.7671778, -3.149631, 0, 0, 0, 1, 1,
-1.150625, -0.02607335, -2.553767, 0, 0, 0, 1, 1,
-1.146556, -2.018702, -2.27721, 0, 0, 0, 1, 1,
-1.145482, -0.6709654, -1.731979, 0, 0, 0, 1, 1,
-1.142176, -0.7238967, -3.151485, 0, 0, 0, 1, 1,
-1.136956, -0.2383652, -2.710954, 0, 0, 0, 1, 1,
-1.131552, 1.014616, -0.6735295, 1, 1, 1, 1, 1,
-1.126554, 1.124878, -1.587895, 1, 1, 1, 1, 1,
-1.125528, -0.626973, -2.289422, 1, 1, 1, 1, 1,
-1.125365, -0.7800826, -1.995905, 1, 1, 1, 1, 1,
-1.119948, -1.59453, -1.825091, 1, 1, 1, 1, 1,
-1.117805, -0.6903817, -2.84175, 1, 1, 1, 1, 1,
-1.110844, -0.4432746, -3.389399, 1, 1, 1, 1, 1,
-1.110734, -0.6886476, -2.767101, 1, 1, 1, 1, 1,
-1.107227, 0.03973503, -1.947101, 1, 1, 1, 1, 1,
-1.106715, 0.7582687, -0.1862206, 1, 1, 1, 1, 1,
-1.096778, 0.6359993, -0.8821061, 1, 1, 1, 1, 1,
-1.073411, 0.8109138, -2.798539, 1, 1, 1, 1, 1,
-1.056841, 0.8346934, -1.793431, 1, 1, 1, 1, 1,
-1.053415, 2.185741, -0.3578562, 1, 1, 1, 1, 1,
-1.051129, -0.5516668, -2.973546, 1, 1, 1, 1, 1,
-1.047909, -0.4392148, -2.988168, 0, 0, 1, 1, 1,
-1.04316, 0.5732238, -0.3158458, 1, 0, 0, 1, 1,
-1.040489, -0.6798555, -2.367535, 1, 0, 0, 1, 1,
-1.038727, -0.3350647, -2.618758, 1, 0, 0, 1, 1,
-1.031338, -1.535909, -3.024685, 1, 0, 0, 1, 1,
-1.02256, -0.2132599, -0.5102371, 1, 0, 0, 1, 1,
-1.013871, -1.206471, -3.168165, 0, 0, 0, 1, 1,
-1.011473, 0.0574362, -0.7282642, 0, 0, 0, 1, 1,
-1.009232, 0.1086704, -1.455253, 0, 0, 0, 1, 1,
-1.005773, -0.1654233, -2.124642, 0, 0, 0, 1, 1,
-1.003169, 0.5061271, -2.308522, 0, 0, 0, 1, 1,
-0.9964695, -1.881081, -3.161275, 0, 0, 0, 1, 1,
-0.9955686, 1.134851, -0.7251766, 0, 0, 0, 1, 1,
-0.9954489, -0.5129181, -2.90146, 1, 1, 1, 1, 1,
-0.9938074, 1.33615, 0.3357624, 1, 1, 1, 1, 1,
-0.9906338, 0.9580936, -1.02347, 1, 1, 1, 1, 1,
-0.9876415, -0.9603077, -2.058699, 1, 1, 1, 1, 1,
-0.9820681, 0.04382171, -2.531484, 1, 1, 1, 1, 1,
-0.9798011, 0.4652729, -2.385073, 1, 1, 1, 1, 1,
-0.9795862, 0.3149451, -0.9600859, 1, 1, 1, 1, 1,
-0.9761658, 1.763555, 0.8297555, 1, 1, 1, 1, 1,
-0.9730023, -0.6939208, 0.06115385, 1, 1, 1, 1, 1,
-0.9726459, 0.5954388, 1.109686, 1, 1, 1, 1, 1,
-0.9714256, 1.636832, -1.52555, 1, 1, 1, 1, 1,
-0.9648636, -0.9561725, -1.535388, 1, 1, 1, 1, 1,
-0.9637789, 0.480956, 0.06139628, 1, 1, 1, 1, 1,
-0.9625084, 0.2149175, -2.528683, 1, 1, 1, 1, 1,
-0.9565957, -0.6276934, 0.07216262, 1, 1, 1, 1, 1,
-0.9509903, -0.0286225, -0.5558673, 0, 0, 1, 1, 1,
-0.9408276, 0.1875087, -1.382752, 1, 0, 0, 1, 1,
-0.930035, -0.06381708, -2.449814, 1, 0, 0, 1, 1,
-0.9234246, -0.392807, -2.343517, 1, 0, 0, 1, 1,
-0.9160854, 0.2510755, -0.5462302, 1, 0, 0, 1, 1,
-0.9142072, 0.5844123, -1.614852, 1, 0, 0, 1, 1,
-0.9138908, -0.4749348, -2.405713, 0, 0, 0, 1, 1,
-0.9109753, -0.7781124, -3.166154, 0, 0, 0, 1, 1,
-0.9101436, 0.5328393, -1.508508, 0, 0, 0, 1, 1,
-0.9076264, -1.271841, -2.36124, 0, 0, 0, 1, 1,
-0.8956015, 0.2494067, -0.2034907, 0, 0, 0, 1, 1,
-0.8955617, -1.835249, -3.551002, 0, 0, 0, 1, 1,
-0.8932492, -1.089157, -2.098823, 0, 0, 0, 1, 1,
-0.8912833, -0.147174, -2.75676, 1, 1, 1, 1, 1,
-0.8903742, 1.02218, 0.1145778, 1, 1, 1, 1, 1,
-0.8813732, -1.210869, 0.2094912, 1, 1, 1, 1, 1,
-0.8737814, -0.9992412, -2.926645, 1, 1, 1, 1, 1,
-0.8666382, -1.237678, -2.603513, 1, 1, 1, 1, 1,
-0.8650849, 0.7722831, 0.6473296, 1, 1, 1, 1, 1,
-0.8641737, 0.891494, -1.290533, 1, 1, 1, 1, 1,
-0.8639725, 0.7028187, -2.103179, 1, 1, 1, 1, 1,
-0.8632119, -0.1275174, -1.152286, 1, 1, 1, 1, 1,
-0.860704, 0.2782315, -2.402106, 1, 1, 1, 1, 1,
-0.8534929, 0.3559398, -0.8734475, 1, 1, 1, 1, 1,
-0.8492582, 0.04577411, -0.9580842, 1, 1, 1, 1, 1,
-0.8476516, -0.07540097, 0.4700522, 1, 1, 1, 1, 1,
-0.8468102, -0.5268998, -1.802116, 1, 1, 1, 1, 1,
-0.8391656, -0.6453713, -3.157979, 1, 1, 1, 1, 1,
-0.8304802, 0.3683853, -1.640257, 0, 0, 1, 1, 1,
-0.8276083, -0.1410355, -2.705619, 1, 0, 0, 1, 1,
-0.8245573, 2.389184, -0.4060539, 1, 0, 0, 1, 1,
-0.8212279, 0.3934454, -0.8223506, 1, 0, 0, 1, 1,
-0.8186505, -0.5469018, -3.296123, 1, 0, 0, 1, 1,
-0.81639, 0.9290459, -0.9830685, 1, 0, 0, 1, 1,
-0.8154366, 0.680255, -1.822632, 0, 0, 0, 1, 1,
-0.8148311, -0.2327148, -3.433913, 0, 0, 0, 1, 1,
-0.8111299, 0.08796798, -2.742437, 0, 0, 0, 1, 1,
-0.80908, -0.206607, -3.557311, 0, 0, 0, 1, 1,
-0.8087167, -0.4247259, -1.854145, 0, 0, 0, 1, 1,
-0.8080167, -0.3579657, -1.553394, 0, 0, 0, 1, 1,
-0.8072284, -0.192729, -2.95514, 0, 0, 0, 1, 1,
-0.8067366, -0.6238243, -2.804846, 1, 1, 1, 1, 1,
-0.8056795, 0.8560259, 0.4554845, 1, 1, 1, 1, 1,
-0.8046395, -0.3354701, -2.542836, 1, 1, 1, 1, 1,
-0.7979923, -0.1294935, -2.064149, 1, 1, 1, 1, 1,
-0.7968618, 0.9765478, -1.162763, 1, 1, 1, 1, 1,
-0.7942996, -0.1255997, -2.841786, 1, 1, 1, 1, 1,
-0.7875333, -0.6211258, -1.680459, 1, 1, 1, 1, 1,
-0.7851415, -0.544944, -3.644032, 1, 1, 1, 1, 1,
-0.7830474, -1.130046, -2.398982, 1, 1, 1, 1, 1,
-0.7766277, 0.4914052, -0.1746769, 1, 1, 1, 1, 1,
-0.7761644, 0.292152, -1.91483, 1, 1, 1, 1, 1,
-0.7702556, -1.323206, -1.718969, 1, 1, 1, 1, 1,
-0.770229, -2.174457, -3.34778, 1, 1, 1, 1, 1,
-0.7692969, -0.3211183, -1.756578, 1, 1, 1, 1, 1,
-0.7687981, 0.1201014, -0.6151877, 1, 1, 1, 1, 1,
-0.7659394, -0.2262955, -1.843091, 0, 0, 1, 1, 1,
-0.7609765, -1.262163, -4.612909, 1, 0, 0, 1, 1,
-0.7573426, -0.3351312, -1.375132, 1, 0, 0, 1, 1,
-0.7554326, 0.6793466, -0.7126126, 1, 0, 0, 1, 1,
-0.7526641, -1.474356, -2.599044, 1, 0, 0, 1, 1,
-0.7499532, 2.108212, 0.5857242, 1, 0, 0, 1, 1,
-0.7498983, -0.1498571, -1.291716, 0, 0, 0, 1, 1,
-0.7491367, -1.175184, -2.442285, 0, 0, 0, 1, 1,
-0.7453845, 1.008373, -1.048344, 0, 0, 0, 1, 1,
-0.7451293, -0.08344204, -1.268496, 0, 0, 0, 1, 1,
-0.7449533, 0.5501171, -0.8801479, 0, 0, 0, 1, 1,
-0.7362281, -0.05830991, -0.3434128, 0, 0, 0, 1, 1,
-0.7361806, -0.8185855, -1.009581, 0, 0, 0, 1, 1,
-0.7320561, 0.5087342, -0.5119283, 1, 1, 1, 1, 1,
-0.7284706, -2.498968, -3.428161, 1, 1, 1, 1, 1,
-0.7230762, 1.669362, 0.2635527, 1, 1, 1, 1, 1,
-0.7212006, -2.610094, -2.896746, 1, 1, 1, 1, 1,
-0.7167905, -2.507296, -3.503158, 1, 1, 1, 1, 1,
-0.7135916, 0.1671007, 1.073789, 1, 1, 1, 1, 1,
-0.7089783, -0.2638244, -1.381823, 1, 1, 1, 1, 1,
-0.7083889, 0.8399024, 0.538388, 1, 1, 1, 1, 1,
-0.7058378, -0.3531733, -3.002836, 1, 1, 1, 1, 1,
-0.7011945, 0.3264296, -2.248143, 1, 1, 1, 1, 1,
-0.6926616, 0.1982699, 0.4352694, 1, 1, 1, 1, 1,
-0.6826138, -1.353115, -1.054262, 1, 1, 1, 1, 1,
-0.6804006, 0.03858634, -1.11248, 1, 1, 1, 1, 1,
-0.6762055, 0.4408097, -0.4705556, 1, 1, 1, 1, 1,
-0.6734324, -0.6636699, -1.271828, 1, 1, 1, 1, 1,
-0.6725491, -0.8482037, -0.9349279, 0, 0, 1, 1, 1,
-0.6648425, 0.138417, -2.120519, 1, 0, 0, 1, 1,
-0.6642788, -0.3088598, -1.12027, 1, 0, 0, 1, 1,
-0.6589685, -0.6298795, -2.156557, 1, 0, 0, 1, 1,
-0.6589684, 0.7096893, 1.655395, 1, 0, 0, 1, 1,
-0.6588243, 0.04743142, -1.64669, 1, 0, 0, 1, 1,
-0.6575065, 1.071679, -1.634704, 0, 0, 0, 1, 1,
-0.6553487, 0.3164658, -2.088459, 0, 0, 0, 1, 1,
-0.6460593, -0.3867273, -2.632116, 0, 0, 0, 1, 1,
-0.6460522, -0.6156725, -4.707363, 0, 0, 0, 1, 1,
-0.635962, -1.096085, -2.93117, 0, 0, 0, 1, 1,
-0.6327253, -0.3411181, -4.031158, 0, 0, 0, 1, 1,
-0.6318753, 0.654995, -0.0108301, 0, 0, 0, 1, 1,
-0.6292608, 0.658676, -0.7586173, 1, 1, 1, 1, 1,
-0.6278115, -0.600338, -2.40669, 1, 1, 1, 1, 1,
-0.626695, 1.845204, -0.305389, 1, 1, 1, 1, 1,
-0.625108, 0.2644279, -2.222877, 1, 1, 1, 1, 1,
-0.6197445, 0.9713603, 0.6108923, 1, 1, 1, 1, 1,
-0.6169605, 0.1428998, -2.459865, 1, 1, 1, 1, 1,
-0.6167967, -0.08239018, -1.857973, 1, 1, 1, 1, 1,
-0.6163015, 1.158064, -1.272059, 1, 1, 1, 1, 1,
-0.6153473, -0.1067528, -2.421093, 1, 1, 1, 1, 1,
-0.6122425, 0.6547458, -2.118615, 1, 1, 1, 1, 1,
-0.6022935, -0.1118045, -1.97155, 1, 1, 1, 1, 1,
-0.5936094, -1.37089, -0.9018463, 1, 1, 1, 1, 1,
-0.5936071, 0.3471473, -1.494999, 1, 1, 1, 1, 1,
-0.588669, 0.2317588, -3.640938, 1, 1, 1, 1, 1,
-0.5875459, -1.563555, -2.998088, 1, 1, 1, 1, 1,
-0.5818558, 0.4452004, -1.051131, 0, 0, 1, 1, 1,
-0.5788945, -0.8844565, -4.519682, 1, 0, 0, 1, 1,
-0.5768891, -2.160768, -2.904559, 1, 0, 0, 1, 1,
-0.5748453, -1.318515, -1.543577, 1, 0, 0, 1, 1,
-0.5743458, -0.3223749, -2.15394, 1, 0, 0, 1, 1,
-0.5735267, 0.09923469, -2.72691, 1, 0, 0, 1, 1,
-0.5725598, -0.7118565, -2.278211, 0, 0, 0, 1, 1,
-0.562074, 1.248527, 0.3528179, 0, 0, 0, 1, 1,
-0.5604393, 1.02685, -1.640288, 0, 0, 0, 1, 1,
-0.5550562, -0.8221252, -2.748579, 0, 0, 0, 1, 1,
-0.5519091, -0.2618633, -3.443171, 0, 0, 0, 1, 1,
-0.5485979, -0.4141634, -3.39193, 0, 0, 0, 1, 1,
-0.5474626, 1.827864, -1.067904, 0, 0, 0, 1, 1,
-0.5453848, 1.388341, -0.6117025, 1, 1, 1, 1, 1,
-0.5451508, 1.554918, -0.1959251, 1, 1, 1, 1, 1,
-0.5446345, 0.5481094, 0.7464434, 1, 1, 1, 1, 1,
-0.542266, 0.1064053, -1.669178, 1, 1, 1, 1, 1,
-0.5339761, -0.2148949, -1.11738, 1, 1, 1, 1, 1,
-0.5330787, -0.2395834, -1.854542, 1, 1, 1, 1, 1,
-0.5325483, 0.6232118, -2.890148, 1, 1, 1, 1, 1,
-0.5311256, 1.181991, 0.6704157, 1, 1, 1, 1, 1,
-0.5271136, -0.2594114, -1.08145, 1, 1, 1, 1, 1,
-0.525184, -0.08954988, -0.4479879, 1, 1, 1, 1, 1,
-0.5218468, -1.573024, -4.095265, 1, 1, 1, 1, 1,
-0.5090283, 1.188119, -0.3935405, 1, 1, 1, 1, 1,
-0.5037333, 1.467235, 0.03478051, 1, 1, 1, 1, 1,
-0.5014651, -0.7086138, -3.04476, 1, 1, 1, 1, 1,
-0.4970039, -0.4813385, -3.037398, 1, 1, 1, 1, 1,
-0.4849996, -1.001962, -2.025687, 0, 0, 1, 1, 1,
-0.4834555, 0.7582381, 0.07374185, 1, 0, 0, 1, 1,
-0.4770084, -0.4397881, -2.539692, 1, 0, 0, 1, 1,
-0.4764279, 1.202501, -0.5864701, 1, 0, 0, 1, 1,
-0.4701274, 0.1086152, -1.256954, 1, 0, 0, 1, 1,
-0.4684002, 1.123474, -1.615589, 1, 0, 0, 1, 1,
-0.4681876, 0.2753285, -0.8945624, 0, 0, 0, 1, 1,
-0.4654268, -0.06116782, 0.4296094, 0, 0, 0, 1, 1,
-0.4617682, 0.8184661, -0.1984542, 0, 0, 0, 1, 1,
-0.4608025, -1.163363, -4.299309, 0, 0, 0, 1, 1,
-0.4600199, -1.263248, -2.261307, 0, 0, 0, 1, 1,
-0.4595698, 0.2849001, -2.082483, 0, 0, 0, 1, 1,
-0.4583105, 0.9987295, -0.248845, 0, 0, 0, 1, 1,
-0.4556981, 1.607813, -0.6170292, 1, 1, 1, 1, 1,
-0.4531984, -0.3068965, -3.291351, 1, 1, 1, 1, 1,
-0.4519754, 0.1760553, -1.265816, 1, 1, 1, 1, 1,
-0.4455175, -1.417919, -1.839268, 1, 1, 1, 1, 1,
-0.44374, 0.1546369, -1.920018, 1, 1, 1, 1, 1,
-0.4406861, -0.526737, -2.512471, 1, 1, 1, 1, 1,
-0.4364172, 0.1343753, -2.246548, 1, 1, 1, 1, 1,
-0.4273941, -0.1354539, -1.517559, 1, 1, 1, 1, 1,
-0.4224172, -0.1191559, -1.443698, 1, 1, 1, 1, 1,
-0.4121507, -1.221309, -4.276567, 1, 1, 1, 1, 1,
-0.4120973, 0.5403666, -1.675061, 1, 1, 1, 1, 1,
-0.4120139, -0.9260073, -0.8825021, 1, 1, 1, 1, 1,
-0.4108907, -0.3002903, -2.38402, 1, 1, 1, 1, 1,
-0.4084845, 1.549367, 1.040419, 1, 1, 1, 1, 1,
-0.4071358, 1.042556, -0.07056779, 1, 1, 1, 1, 1,
-0.4030348, -1.218575, -2.085785, 0, 0, 1, 1, 1,
-0.3996137, -0.9821445, -2.320056, 1, 0, 0, 1, 1,
-0.3969813, 0.1139519, -2.393195, 1, 0, 0, 1, 1,
-0.3966711, -0.5270807, -2.134896, 1, 0, 0, 1, 1,
-0.3962852, 0.6063206, 0.8298963, 1, 0, 0, 1, 1,
-0.3929892, 0.1457342, 0.2527716, 1, 0, 0, 1, 1,
-0.3920488, 2.163702, 0.5547132, 0, 0, 0, 1, 1,
-0.3919782, -1.161651, -2.612431, 0, 0, 0, 1, 1,
-0.3892383, 0.9162222, 0.861396, 0, 0, 0, 1, 1,
-0.3884722, -1.609023, -1.75394, 0, 0, 0, 1, 1,
-0.3878949, 0.4980012, -0.2402176, 0, 0, 0, 1, 1,
-0.3822804, 1.717448, 1.574518, 0, 0, 0, 1, 1,
-0.3713412, -0.5074537, -1.844115, 0, 0, 0, 1, 1,
-0.3696647, 1.023037, 0.03706411, 1, 1, 1, 1, 1,
-0.3686906, 0.6995513, -0.2276269, 1, 1, 1, 1, 1,
-0.3670478, 0.7047926, 0.6710974, 1, 1, 1, 1, 1,
-0.3661563, -0.2949578, -2.065708, 1, 1, 1, 1, 1,
-0.3643177, 0.6995298, -1.478628, 1, 1, 1, 1, 1,
-0.3624735, 0.5310959, -0.3521802, 1, 1, 1, 1, 1,
-0.3584354, 1.00365, 0.2620673, 1, 1, 1, 1, 1,
-0.356929, 0.04266645, -1.280373, 1, 1, 1, 1, 1,
-0.3563292, 0.3684882, -1.357045, 1, 1, 1, 1, 1,
-0.3528293, 0.2266081, -0.2558612, 1, 1, 1, 1, 1,
-0.3444619, -0.7952969, -2.189509, 1, 1, 1, 1, 1,
-0.3433803, 1.194377, -0.9902422, 1, 1, 1, 1, 1,
-0.3350105, 0.4052606, -0.785929, 1, 1, 1, 1, 1,
-0.3347381, 0.4688944, -0.970395, 1, 1, 1, 1, 1,
-0.3346296, -1.793842, -3.251582, 1, 1, 1, 1, 1,
-0.3321315, 0.4757945, -0.1906521, 0, 0, 1, 1, 1,
-0.325006, -0.1973516, -0.8284703, 1, 0, 0, 1, 1,
-0.3243355, 0.2655317, -1.166689, 1, 0, 0, 1, 1,
-0.3224119, 2.218948, -0.6158726, 1, 0, 0, 1, 1,
-0.3201731, -0.2876985, -3.236883, 1, 0, 0, 1, 1,
-0.319931, 1.534169, -0.21218, 1, 0, 0, 1, 1,
-0.3177344, -1.769266, -3.422765, 0, 0, 0, 1, 1,
-0.3131874, -2.396187, -1.615732, 0, 0, 0, 1, 1,
-0.3075587, -0.2018002, -3.339259, 0, 0, 0, 1, 1,
-0.3046201, -0.03201019, -0.9960282, 0, 0, 0, 1, 1,
-0.3035041, -0.04131747, -1.056783, 0, 0, 0, 1, 1,
-0.302304, 0.9851015, -1.096865, 0, 0, 0, 1, 1,
-0.2970787, -1.740437, -2.292207, 0, 0, 0, 1, 1,
-0.2960025, 1.789694, -1.058058, 1, 1, 1, 1, 1,
-0.2955271, -1.417143, -0.8788116, 1, 1, 1, 1, 1,
-0.2921979, 0.7952855, 0.4993492, 1, 1, 1, 1, 1,
-0.2905746, -0.4540243, -1.597519, 1, 1, 1, 1, 1,
-0.2872582, -0.0390758, -1.789392, 1, 1, 1, 1, 1,
-0.285714, -0.1696556, -0.3158785, 1, 1, 1, 1, 1,
-0.2856608, 2.288801, -0.2828874, 1, 1, 1, 1, 1,
-0.2852172, -1.05719, -2.861791, 1, 1, 1, 1, 1,
-0.2851554, -1.023415, -2.352594, 1, 1, 1, 1, 1,
-0.2842497, 0.484881, -1.727511, 1, 1, 1, 1, 1,
-0.2821532, 0.1812586, -1.99124, 1, 1, 1, 1, 1,
-0.2814315, 0.3823006, -1.537812, 1, 1, 1, 1, 1,
-0.2807345, 0.6285534, 1.203001, 1, 1, 1, 1, 1,
-0.2800783, -0.2714134, -3.234986, 1, 1, 1, 1, 1,
-0.2769689, 1.417069, -0.1578826, 1, 1, 1, 1, 1,
-0.2766743, 1.678719, -0.8920442, 0, 0, 1, 1, 1,
-0.2746546, 0.4390752, 0.2216898, 1, 0, 0, 1, 1,
-0.2740385, -1.067402, -1.979583, 1, 0, 0, 1, 1,
-0.2702747, -0.2137331, -3.591194, 1, 0, 0, 1, 1,
-0.2700962, -0.5411155, -0.398838, 1, 0, 0, 1, 1,
-0.267747, 0.1470091, -1.162975, 1, 0, 0, 1, 1,
-0.2657413, -1.321561, -2.255788, 0, 0, 0, 1, 1,
-0.2652359, 2.056733, -1.256227, 0, 0, 0, 1, 1,
-0.2640986, -0.8681511, -3.532337, 0, 0, 0, 1, 1,
-0.2528042, -0.08614352, -2.7017, 0, 0, 0, 1, 1,
-0.2507132, 1.455315, -0.1296302, 0, 0, 0, 1, 1,
-0.2483958, 0.2625809, 1.053011, 0, 0, 0, 1, 1,
-0.2419945, 1.152515, -0.722834, 0, 0, 0, 1, 1,
-0.2416571, 1.946491, 0.7131881, 1, 1, 1, 1, 1,
-0.2396611, 0.9400397, 0.2358205, 1, 1, 1, 1, 1,
-0.2268492, 0.2248367, -0.8874618, 1, 1, 1, 1, 1,
-0.2243024, -0.3268943, -1.311528, 1, 1, 1, 1, 1,
-0.2226742, 0.438884, -0.8067459, 1, 1, 1, 1, 1,
-0.215528, 1.965151, -2.117123, 1, 1, 1, 1, 1,
-0.2141485, 2.936999, 2.446406, 1, 1, 1, 1, 1,
-0.2134473, -0.08270224, -3.158934, 1, 1, 1, 1, 1,
-0.211911, -1.071715, -5.383926, 1, 1, 1, 1, 1,
-0.2117894, 1.989422, -0.4519463, 1, 1, 1, 1, 1,
-0.2106416, 0.2597753, -0.9972895, 1, 1, 1, 1, 1,
-0.2102689, -0.009361622, 0.1779972, 1, 1, 1, 1, 1,
-0.2075309, 0.3132562, -0.3286966, 1, 1, 1, 1, 1,
-0.2063226, -0.6798691, -3.300255, 1, 1, 1, 1, 1,
-0.2063055, 0.06503949, -0.6620837, 1, 1, 1, 1, 1,
-0.2038491, 2.666391, -0.2398371, 0, 0, 1, 1, 1,
-0.2004142, 0.3277501, -2.439257, 1, 0, 0, 1, 1,
-0.1971597, 0.6522788, -0.3291822, 1, 0, 0, 1, 1,
-0.1962585, 0.4687783, 1.219915, 1, 0, 0, 1, 1,
-0.1942611, 1.004363, -0.1893708, 1, 0, 0, 1, 1,
-0.1909567, -1.112626, -4.304737, 1, 0, 0, 1, 1,
-0.1908019, -0.4899963, -2.0476, 0, 0, 0, 1, 1,
-0.1901605, -1.00542, -1.39852, 0, 0, 0, 1, 1,
-0.1876141, -0.7422996, -3.060739, 0, 0, 0, 1, 1,
-0.1854517, -0.583482, -3.105665, 0, 0, 0, 1, 1,
-0.1838545, 0.2045038, -0.8618074, 0, 0, 0, 1, 1,
-0.1829381, -1.206784, -3.958665, 0, 0, 0, 1, 1,
-0.1792545, -1.588944, -4.944007, 0, 0, 0, 1, 1,
-0.1771178, -1.366935, -2.336932, 1, 1, 1, 1, 1,
-0.1766067, -0.3946601, -2.802675, 1, 1, 1, 1, 1,
-0.170072, 0.2652786, -2.59989, 1, 1, 1, 1, 1,
-0.1697847, 1.41338, 0.545228, 1, 1, 1, 1, 1,
-0.1687801, 0.3005312, -0.9112865, 1, 1, 1, 1, 1,
-0.1668763, -0.4444656, -3.694586, 1, 1, 1, 1, 1,
-0.1659215, -1.296118, -2.567264, 1, 1, 1, 1, 1,
-0.1656634, -0.4206352, -1.27394, 1, 1, 1, 1, 1,
-0.1656555, -0.1284022, -3.787114, 1, 1, 1, 1, 1,
-0.1636208, 0.2740116, -0.8563842, 1, 1, 1, 1, 1,
-0.1627204, 0.9548082, 0.2364444, 1, 1, 1, 1, 1,
-0.1617551, -1.78375, -3.632488, 1, 1, 1, 1, 1,
-0.1498671, -0.9850837, -2.940114, 1, 1, 1, 1, 1,
-0.1473453, -0.1290605, -1.980368, 1, 1, 1, 1, 1,
-0.1468699, -0.7533942, -1.100322, 1, 1, 1, 1, 1,
-0.1402363, -0.392015, -3.910711, 0, 0, 1, 1, 1,
-0.1348428, 0.6321858, 0.7548249, 1, 0, 0, 1, 1,
-0.1193359, -0.4475732, -2.542101, 1, 0, 0, 1, 1,
-0.1189497, -0.8910387, -3.844071, 1, 0, 0, 1, 1,
-0.1144391, 1.02626, 1.638362, 1, 0, 0, 1, 1,
-0.1129312, -0.001193743, -0.384817, 1, 0, 0, 1, 1,
-0.1103557, 1.535787, 0.3253442, 0, 0, 0, 1, 1,
-0.1099924, -0.4656514, -3.930989, 0, 0, 0, 1, 1,
-0.1070149, -0.4236017, -4.181096, 0, 0, 0, 1, 1,
-0.1028228, 1.26817, -0.8324277, 0, 0, 0, 1, 1,
-0.08991453, 0.3493506, -0.1933211, 0, 0, 0, 1, 1,
-0.07852744, 1.030293, 0.4026554, 0, 0, 0, 1, 1,
-0.07810149, -0.2705161, -3.050646, 0, 0, 0, 1, 1,
-0.07676618, 2.036152, 1.576049, 1, 1, 1, 1, 1,
-0.07548135, -0.5593122, -2.403228, 1, 1, 1, 1, 1,
-0.06767119, 0.05151504, -0.3170966, 1, 1, 1, 1, 1,
-0.06069278, -2.123298, -4.471445, 1, 1, 1, 1, 1,
-0.0597989, 0.009770672, -1.093501, 1, 1, 1, 1, 1,
-0.05918008, 1.567476, -2.906066, 1, 1, 1, 1, 1,
-0.05818066, 0.05972207, 0.6179959, 1, 1, 1, 1, 1,
-0.05655998, -0.5421686, -4.331399, 1, 1, 1, 1, 1,
-0.05189171, 0.1009367, -1.160197, 1, 1, 1, 1, 1,
-0.05163588, 2.690716, 0.3476362, 1, 1, 1, 1, 1,
-0.04662776, -1.583644, -4.821337, 1, 1, 1, 1, 1,
-0.04641571, -0.7239082, 0.0225061, 1, 1, 1, 1, 1,
-0.04077685, 1.096924, 1.090674, 1, 1, 1, 1, 1,
-0.03640349, -0.8449926, -3.560827, 1, 1, 1, 1, 1,
-0.03489875, -0.1460525, -2.32738, 1, 1, 1, 1, 1,
-0.02851985, -0.001034454, -2.016616, 0, 0, 1, 1, 1,
-0.02372092, 0.2315951, -2.614845, 1, 0, 0, 1, 1,
-0.02310506, -0.2667679, -3.70544, 1, 0, 0, 1, 1,
-0.02217942, 0.3553426, 0.1791852, 1, 0, 0, 1, 1,
-0.02128057, 0.7337282, 0.6453983, 1, 0, 0, 1, 1,
-0.02030584, -0.5510216, -4.809669, 1, 0, 0, 1, 1,
-0.01834901, 1.149391, -0.8344551, 0, 0, 0, 1, 1,
-0.01821093, -0.4491692, -4.010981, 0, 0, 0, 1, 1,
-0.01789679, -0.4200629, -4.031268, 0, 0, 0, 1, 1,
-0.01479447, 1.076785, -0.7630048, 0, 0, 0, 1, 1,
-0.0100484, -0.8448714, -5.161085, 0, 0, 0, 1, 1,
-0.005185517, 2.124505, -0.7901675, 0, 0, 0, 1, 1,
-0.004256619, -0.5246845, -3.350549, 0, 0, 0, 1, 1,
-0.002578378, -1.619196, -4.884044, 1, 1, 1, 1, 1,
-0.002465733, 0.7075579, 0.7241993, 1, 1, 1, 1, 1,
-0.001505793, 0.5765283, -0.02752169, 1, 1, 1, 1, 1,
0.002359725, -2.467955, 2.263046, 1, 1, 1, 1, 1,
0.01031826, 0.7947006, -0.3802393, 1, 1, 1, 1, 1,
0.01397718, 0.7592739, 0.5811968, 1, 1, 1, 1, 1,
0.015706, -0.4086162, 2.377254, 1, 1, 1, 1, 1,
0.01740246, 1.415884, 1.198661, 1, 1, 1, 1, 1,
0.02318715, 1.128545, -0.4695677, 1, 1, 1, 1, 1,
0.02419092, -0.04147729, 1.508203, 1, 1, 1, 1, 1,
0.02929109, -1.471284, 4.318557, 1, 1, 1, 1, 1,
0.03440099, 1.697924, -2.039065, 1, 1, 1, 1, 1,
0.03468777, -0.3664886, 2.602337, 1, 1, 1, 1, 1,
0.03794289, 0.5441957, 1.132575, 1, 1, 1, 1, 1,
0.04093734, 1.50589, -0.3777249, 1, 1, 1, 1, 1,
0.04226853, 0.5070921, 2.663069, 0, 0, 1, 1, 1,
0.04288141, -1.651363, 3.444765, 1, 0, 0, 1, 1,
0.04311018, 1.418881, 0.08365654, 1, 0, 0, 1, 1,
0.04698713, 0.719806, -0.002719766, 1, 0, 0, 1, 1,
0.04744699, 0.7682213, -1.264549, 1, 0, 0, 1, 1,
0.05236364, 1.762528, -1.127318, 1, 0, 0, 1, 1,
0.05647924, -0.8699349, 3.491385, 0, 0, 0, 1, 1,
0.05659011, 0.05261571, -1.225032, 0, 0, 0, 1, 1,
0.05864475, 2.117177, -0.2360764, 0, 0, 0, 1, 1,
0.06019477, -1.48536, 3.043085, 0, 0, 0, 1, 1,
0.06172446, 0.2257749, 0.3034596, 0, 0, 0, 1, 1,
0.06219245, -1.165723, -0.02129575, 0, 0, 0, 1, 1,
0.06848243, 1.441414, 0.9307559, 0, 0, 0, 1, 1,
0.07073388, 0.03863452, 1.700555, 1, 1, 1, 1, 1,
0.07387592, -0.8412053, 2.599207, 1, 1, 1, 1, 1,
0.07994041, 0.4844648, 0.723417, 1, 1, 1, 1, 1,
0.08283967, -2.445177, 4.282026, 1, 1, 1, 1, 1,
0.08303922, 2.166079, 2.055967, 1, 1, 1, 1, 1,
0.08462214, 0.02896709, 2.246669, 1, 1, 1, 1, 1,
0.08626432, -1.415923, 1.838812, 1, 1, 1, 1, 1,
0.08846941, -0.9664675, 3.656345, 1, 1, 1, 1, 1,
0.089097, 0.004565006, 1.205019, 1, 1, 1, 1, 1,
0.08922967, 0.485696, 0.4071091, 1, 1, 1, 1, 1,
0.09219257, -0.06734487, 1.300543, 1, 1, 1, 1, 1,
0.09384295, 0.321866, -0.623376, 1, 1, 1, 1, 1,
0.09535825, -1.517072, 2.413996, 1, 1, 1, 1, 1,
0.09904519, 0.7718248, 0.7424286, 1, 1, 1, 1, 1,
0.1049625, -1.201143, 3.664617, 1, 1, 1, 1, 1,
0.1059614, 0.4601642, 0.5124936, 0, 0, 1, 1, 1,
0.1157076, 1.472276, 0.2819935, 1, 0, 0, 1, 1,
0.1224527, -0.1176968, 2.743292, 1, 0, 0, 1, 1,
0.1230769, -1.196816, 3.294403, 1, 0, 0, 1, 1,
0.1260532, -1.068484, 3.808759, 1, 0, 0, 1, 1,
0.1271611, 2.144332, 1.337714, 1, 0, 0, 1, 1,
0.1272797, 0.1201279, 0.5231313, 0, 0, 0, 1, 1,
0.1335671, 2.459996, 0.3609795, 0, 0, 0, 1, 1,
0.1357645, 1.408893, -0.3220477, 0, 0, 0, 1, 1,
0.1368805, -1.219534, 2.391249, 0, 0, 0, 1, 1,
0.1398428, -1.476708, 3.242377, 0, 0, 0, 1, 1,
0.140661, -0.3349249, 3.441651, 0, 0, 0, 1, 1,
0.1462725, -0.5337993, 3.387176, 0, 0, 0, 1, 1,
0.1559193, 1.504504, -0.5961455, 1, 1, 1, 1, 1,
0.1584582, 0.272772, -0.2160165, 1, 1, 1, 1, 1,
0.1593045, -0.1503835, 4.223994, 1, 1, 1, 1, 1,
0.1599257, -0.1778921, 3.860831, 1, 1, 1, 1, 1,
0.1606547, -0.2101312, 3.409999, 1, 1, 1, 1, 1,
0.1614554, -0.1163725, 2.220325, 1, 1, 1, 1, 1,
0.1654939, 1.590637, 0.5296586, 1, 1, 1, 1, 1,
0.1655364, 1.290928, 0.1991412, 1, 1, 1, 1, 1,
0.1676032, 2.456378, -1.365427, 1, 1, 1, 1, 1,
0.173176, -0.620451, 3.960416, 1, 1, 1, 1, 1,
0.1739115, 0.8134254, 1.026621, 1, 1, 1, 1, 1,
0.1791694, 0.6216148, 0.04097564, 1, 1, 1, 1, 1,
0.1802753, -1.503293, 2.165926, 1, 1, 1, 1, 1,
0.1810146, -0.1383976, 1.081008, 1, 1, 1, 1, 1,
0.1813723, 1.158247, -0.6097439, 1, 1, 1, 1, 1,
0.1836632, -0.3924587, 2.576104, 0, 0, 1, 1, 1,
0.1842421, -0.1584149, 1.016337, 1, 0, 0, 1, 1,
0.1876263, -1.953341, 3.873113, 1, 0, 0, 1, 1,
0.198057, -0.1166309, 1.628248, 1, 0, 0, 1, 1,
0.1986208, 0.4850402, 0.2733138, 1, 0, 0, 1, 1,
0.1987983, -1.754666, 3.05163, 1, 0, 0, 1, 1,
0.2006578, 0.08488405, 0.9623941, 0, 0, 0, 1, 1,
0.2015486, 0.05952505, 0.6189467, 0, 0, 0, 1, 1,
0.2021739, 1.345019, 2.980596, 0, 0, 0, 1, 1,
0.2028486, 0.7049152, 2.105839, 0, 0, 0, 1, 1,
0.2042598, 0.3952326, 0.1619291, 0, 0, 0, 1, 1,
0.2072888, -0.2021437, 1.792549, 0, 0, 0, 1, 1,
0.2089435, -0.9018955, 0.3169755, 0, 0, 0, 1, 1,
0.2104019, -1.975418, 3.329054, 1, 1, 1, 1, 1,
0.2112134, 1.432651, -0.8052917, 1, 1, 1, 1, 1,
0.2150153, -0.2179669, 3.970665, 1, 1, 1, 1, 1,
0.2196142, -0.1992781, 2.454572, 1, 1, 1, 1, 1,
0.2242932, -0.4918355, 3.244805, 1, 1, 1, 1, 1,
0.2278527, -0.6172473, 4.397053, 1, 1, 1, 1, 1,
0.2284535, -0.3136777, 2.837118, 1, 1, 1, 1, 1,
0.2291785, 0.5835979, -0.7762191, 1, 1, 1, 1, 1,
0.229827, 1.218201, -0.2137503, 1, 1, 1, 1, 1,
0.2345555, 0.240077, -1.34032, 1, 1, 1, 1, 1,
0.2453036, -1.781312, 4.247584, 1, 1, 1, 1, 1,
0.245498, 0.5553634, -0.5545919, 1, 1, 1, 1, 1,
0.2455792, 0.5340773, 1.075076, 1, 1, 1, 1, 1,
0.2461842, -2.396818, 4.758741, 1, 1, 1, 1, 1,
0.2501263, -1.801452, 3.721076, 1, 1, 1, 1, 1,
0.2509995, -0.321134, 2.421484, 0, 0, 1, 1, 1,
0.2526011, -0.4453604, 4.496323, 1, 0, 0, 1, 1,
0.2564339, -0.4778752, 1.712969, 1, 0, 0, 1, 1,
0.2584805, -0.5090041, 3.672011, 1, 0, 0, 1, 1,
0.2617351, 0.1603602, 0.2629232, 1, 0, 0, 1, 1,
0.2620696, -0.7388006, 2.122956, 1, 0, 0, 1, 1,
0.2630672, -0.5697153, 2.221102, 0, 0, 0, 1, 1,
0.2692303, 0.6388065, 0.1590552, 0, 0, 0, 1, 1,
0.27068, -0.6355503, 3.853727, 0, 0, 0, 1, 1,
0.272579, 1.430692, 2.399437, 0, 0, 0, 1, 1,
0.2752523, 0.4362811, 0.831176, 0, 0, 0, 1, 1,
0.2768486, 1.122194, -0.6579841, 0, 0, 0, 1, 1,
0.2771928, -0.758293, 2.6774, 0, 0, 0, 1, 1,
0.2786859, 0.315767, 1.384865, 1, 1, 1, 1, 1,
0.2794281, -2.011046, 2.079092, 1, 1, 1, 1, 1,
0.2800909, -1.401347, 2.210196, 1, 1, 1, 1, 1,
0.2823235, -1.32184, 2.722471, 1, 1, 1, 1, 1,
0.2961369, -0.4743102, 2.629623, 1, 1, 1, 1, 1,
0.2965661, 0.1714191, 3.032609, 1, 1, 1, 1, 1,
0.2982087, -0.3815596, 4.45994, 1, 1, 1, 1, 1,
0.2990055, 1.443464, -0.7090354, 1, 1, 1, 1, 1,
0.299673, 1.236566, -0.4911807, 1, 1, 1, 1, 1,
0.302187, -0.6817693, 3.887831, 1, 1, 1, 1, 1,
0.3072983, -0.3605377, 3.248721, 1, 1, 1, 1, 1,
0.3083167, 0.7458817, 2.210487, 1, 1, 1, 1, 1,
0.3119895, -0.955638, 3.288329, 1, 1, 1, 1, 1,
0.3136226, -0.7114131, 2.862917, 1, 1, 1, 1, 1,
0.3150904, 0.7611262, 0.8797455, 1, 1, 1, 1, 1,
0.3170233, 0.966312, 2.270191, 0, 0, 1, 1, 1,
0.3190211, -0.413713, 3.211651, 1, 0, 0, 1, 1,
0.3237563, 0.08345035, -0.3350072, 1, 0, 0, 1, 1,
0.3248376, -0.2715766, 0.8720562, 1, 0, 0, 1, 1,
0.3275042, 0.9230751, 0.4748039, 1, 0, 0, 1, 1,
0.3283601, 1.583803, 2.303803, 1, 0, 0, 1, 1,
0.3330195, -0.01036891, 2.991881, 0, 0, 0, 1, 1,
0.3399228, -0.6915894, 0.8544926, 0, 0, 0, 1, 1,
0.3418128, 2.223394, 1.335883, 0, 0, 0, 1, 1,
0.3423735, 1.325466, -0.5605326, 0, 0, 0, 1, 1,
0.3469483, -0.7628847, 2.307109, 0, 0, 0, 1, 1,
0.347846, 1.708132, -0.144536, 0, 0, 0, 1, 1,
0.3488878, -0.5321552, 3.07569, 0, 0, 0, 1, 1,
0.3492821, 0.6447402, 1.40369, 1, 1, 1, 1, 1,
0.3500626, 1.047084, 2.309058, 1, 1, 1, 1, 1,
0.3526305, -1.39123, 4.058877, 1, 1, 1, 1, 1,
0.3547003, 0.5477312, 2.551751, 1, 1, 1, 1, 1,
0.3586136, 0.04711665, 2.070034, 1, 1, 1, 1, 1,
0.3615151, -0.1099332, 2.456454, 1, 1, 1, 1, 1,
0.3634147, 0.7369609, 0.673277, 1, 1, 1, 1, 1,
0.3637307, 2.227024, 1.136134, 1, 1, 1, 1, 1,
0.3649323, -1.061992, 2.973965, 1, 1, 1, 1, 1,
0.3663351, -1.404351, 3.644928, 1, 1, 1, 1, 1,
0.3663788, 1.133421, 0.09062429, 1, 1, 1, 1, 1,
0.371998, -1.168381, 2.329939, 1, 1, 1, 1, 1,
0.3732942, 0.02591259, 3.219353, 1, 1, 1, 1, 1,
0.3736661, 0.8579008, 0.6259057, 1, 1, 1, 1, 1,
0.376423, 0.8225446, 1.728742, 1, 1, 1, 1, 1,
0.3774325, -0.3687792, 2.12381, 0, 0, 1, 1, 1,
0.3852595, -0.331741, 2.286911, 1, 0, 0, 1, 1,
0.3857331, 0.764156, 1.330247, 1, 0, 0, 1, 1,
0.3872967, 1.623259, -0.2054837, 1, 0, 0, 1, 1,
0.3873253, -1.166294, 4.192482, 1, 0, 0, 1, 1,
0.3891742, 0.2913193, 1.678548, 1, 0, 0, 1, 1,
0.3897114, -0.2389396, 3.781943, 0, 0, 0, 1, 1,
0.3935044, 0.4465232, 1.002457, 0, 0, 0, 1, 1,
0.3964688, -1.213003, 1.898536, 0, 0, 0, 1, 1,
0.401701, 0.6638986, 0.6389533, 0, 0, 0, 1, 1,
0.403432, -0.08370566, 2.502671, 0, 0, 0, 1, 1,
0.4043459, -1.660437, 2.560463, 0, 0, 0, 1, 1,
0.4147659, 0.4570853, 0.6383447, 0, 0, 0, 1, 1,
0.4257011, -0.2983312, 2.014806, 1, 1, 1, 1, 1,
0.4408333, 0.5095568, 2.402789, 1, 1, 1, 1, 1,
0.4438459, 0.3967539, 2.684439, 1, 1, 1, 1, 1,
0.4445773, -2.107929, 2.720484, 1, 1, 1, 1, 1,
0.4460496, 1.147293, 1.124245, 1, 1, 1, 1, 1,
0.4463871, 0.332695, 2.024744, 1, 1, 1, 1, 1,
0.4565353, 0.2467841, 1.158497, 1, 1, 1, 1, 1,
0.4610178, -0.1483659, 1.576692, 1, 1, 1, 1, 1,
0.4624459, 0.6751493, -0.6869921, 1, 1, 1, 1, 1,
0.4655228, 0.701363, 0.3870639, 1, 1, 1, 1, 1,
0.4662533, 0.169147, 0.9254731, 1, 1, 1, 1, 1,
0.4694238, 1.920351, 0.6332513, 1, 1, 1, 1, 1,
0.46962, 1.576606, 1.545217, 1, 1, 1, 1, 1,
0.4704103, -0.2399972, 0.9884285, 1, 1, 1, 1, 1,
0.47401, 2.23514, -0.5293499, 1, 1, 1, 1, 1,
0.4753541, -0.2196405, 1.353163, 0, 0, 1, 1, 1,
0.4773538, -0.2781003, 0.9269633, 1, 0, 0, 1, 1,
0.4777907, 0.04799536, 0.9757919, 1, 0, 0, 1, 1,
0.4847353, -1.333019, 3.651402, 1, 0, 0, 1, 1,
0.4883807, 0.5366052, 1.325517, 1, 0, 0, 1, 1,
0.4980083, -0.1482413, 0.939483, 1, 0, 0, 1, 1,
0.4988689, -0.7298222, 2.022883, 0, 0, 0, 1, 1,
0.5041864, -0.7980198, 3.557144, 0, 0, 0, 1, 1,
0.5042796, 1.255322, -0.5916673, 0, 0, 0, 1, 1,
0.514385, -1.059545, 3.568574, 0, 0, 0, 1, 1,
0.5145628, -0.2058101, 1.407808, 0, 0, 0, 1, 1,
0.5154601, -1.456301, 3.487349, 0, 0, 0, 1, 1,
0.5158384, 0.297444, 1.2565, 0, 0, 0, 1, 1,
0.5220648, -0.2866418, 2.125124, 1, 1, 1, 1, 1,
0.5252073, 1.355965, -0.1940381, 1, 1, 1, 1, 1,
0.5333576, -0.6120007, 4.170257, 1, 1, 1, 1, 1,
0.533663, -0.2474492, 2.63302, 1, 1, 1, 1, 1,
0.5347921, 1.206275, -0.7613568, 1, 1, 1, 1, 1,
0.5397687, -0.07533459, 0.7740691, 1, 1, 1, 1, 1,
0.5449088, 0.5335299, -0.9485487, 1, 1, 1, 1, 1,
0.5474693, 0.3926567, 1.83694, 1, 1, 1, 1, 1,
0.549684, 0.8385658, 0.7040909, 1, 1, 1, 1, 1,
0.5498461, -0.1066622, 2.265186, 1, 1, 1, 1, 1,
0.5510148, -2.312725, 2.435934, 1, 1, 1, 1, 1,
0.5532213, -0.6287963, 0.6271815, 1, 1, 1, 1, 1,
0.5561925, -1.741314, 1.383953, 1, 1, 1, 1, 1,
0.5565585, -0.7900664, 4.063858, 1, 1, 1, 1, 1,
0.5635247, -0.4961987, 1.57863, 1, 1, 1, 1, 1,
0.5668373, -0.8351447, 3.742955, 0, 0, 1, 1, 1,
0.5712153, 0.2864327, 1.909612, 1, 0, 0, 1, 1,
0.571614, -0.8897217, 2.606878, 1, 0, 0, 1, 1,
0.5748367, 1.152923, -1.069957, 1, 0, 0, 1, 1,
0.5773712, 0.3115282, 1.287219, 1, 0, 0, 1, 1,
0.5820028, -2.243606, 4.583984, 1, 0, 0, 1, 1,
0.5878263, -0.4429903, 2.059412, 0, 0, 0, 1, 1,
0.5887099, -1.006589, 5.086776, 0, 0, 0, 1, 1,
0.5958769, -1.31574, 4.016082, 0, 0, 0, 1, 1,
0.5975788, -1.609641, 2.190379, 0, 0, 0, 1, 1,
0.5997396, -1.02839, 1.324735, 0, 0, 0, 1, 1,
0.6005315, -0.7213638, 1.77736, 0, 0, 0, 1, 1,
0.6008635, -0.8779151, 3.398738, 0, 0, 0, 1, 1,
0.6016266, -1.640409, 4.462524, 1, 1, 1, 1, 1,
0.6019473, 1.63563, -0.484082, 1, 1, 1, 1, 1,
0.6033344, 0.9319428, 1.094509, 1, 1, 1, 1, 1,
0.6040722, -0.5566314, 2.962105, 1, 1, 1, 1, 1,
0.60758, 0.05490414, 2.258592, 1, 1, 1, 1, 1,
0.6101152, -0.9222887, 2.222147, 1, 1, 1, 1, 1,
0.6128011, -0.3278883, 1.340357, 1, 1, 1, 1, 1,
0.6133335, 0.4047469, 1.617098, 1, 1, 1, 1, 1,
0.6151491, -0.8177196, 1.081287, 1, 1, 1, 1, 1,
0.6230636, -1.587986, 4.557539, 1, 1, 1, 1, 1,
0.6254858, -0.547123, 2.479528, 1, 1, 1, 1, 1,
0.6255625, -0.4990839, 2.471669, 1, 1, 1, 1, 1,
0.6263564, 0.8403174, -0.3729563, 1, 1, 1, 1, 1,
0.6291484, 1.948369, -1.171454, 1, 1, 1, 1, 1,
0.632639, 1.421153, -0.4670447, 1, 1, 1, 1, 1,
0.6387445, -0.5357251, 1.320553, 0, 0, 1, 1, 1,
0.6426101, 1.413831, 2.104587, 1, 0, 0, 1, 1,
0.6478053, -0.7932393, 2.587133, 1, 0, 0, 1, 1,
0.6504252, 0.5041979, 0.9676195, 1, 0, 0, 1, 1,
0.6592742, -1.763323, 4.774533, 1, 0, 0, 1, 1,
0.6604749, -0.5572399, 3.019164, 1, 0, 0, 1, 1,
0.660507, -1.296215, 0.8716452, 0, 0, 0, 1, 1,
0.6692582, -0.2758617, 3.149113, 0, 0, 0, 1, 1,
0.6763276, -0.2573188, 1.860588, 0, 0, 0, 1, 1,
0.6785416, -0.7261819, 2.607527, 0, 0, 0, 1, 1,
0.6848475, -0.02013505, -0.332935, 0, 0, 0, 1, 1,
0.6850856, -0.5020853, 1.704719, 0, 0, 0, 1, 1,
0.6899846, -0.158506, 3.095236, 0, 0, 0, 1, 1,
0.6958262, -0.1169305, 2.816139, 1, 1, 1, 1, 1,
0.6969116, 0.8643887, 0.5743839, 1, 1, 1, 1, 1,
0.699346, 1.089361, 1.431384, 1, 1, 1, 1, 1,
0.7024132, 0.8155794, -0.6741125, 1, 1, 1, 1, 1,
0.7060118, -1.376949, 2.558782, 1, 1, 1, 1, 1,
0.7086933, -1.095271, 0.1578052, 1, 1, 1, 1, 1,
0.7088477, 1.927455, 1.092024, 1, 1, 1, 1, 1,
0.709344, -0.1148888, 0.9666633, 1, 1, 1, 1, 1,
0.722109, 0.5839081, 0.694719, 1, 1, 1, 1, 1,
0.7259421, -0.9657907, 2.498692, 1, 1, 1, 1, 1,
0.7261924, 1.22886, 0.4280665, 1, 1, 1, 1, 1,
0.7274494, -0.2370744, 1.422056, 1, 1, 1, 1, 1,
0.7295753, 0.5065959, 0.1322057, 1, 1, 1, 1, 1,
0.7299133, -0.1692951, 1.625428, 1, 1, 1, 1, 1,
0.7309611, 1.745925, 0.706353, 1, 1, 1, 1, 1,
0.7352649, -0.9565055, 1.371239, 0, 0, 1, 1, 1,
0.7395223, -0.4530273, 2.485169, 1, 0, 0, 1, 1,
0.7402323, -1.707953, 2.612259, 1, 0, 0, 1, 1,
0.7464, -1.109584, 3.414692, 1, 0, 0, 1, 1,
0.7478499, -0.34247, 1.445801, 1, 0, 0, 1, 1,
0.7517477, -0.8586695, 2.607881, 1, 0, 0, 1, 1,
0.7518486, -0.8197632, 1.212377, 0, 0, 0, 1, 1,
0.7566534, 0.3830458, 0.1556086, 0, 0, 0, 1, 1,
0.7625466, -0.1848263, 1.897565, 0, 0, 0, 1, 1,
0.7651587, 0.03058409, 1.368638, 0, 0, 0, 1, 1,
0.7669408, 0.1884904, 2.713125, 0, 0, 0, 1, 1,
0.7728288, -1.282706, 5.106175, 0, 0, 0, 1, 1,
0.7734905, -0.00952253, 2.753784, 0, 0, 0, 1, 1,
0.7779763, -0.5405803, 2.289953, 1, 1, 1, 1, 1,
0.7779975, -1.373713, 2.895422, 1, 1, 1, 1, 1,
0.778002, 1.02588, 0.4018754, 1, 1, 1, 1, 1,
0.7806083, -0.004224248, 2.582404, 1, 1, 1, 1, 1,
0.7864639, 0.1988375, -0.3299236, 1, 1, 1, 1, 1,
0.7908263, 1.186354, 0.7088344, 1, 1, 1, 1, 1,
0.7922326, 1.296916, 3.538122, 1, 1, 1, 1, 1,
0.7928528, -0.787912, 3.556157, 1, 1, 1, 1, 1,
0.7950264, 1.291714, 0.882248, 1, 1, 1, 1, 1,
0.7987409, 1.848496, -1.54024, 1, 1, 1, 1, 1,
0.803403, 2.164966, -0.1811083, 1, 1, 1, 1, 1,
0.8044506, 1.409749, 2.516231, 1, 1, 1, 1, 1,
0.8074262, -0.5704823, 3.455402, 1, 1, 1, 1, 1,
0.8089224, -0.06481036, 2.279587, 1, 1, 1, 1, 1,
0.8097777, 0.01458041, 1.322255, 1, 1, 1, 1, 1,
0.8108067, 1.935951, 2.223302, 0, 0, 1, 1, 1,
0.8122953, -0.5248649, 0.09616886, 1, 0, 0, 1, 1,
0.812471, 0.6237805, -0.6326753, 1, 0, 0, 1, 1,
0.8140122, 0.1702875, 1.777846, 1, 0, 0, 1, 1,
0.8146467, -0.1698035, 2.602134, 1, 0, 0, 1, 1,
0.8149477, 1.354845, 2.685122, 1, 0, 0, 1, 1,
0.8156701, 0.6442923, 0.3462698, 0, 0, 0, 1, 1,
0.8235518, 0.4328843, 0.7023977, 0, 0, 0, 1, 1,
0.8249997, 0.3087487, 1.887501, 0, 0, 0, 1, 1,
0.8307796, 0.7140893, 1.521026, 0, 0, 0, 1, 1,
0.8326713, 0.7132636, 1.273463, 0, 0, 0, 1, 1,
0.8339667, -1.834358, 1.899052, 0, 0, 0, 1, 1,
0.833995, -0.9185647, 2.257463, 0, 0, 0, 1, 1,
0.8353978, 0.09213623, 0.7478431, 1, 1, 1, 1, 1,
0.8360857, 0.2365951, 1.162197, 1, 1, 1, 1, 1,
0.8421407, -1.701306, 2.690136, 1, 1, 1, 1, 1,
0.8424733, 0.1432906, 1.564344, 1, 1, 1, 1, 1,
0.8519935, 0.6455886, 1.03891, 1, 1, 1, 1, 1,
0.8558188, -0.08759252, 2.533566, 1, 1, 1, 1, 1,
0.8620653, 0.4045524, 1.131127, 1, 1, 1, 1, 1,
0.8649734, -1.067489, 1.942764, 1, 1, 1, 1, 1,
0.8683124, -0.8377243, 2.945423, 1, 1, 1, 1, 1,
0.8693947, 1.627996, -0.8746178, 1, 1, 1, 1, 1,
0.8764036, -0.3422495, 1.642772, 1, 1, 1, 1, 1,
0.8862889, -0.4500704, 0.7819533, 1, 1, 1, 1, 1,
0.8899298, 0.2998613, 0.9768447, 1, 1, 1, 1, 1,
0.8900769, 0.7519786, 0.2020199, 1, 1, 1, 1, 1,
0.9005686, -0.1053958, 1.297682, 1, 1, 1, 1, 1,
0.9079311, -0.3858965, 1.844179, 0, 0, 1, 1, 1,
0.910594, -0.2668202, 0.9950089, 1, 0, 0, 1, 1,
0.9115873, -0.6645836, 0.9035892, 1, 0, 0, 1, 1,
0.9136439, -0.3545706, 1.048869, 1, 0, 0, 1, 1,
0.9193684, -0.5017726, 4.091731, 1, 0, 0, 1, 1,
0.9202719, 0.3047289, 1.077634, 1, 0, 0, 1, 1,
0.9267566, -1.342983, 3.241251, 0, 0, 0, 1, 1,
0.9335938, 0.1153577, 1.483213, 0, 0, 0, 1, 1,
0.947051, -2.434148, 3.430296, 0, 0, 0, 1, 1,
0.9478189, 1.208594, -0.3984433, 0, 0, 0, 1, 1,
0.948597, 0.1392904, 1.424057, 0, 0, 0, 1, 1,
0.950946, -1.084859, 2.804295, 0, 0, 0, 1, 1,
0.9519587, -0.6739424, 2.490062, 0, 0, 0, 1, 1,
0.9521285, 0.9034586, 1.118039, 1, 1, 1, 1, 1,
0.9531857, -0.5105169, 1.499319, 1, 1, 1, 1, 1,
0.9564157, -0.07853056, 1.484094, 1, 1, 1, 1, 1,
0.9569882, -1.412441, 1.710816, 1, 1, 1, 1, 1,
0.9575245, -0.1459768, 1.390406, 1, 1, 1, 1, 1,
0.9578999, 1.264245, 0.005194912, 1, 1, 1, 1, 1,
0.9613274, 0.3732914, 0.3238083, 1, 1, 1, 1, 1,
0.96272, -1.104711, 2.583096, 1, 1, 1, 1, 1,
0.9661031, 1.232552, 0.938839, 1, 1, 1, 1, 1,
0.9714934, 0.3957529, 2.117345, 1, 1, 1, 1, 1,
0.979397, 0.7931316, -1.070463, 1, 1, 1, 1, 1,
0.9918322, 0.3297141, 0.2210451, 1, 1, 1, 1, 1,
0.9921139, 0.03471052, 2.865983, 1, 1, 1, 1, 1,
0.9971124, -0.3773914, 1.635379, 1, 1, 1, 1, 1,
0.9975917, 0.1748596, 2.255548, 1, 1, 1, 1, 1,
0.9996569, 0.9206163, 0.1617717, 0, 0, 1, 1, 1,
1.000226, -0.3052838, 1.598068, 1, 0, 0, 1, 1,
1.004984, -1.714807, 0.6871305, 1, 0, 0, 1, 1,
1.00735, 0.757158, 0.4641245, 1, 0, 0, 1, 1,
1.009118, -1.643426, 2.410134, 1, 0, 0, 1, 1,
1.016474, -0.6310512, 2.307799, 1, 0, 0, 1, 1,
1.018468, -1.725848, 2.707892, 0, 0, 0, 1, 1,
1.019137, -0.5172989, 1.842302, 0, 0, 0, 1, 1,
1.021193, -0.992421, 0.2859265, 0, 0, 0, 1, 1,
1.021968, 0.5278885, 1.052387, 0, 0, 0, 1, 1,
1.026908, 1.312486, -0.1752186, 0, 0, 0, 1, 1,
1.027137, 0.4940092, 2.193683, 0, 0, 0, 1, 1,
1.027648, 2.058402, -0.134933, 0, 0, 0, 1, 1,
1.027821, 1.992117, 1.306443, 1, 1, 1, 1, 1,
1.029969, 0.7671273, -0.3915103, 1, 1, 1, 1, 1,
1.03554, 0.5029838, 0.7993756, 1, 1, 1, 1, 1,
1.037991, 0.7047223, 0.7882719, 1, 1, 1, 1, 1,
1.048253, 1.247102, 1.008073, 1, 1, 1, 1, 1,
1.048481, 0.2154003, 0.004581338, 1, 1, 1, 1, 1,
1.051111, 1.05897, -0.3795151, 1, 1, 1, 1, 1,
1.052975, 0.639945, 2.506254, 1, 1, 1, 1, 1,
1.068216, -0.1049601, 0.2657754, 1, 1, 1, 1, 1,
1.070793, -0.8492751, 1.715096, 1, 1, 1, 1, 1,
1.082976, -0.9737515, 3.206647, 1, 1, 1, 1, 1,
1.08648, -0.1234153, 0.9386355, 1, 1, 1, 1, 1,
1.09668, -0.4881707, 1.593243, 1, 1, 1, 1, 1,
1.103465, 0.07717484, 1.359114, 1, 1, 1, 1, 1,
1.106635, 1.574981, -0.2837746, 1, 1, 1, 1, 1,
1.123596, -0.2221326, 1.318929, 0, 0, 1, 1, 1,
1.124563, -1.221238, 3.036975, 1, 0, 0, 1, 1,
1.135892, -1.695003, 2.773477, 1, 0, 0, 1, 1,
1.139018, 1.086643, -0.4084628, 1, 0, 0, 1, 1,
1.14123, 0.6791705, 3.270086, 1, 0, 0, 1, 1,
1.14151, -0.6682189, 3.043799, 1, 0, 0, 1, 1,
1.157337, 1.324594, 2.299238, 0, 0, 0, 1, 1,
1.172143, 0.1213261, 4.474014, 0, 0, 0, 1, 1,
1.18025, 1.048902, 0.4710958, 0, 0, 0, 1, 1,
1.18395, 2.138274, 0.6016937, 0, 0, 0, 1, 1,
1.195233, -0.6757737, 2.691605, 0, 0, 0, 1, 1,
1.196969, -0.09522431, 2.473326, 0, 0, 0, 1, 1,
1.197895, -1.256281, 2.292213, 0, 0, 0, 1, 1,
1.19854, -1.020792, 4.046206, 1, 1, 1, 1, 1,
1.200872, -0.902878, 1.205354, 1, 1, 1, 1, 1,
1.203048, 2.14841, -0.8689278, 1, 1, 1, 1, 1,
1.207228, 0.7575868, -1.301921, 1, 1, 1, 1, 1,
1.216542, 0.09285415, 1.244959, 1, 1, 1, 1, 1,
1.230127, 0.4121093, 0.4934186, 1, 1, 1, 1, 1,
1.230954, 0.6423158, 1.879703, 1, 1, 1, 1, 1,
1.246502, 0.7643421, 0.7974998, 1, 1, 1, 1, 1,
1.251374, -0.4146734, 1.47626, 1, 1, 1, 1, 1,
1.258972, -1.827416, 0.2575144, 1, 1, 1, 1, 1,
1.260162, -0.3529325, 2.940066, 1, 1, 1, 1, 1,
1.262809, -0.7219832, 3.081879, 1, 1, 1, 1, 1,
1.263127, -0.7266693, 3.215743, 1, 1, 1, 1, 1,
1.264914, 0.7698467, 0.714547, 1, 1, 1, 1, 1,
1.264924, 1.379046, 0.185126, 1, 1, 1, 1, 1,
1.269889, 0.1021814, 1.470726, 0, 0, 1, 1, 1,
1.282008, -2.479864, 1.891462, 1, 0, 0, 1, 1,
1.283155, 1.058496, 1.949177, 1, 0, 0, 1, 1,
1.28743, 1.374086, 0.1229153, 1, 0, 0, 1, 1,
1.288997, -0.3918437, 1.969401, 1, 0, 0, 1, 1,
1.291021, -0.5284757, 3.305972, 1, 0, 0, 1, 1,
1.295839, -0.4003116, 1.622391, 0, 0, 0, 1, 1,
1.297416, -1.665817, 1.880223, 0, 0, 0, 1, 1,
1.298684, -0.987229, 2.821612, 0, 0, 0, 1, 1,
1.319755, 0.7261746, -0.210467, 0, 0, 0, 1, 1,
1.338884, -0.108674, 1.839408, 0, 0, 0, 1, 1,
1.340744, -0.8819814, 0.9578109, 0, 0, 0, 1, 1,
1.346839, 2.25034, -1.048206, 0, 0, 0, 1, 1,
1.351067, 1.027867, 0.8700709, 1, 1, 1, 1, 1,
1.354437, -0.299006, 2.094665, 1, 1, 1, 1, 1,
1.363422, 0.9890542, 0.02859888, 1, 1, 1, 1, 1,
1.37357, -0.09292351, 2.125255, 1, 1, 1, 1, 1,
1.37516, -1.018926, 1.430919, 1, 1, 1, 1, 1,
1.375452, -0.05456543, 2.459664, 1, 1, 1, 1, 1,
1.386965, -0.0654723, 0.3309661, 1, 1, 1, 1, 1,
1.394494, 0.1456874, 1.826052, 1, 1, 1, 1, 1,
1.411539, 0.1918233, 2.486667, 1, 1, 1, 1, 1,
1.421101, 1.678615, 0.8837257, 1, 1, 1, 1, 1,
1.425556, -0.3109373, 2.335121, 1, 1, 1, 1, 1,
1.42564, 0.01447312, 1.078888, 1, 1, 1, 1, 1,
1.426594, -0.4728146, 1.937498, 1, 1, 1, 1, 1,
1.433961, 1.14441, 1.667653, 1, 1, 1, 1, 1,
1.437961, -1.549309, 1.213644, 1, 1, 1, 1, 1,
1.442229, -2.016324, 0.3284407, 0, 0, 1, 1, 1,
1.44295, -1.215574, 3.220896, 1, 0, 0, 1, 1,
1.448264, 0.6484661, 1.002472, 1, 0, 0, 1, 1,
1.448512, -1.380297, 3.118458, 1, 0, 0, 1, 1,
1.478048, 0.8034785, -0.38256, 1, 0, 0, 1, 1,
1.489073, 1.402588, 0.7618421, 1, 0, 0, 1, 1,
1.493631, -1.362182, 1.799715, 0, 0, 0, 1, 1,
1.498894, -0.1798469, 2.056376, 0, 0, 0, 1, 1,
1.499169, -1.422844, 1.601907, 0, 0, 0, 1, 1,
1.506321, -0.2637421, 2.388819, 0, 0, 0, 1, 1,
1.517808, -0.8824191, 0.8587552, 0, 0, 0, 1, 1,
1.521668, 0.9906438, 0.756365, 0, 0, 0, 1, 1,
1.529611, 2.891309, -0.4688772, 0, 0, 0, 1, 1,
1.53145, 0.2620959, -0.2688635, 1, 1, 1, 1, 1,
1.53546, 0.8853987, 2.558429, 1, 1, 1, 1, 1,
1.551174, 1.465255, 1.458259, 1, 1, 1, 1, 1,
1.585776, 0.0732213, 2.205848, 1, 1, 1, 1, 1,
1.594106, 1.183252, 1.756411, 1, 1, 1, 1, 1,
1.609511, -0.633441, 1.71764, 1, 1, 1, 1, 1,
1.625035, 0.345883, 2.896716, 1, 1, 1, 1, 1,
1.630608, 1.368597, 1.02464, 1, 1, 1, 1, 1,
1.642645, -0.7085999, 0.9441329, 1, 1, 1, 1, 1,
1.643939, -0.04652933, -0.4485616, 1, 1, 1, 1, 1,
1.655536, -0.04421265, 1.010664, 1, 1, 1, 1, 1,
1.663149, 0.2274846, 2.989314, 1, 1, 1, 1, 1,
1.676896, -1.006245, 0.7584313, 1, 1, 1, 1, 1,
1.686877, -0.5243656, 0.6425108, 1, 1, 1, 1, 1,
1.712724, -0.2056873, 2.030686, 1, 1, 1, 1, 1,
1.714017, 0.5914255, -0.9568517, 0, 0, 1, 1, 1,
1.719354, 0.1877932, 1.360679, 1, 0, 0, 1, 1,
1.72331, -0.0002784317, 1.261397, 1, 0, 0, 1, 1,
1.734256, -0.942994, 2.592507, 1, 0, 0, 1, 1,
1.735149, -0.3250729, 1.147056, 1, 0, 0, 1, 1,
1.753065, -1.191701, 1.698822, 1, 0, 0, 1, 1,
1.754197, 1.057301, 2.499518, 0, 0, 0, 1, 1,
1.758146, -0.3188572, 1.960964, 0, 0, 0, 1, 1,
1.765625, 0.5892822, 1.72704, 0, 0, 0, 1, 1,
1.774426, -0.01998748, 0.3829355, 0, 0, 0, 1, 1,
1.801483, -0.3143205, 1.00863, 0, 0, 0, 1, 1,
1.817057, 0.3007467, 1.413682, 0, 0, 0, 1, 1,
1.818149, -0.9820344, 4.187218, 0, 0, 0, 1, 1,
1.823886, -0.5216992, 2.676175, 1, 1, 1, 1, 1,
1.842858, -0.4305059, 0.1758479, 1, 1, 1, 1, 1,
1.855804, -0.1190247, 1.055487, 1, 1, 1, 1, 1,
1.857634, -0.7965077, 1.736001, 1, 1, 1, 1, 1,
1.861756, 0.7666093, -0.3511591, 1, 1, 1, 1, 1,
1.884064, 2.333137, 0.7089224, 1, 1, 1, 1, 1,
1.915051, 0.7854446, 0.4576079, 1, 1, 1, 1, 1,
1.931444, -0.7083833, 2.239949, 1, 1, 1, 1, 1,
1.94467, 0.3149127, 0.3374283, 1, 1, 1, 1, 1,
1.952445, 0.2210499, 0.8876864, 1, 1, 1, 1, 1,
1.952633, 0.3415214, 1.731497, 1, 1, 1, 1, 1,
1.960003, -1.099699, -0.5059404, 1, 1, 1, 1, 1,
1.960383, -0.45529, 2.2074, 1, 1, 1, 1, 1,
1.977853, 2.679518, 1.876407, 1, 1, 1, 1, 1,
2.019451, -0.4360146, 2.033193, 1, 1, 1, 1, 1,
2.034366, -0.05426535, 3.784494, 0, 0, 1, 1, 1,
2.045741, 1.625839, 1.621887, 1, 0, 0, 1, 1,
2.084685, -0.4400953, 1.142444, 1, 0, 0, 1, 1,
2.087971, 0.6074578, 0.6627306, 1, 0, 0, 1, 1,
2.095009, 0.6691123, 1.934577, 1, 0, 0, 1, 1,
2.095547, 2.017026, -0.9061773, 1, 0, 0, 1, 1,
2.117332, -0.4495217, 0.8801432, 0, 0, 0, 1, 1,
2.143888, -0.3351762, 1.608653, 0, 0, 0, 1, 1,
2.156228, 0.01594732, 1.260533, 0, 0, 0, 1, 1,
2.181836, -0.02208999, 0.3138072, 0, 0, 0, 1, 1,
2.235407, 0.8452105, 0.3572074, 0, 0, 0, 1, 1,
2.2791, 1.043954, 1.010579, 0, 0, 0, 1, 1,
2.327865, 0.4692204, 0.7568547, 0, 0, 0, 1, 1,
2.39708, -0.9040999, 2.263908, 1, 1, 1, 1, 1,
2.409543, -0.1866211, 3.860619, 1, 1, 1, 1, 1,
2.428967, -0.2685017, 0.3672679, 1, 1, 1, 1, 1,
2.621604, 0.8735851, 1.195875, 1, 1, 1, 1, 1,
3.012725, 1.734833, 2.199004, 1, 1, 1, 1, 1,
3.316722, -1.182434, 2.88288, 1, 1, 1, 1, 1,
3.598585, 0.4722511, -0.231479, 1, 1, 1, 1, 1
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
var radius = 9.528744;
var distance = 33.46931;
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
mvMatrix.translate( -0.01836514, -0.05630982, 0.1388752 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.46931);
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
