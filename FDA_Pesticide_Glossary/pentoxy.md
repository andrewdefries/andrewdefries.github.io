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
-3.223856, 0.6050193, -2.211753, 1, 0, 0, 1,
-2.803559, 0.7830608, -2.791725, 1, 0.007843138, 0, 1,
-2.781171, -1.118812, -0.4860676, 1, 0.01176471, 0, 1,
-2.608193, -0.1197583, -0.8524647, 1, 0.01960784, 0, 1,
-2.576507, -0.02042322, -1.485471, 1, 0.02352941, 0, 1,
-2.49742, 0.3996354, -1.813462, 1, 0.03137255, 0, 1,
-2.474483, 0.01559819, -1.665655, 1, 0.03529412, 0, 1,
-2.398775, 0.03389404, -2.74862, 1, 0.04313726, 0, 1,
-2.390391, 1.625304, -1.317062, 1, 0.04705882, 0, 1,
-2.390115, 0.8932301, -0.2707592, 1, 0.05490196, 0, 1,
-2.283135, -1.378303, -2.219376, 1, 0.05882353, 0, 1,
-2.261264, -1.747979, -0.8714144, 1, 0.06666667, 0, 1,
-2.188826, -0.515833, -2.036994, 1, 0.07058824, 0, 1,
-2.169448, -0.4695796, -3.2522, 1, 0.07843138, 0, 1,
-2.128592, 0.7312291, -1.631035, 1, 0.08235294, 0, 1,
-2.121738, -1.222758, -2.266854, 1, 0.09019608, 0, 1,
-2.097422, -0.3579568, -3.023644, 1, 0.09411765, 0, 1,
-2.067142, 0.9149413, 1.398426, 1, 0.1019608, 0, 1,
-2.052639, -1.071455, -2.910194, 1, 0.1098039, 0, 1,
-2.038384, -0.2248544, -1.06618, 1, 0.1137255, 0, 1,
-2.003168, -1.660176, -1.152973, 1, 0.1215686, 0, 1,
-2.001021, 1.086091, 0.2044297, 1, 0.1254902, 0, 1,
-1.99586, 0.5792677, -0.3597907, 1, 0.1333333, 0, 1,
-1.990016, 0.6457459, -1.282875, 1, 0.1372549, 0, 1,
-1.964205, -0.1323457, -1.761399, 1, 0.145098, 0, 1,
-1.955553, 0.3985504, -1.933224, 1, 0.1490196, 0, 1,
-1.934772, 0.5375038, 0.08256187, 1, 0.1568628, 0, 1,
-1.915782, -0.4586676, -2.777023, 1, 0.1607843, 0, 1,
-1.892927, 0.07263789, -2.662142, 1, 0.1686275, 0, 1,
-1.886855, -0.3986124, -1.409307, 1, 0.172549, 0, 1,
-1.850799, 1.422704, -0.5886711, 1, 0.1803922, 0, 1,
-1.849972, 0.8060458, 0.2499842, 1, 0.1843137, 0, 1,
-1.834739, 0.1609852, -2.295097, 1, 0.1921569, 0, 1,
-1.832117, -2.356937, -1.412546, 1, 0.1960784, 0, 1,
-1.825084, -1.168864, -2.367821, 1, 0.2039216, 0, 1,
-1.796917, 1.935507, -1.863522, 1, 0.2117647, 0, 1,
-1.788284, 1.610222, -0.3729888, 1, 0.2156863, 0, 1,
-1.759549, -1.551965, -2.824833, 1, 0.2235294, 0, 1,
-1.730704, 2.538593, -0.8367813, 1, 0.227451, 0, 1,
-1.723357, -0.6102742, -2.575143, 1, 0.2352941, 0, 1,
-1.710361, 0.4654691, -2.493991, 1, 0.2392157, 0, 1,
-1.700276, 0.1461346, -0.7222784, 1, 0.2470588, 0, 1,
-1.686611, 1.257852, -0.4073321, 1, 0.2509804, 0, 1,
-1.680059, 0.3402444, 0.5481422, 1, 0.2588235, 0, 1,
-1.677429, -2.094985, -1.968146, 1, 0.2627451, 0, 1,
-1.654278, 0.7895795, -0.132507, 1, 0.2705882, 0, 1,
-1.648802, -1.12481, -1.904904, 1, 0.2745098, 0, 1,
-1.636397, -0.5224954, -0.8654785, 1, 0.282353, 0, 1,
-1.62986, 1.054935, -1.383203, 1, 0.2862745, 0, 1,
-1.629255, 0.1906339, -1.734462, 1, 0.2941177, 0, 1,
-1.627615, 0.6385207, -1.904997, 1, 0.3019608, 0, 1,
-1.59896, 0.3164064, -0.1072625, 1, 0.3058824, 0, 1,
-1.597304, -0.7174123, -1.716153, 1, 0.3137255, 0, 1,
-1.586535, 0.138782, -1.335253, 1, 0.3176471, 0, 1,
-1.580431, -1.330129, -3.29273, 1, 0.3254902, 0, 1,
-1.57397, 0.01259757, -1.498385, 1, 0.3294118, 0, 1,
-1.559796, 0.4932705, -3.514317, 1, 0.3372549, 0, 1,
-1.555447, -0.4962794, -2.218137, 1, 0.3411765, 0, 1,
-1.547906, -0.9254606, -2.518097, 1, 0.3490196, 0, 1,
-1.525386, 0.3009397, -3.425233, 1, 0.3529412, 0, 1,
-1.524056, 1.868837, -0.6826711, 1, 0.3607843, 0, 1,
-1.522011, -0.2161938, -0.474605, 1, 0.3647059, 0, 1,
-1.517817, -0.5007694, -2.093426, 1, 0.372549, 0, 1,
-1.515473, 0.1971177, -1.770681, 1, 0.3764706, 0, 1,
-1.502178, -1.275292, -1.426532, 1, 0.3843137, 0, 1,
-1.496277, -0.7941366, -3.288496, 1, 0.3882353, 0, 1,
-1.491589, -1.328638, -2.011847, 1, 0.3960784, 0, 1,
-1.47731, 0.2595735, -0.4247341, 1, 0.4039216, 0, 1,
-1.473652, 0.0759102, -3.865839, 1, 0.4078431, 0, 1,
-1.465668, 0.09961405, -1.181007, 1, 0.4156863, 0, 1,
-1.462711, 0.4057848, -1.538661, 1, 0.4196078, 0, 1,
-1.461437, -0.170251, -1.93002, 1, 0.427451, 0, 1,
-1.450099, 0.9893122, -1.988876, 1, 0.4313726, 0, 1,
-1.446618, 1.490588, 1.498664, 1, 0.4392157, 0, 1,
-1.443758, 0.2405326, -1.996424, 1, 0.4431373, 0, 1,
-1.439911, 0.2903165, -2.004152, 1, 0.4509804, 0, 1,
-1.437575, 0.1132935, -1.771993, 1, 0.454902, 0, 1,
-1.412458, 0.4594734, -0.622427, 1, 0.4627451, 0, 1,
-1.412166, 0.1695905, -2.001807, 1, 0.4666667, 0, 1,
-1.394616, -1.805181, -2.583966, 1, 0.4745098, 0, 1,
-1.393522, -2.637415, -2.273323, 1, 0.4784314, 0, 1,
-1.38383, -0.7578754, 0.1405236, 1, 0.4862745, 0, 1,
-1.381886, -0.7519118, -1.930309, 1, 0.4901961, 0, 1,
-1.373607, -0.2851908, 0.5620242, 1, 0.4980392, 0, 1,
-1.373512, -0.3102131, -3.082374, 1, 0.5058824, 0, 1,
-1.369818, 0.9859373, -1.172815, 1, 0.509804, 0, 1,
-1.36975, 0.5662419, -1.677626, 1, 0.5176471, 0, 1,
-1.349777, -0.9172462, -0.4946375, 1, 0.5215687, 0, 1,
-1.340881, -0.2255254, -3.211426, 1, 0.5294118, 0, 1,
-1.340043, 0.3754549, -3.363041, 1, 0.5333334, 0, 1,
-1.338235, -0.6009115, -2.460814, 1, 0.5411765, 0, 1,
-1.337728, 0.0530689, -3.034125, 1, 0.5450981, 0, 1,
-1.32976, -1.231359, -2.173958, 1, 0.5529412, 0, 1,
-1.323507, -1.322374, -4.145346, 1, 0.5568628, 0, 1,
-1.294157, -0.2975733, -3.80937, 1, 0.5647059, 0, 1,
-1.293653, -0.9560527, -3.669404, 1, 0.5686275, 0, 1,
-1.288539, -1.248179, -2.810773, 1, 0.5764706, 0, 1,
-1.277829, -1.045182, -2.155508, 1, 0.5803922, 0, 1,
-1.270516, 0.006424771, -1.25598, 1, 0.5882353, 0, 1,
-1.269478, -0.6213267, -3.351601, 1, 0.5921569, 0, 1,
-1.267199, 1.664169, -1.01981, 1, 0.6, 0, 1,
-1.263851, -0.7770043, -2.495715, 1, 0.6078432, 0, 1,
-1.25813, -0.8494315, -1.696957, 1, 0.6117647, 0, 1,
-1.245687, -0.1725788, -1.968627, 1, 0.6196079, 0, 1,
-1.24489, 1.280216, -0.4818808, 1, 0.6235294, 0, 1,
-1.240999, -0.2180142, -1.571089, 1, 0.6313726, 0, 1,
-1.239351, -0.4228036, -0.680967, 1, 0.6352941, 0, 1,
-1.234802, -0.9205772, -1.964548, 1, 0.6431373, 0, 1,
-1.232775, -0.7946523, -3.685982, 1, 0.6470588, 0, 1,
-1.228926, -1.294031, -2.811677, 1, 0.654902, 0, 1,
-1.227524, 0.8929175, -1.115074, 1, 0.6588235, 0, 1,
-1.227305, 1.812303, -0.294688, 1, 0.6666667, 0, 1,
-1.226226, -1.320438, -3.048702, 1, 0.6705883, 0, 1,
-1.22523, -1.354041, -2.369271, 1, 0.6784314, 0, 1,
-1.223884, -0.3917932, -2.24026, 1, 0.682353, 0, 1,
-1.221225, 0.7590141, -0.4929937, 1, 0.6901961, 0, 1,
-1.216733, 0.8283003, 1.024915, 1, 0.6941177, 0, 1,
-1.213656, 0.8027734, -1.800598, 1, 0.7019608, 0, 1,
-1.212694, 0.1531316, -1.441238, 1, 0.7098039, 0, 1,
-1.196552, 0.2188656, -1.460747, 1, 0.7137255, 0, 1,
-1.193977, 1.231243, -0.7987409, 1, 0.7215686, 0, 1,
-1.191283, 0.1850641, -2.614014, 1, 0.7254902, 0, 1,
-1.189851, -0.3375399, -2.652882, 1, 0.7333333, 0, 1,
-1.186926, -0.7427214, -2.893583, 1, 0.7372549, 0, 1,
-1.174444, -1.301659, -2.363735, 1, 0.7450981, 0, 1,
-1.172298, 1.50523, -0.2362286, 1, 0.7490196, 0, 1,
-1.169044, -2.180661, -4.162718, 1, 0.7568628, 0, 1,
-1.16082, -1.157774, -3.272526, 1, 0.7607843, 0, 1,
-1.159363, 0.1868564, -0.3222375, 1, 0.7686275, 0, 1,
-1.157814, -0.9764566, -3.545432, 1, 0.772549, 0, 1,
-1.145629, 0.03554881, -1.793498, 1, 0.7803922, 0, 1,
-1.145096, 0.9243929, -2.371319, 1, 0.7843137, 0, 1,
-1.140714, 1.379427, -2.047003, 1, 0.7921569, 0, 1,
-1.114188, 0.476951, -1.864954, 1, 0.7960784, 0, 1,
-1.110733, -0.711746, -1.26388, 1, 0.8039216, 0, 1,
-1.109589, 0.3317153, 0.1620956, 1, 0.8117647, 0, 1,
-1.103325, 1.650438, -1.444771, 1, 0.8156863, 0, 1,
-1.102553, -0.9062614, -2.618103, 1, 0.8235294, 0, 1,
-1.102551, 0.0729472, 0.1426968, 1, 0.827451, 0, 1,
-1.102413, 0.9465653, -2.011649, 1, 0.8352941, 0, 1,
-1.102387, 0.114734, -1.863442, 1, 0.8392157, 0, 1,
-1.102168, 0.2271761, -1.746345, 1, 0.8470588, 0, 1,
-1.101557, 0.4748927, -0.006566696, 1, 0.8509804, 0, 1,
-1.094961, 0.7737141, -1.581801, 1, 0.8588235, 0, 1,
-1.092044, -0.7195274, -2.480689, 1, 0.8627451, 0, 1,
-1.088027, 1.167694, -0.4758356, 1, 0.8705882, 0, 1,
-1.079787, -0.7190948, -1.34917, 1, 0.8745098, 0, 1,
-1.073488, -1.077312, -3.475688, 1, 0.8823529, 0, 1,
-1.068917, -2.84884, 0.3537916, 1, 0.8862745, 0, 1,
-1.067272, 0.2316861, 0.8140329, 1, 0.8941177, 0, 1,
-1.066131, -1.806399, -2.443421, 1, 0.8980392, 0, 1,
-1.061395, -0.8925425, -2.251691, 1, 0.9058824, 0, 1,
-1.059262, 0.4051321, -1.66985, 1, 0.9137255, 0, 1,
-1.046779, -0.3577017, -2.495841, 1, 0.9176471, 0, 1,
-1.039975, 0.3313391, -1.984771, 1, 0.9254902, 0, 1,
-1.03994, 0.4446893, -0.3445958, 1, 0.9294118, 0, 1,
-1.028635, -0.8268881, -0.8331295, 1, 0.9372549, 0, 1,
-1.020808, -0.3995087, -3.76699, 1, 0.9411765, 0, 1,
-1.015652, -0.6459703, -3.13208, 1, 0.9490196, 0, 1,
-1.014227, -0.8819607, -2.216255, 1, 0.9529412, 0, 1,
-1.000918, -0.3889514, -1.503821, 1, 0.9607843, 0, 1,
-0.994997, -1.284012, -1.54377, 1, 0.9647059, 0, 1,
-0.990688, 0.1331469, -0.06084782, 1, 0.972549, 0, 1,
-0.9854643, -0.247677, -2.037603, 1, 0.9764706, 0, 1,
-0.9849002, 1.647251, -1.216746, 1, 0.9843137, 0, 1,
-0.9777777, -2.357302, -3.171227, 1, 0.9882353, 0, 1,
-0.9712112, -2.054608, -3.938583, 1, 0.9960784, 0, 1,
-0.9623218, 0.6009767, -2.080135, 0.9960784, 1, 0, 1,
-0.9620513, 0.3208619, -1.210313, 0.9921569, 1, 0, 1,
-0.9583295, 0.4131229, -1.583012, 0.9843137, 1, 0, 1,
-0.9575696, 0.3404576, -1.027585, 0.9803922, 1, 0, 1,
-0.9553778, 0.05414504, -1.721827, 0.972549, 1, 0, 1,
-0.9530956, -1.406384, -3.377504, 0.9686275, 1, 0, 1,
-0.9510474, -0.4531949, -1.507901, 0.9607843, 1, 0, 1,
-0.9490902, 0.1943194, -0.4002025, 0.9568627, 1, 0, 1,
-0.9447711, -0.4101405, 0.3302608, 0.9490196, 1, 0, 1,
-0.9434319, 0.05066966, -2.266014, 0.945098, 1, 0, 1,
-0.9319358, -0.7498718, -3.338615, 0.9372549, 1, 0, 1,
-0.9316025, -0.4248784, -2.066775, 0.9333333, 1, 0, 1,
-0.9299039, -0.5223099, -1.292845, 0.9254902, 1, 0, 1,
-0.9259681, -0.07357843, -2.266707, 0.9215686, 1, 0, 1,
-0.9209592, 0.5846104, -0.4992675, 0.9137255, 1, 0, 1,
-0.9071158, 0.9472581, -0.396549, 0.9098039, 1, 0, 1,
-0.9065015, -1.143405, -3.107492, 0.9019608, 1, 0, 1,
-0.9039154, -1.10508, -3.353189, 0.8941177, 1, 0, 1,
-0.9038984, -0.4485097, -2.930638, 0.8901961, 1, 0, 1,
-0.9004087, -0.1332045, -2.063394, 0.8823529, 1, 0, 1,
-0.8991441, 0.860419, -2.658636, 0.8784314, 1, 0, 1,
-0.8913212, -0.7173749, -2.397008, 0.8705882, 1, 0, 1,
-0.8870618, 2.505637, -0.7735378, 0.8666667, 1, 0, 1,
-0.8859517, 3.144415, 1.202661, 0.8588235, 1, 0, 1,
-0.8734774, -1.411923, -6.132252, 0.854902, 1, 0, 1,
-0.8705484, -1.081727, -1.682624, 0.8470588, 1, 0, 1,
-0.8690514, 0.3352191, -1.496243, 0.8431373, 1, 0, 1,
-0.8625969, -0.05731254, -1.873422, 0.8352941, 1, 0, 1,
-0.8553044, -1.335793, -2.736356, 0.8313726, 1, 0, 1,
-0.8481865, 0.75796, -1.622667, 0.8235294, 1, 0, 1,
-0.8477107, 0.1463898, 0.9563057, 0.8196079, 1, 0, 1,
-0.8455481, -0.215765, -2.227392, 0.8117647, 1, 0, 1,
-0.8356309, -0.34231, -1.971152, 0.8078431, 1, 0, 1,
-0.8352323, 0.7705265, -0.1563295, 0.8, 1, 0, 1,
-0.8348498, 0.9243398, 0.7107775, 0.7921569, 1, 0, 1,
-0.8328779, 0.3022316, -2.584989, 0.7882353, 1, 0, 1,
-0.8328239, 0.4442398, -1.6463, 0.7803922, 1, 0, 1,
-0.8323764, 1.318026, -0.07733493, 0.7764706, 1, 0, 1,
-0.8317186, 1.097498, -1.809571, 0.7686275, 1, 0, 1,
-0.8292397, -1.881077, -3.759382, 0.7647059, 1, 0, 1,
-0.8128858, 1.455854, 1.150244, 0.7568628, 1, 0, 1,
-0.8098799, -1.600769, -4.204957, 0.7529412, 1, 0, 1,
-0.8092504, 0.632925, -0.9690809, 0.7450981, 1, 0, 1,
-0.8089353, -0.3380448, -0.2163457, 0.7411765, 1, 0, 1,
-0.8016505, 1.72288, -1.258768, 0.7333333, 1, 0, 1,
-0.8006686, 0.25521, -3.139134, 0.7294118, 1, 0, 1,
-0.7972093, -0.7236821, -2.160868, 0.7215686, 1, 0, 1,
-0.7926099, -1.141524, -3.336875, 0.7176471, 1, 0, 1,
-0.7877858, -0.08548011, -1.594125, 0.7098039, 1, 0, 1,
-0.7866887, 0.4463857, -2.262039, 0.7058824, 1, 0, 1,
-0.7861084, 0.7399734, -1.833627, 0.6980392, 1, 0, 1,
-0.7853966, 0.07320305, -1.512311, 0.6901961, 1, 0, 1,
-0.7800218, -0.03164902, -0.8026811, 0.6862745, 1, 0, 1,
-0.776246, -0.4674504, -1.337375, 0.6784314, 1, 0, 1,
-0.7739956, 1.876475, -1.346482, 0.6745098, 1, 0, 1,
-0.7691434, -2.524728, -2.594805, 0.6666667, 1, 0, 1,
-0.7685169, -0.3971765, -0.9530939, 0.6627451, 1, 0, 1,
-0.7657892, 1.090274, 0.2293912, 0.654902, 1, 0, 1,
-0.7653841, -0.2677188, -0.1764714, 0.6509804, 1, 0, 1,
-0.7618161, -1.134677, -1.6261, 0.6431373, 1, 0, 1,
-0.7553457, 0.8182654, -1.627452, 0.6392157, 1, 0, 1,
-0.7486482, 0.2702966, -3.195245, 0.6313726, 1, 0, 1,
-0.7452067, -0.8431767, -2.936171, 0.627451, 1, 0, 1,
-0.7414999, -0.3613201, -2.328502, 0.6196079, 1, 0, 1,
-0.7405762, -0.1222801, -1.764984, 0.6156863, 1, 0, 1,
-0.7319706, -0.311626, -1.753812, 0.6078432, 1, 0, 1,
-0.7289767, -2.189991, -4.568005, 0.6039216, 1, 0, 1,
-0.7208405, 1.913538, -1.978881, 0.5960785, 1, 0, 1,
-0.7166216, -0.4121498, -3.587121, 0.5882353, 1, 0, 1,
-0.7150707, -0.03620323, -2.625015, 0.5843138, 1, 0, 1,
-0.7138714, -1.199834, -1.07859, 0.5764706, 1, 0, 1,
-0.7127135, -1.211736, -2.894638, 0.572549, 1, 0, 1,
-0.7063044, 0.1179518, -3.180318, 0.5647059, 1, 0, 1,
-0.7053593, 0.5159587, 0.6164756, 0.5607843, 1, 0, 1,
-0.68935, 0.4085236, 1.644582, 0.5529412, 1, 0, 1,
-0.6870288, -1.103561, -1.74574, 0.5490196, 1, 0, 1,
-0.6847343, -1.03011, -1.732067, 0.5411765, 1, 0, 1,
-0.6836376, 0.3361963, -0.9810877, 0.5372549, 1, 0, 1,
-0.676675, -0.2279086, -1.891934, 0.5294118, 1, 0, 1,
-0.6741541, -0.3525715, -0.1099664, 0.5254902, 1, 0, 1,
-0.6734918, -0.9999953, -1.69202, 0.5176471, 1, 0, 1,
-0.671988, -0.8081903, -4.453662, 0.5137255, 1, 0, 1,
-0.67098, -0.2861481, -2.018343, 0.5058824, 1, 0, 1,
-0.6706232, 0.1178632, -0.8095807, 0.5019608, 1, 0, 1,
-0.6685331, 0.7465381, -1.624195, 0.4941176, 1, 0, 1,
-0.6681694, -0.05034118, -0.6229565, 0.4862745, 1, 0, 1,
-0.6592933, -0.6703259, -5.16954, 0.4823529, 1, 0, 1,
-0.6452673, 1.556981, -0.8516819, 0.4745098, 1, 0, 1,
-0.6437359, -1.201649, -1.69489, 0.4705882, 1, 0, 1,
-0.631628, 0.1042673, -1.316324, 0.4627451, 1, 0, 1,
-0.6311815, -1.32432, -1.144607, 0.4588235, 1, 0, 1,
-0.629257, -0.1215961, -2.68359, 0.4509804, 1, 0, 1,
-0.6280458, 0.6624764, -1.599853, 0.4470588, 1, 0, 1,
-0.6176744, 0.5698876, 0.4052964, 0.4392157, 1, 0, 1,
-0.6121773, -0.6505655, -4.156338, 0.4352941, 1, 0, 1,
-0.6085679, 0.7426692, -1.883287, 0.427451, 1, 0, 1,
-0.6039795, -1.265199, -2.896453, 0.4235294, 1, 0, 1,
-0.5993974, 0.2842109, 0.748071, 0.4156863, 1, 0, 1,
-0.5984045, 0.7308112, -0.6989314, 0.4117647, 1, 0, 1,
-0.5887475, -1.045513, -2.250154, 0.4039216, 1, 0, 1,
-0.5826447, -1.094226, -3.372023, 0.3960784, 1, 0, 1,
-0.5810897, -0.2648318, -0.859944, 0.3921569, 1, 0, 1,
-0.580987, -2.687799, -3.433805, 0.3843137, 1, 0, 1,
-0.5712122, 1.060026, -0.1394183, 0.3803922, 1, 0, 1,
-0.5666924, 0.5856061, -1.192752, 0.372549, 1, 0, 1,
-0.5652555, 0.5580245, -2.464246, 0.3686275, 1, 0, 1,
-0.5569831, 0.5112612, -0.6729732, 0.3607843, 1, 0, 1,
-0.5501813, -0.5714446, -1.691543, 0.3568628, 1, 0, 1,
-0.5485166, 0.522059, -1.629359, 0.3490196, 1, 0, 1,
-0.5466554, 0.7082395, -1.489796, 0.345098, 1, 0, 1,
-0.5464315, -3.194988, -4.495018, 0.3372549, 1, 0, 1,
-0.5455765, -0.7590934, -3.587796, 0.3333333, 1, 0, 1,
-0.5453249, -0.2520885, -0.9373925, 0.3254902, 1, 0, 1,
-0.5444179, -2.308753, -1.910136, 0.3215686, 1, 0, 1,
-0.5436905, -0.658834, -1.723036, 0.3137255, 1, 0, 1,
-0.5398591, -0.3092836, -1.373848, 0.3098039, 1, 0, 1,
-0.5321877, 0.6887252, -0.2797913, 0.3019608, 1, 0, 1,
-0.5299771, -0.6063583, -0.9313068, 0.2941177, 1, 0, 1,
-0.5247692, -0.6086226, -2.385312, 0.2901961, 1, 0, 1,
-0.5204726, 0.2701909, -0.2793736, 0.282353, 1, 0, 1,
-0.5178276, -0.7013738, -2.494447, 0.2784314, 1, 0, 1,
-0.5169652, -1.123739, -3.413569, 0.2705882, 1, 0, 1,
-0.5166526, 0.4728523, -2.031198, 0.2666667, 1, 0, 1,
-0.5105303, -0.2066855, -2.155326, 0.2588235, 1, 0, 1,
-0.506835, 1.011811, -1.661893, 0.254902, 1, 0, 1,
-0.5052326, -1.028022, -2.757848, 0.2470588, 1, 0, 1,
-0.496678, 0.2984129, 0.3400096, 0.2431373, 1, 0, 1,
-0.4922401, 0.5936584, -1.072206, 0.2352941, 1, 0, 1,
-0.4906801, -1.189696, -1.922414, 0.2313726, 1, 0, 1,
-0.4877314, -1.007201, -3.685921, 0.2235294, 1, 0, 1,
-0.486785, -1.593519, -0.1736567, 0.2196078, 1, 0, 1,
-0.4816597, 0.05876483, -2.574703, 0.2117647, 1, 0, 1,
-0.4813032, 0.6689284, -1.861021, 0.2078431, 1, 0, 1,
-0.4804038, 0.6944643, -0.5598536, 0.2, 1, 0, 1,
-0.4796916, -0.7512462, -4.50157, 0.1921569, 1, 0, 1,
-0.478011, 0.9924432, -1.637369, 0.1882353, 1, 0, 1,
-0.4768099, 0.5944066, 0.7472048, 0.1803922, 1, 0, 1,
-0.4748743, -1.317732, -3.79739, 0.1764706, 1, 0, 1,
-0.4746965, -1.194018, -2.690147, 0.1686275, 1, 0, 1,
-0.4739403, 0.7094069, -1.17427, 0.1647059, 1, 0, 1,
-0.4728924, -0.4317024, -1.857419, 0.1568628, 1, 0, 1,
-0.4726872, 1.348752, -1.227043, 0.1529412, 1, 0, 1,
-0.4724209, -0.08342124, -1.876161, 0.145098, 1, 0, 1,
-0.471229, 1.041999, -1.99509, 0.1411765, 1, 0, 1,
-0.4670781, -0.2432347, -1.863538, 0.1333333, 1, 0, 1,
-0.4658219, 0.599234, -1.238839, 0.1294118, 1, 0, 1,
-0.4648128, -1.414129, -0.6908907, 0.1215686, 1, 0, 1,
-0.4574523, 0.9139966, -0.3385802, 0.1176471, 1, 0, 1,
-0.4566993, 0.03076414, 0.424405, 0.1098039, 1, 0, 1,
-0.4534621, -1.712742, -2.553013, 0.1058824, 1, 0, 1,
-0.4533853, 0.02145077, -1.967849, 0.09803922, 1, 0, 1,
-0.4497275, 1.503795, -1.331146, 0.09019608, 1, 0, 1,
-0.4496369, -1.122181, -3.934739, 0.08627451, 1, 0, 1,
-0.4473298, 1.5851, -0.45626, 0.07843138, 1, 0, 1,
-0.4472786, -1.396332, -4.614872, 0.07450981, 1, 0, 1,
-0.445136, -0.5443962, -3.261962, 0.06666667, 1, 0, 1,
-0.4398534, 0.931492, -1.137166, 0.0627451, 1, 0, 1,
-0.4392711, -0.2079553, -0.9069282, 0.05490196, 1, 0, 1,
-0.4374073, 1.561752, -0.6043206, 0.05098039, 1, 0, 1,
-0.437097, -0.874387, -2.697666, 0.04313726, 1, 0, 1,
-0.4323179, -0.1898949, -3.281518, 0.03921569, 1, 0, 1,
-0.4283446, -0.6444489, -2.185467, 0.03137255, 1, 0, 1,
-0.4276333, 0.3207654, -1.891223, 0.02745098, 1, 0, 1,
-0.4218568, 1.310194, -1.375164, 0.01960784, 1, 0, 1,
-0.4206996, 0.4104566, -0.9829361, 0.01568628, 1, 0, 1,
-0.4201556, -1.564435, -4.189217, 0.007843138, 1, 0, 1,
-0.4181021, 0.4188808, -0.04741646, 0.003921569, 1, 0, 1,
-0.4113226, 0.4892343, 0.5047166, 0, 1, 0.003921569, 1,
-0.4101485, -0.647844, -1.192976, 0, 1, 0.01176471, 1,
-0.4083973, 1.907699, 1.582074, 0, 1, 0.01568628, 1,
-0.4057169, 0.598147, 0.5186559, 0, 1, 0.02352941, 1,
-0.4044052, 1.158534, -2.893258, 0, 1, 0.02745098, 1,
-0.4034914, -1.368763, -3.000954, 0, 1, 0.03529412, 1,
-0.400464, -0.8746761, -2.664321, 0, 1, 0.03921569, 1,
-0.3987295, -0.8457795, -4.154057, 0, 1, 0.04705882, 1,
-0.3987054, 1.144454, -0.1419836, 0, 1, 0.05098039, 1,
-0.3898855, 1.673478, 0.08099058, 0, 1, 0.05882353, 1,
-0.3898032, -0.0266982, -0.5408556, 0, 1, 0.0627451, 1,
-0.3880973, 2.412239, -1.486143, 0, 1, 0.07058824, 1,
-0.3843879, -0.004448301, -2.542627, 0, 1, 0.07450981, 1,
-0.3827887, 0.3282964, -0.290063, 0, 1, 0.08235294, 1,
-0.3743661, 0.2162138, -1.930496, 0, 1, 0.08627451, 1,
-0.3736801, 0.6548635, 0.6526645, 0, 1, 0.09411765, 1,
-0.369288, 0.6766782, -0.6133113, 0, 1, 0.1019608, 1,
-0.3672932, 0.479417, 0.2372478, 0, 1, 0.1058824, 1,
-0.3667387, -0.9313379, -1.851936, 0, 1, 0.1137255, 1,
-0.3652932, 1.431516, -0.4346855, 0, 1, 0.1176471, 1,
-0.3632194, -1.619394, -2.640304, 0, 1, 0.1254902, 1,
-0.3624342, 2.345505, -1.366121, 0, 1, 0.1294118, 1,
-0.3617662, 0.5545521, -0.6891673, 0, 1, 0.1372549, 1,
-0.3616288, -0.9930567, -2.221051, 0, 1, 0.1411765, 1,
-0.3607913, -0.8597565, -2.346607, 0, 1, 0.1490196, 1,
-0.3598462, -0.3009447, -1.290241, 0, 1, 0.1529412, 1,
-0.3516767, -0.2206434, -2.824843, 0, 1, 0.1607843, 1,
-0.3515441, -0.799868, -1.873452, 0, 1, 0.1647059, 1,
-0.3471786, -0.2592377, -0.1618092, 0, 1, 0.172549, 1,
-0.3462538, -0.6100642, -1.960316, 0, 1, 0.1764706, 1,
-0.3427106, -0.2443942, -2.136356, 0, 1, 0.1843137, 1,
-0.340889, -0.7311193, -1.631967, 0, 1, 0.1882353, 1,
-0.3337435, 0.4050823, -1.474414, 0, 1, 0.1960784, 1,
-0.3278934, -0.3049489, -3.375363, 0, 1, 0.2039216, 1,
-0.3272653, 0.7475118, -2.306368, 0, 1, 0.2078431, 1,
-0.32481, 0.5374917, -0.4797046, 0, 1, 0.2156863, 1,
-0.3199663, -1.253689, -3.152922, 0, 1, 0.2196078, 1,
-0.319249, 1.151641, 0.1074067, 0, 1, 0.227451, 1,
-0.3183719, -0.01419274, -1.334439, 0, 1, 0.2313726, 1,
-0.316484, 1.252143, 0.6269581, 0, 1, 0.2392157, 1,
-0.3157909, -0.7853192, -2.288165, 0, 1, 0.2431373, 1,
-0.3143723, -1.568382, -2.002605, 0, 1, 0.2509804, 1,
-0.3122377, 1.01535, 0.3296356, 0, 1, 0.254902, 1,
-0.3107884, -1.582803, -2.545766, 0, 1, 0.2627451, 1,
-0.3060413, 0.5435165, -1.536889, 0, 1, 0.2666667, 1,
-0.3035866, 1.364159, -0.958888, 0, 1, 0.2745098, 1,
-0.3014346, 0.2777143, 0.3652552, 0, 1, 0.2784314, 1,
-0.3005844, -0.08667568, -3.622498, 0, 1, 0.2862745, 1,
-0.2994441, -0.06118882, -2.126322, 0, 1, 0.2901961, 1,
-0.2894494, 0.9337881, 0.9197756, 0, 1, 0.2980392, 1,
-0.2833655, 0.1658102, -0.6937638, 0, 1, 0.3058824, 1,
-0.2820193, 1.239887, -0.4615976, 0, 1, 0.3098039, 1,
-0.2792184, 0.4317349, -0.5468746, 0, 1, 0.3176471, 1,
-0.2704757, 0.1121864, -0.9980025, 0, 1, 0.3215686, 1,
-0.2695739, -0.6565089, -1.377561, 0, 1, 0.3294118, 1,
-0.268168, 0.6096651, -1.624942, 0, 1, 0.3333333, 1,
-0.2659367, 0.2032355, -0.9730211, 0, 1, 0.3411765, 1,
-0.2644203, 1.252107, -0.523941, 0, 1, 0.345098, 1,
-0.2632777, -2.63886, -3.205924, 0, 1, 0.3529412, 1,
-0.2607987, -1.215639, -3.323164, 0, 1, 0.3568628, 1,
-0.2586216, -1.851336, -3.59805, 0, 1, 0.3647059, 1,
-0.2573765, -0.3396153, -2.60768, 0, 1, 0.3686275, 1,
-0.2558946, -0.828261, -2.480859, 0, 1, 0.3764706, 1,
-0.2540887, -1.867115, -4.762817, 0, 1, 0.3803922, 1,
-0.2529635, 0.5286909, -1.260879, 0, 1, 0.3882353, 1,
-0.2453454, -1.294773, -2.517515, 0, 1, 0.3921569, 1,
-0.2435599, 0.5132247, -3.060105, 0, 1, 0.4, 1,
-0.2411839, -0.6839215, -3.963936, 0, 1, 0.4078431, 1,
-0.2364303, 0.6070914, -0.6270913, 0, 1, 0.4117647, 1,
-0.2320542, -0.9279388, -3.16328, 0, 1, 0.4196078, 1,
-0.2281733, 0.2898206, -2.419448, 0, 1, 0.4235294, 1,
-0.2270671, -0.1700986, -2.342659, 0, 1, 0.4313726, 1,
-0.2249911, -0.390437, -2.976974, 0, 1, 0.4352941, 1,
-0.2173581, 0.006817433, -1.383334, 0, 1, 0.4431373, 1,
-0.2145371, -0.02965099, -1.41613, 0, 1, 0.4470588, 1,
-0.2057916, -0.6932911, -1.464156, 0, 1, 0.454902, 1,
-0.2045337, -0.08029997, 0.2978267, 0, 1, 0.4588235, 1,
-0.2034034, 1.48493, 0.4968274, 0, 1, 0.4666667, 1,
-0.201571, 0.07750937, -1.780596, 0, 1, 0.4705882, 1,
-0.1949021, 1.263091, -2.207808, 0, 1, 0.4784314, 1,
-0.1855429, 0.04463058, -1.968062, 0, 1, 0.4823529, 1,
-0.1830995, -0.57838, -2.662594, 0, 1, 0.4901961, 1,
-0.1830734, 0.2852468, -0.3591269, 0, 1, 0.4941176, 1,
-0.1801629, 0.4801627, -2.308872, 0, 1, 0.5019608, 1,
-0.1754438, 0.1888791, -0.4423721, 0, 1, 0.509804, 1,
-0.1749362, 0.4551237, -1.861289, 0, 1, 0.5137255, 1,
-0.1736349, 0.1264661, -0.7950336, 0, 1, 0.5215687, 1,
-0.1682884, -1.076523, -2.733099, 0, 1, 0.5254902, 1,
-0.1662647, 0.953677, -1.240609, 0, 1, 0.5333334, 1,
-0.164872, 0.9673335, -0.8880646, 0, 1, 0.5372549, 1,
-0.1625779, -0.1140861, -0.7639828, 0, 1, 0.5450981, 1,
-0.1621786, 0.6155599, -0.2435586, 0, 1, 0.5490196, 1,
-0.1604658, 0.08091313, -1.775645, 0, 1, 0.5568628, 1,
-0.1528137, 0.2587075, -0.6239568, 0, 1, 0.5607843, 1,
-0.1525001, 1.393779, -0.1526042, 0, 1, 0.5686275, 1,
-0.151295, -0.404551, -3.341826, 0, 1, 0.572549, 1,
-0.1494427, 0.6621975, -0.5665159, 0, 1, 0.5803922, 1,
-0.1492715, -0.1818154, -0.6732448, 0, 1, 0.5843138, 1,
-0.148203, 0.2324738, -0.3465624, 0, 1, 0.5921569, 1,
-0.147725, 0.1500211, 1.225258, 0, 1, 0.5960785, 1,
-0.1472666, -0.3670252, -1.76831, 0, 1, 0.6039216, 1,
-0.1423222, 1.414107, -1.173746, 0, 1, 0.6117647, 1,
-0.1366802, -1.118952, -4.319581, 0, 1, 0.6156863, 1,
-0.1287156, 0.6776534, 1.535846, 0, 1, 0.6235294, 1,
-0.1286074, -2.987076, -1.919991, 0, 1, 0.627451, 1,
-0.1233568, -1.121306, -3.134906, 0, 1, 0.6352941, 1,
-0.1230617, -0.257074, -0.9697933, 0, 1, 0.6392157, 1,
-0.1226515, -0.3611754, -3.494662, 0, 1, 0.6470588, 1,
-0.1155294, -1.575446, -2.578835, 0, 1, 0.6509804, 1,
-0.1126731, 2.138162, -1.414027, 0, 1, 0.6588235, 1,
-0.1119188, -0.8636249, -3.647998, 0, 1, 0.6627451, 1,
-0.1043507, 1.490251, -2.363162, 0, 1, 0.6705883, 1,
-0.09734157, -0.2307168, -2.177265, 0, 1, 0.6745098, 1,
-0.09377171, -0.9027289, -3.302825, 0, 1, 0.682353, 1,
-0.09161249, 1.335693, -0.256897, 0, 1, 0.6862745, 1,
-0.09147329, -0.8918107, -3.919322, 0, 1, 0.6941177, 1,
-0.08903832, -0.685209, -3.001646, 0, 1, 0.7019608, 1,
-0.08344714, -0.9195714, -3.878981, 0, 1, 0.7058824, 1,
-0.08242766, -0.3274039, -3.044724, 0, 1, 0.7137255, 1,
-0.07932571, -0.3569862, -2.197036, 0, 1, 0.7176471, 1,
-0.0784782, 0.3037331, -0.6121703, 0, 1, 0.7254902, 1,
-0.07831173, 0.7786964, -0.05343235, 0, 1, 0.7294118, 1,
-0.07825468, 2.099447, 0.03089519, 0, 1, 0.7372549, 1,
-0.07806499, 0.3443566, -1.431916, 0, 1, 0.7411765, 1,
-0.07645736, -1.462779, -3.866497, 0, 1, 0.7490196, 1,
-0.07057295, 0.3972476, 1.29764, 0, 1, 0.7529412, 1,
-0.06672335, -0.6264333, -3.160685, 0, 1, 0.7607843, 1,
-0.065378, 1.323638, 0.2526631, 0, 1, 0.7647059, 1,
-0.06533513, -1.534646, -4.414295, 0, 1, 0.772549, 1,
-0.06179478, 0.3512882, -0.0892862, 0, 1, 0.7764706, 1,
-0.05359932, 0.04014281, 0.1464974, 0, 1, 0.7843137, 1,
-0.0512856, 0.2149278, 0.6851803, 0, 1, 0.7882353, 1,
-0.04948718, -0.3098625, -2.963799, 0, 1, 0.7960784, 1,
-0.04289109, -0.2222998, -4.905377, 0, 1, 0.8039216, 1,
-0.04171071, 2.50485, 1.023818, 0, 1, 0.8078431, 1,
-0.04058911, 1.18643, -0.1439976, 0, 1, 0.8156863, 1,
-0.03540877, 0.8710459, 0.1960954, 0, 1, 0.8196079, 1,
-0.03449067, -0.7407405, -2.870733, 0, 1, 0.827451, 1,
-0.03397718, 0.03798986, -0.4991825, 0, 1, 0.8313726, 1,
-0.0280411, -0.1414847, -2.689905, 0, 1, 0.8392157, 1,
-0.02645559, 0.2977763, 0.06409564, 0, 1, 0.8431373, 1,
-0.02607925, -0.5426745, -2.545128, 0, 1, 0.8509804, 1,
-0.01979669, 0.02555044, -0.5480866, 0, 1, 0.854902, 1,
-0.01496589, -0.6779311, -2.295933, 0, 1, 0.8627451, 1,
-0.01494187, 0.004791257, 0.04152947, 0, 1, 0.8666667, 1,
-0.01240494, -0.4156595, -2.004674, 0, 1, 0.8745098, 1,
-0.01239146, 0.351504, -0.253177, 0, 1, 0.8784314, 1,
-0.007046103, -0.1008602, -2.190732, 0, 1, 0.8862745, 1,
-0.005634715, -0.1104523, -2.213718, 0, 1, 0.8901961, 1,
-0.005272099, -0.6902996, -1.957779, 0, 1, 0.8980392, 1,
0.0001000127, 0.7726879, 1.68969, 0, 1, 0.9058824, 1,
0.006961038, 0.149306, 0.3867979, 0, 1, 0.9098039, 1,
0.007745404, -0.7251289, 2.123749, 0, 1, 0.9176471, 1,
0.008631372, -1.157054, 3.365428, 0, 1, 0.9215686, 1,
0.008640598, 0.7084044, 1.176508, 0, 1, 0.9294118, 1,
0.01169598, 0.6913322, -0.1635377, 0, 1, 0.9333333, 1,
0.01498039, -0.3176301, 3.14573, 0, 1, 0.9411765, 1,
0.01577868, -1.309444, 4.082285, 0, 1, 0.945098, 1,
0.01673832, -0.4654338, 4.166709, 0, 1, 0.9529412, 1,
0.01696214, -0.496816, 1.980579, 0, 1, 0.9568627, 1,
0.02186952, 0.4292272, -1.286541, 0, 1, 0.9647059, 1,
0.02322063, 0.6602645, -0.07184701, 0, 1, 0.9686275, 1,
0.02844066, 0.5204197, 0.7865834, 0, 1, 0.9764706, 1,
0.0287155, -0.1122834, 2.208607, 0, 1, 0.9803922, 1,
0.02913976, 1.930953, 1.2575, 0, 1, 0.9882353, 1,
0.03318791, -0.6775655, 3.230565, 0, 1, 0.9921569, 1,
0.0366057, 0.8593843, -0.641932, 0, 1, 1, 1,
0.03712218, -0.9540009, 4.533869, 0, 0.9921569, 1, 1,
0.03915881, -1.666658, 2.200025, 0, 0.9882353, 1, 1,
0.04317493, 0.3124563, 0.1394973, 0, 0.9803922, 1, 1,
0.04805679, -0.2086309, 2.810653, 0, 0.9764706, 1, 1,
0.05150401, 2.259765, -0.9065244, 0, 0.9686275, 1, 1,
0.05536238, 0.3068357, 0.2478784, 0, 0.9647059, 1, 1,
0.05715508, -0.3948197, 2.823952, 0, 0.9568627, 1, 1,
0.05780533, -0.9981302, 2.718646, 0, 0.9529412, 1, 1,
0.05792858, -1.185207, 1.763355, 0, 0.945098, 1, 1,
0.06209327, 0.407508, -0.5857537, 0, 0.9411765, 1, 1,
0.06544701, 0.2994896, -0.1727193, 0, 0.9333333, 1, 1,
0.06781533, 1.492389, 1.709745, 0, 0.9294118, 1, 1,
0.0692322, 0.9272537, -1.285398, 0, 0.9215686, 1, 1,
0.06995943, -1.026585, 2.590807, 0, 0.9176471, 1, 1,
0.07128704, 0.4974463, -0.7237794, 0, 0.9098039, 1, 1,
0.07294788, 0.06135923, 0.7792999, 0, 0.9058824, 1, 1,
0.07831387, 0.2534949, 0.3526022, 0, 0.8980392, 1, 1,
0.07959004, -0.9567608, 2.663083, 0, 0.8901961, 1, 1,
0.08806793, -0.3036683, 2.189745, 0, 0.8862745, 1, 1,
0.08857496, 0.613571, 0.8719016, 0, 0.8784314, 1, 1,
0.08916571, -2.202966, 2.179954, 0, 0.8745098, 1, 1,
0.0954251, -0.5012275, 1.272997, 0, 0.8666667, 1, 1,
0.09616419, -0.2324664, 2.280858, 0, 0.8627451, 1, 1,
0.09688956, -1.725935, 4.255398, 0, 0.854902, 1, 1,
0.1007415, 0.01791098, 0.4218016, 0, 0.8509804, 1, 1,
0.1033658, -0.173903, 2.738288, 0, 0.8431373, 1, 1,
0.1055607, -1.226097, 2.934119, 0, 0.8392157, 1, 1,
0.1057636, 2.680928, -0.3123114, 0, 0.8313726, 1, 1,
0.1086483, 2.291726, 0.3268535, 0, 0.827451, 1, 1,
0.1168892, 1.019177, 1.055356, 0, 0.8196079, 1, 1,
0.1171255, 0.3546558, 0.7520328, 0, 0.8156863, 1, 1,
0.1173262, 2.325017, 0.5200828, 0, 0.8078431, 1, 1,
0.1183948, 0.834311, -0.5094383, 0, 0.8039216, 1, 1,
0.1219492, 1.798217, -0.4107267, 0, 0.7960784, 1, 1,
0.1225667, 1.145881, -0.3327691, 0, 0.7882353, 1, 1,
0.1233648, -0.8708704, 3.169124, 0, 0.7843137, 1, 1,
0.1235461, 1.466124, 0.3192955, 0, 0.7764706, 1, 1,
0.1244966, 0.5418119, 0.9029376, 0, 0.772549, 1, 1,
0.1268915, -0.8509845, 3.308348, 0, 0.7647059, 1, 1,
0.1273045, 1.890151, 0.270494, 0, 0.7607843, 1, 1,
0.1279717, 1.199103, 0.5352738, 0, 0.7529412, 1, 1,
0.1328679, 0.6492224, 0.9152339, 0, 0.7490196, 1, 1,
0.1344839, -0.9613288, 4.364337, 0, 0.7411765, 1, 1,
0.1370281, -0.04259424, 2.369184, 0, 0.7372549, 1, 1,
0.1373135, 0.6294082, 0.1579638, 0, 0.7294118, 1, 1,
0.1410479, -0.3838929, 1.410282, 0, 0.7254902, 1, 1,
0.141864, 0.6025503, 0.9464082, 0, 0.7176471, 1, 1,
0.1429771, -1.321008, 3.676296, 0, 0.7137255, 1, 1,
0.1439501, 0.5587652, -0.7660694, 0, 0.7058824, 1, 1,
0.1493858, -0.1343414, -0.3101733, 0, 0.6980392, 1, 1,
0.1553901, -0.7922762, 2.67286, 0, 0.6941177, 1, 1,
0.1591754, 0.1207284, 0.6973847, 0, 0.6862745, 1, 1,
0.1598933, 1.672349, -0.866301, 0, 0.682353, 1, 1,
0.1609235, -0.6992503, 3.43017, 0, 0.6745098, 1, 1,
0.1642347, -1.84715, 5.210444, 0, 0.6705883, 1, 1,
0.1652878, -0.2623478, 2.962331, 0, 0.6627451, 1, 1,
0.1654609, -0.8936771, 2.398618, 0, 0.6588235, 1, 1,
0.1666131, -0.5528988, 4.002487, 0, 0.6509804, 1, 1,
0.1682019, -1.51099, 2.486616, 0, 0.6470588, 1, 1,
0.1713628, 2.170382, -1.304173, 0, 0.6392157, 1, 1,
0.1804607, 0.2089884, 0.3828767, 0, 0.6352941, 1, 1,
0.1824799, -0.6572268, 5.294948, 0, 0.627451, 1, 1,
0.1827485, 0.2073955, 1.270151, 0, 0.6235294, 1, 1,
0.1832185, 0.3636855, 0.8311842, 0, 0.6156863, 1, 1,
0.1850233, 0.03173021, 0.1036323, 0, 0.6117647, 1, 1,
0.185783, 0.3430402, 0.1953513, 0, 0.6039216, 1, 1,
0.1868861, 1.068449, 0.3061886, 0, 0.5960785, 1, 1,
0.1913166, -0.7523451, 3.933775, 0, 0.5921569, 1, 1,
0.1913741, 0.5344059, 0.2010181, 0, 0.5843138, 1, 1,
0.1939649, -0.9874618, 2.136851, 0, 0.5803922, 1, 1,
0.1961002, -1.931756, 2.244405, 0, 0.572549, 1, 1,
0.2021008, 0.6094419, 0.04204795, 0, 0.5686275, 1, 1,
0.204582, 0.4491522, -0.03171727, 0, 0.5607843, 1, 1,
0.2081986, 1.605986, 0.7443957, 0, 0.5568628, 1, 1,
0.2085579, -0.2260864, 4.222631, 0, 0.5490196, 1, 1,
0.2131439, 1.478153, -0.1097806, 0, 0.5450981, 1, 1,
0.214523, 0.07906919, -0.940479, 0, 0.5372549, 1, 1,
0.2146093, -2.703884, 4.010159, 0, 0.5333334, 1, 1,
0.2154132, -1.323484, 2.9447, 0, 0.5254902, 1, 1,
0.2165816, 0.4193158, 0.1527705, 0, 0.5215687, 1, 1,
0.2188197, 0.7537144, 1.808992, 0, 0.5137255, 1, 1,
0.2188862, 0.9067445, -0.009941477, 0, 0.509804, 1, 1,
0.2224234, 0.7894858, 0.1829253, 0, 0.5019608, 1, 1,
0.2232308, 0.8994191, 1.386176, 0, 0.4941176, 1, 1,
0.2250307, -1.046811, 1.803038, 0, 0.4901961, 1, 1,
0.2254513, 1.005716, 2.04864, 0, 0.4823529, 1, 1,
0.2334849, 0.9499354, -1.620767, 0, 0.4784314, 1, 1,
0.2362106, -0.1772174, 1.492906, 0, 0.4705882, 1, 1,
0.2398242, -0.6655866, 1.576092, 0, 0.4666667, 1, 1,
0.2412746, -0.622151, 3.166927, 0, 0.4588235, 1, 1,
0.2463482, 0.1631149, 0.07372207, 0, 0.454902, 1, 1,
0.251182, -0.339897, 2.92101, 0, 0.4470588, 1, 1,
0.2544019, -0.3489503, 1.144338, 0, 0.4431373, 1, 1,
0.2555865, 0.5508204, -0.5726542, 0, 0.4352941, 1, 1,
0.259927, 0.001356273, 0.706197, 0, 0.4313726, 1, 1,
0.2640576, -2.198892, 3.352451, 0, 0.4235294, 1, 1,
0.2641947, -1.386408, 3.075894, 0, 0.4196078, 1, 1,
0.266347, 0.2679467, 1.441505, 0, 0.4117647, 1, 1,
0.2676316, 1.05556, -1.487047, 0, 0.4078431, 1, 1,
0.2686655, -1.125408, 2.783994, 0, 0.4, 1, 1,
0.272407, 0.9351971, -0.2058308, 0, 0.3921569, 1, 1,
0.2733065, 0.9432992, 0.4100223, 0, 0.3882353, 1, 1,
0.2744083, -0.04890625, 0.064794, 0, 0.3803922, 1, 1,
0.2754382, -1.045334, 4.147143, 0, 0.3764706, 1, 1,
0.2774565, -1.874356, 1.814316, 0, 0.3686275, 1, 1,
0.2823033, 0.4044978, 1.136291, 0, 0.3647059, 1, 1,
0.2848473, -0.2163777, 3.294173, 0, 0.3568628, 1, 1,
0.2883274, 1.035498, 1.257219, 0, 0.3529412, 1, 1,
0.289763, -0.3027684, 0.8323852, 0, 0.345098, 1, 1,
0.2946149, -0.9491637, 2.567974, 0, 0.3411765, 1, 1,
0.2953633, -1.114615, 1.885697, 0, 0.3333333, 1, 1,
0.2979259, 0.9197889, -0.1163091, 0, 0.3294118, 1, 1,
0.2981954, -1.260628, 2.940439, 0, 0.3215686, 1, 1,
0.2999299, -0.8015789, 3.468005, 0, 0.3176471, 1, 1,
0.3006796, 1.363552, -0.4252275, 0, 0.3098039, 1, 1,
0.3019274, 0.2172989, 0.2867629, 0, 0.3058824, 1, 1,
0.3020591, 0.0185797, 1.468861, 0, 0.2980392, 1, 1,
0.3028392, 0.3052232, 3.108267, 0, 0.2901961, 1, 1,
0.3097072, -0.7014149, 2.196354, 0, 0.2862745, 1, 1,
0.3122339, -0.5347325, 3.580383, 0, 0.2784314, 1, 1,
0.3138194, -2.148025, 3.322764, 0, 0.2745098, 1, 1,
0.3189999, 0.8427808, 0.9947562, 0, 0.2666667, 1, 1,
0.3223186, -0.7837946, 1.936764, 0, 0.2627451, 1, 1,
0.3239209, 0.546429, 0.9573244, 0, 0.254902, 1, 1,
0.324575, -1.160925, 3.289158, 0, 0.2509804, 1, 1,
0.3248351, 0.7015284, 0.7800275, 0, 0.2431373, 1, 1,
0.3270573, 0.7045859, 1.159797, 0, 0.2392157, 1, 1,
0.3309984, -0.7900349, 1.187874, 0, 0.2313726, 1, 1,
0.3319457, 0.5512419, 0.3139657, 0, 0.227451, 1, 1,
0.3334808, 2.053188, -0.2616558, 0, 0.2196078, 1, 1,
0.335095, -0.5358949, 2.885566, 0, 0.2156863, 1, 1,
0.3354173, -0.2137584, 1.214857, 0, 0.2078431, 1, 1,
0.3355713, 0.3826599, 1.005786, 0, 0.2039216, 1, 1,
0.338166, 0.2015965, 0.9109489, 0, 0.1960784, 1, 1,
0.3416145, -0.1567015, -0.0226739, 0, 0.1882353, 1, 1,
0.3422088, -2.53593, 1.918016, 0, 0.1843137, 1, 1,
0.3498489, 0.1547969, -0.4766613, 0, 0.1764706, 1, 1,
0.34988, 0.7158105, 3.050484, 0, 0.172549, 1, 1,
0.3522456, 0.8109015, 0.9157849, 0, 0.1647059, 1, 1,
0.3554333, 0.7265065, -1.071007, 0, 0.1607843, 1, 1,
0.3558314, -1.574304, 3.398513, 0, 0.1529412, 1, 1,
0.3560733, -1.379949, 3.120895, 0, 0.1490196, 1, 1,
0.3564957, 1.458299, 2.166936, 0, 0.1411765, 1, 1,
0.3624057, -0.4112797, 0.8371037, 0, 0.1372549, 1, 1,
0.3701612, 0.595398, -0.4350596, 0, 0.1294118, 1, 1,
0.3721389, -0.742754, 1.781716, 0, 0.1254902, 1, 1,
0.373944, -0.1699965, 1.290342, 0, 0.1176471, 1, 1,
0.3811224, -1.99077, 2.301093, 0, 0.1137255, 1, 1,
0.3812379, -0.1251085, 1.948609, 0, 0.1058824, 1, 1,
0.3820199, -0.132624, 3.696981, 0, 0.09803922, 1, 1,
0.3893069, 0.2677687, 0.9982532, 0, 0.09411765, 1, 1,
0.3897351, -0.1673733, 4.053421, 0, 0.08627451, 1, 1,
0.3901899, 1.433786, 0.4367617, 0, 0.08235294, 1, 1,
0.3942289, 0.09619676, 1.325513, 0, 0.07450981, 1, 1,
0.3959018, -0.06651531, 1.755756, 0, 0.07058824, 1, 1,
0.3974289, 1.926971, 0.7754339, 0, 0.0627451, 1, 1,
0.3976324, 0.2987442, -1.081987, 0, 0.05882353, 1, 1,
0.3977734, -1.426727, 3.867021, 0, 0.05098039, 1, 1,
0.4051251, -0.7399126, 2.153032, 0, 0.04705882, 1, 1,
0.4057606, -0.07083622, 1.805283, 0, 0.03921569, 1, 1,
0.4066209, 0.6657954, 1.555121, 0, 0.03529412, 1, 1,
0.4129332, -0.02000216, 2.637982, 0, 0.02745098, 1, 1,
0.4132332, 0.7143946, 1.178089, 0, 0.02352941, 1, 1,
0.4145075, -1.533699, 2.891233, 0, 0.01568628, 1, 1,
0.4149388, 0.45977, 0.4669203, 0, 0.01176471, 1, 1,
0.4170591, 0.478375, -0.1000496, 0, 0.003921569, 1, 1,
0.41768, -0.4127628, 3.134678, 0.003921569, 0, 1, 1,
0.419167, 1.226772, -0.1284576, 0.007843138, 0, 1, 1,
0.4216463, -0.3582557, 1.073733, 0.01568628, 0, 1, 1,
0.4220012, 0.9187814, -0.02454215, 0.01960784, 0, 1, 1,
0.430012, 0.1570571, 1.538291, 0.02745098, 0, 1, 1,
0.4301078, 0.2573165, 0.4861115, 0.03137255, 0, 1, 1,
0.4357892, 0.1950991, 1.188968, 0.03921569, 0, 1, 1,
0.4392121, 0.2802629, 1.902605, 0.04313726, 0, 1, 1,
0.4398899, 2.305276, 0.4305954, 0.05098039, 0, 1, 1,
0.4401035, -0.6068688, 3.842234, 0.05490196, 0, 1, 1,
0.4410937, 1.363554, 0.3817983, 0.0627451, 0, 1, 1,
0.4411275, -0.5034078, 3.417541, 0.06666667, 0, 1, 1,
0.4414842, 1.083684, -0.9880682, 0.07450981, 0, 1, 1,
0.4454406, 0.04492511, 1.694687, 0.07843138, 0, 1, 1,
0.4473594, 0.02727582, -0.04474733, 0.08627451, 0, 1, 1,
0.4482743, 2.44915, -0.2301249, 0.09019608, 0, 1, 1,
0.4531538, 0.4773, 1.868933, 0.09803922, 0, 1, 1,
0.4531768, 0.9839146, 1.992007, 0.1058824, 0, 1, 1,
0.4535514, 0.2981153, 1.845598, 0.1098039, 0, 1, 1,
0.4598105, 0.8012868, 1.958601, 0.1176471, 0, 1, 1,
0.4632578, 0.07550975, 2.073241, 0.1215686, 0, 1, 1,
0.4643992, -1.308862, 2.428868, 0.1294118, 0, 1, 1,
0.4754924, -0.02017722, 3.508246, 0.1333333, 0, 1, 1,
0.4774603, -0.9903766, 3.71153, 0.1411765, 0, 1, 1,
0.4788352, -0.04752688, -0.03329167, 0.145098, 0, 1, 1,
0.4874234, -0.2813138, 3.12211, 0.1529412, 0, 1, 1,
0.489771, -0.3330319, 2.885142, 0.1568628, 0, 1, 1,
0.4991898, 0.4982528, 0.6174149, 0.1647059, 0, 1, 1,
0.4998443, -2.236534, 1.867764, 0.1686275, 0, 1, 1,
0.5017244, -0.4404347, 3.594041, 0.1764706, 0, 1, 1,
0.5054008, 0.4545915, -1.497348, 0.1803922, 0, 1, 1,
0.5060833, -1.126222, 1.427939, 0.1882353, 0, 1, 1,
0.508509, 0.9210188, 0.29567, 0.1921569, 0, 1, 1,
0.5145386, 0.360774, 2.086954, 0.2, 0, 1, 1,
0.5164081, -0.1311157, 0.09845743, 0.2078431, 0, 1, 1,
0.516765, -0.4425965, 0.2259387, 0.2117647, 0, 1, 1,
0.5301167, 0.0778769, 1.170068, 0.2196078, 0, 1, 1,
0.5324265, 0.9201336, -0.1181674, 0.2235294, 0, 1, 1,
0.5372472, 0.3054654, -0.1767517, 0.2313726, 0, 1, 1,
0.5373173, -0.08900622, 1.021509, 0.2352941, 0, 1, 1,
0.5388322, 1.853518, 0.6818932, 0.2431373, 0, 1, 1,
0.5391908, -0.2461473, 1.610416, 0.2470588, 0, 1, 1,
0.5400674, 0.3103536, 0.9555834, 0.254902, 0, 1, 1,
0.5413418, -0.4130637, 2.338627, 0.2588235, 0, 1, 1,
0.544755, -0.04452123, 2.131494, 0.2666667, 0, 1, 1,
0.5464511, -1.16443, 3.900803, 0.2705882, 0, 1, 1,
0.5474811, -2.049421, 2.272088, 0.2784314, 0, 1, 1,
0.5493818, 0.3337453, 0.8163511, 0.282353, 0, 1, 1,
0.5549392, -0.1592573, 1.566024, 0.2901961, 0, 1, 1,
0.5559906, -1.213728, 3.512654, 0.2941177, 0, 1, 1,
0.5593552, 0.9227154, 1.181552, 0.3019608, 0, 1, 1,
0.5623601, 0.1092461, 1.900328, 0.3098039, 0, 1, 1,
0.5651839, 0.2631173, 1.906285, 0.3137255, 0, 1, 1,
0.5685369, 0.679826, -1.333443, 0.3215686, 0, 1, 1,
0.5691451, 0.9370874, -0.823359, 0.3254902, 0, 1, 1,
0.5745844, -0.6226324, 3.237748, 0.3333333, 0, 1, 1,
0.5767283, -0.5873292, 3.626252, 0.3372549, 0, 1, 1,
0.5782982, -0.8151999, 3.432779, 0.345098, 0, 1, 1,
0.5834723, -1.905279, 4.820698, 0.3490196, 0, 1, 1,
0.5840229, -0.5654242, 1.858251, 0.3568628, 0, 1, 1,
0.5843838, 0.8261244, -1.25303, 0.3607843, 0, 1, 1,
0.5846296, -0.6980274, 4.073114, 0.3686275, 0, 1, 1,
0.5857534, -1.810283, 2.899746, 0.372549, 0, 1, 1,
0.5891599, 0.9319997, 1.800748, 0.3803922, 0, 1, 1,
0.5892563, 0.3113233, 1.287562, 0.3843137, 0, 1, 1,
0.5946231, -0.2901046, 3.695447, 0.3921569, 0, 1, 1,
0.5953535, 0.2392969, 0.7535823, 0.3960784, 0, 1, 1,
0.5974936, 0.2753786, 0.743163, 0.4039216, 0, 1, 1,
0.5983253, 0.4529201, 0.990062, 0.4117647, 0, 1, 1,
0.5984451, -0.8647373, 2.180859, 0.4156863, 0, 1, 1,
0.602483, 0.6197882, 3.023843, 0.4235294, 0, 1, 1,
0.606618, 0.2217843, 1.500724, 0.427451, 0, 1, 1,
0.6066398, 0.3571272, 0.6389231, 0.4352941, 0, 1, 1,
0.608089, -1.062438, 2.485438, 0.4392157, 0, 1, 1,
0.6116679, -1.834345, 4.325991, 0.4470588, 0, 1, 1,
0.6132669, 1.543557, 2.319716, 0.4509804, 0, 1, 1,
0.6149458, 0.4810134, 0.7946185, 0.4588235, 0, 1, 1,
0.6157421, 1.57627, 0.8867837, 0.4627451, 0, 1, 1,
0.6179728, -0.1522839, 3.895768, 0.4705882, 0, 1, 1,
0.6222671, -0.2310249, 1.517003, 0.4745098, 0, 1, 1,
0.622523, 0.9374155, 1.949604, 0.4823529, 0, 1, 1,
0.6226451, 0.1377362, 1.043, 0.4862745, 0, 1, 1,
0.6357051, -0.10576, 4.410058, 0.4941176, 0, 1, 1,
0.6357653, -0.1334139, 1.397481, 0.5019608, 0, 1, 1,
0.6371424, -1.077888, 2.060104, 0.5058824, 0, 1, 1,
0.6424301, -0.9884938, 2.530309, 0.5137255, 0, 1, 1,
0.6439779, 0.2823926, 0.6008028, 0.5176471, 0, 1, 1,
0.6453311, -0.2460715, 2.404767, 0.5254902, 0, 1, 1,
0.6461177, 0.3788345, 1.222179, 0.5294118, 0, 1, 1,
0.6521083, -1.565682, 1.094216, 0.5372549, 0, 1, 1,
0.6614439, 0.1506393, 1.940045, 0.5411765, 0, 1, 1,
0.6642474, -0.6154063, 1.505507, 0.5490196, 0, 1, 1,
0.6660109, -1.029838, 2.019294, 0.5529412, 0, 1, 1,
0.6663378, -0.2173281, 1.963107, 0.5607843, 0, 1, 1,
0.6690692, 0.2993415, 1.252912, 0.5647059, 0, 1, 1,
0.6762409, 0.245287, 1.256728, 0.572549, 0, 1, 1,
0.680523, 0.7687729, 1.291481, 0.5764706, 0, 1, 1,
0.6846322, 1.01334, 1.420598, 0.5843138, 0, 1, 1,
0.689375, -0.8634512, 3.064125, 0.5882353, 0, 1, 1,
0.6901406, 0.02940046, 1.030877, 0.5960785, 0, 1, 1,
0.6925645, -1.645725, 5.377253, 0.6039216, 0, 1, 1,
0.6933553, -0.4275477, 2.688876, 0.6078432, 0, 1, 1,
0.6939384, 2.73657, 2.569496, 0.6156863, 0, 1, 1,
0.6960273, 1.323177, -0.3043013, 0.6196079, 0, 1, 1,
0.6986205, 0.2649978, 3.128872, 0.627451, 0, 1, 1,
0.7032659, 1.104969, 0.5501547, 0.6313726, 0, 1, 1,
0.709051, 1.175021, -0.498275, 0.6392157, 0, 1, 1,
0.7130102, 1.430156, 0.8008073, 0.6431373, 0, 1, 1,
0.7137532, -1.936671, 1.358128, 0.6509804, 0, 1, 1,
0.7156122, 0.7730231, 2.711655, 0.654902, 0, 1, 1,
0.716556, -0.8320232, 2.074643, 0.6627451, 0, 1, 1,
0.7206657, -1.060908, 1.141985, 0.6666667, 0, 1, 1,
0.7248054, -1.384134, 3.65946, 0.6745098, 0, 1, 1,
0.7271522, -0.2125262, 0.3465715, 0.6784314, 0, 1, 1,
0.7279704, -0.6031699, 2.578279, 0.6862745, 0, 1, 1,
0.7287295, -0.4014824, 1.214018, 0.6901961, 0, 1, 1,
0.7331946, 0.9279568, 0.9610173, 0.6980392, 0, 1, 1,
0.7398577, -0.04752279, 1.887908, 0.7058824, 0, 1, 1,
0.7403692, 1.558143, 1.390267, 0.7098039, 0, 1, 1,
0.7427927, 0.3307806, 1.490285, 0.7176471, 0, 1, 1,
0.7428746, 1.444385, 1.496343, 0.7215686, 0, 1, 1,
0.7580525, 1.489343, -0.04995974, 0.7294118, 0, 1, 1,
0.760137, -0.0964313, 0.9950449, 0.7333333, 0, 1, 1,
0.7733474, -0.399237, 2.83403, 0.7411765, 0, 1, 1,
0.7756417, -1.692541, 3.120475, 0.7450981, 0, 1, 1,
0.7793107, 0.01612681, 1.574036, 0.7529412, 0, 1, 1,
0.780163, -0.7542108, 3.087582, 0.7568628, 0, 1, 1,
0.7805118, 0.626053, 0.7233243, 0.7647059, 0, 1, 1,
0.7836269, -0.1185881, 1.92244, 0.7686275, 0, 1, 1,
0.8003393, -2.530142, 4.373758, 0.7764706, 0, 1, 1,
0.8020107, 1.13946, 2.329657, 0.7803922, 0, 1, 1,
0.8084998, 0.02652298, 2.868591, 0.7882353, 0, 1, 1,
0.8099967, -0.97087, 2.36356, 0.7921569, 0, 1, 1,
0.8161306, -0.2919036, 0.9199058, 0.8, 0, 1, 1,
0.8233224, -1.513999, 3.516632, 0.8078431, 0, 1, 1,
0.8246664, 1.986407, -0.05052452, 0.8117647, 0, 1, 1,
0.8311526, 1.572945, 0.5280681, 0.8196079, 0, 1, 1,
0.8334641, -1.289246, 3.046303, 0.8235294, 0, 1, 1,
0.8389995, -1.427513, 2.672721, 0.8313726, 0, 1, 1,
0.8401934, -0.5684353, 2.101625, 0.8352941, 0, 1, 1,
0.8436033, 3.312393, 0.5951591, 0.8431373, 0, 1, 1,
0.8466321, 0.6783217, 0.109179, 0.8470588, 0, 1, 1,
0.8489057, 0.1570923, 1.313974, 0.854902, 0, 1, 1,
0.8519135, 1.676109, 0.001201335, 0.8588235, 0, 1, 1,
0.8526753, 0.04166194, 0.966094, 0.8666667, 0, 1, 1,
0.8651356, -0.6669858, 3.531425, 0.8705882, 0, 1, 1,
0.8680547, 0.1100542, 2.132003, 0.8784314, 0, 1, 1,
0.88186, 0.2114944, 2.018883, 0.8823529, 0, 1, 1,
0.8876573, -0.2930005, 0.4951039, 0.8901961, 0, 1, 1,
0.8951784, 2.234323, 0.1438173, 0.8941177, 0, 1, 1,
0.8955162, -0.7157463, 3.408563, 0.9019608, 0, 1, 1,
0.9051965, -0.4913248, 4.118575, 0.9098039, 0, 1, 1,
0.9060702, -2.083524, 2.986007, 0.9137255, 0, 1, 1,
0.9120964, 2.136666, 1.71668, 0.9215686, 0, 1, 1,
0.9122608, -1.132676, 1.417558, 0.9254902, 0, 1, 1,
0.9126443, 0.2751267, 1.761861, 0.9333333, 0, 1, 1,
0.9130017, -0.05754145, 1.691954, 0.9372549, 0, 1, 1,
0.9137493, -0.5943242, 2.232055, 0.945098, 0, 1, 1,
0.9151148, 0.9252684, -0.09764697, 0.9490196, 0, 1, 1,
0.9240668, 0.0944644, 2.739161, 0.9568627, 0, 1, 1,
0.9299856, -0.3016216, 3.648391, 0.9607843, 0, 1, 1,
0.9301512, 0.1430441, 1.124061, 0.9686275, 0, 1, 1,
0.9363514, -0.0003295945, 1.673688, 0.972549, 0, 1, 1,
0.9388694, 1.5599, 0.9357846, 0.9803922, 0, 1, 1,
0.9417511, -0.2167651, 3.592865, 0.9843137, 0, 1, 1,
0.9468372, -1.066651, -0.6029711, 0.9921569, 0, 1, 1,
0.9489014, 0.3774571, 0.8153847, 0.9960784, 0, 1, 1,
0.9611853, 2.781823, -1.349996, 1, 0, 0.9960784, 1,
0.9652054, 1.089311, 1.014628, 1, 0, 0.9882353, 1,
0.9700109, -0.1034324, 1.672255, 1, 0, 0.9843137, 1,
0.9746964, 1.116494, 3.047203, 1, 0, 0.9764706, 1,
0.975302, -0.6204924, 1.929453, 1, 0, 0.972549, 1,
0.9830836, 1.132981, 1.856313, 1, 0, 0.9647059, 1,
0.9834482, 0.9775468, -0.9892719, 1, 0, 0.9607843, 1,
0.9851286, 1.742287, 2.096482, 1, 0, 0.9529412, 1,
0.9921575, 1.598407, 0.6231233, 1, 0, 0.9490196, 1,
0.9956439, -0.05313222, 1.714388, 1, 0, 0.9411765, 1,
0.9978234, 0.4505628, 1.021042, 1, 0, 0.9372549, 1,
1.006775, 0.412596, 0.7085894, 1, 0, 0.9294118, 1,
1.011504, 0.7824001, -0.7447467, 1, 0, 0.9254902, 1,
1.011949, -0.2317653, 1.398122, 1, 0, 0.9176471, 1,
1.012037, -1.222043, 1.062856, 1, 0, 0.9137255, 1,
1.012267, -0.06793345, 0.6529973, 1, 0, 0.9058824, 1,
1.013945, 0.1597692, 0.2818052, 1, 0, 0.9019608, 1,
1.017933, 0.8546362, 0.6424436, 1, 0, 0.8941177, 1,
1.018337, 0.9270859, 0.8598164, 1, 0, 0.8862745, 1,
1.021409, -0.6214182, 1.713634, 1, 0, 0.8823529, 1,
1.02153, 0.02447891, 1.349089, 1, 0, 0.8745098, 1,
1.027256, 2.411836, 3.408755, 1, 0, 0.8705882, 1,
1.031119, 1.018987, 1.58609, 1, 0, 0.8627451, 1,
1.042089, 0.579317, 1.599093, 1, 0, 0.8588235, 1,
1.04389, -0.09703061, 1.508966, 1, 0, 0.8509804, 1,
1.046471, 0.6163004, 1.760124, 1, 0, 0.8470588, 1,
1.048593, -1.495086, 2.967955, 1, 0, 0.8392157, 1,
1.051973, 1.74205, -0.3859818, 1, 0, 0.8352941, 1,
1.059612, -2.230316, 3.319518, 1, 0, 0.827451, 1,
1.059681, 1.113237, -0.4049188, 1, 0, 0.8235294, 1,
1.067183, -0.5826088, 2.338937, 1, 0, 0.8156863, 1,
1.077507, 0.6480243, 0.3320125, 1, 0, 0.8117647, 1,
1.084003, -0.07801449, 2.930522, 1, 0, 0.8039216, 1,
1.098872, 0.8806336, 1.080157, 1, 0, 0.7960784, 1,
1.099721, -0.3566247, 1.645806, 1, 0, 0.7921569, 1,
1.101381, -1.001734, 3.947496, 1, 0, 0.7843137, 1,
1.103505, -1.609349, 2.947911, 1, 0, 0.7803922, 1,
1.103704, -0.06687914, 2.272547, 1, 0, 0.772549, 1,
1.106394, -0.7640173, 1.866048, 1, 0, 0.7686275, 1,
1.114331, 0.01494707, 1.170529, 1, 0, 0.7607843, 1,
1.125455, 1.391063, -0.6440966, 1, 0, 0.7568628, 1,
1.128549, -0.545334, 1.463156, 1, 0, 0.7490196, 1,
1.143921, -0.149736, 1.45841, 1, 0, 0.7450981, 1,
1.170015, -0.834893, 2.055865, 1, 0, 0.7372549, 1,
1.171617, -0.2628876, 0.4165722, 1, 0, 0.7333333, 1,
1.181235, 1.063556, 1.85646, 1, 0, 0.7254902, 1,
1.202064, -1.968722, 2.588938, 1, 0, 0.7215686, 1,
1.221236, -1.396674, 0.9648857, 1, 0, 0.7137255, 1,
1.22834, -1.69019, 4.044544, 1, 0, 0.7098039, 1,
1.23676, 0.5022255, 1.274662, 1, 0, 0.7019608, 1,
1.236855, -0.5366139, 3.246231, 1, 0, 0.6941177, 1,
1.251621, -1.186692, 1.613482, 1, 0, 0.6901961, 1,
1.255452, 0.2512507, 2.853266, 1, 0, 0.682353, 1,
1.257086, -0.6732929, 1.576223, 1, 0, 0.6784314, 1,
1.258214, 1.367484, 0.8207569, 1, 0, 0.6705883, 1,
1.258977, -1.154825, 2.608599, 1, 0, 0.6666667, 1,
1.261784, -2.440151, 3.285506, 1, 0, 0.6588235, 1,
1.264632, -0.346678, 1.603467, 1, 0, 0.654902, 1,
1.273592, -0.1922923, 3.618856, 1, 0, 0.6470588, 1,
1.279795, 0.8609428, 1.984967, 1, 0, 0.6431373, 1,
1.284328, -1.291479, 3.038662, 1, 0, 0.6352941, 1,
1.286386, -1.006343, 3.319841, 1, 0, 0.6313726, 1,
1.292906, -0.7753457, 0.7833201, 1, 0, 0.6235294, 1,
1.310261, -0.5070339, 2.667586, 1, 0, 0.6196079, 1,
1.312069, -1.991249, 2.435612, 1, 0, 0.6117647, 1,
1.321711, -0.7471352, -0.3011558, 1, 0, 0.6078432, 1,
1.325014, 1.101201, 0.5412683, 1, 0, 0.6, 1,
1.32891, 1.396503, 2.221918, 1, 0, 0.5921569, 1,
1.329709, -0.4708238, 3.226729, 1, 0, 0.5882353, 1,
1.359178, -0.3648514, 3.963032, 1, 0, 0.5803922, 1,
1.36398, 1.863355, 1.878539, 1, 0, 0.5764706, 1,
1.366304, -0.7293, 2.847907, 1, 0, 0.5686275, 1,
1.375346, -1.276833, 2.57038, 1, 0, 0.5647059, 1,
1.380178, 0.2368811, 1.371086, 1, 0, 0.5568628, 1,
1.384759, -0.6096725, 2.291994, 1, 0, 0.5529412, 1,
1.392655, 0.7939063, 1.98126, 1, 0, 0.5450981, 1,
1.396462, -0.6025586, 2.552336, 1, 0, 0.5411765, 1,
1.408289, 0.1765967, 2.256719, 1, 0, 0.5333334, 1,
1.417688, -0.1159829, 1.273585, 1, 0, 0.5294118, 1,
1.420638, -1.291052, 1.677233, 1, 0, 0.5215687, 1,
1.42106, -0.00104753, -0.6083972, 1, 0, 0.5176471, 1,
1.440137, 1.420945, 2.163429, 1, 0, 0.509804, 1,
1.448308, 0.09623889, 1.523442, 1, 0, 0.5058824, 1,
1.450956, 0.7987564, 3.665106, 1, 0, 0.4980392, 1,
1.46006, -2.107603, 1.714407, 1, 0, 0.4901961, 1,
1.463306, 0.5329111, 1.66965, 1, 0, 0.4862745, 1,
1.46874, -0.8668589, 1.978311, 1, 0, 0.4784314, 1,
1.472331, -0.6718269, 2.982042, 1, 0, 0.4745098, 1,
1.474344, -0.3577974, 0.7081801, 1, 0, 0.4666667, 1,
1.485925, 0.2160878, 3.026218, 1, 0, 0.4627451, 1,
1.497421, -0.385273, 0.8706026, 1, 0, 0.454902, 1,
1.506328, 1.162498, 0.4696952, 1, 0, 0.4509804, 1,
1.529835, 1.748626, -0.2957017, 1, 0, 0.4431373, 1,
1.531833, 1.228094, 0.8628185, 1, 0, 0.4392157, 1,
1.536611, 0.1434168, 1.75689, 1, 0, 0.4313726, 1,
1.537256, -1.700375, 2.166077, 1, 0, 0.427451, 1,
1.551732, 2.144002, 0.1374531, 1, 0, 0.4196078, 1,
1.560069, -1.620396, 2.071153, 1, 0, 0.4156863, 1,
1.565068, 1.285692, 0.4390678, 1, 0, 0.4078431, 1,
1.570082, -0.9864945, 2.587604, 1, 0, 0.4039216, 1,
1.57658, -1.14011, -0.2466889, 1, 0, 0.3960784, 1,
1.576648, 0.28907, 2.216835, 1, 0, 0.3882353, 1,
1.600832, 1.468146, 1.515442, 1, 0, 0.3843137, 1,
1.602383, -0.3207859, 1.842125, 1, 0, 0.3764706, 1,
1.610356, -0.7810166, 1.683892, 1, 0, 0.372549, 1,
1.618378, -1.037219, 3.419142, 1, 0, 0.3647059, 1,
1.624619, -0.65105, 2.017871, 1, 0, 0.3607843, 1,
1.63156, -1.610765, 1.841829, 1, 0, 0.3529412, 1,
1.634983, -0.4962686, 2.083355, 1, 0, 0.3490196, 1,
1.658391, -1.02375, 2.487057, 1, 0, 0.3411765, 1,
1.674524, 0.3813663, -0.005198118, 1, 0, 0.3372549, 1,
1.675571, 0.9429364, 0.8287342, 1, 0, 0.3294118, 1,
1.678788, -0.6509959, 3.627544, 1, 0, 0.3254902, 1,
1.680248, -1.493328, 3.111632, 1, 0, 0.3176471, 1,
1.693984, 0.4719757, 2.649041, 1, 0, 0.3137255, 1,
1.697725, 2.169777, 0.6316757, 1, 0, 0.3058824, 1,
1.70417, -0.4410635, 1.677856, 1, 0, 0.2980392, 1,
1.714294, -0.01904376, 2.713691, 1, 0, 0.2941177, 1,
1.715698, 1.370023, 1.244972, 1, 0, 0.2862745, 1,
1.727387, -0.8464957, 2.871073, 1, 0, 0.282353, 1,
1.73919, -0.7796562, 1.930343, 1, 0, 0.2745098, 1,
1.750214, 1.224711, 0.3796893, 1, 0, 0.2705882, 1,
1.776244, -0.1902413, 2.184578, 1, 0, 0.2627451, 1,
1.777056, 1.146564, 2.378848, 1, 0, 0.2588235, 1,
1.779463, 0.9387057, 2.075222, 1, 0, 0.2509804, 1,
1.787795, 0.6878808, 1.373215, 1, 0, 0.2470588, 1,
1.78864, 0.1438065, 1.219331, 1, 0, 0.2392157, 1,
1.80423, -0.97047, 0.3775211, 1, 0, 0.2352941, 1,
1.835567, 1.298713, -1.321372, 1, 0, 0.227451, 1,
1.839076, -0.4782358, -0.2066934, 1, 0, 0.2235294, 1,
1.849272, -1.021127, 2.959416, 1, 0, 0.2156863, 1,
1.898635, 1.188191, 2.372588, 1, 0, 0.2117647, 1,
1.919273, -0.4694279, 1.673745, 1, 0, 0.2039216, 1,
1.931271, 2.295489, 0.9584741, 1, 0, 0.1960784, 1,
1.931369, -0.736093, 1.799948, 1, 0, 0.1921569, 1,
1.932807, 1.12943, 1.303481, 1, 0, 0.1843137, 1,
1.962867, -0.6422324, 2.124444, 1, 0, 0.1803922, 1,
2.003241, 1.403577, 1.056503, 1, 0, 0.172549, 1,
2.00486, 2.304648, 0.02176875, 1, 0, 0.1686275, 1,
2.008779, -1.257225, 2.693895, 1, 0, 0.1607843, 1,
2.033179, 1.422507, -1.702382, 1, 0, 0.1568628, 1,
2.045688, 0.384375, 0.2717794, 1, 0, 0.1490196, 1,
2.057336, -1.194414, 1.324779, 1, 0, 0.145098, 1,
2.076664, -2.68735, 3.136403, 1, 0, 0.1372549, 1,
2.090927, 1.52049, 1.319757, 1, 0, 0.1333333, 1,
2.093632, -0.9165365, 2.651034, 1, 0, 0.1254902, 1,
2.095665, -0.1892177, 1.628125, 1, 0, 0.1215686, 1,
2.097104, 0.7087398, -1.050942, 1, 0, 0.1137255, 1,
2.113661, 1.047401, 3.05149, 1, 0, 0.1098039, 1,
2.152475, -0.8321714, 2.743427, 1, 0, 0.1019608, 1,
2.156683, -1.292068, 0.6190647, 1, 0, 0.09411765, 1,
2.174603, -0.474108, 1.775685, 1, 0, 0.09019608, 1,
2.175258, -0.1996232, 1.258584, 1, 0, 0.08235294, 1,
2.184855, -0.06801696, 3.024721, 1, 0, 0.07843138, 1,
2.199779, 0.6490828, 0.6171133, 1, 0, 0.07058824, 1,
2.252799, 0.4014632, 3.253011, 1, 0, 0.06666667, 1,
2.307405, -0.6046471, 1.360881, 1, 0, 0.05882353, 1,
2.347153, 2.039783, 0.5680255, 1, 0, 0.05490196, 1,
2.474665, -0.4900784, 2.239918, 1, 0, 0.04705882, 1,
2.572687, 0.3329877, 2.262644, 1, 0, 0.04313726, 1,
2.616749, -0.9507751, 1.984257, 1, 0, 0.03529412, 1,
2.659075, 0.07187895, 2.137905, 1, 0, 0.03137255, 1,
2.690083, -2.323109, 3.129617, 1, 0, 0.02352941, 1,
2.747712, 0.6835582, 1.373711, 1, 0, 0.01960784, 1,
2.785209, 1.026782, 1.332554, 1, 0, 0.01176471, 1,
2.870558, 0.4782484, 2.044526, 1, 0, 0.007843138, 1
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
-0.1766493, -4.29799, -8.083113, 0, -0.5, 0.5, 0.5,
-0.1766493, -4.29799, -8.083113, 1, -0.5, 0.5, 0.5,
-0.1766493, -4.29799, -8.083113, 1, 1.5, 0.5, 0.5,
-0.1766493, -4.29799, -8.083113, 0, 1.5, 0.5, 0.5
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
-4.25686, 0.05870247, -8.083113, 0, -0.5, 0.5, 0.5,
-4.25686, 0.05870247, -8.083113, 1, -0.5, 0.5, 0.5,
-4.25686, 0.05870247, -8.083113, 1, 1.5, 0.5, 0.5,
-4.25686, 0.05870247, -8.083113, 0, 1.5, 0.5, 0.5
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
-4.25686, -4.29799, -0.3774996, 0, -0.5, 0.5, 0.5,
-4.25686, -4.29799, -0.3774996, 1, -0.5, 0.5, 0.5,
-4.25686, -4.29799, -0.3774996, 1, 1.5, 0.5, 0.5,
-4.25686, -4.29799, -0.3774996, 0, 1.5, 0.5, 0.5
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
-3, -3.292599, -6.304894,
2, -3.292599, -6.304894,
-3, -3.292599, -6.304894,
-3, -3.460164, -6.601264,
-2, -3.292599, -6.304894,
-2, -3.460164, -6.601264,
-1, -3.292599, -6.304894,
-1, -3.460164, -6.601264,
0, -3.292599, -6.304894,
0, -3.460164, -6.601264,
1, -3.292599, -6.304894,
1, -3.460164, -6.601264,
2, -3.292599, -6.304894,
2, -3.460164, -6.601264
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
-3, -3.795295, -7.194004, 0, -0.5, 0.5, 0.5,
-3, -3.795295, -7.194004, 1, -0.5, 0.5, 0.5,
-3, -3.795295, -7.194004, 1, 1.5, 0.5, 0.5,
-3, -3.795295, -7.194004, 0, 1.5, 0.5, 0.5,
-2, -3.795295, -7.194004, 0, -0.5, 0.5, 0.5,
-2, -3.795295, -7.194004, 1, -0.5, 0.5, 0.5,
-2, -3.795295, -7.194004, 1, 1.5, 0.5, 0.5,
-2, -3.795295, -7.194004, 0, 1.5, 0.5, 0.5,
-1, -3.795295, -7.194004, 0, -0.5, 0.5, 0.5,
-1, -3.795295, -7.194004, 1, -0.5, 0.5, 0.5,
-1, -3.795295, -7.194004, 1, 1.5, 0.5, 0.5,
-1, -3.795295, -7.194004, 0, 1.5, 0.5, 0.5,
0, -3.795295, -7.194004, 0, -0.5, 0.5, 0.5,
0, -3.795295, -7.194004, 1, -0.5, 0.5, 0.5,
0, -3.795295, -7.194004, 1, 1.5, 0.5, 0.5,
0, -3.795295, -7.194004, 0, 1.5, 0.5, 0.5,
1, -3.795295, -7.194004, 0, -0.5, 0.5, 0.5,
1, -3.795295, -7.194004, 1, -0.5, 0.5, 0.5,
1, -3.795295, -7.194004, 1, 1.5, 0.5, 0.5,
1, -3.795295, -7.194004, 0, 1.5, 0.5, 0.5,
2, -3.795295, -7.194004, 0, -0.5, 0.5, 0.5,
2, -3.795295, -7.194004, 1, -0.5, 0.5, 0.5,
2, -3.795295, -7.194004, 1, 1.5, 0.5, 0.5,
2, -3.795295, -7.194004, 0, 1.5, 0.5, 0.5
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
-3.315273, -3, -6.304894,
-3.315273, 3, -6.304894,
-3.315273, -3, -6.304894,
-3.472204, -3, -6.601264,
-3.315273, -2, -6.304894,
-3.472204, -2, -6.601264,
-3.315273, -1, -6.304894,
-3.472204, -1, -6.601264,
-3.315273, 0, -6.304894,
-3.472204, 0, -6.601264,
-3.315273, 1, -6.304894,
-3.472204, 1, -6.601264,
-3.315273, 2, -6.304894,
-3.472204, 2, -6.601264,
-3.315273, 3, -6.304894,
-3.472204, 3, -6.601264
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
-3.786066, -3, -7.194004, 0, -0.5, 0.5, 0.5,
-3.786066, -3, -7.194004, 1, -0.5, 0.5, 0.5,
-3.786066, -3, -7.194004, 1, 1.5, 0.5, 0.5,
-3.786066, -3, -7.194004, 0, 1.5, 0.5, 0.5,
-3.786066, -2, -7.194004, 0, -0.5, 0.5, 0.5,
-3.786066, -2, -7.194004, 1, -0.5, 0.5, 0.5,
-3.786066, -2, -7.194004, 1, 1.5, 0.5, 0.5,
-3.786066, -2, -7.194004, 0, 1.5, 0.5, 0.5,
-3.786066, -1, -7.194004, 0, -0.5, 0.5, 0.5,
-3.786066, -1, -7.194004, 1, -0.5, 0.5, 0.5,
-3.786066, -1, -7.194004, 1, 1.5, 0.5, 0.5,
-3.786066, -1, -7.194004, 0, 1.5, 0.5, 0.5,
-3.786066, 0, -7.194004, 0, -0.5, 0.5, 0.5,
-3.786066, 0, -7.194004, 1, -0.5, 0.5, 0.5,
-3.786066, 0, -7.194004, 1, 1.5, 0.5, 0.5,
-3.786066, 0, -7.194004, 0, 1.5, 0.5, 0.5,
-3.786066, 1, -7.194004, 0, -0.5, 0.5, 0.5,
-3.786066, 1, -7.194004, 1, -0.5, 0.5, 0.5,
-3.786066, 1, -7.194004, 1, 1.5, 0.5, 0.5,
-3.786066, 1, -7.194004, 0, 1.5, 0.5, 0.5,
-3.786066, 2, -7.194004, 0, -0.5, 0.5, 0.5,
-3.786066, 2, -7.194004, 1, -0.5, 0.5, 0.5,
-3.786066, 2, -7.194004, 1, 1.5, 0.5, 0.5,
-3.786066, 2, -7.194004, 0, 1.5, 0.5, 0.5,
-3.786066, 3, -7.194004, 0, -0.5, 0.5, 0.5,
-3.786066, 3, -7.194004, 1, -0.5, 0.5, 0.5,
-3.786066, 3, -7.194004, 1, 1.5, 0.5, 0.5,
-3.786066, 3, -7.194004, 0, 1.5, 0.5, 0.5
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
-3.315273, -3.292599, -6,
-3.315273, -3.292599, 4,
-3.315273, -3.292599, -6,
-3.472204, -3.460164, -6,
-3.315273, -3.292599, -4,
-3.472204, -3.460164, -4,
-3.315273, -3.292599, -2,
-3.472204, -3.460164, -2,
-3.315273, -3.292599, 0,
-3.472204, -3.460164, 0,
-3.315273, -3.292599, 2,
-3.472204, -3.460164, 2,
-3.315273, -3.292599, 4,
-3.472204, -3.460164, 4
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
-3.786066, -3.795295, -6, 0, -0.5, 0.5, 0.5,
-3.786066, -3.795295, -6, 1, -0.5, 0.5, 0.5,
-3.786066, -3.795295, -6, 1, 1.5, 0.5, 0.5,
-3.786066, -3.795295, -6, 0, 1.5, 0.5, 0.5,
-3.786066, -3.795295, -4, 0, -0.5, 0.5, 0.5,
-3.786066, -3.795295, -4, 1, -0.5, 0.5, 0.5,
-3.786066, -3.795295, -4, 1, 1.5, 0.5, 0.5,
-3.786066, -3.795295, -4, 0, 1.5, 0.5, 0.5,
-3.786066, -3.795295, -2, 0, -0.5, 0.5, 0.5,
-3.786066, -3.795295, -2, 1, -0.5, 0.5, 0.5,
-3.786066, -3.795295, -2, 1, 1.5, 0.5, 0.5,
-3.786066, -3.795295, -2, 0, 1.5, 0.5, 0.5,
-3.786066, -3.795295, 0, 0, -0.5, 0.5, 0.5,
-3.786066, -3.795295, 0, 1, -0.5, 0.5, 0.5,
-3.786066, -3.795295, 0, 1, 1.5, 0.5, 0.5,
-3.786066, -3.795295, 0, 0, 1.5, 0.5, 0.5,
-3.786066, -3.795295, 2, 0, -0.5, 0.5, 0.5,
-3.786066, -3.795295, 2, 1, -0.5, 0.5, 0.5,
-3.786066, -3.795295, 2, 1, 1.5, 0.5, 0.5,
-3.786066, -3.795295, 2, 0, 1.5, 0.5, 0.5,
-3.786066, -3.795295, 4, 0, -0.5, 0.5, 0.5,
-3.786066, -3.795295, 4, 1, -0.5, 0.5, 0.5,
-3.786066, -3.795295, 4, 1, 1.5, 0.5, 0.5,
-3.786066, -3.795295, 4, 0, 1.5, 0.5, 0.5
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
-3.315273, -3.292599, -6.304894,
-3.315273, 3.410004, -6.304894,
-3.315273, -3.292599, 5.549895,
-3.315273, 3.410004, 5.549895,
-3.315273, -3.292599, -6.304894,
-3.315273, -3.292599, 5.549895,
-3.315273, 3.410004, -6.304894,
-3.315273, 3.410004, 5.549895,
-3.315273, -3.292599, -6.304894,
2.961974, -3.292599, -6.304894,
-3.315273, -3.292599, 5.549895,
2.961974, -3.292599, 5.549895,
-3.315273, 3.410004, -6.304894,
2.961974, 3.410004, -6.304894,
-3.315273, 3.410004, 5.549895,
2.961974, 3.410004, 5.549895,
2.961974, -3.292599, -6.304894,
2.961974, 3.410004, -6.304894,
2.961974, -3.292599, 5.549895,
2.961974, 3.410004, 5.549895,
2.961974, -3.292599, -6.304894,
2.961974, -3.292599, 5.549895,
2.961974, 3.410004, -6.304894,
2.961974, 3.410004, 5.549895
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
var radius = 8.007301;
var distance = 35.62539;
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
mvMatrix.translate( 0.1766493, -0.05870247, 0.3774996 );
mvMatrix.scale( 1.379212, 1.291685, 0.7303083 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.62539);
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
pentoxy<-read.table("pentoxy.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-pentoxy$V2
```

```
## Error in eval(expr, envir, enclos): object 'pentoxy' not found
```

```r
y<-pentoxy$V3
```

```
## Error in eval(expr, envir, enclos): object 'pentoxy' not found
```

```r
z<-pentoxy$V4
```

```
## Error in eval(expr, envir, enclos): object 'pentoxy' not found
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
-3.223856, 0.6050193, -2.211753, 0, 0, 1, 1, 1,
-2.803559, 0.7830608, -2.791725, 1, 0, 0, 1, 1,
-2.781171, -1.118812, -0.4860676, 1, 0, 0, 1, 1,
-2.608193, -0.1197583, -0.8524647, 1, 0, 0, 1, 1,
-2.576507, -0.02042322, -1.485471, 1, 0, 0, 1, 1,
-2.49742, 0.3996354, -1.813462, 1, 0, 0, 1, 1,
-2.474483, 0.01559819, -1.665655, 0, 0, 0, 1, 1,
-2.398775, 0.03389404, -2.74862, 0, 0, 0, 1, 1,
-2.390391, 1.625304, -1.317062, 0, 0, 0, 1, 1,
-2.390115, 0.8932301, -0.2707592, 0, 0, 0, 1, 1,
-2.283135, -1.378303, -2.219376, 0, 0, 0, 1, 1,
-2.261264, -1.747979, -0.8714144, 0, 0, 0, 1, 1,
-2.188826, -0.515833, -2.036994, 0, 0, 0, 1, 1,
-2.169448, -0.4695796, -3.2522, 1, 1, 1, 1, 1,
-2.128592, 0.7312291, -1.631035, 1, 1, 1, 1, 1,
-2.121738, -1.222758, -2.266854, 1, 1, 1, 1, 1,
-2.097422, -0.3579568, -3.023644, 1, 1, 1, 1, 1,
-2.067142, 0.9149413, 1.398426, 1, 1, 1, 1, 1,
-2.052639, -1.071455, -2.910194, 1, 1, 1, 1, 1,
-2.038384, -0.2248544, -1.06618, 1, 1, 1, 1, 1,
-2.003168, -1.660176, -1.152973, 1, 1, 1, 1, 1,
-2.001021, 1.086091, 0.2044297, 1, 1, 1, 1, 1,
-1.99586, 0.5792677, -0.3597907, 1, 1, 1, 1, 1,
-1.990016, 0.6457459, -1.282875, 1, 1, 1, 1, 1,
-1.964205, -0.1323457, -1.761399, 1, 1, 1, 1, 1,
-1.955553, 0.3985504, -1.933224, 1, 1, 1, 1, 1,
-1.934772, 0.5375038, 0.08256187, 1, 1, 1, 1, 1,
-1.915782, -0.4586676, -2.777023, 1, 1, 1, 1, 1,
-1.892927, 0.07263789, -2.662142, 0, 0, 1, 1, 1,
-1.886855, -0.3986124, -1.409307, 1, 0, 0, 1, 1,
-1.850799, 1.422704, -0.5886711, 1, 0, 0, 1, 1,
-1.849972, 0.8060458, 0.2499842, 1, 0, 0, 1, 1,
-1.834739, 0.1609852, -2.295097, 1, 0, 0, 1, 1,
-1.832117, -2.356937, -1.412546, 1, 0, 0, 1, 1,
-1.825084, -1.168864, -2.367821, 0, 0, 0, 1, 1,
-1.796917, 1.935507, -1.863522, 0, 0, 0, 1, 1,
-1.788284, 1.610222, -0.3729888, 0, 0, 0, 1, 1,
-1.759549, -1.551965, -2.824833, 0, 0, 0, 1, 1,
-1.730704, 2.538593, -0.8367813, 0, 0, 0, 1, 1,
-1.723357, -0.6102742, -2.575143, 0, 0, 0, 1, 1,
-1.710361, 0.4654691, -2.493991, 0, 0, 0, 1, 1,
-1.700276, 0.1461346, -0.7222784, 1, 1, 1, 1, 1,
-1.686611, 1.257852, -0.4073321, 1, 1, 1, 1, 1,
-1.680059, 0.3402444, 0.5481422, 1, 1, 1, 1, 1,
-1.677429, -2.094985, -1.968146, 1, 1, 1, 1, 1,
-1.654278, 0.7895795, -0.132507, 1, 1, 1, 1, 1,
-1.648802, -1.12481, -1.904904, 1, 1, 1, 1, 1,
-1.636397, -0.5224954, -0.8654785, 1, 1, 1, 1, 1,
-1.62986, 1.054935, -1.383203, 1, 1, 1, 1, 1,
-1.629255, 0.1906339, -1.734462, 1, 1, 1, 1, 1,
-1.627615, 0.6385207, -1.904997, 1, 1, 1, 1, 1,
-1.59896, 0.3164064, -0.1072625, 1, 1, 1, 1, 1,
-1.597304, -0.7174123, -1.716153, 1, 1, 1, 1, 1,
-1.586535, 0.138782, -1.335253, 1, 1, 1, 1, 1,
-1.580431, -1.330129, -3.29273, 1, 1, 1, 1, 1,
-1.57397, 0.01259757, -1.498385, 1, 1, 1, 1, 1,
-1.559796, 0.4932705, -3.514317, 0, 0, 1, 1, 1,
-1.555447, -0.4962794, -2.218137, 1, 0, 0, 1, 1,
-1.547906, -0.9254606, -2.518097, 1, 0, 0, 1, 1,
-1.525386, 0.3009397, -3.425233, 1, 0, 0, 1, 1,
-1.524056, 1.868837, -0.6826711, 1, 0, 0, 1, 1,
-1.522011, -0.2161938, -0.474605, 1, 0, 0, 1, 1,
-1.517817, -0.5007694, -2.093426, 0, 0, 0, 1, 1,
-1.515473, 0.1971177, -1.770681, 0, 0, 0, 1, 1,
-1.502178, -1.275292, -1.426532, 0, 0, 0, 1, 1,
-1.496277, -0.7941366, -3.288496, 0, 0, 0, 1, 1,
-1.491589, -1.328638, -2.011847, 0, 0, 0, 1, 1,
-1.47731, 0.2595735, -0.4247341, 0, 0, 0, 1, 1,
-1.473652, 0.0759102, -3.865839, 0, 0, 0, 1, 1,
-1.465668, 0.09961405, -1.181007, 1, 1, 1, 1, 1,
-1.462711, 0.4057848, -1.538661, 1, 1, 1, 1, 1,
-1.461437, -0.170251, -1.93002, 1, 1, 1, 1, 1,
-1.450099, 0.9893122, -1.988876, 1, 1, 1, 1, 1,
-1.446618, 1.490588, 1.498664, 1, 1, 1, 1, 1,
-1.443758, 0.2405326, -1.996424, 1, 1, 1, 1, 1,
-1.439911, 0.2903165, -2.004152, 1, 1, 1, 1, 1,
-1.437575, 0.1132935, -1.771993, 1, 1, 1, 1, 1,
-1.412458, 0.4594734, -0.622427, 1, 1, 1, 1, 1,
-1.412166, 0.1695905, -2.001807, 1, 1, 1, 1, 1,
-1.394616, -1.805181, -2.583966, 1, 1, 1, 1, 1,
-1.393522, -2.637415, -2.273323, 1, 1, 1, 1, 1,
-1.38383, -0.7578754, 0.1405236, 1, 1, 1, 1, 1,
-1.381886, -0.7519118, -1.930309, 1, 1, 1, 1, 1,
-1.373607, -0.2851908, 0.5620242, 1, 1, 1, 1, 1,
-1.373512, -0.3102131, -3.082374, 0, 0, 1, 1, 1,
-1.369818, 0.9859373, -1.172815, 1, 0, 0, 1, 1,
-1.36975, 0.5662419, -1.677626, 1, 0, 0, 1, 1,
-1.349777, -0.9172462, -0.4946375, 1, 0, 0, 1, 1,
-1.340881, -0.2255254, -3.211426, 1, 0, 0, 1, 1,
-1.340043, 0.3754549, -3.363041, 1, 0, 0, 1, 1,
-1.338235, -0.6009115, -2.460814, 0, 0, 0, 1, 1,
-1.337728, 0.0530689, -3.034125, 0, 0, 0, 1, 1,
-1.32976, -1.231359, -2.173958, 0, 0, 0, 1, 1,
-1.323507, -1.322374, -4.145346, 0, 0, 0, 1, 1,
-1.294157, -0.2975733, -3.80937, 0, 0, 0, 1, 1,
-1.293653, -0.9560527, -3.669404, 0, 0, 0, 1, 1,
-1.288539, -1.248179, -2.810773, 0, 0, 0, 1, 1,
-1.277829, -1.045182, -2.155508, 1, 1, 1, 1, 1,
-1.270516, 0.006424771, -1.25598, 1, 1, 1, 1, 1,
-1.269478, -0.6213267, -3.351601, 1, 1, 1, 1, 1,
-1.267199, 1.664169, -1.01981, 1, 1, 1, 1, 1,
-1.263851, -0.7770043, -2.495715, 1, 1, 1, 1, 1,
-1.25813, -0.8494315, -1.696957, 1, 1, 1, 1, 1,
-1.245687, -0.1725788, -1.968627, 1, 1, 1, 1, 1,
-1.24489, 1.280216, -0.4818808, 1, 1, 1, 1, 1,
-1.240999, -0.2180142, -1.571089, 1, 1, 1, 1, 1,
-1.239351, -0.4228036, -0.680967, 1, 1, 1, 1, 1,
-1.234802, -0.9205772, -1.964548, 1, 1, 1, 1, 1,
-1.232775, -0.7946523, -3.685982, 1, 1, 1, 1, 1,
-1.228926, -1.294031, -2.811677, 1, 1, 1, 1, 1,
-1.227524, 0.8929175, -1.115074, 1, 1, 1, 1, 1,
-1.227305, 1.812303, -0.294688, 1, 1, 1, 1, 1,
-1.226226, -1.320438, -3.048702, 0, 0, 1, 1, 1,
-1.22523, -1.354041, -2.369271, 1, 0, 0, 1, 1,
-1.223884, -0.3917932, -2.24026, 1, 0, 0, 1, 1,
-1.221225, 0.7590141, -0.4929937, 1, 0, 0, 1, 1,
-1.216733, 0.8283003, 1.024915, 1, 0, 0, 1, 1,
-1.213656, 0.8027734, -1.800598, 1, 0, 0, 1, 1,
-1.212694, 0.1531316, -1.441238, 0, 0, 0, 1, 1,
-1.196552, 0.2188656, -1.460747, 0, 0, 0, 1, 1,
-1.193977, 1.231243, -0.7987409, 0, 0, 0, 1, 1,
-1.191283, 0.1850641, -2.614014, 0, 0, 0, 1, 1,
-1.189851, -0.3375399, -2.652882, 0, 0, 0, 1, 1,
-1.186926, -0.7427214, -2.893583, 0, 0, 0, 1, 1,
-1.174444, -1.301659, -2.363735, 0, 0, 0, 1, 1,
-1.172298, 1.50523, -0.2362286, 1, 1, 1, 1, 1,
-1.169044, -2.180661, -4.162718, 1, 1, 1, 1, 1,
-1.16082, -1.157774, -3.272526, 1, 1, 1, 1, 1,
-1.159363, 0.1868564, -0.3222375, 1, 1, 1, 1, 1,
-1.157814, -0.9764566, -3.545432, 1, 1, 1, 1, 1,
-1.145629, 0.03554881, -1.793498, 1, 1, 1, 1, 1,
-1.145096, 0.9243929, -2.371319, 1, 1, 1, 1, 1,
-1.140714, 1.379427, -2.047003, 1, 1, 1, 1, 1,
-1.114188, 0.476951, -1.864954, 1, 1, 1, 1, 1,
-1.110733, -0.711746, -1.26388, 1, 1, 1, 1, 1,
-1.109589, 0.3317153, 0.1620956, 1, 1, 1, 1, 1,
-1.103325, 1.650438, -1.444771, 1, 1, 1, 1, 1,
-1.102553, -0.9062614, -2.618103, 1, 1, 1, 1, 1,
-1.102551, 0.0729472, 0.1426968, 1, 1, 1, 1, 1,
-1.102413, 0.9465653, -2.011649, 1, 1, 1, 1, 1,
-1.102387, 0.114734, -1.863442, 0, 0, 1, 1, 1,
-1.102168, 0.2271761, -1.746345, 1, 0, 0, 1, 1,
-1.101557, 0.4748927, -0.006566696, 1, 0, 0, 1, 1,
-1.094961, 0.7737141, -1.581801, 1, 0, 0, 1, 1,
-1.092044, -0.7195274, -2.480689, 1, 0, 0, 1, 1,
-1.088027, 1.167694, -0.4758356, 1, 0, 0, 1, 1,
-1.079787, -0.7190948, -1.34917, 0, 0, 0, 1, 1,
-1.073488, -1.077312, -3.475688, 0, 0, 0, 1, 1,
-1.068917, -2.84884, 0.3537916, 0, 0, 0, 1, 1,
-1.067272, 0.2316861, 0.8140329, 0, 0, 0, 1, 1,
-1.066131, -1.806399, -2.443421, 0, 0, 0, 1, 1,
-1.061395, -0.8925425, -2.251691, 0, 0, 0, 1, 1,
-1.059262, 0.4051321, -1.66985, 0, 0, 0, 1, 1,
-1.046779, -0.3577017, -2.495841, 1, 1, 1, 1, 1,
-1.039975, 0.3313391, -1.984771, 1, 1, 1, 1, 1,
-1.03994, 0.4446893, -0.3445958, 1, 1, 1, 1, 1,
-1.028635, -0.8268881, -0.8331295, 1, 1, 1, 1, 1,
-1.020808, -0.3995087, -3.76699, 1, 1, 1, 1, 1,
-1.015652, -0.6459703, -3.13208, 1, 1, 1, 1, 1,
-1.014227, -0.8819607, -2.216255, 1, 1, 1, 1, 1,
-1.000918, -0.3889514, -1.503821, 1, 1, 1, 1, 1,
-0.994997, -1.284012, -1.54377, 1, 1, 1, 1, 1,
-0.990688, 0.1331469, -0.06084782, 1, 1, 1, 1, 1,
-0.9854643, -0.247677, -2.037603, 1, 1, 1, 1, 1,
-0.9849002, 1.647251, -1.216746, 1, 1, 1, 1, 1,
-0.9777777, -2.357302, -3.171227, 1, 1, 1, 1, 1,
-0.9712112, -2.054608, -3.938583, 1, 1, 1, 1, 1,
-0.9623218, 0.6009767, -2.080135, 1, 1, 1, 1, 1,
-0.9620513, 0.3208619, -1.210313, 0, 0, 1, 1, 1,
-0.9583295, 0.4131229, -1.583012, 1, 0, 0, 1, 1,
-0.9575696, 0.3404576, -1.027585, 1, 0, 0, 1, 1,
-0.9553778, 0.05414504, -1.721827, 1, 0, 0, 1, 1,
-0.9530956, -1.406384, -3.377504, 1, 0, 0, 1, 1,
-0.9510474, -0.4531949, -1.507901, 1, 0, 0, 1, 1,
-0.9490902, 0.1943194, -0.4002025, 0, 0, 0, 1, 1,
-0.9447711, -0.4101405, 0.3302608, 0, 0, 0, 1, 1,
-0.9434319, 0.05066966, -2.266014, 0, 0, 0, 1, 1,
-0.9319358, -0.7498718, -3.338615, 0, 0, 0, 1, 1,
-0.9316025, -0.4248784, -2.066775, 0, 0, 0, 1, 1,
-0.9299039, -0.5223099, -1.292845, 0, 0, 0, 1, 1,
-0.9259681, -0.07357843, -2.266707, 0, 0, 0, 1, 1,
-0.9209592, 0.5846104, -0.4992675, 1, 1, 1, 1, 1,
-0.9071158, 0.9472581, -0.396549, 1, 1, 1, 1, 1,
-0.9065015, -1.143405, -3.107492, 1, 1, 1, 1, 1,
-0.9039154, -1.10508, -3.353189, 1, 1, 1, 1, 1,
-0.9038984, -0.4485097, -2.930638, 1, 1, 1, 1, 1,
-0.9004087, -0.1332045, -2.063394, 1, 1, 1, 1, 1,
-0.8991441, 0.860419, -2.658636, 1, 1, 1, 1, 1,
-0.8913212, -0.7173749, -2.397008, 1, 1, 1, 1, 1,
-0.8870618, 2.505637, -0.7735378, 1, 1, 1, 1, 1,
-0.8859517, 3.144415, 1.202661, 1, 1, 1, 1, 1,
-0.8734774, -1.411923, -6.132252, 1, 1, 1, 1, 1,
-0.8705484, -1.081727, -1.682624, 1, 1, 1, 1, 1,
-0.8690514, 0.3352191, -1.496243, 1, 1, 1, 1, 1,
-0.8625969, -0.05731254, -1.873422, 1, 1, 1, 1, 1,
-0.8553044, -1.335793, -2.736356, 1, 1, 1, 1, 1,
-0.8481865, 0.75796, -1.622667, 0, 0, 1, 1, 1,
-0.8477107, 0.1463898, 0.9563057, 1, 0, 0, 1, 1,
-0.8455481, -0.215765, -2.227392, 1, 0, 0, 1, 1,
-0.8356309, -0.34231, -1.971152, 1, 0, 0, 1, 1,
-0.8352323, 0.7705265, -0.1563295, 1, 0, 0, 1, 1,
-0.8348498, 0.9243398, 0.7107775, 1, 0, 0, 1, 1,
-0.8328779, 0.3022316, -2.584989, 0, 0, 0, 1, 1,
-0.8328239, 0.4442398, -1.6463, 0, 0, 0, 1, 1,
-0.8323764, 1.318026, -0.07733493, 0, 0, 0, 1, 1,
-0.8317186, 1.097498, -1.809571, 0, 0, 0, 1, 1,
-0.8292397, -1.881077, -3.759382, 0, 0, 0, 1, 1,
-0.8128858, 1.455854, 1.150244, 0, 0, 0, 1, 1,
-0.8098799, -1.600769, -4.204957, 0, 0, 0, 1, 1,
-0.8092504, 0.632925, -0.9690809, 1, 1, 1, 1, 1,
-0.8089353, -0.3380448, -0.2163457, 1, 1, 1, 1, 1,
-0.8016505, 1.72288, -1.258768, 1, 1, 1, 1, 1,
-0.8006686, 0.25521, -3.139134, 1, 1, 1, 1, 1,
-0.7972093, -0.7236821, -2.160868, 1, 1, 1, 1, 1,
-0.7926099, -1.141524, -3.336875, 1, 1, 1, 1, 1,
-0.7877858, -0.08548011, -1.594125, 1, 1, 1, 1, 1,
-0.7866887, 0.4463857, -2.262039, 1, 1, 1, 1, 1,
-0.7861084, 0.7399734, -1.833627, 1, 1, 1, 1, 1,
-0.7853966, 0.07320305, -1.512311, 1, 1, 1, 1, 1,
-0.7800218, -0.03164902, -0.8026811, 1, 1, 1, 1, 1,
-0.776246, -0.4674504, -1.337375, 1, 1, 1, 1, 1,
-0.7739956, 1.876475, -1.346482, 1, 1, 1, 1, 1,
-0.7691434, -2.524728, -2.594805, 1, 1, 1, 1, 1,
-0.7685169, -0.3971765, -0.9530939, 1, 1, 1, 1, 1,
-0.7657892, 1.090274, 0.2293912, 0, 0, 1, 1, 1,
-0.7653841, -0.2677188, -0.1764714, 1, 0, 0, 1, 1,
-0.7618161, -1.134677, -1.6261, 1, 0, 0, 1, 1,
-0.7553457, 0.8182654, -1.627452, 1, 0, 0, 1, 1,
-0.7486482, 0.2702966, -3.195245, 1, 0, 0, 1, 1,
-0.7452067, -0.8431767, -2.936171, 1, 0, 0, 1, 1,
-0.7414999, -0.3613201, -2.328502, 0, 0, 0, 1, 1,
-0.7405762, -0.1222801, -1.764984, 0, 0, 0, 1, 1,
-0.7319706, -0.311626, -1.753812, 0, 0, 0, 1, 1,
-0.7289767, -2.189991, -4.568005, 0, 0, 0, 1, 1,
-0.7208405, 1.913538, -1.978881, 0, 0, 0, 1, 1,
-0.7166216, -0.4121498, -3.587121, 0, 0, 0, 1, 1,
-0.7150707, -0.03620323, -2.625015, 0, 0, 0, 1, 1,
-0.7138714, -1.199834, -1.07859, 1, 1, 1, 1, 1,
-0.7127135, -1.211736, -2.894638, 1, 1, 1, 1, 1,
-0.7063044, 0.1179518, -3.180318, 1, 1, 1, 1, 1,
-0.7053593, 0.5159587, 0.6164756, 1, 1, 1, 1, 1,
-0.68935, 0.4085236, 1.644582, 1, 1, 1, 1, 1,
-0.6870288, -1.103561, -1.74574, 1, 1, 1, 1, 1,
-0.6847343, -1.03011, -1.732067, 1, 1, 1, 1, 1,
-0.6836376, 0.3361963, -0.9810877, 1, 1, 1, 1, 1,
-0.676675, -0.2279086, -1.891934, 1, 1, 1, 1, 1,
-0.6741541, -0.3525715, -0.1099664, 1, 1, 1, 1, 1,
-0.6734918, -0.9999953, -1.69202, 1, 1, 1, 1, 1,
-0.671988, -0.8081903, -4.453662, 1, 1, 1, 1, 1,
-0.67098, -0.2861481, -2.018343, 1, 1, 1, 1, 1,
-0.6706232, 0.1178632, -0.8095807, 1, 1, 1, 1, 1,
-0.6685331, 0.7465381, -1.624195, 1, 1, 1, 1, 1,
-0.6681694, -0.05034118, -0.6229565, 0, 0, 1, 1, 1,
-0.6592933, -0.6703259, -5.16954, 1, 0, 0, 1, 1,
-0.6452673, 1.556981, -0.8516819, 1, 0, 0, 1, 1,
-0.6437359, -1.201649, -1.69489, 1, 0, 0, 1, 1,
-0.631628, 0.1042673, -1.316324, 1, 0, 0, 1, 1,
-0.6311815, -1.32432, -1.144607, 1, 0, 0, 1, 1,
-0.629257, -0.1215961, -2.68359, 0, 0, 0, 1, 1,
-0.6280458, 0.6624764, -1.599853, 0, 0, 0, 1, 1,
-0.6176744, 0.5698876, 0.4052964, 0, 0, 0, 1, 1,
-0.6121773, -0.6505655, -4.156338, 0, 0, 0, 1, 1,
-0.6085679, 0.7426692, -1.883287, 0, 0, 0, 1, 1,
-0.6039795, -1.265199, -2.896453, 0, 0, 0, 1, 1,
-0.5993974, 0.2842109, 0.748071, 0, 0, 0, 1, 1,
-0.5984045, 0.7308112, -0.6989314, 1, 1, 1, 1, 1,
-0.5887475, -1.045513, -2.250154, 1, 1, 1, 1, 1,
-0.5826447, -1.094226, -3.372023, 1, 1, 1, 1, 1,
-0.5810897, -0.2648318, -0.859944, 1, 1, 1, 1, 1,
-0.580987, -2.687799, -3.433805, 1, 1, 1, 1, 1,
-0.5712122, 1.060026, -0.1394183, 1, 1, 1, 1, 1,
-0.5666924, 0.5856061, -1.192752, 1, 1, 1, 1, 1,
-0.5652555, 0.5580245, -2.464246, 1, 1, 1, 1, 1,
-0.5569831, 0.5112612, -0.6729732, 1, 1, 1, 1, 1,
-0.5501813, -0.5714446, -1.691543, 1, 1, 1, 1, 1,
-0.5485166, 0.522059, -1.629359, 1, 1, 1, 1, 1,
-0.5466554, 0.7082395, -1.489796, 1, 1, 1, 1, 1,
-0.5464315, -3.194988, -4.495018, 1, 1, 1, 1, 1,
-0.5455765, -0.7590934, -3.587796, 1, 1, 1, 1, 1,
-0.5453249, -0.2520885, -0.9373925, 1, 1, 1, 1, 1,
-0.5444179, -2.308753, -1.910136, 0, 0, 1, 1, 1,
-0.5436905, -0.658834, -1.723036, 1, 0, 0, 1, 1,
-0.5398591, -0.3092836, -1.373848, 1, 0, 0, 1, 1,
-0.5321877, 0.6887252, -0.2797913, 1, 0, 0, 1, 1,
-0.5299771, -0.6063583, -0.9313068, 1, 0, 0, 1, 1,
-0.5247692, -0.6086226, -2.385312, 1, 0, 0, 1, 1,
-0.5204726, 0.2701909, -0.2793736, 0, 0, 0, 1, 1,
-0.5178276, -0.7013738, -2.494447, 0, 0, 0, 1, 1,
-0.5169652, -1.123739, -3.413569, 0, 0, 0, 1, 1,
-0.5166526, 0.4728523, -2.031198, 0, 0, 0, 1, 1,
-0.5105303, -0.2066855, -2.155326, 0, 0, 0, 1, 1,
-0.506835, 1.011811, -1.661893, 0, 0, 0, 1, 1,
-0.5052326, -1.028022, -2.757848, 0, 0, 0, 1, 1,
-0.496678, 0.2984129, 0.3400096, 1, 1, 1, 1, 1,
-0.4922401, 0.5936584, -1.072206, 1, 1, 1, 1, 1,
-0.4906801, -1.189696, -1.922414, 1, 1, 1, 1, 1,
-0.4877314, -1.007201, -3.685921, 1, 1, 1, 1, 1,
-0.486785, -1.593519, -0.1736567, 1, 1, 1, 1, 1,
-0.4816597, 0.05876483, -2.574703, 1, 1, 1, 1, 1,
-0.4813032, 0.6689284, -1.861021, 1, 1, 1, 1, 1,
-0.4804038, 0.6944643, -0.5598536, 1, 1, 1, 1, 1,
-0.4796916, -0.7512462, -4.50157, 1, 1, 1, 1, 1,
-0.478011, 0.9924432, -1.637369, 1, 1, 1, 1, 1,
-0.4768099, 0.5944066, 0.7472048, 1, 1, 1, 1, 1,
-0.4748743, -1.317732, -3.79739, 1, 1, 1, 1, 1,
-0.4746965, -1.194018, -2.690147, 1, 1, 1, 1, 1,
-0.4739403, 0.7094069, -1.17427, 1, 1, 1, 1, 1,
-0.4728924, -0.4317024, -1.857419, 1, 1, 1, 1, 1,
-0.4726872, 1.348752, -1.227043, 0, 0, 1, 1, 1,
-0.4724209, -0.08342124, -1.876161, 1, 0, 0, 1, 1,
-0.471229, 1.041999, -1.99509, 1, 0, 0, 1, 1,
-0.4670781, -0.2432347, -1.863538, 1, 0, 0, 1, 1,
-0.4658219, 0.599234, -1.238839, 1, 0, 0, 1, 1,
-0.4648128, -1.414129, -0.6908907, 1, 0, 0, 1, 1,
-0.4574523, 0.9139966, -0.3385802, 0, 0, 0, 1, 1,
-0.4566993, 0.03076414, 0.424405, 0, 0, 0, 1, 1,
-0.4534621, -1.712742, -2.553013, 0, 0, 0, 1, 1,
-0.4533853, 0.02145077, -1.967849, 0, 0, 0, 1, 1,
-0.4497275, 1.503795, -1.331146, 0, 0, 0, 1, 1,
-0.4496369, -1.122181, -3.934739, 0, 0, 0, 1, 1,
-0.4473298, 1.5851, -0.45626, 0, 0, 0, 1, 1,
-0.4472786, -1.396332, -4.614872, 1, 1, 1, 1, 1,
-0.445136, -0.5443962, -3.261962, 1, 1, 1, 1, 1,
-0.4398534, 0.931492, -1.137166, 1, 1, 1, 1, 1,
-0.4392711, -0.2079553, -0.9069282, 1, 1, 1, 1, 1,
-0.4374073, 1.561752, -0.6043206, 1, 1, 1, 1, 1,
-0.437097, -0.874387, -2.697666, 1, 1, 1, 1, 1,
-0.4323179, -0.1898949, -3.281518, 1, 1, 1, 1, 1,
-0.4283446, -0.6444489, -2.185467, 1, 1, 1, 1, 1,
-0.4276333, 0.3207654, -1.891223, 1, 1, 1, 1, 1,
-0.4218568, 1.310194, -1.375164, 1, 1, 1, 1, 1,
-0.4206996, 0.4104566, -0.9829361, 1, 1, 1, 1, 1,
-0.4201556, -1.564435, -4.189217, 1, 1, 1, 1, 1,
-0.4181021, 0.4188808, -0.04741646, 1, 1, 1, 1, 1,
-0.4113226, 0.4892343, 0.5047166, 1, 1, 1, 1, 1,
-0.4101485, -0.647844, -1.192976, 1, 1, 1, 1, 1,
-0.4083973, 1.907699, 1.582074, 0, 0, 1, 1, 1,
-0.4057169, 0.598147, 0.5186559, 1, 0, 0, 1, 1,
-0.4044052, 1.158534, -2.893258, 1, 0, 0, 1, 1,
-0.4034914, -1.368763, -3.000954, 1, 0, 0, 1, 1,
-0.400464, -0.8746761, -2.664321, 1, 0, 0, 1, 1,
-0.3987295, -0.8457795, -4.154057, 1, 0, 0, 1, 1,
-0.3987054, 1.144454, -0.1419836, 0, 0, 0, 1, 1,
-0.3898855, 1.673478, 0.08099058, 0, 0, 0, 1, 1,
-0.3898032, -0.0266982, -0.5408556, 0, 0, 0, 1, 1,
-0.3880973, 2.412239, -1.486143, 0, 0, 0, 1, 1,
-0.3843879, -0.004448301, -2.542627, 0, 0, 0, 1, 1,
-0.3827887, 0.3282964, -0.290063, 0, 0, 0, 1, 1,
-0.3743661, 0.2162138, -1.930496, 0, 0, 0, 1, 1,
-0.3736801, 0.6548635, 0.6526645, 1, 1, 1, 1, 1,
-0.369288, 0.6766782, -0.6133113, 1, 1, 1, 1, 1,
-0.3672932, 0.479417, 0.2372478, 1, 1, 1, 1, 1,
-0.3667387, -0.9313379, -1.851936, 1, 1, 1, 1, 1,
-0.3652932, 1.431516, -0.4346855, 1, 1, 1, 1, 1,
-0.3632194, -1.619394, -2.640304, 1, 1, 1, 1, 1,
-0.3624342, 2.345505, -1.366121, 1, 1, 1, 1, 1,
-0.3617662, 0.5545521, -0.6891673, 1, 1, 1, 1, 1,
-0.3616288, -0.9930567, -2.221051, 1, 1, 1, 1, 1,
-0.3607913, -0.8597565, -2.346607, 1, 1, 1, 1, 1,
-0.3598462, -0.3009447, -1.290241, 1, 1, 1, 1, 1,
-0.3516767, -0.2206434, -2.824843, 1, 1, 1, 1, 1,
-0.3515441, -0.799868, -1.873452, 1, 1, 1, 1, 1,
-0.3471786, -0.2592377, -0.1618092, 1, 1, 1, 1, 1,
-0.3462538, -0.6100642, -1.960316, 1, 1, 1, 1, 1,
-0.3427106, -0.2443942, -2.136356, 0, 0, 1, 1, 1,
-0.340889, -0.7311193, -1.631967, 1, 0, 0, 1, 1,
-0.3337435, 0.4050823, -1.474414, 1, 0, 0, 1, 1,
-0.3278934, -0.3049489, -3.375363, 1, 0, 0, 1, 1,
-0.3272653, 0.7475118, -2.306368, 1, 0, 0, 1, 1,
-0.32481, 0.5374917, -0.4797046, 1, 0, 0, 1, 1,
-0.3199663, -1.253689, -3.152922, 0, 0, 0, 1, 1,
-0.319249, 1.151641, 0.1074067, 0, 0, 0, 1, 1,
-0.3183719, -0.01419274, -1.334439, 0, 0, 0, 1, 1,
-0.316484, 1.252143, 0.6269581, 0, 0, 0, 1, 1,
-0.3157909, -0.7853192, -2.288165, 0, 0, 0, 1, 1,
-0.3143723, -1.568382, -2.002605, 0, 0, 0, 1, 1,
-0.3122377, 1.01535, 0.3296356, 0, 0, 0, 1, 1,
-0.3107884, -1.582803, -2.545766, 1, 1, 1, 1, 1,
-0.3060413, 0.5435165, -1.536889, 1, 1, 1, 1, 1,
-0.3035866, 1.364159, -0.958888, 1, 1, 1, 1, 1,
-0.3014346, 0.2777143, 0.3652552, 1, 1, 1, 1, 1,
-0.3005844, -0.08667568, -3.622498, 1, 1, 1, 1, 1,
-0.2994441, -0.06118882, -2.126322, 1, 1, 1, 1, 1,
-0.2894494, 0.9337881, 0.9197756, 1, 1, 1, 1, 1,
-0.2833655, 0.1658102, -0.6937638, 1, 1, 1, 1, 1,
-0.2820193, 1.239887, -0.4615976, 1, 1, 1, 1, 1,
-0.2792184, 0.4317349, -0.5468746, 1, 1, 1, 1, 1,
-0.2704757, 0.1121864, -0.9980025, 1, 1, 1, 1, 1,
-0.2695739, -0.6565089, -1.377561, 1, 1, 1, 1, 1,
-0.268168, 0.6096651, -1.624942, 1, 1, 1, 1, 1,
-0.2659367, 0.2032355, -0.9730211, 1, 1, 1, 1, 1,
-0.2644203, 1.252107, -0.523941, 1, 1, 1, 1, 1,
-0.2632777, -2.63886, -3.205924, 0, 0, 1, 1, 1,
-0.2607987, -1.215639, -3.323164, 1, 0, 0, 1, 1,
-0.2586216, -1.851336, -3.59805, 1, 0, 0, 1, 1,
-0.2573765, -0.3396153, -2.60768, 1, 0, 0, 1, 1,
-0.2558946, -0.828261, -2.480859, 1, 0, 0, 1, 1,
-0.2540887, -1.867115, -4.762817, 1, 0, 0, 1, 1,
-0.2529635, 0.5286909, -1.260879, 0, 0, 0, 1, 1,
-0.2453454, -1.294773, -2.517515, 0, 0, 0, 1, 1,
-0.2435599, 0.5132247, -3.060105, 0, 0, 0, 1, 1,
-0.2411839, -0.6839215, -3.963936, 0, 0, 0, 1, 1,
-0.2364303, 0.6070914, -0.6270913, 0, 0, 0, 1, 1,
-0.2320542, -0.9279388, -3.16328, 0, 0, 0, 1, 1,
-0.2281733, 0.2898206, -2.419448, 0, 0, 0, 1, 1,
-0.2270671, -0.1700986, -2.342659, 1, 1, 1, 1, 1,
-0.2249911, -0.390437, -2.976974, 1, 1, 1, 1, 1,
-0.2173581, 0.006817433, -1.383334, 1, 1, 1, 1, 1,
-0.2145371, -0.02965099, -1.41613, 1, 1, 1, 1, 1,
-0.2057916, -0.6932911, -1.464156, 1, 1, 1, 1, 1,
-0.2045337, -0.08029997, 0.2978267, 1, 1, 1, 1, 1,
-0.2034034, 1.48493, 0.4968274, 1, 1, 1, 1, 1,
-0.201571, 0.07750937, -1.780596, 1, 1, 1, 1, 1,
-0.1949021, 1.263091, -2.207808, 1, 1, 1, 1, 1,
-0.1855429, 0.04463058, -1.968062, 1, 1, 1, 1, 1,
-0.1830995, -0.57838, -2.662594, 1, 1, 1, 1, 1,
-0.1830734, 0.2852468, -0.3591269, 1, 1, 1, 1, 1,
-0.1801629, 0.4801627, -2.308872, 1, 1, 1, 1, 1,
-0.1754438, 0.1888791, -0.4423721, 1, 1, 1, 1, 1,
-0.1749362, 0.4551237, -1.861289, 1, 1, 1, 1, 1,
-0.1736349, 0.1264661, -0.7950336, 0, 0, 1, 1, 1,
-0.1682884, -1.076523, -2.733099, 1, 0, 0, 1, 1,
-0.1662647, 0.953677, -1.240609, 1, 0, 0, 1, 1,
-0.164872, 0.9673335, -0.8880646, 1, 0, 0, 1, 1,
-0.1625779, -0.1140861, -0.7639828, 1, 0, 0, 1, 1,
-0.1621786, 0.6155599, -0.2435586, 1, 0, 0, 1, 1,
-0.1604658, 0.08091313, -1.775645, 0, 0, 0, 1, 1,
-0.1528137, 0.2587075, -0.6239568, 0, 0, 0, 1, 1,
-0.1525001, 1.393779, -0.1526042, 0, 0, 0, 1, 1,
-0.151295, -0.404551, -3.341826, 0, 0, 0, 1, 1,
-0.1494427, 0.6621975, -0.5665159, 0, 0, 0, 1, 1,
-0.1492715, -0.1818154, -0.6732448, 0, 0, 0, 1, 1,
-0.148203, 0.2324738, -0.3465624, 0, 0, 0, 1, 1,
-0.147725, 0.1500211, 1.225258, 1, 1, 1, 1, 1,
-0.1472666, -0.3670252, -1.76831, 1, 1, 1, 1, 1,
-0.1423222, 1.414107, -1.173746, 1, 1, 1, 1, 1,
-0.1366802, -1.118952, -4.319581, 1, 1, 1, 1, 1,
-0.1287156, 0.6776534, 1.535846, 1, 1, 1, 1, 1,
-0.1286074, -2.987076, -1.919991, 1, 1, 1, 1, 1,
-0.1233568, -1.121306, -3.134906, 1, 1, 1, 1, 1,
-0.1230617, -0.257074, -0.9697933, 1, 1, 1, 1, 1,
-0.1226515, -0.3611754, -3.494662, 1, 1, 1, 1, 1,
-0.1155294, -1.575446, -2.578835, 1, 1, 1, 1, 1,
-0.1126731, 2.138162, -1.414027, 1, 1, 1, 1, 1,
-0.1119188, -0.8636249, -3.647998, 1, 1, 1, 1, 1,
-0.1043507, 1.490251, -2.363162, 1, 1, 1, 1, 1,
-0.09734157, -0.2307168, -2.177265, 1, 1, 1, 1, 1,
-0.09377171, -0.9027289, -3.302825, 1, 1, 1, 1, 1,
-0.09161249, 1.335693, -0.256897, 0, 0, 1, 1, 1,
-0.09147329, -0.8918107, -3.919322, 1, 0, 0, 1, 1,
-0.08903832, -0.685209, -3.001646, 1, 0, 0, 1, 1,
-0.08344714, -0.9195714, -3.878981, 1, 0, 0, 1, 1,
-0.08242766, -0.3274039, -3.044724, 1, 0, 0, 1, 1,
-0.07932571, -0.3569862, -2.197036, 1, 0, 0, 1, 1,
-0.0784782, 0.3037331, -0.6121703, 0, 0, 0, 1, 1,
-0.07831173, 0.7786964, -0.05343235, 0, 0, 0, 1, 1,
-0.07825468, 2.099447, 0.03089519, 0, 0, 0, 1, 1,
-0.07806499, 0.3443566, -1.431916, 0, 0, 0, 1, 1,
-0.07645736, -1.462779, -3.866497, 0, 0, 0, 1, 1,
-0.07057295, 0.3972476, 1.29764, 0, 0, 0, 1, 1,
-0.06672335, -0.6264333, -3.160685, 0, 0, 0, 1, 1,
-0.065378, 1.323638, 0.2526631, 1, 1, 1, 1, 1,
-0.06533513, -1.534646, -4.414295, 1, 1, 1, 1, 1,
-0.06179478, 0.3512882, -0.0892862, 1, 1, 1, 1, 1,
-0.05359932, 0.04014281, 0.1464974, 1, 1, 1, 1, 1,
-0.0512856, 0.2149278, 0.6851803, 1, 1, 1, 1, 1,
-0.04948718, -0.3098625, -2.963799, 1, 1, 1, 1, 1,
-0.04289109, -0.2222998, -4.905377, 1, 1, 1, 1, 1,
-0.04171071, 2.50485, 1.023818, 1, 1, 1, 1, 1,
-0.04058911, 1.18643, -0.1439976, 1, 1, 1, 1, 1,
-0.03540877, 0.8710459, 0.1960954, 1, 1, 1, 1, 1,
-0.03449067, -0.7407405, -2.870733, 1, 1, 1, 1, 1,
-0.03397718, 0.03798986, -0.4991825, 1, 1, 1, 1, 1,
-0.0280411, -0.1414847, -2.689905, 1, 1, 1, 1, 1,
-0.02645559, 0.2977763, 0.06409564, 1, 1, 1, 1, 1,
-0.02607925, -0.5426745, -2.545128, 1, 1, 1, 1, 1,
-0.01979669, 0.02555044, -0.5480866, 0, 0, 1, 1, 1,
-0.01496589, -0.6779311, -2.295933, 1, 0, 0, 1, 1,
-0.01494187, 0.004791257, 0.04152947, 1, 0, 0, 1, 1,
-0.01240494, -0.4156595, -2.004674, 1, 0, 0, 1, 1,
-0.01239146, 0.351504, -0.253177, 1, 0, 0, 1, 1,
-0.007046103, -0.1008602, -2.190732, 1, 0, 0, 1, 1,
-0.005634715, -0.1104523, -2.213718, 0, 0, 0, 1, 1,
-0.005272099, -0.6902996, -1.957779, 0, 0, 0, 1, 1,
0.0001000127, 0.7726879, 1.68969, 0, 0, 0, 1, 1,
0.006961038, 0.149306, 0.3867979, 0, 0, 0, 1, 1,
0.007745404, -0.7251289, 2.123749, 0, 0, 0, 1, 1,
0.008631372, -1.157054, 3.365428, 0, 0, 0, 1, 1,
0.008640598, 0.7084044, 1.176508, 0, 0, 0, 1, 1,
0.01169598, 0.6913322, -0.1635377, 1, 1, 1, 1, 1,
0.01498039, -0.3176301, 3.14573, 1, 1, 1, 1, 1,
0.01577868, -1.309444, 4.082285, 1, 1, 1, 1, 1,
0.01673832, -0.4654338, 4.166709, 1, 1, 1, 1, 1,
0.01696214, -0.496816, 1.980579, 1, 1, 1, 1, 1,
0.02186952, 0.4292272, -1.286541, 1, 1, 1, 1, 1,
0.02322063, 0.6602645, -0.07184701, 1, 1, 1, 1, 1,
0.02844066, 0.5204197, 0.7865834, 1, 1, 1, 1, 1,
0.0287155, -0.1122834, 2.208607, 1, 1, 1, 1, 1,
0.02913976, 1.930953, 1.2575, 1, 1, 1, 1, 1,
0.03318791, -0.6775655, 3.230565, 1, 1, 1, 1, 1,
0.0366057, 0.8593843, -0.641932, 1, 1, 1, 1, 1,
0.03712218, -0.9540009, 4.533869, 1, 1, 1, 1, 1,
0.03915881, -1.666658, 2.200025, 1, 1, 1, 1, 1,
0.04317493, 0.3124563, 0.1394973, 1, 1, 1, 1, 1,
0.04805679, -0.2086309, 2.810653, 0, 0, 1, 1, 1,
0.05150401, 2.259765, -0.9065244, 1, 0, 0, 1, 1,
0.05536238, 0.3068357, 0.2478784, 1, 0, 0, 1, 1,
0.05715508, -0.3948197, 2.823952, 1, 0, 0, 1, 1,
0.05780533, -0.9981302, 2.718646, 1, 0, 0, 1, 1,
0.05792858, -1.185207, 1.763355, 1, 0, 0, 1, 1,
0.06209327, 0.407508, -0.5857537, 0, 0, 0, 1, 1,
0.06544701, 0.2994896, -0.1727193, 0, 0, 0, 1, 1,
0.06781533, 1.492389, 1.709745, 0, 0, 0, 1, 1,
0.0692322, 0.9272537, -1.285398, 0, 0, 0, 1, 1,
0.06995943, -1.026585, 2.590807, 0, 0, 0, 1, 1,
0.07128704, 0.4974463, -0.7237794, 0, 0, 0, 1, 1,
0.07294788, 0.06135923, 0.7792999, 0, 0, 0, 1, 1,
0.07831387, 0.2534949, 0.3526022, 1, 1, 1, 1, 1,
0.07959004, -0.9567608, 2.663083, 1, 1, 1, 1, 1,
0.08806793, -0.3036683, 2.189745, 1, 1, 1, 1, 1,
0.08857496, 0.613571, 0.8719016, 1, 1, 1, 1, 1,
0.08916571, -2.202966, 2.179954, 1, 1, 1, 1, 1,
0.0954251, -0.5012275, 1.272997, 1, 1, 1, 1, 1,
0.09616419, -0.2324664, 2.280858, 1, 1, 1, 1, 1,
0.09688956, -1.725935, 4.255398, 1, 1, 1, 1, 1,
0.1007415, 0.01791098, 0.4218016, 1, 1, 1, 1, 1,
0.1033658, -0.173903, 2.738288, 1, 1, 1, 1, 1,
0.1055607, -1.226097, 2.934119, 1, 1, 1, 1, 1,
0.1057636, 2.680928, -0.3123114, 1, 1, 1, 1, 1,
0.1086483, 2.291726, 0.3268535, 1, 1, 1, 1, 1,
0.1168892, 1.019177, 1.055356, 1, 1, 1, 1, 1,
0.1171255, 0.3546558, 0.7520328, 1, 1, 1, 1, 1,
0.1173262, 2.325017, 0.5200828, 0, 0, 1, 1, 1,
0.1183948, 0.834311, -0.5094383, 1, 0, 0, 1, 1,
0.1219492, 1.798217, -0.4107267, 1, 0, 0, 1, 1,
0.1225667, 1.145881, -0.3327691, 1, 0, 0, 1, 1,
0.1233648, -0.8708704, 3.169124, 1, 0, 0, 1, 1,
0.1235461, 1.466124, 0.3192955, 1, 0, 0, 1, 1,
0.1244966, 0.5418119, 0.9029376, 0, 0, 0, 1, 1,
0.1268915, -0.8509845, 3.308348, 0, 0, 0, 1, 1,
0.1273045, 1.890151, 0.270494, 0, 0, 0, 1, 1,
0.1279717, 1.199103, 0.5352738, 0, 0, 0, 1, 1,
0.1328679, 0.6492224, 0.9152339, 0, 0, 0, 1, 1,
0.1344839, -0.9613288, 4.364337, 0, 0, 0, 1, 1,
0.1370281, -0.04259424, 2.369184, 0, 0, 0, 1, 1,
0.1373135, 0.6294082, 0.1579638, 1, 1, 1, 1, 1,
0.1410479, -0.3838929, 1.410282, 1, 1, 1, 1, 1,
0.141864, 0.6025503, 0.9464082, 1, 1, 1, 1, 1,
0.1429771, -1.321008, 3.676296, 1, 1, 1, 1, 1,
0.1439501, 0.5587652, -0.7660694, 1, 1, 1, 1, 1,
0.1493858, -0.1343414, -0.3101733, 1, 1, 1, 1, 1,
0.1553901, -0.7922762, 2.67286, 1, 1, 1, 1, 1,
0.1591754, 0.1207284, 0.6973847, 1, 1, 1, 1, 1,
0.1598933, 1.672349, -0.866301, 1, 1, 1, 1, 1,
0.1609235, -0.6992503, 3.43017, 1, 1, 1, 1, 1,
0.1642347, -1.84715, 5.210444, 1, 1, 1, 1, 1,
0.1652878, -0.2623478, 2.962331, 1, 1, 1, 1, 1,
0.1654609, -0.8936771, 2.398618, 1, 1, 1, 1, 1,
0.1666131, -0.5528988, 4.002487, 1, 1, 1, 1, 1,
0.1682019, -1.51099, 2.486616, 1, 1, 1, 1, 1,
0.1713628, 2.170382, -1.304173, 0, 0, 1, 1, 1,
0.1804607, 0.2089884, 0.3828767, 1, 0, 0, 1, 1,
0.1824799, -0.6572268, 5.294948, 1, 0, 0, 1, 1,
0.1827485, 0.2073955, 1.270151, 1, 0, 0, 1, 1,
0.1832185, 0.3636855, 0.8311842, 1, 0, 0, 1, 1,
0.1850233, 0.03173021, 0.1036323, 1, 0, 0, 1, 1,
0.185783, 0.3430402, 0.1953513, 0, 0, 0, 1, 1,
0.1868861, 1.068449, 0.3061886, 0, 0, 0, 1, 1,
0.1913166, -0.7523451, 3.933775, 0, 0, 0, 1, 1,
0.1913741, 0.5344059, 0.2010181, 0, 0, 0, 1, 1,
0.1939649, -0.9874618, 2.136851, 0, 0, 0, 1, 1,
0.1961002, -1.931756, 2.244405, 0, 0, 0, 1, 1,
0.2021008, 0.6094419, 0.04204795, 0, 0, 0, 1, 1,
0.204582, 0.4491522, -0.03171727, 1, 1, 1, 1, 1,
0.2081986, 1.605986, 0.7443957, 1, 1, 1, 1, 1,
0.2085579, -0.2260864, 4.222631, 1, 1, 1, 1, 1,
0.2131439, 1.478153, -0.1097806, 1, 1, 1, 1, 1,
0.214523, 0.07906919, -0.940479, 1, 1, 1, 1, 1,
0.2146093, -2.703884, 4.010159, 1, 1, 1, 1, 1,
0.2154132, -1.323484, 2.9447, 1, 1, 1, 1, 1,
0.2165816, 0.4193158, 0.1527705, 1, 1, 1, 1, 1,
0.2188197, 0.7537144, 1.808992, 1, 1, 1, 1, 1,
0.2188862, 0.9067445, -0.009941477, 1, 1, 1, 1, 1,
0.2224234, 0.7894858, 0.1829253, 1, 1, 1, 1, 1,
0.2232308, 0.8994191, 1.386176, 1, 1, 1, 1, 1,
0.2250307, -1.046811, 1.803038, 1, 1, 1, 1, 1,
0.2254513, 1.005716, 2.04864, 1, 1, 1, 1, 1,
0.2334849, 0.9499354, -1.620767, 1, 1, 1, 1, 1,
0.2362106, -0.1772174, 1.492906, 0, 0, 1, 1, 1,
0.2398242, -0.6655866, 1.576092, 1, 0, 0, 1, 1,
0.2412746, -0.622151, 3.166927, 1, 0, 0, 1, 1,
0.2463482, 0.1631149, 0.07372207, 1, 0, 0, 1, 1,
0.251182, -0.339897, 2.92101, 1, 0, 0, 1, 1,
0.2544019, -0.3489503, 1.144338, 1, 0, 0, 1, 1,
0.2555865, 0.5508204, -0.5726542, 0, 0, 0, 1, 1,
0.259927, 0.001356273, 0.706197, 0, 0, 0, 1, 1,
0.2640576, -2.198892, 3.352451, 0, 0, 0, 1, 1,
0.2641947, -1.386408, 3.075894, 0, 0, 0, 1, 1,
0.266347, 0.2679467, 1.441505, 0, 0, 0, 1, 1,
0.2676316, 1.05556, -1.487047, 0, 0, 0, 1, 1,
0.2686655, -1.125408, 2.783994, 0, 0, 0, 1, 1,
0.272407, 0.9351971, -0.2058308, 1, 1, 1, 1, 1,
0.2733065, 0.9432992, 0.4100223, 1, 1, 1, 1, 1,
0.2744083, -0.04890625, 0.064794, 1, 1, 1, 1, 1,
0.2754382, -1.045334, 4.147143, 1, 1, 1, 1, 1,
0.2774565, -1.874356, 1.814316, 1, 1, 1, 1, 1,
0.2823033, 0.4044978, 1.136291, 1, 1, 1, 1, 1,
0.2848473, -0.2163777, 3.294173, 1, 1, 1, 1, 1,
0.2883274, 1.035498, 1.257219, 1, 1, 1, 1, 1,
0.289763, -0.3027684, 0.8323852, 1, 1, 1, 1, 1,
0.2946149, -0.9491637, 2.567974, 1, 1, 1, 1, 1,
0.2953633, -1.114615, 1.885697, 1, 1, 1, 1, 1,
0.2979259, 0.9197889, -0.1163091, 1, 1, 1, 1, 1,
0.2981954, -1.260628, 2.940439, 1, 1, 1, 1, 1,
0.2999299, -0.8015789, 3.468005, 1, 1, 1, 1, 1,
0.3006796, 1.363552, -0.4252275, 1, 1, 1, 1, 1,
0.3019274, 0.2172989, 0.2867629, 0, 0, 1, 1, 1,
0.3020591, 0.0185797, 1.468861, 1, 0, 0, 1, 1,
0.3028392, 0.3052232, 3.108267, 1, 0, 0, 1, 1,
0.3097072, -0.7014149, 2.196354, 1, 0, 0, 1, 1,
0.3122339, -0.5347325, 3.580383, 1, 0, 0, 1, 1,
0.3138194, -2.148025, 3.322764, 1, 0, 0, 1, 1,
0.3189999, 0.8427808, 0.9947562, 0, 0, 0, 1, 1,
0.3223186, -0.7837946, 1.936764, 0, 0, 0, 1, 1,
0.3239209, 0.546429, 0.9573244, 0, 0, 0, 1, 1,
0.324575, -1.160925, 3.289158, 0, 0, 0, 1, 1,
0.3248351, 0.7015284, 0.7800275, 0, 0, 0, 1, 1,
0.3270573, 0.7045859, 1.159797, 0, 0, 0, 1, 1,
0.3309984, -0.7900349, 1.187874, 0, 0, 0, 1, 1,
0.3319457, 0.5512419, 0.3139657, 1, 1, 1, 1, 1,
0.3334808, 2.053188, -0.2616558, 1, 1, 1, 1, 1,
0.335095, -0.5358949, 2.885566, 1, 1, 1, 1, 1,
0.3354173, -0.2137584, 1.214857, 1, 1, 1, 1, 1,
0.3355713, 0.3826599, 1.005786, 1, 1, 1, 1, 1,
0.338166, 0.2015965, 0.9109489, 1, 1, 1, 1, 1,
0.3416145, -0.1567015, -0.0226739, 1, 1, 1, 1, 1,
0.3422088, -2.53593, 1.918016, 1, 1, 1, 1, 1,
0.3498489, 0.1547969, -0.4766613, 1, 1, 1, 1, 1,
0.34988, 0.7158105, 3.050484, 1, 1, 1, 1, 1,
0.3522456, 0.8109015, 0.9157849, 1, 1, 1, 1, 1,
0.3554333, 0.7265065, -1.071007, 1, 1, 1, 1, 1,
0.3558314, -1.574304, 3.398513, 1, 1, 1, 1, 1,
0.3560733, -1.379949, 3.120895, 1, 1, 1, 1, 1,
0.3564957, 1.458299, 2.166936, 1, 1, 1, 1, 1,
0.3624057, -0.4112797, 0.8371037, 0, 0, 1, 1, 1,
0.3701612, 0.595398, -0.4350596, 1, 0, 0, 1, 1,
0.3721389, -0.742754, 1.781716, 1, 0, 0, 1, 1,
0.373944, -0.1699965, 1.290342, 1, 0, 0, 1, 1,
0.3811224, -1.99077, 2.301093, 1, 0, 0, 1, 1,
0.3812379, -0.1251085, 1.948609, 1, 0, 0, 1, 1,
0.3820199, -0.132624, 3.696981, 0, 0, 0, 1, 1,
0.3893069, 0.2677687, 0.9982532, 0, 0, 0, 1, 1,
0.3897351, -0.1673733, 4.053421, 0, 0, 0, 1, 1,
0.3901899, 1.433786, 0.4367617, 0, 0, 0, 1, 1,
0.3942289, 0.09619676, 1.325513, 0, 0, 0, 1, 1,
0.3959018, -0.06651531, 1.755756, 0, 0, 0, 1, 1,
0.3974289, 1.926971, 0.7754339, 0, 0, 0, 1, 1,
0.3976324, 0.2987442, -1.081987, 1, 1, 1, 1, 1,
0.3977734, -1.426727, 3.867021, 1, 1, 1, 1, 1,
0.4051251, -0.7399126, 2.153032, 1, 1, 1, 1, 1,
0.4057606, -0.07083622, 1.805283, 1, 1, 1, 1, 1,
0.4066209, 0.6657954, 1.555121, 1, 1, 1, 1, 1,
0.4129332, -0.02000216, 2.637982, 1, 1, 1, 1, 1,
0.4132332, 0.7143946, 1.178089, 1, 1, 1, 1, 1,
0.4145075, -1.533699, 2.891233, 1, 1, 1, 1, 1,
0.4149388, 0.45977, 0.4669203, 1, 1, 1, 1, 1,
0.4170591, 0.478375, -0.1000496, 1, 1, 1, 1, 1,
0.41768, -0.4127628, 3.134678, 1, 1, 1, 1, 1,
0.419167, 1.226772, -0.1284576, 1, 1, 1, 1, 1,
0.4216463, -0.3582557, 1.073733, 1, 1, 1, 1, 1,
0.4220012, 0.9187814, -0.02454215, 1, 1, 1, 1, 1,
0.430012, 0.1570571, 1.538291, 1, 1, 1, 1, 1,
0.4301078, 0.2573165, 0.4861115, 0, 0, 1, 1, 1,
0.4357892, 0.1950991, 1.188968, 1, 0, 0, 1, 1,
0.4392121, 0.2802629, 1.902605, 1, 0, 0, 1, 1,
0.4398899, 2.305276, 0.4305954, 1, 0, 0, 1, 1,
0.4401035, -0.6068688, 3.842234, 1, 0, 0, 1, 1,
0.4410937, 1.363554, 0.3817983, 1, 0, 0, 1, 1,
0.4411275, -0.5034078, 3.417541, 0, 0, 0, 1, 1,
0.4414842, 1.083684, -0.9880682, 0, 0, 0, 1, 1,
0.4454406, 0.04492511, 1.694687, 0, 0, 0, 1, 1,
0.4473594, 0.02727582, -0.04474733, 0, 0, 0, 1, 1,
0.4482743, 2.44915, -0.2301249, 0, 0, 0, 1, 1,
0.4531538, 0.4773, 1.868933, 0, 0, 0, 1, 1,
0.4531768, 0.9839146, 1.992007, 0, 0, 0, 1, 1,
0.4535514, 0.2981153, 1.845598, 1, 1, 1, 1, 1,
0.4598105, 0.8012868, 1.958601, 1, 1, 1, 1, 1,
0.4632578, 0.07550975, 2.073241, 1, 1, 1, 1, 1,
0.4643992, -1.308862, 2.428868, 1, 1, 1, 1, 1,
0.4754924, -0.02017722, 3.508246, 1, 1, 1, 1, 1,
0.4774603, -0.9903766, 3.71153, 1, 1, 1, 1, 1,
0.4788352, -0.04752688, -0.03329167, 1, 1, 1, 1, 1,
0.4874234, -0.2813138, 3.12211, 1, 1, 1, 1, 1,
0.489771, -0.3330319, 2.885142, 1, 1, 1, 1, 1,
0.4991898, 0.4982528, 0.6174149, 1, 1, 1, 1, 1,
0.4998443, -2.236534, 1.867764, 1, 1, 1, 1, 1,
0.5017244, -0.4404347, 3.594041, 1, 1, 1, 1, 1,
0.5054008, 0.4545915, -1.497348, 1, 1, 1, 1, 1,
0.5060833, -1.126222, 1.427939, 1, 1, 1, 1, 1,
0.508509, 0.9210188, 0.29567, 1, 1, 1, 1, 1,
0.5145386, 0.360774, 2.086954, 0, 0, 1, 1, 1,
0.5164081, -0.1311157, 0.09845743, 1, 0, 0, 1, 1,
0.516765, -0.4425965, 0.2259387, 1, 0, 0, 1, 1,
0.5301167, 0.0778769, 1.170068, 1, 0, 0, 1, 1,
0.5324265, 0.9201336, -0.1181674, 1, 0, 0, 1, 1,
0.5372472, 0.3054654, -0.1767517, 1, 0, 0, 1, 1,
0.5373173, -0.08900622, 1.021509, 0, 0, 0, 1, 1,
0.5388322, 1.853518, 0.6818932, 0, 0, 0, 1, 1,
0.5391908, -0.2461473, 1.610416, 0, 0, 0, 1, 1,
0.5400674, 0.3103536, 0.9555834, 0, 0, 0, 1, 1,
0.5413418, -0.4130637, 2.338627, 0, 0, 0, 1, 1,
0.544755, -0.04452123, 2.131494, 0, 0, 0, 1, 1,
0.5464511, -1.16443, 3.900803, 0, 0, 0, 1, 1,
0.5474811, -2.049421, 2.272088, 1, 1, 1, 1, 1,
0.5493818, 0.3337453, 0.8163511, 1, 1, 1, 1, 1,
0.5549392, -0.1592573, 1.566024, 1, 1, 1, 1, 1,
0.5559906, -1.213728, 3.512654, 1, 1, 1, 1, 1,
0.5593552, 0.9227154, 1.181552, 1, 1, 1, 1, 1,
0.5623601, 0.1092461, 1.900328, 1, 1, 1, 1, 1,
0.5651839, 0.2631173, 1.906285, 1, 1, 1, 1, 1,
0.5685369, 0.679826, -1.333443, 1, 1, 1, 1, 1,
0.5691451, 0.9370874, -0.823359, 1, 1, 1, 1, 1,
0.5745844, -0.6226324, 3.237748, 1, 1, 1, 1, 1,
0.5767283, -0.5873292, 3.626252, 1, 1, 1, 1, 1,
0.5782982, -0.8151999, 3.432779, 1, 1, 1, 1, 1,
0.5834723, -1.905279, 4.820698, 1, 1, 1, 1, 1,
0.5840229, -0.5654242, 1.858251, 1, 1, 1, 1, 1,
0.5843838, 0.8261244, -1.25303, 1, 1, 1, 1, 1,
0.5846296, -0.6980274, 4.073114, 0, 0, 1, 1, 1,
0.5857534, -1.810283, 2.899746, 1, 0, 0, 1, 1,
0.5891599, 0.9319997, 1.800748, 1, 0, 0, 1, 1,
0.5892563, 0.3113233, 1.287562, 1, 0, 0, 1, 1,
0.5946231, -0.2901046, 3.695447, 1, 0, 0, 1, 1,
0.5953535, 0.2392969, 0.7535823, 1, 0, 0, 1, 1,
0.5974936, 0.2753786, 0.743163, 0, 0, 0, 1, 1,
0.5983253, 0.4529201, 0.990062, 0, 0, 0, 1, 1,
0.5984451, -0.8647373, 2.180859, 0, 0, 0, 1, 1,
0.602483, 0.6197882, 3.023843, 0, 0, 0, 1, 1,
0.606618, 0.2217843, 1.500724, 0, 0, 0, 1, 1,
0.6066398, 0.3571272, 0.6389231, 0, 0, 0, 1, 1,
0.608089, -1.062438, 2.485438, 0, 0, 0, 1, 1,
0.6116679, -1.834345, 4.325991, 1, 1, 1, 1, 1,
0.6132669, 1.543557, 2.319716, 1, 1, 1, 1, 1,
0.6149458, 0.4810134, 0.7946185, 1, 1, 1, 1, 1,
0.6157421, 1.57627, 0.8867837, 1, 1, 1, 1, 1,
0.6179728, -0.1522839, 3.895768, 1, 1, 1, 1, 1,
0.6222671, -0.2310249, 1.517003, 1, 1, 1, 1, 1,
0.622523, 0.9374155, 1.949604, 1, 1, 1, 1, 1,
0.6226451, 0.1377362, 1.043, 1, 1, 1, 1, 1,
0.6357051, -0.10576, 4.410058, 1, 1, 1, 1, 1,
0.6357653, -0.1334139, 1.397481, 1, 1, 1, 1, 1,
0.6371424, -1.077888, 2.060104, 1, 1, 1, 1, 1,
0.6424301, -0.9884938, 2.530309, 1, 1, 1, 1, 1,
0.6439779, 0.2823926, 0.6008028, 1, 1, 1, 1, 1,
0.6453311, -0.2460715, 2.404767, 1, 1, 1, 1, 1,
0.6461177, 0.3788345, 1.222179, 1, 1, 1, 1, 1,
0.6521083, -1.565682, 1.094216, 0, 0, 1, 1, 1,
0.6614439, 0.1506393, 1.940045, 1, 0, 0, 1, 1,
0.6642474, -0.6154063, 1.505507, 1, 0, 0, 1, 1,
0.6660109, -1.029838, 2.019294, 1, 0, 0, 1, 1,
0.6663378, -0.2173281, 1.963107, 1, 0, 0, 1, 1,
0.6690692, 0.2993415, 1.252912, 1, 0, 0, 1, 1,
0.6762409, 0.245287, 1.256728, 0, 0, 0, 1, 1,
0.680523, 0.7687729, 1.291481, 0, 0, 0, 1, 1,
0.6846322, 1.01334, 1.420598, 0, 0, 0, 1, 1,
0.689375, -0.8634512, 3.064125, 0, 0, 0, 1, 1,
0.6901406, 0.02940046, 1.030877, 0, 0, 0, 1, 1,
0.6925645, -1.645725, 5.377253, 0, 0, 0, 1, 1,
0.6933553, -0.4275477, 2.688876, 0, 0, 0, 1, 1,
0.6939384, 2.73657, 2.569496, 1, 1, 1, 1, 1,
0.6960273, 1.323177, -0.3043013, 1, 1, 1, 1, 1,
0.6986205, 0.2649978, 3.128872, 1, 1, 1, 1, 1,
0.7032659, 1.104969, 0.5501547, 1, 1, 1, 1, 1,
0.709051, 1.175021, -0.498275, 1, 1, 1, 1, 1,
0.7130102, 1.430156, 0.8008073, 1, 1, 1, 1, 1,
0.7137532, -1.936671, 1.358128, 1, 1, 1, 1, 1,
0.7156122, 0.7730231, 2.711655, 1, 1, 1, 1, 1,
0.716556, -0.8320232, 2.074643, 1, 1, 1, 1, 1,
0.7206657, -1.060908, 1.141985, 1, 1, 1, 1, 1,
0.7248054, -1.384134, 3.65946, 1, 1, 1, 1, 1,
0.7271522, -0.2125262, 0.3465715, 1, 1, 1, 1, 1,
0.7279704, -0.6031699, 2.578279, 1, 1, 1, 1, 1,
0.7287295, -0.4014824, 1.214018, 1, 1, 1, 1, 1,
0.7331946, 0.9279568, 0.9610173, 1, 1, 1, 1, 1,
0.7398577, -0.04752279, 1.887908, 0, 0, 1, 1, 1,
0.7403692, 1.558143, 1.390267, 1, 0, 0, 1, 1,
0.7427927, 0.3307806, 1.490285, 1, 0, 0, 1, 1,
0.7428746, 1.444385, 1.496343, 1, 0, 0, 1, 1,
0.7580525, 1.489343, -0.04995974, 1, 0, 0, 1, 1,
0.760137, -0.0964313, 0.9950449, 1, 0, 0, 1, 1,
0.7733474, -0.399237, 2.83403, 0, 0, 0, 1, 1,
0.7756417, -1.692541, 3.120475, 0, 0, 0, 1, 1,
0.7793107, 0.01612681, 1.574036, 0, 0, 0, 1, 1,
0.780163, -0.7542108, 3.087582, 0, 0, 0, 1, 1,
0.7805118, 0.626053, 0.7233243, 0, 0, 0, 1, 1,
0.7836269, -0.1185881, 1.92244, 0, 0, 0, 1, 1,
0.8003393, -2.530142, 4.373758, 0, 0, 0, 1, 1,
0.8020107, 1.13946, 2.329657, 1, 1, 1, 1, 1,
0.8084998, 0.02652298, 2.868591, 1, 1, 1, 1, 1,
0.8099967, -0.97087, 2.36356, 1, 1, 1, 1, 1,
0.8161306, -0.2919036, 0.9199058, 1, 1, 1, 1, 1,
0.8233224, -1.513999, 3.516632, 1, 1, 1, 1, 1,
0.8246664, 1.986407, -0.05052452, 1, 1, 1, 1, 1,
0.8311526, 1.572945, 0.5280681, 1, 1, 1, 1, 1,
0.8334641, -1.289246, 3.046303, 1, 1, 1, 1, 1,
0.8389995, -1.427513, 2.672721, 1, 1, 1, 1, 1,
0.8401934, -0.5684353, 2.101625, 1, 1, 1, 1, 1,
0.8436033, 3.312393, 0.5951591, 1, 1, 1, 1, 1,
0.8466321, 0.6783217, 0.109179, 1, 1, 1, 1, 1,
0.8489057, 0.1570923, 1.313974, 1, 1, 1, 1, 1,
0.8519135, 1.676109, 0.001201335, 1, 1, 1, 1, 1,
0.8526753, 0.04166194, 0.966094, 1, 1, 1, 1, 1,
0.8651356, -0.6669858, 3.531425, 0, 0, 1, 1, 1,
0.8680547, 0.1100542, 2.132003, 1, 0, 0, 1, 1,
0.88186, 0.2114944, 2.018883, 1, 0, 0, 1, 1,
0.8876573, -0.2930005, 0.4951039, 1, 0, 0, 1, 1,
0.8951784, 2.234323, 0.1438173, 1, 0, 0, 1, 1,
0.8955162, -0.7157463, 3.408563, 1, 0, 0, 1, 1,
0.9051965, -0.4913248, 4.118575, 0, 0, 0, 1, 1,
0.9060702, -2.083524, 2.986007, 0, 0, 0, 1, 1,
0.9120964, 2.136666, 1.71668, 0, 0, 0, 1, 1,
0.9122608, -1.132676, 1.417558, 0, 0, 0, 1, 1,
0.9126443, 0.2751267, 1.761861, 0, 0, 0, 1, 1,
0.9130017, -0.05754145, 1.691954, 0, 0, 0, 1, 1,
0.9137493, -0.5943242, 2.232055, 0, 0, 0, 1, 1,
0.9151148, 0.9252684, -0.09764697, 1, 1, 1, 1, 1,
0.9240668, 0.0944644, 2.739161, 1, 1, 1, 1, 1,
0.9299856, -0.3016216, 3.648391, 1, 1, 1, 1, 1,
0.9301512, 0.1430441, 1.124061, 1, 1, 1, 1, 1,
0.9363514, -0.0003295945, 1.673688, 1, 1, 1, 1, 1,
0.9388694, 1.5599, 0.9357846, 1, 1, 1, 1, 1,
0.9417511, -0.2167651, 3.592865, 1, 1, 1, 1, 1,
0.9468372, -1.066651, -0.6029711, 1, 1, 1, 1, 1,
0.9489014, 0.3774571, 0.8153847, 1, 1, 1, 1, 1,
0.9611853, 2.781823, -1.349996, 1, 1, 1, 1, 1,
0.9652054, 1.089311, 1.014628, 1, 1, 1, 1, 1,
0.9700109, -0.1034324, 1.672255, 1, 1, 1, 1, 1,
0.9746964, 1.116494, 3.047203, 1, 1, 1, 1, 1,
0.975302, -0.6204924, 1.929453, 1, 1, 1, 1, 1,
0.9830836, 1.132981, 1.856313, 1, 1, 1, 1, 1,
0.9834482, 0.9775468, -0.9892719, 0, 0, 1, 1, 1,
0.9851286, 1.742287, 2.096482, 1, 0, 0, 1, 1,
0.9921575, 1.598407, 0.6231233, 1, 0, 0, 1, 1,
0.9956439, -0.05313222, 1.714388, 1, 0, 0, 1, 1,
0.9978234, 0.4505628, 1.021042, 1, 0, 0, 1, 1,
1.006775, 0.412596, 0.7085894, 1, 0, 0, 1, 1,
1.011504, 0.7824001, -0.7447467, 0, 0, 0, 1, 1,
1.011949, -0.2317653, 1.398122, 0, 0, 0, 1, 1,
1.012037, -1.222043, 1.062856, 0, 0, 0, 1, 1,
1.012267, -0.06793345, 0.6529973, 0, 0, 0, 1, 1,
1.013945, 0.1597692, 0.2818052, 0, 0, 0, 1, 1,
1.017933, 0.8546362, 0.6424436, 0, 0, 0, 1, 1,
1.018337, 0.9270859, 0.8598164, 0, 0, 0, 1, 1,
1.021409, -0.6214182, 1.713634, 1, 1, 1, 1, 1,
1.02153, 0.02447891, 1.349089, 1, 1, 1, 1, 1,
1.027256, 2.411836, 3.408755, 1, 1, 1, 1, 1,
1.031119, 1.018987, 1.58609, 1, 1, 1, 1, 1,
1.042089, 0.579317, 1.599093, 1, 1, 1, 1, 1,
1.04389, -0.09703061, 1.508966, 1, 1, 1, 1, 1,
1.046471, 0.6163004, 1.760124, 1, 1, 1, 1, 1,
1.048593, -1.495086, 2.967955, 1, 1, 1, 1, 1,
1.051973, 1.74205, -0.3859818, 1, 1, 1, 1, 1,
1.059612, -2.230316, 3.319518, 1, 1, 1, 1, 1,
1.059681, 1.113237, -0.4049188, 1, 1, 1, 1, 1,
1.067183, -0.5826088, 2.338937, 1, 1, 1, 1, 1,
1.077507, 0.6480243, 0.3320125, 1, 1, 1, 1, 1,
1.084003, -0.07801449, 2.930522, 1, 1, 1, 1, 1,
1.098872, 0.8806336, 1.080157, 1, 1, 1, 1, 1,
1.099721, -0.3566247, 1.645806, 0, 0, 1, 1, 1,
1.101381, -1.001734, 3.947496, 1, 0, 0, 1, 1,
1.103505, -1.609349, 2.947911, 1, 0, 0, 1, 1,
1.103704, -0.06687914, 2.272547, 1, 0, 0, 1, 1,
1.106394, -0.7640173, 1.866048, 1, 0, 0, 1, 1,
1.114331, 0.01494707, 1.170529, 1, 0, 0, 1, 1,
1.125455, 1.391063, -0.6440966, 0, 0, 0, 1, 1,
1.128549, -0.545334, 1.463156, 0, 0, 0, 1, 1,
1.143921, -0.149736, 1.45841, 0, 0, 0, 1, 1,
1.170015, -0.834893, 2.055865, 0, 0, 0, 1, 1,
1.171617, -0.2628876, 0.4165722, 0, 0, 0, 1, 1,
1.181235, 1.063556, 1.85646, 0, 0, 0, 1, 1,
1.202064, -1.968722, 2.588938, 0, 0, 0, 1, 1,
1.221236, -1.396674, 0.9648857, 1, 1, 1, 1, 1,
1.22834, -1.69019, 4.044544, 1, 1, 1, 1, 1,
1.23676, 0.5022255, 1.274662, 1, 1, 1, 1, 1,
1.236855, -0.5366139, 3.246231, 1, 1, 1, 1, 1,
1.251621, -1.186692, 1.613482, 1, 1, 1, 1, 1,
1.255452, 0.2512507, 2.853266, 1, 1, 1, 1, 1,
1.257086, -0.6732929, 1.576223, 1, 1, 1, 1, 1,
1.258214, 1.367484, 0.8207569, 1, 1, 1, 1, 1,
1.258977, -1.154825, 2.608599, 1, 1, 1, 1, 1,
1.261784, -2.440151, 3.285506, 1, 1, 1, 1, 1,
1.264632, -0.346678, 1.603467, 1, 1, 1, 1, 1,
1.273592, -0.1922923, 3.618856, 1, 1, 1, 1, 1,
1.279795, 0.8609428, 1.984967, 1, 1, 1, 1, 1,
1.284328, -1.291479, 3.038662, 1, 1, 1, 1, 1,
1.286386, -1.006343, 3.319841, 1, 1, 1, 1, 1,
1.292906, -0.7753457, 0.7833201, 0, 0, 1, 1, 1,
1.310261, -0.5070339, 2.667586, 1, 0, 0, 1, 1,
1.312069, -1.991249, 2.435612, 1, 0, 0, 1, 1,
1.321711, -0.7471352, -0.3011558, 1, 0, 0, 1, 1,
1.325014, 1.101201, 0.5412683, 1, 0, 0, 1, 1,
1.32891, 1.396503, 2.221918, 1, 0, 0, 1, 1,
1.329709, -0.4708238, 3.226729, 0, 0, 0, 1, 1,
1.359178, -0.3648514, 3.963032, 0, 0, 0, 1, 1,
1.36398, 1.863355, 1.878539, 0, 0, 0, 1, 1,
1.366304, -0.7293, 2.847907, 0, 0, 0, 1, 1,
1.375346, -1.276833, 2.57038, 0, 0, 0, 1, 1,
1.380178, 0.2368811, 1.371086, 0, 0, 0, 1, 1,
1.384759, -0.6096725, 2.291994, 0, 0, 0, 1, 1,
1.392655, 0.7939063, 1.98126, 1, 1, 1, 1, 1,
1.396462, -0.6025586, 2.552336, 1, 1, 1, 1, 1,
1.408289, 0.1765967, 2.256719, 1, 1, 1, 1, 1,
1.417688, -0.1159829, 1.273585, 1, 1, 1, 1, 1,
1.420638, -1.291052, 1.677233, 1, 1, 1, 1, 1,
1.42106, -0.00104753, -0.6083972, 1, 1, 1, 1, 1,
1.440137, 1.420945, 2.163429, 1, 1, 1, 1, 1,
1.448308, 0.09623889, 1.523442, 1, 1, 1, 1, 1,
1.450956, 0.7987564, 3.665106, 1, 1, 1, 1, 1,
1.46006, -2.107603, 1.714407, 1, 1, 1, 1, 1,
1.463306, 0.5329111, 1.66965, 1, 1, 1, 1, 1,
1.46874, -0.8668589, 1.978311, 1, 1, 1, 1, 1,
1.472331, -0.6718269, 2.982042, 1, 1, 1, 1, 1,
1.474344, -0.3577974, 0.7081801, 1, 1, 1, 1, 1,
1.485925, 0.2160878, 3.026218, 1, 1, 1, 1, 1,
1.497421, -0.385273, 0.8706026, 0, 0, 1, 1, 1,
1.506328, 1.162498, 0.4696952, 1, 0, 0, 1, 1,
1.529835, 1.748626, -0.2957017, 1, 0, 0, 1, 1,
1.531833, 1.228094, 0.8628185, 1, 0, 0, 1, 1,
1.536611, 0.1434168, 1.75689, 1, 0, 0, 1, 1,
1.537256, -1.700375, 2.166077, 1, 0, 0, 1, 1,
1.551732, 2.144002, 0.1374531, 0, 0, 0, 1, 1,
1.560069, -1.620396, 2.071153, 0, 0, 0, 1, 1,
1.565068, 1.285692, 0.4390678, 0, 0, 0, 1, 1,
1.570082, -0.9864945, 2.587604, 0, 0, 0, 1, 1,
1.57658, -1.14011, -0.2466889, 0, 0, 0, 1, 1,
1.576648, 0.28907, 2.216835, 0, 0, 0, 1, 1,
1.600832, 1.468146, 1.515442, 0, 0, 0, 1, 1,
1.602383, -0.3207859, 1.842125, 1, 1, 1, 1, 1,
1.610356, -0.7810166, 1.683892, 1, 1, 1, 1, 1,
1.618378, -1.037219, 3.419142, 1, 1, 1, 1, 1,
1.624619, -0.65105, 2.017871, 1, 1, 1, 1, 1,
1.63156, -1.610765, 1.841829, 1, 1, 1, 1, 1,
1.634983, -0.4962686, 2.083355, 1, 1, 1, 1, 1,
1.658391, -1.02375, 2.487057, 1, 1, 1, 1, 1,
1.674524, 0.3813663, -0.005198118, 1, 1, 1, 1, 1,
1.675571, 0.9429364, 0.8287342, 1, 1, 1, 1, 1,
1.678788, -0.6509959, 3.627544, 1, 1, 1, 1, 1,
1.680248, -1.493328, 3.111632, 1, 1, 1, 1, 1,
1.693984, 0.4719757, 2.649041, 1, 1, 1, 1, 1,
1.697725, 2.169777, 0.6316757, 1, 1, 1, 1, 1,
1.70417, -0.4410635, 1.677856, 1, 1, 1, 1, 1,
1.714294, -0.01904376, 2.713691, 1, 1, 1, 1, 1,
1.715698, 1.370023, 1.244972, 0, 0, 1, 1, 1,
1.727387, -0.8464957, 2.871073, 1, 0, 0, 1, 1,
1.73919, -0.7796562, 1.930343, 1, 0, 0, 1, 1,
1.750214, 1.224711, 0.3796893, 1, 0, 0, 1, 1,
1.776244, -0.1902413, 2.184578, 1, 0, 0, 1, 1,
1.777056, 1.146564, 2.378848, 1, 0, 0, 1, 1,
1.779463, 0.9387057, 2.075222, 0, 0, 0, 1, 1,
1.787795, 0.6878808, 1.373215, 0, 0, 0, 1, 1,
1.78864, 0.1438065, 1.219331, 0, 0, 0, 1, 1,
1.80423, -0.97047, 0.3775211, 0, 0, 0, 1, 1,
1.835567, 1.298713, -1.321372, 0, 0, 0, 1, 1,
1.839076, -0.4782358, -0.2066934, 0, 0, 0, 1, 1,
1.849272, -1.021127, 2.959416, 0, 0, 0, 1, 1,
1.898635, 1.188191, 2.372588, 1, 1, 1, 1, 1,
1.919273, -0.4694279, 1.673745, 1, 1, 1, 1, 1,
1.931271, 2.295489, 0.9584741, 1, 1, 1, 1, 1,
1.931369, -0.736093, 1.799948, 1, 1, 1, 1, 1,
1.932807, 1.12943, 1.303481, 1, 1, 1, 1, 1,
1.962867, -0.6422324, 2.124444, 1, 1, 1, 1, 1,
2.003241, 1.403577, 1.056503, 1, 1, 1, 1, 1,
2.00486, 2.304648, 0.02176875, 1, 1, 1, 1, 1,
2.008779, -1.257225, 2.693895, 1, 1, 1, 1, 1,
2.033179, 1.422507, -1.702382, 1, 1, 1, 1, 1,
2.045688, 0.384375, 0.2717794, 1, 1, 1, 1, 1,
2.057336, -1.194414, 1.324779, 1, 1, 1, 1, 1,
2.076664, -2.68735, 3.136403, 1, 1, 1, 1, 1,
2.090927, 1.52049, 1.319757, 1, 1, 1, 1, 1,
2.093632, -0.9165365, 2.651034, 1, 1, 1, 1, 1,
2.095665, -0.1892177, 1.628125, 0, 0, 1, 1, 1,
2.097104, 0.7087398, -1.050942, 1, 0, 0, 1, 1,
2.113661, 1.047401, 3.05149, 1, 0, 0, 1, 1,
2.152475, -0.8321714, 2.743427, 1, 0, 0, 1, 1,
2.156683, -1.292068, 0.6190647, 1, 0, 0, 1, 1,
2.174603, -0.474108, 1.775685, 1, 0, 0, 1, 1,
2.175258, -0.1996232, 1.258584, 0, 0, 0, 1, 1,
2.184855, -0.06801696, 3.024721, 0, 0, 0, 1, 1,
2.199779, 0.6490828, 0.6171133, 0, 0, 0, 1, 1,
2.252799, 0.4014632, 3.253011, 0, 0, 0, 1, 1,
2.307405, -0.6046471, 1.360881, 0, 0, 0, 1, 1,
2.347153, 2.039783, 0.5680255, 0, 0, 0, 1, 1,
2.474665, -0.4900784, 2.239918, 0, 0, 0, 1, 1,
2.572687, 0.3329877, 2.262644, 1, 1, 1, 1, 1,
2.616749, -0.9507751, 1.984257, 1, 1, 1, 1, 1,
2.659075, 0.07187895, 2.137905, 1, 1, 1, 1, 1,
2.690083, -2.323109, 3.129617, 1, 1, 1, 1, 1,
2.747712, 0.6835582, 1.373711, 1, 1, 1, 1, 1,
2.785209, 1.026782, 1.332554, 1, 1, 1, 1, 1,
2.870558, 0.4782484, 2.044526, 1, 1, 1, 1, 1
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
var radius = 9.844874;
var distance = 34.5797;
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
mvMatrix.translate( 0.1766493, -0.05870247, 0.3774996 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.5797);
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