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
-3.091086, 1.503854, -0.8163289, 1, 0, 0, 1,
-2.885734, 1.446808, -0.9633263, 1, 0.007843138, 0, 1,
-2.816136, -0.4708094, -1.431144, 1, 0.01176471, 0, 1,
-2.682467, 0.4380439, -2.164565, 1, 0.01960784, 0, 1,
-2.649277, -0.007567836, -1.275827, 1, 0.02352941, 0, 1,
-2.586983, -1.455996, -3.468468, 1, 0.03137255, 0, 1,
-2.572372, -1.261179, -2.971437, 1, 0.03529412, 0, 1,
-2.566432, -2.241296, -3.640684, 1, 0.04313726, 0, 1,
-2.549867, -0.08276521, 0.2585085, 1, 0.04705882, 0, 1,
-2.538878, -1.15823, -1.530097, 1, 0.05490196, 0, 1,
-2.524324, 0.1785395, -2.471922, 1, 0.05882353, 0, 1,
-2.460943, -0.2357082, -1.545488, 1, 0.06666667, 0, 1,
-2.449068, 2.162353, -0.3010473, 1, 0.07058824, 0, 1,
-2.43179, 1.548825, -1.44415, 1, 0.07843138, 0, 1,
-2.348531, 0.3856367, -1.671059, 1, 0.08235294, 0, 1,
-2.336989, 0.7800639, 1.293309, 1, 0.09019608, 0, 1,
-2.325248, 0.4545202, -3.200387, 1, 0.09411765, 0, 1,
-2.315485, 2.396798, -0.951749, 1, 0.1019608, 0, 1,
-2.266303, -0.5300222, -2.953171, 1, 0.1098039, 0, 1,
-2.194374, 1.936351, -0.6323434, 1, 0.1137255, 0, 1,
-2.193428, 0.06012044, -1.601606, 1, 0.1215686, 0, 1,
-2.186401, -0.2118181, -1.570032, 1, 0.1254902, 0, 1,
-2.089337, -0.3222068, -1.473753, 1, 0.1333333, 0, 1,
-2.068548, 1.953243, -2.112149, 1, 0.1372549, 0, 1,
-2.054026, -1.822946, -1.783247, 1, 0.145098, 0, 1,
-2.039529, -1.42738, -1.645699, 1, 0.1490196, 0, 1,
-2.016143, 0.3963501, 0.6609426, 1, 0.1568628, 0, 1,
-1.999318, 0.4740624, -0.2672609, 1, 0.1607843, 0, 1,
-1.998605, 0.903569, 0.8095288, 1, 0.1686275, 0, 1,
-1.973192, 1.0689, -1.535019, 1, 0.172549, 0, 1,
-1.965843, 0.182912, -0.9010379, 1, 0.1803922, 0, 1,
-1.903923, 0.2098517, -2.240148, 1, 0.1843137, 0, 1,
-1.889701, 1.189849, -1.204032, 1, 0.1921569, 0, 1,
-1.878161, 0.8144536, -0.5180951, 1, 0.1960784, 0, 1,
-1.859697, -0.7847162, -1.010534, 1, 0.2039216, 0, 1,
-1.816391, -0.3637324, -1.345823, 1, 0.2117647, 0, 1,
-1.813413, -0.3070747, -2.666076, 1, 0.2156863, 0, 1,
-1.803683, -0.1940017, -1.88863, 1, 0.2235294, 0, 1,
-1.80193, 0.292897, -0.7901522, 1, 0.227451, 0, 1,
-1.792676, 2.131802, 0.03112923, 1, 0.2352941, 0, 1,
-1.791336, -0.04458362, -0.5992838, 1, 0.2392157, 0, 1,
-1.788789, -0.01644527, -0.415964, 1, 0.2470588, 0, 1,
-1.784986, 0.56191, -2.314711, 1, 0.2509804, 0, 1,
-1.75045, -1.435131, -3.46744, 1, 0.2588235, 0, 1,
-1.744585, 1.785504, -0.1561076, 1, 0.2627451, 0, 1,
-1.739152, 0.2476148, -0.4123788, 1, 0.2705882, 0, 1,
-1.738061, 0.1336572, -1.824221, 1, 0.2745098, 0, 1,
-1.720609, 0.3944877, -2.356361, 1, 0.282353, 0, 1,
-1.713059, -0.1605391, -0.9041742, 1, 0.2862745, 0, 1,
-1.711765, 0.00642732, -3.570317, 1, 0.2941177, 0, 1,
-1.69859, -0.6721863, -2.046696, 1, 0.3019608, 0, 1,
-1.679415, 0.9608611, -1.985928, 1, 0.3058824, 0, 1,
-1.671502, 1.122331, -1.271321, 1, 0.3137255, 0, 1,
-1.662921, -0.6451421, -2.730032, 1, 0.3176471, 0, 1,
-1.632568, 0.002132455, -1.720716, 1, 0.3254902, 0, 1,
-1.623848, 1.83344, -1.503487, 1, 0.3294118, 0, 1,
-1.612184, 0.2427661, -1.437371, 1, 0.3372549, 0, 1,
-1.603994, -1.289755, -1.258062, 1, 0.3411765, 0, 1,
-1.600965, 0.1516985, -1.832604, 1, 0.3490196, 0, 1,
-1.555462, 1.55769, -1.107491, 1, 0.3529412, 0, 1,
-1.555072, 1.957441, -1.870344, 1, 0.3607843, 0, 1,
-1.537593, 0.1974999, -1.086328, 1, 0.3647059, 0, 1,
-1.527328, 0.4976375, -1.188252, 1, 0.372549, 0, 1,
-1.522325, 0.9202292, -1.88843, 1, 0.3764706, 0, 1,
-1.521098, -1.293921, -2.958978, 1, 0.3843137, 0, 1,
-1.520603, -0.09261027, -0.3899454, 1, 0.3882353, 0, 1,
-1.502344, -1.569763, -1.93223, 1, 0.3960784, 0, 1,
-1.500468, 0.9917419, -0.6904699, 1, 0.4039216, 0, 1,
-1.499821, -0.63059, -0.5576519, 1, 0.4078431, 0, 1,
-1.484992, -0.425751, -1.952853, 1, 0.4156863, 0, 1,
-1.471199, -0.5414972, -2.187347, 1, 0.4196078, 0, 1,
-1.458349, 1.07297, -2.540717, 1, 0.427451, 0, 1,
-1.457694, 0.4176323, -1.25928, 1, 0.4313726, 0, 1,
-1.457693, -1.153495, -0.8521593, 1, 0.4392157, 0, 1,
-1.456649, 0.05171185, -1.257628, 1, 0.4431373, 0, 1,
-1.456606, -0.587207, -3.805859, 1, 0.4509804, 0, 1,
-1.453518, 0.3461097, -1.010038, 1, 0.454902, 0, 1,
-1.437831, 0.2645984, 0.5011452, 1, 0.4627451, 0, 1,
-1.40692, 0.3541032, -1.484262, 1, 0.4666667, 0, 1,
-1.402881, -0.9774639, -2.129885, 1, 0.4745098, 0, 1,
-1.400868, -0.2322785, -0.1291259, 1, 0.4784314, 0, 1,
-1.400694, -0.2078082, -0.5851894, 1, 0.4862745, 0, 1,
-1.398492, -0.8515477, -2.925817, 1, 0.4901961, 0, 1,
-1.395063, -0.744476, -2.194976, 1, 0.4980392, 0, 1,
-1.392259, -0.8579386, -1.330588, 1, 0.5058824, 0, 1,
-1.390249, 0.1185345, -0.7078352, 1, 0.509804, 0, 1,
-1.373942, -1.666601, -3.016889, 1, 0.5176471, 0, 1,
-1.365701, 1.666829, -1.79832, 1, 0.5215687, 0, 1,
-1.356944, 0.8479697, -3.478149, 1, 0.5294118, 0, 1,
-1.355003, -0.3166848, -1.198198, 1, 0.5333334, 0, 1,
-1.340509, -1.272771, -2.268018, 1, 0.5411765, 0, 1,
-1.338412, -0.2256301, -2.514047, 1, 0.5450981, 0, 1,
-1.329721, 1.83799, -2.29164, 1, 0.5529412, 0, 1,
-1.327053, -1.666437, -1.58275, 1, 0.5568628, 0, 1,
-1.326179, -1.33788, -2.144464, 1, 0.5647059, 0, 1,
-1.32524, 1.258466, 0.7346104, 1, 0.5686275, 0, 1,
-1.32334, 1.680742, -1.026679, 1, 0.5764706, 0, 1,
-1.322224, -0.9939213, -2.308656, 1, 0.5803922, 0, 1,
-1.302514, -0.815616, -3.153134, 1, 0.5882353, 0, 1,
-1.29032, 0.8899065, 0.2999062, 1, 0.5921569, 0, 1,
-1.289589, -0.8691279, -2.722342, 1, 0.6, 0, 1,
-1.286509, 1.558034, -0.2998088, 1, 0.6078432, 0, 1,
-1.278391, 0.8637828, -1.097136, 1, 0.6117647, 0, 1,
-1.269087, -0.1933552, -3.249767, 1, 0.6196079, 0, 1,
-1.265013, 0.1712302, -1.107607, 1, 0.6235294, 0, 1,
-1.2629, 0.2150472, -1.239148, 1, 0.6313726, 0, 1,
-1.261827, -0.05228758, -1.695578, 1, 0.6352941, 0, 1,
-1.25999, 0.1232751, -0.2433303, 1, 0.6431373, 0, 1,
-1.258321, 0.3974373, -0.671731, 1, 0.6470588, 0, 1,
-1.251375, 2.099799, -0.7821844, 1, 0.654902, 0, 1,
-1.250699, 1.085375, -1.025105, 1, 0.6588235, 0, 1,
-1.247164, -1.20099, -1.786549, 1, 0.6666667, 0, 1,
-1.243443, 0.2385934, -3.324659, 1, 0.6705883, 0, 1,
-1.242309, 0.7661812, -1.000829, 1, 0.6784314, 0, 1,
-1.232408, -0.4695432, -2.758402, 1, 0.682353, 0, 1,
-1.225378, -1.068633, -2.92863, 1, 0.6901961, 0, 1,
-1.214722, -1.443141, -3.481742, 1, 0.6941177, 0, 1,
-1.213772, 0.6038281, 0.5452228, 1, 0.7019608, 0, 1,
-1.209089, -0.684215, -2.542505, 1, 0.7098039, 0, 1,
-1.200164, -0.6809615, -2.922686, 1, 0.7137255, 0, 1,
-1.19293, 1.000425, -1.808212, 1, 0.7215686, 0, 1,
-1.191133, -0.9257885, -2.034916, 1, 0.7254902, 0, 1,
-1.190068, -0.1084101, 0.6119025, 1, 0.7333333, 0, 1,
-1.184983, 0.4597542, 0.7396397, 1, 0.7372549, 0, 1,
-1.18297, 1.131789, 1.929236, 1, 0.7450981, 0, 1,
-1.179925, -0.5279521, -0.3936253, 1, 0.7490196, 0, 1,
-1.171693, 0.007966373, -0.8705752, 1, 0.7568628, 0, 1,
-1.16642, 3.191987, 0.06321992, 1, 0.7607843, 0, 1,
-1.160356, -1.011352, -2.285792, 1, 0.7686275, 0, 1,
-1.133164, -0.5137657, -2.266185, 1, 0.772549, 0, 1,
-1.130154, 0.08709104, -1.757365, 1, 0.7803922, 0, 1,
-1.122787, -0.5874982, -2.479878, 1, 0.7843137, 0, 1,
-1.120863, -0.4316218, -1.115982, 1, 0.7921569, 0, 1,
-1.120182, 1.393582, -0.1710714, 1, 0.7960784, 0, 1,
-1.099568, 1.510202, -1.594974, 1, 0.8039216, 0, 1,
-1.098568, -0.1170388, -2.313509, 1, 0.8117647, 0, 1,
-1.096877, -1.440275, -2.127455, 1, 0.8156863, 0, 1,
-1.0968, 0.0294389, -2.235546, 1, 0.8235294, 0, 1,
-1.09392, 0.5773421, -1.587908, 1, 0.827451, 0, 1,
-1.087557, 0.9202142, -0.7709036, 1, 0.8352941, 0, 1,
-1.086141, -0.5614753, -3.328736, 1, 0.8392157, 0, 1,
-1.074465, 0.4094386, -2.50794, 1, 0.8470588, 0, 1,
-1.056031, -0.138691, 0.8839787, 1, 0.8509804, 0, 1,
-1.054632, 0.5153016, -2.0996, 1, 0.8588235, 0, 1,
-1.054505, 0.6750739, -0.3868722, 1, 0.8627451, 0, 1,
-1.042954, 0.5315741, 0.5052326, 1, 0.8705882, 0, 1,
-1.036183, 0.1729266, 0.7049236, 1, 0.8745098, 0, 1,
-1.026939, -1.408452, -3.296745, 1, 0.8823529, 0, 1,
-1.024612, -1.256177, -2.167291, 1, 0.8862745, 0, 1,
-1.015867, -0.4817443, -2.066386, 1, 0.8941177, 0, 1,
-1.010792, 0.440985, -2.22233, 1, 0.8980392, 0, 1,
-1.00794, -2.035548, -4.287413, 1, 0.9058824, 0, 1,
-1.004993, -1.321536, -1.205422, 1, 0.9137255, 0, 1,
-1.001731, 0.2387436, 0.06355871, 1, 0.9176471, 0, 1,
-0.99594, -2.184639, -3.200204, 1, 0.9254902, 0, 1,
-0.993139, -2.548398, -2.103329, 1, 0.9294118, 0, 1,
-0.989943, 0.7479186, -2.496546, 1, 0.9372549, 0, 1,
-0.988525, 1.756871, -2.799235, 1, 0.9411765, 0, 1,
-0.9817548, 1.785318, 0.8943406, 1, 0.9490196, 0, 1,
-0.9805328, 0.870434, -1.024776, 1, 0.9529412, 0, 1,
-0.9607498, -0.4868625, -1.592924, 1, 0.9607843, 0, 1,
-0.956715, 3.454863, -0.8511621, 1, 0.9647059, 0, 1,
-0.9359956, 1.400331, -0.3785014, 1, 0.972549, 0, 1,
-0.9355022, 0.837165, -0.9463776, 1, 0.9764706, 0, 1,
-0.9341351, -0.1263253, -1.560921, 1, 0.9843137, 0, 1,
-0.9330723, -0.1499185, -2.142447, 1, 0.9882353, 0, 1,
-0.9287093, 0.02371851, -1.769447, 1, 0.9960784, 0, 1,
-0.9280363, -0.7257346, -1.102546, 0.9960784, 1, 0, 1,
-0.9152613, 0.9076255, 0.3318583, 0.9921569, 1, 0, 1,
-0.9080838, 2.19915, 0.5661432, 0.9843137, 1, 0, 1,
-0.9034804, -1.181865, -3.74401, 0.9803922, 1, 0, 1,
-0.9027714, 1.098723, 2.05179, 0.972549, 1, 0, 1,
-0.9010559, -1.418069, -0.710112, 0.9686275, 1, 0, 1,
-0.9008505, -0.787043, -2.685387, 0.9607843, 1, 0, 1,
-0.8963765, 1.07823, -0.314822, 0.9568627, 1, 0, 1,
-0.8935799, -1.52864, -1.471519, 0.9490196, 1, 0, 1,
-0.8863394, -0.6360329, -0.4929721, 0.945098, 1, 0, 1,
-0.8861728, -0.4100894, -2.013436, 0.9372549, 1, 0, 1,
-0.8860641, -0.7982546, -3.131181, 0.9333333, 1, 0, 1,
-0.8854204, 0.2203271, -0.8082811, 0.9254902, 1, 0, 1,
-0.8849288, -1.755162, -2.890178, 0.9215686, 1, 0, 1,
-0.8840036, 0.8777032, -2.146565, 0.9137255, 1, 0, 1,
-0.8806182, 0.2364253, -2.056835, 0.9098039, 1, 0, 1,
-0.8799735, 0.8730828, 0.03789298, 0.9019608, 1, 0, 1,
-0.8790137, -0.9099376, -2.670909, 0.8941177, 1, 0, 1,
-0.8782517, -1.050786, -1.227583, 0.8901961, 1, 0, 1,
-0.8724827, -0.04641301, -3.09101, 0.8823529, 1, 0, 1,
-0.8709803, -0.5880517, -2.198177, 0.8784314, 1, 0, 1,
-0.8627447, 0.6900032, -0.4694732, 0.8705882, 1, 0, 1,
-0.8607649, 0.509424, -1.623386, 0.8666667, 1, 0, 1,
-0.851541, -0.07942574, -1.006079, 0.8588235, 1, 0, 1,
-0.8508952, -1.714299, -3.112403, 0.854902, 1, 0, 1,
-0.8493707, -0.4345959, -2.752719, 0.8470588, 1, 0, 1,
-0.8466204, 0.4192456, -0.4860263, 0.8431373, 1, 0, 1,
-0.8456655, -0.2799134, -3.455792, 0.8352941, 1, 0, 1,
-0.8439272, -1.798857, -2.775065, 0.8313726, 1, 0, 1,
-0.8413831, -0.1730676, 0.08699366, 0.8235294, 1, 0, 1,
-0.8353709, 1.285178, -0.1186957, 0.8196079, 1, 0, 1,
-0.8293996, 0.7714278, -0.7798277, 0.8117647, 1, 0, 1,
-0.8283682, -0.8482682, -2.12892, 0.8078431, 1, 0, 1,
-0.8166032, 0.1288987, -1.994895, 0.8, 1, 0, 1,
-0.8120339, 0.493508, -2.195586, 0.7921569, 1, 0, 1,
-0.8111742, -1.039253, -3.320643, 0.7882353, 1, 0, 1,
-0.8041005, -2.499678, -3.544006, 0.7803922, 1, 0, 1,
-0.8037135, -1.250413, -0.7641647, 0.7764706, 1, 0, 1,
-0.8011637, 0.06449544, -2.801616, 0.7686275, 1, 0, 1,
-0.7920985, 0.0665245, -2.157284, 0.7647059, 1, 0, 1,
-0.7917919, -1.079774, -3.689616, 0.7568628, 1, 0, 1,
-0.7902755, 0.317344, -1.961394, 0.7529412, 1, 0, 1,
-0.7896101, 0.2416941, -1.934705, 0.7450981, 1, 0, 1,
-0.7880676, 1.91247, 0.2722747, 0.7411765, 1, 0, 1,
-0.7838963, -0.3437497, -1.886044, 0.7333333, 1, 0, 1,
-0.78106, 0.05536323, -1.120372, 0.7294118, 1, 0, 1,
-0.7727659, -0.6256441, -2.619217, 0.7215686, 1, 0, 1,
-0.770227, -1.406062, -2.13865, 0.7176471, 1, 0, 1,
-0.7700055, 0.5591598, 0.2105647, 0.7098039, 1, 0, 1,
-0.7644331, 0.391563, -0.9345542, 0.7058824, 1, 0, 1,
-0.7636377, 0.8558538, 0.1699751, 0.6980392, 1, 0, 1,
-0.7596588, -1.346499, -3.114492, 0.6901961, 1, 0, 1,
-0.7564716, -0.0949273, -2.107641, 0.6862745, 1, 0, 1,
-0.7525083, 0.7377955, -1.553386, 0.6784314, 1, 0, 1,
-0.7514949, 0.9502172, 0.1985132, 0.6745098, 1, 0, 1,
-0.746498, -1.497446, -1.983215, 0.6666667, 1, 0, 1,
-0.7435832, 0.2352063, -0.9199913, 0.6627451, 1, 0, 1,
-0.740939, -0.04905481, -1.700635, 0.654902, 1, 0, 1,
-0.7334718, -0.290076, -1.868268, 0.6509804, 1, 0, 1,
-0.7325971, -0.6602164, -4.44824, 0.6431373, 1, 0, 1,
-0.7315801, -2.435828, -2.864063, 0.6392157, 1, 0, 1,
-0.7292038, 1.171398, 0.447232, 0.6313726, 1, 0, 1,
-0.7286876, -0.5195779, -1.953161, 0.627451, 1, 0, 1,
-0.7221379, -0.3016364, -1.205424, 0.6196079, 1, 0, 1,
-0.7215901, 1.235869, 0.0354966, 0.6156863, 1, 0, 1,
-0.7154336, -0.9534569, -3.010864, 0.6078432, 1, 0, 1,
-0.714052, 0.2132464, -0.5622155, 0.6039216, 1, 0, 1,
-0.7139545, -1.069711, -4.225187, 0.5960785, 1, 0, 1,
-0.7117081, -1.903913, -1.889521, 0.5882353, 1, 0, 1,
-0.7080564, 0.3012801, -1.579374, 0.5843138, 1, 0, 1,
-0.7046849, 0.2244534, -1.426258, 0.5764706, 1, 0, 1,
-0.7023852, -1.046163, -2.679653, 0.572549, 1, 0, 1,
-0.7016191, 0.8372917, -1.870646, 0.5647059, 1, 0, 1,
-0.6942284, -0.5493225, -1.157409, 0.5607843, 1, 0, 1,
-0.684854, 2.064305, 0.2766379, 0.5529412, 1, 0, 1,
-0.679223, 1.035867, -0.8954471, 0.5490196, 1, 0, 1,
-0.6775675, -0.8171167, -0.5089676, 0.5411765, 1, 0, 1,
-0.6774737, 0.5095477, -2.102719, 0.5372549, 1, 0, 1,
-0.6722637, -0.01046738, -1.939755, 0.5294118, 1, 0, 1,
-0.6608015, -0.1981151, -0.5719044, 0.5254902, 1, 0, 1,
-0.6584534, -0.6684747, -2.153018, 0.5176471, 1, 0, 1,
-0.6522697, 0.6721935, -0.4381155, 0.5137255, 1, 0, 1,
-0.647801, 0.4954354, -1.969784, 0.5058824, 1, 0, 1,
-0.640546, 0.6080623, -1.3842, 0.5019608, 1, 0, 1,
-0.635752, -0.0689294, -2.168976, 0.4941176, 1, 0, 1,
-0.6315227, 0.2666714, -2.442575, 0.4862745, 1, 0, 1,
-0.629028, 0.5775706, 0.05065816, 0.4823529, 1, 0, 1,
-0.6156794, -0.03355859, -1.205285, 0.4745098, 1, 0, 1,
-0.6154343, 1.613566, -0.7964628, 0.4705882, 1, 0, 1,
-0.613799, 0.5650679, 1.406739, 0.4627451, 1, 0, 1,
-0.6121609, -1.960436, -2.114308, 0.4588235, 1, 0, 1,
-0.5942938, -0.2373338, -2.88068, 0.4509804, 1, 0, 1,
-0.5907865, 0.7913824, -1.395774, 0.4470588, 1, 0, 1,
-0.5846097, -0.861906, -2.814095, 0.4392157, 1, 0, 1,
-0.5841665, -1.189537, -2.074175, 0.4352941, 1, 0, 1,
-0.5808277, -1.64175, -2.762957, 0.427451, 1, 0, 1,
-0.5788495, -1.143345, -2.745314, 0.4235294, 1, 0, 1,
-0.5763028, -0.5232135, 1.334843, 0.4156863, 1, 0, 1,
-0.5758363, 1.889751, -0.6576486, 0.4117647, 1, 0, 1,
-0.5738221, -0.84132, -0.704098, 0.4039216, 1, 0, 1,
-0.571782, -1.06754, -1.854639, 0.3960784, 1, 0, 1,
-0.5673115, 0.7988585, -1.165889, 0.3921569, 1, 0, 1,
-0.5635228, 0.714024, 1.544306, 0.3843137, 1, 0, 1,
-0.5635178, -0.001142697, -1.887695, 0.3803922, 1, 0, 1,
-0.5612621, -0.7636348, -3.681266, 0.372549, 1, 0, 1,
-0.560389, 0.1752017, 0.6118243, 0.3686275, 1, 0, 1,
-0.55098, -1.155601, 0.00889519, 0.3607843, 1, 0, 1,
-0.5422402, -1.029919, -6.644413, 0.3568628, 1, 0, 1,
-0.5393686, -0.591808, -2.394169, 0.3490196, 1, 0, 1,
-0.5363079, -0.5297391, -3.782234, 0.345098, 1, 0, 1,
-0.5351645, -0.4472008, -2.132782, 0.3372549, 1, 0, 1,
-0.5319313, 0.1827823, -1.847526, 0.3333333, 1, 0, 1,
-0.5305151, 0.7940943, -1.182892, 0.3254902, 1, 0, 1,
-0.5232128, 1.738924, -0.5075449, 0.3215686, 1, 0, 1,
-0.5229853, -0.5814312, -3.0723, 0.3137255, 1, 0, 1,
-0.5224912, -1.48428, -3.541895, 0.3098039, 1, 0, 1,
-0.5212629, 2.416863, 0.8478481, 0.3019608, 1, 0, 1,
-0.5209541, 1.586672, -1.025247, 0.2941177, 1, 0, 1,
-0.5208371, -0.2483331, -3.546101, 0.2901961, 1, 0, 1,
-0.5206786, -1.615028, -4.161778, 0.282353, 1, 0, 1,
-0.5199047, 1.113417, -0.02735526, 0.2784314, 1, 0, 1,
-0.5116321, 0.01375907, -1.997016, 0.2705882, 1, 0, 1,
-0.5096551, -0.4109463, -1.328, 0.2666667, 1, 0, 1,
-0.5071345, -1.495258, -4.145296, 0.2588235, 1, 0, 1,
-0.5068904, 0.1024391, -2.526388, 0.254902, 1, 0, 1,
-0.4958112, -0.2348423, -1.88804, 0.2470588, 1, 0, 1,
-0.4941256, -0.6291509, -1.538717, 0.2431373, 1, 0, 1,
-0.4939138, 1.646332, 0.5003309, 0.2352941, 1, 0, 1,
-0.4936821, 0.6253561, 0.9331191, 0.2313726, 1, 0, 1,
-0.4914788, 0.3461987, -1.477673, 0.2235294, 1, 0, 1,
-0.4862192, 0.5925484, 0.7075888, 0.2196078, 1, 0, 1,
-0.4858054, 1.222882, -0.9752327, 0.2117647, 1, 0, 1,
-0.4832139, -0.4447736, -4.258401, 0.2078431, 1, 0, 1,
-0.4802522, 1.879983, -1.255665, 0.2, 1, 0, 1,
-0.4697812, -0.6470647, -2.920015, 0.1921569, 1, 0, 1,
-0.4655036, 0.1021637, -1.403493, 0.1882353, 1, 0, 1,
-0.4605261, 1.583276, -0.8446837, 0.1803922, 1, 0, 1,
-0.4584916, 0.06429142, -2.493708, 0.1764706, 1, 0, 1,
-0.456021, -0.936462, -1.803235, 0.1686275, 1, 0, 1,
-0.4529267, -1.156464, -3.622717, 0.1647059, 1, 0, 1,
-0.4511614, -0.5273478, -2.354826, 0.1568628, 1, 0, 1,
-0.4410818, 0.2936005, -1.210765, 0.1529412, 1, 0, 1,
-0.4393928, 0.1898986, -0.3702671, 0.145098, 1, 0, 1,
-0.4349532, -0.01174252, 0.3033322, 0.1411765, 1, 0, 1,
-0.4344299, -0.9413044, -3.352721, 0.1333333, 1, 0, 1,
-0.4337354, -2.014368, -3.139433, 0.1294118, 1, 0, 1,
-0.4333006, -1.282576, -1.843784, 0.1215686, 1, 0, 1,
-0.4294959, -0.7524264, -4.855343, 0.1176471, 1, 0, 1,
-0.4228363, 0.5604843, -1.898595, 0.1098039, 1, 0, 1,
-0.4186733, -0.5185527, -3.074356, 0.1058824, 1, 0, 1,
-0.4138133, 1.932675, -0.8170328, 0.09803922, 1, 0, 1,
-0.4127326, 1.414676, -1.349915, 0.09019608, 1, 0, 1,
-0.4102497, 1.578526, -0.01404665, 0.08627451, 1, 0, 1,
-0.40905, -1.277614, -2.998656, 0.07843138, 1, 0, 1,
-0.3996953, 0.3791162, -1.911523, 0.07450981, 1, 0, 1,
-0.3962379, 0.9597369, -1.068755, 0.06666667, 1, 0, 1,
-0.3945463, -0.9391752, -3.18748, 0.0627451, 1, 0, 1,
-0.3921603, 0.8275414, -0.01392441, 0.05490196, 1, 0, 1,
-0.3904754, -1.044013, -3.752661, 0.05098039, 1, 0, 1,
-0.3886499, 2.0915, -0.9869936, 0.04313726, 1, 0, 1,
-0.3878341, 0.08686963, -1.107639, 0.03921569, 1, 0, 1,
-0.3875374, -1.485128, -4.695861, 0.03137255, 1, 0, 1,
-0.3821281, -0.3380407, -2.267539, 0.02745098, 1, 0, 1,
-0.3770995, -1.646717, -3.990116, 0.01960784, 1, 0, 1,
-0.3748604, 0.4245819, -0.8666896, 0.01568628, 1, 0, 1,
-0.3715101, -0.2404104, -1.887643, 0.007843138, 1, 0, 1,
-0.3713644, 0.3371277, -0.5983031, 0.003921569, 1, 0, 1,
-0.3706955, 1.383318, -0.7998877, 0, 1, 0.003921569, 1,
-0.3682478, -0.7985757, -2.12162, 0, 1, 0.01176471, 1,
-0.3680278, -0.7310585, -2.873643, 0, 1, 0.01568628, 1,
-0.36296, -1.139638, -3.758274, 0, 1, 0.02352941, 1,
-0.3605976, 1.044587, 0.7488039, 0, 1, 0.02745098, 1,
-0.3575101, -1.361506, -2.976327, 0, 1, 0.03529412, 1,
-0.3569708, -0.2512494, -0.2428444, 0, 1, 0.03921569, 1,
-0.3532925, -0.3031146, -1.526591, 0, 1, 0.04705882, 1,
-0.3501882, 0.7492847, -1.817991, 0, 1, 0.05098039, 1,
-0.3468426, 1.047436, 0.6362242, 0, 1, 0.05882353, 1,
-0.3465476, 0.9772214, -0.5870134, 0, 1, 0.0627451, 1,
-0.3444929, 2.521244, 1.050089, 0, 1, 0.07058824, 1,
-0.3416, 0.5324598, -0.8087712, 0, 1, 0.07450981, 1,
-0.3402558, -1.577256, -3.504136, 0, 1, 0.08235294, 1,
-0.3345117, -0.05580747, -0.7698051, 0, 1, 0.08627451, 1,
-0.3312857, -2.219511, -3.585011, 0, 1, 0.09411765, 1,
-0.3308951, -1.22179, -2.683242, 0, 1, 0.1019608, 1,
-0.330202, 0.5530223, -1.333067, 0, 1, 0.1058824, 1,
-0.3228358, 0.6040252, -0.6911998, 0, 1, 0.1137255, 1,
-0.3213262, -0.34418, -4.41149, 0, 1, 0.1176471, 1,
-0.3197165, -0.1116775, -2.202943, 0, 1, 0.1254902, 1,
-0.3157564, -1.442586, -3.654765, 0, 1, 0.1294118, 1,
-0.3132601, 0.02762614, -1.379867, 0, 1, 0.1372549, 1,
-0.3100546, 0.2313004, -0.508726, 0, 1, 0.1411765, 1,
-0.3065149, -0.7515311, -2.315966, 0, 1, 0.1490196, 1,
-0.3061596, -0.1295209, -1.837265, 0, 1, 0.1529412, 1,
-0.3055218, 1.251806, 0.1866162, 0, 1, 0.1607843, 1,
-0.3047955, -0.4221133, -2.469635, 0, 1, 0.1647059, 1,
-0.3015864, 0.07149822, -1.692115, 0, 1, 0.172549, 1,
-0.3011012, 0.8187965, 0.4103986, 0, 1, 0.1764706, 1,
-0.2990032, 0.001043501, -0.8609284, 0, 1, 0.1843137, 1,
-0.2944736, -0.2167849, -2.354471, 0, 1, 0.1882353, 1,
-0.2927618, 0.139443, -1.561926, 0, 1, 0.1960784, 1,
-0.2917484, 2.056214, -1.490792, 0, 1, 0.2039216, 1,
-0.289196, -0.0239461, -2.139908, 0, 1, 0.2078431, 1,
-0.2887795, -2.088454, -4.33324, 0, 1, 0.2156863, 1,
-0.2821128, 1.996766, -0.08600605, 0, 1, 0.2196078, 1,
-0.2799562, -0.4528305, -2.001492, 0, 1, 0.227451, 1,
-0.2727448, -1.075694, -3.578377, 0, 1, 0.2313726, 1,
-0.2723043, 0.4416667, 0.1726899, 0, 1, 0.2392157, 1,
-0.2706344, -1.02808, -2.418417, 0, 1, 0.2431373, 1,
-0.2696377, -1.969492, -2.060418, 0, 1, 0.2509804, 1,
-0.2678412, 0.1767448, -2.358631, 0, 1, 0.254902, 1,
-0.266338, -1.341572, -4.191881, 0, 1, 0.2627451, 1,
-0.2619081, -0.729703, -3.197595, 0, 1, 0.2666667, 1,
-0.2567915, -1.921817, -1.537939, 0, 1, 0.2745098, 1,
-0.2564902, 1.297909, -1.209459, 0, 1, 0.2784314, 1,
-0.2543595, 0.216676, -1.566021, 0, 1, 0.2862745, 1,
-0.2533802, 1.349487, -2.675251, 0, 1, 0.2901961, 1,
-0.2518739, -1.308998, -4.274684, 0, 1, 0.2980392, 1,
-0.2502229, -0.8386479, -1.838661, 0, 1, 0.3058824, 1,
-0.2475932, -0.564306, -2.085174, 0, 1, 0.3098039, 1,
-0.2449406, 0.2155543, 0.2939492, 0, 1, 0.3176471, 1,
-0.2424793, -0.2029908, -1.331658, 0, 1, 0.3215686, 1,
-0.2399615, -0.2696249, -2.737486, 0, 1, 0.3294118, 1,
-0.2384227, 1.048035, -2.410995, 0, 1, 0.3333333, 1,
-0.2361833, -0.2805137, -2.604892, 0, 1, 0.3411765, 1,
-0.2312697, -0.1935293, -3.291215, 0, 1, 0.345098, 1,
-0.2295925, -1.194064, -4.638441, 0, 1, 0.3529412, 1,
-0.2172582, -1.266533, -4.848178, 0, 1, 0.3568628, 1,
-0.2161219, 0.5578587, -1.728082, 0, 1, 0.3647059, 1,
-0.2116133, 0.4273274, 0.5046332, 0, 1, 0.3686275, 1,
-0.2113479, 0.5611982, -0.5218002, 0, 1, 0.3764706, 1,
-0.2112009, -0.4139937, -4.671018, 0, 1, 0.3803922, 1,
-0.209984, 0.6163292, -1.333183, 0, 1, 0.3882353, 1,
-0.2076249, 0.1010122, -0.08301897, 0, 1, 0.3921569, 1,
-0.2074361, 0.2039876, -2.572856, 0, 1, 0.4, 1,
-0.1976339, 0.108455, -1.382504, 0, 1, 0.4078431, 1,
-0.1934047, -0.903154, -0.2188278, 0, 1, 0.4117647, 1,
-0.1933244, -0.4596479, -2.178529, 0, 1, 0.4196078, 1,
-0.1927655, -0.3930821, -2.946022, 0, 1, 0.4235294, 1,
-0.1921085, -0.5189413, -1.053001, 0, 1, 0.4313726, 1,
-0.1880042, -0.1075745, -3.710594, 0, 1, 0.4352941, 1,
-0.1869304, 1.274099, -1.966862, 0, 1, 0.4431373, 1,
-0.1843461, -0.4633409, -4.252351, 0, 1, 0.4470588, 1,
-0.1841787, -1.237256, -4.695758, 0, 1, 0.454902, 1,
-0.18354, -2.070727, -4.06017, 0, 1, 0.4588235, 1,
-0.1832509, 0.8342591, -1.934903, 0, 1, 0.4666667, 1,
-0.1821721, -1.490539, -3.54266, 0, 1, 0.4705882, 1,
-0.1800258, 1.050017, -0.2596704, 0, 1, 0.4784314, 1,
-0.1782627, 0.6464946, 0.3616054, 0, 1, 0.4823529, 1,
-0.1759549, 1.561918, 1.267717, 0, 1, 0.4901961, 1,
-0.1735544, -0.791458, -3.583751, 0, 1, 0.4941176, 1,
-0.1732078, -0.008049923, -1.400482, 0, 1, 0.5019608, 1,
-0.1732001, 0.9701267, 0.3633536, 0, 1, 0.509804, 1,
-0.1720553, 0.07608975, -1.539702, 0, 1, 0.5137255, 1,
-0.170462, 0.4637183, -0.2759535, 0, 1, 0.5215687, 1,
-0.1661811, -0.3377239, -4.208632, 0, 1, 0.5254902, 1,
-0.1643582, 1.212086, 0.5636235, 0, 1, 0.5333334, 1,
-0.1642951, 0.8588111, 0.4514634, 0, 1, 0.5372549, 1,
-0.1633969, 1.932841, 0.509321, 0, 1, 0.5450981, 1,
-0.1628477, 0.6644409, 1.55863, 0, 1, 0.5490196, 1,
-0.1598784, 0.2858442, -0.2958764, 0, 1, 0.5568628, 1,
-0.1568577, -2.140484, -4.351364, 0, 1, 0.5607843, 1,
-0.1552012, 0.8786784, -0.4940114, 0, 1, 0.5686275, 1,
-0.1536132, -0.1223832, -0.8372555, 0, 1, 0.572549, 1,
-0.1497785, 1.663414, 0.2459829, 0, 1, 0.5803922, 1,
-0.1475019, 0.4104249, -0.7365718, 0, 1, 0.5843138, 1,
-0.1466419, 0.7638723, -0.5382462, 0, 1, 0.5921569, 1,
-0.1465788, 0.6583238, -1.947399, 0, 1, 0.5960785, 1,
-0.1433253, -2.044613, -2.99813, 0, 1, 0.6039216, 1,
-0.134901, 1.649046, -1.127799, 0, 1, 0.6117647, 1,
-0.1338927, 0.531255, -0.7402064, 0, 1, 0.6156863, 1,
-0.1315593, -0.4283821, -2.723733, 0, 1, 0.6235294, 1,
-0.1311422, 0.1177874, -2.732425, 0, 1, 0.627451, 1,
-0.1302603, -0.8033521, -2.953593, 0, 1, 0.6352941, 1,
-0.1297936, 1.57293, 1.224541, 0, 1, 0.6392157, 1,
-0.1294972, -0.03838389, -1.703825, 0, 1, 0.6470588, 1,
-0.1253359, 0.3356598, -0.4718111, 0, 1, 0.6509804, 1,
-0.1213697, 1.260118, -0.5070109, 0, 1, 0.6588235, 1,
-0.1204534, 0.106839, -1.642446, 0, 1, 0.6627451, 1,
-0.1186997, -0.4915303, -1.734964, 0, 1, 0.6705883, 1,
-0.1185914, -0.9840804, -3.336919, 0, 1, 0.6745098, 1,
-0.1169966, 1.011239, 2.454466, 0, 1, 0.682353, 1,
-0.1130254, -0.1699414, -3.104249, 0, 1, 0.6862745, 1,
-0.109933, 1.035822, 0.4191823, 0, 1, 0.6941177, 1,
-0.1087312, 2.107294, 1.063075, 0, 1, 0.7019608, 1,
-0.1053567, -0.6777105, -3.398063, 0, 1, 0.7058824, 1,
-0.1027556, -0.0624644, -2.349915, 0, 1, 0.7137255, 1,
-0.1001783, 1.108311, -0.5471342, 0, 1, 0.7176471, 1,
-0.09949075, 1.07605, 0.120971, 0, 1, 0.7254902, 1,
-0.09873613, 0.8115377, -1.243238, 0, 1, 0.7294118, 1,
-0.09836254, -0.2180137, -4.582346, 0, 1, 0.7372549, 1,
-0.09291647, 1.160949, -1.694664, 0, 1, 0.7411765, 1,
-0.09231431, -0.1327018, -2.731895, 0, 1, 0.7490196, 1,
-0.08981524, -0.486276, -3.695978, 0, 1, 0.7529412, 1,
-0.08966777, 0.06437586, -3.264449, 0, 1, 0.7607843, 1,
-0.08481593, -0.01687456, -2.208831, 0, 1, 0.7647059, 1,
-0.08311709, 2.575634, 0.08632691, 0, 1, 0.772549, 1,
-0.07371267, -0.185369, -3.227571, 0, 1, 0.7764706, 1,
-0.07179052, -0.2863494, -3.12576, 0, 1, 0.7843137, 1,
-0.07148839, -1.317463, -3.052415, 0, 1, 0.7882353, 1,
-0.07033212, 1.020084, 0.5578628, 0, 1, 0.7960784, 1,
-0.06878606, -0.009186417, -1.992338, 0, 1, 0.8039216, 1,
-0.06489109, -0.8128492, -3.942219, 0, 1, 0.8078431, 1,
-0.06475916, -1.727204, -2.306054, 0, 1, 0.8156863, 1,
-0.063976, 0.180361, -0.6756265, 0, 1, 0.8196079, 1,
-0.06079942, -0.3173566, -3.81549, 0, 1, 0.827451, 1,
-0.06059, -1.814941, -4.112275, 0, 1, 0.8313726, 1,
-0.05528599, 0.1544124, 0.2052294, 0, 1, 0.8392157, 1,
-0.04796333, -1.795416, -2.698681, 0, 1, 0.8431373, 1,
-0.04323682, 1.049061, 0.4799015, 0, 1, 0.8509804, 1,
-0.04140155, -1.402431, -3.491785, 0, 1, 0.854902, 1,
-0.03732413, -0.8483109, -3.120124, 0, 1, 0.8627451, 1,
-0.0367649, -0.2587849, -1.290701, 0, 1, 0.8666667, 1,
-0.03664272, 0.1841533, 0.002727544, 0, 1, 0.8745098, 1,
-0.03569177, 0.4924507, -0.3009033, 0, 1, 0.8784314, 1,
-0.03387089, 0.316124, 0.7848147, 0, 1, 0.8862745, 1,
-0.03251601, 1.213863, -0.3775162, 0, 1, 0.8901961, 1,
-0.03107072, 1.923666, -1.000759, 0, 1, 0.8980392, 1,
-0.03091368, 0.4631705, 0.0196023, 0, 1, 0.9058824, 1,
-0.02970454, 0.3217852, 0.5367595, 0, 1, 0.9098039, 1,
-0.02895644, -0.3353548, -4.072849, 0, 1, 0.9176471, 1,
-0.01383088, -0.2807017, -4.513744, 0, 1, 0.9215686, 1,
-0.01105396, -1.072117, -4.285996, 0, 1, 0.9294118, 1,
-0.010156, 1.169842, 0.6532155, 0, 1, 0.9333333, 1,
-0.008753293, -1.494593, -4.055754, 0, 1, 0.9411765, 1,
-0.005567007, 1.096932, 1.604278, 0, 1, 0.945098, 1,
-0.004666764, -2.777256, -3.029837, 0, 1, 0.9529412, 1,
-0.004534536, 0.5907711, -0.7725117, 0, 1, 0.9568627, 1,
-0.00341646, 1.791442, 0.9643731, 0, 1, 0.9647059, 1,
0.0005098612, -0.7697052, 3.641128, 0, 1, 0.9686275, 1,
0.001473653, 0.5285071, -1.2427, 0, 1, 0.9764706, 1,
0.002868001, 1.556905, 0.1269162, 0, 1, 0.9803922, 1,
0.005498627, -0.9831191, 1.874233, 0, 1, 0.9882353, 1,
0.005971632, 0.4204822, -0.463633, 0, 1, 0.9921569, 1,
0.007259327, 0.5495693, 0.2881764, 0, 1, 1, 1,
0.009625459, -0.4832415, 2.038119, 0, 0.9921569, 1, 1,
0.01289459, -0.4147943, 4.98246, 0, 0.9882353, 1, 1,
0.01313978, -0.05586966, 3.041512, 0, 0.9803922, 1, 1,
0.01772452, -1.164135, 3.153046, 0, 0.9764706, 1, 1,
0.02127229, 2.532372, -0.5657433, 0, 0.9686275, 1, 1,
0.0222892, -0.4422659, 2.59242, 0, 0.9647059, 1, 1,
0.02242122, -0.08976126, 3.798854, 0, 0.9568627, 1, 1,
0.02336033, -0.8654564, 3.150768, 0, 0.9529412, 1, 1,
0.02741157, -0.4934557, 0.545258, 0, 0.945098, 1, 1,
0.02785267, -0.2900425, 3.713345, 0, 0.9411765, 1, 1,
0.02904422, 0.1062074, 1.206692, 0, 0.9333333, 1, 1,
0.0318495, 1.83602, 2.442861, 0, 0.9294118, 1, 1,
0.03373323, 1.161054, 0.864175, 0, 0.9215686, 1, 1,
0.04801621, -0.3562993, 3.56754, 0, 0.9176471, 1, 1,
0.05279155, 0.8539091, -0.8422344, 0, 0.9098039, 1, 1,
0.05290449, -0.4309951, 3.678599, 0, 0.9058824, 1, 1,
0.05387395, -1.691633, 4.150077, 0, 0.8980392, 1, 1,
0.05572952, -0.9394773, 2.777106, 0, 0.8901961, 1, 1,
0.06123024, -0.6157907, 4.788847, 0, 0.8862745, 1, 1,
0.06392776, -0.7587083, 2.695179, 0, 0.8784314, 1, 1,
0.06406271, -1.035914, 2.841893, 0, 0.8745098, 1, 1,
0.06800887, 1.133769, -2.166709, 0, 0.8666667, 1, 1,
0.06860194, 1.19556, -0.1108575, 0, 0.8627451, 1, 1,
0.06900496, 0.9657307, 0.6614273, 0, 0.854902, 1, 1,
0.07030488, -0.6595377, 2.894202, 0, 0.8509804, 1, 1,
0.07114986, -0.7351154, 4.420554, 0, 0.8431373, 1, 1,
0.07511018, -0.192663, 1.771898, 0, 0.8392157, 1, 1,
0.0768323, -0.7590262, 2.704834, 0, 0.8313726, 1, 1,
0.07688189, 0.1328208, 2.276278, 0, 0.827451, 1, 1,
0.08115099, 0.5447243, -0.6597362, 0, 0.8196079, 1, 1,
0.08345854, -0.9635572, 1.768853, 0, 0.8156863, 1, 1,
0.08593129, -0.1555261, 2.878269, 0, 0.8078431, 1, 1,
0.08683691, -0.8476312, 4.014297, 0, 0.8039216, 1, 1,
0.0874194, -0.940791, 1.169371, 0, 0.7960784, 1, 1,
0.08956242, -0.3916397, 4.462314, 0, 0.7882353, 1, 1,
0.09108308, -0.4281486, 2.120241, 0, 0.7843137, 1, 1,
0.09267458, -1.294634, 3.149666, 0, 0.7764706, 1, 1,
0.09343666, 0.9894979, 2.210843, 0, 0.772549, 1, 1,
0.09555597, 0.7569308, 1.212808, 0, 0.7647059, 1, 1,
0.09574228, -0.5552745, 2.05858, 0, 0.7607843, 1, 1,
0.09653813, 0.7999479, -0.03099559, 0, 0.7529412, 1, 1,
0.09728222, 0.08626787, -0.1037555, 0, 0.7490196, 1, 1,
0.09824172, 0.719254, -0.8824429, 0, 0.7411765, 1, 1,
0.1009921, 0.6334689, 0.9412025, 0, 0.7372549, 1, 1,
0.1018689, -0.005721484, 2.182279, 0, 0.7294118, 1, 1,
0.1046483, -0.0656142, 2.465784, 0, 0.7254902, 1, 1,
0.1056641, -0.0453621, 0.2343156, 0, 0.7176471, 1, 1,
0.1121406, 1.494796, -0.1716786, 0, 0.7137255, 1, 1,
0.1135987, -0.5784857, 1.627649, 0, 0.7058824, 1, 1,
0.1162673, -0.3774538, 3.022544, 0, 0.6980392, 1, 1,
0.1219787, 0.7529968, 0.006990571, 0, 0.6941177, 1, 1,
0.1223143, 1.324175, 0.7623636, 0, 0.6862745, 1, 1,
0.1234826, 1.373202, 0.9944767, 0, 0.682353, 1, 1,
0.1244804, 0.5030812, 0.7020566, 0, 0.6745098, 1, 1,
0.1248773, -0.2070291, 2.324171, 0, 0.6705883, 1, 1,
0.1271949, 2.353815, -0.8592803, 0, 0.6627451, 1, 1,
0.1344347, 0.7871634, -0.7847632, 0, 0.6588235, 1, 1,
0.1346683, 0.3037185, 1.072402, 0, 0.6509804, 1, 1,
0.1367011, 0.1315591, 2.843688, 0, 0.6470588, 1, 1,
0.1368688, -0.557359, 2.619757, 0, 0.6392157, 1, 1,
0.1416335, 1.64512, 2.921419, 0, 0.6352941, 1, 1,
0.1460899, -0.7599519, 3.089357, 0, 0.627451, 1, 1,
0.1491312, 0.8228099, -0.5665631, 0, 0.6235294, 1, 1,
0.1575084, 0.370756, 1.25192, 0, 0.6156863, 1, 1,
0.1576979, 0.7740925, -0.7781176, 0, 0.6117647, 1, 1,
0.1605471, 1.789587, 2.240216, 0, 0.6039216, 1, 1,
0.1657126, -1.232876, 3.162978, 0, 0.5960785, 1, 1,
0.1684052, 1.349281, -0.9356194, 0, 0.5921569, 1, 1,
0.1685229, -0.9599256, 3.303246, 0, 0.5843138, 1, 1,
0.168798, -1.056291, 3.667927, 0, 0.5803922, 1, 1,
0.1707147, 0.3053356, -0.7075869, 0, 0.572549, 1, 1,
0.1726118, 0.5375004, -0.2491536, 0, 0.5686275, 1, 1,
0.1767525, 0.102545, 0.3868113, 0, 0.5607843, 1, 1,
0.1805723, -0.03086354, 2.461777, 0, 0.5568628, 1, 1,
0.184891, 1.074893, -0.3331546, 0, 0.5490196, 1, 1,
0.184917, 0.3932139, -0.967483, 0, 0.5450981, 1, 1,
0.1856826, -1.044858, 2.393866, 0, 0.5372549, 1, 1,
0.1891805, -0.3537399, 2.298165, 0, 0.5333334, 1, 1,
0.1959044, -1.057762, 4.833426, 0, 0.5254902, 1, 1,
0.196648, 1.123621, -1.487249, 0, 0.5215687, 1, 1,
0.2006226, 0.5477744, 1.054163, 0, 0.5137255, 1, 1,
0.2030956, -0.3155512, 3.029366, 0, 0.509804, 1, 1,
0.2044384, 0.06873231, -0.8279318, 0, 0.5019608, 1, 1,
0.2092866, 0.09457872, 0.8875507, 0, 0.4941176, 1, 1,
0.2103792, 0.06843705, 2.344432, 0, 0.4901961, 1, 1,
0.2108463, -1.368354, 3.099323, 0, 0.4823529, 1, 1,
0.2147126, -0.813382, 2.468619, 0, 0.4784314, 1, 1,
0.2177887, -2.388358, 3.343333, 0, 0.4705882, 1, 1,
0.2206876, -1.133189, 1.420932, 0, 0.4666667, 1, 1,
0.2207456, 2.104568, 0.02700633, 0, 0.4588235, 1, 1,
0.22115, -2.138555, 4.09202, 0, 0.454902, 1, 1,
0.2224652, -0.1310494, 3.351774, 0, 0.4470588, 1, 1,
0.2283624, 0.5573465, 1.595669, 0, 0.4431373, 1, 1,
0.232812, 0.05994264, 0.4237817, 0, 0.4352941, 1, 1,
0.2343298, -0.6188232, 2.364776, 0, 0.4313726, 1, 1,
0.2368037, 1.448038, -0.9551499, 0, 0.4235294, 1, 1,
0.2395597, -0.01128395, 2.249198, 0, 0.4196078, 1, 1,
0.2437446, -0.6922719, 2.432771, 0, 0.4117647, 1, 1,
0.2440018, -1.515912, 4.354589, 0, 0.4078431, 1, 1,
0.2446025, -0.6844894, 1.755769, 0, 0.4, 1, 1,
0.2468725, -0.6087115, 2.665681, 0, 0.3921569, 1, 1,
0.2521856, 0.07669928, 1.48049, 0, 0.3882353, 1, 1,
0.2555282, 0.06698438, 1.723946, 0, 0.3803922, 1, 1,
0.2569601, 1.939631, -1.303355, 0, 0.3764706, 1, 1,
0.2578181, 0.5473081, 2.44825, 0, 0.3686275, 1, 1,
0.2672136, 0.3895229, 2.078716, 0, 0.3647059, 1, 1,
0.2695373, 0.5225214, 0.5606293, 0, 0.3568628, 1, 1,
0.2714529, 0.2080997, 0.5313135, 0, 0.3529412, 1, 1,
0.2722839, 0.2423272, 1.338522, 0, 0.345098, 1, 1,
0.2765284, -0.8872356, 3.082272, 0, 0.3411765, 1, 1,
0.2775908, 1.467525, 1.117959, 0, 0.3333333, 1, 1,
0.2793514, 0.8126542, 0.8153673, 0, 0.3294118, 1, 1,
0.2814054, -1.387883, 2.337752, 0, 0.3215686, 1, 1,
0.2818866, 1.467582, -1.325536, 0, 0.3176471, 1, 1,
0.282005, -1.407784, 3.311201, 0, 0.3098039, 1, 1,
0.2939667, -2.89643, 3.330461, 0, 0.3058824, 1, 1,
0.2948647, 0.4972441, 0.1839435, 0, 0.2980392, 1, 1,
0.3013162, 0.6894265, 0.4600152, 0, 0.2901961, 1, 1,
0.3213388, 0.6157757, 0.8267441, 0, 0.2862745, 1, 1,
0.3251636, 1.099533, 2.268044, 0, 0.2784314, 1, 1,
0.3275627, -1.092419, 2.401191, 0, 0.2745098, 1, 1,
0.3327709, 0.1420987, 1.353165, 0, 0.2666667, 1, 1,
0.3331839, 1.215337, 1.024633, 0, 0.2627451, 1, 1,
0.3336312, 0.3062371, -1.637345, 0, 0.254902, 1, 1,
0.3408171, 0.8861992, 0.3885043, 0, 0.2509804, 1, 1,
0.3420239, 0.04814775, 2.366811, 0, 0.2431373, 1, 1,
0.3481472, -0.9827129, 3.451612, 0, 0.2392157, 1, 1,
0.3483811, 1.443316, 0.7615748, 0, 0.2313726, 1, 1,
0.3500398, 0.302473, -0.7438048, 0, 0.227451, 1, 1,
0.3502865, 1.006444, 0.620236, 0, 0.2196078, 1, 1,
0.3510469, -0.2040062, 4.073581, 0, 0.2156863, 1, 1,
0.3578782, 0.03154807, 1.025339, 0, 0.2078431, 1, 1,
0.3647759, -0.8543661, 0.3991634, 0, 0.2039216, 1, 1,
0.3689703, 1.293471, 2.296401, 0, 0.1960784, 1, 1,
0.3689957, -0.6467564, 3.756958, 0, 0.1882353, 1, 1,
0.3737939, -0.2384341, 3.347881, 0, 0.1843137, 1, 1,
0.3759367, 0.7500619, 1.771539, 0, 0.1764706, 1, 1,
0.3764737, -0.1242631, 2.875372, 0, 0.172549, 1, 1,
0.3805989, 0.7853427, -0.24722, 0, 0.1647059, 1, 1,
0.3825519, -1.117175, 2.670996, 0, 0.1607843, 1, 1,
0.3854574, -0.7616643, 2.667408, 0, 0.1529412, 1, 1,
0.3899037, -0.6150197, 1.007505, 0, 0.1490196, 1, 1,
0.3901485, 1.178485, 0.2231467, 0, 0.1411765, 1, 1,
0.3948236, 1.23543, -1.095892, 0, 0.1372549, 1, 1,
0.3975086, 0.9823994, 2.212552, 0, 0.1294118, 1, 1,
0.3981806, 0.5784435, 1.040847, 0, 0.1254902, 1, 1,
0.3992569, 1.559885, 0.8134574, 0, 0.1176471, 1, 1,
0.400149, 0.2414007, -0.3081966, 0, 0.1137255, 1, 1,
0.4046236, 0.7485061, 1.198856, 0, 0.1058824, 1, 1,
0.406748, 0.7698299, 1.243233, 0, 0.09803922, 1, 1,
0.4081359, 0.4184152, 0.4171318, 0, 0.09411765, 1, 1,
0.4085131, -0.9597693, 3.710146, 0, 0.08627451, 1, 1,
0.4098228, -0.06711215, -1.2037, 0, 0.08235294, 1, 1,
0.4119098, 0.5548165, -0.2975721, 0, 0.07450981, 1, 1,
0.4128567, 1.580233, -0.2552878, 0, 0.07058824, 1, 1,
0.4137083, -0.4884804, 1.38487, 0, 0.0627451, 1, 1,
0.4212305, 2.122369, 0.1405233, 0, 0.05882353, 1, 1,
0.4238977, -0.05359066, 1.535093, 0, 0.05098039, 1, 1,
0.429983, 1.049752, 1.976676, 0, 0.04705882, 1, 1,
0.4370104, -0.8865294, 2.020729, 0, 0.03921569, 1, 1,
0.4440541, 0.479358, -0.7748731, 0, 0.03529412, 1, 1,
0.4443305, -0.207895, 2.097084, 0, 0.02745098, 1, 1,
0.4482093, 0.7319299, -0.7881874, 0, 0.02352941, 1, 1,
0.4501511, 1.029245, 1.146075, 0, 0.01568628, 1, 1,
0.4514956, 0.1447336, -1.281211, 0, 0.01176471, 1, 1,
0.4526118, 1.20048, 0.2787043, 0, 0.003921569, 1, 1,
0.4638374, -1.13191, 3.196606, 0.003921569, 0, 1, 1,
0.463915, -2.175821, 1.870868, 0.007843138, 0, 1, 1,
0.4679477, 0.3840821, 2.186466, 0.01568628, 0, 1, 1,
0.4682378, -0.3163801, 1.948212, 0.01960784, 0, 1, 1,
0.4708131, 0.3777825, 1.846302, 0.02745098, 0, 1, 1,
0.4715855, 0.5787397, 1.020845, 0.03137255, 0, 1, 1,
0.4721404, -0.2517694, 2.913718, 0.03921569, 0, 1, 1,
0.4754094, 1.857709, 0.7147127, 0.04313726, 0, 1, 1,
0.4774775, -0.4813502, 2.217765, 0.05098039, 0, 1, 1,
0.4820338, 0.4652714, 1.647238, 0.05490196, 0, 1, 1,
0.4820827, -0.2985911, 3.30165, 0.0627451, 0, 1, 1,
0.4878335, 0.5684363, -0.1227078, 0.06666667, 0, 1, 1,
0.4918534, 0.3604986, 0.2277866, 0.07450981, 0, 1, 1,
0.5023943, -0.7106684, 2.398932, 0.07843138, 0, 1, 1,
0.5069524, -0.415704, 3.27825, 0.08627451, 0, 1, 1,
0.5077512, -2.355155, 3.927524, 0.09019608, 0, 1, 1,
0.5159559, 0.8916101, 0.4478432, 0.09803922, 0, 1, 1,
0.5169728, 0.7606074, 0.3887981, 0.1058824, 0, 1, 1,
0.5170025, -0.3553906, 2.796332, 0.1098039, 0, 1, 1,
0.5179651, 0.2008095, 1.400912, 0.1176471, 0, 1, 1,
0.5210987, 0.7224493, 2.144769, 0.1215686, 0, 1, 1,
0.5237619, -2.148635, 2.92717, 0.1294118, 0, 1, 1,
0.5261319, -0.4763539, 2.640538, 0.1333333, 0, 1, 1,
0.529623, -0.4577241, 2.880796, 0.1411765, 0, 1, 1,
0.5329241, 1.263018, 1.051288, 0.145098, 0, 1, 1,
0.5351676, 0.3312579, -0.4268507, 0.1529412, 0, 1, 1,
0.539019, -0.08543619, 2.226542, 0.1568628, 0, 1, 1,
0.5426064, 0.8362029, 0.8201858, 0.1647059, 0, 1, 1,
0.5511566, -1.091095, 2.811836, 0.1686275, 0, 1, 1,
0.5566076, 0.1892861, 1.876567, 0.1764706, 0, 1, 1,
0.5738297, -0.143766, 2.580224, 0.1803922, 0, 1, 1,
0.5744119, -0.946118, 3.074996, 0.1882353, 0, 1, 1,
0.5783491, -1.960633, 1.802592, 0.1921569, 0, 1, 1,
0.5859736, 0.5308485, -0.232562, 0.2, 0, 1, 1,
0.5898135, -0.9983624, 2.675603, 0.2078431, 0, 1, 1,
0.5952384, 0.3647067, 3.286771, 0.2117647, 0, 1, 1,
0.595407, -1.346472, 1.293991, 0.2196078, 0, 1, 1,
0.5986292, 0.2993126, 1.688788, 0.2235294, 0, 1, 1,
0.599546, 1.216986, -0.6417453, 0.2313726, 0, 1, 1,
0.6027057, -0.998819, 2.324086, 0.2352941, 0, 1, 1,
0.6067643, 1.146855, -0.6098516, 0.2431373, 0, 1, 1,
0.614908, 2.775372, 0.3752002, 0.2470588, 0, 1, 1,
0.615915, 0.3123333, 2.270288, 0.254902, 0, 1, 1,
0.6200347, 0.0987078, 2.104168, 0.2588235, 0, 1, 1,
0.6274863, -0.6400056, 3.949286, 0.2666667, 0, 1, 1,
0.6286026, -0.2487668, 1.8804, 0.2705882, 0, 1, 1,
0.630557, -2.123034, 2.798562, 0.2784314, 0, 1, 1,
0.6329316, -0.8133284, 2.766754, 0.282353, 0, 1, 1,
0.6337602, -1.755402, 4.400453, 0.2901961, 0, 1, 1,
0.639233, 0.7806048, -0.116653, 0.2941177, 0, 1, 1,
0.6420234, 1.106277, 1.036291, 0.3019608, 0, 1, 1,
0.6448203, -0.8538442, 1.583278, 0.3098039, 0, 1, 1,
0.6457719, 0.002561321, 1.494018, 0.3137255, 0, 1, 1,
0.649455, -0.3529145, 4.343454, 0.3215686, 0, 1, 1,
0.6501383, -0.6521886, 2.329852, 0.3254902, 0, 1, 1,
0.6506962, -0.2501548, 3.810034, 0.3333333, 0, 1, 1,
0.6511978, -0.009873003, 0.01523272, 0.3372549, 0, 1, 1,
0.6537722, -0.9110681, 3.157537, 0.345098, 0, 1, 1,
0.6543966, 1.900178, 1.2557, 0.3490196, 0, 1, 1,
0.6544505, -0.009517425, 1.511031, 0.3568628, 0, 1, 1,
0.6566591, -0.06262069, 2.470821, 0.3607843, 0, 1, 1,
0.6585768, -0.2863023, 2.760241, 0.3686275, 0, 1, 1,
0.6680706, 0.5016975, 1.944444, 0.372549, 0, 1, 1,
0.6729898, 0.3075745, 1.596933, 0.3803922, 0, 1, 1,
0.6754115, -0.1598628, 1.429366, 0.3843137, 0, 1, 1,
0.6776487, -1.380764, 1.344563, 0.3921569, 0, 1, 1,
0.6846119, -1.253788, 3.488425, 0.3960784, 0, 1, 1,
0.6847452, 1.536144, 0.1029351, 0.4039216, 0, 1, 1,
0.6859025, 2.542592, 0.7472897, 0.4117647, 0, 1, 1,
0.6872692, 1.903294, 0.1789091, 0.4156863, 0, 1, 1,
0.6876649, -0.4531628, 1.895203, 0.4235294, 0, 1, 1,
0.6894695, -0.8917993, 2.44177, 0.427451, 0, 1, 1,
0.6903325, -1.000643, 3.116025, 0.4352941, 0, 1, 1,
0.6904085, 1.482447, -1.248141, 0.4392157, 0, 1, 1,
0.6961436, -0.07425199, 0.7915451, 0.4470588, 0, 1, 1,
0.6966748, 0.5976714, 1.789333, 0.4509804, 0, 1, 1,
0.7074285, 0.2645709, 2.155755, 0.4588235, 0, 1, 1,
0.70877, -1.0251, 2.065833, 0.4627451, 0, 1, 1,
0.7088442, -1.00761, 2.955206, 0.4705882, 0, 1, 1,
0.722207, -0.8869091, 2.833949, 0.4745098, 0, 1, 1,
0.7256768, -1.088378, 1.773874, 0.4823529, 0, 1, 1,
0.7267933, -0.7394542, 2.16066, 0.4862745, 0, 1, 1,
0.7268933, 0.9041793, 1.296293, 0.4941176, 0, 1, 1,
0.7313179, 0.3251589, -0.2041003, 0.5019608, 0, 1, 1,
0.7315542, 0.7892539, 0.08889275, 0.5058824, 0, 1, 1,
0.7338018, 0.1562798, 1.443146, 0.5137255, 0, 1, 1,
0.7348373, 0.1894228, 0.6180624, 0.5176471, 0, 1, 1,
0.7356627, 2.796551, 1.187343, 0.5254902, 0, 1, 1,
0.7360215, 0.5308335, 0.8300304, 0.5294118, 0, 1, 1,
0.7386207, 0.1128027, 2.858608, 0.5372549, 0, 1, 1,
0.7416641, -0.1359951, 0.6297153, 0.5411765, 0, 1, 1,
0.7431376, -1.328434, 2.299349, 0.5490196, 0, 1, 1,
0.7462997, -1.233388, 1.473501, 0.5529412, 0, 1, 1,
0.751847, -0.4763215, 0.7094852, 0.5607843, 0, 1, 1,
0.7523441, 0.07960082, 2.472841, 0.5647059, 0, 1, 1,
0.7530855, -0.304542, 1.981621, 0.572549, 0, 1, 1,
0.7535905, -0.5500072, 2.561346, 0.5764706, 0, 1, 1,
0.7566419, 2.068714, 0.5657837, 0.5843138, 0, 1, 1,
0.7724214, -0.8718927, 1.316772, 0.5882353, 0, 1, 1,
0.7792663, -0.0995957, 3.174877, 0.5960785, 0, 1, 1,
0.7804486, -0.401105, 2.041682, 0.6039216, 0, 1, 1,
0.7844991, -0.8301095, 1.777318, 0.6078432, 0, 1, 1,
0.7849588, -0.3810751, 2.391513, 0.6156863, 0, 1, 1,
0.786366, 1.698863, 0.9559413, 0.6196079, 0, 1, 1,
0.7864217, -0.264827, 0.9197467, 0.627451, 0, 1, 1,
0.7867774, -1.669241, 0.1495496, 0.6313726, 0, 1, 1,
0.7901255, 1.423876, 0.02799327, 0.6392157, 0, 1, 1,
0.7921042, -1.017163, 2.200671, 0.6431373, 0, 1, 1,
0.7956762, 0.9921709, 0.6374975, 0.6509804, 0, 1, 1,
0.7992777, 0.3123945, 1.343193, 0.654902, 0, 1, 1,
0.8003876, -0.4449757, 2.197907, 0.6627451, 0, 1, 1,
0.8006688, 0.5314242, -0.5670281, 0.6666667, 0, 1, 1,
0.8040718, -0.5968868, 2.264295, 0.6745098, 0, 1, 1,
0.8092306, -0.1097648, -0.0598977, 0.6784314, 0, 1, 1,
0.8124164, -0.5966331, 2.993034, 0.6862745, 0, 1, 1,
0.8136923, 1.229214, 2.26919, 0.6901961, 0, 1, 1,
0.8157298, -1.312722, 4.150362, 0.6980392, 0, 1, 1,
0.8229392, -1.468195, 3.08445, 0.7058824, 0, 1, 1,
0.8239434, 1.128424, 1.033597, 0.7098039, 0, 1, 1,
0.8264477, 2.27077, 0.8719991, 0.7176471, 0, 1, 1,
0.8327441, -1.817511, 1.768745, 0.7215686, 0, 1, 1,
0.8450235, 0.5799151, 0.9279722, 0.7294118, 0, 1, 1,
0.8475935, 0.7162076, 1.135387, 0.7333333, 0, 1, 1,
0.8504643, -2.211586, 3.281274, 0.7411765, 0, 1, 1,
0.8539383, 1.661424, -0.8613411, 0.7450981, 0, 1, 1,
0.8543026, -1.560073, 2.276629, 0.7529412, 0, 1, 1,
0.8559093, 0.004878126, 1.675418, 0.7568628, 0, 1, 1,
0.8569443, 0.23344, 3.122537, 0.7647059, 0, 1, 1,
0.8582424, -0.7883906, 0.236515, 0.7686275, 0, 1, 1,
0.8589644, 0.08328401, 1.732173, 0.7764706, 0, 1, 1,
0.85936, 0.6534491, 1.641192, 0.7803922, 0, 1, 1,
0.8620338, 0.5930012, 3.182003, 0.7882353, 0, 1, 1,
0.86618, 0.4964515, 0.4542041, 0.7921569, 0, 1, 1,
0.8673074, -0.2395266, 3.280932, 0.8, 0, 1, 1,
0.8693889, -0.9749452, 1.905212, 0.8078431, 0, 1, 1,
0.8730386, -0.3895432, 1.712007, 0.8117647, 0, 1, 1,
0.8759432, -0.8030114, 4.480202, 0.8196079, 0, 1, 1,
0.87752, -1.616631, 1.979944, 0.8235294, 0, 1, 1,
0.8922257, -0.07242591, 0.4676318, 0.8313726, 0, 1, 1,
0.8945891, 0.2051383, 2.431276, 0.8352941, 0, 1, 1,
0.8949614, -1.261376, 4.202652, 0.8431373, 0, 1, 1,
0.9010116, -0.1719623, 0.351093, 0.8470588, 0, 1, 1,
0.9034927, 1.29423, -0.3282419, 0.854902, 0, 1, 1,
0.9040012, -0.9243284, 1.819282, 0.8588235, 0, 1, 1,
0.9058688, 0.1108725, 2.869547, 0.8666667, 0, 1, 1,
0.9076517, -0.3906692, 1.498118, 0.8705882, 0, 1, 1,
0.9088194, -0.9616725, 3.195632, 0.8784314, 0, 1, 1,
0.9122621, 0.3175012, 0.8335733, 0.8823529, 0, 1, 1,
0.9155444, -1.128838, 1.723477, 0.8901961, 0, 1, 1,
0.9176111, -1.010464, 0.601957, 0.8941177, 0, 1, 1,
0.9307402, 1.272021, 0.8325502, 0.9019608, 0, 1, 1,
0.9334475, 0.4218733, 1.620154, 0.9098039, 0, 1, 1,
0.940248, -1.134441, 2.541512, 0.9137255, 0, 1, 1,
0.9436494, -1.473252, 3.755731, 0.9215686, 0, 1, 1,
0.9472429, 0.4806788, 1.037146, 0.9254902, 0, 1, 1,
0.9499929, 2.869307, 1.297122, 0.9333333, 0, 1, 1,
0.9507886, 0.1773877, 1.070806, 0.9372549, 0, 1, 1,
0.9515663, 1.908537, -1.495165, 0.945098, 0, 1, 1,
0.952612, 1.241309, -0.3119183, 0.9490196, 0, 1, 1,
0.9581984, 0.05471915, 1.124175, 0.9568627, 0, 1, 1,
0.9606293, 0.5435991, 2.686901, 0.9607843, 0, 1, 1,
0.9640511, -0.9256052, 3.898515, 0.9686275, 0, 1, 1,
0.9664295, 1.271914, -0.2638663, 0.972549, 0, 1, 1,
0.9683632, 0.5753301, 1.305398, 0.9803922, 0, 1, 1,
0.9691401, 0.1707828, 0.573146, 0.9843137, 0, 1, 1,
0.9724576, 1.045524, 0.4232492, 0.9921569, 0, 1, 1,
0.9796593, 0.6929882, -0.1327336, 0.9960784, 0, 1, 1,
0.9883953, 1.58144, 0.1956772, 1, 0, 0.9960784, 1,
0.9945198, -0.09708986, 1.441151, 1, 0, 0.9882353, 1,
0.9952581, -1.139435, 1.449019, 1, 0, 0.9843137, 1,
1.007387, -0.6004249, 2.962724, 1, 0, 0.9764706, 1,
1.008358, -0.06521133, 1.059964, 1, 0, 0.972549, 1,
1.011677, 0.4821041, 0.3185144, 1, 0, 0.9647059, 1,
1.014258, 0.138403, 2.05083, 1, 0, 0.9607843, 1,
1.0178, -1.211191, 2.873306, 1, 0, 0.9529412, 1,
1.018393, -2.088937, 2.984463, 1, 0, 0.9490196, 1,
1.01842, -0.76648, 0.3290426, 1, 0, 0.9411765, 1,
1.024378, 0.5676171, 2.099075, 1, 0, 0.9372549, 1,
1.024996, -0.5472651, 3.167053, 1, 0, 0.9294118, 1,
1.025331, -0.9562196, 1.800232, 1, 0, 0.9254902, 1,
1.027659, 0.4641793, 1.066208, 1, 0, 0.9176471, 1,
1.033417, -0.2815678, 2.13466, 1, 0, 0.9137255, 1,
1.035754, 0.5482785, 1.977203, 1, 0, 0.9058824, 1,
1.03705, 0.1897251, 1.48465, 1, 0, 0.9019608, 1,
1.048813, -0.3659217, 0.1329682, 1, 0, 0.8941177, 1,
1.049583, -0.003631453, 1.047473, 1, 0, 0.8862745, 1,
1.064618, -0.6337357, 1.601731, 1, 0, 0.8823529, 1,
1.066018, -0.1916332, 2.266894, 1, 0, 0.8745098, 1,
1.066427, -0.7055942, 0.6510559, 1, 0, 0.8705882, 1,
1.06992, 0.7161068, 1.538595, 1, 0, 0.8627451, 1,
1.075165, -0.2140558, 1.464378, 1, 0, 0.8588235, 1,
1.081245, -0.2500841, 1.471293, 1, 0, 0.8509804, 1,
1.083372, 0.07551455, 0.09000514, 1, 0, 0.8470588, 1,
1.084295, 0.1258194, 2.572212, 1, 0, 0.8392157, 1,
1.085354, -0.7241612, 2.677354, 1, 0, 0.8352941, 1,
1.096315, -1.619835, 2.368156, 1, 0, 0.827451, 1,
1.097073, 0.6373232, 0.6027519, 1, 0, 0.8235294, 1,
1.112161, 0.5510051, 2.162803, 1, 0, 0.8156863, 1,
1.117476, -0.9108889, 0.2132834, 1, 0, 0.8117647, 1,
1.149154, 1.605558, 1.843221, 1, 0, 0.8039216, 1,
1.152167, -1.056714, 2.238951, 1, 0, 0.7960784, 1,
1.152447, 1.250594, 0.7563496, 1, 0, 0.7921569, 1,
1.155402, 0.8342416, -0.8486908, 1, 0, 0.7843137, 1,
1.156362, -0.1902735, 2.645763, 1, 0, 0.7803922, 1,
1.166974, 1.623412, -0.5376269, 1, 0, 0.772549, 1,
1.168503, 0.5971873, -1.03075, 1, 0, 0.7686275, 1,
1.182842, 0.0272952, 0.805013, 1, 0, 0.7607843, 1,
1.186768, -1.105112, 4.573915, 1, 0, 0.7568628, 1,
1.187503, -0.4688691, 2.301692, 1, 0, 0.7490196, 1,
1.189162, 0.1800754, 2.207129, 1, 0, 0.7450981, 1,
1.189451, 1.783916, 0.3378169, 1, 0, 0.7372549, 1,
1.190108, -1.224805, 1.772494, 1, 0, 0.7333333, 1,
1.190637, 0.3129659, 1.733945, 1, 0, 0.7254902, 1,
1.210084, -0.8537078, 4.15398, 1, 0, 0.7215686, 1,
1.214674, 0.1933406, -0.8442651, 1, 0, 0.7137255, 1,
1.216998, 1.210059, 0.2190838, 1, 0, 0.7098039, 1,
1.22717, 0.5022341, 2.327376, 1, 0, 0.7019608, 1,
1.229115, -0.9757094, 3.716804, 1, 0, 0.6941177, 1,
1.23408, 0.3326775, 0.6251913, 1, 0, 0.6901961, 1,
1.237068, 0.6062764, 3.025713, 1, 0, 0.682353, 1,
1.243024, 0.1639541, 0.367117, 1, 0, 0.6784314, 1,
1.246619, -0.6852893, 1.32748, 1, 0, 0.6705883, 1,
1.247757, -1.230182, 2.173967, 1, 0, 0.6666667, 1,
1.248647, 0.17626, 1.278306, 1, 0, 0.6588235, 1,
1.265479, 0.078347, 3.258011, 1, 0, 0.654902, 1,
1.270586, 0.9729577, -0.2150327, 1, 0, 0.6470588, 1,
1.274248, -0.2592969, 1.450442, 1, 0, 0.6431373, 1,
1.283469, 0.4485787, 1.101514, 1, 0, 0.6352941, 1,
1.285484, -0.01263414, 2.657315, 1, 0, 0.6313726, 1,
1.28906, 0.1048786, 2.950554, 1, 0, 0.6235294, 1,
1.29199, 1.129066, -0.5427327, 1, 0, 0.6196079, 1,
1.294622, -1.025468, 2.404177, 1, 0, 0.6117647, 1,
1.306047, -0.9193591, 2.990596, 1, 0, 0.6078432, 1,
1.315189, -0.3516209, 2.332505, 1, 0, 0.6, 1,
1.318264, 0.7508702, -0.04932577, 1, 0, 0.5921569, 1,
1.320395, 1.598383, 2.480845, 1, 0, 0.5882353, 1,
1.329102, 0.8135139, 1.146903, 1, 0, 0.5803922, 1,
1.330489, 0.5383609, -0.3260898, 1, 0, 0.5764706, 1,
1.333478, 0.5035294, 1.913474, 1, 0, 0.5686275, 1,
1.342648, 2.450948, -0.1936996, 1, 0, 0.5647059, 1,
1.342857, -0.7192786, 3.447866, 1, 0, 0.5568628, 1,
1.345925, 1.498682, 1.194736, 1, 0, 0.5529412, 1,
1.348014, 1.62629, 0.4423411, 1, 0, 0.5450981, 1,
1.350022, -0.5592991, 0.7641849, 1, 0, 0.5411765, 1,
1.35337, -0.7409055, 2.618815, 1, 0, 0.5333334, 1,
1.354356, -0.1909273, 2.352147, 1, 0, 0.5294118, 1,
1.358799, 1.515314, 0.1983707, 1, 0, 0.5215687, 1,
1.367881, 0.4263086, 2.261968, 1, 0, 0.5176471, 1,
1.368147, 0.1707691, 1.534758, 1, 0, 0.509804, 1,
1.368824, 1.799639, -1.637855, 1, 0, 0.5058824, 1,
1.383973, 0.6678297, 0.1788422, 1, 0, 0.4980392, 1,
1.404104, 0.7352327, 1.80694, 1, 0, 0.4901961, 1,
1.408091, -0.4191506, 1.336423, 1, 0, 0.4862745, 1,
1.411846, -1.215666, 3.357758, 1, 0, 0.4784314, 1,
1.416601, -0.6298922, 1.679993, 1, 0, 0.4745098, 1,
1.422898, 1.041223, 0.08558038, 1, 0, 0.4666667, 1,
1.440659, -0.6404134, 2.102601, 1, 0, 0.4627451, 1,
1.453471, -1.20815, 1.171351, 1, 0, 0.454902, 1,
1.466039, 0.9679614, 1.660208, 1, 0, 0.4509804, 1,
1.474168, 0.4701538, 2.607922, 1, 0, 0.4431373, 1,
1.48052, -0.3251753, 1.290696, 1, 0, 0.4392157, 1,
1.480895, -0.1642751, 3.499645, 1, 0, 0.4313726, 1,
1.481374, 0.5443857, 0.3841497, 1, 0, 0.427451, 1,
1.483924, 0.9844711, 1.34008, 1, 0, 0.4196078, 1,
1.486638, 0.5799375, 1.608332, 1, 0, 0.4156863, 1,
1.491405, -0.2887392, 3.736998, 1, 0, 0.4078431, 1,
1.496164, 0.8462643, -0.280991, 1, 0, 0.4039216, 1,
1.499093, 0.8020852, -0.3279464, 1, 0, 0.3960784, 1,
1.503293, 1.946517, 1.571841, 1, 0, 0.3882353, 1,
1.505777, -0.2892712, 1.443215, 1, 0, 0.3843137, 1,
1.509227, 0.361011, 1.095668, 1, 0, 0.3764706, 1,
1.527842, -1.063755, 3.686035, 1, 0, 0.372549, 1,
1.536263, -2.622936, 0.5548631, 1, 0, 0.3647059, 1,
1.540252, -0.4060687, 2.451346, 1, 0, 0.3607843, 1,
1.549146, -0.5271617, 2.014456, 1, 0, 0.3529412, 1,
1.554234, 0.4435538, 0.9877149, 1, 0, 0.3490196, 1,
1.559655, -0.5196506, 3.542029, 1, 0, 0.3411765, 1,
1.56844, 1.72103, 0.9400028, 1, 0, 0.3372549, 1,
1.597518, 1.991412, 0.2847743, 1, 0, 0.3294118, 1,
1.599072, 0.09990375, 3.632484, 1, 0, 0.3254902, 1,
1.611639, -0.3962693, 1.56817, 1, 0, 0.3176471, 1,
1.638311, 1.49781, 1.966172, 1, 0, 0.3137255, 1,
1.655343, 0.1759567, 2.246219, 1, 0, 0.3058824, 1,
1.688717, 2.233516, 1.509498, 1, 0, 0.2980392, 1,
1.697244, 0.7490184, 2.051325, 1, 0, 0.2941177, 1,
1.697343, -0.8134785, 1.018921, 1, 0, 0.2862745, 1,
1.723149, 1.009312, -0.7171861, 1, 0, 0.282353, 1,
1.727633, -0.1289906, 0.801671, 1, 0, 0.2745098, 1,
1.740237, 0.499602, 1.680796, 1, 0, 0.2705882, 1,
1.743458, -0.06978618, 3.596504, 1, 0, 0.2627451, 1,
1.752062, 0.4830726, 0.8266782, 1, 0, 0.2588235, 1,
1.756499, -0.19924, 2.295609, 1, 0, 0.2509804, 1,
1.759772, -0.9218143, 2.172774, 1, 0, 0.2470588, 1,
1.785689, 1.84683, -0.04067515, 1, 0, 0.2392157, 1,
1.801906, -0.568632, 1.725995, 1, 0, 0.2352941, 1,
1.818518, 0.4370011, 2.510538, 1, 0, 0.227451, 1,
1.835021, 1.470533, 0.267335, 1, 0, 0.2235294, 1,
1.876454, 0.6431891, 2.261845, 1, 0, 0.2156863, 1,
1.88203, 0.8223373, -0.3543613, 1, 0, 0.2117647, 1,
1.885499, 0.3134923, 2.210342, 1, 0, 0.2039216, 1,
1.893988, -0.1820023, 3.183179, 1, 0, 0.1960784, 1,
1.920925, 1.424462, 2.184182, 1, 0, 0.1921569, 1,
1.931723, -1.084544, 3.411999, 1, 0, 0.1843137, 1,
1.9389, 0.9608802, 0.2931312, 1, 0, 0.1803922, 1,
1.939417, 0.04436455, 2.18241, 1, 0, 0.172549, 1,
1.939651, 0.08759156, 1.181746, 1, 0, 0.1686275, 1,
1.939759, -0.3396713, 1.84138, 1, 0, 0.1607843, 1,
1.954421, -0.4007538, 1.918421, 1, 0, 0.1568628, 1,
1.958634, 0.3426303, 1.094469, 1, 0, 0.1490196, 1,
1.987908, -2.32842, 1.778182, 1, 0, 0.145098, 1,
1.99294, 0.860799, 0.3077054, 1, 0, 0.1372549, 1,
2.010036, -0.01997009, 1.324213, 1, 0, 0.1333333, 1,
2.042471, 1.097826, 2.843111, 1, 0, 0.1254902, 1,
2.049669, 1.847277, 2.850987, 1, 0, 0.1215686, 1,
2.072723, -0.01190239, -0.2697544, 1, 0, 0.1137255, 1,
2.092114, -3.475645, 1.962144, 1, 0, 0.1098039, 1,
2.093466, -1.591913, 2.396162, 1, 0, 0.1019608, 1,
2.101371, 2.071739, 0.5991708, 1, 0, 0.09411765, 1,
2.118896, -0.09770538, 2.004198, 1, 0, 0.09019608, 1,
2.126937, -0.5710641, 2.257688, 1, 0, 0.08235294, 1,
2.133034, 0.4504552, 1.793308, 1, 0, 0.07843138, 1,
2.147881, -0.6297089, 1.693117, 1, 0, 0.07058824, 1,
2.165795, -0.143059, 2.072829, 1, 0, 0.06666667, 1,
2.21179, -0.5378348, 2.806306, 1, 0, 0.05882353, 1,
2.216195, -1.111399, 1.268517, 1, 0, 0.05490196, 1,
2.237236, -0.6667237, 1.763571, 1, 0, 0.04705882, 1,
2.281397, 1.038298, 1.295535, 1, 0, 0.04313726, 1,
2.341871, 2.704684, 2.577579, 1, 0, 0.03529412, 1,
2.401647, 0.280374, 1.558375, 1, 0, 0.03137255, 1,
2.518788, -0.8115175, 2.046951, 1, 0, 0.02352941, 1,
2.58846, -0.9685292, 1.818412, 1, 0, 0.01960784, 1,
2.669359, -1.383686, 2.15994, 1, 0, 0.01176471, 1,
2.882987, 0.865849, -0.1429455, 1, 0, 0.007843138, 1
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
-0.1040493, -4.650366, -8.615168, 0, -0.5, 0.5, 0.5,
-0.1040493, -4.650366, -8.615168, 1, -0.5, 0.5, 0.5,
-0.1040493, -4.650366, -8.615168, 1, 1.5, 0.5, 0.5,
-0.1040493, -4.650366, -8.615168, 0, 1.5, 0.5, 0.5
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
-4.103691, -0.01039064, -8.615168, 0, -0.5, 0.5, 0.5,
-4.103691, -0.01039064, -8.615168, 1, -0.5, 0.5, 0.5,
-4.103691, -0.01039064, -8.615168, 1, 1.5, 0.5, 0.5,
-4.103691, -0.01039064, -8.615168, 0, 1.5, 0.5, 0.5
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
-4.103691, -4.650366, -0.8309765, 0, -0.5, 0.5, 0.5,
-4.103691, -4.650366, -0.8309765, 1, -0.5, 0.5, 0.5,
-4.103691, -4.650366, -0.8309765, 1, 1.5, 0.5, 0.5,
-4.103691, -4.650366, -0.8309765, 0, 1.5, 0.5, 0.5
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
-3, -3.579602, -6.818816,
2, -3.579602, -6.818816,
-3, -3.579602, -6.818816,
-3, -3.758063, -7.118207,
-2, -3.579602, -6.818816,
-2, -3.758063, -7.118207,
-1, -3.579602, -6.818816,
-1, -3.758063, -7.118207,
0, -3.579602, -6.818816,
0, -3.758063, -7.118207,
1, -3.579602, -6.818816,
1, -3.758063, -7.118207,
2, -3.579602, -6.818816,
2, -3.758063, -7.118207
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
-3, -4.114984, -7.716991, 0, -0.5, 0.5, 0.5,
-3, -4.114984, -7.716991, 1, -0.5, 0.5, 0.5,
-3, -4.114984, -7.716991, 1, 1.5, 0.5, 0.5,
-3, -4.114984, -7.716991, 0, 1.5, 0.5, 0.5,
-2, -4.114984, -7.716991, 0, -0.5, 0.5, 0.5,
-2, -4.114984, -7.716991, 1, -0.5, 0.5, 0.5,
-2, -4.114984, -7.716991, 1, 1.5, 0.5, 0.5,
-2, -4.114984, -7.716991, 0, 1.5, 0.5, 0.5,
-1, -4.114984, -7.716991, 0, -0.5, 0.5, 0.5,
-1, -4.114984, -7.716991, 1, -0.5, 0.5, 0.5,
-1, -4.114984, -7.716991, 1, 1.5, 0.5, 0.5,
-1, -4.114984, -7.716991, 0, 1.5, 0.5, 0.5,
0, -4.114984, -7.716991, 0, -0.5, 0.5, 0.5,
0, -4.114984, -7.716991, 1, -0.5, 0.5, 0.5,
0, -4.114984, -7.716991, 1, 1.5, 0.5, 0.5,
0, -4.114984, -7.716991, 0, 1.5, 0.5, 0.5,
1, -4.114984, -7.716991, 0, -0.5, 0.5, 0.5,
1, -4.114984, -7.716991, 1, -0.5, 0.5, 0.5,
1, -4.114984, -7.716991, 1, 1.5, 0.5, 0.5,
1, -4.114984, -7.716991, 0, 1.5, 0.5, 0.5,
2, -4.114984, -7.716991, 0, -0.5, 0.5, 0.5,
2, -4.114984, -7.716991, 1, -0.5, 0.5, 0.5,
2, -4.114984, -7.716991, 1, 1.5, 0.5, 0.5,
2, -4.114984, -7.716991, 0, 1.5, 0.5, 0.5
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
-3.180697, -3, -6.818816,
-3.180697, 3, -6.818816,
-3.180697, -3, -6.818816,
-3.334529, -3, -7.118207,
-3.180697, -2, -6.818816,
-3.334529, -2, -7.118207,
-3.180697, -1, -6.818816,
-3.334529, -1, -7.118207,
-3.180697, 0, -6.818816,
-3.334529, 0, -7.118207,
-3.180697, 1, -6.818816,
-3.334529, 1, -7.118207,
-3.180697, 2, -6.818816,
-3.334529, 2, -7.118207,
-3.180697, 3, -6.818816,
-3.334529, 3, -7.118207
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
-3.642194, -3, -7.716991, 0, -0.5, 0.5, 0.5,
-3.642194, -3, -7.716991, 1, -0.5, 0.5, 0.5,
-3.642194, -3, -7.716991, 1, 1.5, 0.5, 0.5,
-3.642194, -3, -7.716991, 0, 1.5, 0.5, 0.5,
-3.642194, -2, -7.716991, 0, -0.5, 0.5, 0.5,
-3.642194, -2, -7.716991, 1, -0.5, 0.5, 0.5,
-3.642194, -2, -7.716991, 1, 1.5, 0.5, 0.5,
-3.642194, -2, -7.716991, 0, 1.5, 0.5, 0.5,
-3.642194, -1, -7.716991, 0, -0.5, 0.5, 0.5,
-3.642194, -1, -7.716991, 1, -0.5, 0.5, 0.5,
-3.642194, -1, -7.716991, 1, 1.5, 0.5, 0.5,
-3.642194, -1, -7.716991, 0, 1.5, 0.5, 0.5,
-3.642194, 0, -7.716991, 0, -0.5, 0.5, 0.5,
-3.642194, 0, -7.716991, 1, -0.5, 0.5, 0.5,
-3.642194, 0, -7.716991, 1, 1.5, 0.5, 0.5,
-3.642194, 0, -7.716991, 0, 1.5, 0.5, 0.5,
-3.642194, 1, -7.716991, 0, -0.5, 0.5, 0.5,
-3.642194, 1, -7.716991, 1, -0.5, 0.5, 0.5,
-3.642194, 1, -7.716991, 1, 1.5, 0.5, 0.5,
-3.642194, 1, -7.716991, 0, 1.5, 0.5, 0.5,
-3.642194, 2, -7.716991, 0, -0.5, 0.5, 0.5,
-3.642194, 2, -7.716991, 1, -0.5, 0.5, 0.5,
-3.642194, 2, -7.716991, 1, 1.5, 0.5, 0.5,
-3.642194, 2, -7.716991, 0, 1.5, 0.5, 0.5,
-3.642194, 3, -7.716991, 0, -0.5, 0.5, 0.5,
-3.642194, 3, -7.716991, 1, -0.5, 0.5, 0.5,
-3.642194, 3, -7.716991, 1, 1.5, 0.5, 0.5,
-3.642194, 3, -7.716991, 0, 1.5, 0.5, 0.5
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
-3.180697, -3.579602, -6,
-3.180697, -3.579602, 4,
-3.180697, -3.579602, -6,
-3.334529, -3.758063, -6,
-3.180697, -3.579602, -4,
-3.334529, -3.758063, -4,
-3.180697, -3.579602, -2,
-3.334529, -3.758063, -2,
-3.180697, -3.579602, 0,
-3.334529, -3.758063, 0,
-3.180697, -3.579602, 2,
-3.334529, -3.758063, 2,
-3.180697, -3.579602, 4,
-3.334529, -3.758063, 4
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
-3.642194, -4.114984, -6, 0, -0.5, 0.5, 0.5,
-3.642194, -4.114984, -6, 1, -0.5, 0.5, 0.5,
-3.642194, -4.114984, -6, 1, 1.5, 0.5, 0.5,
-3.642194, -4.114984, -6, 0, 1.5, 0.5, 0.5,
-3.642194, -4.114984, -4, 0, -0.5, 0.5, 0.5,
-3.642194, -4.114984, -4, 1, -0.5, 0.5, 0.5,
-3.642194, -4.114984, -4, 1, 1.5, 0.5, 0.5,
-3.642194, -4.114984, -4, 0, 1.5, 0.5, 0.5,
-3.642194, -4.114984, -2, 0, -0.5, 0.5, 0.5,
-3.642194, -4.114984, -2, 1, -0.5, 0.5, 0.5,
-3.642194, -4.114984, -2, 1, 1.5, 0.5, 0.5,
-3.642194, -4.114984, -2, 0, 1.5, 0.5, 0.5,
-3.642194, -4.114984, 0, 0, -0.5, 0.5, 0.5,
-3.642194, -4.114984, 0, 1, -0.5, 0.5, 0.5,
-3.642194, -4.114984, 0, 1, 1.5, 0.5, 0.5,
-3.642194, -4.114984, 0, 0, 1.5, 0.5, 0.5,
-3.642194, -4.114984, 2, 0, -0.5, 0.5, 0.5,
-3.642194, -4.114984, 2, 1, -0.5, 0.5, 0.5,
-3.642194, -4.114984, 2, 1, 1.5, 0.5, 0.5,
-3.642194, -4.114984, 2, 0, 1.5, 0.5, 0.5,
-3.642194, -4.114984, 4, 0, -0.5, 0.5, 0.5,
-3.642194, -4.114984, 4, 1, -0.5, 0.5, 0.5,
-3.642194, -4.114984, 4, 1, 1.5, 0.5, 0.5,
-3.642194, -4.114984, 4, 0, 1.5, 0.5, 0.5
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
-3.180697, -3.579602, -6.818816,
-3.180697, 3.558821, -6.818816,
-3.180697, -3.579602, 5.156863,
-3.180697, 3.558821, 5.156863,
-3.180697, -3.579602, -6.818816,
-3.180697, -3.579602, 5.156863,
-3.180697, 3.558821, -6.818816,
-3.180697, 3.558821, 5.156863,
-3.180697, -3.579602, -6.818816,
2.972598, -3.579602, -6.818816,
-3.180697, -3.579602, 5.156863,
2.972598, -3.579602, 5.156863,
-3.180697, 3.558821, -6.818816,
2.972598, 3.558821, -6.818816,
-3.180697, 3.558821, 5.156863,
2.972598, 3.558821, 5.156863,
2.972598, -3.579602, -6.818816,
2.972598, 3.558821, -6.818816,
2.972598, -3.579602, 5.156863,
2.972598, 3.558821, 5.156863,
2.972598, -3.579602, -6.818816,
2.972598, -3.579602, 5.156863,
2.972598, 3.558821, -6.818816,
2.972598, 3.558821, 5.156863
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
var radius = 8.137503;
var distance = 36.20467;
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
mvMatrix.translate( 0.1040493, 0.01039064, 0.8309765 );
mvMatrix.scale( 1.429873, 1.232545, 0.7346914 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.20467);
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
prodiamine<-read.table("prodiamine.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-prodiamine$V2
```

```
## Error in eval(expr, envir, enclos): object 'prodiamine' not found
```

```r
y<-prodiamine$V3
```

```
## Error in eval(expr, envir, enclos): object 'prodiamine' not found
```

```r
z<-prodiamine$V4
```

```
## Error in eval(expr, envir, enclos): object 'prodiamine' not found
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
-3.091086, 1.503854, -0.8163289, 0, 0, 1, 1, 1,
-2.885734, 1.446808, -0.9633263, 1, 0, 0, 1, 1,
-2.816136, -0.4708094, -1.431144, 1, 0, 0, 1, 1,
-2.682467, 0.4380439, -2.164565, 1, 0, 0, 1, 1,
-2.649277, -0.007567836, -1.275827, 1, 0, 0, 1, 1,
-2.586983, -1.455996, -3.468468, 1, 0, 0, 1, 1,
-2.572372, -1.261179, -2.971437, 0, 0, 0, 1, 1,
-2.566432, -2.241296, -3.640684, 0, 0, 0, 1, 1,
-2.549867, -0.08276521, 0.2585085, 0, 0, 0, 1, 1,
-2.538878, -1.15823, -1.530097, 0, 0, 0, 1, 1,
-2.524324, 0.1785395, -2.471922, 0, 0, 0, 1, 1,
-2.460943, -0.2357082, -1.545488, 0, 0, 0, 1, 1,
-2.449068, 2.162353, -0.3010473, 0, 0, 0, 1, 1,
-2.43179, 1.548825, -1.44415, 1, 1, 1, 1, 1,
-2.348531, 0.3856367, -1.671059, 1, 1, 1, 1, 1,
-2.336989, 0.7800639, 1.293309, 1, 1, 1, 1, 1,
-2.325248, 0.4545202, -3.200387, 1, 1, 1, 1, 1,
-2.315485, 2.396798, -0.951749, 1, 1, 1, 1, 1,
-2.266303, -0.5300222, -2.953171, 1, 1, 1, 1, 1,
-2.194374, 1.936351, -0.6323434, 1, 1, 1, 1, 1,
-2.193428, 0.06012044, -1.601606, 1, 1, 1, 1, 1,
-2.186401, -0.2118181, -1.570032, 1, 1, 1, 1, 1,
-2.089337, -0.3222068, -1.473753, 1, 1, 1, 1, 1,
-2.068548, 1.953243, -2.112149, 1, 1, 1, 1, 1,
-2.054026, -1.822946, -1.783247, 1, 1, 1, 1, 1,
-2.039529, -1.42738, -1.645699, 1, 1, 1, 1, 1,
-2.016143, 0.3963501, 0.6609426, 1, 1, 1, 1, 1,
-1.999318, 0.4740624, -0.2672609, 1, 1, 1, 1, 1,
-1.998605, 0.903569, 0.8095288, 0, 0, 1, 1, 1,
-1.973192, 1.0689, -1.535019, 1, 0, 0, 1, 1,
-1.965843, 0.182912, -0.9010379, 1, 0, 0, 1, 1,
-1.903923, 0.2098517, -2.240148, 1, 0, 0, 1, 1,
-1.889701, 1.189849, -1.204032, 1, 0, 0, 1, 1,
-1.878161, 0.8144536, -0.5180951, 1, 0, 0, 1, 1,
-1.859697, -0.7847162, -1.010534, 0, 0, 0, 1, 1,
-1.816391, -0.3637324, -1.345823, 0, 0, 0, 1, 1,
-1.813413, -0.3070747, -2.666076, 0, 0, 0, 1, 1,
-1.803683, -0.1940017, -1.88863, 0, 0, 0, 1, 1,
-1.80193, 0.292897, -0.7901522, 0, 0, 0, 1, 1,
-1.792676, 2.131802, 0.03112923, 0, 0, 0, 1, 1,
-1.791336, -0.04458362, -0.5992838, 0, 0, 0, 1, 1,
-1.788789, -0.01644527, -0.415964, 1, 1, 1, 1, 1,
-1.784986, 0.56191, -2.314711, 1, 1, 1, 1, 1,
-1.75045, -1.435131, -3.46744, 1, 1, 1, 1, 1,
-1.744585, 1.785504, -0.1561076, 1, 1, 1, 1, 1,
-1.739152, 0.2476148, -0.4123788, 1, 1, 1, 1, 1,
-1.738061, 0.1336572, -1.824221, 1, 1, 1, 1, 1,
-1.720609, 0.3944877, -2.356361, 1, 1, 1, 1, 1,
-1.713059, -0.1605391, -0.9041742, 1, 1, 1, 1, 1,
-1.711765, 0.00642732, -3.570317, 1, 1, 1, 1, 1,
-1.69859, -0.6721863, -2.046696, 1, 1, 1, 1, 1,
-1.679415, 0.9608611, -1.985928, 1, 1, 1, 1, 1,
-1.671502, 1.122331, -1.271321, 1, 1, 1, 1, 1,
-1.662921, -0.6451421, -2.730032, 1, 1, 1, 1, 1,
-1.632568, 0.002132455, -1.720716, 1, 1, 1, 1, 1,
-1.623848, 1.83344, -1.503487, 1, 1, 1, 1, 1,
-1.612184, 0.2427661, -1.437371, 0, 0, 1, 1, 1,
-1.603994, -1.289755, -1.258062, 1, 0, 0, 1, 1,
-1.600965, 0.1516985, -1.832604, 1, 0, 0, 1, 1,
-1.555462, 1.55769, -1.107491, 1, 0, 0, 1, 1,
-1.555072, 1.957441, -1.870344, 1, 0, 0, 1, 1,
-1.537593, 0.1974999, -1.086328, 1, 0, 0, 1, 1,
-1.527328, 0.4976375, -1.188252, 0, 0, 0, 1, 1,
-1.522325, 0.9202292, -1.88843, 0, 0, 0, 1, 1,
-1.521098, -1.293921, -2.958978, 0, 0, 0, 1, 1,
-1.520603, -0.09261027, -0.3899454, 0, 0, 0, 1, 1,
-1.502344, -1.569763, -1.93223, 0, 0, 0, 1, 1,
-1.500468, 0.9917419, -0.6904699, 0, 0, 0, 1, 1,
-1.499821, -0.63059, -0.5576519, 0, 0, 0, 1, 1,
-1.484992, -0.425751, -1.952853, 1, 1, 1, 1, 1,
-1.471199, -0.5414972, -2.187347, 1, 1, 1, 1, 1,
-1.458349, 1.07297, -2.540717, 1, 1, 1, 1, 1,
-1.457694, 0.4176323, -1.25928, 1, 1, 1, 1, 1,
-1.457693, -1.153495, -0.8521593, 1, 1, 1, 1, 1,
-1.456649, 0.05171185, -1.257628, 1, 1, 1, 1, 1,
-1.456606, -0.587207, -3.805859, 1, 1, 1, 1, 1,
-1.453518, 0.3461097, -1.010038, 1, 1, 1, 1, 1,
-1.437831, 0.2645984, 0.5011452, 1, 1, 1, 1, 1,
-1.40692, 0.3541032, -1.484262, 1, 1, 1, 1, 1,
-1.402881, -0.9774639, -2.129885, 1, 1, 1, 1, 1,
-1.400868, -0.2322785, -0.1291259, 1, 1, 1, 1, 1,
-1.400694, -0.2078082, -0.5851894, 1, 1, 1, 1, 1,
-1.398492, -0.8515477, -2.925817, 1, 1, 1, 1, 1,
-1.395063, -0.744476, -2.194976, 1, 1, 1, 1, 1,
-1.392259, -0.8579386, -1.330588, 0, 0, 1, 1, 1,
-1.390249, 0.1185345, -0.7078352, 1, 0, 0, 1, 1,
-1.373942, -1.666601, -3.016889, 1, 0, 0, 1, 1,
-1.365701, 1.666829, -1.79832, 1, 0, 0, 1, 1,
-1.356944, 0.8479697, -3.478149, 1, 0, 0, 1, 1,
-1.355003, -0.3166848, -1.198198, 1, 0, 0, 1, 1,
-1.340509, -1.272771, -2.268018, 0, 0, 0, 1, 1,
-1.338412, -0.2256301, -2.514047, 0, 0, 0, 1, 1,
-1.329721, 1.83799, -2.29164, 0, 0, 0, 1, 1,
-1.327053, -1.666437, -1.58275, 0, 0, 0, 1, 1,
-1.326179, -1.33788, -2.144464, 0, 0, 0, 1, 1,
-1.32524, 1.258466, 0.7346104, 0, 0, 0, 1, 1,
-1.32334, 1.680742, -1.026679, 0, 0, 0, 1, 1,
-1.322224, -0.9939213, -2.308656, 1, 1, 1, 1, 1,
-1.302514, -0.815616, -3.153134, 1, 1, 1, 1, 1,
-1.29032, 0.8899065, 0.2999062, 1, 1, 1, 1, 1,
-1.289589, -0.8691279, -2.722342, 1, 1, 1, 1, 1,
-1.286509, 1.558034, -0.2998088, 1, 1, 1, 1, 1,
-1.278391, 0.8637828, -1.097136, 1, 1, 1, 1, 1,
-1.269087, -0.1933552, -3.249767, 1, 1, 1, 1, 1,
-1.265013, 0.1712302, -1.107607, 1, 1, 1, 1, 1,
-1.2629, 0.2150472, -1.239148, 1, 1, 1, 1, 1,
-1.261827, -0.05228758, -1.695578, 1, 1, 1, 1, 1,
-1.25999, 0.1232751, -0.2433303, 1, 1, 1, 1, 1,
-1.258321, 0.3974373, -0.671731, 1, 1, 1, 1, 1,
-1.251375, 2.099799, -0.7821844, 1, 1, 1, 1, 1,
-1.250699, 1.085375, -1.025105, 1, 1, 1, 1, 1,
-1.247164, -1.20099, -1.786549, 1, 1, 1, 1, 1,
-1.243443, 0.2385934, -3.324659, 0, 0, 1, 1, 1,
-1.242309, 0.7661812, -1.000829, 1, 0, 0, 1, 1,
-1.232408, -0.4695432, -2.758402, 1, 0, 0, 1, 1,
-1.225378, -1.068633, -2.92863, 1, 0, 0, 1, 1,
-1.214722, -1.443141, -3.481742, 1, 0, 0, 1, 1,
-1.213772, 0.6038281, 0.5452228, 1, 0, 0, 1, 1,
-1.209089, -0.684215, -2.542505, 0, 0, 0, 1, 1,
-1.200164, -0.6809615, -2.922686, 0, 0, 0, 1, 1,
-1.19293, 1.000425, -1.808212, 0, 0, 0, 1, 1,
-1.191133, -0.9257885, -2.034916, 0, 0, 0, 1, 1,
-1.190068, -0.1084101, 0.6119025, 0, 0, 0, 1, 1,
-1.184983, 0.4597542, 0.7396397, 0, 0, 0, 1, 1,
-1.18297, 1.131789, 1.929236, 0, 0, 0, 1, 1,
-1.179925, -0.5279521, -0.3936253, 1, 1, 1, 1, 1,
-1.171693, 0.007966373, -0.8705752, 1, 1, 1, 1, 1,
-1.16642, 3.191987, 0.06321992, 1, 1, 1, 1, 1,
-1.160356, -1.011352, -2.285792, 1, 1, 1, 1, 1,
-1.133164, -0.5137657, -2.266185, 1, 1, 1, 1, 1,
-1.130154, 0.08709104, -1.757365, 1, 1, 1, 1, 1,
-1.122787, -0.5874982, -2.479878, 1, 1, 1, 1, 1,
-1.120863, -0.4316218, -1.115982, 1, 1, 1, 1, 1,
-1.120182, 1.393582, -0.1710714, 1, 1, 1, 1, 1,
-1.099568, 1.510202, -1.594974, 1, 1, 1, 1, 1,
-1.098568, -0.1170388, -2.313509, 1, 1, 1, 1, 1,
-1.096877, -1.440275, -2.127455, 1, 1, 1, 1, 1,
-1.0968, 0.0294389, -2.235546, 1, 1, 1, 1, 1,
-1.09392, 0.5773421, -1.587908, 1, 1, 1, 1, 1,
-1.087557, 0.9202142, -0.7709036, 1, 1, 1, 1, 1,
-1.086141, -0.5614753, -3.328736, 0, 0, 1, 1, 1,
-1.074465, 0.4094386, -2.50794, 1, 0, 0, 1, 1,
-1.056031, -0.138691, 0.8839787, 1, 0, 0, 1, 1,
-1.054632, 0.5153016, -2.0996, 1, 0, 0, 1, 1,
-1.054505, 0.6750739, -0.3868722, 1, 0, 0, 1, 1,
-1.042954, 0.5315741, 0.5052326, 1, 0, 0, 1, 1,
-1.036183, 0.1729266, 0.7049236, 0, 0, 0, 1, 1,
-1.026939, -1.408452, -3.296745, 0, 0, 0, 1, 1,
-1.024612, -1.256177, -2.167291, 0, 0, 0, 1, 1,
-1.015867, -0.4817443, -2.066386, 0, 0, 0, 1, 1,
-1.010792, 0.440985, -2.22233, 0, 0, 0, 1, 1,
-1.00794, -2.035548, -4.287413, 0, 0, 0, 1, 1,
-1.004993, -1.321536, -1.205422, 0, 0, 0, 1, 1,
-1.001731, 0.2387436, 0.06355871, 1, 1, 1, 1, 1,
-0.99594, -2.184639, -3.200204, 1, 1, 1, 1, 1,
-0.993139, -2.548398, -2.103329, 1, 1, 1, 1, 1,
-0.989943, 0.7479186, -2.496546, 1, 1, 1, 1, 1,
-0.988525, 1.756871, -2.799235, 1, 1, 1, 1, 1,
-0.9817548, 1.785318, 0.8943406, 1, 1, 1, 1, 1,
-0.9805328, 0.870434, -1.024776, 1, 1, 1, 1, 1,
-0.9607498, -0.4868625, -1.592924, 1, 1, 1, 1, 1,
-0.956715, 3.454863, -0.8511621, 1, 1, 1, 1, 1,
-0.9359956, 1.400331, -0.3785014, 1, 1, 1, 1, 1,
-0.9355022, 0.837165, -0.9463776, 1, 1, 1, 1, 1,
-0.9341351, -0.1263253, -1.560921, 1, 1, 1, 1, 1,
-0.9330723, -0.1499185, -2.142447, 1, 1, 1, 1, 1,
-0.9287093, 0.02371851, -1.769447, 1, 1, 1, 1, 1,
-0.9280363, -0.7257346, -1.102546, 1, 1, 1, 1, 1,
-0.9152613, 0.9076255, 0.3318583, 0, 0, 1, 1, 1,
-0.9080838, 2.19915, 0.5661432, 1, 0, 0, 1, 1,
-0.9034804, -1.181865, -3.74401, 1, 0, 0, 1, 1,
-0.9027714, 1.098723, 2.05179, 1, 0, 0, 1, 1,
-0.9010559, -1.418069, -0.710112, 1, 0, 0, 1, 1,
-0.9008505, -0.787043, -2.685387, 1, 0, 0, 1, 1,
-0.8963765, 1.07823, -0.314822, 0, 0, 0, 1, 1,
-0.8935799, -1.52864, -1.471519, 0, 0, 0, 1, 1,
-0.8863394, -0.6360329, -0.4929721, 0, 0, 0, 1, 1,
-0.8861728, -0.4100894, -2.013436, 0, 0, 0, 1, 1,
-0.8860641, -0.7982546, -3.131181, 0, 0, 0, 1, 1,
-0.8854204, 0.2203271, -0.8082811, 0, 0, 0, 1, 1,
-0.8849288, -1.755162, -2.890178, 0, 0, 0, 1, 1,
-0.8840036, 0.8777032, -2.146565, 1, 1, 1, 1, 1,
-0.8806182, 0.2364253, -2.056835, 1, 1, 1, 1, 1,
-0.8799735, 0.8730828, 0.03789298, 1, 1, 1, 1, 1,
-0.8790137, -0.9099376, -2.670909, 1, 1, 1, 1, 1,
-0.8782517, -1.050786, -1.227583, 1, 1, 1, 1, 1,
-0.8724827, -0.04641301, -3.09101, 1, 1, 1, 1, 1,
-0.8709803, -0.5880517, -2.198177, 1, 1, 1, 1, 1,
-0.8627447, 0.6900032, -0.4694732, 1, 1, 1, 1, 1,
-0.8607649, 0.509424, -1.623386, 1, 1, 1, 1, 1,
-0.851541, -0.07942574, -1.006079, 1, 1, 1, 1, 1,
-0.8508952, -1.714299, -3.112403, 1, 1, 1, 1, 1,
-0.8493707, -0.4345959, -2.752719, 1, 1, 1, 1, 1,
-0.8466204, 0.4192456, -0.4860263, 1, 1, 1, 1, 1,
-0.8456655, -0.2799134, -3.455792, 1, 1, 1, 1, 1,
-0.8439272, -1.798857, -2.775065, 1, 1, 1, 1, 1,
-0.8413831, -0.1730676, 0.08699366, 0, 0, 1, 1, 1,
-0.8353709, 1.285178, -0.1186957, 1, 0, 0, 1, 1,
-0.8293996, 0.7714278, -0.7798277, 1, 0, 0, 1, 1,
-0.8283682, -0.8482682, -2.12892, 1, 0, 0, 1, 1,
-0.8166032, 0.1288987, -1.994895, 1, 0, 0, 1, 1,
-0.8120339, 0.493508, -2.195586, 1, 0, 0, 1, 1,
-0.8111742, -1.039253, -3.320643, 0, 0, 0, 1, 1,
-0.8041005, -2.499678, -3.544006, 0, 0, 0, 1, 1,
-0.8037135, -1.250413, -0.7641647, 0, 0, 0, 1, 1,
-0.8011637, 0.06449544, -2.801616, 0, 0, 0, 1, 1,
-0.7920985, 0.0665245, -2.157284, 0, 0, 0, 1, 1,
-0.7917919, -1.079774, -3.689616, 0, 0, 0, 1, 1,
-0.7902755, 0.317344, -1.961394, 0, 0, 0, 1, 1,
-0.7896101, 0.2416941, -1.934705, 1, 1, 1, 1, 1,
-0.7880676, 1.91247, 0.2722747, 1, 1, 1, 1, 1,
-0.7838963, -0.3437497, -1.886044, 1, 1, 1, 1, 1,
-0.78106, 0.05536323, -1.120372, 1, 1, 1, 1, 1,
-0.7727659, -0.6256441, -2.619217, 1, 1, 1, 1, 1,
-0.770227, -1.406062, -2.13865, 1, 1, 1, 1, 1,
-0.7700055, 0.5591598, 0.2105647, 1, 1, 1, 1, 1,
-0.7644331, 0.391563, -0.9345542, 1, 1, 1, 1, 1,
-0.7636377, 0.8558538, 0.1699751, 1, 1, 1, 1, 1,
-0.7596588, -1.346499, -3.114492, 1, 1, 1, 1, 1,
-0.7564716, -0.0949273, -2.107641, 1, 1, 1, 1, 1,
-0.7525083, 0.7377955, -1.553386, 1, 1, 1, 1, 1,
-0.7514949, 0.9502172, 0.1985132, 1, 1, 1, 1, 1,
-0.746498, -1.497446, -1.983215, 1, 1, 1, 1, 1,
-0.7435832, 0.2352063, -0.9199913, 1, 1, 1, 1, 1,
-0.740939, -0.04905481, -1.700635, 0, 0, 1, 1, 1,
-0.7334718, -0.290076, -1.868268, 1, 0, 0, 1, 1,
-0.7325971, -0.6602164, -4.44824, 1, 0, 0, 1, 1,
-0.7315801, -2.435828, -2.864063, 1, 0, 0, 1, 1,
-0.7292038, 1.171398, 0.447232, 1, 0, 0, 1, 1,
-0.7286876, -0.5195779, -1.953161, 1, 0, 0, 1, 1,
-0.7221379, -0.3016364, -1.205424, 0, 0, 0, 1, 1,
-0.7215901, 1.235869, 0.0354966, 0, 0, 0, 1, 1,
-0.7154336, -0.9534569, -3.010864, 0, 0, 0, 1, 1,
-0.714052, 0.2132464, -0.5622155, 0, 0, 0, 1, 1,
-0.7139545, -1.069711, -4.225187, 0, 0, 0, 1, 1,
-0.7117081, -1.903913, -1.889521, 0, 0, 0, 1, 1,
-0.7080564, 0.3012801, -1.579374, 0, 0, 0, 1, 1,
-0.7046849, 0.2244534, -1.426258, 1, 1, 1, 1, 1,
-0.7023852, -1.046163, -2.679653, 1, 1, 1, 1, 1,
-0.7016191, 0.8372917, -1.870646, 1, 1, 1, 1, 1,
-0.6942284, -0.5493225, -1.157409, 1, 1, 1, 1, 1,
-0.684854, 2.064305, 0.2766379, 1, 1, 1, 1, 1,
-0.679223, 1.035867, -0.8954471, 1, 1, 1, 1, 1,
-0.6775675, -0.8171167, -0.5089676, 1, 1, 1, 1, 1,
-0.6774737, 0.5095477, -2.102719, 1, 1, 1, 1, 1,
-0.6722637, -0.01046738, -1.939755, 1, 1, 1, 1, 1,
-0.6608015, -0.1981151, -0.5719044, 1, 1, 1, 1, 1,
-0.6584534, -0.6684747, -2.153018, 1, 1, 1, 1, 1,
-0.6522697, 0.6721935, -0.4381155, 1, 1, 1, 1, 1,
-0.647801, 0.4954354, -1.969784, 1, 1, 1, 1, 1,
-0.640546, 0.6080623, -1.3842, 1, 1, 1, 1, 1,
-0.635752, -0.0689294, -2.168976, 1, 1, 1, 1, 1,
-0.6315227, 0.2666714, -2.442575, 0, 0, 1, 1, 1,
-0.629028, 0.5775706, 0.05065816, 1, 0, 0, 1, 1,
-0.6156794, -0.03355859, -1.205285, 1, 0, 0, 1, 1,
-0.6154343, 1.613566, -0.7964628, 1, 0, 0, 1, 1,
-0.613799, 0.5650679, 1.406739, 1, 0, 0, 1, 1,
-0.6121609, -1.960436, -2.114308, 1, 0, 0, 1, 1,
-0.5942938, -0.2373338, -2.88068, 0, 0, 0, 1, 1,
-0.5907865, 0.7913824, -1.395774, 0, 0, 0, 1, 1,
-0.5846097, -0.861906, -2.814095, 0, 0, 0, 1, 1,
-0.5841665, -1.189537, -2.074175, 0, 0, 0, 1, 1,
-0.5808277, -1.64175, -2.762957, 0, 0, 0, 1, 1,
-0.5788495, -1.143345, -2.745314, 0, 0, 0, 1, 1,
-0.5763028, -0.5232135, 1.334843, 0, 0, 0, 1, 1,
-0.5758363, 1.889751, -0.6576486, 1, 1, 1, 1, 1,
-0.5738221, -0.84132, -0.704098, 1, 1, 1, 1, 1,
-0.571782, -1.06754, -1.854639, 1, 1, 1, 1, 1,
-0.5673115, 0.7988585, -1.165889, 1, 1, 1, 1, 1,
-0.5635228, 0.714024, 1.544306, 1, 1, 1, 1, 1,
-0.5635178, -0.001142697, -1.887695, 1, 1, 1, 1, 1,
-0.5612621, -0.7636348, -3.681266, 1, 1, 1, 1, 1,
-0.560389, 0.1752017, 0.6118243, 1, 1, 1, 1, 1,
-0.55098, -1.155601, 0.00889519, 1, 1, 1, 1, 1,
-0.5422402, -1.029919, -6.644413, 1, 1, 1, 1, 1,
-0.5393686, -0.591808, -2.394169, 1, 1, 1, 1, 1,
-0.5363079, -0.5297391, -3.782234, 1, 1, 1, 1, 1,
-0.5351645, -0.4472008, -2.132782, 1, 1, 1, 1, 1,
-0.5319313, 0.1827823, -1.847526, 1, 1, 1, 1, 1,
-0.5305151, 0.7940943, -1.182892, 1, 1, 1, 1, 1,
-0.5232128, 1.738924, -0.5075449, 0, 0, 1, 1, 1,
-0.5229853, -0.5814312, -3.0723, 1, 0, 0, 1, 1,
-0.5224912, -1.48428, -3.541895, 1, 0, 0, 1, 1,
-0.5212629, 2.416863, 0.8478481, 1, 0, 0, 1, 1,
-0.5209541, 1.586672, -1.025247, 1, 0, 0, 1, 1,
-0.5208371, -0.2483331, -3.546101, 1, 0, 0, 1, 1,
-0.5206786, -1.615028, -4.161778, 0, 0, 0, 1, 1,
-0.5199047, 1.113417, -0.02735526, 0, 0, 0, 1, 1,
-0.5116321, 0.01375907, -1.997016, 0, 0, 0, 1, 1,
-0.5096551, -0.4109463, -1.328, 0, 0, 0, 1, 1,
-0.5071345, -1.495258, -4.145296, 0, 0, 0, 1, 1,
-0.5068904, 0.1024391, -2.526388, 0, 0, 0, 1, 1,
-0.4958112, -0.2348423, -1.88804, 0, 0, 0, 1, 1,
-0.4941256, -0.6291509, -1.538717, 1, 1, 1, 1, 1,
-0.4939138, 1.646332, 0.5003309, 1, 1, 1, 1, 1,
-0.4936821, 0.6253561, 0.9331191, 1, 1, 1, 1, 1,
-0.4914788, 0.3461987, -1.477673, 1, 1, 1, 1, 1,
-0.4862192, 0.5925484, 0.7075888, 1, 1, 1, 1, 1,
-0.4858054, 1.222882, -0.9752327, 1, 1, 1, 1, 1,
-0.4832139, -0.4447736, -4.258401, 1, 1, 1, 1, 1,
-0.4802522, 1.879983, -1.255665, 1, 1, 1, 1, 1,
-0.4697812, -0.6470647, -2.920015, 1, 1, 1, 1, 1,
-0.4655036, 0.1021637, -1.403493, 1, 1, 1, 1, 1,
-0.4605261, 1.583276, -0.8446837, 1, 1, 1, 1, 1,
-0.4584916, 0.06429142, -2.493708, 1, 1, 1, 1, 1,
-0.456021, -0.936462, -1.803235, 1, 1, 1, 1, 1,
-0.4529267, -1.156464, -3.622717, 1, 1, 1, 1, 1,
-0.4511614, -0.5273478, -2.354826, 1, 1, 1, 1, 1,
-0.4410818, 0.2936005, -1.210765, 0, 0, 1, 1, 1,
-0.4393928, 0.1898986, -0.3702671, 1, 0, 0, 1, 1,
-0.4349532, -0.01174252, 0.3033322, 1, 0, 0, 1, 1,
-0.4344299, -0.9413044, -3.352721, 1, 0, 0, 1, 1,
-0.4337354, -2.014368, -3.139433, 1, 0, 0, 1, 1,
-0.4333006, -1.282576, -1.843784, 1, 0, 0, 1, 1,
-0.4294959, -0.7524264, -4.855343, 0, 0, 0, 1, 1,
-0.4228363, 0.5604843, -1.898595, 0, 0, 0, 1, 1,
-0.4186733, -0.5185527, -3.074356, 0, 0, 0, 1, 1,
-0.4138133, 1.932675, -0.8170328, 0, 0, 0, 1, 1,
-0.4127326, 1.414676, -1.349915, 0, 0, 0, 1, 1,
-0.4102497, 1.578526, -0.01404665, 0, 0, 0, 1, 1,
-0.40905, -1.277614, -2.998656, 0, 0, 0, 1, 1,
-0.3996953, 0.3791162, -1.911523, 1, 1, 1, 1, 1,
-0.3962379, 0.9597369, -1.068755, 1, 1, 1, 1, 1,
-0.3945463, -0.9391752, -3.18748, 1, 1, 1, 1, 1,
-0.3921603, 0.8275414, -0.01392441, 1, 1, 1, 1, 1,
-0.3904754, -1.044013, -3.752661, 1, 1, 1, 1, 1,
-0.3886499, 2.0915, -0.9869936, 1, 1, 1, 1, 1,
-0.3878341, 0.08686963, -1.107639, 1, 1, 1, 1, 1,
-0.3875374, -1.485128, -4.695861, 1, 1, 1, 1, 1,
-0.3821281, -0.3380407, -2.267539, 1, 1, 1, 1, 1,
-0.3770995, -1.646717, -3.990116, 1, 1, 1, 1, 1,
-0.3748604, 0.4245819, -0.8666896, 1, 1, 1, 1, 1,
-0.3715101, -0.2404104, -1.887643, 1, 1, 1, 1, 1,
-0.3713644, 0.3371277, -0.5983031, 1, 1, 1, 1, 1,
-0.3706955, 1.383318, -0.7998877, 1, 1, 1, 1, 1,
-0.3682478, -0.7985757, -2.12162, 1, 1, 1, 1, 1,
-0.3680278, -0.7310585, -2.873643, 0, 0, 1, 1, 1,
-0.36296, -1.139638, -3.758274, 1, 0, 0, 1, 1,
-0.3605976, 1.044587, 0.7488039, 1, 0, 0, 1, 1,
-0.3575101, -1.361506, -2.976327, 1, 0, 0, 1, 1,
-0.3569708, -0.2512494, -0.2428444, 1, 0, 0, 1, 1,
-0.3532925, -0.3031146, -1.526591, 1, 0, 0, 1, 1,
-0.3501882, 0.7492847, -1.817991, 0, 0, 0, 1, 1,
-0.3468426, 1.047436, 0.6362242, 0, 0, 0, 1, 1,
-0.3465476, 0.9772214, -0.5870134, 0, 0, 0, 1, 1,
-0.3444929, 2.521244, 1.050089, 0, 0, 0, 1, 1,
-0.3416, 0.5324598, -0.8087712, 0, 0, 0, 1, 1,
-0.3402558, -1.577256, -3.504136, 0, 0, 0, 1, 1,
-0.3345117, -0.05580747, -0.7698051, 0, 0, 0, 1, 1,
-0.3312857, -2.219511, -3.585011, 1, 1, 1, 1, 1,
-0.3308951, -1.22179, -2.683242, 1, 1, 1, 1, 1,
-0.330202, 0.5530223, -1.333067, 1, 1, 1, 1, 1,
-0.3228358, 0.6040252, -0.6911998, 1, 1, 1, 1, 1,
-0.3213262, -0.34418, -4.41149, 1, 1, 1, 1, 1,
-0.3197165, -0.1116775, -2.202943, 1, 1, 1, 1, 1,
-0.3157564, -1.442586, -3.654765, 1, 1, 1, 1, 1,
-0.3132601, 0.02762614, -1.379867, 1, 1, 1, 1, 1,
-0.3100546, 0.2313004, -0.508726, 1, 1, 1, 1, 1,
-0.3065149, -0.7515311, -2.315966, 1, 1, 1, 1, 1,
-0.3061596, -0.1295209, -1.837265, 1, 1, 1, 1, 1,
-0.3055218, 1.251806, 0.1866162, 1, 1, 1, 1, 1,
-0.3047955, -0.4221133, -2.469635, 1, 1, 1, 1, 1,
-0.3015864, 0.07149822, -1.692115, 1, 1, 1, 1, 1,
-0.3011012, 0.8187965, 0.4103986, 1, 1, 1, 1, 1,
-0.2990032, 0.001043501, -0.8609284, 0, 0, 1, 1, 1,
-0.2944736, -0.2167849, -2.354471, 1, 0, 0, 1, 1,
-0.2927618, 0.139443, -1.561926, 1, 0, 0, 1, 1,
-0.2917484, 2.056214, -1.490792, 1, 0, 0, 1, 1,
-0.289196, -0.0239461, -2.139908, 1, 0, 0, 1, 1,
-0.2887795, -2.088454, -4.33324, 1, 0, 0, 1, 1,
-0.2821128, 1.996766, -0.08600605, 0, 0, 0, 1, 1,
-0.2799562, -0.4528305, -2.001492, 0, 0, 0, 1, 1,
-0.2727448, -1.075694, -3.578377, 0, 0, 0, 1, 1,
-0.2723043, 0.4416667, 0.1726899, 0, 0, 0, 1, 1,
-0.2706344, -1.02808, -2.418417, 0, 0, 0, 1, 1,
-0.2696377, -1.969492, -2.060418, 0, 0, 0, 1, 1,
-0.2678412, 0.1767448, -2.358631, 0, 0, 0, 1, 1,
-0.266338, -1.341572, -4.191881, 1, 1, 1, 1, 1,
-0.2619081, -0.729703, -3.197595, 1, 1, 1, 1, 1,
-0.2567915, -1.921817, -1.537939, 1, 1, 1, 1, 1,
-0.2564902, 1.297909, -1.209459, 1, 1, 1, 1, 1,
-0.2543595, 0.216676, -1.566021, 1, 1, 1, 1, 1,
-0.2533802, 1.349487, -2.675251, 1, 1, 1, 1, 1,
-0.2518739, -1.308998, -4.274684, 1, 1, 1, 1, 1,
-0.2502229, -0.8386479, -1.838661, 1, 1, 1, 1, 1,
-0.2475932, -0.564306, -2.085174, 1, 1, 1, 1, 1,
-0.2449406, 0.2155543, 0.2939492, 1, 1, 1, 1, 1,
-0.2424793, -0.2029908, -1.331658, 1, 1, 1, 1, 1,
-0.2399615, -0.2696249, -2.737486, 1, 1, 1, 1, 1,
-0.2384227, 1.048035, -2.410995, 1, 1, 1, 1, 1,
-0.2361833, -0.2805137, -2.604892, 1, 1, 1, 1, 1,
-0.2312697, -0.1935293, -3.291215, 1, 1, 1, 1, 1,
-0.2295925, -1.194064, -4.638441, 0, 0, 1, 1, 1,
-0.2172582, -1.266533, -4.848178, 1, 0, 0, 1, 1,
-0.2161219, 0.5578587, -1.728082, 1, 0, 0, 1, 1,
-0.2116133, 0.4273274, 0.5046332, 1, 0, 0, 1, 1,
-0.2113479, 0.5611982, -0.5218002, 1, 0, 0, 1, 1,
-0.2112009, -0.4139937, -4.671018, 1, 0, 0, 1, 1,
-0.209984, 0.6163292, -1.333183, 0, 0, 0, 1, 1,
-0.2076249, 0.1010122, -0.08301897, 0, 0, 0, 1, 1,
-0.2074361, 0.2039876, -2.572856, 0, 0, 0, 1, 1,
-0.1976339, 0.108455, -1.382504, 0, 0, 0, 1, 1,
-0.1934047, -0.903154, -0.2188278, 0, 0, 0, 1, 1,
-0.1933244, -0.4596479, -2.178529, 0, 0, 0, 1, 1,
-0.1927655, -0.3930821, -2.946022, 0, 0, 0, 1, 1,
-0.1921085, -0.5189413, -1.053001, 1, 1, 1, 1, 1,
-0.1880042, -0.1075745, -3.710594, 1, 1, 1, 1, 1,
-0.1869304, 1.274099, -1.966862, 1, 1, 1, 1, 1,
-0.1843461, -0.4633409, -4.252351, 1, 1, 1, 1, 1,
-0.1841787, -1.237256, -4.695758, 1, 1, 1, 1, 1,
-0.18354, -2.070727, -4.06017, 1, 1, 1, 1, 1,
-0.1832509, 0.8342591, -1.934903, 1, 1, 1, 1, 1,
-0.1821721, -1.490539, -3.54266, 1, 1, 1, 1, 1,
-0.1800258, 1.050017, -0.2596704, 1, 1, 1, 1, 1,
-0.1782627, 0.6464946, 0.3616054, 1, 1, 1, 1, 1,
-0.1759549, 1.561918, 1.267717, 1, 1, 1, 1, 1,
-0.1735544, -0.791458, -3.583751, 1, 1, 1, 1, 1,
-0.1732078, -0.008049923, -1.400482, 1, 1, 1, 1, 1,
-0.1732001, 0.9701267, 0.3633536, 1, 1, 1, 1, 1,
-0.1720553, 0.07608975, -1.539702, 1, 1, 1, 1, 1,
-0.170462, 0.4637183, -0.2759535, 0, 0, 1, 1, 1,
-0.1661811, -0.3377239, -4.208632, 1, 0, 0, 1, 1,
-0.1643582, 1.212086, 0.5636235, 1, 0, 0, 1, 1,
-0.1642951, 0.8588111, 0.4514634, 1, 0, 0, 1, 1,
-0.1633969, 1.932841, 0.509321, 1, 0, 0, 1, 1,
-0.1628477, 0.6644409, 1.55863, 1, 0, 0, 1, 1,
-0.1598784, 0.2858442, -0.2958764, 0, 0, 0, 1, 1,
-0.1568577, -2.140484, -4.351364, 0, 0, 0, 1, 1,
-0.1552012, 0.8786784, -0.4940114, 0, 0, 0, 1, 1,
-0.1536132, -0.1223832, -0.8372555, 0, 0, 0, 1, 1,
-0.1497785, 1.663414, 0.2459829, 0, 0, 0, 1, 1,
-0.1475019, 0.4104249, -0.7365718, 0, 0, 0, 1, 1,
-0.1466419, 0.7638723, -0.5382462, 0, 0, 0, 1, 1,
-0.1465788, 0.6583238, -1.947399, 1, 1, 1, 1, 1,
-0.1433253, -2.044613, -2.99813, 1, 1, 1, 1, 1,
-0.134901, 1.649046, -1.127799, 1, 1, 1, 1, 1,
-0.1338927, 0.531255, -0.7402064, 1, 1, 1, 1, 1,
-0.1315593, -0.4283821, -2.723733, 1, 1, 1, 1, 1,
-0.1311422, 0.1177874, -2.732425, 1, 1, 1, 1, 1,
-0.1302603, -0.8033521, -2.953593, 1, 1, 1, 1, 1,
-0.1297936, 1.57293, 1.224541, 1, 1, 1, 1, 1,
-0.1294972, -0.03838389, -1.703825, 1, 1, 1, 1, 1,
-0.1253359, 0.3356598, -0.4718111, 1, 1, 1, 1, 1,
-0.1213697, 1.260118, -0.5070109, 1, 1, 1, 1, 1,
-0.1204534, 0.106839, -1.642446, 1, 1, 1, 1, 1,
-0.1186997, -0.4915303, -1.734964, 1, 1, 1, 1, 1,
-0.1185914, -0.9840804, -3.336919, 1, 1, 1, 1, 1,
-0.1169966, 1.011239, 2.454466, 1, 1, 1, 1, 1,
-0.1130254, -0.1699414, -3.104249, 0, 0, 1, 1, 1,
-0.109933, 1.035822, 0.4191823, 1, 0, 0, 1, 1,
-0.1087312, 2.107294, 1.063075, 1, 0, 0, 1, 1,
-0.1053567, -0.6777105, -3.398063, 1, 0, 0, 1, 1,
-0.1027556, -0.0624644, -2.349915, 1, 0, 0, 1, 1,
-0.1001783, 1.108311, -0.5471342, 1, 0, 0, 1, 1,
-0.09949075, 1.07605, 0.120971, 0, 0, 0, 1, 1,
-0.09873613, 0.8115377, -1.243238, 0, 0, 0, 1, 1,
-0.09836254, -0.2180137, -4.582346, 0, 0, 0, 1, 1,
-0.09291647, 1.160949, -1.694664, 0, 0, 0, 1, 1,
-0.09231431, -0.1327018, -2.731895, 0, 0, 0, 1, 1,
-0.08981524, -0.486276, -3.695978, 0, 0, 0, 1, 1,
-0.08966777, 0.06437586, -3.264449, 0, 0, 0, 1, 1,
-0.08481593, -0.01687456, -2.208831, 1, 1, 1, 1, 1,
-0.08311709, 2.575634, 0.08632691, 1, 1, 1, 1, 1,
-0.07371267, -0.185369, -3.227571, 1, 1, 1, 1, 1,
-0.07179052, -0.2863494, -3.12576, 1, 1, 1, 1, 1,
-0.07148839, -1.317463, -3.052415, 1, 1, 1, 1, 1,
-0.07033212, 1.020084, 0.5578628, 1, 1, 1, 1, 1,
-0.06878606, -0.009186417, -1.992338, 1, 1, 1, 1, 1,
-0.06489109, -0.8128492, -3.942219, 1, 1, 1, 1, 1,
-0.06475916, -1.727204, -2.306054, 1, 1, 1, 1, 1,
-0.063976, 0.180361, -0.6756265, 1, 1, 1, 1, 1,
-0.06079942, -0.3173566, -3.81549, 1, 1, 1, 1, 1,
-0.06059, -1.814941, -4.112275, 1, 1, 1, 1, 1,
-0.05528599, 0.1544124, 0.2052294, 1, 1, 1, 1, 1,
-0.04796333, -1.795416, -2.698681, 1, 1, 1, 1, 1,
-0.04323682, 1.049061, 0.4799015, 1, 1, 1, 1, 1,
-0.04140155, -1.402431, -3.491785, 0, 0, 1, 1, 1,
-0.03732413, -0.8483109, -3.120124, 1, 0, 0, 1, 1,
-0.0367649, -0.2587849, -1.290701, 1, 0, 0, 1, 1,
-0.03664272, 0.1841533, 0.002727544, 1, 0, 0, 1, 1,
-0.03569177, 0.4924507, -0.3009033, 1, 0, 0, 1, 1,
-0.03387089, 0.316124, 0.7848147, 1, 0, 0, 1, 1,
-0.03251601, 1.213863, -0.3775162, 0, 0, 0, 1, 1,
-0.03107072, 1.923666, -1.000759, 0, 0, 0, 1, 1,
-0.03091368, 0.4631705, 0.0196023, 0, 0, 0, 1, 1,
-0.02970454, 0.3217852, 0.5367595, 0, 0, 0, 1, 1,
-0.02895644, -0.3353548, -4.072849, 0, 0, 0, 1, 1,
-0.01383088, -0.2807017, -4.513744, 0, 0, 0, 1, 1,
-0.01105396, -1.072117, -4.285996, 0, 0, 0, 1, 1,
-0.010156, 1.169842, 0.6532155, 1, 1, 1, 1, 1,
-0.008753293, -1.494593, -4.055754, 1, 1, 1, 1, 1,
-0.005567007, 1.096932, 1.604278, 1, 1, 1, 1, 1,
-0.004666764, -2.777256, -3.029837, 1, 1, 1, 1, 1,
-0.004534536, 0.5907711, -0.7725117, 1, 1, 1, 1, 1,
-0.00341646, 1.791442, 0.9643731, 1, 1, 1, 1, 1,
0.0005098612, -0.7697052, 3.641128, 1, 1, 1, 1, 1,
0.001473653, 0.5285071, -1.2427, 1, 1, 1, 1, 1,
0.002868001, 1.556905, 0.1269162, 1, 1, 1, 1, 1,
0.005498627, -0.9831191, 1.874233, 1, 1, 1, 1, 1,
0.005971632, 0.4204822, -0.463633, 1, 1, 1, 1, 1,
0.007259327, 0.5495693, 0.2881764, 1, 1, 1, 1, 1,
0.009625459, -0.4832415, 2.038119, 1, 1, 1, 1, 1,
0.01289459, -0.4147943, 4.98246, 1, 1, 1, 1, 1,
0.01313978, -0.05586966, 3.041512, 1, 1, 1, 1, 1,
0.01772452, -1.164135, 3.153046, 0, 0, 1, 1, 1,
0.02127229, 2.532372, -0.5657433, 1, 0, 0, 1, 1,
0.0222892, -0.4422659, 2.59242, 1, 0, 0, 1, 1,
0.02242122, -0.08976126, 3.798854, 1, 0, 0, 1, 1,
0.02336033, -0.8654564, 3.150768, 1, 0, 0, 1, 1,
0.02741157, -0.4934557, 0.545258, 1, 0, 0, 1, 1,
0.02785267, -0.2900425, 3.713345, 0, 0, 0, 1, 1,
0.02904422, 0.1062074, 1.206692, 0, 0, 0, 1, 1,
0.0318495, 1.83602, 2.442861, 0, 0, 0, 1, 1,
0.03373323, 1.161054, 0.864175, 0, 0, 0, 1, 1,
0.04801621, -0.3562993, 3.56754, 0, 0, 0, 1, 1,
0.05279155, 0.8539091, -0.8422344, 0, 0, 0, 1, 1,
0.05290449, -0.4309951, 3.678599, 0, 0, 0, 1, 1,
0.05387395, -1.691633, 4.150077, 1, 1, 1, 1, 1,
0.05572952, -0.9394773, 2.777106, 1, 1, 1, 1, 1,
0.06123024, -0.6157907, 4.788847, 1, 1, 1, 1, 1,
0.06392776, -0.7587083, 2.695179, 1, 1, 1, 1, 1,
0.06406271, -1.035914, 2.841893, 1, 1, 1, 1, 1,
0.06800887, 1.133769, -2.166709, 1, 1, 1, 1, 1,
0.06860194, 1.19556, -0.1108575, 1, 1, 1, 1, 1,
0.06900496, 0.9657307, 0.6614273, 1, 1, 1, 1, 1,
0.07030488, -0.6595377, 2.894202, 1, 1, 1, 1, 1,
0.07114986, -0.7351154, 4.420554, 1, 1, 1, 1, 1,
0.07511018, -0.192663, 1.771898, 1, 1, 1, 1, 1,
0.0768323, -0.7590262, 2.704834, 1, 1, 1, 1, 1,
0.07688189, 0.1328208, 2.276278, 1, 1, 1, 1, 1,
0.08115099, 0.5447243, -0.6597362, 1, 1, 1, 1, 1,
0.08345854, -0.9635572, 1.768853, 1, 1, 1, 1, 1,
0.08593129, -0.1555261, 2.878269, 0, 0, 1, 1, 1,
0.08683691, -0.8476312, 4.014297, 1, 0, 0, 1, 1,
0.0874194, -0.940791, 1.169371, 1, 0, 0, 1, 1,
0.08956242, -0.3916397, 4.462314, 1, 0, 0, 1, 1,
0.09108308, -0.4281486, 2.120241, 1, 0, 0, 1, 1,
0.09267458, -1.294634, 3.149666, 1, 0, 0, 1, 1,
0.09343666, 0.9894979, 2.210843, 0, 0, 0, 1, 1,
0.09555597, 0.7569308, 1.212808, 0, 0, 0, 1, 1,
0.09574228, -0.5552745, 2.05858, 0, 0, 0, 1, 1,
0.09653813, 0.7999479, -0.03099559, 0, 0, 0, 1, 1,
0.09728222, 0.08626787, -0.1037555, 0, 0, 0, 1, 1,
0.09824172, 0.719254, -0.8824429, 0, 0, 0, 1, 1,
0.1009921, 0.6334689, 0.9412025, 0, 0, 0, 1, 1,
0.1018689, -0.005721484, 2.182279, 1, 1, 1, 1, 1,
0.1046483, -0.0656142, 2.465784, 1, 1, 1, 1, 1,
0.1056641, -0.0453621, 0.2343156, 1, 1, 1, 1, 1,
0.1121406, 1.494796, -0.1716786, 1, 1, 1, 1, 1,
0.1135987, -0.5784857, 1.627649, 1, 1, 1, 1, 1,
0.1162673, -0.3774538, 3.022544, 1, 1, 1, 1, 1,
0.1219787, 0.7529968, 0.006990571, 1, 1, 1, 1, 1,
0.1223143, 1.324175, 0.7623636, 1, 1, 1, 1, 1,
0.1234826, 1.373202, 0.9944767, 1, 1, 1, 1, 1,
0.1244804, 0.5030812, 0.7020566, 1, 1, 1, 1, 1,
0.1248773, -0.2070291, 2.324171, 1, 1, 1, 1, 1,
0.1271949, 2.353815, -0.8592803, 1, 1, 1, 1, 1,
0.1344347, 0.7871634, -0.7847632, 1, 1, 1, 1, 1,
0.1346683, 0.3037185, 1.072402, 1, 1, 1, 1, 1,
0.1367011, 0.1315591, 2.843688, 1, 1, 1, 1, 1,
0.1368688, -0.557359, 2.619757, 0, 0, 1, 1, 1,
0.1416335, 1.64512, 2.921419, 1, 0, 0, 1, 1,
0.1460899, -0.7599519, 3.089357, 1, 0, 0, 1, 1,
0.1491312, 0.8228099, -0.5665631, 1, 0, 0, 1, 1,
0.1575084, 0.370756, 1.25192, 1, 0, 0, 1, 1,
0.1576979, 0.7740925, -0.7781176, 1, 0, 0, 1, 1,
0.1605471, 1.789587, 2.240216, 0, 0, 0, 1, 1,
0.1657126, -1.232876, 3.162978, 0, 0, 0, 1, 1,
0.1684052, 1.349281, -0.9356194, 0, 0, 0, 1, 1,
0.1685229, -0.9599256, 3.303246, 0, 0, 0, 1, 1,
0.168798, -1.056291, 3.667927, 0, 0, 0, 1, 1,
0.1707147, 0.3053356, -0.7075869, 0, 0, 0, 1, 1,
0.1726118, 0.5375004, -0.2491536, 0, 0, 0, 1, 1,
0.1767525, 0.102545, 0.3868113, 1, 1, 1, 1, 1,
0.1805723, -0.03086354, 2.461777, 1, 1, 1, 1, 1,
0.184891, 1.074893, -0.3331546, 1, 1, 1, 1, 1,
0.184917, 0.3932139, -0.967483, 1, 1, 1, 1, 1,
0.1856826, -1.044858, 2.393866, 1, 1, 1, 1, 1,
0.1891805, -0.3537399, 2.298165, 1, 1, 1, 1, 1,
0.1959044, -1.057762, 4.833426, 1, 1, 1, 1, 1,
0.196648, 1.123621, -1.487249, 1, 1, 1, 1, 1,
0.2006226, 0.5477744, 1.054163, 1, 1, 1, 1, 1,
0.2030956, -0.3155512, 3.029366, 1, 1, 1, 1, 1,
0.2044384, 0.06873231, -0.8279318, 1, 1, 1, 1, 1,
0.2092866, 0.09457872, 0.8875507, 1, 1, 1, 1, 1,
0.2103792, 0.06843705, 2.344432, 1, 1, 1, 1, 1,
0.2108463, -1.368354, 3.099323, 1, 1, 1, 1, 1,
0.2147126, -0.813382, 2.468619, 1, 1, 1, 1, 1,
0.2177887, -2.388358, 3.343333, 0, 0, 1, 1, 1,
0.2206876, -1.133189, 1.420932, 1, 0, 0, 1, 1,
0.2207456, 2.104568, 0.02700633, 1, 0, 0, 1, 1,
0.22115, -2.138555, 4.09202, 1, 0, 0, 1, 1,
0.2224652, -0.1310494, 3.351774, 1, 0, 0, 1, 1,
0.2283624, 0.5573465, 1.595669, 1, 0, 0, 1, 1,
0.232812, 0.05994264, 0.4237817, 0, 0, 0, 1, 1,
0.2343298, -0.6188232, 2.364776, 0, 0, 0, 1, 1,
0.2368037, 1.448038, -0.9551499, 0, 0, 0, 1, 1,
0.2395597, -0.01128395, 2.249198, 0, 0, 0, 1, 1,
0.2437446, -0.6922719, 2.432771, 0, 0, 0, 1, 1,
0.2440018, -1.515912, 4.354589, 0, 0, 0, 1, 1,
0.2446025, -0.6844894, 1.755769, 0, 0, 0, 1, 1,
0.2468725, -0.6087115, 2.665681, 1, 1, 1, 1, 1,
0.2521856, 0.07669928, 1.48049, 1, 1, 1, 1, 1,
0.2555282, 0.06698438, 1.723946, 1, 1, 1, 1, 1,
0.2569601, 1.939631, -1.303355, 1, 1, 1, 1, 1,
0.2578181, 0.5473081, 2.44825, 1, 1, 1, 1, 1,
0.2672136, 0.3895229, 2.078716, 1, 1, 1, 1, 1,
0.2695373, 0.5225214, 0.5606293, 1, 1, 1, 1, 1,
0.2714529, 0.2080997, 0.5313135, 1, 1, 1, 1, 1,
0.2722839, 0.2423272, 1.338522, 1, 1, 1, 1, 1,
0.2765284, -0.8872356, 3.082272, 1, 1, 1, 1, 1,
0.2775908, 1.467525, 1.117959, 1, 1, 1, 1, 1,
0.2793514, 0.8126542, 0.8153673, 1, 1, 1, 1, 1,
0.2814054, -1.387883, 2.337752, 1, 1, 1, 1, 1,
0.2818866, 1.467582, -1.325536, 1, 1, 1, 1, 1,
0.282005, -1.407784, 3.311201, 1, 1, 1, 1, 1,
0.2939667, -2.89643, 3.330461, 0, 0, 1, 1, 1,
0.2948647, 0.4972441, 0.1839435, 1, 0, 0, 1, 1,
0.3013162, 0.6894265, 0.4600152, 1, 0, 0, 1, 1,
0.3213388, 0.6157757, 0.8267441, 1, 0, 0, 1, 1,
0.3251636, 1.099533, 2.268044, 1, 0, 0, 1, 1,
0.3275627, -1.092419, 2.401191, 1, 0, 0, 1, 1,
0.3327709, 0.1420987, 1.353165, 0, 0, 0, 1, 1,
0.3331839, 1.215337, 1.024633, 0, 0, 0, 1, 1,
0.3336312, 0.3062371, -1.637345, 0, 0, 0, 1, 1,
0.3408171, 0.8861992, 0.3885043, 0, 0, 0, 1, 1,
0.3420239, 0.04814775, 2.366811, 0, 0, 0, 1, 1,
0.3481472, -0.9827129, 3.451612, 0, 0, 0, 1, 1,
0.3483811, 1.443316, 0.7615748, 0, 0, 0, 1, 1,
0.3500398, 0.302473, -0.7438048, 1, 1, 1, 1, 1,
0.3502865, 1.006444, 0.620236, 1, 1, 1, 1, 1,
0.3510469, -0.2040062, 4.073581, 1, 1, 1, 1, 1,
0.3578782, 0.03154807, 1.025339, 1, 1, 1, 1, 1,
0.3647759, -0.8543661, 0.3991634, 1, 1, 1, 1, 1,
0.3689703, 1.293471, 2.296401, 1, 1, 1, 1, 1,
0.3689957, -0.6467564, 3.756958, 1, 1, 1, 1, 1,
0.3737939, -0.2384341, 3.347881, 1, 1, 1, 1, 1,
0.3759367, 0.7500619, 1.771539, 1, 1, 1, 1, 1,
0.3764737, -0.1242631, 2.875372, 1, 1, 1, 1, 1,
0.3805989, 0.7853427, -0.24722, 1, 1, 1, 1, 1,
0.3825519, -1.117175, 2.670996, 1, 1, 1, 1, 1,
0.3854574, -0.7616643, 2.667408, 1, 1, 1, 1, 1,
0.3899037, -0.6150197, 1.007505, 1, 1, 1, 1, 1,
0.3901485, 1.178485, 0.2231467, 1, 1, 1, 1, 1,
0.3948236, 1.23543, -1.095892, 0, 0, 1, 1, 1,
0.3975086, 0.9823994, 2.212552, 1, 0, 0, 1, 1,
0.3981806, 0.5784435, 1.040847, 1, 0, 0, 1, 1,
0.3992569, 1.559885, 0.8134574, 1, 0, 0, 1, 1,
0.400149, 0.2414007, -0.3081966, 1, 0, 0, 1, 1,
0.4046236, 0.7485061, 1.198856, 1, 0, 0, 1, 1,
0.406748, 0.7698299, 1.243233, 0, 0, 0, 1, 1,
0.4081359, 0.4184152, 0.4171318, 0, 0, 0, 1, 1,
0.4085131, -0.9597693, 3.710146, 0, 0, 0, 1, 1,
0.4098228, -0.06711215, -1.2037, 0, 0, 0, 1, 1,
0.4119098, 0.5548165, -0.2975721, 0, 0, 0, 1, 1,
0.4128567, 1.580233, -0.2552878, 0, 0, 0, 1, 1,
0.4137083, -0.4884804, 1.38487, 0, 0, 0, 1, 1,
0.4212305, 2.122369, 0.1405233, 1, 1, 1, 1, 1,
0.4238977, -0.05359066, 1.535093, 1, 1, 1, 1, 1,
0.429983, 1.049752, 1.976676, 1, 1, 1, 1, 1,
0.4370104, -0.8865294, 2.020729, 1, 1, 1, 1, 1,
0.4440541, 0.479358, -0.7748731, 1, 1, 1, 1, 1,
0.4443305, -0.207895, 2.097084, 1, 1, 1, 1, 1,
0.4482093, 0.7319299, -0.7881874, 1, 1, 1, 1, 1,
0.4501511, 1.029245, 1.146075, 1, 1, 1, 1, 1,
0.4514956, 0.1447336, -1.281211, 1, 1, 1, 1, 1,
0.4526118, 1.20048, 0.2787043, 1, 1, 1, 1, 1,
0.4638374, -1.13191, 3.196606, 1, 1, 1, 1, 1,
0.463915, -2.175821, 1.870868, 1, 1, 1, 1, 1,
0.4679477, 0.3840821, 2.186466, 1, 1, 1, 1, 1,
0.4682378, -0.3163801, 1.948212, 1, 1, 1, 1, 1,
0.4708131, 0.3777825, 1.846302, 1, 1, 1, 1, 1,
0.4715855, 0.5787397, 1.020845, 0, 0, 1, 1, 1,
0.4721404, -0.2517694, 2.913718, 1, 0, 0, 1, 1,
0.4754094, 1.857709, 0.7147127, 1, 0, 0, 1, 1,
0.4774775, -0.4813502, 2.217765, 1, 0, 0, 1, 1,
0.4820338, 0.4652714, 1.647238, 1, 0, 0, 1, 1,
0.4820827, -0.2985911, 3.30165, 1, 0, 0, 1, 1,
0.4878335, 0.5684363, -0.1227078, 0, 0, 0, 1, 1,
0.4918534, 0.3604986, 0.2277866, 0, 0, 0, 1, 1,
0.5023943, -0.7106684, 2.398932, 0, 0, 0, 1, 1,
0.5069524, -0.415704, 3.27825, 0, 0, 0, 1, 1,
0.5077512, -2.355155, 3.927524, 0, 0, 0, 1, 1,
0.5159559, 0.8916101, 0.4478432, 0, 0, 0, 1, 1,
0.5169728, 0.7606074, 0.3887981, 0, 0, 0, 1, 1,
0.5170025, -0.3553906, 2.796332, 1, 1, 1, 1, 1,
0.5179651, 0.2008095, 1.400912, 1, 1, 1, 1, 1,
0.5210987, 0.7224493, 2.144769, 1, 1, 1, 1, 1,
0.5237619, -2.148635, 2.92717, 1, 1, 1, 1, 1,
0.5261319, -0.4763539, 2.640538, 1, 1, 1, 1, 1,
0.529623, -0.4577241, 2.880796, 1, 1, 1, 1, 1,
0.5329241, 1.263018, 1.051288, 1, 1, 1, 1, 1,
0.5351676, 0.3312579, -0.4268507, 1, 1, 1, 1, 1,
0.539019, -0.08543619, 2.226542, 1, 1, 1, 1, 1,
0.5426064, 0.8362029, 0.8201858, 1, 1, 1, 1, 1,
0.5511566, -1.091095, 2.811836, 1, 1, 1, 1, 1,
0.5566076, 0.1892861, 1.876567, 1, 1, 1, 1, 1,
0.5738297, -0.143766, 2.580224, 1, 1, 1, 1, 1,
0.5744119, -0.946118, 3.074996, 1, 1, 1, 1, 1,
0.5783491, -1.960633, 1.802592, 1, 1, 1, 1, 1,
0.5859736, 0.5308485, -0.232562, 0, 0, 1, 1, 1,
0.5898135, -0.9983624, 2.675603, 1, 0, 0, 1, 1,
0.5952384, 0.3647067, 3.286771, 1, 0, 0, 1, 1,
0.595407, -1.346472, 1.293991, 1, 0, 0, 1, 1,
0.5986292, 0.2993126, 1.688788, 1, 0, 0, 1, 1,
0.599546, 1.216986, -0.6417453, 1, 0, 0, 1, 1,
0.6027057, -0.998819, 2.324086, 0, 0, 0, 1, 1,
0.6067643, 1.146855, -0.6098516, 0, 0, 0, 1, 1,
0.614908, 2.775372, 0.3752002, 0, 0, 0, 1, 1,
0.615915, 0.3123333, 2.270288, 0, 0, 0, 1, 1,
0.6200347, 0.0987078, 2.104168, 0, 0, 0, 1, 1,
0.6274863, -0.6400056, 3.949286, 0, 0, 0, 1, 1,
0.6286026, -0.2487668, 1.8804, 0, 0, 0, 1, 1,
0.630557, -2.123034, 2.798562, 1, 1, 1, 1, 1,
0.6329316, -0.8133284, 2.766754, 1, 1, 1, 1, 1,
0.6337602, -1.755402, 4.400453, 1, 1, 1, 1, 1,
0.639233, 0.7806048, -0.116653, 1, 1, 1, 1, 1,
0.6420234, 1.106277, 1.036291, 1, 1, 1, 1, 1,
0.6448203, -0.8538442, 1.583278, 1, 1, 1, 1, 1,
0.6457719, 0.002561321, 1.494018, 1, 1, 1, 1, 1,
0.649455, -0.3529145, 4.343454, 1, 1, 1, 1, 1,
0.6501383, -0.6521886, 2.329852, 1, 1, 1, 1, 1,
0.6506962, -0.2501548, 3.810034, 1, 1, 1, 1, 1,
0.6511978, -0.009873003, 0.01523272, 1, 1, 1, 1, 1,
0.6537722, -0.9110681, 3.157537, 1, 1, 1, 1, 1,
0.6543966, 1.900178, 1.2557, 1, 1, 1, 1, 1,
0.6544505, -0.009517425, 1.511031, 1, 1, 1, 1, 1,
0.6566591, -0.06262069, 2.470821, 1, 1, 1, 1, 1,
0.6585768, -0.2863023, 2.760241, 0, 0, 1, 1, 1,
0.6680706, 0.5016975, 1.944444, 1, 0, 0, 1, 1,
0.6729898, 0.3075745, 1.596933, 1, 0, 0, 1, 1,
0.6754115, -0.1598628, 1.429366, 1, 0, 0, 1, 1,
0.6776487, -1.380764, 1.344563, 1, 0, 0, 1, 1,
0.6846119, -1.253788, 3.488425, 1, 0, 0, 1, 1,
0.6847452, 1.536144, 0.1029351, 0, 0, 0, 1, 1,
0.6859025, 2.542592, 0.7472897, 0, 0, 0, 1, 1,
0.6872692, 1.903294, 0.1789091, 0, 0, 0, 1, 1,
0.6876649, -0.4531628, 1.895203, 0, 0, 0, 1, 1,
0.6894695, -0.8917993, 2.44177, 0, 0, 0, 1, 1,
0.6903325, -1.000643, 3.116025, 0, 0, 0, 1, 1,
0.6904085, 1.482447, -1.248141, 0, 0, 0, 1, 1,
0.6961436, -0.07425199, 0.7915451, 1, 1, 1, 1, 1,
0.6966748, 0.5976714, 1.789333, 1, 1, 1, 1, 1,
0.7074285, 0.2645709, 2.155755, 1, 1, 1, 1, 1,
0.70877, -1.0251, 2.065833, 1, 1, 1, 1, 1,
0.7088442, -1.00761, 2.955206, 1, 1, 1, 1, 1,
0.722207, -0.8869091, 2.833949, 1, 1, 1, 1, 1,
0.7256768, -1.088378, 1.773874, 1, 1, 1, 1, 1,
0.7267933, -0.7394542, 2.16066, 1, 1, 1, 1, 1,
0.7268933, 0.9041793, 1.296293, 1, 1, 1, 1, 1,
0.7313179, 0.3251589, -0.2041003, 1, 1, 1, 1, 1,
0.7315542, 0.7892539, 0.08889275, 1, 1, 1, 1, 1,
0.7338018, 0.1562798, 1.443146, 1, 1, 1, 1, 1,
0.7348373, 0.1894228, 0.6180624, 1, 1, 1, 1, 1,
0.7356627, 2.796551, 1.187343, 1, 1, 1, 1, 1,
0.7360215, 0.5308335, 0.8300304, 1, 1, 1, 1, 1,
0.7386207, 0.1128027, 2.858608, 0, 0, 1, 1, 1,
0.7416641, -0.1359951, 0.6297153, 1, 0, 0, 1, 1,
0.7431376, -1.328434, 2.299349, 1, 0, 0, 1, 1,
0.7462997, -1.233388, 1.473501, 1, 0, 0, 1, 1,
0.751847, -0.4763215, 0.7094852, 1, 0, 0, 1, 1,
0.7523441, 0.07960082, 2.472841, 1, 0, 0, 1, 1,
0.7530855, -0.304542, 1.981621, 0, 0, 0, 1, 1,
0.7535905, -0.5500072, 2.561346, 0, 0, 0, 1, 1,
0.7566419, 2.068714, 0.5657837, 0, 0, 0, 1, 1,
0.7724214, -0.8718927, 1.316772, 0, 0, 0, 1, 1,
0.7792663, -0.0995957, 3.174877, 0, 0, 0, 1, 1,
0.7804486, -0.401105, 2.041682, 0, 0, 0, 1, 1,
0.7844991, -0.8301095, 1.777318, 0, 0, 0, 1, 1,
0.7849588, -0.3810751, 2.391513, 1, 1, 1, 1, 1,
0.786366, 1.698863, 0.9559413, 1, 1, 1, 1, 1,
0.7864217, -0.264827, 0.9197467, 1, 1, 1, 1, 1,
0.7867774, -1.669241, 0.1495496, 1, 1, 1, 1, 1,
0.7901255, 1.423876, 0.02799327, 1, 1, 1, 1, 1,
0.7921042, -1.017163, 2.200671, 1, 1, 1, 1, 1,
0.7956762, 0.9921709, 0.6374975, 1, 1, 1, 1, 1,
0.7992777, 0.3123945, 1.343193, 1, 1, 1, 1, 1,
0.8003876, -0.4449757, 2.197907, 1, 1, 1, 1, 1,
0.8006688, 0.5314242, -0.5670281, 1, 1, 1, 1, 1,
0.8040718, -0.5968868, 2.264295, 1, 1, 1, 1, 1,
0.8092306, -0.1097648, -0.0598977, 1, 1, 1, 1, 1,
0.8124164, -0.5966331, 2.993034, 1, 1, 1, 1, 1,
0.8136923, 1.229214, 2.26919, 1, 1, 1, 1, 1,
0.8157298, -1.312722, 4.150362, 1, 1, 1, 1, 1,
0.8229392, -1.468195, 3.08445, 0, 0, 1, 1, 1,
0.8239434, 1.128424, 1.033597, 1, 0, 0, 1, 1,
0.8264477, 2.27077, 0.8719991, 1, 0, 0, 1, 1,
0.8327441, -1.817511, 1.768745, 1, 0, 0, 1, 1,
0.8450235, 0.5799151, 0.9279722, 1, 0, 0, 1, 1,
0.8475935, 0.7162076, 1.135387, 1, 0, 0, 1, 1,
0.8504643, -2.211586, 3.281274, 0, 0, 0, 1, 1,
0.8539383, 1.661424, -0.8613411, 0, 0, 0, 1, 1,
0.8543026, -1.560073, 2.276629, 0, 0, 0, 1, 1,
0.8559093, 0.004878126, 1.675418, 0, 0, 0, 1, 1,
0.8569443, 0.23344, 3.122537, 0, 0, 0, 1, 1,
0.8582424, -0.7883906, 0.236515, 0, 0, 0, 1, 1,
0.8589644, 0.08328401, 1.732173, 0, 0, 0, 1, 1,
0.85936, 0.6534491, 1.641192, 1, 1, 1, 1, 1,
0.8620338, 0.5930012, 3.182003, 1, 1, 1, 1, 1,
0.86618, 0.4964515, 0.4542041, 1, 1, 1, 1, 1,
0.8673074, -0.2395266, 3.280932, 1, 1, 1, 1, 1,
0.8693889, -0.9749452, 1.905212, 1, 1, 1, 1, 1,
0.8730386, -0.3895432, 1.712007, 1, 1, 1, 1, 1,
0.8759432, -0.8030114, 4.480202, 1, 1, 1, 1, 1,
0.87752, -1.616631, 1.979944, 1, 1, 1, 1, 1,
0.8922257, -0.07242591, 0.4676318, 1, 1, 1, 1, 1,
0.8945891, 0.2051383, 2.431276, 1, 1, 1, 1, 1,
0.8949614, -1.261376, 4.202652, 1, 1, 1, 1, 1,
0.9010116, -0.1719623, 0.351093, 1, 1, 1, 1, 1,
0.9034927, 1.29423, -0.3282419, 1, 1, 1, 1, 1,
0.9040012, -0.9243284, 1.819282, 1, 1, 1, 1, 1,
0.9058688, 0.1108725, 2.869547, 1, 1, 1, 1, 1,
0.9076517, -0.3906692, 1.498118, 0, 0, 1, 1, 1,
0.9088194, -0.9616725, 3.195632, 1, 0, 0, 1, 1,
0.9122621, 0.3175012, 0.8335733, 1, 0, 0, 1, 1,
0.9155444, -1.128838, 1.723477, 1, 0, 0, 1, 1,
0.9176111, -1.010464, 0.601957, 1, 0, 0, 1, 1,
0.9307402, 1.272021, 0.8325502, 1, 0, 0, 1, 1,
0.9334475, 0.4218733, 1.620154, 0, 0, 0, 1, 1,
0.940248, -1.134441, 2.541512, 0, 0, 0, 1, 1,
0.9436494, -1.473252, 3.755731, 0, 0, 0, 1, 1,
0.9472429, 0.4806788, 1.037146, 0, 0, 0, 1, 1,
0.9499929, 2.869307, 1.297122, 0, 0, 0, 1, 1,
0.9507886, 0.1773877, 1.070806, 0, 0, 0, 1, 1,
0.9515663, 1.908537, -1.495165, 0, 0, 0, 1, 1,
0.952612, 1.241309, -0.3119183, 1, 1, 1, 1, 1,
0.9581984, 0.05471915, 1.124175, 1, 1, 1, 1, 1,
0.9606293, 0.5435991, 2.686901, 1, 1, 1, 1, 1,
0.9640511, -0.9256052, 3.898515, 1, 1, 1, 1, 1,
0.9664295, 1.271914, -0.2638663, 1, 1, 1, 1, 1,
0.9683632, 0.5753301, 1.305398, 1, 1, 1, 1, 1,
0.9691401, 0.1707828, 0.573146, 1, 1, 1, 1, 1,
0.9724576, 1.045524, 0.4232492, 1, 1, 1, 1, 1,
0.9796593, 0.6929882, -0.1327336, 1, 1, 1, 1, 1,
0.9883953, 1.58144, 0.1956772, 1, 1, 1, 1, 1,
0.9945198, -0.09708986, 1.441151, 1, 1, 1, 1, 1,
0.9952581, -1.139435, 1.449019, 1, 1, 1, 1, 1,
1.007387, -0.6004249, 2.962724, 1, 1, 1, 1, 1,
1.008358, -0.06521133, 1.059964, 1, 1, 1, 1, 1,
1.011677, 0.4821041, 0.3185144, 1, 1, 1, 1, 1,
1.014258, 0.138403, 2.05083, 0, 0, 1, 1, 1,
1.0178, -1.211191, 2.873306, 1, 0, 0, 1, 1,
1.018393, -2.088937, 2.984463, 1, 0, 0, 1, 1,
1.01842, -0.76648, 0.3290426, 1, 0, 0, 1, 1,
1.024378, 0.5676171, 2.099075, 1, 0, 0, 1, 1,
1.024996, -0.5472651, 3.167053, 1, 0, 0, 1, 1,
1.025331, -0.9562196, 1.800232, 0, 0, 0, 1, 1,
1.027659, 0.4641793, 1.066208, 0, 0, 0, 1, 1,
1.033417, -0.2815678, 2.13466, 0, 0, 0, 1, 1,
1.035754, 0.5482785, 1.977203, 0, 0, 0, 1, 1,
1.03705, 0.1897251, 1.48465, 0, 0, 0, 1, 1,
1.048813, -0.3659217, 0.1329682, 0, 0, 0, 1, 1,
1.049583, -0.003631453, 1.047473, 0, 0, 0, 1, 1,
1.064618, -0.6337357, 1.601731, 1, 1, 1, 1, 1,
1.066018, -0.1916332, 2.266894, 1, 1, 1, 1, 1,
1.066427, -0.7055942, 0.6510559, 1, 1, 1, 1, 1,
1.06992, 0.7161068, 1.538595, 1, 1, 1, 1, 1,
1.075165, -0.2140558, 1.464378, 1, 1, 1, 1, 1,
1.081245, -0.2500841, 1.471293, 1, 1, 1, 1, 1,
1.083372, 0.07551455, 0.09000514, 1, 1, 1, 1, 1,
1.084295, 0.1258194, 2.572212, 1, 1, 1, 1, 1,
1.085354, -0.7241612, 2.677354, 1, 1, 1, 1, 1,
1.096315, -1.619835, 2.368156, 1, 1, 1, 1, 1,
1.097073, 0.6373232, 0.6027519, 1, 1, 1, 1, 1,
1.112161, 0.5510051, 2.162803, 1, 1, 1, 1, 1,
1.117476, -0.9108889, 0.2132834, 1, 1, 1, 1, 1,
1.149154, 1.605558, 1.843221, 1, 1, 1, 1, 1,
1.152167, -1.056714, 2.238951, 1, 1, 1, 1, 1,
1.152447, 1.250594, 0.7563496, 0, 0, 1, 1, 1,
1.155402, 0.8342416, -0.8486908, 1, 0, 0, 1, 1,
1.156362, -0.1902735, 2.645763, 1, 0, 0, 1, 1,
1.166974, 1.623412, -0.5376269, 1, 0, 0, 1, 1,
1.168503, 0.5971873, -1.03075, 1, 0, 0, 1, 1,
1.182842, 0.0272952, 0.805013, 1, 0, 0, 1, 1,
1.186768, -1.105112, 4.573915, 0, 0, 0, 1, 1,
1.187503, -0.4688691, 2.301692, 0, 0, 0, 1, 1,
1.189162, 0.1800754, 2.207129, 0, 0, 0, 1, 1,
1.189451, 1.783916, 0.3378169, 0, 0, 0, 1, 1,
1.190108, -1.224805, 1.772494, 0, 0, 0, 1, 1,
1.190637, 0.3129659, 1.733945, 0, 0, 0, 1, 1,
1.210084, -0.8537078, 4.15398, 0, 0, 0, 1, 1,
1.214674, 0.1933406, -0.8442651, 1, 1, 1, 1, 1,
1.216998, 1.210059, 0.2190838, 1, 1, 1, 1, 1,
1.22717, 0.5022341, 2.327376, 1, 1, 1, 1, 1,
1.229115, -0.9757094, 3.716804, 1, 1, 1, 1, 1,
1.23408, 0.3326775, 0.6251913, 1, 1, 1, 1, 1,
1.237068, 0.6062764, 3.025713, 1, 1, 1, 1, 1,
1.243024, 0.1639541, 0.367117, 1, 1, 1, 1, 1,
1.246619, -0.6852893, 1.32748, 1, 1, 1, 1, 1,
1.247757, -1.230182, 2.173967, 1, 1, 1, 1, 1,
1.248647, 0.17626, 1.278306, 1, 1, 1, 1, 1,
1.265479, 0.078347, 3.258011, 1, 1, 1, 1, 1,
1.270586, 0.9729577, -0.2150327, 1, 1, 1, 1, 1,
1.274248, -0.2592969, 1.450442, 1, 1, 1, 1, 1,
1.283469, 0.4485787, 1.101514, 1, 1, 1, 1, 1,
1.285484, -0.01263414, 2.657315, 1, 1, 1, 1, 1,
1.28906, 0.1048786, 2.950554, 0, 0, 1, 1, 1,
1.29199, 1.129066, -0.5427327, 1, 0, 0, 1, 1,
1.294622, -1.025468, 2.404177, 1, 0, 0, 1, 1,
1.306047, -0.9193591, 2.990596, 1, 0, 0, 1, 1,
1.315189, -0.3516209, 2.332505, 1, 0, 0, 1, 1,
1.318264, 0.7508702, -0.04932577, 1, 0, 0, 1, 1,
1.320395, 1.598383, 2.480845, 0, 0, 0, 1, 1,
1.329102, 0.8135139, 1.146903, 0, 0, 0, 1, 1,
1.330489, 0.5383609, -0.3260898, 0, 0, 0, 1, 1,
1.333478, 0.5035294, 1.913474, 0, 0, 0, 1, 1,
1.342648, 2.450948, -0.1936996, 0, 0, 0, 1, 1,
1.342857, -0.7192786, 3.447866, 0, 0, 0, 1, 1,
1.345925, 1.498682, 1.194736, 0, 0, 0, 1, 1,
1.348014, 1.62629, 0.4423411, 1, 1, 1, 1, 1,
1.350022, -0.5592991, 0.7641849, 1, 1, 1, 1, 1,
1.35337, -0.7409055, 2.618815, 1, 1, 1, 1, 1,
1.354356, -0.1909273, 2.352147, 1, 1, 1, 1, 1,
1.358799, 1.515314, 0.1983707, 1, 1, 1, 1, 1,
1.367881, 0.4263086, 2.261968, 1, 1, 1, 1, 1,
1.368147, 0.1707691, 1.534758, 1, 1, 1, 1, 1,
1.368824, 1.799639, -1.637855, 1, 1, 1, 1, 1,
1.383973, 0.6678297, 0.1788422, 1, 1, 1, 1, 1,
1.404104, 0.7352327, 1.80694, 1, 1, 1, 1, 1,
1.408091, -0.4191506, 1.336423, 1, 1, 1, 1, 1,
1.411846, -1.215666, 3.357758, 1, 1, 1, 1, 1,
1.416601, -0.6298922, 1.679993, 1, 1, 1, 1, 1,
1.422898, 1.041223, 0.08558038, 1, 1, 1, 1, 1,
1.440659, -0.6404134, 2.102601, 1, 1, 1, 1, 1,
1.453471, -1.20815, 1.171351, 0, 0, 1, 1, 1,
1.466039, 0.9679614, 1.660208, 1, 0, 0, 1, 1,
1.474168, 0.4701538, 2.607922, 1, 0, 0, 1, 1,
1.48052, -0.3251753, 1.290696, 1, 0, 0, 1, 1,
1.480895, -0.1642751, 3.499645, 1, 0, 0, 1, 1,
1.481374, 0.5443857, 0.3841497, 1, 0, 0, 1, 1,
1.483924, 0.9844711, 1.34008, 0, 0, 0, 1, 1,
1.486638, 0.5799375, 1.608332, 0, 0, 0, 1, 1,
1.491405, -0.2887392, 3.736998, 0, 0, 0, 1, 1,
1.496164, 0.8462643, -0.280991, 0, 0, 0, 1, 1,
1.499093, 0.8020852, -0.3279464, 0, 0, 0, 1, 1,
1.503293, 1.946517, 1.571841, 0, 0, 0, 1, 1,
1.505777, -0.2892712, 1.443215, 0, 0, 0, 1, 1,
1.509227, 0.361011, 1.095668, 1, 1, 1, 1, 1,
1.527842, -1.063755, 3.686035, 1, 1, 1, 1, 1,
1.536263, -2.622936, 0.5548631, 1, 1, 1, 1, 1,
1.540252, -0.4060687, 2.451346, 1, 1, 1, 1, 1,
1.549146, -0.5271617, 2.014456, 1, 1, 1, 1, 1,
1.554234, 0.4435538, 0.9877149, 1, 1, 1, 1, 1,
1.559655, -0.5196506, 3.542029, 1, 1, 1, 1, 1,
1.56844, 1.72103, 0.9400028, 1, 1, 1, 1, 1,
1.597518, 1.991412, 0.2847743, 1, 1, 1, 1, 1,
1.599072, 0.09990375, 3.632484, 1, 1, 1, 1, 1,
1.611639, -0.3962693, 1.56817, 1, 1, 1, 1, 1,
1.638311, 1.49781, 1.966172, 1, 1, 1, 1, 1,
1.655343, 0.1759567, 2.246219, 1, 1, 1, 1, 1,
1.688717, 2.233516, 1.509498, 1, 1, 1, 1, 1,
1.697244, 0.7490184, 2.051325, 1, 1, 1, 1, 1,
1.697343, -0.8134785, 1.018921, 0, 0, 1, 1, 1,
1.723149, 1.009312, -0.7171861, 1, 0, 0, 1, 1,
1.727633, -0.1289906, 0.801671, 1, 0, 0, 1, 1,
1.740237, 0.499602, 1.680796, 1, 0, 0, 1, 1,
1.743458, -0.06978618, 3.596504, 1, 0, 0, 1, 1,
1.752062, 0.4830726, 0.8266782, 1, 0, 0, 1, 1,
1.756499, -0.19924, 2.295609, 0, 0, 0, 1, 1,
1.759772, -0.9218143, 2.172774, 0, 0, 0, 1, 1,
1.785689, 1.84683, -0.04067515, 0, 0, 0, 1, 1,
1.801906, -0.568632, 1.725995, 0, 0, 0, 1, 1,
1.818518, 0.4370011, 2.510538, 0, 0, 0, 1, 1,
1.835021, 1.470533, 0.267335, 0, 0, 0, 1, 1,
1.876454, 0.6431891, 2.261845, 0, 0, 0, 1, 1,
1.88203, 0.8223373, -0.3543613, 1, 1, 1, 1, 1,
1.885499, 0.3134923, 2.210342, 1, 1, 1, 1, 1,
1.893988, -0.1820023, 3.183179, 1, 1, 1, 1, 1,
1.920925, 1.424462, 2.184182, 1, 1, 1, 1, 1,
1.931723, -1.084544, 3.411999, 1, 1, 1, 1, 1,
1.9389, 0.9608802, 0.2931312, 1, 1, 1, 1, 1,
1.939417, 0.04436455, 2.18241, 1, 1, 1, 1, 1,
1.939651, 0.08759156, 1.181746, 1, 1, 1, 1, 1,
1.939759, -0.3396713, 1.84138, 1, 1, 1, 1, 1,
1.954421, -0.4007538, 1.918421, 1, 1, 1, 1, 1,
1.958634, 0.3426303, 1.094469, 1, 1, 1, 1, 1,
1.987908, -2.32842, 1.778182, 1, 1, 1, 1, 1,
1.99294, 0.860799, 0.3077054, 1, 1, 1, 1, 1,
2.010036, -0.01997009, 1.324213, 1, 1, 1, 1, 1,
2.042471, 1.097826, 2.843111, 1, 1, 1, 1, 1,
2.049669, 1.847277, 2.850987, 0, 0, 1, 1, 1,
2.072723, -0.01190239, -0.2697544, 1, 0, 0, 1, 1,
2.092114, -3.475645, 1.962144, 1, 0, 0, 1, 1,
2.093466, -1.591913, 2.396162, 1, 0, 0, 1, 1,
2.101371, 2.071739, 0.5991708, 1, 0, 0, 1, 1,
2.118896, -0.09770538, 2.004198, 1, 0, 0, 1, 1,
2.126937, -0.5710641, 2.257688, 0, 0, 0, 1, 1,
2.133034, 0.4504552, 1.793308, 0, 0, 0, 1, 1,
2.147881, -0.6297089, 1.693117, 0, 0, 0, 1, 1,
2.165795, -0.143059, 2.072829, 0, 0, 0, 1, 1,
2.21179, -0.5378348, 2.806306, 0, 0, 0, 1, 1,
2.216195, -1.111399, 1.268517, 0, 0, 0, 1, 1,
2.237236, -0.6667237, 1.763571, 0, 0, 0, 1, 1,
2.281397, 1.038298, 1.295535, 1, 1, 1, 1, 1,
2.341871, 2.704684, 2.577579, 1, 1, 1, 1, 1,
2.401647, 0.280374, 1.558375, 1, 1, 1, 1, 1,
2.518788, -0.8115175, 2.046951, 1, 1, 1, 1, 1,
2.58846, -0.9685292, 1.818412, 1, 1, 1, 1, 1,
2.669359, -1.383686, 2.15994, 1, 1, 1, 1, 1,
2.882987, 0.865849, -0.1429455, 1, 1, 1, 1, 1
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
var radius = 9.976573;
var distance = 35.04229;
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
mvMatrix.translate( 0.1040492, 0.01039052, 0.8309765 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.04229);
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