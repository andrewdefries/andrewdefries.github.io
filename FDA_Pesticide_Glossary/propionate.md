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
-3.360654, 2.111408, -1.930012, 1, 0, 0, 1,
-3.032903, 0.9832609, -1.492019, 1, 0.007843138, 0, 1,
-2.780543, 0.1050237, -1.926282, 1, 0.01176471, 0, 1,
-2.725198, 1.238706, -1.135666, 1, 0.01960784, 0, 1,
-2.69042, 2.107643, -0.9974405, 1, 0.02352941, 0, 1,
-2.675885, -1.761551, -1.563109, 1, 0.03137255, 0, 1,
-2.612428, -0.6275402, -1.196611, 1, 0.03529412, 0, 1,
-2.604336, 0.4919284, -2.54081, 1, 0.04313726, 0, 1,
-2.518049, 1.779422, -0.9324974, 1, 0.04705882, 0, 1,
-2.449423, 0.5867684, 0.6040499, 1, 0.05490196, 0, 1,
-2.37713, 0.09796305, 0.03766759, 1, 0.05882353, 0, 1,
-2.328327, 0.649471, -2.90328, 1, 0.06666667, 0, 1,
-2.301632, 0.2269341, -1.954961, 1, 0.07058824, 0, 1,
-2.298665, 1.496466, -1.359537, 1, 0.07843138, 0, 1,
-2.250772, 1.430635, -1.124151, 1, 0.08235294, 0, 1,
-2.18654, -0.384439, -2.619993, 1, 0.09019608, 0, 1,
-2.163379, -0.8069273, -3.297076, 1, 0.09411765, 0, 1,
-2.145987, -0.7704946, -2.362599, 1, 0.1019608, 0, 1,
-2.090364, 0.2693157, -2.819855, 1, 0.1098039, 0, 1,
-2.058733, -1.035557, -2.092345, 1, 0.1137255, 0, 1,
-2.04974, 1.901942, -1.359959, 1, 0.1215686, 0, 1,
-2.033713, 1.623734, 0.8532235, 1, 0.1254902, 0, 1,
-2.032442, -0.5022355, -1.14987, 1, 0.1333333, 0, 1,
-2.000553, 1.54375, 0.5952665, 1, 0.1372549, 0, 1,
-1.995072, 0.7866815, -0.2835872, 1, 0.145098, 0, 1,
-1.988844, 1.136882, -2.353705, 1, 0.1490196, 0, 1,
-1.976825, 0.2364021, -1.334139, 1, 0.1568628, 0, 1,
-1.972282, 0.4667929, -1.549665, 1, 0.1607843, 0, 1,
-1.967239, -0.4976215, -3.450685, 1, 0.1686275, 0, 1,
-1.934362, 0.2417945, -0.8876963, 1, 0.172549, 0, 1,
-1.927844, 0.8933347, -1.167821, 1, 0.1803922, 0, 1,
-1.917341, -1.28447, -2.397787, 1, 0.1843137, 0, 1,
-1.910829, -1.395815, -3.570414, 1, 0.1921569, 0, 1,
-1.902346, 1.425546, -0.6532375, 1, 0.1960784, 0, 1,
-1.899556, -1.023425, -3.376805, 1, 0.2039216, 0, 1,
-1.876744, 1.511907, -2.305933, 1, 0.2117647, 0, 1,
-1.847963, 0.9617218, -1.222862, 1, 0.2156863, 0, 1,
-1.825486, -0.9690486, -2.660754, 1, 0.2235294, 0, 1,
-1.823471, -0.5852563, -2.308531, 1, 0.227451, 0, 1,
-1.805979, 0.7559341, -2.535313, 1, 0.2352941, 0, 1,
-1.791757, -0.3375639, -1.627398, 1, 0.2392157, 0, 1,
-1.755542, -2.537973, -1.891371, 1, 0.2470588, 0, 1,
-1.745794, -0.3899001, -1.611272, 1, 0.2509804, 0, 1,
-1.736616, -0.7122689, -0.06256719, 1, 0.2588235, 0, 1,
-1.715512, -1.099272, -2.753179, 1, 0.2627451, 0, 1,
-1.698531, -1.027947, -2.414022, 1, 0.2705882, 0, 1,
-1.697058, 0.7539591, -1.904577, 1, 0.2745098, 0, 1,
-1.693609, 0.57344, -0.4135982, 1, 0.282353, 0, 1,
-1.679545, -0.2129342, -1.67331, 1, 0.2862745, 0, 1,
-1.644089, -0.2145636, -0.7570819, 1, 0.2941177, 0, 1,
-1.622647, -0.06552994, -3.341294, 1, 0.3019608, 0, 1,
-1.61786, 1.013692, -2.615257, 1, 0.3058824, 0, 1,
-1.602743, 1.314338, 0.8189868, 1, 0.3137255, 0, 1,
-1.593998, 0.01686437, 0.1318126, 1, 0.3176471, 0, 1,
-1.591019, -0.09637575, -1.761203, 1, 0.3254902, 0, 1,
-1.572938, -1.191351, -3.07855, 1, 0.3294118, 0, 1,
-1.569821, 0.004444405, -1.392099, 1, 0.3372549, 0, 1,
-1.563364, 0.3567017, -1.239607, 1, 0.3411765, 0, 1,
-1.554547, 1.389055, -3.135653, 1, 0.3490196, 0, 1,
-1.53028, -0.02554814, -1.002941, 1, 0.3529412, 0, 1,
-1.530271, 0.07903334, -2.425751, 1, 0.3607843, 0, 1,
-1.529485, -0.9696981, -1.194394, 1, 0.3647059, 0, 1,
-1.52905, 3.931678, -0.338359, 1, 0.372549, 0, 1,
-1.527497, -0.008093142, -1.967119, 1, 0.3764706, 0, 1,
-1.51986, 0.5717111, -2.73892, 1, 0.3843137, 0, 1,
-1.519371, -1.177848, -2.238914, 1, 0.3882353, 0, 1,
-1.514184, -0.6096172, -1.983595, 1, 0.3960784, 0, 1,
-1.503887, 0.438193, -0.5641093, 1, 0.4039216, 0, 1,
-1.503062, -0.4973006, -0.815725, 1, 0.4078431, 0, 1,
-1.500131, 2.826055, -2.034936, 1, 0.4156863, 0, 1,
-1.495294, -1.021133, -1.802428, 1, 0.4196078, 0, 1,
-1.487634, 1.727693, 0.5092039, 1, 0.427451, 0, 1,
-1.473755, -1.929945, -2.512594, 1, 0.4313726, 0, 1,
-1.469023, -0.8682176, -2.47689, 1, 0.4392157, 0, 1,
-1.467409, -0.6358576, -0.846051, 1, 0.4431373, 0, 1,
-1.467378, 0.7119476, 0.7739699, 1, 0.4509804, 0, 1,
-1.446878, 1.38659, -1.556996, 1, 0.454902, 0, 1,
-1.443987, 0.4767184, -1.125379, 1, 0.4627451, 0, 1,
-1.433793, 1.448468, -0.5813325, 1, 0.4666667, 0, 1,
-1.432019, 0.01916548, -2.134865, 1, 0.4745098, 0, 1,
-1.425207, -2.079966, -3.457908, 1, 0.4784314, 0, 1,
-1.424712, 0.7609401, -2.490447, 1, 0.4862745, 0, 1,
-1.423551, 3.081314, 0.08215055, 1, 0.4901961, 0, 1,
-1.415373, -0.6646869, -2.367365, 1, 0.4980392, 0, 1,
-1.41239, -0.02353205, -1.438387, 1, 0.5058824, 0, 1,
-1.411359, 0.9294761, 1.19055, 1, 0.509804, 0, 1,
-1.410724, -1.244092, -1.323126, 1, 0.5176471, 0, 1,
-1.407167, -0.1876639, -1.000151, 1, 0.5215687, 0, 1,
-1.404808, 0.2057936, -1.062167, 1, 0.5294118, 0, 1,
-1.398847, 1.320033, -1.755517, 1, 0.5333334, 0, 1,
-1.396158, 1.980495, -1.288028, 1, 0.5411765, 0, 1,
-1.361768, -1.23988, -0.7210123, 1, 0.5450981, 0, 1,
-1.346382, 0.87756, -0.5408487, 1, 0.5529412, 0, 1,
-1.333305, -1.248735, -3.575988, 1, 0.5568628, 0, 1,
-1.332947, 1.535583, -1.450274, 1, 0.5647059, 0, 1,
-1.320417, 0.1694592, -1.365373, 1, 0.5686275, 0, 1,
-1.314774, 0.4165657, -1.407394, 1, 0.5764706, 0, 1,
-1.312651, 1.168812, 0.01344232, 1, 0.5803922, 0, 1,
-1.310422, 0.14617, -2.807848, 1, 0.5882353, 0, 1,
-1.310085, -1.901329, -3.095194, 1, 0.5921569, 0, 1,
-1.305878, -1.618763, -3.647367, 1, 0.6, 0, 1,
-1.303133, 0.03228667, -2.177246, 1, 0.6078432, 0, 1,
-1.302799, -0.6475797, -1.452313, 1, 0.6117647, 0, 1,
-1.300485, 0.9151006, -0.9493943, 1, 0.6196079, 0, 1,
-1.293219, 0.01510178, -3.02884, 1, 0.6235294, 0, 1,
-1.286472, 0.4493291, -0.3870864, 1, 0.6313726, 0, 1,
-1.282937, 0.7303408, -0.8244321, 1, 0.6352941, 0, 1,
-1.282799, -0.8719506, -3.088993, 1, 0.6431373, 0, 1,
-1.281879, 0.3163802, 0.06014606, 1, 0.6470588, 0, 1,
-1.278823, -0.7893209, -2.097903, 1, 0.654902, 0, 1,
-1.277935, 0.09957413, -1.612206, 1, 0.6588235, 0, 1,
-1.274468, 0.1734968, -1.433845, 1, 0.6666667, 0, 1,
-1.271915, -1.137399, -3.94849, 1, 0.6705883, 0, 1,
-1.268875, 1.089276, 0.5701722, 1, 0.6784314, 0, 1,
-1.266812, 0.5936119, -2.450415, 1, 0.682353, 0, 1,
-1.260529, 0.9463742, -2.008285, 1, 0.6901961, 0, 1,
-1.251903, 1.222509, -3.024491, 1, 0.6941177, 0, 1,
-1.243373, -0.1974382, -2.29073, 1, 0.7019608, 0, 1,
-1.242815, 0.7095615, -0.9377361, 1, 0.7098039, 0, 1,
-1.234961, -0.4692518, -2.158407, 1, 0.7137255, 0, 1,
-1.233232, 1.190494, 0.3420176, 1, 0.7215686, 0, 1,
-1.228918, -0.9429577, -3.07386, 1, 0.7254902, 0, 1,
-1.21981, 1.423767, -1.326726, 1, 0.7333333, 0, 1,
-1.217201, -0.00668792, -1.646484, 1, 0.7372549, 0, 1,
-1.209484, -0.31434, -0.2616322, 1, 0.7450981, 0, 1,
-1.202837, 0.1996114, -2.547709, 1, 0.7490196, 0, 1,
-1.180667, 0.5311007, -2.036521, 1, 0.7568628, 0, 1,
-1.176125, 0.7777621, -1.663871, 1, 0.7607843, 0, 1,
-1.165967, 1.478637, 0.9348596, 1, 0.7686275, 0, 1,
-1.159504, 0.6309932, -0.5886023, 1, 0.772549, 0, 1,
-1.159237, 0.8442019, -1.773435, 1, 0.7803922, 0, 1,
-1.15333, -0.4544088, -2.404665, 1, 0.7843137, 0, 1,
-1.15105, 1.699385, 0.5610432, 1, 0.7921569, 0, 1,
-1.149467, -0.311448, -3.368214, 1, 0.7960784, 0, 1,
-1.14812, 0.1294254, -1.05185, 1, 0.8039216, 0, 1,
-1.13396, 1.412022, 0.8613152, 1, 0.8117647, 0, 1,
-1.133451, -0.2677272, -2.045512, 1, 0.8156863, 0, 1,
-1.129156, -0.4585023, -3.621948, 1, 0.8235294, 0, 1,
-1.125517, 0.4189067, -0.08025762, 1, 0.827451, 0, 1,
-1.123376, -0.4018261, -2.677844, 1, 0.8352941, 0, 1,
-1.120969, 0.1687552, -1.767786, 1, 0.8392157, 0, 1,
-1.109351, -0.3873363, -2.058434, 1, 0.8470588, 0, 1,
-1.108273, -1.790379, -3.408502, 1, 0.8509804, 0, 1,
-1.107786, 1.278394, -0.910224, 1, 0.8588235, 0, 1,
-1.106258, -1.890995, -1.708443, 1, 0.8627451, 0, 1,
-1.097489, -0.9734556, -1.572161, 1, 0.8705882, 0, 1,
-1.095298, -1.10713, 0.8653762, 1, 0.8745098, 0, 1,
-1.094331, 1.367574, -2.294327, 1, 0.8823529, 0, 1,
-1.090773, 0.1520054, -0.4319503, 1, 0.8862745, 0, 1,
-1.072634, -0.2072102, -2.98158, 1, 0.8941177, 0, 1,
-1.058345, 2.373578, -0.8311159, 1, 0.8980392, 0, 1,
-1.050818, -0.4420696, -1.582015, 1, 0.9058824, 0, 1,
-1.041086, 0.2729014, -0.2596592, 1, 0.9137255, 0, 1,
-1.034671, -0.3137118, -3.217011, 1, 0.9176471, 0, 1,
-1.032998, 1.365086, -0.2814636, 1, 0.9254902, 0, 1,
-1.028343, -2.363671, -1.887548, 1, 0.9294118, 0, 1,
-1.026377, -0.07305368, -2.150789, 1, 0.9372549, 0, 1,
-1.016187, -2.196927, -3.328043, 1, 0.9411765, 0, 1,
-1.015025, 1.848537, 0.1912909, 1, 0.9490196, 0, 1,
-1.010302, -0.9807722, -1.920208, 1, 0.9529412, 0, 1,
-1.008489, 1.660687, 0.1246756, 1, 0.9607843, 0, 1,
-1.007122, -0.02716509, -1.601989, 1, 0.9647059, 0, 1,
-1.003122, 0.777325, -0.8049079, 1, 0.972549, 0, 1,
-0.9983836, 0.3808675, 0.7733901, 1, 0.9764706, 0, 1,
-0.9879876, -1.661834, -3.963647, 1, 0.9843137, 0, 1,
-0.9879654, -1.015836, -1.850005, 1, 0.9882353, 0, 1,
-0.9847681, -0.1318023, 0.2589938, 1, 0.9960784, 0, 1,
-0.9796213, -1.22084, -2.264673, 0.9960784, 1, 0, 1,
-0.9792006, -0.08455757, -0.7506101, 0.9921569, 1, 0, 1,
-0.9750875, 0.2688395, -2.790658, 0.9843137, 1, 0, 1,
-0.9746479, -0.5832443, -3.341651, 0.9803922, 1, 0, 1,
-0.9646752, 0.7546605, -1.546133, 0.972549, 1, 0, 1,
-0.9604291, 0.7847598, -1.826683, 0.9686275, 1, 0, 1,
-0.9589504, -0.6434598, -3.287147, 0.9607843, 1, 0, 1,
-0.9571907, 0.470532, -1.711202, 0.9568627, 1, 0, 1,
-0.9534366, -1.379723, -2.411526, 0.9490196, 1, 0, 1,
-0.9523412, -0.5946648, -1.693041, 0.945098, 1, 0, 1,
-0.9455662, -0.860092, -3.256215, 0.9372549, 1, 0, 1,
-0.9448922, 0.4970883, -1.863316, 0.9333333, 1, 0, 1,
-0.9436337, 1.62315, -0.4584279, 0.9254902, 1, 0, 1,
-0.9384803, 0.2243132, -0.8910314, 0.9215686, 1, 0, 1,
-0.9381741, -0.4727574, -0.4272895, 0.9137255, 1, 0, 1,
-0.9359458, -0.2410664, -1.26246, 0.9098039, 1, 0, 1,
-0.9358922, -0.05683127, -1.780188, 0.9019608, 1, 0, 1,
-0.9352969, -1.29777, -3.227406, 0.8941177, 1, 0, 1,
-0.9274655, -0.4236585, -2.120386, 0.8901961, 1, 0, 1,
-0.9256825, -0.05026217, -2.642332, 0.8823529, 1, 0, 1,
-0.9194511, 0.8275684, -0.5327671, 0.8784314, 1, 0, 1,
-0.9057167, 0.29977, -2.984468, 0.8705882, 1, 0, 1,
-0.9050155, -0.7743524, -2.885636, 0.8666667, 1, 0, 1,
-0.9035974, -1.580454, -1.984551, 0.8588235, 1, 0, 1,
-0.9015044, -2.441172, -1.418959, 0.854902, 1, 0, 1,
-0.9012557, -1.98466, -2.711976, 0.8470588, 1, 0, 1,
-0.897371, 1.60214, 0.2998078, 0.8431373, 1, 0, 1,
-0.8929346, -0.1244969, -2.402774, 0.8352941, 1, 0, 1,
-0.8891495, 0.4112965, -0.7394492, 0.8313726, 1, 0, 1,
-0.8815091, -0.1552879, -1.842538, 0.8235294, 1, 0, 1,
-0.8813311, -0.004893559, -1.199606, 0.8196079, 1, 0, 1,
-0.8775316, 0.7554089, -1.362952, 0.8117647, 1, 0, 1,
-0.8729375, 0.2777028, -0.9159808, 0.8078431, 1, 0, 1,
-0.866473, 2.955079, -1.580385, 0.8, 1, 0, 1,
-0.8659657, 0.07863675, -4.419957, 0.7921569, 1, 0, 1,
-0.8622834, -0.2485424, -0.9308011, 0.7882353, 1, 0, 1,
-0.8594159, -0.4574053, -2.342055, 0.7803922, 1, 0, 1,
-0.8567139, -0.1181414, -1.713744, 0.7764706, 1, 0, 1,
-0.8407155, 0.974826, 0.6393835, 0.7686275, 1, 0, 1,
-0.840615, -0.2448237, -3.669705, 0.7647059, 1, 0, 1,
-0.828658, 1.119533, 1.330184, 0.7568628, 1, 0, 1,
-0.8230208, -1.62636, -2.606122, 0.7529412, 1, 0, 1,
-0.820249, 0.4942216, 0.8468727, 0.7450981, 1, 0, 1,
-0.8173887, -1.507243, -2.651074, 0.7411765, 1, 0, 1,
-0.8153542, -0.07583045, -1.137408, 0.7333333, 1, 0, 1,
-0.8065582, -0.1915196, -2.821983, 0.7294118, 1, 0, 1,
-0.804229, -1.418595, -1.401548, 0.7215686, 1, 0, 1,
-0.7991, -0.4918579, -0.6416176, 0.7176471, 1, 0, 1,
-0.7878869, -1.481052, -2.668062, 0.7098039, 1, 0, 1,
-0.7877796, -0.8367998, -0.1580862, 0.7058824, 1, 0, 1,
-0.7845796, -0.3606804, -3.193537, 0.6980392, 1, 0, 1,
-0.7829062, -0.9917405, -2.592191, 0.6901961, 1, 0, 1,
-0.7806785, 2.780197, -1.004579, 0.6862745, 1, 0, 1,
-0.7804109, 1.256606, -2.820162, 0.6784314, 1, 0, 1,
-0.7763534, -0.9791086, -1.553779, 0.6745098, 1, 0, 1,
-0.7743409, -0.852207, -3.543157, 0.6666667, 1, 0, 1,
-0.770524, 0.3672343, -4.22943, 0.6627451, 1, 0, 1,
-0.7690319, 1.035072, 1.603642, 0.654902, 1, 0, 1,
-0.7684339, -0.07113132, -0.108381, 0.6509804, 1, 0, 1,
-0.7668858, -0.0006795999, -1.833236, 0.6431373, 1, 0, 1,
-0.7630578, 0.9292539, -2.972575, 0.6392157, 1, 0, 1,
-0.7595654, 1.084038, -1.04955, 0.6313726, 1, 0, 1,
-0.7584869, -0.4400978, -2.031276, 0.627451, 1, 0, 1,
-0.7565146, -0.2853088, -1.995416, 0.6196079, 1, 0, 1,
-0.75646, -0.8066014, -0.8852702, 0.6156863, 1, 0, 1,
-0.7506464, 0.02356062, -2.662979, 0.6078432, 1, 0, 1,
-0.7439075, 0.2169477, -2.065029, 0.6039216, 1, 0, 1,
-0.7434068, 0.5825654, -0.3886061, 0.5960785, 1, 0, 1,
-0.7415723, 1.386956, -0.5245545, 0.5882353, 1, 0, 1,
-0.740536, 1.094724, 0.4518921, 0.5843138, 1, 0, 1,
-0.7358571, 0.6349303, -2.955178, 0.5764706, 1, 0, 1,
-0.7355023, -1.031495, -2.325246, 0.572549, 1, 0, 1,
-0.7353755, 0.5148367, 0.0623959, 0.5647059, 1, 0, 1,
-0.7316462, 2.012685, -0.1518673, 0.5607843, 1, 0, 1,
-0.7257397, -0.1564832, -2.707043, 0.5529412, 1, 0, 1,
-0.7246764, 0.429594, -1.602432, 0.5490196, 1, 0, 1,
-0.7215949, 0.4222958, -1.233552, 0.5411765, 1, 0, 1,
-0.7200961, -0.3503591, -0.4778906, 0.5372549, 1, 0, 1,
-0.7193531, -1.121733, -3.344011, 0.5294118, 1, 0, 1,
-0.7125677, 1.102242, -1.127509, 0.5254902, 1, 0, 1,
-0.7104735, 0.4385379, -0.08808722, 0.5176471, 1, 0, 1,
-0.693042, -0.2248487, -0.5789198, 0.5137255, 1, 0, 1,
-0.6897833, -0.7382557, -3.561164, 0.5058824, 1, 0, 1,
-0.6864445, -0.3522879, -3.517487, 0.5019608, 1, 0, 1,
-0.6840025, 0.9033146, -0.7247761, 0.4941176, 1, 0, 1,
-0.6832453, -1.012681, -2.871496, 0.4862745, 1, 0, 1,
-0.6795627, -1.92258, -3.759958, 0.4823529, 1, 0, 1,
-0.6795542, 0.06882457, -0.0009946575, 0.4745098, 1, 0, 1,
-0.6782461, 1.904572, 0.1013741, 0.4705882, 1, 0, 1,
-0.6731619, -0.6116247, -0.6925905, 0.4627451, 1, 0, 1,
-0.6638435, -0.7555702, -0.8806316, 0.4588235, 1, 0, 1,
-0.6606788, -0.06958677, -2.727243, 0.4509804, 1, 0, 1,
-0.6571998, 0.1034959, 0.4587363, 0.4470588, 1, 0, 1,
-0.6569613, -1.875785, -4.354204, 0.4392157, 1, 0, 1,
-0.65174, 0.4418674, 0.3702197, 0.4352941, 1, 0, 1,
-0.6477525, -0.7336932, -1.113771, 0.427451, 1, 0, 1,
-0.6407772, 1.06949, -0.5703685, 0.4235294, 1, 0, 1,
-0.6351311, 1.992177, 1.663001, 0.4156863, 1, 0, 1,
-0.6348032, 0.8397447, -0.9757526, 0.4117647, 1, 0, 1,
-0.629445, 0.6034511, -0.7969018, 0.4039216, 1, 0, 1,
-0.6268599, 0.08048137, -2.713058, 0.3960784, 1, 0, 1,
-0.626406, 1.822683, -2.345914, 0.3921569, 1, 0, 1,
-0.6258281, 0.6219696, -1.818908, 0.3843137, 1, 0, 1,
-0.6247715, -0.8295245, -1.392433, 0.3803922, 1, 0, 1,
-0.6142873, 0.2016799, -0.6545104, 0.372549, 1, 0, 1,
-0.6139719, 0.2477645, -0.3828239, 0.3686275, 1, 0, 1,
-0.6099496, 0.4091945, -0.7730786, 0.3607843, 1, 0, 1,
-0.6084863, -0.5280294, -2.353316, 0.3568628, 1, 0, 1,
-0.6071865, -0.6544995, -2.528119, 0.3490196, 1, 0, 1,
-0.6051714, -0.318816, -0.8788295, 0.345098, 1, 0, 1,
-0.6033323, -1.340317, -2.515045, 0.3372549, 1, 0, 1,
-0.6014991, -1.281314, -4.775005, 0.3333333, 1, 0, 1,
-0.6010369, 0.5665348, -0.7775634, 0.3254902, 1, 0, 1,
-0.6000409, -0.3996432, -1.983309, 0.3215686, 1, 0, 1,
-0.5994175, -0.6204231, -3.984785, 0.3137255, 1, 0, 1,
-0.5977131, 0.02062384, -0.602809, 0.3098039, 1, 0, 1,
-0.5942352, -1.197419, -2.093773, 0.3019608, 1, 0, 1,
-0.5895737, -0.5153061, -0.5256049, 0.2941177, 1, 0, 1,
-0.5834858, -0.7311679, -2.301788, 0.2901961, 1, 0, 1,
-0.576984, -1.512997, -2.2618, 0.282353, 1, 0, 1,
-0.5768164, -1.323278, -2.940113, 0.2784314, 1, 0, 1,
-0.5725213, 2.07548, -0.1591126, 0.2705882, 1, 0, 1,
-0.5715744, 0.2679601, -1.265202, 0.2666667, 1, 0, 1,
-0.5656145, 1.952641, 0.5969996, 0.2588235, 1, 0, 1,
-0.5619135, 1.28525, -1.346868, 0.254902, 1, 0, 1,
-0.557927, -0.0791918, -1.003394, 0.2470588, 1, 0, 1,
-0.5531093, -0.2366318, -1.044034, 0.2431373, 1, 0, 1,
-0.5459507, 0.3408325, -1.948182, 0.2352941, 1, 0, 1,
-0.5324613, 0.04959346, -1.430396, 0.2313726, 1, 0, 1,
-0.5314909, -1.185949, -1.710602, 0.2235294, 1, 0, 1,
-0.5296174, 0.9462685, -0.1271819, 0.2196078, 1, 0, 1,
-0.5239887, -0.7623898, -2.845501, 0.2117647, 1, 0, 1,
-0.5236971, -0.7534875, -3.86749, 0.2078431, 1, 0, 1,
-0.5231496, -0.02380259, -2.232083, 0.2, 1, 0, 1,
-0.5201511, 1.048051, -2.703478, 0.1921569, 1, 0, 1,
-0.5196887, -0.8646615, -3.833402, 0.1882353, 1, 0, 1,
-0.5174624, 0.5106979, -2.862915, 0.1803922, 1, 0, 1,
-0.5166332, 0.5998874, -1.410186, 0.1764706, 1, 0, 1,
-0.513423, 0.1642519, -1.085814, 0.1686275, 1, 0, 1,
-0.506488, 0.006724042, -3.372431, 0.1647059, 1, 0, 1,
-0.5058773, 0.3676712, -2.339191, 0.1568628, 1, 0, 1,
-0.5025051, -0.5034219, -2.492688, 0.1529412, 1, 0, 1,
-0.4990893, -0.08105601, -4.009827, 0.145098, 1, 0, 1,
-0.4990452, 0.8733359, 0.1788293, 0.1411765, 1, 0, 1,
-0.497059, 0.8091301, 0.6223049, 0.1333333, 1, 0, 1,
-0.4940602, -0.875595, -3.555217, 0.1294118, 1, 0, 1,
-0.488301, 0.625993, 0.3913794, 0.1215686, 1, 0, 1,
-0.4841616, -0.2805023, -1.293263, 0.1176471, 1, 0, 1,
-0.4779175, -0.03286904, -1.504983, 0.1098039, 1, 0, 1,
-0.4768707, 1.063347, -0.6821433, 0.1058824, 1, 0, 1,
-0.4767406, -0.9181505, -3.272711, 0.09803922, 1, 0, 1,
-0.4714536, -0.4045728, -3.20526, 0.09019608, 1, 0, 1,
-0.4694632, -0.1451286, -2.883617, 0.08627451, 1, 0, 1,
-0.4643742, 1.734931, -0.3711691, 0.07843138, 1, 0, 1,
-0.4640096, -0.4336793, -2.522993, 0.07450981, 1, 0, 1,
-0.4602493, 1.006187, -1.354685, 0.06666667, 1, 0, 1,
-0.4601538, 1.075705, -1.136063, 0.0627451, 1, 0, 1,
-0.4599937, -0.2881069, -2.86418, 0.05490196, 1, 0, 1,
-0.4526771, -0.4680943, -2.592075, 0.05098039, 1, 0, 1,
-0.4524025, 1.145527, -1.605686, 0.04313726, 1, 0, 1,
-0.4486462, 0.3330171, -1.444093, 0.03921569, 1, 0, 1,
-0.4485038, 0.2056672, -0.6282508, 0.03137255, 1, 0, 1,
-0.4451977, 0.4520879, -2.148479, 0.02745098, 1, 0, 1,
-0.4412349, -0.3006637, -3.054882, 0.01960784, 1, 0, 1,
-0.4394568, -0.5858721, -2.536423, 0.01568628, 1, 0, 1,
-0.4279854, -0.8032137, -2.729142, 0.007843138, 1, 0, 1,
-0.4265437, -0.2743268, -2.316418, 0.003921569, 1, 0, 1,
-0.426238, 0.06466825, -0.9278936, 0, 1, 0.003921569, 1,
-0.4241298, 1.275377, -1.33498, 0, 1, 0.01176471, 1,
-0.4208799, 0.03325541, -0.8080714, 0, 1, 0.01568628, 1,
-0.4206528, -0.9944981, -3.523, 0, 1, 0.02352941, 1,
-0.4200659, 0.002659077, -1.059072, 0, 1, 0.02745098, 1,
-0.4200395, -0.8618903, -3.339271, 0, 1, 0.03529412, 1,
-0.4191115, 1.29522, -0.6659739, 0, 1, 0.03921569, 1,
-0.413518, -0.2477528, -3.845739, 0, 1, 0.04705882, 1,
-0.4125212, -0.1640974, -1.77279, 0, 1, 0.05098039, 1,
-0.4120527, 0.6748054, 1.005655, 0, 1, 0.05882353, 1,
-0.4078734, -0.2863106, -3.319356, 0, 1, 0.0627451, 1,
-0.4073828, 0.1081528, -1.034603, 0, 1, 0.07058824, 1,
-0.4066278, -1.48641, -2.257806, 0, 1, 0.07450981, 1,
-0.4059713, 0.877726, 0.1645756, 0, 1, 0.08235294, 1,
-0.4051616, -1.268349, -3.946013, 0, 1, 0.08627451, 1,
-0.4033691, 1.86768, -0.4505511, 0, 1, 0.09411765, 1,
-0.4019568, -0.3685657, -2.413869, 0, 1, 0.1019608, 1,
-0.4012927, -0.3435212, -2.530384, 0, 1, 0.1058824, 1,
-0.3975026, -2.0566, -3.23552, 0, 1, 0.1137255, 1,
-0.3954917, -1.287883, -1.719864, 0, 1, 0.1176471, 1,
-0.3916642, 1.417408, 1.381039, 0, 1, 0.1254902, 1,
-0.3910861, -1.485832, -3.153949, 0, 1, 0.1294118, 1,
-0.38532, 1.282013, 0.5971581, 0, 1, 0.1372549, 1,
-0.376614, -1.571116, -3.802688, 0, 1, 0.1411765, 1,
-0.3764365, 0.6950363, -1.307719, 0, 1, 0.1490196, 1,
-0.373136, 0.5112953, 0.160231, 0, 1, 0.1529412, 1,
-0.3725787, 0.2702555, -1.792089, 0, 1, 0.1607843, 1,
-0.3716184, -0.7568261, -2.055449, 0, 1, 0.1647059, 1,
-0.3715568, -0.8419214, -1.502167, 0, 1, 0.172549, 1,
-0.3685261, 0.7353862, -0.004983637, 0, 1, 0.1764706, 1,
-0.3656438, -1.268088, -4.380985, 0, 1, 0.1843137, 1,
-0.3641104, -1.10981, -4.51445, 0, 1, 0.1882353, 1,
-0.3635936, -0.53162, -2.795727, 0, 1, 0.1960784, 1,
-0.3629996, -1.399026, -3.410495, 0, 1, 0.2039216, 1,
-0.3628114, -0.2835646, -1.89523, 0, 1, 0.2078431, 1,
-0.3596515, 0.6735454, -2.521955, 0, 1, 0.2156863, 1,
-0.3586453, 0.7322037, 0.9555952, 0, 1, 0.2196078, 1,
-0.3520248, 1.273646, -0.5141445, 0, 1, 0.227451, 1,
-0.3512335, 1.076055, -1.02606, 0, 1, 0.2313726, 1,
-0.3501006, -0.6418616, -2.604639, 0, 1, 0.2392157, 1,
-0.3480962, -0.4870558, -2.010849, 0, 1, 0.2431373, 1,
-0.3462087, -0.155535, -2.334863, 0, 1, 0.2509804, 1,
-0.345893, -0.2764246, -2.092002, 0, 1, 0.254902, 1,
-0.3382557, 0.6977187, 0.2962088, 0, 1, 0.2627451, 1,
-0.3363894, 1.743054, -0.1732413, 0, 1, 0.2666667, 1,
-0.3343053, 1.211992, -0.6960256, 0, 1, 0.2745098, 1,
-0.3269532, 0.5903462, 0.1084167, 0, 1, 0.2784314, 1,
-0.3223658, -2.065534, -3.514104, 0, 1, 0.2862745, 1,
-0.3132502, 0.541321, 0.1320446, 0, 1, 0.2901961, 1,
-0.3054655, 0.05075752, -1.307767, 0, 1, 0.2980392, 1,
-0.3019935, -0.4802785, -3.911019, 0, 1, 0.3058824, 1,
-0.3003911, 0.5916309, 0.4536249, 0, 1, 0.3098039, 1,
-0.2998736, 1.255873, -1.510725, 0, 1, 0.3176471, 1,
-0.2963506, 0.008390679, -1.733963, 0, 1, 0.3215686, 1,
-0.2941406, -0.3665951, -2.167613, 0, 1, 0.3294118, 1,
-0.2920975, 0.6969096, -2.225991, 0, 1, 0.3333333, 1,
-0.2879823, 0.5537129, 0.186282, 0, 1, 0.3411765, 1,
-0.2802146, -1.360891, -2.247793, 0, 1, 0.345098, 1,
-0.2798596, 2.10331, -0.6137106, 0, 1, 0.3529412, 1,
-0.2792206, 1.30162, 0.1831889, 0, 1, 0.3568628, 1,
-0.2759098, -0.06758635, -1.860415, 0, 1, 0.3647059, 1,
-0.2743074, -1.035413, -1.824599, 0, 1, 0.3686275, 1,
-0.2726778, 0.1137442, -1.7268, 0, 1, 0.3764706, 1,
-0.2694522, 0.4494297, 1.641214, 0, 1, 0.3803922, 1,
-0.2669623, -0.3388832, -2.118801, 0, 1, 0.3882353, 1,
-0.2608416, 1.169531, -0.0004786774, 0, 1, 0.3921569, 1,
-0.2590837, -0.619076, -3.023289, 0, 1, 0.4, 1,
-0.2585636, -0.1110437, -2.844991, 0, 1, 0.4078431, 1,
-0.257825, -0.1915493, -2.831129, 0, 1, 0.4117647, 1,
-0.2529424, -0.7101085, -2.881593, 0, 1, 0.4196078, 1,
-0.2497088, -0.3337296, -3.228719, 0, 1, 0.4235294, 1,
-0.2464895, -1.714953, -2.798628, 0, 1, 0.4313726, 1,
-0.2449434, -0.719775, -0.3427305, 0, 1, 0.4352941, 1,
-0.2422733, 0.8732213, -2.744875, 0, 1, 0.4431373, 1,
-0.2411778, 0.6989966, 0.8781564, 0, 1, 0.4470588, 1,
-0.2406687, 0.1871882, -1.339516, 0, 1, 0.454902, 1,
-0.2400771, -0.3342372, -2.645861, 0, 1, 0.4588235, 1,
-0.2393097, 1.571405, -2.361236, 0, 1, 0.4666667, 1,
-0.2335958, -0.5519263, -2.912639, 0, 1, 0.4705882, 1,
-0.2291097, -2.155501, -2.396144, 0, 1, 0.4784314, 1,
-0.2280058, -0.8904986, -3.368804, 0, 1, 0.4823529, 1,
-0.2255252, 1.434304, 0.3675213, 0, 1, 0.4901961, 1,
-0.2253435, 0.2508436, -2.531737, 0, 1, 0.4941176, 1,
-0.225146, 0.6236238, 0.3262533, 0, 1, 0.5019608, 1,
-0.218271, -1.620798, -1.153609, 0, 1, 0.509804, 1,
-0.2108988, 0.3436191, -0.1728705, 0, 1, 0.5137255, 1,
-0.2065092, -0.07618554, -0.8798967, 0, 1, 0.5215687, 1,
-0.2041756, 2.274991, 1.297174, 0, 1, 0.5254902, 1,
-0.2041596, 0.1219421, -0.216173, 0, 1, 0.5333334, 1,
-0.2040259, -0.2113106, -2.857989, 0, 1, 0.5372549, 1,
-0.1999101, -1.402329, -3.955716, 0, 1, 0.5450981, 1,
-0.1977234, -1.777597, -0.2665747, 0, 1, 0.5490196, 1,
-0.197665, -0.4260014, -1.520073, 0, 1, 0.5568628, 1,
-0.1890778, -0.5072474, -3.922484, 0, 1, 0.5607843, 1,
-0.1849119, -0.6266036, -2.256527, 0, 1, 0.5686275, 1,
-0.1812879, -1.274613, -3.98954, 0, 1, 0.572549, 1,
-0.1778537, -1.354721, -3.023412, 0, 1, 0.5803922, 1,
-0.1776704, -0.4076495, -3.913244, 0, 1, 0.5843138, 1,
-0.1770881, -0.09749191, -3.694384, 0, 1, 0.5921569, 1,
-0.1765259, 0.5890527, 0.2965288, 0, 1, 0.5960785, 1,
-0.1645763, -0.7369325, -2.597587, 0, 1, 0.6039216, 1,
-0.1629611, 0.1055686, -2.295619, 0, 1, 0.6117647, 1,
-0.1626725, -1.183554, -2.440959, 0, 1, 0.6156863, 1,
-0.1600393, -1.352147, -4.769458, 0, 1, 0.6235294, 1,
-0.1575046, 0.8097233, -0.2904952, 0, 1, 0.627451, 1,
-0.1549881, -0.6800058, -2.762829, 0, 1, 0.6352941, 1,
-0.150014, -0.2589802, -2.556026, 0, 1, 0.6392157, 1,
-0.1472944, 0.2143548, 1.40586, 0, 1, 0.6470588, 1,
-0.1463851, 1.000081, -0.6760331, 0, 1, 0.6509804, 1,
-0.1404157, 1.604247, 0.1134784, 0, 1, 0.6588235, 1,
-0.131833, 0.1569198, 1.510297, 0, 1, 0.6627451, 1,
-0.1311746, 0.01669892, -1.430412, 0, 1, 0.6705883, 1,
-0.1299995, -0.3715712, -3.272991, 0, 1, 0.6745098, 1,
-0.1292416, 1.049645, -1.998525, 0, 1, 0.682353, 1,
-0.1272179, -0.109, -0.9048642, 0, 1, 0.6862745, 1,
-0.1230614, 1.054284, -1.063761, 0, 1, 0.6941177, 1,
-0.1230063, 1.105719, 0.05983247, 0, 1, 0.7019608, 1,
-0.1229027, 1.068197, 0.4181837, 0, 1, 0.7058824, 1,
-0.1228553, 0.394948, 0.2899619, 0, 1, 0.7137255, 1,
-0.1211483, -0.6815636, -2.62825, 0, 1, 0.7176471, 1,
-0.1177069, -0.5917401, -1.143383, 0, 1, 0.7254902, 1,
-0.1169503, -0.4676538, -2.792126, 0, 1, 0.7294118, 1,
-0.1146722, 0.06883874, -0.7959325, 0, 1, 0.7372549, 1,
-0.111716, -0.05481708, -1.173677, 0, 1, 0.7411765, 1,
-0.1106353, 1.635286, -0.6813952, 0, 1, 0.7490196, 1,
-0.1105075, 1.765622, -1.316658, 0, 1, 0.7529412, 1,
-0.1082001, -0.5030386, -4.348664, 0, 1, 0.7607843, 1,
-0.1076398, -0.5056295, -1.927734, 0, 1, 0.7647059, 1,
-0.103477, -0.9468094, -5.011954, 0, 1, 0.772549, 1,
-0.1033764, -1.636422, -4.136493, 0, 1, 0.7764706, 1,
-0.1016889, 0.1909836, -0.8769135, 0, 1, 0.7843137, 1,
-0.1011103, -0.1779629, -2.560601, 0, 1, 0.7882353, 1,
-0.09765241, -1.618517, -3.001407, 0, 1, 0.7960784, 1,
-0.09704296, 0.8800335, 0.2870253, 0, 1, 0.8039216, 1,
-0.09457473, 0.8991807, -0.3852365, 0, 1, 0.8078431, 1,
-0.09267491, 1.129193, -1.002835, 0, 1, 0.8156863, 1,
-0.08493841, 0.6356431, -1.89632, 0, 1, 0.8196079, 1,
-0.08371329, -1.047469, -3.108572, 0, 1, 0.827451, 1,
-0.08205716, -0.493522, -3.567306, 0, 1, 0.8313726, 1,
-0.0770354, 0.492783, -1.729573, 0, 1, 0.8392157, 1,
-0.07560516, -0.8611746, -4.198119, 0, 1, 0.8431373, 1,
-0.07425915, 0.9850278, 0.2046593, 0, 1, 0.8509804, 1,
-0.07400572, 0.7268301, 1.380462, 0, 1, 0.854902, 1,
-0.0720606, -0.3103594, -2.787568, 0, 1, 0.8627451, 1,
-0.07182622, 0.3252046, 0.9914768, 0, 1, 0.8666667, 1,
-0.06780504, -2.170073, -2.767735, 0, 1, 0.8745098, 1,
-0.0675211, 0.194748, 0.07293835, 0, 1, 0.8784314, 1,
-0.06517407, -0.7271127, -2.418875, 0, 1, 0.8862745, 1,
-0.06282334, 0.7975559, -1.817382, 0, 1, 0.8901961, 1,
-0.05976018, -0.7893553, -2.776842, 0, 1, 0.8980392, 1,
-0.05971545, 2.064882, 0.1027665, 0, 1, 0.9058824, 1,
-0.0582272, 0.7681178, 0.8024709, 0, 1, 0.9098039, 1,
-0.05737276, -0.9340481, -2.270487, 0, 1, 0.9176471, 1,
-0.05646475, 2.221005, -0.9500679, 0, 1, 0.9215686, 1,
-0.05450317, -0.9920324, -2.225309, 0, 1, 0.9294118, 1,
-0.04672073, 1.524905, 1.449084, 0, 1, 0.9333333, 1,
-0.04114879, 1.548393, -0.0658718, 0, 1, 0.9411765, 1,
-0.0381768, 0.6382531, -0.7660565, 0, 1, 0.945098, 1,
-0.03720874, -0.7596639, -1.505335, 0, 1, 0.9529412, 1,
-0.03659466, 0.3287987, 0.6339158, 0, 1, 0.9568627, 1,
-0.03115571, 1.353383, -1.31955, 0, 1, 0.9647059, 1,
-0.0309291, 0.3599005, 0.06284287, 0, 1, 0.9686275, 1,
-0.02815444, 0.7628009, 0.3820738, 0, 1, 0.9764706, 1,
-0.02699084, -0.2393244, -2.119807, 0, 1, 0.9803922, 1,
-0.0261548, 0.3581067, -1.263653, 0, 1, 0.9882353, 1,
-0.02316017, -0.5474377, -1.820523, 0, 1, 0.9921569, 1,
-0.01739418, 0.5536147, -0.1603888, 0, 1, 1, 1,
-0.01361381, -0.5138239, -2.508367, 0, 0.9921569, 1, 1,
-0.01182709, 0.1868827, 0.1358183, 0, 0.9882353, 1, 1,
-0.01001103, 1.745364, 0.9727497, 0, 0.9803922, 1, 1,
-0.007656983, -0.1505387, -2.459662, 0, 0.9764706, 1, 1,
-0.006940395, 0.6474776, -0.4927108, 0, 0.9686275, 1, 1,
-0.006502028, 0.3489216, -0.6879807, 0, 0.9647059, 1, 1,
-0.0008094854, 0.3267486, -1.370617, 0, 0.9568627, 1, 1,
0.005457154, 1.438892, 0.6030901, 0, 0.9529412, 1, 1,
0.007668697, 1.849923, -0.1122106, 0, 0.945098, 1, 1,
0.01007745, -0.452602, 1.868774, 0, 0.9411765, 1, 1,
0.01353218, 2.106052, 0.7128134, 0, 0.9333333, 1, 1,
0.01539519, -0.3139974, 2.984869, 0, 0.9294118, 1, 1,
0.01575953, -1.763943, 4.218201, 0, 0.9215686, 1, 1,
0.02045071, -1.121698, 3.424717, 0, 0.9176471, 1, 1,
0.02278308, -1.225381, 2.628284, 0, 0.9098039, 1, 1,
0.02396623, 0.2627897, 0.1739433, 0, 0.9058824, 1, 1,
0.03506269, 1.307184, 0.8702441, 0, 0.8980392, 1, 1,
0.04181906, -0.8202763, 3.825463, 0, 0.8901961, 1, 1,
0.04346571, 1.656144, 0.8469943, 0, 0.8862745, 1, 1,
0.05167955, 2.062469, 1.237458, 0, 0.8784314, 1, 1,
0.05357371, -0.2272932, 2.007851, 0, 0.8745098, 1, 1,
0.055654, 2.050277, -0.3637431, 0, 0.8666667, 1, 1,
0.05676353, -1.455926, 3.762354, 0, 0.8627451, 1, 1,
0.05717164, 0.6828506, 0.1505286, 0, 0.854902, 1, 1,
0.057956, 0.3529818, -0.938961, 0, 0.8509804, 1, 1,
0.05906134, -1.576674, 3.09264, 0, 0.8431373, 1, 1,
0.06164323, -0.0418279, 3.35271, 0, 0.8392157, 1, 1,
0.06187386, -0.8469944, 2.465676, 0, 0.8313726, 1, 1,
0.0643538, 1.513057, -2.151013, 0, 0.827451, 1, 1,
0.06641145, -0.2261429, 4.434537, 0, 0.8196079, 1, 1,
0.06982908, -1.626919, 1.260164, 0, 0.8156863, 1, 1,
0.07006344, -0.3148063, 2.073689, 0, 0.8078431, 1, 1,
0.07367779, -0.5418109, 2.179657, 0, 0.8039216, 1, 1,
0.07369911, -0.7160623, 2.106108, 0, 0.7960784, 1, 1,
0.07850263, -1.419843, 4.413421, 0, 0.7882353, 1, 1,
0.09257059, -0.1678828, 1.968417, 0, 0.7843137, 1, 1,
0.09484514, -1.16484, 4.736761, 0, 0.7764706, 1, 1,
0.09532412, -0.1157679, 0.1051059, 0, 0.772549, 1, 1,
0.0986762, 0.06229918, 1.615853, 0, 0.7647059, 1, 1,
0.1000446, 0.7810972, -2.600411, 0, 0.7607843, 1, 1,
0.1003184, 0.5764225, -0.6274006, 0, 0.7529412, 1, 1,
0.1016159, -0.1514755, 3.818288, 0, 0.7490196, 1, 1,
0.103421, 0.5165688, 0.7608065, 0, 0.7411765, 1, 1,
0.1095861, 2.279329, -0.7137753, 0, 0.7372549, 1, 1,
0.109975, 0.5575244, -0.609721, 0, 0.7294118, 1, 1,
0.1114495, 0.2468402, 0.4268345, 0, 0.7254902, 1, 1,
0.1124847, 0.2879471, -0.1635465, 0, 0.7176471, 1, 1,
0.1160448, -2.000226, 2.280843, 0, 0.7137255, 1, 1,
0.1160696, 1.10264, 0.7705255, 0, 0.7058824, 1, 1,
0.1218038, -0.8594303, 0.3988112, 0, 0.6980392, 1, 1,
0.1259396, 0.001730392, -0.03315955, 0, 0.6941177, 1, 1,
0.1279157, 0.3588746, 0.2482136, 0, 0.6862745, 1, 1,
0.1340231, 0.06593076, 0.767584, 0, 0.682353, 1, 1,
0.1350417, -1.248118, 1.388383, 0, 0.6745098, 1, 1,
0.1375886, 1.305587, -0.4706987, 0, 0.6705883, 1, 1,
0.1405084, 0.8958804, 0.06022256, 0, 0.6627451, 1, 1,
0.1408164, -0.007863815, 1.492241, 0, 0.6588235, 1, 1,
0.1418786, 0.008531804, 0.9529113, 0, 0.6509804, 1, 1,
0.1451607, 0.7412961, -1.300389, 0, 0.6470588, 1, 1,
0.1452593, 1.530171, 0.3427693, 0, 0.6392157, 1, 1,
0.1490766, 0.5317444, -0.4685963, 0, 0.6352941, 1, 1,
0.1503392, -1.092676, 3.804229, 0, 0.627451, 1, 1,
0.1514147, -0.3645334, 2.585896, 0, 0.6235294, 1, 1,
0.1547719, 1.625265, -0.2348583, 0, 0.6156863, 1, 1,
0.156082, -1.086175, 1.508228, 0, 0.6117647, 1, 1,
0.1568036, 0.9355515, 0.7823403, 0, 0.6039216, 1, 1,
0.1592279, 1.16333, -0.4207602, 0, 0.5960785, 1, 1,
0.159431, 0.7500501, 0.8710639, 0, 0.5921569, 1, 1,
0.1618478, 0.7076067, 1.47725, 0, 0.5843138, 1, 1,
0.1633273, -1.021615, 2.195737, 0, 0.5803922, 1, 1,
0.1636827, -0.3295686, 3.003824, 0, 0.572549, 1, 1,
0.1706808, -0.3074063, 3.171184, 0, 0.5686275, 1, 1,
0.1745251, 2.167909, 0.8934394, 0, 0.5607843, 1, 1,
0.1877831, -1.000509, 2.993653, 0, 0.5568628, 1, 1,
0.1905564, 1.660297, 0.8600392, 0, 0.5490196, 1, 1,
0.1911029, 0.8110743, 2.231798, 0, 0.5450981, 1, 1,
0.1933224, 1.075924, -0.922664, 0, 0.5372549, 1, 1,
0.1944498, 0.4861593, 0.8694357, 0, 0.5333334, 1, 1,
0.1989341, 0.240927, 2.344446, 0, 0.5254902, 1, 1,
0.2011781, 1.27828, 2.133761, 0, 0.5215687, 1, 1,
0.2067922, 1.17468, -0.1372997, 0, 0.5137255, 1, 1,
0.2080165, 1.079098, -0.02861899, 0, 0.509804, 1, 1,
0.2108312, 0.0694039, 1.101345, 0, 0.5019608, 1, 1,
0.2108447, -2.008334, 3.120543, 0, 0.4941176, 1, 1,
0.2198678, -0.232557, 1.176971, 0, 0.4901961, 1, 1,
0.2211044, -0.7469164, 3.790756, 0, 0.4823529, 1, 1,
0.2245516, -0.6962763, 2.273568, 0, 0.4784314, 1, 1,
0.2285239, -1.151088, 3.354356, 0, 0.4705882, 1, 1,
0.2300328, 1.212646, -0.3332151, 0, 0.4666667, 1, 1,
0.2312523, -0.8337067, 2.017647, 0, 0.4588235, 1, 1,
0.2323322, -1.767236, 2.889065, 0, 0.454902, 1, 1,
0.2416697, -0.6556535, 1.861294, 0, 0.4470588, 1, 1,
0.2435394, -1.383534, 2.700449, 0, 0.4431373, 1, 1,
0.2456083, -0.9376222, 4.234194, 0, 0.4352941, 1, 1,
0.246064, 1.417577, 0.6278659, 0, 0.4313726, 1, 1,
0.2497011, 0.5486555, 0.9109249, 0, 0.4235294, 1, 1,
0.2523261, 0.2141333, 0.06997932, 0, 0.4196078, 1, 1,
0.2551166, 0.6189653, 0.3210699, 0, 0.4117647, 1, 1,
0.2575144, -2.003123, 3.048163, 0, 0.4078431, 1, 1,
0.2581328, -1.13217, 2.571984, 0, 0.4, 1, 1,
0.2621029, 0.7532559, -0.1363025, 0, 0.3921569, 1, 1,
0.2668501, 1.814897, -0.5223624, 0, 0.3882353, 1, 1,
0.2680667, 0.7672279, 0.7831212, 0, 0.3803922, 1, 1,
0.2694654, -2.013725, 2.152472, 0, 0.3764706, 1, 1,
0.2701105, 1.257857, 1.67673, 0, 0.3686275, 1, 1,
0.2746138, 0.1378533, 1.756524, 0, 0.3647059, 1, 1,
0.2752775, -0.8697251, 2.455039, 0, 0.3568628, 1, 1,
0.2758689, 1.595598, -2.144962, 0, 0.3529412, 1, 1,
0.2762917, 0.5394279, 1.356925, 0, 0.345098, 1, 1,
0.2797522, 1.318099, 1.244668, 0, 0.3411765, 1, 1,
0.2810164, -0.6722752, 0.7464381, 0, 0.3333333, 1, 1,
0.2881186, -0.05499512, 1.79889, 0, 0.3294118, 1, 1,
0.2891706, 1.371873, -2.115683, 0, 0.3215686, 1, 1,
0.2965573, -1.084812, 3.700553, 0, 0.3176471, 1, 1,
0.2976265, 0.7744431, -0.446743, 0, 0.3098039, 1, 1,
0.297642, -0.5677992, 2.503448, 0, 0.3058824, 1, 1,
0.3000389, -0.01878081, 2.075578, 0, 0.2980392, 1, 1,
0.3029177, 0.02375855, 1.558264, 0, 0.2901961, 1, 1,
0.3034256, -0.6911801, 3.50128, 0, 0.2862745, 1, 1,
0.3064009, -1.187547, 1.769458, 0, 0.2784314, 1, 1,
0.3069058, -0.5066885, 3.694484, 0, 0.2745098, 1, 1,
0.312, 0.3201761, 0.8694075, 0, 0.2666667, 1, 1,
0.3136362, 0.290597, -0.03768577, 0, 0.2627451, 1, 1,
0.3149881, -0.2385484, 2.766732, 0, 0.254902, 1, 1,
0.3150222, -0.2579484, 2.249252, 0, 0.2509804, 1, 1,
0.315741, 0.3631027, 0.1294668, 0, 0.2431373, 1, 1,
0.3180883, -0.6682121, 3.266465, 0, 0.2392157, 1, 1,
0.3198397, 0.5523112, 1.698821, 0, 0.2313726, 1, 1,
0.3210749, -2.057858, 3.226939, 0, 0.227451, 1, 1,
0.3267223, -0.8736423, 4.661529, 0, 0.2196078, 1, 1,
0.3328816, -0.5753582, 2.472661, 0, 0.2156863, 1, 1,
0.3330716, 0.5638692, 1.814061, 0, 0.2078431, 1, 1,
0.3379773, 1.572627, -0.9194121, 0, 0.2039216, 1, 1,
0.3419878, -0.4299434, 3.536534, 0, 0.1960784, 1, 1,
0.3429513, 1.170828, -0.8898451, 0, 0.1882353, 1, 1,
0.3490323, -1.452794, 3.245278, 0, 0.1843137, 1, 1,
0.3545437, -0.3636873, 0.2452302, 0, 0.1764706, 1, 1,
0.3545959, 0.7995011, 0.308634, 0, 0.172549, 1, 1,
0.3557293, -0.4977659, 2.574346, 0, 0.1647059, 1, 1,
0.3647958, -1.21767, 2.852222, 0, 0.1607843, 1, 1,
0.3676048, 1.801787, 2.675102, 0, 0.1529412, 1, 1,
0.3704327, -0.1117685, 1.35524, 0, 0.1490196, 1, 1,
0.3735577, 0.9347392, 0.3763365, 0, 0.1411765, 1, 1,
0.3736259, -0.889497, 3.64905, 0, 0.1372549, 1, 1,
0.374412, 0.5764532, 1.695813, 0, 0.1294118, 1, 1,
0.3756677, -1.097672, 3.14941, 0, 0.1254902, 1, 1,
0.3794289, 0.2233883, 2.41977, 0, 0.1176471, 1, 1,
0.3798119, 0.135799, 1.830278, 0, 0.1137255, 1, 1,
0.3810211, 0.01665513, 2.321776, 0, 0.1058824, 1, 1,
0.3817692, -0.9536546, 1.779305, 0, 0.09803922, 1, 1,
0.3827489, 0.5454545, 0.3298412, 0, 0.09411765, 1, 1,
0.3847504, 0.1721414, 1.818345, 0, 0.08627451, 1, 1,
0.3873194, 1.469629, -1.290575, 0, 0.08235294, 1, 1,
0.3886793, 0.3090387, -0.9657156, 0, 0.07450981, 1, 1,
0.388878, 0.4023179, 2.155023, 0, 0.07058824, 1, 1,
0.391445, -0.7877322, 1.951471, 0, 0.0627451, 1, 1,
0.4004517, 0.1713417, 0.1492455, 0, 0.05882353, 1, 1,
0.400812, -1.267301, 3.01658, 0, 0.05098039, 1, 1,
0.400925, -1.628154, 3.765807, 0, 0.04705882, 1, 1,
0.4042363, -0.8206671, 2.816149, 0, 0.03921569, 1, 1,
0.4079814, 0.6508235, 0.4913229, 0, 0.03529412, 1, 1,
0.4105392, -0.6523318, 3.838122, 0, 0.02745098, 1, 1,
0.4136103, 0.9161473, -0.2736301, 0, 0.02352941, 1, 1,
0.4208366, 0.3125633, -0.2611677, 0, 0.01568628, 1, 1,
0.4224283, 1.105752, 1.092025, 0, 0.01176471, 1, 1,
0.4239202, -0.5337724, 2.59828, 0, 0.003921569, 1, 1,
0.4258782, -1.868525, 3.254809, 0.003921569, 0, 1, 1,
0.4341587, 0.1825859, -0.450929, 0.007843138, 0, 1, 1,
0.4351811, -0.2086685, 3.563277, 0.01568628, 0, 1, 1,
0.4372492, 0.1016475, -0.04064877, 0.01960784, 0, 1, 1,
0.4396914, -1.239124, 2.305398, 0.02745098, 0, 1, 1,
0.447167, 1.927009, 1.012632, 0.03137255, 0, 1, 1,
0.4567442, 0.504434, 0.8457611, 0.03921569, 0, 1, 1,
0.457324, 1.565065, -1.382604, 0.04313726, 0, 1, 1,
0.4584645, 0.4998346, 0.7304374, 0.05098039, 0, 1, 1,
0.4648325, -0.3495283, -0.1899313, 0.05490196, 0, 1, 1,
0.468564, -0.9616843, 3.014888, 0.0627451, 0, 1, 1,
0.470478, 1.559335, 0.3631858, 0.06666667, 0, 1, 1,
0.4725008, -0.3157086, 1.074612, 0.07450981, 0, 1, 1,
0.4749855, -0.3841233, 3.693319, 0.07843138, 0, 1, 1,
0.4749874, -1.527506, 3.942796, 0.08627451, 0, 1, 1,
0.4779968, 0.06186734, 2.444255, 0.09019608, 0, 1, 1,
0.4803503, 0.9822147, 1.885366, 0.09803922, 0, 1, 1,
0.4804266, -0.4045591, 1.37507, 0.1058824, 0, 1, 1,
0.4887793, 0.4298629, -0.6497203, 0.1098039, 0, 1, 1,
0.491161, 1.709063, -0.07524649, 0.1176471, 0, 1, 1,
0.4943649, -0.680059, 3.358136, 0.1215686, 0, 1, 1,
0.4973598, -0.09522989, 2.290164, 0.1294118, 0, 1, 1,
0.4988394, -0.003757677, 1.464481, 0.1333333, 0, 1, 1,
0.5005444, 1.384932, 1.139637, 0.1411765, 0, 1, 1,
0.5008316, -0.8611959, 4.181471, 0.145098, 0, 1, 1,
0.5018025, -1.64218, 2.152617, 0.1529412, 0, 1, 1,
0.5024221, -0.3988328, 0.6688661, 0.1568628, 0, 1, 1,
0.5036477, -0.7103849, 0.2638865, 0.1647059, 0, 1, 1,
0.5086544, 1.27484, -1.701719, 0.1686275, 0, 1, 1,
0.5127105, 0.7467823, 0.2478336, 0.1764706, 0, 1, 1,
0.5140368, 1.107525, 0.7350957, 0.1803922, 0, 1, 1,
0.5159988, 0.9463661, -0.08502231, 0.1882353, 0, 1, 1,
0.518221, -0.05493645, 1.424734, 0.1921569, 0, 1, 1,
0.5218005, -0.8615168, 1.932536, 0.2, 0, 1, 1,
0.5219189, 0.1596084, 0.6886719, 0.2078431, 0, 1, 1,
0.5294083, -0.6356292, 1.296869, 0.2117647, 0, 1, 1,
0.5298465, -0.518462, 2.69276, 0.2196078, 0, 1, 1,
0.5327296, 0.5349122, -0.1888552, 0.2235294, 0, 1, 1,
0.5332896, 1.363645, 0.05419334, 0.2313726, 0, 1, 1,
0.5364092, -1.399214, 4.424819, 0.2352941, 0, 1, 1,
0.5367097, -1.372902, 2.762811, 0.2431373, 0, 1, 1,
0.5416539, -0.6310889, 3.703915, 0.2470588, 0, 1, 1,
0.5425934, -1.032075, 1.112641, 0.254902, 0, 1, 1,
0.5463046, -0.9327431, 2.016338, 0.2588235, 0, 1, 1,
0.548592, -0.01214497, 2.928292, 0.2666667, 0, 1, 1,
0.5486672, -0.009794597, 1.392374, 0.2705882, 0, 1, 1,
0.5494251, 0.2366603, 1.634484, 0.2784314, 0, 1, 1,
0.5544465, -1.40585, 2.884171, 0.282353, 0, 1, 1,
0.5589131, 1.371181, 0.111888, 0.2901961, 0, 1, 1,
0.5623983, -0.4383464, 3.471079, 0.2941177, 0, 1, 1,
0.5712503, -0.4474047, 2.186732, 0.3019608, 0, 1, 1,
0.5804449, 0.4456533, -0.03553504, 0.3098039, 0, 1, 1,
0.5873083, 1.791814, 1.145208, 0.3137255, 0, 1, 1,
0.5876088, 0.2457287, 2.320922, 0.3215686, 0, 1, 1,
0.5902525, 0.4217697, 1.701754, 0.3254902, 0, 1, 1,
0.5949608, -0.6265516, 2.590932, 0.3333333, 0, 1, 1,
0.5964093, 1.22432, 1.34801, 0.3372549, 0, 1, 1,
0.596868, -1.687837, 1.512235, 0.345098, 0, 1, 1,
0.5970857, 0.8525234, 0.2466503, 0.3490196, 0, 1, 1,
0.603335, -2.122201, 0.7115455, 0.3568628, 0, 1, 1,
0.6034168, -0.1664468, 1.395795, 0.3607843, 0, 1, 1,
0.6069632, -0.8169658, 2.390071, 0.3686275, 0, 1, 1,
0.6072993, -0.03509817, 2.356016, 0.372549, 0, 1, 1,
0.6076784, -1.071223, 4.486048, 0.3803922, 0, 1, 1,
0.6140195, -1.498671, 1.752005, 0.3843137, 0, 1, 1,
0.6175637, 0.2696275, 1.961271, 0.3921569, 0, 1, 1,
0.6180859, 1.446957, -1.157868, 0.3960784, 0, 1, 1,
0.6238955, -0.6213759, 2.598799, 0.4039216, 0, 1, 1,
0.6253137, 0.1972002, 0.1117883, 0.4117647, 0, 1, 1,
0.6321161, 0.641909, 0.02814756, 0.4156863, 0, 1, 1,
0.6361541, 0.277931, 1.191375, 0.4235294, 0, 1, 1,
0.6364107, -1.829331, 3.992081, 0.427451, 0, 1, 1,
0.6382729, 0.8796887, 1.767547, 0.4352941, 0, 1, 1,
0.6421314, 1.169197, 0.8341995, 0.4392157, 0, 1, 1,
0.6442769, 0.9476938, -0.8438268, 0.4470588, 0, 1, 1,
0.6458858, 0.001794423, 0.7810928, 0.4509804, 0, 1, 1,
0.64613, -0.8374007, 2.442514, 0.4588235, 0, 1, 1,
0.6475838, 0.01338847, 0.6512048, 0.4627451, 0, 1, 1,
0.64849, -0.5114058, 2.104123, 0.4705882, 0, 1, 1,
0.6488493, -0.501784, 2.47628, 0.4745098, 0, 1, 1,
0.6515101, 1.145829, 0.6240116, 0.4823529, 0, 1, 1,
0.6577132, 0.8511721, -0.04252414, 0.4862745, 0, 1, 1,
0.6618773, 0.4452901, 1.618219, 0.4941176, 0, 1, 1,
0.6622968, 0.6493349, 0.6100373, 0.5019608, 0, 1, 1,
0.666927, -0.4129603, 1.926612, 0.5058824, 0, 1, 1,
0.6734236, -0.1150791, 1.86433, 0.5137255, 0, 1, 1,
0.6749949, -1.180397, 2.01462, 0.5176471, 0, 1, 1,
0.6769328, -0.8863184, 2.858588, 0.5254902, 0, 1, 1,
0.6776882, -0.6373677, 2.164266, 0.5294118, 0, 1, 1,
0.6794384, 1.095726, 0.9693173, 0.5372549, 0, 1, 1,
0.680219, 1.187371, 1.905219, 0.5411765, 0, 1, 1,
0.6839526, 0.9723617, 0.7196915, 0.5490196, 0, 1, 1,
0.6848275, 0.5563836, 0.143681, 0.5529412, 0, 1, 1,
0.6864517, -0.3414581, 0.5334587, 0.5607843, 0, 1, 1,
0.6885788, -0.2634311, 3.054331, 0.5647059, 0, 1, 1,
0.691507, -0.06255171, 0.6666263, 0.572549, 0, 1, 1,
0.6942472, -0.1527653, 2.395234, 0.5764706, 0, 1, 1,
0.6946146, 1.362538, -1.799379, 0.5843138, 0, 1, 1,
0.6960256, 0.1269876, 1.570736, 0.5882353, 0, 1, 1,
0.7004467, 3.186579, 0.2368219, 0.5960785, 0, 1, 1,
0.7022377, -1.295316, 3.790694, 0.6039216, 0, 1, 1,
0.7137082, 0.9541884, -0.6092207, 0.6078432, 0, 1, 1,
0.7191749, 1.347697, 1.799098, 0.6156863, 0, 1, 1,
0.7192017, -0.8994098, 1.784994, 0.6196079, 0, 1, 1,
0.7194746, 0.4221856, 0.2046147, 0.627451, 0, 1, 1,
0.7219635, 0.8687286, 1.150331, 0.6313726, 0, 1, 1,
0.7238166, 0.2933797, 1.799831, 0.6392157, 0, 1, 1,
0.7254886, -1.700146, 4.56131, 0.6431373, 0, 1, 1,
0.7273951, -0.399052, 3.564165, 0.6509804, 0, 1, 1,
0.7288314, -0.8013778, 1.704294, 0.654902, 0, 1, 1,
0.7291924, -1.32206, 3.42592, 0.6627451, 0, 1, 1,
0.736475, -1.116745, 4.386686, 0.6666667, 0, 1, 1,
0.739648, 2.076991, 1.657383, 0.6745098, 0, 1, 1,
0.7428809, -0.6277189, 2.950473, 0.6784314, 0, 1, 1,
0.7450266, 0.697842, -0.09239172, 0.6862745, 0, 1, 1,
0.7531379, 2.653871, 0.7862315, 0.6901961, 0, 1, 1,
0.7560879, -1.248342, 2.891552, 0.6980392, 0, 1, 1,
0.7571172, -0.437296, 2.929693, 0.7058824, 0, 1, 1,
0.7577493, 0.2502049, 1.809576, 0.7098039, 0, 1, 1,
0.7644675, -0.4226531, 2.127069, 0.7176471, 0, 1, 1,
0.7650227, -0.9014893, 3.206435, 0.7215686, 0, 1, 1,
0.7665522, -0.09999079, 0.8635204, 0.7294118, 0, 1, 1,
0.767147, 0.1782382, -0.003568651, 0.7333333, 0, 1, 1,
0.7748749, -2.658222, 2.88219, 0.7411765, 0, 1, 1,
0.7757294, 0.5740982, -0.2953708, 0.7450981, 0, 1, 1,
0.7779161, 0.3056509, 3.48869, 0.7529412, 0, 1, 1,
0.7787699, 0.4087671, 1.842116, 0.7568628, 0, 1, 1,
0.7787934, 0.04165247, 0.4247797, 0.7647059, 0, 1, 1,
0.780646, 1.211335, -0.09473655, 0.7686275, 0, 1, 1,
0.7993818, 1.217336, 0.6876885, 0.7764706, 0, 1, 1,
0.8031881, 1.605343, -0.3798694, 0.7803922, 0, 1, 1,
0.8079941, -0.8756858, 2.229252, 0.7882353, 0, 1, 1,
0.8136799, -0.8697686, 1.339273, 0.7921569, 0, 1, 1,
0.8153657, -0.04788197, 2.235406, 0.8, 0, 1, 1,
0.8208865, -2.289391, 4.395578, 0.8078431, 0, 1, 1,
0.8214263, 1.222148, 1.315187, 0.8117647, 0, 1, 1,
0.8218848, 0.4635048, -0.3465212, 0.8196079, 0, 1, 1,
0.8264535, -0.4630957, 0.9868181, 0.8235294, 0, 1, 1,
0.8306959, -0.275072, -0.7350726, 0.8313726, 0, 1, 1,
0.8379645, 1.738131, 2.463148, 0.8352941, 0, 1, 1,
0.8410022, 0.2861147, 0.4718613, 0.8431373, 0, 1, 1,
0.8437844, 1.547753, 0.3974295, 0.8470588, 0, 1, 1,
0.8451703, 1.821573, -1.070972, 0.854902, 0, 1, 1,
0.848138, -0.9406626, 2.837367, 0.8588235, 0, 1, 1,
0.8483487, 0.9892504, 2.487626, 0.8666667, 0, 1, 1,
0.8522347, 0.21301, 3.657457, 0.8705882, 0, 1, 1,
0.8592635, 1.419199, -0.9203508, 0.8784314, 0, 1, 1,
0.8599362, -0.6423853, 0.1066844, 0.8823529, 0, 1, 1,
0.8639829, -1.160616, 2.631337, 0.8901961, 0, 1, 1,
0.8649453, 0.0170326, 1.812421, 0.8941177, 0, 1, 1,
0.8698365, 0.5121033, 0.8577425, 0.9019608, 0, 1, 1,
0.8736297, -1.977, 1.832864, 0.9098039, 0, 1, 1,
0.8825417, 2.501051, -0.06095714, 0.9137255, 0, 1, 1,
0.8841023, -0.9597517, 2.857767, 0.9215686, 0, 1, 1,
0.8852816, 1.21537, -1.064314, 0.9254902, 0, 1, 1,
0.89363, -1.798015, 2.249033, 0.9333333, 0, 1, 1,
0.9036113, 1.567532, -0.4327616, 0.9372549, 0, 1, 1,
0.9143065, -1.367533, 2.499958, 0.945098, 0, 1, 1,
0.9154425, 0.7574248, 0.9138635, 0.9490196, 0, 1, 1,
0.9157684, 1.751488, 1.695254, 0.9568627, 0, 1, 1,
0.9228189, -0.4422776, 1.874164, 0.9607843, 0, 1, 1,
0.9274448, 0.2693717, 1.337611, 0.9686275, 0, 1, 1,
0.9300181, -0.5506449, 3.818835, 0.972549, 0, 1, 1,
0.9312648, 0.7459604, -1.295834, 0.9803922, 0, 1, 1,
0.9343222, -1.542628, 2.896061, 0.9843137, 0, 1, 1,
0.9356715, 0.9132653, 0.1126691, 0.9921569, 0, 1, 1,
0.936152, 1.515477, -0.7923774, 0.9960784, 0, 1, 1,
0.9411749, -0.7168563, 1.144111, 1, 0, 0.9960784, 1,
0.9477767, 0.08693419, 1.869211, 1, 0, 0.9882353, 1,
0.954395, 0.3055694, 2.157973, 1, 0, 0.9843137, 1,
0.9688116, 0.4712692, -0.5210826, 1, 0, 0.9764706, 1,
0.9760792, 0.4594499, 0.6520628, 1, 0, 0.972549, 1,
0.9796859, -0.9741473, 3.46442, 1, 0, 0.9647059, 1,
0.9815241, 0.2139159, 0.03383429, 1, 0, 0.9607843, 1,
0.9837726, 0.1225388, 0.5202613, 1, 0, 0.9529412, 1,
0.9889295, 0.07028568, 1.29, 1, 0, 0.9490196, 1,
0.989207, -1.477472, 2.463286, 1, 0, 0.9411765, 1,
0.9902115, -1.341828, 2.586369, 1, 0, 0.9372549, 1,
0.9926828, -0.6192963, 2.377982, 1, 0, 0.9294118, 1,
1.008852, 0.02629527, 2.587872, 1, 0, 0.9254902, 1,
1.014218, -0.3593775, 3.04113, 1, 0, 0.9176471, 1,
1.014996, 0.3839977, -0.2113672, 1, 0, 0.9137255, 1,
1.024682, 0.4835955, -0.7733302, 1, 0, 0.9058824, 1,
1.025392, 0.6533862, 0.00693741, 1, 0, 0.9019608, 1,
1.025505, 0.3583736, 2.896636, 1, 0, 0.8941177, 1,
1.026746, 0.4173937, 2.41512, 1, 0, 0.8862745, 1,
1.027973, -1.767457, 2.140991, 1, 0, 0.8823529, 1,
1.030069, 0.8139098, 1.043513, 1, 0, 0.8745098, 1,
1.030888, 1.103075, -0.04254487, 1, 0, 0.8705882, 1,
1.034918, -1.351823, 3.697846, 1, 0, 0.8627451, 1,
1.038775, -1.939522, 2.013721, 1, 0, 0.8588235, 1,
1.039207, -0.4077279, 2.49869, 1, 0, 0.8509804, 1,
1.041478, -0.3105426, 2.266886, 1, 0, 0.8470588, 1,
1.043346, 0.5317374, 0.4644729, 1, 0, 0.8392157, 1,
1.047355, 0.558448, 1.317735, 1, 0, 0.8352941, 1,
1.051535, 0.5763168, 0.8394096, 1, 0, 0.827451, 1,
1.055058, 0.2646923, 1.166146, 1, 0, 0.8235294, 1,
1.056512, 1.653403, -0.4373526, 1, 0, 0.8156863, 1,
1.057445, -0.9212362, 4.696617, 1, 0, 0.8117647, 1,
1.059633, -3.043395, 2.776339, 1, 0, 0.8039216, 1,
1.06308, 1.524964, 1.044809, 1, 0, 0.7960784, 1,
1.064746, -1.059947, 1.176373, 1, 0, 0.7921569, 1,
1.069596, 0.0361304, 1.52058, 1, 0, 0.7843137, 1,
1.073822, 0.0344574, 1.809601, 1, 0, 0.7803922, 1,
1.075332, -0.3995199, 1.000044, 1, 0, 0.772549, 1,
1.076226, 1.330737, 0.9359021, 1, 0, 0.7686275, 1,
1.081595, -0.4551587, 2.866307, 1, 0, 0.7607843, 1,
1.08218, -1.177745, 3.257214, 1, 0, 0.7568628, 1,
1.090138, 0.40643, 0.618152, 1, 0, 0.7490196, 1,
1.098206, -0.4360261, 3.009812, 1, 0, 0.7450981, 1,
1.099866, 1.031512, 0.6313425, 1, 0, 0.7372549, 1,
1.122671, 0.9688651, 1.447515, 1, 0, 0.7333333, 1,
1.12659, 1.442529, 0.08370917, 1, 0, 0.7254902, 1,
1.134449, -0.7881289, 2.73887, 1, 0, 0.7215686, 1,
1.142792, -0.3084486, 1.103191, 1, 0, 0.7137255, 1,
1.152488, 0.5148553, 2.353157, 1, 0, 0.7098039, 1,
1.156009, -0.1159949, 3.06369, 1, 0, 0.7019608, 1,
1.156806, 0.880321, 2.228915, 1, 0, 0.6941177, 1,
1.157795, -0.5146061, 2.708455, 1, 0, 0.6901961, 1,
1.160646, -1.238735, 3.129283, 1, 0, 0.682353, 1,
1.161059, 1.974812, -0.3129703, 1, 0, 0.6784314, 1,
1.164293, -0.09719667, 1.200117, 1, 0, 0.6705883, 1,
1.164523, 0.9473887, 1.235727, 1, 0, 0.6666667, 1,
1.166988, 0.7452585, 0.9562108, 1, 0, 0.6588235, 1,
1.172084, 1.904497, 2.930458, 1, 0, 0.654902, 1,
1.179519, 0.7338845, 0.7968202, 1, 0, 0.6470588, 1,
1.179869, -0.822543, 3.565723, 1, 0, 0.6431373, 1,
1.190434, 0.8178475, 1.341677, 1, 0, 0.6352941, 1,
1.193915, -0.7295862, 2.594337, 1, 0, 0.6313726, 1,
1.203118, 0.9382129, 0.2622812, 1, 0, 0.6235294, 1,
1.203182, -0.02832712, 2.325712, 1, 0, 0.6196079, 1,
1.22044, 0.1180248, 3.497984, 1, 0, 0.6117647, 1,
1.221538, 1.202479, 0.6114551, 1, 0, 0.6078432, 1,
1.245226, -0.3487814, 3.211718, 1, 0, 0.6, 1,
1.246321, 2.917267, -0.5377268, 1, 0, 0.5921569, 1,
1.256169, -0.9019563, 1.109253, 1, 0, 0.5882353, 1,
1.256751, -0.1391856, 3.574718, 1, 0, 0.5803922, 1,
1.276004, 0.8788226, 0.4025232, 1, 0, 0.5764706, 1,
1.291557, 0.7261213, 1.936664, 1, 0, 0.5686275, 1,
1.29299, 0.5815279, 0.9688374, 1, 0, 0.5647059, 1,
1.295448, 0.4043419, 0.1953219, 1, 0, 0.5568628, 1,
1.304854, -0.7995109, 2.614739, 1, 0, 0.5529412, 1,
1.307299, 2.240518, 0.06927456, 1, 0, 0.5450981, 1,
1.315788, -0.7342498, 3.118813, 1, 0, 0.5411765, 1,
1.317818, -0.01080893, 1.53743, 1, 0, 0.5333334, 1,
1.322549, -0.588733, 1.815452, 1, 0, 0.5294118, 1,
1.324419, -1.193741, 2.243752, 1, 0, 0.5215687, 1,
1.338473, 1.142872, 1.724019, 1, 0, 0.5176471, 1,
1.34245, 0.06201681, 0.3358938, 1, 0, 0.509804, 1,
1.343449, -0.1642921, 1.211016, 1, 0, 0.5058824, 1,
1.343812, -2.399257, 2.334208, 1, 0, 0.4980392, 1,
1.35675, 1.072414, 1.555324, 1, 0, 0.4901961, 1,
1.377777, 1.008828, -0.4100689, 1, 0, 0.4862745, 1,
1.379213, -0.1912243, -0.01715522, 1, 0, 0.4784314, 1,
1.385989, 1.75321, 2.237879, 1, 0, 0.4745098, 1,
1.386045, 0.364223, 0.07233677, 1, 0, 0.4666667, 1,
1.392542, -0.2683033, -0.3305212, 1, 0, 0.4627451, 1,
1.413196, 0.3009878, 1.162274, 1, 0, 0.454902, 1,
1.421067, -0.08313983, 1.96278, 1, 0, 0.4509804, 1,
1.429469, 0.02342681, 1.687526, 1, 0, 0.4431373, 1,
1.43337, -0.06098919, 3.246767, 1, 0, 0.4392157, 1,
1.441106, -1.166875, 4.698731, 1, 0, 0.4313726, 1,
1.444619, -0.2081782, 2.878946, 1, 0, 0.427451, 1,
1.44549, -0.2829238, 1.962699, 1, 0, 0.4196078, 1,
1.449015, 0.9631724, -0.2983235, 1, 0, 0.4156863, 1,
1.450791, 1.155849, 1.54656, 1, 0, 0.4078431, 1,
1.459869, 0.3560503, 1.602222, 1, 0, 0.4039216, 1,
1.463645, -0.4108593, 1.163812, 1, 0, 0.3960784, 1,
1.466114, -1.5898, 3.251359, 1, 0, 0.3882353, 1,
1.472374, -0.02058803, 1.727745, 1, 0, 0.3843137, 1,
1.475069, -0.07282999, 1.380098, 1, 0, 0.3764706, 1,
1.491874, 0.716627, 1.549128, 1, 0, 0.372549, 1,
1.499513, 0.2684515, 2.872025, 1, 0, 0.3647059, 1,
1.513418, -0.742788, 0.02610387, 1, 0, 0.3607843, 1,
1.513471, -1.154881, 2.529172, 1, 0, 0.3529412, 1,
1.535305, -0.1753799, 3.274155, 1, 0, 0.3490196, 1,
1.54002, 1.151665, 2.661972, 1, 0, 0.3411765, 1,
1.541918, -0.02744574, 1.713444, 1, 0, 0.3372549, 1,
1.542789, -0.3244995, 1.469432, 1, 0, 0.3294118, 1,
1.556369, 0.2694657, 1.666216, 1, 0, 0.3254902, 1,
1.557945, 0.371277, 1.616497, 1, 0, 0.3176471, 1,
1.574908, 1.008371, 1.227366, 1, 0, 0.3137255, 1,
1.587347, -0.8133564, 1.844311, 1, 0, 0.3058824, 1,
1.598297, -1.19039, 2.531188, 1, 0, 0.2980392, 1,
1.60228, -0.9528726, 2.663423, 1, 0, 0.2941177, 1,
1.604542, -0.1303824, 1.237858, 1, 0, 0.2862745, 1,
1.60595, -0.2707577, -0.8911735, 1, 0, 0.282353, 1,
1.612934, 0.9585728, -0.1798368, 1, 0, 0.2745098, 1,
1.617695, -0.6919174, 1.215023, 1, 0, 0.2705882, 1,
1.622721, -0.2238309, 3.666459, 1, 0, 0.2627451, 1,
1.627007, -0.6083299, 1.816264, 1, 0, 0.2588235, 1,
1.630999, 0.7914632, 2.470747, 1, 0, 0.2509804, 1,
1.657313, 0.3798065, 3.245704, 1, 0, 0.2470588, 1,
1.683697, 1.22685, 2.165892, 1, 0, 0.2392157, 1,
1.697333, -0.676733, 2.018317, 1, 0, 0.2352941, 1,
1.704813, 0.2958557, 0.5841551, 1, 0, 0.227451, 1,
1.705237, 0.6456731, 2.600496, 1, 0, 0.2235294, 1,
1.727198, -0.8043138, 2.863358, 1, 0, 0.2156863, 1,
1.740449, -0.1741679, 1.251394, 1, 0, 0.2117647, 1,
1.769193, 0.03460736, 1.195144, 1, 0, 0.2039216, 1,
1.773596, 3.076241, 1.284429, 1, 0, 0.1960784, 1,
1.775571, -1.719396, 3.175108, 1, 0, 0.1921569, 1,
1.778688, -1.170185, 3.537768, 1, 0, 0.1843137, 1,
1.809404, -0.8214817, 3.009644, 1, 0, 0.1803922, 1,
1.815796, 1.224131, -1.142306, 1, 0, 0.172549, 1,
1.826441, 0.06680712, 0.8636749, 1, 0, 0.1686275, 1,
1.859269, 1.220582, 0.6636587, 1, 0, 0.1607843, 1,
1.860442, -0.8409823, 0.4559328, 1, 0, 0.1568628, 1,
1.860711, -2.162699, 1.521546, 1, 0, 0.1490196, 1,
1.882792, 0.3085382, 0.9317436, 1, 0, 0.145098, 1,
1.89449, -0.5740244, 0.3868575, 1, 0, 0.1372549, 1,
1.900218, -0.2870052, 2.155587, 1, 0, 0.1333333, 1,
1.928178, -0.7098076, 1.30458, 1, 0, 0.1254902, 1,
1.935461, 1.161006, 0.7375155, 1, 0, 0.1215686, 1,
1.949029, 0.1950055, 2.746878, 1, 0, 0.1137255, 1,
2.067115, 1.084973, -0.1914792, 1, 0, 0.1098039, 1,
2.112624, 0.4376743, 2.044619, 1, 0, 0.1019608, 1,
2.120233, -2.67332, 1.585148, 1, 0, 0.09411765, 1,
2.148432, -0.9164343, 1.686453, 1, 0, 0.09019608, 1,
2.186615, 1.066236, 0.3228749, 1, 0, 0.08235294, 1,
2.217886, -1.574174, 1.011141, 1, 0, 0.07843138, 1,
2.2554, 0.9089251, 0.6769906, 1, 0, 0.07058824, 1,
2.287836, -1.114413, 2.100785, 1, 0, 0.06666667, 1,
2.318302, 0.4120895, -1.019868, 1, 0, 0.05882353, 1,
2.364157, 0.3374758, 1.700049, 1, 0, 0.05490196, 1,
2.413898, 1.624944, 2.071282, 1, 0, 0.04705882, 1,
2.469283, -0.6724076, 2.060249, 1, 0, 0.04313726, 1,
2.476314, -0.3037094, 1.585427, 1, 0, 0.03529412, 1,
2.540089, -0.3778246, 1.207701, 1, 0, 0.03137255, 1,
2.662561, -1.958496, -0.3229572, 1, 0, 0.02352941, 1,
2.809609, 0.7898345, 1.013042, 1, 0, 0.01960784, 1,
2.827546, 0.6142762, 0.6401395, 1, 0, 0.01176471, 1,
3.177077, 0.3639125, 1.626502, 1, 0, 0.007843138, 1
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
-0.09178877, -4.22567, -6.664361, 0, -0.5, 0.5, 0.5,
-0.09178877, -4.22567, -6.664361, 1, -0.5, 0.5, 0.5,
-0.09178877, -4.22567, -6.664361, 1, 1.5, 0.5, 0.5,
-0.09178877, -4.22567, -6.664361, 0, 1.5, 0.5, 0.5
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
-4.4688, 0.4441417, -6.664361, 0, -0.5, 0.5, 0.5,
-4.4688, 0.4441417, -6.664361, 1, -0.5, 0.5, 0.5,
-4.4688, 0.4441417, -6.664361, 1, 1.5, 0.5, 0.5,
-4.4688, 0.4441417, -6.664361, 0, 1.5, 0.5, 0.5
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
-4.4688, -4.22567, -0.1375966, 0, -0.5, 0.5, 0.5,
-4.4688, -4.22567, -0.1375966, 1, -0.5, 0.5, 0.5,
-4.4688, -4.22567, -0.1375966, 1, 1.5, 0.5, 0.5,
-4.4688, -4.22567, -0.1375966, 0, 1.5, 0.5, 0.5
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
-3, -3.148021, -5.158185,
3, -3.148021, -5.158185,
-3, -3.148021, -5.158185,
-3, -3.327629, -5.409214,
-2, -3.148021, -5.158185,
-2, -3.327629, -5.409214,
-1, -3.148021, -5.158185,
-1, -3.327629, -5.409214,
0, -3.148021, -5.158185,
0, -3.327629, -5.409214,
1, -3.148021, -5.158185,
1, -3.327629, -5.409214,
2, -3.148021, -5.158185,
2, -3.327629, -5.409214,
3, -3.148021, -5.158185,
3, -3.327629, -5.409214
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
-3, -3.686845, -5.911273, 0, -0.5, 0.5, 0.5,
-3, -3.686845, -5.911273, 1, -0.5, 0.5, 0.5,
-3, -3.686845, -5.911273, 1, 1.5, 0.5, 0.5,
-3, -3.686845, -5.911273, 0, 1.5, 0.5, 0.5,
-2, -3.686845, -5.911273, 0, -0.5, 0.5, 0.5,
-2, -3.686845, -5.911273, 1, -0.5, 0.5, 0.5,
-2, -3.686845, -5.911273, 1, 1.5, 0.5, 0.5,
-2, -3.686845, -5.911273, 0, 1.5, 0.5, 0.5,
-1, -3.686845, -5.911273, 0, -0.5, 0.5, 0.5,
-1, -3.686845, -5.911273, 1, -0.5, 0.5, 0.5,
-1, -3.686845, -5.911273, 1, 1.5, 0.5, 0.5,
-1, -3.686845, -5.911273, 0, 1.5, 0.5, 0.5,
0, -3.686845, -5.911273, 0, -0.5, 0.5, 0.5,
0, -3.686845, -5.911273, 1, -0.5, 0.5, 0.5,
0, -3.686845, -5.911273, 1, 1.5, 0.5, 0.5,
0, -3.686845, -5.911273, 0, 1.5, 0.5, 0.5,
1, -3.686845, -5.911273, 0, -0.5, 0.5, 0.5,
1, -3.686845, -5.911273, 1, -0.5, 0.5, 0.5,
1, -3.686845, -5.911273, 1, 1.5, 0.5, 0.5,
1, -3.686845, -5.911273, 0, 1.5, 0.5, 0.5,
2, -3.686845, -5.911273, 0, -0.5, 0.5, 0.5,
2, -3.686845, -5.911273, 1, -0.5, 0.5, 0.5,
2, -3.686845, -5.911273, 1, 1.5, 0.5, 0.5,
2, -3.686845, -5.911273, 0, 1.5, 0.5, 0.5,
3, -3.686845, -5.911273, 0, -0.5, 0.5, 0.5,
3, -3.686845, -5.911273, 1, -0.5, 0.5, 0.5,
3, -3.686845, -5.911273, 1, 1.5, 0.5, 0.5,
3, -3.686845, -5.911273, 0, 1.5, 0.5, 0.5
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
-3.45872, -3, -5.158185,
-3.45872, 3, -5.158185,
-3.45872, -3, -5.158185,
-3.627067, -3, -5.409214,
-3.45872, -2, -5.158185,
-3.627067, -2, -5.409214,
-3.45872, -1, -5.158185,
-3.627067, -1, -5.409214,
-3.45872, 0, -5.158185,
-3.627067, 0, -5.409214,
-3.45872, 1, -5.158185,
-3.627067, 1, -5.409214,
-3.45872, 2, -5.158185,
-3.627067, 2, -5.409214,
-3.45872, 3, -5.158185,
-3.627067, 3, -5.409214
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
-3.96376, -3, -5.911273, 0, -0.5, 0.5, 0.5,
-3.96376, -3, -5.911273, 1, -0.5, 0.5, 0.5,
-3.96376, -3, -5.911273, 1, 1.5, 0.5, 0.5,
-3.96376, -3, -5.911273, 0, 1.5, 0.5, 0.5,
-3.96376, -2, -5.911273, 0, -0.5, 0.5, 0.5,
-3.96376, -2, -5.911273, 1, -0.5, 0.5, 0.5,
-3.96376, -2, -5.911273, 1, 1.5, 0.5, 0.5,
-3.96376, -2, -5.911273, 0, 1.5, 0.5, 0.5,
-3.96376, -1, -5.911273, 0, -0.5, 0.5, 0.5,
-3.96376, -1, -5.911273, 1, -0.5, 0.5, 0.5,
-3.96376, -1, -5.911273, 1, 1.5, 0.5, 0.5,
-3.96376, -1, -5.911273, 0, 1.5, 0.5, 0.5,
-3.96376, 0, -5.911273, 0, -0.5, 0.5, 0.5,
-3.96376, 0, -5.911273, 1, -0.5, 0.5, 0.5,
-3.96376, 0, -5.911273, 1, 1.5, 0.5, 0.5,
-3.96376, 0, -5.911273, 0, 1.5, 0.5, 0.5,
-3.96376, 1, -5.911273, 0, -0.5, 0.5, 0.5,
-3.96376, 1, -5.911273, 1, -0.5, 0.5, 0.5,
-3.96376, 1, -5.911273, 1, 1.5, 0.5, 0.5,
-3.96376, 1, -5.911273, 0, 1.5, 0.5, 0.5,
-3.96376, 2, -5.911273, 0, -0.5, 0.5, 0.5,
-3.96376, 2, -5.911273, 1, -0.5, 0.5, 0.5,
-3.96376, 2, -5.911273, 1, 1.5, 0.5, 0.5,
-3.96376, 2, -5.911273, 0, 1.5, 0.5, 0.5,
-3.96376, 3, -5.911273, 0, -0.5, 0.5, 0.5,
-3.96376, 3, -5.911273, 1, -0.5, 0.5, 0.5,
-3.96376, 3, -5.911273, 1, 1.5, 0.5, 0.5,
-3.96376, 3, -5.911273, 0, 1.5, 0.5, 0.5
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
-3.45872, -3.148021, -4,
-3.45872, -3.148021, 4,
-3.45872, -3.148021, -4,
-3.627067, -3.327629, -4,
-3.45872, -3.148021, -2,
-3.627067, -3.327629, -2,
-3.45872, -3.148021, 0,
-3.627067, -3.327629, 0,
-3.45872, -3.148021, 2,
-3.627067, -3.327629, 2,
-3.45872, -3.148021, 4,
-3.627067, -3.327629, 4
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
-3.96376, -3.686845, -4, 0, -0.5, 0.5, 0.5,
-3.96376, -3.686845, -4, 1, -0.5, 0.5, 0.5,
-3.96376, -3.686845, -4, 1, 1.5, 0.5, 0.5,
-3.96376, -3.686845, -4, 0, 1.5, 0.5, 0.5,
-3.96376, -3.686845, -2, 0, -0.5, 0.5, 0.5,
-3.96376, -3.686845, -2, 1, -0.5, 0.5, 0.5,
-3.96376, -3.686845, -2, 1, 1.5, 0.5, 0.5,
-3.96376, -3.686845, -2, 0, 1.5, 0.5, 0.5,
-3.96376, -3.686845, 0, 0, -0.5, 0.5, 0.5,
-3.96376, -3.686845, 0, 1, -0.5, 0.5, 0.5,
-3.96376, -3.686845, 0, 1, 1.5, 0.5, 0.5,
-3.96376, -3.686845, 0, 0, 1.5, 0.5, 0.5,
-3.96376, -3.686845, 2, 0, -0.5, 0.5, 0.5,
-3.96376, -3.686845, 2, 1, -0.5, 0.5, 0.5,
-3.96376, -3.686845, 2, 1, 1.5, 0.5, 0.5,
-3.96376, -3.686845, 2, 0, 1.5, 0.5, 0.5,
-3.96376, -3.686845, 4, 0, -0.5, 0.5, 0.5,
-3.96376, -3.686845, 4, 1, -0.5, 0.5, 0.5,
-3.96376, -3.686845, 4, 1, 1.5, 0.5, 0.5,
-3.96376, -3.686845, 4, 0, 1.5, 0.5, 0.5
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
-3.45872, -3.148021, -5.158185,
-3.45872, 4.036304, -5.158185,
-3.45872, -3.148021, 4.882992,
-3.45872, 4.036304, 4.882992,
-3.45872, -3.148021, -5.158185,
-3.45872, -3.148021, 4.882992,
-3.45872, 4.036304, -5.158185,
-3.45872, 4.036304, 4.882992,
-3.45872, -3.148021, -5.158185,
3.275143, -3.148021, -5.158185,
-3.45872, -3.148021, 4.882992,
3.275143, -3.148021, 4.882992,
-3.45872, 4.036304, -5.158185,
3.275143, 4.036304, -5.158185,
-3.45872, 4.036304, 4.882992,
3.275143, 4.036304, 4.882992,
3.275143, -3.148021, -5.158185,
3.275143, 4.036304, -5.158185,
3.275143, -3.148021, 4.882992,
3.275143, 4.036304, 4.882992,
3.275143, -3.148021, -5.158185,
3.275143, -3.148021, 4.882992,
3.275143, 4.036304, -5.158185,
3.275143, 4.036304, 4.882992
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
var radius = 7.509686;
var distance = 33.41144;
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
mvMatrix.translate( 0.09178877, -0.4441417, 0.1375966 );
mvMatrix.scale( 1.205789, 1.130185, 0.8086323 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.41144);
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
propionate<-read.table("propionate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-propionate$V2
```

```
## Error in eval(expr, envir, enclos): object 'propionate' not found
```

```r
y<-propionate$V3
```

```
## Error in eval(expr, envir, enclos): object 'propionate' not found
```

```r
z<-propionate$V4
```

```
## Error in eval(expr, envir, enclos): object 'propionate' not found
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
-3.360654, 2.111408, -1.930012, 0, 0, 1, 1, 1,
-3.032903, 0.9832609, -1.492019, 1, 0, 0, 1, 1,
-2.780543, 0.1050237, -1.926282, 1, 0, 0, 1, 1,
-2.725198, 1.238706, -1.135666, 1, 0, 0, 1, 1,
-2.69042, 2.107643, -0.9974405, 1, 0, 0, 1, 1,
-2.675885, -1.761551, -1.563109, 1, 0, 0, 1, 1,
-2.612428, -0.6275402, -1.196611, 0, 0, 0, 1, 1,
-2.604336, 0.4919284, -2.54081, 0, 0, 0, 1, 1,
-2.518049, 1.779422, -0.9324974, 0, 0, 0, 1, 1,
-2.449423, 0.5867684, 0.6040499, 0, 0, 0, 1, 1,
-2.37713, 0.09796305, 0.03766759, 0, 0, 0, 1, 1,
-2.328327, 0.649471, -2.90328, 0, 0, 0, 1, 1,
-2.301632, 0.2269341, -1.954961, 0, 0, 0, 1, 1,
-2.298665, 1.496466, -1.359537, 1, 1, 1, 1, 1,
-2.250772, 1.430635, -1.124151, 1, 1, 1, 1, 1,
-2.18654, -0.384439, -2.619993, 1, 1, 1, 1, 1,
-2.163379, -0.8069273, -3.297076, 1, 1, 1, 1, 1,
-2.145987, -0.7704946, -2.362599, 1, 1, 1, 1, 1,
-2.090364, 0.2693157, -2.819855, 1, 1, 1, 1, 1,
-2.058733, -1.035557, -2.092345, 1, 1, 1, 1, 1,
-2.04974, 1.901942, -1.359959, 1, 1, 1, 1, 1,
-2.033713, 1.623734, 0.8532235, 1, 1, 1, 1, 1,
-2.032442, -0.5022355, -1.14987, 1, 1, 1, 1, 1,
-2.000553, 1.54375, 0.5952665, 1, 1, 1, 1, 1,
-1.995072, 0.7866815, -0.2835872, 1, 1, 1, 1, 1,
-1.988844, 1.136882, -2.353705, 1, 1, 1, 1, 1,
-1.976825, 0.2364021, -1.334139, 1, 1, 1, 1, 1,
-1.972282, 0.4667929, -1.549665, 1, 1, 1, 1, 1,
-1.967239, -0.4976215, -3.450685, 0, 0, 1, 1, 1,
-1.934362, 0.2417945, -0.8876963, 1, 0, 0, 1, 1,
-1.927844, 0.8933347, -1.167821, 1, 0, 0, 1, 1,
-1.917341, -1.28447, -2.397787, 1, 0, 0, 1, 1,
-1.910829, -1.395815, -3.570414, 1, 0, 0, 1, 1,
-1.902346, 1.425546, -0.6532375, 1, 0, 0, 1, 1,
-1.899556, -1.023425, -3.376805, 0, 0, 0, 1, 1,
-1.876744, 1.511907, -2.305933, 0, 0, 0, 1, 1,
-1.847963, 0.9617218, -1.222862, 0, 0, 0, 1, 1,
-1.825486, -0.9690486, -2.660754, 0, 0, 0, 1, 1,
-1.823471, -0.5852563, -2.308531, 0, 0, 0, 1, 1,
-1.805979, 0.7559341, -2.535313, 0, 0, 0, 1, 1,
-1.791757, -0.3375639, -1.627398, 0, 0, 0, 1, 1,
-1.755542, -2.537973, -1.891371, 1, 1, 1, 1, 1,
-1.745794, -0.3899001, -1.611272, 1, 1, 1, 1, 1,
-1.736616, -0.7122689, -0.06256719, 1, 1, 1, 1, 1,
-1.715512, -1.099272, -2.753179, 1, 1, 1, 1, 1,
-1.698531, -1.027947, -2.414022, 1, 1, 1, 1, 1,
-1.697058, 0.7539591, -1.904577, 1, 1, 1, 1, 1,
-1.693609, 0.57344, -0.4135982, 1, 1, 1, 1, 1,
-1.679545, -0.2129342, -1.67331, 1, 1, 1, 1, 1,
-1.644089, -0.2145636, -0.7570819, 1, 1, 1, 1, 1,
-1.622647, -0.06552994, -3.341294, 1, 1, 1, 1, 1,
-1.61786, 1.013692, -2.615257, 1, 1, 1, 1, 1,
-1.602743, 1.314338, 0.8189868, 1, 1, 1, 1, 1,
-1.593998, 0.01686437, 0.1318126, 1, 1, 1, 1, 1,
-1.591019, -0.09637575, -1.761203, 1, 1, 1, 1, 1,
-1.572938, -1.191351, -3.07855, 1, 1, 1, 1, 1,
-1.569821, 0.004444405, -1.392099, 0, 0, 1, 1, 1,
-1.563364, 0.3567017, -1.239607, 1, 0, 0, 1, 1,
-1.554547, 1.389055, -3.135653, 1, 0, 0, 1, 1,
-1.53028, -0.02554814, -1.002941, 1, 0, 0, 1, 1,
-1.530271, 0.07903334, -2.425751, 1, 0, 0, 1, 1,
-1.529485, -0.9696981, -1.194394, 1, 0, 0, 1, 1,
-1.52905, 3.931678, -0.338359, 0, 0, 0, 1, 1,
-1.527497, -0.008093142, -1.967119, 0, 0, 0, 1, 1,
-1.51986, 0.5717111, -2.73892, 0, 0, 0, 1, 1,
-1.519371, -1.177848, -2.238914, 0, 0, 0, 1, 1,
-1.514184, -0.6096172, -1.983595, 0, 0, 0, 1, 1,
-1.503887, 0.438193, -0.5641093, 0, 0, 0, 1, 1,
-1.503062, -0.4973006, -0.815725, 0, 0, 0, 1, 1,
-1.500131, 2.826055, -2.034936, 1, 1, 1, 1, 1,
-1.495294, -1.021133, -1.802428, 1, 1, 1, 1, 1,
-1.487634, 1.727693, 0.5092039, 1, 1, 1, 1, 1,
-1.473755, -1.929945, -2.512594, 1, 1, 1, 1, 1,
-1.469023, -0.8682176, -2.47689, 1, 1, 1, 1, 1,
-1.467409, -0.6358576, -0.846051, 1, 1, 1, 1, 1,
-1.467378, 0.7119476, 0.7739699, 1, 1, 1, 1, 1,
-1.446878, 1.38659, -1.556996, 1, 1, 1, 1, 1,
-1.443987, 0.4767184, -1.125379, 1, 1, 1, 1, 1,
-1.433793, 1.448468, -0.5813325, 1, 1, 1, 1, 1,
-1.432019, 0.01916548, -2.134865, 1, 1, 1, 1, 1,
-1.425207, -2.079966, -3.457908, 1, 1, 1, 1, 1,
-1.424712, 0.7609401, -2.490447, 1, 1, 1, 1, 1,
-1.423551, 3.081314, 0.08215055, 1, 1, 1, 1, 1,
-1.415373, -0.6646869, -2.367365, 1, 1, 1, 1, 1,
-1.41239, -0.02353205, -1.438387, 0, 0, 1, 1, 1,
-1.411359, 0.9294761, 1.19055, 1, 0, 0, 1, 1,
-1.410724, -1.244092, -1.323126, 1, 0, 0, 1, 1,
-1.407167, -0.1876639, -1.000151, 1, 0, 0, 1, 1,
-1.404808, 0.2057936, -1.062167, 1, 0, 0, 1, 1,
-1.398847, 1.320033, -1.755517, 1, 0, 0, 1, 1,
-1.396158, 1.980495, -1.288028, 0, 0, 0, 1, 1,
-1.361768, -1.23988, -0.7210123, 0, 0, 0, 1, 1,
-1.346382, 0.87756, -0.5408487, 0, 0, 0, 1, 1,
-1.333305, -1.248735, -3.575988, 0, 0, 0, 1, 1,
-1.332947, 1.535583, -1.450274, 0, 0, 0, 1, 1,
-1.320417, 0.1694592, -1.365373, 0, 0, 0, 1, 1,
-1.314774, 0.4165657, -1.407394, 0, 0, 0, 1, 1,
-1.312651, 1.168812, 0.01344232, 1, 1, 1, 1, 1,
-1.310422, 0.14617, -2.807848, 1, 1, 1, 1, 1,
-1.310085, -1.901329, -3.095194, 1, 1, 1, 1, 1,
-1.305878, -1.618763, -3.647367, 1, 1, 1, 1, 1,
-1.303133, 0.03228667, -2.177246, 1, 1, 1, 1, 1,
-1.302799, -0.6475797, -1.452313, 1, 1, 1, 1, 1,
-1.300485, 0.9151006, -0.9493943, 1, 1, 1, 1, 1,
-1.293219, 0.01510178, -3.02884, 1, 1, 1, 1, 1,
-1.286472, 0.4493291, -0.3870864, 1, 1, 1, 1, 1,
-1.282937, 0.7303408, -0.8244321, 1, 1, 1, 1, 1,
-1.282799, -0.8719506, -3.088993, 1, 1, 1, 1, 1,
-1.281879, 0.3163802, 0.06014606, 1, 1, 1, 1, 1,
-1.278823, -0.7893209, -2.097903, 1, 1, 1, 1, 1,
-1.277935, 0.09957413, -1.612206, 1, 1, 1, 1, 1,
-1.274468, 0.1734968, -1.433845, 1, 1, 1, 1, 1,
-1.271915, -1.137399, -3.94849, 0, 0, 1, 1, 1,
-1.268875, 1.089276, 0.5701722, 1, 0, 0, 1, 1,
-1.266812, 0.5936119, -2.450415, 1, 0, 0, 1, 1,
-1.260529, 0.9463742, -2.008285, 1, 0, 0, 1, 1,
-1.251903, 1.222509, -3.024491, 1, 0, 0, 1, 1,
-1.243373, -0.1974382, -2.29073, 1, 0, 0, 1, 1,
-1.242815, 0.7095615, -0.9377361, 0, 0, 0, 1, 1,
-1.234961, -0.4692518, -2.158407, 0, 0, 0, 1, 1,
-1.233232, 1.190494, 0.3420176, 0, 0, 0, 1, 1,
-1.228918, -0.9429577, -3.07386, 0, 0, 0, 1, 1,
-1.21981, 1.423767, -1.326726, 0, 0, 0, 1, 1,
-1.217201, -0.00668792, -1.646484, 0, 0, 0, 1, 1,
-1.209484, -0.31434, -0.2616322, 0, 0, 0, 1, 1,
-1.202837, 0.1996114, -2.547709, 1, 1, 1, 1, 1,
-1.180667, 0.5311007, -2.036521, 1, 1, 1, 1, 1,
-1.176125, 0.7777621, -1.663871, 1, 1, 1, 1, 1,
-1.165967, 1.478637, 0.9348596, 1, 1, 1, 1, 1,
-1.159504, 0.6309932, -0.5886023, 1, 1, 1, 1, 1,
-1.159237, 0.8442019, -1.773435, 1, 1, 1, 1, 1,
-1.15333, -0.4544088, -2.404665, 1, 1, 1, 1, 1,
-1.15105, 1.699385, 0.5610432, 1, 1, 1, 1, 1,
-1.149467, -0.311448, -3.368214, 1, 1, 1, 1, 1,
-1.14812, 0.1294254, -1.05185, 1, 1, 1, 1, 1,
-1.13396, 1.412022, 0.8613152, 1, 1, 1, 1, 1,
-1.133451, -0.2677272, -2.045512, 1, 1, 1, 1, 1,
-1.129156, -0.4585023, -3.621948, 1, 1, 1, 1, 1,
-1.125517, 0.4189067, -0.08025762, 1, 1, 1, 1, 1,
-1.123376, -0.4018261, -2.677844, 1, 1, 1, 1, 1,
-1.120969, 0.1687552, -1.767786, 0, 0, 1, 1, 1,
-1.109351, -0.3873363, -2.058434, 1, 0, 0, 1, 1,
-1.108273, -1.790379, -3.408502, 1, 0, 0, 1, 1,
-1.107786, 1.278394, -0.910224, 1, 0, 0, 1, 1,
-1.106258, -1.890995, -1.708443, 1, 0, 0, 1, 1,
-1.097489, -0.9734556, -1.572161, 1, 0, 0, 1, 1,
-1.095298, -1.10713, 0.8653762, 0, 0, 0, 1, 1,
-1.094331, 1.367574, -2.294327, 0, 0, 0, 1, 1,
-1.090773, 0.1520054, -0.4319503, 0, 0, 0, 1, 1,
-1.072634, -0.2072102, -2.98158, 0, 0, 0, 1, 1,
-1.058345, 2.373578, -0.8311159, 0, 0, 0, 1, 1,
-1.050818, -0.4420696, -1.582015, 0, 0, 0, 1, 1,
-1.041086, 0.2729014, -0.2596592, 0, 0, 0, 1, 1,
-1.034671, -0.3137118, -3.217011, 1, 1, 1, 1, 1,
-1.032998, 1.365086, -0.2814636, 1, 1, 1, 1, 1,
-1.028343, -2.363671, -1.887548, 1, 1, 1, 1, 1,
-1.026377, -0.07305368, -2.150789, 1, 1, 1, 1, 1,
-1.016187, -2.196927, -3.328043, 1, 1, 1, 1, 1,
-1.015025, 1.848537, 0.1912909, 1, 1, 1, 1, 1,
-1.010302, -0.9807722, -1.920208, 1, 1, 1, 1, 1,
-1.008489, 1.660687, 0.1246756, 1, 1, 1, 1, 1,
-1.007122, -0.02716509, -1.601989, 1, 1, 1, 1, 1,
-1.003122, 0.777325, -0.8049079, 1, 1, 1, 1, 1,
-0.9983836, 0.3808675, 0.7733901, 1, 1, 1, 1, 1,
-0.9879876, -1.661834, -3.963647, 1, 1, 1, 1, 1,
-0.9879654, -1.015836, -1.850005, 1, 1, 1, 1, 1,
-0.9847681, -0.1318023, 0.2589938, 1, 1, 1, 1, 1,
-0.9796213, -1.22084, -2.264673, 1, 1, 1, 1, 1,
-0.9792006, -0.08455757, -0.7506101, 0, 0, 1, 1, 1,
-0.9750875, 0.2688395, -2.790658, 1, 0, 0, 1, 1,
-0.9746479, -0.5832443, -3.341651, 1, 0, 0, 1, 1,
-0.9646752, 0.7546605, -1.546133, 1, 0, 0, 1, 1,
-0.9604291, 0.7847598, -1.826683, 1, 0, 0, 1, 1,
-0.9589504, -0.6434598, -3.287147, 1, 0, 0, 1, 1,
-0.9571907, 0.470532, -1.711202, 0, 0, 0, 1, 1,
-0.9534366, -1.379723, -2.411526, 0, 0, 0, 1, 1,
-0.9523412, -0.5946648, -1.693041, 0, 0, 0, 1, 1,
-0.9455662, -0.860092, -3.256215, 0, 0, 0, 1, 1,
-0.9448922, 0.4970883, -1.863316, 0, 0, 0, 1, 1,
-0.9436337, 1.62315, -0.4584279, 0, 0, 0, 1, 1,
-0.9384803, 0.2243132, -0.8910314, 0, 0, 0, 1, 1,
-0.9381741, -0.4727574, -0.4272895, 1, 1, 1, 1, 1,
-0.9359458, -0.2410664, -1.26246, 1, 1, 1, 1, 1,
-0.9358922, -0.05683127, -1.780188, 1, 1, 1, 1, 1,
-0.9352969, -1.29777, -3.227406, 1, 1, 1, 1, 1,
-0.9274655, -0.4236585, -2.120386, 1, 1, 1, 1, 1,
-0.9256825, -0.05026217, -2.642332, 1, 1, 1, 1, 1,
-0.9194511, 0.8275684, -0.5327671, 1, 1, 1, 1, 1,
-0.9057167, 0.29977, -2.984468, 1, 1, 1, 1, 1,
-0.9050155, -0.7743524, -2.885636, 1, 1, 1, 1, 1,
-0.9035974, -1.580454, -1.984551, 1, 1, 1, 1, 1,
-0.9015044, -2.441172, -1.418959, 1, 1, 1, 1, 1,
-0.9012557, -1.98466, -2.711976, 1, 1, 1, 1, 1,
-0.897371, 1.60214, 0.2998078, 1, 1, 1, 1, 1,
-0.8929346, -0.1244969, -2.402774, 1, 1, 1, 1, 1,
-0.8891495, 0.4112965, -0.7394492, 1, 1, 1, 1, 1,
-0.8815091, -0.1552879, -1.842538, 0, 0, 1, 1, 1,
-0.8813311, -0.004893559, -1.199606, 1, 0, 0, 1, 1,
-0.8775316, 0.7554089, -1.362952, 1, 0, 0, 1, 1,
-0.8729375, 0.2777028, -0.9159808, 1, 0, 0, 1, 1,
-0.866473, 2.955079, -1.580385, 1, 0, 0, 1, 1,
-0.8659657, 0.07863675, -4.419957, 1, 0, 0, 1, 1,
-0.8622834, -0.2485424, -0.9308011, 0, 0, 0, 1, 1,
-0.8594159, -0.4574053, -2.342055, 0, 0, 0, 1, 1,
-0.8567139, -0.1181414, -1.713744, 0, 0, 0, 1, 1,
-0.8407155, 0.974826, 0.6393835, 0, 0, 0, 1, 1,
-0.840615, -0.2448237, -3.669705, 0, 0, 0, 1, 1,
-0.828658, 1.119533, 1.330184, 0, 0, 0, 1, 1,
-0.8230208, -1.62636, -2.606122, 0, 0, 0, 1, 1,
-0.820249, 0.4942216, 0.8468727, 1, 1, 1, 1, 1,
-0.8173887, -1.507243, -2.651074, 1, 1, 1, 1, 1,
-0.8153542, -0.07583045, -1.137408, 1, 1, 1, 1, 1,
-0.8065582, -0.1915196, -2.821983, 1, 1, 1, 1, 1,
-0.804229, -1.418595, -1.401548, 1, 1, 1, 1, 1,
-0.7991, -0.4918579, -0.6416176, 1, 1, 1, 1, 1,
-0.7878869, -1.481052, -2.668062, 1, 1, 1, 1, 1,
-0.7877796, -0.8367998, -0.1580862, 1, 1, 1, 1, 1,
-0.7845796, -0.3606804, -3.193537, 1, 1, 1, 1, 1,
-0.7829062, -0.9917405, -2.592191, 1, 1, 1, 1, 1,
-0.7806785, 2.780197, -1.004579, 1, 1, 1, 1, 1,
-0.7804109, 1.256606, -2.820162, 1, 1, 1, 1, 1,
-0.7763534, -0.9791086, -1.553779, 1, 1, 1, 1, 1,
-0.7743409, -0.852207, -3.543157, 1, 1, 1, 1, 1,
-0.770524, 0.3672343, -4.22943, 1, 1, 1, 1, 1,
-0.7690319, 1.035072, 1.603642, 0, 0, 1, 1, 1,
-0.7684339, -0.07113132, -0.108381, 1, 0, 0, 1, 1,
-0.7668858, -0.0006795999, -1.833236, 1, 0, 0, 1, 1,
-0.7630578, 0.9292539, -2.972575, 1, 0, 0, 1, 1,
-0.7595654, 1.084038, -1.04955, 1, 0, 0, 1, 1,
-0.7584869, -0.4400978, -2.031276, 1, 0, 0, 1, 1,
-0.7565146, -0.2853088, -1.995416, 0, 0, 0, 1, 1,
-0.75646, -0.8066014, -0.8852702, 0, 0, 0, 1, 1,
-0.7506464, 0.02356062, -2.662979, 0, 0, 0, 1, 1,
-0.7439075, 0.2169477, -2.065029, 0, 0, 0, 1, 1,
-0.7434068, 0.5825654, -0.3886061, 0, 0, 0, 1, 1,
-0.7415723, 1.386956, -0.5245545, 0, 0, 0, 1, 1,
-0.740536, 1.094724, 0.4518921, 0, 0, 0, 1, 1,
-0.7358571, 0.6349303, -2.955178, 1, 1, 1, 1, 1,
-0.7355023, -1.031495, -2.325246, 1, 1, 1, 1, 1,
-0.7353755, 0.5148367, 0.0623959, 1, 1, 1, 1, 1,
-0.7316462, 2.012685, -0.1518673, 1, 1, 1, 1, 1,
-0.7257397, -0.1564832, -2.707043, 1, 1, 1, 1, 1,
-0.7246764, 0.429594, -1.602432, 1, 1, 1, 1, 1,
-0.7215949, 0.4222958, -1.233552, 1, 1, 1, 1, 1,
-0.7200961, -0.3503591, -0.4778906, 1, 1, 1, 1, 1,
-0.7193531, -1.121733, -3.344011, 1, 1, 1, 1, 1,
-0.7125677, 1.102242, -1.127509, 1, 1, 1, 1, 1,
-0.7104735, 0.4385379, -0.08808722, 1, 1, 1, 1, 1,
-0.693042, -0.2248487, -0.5789198, 1, 1, 1, 1, 1,
-0.6897833, -0.7382557, -3.561164, 1, 1, 1, 1, 1,
-0.6864445, -0.3522879, -3.517487, 1, 1, 1, 1, 1,
-0.6840025, 0.9033146, -0.7247761, 1, 1, 1, 1, 1,
-0.6832453, -1.012681, -2.871496, 0, 0, 1, 1, 1,
-0.6795627, -1.92258, -3.759958, 1, 0, 0, 1, 1,
-0.6795542, 0.06882457, -0.0009946575, 1, 0, 0, 1, 1,
-0.6782461, 1.904572, 0.1013741, 1, 0, 0, 1, 1,
-0.6731619, -0.6116247, -0.6925905, 1, 0, 0, 1, 1,
-0.6638435, -0.7555702, -0.8806316, 1, 0, 0, 1, 1,
-0.6606788, -0.06958677, -2.727243, 0, 0, 0, 1, 1,
-0.6571998, 0.1034959, 0.4587363, 0, 0, 0, 1, 1,
-0.6569613, -1.875785, -4.354204, 0, 0, 0, 1, 1,
-0.65174, 0.4418674, 0.3702197, 0, 0, 0, 1, 1,
-0.6477525, -0.7336932, -1.113771, 0, 0, 0, 1, 1,
-0.6407772, 1.06949, -0.5703685, 0, 0, 0, 1, 1,
-0.6351311, 1.992177, 1.663001, 0, 0, 0, 1, 1,
-0.6348032, 0.8397447, -0.9757526, 1, 1, 1, 1, 1,
-0.629445, 0.6034511, -0.7969018, 1, 1, 1, 1, 1,
-0.6268599, 0.08048137, -2.713058, 1, 1, 1, 1, 1,
-0.626406, 1.822683, -2.345914, 1, 1, 1, 1, 1,
-0.6258281, 0.6219696, -1.818908, 1, 1, 1, 1, 1,
-0.6247715, -0.8295245, -1.392433, 1, 1, 1, 1, 1,
-0.6142873, 0.2016799, -0.6545104, 1, 1, 1, 1, 1,
-0.6139719, 0.2477645, -0.3828239, 1, 1, 1, 1, 1,
-0.6099496, 0.4091945, -0.7730786, 1, 1, 1, 1, 1,
-0.6084863, -0.5280294, -2.353316, 1, 1, 1, 1, 1,
-0.6071865, -0.6544995, -2.528119, 1, 1, 1, 1, 1,
-0.6051714, -0.318816, -0.8788295, 1, 1, 1, 1, 1,
-0.6033323, -1.340317, -2.515045, 1, 1, 1, 1, 1,
-0.6014991, -1.281314, -4.775005, 1, 1, 1, 1, 1,
-0.6010369, 0.5665348, -0.7775634, 1, 1, 1, 1, 1,
-0.6000409, -0.3996432, -1.983309, 0, 0, 1, 1, 1,
-0.5994175, -0.6204231, -3.984785, 1, 0, 0, 1, 1,
-0.5977131, 0.02062384, -0.602809, 1, 0, 0, 1, 1,
-0.5942352, -1.197419, -2.093773, 1, 0, 0, 1, 1,
-0.5895737, -0.5153061, -0.5256049, 1, 0, 0, 1, 1,
-0.5834858, -0.7311679, -2.301788, 1, 0, 0, 1, 1,
-0.576984, -1.512997, -2.2618, 0, 0, 0, 1, 1,
-0.5768164, -1.323278, -2.940113, 0, 0, 0, 1, 1,
-0.5725213, 2.07548, -0.1591126, 0, 0, 0, 1, 1,
-0.5715744, 0.2679601, -1.265202, 0, 0, 0, 1, 1,
-0.5656145, 1.952641, 0.5969996, 0, 0, 0, 1, 1,
-0.5619135, 1.28525, -1.346868, 0, 0, 0, 1, 1,
-0.557927, -0.0791918, -1.003394, 0, 0, 0, 1, 1,
-0.5531093, -0.2366318, -1.044034, 1, 1, 1, 1, 1,
-0.5459507, 0.3408325, -1.948182, 1, 1, 1, 1, 1,
-0.5324613, 0.04959346, -1.430396, 1, 1, 1, 1, 1,
-0.5314909, -1.185949, -1.710602, 1, 1, 1, 1, 1,
-0.5296174, 0.9462685, -0.1271819, 1, 1, 1, 1, 1,
-0.5239887, -0.7623898, -2.845501, 1, 1, 1, 1, 1,
-0.5236971, -0.7534875, -3.86749, 1, 1, 1, 1, 1,
-0.5231496, -0.02380259, -2.232083, 1, 1, 1, 1, 1,
-0.5201511, 1.048051, -2.703478, 1, 1, 1, 1, 1,
-0.5196887, -0.8646615, -3.833402, 1, 1, 1, 1, 1,
-0.5174624, 0.5106979, -2.862915, 1, 1, 1, 1, 1,
-0.5166332, 0.5998874, -1.410186, 1, 1, 1, 1, 1,
-0.513423, 0.1642519, -1.085814, 1, 1, 1, 1, 1,
-0.506488, 0.006724042, -3.372431, 1, 1, 1, 1, 1,
-0.5058773, 0.3676712, -2.339191, 1, 1, 1, 1, 1,
-0.5025051, -0.5034219, -2.492688, 0, 0, 1, 1, 1,
-0.4990893, -0.08105601, -4.009827, 1, 0, 0, 1, 1,
-0.4990452, 0.8733359, 0.1788293, 1, 0, 0, 1, 1,
-0.497059, 0.8091301, 0.6223049, 1, 0, 0, 1, 1,
-0.4940602, -0.875595, -3.555217, 1, 0, 0, 1, 1,
-0.488301, 0.625993, 0.3913794, 1, 0, 0, 1, 1,
-0.4841616, -0.2805023, -1.293263, 0, 0, 0, 1, 1,
-0.4779175, -0.03286904, -1.504983, 0, 0, 0, 1, 1,
-0.4768707, 1.063347, -0.6821433, 0, 0, 0, 1, 1,
-0.4767406, -0.9181505, -3.272711, 0, 0, 0, 1, 1,
-0.4714536, -0.4045728, -3.20526, 0, 0, 0, 1, 1,
-0.4694632, -0.1451286, -2.883617, 0, 0, 0, 1, 1,
-0.4643742, 1.734931, -0.3711691, 0, 0, 0, 1, 1,
-0.4640096, -0.4336793, -2.522993, 1, 1, 1, 1, 1,
-0.4602493, 1.006187, -1.354685, 1, 1, 1, 1, 1,
-0.4601538, 1.075705, -1.136063, 1, 1, 1, 1, 1,
-0.4599937, -0.2881069, -2.86418, 1, 1, 1, 1, 1,
-0.4526771, -0.4680943, -2.592075, 1, 1, 1, 1, 1,
-0.4524025, 1.145527, -1.605686, 1, 1, 1, 1, 1,
-0.4486462, 0.3330171, -1.444093, 1, 1, 1, 1, 1,
-0.4485038, 0.2056672, -0.6282508, 1, 1, 1, 1, 1,
-0.4451977, 0.4520879, -2.148479, 1, 1, 1, 1, 1,
-0.4412349, -0.3006637, -3.054882, 1, 1, 1, 1, 1,
-0.4394568, -0.5858721, -2.536423, 1, 1, 1, 1, 1,
-0.4279854, -0.8032137, -2.729142, 1, 1, 1, 1, 1,
-0.4265437, -0.2743268, -2.316418, 1, 1, 1, 1, 1,
-0.426238, 0.06466825, -0.9278936, 1, 1, 1, 1, 1,
-0.4241298, 1.275377, -1.33498, 1, 1, 1, 1, 1,
-0.4208799, 0.03325541, -0.8080714, 0, 0, 1, 1, 1,
-0.4206528, -0.9944981, -3.523, 1, 0, 0, 1, 1,
-0.4200659, 0.002659077, -1.059072, 1, 0, 0, 1, 1,
-0.4200395, -0.8618903, -3.339271, 1, 0, 0, 1, 1,
-0.4191115, 1.29522, -0.6659739, 1, 0, 0, 1, 1,
-0.413518, -0.2477528, -3.845739, 1, 0, 0, 1, 1,
-0.4125212, -0.1640974, -1.77279, 0, 0, 0, 1, 1,
-0.4120527, 0.6748054, 1.005655, 0, 0, 0, 1, 1,
-0.4078734, -0.2863106, -3.319356, 0, 0, 0, 1, 1,
-0.4073828, 0.1081528, -1.034603, 0, 0, 0, 1, 1,
-0.4066278, -1.48641, -2.257806, 0, 0, 0, 1, 1,
-0.4059713, 0.877726, 0.1645756, 0, 0, 0, 1, 1,
-0.4051616, -1.268349, -3.946013, 0, 0, 0, 1, 1,
-0.4033691, 1.86768, -0.4505511, 1, 1, 1, 1, 1,
-0.4019568, -0.3685657, -2.413869, 1, 1, 1, 1, 1,
-0.4012927, -0.3435212, -2.530384, 1, 1, 1, 1, 1,
-0.3975026, -2.0566, -3.23552, 1, 1, 1, 1, 1,
-0.3954917, -1.287883, -1.719864, 1, 1, 1, 1, 1,
-0.3916642, 1.417408, 1.381039, 1, 1, 1, 1, 1,
-0.3910861, -1.485832, -3.153949, 1, 1, 1, 1, 1,
-0.38532, 1.282013, 0.5971581, 1, 1, 1, 1, 1,
-0.376614, -1.571116, -3.802688, 1, 1, 1, 1, 1,
-0.3764365, 0.6950363, -1.307719, 1, 1, 1, 1, 1,
-0.373136, 0.5112953, 0.160231, 1, 1, 1, 1, 1,
-0.3725787, 0.2702555, -1.792089, 1, 1, 1, 1, 1,
-0.3716184, -0.7568261, -2.055449, 1, 1, 1, 1, 1,
-0.3715568, -0.8419214, -1.502167, 1, 1, 1, 1, 1,
-0.3685261, 0.7353862, -0.004983637, 1, 1, 1, 1, 1,
-0.3656438, -1.268088, -4.380985, 0, 0, 1, 1, 1,
-0.3641104, -1.10981, -4.51445, 1, 0, 0, 1, 1,
-0.3635936, -0.53162, -2.795727, 1, 0, 0, 1, 1,
-0.3629996, -1.399026, -3.410495, 1, 0, 0, 1, 1,
-0.3628114, -0.2835646, -1.89523, 1, 0, 0, 1, 1,
-0.3596515, 0.6735454, -2.521955, 1, 0, 0, 1, 1,
-0.3586453, 0.7322037, 0.9555952, 0, 0, 0, 1, 1,
-0.3520248, 1.273646, -0.5141445, 0, 0, 0, 1, 1,
-0.3512335, 1.076055, -1.02606, 0, 0, 0, 1, 1,
-0.3501006, -0.6418616, -2.604639, 0, 0, 0, 1, 1,
-0.3480962, -0.4870558, -2.010849, 0, 0, 0, 1, 1,
-0.3462087, -0.155535, -2.334863, 0, 0, 0, 1, 1,
-0.345893, -0.2764246, -2.092002, 0, 0, 0, 1, 1,
-0.3382557, 0.6977187, 0.2962088, 1, 1, 1, 1, 1,
-0.3363894, 1.743054, -0.1732413, 1, 1, 1, 1, 1,
-0.3343053, 1.211992, -0.6960256, 1, 1, 1, 1, 1,
-0.3269532, 0.5903462, 0.1084167, 1, 1, 1, 1, 1,
-0.3223658, -2.065534, -3.514104, 1, 1, 1, 1, 1,
-0.3132502, 0.541321, 0.1320446, 1, 1, 1, 1, 1,
-0.3054655, 0.05075752, -1.307767, 1, 1, 1, 1, 1,
-0.3019935, -0.4802785, -3.911019, 1, 1, 1, 1, 1,
-0.3003911, 0.5916309, 0.4536249, 1, 1, 1, 1, 1,
-0.2998736, 1.255873, -1.510725, 1, 1, 1, 1, 1,
-0.2963506, 0.008390679, -1.733963, 1, 1, 1, 1, 1,
-0.2941406, -0.3665951, -2.167613, 1, 1, 1, 1, 1,
-0.2920975, 0.6969096, -2.225991, 1, 1, 1, 1, 1,
-0.2879823, 0.5537129, 0.186282, 1, 1, 1, 1, 1,
-0.2802146, -1.360891, -2.247793, 1, 1, 1, 1, 1,
-0.2798596, 2.10331, -0.6137106, 0, 0, 1, 1, 1,
-0.2792206, 1.30162, 0.1831889, 1, 0, 0, 1, 1,
-0.2759098, -0.06758635, -1.860415, 1, 0, 0, 1, 1,
-0.2743074, -1.035413, -1.824599, 1, 0, 0, 1, 1,
-0.2726778, 0.1137442, -1.7268, 1, 0, 0, 1, 1,
-0.2694522, 0.4494297, 1.641214, 1, 0, 0, 1, 1,
-0.2669623, -0.3388832, -2.118801, 0, 0, 0, 1, 1,
-0.2608416, 1.169531, -0.0004786774, 0, 0, 0, 1, 1,
-0.2590837, -0.619076, -3.023289, 0, 0, 0, 1, 1,
-0.2585636, -0.1110437, -2.844991, 0, 0, 0, 1, 1,
-0.257825, -0.1915493, -2.831129, 0, 0, 0, 1, 1,
-0.2529424, -0.7101085, -2.881593, 0, 0, 0, 1, 1,
-0.2497088, -0.3337296, -3.228719, 0, 0, 0, 1, 1,
-0.2464895, -1.714953, -2.798628, 1, 1, 1, 1, 1,
-0.2449434, -0.719775, -0.3427305, 1, 1, 1, 1, 1,
-0.2422733, 0.8732213, -2.744875, 1, 1, 1, 1, 1,
-0.2411778, 0.6989966, 0.8781564, 1, 1, 1, 1, 1,
-0.2406687, 0.1871882, -1.339516, 1, 1, 1, 1, 1,
-0.2400771, -0.3342372, -2.645861, 1, 1, 1, 1, 1,
-0.2393097, 1.571405, -2.361236, 1, 1, 1, 1, 1,
-0.2335958, -0.5519263, -2.912639, 1, 1, 1, 1, 1,
-0.2291097, -2.155501, -2.396144, 1, 1, 1, 1, 1,
-0.2280058, -0.8904986, -3.368804, 1, 1, 1, 1, 1,
-0.2255252, 1.434304, 0.3675213, 1, 1, 1, 1, 1,
-0.2253435, 0.2508436, -2.531737, 1, 1, 1, 1, 1,
-0.225146, 0.6236238, 0.3262533, 1, 1, 1, 1, 1,
-0.218271, -1.620798, -1.153609, 1, 1, 1, 1, 1,
-0.2108988, 0.3436191, -0.1728705, 1, 1, 1, 1, 1,
-0.2065092, -0.07618554, -0.8798967, 0, 0, 1, 1, 1,
-0.2041756, 2.274991, 1.297174, 1, 0, 0, 1, 1,
-0.2041596, 0.1219421, -0.216173, 1, 0, 0, 1, 1,
-0.2040259, -0.2113106, -2.857989, 1, 0, 0, 1, 1,
-0.1999101, -1.402329, -3.955716, 1, 0, 0, 1, 1,
-0.1977234, -1.777597, -0.2665747, 1, 0, 0, 1, 1,
-0.197665, -0.4260014, -1.520073, 0, 0, 0, 1, 1,
-0.1890778, -0.5072474, -3.922484, 0, 0, 0, 1, 1,
-0.1849119, -0.6266036, -2.256527, 0, 0, 0, 1, 1,
-0.1812879, -1.274613, -3.98954, 0, 0, 0, 1, 1,
-0.1778537, -1.354721, -3.023412, 0, 0, 0, 1, 1,
-0.1776704, -0.4076495, -3.913244, 0, 0, 0, 1, 1,
-0.1770881, -0.09749191, -3.694384, 0, 0, 0, 1, 1,
-0.1765259, 0.5890527, 0.2965288, 1, 1, 1, 1, 1,
-0.1645763, -0.7369325, -2.597587, 1, 1, 1, 1, 1,
-0.1629611, 0.1055686, -2.295619, 1, 1, 1, 1, 1,
-0.1626725, -1.183554, -2.440959, 1, 1, 1, 1, 1,
-0.1600393, -1.352147, -4.769458, 1, 1, 1, 1, 1,
-0.1575046, 0.8097233, -0.2904952, 1, 1, 1, 1, 1,
-0.1549881, -0.6800058, -2.762829, 1, 1, 1, 1, 1,
-0.150014, -0.2589802, -2.556026, 1, 1, 1, 1, 1,
-0.1472944, 0.2143548, 1.40586, 1, 1, 1, 1, 1,
-0.1463851, 1.000081, -0.6760331, 1, 1, 1, 1, 1,
-0.1404157, 1.604247, 0.1134784, 1, 1, 1, 1, 1,
-0.131833, 0.1569198, 1.510297, 1, 1, 1, 1, 1,
-0.1311746, 0.01669892, -1.430412, 1, 1, 1, 1, 1,
-0.1299995, -0.3715712, -3.272991, 1, 1, 1, 1, 1,
-0.1292416, 1.049645, -1.998525, 1, 1, 1, 1, 1,
-0.1272179, -0.109, -0.9048642, 0, 0, 1, 1, 1,
-0.1230614, 1.054284, -1.063761, 1, 0, 0, 1, 1,
-0.1230063, 1.105719, 0.05983247, 1, 0, 0, 1, 1,
-0.1229027, 1.068197, 0.4181837, 1, 0, 0, 1, 1,
-0.1228553, 0.394948, 0.2899619, 1, 0, 0, 1, 1,
-0.1211483, -0.6815636, -2.62825, 1, 0, 0, 1, 1,
-0.1177069, -0.5917401, -1.143383, 0, 0, 0, 1, 1,
-0.1169503, -0.4676538, -2.792126, 0, 0, 0, 1, 1,
-0.1146722, 0.06883874, -0.7959325, 0, 0, 0, 1, 1,
-0.111716, -0.05481708, -1.173677, 0, 0, 0, 1, 1,
-0.1106353, 1.635286, -0.6813952, 0, 0, 0, 1, 1,
-0.1105075, 1.765622, -1.316658, 0, 0, 0, 1, 1,
-0.1082001, -0.5030386, -4.348664, 0, 0, 0, 1, 1,
-0.1076398, -0.5056295, -1.927734, 1, 1, 1, 1, 1,
-0.103477, -0.9468094, -5.011954, 1, 1, 1, 1, 1,
-0.1033764, -1.636422, -4.136493, 1, 1, 1, 1, 1,
-0.1016889, 0.1909836, -0.8769135, 1, 1, 1, 1, 1,
-0.1011103, -0.1779629, -2.560601, 1, 1, 1, 1, 1,
-0.09765241, -1.618517, -3.001407, 1, 1, 1, 1, 1,
-0.09704296, 0.8800335, 0.2870253, 1, 1, 1, 1, 1,
-0.09457473, 0.8991807, -0.3852365, 1, 1, 1, 1, 1,
-0.09267491, 1.129193, -1.002835, 1, 1, 1, 1, 1,
-0.08493841, 0.6356431, -1.89632, 1, 1, 1, 1, 1,
-0.08371329, -1.047469, -3.108572, 1, 1, 1, 1, 1,
-0.08205716, -0.493522, -3.567306, 1, 1, 1, 1, 1,
-0.0770354, 0.492783, -1.729573, 1, 1, 1, 1, 1,
-0.07560516, -0.8611746, -4.198119, 1, 1, 1, 1, 1,
-0.07425915, 0.9850278, 0.2046593, 1, 1, 1, 1, 1,
-0.07400572, 0.7268301, 1.380462, 0, 0, 1, 1, 1,
-0.0720606, -0.3103594, -2.787568, 1, 0, 0, 1, 1,
-0.07182622, 0.3252046, 0.9914768, 1, 0, 0, 1, 1,
-0.06780504, -2.170073, -2.767735, 1, 0, 0, 1, 1,
-0.0675211, 0.194748, 0.07293835, 1, 0, 0, 1, 1,
-0.06517407, -0.7271127, -2.418875, 1, 0, 0, 1, 1,
-0.06282334, 0.7975559, -1.817382, 0, 0, 0, 1, 1,
-0.05976018, -0.7893553, -2.776842, 0, 0, 0, 1, 1,
-0.05971545, 2.064882, 0.1027665, 0, 0, 0, 1, 1,
-0.0582272, 0.7681178, 0.8024709, 0, 0, 0, 1, 1,
-0.05737276, -0.9340481, -2.270487, 0, 0, 0, 1, 1,
-0.05646475, 2.221005, -0.9500679, 0, 0, 0, 1, 1,
-0.05450317, -0.9920324, -2.225309, 0, 0, 0, 1, 1,
-0.04672073, 1.524905, 1.449084, 1, 1, 1, 1, 1,
-0.04114879, 1.548393, -0.0658718, 1, 1, 1, 1, 1,
-0.0381768, 0.6382531, -0.7660565, 1, 1, 1, 1, 1,
-0.03720874, -0.7596639, -1.505335, 1, 1, 1, 1, 1,
-0.03659466, 0.3287987, 0.6339158, 1, 1, 1, 1, 1,
-0.03115571, 1.353383, -1.31955, 1, 1, 1, 1, 1,
-0.0309291, 0.3599005, 0.06284287, 1, 1, 1, 1, 1,
-0.02815444, 0.7628009, 0.3820738, 1, 1, 1, 1, 1,
-0.02699084, -0.2393244, -2.119807, 1, 1, 1, 1, 1,
-0.0261548, 0.3581067, -1.263653, 1, 1, 1, 1, 1,
-0.02316017, -0.5474377, -1.820523, 1, 1, 1, 1, 1,
-0.01739418, 0.5536147, -0.1603888, 1, 1, 1, 1, 1,
-0.01361381, -0.5138239, -2.508367, 1, 1, 1, 1, 1,
-0.01182709, 0.1868827, 0.1358183, 1, 1, 1, 1, 1,
-0.01001103, 1.745364, 0.9727497, 1, 1, 1, 1, 1,
-0.007656983, -0.1505387, -2.459662, 0, 0, 1, 1, 1,
-0.006940395, 0.6474776, -0.4927108, 1, 0, 0, 1, 1,
-0.006502028, 0.3489216, -0.6879807, 1, 0, 0, 1, 1,
-0.0008094854, 0.3267486, -1.370617, 1, 0, 0, 1, 1,
0.005457154, 1.438892, 0.6030901, 1, 0, 0, 1, 1,
0.007668697, 1.849923, -0.1122106, 1, 0, 0, 1, 1,
0.01007745, -0.452602, 1.868774, 0, 0, 0, 1, 1,
0.01353218, 2.106052, 0.7128134, 0, 0, 0, 1, 1,
0.01539519, -0.3139974, 2.984869, 0, 0, 0, 1, 1,
0.01575953, -1.763943, 4.218201, 0, 0, 0, 1, 1,
0.02045071, -1.121698, 3.424717, 0, 0, 0, 1, 1,
0.02278308, -1.225381, 2.628284, 0, 0, 0, 1, 1,
0.02396623, 0.2627897, 0.1739433, 0, 0, 0, 1, 1,
0.03506269, 1.307184, 0.8702441, 1, 1, 1, 1, 1,
0.04181906, -0.8202763, 3.825463, 1, 1, 1, 1, 1,
0.04346571, 1.656144, 0.8469943, 1, 1, 1, 1, 1,
0.05167955, 2.062469, 1.237458, 1, 1, 1, 1, 1,
0.05357371, -0.2272932, 2.007851, 1, 1, 1, 1, 1,
0.055654, 2.050277, -0.3637431, 1, 1, 1, 1, 1,
0.05676353, -1.455926, 3.762354, 1, 1, 1, 1, 1,
0.05717164, 0.6828506, 0.1505286, 1, 1, 1, 1, 1,
0.057956, 0.3529818, -0.938961, 1, 1, 1, 1, 1,
0.05906134, -1.576674, 3.09264, 1, 1, 1, 1, 1,
0.06164323, -0.0418279, 3.35271, 1, 1, 1, 1, 1,
0.06187386, -0.8469944, 2.465676, 1, 1, 1, 1, 1,
0.0643538, 1.513057, -2.151013, 1, 1, 1, 1, 1,
0.06641145, -0.2261429, 4.434537, 1, 1, 1, 1, 1,
0.06982908, -1.626919, 1.260164, 1, 1, 1, 1, 1,
0.07006344, -0.3148063, 2.073689, 0, 0, 1, 1, 1,
0.07367779, -0.5418109, 2.179657, 1, 0, 0, 1, 1,
0.07369911, -0.7160623, 2.106108, 1, 0, 0, 1, 1,
0.07850263, -1.419843, 4.413421, 1, 0, 0, 1, 1,
0.09257059, -0.1678828, 1.968417, 1, 0, 0, 1, 1,
0.09484514, -1.16484, 4.736761, 1, 0, 0, 1, 1,
0.09532412, -0.1157679, 0.1051059, 0, 0, 0, 1, 1,
0.0986762, 0.06229918, 1.615853, 0, 0, 0, 1, 1,
0.1000446, 0.7810972, -2.600411, 0, 0, 0, 1, 1,
0.1003184, 0.5764225, -0.6274006, 0, 0, 0, 1, 1,
0.1016159, -0.1514755, 3.818288, 0, 0, 0, 1, 1,
0.103421, 0.5165688, 0.7608065, 0, 0, 0, 1, 1,
0.1095861, 2.279329, -0.7137753, 0, 0, 0, 1, 1,
0.109975, 0.5575244, -0.609721, 1, 1, 1, 1, 1,
0.1114495, 0.2468402, 0.4268345, 1, 1, 1, 1, 1,
0.1124847, 0.2879471, -0.1635465, 1, 1, 1, 1, 1,
0.1160448, -2.000226, 2.280843, 1, 1, 1, 1, 1,
0.1160696, 1.10264, 0.7705255, 1, 1, 1, 1, 1,
0.1218038, -0.8594303, 0.3988112, 1, 1, 1, 1, 1,
0.1259396, 0.001730392, -0.03315955, 1, 1, 1, 1, 1,
0.1279157, 0.3588746, 0.2482136, 1, 1, 1, 1, 1,
0.1340231, 0.06593076, 0.767584, 1, 1, 1, 1, 1,
0.1350417, -1.248118, 1.388383, 1, 1, 1, 1, 1,
0.1375886, 1.305587, -0.4706987, 1, 1, 1, 1, 1,
0.1405084, 0.8958804, 0.06022256, 1, 1, 1, 1, 1,
0.1408164, -0.007863815, 1.492241, 1, 1, 1, 1, 1,
0.1418786, 0.008531804, 0.9529113, 1, 1, 1, 1, 1,
0.1451607, 0.7412961, -1.300389, 1, 1, 1, 1, 1,
0.1452593, 1.530171, 0.3427693, 0, 0, 1, 1, 1,
0.1490766, 0.5317444, -0.4685963, 1, 0, 0, 1, 1,
0.1503392, -1.092676, 3.804229, 1, 0, 0, 1, 1,
0.1514147, -0.3645334, 2.585896, 1, 0, 0, 1, 1,
0.1547719, 1.625265, -0.2348583, 1, 0, 0, 1, 1,
0.156082, -1.086175, 1.508228, 1, 0, 0, 1, 1,
0.1568036, 0.9355515, 0.7823403, 0, 0, 0, 1, 1,
0.1592279, 1.16333, -0.4207602, 0, 0, 0, 1, 1,
0.159431, 0.7500501, 0.8710639, 0, 0, 0, 1, 1,
0.1618478, 0.7076067, 1.47725, 0, 0, 0, 1, 1,
0.1633273, -1.021615, 2.195737, 0, 0, 0, 1, 1,
0.1636827, -0.3295686, 3.003824, 0, 0, 0, 1, 1,
0.1706808, -0.3074063, 3.171184, 0, 0, 0, 1, 1,
0.1745251, 2.167909, 0.8934394, 1, 1, 1, 1, 1,
0.1877831, -1.000509, 2.993653, 1, 1, 1, 1, 1,
0.1905564, 1.660297, 0.8600392, 1, 1, 1, 1, 1,
0.1911029, 0.8110743, 2.231798, 1, 1, 1, 1, 1,
0.1933224, 1.075924, -0.922664, 1, 1, 1, 1, 1,
0.1944498, 0.4861593, 0.8694357, 1, 1, 1, 1, 1,
0.1989341, 0.240927, 2.344446, 1, 1, 1, 1, 1,
0.2011781, 1.27828, 2.133761, 1, 1, 1, 1, 1,
0.2067922, 1.17468, -0.1372997, 1, 1, 1, 1, 1,
0.2080165, 1.079098, -0.02861899, 1, 1, 1, 1, 1,
0.2108312, 0.0694039, 1.101345, 1, 1, 1, 1, 1,
0.2108447, -2.008334, 3.120543, 1, 1, 1, 1, 1,
0.2198678, -0.232557, 1.176971, 1, 1, 1, 1, 1,
0.2211044, -0.7469164, 3.790756, 1, 1, 1, 1, 1,
0.2245516, -0.6962763, 2.273568, 1, 1, 1, 1, 1,
0.2285239, -1.151088, 3.354356, 0, 0, 1, 1, 1,
0.2300328, 1.212646, -0.3332151, 1, 0, 0, 1, 1,
0.2312523, -0.8337067, 2.017647, 1, 0, 0, 1, 1,
0.2323322, -1.767236, 2.889065, 1, 0, 0, 1, 1,
0.2416697, -0.6556535, 1.861294, 1, 0, 0, 1, 1,
0.2435394, -1.383534, 2.700449, 1, 0, 0, 1, 1,
0.2456083, -0.9376222, 4.234194, 0, 0, 0, 1, 1,
0.246064, 1.417577, 0.6278659, 0, 0, 0, 1, 1,
0.2497011, 0.5486555, 0.9109249, 0, 0, 0, 1, 1,
0.2523261, 0.2141333, 0.06997932, 0, 0, 0, 1, 1,
0.2551166, 0.6189653, 0.3210699, 0, 0, 0, 1, 1,
0.2575144, -2.003123, 3.048163, 0, 0, 0, 1, 1,
0.2581328, -1.13217, 2.571984, 0, 0, 0, 1, 1,
0.2621029, 0.7532559, -0.1363025, 1, 1, 1, 1, 1,
0.2668501, 1.814897, -0.5223624, 1, 1, 1, 1, 1,
0.2680667, 0.7672279, 0.7831212, 1, 1, 1, 1, 1,
0.2694654, -2.013725, 2.152472, 1, 1, 1, 1, 1,
0.2701105, 1.257857, 1.67673, 1, 1, 1, 1, 1,
0.2746138, 0.1378533, 1.756524, 1, 1, 1, 1, 1,
0.2752775, -0.8697251, 2.455039, 1, 1, 1, 1, 1,
0.2758689, 1.595598, -2.144962, 1, 1, 1, 1, 1,
0.2762917, 0.5394279, 1.356925, 1, 1, 1, 1, 1,
0.2797522, 1.318099, 1.244668, 1, 1, 1, 1, 1,
0.2810164, -0.6722752, 0.7464381, 1, 1, 1, 1, 1,
0.2881186, -0.05499512, 1.79889, 1, 1, 1, 1, 1,
0.2891706, 1.371873, -2.115683, 1, 1, 1, 1, 1,
0.2965573, -1.084812, 3.700553, 1, 1, 1, 1, 1,
0.2976265, 0.7744431, -0.446743, 1, 1, 1, 1, 1,
0.297642, -0.5677992, 2.503448, 0, 0, 1, 1, 1,
0.3000389, -0.01878081, 2.075578, 1, 0, 0, 1, 1,
0.3029177, 0.02375855, 1.558264, 1, 0, 0, 1, 1,
0.3034256, -0.6911801, 3.50128, 1, 0, 0, 1, 1,
0.3064009, -1.187547, 1.769458, 1, 0, 0, 1, 1,
0.3069058, -0.5066885, 3.694484, 1, 0, 0, 1, 1,
0.312, 0.3201761, 0.8694075, 0, 0, 0, 1, 1,
0.3136362, 0.290597, -0.03768577, 0, 0, 0, 1, 1,
0.3149881, -0.2385484, 2.766732, 0, 0, 0, 1, 1,
0.3150222, -0.2579484, 2.249252, 0, 0, 0, 1, 1,
0.315741, 0.3631027, 0.1294668, 0, 0, 0, 1, 1,
0.3180883, -0.6682121, 3.266465, 0, 0, 0, 1, 1,
0.3198397, 0.5523112, 1.698821, 0, 0, 0, 1, 1,
0.3210749, -2.057858, 3.226939, 1, 1, 1, 1, 1,
0.3267223, -0.8736423, 4.661529, 1, 1, 1, 1, 1,
0.3328816, -0.5753582, 2.472661, 1, 1, 1, 1, 1,
0.3330716, 0.5638692, 1.814061, 1, 1, 1, 1, 1,
0.3379773, 1.572627, -0.9194121, 1, 1, 1, 1, 1,
0.3419878, -0.4299434, 3.536534, 1, 1, 1, 1, 1,
0.3429513, 1.170828, -0.8898451, 1, 1, 1, 1, 1,
0.3490323, -1.452794, 3.245278, 1, 1, 1, 1, 1,
0.3545437, -0.3636873, 0.2452302, 1, 1, 1, 1, 1,
0.3545959, 0.7995011, 0.308634, 1, 1, 1, 1, 1,
0.3557293, -0.4977659, 2.574346, 1, 1, 1, 1, 1,
0.3647958, -1.21767, 2.852222, 1, 1, 1, 1, 1,
0.3676048, 1.801787, 2.675102, 1, 1, 1, 1, 1,
0.3704327, -0.1117685, 1.35524, 1, 1, 1, 1, 1,
0.3735577, 0.9347392, 0.3763365, 1, 1, 1, 1, 1,
0.3736259, -0.889497, 3.64905, 0, 0, 1, 1, 1,
0.374412, 0.5764532, 1.695813, 1, 0, 0, 1, 1,
0.3756677, -1.097672, 3.14941, 1, 0, 0, 1, 1,
0.3794289, 0.2233883, 2.41977, 1, 0, 0, 1, 1,
0.3798119, 0.135799, 1.830278, 1, 0, 0, 1, 1,
0.3810211, 0.01665513, 2.321776, 1, 0, 0, 1, 1,
0.3817692, -0.9536546, 1.779305, 0, 0, 0, 1, 1,
0.3827489, 0.5454545, 0.3298412, 0, 0, 0, 1, 1,
0.3847504, 0.1721414, 1.818345, 0, 0, 0, 1, 1,
0.3873194, 1.469629, -1.290575, 0, 0, 0, 1, 1,
0.3886793, 0.3090387, -0.9657156, 0, 0, 0, 1, 1,
0.388878, 0.4023179, 2.155023, 0, 0, 0, 1, 1,
0.391445, -0.7877322, 1.951471, 0, 0, 0, 1, 1,
0.4004517, 0.1713417, 0.1492455, 1, 1, 1, 1, 1,
0.400812, -1.267301, 3.01658, 1, 1, 1, 1, 1,
0.400925, -1.628154, 3.765807, 1, 1, 1, 1, 1,
0.4042363, -0.8206671, 2.816149, 1, 1, 1, 1, 1,
0.4079814, 0.6508235, 0.4913229, 1, 1, 1, 1, 1,
0.4105392, -0.6523318, 3.838122, 1, 1, 1, 1, 1,
0.4136103, 0.9161473, -0.2736301, 1, 1, 1, 1, 1,
0.4208366, 0.3125633, -0.2611677, 1, 1, 1, 1, 1,
0.4224283, 1.105752, 1.092025, 1, 1, 1, 1, 1,
0.4239202, -0.5337724, 2.59828, 1, 1, 1, 1, 1,
0.4258782, -1.868525, 3.254809, 1, 1, 1, 1, 1,
0.4341587, 0.1825859, -0.450929, 1, 1, 1, 1, 1,
0.4351811, -0.2086685, 3.563277, 1, 1, 1, 1, 1,
0.4372492, 0.1016475, -0.04064877, 1, 1, 1, 1, 1,
0.4396914, -1.239124, 2.305398, 1, 1, 1, 1, 1,
0.447167, 1.927009, 1.012632, 0, 0, 1, 1, 1,
0.4567442, 0.504434, 0.8457611, 1, 0, 0, 1, 1,
0.457324, 1.565065, -1.382604, 1, 0, 0, 1, 1,
0.4584645, 0.4998346, 0.7304374, 1, 0, 0, 1, 1,
0.4648325, -0.3495283, -0.1899313, 1, 0, 0, 1, 1,
0.468564, -0.9616843, 3.014888, 1, 0, 0, 1, 1,
0.470478, 1.559335, 0.3631858, 0, 0, 0, 1, 1,
0.4725008, -0.3157086, 1.074612, 0, 0, 0, 1, 1,
0.4749855, -0.3841233, 3.693319, 0, 0, 0, 1, 1,
0.4749874, -1.527506, 3.942796, 0, 0, 0, 1, 1,
0.4779968, 0.06186734, 2.444255, 0, 0, 0, 1, 1,
0.4803503, 0.9822147, 1.885366, 0, 0, 0, 1, 1,
0.4804266, -0.4045591, 1.37507, 0, 0, 0, 1, 1,
0.4887793, 0.4298629, -0.6497203, 1, 1, 1, 1, 1,
0.491161, 1.709063, -0.07524649, 1, 1, 1, 1, 1,
0.4943649, -0.680059, 3.358136, 1, 1, 1, 1, 1,
0.4973598, -0.09522989, 2.290164, 1, 1, 1, 1, 1,
0.4988394, -0.003757677, 1.464481, 1, 1, 1, 1, 1,
0.5005444, 1.384932, 1.139637, 1, 1, 1, 1, 1,
0.5008316, -0.8611959, 4.181471, 1, 1, 1, 1, 1,
0.5018025, -1.64218, 2.152617, 1, 1, 1, 1, 1,
0.5024221, -0.3988328, 0.6688661, 1, 1, 1, 1, 1,
0.5036477, -0.7103849, 0.2638865, 1, 1, 1, 1, 1,
0.5086544, 1.27484, -1.701719, 1, 1, 1, 1, 1,
0.5127105, 0.7467823, 0.2478336, 1, 1, 1, 1, 1,
0.5140368, 1.107525, 0.7350957, 1, 1, 1, 1, 1,
0.5159988, 0.9463661, -0.08502231, 1, 1, 1, 1, 1,
0.518221, -0.05493645, 1.424734, 1, 1, 1, 1, 1,
0.5218005, -0.8615168, 1.932536, 0, 0, 1, 1, 1,
0.5219189, 0.1596084, 0.6886719, 1, 0, 0, 1, 1,
0.5294083, -0.6356292, 1.296869, 1, 0, 0, 1, 1,
0.5298465, -0.518462, 2.69276, 1, 0, 0, 1, 1,
0.5327296, 0.5349122, -0.1888552, 1, 0, 0, 1, 1,
0.5332896, 1.363645, 0.05419334, 1, 0, 0, 1, 1,
0.5364092, -1.399214, 4.424819, 0, 0, 0, 1, 1,
0.5367097, -1.372902, 2.762811, 0, 0, 0, 1, 1,
0.5416539, -0.6310889, 3.703915, 0, 0, 0, 1, 1,
0.5425934, -1.032075, 1.112641, 0, 0, 0, 1, 1,
0.5463046, -0.9327431, 2.016338, 0, 0, 0, 1, 1,
0.548592, -0.01214497, 2.928292, 0, 0, 0, 1, 1,
0.5486672, -0.009794597, 1.392374, 0, 0, 0, 1, 1,
0.5494251, 0.2366603, 1.634484, 1, 1, 1, 1, 1,
0.5544465, -1.40585, 2.884171, 1, 1, 1, 1, 1,
0.5589131, 1.371181, 0.111888, 1, 1, 1, 1, 1,
0.5623983, -0.4383464, 3.471079, 1, 1, 1, 1, 1,
0.5712503, -0.4474047, 2.186732, 1, 1, 1, 1, 1,
0.5804449, 0.4456533, -0.03553504, 1, 1, 1, 1, 1,
0.5873083, 1.791814, 1.145208, 1, 1, 1, 1, 1,
0.5876088, 0.2457287, 2.320922, 1, 1, 1, 1, 1,
0.5902525, 0.4217697, 1.701754, 1, 1, 1, 1, 1,
0.5949608, -0.6265516, 2.590932, 1, 1, 1, 1, 1,
0.5964093, 1.22432, 1.34801, 1, 1, 1, 1, 1,
0.596868, -1.687837, 1.512235, 1, 1, 1, 1, 1,
0.5970857, 0.8525234, 0.2466503, 1, 1, 1, 1, 1,
0.603335, -2.122201, 0.7115455, 1, 1, 1, 1, 1,
0.6034168, -0.1664468, 1.395795, 1, 1, 1, 1, 1,
0.6069632, -0.8169658, 2.390071, 0, 0, 1, 1, 1,
0.6072993, -0.03509817, 2.356016, 1, 0, 0, 1, 1,
0.6076784, -1.071223, 4.486048, 1, 0, 0, 1, 1,
0.6140195, -1.498671, 1.752005, 1, 0, 0, 1, 1,
0.6175637, 0.2696275, 1.961271, 1, 0, 0, 1, 1,
0.6180859, 1.446957, -1.157868, 1, 0, 0, 1, 1,
0.6238955, -0.6213759, 2.598799, 0, 0, 0, 1, 1,
0.6253137, 0.1972002, 0.1117883, 0, 0, 0, 1, 1,
0.6321161, 0.641909, 0.02814756, 0, 0, 0, 1, 1,
0.6361541, 0.277931, 1.191375, 0, 0, 0, 1, 1,
0.6364107, -1.829331, 3.992081, 0, 0, 0, 1, 1,
0.6382729, 0.8796887, 1.767547, 0, 0, 0, 1, 1,
0.6421314, 1.169197, 0.8341995, 0, 0, 0, 1, 1,
0.6442769, 0.9476938, -0.8438268, 1, 1, 1, 1, 1,
0.6458858, 0.001794423, 0.7810928, 1, 1, 1, 1, 1,
0.64613, -0.8374007, 2.442514, 1, 1, 1, 1, 1,
0.6475838, 0.01338847, 0.6512048, 1, 1, 1, 1, 1,
0.64849, -0.5114058, 2.104123, 1, 1, 1, 1, 1,
0.6488493, -0.501784, 2.47628, 1, 1, 1, 1, 1,
0.6515101, 1.145829, 0.6240116, 1, 1, 1, 1, 1,
0.6577132, 0.8511721, -0.04252414, 1, 1, 1, 1, 1,
0.6618773, 0.4452901, 1.618219, 1, 1, 1, 1, 1,
0.6622968, 0.6493349, 0.6100373, 1, 1, 1, 1, 1,
0.666927, -0.4129603, 1.926612, 1, 1, 1, 1, 1,
0.6734236, -0.1150791, 1.86433, 1, 1, 1, 1, 1,
0.6749949, -1.180397, 2.01462, 1, 1, 1, 1, 1,
0.6769328, -0.8863184, 2.858588, 1, 1, 1, 1, 1,
0.6776882, -0.6373677, 2.164266, 1, 1, 1, 1, 1,
0.6794384, 1.095726, 0.9693173, 0, 0, 1, 1, 1,
0.680219, 1.187371, 1.905219, 1, 0, 0, 1, 1,
0.6839526, 0.9723617, 0.7196915, 1, 0, 0, 1, 1,
0.6848275, 0.5563836, 0.143681, 1, 0, 0, 1, 1,
0.6864517, -0.3414581, 0.5334587, 1, 0, 0, 1, 1,
0.6885788, -0.2634311, 3.054331, 1, 0, 0, 1, 1,
0.691507, -0.06255171, 0.6666263, 0, 0, 0, 1, 1,
0.6942472, -0.1527653, 2.395234, 0, 0, 0, 1, 1,
0.6946146, 1.362538, -1.799379, 0, 0, 0, 1, 1,
0.6960256, 0.1269876, 1.570736, 0, 0, 0, 1, 1,
0.7004467, 3.186579, 0.2368219, 0, 0, 0, 1, 1,
0.7022377, -1.295316, 3.790694, 0, 0, 0, 1, 1,
0.7137082, 0.9541884, -0.6092207, 0, 0, 0, 1, 1,
0.7191749, 1.347697, 1.799098, 1, 1, 1, 1, 1,
0.7192017, -0.8994098, 1.784994, 1, 1, 1, 1, 1,
0.7194746, 0.4221856, 0.2046147, 1, 1, 1, 1, 1,
0.7219635, 0.8687286, 1.150331, 1, 1, 1, 1, 1,
0.7238166, 0.2933797, 1.799831, 1, 1, 1, 1, 1,
0.7254886, -1.700146, 4.56131, 1, 1, 1, 1, 1,
0.7273951, -0.399052, 3.564165, 1, 1, 1, 1, 1,
0.7288314, -0.8013778, 1.704294, 1, 1, 1, 1, 1,
0.7291924, -1.32206, 3.42592, 1, 1, 1, 1, 1,
0.736475, -1.116745, 4.386686, 1, 1, 1, 1, 1,
0.739648, 2.076991, 1.657383, 1, 1, 1, 1, 1,
0.7428809, -0.6277189, 2.950473, 1, 1, 1, 1, 1,
0.7450266, 0.697842, -0.09239172, 1, 1, 1, 1, 1,
0.7531379, 2.653871, 0.7862315, 1, 1, 1, 1, 1,
0.7560879, -1.248342, 2.891552, 1, 1, 1, 1, 1,
0.7571172, -0.437296, 2.929693, 0, 0, 1, 1, 1,
0.7577493, 0.2502049, 1.809576, 1, 0, 0, 1, 1,
0.7644675, -0.4226531, 2.127069, 1, 0, 0, 1, 1,
0.7650227, -0.9014893, 3.206435, 1, 0, 0, 1, 1,
0.7665522, -0.09999079, 0.8635204, 1, 0, 0, 1, 1,
0.767147, 0.1782382, -0.003568651, 1, 0, 0, 1, 1,
0.7748749, -2.658222, 2.88219, 0, 0, 0, 1, 1,
0.7757294, 0.5740982, -0.2953708, 0, 0, 0, 1, 1,
0.7779161, 0.3056509, 3.48869, 0, 0, 0, 1, 1,
0.7787699, 0.4087671, 1.842116, 0, 0, 0, 1, 1,
0.7787934, 0.04165247, 0.4247797, 0, 0, 0, 1, 1,
0.780646, 1.211335, -0.09473655, 0, 0, 0, 1, 1,
0.7993818, 1.217336, 0.6876885, 0, 0, 0, 1, 1,
0.8031881, 1.605343, -0.3798694, 1, 1, 1, 1, 1,
0.8079941, -0.8756858, 2.229252, 1, 1, 1, 1, 1,
0.8136799, -0.8697686, 1.339273, 1, 1, 1, 1, 1,
0.8153657, -0.04788197, 2.235406, 1, 1, 1, 1, 1,
0.8208865, -2.289391, 4.395578, 1, 1, 1, 1, 1,
0.8214263, 1.222148, 1.315187, 1, 1, 1, 1, 1,
0.8218848, 0.4635048, -0.3465212, 1, 1, 1, 1, 1,
0.8264535, -0.4630957, 0.9868181, 1, 1, 1, 1, 1,
0.8306959, -0.275072, -0.7350726, 1, 1, 1, 1, 1,
0.8379645, 1.738131, 2.463148, 1, 1, 1, 1, 1,
0.8410022, 0.2861147, 0.4718613, 1, 1, 1, 1, 1,
0.8437844, 1.547753, 0.3974295, 1, 1, 1, 1, 1,
0.8451703, 1.821573, -1.070972, 1, 1, 1, 1, 1,
0.848138, -0.9406626, 2.837367, 1, 1, 1, 1, 1,
0.8483487, 0.9892504, 2.487626, 1, 1, 1, 1, 1,
0.8522347, 0.21301, 3.657457, 0, 0, 1, 1, 1,
0.8592635, 1.419199, -0.9203508, 1, 0, 0, 1, 1,
0.8599362, -0.6423853, 0.1066844, 1, 0, 0, 1, 1,
0.8639829, -1.160616, 2.631337, 1, 0, 0, 1, 1,
0.8649453, 0.0170326, 1.812421, 1, 0, 0, 1, 1,
0.8698365, 0.5121033, 0.8577425, 1, 0, 0, 1, 1,
0.8736297, -1.977, 1.832864, 0, 0, 0, 1, 1,
0.8825417, 2.501051, -0.06095714, 0, 0, 0, 1, 1,
0.8841023, -0.9597517, 2.857767, 0, 0, 0, 1, 1,
0.8852816, 1.21537, -1.064314, 0, 0, 0, 1, 1,
0.89363, -1.798015, 2.249033, 0, 0, 0, 1, 1,
0.9036113, 1.567532, -0.4327616, 0, 0, 0, 1, 1,
0.9143065, -1.367533, 2.499958, 0, 0, 0, 1, 1,
0.9154425, 0.7574248, 0.9138635, 1, 1, 1, 1, 1,
0.9157684, 1.751488, 1.695254, 1, 1, 1, 1, 1,
0.9228189, -0.4422776, 1.874164, 1, 1, 1, 1, 1,
0.9274448, 0.2693717, 1.337611, 1, 1, 1, 1, 1,
0.9300181, -0.5506449, 3.818835, 1, 1, 1, 1, 1,
0.9312648, 0.7459604, -1.295834, 1, 1, 1, 1, 1,
0.9343222, -1.542628, 2.896061, 1, 1, 1, 1, 1,
0.9356715, 0.9132653, 0.1126691, 1, 1, 1, 1, 1,
0.936152, 1.515477, -0.7923774, 1, 1, 1, 1, 1,
0.9411749, -0.7168563, 1.144111, 1, 1, 1, 1, 1,
0.9477767, 0.08693419, 1.869211, 1, 1, 1, 1, 1,
0.954395, 0.3055694, 2.157973, 1, 1, 1, 1, 1,
0.9688116, 0.4712692, -0.5210826, 1, 1, 1, 1, 1,
0.9760792, 0.4594499, 0.6520628, 1, 1, 1, 1, 1,
0.9796859, -0.9741473, 3.46442, 1, 1, 1, 1, 1,
0.9815241, 0.2139159, 0.03383429, 0, 0, 1, 1, 1,
0.9837726, 0.1225388, 0.5202613, 1, 0, 0, 1, 1,
0.9889295, 0.07028568, 1.29, 1, 0, 0, 1, 1,
0.989207, -1.477472, 2.463286, 1, 0, 0, 1, 1,
0.9902115, -1.341828, 2.586369, 1, 0, 0, 1, 1,
0.9926828, -0.6192963, 2.377982, 1, 0, 0, 1, 1,
1.008852, 0.02629527, 2.587872, 0, 0, 0, 1, 1,
1.014218, -0.3593775, 3.04113, 0, 0, 0, 1, 1,
1.014996, 0.3839977, -0.2113672, 0, 0, 0, 1, 1,
1.024682, 0.4835955, -0.7733302, 0, 0, 0, 1, 1,
1.025392, 0.6533862, 0.00693741, 0, 0, 0, 1, 1,
1.025505, 0.3583736, 2.896636, 0, 0, 0, 1, 1,
1.026746, 0.4173937, 2.41512, 0, 0, 0, 1, 1,
1.027973, -1.767457, 2.140991, 1, 1, 1, 1, 1,
1.030069, 0.8139098, 1.043513, 1, 1, 1, 1, 1,
1.030888, 1.103075, -0.04254487, 1, 1, 1, 1, 1,
1.034918, -1.351823, 3.697846, 1, 1, 1, 1, 1,
1.038775, -1.939522, 2.013721, 1, 1, 1, 1, 1,
1.039207, -0.4077279, 2.49869, 1, 1, 1, 1, 1,
1.041478, -0.3105426, 2.266886, 1, 1, 1, 1, 1,
1.043346, 0.5317374, 0.4644729, 1, 1, 1, 1, 1,
1.047355, 0.558448, 1.317735, 1, 1, 1, 1, 1,
1.051535, 0.5763168, 0.8394096, 1, 1, 1, 1, 1,
1.055058, 0.2646923, 1.166146, 1, 1, 1, 1, 1,
1.056512, 1.653403, -0.4373526, 1, 1, 1, 1, 1,
1.057445, -0.9212362, 4.696617, 1, 1, 1, 1, 1,
1.059633, -3.043395, 2.776339, 1, 1, 1, 1, 1,
1.06308, 1.524964, 1.044809, 1, 1, 1, 1, 1,
1.064746, -1.059947, 1.176373, 0, 0, 1, 1, 1,
1.069596, 0.0361304, 1.52058, 1, 0, 0, 1, 1,
1.073822, 0.0344574, 1.809601, 1, 0, 0, 1, 1,
1.075332, -0.3995199, 1.000044, 1, 0, 0, 1, 1,
1.076226, 1.330737, 0.9359021, 1, 0, 0, 1, 1,
1.081595, -0.4551587, 2.866307, 1, 0, 0, 1, 1,
1.08218, -1.177745, 3.257214, 0, 0, 0, 1, 1,
1.090138, 0.40643, 0.618152, 0, 0, 0, 1, 1,
1.098206, -0.4360261, 3.009812, 0, 0, 0, 1, 1,
1.099866, 1.031512, 0.6313425, 0, 0, 0, 1, 1,
1.122671, 0.9688651, 1.447515, 0, 0, 0, 1, 1,
1.12659, 1.442529, 0.08370917, 0, 0, 0, 1, 1,
1.134449, -0.7881289, 2.73887, 0, 0, 0, 1, 1,
1.142792, -0.3084486, 1.103191, 1, 1, 1, 1, 1,
1.152488, 0.5148553, 2.353157, 1, 1, 1, 1, 1,
1.156009, -0.1159949, 3.06369, 1, 1, 1, 1, 1,
1.156806, 0.880321, 2.228915, 1, 1, 1, 1, 1,
1.157795, -0.5146061, 2.708455, 1, 1, 1, 1, 1,
1.160646, -1.238735, 3.129283, 1, 1, 1, 1, 1,
1.161059, 1.974812, -0.3129703, 1, 1, 1, 1, 1,
1.164293, -0.09719667, 1.200117, 1, 1, 1, 1, 1,
1.164523, 0.9473887, 1.235727, 1, 1, 1, 1, 1,
1.166988, 0.7452585, 0.9562108, 1, 1, 1, 1, 1,
1.172084, 1.904497, 2.930458, 1, 1, 1, 1, 1,
1.179519, 0.7338845, 0.7968202, 1, 1, 1, 1, 1,
1.179869, -0.822543, 3.565723, 1, 1, 1, 1, 1,
1.190434, 0.8178475, 1.341677, 1, 1, 1, 1, 1,
1.193915, -0.7295862, 2.594337, 1, 1, 1, 1, 1,
1.203118, 0.9382129, 0.2622812, 0, 0, 1, 1, 1,
1.203182, -0.02832712, 2.325712, 1, 0, 0, 1, 1,
1.22044, 0.1180248, 3.497984, 1, 0, 0, 1, 1,
1.221538, 1.202479, 0.6114551, 1, 0, 0, 1, 1,
1.245226, -0.3487814, 3.211718, 1, 0, 0, 1, 1,
1.246321, 2.917267, -0.5377268, 1, 0, 0, 1, 1,
1.256169, -0.9019563, 1.109253, 0, 0, 0, 1, 1,
1.256751, -0.1391856, 3.574718, 0, 0, 0, 1, 1,
1.276004, 0.8788226, 0.4025232, 0, 0, 0, 1, 1,
1.291557, 0.7261213, 1.936664, 0, 0, 0, 1, 1,
1.29299, 0.5815279, 0.9688374, 0, 0, 0, 1, 1,
1.295448, 0.4043419, 0.1953219, 0, 0, 0, 1, 1,
1.304854, -0.7995109, 2.614739, 0, 0, 0, 1, 1,
1.307299, 2.240518, 0.06927456, 1, 1, 1, 1, 1,
1.315788, -0.7342498, 3.118813, 1, 1, 1, 1, 1,
1.317818, -0.01080893, 1.53743, 1, 1, 1, 1, 1,
1.322549, -0.588733, 1.815452, 1, 1, 1, 1, 1,
1.324419, -1.193741, 2.243752, 1, 1, 1, 1, 1,
1.338473, 1.142872, 1.724019, 1, 1, 1, 1, 1,
1.34245, 0.06201681, 0.3358938, 1, 1, 1, 1, 1,
1.343449, -0.1642921, 1.211016, 1, 1, 1, 1, 1,
1.343812, -2.399257, 2.334208, 1, 1, 1, 1, 1,
1.35675, 1.072414, 1.555324, 1, 1, 1, 1, 1,
1.377777, 1.008828, -0.4100689, 1, 1, 1, 1, 1,
1.379213, -0.1912243, -0.01715522, 1, 1, 1, 1, 1,
1.385989, 1.75321, 2.237879, 1, 1, 1, 1, 1,
1.386045, 0.364223, 0.07233677, 1, 1, 1, 1, 1,
1.392542, -0.2683033, -0.3305212, 1, 1, 1, 1, 1,
1.413196, 0.3009878, 1.162274, 0, 0, 1, 1, 1,
1.421067, -0.08313983, 1.96278, 1, 0, 0, 1, 1,
1.429469, 0.02342681, 1.687526, 1, 0, 0, 1, 1,
1.43337, -0.06098919, 3.246767, 1, 0, 0, 1, 1,
1.441106, -1.166875, 4.698731, 1, 0, 0, 1, 1,
1.444619, -0.2081782, 2.878946, 1, 0, 0, 1, 1,
1.44549, -0.2829238, 1.962699, 0, 0, 0, 1, 1,
1.449015, 0.9631724, -0.2983235, 0, 0, 0, 1, 1,
1.450791, 1.155849, 1.54656, 0, 0, 0, 1, 1,
1.459869, 0.3560503, 1.602222, 0, 0, 0, 1, 1,
1.463645, -0.4108593, 1.163812, 0, 0, 0, 1, 1,
1.466114, -1.5898, 3.251359, 0, 0, 0, 1, 1,
1.472374, -0.02058803, 1.727745, 0, 0, 0, 1, 1,
1.475069, -0.07282999, 1.380098, 1, 1, 1, 1, 1,
1.491874, 0.716627, 1.549128, 1, 1, 1, 1, 1,
1.499513, 0.2684515, 2.872025, 1, 1, 1, 1, 1,
1.513418, -0.742788, 0.02610387, 1, 1, 1, 1, 1,
1.513471, -1.154881, 2.529172, 1, 1, 1, 1, 1,
1.535305, -0.1753799, 3.274155, 1, 1, 1, 1, 1,
1.54002, 1.151665, 2.661972, 1, 1, 1, 1, 1,
1.541918, -0.02744574, 1.713444, 1, 1, 1, 1, 1,
1.542789, -0.3244995, 1.469432, 1, 1, 1, 1, 1,
1.556369, 0.2694657, 1.666216, 1, 1, 1, 1, 1,
1.557945, 0.371277, 1.616497, 1, 1, 1, 1, 1,
1.574908, 1.008371, 1.227366, 1, 1, 1, 1, 1,
1.587347, -0.8133564, 1.844311, 1, 1, 1, 1, 1,
1.598297, -1.19039, 2.531188, 1, 1, 1, 1, 1,
1.60228, -0.9528726, 2.663423, 1, 1, 1, 1, 1,
1.604542, -0.1303824, 1.237858, 0, 0, 1, 1, 1,
1.60595, -0.2707577, -0.8911735, 1, 0, 0, 1, 1,
1.612934, 0.9585728, -0.1798368, 1, 0, 0, 1, 1,
1.617695, -0.6919174, 1.215023, 1, 0, 0, 1, 1,
1.622721, -0.2238309, 3.666459, 1, 0, 0, 1, 1,
1.627007, -0.6083299, 1.816264, 1, 0, 0, 1, 1,
1.630999, 0.7914632, 2.470747, 0, 0, 0, 1, 1,
1.657313, 0.3798065, 3.245704, 0, 0, 0, 1, 1,
1.683697, 1.22685, 2.165892, 0, 0, 0, 1, 1,
1.697333, -0.676733, 2.018317, 0, 0, 0, 1, 1,
1.704813, 0.2958557, 0.5841551, 0, 0, 0, 1, 1,
1.705237, 0.6456731, 2.600496, 0, 0, 0, 1, 1,
1.727198, -0.8043138, 2.863358, 0, 0, 0, 1, 1,
1.740449, -0.1741679, 1.251394, 1, 1, 1, 1, 1,
1.769193, 0.03460736, 1.195144, 1, 1, 1, 1, 1,
1.773596, 3.076241, 1.284429, 1, 1, 1, 1, 1,
1.775571, -1.719396, 3.175108, 1, 1, 1, 1, 1,
1.778688, -1.170185, 3.537768, 1, 1, 1, 1, 1,
1.809404, -0.8214817, 3.009644, 1, 1, 1, 1, 1,
1.815796, 1.224131, -1.142306, 1, 1, 1, 1, 1,
1.826441, 0.06680712, 0.8636749, 1, 1, 1, 1, 1,
1.859269, 1.220582, 0.6636587, 1, 1, 1, 1, 1,
1.860442, -0.8409823, 0.4559328, 1, 1, 1, 1, 1,
1.860711, -2.162699, 1.521546, 1, 1, 1, 1, 1,
1.882792, 0.3085382, 0.9317436, 1, 1, 1, 1, 1,
1.89449, -0.5740244, 0.3868575, 1, 1, 1, 1, 1,
1.900218, -0.2870052, 2.155587, 1, 1, 1, 1, 1,
1.928178, -0.7098076, 1.30458, 1, 1, 1, 1, 1,
1.935461, 1.161006, 0.7375155, 0, 0, 1, 1, 1,
1.949029, 0.1950055, 2.746878, 1, 0, 0, 1, 1,
2.067115, 1.084973, -0.1914792, 1, 0, 0, 1, 1,
2.112624, 0.4376743, 2.044619, 1, 0, 0, 1, 1,
2.120233, -2.67332, 1.585148, 1, 0, 0, 1, 1,
2.148432, -0.9164343, 1.686453, 1, 0, 0, 1, 1,
2.186615, 1.066236, 0.3228749, 0, 0, 0, 1, 1,
2.217886, -1.574174, 1.011141, 0, 0, 0, 1, 1,
2.2554, 0.9089251, 0.6769906, 0, 0, 0, 1, 1,
2.287836, -1.114413, 2.100785, 0, 0, 0, 1, 1,
2.318302, 0.4120895, -1.019868, 0, 0, 0, 1, 1,
2.364157, 0.3374758, 1.700049, 0, 0, 0, 1, 1,
2.413898, 1.624944, 2.071282, 0, 0, 0, 1, 1,
2.469283, -0.6724076, 2.060249, 1, 1, 1, 1, 1,
2.476314, -0.3037094, 1.585427, 1, 1, 1, 1, 1,
2.540089, -0.3778246, 1.207701, 1, 1, 1, 1, 1,
2.662561, -1.958496, -0.3229572, 1, 1, 1, 1, 1,
2.809609, 0.7898345, 1.013042, 1, 1, 1, 1, 1,
2.827546, 0.6142762, 0.6401395, 1, 1, 1, 1, 1,
3.177077, 0.3639125, 1.626502, 1, 1, 1, 1, 1
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
var radius = 9.389985;
var distance = 32.98193;
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
mvMatrix.translate( 0.09178877, -0.4441416, 0.1375966 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.98193);
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
