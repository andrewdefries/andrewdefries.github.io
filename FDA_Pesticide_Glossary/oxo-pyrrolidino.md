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
-3.201755, 0.2391211, -1.124369, 1, 0, 0, 1,
-3.145227, -0.5297039, -3.242893, 1, 0.007843138, 0, 1,
-3.043661, 0.4314165, 0.2876614, 1, 0.01176471, 0, 1,
-2.982815, -0.2220976, -2.108206, 1, 0.01960784, 0, 1,
-2.882975, -0.1647313, -3.21851, 1, 0.02352941, 0, 1,
-2.836623, -0.104503, -1.872436, 1, 0.03137255, 0, 1,
-2.592868, 1.205457, -1.885859, 1, 0.03529412, 0, 1,
-2.548779, 0.5639409, -1.315758, 1, 0.04313726, 0, 1,
-2.534211, -0.846016, -1.634407, 1, 0.04705882, 0, 1,
-2.506168, 0.7786276, -2.429593, 1, 0.05490196, 0, 1,
-2.430166, 1.008537, -1.145273, 1, 0.05882353, 0, 1,
-2.428626, -0.6246486, -0.7570202, 1, 0.06666667, 0, 1,
-2.422675, -1.431832, -2.835467, 1, 0.07058824, 0, 1,
-2.361322, 0.7285125, -0.7191037, 1, 0.07843138, 0, 1,
-2.337435, 0.0627238, -2.328163, 1, 0.08235294, 0, 1,
-2.289928, -2.814993, -1.515525, 1, 0.09019608, 0, 1,
-2.275364, 0.352575, -0.9655672, 1, 0.09411765, 0, 1,
-2.23137, 0.9514247, -0.09361323, 1, 0.1019608, 0, 1,
-2.208786, -2.202082, -0.8900682, 1, 0.1098039, 0, 1,
-2.205243, -1.018019, -1.314173, 1, 0.1137255, 0, 1,
-2.172975, -1.321583, -3.11453, 1, 0.1215686, 0, 1,
-2.151573, 0.9317877, -0.9960491, 1, 0.1254902, 0, 1,
-2.141135, -0.06716914, 0.7439066, 1, 0.1333333, 0, 1,
-2.096967, 0.1386618, -0.3051974, 1, 0.1372549, 0, 1,
-2.094571, -0.9474426, -2.865735, 1, 0.145098, 0, 1,
-2.062667, -1.390223, -1.555101, 1, 0.1490196, 0, 1,
-2.062517, 0.92917, -0.6585758, 1, 0.1568628, 0, 1,
-2.01701, -0.7246421, -1.852951, 1, 0.1607843, 0, 1,
-1.999117, -0.4275302, -2.801262, 1, 0.1686275, 0, 1,
-1.998168, -0.0853586, -3.084319, 1, 0.172549, 0, 1,
-1.979435, -0.9051207, -0.6185313, 1, 0.1803922, 0, 1,
-1.960904, -1.575504, -2.113171, 1, 0.1843137, 0, 1,
-1.948091, 0.8923087, -0.3431456, 1, 0.1921569, 0, 1,
-1.917202, 0.1335806, -2.469671, 1, 0.1960784, 0, 1,
-1.893564, -1.485474, -3.999548, 1, 0.2039216, 0, 1,
-1.891483, -0.1066118, -2.468033, 1, 0.2117647, 0, 1,
-1.891276, -0.7569925, 0.5575427, 1, 0.2156863, 0, 1,
-1.830658, 1.309784, -0.01718802, 1, 0.2235294, 0, 1,
-1.820317, -0.1665792, -0.680265, 1, 0.227451, 0, 1,
-1.818296, -0.8283309, -1.535743, 1, 0.2352941, 0, 1,
-1.813891, 1.085556, -3.150932, 1, 0.2392157, 0, 1,
-1.78625, 0.08216888, -0.7980951, 1, 0.2470588, 0, 1,
-1.781852, -0.1960334, -1.377576, 1, 0.2509804, 0, 1,
-1.765941, 0.0541513, -0.5496447, 1, 0.2588235, 0, 1,
-1.764441, -0.5838647, -0.5030354, 1, 0.2627451, 0, 1,
-1.733974, 1.054732, 0.4126806, 1, 0.2705882, 0, 1,
-1.71722, 1.52479, -0.1357587, 1, 0.2745098, 0, 1,
-1.701844, 0.02922197, -0.467647, 1, 0.282353, 0, 1,
-1.677136, -1.856103, -1.992708, 1, 0.2862745, 0, 1,
-1.67025, -0.4408698, -0.8885033, 1, 0.2941177, 0, 1,
-1.660386, -0.7328727, -1.960675, 1, 0.3019608, 0, 1,
-1.651957, 0.002545307, -0.7572499, 1, 0.3058824, 0, 1,
-1.614912, 1.177033, -1.922338, 1, 0.3137255, 0, 1,
-1.607973, 0.3732224, -0.8441501, 1, 0.3176471, 0, 1,
-1.584821, -0.3831615, -2.153152, 1, 0.3254902, 0, 1,
-1.579926, -0.1255905, -0.7758118, 1, 0.3294118, 0, 1,
-1.57268, 2.232245, 0.5597661, 1, 0.3372549, 0, 1,
-1.566797, -0.08987735, -2.199639, 1, 0.3411765, 0, 1,
-1.535646, -0.9789814, -3.437077, 1, 0.3490196, 0, 1,
-1.523907, 0.6585109, -1.042037, 1, 0.3529412, 0, 1,
-1.52072, 0.6208914, -1.589986, 1, 0.3607843, 0, 1,
-1.519788, 0.6046742, -2.111166, 1, 0.3647059, 0, 1,
-1.49763, 1.242191, -1.71857, 1, 0.372549, 0, 1,
-1.495589, 1.356103, -0.253056, 1, 0.3764706, 0, 1,
-1.488422, -0.3459442, -2.528877, 1, 0.3843137, 0, 1,
-1.487922, -0.3682503, -3.571227, 1, 0.3882353, 0, 1,
-1.482171, 1.560509, 0.3633763, 1, 0.3960784, 0, 1,
-1.476115, 1.220348, -0.9751486, 1, 0.4039216, 0, 1,
-1.466356, 0.4786837, -1.349641, 1, 0.4078431, 0, 1,
-1.464993, -1.527094, -2.897817, 1, 0.4156863, 0, 1,
-1.456151, 0.8669471, -0.1229831, 1, 0.4196078, 0, 1,
-1.45327, -1.025889, -1.455637, 1, 0.427451, 0, 1,
-1.446436, -0.2551928, -1.973186, 1, 0.4313726, 0, 1,
-1.446075, -0.1292519, -1.713831, 1, 0.4392157, 0, 1,
-1.433969, -1.34154, -0.8191885, 1, 0.4431373, 0, 1,
-1.416122, -0.4920671, -2.632059, 1, 0.4509804, 0, 1,
-1.415402, 1.645018, -0.3667473, 1, 0.454902, 0, 1,
-1.412603, 0.3682788, -2.078822, 1, 0.4627451, 0, 1,
-1.408572, -0.1734138, 0.9066073, 1, 0.4666667, 0, 1,
-1.394757, 0.3753126, -2.842452, 1, 0.4745098, 0, 1,
-1.38477, -1.194056, -2.01189, 1, 0.4784314, 0, 1,
-1.383446, -1.067006, -2.84861, 1, 0.4862745, 0, 1,
-1.379239, 1.727379, 0.3565118, 1, 0.4901961, 0, 1,
-1.372627, -0.5677992, -1.339478, 1, 0.4980392, 0, 1,
-1.363854, -1.483218, -2.566461, 1, 0.5058824, 0, 1,
-1.353536, 0.9862848, -0.09526841, 1, 0.509804, 0, 1,
-1.348317, 1.844651, -1.639714, 1, 0.5176471, 0, 1,
-1.346879, -0.3196923, -3.739124, 1, 0.5215687, 0, 1,
-1.346117, 1.691218, -2.251205, 1, 0.5294118, 0, 1,
-1.328682, -0.2132825, -1.670476, 1, 0.5333334, 0, 1,
-1.32831, 0.03238907, -2.248464, 1, 0.5411765, 0, 1,
-1.32828, 0.1789141, -0.6375531, 1, 0.5450981, 0, 1,
-1.326468, 1.994742, 0.1309023, 1, 0.5529412, 0, 1,
-1.321366, 1.445129, 0.07033791, 1, 0.5568628, 0, 1,
-1.297435, -0.2917541, -1.380193, 1, 0.5647059, 0, 1,
-1.286801, -0.997278, -3.454502, 1, 0.5686275, 0, 1,
-1.284245, 0.391363, 1.403723, 1, 0.5764706, 0, 1,
-1.280168, 0.9444187, -1.177761, 1, 0.5803922, 0, 1,
-1.276881, -1.293793, -2.921965, 1, 0.5882353, 0, 1,
-1.275994, 1.588908, -0.3183669, 1, 0.5921569, 0, 1,
-1.27363, 1.430734, -0.3353298, 1, 0.6, 0, 1,
-1.266875, 0.5450634, -1.444593, 1, 0.6078432, 0, 1,
-1.252152, 0.9543496, 1.460394, 1, 0.6117647, 0, 1,
-1.24571, 0.3061998, 0.921766, 1, 0.6196079, 0, 1,
-1.239963, 0.7686567, -2.9265, 1, 0.6235294, 0, 1,
-1.231724, -0.6380081, -1.234225, 1, 0.6313726, 0, 1,
-1.227933, 0.2614389, -0.9096329, 1, 0.6352941, 0, 1,
-1.224913, 0.1799276, 0.7655285, 1, 0.6431373, 0, 1,
-1.222567, -1.205291, -2.764281, 1, 0.6470588, 0, 1,
-1.218296, -2.34644, -2.310192, 1, 0.654902, 0, 1,
-1.202215, -1.391797, -1.893111, 1, 0.6588235, 0, 1,
-1.202193, -0.6988788, -2.467949, 1, 0.6666667, 0, 1,
-1.193472, 0.4869437, -0.9387417, 1, 0.6705883, 0, 1,
-1.191908, -0.9481989, -1.604513, 1, 0.6784314, 0, 1,
-1.188477, 0.2562526, -2.508627, 1, 0.682353, 0, 1,
-1.188422, -1.674339, -2.6271, 1, 0.6901961, 0, 1,
-1.187451, -0.359289, -1.954642, 1, 0.6941177, 0, 1,
-1.187036, 0.8260904, -1.143472, 1, 0.7019608, 0, 1,
-1.179162, -1.864826, -3.227305, 1, 0.7098039, 0, 1,
-1.177446, 0.4530839, -2.374478, 1, 0.7137255, 0, 1,
-1.171759, -0.7148308, -2.010474, 1, 0.7215686, 0, 1,
-1.164402, 1.228246, 0.02704172, 1, 0.7254902, 0, 1,
-1.159109, 0.7210855, 0.007701036, 1, 0.7333333, 0, 1,
-1.157078, -1.907883, -2.624974, 1, 0.7372549, 0, 1,
-1.142949, -0.9941183, -2.592456, 1, 0.7450981, 0, 1,
-1.140552, 2.320803, -1.065827, 1, 0.7490196, 0, 1,
-1.135438, 1.623892, -0.5795166, 1, 0.7568628, 0, 1,
-1.12271, 1.992302, -1.547187, 1, 0.7607843, 0, 1,
-1.116128, -1.029901, -1.94328, 1, 0.7686275, 0, 1,
-1.113235, -0.2458105, -1.006166, 1, 0.772549, 0, 1,
-1.110612, 1.219359, -1.076557, 1, 0.7803922, 0, 1,
-1.106895, -0.3607905, -3.887168, 1, 0.7843137, 0, 1,
-1.105343, 1.151838, -1.218862, 1, 0.7921569, 0, 1,
-1.102936, 0.2349277, -1.206429, 1, 0.7960784, 0, 1,
-1.100212, -0.7758619, -0.7836847, 1, 0.8039216, 0, 1,
-1.097989, 0.9617066, -0.5699983, 1, 0.8117647, 0, 1,
-1.088936, 1.008755, 0.08439939, 1, 0.8156863, 0, 1,
-1.087908, -2.179919, -3.538105, 1, 0.8235294, 0, 1,
-1.082229, 0.8520744, -1.353917, 1, 0.827451, 0, 1,
-1.080912, 0.5101085, 0.7629895, 1, 0.8352941, 0, 1,
-1.077305, -1.848645, -4.974263, 1, 0.8392157, 0, 1,
-1.072891, 1.210817, -1.297278, 1, 0.8470588, 0, 1,
-1.072624, 0.6974095, -1.678976, 1, 0.8509804, 0, 1,
-1.069249, 0.7619427, -0.003347206, 1, 0.8588235, 0, 1,
-1.06892, -0.262721, -3.310554, 1, 0.8627451, 0, 1,
-1.064583, 0.02641215, -0.576264, 1, 0.8705882, 0, 1,
-1.061042, 0.887832, -0.8619745, 1, 0.8745098, 0, 1,
-1.056401, 0.4701585, -2.480101, 1, 0.8823529, 0, 1,
-1.055669, 1.258201, -0.887319, 1, 0.8862745, 0, 1,
-1.052207, 1.055807, -1.822449, 1, 0.8941177, 0, 1,
-1.05178, -1.505287, -2.923026, 1, 0.8980392, 0, 1,
-1.038915, 1.708538, 0.650607, 1, 0.9058824, 0, 1,
-1.036156, -0.2428139, -1.557734, 1, 0.9137255, 0, 1,
-1.02995, -0.7295213, -1.921562, 1, 0.9176471, 0, 1,
-1.029329, -0.03481295, -1.0831, 1, 0.9254902, 0, 1,
-1.028632, 0.04384284, 0.2999186, 1, 0.9294118, 0, 1,
-1.019971, -0.9386559, -2.724329, 1, 0.9372549, 0, 1,
-1.015755, 1.241636, -0.3716522, 1, 0.9411765, 0, 1,
-1.004539, -0.428515, -1.744354, 1, 0.9490196, 0, 1,
-1.001725, 0.9076118, -1.79319, 1, 0.9529412, 0, 1,
-0.9985456, 4.982752e-05, -0.9132774, 1, 0.9607843, 0, 1,
-0.9931167, 1.114834, 0.1412779, 1, 0.9647059, 0, 1,
-0.9929065, -0.7993549, -1.355143, 1, 0.972549, 0, 1,
-0.9792636, -0.3141088, -2.376837, 1, 0.9764706, 0, 1,
-0.9786289, -1.633898, -2.888101, 1, 0.9843137, 0, 1,
-0.9785283, 0.08168572, -0.948463, 1, 0.9882353, 0, 1,
-0.9607634, 0.1011487, 0.9740385, 1, 0.9960784, 0, 1,
-0.9572992, 1.3994, -0.9559972, 0.9960784, 1, 0, 1,
-0.9559477, 0.3977419, -0.8132389, 0.9921569, 1, 0, 1,
-0.9543661, 0.4657724, 0.3389196, 0.9843137, 1, 0, 1,
-0.9517083, -0.4126191, -1.451067, 0.9803922, 1, 0, 1,
-0.9506781, 0.2137227, -1.403608, 0.972549, 1, 0, 1,
-0.9504417, 1.759916, 0.7930726, 0.9686275, 1, 0, 1,
-0.9458544, 0.4761215, 0.05053909, 0.9607843, 1, 0, 1,
-0.939885, 0.6092598, 0.6932623, 0.9568627, 1, 0, 1,
-0.9395935, -0.197312, -2.643868, 0.9490196, 1, 0, 1,
-0.933853, 0.05447046, -2.576129, 0.945098, 1, 0, 1,
-0.9314677, -1.605989, -3.225764, 0.9372549, 1, 0, 1,
-0.9207192, 0.4718495, -1.90362, 0.9333333, 1, 0, 1,
-0.9126018, 2.418913, -0.3632942, 0.9254902, 1, 0, 1,
-0.9069444, 0.2275999, -1.22384, 0.9215686, 1, 0, 1,
-0.9024473, 0.4566062, -2.85583, 0.9137255, 1, 0, 1,
-0.8873906, 0.4940162, -1.250906, 0.9098039, 1, 0, 1,
-0.8871442, 1.019109, -0.3189027, 0.9019608, 1, 0, 1,
-0.8782053, 0.5193825, 0.839941, 0.8941177, 1, 0, 1,
-0.8778051, 2.103157, -0.7795535, 0.8901961, 1, 0, 1,
-0.8766861, 1.037421, -2.664563, 0.8823529, 1, 0, 1,
-0.8759421, 0.9182196, 0.62311, 0.8784314, 1, 0, 1,
-0.8753861, -0.201657, -2.160337, 0.8705882, 1, 0, 1,
-0.8746808, -0.008498939, -2.150672, 0.8666667, 1, 0, 1,
-0.8743489, -0.401592, -1.923102, 0.8588235, 1, 0, 1,
-0.8691963, -1.386645, -2.84174, 0.854902, 1, 0, 1,
-0.8496613, -0.7274596, -2.102391, 0.8470588, 1, 0, 1,
-0.84677, -1.530659, -1.989844, 0.8431373, 1, 0, 1,
-0.8467651, -1.126935, -2.225855, 0.8352941, 1, 0, 1,
-0.8430953, -0.1573599, -1.264512, 0.8313726, 1, 0, 1,
-0.842775, -0.6047989, -2.685148, 0.8235294, 1, 0, 1,
-0.8383247, 0.4635431, -0.5880592, 0.8196079, 1, 0, 1,
-0.8348363, -0.7703815, -3.512157, 0.8117647, 1, 0, 1,
-0.8274994, -1.150759, -0.7508304, 0.8078431, 1, 0, 1,
-0.8249979, 0.6452092, -1.98718, 0.8, 1, 0, 1,
-0.8247809, -2.642725, -2.709645, 0.7921569, 1, 0, 1,
-0.8235871, -1.546612, -2.940243, 0.7882353, 1, 0, 1,
-0.8204612, 1.656125, -1.791241, 0.7803922, 1, 0, 1,
-0.8197398, 0.3296234, 1.28637, 0.7764706, 1, 0, 1,
-0.8166759, -1.128009, -2.617754, 0.7686275, 1, 0, 1,
-0.8110747, 0.3741017, -2.266085, 0.7647059, 1, 0, 1,
-0.8049383, 0.05784696, -0.6648569, 0.7568628, 1, 0, 1,
-0.8048415, -1.56446, -2.476054, 0.7529412, 1, 0, 1,
-0.7979984, 0.1035131, -2.50486, 0.7450981, 1, 0, 1,
-0.7971843, -0.6262838, -2.547525, 0.7411765, 1, 0, 1,
-0.7923373, -1.342831, -2.856021, 0.7333333, 1, 0, 1,
-0.7865476, 0.7325814, 1.134214, 0.7294118, 1, 0, 1,
-0.7863238, -1.248644, -1.944055, 0.7215686, 1, 0, 1,
-0.7819864, -0.1014774, -1.346884, 0.7176471, 1, 0, 1,
-0.7800847, 0.2306082, -0.7465421, 0.7098039, 1, 0, 1,
-0.7772626, 0.5481419, -1.312162, 0.7058824, 1, 0, 1,
-0.7745312, 2.49407, -0.000263404, 0.6980392, 1, 0, 1,
-0.7744532, -0.7210221, -0.9979595, 0.6901961, 1, 0, 1,
-0.7713721, 1.43558, -0.7338329, 0.6862745, 1, 0, 1,
-0.7692189, 1.076944, 0.4897489, 0.6784314, 1, 0, 1,
-0.7564504, -1.505816, -2.803939, 0.6745098, 1, 0, 1,
-0.7554642, 0.8170632, -0.4838341, 0.6666667, 1, 0, 1,
-0.7483848, -0.9142736, -1.925664, 0.6627451, 1, 0, 1,
-0.7398711, 0.7654104, -0.2098868, 0.654902, 1, 0, 1,
-0.7396633, -0.6758536, -0.3126506, 0.6509804, 1, 0, 1,
-0.7285989, 0.2945228, -0.4822733, 0.6431373, 1, 0, 1,
-0.7281926, 1.052375, 1.407155, 0.6392157, 1, 0, 1,
-0.7233858, 0.01970483, -0.5274954, 0.6313726, 1, 0, 1,
-0.7207034, -0.9302601, -2.537801, 0.627451, 1, 0, 1,
-0.7111415, -0.3681267, -0.6970174, 0.6196079, 1, 0, 1,
-0.7087734, -0.5155313, -1.373498, 0.6156863, 1, 0, 1,
-0.7084049, -1.004346, -2.621538, 0.6078432, 1, 0, 1,
-0.7038496, -1.076026, -3.272643, 0.6039216, 1, 0, 1,
-0.7036682, 1.861633, 0.768261, 0.5960785, 1, 0, 1,
-0.7019739, 1.850039, -0.5438434, 0.5882353, 1, 0, 1,
-0.7017869, 0.2724869, -1.8179, 0.5843138, 1, 0, 1,
-0.7013777, -0.1304492, -4.131228, 0.5764706, 1, 0, 1,
-0.7009401, -0.8940616, -3.566043, 0.572549, 1, 0, 1,
-0.6951903, -0.4311221, -2.073425, 0.5647059, 1, 0, 1,
-0.6945976, 0.2475991, -0.9883983, 0.5607843, 1, 0, 1,
-0.6847849, -0.290344, 0.02619711, 0.5529412, 1, 0, 1,
-0.6834099, 1.185352, -1.910161, 0.5490196, 1, 0, 1,
-0.6812612, 0.611311, -1.627638, 0.5411765, 1, 0, 1,
-0.6789626, -0.3877502, -2.026427, 0.5372549, 1, 0, 1,
-0.6768315, 0.6092118, -0.3559465, 0.5294118, 1, 0, 1,
-0.6763235, -0.8702829, -3.399305, 0.5254902, 1, 0, 1,
-0.6738507, 1.59705, -1.051872, 0.5176471, 1, 0, 1,
-0.6692566, -0.5730352, -1.75905, 0.5137255, 1, 0, 1,
-0.6684675, -0.0005632535, -1.782417, 0.5058824, 1, 0, 1,
-0.6633061, 1.042299, 0.2966453, 0.5019608, 1, 0, 1,
-0.6583567, 0.5666131, -1.645549, 0.4941176, 1, 0, 1,
-0.6579565, 0.3591502, -0.9991921, 0.4862745, 1, 0, 1,
-0.6544896, 0.3269639, -2.338392, 0.4823529, 1, 0, 1,
-0.6525046, -0.1367784, -1.360678, 0.4745098, 1, 0, 1,
-0.6481721, 0.6952327, -0.1244161, 0.4705882, 1, 0, 1,
-0.6475167, -1.499989, -4.098281, 0.4627451, 1, 0, 1,
-0.6439531, -0.795952, -3.143348, 0.4588235, 1, 0, 1,
-0.6422631, 1.484902, -0.9232669, 0.4509804, 1, 0, 1,
-0.6410107, 1.080547, 0.1418877, 0.4470588, 1, 0, 1,
-0.6380851, 1.189794, -0.115063, 0.4392157, 1, 0, 1,
-0.6361471, -0.7133067, -1.844359, 0.4352941, 1, 0, 1,
-0.6357606, 1.055328, -1.226574, 0.427451, 1, 0, 1,
-0.6294419, -1.003213, -1.657766, 0.4235294, 1, 0, 1,
-0.6231379, 1.3994, -0.297787, 0.4156863, 1, 0, 1,
-0.6223122, -0.3192247, -1.858784, 0.4117647, 1, 0, 1,
-0.6216258, -0.5737518, -2.567309, 0.4039216, 1, 0, 1,
-0.6201546, 0.879056, -0.9552277, 0.3960784, 1, 0, 1,
-0.6179172, -0.7165253, -3.79816, 0.3921569, 1, 0, 1,
-0.6143708, -1.530993, -2.780526, 0.3843137, 1, 0, 1,
-0.6135098, 0.2955207, -0.5474295, 0.3803922, 1, 0, 1,
-0.6083491, 0.6873479, 1.725774, 0.372549, 1, 0, 1,
-0.6071602, -0.3961363, -2.623422, 0.3686275, 1, 0, 1,
-0.6043404, 0.2027611, 0.395347, 0.3607843, 1, 0, 1,
-0.6022654, 0.2780128, -0.5002558, 0.3568628, 1, 0, 1,
-0.5975179, 1.586914, 0.226492, 0.3490196, 1, 0, 1,
-0.5953413, 0.3548084, -0.08275979, 0.345098, 1, 0, 1,
-0.5929911, -1.107298, -1.871401, 0.3372549, 1, 0, 1,
-0.5907965, -2.608496, -2.377899, 0.3333333, 1, 0, 1,
-0.5906795, 0.4015468, -0.788958, 0.3254902, 1, 0, 1,
-0.5895802, -0.7999845, -4.277659, 0.3215686, 1, 0, 1,
-0.5876787, -1.02563, -2.220599, 0.3137255, 1, 0, 1,
-0.5853359, 0.723521, -0.5587536, 0.3098039, 1, 0, 1,
-0.5797135, -1.113143, -0.8195618, 0.3019608, 1, 0, 1,
-0.5785294, 0.6814183, -1.581296, 0.2941177, 1, 0, 1,
-0.5774999, -0.8900163, -1.746882, 0.2901961, 1, 0, 1,
-0.5715411, -0.3552593, -2.814451, 0.282353, 1, 0, 1,
-0.5687942, -0.02468567, -1.270954, 0.2784314, 1, 0, 1,
-0.5687717, -0.2287624, -1.983082, 0.2705882, 1, 0, 1,
-0.5683985, -0.6223616, -3.007775, 0.2666667, 1, 0, 1,
-0.5664614, 1.800164, -1.684991, 0.2588235, 1, 0, 1,
-0.566192, 0.5129437, -0.3597355, 0.254902, 1, 0, 1,
-0.5636759, -0.7139173, -3.86019, 0.2470588, 1, 0, 1,
-0.5555041, 0.07502968, -2.210571, 0.2431373, 1, 0, 1,
-0.5483428, -0.001853839, -1.586931, 0.2352941, 1, 0, 1,
-0.545819, 0.8268465, -1.202992, 0.2313726, 1, 0, 1,
-0.5457579, 0.608345, 0.1833571, 0.2235294, 1, 0, 1,
-0.5442787, 0.6389789, -0.9972909, 0.2196078, 1, 0, 1,
-0.5437337, 0.2187971, -1.292009, 0.2117647, 1, 0, 1,
-0.5358976, 1.011054, -2.38061, 0.2078431, 1, 0, 1,
-0.5325105, -1.159228, -3.16237, 0.2, 1, 0, 1,
-0.5319576, 0.5509852, -1.221779, 0.1921569, 1, 0, 1,
-0.5276361, -1.382411, -3.973513, 0.1882353, 1, 0, 1,
-0.5144861, -0.5022571, -2.592044, 0.1803922, 1, 0, 1,
-0.5142906, 0.2352563, -1.578042, 0.1764706, 1, 0, 1,
-0.5113649, -0.6035509, -1.66477, 0.1686275, 1, 0, 1,
-0.5047981, -1.326306, -3.142957, 0.1647059, 1, 0, 1,
-0.5015401, -0.4859147, -1.281646, 0.1568628, 1, 0, 1,
-0.4983403, -0.6277176, -1.330922, 0.1529412, 1, 0, 1,
-0.4959173, -1.315276, -3.114241, 0.145098, 1, 0, 1,
-0.494889, -0.7235749, -2.893954, 0.1411765, 1, 0, 1,
-0.4944794, 0.4887935, -2.090384, 0.1333333, 1, 0, 1,
-0.4901013, -0.4065964, -2.374042, 0.1294118, 1, 0, 1,
-0.4858418, -0.3148113, -2.568761, 0.1215686, 1, 0, 1,
-0.4795553, 0.426663, 0.770909, 0.1176471, 1, 0, 1,
-0.4787314, -0.1615122, -1.668091, 0.1098039, 1, 0, 1,
-0.4770299, 0.1712573, -0.2527834, 0.1058824, 1, 0, 1,
-0.4725292, -0.1140044, -0.9029916, 0.09803922, 1, 0, 1,
-0.4721669, 1.01205, 0.01912635, 0.09019608, 1, 0, 1,
-0.4679585, 0.1451471, -1.772421, 0.08627451, 1, 0, 1,
-0.4671636, 1.847822, -0.9563747, 0.07843138, 1, 0, 1,
-0.4620703, 0.8016118, 0.5150553, 0.07450981, 1, 0, 1,
-0.4619689, 1.213298, -0.0007848895, 0.06666667, 1, 0, 1,
-0.4562374, -1.071418, -2.652721, 0.0627451, 1, 0, 1,
-0.4560491, -0.8489874, -2.994337, 0.05490196, 1, 0, 1,
-0.4558644, 1.207822, -0.8665749, 0.05098039, 1, 0, 1,
-0.4545738, 1.240305, 0.3706309, 0.04313726, 1, 0, 1,
-0.454154, 1.392286, -0.6335987, 0.03921569, 1, 0, 1,
-0.4536551, 2.04252, -0.2925077, 0.03137255, 1, 0, 1,
-0.4501517, 0.1706655, -0.2243852, 0.02745098, 1, 0, 1,
-0.4492814, -0.5339368, -1.970773, 0.01960784, 1, 0, 1,
-0.4492216, -1.820147, -4.430293, 0.01568628, 1, 0, 1,
-0.4470677, 0.8281128, -1.192764, 0.007843138, 1, 0, 1,
-0.4441375, 0.3947452, -0.4027332, 0.003921569, 1, 0, 1,
-0.4388455, 1.663729, 0.3527327, 0, 1, 0.003921569, 1,
-0.4363987, -1.042113, -4.150126, 0, 1, 0.01176471, 1,
-0.4322717, 2.124832, -0.5054684, 0, 1, 0.01568628, 1,
-0.4321391, 0.2428504, -1.385358, 0, 1, 0.02352941, 1,
-0.4318208, 0.3565317, -1.584405, 0, 1, 0.02745098, 1,
-0.4310465, 1.030813, -0.365128, 0, 1, 0.03529412, 1,
-0.4293797, 0.4544222, -1.055467, 0, 1, 0.03921569, 1,
-0.4291993, -0.02526276, -0.8262756, 0, 1, 0.04705882, 1,
-0.4290918, 0.5389875, -0.7267695, 0, 1, 0.05098039, 1,
-0.4261405, 0.4567507, -1.071612, 0, 1, 0.05882353, 1,
-0.4248138, 0.6454507, -1.316117, 0, 1, 0.0627451, 1,
-0.4172442, -0.8374021, -3.787605, 0, 1, 0.07058824, 1,
-0.4170496, -0.865616, -1.615434, 0, 1, 0.07450981, 1,
-0.41679, 1.229154, -1.118994, 0, 1, 0.08235294, 1,
-0.4144053, 1.446457, 0.1210388, 0, 1, 0.08627451, 1,
-0.4122943, -0.005236446, -0.5732998, 0, 1, 0.09411765, 1,
-0.4122938, -1.683863, -1.303891, 0, 1, 0.1019608, 1,
-0.4071491, -1.951898, -2.358799, 0, 1, 0.1058824, 1,
-0.4053654, 0.1004103, -0.1004418, 0, 1, 0.1137255, 1,
-0.4047786, -0.8796471, -2.130132, 0, 1, 0.1176471, 1,
-0.4036632, 0.3089842, -0.9258774, 0, 1, 0.1254902, 1,
-0.4002157, 1.969816, 0.4392352, 0, 1, 0.1294118, 1,
-0.3927517, 0.5311723, 0.691488, 0, 1, 0.1372549, 1,
-0.3862681, 1.111948, -1.116429, 0, 1, 0.1411765, 1,
-0.3832703, -0.3174804, -0.9594756, 0, 1, 0.1490196, 1,
-0.3831421, -0.2979912, -2.328099, 0, 1, 0.1529412, 1,
-0.378086, 0.4570265, -1.656205, 0, 1, 0.1607843, 1,
-0.3772787, 0.7892115, 0.6246014, 0, 1, 0.1647059, 1,
-0.3730445, 1.642237, -0.4439644, 0, 1, 0.172549, 1,
-0.3699391, -1.385899, -2.066804, 0, 1, 0.1764706, 1,
-0.366593, -0.5349824, -3.64875, 0, 1, 0.1843137, 1,
-0.3646692, 1.24532, 1.314519, 0, 1, 0.1882353, 1,
-0.3633448, -0.6268417, -1.914591, 0, 1, 0.1960784, 1,
-0.3572657, 0.6087537, -1.035893, 0, 1, 0.2039216, 1,
-0.3569407, 0.4498373, -1.518913, 0, 1, 0.2078431, 1,
-0.354956, -0.4177367, -2.046468, 0, 1, 0.2156863, 1,
-0.3544584, 1.200492, 0.9362084, 0, 1, 0.2196078, 1,
-0.3538416, -0.4723408, -2.138713, 0, 1, 0.227451, 1,
-0.3523873, -0.2196808, -0.9985268, 0, 1, 0.2313726, 1,
-0.3496334, 0.7937896, -0.3567164, 0, 1, 0.2392157, 1,
-0.3411487, -0.1591852, -1.502522, 0, 1, 0.2431373, 1,
-0.3407745, 1.104293, -0.1899262, 0, 1, 0.2509804, 1,
-0.3380139, -0.1025167, -2.798773, 0, 1, 0.254902, 1,
-0.3359358, 0.282115, 0.09358359, 0, 1, 0.2627451, 1,
-0.3348185, -0.9100116, -2.56372, 0, 1, 0.2666667, 1,
-0.331538, 1.304784, -1.191649, 0, 1, 0.2745098, 1,
-0.3313392, 0.8277147, 0.1485926, 0, 1, 0.2784314, 1,
-0.3312388, 0.6988021, -1.318401, 0, 1, 0.2862745, 1,
-0.3278738, 0.3280152, -0.5660075, 0, 1, 0.2901961, 1,
-0.3225192, 0.5394795, -1.910122, 0, 1, 0.2980392, 1,
-0.3168676, 1.295135, 0.8312395, 0, 1, 0.3058824, 1,
-0.3165377, 0.5833442, -0.9523436, 0, 1, 0.3098039, 1,
-0.3144229, -2.253247, -2.441856, 0, 1, 0.3176471, 1,
-0.3124322, 0.7825454, -0.3159098, 0, 1, 0.3215686, 1,
-0.3084898, 0.1447202, -0.8853853, 0, 1, 0.3294118, 1,
-0.3064762, 0.1195131, -2.403937, 0, 1, 0.3333333, 1,
-0.306114, -1.658876, -4.223085, 0, 1, 0.3411765, 1,
-0.2913694, 0.504665, -0.6620227, 0, 1, 0.345098, 1,
-0.2905095, 0.7074211, -0.2379515, 0, 1, 0.3529412, 1,
-0.2899403, -1.9136, -3.017343, 0, 1, 0.3568628, 1,
-0.2897064, -1.589165, -4.157908, 0, 1, 0.3647059, 1,
-0.2888663, 0.7240858, 0.3844168, 0, 1, 0.3686275, 1,
-0.2876872, 0.0988335, -1.380269, 0, 1, 0.3764706, 1,
-0.2854392, -0.4659599, -2.171725, 0, 1, 0.3803922, 1,
-0.2836846, 1.630852, 0.05270566, 0, 1, 0.3882353, 1,
-0.2831985, 0.1736678, -0.9600511, 0, 1, 0.3921569, 1,
-0.2831733, 1.267833, 1.302757, 0, 1, 0.4, 1,
-0.2735257, -0.6760588, -3.161207, 0, 1, 0.4078431, 1,
-0.2711954, -1.462815, -3.69456, 0, 1, 0.4117647, 1,
-0.2683438, -0.4484028, -2.981872, 0, 1, 0.4196078, 1,
-0.2680502, 1.403578, -1.272224, 0, 1, 0.4235294, 1,
-0.2662755, -2.802071, -2.975214, 0, 1, 0.4313726, 1,
-0.2658214, -0.5537008, -2.989671, 0, 1, 0.4352941, 1,
-0.2634568, 2.291643, -0.2333125, 0, 1, 0.4431373, 1,
-0.2599743, 0.2142901, 0.01312534, 0, 1, 0.4470588, 1,
-0.2596779, -0.8633138, -2.324185, 0, 1, 0.454902, 1,
-0.2564508, 0.873015, -0.3305596, 0, 1, 0.4588235, 1,
-0.2550624, 0.5255852, 0.6526114, 0, 1, 0.4666667, 1,
-0.2529074, 0.07020175, -1.440113, 0, 1, 0.4705882, 1,
-0.2527025, 1.077169, -0.7392301, 0, 1, 0.4784314, 1,
-0.2511379, -0.7679902, -2.603912, 0, 1, 0.4823529, 1,
-0.2491557, -0.5099429, -1.909152, 0, 1, 0.4901961, 1,
-0.2469224, 0.4321693, 0.6204292, 0, 1, 0.4941176, 1,
-0.2429027, 1.321068, -0.06455249, 0, 1, 0.5019608, 1,
-0.2388592, -1.258655, -2.832733, 0, 1, 0.509804, 1,
-0.2387473, 0.9068801, 0.1171986, 0, 1, 0.5137255, 1,
-0.2336361, -0.6588344, -2.331101, 0, 1, 0.5215687, 1,
-0.2301068, 1.116079, 1.181439, 0, 1, 0.5254902, 1,
-0.2298648, -0.2658222, -1.567605, 0, 1, 0.5333334, 1,
-0.2285746, 0.6702119, -0.5523669, 0, 1, 0.5372549, 1,
-0.2222036, 0.4507747, -0.7920856, 0, 1, 0.5450981, 1,
-0.2212273, -0.5872107, -2.813741, 0, 1, 0.5490196, 1,
-0.2203468, -0.5182176, -3.997376, 0, 1, 0.5568628, 1,
-0.2195102, -0.9236197, -3.027059, 0, 1, 0.5607843, 1,
-0.218884, -0.176247, -1.730849, 0, 1, 0.5686275, 1,
-0.216027, -0.1882457, -2.796257, 0, 1, 0.572549, 1,
-0.215194, -1.395054, -2.876722, 0, 1, 0.5803922, 1,
-0.2139238, 1.527877, -0.661308, 0, 1, 0.5843138, 1,
-0.2127844, 0.6934438, 0.1437087, 0, 1, 0.5921569, 1,
-0.2123827, -0.1881988, -3.089208, 0, 1, 0.5960785, 1,
-0.2112974, 0.8103529, 1.937338, 0, 1, 0.6039216, 1,
-0.2101603, -0.7270969, -2.934854, 0, 1, 0.6117647, 1,
-0.2098299, -1.352243, -3.292166, 0, 1, 0.6156863, 1,
-0.1966964, 0.7202768, 0.5218086, 0, 1, 0.6235294, 1,
-0.1923015, -0.4459738, -3.433587, 0, 1, 0.627451, 1,
-0.1920644, 1.245369, 0.4440389, 0, 1, 0.6352941, 1,
-0.1867363, -0.8449058, -5.190199, 0, 1, 0.6392157, 1,
-0.1862554, -0.2343414, -3.397901, 0, 1, 0.6470588, 1,
-0.1789689, -0.3577076, -3.417949, 0, 1, 0.6509804, 1,
-0.1710911, 0.506763, -1.216814, 0, 1, 0.6588235, 1,
-0.1702167, 1.734553, -0.03277862, 0, 1, 0.6627451, 1,
-0.1649412, 0.5259852, -1.573021, 0, 1, 0.6705883, 1,
-0.163197, -0.2507649, -4.336647, 0, 1, 0.6745098, 1,
-0.1551448, 1.757238, -0.6107727, 0, 1, 0.682353, 1,
-0.1545627, 0.7915578, -0.5011835, 0, 1, 0.6862745, 1,
-0.1519598, -0.3137718, -1.750458, 0, 1, 0.6941177, 1,
-0.1504114, 1.790894, 0.03421107, 0, 1, 0.7019608, 1,
-0.1496553, -1.01078, -1.504192, 0, 1, 0.7058824, 1,
-0.1495646, 0.4611292, -1.965901, 0, 1, 0.7137255, 1,
-0.144826, 0.2990011, -0.6057181, 0, 1, 0.7176471, 1,
-0.1436592, 1.600088, -0.3205411, 0, 1, 0.7254902, 1,
-0.142696, -1.175821, -4.213063, 0, 1, 0.7294118, 1,
-0.1421668, 1.279209, 0.2950096, 0, 1, 0.7372549, 1,
-0.1393963, -0.4502979, -1.982456, 0, 1, 0.7411765, 1,
-0.1381967, 0.1582752, -2.371095, 0, 1, 0.7490196, 1,
-0.1347958, -0.3460906, -1.672084, 0, 1, 0.7529412, 1,
-0.1325924, 0.1868198, -1.063414, 0, 1, 0.7607843, 1,
-0.1318494, -3.006904, -3.698838, 0, 1, 0.7647059, 1,
-0.1282226, 1.138046, -1.424599, 0, 1, 0.772549, 1,
-0.1278125, -1.459724, -3.728013, 0, 1, 0.7764706, 1,
-0.1236515, 0.3835919, 0.4454068, 0, 1, 0.7843137, 1,
-0.1231968, -1.539367, -0.823311, 0, 1, 0.7882353, 1,
-0.1229033, 0.2201883, -1.112692, 0, 1, 0.7960784, 1,
-0.1181929, -0.01459751, -3.367589, 0, 1, 0.8039216, 1,
-0.1135426, -0.6517038, -4.628982, 0, 1, 0.8078431, 1,
-0.1123045, 0.2051418, -0.2359448, 0, 1, 0.8156863, 1,
-0.11169, -0.3949731, -3.095185, 0, 1, 0.8196079, 1,
-0.1099532, 0.54255, -0.4968289, 0, 1, 0.827451, 1,
-0.1055536, 0.6680883, -0.7096697, 0, 1, 0.8313726, 1,
-0.1031682, -0.1433573, -5.062846, 0, 1, 0.8392157, 1,
-0.1023786, 1.241244, 0.03652041, 0, 1, 0.8431373, 1,
-0.09684828, 0.4389572, 1.44374, 0, 1, 0.8509804, 1,
-0.09093475, 0.113383, -1.38072, 0, 1, 0.854902, 1,
-0.08954584, -0.2488945, -2.586984, 0, 1, 0.8627451, 1,
-0.08542611, 0.1072953, -2.518907, 0, 1, 0.8666667, 1,
-0.08346048, -0.1360205, -1.978088, 0, 1, 0.8745098, 1,
-0.08074345, 0.06771719, -1.651796, 0, 1, 0.8784314, 1,
-0.07956127, 1.155433, 0.5234537, 0, 1, 0.8862745, 1,
-0.07500761, -0.1397818, -5.225793, 0, 1, 0.8901961, 1,
-0.07014392, 0.6182941, -0.6619905, 0, 1, 0.8980392, 1,
-0.06444067, 0.676389, -1.515303, 0, 1, 0.9058824, 1,
-0.06436811, 0.00980198, -2.721375, 0, 1, 0.9098039, 1,
-0.03250762, 0.9873302, -1.01009, 0, 1, 0.9176471, 1,
-0.03064137, 0.5777784, -1.415756, 0, 1, 0.9215686, 1,
-0.02861577, -0.2616451, -2.032467, 0, 1, 0.9294118, 1,
-0.02819956, 0.03004533, -1.21324, 0, 1, 0.9333333, 1,
-0.02439379, 0.3242252, -0.5139503, 0, 1, 0.9411765, 1,
-0.02324031, 0.5392887, -0.5229207, 0, 1, 0.945098, 1,
-0.02316424, 0.8118101, -0.8464155, 0, 1, 0.9529412, 1,
-0.0225745, 1.498986, -0.193518, 0, 1, 0.9568627, 1,
-0.02210933, 0.9294445, 0.03385302, 0, 1, 0.9647059, 1,
-0.02072727, 1.257767, 0.4094115, 0, 1, 0.9686275, 1,
-0.01777038, 0.7530096, -1.569449, 0, 1, 0.9764706, 1,
-0.01655997, -1.828527, -2.994806, 0, 1, 0.9803922, 1,
-0.002410775, 1.984007, 0.4225056, 0, 1, 0.9882353, 1,
-0.002138629, -1.085772, -3.090313, 0, 1, 0.9921569, 1,
0.0003811656, 2.151532, 1.289302, 0, 1, 1, 1,
0.001151892, -0.6237054, 3.524466, 0, 0.9921569, 1, 1,
0.005085156, -0.388769, 3.615805, 0, 0.9882353, 1, 1,
0.005875268, -1.373749, 3.696148, 0, 0.9803922, 1, 1,
0.006117914, -1.544077, 5.10146, 0, 0.9764706, 1, 1,
0.006248605, 0.4041483, -0.02700955, 0, 0.9686275, 1, 1,
0.00688331, -0.4640695, 3.638092, 0, 0.9647059, 1, 1,
0.008386921, -0.3285313, 4.039057, 0, 0.9568627, 1, 1,
0.01292435, -1.186977, 4.385664, 0, 0.9529412, 1, 1,
0.01380336, -1.497483, 2.186786, 0, 0.945098, 1, 1,
0.01472809, -0.6741805, 3.038005, 0, 0.9411765, 1, 1,
0.01847342, -1.250992, 4.108901, 0, 0.9333333, 1, 1,
0.02161583, 1.360708, -0.01507499, 0, 0.9294118, 1, 1,
0.02342866, 0.02623815, -0.0118935, 0, 0.9215686, 1, 1,
0.02502569, 0.8390759, 0.8977935, 0, 0.9176471, 1, 1,
0.02798597, 1.095647, -0.582819, 0, 0.9098039, 1, 1,
0.02924498, 0.5464152, 0.2254681, 0, 0.9058824, 1, 1,
0.035639, -0.6999575, 2.924453, 0, 0.8980392, 1, 1,
0.03901213, -1.552711, 2.036025, 0, 0.8901961, 1, 1,
0.04173275, 0.4481996, 0.1784776, 0, 0.8862745, 1, 1,
0.04499713, 0.6928037, 0.1152056, 0, 0.8784314, 1, 1,
0.04636949, 0.3863357, -0.3015894, 0, 0.8745098, 1, 1,
0.04757744, -0.8578213, 2.0777, 0, 0.8666667, 1, 1,
0.0475874, -1.388768, 4.560266, 0, 0.8627451, 1, 1,
0.05208186, -0.3197828, 3.085901, 0, 0.854902, 1, 1,
0.0525541, -0.2054163, 2.604843, 0, 0.8509804, 1, 1,
0.05325142, -1.202034, 2.087232, 0, 0.8431373, 1, 1,
0.05454819, 0.04508999, -0.2045134, 0, 0.8392157, 1, 1,
0.05471179, 0.7495233, 0.2961524, 0, 0.8313726, 1, 1,
0.0607334, 0.9776247, 0.2866054, 0, 0.827451, 1, 1,
0.06458424, 0.9928932, -0.7544274, 0, 0.8196079, 1, 1,
0.06882035, -0.3952322, 3.176419, 0, 0.8156863, 1, 1,
0.06911545, -0.5913403, 3.667096, 0, 0.8078431, 1, 1,
0.07909273, 0.1391294, 1.142408, 0, 0.8039216, 1, 1,
0.07957765, -0.5490239, 3.813114, 0, 0.7960784, 1, 1,
0.08077508, -0.8075247, 2.719234, 0, 0.7882353, 1, 1,
0.08772542, -1.320721, 1.229312, 0, 0.7843137, 1, 1,
0.09153742, -0.06462621, 1.861164, 0, 0.7764706, 1, 1,
0.09194103, 1.426261, 1.956206, 0, 0.772549, 1, 1,
0.09564199, 0.03407303, 1.124135, 0, 0.7647059, 1, 1,
0.09956779, 0.6510074, -0.7381967, 0, 0.7607843, 1, 1,
0.1024553, 1.740534, 0.894011, 0, 0.7529412, 1, 1,
0.1024709, -0.1253007, 2.019857, 0, 0.7490196, 1, 1,
0.1031423, 1.423844, 1.147658, 0, 0.7411765, 1, 1,
0.1048647, 1.461506, 1.10379, 0, 0.7372549, 1, 1,
0.1064321, -1.637476, 1.298069, 0, 0.7294118, 1, 1,
0.106939, -0.02668939, 1.355295, 0, 0.7254902, 1, 1,
0.1096081, -0.4256801, 2.078415, 0, 0.7176471, 1, 1,
0.109783, -0.2735776, 2.386266, 0, 0.7137255, 1, 1,
0.1105424, 0.5590461, 1.191689, 0, 0.7058824, 1, 1,
0.1128057, -0.4774888, 3.679805, 0, 0.6980392, 1, 1,
0.1198618, -0.4600996, 3.35907, 0, 0.6941177, 1, 1,
0.1201287, 0.3383243, 1.617236, 0, 0.6862745, 1, 1,
0.1204221, -0.09915421, 0.9119865, 0, 0.682353, 1, 1,
0.1223636, 1.218696, -0.5318703, 0, 0.6745098, 1, 1,
0.1241204, 0.5182215, 1.841754, 0, 0.6705883, 1, 1,
0.128349, -1.201985, 2.633711, 0, 0.6627451, 1, 1,
0.1301835, -0.2258775, 3.233593, 0, 0.6588235, 1, 1,
0.1307157, -0.8930635, 4.415749, 0, 0.6509804, 1, 1,
0.1329731, 0.8067928, 0.00721922, 0, 0.6470588, 1, 1,
0.1331639, 0.02754336, 1.116318, 0, 0.6392157, 1, 1,
0.1408375, 0.9100226, -0.9889094, 0, 0.6352941, 1, 1,
0.1417319, -0.1235251, 2.064457, 0, 0.627451, 1, 1,
0.1423886, 2.200513, 1.024827, 0, 0.6235294, 1, 1,
0.1428805, 0.3175729, 0.574275, 0, 0.6156863, 1, 1,
0.1432687, -0.08211204, 1.868262, 0, 0.6117647, 1, 1,
0.145264, -0.4538513, 2.31443, 0, 0.6039216, 1, 1,
0.1459246, -0.257841, 2.898615, 0, 0.5960785, 1, 1,
0.146897, 0.7466569, -0.05273656, 0, 0.5921569, 1, 1,
0.148085, 0.6545548, 0.3111247, 0, 0.5843138, 1, 1,
0.1485138, 0.9984972, 0.2496046, 0, 0.5803922, 1, 1,
0.1513005, -0.5828875, 4.051792, 0, 0.572549, 1, 1,
0.1531554, 1.393209, 0.07720215, 0, 0.5686275, 1, 1,
0.157082, -0.09713449, 1.707465, 0, 0.5607843, 1, 1,
0.1623251, 0.04474001, 0.7788168, 0, 0.5568628, 1, 1,
0.1637407, -0.9434198, 1.760314, 0, 0.5490196, 1, 1,
0.1651244, 0.5729811, -0.2416685, 0, 0.5450981, 1, 1,
0.1652733, -1.510904, 3.225022, 0, 0.5372549, 1, 1,
0.1657072, -0.0643459, 1.865981, 0, 0.5333334, 1, 1,
0.1728467, 0.5677654, -0.07344236, 0, 0.5254902, 1, 1,
0.1736742, -1.235661, 2.791267, 0, 0.5215687, 1, 1,
0.1744046, 0.4867208, 0.2551013, 0, 0.5137255, 1, 1,
0.1867081, 1.968367, -0.1068644, 0, 0.509804, 1, 1,
0.1876982, 0.2146515, 1.32766, 0, 0.5019608, 1, 1,
0.1938791, -0.3306008, 2.272738, 0, 0.4941176, 1, 1,
0.2002461, -0.08298752, 1.939955, 0, 0.4901961, 1, 1,
0.2008574, 0.256869, 2.508776, 0, 0.4823529, 1, 1,
0.2014719, -1.312615, 3.673609, 0, 0.4784314, 1, 1,
0.2042699, -0.2252849, 2.683832, 0, 0.4705882, 1, 1,
0.2066168, -0.9304645, 4.522658, 0, 0.4666667, 1, 1,
0.2068434, -0.5645495, 2.930226, 0, 0.4588235, 1, 1,
0.2076629, -0.4245118, 2.152175, 0, 0.454902, 1, 1,
0.2089299, -1.037303, 4.562922, 0, 0.4470588, 1, 1,
0.2090212, 1.110014, 0.05328897, 0, 0.4431373, 1, 1,
0.2111207, -0.5516147, 1.809996, 0, 0.4352941, 1, 1,
0.211589, -0.004384056, 2.779804, 0, 0.4313726, 1, 1,
0.2166193, -1.763015, 2.866586, 0, 0.4235294, 1, 1,
0.2167686, -1.943255, 4.724555, 0, 0.4196078, 1, 1,
0.2241261, -1.719065, 2.784347, 0, 0.4117647, 1, 1,
0.2245594, -0.005906874, 3.40711, 0, 0.4078431, 1, 1,
0.2317981, 0.3160317, 2.331073, 0, 0.4, 1, 1,
0.2326844, 0.3211781, 0.3168114, 0, 0.3921569, 1, 1,
0.2350011, 0.8856563, 1.160589, 0, 0.3882353, 1, 1,
0.23851, -0.07432093, 0.9862998, 0, 0.3803922, 1, 1,
0.240675, 2.047853, -0.4676926, 0, 0.3764706, 1, 1,
0.2450646, -0.3256731, 2.122532, 0, 0.3686275, 1, 1,
0.2507087, -1.495854, 2.690225, 0, 0.3647059, 1, 1,
0.2583575, -1.792994, 0.9094823, 0, 0.3568628, 1, 1,
0.2589897, 1.069171, 0.8260443, 0, 0.3529412, 1, 1,
0.2594057, 0.2472686, 0.3102199, 0, 0.345098, 1, 1,
0.2655796, -0.5950924, 3.217438, 0, 0.3411765, 1, 1,
0.2724327, -1.049264, 2.08942, 0, 0.3333333, 1, 1,
0.273302, 0.1276666, -0.387621, 0, 0.3294118, 1, 1,
0.2757243, 0.5128232, -1.081675, 0, 0.3215686, 1, 1,
0.2758583, 2.200709, -0.2593801, 0, 0.3176471, 1, 1,
0.2763548, 0.1761716, 2.042324, 0, 0.3098039, 1, 1,
0.2793854, -0.4166767, 3.279697, 0, 0.3058824, 1, 1,
0.2799859, 0.4394353, 0.7521901, 0, 0.2980392, 1, 1,
0.2820326, 0.5786923, 0.5301375, 0, 0.2901961, 1, 1,
0.2822431, 0.03551852, 1.659385, 0, 0.2862745, 1, 1,
0.2864146, -0.1321904, 2.417398, 0, 0.2784314, 1, 1,
0.2864252, 0.2788266, 2.480253, 0, 0.2745098, 1, 1,
0.2872136, 1.68327, 0.1415343, 0, 0.2666667, 1, 1,
0.2903885, 1.462288, 1.834839, 0, 0.2627451, 1, 1,
0.290824, 0.3543785, 1.355343, 0, 0.254902, 1, 1,
0.2945162, -1.94934, 1.975003, 0, 0.2509804, 1, 1,
0.2959648, -0.2402674, 2.817297, 0, 0.2431373, 1, 1,
0.300306, 0.255267, 2.322782, 0, 0.2392157, 1, 1,
0.3028525, 0.3992593, 0.8999112, 0, 0.2313726, 1, 1,
0.303744, -1.27915, 3.096388, 0, 0.227451, 1, 1,
0.308872, -0.410933, 2.938192, 0, 0.2196078, 1, 1,
0.3262006, -1.466665, 1.902957, 0, 0.2156863, 1, 1,
0.3295783, -0.4789611, 3.435237, 0, 0.2078431, 1, 1,
0.3310108, -1.629772, 3.827071, 0, 0.2039216, 1, 1,
0.3344935, 0.5449569, -0.8441502, 0, 0.1960784, 1, 1,
0.3453097, 0.387441, 0.9867404, 0, 0.1882353, 1, 1,
0.3491239, 0.9316182, 1.217353, 0, 0.1843137, 1, 1,
0.3510962, 0.9757475, 1.325326, 0, 0.1764706, 1, 1,
0.3535656, -0.9000661, 3.048042, 0, 0.172549, 1, 1,
0.356885, -0.1058772, 2.101294, 0, 0.1647059, 1, 1,
0.3572187, -1.011611, 2.216172, 0, 0.1607843, 1, 1,
0.3613597, 1.777445, 0.9428933, 0, 0.1529412, 1, 1,
0.3643581, 0.3687468, 0.9643374, 0, 0.1490196, 1, 1,
0.3685418, 1.226563, 0.8075846, 0, 0.1411765, 1, 1,
0.3733234, -0.2344825, 3.364179, 0, 0.1372549, 1, 1,
0.3779673, 0.8636048, 0.6030992, 0, 0.1294118, 1, 1,
0.3799883, -0.2996481, 2.510416, 0, 0.1254902, 1, 1,
0.3827029, 1.492202, 0.897481, 0, 0.1176471, 1, 1,
0.3842884, -0.7743591, 3.859518, 0, 0.1137255, 1, 1,
0.3861707, 0.1432781, 0.1746997, 0, 0.1058824, 1, 1,
0.3870149, -1.281086, 2.407479, 0, 0.09803922, 1, 1,
0.3897861, -0.2120165, 1.609004, 0, 0.09411765, 1, 1,
0.3916427, -1.091657, 3.694487, 0, 0.08627451, 1, 1,
0.3931002, 0.08472677, 1.652217, 0, 0.08235294, 1, 1,
0.3941357, 0.5984226, -0.6321246, 0, 0.07450981, 1, 1,
0.3941893, 1.521718, 1.024553, 0, 0.07058824, 1, 1,
0.3958349, -0.2255943, 2.538618, 0, 0.0627451, 1, 1,
0.3972539, 0.5760356, 1.150619, 0, 0.05882353, 1, 1,
0.3974335, 0.4716823, 2.485204, 0, 0.05098039, 1, 1,
0.3982648, 1.127856, 2.016142, 0, 0.04705882, 1, 1,
0.398573, 0.6811802, 0.5562329, 0, 0.03921569, 1, 1,
0.398762, 0.4961911, 2.203028, 0, 0.03529412, 1, 1,
0.4005695, 1.189449, -0.0358662, 0, 0.02745098, 1, 1,
0.4049792, 0.242369, 1.540741, 0, 0.02352941, 1, 1,
0.4146032, 0.321501, 3.731496, 0, 0.01568628, 1, 1,
0.4203785, 0.005663432, 2.331687, 0, 0.01176471, 1, 1,
0.4214069, -0.4723911, 1.91226, 0, 0.003921569, 1, 1,
0.4219261, -0.3767321, 4.605556, 0.003921569, 0, 1, 1,
0.4227559, 0.114158, 1.254481, 0.007843138, 0, 1, 1,
0.4253199, -0.3438528, 4.50346, 0.01568628, 0, 1, 1,
0.4292289, 0.6976265, 0.1607703, 0.01960784, 0, 1, 1,
0.4353065, 0.863447, -0.1399405, 0.02745098, 0, 1, 1,
0.4428324, 0.271695, 0.4306962, 0.03137255, 0, 1, 1,
0.444427, 2.07761, 0.009973361, 0.03921569, 0, 1, 1,
0.4449158, -0.4126674, 1.092929, 0.04313726, 0, 1, 1,
0.4450407, -1.259869, 2.540288, 0.05098039, 0, 1, 1,
0.4466629, 1.746438, 2.758095, 0.05490196, 0, 1, 1,
0.4521897, -0.3374525, 2.350964, 0.0627451, 0, 1, 1,
0.452229, 0.4648381, 1.144886, 0.06666667, 0, 1, 1,
0.4536897, -0.2271074, 3.735035, 0.07450981, 0, 1, 1,
0.45906, -0.1758152, 1.440851, 0.07843138, 0, 1, 1,
0.4595695, -1.857794, 3.670771, 0.08627451, 0, 1, 1,
0.4599706, 0.4885866, 0.1233137, 0.09019608, 0, 1, 1,
0.4698108, 1.292137, -0.5687133, 0.09803922, 0, 1, 1,
0.4734012, 0.7096422, 0.6886239, 0.1058824, 0, 1, 1,
0.4770218, 0.6839191, 1.353704, 0.1098039, 0, 1, 1,
0.4812745, 0.2266205, 1.289518, 0.1176471, 0, 1, 1,
0.4902528, 0.2694077, 0.8316481, 0.1215686, 0, 1, 1,
0.5020649, 0.536202, 0.7320734, 0.1294118, 0, 1, 1,
0.502305, 1.463473, -1.653632, 0.1333333, 0, 1, 1,
0.5035478, 1.046761, -0.4508101, 0.1411765, 0, 1, 1,
0.5061827, -1.168211, 2.607064, 0.145098, 0, 1, 1,
0.5109456, -0.5948768, 2.658873, 0.1529412, 0, 1, 1,
0.5137455, -0.5725005, 3.864827, 0.1568628, 0, 1, 1,
0.5174424, 0.3016727, 1.184242, 0.1647059, 0, 1, 1,
0.5261384, 0.1611803, 2.572723, 0.1686275, 0, 1, 1,
0.5288848, 0.9104804, 1.193809, 0.1764706, 0, 1, 1,
0.5341815, -1.318365, 3.976789, 0.1803922, 0, 1, 1,
0.5348035, 0.555375, -1.122537, 0.1882353, 0, 1, 1,
0.5358269, 1.369971, 0.3258443, 0.1921569, 0, 1, 1,
0.5414916, 0.2370953, 0.2657836, 0.2, 0, 1, 1,
0.5449321, -0.6731914, 4.183009, 0.2078431, 0, 1, 1,
0.5451933, -1.518286, 2.552036, 0.2117647, 0, 1, 1,
0.5462427, 1.577254, -0.77675, 0.2196078, 0, 1, 1,
0.5556002, -0.5101261, 1.537217, 0.2235294, 0, 1, 1,
0.5590647, 0.03690114, 1.02677, 0.2313726, 0, 1, 1,
0.5622369, 1.894973, 1.518359, 0.2352941, 0, 1, 1,
0.5652322, 0.1085407, 1.424458, 0.2431373, 0, 1, 1,
0.569154, 1.406547, 0.4021215, 0.2470588, 0, 1, 1,
0.5715379, 0.2423288, 0.3592936, 0.254902, 0, 1, 1,
0.57236, 0.4917613, 1.835517, 0.2588235, 0, 1, 1,
0.5736712, -1.296854, 2.432311, 0.2666667, 0, 1, 1,
0.5751718, 0.4615405, 0.8881159, 0.2705882, 0, 1, 1,
0.5799571, -0.8139665, 2.670963, 0.2784314, 0, 1, 1,
0.5829492, -0.3017019, 1.884375, 0.282353, 0, 1, 1,
0.5836574, -1.497816, 4.472808, 0.2901961, 0, 1, 1,
0.5840549, 0.07632332, 1.250666, 0.2941177, 0, 1, 1,
0.5891662, -0.4697063, 1.90703, 0.3019608, 0, 1, 1,
0.598223, 0.3375858, 1.088871, 0.3098039, 0, 1, 1,
0.5993975, -1.476102, 2.164891, 0.3137255, 0, 1, 1,
0.6027887, 0.1109951, 1.815011, 0.3215686, 0, 1, 1,
0.6046949, 0.1541628, 0.2484272, 0.3254902, 0, 1, 1,
0.6142736, -0.4075206, 1.540515, 0.3333333, 0, 1, 1,
0.618234, 1.480237, 1.56602, 0.3372549, 0, 1, 1,
0.6186467, -2.798342, 3.598932, 0.345098, 0, 1, 1,
0.6190858, -0.3305097, 2.284786, 0.3490196, 0, 1, 1,
0.6200089, 1.791767, 0.672038, 0.3568628, 0, 1, 1,
0.620475, -2.112741, 3.291838, 0.3607843, 0, 1, 1,
0.6214259, -2.133817, 2.852526, 0.3686275, 0, 1, 1,
0.6233274, 0.4077616, -0.24886, 0.372549, 0, 1, 1,
0.6241105, 0.01655291, 2.412695, 0.3803922, 0, 1, 1,
0.6265689, -0.132157, 1.025866, 0.3843137, 0, 1, 1,
0.6271091, -0.5896835, 1.766452, 0.3921569, 0, 1, 1,
0.6278841, 0.9467981, 1.015093, 0.3960784, 0, 1, 1,
0.6282461, 0.133371, 1.975351, 0.4039216, 0, 1, 1,
0.630178, -0.1389462, 1.525354, 0.4117647, 0, 1, 1,
0.6303096, 0.04613531, 0.9080467, 0.4156863, 0, 1, 1,
0.6323825, -0.5439825, 1.755073, 0.4235294, 0, 1, 1,
0.635132, 1.936362, 1.472005, 0.427451, 0, 1, 1,
0.6358624, -1.056912, 2.849073, 0.4352941, 0, 1, 1,
0.6358998, 0.4841532, 0.5233247, 0.4392157, 0, 1, 1,
0.6399049, 1.130642, 1.206293, 0.4470588, 0, 1, 1,
0.644201, -0.006197708, -0.5761397, 0.4509804, 0, 1, 1,
0.6654492, -0.5789918, 2.853991, 0.4588235, 0, 1, 1,
0.6673551, -0.5717115, 2.367188, 0.4627451, 0, 1, 1,
0.6714205, -0.188103, 1.415983, 0.4705882, 0, 1, 1,
0.6734455, 0.556947, 1.010488, 0.4745098, 0, 1, 1,
0.6779906, -1.075066, 2.389677, 0.4823529, 0, 1, 1,
0.6789212, 0.4355691, 0.6916931, 0.4862745, 0, 1, 1,
0.6790668, 0.1792979, 0.8824888, 0.4941176, 0, 1, 1,
0.6795117, -1.253699, 3.185575, 0.5019608, 0, 1, 1,
0.6837193, 0.2840082, 0.5766178, 0.5058824, 0, 1, 1,
0.6876284, -1.23045, 1.414846, 0.5137255, 0, 1, 1,
0.6876543, -0.406554, 3.281197, 0.5176471, 0, 1, 1,
0.6915377, 0.6835612, -0.6655008, 0.5254902, 0, 1, 1,
0.6946976, 0.3499766, 2.467246, 0.5294118, 0, 1, 1,
0.7020031, 0.3713166, 1.957213, 0.5372549, 0, 1, 1,
0.7052125, 0.3304795, -0.2406173, 0.5411765, 0, 1, 1,
0.7097469, 0.4646651, 0.2037427, 0.5490196, 0, 1, 1,
0.7103908, 0.114163, 1.786075, 0.5529412, 0, 1, 1,
0.7114915, 0.7194882, -0.4391829, 0.5607843, 0, 1, 1,
0.7244734, 0.6843287, 0.2272306, 0.5647059, 0, 1, 1,
0.7264708, -0.5641357, 3.026239, 0.572549, 0, 1, 1,
0.7300759, 0.2823553, 1.406111, 0.5764706, 0, 1, 1,
0.7304186, 1.051439, 0.9026334, 0.5843138, 0, 1, 1,
0.730534, 0.7927308, -0.4422278, 0.5882353, 0, 1, 1,
0.737738, -0.3311463, 3.21171, 0.5960785, 0, 1, 1,
0.7382762, 0.2629043, 1.312432, 0.6039216, 0, 1, 1,
0.7398292, -0.4235536, 2.25857, 0.6078432, 0, 1, 1,
0.7401779, -1.274869, 3.86606, 0.6156863, 0, 1, 1,
0.7410868, -1.748388, 3.675719, 0.6196079, 0, 1, 1,
0.744517, -0.3585196, 0.7925131, 0.627451, 0, 1, 1,
0.7448786, -1.206854, 2.921991, 0.6313726, 0, 1, 1,
0.7467963, -1.457105, 2.738509, 0.6392157, 0, 1, 1,
0.7491316, -0.140406, 1.444649, 0.6431373, 0, 1, 1,
0.7555428, 0.7850583, 2.059481, 0.6509804, 0, 1, 1,
0.7560653, -1.726035, 3.541479, 0.654902, 0, 1, 1,
0.7577413, 0.9033978, 1.387788, 0.6627451, 0, 1, 1,
0.7616483, -0.6426424, 1.014269, 0.6666667, 0, 1, 1,
0.7618622, -1.130083, 2.531914, 0.6745098, 0, 1, 1,
0.7660403, -0.7162665, 1.305076, 0.6784314, 0, 1, 1,
0.7665738, 1.065199, 0.569304, 0.6862745, 0, 1, 1,
0.7684688, -0.4853863, 2.847337, 0.6901961, 0, 1, 1,
0.7688261, -0.04694918, 2.368968, 0.6980392, 0, 1, 1,
0.7702888, -1.09529, 2.264639, 0.7058824, 0, 1, 1,
0.7823787, 0.5049968, -0.03268884, 0.7098039, 0, 1, 1,
0.7866102, 1.687947, -0.1224271, 0.7176471, 0, 1, 1,
0.795699, -0.2045699, 2.934141, 0.7215686, 0, 1, 1,
0.7985201, -0.889572, 2.094775, 0.7294118, 0, 1, 1,
0.8146545, 0.4694061, 1.123183, 0.7333333, 0, 1, 1,
0.8146774, 0.6222954, 1.505363, 0.7411765, 0, 1, 1,
0.8177593, 0.6076118, 1.976879, 0.7450981, 0, 1, 1,
0.8187763, 0.9379076, 0.6904562, 0.7529412, 0, 1, 1,
0.8191803, 0.1792164, 1.938517, 0.7568628, 0, 1, 1,
0.8238687, 0.5431889, 0.460186, 0.7647059, 0, 1, 1,
0.8301035, -0.8671357, 4.042186, 0.7686275, 0, 1, 1,
0.8306956, 1.075611, 1.360223, 0.7764706, 0, 1, 1,
0.8312837, 2.896327, 0.2569775, 0.7803922, 0, 1, 1,
0.8338332, -0.6930129, 3.106753, 0.7882353, 0, 1, 1,
0.8373636, 0.5363384, -0.939122, 0.7921569, 0, 1, 1,
0.8385077, 0.7865245, 2.644801, 0.8, 0, 1, 1,
0.8390834, 1.730229, -0.06006717, 0.8078431, 0, 1, 1,
0.8408285, -0.4213036, 2.529296, 0.8117647, 0, 1, 1,
0.8447545, -0.595329, 1.011939, 0.8196079, 0, 1, 1,
0.845929, -0.1175659, 3.539522, 0.8235294, 0, 1, 1,
0.8467213, 0.07377621, 0.07595941, 0.8313726, 0, 1, 1,
0.8508981, -0.7251229, 1.93848, 0.8352941, 0, 1, 1,
0.8522807, 0.6459433, 0.8570804, 0.8431373, 0, 1, 1,
0.8525524, 0.5574236, 0.934849, 0.8470588, 0, 1, 1,
0.861729, -1.143188, 1.142099, 0.854902, 0, 1, 1,
0.8696774, 0.1586736, 0.8527219, 0.8588235, 0, 1, 1,
0.8745608, 2.123338, 0.7850782, 0.8666667, 0, 1, 1,
0.8791376, 1.141191, 0.8650413, 0.8705882, 0, 1, 1,
0.8806735, -0.5622437, 2.09081, 0.8784314, 0, 1, 1,
0.8815045, 1.572476, -6.889818e-06, 0.8823529, 0, 1, 1,
0.8835916, 0.6875259, -0.01694982, 0.8901961, 0, 1, 1,
0.8847437, -1.204733, 2.216541, 0.8941177, 0, 1, 1,
0.8876442, -1.006142, 3.129283, 0.9019608, 0, 1, 1,
0.8950132, 0.343071, 2.310458, 0.9098039, 0, 1, 1,
0.8968127, 0.4742625, -0.836382, 0.9137255, 0, 1, 1,
0.9043053, -0.277883, 3.497038, 0.9215686, 0, 1, 1,
0.9047311, 1.502998, 0.4375621, 0.9254902, 0, 1, 1,
0.9072483, 0.4320877, 1.765765, 0.9333333, 0, 1, 1,
0.9088849, 0.4171054, 1.088695, 0.9372549, 0, 1, 1,
0.910983, -1.611955, 3.698786, 0.945098, 0, 1, 1,
0.9171179, 0.4817153, 0.9479799, 0.9490196, 0, 1, 1,
0.9186885, 0.5153086, 0.5260676, 0.9568627, 0, 1, 1,
0.9190122, 0.2630675, 0.3104646, 0.9607843, 0, 1, 1,
0.9197519, 0.6391024, 0.7421518, 0.9686275, 0, 1, 1,
0.9262232, 0.4310419, 1.219484, 0.972549, 0, 1, 1,
0.9309825, 1.073218, 1.940165, 0.9803922, 0, 1, 1,
0.9312574, 0.1280842, 1.175529, 0.9843137, 0, 1, 1,
0.9314599, -0.5086998, 1.161007, 0.9921569, 0, 1, 1,
0.9433012, -0.352212, -0.8280254, 0.9960784, 0, 1, 1,
0.9451884, -2.230549, 2.196838, 1, 0, 0.9960784, 1,
0.9462044, 0.6159979, 1.969778, 1, 0, 0.9882353, 1,
0.9463826, -0.2096634, 1.141627, 1, 0, 0.9843137, 1,
0.9521548, 0.9616858, 0.917378, 1, 0, 0.9764706, 1,
0.9572501, 0.2697899, -1.214333, 1, 0, 0.972549, 1,
0.9593161, 0.04287847, 2.846058, 1, 0, 0.9647059, 1,
0.9709764, -0.02688454, 1.77161, 1, 0, 0.9607843, 1,
0.9793417, 0.3196945, 2.935867, 1, 0, 0.9529412, 1,
0.981163, 0.7222439, -0.5120251, 1, 0, 0.9490196, 1,
0.9889416, -0.1548031, 1.105861, 1, 0, 0.9411765, 1,
0.9930563, -1.881206, 1.769655, 1, 0, 0.9372549, 1,
1.000636, -1.258317, 1.788261, 1, 0, 0.9294118, 1,
1.00606, -1.213894, 1.815696, 1, 0, 0.9254902, 1,
1.00911, 0.2557059, 1.413486, 1, 0, 0.9176471, 1,
1.009993, -1.22924, 2.796809, 1, 0, 0.9137255, 1,
1.013141, -1.625437, 4.409236, 1, 0, 0.9058824, 1,
1.013327, -0.0776625, 1.898458, 1, 0, 0.9019608, 1,
1.019534, 1.012668, 2.799632, 1, 0, 0.8941177, 1,
1.019654, -1.034837, 1.059316, 1, 0, 0.8862745, 1,
1.019684, -0.06105824, 3.100144, 1, 0, 0.8823529, 1,
1.021426, -0.9027882, 0.1942132, 1, 0, 0.8745098, 1,
1.02235, 0.8790195, 0.6376204, 1, 0, 0.8705882, 1,
1.0376, 0.02533581, 0.7300202, 1, 0, 0.8627451, 1,
1.045913, -0.8238562, 2.108549, 1, 0, 0.8588235, 1,
1.046207, -1.276256, 2.768569, 1, 0, 0.8509804, 1,
1.046522, -0.6679707, 0.9087187, 1, 0, 0.8470588, 1,
1.049631, 1.168718, 0.3694294, 1, 0, 0.8392157, 1,
1.060683, -1.105255, 1.569939, 1, 0, 0.8352941, 1,
1.068674, 1.726644, -0.7178278, 1, 0, 0.827451, 1,
1.069313, 0.9759784, 0.7421691, 1, 0, 0.8235294, 1,
1.073562, 0.1612751, 2.645634, 1, 0, 0.8156863, 1,
1.074338, -1.071875, -0.4198002, 1, 0, 0.8117647, 1,
1.075876, -2.741243, 1.640062, 1, 0, 0.8039216, 1,
1.087864, -0.5654284, 2.508425, 1, 0, 0.7960784, 1,
1.09092, 0.1688315, 1.91673, 1, 0, 0.7921569, 1,
1.092591, -1.882833, 2.451158, 1, 0, 0.7843137, 1,
1.093114, 1.4506, 1.916001, 1, 0, 0.7803922, 1,
1.096421, -0.4523523, 2.411566, 1, 0, 0.772549, 1,
1.098179, 0.2293474, 1.327672, 1, 0, 0.7686275, 1,
1.098911, -1.456701, 3.510292, 1, 0, 0.7607843, 1,
1.105908, 0.7790045, 1.073671, 1, 0, 0.7568628, 1,
1.109895, 0.1185866, 1.095265, 1, 0, 0.7490196, 1,
1.114994, -0.5036412, 1.754565, 1, 0, 0.7450981, 1,
1.115234, -0.9390758, 1.891472, 1, 0, 0.7372549, 1,
1.127549, -1.570189, 2.522333, 1, 0, 0.7333333, 1,
1.132837, -0.9908434, 2.867923, 1, 0, 0.7254902, 1,
1.134463, -0.5100291, 1.174273, 1, 0, 0.7215686, 1,
1.146823, -0.6605377, 3.051764, 1, 0, 0.7137255, 1,
1.151219, -0.2404329, 1.17682, 1, 0, 0.7098039, 1,
1.153873, 0.9450511, -0.2215648, 1, 0, 0.7019608, 1,
1.165882, 0.5115323, 0.48782, 1, 0, 0.6941177, 1,
1.166779, -1.026422, 2.970026, 1, 0, 0.6901961, 1,
1.180241, -0.6304034, 3.995574, 1, 0, 0.682353, 1,
1.189074, -0.2551883, 0.803148, 1, 0, 0.6784314, 1,
1.189706, 0.01847415, 1.481372, 1, 0, 0.6705883, 1,
1.199367, 1.666239, -1.125954, 1, 0, 0.6666667, 1,
1.222726, -1.640498, 3.437627, 1, 0, 0.6588235, 1,
1.236952, 0.5300087, 1.857303, 1, 0, 0.654902, 1,
1.244897, -0.1092934, 1.018878, 1, 0, 0.6470588, 1,
1.249503, -0.02444537, 2.279045, 1, 0, 0.6431373, 1,
1.250767, -0.255049, 3.932143, 1, 0, 0.6352941, 1,
1.2631, -0.2588408, 3.114856, 1, 0, 0.6313726, 1,
1.263911, -1.827039, 1.984458, 1, 0, 0.6235294, 1,
1.264586, -0.1720468, 0.4550561, 1, 0, 0.6196079, 1,
1.267576, -0.1378876, 3.662262, 1, 0, 0.6117647, 1,
1.27119, -0.6574959, 2.384449, 1, 0, 0.6078432, 1,
1.284096, -0.4219515, 2.478112, 1, 0, 0.6, 1,
1.29312, -1.691742, 3.167964, 1, 0, 0.5921569, 1,
1.297601, -1.782548, 1.139321, 1, 0, 0.5882353, 1,
1.306664, 0.9735658, 0.05616256, 1, 0, 0.5803922, 1,
1.320201, -0.1849208, 2.804336, 1, 0, 0.5764706, 1,
1.331588, -0.1901868, 2.508795, 1, 0, 0.5686275, 1,
1.338251, -0.4461581, 2.324077, 1, 0, 0.5647059, 1,
1.341661, -1.001589, 3.446421, 1, 0, 0.5568628, 1,
1.342627, -0.1279158, 1.156092, 1, 0, 0.5529412, 1,
1.35137, 0.2347068, 1.112003, 1, 0, 0.5450981, 1,
1.351427, -0.1236028, -0.2841594, 1, 0, 0.5411765, 1,
1.351565, 0.2124191, -0.05294633, 1, 0, 0.5333334, 1,
1.353329, -0.770385, 2.487321, 1, 0, 0.5294118, 1,
1.354506, 1.558415, 0.6577187, 1, 0, 0.5215687, 1,
1.356088, -0.3142445, 1.840366, 1, 0, 0.5176471, 1,
1.359295, -0.8146251, 2.287429, 1, 0, 0.509804, 1,
1.36018, -0.3376059, 3.164911, 1, 0, 0.5058824, 1,
1.369163, 1.485858, 0.1486719, 1, 0, 0.4980392, 1,
1.39003, -1.680979, 2.839597, 1, 0, 0.4901961, 1,
1.401178, 1.104423, 1.058595, 1, 0, 0.4862745, 1,
1.40143, -2.088931, 1.16506, 1, 0, 0.4784314, 1,
1.407063, -0.1373257, 1.360193, 1, 0, 0.4745098, 1,
1.408851, 1.677034, 2.390495, 1, 0, 0.4666667, 1,
1.418856, 0.8055906, 1.513376, 1, 0, 0.4627451, 1,
1.425181, -0.5680234, 0.2683488, 1, 0, 0.454902, 1,
1.426588, 0.8058413, 0.9502153, 1, 0, 0.4509804, 1,
1.432119, 0.7021761, 2.612313, 1, 0, 0.4431373, 1,
1.438151, 1.557577, 0.5335303, 1, 0, 0.4392157, 1,
1.44543, -0.6355503, 3.430452, 1, 0, 0.4313726, 1,
1.447316, 0.157337, 1.683121, 1, 0, 0.427451, 1,
1.450432, 1.050341, 1.08029, 1, 0, 0.4196078, 1,
1.456637, 0.2978415, 1.426105, 1, 0, 0.4156863, 1,
1.463169, 0.2100247, 1.221323, 1, 0, 0.4078431, 1,
1.467683, -1.492932, 3.102698, 1, 0, 0.4039216, 1,
1.480463, 0.7354202, 0.8668027, 1, 0, 0.3960784, 1,
1.484826, -0.838865, 1.490989, 1, 0, 0.3882353, 1,
1.485157, 0.5468598, 1.469326, 1, 0, 0.3843137, 1,
1.49341, 0.4438752, 0.7314884, 1, 0, 0.3764706, 1,
1.49643, -1.334277, 1.179245, 1, 0, 0.372549, 1,
1.506915, -0.395069, 1.902343, 1, 0, 0.3647059, 1,
1.51075, -2.6105, 2.85335, 1, 0, 0.3607843, 1,
1.515712, -0.7310662, 2.797045, 1, 0, 0.3529412, 1,
1.523508, -0.320149, 1.366958, 1, 0, 0.3490196, 1,
1.525476, -0.7037041, 1.278974, 1, 0, 0.3411765, 1,
1.535917, 1.849001, 0.5222012, 1, 0, 0.3372549, 1,
1.562395, 0.529809, 1.301218, 1, 0, 0.3294118, 1,
1.566532, -0.2065273, 0.9535592, 1, 0, 0.3254902, 1,
1.585553, -1.886509, 1.65288, 1, 0, 0.3176471, 1,
1.588468, -1.687749, 1.121084, 1, 0, 0.3137255, 1,
1.592713, 0.8015878, 0.9753931, 1, 0, 0.3058824, 1,
1.597441, 3.344609, -1.580248, 1, 0, 0.2980392, 1,
1.597803, -1.789502, 2.744132, 1, 0, 0.2941177, 1,
1.598544, -2.140143, 3.299727, 1, 0, 0.2862745, 1,
1.637683, 0.5137594, 1.418932, 1, 0, 0.282353, 1,
1.645696, -2.072169, 0.8064146, 1, 0, 0.2745098, 1,
1.654973, -0.7885461, 2.338326, 1, 0, 0.2705882, 1,
1.656879, -0.1531456, 2.011392, 1, 0, 0.2627451, 1,
1.671387, -1.057392, -0.2042585, 1, 0, 0.2588235, 1,
1.671996, -0.06838398, 3.130363, 1, 0, 0.2509804, 1,
1.672153, 0.5929469, 1.89282, 1, 0, 0.2470588, 1,
1.680252, -0.847701, 2.242038, 1, 0, 0.2392157, 1,
1.681883, 0.570316, 1.006316, 1, 0, 0.2352941, 1,
1.725548, -0.6753305, 3.236175, 1, 0, 0.227451, 1,
1.734025, 0.162369, 0.6211069, 1, 0, 0.2235294, 1,
1.736614, 0.8192047, 1.007247, 1, 0, 0.2156863, 1,
1.760579, -1.61805, 1.615571, 1, 0, 0.2117647, 1,
1.788489, 0.770631, 1.844526, 1, 0, 0.2039216, 1,
1.807287, -0.9673781, 2.826168, 1, 0, 0.1960784, 1,
1.813787, -0.7146034, 2.469867, 1, 0, 0.1921569, 1,
1.860245, 0.5731072, 0.4545058, 1, 0, 0.1843137, 1,
1.862011, 0.7687528, 0.4268559, 1, 0, 0.1803922, 1,
1.90096, 0.9866761, 1.339702, 1, 0, 0.172549, 1,
1.909917, 1.011699, -0.6815838, 1, 0, 0.1686275, 1,
1.954597, 0.6012794, 1.494904, 1, 0, 0.1607843, 1,
1.956995, -0.7585514, 3.797628, 1, 0, 0.1568628, 1,
1.973917, -0.04776563, 2.151803, 1, 0, 0.1490196, 1,
2.045743, 2.059102, 2.441937, 1, 0, 0.145098, 1,
2.058405, 1.638845, 0.8741852, 1, 0, 0.1372549, 1,
2.066934, 0.1605246, 2.185852, 1, 0, 0.1333333, 1,
2.067074, -1.363318, 2.51634, 1, 0, 0.1254902, 1,
2.083457, -0.601517, 0.613269, 1, 0, 0.1215686, 1,
2.109159, 0.4676946, 1.268236, 1, 0, 0.1137255, 1,
2.14398, -2.184106, 1.950238, 1, 0, 0.1098039, 1,
2.175605, 0.3841158, 1.208511, 1, 0, 0.1019608, 1,
2.24118, -0.8775609, 2.315563, 1, 0, 0.09411765, 1,
2.287949, 0.4612711, 0.6696809, 1, 0, 0.09019608, 1,
2.290323, 1.190511, 2.89743, 1, 0, 0.08235294, 1,
2.334819, 2.986303, -0.2030382, 1, 0, 0.07843138, 1,
2.351045, 0.08375815, 1.387936, 1, 0, 0.07058824, 1,
2.388122, -0.7725532, 2.007705, 1, 0, 0.06666667, 1,
2.396087, 2.02538, 1.469146, 1, 0, 0.05882353, 1,
2.428904, -0.4617877, 2.209717, 1, 0, 0.05490196, 1,
2.463216, -0.3118676, 2.715422, 1, 0, 0.04705882, 1,
2.476009, 0.6496668, 1.314207, 1, 0, 0.04313726, 1,
2.503504, -1.035112, 0.1564411, 1, 0, 0.03529412, 1,
2.553548, -0.9971867, 1.907444, 1, 0, 0.03137255, 1,
2.621597, 0.391367, 2.588595, 1, 0, 0.02352941, 1,
2.691749, -0.5843038, 2.235885, 1, 0, 0.01960784, 1,
2.883367, -1.148185, 1.522881, 1, 0, 0.01176471, 1,
3.046499, 0.867666, 0.699048, 1, 0, 0.007843138, 1
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
-0.07762778, -4.083485, -6.976263, 0, -0.5, 0.5, 0.5,
-0.07762778, -4.083485, -6.976263, 1, -0.5, 0.5, 0.5,
-0.07762778, -4.083485, -6.976263, 1, 1.5, 0.5, 0.5,
-0.07762778, -4.083485, -6.976263, 0, 1.5, 0.5, 0.5
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
-4.260834, 0.1688527, -6.976263, 0, -0.5, 0.5, 0.5,
-4.260834, 0.1688527, -6.976263, 1, -0.5, 0.5, 0.5,
-4.260834, 0.1688527, -6.976263, 1, 1.5, 0.5, 0.5,
-4.260834, 0.1688527, -6.976263, 0, 1.5, 0.5, 0.5
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
-4.260834, -4.083485, -0.06216669, 0, -0.5, 0.5, 0.5,
-4.260834, -4.083485, -0.06216669, 1, -0.5, 0.5, 0.5,
-4.260834, -4.083485, -0.06216669, 1, 1.5, 0.5, 0.5,
-4.260834, -4.083485, -0.06216669, 0, 1.5, 0.5, 0.5
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
-3, -3.102176, -5.380702,
3, -3.102176, -5.380702,
-3, -3.102176, -5.380702,
-3, -3.265728, -5.646629,
-2, -3.102176, -5.380702,
-2, -3.265728, -5.646629,
-1, -3.102176, -5.380702,
-1, -3.265728, -5.646629,
0, -3.102176, -5.380702,
0, -3.265728, -5.646629,
1, -3.102176, -5.380702,
1, -3.265728, -5.646629,
2, -3.102176, -5.380702,
2, -3.265728, -5.646629,
3, -3.102176, -5.380702,
3, -3.265728, -5.646629
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
-3, -3.592831, -6.178483, 0, -0.5, 0.5, 0.5,
-3, -3.592831, -6.178483, 1, -0.5, 0.5, 0.5,
-3, -3.592831, -6.178483, 1, 1.5, 0.5, 0.5,
-3, -3.592831, -6.178483, 0, 1.5, 0.5, 0.5,
-2, -3.592831, -6.178483, 0, -0.5, 0.5, 0.5,
-2, -3.592831, -6.178483, 1, -0.5, 0.5, 0.5,
-2, -3.592831, -6.178483, 1, 1.5, 0.5, 0.5,
-2, -3.592831, -6.178483, 0, 1.5, 0.5, 0.5,
-1, -3.592831, -6.178483, 0, -0.5, 0.5, 0.5,
-1, -3.592831, -6.178483, 1, -0.5, 0.5, 0.5,
-1, -3.592831, -6.178483, 1, 1.5, 0.5, 0.5,
-1, -3.592831, -6.178483, 0, 1.5, 0.5, 0.5,
0, -3.592831, -6.178483, 0, -0.5, 0.5, 0.5,
0, -3.592831, -6.178483, 1, -0.5, 0.5, 0.5,
0, -3.592831, -6.178483, 1, 1.5, 0.5, 0.5,
0, -3.592831, -6.178483, 0, 1.5, 0.5, 0.5,
1, -3.592831, -6.178483, 0, -0.5, 0.5, 0.5,
1, -3.592831, -6.178483, 1, -0.5, 0.5, 0.5,
1, -3.592831, -6.178483, 1, 1.5, 0.5, 0.5,
1, -3.592831, -6.178483, 0, 1.5, 0.5, 0.5,
2, -3.592831, -6.178483, 0, -0.5, 0.5, 0.5,
2, -3.592831, -6.178483, 1, -0.5, 0.5, 0.5,
2, -3.592831, -6.178483, 1, 1.5, 0.5, 0.5,
2, -3.592831, -6.178483, 0, 1.5, 0.5, 0.5,
3, -3.592831, -6.178483, 0, -0.5, 0.5, 0.5,
3, -3.592831, -6.178483, 1, -0.5, 0.5, 0.5,
3, -3.592831, -6.178483, 1, 1.5, 0.5, 0.5,
3, -3.592831, -6.178483, 0, 1.5, 0.5, 0.5
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
-3.295479, -3, -5.380702,
-3.295479, 3, -5.380702,
-3.295479, -3, -5.380702,
-3.456371, -3, -5.646629,
-3.295479, -2, -5.380702,
-3.456371, -2, -5.646629,
-3.295479, -1, -5.380702,
-3.456371, -1, -5.646629,
-3.295479, 0, -5.380702,
-3.456371, 0, -5.646629,
-3.295479, 1, -5.380702,
-3.456371, 1, -5.646629,
-3.295479, 2, -5.380702,
-3.456371, 2, -5.646629,
-3.295479, 3, -5.380702,
-3.456371, 3, -5.646629
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
-3.778156, -3, -6.178483, 0, -0.5, 0.5, 0.5,
-3.778156, -3, -6.178483, 1, -0.5, 0.5, 0.5,
-3.778156, -3, -6.178483, 1, 1.5, 0.5, 0.5,
-3.778156, -3, -6.178483, 0, 1.5, 0.5, 0.5,
-3.778156, -2, -6.178483, 0, -0.5, 0.5, 0.5,
-3.778156, -2, -6.178483, 1, -0.5, 0.5, 0.5,
-3.778156, -2, -6.178483, 1, 1.5, 0.5, 0.5,
-3.778156, -2, -6.178483, 0, 1.5, 0.5, 0.5,
-3.778156, -1, -6.178483, 0, -0.5, 0.5, 0.5,
-3.778156, -1, -6.178483, 1, -0.5, 0.5, 0.5,
-3.778156, -1, -6.178483, 1, 1.5, 0.5, 0.5,
-3.778156, -1, -6.178483, 0, 1.5, 0.5, 0.5,
-3.778156, 0, -6.178483, 0, -0.5, 0.5, 0.5,
-3.778156, 0, -6.178483, 1, -0.5, 0.5, 0.5,
-3.778156, 0, -6.178483, 1, 1.5, 0.5, 0.5,
-3.778156, 0, -6.178483, 0, 1.5, 0.5, 0.5,
-3.778156, 1, -6.178483, 0, -0.5, 0.5, 0.5,
-3.778156, 1, -6.178483, 1, -0.5, 0.5, 0.5,
-3.778156, 1, -6.178483, 1, 1.5, 0.5, 0.5,
-3.778156, 1, -6.178483, 0, 1.5, 0.5, 0.5,
-3.778156, 2, -6.178483, 0, -0.5, 0.5, 0.5,
-3.778156, 2, -6.178483, 1, -0.5, 0.5, 0.5,
-3.778156, 2, -6.178483, 1, 1.5, 0.5, 0.5,
-3.778156, 2, -6.178483, 0, 1.5, 0.5, 0.5,
-3.778156, 3, -6.178483, 0, -0.5, 0.5, 0.5,
-3.778156, 3, -6.178483, 1, -0.5, 0.5, 0.5,
-3.778156, 3, -6.178483, 1, 1.5, 0.5, 0.5,
-3.778156, 3, -6.178483, 0, 1.5, 0.5, 0.5
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
-3.295479, -3.102176, -4,
-3.295479, -3.102176, 4,
-3.295479, -3.102176, -4,
-3.456371, -3.265728, -4,
-3.295479, -3.102176, -2,
-3.456371, -3.265728, -2,
-3.295479, -3.102176, 0,
-3.456371, -3.265728, 0,
-3.295479, -3.102176, 2,
-3.456371, -3.265728, 2,
-3.295479, -3.102176, 4,
-3.456371, -3.265728, 4
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
-3.778156, -3.592831, -4, 0, -0.5, 0.5, 0.5,
-3.778156, -3.592831, -4, 1, -0.5, 0.5, 0.5,
-3.778156, -3.592831, -4, 1, 1.5, 0.5, 0.5,
-3.778156, -3.592831, -4, 0, 1.5, 0.5, 0.5,
-3.778156, -3.592831, -2, 0, -0.5, 0.5, 0.5,
-3.778156, -3.592831, -2, 1, -0.5, 0.5, 0.5,
-3.778156, -3.592831, -2, 1, 1.5, 0.5, 0.5,
-3.778156, -3.592831, -2, 0, 1.5, 0.5, 0.5,
-3.778156, -3.592831, 0, 0, -0.5, 0.5, 0.5,
-3.778156, -3.592831, 0, 1, -0.5, 0.5, 0.5,
-3.778156, -3.592831, 0, 1, 1.5, 0.5, 0.5,
-3.778156, -3.592831, 0, 0, 1.5, 0.5, 0.5,
-3.778156, -3.592831, 2, 0, -0.5, 0.5, 0.5,
-3.778156, -3.592831, 2, 1, -0.5, 0.5, 0.5,
-3.778156, -3.592831, 2, 1, 1.5, 0.5, 0.5,
-3.778156, -3.592831, 2, 0, 1.5, 0.5, 0.5,
-3.778156, -3.592831, 4, 0, -0.5, 0.5, 0.5,
-3.778156, -3.592831, 4, 1, -0.5, 0.5, 0.5,
-3.778156, -3.592831, 4, 1, 1.5, 0.5, 0.5,
-3.778156, -3.592831, 4, 0, 1.5, 0.5, 0.5
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
-3.295479, -3.102176, -5.380702,
-3.295479, 3.439882, -5.380702,
-3.295479, -3.102176, 5.256369,
-3.295479, 3.439882, 5.256369,
-3.295479, -3.102176, -5.380702,
-3.295479, -3.102176, 5.256369,
-3.295479, 3.439882, -5.380702,
-3.295479, 3.439882, 5.256369,
-3.295479, -3.102176, -5.380702,
3.140223, -3.102176, -5.380702,
-3.295479, -3.102176, 5.256369,
3.140223, -3.102176, 5.256369,
-3.295479, 3.439882, -5.380702,
3.140223, 3.439882, -5.380702,
-3.295479, 3.439882, 5.256369,
3.140223, 3.439882, 5.256369,
3.140223, -3.102176, -5.380702,
3.140223, 3.439882, -5.380702,
3.140223, -3.102176, 5.256369,
3.140223, 3.439882, 5.256369,
3.140223, -3.102176, -5.380702,
3.140223, -3.102176, 5.256369,
3.140223, 3.439882, -5.380702,
3.140223, 3.439882, 5.256369
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
var radius = 7.501697;
var distance = 33.3759;
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
mvMatrix.translate( 0.07762778, -0.1688527, 0.06216669 );
mvMatrix.scale( 1.26031, 1.239821, 0.7625202 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.3759);
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
oxo-pyrrolidino<-read.table("oxo-pyrrolidino.xyz")
```

```
## Error in read.table("oxo-pyrrolidino.xyz"): no lines available in input
```

```r
x<-oxo-pyrrolidino$V2
```

```
## Error in eval(expr, envir, enclos): object 'oxo' not found
```

```r
y<-oxo-pyrrolidino$V3
```

```
## Error in eval(expr, envir, enclos): object 'oxo' not found
```

```r
z<-oxo-pyrrolidino$V4
```

```
## Error in eval(expr, envir, enclos): object 'oxo' not found
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
-3.201755, 0.2391211, -1.124369, 0, 0, 1, 1, 1,
-3.145227, -0.5297039, -3.242893, 1, 0, 0, 1, 1,
-3.043661, 0.4314165, 0.2876614, 1, 0, 0, 1, 1,
-2.982815, -0.2220976, -2.108206, 1, 0, 0, 1, 1,
-2.882975, -0.1647313, -3.21851, 1, 0, 0, 1, 1,
-2.836623, -0.104503, -1.872436, 1, 0, 0, 1, 1,
-2.592868, 1.205457, -1.885859, 0, 0, 0, 1, 1,
-2.548779, 0.5639409, -1.315758, 0, 0, 0, 1, 1,
-2.534211, -0.846016, -1.634407, 0, 0, 0, 1, 1,
-2.506168, 0.7786276, -2.429593, 0, 0, 0, 1, 1,
-2.430166, 1.008537, -1.145273, 0, 0, 0, 1, 1,
-2.428626, -0.6246486, -0.7570202, 0, 0, 0, 1, 1,
-2.422675, -1.431832, -2.835467, 0, 0, 0, 1, 1,
-2.361322, 0.7285125, -0.7191037, 1, 1, 1, 1, 1,
-2.337435, 0.0627238, -2.328163, 1, 1, 1, 1, 1,
-2.289928, -2.814993, -1.515525, 1, 1, 1, 1, 1,
-2.275364, 0.352575, -0.9655672, 1, 1, 1, 1, 1,
-2.23137, 0.9514247, -0.09361323, 1, 1, 1, 1, 1,
-2.208786, -2.202082, -0.8900682, 1, 1, 1, 1, 1,
-2.205243, -1.018019, -1.314173, 1, 1, 1, 1, 1,
-2.172975, -1.321583, -3.11453, 1, 1, 1, 1, 1,
-2.151573, 0.9317877, -0.9960491, 1, 1, 1, 1, 1,
-2.141135, -0.06716914, 0.7439066, 1, 1, 1, 1, 1,
-2.096967, 0.1386618, -0.3051974, 1, 1, 1, 1, 1,
-2.094571, -0.9474426, -2.865735, 1, 1, 1, 1, 1,
-2.062667, -1.390223, -1.555101, 1, 1, 1, 1, 1,
-2.062517, 0.92917, -0.6585758, 1, 1, 1, 1, 1,
-2.01701, -0.7246421, -1.852951, 1, 1, 1, 1, 1,
-1.999117, -0.4275302, -2.801262, 0, 0, 1, 1, 1,
-1.998168, -0.0853586, -3.084319, 1, 0, 0, 1, 1,
-1.979435, -0.9051207, -0.6185313, 1, 0, 0, 1, 1,
-1.960904, -1.575504, -2.113171, 1, 0, 0, 1, 1,
-1.948091, 0.8923087, -0.3431456, 1, 0, 0, 1, 1,
-1.917202, 0.1335806, -2.469671, 1, 0, 0, 1, 1,
-1.893564, -1.485474, -3.999548, 0, 0, 0, 1, 1,
-1.891483, -0.1066118, -2.468033, 0, 0, 0, 1, 1,
-1.891276, -0.7569925, 0.5575427, 0, 0, 0, 1, 1,
-1.830658, 1.309784, -0.01718802, 0, 0, 0, 1, 1,
-1.820317, -0.1665792, -0.680265, 0, 0, 0, 1, 1,
-1.818296, -0.8283309, -1.535743, 0, 0, 0, 1, 1,
-1.813891, 1.085556, -3.150932, 0, 0, 0, 1, 1,
-1.78625, 0.08216888, -0.7980951, 1, 1, 1, 1, 1,
-1.781852, -0.1960334, -1.377576, 1, 1, 1, 1, 1,
-1.765941, 0.0541513, -0.5496447, 1, 1, 1, 1, 1,
-1.764441, -0.5838647, -0.5030354, 1, 1, 1, 1, 1,
-1.733974, 1.054732, 0.4126806, 1, 1, 1, 1, 1,
-1.71722, 1.52479, -0.1357587, 1, 1, 1, 1, 1,
-1.701844, 0.02922197, -0.467647, 1, 1, 1, 1, 1,
-1.677136, -1.856103, -1.992708, 1, 1, 1, 1, 1,
-1.67025, -0.4408698, -0.8885033, 1, 1, 1, 1, 1,
-1.660386, -0.7328727, -1.960675, 1, 1, 1, 1, 1,
-1.651957, 0.002545307, -0.7572499, 1, 1, 1, 1, 1,
-1.614912, 1.177033, -1.922338, 1, 1, 1, 1, 1,
-1.607973, 0.3732224, -0.8441501, 1, 1, 1, 1, 1,
-1.584821, -0.3831615, -2.153152, 1, 1, 1, 1, 1,
-1.579926, -0.1255905, -0.7758118, 1, 1, 1, 1, 1,
-1.57268, 2.232245, 0.5597661, 0, 0, 1, 1, 1,
-1.566797, -0.08987735, -2.199639, 1, 0, 0, 1, 1,
-1.535646, -0.9789814, -3.437077, 1, 0, 0, 1, 1,
-1.523907, 0.6585109, -1.042037, 1, 0, 0, 1, 1,
-1.52072, 0.6208914, -1.589986, 1, 0, 0, 1, 1,
-1.519788, 0.6046742, -2.111166, 1, 0, 0, 1, 1,
-1.49763, 1.242191, -1.71857, 0, 0, 0, 1, 1,
-1.495589, 1.356103, -0.253056, 0, 0, 0, 1, 1,
-1.488422, -0.3459442, -2.528877, 0, 0, 0, 1, 1,
-1.487922, -0.3682503, -3.571227, 0, 0, 0, 1, 1,
-1.482171, 1.560509, 0.3633763, 0, 0, 0, 1, 1,
-1.476115, 1.220348, -0.9751486, 0, 0, 0, 1, 1,
-1.466356, 0.4786837, -1.349641, 0, 0, 0, 1, 1,
-1.464993, -1.527094, -2.897817, 1, 1, 1, 1, 1,
-1.456151, 0.8669471, -0.1229831, 1, 1, 1, 1, 1,
-1.45327, -1.025889, -1.455637, 1, 1, 1, 1, 1,
-1.446436, -0.2551928, -1.973186, 1, 1, 1, 1, 1,
-1.446075, -0.1292519, -1.713831, 1, 1, 1, 1, 1,
-1.433969, -1.34154, -0.8191885, 1, 1, 1, 1, 1,
-1.416122, -0.4920671, -2.632059, 1, 1, 1, 1, 1,
-1.415402, 1.645018, -0.3667473, 1, 1, 1, 1, 1,
-1.412603, 0.3682788, -2.078822, 1, 1, 1, 1, 1,
-1.408572, -0.1734138, 0.9066073, 1, 1, 1, 1, 1,
-1.394757, 0.3753126, -2.842452, 1, 1, 1, 1, 1,
-1.38477, -1.194056, -2.01189, 1, 1, 1, 1, 1,
-1.383446, -1.067006, -2.84861, 1, 1, 1, 1, 1,
-1.379239, 1.727379, 0.3565118, 1, 1, 1, 1, 1,
-1.372627, -0.5677992, -1.339478, 1, 1, 1, 1, 1,
-1.363854, -1.483218, -2.566461, 0, 0, 1, 1, 1,
-1.353536, 0.9862848, -0.09526841, 1, 0, 0, 1, 1,
-1.348317, 1.844651, -1.639714, 1, 0, 0, 1, 1,
-1.346879, -0.3196923, -3.739124, 1, 0, 0, 1, 1,
-1.346117, 1.691218, -2.251205, 1, 0, 0, 1, 1,
-1.328682, -0.2132825, -1.670476, 1, 0, 0, 1, 1,
-1.32831, 0.03238907, -2.248464, 0, 0, 0, 1, 1,
-1.32828, 0.1789141, -0.6375531, 0, 0, 0, 1, 1,
-1.326468, 1.994742, 0.1309023, 0, 0, 0, 1, 1,
-1.321366, 1.445129, 0.07033791, 0, 0, 0, 1, 1,
-1.297435, -0.2917541, -1.380193, 0, 0, 0, 1, 1,
-1.286801, -0.997278, -3.454502, 0, 0, 0, 1, 1,
-1.284245, 0.391363, 1.403723, 0, 0, 0, 1, 1,
-1.280168, 0.9444187, -1.177761, 1, 1, 1, 1, 1,
-1.276881, -1.293793, -2.921965, 1, 1, 1, 1, 1,
-1.275994, 1.588908, -0.3183669, 1, 1, 1, 1, 1,
-1.27363, 1.430734, -0.3353298, 1, 1, 1, 1, 1,
-1.266875, 0.5450634, -1.444593, 1, 1, 1, 1, 1,
-1.252152, 0.9543496, 1.460394, 1, 1, 1, 1, 1,
-1.24571, 0.3061998, 0.921766, 1, 1, 1, 1, 1,
-1.239963, 0.7686567, -2.9265, 1, 1, 1, 1, 1,
-1.231724, -0.6380081, -1.234225, 1, 1, 1, 1, 1,
-1.227933, 0.2614389, -0.9096329, 1, 1, 1, 1, 1,
-1.224913, 0.1799276, 0.7655285, 1, 1, 1, 1, 1,
-1.222567, -1.205291, -2.764281, 1, 1, 1, 1, 1,
-1.218296, -2.34644, -2.310192, 1, 1, 1, 1, 1,
-1.202215, -1.391797, -1.893111, 1, 1, 1, 1, 1,
-1.202193, -0.6988788, -2.467949, 1, 1, 1, 1, 1,
-1.193472, 0.4869437, -0.9387417, 0, 0, 1, 1, 1,
-1.191908, -0.9481989, -1.604513, 1, 0, 0, 1, 1,
-1.188477, 0.2562526, -2.508627, 1, 0, 0, 1, 1,
-1.188422, -1.674339, -2.6271, 1, 0, 0, 1, 1,
-1.187451, -0.359289, -1.954642, 1, 0, 0, 1, 1,
-1.187036, 0.8260904, -1.143472, 1, 0, 0, 1, 1,
-1.179162, -1.864826, -3.227305, 0, 0, 0, 1, 1,
-1.177446, 0.4530839, -2.374478, 0, 0, 0, 1, 1,
-1.171759, -0.7148308, -2.010474, 0, 0, 0, 1, 1,
-1.164402, 1.228246, 0.02704172, 0, 0, 0, 1, 1,
-1.159109, 0.7210855, 0.007701036, 0, 0, 0, 1, 1,
-1.157078, -1.907883, -2.624974, 0, 0, 0, 1, 1,
-1.142949, -0.9941183, -2.592456, 0, 0, 0, 1, 1,
-1.140552, 2.320803, -1.065827, 1, 1, 1, 1, 1,
-1.135438, 1.623892, -0.5795166, 1, 1, 1, 1, 1,
-1.12271, 1.992302, -1.547187, 1, 1, 1, 1, 1,
-1.116128, -1.029901, -1.94328, 1, 1, 1, 1, 1,
-1.113235, -0.2458105, -1.006166, 1, 1, 1, 1, 1,
-1.110612, 1.219359, -1.076557, 1, 1, 1, 1, 1,
-1.106895, -0.3607905, -3.887168, 1, 1, 1, 1, 1,
-1.105343, 1.151838, -1.218862, 1, 1, 1, 1, 1,
-1.102936, 0.2349277, -1.206429, 1, 1, 1, 1, 1,
-1.100212, -0.7758619, -0.7836847, 1, 1, 1, 1, 1,
-1.097989, 0.9617066, -0.5699983, 1, 1, 1, 1, 1,
-1.088936, 1.008755, 0.08439939, 1, 1, 1, 1, 1,
-1.087908, -2.179919, -3.538105, 1, 1, 1, 1, 1,
-1.082229, 0.8520744, -1.353917, 1, 1, 1, 1, 1,
-1.080912, 0.5101085, 0.7629895, 1, 1, 1, 1, 1,
-1.077305, -1.848645, -4.974263, 0, 0, 1, 1, 1,
-1.072891, 1.210817, -1.297278, 1, 0, 0, 1, 1,
-1.072624, 0.6974095, -1.678976, 1, 0, 0, 1, 1,
-1.069249, 0.7619427, -0.003347206, 1, 0, 0, 1, 1,
-1.06892, -0.262721, -3.310554, 1, 0, 0, 1, 1,
-1.064583, 0.02641215, -0.576264, 1, 0, 0, 1, 1,
-1.061042, 0.887832, -0.8619745, 0, 0, 0, 1, 1,
-1.056401, 0.4701585, -2.480101, 0, 0, 0, 1, 1,
-1.055669, 1.258201, -0.887319, 0, 0, 0, 1, 1,
-1.052207, 1.055807, -1.822449, 0, 0, 0, 1, 1,
-1.05178, -1.505287, -2.923026, 0, 0, 0, 1, 1,
-1.038915, 1.708538, 0.650607, 0, 0, 0, 1, 1,
-1.036156, -0.2428139, -1.557734, 0, 0, 0, 1, 1,
-1.02995, -0.7295213, -1.921562, 1, 1, 1, 1, 1,
-1.029329, -0.03481295, -1.0831, 1, 1, 1, 1, 1,
-1.028632, 0.04384284, 0.2999186, 1, 1, 1, 1, 1,
-1.019971, -0.9386559, -2.724329, 1, 1, 1, 1, 1,
-1.015755, 1.241636, -0.3716522, 1, 1, 1, 1, 1,
-1.004539, -0.428515, -1.744354, 1, 1, 1, 1, 1,
-1.001725, 0.9076118, -1.79319, 1, 1, 1, 1, 1,
-0.9985456, 4.982752e-05, -0.9132774, 1, 1, 1, 1, 1,
-0.9931167, 1.114834, 0.1412779, 1, 1, 1, 1, 1,
-0.9929065, -0.7993549, -1.355143, 1, 1, 1, 1, 1,
-0.9792636, -0.3141088, -2.376837, 1, 1, 1, 1, 1,
-0.9786289, -1.633898, -2.888101, 1, 1, 1, 1, 1,
-0.9785283, 0.08168572, -0.948463, 1, 1, 1, 1, 1,
-0.9607634, 0.1011487, 0.9740385, 1, 1, 1, 1, 1,
-0.9572992, 1.3994, -0.9559972, 1, 1, 1, 1, 1,
-0.9559477, 0.3977419, -0.8132389, 0, 0, 1, 1, 1,
-0.9543661, 0.4657724, 0.3389196, 1, 0, 0, 1, 1,
-0.9517083, -0.4126191, -1.451067, 1, 0, 0, 1, 1,
-0.9506781, 0.2137227, -1.403608, 1, 0, 0, 1, 1,
-0.9504417, 1.759916, 0.7930726, 1, 0, 0, 1, 1,
-0.9458544, 0.4761215, 0.05053909, 1, 0, 0, 1, 1,
-0.939885, 0.6092598, 0.6932623, 0, 0, 0, 1, 1,
-0.9395935, -0.197312, -2.643868, 0, 0, 0, 1, 1,
-0.933853, 0.05447046, -2.576129, 0, 0, 0, 1, 1,
-0.9314677, -1.605989, -3.225764, 0, 0, 0, 1, 1,
-0.9207192, 0.4718495, -1.90362, 0, 0, 0, 1, 1,
-0.9126018, 2.418913, -0.3632942, 0, 0, 0, 1, 1,
-0.9069444, 0.2275999, -1.22384, 0, 0, 0, 1, 1,
-0.9024473, 0.4566062, -2.85583, 1, 1, 1, 1, 1,
-0.8873906, 0.4940162, -1.250906, 1, 1, 1, 1, 1,
-0.8871442, 1.019109, -0.3189027, 1, 1, 1, 1, 1,
-0.8782053, 0.5193825, 0.839941, 1, 1, 1, 1, 1,
-0.8778051, 2.103157, -0.7795535, 1, 1, 1, 1, 1,
-0.8766861, 1.037421, -2.664563, 1, 1, 1, 1, 1,
-0.8759421, 0.9182196, 0.62311, 1, 1, 1, 1, 1,
-0.8753861, -0.201657, -2.160337, 1, 1, 1, 1, 1,
-0.8746808, -0.008498939, -2.150672, 1, 1, 1, 1, 1,
-0.8743489, -0.401592, -1.923102, 1, 1, 1, 1, 1,
-0.8691963, -1.386645, -2.84174, 1, 1, 1, 1, 1,
-0.8496613, -0.7274596, -2.102391, 1, 1, 1, 1, 1,
-0.84677, -1.530659, -1.989844, 1, 1, 1, 1, 1,
-0.8467651, -1.126935, -2.225855, 1, 1, 1, 1, 1,
-0.8430953, -0.1573599, -1.264512, 1, 1, 1, 1, 1,
-0.842775, -0.6047989, -2.685148, 0, 0, 1, 1, 1,
-0.8383247, 0.4635431, -0.5880592, 1, 0, 0, 1, 1,
-0.8348363, -0.7703815, -3.512157, 1, 0, 0, 1, 1,
-0.8274994, -1.150759, -0.7508304, 1, 0, 0, 1, 1,
-0.8249979, 0.6452092, -1.98718, 1, 0, 0, 1, 1,
-0.8247809, -2.642725, -2.709645, 1, 0, 0, 1, 1,
-0.8235871, -1.546612, -2.940243, 0, 0, 0, 1, 1,
-0.8204612, 1.656125, -1.791241, 0, 0, 0, 1, 1,
-0.8197398, 0.3296234, 1.28637, 0, 0, 0, 1, 1,
-0.8166759, -1.128009, -2.617754, 0, 0, 0, 1, 1,
-0.8110747, 0.3741017, -2.266085, 0, 0, 0, 1, 1,
-0.8049383, 0.05784696, -0.6648569, 0, 0, 0, 1, 1,
-0.8048415, -1.56446, -2.476054, 0, 0, 0, 1, 1,
-0.7979984, 0.1035131, -2.50486, 1, 1, 1, 1, 1,
-0.7971843, -0.6262838, -2.547525, 1, 1, 1, 1, 1,
-0.7923373, -1.342831, -2.856021, 1, 1, 1, 1, 1,
-0.7865476, 0.7325814, 1.134214, 1, 1, 1, 1, 1,
-0.7863238, -1.248644, -1.944055, 1, 1, 1, 1, 1,
-0.7819864, -0.1014774, -1.346884, 1, 1, 1, 1, 1,
-0.7800847, 0.2306082, -0.7465421, 1, 1, 1, 1, 1,
-0.7772626, 0.5481419, -1.312162, 1, 1, 1, 1, 1,
-0.7745312, 2.49407, -0.000263404, 1, 1, 1, 1, 1,
-0.7744532, -0.7210221, -0.9979595, 1, 1, 1, 1, 1,
-0.7713721, 1.43558, -0.7338329, 1, 1, 1, 1, 1,
-0.7692189, 1.076944, 0.4897489, 1, 1, 1, 1, 1,
-0.7564504, -1.505816, -2.803939, 1, 1, 1, 1, 1,
-0.7554642, 0.8170632, -0.4838341, 1, 1, 1, 1, 1,
-0.7483848, -0.9142736, -1.925664, 1, 1, 1, 1, 1,
-0.7398711, 0.7654104, -0.2098868, 0, 0, 1, 1, 1,
-0.7396633, -0.6758536, -0.3126506, 1, 0, 0, 1, 1,
-0.7285989, 0.2945228, -0.4822733, 1, 0, 0, 1, 1,
-0.7281926, 1.052375, 1.407155, 1, 0, 0, 1, 1,
-0.7233858, 0.01970483, -0.5274954, 1, 0, 0, 1, 1,
-0.7207034, -0.9302601, -2.537801, 1, 0, 0, 1, 1,
-0.7111415, -0.3681267, -0.6970174, 0, 0, 0, 1, 1,
-0.7087734, -0.5155313, -1.373498, 0, 0, 0, 1, 1,
-0.7084049, -1.004346, -2.621538, 0, 0, 0, 1, 1,
-0.7038496, -1.076026, -3.272643, 0, 0, 0, 1, 1,
-0.7036682, 1.861633, 0.768261, 0, 0, 0, 1, 1,
-0.7019739, 1.850039, -0.5438434, 0, 0, 0, 1, 1,
-0.7017869, 0.2724869, -1.8179, 0, 0, 0, 1, 1,
-0.7013777, -0.1304492, -4.131228, 1, 1, 1, 1, 1,
-0.7009401, -0.8940616, -3.566043, 1, 1, 1, 1, 1,
-0.6951903, -0.4311221, -2.073425, 1, 1, 1, 1, 1,
-0.6945976, 0.2475991, -0.9883983, 1, 1, 1, 1, 1,
-0.6847849, -0.290344, 0.02619711, 1, 1, 1, 1, 1,
-0.6834099, 1.185352, -1.910161, 1, 1, 1, 1, 1,
-0.6812612, 0.611311, -1.627638, 1, 1, 1, 1, 1,
-0.6789626, -0.3877502, -2.026427, 1, 1, 1, 1, 1,
-0.6768315, 0.6092118, -0.3559465, 1, 1, 1, 1, 1,
-0.6763235, -0.8702829, -3.399305, 1, 1, 1, 1, 1,
-0.6738507, 1.59705, -1.051872, 1, 1, 1, 1, 1,
-0.6692566, -0.5730352, -1.75905, 1, 1, 1, 1, 1,
-0.6684675, -0.0005632535, -1.782417, 1, 1, 1, 1, 1,
-0.6633061, 1.042299, 0.2966453, 1, 1, 1, 1, 1,
-0.6583567, 0.5666131, -1.645549, 1, 1, 1, 1, 1,
-0.6579565, 0.3591502, -0.9991921, 0, 0, 1, 1, 1,
-0.6544896, 0.3269639, -2.338392, 1, 0, 0, 1, 1,
-0.6525046, -0.1367784, -1.360678, 1, 0, 0, 1, 1,
-0.6481721, 0.6952327, -0.1244161, 1, 0, 0, 1, 1,
-0.6475167, -1.499989, -4.098281, 1, 0, 0, 1, 1,
-0.6439531, -0.795952, -3.143348, 1, 0, 0, 1, 1,
-0.6422631, 1.484902, -0.9232669, 0, 0, 0, 1, 1,
-0.6410107, 1.080547, 0.1418877, 0, 0, 0, 1, 1,
-0.6380851, 1.189794, -0.115063, 0, 0, 0, 1, 1,
-0.6361471, -0.7133067, -1.844359, 0, 0, 0, 1, 1,
-0.6357606, 1.055328, -1.226574, 0, 0, 0, 1, 1,
-0.6294419, -1.003213, -1.657766, 0, 0, 0, 1, 1,
-0.6231379, 1.3994, -0.297787, 0, 0, 0, 1, 1,
-0.6223122, -0.3192247, -1.858784, 1, 1, 1, 1, 1,
-0.6216258, -0.5737518, -2.567309, 1, 1, 1, 1, 1,
-0.6201546, 0.879056, -0.9552277, 1, 1, 1, 1, 1,
-0.6179172, -0.7165253, -3.79816, 1, 1, 1, 1, 1,
-0.6143708, -1.530993, -2.780526, 1, 1, 1, 1, 1,
-0.6135098, 0.2955207, -0.5474295, 1, 1, 1, 1, 1,
-0.6083491, 0.6873479, 1.725774, 1, 1, 1, 1, 1,
-0.6071602, -0.3961363, -2.623422, 1, 1, 1, 1, 1,
-0.6043404, 0.2027611, 0.395347, 1, 1, 1, 1, 1,
-0.6022654, 0.2780128, -0.5002558, 1, 1, 1, 1, 1,
-0.5975179, 1.586914, 0.226492, 1, 1, 1, 1, 1,
-0.5953413, 0.3548084, -0.08275979, 1, 1, 1, 1, 1,
-0.5929911, -1.107298, -1.871401, 1, 1, 1, 1, 1,
-0.5907965, -2.608496, -2.377899, 1, 1, 1, 1, 1,
-0.5906795, 0.4015468, -0.788958, 1, 1, 1, 1, 1,
-0.5895802, -0.7999845, -4.277659, 0, 0, 1, 1, 1,
-0.5876787, -1.02563, -2.220599, 1, 0, 0, 1, 1,
-0.5853359, 0.723521, -0.5587536, 1, 0, 0, 1, 1,
-0.5797135, -1.113143, -0.8195618, 1, 0, 0, 1, 1,
-0.5785294, 0.6814183, -1.581296, 1, 0, 0, 1, 1,
-0.5774999, -0.8900163, -1.746882, 1, 0, 0, 1, 1,
-0.5715411, -0.3552593, -2.814451, 0, 0, 0, 1, 1,
-0.5687942, -0.02468567, -1.270954, 0, 0, 0, 1, 1,
-0.5687717, -0.2287624, -1.983082, 0, 0, 0, 1, 1,
-0.5683985, -0.6223616, -3.007775, 0, 0, 0, 1, 1,
-0.5664614, 1.800164, -1.684991, 0, 0, 0, 1, 1,
-0.566192, 0.5129437, -0.3597355, 0, 0, 0, 1, 1,
-0.5636759, -0.7139173, -3.86019, 0, 0, 0, 1, 1,
-0.5555041, 0.07502968, -2.210571, 1, 1, 1, 1, 1,
-0.5483428, -0.001853839, -1.586931, 1, 1, 1, 1, 1,
-0.545819, 0.8268465, -1.202992, 1, 1, 1, 1, 1,
-0.5457579, 0.608345, 0.1833571, 1, 1, 1, 1, 1,
-0.5442787, 0.6389789, -0.9972909, 1, 1, 1, 1, 1,
-0.5437337, 0.2187971, -1.292009, 1, 1, 1, 1, 1,
-0.5358976, 1.011054, -2.38061, 1, 1, 1, 1, 1,
-0.5325105, -1.159228, -3.16237, 1, 1, 1, 1, 1,
-0.5319576, 0.5509852, -1.221779, 1, 1, 1, 1, 1,
-0.5276361, -1.382411, -3.973513, 1, 1, 1, 1, 1,
-0.5144861, -0.5022571, -2.592044, 1, 1, 1, 1, 1,
-0.5142906, 0.2352563, -1.578042, 1, 1, 1, 1, 1,
-0.5113649, -0.6035509, -1.66477, 1, 1, 1, 1, 1,
-0.5047981, -1.326306, -3.142957, 1, 1, 1, 1, 1,
-0.5015401, -0.4859147, -1.281646, 1, 1, 1, 1, 1,
-0.4983403, -0.6277176, -1.330922, 0, 0, 1, 1, 1,
-0.4959173, -1.315276, -3.114241, 1, 0, 0, 1, 1,
-0.494889, -0.7235749, -2.893954, 1, 0, 0, 1, 1,
-0.4944794, 0.4887935, -2.090384, 1, 0, 0, 1, 1,
-0.4901013, -0.4065964, -2.374042, 1, 0, 0, 1, 1,
-0.4858418, -0.3148113, -2.568761, 1, 0, 0, 1, 1,
-0.4795553, 0.426663, 0.770909, 0, 0, 0, 1, 1,
-0.4787314, -0.1615122, -1.668091, 0, 0, 0, 1, 1,
-0.4770299, 0.1712573, -0.2527834, 0, 0, 0, 1, 1,
-0.4725292, -0.1140044, -0.9029916, 0, 0, 0, 1, 1,
-0.4721669, 1.01205, 0.01912635, 0, 0, 0, 1, 1,
-0.4679585, 0.1451471, -1.772421, 0, 0, 0, 1, 1,
-0.4671636, 1.847822, -0.9563747, 0, 0, 0, 1, 1,
-0.4620703, 0.8016118, 0.5150553, 1, 1, 1, 1, 1,
-0.4619689, 1.213298, -0.0007848895, 1, 1, 1, 1, 1,
-0.4562374, -1.071418, -2.652721, 1, 1, 1, 1, 1,
-0.4560491, -0.8489874, -2.994337, 1, 1, 1, 1, 1,
-0.4558644, 1.207822, -0.8665749, 1, 1, 1, 1, 1,
-0.4545738, 1.240305, 0.3706309, 1, 1, 1, 1, 1,
-0.454154, 1.392286, -0.6335987, 1, 1, 1, 1, 1,
-0.4536551, 2.04252, -0.2925077, 1, 1, 1, 1, 1,
-0.4501517, 0.1706655, -0.2243852, 1, 1, 1, 1, 1,
-0.4492814, -0.5339368, -1.970773, 1, 1, 1, 1, 1,
-0.4492216, -1.820147, -4.430293, 1, 1, 1, 1, 1,
-0.4470677, 0.8281128, -1.192764, 1, 1, 1, 1, 1,
-0.4441375, 0.3947452, -0.4027332, 1, 1, 1, 1, 1,
-0.4388455, 1.663729, 0.3527327, 1, 1, 1, 1, 1,
-0.4363987, -1.042113, -4.150126, 1, 1, 1, 1, 1,
-0.4322717, 2.124832, -0.5054684, 0, 0, 1, 1, 1,
-0.4321391, 0.2428504, -1.385358, 1, 0, 0, 1, 1,
-0.4318208, 0.3565317, -1.584405, 1, 0, 0, 1, 1,
-0.4310465, 1.030813, -0.365128, 1, 0, 0, 1, 1,
-0.4293797, 0.4544222, -1.055467, 1, 0, 0, 1, 1,
-0.4291993, -0.02526276, -0.8262756, 1, 0, 0, 1, 1,
-0.4290918, 0.5389875, -0.7267695, 0, 0, 0, 1, 1,
-0.4261405, 0.4567507, -1.071612, 0, 0, 0, 1, 1,
-0.4248138, 0.6454507, -1.316117, 0, 0, 0, 1, 1,
-0.4172442, -0.8374021, -3.787605, 0, 0, 0, 1, 1,
-0.4170496, -0.865616, -1.615434, 0, 0, 0, 1, 1,
-0.41679, 1.229154, -1.118994, 0, 0, 0, 1, 1,
-0.4144053, 1.446457, 0.1210388, 0, 0, 0, 1, 1,
-0.4122943, -0.005236446, -0.5732998, 1, 1, 1, 1, 1,
-0.4122938, -1.683863, -1.303891, 1, 1, 1, 1, 1,
-0.4071491, -1.951898, -2.358799, 1, 1, 1, 1, 1,
-0.4053654, 0.1004103, -0.1004418, 1, 1, 1, 1, 1,
-0.4047786, -0.8796471, -2.130132, 1, 1, 1, 1, 1,
-0.4036632, 0.3089842, -0.9258774, 1, 1, 1, 1, 1,
-0.4002157, 1.969816, 0.4392352, 1, 1, 1, 1, 1,
-0.3927517, 0.5311723, 0.691488, 1, 1, 1, 1, 1,
-0.3862681, 1.111948, -1.116429, 1, 1, 1, 1, 1,
-0.3832703, -0.3174804, -0.9594756, 1, 1, 1, 1, 1,
-0.3831421, -0.2979912, -2.328099, 1, 1, 1, 1, 1,
-0.378086, 0.4570265, -1.656205, 1, 1, 1, 1, 1,
-0.3772787, 0.7892115, 0.6246014, 1, 1, 1, 1, 1,
-0.3730445, 1.642237, -0.4439644, 1, 1, 1, 1, 1,
-0.3699391, -1.385899, -2.066804, 1, 1, 1, 1, 1,
-0.366593, -0.5349824, -3.64875, 0, 0, 1, 1, 1,
-0.3646692, 1.24532, 1.314519, 1, 0, 0, 1, 1,
-0.3633448, -0.6268417, -1.914591, 1, 0, 0, 1, 1,
-0.3572657, 0.6087537, -1.035893, 1, 0, 0, 1, 1,
-0.3569407, 0.4498373, -1.518913, 1, 0, 0, 1, 1,
-0.354956, -0.4177367, -2.046468, 1, 0, 0, 1, 1,
-0.3544584, 1.200492, 0.9362084, 0, 0, 0, 1, 1,
-0.3538416, -0.4723408, -2.138713, 0, 0, 0, 1, 1,
-0.3523873, -0.2196808, -0.9985268, 0, 0, 0, 1, 1,
-0.3496334, 0.7937896, -0.3567164, 0, 0, 0, 1, 1,
-0.3411487, -0.1591852, -1.502522, 0, 0, 0, 1, 1,
-0.3407745, 1.104293, -0.1899262, 0, 0, 0, 1, 1,
-0.3380139, -0.1025167, -2.798773, 0, 0, 0, 1, 1,
-0.3359358, 0.282115, 0.09358359, 1, 1, 1, 1, 1,
-0.3348185, -0.9100116, -2.56372, 1, 1, 1, 1, 1,
-0.331538, 1.304784, -1.191649, 1, 1, 1, 1, 1,
-0.3313392, 0.8277147, 0.1485926, 1, 1, 1, 1, 1,
-0.3312388, 0.6988021, -1.318401, 1, 1, 1, 1, 1,
-0.3278738, 0.3280152, -0.5660075, 1, 1, 1, 1, 1,
-0.3225192, 0.5394795, -1.910122, 1, 1, 1, 1, 1,
-0.3168676, 1.295135, 0.8312395, 1, 1, 1, 1, 1,
-0.3165377, 0.5833442, -0.9523436, 1, 1, 1, 1, 1,
-0.3144229, -2.253247, -2.441856, 1, 1, 1, 1, 1,
-0.3124322, 0.7825454, -0.3159098, 1, 1, 1, 1, 1,
-0.3084898, 0.1447202, -0.8853853, 1, 1, 1, 1, 1,
-0.3064762, 0.1195131, -2.403937, 1, 1, 1, 1, 1,
-0.306114, -1.658876, -4.223085, 1, 1, 1, 1, 1,
-0.2913694, 0.504665, -0.6620227, 1, 1, 1, 1, 1,
-0.2905095, 0.7074211, -0.2379515, 0, 0, 1, 1, 1,
-0.2899403, -1.9136, -3.017343, 1, 0, 0, 1, 1,
-0.2897064, -1.589165, -4.157908, 1, 0, 0, 1, 1,
-0.2888663, 0.7240858, 0.3844168, 1, 0, 0, 1, 1,
-0.2876872, 0.0988335, -1.380269, 1, 0, 0, 1, 1,
-0.2854392, -0.4659599, -2.171725, 1, 0, 0, 1, 1,
-0.2836846, 1.630852, 0.05270566, 0, 0, 0, 1, 1,
-0.2831985, 0.1736678, -0.9600511, 0, 0, 0, 1, 1,
-0.2831733, 1.267833, 1.302757, 0, 0, 0, 1, 1,
-0.2735257, -0.6760588, -3.161207, 0, 0, 0, 1, 1,
-0.2711954, -1.462815, -3.69456, 0, 0, 0, 1, 1,
-0.2683438, -0.4484028, -2.981872, 0, 0, 0, 1, 1,
-0.2680502, 1.403578, -1.272224, 0, 0, 0, 1, 1,
-0.2662755, -2.802071, -2.975214, 1, 1, 1, 1, 1,
-0.2658214, -0.5537008, -2.989671, 1, 1, 1, 1, 1,
-0.2634568, 2.291643, -0.2333125, 1, 1, 1, 1, 1,
-0.2599743, 0.2142901, 0.01312534, 1, 1, 1, 1, 1,
-0.2596779, -0.8633138, -2.324185, 1, 1, 1, 1, 1,
-0.2564508, 0.873015, -0.3305596, 1, 1, 1, 1, 1,
-0.2550624, 0.5255852, 0.6526114, 1, 1, 1, 1, 1,
-0.2529074, 0.07020175, -1.440113, 1, 1, 1, 1, 1,
-0.2527025, 1.077169, -0.7392301, 1, 1, 1, 1, 1,
-0.2511379, -0.7679902, -2.603912, 1, 1, 1, 1, 1,
-0.2491557, -0.5099429, -1.909152, 1, 1, 1, 1, 1,
-0.2469224, 0.4321693, 0.6204292, 1, 1, 1, 1, 1,
-0.2429027, 1.321068, -0.06455249, 1, 1, 1, 1, 1,
-0.2388592, -1.258655, -2.832733, 1, 1, 1, 1, 1,
-0.2387473, 0.9068801, 0.1171986, 1, 1, 1, 1, 1,
-0.2336361, -0.6588344, -2.331101, 0, 0, 1, 1, 1,
-0.2301068, 1.116079, 1.181439, 1, 0, 0, 1, 1,
-0.2298648, -0.2658222, -1.567605, 1, 0, 0, 1, 1,
-0.2285746, 0.6702119, -0.5523669, 1, 0, 0, 1, 1,
-0.2222036, 0.4507747, -0.7920856, 1, 0, 0, 1, 1,
-0.2212273, -0.5872107, -2.813741, 1, 0, 0, 1, 1,
-0.2203468, -0.5182176, -3.997376, 0, 0, 0, 1, 1,
-0.2195102, -0.9236197, -3.027059, 0, 0, 0, 1, 1,
-0.218884, -0.176247, -1.730849, 0, 0, 0, 1, 1,
-0.216027, -0.1882457, -2.796257, 0, 0, 0, 1, 1,
-0.215194, -1.395054, -2.876722, 0, 0, 0, 1, 1,
-0.2139238, 1.527877, -0.661308, 0, 0, 0, 1, 1,
-0.2127844, 0.6934438, 0.1437087, 0, 0, 0, 1, 1,
-0.2123827, -0.1881988, -3.089208, 1, 1, 1, 1, 1,
-0.2112974, 0.8103529, 1.937338, 1, 1, 1, 1, 1,
-0.2101603, -0.7270969, -2.934854, 1, 1, 1, 1, 1,
-0.2098299, -1.352243, -3.292166, 1, 1, 1, 1, 1,
-0.1966964, 0.7202768, 0.5218086, 1, 1, 1, 1, 1,
-0.1923015, -0.4459738, -3.433587, 1, 1, 1, 1, 1,
-0.1920644, 1.245369, 0.4440389, 1, 1, 1, 1, 1,
-0.1867363, -0.8449058, -5.190199, 1, 1, 1, 1, 1,
-0.1862554, -0.2343414, -3.397901, 1, 1, 1, 1, 1,
-0.1789689, -0.3577076, -3.417949, 1, 1, 1, 1, 1,
-0.1710911, 0.506763, -1.216814, 1, 1, 1, 1, 1,
-0.1702167, 1.734553, -0.03277862, 1, 1, 1, 1, 1,
-0.1649412, 0.5259852, -1.573021, 1, 1, 1, 1, 1,
-0.163197, -0.2507649, -4.336647, 1, 1, 1, 1, 1,
-0.1551448, 1.757238, -0.6107727, 1, 1, 1, 1, 1,
-0.1545627, 0.7915578, -0.5011835, 0, 0, 1, 1, 1,
-0.1519598, -0.3137718, -1.750458, 1, 0, 0, 1, 1,
-0.1504114, 1.790894, 0.03421107, 1, 0, 0, 1, 1,
-0.1496553, -1.01078, -1.504192, 1, 0, 0, 1, 1,
-0.1495646, 0.4611292, -1.965901, 1, 0, 0, 1, 1,
-0.144826, 0.2990011, -0.6057181, 1, 0, 0, 1, 1,
-0.1436592, 1.600088, -0.3205411, 0, 0, 0, 1, 1,
-0.142696, -1.175821, -4.213063, 0, 0, 0, 1, 1,
-0.1421668, 1.279209, 0.2950096, 0, 0, 0, 1, 1,
-0.1393963, -0.4502979, -1.982456, 0, 0, 0, 1, 1,
-0.1381967, 0.1582752, -2.371095, 0, 0, 0, 1, 1,
-0.1347958, -0.3460906, -1.672084, 0, 0, 0, 1, 1,
-0.1325924, 0.1868198, -1.063414, 0, 0, 0, 1, 1,
-0.1318494, -3.006904, -3.698838, 1, 1, 1, 1, 1,
-0.1282226, 1.138046, -1.424599, 1, 1, 1, 1, 1,
-0.1278125, -1.459724, -3.728013, 1, 1, 1, 1, 1,
-0.1236515, 0.3835919, 0.4454068, 1, 1, 1, 1, 1,
-0.1231968, -1.539367, -0.823311, 1, 1, 1, 1, 1,
-0.1229033, 0.2201883, -1.112692, 1, 1, 1, 1, 1,
-0.1181929, -0.01459751, -3.367589, 1, 1, 1, 1, 1,
-0.1135426, -0.6517038, -4.628982, 1, 1, 1, 1, 1,
-0.1123045, 0.2051418, -0.2359448, 1, 1, 1, 1, 1,
-0.11169, -0.3949731, -3.095185, 1, 1, 1, 1, 1,
-0.1099532, 0.54255, -0.4968289, 1, 1, 1, 1, 1,
-0.1055536, 0.6680883, -0.7096697, 1, 1, 1, 1, 1,
-0.1031682, -0.1433573, -5.062846, 1, 1, 1, 1, 1,
-0.1023786, 1.241244, 0.03652041, 1, 1, 1, 1, 1,
-0.09684828, 0.4389572, 1.44374, 1, 1, 1, 1, 1,
-0.09093475, 0.113383, -1.38072, 0, 0, 1, 1, 1,
-0.08954584, -0.2488945, -2.586984, 1, 0, 0, 1, 1,
-0.08542611, 0.1072953, -2.518907, 1, 0, 0, 1, 1,
-0.08346048, -0.1360205, -1.978088, 1, 0, 0, 1, 1,
-0.08074345, 0.06771719, -1.651796, 1, 0, 0, 1, 1,
-0.07956127, 1.155433, 0.5234537, 1, 0, 0, 1, 1,
-0.07500761, -0.1397818, -5.225793, 0, 0, 0, 1, 1,
-0.07014392, 0.6182941, -0.6619905, 0, 0, 0, 1, 1,
-0.06444067, 0.676389, -1.515303, 0, 0, 0, 1, 1,
-0.06436811, 0.00980198, -2.721375, 0, 0, 0, 1, 1,
-0.03250762, 0.9873302, -1.01009, 0, 0, 0, 1, 1,
-0.03064137, 0.5777784, -1.415756, 0, 0, 0, 1, 1,
-0.02861577, -0.2616451, -2.032467, 0, 0, 0, 1, 1,
-0.02819956, 0.03004533, -1.21324, 1, 1, 1, 1, 1,
-0.02439379, 0.3242252, -0.5139503, 1, 1, 1, 1, 1,
-0.02324031, 0.5392887, -0.5229207, 1, 1, 1, 1, 1,
-0.02316424, 0.8118101, -0.8464155, 1, 1, 1, 1, 1,
-0.0225745, 1.498986, -0.193518, 1, 1, 1, 1, 1,
-0.02210933, 0.9294445, 0.03385302, 1, 1, 1, 1, 1,
-0.02072727, 1.257767, 0.4094115, 1, 1, 1, 1, 1,
-0.01777038, 0.7530096, -1.569449, 1, 1, 1, 1, 1,
-0.01655997, -1.828527, -2.994806, 1, 1, 1, 1, 1,
-0.002410775, 1.984007, 0.4225056, 1, 1, 1, 1, 1,
-0.002138629, -1.085772, -3.090313, 1, 1, 1, 1, 1,
0.0003811656, 2.151532, 1.289302, 1, 1, 1, 1, 1,
0.001151892, -0.6237054, 3.524466, 1, 1, 1, 1, 1,
0.005085156, -0.388769, 3.615805, 1, 1, 1, 1, 1,
0.005875268, -1.373749, 3.696148, 1, 1, 1, 1, 1,
0.006117914, -1.544077, 5.10146, 0, 0, 1, 1, 1,
0.006248605, 0.4041483, -0.02700955, 1, 0, 0, 1, 1,
0.00688331, -0.4640695, 3.638092, 1, 0, 0, 1, 1,
0.008386921, -0.3285313, 4.039057, 1, 0, 0, 1, 1,
0.01292435, -1.186977, 4.385664, 1, 0, 0, 1, 1,
0.01380336, -1.497483, 2.186786, 1, 0, 0, 1, 1,
0.01472809, -0.6741805, 3.038005, 0, 0, 0, 1, 1,
0.01847342, -1.250992, 4.108901, 0, 0, 0, 1, 1,
0.02161583, 1.360708, -0.01507499, 0, 0, 0, 1, 1,
0.02342866, 0.02623815, -0.0118935, 0, 0, 0, 1, 1,
0.02502569, 0.8390759, 0.8977935, 0, 0, 0, 1, 1,
0.02798597, 1.095647, -0.582819, 0, 0, 0, 1, 1,
0.02924498, 0.5464152, 0.2254681, 0, 0, 0, 1, 1,
0.035639, -0.6999575, 2.924453, 1, 1, 1, 1, 1,
0.03901213, -1.552711, 2.036025, 1, 1, 1, 1, 1,
0.04173275, 0.4481996, 0.1784776, 1, 1, 1, 1, 1,
0.04499713, 0.6928037, 0.1152056, 1, 1, 1, 1, 1,
0.04636949, 0.3863357, -0.3015894, 1, 1, 1, 1, 1,
0.04757744, -0.8578213, 2.0777, 1, 1, 1, 1, 1,
0.0475874, -1.388768, 4.560266, 1, 1, 1, 1, 1,
0.05208186, -0.3197828, 3.085901, 1, 1, 1, 1, 1,
0.0525541, -0.2054163, 2.604843, 1, 1, 1, 1, 1,
0.05325142, -1.202034, 2.087232, 1, 1, 1, 1, 1,
0.05454819, 0.04508999, -0.2045134, 1, 1, 1, 1, 1,
0.05471179, 0.7495233, 0.2961524, 1, 1, 1, 1, 1,
0.0607334, 0.9776247, 0.2866054, 1, 1, 1, 1, 1,
0.06458424, 0.9928932, -0.7544274, 1, 1, 1, 1, 1,
0.06882035, -0.3952322, 3.176419, 1, 1, 1, 1, 1,
0.06911545, -0.5913403, 3.667096, 0, 0, 1, 1, 1,
0.07909273, 0.1391294, 1.142408, 1, 0, 0, 1, 1,
0.07957765, -0.5490239, 3.813114, 1, 0, 0, 1, 1,
0.08077508, -0.8075247, 2.719234, 1, 0, 0, 1, 1,
0.08772542, -1.320721, 1.229312, 1, 0, 0, 1, 1,
0.09153742, -0.06462621, 1.861164, 1, 0, 0, 1, 1,
0.09194103, 1.426261, 1.956206, 0, 0, 0, 1, 1,
0.09564199, 0.03407303, 1.124135, 0, 0, 0, 1, 1,
0.09956779, 0.6510074, -0.7381967, 0, 0, 0, 1, 1,
0.1024553, 1.740534, 0.894011, 0, 0, 0, 1, 1,
0.1024709, -0.1253007, 2.019857, 0, 0, 0, 1, 1,
0.1031423, 1.423844, 1.147658, 0, 0, 0, 1, 1,
0.1048647, 1.461506, 1.10379, 0, 0, 0, 1, 1,
0.1064321, -1.637476, 1.298069, 1, 1, 1, 1, 1,
0.106939, -0.02668939, 1.355295, 1, 1, 1, 1, 1,
0.1096081, -0.4256801, 2.078415, 1, 1, 1, 1, 1,
0.109783, -0.2735776, 2.386266, 1, 1, 1, 1, 1,
0.1105424, 0.5590461, 1.191689, 1, 1, 1, 1, 1,
0.1128057, -0.4774888, 3.679805, 1, 1, 1, 1, 1,
0.1198618, -0.4600996, 3.35907, 1, 1, 1, 1, 1,
0.1201287, 0.3383243, 1.617236, 1, 1, 1, 1, 1,
0.1204221, -0.09915421, 0.9119865, 1, 1, 1, 1, 1,
0.1223636, 1.218696, -0.5318703, 1, 1, 1, 1, 1,
0.1241204, 0.5182215, 1.841754, 1, 1, 1, 1, 1,
0.128349, -1.201985, 2.633711, 1, 1, 1, 1, 1,
0.1301835, -0.2258775, 3.233593, 1, 1, 1, 1, 1,
0.1307157, -0.8930635, 4.415749, 1, 1, 1, 1, 1,
0.1329731, 0.8067928, 0.00721922, 1, 1, 1, 1, 1,
0.1331639, 0.02754336, 1.116318, 0, 0, 1, 1, 1,
0.1408375, 0.9100226, -0.9889094, 1, 0, 0, 1, 1,
0.1417319, -0.1235251, 2.064457, 1, 0, 0, 1, 1,
0.1423886, 2.200513, 1.024827, 1, 0, 0, 1, 1,
0.1428805, 0.3175729, 0.574275, 1, 0, 0, 1, 1,
0.1432687, -0.08211204, 1.868262, 1, 0, 0, 1, 1,
0.145264, -0.4538513, 2.31443, 0, 0, 0, 1, 1,
0.1459246, -0.257841, 2.898615, 0, 0, 0, 1, 1,
0.146897, 0.7466569, -0.05273656, 0, 0, 0, 1, 1,
0.148085, 0.6545548, 0.3111247, 0, 0, 0, 1, 1,
0.1485138, 0.9984972, 0.2496046, 0, 0, 0, 1, 1,
0.1513005, -0.5828875, 4.051792, 0, 0, 0, 1, 1,
0.1531554, 1.393209, 0.07720215, 0, 0, 0, 1, 1,
0.157082, -0.09713449, 1.707465, 1, 1, 1, 1, 1,
0.1623251, 0.04474001, 0.7788168, 1, 1, 1, 1, 1,
0.1637407, -0.9434198, 1.760314, 1, 1, 1, 1, 1,
0.1651244, 0.5729811, -0.2416685, 1, 1, 1, 1, 1,
0.1652733, -1.510904, 3.225022, 1, 1, 1, 1, 1,
0.1657072, -0.0643459, 1.865981, 1, 1, 1, 1, 1,
0.1728467, 0.5677654, -0.07344236, 1, 1, 1, 1, 1,
0.1736742, -1.235661, 2.791267, 1, 1, 1, 1, 1,
0.1744046, 0.4867208, 0.2551013, 1, 1, 1, 1, 1,
0.1867081, 1.968367, -0.1068644, 1, 1, 1, 1, 1,
0.1876982, 0.2146515, 1.32766, 1, 1, 1, 1, 1,
0.1938791, -0.3306008, 2.272738, 1, 1, 1, 1, 1,
0.2002461, -0.08298752, 1.939955, 1, 1, 1, 1, 1,
0.2008574, 0.256869, 2.508776, 1, 1, 1, 1, 1,
0.2014719, -1.312615, 3.673609, 1, 1, 1, 1, 1,
0.2042699, -0.2252849, 2.683832, 0, 0, 1, 1, 1,
0.2066168, -0.9304645, 4.522658, 1, 0, 0, 1, 1,
0.2068434, -0.5645495, 2.930226, 1, 0, 0, 1, 1,
0.2076629, -0.4245118, 2.152175, 1, 0, 0, 1, 1,
0.2089299, -1.037303, 4.562922, 1, 0, 0, 1, 1,
0.2090212, 1.110014, 0.05328897, 1, 0, 0, 1, 1,
0.2111207, -0.5516147, 1.809996, 0, 0, 0, 1, 1,
0.211589, -0.004384056, 2.779804, 0, 0, 0, 1, 1,
0.2166193, -1.763015, 2.866586, 0, 0, 0, 1, 1,
0.2167686, -1.943255, 4.724555, 0, 0, 0, 1, 1,
0.2241261, -1.719065, 2.784347, 0, 0, 0, 1, 1,
0.2245594, -0.005906874, 3.40711, 0, 0, 0, 1, 1,
0.2317981, 0.3160317, 2.331073, 0, 0, 0, 1, 1,
0.2326844, 0.3211781, 0.3168114, 1, 1, 1, 1, 1,
0.2350011, 0.8856563, 1.160589, 1, 1, 1, 1, 1,
0.23851, -0.07432093, 0.9862998, 1, 1, 1, 1, 1,
0.240675, 2.047853, -0.4676926, 1, 1, 1, 1, 1,
0.2450646, -0.3256731, 2.122532, 1, 1, 1, 1, 1,
0.2507087, -1.495854, 2.690225, 1, 1, 1, 1, 1,
0.2583575, -1.792994, 0.9094823, 1, 1, 1, 1, 1,
0.2589897, 1.069171, 0.8260443, 1, 1, 1, 1, 1,
0.2594057, 0.2472686, 0.3102199, 1, 1, 1, 1, 1,
0.2655796, -0.5950924, 3.217438, 1, 1, 1, 1, 1,
0.2724327, -1.049264, 2.08942, 1, 1, 1, 1, 1,
0.273302, 0.1276666, -0.387621, 1, 1, 1, 1, 1,
0.2757243, 0.5128232, -1.081675, 1, 1, 1, 1, 1,
0.2758583, 2.200709, -0.2593801, 1, 1, 1, 1, 1,
0.2763548, 0.1761716, 2.042324, 1, 1, 1, 1, 1,
0.2793854, -0.4166767, 3.279697, 0, 0, 1, 1, 1,
0.2799859, 0.4394353, 0.7521901, 1, 0, 0, 1, 1,
0.2820326, 0.5786923, 0.5301375, 1, 0, 0, 1, 1,
0.2822431, 0.03551852, 1.659385, 1, 0, 0, 1, 1,
0.2864146, -0.1321904, 2.417398, 1, 0, 0, 1, 1,
0.2864252, 0.2788266, 2.480253, 1, 0, 0, 1, 1,
0.2872136, 1.68327, 0.1415343, 0, 0, 0, 1, 1,
0.2903885, 1.462288, 1.834839, 0, 0, 0, 1, 1,
0.290824, 0.3543785, 1.355343, 0, 0, 0, 1, 1,
0.2945162, -1.94934, 1.975003, 0, 0, 0, 1, 1,
0.2959648, -0.2402674, 2.817297, 0, 0, 0, 1, 1,
0.300306, 0.255267, 2.322782, 0, 0, 0, 1, 1,
0.3028525, 0.3992593, 0.8999112, 0, 0, 0, 1, 1,
0.303744, -1.27915, 3.096388, 1, 1, 1, 1, 1,
0.308872, -0.410933, 2.938192, 1, 1, 1, 1, 1,
0.3262006, -1.466665, 1.902957, 1, 1, 1, 1, 1,
0.3295783, -0.4789611, 3.435237, 1, 1, 1, 1, 1,
0.3310108, -1.629772, 3.827071, 1, 1, 1, 1, 1,
0.3344935, 0.5449569, -0.8441502, 1, 1, 1, 1, 1,
0.3453097, 0.387441, 0.9867404, 1, 1, 1, 1, 1,
0.3491239, 0.9316182, 1.217353, 1, 1, 1, 1, 1,
0.3510962, 0.9757475, 1.325326, 1, 1, 1, 1, 1,
0.3535656, -0.9000661, 3.048042, 1, 1, 1, 1, 1,
0.356885, -0.1058772, 2.101294, 1, 1, 1, 1, 1,
0.3572187, -1.011611, 2.216172, 1, 1, 1, 1, 1,
0.3613597, 1.777445, 0.9428933, 1, 1, 1, 1, 1,
0.3643581, 0.3687468, 0.9643374, 1, 1, 1, 1, 1,
0.3685418, 1.226563, 0.8075846, 1, 1, 1, 1, 1,
0.3733234, -0.2344825, 3.364179, 0, 0, 1, 1, 1,
0.3779673, 0.8636048, 0.6030992, 1, 0, 0, 1, 1,
0.3799883, -0.2996481, 2.510416, 1, 0, 0, 1, 1,
0.3827029, 1.492202, 0.897481, 1, 0, 0, 1, 1,
0.3842884, -0.7743591, 3.859518, 1, 0, 0, 1, 1,
0.3861707, 0.1432781, 0.1746997, 1, 0, 0, 1, 1,
0.3870149, -1.281086, 2.407479, 0, 0, 0, 1, 1,
0.3897861, -0.2120165, 1.609004, 0, 0, 0, 1, 1,
0.3916427, -1.091657, 3.694487, 0, 0, 0, 1, 1,
0.3931002, 0.08472677, 1.652217, 0, 0, 0, 1, 1,
0.3941357, 0.5984226, -0.6321246, 0, 0, 0, 1, 1,
0.3941893, 1.521718, 1.024553, 0, 0, 0, 1, 1,
0.3958349, -0.2255943, 2.538618, 0, 0, 0, 1, 1,
0.3972539, 0.5760356, 1.150619, 1, 1, 1, 1, 1,
0.3974335, 0.4716823, 2.485204, 1, 1, 1, 1, 1,
0.3982648, 1.127856, 2.016142, 1, 1, 1, 1, 1,
0.398573, 0.6811802, 0.5562329, 1, 1, 1, 1, 1,
0.398762, 0.4961911, 2.203028, 1, 1, 1, 1, 1,
0.4005695, 1.189449, -0.0358662, 1, 1, 1, 1, 1,
0.4049792, 0.242369, 1.540741, 1, 1, 1, 1, 1,
0.4146032, 0.321501, 3.731496, 1, 1, 1, 1, 1,
0.4203785, 0.005663432, 2.331687, 1, 1, 1, 1, 1,
0.4214069, -0.4723911, 1.91226, 1, 1, 1, 1, 1,
0.4219261, -0.3767321, 4.605556, 1, 1, 1, 1, 1,
0.4227559, 0.114158, 1.254481, 1, 1, 1, 1, 1,
0.4253199, -0.3438528, 4.50346, 1, 1, 1, 1, 1,
0.4292289, 0.6976265, 0.1607703, 1, 1, 1, 1, 1,
0.4353065, 0.863447, -0.1399405, 1, 1, 1, 1, 1,
0.4428324, 0.271695, 0.4306962, 0, 0, 1, 1, 1,
0.444427, 2.07761, 0.009973361, 1, 0, 0, 1, 1,
0.4449158, -0.4126674, 1.092929, 1, 0, 0, 1, 1,
0.4450407, -1.259869, 2.540288, 1, 0, 0, 1, 1,
0.4466629, 1.746438, 2.758095, 1, 0, 0, 1, 1,
0.4521897, -0.3374525, 2.350964, 1, 0, 0, 1, 1,
0.452229, 0.4648381, 1.144886, 0, 0, 0, 1, 1,
0.4536897, -0.2271074, 3.735035, 0, 0, 0, 1, 1,
0.45906, -0.1758152, 1.440851, 0, 0, 0, 1, 1,
0.4595695, -1.857794, 3.670771, 0, 0, 0, 1, 1,
0.4599706, 0.4885866, 0.1233137, 0, 0, 0, 1, 1,
0.4698108, 1.292137, -0.5687133, 0, 0, 0, 1, 1,
0.4734012, 0.7096422, 0.6886239, 0, 0, 0, 1, 1,
0.4770218, 0.6839191, 1.353704, 1, 1, 1, 1, 1,
0.4812745, 0.2266205, 1.289518, 1, 1, 1, 1, 1,
0.4902528, 0.2694077, 0.8316481, 1, 1, 1, 1, 1,
0.5020649, 0.536202, 0.7320734, 1, 1, 1, 1, 1,
0.502305, 1.463473, -1.653632, 1, 1, 1, 1, 1,
0.5035478, 1.046761, -0.4508101, 1, 1, 1, 1, 1,
0.5061827, -1.168211, 2.607064, 1, 1, 1, 1, 1,
0.5109456, -0.5948768, 2.658873, 1, 1, 1, 1, 1,
0.5137455, -0.5725005, 3.864827, 1, 1, 1, 1, 1,
0.5174424, 0.3016727, 1.184242, 1, 1, 1, 1, 1,
0.5261384, 0.1611803, 2.572723, 1, 1, 1, 1, 1,
0.5288848, 0.9104804, 1.193809, 1, 1, 1, 1, 1,
0.5341815, -1.318365, 3.976789, 1, 1, 1, 1, 1,
0.5348035, 0.555375, -1.122537, 1, 1, 1, 1, 1,
0.5358269, 1.369971, 0.3258443, 1, 1, 1, 1, 1,
0.5414916, 0.2370953, 0.2657836, 0, 0, 1, 1, 1,
0.5449321, -0.6731914, 4.183009, 1, 0, 0, 1, 1,
0.5451933, -1.518286, 2.552036, 1, 0, 0, 1, 1,
0.5462427, 1.577254, -0.77675, 1, 0, 0, 1, 1,
0.5556002, -0.5101261, 1.537217, 1, 0, 0, 1, 1,
0.5590647, 0.03690114, 1.02677, 1, 0, 0, 1, 1,
0.5622369, 1.894973, 1.518359, 0, 0, 0, 1, 1,
0.5652322, 0.1085407, 1.424458, 0, 0, 0, 1, 1,
0.569154, 1.406547, 0.4021215, 0, 0, 0, 1, 1,
0.5715379, 0.2423288, 0.3592936, 0, 0, 0, 1, 1,
0.57236, 0.4917613, 1.835517, 0, 0, 0, 1, 1,
0.5736712, -1.296854, 2.432311, 0, 0, 0, 1, 1,
0.5751718, 0.4615405, 0.8881159, 0, 0, 0, 1, 1,
0.5799571, -0.8139665, 2.670963, 1, 1, 1, 1, 1,
0.5829492, -0.3017019, 1.884375, 1, 1, 1, 1, 1,
0.5836574, -1.497816, 4.472808, 1, 1, 1, 1, 1,
0.5840549, 0.07632332, 1.250666, 1, 1, 1, 1, 1,
0.5891662, -0.4697063, 1.90703, 1, 1, 1, 1, 1,
0.598223, 0.3375858, 1.088871, 1, 1, 1, 1, 1,
0.5993975, -1.476102, 2.164891, 1, 1, 1, 1, 1,
0.6027887, 0.1109951, 1.815011, 1, 1, 1, 1, 1,
0.6046949, 0.1541628, 0.2484272, 1, 1, 1, 1, 1,
0.6142736, -0.4075206, 1.540515, 1, 1, 1, 1, 1,
0.618234, 1.480237, 1.56602, 1, 1, 1, 1, 1,
0.6186467, -2.798342, 3.598932, 1, 1, 1, 1, 1,
0.6190858, -0.3305097, 2.284786, 1, 1, 1, 1, 1,
0.6200089, 1.791767, 0.672038, 1, 1, 1, 1, 1,
0.620475, -2.112741, 3.291838, 1, 1, 1, 1, 1,
0.6214259, -2.133817, 2.852526, 0, 0, 1, 1, 1,
0.6233274, 0.4077616, -0.24886, 1, 0, 0, 1, 1,
0.6241105, 0.01655291, 2.412695, 1, 0, 0, 1, 1,
0.6265689, -0.132157, 1.025866, 1, 0, 0, 1, 1,
0.6271091, -0.5896835, 1.766452, 1, 0, 0, 1, 1,
0.6278841, 0.9467981, 1.015093, 1, 0, 0, 1, 1,
0.6282461, 0.133371, 1.975351, 0, 0, 0, 1, 1,
0.630178, -0.1389462, 1.525354, 0, 0, 0, 1, 1,
0.6303096, 0.04613531, 0.9080467, 0, 0, 0, 1, 1,
0.6323825, -0.5439825, 1.755073, 0, 0, 0, 1, 1,
0.635132, 1.936362, 1.472005, 0, 0, 0, 1, 1,
0.6358624, -1.056912, 2.849073, 0, 0, 0, 1, 1,
0.6358998, 0.4841532, 0.5233247, 0, 0, 0, 1, 1,
0.6399049, 1.130642, 1.206293, 1, 1, 1, 1, 1,
0.644201, -0.006197708, -0.5761397, 1, 1, 1, 1, 1,
0.6654492, -0.5789918, 2.853991, 1, 1, 1, 1, 1,
0.6673551, -0.5717115, 2.367188, 1, 1, 1, 1, 1,
0.6714205, -0.188103, 1.415983, 1, 1, 1, 1, 1,
0.6734455, 0.556947, 1.010488, 1, 1, 1, 1, 1,
0.6779906, -1.075066, 2.389677, 1, 1, 1, 1, 1,
0.6789212, 0.4355691, 0.6916931, 1, 1, 1, 1, 1,
0.6790668, 0.1792979, 0.8824888, 1, 1, 1, 1, 1,
0.6795117, -1.253699, 3.185575, 1, 1, 1, 1, 1,
0.6837193, 0.2840082, 0.5766178, 1, 1, 1, 1, 1,
0.6876284, -1.23045, 1.414846, 1, 1, 1, 1, 1,
0.6876543, -0.406554, 3.281197, 1, 1, 1, 1, 1,
0.6915377, 0.6835612, -0.6655008, 1, 1, 1, 1, 1,
0.6946976, 0.3499766, 2.467246, 1, 1, 1, 1, 1,
0.7020031, 0.3713166, 1.957213, 0, 0, 1, 1, 1,
0.7052125, 0.3304795, -0.2406173, 1, 0, 0, 1, 1,
0.7097469, 0.4646651, 0.2037427, 1, 0, 0, 1, 1,
0.7103908, 0.114163, 1.786075, 1, 0, 0, 1, 1,
0.7114915, 0.7194882, -0.4391829, 1, 0, 0, 1, 1,
0.7244734, 0.6843287, 0.2272306, 1, 0, 0, 1, 1,
0.7264708, -0.5641357, 3.026239, 0, 0, 0, 1, 1,
0.7300759, 0.2823553, 1.406111, 0, 0, 0, 1, 1,
0.7304186, 1.051439, 0.9026334, 0, 0, 0, 1, 1,
0.730534, 0.7927308, -0.4422278, 0, 0, 0, 1, 1,
0.737738, -0.3311463, 3.21171, 0, 0, 0, 1, 1,
0.7382762, 0.2629043, 1.312432, 0, 0, 0, 1, 1,
0.7398292, -0.4235536, 2.25857, 0, 0, 0, 1, 1,
0.7401779, -1.274869, 3.86606, 1, 1, 1, 1, 1,
0.7410868, -1.748388, 3.675719, 1, 1, 1, 1, 1,
0.744517, -0.3585196, 0.7925131, 1, 1, 1, 1, 1,
0.7448786, -1.206854, 2.921991, 1, 1, 1, 1, 1,
0.7467963, -1.457105, 2.738509, 1, 1, 1, 1, 1,
0.7491316, -0.140406, 1.444649, 1, 1, 1, 1, 1,
0.7555428, 0.7850583, 2.059481, 1, 1, 1, 1, 1,
0.7560653, -1.726035, 3.541479, 1, 1, 1, 1, 1,
0.7577413, 0.9033978, 1.387788, 1, 1, 1, 1, 1,
0.7616483, -0.6426424, 1.014269, 1, 1, 1, 1, 1,
0.7618622, -1.130083, 2.531914, 1, 1, 1, 1, 1,
0.7660403, -0.7162665, 1.305076, 1, 1, 1, 1, 1,
0.7665738, 1.065199, 0.569304, 1, 1, 1, 1, 1,
0.7684688, -0.4853863, 2.847337, 1, 1, 1, 1, 1,
0.7688261, -0.04694918, 2.368968, 1, 1, 1, 1, 1,
0.7702888, -1.09529, 2.264639, 0, 0, 1, 1, 1,
0.7823787, 0.5049968, -0.03268884, 1, 0, 0, 1, 1,
0.7866102, 1.687947, -0.1224271, 1, 0, 0, 1, 1,
0.795699, -0.2045699, 2.934141, 1, 0, 0, 1, 1,
0.7985201, -0.889572, 2.094775, 1, 0, 0, 1, 1,
0.8146545, 0.4694061, 1.123183, 1, 0, 0, 1, 1,
0.8146774, 0.6222954, 1.505363, 0, 0, 0, 1, 1,
0.8177593, 0.6076118, 1.976879, 0, 0, 0, 1, 1,
0.8187763, 0.9379076, 0.6904562, 0, 0, 0, 1, 1,
0.8191803, 0.1792164, 1.938517, 0, 0, 0, 1, 1,
0.8238687, 0.5431889, 0.460186, 0, 0, 0, 1, 1,
0.8301035, -0.8671357, 4.042186, 0, 0, 0, 1, 1,
0.8306956, 1.075611, 1.360223, 0, 0, 0, 1, 1,
0.8312837, 2.896327, 0.2569775, 1, 1, 1, 1, 1,
0.8338332, -0.6930129, 3.106753, 1, 1, 1, 1, 1,
0.8373636, 0.5363384, -0.939122, 1, 1, 1, 1, 1,
0.8385077, 0.7865245, 2.644801, 1, 1, 1, 1, 1,
0.8390834, 1.730229, -0.06006717, 1, 1, 1, 1, 1,
0.8408285, -0.4213036, 2.529296, 1, 1, 1, 1, 1,
0.8447545, -0.595329, 1.011939, 1, 1, 1, 1, 1,
0.845929, -0.1175659, 3.539522, 1, 1, 1, 1, 1,
0.8467213, 0.07377621, 0.07595941, 1, 1, 1, 1, 1,
0.8508981, -0.7251229, 1.93848, 1, 1, 1, 1, 1,
0.8522807, 0.6459433, 0.8570804, 1, 1, 1, 1, 1,
0.8525524, 0.5574236, 0.934849, 1, 1, 1, 1, 1,
0.861729, -1.143188, 1.142099, 1, 1, 1, 1, 1,
0.8696774, 0.1586736, 0.8527219, 1, 1, 1, 1, 1,
0.8745608, 2.123338, 0.7850782, 1, 1, 1, 1, 1,
0.8791376, 1.141191, 0.8650413, 0, 0, 1, 1, 1,
0.8806735, -0.5622437, 2.09081, 1, 0, 0, 1, 1,
0.8815045, 1.572476, -6.889818e-06, 1, 0, 0, 1, 1,
0.8835916, 0.6875259, -0.01694982, 1, 0, 0, 1, 1,
0.8847437, -1.204733, 2.216541, 1, 0, 0, 1, 1,
0.8876442, -1.006142, 3.129283, 1, 0, 0, 1, 1,
0.8950132, 0.343071, 2.310458, 0, 0, 0, 1, 1,
0.8968127, 0.4742625, -0.836382, 0, 0, 0, 1, 1,
0.9043053, -0.277883, 3.497038, 0, 0, 0, 1, 1,
0.9047311, 1.502998, 0.4375621, 0, 0, 0, 1, 1,
0.9072483, 0.4320877, 1.765765, 0, 0, 0, 1, 1,
0.9088849, 0.4171054, 1.088695, 0, 0, 0, 1, 1,
0.910983, -1.611955, 3.698786, 0, 0, 0, 1, 1,
0.9171179, 0.4817153, 0.9479799, 1, 1, 1, 1, 1,
0.9186885, 0.5153086, 0.5260676, 1, 1, 1, 1, 1,
0.9190122, 0.2630675, 0.3104646, 1, 1, 1, 1, 1,
0.9197519, 0.6391024, 0.7421518, 1, 1, 1, 1, 1,
0.9262232, 0.4310419, 1.219484, 1, 1, 1, 1, 1,
0.9309825, 1.073218, 1.940165, 1, 1, 1, 1, 1,
0.9312574, 0.1280842, 1.175529, 1, 1, 1, 1, 1,
0.9314599, -0.5086998, 1.161007, 1, 1, 1, 1, 1,
0.9433012, -0.352212, -0.8280254, 1, 1, 1, 1, 1,
0.9451884, -2.230549, 2.196838, 1, 1, 1, 1, 1,
0.9462044, 0.6159979, 1.969778, 1, 1, 1, 1, 1,
0.9463826, -0.2096634, 1.141627, 1, 1, 1, 1, 1,
0.9521548, 0.9616858, 0.917378, 1, 1, 1, 1, 1,
0.9572501, 0.2697899, -1.214333, 1, 1, 1, 1, 1,
0.9593161, 0.04287847, 2.846058, 1, 1, 1, 1, 1,
0.9709764, -0.02688454, 1.77161, 0, 0, 1, 1, 1,
0.9793417, 0.3196945, 2.935867, 1, 0, 0, 1, 1,
0.981163, 0.7222439, -0.5120251, 1, 0, 0, 1, 1,
0.9889416, -0.1548031, 1.105861, 1, 0, 0, 1, 1,
0.9930563, -1.881206, 1.769655, 1, 0, 0, 1, 1,
1.000636, -1.258317, 1.788261, 1, 0, 0, 1, 1,
1.00606, -1.213894, 1.815696, 0, 0, 0, 1, 1,
1.00911, 0.2557059, 1.413486, 0, 0, 0, 1, 1,
1.009993, -1.22924, 2.796809, 0, 0, 0, 1, 1,
1.013141, -1.625437, 4.409236, 0, 0, 0, 1, 1,
1.013327, -0.0776625, 1.898458, 0, 0, 0, 1, 1,
1.019534, 1.012668, 2.799632, 0, 0, 0, 1, 1,
1.019654, -1.034837, 1.059316, 0, 0, 0, 1, 1,
1.019684, -0.06105824, 3.100144, 1, 1, 1, 1, 1,
1.021426, -0.9027882, 0.1942132, 1, 1, 1, 1, 1,
1.02235, 0.8790195, 0.6376204, 1, 1, 1, 1, 1,
1.0376, 0.02533581, 0.7300202, 1, 1, 1, 1, 1,
1.045913, -0.8238562, 2.108549, 1, 1, 1, 1, 1,
1.046207, -1.276256, 2.768569, 1, 1, 1, 1, 1,
1.046522, -0.6679707, 0.9087187, 1, 1, 1, 1, 1,
1.049631, 1.168718, 0.3694294, 1, 1, 1, 1, 1,
1.060683, -1.105255, 1.569939, 1, 1, 1, 1, 1,
1.068674, 1.726644, -0.7178278, 1, 1, 1, 1, 1,
1.069313, 0.9759784, 0.7421691, 1, 1, 1, 1, 1,
1.073562, 0.1612751, 2.645634, 1, 1, 1, 1, 1,
1.074338, -1.071875, -0.4198002, 1, 1, 1, 1, 1,
1.075876, -2.741243, 1.640062, 1, 1, 1, 1, 1,
1.087864, -0.5654284, 2.508425, 1, 1, 1, 1, 1,
1.09092, 0.1688315, 1.91673, 0, 0, 1, 1, 1,
1.092591, -1.882833, 2.451158, 1, 0, 0, 1, 1,
1.093114, 1.4506, 1.916001, 1, 0, 0, 1, 1,
1.096421, -0.4523523, 2.411566, 1, 0, 0, 1, 1,
1.098179, 0.2293474, 1.327672, 1, 0, 0, 1, 1,
1.098911, -1.456701, 3.510292, 1, 0, 0, 1, 1,
1.105908, 0.7790045, 1.073671, 0, 0, 0, 1, 1,
1.109895, 0.1185866, 1.095265, 0, 0, 0, 1, 1,
1.114994, -0.5036412, 1.754565, 0, 0, 0, 1, 1,
1.115234, -0.9390758, 1.891472, 0, 0, 0, 1, 1,
1.127549, -1.570189, 2.522333, 0, 0, 0, 1, 1,
1.132837, -0.9908434, 2.867923, 0, 0, 0, 1, 1,
1.134463, -0.5100291, 1.174273, 0, 0, 0, 1, 1,
1.146823, -0.6605377, 3.051764, 1, 1, 1, 1, 1,
1.151219, -0.2404329, 1.17682, 1, 1, 1, 1, 1,
1.153873, 0.9450511, -0.2215648, 1, 1, 1, 1, 1,
1.165882, 0.5115323, 0.48782, 1, 1, 1, 1, 1,
1.166779, -1.026422, 2.970026, 1, 1, 1, 1, 1,
1.180241, -0.6304034, 3.995574, 1, 1, 1, 1, 1,
1.189074, -0.2551883, 0.803148, 1, 1, 1, 1, 1,
1.189706, 0.01847415, 1.481372, 1, 1, 1, 1, 1,
1.199367, 1.666239, -1.125954, 1, 1, 1, 1, 1,
1.222726, -1.640498, 3.437627, 1, 1, 1, 1, 1,
1.236952, 0.5300087, 1.857303, 1, 1, 1, 1, 1,
1.244897, -0.1092934, 1.018878, 1, 1, 1, 1, 1,
1.249503, -0.02444537, 2.279045, 1, 1, 1, 1, 1,
1.250767, -0.255049, 3.932143, 1, 1, 1, 1, 1,
1.2631, -0.2588408, 3.114856, 1, 1, 1, 1, 1,
1.263911, -1.827039, 1.984458, 0, 0, 1, 1, 1,
1.264586, -0.1720468, 0.4550561, 1, 0, 0, 1, 1,
1.267576, -0.1378876, 3.662262, 1, 0, 0, 1, 1,
1.27119, -0.6574959, 2.384449, 1, 0, 0, 1, 1,
1.284096, -0.4219515, 2.478112, 1, 0, 0, 1, 1,
1.29312, -1.691742, 3.167964, 1, 0, 0, 1, 1,
1.297601, -1.782548, 1.139321, 0, 0, 0, 1, 1,
1.306664, 0.9735658, 0.05616256, 0, 0, 0, 1, 1,
1.320201, -0.1849208, 2.804336, 0, 0, 0, 1, 1,
1.331588, -0.1901868, 2.508795, 0, 0, 0, 1, 1,
1.338251, -0.4461581, 2.324077, 0, 0, 0, 1, 1,
1.341661, -1.001589, 3.446421, 0, 0, 0, 1, 1,
1.342627, -0.1279158, 1.156092, 0, 0, 0, 1, 1,
1.35137, 0.2347068, 1.112003, 1, 1, 1, 1, 1,
1.351427, -0.1236028, -0.2841594, 1, 1, 1, 1, 1,
1.351565, 0.2124191, -0.05294633, 1, 1, 1, 1, 1,
1.353329, -0.770385, 2.487321, 1, 1, 1, 1, 1,
1.354506, 1.558415, 0.6577187, 1, 1, 1, 1, 1,
1.356088, -0.3142445, 1.840366, 1, 1, 1, 1, 1,
1.359295, -0.8146251, 2.287429, 1, 1, 1, 1, 1,
1.36018, -0.3376059, 3.164911, 1, 1, 1, 1, 1,
1.369163, 1.485858, 0.1486719, 1, 1, 1, 1, 1,
1.39003, -1.680979, 2.839597, 1, 1, 1, 1, 1,
1.401178, 1.104423, 1.058595, 1, 1, 1, 1, 1,
1.40143, -2.088931, 1.16506, 1, 1, 1, 1, 1,
1.407063, -0.1373257, 1.360193, 1, 1, 1, 1, 1,
1.408851, 1.677034, 2.390495, 1, 1, 1, 1, 1,
1.418856, 0.8055906, 1.513376, 1, 1, 1, 1, 1,
1.425181, -0.5680234, 0.2683488, 0, 0, 1, 1, 1,
1.426588, 0.8058413, 0.9502153, 1, 0, 0, 1, 1,
1.432119, 0.7021761, 2.612313, 1, 0, 0, 1, 1,
1.438151, 1.557577, 0.5335303, 1, 0, 0, 1, 1,
1.44543, -0.6355503, 3.430452, 1, 0, 0, 1, 1,
1.447316, 0.157337, 1.683121, 1, 0, 0, 1, 1,
1.450432, 1.050341, 1.08029, 0, 0, 0, 1, 1,
1.456637, 0.2978415, 1.426105, 0, 0, 0, 1, 1,
1.463169, 0.2100247, 1.221323, 0, 0, 0, 1, 1,
1.467683, -1.492932, 3.102698, 0, 0, 0, 1, 1,
1.480463, 0.7354202, 0.8668027, 0, 0, 0, 1, 1,
1.484826, -0.838865, 1.490989, 0, 0, 0, 1, 1,
1.485157, 0.5468598, 1.469326, 0, 0, 0, 1, 1,
1.49341, 0.4438752, 0.7314884, 1, 1, 1, 1, 1,
1.49643, -1.334277, 1.179245, 1, 1, 1, 1, 1,
1.506915, -0.395069, 1.902343, 1, 1, 1, 1, 1,
1.51075, -2.6105, 2.85335, 1, 1, 1, 1, 1,
1.515712, -0.7310662, 2.797045, 1, 1, 1, 1, 1,
1.523508, -0.320149, 1.366958, 1, 1, 1, 1, 1,
1.525476, -0.7037041, 1.278974, 1, 1, 1, 1, 1,
1.535917, 1.849001, 0.5222012, 1, 1, 1, 1, 1,
1.562395, 0.529809, 1.301218, 1, 1, 1, 1, 1,
1.566532, -0.2065273, 0.9535592, 1, 1, 1, 1, 1,
1.585553, -1.886509, 1.65288, 1, 1, 1, 1, 1,
1.588468, -1.687749, 1.121084, 1, 1, 1, 1, 1,
1.592713, 0.8015878, 0.9753931, 1, 1, 1, 1, 1,
1.597441, 3.344609, -1.580248, 1, 1, 1, 1, 1,
1.597803, -1.789502, 2.744132, 1, 1, 1, 1, 1,
1.598544, -2.140143, 3.299727, 0, 0, 1, 1, 1,
1.637683, 0.5137594, 1.418932, 1, 0, 0, 1, 1,
1.645696, -2.072169, 0.8064146, 1, 0, 0, 1, 1,
1.654973, -0.7885461, 2.338326, 1, 0, 0, 1, 1,
1.656879, -0.1531456, 2.011392, 1, 0, 0, 1, 1,
1.671387, -1.057392, -0.2042585, 1, 0, 0, 1, 1,
1.671996, -0.06838398, 3.130363, 0, 0, 0, 1, 1,
1.672153, 0.5929469, 1.89282, 0, 0, 0, 1, 1,
1.680252, -0.847701, 2.242038, 0, 0, 0, 1, 1,
1.681883, 0.570316, 1.006316, 0, 0, 0, 1, 1,
1.725548, -0.6753305, 3.236175, 0, 0, 0, 1, 1,
1.734025, 0.162369, 0.6211069, 0, 0, 0, 1, 1,
1.736614, 0.8192047, 1.007247, 0, 0, 0, 1, 1,
1.760579, -1.61805, 1.615571, 1, 1, 1, 1, 1,
1.788489, 0.770631, 1.844526, 1, 1, 1, 1, 1,
1.807287, -0.9673781, 2.826168, 1, 1, 1, 1, 1,
1.813787, -0.7146034, 2.469867, 1, 1, 1, 1, 1,
1.860245, 0.5731072, 0.4545058, 1, 1, 1, 1, 1,
1.862011, 0.7687528, 0.4268559, 1, 1, 1, 1, 1,
1.90096, 0.9866761, 1.339702, 1, 1, 1, 1, 1,
1.909917, 1.011699, -0.6815838, 1, 1, 1, 1, 1,
1.954597, 0.6012794, 1.494904, 1, 1, 1, 1, 1,
1.956995, -0.7585514, 3.797628, 1, 1, 1, 1, 1,
1.973917, -0.04776563, 2.151803, 1, 1, 1, 1, 1,
2.045743, 2.059102, 2.441937, 1, 1, 1, 1, 1,
2.058405, 1.638845, 0.8741852, 1, 1, 1, 1, 1,
2.066934, 0.1605246, 2.185852, 1, 1, 1, 1, 1,
2.067074, -1.363318, 2.51634, 1, 1, 1, 1, 1,
2.083457, -0.601517, 0.613269, 0, 0, 1, 1, 1,
2.109159, 0.4676946, 1.268236, 1, 0, 0, 1, 1,
2.14398, -2.184106, 1.950238, 1, 0, 0, 1, 1,
2.175605, 0.3841158, 1.208511, 1, 0, 0, 1, 1,
2.24118, -0.8775609, 2.315563, 1, 0, 0, 1, 1,
2.287949, 0.4612711, 0.6696809, 1, 0, 0, 1, 1,
2.290323, 1.190511, 2.89743, 0, 0, 0, 1, 1,
2.334819, 2.986303, -0.2030382, 0, 0, 0, 1, 1,
2.351045, 0.08375815, 1.387936, 0, 0, 0, 1, 1,
2.388122, -0.7725532, 2.007705, 0, 0, 0, 1, 1,
2.396087, 2.02538, 1.469146, 0, 0, 0, 1, 1,
2.428904, -0.4617877, 2.209717, 0, 0, 0, 1, 1,
2.463216, -0.3118676, 2.715422, 0, 0, 0, 1, 1,
2.476009, 0.6496668, 1.314207, 1, 1, 1, 1, 1,
2.503504, -1.035112, 0.1564411, 1, 1, 1, 1, 1,
2.553548, -0.9971867, 1.907444, 1, 1, 1, 1, 1,
2.621597, 0.391367, 2.588595, 1, 1, 1, 1, 1,
2.691749, -0.5843038, 2.235885, 1, 1, 1, 1, 1,
2.883367, -1.148185, 1.522881, 1, 1, 1, 1, 1,
3.046499, 0.867666, 0.699048, 1, 1, 1, 1, 1
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
var radius = 9.362005;
var distance = 32.88365;
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
mvMatrix.translate( 0.07762766, -0.1688528, 0.06216669 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.88365);
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
