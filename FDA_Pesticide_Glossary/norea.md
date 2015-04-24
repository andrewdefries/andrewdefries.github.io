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
-3.269506, -0.2447309, -1.75031, 1, 0, 0, 1,
-2.647023, -0.2481534, -1.010123, 1, 0.007843138, 0, 1,
-2.635825, 0.417661, -2.105284, 1, 0.01176471, 0, 1,
-2.574401, 0.6247296, -2.170371, 1, 0.01960784, 0, 1,
-2.55923, 0.5054631, -1.338143, 1, 0.02352941, 0, 1,
-2.510741, 0.2769278, -1.811473, 1, 0.03137255, 0, 1,
-2.373352, 0.3520437, -1.015286, 1, 0.03529412, 0, 1,
-2.349006, -2.4079, -1.064683, 1, 0.04313726, 0, 1,
-2.327882, -0.2040629, -2.495106, 1, 0.04705882, 0, 1,
-2.301998, 1.740188, -0.8336394, 1, 0.05490196, 0, 1,
-2.299999, 1.754277, -2.132839, 1, 0.05882353, 0, 1,
-2.183212, 0.219074, -2.380524, 1, 0.06666667, 0, 1,
-2.173374, 0.7440171, -0.9999188, 1, 0.07058824, 0, 1,
-2.172722, -0.7792767, 0.9628053, 1, 0.07843138, 0, 1,
-2.150217, -0.8819629, -0.07899964, 1, 0.08235294, 0, 1,
-2.114996, 0.4196798, -2.460768, 1, 0.09019608, 0, 1,
-2.054692, -0.08859435, -3.727614, 1, 0.09411765, 0, 1,
-2.047801, -0.3248197, -0.438756, 1, 0.1019608, 0, 1,
-2.005909, -0.1206737, -1.831085, 1, 0.1098039, 0, 1,
-1.994981, 0.7042044, -0.8446077, 1, 0.1137255, 0, 1,
-1.983788, 2.114254, -1.625444, 1, 0.1215686, 0, 1,
-1.970234, 0.1949904, -0.9862376, 1, 0.1254902, 0, 1,
-1.965816, -0.9078999, -1.187892, 1, 0.1333333, 0, 1,
-1.959396, 0.08646685, -1.303393, 1, 0.1372549, 0, 1,
-1.954679, 0.4293647, -1.196472, 1, 0.145098, 0, 1,
-1.944966, 0.3964935, -1.61706, 1, 0.1490196, 0, 1,
-1.940375, -0.4756837, -1.531302, 1, 0.1568628, 0, 1,
-1.926, 0.2376293, -1.11418, 1, 0.1607843, 0, 1,
-1.914448, 1.749762, 0.5881963, 1, 0.1686275, 0, 1,
-1.886355, 0.2210976, -0.7824861, 1, 0.172549, 0, 1,
-1.864137, -1.815933, -1.317992, 1, 0.1803922, 0, 1,
-1.785773, -1.786516, -1.557576, 1, 0.1843137, 0, 1,
-1.772163, -0.4147969, -0.9177676, 1, 0.1921569, 0, 1,
-1.769109, 0.3880866, -0.6588453, 1, 0.1960784, 0, 1,
-1.768813, -1.011793, -0.989637, 1, 0.2039216, 0, 1,
-1.746334, -0.06538212, -3.035969, 1, 0.2117647, 0, 1,
-1.728942, 1.172447, -0.5057245, 1, 0.2156863, 0, 1,
-1.718473, 0.982015, 0.7010506, 1, 0.2235294, 0, 1,
-1.715374, 1.305142, -0.3872388, 1, 0.227451, 0, 1,
-1.71155, 1.879244, -1.00058, 1, 0.2352941, 0, 1,
-1.702988, 0.159011, -0.1966724, 1, 0.2392157, 0, 1,
-1.694831, 0.1201273, -1.696913, 1, 0.2470588, 0, 1,
-1.68059, 1.090641, -1.269575, 1, 0.2509804, 0, 1,
-1.662018, -0.726361, -2.389383, 1, 0.2588235, 0, 1,
-1.657279, -0.06360277, -2.419944, 1, 0.2627451, 0, 1,
-1.653584, -1.665914, -4.20281, 1, 0.2705882, 0, 1,
-1.647179, -0.5728274, -2.213466, 1, 0.2745098, 0, 1,
-1.621546, -0.02721917, 0.9773752, 1, 0.282353, 0, 1,
-1.591303, 0.9730021, -1.35882, 1, 0.2862745, 0, 1,
-1.544125, -0.4448367, -1.204109, 1, 0.2941177, 0, 1,
-1.542795, 2.268476, 0.5641727, 1, 0.3019608, 0, 1,
-1.521617, 0.8903096, 0.9381838, 1, 0.3058824, 0, 1,
-1.521283, 0.0091752, -0.4471481, 1, 0.3137255, 0, 1,
-1.501828, 0.4268372, -2.18943, 1, 0.3176471, 0, 1,
-1.497049, 0.6429616, -0.2325298, 1, 0.3254902, 0, 1,
-1.489367, 0.6688327, -0.1653489, 1, 0.3294118, 0, 1,
-1.477436, -0.9261146, 0.5365623, 1, 0.3372549, 0, 1,
-1.472773, 0.8488151, -1.812147, 1, 0.3411765, 0, 1,
-1.448296, 0.2506123, 0.7084993, 1, 0.3490196, 0, 1,
-1.439738, 0.7850487, -1.887846, 1, 0.3529412, 0, 1,
-1.434379, 0.4866252, -0.9214575, 1, 0.3607843, 0, 1,
-1.42345, 0.7122128, -1.420024, 1, 0.3647059, 0, 1,
-1.423069, -1.139783, -1.731247, 1, 0.372549, 0, 1,
-1.417619, -0.6420003, -2.925345, 1, 0.3764706, 0, 1,
-1.416264, 0.2159323, -2.648537, 1, 0.3843137, 0, 1,
-1.412128, -1.243801, -2.119982, 1, 0.3882353, 0, 1,
-1.409811, 0.1423766, -0.528474, 1, 0.3960784, 0, 1,
-1.409736, -1.125652, -2.339335, 1, 0.4039216, 0, 1,
-1.407173, -0.50125, -2.789483, 1, 0.4078431, 0, 1,
-1.396847, -0.7859957, -2.357885, 1, 0.4156863, 0, 1,
-1.391646, -1.300717, -0.9277816, 1, 0.4196078, 0, 1,
-1.390086, -0.7344456, -1.553099, 1, 0.427451, 0, 1,
-1.388416, -0.2213645, -4.083885, 1, 0.4313726, 0, 1,
-1.379665, -1.862001, -4.398388, 1, 0.4392157, 0, 1,
-1.3747, -1.414412, -4.245074, 1, 0.4431373, 0, 1,
-1.371036, -0.6904156, -2.079464, 1, 0.4509804, 0, 1,
-1.361072, -1.146865, -1.47638, 1, 0.454902, 0, 1,
-1.358088, 0.3501137, -2.094279, 1, 0.4627451, 0, 1,
-1.347188, -0.9872501, -2.066983, 1, 0.4666667, 0, 1,
-1.346643, 0.3167686, -0.6643022, 1, 0.4745098, 0, 1,
-1.342521, 0.7923061, 1.818585, 1, 0.4784314, 0, 1,
-1.336764, -1.741312, -3.345196, 1, 0.4862745, 0, 1,
-1.309933, 0.9440639, -0.4524442, 1, 0.4901961, 0, 1,
-1.309858, -1.625677, -1.472536, 1, 0.4980392, 0, 1,
-1.295343, 0.5072147, -2.067709, 1, 0.5058824, 0, 1,
-1.294734, -0.4231728, -0.9289544, 1, 0.509804, 0, 1,
-1.291269, -1.201281, -4.672524, 1, 0.5176471, 0, 1,
-1.285373, -0.4764856, -3.081576, 1, 0.5215687, 0, 1,
-1.282526, 1.962507, 0.04627843, 1, 0.5294118, 0, 1,
-1.268102, -0.001927564, -2.748963, 1, 0.5333334, 0, 1,
-1.26516, -0.1590948, -1.033105, 1, 0.5411765, 0, 1,
-1.263775, 0.7375246, -0.6254005, 1, 0.5450981, 0, 1,
-1.261271, 1.023453, -0.5223471, 1, 0.5529412, 0, 1,
-1.256804, -0.1795395, -3.196892, 1, 0.5568628, 0, 1,
-1.256796, -0.223066, -1.595315, 1, 0.5647059, 0, 1,
-1.249639, -1.219718, -5.03693, 1, 0.5686275, 0, 1,
-1.242269, 0.2595641, -1.955692, 1, 0.5764706, 0, 1,
-1.236262, -1.066, -2.138831, 1, 0.5803922, 0, 1,
-1.231848, -0.4771584, -1.986536, 1, 0.5882353, 0, 1,
-1.230354, -1.13634, -2.215084, 1, 0.5921569, 0, 1,
-1.224544, -0.5501496, -2.453576, 1, 0.6, 0, 1,
-1.220662, -0.4619334, -1.629983, 1, 0.6078432, 0, 1,
-1.212717, 1.239556, 0.4033549, 1, 0.6117647, 0, 1,
-1.212352, -0.4329353, -0.6467355, 1, 0.6196079, 0, 1,
-1.211629, -0.8257895, -1.538149, 1, 0.6235294, 0, 1,
-1.209911, 1.472062, -0.2880972, 1, 0.6313726, 0, 1,
-1.208964, -0.005910089, -2.440492, 1, 0.6352941, 0, 1,
-1.206106, 0.1002257, -1.584187, 1, 0.6431373, 0, 1,
-1.205307, 1.236655, -0.1121925, 1, 0.6470588, 0, 1,
-1.2016, 0.03156935, -3.666971, 1, 0.654902, 0, 1,
-1.200134, 0.3716825, -1.794937, 1, 0.6588235, 0, 1,
-1.199227, -0.7743722, -2.549102, 1, 0.6666667, 0, 1,
-1.196734, 0.3390366, -1.701832, 1, 0.6705883, 0, 1,
-1.18681, 0.2910042, -0.0804003, 1, 0.6784314, 0, 1,
-1.18142, 1.133859, -0.3278067, 1, 0.682353, 0, 1,
-1.181352, 0.2510934, -1.545214, 1, 0.6901961, 0, 1,
-1.18119, -0.2186894, -0.4134201, 1, 0.6941177, 0, 1,
-1.180718, 1.170703, -1.811052, 1, 0.7019608, 0, 1,
-1.165326, -1.423511, -2.695853, 1, 0.7098039, 0, 1,
-1.165215, -1.053512, -1.975878, 1, 0.7137255, 0, 1,
-1.164307, -1.589608, -2.352119, 1, 0.7215686, 0, 1,
-1.157787, -0.7913333, -0.865431, 1, 0.7254902, 0, 1,
-1.157497, -0.03830297, -2.066553, 1, 0.7333333, 0, 1,
-1.157302, -1.608304, -3.754092, 1, 0.7372549, 0, 1,
-1.156924, 0.6330844, 0.2604214, 1, 0.7450981, 0, 1,
-1.156851, -0.8042274, -2.281571, 1, 0.7490196, 0, 1,
-1.152113, -1.130238, -2.442302, 1, 0.7568628, 0, 1,
-1.145475, -0.5748922, -2.677228, 1, 0.7607843, 0, 1,
-1.140261, 1.723836, -0.2854972, 1, 0.7686275, 0, 1,
-1.139716, 0.2052673, -0.0231272, 1, 0.772549, 0, 1,
-1.128696, 0.163478, -1.110547, 1, 0.7803922, 0, 1,
-1.124173, 0.5677669, -0.04246981, 1, 0.7843137, 0, 1,
-1.121083, -0.6734713, -1.565106, 1, 0.7921569, 0, 1,
-1.115896, -0.4036528, -0.8959384, 1, 0.7960784, 0, 1,
-1.110363, 0.380121, 0.02886845, 1, 0.8039216, 0, 1,
-1.108691, 2.439857, 2.878392, 1, 0.8117647, 0, 1,
-1.10368, 0.5101386, -0.5374084, 1, 0.8156863, 0, 1,
-1.09751, -0.3597583, -2.72255, 1, 0.8235294, 0, 1,
-1.090913, -0.1171792, -0.01965491, 1, 0.827451, 0, 1,
-1.082535, 3.501112, 0.01807152, 1, 0.8352941, 0, 1,
-1.080437, -0.2679368, -0.9863497, 1, 0.8392157, 0, 1,
-1.072665, 0.4494013, -0.3337284, 1, 0.8470588, 0, 1,
-1.05758, 0.9681112, -2.694943, 1, 0.8509804, 0, 1,
-1.055439, 0.5572883, -1.505929, 1, 0.8588235, 0, 1,
-1.039258, 0.523228, -1.303651, 1, 0.8627451, 0, 1,
-1.039101, -0.2461345, -1.680978, 1, 0.8705882, 0, 1,
-1.033872, 2.608569, 2.59361, 1, 0.8745098, 0, 1,
-1.032027, -1.217794, -3.815042, 1, 0.8823529, 0, 1,
-1.024518, -0.6449112, -1.887743, 1, 0.8862745, 0, 1,
-1.023983, -0.5963868, -0.9278446, 1, 0.8941177, 0, 1,
-1.021314, 0.09745456, -1.180494, 1, 0.8980392, 0, 1,
-1.020856, 0.6061073, -3.26343, 1, 0.9058824, 0, 1,
-1.020458, -0.1001082, -1.436338, 1, 0.9137255, 0, 1,
-1.011329, 0.464449, 0.9722432, 1, 0.9176471, 0, 1,
-1.010318, 0.6210169, -1.659767, 1, 0.9254902, 0, 1,
-1.002165, -1.569341, -2.032527, 1, 0.9294118, 0, 1,
-0.9986046, 1.299113, 0.1737691, 1, 0.9372549, 0, 1,
-0.9970307, 0.3778698, -1.548462, 1, 0.9411765, 0, 1,
-0.993449, 0.007530554, -2.399854, 1, 0.9490196, 0, 1,
-0.9897966, -0.5792522, -0.8146292, 1, 0.9529412, 0, 1,
-0.9879026, 0.7688584, -1.018189, 1, 0.9607843, 0, 1,
-0.9852368, 0.5936399, -1.887366, 1, 0.9647059, 0, 1,
-0.97723, 0.6703388, 0.1034194, 1, 0.972549, 0, 1,
-0.9767419, -0.7193832, -2.486237, 1, 0.9764706, 0, 1,
-0.9731625, -0.02115318, -1.267294, 1, 0.9843137, 0, 1,
-0.9696391, -0.2214463, -1.670822, 1, 0.9882353, 0, 1,
-0.9668449, -0.2351838, -0.01676784, 1, 0.9960784, 0, 1,
-0.9497269, 1.895437, -1.012178, 0.9960784, 1, 0, 1,
-0.9495791, 0.7303527, -0.7254131, 0.9921569, 1, 0, 1,
-0.9419525, 0.5098228, -1.363536, 0.9843137, 1, 0, 1,
-0.9415172, -1.842739, -5.46545, 0.9803922, 1, 0, 1,
-0.9384857, 0.07681503, -1.283922, 0.972549, 1, 0, 1,
-0.9344737, -0.2488434, -2.228461, 0.9686275, 1, 0, 1,
-0.9343011, -1.789816, -0.4392379, 0.9607843, 1, 0, 1,
-0.9328486, -0.5186391, -1.863995, 0.9568627, 1, 0, 1,
-0.931023, -0.3827177, -3.137053, 0.9490196, 1, 0, 1,
-0.9270373, 1.13519, -1.959704, 0.945098, 1, 0, 1,
-0.9188902, 0.4889777, -1.096862, 0.9372549, 1, 0, 1,
-0.9122594, 1.267819, -0.5583115, 0.9333333, 1, 0, 1,
-0.9106098, 1.218945, -3.500149, 0.9254902, 1, 0, 1,
-0.908308, 0.5376559, -0.4586104, 0.9215686, 1, 0, 1,
-0.906642, -1.8418, -2.921477, 0.9137255, 1, 0, 1,
-0.9020498, -1.221497, -1.861757, 0.9098039, 1, 0, 1,
-0.9019266, -0.644981, -2.306223, 0.9019608, 1, 0, 1,
-0.9018896, -1.212599, -1.923572, 0.8941177, 1, 0, 1,
-0.9017382, -0.2243238, -2.567789, 0.8901961, 1, 0, 1,
-0.8949518, 0.7367651, -1.852322, 0.8823529, 1, 0, 1,
-0.8855047, 2.011983, -1.614349, 0.8784314, 1, 0, 1,
-0.8851429, -0.05393443, -1.807934, 0.8705882, 1, 0, 1,
-0.8784007, -0.8780016, -2.622348, 0.8666667, 1, 0, 1,
-0.8702269, 2.450567, 2.515208, 0.8588235, 1, 0, 1,
-0.8688961, -0.4947486, -3.532128, 0.854902, 1, 0, 1,
-0.8569937, -0.02218473, -2.487667, 0.8470588, 1, 0, 1,
-0.8501772, 0.5087398, -0.1305007, 0.8431373, 1, 0, 1,
-0.8452706, -0.4580122, -0.8854933, 0.8352941, 1, 0, 1,
-0.8444744, 0.166515, -0.3929409, 0.8313726, 1, 0, 1,
-0.8440781, 0.7345499, -0.01181483, 0.8235294, 1, 0, 1,
-0.8432748, 0.07839967, -0.925268, 0.8196079, 1, 0, 1,
-0.8418581, 0.04997304, -0.1517487, 0.8117647, 1, 0, 1,
-0.8399222, 0.3288022, -2.606404, 0.8078431, 1, 0, 1,
-0.8348939, -1.146174, -3.662612, 0.8, 1, 0, 1,
-0.8343173, 0.8818322, -2.148102, 0.7921569, 1, 0, 1,
-0.8326146, 0.6469629, -1.060935, 0.7882353, 1, 0, 1,
-0.8325443, 0.8617207, -0.2905431, 0.7803922, 1, 0, 1,
-0.8320785, -0.4809228, 0.4738244, 0.7764706, 1, 0, 1,
-0.827652, 1.206475, 0.9798136, 0.7686275, 1, 0, 1,
-0.8243129, 1.02059, -2.106724, 0.7647059, 1, 0, 1,
-0.8172581, -0.7777066, -2.023754, 0.7568628, 1, 0, 1,
-0.8122684, -1.081427, -2.94988, 0.7529412, 1, 0, 1,
-0.8098194, -0.06705325, -2.273282, 0.7450981, 1, 0, 1,
-0.8063194, -0.2961642, -1.640788, 0.7411765, 1, 0, 1,
-0.7939795, 1.515274, -0.8571305, 0.7333333, 1, 0, 1,
-0.7928678, 0.3408723, -1.439338, 0.7294118, 1, 0, 1,
-0.7915569, -0.05596341, -1.8846, 0.7215686, 1, 0, 1,
-0.7881544, -0.8654101, -3.16935, 0.7176471, 1, 0, 1,
-0.7872129, -1.111094, -2.299396, 0.7098039, 1, 0, 1,
-0.7798942, -0.8896531, -3.079547, 0.7058824, 1, 0, 1,
-0.7789624, -1.009308, -1.06171, 0.6980392, 1, 0, 1,
-0.7689998, -0.9348556, -0.3291925, 0.6901961, 1, 0, 1,
-0.7647959, -0.4895022, -1.765504, 0.6862745, 1, 0, 1,
-0.7518249, -2.093628, -2.444381, 0.6784314, 1, 0, 1,
-0.7513463, 1.025681, -0.1164193, 0.6745098, 1, 0, 1,
-0.7486918, 0.7320523, 0.2956835, 0.6666667, 1, 0, 1,
-0.7479422, 0.1384241, -1.565957, 0.6627451, 1, 0, 1,
-0.7374757, -0.2618675, -1.82562, 0.654902, 1, 0, 1,
-0.7335205, 0.2940308, -2.900881, 0.6509804, 1, 0, 1,
-0.7327064, -0.319795, -2.336963, 0.6431373, 1, 0, 1,
-0.7304298, -0.2606824, -2.104484, 0.6392157, 1, 0, 1,
-0.7286699, 0.2136839, -2.514971, 0.6313726, 1, 0, 1,
-0.7286038, -1.312073, -3.62377, 0.627451, 1, 0, 1,
-0.727775, -1.217978, -4.033055, 0.6196079, 1, 0, 1,
-0.7257647, -0.8336772, -2.044837, 0.6156863, 1, 0, 1,
-0.7234992, 0.04994066, -2.244152, 0.6078432, 1, 0, 1,
-0.716427, -0.5445289, -3.02213, 0.6039216, 1, 0, 1,
-0.7125273, -1.766123, -1.185497, 0.5960785, 1, 0, 1,
-0.7125248, -0.2523032, -0.7149027, 0.5882353, 1, 0, 1,
-0.711584, 0.1119869, -0.1832566, 0.5843138, 1, 0, 1,
-0.7094129, 0.1211628, -1.783892, 0.5764706, 1, 0, 1,
-0.7076497, 1.777488, -0.773329, 0.572549, 1, 0, 1,
-0.7061592, 0.5971503, 0.1048359, 0.5647059, 1, 0, 1,
-0.704102, -0.5610028, -3.018752, 0.5607843, 1, 0, 1,
-0.7016762, 0.6013159, -1.352114, 0.5529412, 1, 0, 1,
-0.7009725, -1.300734, -2.630818, 0.5490196, 1, 0, 1,
-0.7003469, -0.7322875, -1.996121, 0.5411765, 1, 0, 1,
-0.6995232, -0.2552492, -2.184143, 0.5372549, 1, 0, 1,
-0.6942689, 1.137021, 1.455505, 0.5294118, 1, 0, 1,
-0.6884919, -0.847207, -1.997584, 0.5254902, 1, 0, 1,
-0.6845864, -0.7518287, -1.278588, 0.5176471, 1, 0, 1,
-0.6740991, -0.3723424, -1.550367, 0.5137255, 1, 0, 1,
-0.66928, 1.887819, 0.4713188, 0.5058824, 1, 0, 1,
-0.668667, -0.01308021, -1.602213, 0.5019608, 1, 0, 1,
-0.6587505, 1.726824, 0.6260976, 0.4941176, 1, 0, 1,
-0.6573744, 0.01468079, -1.068807, 0.4862745, 1, 0, 1,
-0.6554249, 0.04515415, -1.85858, 0.4823529, 1, 0, 1,
-0.6513933, 0.992411, -0.5322877, 0.4745098, 1, 0, 1,
-0.6499431, -0.848534, -3.624099, 0.4705882, 1, 0, 1,
-0.6484579, 0.5950404, -1.124059, 0.4627451, 1, 0, 1,
-0.6460626, 0.7954056, 0.9482166, 0.4588235, 1, 0, 1,
-0.6448383, -1.932301, -3.538203, 0.4509804, 1, 0, 1,
-0.6422234, -1.033272, -3.9748, 0.4470588, 1, 0, 1,
-0.6379761, -0.2742487, -1.836613, 0.4392157, 1, 0, 1,
-0.6371239, 0.3834967, -0.5447831, 0.4352941, 1, 0, 1,
-0.6362762, -1.159853, -2.1143, 0.427451, 1, 0, 1,
-0.636024, 2.785186, -0.58377, 0.4235294, 1, 0, 1,
-0.6347915, 1.165916, -2.051709, 0.4156863, 1, 0, 1,
-0.6295536, -0.5454389, -2.557128, 0.4117647, 1, 0, 1,
-0.6266423, -0.5268902, -1.804429, 0.4039216, 1, 0, 1,
-0.6254064, -0.7369357, -2.382473, 0.3960784, 1, 0, 1,
-0.6248879, 0.5399649, -2.937247, 0.3921569, 1, 0, 1,
-0.6208218, -0.3065085, -2.416499, 0.3843137, 1, 0, 1,
-0.6103675, 0.399692, -1.340435, 0.3803922, 1, 0, 1,
-0.6092615, -0.9844219, -2.946495, 0.372549, 1, 0, 1,
-0.6040226, -1.678888, -3.505332, 0.3686275, 1, 0, 1,
-0.603851, -0.3068582, -2.965848, 0.3607843, 1, 0, 1,
-0.5989247, -0.1270156, -2.122692, 0.3568628, 1, 0, 1,
-0.5963892, 0.8323674, -1.070312, 0.3490196, 1, 0, 1,
-0.5954803, -0.3208614, -1.309432, 0.345098, 1, 0, 1,
-0.5940351, -1.290841, -3.31984, 0.3372549, 1, 0, 1,
-0.5937706, -1.032908, -1.165731, 0.3333333, 1, 0, 1,
-0.5876648, 0.214949, -1.373401, 0.3254902, 1, 0, 1,
-0.5840017, -0.8797375, -2.762836, 0.3215686, 1, 0, 1,
-0.5811267, -0.5703167, -2.505702, 0.3137255, 1, 0, 1,
-0.5747333, 0.2746633, -2.473401, 0.3098039, 1, 0, 1,
-0.5727028, 0.5782758, -1.059049, 0.3019608, 1, 0, 1,
-0.5614461, -0.2579901, -1.29164, 0.2941177, 1, 0, 1,
-0.5610204, -0.1046351, -2.045776, 0.2901961, 1, 0, 1,
-0.5523099, 0.9164734, 0.2057611, 0.282353, 1, 0, 1,
-0.5515773, -0.6601309, -4.309417, 0.2784314, 1, 0, 1,
-0.5511259, 0.6920072, -0.4383432, 0.2705882, 1, 0, 1,
-0.5473642, 0.06566829, -0.7951697, 0.2666667, 1, 0, 1,
-0.5469525, 0.3526508, -0.578783, 0.2588235, 1, 0, 1,
-0.5395673, -1.296781, -2.802555, 0.254902, 1, 0, 1,
-0.5393529, 1.05438, -0.3767644, 0.2470588, 1, 0, 1,
-0.537551, 2.679476, -0.348799, 0.2431373, 1, 0, 1,
-0.5354753, 0.780802, -0.2689216, 0.2352941, 1, 0, 1,
-0.5353119, 1.62933, -0.3886939, 0.2313726, 1, 0, 1,
-0.5330106, 0.283854, -0.4201034, 0.2235294, 1, 0, 1,
-0.5321336, -0.552726, -3.144329, 0.2196078, 1, 0, 1,
-0.5318631, 0.2558978, -1.031424, 0.2117647, 1, 0, 1,
-0.5288666, 0.6577833, -0.7589588, 0.2078431, 1, 0, 1,
-0.5246047, -0.6656493, -0.5684384, 0.2, 1, 0, 1,
-0.519265, 0.7401729, 1.722104, 0.1921569, 1, 0, 1,
-0.5148525, -0.7723063, -2.629345, 0.1882353, 1, 0, 1,
-0.5050598, 0.4696965, -0.9954259, 0.1803922, 1, 0, 1,
-0.4999567, 0.8992783, -0.3694592, 0.1764706, 1, 0, 1,
-0.4994426, -0.7712661, -2.987703, 0.1686275, 1, 0, 1,
-0.4987739, -0.4742619, -1.93582, 0.1647059, 1, 0, 1,
-0.497861, 0.4786806, -0.7184516, 0.1568628, 1, 0, 1,
-0.4975444, 0.630438, -0.7879497, 0.1529412, 1, 0, 1,
-0.4973325, 1.368225, -1.026224, 0.145098, 1, 0, 1,
-0.4970168, 0.7017069, 0.3609937, 0.1411765, 1, 0, 1,
-0.4968933, 1.405409, -1.458005, 0.1333333, 1, 0, 1,
-0.494559, 0.9607795, -0.8444571, 0.1294118, 1, 0, 1,
-0.4936726, 0.3563003, -2.284981, 0.1215686, 1, 0, 1,
-0.4932655, -1.045316, -2.50341, 0.1176471, 1, 0, 1,
-0.4912315, 1.811337, 1.848557, 0.1098039, 1, 0, 1,
-0.4840427, 1.8643, -1.455136, 0.1058824, 1, 0, 1,
-0.4789574, -1.283679, -4.126377, 0.09803922, 1, 0, 1,
-0.4786267, 1.098806, 1.358646, 0.09019608, 1, 0, 1,
-0.4776137, 0.2247214, -1.230967, 0.08627451, 1, 0, 1,
-0.475899, 0.6335998, -2.08559, 0.07843138, 1, 0, 1,
-0.4758083, 0.4328191, 0.6531319, 0.07450981, 1, 0, 1,
-0.4717844, -0.8377816, -4.156455, 0.06666667, 1, 0, 1,
-0.4717284, 0.06132001, -2.64411, 0.0627451, 1, 0, 1,
-0.4704768, 0.1203946, 0.6565443, 0.05490196, 1, 0, 1,
-0.4675558, 0.5157026, -0.9765512, 0.05098039, 1, 0, 1,
-0.4603584, 0.5028279, -0.8252655, 0.04313726, 1, 0, 1,
-0.4551982, 0.5935798, -0.1254804, 0.03921569, 1, 0, 1,
-0.4486913, 1.255008, 0.2438542, 0.03137255, 1, 0, 1,
-0.4436415, -0.4580312, -1.529517, 0.02745098, 1, 0, 1,
-0.4427343, -1.359812, -2.697384, 0.01960784, 1, 0, 1,
-0.4412291, 1.656558, -0.3350227, 0.01568628, 1, 0, 1,
-0.4395395, -1.439762, -1.538483, 0.007843138, 1, 0, 1,
-0.4379987, 0.03644607, -2.094479, 0.003921569, 1, 0, 1,
-0.4340653, 0.7905398, -2.267371, 0, 1, 0.003921569, 1,
-0.4310142, 0.2442236, -1.26519, 0, 1, 0.01176471, 1,
-0.4236113, -1.004122, -2.679785, 0, 1, 0.01568628, 1,
-0.4235863, 1.200816, -0.2190985, 0, 1, 0.02352941, 1,
-0.4204706, 1.454509, 1.525521, 0, 1, 0.02745098, 1,
-0.4202305, -1.093147, -2.778244, 0, 1, 0.03529412, 1,
-0.4175443, 0.6823868, 1.061837, 0, 1, 0.03921569, 1,
-0.4143727, -1.431956, -3.504402, 0, 1, 0.04705882, 1,
-0.4138106, 0.3031551, -1.976785, 0, 1, 0.05098039, 1,
-0.4134953, -0.9183341, -3.655022, 0, 1, 0.05882353, 1,
-0.4064973, 1.26733, -2.853226, 0, 1, 0.0627451, 1,
-0.3993183, 0.8615995, -1.017575, 0, 1, 0.07058824, 1,
-0.3915615, 0.9284086, -2.029606, 0, 1, 0.07450981, 1,
-0.3892502, -0.08638777, -2.455412, 0, 1, 0.08235294, 1,
-0.3881367, 0.9689978, -1.746642, 0, 1, 0.08627451, 1,
-0.3838693, -0.2773833, -2.234605, 0, 1, 0.09411765, 1,
-0.3838244, 1.531451, 0.8237283, 0, 1, 0.1019608, 1,
-0.3832077, 0.6258928, -0.8293644, 0, 1, 0.1058824, 1,
-0.3808415, -0.9552196, -3.262985, 0, 1, 0.1137255, 1,
-0.377025, 0.002264723, -2.031638, 0, 1, 0.1176471, 1,
-0.374101, -0.491043, 0.2067217, 0, 1, 0.1254902, 1,
-0.3737434, 0.06194599, -0.810004, 0, 1, 0.1294118, 1,
-0.3681025, -0.765577, -3.896518, 0, 1, 0.1372549, 1,
-0.3657348, -0.2256261, -1.304594, 0, 1, 0.1411765, 1,
-0.3656409, -0.1881223, -2.606946, 0, 1, 0.1490196, 1,
-0.3592333, -0.07502802, -0.9681447, 0, 1, 0.1529412, 1,
-0.3542812, -1.834011, -2.987264, 0, 1, 0.1607843, 1,
-0.350101, -1.739304, -2.306798, 0, 1, 0.1647059, 1,
-0.3488396, -0.7586255, -2.976408, 0, 1, 0.172549, 1,
-0.3487611, -0.5079709, -3.226705, 0, 1, 0.1764706, 1,
-0.3478289, -1.016455, -2.46376, 0, 1, 0.1843137, 1,
-0.3362509, -0.1154352, -1.735594, 0, 1, 0.1882353, 1,
-0.3333317, -1.86977, -4.109334, 0, 1, 0.1960784, 1,
-0.3282927, 0.6687143, 0.4273734, 0, 1, 0.2039216, 1,
-0.3264574, -1.515836, -1.912729, 0, 1, 0.2078431, 1,
-0.3228134, -0.01388244, -2.033941, 0, 1, 0.2156863, 1,
-0.317247, -0.8384634, -2.444693, 0, 1, 0.2196078, 1,
-0.3169577, 0.09203024, -2.023938, 0, 1, 0.227451, 1,
-0.3144699, -1.351441, -4.363757, 0, 1, 0.2313726, 1,
-0.312546, 0.2392283, -1.083292, 0, 1, 0.2392157, 1,
-0.3124048, 1.673076, -0.9900052, 0, 1, 0.2431373, 1,
-0.3071103, -0.494483, -2.759948, 0, 1, 0.2509804, 1,
-0.3052294, -0.1830512, -1.139487, 0, 1, 0.254902, 1,
-0.3030648, 0.2792717, -0.6573729, 0, 1, 0.2627451, 1,
-0.3021398, -0.8168449, -2.299576, 0, 1, 0.2666667, 1,
-0.3020307, -1.009859, -2.833842, 0, 1, 0.2745098, 1,
-0.299209, 0.5825428, 0.05266576, 0, 1, 0.2784314, 1,
-0.2979451, 1.063409, -0.3470083, 0, 1, 0.2862745, 1,
-0.2966854, -0.5261946, -4.053455, 0, 1, 0.2901961, 1,
-0.2943534, -1.015106, -3.638232, 0, 1, 0.2980392, 1,
-0.293019, 0.9510293, -1.163093, 0, 1, 0.3058824, 1,
-0.2908294, 0.4930253, -0.4436585, 0, 1, 0.3098039, 1,
-0.2906895, -0.1773219, -2.488172, 0, 1, 0.3176471, 1,
-0.2894594, 0.9739307, 0.2291951, 0, 1, 0.3215686, 1,
-0.2893625, -1.611453, -2.92879, 0, 1, 0.3294118, 1,
-0.2874141, 1.412149, -0.0300222, 0, 1, 0.3333333, 1,
-0.2835107, -0.1939398, -2.575557, 0, 1, 0.3411765, 1,
-0.2828186, 1.402217, 1.690719, 0, 1, 0.345098, 1,
-0.2770238, -1.172345, -3.744862, 0, 1, 0.3529412, 1,
-0.2699306, -0.7188079, -1.811375, 0, 1, 0.3568628, 1,
-0.2684487, 0.3484989, 0.580954, 0, 1, 0.3647059, 1,
-0.2580093, -0.0616693, -2.617276, 0, 1, 0.3686275, 1,
-0.252576, 1.737961, 1.339291, 0, 1, 0.3764706, 1,
-0.2524676, 0.2367821, -0.2159549, 0, 1, 0.3803922, 1,
-0.2503107, 0.8541925, -0.9057526, 0, 1, 0.3882353, 1,
-0.2502599, 0.2587419, 0.05268613, 0, 1, 0.3921569, 1,
-0.2456529, 0.376927, -1.779489, 0, 1, 0.4, 1,
-0.2451904, -0.3985062, -2.685886, 0, 1, 0.4078431, 1,
-0.2448568, 1.016398, -2.405104, 0, 1, 0.4117647, 1,
-0.2415581, -0.5113668, -2.695304, 0, 1, 0.4196078, 1,
-0.2404186, 0.3174986, -1.994818, 0, 1, 0.4235294, 1,
-0.2365878, -1.148576, -3.878949, 0, 1, 0.4313726, 1,
-0.2311642, -1.651255, -1.784271, 0, 1, 0.4352941, 1,
-0.2249351, -0.8219469, -3.383567, 0, 1, 0.4431373, 1,
-0.221887, -0.1970313, -2.740098, 0, 1, 0.4470588, 1,
-0.221832, -0.2378365, -0.540978, 0, 1, 0.454902, 1,
-0.2180867, -0.8082189, -1.74119, 0, 1, 0.4588235, 1,
-0.2170106, 0.1873408, -0.8626984, 0, 1, 0.4666667, 1,
-0.2138553, -0.3580295, -2.5437, 0, 1, 0.4705882, 1,
-0.2132683, 0.05462924, -1.909084, 0, 1, 0.4784314, 1,
-0.2123343, 1.292917, -0.4793697, 0, 1, 0.4823529, 1,
-0.2111399, -1.127331, -0.850959, 0, 1, 0.4901961, 1,
-0.2089658, -0.3699209, -4.047688, 0, 1, 0.4941176, 1,
-0.2082556, -2.30915, -2.796975, 0, 1, 0.5019608, 1,
-0.2068946, -0.8174874, -3.862252, 0, 1, 0.509804, 1,
-0.2053946, -2.62885, -4.161192, 0, 1, 0.5137255, 1,
-0.2034973, -1.344412, -2.504602, 0, 1, 0.5215687, 1,
-0.2007978, -0.4923926, -1.055613, 0, 1, 0.5254902, 1,
-0.1997634, 0.9133272, 0.31975, 0, 1, 0.5333334, 1,
-0.1924347, 1.060314, -1.79854, 0, 1, 0.5372549, 1,
-0.1916385, -0.2928998, -2.492587, 0, 1, 0.5450981, 1,
-0.1898772, -1.257637, -2.355891, 0, 1, 0.5490196, 1,
-0.1893232, -0.2433023, -2.003815, 0, 1, 0.5568628, 1,
-0.1867296, 1.61077, 0.5053338, 0, 1, 0.5607843, 1,
-0.1863991, 0.9308593, -0.2279824, 0, 1, 0.5686275, 1,
-0.1810234, -0.0613734, -2.218575, 0, 1, 0.572549, 1,
-0.1738917, -0.4062968, -3.090266, 0, 1, 0.5803922, 1,
-0.1716496, -1.180349, -3.377599, 0, 1, 0.5843138, 1,
-0.1700564, 0.7382478, -1.695374, 0, 1, 0.5921569, 1,
-0.1684222, -0.02655174, -2.220873, 0, 1, 0.5960785, 1,
-0.1663119, -0.4813586, -1.58552, 0, 1, 0.6039216, 1,
-0.1646869, -1.956382, -3.312898, 0, 1, 0.6117647, 1,
-0.1636896, -1.682684, -1.870076, 0, 1, 0.6156863, 1,
-0.1623335, 0.7508866, -0.01530065, 0, 1, 0.6235294, 1,
-0.1602295, -0.7829951, -3.327703, 0, 1, 0.627451, 1,
-0.1568101, 0.9418291, -1.094231, 0, 1, 0.6352941, 1,
-0.1550838, 0.977212, 0.7189294, 0, 1, 0.6392157, 1,
-0.1546221, 0.8976338, 1.043091, 0, 1, 0.6470588, 1,
-0.151725, 0.1188064, -1.383208, 0, 1, 0.6509804, 1,
-0.1514924, -0.932518, -5.812299, 0, 1, 0.6588235, 1,
-0.1481695, 0.9920331, -1.43742, 0, 1, 0.6627451, 1,
-0.1445379, -0.4399407, -3.712953, 0, 1, 0.6705883, 1,
-0.1445362, -0.6310057, -4.022106, 0, 1, 0.6745098, 1,
-0.1443838, -0.006310435, -1.430386, 0, 1, 0.682353, 1,
-0.1404617, -0.05342252, -1.33616, 0, 1, 0.6862745, 1,
-0.1373542, -0.5097283, -3.304354, 0, 1, 0.6941177, 1,
-0.1295219, 1.859006, -0.4538715, 0, 1, 0.7019608, 1,
-0.1292081, -1.252326, -2.422705, 0, 1, 0.7058824, 1,
-0.1266701, -1.012531, -5.187252, 0, 1, 0.7137255, 1,
-0.122176, 1.893253, -0.993515, 0, 1, 0.7176471, 1,
-0.1188279, -0.6244628, -1.486529, 0, 1, 0.7254902, 1,
-0.1162628, 0.2686167, 1.16011, 0, 1, 0.7294118, 1,
-0.1144792, 1.122237, -0.7525843, 0, 1, 0.7372549, 1,
-0.1130124, 1.033283, -0.8537778, 0, 1, 0.7411765, 1,
-0.112347, 0.3241912, -1.019603, 0, 1, 0.7490196, 1,
-0.1109721, 0.6674656, 0.6942928, 0, 1, 0.7529412, 1,
-0.110959, 1.209118, 0.3751042, 0, 1, 0.7607843, 1,
-0.1104958, 0.7676633, 1.555641, 0, 1, 0.7647059, 1,
-0.1089861, 1.105524, 0.08382469, 0, 1, 0.772549, 1,
-0.1022414, 0.1732967, -1.271383, 0, 1, 0.7764706, 1,
-0.1004703, 0.0983118, -1.144432, 0, 1, 0.7843137, 1,
-0.09909292, -0.3079549, -0.6797808, 0, 1, 0.7882353, 1,
-0.0976737, 2.174452, -0.8528928, 0, 1, 0.7960784, 1,
-0.09628564, 0.2280136, -1.342682, 0, 1, 0.8039216, 1,
-0.09320904, -0.7350249, -3.6874, 0, 1, 0.8078431, 1,
-0.08963691, 0.4438276, -0.9303529, 0, 1, 0.8156863, 1,
-0.08049203, 0.727977, -0.005725625, 0, 1, 0.8196079, 1,
-0.08006837, -0.2093737, -2.849751, 0, 1, 0.827451, 1,
-0.07589877, 0.6425044, -0.4252497, 0, 1, 0.8313726, 1,
-0.07532972, -0.9512246, -2.773975, 0, 1, 0.8392157, 1,
-0.06110545, 0.831433, 0.1694982, 0, 1, 0.8431373, 1,
-0.06060264, 0.4726503, 0.9273598, 0, 1, 0.8509804, 1,
-0.06004792, -1.012138, -2.514674, 0, 1, 0.854902, 1,
-0.06000859, -1.066532, -3.731907, 0, 1, 0.8627451, 1,
-0.0581799, 1.13608, -0.5282229, 0, 1, 0.8666667, 1,
-0.05367768, -1.325472, -3.838133, 0, 1, 0.8745098, 1,
-0.05205, -0.1376616, -1.74913, 0, 1, 0.8784314, 1,
-0.05142334, 0.7214444, -0.1039709, 0, 1, 0.8862745, 1,
-0.04930827, -2.353678, -3.12312, 0, 1, 0.8901961, 1,
-0.04826698, 0.4402867, 0.4245703, 0, 1, 0.8980392, 1,
-0.04794706, 0.9695917, 0.6021134, 0, 1, 0.9058824, 1,
-0.04791665, -0.5185942, -4.281815, 0, 1, 0.9098039, 1,
-0.04747052, 1.2111, 0.8115141, 0, 1, 0.9176471, 1,
-0.04147153, -0.09867143, -3.600832, 0, 1, 0.9215686, 1,
-0.0399535, 0.971656, 0.3630856, 0, 1, 0.9294118, 1,
-0.03744245, 0.6329264, 0.332845, 0, 1, 0.9333333, 1,
-0.03676593, -1.472074, -2.788918, 0, 1, 0.9411765, 1,
-0.03495842, -0.06561101, -0.6087797, 0, 1, 0.945098, 1,
-0.03464613, -0.2501366, -2.195139, 0, 1, 0.9529412, 1,
-0.03419075, 0.8023077, 0.2752278, 0, 1, 0.9568627, 1,
-0.03174233, 0.4275101, -1.263653, 0, 1, 0.9647059, 1,
-0.0313408, 0.7065939, 1.197951, 0, 1, 0.9686275, 1,
-0.03063835, 1.062332, -0.6344284, 0, 1, 0.9764706, 1,
-0.02950263, -0.383274, -1.804374, 0, 1, 0.9803922, 1,
-0.0293095, 0.5921578, -0.7839848, 0, 1, 0.9882353, 1,
-0.02896193, 0.5399346, 0.2579413, 0, 1, 0.9921569, 1,
-0.02274068, -0.2619799, -4.543511, 0, 1, 1, 1,
-0.01881802, -0.3684436, -2.455344, 0, 0.9921569, 1, 1,
-0.01806981, 2.478464, 0.4892413, 0, 0.9882353, 1, 1,
-0.01521711, -0.3265799, -2.807275, 0, 0.9803922, 1, 1,
-0.01457979, 0.4803018, -0.7747979, 0, 0.9764706, 1, 1,
-0.007086955, -0.7234275, -1.237275, 0, 0.9686275, 1, 1,
-0.006589641, 1.142468, -1.267148, 0, 0.9647059, 1, 1,
-0.001910129, 0.6452269, 0.2647578, 0, 0.9568627, 1, 1,
0.004544737, 0.1407001, 0.3789286, 0, 0.9529412, 1, 1,
0.01071566, 2.091777, 1.664693, 0, 0.945098, 1, 1,
0.01386207, 1.382681, -2.939061, 0, 0.9411765, 1, 1,
0.01483115, -0.1111257, 4.010581, 0, 0.9333333, 1, 1,
0.01510406, -0.4163426, 3.053643, 0, 0.9294118, 1, 1,
0.01725557, 0.3112857, -0.8801495, 0, 0.9215686, 1, 1,
0.01853104, 1.163853, 0.287141, 0, 0.9176471, 1, 1,
0.02323107, -0.0690548, 2.540411, 0, 0.9098039, 1, 1,
0.02381214, -0.6303707, 3.81771, 0, 0.9058824, 1, 1,
0.026234, 0.5732057, -0.02318449, 0, 0.8980392, 1, 1,
0.02820512, -0.153534, 2.842589, 0, 0.8901961, 1, 1,
0.0356724, -0.4681288, 4.338678, 0, 0.8862745, 1, 1,
0.03614317, -1.157168, 2.342792, 0, 0.8784314, 1, 1,
0.0381513, -1.018463, 4.25236, 0, 0.8745098, 1, 1,
0.04019494, 0.05081814, 1.34145, 0, 0.8666667, 1, 1,
0.0417922, 1.841414, 0.4819739, 0, 0.8627451, 1, 1,
0.04343706, 1.22443, -1.129799, 0, 0.854902, 1, 1,
0.04522967, 1.3945, -0.09286089, 0, 0.8509804, 1, 1,
0.04973108, 1.443951, -0.4927322, 0, 0.8431373, 1, 1,
0.05360035, -1.028141, 3.485139, 0, 0.8392157, 1, 1,
0.06452946, -2.045239, 3.118209, 0, 0.8313726, 1, 1,
0.07244537, -0.004894441, -0.5578591, 0, 0.827451, 1, 1,
0.08064902, 0.7559125, -1.382097, 0, 0.8196079, 1, 1,
0.08488668, -0.5811448, 3.456163, 0, 0.8156863, 1, 1,
0.08744595, -3.156662, 3.791821, 0, 0.8078431, 1, 1,
0.08826301, -1.254353, 1.971133, 0, 0.8039216, 1, 1,
0.08988829, -1.661835, 2.545784, 0, 0.7960784, 1, 1,
0.09332316, -0.3098366, 2.476255, 0, 0.7882353, 1, 1,
0.09475461, 1.086813, -0.3933818, 0, 0.7843137, 1, 1,
0.1023378, -1.559508, 3.846787, 0, 0.7764706, 1, 1,
0.1045326, -1.702864, 2.043538, 0, 0.772549, 1, 1,
0.1052776, -1.61512, 0.8656006, 0, 0.7647059, 1, 1,
0.1079151, 0.746936, 1.089534, 0, 0.7607843, 1, 1,
0.1080282, -1.374076, 2.885396, 0, 0.7529412, 1, 1,
0.1126012, 0.1132387, 1.998155, 0, 0.7490196, 1, 1,
0.1142151, 0.2119752, -0.5843714, 0, 0.7411765, 1, 1,
0.1181613, -0.4466956, 3.98871, 0, 0.7372549, 1, 1,
0.1205972, 0.5346217, 1.131092, 0, 0.7294118, 1, 1,
0.1211301, -0.2080701, 1.818026, 0, 0.7254902, 1, 1,
0.1232001, -1.334294, 1.50961, 0, 0.7176471, 1, 1,
0.1238789, -1.768223, 3.748773, 0, 0.7137255, 1, 1,
0.1241532, 0.2764844, -1.079678, 0, 0.7058824, 1, 1,
0.1252782, -0.3515094, 2.900241, 0, 0.6980392, 1, 1,
0.1264548, -0.2319677, 4.275282, 0, 0.6941177, 1, 1,
0.1320752, -0.5462605, 2.076546, 0, 0.6862745, 1, 1,
0.1329419, 0.8238901, -0.5977169, 0, 0.682353, 1, 1,
0.1359162, 0.9199464, 0.1075915, 0, 0.6745098, 1, 1,
0.1379919, -2.805439, 3.19077, 0, 0.6705883, 1, 1,
0.1384311, 1.511238, 1.181516, 0, 0.6627451, 1, 1,
0.1389275, -1.131764, 1.381539, 0, 0.6588235, 1, 1,
0.1391364, 0.4184141, 0.02153184, 0, 0.6509804, 1, 1,
0.1398179, -0.296626, 4.401096, 0, 0.6470588, 1, 1,
0.1408097, -0.7872972, 1.814957, 0, 0.6392157, 1, 1,
0.142403, 0.6441208, -0.5498796, 0, 0.6352941, 1, 1,
0.1476967, 0.9938661, -0.1157821, 0, 0.627451, 1, 1,
0.1523522, 1.594664, -0.9687161, 0, 0.6235294, 1, 1,
0.1615852, 1.086975, -0.1322867, 0, 0.6156863, 1, 1,
0.1619465, 0.1688526, 1.201082, 0, 0.6117647, 1, 1,
0.1655999, 1.243749, 0.8505404, 0, 0.6039216, 1, 1,
0.1672562, 0.7442225, -1.344031, 0, 0.5960785, 1, 1,
0.1704819, -0.7656734, 2.395021, 0, 0.5921569, 1, 1,
0.1790241, -0.5781094, 3.398169, 0, 0.5843138, 1, 1,
0.18093, -0.8107396, 4.582865, 0, 0.5803922, 1, 1,
0.1844758, 1.239979, 1.020166, 0, 0.572549, 1, 1,
0.1863346, -0.3772193, 1.791434, 0, 0.5686275, 1, 1,
0.1910077, 0.1037696, 2.700821, 0, 0.5607843, 1, 1,
0.1936235, 1.1027, -0.8603315, 0, 0.5568628, 1, 1,
0.1976607, 0.06388263, 1.607021, 0, 0.5490196, 1, 1,
0.199676, 1.151624, -0.3390355, 0, 0.5450981, 1, 1,
0.2019283, -0.8076285, 3.618978, 0, 0.5372549, 1, 1,
0.2060469, -0.1619658, 0.5062802, 0, 0.5333334, 1, 1,
0.2092842, -0.02363113, 2.047755, 0, 0.5254902, 1, 1,
0.2099576, 0.1769402, 2.853884, 0, 0.5215687, 1, 1,
0.2131083, 1.3188, -0.9385947, 0, 0.5137255, 1, 1,
0.2151454, 1.059319, -0.3526588, 0, 0.509804, 1, 1,
0.2175909, 0.5873475, 0.2814525, 0, 0.5019608, 1, 1,
0.2197627, 0.2206074, 0.3407744, 0, 0.4941176, 1, 1,
0.2211046, -0.09111621, 0.8545396, 0, 0.4901961, 1, 1,
0.2226823, -0.4023385, 1.77449, 0, 0.4823529, 1, 1,
0.223909, -1.407492, 3.118632, 0, 0.4784314, 1, 1,
0.2242486, 0.4324711, 0.5756038, 0, 0.4705882, 1, 1,
0.2244359, 1.307405, 0.2342992, 0, 0.4666667, 1, 1,
0.2278932, -0.6045843, 2.93133, 0, 0.4588235, 1, 1,
0.2280264, 0.3159003, -0.2281204, 0, 0.454902, 1, 1,
0.2332709, 1.592871, -0.1853538, 0, 0.4470588, 1, 1,
0.2347145, 0.6542277, 1.001086, 0, 0.4431373, 1, 1,
0.2362507, -0.5449343, 4.054061, 0, 0.4352941, 1, 1,
0.2369667, -0.8205471, 5.123398, 0, 0.4313726, 1, 1,
0.2400021, -0.09210689, 2.048022, 0, 0.4235294, 1, 1,
0.2440435, -0.4281239, 2.952814, 0, 0.4196078, 1, 1,
0.2447256, 1.083553, 0.08491779, 0, 0.4117647, 1, 1,
0.2448067, -0.1728789, 3.211698, 0, 0.4078431, 1, 1,
0.2477493, -0.1425335, 2.512773, 0, 0.4, 1, 1,
0.25029, 0.4462221, -0.2737986, 0, 0.3921569, 1, 1,
0.2503092, -2.164098, 1.803771, 0, 0.3882353, 1, 1,
0.2532129, -0.2039287, 3.710107, 0, 0.3803922, 1, 1,
0.2540283, 1.491313, 0.4565481, 0, 0.3764706, 1, 1,
0.2561933, 0.5067469, -0.2805327, 0, 0.3686275, 1, 1,
0.2610728, 0.4888673, 0.1029869, 0, 0.3647059, 1, 1,
0.2716172, -0.2913944, 1.472756, 0, 0.3568628, 1, 1,
0.2718086, 1.282088, 0.4790602, 0, 0.3529412, 1, 1,
0.2719213, -0.08806797, 2.245051, 0, 0.345098, 1, 1,
0.2722609, 1.090537, 0.6613812, 0, 0.3411765, 1, 1,
0.2764332, -0.5635684, 2.43196, 0, 0.3333333, 1, 1,
0.2764784, -0.1764175, 2.895974, 0, 0.3294118, 1, 1,
0.2808806, -0.4394183, 1.63479, 0, 0.3215686, 1, 1,
0.2853507, -0.569524, 3.49451, 0, 0.3176471, 1, 1,
0.2900787, -0.5171856, 4.112916, 0, 0.3098039, 1, 1,
0.291474, -1.417909, 3.437526, 0, 0.3058824, 1, 1,
0.2922561, 0.8668976, 1.139497, 0, 0.2980392, 1, 1,
0.2963845, 0.3844128, 0.9428574, 0, 0.2901961, 1, 1,
0.2985611, 0.9646714, -0.07434554, 0, 0.2862745, 1, 1,
0.2991418, -0.2066323, 1.966145, 0, 0.2784314, 1, 1,
0.2998714, 0.4956817, 0.9380467, 0, 0.2745098, 1, 1,
0.3015665, 1.097859, -0.7527151, 0, 0.2666667, 1, 1,
0.3022442, 2.013016, -0.9718773, 0, 0.2627451, 1, 1,
0.3073666, -0.4761842, 2.64754, 0, 0.254902, 1, 1,
0.3114591, -0.3465307, 4.820851, 0, 0.2509804, 1, 1,
0.3119175, 0.2408796, 0.6578916, 0, 0.2431373, 1, 1,
0.3152357, 0.02009061, 0.7209632, 0, 0.2392157, 1, 1,
0.323387, 2.410524, -0.9673647, 0, 0.2313726, 1, 1,
0.3257815, 0.7507437, -0.1582344, 0, 0.227451, 1, 1,
0.3283792, -0.4581666, 0.3063555, 0, 0.2196078, 1, 1,
0.3306283, -0.4262048, 2.579197, 0, 0.2156863, 1, 1,
0.3390534, -0.05562897, 0.6217332, 0, 0.2078431, 1, 1,
0.3402366, 0.2099984, 1.3164, 0, 0.2039216, 1, 1,
0.3402391, -1.405733, 1.493973, 0, 0.1960784, 1, 1,
0.3407104, -0.1254907, 3.222089, 0, 0.1882353, 1, 1,
0.3467044, -0.2817641, 2.445993, 0, 0.1843137, 1, 1,
0.3505296, 0.7482898, 0.3429806, 0, 0.1764706, 1, 1,
0.3558654, -0.308893, 1.717044, 0, 0.172549, 1, 1,
0.3622381, 0.1840955, -0.06822262, 0, 0.1647059, 1, 1,
0.3645855, 0.9931677, 2.057704, 0, 0.1607843, 1, 1,
0.3647708, -0.9443151, 2.547792, 0, 0.1529412, 1, 1,
0.3659011, 1.404691, -0.429814, 0, 0.1490196, 1, 1,
0.3667567, -0.0169945, 3.257832, 0, 0.1411765, 1, 1,
0.3671161, -0.5213127, 2.536056, 0, 0.1372549, 1, 1,
0.369715, -0.4230956, 1.088202, 0, 0.1294118, 1, 1,
0.37228, -1.448688, 3.222717, 0, 0.1254902, 1, 1,
0.3723881, -1.170759, 2.441917, 0, 0.1176471, 1, 1,
0.3756878, -0.1809817, 3.110589, 0, 0.1137255, 1, 1,
0.3768744, -1.404173, 4.312992, 0, 0.1058824, 1, 1,
0.37769, 0.1059096, 0.3666525, 0, 0.09803922, 1, 1,
0.3796528, 0.7158656, 0.05872524, 0, 0.09411765, 1, 1,
0.3806172, 0.09009759, 1.104099, 0, 0.08627451, 1, 1,
0.3866755, 0.4816312, 1.28946, 0, 0.08235294, 1, 1,
0.3869938, -0.7638607, 1.229501, 0, 0.07450981, 1, 1,
0.3913452, -1.035419, 4.122757, 0, 0.07058824, 1, 1,
0.3914325, 0.06366483, 1.596325, 0, 0.0627451, 1, 1,
0.3943, 1.168226, -1.333846, 0, 0.05882353, 1, 1,
0.3960902, 2.282946, 0.3092728, 0, 0.05098039, 1, 1,
0.4010887, 0.1370313, 2.003169, 0, 0.04705882, 1, 1,
0.4014301, 0.5318432, -0.1994997, 0, 0.03921569, 1, 1,
0.4136669, 0.07696956, 1.674258, 0, 0.03529412, 1, 1,
0.4188018, 0.8812802, 0.2083161, 0, 0.02745098, 1, 1,
0.419103, -0.8442467, 3.892347, 0, 0.02352941, 1, 1,
0.4194453, -0.3975151, 2.610085, 0, 0.01568628, 1, 1,
0.4205717, 1.836526, -0.9739693, 0, 0.01176471, 1, 1,
0.4250609, -2.376568, 2.360229, 0, 0.003921569, 1, 1,
0.4308672, 1.447815, -1.249914, 0.003921569, 0, 1, 1,
0.4353562, -0.8105101, 3.414442, 0.007843138, 0, 1, 1,
0.4376943, 0.9457666, 0.2520606, 0.01568628, 0, 1, 1,
0.4492073, 0.1186804, 0.4156935, 0.01960784, 0, 1, 1,
0.4500938, -1.352387, 2.515471, 0.02745098, 0, 1, 1,
0.4515915, -0.6788069, 2.044363, 0.03137255, 0, 1, 1,
0.4539212, -1.108204, 3.678229, 0.03921569, 0, 1, 1,
0.4591555, 3.042276, 1.11012, 0.04313726, 0, 1, 1,
0.4611724, -1.336294, 2.065856, 0.05098039, 0, 1, 1,
0.4617998, 0.3509984, 1.359711, 0.05490196, 0, 1, 1,
0.4668668, -1.0038, 2.01915, 0.0627451, 0, 1, 1,
0.4681928, -0.5234304, 4.003509, 0.06666667, 0, 1, 1,
0.4692928, -0.8548104, 2.713412, 0.07450981, 0, 1, 1,
0.4704898, -0.4524887, 2.61429, 0.07843138, 0, 1, 1,
0.4717159, -0.3410354, 2.420614, 0.08627451, 0, 1, 1,
0.4733187, -1.174666, 2.363153, 0.09019608, 0, 1, 1,
0.4737497, 1.00958, -0.6093953, 0.09803922, 0, 1, 1,
0.4747806, 1.124826, -0.4320014, 0.1058824, 0, 1, 1,
0.4756148, -1.449145, 3.110195, 0.1098039, 0, 1, 1,
0.4830115, -0.9968393, 2.535684, 0.1176471, 0, 1, 1,
0.4894829, 0.1771097, 0.7175799, 0.1215686, 0, 1, 1,
0.4913428, 1.342644, -1.492297, 0.1294118, 0, 1, 1,
0.492123, -1.556133, 2.886431, 0.1333333, 0, 1, 1,
0.4924276, -0.04448336, 1.354271, 0.1411765, 0, 1, 1,
0.4929547, 0.04016811, 2.804871, 0.145098, 0, 1, 1,
0.4948438, -0.1204809, 2.491293, 0.1529412, 0, 1, 1,
0.5036604, 0.3106559, -0.6123771, 0.1568628, 0, 1, 1,
0.5061852, 0.8251216, 0.5286709, 0.1647059, 0, 1, 1,
0.508882, 0.4058414, 0.4980638, 0.1686275, 0, 1, 1,
0.5191154, -0.642818, 2.448241, 0.1764706, 0, 1, 1,
0.5192928, -1.175322, 4.405868, 0.1803922, 0, 1, 1,
0.5200814, -0.5988346, 2.373784, 0.1882353, 0, 1, 1,
0.5219722, 0.6718063, 0.4012642, 0.1921569, 0, 1, 1,
0.5228958, -0.2536396, 2.312924, 0.2, 0, 1, 1,
0.5270496, 0.2893699, 0.635702, 0.2078431, 0, 1, 1,
0.536627, 0.009359093, 1.735545, 0.2117647, 0, 1, 1,
0.5395223, -0.2512268, 5.023145, 0.2196078, 0, 1, 1,
0.5397795, 1.013543, -0.3606363, 0.2235294, 0, 1, 1,
0.5399557, 0.2988825, -0.5158344, 0.2313726, 0, 1, 1,
0.5406061, 0.1126463, 0.1913081, 0.2352941, 0, 1, 1,
0.5432983, -0.5435866, 1.867545, 0.2431373, 0, 1, 1,
0.5447351, 0.03449093, 0.9756328, 0.2470588, 0, 1, 1,
0.54623, 0.8474399, 0.4622176, 0.254902, 0, 1, 1,
0.5537755, -0.6234477, 1.155989, 0.2588235, 0, 1, 1,
0.554283, 1.340457, -0.1578245, 0.2666667, 0, 1, 1,
0.5547093, -1.582491, 1.86215, 0.2705882, 0, 1, 1,
0.5571937, 0.3278273, 1.259503, 0.2784314, 0, 1, 1,
0.56471, -0.7131258, 3.298829, 0.282353, 0, 1, 1,
0.56652, -1.705845, 3.900364, 0.2901961, 0, 1, 1,
0.5714705, -0.8339939, 3.001592, 0.2941177, 0, 1, 1,
0.5766942, -0.776801, 3.533047, 0.3019608, 0, 1, 1,
0.5787728, 0.899054, 2.548425, 0.3098039, 0, 1, 1,
0.5808223, -0.5175651, 1.687297, 0.3137255, 0, 1, 1,
0.5815915, -0.9262272, 1.760324, 0.3215686, 0, 1, 1,
0.5846025, -0.3737218, 2.438305, 0.3254902, 0, 1, 1,
0.5853394, 0.9316151, -0.4367403, 0.3333333, 0, 1, 1,
0.5857504, 0.2934313, 0.6960958, 0.3372549, 0, 1, 1,
0.5875256, 0.3148922, 0.9270245, 0.345098, 0, 1, 1,
0.58939, -0.4027465, 2.903794, 0.3490196, 0, 1, 1,
0.589543, -1.260524, 3.222578, 0.3568628, 0, 1, 1,
0.5935913, 1.480822, -0.9350759, 0.3607843, 0, 1, 1,
0.5954245, -0.09851868, 1.383304, 0.3686275, 0, 1, 1,
0.598363, 1.066085, -0.6932053, 0.372549, 0, 1, 1,
0.6008204, -0.5857721, 1.479291, 0.3803922, 0, 1, 1,
0.6030239, -0.06947253, 1.726653, 0.3843137, 0, 1, 1,
0.6057889, -2.314524, 2.263651, 0.3921569, 0, 1, 1,
0.6062463, 0.7128386, 1.132695, 0.3960784, 0, 1, 1,
0.6166849, -1.886332, 3.55431, 0.4039216, 0, 1, 1,
0.6183112, 1.863513, 1.409762, 0.4117647, 0, 1, 1,
0.6277611, -0.0245689, 0.8449126, 0.4156863, 0, 1, 1,
0.6296766, 0.4427689, 1.240922, 0.4235294, 0, 1, 1,
0.6318187, 1.246658, 0.2629538, 0.427451, 0, 1, 1,
0.633471, 1.554044, -0.7088135, 0.4352941, 0, 1, 1,
0.6345373, -0.2378852, 2.555638, 0.4392157, 0, 1, 1,
0.6401991, 1.865591, -0.3136799, 0.4470588, 0, 1, 1,
0.6436464, -0.9772783, 2.277727, 0.4509804, 0, 1, 1,
0.6602166, -0.4919643, 1.620925, 0.4588235, 0, 1, 1,
0.6616527, -1.30676, 1.198985, 0.4627451, 0, 1, 1,
0.6626799, -0.2435623, 3.073637, 0.4705882, 0, 1, 1,
0.6629001, -2.353323, 1.463009, 0.4745098, 0, 1, 1,
0.6635148, -0.3563622, 1.650087, 0.4823529, 0, 1, 1,
0.6645275, 1.986234, -0.2055878, 0.4862745, 0, 1, 1,
0.6664302, 0.008969681, 0.02551351, 0.4941176, 0, 1, 1,
0.6674207, 1.791243, 0.9354154, 0.5019608, 0, 1, 1,
0.6718462, -1.512958, 0.8978667, 0.5058824, 0, 1, 1,
0.6758021, -1.225539, 0.2244215, 0.5137255, 0, 1, 1,
0.6760461, 1.403593, -0.6829306, 0.5176471, 0, 1, 1,
0.679949, 0.07820126, 0.002106691, 0.5254902, 0, 1, 1,
0.6823132, -0.2142692, 2.759565, 0.5294118, 0, 1, 1,
0.6886849, 0.8718305, -0.04615936, 0.5372549, 0, 1, 1,
0.6911707, 1.829712, -0.04338139, 0.5411765, 0, 1, 1,
0.6943365, -1.081098, 2.954257, 0.5490196, 0, 1, 1,
0.6943714, -0.8546981, 2.910228, 0.5529412, 0, 1, 1,
0.6967757, -0.4929765, 2.680865, 0.5607843, 0, 1, 1,
0.6977037, 0.6505746, -0.532415, 0.5647059, 0, 1, 1,
0.7019979, 0.2800877, 2.071827, 0.572549, 0, 1, 1,
0.7091328, -0.2809805, 1.193991, 0.5764706, 0, 1, 1,
0.7158477, -0.4523954, 3.280183, 0.5843138, 0, 1, 1,
0.7209757, 0.7332702, 3.749437, 0.5882353, 0, 1, 1,
0.7216994, 0.485311, 1.993276, 0.5960785, 0, 1, 1,
0.7227558, -0.08306316, 1.703733, 0.6039216, 0, 1, 1,
0.7240096, 0.6893697, 0.5322455, 0.6078432, 0, 1, 1,
0.7382614, 0.389088, 1.323426, 0.6156863, 0, 1, 1,
0.7383581, 0.8674594, -1.123881, 0.6196079, 0, 1, 1,
0.7407595, -0.694055, -0.04719695, 0.627451, 0, 1, 1,
0.7613335, -0.1109044, 3.000695, 0.6313726, 0, 1, 1,
0.7638935, 1.129907, 0.6268169, 0.6392157, 0, 1, 1,
0.7646512, 1.152394, 0.9189761, 0.6431373, 0, 1, 1,
0.7651681, -0.1880522, 1.402853, 0.6509804, 0, 1, 1,
0.7654247, 0.7622679, 1.296764, 0.654902, 0, 1, 1,
0.7659865, 1.678682, 2.241253, 0.6627451, 0, 1, 1,
0.767333, 0.2802811, 1.353257, 0.6666667, 0, 1, 1,
0.7741416, 0.1883292, 1.913139, 0.6745098, 0, 1, 1,
0.7755705, -0.7525405, 3.181164, 0.6784314, 0, 1, 1,
0.7785436, 0.2278988, 1.267107, 0.6862745, 0, 1, 1,
0.7853923, -1.145311, 1.89392, 0.6901961, 0, 1, 1,
0.7864315, -0.2639825, 1.378557, 0.6980392, 0, 1, 1,
0.7876465, -0.1585832, 0.6150581, 0.7058824, 0, 1, 1,
0.7929848, 1.31039, 1.110271, 0.7098039, 0, 1, 1,
0.8021325, -0.4239329, 3.241511, 0.7176471, 0, 1, 1,
0.8040919, 0.7648559, 1.003475, 0.7215686, 0, 1, 1,
0.8058869, -0.8230972, 3.496321, 0.7294118, 0, 1, 1,
0.8094909, -0.3323956, 0.05846835, 0.7333333, 0, 1, 1,
0.8116908, -0.4621696, 1.609554, 0.7411765, 0, 1, 1,
0.8140682, 1.351254, -0.2828223, 0.7450981, 0, 1, 1,
0.8142313, 0.8362318, 1.210755, 0.7529412, 0, 1, 1,
0.8194923, 0.332026, 1.009849, 0.7568628, 0, 1, 1,
0.8213049, 0.1151774, 0.974, 0.7647059, 0, 1, 1,
0.8234298, -1.500678, 2.896415, 0.7686275, 0, 1, 1,
0.8289297, -0.01495896, 1.920645, 0.7764706, 0, 1, 1,
0.8394448, -0.9892095, 3.698716, 0.7803922, 0, 1, 1,
0.8519865, 1.037789, 1.615904, 0.7882353, 0, 1, 1,
0.855381, -0.2799121, 0.3990292, 0.7921569, 0, 1, 1,
0.8599005, 0.5996584, 1.100538, 0.8, 0, 1, 1,
0.8601785, -0.3241019, 0.9799902, 0.8078431, 0, 1, 1,
0.8667659, 0.19453, 0.6438816, 0.8117647, 0, 1, 1,
0.8729711, -1.637792, 2.978754, 0.8196079, 0, 1, 1,
0.876869, 0.3205078, 0.9774603, 0.8235294, 0, 1, 1,
0.8848487, -0.02277815, 3.865451, 0.8313726, 0, 1, 1,
0.8858827, -0.04537444, 1.036426, 0.8352941, 0, 1, 1,
0.8871751, 2.046424, -1.37347, 0.8431373, 0, 1, 1,
0.8874325, 0.2750705, 1.886298, 0.8470588, 0, 1, 1,
0.8913392, 1.000337, 0.3335187, 0.854902, 0, 1, 1,
0.8955879, 1.171744, 0.9941533, 0.8588235, 0, 1, 1,
0.904692, 1.122065, 0.4241489, 0.8666667, 0, 1, 1,
0.9087114, -2.205627, 3.550175, 0.8705882, 0, 1, 1,
0.9165422, 0.2470395, 0.3242112, 0.8784314, 0, 1, 1,
0.9186376, -1.147134, 1.998457, 0.8823529, 0, 1, 1,
0.9270195, 2.025839, -0.2597463, 0.8901961, 0, 1, 1,
0.9298264, 1.474085, 0.9572363, 0.8941177, 0, 1, 1,
0.9311152, -0.162183, 1.60945, 0.9019608, 0, 1, 1,
0.9388578, -1.399805, 3.771615, 0.9098039, 0, 1, 1,
0.940578, -0.6422388, 2.289959, 0.9137255, 0, 1, 1,
0.9415854, -0.6049311, 1.091184, 0.9215686, 0, 1, 1,
0.9428034, 0.2347345, 0.4249321, 0.9254902, 0, 1, 1,
0.943101, -0.8231052, 1.76173, 0.9333333, 0, 1, 1,
0.950342, 0.3039721, 1.413603, 0.9372549, 0, 1, 1,
0.9508188, -0.2565773, 2.302293, 0.945098, 0, 1, 1,
0.9554606, 0.3665558, -0.2306495, 0.9490196, 0, 1, 1,
0.9685207, -0.561561, 3.354102, 0.9568627, 0, 1, 1,
0.9699513, 2.185919, 0.4112122, 0.9607843, 0, 1, 1,
0.9719957, -2.287441, 2.547522, 0.9686275, 0, 1, 1,
0.9782385, -1.438046, 1.354542, 0.972549, 0, 1, 1,
0.9812235, -2.91479, 2.583282, 0.9803922, 0, 1, 1,
0.9872605, -0.2662676, 2.630028, 0.9843137, 0, 1, 1,
0.9901531, 0.3334753, -0.2531588, 0.9921569, 0, 1, 1,
0.9943273, -0.1450956, 0.7918481, 0.9960784, 0, 1, 1,
0.9962584, 0.3754337, 2.010208, 1, 0, 0.9960784, 1,
0.9985865, 1.01506, 1.891799, 1, 0, 0.9882353, 1,
1.007022, -0.02048108, 1.95014, 1, 0, 0.9843137, 1,
1.008635, -1.623152, 3.300216, 1, 0, 0.9764706, 1,
1.010653, -1.181226, 1.58369, 1, 0, 0.972549, 1,
1.015015, 0.9121578, 0.7163609, 1, 0, 0.9647059, 1,
1.016396, 1.020951, 1.200445, 1, 0, 0.9607843, 1,
1.016429, 1.06708, -0.02305856, 1, 0, 0.9529412, 1,
1.018819, 0.2850592, 1.626259, 1, 0, 0.9490196, 1,
1.020379, 1.164684, 0.002874861, 1, 0, 0.9411765, 1,
1.022211, -0.3205542, 2.364234, 1, 0, 0.9372549, 1,
1.023298, -1.782645, 2.650039, 1, 0, 0.9294118, 1,
1.030316, 0.1184739, 2.38873, 1, 0, 0.9254902, 1,
1.031913, -0.5284262, 0.5030941, 1, 0, 0.9176471, 1,
1.034332, 1.280582, 0.3350236, 1, 0, 0.9137255, 1,
1.062676, -1.137027, 3.079333, 1, 0, 0.9058824, 1,
1.067236, -0.9137934, 4.070783, 1, 0, 0.9019608, 1,
1.068048, 0.6092996, 1.956028, 1, 0, 0.8941177, 1,
1.069798, 0.7019686, 1.861521, 1, 0, 0.8862745, 1,
1.081774, 1.556149, -1.272426, 1, 0, 0.8823529, 1,
1.082195, 0.4564644, -0.8759494, 1, 0, 0.8745098, 1,
1.084349, 1.888566, -0.2390087, 1, 0, 0.8705882, 1,
1.089599, 0.289028, -0.6445875, 1, 0, 0.8627451, 1,
1.097185, 1.671453, -0.07041659, 1, 0, 0.8588235, 1,
1.102017, 0.3086953, -0.02487346, 1, 0, 0.8509804, 1,
1.123298, 0.7809206, 0.3241223, 1, 0, 0.8470588, 1,
1.142871, 0.4989325, 0.6712995, 1, 0, 0.8392157, 1,
1.144589, -0.8613837, 1.80349, 1, 0, 0.8352941, 1,
1.154257, -0.009039105, 2.916775, 1, 0, 0.827451, 1,
1.193437, -0.2385434, 0.6026609, 1, 0, 0.8235294, 1,
1.195763, -0.4061675, 1.725694, 1, 0, 0.8156863, 1,
1.19986, -0.7849605, 0.6229461, 1, 0, 0.8117647, 1,
1.210168, 0.02700276, 1.16201, 1, 0, 0.8039216, 1,
1.213068, 0.8873278, 0.475611, 1, 0, 0.7960784, 1,
1.222383, -0.0692552, 1.301463, 1, 0, 0.7921569, 1,
1.225184, -0.9570107, 2.311323, 1, 0, 0.7843137, 1,
1.226395, -0.4804988, 1.158737, 1, 0, 0.7803922, 1,
1.237048, -0.6258937, 3.061114, 1, 0, 0.772549, 1,
1.252396, -1.511805, 1.665239, 1, 0, 0.7686275, 1,
1.267803, -0.5733587, 3.14495, 1, 0, 0.7607843, 1,
1.268732, 1.882035, 1.424845, 1, 0, 0.7568628, 1,
1.269221, -0.3877343, 4.351994, 1, 0, 0.7490196, 1,
1.270887, 0.5736028, 0.6968392, 1, 0, 0.7450981, 1,
1.272504, -0.6988257, 2.928651, 1, 0, 0.7372549, 1,
1.274605, 0.9376872, 0.5113407, 1, 0, 0.7333333, 1,
1.280548, 1.53062, -0.08073942, 1, 0, 0.7254902, 1,
1.288238, 0.01872199, 0.0174056, 1, 0, 0.7215686, 1,
1.292717, -1.762449, 1.769148, 1, 0, 0.7137255, 1,
1.294382, -0.1710915, 0.6797392, 1, 0, 0.7098039, 1,
1.294653, -0.6951427, 0.4803286, 1, 0, 0.7019608, 1,
1.301762, -0.7256302, 1.84708, 1, 0, 0.6941177, 1,
1.317971, 1.467541, 0.5911524, 1, 0, 0.6901961, 1,
1.324841, -1.154973, 3.794936, 1, 0, 0.682353, 1,
1.329939, -0.395879, 1.606771, 1, 0, 0.6784314, 1,
1.332729, 1.080674, 1.151247, 1, 0, 0.6705883, 1,
1.333985, 1.696667, -1.390827, 1, 0, 0.6666667, 1,
1.334303, -0.2946413, 0.1340045, 1, 0, 0.6588235, 1,
1.336444, -0.1504554, 2.306413, 1, 0, 0.654902, 1,
1.338938, 0.9516413, 0.945743, 1, 0, 0.6470588, 1,
1.339974, 0.3843029, 2.136362, 1, 0, 0.6431373, 1,
1.340659, 0.1807369, 3.954559, 1, 0, 0.6352941, 1,
1.35362, 1.045291, 0.07816075, 1, 0, 0.6313726, 1,
1.362239, -1.105059, 3.120192, 1, 0, 0.6235294, 1,
1.364555, -0.9012189, 1.26979, 1, 0, 0.6196079, 1,
1.368212, -0.3536697, 1.006738, 1, 0, 0.6117647, 1,
1.368929, -0.4809219, 2.315817, 1, 0, 0.6078432, 1,
1.369417, -1.513343, 0.9086595, 1, 0, 0.6, 1,
1.371124, -0.1716671, 2.852398, 1, 0, 0.5921569, 1,
1.373393, -1.348859, 3.318054, 1, 0, 0.5882353, 1,
1.379466, 0.4694558, 1.003417, 1, 0, 0.5803922, 1,
1.383737, -1.283223, 2.35601, 1, 0, 0.5764706, 1,
1.385483, -1.007537, 2.942791, 1, 0, 0.5686275, 1,
1.392532, -2.300538, 2.449357, 1, 0, 0.5647059, 1,
1.401149, -0.7862135, 3.366591, 1, 0, 0.5568628, 1,
1.409656, 1.152695, 0.8500759, 1, 0, 0.5529412, 1,
1.416979, 1.096315, -0.4452754, 1, 0, 0.5450981, 1,
1.439668, 0.2614289, 1.045991, 1, 0, 0.5411765, 1,
1.442402, 0.6522508, -0.2038683, 1, 0, 0.5333334, 1,
1.442584, 0.6385788, -0.5549801, 1, 0, 0.5294118, 1,
1.448163, -1.315501, 2.716261, 1, 0, 0.5215687, 1,
1.448915, 0.7970163, 0.7249802, 1, 0, 0.5176471, 1,
1.458467, 1.62172, 0.7865067, 1, 0, 0.509804, 1,
1.461369, -0.531535, 1.499135, 1, 0, 0.5058824, 1,
1.480123, -0.5980471, 1.71237, 1, 0, 0.4980392, 1,
1.481298, -0.4178411, 1.511747, 1, 0, 0.4901961, 1,
1.48717, 0.1215305, 1.346902, 1, 0, 0.4862745, 1,
1.491591, -0.4476559, 0.9395584, 1, 0, 0.4784314, 1,
1.494254, -0.254476, 1.640007, 1, 0, 0.4745098, 1,
1.503747, -0.6719036, 2.468361, 1, 0, 0.4666667, 1,
1.505795, 0.8806498, 2.135299, 1, 0, 0.4627451, 1,
1.508452, -0.4814422, 2.208942, 1, 0, 0.454902, 1,
1.520854, 0.9353431, -0.6172659, 1, 0, 0.4509804, 1,
1.531978, -0.8461294, 2.061491, 1, 0, 0.4431373, 1,
1.558045, -0.957594, 0.5475881, 1, 0, 0.4392157, 1,
1.559076, 0.6996483, 0.8668585, 1, 0, 0.4313726, 1,
1.559472, 0.04368813, 1.077249, 1, 0, 0.427451, 1,
1.563432, -0.6153586, 1.834851, 1, 0, 0.4196078, 1,
1.573295, 0.9443225, -0.2055411, 1, 0, 0.4156863, 1,
1.584985, 0.5300476, 2.602015, 1, 0, 0.4078431, 1,
1.6072, 0.0004310654, 2.389544, 1, 0, 0.4039216, 1,
1.609224, 0.6351045, -0.4711034, 1, 0, 0.3960784, 1,
1.620514, 0.2469906, 2.595431, 1, 0, 0.3882353, 1,
1.633647, -0.8572443, 1.825224, 1, 0, 0.3843137, 1,
1.648562, -2.373097, 0.4390141, 1, 0, 0.3764706, 1,
1.651714, -0.4756732, 1.342476, 1, 0, 0.372549, 1,
1.656868, 0.7214028, 0.7623367, 1, 0, 0.3647059, 1,
1.659786, -0.5454388, 2.799197, 1, 0, 0.3607843, 1,
1.682446, 0.1566382, 1.197236, 1, 0, 0.3529412, 1,
1.695788, -0.9889811, 1.887131, 1, 0, 0.3490196, 1,
1.703336, 0.3188739, 2.187049, 1, 0, 0.3411765, 1,
1.707317, -0.3141663, 3.562604, 1, 0, 0.3372549, 1,
1.712842, -1.223234, 2.274997, 1, 0, 0.3294118, 1,
1.714448, -0.072035, 2.040832, 1, 0, 0.3254902, 1,
1.719372, -0.6019328, 1.26261, 1, 0, 0.3176471, 1,
1.719486, -1.886247, 3.216768, 1, 0, 0.3137255, 1,
1.724143, 0.4336318, 0.6593376, 1, 0, 0.3058824, 1,
1.73257, 0.9470529, 0.2139702, 1, 0, 0.2980392, 1,
1.733247, -1.856303, 4.074929, 1, 0, 0.2941177, 1,
1.747913, 0.1081014, 1.011092, 1, 0, 0.2862745, 1,
1.752077, -0.1134302, 0.6883674, 1, 0, 0.282353, 1,
1.753814, -1.876711, 3.429221, 1, 0, 0.2745098, 1,
1.754957, 0.2795815, 2.136878, 1, 0, 0.2705882, 1,
1.782256, -0.7029682, -0.2281301, 1, 0, 0.2627451, 1,
1.797003, 0.388302, 1.36272, 1, 0, 0.2588235, 1,
1.798768, 0.1082414, 0.2613928, 1, 0, 0.2509804, 1,
1.805879, -0.20052, 0.5350628, 1, 0, 0.2470588, 1,
1.812894, -1.296105, 1.576925, 1, 0, 0.2392157, 1,
1.865448, -0.3343396, -0.2538267, 1, 0, 0.2352941, 1,
1.868983, -0.2822969, 0.7580451, 1, 0, 0.227451, 1,
1.884986, -0.03935121, 3.328399, 1, 0, 0.2235294, 1,
1.890725, 0.6643041, 1.302646, 1, 0, 0.2156863, 1,
1.904145, -0.816353, 1.093566, 1, 0, 0.2117647, 1,
1.91008, -1.353395, 1.261254, 1, 0, 0.2039216, 1,
1.916857, 0.1703569, 0.8559529, 1, 0, 0.1960784, 1,
1.97221, 0.2356762, 1.333873, 1, 0, 0.1921569, 1,
2.03638, 1.759055, 1.089584, 1, 0, 0.1843137, 1,
2.062863, -0.3636279, 2.775616, 1, 0, 0.1803922, 1,
2.069739, -1.642334, 1.095106, 1, 0, 0.172549, 1,
2.075796, -1.083376, 1.647655, 1, 0, 0.1686275, 1,
2.104566, 0.8205015, 0.8344591, 1, 0, 0.1607843, 1,
2.133371, 0.6144497, 1.902281, 1, 0, 0.1568628, 1,
2.133656, 0.08499497, 2.880652, 1, 0, 0.1490196, 1,
2.138478, 0.2573266, 1.240588, 1, 0, 0.145098, 1,
2.166409, -0.4170315, 2.592743, 1, 0, 0.1372549, 1,
2.192806, 0.1847057, 1.446957, 1, 0, 0.1333333, 1,
2.199732, -0.2019557, 3.093552, 1, 0, 0.1254902, 1,
2.20706, -0.05571976, 0.5436769, 1, 0, 0.1215686, 1,
2.20852, 0.1748584, 0.4058981, 1, 0, 0.1137255, 1,
2.318523, -0.7198143, 2.858219, 1, 0, 0.1098039, 1,
2.331511, -0.2855354, 2.729074, 1, 0, 0.1019608, 1,
2.343446, -0.281415, -0.156036, 1, 0, 0.09411765, 1,
2.363164, -0.03543128, 2.124983, 1, 0, 0.09019608, 1,
2.366941, 0.02735436, 0.3267046, 1, 0, 0.08235294, 1,
2.38084, -0.2270151, 2.614078, 1, 0, 0.07843138, 1,
2.408785, 0.04533354, 0.5361425, 1, 0, 0.07058824, 1,
2.469107, 0.1188261, -0.1384896, 1, 0, 0.06666667, 1,
2.528414, 0.2131813, 1.472832, 1, 0, 0.05882353, 1,
2.533087, 0.4092184, 1.156542, 1, 0, 0.05490196, 1,
2.600421, 0.8341939, 0.7222719, 1, 0, 0.04705882, 1,
2.624127, 0.5128537, 0.6446778, 1, 0, 0.04313726, 1,
2.640673, 0.6745027, 2.609116, 1, 0, 0.03529412, 1,
2.787998, 1.016319, 2.755913, 1, 0, 0.03137255, 1,
2.86798, -0.2911447, 0.4824443, 1, 0, 0.02352941, 1,
2.869954, 1.898253, 0.8501813, 1, 0, 0.01960784, 1,
2.993949, 1.139002, 2.132865, 1, 0, 0.01176471, 1,
3.204417, 0.1102483, 0.3302548, 1, 0, 0.007843138, 1
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
-0.03254461, -4.285155, -7.665899, 0, -0.5, 0.5, 0.5,
-0.03254461, -4.285155, -7.665899, 1, -0.5, 0.5, 0.5,
-0.03254461, -4.285155, -7.665899, 1, 1.5, 0.5, 0.5,
-0.03254461, -4.285155, -7.665899, 0, 1.5, 0.5, 0.5
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
-4.366836, 0.1722248, -7.665899, 0, -0.5, 0.5, 0.5,
-4.366836, 0.1722248, -7.665899, 1, -0.5, 0.5, 0.5,
-4.366836, 0.1722248, -7.665899, 1, 1.5, 0.5, 0.5,
-4.366836, 0.1722248, -7.665899, 0, 1.5, 0.5, 0.5
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
-4.366836, -4.285155, -0.3444502, 0, -0.5, 0.5, 0.5,
-4.366836, -4.285155, -0.3444502, 1, -0.5, 0.5, 0.5,
-4.366836, -4.285155, -0.3444502, 1, 1.5, 0.5, 0.5,
-4.366836, -4.285155, -0.3444502, 0, 1.5, 0.5, 0.5
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
-3, -3.256529, -5.976334,
3, -3.256529, -5.976334,
-3, -3.256529, -5.976334,
-3, -3.427967, -6.257928,
-2, -3.256529, -5.976334,
-2, -3.427967, -6.257928,
-1, -3.256529, -5.976334,
-1, -3.427967, -6.257928,
0, -3.256529, -5.976334,
0, -3.427967, -6.257928,
1, -3.256529, -5.976334,
1, -3.427967, -6.257928,
2, -3.256529, -5.976334,
2, -3.427967, -6.257928,
3, -3.256529, -5.976334,
3, -3.427967, -6.257928
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
-3, -3.770842, -6.821117, 0, -0.5, 0.5, 0.5,
-3, -3.770842, -6.821117, 1, -0.5, 0.5, 0.5,
-3, -3.770842, -6.821117, 1, 1.5, 0.5, 0.5,
-3, -3.770842, -6.821117, 0, 1.5, 0.5, 0.5,
-2, -3.770842, -6.821117, 0, -0.5, 0.5, 0.5,
-2, -3.770842, -6.821117, 1, -0.5, 0.5, 0.5,
-2, -3.770842, -6.821117, 1, 1.5, 0.5, 0.5,
-2, -3.770842, -6.821117, 0, 1.5, 0.5, 0.5,
-1, -3.770842, -6.821117, 0, -0.5, 0.5, 0.5,
-1, -3.770842, -6.821117, 1, -0.5, 0.5, 0.5,
-1, -3.770842, -6.821117, 1, 1.5, 0.5, 0.5,
-1, -3.770842, -6.821117, 0, 1.5, 0.5, 0.5,
0, -3.770842, -6.821117, 0, -0.5, 0.5, 0.5,
0, -3.770842, -6.821117, 1, -0.5, 0.5, 0.5,
0, -3.770842, -6.821117, 1, 1.5, 0.5, 0.5,
0, -3.770842, -6.821117, 0, 1.5, 0.5, 0.5,
1, -3.770842, -6.821117, 0, -0.5, 0.5, 0.5,
1, -3.770842, -6.821117, 1, -0.5, 0.5, 0.5,
1, -3.770842, -6.821117, 1, 1.5, 0.5, 0.5,
1, -3.770842, -6.821117, 0, 1.5, 0.5, 0.5,
2, -3.770842, -6.821117, 0, -0.5, 0.5, 0.5,
2, -3.770842, -6.821117, 1, -0.5, 0.5, 0.5,
2, -3.770842, -6.821117, 1, 1.5, 0.5, 0.5,
2, -3.770842, -6.821117, 0, 1.5, 0.5, 0.5,
3, -3.770842, -6.821117, 0, -0.5, 0.5, 0.5,
3, -3.770842, -6.821117, 1, -0.5, 0.5, 0.5,
3, -3.770842, -6.821117, 1, 1.5, 0.5, 0.5,
3, -3.770842, -6.821117, 0, 1.5, 0.5, 0.5
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
-3.366615, -3, -5.976334,
-3.366615, 3, -5.976334,
-3.366615, -3, -5.976334,
-3.533318, -3, -6.257928,
-3.366615, -2, -5.976334,
-3.533318, -2, -6.257928,
-3.366615, -1, -5.976334,
-3.533318, -1, -6.257928,
-3.366615, 0, -5.976334,
-3.533318, 0, -6.257928,
-3.366615, 1, -5.976334,
-3.533318, 1, -6.257928,
-3.366615, 2, -5.976334,
-3.533318, 2, -6.257928,
-3.366615, 3, -5.976334,
-3.533318, 3, -6.257928
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
-3.866725, -3, -6.821117, 0, -0.5, 0.5, 0.5,
-3.866725, -3, -6.821117, 1, -0.5, 0.5, 0.5,
-3.866725, -3, -6.821117, 1, 1.5, 0.5, 0.5,
-3.866725, -3, -6.821117, 0, 1.5, 0.5, 0.5,
-3.866725, -2, -6.821117, 0, -0.5, 0.5, 0.5,
-3.866725, -2, -6.821117, 1, -0.5, 0.5, 0.5,
-3.866725, -2, -6.821117, 1, 1.5, 0.5, 0.5,
-3.866725, -2, -6.821117, 0, 1.5, 0.5, 0.5,
-3.866725, -1, -6.821117, 0, -0.5, 0.5, 0.5,
-3.866725, -1, -6.821117, 1, -0.5, 0.5, 0.5,
-3.866725, -1, -6.821117, 1, 1.5, 0.5, 0.5,
-3.866725, -1, -6.821117, 0, 1.5, 0.5, 0.5,
-3.866725, 0, -6.821117, 0, -0.5, 0.5, 0.5,
-3.866725, 0, -6.821117, 1, -0.5, 0.5, 0.5,
-3.866725, 0, -6.821117, 1, 1.5, 0.5, 0.5,
-3.866725, 0, -6.821117, 0, 1.5, 0.5, 0.5,
-3.866725, 1, -6.821117, 0, -0.5, 0.5, 0.5,
-3.866725, 1, -6.821117, 1, -0.5, 0.5, 0.5,
-3.866725, 1, -6.821117, 1, 1.5, 0.5, 0.5,
-3.866725, 1, -6.821117, 0, 1.5, 0.5, 0.5,
-3.866725, 2, -6.821117, 0, -0.5, 0.5, 0.5,
-3.866725, 2, -6.821117, 1, -0.5, 0.5, 0.5,
-3.866725, 2, -6.821117, 1, 1.5, 0.5, 0.5,
-3.866725, 2, -6.821117, 0, 1.5, 0.5, 0.5,
-3.866725, 3, -6.821117, 0, -0.5, 0.5, 0.5,
-3.866725, 3, -6.821117, 1, -0.5, 0.5, 0.5,
-3.866725, 3, -6.821117, 1, 1.5, 0.5, 0.5,
-3.866725, 3, -6.821117, 0, 1.5, 0.5, 0.5
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
-3.366615, -3.256529, -4,
-3.366615, -3.256529, 4,
-3.366615, -3.256529, -4,
-3.533318, -3.427967, -4,
-3.366615, -3.256529, -2,
-3.533318, -3.427967, -2,
-3.366615, -3.256529, 0,
-3.533318, -3.427967, 0,
-3.366615, -3.256529, 2,
-3.533318, -3.427967, 2,
-3.366615, -3.256529, 4,
-3.533318, -3.427967, 4
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
-3.866725, -3.770842, -4, 0, -0.5, 0.5, 0.5,
-3.866725, -3.770842, -4, 1, -0.5, 0.5, 0.5,
-3.866725, -3.770842, -4, 1, 1.5, 0.5, 0.5,
-3.866725, -3.770842, -4, 0, 1.5, 0.5, 0.5,
-3.866725, -3.770842, -2, 0, -0.5, 0.5, 0.5,
-3.866725, -3.770842, -2, 1, -0.5, 0.5, 0.5,
-3.866725, -3.770842, -2, 1, 1.5, 0.5, 0.5,
-3.866725, -3.770842, -2, 0, 1.5, 0.5, 0.5,
-3.866725, -3.770842, 0, 0, -0.5, 0.5, 0.5,
-3.866725, -3.770842, 0, 1, -0.5, 0.5, 0.5,
-3.866725, -3.770842, 0, 1, 1.5, 0.5, 0.5,
-3.866725, -3.770842, 0, 0, 1.5, 0.5, 0.5,
-3.866725, -3.770842, 2, 0, -0.5, 0.5, 0.5,
-3.866725, -3.770842, 2, 1, -0.5, 0.5, 0.5,
-3.866725, -3.770842, 2, 1, 1.5, 0.5, 0.5,
-3.866725, -3.770842, 2, 0, 1.5, 0.5, 0.5,
-3.866725, -3.770842, 4, 0, -0.5, 0.5, 0.5,
-3.866725, -3.770842, 4, 1, -0.5, 0.5, 0.5,
-3.866725, -3.770842, 4, 1, 1.5, 0.5, 0.5,
-3.866725, -3.770842, 4, 0, 1.5, 0.5, 0.5
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
-3.366615, -3.256529, -5.976334,
-3.366615, 3.600979, -5.976334,
-3.366615, -3.256529, 5.287434,
-3.366615, 3.600979, 5.287434,
-3.366615, -3.256529, -5.976334,
-3.366615, -3.256529, 5.287434,
-3.366615, 3.600979, -5.976334,
-3.366615, 3.600979, 5.287434,
-3.366615, -3.256529, -5.976334,
3.301525, -3.256529, -5.976334,
-3.366615, -3.256529, 5.287434,
3.301525, -3.256529, 5.287434,
-3.366615, 3.600979, -5.976334,
3.301525, 3.600979, -5.976334,
-3.366615, 3.600979, 5.287434,
3.301525, 3.600979, 5.287434,
3.301525, -3.256529, -5.976334,
3.301525, 3.600979, -5.976334,
3.301525, -3.256529, 5.287434,
3.301525, 3.600979, 5.287434,
3.301525, -3.256529, -5.976334,
3.301525, -3.256529, 5.287434,
3.301525, 3.600979, -5.976334,
3.301525, 3.600979, 5.287434
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
var radius = 7.890672;
var distance = 35.10649;
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
mvMatrix.translate( 0.03254461, -0.1722248, 0.3444502 );
mvMatrix.scale( 1.27945, 1.244118, 0.7574329 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.10649);
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
norea<-read.table("norea.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-norea$V2
```

```
## Error in eval(expr, envir, enclos): object 'norea' not found
```

```r
y<-norea$V3
```

```
## Error in eval(expr, envir, enclos): object 'norea' not found
```

```r
z<-norea$V4
```

```
## Error in eval(expr, envir, enclos): object 'norea' not found
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
-3.269506, -0.2447309, -1.75031, 0, 0, 1, 1, 1,
-2.647023, -0.2481534, -1.010123, 1, 0, 0, 1, 1,
-2.635825, 0.417661, -2.105284, 1, 0, 0, 1, 1,
-2.574401, 0.6247296, -2.170371, 1, 0, 0, 1, 1,
-2.55923, 0.5054631, -1.338143, 1, 0, 0, 1, 1,
-2.510741, 0.2769278, -1.811473, 1, 0, 0, 1, 1,
-2.373352, 0.3520437, -1.015286, 0, 0, 0, 1, 1,
-2.349006, -2.4079, -1.064683, 0, 0, 0, 1, 1,
-2.327882, -0.2040629, -2.495106, 0, 0, 0, 1, 1,
-2.301998, 1.740188, -0.8336394, 0, 0, 0, 1, 1,
-2.299999, 1.754277, -2.132839, 0, 0, 0, 1, 1,
-2.183212, 0.219074, -2.380524, 0, 0, 0, 1, 1,
-2.173374, 0.7440171, -0.9999188, 0, 0, 0, 1, 1,
-2.172722, -0.7792767, 0.9628053, 1, 1, 1, 1, 1,
-2.150217, -0.8819629, -0.07899964, 1, 1, 1, 1, 1,
-2.114996, 0.4196798, -2.460768, 1, 1, 1, 1, 1,
-2.054692, -0.08859435, -3.727614, 1, 1, 1, 1, 1,
-2.047801, -0.3248197, -0.438756, 1, 1, 1, 1, 1,
-2.005909, -0.1206737, -1.831085, 1, 1, 1, 1, 1,
-1.994981, 0.7042044, -0.8446077, 1, 1, 1, 1, 1,
-1.983788, 2.114254, -1.625444, 1, 1, 1, 1, 1,
-1.970234, 0.1949904, -0.9862376, 1, 1, 1, 1, 1,
-1.965816, -0.9078999, -1.187892, 1, 1, 1, 1, 1,
-1.959396, 0.08646685, -1.303393, 1, 1, 1, 1, 1,
-1.954679, 0.4293647, -1.196472, 1, 1, 1, 1, 1,
-1.944966, 0.3964935, -1.61706, 1, 1, 1, 1, 1,
-1.940375, -0.4756837, -1.531302, 1, 1, 1, 1, 1,
-1.926, 0.2376293, -1.11418, 1, 1, 1, 1, 1,
-1.914448, 1.749762, 0.5881963, 0, 0, 1, 1, 1,
-1.886355, 0.2210976, -0.7824861, 1, 0, 0, 1, 1,
-1.864137, -1.815933, -1.317992, 1, 0, 0, 1, 1,
-1.785773, -1.786516, -1.557576, 1, 0, 0, 1, 1,
-1.772163, -0.4147969, -0.9177676, 1, 0, 0, 1, 1,
-1.769109, 0.3880866, -0.6588453, 1, 0, 0, 1, 1,
-1.768813, -1.011793, -0.989637, 0, 0, 0, 1, 1,
-1.746334, -0.06538212, -3.035969, 0, 0, 0, 1, 1,
-1.728942, 1.172447, -0.5057245, 0, 0, 0, 1, 1,
-1.718473, 0.982015, 0.7010506, 0, 0, 0, 1, 1,
-1.715374, 1.305142, -0.3872388, 0, 0, 0, 1, 1,
-1.71155, 1.879244, -1.00058, 0, 0, 0, 1, 1,
-1.702988, 0.159011, -0.1966724, 0, 0, 0, 1, 1,
-1.694831, 0.1201273, -1.696913, 1, 1, 1, 1, 1,
-1.68059, 1.090641, -1.269575, 1, 1, 1, 1, 1,
-1.662018, -0.726361, -2.389383, 1, 1, 1, 1, 1,
-1.657279, -0.06360277, -2.419944, 1, 1, 1, 1, 1,
-1.653584, -1.665914, -4.20281, 1, 1, 1, 1, 1,
-1.647179, -0.5728274, -2.213466, 1, 1, 1, 1, 1,
-1.621546, -0.02721917, 0.9773752, 1, 1, 1, 1, 1,
-1.591303, 0.9730021, -1.35882, 1, 1, 1, 1, 1,
-1.544125, -0.4448367, -1.204109, 1, 1, 1, 1, 1,
-1.542795, 2.268476, 0.5641727, 1, 1, 1, 1, 1,
-1.521617, 0.8903096, 0.9381838, 1, 1, 1, 1, 1,
-1.521283, 0.0091752, -0.4471481, 1, 1, 1, 1, 1,
-1.501828, 0.4268372, -2.18943, 1, 1, 1, 1, 1,
-1.497049, 0.6429616, -0.2325298, 1, 1, 1, 1, 1,
-1.489367, 0.6688327, -0.1653489, 1, 1, 1, 1, 1,
-1.477436, -0.9261146, 0.5365623, 0, 0, 1, 1, 1,
-1.472773, 0.8488151, -1.812147, 1, 0, 0, 1, 1,
-1.448296, 0.2506123, 0.7084993, 1, 0, 0, 1, 1,
-1.439738, 0.7850487, -1.887846, 1, 0, 0, 1, 1,
-1.434379, 0.4866252, -0.9214575, 1, 0, 0, 1, 1,
-1.42345, 0.7122128, -1.420024, 1, 0, 0, 1, 1,
-1.423069, -1.139783, -1.731247, 0, 0, 0, 1, 1,
-1.417619, -0.6420003, -2.925345, 0, 0, 0, 1, 1,
-1.416264, 0.2159323, -2.648537, 0, 0, 0, 1, 1,
-1.412128, -1.243801, -2.119982, 0, 0, 0, 1, 1,
-1.409811, 0.1423766, -0.528474, 0, 0, 0, 1, 1,
-1.409736, -1.125652, -2.339335, 0, 0, 0, 1, 1,
-1.407173, -0.50125, -2.789483, 0, 0, 0, 1, 1,
-1.396847, -0.7859957, -2.357885, 1, 1, 1, 1, 1,
-1.391646, -1.300717, -0.9277816, 1, 1, 1, 1, 1,
-1.390086, -0.7344456, -1.553099, 1, 1, 1, 1, 1,
-1.388416, -0.2213645, -4.083885, 1, 1, 1, 1, 1,
-1.379665, -1.862001, -4.398388, 1, 1, 1, 1, 1,
-1.3747, -1.414412, -4.245074, 1, 1, 1, 1, 1,
-1.371036, -0.6904156, -2.079464, 1, 1, 1, 1, 1,
-1.361072, -1.146865, -1.47638, 1, 1, 1, 1, 1,
-1.358088, 0.3501137, -2.094279, 1, 1, 1, 1, 1,
-1.347188, -0.9872501, -2.066983, 1, 1, 1, 1, 1,
-1.346643, 0.3167686, -0.6643022, 1, 1, 1, 1, 1,
-1.342521, 0.7923061, 1.818585, 1, 1, 1, 1, 1,
-1.336764, -1.741312, -3.345196, 1, 1, 1, 1, 1,
-1.309933, 0.9440639, -0.4524442, 1, 1, 1, 1, 1,
-1.309858, -1.625677, -1.472536, 1, 1, 1, 1, 1,
-1.295343, 0.5072147, -2.067709, 0, 0, 1, 1, 1,
-1.294734, -0.4231728, -0.9289544, 1, 0, 0, 1, 1,
-1.291269, -1.201281, -4.672524, 1, 0, 0, 1, 1,
-1.285373, -0.4764856, -3.081576, 1, 0, 0, 1, 1,
-1.282526, 1.962507, 0.04627843, 1, 0, 0, 1, 1,
-1.268102, -0.001927564, -2.748963, 1, 0, 0, 1, 1,
-1.26516, -0.1590948, -1.033105, 0, 0, 0, 1, 1,
-1.263775, 0.7375246, -0.6254005, 0, 0, 0, 1, 1,
-1.261271, 1.023453, -0.5223471, 0, 0, 0, 1, 1,
-1.256804, -0.1795395, -3.196892, 0, 0, 0, 1, 1,
-1.256796, -0.223066, -1.595315, 0, 0, 0, 1, 1,
-1.249639, -1.219718, -5.03693, 0, 0, 0, 1, 1,
-1.242269, 0.2595641, -1.955692, 0, 0, 0, 1, 1,
-1.236262, -1.066, -2.138831, 1, 1, 1, 1, 1,
-1.231848, -0.4771584, -1.986536, 1, 1, 1, 1, 1,
-1.230354, -1.13634, -2.215084, 1, 1, 1, 1, 1,
-1.224544, -0.5501496, -2.453576, 1, 1, 1, 1, 1,
-1.220662, -0.4619334, -1.629983, 1, 1, 1, 1, 1,
-1.212717, 1.239556, 0.4033549, 1, 1, 1, 1, 1,
-1.212352, -0.4329353, -0.6467355, 1, 1, 1, 1, 1,
-1.211629, -0.8257895, -1.538149, 1, 1, 1, 1, 1,
-1.209911, 1.472062, -0.2880972, 1, 1, 1, 1, 1,
-1.208964, -0.005910089, -2.440492, 1, 1, 1, 1, 1,
-1.206106, 0.1002257, -1.584187, 1, 1, 1, 1, 1,
-1.205307, 1.236655, -0.1121925, 1, 1, 1, 1, 1,
-1.2016, 0.03156935, -3.666971, 1, 1, 1, 1, 1,
-1.200134, 0.3716825, -1.794937, 1, 1, 1, 1, 1,
-1.199227, -0.7743722, -2.549102, 1, 1, 1, 1, 1,
-1.196734, 0.3390366, -1.701832, 0, 0, 1, 1, 1,
-1.18681, 0.2910042, -0.0804003, 1, 0, 0, 1, 1,
-1.18142, 1.133859, -0.3278067, 1, 0, 0, 1, 1,
-1.181352, 0.2510934, -1.545214, 1, 0, 0, 1, 1,
-1.18119, -0.2186894, -0.4134201, 1, 0, 0, 1, 1,
-1.180718, 1.170703, -1.811052, 1, 0, 0, 1, 1,
-1.165326, -1.423511, -2.695853, 0, 0, 0, 1, 1,
-1.165215, -1.053512, -1.975878, 0, 0, 0, 1, 1,
-1.164307, -1.589608, -2.352119, 0, 0, 0, 1, 1,
-1.157787, -0.7913333, -0.865431, 0, 0, 0, 1, 1,
-1.157497, -0.03830297, -2.066553, 0, 0, 0, 1, 1,
-1.157302, -1.608304, -3.754092, 0, 0, 0, 1, 1,
-1.156924, 0.6330844, 0.2604214, 0, 0, 0, 1, 1,
-1.156851, -0.8042274, -2.281571, 1, 1, 1, 1, 1,
-1.152113, -1.130238, -2.442302, 1, 1, 1, 1, 1,
-1.145475, -0.5748922, -2.677228, 1, 1, 1, 1, 1,
-1.140261, 1.723836, -0.2854972, 1, 1, 1, 1, 1,
-1.139716, 0.2052673, -0.0231272, 1, 1, 1, 1, 1,
-1.128696, 0.163478, -1.110547, 1, 1, 1, 1, 1,
-1.124173, 0.5677669, -0.04246981, 1, 1, 1, 1, 1,
-1.121083, -0.6734713, -1.565106, 1, 1, 1, 1, 1,
-1.115896, -0.4036528, -0.8959384, 1, 1, 1, 1, 1,
-1.110363, 0.380121, 0.02886845, 1, 1, 1, 1, 1,
-1.108691, 2.439857, 2.878392, 1, 1, 1, 1, 1,
-1.10368, 0.5101386, -0.5374084, 1, 1, 1, 1, 1,
-1.09751, -0.3597583, -2.72255, 1, 1, 1, 1, 1,
-1.090913, -0.1171792, -0.01965491, 1, 1, 1, 1, 1,
-1.082535, 3.501112, 0.01807152, 1, 1, 1, 1, 1,
-1.080437, -0.2679368, -0.9863497, 0, 0, 1, 1, 1,
-1.072665, 0.4494013, -0.3337284, 1, 0, 0, 1, 1,
-1.05758, 0.9681112, -2.694943, 1, 0, 0, 1, 1,
-1.055439, 0.5572883, -1.505929, 1, 0, 0, 1, 1,
-1.039258, 0.523228, -1.303651, 1, 0, 0, 1, 1,
-1.039101, -0.2461345, -1.680978, 1, 0, 0, 1, 1,
-1.033872, 2.608569, 2.59361, 0, 0, 0, 1, 1,
-1.032027, -1.217794, -3.815042, 0, 0, 0, 1, 1,
-1.024518, -0.6449112, -1.887743, 0, 0, 0, 1, 1,
-1.023983, -0.5963868, -0.9278446, 0, 0, 0, 1, 1,
-1.021314, 0.09745456, -1.180494, 0, 0, 0, 1, 1,
-1.020856, 0.6061073, -3.26343, 0, 0, 0, 1, 1,
-1.020458, -0.1001082, -1.436338, 0, 0, 0, 1, 1,
-1.011329, 0.464449, 0.9722432, 1, 1, 1, 1, 1,
-1.010318, 0.6210169, -1.659767, 1, 1, 1, 1, 1,
-1.002165, -1.569341, -2.032527, 1, 1, 1, 1, 1,
-0.9986046, 1.299113, 0.1737691, 1, 1, 1, 1, 1,
-0.9970307, 0.3778698, -1.548462, 1, 1, 1, 1, 1,
-0.993449, 0.007530554, -2.399854, 1, 1, 1, 1, 1,
-0.9897966, -0.5792522, -0.8146292, 1, 1, 1, 1, 1,
-0.9879026, 0.7688584, -1.018189, 1, 1, 1, 1, 1,
-0.9852368, 0.5936399, -1.887366, 1, 1, 1, 1, 1,
-0.97723, 0.6703388, 0.1034194, 1, 1, 1, 1, 1,
-0.9767419, -0.7193832, -2.486237, 1, 1, 1, 1, 1,
-0.9731625, -0.02115318, -1.267294, 1, 1, 1, 1, 1,
-0.9696391, -0.2214463, -1.670822, 1, 1, 1, 1, 1,
-0.9668449, -0.2351838, -0.01676784, 1, 1, 1, 1, 1,
-0.9497269, 1.895437, -1.012178, 1, 1, 1, 1, 1,
-0.9495791, 0.7303527, -0.7254131, 0, 0, 1, 1, 1,
-0.9419525, 0.5098228, -1.363536, 1, 0, 0, 1, 1,
-0.9415172, -1.842739, -5.46545, 1, 0, 0, 1, 1,
-0.9384857, 0.07681503, -1.283922, 1, 0, 0, 1, 1,
-0.9344737, -0.2488434, -2.228461, 1, 0, 0, 1, 1,
-0.9343011, -1.789816, -0.4392379, 1, 0, 0, 1, 1,
-0.9328486, -0.5186391, -1.863995, 0, 0, 0, 1, 1,
-0.931023, -0.3827177, -3.137053, 0, 0, 0, 1, 1,
-0.9270373, 1.13519, -1.959704, 0, 0, 0, 1, 1,
-0.9188902, 0.4889777, -1.096862, 0, 0, 0, 1, 1,
-0.9122594, 1.267819, -0.5583115, 0, 0, 0, 1, 1,
-0.9106098, 1.218945, -3.500149, 0, 0, 0, 1, 1,
-0.908308, 0.5376559, -0.4586104, 0, 0, 0, 1, 1,
-0.906642, -1.8418, -2.921477, 1, 1, 1, 1, 1,
-0.9020498, -1.221497, -1.861757, 1, 1, 1, 1, 1,
-0.9019266, -0.644981, -2.306223, 1, 1, 1, 1, 1,
-0.9018896, -1.212599, -1.923572, 1, 1, 1, 1, 1,
-0.9017382, -0.2243238, -2.567789, 1, 1, 1, 1, 1,
-0.8949518, 0.7367651, -1.852322, 1, 1, 1, 1, 1,
-0.8855047, 2.011983, -1.614349, 1, 1, 1, 1, 1,
-0.8851429, -0.05393443, -1.807934, 1, 1, 1, 1, 1,
-0.8784007, -0.8780016, -2.622348, 1, 1, 1, 1, 1,
-0.8702269, 2.450567, 2.515208, 1, 1, 1, 1, 1,
-0.8688961, -0.4947486, -3.532128, 1, 1, 1, 1, 1,
-0.8569937, -0.02218473, -2.487667, 1, 1, 1, 1, 1,
-0.8501772, 0.5087398, -0.1305007, 1, 1, 1, 1, 1,
-0.8452706, -0.4580122, -0.8854933, 1, 1, 1, 1, 1,
-0.8444744, 0.166515, -0.3929409, 1, 1, 1, 1, 1,
-0.8440781, 0.7345499, -0.01181483, 0, 0, 1, 1, 1,
-0.8432748, 0.07839967, -0.925268, 1, 0, 0, 1, 1,
-0.8418581, 0.04997304, -0.1517487, 1, 0, 0, 1, 1,
-0.8399222, 0.3288022, -2.606404, 1, 0, 0, 1, 1,
-0.8348939, -1.146174, -3.662612, 1, 0, 0, 1, 1,
-0.8343173, 0.8818322, -2.148102, 1, 0, 0, 1, 1,
-0.8326146, 0.6469629, -1.060935, 0, 0, 0, 1, 1,
-0.8325443, 0.8617207, -0.2905431, 0, 0, 0, 1, 1,
-0.8320785, -0.4809228, 0.4738244, 0, 0, 0, 1, 1,
-0.827652, 1.206475, 0.9798136, 0, 0, 0, 1, 1,
-0.8243129, 1.02059, -2.106724, 0, 0, 0, 1, 1,
-0.8172581, -0.7777066, -2.023754, 0, 0, 0, 1, 1,
-0.8122684, -1.081427, -2.94988, 0, 0, 0, 1, 1,
-0.8098194, -0.06705325, -2.273282, 1, 1, 1, 1, 1,
-0.8063194, -0.2961642, -1.640788, 1, 1, 1, 1, 1,
-0.7939795, 1.515274, -0.8571305, 1, 1, 1, 1, 1,
-0.7928678, 0.3408723, -1.439338, 1, 1, 1, 1, 1,
-0.7915569, -0.05596341, -1.8846, 1, 1, 1, 1, 1,
-0.7881544, -0.8654101, -3.16935, 1, 1, 1, 1, 1,
-0.7872129, -1.111094, -2.299396, 1, 1, 1, 1, 1,
-0.7798942, -0.8896531, -3.079547, 1, 1, 1, 1, 1,
-0.7789624, -1.009308, -1.06171, 1, 1, 1, 1, 1,
-0.7689998, -0.9348556, -0.3291925, 1, 1, 1, 1, 1,
-0.7647959, -0.4895022, -1.765504, 1, 1, 1, 1, 1,
-0.7518249, -2.093628, -2.444381, 1, 1, 1, 1, 1,
-0.7513463, 1.025681, -0.1164193, 1, 1, 1, 1, 1,
-0.7486918, 0.7320523, 0.2956835, 1, 1, 1, 1, 1,
-0.7479422, 0.1384241, -1.565957, 1, 1, 1, 1, 1,
-0.7374757, -0.2618675, -1.82562, 0, 0, 1, 1, 1,
-0.7335205, 0.2940308, -2.900881, 1, 0, 0, 1, 1,
-0.7327064, -0.319795, -2.336963, 1, 0, 0, 1, 1,
-0.7304298, -0.2606824, -2.104484, 1, 0, 0, 1, 1,
-0.7286699, 0.2136839, -2.514971, 1, 0, 0, 1, 1,
-0.7286038, -1.312073, -3.62377, 1, 0, 0, 1, 1,
-0.727775, -1.217978, -4.033055, 0, 0, 0, 1, 1,
-0.7257647, -0.8336772, -2.044837, 0, 0, 0, 1, 1,
-0.7234992, 0.04994066, -2.244152, 0, 0, 0, 1, 1,
-0.716427, -0.5445289, -3.02213, 0, 0, 0, 1, 1,
-0.7125273, -1.766123, -1.185497, 0, 0, 0, 1, 1,
-0.7125248, -0.2523032, -0.7149027, 0, 0, 0, 1, 1,
-0.711584, 0.1119869, -0.1832566, 0, 0, 0, 1, 1,
-0.7094129, 0.1211628, -1.783892, 1, 1, 1, 1, 1,
-0.7076497, 1.777488, -0.773329, 1, 1, 1, 1, 1,
-0.7061592, 0.5971503, 0.1048359, 1, 1, 1, 1, 1,
-0.704102, -0.5610028, -3.018752, 1, 1, 1, 1, 1,
-0.7016762, 0.6013159, -1.352114, 1, 1, 1, 1, 1,
-0.7009725, -1.300734, -2.630818, 1, 1, 1, 1, 1,
-0.7003469, -0.7322875, -1.996121, 1, 1, 1, 1, 1,
-0.6995232, -0.2552492, -2.184143, 1, 1, 1, 1, 1,
-0.6942689, 1.137021, 1.455505, 1, 1, 1, 1, 1,
-0.6884919, -0.847207, -1.997584, 1, 1, 1, 1, 1,
-0.6845864, -0.7518287, -1.278588, 1, 1, 1, 1, 1,
-0.6740991, -0.3723424, -1.550367, 1, 1, 1, 1, 1,
-0.66928, 1.887819, 0.4713188, 1, 1, 1, 1, 1,
-0.668667, -0.01308021, -1.602213, 1, 1, 1, 1, 1,
-0.6587505, 1.726824, 0.6260976, 1, 1, 1, 1, 1,
-0.6573744, 0.01468079, -1.068807, 0, 0, 1, 1, 1,
-0.6554249, 0.04515415, -1.85858, 1, 0, 0, 1, 1,
-0.6513933, 0.992411, -0.5322877, 1, 0, 0, 1, 1,
-0.6499431, -0.848534, -3.624099, 1, 0, 0, 1, 1,
-0.6484579, 0.5950404, -1.124059, 1, 0, 0, 1, 1,
-0.6460626, 0.7954056, 0.9482166, 1, 0, 0, 1, 1,
-0.6448383, -1.932301, -3.538203, 0, 0, 0, 1, 1,
-0.6422234, -1.033272, -3.9748, 0, 0, 0, 1, 1,
-0.6379761, -0.2742487, -1.836613, 0, 0, 0, 1, 1,
-0.6371239, 0.3834967, -0.5447831, 0, 0, 0, 1, 1,
-0.6362762, -1.159853, -2.1143, 0, 0, 0, 1, 1,
-0.636024, 2.785186, -0.58377, 0, 0, 0, 1, 1,
-0.6347915, 1.165916, -2.051709, 0, 0, 0, 1, 1,
-0.6295536, -0.5454389, -2.557128, 1, 1, 1, 1, 1,
-0.6266423, -0.5268902, -1.804429, 1, 1, 1, 1, 1,
-0.6254064, -0.7369357, -2.382473, 1, 1, 1, 1, 1,
-0.6248879, 0.5399649, -2.937247, 1, 1, 1, 1, 1,
-0.6208218, -0.3065085, -2.416499, 1, 1, 1, 1, 1,
-0.6103675, 0.399692, -1.340435, 1, 1, 1, 1, 1,
-0.6092615, -0.9844219, -2.946495, 1, 1, 1, 1, 1,
-0.6040226, -1.678888, -3.505332, 1, 1, 1, 1, 1,
-0.603851, -0.3068582, -2.965848, 1, 1, 1, 1, 1,
-0.5989247, -0.1270156, -2.122692, 1, 1, 1, 1, 1,
-0.5963892, 0.8323674, -1.070312, 1, 1, 1, 1, 1,
-0.5954803, -0.3208614, -1.309432, 1, 1, 1, 1, 1,
-0.5940351, -1.290841, -3.31984, 1, 1, 1, 1, 1,
-0.5937706, -1.032908, -1.165731, 1, 1, 1, 1, 1,
-0.5876648, 0.214949, -1.373401, 1, 1, 1, 1, 1,
-0.5840017, -0.8797375, -2.762836, 0, 0, 1, 1, 1,
-0.5811267, -0.5703167, -2.505702, 1, 0, 0, 1, 1,
-0.5747333, 0.2746633, -2.473401, 1, 0, 0, 1, 1,
-0.5727028, 0.5782758, -1.059049, 1, 0, 0, 1, 1,
-0.5614461, -0.2579901, -1.29164, 1, 0, 0, 1, 1,
-0.5610204, -0.1046351, -2.045776, 1, 0, 0, 1, 1,
-0.5523099, 0.9164734, 0.2057611, 0, 0, 0, 1, 1,
-0.5515773, -0.6601309, -4.309417, 0, 0, 0, 1, 1,
-0.5511259, 0.6920072, -0.4383432, 0, 0, 0, 1, 1,
-0.5473642, 0.06566829, -0.7951697, 0, 0, 0, 1, 1,
-0.5469525, 0.3526508, -0.578783, 0, 0, 0, 1, 1,
-0.5395673, -1.296781, -2.802555, 0, 0, 0, 1, 1,
-0.5393529, 1.05438, -0.3767644, 0, 0, 0, 1, 1,
-0.537551, 2.679476, -0.348799, 1, 1, 1, 1, 1,
-0.5354753, 0.780802, -0.2689216, 1, 1, 1, 1, 1,
-0.5353119, 1.62933, -0.3886939, 1, 1, 1, 1, 1,
-0.5330106, 0.283854, -0.4201034, 1, 1, 1, 1, 1,
-0.5321336, -0.552726, -3.144329, 1, 1, 1, 1, 1,
-0.5318631, 0.2558978, -1.031424, 1, 1, 1, 1, 1,
-0.5288666, 0.6577833, -0.7589588, 1, 1, 1, 1, 1,
-0.5246047, -0.6656493, -0.5684384, 1, 1, 1, 1, 1,
-0.519265, 0.7401729, 1.722104, 1, 1, 1, 1, 1,
-0.5148525, -0.7723063, -2.629345, 1, 1, 1, 1, 1,
-0.5050598, 0.4696965, -0.9954259, 1, 1, 1, 1, 1,
-0.4999567, 0.8992783, -0.3694592, 1, 1, 1, 1, 1,
-0.4994426, -0.7712661, -2.987703, 1, 1, 1, 1, 1,
-0.4987739, -0.4742619, -1.93582, 1, 1, 1, 1, 1,
-0.497861, 0.4786806, -0.7184516, 1, 1, 1, 1, 1,
-0.4975444, 0.630438, -0.7879497, 0, 0, 1, 1, 1,
-0.4973325, 1.368225, -1.026224, 1, 0, 0, 1, 1,
-0.4970168, 0.7017069, 0.3609937, 1, 0, 0, 1, 1,
-0.4968933, 1.405409, -1.458005, 1, 0, 0, 1, 1,
-0.494559, 0.9607795, -0.8444571, 1, 0, 0, 1, 1,
-0.4936726, 0.3563003, -2.284981, 1, 0, 0, 1, 1,
-0.4932655, -1.045316, -2.50341, 0, 0, 0, 1, 1,
-0.4912315, 1.811337, 1.848557, 0, 0, 0, 1, 1,
-0.4840427, 1.8643, -1.455136, 0, 0, 0, 1, 1,
-0.4789574, -1.283679, -4.126377, 0, 0, 0, 1, 1,
-0.4786267, 1.098806, 1.358646, 0, 0, 0, 1, 1,
-0.4776137, 0.2247214, -1.230967, 0, 0, 0, 1, 1,
-0.475899, 0.6335998, -2.08559, 0, 0, 0, 1, 1,
-0.4758083, 0.4328191, 0.6531319, 1, 1, 1, 1, 1,
-0.4717844, -0.8377816, -4.156455, 1, 1, 1, 1, 1,
-0.4717284, 0.06132001, -2.64411, 1, 1, 1, 1, 1,
-0.4704768, 0.1203946, 0.6565443, 1, 1, 1, 1, 1,
-0.4675558, 0.5157026, -0.9765512, 1, 1, 1, 1, 1,
-0.4603584, 0.5028279, -0.8252655, 1, 1, 1, 1, 1,
-0.4551982, 0.5935798, -0.1254804, 1, 1, 1, 1, 1,
-0.4486913, 1.255008, 0.2438542, 1, 1, 1, 1, 1,
-0.4436415, -0.4580312, -1.529517, 1, 1, 1, 1, 1,
-0.4427343, -1.359812, -2.697384, 1, 1, 1, 1, 1,
-0.4412291, 1.656558, -0.3350227, 1, 1, 1, 1, 1,
-0.4395395, -1.439762, -1.538483, 1, 1, 1, 1, 1,
-0.4379987, 0.03644607, -2.094479, 1, 1, 1, 1, 1,
-0.4340653, 0.7905398, -2.267371, 1, 1, 1, 1, 1,
-0.4310142, 0.2442236, -1.26519, 1, 1, 1, 1, 1,
-0.4236113, -1.004122, -2.679785, 0, 0, 1, 1, 1,
-0.4235863, 1.200816, -0.2190985, 1, 0, 0, 1, 1,
-0.4204706, 1.454509, 1.525521, 1, 0, 0, 1, 1,
-0.4202305, -1.093147, -2.778244, 1, 0, 0, 1, 1,
-0.4175443, 0.6823868, 1.061837, 1, 0, 0, 1, 1,
-0.4143727, -1.431956, -3.504402, 1, 0, 0, 1, 1,
-0.4138106, 0.3031551, -1.976785, 0, 0, 0, 1, 1,
-0.4134953, -0.9183341, -3.655022, 0, 0, 0, 1, 1,
-0.4064973, 1.26733, -2.853226, 0, 0, 0, 1, 1,
-0.3993183, 0.8615995, -1.017575, 0, 0, 0, 1, 1,
-0.3915615, 0.9284086, -2.029606, 0, 0, 0, 1, 1,
-0.3892502, -0.08638777, -2.455412, 0, 0, 0, 1, 1,
-0.3881367, 0.9689978, -1.746642, 0, 0, 0, 1, 1,
-0.3838693, -0.2773833, -2.234605, 1, 1, 1, 1, 1,
-0.3838244, 1.531451, 0.8237283, 1, 1, 1, 1, 1,
-0.3832077, 0.6258928, -0.8293644, 1, 1, 1, 1, 1,
-0.3808415, -0.9552196, -3.262985, 1, 1, 1, 1, 1,
-0.377025, 0.002264723, -2.031638, 1, 1, 1, 1, 1,
-0.374101, -0.491043, 0.2067217, 1, 1, 1, 1, 1,
-0.3737434, 0.06194599, -0.810004, 1, 1, 1, 1, 1,
-0.3681025, -0.765577, -3.896518, 1, 1, 1, 1, 1,
-0.3657348, -0.2256261, -1.304594, 1, 1, 1, 1, 1,
-0.3656409, -0.1881223, -2.606946, 1, 1, 1, 1, 1,
-0.3592333, -0.07502802, -0.9681447, 1, 1, 1, 1, 1,
-0.3542812, -1.834011, -2.987264, 1, 1, 1, 1, 1,
-0.350101, -1.739304, -2.306798, 1, 1, 1, 1, 1,
-0.3488396, -0.7586255, -2.976408, 1, 1, 1, 1, 1,
-0.3487611, -0.5079709, -3.226705, 1, 1, 1, 1, 1,
-0.3478289, -1.016455, -2.46376, 0, 0, 1, 1, 1,
-0.3362509, -0.1154352, -1.735594, 1, 0, 0, 1, 1,
-0.3333317, -1.86977, -4.109334, 1, 0, 0, 1, 1,
-0.3282927, 0.6687143, 0.4273734, 1, 0, 0, 1, 1,
-0.3264574, -1.515836, -1.912729, 1, 0, 0, 1, 1,
-0.3228134, -0.01388244, -2.033941, 1, 0, 0, 1, 1,
-0.317247, -0.8384634, -2.444693, 0, 0, 0, 1, 1,
-0.3169577, 0.09203024, -2.023938, 0, 0, 0, 1, 1,
-0.3144699, -1.351441, -4.363757, 0, 0, 0, 1, 1,
-0.312546, 0.2392283, -1.083292, 0, 0, 0, 1, 1,
-0.3124048, 1.673076, -0.9900052, 0, 0, 0, 1, 1,
-0.3071103, -0.494483, -2.759948, 0, 0, 0, 1, 1,
-0.3052294, -0.1830512, -1.139487, 0, 0, 0, 1, 1,
-0.3030648, 0.2792717, -0.6573729, 1, 1, 1, 1, 1,
-0.3021398, -0.8168449, -2.299576, 1, 1, 1, 1, 1,
-0.3020307, -1.009859, -2.833842, 1, 1, 1, 1, 1,
-0.299209, 0.5825428, 0.05266576, 1, 1, 1, 1, 1,
-0.2979451, 1.063409, -0.3470083, 1, 1, 1, 1, 1,
-0.2966854, -0.5261946, -4.053455, 1, 1, 1, 1, 1,
-0.2943534, -1.015106, -3.638232, 1, 1, 1, 1, 1,
-0.293019, 0.9510293, -1.163093, 1, 1, 1, 1, 1,
-0.2908294, 0.4930253, -0.4436585, 1, 1, 1, 1, 1,
-0.2906895, -0.1773219, -2.488172, 1, 1, 1, 1, 1,
-0.2894594, 0.9739307, 0.2291951, 1, 1, 1, 1, 1,
-0.2893625, -1.611453, -2.92879, 1, 1, 1, 1, 1,
-0.2874141, 1.412149, -0.0300222, 1, 1, 1, 1, 1,
-0.2835107, -0.1939398, -2.575557, 1, 1, 1, 1, 1,
-0.2828186, 1.402217, 1.690719, 1, 1, 1, 1, 1,
-0.2770238, -1.172345, -3.744862, 0, 0, 1, 1, 1,
-0.2699306, -0.7188079, -1.811375, 1, 0, 0, 1, 1,
-0.2684487, 0.3484989, 0.580954, 1, 0, 0, 1, 1,
-0.2580093, -0.0616693, -2.617276, 1, 0, 0, 1, 1,
-0.252576, 1.737961, 1.339291, 1, 0, 0, 1, 1,
-0.2524676, 0.2367821, -0.2159549, 1, 0, 0, 1, 1,
-0.2503107, 0.8541925, -0.9057526, 0, 0, 0, 1, 1,
-0.2502599, 0.2587419, 0.05268613, 0, 0, 0, 1, 1,
-0.2456529, 0.376927, -1.779489, 0, 0, 0, 1, 1,
-0.2451904, -0.3985062, -2.685886, 0, 0, 0, 1, 1,
-0.2448568, 1.016398, -2.405104, 0, 0, 0, 1, 1,
-0.2415581, -0.5113668, -2.695304, 0, 0, 0, 1, 1,
-0.2404186, 0.3174986, -1.994818, 0, 0, 0, 1, 1,
-0.2365878, -1.148576, -3.878949, 1, 1, 1, 1, 1,
-0.2311642, -1.651255, -1.784271, 1, 1, 1, 1, 1,
-0.2249351, -0.8219469, -3.383567, 1, 1, 1, 1, 1,
-0.221887, -0.1970313, -2.740098, 1, 1, 1, 1, 1,
-0.221832, -0.2378365, -0.540978, 1, 1, 1, 1, 1,
-0.2180867, -0.8082189, -1.74119, 1, 1, 1, 1, 1,
-0.2170106, 0.1873408, -0.8626984, 1, 1, 1, 1, 1,
-0.2138553, -0.3580295, -2.5437, 1, 1, 1, 1, 1,
-0.2132683, 0.05462924, -1.909084, 1, 1, 1, 1, 1,
-0.2123343, 1.292917, -0.4793697, 1, 1, 1, 1, 1,
-0.2111399, -1.127331, -0.850959, 1, 1, 1, 1, 1,
-0.2089658, -0.3699209, -4.047688, 1, 1, 1, 1, 1,
-0.2082556, -2.30915, -2.796975, 1, 1, 1, 1, 1,
-0.2068946, -0.8174874, -3.862252, 1, 1, 1, 1, 1,
-0.2053946, -2.62885, -4.161192, 1, 1, 1, 1, 1,
-0.2034973, -1.344412, -2.504602, 0, 0, 1, 1, 1,
-0.2007978, -0.4923926, -1.055613, 1, 0, 0, 1, 1,
-0.1997634, 0.9133272, 0.31975, 1, 0, 0, 1, 1,
-0.1924347, 1.060314, -1.79854, 1, 0, 0, 1, 1,
-0.1916385, -0.2928998, -2.492587, 1, 0, 0, 1, 1,
-0.1898772, -1.257637, -2.355891, 1, 0, 0, 1, 1,
-0.1893232, -0.2433023, -2.003815, 0, 0, 0, 1, 1,
-0.1867296, 1.61077, 0.5053338, 0, 0, 0, 1, 1,
-0.1863991, 0.9308593, -0.2279824, 0, 0, 0, 1, 1,
-0.1810234, -0.0613734, -2.218575, 0, 0, 0, 1, 1,
-0.1738917, -0.4062968, -3.090266, 0, 0, 0, 1, 1,
-0.1716496, -1.180349, -3.377599, 0, 0, 0, 1, 1,
-0.1700564, 0.7382478, -1.695374, 0, 0, 0, 1, 1,
-0.1684222, -0.02655174, -2.220873, 1, 1, 1, 1, 1,
-0.1663119, -0.4813586, -1.58552, 1, 1, 1, 1, 1,
-0.1646869, -1.956382, -3.312898, 1, 1, 1, 1, 1,
-0.1636896, -1.682684, -1.870076, 1, 1, 1, 1, 1,
-0.1623335, 0.7508866, -0.01530065, 1, 1, 1, 1, 1,
-0.1602295, -0.7829951, -3.327703, 1, 1, 1, 1, 1,
-0.1568101, 0.9418291, -1.094231, 1, 1, 1, 1, 1,
-0.1550838, 0.977212, 0.7189294, 1, 1, 1, 1, 1,
-0.1546221, 0.8976338, 1.043091, 1, 1, 1, 1, 1,
-0.151725, 0.1188064, -1.383208, 1, 1, 1, 1, 1,
-0.1514924, -0.932518, -5.812299, 1, 1, 1, 1, 1,
-0.1481695, 0.9920331, -1.43742, 1, 1, 1, 1, 1,
-0.1445379, -0.4399407, -3.712953, 1, 1, 1, 1, 1,
-0.1445362, -0.6310057, -4.022106, 1, 1, 1, 1, 1,
-0.1443838, -0.006310435, -1.430386, 1, 1, 1, 1, 1,
-0.1404617, -0.05342252, -1.33616, 0, 0, 1, 1, 1,
-0.1373542, -0.5097283, -3.304354, 1, 0, 0, 1, 1,
-0.1295219, 1.859006, -0.4538715, 1, 0, 0, 1, 1,
-0.1292081, -1.252326, -2.422705, 1, 0, 0, 1, 1,
-0.1266701, -1.012531, -5.187252, 1, 0, 0, 1, 1,
-0.122176, 1.893253, -0.993515, 1, 0, 0, 1, 1,
-0.1188279, -0.6244628, -1.486529, 0, 0, 0, 1, 1,
-0.1162628, 0.2686167, 1.16011, 0, 0, 0, 1, 1,
-0.1144792, 1.122237, -0.7525843, 0, 0, 0, 1, 1,
-0.1130124, 1.033283, -0.8537778, 0, 0, 0, 1, 1,
-0.112347, 0.3241912, -1.019603, 0, 0, 0, 1, 1,
-0.1109721, 0.6674656, 0.6942928, 0, 0, 0, 1, 1,
-0.110959, 1.209118, 0.3751042, 0, 0, 0, 1, 1,
-0.1104958, 0.7676633, 1.555641, 1, 1, 1, 1, 1,
-0.1089861, 1.105524, 0.08382469, 1, 1, 1, 1, 1,
-0.1022414, 0.1732967, -1.271383, 1, 1, 1, 1, 1,
-0.1004703, 0.0983118, -1.144432, 1, 1, 1, 1, 1,
-0.09909292, -0.3079549, -0.6797808, 1, 1, 1, 1, 1,
-0.0976737, 2.174452, -0.8528928, 1, 1, 1, 1, 1,
-0.09628564, 0.2280136, -1.342682, 1, 1, 1, 1, 1,
-0.09320904, -0.7350249, -3.6874, 1, 1, 1, 1, 1,
-0.08963691, 0.4438276, -0.9303529, 1, 1, 1, 1, 1,
-0.08049203, 0.727977, -0.005725625, 1, 1, 1, 1, 1,
-0.08006837, -0.2093737, -2.849751, 1, 1, 1, 1, 1,
-0.07589877, 0.6425044, -0.4252497, 1, 1, 1, 1, 1,
-0.07532972, -0.9512246, -2.773975, 1, 1, 1, 1, 1,
-0.06110545, 0.831433, 0.1694982, 1, 1, 1, 1, 1,
-0.06060264, 0.4726503, 0.9273598, 1, 1, 1, 1, 1,
-0.06004792, -1.012138, -2.514674, 0, 0, 1, 1, 1,
-0.06000859, -1.066532, -3.731907, 1, 0, 0, 1, 1,
-0.0581799, 1.13608, -0.5282229, 1, 0, 0, 1, 1,
-0.05367768, -1.325472, -3.838133, 1, 0, 0, 1, 1,
-0.05205, -0.1376616, -1.74913, 1, 0, 0, 1, 1,
-0.05142334, 0.7214444, -0.1039709, 1, 0, 0, 1, 1,
-0.04930827, -2.353678, -3.12312, 0, 0, 0, 1, 1,
-0.04826698, 0.4402867, 0.4245703, 0, 0, 0, 1, 1,
-0.04794706, 0.9695917, 0.6021134, 0, 0, 0, 1, 1,
-0.04791665, -0.5185942, -4.281815, 0, 0, 0, 1, 1,
-0.04747052, 1.2111, 0.8115141, 0, 0, 0, 1, 1,
-0.04147153, -0.09867143, -3.600832, 0, 0, 0, 1, 1,
-0.0399535, 0.971656, 0.3630856, 0, 0, 0, 1, 1,
-0.03744245, 0.6329264, 0.332845, 1, 1, 1, 1, 1,
-0.03676593, -1.472074, -2.788918, 1, 1, 1, 1, 1,
-0.03495842, -0.06561101, -0.6087797, 1, 1, 1, 1, 1,
-0.03464613, -0.2501366, -2.195139, 1, 1, 1, 1, 1,
-0.03419075, 0.8023077, 0.2752278, 1, 1, 1, 1, 1,
-0.03174233, 0.4275101, -1.263653, 1, 1, 1, 1, 1,
-0.0313408, 0.7065939, 1.197951, 1, 1, 1, 1, 1,
-0.03063835, 1.062332, -0.6344284, 1, 1, 1, 1, 1,
-0.02950263, -0.383274, -1.804374, 1, 1, 1, 1, 1,
-0.0293095, 0.5921578, -0.7839848, 1, 1, 1, 1, 1,
-0.02896193, 0.5399346, 0.2579413, 1, 1, 1, 1, 1,
-0.02274068, -0.2619799, -4.543511, 1, 1, 1, 1, 1,
-0.01881802, -0.3684436, -2.455344, 1, 1, 1, 1, 1,
-0.01806981, 2.478464, 0.4892413, 1, 1, 1, 1, 1,
-0.01521711, -0.3265799, -2.807275, 1, 1, 1, 1, 1,
-0.01457979, 0.4803018, -0.7747979, 0, 0, 1, 1, 1,
-0.007086955, -0.7234275, -1.237275, 1, 0, 0, 1, 1,
-0.006589641, 1.142468, -1.267148, 1, 0, 0, 1, 1,
-0.001910129, 0.6452269, 0.2647578, 1, 0, 0, 1, 1,
0.004544737, 0.1407001, 0.3789286, 1, 0, 0, 1, 1,
0.01071566, 2.091777, 1.664693, 1, 0, 0, 1, 1,
0.01386207, 1.382681, -2.939061, 0, 0, 0, 1, 1,
0.01483115, -0.1111257, 4.010581, 0, 0, 0, 1, 1,
0.01510406, -0.4163426, 3.053643, 0, 0, 0, 1, 1,
0.01725557, 0.3112857, -0.8801495, 0, 0, 0, 1, 1,
0.01853104, 1.163853, 0.287141, 0, 0, 0, 1, 1,
0.02323107, -0.0690548, 2.540411, 0, 0, 0, 1, 1,
0.02381214, -0.6303707, 3.81771, 0, 0, 0, 1, 1,
0.026234, 0.5732057, -0.02318449, 1, 1, 1, 1, 1,
0.02820512, -0.153534, 2.842589, 1, 1, 1, 1, 1,
0.0356724, -0.4681288, 4.338678, 1, 1, 1, 1, 1,
0.03614317, -1.157168, 2.342792, 1, 1, 1, 1, 1,
0.0381513, -1.018463, 4.25236, 1, 1, 1, 1, 1,
0.04019494, 0.05081814, 1.34145, 1, 1, 1, 1, 1,
0.0417922, 1.841414, 0.4819739, 1, 1, 1, 1, 1,
0.04343706, 1.22443, -1.129799, 1, 1, 1, 1, 1,
0.04522967, 1.3945, -0.09286089, 1, 1, 1, 1, 1,
0.04973108, 1.443951, -0.4927322, 1, 1, 1, 1, 1,
0.05360035, -1.028141, 3.485139, 1, 1, 1, 1, 1,
0.06452946, -2.045239, 3.118209, 1, 1, 1, 1, 1,
0.07244537, -0.004894441, -0.5578591, 1, 1, 1, 1, 1,
0.08064902, 0.7559125, -1.382097, 1, 1, 1, 1, 1,
0.08488668, -0.5811448, 3.456163, 1, 1, 1, 1, 1,
0.08744595, -3.156662, 3.791821, 0, 0, 1, 1, 1,
0.08826301, -1.254353, 1.971133, 1, 0, 0, 1, 1,
0.08988829, -1.661835, 2.545784, 1, 0, 0, 1, 1,
0.09332316, -0.3098366, 2.476255, 1, 0, 0, 1, 1,
0.09475461, 1.086813, -0.3933818, 1, 0, 0, 1, 1,
0.1023378, -1.559508, 3.846787, 1, 0, 0, 1, 1,
0.1045326, -1.702864, 2.043538, 0, 0, 0, 1, 1,
0.1052776, -1.61512, 0.8656006, 0, 0, 0, 1, 1,
0.1079151, 0.746936, 1.089534, 0, 0, 0, 1, 1,
0.1080282, -1.374076, 2.885396, 0, 0, 0, 1, 1,
0.1126012, 0.1132387, 1.998155, 0, 0, 0, 1, 1,
0.1142151, 0.2119752, -0.5843714, 0, 0, 0, 1, 1,
0.1181613, -0.4466956, 3.98871, 0, 0, 0, 1, 1,
0.1205972, 0.5346217, 1.131092, 1, 1, 1, 1, 1,
0.1211301, -0.2080701, 1.818026, 1, 1, 1, 1, 1,
0.1232001, -1.334294, 1.50961, 1, 1, 1, 1, 1,
0.1238789, -1.768223, 3.748773, 1, 1, 1, 1, 1,
0.1241532, 0.2764844, -1.079678, 1, 1, 1, 1, 1,
0.1252782, -0.3515094, 2.900241, 1, 1, 1, 1, 1,
0.1264548, -0.2319677, 4.275282, 1, 1, 1, 1, 1,
0.1320752, -0.5462605, 2.076546, 1, 1, 1, 1, 1,
0.1329419, 0.8238901, -0.5977169, 1, 1, 1, 1, 1,
0.1359162, 0.9199464, 0.1075915, 1, 1, 1, 1, 1,
0.1379919, -2.805439, 3.19077, 1, 1, 1, 1, 1,
0.1384311, 1.511238, 1.181516, 1, 1, 1, 1, 1,
0.1389275, -1.131764, 1.381539, 1, 1, 1, 1, 1,
0.1391364, 0.4184141, 0.02153184, 1, 1, 1, 1, 1,
0.1398179, -0.296626, 4.401096, 1, 1, 1, 1, 1,
0.1408097, -0.7872972, 1.814957, 0, 0, 1, 1, 1,
0.142403, 0.6441208, -0.5498796, 1, 0, 0, 1, 1,
0.1476967, 0.9938661, -0.1157821, 1, 0, 0, 1, 1,
0.1523522, 1.594664, -0.9687161, 1, 0, 0, 1, 1,
0.1615852, 1.086975, -0.1322867, 1, 0, 0, 1, 1,
0.1619465, 0.1688526, 1.201082, 1, 0, 0, 1, 1,
0.1655999, 1.243749, 0.8505404, 0, 0, 0, 1, 1,
0.1672562, 0.7442225, -1.344031, 0, 0, 0, 1, 1,
0.1704819, -0.7656734, 2.395021, 0, 0, 0, 1, 1,
0.1790241, -0.5781094, 3.398169, 0, 0, 0, 1, 1,
0.18093, -0.8107396, 4.582865, 0, 0, 0, 1, 1,
0.1844758, 1.239979, 1.020166, 0, 0, 0, 1, 1,
0.1863346, -0.3772193, 1.791434, 0, 0, 0, 1, 1,
0.1910077, 0.1037696, 2.700821, 1, 1, 1, 1, 1,
0.1936235, 1.1027, -0.8603315, 1, 1, 1, 1, 1,
0.1976607, 0.06388263, 1.607021, 1, 1, 1, 1, 1,
0.199676, 1.151624, -0.3390355, 1, 1, 1, 1, 1,
0.2019283, -0.8076285, 3.618978, 1, 1, 1, 1, 1,
0.2060469, -0.1619658, 0.5062802, 1, 1, 1, 1, 1,
0.2092842, -0.02363113, 2.047755, 1, 1, 1, 1, 1,
0.2099576, 0.1769402, 2.853884, 1, 1, 1, 1, 1,
0.2131083, 1.3188, -0.9385947, 1, 1, 1, 1, 1,
0.2151454, 1.059319, -0.3526588, 1, 1, 1, 1, 1,
0.2175909, 0.5873475, 0.2814525, 1, 1, 1, 1, 1,
0.2197627, 0.2206074, 0.3407744, 1, 1, 1, 1, 1,
0.2211046, -0.09111621, 0.8545396, 1, 1, 1, 1, 1,
0.2226823, -0.4023385, 1.77449, 1, 1, 1, 1, 1,
0.223909, -1.407492, 3.118632, 1, 1, 1, 1, 1,
0.2242486, 0.4324711, 0.5756038, 0, 0, 1, 1, 1,
0.2244359, 1.307405, 0.2342992, 1, 0, 0, 1, 1,
0.2278932, -0.6045843, 2.93133, 1, 0, 0, 1, 1,
0.2280264, 0.3159003, -0.2281204, 1, 0, 0, 1, 1,
0.2332709, 1.592871, -0.1853538, 1, 0, 0, 1, 1,
0.2347145, 0.6542277, 1.001086, 1, 0, 0, 1, 1,
0.2362507, -0.5449343, 4.054061, 0, 0, 0, 1, 1,
0.2369667, -0.8205471, 5.123398, 0, 0, 0, 1, 1,
0.2400021, -0.09210689, 2.048022, 0, 0, 0, 1, 1,
0.2440435, -0.4281239, 2.952814, 0, 0, 0, 1, 1,
0.2447256, 1.083553, 0.08491779, 0, 0, 0, 1, 1,
0.2448067, -0.1728789, 3.211698, 0, 0, 0, 1, 1,
0.2477493, -0.1425335, 2.512773, 0, 0, 0, 1, 1,
0.25029, 0.4462221, -0.2737986, 1, 1, 1, 1, 1,
0.2503092, -2.164098, 1.803771, 1, 1, 1, 1, 1,
0.2532129, -0.2039287, 3.710107, 1, 1, 1, 1, 1,
0.2540283, 1.491313, 0.4565481, 1, 1, 1, 1, 1,
0.2561933, 0.5067469, -0.2805327, 1, 1, 1, 1, 1,
0.2610728, 0.4888673, 0.1029869, 1, 1, 1, 1, 1,
0.2716172, -0.2913944, 1.472756, 1, 1, 1, 1, 1,
0.2718086, 1.282088, 0.4790602, 1, 1, 1, 1, 1,
0.2719213, -0.08806797, 2.245051, 1, 1, 1, 1, 1,
0.2722609, 1.090537, 0.6613812, 1, 1, 1, 1, 1,
0.2764332, -0.5635684, 2.43196, 1, 1, 1, 1, 1,
0.2764784, -0.1764175, 2.895974, 1, 1, 1, 1, 1,
0.2808806, -0.4394183, 1.63479, 1, 1, 1, 1, 1,
0.2853507, -0.569524, 3.49451, 1, 1, 1, 1, 1,
0.2900787, -0.5171856, 4.112916, 1, 1, 1, 1, 1,
0.291474, -1.417909, 3.437526, 0, 0, 1, 1, 1,
0.2922561, 0.8668976, 1.139497, 1, 0, 0, 1, 1,
0.2963845, 0.3844128, 0.9428574, 1, 0, 0, 1, 1,
0.2985611, 0.9646714, -0.07434554, 1, 0, 0, 1, 1,
0.2991418, -0.2066323, 1.966145, 1, 0, 0, 1, 1,
0.2998714, 0.4956817, 0.9380467, 1, 0, 0, 1, 1,
0.3015665, 1.097859, -0.7527151, 0, 0, 0, 1, 1,
0.3022442, 2.013016, -0.9718773, 0, 0, 0, 1, 1,
0.3073666, -0.4761842, 2.64754, 0, 0, 0, 1, 1,
0.3114591, -0.3465307, 4.820851, 0, 0, 0, 1, 1,
0.3119175, 0.2408796, 0.6578916, 0, 0, 0, 1, 1,
0.3152357, 0.02009061, 0.7209632, 0, 0, 0, 1, 1,
0.323387, 2.410524, -0.9673647, 0, 0, 0, 1, 1,
0.3257815, 0.7507437, -0.1582344, 1, 1, 1, 1, 1,
0.3283792, -0.4581666, 0.3063555, 1, 1, 1, 1, 1,
0.3306283, -0.4262048, 2.579197, 1, 1, 1, 1, 1,
0.3390534, -0.05562897, 0.6217332, 1, 1, 1, 1, 1,
0.3402366, 0.2099984, 1.3164, 1, 1, 1, 1, 1,
0.3402391, -1.405733, 1.493973, 1, 1, 1, 1, 1,
0.3407104, -0.1254907, 3.222089, 1, 1, 1, 1, 1,
0.3467044, -0.2817641, 2.445993, 1, 1, 1, 1, 1,
0.3505296, 0.7482898, 0.3429806, 1, 1, 1, 1, 1,
0.3558654, -0.308893, 1.717044, 1, 1, 1, 1, 1,
0.3622381, 0.1840955, -0.06822262, 1, 1, 1, 1, 1,
0.3645855, 0.9931677, 2.057704, 1, 1, 1, 1, 1,
0.3647708, -0.9443151, 2.547792, 1, 1, 1, 1, 1,
0.3659011, 1.404691, -0.429814, 1, 1, 1, 1, 1,
0.3667567, -0.0169945, 3.257832, 1, 1, 1, 1, 1,
0.3671161, -0.5213127, 2.536056, 0, 0, 1, 1, 1,
0.369715, -0.4230956, 1.088202, 1, 0, 0, 1, 1,
0.37228, -1.448688, 3.222717, 1, 0, 0, 1, 1,
0.3723881, -1.170759, 2.441917, 1, 0, 0, 1, 1,
0.3756878, -0.1809817, 3.110589, 1, 0, 0, 1, 1,
0.3768744, -1.404173, 4.312992, 1, 0, 0, 1, 1,
0.37769, 0.1059096, 0.3666525, 0, 0, 0, 1, 1,
0.3796528, 0.7158656, 0.05872524, 0, 0, 0, 1, 1,
0.3806172, 0.09009759, 1.104099, 0, 0, 0, 1, 1,
0.3866755, 0.4816312, 1.28946, 0, 0, 0, 1, 1,
0.3869938, -0.7638607, 1.229501, 0, 0, 0, 1, 1,
0.3913452, -1.035419, 4.122757, 0, 0, 0, 1, 1,
0.3914325, 0.06366483, 1.596325, 0, 0, 0, 1, 1,
0.3943, 1.168226, -1.333846, 1, 1, 1, 1, 1,
0.3960902, 2.282946, 0.3092728, 1, 1, 1, 1, 1,
0.4010887, 0.1370313, 2.003169, 1, 1, 1, 1, 1,
0.4014301, 0.5318432, -0.1994997, 1, 1, 1, 1, 1,
0.4136669, 0.07696956, 1.674258, 1, 1, 1, 1, 1,
0.4188018, 0.8812802, 0.2083161, 1, 1, 1, 1, 1,
0.419103, -0.8442467, 3.892347, 1, 1, 1, 1, 1,
0.4194453, -0.3975151, 2.610085, 1, 1, 1, 1, 1,
0.4205717, 1.836526, -0.9739693, 1, 1, 1, 1, 1,
0.4250609, -2.376568, 2.360229, 1, 1, 1, 1, 1,
0.4308672, 1.447815, -1.249914, 1, 1, 1, 1, 1,
0.4353562, -0.8105101, 3.414442, 1, 1, 1, 1, 1,
0.4376943, 0.9457666, 0.2520606, 1, 1, 1, 1, 1,
0.4492073, 0.1186804, 0.4156935, 1, 1, 1, 1, 1,
0.4500938, -1.352387, 2.515471, 1, 1, 1, 1, 1,
0.4515915, -0.6788069, 2.044363, 0, 0, 1, 1, 1,
0.4539212, -1.108204, 3.678229, 1, 0, 0, 1, 1,
0.4591555, 3.042276, 1.11012, 1, 0, 0, 1, 1,
0.4611724, -1.336294, 2.065856, 1, 0, 0, 1, 1,
0.4617998, 0.3509984, 1.359711, 1, 0, 0, 1, 1,
0.4668668, -1.0038, 2.01915, 1, 0, 0, 1, 1,
0.4681928, -0.5234304, 4.003509, 0, 0, 0, 1, 1,
0.4692928, -0.8548104, 2.713412, 0, 0, 0, 1, 1,
0.4704898, -0.4524887, 2.61429, 0, 0, 0, 1, 1,
0.4717159, -0.3410354, 2.420614, 0, 0, 0, 1, 1,
0.4733187, -1.174666, 2.363153, 0, 0, 0, 1, 1,
0.4737497, 1.00958, -0.6093953, 0, 0, 0, 1, 1,
0.4747806, 1.124826, -0.4320014, 0, 0, 0, 1, 1,
0.4756148, -1.449145, 3.110195, 1, 1, 1, 1, 1,
0.4830115, -0.9968393, 2.535684, 1, 1, 1, 1, 1,
0.4894829, 0.1771097, 0.7175799, 1, 1, 1, 1, 1,
0.4913428, 1.342644, -1.492297, 1, 1, 1, 1, 1,
0.492123, -1.556133, 2.886431, 1, 1, 1, 1, 1,
0.4924276, -0.04448336, 1.354271, 1, 1, 1, 1, 1,
0.4929547, 0.04016811, 2.804871, 1, 1, 1, 1, 1,
0.4948438, -0.1204809, 2.491293, 1, 1, 1, 1, 1,
0.5036604, 0.3106559, -0.6123771, 1, 1, 1, 1, 1,
0.5061852, 0.8251216, 0.5286709, 1, 1, 1, 1, 1,
0.508882, 0.4058414, 0.4980638, 1, 1, 1, 1, 1,
0.5191154, -0.642818, 2.448241, 1, 1, 1, 1, 1,
0.5192928, -1.175322, 4.405868, 1, 1, 1, 1, 1,
0.5200814, -0.5988346, 2.373784, 1, 1, 1, 1, 1,
0.5219722, 0.6718063, 0.4012642, 1, 1, 1, 1, 1,
0.5228958, -0.2536396, 2.312924, 0, 0, 1, 1, 1,
0.5270496, 0.2893699, 0.635702, 1, 0, 0, 1, 1,
0.536627, 0.009359093, 1.735545, 1, 0, 0, 1, 1,
0.5395223, -0.2512268, 5.023145, 1, 0, 0, 1, 1,
0.5397795, 1.013543, -0.3606363, 1, 0, 0, 1, 1,
0.5399557, 0.2988825, -0.5158344, 1, 0, 0, 1, 1,
0.5406061, 0.1126463, 0.1913081, 0, 0, 0, 1, 1,
0.5432983, -0.5435866, 1.867545, 0, 0, 0, 1, 1,
0.5447351, 0.03449093, 0.9756328, 0, 0, 0, 1, 1,
0.54623, 0.8474399, 0.4622176, 0, 0, 0, 1, 1,
0.5537755, -0.6234477, 1.155989, 0, 0, 0, 1, 1,
0.554283, 1.340457, -0.1578245, 0, 0, 0, 1, 1,
0.5547093, -1.582491, 1.86215, 0, 0, 0, 1, 1,
0.5571937, 0.3278273, 1.259503, 1, 1, 1, 1, 1,
0.56471, -0.7131258, 3.298829, 1, 1, 1, 1, 1,
0.56652, -1.705845, 3.900364, 1, 1, 1, 1, 1,
0.5714705, -0.8339939, 3.001592, 1, 1, 1, 1, 1,
0.5766942, -0.776801, 3.533047, 1, 1, 1, 1, 1,
0.5787728, 0.899054, 2.548425, 1, 1, 1, 1, 1,
0.5808223, -0.5175651, 1.687297, 1, 1, 1, 1, 1,
0.5815915, -0.9262272, 1.760324, 1, 1, 1, 1, 1,
0.5846025, -0.3737218, 2.438305, 1, 1, 1, 1, 1,
0.5853394, 0.9316151, -0.4367403, 1, 1, 1, 1, 1,
0.5857504, 0.2934313, 0.6960958, 1, 1, 1, 1, 1,
0.5875256, 0.3148922, 0.9270245, 1, 1, 1, 1, 1,
0.58939, -0.4027465, 2.903794, 1, 1, 1, 1, 1,
0.589543, -1.260524, 3.222578, 1, 1, 1, 1, 1,
0.5935913, 1.480822, -0.9350759, 1, 1, 1, 1, 1,
0.5954245, -0.09851868, 1.383304, 0, 0, 1, 1, 1,
0.598363, 1.066085, -0.6932053, 1, 0, 0, 1, 1,
0.6008204, -0.5857721, 1.479291, 1, 0, 0, 1, 1,
0.6030239, -0.06947253, 1.726653, 1, 0, 0, 1, 1,
0.6057889, -2.314524, 2.263651, 1, 0, 0, 1, 1,
0.6062463, 0.7128386, 1.132695, 1, 0, 0, 1, 1,
0.6166849, -1.886332, 3.55431, 0, 0, 0, 1, 1,
0.6183112, 1.863513, 1.409762, 0, 0, 0, 1, 1,
0.6277611, -0.0245689, 0.8449126, 0, 0, 0, 1, 1,
0.6296766, 0.4427689, 1.240922, 0, 0, 0, 1, 1,
0.6318187, 1.246658, 0.2629538, 0, 0, 0, 1, 1,
0.633471, 1.554044, -0.7088135, 0, 0, 0, 1, 1,
0.6345373, -0.2378852, 2.555638, 0, 0, 0, 1, 1,
0.6401991, 1.865591, -0.3136799, 1, 1, 1, 1, 1,
0.6436464, -0.9772783, 2.277727, 1, 1, 1, 1, 1,
0.6602166, -0.4919643, 1.620925, 1, 1, 1, 1, 1,
0.6616527, -1.30676, 1.198985, 1, 1, 1, 1, 1,
0.6626799, -0.2435623, 3.073637, 1, 1, 1, 1, 1,
0.6629001, -2.353323, 1.463009, 1, 1, 1, 1, 1,
0.6635148, -0.3563622, 1.650087, 1, 1, 1, 1, 1,
0.6645275, 1.986234, -0.2055878, 1, 1, 1, 1, 1,
0.6664302, 0.008969681, 0.02551351, 1, 1, 1, 1, 1,
0.6674207, 1.791243, 0.9354154, 1, 1, 1, 1, 1,
0.6718462, -1.512958, 0.8978667, 1, 1, 1, 1, 1,
0.6758021, -1.225539, 0.2244215, 1, 1, 1, 1, 1,
0.6760461, 1.403593, -0.6829306, 1, 1, 1, 1, 1,
0.679949, 0.07820126, 0.002106691, 1, 1, 1, 1, 1,
0.6823132, -0.2142692, 2.759565, 1, 1, 1, 1, 1,
0.6886849, 0.8718305, -0.04615936, 0, 0, 1, 1, 1,
0.6911707, 1.829712, -0.04338139, 1, 0, 0, 1, 1,
0.6943365, -1.081098, 2.954257, 1, 0, 0, 1, 1,
0.6943714, -0.8546981, 2.910228, 1, 0, 0, 1, 1,
0.6967757, -0.4929765, 2.680865, 1, 0, 0, 1, 1,
0.6977037, 0.6505746, -0.532415, 1, 0, 0, 1, 1,
0.7019979, 0.2800877, 2.071827, 0, 0, 0, 1, 1,
0.7091328, -0.2809805, 1.193991, 0, 0, 0, 1, 1,
0.7158477, -0.4523954, 3.280183, 0, 0, 0, 1, 1,
0.7209757, 0.7332702, 3.749437, 0, 0, 0, 1, 1,
0.7216994, 0.485311, 1.993276, 0, 0, 0, 1, 1,
0.7227558, -0.08306316, 1.703733, 0, 0, 0, 1, 1,
0.7240096, 0.6893697, 0.5322455, 0, 0, 0, 1, 1,
0.7382614, 0.389088, 1.323426, 1, 1, 1, 1, 1,
0.7383581, 0.8674594, -1.123881, 1, 1, 1, 1, 1,
0.7407595, -0.694055, -0.04719695, 1, 1, 1, 1, 1,
0.7613335, -0.1109044, 3.000695, 1, 1, 1, 1, 1,
0.7638935, 1.129907, 0.6268169, 1, 1, 1, 1, 1,
0.7646512, 1.152394, 0.9189761, 1, 1, 1, 1, 1,
0.7651681, -0.1880522, 1.402853, 1, 1, 1, 1, 1,
0.7654247, 0.7622679, 1.296764, 1, 1, 1, 1, 1,
0.7659865, 1.678682, 2.241253, 1, 1, 1, 1, 1,
0.767333, 0.2802811, 1.353257, 1, 1, 1, 1, 1,
0.7741416, 0.1883292, 1.913139, 1, 1, 1, 1, 1,
0.7755705, -0.7525405, 3.181164, 1, 1, 1, 1, 1,
0.7785436, 0.2278988, 1.267107, 1, 1, 1, 1, 1,
0.7853923, -1.145311, 1.89392, 1, 1, 1, 1, 1,
0.7864315, -0.2639825, 1.378557, 1, 1, 1, 1, 1,
0.7876465, -0.1585832, 0.6150581, 0, 0, 1, 1, 1,
0.7929848, 1.31039, 1.110271, 1, 0, 0, 1, 1,
0.8021325, -0.4239329, 3.241511, 1, 0, 0, 1, 1,
0.8040919, 0.7648559, 1.003475, 1, 0, 0, 1, 1,
0.8058869, -0.8230972, 3.496321, 1, 0, 0, 1, 1,
0.8094909, -0.3323956, 0.05846835, 1, 0, 0, 1, 1,
0.8116908, -0.4621696, 1.609554, 0, 0, 0, 1, 1,
0.8140682, 1.351254, -0.2828223, 0, 0, 0, 1, 1,
0.8142313, 0.8362318, 1.210755, 0, 0, 0, 1, 1,
0.8194923, 0.332026, 1.009849, 0, 0, 0, 1, 1,
0.8213049, 0.1151774, 0.974, 0, 0, 0, 1, 1,
0.8234298, -1.500678, 2.896415, 0, 0, 0, 1, 1,
0.8289297, -0.01495896, 1.920645, 0, 0, 0, 1, 1,
0.8394448, -0.9892095, 3.698716, 1, 1, 1, 1, 1,
0.8519865, 1.037789, 1.615904, 1, 1, 1, 1, 1,
0.855381, -0.2799121, 0.3990292, 1, 1, 1, 1, 1,
0.8599005, 0.5996584, 1.100538, 1, 1, 1, 1, 1,
0.8601785, -0.3241019, 0.9799902, 1, 1, 1, 1, 1,
0.8667659, 0.19453, 0.6438816, 1, 1, 1, 1, 1,
0.8729711, -1.637792, 2.978754, 1, 1, 1, 1, 1,
0.876869, 0.3205078, 0.9774603, 1, 1, 1, 1, 1,
0.8848487, -0.02277815, 3.865451, 1, 1, 1, 1, 1,
0.8858827, -0.04537444, 1.036426, 1, 1, 1, 1, 1,
0.8871751, 2.046424, -1.37347, 1, 1, 1, 1, 1,
0.8874325, 0.2750705, 1.886298, 1, 1, 1, 1, 1,
0.8913392, 1.000337, 0.3335187, 1, 1, 1, 1, 1,
0.8955879, 1.171744, 0.9941533, 1, 1, 1, 1, 1,
0.904692, 1.122065, 0.4241489, 1, 1, 1, 1, 1,
0.9087114, -2.205627, 3.550175, 0, 0, 1, 1, 1,
0.9165422, 0.2470395, 0.3242112, 1, 0, 0, 1, 1,
0.9186376, -1.147134, 1.998457, 1, 0, 0, 1, 1,
0.9270195, 2.025839, -0.2597463, 1, 0, 0, 1, 1,
0.9298264, 1.474085, 0.9572363, 1, 0, 0, 1, 1,
0.9311152, -0.162183, 1.60945, 1, 0, 0, 1, 1,
0.9388578, -1.399805, 3.771615, 0, 0, 0, 1, 1,
0.940578, -0.6422388, 2.289959, 0, 0, 0, 1, 1,
0.9415854, -0.6049311, 1.091184, 0, 0, 0, 1, 1,
0.9428034, 0.2347345, 0.4249321, 0, 0, 0, 1, 1,
0.943101, -0.8231052, 1.76173, 0, 0, 0, 1, 1,
0.950342, 0.3039721, 1.413603, 0, 0, 0, 1, 1,
0.9508188, -0.2565773, 2.302293, 0, 0, 0, 1, 1,
0.9554606, 0.3665558, -0.2306495, 1, 1, 1, 1, 1,
0.9685207, -0.561561, 3.354102, 1, 1, 1, 1, 1,
0.9699513, 2.185919, 0.4112122, 1, 1, 1, 1, 1,
0.9719957, -2.287441, 2.547522, 1, 1, 1, 1, 1,
0.9782385, -1.438046, 1.354542, 1, 1, 1, 1, 1,
0.9812235, -2.91479, 2.583282, 1, 1, 1, 1, 1,
0.9872605, -0.2662676, 2.630028, 1, 1, 1, 1, 1,
0.9901531, 0.3334753, -0.2531588, 1, 1, 1, 1, 1,
0.9943273, -0.1450956, 0.7918481, 1, 1, 1, 1, 1,
0.9962584, 0.3754337, 2.010208, 1, 1, 1, 1, 1,
0.9985865, 1.01506, 1.891799, 1, 1, 1, 1, 1,
1.007022, -0.02048108, 1.95014, 1, 1, 1, 1, 1,
1.008635, -1.623152, 3.300216, 1, 1, 1, 1, 1,
1.010653, -1.181226, 1.58369, 1, 1, 1, 1, 1,
1.015015, 0.9121578, 0.7163609, 1, 1, 1, 1, 1,
1.016396, 1.020951, 1.200445, 0, 0, 1, 1, 1,
1.016429, 1.06708, -0.02305856, 1, 0, 0, 1, 1,
1.018819, 0.2850592, 1.626259, 1, 0, 0, 1, 1,
1.020379, 1.164684, 0.002874861, 1, 0, 0, 1, 1,
1.022211, -0.3205542, 2.364234, 1, 0, 0, 1, 1,
1.023298, -1.782645, 2.650039, 1, 0, 0, 1, 1,
1.030316, 0.1184739, 2.38873, 0, 0, 0, 1, 1,
1.031913, -0.5284262, 0.5030941, 0, 0, 0, 1, 1,
1.034332, 1.280582, 0.3350236, 0, 0, 0, 1, 1,
1.062676, -1.137027, 3.079333, 0, 0, 0, 1, 1,
1.067236, -0.9137934, 4.070783, 0, 0, 0, 1, 1,
1.068048, 0.6092996, 1.956028, 0, 0, 0, 1, 1,
1.069798, 0.7019686, 1.861521, 0, 0, 0, 1, 1,
1.081774, 1.556149, -1.272426, 1, 1, 1, 1, 1,
1.082195, 0.4564644, -0.8759494, 1, 1, 1, 1, 1,
1.084349, 1.888566, -0.2390087, 1, 1, 1, 1, 1,
1.089599, 0.289028, -0.6445875, 1, 1, 1, 1, 1,
1.097185, 1.671453, -0.07041659, 1, 1, 1, 1, 1,
1.102017, 0.3086953, -0.02487346, 1, 1, 1, 1, 1,
1.123298, 0.7809206, 0.3241223, 1, 1, 1, 1, 1,
1.142871, 0.4989325, 0.6712995, 1, 1, 1, 1, 1,
1.144589, -0.8613837, 1.80349, 1, 1, 1, 1, 1,
1.154257, -0.009039105, 2.916775, 1, 1, 1, 1, 1,
1.193437, -0.2385434, 0.6026609, 1, 1, 1, 1, 1,
1.195763, -0.4061675, 1.725694, 1, 1, 1, 1, 1,
1.19986, -0.7849605, 0.6229461, 1, 1, 1, 1, 1,
1.210168, 0.02700276, 1.16201, 1, 1, 1, 1, 1,
1.213068, 0.8873278, 0.475611, 1, 1, 1, 1, 1,
1.222383, -0.0692552, 1.301463, 0, 0, 1, 1, 1,
1.225184, -0.9570107, 2.311323, 1, 0, 0, 1, 1,
1.226395, -0.4804988, 1.158737, 1, 0, 0, 1, 1,
1.237048, -0.6258937, 3.061114, 1, 0, 0, 1, 1,
1.252396, -1.511805, 1.665239, 1, 0, 0, 1, 1,
1.267803, -0.5733587, 3.14495, 1, 0, 0, 1, 1,
1.268732, 1.882035, 1.424845, 0, 0, 0, 1, 1,
1.269221, -0.3877343, 4.351994, 0, 0, 0, 1, 1,
1.270887, 0.5736028, 0.6968392, 0, 0, 0, 1, 1,
1.272504, -0.6988257, 2.928651, 0, 0, 0, 1, 1,
1.274605, 0.9376872, 0.5113407, 0, 0, 0, 1, 1,
1.280548, 1.53062, -0.08073942, 0, 0, 0, 1, 1,
1.288238, 0.01872199, 0.0174056, 0, 0, 0, 1, 1,
1.292717, -1.762449, 1.769148, 1, 1, 1, 1, 1,
1.294382, -0.1710915, 0.6797392, 1, 1, 1, 1, 1,
1.294653, -0.6951427, 0.4803286, 1, 1, 1, 1, 1,
1.301762, -0.7256302, 1.84708, 1, 1, 1, 1, 1,
1.317971, 1.467541, 0.5911524, 1, 1, 1, 1, 1,
1.324841, -1.154973, 3.794936, 1, 1, 1, 1, 1,
1.329939, -0.395879, 1.606771, 1, 1, 1, 1, 1,
1.332729, 1.080674, 1.151247, 1, 1, 1, 1, 1,
1.333985, 1.696667, -1.390827, 1, 1, 1, 1, 1,
1.334303, -0.2946413, 0.1340045, 1, 1, 1, 1, 1,
1.336444, -0.1504554, 2.306413, 1, 1, 1, 1, 1,
1.338938, 0.9516413, 0.945743, 1, 1, 1, 1, 1,
1.339974, 0.3843029, 2.136362, 1, 1, 1, 1, 1,
1.340659, 0.1807369, 3.954559, 1, 1, 1, 1, 1,
1.35362, 1.045291, 0.07816075, 1, 1, 1, 1, 1,
1.362239, -1.105059, 3.120192, 0, 0, 1, 1, 1,
1.364555, -0.9012189, 1.26979, 1, 0, 0, 1, 1,
1.368212, -0.3536697, 1.006738, 1, 0, 0, 1, 1,
1.368929, -0.4809219, 2.315817, 1, 0, 0, 1, 1,
1.369417, -1.513343, 0.9086595, 1, 0, 0, 1, 1,
1.371124, -0.1716671, 2.852398, 1, 0, 0, 1, 1,
1.373393, -1.348859, 3.318054, 0, 0, 0, 1, 1,
1.379466, 0.4694558, 1.003417, 0, 0, 0, 1, 1,
1.383737, -1.283223, 2.35601, 0, 0, 0, 1, 1,
1.385483, -1.007537, 2.942791, 0, 0, 0, 1, 1,
1.392532, -2.300538, 2.449357, 0, 0, 0, 1, 1,
1.401149, -0.7862135, 3.366591, 0, 0, 0, 1, 1,
1.409656, 1.152695, 0.8500759, 0, 0, 0, 1, 1,
1.416979, 1.096315, -0.4452754, 1, 1, 1, 1, 1,
1.439668, 0.2614289, 1.045991, 1, 1, 1, 1, 1,
1.442402, 0.6522508, -0.2038683, 1, 1, 1, 1, 1,
1.442584, 0.6385788, -0.5549801, 1, 1, 1, 1, 1,
1.448163, -1.315501, 2.716261, 1, 1, 1, 1, 1,
1.448915, 0.7970163, 0.7249802, 1, 1, 1, 1, 1,
1.458467, 1.62172, 0.7865067, 1, 1, 1, 1, 1,
1.461369, -0.531535, 1.499135, 1, 1, 1, 1, 1,
1.480123, -0.5980471, 1.71237, 1, 1, 1, 1, 1,
1.481298, -0.4178411, 1.511747, 1, 1, 1, 1, 1,
1.48717, 0.1215305, 1.346902, 1, 1, 1, 1, 1,
1.491591, -0.4476559, 0.9395584, 1, 1, 1, 1, 1,
1.494254, -0.254476, 1.640007, 1, 1, 1, 1, 1,
1.503747, -0.6719036, 2.468361, 1, 1, 1, 1, 1,
1.505795, 0.8806498, 2.135299, 1, 1, 1, 1, 1,
1.508452, -0.4814422, 2.208942, 0, 0, 1, 1, 1,
1.520854, 0.9353431, -0.6172659, 1, 0, 0, 1, 1,
1.531978, -0.8461294, 2.061491, 1, 0, 0, 1, 1,
1.558045, -0.957594, 0.5475881, 1, 0, 0, 1, 1,
1.559076, 0.6996483, 0.8668585, 1, 0, 0, 1, 1,
1.559472, 0.04368813, 1.077249, 1, 0, 0, 1, 1,
1.563432, -0.6153586, 1.834851, 0, 0, 0, 1, 1,
1.573295, 0.9443225, -0.2055411, 0, 0, 0, 1, 1,
1.584985, 0.5300476, 2.602015, 0, 0, 0, 1, 1,
1.6072, 0.0004310654, 2.389544, 0, 0, 0, 1, 1,
1.609224, 0.6351045, -0.4711034, 0, 0, 0, 1, 1,
1.620514, 0.2469906, 2.595431, 0, 0, 0, 1, 1,
1.633647, -0.8572443, 1.825224, 0, 0, 0, 1, 1,
1.648562, -2.373097, 0.4390141, 1, 1, 1, 1, 1,
1.651714, -0.4756732, 1.342476, 1, 1, 1, 1, 1,
1.656868, 0.7214028, 0.7623367, 1, 1, 1, 1, 1,
1.659786, -0.5454388, 2.799197, 1, 1, 1, 1, 1,
1.682446, 0.1566382, 1.197236, 1, 1, 1, 1, 1,
1.695788, -0.9889811, 1.887131, 1, 1, 1, 1, 1,
1.703336, 0.3188739, 2.187049, 1, 1, 1, 1, 1,
1.707317, -0.3141663, 3.562604, 1, 1, 1, 1, 1,
1.712842, -1.223234, 2.274997, 1, 1, 1, 1, 1,
1.714448, -0.072035, 2.040832, 1, 1, 1, 1, 1,
1.719372, -0.6019328, 1.26261, 1, 1, 1, 1, 1,
1.719486, -1.886247, 3.216768, 1, 1, 1, 1, 1,
1.724143, 0.4336318, 0.6593376, 1, 1, 1, 1, 1,
1.73257, 0.9470529, 0.2139702, 1, 1, 1, 1, 1,
1.733247, -1.856303, 4.074929, 1, 1, 1, 1, 1,
1.747913, 0.1081014, 1.011092, 0, 0, 1, 1, 1,
1.752077, -0.1134302, 0.6883674, 1, 0, 0, 1, 1,
1.753814, -1.876711, 3.429221, 1, 0, 0, 1, 1,
1.754957, 0.2795815, 2.136878, 1, 0, 0, 1, 1,
1.782256, -0.7029682, -0.2281301, 1, 0, 0, 1, 1,
1.797003, 0.388302, 1.36272, 1, 0, 0, 1, 1,
1.798768, 0.1082414, 0.2613928, 0, 0, 0, 1, 1,
1.805879, -0.20052, 0.5350628, 0, 0, 0, 1, 1,
1.812894, -1.296105, 1.576925, 0, 0, 0, 1, 1,
1.865448, -0.3343396, -0.2538267, 0, 0, 0, 1, 1,
1.868983, -0.2822969, 0.7580451, 0, 0, 0, 1, 1,
1.884986, -0.03935121, 3.328399, 0, 0, 0, 1, 1,
1.890725, 0.6643041, 1.302646, 0, 0, 0, 1, 1,
1.904145, -0.816353, 1.093566, 1, 1, 1, 1, 1,
1.91008, -1.353395, 1.261254, 1, 1, 1, 1, 1,
1.916857, 0.1703569, 0.8559529, 1, 1, 1, 1, 1,
1.97221, 0.2356762, 1.333873, 1, 1, 1, 1, 1,
2.03638, 1.759055, 1.089584, 1, 1, 1, 1, 1,
2.062863, -0.3636279, 2.775616, 1, 1, 1, 1, 1,
2.069739, -1.642334, 1.095106, 1, 1, 1, 1, 1,
2.075796, -1.083376, 1.647655, 1, 1, 1, 1, 1,
2.104566, 0.8205015, 0.8344591, 1, 1, 1, 1, 1,
2.133371, 0.6144497, 1.902281, 1, 1, 1, 1, 1,
2.133656, 0.08499497, 2.880652, 1, 1, 1, 1, 1,
2.138478, 0.2573266, 1.240588, 1, 1, 1, 1, 1,
2.166409, -0.4170315, 2.592743, 1, 1, 1, 1, 1,
2.192806, 0.1847057, 1.446957, 1, 1, 1, 1, 1,
2.199732, -0.2019557, 3.093552, 1, 1, 1, 1, 1,
2.20706, -0.05571976, 0.5436769, 0, 0, 1, 1, 1,
2.20852, 0.1748584, 0.4058981, 1, 0, 0, 1, 1,
2.318523, -0.7198143, 2.858219, 1, 0, 0, 1, 1,
2.331511, -0.2855354, 2.729074, 1, 0, 0, 1, 1,
2.343446, -0.281415, -0.156036, 1, 0, 0, 1, 1,
2.363164, -0.03543128, 2.124983, 1, 0, 0, 1, 1,
2.366941, 0.02735436, 0.3267046, 0, 0, 0, 1, 1,
2.38084, -0.2270151, 2.614078, 0, 0, 0, 1, 1,
2.408785, 0.04533354, 0.5361425, 0, 0, 0, 1, 1,
2.469107, 0.1188261, -0.1384896, 0, 0, 0, 1, 1,
2.528414, 0.2131813, 1.472832, 0, 0, 0, 1, 1,
2.533087, 0.4092184, 1.156542, 0, 0, 0, 1, 1,
2.600421, 0.8341939, 0.7222719, 0, 0, 0, 1, 1,
2.624127, 0.5128537, 0.6446778, 1, 1, 1, 1, 1,
2.640673, 0.6745027, 2.609116, 1, 1, 1, 1, 1,
2.787998, 1.016319, 2.755913, 1, 1, 1, 1, 1,
2.86798, -0.2911447, 0.4824443, 1, 1, 1, 1, 1,
2.869954, 1.898253, 0.8501813, 1, 1, 1, 1, 1,
2.993949, 1.139002, 2.132865, 1, 1, 1, 1, 1,
3.204417, 0.1102483, 0.3302548, 1, 1, 1, 1, 1
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
var radius = 9.747525;
var distance = 34.23777;
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
mvMatrix.translate( 0.03254461, -0.1722248, 0.3444502 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.23777);
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