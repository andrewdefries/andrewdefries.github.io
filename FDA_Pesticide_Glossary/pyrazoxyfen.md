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
-3.428646, -0.6286125, -0.6677958, 1, 0, 0, 1,
-2.926606, 0.459517, -2.578408, 1, 0.007843138, 0, 1,
-2.719209, -0.8391486, -1.201985, 1, 0.01176471, 0, 1,
-2.642993, 0.5262269, -2.483475, 1, 0.01960784, 0, 1,
-2.549183, -0.3299839, -1.099303, 1, 0.02352941, 0, 1,
-2.523883, 2.067968, -0.1935799, 1, 0.03137255, 0, 1,
-2.448115, -1.030143, -1.921602, 1, 0.03529412, 0, 1,
-2.430436, 0.6123605, -2.501484, 1, 0.04313726, 0, 1,
-2.287027, 0.5168777, -0.6128604, 1, 0.04705882, 0, 1,
-2.265737, -0.3400439, -1.231572, 1, 0.05490196, 0, 1,
-2.250374, -0.7598896, 0.1196012, 1, 0.05882353, 0, 1,
-2.199106, -0.3738531, -3.458326, 1, 0.06666667, 0, 1,
-2.184929, 1.118747, -1.004576, 1, 0.07058824, 0, 1,
-2.1507, -0.4732725, -1.179607, 1, 0.07843138, 0, 1,
-2.120884, 1.122192, -0.880091, 1, 0.08235294, 0, 1,
-2.111981, -0.5165977, -0.005611273, 1, 0.09019608, 0, 1,
-2.106045, -0.2779441, -0.8188235, 1, 0.09411765, 0, 1,
-2.089789, 0.9752485, -1.310289, 1, 0.1019608, 0, 1,
-2.033815, 0.5844547, -1.14369, 1, 0.1098039, 0, 1,
-1.999769, -1.80257, -5.11548, 1, 0.1137255, 0, 1,
-1.975151, 1.825125, -1.059833, 1, 0.1215686, 0, 1,
-1.962507, 1.115712, -2.126803, 1, 0.1254902, 0, 1,
-1.957476, -0.4939774, 0.04925164, 1, 0.1333333, 0, 1,
-1.931859, 0.1071212, -0.6022717, 1, 0.1372549, 0, 1,
-1.930788, -0.4818854, -0.4153214, 1, 0.145098, 0, 1,
-1.920669, -1.046346, -1.951119, 1, 0.1490196, 0, 1,
-1.920437, -0.1827062, -1.793693, 1, 0.1568628, 0, 1,
-1.915683, 0.6062924, -1.057363, 1, 0.1607843, 0, 1,
-1.895991, 0.7207851, -0.9885343, 1, 0.1686275, 0, 1,
-1.885166, 0.2618853, -1.948015, 1, 0.172549, 0, 1,
-1.870694, -1.481518, -3.680171, 1, 0.1803922, 0, 1,
-1.819188, 1.607932, 0.5222124, 1, 0.1843137, 0, 1,
-1.795072, -0.01835894, -3.299569, 1, 0.1921569, 0, 1,
-1.794332, -0.3542724, -0.9879614, 1, 0.1960784, 0, 1,
-1.791992, -1.676518, -3.155327, 1, 0.2039216, 0, 1,
-1.768772, -0.04920914, -3.320444, 1, 0.2117647, 0, 1,
-1.756626, 0.549059, -2.282302, 1, 0.2156863, 0, 1,
-1.756011, -0.5378737, -0.6703446, 1, 0.2235294, 0, 1,
-1.75218, -1.369935, -1.437535, 1, 0.227451, 0, 1,
-1.743406, -2.721472, -4.090807, 1, 0.2352941, 0, 1,
-1.738114, -1.005411, -3.086793, 1, 0.2392157, 0, 1,
-1.726954, 0.8537266, -1.392229, 1, 0.2470588, 0, 1,
-1.703432, -0.4432328, -3.333905, 1, 0.2509804, 0, 1,
-1.695239, -3.002175, -3.472244, 1, 0.2588235, 0, 1,
-1.689201, -1.283334, -3.541183, 1, 0.2627451, 0, 1,
-1.665127, -0.3878802, -1.257442, 1, 0.2705882, 0, 1,
-1.659696, -0.617353, -3.460996, 1, 0.2745098, 0, 1,
-1.647907, 1.499592, -1.225991, 1, 0.282353, 0, 1,
-1.637834, 0.3235008, -0.6326077, 1, 0.2862745, 0, 1,
-1.636061, 1.452647, -1.347656, 1, 0.2941177, 0, 1,
-1.631011, 0.3807456, -1.233575, 1, 0.3019608, 0, 1,
-1.616698, 0.1851594, -1.166684, 1, 0.3058824, 0, 1,
-1.581887, -0.7378204, -1.214783, 1, 0.3137255, 0, 1,
-1.576291, 0.8834783, -1.526151, 1, 0.3176471, 0, 1,
-1.575952, 1.070037, 0.3103074, 1, 0.3254902, 0, 1,
-1.553929, 1.293332, -0.3914634, 1, 0.3294118, 0, 1,
-1.551052, -0.3198955, -3.924602, 1, 0.3372549, 0, 1,
-1.518535, -0.577134, -1.912289, 1, 0.3411765, 0, 1,
-1.512937, -1.266244, -1.221421, 1, 0.3490196, 0, 1,
-1.505975, -0.09907053, -0.6520966, 1, 0.3529412, 0, 1,
-1.499564, 1.658713, 0.687434, 1, 0.3607843, 0, 1,
-1.494444, -1.13083, 0.1894925, 1, 0.3647059, 0, 1,
-1.491087, 0.7865708, -0.1355044, 1, 0.372549, 0, 1,
-1.482018, -0.9227933, -3.505522, 1, 0.3764706, 0, 1,
-1.467888, 0.1073927, -2.683048, 1, 0.3843137, 0, 1,
-1.45783, -0.6563582, -0.6297375, 1, 0.3882353, 0, 1,
-1.449448, 0.376168, -1.70541, 1, 0.3960784, 0, 1,
-1.447872, 0.9537776, -1.298431, 1, 0.4039216, 0, 1,
-1.441141, 1.284288, -0.1186268, 1, 0.4078431, 0, 1,
-1.440917, 0.4242244, -0.3070349, 1, 0.4156863, 0, 1,
-1.431396, -0.4923896, -4.292974, 1, 0.4196078, 0, 1,
-1.421492, 0.9413936, -1.878508, 1, 0.427451, 0, 1,
-1.42137, -0.1475866, -0.08885794, 1, 0.4313726, 0, 1,
-1.414706, 0.3336096, 0.02527913, 1, 0.4392157, 0, 1,
-1.409662, -1.020798, -1.252423, 1, 0.4431373, 0, 1,
-1.392934, 0.02303308, -1.398776, 1, 0.4509804, 0, 1,
-1.391001, -0.1553227, -2.493297, 1, 0.454902, 0, 1,
-1.363669, -0.7111495, -1.62283, 1, 0.4627451, 0, 1,
-1.356095, 0.5642965, -1.083779, 1, 0.4666667, 0, 1,
-1.352818, -1.24399, -3.704854, 1, 0.4745098, 0, 1,
-1.350019, -0.1201685, -0.7087311, 1, 0.4784314, 0, 1,
-1.349841, 2.052245, -2.09434, 1, 0.4862745, 0, 1,
-1.346804, 1.844579, -1.912002, 1, 0.4901961, 0, 1,
-1.337, 1.998912, 0.6058932, 1, 0.4980392, 0, 1,
-1.335392, 0.8845384, -0.1565432, 1, 0.5058824, 0, 1,
-1.330048, -0.02834472, -1.568646, 1, 0.509804, 0, 1,
-1.324021, -0.1514041, -2.109939, 1, 0.5176471, 0, 1,
-1.316902, -1.191109, -3.883179, 1, 0.5215687, 0, 1,
-1.315828, 0.2220082, -1.488458, 1, 0.5294118, 0, 1,
-1.313544, 0.08249658, -1.696358, 1, 0.5333334, 0, 1,
-1.310677, -0.6945917, -0.2806693, 1, 0.5411765, 0, 1,
-1.306498, -0.2894637, -0.3339138, 1, 0.5450981, 0, 1,
-1.301585, 1.242666, -2.543337, 1, 0.5529412, 0, 1,
-1.285748, -1.636625, -2.347564, 1, 0.5568628, 0, 1,
-1.277439, 1.296044, -0.2851403, 1, 0.5647059, 0, 1,
-1.274243, -0.6652441, -1.153853, 1, 0.5686275, 0, 1,
-1.265252, 0.3858077, -1.304153, 1, 0.5764706, 0, 1,
-1.25379, 0.472043, -2.328331, 1, 0.5803922, 0, 1,
-1.251023, 0.3361824, -1.167235, 1, 0.5882353, 0, 1,
-1.246694, 0.1079484, -1.559222, 1, 0.5921569, 0, 1,
-1.244055, 0.8821489, -2.463365, 1, 0.6, 0, 1,
-1.236853, 0.1585226, -0.9226885, 1, 0.6078432, 0, 1,
-1.229989, -0.624594, -0.5017322, 1, 0.6117647, 0, 1,
-1.228029, 0.4525418, -2.175973, 1, 0.6196079, 0, 1,
-1.207226, -0.250827, -1.261728, 1, 0.6235294, 0, 1,
-1.202877, 0.3778638, -0.2905837, 1, 0.6313726, 0, 1,
-1.193985, -0.8751595, -2.906979, 1, 0.6352941, 0, 1,
-1.189459, 0.02614817, -1.740919, 1, 0.6431373, 0, 1,
-1.185927, 0.551253, -0.9358302, 1, 0.6470588, 0, 1,
-1.180023, -1.349448, -3.149592, 1, 0.654902, 0, 1,
-1.171452, -0.718642, -0.2774005, 1, 0.6588235, 0, 1,
-1.169709, 0.7889231, -1.035074, 1, 0.6666667, 0, 1,
-1.166168, -0.1195604, -1.788509, 1, 0.6705883, 0, 1,
-1.16002, 0.4521931, -0.6231458, 1, 0.6784314, 0, 1,
-1.158066, 0.7531796, -0.1300767, 1, 0.682353, 0, 1,
-1.157002, -0.6350149, -1.983963, 1, 0.6901961, 0, 1,
-1.156731, -0.8562157, -1.048445, 1, 0.6941177, 0, 1,
-1.148268, -0.2171824, -0.4610811, 1, 0.7019608, 0, 1,
-1.143768, 0.5450471, -1.417952, 1, 0.7098039, 0, 1,
-1.142845, 0.4818111, -1.941538, 1, 0.7137255, 0, 1,
-1.136622, -0.5196484, -5.172834, 1, 0.7215686, 0, 1,
-1.134962, 1.09215, -0.5613124, 1, 0.7254902, 0, 1,
-1.133432, -0.7972425, -3.038295, 1, 0.7333333, 0, 1,
-1.126706, 0.4195447, -2.016889, 1, 0.7372549, 0, 1,
-1.118902, -0.586753, -0.8436549, 1, 0.7450981, 0, 1,
-1.117107, -0.8380781, -1.098626, 1, 0.7490196, 0, 1,
-1.116525, -0.1481315, -1.194634, 1, 0.7568628, 0, 1,
-1.109164, -0.7122443, -1.95262, 1, 0.7607843, 0, 1,
-1.107749, 0.4775856, -0.9681934, 1, 0.7686275, 0, 1,
-1.10294, 0.05350558, -0.1631495, 1, 0.772549, 0, 1,
-1.100856, -0.003195861, -1.864733, 1, 0.7803922, 0, 1,
-1.095557, 0.8946316, -2.983496, 1, 0.7843137, 0, 1,
-1.080583, -0.9978908, -2.223462, 1, 0.7921569, 0, 1,
-1.0776, -1.128095, -1.458734, 1, 0.7960784, 0, 1,
-1.07559, -0.1998718, -0.6448489, 1, 0.8039216, 0, 1,
-1.073992, 1.736245, -1.331154, 1, 0.8117647, 0, 1,
-1.054743, -0.8682804, -1.810892, 1, 0.8156863, 0, 1,
-1.052812, 0.4219806, -1.057272, 1, 0.8235294, 0, 1,
-1.046776, 1.285735, -0.003329, 1, 0.827451, 0, 1,
-1.044281, 0.3426833, -2.304308, 1, 0.8352941, 0, 1,
-1.042393, 0.7356412, -0.5581776, 1, 0.8392157, 0, 1,
-1.040417, -0.2421753, -3.551539, 1, 0.8470588, 0, 1,
-1.034602, -0.2815067, -1.637714, 1, 0.8509804, 0, 1,
-1.01669, -1.310995, -1.953315, 1, 0.8588235, 0, 1,
-1.011916, -0.06346795, -1.944093, 1, 0.8627451, 0, 1,
-1.009885, 1.501171, -2.052626, 1, 0.8705882, 0, 1,
-1.004021, 1.028993, -1.810141, 1, 0.8745098, 0, 1,
-0.9967616, -0.09129064, -0.4529291, 1, 0.8823529, 0, 1,
-0.9956558, 1.541699, 1.818476, 1, 0.8862745, 0, 1,
-0.991178, -0.4075652, -0.2945957, 1, 0.8941177, 0, 1,
-0.9896311, 0.367658, -0.6954501, 1, 0.8980392, 0, 1,
-0.9891484, 0.6410578, -1.116589, 1, 0.9058824, 0, 1,
-0.9862278, 0.2693197, -0.9477816, 1, 0.9137255, 0, 1,
-0.982349, -2.245724, -1.977754, 1, 0.9176471, 0, 1,
-0.9780774, -0.2681645, -2.189575, 1, 0.9254902, 0, 1,
-0.9762646, -0.7561653, -0.9739335, 1, 0.9294118, 0, 1,
-0.9737816, 1.263956, 0.06396481, 1, 0.9372549, 0, 1,
-0.968565, -0.1168331, -0.321155, 1, 0.9411765, 0, 1,
-0.9666005, -1.382745, -2.28202, 1, 0.9490196, 0, 1,
-0.9612007, 0.2121824, -3.343751, 1, 0.9529412, 0, 1,
-0.9599027, -0.115844, -2.785745, 1, 0.9607843, 0, 1,
-0.9587597, -1.186512, -0.6725032, 1, 0.9647059, 0, 1,
-0.9576371, 0.4178877, -0.7866495, 1, 0.972549, 0, 1,
-0.9540839, -0.2575333, -2.049762, 1, 0.9764706, 0, 1,
-0.9519731, -0.8382041, -1.29978, 1, 0.9843137, 0, 1,
-0.9510679, -0.4226924, -1.831172, 1, 0.9882353, 0, 1,
-0.9493769, 0.2534144, -2.519038, 1, 0.9960784, 0, 1,
-0.949118, -0.5878607, -2.453593, 0.9960784, 1, 0, 1,
-0.9479131, -1.112065, -1.062788, 0.9921569, 1, 0, 1,
-0.9448617, -1.340259, -1.147882, 0.9843137, 1, 0, 1,
-0.9441038, 0.09692407, -1.361965, 0.9803922, 1, 0, 1,
-0.9439678, 2.499952, -0.3841028, 0.972549, 1, 0, 1,
-0.942853, -1.412462, -2.67886, 0.9686275, 1, 0, 1,
-0.9422305, -0.4862045, -1.722116, 0.9607843, 1, 0, 1,
-0.9413831, 1.162811, 0.8302382, 0.9568627, 1, 0, 1,
-0.9255456, 0.1963461, -0.1032888, 0.9490196, 1, 0, 1,
-0.9252525, 0.05260679, -1.418431, 0.945098, 1, 0, 1,
-0.9230257, -0.4051366, -2.459138, 0.9372549, 1, 0, 1,
-0.9208987, 1.872223, -1.219959, 0.9333333, 1, 0, 1,
-0.9199822, 0.2445726, -1.391505, 0.9254902, 1, 0, 1,
-0.9174805, -0.4086671, -2.83651, 0.9215686, 1, 0, 1,
-0.914074, 0.8709471, -0.5658434, 0.9137255, 1, 0, 1,
-0.9035668, -0.9109557, -1.163466, 0.9098039, 1, 0, 1,
-0.9030342, 0.2434869, -1.508769, 0.9019608, 1, 0, 1,
-0.8891088, 0.282607, -3.35223, 0.8941177, 1, 0, 1,
-0.8881844, 1.205722, -2.08142, 0.8901961, 1, 0, 1,
-0.8861044, 0.4312893, -3.680735, 0.8823529, 1, 0, 1,
-0.8857205, 0.4041232, -0.5553414, 0.8784314, 1, 0, 1,
-0.8838812, -0.3136653, -0.6055749, 0.8705882, 1, 0, 1,
-0.8828404, 0.5142067, 0.007550893, 0.8666667, 1, 0, 1,
-0.88147, 0.8578038, 0.3550162, 0.8588235, 1, 0, 1,
-0.8804141, -1.470665, -1.660218, 0.854902, 1, 0, 1,
-0.8759926, -1.115482, -4.560953, 0.8470588, 1, 0, 1,
-0.8731889, 1.684127, -0.04071315, 0.8431373, 1, 0, 1,
-0.8706822, 2.241746, -1.005543, 0.8352941, 1, 0, 1,
-0.8540542, 1.217998, 0.09719031, 0.8313726, 1, 0, 1,
-0.8522761, -0.3875761, -1.26671, 0.8235294, 1, 0, 1,
-0.851709, -0.9276922, -1.443474, 0.8196079, 1, 0, 1,
-0.8495702, 0.3600007, -0.6886121, 0.8117647, 1, 0, 1,
-0.8397172, 0.213633, -0.2385545, 0.8078431, 1, 0, 1,
-0.8337111, 0.3033004, -0.4042765, 0.8, 1, 0, 1,
-0.8313766, 1.977591, -0.4593768, 0.7921569, 1, 0, 1,
-0.8295063, 0.2743472, -2.969714, 0.7882353, 1, 0, 1,
-0.8251768, -1.556374, -3.368808, 0.7803922, 1, 0, 1,
-0.8242536, -0.2495524, -3.128254, 0.7764706, 1, 0, 1,
-0.822794, 0.6447173, -1.665045, 0.7686275, 1, 0, 1,
-0.819878, 0.3018134, 0.9484596, 0.7647059, 1, 0, 1,
-0.8184811, 1.073619, -0.4487972, 0.7568628, 1, 0, 1,
-0.8170189, -1.336457, -1.546686, 0.7529412, 1, 0, 1,
-0.8150598, -0.2155305, -2.296587, 0.7450981, 1, 0, 1,
-0.8131154, 0.6614617, -0.5404914, 0.7411765, 1, 0, 1,
-0.8130845, -0.5668652, -0.9660661, 0.7333333, 1, 0, 1,
-0.8118324, 0.01915247, -1.872145, 0.7294118, 1, 0, 1,
-0.8070952, 0.902095, -0.07735579, 0.7215686, 1, 0, 1,
-0.7962385, 0.4740042, -0.5052077, 0.7176471, 1, 0, 1,
-0.795906, -0.5706161, -1.5756, 0.7098039, 1, 0, 1,
-0.7889768, -0.2664026, -2.500397, 0.7058824, 1, 0, 1,
-0.7835464, 0.9498948, -0.09428268, 0.6980392, 1, 0, 1,
-0.7763622, 1.050749, -0.7922953, 0.6901961, 1, 0, 1,
-0.774948, 0.6517811, 1.55524, 0.6862745, 1, 0, 1,
-0.7747268, 0.1872384, -2.719707, 0.6784314, 1, 0, 1,
-0.7687377, -0.2824331, -1.038063, 0.6745098, 1, 0, 1,
-0.7618864, 1.203923, -1.683437, 0.6666667, 1, 0, 1,
-0.7599815, -0.2376921, -3.114682, 0.6627451, 1, 0, 1,
-0.753554, 0.4732122, -0.4355243, 0.654902, 1, 0, 1,
-0.751963, 0.2471273, 0.3221558, 0.6509804, 1, 0, 1,
-0.7514811, 0.4817546, -1.774764, 0.6431373, 1, 0, 1,
-0.7429267, -0.6192859, -2.43821, 0.6392157, 1, 0, 1,
-0.7337744, 0.2447127, -1.112082, 0.6313726, 1, 0, 1,
-0.7322958, -2.431903, -4.983807, 0.627451, 1, 0, 1,
-0.7284272, -0.6489831, -1.700461, 0.6196079, 1, 0, 1,
-0.7282043, -0.947147, -2.311371, 0.6156863, 1, 0, 1,
-0.7224981, 0.3217765, -1.248736, 0.6078432, 1, 0, 1,
-0.7218798, -0.4963864, -4.405606, 0.6039216, 1, 0, 1,
-0.7204199, -1.547198, -1.449989, 0.5960785, 1, 0, 1,
-0.7150658, 0.01650839, 0.5235296, 0.5882353, 1, 0, 1,
-0.710917, -0.2848715, -1.903156, 0.5843138, 1, 0, 1,
-0.7102997, 0.1366119, -0.5676835, 0.5764706, 1, 0, 1,
-0.7033767, 1.315518, -1.989259, 0.572549, 1, 0, 1,
-0.6995981, -0.9437193, -2.454427, 0.5647059, 1, 0, 1,
-0.6922145, -0.5789772, -1.656062, 0.5607843, 1, 0, 1,
-0.6921943, -0.1870758, -2.688153, 0.5529412, 1, 0, 1,
-0.6910556, -1.641882, -2.781548, 0.5490196, 1, 0, 1,
-0.6880403, 0.2464945, -1.997379, 0.5411765, 1, 0, 1,
-0.6855688, -1.83437, -1.812127, 0.5372549, 1, 0, 1,
-0.6837789, -2.104609, -1.939742, 0.5294118, 1, 0, 1,
-0.68229, 0.3198786, -1.169666, 0.5254902, 1, 0, 1,
-0.6811715, 0.2861813, -1.05242, 0.5176471, 1, 0, 1,
-0.6780762, -0.8669394, -1.561569, 0.5137255, 1, 0, 1,
-0.6738346, -1.792691, -1.117739, 0.5058824, 1, 0, 1,
-0.6676729, -0.7143321, -2.48476, 0.5019608, 1, 0, 1,
-0.6673127, 2.15147, 1.807568, 0.4941176, 1, 0, 1,
-0.6662911, 1.427423, -1.544327, 0.4862745, 1, 0, 1,
-0.6642109, 0.5690393, -0.8031152, 0.4823529, 1, 0, 1,
-0.6553228, 1.559242, 0.794449, 0.4745098, 1, 0, 1,
-0.6429665, 1.218359, -0.2159808, 0.4705882, 1, 0, 1,
-0.6388888, 1.531351, -0.3001656, 0.4627451, 1, 0, 1,
-0.6376783, 0.5766872, -0.6664404, 0.4588235, 1, 0, 1,
-0.6354648, 0.9896516, -0.7223333, 0.4509804, 1, 0, 1,
-0.6324946, 1.232557, -1.294777, 0.4470588, 1, 0, 1,
-0.6297607, -0.8271345, -3.215419, 0.4392157, 1, 0, 1,
-0.6278304, 0.3554006, -1.330871, 0.4352941, 1, 0, 1,
-0.6212084, 2.093411, 0.08499423, 0.427451, 1, 0, 1,
-0.6203051, -1.173118, -3.635254, 0.4235294, 1, 0, 1,
-0.6161069, 0.064968, -1.329582, 0.4156863, 1, 0, 1,
-0.613773, 0.4411961, 0.3842497, 0.4117647, 1, 0, 1,
-0.6125283, 0.01467748, -2.029329, 0.4039216, 1, 0, 1,
-0.6072966, -1.128226, -2.6485, 0.3960784, 1, 0, 1,
-0.6010921, 1.029796, -0.3884895, 0.3921569, 1, 0, 1,
-0.5988314, -0.9760371, -3.261982, 0.3843137, 1, 0, 1,
-0.595732, 0.4206023, -2.452307, 0.3803922, 1, 0, 1,
-0.5955067, 0.7298828, -1.958977, 0.372549, 1, 0, 1,
-0.5891744, -0.392974, -1.563278, 0.3686275, 1, 0, 1,
-0.5886681, 0.03416064, -1.684731, 0.3607843, 1, 0, 1,
-0.5851681, 0.7055819, -0.2750182, 0.3568628, 1, 0, 1,
-0.5850354, 1.259021, 1.966005, 0.3490196, 1, 0, 1,
-0.5841227, 0.350918, -0.330674, 0.345098, 1, 0, 1,
-0.5818868, 0.3283785, -0.006614427, 0.3372549, 1, 0, 1,
-0.5815438, 1.22726, -1.161077, 0.3333333, 1, 0, 1,
-0.5775062, 0.5859906, -1.021832, 0.3254902, 1, 0, 1,
-0.5769574, 0.03799679, -1.128045, 0.3215686, 1, 0, 1,
-0.5657371, 0.5055471, 0.2860844, 0.3137255, 1, 0, 1,
-0.5653997, -0.8013788, -3.271379, 0.3098039, 1, 0, 1,
-0.5643269, -0.4541874, -2.095245, 0.3019608, 1, 0, 1,
-0.5641366, -0.716486, -2.442513, 0.2941177, 1, 0, 1,
-0.557872, 0.7103704, -0.1851725, 0.2901961, 1, 0, 1,
-0.5575202, 0.345588, -0.5302757, 0.282353, 1, 0, 1,
-0.556887, -2.775663, -2.58374, 0.2784314, 1, 0, 1,
-0.5513963, 1.126474, -1.019922, 0.2705882, 1, 0, 1,
-0.5513935, 0.005908376, -0.6733716, 0.2666667, 1, 0, 1,
-0.5478983, -2.002326, -3.069946, 0.2588235, 1, 0, 1,
-0.5474324, -0.6659064, -1.827792, 0.254902, 1, 0, 1,
-0.5439715, 0.4151273, -0.4567832, 0.2470588, 1, 0, 1,
-0.5407643, 0.07385089, -1.929399, 0.2431373, 1, 0, 1,
-0.53929, 0.5825049, -0.4513185, 0.2352941, 1, 0, 1,
-0.537543, -0.7964575, -2.05094, 0.2313726, 1, 0, 1,
-0.5344905, -0.5816738, -2.108019, 0.2235294, 1, 0, 1,
-0.5336311, 1.10385, -0.4675712, 0.2196078, 1, 0, 1,
-0.5230579, 1.111845, -0.25625, 0.2117647, 1, 0, 1,
-0.5207296, 0.3835666, -3.249637, 0.2078431, 1, 0, 1,
-0.5129699, 0.5186166, -1.37016, 0.2, 1, 0, 1,
-0.505365, 1.130422, -1.351722, 0.1921569, 1, 0, 1,
-0.5046695, 0.2502334, -1.230435, 0.1882353, 1, 0, 1,
-0.4976575, 0.8206856, 0.5737843, 0.1803922, 1, 0, 1,
-0.4970828, 1.717749, 1.525678, 0.1764706, 1, 0, 1,
-0.4877086, 0.1966549, -0.9864435, 0.1686275, 1, 0, 1,
-0.4838076, -0.7151778, -1.918521, 0.1647059, 1, 0, 1,
-0.4828899, -0.308238, -2.0291, 0.1568628, 1, 0, 1,
-0.4785039, -1.056831, -3.315435, 0.1529412, 1, 0, 1,
-0.4766115, -0.04838869, -0.9440646, 0.145098, 1, 0, 1,
-0.476556, 1.915878, -0.850166, 0.1411765, 1, 0, 1,
-0.4700157, -0.1906597, -0.8345124, 0.1333333, 1, 0, 1,
-0.469649, -1.287334, -3.617818, 0.1294118, 1, 0, 1,
-0.4616451, -0.6799107, -2.845825, 0.1215686, 1, 0, 1,
-0.4555387, 0.1232577, -0.9235734, 0.1176471, 1, 0, 1,
-0.4519602, 1.532977, 1.197318, 0.1098039, 1, 0, 1,
-0.4513019, 0.9833403, -0.4661095, 0.1058824, 1, 0, 1,
-0.4484518, 1.399572, 0.2586718, 0.09803922, 1, 0, 1,
-0.4441499, -0.5379311, -0.8036135, 0.09019608, 1, 0, 1,
-0.4427179, -0.1464152, -0.3501414, 0.08627451, 1, 0, 1,
-0.4407628, 0.007418096, -2.255213, 0.07843138, 1, 0, 1,
-0.4403526, -0.1856861, -0.8374661, 0.07450981, 1, 0, 1,
-0.4398952, 2.173523, 0.8914489, 0.06666667, 1, 0, 1,
-0.4395839, -0.5322568, -1.864796, 0.0627451, 1, 0, 1,
-0.4394364, 1.254175, 0.6428373, 0.05490196, 1, 0, 1,
-0.4391177, -1.418561, -2.751825, 0.05098039, 1, 0, 1,
-0.4371459, -0.3697889, -1.844954, 0.04313726, 1, 0, 1,
-0.4352044, -0.8401713, -2.856094, 0.03921569, 1, 0, 1,
-0.4331961, -0.837869, -3.287295, 0.03137255, 1, 0, 1,
-0.432355, -0.3803603, -3.130614, 0.02745098, 1, 0, 1,
-0.4318218, 0.1568056, -2.082143, 0.01960784, 1, 0, 1,
-0.4308792, -1.262411, -3.062481, 0.01568628, 1, 0, 1,
-0.4297957, 2.527837, 0.1575115, 0.007843138, 1, 0, 1,
-0.4276862, -0.2276193, -2.758432, 0.003921569, 1, 0, 1,
-0.4265821, -2.51333, -3.604805, 0, 1, 0.003921569, 1,
-0.4262848, -0.2486519, -3.99039, 0, 1, 0.01176471, 1,
-0.4253159, 1.116413, -1.214213, 0, 1, 0.01568628, 1,
-0.421008, 0.2020544, 0.2909557, 0, 1, 0.02352941, 1,
-0.4206838, -0.9291775, -1.914993, 0, 1, 0.02745098, 1,
-0.4179433, 0.003169817, -1.396569, 0, 1, 0.03529412, 1,
-0.4177597, 0.9391673, -2.501822, 0, 1, 0.03921569, 1,
-0.4164547, -0.5701717, -3.224744, 0, 1, 0.04705882, 1,
-0.4159748, 2.614271, -0.1176463, 0, 1, 0.05098039, 1,
-0.414734, -0.601109, -3.288061, 0, 1, 0.05882353, 1,
-0.4115921, -0.1140467, -2.109718, 0, 1, 0.0627451, 1,
-0.4079077, -0.2269403, -1.400631, 0, 1, 0.07058824, 1,
-0.4072053, 0.4123857, 0.8426238, 0, 1, 0.07450981, 1,
-0.4051918, -1.858208, -1.745098, 0, 1, 0.08235294, 1,
-0.3962291, -1.1805, -2.466011, 0, 1, 0.08627451, 1,
-0.3960505, 1.055835, 0.6856155, 0, 1, 0.09411765, 1,
-0.3924277, 0.2364722, -2.104573, 0, 1, 0.1019608, 1,
-0.3923492, -1.741787, -1.384379, 0, 1, 0.1058824, 1,
-0.3831102, -0.9912548, -4.416533, 0, 1, 0.1137255, 1,
-0.3751831, -0.1610794, -2.756898, 0, 1, 0.1176471, 1,
-0.3745837, -0.1010259, -2.959681, 0, 1, 0.1254902, 1,
-0.3740788, 1.838294, 0.1560715, 0, 1, 0.1294118, 1,
-0.3737581, 0.2510073, -1.754131, 0, 1, 0.1372549, 1,
-0.3699956, 0.6123978, 0.6627587, 0, 1, 0.1411765, 1,
-0.3685363, 0.6824184, -0.8191636, 0, 1, 0.1490196, 1,
-0.3674403, -1.366171, -1.577219, 0, 1, 0.1529412, 1,
-0.3646722, 0.1306692, -1.814991, 0, 1, 0.1607843, 1,
-0.3594881, -1.141231, -5.558554, 0, 1, 0.1647059, 1,
-0.3592897, 0.1258578, -1.703363, 0, 1, 0.172549, 1,
-0.3578981, 0.4413098, 1.12388, 0, 1, 0.1764706, 1,
-0.3550884, -0.3271192, -3.478648, 0, 1, 0.1843137, 1,
-0.3505138, -0.5141536, -1.881238, 0, 1, 0.1882353, 1,
-0.350363, 1.826779, 0.7187158, 0, 1, 0.1960784, 1,
-0.34933, 0.3953924, -0.9848204, 0, 1, 0.2039216, 1,
-0.3493137, 1.110815, 1.140635, 0, 1, 0.2078431, 1,
-0.3429741, 1.26508, 0.2455582, 0, 1, 0.2156863, 1,
-0.3385718, 1.778087, 1.022318, 0, 1, 0.2196078, 1,
-0.3361519, -1.450747, -2.791452, 0, 1, 0.227451, 1,
-0.3329917, -1.160701, -3.071242, 0, 1, 0.2313726, 1,
-0.3267172, -1.290511, -2.816929, 0, 1, 0.2392157, 1,
-0.3247089, -1.572001, -3.028622, 0, 1, 0.2431373, 1,
-0.3187651, -0.4277744, -3.673084, 0, 1, 0.2509804, 1,
-0.3139178, -0.9384915, -4.134571, 0, 1, 0.254902, 1,
-0.3115235, -0.369967, -0.5732824, 0, 1, 0.2627451, 1,
-0.3113185, -0.1653194, -1.403782, 0, 1, 0.2666667, 1,
-0.3092312, 0.3096996, -0.984913, 0, 1, 0.2745098, 1,
-0.3079458, 0.9159755, -0.6470538, 0, 1, 0.2784314, 1,
-0.3077164, -2.848146, -4.064003, 0, 1, 0.2862745, 1,
-0.3046, -0.7872262, -3.404853, 0, 1, 0.2901961, 1,
-0.3021549, -0.5272987, -2.940784, 0, 1, 0.2980392, 1,
-0.300502, 0.9495967, -0.9866085, 0, 1, 0.3058824, 1,
-0.2961134, -0.4956676, -3.13399, 0, 1, 0.3098039, 1,
-0.294122, -0.2451141, -3.313479, 0, 1, 0.3176471, 1,
-0.2940408, -1.799266, -2.710061, 0, 1, 0.3215686, 1,
-0.2932499, 0.3101212, -0.1386807, 0, 1, 0.3294118, 1,
-0.2920069, -0.4269051, -5.415755, 0, 1, 0.3333333, 1,
-0.2898089, 2.390863, 0.4001248, 0, 1, 0.3411765, 1,
-0.2897197, -1.148687, -2.360143, 0, 1, 0.345098, 1,
-0.2879289, -0.5710949, -4.587152, 0, 1, 0.3529412, 1,
-0.2853115, 0.1832682, -2.246601, 0, 1, 0.3568628, 1,
-0.2825056, -0.2154282, 0.1884695, 0, 1, 0.3647059, 1,
-0.2722529, -0.8317028, -2.489839, 0, 1, 0.3686275, 1,
-0.270408, -1.062656, -4.433307, 0, 1, 0.3764706, 1,
-0.2680364, 0.4178327, -0.2802545, 0, 1, 0.3803922, 1,
-0.2673986, 0.1608278, -0.3839772, 0, 1, 0.3882353, 1,
-0.2647296, -1.552357, -1.208435, 0, 1, 0.3921569, 1,
-0.2562481, 0.7548625, -0.5419446, 0, 1, 0.4, 1,
-0.2538475, -0.005587476, -3.634252, 0, 1, 0.4078431, 1,
-0.2525754, 0.193814, -0.1763417, 0, 1, 0.4117647, 1,
-0.2500573, -0.3856353, -1.854527, 0, 1, 0.4196078, 1,
-0.2489037, -0.7458714, -1.316834, 0, 1, 0.4235294, 1,
-0.248283, -2.066772, -3.513239, 0, 1, 0.4313726, 1,
-0.2437918, 0.7469729, -0.9476162, 0, 1, 0.4352941, 1,
-0.2417664, 0.3391314, -0.3381453, 0, 1, 0.4431373, 1,
-0.2407319, 0.08071466, -0.6556745, 0, 1, 0.4470588, 1,
-0.2331824, 0.3466874, -1.712562, 0, 1, 0.454902, 1,
-0.2254569, -0.01448328, -2.060887, 0, 1, 0.4588235, 1,
-0.2244031, -1.897884, -2.587833, 0, 1, 0.4666667, 1,
-0.221756, 0.5067971, 1.068653, 0, 1, 0.4705882, 1,
-0.2181377, -0.45788, -2.872403, 0, 1, 0.4784314, 1,
-0.217254, -0.1118535, -2.321773, 0, 1, 0.4823529, 1,
-0.2171788, -0.5241317, -2.54913, 0, 1, 0.4901961, 1,
-0.2046834, -0.5904182, -5.163582, 0, 1, 0.4941176, 1,
-0.2030795, -1.185672, -2.295498, 0, 1, 0.5019608, 1,
-0.2008155, -1.519423, -3.159073, 0, 1, 0.509804, 1,
-0.200308, -0.6808885, -2.286678, 0, 1, 0.5137255, 1,
-0.198264, 1.048063, 0.6557533, 0, 1, 0.5215687, 1,
-0.1954726, 0.9339758, -0.873336, 0, 1, 0.5254902, 1,
-0.1930069, -0.5287924, -3.550887, 0, 1, 0.5333334, 1,
-0.1917306, -0.7387269, -1.193806, 0, 1, 0.5372549, 1,
-0.1887799, -1.162346, -3.094497, 0, 1, 0.5450981, 1,
-0.1847366, -2.336637, -2.399228, 0, 1, 0.5490196, 1,
-0.1839779, 0.5475307, -2.229221, 0, 1, 0.5568628, 1,
-0.1831009, -0.8138043, -3.621926, 0, 1, 0.5607843, 1,
-0.1775, -1.492572, -2.877571, 0, 1, 0.5686275, 1,
-0.1751076, -0.1235178, -2.560651, 0, 1, 0.572549, 1,
-0.1737448, -0.5105881, -2.33798, 0, 1, 0.5803922, 1,
-0.1736383, 0.3527146, 0.2264099, 0, 1, 0.5843138, 1,
-0.1718303, 0.00732938, -0.1765573, 0, 1, 0.5921569, 1,
-0.1685493, -1.240164, -3.511294, 0, 1, 0.5960785, 1,
-0.1634445, -0.3762282, -1.968834, 0, 1, 0.6039216, 1,
-0.1594556, -0.2485306, -1.159223, 0, 1, 0.6117647, 1,
-0.1532032, -1.209936, -2.935297, 0, 1, 0.6156863, 1,
-0.151546, 0.221844, 1.545271, 0, 1, 0.6235294, 1,
-0.1487415, 0.2159369, 0.1145764, 0, 1, 0.627451, 1,
-0.1448733, -0.1173438, -0.6815557, 0, 1, 0.6352941, 1,
-0.1444179, -0.402124, -3.957238, 0, 1, 0.6392157, 1,
-0.1419503, -0.06216069, -2.556612, 0, 1, 0.6470588, 1,
-0.140327, 1.744783, 0.8652669, 0, 1, 0.6509804, 1,
-0.1400236, 0.9694165, -0.07817172, 0, 1, 0.6588235, 1,
-0.1396848, -0.9330875, -5.272462, 0, 1, 0.6627451, 1,
-0.1392626, -1.778385, -4.583298, 0, 1, 0.6705883, 1,
-0.1374885, 1.07748, -1.171776, 0, 1, 0.6745098, 1,
-0.1361884, -2.207434, -3.453715, 0, 1, 0.682353, 1,
-0.1349951, 0.8495149, -0.1604508, 0, 1, 0.6862745, 1,
-0.1340608, -0.9391677, -1.073512, 0, 1, 0.6941177, 1,
-0.1210384, 1.636383, 0.3828423, 0, 1, 0.7019608, 1,
-0.1145422, 0.3712191, -0.9764446, 0, 1, 0.7058824, 1,
-0.1124752, 0.5570732, -0.6886284, 0, 1, 0.7137255, 1,
-0.1120021, -0.8994521, -1.56717, 0, 1, 0.7176471, 1,
-0.1115236, 1.400266, -0.4685033, 0, 1, 0.7254902, 1,
-0.1113274, -0.09036777, -2.241026, 0, 1, 0.7294118, 1,
-0.1111142, -1.345666, -4.033725, 0, 1, 0.7372549, 1,
-0.110402, 1.020443, -2.127702, 0, 1, 0.7411765, 1,
-0.1097859, -1.004224, -2.969266, 0, 1, 0.7490196, 1,
-0.1044118, -1.037755, -5.18534, 0, 1, 0.7529412, 1,
-0.1041523, -0.3400128, -2.161473, 0, 1, 0.7607843, 1,
-0.1014201, -1.193654, -4.213629, 0, 1, 0.7647059, 1,
-0.09959321, -0.112792, -3.144565, 0, 1, 0.772549, 1,
-0.09826891, -0.1136076, -2.886729, 0, 1, 0.7764706, 1,
-0.09608679, 1.098687, 1.264044, 0, 1, 0.7843137, 1,
-0.09428488, -0.008772864, -1.621631, 0, 1, 0.7882353, 1,
-0.09341884, -0.3223854, -1.241382, 0, 1, 0.7960784, 1,
-0.09018841, -0.5031551, -2.073101, 0, 1, 0.8039216, 1,
-0.0858921, 0.7786916, -1.131187, 0, 1, 0.8078431, 1,
-0.08488149, 0.1955036, -0.1825803, 0, 1, 0.8156863, 1,
-0.0847778, 0.7967551, 0.2961383, 0, 1, 0.8196079, 1,
-0.08442148, 0.4404156, -0.9292389, 0, 1, 0.827451, 1,
-0.08411903, -0.4319209, -2.223335, 0, 1, 0.8313726, 1,
-0.08147115, -1.415851, -2.82668, 0, 1, 0.8392157, 1,
-0.08063812, 0.4007369, -0.8116424, 0, 1, 0.8431373, 1,
-0.07921939, -1.80373, -3.066465, 0, 1, 0.8509804, 1,
-0.07725532, 0.5305113, 0.3427765, 0, 1, 0.854902, 1,
-0.07638542, -0.2526953, -2.101308, 0, 1, 0.8627451, 1,
-0.07537816, -1.084085, -3.706028, 0, 1, 0.8666667, 1,
-0.0742532, 0.1767592, -1.459701, 0, 1, 0.8745098, 1,
-0.07406759, -1.515225, -4.094803, 0, 1, 0.8784314, 1,
-0.07394702, 0.531736, 0.8143005, 0, 1, 0.8862745, 1,
-0.07058443, 0.175876, 1.142624, 0, 1, 0.8901961, 1,
-0.06358397, -0.08083089, -2.700501, 0, 1, 0.8980392, 1,
-0.06355349, 1.18676, -1.989414, 0, 1, 0.9058824, 1,
-0.06079125, 0.1966996, 2.048504, 0, 1, 0.9098039, 1,
-0.05990671, -0.8562348, -2.686709, 0, 1, 0.9176471, 1,
-0.05956958, -0.202913, -3.213429, 0, 1, 0.9215686, 1,
-0.05537176, 0.7063558, -0.322727, 0, 1, 0.9294118, 1,
-0.05497056, 0.3666747, 0.2953551, 0, 1, 0.9333333, 1,
-0.05344022, -0.1165114, -3.370123, 0, 1, 0.9411765, 1,
-0.05234643, 0.07003883, -1.739689, 0, 1, 0.945098, 1,
-0.05200533, -1.712516, -4.039405, 0, 1, 0.9529412, 1,
-0.05151964, 0.6652638, 0.01422185, 0, 1, 0.9568627, 1,
-0.04760094, 0.6342128, -0.6207284, 0, 1, 0.9647059, 1,
-0.04428757, 0.6901426, 0.8011769, 0, 1, 0.9686275, 1,
-0.04249391, -0.4150135, -2.854608, 0, 1, 0.9764706, 1,
-0.04118448, -0.537349, -3.36315, 0, 1, 0.9803922, 1,
-0.04073601, -1.052341, -3.564246, 0, 1, 0.9882353, 1,
-0.04066096, 0.6634852, 0.04696583, 0, 1, 0.9921569, 1,
-0.04046763, -1.866789, -3.145075, 0, 1, 1, 1,
-0.03807165, -0.3600463, -3.027472, 0, 0.9921569, 1, 1,
-0.03717057, -2.929893, -3.418288, 0, 0.9882353, 1, 1,
-0.03459625, 0.1979369, 0.4903944, 0, 0.9803922, 1, 1,
-0.02769646, 1.669361, 0.5636097, 0, 0.9764706, 1, 1,
-0.02603675, 0.5548093, -0.5241053, 0, 0.9686275, 1, 1,
-0.0250569, -2.003268, -2.541248, 0, 0.9647059, 1, 1,
-0.02455024, -0.3024016, -1.942203, 0, 0.9568627, 1, 1,
-0.02270874, -0.1742706, -1.589046, 0, 0.9529412, 1, 1,
-0.02001885, -0.3646958, -3.103909, 0, 0.945098, 1, 1,
-0.01989117, 1.591637, -0.168406, 0, 0.9411765, 1, 1,
-0.01760115, -0.8664219, -4.257568, 0, 0.9333333, 1, 1,
-0.01720278, 1.468498, 1.158513, 0, 0.9294118, 1, 1,
-0.0170987, -0.4246198, -2.889418, 0, 0.9215686, 1, 1,
-0.01234323, 0.0914904, 1.510833, 0, 0.9176471, 1, 1,
-0.005492496, 0.4498562, -2.367129, 0, 0.9098039, 1, 1,
-0.003447726, 0.9908825, -0.2608998, 0, 0.9058824, 1, 1,
-0.003340984, -0.126578, -2.649005, 0, 0.8980392, 1, 1,
-0.002584169, -0.2369007, -2.077142, 0, 0.8901961, 1, 1,
-3.005969e-05, 0.969184, -1.33793, 0, 0.8862745, 1, 1,
0.0002607074, -1.549864, 2.678885, 0, 0.8784314, 1, 1,
0.002255435, -0.06401558, 2.189327, 0, 0.8745098, 1, 1,
0.003602254, -1.01808, 2.428173, 0, 0.8666667, 1, 1,
0.007687351, -0.6548676, 2.952628, 0, 0.8627451, 1, 1,
0.009858001, 0.08125247, -2.091553, 0, 0.854902, 1, 1,
0.01296898, 0.1887202, -1.829508, 0, 0.8509804, 1, 1,
0.01370567, -0.07111075, 3.617876, 0, 0.8431373, 1, 1,
0.01397427, -0.164855, 2.904648, 0, 0.8392157, 1, 1,
0.01468864, 0.4062141, 0.8921486, 0, 0.8313726, 1, 1,
0.01497837, -1.820507, 3.3935, 0, 0.827451, 1, 1,
0.01633944, 1.413365, 0.5183551, 0, 0.8196079, 1, 1,
0.01880894, -0.2464445, 3.79214, 0, 0.8156863, 1, 1,
0.02036583, 2.064347, 1.017743, 0, 0.8078431, 1, 1,
0.02112117, -0.0636322, 1.788239, 0, 0.8039216, 1, 1,
0.02886839, -0.4563378, 2.91394, 0, 0.7960784, 1, 1,
0.03066413, 0.6512025, 0.5092669, 0, 0.7882353, 1, 1,
0.03257186, 0.5996013, -0.1619504, 0, 0.7843137, 1, 1,
0.03335484, 1.283385, -0.3618833, 0, 0.7764706, 1, 1,
0.03681171, 1.399626, 0.3371668, 0, 0.772549, 1, 1,
0.04027968, -0.2693014, 1.099746, 0, 0.7647059, 1, 1,
0.04168554, -1.924112, 3.090206, 0, 0.7607843, 1, 1,
0.04480745, 0.3243195, -1.587196, 0, 0.7529412, 1, 1,
0.04680241, 1.400691, 1.104745, 0, 0.7490196, 1, 1,
0.04985742, 0.1111756, 1.451627, 0, 0.7411765, 1, 1,
0.05101414, -0.3306458, 5.022709, 0, 0.7372549, 1, 1,
0.05127675, 0.4593953, -1.169898, 0, 0.7294118, 1, 1,
0.05782538, -0.439216, 0.8177612, 0, 0.7254902, 1, 1,
0.05810847, 1.061677, -0.7304403, 0, 0.7176471, 1, 1,
0.05910196, -0.01153633, 0.03364918, 0, 0.7137255, 1, 1,
0.06541228, -1.082469, 4.085249, 0, 0.7058824, 1, 1,
0.06566484, 0.789139, 0.2207605, 0, 0.6980392, 1, 1,
0.07046606, -0.873087, 4.515373, 0, 0.6941177, 1, 1,
0.07134657, 1.172369, 0.9173806, 0, 0.6862745, 1, 1,
0.07156304, 0.7023565, -2.208096, 0, 0.682353, 1, 1,
0.07356498, -1.039194, 2.212861, 0, 0.6745098, 1, 1,
0.08095428, -0.1692273, 2.696596, 0, 0.6705883, 1, 1,
0.08643752, -0.2026894, 1.559162, 0, 0.6627451, 1, 1,
0.08981801, -0.6455254, 3.986141, 0, 0.6588235, 1, 1,
0.09593862, 1.075523, 2.215045, 0, 0.6509804, 1, 1,
0.09753789, 0.485859, 0.04311435, 0, 0.6470588, 1, 1,
0.100529, 0.2840629, -1.576039, 0, 0.6392157, 1, 1,
0.1037342, -0.4973148, 2.461051, 0, 0.6352941, 1, 1,
0.1041582, 0.09559986, 1.239789, 0, 0.627451, 1, 1,
0.1066883, 1.599535, 0.1519886, 0, 0.6235294, 1, 1,
0.1073219, 1.883653, -0.4000587, 0, 0.6156863, 1, 1,
0.1143624, -0.1033314, 1.620693, 0, 0.6117647, 1, 1,
0.11453, 0.2438295, 0.523944, 0, 0.6039216, 1, 1,
0.1150718, 0.284109, -0.2987039, 0, 0.5960785, 1, 1,
0.1166802, 1.72516, -0.1971609, 0, 0.5921569, 1, 1,
0.1187217, -0.04804118, 1.544499, 0, 0.5843138, 1, 1,
0.1192353, 0.7668046, 1.947854, 0, 0.5803922, 1, 1,
0.1202522, -0.8390117, 3.05071, 0, 0.572549, 1, 1,
0.1206882, 0.03858502, 0.7412547, 0, 0.5686275, 1, 1,
0.1257286, 1.178065, 1.036146, 0, 0.5607843, 1, 1,
0.1327856, 0.5146894, 0.9212697, 0, 0.5568628, 1, 1,
0.1347833, 0.3749094, 0.8634778, 0, 0.5490196, 1, 1,
0.1365827, -0.3515208, 1.749546, 0, 0.5450981, 1, 1,
0.1373514, -0.1062889, 2.070411, 0, 0.5372549, 1, 1,
0.1422526, 0.6569973, -0.3753622, 0, 0.5333334, 1, 1,
0.1476317, 0.2032235, -0.4206814, 0, 0.5254902, 1, 1,
0.1500467, 0.370304, 1.605495, 0, 0.5215687, 1, 1,
0.1507114, 0.1252232, 1.263652, 0, 0.5137255, 1, 1,
0.1524962, 1.174597, 0.3904806, 0, 0.509804, 1, 1,
0.155867, -0.08778531, 1.403936, 0, 0.5019608, 1, 1,
0.156227, 0.2455465, -0.4011098, 0, 0.4941176, 1, 1,
0.157416, -0.1164678, 4.670446, 0, 0.4901961, 1, 1,
0.1608061, -1.553782, 3.58635, 0, 0.4823529, 1, 1,
0.161101, 0.2943037, 0.4753024, 0, 0.4784314, 1, 1,
0.1643855, 2.096956, 1.115157, 0, 0.4705882, 1, 1,
0.1681868, -0.2597721, 2.98196, 0, 0.4666667, 1, 1,
0.1717205, 1.31724, 0.348776, 0, 0.4588235, 1, 1,
0.1717264, -0.9929008, 3.274174, 0, 0.454902, 1, 1,
0.1725979, 0.52861, -0.03926576, 0, 0.4470588, 1, 1,
0.1738635, -1.018239, 2.227667, 0, 0.4431373, 1, 1,
0.1799939, -1.126786, 3.956303, 0, 0.4352941, 1, 1,
0.1865451, 0.9563681, 0.7557526, 0, 0.4313726, 1, 1,
0.1875173, -1.316761, 2.942617, 0, 0.4235294, 1, 1,
0.1876837, 0.5485185, 1.684093, 0, 0.4196078, 1, 1,
0.1879497, -2.181129, 0.5431592, 0, 0.4117647, 1, 1,
0.195015, 1.273368, -1.167878, 0, 0.4078431, 1, 1,
0.1969338, -2.487368, 2.765985, 0, 0.4, 1, 1,
0.2005789, -0.6064333, 2.279796, 0, 0.3921569, 1, 1,
0.2012943, -0.9806083, 4.298534, 0, 0.3882353, 1, 1,
0.2020711, -0.4120122, 2.51496, 0, 0.3803922, 1, 1,
0.2029015, -0.6823315, 3.554479, 0, 0.3764706, 1, 1,
0.2093518, -0.0330475, 1.92606, 0, 0.3686275, 1, 1,
0.2097582, 1.493946, -0.8316393, 0, 0.3647059, 1, 1,
0.2106953, 1.07674, 2.285118, 0, 0.3568628, 1, 1,
0.2119864, 0.4095858, 1.0999, 0, 0.3529412, 1, 1,
0.2123495, -1.538767, 2.256605, 0, 0.345098, 1, 1,
0.2127527, 0.4826736, -0.7764032, 0, 0.3411765, 1, 1,
0.2177488, -0.1284725, 1.189483, 0, 0.3333333, 1, 1,
0.2180561, -0.9924228, 3.781968, 0, 0.3294118, 1, 1,
0.218151, -0.804303, 3.228176, 0, 0.3215686, 1, 1,
0.2207824, 0.480631, 0.6308993, 0, 0.3176471, 1, 1,
0.2212303, -0.3671823, 1.928896, 0, 0.3098039, 1, 1,
0.2217705, -0.6359361, 3.209847, 0, 0.3058824, 1, 1,
0.2235075, -0.9239929, 2.940478, 0, 0.2980392, 1, 1,
0.2241388, -0.5576226, 1.825922, 0, 0.2901961, 1, 1,
0.2258123, 0.1067716, 1.707683, 0, 0.2862745, 1, 1,
0.2270228, -1.199351, 1.989759, 0, 0.2784314, 1, 1,
0.2306645, -1.101924, 1.747259, 0, 0.2745098, 1, 1,
0.2329528, -0.6152388, 2.760615, 0, 0.2666667, 1, 1,
0.2336723, -0.60268, 1.438368, 0, 0.2627451, 1, 1,
0.2391837, 0.5094885, -0.4820994, 0, 0.254902, 1, 1,
0.2395058, 0.3420541, 1.728778, 0, 0.2509804, 1, 1,
0.2407073, 0.438152, 0.5425093, 0, 0.2431373, 1, 1,
0.2407455, -0.2029877, 0.7092467, 0, 0.2392157, 1, 1,
0.2408744, -0.9799958, 4.311129, 0, 0.2313726, 1, 1,
0.2439223, 0.8993783, 0.3058786, 0, 0.227451, 1, 1,
0.2445561, 0.5499021, 1.046388, 0, 0.2196078, 1, 1,
0.2445873, -0.2233747, 2.468162, 0, 0.2156863, 1, 1,
0.2513466, -0.3363854, 1.657381, 0, 0.2078431, 1, 1,
0.2549356, 0.6977847, -1.1924, 0, 0.2039216, 1, 1,
0.2572285, -1.367484, 3.302098, 0, 0.1960784, 1, 1,
0.2595132, 0.6256324, -0.8348296, 0, 0.1882353, 1, 1,
0.2649911, -1.127163, 3.823636, 0, 0.1843137, 1, 1,
0.2685354, -0.3569705, 0.8234565, 0, 0.1764706, 1, 1,
0.2693151, -1.282243, 3.205789, 0, 0.172549, 1, 1,
0.2702067, -0.9734414, 3.11565, 0, 0.1647059, 1, 1,
0.2704232, 0.4777959, 1.783113, 0, 0.1607843, 1, 1,
0.2729623, -0.4363955, 1.622981, 0, 0.1529412, 1, 1,
0.2795912, 1.602784, 1.08586, 0, 0.1490196, 1, 1,
0.2876241, -1.385786, 4.238503, 0, 0.1411765, 1, 1,
0.2897414, -2.171196, 3.107613, 0, 0.1372549, 1, 1,
0.2906913, 0.4509094, 1.173043, 0, 0.1294118, 1, 1,
0.2926871, 0.5197438, 1.744193, 0, 0.1254902, 1, 1,
0.2968937, 0.7224872, -0.4502795, 0, 0.1176471, 1, 1,
0.2989348, 1.715435, 0.04477699, 0, 0.1137255, 1, 1,
0.3036664, 0.5277904, 1.072541, 0, 0.1058824, 1, 1,
0.3040364, 1.15557, -0.395978, 0, 0.09803922, 1, 1,
0.3059336, -1.042374, 1.666118, 0, 0.09411765, 1, 1,
0.3069702, -1.402628, 4.045389, 0, 0.08627451, 1, 1,
0.3142013, 1.268802, -0.1659678, 0, 0.08235294, 1, 1,
0.3151963, 1.479554, 0.5511086, 0, 0.07450981, 1, 1,
0.315751, -0.5505136, 2.721035, 0, 0.07058824, 1, 1,
0.3161248, 1.506522, 1.201968, 0, 0.0627451, 1, 1,
0.3162091, -0.2867977, 3.022592, 0, 0.05882353, 1, 1,
0.3198754, -0.1582002, 1.696809, 0, 0.05098039, 1, 1,
0.3218196, 0.4033071, 1.406685, 0, 0.04705882, 1, 1,
0.322683, -0.3584099, 0.8152698, 0, 0.03921569, 1, 1,
0.3227939, -0.8526496, 3.358273, 0, 0.03529412, 1, 1,
0.3253509, 0.7635841, 3.742016, 0, 0.02745098, 1, 1,
0.3309529, 0.04753832, 2.041311, 0, 0.02352941, 1, 1,
0.3310867, 0.7797527, -0.5210941, 0, 0.01568628, 1, 1,
0.332546, -0.4392917, 2.264151, 0, 0.01176471, 1, 1,
0.3334507, 1.593481, -0.5733241, 0, 0.003921569, 1, 1,
0.3367262, -0.6927143, 0.7367769, 0.003921569, 0, 1, 1,
0.3427804, 0.680153, -0.5905867, 0.007843138, 0, 1, 1,
0.3440776, 0.502704, 0.6763155, 0.01568628, 0, 1, 1,
0.3457608, -0.1533877, 2.651939, 0.01960784, 0, 1, 1,
0.3608205, -0.6394117, 3.268606, 0.02745098, 0, 1, 1,
0.3611707, 0.296761, 2.533992, 0.03137255, 0, 1, 1,
0.3625827, 0.3285907, -0.3232199, 0.03921569, 0, 1, 1,
0.3647497, -1.154212, 3.424469, 0.04313726, 0, 1, 1,
0.3688432, 0.2294228, 1.081882, 0.05098039, 0, 1, 1,
0.3690903, -1.400808, 2.582038, 0.05490196, 0, 1, 1,
0.3705785, -0.2241614, 1.535512, 0.0627451, 0, 1, 1,
0.3731159, -0.7066435, 2.839622, 0.06666667, 0, 1, 1,
0.375921, 0.9595581, -0.4847772, 0.07450981, 0, 1, 1,
0.377563, -0.6958187, 3.477897, 0.07843138, 0, 1, 1,
0.3806873, -1.150233, 3.13376, 0.08627451, 0, 1, 1,
0.3835062, -1.216917, 1.943663, 0.09019608, 0, 1, 1,
0.3840023, -0.7248842, 3.823748, 0.09803922, 0, 1, 1,
0.3895481, -0.5638077, 0.7948411, 0.1058824, 0, 1, 1,
0.3942071, -0.8045751, 1.94907, 0.1098039, 0, 1, 1,
0.3953078, 1.09682, 0.5975006, 0.1176471, 0, 1, 1,
0.3980141, -0.03168634, 1.254256, 0.1215686, 0, 1, 1,
0.399538, -0.7350376, 3.324434, 0.1294118, 0, 1, 1,
0.4003814, -0.003399257, 2.663369, 0.1333333, 0, 1, 1,
0.406278, -1.735422, 2.326281, 0.1411765, 0, 1, 1,
0.4109762, 0.9908155, -0.0966923, 0.145098, 0, 1, 1,
0.4110595, 0.3559316, 0.8908018, 0.1529412, 0, 1, 1,
0.4111157, 1.263238, 0.4238262, 0.1568628, 0, 1, 1,
0.4133684, 0.9261485, -0.3027231, 0.1647059, 0, 1, 1,
0.413569, -0.4271675, 2.047637, 0.1686275, 0, 1, 1,
0.4268234, -1.338249, 3.357018, 0.1764706, 0, 1, 1,
0.4279051, -1.019591, 4.469829, 0.1803922, 0, 1, 1,
0.4313231, -0.1234164, 1.6072, 0.1882353, 0, 1, 1,
0.4346854, -0.8081794, 3.155022, 0.1921569, 0, 1, 1,
0.436455, 0.7471796, -0.366216, 0.2, 0, 1, 1,
0.438165, -0.768212, 1.014674, 0.2078431, 0, 1, 1,
0.4410959, -0.1811872, 0.5188753, 0.2117647, 0, 1, 1,
0.4415345, -1.042985, 2.395173, 0.2196078, 0, 1, 1,
0.4456569, -1.346844, 3.041465, 0.2235294, 0, 1, 1,
0.4460382, 1.161101, -0.1563537, 0.2313726, 0, 1, 1,
0.4536598, 1.667152, -0.09946839, 0.2352941, 0, 1, 1,
0.4581425, -0.03053932, 0.2650271, 0.2431373, 0, 1, 1,
0.4582092, 0.01763729, 0.5976593, 0.2470588, 0, 1, 1,
0.4582959, -0.3276911, 1.52542, 0.254902, 0, 1, 1,
0.4583701, -1.642412, 2.867157, 0.2588235, 0, 1, 1,
0.4627408, -0.7686454, 4.42053, 0.2666667, 0, 1, 1,
0.463753, 0.3713909, 0.9236789, 0.2705882, 0, 1, 1,
0.4652329, -0.2714294, 0.8443236, 0.2784314, 0, 1, 1,
0.4693868, -0.3605861, 2.064741, 0.282353, 0, 1, 1,
0.4706267, -1.419954, 2.345482, 0.2901961, 0, 1, 1,
0.4734439, 0.2966045, 0.9288488, 0.2941177, 0, 1, 1,
0.4783903, -0.9834445, 1.939303, 0.3019608, 0, 1, 1,
0.4815392, 1.763841, 0.517799, 0.3098039, 0, 1, 1,
0.4822889, 0.800161, 1.247228, 0.3137255, 0, 1, 1,
0.4835819, -0.2490718, 2.485074, 0.3215686, 0, 1, 1,
0.4835965, 2.298582, -0.7484531, 0.3254902, 0, 1, 1,
0.4842764, -0.8852869, 2.577663, 0.3333333, 0, 1, 1,
0.487101, -1.23624, 2.010922, 0.3372549, 0, 1, 1,
0.4897447, 0.6266569, 0.5950583, 0.345098, 0, 1, 1,
0.4903351, 0.3258909, 2.619377, 0.3490196, 0, 1, 1,
0.4962942, -1.573111, 3.158768, 0.3568628, 0, 1, 1,
0.4968145, 0.4466352, 1.065729, 0.3607843, 0, 1, 1,
0.4983178, 0.7796957, 0.1911393, 0.3686275, 0, 1, 1,
0.5024153, -0.7149674, 2.583399, 0.372549, 0, 1, 1,
0.506923, -0.1231453, 1.53089, 0.3803922, 0, 1, 1,
0.5088377, 0.1522747, 1.259905, 0.3843137, 0, 1, 1,
0.5096878, -1.032093, 4.759478, 0.3921569, 0, 1, 1,
0.5115404, -0.9386731, 2.299555, 0.3960784, 0, 1, 1,
0.5132688, -0.6381624, 2.166264, 0.4039216, 0, 1, 1,
0.5134654, -0.8408766, 2.695641, 0.4117647, 0, 1, 1,
0.5145699, 0.08463791, 3.021782, 0.4156863, 0, 1, 1,
0.5153682, -0.7865816, 4.016539, 0.4235294, 0, 1, 1,
0.5161176, -0.6148279, 1.970736, 0.427451, 0, 1, 1,
0.5183401, -1.035001, 2.807958, 0.4352941, 0, 1, 1,
0.5188927, 0.03664825, 0.7073296, 0.4392157, 0, 1, 1,
0.5243147, 1.065067, -1.007835, 0.4470588, 0, 1, 1,
0.5271831, 1.267027, -0.144, 0.4509804, 0, 1, 1,
0.5298044, -0.1830287, 1.147383, 0.4588235, 0, 1, 1,
0.5301811, -0.6176119, 0.01783631, 0.4627451, 0, 1, 1,
0.5342096, -0.2137764, 1.945524, 0.4705882, 0, 1, 1,
0.5479014, 1.602369, 0.4562928, 0.4745098, 0, 1, 1,
0.5481136, -0.0520852, 1.244133, 0.4823529, 0, 1, 1,
0.5498596, 0.2065492, 1.311421, 0.4862745, 0, 1, 1,
0.5505195, 0.1478257, 1.658427, 0.4941176, 0, 1, 1,
0.5623604, 0.3030686, 0.8385134, 0.5019608, 0, 1, 1,
0.5695334, 0.2557128, -0.3887035, 0.5058824, 0, 1, 1,
0.5778131, 1.529076, 0.6434211, 0.5137255, 0, 1, 1,
0.577895, 0.9363065, 1.545835, 0.5176471, 0, 1, 1,
0.5867588, 0.05266548, 1.865692, 0.5254902, 0, 1, 1,
0.5903118, -1.166888, 2.097984, 0.5294118, 0, 1, 1,
0.5908877, -0.8945394, 1.34127, 0.5372549, 0, 1, 1,
0.5918019, -1.054464, 1.711442, 0.5411765, 0, 1, 1,
0.5928784, -0.3869532, 1.867445, 0.5490196, 0, 1, 1,
0.5948609, 0.2505389, 1.826424, 0.5529412, 0, 1, 1,
0.5965802, -1.032062, 3.083542, 0.5607843, 0, 1, 1,
0.5983534, -1.222358, 0.8788115, 0.5647059, 0, 1, 1,
0.6020089, -1.477609, 2.681405, 0.572549, 0, 1, 1,
0.6061718, -0.4172634, 1.763015, 0.5764706, 0, 1, 1,
0.609647, 0.278757, 2.86674, 0.5843138, 0, 1, 1,
0.6253409, 0.02698247, 2.685969, 0.5882353, 0, 1, 1,
0.6278276, 1.51948, 1.053589, 0.5960785, 0, 1, 1,
0.6283438, 0.9335833, 0.4142951, 0.6039216, 0, 1, 1,
0.6314997, -1.152086, 3.144651, 0.6078432, 0, 1, 1,
0.6331441, 0.9644175, -0.524898, 0.6156863, 0, 1, 1,
0.6333713, 1.23182, -1.251037, 0.6196079, 0, 1, 1,
0.6405173, 0.1303538, 1.512309, 0.627451, 0, 1, 1,
0.6459869, 0.7994722, 1.397566, 0.6313726, 0, 1, 1,
0.6473034, 0.8329709, -0.431733, 0.6392157, 0, 1, 1,
0.6513469, -0.5546147, 2.223105, 0.6431373, 0, 1, 1,
0.6542552, 0.5519813, 2.181853, 0.6509804, 0, 1, 1,
0.6621065, 0.1023719, 0.9632213, 0.654902, 0, 1, 1,
0.6675718, -0.2817925, 3.55694, 0.6627451, 0, 1, 1,
0.6693186, 0.3419167, 2.242547, 0.6666667, 0, 1, 1,
0.6764828, 0.08883254, 1.606493, 0.6745098, 0, 1, 1,
0.676599, -0.2670673, 2.925728, 0.6784314, 0, 1, 1,
0.6848444, 0.2930229, 1.291655, 0.6862745, 0, 1, 1,
0.6881396, 0.1993667, 1.594841, 0.6901961, 0, 1, 1,
0.6891966, 2.110283, 0.9112324, 0.6980392, 0, 1, 1,
0.6945179, -0.9190041, 2.051392, 0.7058824, 0, 1, 1,
0.7001221, -0.8426223, 2.056964, 0.7098039, 0, 1, 1,
0.7106959, 0.4211552, 0.4321812, 0.7176471, 0, 1, 1,
0.7124486, -1.867268, 0.7096007, 0.7215686, 0, 1, 1,
0.7188498, -0.3513882, 2.317119, 0.7294118, 0, 1, 1,
0.7207198, 1.070227, 3.155849, 0.7333333, 0, 1, 1,
0.7221405, 0.09085508, 2.768063, 0.7411765, 0, 1, 1,
0.7241678, -0.7728251, 3.252951, 0.7450981, 0, 1, 1,
0.7255325, -1.077921, 2.553061, 0.7529412, 0, 1, 1,
0.7257617, -0.0268637, -0.1080684, 0.7568628, 0, 1, 1,
0.7313972, -0.998663, 2.043312, 0.7647059, 0, 1, 1,
0.7379764, 1.524934, 0.2847352, 0.7686275, 0, 1, 1,
0.7384414, 0.7297421, 0.8371152, 0.7764706, 0, 1, 1,
0.7394503, 0.9693539, 1.254145, 0.7803922, 0, 1, 1,
0.7397377, 0.7360227, 0.4974069, 0.7882353, 0, 1, 1,
0.7411374, -0.2204823, 1.8592, 0.7921569, 0, 1, 1,
0.751909, -0.3698248, 3.225671, 0.8, 0, 1, 1,
0.7531328, 0.9149894, -0.2774582, 0.8078431, 0, 1, 1,
0.7539096, -1.299093, 0.4615714, 0.8117647, 0, 1, 1,
0.7556317, -1.182827, 1.954294, 0.8196079, 0, 1, 1,
0.7668421, -0.352363, 2.769785, 0.8235294, 0, 1, 1,
0.7754054, -1.954179, 2.432822, 0.8313726, 0, 1, 1,
0.7824384, -0.9830937, 2.721862, 0.8352941, 0, 1, 1,
0.7829943, 0.759774, 1.886302, 0.8431373, 0, 1, 1,
0.7865443, -1.05136, 1.308146, 0.8470588, 0, 1, 1,
0.7961686, -0.7112896, 2.688898, 0.854902, 0, 1, 1,
0.7972532, -1.954998, 3.156134, 0.8588235, 0, 1, 1,
0.7997932, -0.8783962, 1.922662, 0.8666667, 0, 1, 1,
0.7997995, -0.5582988, 3.631944, 0.8705882, 0, 1, 1,
0.8077884, -0.04401759, 2.192813, 0.8784314, 0, 1, 1,
0.8131615, -0.9427347, 2.943552, 0.8823529, 0, 1, 1,
0.81638, 0.9747272, -1.684169, 0.8901961, 0, 1, 1,
0.8181115, 0.2168503, 2.174562, 0.8941177, 0, 1, 1,
0.8234607, -0.4826947, 1.77127, 0.9019608, 0, 1, 1,
0.8269003, 0.0114819, 2.192452, 0.9098039, 0, 1, 1,
0.8315049, 0.5390255, 0.7736807, 0.9137255, 0, 1, 1,
0.833861, -0.960951, 1.160408, 0.9215686, 0, 1, 1,
0.8378972, -0.1944848, 1.717048, 0.9254902, 0, 1, 1,
0.8514391, 1.466514, -1.205701, 0.9333333, 0, 1, 1,
0.8684942, 0.4332771, 1.223563, 0.9372549, 0, 1, 1,
0.86928, -0.07515574, 2.030569, 0.945098, 0, 1, 1,
0.8752663, 0.1536582, 0.4609852, 0.9490196, 0, 1, 1,
0.8781147, 1.057717, -1.405987, 0.9568627, 0, 1, 1,
0.8831369, -1.247214, 3.369332, 0.9607843, 0, 1, 1,
0.9059052, -0.51761, 2.518103, 0.9686275, 0, 1, 1,
0.9064525, -0.547743, 2.530307, 0.972549, 0, 1, 1,
0.9068866, 0.329907, 1.321546, 0.9803922, 0, 1, 1,
0.9079372, -0.4338487, 3.347188, 0.9843137, 0, 1, 1,
0.9093801, -0.2236456, 1.530656, 0.9921569, 0, 1, 1,
0.9099417, 0.639714, 0.4675124, 0.9960784, 0, 1, 1,
0.914055, -0.1810148, 1.043607, 1, 0, 0.9960784, 1,
0.9262208, -0.7027218, 3.829085, 1, 0, 0.9882353, 1,
0.9266099, -2.189193, 2.616313, 1, 0, 0.9843137, 1,
0.9294371, 1.035717, 0.6027126, 1, 0, 0.9764706, 1,
0.9297534, 0.6748381, 0.6186044, 1, 0, 0.972549, 1,
0.9341193, 0.05359288, 0.4542773, 1, 0, 0.9647059, 1,
0.934477, -1.088453, 1.098801, 1, 0, 0.9607843, 1,
0.9353025, 0.4266961, 1.937119, 1, 0, 0.9529412, 1,
0.9488637, -0.4878003, 3.04822, 1, 0, 0.9490196, 1,
0.9527392, 1.602108, 0.5409965, 1, 0, 0.9411765, 1,
0.955479, 0.3359203, 1.821069, 1, 0, 0.9372549, 1,
0.9624926, 0.3924678, 0.2711715, 1, 0, 0.9294118, 1,
0.9668562, -0.7600817, 2.607315, 1, 0, 0.9254902, 1,
0.9699626, 0.3715374, 1.777855, 1, 0, 0.9176471, 1,
0.9749852, -2.283295, 2.162893, 1, 0, 0.9137255, 1,
0.9766841, 1.626128, -0.3334636, 1, 0, 0.9058824, 1,
0.9869397, -0.701776, 2.709763, 1, 0, 0.9019608, 1,
0.9911319, 0.7051432, 1.683699, 1, 0, 0.8941177, 1,
0.9911911, -2.731608, 3.205118, 1, 0, 0.8862745, 1,
0.993951, -0.3003802, 1.764997, 1, 0, 0.8823529, 1,
0.9959697, 0.9631844, 0.359559, 1, 0, 0.8745098, 1,
0.998168, -0.3416947, 1.480806, 1, 0, 0.8705882, 1,
1.00108, -0.4863082, 1.821258, 1, 0, 0.8627451, 1,
1.006459, -0.6001303, 0.9264382, 1, 0, 0.8588235, 1,
1.012473, 1.503528, 0.06240359, 1, 0, 0.8509804, 1,
1.014486, 1.05067, 1.058055, 1, 0, 0.8470588, 1,
1.020977, -0.7454199, 2.945276, 1, 0, 0.8392157, 1,
1.027528, -0.8873217, 2.097025, 1, 0, 0.8352941, 1,
1.027709, -0.03276271, -0.05526493, 1, 0, 0.827451, 1,
1.02959, -0.3405814, 2.223987, 1, 0, 0.8235294, 1,
1.037452, 0.655915, 0.2973463, 1, 0, 0.8156863, 1,
1.037606, 1.51425, 0.8227246, 1, 0, 0.8117647, 1,
1.038396, 0.6099529, 0.6207442, 1, 0, 0.8039216, 1,
1.050307, 0.9423624, -1.219314, 1, 0, 0.7960784, 1,
1.050407, 1.179675, 0.09768125, 1, 0, 0.7921569, 1,
1.06482, -1.33369, 1.474821, 1, 0, 0.7843137, 1,
1.066966, 1.163887, 1.274567, 1, 0, 0.7803922, 1,
1.070241, 0.006151004, 2.466619, 1, 0, 0.772549, 1,
1.074752, 0.7999043, 1.187609, 1, 0, 0.7686275, 1,
1.076795, 0.04399378, 0.1822135, 1, 0, 0.7607843, 1,
1.085407, -0.1048613, 0.7146508, 1, 0, 0.7568628, 1,
1.088762, 0.3816074, 1.530271, 1, 0, 0.7490196, 1,
1.094766, -0.3818065, 2.966349, 1, 0, 0.7450981, 1,
1.095077, -1.835539, 2.478753, 1, 0, 0.7372549, 1,
1.095412, 0.6701566, 2.254756, 1, 0, 0.7333333, 1,
1.105393, 0.08923481, 1.722639, 1, 0, 0.7254902, 1,
1.114306, 0.3581612, 0.8951781, 1, 0, 0.7215686, 1,
1.115829, -1.088039, 1.416103, 1, 0, 0.7137255, 1,
1.123142, 0.9121903, 0.5443049, 1, 0, 0.7098039, 1,
1.124222, 0.4924601, 2.61252, 1, 0, 0.7019608, 1,
1.12683, 0.1860751, 1.358529, 1, 0, 0.6941177, 1,
1.131013, 0.5875069, 1.681349, 1, 0, 0.6901961, 1,
1.138418, -1.329037, 1.673408, 1, 0, 0.682353, 1,
1.139539, -1.55669, 3.084562, 1, 0, 0.6784314, 1,
1.142607, -0.2742651, 1.256677, 1, 0, 0.6705883, 1,
1.148575, 0.5467214, 2.559397, 1, 0, 0.6666667, 1,
1.1547, 0.5210374, 1.56354, 1, 0, 0.6588235, 1,
1.167905, 1.102364, 0.8136792, 1, 0, 0.654902, 1,
1.17166, 0.5343277, 0.8288307, 1, 0, 0.6470588, 1,
1.183142, -0.2917575, 1.642684, 1, 0, 0.6431373, 1,
1.191769, -0.8540578, 1.749251, 1, 0, 0.6352941, 1,
1.194331, -1.288386, 1.348437, 1, 0, 0.6313726, 1,
1.213891, 0.6776833, 1.774975, 1, 0, 0.6235294, 1,
1.218524, -1.248361, 1.440928, 1, 0, 0.6196079, 1,
1.223614, -0.9543579, 3.175318, 1, 0, 0.6117647, 1,
1.237868, 0.8413194, -1.70727, 1, 0, 0.6078432, 1,
1.246604, -0.6093333, 1.473345, 1, 0, 0.6, 1,
1.253217, 1.262089, 0.6554273, 1, 0, 0.5921569, 1,
1.268456, 0.1483354, 2.423846, 1, 0, 0.5882353, 1,
1.268915, 0.7809086, -0.05416552, 1, 0, 0.5803922, 1,
1.276721, 2.217417, -0.5323222, 1, 0, 0.5764706, 1,
1.279024, 0.6741722, 1.819243, 1, 0, 0.5686275, 1,
1.296859, -0.1055534, 2.140251, 1, 0, 0.5647059, 1,
1.299075, 0.5298101, -1.201355, 1, 0, 0.5568628, 1,
1.301548, 2.205469, 1.23359, 1, 0, 0.5529412, 1,
1.306653, -0.7298746, 0.8192613, 1, 0, 0.5450981, 1,
1.315621, 1.021463, 1.123006, 1, 0, 0.5411765, 1,
1.316312, 1.259858, -0.3790331, 1, 0, 0.5333334, 1,
1.318962, 0.1372372, 2.602173, 1, 0, 0.5294118, 1,
1.32245, -1.367775, 3.162249, 1, 0, 0.5215687, 1,
1.326931, 0.1607219, 0.3617288, 1, 0, 0.5176471, 1,
1.331425, -1.667386, 4.113135, 1, 0, 0.509804, 1,
1.335868, -1.305334, 3.252627, 1, 0, 0.5058824, 1,
1.350744, -1.06551, 1.229308, 1, 0, 0.4980392, 1,
1.359962, -0.6710209, 4.375967, 1, 0, 0.4901961, 1,
1.371093, 0.3678312, 0.2032405, 1, 0, 0.4862745, 1,
1.373811, -1.337019, 2.28015, 1, 0, 0.4784314, 1,
1.376121, 0.8423539, 0.6447232, 1, 0, 0.4745098, 1,
1.382265, -1.814631, 4.156272, 1, 0, 0.4666667, 1,
1.39228, 1.208789, 0.4809676, 1, 0, 0.4627451, 1,
1.402398, 1.241385, 1.776134, 1, 0, 0.454902, 1,
1.410354, -0.02722438, 2.097421, 1, 0, 0.4509804, 1,
1.412678, -0.2543044, 1.509192, 1, 0, 0.4431373, 1,
1.41279, 0.02511548, 0.5420847, 1, 0, 0.4392157, 1,
1.415102, -0.04342777, 1.598123, 1, 0, 0.4313726, 1,
1.419148, -0.2145248, 3.111978, 1, 0, 0.427451, 1,
1.44022, -0.2058295, 1.684104, 1, 0, 0.4196078, 1,
1.442271, -0.6490911, 1.558852, 1, 0, 0.4156863, 1,
1.44911, -0.1786233, 3.404993, 1, 0, 0.4078431, 1,
1.455176, -0.09217952, 1.700966, 1, 0, 0.4039216, 1,
1.459895, -0.4233585, 1.589563, 1, 0, 0.3960784, 1,
1.464414, -0.5435833, 1.999033, 1, 0, 0.3882353, 1,
1.473993, 0.2358091, 1.251559, 1, 0, 0.3843137, 1,
1.475231, -0.3619239, 0.8732135, 1, 0, 0.3764706, 1,
1.475564, 0.2742675, 2.4275, 1, 0, 0.372549, 1,
1.481556, 0.1081653, 0.7388449, 1, 0, 0.3647059, 1,
1.497594, 0.3554119, 1.599165, 1, 0, 0.3607843, 1,
1.498063, -1.887586, 0.985249, 1, 0, 0.3529412, 1,
1.503376, -1.015002, 2.01963, 1, 0, 0.3490196, 1,
1.512067, -1.605912, 0.7244846, 1, 0, 0.3411765, 1,
1.517627, 0.5434846, 0.840974, 1, 0, 0.3372549, 1,
1.522109, 0.2232874, 0.8384583, 1, 0, 0.3294118, 1,
1.522912, -0.6355363, 1.84984, 1, 0, 0.3254902, 1,
1.52516, 0.01511462, -0.2296159, 1, 0, 0.3176471, 1,
1.525709, 0.8565081, 1.9605, 1, 0, 0.3137255, 1,
1.542423, 0.4915637, 2.292719, 1, 0, 0.3058824, 1,
1.545889, 2.0088, 1.287981, 1, 0, 0.2980392, 1,
1.548957, 2.928512, 1.005427, 1, 0, 0.2941177, 1,
1.57075, 0.5468956, 2.148915, 1, 0, 0.2862745, 1,
1.590066, -1.673779, 2.384132, 1, 0, 0.282353, 1,
1.59077, 0.3612389, 1.559021, 1, 0, 0.2745098, 1,
1.610536, -1.646125, 2.608408, 1, 0, 0.2705882, 1,
1.658936, -0.4636989, 1.430335, 1, 0, 0.2627451, 1,
1.660533, -1.481806, 4.030931, 1, 0, 0.2588235, 1,
1.661034, 0.1356189, 0.9865838, 1, 0, 0.2509804, 1,
1.662389, 1.580314, -0.6512687, 1, 0, 0.2470588, 1,
1.671436, -0.1895003, 1.538772, 1, 0, 0.2392157, 1,
1.705014, -0.4839774, 3.029445, 1, 0, 0.2352941, 1,
1.707477, 0.1470995, 0.7593732, 1, 0, 0.227451, 1,
1.709796, -1.878944, 2.980311, 1, 0, 0.2235294, 1,
1.715473, 0.7084731, 1.106976, 1, 0, 0.2156863, 1,
1.717054, -0.377245, 2.567022, 1, 0, 0.2117647, 1,
1.720848, 0.1067858, 0.7951452, 1, 0, 0.2039216, 1,
1.724211, -0.6870076, 3.236149, 1, 0, 0.1960784, 1,
1.74139, -0.1295424, 0.1432074, 1, 0, 0.1921569, 1,
1.783413, -0.08658527, 1.851182, 1, 0, 0.1843137, 1,
1.859607, 0.2971042, 1.105616, 1, 0, 0.1803922, 1,
1.876712, 0.2232703, 1.194453, 1, 0, 0.172549, 1,
1.880309, 0.7941216, 1.286843, 1, 0, 0.1686275, 1,
1.883944, 0.1164062, 1.944282, 1, 0, 0.1607843, 1,
1.891284, -0.705496, 0.8578494, 1, 0, 0.1568628, 1,
1.90096, -0.5951233, 1.870234, 1, 0, 0.1490196, 1,
1.976176, 0.3711525, 2.176551, 1, 0, 0.145098, 1,
1.989952, 0.6171921, 1.531488, 1, 0, 0.1372549, 1,
1.992918, 0.6249365, -1.086658, 1, 0, 0.1333333, 1,
2.002393, 1.761884, 1.043936, 1, 0, 0.1254902, 1,
2.012794, 0.5060098, 0.1570643, 1, 0, 0.1215686, 1,
2.037247, -0.8352008, 1.855027, 1, 0, 0.1137255, 1,
2.046383, 0.5485336, 3.346542, 1, 0, 0.1098039, 1,
2.074731, 0.9174185, 0.23115, 1, 0, 0.1019608, 1,
2.075956, -1.818048, 1.140868, 1, 0, 0.09411765, 1,
2.085672, -0.2560568, 2.179138, 1, 0, 0.09019608, 1,
2.119419, 0.105713, 2.519975, 1, 0, 0.08235294, 1,
2.141644, 0.02849148, 2.453259, 1, 0, 0.07843138, 1,
2.155359, -2.389697, 1.746113, 1, 0, 0.07058824, 1,
2.159713, 0.9627921, -0.1091795, 1, 0, 0.06666667, 1,
2.229161, -0.2050994, 1.840094, 1, 0, 0.05882353, 1,
2.496656, 2.487165, -1.34706, 1, 0, 0.05490196, 1,
2.498771, -0.421303, 2.009337, 1, 0, 0.04705882, 1,
2.601937, 0.4635381, 2.767651, 1, 0, 0.04313726, 1,
2.74965, 0.2900579, 1.118983, 1, 0, 0.03529412, 1,
2.834553, 1.453679, 1.018731, 1, 0, 0.03137255, 1,
2.93606, 0.4531253, 1.184198, 1, 0, 0.02352941, 1,
3.155513, -0.5302968, 1.687969, 1, 0, 0.01960784, 1,
3.1693, -0.2016855, 1.267153, 1, 0, 0.01176471, 1,
3.202154, 0.2155283, 1.083802, 1, 0, 0.007843138, 1
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
-0.1132462, -4.007427, -7.352078, 0, -0.5, 0.5, 0.5,
-0.1132462, -4.007427, -7.352078, 1, -0.5, 0.5, 0.5,
-0.1132462, -4.007427, -7.352078, 1, 1.5, 0.5, 0.5,
-0.1132462, -4.007427, -7.352078, 0, 1.5, 0.5, 0.5
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
-4.552567, -0.0368315, -7.352078, 0, -0.5, 0.5, 0.5,
-4.552567, -0.0368315, -7.352078, 1, -0.5, 0.5, 0.5,
-4.552567, -0.0368315, -7.352078, 1, 1.5, 0.5, 0.5,
-4.552567, -0.0368315, -7.352078, 0, 1.5, 0.5, 0.5
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
-4.552567, -4.007427, -0.2679224, 0, -0.5, 0.5, 0.5,
-4.552567, -4.007427, -0.2679224, 1, -0.5, 0.5, 0.5,
-4.552567, -4.007427, -0.2679224, 1, 1.5, 0.5, 0.5,
-4.552567, -4.007427, -0.2679224, 0, 1.5, 0.5, 0.5
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
-3, -3.091136, -5.717273,
3, -3.091136, -5.717273,
-3, -3.091136, -5.717273,
-3, -3.243851, -5.989741,
-2, -3.091136, -5.717273,
-2, -3.243851, -5.989741,
-1, -3.091136, -5.717273,
-1, -3.243851, -5.989741,
0, -3.091136, -5.717273,
0, -3.243851, -5.989741,
1, -3.091136, -5.717273,
1, -3.243851, -5.989741,
2, -3.091136, -5.717273,
2, -3.243851, -5.989741,
3, -3.091136, -5.717273,
3, -3.243851, -5.989741
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
-3, -3.549281, -6.534676, 0, -0.5, 0.5, 0.5,
-3, -3.549281, -6.534676, 1, -0.5, 0.5, 0.5,
-3, -3.549281, -6.534676, 1, 1.5, 0.5, 0.5,
-3, -3.549281, -6.534676, 0, 1.5, 0.5, 0.5,
-2, -3.549281, -6.534676, 0, -0.5, 0.5, 0.5,
-2, -3.549281, -6.534676, 1, -0.5, 0.5, 0.5,
-2, -3.549281, -6.534676, 1, 1.5, 0.5, 0.5,
-2, -3.549281, -6.534676, 0, 1.5, 0.5, 0.5,
-1, -3.549281, -6.534676, 0, -0.5, 0.5, 0.5,
-1, -3.549281, -6.534676, 1, -0.5, 0.5, 0.5,
-1, -3.549281, -6.534676, 1, 1.5, 0.5, 0.5,
-1, -3.549281, -6.534676, 0, 1.5, 0.5, 0.5,
0, -3.549281, -6.534676, 0, -0.5, 0.5, 0.5,
0, -3.549281, -6.534676, 1, -0.5, 0.5, 0.5,
0, -3.549281, -6.534676, 1, 1.5, 0.5, 0.5,
0, -3.549281, -6.534676, 0, 1.5, 0.5, 0.5,
1, -3.549281, -6.534676, 0, -0.5, 0.5, 0.5,
1, -3.549281, -6.534676, 1, -0.5, 0.5, 0.5,
1, -3.549281, -6.534676, 1, 1.5, 0.5, 0.5,
1, -3.549281, -6.534676, 0, 1.5, 0.5, 0.5,
2, -3.549281, -6.534676, 0, -0.5, 0.5, 0.5,
2, -3.549281, -6.534676, 1, -0.5, 0.5, 0.5,
2, -3.549281, -6.534676, 1, 1.5, 0.5, 0.5,
2, -3.549281, -6.534676, 0, 1.5, 0.5, 0.5,
3, -3.549281, -6.534676, 0, -0.5, 0.5, 0.5,
3, -3.549281, -6.534676, 1, -0.5, 0.5, 0.5,
3, -3.549281, -6.534676, 1, 1.5, 0.5, 0.5,
3, -3.549281, -6.534676, 0, 1.5, 0.5, 0.5
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
-3.528108, -3, -5.717273,
-3.528108, 2, -5.717273,
-3.528108, -3, -5.717273,
-3.698851, -3, -5.989741,
-3.528108, -2, -5.717273,
-3.698851, -2, -5.989741,
-3.528108, -1, -5.717273,
-3.698851, -1, -5.989741,
-3.528108, 0, -5.717273,
-3.698851, 0, -5.989741,
-3.528108, 1, -5.717273,
-3.698851, 1, -5.989741,
-3.528108, 2, -5.717273,
-3.698851, 2, -5.989741
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
-4.040338, -3, -6.534676, 0, -0.5, 0.5, 0.5,
-4.040338, -3, -6.534676, 1, -0.5, 0.5, 0.5,
-4.040338, -3, -6.534676, 1, 1.5, 0.5, 0.5,
-4.040338, -3, -6.534676, 0, 1.5, 0.5, 0.5,
-4.040338, -2, -6.534676, 0, -0.5, 0.5, 0.5,
-4.040338, -2, -6.534676, 1, -0.5, 0.5, 0.5,
-4.040338, -2, -6.534676, 1, 1.5, 0.5, 0.5,
-4.040338, -2, -6.534676, 0, 1.5, 0.5, 0.5,
-4.040338, -1, -6.534676, 0, -0.5, 0.5, 0.5,
-4.040338, -1, -6.534676, 1, -0.5, 0.5, 0.5,
-4.040338, -1, -6.534676, 1, 1.5, 0.5, 0.5,
-4.040338, -1, -6.534676, 0, 1.5, 0.5, 0.5,
-4.040338, 0, -6.534676, 0, -0.5, 0.5, 0.5,
-4.040338, 0, -6.534676, 1, -0.5, 0.5, 0.5,
-4.040338, 0, -6.534676, 1, 1.5, 0.5, 0.5,
-4.040338, 0, -6.534676, 0, 1.5, 0.5, 0.5,
-4.040338, 1, -6.534676, 0, -0.5, 0.5, 0.5,
-4.040338, 1, -6.534676, 1, -0.5, 0.5, 0.5,
-4.040338, 1, -6.534676, 1, 1.5, 0.5, 0.5,
-4.040338, 1, -6.534676, 0, 1.5, 0.5, 0.5,
-4.040338, 2, -6.534676, 0, -0.5, 0.5, 0.5,
-4.040338, 2, -6.534676, 1, -0.5, 0.5, 0.5,
-4.040338, 2, -6.534676, 1, 1.5, 0.5, 0.5,
-4.040338, 2, -6.534676, 0, 1.5, 0.5, 0.5
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
-3.528108, -3.091136, -4,
-3.528108, -3.091136, 4,
-3.528108, -3.091136, -4,
-3.698851, -3.243851, -4,
-3.528108, -3.091136, -2,
-3.698851, -3.243851, -2,
-3.528108, -3.091136, 0,
-3.698851, -3.243851, 0,
-3.528108, -3.091136, 2,
-3.698851, -3.243851, 2,
-3.528108, -3.091136, 4,
-3.698851, -3.243851, 4
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
-4.040338, -3.549281, -4, 0, -0.5, 0.5, 0.5,
-4.040338, -3.549281, -4, 1, -0.5, 0.5, 0.5,
-4.040338, -3.549281, -4, 1, 1.5, 0.5, 0.5,
-4.040338, -3.549281, -4, 0, 1.5, 0.5, 0.5,
-4.040338, -3.549281, -2, 0, -0.5, 0.5, 0.5,
-4.040338, -3.549281, -2, 1, -0.5, 0.5, 0.5,
-4.040338, -3.549281, -2, 1, 1.5, 0.5, 0.5,
-4.040338, -3.549281, -2, 0, 1.5, 0.5, 0.5,
-4.040338, -3.549281, 0, 0, -0.5, 0.5, 0.5,
-4.040338, -3.549281, 0, 1, -0.5, 0.5, 0.5,
-4.040338, -3.549281, 0, 1, 1.5, 0.5, 0.5,
-4.040338, -3.549281, 0, 0, 1.5, 0.5, 0.5,
-4.040338, -3.549281, 2, 0, -0.5, 0.5, 0.5,
-4.040338, -3.549281, 2, 1, -0.5, 0.5, 0.5,
-4.040338, -3.549281, 2, 1, 1.5, 0.5, 0.5,
-4.040338, -3.549281, 2, 0, 1.5, 0.5, 0.5,
-4.040338, -3.549281, 4, 0, -0.5, 0.5, 0.5,
-4.040338, -3.549281, 4, 1, -0.5, 0.5, 0.5,
-4.040338, -3.549281, 4, 1, 1.5, 0.5, 0.5,
-4.040338, -3.549281, 4, 0, 1.5, 0.5, 0.5
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
-3.528108, -3.091136, -5.717273,
-3.528108, 3.017473, -5.717273,
-3.528108, -3.091136, 5.181428,
-3.528108, 3.017473, 5.181428,
-3.528108, -3.091136, -5.717273,
-3.528108, -3.091136, 5.181428,
-3.528108, 3.017473, -5.717273,
-3.528108, 3.017473, 5.181428,
-3.528108, -3.091136, -5.717273,
3.301616, -3.091136, -5.717273,
-3.528108, -3.091136, 5.181428,
3.301616, -3.091136, 5.181428,
-3.528108, 3.017473, -5.717273,
3.301616, 3.017473, -5.717273,
-3.528108, 3.017473, 5.181428,
3.301616, 3.017473, 5.181428,
3.301616, -3.091136, -5.717273,
3.301616, 3.017473, -5.717273,
3.301616, -3.091136, 5.181428,
3.301616, 3.017473, 5.181428,
3.301616, -3.091136, -5.717273,
3.301616, -3.091136, 5.181428,
3.301616, 3.017473, -5.717273,
3.301616, 3.017473, 5.181428
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
var radius = 7.603214;
var distance = 33.82756;
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
mvMatrix.translate( 0.1132462, 0.0368315, 0.2679224 );
mvMatrix.scale( 1.203672, 1.345764, 0.7542866 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.82756);
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
pyrazoxyfen<-read.table("pyrazoxyfen.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-pyrazoxyfen$V2
```

```
## Error in eval(expr, envir, enclos): object 'pyrazoxyfen' not found
```

```r
y<-pyrazoxyfen$V3
```

```
## Error in eval(expr, envir, enclos): object 'pyrazoxyfen' not found
```

```r
z<-pyrazoxyfen$V4
```

```
## Error in eval(expr, envir, enclos): object 'pyrazoxyfen' not found
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
-3.428646, -0.6286125, -0.6677958, 0, 0, 1, 1, 1,
-2.926606, 0.459517, -2.578408, 1, 0, 0, 1, 1,
-2.719209, -0.8391486, -1.201985, 1, 0, 0, 1, 1,
-2.642993, 0.5262269, -2.483475, 1, 0, 0, 1, 1,
-2.549183, -0.3299839, -1.099303, 1, 0, 0, 1, 1,
-2.523883, 2.067968, -0.1935799, 1, 0, 0, 1, 1,
-2.448115, -1.030143, -1.921602, 0, 0, 0, 1, 1,
-2.430436, 0.6123605, -2.501484, 0, 0, 0, 1, 1,
-2.287027, 0.5168777, -0.6128604, 0, 0, 0, 1, 1,
-2.265737, -0.3400439, -1.231572, 0, 0, 0, 1, 1,
-2.250374, -0.7598896, 0.1196012, 0, 0, 0, 1, 1,
-2.199106, -0.3738531, -3.458326, 0, 0, 0, 1, 1,
-2.184929, 1.118747, -1.004576, 0, 0, 0, 1, 1,
-2.1507, -0.4732725, -1.179607, 1, 1, 1, 1, 1,
-2.120884, 1.122192, -0.880091, 1, 1, 1, 1, 1,
-2.111981, -0.5165977, -0.005611273, 1, 1, 1, 1, 1,
-2.106045, -0.2779441, -0.8188235, 1, 1, 1, 1, 1,
-2.089789, 0.9752485, -1.310289, 1, 1, 1, 1, 1,
-2.033815, 0.5844547, -1.14369, 1, 1, 1, 1, 1,
-1.999769, -1.80257, -5.11548, 1, 1, 1, 1, 1,
-1.975151, 1.825125, -1.059833, 1, 1, 1, 1, 1,
-1.962507, 1.115712, -2.126803, 1, 1, 1, 1, 1,
-1.957476, -0.4939774, 0.04925164, 1, 1, 1, 1, 1,
-1.931859, 0.1071212, -0.6022717, 1, 1, 1, 1, 1,
-1.930788, -0.4818854, -0.4153214, 1, 1, 1, 1, 1,
-1.920669, -1.046346, -1.951119, 1, 1, 1, 1, 1,
-1.920437, -0.1827062, -1.793693, 1, 1, 1, 1, 1,
-1.915683, 0.6062924, -1.057363, 1, 1, 1, 1, 1,
-1.895991, 0.7207851, -0.9885343, 0, 0, 1, 1, 1,
-1.885166, 0.2618853, -1.948015, 1, 0, 0, 1, 1,
-1.870694, -1.481518, -3.680171, 1, 0, 0, 1, 1,
-1.819188, 1.607932, 0.5222124, 1, 0, 0, 1, 1,
-1.795072, -0.01835894, -3.299569, 1, 0, 0, 1, 1,
-1.794332, -0.3542724, -0.9879614, 1, 0, 0, 1, 1,
-1.791992, -1.676518, -3.155327, 0, 0, 0, 1, 1,
-1.768772, -0.04920914, -3.320444, 0, 0, 0, 1, 1,
-1.756626, 0.549059, -2.282302, 0, 0, 0, 1, 1,
-1.756011, -0.5378737, -0.6703446, 0, 0, 0, 1, 1,
-1.75218, -1.369935, -1.437535, 0, 0, 0, 1, 1,
-1.743406, -2.721472, -4.090807, 0, 0, 0, 1, 1,
-1.738114, -1.005411, -3.086793, 0, 0, 0, 1, 1,
-1.726954, 0.8537266, -1.392229, 1, 1, 1, 1, 1,
-1.703432, -0.4432328, -3.333905, 1, 1, 1, 1, 1,
-1.695239, -3.002175, -3.472244, 1, 1, 1, 1, 1,
-1.689201, -1.283334, -3.541183, 1, 1, 1, 1, 1,
-1.665127, -0.3878802, -1.257442, 1, 1, 1, 1, 1,
-1.659696, -0.617353, -3.460996, 1, 1, 1, 1, 1,
-1.647907, 1.499592, -1.225991, 1, 1, 1, 1, 1,
-1.637834, 0.3235008, -0.6326077, 1, 1, 1, 1, 1,
-1.636061, 1.452647, -1.347656, 1, 1, 1, 1, 1,
-1.631011, 0.3807456, -1.233575, 1, 1, 1, 1, 1,
-1.616698, 0.1851594, -1.166684, 1, 1, 1, 1, 1,
-1.581887, -0.7378204, -1.214783, 1, 1, 1, 1, 1,
-1.576291, 0.8834783, -1.526151, 1, 1, 1, 1, 1,
-1.575952, 1.070037, 0.3103074, 1, 1, 1, 1, 1,
-1.553929, 1.293332, -0.3914634, 1, 1, 1, 1, 1,
-1.551052, -0.3198955, -3.924602, 0, 0, 1, 1, 1,
-1.518535, -0.577134, -1.912289, 1, 0, 0, 1, 1,
-1.512937, -1.266244, -1.221421, 1, 0, 0, 1, 1,
-1.505975, -0.09907053, -0.6520966, 1, 0, 0, 1, 1,
-1.499564, 1.658713, 0.687434, 1, 0, 0, 1, 1,
-1.494444, -1.13083, 0.1894925, 1, 0, 0, 1, 1,
-1.491087, 0.7865708, -0.1355044, 0, 0, 0, 1, 1,
-1.482018, -0.9227933, -3.505522, 0, 0, 0, 1, 1,
-1.467888, 0.1073927, -2.683048, 0, 0, 0, 1, 1,
-1.45783, -0.6563582, -0.6297375, 0, 0, 0, 1, 1,
-1.449448, 0.376168, -1.70541, 0, 0, 0, 1, 1,
-1.447872, 0.9537776, -1.298431, 0, 0, 0, 1, 1,
-1.441141, 1.284288, -0.1186268, 0, 0, 0, 1, 1,
-1.440917, 0.4242244, -0.3070349, 1, 1, 1, 1, 1,
-1.431396, -0.4923896, -4.292974, 1, 1, 1, 1, 1,
-1.421492, 0.9413936, -1.878508, 1, 1, 1, 1, 1,
-1.42137, -0.1475866, -0.08885794, 1, 1, 1, 1, 1,
-1.414706, 0.3336096, 0.02527913, 1, 1, 1, 1, 1,
-1.409662, -1.020798, -1.252423, 1, 1, 1, 1, 1,
-1.392934, 0.02303308, -1.398776, 1, 1, 1, 1, 1,
-1.391001, -0.1553227, -2.493297, 1, 1, 1, 1, 1,
-1.363669, -0.7111495, -1.62283, 1, 1, 1, 1, 1,
-1.356095, 0.5642965, -1.083779, 1, 1, 1, 1, 1,
-1.352818, -1.24399, -3.704854, 1, 1, 1, 1, 1,
-1.350019, -0.1201685, -0.7087311, 1, 1, 1, 1, 1,
-1.349841, 2.052245, -2.09434, 1, 1, 1, 1, 1,
-1.346804, 1.844579, -1.912002, 1, 1, 1, 1, 1,
-1.337, 1.998912, 0.6058932, 1, 1, 1, 1, 1,
-1.335392, 0.8845384, -0.1565432, 0, 0, 1, 1, 1,
-1.330048, -0.02834472, -1.568646, 1, 0, 0, 1, 1,
-1.324021, -0.1514041, -2.109939, 1, 0, 0, 1, 1,
-1.316902, -1.191109, -3.883179, 1, 0, 0, 1, 1,
-1.315828, 0.2220082, -1.488458, 1, 0, 0, 1, 1,
-1.313544, 0.08249658, -1.696358, 1, 0, 0, 1, 1,
-1.310677, -0.6945917, -0.2806693, 0, 0, 0, 1, 1,
-1.306498, -0.2894637, -0.3339138, 0, 0, 0, 1, 1,
-1.301585, 1.242666, -2.543337, 0, 0, 0, 1, 1,
-1.285748, -1.636625, -2.347564, 0, 0, 0, 1, 1,
-1.277439, 1.296044, -0.2851403, 0, 0, 0, 1, 1,
-1.274243, -0.6652441, -1.153853, 0, 0, 0, 1, 1,
-1.265252, 0.3858077, -1.304153, 0, 0, 0, 1, 1,
-1.25379, 0.472043, -2.328331, 1, 1, 1, 1, 1,
-1.251023, 0.3361824, -1.167235, 1, 1, 1, 1, 1,
-1.246694, 0.1079484, -1.559222, 1, 1, 1, 1, 1,
-1.244055, 0.8821489, -2.463365, 1, 1, 1, 1, 1,
-1.236853, 0.1585226, -0.9226885, 1, 1, 1, 1, 1,
-1.229989, -0.624594, -0.5017322, 1, 1, 1, 1, 1,
-1.228029, 0.4525418, -2.175973, 1, 1, 1, 1, 1,
-1.207226, -0.250827, -1.261728, 1, 1, 1, 1, 1,
-1.202877, 0.3778638, -0.2905837, 1, 1, 1, 1, 1,
-1.193985, -0.8751595, -2.906979, 1, 1, 1, 1, 1,
-1.189459, 0.02614817, -1.740919, 1, 1, 1, 1, 1,
-1.185927, 0.551253, -0.9358302, 1, 1, 1, 1, 1,
-1.180023, -1.349448, -3.149592, 1, 1, 1, 1, 1,
-1.171452, -0.718642, -0.2774005, 1, 1, 1, 1, 1,
-1.169709, 0.7889231, -1.035074, 1, 1, 1, 1, 1,
-1.166168, -0.1195604, -1.788509, 0, 0, 1, 1, 1,
-1.16002, 0.4521931, -0.6231458, 1, 0, 0, 1, 1,
-1.158066, 0.7531796, -0.1300767, 1, 0, 0, 1, 1,
-1.157002, -0.6350149, -1.983963, 1, 0, 0, 1, 1,
-1.156731, -0.8562157, -1.048445, 1, 0, 0, 1, 1,
-1.148268, -0.2171824, -0.4610811, 1, 0, 0, 1, 1,
-1.143768, 0.5450471, -1.417952, 0, 0, 0, 1, 1,
-1.142845, 0.4818111, -1.941538, 0, 0, 0, 1, 1,
-1.136622, -0.5196484, -5.172834, 0, 0, 0, 1, 1,
-1.134962, 1.09215, -0.5613124, 0, 0, 0, 1, 1,
-1.133432, -0.7972425, -3.038295, 0, 0, 0, 1, 1,
-1.126706, 0.4195447, -2.016889, 0, 0, 0, 1, 1,
-1.118902, -0.586753, -0.8436549, 0, 0, 0, 1, 1,
-1.117107, -0.8380781, -1.098626, 1, 1, 1, 1, 1,
-1.116525, -0.1481315, -1.194634, 1, 1, 1, 1, 1,
-1.109164, -0.7122443, -1.95262, 1, 1, 1, 1, 1,
-1.107749, 0.4775856, -0.9681934, 1, 1, 1, 1, 1,
-1.10294, 0.05350558, -0.1631495, 1, 1, 1, 1, 1,
-1.100856, -0.003195861, -1.864733, 1, 1, 1, 1, 1,
-1.095557, 0.8946316, -2.983496, 1, 1, 1, 1, 1,
-1.080583, -0.9978908, -2.223462, 1, 1, 1, 1, 1,
-1.0776, -1.128095, -1.458734, 1, 1, 1, 1, 1,
-1.07559, -0.1998718, -0.6448489, 1, 1, 1, 1, 1,
-1.073992, 1.736245, -1.331154, 1, 1, 1, 1, 1,
-1.054743, -0.8682804, -1.810892, 1, 1, 1, 1, 1,
-1.052812, 0.4219806, -1.057272, 1, 1, 1, 1, 1,
-1.046776, 1.285735, -0.003329, 1, 1, 1, 1, 1,
-1.044281, 0.3426833, -2.304308, 1, 1, 1, 1, 1,
-1.042393, 0.7356412, -0.5581776, 0, 0, 1, 1, 1,
-1.040417, -0.2421753, -3.551539, 1, 0, 0, 1, 1,
-1.034602, -0.2815067, -1.637714, 1, 0, 0, 1, 1,
-1.01669, -1.310995, -1.953315, 1, 0, 0, 1, 1,
-1.011916, -0.06346795, -1.944093, 1, 0, 0, 1, 1,
-1.009885, 1.501171, -2.052626, 1, 0, 0, 1, 1,
-1.004021, 1.028993, -1.810141, 0, 0, 0, 1, 1,
-0.9967616, -0.09129064, -0.4529291, 0, 0, 0, 1, 1,
-0.9956558, 1.541699, 1.818476, 0, 0, 0, 1, 1,
-0.991178, -0.4075652, -0.2945957, 0, 0, 0, 1, 1,
-0.9896311, 0.367658, -0.6954501, 0, 0, 0, 1, 1,
-0.9891484, 0.6410578, -1.116589, 0, 0, 0, 1, 1,
-0.9862278, 0.2693197, -0.9477816, 0, 0, 0, 1, 1,
-0.982349, -2.245724, -1.977754, 1, 1, 1, 1, 1,
-0.9780774, -0.2681645, -2.189575, 1, 1, 1, 1, 1,
-0.9762646, -0.7561653, -0.9739335, 1, 1, 1, 1, 1,
-0.9737816, 1.263956, 0.06396481, 1, 1, 1, 1, 1,
-0.968565, -0.1168331, -0.321155, 1, 1, 1, 1, 1,
-0.9666005, -1.382745, -2.28202, 1, 1, 1, 1, 1,
-0.9612007, 0.2121824, -3.343751, 1, 1, 1, 1, 1,
-0.9599027, -0.115844, -2.785745, 1, 1, 1, 1, 1,
-0.9587597, -1.186512, -0.6725032, 1, 1, 1, 1, 1,
-0.9576371, 0.4178877, -0.7866495, 1, 1, 1, 1, 1,
-0.9540839, -0.2575333, -2.049762, 1, 1, 1, 1, 1,
-0.9519731, -0.8382041, -1.29978, 1, 1, 1, 1, 1,
-0.9510679, -0.4226924, -1.831172, 1, 1, 1, 1, 1,
-0.9493769, 0.2534144, -2.519038, 1, 1, 1, 1, 1,
-0.949118, -0.5878607, -2.453593, 1, 1, 1, 1, 1,
-0.9479131, -1.112065, -1.062788, 0, 0, 1, 1, 1,
-0.9448617, -1.340259, -1.147882, 1, 0, 0, 1, 1,
-0.9441038, 0.09692407, -1.361965, 1, 0, 0, 1, 1,
-0.9439678, 2.499952, -0.3841028, 1, 0, 0, 1, 1,
-0.942853, -1.412462, -2.67886, 1, 0, 0, 1, 1,
-0.9422305, -0.4862045, -1.722116, 1, 0, 0, 1, 1,
-0.9413831, 1.162811, 0.8302382, 0, 0, 0, 1, 1,
-0.9255456, 0.1963461, -0.1032888, 0, 0, 0, 1, 1,
-0.9252525, 0.05260679, -1.418431, 0, 0, 0, 1, 1,
-0.9230257, -0.4051366, -2.459138, 0, 0, 0, 1, 1,
-0.9208987, 1.872223, -1.219959, 0, 0, 0, 1, 1,
-0.9199822, 0.2445726, -1.391505, 0, 0, 0, 1, 1,
-0.9174805, -0.4086671, -2.83651, 0, 0, 0, 1, 1,
-0.914074, 0.8709471, -0.5658434, 1, 1, 1, 1, 1,
-0.9035668, -0.9109557, -1.163466, 1, 1, 1, 1, 1,
-0.9030342, 0.2434869, -1.508769, 1, 1, 1, 1, 1,
-0.8891088, 0.282607, -3.35223, 1, 1, 1, 1, 1,
-0.8881844, 1.205722, -2.08142, 1, 1, 1, 1, 1,
-0.8861044, 0.4312893, -3.680735, 1, 1, 1, 1, 1,
-0.8857205, 0.4041232, -0.5553414, 1, 1, 1, 1, 1,
-0.8838812, -0.3136653, -0.6055749, 1, 1, 1, 1, 1,
-0.8828404, 0.5142067, 0.007550893, 1, 1, 1, 1, 1,
-0.88147, 0.8578038, 0.3550162, 1, 1, 1, 1, 1,
-0.8804141, -1.470665, -1.660218, 1, 1, 1, 1, 1,
-0.8759926, -1.115482, -4.560953, 1, 1, 1, 1, 1,
-0.8731889, 1.684127, -0.04071315, 1, 1, 1, 1, 1,
-0.8706822, 2.241746, -1.005543, 1, 1, 1, 1, 1,
-0.8540542, 1.217998, 0.09719031, 1, 1, 1, 1, 1,
-0.8522761, -0.3875761, -1.26671, 0, 0, 1, 1, 1,
-0.851709, -0.9276922, -1.443474, 1, 0, 0, 1, 1,
-0.8495702, 0.3600007, -0.6886121, 1, 0, 0, 1, 1,
-0.8397172, 0.213633, -0.2385545, 1, 0, 0, 1, 1,
-0.8337111, 0.3033004, -0.4042765, 1, 0, 0, 1, 1,
-0.8313766, 1.977591, -0.4593768, 1, 0, 0, 1, 1,
-0.8295063, 0.2743472, -2.969714, 0, 0, 0, 1, 1,
-0.8251768, -1.556374, -3.368808, 0, 0, 0, 1, 1,
-0.8242536, -0.2495524, -3.128254, 0, 0, 0, 1, 1,
-0.822794, 0.6447173, -1.665045, 0, 0, 0, 1, 1,
-0.819878, 0.3018134, 0.9484596, 0, 0, 0, 1, 1,
-0.8184811, 1.073619, -0.4487972, 0, 0, 0, 1, 1,
-0.8170189, -1.336457, -1.546686, 0, 0, 0, 1, 1,
-0.8150598, -0.2155305, -2.296587, 1, 1, 1, 1, 1,
-0.8131154, 0.6614617, -0.5404914, 1, 1, 1, 1, 1,
-0.8130845, -0.5668652, -0.9660661, 1, 1, 1, 1, 1,
-0.8118324, 0.01915247, -1.872145, 1, 1, 1, 1, 1,
-0.8070952, 0.902095, -0.07735579, 1, 1, 1, 1, 1,
-0.7962385, 0.4740042, -0.5052077, 1, 1, 1, 1, 1,
-0.795906, -0.5706161, -1.5756, 1, 1, 1, 1, 1,
-0.7889768, -0.2664026, -2.500397, 1, 1, 1, 1, 1,
-0.7835464, 0.9498948, -0.09428268, 1, 1, 1, 1, 1,
-0.7763622, 1.050749, -0.7922953, 1, 1, 1, 1, 1,
-0.774948, 0.6517811, 1.55524, 1, 1, 1, 1, 1,
-0.7747268, 0.1872384, -2.719707, 1, 1, 1, 1, 1,
-0.7687377, -0.2824331, -1.038063, 1, 1, 1, 1, 1,
-0.7618864, 1.203923, -1.683437, 1, 1, 1, 1, 1,
-0.7599815, -0.2376921, -3.114682, 1, 1, 1, 1, 1,
-0.753554, 0.4732122, -0.4355243, 0, 0, 1, 1, 1,
-0.751963, 0.2471273, 0.3221558, 1, 0, 0, 1, 1,
-0.7514811, 0.4817546, -1.774764, 1, 0, 0, 1, 1,
-0.7429267, -0.6192859, -2.43821, 1, 0, 0, 1, 1,
-0.7337744, 0.2447127, -1.112082, 1, 0, 0, 1, 1,
-0.7322958, -2.431903, -4.983807, 1, 0, 0, 1, 1,
-0.7284272, -0.6489831, -1.700461, 0, 0, 0, 1, 1,
-0.7282043, -0.947147, -2.311371, 0, 0, 0, 1, 1,
-0.7224981, 0.3217765, -1.248736, 0, 0, 0, 1, 1,
-0.7218798, -0.4963864, -4.405606, 0, 0, 0, 1, 1,
-0.7204199, -1.547198, -1.449989, 0, 0, 0, 1, 1,
-0.7150658, 0.01650839, 0.5235296, 0, 0, 0, 1, 1,
-0.710917, -0.2848715, -1.903156, 0, 0, 0, 1, 1,
-0.7102997, 0.1366119, -0.5676835, 1, 1, 1, 1, 1,
-0.7033767, 1.315518, -1.989259, 1, 1, 1, 1, 1,
-0.6995981, -0.9437193, -2.454427, 1, 1, 1, 1, 1,
-0.6922145, -0.5789772, -1.656062, 1, 1, 1, 1, 1,
-0.6921943, -0.1870758, -2.688153, 1, 1, 1, 1, 1,
-0.6910556, -1.641882, -2.781548, 1, 1, 1, 1, 1,
-0.6880403, 0.2464945, -1.997379, 1, 1, 1, 1, 1,
-0.6855688, -1.83437, -1.812127, 1, 1, 1, 1, 1,
-0.6837789, -2.104609, -1.939742, 1, 1, 1, 1, 1,
-0.68229, 0.3198786, -1.169666, 1, 1, 1, 1, 1,
-0.6811715, 0.2861813, -1.05242, 1, 1, 1, 1, 1,
-0.6780762, -0.8669394, -1.561569, 1, 1, 1, 1, 1,
-0.6738346, -1.792691, -1.117739, 1, 1, 1, 1, 1,
-0.6676729, -0.7143321, -2.48476, 1, 1, 1, 1, 1,
-0.6673127, 2.15147, 1.807568, 1, 1, 1, 1, 1,
-0.6662911, 1.427423, -1.544327, 0, 0, 1, 1, 1,
-0.6642109, 0.5690393, -0.8031152, 1, 0, 0, 1, 1,
-0.6553228, 1.559242, 0.794449, 1, 0, 0, 1, 1,
-0.6429665, 1.218359, -0.2159808, 1, 0, 0, 1, 1,
-0.6388888, 1.531351, -0.3001656, 1, 0, 0, 1, 1,
-0.6376783, 0.5766872, -0.6664404, 1, 0, 0, 1, 1,
-0.6354648, 0.9896516, -0.7223333, 0, 0, 0, 1, 1,
-0.6324946, 1.232557, -1.294777, 0, 0, 0, 1, 1,
-0.6297607, -0.8271345, -3.215419, 0, 0, 0, 1, 1,
-0.6278304, 0.3554006, -1.330871, 0, 0, 0, 1, 1,
-0.6212084, 2.093411, 0.08499423, 0, 0, 0, 1, 1,
-0.6203051, -1.173118, -3.635254, 0, 0, 0, 1, 1,
-0.6161069, 0.064968, -1.329582, 0, 0, 0, 1, 1,
-0.613773, 0.4411961, 0.3842497, 1, 1, 1, 1, 1,
-0.6125283, 0.01467748, -2.029329, 1, 1, 1, 1, 1,
-0.6072966, -1.128226, -2.6485, 1, 1, 1, 1, 1,
-0.6010921, 1.029796, -0.3884895, 1, 1, 1, 1, 1,
-0.5988314, -0.9760371, -3.261982, 1, 1, 1, 1, 1,
-0.595732, 0.4206023, -2.452307, 1, 1, 1, 1, 1,
-0.5955067, 0.7298828, -1.958977, 1, 1, 1, 1, 1,
-0.5891744, -0.392974, -1.563278, 1, 1, 1, 1, 1,
-0.5886681, 0.03416064, -1.684731, 1, 1, 1, 1, 1,
-0.5851681, 0.7055819, -0.2750182, 1, 1, 1, 1, 1,
-0.5850354, 1.259021, 1.966005, 1, 1, 1, 1, 1,
-0.5841227, 0.350918, -0.330674, 1, 1, 1, 1, 1,
-0.5818868, 0.3283785, -0.006614427, 1, 1, 1, 1, 1,
-0.5815438, 1.22726, -1.161077, 1, 1, 1, 1, 1,
-0.5775062, 0.5859906, -1.021832, 1, 1, 1, 1, 1,
-0.5769574, 0.03799679, -1.128045, 0, 0, 1, 1, 1,
-0.5657371, 0.5055471, 0.2860844, 1, 0, 0, 1, 1,
-0.5653997, -0.8013788, -3.271379, 1, 0, 0, 1, 1,
-0.5643269, -0.4541874, -2.095245, 1, 0, 0, 1, 1,
-0.5641366, -0.716486, -2.442513, 1, 0, 0, 1, 1,
-0.557872, 0.7103704, -0.1851725, 1, 0, 0, 1, 1,
-0.5575202, 0.345588, -0.5302757, 0, 0, 0, 1, 1,
-0.556887, -2.775663, -2.58374, 0, 0, 0, 1, 1,
-0.5513963, 1.126474, -1.019922, 0, 0, 0, 1, 1,
-0.5513935, 0.005908376, -0.6733716, 0, 0, 0, 1, 1,
-0.5478983, -2.002326, -3.069946, 0, 0, 0, 1, 1,
-0.5474324, -0.6659064, -1.827792, 0, 0, 0, 1, 1,
-0.5439715, 0.4151273, -0.4567832, 0, 0, 0, 1, 1,
-0.5407643, 0.07385089, -1.929399, 1, 1, 1, 1, 1,
-0.53929, 0.5825049, -0.4513185, 1, 1, 1, 1, 1,
-0.537543, -0.7964575, -2.05094, 1, 1, 1, 1, 1,
-0.5344905, -0.5816738, -2.108019, 1, 1, 1, 1, 1,
-0.5336311, 1.10385, -0.4675712, 1, 1, 1, 1, 1,
-0.5230579, 1.111845, -0.25625, 1, 1, 1, 1, 1,
-0.5207296, 0.3835666, -3.249637, 1, 1, 1, 1, 1,
-0.5129699, 0.5186166, -1.37016, 1, 1, 1, 1, 1,
-0.505365, 1.130422, -1.351722, 1, 1, 1, 1, 1,
-0.5046695, 0.2502334, -1.230435, 1, 1, 1, 1, 1,
-0.4976575, 0.8206856, 0.5737843, 1, 1, 1, 1, 1,
-0.4970828, 1.717749, 1.525678, 1, 1, 1, 1, 1,
-0.4877086, 0.1966549, -0.9864435, 1, 1, 1, 1, 1,
-0.4838076, -0.7151778, -1.918521, 1, 1, 1, 1, 1,
-0.4828899, -0.308238, -2.0291, 1, 1, 1, 1, 1,
-0.4785039, -1.056831, -3.315435, 0, 0, 1, 1, 1,
-0.4766115, -0.04838869, -0.9440646, 1, 0, 0, 1, 1,
-0.476556, 1.915878, -0.850166, 1, 0, 0, 1, 1,
-0.4700157, -0.1906597, -0.8345124, 1, 0, 0, 1, 1,
-0.469649, -1.287334, -3.617818, 1, 0, 0, 1, 1,
-0.4616451, -0.6799107, -2.845825, 1, 0, 0, 1, 1,
-0.4555387, 0.1232577, -0.9235734, 0, 0, 0, 1, 1,
-0.4519602, 1.532977, 1.197318, 0, 0, 0, 1, 1,
-0.4513019, 0.9833403, -0.4661095, 0, 0, 0, 1, 1,
-0.4484518, 1.399572, 0.2586718, 0, 0, 0, 1, 1,
-0.4441499, -0.5379311, -0.8036135, 0, 0, 0, 1, 1,
-0.4427179, -0.1464152, -0.3501414, 0, 0, 0, 1, 1,
-0.4407628, 0.007418096, -2.255213, 0, 0, 0, 1, 1,
-0.4403526, -0.1856861, -0.8374661, 1, 1, 1, 1, 1,
-0.4398952, 2.173523, 0.8914489, 1, 1, 1, 1, 1,
-0.4395839, -0.5322568, -1.864796, 1, 1, 1, 1, 1,
-0.4394364, 1.254175, 0.6428373, 1, 1, 1, 1, 1,
-0.4391177, -1.418561, -2.751825, 1, 1, 1, 1, 1,
-0.4371459, -0.3697889, -1.844954, 1, 1, 1, 1, 1,
-0.4352044, -0.8401713, -2.856094, 1, 1, 1, 1, 1,
-0.4331961, -0.837869, -3.287295, 1, 1, 1, 1, 1,
-0.432355, -0.3803603, -3.130614, 1, 1, 1, 1, 1,
-0.4318218, 0.1568056, -2.082143, 1, 1, 1, 1, 1,
-0.4308792, -1.262411, -3.062481, 1, 1, 1, 1, 1,
-0.4297957, 2.527837, 0.1575115, 1, 1, 1, 1, 1,
-0.4276862, -0.2276193, -2.758432, 1, 1, 1, 1, 1,
-0.4265821, -2.51333, -3.604805, 1, 1, 1, 1, 1,
-0.4262848, -0.2486519, -3.99039, 1, 1, 1, 1, 1,
-0.4253159, 1.116413, -1.214213, 0, 0, 1, 1, 1,
-0.421008, 0.2020544, 0.2909557, 1, 0, 0, 1, 1,
-0.4206838, -0.9291775, -1.914993, 1, 0, 0, 1, 1,
-0.4179433, 0.003169817, -1.396569, 1, 0, 0, 1, 1,
-0.4177597, 0.9391673, -2.501822, 1, 0, 0, 1, 1,
-0.4164547, -0.5701717, -3.224744, 1, 0, 0, 1, 1,
-0.4159748, 2.614271, -0.1176463, 0, 0, 0, 1, 1,
-0.414734, -0.601109, -3.288061, 0, 0, 0, 1, 1,
-0.4115921, -0.1140467, -2.109718, 0, 0, 0, 1, 1,
-0.4079077, -0.2269403, -1.400631, 0, 0, 0, 1, 1,
-0.4072053, 0.4123857, 0.8426238, 0, 0, 0, 1, 1,
-0.4051918, -1.858208, -1.745098, 0, 0, 0, 1, 1,
-0.3962291, -1.1805, -2.466011, 0, 0, 0, 1, 1,
-0.3960505, 1.055835, 0.6856155, 1, 1, 1, 1, 1,
-0.3924277, 0.2364722, -2.104573, 1, 1, 1, 1, 1,
-0.3923492, -1.741787, -1.384379, 1, 1, 1, 1, 1,
-0.3831102, -0.9912548, -4.416533, 1, 1, 1, 1, 1,
-0.3751831, -0.1610794, -2.756898, 1, 1, 1, 1, 1,
-0.3745837, -0.1010259, -2.959681, 1, 1, 1, 1, 1,
-0.3740788, 1.838294, 0.1560715, 1, 1, 1, 1, 1,
-0.3737581, 0.2510073, -1.754131, 1, 1, 1, 1, 1,
-0.3699956, 0.6123978, 0.6627587, 1, 1, 1, 1, 1,
-0.3685363, 0.6824184, -0.8191636, 1, 1, 1, 1, 1,
-0.3674403, -1.366171, -1.577219, 1, 1, 1, 1, 1,
-0.3646722, 0.1306692, -1.814991, 1, 1, 1, 1, 1,
-0.3594881, -1.141231, -5.558554, 1, 1, 1, 1, 1,
-0.3592897, 0.1258578, -1.703363, 1, 1, 1, 1, 1,
-0.3578981, 0.4413098, 1.12388, 1, 1, 1, 1, 1,
-0.3550884, -0.3271192, -3.478648, 0, 0, 1, 1, 1,
-0.3505138, -0.5141536, -1.881238, 1, 0, 0, 1, 1,
-0.350363, 1.826779, 0.7187158, 1, 0, 0, 1, 1,
-0.34933, 0.3953924, -0.9848204, 1, 0, 0, 1, 1,
-0.3493137, 1.110815, 1.140635, 1, 0, 0, 1, 1,
-0.3429741, 1.26508, 0.2455582, 1, 0, 0, 1, 1,
-0.3385718, 1.778087, 1.022318, 0, 0, 0, 1, 1,
-0.3361519, -1.450747, -2.791452, 0, 0, 0, 1, 1,
-0.3329917, -1.160701, -3.071242, 0, 0, 0, 1, 1,
-0.3267172, -1.290511, -2.816929, 0, 0, 0, 1, 1,
-0.3247089, -1.572001, -3.028622, 0, 0, 0, 1, 1,
-0.3187651, -0.4277744, -3.673084, 0, 0, 0, 1, 1,
-0.3139178, -0.9384915, -4.134571, 0, 0, 0, 1, 1,
-0.3115235, -0.369967, -0.5732824, 1, 1, 1, 1, 1,
-0.3113185, -0.1653194, -1.403782, 1, 1, 1, 1, 1,
-0.3092312, 0.3096996, -0.984913, 1, 1, 1, 1, 1,
-0.3079458, 0.9159755, -0.6470538, 1, 1, 1, 1, 1,
-0.3077164, -2.848146, -4.064003, 1, 1, 1, 1, 1,
-0.3046, -0.7872262, -3.404853, 1, 1, 1, 1, 1,
-0.3021549, -0.5272987, -2.940784, 1, 1, 1, 1, 1,
-0.300502, 0.9495967, -0.9866085, 1, 1, 1, 1, 1,
-0.2961134, -0.4956676, -3.13399, 1, 1, 1, 1, 1,
-0.294122, -0.2451141, -3.313479, 1, 1, 1, 1, 1,
-0.2940408, -1.799266, -2.710061, 1, 1, 1, 1, 1,
-0.2932499, 0.3101212, -0.1386807, 1, 1, 1, 1, 1,
-0.2920069, -0.4269051, -5.415755, 1, 1, 1, 1, 1,
-0.2898089, 2.390863, 0.4001248, 1, 1, 1, 1, 1,
-0.2897197, -1.148687, -2.360143, 1, 1, 1, 1, 1,
-0.2879289, -0.5710949, -4.587152, 0, 0, 1, 1, 1,
-0.2853115, 0.1832682, -2.246601, 1, 0, 0, 1, 1,
-0.2825056, -0.2154282, 0.1884695, 1, 0, 0, 1, 1,
-0.2722529, -0.8317028, -2.489839, 1, 0, 0, 1, 1,
-0.270408, -1.062656, -4.433307, 1, 0, 0, 1, 1,
-0.2680364, 0.4178327, -0.2802545, 1, 0, 0, 1, 1,
-0.2673986, 0.1608278, -0.3839772, 0, 0, 0, 1, 1,
-0.2647296, -1.552357, -1.208435, 0, 0, 0, 1, 1,
-0.2562481, 0.7548625, -0.5419446, 0, 0, 0, 1, 1,
-0.2538475, -0.005587476, -3.634252, 0, 0, 0, 1, 1,
-0.2525754, 0.193814, -0.1763417, 0, 0, 0, 1, 1,
-0.2500573, -0.3856353, -1.854527, 0, 0, 0, 1, 1,
-0.2489037, -0.7458714, -1.316834, 0, 0, 0, 1, 1,
-0.248283, -2.066772, -3.513239, 1, 1, 1, 1, 1,
-0.2437918, 0.7469729, -0.9476162, 1, 1, 1, 1, 1,
-0.2417664, 0.3391314, -0.3381453, 1, 1, 1, 1, 1,
-0.2407319, 0.08071466, -0.6556745, 1, 1, 1, 1, 1,
-0.2331824, 0.3466874, -1.712562, 1, 1, 1, 1, 1,
-0.2254569, -0.01448328, -2.060887, 1, 1, 1, 1, 1,
-0.2244031, -1.897884, -2.587833, 1, 1, 1, 1, 1,
-0.221756, 0.5067971, 1.068653, 1, 1, 1, 1, 1,
-0.2181377, -0.45788, -2.872403, 1, 1, 1, 1, 1,
-0.217254, -0.1118535, -2.321773, 1, 1, 1, 1, 1,
-0.2171788, -0.5241317, -2.54913, 1, 1, 1, 1, 1,
-0.2046834, -0.5904182, -5.163582, 1, 1, 1, 1, 1,
-0.2030795, -1.185672, -2.295498, 1, 1, 1, 1, 1,
-0.2008155, -1.519423, -3.159073, 1, 1, 1, 1, 1,
-0.200308, -0.6808885, -2.286678, 1, 1, 1, 1, 1,
-0.198264, 1.048063, 0.6557533, 0, 0, 1, 1, 1,
-0.1954726, 0.9339758, -0.873336, 1, 0, 0, 1, 1,
-0.1930069, -0.5287924, -3.550887, 1, 0, 0, 1, 1,
-0.1917306, -0.7387269, -1.193806, 1, 0, 0, 1, 1,
-0.1887799, -1.162346, -3.094497, 1, 0, 0, 1, 1,
-0.1847366, -2.336637, -2.399228, 1, 0, 0, 1, 1,
-0.1839779, 0.5475307, -2.229221, 0, 0, 0, 1, 1,
-0.1831009, -0.8138043, -3.621926, 0, 0, 0, 1, 1,
-0.1775, -1.492572, -2.877571, 0, 0, 0, 1, 1,
-0.1751076, -0.1235178, -2.560651, 0, 0, 0, 1, 1,
-0.1737448, -0.5105881, -2.33798, 0, 0, 0, 1, 1,
-0.1736383, 0.3527146, 0.2264099, 0, 0, 0, 1, 1,
-0.1718303, 0.00732938, -0.1765573, 0, 0, 0, 1, 1,
-0.1685493, -1.240164, -3.511294, 1, 1, 1, 1, 1,
-0.1634445, -0.3762282, -1.968834, 1, 1, 1, 1, 1,
-0.1594556, -0.2485306, -1.159223, 1, 1, 1, 1, 1,
-0.1532032, -1.209936, -2.935297, 1, 1, 1, 1, 1,
-0.151546, 0.221844, 1.545271, 1, 1, 1, 1, 1,
-0.1487415, 0.2159369, 0.1145764, 1, 1, 1, 1, 1,
-0.1448733, -0.1173438, -0.6815557, 1, 1, 1, 1, 1,
-0.1444179, -0.402124, -3.957238, 1, 1, 1, 1, 1,
-0.1419503, -0.06216069, -2.556612, 1, 1, 1, 1, 1,
-0.140327, 1.744783, 0.8652669, 1, 1, 1, 1, 1,
-0.1400236, 0.9694165, -0.07817172, 1, 1, 1, 1, 1,
-0.1396848, -0.9330875, -5.272462, 1, 1, 1, 1, 1,
-0.1392626, -1.778385, -4.583298, 1, 1, 1, 1, 1,
-0.1374885, 1.07748, -1.171776, 1, 1, 1, 1, 1,
-0.1361884, -2.207434, -3.453715, 1, 1, 1, 1, 1,
-0.1349951, 0.8495149, -0.1604508, 0, 0, 1, 1, 1,
-0.1340608, -0.9391677, -1.073512, 1, 0, 0, 1, 1,
-0.1210384, 1.636383, 0.3828423, 1, 0, 0, 1, 1,
-0.1145422, 0.3712191, -0.9764446, 1, 0, 0, 1, 1,
-0.1124752, 0.5570732, -0.6886284, 1, 0, 0, 1, 1,
-0.1120021, -0.8994521, -1.56717, 1, 0, 0, 1, 1,
-0.1115236, 1.400266, -0.4685033, 0, 0, 0, 1, 1,
-0.1113274, -0.09036777, -2.241026, 0, 0, 0, 1, 1,
-0.1111142, -1.345666, -4.033725, 0, 0, 0, 1, 1,
-0.110402, 1.020443, -2.127702, 0, 0, 0, 1, 1,
-0.1097859, -1.004224, -2.969266, 0, 0, 0, 1, 1,
-0.1044118, -1.037755, -5.18534, 0, 0, 0, 1, 1,
-0.1041523, -0.3400128, -2.161473, 0, 0, 0, 1, 1,
-0.1014201, -1.193654, -4.213629, 1, 1, 1, 1, 1,
-0.09959321, -0.112792, -3.144565, 1, 1, 1, 1, 1,
-0.09826891, -0.1136076, -2.886729, 1, 1, 1, 1, 1,
-0.09608679, 1.098687, 1.264044, 1, 1, 1, 1, 1,
-0.09428488, -0.008772864, -1.621631, 1, 1, 1, 1, 1,
-0.09341884, -0.3223854, -1.241382, 1, 1, 1, 1, 1,
-0.09018841, -0.5031551, -2.073101, 1, 1, 1, 1, 1,
-0.0858921, 0.7786916, -1.131187, 1, 1, 1, 1, 1,
-0.08488149, 0.1955036, -0.1825803, 1, 1, 1, 1, 1,
-0.0847778, 0.7967551, 0.2961383, 1, 1, 1, 1, 1,
-0.08442148, 0.4404156, -0.9292389, 1, 1, 1, 1, 1,
-0.08411903, -0.4319209, -2.223335, 1, 1, 1, 1, 1,
-0.08147115, -1.415851, -2.82668, 1, 1, 1, 1, 1,
-0.08063812, 0.4007369, -0.8116424, 1, 1, 1, 1, 1,
-0.07921939, -1.80373, -3.066465, 1, 1, 1, 1, 1,
-0.07725532, 0.5305113, 0.3427765, 0, 0, 1, 1, 1,
-0.07638542, -0.2526953, -2.101308, 1, 0, 0, 1, 1,
-0.07537816, -1.084085, -3.706028, 1, 0, 0, 1, 1,
-0.0742532, 0.1767592, -1.459701, 1, 0, 0, 1, 1,
-0.07406759, -1.515225, -4.094803, 1, 0, 0, 1, 1,
-0.07394702, 0.531736, 0.8143005, 1, 0, 0, 1, 1,
-0.07058443, 0.175876, 1.142624, 0, 0, 0, 1, 1,
-0.06358397, -0.08083089, -2.700501, 0, 0, 0, 1, 1,
-0.06355349, 1.18676, -1.989414, 0, 0, 0, 1, 1,
-0.06079125, 0.1966996, 2.048504, 0, 0, 0, 1, 1,
-0.05990671, -0.8562348, -2.686709, 0, 0, 0, 1, 1,
-0.05956958, -0.202913, -3.213429, 0, 0, 0, 1, 1,
-0.05537176, 0.7063558, -0.322727, 0, 0, 0, 1, 1,
-0.05497056, 0.3666747, 0.2953551, 1, 1, 1, 1, 1,
-0.05344022, -0.1165114, -3.370123, 1, 1, 1, 1, 1,
-0.05234643, 0.07003883, -1.739689, 1, 1, 1, 1, 1,
-0.05200533, -1.712516, -4.039405, 1, 1, 1, 1, 1,
-0.05151964, 0.6652638, 0.01422185, 1, 1, 1, 1, 1,
-0.04760094, 0.6342128, -0.6207284, 1, 1, 1, 1, 1,
-0.04428757, 0.6901426, 0.8011769, 1, 1, 1, 1, 1,
-0.04249391, -0.4150135, -2.854608, 1, 1, 1, 1, 1,
-0.04118448, -0.537349, -3.36315, 1, 1, 1, 1, 1,
-0.04073601, -1.052341, -3.564246, 1, 1, 1, 1, 1,
-0.04066096, 0.6634852, 0.04696583, 1, 1, 1, 1, 1,
-0.04046763, -1.866789, -3.145075, 1, 1, 1, 1, 1,
-0.03807165, -0.3600463, -3.027472, 1, 1, 1, 1, 1,
-0.03717057, -2.929893, -3.418288, 1, 1, 1, 1, 1,
-0.03459625, 0.1979369, 0.4903944, 1, 1, 1, 1, 1,
-0.02769646, 1.669361, 0.5636097, 0, 0, 1, 1, 1,
-0.02603675, 0.5548093, -0.5241053, 1, 0, 0, 1, 1,
-0.0250569, -2.003268, -2.541248, 1, 0, 0, 1, 1,
-0.02455024, -0.3024016, -1.942203, 1, 0, 0, 1, 1,
-0.02270874, -0.1742706, -1.589046, 1, 0, 0, 1, 1,
-0.02001885, -0.3646958, -3.103909, 1, 0, 0, 1, 1,
-0.01989117, 1.591637, -0.168406, 0, 0, 0, 1, 1,
-0.01760115, -0.8664219, -4.257568, 0, 0, 0, 1, 1,
-0.01720278, 1.468498, 1.158513, 0, 0, 0, 1, 1,
-0.0170987, -0.4246198, -2.889418, 0, 0, 0, 1, 1,
-0.01234323, 0.0914904, 1.510833, 0, 0, 0, 1, 1,
-0.005492496, 0.4498562, -2.367129, 0, 0, 0, 1, 1,
-0.003447726, 0.9908825, -0.2608998, 0, 0, 0, 1, 1,
-0.003340984, -0.126578, -2.649005, 1, 1, 1, 1, 1,
-0.002584169, -0.2369007, -2.077142, 1, 1, 1, 1, 1,
-3.005969e-05, 0.969184, -1.33793, 1, 1, 1, 1, 1,
0.0002607074, -1.549864, 2.678885, 1, 1, 1, 1, 1,
0.002255435, -0.06401558, 2.189327, 1, 1, 1, 1, 1,
0.003602254, -1.01808, 2.428173, 1, 1, 1, 1, 1,
0.007687351, -0.6548676, 2.952628, 1, 1, 1, 1, 1,
0.009858001, 0.08125247, -2.091553, 1, 1, 1, 1, 1,
0.01296898, 0.1887202, -1.829508, 1, 1, 1, 1, 1,
0.01370567, -0.07111075, 3.617876, 1, 1, 1, 1, 1,
0.01397427, -0.164855, 2.904648, 1, 1, 1, 1, 1,
0.01468864, 0.4062141, 0.8921486, 1, 1, 1, 1, 1,
0.01497837, -1.820507, 3.3935, 1, 1, 1, 1, 1,
0.01633944, 1.413365, 0.5183551, 1, 1, 1, 1, 1,
0.01880894, -0.2464445, 3.79214, 1, 1, 1, 1, 1,
0.02036583, 2.064347, 1.017743, 0, 0, 1, 1, 1,
0.02112117, -0.0636322, 1.788239, 1, 0, 0, 1, 1,
0.02886839, -0.4563378, 2.91394, 1, 0, 0, 1, 1,
0.03066413, 0.6512025, 0.5092669, 1, 0, 0, 1, 1,
0.03257186, 0.5996013, -0.1619504, 1, 0, 0, 1, 1,
0.03335484, 1.283385, -0.3618833, 1, 0, 0, 1, 1,
0.03681171, 1.399626, 0.3371668, 0, 0, 0, 1, 1,
0.04027968, -0.2693014, 1.099746, 0, 0, 0, 1, 1,
0.04168554, -1.924112, 3.090206, 0, 0, 0, 1, 1,
0.04480745, 0.3243195, -1.587196, 0, 0, 0, 1, 1,
0.04680241, 1.400691, 1.104745, 0, 0, 0, 1, 1,
0.04985742, 0.1111756, 1.451627, 0, 0, 0, 1, 1,
0.05101414, -0.3306458, 5.022709, 0, 0, 0, 1, 1,
0.05127675, 0.4593953, -1.169898, 1, 1, 1, 1, 1,
0.05782538, -0.439216, 0.8177612, 1, 1, 1, 1, 1,
0.05810847, 1.061677, -0.7304403, 1, 1, 1, 1, 1,
0.05910196, -0.01153633, 0.03364918, 1, 1, 1, 1, 1,
0.06541228, -1.082469, 4.085249, 1, 1, 1, 1, 1,
0.06566484, 0.789139, 0.2207605, 1, 1, 1, 1, 1,
0.07046606, -0.873087, 4.515373, 1, 1, 1, 1, 1,
0.07134657, 1.172369, 0.9173806, 1, 1, 1, 1, 1,
0.07156304, 0.7023565, -2.208096, 1, 1, 1, 1, 1,
0.07356498, -1.039194, 2.212861, 1, 1, 1, 1, 1,
0.08095428, -0.1692273, 2.696596, 1, 1, 1, 1, 1,
0.08643752, -0.2026894, 1.559162, 1, 1, 1, 1, 1,
0.08981801, -0.6455254, 3.986141, 1, 1, 1, 1, 1,
0.09593862, 1.075523, 2.215045, 1, 1, 1, 1, 1,
0.09753789, 0.485859, 0.04311435, 1, 1, 1, 1, 1,
0.100529, 0.2840629, -1.576039, 0, 0, 1, 1, 1,
0.1037342, -0.4973148, 2.461051, 1, 0, 0, 1, 1,
0.1041582, 0.09559986, 1.239789, 1, 0, 0, 1, 1,
0.1066883, 1.599535, 0.1519886, 1, 0, 0, 1, 1,
0.1073219, 1.883653, -0.4000587, 1, 0, 0, 1, 1,
0.1143624, -0.1033314, 1.620693, 1, 0, 0, 1, 1,
0.11453, 0.2438295, 0.523944, 0, 0, 0, 1, 1,
0.1150718, 0.284109, -0.2987039, 0, 0, 0, 1, 1,
0.1166802, 1.72516, -0.1971609, 0, 0, 0, 1, 1,
0.1187217, -0.04804118, 1.544499, 0, 0, 0, 1, 1,
0.1192353, 0.7668046, 1.947854, 0, 0, 0, 1, 1,
0.1202522, -0.8390117, 3.05071, 0, 0, 0, 1, 1,
0.1206882, 0.03858502, 0.7412547, 0, 0, 0, 1, 1,
0.1257286, 1.178065, 1.036146, 1, 1, 1, 1, 1,
0.1327856, 0.5146894, 0.9212697, 1, 1, 1, 1, 1,
0.1347833, 0.3749094, 0.8634778, 1, 1, 1, 1, 1,
0.1365827, -0.3515208, 1.749546, 1, 1, 1, 1, 1,
0.1373514, -0.1062889, 2.070411, 1, 1, 1, 1, 1,
0.1422526, 0.6569973, -0.3753622, 1, 1, 1, 1, 1,
0.1476317, 0.2032235, -0.4206814, 1, 1, 1, 1, 1,
0.1500467, 0.370304, 1.605495, 1, 1, 1, 1, 1,
0.1507114, 0.1252232, 1.263652, 1, 1, 1, 1, 1,
0.1524962, 1.174597, 0.3904806, 1, 1, 1, 1, 1,
0.155867, -0.08778531, 1.403936, 1, 1, 1, 1, 1,
0.156227, 0.2455465, -0.4011098, 1, 1, 1, 1, 1,
0.157416, -0.1164678, 4.670446, 1, 1, 1, 1, 1,
0.1608061, -1.553782, 3.58635, 1, 1, 1, 1, 1,
0.161101, 0.2943037, 0.4753024, 1, 1, 1, 1, 1,
0.1643855, 2.096956, 1.115157, 0, 0, 1, 1, 1,
0.1681868, -0.2597721, 2.98196, 1, 0, 0, 1, 1,
0.1717205, 1.31724, 0.348776, 1, 0, 0, 1, 1,
0.1717264, -0.9929008, 3.274174, 1, 0, 0, 1, 1,
0.1725979, 0.52861, -0.03926576, 1, 0, 0, 1, 1,
0.1738635, -1.018239, 2.227667, 1, 0, 0, 1, 1,
0.1799939, -1.126786, 3.956303, 0, 0, 0, 1, 1,
0.1865451, 0.9563681, 0.7557526, 0, 0, 0, 1, 1,
0.1875173, -1.316761, 2.942617, 0, 0, 0, 1, 1,
0.1876837, 0.5485185, 1.684093, 0, 0, 0, 1, 1,
0.1879497, -2.181129, 0.5431592, 0, 0, 0, 1, 1,
0.195015, 1.273368, -1.167878, 0, 0, 0, 1, 1,
0.1969338, -2.487368, 2.765985, 0, 0, 0, 1, 1,
0.2005789, -0.6064333, 2.279796, 1, 1, 1, 1, 1,
0.2012943, -0.9806083, 4.298534, 1, 1, 1, 1, 1,
0.2020711, -0.4120122, 2.51496, 1, 1, 1, 1, 1,
0.2029015, -0.6823315, 3.554479, 1, 1, 1, 1, 1,
0.2093518, -0.0330475, 1.92606, 1, 1, 1, 1, 1,
0.2097582, 1.493946, -0.8316393, 1, 1, 1, 1, 1,
0.2106953, 1.07674, 2.285118, 1, 1, 1, 1, 1,
0.2119864, 0.4095858, 1.0999, 1, 1, 1, 1, 1,
0.2123495, -1.538767, 2.256605, 1, 1, 1, 1, 1,
0.2127527, 0.4826736, -0.7764032, 1, 1, 1, 1, 1,
0.2177488, -0.1284725, 1.189483, 1, 1, 1, 1, 1,
0.2180561, -0.9924228, 3.781968, 1, 1, 1, 1, 1,
0.218151, -0.804303, 3.228176, 1, 1, 1, 1, 1,
0.2207824, 0.480631, 0.6308993, 1, 1, 1, 1, 1,
0.2212303, -0.3671823, 1.928896, 1, 1, 1, 1, 1,
0.2217705, -0.6359361, 3.209847, 0, 0, 1, 1, 1,
0.2235075, -0.9239929, 2.940478, 1, 0, 0, 1, 1,
0.2241388, -0.5576226, 1.825922, 1, 0, 0, 1, 1,
0.2258123, 0.1067716, 1.707683, 1, 0, 0, 1, 1,
0.2270228, -1.199351, 1.989759, 1, 0, 0, 1, 1,
0.2306645, -1.101924, 1.747259, 1, 0, 0, 1, 1,
0.2329528, -0.6152388, 2.760615, 0, 0, 0, 1, 1,
0.2336723, -0.60268, 1.438368, 0, 0, 0, 1, 1,
0.2391837, 0.5094885, -0.4820994, 0, 0, 0, 1, 1,
0.2395058, 0.3420541, 1.728778, 0, 0, 0, 1, 1,
0.2407073, 0.438152, 0.5425093, 0, 0, 0, 1, 1,
0.2407455, -0.2029877, 0.7092467, 0, 0, 0, 1, 1,
0.2408744, -0.9799958, 4.311129, 0, 0, 0, 1, 1,
0.2439223, 0.8993783, 0.3058786, 1, 1, 1, 1, 1,
0.2445561, 0.5499021, 1.046388, 1, 1, 1, 1, 1,
0.2445873, -0.2233747, 2.468162, 1, 1, 1, 1, 1,
0.2513466, -0.3363854, 1.657381, 1, 1, 1, 1, 1,
0.2549356, 0.6977847, -1.1924, 1, 1, 1, 1, 1,
0.2572285, -1.367484, 3.302098, 1, 1, 1, 1, 1,
0.2595132, 0.6256324, -0.8348296, 1, 1, 1, 1, 1,
0.2649911, -1.127163, 3.823636, 1, 1, 1, 1, 1,
0.2685354, -0.3569705, 0.8234565, 1, 1, 1, 1, 1,
0.2693151, -1.282243, 3.205789, 1, 1, 1, 1, 1,
0.2702067, -0.9734414, 3.11565, 1, 1, 1, 1, 1,
0.2704232, 0.4777959, 1.783113, 1, 1, 1, 1, 1,
0.2729623, -0.4363955, 1.622981, 1, 1, 1, 1, 1,
0.2795912, 1.602784, 1.08586, 1, 1, 1, 1, 1,
0.2876241, -1.385786, 4.238503, 1, 1, 1, 1, 1,
0.2897414, -2.171196, 3.107613, 0, 0, 1, 1, 1,
0.2906913, 0.4509094, 1.173043, 1, 0, 0, 1, 1,
0.2926871, 0.5197438, 1.744193, 1, 0, 0, 1, 1,
0.2968937, 0.7224872, -0.4502795, 1, 0, 0, 1, 1,
0.2989348, 1.715435, 0.04477699, 1, 0, 0, 1, 1,
0.3036664, 0.5277904, 1.072541, 1, 0, 0, 1, 1,
0.3040364, 1.15557, -0.395978, 0, 0, 0, 1, 1,
0.3059336, -1.042374, 1.666118, 0, 0, 0, 1, 1,
0.3069702, -1.402628, 4.045389, 0, 0, 0, 1, 1,
0.3142013, 1.268802, -0.1659678, 0, 0, 0, 1, 1,
0.3151963, 1.479554, 0.5511086, 0, 0, 0, 1, 1,
0.315751, -0.5505136, 2.721035, 0, 0, 0, 1, 1,
0.3161248, 1.506522, 1.201968, 0, 0, 0, 1, 1,
0.3162091, -0.2867977, 3.022592, 1, 1, 1, 1, 1,
0.3198754, -0.1582002, 1.696809, 1, 1, 1, 1, 1,
0.3218196, 0.4033071, 1.406685, 1, 1, 1, 1, 1,
0.322683, -0.3584099, 0.8152698, 1, 1, 1, 1, 1,
0.3227939, -0.8526496, 3.358273, 1, 1, 1, 1, 1,
0.3253509, 0.7635841, 3.742016, 1, 1, 1, 1, 1,
0.3309529, 0.04753832, 2.041311, 1, 1, 1, 1, 1,
0.3310867, 0.7797527, -0.5210941, 1, 1, 1, 1, 1,
0.332546, -0.4392917, 2.264151, 1, 1, 1, 1, 1,
0.3334507, 1.593481, -0.5733241, 1, 1, 1, 1, 1,
0.3367262, -0.6927143, 0.7367769, 1, 1, 1, 1, 1,
0.3427804, 0.680153, -0.5905867, 1, 1, 1, 1, 1,
0.3440776, 0.502704, 0.6763155, 1, 1, 1, 1, 1,
0.3457608, -0.1533877, 2.651939, 1, 1, 1, 1, 1,
0.3608205, -0.6394117, 3.268606, 1, 1, 1, 1, 1,
0.3611707, 0.296761, 2.533992, 0, 0, 1, 1, 1,
0.3625827, 0.3285907, -0.3232199, 1, 0, 0, 1, 1,
0.3647497, -1.154212, 3.424469, 1, 0, 0, 1, 1,
0.3688432, 0.2294228, 1.081882, 1, 0, 0, 1, 1,
0.3690903, -1.400808, 2.582038, 1, 0, 0, 1, 1,
0.3705785, -0.2241614, 1.535512, 1, 0, 0, 1, 1,
0.3731159, -0.7066435, 2.839622, 0, 0, 0, 1, 1,
0.375921, 0.9595581, -0.4847772, 0, 0, 0, 1, 1,
0.377563, -0.6958187, 3.477897, 0, 0, 0, 1, 1,
0.3806873, -1.150233, 3.13376, 0, 0, 0, 1, 1,
0.3835062, -1.216917, 1.943663, 0, 0, 0, 1, 1,
0.3840023, -0.7248842, 3.823748, 0, 0, 0, 1, 1,
0.3895481, -0.5638077, 0.7948411, 0, 0, 0, 1, 1,
0.3942071, -0.8045751, 1.94907, 1, 1, 1, 1, 1,
0.3953078, 1.09682, 0.5975006, 1, 1, 1, 1, 1,
0.3980141, -0.03168634, 1.254256, 1, 1, 1, 1, 1,
0.399538, -0.7350376, 3.324434, 1, 1, 1, 1, 1,
0.4003814, -0.003399257, 2.663369, 1, 1, 1, 1, 1,
0.406278, -1.735422, 2.326281, 1, 1, 1, 1, 1,
0.4109762, 0.9908155, -0.0966923, 1, 1, 1, 1, 1,
0.4110595, 0.3559316, 0.8908018, 1, 1, 1, 1, 1,
0.4111157, 1.263238, 0.4238262, 1, 1, 1, 1, 1,
0.4133684, 0.9261485, -0.3027231, 1, 1, 1, 1, 1,
0.413569, -0.4271675, 2.047637, 1, 1, 1, 1, 1,
0.4268234, -1.338249, 3.357018, 1, 1, 1, 1, 1,
0.4279051, -1.019591, 4.469829, 1, 1, 1, 1, 1,
0.4313231, -0.1234164, 1.6072, 1, 1, 1, 1, 1,
0.4346854, -0.8081794, 3.155022, 1, 1, 1, 1, 1,
0.436455, 0.7471796, -0.366216, 0, 0, 1, 1, 1,
0.438165, -0.768212, 1.014674, 1, 0, 0, 1, 1,
0.4410959, -0.1811872, 0.5188753, 1, 0, 0, 1, 1,
0.4415345, -1.042985, 2.395173, 1, 0, 0, 1, 1,
0.4456569, -1.346844, 3.041465, 1, 0, 0, 1, 1,
0.4460382, 1.161101, -0.1563537, 1, 0, 0, 1, 1,
0.4536598, 1.667152, -0.09946839, 0, 0, 0, 1, 1,
0.4581425, -0.03053932, 0.2650271, 0, 0, 0, 1, 1,
0.4582092, 0.01763729, 0.5976593, 0, 0, 0, 1, 1,
0.4582959, -0.3276911, 1.52542, 0, 0, 0, 1, 1,
0.4583701, -1.642412, 2.867157, 0, 0, 0, 1, 1,
0.4627408, -0.7686454, 4.42053, 0, 0, 0, 1, 1,
0.463753, 0.3713909, 0.9236789, 0, 0, 0, 1, 1,
0.4652329, -0.2714294, 0.8443236, 1, 1, 1, 1, 1,
0.4693868, -0.3605861, 2.064741, 1, 1, 1, 1, 1,
0.4706267, -1.419954, 2.345482, 1, 1, 1, 1, 1,
0.4734439, 0.2966045, 0.9288488, 1, 1, 1, 1, 1,
0.4783903, -0.9834445, 1.939303, 1, 1, 1, 1, 1,
0.4815392, 1.763841, 0.517799, 1, 1, 1, 1, 1,
0.4822889, 0.800161, 1.247228, 1, 1, 1, 1, 1,
0.4835819, -0.2490718, 2.485074, 1, 1, 1, 1, 1,
0.4835965, 2.298582, -0.7484531, 1, 1, 1, 1, 1,
0.4842764, -0.8852869, 2.577663, 1, 1, 1, 1, 1,
0.487101, -1.23624, 2.010922, 1, 1, 1, 1, 1,
0.4897447, 0.6266569, 0.5950583, 1, 1, 1, 1, 1,
0.4903351, 0.3258909, 2.619377, 1, 1, 1, 1, 1,
0.4962942, -1.573111, 3.158768, 1, 1, 1, 1, 1,
0.4968145, 0.4466352, 1.065729, 1, 1, 1, 1, 1,
0.4983178, 0.7796957, 0.1911393, 0, 0, 1, 1, 1,
0.5024153, -0.7149674, 2.583399, 1, 0, 0, 1, 1,
0.506923, -0.1231453, 1.53089, 1, 0, 0, 1, 1,
0.5088377, 0.1522747, 1.259905, 1, 0, 0, 1, 1,
0.5096878, -1.032093, 4.759478, 1, 0, 0, 1, 1,
0.5115404, -0.9386731, 2.299555, 1, 0, 0, 1, 1,
0.5132688, -0.6381624, 2.166264, 0, 0, 0, 1, 1,
0.5134654, -0.8408766, 2.695641, 0, 0, 0, 1, 1,
0.5145699, 0.08463791, 3.021782, 0, 0, 0, 1, 1,
0.5153682, -0.7865816, 4.016539, 0, 0, 0, 1, 1,
0.5161176, -0.6148279, 1.970736, 0, 0, 0, 1, 1,
0.5183401, -1.035001, 2.807958, 0, 0, 0, 1, 1,
0.5188927, 0.03664825, 0.7073296, 0, 0, 0, 1, 1,
0.5243147, 1.065067, -1.007835, 1, 1, 1, 1, 1,
0.5271831, 1.267027, -0.144, 1, 1, 1, 1, 1,
0.5298044, -0.1830287, 1.147383, 1, 1, 1, 1, 1,
0.5301811, -0.6176119, 0.01783631, 1, 1, 1, 1, 1,
0.5342096, -0.2137764, 1.945524, 1, 1, 1, 1, 1,
0.5479014, 1.602369, 0.4562928, 1, 1, 1, 1, 1,
0.5481136, -0.0520852, 1.244133, 1, 1, 1, 1, 1,
0.5498596, 0.2065492, 1.311421, 1, 1, 1, 1, 1,
0.5505195, 0.1478257, 1.658427, 1, 1, 1, 1, 1,
0.5623604, 0.3030686, 0.8385134, 1, 1, 1, 1, 1,
0.5695334, 0.2557128, -0.3887035, 1, 1, 1, 1, 1,
0.5778131, 1.529076, 0.6434211, 1, 1, 1, 1, 1,
0.577895, 0.9363065, 1.545835, 1, 1, 1, 1, 1,
0.5867588, 0.05266548, 1.865692, 1, 1, 1, 1, 1,
0.5903118, -1.166888, 2.097984, 1, 1, 1, 1, 1,
0.5908877, -0.8945394, 1.34127, 0, 0, 1, 1, 1,
0.5918019, -1.054464, 1.711442, 1, 0, 0, 1, 1,
0.5928784, -0.3869532, 1.867445, 1, 0, 0, 1, 1,
0.5948609, 0.2505389, 1.826424, 1, 0, 0, 1, 1,
0.5965802, -1.032062, 3.083542, 1, 0, 0, 1, 1,
0.5983534, -1.222358, 0.8788115, 1, 0, 0, 1, 1,
0.6020089, -1.477609, 2.681405, 0, 0, 0, 1, 1,
0.6061718, -0.4172634, 1.763015, 0, 0, 0, 1, 1,
0.609647, 0.278757, 2.86674, 0, 0, 0, 1, 1,
0.6253409, 0.02698247, 2.685969, 0, 0, 0, 1, 1,
0.6278276, 1.51948, 1.053589, 0, 0, 0, 1, 1,
0.6283438, 0.9335833, 0.4142951, 0, 0, 0, 1, 1,
0.6314997, -1.152086, 3.144651, 0, 0, 0, 1, 1,
0.6331441, 0.9644175, -0.524898, 1, 1, 1, 1, 1,
0.6333713, 1.23182, -1.251037, 1, 1, 1, 1, 1,
0.6405173, 0.1303538, 1.512309, 1, 1, 1, 1, 1,
0.6459869, 0.7994722, 1.397566, 1, 1, 1, 1, 1,
0.6473034, 0.8329709, -0.431733, 1, 1, 1, 1, 1,
0.6513469, -0.5546147, 2.223105, 1, 1, 1, 1, 1,
0.6542552, 0.5519813, 2.181853, 1, 1, 1, 1, 1,
0.6621065, 0.1023719, 0.9632213, 1, 1, 1, 1, 1,
0.6675718, -0.2817925, 3.55694, 1, 1, 1, 1, 1,
0.6693186, 0.3419167, 2.242547, 1, 1, 1, 1, 1,
0.6764828, 0.08883254, 1.606493, 1, 1, 1, 1, 1,
0.676599, -0.2670673, 2.925728, 1, 1, 1, 1, 1,
0.6848444, 0.2930229, 1.291655, 1, 1, 1, 1, 1,
0.6881396, 0.1993667, 1.594841, 1, 1, 1, 1, 1,
0.6891966, 2.110283, 0.9112324, 1, 1, 1, 1, 1,
0.6945179, -0.9190041, 2.051392, 0, 0, 1, 1, 1,
0.7001221, -0.8426223, 2.056964, 1, 0, 0, 1, 1,
0.7106959, 0.4211552, 0.4321812, 1, 0, 0, 1, 1,
0.7124486, -1.867268, 0.7096007, 1, 0, 0, 1, 1,
0.7188498, -0.3513882, 2.317119, 1, 0, 0, 1, 1,
0.7207198, 1.070227, 3.155849, 1, 0, 0, 1, 1,
0.7221405, 0.09085508, 2.768063, 0, 0, 0, 1, 1,
0.7241678, -0.7728251, 3.252951, 0, 0, 0, 1, 1,
0.7255325, -1.077921, 2.553061, 0, 0, 0, 1, 1,
0.7257617, -0.0268637, -0.1080684, 0, 0, 0, 1, 1,
0.7313972, -0.998663, 2.043312, 0, 0, 0, 1, 1,
0.7379764, 1.524934, 0.2847352, 0, 0, 0, 1, 1,
0.7384414, 0.7297421, 0.8371152, 0, 0, 0, 1, 1,
0.7394503, 0.9693539, 1.254145, 1, 1, 1, 1, 1,
0.7397377, 0.7360227, 0.4974069, 1, 1, 1, 1, 1,
0.7411374, -0.2204823, 1.8592, 1, 1, 1, 1, 1,
0.751909, -0.3698248, 3.225671, 1, 1, 1, 1, 1,
0.7531328, 0.9149894, -0.2774582, 1, 1, 1, 1, 1,
0.7539096, -1.299093, 0.4615714, 1, 1, 1, 1, 1,
0.7556317, -1.182827, 1.954294, 1, 1, 1, 1, 1,
0.7668421, -0.352363, 2.769785, 1, 1, 1, 1, 1,
0.7754054, -1.954179, 2.432822, 1, 1, 1, 1, 1,
0.7824384, -0.9830937, 2.721862, 1, 1, 1, 1, 1,
0.7829943, 0.759774, 1.886302, 1, 1, 1, 1, 1,
0.7865443, -1.05136, 1.308146, 1, 1, 1, 1, 1,
0.7961686, -0.7112896, 2.688898, 1, 1, 1, 1, 1,
0.7972532, -1.954998, 3.156134, 1, 1, 1, 1, 1,
0.7997932, -0.8783962, 1.922662, 1, 1, 1, 1, 1,
0.7997995, -0.5582988, 3.631944, 0, 0, 1, 1, 1,
0.8077884, -0.04401759, 2.192813, 1, 0, 0, 1, 1,
0.8131615, -0.9427347, 2.943552, 1, 0, 0, 1, 1,
0.81638, 0.9747272, -1.684169, 1, 0, 0, 1, 1,
0.8181115, 0.2168503, 2.174562, 1, 0, 0, 1, 1,
0.8234607, -0.4826947, 1.77127, 1, 0, 0, 1, 1,
0.8269003, 0.0114819, 2.192452, 0, 0, 0, 1, 1,
0.8315049, 0.5390255, 0.7736807, 0, 0, 0, 1, 1,
0.833861, -0.960951, 1.160408, 0, 0, 0, 1, 1,
0.8378972, -0.1944848, 1.717048, 0, 0, 0, 1, 1,
0.8514391, 1.466514, -1.205701, 0, 0, 0, 1, 1,
0.8684942, 0.4332771, 1.223563, 0, 0, 0, 1, 1,
0.86928, -0.07515574, 2.030569, 0, 0, 0, 1, 1,
0.8752663, 0.1536582, 0.4609852, 1, 1, 1, 1, 1,
0.8781147, 1.057717, -1.405987, 1, 1, 1, 1, 1,
0.8831369, -1.247214, 3.369332, 1, 1, 1, 1, 1,
0.9059052, -0.51761, 2.518103, 1, 1, 1, 1, 1,
0.9064525, -0.547743, 2.530307, 1, 1, 1, 1, 1,
0.9068866, 0.329907, 1.321546, 1, 1, 1, 1, 1,
0.9079372, -0.4338487, 3.347188, 1, 1, 1, 1, 1,
0.9093801, -0.2236456, 1.530656, 1, 1, 1, 1, 1,
0.9099417, 0.639714, 0.4675124, 1, 1, 1, 1, 1,
0.914055, -0.1810148, 1.043607, 1, 1, 1, 1, 1,
0.9262208, -0.7027218, 3.829085, 1, 1, 1, 1, 1,
0.9266099, -2.189193, 2.616313, 1, 1, 1, 1, 1,
0.9294371, 1.035717, 0.6027126, 1, 1, 1, 1, 1,
0.9297534, 0.6748381, 0.6186044, 1, 1, 1, 1, 1,
0.9341193, 0.05359288, 0.4542773, 1, 1, 1, 1, 1,
0.934477, -1.088453, 1.098801, 0, 0, 1, 1, 1,
0.9353025, 0.4266961, 1.937119, 1, 0, 0, 1, 1,
0.9488637, -0.4878003, 3.04822, 1, 0, 0, 1, 1,
0.9527392, 1.602108, 0.5409965, 1, 0, 0, 1, 1,
0.955479, 0.3359203, 1.821069, 1, 0, 0, 1, 1,
0.9624926, 0.3924678, 0.2711715, 1, 0, 0, 1, 1,
0.9668562, -0.7600817, 2.607315, 0, 0, 0, 1, 1,
0.9699626, 0.3715374, 1.777855, 0, 0, 0, 1, 1,
0.9749852, -2.283295, 2.162893, 0, 0, 0, 1, 1,
0.9766841, 1.626128, -0.3334636, 0, 0, 0, 1, 1,
0.9869397, -0.701776, 2.709763, 0, 0, 0, 1, 1,
0.9911319, 0.7051432, 1.683699, 0, 0, 0, 1, 1,
0.9911911, -2.731608, 3.205118, 0, 0, 0, 1, 1,
0.993951, -0.3003802, 1.764997, 1, 1, 1, 1, 1,
0.9959697, 0.9631844, 0.359559, 1, 1, 1, 1, 1,
0.998168, -0.3416947, 1.480806, 1, 1, 1, 1, 1,
1.00108, -0.4863082, 1.821258, 1, 1, 1, 1, 1,
1.006459, -0.6001303, 0.9264382, 1, 1, 1, 1, 1,
1.012473, 1.503528, 0.06240359, 1, 1, 1, 1, 1,
1.014486, 1.05067, 1.058055, 1, 1, 1, 1, 1,
1.020977, -0.7454199, 2.945276, 1, 1, 1, 1, 1,
1.027528, -0.8873217, 2.097025, 1, 1, 1, 1, 1,
1.027709, -0.03276271, -0.05526493, 1, 1, 1, 1, 1,
1.02959, -0.3405814, 2.223987, 1, 1, 1, 1, 1,
1.037452, 0.655915, 0.2973463, 1, 1, 1, 1, 1,
1.037606, 1.51425, 0.8227246, 1, 1, 1, 1, 1,
1.038396, 0.6099529, 0.6207442, 1, 1, 1, 1, 1,
1.050307, 0.9423624, -1.219314, 1, 1, 1, 1, 1,
1.050407, 1.179675, 0.09768125, 0, 0, 1, 1, 1,
1.06482, -1.33369, 1.474821, 1, 0, 0, 1, 1,
1.066966, 1.163887, 1.274567, 1, 0, 0, 1, 1,
1.070241, 0.006151004, 2.466619, 1, 0, 0, 1, 1,
1.074752, 0.7999043, 1.187609, 1, 0, 0, 1, 1,
1.076795, 0.04399378, 0.1822135, 1, 0, 0, 1, 1,
1.085407, -0.1048613, 0.7146508, 0, 0, 0, 1, 1,
1.088762, 0.3816074, 1.530271, 0, 0, 0, 1, 1,
1.094766, -0.3818065, 2.966349, 0, 0, 0, 1, 1,
1.095077, -1.835539, 2.478753, 0, 0, 0, 1, 1,
1.095412, 0.6701566, 2.254756, 0, 0, 0, 1, 1,
1.105393, 0.08923481, 1.722639, 0, 0, 0, 1, 1,
1.114306, 0.3581612, 0.8951781, 0, 0, 0, 1, 1,
1.115829, -1.088039, 1.416103, 1, 1, 1, 1, 1,
1.123142, 0.9121903, 0.5443049, 1, 1, 1, 1, 1,
1.124222, 0.4924601, 2.61252, 1, 1, 1, 1, 1,
1.12683, 0.1860751, 1.358529, 1, 1, 1, 1, 1,
1.131013, 0.5875069, 1.681349, 1, 1, 1, 1, 1,
1.138418, -1.329037, 1.673408, 1, 1, 1, 1, 1,
1.139539, -1.55669, 3.084562, 1, 1, 1, 1, 1,
1.142607, -0.2742651, 1.256677, 1, 1, 1, 1, 1,
1.148575, 0.5467214, 2.559397, 1, 1, 1, 1, 1,
1.1547, 0.5210374, 1.56354, 1, 1, 1, 1, 1,
1.167905, 1.102364, 0.8136792, 1, 1, 1, 1, 1,
1.17166, 0.5343277, 0.8288307, 1, 1, 1, 1, 1,
1.183142, -0.2917575, 1.642684, 1, 1, 1, 1, 1,
1.191769, -0.8540578, 1.749251, 1, 1, 1, 1, 1,
1.194331, -1.288386, 1.348437, 1, 1, 1, 1, 1,
1.213891, 0.6776833, 1.774975, 0, 0, 1, 1, 1,
1.218524, -1.248361, 1.440928, 1, 0, 0, 1, 1,
1.223614, -0.9543579, 3.175318, 1, 0, 0, 1, 1,
1.237868, 0.8413194, -1.70727, 1, 0, 0, 1, 1,
1.246604, -0.6093333, 1.473345, 1, 0, 0, 1, 1,
1.253217, 1.262089, 0.6554273, 1, 0, 0, 1, 1,
1.268456, 0.1483354, 2.423846, 0, 0, 0, 1, 1,
1.268915, 0.7809086, -0.05416552, 0, 0, 0, 1, 1,
1.276721, 2.217417, -0.5323222, 0, 0, 0, 1, 1,
1.279024, 0.6741722, 1.819243, 0, 0, 0, 1, 1,
1.296859, -0.1055534, 2.140251, 0, 0, 0, 1, 1,
1.299075, 0.5298101, -1.201355, 0, 0, 0, 1, 1,
1.301548, 2.205469, 1.23359, 0, 0, 0, 1, 1,
1.306653, -0.7298746, 0.8192613, 1, 1, 1, 1, 1,
1.315621, 1.021463, 1.123006, 1, 1, 1, 1, 1,
1.316312, 1.259858, -0.3790331, 1, 1, 1, 1, 1,
1.318962, 0.1372372, 2.602173, 1, 1, 1, 1, 1,
1.32245, -1.367775, 3.162249, 1, 1, 1, 1, 1,
1.326931, 0.1607219, 0.3617288, 1, 1, 1, 1, 1,
1.331425, -1.667386, 4.113135, 1, 1, 1, 1, 1,
1.335868, -1.305334, 3.252627, 1, 1, 1, 1, 1,
1.350744, -1.06551, 1.229308, 1, 1, 1, 1, 1,
1.359962, -0.6710209, 4.375967, 1, 1, 1, 1, 1,
1.371093, 0.3678312, 0.2032405, 1, 1, 1, 1, 1,
1.373811, -1.337019, 2.28015, 1, 1, 1, 1, 1,
1.376121, 0.8423539, 0.6447232, 1, 1, 1, 1, 1,
1.382265, -1.814631, 4.156272, 1, 1, 1, 1, 1,
1.39228, 1.208789, 0.4809676, 1, 1, 1, 1, 1,
1.402398, 1.241385, 1.776134, 0, 0, 1, 1, 1,
1.410354, -0.02722438, 2.097421, 1, 0, 0, 1, 1,
1.412678, -0.2543044, 1.509192, 1, 0, 0, 1, 1,
1.41279, 0.02511548, 0.5420847, 1, 0, 0, 1, 1,
1.415102, -0.04342777, 1.598123, 1, 0, 0, 1, 1,
1.419148, -0.2145248, 3.111978, 1, 0, 0, 1, 1,
1.44022, -0.2058295, 1.684104, 0, 0, 0, 1, 1,
1.442271, -0.6490911, 1.558852, 0, 0, 0, 1, 1,
1.44911, -0.1786233, 3.404993, 0, 0, 0, 1, 1,
1.455176, -0.09217952, 1.700966, 0, 0, 0, 1, 1,
1.459895, -0.4233585, 1.589563, 0, 0, 0, 1, 1,
1.464414, -0.5435833, 1.999033, 0, 0, 0, 1, 1,
1.473993, 0.2358091, 1.251559, 0, 0, 0, 1, 1,
1.475231, -0.3619239, 0.8732135, 1, 1, 1, 1, 1,
1.475564, 0.2742675, 2.4275, 1, 1, 1, 1, 1,
1.481556, 0.1081653, 0.7388449, 1, 1, 1, 1, 1,
1.497594, 0.3554119, 1.599165, 1, 1, 1, 1, 1,
1.498063, -1.887586, 0.985249, 1, 1, 1, 1, 1,
1.503376, -1.015002, 2.01963, 1, 1, 1, 1, 1,
1.512067, -1.605912, 0.7244846, 1, 1, 1, 1, 1,
1.517627, 0.5434846, 0.840974, 1, 1, 1, 1, 1,
1.522109, 0.2232874, 0.8384583, 1, 1, 1, 1, 1,
1.522912, -0.6355363, 1.84984, 1, 1, 1, 1, 1,
1.52516, 0.01511462, -0.2296159, 1, 1, 1, 1, 1,
1.525709, 0.8565081, 1.9605, 1, 1, 1, 1, 1,
1.542423, 0.4915637, 2.292719, 1, 1, 1, 1, 1,
1.545889, 2.0088, 1.287981, 1, 1, 1, 1, 1,
1.548957, 2.928512, 1.005427, 1, 1, 1, 1, 1,
1.57075, 0.5468956, 2.148915, 0, 0, 1, 1, 1,
1.590066, -1.673779, 2.384132, 1, 0, 0, 1, 1,
1.59077, 0.3612389, 1.559021, 1, 0, 0, 1, 1,
1.610536, -1.646125, 2.608408, 1, 0, 0, 1, 1,
1.658936, -0.4636989, 1.430335, 1, 0, 0, 1, 1,
1.660533, -1.481806, 4.030931, 1, 0, 0, 1, 1,
1.661034, 0.1356189, 0.9865838, 0, 0, 0, 1, 1,
1.662389, 1.580314, -0.6512687, 0, 0, 0, 1, 1,
1.671436, -0.1895003, 1.538772, 0, 0, 0, 1, 1,
1.705014, -0.4839774, 3.029445, 0, 0, 0, 1, 1,
1.707477, 0.1470995, 0.7593732, 0, 0, 0, 1, 1,
1.709796, -1.878944, 2.980311, 0, 0, 0, 1, 1,
1.715473, 0.7084731, 1.106976, 0, 0, 0, 1, 1,
1.717054, -0.377245, 2.567022, 1, 1, 1, 1, 1,
1.720848, 0.1067858, 0.7951452, 1, 1, 1, 1, 1,
1.724211, -0.6870076, 3.236149, 1, 1, 1, 1, 1,
1.74139, -0.1295424, 0.1432074, 1, 1, 1, 1, 1,
1.783413, -0.08658527, 1.851182, 1, 1, 1, 1, 1,
1.859607, 0.2971042, 1.105616, 1, 1, 1, 1, 1,
1.876712, 0.2232703, 1.194453, 1, 1, 1, 1, 1,
1.880309, 0.7941216, 1.286843, 1, 1, 1, 1, 1,
1.883944, 0.1164062, 1.944282, 1, 1, 1, 1, 1,
1.891284, -0.705496, 0.8578494, 1, 1, 1, 1, 1,
1.90096, -0.5951233, 1.870234, 1, 1, 1, 1, 1,
1.976176, 0.3711525, 2.176551, 1, 1, 1, 1, 1,
1.989952, 0.6171921, 1.531488, 1, 1, 1, 1, 1,
1.992918, 0.6249365, -1.086658, 1, 1, 1, 1, 1,
2.002393, 1.761884, 1.043936, 1, 1, 1, 1, 1,
2.012794, 0.5060098, 0.1570643, 0, 0, 1, 1, 1,
2.037247, -0.8352008, 1.855027, 1, 0, 0, 1, 1,
2.046383, 0.5485336, 3.346542, 1, 0, 0, 1, 1,
2.074731, 0.9174185, 0.23115, 1, 0, 0, 1, 1,
2.075956, -1.818048, 1.140868, 1, 0, 0, 1, 1,
2.085672, -0.2560568, 2.179138, 1, 0, 0, 1, 1,
2.119419, 0.105713, 2.519975, 0, 0, 0, 1, 1,
2.141644, 0.02849148, 2.453259, 0, 0, 0, 1, 1,
2.155359, -2.389697, 1.746113, 0, 0, 0, 1, 1,
2.159713, 0.9627921, -0.1091795, 0, 0, 0, 1, 1,
2.229161, -0.2050994, 1.840094, 0, 0, 0, 1, 1,
2.496656, 2.487165, -1.34706, 0, 0, 0, 1, 1,
2.498771, -0.421303, 2.009337, 0, 0, 0, 1, 1,
2.601937, 0.4635381, 2.767651, 1, 1, 1, 1, 1,
2.74965, 0.2900579, 1.118983, 1, 1, 1, 1, 1,
2.834553, 1.453679, 1.018731, 1, 1, 1, 1, 1,
2.93606, 0.4531253, 1.184198, 1, 1, 1, 1, 1,
3.155513, -0.5302968, 1.687969, 1, 1, 1, 1, 1,
3.1693, -0.2016855, 1.267153, 1, 1, 1, 1, 1,
3.202154, 0.2155283, 1.083802, 1, 1, 1, 1, 1
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
var radius = 9.457357;
var distance = 33.21856;
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
mvMatrix.translate( 0.1132462, 0.03683162, 0.2679224 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.21856);
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
