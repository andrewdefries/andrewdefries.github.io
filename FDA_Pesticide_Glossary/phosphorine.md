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
-3.47178, 1.311069, -1.160038, 1, 0, 0, 1,
-3.391201, 0.5896847, -2.567665, 1, 0.007843138, 0, 1,
-2.702085, -0.455566, -1.323328, 1, 0.01176471, 0, 1,
-2.530951, 0.7666201, -3.069761, 1, 0.01960784, 0, 1,
-2.526386, -0.3795827, -1.084487, 1, 0.02352941, 0, 1,
-2.518009, 0.4034772, -0.6927549, 1, 0.03137255, 0, 1,
-2.422694, -0.7609667, -2.129963, 1, 0.03529412, 0, 1,
-2.343144, 1.107367, -1.794544, 1, 0.04313726, 0, 1,
-2.308005, 1.691343, -0.5683295, 1, 0.04705882, 0, 1,
-2.266819, -1.687135, -1.038894, 1, 0.05490196, 0, 1,
-2.263226, 1.07535, -1.294206, 1, 0.05882353, 0, 1,
-2.2558, 0.4982127, -1.676718, 1, 0.06666667, 0, 1,
-2.222141, 1.514692, -2.279398, 1, 0.07058824, 0, 1,
-2.210724, 0.1357357, -1.80923, 1, 0.07843138, 0, 1,
-2.107176, -1.762091, -3.087517, 1, 0.08235294, 0, 1,
-2.059986, 0.8269243, -1.050679, 1, 0.09019608, 0, 1,
-1.978088, -0.399447, -0.5661442, 1, 0.09411765, 0, 1,
-1.961658, 0.9373949, -1.35407, 1, 0.1019608, 0, 1,
-1.95894, 1.146657, 0.3666253, 1, 0.1098039, 0, 1,
-1.957269, 0.09313387, -2.476045, 1, 0.1137255, 0, 1,
-1.956988, 0.1555169, -2.294847, 1, 0.1215686, 0, 1,
-1.935103, 0.2353167, 0.1377222, 1, 0.1254902, 0, 1,
-1.934571, 0.7593222, -0.1982393, 1, 0.1333333, 0, 1,
-1.924906, -2.278175, -2.487303, 1, 0.1372549, 0, 1,
-1.915148, -0.5801442, -0.6545067, 1, 0.145098, 0, 1,
-1.903196, -1.403381, -1.637612, 1, 0.1490196, 0, 1,
-1.888511, -0.3663683, -0.7055587, 1, 0.1568628, 0, 1,
-1.877734, 1.669582, -0.5281268, 1, 0.1607843, 0, 1,
-1.838461, -1.360788, -2.295635, 1, 0.1686275, 0, 1,
-1.829899, 0.8440509, -0.7550558, 1, 0.172549, 0, 1,
-1.826972, -0.5292172, -2.037955, 1, 0.1803922, 0, 1,
-1.794459, -1.957473, -2.522548, 1, 0.1843137, 0, 1,
-1.775957, 1.086315, 0.07955461, 1, 0.1921569, 0, 1,
-1.767065, -1.099533, 0.8547723, 1, 0.1960784, 0, 1,
-1.719841, 1.263165, -0.7436355, 1, 0.2039216, 0, 1,
-1.717544, 0.108826, 1.112751, 1, 0.2117647, 0, 1,
-1.715789, 2.8791, -1.918036, 1, 0.2156863, 0, 1,
-1.710678, 1.787138, -2.07041, 1, 0.2235294, 0, 1,
-1.705976, -0.4976699, -3.31304, 1, 0.227451, 0, 1,
-1.686038, -1.031325, -0.2852314, 1, 0.2352941, 0, 1,
-1.681207, -0.2209155, 0.4322058, 1, 0.2392157, 0, 1,
-1.660867, 2.379007, -0.5922428, 1, 0.2470588, 0, 1,
-1.659662, 0.4842636, -2.044071, 1, 0.2509804, 0, 1,
-1.655232, 0.08396682, -0.3177611, 1, 0.2588235, 0, 1,
-1.618406, 0.3218037, -1.820411, 1, 0.2627451, 0, 1,
-1.594213, 0.02061046, -1.576514, 1, 0.2705882, 0, 1,
-1.579508, 1.507367, 0.8451291, 1, 0.2745098, 0, 1,
-1.578246, 0.0636, -0.5291355, 1, 0.282353, 0, 1,
-1.567198, 0.09632766, -1.261094, 1, 0.2862745, 0, 1,
-1.559023, 0.4549974, 0.4471312, 1, 0.2941177, 0, 1,
-1.553193, 0.07395305, -0.4897085, 1, 0.3019608, 0, 1,
-1.546654, -0.8886411, -3.358054, 1, 0.3058824, 0, 1,
-1.54314, -0.5965484, -2.163218, 1, 0.3137255, 0, 1,
-1.5104, 1.054543, 0.1733755, 1, 0.3176471, 0, 1,
-1.508695, 0.7861899, -1.307424, 1, 0.3254902, 0, 1,
-1.498664, 0.4424211, 0.3415915, 1, 0.3294118, 0, 1,
-1.495061, -0.1421146, -1.663175, 1, 0.3372549, 0, 1,
-1.493378, -1.069667, -1.348195, 1, 0.3411765, 0, 1,
-1.492446, 0.7621861, -1.278289, 1, 0.3490196, 0, 1,
-1.48599, -0.8893266, -2.377754, 1, 0.3529412, 0, 1,
-1.483629, 0.3396932, -1.441932, 1, 0.3607843, 0, 1,
-1.480979, 0.4217709, -0.2141019, 1, 0.3647059, 0, 1,
-1.476696, -0.7088302, -0.8707791, 1, 0.372549, 0, 1,
-1.471612, 0.2448055, -2.802136, 1, 0.3764706, 0, 1,
-1.46697, 1.059864, 0.4040291, 1, 0.3843137, 0, 1,
-1.462425, 0.2831318, -0.08269174, 1, 0.3882353, 0, 1,
-1.461604, 0.2566238, -1.80368, 1, 0.3960784, 0, 1,
-1.45998, 0.08293065, 0.5851529, 1, 0.4039216, 0, 1,
-1.456063, 1.078177, 1.297444, 1, 0.4078431, 0, 1,
-1.454651, 0.7768378, -1.358294, 1, 0.4156863, 0, 1,
-1.446496, 0.1643583, -1.503927, 1, 0.4196078, 0, 1,
-1.43677, -0.7863782, -0.1368118, 1, 0.427451, 0, 1,
-1.430557, 1.250052, -0.5409833, 1, 0.4313726, 0, 1,
-1.425593, 1.525101, -0.1388832, 1, 0.4392157, 0, 1,
-1.424094, -0.03527833, -2.574893, 1, 0.4431373, 0, 1,
-1.414407, 2.435014, -0.454152, 1, 0.4509804, 0, 1,
-1.402927, -2.698854, -1.692526, 1, 0.454902, 0, 1,
-1.401703, 0.5127417, -2.404303, 1, 0.4627451, 0, 1,
-1.380215, -1.032068, -1.970034, 1, 0.4666667, 0, 1,
-1.373065, 1.545523, -1.122789, 1, 0.4745098, 0, 1,
-1.369492, 0.3358128, -1.258833, 1, 0.4784314, 0, 1,
-1.369, -0.07546873, -2.243026, 1, 0.4862745, 0, 1,
-1.351742, -0.2805706, -1.981887, 1, 0.4901961, 0, 1,
-1.341037, -1.458892, -2.559292, 1, 0.4980392, 0, 1,
-1.338771, -0.2562602, -1.753575, 1, 0.5058824, 0, 1,
-1.337194, -0.4133387, -2.654897, 1, 0.509804, 0, 1,
-1.333502, -0.386441, -1.009744, 1, 0.5176471, 0, 1,
-1.330814, -1.417411, -4.315006, 1, 0.5215687, 0, 1,
-1.328633, -0.6012079, -2.349673, 1, 0.5294118, 0, 1,
-1.318516, 0.871995, -0.2618065, 1, 0.5333334, 0, 1,
-1.315571, -0.4543065, -1.731126, 1, 0.5411765, 0, 1,
-1.310788, -1.888025, -2.441337, 1, 0.5450981, 0, 1,
-1.30714, 1.049169, -1.322902, 1, 0.5529412, 0, 1,
-1.289929, 1.223772, -0.08134966, 1, 0.5568628, 0, 1,
-1.283602, 2.456397, -0.7791764, 1, 0.5647059, 0, 1,
-1.277786, 0.09600052, 0.3886605, 1, 0.5686275, 0, 1,
-1.27706, -0.6286479, -0.3176793, 1, 0.5764706, 0, 1,
-1.272889, -0.09556075, -1.944294, 1, 0.5803922, 0, 1,
-1.267246, -0.6548473, -0.8160886, 1, 0.5882353, 0, 1,
-1.261232, -0.1642316, -0.7690565, 1, 0.5921569, 0, 1,
-1.246764, -0.8144271, -2.090351, 1, 0.6, 0, 1,
-1.239983, 0.07435887, -1.04619, 1, 0.6078432, 0, 1,
-1.233692, -1.276495, -2.415237, 1, 0.6117647, 0, 1,
-1.22391, 2.397188, 1.873229, 1, 0.6196079, 0, 1,
-1.219725, 1.067034, -0.04329145, 1, 0.6235294, 0, 1,
-1.213471, 1.869934, -0.1804511, 1, 0.6313726, 0, 1,
-1.211315, -0.2979859, -3.502782, 1, 0.6352941, 0, 1,
-1.20819, 0.9719973, -2.867673, 1, 0.6431373, 0, 1,
-1.205515, 0.1929529, -3.475188, 1, 0.6470588, 0, 1,
-1.199632, 0.5165073, -0.823961, 1, 0.654902, 0, 1,
-1.198209, 0.6055818, -2.092, 1, 0.6588235, 0, 1,
-1.197392, 0.01443144, -2.023934, 1, 0.6666667, 0, 1,
-1.189073, 0.3681035, -1.951828, 1, 0.6705883, 0, 1,
-1.185622, -0.06192133, -2.596461, 1, 0.6784314, 0, 1,
-1.181202, -0.1697933, -1.388253, 1, 0.682353, 0, 1,
-1.179103, 0.8231425, -0.1488289, 1, 0.6901961, 0, 1,
-1.178489, 0.5797263, -0.04214685, 1, 0.6941177, 0, 1,
-1.165193, -1.084749, -0.9180946, 1, 0.7019608, 0, 1,
-1.164449, -1.463706, -1.757902, 1, 0.7098039, 0, 1,
-1.163767, -0.2602195, -1.949556, 1, 0.7137255, 0, 1,
-1.159764, -0.03591505, -0.5189832, 1, 0.7215686, 0, 1,
-1.159636, -1.095551, -2.535855, 1, 0.7254902, 0, 1,
-1.137971, 0.5858755, -0.3136797, 1, 0.7333333, 0, 1,
-1.132519, 1.097594, 0.2009682, 1, 0.7372549, 0, 1,
-1.131548, 0.4628261, -1.647431, 1, 0.7450981, 0, 1,
-1.124361, -1.034735, -2.830842, 1, 0.7490196, 0, 1,
-1.119073, -0.4718121, -2.465066, 1, 0.7568628, 0, 1,
-1.114104, -0.4766131, -2.442458, 1, 0.7607843, 0, 1,
-1.10709, -0.498722, -2.194982, 1, 0.7686275, 0, 1,
-1.104779, 0.5206612, -0.9930273, 1, 0.772549, 0, 1,
-1.101867, -1.396348, -1.74324, 1, 0.7803922, 0, 1,
-1.101534, 1.696792, -1.240817, 1, 0.7843137, 0, 1,
-1.100784, 1.973718, -2.899669, 1, 0.7921569, 0, 1,
-1.097646, 0.2874302, -1.406677, 1, 0.7960784, 0, 1,
-1.092706, -0.6630688, -1.442563, 1, 0.8039216, 0, 1,
-1.091164, -0.01995982, -2.460449, 1, 0.8117647, 0, 1,
-1.086387, 0.03197075, -2.273522, 1, 0.8156863, 0, 1,
-1.085801, 0.5825461, -0.6917549, 1, 0.8235294, 0, 1,
-1.085153, 0.06838772, -1.552991, 1, 0.827451, 0, 1,
-1.082908, -0.6337081, -2.528424, 1, 0.8352941, 0, 1,
-1.077507, -0.2997189, -1.114168, 1, 0.8392157, 0, 1,
-1.076013, -0.8451439, -2.124351, 1, 0.8470588, 0, 1,
-1.068586, 2.750138, -1.154842, 1, 0.8509804, 0, 1,
-1.063191, 0.1501833, -1.893854, 1, 0.8588235, 0, 1,
-1.056448, 0.3001767, -0.7747679, 1, 0.8627451, 0, 1,
-1.056154, 2.089975, -1.697917, 1, 0.8705882, 0, 1,
-1.053093, -0.9308987, -2.820394, 1, 0.8745098, 0, 1,
-1.044593, -0.3740432, -1.63053, 1, 0.8823529, 0, 1,
-1.044049, -0.7647175, -1.292199, 1, 0.8862745, 0, 1,
-1.039247, -0.2495782, -1.992464, 1, 0.8941177, 0, 1,
-1.027864, 0.8903516, -3.989681, 1, 0.8980392, 0, 1,
-1.020025, 1.500032, -2.651812, 1, 0.9058824, 0, 1,
-1.018636, -0.392757, -3.159909, 1, 0.9137255, 0, 1,
-1.01632, 0.3432835, -0.9965112, 1, 0.9176471, 0, 1,
-1.006565, 0.05447758, 0.4641537, 1, 0.9254902, 0, 1,
-1.002409, -0.8303131, -3.494536, 1, 0.9294118, 0, 1,
-0.9983959, -1.656104, -4.397851, 1, 0.9372549, 0, 1,
-0.9906798, -0.04396866, -0.4263661, 1, 0.9411765, 0, 1,
-0.9856809, -1.658868, -1.172097, 1, 0.9490196, 0, 1,
-0.9818524, -0.1236474, -0.1690755, 1, 0.9529412, 0, 1,
-0.9814116, 0.9487225, -0.8635576, 1, 0.9607843, 0, 1,
-0.980741, 0.5283357, -1.373043, 1, 0.9647059, 0, 1,
-0.980255, 1.009037, 0.431955, 1, 0.972549, 0, 1,
-0.955805, 0.3211214, -0.9209985, 1, 0.9764706, 0, 1,
-0.9555422, 0.6159926, -1.968504, 1, 0.9843137, 0, 1,
-0.9533823, 0.2088734, -1.379363, 1, 0.9882353, 0, 1,
-0.9515319, -0.5163112, -2.694221, 1, 0.9960784, 0, 1,
-0.9475903, 0.1912941, -2.033249, 0.9960784, 1, 0, 1,
-0.9416096, -1.228329, -4.102544, 0.9921569, 1, 0, 1,
-0.9400381, 0.4029914, -0.791733, 0.9843137, 1, 0, 1,
-0.9367394, -0.4501718, -0.745643, 0.9803922, 1, 0, 1,
-0.9342218, 0.9137579, 0.03963563, 0.972549, 1, 0, 1,
-0.93271, 1.486982, -0.5559402, 0.9686275, 1, 0, 1,
-0.9311298, 0.3912345, -1.084917, 0.9607843, 1, 0, 1,
-0.9271458, -0.7364681, -2.624048, 0.9568627, 1, 0, 1,
-0.9245226, -0.4523212, -1.828036, 0.9490196, 1, 0, 1,
-0.9238076, -2.882031, -1.510881, 0.945098, 1, 0, 1,
-0.9228271, -1.602557, -2.622313, 0.9372549, 1, 0, 1,
-0.9226645, -0.3319769, -2.638426, 0.9333333, 1, 0, 1,
-0.9192721, 0.3837337, -0.7036515, 0.9254902, 1, 0, 1,
-0.9149444, -0.2914932, -1.193378, 0.9215686, 1, 0, 1,
-0.9109996, 0.3530748, -0.5326357, 0.9137255, 1, 0, 1,
-0.9107696, -0.5710672, -2.509187, 0.9098039, 1, 0, 1,
-0.9092395, 0.1048198, -1.450813, 0.9019608, 1, 0, 1,
-0.9074802, -0.9462617, -2.480475, 0.8941177, 1, 0, 1,
-0.899128, 0.8505552, -1.11226, 0.8901961, 1, 0, 1,
-0.895504, 0.7414816, -2.533813, 0.8823529, 1, 0, 1,
-0.895298, -0.2259507, -3.514324, 0.8784314, 1, 0, 1,
-0.8950732, -2.485994, -3.339472, 0.8705882, 1, 0, 1,
-0.8928476, 0.4130242, -0.2992072, 0.8666667, 1, 0, 1,
-0.8844472, 1.013454, -1.071177, 0.8588235, 1, 0, 1,
-0.8823118, 0.3413697, -2.753335, 0.854902, 1, 0, 1,
-0.8785138, -0.30987, -1.96938, 0.8470588, 1, 0, 1,
-0.8769721, 2.270611, -0.1408706, 0.8431373, 1, 0, 1,
-0.8756086, 0.525525, -0.3586733, 0.8352941, 1, 0, 1,
-0.8704312, 0.8877049, -2.070596, 0.8313726, 1, 0, 1,
-0.8678717, 0.3179427, -1.350987, 0.8235294, 1, 0, 1,
-0.8673173, -0.2767026, -2.96766, 0.8196079, 1, 0, 1,
-0.8671137, 0.7849277, 0.2693278, 0.8117647, 1, 0, 1,
-0.862714, -2.667169, -3.664386, 0.8078431, 1, 0, 1,
-0.8602068, 0.2524764, -1.097026, 0.8, 1, 0, 1,
-0.853953, 1.940387, 0.489234, 0.7921569, 1, 0, 1,
-0.8528094, 0.7749332, 0.2153129, 0.7882353, 1, 0, 1,
-0.8457135, 0.4399007, -0.3715213, 0.7803922, 1, 0, 1,
-0.8422552, 0.8180117, -0.4923677, 0.7764706, 1, 0, 1,
-0.8419123, -0.03203094, -2.593353, 0.7686275, 1, 0, 1,
-0.8383702, 1.38824, -0.3609793, 0.7647059, 1, 0, 1,
-0.8358366, -0.1285234, -2.096697, 0.7568628, 1, 0, 1,
-0.8342428, 1.895428, 1.190238, 0.7529412, 1, 0, 1,
-0.8246038, 0.003668051, -0.988589, 0.7450981, 1, 0, 1,
-0.8207872, -0.8526471, -2.242512, 0.7411765, 1, 0, 1,
-0.8193485, -0.2684258, -2.964054, 0.7333333, 1, 0, 1,
-0.8153659, -0.8279645, -2.104491, 0.7294118, 1, 0, 1,
-0.8140442, -1.054, -1.968252, 0.7215686, 1, 0, 1,
-0.8119515, 0.0316979, -0.9058823, 0.7176471, 1, 0, 1,
-0.8106482, 1.918946, -1.830516, 0.7098039, 1, 0, 1,
-0.8093139, 0.9094032, -0.6808633, 0.7058824, 1, 0, 1,
-0.8084188, -0.06276567, -1.109447, 0.6980392, 1, 0, 1,
-0.8062181, 0.4223243, -1.179154, 0.6901961, 1, 0, 1,
-0.7977207, 1.309673, -0.8371993, 0.6862745, 1, 0, 1,
-0.79553, -0.7270601, -4.960744, 0.6784314, 1, 0, 1,
-0.792168, -0.5981558, -2.475984, 0.6745098, 1, 0, 1,
-0.7867948, -0.2353214, -1.061091, 0.6666667, 1, 0, 1,
-0.785082, 0.1692764, 1.045897, 0.6627451, 1, 0, 1,
-0.7828635, 0.4038627, -2.587132, 0.654902, 1, 0, 1,
-0.7827467, 0.07564951, -2.029402, 0.6509804, 1, 0, 1,
-0.7700727, 0.4695073, 0.005594441, 0.6431373, 1, 0, 1,
-0.7617632, 0.6429285, -0.3944626, 0.6392157, 1, 0, 1,
-0.7579873, 1.611357, 1.067654, 0.6313726, 1, 0, 1,
-0.7507057, 0.006416105, 1.444121, 0.627451, 1, 0, 1,
-0.747975, 0.9904114, -1.298222, 0.6196079, 1, 0, 1,
-0.7442657, 0.8807157, -0.2342013, 0.6156863, 1, 0, 1,
-0.7392964, 0.3102971, -0.4603703, 0.6078432, 1, 0, 1,
-0.7345964, 2.280816, 0.2780722, 0.6039216, 1, 0, 1,
-0.7323048, 0.1846799, -1.442443, 0.5960785, 1, 0, 1,
-0.7307412, 0.3265249, -1.553345, 0.5882353, 1, 0, 1,
-0.7275952, 0.3984165, 0.9415033, 0.5843138, 1, 0, 1,
-0.7236427, -1.139762, -3.264107, 0.5764706, 1, 0, 1,
-0.7222783, 0.4338799, -2.300744, 0.572549, 1, 0, 1,
-0.7204826, 0.3933833, -0.4421689, 0.5647059, 1, 0, 1,
-0.7179367, -0.8769075, -1.972208, 0.5607843, 1, 0, 1,
-0.7167521, 0.06478745, -1.498304, 0.5529412, 1, 0, 1,
-0.7139589, -0.5327537, -2.974632, 0.5490196, 1, 0, 1,
-0.7063558, 0.5052875, 0.6058605, 0.5411765, 1, 0, 1,
-0.7033242, 1.434835, -1.598767, 0.5372549, 1, 0, 1,
-0.7026899, -0.7156908, -1.641117, 0.5294118, 1, 0, 1,
-0.7024324, -0.5071207, -2.568655, 0.5254902, 1, 0, 1,
-0.7011904, -0.59364, -2.700612, 0.5176471, 1, 0, 1,
-0.6929998, 0.4524158, -0.7570936, 0.5137255, 1, 0, 1,
-0.6922166, 1.187693, -0.7291405, 0.5058824, 1, 0, 1,
-0.6902478, -0.8264666, -3.757701, 0.5019608, 1, 0, 1,
-0.6835555, -1.172394, -3.115864, 0.4941176, 1, 0, 1,
-0.6830663, 0.6113716, -0.5205035, 0.4862745, 1, 0, 1,
-0.6793437, -1.176792, -2.20535, 0.4823529, 1, 0, 1,
-0.6789982, -0.05840642, -1.1405, 0.4745098, 1, 0, 1,
-0.6783859, -0.3840006, -1.492443, 0.4705882, 1, 0, 1,
-0.6758764, 1.067357, -0.3613717, 0.4627451, 1, 0, 1,
-0.6748802, -2.644979, -3.528642, 0.4588235, 1, 0, 1,
-0.6716499, -0.5617092, -2.762965, 0.4509804, 1, 0, 1,
-0.6646376, 0.7021195, -2.889677, 0.4470588, 1, 0, 1,
-0.6618525, 0.4505253, -1.601038, 0.4392157, 1, 0, 1,
-0.6567147, -0.3455354, -1.89254, 0.4352941, 1, 0, 1,
-0.6562791, -1.33692, -0.9626894, 0.427451, 1, 0, 1,
-0.6562524, -0.4176333, -1.890237, 0.4235294, 1, 0, 1,
-0.6520011, -0.8193663, -3.032938, 0.4156863, 1, 0, 1,
-0.6501771, -1.040908, -0.6855166, 0.4117647, 1, 0, 1,
-0.6342913, 0.02158899, -1.737082, 0.4039216, 1, 0, 1,
-0.6326934, 1.080196, -0.9583412, 0.3960784, 1, 0, 1,
-0.6320522, -0.6495432, -2.765309, 0.3921569, 1, 0, 1,
-0.6213929, 0.9305314, -0.1883698, 0.3843137, 1, 0, 1,
-0.6188688, 0.0108191, -2.721654, 0.3803922, 1, 0, 1,
-0.6131176, 0.2325866, -2.119631, 0.372549, 1, 0, 1,
-0.6127316, -0.06086221, -2.542587, 0.3686275, 1, 0, 1,
-0.6107385, 0.3258863, -1.237376, 0.3607843, 1, 0, 1,
-0.6023591, -1.341567, -1.219524, 0.3568628, 1, 0, 1,
-0.5947136, 1.527507, -0.784742, 0.3490196, 1, 0, 1,
-0.5931212, -0.2315521, -1.602193, 0.345098, 1, 0, 1,
-0.592977, -0.07341479, 0.1536769, 0.3372549, 1, 0, 1,
-0.5908993, -1.428139, -2.343762, 0.3333333, 1, 0, 1,
-0.5875744, -0.3403942, -2.988688, 0.3254902, 1, 0, 1,
-0.5847611, 1.042323, -0.3142985, 0.3215686, 1, 0, 1,
-0.5794356, 1.434169, 1.614825, 0.3137255, 1, 0, 1,
-0.579198, 0.210461, -1.333577, 0.3098039, 1, 0, 1,
-0.5767412, 0.2612413, 0.008496271, 0.3019608, 1, 0, 1,
-0.5744582, 0.03177037, -3.44431, 0.2941177, 1, 0, 1,
-0.5730233, -1.000988, -1.37082, 0.2901961, 1, 0, 1,
-0.5709277, 2.14554, 1.164844, 0.282353, 1, 0, 1,
-0.5703779, 0.06983349, 0.1845285, 0.2784314, 1, 0, 1,
-0.5575744, -0.7212585, -0.4821045, 0.2705882, 1, 0, 1,
-0.557124, 0.649739, -0.8063678, 0.2666667, 1, 0, 1,
-0.5545707, -0.4662749, -0.9957085, 0.2588235, 1, 0, 1,
-0.5443711, -1.72011, -3.714717, 0.254902, 1, 0, 1,
-0.5417952, -0.8499516, -3.262872, 0.2470588, 1, 0, 1,
-0.5385077, -1.135929, -3.027865, 0.2431373, 1, 0, 1,
-0.5361658, 0.2327219, -0.6825447, 0.2352941, 1, 0, 1,
-0.5322621, -1.118496, -1.59262, 0.2313726, 1, 0, 1,
-0.5318086, -1.872612, -2.430735, 0.2235294, 1, 0, 1,
-0.5252599, -0.5718961, -4.207239, 0.2196078, 1, 0, 1,
-0.5232852, -0.07826001, -3.262569, 0.2117647, 1, 0, 1,
-0.5206277, -0.4585172, -4.74106, 0.2078431, 1, 0, 1,
-0.5151021, 1.033853, -1.394032, 0.2, 1, 0, 1,
-0.5124873, -1.746318, -4.250064, 0.1921569, 1, 0, 1,
-0.510877, -0.8392289, -3.214506, 0.1882353, 1, 0, 1,
-0.5021182, -0.667294, -2.191579, 0.1803922, 1, 0, 1,
-0.5021029, -0.2253783, -0.1976525, 0.1764706, 1, 0, 1,
-0.500847, -0.6570851, -3.27669, 0.1686275, 1, 0, 1,
-0.4989117, 0.2327254, -1.528019, 0.1647059, 1, 0, 1,
-0.498547, -0.6116033, -2.150376, 0.1568628, 1, 0, 1,
-0.4937597, -0.2103366, -2.623711, 0.1529412, 1, 0, 1,
-0.4855211, -0.7742044, -1.339486, 0.145098, 1, 0, 1,
-0.4828518, 0.2258901, -1.372631, 0.1411765, 1, 0, 1,
-0.4808165, -1.785647, -1.660195, 0.1333333, 1, 0, 1,
-0.4787135, 0.5914381, 0.2507784, 0.1294118, 1, 0, 1,
-0.4776051, -1.099123, -3.083097, 0.1215686, 1, 0, 1,
-0.4743541, -0.6177639, -3.258284, 0.1176471, 1, 0, 1,
-0.4678356, 1.098224, 0.815491, 0.1098039, 1, 0, 1,
-0.4619144, 0.848668, -1.806035, 0.1058824, 1, 0, 1,
-0.4607148, 1.370793, -0.5629464, 0.09803922, 1, 0, 1,
-0.4553642, -0.5005032, -3.980953, 0.09019608, 1, 0, 1,
-0.4546889, 0.1431459, -0.3805627, 0.08627451, 1, 0, 1,
-0.4496877, 0.4391328, -0.9613016, 0.07843138, 1, 0, 1,
-0.4477626, -0.3965426, -2.870163, 0.07450981, 1, 0, 1,
-0.447388, -0.1047996, -2.737824, 0.06666667, 1, 0, 1,
-0.4438444, 1.991904, -0.3184214, 0.0627451, 1, 0, 1,
-0.4417927, -0.5021412, -3.167025, 0.05490196, 1, 0, 1,
-0.4349755, 1.630409, -1.43434, 0.05098039, 1, 0, 1,
-0.4341047, -0.2780769, -1.248542, 0.04313726, 1, 0, 1,
-0.4333666, -0.1340071, -4.050337, 0.03921569, 1, 0, 1,
-0.4332858, -1.750064, -3.29516, 0.03137255, 1, 0, 1,
-0.4314333, 0.7176352, -1.559128, 0.02745098, 1, 0, 1,
-0.4310832, -0.3530555, -3.494095, 0.01960784, 1, 0, 1,
-0.4302288, 0.9024323, -0.1381057, 0.01568628, 1, 0, 1,
-0.4284172, 1.057679, -0.9884821, 0.007843138, 1, 0, 1,
-0.4229394, 1.562286, 0.3429032, 0.003921569, 1, 0, 1,
-0.4205756, 0.4419875, -0.6326346, 0, 1, 0.003921569, 1,
-0.4205434, 0.1203803, -2.304458, 0, 1, 0.01176471, 1,
-0.4190059, -1.149744, -1.746207, 0, 1, 0.01568628, 1,
-0.3999749, 0.7339433, 0.8547918, 0, 1, 0.02352941, 1,
-0.399098, -0.3490284, -1.197067, 0, 1, 0.02745098, 1,
-0.3989657, 0.2529967, 0.02257295, 0, 1, 0.03529412, 1,
-0.3970378, -0.02708884, -3.329454, 0, 1, 0.03921569, 1,
-0.394384, 0.005122277, -1.593998, 0, 1, 0.04705882, 1,
-0.3937836, -0.5907086, -2.228301, 0, 1, 0.05098039, 1,
-0.3926556, -0.1645171, -1.171312, 0, 1, 0.05882353, 1,
-0.3908599, 0.4780125, -2.036313, 0, 1, 0.0627451, 1,
-0.390128, 0.7010965, -2.43659, 0, 1, 0.07058824, 1,
-0.388254, -0.2817838, -3.5737, 0, 1, 0.07450981, 1,
-0.3862452, 0.125174, -1.683747, 0, 1, 0.08235294, 1,
-0.385927, 0.2912673, -1.614201, 0, 1, 0.08627451, 1,
-0.3832505, -1.552906, -3.823166, 0, 1, 0.09411765, 1,
-0.382754, -0.6538744, -3.166473, 0, 1, 0.1019608, 1,
-0.3826341, 0.7863531, -1.580802, 0, 1, 0.1058824, 1,
-0.3824916, 0.1217806, -2.975555, 0, 1, 0.1137255, 1,
-0.382027, 0.05570653, -1.904489, 0, 1, 0.1176471, 1,
-0.3807553, -0.3752242, -1.568651, 0, 1, 0.1254902, 1,
-0.3799336, 0.4728757, 0.5610279, 0, 1, 0.1294118, 1,
-0.3766859, -0.7015008, -3.528475, 0, 1, 0.1372549, 1,
-0.3741806, -0.9395151, -2.38292, 0, 1, 0.1411765, 1,
-0.3740924, 0.09561811, 0.06313633, 0, 1, 0.1490196, 1,
-0.3731808, -0.3645642, -4.263526, 0, 1, 0.1529412, 1,
-0.3724099, -0.2772095, -1.842554, 0, 1, 0.1607843, 1,
-0.3677209, -0.2819944, -2.577672, 0, 1, 0.1647059, 1,
-0.3669139, 0.7316908, -0.6432008, 0, 1, 0.172549, 1,
-0.3614927, 0.02016022, 0.03446091, 0, 1, 0.1764706, 1,
-0.3590351, 2.154984, 0.1498885, 0, 1, 0.1843137, 1,
-0.3577873, -0.394072, -2.19746, 0, 1, 0.1882353, 1,
-0.3564047, 0.9120814, -0.9996238, 0, 1, 0.1960784, 1,
-0.3426672, 0.7791644, -0.940339, 0, 1, 0.2039216, 1,
-0.3397554, 0.8905659, 0.1321485, 0, 1, 0.2078431, 1,
-0.3367608, -0.2056826, -1.789327, 0, 1, 0.2156863, 1,
-0.336652, 0.8076216, -1.33549, 0, 1, 0.2196078, 1,
-0.3346985, 1.01626, 0.2962136, 0, 1, 0.227451, 1,
-0.3147536, 0.8766536, 1.17263, 0, 1, 0.2313726, 1,
-0.3131607, -0.512278, -2.270464, 0, 1, 0.2392157, 1,
-0.3117697, 0.1458169, -2.624018, 0, 1, 0.2431373, 1,
-0.3101045, 0.2088442, -0.1371484, 0, 1, 0.2509804, 1,
-0.3095027, -0.09402262, -1.009544, 0, 1, 0.254902, 1,
-0.2964273, -1.219648, -2.779498, 0, 1, 0.2627451, 1,
-0.2896706, 1.093539, -0.1905835, 0, 1, 0.2666667, 1,
-0.2894967, -0.8205534, -3.113948, 0, 1, 0.2745098, 1,
-0.2838429, 0.1999563, -2.439744, 0, 1, 0.2784314, 1,
-0.283093, 1.622103, 0.3958335, 0, 1, 0.2862745, 1,
-0.282025, -0.4296128, -3.478276, 0, 1, 0.2901961, 1,
-0.2801126, 0.4398247, 0.95652, 0, 1, 0.2980392, 1,
-0.2775329, 0.9758269, -1.3271, 0, 1, 0.3058824, 1,
-0.2737747, -1.15426, -5.082294, 0, 1, 0.3098039, 1,
-0.2723093, -0.6381787, -3.648917, 0, 1, 0.3176471, 1,
-0.2682924, 0.9488449, 1.649637, 0, 1, 0.3215686, 1,
-0.2653302, 0.4537099, -0.6011738, 0, 1, 0.3294118, 1,
-0.2643543, -0.7546266, -2.243151, 0, 1, 0.3333333, 1,
-0.260391, 0.3293765, -3.2983, 0, 1, 0.3411765, 1,
-0.2593685, -0.07974501, -3.535511, 0, 1, 0.345098, 1,
-0.2547165, -1.128671, -3.58986, 0, 1, 0.3529412, 1,
-0.2543552, -1.309434, -3.396921, 0, 1, 0.3568628, 1,
-0.2537388, 0.6941317, -2.204067, 0, 1, 0.3647059, 1,
-0.2536601, -2.107209, -2.356527, 0, 1, 0.3686275, 1,
-0.2509261, 0.2256844, 0.9559568, 0, 1, 0.3764706, 1,
-0.2405231, -2.465043, -1.080561, 0, 1, 0.3803922, 1,
-0.2402272, -0.2293501, -4.223876, 0, 1, 0.3882353, 1,
-0.2366369, -1.048417, -2.276113, 0, 1, 0.3921569, 1,
-0.235897, 1.317996, -0.942652, 0, 1, 0.4, 1,
-0.2357426, -1.664107, -1.826621, 0, 1, 0.4078431, 1,
-0.2354796, -1.051047, -2.970459, 0, 1, 0.4117647, 1,
-0.2316088, 0.5658188, -1.492399, 0, 1, 0.4196078, 1,
-0.2310485, -0.5331927, -3.359754, 0, 1, 0.4235294, 1,
-0.2303443, 1.122201, -0.370042, 0, 1, 0.4313726, 1,
-0.2202379, -0.5531968, -2.574397, 0, 1, 0.4352941, 1,
-0.2190037, -1.04284, -1.813479, 0, 1, 0.4431373, 1,
-0.2120722, -0.3957642, -2.554413, 0, 1, 0.4470588, 1,
-0.2116352, 0.02061027, -2.460025, 0, 1, 0.454902, 1,
-0.2113992, 0.8452853, -0.1552835, 0, 1, 0.4588235, 1,
-0.2007384, -1.525836, -3.468266, 0, 1, 0.4666667, 1,
-0.2005603, 1.036109, -1.998141, 0, 1, 0.4705882, 1,
-0.1993932, 1.327316, 0.4294952, 0, 1, 0.4784314, 1,
-0.1985459, -0.1677106, -1.301583, 0, 1, 0.4823529, 1,
-0.1979124, 1.399561, 0.5835546, 0, 1, 0.4901961, 1,
-0.1960236, 0.2467165, -0.7934881, 0, 1, 0.4941176, 1,
-0.1938386, -1.560317, -3.182289, 0, 1, 0.5019608, 1,
-0.187596, 1.328712, -0.07095052, 0, 1, 0.509804, 1,
-0.1801102, -0.2263192, -1.800283, 0, 1, 0.5137255, 1,
-0.1755755, -0.2747352, -3.181644, 0, 1, 0.5215687, 1,
-0.1741894, -0.7889495, -0.9367221, 0, 1, 0.5254902, 1,
-0.1724082, 0.3737746, -1.577723, 0, 1, 0.5333334, 1,
-0.1719265, 1.320904, -1.152647, 0, 1, 0.5372549, 1,
-0.1717297, -1.416897, -4.700536, 0, 1, 0.5450981, 1,
-0.1714308, 0.9769611, 0.07514063, 0, 1, 0.5490196, 1,
-0.1665652, 0.9900928, 0.4254077, 0, 1, 0.5568628, 1,
-0.1664047, -0.02615866, -2.184795, 0, 1, 0.5607843, 1,
-0.1632197, -1.529856, -3.162675, 0, 1, 0.5686275, 1,
-0.1544794, -0.8288175, -3.953755, 0, 1, 0.572549, 1,
-0.1513655, 0.8545773, 0.3574219, 0, 1, 0.5803922, 1,
-0.1498951, -2.137663, -2.645473, 0, 1, 0.5843138, 1,
-0.1457821, 1.044746, 1.412144, 0, 1, 0.5921569, 1,
-0.1453343, -0.8528454, -4.26168, 0, 1, 0.5960785, 1,
-0.1452006, -1.151259, -2.99605, 0, 1, 0.6039216, 1,
-0.1421637, -1.256745, -0.7959646, 0, 1, 0.6117647, 1,
-0.1387009, -2.556354, -1.858757, 0, 1, 0.6156863, 1,
-0.1374592, 0.6232383, -0.9911147, 0, 1, 0.6235294, 1,
-0.1374263, 1.168766, 0.6607361, 0, 1, 0.627451, 1,
-0.1348442, -1.983504, -2.606189, 0, 1, 0.6352941, 1,
-0.133572, -0.3953425, -2.514238, 0, 1, 0.6392157, 1,
-0.1331667, -1.448157, -3.966942, 0, 1, 0.6470588, 1,
-0.130063, -0.8752027, -0.3850268, 0, 1, 0.6509804, 1,
-0.1247568, -0.303998, -1.636719, 0, 1, 0.6588235, 1,
-0.1221878, -0.1843011, -2.961463, 0, 1, 0.6627451, 1,
-0.120555, 0.970323, -1.527162, 0, 1, 0.6705883, 1,
-0.1194973, -1.297671, -3.204531, 0, 1, 0.6745098, 1,
-0.1191246, 0.1413133, -1.349933, 0, 1, 0.682353, 1,
-0.1135764, -0.9963342, -3.950857, 0, 1, 0.6862745, 1,
-0.1103901, 1.176926, 0.4778647, 0, 1, 0.6941177, 1,
-0.1081046, 1.082024, -1.577514, 0, 1, 0.7019608, 1,
-0.1019149, -0.3089555, -3.194689, 0, 1, 0.7058824, 1,
-0.1000224, 1.354833, 0.2987897, 0, 1, 0.7137255, 1,
-0.09996501, 0.2969928, -2.818904, 0, 1, 0.7176471, 1,
-0.09855675, -1.862354, -5.0659, 0, 1, 0.7254902, 1,
-0.0964649, 1.483641, 1.362719, 0, 1, 0.7294118, 1,
-0.09640341, 0.7809123, -0.5668786, 0, 1, 0.7372549, 1,
-0.09431914, 0.488811, 1.054743, 0, 1, 0.7411765, 1,
-0.09363407, -0.3160237, -4.354692, 0, 1, 0.7490196, 1,
-0.08919863, -1.827868, -2.960402, 0, 1, 0.7529412, 1,
-0.08899333, 0.2677209, -0.1362863, 0, 1, 0.7607843, 1,
-0.08425683, -0.1935826, -1.363008, 0, 1, 0.7647059, 1,
-0.08390941, -0.09521139, -2.256322, 0, 1, 0.772549, 1,
-0.07957362, -0.3488137, -1.745146, 0, 1, 0.7764706, 1,
-0.07748887, -0.3444105, -2.876746, 0, 1, 0.7843137, 1,
-0.072747, 0.08160248, -3.100454, 0, 1, 0.7882353, 1,
-0.06545895, 0.04974909, -1.919529, 0, 1, 0.7960784, 1,
-0.06395525, 0.3502047, 0.2590351, 0, 1, 0.8039216, 1,
-0.06021419, -1.191957, -2.462019, 0, 1, 0.8078431, 1,
-0.05536614, 0.2975672, -0.4725174, 0, 1, 0.8156863, 1,
-0.05501986, 0.8923002, 0.3607453, 0, 1, 0.8196079, 1,
-0.05309829, -1.206406, -4.46849, 0, 1, 0.827451, 1,
-0.05167201, 0.8419507, 0.3383049, 0, 1, 0.8313726, 1,
-0.05056177, -1.452424, -2.83635, 0, 1, 0.8392157, 1,
-0.0397895, 1.151176, -1.000842, 0, 1, 0.8431373, 1,
-0.03974403, -1.723034, -2.621683, 0, 1, 0.8509804, 1,
-0.03761435, -1.245449, -2.988107, 0, 1, 0.854902, 1,
-0.03314447, 1.235768, -1.696618, 0, 1, 0.8627451, 1,
-0.03221541, 0.3823283, -0.5357781, 0, 1, 0.8666667, 1,
-0.01991166, -0.8067977, -1.580784, 0, 1, 0.8745098, 1,
-0.01430963, -0.6386861, -4.19698, 0, 1, 0.8784314, 1,
-0.01384615, -0.2259084, -1.416246, 0, 1, 0.8862745, 1,
-0.0112449, -0.2167135, -3.674151, 0, 1, 0.8901961, 1,
-0.005076128, 1.143379, -0.07029205, 0, 1, 0.8980392, 1,
0.003101654, 2.143324, -0.8152385, 0, 1, 0.9058824, 1,
0.006579453, -2.098109, 1.822299, 0, 1, 0.9098039, 1,
0.007713734, 0.3603707, -0.6873692, 0, 1, 0.9176471, 1,
0.01898265, -1.310187, 3.052652, 0, 1, 0.9215686, 1,
0.0192188, 0.4872522, 0.5284377, 0, 1, 0.9294118, 1,
0.022533, -0.5918692, 2.775382, 0, 1, 0.9333333, 1,
0.02476087, -0.5377648, 1.471721, 0, 1, 0.9411765, 1,
0.0251674, -2.482689, 2.662526, 0, 1, 0.945098, 1,
0.03174743, 0.4265842, -0.3633563, 0, 1, 0.9529412, 1,
0.03220743, -0.6467378, 3.454441, 0, 1, 0.9568627, 1,
0.03662421, -0.749971, 3.729421, 0, 1, 0.9647059, 1,
0.04403381, 0.5776751, 1.287025, 0, 1, 0.9686275, 1,
0.04730818, -0.6001806, 2.226645, 0, 1, 0.9764706, 1,
0.05330053, -0.7658979, 2.937064, 0, 1, 0.9803922, 1,
0.05379089, 1.274749, -0.4971642, 0, 1, 0.9882353, 1,
0.05632808, -0.6555652, 2.505532, 0, 1, 0.9921569, 1,
0.05707377, -0.7173154, 3.988606, 0, 1, 1, 1,
0.05772195, -2.456404, 2.195326, 0, 0.9921569, 1, 1,
0.05827593, -0.1348903, 4.304969, 0, 0.9882353, 1, 1,
0.05852862, -0.7485749, 3.274909, 0, 0.9803922, 1, 1,
0.06193404, -0.1529816, 2.706088, 0, 0.9764706, 1, 1,
0.06571575, 0.09925824, 0.683641, 0, 0.9686275, 1, 1,
0.07239627, -0.61224, 3.011262, 0, 0.9647059, 1, 1,
0.0727675, 0.3384373, -1.001849, 0, 0.9568627, 1, 1,
0.07450453, -0.3972822, 1.563396, 0, 0.9529412, 1, 1,
0.07692156, -1.233595, 2.738885, 0, 0.945098, 1, 1,
0.07822394, -0.09904373, 1.986292, 0, 0.9411765, 1, 1,
0.07887891, 0.4847774, 0.1232361, 0, 0.9333333, 1, 1,
0.08124533, 0.4384951, -0.03305803, 0, 0.9294118, 1, 1,
0.08141057, -0.06072772, 2.953251, 0, 0.9215686, 1, 1,
0.08668476, 1.893802, -0.3101421, 0, 0.9176471, 1, 1,
0.08708242, 0.3969556, 0.8481353, 0, 0.9098039, 1, 1,
0.08837616, 0.4105341, 1.538113, 0, 0.9058824, 1, 1,
0.08957521, -0.3003285, 3.373341, 0, 0.8980392, 1, 1,
0.09241521, -0.9967719, 2.098122, 0, 0.8901961, 1, 1,
0.09517931, -0.8944975, 3.563525, 0, 0.8862745, 1, 1,
0.09547686, -0.4427814, 3.227423, 0, 0.8784314, 1, 1,
0.1007576, 0.4106209, 0.3375702, 0, 0.8745098, 1, 1,
0.1015557, -0.6443543, 3.780744, 0, 0.8666667, 1, 1,
0.102216, -0.9996477, 1.405096, 0, 0.8627451, 1, 1,
0.1044226, -1.33842, 2.110376, 0, 0.854902, 1, 1,
0.1095629, -0.1880882, 3.561104, 0, 0.8509804, 1, 1,
0.1111373, -0.9935634, 3.556079, 0, 0.8431373, 1, 1,
0.1111605, -1.957097, 3.480922, 0, 0.8392157, 1, 1,
0.1129097, -0.7114893, 1.445737, 0, 0.8313726, 1, 1,
0.1144912, -1.338403, 2.182963, 0, 0.827451, 1, 1,
0.1145943, 0.8499128, -0.08321192, 0, 0.8196079, 1, 1,
0.1149783, 0.2711874, 1.670101, 0, 0.8156863, 1, 1,
0.1198036, -0.5303171, 4.128769, 0, 0.8078431, 1, 1,
0.1247027, -0.9888434, 2.493134, 0, 0.8039216, 1, 1,
0.1276274, 0.4887823, -0.6607403, 0, 0.7960784, 1, 1,
0.1284906, -0.490477, 1.761268, 0, 0.7882353, 1, 1,
0.1289342, 0.06603768, 1.668703, 0, 0.7843137, 1, 1,
0.1318519, 0.9724137, 2.696003, 0, 0.7764706, 1, 1,
0.1319239, -0.5306632, 3.378453, 0, 0.772549, 1, 1,
0.1362124, 0.4932187, -0.3516931, 0, 0.7647059, 1, 1,
0.1380689, 0.7142017, -0.606627, 0, 0.7607843, 1, 1,
0.1384784, 1.838049, 0.6910568, 0, 0.7529412, 1, 1,
0.1417736, 0.3014905, 0.6049799, 0, 0.7490196, 1, 1,
0.1443417, -1.773215, 2.546556, 0, 0.7411765, 1, 1,
0.1504925, -0.8393332, 3.529695, 0, 0.7372549, 1, 1,
0.1514997, 0.1417675, 2.068341, 0, 0.7294118, 1, 1,
0.1516282, -0.05222717, 3.331781, 0, 0.7254902, 1, 1,
0.1557823, 0.9786359, -1.108709, 0, 0.7176471, 1, 1,
0.157732, 0.05397934, 0.9737329, 0, 0.7137255, 1, 1,
0.159532, 0.6223599, -0.302399, 0, 0.7058824, 1, 1,
0.162137, 0.8684342, -0.387128, 0, 0.6980392, 1, 1,
0.1637522, -0.5153663, 1.329905, 0, 0.6941177, 1, 1,
0.1675229, 0.4549803, 0.54005, 0, 0.6862745, 1, 1,
0.1691238, -0.03754409, 2.144849, 0, 0.682353, 1, 1,
0.174472, -1.772225, 3.163082, 0, 0.6745098, 1, 1,
0.1750148, -1.686464, 2.186478, 0, 0.6705883, 1, 1,
0.1754246, 1.377089, -0.2318297, 0, 0.6627451, 1, 1,
0.1791304, 1.815362, -1.522954, 0, 0.6588235, 1, 1,
0.1799082, 1.655483, -0.7433885, 0, 0.6509804, 1, 1,
0.1805362, 0.2002488, 2.130918, 0, 0.6470588, 1, 1,
0.1808611, 0.08947797, 1.700228, 0, 0.6392157, 1, 1,
0.18202, -0.8305601, 3.940992, 0, 0.6352941, 1, 1,
0.1830126, 0.2462373, 0.9256603, 0, 0.627451, 1, 1,
0.1866588, -0.1315086, 1.802932, 0, 0.6235294, 1, 1,
0.1878992, -0.02662936, 1.220491, 0, 0.6156863, 1, 1,
0.187938, 0.6814671, 1.039456, 0, 0.6117647, 1, 1,
0.1897194, -0.6969984, 2.509657, 0, 0.6039216, 1, 1,
0.1917995, -2.519059, 2.593851, 0, 0.5960785, 1, 1,
0.1936733, -0.07131078, 2.449642, 0, 0.5921569, 1, 1,
0.1943155, -0.4576005, 2.21763, 0, 0.5843138, 1, 1,
0.1944461, 0.5048296, -1.797023, 0, 0.5803922, 1, 1,
0.1948096, -0.5382547, 1.528742, 0, 0.572549, 1, 1,
0.2016909, -0.5650854, 2.261638, 0, 0.5686275, 1, 1,
0.2091553, 1.566935, 0.5013017, 0, 0.5607843, 1, 1,
0.2122886, 0.05060674, 2.471159, 0, 0.5568628, 1, 1,
0.2143665, -0.4776236, 2.065721, 0, 0.5490196, 1, 1,
0.2155347, -0.1588434, 2.879624, 0, 0.5450981, 1, 1,
0.2166431, -0.8895338, 2.873865, 0, 0.5372549, 1, 1,
0.2242752, 0.06396795, 1.499786, 0, 0.5333334, 1, 1,
0.2255678, -0.5271446, 2.780711, 0, 0.5254902, 1, 1,
0.2271959, -1.742942, 2.852654, 0, 0.5215687, 1, 1,
0.2312243, -1.338919, 2.349639, 0, 0.5137255, 1, 1,
0.2338514, 0.4362676, -0.4305052, 0, 0.509804, 1, 1,
0.2358388, -0.8852146, 3.141801, 0, 0.5019608, 1, 1,
0.239529, 0.8289973, 0.4873603, 0, 0.4941176, 1, 1,
0.239711, 1.921237, 0.0765797, 0, 0.4901961, 1, 1,
0.2399734, 0.7981914, -1.215914, 0, 0.4823529, 1, 1,
0.2441655, -1.217884, 0.7733464, 0, 0.4784314, 1, 1,
0.2442416, -1.995048, 5.031636, 0, 0.4705882, 1, 1,
0.2467001, -0.9471111, 3.750319, 0, 0.4666667, 1, 1,
0.2467721, -1.038671, 0.7451494, 0, 0.4588235, 1, 1,
0.2477286, -0.7145005, 2.826026, 0, 0.454902, 1, 1,
0.2480913, 0.1128533, 0.2776076, 0, 0.4470588, 1, 1,
0.2484562, 0.3241519, -0.4448043, 0, 0.4431373, 1, 1,
0.2498634, 0.3320025, -0.5702851, 0, 0.4352941, 1, 1,
0.2514392, 1.103387, -0.3680494, 0, 0.4313726, 1, 1,
0.2590255, 0.8666632, -0.3474277, 0, 0.4235294, 1, 1,
0.2610056, 0.1956333, 1.166744, 0, 0.4196078, 1, 1,
0.2612051, 0.2791258, 1.304583, 0, 0.4117647, 1, 1,
0.2641151, -0.5060307, 2.24315, 0, 0.4078431, 1, 1,
0.2705737, -1.32173, 4.354812, 0, 0.4, 1, 1,
0.2736611, -1.488808, 2.391054, 0, 0.3921569, 1, 1,
0.2780297, -1.639793, 2.25042, 0, 0.3882353, 1, 1,
0.2827342, -0.3392482, 2.673986, 0, 0.3803922, 1, 1,
0.2841724, 0.215309, 0.5882552, 0, 0.3764706, 1, 1,
0.2874008, -1.161864, 3.532717, 0, 0.3686275, 1, 1,
0.2902557, -0.5119489, 2.244613, 0, 0.3647059, 1, 1,
0.2970432, -1.362586, 2.566464, 0, 0.3568628, 1, 1,
0.2991142, 0.3137155, 0.4140841, 0, 0.3529412, 1, 1,
0.3020624, 0.2235267, 1.251002, 0, 0.345098, 1, 1,
0.3021691, 0.5132226, 1.121434, 0, 0.3411765, 1, 1,
0.3045801, 0.1242025, 0.2108823, 0, 0.3333333, 1, 1,
0.3069557, -1.172377, 5.656078, 0, 0.3294118, 1, 1,
0.3076973, -0.07897262, 2.00751, 0, 0.3215686, 1, 1,
0.3095602, 0.2462716, 0.9573603, 0, 0.3176471, 1, 1,
0.3149756, -1.079197, 1.195386, 0, 0.3098039, 1, 1,
0.3163218, 0.127207, 1.793185, 0, 0.3058824, 1, 1,
0.3221091, 0.08955273, 1.018187, 0, 0.2980392, 1, 1,
0.3252172, -0.1196778, 1.682955, 0, 0.2901961, 1, 1,
0.327208, 0.6444375, -0.5351483, 0, 0.2862745, 1, 1,
0.3287292, -0.1490785, 1.02698, 0, 0.2784314, 1, 1,
0.3295512, -0.1297711, 1.353801, 0, 0.2745098, 1, 1,
0.3308355, -2.127234, 1.680373, 0, 0.2666667, 1, 1,
0.339374, -0.5949401, 3.388522, 0, 0.2627451, 1, 1,
0.3395869, -0.6788625, 3.593791, 0, 0.254902, 1, 1,
0.3397607, 0.9101617, 0.215825, 0, 0.2509804, 1, 1,
0.3508606, -0.4468909, 1.358897, 0, 0.2431373, 1, 1,
0.357275, 0.8449211, 0.6870737, 0, 0.2392157, 1, 1,
0.3599199, 1.201803, 2.21517, 0, 0.2313726, 1, 1,
0.3601313, 0.6671903, -1.293736, 0, 0.227451, 1, 1,
0.3622651, -0.8551018, 1.998108, 0, 0.2196078, 1, 1,
0.3658594, -0.1715344, 0.9381078, 0, 0.2156863, 1, 1,
0.3664786, -0.6256875, 2.648099, 0, 0.2078431, 1, 1,
0.3703353, -0.6297686, 2.141966, 0, 0.2039216, 1, 1,
0.3709989, 2.058402, -0.8247989, 0, 0.1960784, 1, 1,
0.3713751, -1.179121, 3.247584, 0, 0.1882353, 1, 1,
0.3720188, -0.02160004, 2.371902, 0, 0.1843137, 1, 1,
0.3745451, 1.089364, -0.07460802, 0, 0.1764706, 1, 1,
0.3794686, 0.1786689, 2.019302, 0, 0.172549, 1, 1,
0.3801581, -1.233257, 2.815097, 0, 0.1647059, 1, 1,
0.3815233, -1.058875, 2.501606, 0, 0.1607843, 1, 1,
0.3816921, -0.3672821, 2.420686, 0, 0.1529412, 1, 1,
0.381942, 0.7697126, -2.075452, 0, 0.1490196, 1, 1,
0.3855207, -0.5306395, 2.323932, 0, 0.1411765, 1, 1,
0.3893595, -1.008428, 3.386822, 0, 0.1372549, 1, 1,
0.3924959, 0.6515847, -1.381418, 0, 0.1294118, 1, 1,
0.3932785, -0.9358426, 1.983535, 0, 0.1254902, 1, 1,
0.4005421, 1.902396, 1.854836, 0, 0.1176471, 1, 1,
0.4005716, -0.6138089, 2.264321, 0, 0.1137255, 1, 1,
0.4023678, 0.3407221, -1.34986, 0, 0.1058824, 1, 1,
0.4075411, -0.4549405, 0.7983651, 0, 0.09803922, 1, 1,
0.4103347, 1.086082, 0.2694176, 0, 0.09411765, 1, 1,
0.4105667, 1.940999, 0.7652416, 0, 0.08627451, 1, 1,
0.4114312, -1.469417, 2.801368, 0, 0.08235294, 1, 1,
0.4140857, 0.1688983, 1.493274, 0, 0.07450981, 1, 1,
0.4149163, 1.688262, 1.346611, 0, 0.07058824, 1, 1,
0.4180622, -2.508434, 2.426218, 0, 0.0627451, 1, 1,
0.4184738, 0.06962769, 2.391443, 0, 0.05882353, 1, 1,
0.4270941, -0.4338984, 2.168625, 0, 0.05098039, 1, 1,
0.4335063, 0.2476531, 0.5122796, 0, 0.04705882, 1, 1,
0.4344499, 0.7450132, 2.119107, 0, 0.03921569, 1, 1,
0.4367497, 0.8723364, -0.7797961, 0, 0.03529412, 1, 1,
0.4367816, -0.237387, 0.2357753, 0, 0.02745098, 1, 1,
0.4371444, -1.394322, 1.87854, 0, 0.02352941, 1, 1,
0.4406509, 1.282226, -0.6719636, 0, 0.01568628, 1, 1,
0.4413641, -0.5781829, 3.734808, 0, 0.01176471, 1, 1,
0.4489518, 0.2937376, 0.6604717, 0, 0.003921569, 1, 1,
0.4532757, 0.7152261, 1.732411, 0.003921569, 0, 1, 1,
0.4544418, -1.062289, 2.899297, 0.007843138, 0, 1, 1,
0.4556731, 1.451333, -1.763692, 0.01568628, 0, 1, 1,
0.4557118, 0.4947189, 0.7948673, 0.01960784, 0, 1, 1,
0.4584369, 1.319245, -0.4300611, 0.02745098, 0, 1, 1,
0.4621073, 1.336928, 1.131191, 0.03137255, 0, 1, 1,
0.4629816, 0.5559722, -0.2602606, 0.03921569, 0, 1, 1,
0.4634123, -0.336885, 1.841248, 0.04313726, 0, 1, 1,
0.4643343, 1.024283, 0.470816, 0.05098039, 0, 1, 1,
0.4719037, 1.267791, 0.4655533, 0.05490196, 0, 1, 1,
0.4816, -0.2675292, 2.052087, 0.0627451, 0, 1, 1,
0.4859049, -0.8041127, 2.141093, 0.06666667, 0, 1, 1,
0.4868108, -0.7637436, 5.152534, 0.07450981, 0, 1, 1,
0.48749, -1.292348, 2.253765, 0.07843138, 0, 1, 1,
0.4908134, -0.5359735, 2.11988, 0.08627451, 0, 1, 1,
0.4931221, -0.03424079, 0.6488451, 0.09019608, 0, 1, 1,
0.4944759, 0.280622, 0.2522163, 0.09803922, 0, 1, 1,
0.49482, -0.1377546, 4.131651, 0.1058824, 0, 1, 1,
0.4966485, -0.2055481, 1.559252, 0.1098039, 0, 1, 1,
0.4986735, 0.5427442, 0.579108, 0.1176471, 0, 1, 1,
0.5015611, 0.6863426, 0.6313506, 0.1215686, 0, 1, 1,
0.5080025, -0.2532032, 2.450596, 0.1294118, 0, 1, 1,
0.5106665, -0.6747766, 2.53673, 0.1333333, 0, 1, 1,
0.5199696, 0.4598885, -0.148353, 0.1411765, 0, 1, 1,
0.5248046, 0.02389907, 1.441196, 0.145098, 0, 1, 1,
0.5281492, 0.1053741, 1.381846, 0.1529412, 0, 1, 1,
0.530288, 0.7117843, 0.245242, 0.1568628, 0, 1, 1,
0.5329726, 0.7967474, 1.982034, 0.1647059, 0, 1, 1,
0.5427507, -0.5968119, 2.946765, 0.1686275, 0, 1, 1,
0.547071, -1.626998, 1.447417, 0.1764706, 0, 1, 1,
0.5470723, -0.7216973, 0.69358, 0.1803922, 0, 1, 1,
0.550883, 0.4527052, 1.279645, 0.1882353, 0, 1, 1,
0.5509617, 0.854358, -0.08595847, 0.1921569, 0, 1, 1,
0.5510215, -0.8076675, 0.5170076, 0.2, 0, 1, 1,
0.5566363, 1.240187, 0.6687222, 0.2078431, 0, 1, 1,
0.5604167, 0.8844065, 0.3978328, 0.2117647, 0, 1, 1,
0.5608196, 0.310648, 1.229148, 0.2196078, 0, 1, 1,
0.564484, -0.03043083, 3.724774, 0.2235294, 0, 1, 1,
0.5648392, -0.04096026, 1.486876, 0.2313726, 0, 1, 1,
0.5694948, -0.4978482, 2.287705, 0.2352941, 0, 1, 1,
0.5771101, 0.6513126, -0.2995118, 0.2431373, 0, 1, 1,
0.5777172, -0.3025963, 1.748819, 0.2470588, 0, 1, 1,
0.5789078, -0.8835624, 4.412201, 0.254902, 0, 1, 1,
0.5796345, -1.541193, 1.285754, 0.2588235, 0, 1, 1,
0.580175, 0.1846259, 2.583194, 0.2666667, 0, 1, 1,
0.5892371, -0.3058572, 3.222482, 0.2705882, 0, 1, 1,
0.5902686, -0.4881608, 1.593987, 0.2784314, 0, 1, 1,
0.5904068, -0.2618932, 2.928591, 0.282353, 0, 1, 1,
0.5924639, -0.4087452, 2.262441, 0.2901961, 0, 1, 1,
0.5929481, 1.035697, 0.2218613, 0.2941177, 0, 1, 1,
0.5942506, -1.603493, 3.514316, 0.3019608, 0, 1, 1,
0.595997, -0.8772653, 1.143458, 0.3098039, 0, 1, 1,
0.5970157, -1.333067, 2.323248, 0.3137255, 0, 1, 1,
0.6033784, -0.03632061, 1.888202, 0.3215686, 0, 1, 1,
0.6038424, -1.478702, 2.931406, 0.3254902, 0, 1, 1,
0.6075426, -0.03340026, 0.7860473, 0.3333333, 0, 1, 1,
0.6165562, 0.1999199, 3.64086, 0.3372549, 0, 1, 1,
0.6226415, -0.5786815, 2.367405, 0.345098, 0, 1, 1,
0.6314566, 0.02325539, 3.046563, 0.3490196, 0, 1, 1,
0.6322819, 1.102601, -0.4989358, 0.3568628, 0, 1, 1,
0.6346982, 0.5363526, 1.154513, 0.3607843, 0, 1, 1,
0.6357033, -0.2565159, 2.626068, 0.3686275, 0, 1, 1,
0.6389793, 0.5318224, -0.1553014, 0.372549, 0, 1, 1,
0.6402038, -0.2688794, 3.369548, 0.3803922, 0, 1, 1,
0.6447318, -1.301206, 3.530278, 0.3843137, 0, 1, 1,
0.64855, -0.3455565, 1.503025, 0.3921569, 0, 1, 1,
0.6498021, 1.12932, 0.07371555, 0.3960784, 0, 1, 1,
0.6569895, -0.4830151, 1.124538, 0.4039216, 0, 1, 1,
0.6585259, 0.9402481, 0.09661983, 0.4117647, 0, 1, 1,
0.6595691, -1.679171, 1.385544, 0.4156863, 0, 1, 1,
0.6609111, -0.2132986, 2.41615, 0.4235294, 0, 1, 1,
0.6619459, 0.5288132, 2.548889, 0.427451, 0, 1, 1,
0.6656151, -1.170099, 2.530125, 0.4352941, 0, 1, 1,
0.679248, 0.09639697, 1.032604, 0.4392157, 0, 1, 1,
0.6833243, -0.9275893, 3.394796, 0.4470588, 0, 1, 1,
0.6864219, 0.795137, 1.891649, 0.4509804, 0, 1, 1,
0.6896549, 1.192284, 0.4253979, 0.4588235, 0, 1, 1,
0.6954333, -0.0634873, 1.459544, 0.4627451, 0, 1, 1,
0.6979848, -0.1350864, 1.199427, 0.4705882, 0, 1, 1,
0.7004066, 0.5405598, 0.9057414, 0.4745098, 0, 1, 1,
0.7041733, 0.8437826, 2.031891, 0.4823529, 0, 1, 1,
0.7090258, -0.4958842, 3.119559, 0.4862745, 0, 1, 1,
0.710264, 0.2411971, 3.403212, 0.4941176, 0, 1, 1,
0.7138434, 1.105006, 1.50001, 0.5019608, 0, 1, 1,
0.7170473, -0.863524, 2.834396, 0.5058824, 0, 1, 1,
0.7174935, 0.1822153, -0.04964066, 0.5137255, 0, 1, 1,
0.7184064, 0.2640095, 1.60075, 0.5176471, 0, 1, 1,
0.7221912, -1.12925, 2.647431, 0.5254902, 0, 1, 1,
0.7240441, -1.25967, 2.781279, 0.5294118, 0, 1, 1,
0.7286503, 0.9129577, 1.456155, 0.5372549, 0, 1, 1,
0.7291867, -0.3794039, 2.500258, 0.5411765, 0, 1, 1,
0.7356626, 0.04358279, 2.45087, 0.5490196, 0, 1, 1,
0.7360765, -0.3979065, 1.408421, 0.5529412, 0, 1, 1,
0.7439092, 1.240665, 0.9072319, 0.5607843, 0, 1, 1,
0.747371, 0.2571186, 0.4532271, 0.5647059, 0, 1, 1,
0.7554311, -1.756927, 3.586846, 0.572549, 0, 1, 1,
0.7559878, -1.256782, 1.741153, 0.5764706, 0, 1, 1,
0.7560771, 1.031158, -0.03744859, 0.5843138, 0, 1, 1,
0.7663834, 0.49981, 1.861328, 0.5882353, 0, 1, 1,
0.7686133, 0.4476891, 2.115861, 0.5960785, 0, 1, 1,
0.7785017, -0.8149906, 3.023642, 0.6039216, 0, 1, 1,
0.7797856, -0.3559944, 1.474752, 0.6078432, 0, 1, 1,
0.7961333, 0.1756344, 1.36076, 0.6156863, 0, 1, 1,
0.7968351, -0.1930305, 2.29519, 0.6196079, 0, 1, 1,
0.7974958, 0.545203, 1.3558, 0.627451, 0, 1, 1,
0.7981101, -1.343678, 0.9529145, 0.6313726, 0, 1, 1,
0.8003083, 0.6099802, 2.241097, 0.6392157, 0, 1, 1,
0.8011092, 0.4251376, -0.3910783, 0.6431373, 0, 1, 1,
0.8022022, 0.4598651, 0.7015097, 0.6509804, 0, 1, 1,
0.8047373, 0.9006446, 0.3777418, 0.654902, 0, 1, 1,
0.8054608, 0.07151949, 1.83899, 0.6627451, 0, 1, 1,
0.8062787, 1.022535, -0.06148315, 0.6666667, 0, 1, 1,
0.8069783, -0.06354518, 1.894951, 0.6745098, 0, 1, 1,
0.8084412, -0.4843283, 2.195987, 0.6784314, 0, 1, 1,
0.8099088, 0.5554395, 2.017727, 0.6862745, 0, 1, 1,
0.810002, 0.6629025, -1.430221, 0.6901961, 0, 1, 1,
0.8105278, -0.9816839, 3.423855, 0.6980392, 0, 1, 1,
0.8109095, -0.006247369, 3.250541, 0.7058824, 0, 1, 1,
0.8145549, 0.3730735, 0.5917157, 0.7098039, 0, 1, 1,
0.8209025, 1.577121, 0.9581768, 0.7176471, 0, 1, 1,
0.8245595, 0.6272171, 1.177233, 0.7215686, 0, 1, 1,
0.8267683, -1.484902, 3.687629, 0.7294118, 0, 1, 1,
0.8300947, 0.3805315, 1.04661, 0.7333333, 0, 1, 1,
0.8415032, -1.622411, 4.512453, 0.7411765, 0, 1, 1,
0.846312, -0.5328631, 1.875061, 0.7450981, 0, 1, 1,
0.84648, -0.03967678, 3.217718, 0.7529412, 0, 1, 1,
0.8470245, -0.446958, 1.208794, 0.7568628, 0, 1, 1,
0.8477699, 1.934614, 0.6090657, 0.7647059, 0, 1, 1,
0.8526317, -0.7870178, 2.352822, 0.7686275, 0, 1, 1,
0.8529575, 0.28494, 2.930866, 0.7764706, 0, 1, 1,
0.8640714, -1.119992, 1.711249, 0.7803922, 0, 1, 1,
0.8667861, 0.9858561, -0.2923105, 0.7882353, 0, 1, 1,
0.8679975, 0.459519, 2.274129, 0.7921569, 0, 1, 1,
0.8694465, -1.397408, 4.401134, 0.8, 0, 1, 1,
0.8696945, -0.05399639, 2.313873, 0.8078431, 0, 1, 1,
0.8712451, 0.006078475, 2.66447, 0.8117647, 0, 1, 1,
0.8747815, -1.269553, 0.8684494, 0.8196079, 0, 1, 1,
0.8768104, 0.4741821, 2.0574, 0.8235294, 0, 1, 1,
0.8777905, -0.3614858, 2.659107, 0.8313726, 0, 1, 1,
0.8808451, -1.65081, 1.045544, 0.8352941, 0, 1, 1,
0.8860826, -1.282317, 4.234176, 0.8431373, 0, 1, 1,
0.8872844, -1.107064, 2.275239, 0.8470588, 0, 1, 1,
0.8910653, 0.2973371, 0.960008, 0.854902, 0, 1, 1,
0.8912988, -0.68792, 2.451915, 0.8588235, 0, 1, 1,
0.8966942, 0.2654045, 1.352149, 0.8666667, 0, 1, 1,
0.8968276, 0.3428794, -0.7273421, 0.8705882, 0, 1, 1,
0.8986638, -0.1449966, 0.458162, 0.8784314, 0, 1, 1,
0.9119069, 0.8658769, 0.4267882, 0.8823529, 0, 1, 1,
0.9127051, -0.4239895, 1.317419, 0.8901961, 0, 1, 1,
0.9192119, 0.266593, 1.623195, 0.8941177, 0, 1, 1,
0.9199671, -1.847475, 2.412857, 0.9019608, 0, 1, 1,
0.9214898, -0.545724, 2.454591, 0.9098039, 0, 1, 1,
0.9282844, 0.1305074, 1.287615, 0.9137255, 0, 1, 1,
0.9308344, 2.443771, 1.410114, 0.9215686, 0, 1, 1,
0.9326508, -0.3630886, 1.293596, 0.9254902, 0, 1, 1,
0.9358681, 1.228426, 0.3134397, 0.9333333, 0, 1, 1,
0.9363669, 0.07389806, 1.003176, 0.9372549, 0, 1, 1,
0.9414634, -2.21449, 2.675327, 0.945098, 0, 1, 1,
0.9549002, 0.2870885, 2.723343, 0.9490196, 0, 1, 1,
0.9549066, -2.144516, 3.138754, 0.9568627, 0, 1, 1,
0.9609996, 0.02537685, 1.371191, 0.9607843, 0, 1, 1,
0.9611824, 0.2272631, 2.22781, 0.9686275, 0, 1, 1,
0.9672875, 1.124016, 1.834993, 0.972549, 0, 1, 1,
0.9760309, -0.5692223, 0.8312801, 0.9803922, 0, 1, 1,
0.9795155, 1.423626, 0.7134312, 0.9843137, 0, 1, 1,
0.9865699, 0.46004, 2.674136, 0.9921569, 0, 1, 1,
0.9869132, -0.5308309, 2.33909, 0.9960784, 0, 1, 1,
0.9928803, -0.7527508, 0.770762, 1, 0, 0.9960784, 1,
0.9948374, 0.811096, -0.8109761, 1, 0, 0.9882353, 1,
0.9965335, 1.665572, -1.550405, 1, 0, 0.9843137, 1,
0.9967891, -0.61154, 1.563341, 1, 0, 0.9764706, 1,
0.9971444, -1.764338, 2.377483, 1, 0, 0.972549, 1,
0.9985923, -0.7279176, 2.655794, 1, 0, 0.9647059, 1,
1.003194, 0.04433679, 2.64648, 1, 0, 0.9607843, 1,
1.004144, -0.3500484, 2.84251, 1, 0, 0.9529412, 1,
1.007798, -0.673304, 3.01492, 1, 0, 0.9490196, 1,
1.009654, -2.404988, 4.626161, 1, 0, 0.9411765, 1,
1.010016, -0.2868776, 0.2434117, 1, 0, 0.9372549, 1,
1.010185, 0.5786222, 2.814722, 1, 0, 0.9294118, 1,
1.01058, -0.6852192, 1.924714, 1, 0, 0.9254902, 1,
1.012588, -0.08049886, 0.2043654, 1, 0, 0.9176471, 1,
1.012921, -0.9449483, 3.794627, 1, 0, 0.9137255, 1,
1.019763, -0.9952396, 2.731889, 1, 0, 0.9058824, 1,
1.022078, 0.4469497, 0.5872901, 1, 0, 0.9019608, 1,
1.025857, 0.3120432, 0.8709135, 1, 0, 0.8941177, 1,
1.032751, 0.1917471, 1.75682, 1, 0, 0.8862745, 1,
1.036196, -0.2032751, 4.199217, 1, 0, 0.8823529, 1,
1.037538, -1.188489, 3.340927, 1, 0, 0.8745098, 1,
1.04735, -0.0298731, 3.655397, 1, 0, 0.8705882, 1,
1.048331, -0.821256, 2.643718, 1, 0, 0.8627451, 1,
1.053121, 1.280467, 1.155116, 1, 0, 0.8588235, 1,
1.062344, 0.05238777, 1.762512, 1, 0, 0.8509804, 1,
1.06268, 0.1393551, 0.7861334, 1, 0, 0.8470588, 1,
1.066289, 0.3078727, 1.039513, 1, 0, 0.8392157, 1,
1.069284, 1.175342, 0.04392153, 1, 0, 0.8352941, 1,
1.080324, 1.430828, 0.7013476, 1, 0, 0.827451, 1,
1.081856, 0.4326464, 2.197291, 1, 0, 0.8235294, 1,
1.094323, -1.954983, 2.556825, 1, 0, 0.8156863, 1,
1.095414, -1.593156, 1.601296, 1, 0, 0.8117647, 1,
1.100119, -1.0695, 4.256251, 1, 0, 0.8039216, 1,
1.105259, -0.07509445, 2.251693, 1, 0, 0.7960784, 1,
1.108122, 0.1154817, 2.08777, 1, 0, 0.7921569, 1,
1.110085, -0.07305928, 0.1067893, 1, 0, 0.7843137, 1,
1.111212, 0.7236107, 0.7498738, 1, 0, 0.7803922, 1,
1.115924, -0.7518085, 1.492385, 1, 0, 0.772549, 1,
1.117865, 0.0508675, 2.383728, 1, 0, 0.7686275, 1,
1.119724, 1.122503, -0.1494681, 1, 0, 0.7607843, 1,
1.120225, -1.343774, 2.795166, 1, 0, 0.7568628, 1,
1.121937, 0.6989462, 1.944474, 1, 0, 0.7490196, 1,
1.12717, -1.830428, 1.753153, 1, 0, 0.7450981, 1,
1.133114, 0.2352454, -0.5676857, 1, 0, 0.7372549, 1,
1.144003, -0.8133484, 3.771265, 1, 0, 0.7333333, 1,
1.150142, -0.02671544, 0.1938243, 1, 0, 0.7254902, 1,
1.154962, -1.179931, 2.421835, 1, 0, 0.7215686, 1,
1.156971, -0.6243965, 3.147727, 1, 0, 0.7137255, 1,
1.159891, -1.027978, 1.1108, 1, 0, 0.7098039, 1,
1.160304, -0.3712996, 0.912998, 1, 0, 0.7019608, 1,
1.161584, -0.4478037, 0.4652573, 1, 0, 0.6941177, 1,
1.1625, 0.1127531, 0.8198686, 1, 0, 0.6901961, 1,
1.162621, -0.08606242, 0.6978512, 1, 0, 0.682353, 1,
1.168243, -1.132772, 2.1801, 1, 0, 0.6784314, 1,
1.177742, 1.080207, 1.393186, 1, 0, 0.6705883, 1,
1.179408, 0.3663285, 0.4329619, 1, 0, 0.6666667, 1,
1.185846, 1.011077, 0.8869777, 1, 0, 0.6588235, 1,
1.190636, 0.3269309, 1.460997, 1, 0, 0.654902, 1,
1.202039, 0.4678551, 1.168445, 1, 0, 0.6470588, 1,
1.204061, -0.5069364, 2.952755, 1, 0, 0.6431373, 1,
1.204846, -0.3749487, 2.212937, 1, 0, 0.6352941, 1,
1.20649, -0.4135391, 1.137309, 1, 0, 0.6313726, 1,
1.21706, -2.319575, 1.070041, 1, 0, 0.6235294, 1,
1.234956, 0.3502145, -0.852895, 1, 0, 0.6196079, 1,
1.238133, -0.695155, 1.112379, 1, 0, 0.6117647, 1,
1.244205, -1.563383, 0.777289, 1, 0, 0.6078432, 1,
1.24766, 0.03706396, 1.16544, 1, 0, 0.6, 1,
1.253211, 1.647552, -0.831692, 1, 0, 0.5921569, 1,
1.257295, 0.2113083, -0.538471, 1, 0, 0.5882353, 1,
1.260997, -1.584751, 3.775496, 1, 0, 0.5803922, 1,
1.261491, 0.7039872, 1.757519, 1, 0, 0.5764706, 1,
1.262503, -2.258689, 2.894592, 1, 0, 0.5686275, 1,
1.268996, 0.6693997, 2.097799, 1, 0, 0.5647059, 1,
1.272593, 0.4989164, 0.6400723, 1, 0, 0.5568628, 1,
1.290476, -0.3804253, -0.2601284, 1, 0, 0.5529412, 1,
1.291087, -0.4269829, 2.213121, 1, 0, 0.5450981, 1,
1.297608, -0.3531294, 1.449421, 1, 0, 0.5411765, 1,
1.300943, 0.9742713, 0.9366672, 1, 0, 0.5333334, 1,
1.305087, 0.461134, 2.408757, 1, 0, 0.5294118, 1,
1.310329, 0.2256446, 3.922084, 1, 0, 0.5215687, 1,
1.34193, 1.17617, 0.3863902, 1, 0, 0.5176471, 1,
1.344691, 0.1983016, 1.24676, 1, 0, 0.509804, 1,
1.353385, 1.22463, 1.837191, 1, 0, 0.5058824, 1,
1.354968, 1.147175, 0.3247181, 1, 0, 0.4980392, 1,
1.355375, 0.4141284, 2.382821, 1, 0, 0.4901961, 1,
1.358122, -0.2099184, 2.05088, 1, 0, 0.4862745, 1,
1.369713, 0.2691878, 2.073884, 1, 0, 0.4784314, 1,
1.373149, -1.404468, 1.486855, 1, 0, 0.4745098, 1,
1.392557, 0.6883413, 1.925683, 1, 0, 0.4666667, 1,
1.39518, -0.0251398, 1.58927, 1, 0, 0.4627451, 1,
1.401844, 1.547951, 2.205318, 1, 0, 0.454902, 1,
1.4237, -0.2987242, 2.060957, 1, 0, 0.4509804, 1,
1.429573, 1.502381, 0.858197, 1, 0, 0.4431373, 1,
1.431621, 0.4795651, 1.214228, 1, 0, 0.4392157, 1,
1.435456, -0.2549244, 1.628498, 1, 0, 0.4313726, 1,
1.458386, -0.82054, 1.78102, 1, 0, 0.427451, 1,
1.474644, -0.5877631, 1.646449, 1, 0, 0.4196078, 1,
1.493035, -0.8232025, 2.5378, 1, 0, 0.4156863, 1,
1.513454, 0.3261315, 1.332757, 1, 0, 0.4078431, 1,
1.526706, -0.2078949, 2.250289, 1, 0, 0.4039216, 1,
1.528713, 0.1750396, 2.01763, 1, 0, 0.3960784, 1,
1.549088, 0.5232201, -0.0994086, 1, 0, 0.3882353, 1,
1.549507, 0.1589027, 2.387792, 1, 0, 0.3843137, 1,
1.550921, -0.8842034, 2.474605, 1, 0, 0.3764706, 1,
1.553145, 0.3938735, 1.69685, 1, 0, 0.372549, 1,
1.571018, 1.70016, 1.120512, 1, 0, 0.3647059, 1,
1.588337, 1.680103, 2.0936, 1, 0, 0.3607843, 1,
1.593798, 1.384708, 0.1884397, 1, 0, 0.3529412, 1,
1.599278, -1.322411, 0.8376924, 1, 0, 0.3490196, 1,
1.600199, -0.8546981, 2.229733, 1, 0, 0.3411765, 1,
1.609016, 2.818796, 1.045848, 1, 0, 0.3372549, 1,
1.612654, 0.2528165, 0.6191179, 1, 0, 0.3294118, 1,
1.614445, 0.8370965, 1.188568, 1, 0, 0.3254902, 1,
1.62234, -0.5328927, 1.264666, 1, 0, 0.3176471, 1,
1.622978, -0.2606504, 1.338134, 1, 0, 0.3137255, 1,
1.631327, 1.932756, 0.9188423, 1, 0, 0.3058824, 1,
1.655629, -1.459537, 2.535838, 1, 0, 0.2980392, 1,
1.66472, 0.06338994, 2.161732, 1, 0, 0.2941177, 1,
1.685264, 2.500828, 0.02943289, 1, 0, 0.2862745, 1,
1.692423, -1.695478, 2.223661, 1, 0, 0.282353, 1,
1.701047, 0.195884, 0.6614088, 1, 0, 0.2745098, 1,
1.71218, 0.6774054, 2.063771, 1, 0, 0.2705882, 1,
1.72234, -1.279319, 4.389628, 1, 0, 0.2627451, 1,
1.734323, -0.1421996, 0.2590585, 1, 0, 0.2588235, 1,
1.734324, -0.3066779, 0.6242762, 1, 0, 0.2509804, 1,
1.767336, -1.656927, 2.589208, 1, 0, 0.2470588, 1,
1.79627, -1.504809, 1.068913, 1, 0, 0.2392157, 1,
1.797304, -0.9882544, 1.453011, 1, 0, 0.2352941, 1,
1.800712, 1.428798, 0.6050231, 1, 0, 0.227451, 1,
1.805034, -1.05099, 1.832139, 1, 0, 0.2235294, 1,
1.811587, -0.1181495, 1.860598, 1, 0, 0.2156863, 1,
1.814737, -0.4783105, 1.849192, 1, 0, 0.2117647, 1,
1.827874, 2.380305, -0.5498012, 1, 0, 0.2039216, 1,
1.82968, -0.0849506, 3.096935, 1, 0, 0.1960784, 1,
1.832655, 1.118384, 0.7983442, 1, 0, 0.1921569, 1,
1.870666, -0.4503309, 2.050476, 1, 0, 0.1843137, 1,
1.88239, -2.063197, 2.314158, 1, 0, 0.1803922, 1,
1.889766, -0.1795771, 0.7851015, 1, 0, 0.172549, 1,
1.895508, -0.761455, 3.43503, 1, 0, 0.1686275, 1,
1.922497, 2.150206, 1.999975, 1, 0, 0.1607843, 1,
1.942998, 1.491072, 0.5766318, 1, 0, 0.1568628, 1,
1.943267, -0.2898889, 2.904581, 1, 0, 0.1490196, 1,
1.956027, 2.426297, 2.934658, 1, 0, 0.145098, 1,
1.993533, -0.3820731, 1.161149, 1, 0, 0.1372549, 1,
2.041351, 0.4039457, 1.41265, 1, 0, 0.1333333, 1,
2.136709, 1.963985, 2.182014, 1, 0, 0.1254902, 1,
2.149075, 0.8283843, 1.621016, 1, 0, 0.1215686, 1,
2.154895, 1.028016, 0.994997, 1, 0, 0.1137255, 1,
2.170326, 0.8565056, 1.021118, 1, 0, 0.1098039, 1,
2.217584, -1.146598, 2.572738, 1, 0, 0.1019608, 1,
2.248867, -3.511604, 2.66696, 1, 0, 0.09411765, 1,
2.281601, -0.2667024, 1.920217, 1, 0, 0.09019608, 1,
2.351012, 0.4266508, 1.412195, 1, 0, 0.08235294, 1,
2.36193, 0.8678017, 0.2558587, 1, 0, 0.07843138, 1,
2.362388, 0.3256665, 1.893737, 1, 0, 0.07058824, 1,
2.382885, 2.090209, 0.4111757, 1, 0, 0.06666667, 1,
2.431716, 1.034501, 0.05743944, 1, 0, 0.05882353, 1,
2.445121, -0.6658736, 3.952853, 1, 0, 0.05490196, 1,
2.492134, 1.593621, 1.860589, 1, 0, 0.04705882, 1,
2.516931, -1.130693, 2.773157, 1, 0, 0.04313726, 1,
2.529326, 1.691436, -0.2356364, 1, 0, 0.03529412, 1,
2.592666, 1.099811, 0.9721785, 1, 0, 0.03137255, 1,
2.646914, 0.1230309, 0.8136284, 1, 0, 0.02352941, 1,
2.75043, -0.2257321, 1.282913, 1, 0, 0.01960784, 1,
2.758715, -0.2840058, 1.928523, 1, 0, 0.01176471, 1,
2.909507, 0.1501134, 2.200556, 1, 0, 0.007843138, 1
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
-0.2811363, -4.594828, -6.902449, 0, -0.5, 0.5, 0.5,
-0.2811363, -4.594828, -6.902449, 1, -0.5, 0.5, 0.5,
-0.2811363, -4.594828, -6.902449, 1, 1.5, 0.5, 0.5,
-0.2811363, -4.594828, -6.902449, 0, 1.5, 0.5, 0.5
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
-4.553408, -0.3162518, -6.902449, 0, -0.5, 0.5, 0.5,
-4.553408, -0.3162518, -6.902449, 1, -0.5, 0.5, 0.5,
-4.553408, -0.3162518, -6.902449, 1, 1.5, 0.5, 0.5,
-4.553408, -0.3162518, -6.902449, 0, 1.5, 0.5, 0.5
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
-4.553408, -4.594828, 0.2868917, 0, -0.5, 0.5, 0.5,
-4.553408, -4.594828, 0.2868917, 1, -0.5, 0.5, 0.5,
-4.553408, -4.594828, 0.2868917, 1, 1.5, 0.5, 0.5,
-4.553408, -4.594828, 0.2868917, 0, 1.5, 0.5, 0.5
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
-3, -3.607464, -5.24337,
2, -3.607464, -5.24337,
-3, -3.607464, -5.24337,
-3, -3.772025, -5.519883,
-2, -3.607464, -5.24337,
-2, -3.772025, -5.519883,
-1, -3.607464, -5.24337,
-1, -3.772025, -5.519883,
0, -3.607464, -5.24337,
0, -3.772025, -5.519883,
1, -3.607464, -5.24337,
1, -3.772025, -5.519883,
2, -3.607464, -5.24337,
2, -3.772025, -5.519883
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
-3, -4.101146, -6.072909, 0, -0.5, 0.5, 0.5,
-3, -4.101146, -6.072909, 1, -0.5, 0.5, 0.5,
-3, -4.101146, -6.072909, 1, 1.5, 0.5, 0.5,
-3, -4.101146, -6.072909, 0, 1.5, 0.5, 0.5,
-2, -4.101146, -6.072909, 0, -0.5, 0.5, 0.5,
-2, -4.101146, -6.072909, 1, -0.5, 0.5, 0.5,
-2, -4.101146, -6.072909, 1, 1.5, 0.5, 0.5,
-2, -4.101146, -6.072909, 0, 1.5, 0.5, 0.5,
-1, -4.101146, -6.072909, 0, -0.5, 0.5, 0.5,
-1, -4.101146, -6.072909, 1, -0.5, 0.5, 0.5,
-1, -4.101146, -6.072909, 1, 1.5, 0.5, 0.5,
-1, -4.101146, -6.072909, 0, 1.5, 0.5, 0.5,
0, -4.101146, -6.072909, 0, -0.5, 0.5, 0.5,
0, -4.101146, -6.072909, 1, -0.5, 0.5, 0.5,
0, -4.101146, -6.072909, 1, 1.5, 0.5, 0.5,
0, -4.101146, -6.072909, 0, 1.5, 0.5, 0.5,
1, -4.101146, -6.072909, 0, -0.5, 0.5, 0.5,
1, -4.101146, -6.072909, 1, -0.5, 0.5, 0.5,
1, -4.101146, -6.072909, 1, 1.5, 0.5, 0.5,
1, -4.101146, -6.072909, 0, 1.5, 0.5, 0.5,
2, -4.101146, -6.072909, 0, -0.5, 0.5, 0.5,
2, -4.101146, -6.072909, 1, -0.5, 0.5, 0.5,
2, -4.101146, -6.072909, 1, 1.5, 0.5, 0.5,
2, -4.101146, -6.072909, 0, 1.5, 0.5, 0.5
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
-3.567499, -3, -5.24337,
-3.567499, 2, -5.24337,
-3.567499, -3, -5.24337,
-3.731817, -3, -5.519883,
-3.567499, -2, -5.24337,
-3.731817, -2, -5.519883,
-3.567499, -1, -5.24337,
-3.731817, -1, -5.519883,
-3.567499, 0, -5.24337,
-3.731817, 0, -5.519883,
-3.567499, 1, -5.24337,
-3.731817, 1, -5.519883,
-3.567499, 2, -5.24337,
-3.731817, 2, -5.519883
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
-4.060453, -3, -6.072909, 0, -0.5, 0.5, 0.5,
-4.060453, -3, -6.072909, 1, -0.5, 0.5, 0.5,
-4.060453, -3, -6.072909, 1, 1.5, 0.5, 0.5,
-4.060453, -3, -6.072909, 0, 1.5, 0.5, 0.5,
-4.060453, -2, -6.072909, 0, -0.5, 0.5, 0.5,
-4.060453, -2, -6.072909, 1, -0.5, 0.5, 0.5,
-4.060453, -2, -6.072909, 1, 1.5, 0.5, 0.5,
-4.060453, -2, -6.072909, 0, 1.5, 0.5, 0.5,
-4.060453, -1, -6.072909, 0, -0.5, 0.5, 0.5,
-4.060453, -1, -6.072909, 1, -0.5, 0.5, 0.5,
-4.060453, -1, -6.072909, 1, 1.5, 0.5, 0.5,
-4.060453, -1, -6.072909, 0, 1.5, 0.5, 0.5,
-4.060453, 0, -6.072909, 0, -0.5, 0.5, 0.5,
-4.060453, 0, -6.072909, 1, -0.5, 0.5, 0.5,
-4.060453, 0, -6.072909, 1, 1.5, 0.5, 0.5,
-4.060453, 0, -6.072909, 0, 1.5, 0.5, 0.5,
-4.060453, 1, -6.072909, 0, -0.5, 0.5, 0.5,
-4.060453, 1, -6.072909, 1, -0.5, 0.5, 0.5,
-4.060453, 1, -6.072909, 1, 1.5, 0.5, 0.5,
-4.060453, 1, -6.072909, 0, 1.5, 0.5, 0.5,
-4.060453, 2, -6.072909, 0, -0.5, 0.5, 0.5,
-4.060453, 2, -6.072909, 1, -0.5, 0.5, 0.5,
-4.060453, 2, -6.072909, 1, 1.5, 0.5, 0.5,
-4.060453, 2, -6.072909, 0, 1.5, 0.5, 0.5
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
-3.567499, -3.607464, -4,
-3.567499, -3.607464, 4,
-3.567499, -3.607464, -4,
-3.731817, -3.772025, -4,
-3.567499, -3.607464, -2,
-3.731817, -3.772025, -2,
-3.567499, -3.607464, 0,
-3.731817, -3.772025, 0,
-3.567499, -3.607464, 2,
-3.731817, -3.772025, 2,
-3.567499, -3.607464, 4,
-3.731817, -3.772025, 4
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
-4.060453, -4.101146, -4, 0, -0.5, 0.5, 0.5,
-4.060453, -4.101146, -4, 1, -0.5, 0.5, 0.5,
-4.060453, -4.101146, -4, 1, 1.5, 0.5, 0.5,
-4.060453, -4.101146, -4, 0, 1.5, 0.5, 0.5,
-4.060453, -4.101146, -2, 0, -0.5, 0.5, 0.5,
-4.060453, -4.101146, -2, 1, -0.5, 0.5, 0.5,
-4.060453, -4.101146, -2, 1, 1.5, 0.5, 0.5,
-4.060453, -4.101146, -2, 0, 1.5, 0.5, 0.5,
-4.060453, -4.101146, 0, 0, -0.5, 0.5, 0.5,
-4.060453, -4.101146, 0, 1, -0.5, 0.5, 0.5,
-4.060453, -4.101146, 0, 1, 1.5, 0.5, 0.5,
-4.060453, -4.101146, 0, 0, 1.5, 0.5, 0.5,
-4.060453, -4.101146, 2, 0, -0.5, 0.5, 0.5,
-4.060453, -4.101146, 2, 1, -0.5, 0.5, 0.5,
-4.060453, -4.101146, 2, 1, 1.5, 0.5, 0.5,
-4.060453, -4.101146, 2, 0, 1.5, 0.5, 0.5,
-4.060453, -4.101146, 4, 0, -0.5, 0.5, 0.5,
-4.060453, -4.101146, 4, 1, -0.5, 0.5, 0.5,
-4.060453, -4.101146, 4, 1, 1.5, 0.5, 0.5,
-4.060453, -4.101146, 4, 0, 1.5, 0.5, 0.5
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
-3.567499, -3.607464, -5.24337,
-3.567499, 2.974961, -5.24337,
-3.567499, -3.607464, 5.817153,
-3.567499, 2.974961, 5.817153,
-3.567499, -3.607464, -5.24337,
-3.567499, -3.607464, 5.817153,
-3.567499, 2.974961, -5.24337,
-3.567499, 2.974961, 5.817153,
-3.567499, -3.607464, -5.24337,
3.005226, -3.607464, -5.24337,
-3.567499, -3.607464, 5.817153,
3.005226, -3.607464, 5.817153,
-3.567499, 2.974961, -5.24337,
3.005226, 2.974961, -5.24337,
-3.567499, 2.974961, 5.817153,
3.005226, 2.974961, 5.817153,
3.005226, -3.607464, -5.24337,
3.005226, 2.974961, -5.24337,
3.005226, -3.607464, 5.817153,
3.005226, 2.974961, 5.817153,
3.005226, -3.607464, -5.24337,
3.005226, -3.607464, 5.817153,
3.005226, 2.974961, -5.24337,
3.005226, 2.974961, 5.817153
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
var radius = 7.71716;
var distance = 34.33452;
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
mvMatrix.translate( 0.2811363, 0.3162518, -0.2868917 );
mvMatrix.scale( 1.26948, 1.267609, 0.7543896 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.33452);
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
phosphorine<-read.table("phosphorine.xyz")
```

```
## Error in read.table("phosphorine.xyz"): no lines available in input
```

```r
x<-phosphorine$V2
```

```
## Error in eval(expr, envir, enclos): object 'phosphorine' not found
```

```r
y<-phosphorine$V3
```

```
## Error in eval(expr, envir, enclos): object 'phosphorine' not found
```

```r
z<-phosphorine$V4
```

```
## Error in eval(expr, envir, enclos): object 'phosphorine' not found
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
-3.47178, 1.311069, -1.160038, 0, 0, 1, 1, 1,
-3.391201, 0.5896847, -2.567665, 1, 0, 0, 1, 1,
-2.702085, -0.455566, -1.323328, 1, 0, 0, 1, 1,
-2.530951, 0.7666201, -3.069761, 1, 0, 0, 1, 1,
-2.526386, -0.3795827, -1.084487, 1, 0, 0, 1, 1,
-2.518009, 0.4034772, -0.6927549, 1, 0, 0, 1, 1,
-2.422694, -0.7609667, -2.129963, 0, 0, 0, 1, 1,
-2.343144, 1.107367, -1.794544, 0, 0, 0, 1, 1,
-2.308005, 1.691343, -0.5683295, 0, 0, 0, 1, 1,
-2.266819, -1.687135, -1.038894, 0, 0, 0, 1, 1,
-2.263226, 1.07535, -1.294206, 0, 0, 0, 1, 1,
-2.2558, 0.4982127, -1.676718, 0, 0, 0, 1, 1,
-2.222141, 1.514692, -2.279398, 0, 0, 0, 1, 1,
-2.210724, 0.1357357, -1.80923, 1, 1, 1, 1, 1,
-2.107176, -1.762091, -3.087517, 1, 1, 1, 1, 1,
-2.059986, 0.8269243, -1.050679, 1, 1, 1, 1, 1,
-1.978088, -0.399447, -0.5661442, 1, 1, 1, 1, 1,
-1.961658, 0.9373949, -1.35407, 1, 1, 1, 1, 1,
-1.95894, 1.146657, 0.3666253, 1, 1, 1, 1, 1,
-1.957269, 0.09313387, -2.476045, 1, 1, 1, 1, 1,
-1.956988, 0.1555169, -2.294847, 1, 1, 1, 1, 1,
-1.935103, 0.2353167, 0.1377222, 1, 1, 1, 1, 1,
-1.934571, 0.7593222, -0.1982393, 1, 1, 1, 1, 1,
-1.924906, -2.278175, -2.487303, 1, 1, 1, 1, 1,
-1.915148, -0.5801442, -0.6545067, 1, 1, 1, 1, 1,
-1.903196, -1.403381, -1.637612, 1, 1, 1, 1, 1,
-1.888511, -0.3663683, -0.7055587, 1, 1, 1, 1, 1,
-1.877734, 1.669582, -0.5281268, 1, 1, 1, 1, 1,
-1.838461, -1.360788, -2.295635, 0, 0, 1, 1, 1,
-1.829899, 0.8440509, -0.7550558, 1, 0, 0, 1, 1,
-1.826972, -0.5292172, -2.037955, 1, 0, 0, 1, 1,
-1.794459, -1.957473, -2.522548, 1, 0, 0, 1, 1,
-1.775957, 1.086315, 0.07955461, 1, 0, 0, 1, 1,
-1.767065, -1.099533, 0.8547723, 1, 0, 0, 1, 1,
-1.719841, 1.263165, -0.7436355, 0, 0, 0, 1, 1,
-1.717544, 0.108826, 1.112751, 0, 0, 0, 1, 1,
-1.715789, 2.8791, -1.918036, 0, 0, 0, 1, 1,
-1.710678, 1.787138, -2.07041, 0, 0, 0, 1, 1,
-1.705976, -0.4976699, -3.31304, 0, 0, 0, 1, 1,
-1.686038, -1.031325, -0.2852314, 0, 0, 0, 1, 1,
-1.681207, -0.2209155, 0.4322058, 0, 0, 0, 1, 1,
-1.660867, 2.379007, -0.5922428, 1, 1, 1, 1, 1,
-1.659662, 0.4842636, -2.044071, 1, 1, 1, 1, 1,
-1.655232, 0.08396682, -0.3177611, 1, 1, 1, 1, 1,
-1.618406, 0.3218037, -1.820411, 1, 1, 1, 1, 1,
-1.594213, 0.02061046, -1.576514, 1, 1, 1, 1, 1,
-1.579508, 1.507367, 0.8451291, 1, 1, 1, 1, 1,
-1.578246, 0.0636, -0.5291355, 1, 1, 1, 1, 1,
-1.567198, 0.09632766, -1.261094, 1, 1, 1, 1, 1,
-1.559023, 0.4549974, 0.4471312, 1, 1, 1, 1, 1,
-1.553193, 0.07395305, -0.4897085, 1, 1, 1, 1, 1,
-1.546654, -0.8886411, -3.358054, 1, 1, 1, 1, 1,
-1.54314, -0.5965484, -2.163218, 1, 1, 1, 1, 1,
-1.5104, 1.054543, 0.1733755, 1, 1, 1, 1, 1,
-1.508695, 0.7861899, -1.307424, 1, 1, 1, 1, 1,
-1.498664, 0.4424211, 0.3415915, 1, 1, 1, 1, 1,
-1.495061, -0.1421146, -1.663175, 0, 0, 1, 1, 1,
-1.493378, -1.069667, -1.348195, 1, 0, 0, 1, 1,
-1.492446, 0.7621861, -1.278289, 1, 0, 0, 1, 1,
-1.48599, -0.8893266, -2.377754, 1, 0, 0, 1, 1,
-1.483629, 0.3396932, -1.441932, 1, 0, 0, 1, 1,
-1.480979, 0.4217709, -0.2141019, 1, 0, 0, 1, 1,
-1.476696, -0.7088302, -0.8707791, 0, 0, 0, 1, 1,
-1.471612, 0.2448055, -2.802136, 0, 0, 0, 1, 1,
-1.46697, 1.059864, 0.4040291, 0, 0, 0, 1, 1,
-1.462425, 0.2831318, -0.08269174, 0, 0, 0, 1, 1,
-1.461604, 0.2566238, -1.80368, 0, 0, 0, 1, 1,
-1.45998, 0.08293065, 0.5851529, 0, 0, 0, 1, 1,
-1.456063, 1.078177, 1.297444, 0, 0, 0, 1, 1,
-1.454651, 0.7768378, -1.358294, 1, 1, 1, 1, 1,
-1.446496, 0.1643583, -1.503927, 1, 1, 1, 1, 1,
-1.43677, -0.7863782, -0.1368118, 1, 1, 1, 1, 1,
-1.430557, 1.250052, -0.5409833, 1, 1, 1, 1, 1,
-1.425593, 1.525101, -0.1388832, 1, 1, 1, 1, 1,
-1.424094, -0.03527833, -2.574893, 1, 1, 1, 1, 1,
-1.414407, 2.435014, -0.454152, 1, 1, 1, 1, 1,
-1.402927, -2.698854, -1.692526, 1, 1, 1, 1, 1,
-1.401703, 0.5127417, -2.404303, 1, 1, 1, 1, 1,
-1.380215, -1.032068, -1.970034, 1, 1, 1, 1, 1,
-1.373065, 1.545523, -1.122789, 1, 1, 1, 1, 1,
-1.369492, 0.3358128, -1.258833, 1, 1, 1, 1, 1,
-1.369, -0.07546873, -2.243026, 1, 1, 1, 1, 1,
-1.351742, -0.2805706, -1.981887, 1, 1, 1, 1, 1,
-1.341037, -1.458892, -2.559292, 1, 1, 1, 1, 1,
-1.338771, -0.2562602, -1.753575, 0, 0, 1, 1, 1,
-1.337194, -0.4133387, -2.654897, 1, 0, 0, 1, 1,
-1.333502, -0.386441, -1.009744, 1, 0, 0, 1, 1,
-1.330814, -1.417411, -4.315006, 1, 0, 0, 1, 1,
-1.328633, -0.6012079, -2.349673, 1, 0, 0, 1, 1,
-1.318516, 0.871995, -0.2618065, 1, 0, 0, 1, 1,
-1.315571, -0.4543065, -1.731126, 0, 0, 0, 1, 1,
-1.310788, -1.888025, -2.441337, 0, 0, 0, 1, 1,
-1.30714, 1.049169, -1.322902, 0, 0, 0, 1, 1,
-1.289929, 1.223772, -0.08134966, 0, 0, 0, 1, 1,
-1.283602, 2.456397, -0.7791764, 0, 0, 0, 1, 1,
-1.277786, 0.09600052, 0.3886605, 0, 0, 0, 1, 1,
-1.27706, -0.6286479, -0.3176793, 0, 0, 0, 1, 1,
-1.272889, -0.09556075, -1.944294, 1, 1, 1, 1, 1,
-1.267246, -0.6548473, -0.8160886, 1, 1, 1, 1, 1,
-1.261232, -0.1642316, -0.7690565, 1, 1, 1, 1, 1,
-1.246764, -0.8144271, -2.090351, 1, 1, 1, 1, 1,
-1.239983, 0.07435887, -1.04619, 1, 1, 1, 1, 1,
-1.233692, -1.276495, -2.415237, 1, 1, 1, 1, 1,
-1.22391, 2.397188, 1.873229, 1, 1, 1, 1, 1,
-1.219725, 1.067034, -0.04329145, 1, 1, 1, 1, 1,
-1.213471, 1.869934, -0.1804511, 1, 1, 1, 1, 1,
-1.211315, -0.2979859, -3.502782, 1, 1, 1, 1, 1,
-1.20819, 0.9719973, -2.867673, 1, 1, 1, 1, 1,
-1.205515, 0.1929529, -3.475188, 1, 1, 1, 1, 1,
-1.199632, 0.5165073, -0.823961, 1, 1, 1, 1, 1,
-1.198209, 0.6055818, -2.092, 1, 1, 1, 1, 1,
-1.197392, 0.01443144, -2.023934, 1, 1, 1, 1, 1,
-1.189073, 0.3681035, -1.951828, 0, 0, 1, 1, 1,
-1.185622, -0.06192133, -2.596461, 1, 0, 0, 1, 1,
-1.181202, -0.1697933, -1.388253, 1, 0, 0, 1, 1,
-1.179103, 0.8231425, -0.1488289, 1, 0, 0, 1, 1,
-1.178489, 0.5797263, -0.04214685, 1, 0, 0, 1, 1,
-1.165193, -1.084749, -0.9180946, 1, 0, 0, 1, 1,
-1.164449, -1.463706, -1.757902, 0, 0, 0, 1, 1,
-1.163767, -0.2602195, -1.949556, 0, 0, 0, 1, 1,
-1.159764, -0.03591505, -0.5189832, 0, 0, 0, 1, 1,
-1.159636, -1.095551, -2.535855, 0, 0, 0, 1, 1,
-1.137971, 0.5858755, -0.3136797, 0, 0, 0, 1, 1,
-1.132519, 1.097594, 0.2009682, 0, 0, 0, 1, 1,
-1.131548, 0.4628261, -1.647431, 0, 0, 0, 1, 1,
-1.124361, -1.034735, -2.830842, 1, 1, 1, 1, 1,
-1.119073, -0.4718121, -2.465066, 1, 1, 1, 1, 1,
-1.114104, -0.4766131, -2.442458, 1, 1, 1, 1, 1,
-1.10709, -0.498722, -2.194982, 1, 1, 1, 1, 1,
-1.104779, 0.5206612, -0.9930273, 1, 1, 1, 1, 1,
-1.101867, -1.396348, -1.74324, 1, 1, 1, 1, 1,
-1.101534, 1.696792, -1.240817, 1, 1, 1, 1, 1,
-1.100784, 1.973718, -2.899669, 1, 1, 1, 1, 1,
-1.097646, 0.2874302, -1.406677, 1, 1, 1, 1, 1,
-1.092706, -0.6630688, -1.442563, 1, 1, 1, 1, 1,
-1.091164, -0.01995982, -2.460449, 1, 1, 1, 1, 1,
-1.086387, 0.03197075, -2.273522, 1, 1, 1, 1, 1,
-1.085801, 0.5825461, -0.6917549, 1, 1, 1, 1, 1,
-1.085153, 0.06838772, -1.552991, 1, 1, 1, 1, 1,
-1.082908, -0.6337081, -2.528424, 1, 1, 1, 1, 1,
-1.077507, -0.2997189, -1.114168, 0, 0, 1, 1, 1,
-1.076013, -0.8451439, -2.124351, 1, 0, 0, 1, 1,
-1.068586, 2.750138, -1.154842, 1, 0, 0, 1, 1,
-1.063191, 0.1501833, -1.893854, 1, 0, 0, 1, 1,
-1.056448, 0.3001767, -0.7747679, 1, 0, 0, 1, 1,
-1.056154, 2.089975, -1.697917, 1, 0, 0, 1, 1,
-1.053093, -0.9308987, -2.820394, 0, 0, 0, 1, 1,
-1.044593, -0.3740432, -1.63053, 0, 0, 0, 1, 1,
-1.044049, -0.7647175, -1.292199, 0, 0, 0, 1, 1,
-1.039247, -0.2495782, -1.992464, 0, 0, 0, 1, 1,
-1.027864, 0.8903516, -3.989681, 0, 0, 0, 1, 1,
-1.020025, 1.500032, -2.651812, 0, 0, 0, 1, 1,
-1.018636, -0.392757, -3.159909, 0, 0, 0, 1, 1,
-1.01632, 0.3432835, -0.9965112, 1, 1, 1, 1, 1,
-1.006565, 0.05447758, 0.4641537, 1, 1, 1, 1, 1,
-1.002409, -0.8303131, -3.494536, 1, 1, 1, 1, 1,
-0.9983959, -1.656104, -4.397851, 1, 1, 1, 1, 1,
-0.9906798, -0.04396866, -0.4263661, 1, 1, 1, 1, 1,
-0.9856809, -1.658868, -1.172097, 1, 1, 1, 1, 1,
-0.9818524, -0.1236474, -0.1690755, 1, 1, 1, 1, 1,
-0.9814116, 0.9487225, -0.8635576, 1, 1, 1, 1, 1,
-0.980741, 0.5283357, -1.373043, 1, 1, 1, 1, 1,
-0.980255, 1.009037, 0.431955, 1, 1, 1, 1, 1,
-0.955805, 0.3211214, -0.9209985, 1, 1, 1, 1, 1,
-0.9555422, 0.6159926, -1.968504, 1, 1, 1, 1, 1,
-0.9533823, 0.2088734, -1.379363, 1, 1, 1, 1, 1,
-0.9515319, -0.5163112, -2.694221, 1, 1, 1, 1, 1,
-0.9475903, 0.1912941, -2.033249, 1, 1, 1, 1, 1,
-0.9416096, -1.228329, -4.102544, 0, 0, 1, 1, 1,
-0.9400381, 0.4029914, -0.791733, 1, 0, 0, 1, 1,
-0.9367394, -0.4501718, -0.745643, 1, 0, 0, 1, 1,
-0.9342218, 0.9137579, 0.03963563, 1, 0, 0, 1, 1,
-0.93271, 1.486982, -0.5559402, 1, 0, 0, 1, 1,
-0.9311298, 0.3912345, -1.084917, 1, 0, 0, 1, 1,
-0.9271458, -0.7364681, -2.624048, 0, 0, 0, 1, 1,
-0.9245226, -0.4523212, -1.828036, 0, 0, 0, 1, 1,
-0.9238076, -2.882031, -1.510881, 0, 0, 0, 1, 1,
-0.9228271, -1.602557, -2.622313, 0, 0, 0, 1, 1,
-0.9226645, -0.3319769, -2.638426, 0, 0, 0, 1, 1,
-0.9192721, 0.3837337, -0.7036515, 0, 0, 0, 1, 1,
-0.9149444, -0.2914932, -1.193378, 0, 0, 0, 1, 1,
-0.9109996, 0.3530748, -0.5326357, 1, 1, 1, 1, 1,
-0.9107696, -0.5710672, -2.509187, 1, 1, 1, 1, 1,
-0.9092395, 0.1048198, -1.450813, 1, 1, 1, 1, 1,
-0.9074802, -0.9462617, -2.480475, 1, 1, 1, 1, 1,
-0.899128, 0.8505552, -1.11226, 1, 1, 1, 1, 1,
-0.895504, 0.7414816, -2.533813, 1, 1, 1, 1, 1,
-0.895298, -0.2259507, -3.514324, 1, 1, 1, 1, 1,
-0.8950732, -2.485994, -3.339472, 1, 1, 1, 1, 1,
-0.8928476, 0.4130242, -0.2992072, 1, 1, 1, 1, 1,
-0.8844472, 1.013454, -1.071177, 1, 1, 1, 1, 1,
-0.8823118, 0.3413697, -2.753335, 1, 1, 1, 1, 1,
-0.8785138, -0.30987, -1.96938, 1, 1, 1, 1, 1,
-0.8769721, 2.270611, -0.1408706, 1, 1, 1, 1, 1,
-0.8756086, 0.525525, -0.3586733, 1, 1, 1, 1, 1,
-0.8704312, 0.8877049, -2.070596, 1, 1, 1, 1, 1,
-0.8678717, 0.3179427, -1.350987, 0, 0, 1, 1, 1,
-0.8673173, -0.2767026, -2.96766, 1, 0, 0, 1, 1,
-0.8671137, 0.7849277, 0.2693278, 1, 0, 0, 1, 1,
-0.862714, -2.667169, -3.664386, 1, 0, 0, 1, 1,
-0.8602068, 0.2524764, -1.097026, 1, 0, 0, 1, 1,
-0.853953, 1.940387, 0.489234, 1, 0, 0, 1, 1,
-0.8528094, 0.7749332, 0.2153129, 0, 0, 0, 1, 1,
-0.8457135, 0.4399007, -0.3715213, 0, 0, 0, 1, 1,
-0.8422552, 0.8180117, -0.4923677, 0, 0, 0, 1, 1,
-0.8419123, -0.03203094, -2.593353, 0, 0, 0, 1, 1,
-0.8383702, 1.38824, -0.3609793, 0, 0, 0, 1, 1,
-0.8358366, -0.1285234, -2.096697, 0, 0, 0, 1, 1,
-0.8342428, 1.895428, 1.190238, 0, 0, 0, 1, 1,
-0.8246038, 0.003668051, -0.988589, 1, 1, 1, 1, 1,
-0.8207872, -0.8526471, -2.242512, 1, 1, 1, 1, 1,
-0.8193485, -0.2684258, -2.964054, 1, 1, 1, 1, 1,
-0.8153659, -0.8279645, -2.104491, 1, 1, 1, 1, 1,
-0.8140442, -1.054, -1.968252, 1, 1, 1, 1, 1,
-0.8119515, 0.0316979, -0.9058823, 1, 1, 1, 1, 1,
-0.8106482, 1.918946, -1.830516, 1, 1, 1, 1, 1,
-0.8093139, 0.9094032, -0.6808633, 1, 1, 1, 1, 1,
-0.8084188, -0.06276567, -1.109447, 1, 1, 1, 1, 1,
-0.8062181, 0.4223243, -1.179154, 1, 1, 1, 1, 1,
-0.7977207, 1.309673, -0.8371993, 1, 1, 1, 1, 1,
-0.79553, -0.7270601, -4.960744, 1, 1, 1, 1, 1,
-0.792168, -0.5981558, -2.475984, 1, 1, 1, 1, 1,
-0.7867948, -0.2353214, -1.061091, 1, 1, 1, 1, 1,
-0.785082, 0.1692764, 1.045897, 1, 1, 1, 1, 1,
-0.7828635, 0.4038627, -2.587132, 0, 0, 1, 1, 1,
-0.7827467, 0.07564951, -2.029402, 1, 0, 0, 1, 1,
-0.7700727, 0.4695073, 0.005594441, 1, 0, 0, 1, 1,
-0.7617632, 0.6429285, -0.3944626, 1, 0, 0, 1, 1,
-0.7579873, 1.611357, 1.067654, 1, 0, 0, 1, 1,
-0.7507057, 0.006416105, 1.444121, 1, 0, 0, 1, 1,
-0.747975, 0.9904114, -1.298222, 0, 0, 0, 1, 1,
-0.7442657, 0.8807157, -0.2342013, 0, 0, 0, 1, 1,
-0.7392964, 0.3102971, -0.4603703, 0, 0, 0, 1, 1,
-0.7345964, 2.280816, 0.2780722, 0, 0, 0, 1, 1,
-0.7323048, 0.1846799, -1.442443, 0, 0, 0, 1, 1,
-0.7307412, 0.3265249, -1.553345, 0, 0, 0, 1, 1,
-0.7275952, 0.3984165, 0.9415033, 0, 0, 0, 1, 1,
-0.7236427, -1.139762, -3.264107, 1, 1, 1, 1, 1,
-0.7222783, 0.4338799, -2.300744, 1, 1, 1, 1, 1,
-0.7204826, 0.3933833, -0.4421689, 1, 1, 1, 1, 1,
-0.7179367, -0.8769075, -1.972208, 1, 1, 1, 1, 1,
-0.7167521, 0.06478745, -1.498304, 1, 1, 1, 1, 1,
-0.7139589, -0.5327537, -2.974632, 1, 1, 1, 1, 1,
-0.7063558, 0.5052875, 0.6058605, 1, 1, 1, 1, 1,
-0.7033242, 1.434835, -1.598767, 1, 1, 1, 1, 1,
-0.7026899, -0.7156908, -1.641117, 1, 1, 1, 1, 1,
-0.7024324, -0.5071207, -2.568655, 1, 1, 1, 1, 1,
-0.7011904, -0.59364, -2.700612, 1, 1, 1, 1, 1,
-0.6929998, 0.4524158, -0.7570936, 1, 1, 1, 1, 1,
-0.6922166, 1.187693, -0.7291405, 1, 1, 1, 1, 1,
-0.6902478, -0.8264666, -3.757701, 1, 1, 1, 1, 1,
-0.6835555, -1.172394, -3.115864, 1, 1, 1, 1, 1,
-0.6830663, 0.6113716, -0.5205035, 0, 0, 1, 1, 1,
-0.6793437, -1.176792, -2.20535, 1, 0, 0, 1, 1,
-0.6789982, -0.05840642, -1.1405, 1, 0, 0, 1, 1,
-0.6783859, -0.3840006, -1.492443, 1, 0, 0, 1, 1,
-0.6758764, 1.067357, -0.3613717, 1, 0, 0, 1, 1,
-0.6748802, -2.644979, -3.528642, 1, 0, 0, 1, 1,
-0.6716499, -0.5617092, -2.762965, 0, 0, 0, 1, 1,
-0.6646376, 0.7021195, -2.889677, 0, 0, 0, 1, 1,
-0.6618525, 0.4505253, -1.601038, 0, 0, 0, 1, 1,
-0.6567147, -0.3455354, -1.89254, 0, 0, 0, 1, 1,
-0.6562791, -1.33692, -0.9626894, 0, 0, 0, 1, 1,
-0.6562524, -0.4176333, -1.890237, 0, 0, 0, 1, 1,
-0.6520011, -0.8193663, -3.032938, 0, 0, 0, 1, 1,
-0.6501771, -1.040908, -0.6855166, 1, 1, 1, 1, 1,
-0.6342913, 0.02158899, -1.737082, 1, 1, 1, 1, 1,
-0.6326934, 1.080196, -0.9583412, 1, 1, 1, 1, 1,
-0.6320522, -0.6495432, -2.765309, 1, 1, 1, 1, 1,
-0.6213929, 0.9305314, -0.1883698, 1, 1, 1, 1, 1,
-0.6188688, 0.0108191, -2.721654, 1, 1, 1, 1, 1,
-0.6131176, 0.2325866, -2.119631, 1, 1, 1, 1, 1,
-0.6127316, -0.06086221, -2.542587, 1, 1, 1, 1, 1,
-0.6107385, 0.3258863, -1.237376, 1, 1, 1, 1, 1,
-0.6023591, -1.341567, -1.219524, 1, 1, 1, 1, 1,
-0.5947136, 1.527507, -0.784742, 1, 1, 1, 1, 1,
-0.5931212, -0.2315521, -1.602193, 1, 1, 1, 1, 1,
-0.592977, -0.07341479, 0.1536769, 1, 1, 1, 1, 1,
-0.5908993, -1.428139, -2.343762, 1, 1, 1, 1, 1,
-0.5875744, -0.3403942, -2.988688, 1, 1, 1, 1, 1,
-0.5847611, 1.042323, -0.3142985, 0, 0, 1, 1, 1,
-0.5794356, 1.434169, 1.614825, 1, 0, 0, 1, 1,
-0.579198, 0.210461, -1.333577, 1, 0, 0, 1, 1,
-0.5767412, 0.2612413, 0.008496271, 1, 0, 0, 1, 1,
-0.5744582, 0.03177037, -3.44431, 1, 0, 0, 1, 1,
-0.5730233, -1.000988, -1.37082, 1, 0, 0, 1, 1,
-0.5709277, 2.14554, 1.164844, 0, 0, 0, 1, 1,
-0.5703779, 0.06983349, 0.1845285, 0, 0, 0, 1, 1,
-0.5575744, -0.7212585, -0.4821045, 0, 0, 0, 1, 1,
-0.557124, 0.649739, -0.8063678, 0, 0, 0, 1, 1,
-0.5545707, -0.4662749, -0.9957085, 0, 0, 0, 1, 1,
-0.5443711, -1.72011, -3.714717, 0, 0, 0, 1, 1,
-0.5417952, -0.8499516, -3.262872, 0, 0, 0, 1, 1,
-0.5385077, -1.135929, -3.027865, 1, 1, 1, 1, 1,
-0.5361658, 0.2327219, -0.6825447, 1, 1, 1, 1, 1,
-0.5322621, -1.118496, -1.59262, 1, 1, 1, 1, 1,
-0.5318086, -1.872612, -2.430735, 1, 1, 1, 1, 1,
-0.5252599, -0.5718961, -4.207239, 1, 1, 1, 1, 1,
-0.5232852, -0.07826001, -3.262569, 1, 1, 1, 1, 1,
-0.5206277, -0.4585172, -4.74106, 1, 1, 1, 1, 1,
-0.5151021, 1.033853, -1.394032, 1, 1, 1, 1, 1,
-0.5124873, -1.746318, -4.250064, 1, 1, 1, 1, 1,
-0.510877, -0.8392289, -3.214506, 1, 1, 1, 1, 1,
-0.5021182, -0.667294, -2.191579, 1, 1, 1, 1, 1,
-0.5021029, -0.2253783, -0.1976525, 1, 1, 1, 1, 1,
-0.500847, -0.6570851, -3.27669, 1, 1, 1, 1, 1,
-0.4989117, 0.2327254, -1.528019, 1, 1, 1, 1, 1,
-0.498547, -0.6116033, -2.150376, 1, 1, 1, 1, 1,
-0.4937597, -0.2103366, -2.623711, 0, 0, 1, 1, 1,
-0.4855211, -0.7742044, -1.339486, 1, 0, 0, 1, 1,
-0.4828518, 0.2258901, -1.372631, 1, 0, 0, 1, 1,
-0.4808165, -1.785647, -1.660195, 1, 0, 0, 1, 1,
-0.4787135, 0.5914381, 0.2507784, 1, 0, 0, 1, 1,
-0.4776051, -1.099123, -3.083097, 1, 0, 0, 1, 1,
-0.4743541, -0.6177639, -3.258284, 0, 0, 0, 1, 1,
-0.4678356, 1.098224, 0.815491, 0, 0, 0, 1, 1,
-0.4619144, 0.848668, -1.806035, 0, 0, 0, 1, 1,
-0.4607148, 1.370793, -0.5629464, 0, 0, 0, 1, 1,
-0.4553642, -0.5005032, -3.980953, 0, 0, 0, 1, 1,
-0.4546889, 0.1431459, -0.3805627, 0, 0, 0, 1, 1,
-0.4496877, 0.4391328, -0.9613016, 0, 0, 0, 1, 1,
-0.4477626, -0.3965426, -2.870163, 1, 1, 1, 1, 1,
-0.447388, -0.1047996, -2.737824, 1, 1, 1, 1, 1,
-0.4438444, 1.991904, -0.3184214, 1, 1, 1, 1, 1,
-0.4417927, -0.5021412, -3.167025, 1, 1, 1, 1, 1,
-0.4349755, 1.630409, -1.43434, 1, 1, 1, 1, 1,
-0.4341047, -0.2780769, -1.248542, 1, 1, 1, 1, 1,
-0.4333666, -0.1340071, -4.050337, 1, 1, 1, 1, 1,
-0.4332858, -1.750064, -3.29516, 1, 1, 1, 1, 1,
-0.4314333, 0.7176352, -1.559128, 1, 1, 1, 1, 1,
-0.4310832, -0.3530555, -3.494095, 1, 1, 1, 1, 1,
-0.4302288, 0.9024323, -0.1381057, 1, 1, 1, 1, 1,
-0.4284172, 1.057679, -0.9884821, 1, 1, 1, 1, 1,
-0.4229394, 1.562286, 0.3429032, 1, 1, 1, 1, 1,
-0.4205756, 0.4419875, -0.6326346, 1, 1, 1, 1, 1,
-0.4205434, 0.1203803, -2.304458, 1, 1, 1, 1, 1,
-0.4190059, -1.149744, -1.746207, 0, 0, 1, 1, 1,
-0.3999749, 0.7339433, 0.8547918, 1, 0, 0, 1, 1,
-0.399098, -0.3490284, -1.197067, 1, 0, 0, 1, 1,
-0.3989657, 0.2529967, 0.02257295, 1, 0, 0, 1, 1,
-0.3970378, -0.02708884, -3.329454, 1, 0, 0, 1, 1,
-0.394384, 0.005122277, -1.593998, 1, 0, 0, 1, 1,
-0.3937836, -0.5907086, -2.228301, 0, 0, 0, 1, 1,
-0.3926556, -0.1645171, -1.171312, 0, 0, 0, 1, 1,
-0.3908599, 0.4780125, -2.036313, 0, 0, 0, 1, 1,
-0.390128, 0.7010965, -2.43659, 0, 0, 0, 1, 1,
-0.388254, -0.2817838, -3.5737, 0, 0, 0, 1, 1,
-0.3862452, 0.125174, -1.683747, 0, 0, 0, 1, 1,
-0.385927, 0.2912673, -1.614201, 0, 0, 0, 1, 1,
-0.3832505, -1.552906, -3.823166, 1, 1, 1, 1, 1,
-0.382754, -0.6538744, -3.166473, 1, 1, 1, 1, 1,
-0.3826341, 0.7863531, -1.580802, 1, 1, 1, 1, 1,
-0.3824916, 0.1217806, -2.975555, 1, 1, 1, 1, 1,
-0.382027, 0.05570653, -1.904489, 1, 1, 1, 1, 1,
-0.3807553, -0.3752242, -1.568651, 1, 1, 1, 1, 1,
-0.3799336, 0.4728757, 0.5610279, 1, 1, 1, 1, 1,
-0.3766859, -0.7015008, -3.528475, 1, 1, 1, 1, 1,
-0.3741806, -0.9395151, -2.38292, 1, 1, 1, 1, 1,
-0.3740924, 0.09561811, 0.06313633, 1, 1, 1, 1, 1,
-0.3731808, -0.3645642, -4.263526, 1, 1, 1, 1, 1,
-0.3724099, -0.2772095, -1.842554, 1, 1, 1, 1, 1,
-0.3677209, -0.2819944, -2.577672, 1, 1, 1, 1, 1,
-0.3669139, 0.7316908, -0.6432008, 1, 1, 1, 1, 1,
-0.3614927, 0.02016022, 0.03446091, 1, 1, 1, 1, 1,
-0.3590351, 2.154984, 0.1498885, 0, 0, 1, 1, 1,
-0.3577873, -0.394072, -2.19746, 1, 0, 0, 1, 1,
-0.3564047, 0.9120814, -0.9996238, 1, 0, 0, 1, 1,
-0.3426672, 0.7791644, -0.940339, 1, 0, 0, 1, 1,
-0.3397554, 0.8905659, 0.1321485, 1, 0, 0, 1, 1,
-0.3367608, -0.2056826, -1.789327, 1, 0, 0, 1, 1,
-0.336652, 0.8076216, -1.33549, 0, 0, 0, 1, 1,
-0.3346985, 1.01626, 0.2962136, 0, 0, 0, 1, 1,
-0.3147536, 0.8766536, 1.17263, 0, 0, 0, 1, 1,
-0.3131607, -0.512278, -2.270464, 0, 0, 0, 1, 1,
-0.3117697, 0.1458169, -2.624018, 0, 0, 0, 1, 1,
-0.3101045, 0.2088442, -0.1371484, 0, 0, 0, 1, 1,
-0.3095027, -0.09402262, -1.009544, 0, 0, 0, 1, 1,
-0.2964273, -1.219648, -2.779498, 1, 1, 1, 1, 1,
-0.2896706, 1.093539, -0.1905835, 1, 1, 1, 1, 1,
-0.2894967, -0.8205534, -3.113948, 1, 1, 1, 1, 1,
-0.2838429, 0.1999563, -2.439744, 1, 1, 1, 1, 1,
-0.283093, 1.622103, 0.3958335, 1, 1, 1, 1, 1,
-0.282025, -0.4296128, -3.478276, 1, 1, 1, 1, 1,
-0.2801126, 0.4398247, 0.95652, 1, 1, 1, 1, 1,
-0.2775329, 0.9758269, -1.3271, 1, 1, 1, 1, 1,
-0.2737747, -1.15426, -5.082294, 1, 1, 1, 1, 1,
-0.2723093, -0.6381787, -3.648917, 1, 1, 1, 1, 1,
-0.2682924, 0.9488449, 1.649637, 1, 1, 1, 1, 1,
-0.2653302, 0.4537099, -0.6011738, 1, 1, 1, 1, 1,
-0.2643543, -0.7546266, -2.243151, 1, 1, 1, 1, 1,
-0.260391, 0.3293765, -3.2983, 1, 1, 1, 1, 1,
-0.2593685, -0.07974501, -3.535511, 1, 1, 1, 1, 1,
-0.2547165, -1.128671, -3.58986, 0, 0, 1, 1, 1,
-0.2543552, -1.309434, -3.396921, 1, 0, 0, 1, 1,
-0.2537388, 0.6941317, -2.204067, 1, 0, 0, 1, 1,
-0.2536601, -2.107209, -2.356527, 1, 0, 0, 1, 1,
-0.2509261, 0.2256844, 0.9559568, 1, 0, 0, 1, 1,
-0.2405231, -2.465043, -1.080561, 1, 0, 0, 1, 1,
-0.2402272, -0.2293501, -4.223876, 0, 0, 0, 1, 1,
-0.2366369, -1.048417, -2.276113, 0, 0, 0, 1, 1,
-0.235897, 1.317996, -0.942652, 0, 0, 0, 1, 1,
-0.2357426, -1.664107, -1.826621, 0, 0, 0, 1, 1,
-0.2354796, -1.051047, -2.970459, 0, 0, 0, 1, 1,
-0.2316088, 0.5658188, -1.492399, 0, 0, 0, 1, 1,
-0.2310485, -0.5331927, -3.359754, 0, 0, 0, 1, 1,
-0.2303443, 1.122201, -0.370042, 1, 1, 1, 1, 1,
-0.2202379, -0.5531968, -2.574397, 1, 1, 1, 1, 1,
-0.2190037, -1.04284, -1.813479, 1, 1, 1, 1, 1,
-0.2120722, -0.3957642, -2.554413, 1, 1, 1, 1, 1,
-0.2116352, 0.02061027, -2.460025, 1, 1, 1, 1, 1,
-0.2113992, 0.8452853, -0.1552835, 1, 1, 1, 1, 1,
-0.2007384, -1.525836, -3.468266, 1, 1, 1, 1, 1,
-0.2005603, 1.036109, -1.998141, 1, 1, 1, 1, 1,
-0.1993932, 1.327316, 0.4294952, 1, 1, 1, 1, 1,
-0.1985459, -0.1677106, -1.301583, 1, 1, 1, 1, 1,
-0.1979124, 1.399561, 0.5835546, 1, 1, 1, 1, 1,
-0.1960236, 0.2467165, -0.7934881, 1, 1, 1, 1, 1,
-0.1938386, -1.560317, -3.182289, 1, 1, 1, 1, 1,
-0.187596, 1.328712, -0.07095052, 1, 1, 1, 1, 1,
-0.1801102, -0.2263192, -1.800283, 1, 1, 1, 1, 1,
-0.1755755, -0.2747352, -3.181644, 0, 0, 1, 1, 1,
-0.1741894, -0.7889495, -0.9367221, 1, 0, 0, 1, 1,
-0.1724082, 0.3737746, -1.577723, 1, 0, 0, 1, 1,
-0.1719265, 1.320904, -1.152647, 1, 0, 0, 1, 1,
-0.1717297, -1.416897, -4.700536, 1, 0, 0, 1, 1,
-0.1714308, 0.9769611, 0.07514063, 1, 0, 0, 1, 1,
-0.1665652, 0.9900928, 0.4254077, 0, 0, 0, 1, 1,
-0.1664047, -0.02615866, -2.184795, 0, 0, 0, 1, 1,
-0.1632197, -1.529856, -3.162675, 0, 0, 0, 1, 1,
-0.1544794, -0.8288175, -3.953755, 0, 0, 0, 1, 1,
-0.1513655, 0.8545773, 0.3574219, 0, 0, 0, 1, 1,
-0.1498951, -2.137663, -2.645473, 0, 0, 0, 1, 1,
-0.1457821, 1.044746, 1.412144, 0, 0, 0, 1, 1,
-0.1453343, -0.8528454, -4.26168, 1, 1, 1, 1, 1,
-0.1452006, -1.151259, -2.99605, 1, 1, 1, 1, 1,
-0.1421637, -1.256745, -0.7959646, 1, 1, 1, 1, 1,
-0.1387009, -2.556354, -1.858757, 1, 1, 1, 1, 1,
-0.1374592, 0.6232383, -0.9911147, 1, 1, 1, 1, 1,
-0.1374263, 1.168766, 0.6607361, 1, 1, 1, 1, 1,
-0.1348442, -1.983504, -2.606189, 1, 1, 1, 1, 1,
-0.133572, -0.3953425, -2.514238, 1, 1, 1, 1, 1,
-0.1331667, -1.448157, -3.966942, 1, 1, 1, 1, 1,
-0.130063, -0.8752027, -0.3850268, 1, 1, 1, 1, 1,
-0.1247568, -0.303998, -1.636719, 1, 1, 1, 1, 1,
-0.1221878, -0.1843011, -2.961463, 1, 1, 1, 1, 1,
-0.120555, 0.970323, -1.527162, 1, 1, 1, 1, 1,
-0.1194973, -1.297671, -3.204531, 1, 1, 1, 1, 1,
-0.1191246, 0.1413133, -1.349933, 1, 1, 1, 1, 1,
-0.1135764, -0.9963342, -3.950857, 0, 0, 1, 1, 1,
-0.1103901, 1.176926, 0.4778647, 1, 0, 0, 1, 1,
-0.1081046, 1.082024, -1.577514, 1, 0, 0, 1, 1,
-0.1019149, -0.3089555, -3.194689, 1, 0, 0, 1, 1,
-0.1000224, 1.354833, 0.2987897, 1, 0, 0, 1, 1,
-0.09996501, 0.2969928, -2.818904, 1, 0, 0, 1, 1,
-0.09855675, -1.862354, -5.0659, 0, 0, 0, 1, 1,
-0.0964649, 1.483641, 1.362719, 0, 0, 0, 1, 1,
-0.09640341, 0.7809123, -0.5668786, 0, 0, 0, 1, 1,
-0.09431914, 0.488811, 1.054743, 0, 0, 0, 1, 1,
-0.09363407, -0.3160237, -4.354692, 0, 0, 0, 1, 1,
-0.08919863, -1.827868, -2.960402, 0, 0, 0, 1, 1,
-0.08899333, 0.2677209, -0.1362863, 0, 0, 0, 1, 1,
-0.08425683, -0.1935826, -1.363008, 1, 1, 1, 1, 1,
-0.08390941, -0.09521139, -2.256322, 1, 1, 1, 1, 1,
-0.07957362, -0.3488137, -1.745146, 1, 1, 1, 1, 1,
-0.07748887, -0.3444105, -2.876746, 1, 1, 1, 1, 1,
-0.072747, 0.08160248, -3.100454, 1, 1, 1, 1, 1,
-0.06545895, 0.04974909, -1.919529, 1, 1, 1, 1, 1,
-0.06395525, 0.3502047, 0.2590351, 1, 1, 1, 1, 1,
-0.06021419, -1.191957, -2.462019, 1, 1, 1, 1, 1,
-0.05536614, 0.2975672, -0.4725174, 1, 1, 1, 1, 1,
-0.05501986, 0.8923002, 0.3607453, 1, 1, 1, 1, 1,
-0.05309829, -1.206406, -4.46849, 1, 1, 1, 1, 1,
-0.05167201, 0.8419507, 0.3383049, 1, 1, 1, 1, 1,
-0.05056177, -1.452424, -2.83635, 1, 1, 1, 1, 1,
-0.0397895, 1.151176, -1.000842, 1, 1, 1, 1, 1,
-0.03974403, -1.723034, -2.621683, 1, 1, 1, 1, 1,
-0.03761435, -1.245449, -2.988107, 0, 0, 1, 1, 1,
-0.03314447, 1.235768, -1.696618, 1, 0, 0, 1, 1,
-0.03221541, 0.3823283, -0.5357781, 1, 0, 0, 1, 1,
-0.01991166, -0.8067977, -1.580784, 1, 0, 0, 1, 1,
-0.01430963, -0.6386861, -4.19698, 1, 0, 0, 1, 1,
-0.01384615, -0.2259084, -1.416246, 1, 0, 0, 1, 1,
-0.0112449, -0.2167135, -3.674151, 0, 0, 0, 1, 1,
-0.005076128, 1.143379, -0.07029205, 0, 0, 0, 1, 1,
0.003101654, 2.143324, -0.8152385, 0, 0, 0, 1, 1,
0.006579453, -2.098109, 1.822299, 0, 0, 0, 1, 1,
0.007713734, 0.3603707, -0.6873692, 0, 0, 0, 1, 1,
0.01898265, -1.310187, 3.052652, 0, 0, 0, 1, 1,
0.0192188, 0.4872522, 0.5284377, 0, 0, 0, 1, 1,
0.022533, -0.5918692, 2.775382, 1, 1, 1, 1, 1,
0.02476087, -0.5377648, 1.471721, 1, 1, 1, 1, 1,
0.0251674, -2.482689, 2.662526, 1, 1, 1, 1, 1,
0.03174743, 0.4265842, -0.3633563, 1, 1, 1, 1, 1,
0.03220743, -0.6467378, 3.454441, 1, 1, 1, 1, 1,
0.03662421, -0.749971, 3.729421, 1, 1, 1, 1, 1,
0.04403381, 0.5776751, 1.287025, 1, 1, 1, 1, 1,
0.04730818, -0.6001806, 2.226645, 1, 1, 1, 1, 1,
0.05330053, -0.7658979, 2.937064, 1, 1, 1, 1, 1,
0.05379089, 1.274749, -0.4971642, 1, 1, 1, 1, 1,
0.05632808, -0.6555652, 2.505532, 1, 1, 1, 1, 1,
0.05707377, -0.7173154, 3.988606, 1, 1, 1, 1, 1,
0.05772195, -2.456404, 2.195326, 1, 1, 1, 1, 1,
0.05827593, -0.1348903, 4.304969, 1, 1, 1, 1, 1,
0.05852862, -0.7485749, 3.274909, 1, 1, 1, 1, 1,
0.06193404, -0.1529816, 2.706088, 0, 0, 1, 1, 1,
0.06571575, 0.09925824, 0.683641, 1, 0, 0, 1, 1,
0.07239627, -0.61224, 3.011262, 1, 0, 0, 1, 1,
0.0727675, 0.3384373, -1.001849, 1, 0, 0, 1, 1,
0.07450453, -0.3972822, 1.563396, 1, 0, 0, 1, 1,
0.07692156, -1.233595, 2.738885, 1, 0, 0, 1, 1,
0.07822394, -0.09904373, 1.986292, 0, 0, 0, 1, 1,
0.07887891, 0.4847774, 0.1232361, 0, 0, 0, 1, 1,
0.08124533, 0.4384951, -0.03305803, 0, 0, 0, 1, 1,
0.08141057, -0.06072772, 2.953251, 0, 0, 0, 1, 1,
0.08668476, 1.893802, -0.3101421, 0, 0, 0, 1, 1,
0.08708242, 0.3969556, 0.8481353, 0, 0, 0, 1, 1,
0.08837616, 0.4105341, 1.538113, 0, 0, 0, 1, 1,
0.08957521, -0.3003285, 3.373341, 1, 1, 1, 1, 1,
0.09241521, -0.9967719, 2.098122, 1, 1, 1, 1, 1,
0.09517931, -0.8944975, 3.563525, 1, 1, 1, 1, 1,
0.09547686, -0.4427814, 3.227423, 1, 1, 1, 1, 1,
0.1007576, 0.4106209, 0.3375702, 1, 1, 1, 1, 1,
0.1015557, -0.6443543, 3.780744, 1, 1, 1, 1, 1,
0.102216, -0.9996477, 1.405096, 1, 1, 1, 1, 1,
0.1044226, -1.33842, 2.110376, 1, 1, 1, 1, 1,
0.1095629, -0.1880882, 3.561104, 1, 1, 1, 1, 1,
0.1111373, -0.9935634, 3.556079, 1, 1, 1, 1, 1,
0.1111605, -1.957097, 3.480922, 1, 1, 1, 1, 1,
0.1129097, -0.7114893, 1.445737, 1, 1, 1, 1, 1,
0.1144912, -1.338403, 2.182963, 1, 1, 1, 1, 1,
0.1145943, 0.8499128, -0.08321192, 1, 1, 1, 1, 1,
0.1149783, 0.2711874, 1.670101, 1, 1, 1, 1, 1,
0.1198036, -0.5303171, 4.128769, 0, 0, 1, 1, 1,
0.1247027, -0.9888434, 2.493134, 1, 0, 0, 1, 1,
0.1276274, 0.4887823, -0.6607403, 1, 0, 0, 1, 1,
0.1284906, -0.490477, 1.761268, 1, 0, 0, 1, 1,
0.1289342, 0.06603768, 1.668703, 1, 0, 0, 1, 1,
0.1318519, 0.9724137, 2.696003, 1, 0, 0, 1, 1,
0.1319239, -0.5306632, 3.378453, 0, 0, 0, 1, 1,
0.1362124, 0.4932187, -0.3516931, 0, 0, 0, 1, 1,
0.1380689, 0.7142017, -0.606627, 0, 0, 0, 1, 1,
0.1384784, 1.838049, 0.6910568, 0, 0, 0, 1, 1,
0.1417736, 0.3014905, 0.6049799, 0, 0, 0, 1, 1,
0.1443417, -1.773215, 2.546556, 0, 0, 0, 1, 1,
0.1504925, -0.8393332, 3.529695, 0, 0, 0, 1, 1,
0.1514997, 0.1417675, 2.068341, 1, 1, 1, 1, 1,
0.1516282, -0.05222717, 3.331781, 1, 1, 1, 1, 1,
0.1557823, 0.9786359, -1.108709, 1, 1, 1, 1, 1,
0.157732, 0.05397934, 0.9737329, 1, 1, 1, 1, 1,
0.159532, 0.6223599, -0.302399, 1, 1, 1, 1, 1,
0.162137, 0.8684342, -0.387128, 1, 1, 1, 1, 1,
0.1637522, -0.5153663, 1.329905, 1, 1, 1, 1, 1,
0.1675229, 0.4549803, 0.54005, 1, 1, 1, 1, 1,
0.1691238, -0.03754409, 2.144849, 1, 1, 1, 1, 1,
0.174472, -1.772225, 3.163082, 1, 1, 1, 1, 1,
0.1750148, -1.686464, 2.186478, 1, 1, 1, 1, 1,
0.1754246, 1.377089, -0.2318297, 1, 1, 1, 1, 1,
0.1791304, 1.815362, -1.522954, 1, 1, 1, 1, 1,
0.1799082, 1.655483, -0.7433885, 1, 1, 1, 1, 1,
0.1805362, 0.2002488, 2.130918, 1, 1, 1, 1, 1,
0.1808611, 0.08947797, 1.700228, 0, 0, 1, 1, 1,
0.18202, -0.8305601, 3.940992, 1, 0, 0, 1, 1,
0.1830126, 0.2462373, 0.9256603, 1, 0, 0, 1, 1,
0.1866588, -0.1315086, 1.802932, 1, 0, 0, 1, 1,
0.1878992, -0.02662936, 1.220491, 1, 0, 0, 1, 1,
0.187938, 0.6814671, 1.039456, 1, 0, 0, 1, 1,
0.1897194, -0.6969984, 2.509657, 0, 0, 0, 1, 1,
0.1917995, -2.519059, 2.593851, 0, 0, 0, 1, 1,
0.1936733, -0.07131078, 2.449642, 0, 0, 0, 1, 1,
0.1943155, -0.4576005, 2.21763, 0, 0, 0, 1, 1,
0.1944461, 0.5048296, -1.797023, 0, 0, 0, 1, 1,
0.1948096, -0.5382547, 1.528742, 0, 0, 0, 1, 1,
0.2016909, -0.5650854, 2.261638, 0, 0, 0, 1, 1,
0.2091553, 1.566935, 0.5013017, 1, 1, 1, 1, 1,
0.2122886, 0.05060674, 2.471159, 1, 1, 1, 1, 1,
0.2143665, -0.4776236, 2.065721, 1, 1, 1, 1, 1,
0.2155347, -0.1588434, 2.879624, 1, 1, 1, 1, 1,
0.2166431, -0.8895338, 2.873865, 1, 1, 1, 1, 1,
0.2242752, 0.06396795, 1.499786, 1, 1, 1, 1, 1,
0.2255678, -0.5271446, 2.780711, 1, 1, 1, 1, 1,
0.2271959, -1.742942, 2.852654, 1, 1, 1, 1, 1,
0.2312243, -1.338919, 2.349639, 1, 1, 1, 1, 1,
0.2338514, 0.4362676, -0.4305052, 1, 1, 1, 1, 1,
0.2358388, -0.8852146, 3.141801, 1, 1, 1, 1, 1,
0.239529, 0.8289973, 0.4873603, 1, 1, 1, 1, 1,
0.239711, 1.921237, 0.0765797, 1, 1, 1, 1, 1,
0.2399734, 0.7981914, -1.215914, 1, 1, 1, 1, 1,
0.2441655, -1.217884, 0.7733464, 1, 1, 1, 1, 1,
0.2442416, -1.995048, 5.031636, 0, 0, 1, 1, 1,
0.2467001, -0.9471111, 3.750319, 1, 0, 0, 1, 1,
0.2467721, -1.038671, 0.7451494, 1, 0, 0, 1, 1,
0.2477286, -0.7145005, 2.826026, 1, 0, 0, 1, 1,
0.2480913, 0.1128533, 0.2776076, 1, 0, 0, 1, 1,
0.2484562, 0.3241519, -0.4448043, 1, 0, 0, 1, 1,
0.2498634, 0.3320025, -0.5702851, 0, 0, 0, 1, 1,
0.2514392, 1.103387, -0.3680494, 0, 0, 0, 1, 1,
0.2590255, 0.8666632, -0.3474277, 0, 0, 0, 1, 1,
0.2610056, 0.1956333, 1.166744, 0, 0, 0, 1, 1,
0.2612051, 0.2791258, 1.304583, 0, 0, 0, 1, 1,
0.2641151, -0.5060307, 2.24315, 0, 0, 0, 1, 1,
0.2705737, -1.32173, 4.354812, 0, 0, 0, 1, 1,
0.2736611, -1.488808, 2.391054, 1, 1, 1, 1, 1,
0.2780297, -1.639793, 2.25042, 1, 1, 1, 1, 1,
0.2827342, -0.3392482, 2.673986, 1, 1, 1, 1, 1,
0.2841724, 0.215309, 0.5882552, 1, 1, 1, 1, 1,
0.2874008, -1.161864, 3.532717, 1, 1, 1, 1, 1,
0.2902557, -0.5119489, 2.244613, 1, 1, 1, 1, 1,
0.2970432, -1.362586, 2.566464, 1, 1, 1, 1, 1,
0.2991142, 0.3137155, 0.4140841, 1, 1, 1, 1, 1,
0.3020624, 0.2235267, 1.251002, 1, 1, 1, 1, 1,
0.3021691, 0.5132226, 1.121434, 1, 1, 1, 1, 1,
0.3045801, 0.1242025, 0.2108823, 1, 1, 1, 1, 1,
0.3069557, -1.172377, 5.656078, 1, 1, 1, 1, 1,
0.3076973, -0.07897262, 2.00751, 1, 1, 1, 1, 1,
0.3095602, 0.2462716, 0.9573603, 1, 1, 1, 1, 1,
0.3149756, -1.079197, 1.195386, 1, 1, 1, 1, 1,
0.3163218, 0.127207, 1.793185, 0, 0, 1, 1, 1,
0.3221091, 0.08955273, 1.018187, 1, 0, 0, 1, 1,
0.3252172, -0.1196778, 1.682955, 1, 0, 0, 1, 1,
0.327208, 0.6444375, -0.5351483, 1, 0, 0, 1, 1,
0.3287292, -0.1490785, 1.02698, 1, 0, 0, 1, 1,
0.3295512, -0.1297711, 1.353801, 1, 0, 0, 1, 1,
0.3308355, -2.127234, 1.680373, 0, 0, 0, 1, 1,
0.339374, -0.5949401, 3.388522, 0, 0, 0, 1, 1,
0.3395869, -0.6788625, 3.593791, 0, 0, 0, 1, 1,
0.3397607, 0.9101617, 0.215825, 0, 0, 0, 1, 1,
0.3508606, -0.4468909, 1.358897, 0, 0, 0, 1, 1,
0.357275, 0.8449211, 0.6870737, 0, 0, 0, 1, 1,
0.3599199, 1.201803, 2.21517, 0, 0, 0, 1, 1,
0.3601313, 0.6671903, -1.293736, 1, 1, 1, 1, 1,
0.3622651, -0.8551018, 1.998108, 1, 1, 1, 1, 1,
0.3658594, -0.1715344, 0.9381078, 1, 1, 1, 1, 1,
0.3664786, -0.6256875, 2.648099, 1, 1, 1, 1, 1,
0.3703353, -0.6297686, 2.141966, 1, 1, 1, 1, 1,
0.3709989, 2.058402, -0.8247989, 1, 1, 1, 1, 1,
0.3713751, -1.179121, 3.247584, 1, 1, 1, 1, 1,
0.3720188, -0.02160004, 2.371902, 1, 1, 1, 1, 1,
0.3745451, 1.089364, -0.07460802, 1, 1, 1, 1, 1,
0.3794686, 0.1786689, 2.019302, 1, 1, 1, 1, 1,
0.3801581, -1.233257, 2.815097, 1, 1, 1, 1, 1,
0.3815233, -1.058875, 2.501606, 1, 1, 1, 1, 1,
0.3816921, -0.3672821, 2.420686, 1, 1, 1, 1, 1,
0.381942, 0.7697126, -2.075452, 1, 1, 1, 1, 1,
0.3855207, -0.5306395, 2.323932, 1, 1, 1, 1, 1,
0.3893595, -1.008428, 3.386822, 0, 0, 1, 1, 1,
0.3924959, 0.6515847, -1.381418, 1, 0, 0, 1, 1,
0.3932785, -0.9358426, 1.983535, 1, 0, 0, 1, 1,
0.4005421, 1.902396, 1.854836, 1, 0, 0, 1, 1,
0.4005716, -0.6138089, 2.264321, 1, 0, 0, 1, 1,
0.4023678, 0.3407221, -1.34986, 1, 0, 0, 1, 1,
0.4075411, -0.4549405, 0.7983651, 0, 0, 0, 1, 1,
0.4103347, 1.086082, 0.2694176, 0, 0, 0, 1, 1,
0.4105667, 1.940999, 0.7652416, 0, 0, 0, 1, 1,
0.4114312, -1.469417, 2.801368, 0, 0, 0, 1, 1,
0.4140857, 0.1688983, 1.493274, 0, 0, 0, 1, 1,
0.4149163, 1.688262, 1.346611, 0, 0, 0, 1, 1,
0.4180622, -2.508434, 2.426218, 0, 0, 0, 1, 1,
0.4184738, 0.06962769, 2.391443, 1, 1, 1, 1, 1,
0.4270941, -0.4338984, 2.168625, 1, 1, 1, 1, 1,
0.4335063, 0.2476531, 0.5122796, 1, 1, 1, 1, 1,
0.4344499, 0.7450132, 2.119107, 1, 1, 1, 1, 1,
0.4367497, 0.8723364, -0.7797961, 1, 1, 1, 1, 1,
0.4367816, -0.237387, 0.2357753, 1, 1, 1, 1, 1,
0.4371444, -1.394322, 1.87854, 1, 1, 1, 1, 1,
0.4406509, 1.282226, -0.6719636, 1, 1, 1, 1, 1,
0.4413641, -0.5781829, 3.734808, 1, 1, 1, 1, 1,
0.4489518, 0.2937376, 0.6604717, 1, 1, 1, 1, 1,
0.4532757, 0.7152261, 1.732411, 1, 1, 1, 1, 1,
0.4544418, -1.062289, 2.899297, 1, 1, 1, 1, 1,
0.4556731, 1.451333, -1.763692, 1, 1, 1, 1, 1,
0.4557118, 0.4947189, 0.7948673, 1, 1, 1, 1, 1,
0.4584369, 1.319245, -0.4300611, 1, 1, 1, 1, 1,
0.4621073, 1.336928, 1.131191, 0, 0, 1, 1, 1,
0.4629816, 0.5559722, -0.2602606, 1, 0, 0, 1, 1,
0.4634123, -0.336885, 1.841248, 1, 0, 0, 1, 1,
0.4643343, 1.024283, 0.470816, 1, 0, 0, 1, 1,
0.4719037, 1.267791, 0.4655533, 1, 0, 0, 1, 1,
0.4816, -0.2675292, 2.052087, 1, 0, 0, 1, 1,
0.4859049, -0.8041127, 2.141093, 0, 0, 0, 1, 1,
0.4868108, -0.7637436, 5.152534, 0, 0, 0, 1, 1,
0.48749, -1.292348, 2.253765, 0, 0, 0, 1, 1,
0.4908134, -0.5359735, 2.11988, 0, 0, 0, 1, 1,
0.4931221, -0.03424079, 0.6488451, 0, 0, 0, 1, 1,
0.4944759, 0.280622, 0.2522163, 0, 0, 0, 1, 1,
0.49482, -0.1377546, 4.131651, 0, 0, 0, 1, 1,
0.4966485, -0.2055481, 1.559252, 1, 1, 1, 1, 1,
0.4986735, 0.5427442, 0.579108, 1, 1, 1, 1, 1,
0.5015611, 0.6863426, 0.6313506, 1, 1, 1, 1, 1,
0.5080025, -0.2532032, 2.450596, 1, 1, 1, 1, 1,
0.5106665, -0.6747766, 2.53673, 1, 1, 1, 1, 1,
0.5199696, 0.4598885, -0.148353, 1, 1, 1, 1, 1,
0.5248046, 0.02389907, 1.441196, 1, 1, 1, 1, 1,
0.5281492, 0.1053741, 1.381846, 1, 1, 1, 1, 1,
0.530288, 0.7117843, 0.245242, 1, 1, 1, 1, 1,
0.5329726, 0.7967474, 1.982034, 1, 1, 1, 1, 1,
0.5427507, -0.5968119, 2.946765, 1, 1, 1, 1, 1,
0.547071, -1.626998, 1.447417, 1, 1, 1, 1, 1,
0.5470723, -0.7216973, 0.69358, 1, 1, 1, 1, 1,
0.550883, 0.4527052, 1.279645, 1, 1, 1, 1, 1,
0.5509617, 0.854358, -0.08595847, 1, 1, 1, 1, 1,
0.5510215, -0.8076675, 0.5170076, 0, 0, 1, 1, 1,
0.5566363, 1.240187, 0.6687222, 1, 0, 0, 1, 1,
0.5604167, 0.8844065, 0.3978328, 1, 0, 0, 1, 1,
0.5608196, 0.310648, 1.229148, 1, 0, 0, 1, 1,
0.564484, -0.03043083, 3.724774, 1, 0, 0, 1, 1,
0.5648392, -0.04096026, 1.486876, 1, 0, 0, 1, 1,
0.5694948, -0.4978482, 2.287705, 0, 0, 0, 1, 1,
0.5771101, 0.6513126, -0.2995118, 0, 0, 0, 1, 1,
0.5777172, -0.3025963, 1.748819, 0, 0, 0, 1, 1,
0.5789078, -0.8835624, 4.412201, 0, 0, 0, 1, 1,
0.5796345, -1.541193, 1.285754, 0, 0, 0, 1, 1,
0.580175, 0.1846259, 2.583194, 0, 0, 0, 1, 1,
0.5892371, -0.3058572, 3.222482, 0, 0, 0, 1, 1,
0.5902686, -0.4881608, 1.593987, 1, 1, 1, 1, 1,
0.5904068, -0.2618932, 2.928591, 1, 1, 1, 1, 1,
0.5924639, -0.4087452, 2.262441, 1, 1, 1, 1, 1,
0.5929481, 1.035697, 0.2218613, 1, 1, 1, 1, 1,
0.5942506, -1.603493, 3.514316, 1, 1, 1, 1, 1,
0.595997, -0.8772653, 1.143458, 1, 1, 1, 1, 1,
0.5970157, -1.333067, 2.323248, 1, 1, 1, 1, 1,
0.6033784, -0.03632061, 1.888202, 1, 1, 1, 1, 1,
0.6038424, -1.478702, 2.931406, 1, 1, 1, 1, 1,
0.6075426, -0.03340026, 0.7860473, 1, 1, 1, 1, 1,
0.6165562, 0.1999199, 3.64086, 1, 1, 1, 1, 1,
0.6226415, -0.5786815, 2.367405, 1, 1, 1, 1, 1,
0.6314566, 0.02325539, 3.046563, 1, 1, 1, 1, 1,
0.6322819, 1.102601, -0.4989358, 1, 1, 1, 1, 1,
0.6346982, 0.5363526, 1.154513, 1, 1, 1, 1, 1,
0.6357033, -0.2565159, 2.626068, 0, 0, 1, 1, 1,
0.6389793, 0.5318224, -0.1553014, 1, 0, 0, 1, 1,
0.6402038, -0.2688794, 3.369548, 1, 0, 0, 1, 1,
0.6447318, -1.301206, 3.530278, 1, 0, 0, 1, 1,
0.64855, -0.3455565, 1.503025, 1, 0, 0, 1, 1,
0.6498021, 1.12932, 0.07371555, 1, 0, 0, 1, 1,
0.6569895, -0.4830151, 1.124538, 0, 0, 0, 1, 1,
0.6585259, 0.9402481, 0.09661983, 0, 0, 0, 1, 1,
0.6595691, -1.679171, 1.385544, 0, 0, 0, 1, 1,
0.6609111, -0.2132986, 2.41615, 0, 0, 0, 1, 1,
0.6619459, 0.5288132, 2.548889, 0, 0, 0, 1, 1,
0.6656151, -1.170099, 2.530125, 0, 0, 0, 1, 1,
0.679248, 0.09639697, 1.032604, 0, 0, 0, 1, 1,
0.6833243, -0.9275893, 3.394796, 1, 1, 1, 1, 1,
0.6864219, 0.795137, 1.891649, 1, 1, 1, 1, 1,
0.6896549, 1.192284, 0.4253979, 1, 1, 1, 1, 1,
0.6954333, -0.0634873, 1.459544, 1, 1, 1, 1, 1,
0.6979848, -0.1350864, 1.199427, 1, 1, 1, 1, 1,
0.7004066, 0.5405598, 0.9057414, 1, 1, 1, 1, 1,
0.7041733, 0.8437826, 2.031891, 1, 1, 1, 1, 1,
0.7090258, -0.4958842, 3.119559, 1, 1, 1, 1, 1,
0.710264, 0.2411971, 3.403212, 1, 1, 1, 1, 1,
0.7138434, 1.105006, 1.50001, 1, 1, 1, 1, 1,
0.7170473, -0.863524, 2.834396, 1, 1, 1, 1, 1,
0.7174935, 0.1822153, -0.04964066, 1, 1, 1, 1, 1,
0.7184064, 0.2640095, 1.60075, 1, 1, 1, 1, 1,
0.7221912, -1.12925, 2.647431, 1, 1, 1, 1, 1,
0.7240441, -1.25967, 2.781279, 1, 1, 1, 1, 1,
0.7286503, 0.9129577, 1.456155, 0, 0, 1, 1, 1,
0.7291867, -0.3794039, 2.500258, 1, 0, 0, 1, 1,
0.7356626, 0.04358279, 2.45087, 1, 0, 0, 1, 1,
0.7360765, -0.3979065, 1.408421, 1, 0, 0, 1, 1,
0.7439092, 1.240665, 0.9072319, 1, 0, 0, 1, 1,
0.747371, 0.2571186, 0.4532271, 1, 0, 0, 1, 1,
0.7554311, -1.756927, 3.586846, 0, 0, 0, 1, 1,
0.7559878, -1.256782, 1.741153, 0, 0, 0, 1, 1,
0.7560771, 1.031158, -0.03744859, 0, 0, 0, 1, 1,
0.7663834, 0.49981, 1.861328, 0, 0, 0, 1, 1,
0.7686133, 0.4476891, 2.115861, 0, 0, 0, 1, 1,
0.7785017, -0.8149906, 3.023642, 0, 0, 0, 1, 1,
0.7797856, -0.3559944, 1.474752, 0, 0, 0, 1, 1,
0.7961333, 0.1756344, 1.36076, 1, 1, 1, 1, 1,
0.7968351, -0.1930305, 2.29519, 1, 1, 1, 1, 1,
0.7974958, 0.545203, 1.3558, 1, 1, 1, 1, 1,
0.7981101, -1.343678, 0.9529145, 1, 1, 1, 1, 1,
0.8003083, 0.6099802, 2.241097, 1, 1, 1, 1, 1,
0.8011092, 0.4251376, -0.3910783, 1, 1, 1, 1, 1,
0.8022022, 0.4598651, 0.7015097, 1, 1, 1, 1, 1,
0.8047373, 0.9006446, 0.3777418, 1, 1, 1, 1, 1,
0.8054608, 0.07151949, 1.83899, 1, 1, 1, 1, 1,
0.8062787, 1.022535, -0.06148315, 1, 1, 1, 1, 1,
0.8069783, -0.06354518, 1.894951, 1, 1, 1, 1, 1,
0.8084412, -0.4843283, 2.195987, 1, 1, 1, 1, 1,
0.8099088, 0.5554395, 2.017727, 1, 1, 1, 1, 1,
0.810002, 0.6629025, -1.430221, 1, 1, 1, 1, 1,
0.8105278, -0.9816839, 3.423855, 1, 1, 1, 1, 1,
0.8109095, -0.006247369, 3.250541, 0, 0, 1, 1, 1,
0.8145549, 0.3730735, 0.5917157, 1, 0, 0, 1, 1,
0.8209025, 1.577121, 0.9581768, 1, 0, 0, 1, 1,
0.8245595, 0.6272171, 1.177233, 1, 0, 0, 1, 1,
0.8267683, -1.484902, 3.687629, 1, 0, 0, 1, 1,
0.8300947, 0.3805315, 1.04661, 1, 0, 0, 1, 1,
0.8415032, -1.622411, 4.512453, 0, 0, 0, 1, 1,
0.846312, -0.5328631, 1.875061, 0, 0, 0, 1, 1,
0.84648, -0.03967678, 3.217718, 0, 0, 0, 1, 1,
0.8470245, -0.446958, 1.208794, 0, 0, 0, 1, 1,
0.8477699, 1.934614, 0.6090657, 0, 0, 0, 1, 1,
0.8526317, -0.7870178, 2.352822, 0, 0, 0, 1, 1,
0.8529575, 0.28494, 2.930866, 0, 0, 0, 1, 1,
0.8640714, -1.119992, 1.711249, 1, 1, 1, 1, 1,
0.8667861, 0.9858561, -0.2923105, 1, 1, 1, 1, 1,
0.8679975, 0.459519, 2.274129, 1, 1, 1, 1, 1,
0.8694465, -1.397408, 4.401134, 1, 1, 1, 1, 1,
0.8696945, -0.05399639, 2.313873, 1, 1, 1, 1, 1,
0.8712451, 0.006078475, 2.66447, 1, 1, 1, 1, 1,
0.8747815, -1.269553, 0.8684494, 1, 1, 1, 1, 1,
0.8768104, 0.4741821, 2.0574, 1, 1, 1, 1, 1,
0.8777905, -0.3614858, 2.659107, 1, 1, 1, 1, 1,
0.8808451, -1.65081, 1.045544, 1, 1, 1, 1, 1,
0.8860826, -1.282317, 4.234176, 1, 1, 1, 1, 1,
0.8872844, -1.107064, 2.275239, 1, 1, 1, 1, 1,
0.8910653, 0.2973371, 0.960008, 1, 1, 1, 1, 1,
0.8912988, -0.68792, 2.451915, 1, 1, 1, 1, 1,
0.8966942, 0.2654045, 1.352149, 1, 1, 1, 1, 1,
0.8968276, 0.3428794, -0.7273421, 0, 0, 1, 1, 1,
0.8986638, -0.1449966, 0.458162, 1, 0, 0, 1, 1,
0.9119069, 0.8658769, 0.4267882, 1, 0, 0, 1, 1,
0.9127051, -0.4239895, 1.317419, 1, 0, 0, 1, 1,
0.9192119, 0.266593, 1.623195, 1, 0, 0, 1, 1,
0.9199671, -1.847475, 2.412857, 1, 0, 0, 1, 1,
0.9214898, -0.545724, 2.454591, 0, 0, 0, 1, 1,
0.9282844, 0.1305074, 1.287615, 0, 0, 0, 1, 1,
0.9308344, 2.443771, 1.410114, 0, 0, 0, 1, 1,
0.9326508, -0.3630886, 1.293596, 0, 0, 0, 1, 1,
0.9358681, 1.228426, 0.3134397, 0, 0, 0, 1, 1,
0.9363669, 0.07389806, 1.003176, 0, 0, 0, 1, 1,
0.9414634, -2.21449, 2.675327, 0, 0, 0, 1, 1,
0.9549002, 0.2870885, 2.723343, 1, 1, 1, 1, 1,
0.9549066, -2.144516, 3.138754, 1, 1, 1, 1, 1,
0.9609996, 0.02537685, 1.371191, 1, 1, 1, 1, 1,
0.9611824, 0.2272631, 2.22781, 1, 1, 1, 1, 1,
0.9672875, 1.124016, 1.834993, 1, 1, 1, 1, 1,
0.9760309, -0.5692223, 0.8312801, 1, 1, 1, 1, 1,
0.9795155, 1.423626, 0.7134312, 1, 1, 1, 1, 1,
0.9865699, 0.46004, 2.674136, 1, 1, 1, 1, 1,
0.9869132, -0.5308309, 2.33909, 1, 1, 1, 1, 1,
0.9928803, -0.7527508, 0.770762, 1, 1, 1, 1, 1,
0.9948374, 0.811096, -0.8109761, 1, 1, 1, 1, 1,
0.9965335, 1.665572, -1.550405, 1, 1, 1, 1, 1,
0.9967891, -0.61154, 1.563341, 1, 1, 1, 1, 1,
0.9971444, -1.764338, 2.377483, 1, 1, 1, 1, 1,
0.9985923, -0.7279176, 2.655794, 1, 1, 1, 1, 1,
1.003194, 0.04433679, 2.64648, 0, 0, 1, 1, 1,
1.004144, -0.3500484, 2.84251, 1, 0, 0, 1, 1,
1.007798, -0.673304, 3.01492, 1, 0, 0, 1, 1,
1.009654, -2.404988, 4.626161, 1, 0, 0, 1, 1,
1.010016, -0.2868776, 0.2434117, 1, 0, 0, 1, 1,
1.010185, 0.5786222, 2.814722, 1, 0, 0, 1, 1,
1.01058, -0.6852192, 1.924714, 0, 0, 0, 1, 1,
1.012588, -0.08049886, 0.2043654, 0, 0, 0, 1, 1,
1.012921, -0.9449483, 3.794627, 0, 0, 0, 1, 1,
1.019763, -0.9952396, 2.731889, 0, 0, 0, 1, 1,
1.022078, 0.4469497, 0.5872901, 0, 0, 0, 1, 1,
1.025857, 0.3120432, 0.8709135, 0, 0, 0, 1, 1,
1.032751, 0.1917471, 1.75682, 0, 0, 0, 1, 1,
1.036196, -0.2032751, 4.199217, 1, 1, 1, 1, 1,
1.037538, -1.188489, 3.340927, 1, 1, 1, 1, 1,
1.04735, -0.0298731, 3.655397, 1, 1, 1, 1, 1,
1.048331, -0.821256, 2.643718, 1, 1, 1, 1, 1,
1.053121, 1.280467, 1.155116, 1, 1, 1, 1, 1,
1.062344, 0.05238777, 1.762512, 1, 1, 1, 1, 1,
1.06268, 0.1393551, 0.7861334, 1, 1, 1, 1, 1,
1.066289, 0.3078727, 1.039513, 1, 1, 1, 1, 1,
1.069284, 1.175342, 0.04392153, 1, 1, 1, 1, 1,
1.080324, 1.430828, 0.7013476, 1, 1, 1, 1, 1,
1.081856, 0.4326464, 2.197291, 1, 1, 1, 1, 1,
1.094323, -1.954983, 2.556825, 1, 1, 1, 1, 1,
1.095414, -1.593156, 1.601296, 1, 1, 1, 1, 1,
1.100119, -1.0695, 4.256251, 1, 1, 1, 1, 1,
1.105259, -0.07509445, 2.251693, 1, 1, 1, 1, 1,
1.108122, 0.1154817, 2.08777, 0, 0, 1, 1, 1,
1.110085, -0.07305928, 0.1067893, 1, 0, 0, 1, 1,
1.111212, 0.7236107, 0.7498738, 1, 0, 0, 1, 1,
1.115924, -0.7518085, 1.492385, 1, 0, 0, 1, 1,
1.117865, 0.0508675, 2.383728, 1, 0, 0, 1, 1,
1.119724, 1.122503, -0.1494681, 1, 0, 0, 1, 1,
1.120225, -1.343774, 2.795166, 0, 0, 0, 1, 1,
1.121937, 0.6989462, 1.944474, 0, 0, 0, 1, 1,
1.12717, -1.830428, 1.753153, 0, 0, 0, 1, 1,
1.133114, 0.2352454, -0.5676857, 0, 0, 0, 1, 1,
1.144003, -0.8133484, 3.771265, 0, 0, 0, 1, 1,
1.150142, -0.02671544, 0.1938243, 0, 0, 0, 1, 1,
1.154962, -1.179931, 2.421835, 0, 0, 0, 1, 1,
1.156971, -0.6243965, 3.147727, 1, 1, 1, 1, 1,
1.159891, -1.027978, 1.1108, 1, 1, 1, 1, 1,
1.160304, -0.3712996, 0.912998, 1, 1, 1, 1, 1,
1.161584, -0.4478037, 0.4652573, 1, 1, 1, 1, 1,
1.1625, 0.1127531, 0.8198686, 1, 1, 1, 1, 1,
1.162621, -0.08606242, 0.6978512, 1, 1, 1, 1, 1,
1.168243, -1.132772, 2.1801, 1, 1, 1, 1, 1,
1.177742, 1.080207, 1.393186, 1, 1, 1, 1, 1,
1.179408, 0.3663285, 0.4329619, 1, 1, 1, 1, 1,
1.185846, 1.011077, 0.8869777, 1, 1, 1, 1, 1,
1.190636, 0.3269309, 1.460997, 1, 1, 1, 1, 1,
1.202039, 0.4678551, 1.168445, 1, 1, 1, 1, 1,
1.204061, -0.5069364, 2.952755, 1, 1, 1, 1, 1,
1.204846, -0.3749487, 2.212937, 1, 1, 1, 1, 1,
1.20649, -0.4135391, 1.137309, 1, 1, 1, 1, 1,
1.21706, -2.319575, 1.070041, 0, 0, 1, 1, 1,
1.234956, 0.3502145, -0.852895, 1, 0, 0, 1, 1,
1.238133, -0.695155, 1.112379, 1, 0, 0, 1, 1,
1.244205, -1.563383, 0.777289, 1, 0, 0, 1, 1,
1.24766, 0.03706396, 1.16544, 1, 0, 0, 1, 1,
1.253211, 1.647552, -0.831692, 1, 0, 0, 1, 1,
1.257295, 0.2113083, -0.538471, 0, 0, 0, 1, 1,
1.260997, -1.584751, 3.775496, 0, 0, 0, 1, 1,
1.261491, 0.7039872, 1.757519, 0, 0, 0, 1, 1,
1.262503, -2.258689, 2.894592, 0, 0, 0, 1, 1,
1.268996, 0.6693997, 2.097799, 0, 0, 0, 1, 1,
1.272593, 0.4989164, 0.6400723, 0, 0, 0, 1, 1,
1.290476, -0.3804253, -0.2601284, 0, 0, 0, 1, 1,
1.291087, -0.4269829, 2.213121, 1, 1, 1, 1, 1,
1.297608, -0.3531294, 1.449421, 1, 1, 1, 1, 1,
1.300943, 0.9742713, 0.9366672, 1, 1, 1, 1, 1,
1.305087, 0.461134, 2.408757, 1, 1, 1, 1, 1,
1.310329, 0.2256446, 3.922084, 1, 1, 1, 1, 1,
1.34193, 1.17617, 0.3863902, 1, 1, 1, 1, 1,
1.344691, 0.1983016, 1.24676, 1, 1, 1, 1, 1,
1.353385, 1.22463, 1.837191, 1, 1, 1, 1, 1,
1.354968, 1.147175, 0.3247181, 1, 1, 1, 1, 1,
1.355375, 0.4141284, 2.382821, 1, 1, 1, 1, 1,
1.358122, -0.2099184, 2.05088, 1, 1, 1, 1, 1,
1.369713, 0.2691878, 2.073884, 1, 1, 1, 1, 1,
1.373149, -1.404468, 1.486855, 1, 1, 1, 1, 1,
1.392557, 0.6883413, 1.925683, 1, 1, 1, 1, 1,
1.39518, -0.0251398, 1.58927, 1, 1, 1, 1, 1,
1.401844, 1.547951, 2.205318, 0, 0, 1, 1, 1,
1.4237, -0.2987242, 2.060957, 1, 0, 0, 1, 1,
1.429573, 1.502381, 0.858197, 1, 0, 0, 1, 1,
1.431621, 0.4795651, 1.214228, 1, 0, 0, 1, 1,
1.435456, -0.2549244, 1.628498, 1, 0, 0, 1, 1,
1.458386, -0.82054, 1.78102, 1, 0, 0, 1, 1,
1.474644, -0.5877631, 1.646449, 0, 0, 0, 1, 1,
1.493035, -0.8232025, 2.5378, 0, 0, 0, 1, 1,
1.513454, 0.3261315, 1.332757, 0, 0, 0, 1, 1,
1.526706, -0.2078949, 2.250289, 0, 0, 0, 1, 1,
1.528713, 0.1750396, 2.01763, 0, 0, 0, 1, 1,
1.549088, 0.5232201, -0.0994086, 0, 0, 0, 1, 1,
1.549507, 0.1589027, 2.387792, 0, 0, 0, 1, 1,
1.550921, -0.8842034, 2.474605, 1, 1, 1, 1, 1,
1.553145, 0.3938735, 1.69685, 1, 1, 1, 1, 1,
1.571018, 1.70016, 1.120512, 1, 1, 1, 1, 1,
1.588337, 1.680103, 2.0936, 1, 1, 1, 1, 1,
1.593798, 1.384708, 0.1884397, 1, 1, 1, 1, 1,
1.599278, -1.322411, 0.8376924, 1, 1, 1, 1, 1,
1.600199, -0.8546981, 2.229733, 1, 1, 1, 1, 1,
1.609016, 2.818796, 1.045848, 1, 1, 1, 1, 1,
1.612654, 0.2528165, 0.6191179, 1, 1, 1, 1, 1,
1.614445, 0.8370965, 1.188568, 1, 1, 1, 1, 1,
1.62234, -0.5328927, 1.264666, 1, 1, 1, 1, 1,
1.622978, -0.2606504, 1.338134, 1, 1, 1, 1, 1,
1.631327, 1.932756, 0.9188423, 1, 1, 1, 1, 1,
1.655629, -1.459537, 2.535838, 1, 1, 1, 1, 1,
1.66472, 0.06338994, 2.161732, 1, 1, 1, 1, 1,
1.685264, 2.500828, 0.02943289, 0, 0, 1, 1, 1,
1.692423, -1.695478, 2.223661, 1, 0, 0, 1, 1,
1.701047, 0.195884, 0.6614088, 1, 0, 0, 1, 1,
1.71218, 0.6774054, 2.063771, 1, 0, 0, 1, 1,
1.72234, -1.279319, 4.389628, 1, 0, 0, 1, 1,
1.734323, -0.1421996, 0.2590585, 1, 0, 0, 1, 1,
1.734324, -0.3066779, 0.6242762, 0, 0, 0, 1, 1,
1.767336, -1.656927, 2.589208, 0, 0, 0, 1, 1,
1.79627, -1.504809, 1.068913, 0, 0, 0, 1, 1,
1.797304, -0.9882544, 1.453011, 0, 0, 0, 1, 1,
1.800712, 1.428798, 0.6050231, 0, 0, 0, 1, 1,
1.805034, -1.05099, 1.832139, 0, 0, 0, 1, 1,
1.811587, -0.1181495, 1.860598, 0, 0, 0, 1, 1,
1.814737, -0.4783105, 1.849192, 1, 1, 1, 1, 1,
1.827874, 2.380305, -0.5498012, 1, 1, 1, 1, 1,
1.82968, -0.0849506, 3.096935, 1, 1, 1, 1, 1,
1.832655, 1.118384, 0.7983442, 1, 1, 1, 1, 1,
1.870666, -0.4503309, 2.050476, 1, 1, 1, 1, 1,
1.88239, -2.063197, 2.314158, 1, 1, 1, 1, 1,
1.889766, -0.1795771, 0.7851015, 1, 1, 1, 1, 1,
1.895508, -0.761455, 3.43503, 1, 1, 1, 1, 1,
1.922497, 2.150206, 1.999975, 1, 1, 1, 1, 1,
1.942998, 1.491072, 0.5766318, 1, 1, 1, 1, 1,
1.943267, -0.2898889, 2.904581, 1, 1, 1, 1, 1,
1.956027, 2.426297, 2.934658, 1, 1, 1, 1, 1,
1.993533, -0.3820731, 1.161149, 1, 1, 1, 1, 1,
2.041351, 0.4039457, 1.41265, 1, 1, 1, 1, 1,
2.136709, 1.963985, 2.182014, 1, 1, 1, 1, 1,
2.149075, 0.8283843, 1.621016, 0, 0, 1, 1, 1,
2.154895, 1.028016, 0.994997, 1, 0, 0, 1, 1,
2.170326, 0.8565056, 1.021118, 1, 0, 0, 1, 1,
2.217584, -1.146598, 2.572738, 1, 0, 0, 1, 1,
2.248867, -3.511604, 2.66696, 1, 0, 0, 1, 1,
2.281601, -0.2667024, 1.920217, 1, 0, 0, 1, 1,
2.351012, 0.4266508, 1.412195, 0, 0, 0, 1, 1,
2.36193, 0.8678017, 0.2558587, 0, 0, 0, 1, 1,
2.362388, 0.3256665, 1.893737, 0, 0, 0, 1, 1,
2.382885, 2.090209, 0.4111757, 0, 0, 0, 1, 1,
2.431716, 1.034501, 0.05743944, 0, 0, 0, 1, 1,
2.445121, -0.6658736, 3.952853, 0, 0, 0, 1, 1,
2.492134, 1.593621, 1.860589, 0, 0, 0, 1, 1,
2.516931, -1.130693, 2.773157, 1, 1, 1, 1, 1,
2.529326, 1.691436, -0.2356364, 1, 1, 1, 1, 1,
2.592666, 1.099811, 0.9721785, 1, 1, 1, 1, 1,
2.646914, 0.1230309, 0.8136284, 1, 1, 1, 1, 1,
2.75043, -0.2257321, 1.282913, 1, 1, 1, 1, 1,
2.758715, -0.2840058, 1.928523, 1, 1, 1, 1, 1,
2.909507, 0.1501134, 2.200556, 1, 1, 1, 1, 1
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
var radius = 9.572465;
var distance = 33.62288;
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
mvMatrix.translate( 0.2811364, 0.3162518, -0.2868917 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.62288);
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
