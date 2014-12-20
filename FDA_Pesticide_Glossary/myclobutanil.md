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
-3.049753, -2.483386, -3.084718, 1, 0, 0, 1,
-2.883275, 1.496573, -1.55553, 1, 0.007843138, 0, 1,
-2.831219, -0.6916456, -0.9592394, 1, 0.01176471, 0, 1,
-2.737255, -0.8553418, -2.682149, 1, 0.01960784, 0, 1,
-2.723131, 0.08256443, -3.114046, 1, 0.02352941, 0, 1,
-2.651701, -1.049765, -1.727443, 1, 0.03137255, 0, 1,
-2.527478, 0.5641001, 0.4736106, 1, 0.03529412, 0, 1,
-2.424057, -0.7990366, -1.562449, 1, 0.04313726, 0, 1,
-2.359699, -0.0912369, -1.924053, 1, 0.04705882, 0, 1,
-2.312262, -0.8511256, -0.769303, 1, 0.05490196, 0, 1,
-2.263991, -0.01289752, 0.02935397, 1, 0.05882353, 0, 1,
-2.228557, -1.873726, -3.545245, 1, 0.06666667, 0, 1,
-2.185376, 0.5559967, -0.5911009, 1, 0.07058824, 0, 1,
-2.176312, 0.6002001, -2.490183, 1, 0.07843138, 0, 1,
-2.175535, -0.004039784, 0.188897, 1, 0.08235294, 0, 1,
-2.156402, 0.1567909, -0.1446806, 1, 0.09019608, 0, 1,
-2.109212, 0.4200975, -1.820648, 1, 0.09411765, 0, 1,
-2.10165, -1.052838, -2.056959, 1, 0.1019608, 0, 1,
-2.086265, -0.007589579, -1.77751, 1, 0.1098039, 0, 1,
-2.066251, -1.361793, -1.246457, 1, 0.1137255, 0, 1,
-2.065907, 0.903613, -0.7155078, 1, 0.1215686, 0, 1,
-2.064597, -0.5131249, -2.178195, 1, 0.1254902, 0, 1,
-2.017921, 1.70774, -1.668171, 1, 0.1333333, 0, 1,
-2.005875, -0.8614364, -0.9090583, 1, 0.1372549, 0, 1,
-1.969691, -0.1355422, -1.400241, 1, 0.145098, 0, 1,
-1.956886, -0.6138657, -2.082788, 1, 0.1490196, 0, 1,
-1.933172, 0.5065351, -0.7248314, 1, 0.1568628, 0, 1,
-1.884397, 0.6327859, -1.534581, 1, 0.1607843, 0, 1,
-1.865088, 0.07271536, -2.870973, 1, 0.1686275, 0, 1,
-1.864456, 1.122785, -1.147674, 1, 0.172549, 0, 1,
-1.856914, 0.1915706, 0.5772609, 1, 0.1803922, 0, 1,
-1.84688, 0.5994481, -0.3630855, 1, 0.1843137, 0, 1,
-1.84535, -1.586824, -3.872546, 1, 0.1921569, 0, 1,
-1.841865, 0.5614733, -0.6004424, 1, 0.1960784, 0, 1,
-1.811084, -1.410497, -1.223181, 1, 0.2039216, 0, 1,
-1.808631, -0.8743233, -2.844107, 1, 0.2117647, 0, 1,
-1.803171, -0.3398451, -0.4859753, 1, 0.2156863, 0, 1,
-1.799414, 0.6260336, -0.8391746, 1, 0.2235294, 0, 1,
-1.797631, -1.43711, -1.111006, 1, 0.227451, 0, 1,
-1.791282, 0.185464, -2.061841, 1, 0.2352941, 0, 1,
-1.782296, -0.6210019, -2.388626, 1, 0.2392157, 0, 1,
-1.769895, 1.404126, -0.5985799, 1, 0.2470588, 0, 1,
-1.768131, -1.381837, -3.112484, 1, 0.2509804, 0, 1,
-1.767458, -0.7014493, -0.7838642, 1, 0.2588235, 0, 1,
-1.764818, 0.6066124, -2.679447, 1, 0.2627451, 0, 1,
-1.764229, -0.5288815, -1.188769, 1, 0.2705882, 0, 1,
-1.750499, -0.09855659, -0.1028089, 1, 0.2745098, 0, 1,
-1.744366, -0.3749514, -2.921983, 1, 0.282353, 0, 1,
-1.720158, -0.2932182, -0.3851801, 1, 0.2862745, 0, 1,
-1.665254, -1.076413, -3.219973, 1, 0.2941177, 0, 1,
-1.651244, 0.1339152, -1.766944, 1, 0.3019608, 0, 1,
-1.647104, 0.3115469, -2.703324, 1, 0.3058824, 0, 1,
-1.646569, -0.5897228, -2.163893, 1, 0.3137255, 0, 1,
-1.641914, -0.7134488, -2.694633, 1, 0.3176471, 0, 1,
-1.635959, 0.7838886, -1.007207, 1, 0.3254902, 0, 1,
-1.625607, 0.2565724, -2.571158, 1, 0.3294118, 0, 1,
-1.615568, 2.640212, -0.4792282, 1, 0.3372549, 0, 1,
-1.601696, -0.03021288, -1.677645, 1, 0.3411765, 0, 1,
-1.60157, -0.1794422, -2.216774, 1, 0.3490196, 0, 1,
-1.600989, -0.0878151, -1.14187, 1, 0.3529412, 0, 1,
-1.597665, 0.6813365, -1.19781, 1, 0.3607843, 0, 1,
-1.594695, 2.87998, -0.63145, 1, 0.3647059, 0, 1,
-1.584191, 0.3150787, -2.86071, 1, 0.372549, 0, 1,
-1.581396, 0.7962726, -0.8736596, 1, 0.3764706, 0, 1,
-1.569256, -0.3705518, -2.069145, 1, 0.3843137, 0, 1,
-1.561071, -0.5921159, -2.847792, 1, 0.3882353, 0, 1,
-1.55285, -0.3476288, -1.956392, 1, 0.3960784, 0, 1,
-1.544901, -0.6172771, -1.695103, 1, 0.4039216, 0, 1,
-1.540164, 0.9400785, -1.036228, 1, 0.4078431, 0, 1,
-1.529891, -1.214948, -1.730192, 1, 0.4156863, 0, 1,
-1.524418, 0.2462011, -2.128613, 1, 0.4196078, 0, 1,
-1.513319, -0.3154574, -4.754759, 1, 0.427451, 0, 1,
-1.505793, -0.2459676, -1.477124, 1, 0.4313726, 0, 1,
-1.498677, 0.07258755, -3.901601, 1, 0.4392157, 0, 1,
-1.490824, 0.6466658, -0.8979792, 1, 0.4431373, 0, 1,
-1.465259, 0.8107924, -0.3112996, 1, 0.4509804, 0, 1,
-1.463984, -1.123839, -1.786136, 1, 0.454902, 0, 1,
-1.4467, 0.1442186, -2.481161, 1, 0.4627451, 0, 1,
-1.441127, 1.132332, -1.676223, 1, 0.4666667, 0, 1,
-1.44112, 0.1678714, -1.453669, 1, 0.4745098, 0, 1,
-1.434942, -0.5244881, -0.905156, 1, 0.4784314, 0, 1,
-1.429061, -0.6750177, -2.922871, 1, 0.4862745, 0, 1,
-1.42525, -0.1285874, -2.62884, 1, 0.4901961, 0, 1,
-1.399562, 0.1575978, -3.010901, 1, 0.4980392, 0, 1,
-1.398693, 0.01610726, -2.270165, 1, 0.5058824, 0, 1,
-1.395938, 0.1445383, 0.1640441, 1, 0.509804, 0, 1,
-1.393951, 0.2946772, -1.58113, 1, 0.5176471, 0, 1,
-1.390277, 1.98427, -1.100833, 1, 0.5215687, 0, 1,
-1.376858, 1.599861, -1.691437, 1, 0.5294118, 0, 1,
-1.373823, -0.3649275, -0.6554144, 1, 0.5333334, 0, 1,
-1.363724, 1.786871, -1.574444, 1, 0.5411765, 0, 1,
-1.341295, 1.080043, 1.12671, 1, 0.5450981, 0, 1,
-1.328929, -2.00561, -2.448802, 1, 0.5529412, 0, 1,
-1.327089, -0.5947365, -2.885663, 1, 0.5568628, 0, 1,
-1.321644, 0.09818009, -0.6854182, 1, 0.5647059, 0, 1,
-1.319624, -1.100562, -1.858503, 1, 0.5686275, 0, 1,
-1.31953, -0.2853515, -2.240216, 1, 0.5764706, 0, 1,
-1.318148, -0.7705747, -0.5365583, 1, 0.5803922, 0, 1,
-1.314693, -0.9588712, -2.050503, 1, 0.5882353, 0, 1,
-1.312837, -1.962944, -2.645564, 1, 0.5921569, 0, 1,
-1.312476, 1.330851, -0.8795214, 1, 0.6, 0, 1,
-1.310109, 1.779437, -0.9839484, 1, 0.6078432, 0, 1,
-1.307141, 0.005292109, -2.984508, 1, 0.6117647, 0, 1,
-1.302008, 1.893677, 0.2480855, 1, 0.6196079, 0, 1,
-1.288215, -1.565862, -3.333802, 1, 0.6235294, 0, 1,
-1.282548, 0.6458605, -1.161569, 1, 0.6313726, 0, 1,
-1.270383, -0.9104997, -1.803519, 1, 0.6352941, 0, 1,
-1.270087, 0.6805355, -1.291798, 1, 0.6431373, 0, 1,
-1.264033, 0.2113948, -0.7266309, 1, 0.6470588, 0, 1,
-1.254946, -0.8540743, -2.044146, 1, 0.654902, 0, 1,
-1.25484, 0.1337454, -0.5890597, 1, 0.6588235, 0, 1,
-1.250798, 0.1253508, -1.256475, 1, 0.6666667, 0, 1,
-1.239522, 0.3638417, 0.5197238, 1, 0.6705883, 0, 1,
-1.237669, 2.701689, -0.2125528, 1, 0.6784314, 0, 1,
-1.233205, -0.4420716, -0.3756794, 1, 0.682353, 0, 1,
-1.226606, -0.141615, -3.735121, 1, 0.6901961, 0, 1,
-1.226037, -1.235795, -0.9724394, 1, 0.6941177, 0, 1,
-1.217417, -1.586534, -2.269747, 1, 0.7019608, 0, 1,
-1.208019, -1.77483, -3.487792, 1, 0.7098039, 0, 1,
-1.200976, -0.4653392, -2.296658, 1, 0.7137255, 0, 1,
-1.198723, 1.147053, -1.780594, 1, 0.7215686, 0, 1,
-1.19801, -1.772925, -0.9853564, 1, 0.7254902, 0, 1,
-1.197747, -0.4248852, 0.5254574, 1, 0.7333333, 0, 1,
-1.195256, 0.328751, -0.002104971, 1, 0.7372549, 0, 1,
-1.182396, -0.01045176, -0.7721695, 1, 0.7450981, 0, 1,
-1.168346, -0.2819282, -2.277972, 1, 0.7490196, 0, 1,
-1.157553, -2.14046, -0.9407656, 1, 0.7568628, 0, 1,
-1.155984, 1.351299, -0.9395208, 1, 0.7607843, 0, 1,
-1.152905, 1.932914, -1.09695, 1, 0.7686275, 0, 1,
-1.143468, -0.9950846, -1.555671, 1, 0.772549, 0, 1,
-1.139601, -0.7160067, -3.803808, 1, 0.7803922, 0, 1,
-1.133499, -0.632826, -2.905618, 1, 0.7843137, 0, 1,
-1.12751, -0.5083838, -1.758239, 1, 0.7921569, 0, 1,
-1.112561, 0.0272508, -1.896064, 1, 0.7960784, 0, 1,
-1.108333, -1.362599, -1.063808, 1, 0.8039216, 0, 1,
-1.092561, 1.399215, -0.8400036, 1, 0.8117647, 0, 1,
-1.091746, 0.02881782, -0.6970097, 1, 0.8156863, 0, 1,
-1.091505, 0.7649399, -0.967728, 1, 0.8235294, 0, 1,
-1.0902, 0.5930625, 0.1286358, 1, 0.827451, 0, 1,
-1.088583, -0.6262205, -2.413655, 1, 0.8352941, 0, 1,
-1.083609, -0.1257735, -1.230698, 1, 0.8392157, 0, 1,
-1.079986, 1.167096, -0.9934304, 1, 0.8470588, 0, 1,
-1.079091, -0.04249874, -1.803845, 1, 0.8509804, 0, 1,
-1.070663, 0.5758787, -1.583165, 1, 0.8588235, 0, 1,
-1.070173, -0.7317381, -2.573719, 1, 0.8627451, 0, 1,
-1.065868, -0.2374433, -1.909666, 1, 0.8705882, 0, 1,
-1.065326, 1.94589, 0.798025, 1, 0.8745098, 0, 1,
-1.061643, 0.5793092, -2.859398, 1, 0.8823529, 0, 1,
-1.060414, -0.5496217, -0.7579272, 1, 0.8862745, 0, 1,
-1.054372, -1.03375, -4.167576, 1, 0.8941177, 0, 1,
-1.048139, 0.8666008, -1.609692, 1, 0.8980392, 0, 1,
-1.038267, 0.4174721, -1.237313, 1, 0.9058824, 0, 1,
-1.034854, 0.009335849, -4.32376, 1, 0.9137255, 0, 1,
-1.028634, -0.8482904, -1.823979, 1, 0.9176471, 0, 1,
-1.0199, 0.0619708, -0.1051035, 1, 0.9254902, 0, 1,
-1.016432, 1.698324, -1.245923, 1, 0.9294118, 0, 1,
-1.01225, 1.664184, -1.554861, 1, 0.9372549, 0, 1,
-1.00748, -0.9259301, -3.423345, 1, 0.9411765, 0, 1,
-1.003257, -2.349093, -2.465692, 1, 0.9490196, 0, 1,
-0.9999818, 1.543062, 0.0165938, 1, 0.9529412, 0, 1,
-0.9957333, 1.507745, -1.033539, 1, 0.9607843, 0, 1,
-0.9918804, -1.313377, -1.962955, 1, 0.9647059, 0, 1,
-0.9885967, -1.248083, -2.85204, 1, 0.972549, 0, 1,
-0.9858063, 0.7190024, 0.2609664, 1, 0.9764706, 0, 1,
-0.9763593, -0.6503881, -5.604497, 1, 0.9843137, 0, 1,
-0.9681895, -2.446432, -3.544568, 1, 0.9882353, 0, 1,
-0.9546377, 0.3399805, -3.32306, 1, 0.9960784, 0, 1,
-0.9528998, -2.304964, -1.667907, 0.9960784, 1, 0, 1,
-0.9487236, -0.835495, -1.38003, 0.9921569, 1, 0, 1,
-0.9463224, -0.101711, -1.833984, 0.9843137, 1, 0, 1,
-0.9452292, 0.8543276, -0.5161217, 0.9803922, 1, 0, 1,
-0.9448032, -0.7190199, -2.983562, 0.972549, 1, 0, 1,
-0.9426664, 0.3064351, -1.67679, 0.9686275, 1, 0, 1,
-0.9353464, -0.3625433, -2.138801, 0.9607843, 1, 0, 1,
-0.9283222, 0.02995025, -1.389275, 0.9568627, 1, 0, 1,
-0.9236219, -0.9137466, -1.700279, 0.9490196, 1, 0, 1,
-0.9225219, -0.8198948, -2.716068, 0.945098, 1, 0, 1,
-0.9209688, -0.3991329, -2.027469, 0.9372549, 1, 0, 1,
-0.9093904, -1.32704, -0.8506546, 0.9333333, 1, 0, 1,
-0.9031395, 1.437992, 0.002525317, 0.9254902, 1, 0, 1,
-0.8940077, 1.907374, -0.4315659, 0.9215686, 1, 0, 1,
-0.8914382, 1.656808, -1.36138, 0.9137255, 1, 0, 1,
-0.8904481, -0.2458332, -1.554429, 0.9098039, 1, 0, 1,
-0.8870153, -2.093995, -4.104569, 0.9019608, 1, 0, 1,
-0.8771194, -0.4906134, -3.470646, 0.8941177, 1, 0, 1,
-0.8689498, -1.308639, -1.718145, 0.8901961, 1, 0, 1,
-0.8668134, 0.2014044, -2.948533, 0.8823529, 1, 0, 1,
-0.8630199, -1.360353, -1.903412, 0.8784314, 1, 0, 1,
-0.8618197, 0.5555031, -1.17885, 0.8705882, 1, 0, 1,
-0.8607265, 1.904245, 0.02104022, 0.8666667, 1, 0, 1,
-0.8550394, 1.630439, -1.233199, 0.8588235, 1, 0, 1,
-0.8473189, 0.1883929, -0.9117666, 0.854902, 1, 0, 1,
-0.8452892, 0.02218876, -1.888625, 0.8470588, 1, 0, 1,
-0.8424332, -1.004166, -1.058351, 0.8431373, 1, 0, 1,
-0.8386093, 0.08048772, -4.079751, 0.8352941, 1, 0, 1,
-0.834769, 0.6382895, -0.8877716, 0.8313726, 1, 0, 1,
-0.8318854, -0.2644912, -1.828686, 0.8235294, 1, 0, 1,
-0.8314005, -0.2976921, -3.673215, 0.8196079, 1, 0, 1,
-0.8311828, -0.4577065, -1.004222, 0.8117647, 1, 0, 1,
-0.8216496, -1.357647, -3.911801, 0.8078431, 1, 0, 1,
-0.8204015, 0.02371999, -0.4935163, 0.8, 1, 0, 1,
-0.8180595, -0.5024085, -1.721022, 0.7921569, 1, 0, 1,
-0.8139173, 0.1138592, -2.035014, 0.7882353, 1, 0, 1,
-0.8101872, -0.2001459, -2.134156, 0.7803922, 1, 0, 1,
-0.8070388, -0.04382078, -0.6528036, 0.7764706, 1, 0, 1,
-0.8000513, -1.042734, -2.710897, 0.7686275, 1, 0, 1,
-0.7975196, -2.71188, -4.918639, 0.7647059, 1, 0, 1,
-0.7888262, 0.2720349, -1.224241, 0.7568628, 1, 0, 1,
-0.7882295, 0.553579, 0.5899173, 0.7529412, 1, 0, 1,
-0.7854934, 0.4165383, -1.070239, 0.7450981, 1, 0, 1,
-0.7808967, 0.7133809, -2.229811, 0.7411765, 1, 0, 1,
-0.7740633, -1.535858, -4.384358, 0.7333333, 1, 0, 1,
-0.7729044, -1.270917, -2.629273, 0.7294118, 1, 0, 1,
-0.7710237, -1.298538, -2.342568, 0.7215686, 1, 0, 1,
-0.7700396, -0.5714335, -2.844169, 0.7176471, 1, 0, 1,
-0.7612203, -0.02097617, -0.9239857, 0.7098039, 1, 0, 1,
-0.7590518, -0.2196405, -1.547566, 0.7058824, 1, 0, 1,
-0.7582083, -0.03352777, -2.444245, 0.6980392, 1, 0, 1,
-0.7431741, -1.082708, -2.722541, 0.6901961, 1, 0, 1,
-0.7425818, 1.751894, 1.502141, 0.6862745, 1, 0, 1,
-0.742256, -0.2886221, -2.351797, 0.6784314, 1, 0, 1,
-0.7422128, -1.736089, -2.732332, 0.6745098, 1, 0, 1,
-0.7399513, 0.6912915, -1.445918, 0.6666667, 1, 0, 1,
-0.7396596, 1.956156, -1.935985, 0.6627451, 1, 0, 1,
-0.7371017, -0.4823005, -1.538835, 0.654902, 1, 0, 1,
-0.7348627, -1.950569, -1.659513, 0.6509804, 1, 0, 1,
-0.7335204, 0.7302457, -0.03735212, 0.6431373, 1, 0, 1,
-0.7313106, 0.6084589, -1.41071, 0.6392157, 1, 0, 1,
-0.7252403, -0.2313322, 0.7003058, 0.6313726, 1, 0, 1,
-0.7243594, -0.7904624, -1.933072, 0.627451, 1, 0, 1,
-0.7240007, -0.8707721, -1.539641, 0.6196079, 1, 0, 1,
-0.7231084, 0.1388798, -2.255975, 0.6156863, 1, 0, 1,
-0.721972, -1.356655, -1.600146, 0.6078432, 1, 0, 1,
-0.7218596, -1.325029, -2.828729, 0.6039216, 1, 0, 1,
-0.7167481, 0.05928212, -1.042881, 0.5960785, 1, 0, 1,
-0.7115115, -0.4612174, -3.712291, 0.5882353, 1, 0, 1,
-0.7096582, 0.04228346, -1.653655, 0.5843138, 1, 0, 1,
-0.7082241, 0.6975455, -0.4840031, 0.5764706, 1, 0, 1,
-0.7067491, -0.6374882, -3.913888, 0.572549, 1, 0, 1,
-0.7063421, -0.03660229, -1.445996, 0.5647059, 1, 0, 1,
-0.7060487, -0.1973936, -2.049239, 0.5607843, 1, 0, 1,
-0.7003969, 0.8699335, -0.3850311, 0.5529412, 1, 0, 1,
-0.6953208, 1.517922, -0.01907864, 0.5490196, 1, 0, 1,
-0.6934726, 2.892992, 0.7831224, 0.5411765, 1, 0, 1,
-0.688988, 0.5166074, -0.03455683, 0.5372549, 1, 0, 1,
-0.6866975, -0.5538908, -2.682532, 0.5294118, 1, 0, 1,
-0.6853955, -0.2406979, -2.357958, 0.5254902, 1, 0, 1,
-0.6790973, -0.8898185, -3.430028, 0.5176471, 1, 0, 1,
-0.6765727, 0.3494958, -0.7629765, 0.5137255, 1, 0, 1,
-0.6625704, -1.501633, -3.700485, 0.5058824, 1, 0, 1,
-0.6597642, 0.4560514, -0.2785311, 0.5019608, 1, 0, 1,
-0.6569872, 0.7241758, -0.3445413, 0.4941176, 1, 0, 1,
-0.6558655, -1.297253, -2.582747, 0.4862745, 1, 0, 1,
-0.6539525, -0.6444232, -0.9277636, 0.4823529, 1, 0, 1,
-0.649373, -0.2629884, -1.596135, 0.4745098, 1, 0, 1,
-0.6482987, -0.1803385, -1.618875, 0.4705882, 1, 0, 1,
-0.6481021, 1.333635, -1.267522, 0.4627451, 1, 0, 1,
-0.6429144, 0.0405562, -2.428155, 0.4588235, 1, 0, 1,
-0.640333, 0.7317367, -0.6718096, 0.4509804, 1, 0, 1,
-0.6343806, 0.4884573, -0.6259982, 0.4470588, 1, 0, 1,
-0.631498, 1.279974, -0.7940196, 0.4392157, 1, 0, 1,
-0.6312695, -0.3370185, -3.306339, 0.4352941, 1, 0, 1,
-0.6294284, 0.3487051, -0.8302035, 0.427451, 1, 0, 1,
-0.626048, 1.284902, -1.156299, 0.4235294, 1, 0, 1,
-0.6240495, 0.4147936, -1.980006, 0.4156863, 1, 0, 1,
-0.6233801, -0.7077819, -1.434121, 0.4117647, 1, 0, 1,
-0.6189737, 1.574347, -0.3115182, 0.4039216, 1, 0, 1,
-0.618136, -0.1813291, -2.370891, 0.3960784, 1, 0, 1,
-0.6157684, 1.025378, -0.4205884, 0.3921569, 1, 0, 1,
-0.6102247, 0.8239618, 0.573688, 0.3843137, 1, 0, 1,
-0.6027039, -0.5126566, -2.704698, 0.3803922, 1, 0, 1,
-0.5992168, 1.462961, -0.2547145, 0.372549, 1, 0, 1,
-0.5958637, 0.3131202, -0.4958014, 0.3686275, 1, 0, 1,
-0.594932, 0.05971314, -0.5840151, 0.3607843, 1, 0, 1,
-0.594035, 0.4363219, -2.785758, 0.3568628, 1, 0, 1,
-0.5919715, -0.4398317, -0.6969545, 0.3490196, 1, 0, 1,
-0.5907258, -0.4900943, -2.240304, 0.345098, 1, 0, 1,
-0.5873098, 2.410001, -0.1260466, 0.3372549, 1, 0, 1,
-0.5814336, 0.1543387, -0.9001707, 0.3333333, 1, 0, 1,
-0.5789096, -0.02827003, -1.198304, 0.3254902, 1, 0, 1,
-0.5788237, 0.9289456, -0.1330772, 0.3215686, 1, 0, 1,
-0.5745749, 1.786779, -0.6823536, 0.3137255, 1, 0, 1,
-0.5694891, 0.377907, -1.422826, 0.3098039, 1, 0, 1,
-0.5685763, 0.08792935, -0.8820049, 0.3019608, 1, 0, 1,
-0.5663118, -2.118672, -1.682337, 0.2941177, 1, 0, 1,
-0.5662608, 0.9677816, 0.2093898, 0.2901961, 1, 0, 1,
-0.5658529, 0.2927204, -1.51528, 0.282353, 1, 0, 1,
-0.5592475, 1.582203, -1.167747, 0.2784314, 1, 0, 1,
-0.5586228, 0.1056026, -1.577322, 0.2705882, 1, 0, 1,
-0.5580769, -0.0470095, -2.435555, 0.2666667, 1, 0, 1,
-0.5572949, 0.1679465, -1.656765, 0.2588235, 1, 0, 1,
-0.5557535, 0.2703175, -0.3390143, 0.254902, 1, 0, 1,
-0.549296, 0.2900791, -0.4824279, 0.2470588, 1, 0, 1,
-0.5486462, -1.018871, -3.2525, 0.2431373, 1, 0, 1,
-0.5406121, 1.089777, -0.5088074, 0.2352941, 1, 0, 1,
-0.5355111, 1.212188, -0.9289223, 0.2313726, 1, 0, 1,
-0.535341, 2.443534, -0.3686117, 0.2235294, 1, 0, 1,
-0.533856, 1.90908, 0.614799, 0.2196078, 1, 0, 1,
-0.5309398, 0.2484088, -2.425529, 0.2117647, 1, 0, 1,
-0.5296772, -0.1458693, -0.4396469, 0.2078431, 1, 0, 1,
-0.5285448, -0.1894835, -1.954927, 0.2, 1, 0, 1,
-0.5229325, 2.860422, -1.31911, 0.1921569, 1, 0, 1,
-0.5202733, 0.8413642, -1.120803, 0.1882353, 1, 0, 1,
-0.5123524, 0.9356293, 0.1230316, 0.1803922, 1, 0, 1,
-0.5119636, 0.2031631, -1.381582, 0.1764706, 1, 0, 1,
-0.509067, 0.2893253, -0.8733411, 0.1686275, 1, 0, 1,
-0.5055553, -0.4377538, -2.41479, 0.1647059, 1, 0, 1,
-0.5053397, 0.2300052, 0.5413841, 0.1568628, 1, 0, 1,
-0.5027792, -0.9282895, -2.952403, 0.1529412, 1, 0, 1,
-0.5024319, 0.9574712, -0.4594993, 0.145098, 1, 0, 1,
-0.4944919, -0.525788, -2.280474, 0.1411765, 1, 0, 1,
-0.4913003, -1.594207, -2.195829, 0.1333333, 1, 0, 1,
-0.4846284, -0.902731, -3.627754, 0.1294118, 1, 0, 1,
-0.4839298, -1.131234, -2.268815, 0.1215686, 1, 0, 1,
-0.4817533, 0.5754402, -1.142081, 0.1176471, 1, 0, 1,
-0.4742615, 1.899852, 0.6712582, 0.1098039, 1, 0, 1,
-0.4736356, 1.054702, 0.8340583, 0.1058824, 1, 0, 1,
-0.4722279, -0.3421669, -3.019296, 0.09803922, 1, 0, 1,
-0.4680916, -0.8875703, -3.191999, 0.09019608, 1, 0, 1,
-0.4677249, -0.4113158, -1.330923, 0.08627451, 1, 0, 1,
-0.467301, -1.86906, -1.176949, 0.07843138, 1, 0, 1,
-0.4659332, -0.5145819, -3.814844, 0.07450981, 1, 0, 1,
-0.4634027, 0.1394311, -0.2410381, 0.06666667, 1, 0, 1,
-0.4602675, -1.036943, -1.750643, 0.0627451, 1, 0, 1,
-0.4553362, 1.768412, -0.1743545, 0.05490196, 1, 0, 1,
-0.4518254, -0.913511, -2.863624, 0.05098039, 1, 0, 1,
-0.4515409, -2.023315, -3.962084, 0.04313726, 1, 0, 1,
-0.4461227, -1.395489, -3.524824, 0.03921569, 1, 0, 1,
-0.4426814, 0.2394083, -1.640105, 0.03137255, 1, 0, 1,
-0.4405955, -0.01308501, -0.6586827, 0.02745098, 1, 0, 1,
-0.4368399, 0.07014685, -2.111835, 0.01960784, 1, 0, 1,
-0.4351253, -1.054167, -2.926681, 0.01568628, 1, 0, 1,
-0.4331714, 1.123005, 0.3287506, 0.007843138, 1, 0, 1,
-0.4327615, -1.922818, -4.973939, 0.003921569, 1, 0, 1,
-0.432706, 1.299925, -0.2881327, 0, 1, 0.003921569, 1,
-0.4308552, -0.6485454, -3.697299, 0, 1, 0.01176471, 1,
-0.4235769, 0.8257722, 0.8458555, 0, 1, 0.01568628, 1,
-0.4232516, -1.949716, -0.8300558, 0, 1, 0.02352941, 1,
-0.4215878, -0.2179199, -2.234074, 0, 1, 0.02745098, 1,
-0.4207718, 0.4914809, -0.4141178, 0, 1, 0.03529412, 1,
-0.4161356, -0.2447878, -1.053867, 0, 1, 0.03921569, 1,
-0.4153328, -0.03559481, -2.431326, 0, 1, 0.04705882, 1,
-0.4148929, 0.7278717, -1.57566, 0, 1, 0.05098039, 1,
-0.4123927, 0.3707065, -1.13448, 0, 1, 0.05882353, 1,
-0.4077605, 0.8133762, -0.6027532, 0, 1, 0.0627451, 1,
-0.3990445, 0.1207481, -3.084593, 0, 1, 0.07058824, 1,
-0.3959986, -0.228435, -2.67072, 0, 1, 0.07450981, 1,
-0.3920459, 1.487044, -0.6318269, 0, 1, 0.08235294, 1,
-0.3913444, -0.8872862, -2.930471, 0, 1, 0.08627451, 1,
-0.388708, -1.64757, -3.040347, 0, 1, 0.09411765, 1,
-0.3788894, -0.7948241, -2.589216, 0, 1, 0.1019608, 1,
-0.3728271, -1.469057, -4.248025, 0, 1, 0.1058824, 1,
-0.371511, -0.5235606, -1.842381, 0, 1, 0.1137255, 1,
-0.369971, 0.270738, 0.2187772, 0, 1, 0.1176471, 1,
-0.3667222, 1.20462, -0.4191252, 0, 1, 0.1254902, 1,
-0.36613, 0.9113182, -1.589218, 0, 1, 0.1294118, 1,
-0.3659119, 0.2326639, 0.1694307, 0, 1, 0.1372549, 1,
-0.3615089, -1.35157, -2.144177, 0, 1, 0.1411765, 1,
-0.3576927, 0.5448941, 0.1935087, 0, 1, 0.1490196, 1,
-0.3571141, 0.8850138, -0.5852251, 0, 1, 0.1529412, 1,
-0.354621, 0.1889028, 0.6063442, 0, 1, 0.1607843, 1,
-0.3522051, -0.1719343, -2.738509, 0, 1, 0.1647059, 1,
-0.3512045, -0.2235327, -1.785357, 0, 1, 0.172549, 1,
-0.3510412, -0.07852077, -1.297097, 0, 1, 0.1764706, 1,
-0.3505901, -0.8458024, -3.12534, 0, 1, 0.1843137, 1,
-0.3497475, 1.266679, -1.527332, 0, 1, 0.1882353, 1,
-0.3491418, -0.3680681, 0.1388495, 0, 1, 0.1960784, 1,
-0.3451499, 0.4664814, -1.132449, 0, 1, 0.2039216, 1,
-0.3448345, 0.1662679, -0.8539649, 0, 1, 0.2078431, 1,
-0.3431289, -0.3872501, -2.667196, 0, 1, 0.2156863, 1,
-0.3429092, -0.3199557, -2.832264, 0, 1, 0.2196078, 1,
-0.3427098, -0.2077083, -2.771121, 0, 1, 0.227451, 1,
-0.3384381, 2.193997, -0.9465635, 0, 1, 0.2313726, 1,
-0.3374666, 1.27835, 0.3067853, 0, 1, 0.2392157, 1,
-0.3331847, 0.1287124, 0.3091366, 0, 1, 0.2431373, 1,
-0.3308895, 0.4724961, -1.45448, 0, 1, 0.2509804, 1,
-0.3229693, -1.98054, -4.026187, 0, 1, 0.254902, 1,
-0.3186217, 0.3712426, -0.2948141, 0, 1, 0.2627451, 1,
-0.3181978, 0.245205, -3.189395, 0, 1, 0.2666667, 1,
-0.3181423, 0.07920241, -2.10534, 0, 1, 0.2745098, 1,
-0.3164756, 1.413806, 0.7711172, 0, 1, 0.2784314, 1,
-0.315089, 0.2940307, -0.06530752, 0, 1, 0.2862745, 1,
-0.3135899, -0.8170185, -3.404875, 0, 1, 0.2901961, 1,
-0.307623, 0.2878875, -0.5704432, 0, 1, 0.2980392, 1,
-0.3046737, 1.204511, -1.632451, 0, 1, 0.3058824, 1,
-0.3026646, -1.01571, -2.423362, 0, 1, 0.3098039, 1,
-0.3001758, -0.04659376, -5.047635, 0, 1, 0.3176471, 1,
-0.2922468, -2.237986, -3.481355, 0, 1, 0.3215686, 1,
-0.2908201, 0.6600982, 0.2936603, 0, 1, 0.3294118, 1,
-0.2880686, 0.211287, -2.087092, 0, 1, 0.3333333, 1,
-0.2862627, 0.7605157, -3.139789, 0, 1, 0.3411765, 1,
-0.2851146, 0.05725317, -0.889527, 0, 1, 0.345098, 1,
-0.2843209, -0.5050217, -2.955276, 0, 1, 0.3529412, 1,
-0.2806671, -0.35662, -4.102942, 0, 1, 0.3568628, 1,
-0.2741945, -0.7306867, -1.110323, 0, 1, 0.3647059, 1,
-0.2741483, 0.9488193, -2.193605, 0, 1, 0.3686275, 1,
-0.2714983, -1.124993, -4.828643, 0, 1, 0.3764706, 1,
-0.268947, 0.1613222, -1.626336, 0, 1, 0.3803922, 1,
-0.2668014, -0.8142102, -2.874586, 0, 1, 0.3882353, 1,
-0.2640452, 0.282198, -0.8054482, 0, 1, 0.3921569, 1,
-0.2629071, 0.3123768, 0.7623132, 0, 1, 0.4, 1,
-0.2603573, -1.735633, -3.049744, 0, 1, 0.4078431, 1,
-0.2589763, -1.690347, -1.973933, 0, 1, 0.4117647, 1,
-0.2548265, 1.701225, -0.7172391, 0, 1, 0.4196078, 1,
-0.2534434, -0.05945811, -1.219172, 0, 1, 0.4235294, 1,
-0.2500271, 0.1788996, -0.6983461, 0, 1, 0.4313726, 1,
-0.2482518, -0.6457127, -3.036932, 0, 1, 0.4352941, 1,
-0.2480903, 1.225255, -1.429691, 0, 1, 0.4431373, 1,
-0.2441426, 1.007629, -0.5918956, 0, 1, 0.4470588, 1,
-0.2436672, 0.2854573, -0.7492115, 0, 1, 0.454902, 1,
-0.2402509, 0.5973701, -1.472586, 0, 1, 0.4588235, 1,
-0.2372867, 0.7375043, -0.2730746, 0, 1, 0.4666667, 1,
-0.2369196, -0.02631331, -2.758514, 0, 1, 0.4705882, 1,
-0.2364929, -0.6594613, -4.665243, 0, 1, 0.4784314, 1,
-0.2350204, -0.911118, -2.515254, 0, 1, 0.4823529, 1,
-0.234599, 0.7488245, 1.355826, 0, 1, 0.4901961, 1,
-0.2335426, -0.7422218, -2.80203, 0, 1, 0.4941176, 1,
-0.2334137, -1.128658, -4.095393, 0, 1, 0.5019608, 1,
-0.2332847, -1.396708, -1.57872, 0, 1, 0.509804, 1,
-0.2205575, 0.25404, -0.1439469, 0, 1, 0.5137255, 1,
-0.2177881, -0.103484, -0.6075358, 0, 1, 0.5215687, 1,
-0.2109423, 0.5579547, -1.249288, 0, 1, 0.5254902, 1,
-0.2057709, 1.341657, -0.9164272, 0, 1, 0.5333334, 1,
-0.2053756, 1.012279, 0.1968395, 0, 1, 0.5372549, 1,
-0.2048771, 1.134731, -0.390666, 0, 1, 0.5450981, 1,
-0.2037394, -1.590395, -3.486308, 0, 1, 0.5490196, 1,
-0.2007515, 1.317405, -0.12913, 0, 1, 0.5568628, 1,
-0.1992868, 1.440255, -0.3513115, 0, 1, 0.5607843, 1,
-0.1984059, 0.8879971, 0.1331937, 0, 1, 0.5686275, 1,
-0.197946, 0.8250799, -0.5578256, 0, 1, 0.572549, 1,
-0.196741, 0.2679556, -0.6153146, 0, 1, 0.5803922, 1,
-0.1934273, 0.01493805, -1.513535, 0, 1, 0.5843138, 1,
-0.1930409, 1.224846, -0.7618557, 0, 1, 0.5921569, 1,
-0.1917973, -0.2733709, -3.690631, 0, 1, 0.5960785, 1,
-0.1911668, 1.666036, -1.04791, 0, 1, 0.6039216, 1,
-0.187151, -0.1224009, -2.804717, 0, 1, 0.6117647, 1,
-0.1845308, 0.5487115, -1.842974, 0, 1, 0.6156863, 1,
-0.1749869, -1.656594, -4.897931, 0, 1, 0.6235294, 1,
-0.1742349, 0.4130418, 0.5445912, 0, 1, 0.627451, 1,
-0.1678896, -0.586418, -3.094033, 0, 1, 0.6352941, 1,
-0.1671054, 0.4824552, -0.859534, 0, 1, 0.6392157, 1,
-0.1669465, 1.043845, -0.6278773, 0, 1, 0.6470588, 1,
-0.1645589, 0.6018229, 0.5253252, 0, 1, 0.6509804, 1,
-0.1607119, 0.0354063, -2.101207, 0, 1, 0.6588235, 1,
-0.1604377, -0.4859217, -2.82914, 0, 1, 0.6627451, 1,
-0.1596737, 1.77598, 0.270133, 0, 1, 0.6705883, 1,
-0.1504254, -2.527966, -2.776314, 0, 1, 0.6745098, 1,
-0.1475959, -0.4302596, -2.788079, 0, 1, 0.682353, 1,
-0.1474529, 0.38293, 1.983389, 0, 1, 0.6862745, 1,
-0.1449852, 0.0754825, -0.7688875, 0, 1, 0.6941177, 1,
-0.1415514, -1.053196, 0.2792642, 0, 1, 0.7019608, 1,
-0.1413686, -1.016198, -1.05774, 0, 1, 0.7058824, 1,
-0.1401084, -1.218143, -2.574023, 0, 1, 0.7137255, 1,
-0.1400501, -0.8215716, -3.099998, 0, 1, 0.7176471, 1,
-0.1399634, -0.8968619, -3.04936, 0, 1, 0.7254902, 1,
-0.1351919, 3.445414, -0.4805595, 0, 1, 0.7294118, 1,
-0.1334925, -1.068687, -2.078691, 0, 1, 0.7372549, 1,
-0.1296186, 0.2282935, -0.7258496, 0, 1, 0.7411765, 1,
-0.1271163, -1.173149, -3.981925, 0, 1, 0.7490196, 1,
-0.1256112, -0.3696317, -2.474729, 0, 1, 0.7529412, 1,
-0.1208568, 0.3073803, -1.583967, 0, 1, 0.7607843, 1,
-0.1200533, 0.6948245, -0.8093335, 0, 1, 0.7647059, 1,
-0.1184127, 0.3432539, 0.8967179, 0, 1, 0.772549, 1,
-0.116329, 0.5995175, -0.6747176, 0, 1, 0.7764706, 1,
-0.1157339, -1.132343, -2.638682, 0, 1, 0.7843137, 1,
-0.1153846, 1.104868, 1.411301, 0, 1, 0.7882353, 1,
-0.112527, -0.9847271, -2.861791, 0, 1, 0.7960784, 1,
-0.1087818, -0.2286784, -2.397416, 0, 1, 0.8039216, 1,
-0.1087456, 1.634567, -0.9026164, 0, 1, 0.8078431, 1,
-0.1056553, -0.2180364, -3.46965, 0, 1, 0.8156863, 1,
-0.103396, -0.03710283, -1.97487, 0, 1, 0.8196079, 1,
-0.09904539, -0.1143703, -0.4506087, 0, 1, 0.827451, 1,
-0.09814841, -0.2440615, -3.156475, 0, 1, 0.8313726, 1,
-0.09260117, -0.3746119, -2.786723, 0, 1, 0.8392157, 1,
-0.09043776, -1.041992, -2.299265, 0, 1, 0.8431373, 1,
-0.08831015, 0.2200262, 0.2307661, 0, 1, 0.8509804, 1,
-0.0850964, 0.1286654, -0.04324745, 0, 1, 0.854902, 1,
-0.08452232, 0.9189287, 0.20529, 0, 1, 0.8627451, 1,
-0.07780438, 1.489894, -0.984239, 0, 1, 0.8666667, 1,
-0.07235809, -1.2248, -1.62666, 0, 1, 0.8745098, 1,
-0.07123702, 1.045305, -0.05524056, 0, 1, 0.8784314, 1,
-0.06799784, 0.08757509, -2.377022, 0, 1, 0.8862745, 1,
-0.06749175, 0.5781436, 0.2605371, 0, 1, 0.8901961, 1,
-0.06741532, -0.6075489, -5.058445, 0, 1, 0.8980392, 1,
-0.06401797, -0.5235089, -2.954156, 0, 1, 0.9058824, 1,
-0.06212652, -1.657741, -2.960969, 0, 1, 0.9098039, 1,
-0.06017265, 0.3181759, 0.1725868, 0, 1, 0.9176471, 1,
-0.06016565, 0.9756638, 0.8857529, 0, 1, 0.9215686, 1,
-0.05886742, 0.8470685, 1.073187, 0, 1, 0.9294118, 1,
-0.05780315, 0.7292006, 0.8590379, 0, 1, 0.9333333, 1,
-0.05488333, -1.329154, -3.465202, 0, 1, 0.9411765, 1,
-0.05447345, -0.5355834, -4.056199, 0, 1, 0.945098, 1,
-0.05436524, 0.683428, 0.1607106, 0, 1, 0.9529412, 1,
-0.05064443, 0.3604329, 0.03459429, 0, 1, 0.9568627, 1,
-0.04849233, -0.4224193, -4.025537, 0, 1, 0.9647059, 1,
-0.04834453, 1.273072, -0.1755154, 0, 1, 0.9686275, 1,
-0.04325384, 0.03597014, -0.5644273, 0, 1, 0.9764706, 1,
-0.04266682, -0.08067634, -2.005162, 0, 1, 0.9803922, 1,
-0.03966524, 0.1343243, 1.092507, 0, 1, 0.9882353, 1,
-0.03670078, 0.5360659, 0.2014321, 0, 1, 0.9921569, 1,
-0.02671116, -1.360823, -3.313799, 0, 1, 1, 1,
-0.02549264, 1.026602, -0.3008106, 0, 0.9921569, 1, 1,
-0.02419659, 0.6105236, 0.138074, 0, 0.9882353, 1, 1,
-0.02129938, -0.5083918, -3.487258, 0, 0.9803922, 1, 1,
-0.01986554, -1.043932, -3.081168, 0, 0.9764706, 1, 1,
-0.01871039, -1.774048, -2.210804, 0, 0.9686275, 1, 1,
-0.01806957, -0.8641847, -1.827205, 0, 0.9647059, 1, 1,
-0.01721196, -1.305155, -5.008597, 0, 0.9568627, 1, 1,
-0.01414786, -1.468712, -3.891853, 0, 0.9529412, 1, 1,
-0.01321243, 0.1432954, -0.9965312, 0, 0.945098, 1, 1,
-0.00924427, 1.438363, -0.2220551, 0, 0.9411765, 1, 1,
-0.00733735, -1.257222, -2.865129, 0, 0.9333333, 1, 1,
-0.004708877, -0.5897794, -3.339086, 0, 0.9294118, 1, 1,
-0.0004020778, 0.6946534, 0.5820434, 0, 0.9215686, 1, 1,
0.002453328, -0.3264953, 4.176106, 0, 0.9176471, 1, 1,
0.002552032, -0.08704884, 1.869869, 0, 0.9098039, 1, 1,
0.005214794, 0.865257, 0.1251527, 0, 0.9058824, 1, 1,
0.006897384, -1.442008, 3.137799, 0, 0.8980392, 1, 1,
0.01073861, -1.013563, 2.31425, 0, 0.8901961, 1, 1,
0.01121885, -0.665254, 1.870975, 0, 0.8862745, 1, 1,
0.01406, 0.6022494, -1.466669, 0, 0.8784314, 1, 1,
0.01613374, 1.983178, -1.399133, 0, 0.8745098, 1, 1,
0.01745765, -1.150838, 2.522362, 0, 0.8666667, 1, 1,
0.02065453, -1.17734, 2.147169, 0, 0.8627451, 1, 1,
0.02188787, -0.09875403, 3.382532, 0, 0.854902, 1, 1,
0.02528926, 0.6969122, 0.8907371, 0, 0.8509804, 1, 1,
0.02557685, 1.456479, -0.2533626, 0, 0.8431373, 1, 1,
0.0293507, -0.5129647, 1.981272, 0, 0.8392157, 1, 1,
0.03038029, -0.6853063, 1.814369, 0, 0.8313726, 1, 1,
0.03408153, -0.3188837, 1.092726, 0, 0.827451, 1, 1,
0.03501469, -0.5086468, 2.71978, 0, 0.8196079, 1, 1,
0.03629823, 1.180645, 0.7569888, 0, 0.8156863, 1, 1,
0.04290194, -0.6304985, 1.246253, 0, 0.8078431, 1, 1,
0.0430214, 0.6965387, -0.8025191, 0, 0.8039216, 1, 1,
0.04439517, 1.265031, 0.6025132, 0, 0.7960784, 1, 1,
0.04641258, -0.4812114, 1.211219, 0, 0.7882353, 1, 1,
0.04680046, 0.9337837, -1.676011, 0, 0.7843137, 1, 1,
0.04689344, -0.4781157, 4.004506, 0, 0.7764706, 1, 1,
0.04720428, -0.6405244, 2.497491, 0, 0.772549, 1, 1,
0.04857336, -1.424961, 3.845936, 0, 0.7647059, 1, 1,
0.04866739, 0.2477188, 0.1521481, 0, 0.7607843, 1, 1,
0.05079753, -0.4507278, 5.283404, 0, 0.7529412, 1, 1,
0.05199554, -1.323756, 4.660826, 0, 0.7490196, 1, 1,
0.05596837, 1.070879, 1.523673, 0, 0.7411765, 1, 1,
0.05638525, 0.3896075, 0.1821802, 0, 0.7372549, 1, 1,
0.05696661, -0.2535673, 4.73886, 0, 0.7294118, 1, 1,
0.06352542, -1.020214, 1.582504, 0, 0.7254902, 1, 1,
0.06568348, 0.7323079, -1.263347, 0, 0.7176471, 1, 1,
0.0663209, -1.29621, 3.211002, 0, 0.7137255, 1, 1,
0.07331847, 0.2373428, -1.308252, 0, 0.7058824, 1, 1,
0.08196902, 0.6817947, 0.152509, 0, 0.6980392, 1, 1,
0.09096999, 0.1057401, 1.412264, 0, 0.6941177, 1, 1,
0.09858185, 0.07698265, 1.600899, 0, 0.6862745, 1, 1,
0.1036548, -0.998055, 2.759685, 0, 0.682353, 1, 1,
0.1049292, -0.5972752, 3.618235, 0, 0.6745098, 1, 1,
0.1049413, 0.09362974, 1.055227, 0, 0.6705883, 1, 1,
0.105582, -0.3950323, 3.448225, 0, 0.6627451, 1, 1,
0.1128907, 0.4270742, -0.3629359, 0, 0.6588235, 1, 1,
0.1135507, 0.5980656, -1.758002, 0, 0.6509804, 1, 1,
0.1189482, -0.07574134, 2.497079, 0, 0.6470588, 1, 1,
0.1220985, 0.4740978, 1.378802, 0, 0.6392157, 1, 1,
0.1236015, -0.5423292, 2.790243, 0, 0.6352941, 1, 1,
0.1244346, -0.06001724, 0.7999424, 0, 0.627451, 1, 1,
0.1261315, 0.473346, -0.4258766, 0, 0.6235294, 1, 1,
0.1282016, -0.8491899, 3.321268, 0, 0.6156863, 1, 1,
0.1290282, 1.660548, -1.303323, 0, 0.6117647, 1, 1,
0.1336098, -0.9197227, 3.319472, 0, 0.6039216, 1, 1,
0.1338601, 0.4403439, 1.782981, 0, 0.5960785, 1, 1,
0.1390336, -0.2201751, 0.741636, 0, 0.5921569, 1, 1,
0.1430045, -0.5791075, 2.468041, 0, 0.5843138, 1, 1,
0.1454538, -0.1148338, 0.2897726, 0, 0.5803922, 1, 1,
0.1537964, -2.114374, 2.059723, 0, 0.572549, 1, 1,
0.1541455, 0.5927333, -0.704672, 0, 0.5686275, 1, 1,
0.1547172, -0.9594527, 2.581068, 0, 0.5607843, 1, 1,
0.161846, 0.5700322, -0.02526798, 0, 0.5568628, 1, 1,
0.163053, -1.5494, 2.607904, 0, 0.5490196, 1, 1,
0.1717599, -1.007188, 3.002038, 0, 0.5450981, 1, 1,
0.1721532, 1.576658, 1.571621, 0, 0.5372549, 1, 1,
0.1735121, 1.050923, -0.4030804, 0, 0.5333334, 1, 1,
0.1743657, 0.4699799, -0.6106306, 0, 0.5254902, 1, 1,
0.1812674, -0.09562639, 3.457093, 0, 0.5215687, 1, 1,
0.1855724, -2.556266, 5.197248, 0, 0.5137255, 1, 1,
0.187688, 0.4608335, 0.2365735, 0, 0.509804, 1, 1,
0.1882812, -0.1823425, 3.528735, 0, 0.5019608, 1, 1,
0.1909347, -0.05281241, 1.391733, 0, 0.4941176, 1, 1,
0.191898, 0.7982709, 1.624444, 0, 0.4901961, 1, 1,
0.1967895, 0.3573275, 0.5152336, 0, 0.4823529, 1, 1,
0.1974432, 1.746305, -1.84386, 0, 0.4784314, 1, 1,
0.1978205, 0.1526956, -0.7868279, 0, 0.4705882, 1, 1,
0.1979122, -1.312296, 2.257527, 0, 0.4666667, 1, 1,
0.1979781, -0.1974283, -0.05556723, 0, 0.4588235, 1, 1,
0.2042715, 0.4065437, -0.7839229, 0, 0.454902, 1, 1,
0.2054427, -0.5184495, 2.056, 0, 0.4470588, 1, 1,
0.2059698, -0.1697908, 1.630938, 0, 0.4431373, 1, 1,
0.2105499, -0.1765627, 3.016675, 0, 0.4352941, 1, 1,
0.2123518, 0.9786174, 1.82865, 0, 0.4313726, 1, 1,
0.2141824, 0.3753147, -1.717671, 0, 0.4235294, 1, 1,
0.2142266, 0.1767108, 0.9215759, 0, 0.4196078, 1, 1,
0.2161304, -0.08869573, 2.834664, 0, 0.4117647, 1, 1,
0.2174601, -1.649325, 3.160975, 0, 0.4078431, 1, 1,
0.2194116, 0.6665445, 1.438086, 0, 0.4, 1, 1,
0.2241031, -1.317749, 2.537759, 0, 0.3921569, 1, 1,
0.2310893, 0.5583006, 2.74119, 0, 0.3882353, 1, 1,
0.2311289, -0.07225149, 2.64196, 0, 0.3803922, 1, 1,
0.2327835, 1.460343, 1.377512, 0, 0.3764706, 1, 1,
0.237452, -0.588055, 5.126743, 0, 0.3686275, 1, 1,
0.2388903, 0.6821458, 0.6279681, 0, 0.3647059, 1, 1,
0.2405765, 0.2671966, 0.9962036, 0, 0.3568628, 1, 1,
0.2415143, 0.7770567, 1.412127, 0, 0.3529412, 1, 1,
0.2513714, 1.04662, 1.237495, 0, 0.345098, 1, 1,
0.2561385, -1.159496, 3.417178, 0, 0.3411765, 1, 1,
0.2580459, -1.045385, 1.084317, 0, 0.3333333, 1, 1,
0.2598361, 0.4386122, 0.5529713, 0, 0.3294118, 1, 1,
0.2629208, -0.6907524, 2.05294, 0, 0.3215686, 1, 1,
0.2636108, 1.252548, 1.804918, 0, 0.3176471, 1, 1,
0.2719315, 0.9546216, -0.2799549, 0, 0.3098039, 1, 1,
0.2720105, 0.9037353, 0.3304275, 0, 0.3058824, 1, 1,
0.2786429, 0.2723768, -0.7525618, 0, 0.2980392, 1, 1,
0.2790503, 0.6153561, -0.4669964, 0, 0.2901961, 1, 1,
0.2794592, -0.8430279, 3.155757, 0, 0.2862745, 1, 1,
0.2859304, 0.2448858, -0.2887026, 0, 0.2784314, 1, 1,
0.2895958, 1.58904, -0.7871349, 0, 0.2745098, 1, 1,
0.2965968, -1.379418, 1.440733, 0, 0.2666667, 1, 1,
0.297808, 0.05458329, 1.248411, 0, 0.2627451, 1, 1,
0.2985923, -0.4984518, 0.0775905, 0, 0.254902, 1, 1,
0.2990342, -1.783655, 0.9867428, 0, 0.2509804, 1, 1,
0.2999265, 1.03985, 0.4660476, 0, 0.2431373, 1, 1,
0.3012567, 0.4806013, 0.04748126, 0, 0.2392157, 1, 1,
0.3125389, -0.3955812, 1.495834, 0, 0.2313726, 1, 1,
0.3127614, 0.9092355, -1.457759, 0, 0.227451, 1, 1,
0.3185607, 0.5423898, -0.06238188, 0, 0.2196078, 1, 1,
0.3216555, -1.850239, 3.213763, 0, 0.2156863, 1, 1,
0.3231306, 0.1952462, 0.6666318, 0, 0.2078431, 1, 1,
0.3234663, 1.484142, 0.02639178, 0, 0.2039216, 1, 1,
0.3255522, -0.9208436, 2.848718, 0, 0.1960784, 1, 1,
0.3261532, -1.103923, 2.510686, 0, 0.1882353, 1, 1,
0.3265909, 1.818872, 0.9927671, 0, 0.1843137, 1, 1,
0.3288552, 1.037169, 0.07296232, 0, 0.1764706, 1, 1,
0.3339517, 0.7943734, 1.767755, 0, 0.172549, 1, 1,
0.3364217, -1.086329, 2.748236, 0, 0.1647059, 1, 1,
0.3374772, 0.2597504, 0.4253362, 0, 0.1607843, 1, 1,
0.34239, -0.0512707, 1.242035, 0, 0.1529412, 1, 1,
0.3458816, 1.038233, -0.255687, 0, 0.1490196, 1, 1,
0.3464189, 0.112422, 0.941618, 0, 0.1411765, 1, 1,
0.3491536, 0.1358898, 2.146805, 0, 0.1372549, 1, 1,
0.3499624, -1.847203, 3.205661, 0, 0.1294118, 1, 1,
0.3514491, -2.092804, 1.625523, 0, 0.1254902, 1, 1,
0.3540452, -0.2123269, 1.217921, 0, 0.1176471, 1, 1,
0.3580676, 0.1443607, 2.590413, 0, 0.1137255, 1, 1,
0.3590949, 1.114053, 1.217566, 0, 0.1058824, 1, 1,
0.3625323, -1.131116, 3.287466, 0, 0.09803922, 1, 1,
0.3628478, 0.9184037, 1.48143, 0, 0.09411765, 1, 1,
0.3632933, -0.7164087, 2.285197, 0, 0.08627451, 1, 1,
0.364571, -0.4970622, 4.913418, 0, 0.08235294, 1, 1,
0.3684707, 1.70997, 0.9419956, 0, 0.07450981, 1, 1,
0.3691523, -0.05669373, 2.100175, 0, 0.07058824, 1, 1,
0.3709226, 0.2179141, 1.154655, 0, 0.0627451, 1, 1,
0.3711665, -0.202778, 1.139366, 0, 0.05882353, 1, 1,
0.3729448, -0.7291877, 2.765919, 0, 0.05098039, 1, 1,
0.3740674, 0.3784805, 1.162609, 0, 0.04705882, 1, 1,
0.3779201, 0.0800605, 0.3144019, 0, 0.03921569, 1, 1,
0.3817989, 0.3571939, 1.117634, 0, 0.03529412, 1, 1,
0.3818339, 0.1015663, 2.752452, 0, 0.02745098, 1, 1,
0.3821444, 0.5149428, 0.4897268, 0, 0.02352941, 1, 1,
0.3844289, -0.2475593, 3.21428, 0, 0.01568628, 1, 1,
0.3857307, -1.022315, 2.375718, 0, 0.01176471, 1, 1,
0.3881237, 0.4707342, 1.072633, 0, 0.003921569, 1, 1,
0.4006509, 0.5561648, -0.6028959, 0.003921569, 0, 1, 1,
0.4010133, 0.3272979, -0.549105, 0.007843138, 0, 1, 1,
0.4030916, 0.3163807, 0.2359023, 0.01568628, 0, 1, 1,
0.4067186, 0.07583125, 0.5097741, 0.01960784, 0, 1, 1,
0.4073003, -2.341558, 3.338277, 0.02745098, 0, 1, 1,
0.4083406, -1.061088, 4.002076, 0.03137255, 0, 1, 1,
0.4098196, 0.1769268, 1.364709, 0.03921569, 0, 1, 1,
0.4101793, -0.1898198, 1.215854, 0.04313726, 0, 1, 1,
0.4151508, -0.7670706, 2.506629, 0.05098039, 0, 1, 1,
0.416167, -0.3895403, 0.8321053, 0.05490196, 0, 1, 1,
0.4174249, -1.368953, 3.892493, 0.0627451, 0, 1, 1,
0.4208254, -1.974208, 3.155648, 0.06666667, 0, 1, 1,
0.4233381, -0.28157, 1.361687, 0.07450981, 0, 1, 1,
0.4242374, -1.256054, 2.964892, 0.07843138, 0, 1, 1,
0.4243414, 1.330913, 0.5095739, 0.08627451, 0, 1, 1,
0.4264659, -1.882732, 2.035574, 0.09019608, 0, 1, 1,
0.4265479, -1.347329, 2.797674, 0.09803922, 0, 1, 1,
0.4268766, -0.8098398, 2.599727, 0.1058824, 0, 1, 1,
0.4269405, 1.034733, 0.5442882, 0.1098039, 0, 1, 1,
0.428916, -0.1762583, 3.184494, 0.1176471, 0, 1, 1,
0.4363386, -0.6508079, 2.760067, 0.1215686, 0, 1, 1,
0.4369512, 0.1984938, 0.4748475, 0.1294118, 0, 1, 1,
0.4379077, -0.1505527, 3.067469, 0.1333333, 0, 1, 1,
0.4429877, 0.6011913, 1.306388, 0.1411765, 0, 1, 1,
0.4430562, -0.0587611, 1.782512, 0.145098, 0, 1, 1,
0.4434887, 0.3571087, -0.8691655, 0.1529412, 0, 1, 1,
0.4451025, -0.7794234, 3.552153, 0.1568628, 0, 1, 1,
0.4489269, 0.7381094, -0.9110283, 0.1647059, 0, 1, 1,
0.4549332, -0.03370356, 2.295492, 0.1686275, 0, 1, 1,
0.4629071, -2.356629, 2.427812, 0.1764706, 0, 1, 1,
0.4700279, -0.9332464, 1.631296, 0.1803922, 0, 1, 1,
0.4737155, -1.137075, 2.503406, 0.1882353, 0, 1, 1,
0.480748, 0.523895, 1.68532, 0.1921569, 0, 1, 1,
0.4840948, 1.087711, 1.363521, 0.2, 0, 1, 1,
0.4867389, -0.5428386, 2.860135, 0.2078431, 0, 1, 1,
0.491938, -0.1974546, 0.8776307, 0.2117647, 0, 1, 1,
0.4922464, -1.049208, 3.637093, 0.2196078, 0, 1, 1,
0.492432, -0.5855862, 1.777477, 0.2235294, 0, 1, 1,
0.4930809, 0.6464586, 1.666435, 0.2313726, 0, 1, 1,
0.4951315, -0.6393073, 2.555726, 0.2352941, 0, 1, 1,
0.4963522, -0.4538026, 2.406157, 0.2431373, 0, 1, 1,
0.4975469, 0.6866197, 1.338006, 0.2470588, 0, 1, 1,
0.5033011, -0.9304792, 4.63301, 0.254902, 0, 1, 1,
0.5067879, -0.130766, 1.102526, 0.2588235, 0, 1, 1,
0.5117205, 1.331497, -0.1597302, 0.2666667, 0, 1, 1,
0.5140439, -1.103885, 5.843053, 0.2705882, 0, 1, 1,
0.5147579, 0.5123072, -0.9261067, 0.2784314, 0, 1, 1,
0.5260031, 1.654313, -0.7835989, 0.282353, 0, 1, 1,
0.5313459, -0.9042302, 1.841792, 0.2901961, 0, 1, 1,
0.5355322, -1.419414, 3.419202, 0.2941177, 0, 1, 1,
0.5374579, 1.157753, 0.8260009, 0.3019608, 0, 1, 1,
0.5378312, -1.2154, 5.087756, 0.3098039, 0, 1, 1,
0.5489528, -0.4404459, 3.581014, 0.3137255, 0, 1, 1,
0.5584578, -0.9931263, 2.97392, 0.3215686, 0, 1, 1,
0.5603651, 1.657725, 0.8654179, 0.3254902, 0, 1, 1,
0.562624, -1.06215, 3.708043, 0.3333333, 0, 1, 1,
0.5626354, 0.3314739, 1.075243, 0.3372549, 0, 1, 1,
0.5647493, -0.6232266, 2.30018, 0.345098, 0, 1, 1,
0.5659918, 0.1743881, 1.82192, 0.3490196, 0, 1, 1,
0.5690915, 0.5707644, 0.8174615, 0.3568628, 0, 1, 1,
0.5704501, 0.5797379, 0.02499445, 0.3607843, 0, 1, 1,
0.5711061, 0.4904089, -0.8821908, 0.3686275, 0, 1, 1,
0.5731183, -0.05935685, 1.718827, 0.372549, 0, 1, 1,
0.5759044, 0.334576, 0.6930942, 0.3803922, 0, 1, 1,
0.5764297, -0.7954457, 3.693051, 0.3843137, 0, 1, 1,
0.5826464, 0.1403477, 2.423451, 0.3921569, 0, 1, 1,
0.5977512, 1.161904, 1.142752, 0.3960784, 0, 1, 1,
0.6010178, 0.85877, -0.4270469, 0.4039216, 0, 1, 1,
0.6018791, 0.9497337, -0.04634335, 0.4117647, 0, 1, 1,
0.6066995, -1.00494, 2.40176, 0.4156863, 0, 1, 1,
0.6071198, -0.6371703, 1.510158, 0.4235294, 0, 1, 1,
0.6091568, 1.973968, -0.6821327, 0.427451, 0, 1, 1,
0.6100413, 0.999483, 0.7090427, 0.4352941, 0, 1, 1,
0.6100496, -0.1689899, 0.2148649, 0.4392157, 0, 1, 1,
0.6179438, 0.1588605, 1.098026, 0.4470588, 0, 1, 1,
0.6243734, 0.07571622, 0.6294919, 0.4509804, 0, 1, 1,
0.6247954, 1.053658, 1.619067, 0.4588235, 0, 1, 1,
0.625266, 0.4575781, 2.573756, 0.4627451, 0, 1, 1,
0.6394001, 0.5197386, -0.1807008, 0.4705882, 0, 1, 1,
0.6436998, -1.223682, 2.347245, 0.4745098, 0, 1, 1,
0.6441578, 1.438511, -1.640835, 0.4823529, 0, 1, 1,
0.6485831, 0.1594138, 0.1293807, 0.4862745, 0, 1, 1,
0.6488472, 2.202112, 0.3200437, 0.4941176, 0, 1, 1,
0.653343, 0.1941729, -0.02119653, 0.5019608, 0, 1, 1,
0.6557494, 1.164621, 1.196314, 0.5058824, 0, 1, 1,
0.6567463, -0.834573, 1.54687, 0.5137255, 0, 1, 1,
0.6821967, -0.6127487, 0.7998903, 0.5176471, 0, 1, 1,
0.6826533, -0.758725, 2.569387, 0.5254902, 0, 1, 1,
0.6860712, -0.7264003, 2.744552, 0.5294118, 0, 1, 1,
0.6864826, -1.215091, 0.9601308, 0.5372549, 0, 1, 1,
0.6869665, -0.806226, 0.6623403, 0.5411765, 0, 1, 1,
0.6953755, -1.423504, 1.142939, 0.5490196, 0, 1, 1,
0.7085072, 1.123522, 0.6299909, 0.5529412, 0, 1, 1,
0.7093902, -0.6215427, 1.85243, 0.5607843, 0, 1, 1,
0.7190264, -0.7898965, 2.076402, 0.5647059, 0, 1, 1,
0.7213662, -0.4721264, 0.3370565, 0.572549, 0, 1, 1,
0.7270882, -0.7463463, 1.958038, 0.5764706, 0, 1, 1,
0.7279621, 0.5027982, 1.659315, 0.5843138, 0, 1, 1,
0.7285134, -1.91588, 2.99221, 0.5882353, 0, 1, 1,
0.7292643, -0.2433419, 1.862433, 0.5960785, 0, 1, 1,
0.7312577, -0.6344706, 2.270199, 0.6039216, 0, 1, 1,
0.7324347, -0.2822957, 2.301605, 0.6078432, 0, 1, 1,
0.7324782, -0.2180144, 1.017002, 0.6156863, 0, 1, 1,
0.7335449, -1.29153, 1.866902, 0.6196079, 0, 1, 1,
0.7341887, -2.162733, 4.515239, 0.627451, 0, 1, 1,
0.7363068, -0.8348199, 2.344765, 0.6313726, 0, 1, 1,
0.7378061, 0.3042649, 1.076944, 0.6392157, 0, 1, 1,
0.738014, 1.070817, -0.5630558, 0.6431373, 0, 1, 1,
0.7449818, -0.8355258, 2.337782, 0.6509804, 0, 1, 1,
0.7459629, -0.1665864, 2.327237, 0.654902, 0, 1, 1,
0.7465584, -0.8294601, 1.416469, 0.6627451, 0, 1, 1,
0.7518341, 0.3421679, 1.432586, 0.6666667, 0, 1, 1,
0.7585393, 1.323581, -1.461469, 0.6745098, 0, 1, 1,
0.7663291, 0.7053704, 1.507052, 0.6784314, 0, 1, 1,
0.7745676, 0.07795205, 0.03460013, 0.6862745, 0, 1, 1,
0.7786063, 0.1098981, 1.46122, 0.6901961, 0, 1, 1,
0.779539, -1.628619, 2.462626, 0.6980392, 0, 1, 1,
0.786697, 2.203182, 0.01707515, 0.7058824, 0, 1, 1,
0.802669, -0.6957557, 3.181045, 0.7098039, 0, 1, 1,
0.8038931, -0.4132116, 1.900433, 0.7176471, 0, 1, 1,
0.812745, 0.3374188, 0.2790177, 0.7215686, 0, 1, 1,
0.8339422, 1.388286, 1.006775, 0.7294118, 0, 1, 1,
0.8348206, 0.8257195, -1.078613, 0.7333333, 0, 1, 1,
0.8352174, 0.8026475, 0.6772419, 0.7411765, 0, 1, 1,
0.8380517, 0.4214153, 1.34904, 0.7450981, 0, 1, 1,
0.8647485, 0.0963983, 0.6462014, 0.7529412, 0, 1, 1,
0.8718736, -0.2579026, 1.662482, 0.7568628, 0, 1, 1,
0.8724901, -0.9186828, 1.591888, 0.7647059, 0, 1, 1,
0.8737448, -0.02853999, 2.189385, 0.7686275, 0, 1, 1,
0.8755272, -0.07053316, 1.892425, 0.7764706, 0, 1, 1,
0.8793212, -0.7672449, 1.906687, 0.7803922, 0, 1, 1,
0.8793443, 1.047857, 0.1795384, 0.7882353, 0, 1, 1,
0.8846671, -0.4287429, 3.665615, 0.7921569, 0, 1, 1,
0.8864089, -0.7967469, 3.13804, 0.8, 0, 1, 1,
0.8871078, 0.3386718, 1.253852, 0.8078431, 0, 1, 1,
0.8892062, 0.8284919, 0.9576079, 0.8117647, 0, 1, 1,
0.8953817, 1.816639, 0.5128002, 0.8196079, 0, 1, 1,
0.8974633, -0.743318, 4.157606, 0.8235294, 0, 1, 1,
0.9217172, -1.263566, 1.991731, 0.8313726, 0, 1, 1,
0.9222542, -0.2807114, 2.723671, 0.8352941, 0, 1, 1,
0.9262629, 0.3073321, 1.789825, 0.8431373, 0, 1, 1,
0.9323133, -1.339048, 2.373269, 0.8470588, 0, 1, 1,
0.933247, -0.09298234, 1.964627, 0.854902, 0, 1, 1,
0.9469157, -0.5072694, -0.008094453, 0.8588235, 0, 1, 1,
0.9471267, 1.186062, -0.8456942, 0.8666667, 0, 1, 1,
0.9482616, 0.09529419, 4.153021, 0.8705882, 0, 1, 1,
0.9506749, -1.192698, 2.712043, 0.8784314, 0, 1, 1,
0.9575216, 0.3109069, 0.5383838, 0.8823529, 0, 1, 1,
0.9578634, -0.1477632, 0.4358704, 0.8901961, 0, 1, 1,
0.9583411, -0.1351459, 3.139724, 0.8941177, 0, 1, 1,
0.9599627, 0.3422167, 1.32145, 0.9019608, 0, 1, 1,
0.9615051, 0.1115638, 0.8520294, 0.9098039, 0, 1, 1,
0.9659395, 1.280025, 0.001686939, 0.9137255, 0, 1, 1,
0.9660334, -0.09084533, 1.994582, 0.9215686, 0, 1, 1,
0.9699239, 0.4017459, 1.889268, 0.9254902, 0, 1, 1,
0.972187, 1.535718, 1.521131, 0.9333333, 0, 1, 1,
0.9734226, 2.074013, 0.905679, 0.9372549, 0, 1, 1,
0.9748052, -1.080376, 4.242507, 0.945098, 0, 1, 1,
0.9789634, 0.2922879, 1.071836, 0.9490196, 0, 1, 1,
0.9796444, 0.7492479, 1.043264, 0.9568627, 0, 1, 1,
0.9810238, -1.088635, 2.342372, 0.9607843, 0, 1, 1,
0.9902484, -0.4246556, 2.444196, 0.9686275, 0, 1, 1,
0.9905544, 0.1893494, 0.1595819, 0.972549, 0, 1, 1,
0.99353, 0.9162423, -0.07654028, 0.9803922, 0, 1, 1,
0.9956917, -1.638795, 1.872084, 0.9843137, 0, 1, 1,
0.9970783, -1.083305, 1.565825, 0.9921569, 0, 1, 1,
1.002956, 1.522999, 3.162439, 0.9960784, 0, 1, 1,
1.003534, -0.388281, 1.376162, 1, 0, 0.9960784, 1,
1.004664, 0.2880207, 1.728732, 1, 0, 0.9882353, 1,
1.007032, 0.7586623, 1.171568, 1, 0, 0.9843137, 1,
1.007461, 0.0608027, 0.9384138, 1, 0, 0.9764706, 1,
1.008294, 1.024015, 3.521719, 1, 0, 0.972549, 1,
1.009188, -2.245755, 1.780514, 1, 0, 0.9647059, 1,
1.009676, -1.499111, 3.842817, 1, 0, 0.9607843, 1,
1.02123, 1.374873, 2.585998, 1, 0, 0.9529412, 1,
1.022498, -2.034721, 3.786651, 1, 0, 0.9490196, 1,
1.024603, -0.06109742, 1.774944, 1, 0, 0.9411765, 1,
1.024993, 0.496338, 0.6482477, 1, 0, 0.9372549, 1,
1.025918, 2.06973, -0.7834452, 1, 0, 0.9294118, 1,
1.027571, -0.202296, 1.98363, 1, 0, 0.9254902, 1,
1.036887, 1.121076, -0.09838583, 1, 0, 0.9176471, 1,
1.0435, 0.141847, 2.409099, 1, 0, 0.9137255, 1,
1.047802, -0.2923178, 1.337968, 1, 0, 0.9058824, 1,
1.0484, 0.3722719, 0.9241598, 1, 0, 0.9019608, 1,
1.048871, -0.9584608, 1.371146, 1, 0, 0.8941177, 1,
1.051927, -0.06511588, 1.857542, 1, 0, 0.8862745, 1,
1.057198, 0.1443628, 0.3316845, 1, 0, 0.8823529, 1,
1.063992, -0.111876, 1.126824, 1, 0, 0.8745098, 1,
1.065394, -0.4316473, 2.940976, 1, 0, 0.8705882, 1,
1.066812, 0.952789, 1.96994, 1, 0, 0.8627451, 1,
1.072665, -1.309461, 1.665008, 1, 0, 0.8588235, 1,
1.07363, -0.7000192, 2.881503, 1, 0, 0.8509804, 1,
1.074926, -2.679968, 2.743542, 1, 0, 0.8470588, 1,
1.083016, 0.06125819, 2.100929, 1, 0, 0.8392157, 1,
1.08451, -0.1066815, 1.628191, 1, 0, 0.8352941, 1,
1.091588, 0.6923018, 0.7919486, 1, 0, 0.827451, 1,
1.096917, -0.7964733, 1.639839, 1, 0, 0.8235294, 1,
1.105495, 0.9368944, 0.9237961, 1, 0, 0.8156863, 1,
1.115859, -0.09572564, 1.49652, 1, 0, 0.8117647, 1,
1.116116, -0.07271395, 0.682798, 1, 0, 0.8039216, 1,
1.122089, -0.03867031, 0.9004114, 1, 0, 0.7960784, 1,
1.124323, 0.1033629, 1.486902, 1, 0, 0.7921569, 1,
1.128236, 1.120514, -0.4431164, 1, 0, 0.7843137, 1,
1.133474, 0.9990269, 1.578037, 1, 0, 0.7803922, 1,
1.137045, 0.5660107, -0.2772596, 1, 0, 0.772549, 1,
1.150588, 1.208457, 3.640049, 1, 0, 0.7686275, 1,
1.151963, 0.03373815, 3.003294, 1, 0, 0.7607843, 1,
1.153393, 0.5311225, 0.9891915, 1, 0, 0.7568628, 1,
1.161583, 0.2097471, 3.527027, 1, 0, 0.7490196, 1,
1.166291, 0.6266247, 1.378749, 1, 0, 0.7450981, 1,
1.167054, 1.279892, -0.2083238, 1, 0, 0.7372549, 1,
1.167733, -0.2441599, 2.430723, 1, 0, 0.7333333, 1,
1.167962, -0.4431184, 0.6322874, 1, 0, 0.7254902, 1,
1.168213, -2.316927, 1.925282, 1, 0, 0.7215686, 1,
1.172727, -0.5835921, 2.161332, 1, 0, 0.7137255, 1,
1.174489, -0.07657291, 1.500499, 1, 0, 0.7098039, 1,
1.177372, -0.1101765, 1.917112, 1, 0, 0.7019608, 1,
1.184839, 0.01912073, 2.363374, 1, 0, 0.6941177, 1,
1.189071, 3.030758, 1.012229, 1, 0, 0.6901961, 1,
1.201867, -0.2803853, 0.7065511, 1, 0, 0.682353, 1,
1.228013, 1.624467, 0.3267795, 1, 0, 0.6784314, 1,
1.230948, -0.3593116, 1.470411, 1, 0, 0.6705883, 1,
1.23821, -0.6112984, 2.468003, 1, 0, 0.6666667, 1,
1.23917, -0.9055826, 2.862712, 1, 0, 0.6588235, 1,
1.243948, -0.3089079, 1.407707, 1, 0, 0.654902, 1,
1.247411, 0.4820242, 1.325807, 1, 0, 0.6470588, 1,
1.253141, 0.5169796, 2.392767, 1, 0, 0.6431373, 1,
1.254624, 0.6382102, 1.444453, 1, 0, 0.6352941, 1,
1.257403, 0.2946528, 1.248052, 1, 0, 0.6313726, 1,
1.265189, 0.4685214, 0.7905443, 1, 0, 0.6235294, 1,
1.268813, 0.8565793, 0.7887389, 1, 0, 0.6196079, 1,
1.272646, 0.2973447, 1.897989, 1, 0, 0.6117647, 1,
1.283892, 0.3361752, 0.5753691, 1, 0, 0.6078432, 1,
1.285564, 0.4772462, 2.13216, 1, 0, 0.6, 1,
1.287331, 2.038736, -1.236593, 1, 0, 0.5921569, 1,
1.296962, 0.03287522, 0.5006632, 1, 0, 0.5882353, 1,
1.312112, -0.6156123, 1.057484, 1, 0, 0.5803922, 1,
1.316284, 1.198306, 0.278542, 1, 0, 0.5764706, 1,
1.320465, -0.2072079, 1.982957, 1, 0, 0.5686275, 1,
1.345272, -0.1463005, 0.9709814, 1, 0, 0.5647059, 1,
1.346655, -0.8975089, 1.267438, 1, 0, 0.5568628, 1,
1.357261, 1.100126, 0.6560873, 1, 0, 0.5529412, 1,
1.364842, 0.8669667, 0.3430237, 1, 0, 0.5450981, 1,
1.3695, 1.058212, 0.08728327, 1, 0, 0.5411765, 1,
1.382047, -1.312225, 2.427702, 1, 0, 0.5333334, 1,
1.382603, -2.131879, 2.985348, 1, 0, 0.5294118, 1,
1.385255, -0.1973447, 1.277873, 1, 0, 0.5215687, 1,
1.391255, -1.242792, 2.276726, 1, 0, 0.5176471, 1,
1.417247, -0.3922901, 1.32027, 1, 0, 0.509804, 1,
1.417672, -1.116375, 0.4911766, 1, 0, 0.5058824, 1,
1.423583, -1.051786, 0.8219611, 1, 0, 0.4980392, 1,
1.427119, 0.4074431, 2.875579, 1, 0, 0.4901961, 1,
1.456589, -1.135776, 1.943739, 1, 0, 0.4862745, 1,
1.462225, 0.02798591, 1.398974, 1, 0, 0.4784314, 1,
1.467016, -1.608294, 1.962729, 1, 0, 0.4745098, 1,
1.469334, 0.4526361, 0.7285835, 1, 0, 0.4666667, 1,
1.474231, -1.013591, 2.350072, 1, 0, 0.4627451, 1,
1.480166, -1.194674, 2.311235, 1, 0, 0.454902, 1,
1.490199, -0.4968142, 2.755528, 1, 0, 0.4509804, 1,
1.491541, -0.3684204, 1.92313, 1, 0, 0.4431373, 1,
1.501512, 0.04417477, 1.003269, 1, 0, 0.4392157, 1,
1.522842, 0.6189079, 1.682695, 1, 0, 0.4313726, 1,
1.526054, -0.3472357, 3.758648, 1, 0, 0.427451, 1,
1.545177, -1.366195, 3.190442, 1, 0, 0.4196078, 1,
1.547262, 0.2251428, 0.08106487, 1, 0, 0.4156863, 1,
1.580162, 1.332291, 1.985823, 1, 0, 0.4078431, 1,
1.594798, -1.598394, -0.2755322, 1, 0, 0.4039216, 1,
1.5963, 0.4969231, 1.275719, 1, 0, 0.3960784, 1,
1.600153, 0.03224779, 1.684657, 1, 0, 0.3882353, 1,
1.613455, -0.6472177, 1.271763, 1, 0, 0.3843137, 1,
1.618985, -0.9542114, 2.630497, 1, 0, 0.3764706, 1,
1.619339, 0.9287404, 0.9128674, 1, 0, 0.372549, 1,
1.624983, 0.6856893, 2.138459, 1, 0, 0.3647059, 1,
1.631396, 2.288729, 1.170739, 1, 0, 0.3607843, 1,
1.637197, 1.99591, -0.04020192, 1, 0, 0.3529412, 1,
1.637561, 0.9942371, 0.4768854, 1, 0, 0.3490196, 1,
1.645918, 1.621536, 0.9967018, 1, 0, 0.3411765, 1,
1.657337, 0.04951254, 2.675369, 1, 0, 0.3372549, 1,
1.6668, -1.276516, 2.714503, 1, 0, 0.3294118, 1,
1.69545, 0.1192482, 1.173469, 1, 0, 0.3254902, 1,
1.713899, 0.5264634, 0.4327058, 1, 0, 0.3176471, 1,
1.714172, -1.305832, 2.286588, 1, 0, 0.3137255, 1,
1.726537, 1.396592, 1.389084, 1, 0, 0.3058824, 1,
1.72729, 1.640762, 0.7831049, 1, 0, 0.2980392, 1,
1.728252, 0.4770409, 0.8281245, 1, 0, 0.2941177, 1,
1.731093, 0.6618935, 1.791016, 1, 0, 0.2862745, 1,
1.733911, -0.4904371, 2.49074, 1, 0, 0.282353, 1,
1.735619, 0.5709688, 1.384799, 1, 0, 0.2745098, 1,
1.737143, -0.125036, 2.489195, 1, 0, 0.2705882, 1,
1.780602, -1.187016, 2.236722, 1, 0, 0.2627451, 1,
1.791315, 0.2999738, 1.853719, 1, 0, 0.2588235, 1,
1.791941, 0.09729929, 1.752997, 1, 0, 0.2509804, 1,
1.815403, -0.2332474, 1.260289, 1, 0, 0.2470588, 1,
1.818884, -0.4482567, 3.891198, 1, 0, 0.2392157, 1,
1.819781, -1.498199, 4.126805, 1, 0, 0.2352941, 1,
1.821451, -1.377683, 1.897935, 1, 0, 0.227451, 1,
1.847418, 1.096402, 0.3933758, 1, 0, 0.2235294, 1,
1.853969, -1.094309, 2.487423, 1, 0, 0.2156863, 1,
1.893208, 2.339396, 1.159126, 1, 0, 0.2117647, 1,
1.896316, -1.11905, 1.792603, 1, 0, 0.2039216, 1,
1.897016, -0.2914326, 2.315119, 1, 0, 0.1960784, 1,
1.898222, 0.4379102, 0.1058516, 1, 0, 0.1921569, 1,
1.953757, -1.207981, 0.3228583, 1, 0, 0.1843137, 1,
1.987376, 0.8409382, 0.4065118, 1, 0, 0.1803922, 1,
1.994016, -1.454301, 1.701177, 1, 0, 0.172549, 1,
1.995209, 0.5800719, 1.960411, 1, 0, 0.1686275, 1,
2.000561, -0.8012227, 1.711728, 1, 0, 0.1607843, 1,
2.01314, 0.6413529, 2.454131, 1, 0, 0.1568628, 1,
2.014727, 0.7985414, 0.9799786, 1, 0, 0.1490196, 1,
2.034628, -0.5936361, 2.919751, 1, 0, 0.145098, 1,
2.140339, 0.6049248, 1.121734, 1, 0, 0.1372549, 1,
2.147539, 0.4949925, 0.1156123, 1, 0, 0.1333333, 1,
2.150769, -1.656238, 2.52785, 1, 0, 0.1254902, 1,
2.177408, -0.007899536, 1.584754, 1, 0, 0.1215686, 1,
2.218118, -1.519498, 2.791893, 1, 0, 0.1137255, 1,
2.233681, -1.36542, 0.3016262, 1, 0, 0.1098039, 1,
2.253176, -0.2100036, 0.7380293, 1, 0, 0.1019608, 1,
2.282957, 2.008896, -0.1484698, 1, 0, 0.09411765, 1,
2.299938, 0.4767074, 0.6820467, 1, 0, 0.09019608, 1,
2.409893, -1.493348, 0.772418, 1, 0, 0.08235294, 1,
2.468821, -0.3483632, 1.342536, 1, 0, 0.07843138, 1,
2.573414, 0.4447467, 0.2482795, 1, 0, 0.07058824, 1,
2.650829, 1.268029, 1.899634, 1, 0, 0.06666667, 1,
2.671951, 2.228891, 0.2818902, 1, 0, 0.05882353, 1,
2.773159, 1.762249, -0.00101363, 1, 0, 0.05490196, 1,
2.783366, -0.6031131, 1.885643, 1, 0, 0.04705882, 1,
2.789751, 1.707363, 0.8120206, 1, 0, 0.04313726, 1,
2.834181, -0.6535671, 2.187916, 1, 0, 0.03529412, 1,
2.843382, 0.1536587, 0.6417981, 1, 0, 0.03137255, 1,
2.919966, -0.5820182, 2.726076, 1, 0, 0.02352941, 1,
3.138524, 0.7355906, -1.054292, 1, 0, 0.01960784, 1,
3.508649, 0.5907848, 1.581214, 1, 0, 0.01176471, 1,
3.701421, -0.1412981, 2.235066, 1, 0, 0.007843138, 1
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
0.3258342, -3.755541, -7.544857, 0, -0.5, 0.5, 0.5,
0.3258342, -3.755541, -7.544857, 1, -0.5, 0.5, 0.5,
0.3258342, -3.755541, -7.544857, 1, 1.5, 0.5, 0.5,
0.3258342, -3.755541, -7.544857, 0, 1.5, 0.5, 0.5
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
-4.194077, 0.3667669, -7.544857, 0, -0.5, 0.5, 0.5,
-4.194077, 0.3667669, -7.544857, 1, -0.5, 0.5, 0.5,
-4.194077, 0.3667669, -7.544857, 1, 1.5, 0.5, 0.5,
-4.194077, 0.3667669, -7.544857, 0, 1.5, 0.5, 0.5
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
-4.194077, -3.755541, 0.1192782, 0, -0.5, 0.5, 0.5,
-4.194077, -3.755541, 0.1192782, 1, -0.5, 0.5, 0.5,
-4.194077, -3.755541, 0.1192782, 1, 1.5, 0.5, 0.5,
-4.194077, -3.755541, 0.1192782, 0, 1.5, 0.5, 0.5
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
-3, -2.804239, -5.77621,
3, -2.804239, -5.77621,
-3, -2.804239, -5.77621,
-3, -2.96279, -6.070985,
-2, -2.804239, -5.77621,
-2, -2.96279, -6.070985,
-1, -2.804239, -5.77621,
-1, -2.96279, -6.070985,
0, -2.804239, -5.77621,
0, -2.96279, -6.070985,
1, -2.804239, -5.77621,
1, -2.96279, -6.070985,
2, -2.804239, -5.77621,
2, -2.96279, -6.070985,
3, -2.804239, -5.77621,
3, -2.96279, -6.070985
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
-3, -3.27989, -6.660533, 0, -0.5, 0.5, 0.5,
-3, -3.27989, -6.660533, 1, -0.5, 0.5, 0.5,
-3, -3.27989, -6.660533, 1, 1.5, 0.5, 0.5,
-3, -3.27989, -6.660533, 0, 1.5, 0.5, 0.5,
-2, -3.27989, -6.660533, 0, -0.5, 0.5, 0.5,
-2, -3.27989, -6.660533, 1, -0.5, 0.5, 0.5,
-2, -3.27989, -6.660533, 1, 1.5, 0.5, 0.5,
-2, -3.27989, -6.660533, 0, 1.5, 0.5, 0.5,
-1, -3.27989, -6.660533, 0, -0.5, 0.5, 0.5,
-1, -3.27989, -6.660533, 1, -0.5, 0.5, 0.5,
-1, -3.27989, -6.660533, 1, 1.5, 0.5, 0.5,
-1, -3.27989, -6.660533, 0, 1.5, 0.5, 0.5,
0, -3.27989, -6.660533, 0, -0.5, 0.5, 0.5,
0, -3.27989, -6.660533, 1, -0.5, 0.5, 0.5,
0, -3.27989, -6.660533, 1, 1.5, 0.5, 0.5,
0, -3.27989, -6.660533, 0, 1.5, 0.5, 0.5,
1, -3.27989, -6.660533, 0, -0.5, 0.5, 0.5,
1, -3.27989, -6.660533, 1, -0.5, 0.5, 0.5,
1, -3.27989, -6.660533, 1, 1.5, 0.5, 0.5,
1, -3.27989, -6.660533, 0, 1.5, 0.5, 0.5,
2, -3.27989, -6.660533, 0, -0.5, 0.5, 0.5,
2, -3.27989, -6.660533, 1, -0.5, 0.5, 0.5,
2, -3.27989, -6.660533, 1, 1.5, 0.5, 0.5,
2, -3.27989, -6.660533, 0, 1.5, 0.5, 0.5,
3, -3.27989, -6.660533, 0, -0.5, 0.5, 0.5,
3, -3.27989, -6.660533, 1, -0.5, 0.5, 0.5,
3, -3.27989, -6.660533, 1, 1.5, 0.5, 0.5,
3, -3.27989, -6.660533, 0, 1.5, 0.5, 0.5
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
-3.15102, -2, -5.77621,
-3.15102, 3, -5.77621,
-3.15102, -2, -5.77621,
-3.324863, -2, -6.070985,
-3.15102, -1, -5.77621,
-3.324863, -1, -6.070985,
-3.15102, 0, -5.77621,
-3.324863, 0, -6.070985,
-3.15102, 1, -5.77621,
-3.324863, 1, -6.070985,
-3.15102, 2, -5.77621,
-3.324863, 2, -6.070985,
-3.15102, 3, -5.77621,
-3.324863, 3, -6.070985
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
-3.672549, -2, -6.660533, 0, -0.5, 0.5, 0.5,
-3.672549, -2, -6.660533, 1, -0.5, 0.5, 0.5,
-3.672549, -2, -6.660533, 1, 1.5, 0.5, 0.5,
-3.672549, -2, -6.660533, 0, 1.5, 0.5, 0.5,
-3.672549, -1, -6.660533, 0, -0.5, 0.5, 0.5,
-3.672549, -1, -6.660533, 1, -0.5, 0.5, 0.5,
-3.672549, -1, -6.660533, 1, 1.5, 0.5, 0.5,
-3.672549, -1, -6.660533, 0, 1.5, 0.5, 0.5,
-3.672549, 0, -6.660533, 0, -0.5, 0.5, 0.5,
-3.672549, 0, -6.660533, 1, -0.5, 0.5, 0.5,
-3.672549, 0, -6.660533, 1, 1.5, 0.5, 0.5,
-3.672549, 0, -6.660533, 0, 1.5, 0.5, 0.5,
-3.672549, 1, -6.660533, 0, -0.5, 0.5, 0.5,
-3.672549, 1, -6.660533, 1, -0.5, 0.5, 0.5,
-3.672549, 1, -6.660533, 1, 1.5, 0.5, 0.5,
-3.672549, 1, -6.660533, 0, 1.5, 0.5, 0.5,
-3.672549, 2, -6.660533, 0, -0.5, 0.5, 0.5,
-3.672549, 2, -6.660533, 1, -0.5, 0.5, 0.5,
-3.672549, 2, -6.660533, 1, 1.5, 0.5, 0.5,
-3.672549, 2, -6.660533, 0, 1.5, 0.5, 0.5,
-3.672549, 3, -6.660533, 0, -0.5, 0.5, 0.5,
-3.672549, 3, -6.660533, 1, -0.5, 0.5, 0.5,
-3.672549, 3, -6.660533, 1, 1.5, 0.5, 0.5,
-3.672549, 3, -6.660533, 0, 1.5, 0.5, 0.5
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
-3.15102, -2.804239, -4,
-3.15102, -2.804239, 4,
-3.15102, -2.804239, -4,
-3.324863, -2.96279, -4,
-3.15102, -2.804239, -2,
-3.324863, -2.96279, -2,
-3.15102, -2.804239, 0,
-3.324863, -2.96279, 0,
-3.15102, -2.804239, 2,
-3.324863, -2.96279, 2,
-3.15102, -2.804239, 4,
-3.324863, -2.96279, 4
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
-3.672549, -3.27989, -4, 0, -0.5, 0.5, 0.5,
-3.672549, -3.27989, -4, 1, -0.5, 0.5, 0.5,
-3.672549, -3.27989, -4, 1, 1.5, 0.5, 0.5,
-3.672549, -3.27989, -4, 0, 1.5, 0.5, 0.5,
-3.672549, -3.27989, -2, 0, -0.5, 0.5, 0.5,
-3.672549, -3.27989, -2, 1, -0.5, 0.5, 0.5,
-3.672549, -3.27989, -2, 1, 1.5, 0.5, 0.5,
-3.672549, -3.27989, -2, 0, 1.5, 0.5, 0.5,
-3.672549, -3.27989, 0, 0, -0.5, 0.5, 0.5,
-3.672549, -3.27989, 0, 1, -0.5, 0.5, 0.5,
-3.672549, -3.27989, 0, 1, 1.5, 0.5, 0.5,
-3.672549, -3.27989, 0, 0, 1.5, 0.5, 0.5,
-3.672549, -3.27989, 2, 0, -0.5, 0.5, 0.5,
-3.672549, -3.27989, 2, 1, -0.5, 0.5, 0.5,
-3.672549, -3.27989, 2, 1, 1.5, 0.5, 0.5,
-3.672549, -3.27989, 2, 0, 1.5, 0.5, 0.5,
-3.672549, -3.27989, 4, 0, -0.5, 0.5, 0.5,
-3.672549, -3.27989, 4, 1, -0.5, 0.5, 0.5,
-3.672549, -3.27989, 4, 1, 1.5, 0.5, 0.5,
-3.672549, -3.27989, 4, 0, 1.5, 0.5, 0.5
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
-3.15102, -2.804239, -5.77621,
-3.15102, 3.537773, -5.77621,
-3.15102, -2.804239, 6.014767,
-3.15102, 3.537773, 6.014767,
-3.15102, -2.804239, -5.77621,
-3.15102, -2.804239, 6.014767,
-3.15102, 3.537773, -5.77621,
-3.15102, 3.537773, 6.014767,
-3.15102, -2.804239, -5.77621,
3.802689, -2.804239, -5.77621,
-3.15102, -2.804239, 6.014767,
3.802689, -2.804239, 6.014767,
-3.15102, 3.537773, -5.77621,
3.802689, 3.537773, -5.77621,
-3.15102, 3.537773, 6.014767,
3.802689, 3.537773, 6.014767,
3.802689, -2.804239, -5.77621,
3.802689, 3.537773, -5.77621,
3.802689, -2.804239, 6.014767,
3.802689, 3.537773, 6.014767,
3.802689, -2.804239, -5.77621,
3.802689, -2.804239, 6.014767,
3.802689, 3.537773, -5.77621,
3.802689, 3.537773, 6.014767
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
var radius = 8.055895;
var distance = 35.84159;
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
mvMatrix.translate( -0.3258342, -0.3667669, -0.1192782 );
mvMatrix.scale( 1.252596, 1.373411, 0.7387167 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.84159);
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
myclobutanil<-read.table("myclobutanil.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-myclobutanil$V2
```

```
## Error in eval(expr, envir, enclos): object 'myclobutanil' not found
```

```r
y<-myclobutanil$V3
```

```
## Error in eval(expr, envir, enclos): object 'myclobutanil' not found
```

```r
z<-myclobutanil$V4
```

```
## Error in eval(expr, envir, enclos): object 'myclobutanil' not found
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
-3.049753, -2.483386, -3.084718, 0, 0, 1, 1, 1,
-2.883275, 1.496573, -1.55553, 1, 0, 0, 1, 1,
-2.831219, -0.6916456, -0.9592394, 1, 0, 0, 1, 1,
-2.737255, -0.8553418, -2.682149, 1, 0, 0, 1, 1,
-2.723131, 0.08256443, -3.114046, 1, 0, 0, 1, 1,
-2.651701, -1.049765, -1.727443, 1, 0, 0, 1, 1,
-2.527478, 0.5641001, 0.4736106, 0, 0, 0, 1, 1,
-2.424057, -0.7990366, -1.562449, 0, 0, 0, 1, 1,
-2.359699, -0.0912369, -1.924053, 0, 0, 0, 1, 1,
-2.312262, -0.8511256, -0.769303, 0, 0, 0, 1, 1,
-2.263991, -0.01289752, 0.02935397, 0, 0, 0, 1, 1,
-2.228557, -1.873726, -3.545245, 0, 0, 0, 1, 1,
-2.185376, 0.5559967, -0.5911009, 0, 0, 0, 1, 1,
-2.176312, 0.6002001, -2.490183, 1, 1, 1, 1, 1,
-2.175535, -0.004039784, 0.188897, 1, 1, 1, 1, 1,
-2.156402, 0.1567909, -0.1446806, 1, 1, 1, 1, 1,
-2.109212, 0.4200975, -1.820648, 1, 1, 1, 1, 1,
-2.10165, -1.052838, -2.056959, 1, 1, 1, 1, 1,
-2.086265, -0.007589579, -1.77751, 1, 1, 1, 1, 1,
-2.066251, -1.361793, -1.246457, 1, 1, 1, 1, 1,
-2.065907, 0.903613, -0.7155078, 1, 1, 1, 1, 1,
-2.064597, -0.5131249, -2.178195, 1, 1, 1, 1, 1,
-2.017921, 1.70774, -1.668171, 1, 1, 1, 1, 1,
-2.005875, -0.8614364, -0.9090583, 1, 1, 1, 1, 1,
-1.969691, -0.1355422, -1.400241, 1, 1, 1, 1, 1,
-1.956886, -0.6138657, -2.082788, 1, 1, 1, 1, 1,
-1.933172, 0.5065351, -0.7248314, 1, 1, 1, 1, 1,
-1.884397, 0.6327859, -1.534581, 1, 1, 1, 1, 1,
-1.865088, 0.07271536, -2.870973, 0, 0, 1, 1, 1,
-1.864456, 1.122785, -1.147674, 1, 0, 0, 1, 1,
-1.856914, 0.1915706, 0.5772609, 1, 0, 0, 1, 1,
-1.84688, 0.5994481, -0.3630855, 1, 0, 0, 1, 1,
-1.84535, -1.586824, -3.872546, 1, 0, 0, 1, 1,
-1.841865, 0.5614733, -0.6004424, 1, 0, 0, 1, 1,
-1.811084, -1.410497, -1.223181, 0, 0, 0, 1, 1,
-1.808631, -0.8743233, -2.844107, 0, 0, 0, 1, 1,
-1.803171, -0.3398451, -0.4859753, 0, 0, 0, 1, 1,
-1.799414, 0.6260336, -0.8391746, 0, 0, 0, 1, 1,
-1.797631, -1.43711, -1.111006, 0, 0, 0, 1, 1,
-1.791282, 0.185464, -2.061841, 0, 0, 0, 1, 1,
-1.782296, -0.6210019, -2.388626, 0, 0, 0, 1, 1,
-1.769895, 1.404126, -0.5985799, 1, 1, 1, 1, 1,
-1.768131, -1.381837, -3.112484, 1, 1, 1, 1, 1,
-1.767458, -0.7014493, -0.7838642, 1, 1, 1, 1, 1,
-1.764818, 0.6066124, -2.679447, 1, 1, 1, 1, 1,
-1.764229, -0.5288815, -1.188769, 1, 1, 1, 1, 1,
-1.750499, -0.09855659, -0.1028089, 1, 1, 1, 1, 1,
-1.744366, -0.3749514, -2.921983, 1, 1, 1, 1, 1,
-1.720158, -0.2932182, -0.3851801, 1, 1, 1, 1, 1,
-1.665254, -1.076413, -3.219973, 1, 1, 1, 1, 1,
-1.651244, 0.1339152, -1.766944, 1, 1, 1, 1, 1,
-1.647104, 0.3115469, -2.703324, 1, 1, 1, 1, 1,
-1.646569, -0.5897228, -2.163893, 1, 1, 1, 1, 1,
-1.641914, -0.7134488, -2.694633, 1, 1, 1, 1, 1,
-1.635959, 0.7838886, -1.007207, 1, 1, 1, 1, 1,
-1.625607, 0.2565724, -2.571158, 1, 1, 1, 1, 1,
-1.615568, 2.640212, -0.4792282, 0, 0, 1, 1, 1,
-1.601696, -0.03021288, -1.677645, 1, 0, 0, 1, 1,
-1.60157, -0.1794422, -2.216774, 1, 0, 0, 1, 1,
-1.600989, -0.0878151, -1.14187, 1, 0, 0, 1, 1,
-1.597665, 0.6813365, -1.19781, 1, 0, 0, 1, 1,
-1.594695, 2.87998, -0.63145, 1, 0, 0, 1, 1,
-1.584191, 0.3150787, -2.86071, 0, 0, 0, 1, 1,
-1.581396, 0.7962726, -0.8736596, 0, 0, 0, 1, 1,
-1.569256, -0.3705518, -2.069145, 0, 0, 0, 1, 1,
-1.561071, -0.5921159, -2.847792, 0, 0, 0, 1, 1,
-1.55285, -0.3476288, -1.956392, 0, 0, 0, 1, 1,
-1.544901, -0.6172771, -1.695103, 0, 0, 0, 1, 1,
-1.540164, 0.9400785, -1.036228, 0, 0, 0, 1, 1,
-1.529891, -1.214948, -1.730192, 1, 1, 1, 1, 1,
-1.524418, 0.2462011, -2.128613, 1, 1, 1, 1, 1,
-1.513319, -0.3154574, -4.754759, 1, 1, 1, 1, 1,
-1.505793, -0.2459676, -1.477124, 1, 1, 1, 1, 1,
-1.498677, 0.07258755, -3.901601, 1, 1, 1, 1, 1,
-1.490824, 0.6466658, -0.8979792, 1, 1, 1, 1, 1,
-1.465259, 0.8107924, -0.3112996, 1, 1, 1, 1, 1,
-1.463984, -1.123839, -1.786136, 1, 1, 1, 1, 1,
-1.4467, 0.1442186, -2.481161, 1, 1, 1, 1, 1,
-1.441127, 1.132332, -1.676223, 1, 1, 1, 1, 1,
-1.44112, 0.1678714, -1.453669, 1, 1, 1, 1, 1,
-1.434942, -0.5244881, -0.905156, 1, 1, 1, 1, 1,
-1.429061, -0.6750177, -2.922871, 1, 1, 1, 1, 1,
-1.42525, -0.1285874, -2.62884, 1, 1, 1, 1, 1,
-1.399562, 0.1575978, -3.010901, 1, 1, 1, 1, 1,
-1.398693, 0.01610726, -2.270165, 0, 0, 1, 1, 1,
-1.395938, 0.1445383, 0.1640441, 1, 0, 0, 1, 1,
-1.393951, 0.2946772, -1.58113, 1, 0, 0, 1, 1,
-1.390277, 1.98427, -1.100833, 1, 0, 0, 1, 1,
-1.376858, 1.599861, -1.691437, 1, 0, 0, 1, 1,
-1.373823, -0.3649275, -0.6554144, 1, 0, 0, 1, 1,
-1.363724, 1.786871, -1.574444, 0, 0, 0, 1, 1,
-1.341295, 1.080043, 1.12671, 0, 0, 0, 1, 1,
-1.328929, -2.00561, -2.448802, 0, 0, 0, 1, 1,
-1.327089, -0.5947365, -2.885663, 0, 0, 0, 1, 1,
-1.321644, 0.09818009, -0.6854182, 0, 0, 0, 1, 1,
-1.319624, -1.100562, -1.858503, 0, 0, 0, 1, 1,
-1.31953, -0.2853515, -2.240216, 0, 0, 0, 1, 1,
-1.318148, -0.7705747, -0.5365583, 1, 1, 1, 1, 1,
-1.314693, -0.9588712, -2.050503, 1, 1, 1, 1, 1,
-1.312837, -1.962944, -2.645564, 1, 1, 1, 1, 1,
-1.312476, 1.330851, -0.8795214, 1, 1, 1, 1, 1,
-1.310109, 1.779437, -0.9839484, 1, 1, 1, 1, 1,
-1.307141, 0.005292109, -2.984508, 1, 1, 1, 1, 1,
-1.302008, 1.893677, 0.2480855, 1, 1, 1, 1, 1,
-1.288215, -1.565862, -3.333802, 1, 1, 1, 1, 1,
-1.282548, 0.6458605, -1.161569, 1, 1, 1, 1, 1,
-1.270383, -0.9104997, -1.803519, 1, 1, 1, 1, 1,
-1.270087, 0.6805355, -1.291798, 1, 1, 1, 1, 1,
-1.264033, 0.2113948, -0.7266309, 1, 1, 1, 1, 1,
-1.254946, -0.8540743, -2.044146, 1, 1, 1, 1, 1,
-1.25484, 0.1337454, -0.5890597, 1, 1, 1, 1, 1,
-1.250798, 0.1253508, -1.256475, 1, 1, 1, 1, 1,
-1.239522, 0.3638417, 0.5197238, 0, 0, 1, 1, 1,
-1.237669, 2.701689, -0.2125528, 1, 0, 0, 1, 1,
-1.233205, -0.4420716, -0.3756794, 1, 0, 0, 1, 1,
-1.226606, -0.141615, -3.735121, 1, 0, 0, 1, 1,
-1.226037, -1.235795, -0.9724394, 1, 0, 0, 1, 1,
-1.217417, -1.586534, -2.269747, 1, 0, 0, 1, 1,
-1.208019, -1.77483, -3.487792, 0, 0, 0, 1, 1,
-1.200976, -0.4653392, -2.296658, 0, 0, 0, 1, 1,
-1.198723, 1.147053, -1.780594, 0, 0, 0, 1, 1,
-1.19801, -1.772925, -0.9853564, 0, 0, 0, 1, 1,
-1.197747, -0.4248852, 0.5254574, 0, 0, 0, 1, 1,
-1.195256, 0.328751, -0.002104971, 0, 0, 0, 1, 1,
-1.182396, -0.01045176, -0.7721695, 0, 0, 0, 1, 1,
-1.168346, -0.2819282, -2.277972, 1, 1, 1, 1, 1,
-1.157553, -2.14046, -0.9407656, 1, 1, 1, 1, 1,
-1.155984, 1.351299, -0.9395208, 1, 1, 1, 1, 1,
-1.152905, 1.932914, -1.09695, 1, 1, 1, 1, 1,
-1.143468, -0.9950846, -1.555671, 1, 1, 1, 1, 1,
-1.139601, -0.7160067, -3.803808, 1, 1, 1, 1, 1,
-1.133499, -0.632826, -2.905618, 1, 1, 1, 1, 1,
-1.12751, -0.5083838, -1.758239, 1, 1, 1, 1, 1,
-1.112561, 0.0272508, -1.896064, 1, 1, 1, 1, 1,
-1.108333, -1.362599, -1.063808, 1, 1, 1, 1, 1,
-1.092561, 1.399215, -0.8400036, 1, 1, 1, 1, 1,
-1.091746, 0.02881782, -0.6970097, 1, 1, 1, 1, 1,
-1.091505, 0.7649399, -0.967728, 1, 1, 1, 1, 1,
-1.0902, 0.5930625, 0.1286358, 1, 1, 1, 1, 1,
-1.088583, -0.6262205, -2.413655, 1, 1, 1, 1, 1,
-1.083609, -0.1257735, -1.230698, 0, 0, 1, 1, 1,
-1.079986, 1.167096, -0.9934304, 1, 0, 0, 1, 1,
-1.079091, -0.04249874, -1.803845, 1, 0, 0, 1, 1,
-1.070663, 0.5758787, -1.583165, 1, 0, 0, 1, 1,
-1.070173, -0.7317381, -2.573719, 1, 0, 0, 1, 1,
-1.065868, -0.2374433, -1.909666, 1, 0, 0, 1, 1,
-1.065326, 1.94589, 0.798025, 0, 0, 0, 1, 1,
-1.061643, 0.5793092, -2.859398, 0, 0, 0, 1, 1,
-1.060414, -0.5496217, -0.7579272, 0, 0, 0, 1, 1,
-1.054372, -1.03375, -4.167576, 0, 0, 0, 1, 1,
-1.048139, 0.8666008, -1.609692, 0, 0, 0, 1, 1,
-1.038267, 0.4174721, -1.237313, 0, 0, 0, 1, 1,
-1.034854, 0.009335849, -4.32376, 0, 0, 0, 1, 1,
-1.028634, -0.8482904, -1.823979, 1, 1, 1, 1, 1,
-1.0199, 0.0619708, -0.1051035, 1, 1, 1, 1, 1,
-1.016432, 1.698324, -1.245923, 1, 1, 1, 1, 1,
-1.01225, 1.664184, -1.554861, 1, 1, 1, 1, 1,
-1.00748, -0.9259301, -3.423345, 1, 1, 1, 1, 1,
-1.003257, -2.349093, -2.465692, 1, 1, 1, 1, 1,
-0.9999818, 1.543062, 0.0165938, 1, 1, 1, 1, 1,
-0.9957333, 1.507745, -1.033539, 1, 1, 1, 1, 1,
-0.9918804, -1.313377, -1.962955, 1, 1, 1, 1, 1,
-0.9885967, -1.248083, -2.85204, 1, 1, 1, 1, 1,
-0.9858063, 0.7190024, 0.2609664, 1, 1, 1, 1, 1,
-0.9763593, -0.6503881, -5.604497, 1, 1, 1, 1, 1,
-0.9681895, -2.446432, -3.544568, 1, 1, 1, 1, 1,
-0.9546377, 0.3399805, -3.32306, 1, 1, 1, 1, 1,
-0.9528998, -2.304964, -1.667907, 1, 1, 1, 1, 1,
-0.9487236, -0.835495, -1.38003, 0, 0, 1, 1, 1,
-0.9463224, -0.101711, -1.833984, 1, 0, 0, 1, 1,
-0.9452292, 0.8543276, -0.5161217, 1, 0, 0, 1, 1,
-0.9448032, -0.7190199, -2.983562, 1, 0, 0, 1, 1,
-0.9426664, 0.3064351, -1.67679, 1, 0, 0, 1, 1,
-0.9353464, -0.3625433, -2.138801, 1, 0, 0, 1, 1,
-0.9283222, 0.02995025, -1.389275, 0, 0, 0, 1, 1,
-0.9236219, -0.9137466, -1.700279, 0, 0, 0, 1, 1,
-0.9225219, -0.8198948, -2.716068, 0, 0, 0, 1, 1,
-0.9209688, -0.3991329, -2.027469, 0, 0, 0, 1, 1,
-0.9093904, -1.32704, -0.8506546, 0, 0, 0, 1, 1,
-0.9031395, 1.437992, 0.002525317, 0, 0, 0, 1, 1,
-0.8940077, 1.907374, -0.4315659, 0, 0, 0, 1, 1,
-0.8914382, 1.656808, -1.36138, 1, 1, 1, 1, 1,
-0.8904481, -0.2458332, -1.554429, 1, 1, 1, 1, 1,
-0.8870153, -2.093995, -4.104569, 1, 1, 1, 1, 1,
-0.8771194, -0.4906134, -3.470646, 1, 1, 1, 1, 1,
-0.8689498, -1.308639, -1.718145, 1, 1, 1, 1, 1,
-0.8668134, 0.2014044, -2.948533, 1, 1, 1, 1, 1,
-0.8630199, -1.360353, -1.903412, 1, 1, 1, 1, 1,
-0.8618197, 0.5555031, -1.17885, 1, 1, 1, 1, 1,
-0.8607265, 1.904245, 0.02104022, 1, 1, 1, 1, 1,
-0.8550394, 1.630439, -1.233199, 1, 1, 1, 1, 1,
-0.8473189, 0.1883929, -0.9117666, 1, 1, 1, 1, 1,
-0.8452892, 0.02218876, -1.888625, 1, 1, 1, 1, 1,
-0.8424332, -1.004166, -1.058351, 1, 1, 1, 1, 1,
-0.8386093, 0.08048772, -4.079751, 1, 1, 1, 1, 1,
-0.834769, 0.6382895, -0.8877716, 1, 1, 1, 1, 1,
-0.8318854, -0.2644912, -1.828686, 0, 0, 1, 1, 1,
-0.8314005, -0.2976921, -3.673215, 1, 0, 0, 1, 1,
-0.8311828, -0.4577065, -1.004222, 1, 0, 0, 1, 1,
-0.8216496, -1.357647, -3.911801, 1, 0, 0, 1, 1,
-0.8204015, 0.02371999, -0.4935163, 1, 0, 0, 1, 1,
-0.8180595, -0.5024085, -1.721022, 1, 0, 0, 1, 1,
-0.8139173, 0.1138592, -2.035014, 0, 0, 0, 1, 1,
-0.8101872, -0.2001459, -2.134156, 0, 0, 0, 1, 1,
-0.8070388, -0.04382078, -0.6528036, 0, 0, 0, 1, 1,
-0.8000513, -1.042734, -2.710897, 0, 0, 0, 1, 1,
-0.7975196, -2.71188, -4.918639, 0, 0, 0, 1, 1,
-0.7888262, 0.2720349, -1.224241, 0, 0, 0, 1, 1,
-0.7882295, 0.553579, 0.5899173, 0, 0, 0, 1, 1,
-0.7854934, 0.4165383, -1.070239, 1, 1, 1, 1, 1,
-0.7808967, 0.7133809, -2.229811, 1, 1, 1, 1, 1,
-0.7740633, -1.535858, -4.384358, 1, 1, 1, 1, 1,
-0.7729044, -1.270917, -2.629273, 1, 1, 1, 1, 1,
-0.7710237, -1.298538, -2.342568, 1, 1, 1, 1, 1,
-0.7700396, -0.5714335, -2.844169, 1, 1, 1, 1, 1,
-0.7612203, -0.02097617, -0.9239857, 1, 1, 1, 1, 1,
-0.7590518, -0.2196405, -1.547566, 1, 1, 1, 1, 1,
-0.7582083, -0.03352777, -2.444245, 1, 1, 1, 1, 1,
-0.7431741, -1.082708, -2.722541, 1, 1, 1, 1, 1,
-0.7425818, 1.751894, 1.502141, 1, 1, 1, 1, 1,
-0.742256, -0.2886221, -2.351797, 1, 1, 1, 1, 1,
-0.7422128, -1.736089, -2.732332, 1, 1, 1, 1, 1,
-0.7399513, 0.6912915, -1.445918, 1, 1, 1, 1, 1,
-0.7396596, 1.956156, -1.935985, 1, 1, 1, 1, 1,
-0.7371017, -0.4823005, -1.538835, 0, 0, 1, 1, 1,
-0.7348627, -1.950569, -1.659513, 1, 0, 0, 1, 1,
-0.7335204, 0.7302457, -0.03735212, 1, 0, 0, 1, 1,
-0.7313106, 0.6084589, -1.41071, 1, 0, 0, 1, 1,
-0.7252403, -0.2313322, 0.7003058, 1, 0, 0, 1, 1,
-0.7243594, -0.7904624, -1.933072, 1, 0, 0, 1, 1,
-0.7240007, -0.8707721, -1.539641, 0, 0, 0, 1, 1,
-0.7231084, 0.1388798, -2.255975, 0, 0, 0, 1, 1,
-0.721972, -1.356655, -1.600146, 0, 0, 0, 1, 1,
-0.7218596, -1.325029, -2.828729, 0, 0, 0, 1, 1,
-0.7167481, 0.05928212, -1.042881, 0, 0, 0, 1, 1,
-0.7115115, -0.4612174, -3.712291, 0, 0, 0, 1, 1,
-0.7096582, 0.04228346, -1.653655, 0, 0, 0, 1, 1,
-0.7082241, 0.6975455, -0.4840031, 1, 1, 1, 1, 1,
-0.7067491, -0.6374882, -3.913888, 1, 1, 1, 1, 1,
-0.7063421, -0.03660229, -1.445996, 1, 1, 1, 1, 1,
-0.7060487, -0.1973936, -2.049239, 1, 1, 1, 1, 1,
-0.7003969, 0.8699335, -0.3850311, 1, 1, 1, 1, 1,
-0.6953208, 1.517922, -0.01907864, 1, 1, 1, 1, 1,
-0.6934726, 2.892992, 0.7831224, 1, 1, 1, 1, 1,
-0.688988, 0.5166074, -0.03455683, 1, 1, 1, 1, 1,
-0.6866975, -0.5538908, -2.682532, 1, 1, 1, 1, 1,
-0.6853955, -0.2406979, -2.357958, 1, 1, 1, 1, 1,
-0.6790973, -0.8898185, -3.430028, 1, 1, 1, 1, 1,
-0.6765727, 0.3494958, -0.7629765, 1, 1, 1, 1, 1,
-0.6625704, -1.501633, -3.700485, 1, 1, 1, 1, 1,
-0.6597642, 0.4560514, -0.2785311, 1, 1, 1, 1, 1,
-0.6569872, 0.7241758, -0.3445413, 1, 1, 1, 1, 1,
-0.6558655, -1.297253, -2.582747, 0, 0, 1, 1, 1,
-0.6539525, -0.6444232, -0.9277636, 1, 0, 0, 1, 1,
-0.649373, -0.2629884, -1.596135, 1, 0, 0, 1, 1,
-0.6482987, -0.1803385, -1.618875, 1, 0, 0, 1, 1,
-0.6481021, 1.333635, -1.267522, 1, 0, 0, 1, 1,
-0.6429144, 0.0405562, -2.428155, 1, 0, 0, 1, 1,
-0.640333, 0.7317367, -0.6718096, 0, 0, 0, 1, 1,
-0.6343806, 0.4884573, -0.6259982, 0, 0, 0, 1, 1,
-0.631498, 1.279974, -0.7940196, 0, 0, 0, 1, 1,
-0.6312695, -0.3370185, -3.306339, 0, 0, 0, 1, 1,
-0.6294284, 0.3487051, -0.8302035, 0, 0, 0, 1, 1,
-0.626048, 1.284902, -1.156299, 0, 0, 0, 1, 1,
-0.6240495, 0.4147936, -1.980006, 0, 0, 0, 1, 1,
-0.6233801, -0.7077819, -1.434121, 1, 1, 1, 1, 1,
-0.6189737, 1.574347, -0.3115182, 1, 1, 1, 1, 1,
-0.618136, -0.1813291, -2.370891, 1, 1, 1, 1, 1,
-0.6157684, 1.025378, -0.4205884, 1, 1, 1, 1, 1,
-0.6102247, 0.8239618, 0.573688, 1, 1, 1, 1, 1,
-0.6027039, -0.5126566, -2.704698, 1, 1, 1, 1, 1,
-0.5992168, 1.462961, -0.2547145, 1, 1, 1, 1, 1,
-0.5958637, 0.3131202, -0.4958014, 1, 1, 1, 1, 1,
-0.594932, 0.05971314, -0.5840151, 1, 1, 1, 1, 1,
-0.594035, 0.4363219, -2.785758, 1, 1, 1, 1, 1,
-0.5919715, -0.4398317, -0.6969545, 1, 1, 1, 1, 1,
-0.5907258, -0.4900943, -2.240304, 1, 1, 1, 1, 1,
-0.5873098, 2.410001, -0.1260466, 1, 1, 1, 1, 1,
-0.5814336, 0.1543387, -0.9001707, 1, 1, 1, 1, 1,
-0.5789096, -0.02827003, -1.198304, 1, 1, 1, 1, 1,
-0.5788237, 0.9289456, -0.1330772, 0, 0, 1, 1, 1,
-0.5745749, 1.786779, -0.6823536, 1, 0, 0, 1, 1,
-0.5694891, 0.377907, -1.422826, 1, 0, 0, 1, 1,
-0.5685763, 0.08792935, -0.8820049, 1, 0, 0, 1, 1,
-0.5663118, -2.118672, -1.682337, 1, 0, 0, 1, 1,
-0.5662608, 0.9677816, 0.2093898, 1, 0, 0, 1, 1,
-0.5658529, 0.2927204, -1.51528, 0, 0, 0, 1, 1,
-0.5592475, 1.582203, -1.167747, 0, 0, 0, 1, 1,
-0.5586228, 0.1056026, -1.577322, 0, 0, 0, 1, 1,
-0.5580769, -0.0470095, -2.435555, 0, 0, 0, 1, 1,
-0.5572949, 0.1679465, -1.656765, 0, 0, 0, 1, 1,
-0.5557535, 0.2703175, -0.3390143, 0, 0, 0, 1, 1,
-0.549296, 0.2900791, -0.4824279, 0, 0, 0, 1, 1,
-0.5486462, -1.018871, -3.2525, 1, 1, 1, 1, 1,
-0.5406121, 1.089777, -0.5088074, 1, 1, 1, 1, 1,
-0.5355111, 1.212188, -0.9289223, 1, 1, 1, 1, 1,
-0.535341, 2.443534, -0.3686117, 1, 1, 1, 1, 1,
-0.533856, 1.90908, 0.614799, 1, 1, 1, 1, 1,
-0.5309398, 0.2484088, -2.425529, 1, 1, 1, 1, 1,
-0.5296772, -0.1458693, -0.4396469, 1, 1, 1, 1, 1,
-0.5285448, -0.1894835, -1.954927, 1, 1, 1, 1, 1,
-0.5229325, 2.860422, -1.31911, 1, 1, 1, 1, 1,
-0.5202733, 0.8413642, -1.120803, 1, 1, 1, 1, 1,
-0.5123524, 0.9356293, 0.1230316, 1, 1, 1, 1, 1,
-0.5119636, 0.2031631, -1.381582, 1, 1, 1, 1, 1,
-0.509067, 0.2893253, -0.8733411, 1, 1, 1, 1, 1,
-0.5055553, -0.4377538, -2.41479, 1, 1, 1, 1, 1,
-0.5053397, 0.2300052, 0.5413841, 1, 1, 1, 1, 1,
-0.5027792, -0.9282895, -2.952403, 0, 0, 1, 1, 1,
-0.5024319, 0.9574712, -0.4594993, 1, 0, 0, 1, 1,
-0.4944919, -0.525788, -2.280474, 1, 0, 0, 1, 1,
-0.4913003, -1.594207, -2.195829, 1, 0, 0, 1, 1,
-0.4846284, -0.902731, -3.627754, 1, 0, 0, 1, 1,
-0.4839298, -1.131234, -2.268815, 1, 0, 0, 1, 1,
-0.4817533, 0.5754402, -1.142081, 0, 0, 0, 1, 1,
-0.4742615, 1.899852, 0.6712582, 0, 0, 0, 1, 1,
-0.4736356, 1.054702, 0.8340583, 0, 0, 0, 1, 1,
-0.4722279, -0.3421669, -3.019296, 0, 0, 0, 1, 1,
-0.4680916, -0.8875703, -3.191999, 0, 0, 0, 1, 1,
-0.4677249, -0.4113158, -1.330923, 0, 0, 0, 1, 1,
-0.467301, -1.86906, -1.176949, 0, 0, 0, 1, 1,
-0.4659332, -0.5145819, -3.814844, 1, 1, 1, 1, 1,
-0.4634027, 0.1394311, -0.2410381, 1, 1, 1, 1, 1,
-0.4602675, -1.036943, -1.750643, 1, 1, 1, 1, 1,
-0.4553362, 1.768412, -0.1743545, 1, 1, 1, 1, 1,
-0.4518254, -0.913511, -2.863624, 1, 1, 1, 1, 1,
-0.4515409, -2.023315, -3.962084, 1, 1, 1, 1, 1,
-0.4461227, -1.395489, -3.524824, 1, 1, 1, 1, 1,
-0.4426814, 0.2394083, -1.640105, 1, 1, 1, 1, 1,
-0.4405955, -0.01308501, -0.6586827, 1, 1, 1, 1, 1,
-0.4368399, 0.07014685, -2.111835, 1, 1, 1, 1, 1,
-0.4351253, -1.054167, -2.926681, 1, 1, 1, 1, 1,
-0.4331714, 1.123005, 0.3287506, 1, 1, 1, 1, 1,
-0.4327615, -1.922818, -4.973939, 1, 1, 1, 1, 1,
-0.432706, 1.299925, -0.2881327, 1, 1, 1, 1, 1,
-0.4308552, -0.6485454, -3.697299, 1, 1, 1, 1, 1,
-0.4235769, 0.8257722, 0.8458555, 0, 0, 1, 1, 1,
-0.4232516, -1.949716, -0.8300558, 1, 0, 0, 1, 1,
-0.4215878, -0.2179199, -2.234074, 1, 0, 0, 1, 1,
-0.4207718, 0.4914809, -0.4141178, 1, 0, 0, 1, 1,
-0.4161356, -0.2447878, -1.053867, 1, 0, 0, 1, 1,
-0.4153328, -0.03559481, -2.431326, 1, 0, 0, 1, 1,
-0.4148929, 0.7278717, -1.57566, 0, 0, 0, 1, 1,
-0.4123927, 0.3707065, -1.13448, 0, 0, 0, 1, 1,
-0.4077605, 0.8133762, -0.6027532, 0, 0, 0, 1, 1,
-0.3990445, 0.1207481, -3.084593, 0, 0, 0, 1, 1,
-0.3959986, -0.228435, -2.67072, 0, 0, 0, 1, 1,
-0.3920459, 1.487044, -0.6318269, 0, 0, 0, 1, 1,
-0.3913444, -0.8872862, -2.930471, 0, 0, 0, 1, 1,
-0.388708, -1.64757, -3.040347, 1, 1, 1, 1, 1,
-0.3788894, -0.7948241, -2.589216, 1, 1, 1, 1, 1,
-0.3728271, -1.469057, -4.248025, 1, 1, 1, 1, 1,
-0.371511, -0.5235606, -1.842381, 1, 1, 1, 1, 1,
-0.369971, 0.270738, 0.2187772, 1, 1, 1, 1, 1,
-0.3667222, 1.20462, -0.4191252, 1, 1, 1, 1, 1,
-0.36613, 0.9113182, -1.589218, 1, 1, 1, 1, 1,
-0.3659119, 0.2326639, 0.1694307, 1, 1, 1, 1, 1,
-0.3615089, -1.35157, -2.144177, 1, 1, 1, 1, 1,
-0.3576927, 0.5448941, 0.1935087, 1, 1, 1, 1, 1,
-0.3571141, 0.8850138, -0.5852251, 1, 1, 1, 1, 1,
-0.354621, 0.1889028, 0.6063442, 1, 1, 1, 1, 1,
-0.3522051, -0.1719343, -2.738509, 1, 1, 1, 1, 1,
-0.3512045, -0.2235327, -1.785357, 1, 1, 1, 1, 1,
-0.3510412, -0.07852077, -1.297097, 1, 1, 1, 1, 1,
-0.3505901, -0.8458024, -3.12534, 0, 0, 1, 1, 1,
-0.3497475, 1.266679, -1.527332, 1, 0, 0, 1, 1,
-0.3491418, -0.3680681, 0.1388495, 1, 0, 0, 1, 1,
-0.3451499, 0.4664814, -1.132449, 1, 0, 0, 1, 1,
-0.3448345, 0.1662679, -0.8539649, 1, 0, 0, 1, 1,
-0.3431289, -0.3872501, -2.667196, 1, 0, 0, 1, 1,
-0.3429092, -0.3199557, -2.832264, 0, 0, 0, 1, 1,
-0.3427098, -0.2077083, -2.771121, 0, 0, 0, 1, 1,
-0.3384381, 2.193997, -0.9465635, 0, 0, 0, 1, 1,
-0.3374666, 1.27835, 0.3067853, 0, 0, 0, 1, 1,
-0.3331847, 0.1287124, 0.3091366, 0, 0, 0, 1, 1,
-0.3308895, 0.4724961, -1.45448, 0, 0, 0, 1, 1,
-0.3229693, -1.98054, -4.026187, 0, 0, 0, 1, 1,
-0.3186217, 0.3712426, -0.2948141, 1, 1, 1, 1, 1,
-0.3181978, 0.245205, -3.189395, 1, 1, 1, 1, 1,
-0.3181423, 0.07920241, -2.10534, 1, 1, 1, 1, 1,
-0.3164756, 1.413806, 0.7711172, 1, 1, 1, 1, 1,
-0.315089, 0.2940307, -0.06530752, 1, 1, 1, 1, 1,
-0.3135899, -0.8170185, -3.404875, 1, 1, 1, 1, 1,
-0.307623, 0.2878875, -0.5704432, 1, 1, 1, 1, 1,
-0.3046737, 1.204511, -1.632451, 1, 1, 1, 1, 1,
-0.3026646, -1.01571, -2.423362, 1, 1, 1, 1, 1,
-0.3001758, -0.04659376, -5.047635, 1, 1, 1, 1, 1,
-0.2922468, -2.237986, -3.481355, 1, 1, 1, 1, 1,
-0.2908201, 0.6600982, 0.2936603, 1, 1, 1, 1, 1,
-0.2880686, 0.211287, -2.087092, 1, 1, 1, 1, 1,
-0.2862627, 0.7605157, -3.139789, 1, 1, 1, 1, 1,
-0.2851146, 0.05725317, -0.889527, 1, 1, 1, 1, 1,
-0.2843209, -0.5050217, -2.955276, 0, 0, 1, 1, 1,
-0.2806671, -0.35662, -4.102942, 1, 0, 0, 1, 1,
-0.2741945, -0.7306867, -1.110323, 1, 0, 0, 1, 1,
-0.2741483, 0.9488193, -2.193605, 1, 0, 0, 1, 1,
-0.2714983, -1.124993, -4.828643, 1, 0, 0, 1, 1,
-0.268947, 0.1613222, -1.626336, 1, 0, 0, 1, 1,
-0.2668014, -0.8142102, -2.874586, 0, 0, 0, 1, 1,
-0.2640452, 0.282198, -0.8054482, 0, 0, 0, 1, 1,
-0.2629071, 0.3123768, 0.7623132, 0, 0, 0, 1, 1,
-0.2603573, -1.735633, -3.049744, 0, 0, 0, 1, 1,
-0.2589763, -1.690347, -1.973933, 0, 0, 0, 1, 1,
-0.2548265, 1.701225, -0.7172391, 0, 0, 0, 1, 1,
-0.2534434, -0.05945811, -1.219172, 0, 0, 0, 1, 1,
-0.2500271, 0.1788996, -0.6983461, 1, 1, 1, 1, 1,
-0.2482518, -0.6457127, -3.036932, 1, 1, 1, 1, 1,
-0.2480903, 1.225255, -1.429691, 1, 1, 1, 1, 1,
-0.2441426, 1.007629, -0.5918956, 1, 1, 1, 1, 1,
-0.2436672, 0.2854573, -0.7492115, 1, 1, 1, 1, 1,
-0.2402509, 0.5973701, -1.472586, 1, 1, 1, 1, 1,
-0.2372867, 0.7375043, -0.2730746, 1, 1, 1, 1, 1,
-0.2369196, -0.02631331, -2.758514, 1, 1, 1, 1, 1,
-0.2364929, -0.6594613, -4.665243, 1, 1, 1, 1, 1,
-0.2350204, -0.911118, -2.515254, 1, 1, 1, 1, 1,
-0.234599, 0.7488245, 1.355826, 1, 1, 1, 1, 1,
-0.2335426, -0.7422218, -2.80203, 1, 1, 1, 1, 1,
-0.2334137, -1.128658, -4.095393, 1, 1, 1, 1, 1,
-0.2332847, -1.396708, -1.57872, 1, 1, 1, 1, 1,
-0.2205575, 0.25404, -0.1439469, 1, 1, 1, 1, 1,
-0.2177881, -0.103484, -0.6075358, 0, 0, 1, 1, 1,
-0.2109423, 0.5579547, -1.249288, 1, 0, 0, 1, 1,
-0.2057709, 1.341657, -0.9164272, 1, 0, 0, 1, 1,
-0.2053756, 1.012279, 0.1968395, 1, 0, 0, 1, 1,
-0.2048771, 1.134731, -0.390666, 1, 0, 0, 1, 1,
-0.2037394, -1.590395, -3.486308, 1, 0, 0, 1, 1,
-0.2007515, 1.317405, -0.12913, 0, 0, 0, 1, 1,
-0.1992868, 1.440255, -0.3513115, 0, 0, 0, 1, 1,
-0.1984059, 0.8879971, 0.1331937, 0, 0, 0, 1, 1,
-0.197946, 0.8250799, -0.5578256, 0, 0, 0, 1, 1,
-0.196741, 0.2679556, -0.6153146, 0, 0, 0, 1, 1,
-0.1934273, 0.01493805, -1.513535, 0, 0, 0, 1, 1,
-0.1930409, 1.224846, -0.7618557, 0, 0, 0, 1, 1,
-0.1917973, -0.2733709, -3.690631, 1, 1, 1, 1, 1,
-0.1911668, 1.666036, -1.04791, 1, 1, 1, 1, 1,
-0.187151, -0.1224009, -2.804717, 1, 1, 1, 1, 1,
-0.1845308, 0.5487115, -1.842974, 1, 1, 1, 1, 1,
-0.1749869, -1.656594, -4.897931, 1, 1, 1, 1, 1,
-0.1742349, 0.4130418, 0.5445912, 1, 1, 1, 1, 1,
-0.1678896, -0.586418, -3.094033, 1, 1, 1, 1, 1,
-0.1671054, 0.4824552, -0.859534, 1, 1, 1, 1, 1,
-0.1669465, 1.043845, -0.6278773, 1, 1, 1, 1, 1,
-0.1645589, 0.6018229, 0.5253252, 1, 1, 1, 1, 1,
-0.1607119, 0.0354063, -2.101207, 1, 1, 1, 1, 1,
-0.1604377, -0.4859217, -2.82914, 1, 1, 1, 1, 1,
-0.1596737, 1.77598, 0.270133, 1, 1, 1, 1, 1,
-0.1504254, -2.527966, -2.776314, 1, 1, 1, 1, 1,
-0.1475959, -0.4302596, -2.788079, 1, 1, 1, 1, 1,
-0.1474529, 0.38293, 1.983389, 0, 0, 1, 1, 1,
-0.1449852, 0.0754825, -0.7688875, 1, 0, 0, 1, 1,
-0.1415514, -1.053196, 0.2792642, 1, 0, 0, 1, 1,
-0.1413686, -1.016198, -1.05774, 1, 0, 0, 1, 1,
-0.1401084, -1.218143, -2.574023, 1, 0, 0, 1, 1,
-0.1400501, -0.8215716, -3.099998, 1, 0, 0, 1, 1,
-0.1399634, -0.8968619, -3.04936, 0, 0, 0, 1, 1,
-0.1351919, 3.445414, -0.4805595, 0, 0, 0, 1, 1,
-0.1334925, -1.068687, -2.078691, 0, 0, 0, 1, 1,
-0.1296186, 0.2282935, -0.7258496, 0, 0, 0, 1, 1,
-0.1271163, -1.173149, -3.981925, 0, 0, 0, 1, 1,
-0.1256112, -0.3696317, -2.474729, 0, 0, 0, 1, 1,
-0.1208568, 0.3073803, -1.583967, 0, 0, 0, 1, 1,
-0.1200533, 0.6948245, -0.8093335, 1, 1, 1, 1, 1,
-0.1184127, 0.3432539, 0.8967179, 1, 1, 1, 1, 1,
-0.116329, 0.5995175, -0.6747176, 1, 1, 1, 1, 1,
-0.1157339, -1.132343, -2.638682, 1, 1, 1, 1, 1,
-0.1153846, 1.104868, 1.411301, 1, 1, 1, 1, 1,
-0.112527, -0.9847271, -2.861791, 1, 1, 1, 1, 1,
-0.1087818, -0.2286784, -2.397416, 1, 1, 1, 1, 1,
-0.1087456, 1.634567, -0.9026164, 1, 1, 1, 1, 1,
-0.1056553, -0.2180364, -3.46965, 1, 1, 1, 1, 1,
-0.103396, -0.03710283, -1.97487, 1, 1, 1, 1, 1,
-0.09904539, -0.1143703, -0.4506087, 1, 1, 1, 1, 1,
-0.09814841, -0.2440615, -3.156475, 1, 1, 1, 1, 1,
-0.09260117, -0.3746119, -2.786723, 1, 1, 1, 1, 1,
-0.09043776, -1.041992, -2.299265, 1, 1, 1, 1, 1,
-0.08831015, 0.2200262, 0.2307661, 1, 1, 1, 1, 1,
-0.0850964, 0.1286654, -0.04324745, 0, 0, 1, 1, 1,
-0.08452232, 0.9189287, 0.20529, 1, 0, 0, 1, 1,
-0.07780438, 1.489894, -0.984239, 1, 0, 0, 1, 1,
-0.07235809, -1.2248, -1.62666, 1, 0, 0, 1, 1,
-0.07123702, 1.045305, -0.05524056, 1, 0, 0, 1, 1,
-0.06799784, 0.08757509, -2.377022, 1, 0, 0, 1, 1,
-0.06749175, 0.5781436, 0.2605371, 0, 0, 0, 1, 1,
-0.06741532, -0.6075489, -5.058445, 0, 0, 0, 1, 1,
-0.06401797, -0.5235089, -2.954156, 0, 0, 0, 1, 1,
-0.06212652, -1.657741, -2.960969, 0, 0, 0, 1, 1,
-0.06017265, 0.3181759, 0.1725868, 0, 0, 0, 1, 1,
-0.06016565, 0.9756638, 0.8857529, 0, 0, 0, 1, 1,
-0.05886742, 0.8470685, 1.073187, 0, 0, 0, 1, 1,
-0.05780315, 0.7292006, 0.8590379, 1, 1, 1, 1, 1,
-0.05488333, -1.329154, -3.465202, 1, 1, 1, 1, 1,
-0.05447345, -0.5355834, -4.056199, 1, 1, 1, 1, 1,
-0.05436524, 0.683428, 0.1607106, 1, 1, 1, 1, 1,
-0.05064443, 0.3604329, 0.03459429, 1, 1, 1, 1, 1,
-0.04849233, -0.4224193, -4.025537, 1, 1, 1, 1, 1,
-0.04834453, 1.273072, -0.1755154, 1, 1, 1, 1, 1,
-0.04325384, 0.03597014, -0.5644273, 1, 1, 1, 1, 1,
-0.04266682, -0.08067634, -2.005162, 1, 1, 1, 1, 1,
-0.03966524, 0.1343243, 1.092507, 1, 1, 1, 1, 1,
-0.03670078, 0.5360659, 0.2014321, 1, 1, 1, 1, 1,
-0.02671116, -1.360823, -3.313799, 1, 1, 1, 1, 1,
-0.02549264, 1.026602, -0.3008106, 1, 1, 1, 1, 1,
-0.02419659, 0.6105236, 0.138074, 1, 1, 1, 1, 1,
-0.02129938, -0.5083918, -3.487258, 1, 1, 1, 1, 1,
-0.01986554, -1.043932, -3.081168, 0, 0, 1, 1, 1,
-0.01871039, -1.774048, -2.210804, 1, 0, 0, 1, 1,
-0.01806957, -0.8641847, -1.827205, 1, 0, 0, 1, 1,
-0.01721196, -1.305155, -5.008597, 1, 0, 0, 1, 1,
-0.01414786, -1.468712, -3.891853, 1, 0, 0, 1, 1,
-0.01321243, 0.1432954, -0.9965312, 1, 0, 0, 1, 1,
-0.00924427, 1.438363, -0.2220551, 0, 0, 0, 1, 1,
-0.00733735, -1.257222, -2.865129, 0, 0, 0, 1, 1,
-0.004708877, -0.5897794, -3.339086, 0, 0, 0, 1, 1,
-0.0004020778, 0.6946534, 0.5820434, 0, 0, 0, 1, 1,
0.002453328, -0.3264953, 4.176106, 0, 0, 0, 1, 1,
0.002552032, -0.08704884, 1.869869, 0, 0, 0, 1, 1,
0.005214794, 0.865257, 0.1251527, 0, 0, 0, 1, 1,
0.006897384, -1.442008, 3.137799, 1, 1, 1, 1, 1,
0.01073861, -1.013563, 2.31425, 1, 1, 1, 1, 1,
0.01121885, -0.665254, 1.870975, 1, 1, 1, 1, 1,
0.01406, 0.6022494, -1.466669, 1, 1, 1, 1, 1,
0.01613374, 1.983178, -1.399133, 1, 1, 1, 1, 1,
0.01745765, -1.150838, 2.522362, 1, 1, 1, 1, 1,
0.02065453, -1.17734, 2.147169, 1, 1, 1, 1, 1,
0.02188787, -0.09875403, 3.382532, 1, 1, 1, 1, 1,
0.02528926, 0.6969122, 0.8907371, 1, 1, 1, 1, 1,
0.02557685, 1.456479, -0.2533626, 1, 1, 1, 1, 1,
0.0293507, -0.5129647, 1.981272, 1, 1, 1, 1, 1,
0.03038029, -0.6853063, 1.814369, 1, 1, 1, 1, 1,
0.03408153, -0.3188837, 1.092726, 1, 1, 1, 1, 1,
0.03501469, -0.5086468, 2.71978, 1, 1, 1, 1, 1,
0.03629823, 1.180645, 0.7569888, 1, 1, 1, 1, 1,
0.04290194, -0.6304985, 1.246253, 0, 0, 1, 1, 1,
0.0430214, 0.6965387, -0.8025191, 1, 0, 0, 1, 1,
0.04439517, 1.265031, 0.6025132, 1, 0, 0, 1, 1,
0.04641258, -0.4812114, 1.211219, 1, 0, 0, 1, 1,
0.04680046, 0.9337837, -1.676011, 1, 0, 0, 1, 1,
0.04689344, -0.4781157, 4.004506, 1, 0, 0, 1, 1,
0.04720428, -0.6405244, 2.497491, 0, 0, 0, 1, 1,
0.04857336, -1.424961, 3.845936, 0, 0, 0, 1, 1,
0.04866739, 0.2477188, 0.1521481, 0, 0, 0, 1, 1,
0.05079753, -0.4507278, 5.283404, 0, 0, 0, 1, 1,
0.05199554, -1.323756, 4.660826, 0, 0, 0, 1, 1,
0.05596837, 1.070879, 1.523673, 0, 0, 0, 1, 1,
0.05638525, 0.3896075, 0.1821802, 0, 0, 0, 1, 1,
0.05696661, -0.2535673, 4.73886, 1, 1, 1, 1, 1,
0.06352542, -1.020214, 1.582504, 1, 1, 1, 1, 1,
0.06568348, 0.7323079, -1.263347, 1, 1, 1, 1, 1,
0.0663209, -1.29621, 3.211002, 1, 1, 1, 1, 1,
0.07331847, 0.2373428, -1.308252, 1, 1, 1, 1, 1,
0.08196902, 0.6817947, 0.152509, 1, 1, 1, 1, 1,
0.09096999, 0.1057401, 1.412264, 1, 1, 1, 1, 1,
0.09858185, 0.07698265, 1.600899, 1, 1, 1, 1, 1,
0.1036548, -0.998055, 2.759685, 1, 1, 1, 1, 1,
0.1049292, -0.5972752, 3.618235, 1, 1, 1, 1, 1,
0.1049413, 0.09362974, 1.055227, 1, 1, 1, 1, 1,
0.105582, -0.3950323, 3.448225, 1, 1, 1, 1, 1,
0.1128907, 0.4270742, -0.3629359, 1, 1, 1, 1, 1,
0.1135507, 0.5980656, -1.758002, 1, 1, 1, 1, 1,
0.1189482, -0.07574134, 2.497079, 1, 1, 1, 1, 1,
0.1220985, 0.4740978, 1.378802, 0, 0, 1, 1, 1,
0.1236015, -0.5423292, 2.790243, 1, 0, 0, 1, 1,
0.1244346, -0.06001724, 0.7999424, 1, 0, 0, 1, 1,
0.1261315, 0.473346, -0.4258766, 1, 0, 0, 1, 1,
0.1282016, -0.8491899, 3.321268, 1, 0, 0, 1, 1,
0.1290282, 1.660548, -1.303323, 1, 0, 0, 1, 1,
0.1336098, -0.9197227, 3.319472, 0, 0, 0, 1, 1,
0.1338601, 0.4403439, 1.782981, 0, 0, 0, 1, 1,
0.1390336, -0.2201751, 0.741636, 0, 0, 0, 1, 1,
0.1430045, -0.5791075, 2.468041, 0, 0, 0, 1, 1,
0.1454538, -0.1148338, 0.2897726, 0, 0, 0, 1, 1,
0.1537964, -2.114374, 2.059723, 0, 0, 0, 1, 1,
0.1541455, 0.5927333, -0.704672, 0, 0, 0, 1, 1,
0.1547172, -0.9594527, 2.581068, 1, 1, 1, 1, 1,
0.161846, 0.5700322, -0.02526798, 1, 1, 1, 1, 1,
0.163053, -1.5494, 2.607904, 1, 1, 1, 1, 1,
0.1717599, -1.007188, 3.002038, 1, 1, 1, 1, 1,
0.1721532, 1.576658, 1.571621, 1, 1, 1, 1, 1,
0.1735121, 1.050923, -0.4030804, 1, 1, 1, 1, 1,
0.1743657, 0.4699799, -0.6106306, 1, 1, 1, 1, 1,
0.1812674, -0.09562639, 3.457093, 1, 1, 1, 1, 1,
0.1855724, -2.556266, 5.197248, 1, 1, 1, 1, 1,
0.187688, 0.4608335, 0.2365735, 1, 1, 1, 1, 1,
0.1882812, -0.1823425, 3.528735, 1, 1, 1, 1, 1,
0.1909347, -0.05281241, 1.391733, 1, 1, 1, 1, 1,
0.191898, 0.7982709, 1.624444, 1, 1, 1, 1, 1,
0.1967895, 0.3573275, 0.5152336, 1, 1, 1, 1, 1,
0.1974432, 1.746305, -1.84386, 1, 1, 1, 1, 1,
0.1978205, 0.1526956, -0.7868279, 0, 0, 1, 1, 1,
0.1979122, -1.312296, 2.257527, 1, 0, 0, 1, 1,
0.1979781, -0.1974283, -0.05556723, 1, 0, 0, 1, 1,
0.2042715, 0.4065437, -0.7839229, 1, 0, 0, 1, 1,
0.2054427, -0.5184495, 2.056, 1, 0, 0, 1, 1,
0.2059698, -0.1697908, 1.630938, 1, 0, 0, 1, 1,
0.2105499, -0.1765627, 3.016675, 0, 0, 0, 1, 1,
0.2123518, 0.9786174, 1.82865, 0, 0, 0, 1, 1,
0.2141824, 0.3753147, -1.717671, 0, 0, 0, 1, 1,
0.2142266, 0.1767108, 0.9215759, 0, 0, 0, 1, 1,
0.2161304, -0.08869573, 2.834664, 0, 0, 0, 1, 1,
0.2174601, -1.649325, 3.160975, 0, 0, 0, 1, 1,
0.2194116, 0.6665445, 1.438086, 0, 0, 0, 1, 1,
0.2241031, -1.317749, 2.537759, 1, 1, 1, 1, 1,
0.2310893, 0.5583006, 2.74119, 1, 1, 1, 1, 1,
0.2311289, -0.07225149, 2.64196, 1, 1, 1, 1, 1,
0.2327835, 1.460343, 1.377512, 1, 1, 1, 1, 1,
0.237452, -0.588055, 5.126743, 1, 1, 1, 1, 1,
0.2388903, 0.6821458, 0.6279681, 1, 1, 1, 1, 1,
0.2405765, 0.2671966, 0.9962036, 1, 1, 1, 1, 1,
0.2415143, 0.7770567, 1.412127, 1, 1, 1, 1, 1,
0.2513714, 1.04662, 1.237495, 1, 1, 1, 1, 1,
0.2561385, -1.159496, 3.417178, 1, 1, 1, 1, 1,
0.2580459, -1.045385, 1.084317, 1, 1, 1, 1, 1,
0.2598361, 0.4386122, 0.5529713, 1, 1, 1, 1, 1,
0.2629208, -0.6907524, 2.05294, 1, 1, 1, 1, 1,
0.2636108, 1.252548, 1.804918, 1, 1, 1, 1, 1,
0.2719315, 0.9546216, -0.2799549, 1, 1, 1, 1, 1,
0.2720105, 0.9037353, 0.3304275, 0, 0, 1, 1, 1,
0.2786429, 0.2723768, -0.7525618, 1, 0, 0, 1, 1,
0.2790503, 0.6153561, -0.4669964, 1, 0, 0, 1, 1,
0.2794592, -0.8430279, 3.155757, 1, 0, 0, 1, 1,
0.2859304, 0.2448858, -0.2887026, 1, 0, 0, 1, 1,
0.2895958, 1.58904, -0.7871349, 1, 0, 0, 1, 1,
0.2965968, -1.379418, 1.440733, 0, 0, 0, 1, 1,
0.297808, 0.05458329, 1.248411, 0, 0, 0, 1, 1,
0.2985923, -0.4984518, 0.0775905, 0, 0, 0, 1, 1,
0.2990342, -1.783655, 0.9867428, 0, 0, 0, 1, 1,
0.2999265, 1.03985, 0.4660476, 0, 0, 0, 1, 1,
0.3012567, 0.4806013, 0.04748126, 0, 0, 0, 1, 1,
0.3125389, -0.3955812, 1.495834, 0, 0, 0, 1, 1,
0.3127614, 0.9092355, -1.457759, 1, 1, 1, 1, 1,
0.3185607, 0.5423898, -0.06238188, 1, 1, 1, 1, 1,
0.3216555, -1.850239, 3.213763, 1, 1, 1, 1, 1,
0.3231306, 0.1952462, 0.6666318, 1, 1, 1, 1, 1,
0.3234663, 1.484142, 0.02639178, 1, 1, 1, 1, 1,
0.3255522, -0.9208436, 2.848718, 1, 1, 1, 1, 1,
0.3261532, -1.103923, 2.510686, 1, 1, 1, 1, 1,
0.3265909, 1.818872, 0.9927671, 1, 1, 1, 1, 1,
0.3288552, 1.037169, 0.07296232, 1, 1, 1, 1, 1,
0.3339517, 0.7943734, 1.767755, 1, 1, 1, 1, 1,
0.3364217, -1.086329, 2.748236, 1, 1, 1, 1, 1,
0.3374772, 0.2597504, 0.4253362, 1, 1, 1, 1, 1,
0.34239, -0.0512707, 1.242035, 1, 1, 1, 1, 1,
0.3458816, 1.038233, -0.255687, 1, 1, 1, 1, 1,
0.3464189, 0.112422, 0.941618, 1, 1, 1, 1, 1,
0.3491536, 0.1358898, 2.146805, 0, 0, 1, 1, 1,
0.3499624, -1.847203, 3.205661, 1, 0, 0, 1, 1,
0.3514491, -2.092804, 1.625523, 1, 0, 0, 1, 1,
0.3540452, -0.2123269, 1.217921, 1, 0, 0, 1, 1,
0.3580676, 0.1443607, 2.590413, 1, 0, 0, 1, 1,
0.3590949, 1.114053, 1.217566, 1, 0, 0, 1, 1,
0.3625323, -1.131116, 3.287466, 0, 0, 0, 1, 1,
0.3628478, 0.9184037, 1.48143, 0, 0, 0, 1, 1,
0.3632933, -0.7164087, 2.285197, 0, 0, 0, 1, 1,
0.364571, -0.4970622, 4.913418, 0, 0, 0, 1, 1,
0.3684707, 1.70997, 0.9419956, 0, 0, 0, 1, 1,
0.3691523, -0.05669373, 2.100175, 0, 0, 0, 1, 1,
0.3709226, 0.2179141, 1.154655, 0, 0, 0, 1, 1,
0.3711665, -0.202778, 1.139366, 1, 1, 1, 1, 1,
0.3729448, -0.7291877, 2.765919, 1, 1, 1, 1, 1,
0.3740674, 0.3784805, 1.162609, 1, 1, 1, 1, 1,
0.3779201, 0.0800605, 0.3144019, 1, 1, 1, 1, 1,
0.3817989, 0.3571939, 1.117634, 1, 1, 1, 1, 1,
0.3818339, 0.1015663, 2.752452, 1, 1, 1, 1, 1,
0.3821444, 0.5149428, 0.4897268, 1, 1, 1, 1, 1,
0.3844289, -0.2475593, 3.21428, 1, 1, 1, 1, 1,
0.3857307, -1.022315, 2.375718, 1, 1, 1, 1, 1,
0.3881237, 0.4707342, 1.072633, 1, 1, 1, 1, 1,
0.4006509, 0.5561648, -0.6028959, 1, 1, 1, 1, 1,
0.4010133, 0.3272979, -0.549105, 1, 1, 1, 1, 1,
0.4030916, 0.3163807, 0.2359023, 1, 1, 1, 1, 1,
0.4067186, 0.07583125, 0.5097741, 1, 1, 1, 1, 1,
0.4073003, -2.341558, 3.338277, 1, 1, 1, 1, 1,
0.4083406, -1.061088, 4.002076, 0, 0, 1, 1, 1,
0.4098196, 0.1769268, 1.364709, 1, 0, 0, 1, 1,
0.4101793, -0.1898198, 1.215854, 1, 0, 0, 1, 1,
0.4151508, -0.7670706, 2.506629, 1, 0, 0, 1, 1,
0.416167, -0.3895403, 0.8321053, 1, 0, 0, 1, 1,
0.4174249, -1.368953, 3.892493, 1, 0, 0, 1, 1,
0.4208254, -1.974208, 3.155648, 0, 0, 0, 1, 1,
0.4233381, -0.28157, 1.361687, 0, 0, 0, 1, 1,
0.4242374, -1.256054, 2.964892, 0, 0, 0, 1, 1,
0.4243414, 1.330913, 0.5095739, 0, 0, 0, 1, 1,
0.4264659, -1.882732, 2.035574, 0, 0, 0, 1, 1,
0.4265479, -1.347329, 2.797674, 0, 0, 0, 1, 1,
0.4268766, -0.8098398, 2.599727, 0, 0, 0, 1, 1,
0.4269405, 1.034733, 0.5442882, 1, 1, 1, 1, 1,
0.428916, -0.1762583, 3.184494, 1, 1, 1, 1, 1,
0.4363386, -0.6508079, 2.760067, 1, 1, 1, 1, 1,
0.4369512, 0.1984938, 0.4748475, 1, 1, 1, 1, 1,
0.4379077, -0.1505527, 3.067469, 1, 1, 1, 1, 1,
0.4429877, 0.6011913, 1.306388, 1, 1, 1, 1, 1,
0.4430562, -0.0587611, 1.782512, 1, 1, 1, 1, 1,
0.4434887, 0.3571087, -0.8691655, 1, 1, 1, 1, 1,
0.4451025, -0.7794234, 3.552153, 1, 1, 1, 1, 1,
0.4489269, 0.7381094, -0.9110283, 1, 1, 1, 1, 1,
0.4549332, -0.03370356, 2.295492, 1, 1, 1, 1, 1,
0.4629071, -2.356629, 2.427812, 1, 1, 1, 1, 1,
0.4700279, -0.9332464, 1.631296, 1, 1, 1, 1, 1,
0.4737155, -1.137075, 2.503406, 1, 1, 1, 1, 1,
0.480748, 0.523895, 1.68532, 1, 1, 1, 1, 1,
0.4840948, 1.087711, 1.363521, 0, 0, 1, 1, 1,
0.4867389, -0.5428386, 2.860135, 1, 0, 0, 1, 1,
0.491938, -0.1974546, 0.8776307, 1, 0, 0, 1, 1,
0.4922464, -1.049208, 3.637093, 1, 0, 0, 1, 1,
0.492432, -0.5855862, 1.777477, 1, 0, 0, 1, 1,
0.4930809, 0.6464586, 1.666435, 1, 0, 0, 1, 1,
0.4951315, -0.6393073, 2.555726, 0, 0, 0, 1, 1,
0.4963522, -0.4538026, 2.406157, 0, 0, 0, 1, 1,
0.4975469, 0.6866197, 1.338006, 0, 0, 0, 1, 1,
0.5033011, -0.9304792, 4.63301, 0, 0, 0, 1, 1,
0.5067879, -0.130766, 1.102526, 0, 0, 0, 1, 1,
0.5117205, 1.331497, -0.1597302, 0, 0, 0, 1, 1,
0.5140439, -1.103885, 5.843053, 0, 0, 0, 1, 1,
0.5147579, 0.5123072, -0.9261067, 1, 1, 1, 1, 1,
0.5260031, 1.654313, -0.7835989, 1, 1, 1, 1, 1,
0.5313459, -0.9042302, 1.841792, 1, 1, 1, 1, 1,
0.5355322, -1.419414, 3.419202, 1, 1, 1, 1, 1,
0.5374579, 1.157753, 0.8260009, 1, 1, 1, 1, 1,
0.5378312, -1.2154, 5.087756, 1, 1, 1, 1, 1,
0.5489528, -0.4404459, 3.581014, 1, 1, 1, 1, 1,
0.5584578, -0.9931263, 2.97392, 1, 1, 1, 1, 1,
0.5603651, 1.657725, 0.8654179, 1, 1, 1, 1, 1,
0.562624, -1.06215, 3.708043, 1, 1, 1, 1, 1,
0.5626354, 0.3314739, 1.075243, 1, 1, 1, 1, 1,
0.5647493, -0.6232266, 2.30018, 1, 1, 1, 1, 1,
0.5659918, 0.1743881, 1.82192, 1, 1, 1, 1, 1,
0.5690915, 0.5707644, 0.8174615, 1, 1, 1, 1, 1,
0.5704501, 0.5797379, 0.02499445, 1, 1, 1, 1, 1,
0.5711061, 0.4904089, -0.8821908, 0, 0, 1, 1, 1,
0.5731183, -0.05935685, 1.718827, 1, 0, 0, 1, 1,
0.5759044, 0.334576, 0.6930942, 1, 0, 0, 1, 1,
0.5764297, -0.7954457, 3.693051, 1, 0, 0, 1, 1,
0.5826464, 0.1403477, 2.423451, 1, 0, 0, 1, 1,
0.5977512, 1.161904, 1.142752, 1, 0, 0, 1, 1,
0.6010178, 0.85877, -0.4270469, 0, 0, 0, 1, 1,
0.6018791, 0.9497337, -0.04634335, 0, 0, 0, 1, 1,
0.6066995, -1.00494, 2.40176, 0, 0, 0, 1, 1,
0.6071198, -0.6371703, 1.510158, 0, 0, 0, 1, 1,
0.6091568, 1.973968, -0.6821327, 0, 0, 0, 1, 1,
0.6100413, 0.999483, 0.7090427, 0, 0, 0, 1, 1,
0.6100496, -0.1689899, 0.2148649, 0, 0, 0, 1, 1,
0.6179438, 0.1588605, 1.098026, 1, 1, 1, 1, 1,
0.6243734, 0.07571622, 0.6294919, 1, 1, 1, 1, 1,
0.6247954, 1.053658, 1.619067, 1, 1, 1, 1, 1,
0.625266, 0.4575781, 2.573756, 1, 1, 1, 1, 1,
0.6394001, 0.5197386, -0.1807008, 1, 1, 1, 1, 1,
0.6436998, -1.223682, 2.347245, 1, 1, 1, 1, 1,
0.6441578, 1.438511, -1.640835, 1, 1, 1, 1, 1,
0.6485831, 0.1594138, 0.1293807, 1, 1, 1, 1, 1,
0.6488472, 2.202112, 0.3200437, 1, 1, 1, 1, 1,
0.653343, 0.1941729, -0.02119653, 1, 1, 1, 1, 1,
0.6557494, 1.164621, 1.196314, 1, 1, 1, 1, 1,
0.6567463, -0.834573, 1.54687, 1, 1, 1, 1, 1,
0.6821967, -0.6127487, 0.7998903, 1, 1, 1, 1, 1,
0.6826533, -0.758725, 2.569387, 1, 1, 1, 1, 1,
0.6860712, -0.7264003, 2.744552, 1, 1, 1, 1, 1,
0.6864826, -1.215091, 0.9601308, 0, 0, 1, 1, 1,
0.6869665, -0.806226, 0.6623403, 1, 0, 0, 1, 1,
0.6953755, -1.423504, 1.142939, 1, 0, 0, 1, 1,
0.7085072, 1.123522, 0.6299909, 1, 0, 0, 1, 1,
0.7093902, -0.6215427, 1.85243, 1, 0, 0, 1, 1,
0.7190264, -0.7898965, 2.076402, 1, 0, 0, 1, 1,
0.7213662, -0.4721264, 0.3370565, 0, 0, 0, 1, 1,
0.7270882, -0.7463463, 1.958038, 0, 0, 0, 1, 1,
0.7279621, 0.5027982, 1.659315, 0, 0, 0, 1, 1,
0.7285134, -1.91588, 2.99221, 0, 0, 0, 1, 1,
0.7292643, -0.2433419, 1.862433, 0, 0, 0, 1, 1,
0.7312577, -0.6344706, 2.270199, 0, 0, 0, 1, 1,
0.7324347, -0.2822957, 2.301605, 0, 0, 0, 1, 1,
0.7324782, -0.2180144, 1.017002, 1, 1, 1, 1, 1,
0.7335449, -1.29153, 1.866902, 1, 1, 1, 1, 1,
0.7341887, -2.162733, 4.515239, 1, 1, 1, 1, 1,
0.7363068, -0.8348199, 2.344765, 1, 1, 1, 1, 1,
0.7378061, 0.3042649, 1.076944, 1, 1, 1, 1, 1,
0.738014, 1.070817, -0.5630558, 1, 1, 1, 1, 1,
0.7449818, -0.8355258, 2.337782, 1, 1, 1, 1, 1,
0.7459629, -0.1665864, 2.327237, 1, 1, 1, 1, 1,
0.7465584, -0.8294601, 1.416469, 1, 1, 1, 1, 1,
0.7518341, 0.3421679, 1.432586, 1, 1, 1, 1, 1,
0.7585393, 1.323581, -1.461469, 1, 1, 1, 1, 1,
0.7663291, 0.7053704, 1.507052, 1, 1, 1, 1, 1,
0.7745676, 0.07795205, 0.03460013, 1, 1, 1, 1, 1,
0.7786063, 0.1098981, 1.46122, 1, 1, 1, 1, 1,
0.779539, -1.628619, 2.462626, 1, 1, 1, 1, 1,
0.786697, 2.203182, 0.01707515, 0, 0, 1, 1, 1,
0.802669, -0.6957557, 3.181045, 1, 0, 0, 1, 1,
0.8038931, -0.4132116, 1.900433, 1, 0, 0, 1, 1,
0.812745, 0.3374188, 0.2790177, 1, 0, 0, 1, 1,
0.8339422, 1.388286, 1.006775, 1, 0, 0, 1, 1,
0.8348206, 0.8257195, -1.078613, 1, 0, 0, 1, 1,
0.8352174, 0.8026475, 0.6772419, 0, 0, 0, 1, 1,
0.8380517, 0.4214153, 1.34904, 0, 0, 0, 1, 1,
0.8647485, 0.0963983, 0.6462014, 0, 0, 0, 1, 1,
0.8718736, -0.2579026, 1.662482, 0, 0, 0, 1, 1,
0.8724901, -0.9186828, 1.591888, 0, 0, 0, 1, 1,
0.8737448, -0.02853999, 2.189385, 0, 0, 0, 1, 1,
0.8755272, -0.07053316, 1.892425, 0, 0, 0, 1, 1,
0.8793212, -0.7672449, 1.906687, 1, 1, 1, 1, 1,
0.8793443, 1.047857, 0.1795384, 1, 1, 1, 1, 1,
0.8846671, -0.4287429, 3.665615, 1, 1, 1, 1, 1,
0.8864089, -0.7967469, 3.13804, 1, 1, 1, 1, 1,
0.8871078, 0.3386718, 1.253852, 1, 1, 1, 1, 1,
0.8892062, 0.8284919, 0.9576079, 1, 1, 1, 1, 1,
0.8953817, 1.816639, 0.5128002, 1, 1, 1, 1, 1,
0.8974633, -0.743318, 4.157606, 1, 1, 1, 1, 1,
0.9217172, -1.263566, 1.991731, 1, 1, 1, 1, 1,
0.9222542, -0.2807114, 2.723671, 1, 1, 1, 1, 1,
0.9262629, 0.3073321, 1.789825, 1, 1, 1, 1, 1,
0.9323133, -1.339048, 2.373269, 1, 1, 1, 1, 1,
0.933247, -0.09298234, 1.964627, 1, 1, 1, 1, 1,
0.9469157, -0.5072694, -0.008094453, 1, 1, 1, 1, 1,
0.9471267, 1.186062, -0.8456942, 1, 1, 1, 1, 1,
0.9482616, 0.09529419, 4.153021, 0, 0, 1, 1, 1,
0.9506749, -1.192698, 2.712043, 1, 0, 0, 1, 1,
0.9575216, 0.3109069, 0.5383838, 1, 0, 0, 1, 1,
0.9578634, -0.1477632, 0.4358704, 1, 0, 0, 1, 1,
0.9583411, -0.1351459, 3.139724, 1, 0, 0, 1, 1,
0.9599627, 0.3422167, 1.32145, 1, 0, 0, 1, 1,
0.9615051, 0.1115638, 0.8520294, 0, 0, 0, 1, 1,
0.9659395, 1.280025, 0.001686939, 0, 0, 0, 1, 1,
0.9660334, -0.09084533, 1.994582, 0, 0, 0, 1, 1,
0.9699239, 0.4017459, 1.889268, 0, 0, 0, 1, 1,
0.972187, 1.535718, 1.521131, 0, 0, 0, 1, 1,
0.9734226, 2.074013, 0.905679, 0, 0, 0, 1, 1,
0.9748052, -1.080376, 4.242507, 0, 0, 0, 1, 1,
0.9789634, 0.2922879, 1.071836, 1, 1, 1, 1, 1,
0.9796444, 0.7492479, 1.043264, 1, 1, 1, 1, 1,
0.9810238, -1.088635, 2.342372, 1, 1, 1, 1, 1,
0.9902484, -0.4246556, 2.444196, 1, 1, 1, 1, 1,
0.9905544, 0.1893494, 0.1595819, 1, 1, 1, 1, 1,
0.99353, 0.9162423, -0.07654028, 1, 1, 1, 1, 1,
0.9956917, -1.638795, 1.872084, 1, 1, 1, 1, 1,
0.9970783, -1.083305, 1.565825, 1, 1, 1, 1, 1,
1.002956, 1.522999, 3.162439, 1, 1, 1, 1, 1,
1.003534, -0.388281, 1.376162, 1, 1, 1, 1, 1,
1.004664, 0.2880207, 1.728732, 1, 1, 1, 1, 1,
1.007032, 0.7586623, 1.171568, 1, 1, 1, 1, 1,
1.007461, 0.0608027, 0.9384138, 1, 1, 1, 1, 1,
1.008294, 1.024015, 3.521719, 1, 1, 1, 1, 1,
1.009188, -2.245755, 1.780514, 1, 1, 1, 1, 1,
1.009676, -1.499111, 3.842817, 0, 0, 1, 1, 1,
1.02123, 1.374873, 2.585998, 1, 0, 0, 1, 1,
1.022498, -2.034721, 3.786651, 1, 0, 0, 1, 1,
1.024603, -0.06109742, 1.774944, 1, 0, 0, 1, 1,
1.024993, 0.496338, 0.6482477, 1, 0, 0, 1, 1,
1.025918, 2.06973, -0.7834452, 1, 0, 0, 1, 1,
1.027571, -0.202296, 1.98363, 0, 0, 0, 1, 1,
1.036887, 1.121076, -0.09838583, 0, 0, 0, 1, 1,
1.0435, 0.141847, 2.409099, 0, 0, 0, 1, 1,
1.047802, -0.2923178, 1.337968, 0, 0, 0, 1, 1,
1.0484, 0.3722719, 0.9241598, 0, 0, 0, 1, 1,
1.048871, -0.9584608, 1.371146, 0, 0, 0, 1, 1,
1.051927, -0.06511588, 1.857542, 0, 0, 0, 1, 1,
1.057198, 0.1443628, 0.3316845, 1, 1, 1, 1, 1,
1.063992, -0.111876, 1.126824, 1, 1, 1, 1, 1,
1.065394, -0.4316473, 2.940976, 1, 1, 1, 1, 1,
1.066812, 0.952789, 1.96994, 1, 1, 1, 1, 1,
1.072665, -1.309461, 1.665008, 1, 1, 1, 1, 1,
1.07363, -0.7000192, 2.881503, 1, 1, 1, 1, 1,
1.074926, -2.679968, 2.743542, 1, 1, 1, 1, 1,
1.083016, 0.06125819, 2.100929, 1, 1, 1, 1, 1,
1.08451, -0.1066815, 1.628191, 1, 1, 1, 1, 1,
1.091588, 0.6923018, 0.7919486, 1, 1, 1, 1, 1,
1.096917, -0.7964733, 1.639839, 1, 1, 1, 1, 1,
1.105495, 0.9368944, 0.9237961, 1, 1, 1, 1, 1,
1.115859, -0.09572564, 1.49652, 1, 1, 1, 1, 1,
1.116116, -0.07271395, 0.682798, 1, 1, 1, 1, 1,
1.122089, -0.03867031, 0.9004114, 1, 1, 1, 1, 1,
1.124323, 0.1033629, 1.486902, 0, 0, 1, 1, 1,
1.128236, 1.120514, -0.4431164, 1, 0, 0, 1, 1,
1.133474, 0.9990269, 1.578037, 1, 0, 0, 1, 1,
1.137045, 0.5660107, -0.2772596, 1, 0, 0, 1, 1,
1.150588, 1.208457, 3.640049, 1, 0, 0, 1, 1,
1.151963, 0.03373815, 3.003294, 1, 0, 0, 1, 1,
1.153393, 0.5311225, 0.9891915, 0, 0, 0, 1, 1,
1.161583, 0.2097471, 3.527027, 0, 0, 0, 1, 1,
1.166291, 0.6266247, 1.378749, 0, 0, 0, 1, 1,
1.167054, 1.279892, -0.2083238, 0, 0, 0, 1, 1,
1.167733, -0.2441599, 2.430723, 0, 0, 0, 1, 1,
1.167962, -0.4431184, 0.6322874, 0, 0, 0, 1, 1,
1.168213, -2.316927, 1.925282, 0, 0, 0, 1, 1,
1.172727, -0.5835921, 2.161332, 1, 1, 1, 1, 1,
1.174489, -0.07657291, 1.500499, 1, 1, 1, 1, 1,
1.177372, -0.1101765, 1.917112, 1, 1, 1, 1, 1,
1.184839, 0.01912073, 2.363374, 1, 1, 1, 1, 1,
1.189071, 3.030758, 1.012229, 1, 1, 1, 1, 1,
1.201867, -0.2803853, 0.7065511, 1, 1, 1, 1, 1,
1.228013, 1.624467, 0.3267795, 1, 1, 1, 1, 1,
1.230948, -0.3593116, 1.470411, 1, 1, 1, 1, 1,
1.23821, -0.6112984, 2.468003, 1, 1, 1, 1, 1,
1.23917, -0.9055826, 2.862712, 1, 1, 1, 1, 1,
1.243948, -0.3089079, 1.407707, 1, 1, 1, 1, 1,
1.247411, 0.4820242, 1.325807, 1, 1, 1, 1, 1,
1.253141, 0.5169796, 2.392767, 1, 1, 1, 1, 1,
1.254624, 0.6382102, 1.444453, 1, 1, 1, 1, 1,
1.257403, 0.2946528, 1.248052, 1, 1, 1, 1, 1,
1.265189, 0.4685214, 0.7905443, 0, 0, 1, 1, 1,
1.268813, 0.8565793, 0.7887389, 1, 0, 0, 1, 1,
1.272646, 0.2973447, 1.897989, 1, 0, 0, 1, 1,
1.283892, 0.3361752, 0.5753691, 1, 0, 0, 1, 1,
1.285564, 0.4772462, 2.13216, 1, 0, 0, 1, 1,
1.287331, 2.038736, -1.236593, 1, 0, 0, 1, 1,
1.296962, 0.03287522, 0.5006632, 0, 0, 0, 1, 1,
1.312112, -0.6156123, 1.057484, 0, 0, 0, 1, 1,
1.316284, 1.198306, 0.278542, 0, 0, 0, 1, 1,
1.320465, -0.2072079, 1.982957, 0, 0, 0, 1, 1,
1.345272, -0.1463005, 0.9709814, 0, 0, 0, 1, 1,
1.346655, -0.8975089, 1.267438, 0, 0, 0, 1, 1,
1.357261, 1.100126, 0.6560873, 0, 0, 0, 1, 1,
1.364842, 0.8669667, 0.3430237, 1, 1, 1, 1, 1,
1.3695, 1.058212, 0.08728327, 1, 1, 1, 1, 1,
1.382047, -1.312225, 2.427702, 1, 1, 1, 1, 1,
1.382603, -2.131879, 2.985348, 1, 1, 1, 1, 1,
1.385255, -0.1973447, 1.277873, 1, 1, 1, 1, 1,
1.391255, -1.242792, 2.276726, 1, 1, 1, 1, 1,
1.417247, -0.3922901, 1.32027, 1, 1, 1, 1, 1,
1.417672, -1.116375, 0.4911766, 1, 1, 1, 1, 1,
1.423583, -1.051786, 0.8219611, 1, 1, 1, 1, 1,
1.427119, 0.4074431, 2.875579, 1, 1, 1, 1, 1,
1.456589, -1.135776, 1.943739, 1, 1, 1, 1, 1,
1.462225, 0.02798591, 1.398974, 1, 1, 1, 1, 1,
1.467016, -1.608294, 1.962729, 1, 1, 1, 1, 1,
1.469334, 0.4526361, 0.7285835, 1, 1, 1, 1, 1,
1.474231, -1.013591, 2.350072, 1, 1, 1, 1, 1,
1.480166, -1.194674, 2.311235, 0, 0, 1, 1, 1,
1.490199, -0.4968142, 2.755528, 1, 0, 0, 1, 1,
1.491541, -0.3684204, 1.92313, 1, 0, 0, 1, 1,
1.501512, 0.04417477, 1.003269, 1, 0, 0, 1, 1,
1.522842, 0.6189079, 1.682695, 1, 0, 0, 1, 1,
1.526054, -0.3472357, 3.758648, 1, 0, 0, 1, 1,
1.545177, -1.366195, 3.190442, 0, 0, 0, 1, 1,
1.547262, 0.2251428, 0.08106487, 0, 0, 0, 1, 1,
1.580162, 1.332291, 1.985823, 0, 0, 0, 1, 1,
1.594798, -1.598394, -0.2755322, 0, 0, 0, 1, 1,
1.5963, 0.4969231, 1.275719, 0, 0, 0, 1, 1,
1.600153, 0.03224779, 1.684657, 0, 0, 0, 1, 1,
1.613455, -0.6472177, 1.271763, 0, 0, 0, 1, 1,
1.618985, -0.9542114, 2.630497, 1, 1, 1, 1, 1,
1.619339, 0.9287404, 0.9128674, 1, 1, 1, 1, 1,
1.624983, 0.6856893, 2.138459, 1, 1, 1, 1, 1,
1.631396, 2.288729, 1.170739, 1, 1, 1, 1, 1,
1.637197, 1.99591, -0.04020192, 1, 1, 1, 1, 1,
1.637561, 0.9942371, 0.4768854, 1, 1, 1, 1, 1,
1.645918, 1.621536, 0.9967018, 1, 1, 1, 1, 1,
1.657337, 0.04951254, 2.675369, 1, 1, 1, 1, 1,
1.6668, -1.276516, 2.714503, 1, 1, 1, 1, 1,
1.69545, 0.1192482, 1.173469, 1, 1, 1, 1, 1,
1.713899, 0.5264634, 0.4327058, 1, 1, 1, 1, 1,
1.714172, -1.305832, 2.286588, 1, 1, 1, 1, 1,
1.726537, 1.396592, 1.389084, 1, 1, 1, 1, 1,
1.72729, 1.640762, 0.7831049, 1, 1, 1, 1, 1,
1.728252, 0.4770409, 0.8281245, 1, 1, 1, 1, 1,
1.731093, 0.6618935, 1.791016, 0, 0, 1, 1, 1,
1.733911, -0.4904371, 2.49074, 1, 0, 0, 1, 1,
1.735619, 0.5709688, 1.384799, 1, 0, 0, 1, 1,
1.737143, -0.125036, 2.489195, 1, 0, 0, 1, 1,
1.780602, -1.187016, 2.236722, 1, 0, 0, 1, 1,
1.791315, 0.2999738, 1.853719, 1, 0, 0, 1, 1,
1.791941, 0.09729929, 1.752997, 0, 0, 0, 1, 1,
1.815403, -0.2332474, 1.260289, 0, 0, 0, 1, 1,
1.818884, -0.4482567, 3.891198, 0, 0, 0, 1, 1,
1.819781, -1.498199, 4.126805, 0, 0, 0, 1, 1,
1.821451, -1.377683, 1.897935, 0, 0, 0, 1, 1,
1.847418, 1.096402, 0.3933758, 0, 0, 0, 1, 1,
1.853969, -1.094309, 2.487423, 0, 0, 0, 1, 1,
1.893208, 2.339396, 1.159126, 1, 1, 1, 1, 1,
1.896316, -1.11905, 1.792603, 1, 1, 1, 1, 1,
1.897016, -0.2914326, 2.315119, 1, 1, 1, 1, 1,
1.898222, 0.4379102, 0.1058516, 1, 1, 1, 1, 1,
1.953757, -1.207981, 0.3228583, 1, 1, 1, 1, 1,
1.987376, 0.8409382, 0.4065118, 1, 1, 1, 1, 1,
1.994016, -1.454301, 1.701177, 1, 1, 1, 1, 1,
1.995209, 0.5800719, 1.960411, 1, 1, 1, 1, 1,
2.000561, -0.8012227, 1.711728, 1, 1, 1, 1, 1,
2.01314, 0.6413529, 2.454131, 1, 1, 1, 1, 1,
2.014727, 0.7985414, 0.9799786, 1, 1, 1, 1, 1,
2.034628, -0.5936361, 2.919751, 1, 1, 1, 1, 1,
2.140339, 0.6049248, 1.121734, 1, 1, 1, 1, 1,
2.147539, 0.4949925, 0.1156123, 1, 1, 1, 1, 1,
2.150769, -1.656238, 2.52785, 1, 1, 1, 1, 1,
2.177408, -0.007899536, 1.584754, 0, 0, 1, 1, 1,
2.218118, -1.519498, 2.791893, 1, 0, 0, 1, 1,
2.233681, -1.36542, 0.3016262, 1, 0, 0, 1, 1,
2.253176, -0.2100036, 0.7380293, 1, 0, 0, 1, 1,
2.282957, 2.008896, -0.1484698, 1, 0, 0, 1, 1,
2.299938, 0.4767074, 0.6820467, 1, 0, 0, 1, 1,
2.409893, -1.493348, 0.772418, 0, 0, 0, 1, 1,
2.468821, -0.3483632, 1.342536, 0, 0, 0, 1, 1,
2.573414, 0.4447467, 0.2482795, 0, 0, 0, 1, 1,
2.650829, 1.268029, 1.899634, 0, 0, 0, 1, 1,
2.671951, 2.228891, 0.2818902, 0, 0, 0, 1, 1,
2.773159, 1.762249, -0.00101363, 0, 0, 0, 1, 1,
2.783366, -0.6031131, 1.885643, 0, 0, 0, 1, 1,
2.789751, 1.707363, 0.8120206, 1, 1, 1, 1, 1,
2.834181, -0.6535671, 2.187916, 1, 1, 1, 1, 1,
2.843382, 0.1536587, 0.6417981, 1, 1, 1, 1, 1,
2.919966, -0.5820182, 2.726076, 1, 1, 1, 1, 1,
3.138524, 0.7355906, -1.054292, 1, 1, 1, 1, 1,
3.508649, 0.5907848, 1.581214, 1, 1, 1, 1, 1,
3.701421, -0.1412981, 2.235066, 1, 1, 1, 1, 1
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
var radius = 9.899405;
var distance = 34.77124;
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
mvMatrix.translate( -0.325834, -0.3667669, -0.1192782 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.77124);
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
