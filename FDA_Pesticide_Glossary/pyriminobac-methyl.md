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
-3.483727, -1.717055, -1.805967, 1, 0, 0, 1,
-2.964748, 0.5756751, -1.666569, 1, 0.007843138, 0, 1,
-2.696713, 0.08158597, -2.629104, 1, 0.01176471, 0, 1,
-2.605261, 1.006552, 0.3589498, 1, 0.01960784, 0, 1,
-2.591094, 2.365445, 0.4982573, 1, 0.02352941, 0, 1,
-2.449812, -1.336196, -1.706625, 1, 0.03137255, 0, 1,
-2.372336, 0.1471767, -2.509164, 1, 0.03529412, 0, 1,
-2.312621, -0.3948761, -1.79413, 1, 0.04313726, 0, 1,
-2.275763, -0.01618288, -0.4800871, 1, 0.04705882, 0, 1,
-2.265952, 0.2580736, -1.515071, 1, 0.05490196, 0, 1,
-2.166411, 0.9250028, -2.00313, 1, 0.05882353, 0, 1,
-2.14511, 1.544576, -0.7768093, 1, 0.06666667, 0, 1,
-2.087732, -0.5737796, -2.567162, 1, 0.07058824, 0, 1,
-2.08474, 0.8712583, -2.51925, 1, 0.07843138, 0, 1,
-2.034654, -1.022174, -1.314877, 1, 0.08235294, 0, 1,
-2.026082, -1.260677, -0.5721563, 1, 0.09019608, 0, 1,
-2.015139, -0.06231089, -0.2842006, 1, 0.09411765, 0, 1,
-1.99496, 0.5533699, -1.357621, 1, 0.1019608, 0, 1,
-1.979197, 1.150697, -0.1603024, 1, 0.1098039, 0, 1,
-1.97295, 1.983206, 0.1163879, 1, 0.1137255, 0, 1,
-1.971175, -1.014483, -1.330435, 1, 0.1215686, 0, 1,
-1.912408, 1.818953, -0.2864466, 1, 0.1254902, 0, 1,
-1.892097, -0.7426872, -1.164254, 1, 0.1333333, 0, 1,
-1.877646, 0.1943607, -0.9038689, 1, 0.1372549, 0, 1,
-1.867488, 1.790942, 0.08139959, 1, 0.145098, 0, 1,
-1.85642, -1.458743, -1.89585, 1, 0.1490196, 0, 1,
-1.851841, -1.556547, -4.005704, 1, 0.1568628, 0, 1,
-1.828927, 0.7816244, 0.2886506, 1, 0.1607843, 0, 1,
-1.820319, -1.652919, -3.262806, 1, 0.1686275, 0, 1,
-1.814588, -1.132302, -3.619797, 1, 0.172549, 0, 1,
-1.798581, -2.984167, -4.313393, 1, 0.1803922, 0, 1,
-1.773057, 0.4561347, -2.673716, 1, 0.1843137, 0, 1,
-1.763099, -0.03802054, -1.564016, 1, 0.1921569, 0, 1,
-1.761231, -1.636651, -2.773941, 1, 0.1960784, 0, 1,
-1.730032, 0.3594611, -1.768502, 1, 0.2039216, 0, 1,
-1.726461, -1.040025, -3.467786, 1, 0.2117647, 0, 1,
-1.720411, 1.090782, -1.535341, 1, 0.2156863, 0, 1,
-1.709049, 0.4356304, -2.113587, 1, 0.2235294, 0, 1,
-1.708886, -1.042784, -1.041955, 1, 0.227451, 0, 1,
-1.708154, -0.9338908, -1.741555, 1, 0.2352941, 0, 1,
-1.693416, -1.068324, -2.096305, 1, 0.2392157, 0, 1,
-1.692227, -1.209332, -0.6244857, 1, 0.2470588, 0, 1,
-1.689822, -1.750261, -2.036686, 1, 0.2509804, 0, 1,
-1.67983, -0.9421188, -3.130494, 1, 0.2588235, 0, 1,
-1.66456, -0.2604767, -0.5767004, 1, 0.2627451, 0, 1,
-1.660546, -0.09760104, -0.5004865, 1, 0.2705882, 0, 1,
-1.651376, -0.2770706, -2.474644, 1, 0.2745098, 0, 1,
-1.638683, -0.03567401, -0.6390308, 1, 0.282353, 0, 1,
-1.625794, -1.056682, -1.677389, 1, 0.2862745, 0, 1,
-1.619578, -0.1238704, -3.644511, 1, 0.2941177, 0, 1,
-1.615421, -0.8663552, -1.86327, 1, 0.3019608, 0, 1,
-1.604891, -1.427584, -1.409801, 1, 0.3058824, 0, 1,
-1.599957, -1.019523, -2.44756, 1, 0.3137255, 0, 1,
-1.56914, -1.020886, -2.824563, 1, 0.3176471, 0, 1,
-1.566951, -0.9741062, -2.523606, 1, 0.3254902, 0, 1,
-1.550249, 0.03388676, -1.559691, 1, 0.3294118, 0, 1,
-1.546138, 0.1167921, -2.835641, 1, 0.3372549, 0, 1,
-1.52064, -0.008939913, 0.7370507, 1, 0.3411765, 0, 1,
-1.518419, -0.8672797, -0.2499036, 1, 0.3490196, 0, 1,
-1.517499, 0.6644235, -0.5721403, 1, 0.3529412, 0, 1,
-1.515278, -0.41517, -1.537629, 1, 0.3607843, 0, 1,
-1.502921, -0.2419199, -2.789256, 1, 0.3647059, 0, 1,
-1.502049, -0.3564949, -0.8524392, 1, 0.372549, 0, 1,
-1.494217, -1.129407, -2.908776, 1, 0.3764706, 0, 1,
-1.491446, -0.8581117, -1.562691, 1, 0.3843137, 0, 1,
-1.487701, -0.4618587, -1.715568, 1, 0.3882353, 0, 1,
-1.460153, -2.104196, -2.923963, 1, 0.3960784, 0, 1,
-1.455913, 0.329718, -0.610958, 1, 0.4039216, 0, 1,
-1.454538, 0.3076276, -1.68916, 1, 0.4078431, 0, 1,
-1.45236, -1.992663, -3.209371, 1, 0.4156863, 0, 1,
-1.442325, -1.611527, -2.533972, 1, 0.4196078, 0, 1,
-1.422218, -0.1039483, -1.54798, 1, 0.427451, 0, 1,
-1.415258, 1.113253, -1.497316, 1, 0.4313726, 0, 1,
-1.391543, -0.1400519, -2.195905, 1, 0.4392157, 0, 1,
-1.382165, -1.107579, -1.667492, 1, 0.4431373, 0, 1,
-1.368145, 1.176192, -1.275848, 1, 0.4509804, 0, 1,
-1.36397, 0.2020613, -1.452892, 1, 0.454902, 0, 1,
-1.355472, 1.270772, -1.041593, 1, 0.4627451, 0, 1,
-1.354639, -0.5902286, -2.818125, 1, 0.4666667, 0, 1,
-1.34188, 0.502533, 0.6235038, 1, 0.4745098, 0, 1,
-1.33862, -0.7977443, -0.35527, 1, 0.4784314, 0, 1,
-1.33285, -0.8891183, -1.387227, 1, 0.4862745, 0, 1,
-1.330079, -0.7521381, -3.162379, 1, 0.4901961, 0, 1,
-1.32717, -1.124555, -2.00129, 1, 0.4980392, 0, 1,
-1.319617, -1.075598, -1.467789, 1, 0.5058824, 0, 1,
-1.310175, 0.1143978, -2.243467, 1, 0.509804, 0, 1,
-1.300133, -1.45781, -3.109661, 1, 0.5176471, 0, 1,
-1.297845, -0.8701308, -1.3173, 1, 0.5215687, 0, 1,
-1.289632, 0.09324238, -3.015675, 1, 0.5294118, 0, 1,
-1.283597, 0.3121355, -2.364629, 1, 0.5333334, 0, 1,
-1.283266, 0.6057407, -1.135816, 1, 0.5411765, 0, 1,
-1.282635, 0.3884397, -0.3960794, 1, 0.5450981, 0, 1,
-1.282632, -0.5003023, -1.531316, 1, 0.5529412, 0, 1,
-1.253249, -0.8309709, -1.1673, 1, 0.5568628, 0, 1,
-1.251279, 0.3840441, -0.7057033, 1, 0.5647059, 0, 1,
-1.247729, -0.05407499, -1.092547, 1, 0.5686275, 0, 1,
-1.2357, -1.234946, -3.400205, 1, 0.5764706, 0, 1,
-1.228351, -0.5138166, -2.747675, 1, 0.5803922, 0, 1,
-1.223932, -0.726772, -1.531267, 1, 0.5882353, 0, 1,
-1.219659, -0.7580918, -1.306876, 1, 0.5921569, 0, 1,
-1.213517, -0.7099468, -1.462857, 1, 0.6, 0, 1,
-1.213402, -0.05537823, -1.19766, 1, 0.6078432, 0, 1,
-1.200582, -1.19875, -2.357851, 1, 0.6117647, 0, 1,
-1.19891, -0.5304928, -1.951076, 1, 0.6196079, 0, 1,
-1.194098, 0.7282704, -0.0320995, 1, 0.6235294, 0, 1,
-1.193437, 0.224579, -0.5121837, 1, 0.6313726, 0, 1,
-1.174801, 0.7731754, -0.6763815, 1, 0.6352941, 0, 1,
-1.169256, 0.3439777, -0.4865771, 1, 0.6431373, 0, 1,
-1.168465, 0.3358586, -0.4134672, 1, 0.6470588, 0, 1,
-1.157502, -0.2289057, -3.766517, 1, 0.654902, 0, 1,
-1.1516, -1.059611, -2.245177, 1, 0.6588235, 0, 1,
-1.150666, 1.174606, -0.7449489, 1, 0.6666667, 0, 1,
-1.145921, -0.8274472, -0.5043313, 1, 0.6705883, 0, 1,
-1.14212, 0.5166118, -1.032041, 1, 0.6784314, 0, 1,
-1.13517, 0.452574, 1.246401, 1, 0.682353, 0, 1,
-1.122112, 0.5024362, 0.3373415, 1, 0.6901961, 0, 1,
-1.115646, -0.1241188, -1.35569, 1, 0.6941177, 0, 1,
-1.106447, 2.213362, -2.112349, 1, 0.7019608, 0, 1,
-1.106079, -0.5734683, -2.970458, 1, 0.7098039, 0, 1,
-1.103781, -1.196172, -3.107578, 1, 0.7137255, 0, 1,
-1.101256, 0.1199053, -2.76556, 1, 0.7215686, 0, 1,
-1.100237, -0.2580985, -1.755709, 1, 0.7254902, 0, 1,
-1.097802, -2.336211, -1.469103, 1, 0.7333333, 0, 1,
-1.094758, -0.4666979, -2.744633, 1, 0.7372549, 0, 1,
-1.092874, -0.9587814, -3.058394, 1, 0.7450981, 0, 1,
-1.078492, -0.8456534, -3.391763, 1, 0.7490196, 0, 1,
-1.074719, 0.03417035, -0.4542926, 1, 0.7568628, 0, 1,
-1.062048, -0.08823231, -2.319416, 1, 0.7607843, 0, 1,
-1.05741, 0.2206926, -0.4016588, 1, 0.7686275, 0, 1,
-1.038784, 0.2104228, -1.676054, 1, 0.772549, 0, 1,
-1.038406, -1.203575, -3.811479, 1, 0.7803922, 0, 1,
-1.036075, 0.349746, -3.213693, 1, 0.7843137, 0, 1,
-1.035199, -0.8659502, -2.078523, 1, 0.7921569, 0, 1,
-1.033404, 0.3700056, -1.554202, 1, 0.7960784, 0, 1,
-1.029096, -1.32273, -2.81499, 1, 0.8039216, 0, 1,
-1.016671, 0.1032268, -3.466706, 1, 0.8117647, 0, 1,
-1.012361, 1.902403, -1.553414, 1, 0.8156863, 0, 1,
-1.009419, -0.8778874, -2.554222, 1, 0.8235294, 0, 1,
-1.003463, -0.547281, -1.473532, 1, 0.827451, 0, 1,
-1.000216, -0.7317372, -2.119176, 1, 0.8352941, 0, 1,
-0.9985487, 0.5018789, 0.04852184, 1, 0.8392157, 0, 1,
-0.9975248, -0.668193, -2.372768, 1, 0.8470588, 0, 1,
-0.9962513, 0.8781269, -1.848497, 1, 0.8509804, 0, 1,
-0.9912941, 1.226901, 0.6403512, 1, 0.8588235, 0, 1,
-0.9908566, 0.7619066, -0.8656835, 1, 0.8627451, 0, 1,
-0.9840249, -0.6159601, -2.414829, 1, 0.8705882, 0, 1,
-0.9742468, 0.8374959, -1.145001, 1, 0.8745098, 0, 1,
-0.9731416, 0.1079696, -1.111796, 1, 0.8823529, 0, 1,
-0.9717745, -1.329654, -2.276651, 1, 0.8862745, 0, 1,
-0.96849, -1.543302, -2.512287, 1, 0.8941177, 0, 1,
-0.9659313, -0.8564729, -3.066977, 1, 0.8980392, 0, 1,
-0.9628488, -0.4522998, -3.706701, 1, 0.9058824, 0, 1,
-0.9612122, 1.15307, -1.021195, 1, 0.9137255, 0, 1,
-0.9572699, 0.2114345, -0.9257267, 1, 0.9176471, 0, 1,
-0.956282, 0.3506828, -2.334979, 1, 0.9254902, 0, 1,
-0.9522743, 0.384461, -1.521808, 1, 0.9294118, 0, 1,
-0.9455716, -0.8072414, -0.8849822, 1, 0.9372549, 0, 1,
-0.944748, -0.2640581, -1.868194, 1, 0.9411765, 0, 1,
-0.9397448, -1.279495, -1.981987, 1, 0.9490196, 0, 1,
-0.9321079, 1.864205, 0.5040758, 1, 0.9529412, 0, 1,
-0.9298994, 0.2185485, -1.994959, 1, 0.9607843, 0, 1,
-0.9279367, 0.6272183, -0.7364752, 1, 0.9647059, 0, 1,
-0.9275376, 1.439901, -0.6633009, 1, 0.972549, 0, 1,
-0.9274215, -1.224345, -1.138873, 1, 0.9764706, 0, 1,
-0.9272653, -1.160475, -2.226164, 1, 0.9843137, 0, 1,
-0.9184414, -1.539573, -0.5565141, 1, 0.9882353, 0, 1,
-0.916337, -1.171702, -3.358439, 1, 0.9960784, 0, 1,
-0.914076, 1.011428, -0.8020914, 0.9960784, 1, 0, 1,
-0.9083572, 0.6008197, -0.5170958, 0.9921569, 1, 0, 1,
-0.9077246, 0.2243456, -1.272675, 0.9843137, 1, 0, 1,
-0.9024719, 0.4941172, -0.7748435, 0.9803922, 1, 0, 1,
-0.8970631, -0.7666142, -1.200124, 0.972549, 1, 0, 1,
-0.8911806, -0.223125, -0.4541556, 0.9686275, 1, 0, 1,
-0.8848428, 2.369827, -2.085414, 0.9607843, 1, 0, 1,
-0.8760958, -0.718376, -3.246889, 0.9568627, 1, 0, 1,
-0.8759026, 1.078001, -0.5999544, 0.9490196, 1, 0, 1,
-0.874281, -1.833783, -3.509712, 0.945098, 1, 0, 1,
-0.8731132, 0.1340023, -0.8368222, 0.9372549, 1, 0, 1,
-0.8702571, -0.7574388, -1.135362, 0.9333333, 1, 0, 1,
-0.8678429, -2.221177, -1.472264, 0.9254902, 1, 0, 1,
-0.8666689, -0.4452458, -1.99584, 0.9215686, 1, 0, 1,
-0.8660287, 0.7116785, -1.558423, 0.9137255, 1, 0, 1,
-0.8634918, 0.5523678, 0.3973135, 0.9098039, 1, 0, 1,
-0.8603737, 2.00707, 1.048836, 0.9019608, 1, 0, 1,
-0.8579055, -0.5674928, -1.598777, 0.8941177, 1, 0, 1,
-0.8487537, 0.4574094, -2.511395, 0.8901961, 1, 0, 1,
-0.8428576, 1.450547, -2.277371, 0.8823529, 1, 0, 1,
-0.8407294, 0.5503136, -0.1002032, 0.8784314, 1, 0, 1,
-0.8290924, 0.03811997, -4.102217, 0.8705882, 1, 0, 1,
-0.8284485, -2.221249, -3.44124, 0.8666667, 1, 0, 1,
-0.8260615, 0.7596709, -0.0355589, 0.8588235, 1, 0, 1,
-0.8201519, 1.035623, -1.624598, 0.854902, 1, 0, 1,
-0.8181614, -1.454875, -3.933958, 0.8470588, 1, 0, 1,
-0.8176043, 2.515755, 0.2985882, 0.8431373, 1, 0, 1,
-0.8142733, -0.9256093, -2.618586, 0.8352941, 1, 0, 1,
-0.809064, -0.3732891, -1.338709, 0.8313726, 1, 0, 1,
-0.8066857, 0.5093265, -0.350331, 0.8235294, 1, 0, 1,
-0.8061777, 0.3806857, -1.67253, 0.8196079, 1, 0, 1,
-0.8013699, -0.3160745, -2.26056, 0.8117647, 1, 0, 1,
-0.7944882, -0.2701893, -0.8956944, 0.8078431, 1, 0, 1,
-0.792601, -0.2994229, -2.818111, 0.8, 1, 0, 1,
-0.791083, 1.440049, -1.166831, 0.7921569, 1, 0, 1,
-0.7862329, 0.295864, -1.331809, 0.7882353, 1, 0, 1,
-0.7808209, -0.8074165, -2.843487, 0.7803922, 1, 0, 1,
-0.7786586, -0.3069042, -0.02884214, 0.7764706, 1, 0, 1,
-0.7779154, 0.3295164, -1.605057, 0.7686275, 1, 0, 1,
-0.7688941, 0.8721594, -0.7828068, 0.7647059, 1, 0, 1,
-0.762259, 0.7924288, 0.2330264, 0.7568628, 1, 0, 1,
-0.7620004, 0.8250452, -0.6066884, 0.7529412, 1, 0, 1,
-0.7544938, 1.339381, -2.350817, 0.7450981, 1, 0, 1,
-0.7505023, -0.7240547, -2.65951, 0.7411765, 1, 0, 1,
-0.7500908, -3.160715, -2.6201, 0.7333333, 1, 0, 1,
-0.7491757, -0.3927694, -2.005875, 0.7294118, 1, 0, 1,
-0.7460149, 1.231098, -1.356477, 0.7215686, 1, 0, 1,
-0.7426178, 0.9285303, 2.17107, 0.7176471, 1, 0, 1,
-0.7424212, 2.082809, -2.808768, 0.7098039, 1, 0, 1,
-0.7392406, 0.499683, -3.047451, 0.7058824, 1, 0, 1,
-0.7391939, 0.009803342, 0.6514519, 0.6980392, 1, 0, 1,
-0.7335057, -1.243946, -3.049572, 0.6901961, 1, 0, 1,
-0.7333706, -0.1425759, -0.5794508, 0.6862745, 1, 0, 1,
-0.7327858, 0.3054933, -1.288859, 0.6784314, 1, 0, 1,
-0.731064, -0.5177981, -3.354131, 0.6745098, 1, 0, 1,
-0.7307293, 0.3784246, -1.549328, 0.6666667, 1, 0, 1,
-0.7295182, 0.2176946, 0.1421669, 0.6627451, 1, 0, 1,
-0.7282501, -0.09901197, -1.551193, 0.654902, 1, 0, 1,
-0.7243099, 0.1792349, -1.461195, 0.6509804, 1, 0, 1,
-0.720633, 0.8267148, -0.4568842, 0.6431373, 1, 0, 1,
-0.7201994, 0.7681245, -1.549952, 0.6392157, 1, 0, 1,
-0.7124315, -1.640149, -3.277069, 0.6313726, 1, 0, 1,
-0.7112964, -0.5080507, -4.057498, 0.627451, 1, 0, 1,
-0.710042, -2.102578, -2.314889, 0.6196079, 1, 0, 1,
-0.7098166, 0.5575269, -1.95344, 0.6156863, 1, 0, 1,
-0.7095713, 1.835688, 0.5502506, 0.6078432, 1, 0, 1,
-0.7074291, -0.9787533, -1.569475, 0.6039216, 1, 0, 1,
-0.7050604, 1.307745, -0.3897048, 0.5960785, 1, 0, 1,
-0.7027424, -0.2957634, -3.265482, 0.5882353, 1, 0, 1,
-0.6965834, -1.309932, -2.086929, 0.5843138, 1, 0, 1,
-0.6945655, -0.346442, -1.471641, 0.5764706, 1, 0, 1,
-0.6944022, 1.282571, -2.285947, 0.572549, 1, 0, 1,
-0.693186, 1.466993, -2.463701, 0.5647059, 1, 0, 1,
-0.689733, 0.0221664, -4.327526, 0.5607843, 1, 0, 1,
-0.6886239, -0.6412396, -2.78241, 0.5529412, 1, 0, 1,
-0.6878631, 1.221531, 1.185879, 0.5490196, 1, 0, 1,
-0.6859903, 0.6352761, -1.045987, 0.5411765, 1, 0, 1,
-0.6778108, -0.1110498, -2.356273, 0.5372549, 1, 0, 1,
-0.677301, 0.4297905, -1.315677, 0.5294118, 1, 0, 1,
-0.6762405, 0.2969222, 0.5983768, 0.5254902, 1, 0, 1,
-0.6678914, -0.6999158, -1.294091, 0.5176471, 1, 0, 1,
-0.6645926, 0.01696244, -1.13976, 0.5137255, 1, 0, 1,
-0.6621903, 2.481923, 1.119165, 0.5058824, 1, 0, 1,
-0.6620603, -0.4330414, -2.887328, 0.5019608, 1, 0, 1,
-0.6614767, -1.87226, -1.733577, 0.4941176, 1, 0, 1,
-0.6591225, -0.5756272, -0.3200961, 0.4862745, 1, 0, 1,
-0.6561946, 1.02049, 0.06142341, 0.4823529, 1, 0, 1,
-0.6426653, 1.034166, -0.8890574, 0.4745098, 1, 0, 1,
-0.6385567, -0.81862, -2.118768, 0.4705882, 1, 0, 1,
-0.637306, -0.6924514, -3.359952, 0.4627451, 1, 0, 1,
-0.6352549, 1.545815, -0.2431242, 0.4588235, 1, 0, 1,
-0.6238877, 0.52848, 0.0926736, 0.4509804, 1, 0, 1,
-0.6129156, 0.5564858, -1.393418, 0.4470588, 1, 0, 1,
-0.6094812, -0.4640668, -5.167609, 0.4392157, 1, 0, 1,
-0.6085514, 1.614252, -0.1762521, 0.4352941, 1, 0, 1,
-0.5986562, -1.451446, -1.584654, 0.427451, 1, 0, 1,
-0.5946921, 0.852718, -0.4442481, 0.4235294, 1, 0, 1,
-0.5908505, -0.2113392, -2.065087, 0.4156863, 1, 0, 1,
-0.5760543, -1.015396, -3.980814, 0.4117647, 1, 0, 1,
-0.5723752, -0.24598, 0.01452543, 0.4039216, 1, 0, 1,
-0.5676814, -0.3584397, -1.668013, 0.3960784, 1, 0, 1,
-0.5643705, 1.049966, -1.323204, 0.3921569, 1, 0, 1,
-0.5636541, -0.687529, -3.409084, 0.3843137, 1, 0, 1,
-0.5631374, 1.655518, -1.590257, 0.3803922, 1, 0, 1,
-0.5491385, -0.4952239, -1.874904, 0.372549, 1, 0, 1,
-0.5449719, -1.360588, -1.508656, 0.3686275, 1, 0, 1,
-0.54484, 0.7665085, -1.064317, 0.3607843, 1, 0, 1,
-0.5447506, 1.419137, -0.2230273, 0.3568628, 1, 0, 1,
-0.541751, -0.958719, -3.366325, 0.3490196, 1, 0, 1,
-0.5386592, -0.9025194, -2.128746, 0.345098, 1, 0, 1,
-0.5369101, -1.461598, -2.387288, 0.3372549, 1, 0, 1,
-0.5362717, -0.2393158, -1.627879, 0.3333333, 1, 0, 1,
-0.5355897, 1.143497, -1.087783, 0.3254902, 1, 0, 1,
-0.528769, 0.9278465, -0.63451, 0.3215686, 1, 0, 1,
-0.5210584, -2.478418, -3.269567, 0.3137255, 1, 0, 1,
-0.5170875, 1.422606, -1.123444, 0.3098039, 1, 0, 1,
-0.5125321, -1.515638, -1.971161, 0.3019608, 1, 0, 1,
-0.5102409, -0.7368504, -2.796563, 0.2941177, 1, 0, 1,
-0.5091938, -0.2492511, -3.440635, 0.2901961, 1, 0, 1,
-0.5077893, -0.2596391, -2.109177, 0.282353, 1, 0, 1,
-0.5045442, -0.05635438, -2.180908, 0.2784314, 1, 0, 1,
-0.5040485, -0.07636937, -0.3190149, 0.2705882, 1, 0, 1,
-0.5034873, 1.087996, -0.03844106, 0.2666667, 1, 0, 1,
-0.5030829, 2.333195, -0.008831311, 0.2588235, 1, 0, 1,
-0.5024932, -0.3110007, -3.305226, 0.254902, 1, 0, 1,
-0.4963591, -0.5731224, -1.693836, 0.2470588, 1, 0, 1,
-0.4925127, 1.375182, -0.1956199, 0.2431373, 1, 0, 1,
-0.4909152, 0.01076311, -1.295805, 0.2352941, 1, 0, 1,
-0.4903135, -0.6175657, -2.023279, 0.2313726, 1, 0, 1,
-0.4892055, -0.797819, -1.558224, 0.2235294, 1, 0, 1,
-0.4824076, 0.9036292, -2.06577, 0.2196078, 1, 0, 1,
-0.4812032, -0.1206098, -0.4039164, 0.2117647, 1, 0, 1,
-0.4708858, 0.1807856, 0.02143596, 0.2078431, 1, 0, 1,
-0.4653278, -0.8059071, -1.815176, 0.2, 1, 0, 1,
-0.4628297, -1.235465, -2.475884, 0.1921569, 1, 0, 1,
-0.4591449, -0.6173895, -2.583818, 0.1882353, 1, 0, 1,
-0.4551297, -0.951364, -2.238784, 0.1803922, 1, 0, 1,
-0.4550379, -0.6783447, -3.230862, 0.1764706, 1, 0, 1,
-0.4531385, -0.8778132, -2.169161, 0.1686275, 1, 0, 1,
-0.4514883, -0.4334943, -2.454025, 0.1647059, 1, 0, 1,
-0.4473066, 1.660702, 2.047786, 0.1568628, 1, 0, 1,
-0.4461047, 0.2944439, 0.286341, 0.1529412, 1, 0, 1,
-0.4432225, -0.06609352, -3.740881, 0.145098, 1, 0, 1,
-0.4425338, -0.05658277, -1.724553, 0.1411765, 1, 0, 1,
-0.434495, -0.3405046, -1.690469, 0.1333333, 1, 0, 1,
-0.431715, 0.3235609, -1.555, 0.1294118, 1, 0, 1,
-0.4312992, 0.1637275, -1.676877, 0.1215686, 1, 0, 1,
-0.4261971, 2.929983, 0.9927446, 0.1176471, 1, 0, 1,
-0.4214208, 1.998114, 0.9031739, 0.1098039, 1, 0, 1,
-0.4211194, -0.4315352, -2.657859, 0.1058824, 1, 0, 1,
-0.4095674, 0.5173738, -0.7380315, 0.09803922, 1, 0, 1,
-0.4086534, -0.8177811, -3.146512, 0.09019608, 1, 0, 1,
-0.4063269, 1.872778, -1.260075, 0.08627451, 1, 0, 1,
-0.4056633, 1.140861, -0.4484907, 0.07843138, 1, 0, 1,
-0.404893, -1.28536, -3.043879, 0.07450981, 1, 0, 1,
-0.4023593, 1.621683, -0.8271067, 0.06666667, 1, 0, 1,
-0.3993599, 0.007604884, -2.014125, 0.0627451, 1, 0, 1,
-0.3964417, -0.7967919, -3.188739, 0.05490196, 1, 0, 1,
-0.3936659, 0.03594647, -0.3145199, 0.05098039, 1, 0, 1,
-0.3902782, -0.2323527, -1.055473, 0.04313726, 1, 0, 1,
-0.3901076, 0.5564096, 0.8807364, 0.03921569, 1, 0, 1,
-0.3801786, -1.07321, -4.060018, 0.03137255, 1, 0, 1,
-0.3781032, -0.4416302, -4.256366, 0.02745098, 1, 0, 1,
-0.377462, -1.119026, -2.539044, 0.01960784, 1, 0, 1,
-0.3761483, 0.41565, 0.1912482, 0.01568628, 1, 0, 1,
-0.3712327, 0.3604265, -1.5785, 0.007843138, 1, 0, 1,
-0.368173, 0.7629372, -1.392241, 0.003921569, 1, 0, 1,
-0.3649335, 0.6620608, -1.009045, 0, 1, 0.003921569, 1,
-0.3642355, 0.3594535, -1.44157, 0, 1, 0.01176471, 1,
-0.3638219, -1.617126, -2.956441, 0, 1, 0.01568628, 1,
-0.3617077, 0.7178293, -1.561995, 0, 1, 0.02352941, 1,
-0.3595875, 1.346787, 0.6955364, 0, 1, 0.02745098, 1,
-0.3571626, 0.2943491, 0.1026954, 0, 1, 0.03529412, 1,
-0.356766, -1.28166, -3.414153, 0, 1, 0.03921569, 1,
-0.3540939, 1.950325, -0.8290307, 0, 1, 0.04705882, 1,
-0.3520688, -0.7490751, -2.493465, 0, 1, 0.05098039, 1,
-0.3514906, 0.9207451, -1.260431, 0, 1, 0.05882353, 1,
-0.3460637, -0.3720562, -2.361159, 0, 1, 0.0627451, 1,
-0.340583, 0.9943818, -0.3260216, 0, 1, 0.07058824, 1,
-0.3302881, 0.1378063, -0.7604539, 0, 1, 0.07450981, 1,
-0.3267308, -1.284377, -3.860639, 0, 1, 0.08235294, 1,
-0.3264793, 1.396096, -0.456126, 0, 1, 0.08627451, 1,
-0.3234034, 0.9519398, 0.8567345, 0, 1, 0.09411765, 1,
-0.3233755, -0.3567451, -1.814462, 0, 1, 0.1019608, 1,
-0.3209032, -0.5605345, -3.033094, 0, 1, 0.1058824, 1,
-0.3206755, 0.3519063, -1.585847, 0, 1, 0.1137255, 1,
-0.320663, -0.1508229, -2.571551, 0, 1, 0.1176471, 1,
-0.3173856, 0.8336834, -2.634229, 0, 1, 0.1254902, 1,
-0.3141869, 0.4746383, -0.8079975, 0, 1, 0.1294118, 1,
-0.3069135, 0.9268779, -2.515371, 0, 1, 0.1372549, 1,
-0.2985562, -1.260522, -1.033883, 0, 1, 0.1411765, 1,
-0.2950057, -0.01203434, -0.5034179, 0, 1, 0.1490196, 1,
-0.2921155, 0.5777861, -0.0839339, 0, 1, 0.1529412, 1,
-0.2897578, 0.2206395, -1.445097, 0, 1, 0.1607843, 1,
-0.2891988, -0.4170104, -1.894675, 0, 1, 0.1647059, 1,
-0.278784, 0.3086336, -1.398134, 0, 1, 0.172549, 1,
-0.2761724, 0.81985, -1.591049, 0, 1, 0.1764706, 1,
-0.27349, -0.1106172, -2.478594, 0, 1, 0.1843137, 1,
-0.2698358, -1.102243, -3.762589, 0, 1, 0.1882353, 1,
-0.2682001, -0.3159018, -1.847305, 0, 1, 0.1960784, 1,
-0.2678782, 1.074082, 0.09505352, 0, 1, 0.2039216, 1,
-0.267215, 0.3467102, -1.906753, 0, 1, 0.2078431, 1,
-0.2615474, 2.211274, -0.2298668, 0, 1, 0.2156863, 1,
-0.2466184, 0.09272576, -1.000489, 0, 1, 0.2196078, 1,
-0.244067, -0.7278531, -2.948358, 0, 1, 0.227451, 1,
-0.2435856, 1.44706, -0.2249044, 0, 1, 0.2313726, 1,
-0.2433044, 0.5728389, -0.8214955, 0, 1, 0.2392157, 1,
-0.2302258, 0.1330432, -2.469274, 0, 1, 0.2431373, 1,
-0.2184104, -0.1419279, -3.442603, 0, 1, 0.2509804, 1,
-0.2147233, -1.784529, -3.886326, 0, 1, 0.254902, 1,
-0.2142254, -1.26938, -1.53052, 0, 1, 0.2627451, 1,
-0.2084657, 0.4204237, 0.177673, 0, 1, 0.2666667, 1,
-0.2080897, 0.6863864, -0.5855407, 0, 1, 0.2745098, 1,
-0.2065089, -1.023651, -3.530218, 0, 1, 0.2784314, 1,
-0.2055393, -1.840006, -2.428344, 0, 1, 0.2862745, 1,
-0.2044926, -0.0155087, -1.589135, 0, 1, 0.2901961, 1,
-0.2020923, -0.5891191, -3.907916, 0, 1, 0.2980392, 1,
-0.2005798, 1.06807, -0.5722886, 0, 1, 0.3058824, 1,
-0.1953097, 0.1636004, -0.3759531, 0, 1, 0.3098039, 1,
-0.1945967, 0.4950001, -1.01672, 0, 1, 0.3176471, 1,
-0.1929848, 1.717819, -0.6100308, 0, 1, 0.3215686, 1,
-0.1883701, -0.668106, -3.343795, 0, 1, 0.3294118, 1,
-0.1882752, 2.096473, 2.04106, 0, 1, 0.3333333, 1,
-0.1875534, -0.1753518, -1.998552, 0, 1, 0.3411765, 1,
-0.1870088, 0.1162286, 0.5363412, 0, 1, 0.345098, 1,
-0.1771258, -1.177617, -3.527987, 0, 1, 0.3529412, 1,
-0.1765036, -0.3011326, -4.995581, 0, 1, 0.3568628, 1,
-0.1744371, 0.1133582, -2.203278, 0, 1, 0.3647059, 1,
-0.1734069, 0.3151472, -0.3409899, 0, 1, 0.3686275, 1,
-0.1732884, -0.3117176, -3.630067, 0, 1, 0.3764706, 1,
-0.1698151, 2.431906, -0.6723028, 0, 1, 0.3803922, 1,
-0.1657149, -0.8794203, -2.68263, 0, 1, 0.3882353, 1,
-0.1569134, 1.149464, -1.031002, 0, 1, 0.3921569, 1,
-0.1555472, -0.3501405, -1.401829, 0, 1, 0.4, 1,
-0.1535146, -0.7669572, -2.824339, 0, 1, 0.4078431, 1,
-0.1509679, 1.719461, -0.6913376, 0, 1, 0.4117647, 1,
-0.148033, 0.8171923, 0.9023779, 0, 1, 0.4196078, 1,
-0.1477214, -2.298672, -3.157053, 0, 1, 0.4235294, 1,
-0.1461209, 0.2383411, -1.163782, 0, 1, 0.4313726, 1,
-0.138327, -0.7601016, -1.820053, 0, 1, 0.4352941, 1,
-0.1358939, 1.021382, -0.2215266, 0, 1, 0.4431373, 1,
-0.1338168, 0.05189946, -2.515015, 0, 1, 0.4470588, 1,
-0.1246671, -0.8049148, -3.118784, 0, 1, 0.454902, 1,
-0.1239005, -1.021098, -2.401322, 0, 1, 0.4588235, 1,
-0.1237054, 1.596737, 0.4027033, 0, 1, 0.4666667, 1,
-0.1235289, 1.263419, 0.1588276, 0, 1, 0.4705882, 1,
-0.1233446, -0.4689232, -5.092014, 0, 1, 0.4784314, 1,
-0.1216887, 0.2417434, 1.250479, 0, 1, 0.4823529, 1,
-0.1216315, -0.2671722, -0.9722044, 0, 1, 0.4901961, 1,
-0.1208718, -0.1473304, -1.553575, 0, 1, 0.4941176, 1,
-0.1181209, 0.1622634, 0.5284238, 0, 1, 0.5019608, 1,
-0.1180708, 0.8323314, -0.482504, 0, 1, 0.509804, 1,
-0.1175035, 2.762794, 0.3558758, 0, 1, 0.5137255, 1,
-0.1160049, 0.4795905, 0.03562444, 0, 1, 0.5215687, 1,
-0.1132349, -2.148883, -4.074371, 0, 1, 0.5254902, 1,
-0.1068425, 0.09243711, 1.53626, 0, 1, 0.5333334, 1,
-0.1054995, 1.841173, 1.655587, 0, 1, 0.5372549, 1,
-0.1048488, -0.2852373, -2.776991, 0, 1, 0.5450981, 1,
-0.1037876, 0.1351315, -1.704474, 0, 1, 0.5490196, 1,
-0.1023149, -0.3694959, -6.237365, 0, 1, 0.5568628, 1,
-0.09921819, -0.004854193, -1.176999, 0, 1, 0.5607843, 1,
-0.09723415, 0.1885696, -0.8143505, 0, 1, 0.5686275, 1,
-0.09385846, 1.225629, 0.9246139, 0, 1, 0.572549, 1,
-0.09135514, 0.6236603, -1.489398, 0, 1, 0.5803922, 1,
-0.08821487, 0.7362819, -1.262366, 0, 1, 0.5843138, 1,
-0.08687817, -0.04560113, -2.763924, 0, 1, 0.5921569, 1,
-0.0855984, -1.332366, -4.005704, 0, 1, 0.5960785, 1,
-0.08510986, 0.3440594, -2.209071, 0, 1, 0.6039216, 1,
-0.08114848, -0.4918704, -2.344413, 0, 1, 0.6117647, 1,
-0.08074266, 0.07217412, 2.635518, 0, 1, 0.6156863, 1,
-0.0791769, -0.5757532, -2.074246, 0, 1, 0.6235294, 1,
-0.0788203, -0.2200592, -1.014188, 0, 1, 0.627451, 1,
-0.07745548, 0.4088695, -0.752924, 0, 1, 0.6352941, 1,
-0.06860582, 1.66007, -0.510084, 0, 1, 0.6392157, 1,
-0.06751858, 0.7748141, 0.7938594, 0, 1, 0.6470588, 1,
-0.06745684, -0.637232, -4.536281, 0, 1, 0.6509804, 1,
-0.06239042, 1.050155, 0.7331198, 0, 1, 0.6588235, 1,
-0.06202778, 0.04724159, -0.8622577, 0, 1, 0.6627451, 1,
-0.06020416, 1.362004, -0.3032824, 0, 1, 0.6705883, 1,
-0.05960726, 0.0618834, -0.4787002, 0, 1, 0.6745098, 1,
-0.05916768, -1.807034, -2.184104, 0, 1, 0.682353, 1,
-0.05894261, -1.319573, -2.945812, 0, 1, 0.6862745, 1,
-0.05789289, 1.352024, -0.4382752, 0, 1, 0.6941177, 1,
-0.0573854, 0.09314052, -1.92203, 0, 1, 0.7019608, 1,
-0.05636556, 0.4348002, 1.240127, 0, 1, 0.7058824, 1,
-0.05612354, -0.3996662, -2.548224, 0, 1, 0.7137255, 1,
-0.05544462, 0.2315206, 1.092965, 0, 1, 0.7176471, 1,
-0.05515585, -1.27852, -2.811398, 0, 1, 0.7254902, 1,
-0.05129262, 0.9496694, -0.9500491, 0, 1, 0.7294118, 1,
-0.04605476, 0.007118767, -1.085586, 0, 1, 0.7372549, 1,
-0.04366231, 0.06771256, -0.5756033, 0, 1, 0.7411765, 1,
-0.03391778, 0.09399756, -2.235479, 0, 1, 0.7490196, 1,
-0.03225268, 1.179866, 0.687243, 0, 1, 0.7529412, 1,
-0.0319955, 1.364751, 0.1023793, 0, 1, 0.7607843, 1,
-0.03192746, -0.09819867, -3.034584, 0, 1, 0.7647059, 1,
-0.03110093, 0.3545866, -0.4232776, 0, 1, 0.772549, 1,
-0.03006793, -1.555333, -3.007057, 0, 1, 0.7764706, 1,
-0.02879746, 0.811517, 1.566468, 0, 1, 0.7843137, 1,
-0.028783, -1.351738, -3.548288, 0, 1, 0.7882353, 1,
-0.0203557, 1.359782, -0.6675905, 0, 1, 0.7960784, 1,
-0.01922854, -0.3636496, -4.48917, 0, 1, 0.8039216, 1,
-0.01428228, -0.7749199, -1.684141, 0, 1, 0.8078431, 1,
-0.01145691, 0.5510356, -0.8476839, 0, 1, 0.8156863, 1,
-0.01135405, 1.133028, 0.05708124, 0, 1, 0.8196079, 1,
-0.001686612, 1.499867, -1.175229, 0, 1, 0.827451, 1,
-0.0004934216, 0.3292373, 0.7534881, 0, 1, 0.8313726, 1,
0.001472763, 0.331781, -0.5221125, 0, 1, 0.8392157, 1,
0.006845968, -1.46776, 3.808451, 0, 1, 0.8431373, 1,
0.006981038, -0.3335506, 3.592896, 0, 1, 0.8509804, 1,
0.008587741, -1.0584, 3.506646, 0, 1, 0.854902, 1,
0.009859182, -0.4130646, 3.273158, 0, 1, 0.8627451, 1,
0.01003085, 0.4376303, 1.324424, 0, 1, 0.8666667, 1,
0.01308294, -0.6760812, 3.39484, 0, 1, 0.8745098, 1,
0.01310212, -1.225282, 2.256515, 0, 1, 0.8784314, 1,
0.01382686, -1.258148, 3.522569, 0, 1, 0.8862745, 1,
0.01491573, -0.03095684, 4.805364, 0, 1, 0.8901961, 1,
0.01649468, -1.236176, 4.188149, 0, 1, 0.8980392, 1,
0.01947958, 1.196581, -0.3928442, 0, 1, 0.9058824, 1,
0.02427951, 0.4136576, -0.7915576, 0, 1, 0.9098039, 1,
0.02633283, 2.676389, 0.8012077, 0, 1, 0.9176471, 1,
0.02911499, 0.6731427, -0.1750633, 0, 1, 0.9215686, 1,
0.03094305, -1.379953, 3.7139, 0, 1, 0.9294118, 1,
0.03990231, 0.3631849, 1.013684, 0, 1, 0.9333333, 1,
0.04733033, 0.2975397, 0.4870993, 0, 1, 0.9411765, 1,
0.05045931, -0.3954301, 3.182463, 0, 1, 0.945098, 1,
0.05107951, 2.060165, 0.1551963, 0, 1, 0.9529412, 1,
0.05155498, -0.7095192, 4.757288, 0, 1, 0.9568627, 1,
0.05174852, -0.605117, 2.02006, 0, 1, 0.9647059, 1,
0.05195985, 0.6985239, 0.8915262, 0, 1, 0.9686275, 1,
0.05373108, -0.3681047, 3.681996, 0, 1, 0.9764706, 1,
0.05428578, 1.614887, 0.3444964, 0, 1, 0.9803922, 1,
0.06040094, -0.47251, 3.64043, 0, 1, 0.9882353, 1,
0.0613658, -0.7364241, 1.250171, 0, 1, 0.9921569, 1,
0.06171373, 0.3851699, -0.4370545, 0, 1, 1, 1,
0.06493402, -0.5889161, 2.692169, 0, 0.9921569, 1, 1,
0.06547146, -0.1674704, 1.206365, 0, 0.9882353, 1, 1,
0.0707481, -0.8353018, 4.143882, 0, 0.9803922, 1, 1,
0.07165918, 0.4069611, -0.8169283, 0, 0.9764706, 1, 1,
0.0744087, 0.38763, 0.07346591, 0, 0.9686275, 1, 1,
0.07448447, 0.1461294, 2.288583, 0, 0.9647059, 1, 1,
0.07580238, -0.6105279, 4.378781, 0, 0.9568627, 1, 1,
0.07605863, 1.273754, -0.7175791, 0, 0.9529412, 1, 1,
0.08207395, 0.2420412, -1.157515, 0, 0.945098, 1, 1,
0.08550352, 1.439223, -0.0752433, 0, 0.9411765, 1, 1,
0.08662273, -0.5976808, 1.729705, 0, 0.9333333, 1, 1,
0.0870683, 0.4671915, -0.5070219, 0, 0.9294118, 1, 1,
0.09875843, 0.5754585, 1.346834, 0, 0.9215686, 1, 1,
0.1020132, -0.922877, 4.669218, 0, 0.9176471, 1, 1,
0.1073569, 0.1983218, 1.398264, 0, 0.9098039, 1, 1,
0.1081373, 0.7967127, 0.5338541, 0, 0.9058824, 1, 1,
0.1107533, -1.257412, 2.60728, 0, 0.8980392, 1, 1,
0.1114109, -0.06768531, 0.7514553, 0, 0.8901961, 1, 1,
0.1117541, -0.824523, 4.064348, 0, 0.8862745, 1, 1,
0.1137951, 0.7505335, 0.2250815, 0, 0.8784314, 1, 1,
0.1138959, -2.611455, 3.03555, 0, 0.8745098, 1, 1,
0.1139404, 0.191745, 1.788528, 0, 0.8666667, 1, 1,
0.1161805, -1.087834, 4.727759, 0, 0.8627451, 1, 1,
0.1187939, -0.5890368, 3.417048, 0, 0.854902, 1, 1,
0.1209489, -0.1354456, 3.499732, 0, 0.8509804, 1, 1,
0.1291881, 1.113095, 0.2133994, 0, 0.8431373, 1, 1,
0.1318206, -0.7105585, 1.971594, 0, 0.8392157, 1, 1,
0.137924, -0.8345243, 5.445987, 0, 0.8313726, 1, 1,
0.1386168, 0.3322325, -0.1534466, 0, 0.827451, 1, 1,
0.1413043, -0.506501, 3.639924, 0, 0.8196079, 1, 1,
0.1433522, -0.739615, 2.732195, 0, 0.8156863, 1, 1,
0.1468059, -0.6539518, 2.9963, 0, 0.8078431, 1, 1,
0.1471136, 0.3669749, 1.308468, 0, 0.8039216, 1, 1,
0.1480386, -0.1414935, 0.218551, 0, 0.7960784, 1, 1,
0.1514885, 1.93123, -0.6341614, 0, 0.7882353, 1, 1,
0.1521291, 0.1899129, 1.651896, 0, 0.7843137, 1, 1,
0.1525852, 1.208334, 0.3811085, 0, 0.7764706, 1, 1,
0.1535523, -0.4279372, 3.618715, 0, 0.772549, 1, 1,
0.1555852, 1.725822, -0.2542797, 0, 0.7647059, 1, 1,
0.1564696, 1.230535, -0.3232292, 0, 0.7607843, 1, 1,
0.1602158, 1.220748, -0.7592905, 0, 0.7529412, 1, 1,
0.1635919, 1.933579, -0.3130199, 0, 0.7490196, 1, 1,
0.1652503, 0.3752268, 0.994827, 0, 0.7411765, 1, 1,
0.1664144, -0.5459075, 2.652439, 0, 0.7372549, 1, 1,
0.1721036, 0.4019118, -1.50067, 0, 0.7294118, 1, 1,
0.173942, -0.1939479, 2.148709, 0, 0.7254902, 1, 1,
0.1741396, -0.1808987, 3.084263, 0, 0.7176471, 1, 1,
0.1787517, -0.5504793, 3.723541, 0, 0.7137255, 1, 1,
0.1796499, 1.215278, -0.262233, 0, 0.7058824, 1, 1,
0.1802978, 0.1404518, 3.006153, 0, 0.6980392, 1, 1,
0.1838595, -1.029428, 2.457352, 0, 0.6941177, 1, 1,
0.1895843, -0.4401049, 2.432979, 0, 0.6862745, 1, 1,
0.1910475, 0.4532812, -0.02475178, 0, 0.682353, 1, 1,
0.192611, 0.09451056, 1.307454, 0, 0.6745098, 1, 1,
0.1932447, 0.4297147, 2.031435, 0, 0.6705883, 1, 1,
0.1935621, 0.7994801, 1.439093, 0, 0.6627451, 1, 1,
0.1977589, 1.19595, 0.2466875, 0, 0.6588235, 1, 1,
0.2013644, -1.941631, 4.444261, 0, 0.6509804, 1, 1,
0.2107645, 1.077746, -0.0315134, 0, 0.6470588, 1, 1,
0.2178115, 1.228277, -0.9804738, 0, 0.6392157, 1, 1,
0.2198173, 1.013931, -0.07824218, 0, 0.6352941, 1, 1,
0.2210677, -0.1016562, 1.441263, 0, 0.627451, 1, 1,
0.2223246, -1.956878, 2.925768, 0, 0.6235294, 1, 1,
0.2259235, 0.3278282, -0.5696631, 0, 0.6156863, 1, 1,
0.2275312, -0.1710822, 2.428142, 0, 0.6117647, 1, 1,
0.2288871, -1.775661, 3.362165, 0, 0.6039216, 1, 1,
0.2328261, -0.4949409, 1.879186, 0, 0.5960785, 1, 1,
0.2392432, -0.7256562, 2.692641, 0, 0.5921569, 1, 1,
0.2417942, 0.08387413, 0.7291147, 0, 0.5843138, 1, 1,
0.2423894, 1.189381, 1.329611, 0, 0.5803922, 1, 1,
0.242411, -0.03160876, 1.044139, 0, 0.572549, 1, 1,
0.245387, 0.4011646, 0.6879677, 0, 0.5686275, 1, 1,
0.2480368, -1.088424, 2.280248, 0, 0.5607843, 1, 1,
0.2530631, 0.7465585, 0.9756228, 0, 0.5568628, 1, 1,
0.2569873, 0.5996968, 1.721578, 0, 0.5490196, 1, 1,
0.2607929, -0.05777887, 1.954904, 0, 0.5450981, 1, 1,
0.2622153, -0.05000441, 2.719592, 0, 0.5372549, 1, 1,
0.2635263, -0.36966, 1.995897, 0, 0.5333334, 1, 1,
0.2665523, -0.604844, 2.801334, 0, 0.5254902, 1, 1,
0.267039, -0.33547, 3.365462, 0, 0.5215687, 1, 1,
0.2681036, 0.0741473, -0.5106546, 0, 0.5137255, 1, 1,
0.2719508, -0.5894103, 1.418903, 0, 0.509804, 1, 1,
0.2719815, -0.2292332, 2.400291, 0, 0.5019608, 1, 1,
0.275138, -0.865901, 3.63853, 0, 0.4941176, 1, 1,
0.2785732, 1.640565, 0.3632511, 0, 0.4901961, 1, 1,
0.2845317, 0.6183935, -0.124569, 0, 0.4823529, 1, 1,
0.2867092, -1.506355, 3.425063, 0, 0.4784314, 1, 1,
0.2892418, -0.5716339, 1.30335, 0, 0.4705882, 1, 1,
0.2900658, -1.483383, 3.695264, 0, 0.4666667, 1, 1,
0.290829, 0.2487148, 1.420652, 0, 0.4588235, 1, 1,
0.2926634, 1.174566, 0.5923869, 0, 0.454902, 1, 1,
0.2939985, -0.1001391, 0.168024, 0, 0.4470588, 1, 1,
0.2947762, 0.4876276, 0.7435436, 0, 0.4431373, 1, 1,
0.2954502, 0.7220551, 0.9807281, 0, 0.4352941, 1, 1,
0.2962043, 0.1358559, -0.8207219, 0, 0.4313726, 1, 1,
0.2999126, -0.04458912, 1.636671, 0, 0.4235294, 1, 1,
0.3002265, 1.872211, 0.4478221, 0, 0.4196078, 1, 1,
0.3029515, -0.3925669, 3.432348, 0, 0.4117647, 1, 1,
0.3038889, 0.7084599, 0.1421226, 0, 0.4078431, 1, 1,
0.3041483, -0.1888075, 2.229878, 0, 0.4, 1, 1,
0.3080716, -0.07054725, 1.695374, 0, 0.3921569, 1, 1,
0.3114647, -0.1772368, 0.7087851, 0, 0.3882353, 1, 1,
0.3131273, 0.7306033, 0.7272984, 0, 0.3803922, 1, 1,
0.3162461, 0.1243046, 1.44348, 0, 0.3764706, 1, 1,
0.3188668, 1.045378, -0.6065146, 0, 0.3686275, 1, 1,
0.3196635, -0.8448626, 3.223898, 0, 0.3647059, 1, 1,
0.3212029, -0.3553393, 1.199909, 0, 0.3568628, 1, 1,
0.3213431, -2.19832, 2.278433, 0, 0.3529412, 1, 1,
0.3273251, 1.277205, -2.405906, 0, 0.345098, 1, 1,
0.3298818, -0.3023663, 3.609496, 0, 0.3411765, 1, 1,
0.3401934, -1.021879, 2.655076, 0, 0.3333333, 1, 1,
0.3407117, -0.1123178, 0.7534615, 0, 0.3294118, 1, 1,
0.3417943, 1.499894, -0.0725096, 0, 0.3215686, 1, 1,
0.342068, -2.364215, 1.980877, 0, 0.3176471, 1, 1,
0.3448643, -0.7364203, 0.9154139, 0, 0.3098039, 1, 1,
0.3462217, 0.7907152, 0.5451389, 0, 0.3058824, 1, 1,
0.347534, 0.25655, 2.709395, 0, 0.2980392, 1, 1,
0.3498247, 0.4580375, 0.5689957, 0, 0.2901961, 1, 1,
0.3518047, 0.1581522, -1.061583, 0, 0.2862745, 1, 1,
0.3524512, -0.0584185, 2.716019, 0, 0.2784314, 1, 1,
0.3526659, -1.076878, 5.19886, 0, 0.2745098, 1, 1,
0.3527283, -0.8642119, 2.299355, 0, 0.2666667, 1, 1,
0.3628244, 0.06753299, 2.395106, 0, 0.2627451, 1, 1,
0.3664783, -0.38848, 2.725261, 0, 0.254902, 1, 1,
0.3688667, -0.2903245, 3.919084, 0, 0.2509804, 1, 1,
0.3720602, -0.02983692, 3.177129, 0, 0.2431373, 1, 1,
0.3737107, -0.2056956, 2.332101, 0, 0.2392157, 1, 1,
0.3756071, 0.1299737, 2.737542, 0, 0.2313726, 1, 1,
0.3770363, -1.65268, 3.527483, 0, 0.227451, 1, 1,
0.3808112, -0.4980375, 5.055619, 0, 0.2196078, 1, 1,
0.3844345, 0.04615368, 1.466202, 0, 0.2156863, 1, 1,
0.3873301, -1.158223, 1.845224, 0, 0.2078431, 1, 1,
0.3896122, 0.7503654, 0.3188272, 0, 0.2039216, 1, 1,
0.390839, 0.06464458, 0.6369948, 0, 0.1960784, 1, 1,
0.3916779, -0.6886472, 2.026544, 0, 0.1882353, 1, 1,
0.393439, -1.016143, 3.355462, 0, 0.1843137, 1, 1,
0.3939565, 0.8913945, -0.6877642, 0, 0.1764706, 1, 1,
0.3944148, -0.3487678, 2.010705, 0, 0.172549, 1, 1,
0.3951311, 2.002762, -0.2218017, 0, 0.1647059, 1, 1,
0.3994241, 1.310974, -0.7829046, 0, 0.1607843, 1, 1,
0.4007486, -2.355637, 3.974261, 0, 0.1529412, 1, 1,
0.4015325, -0.2117991, 1.128885, 0, 0.1490196, 1, 1,
0.4041764, 0.4183066, 2.132183, 0, 0.1411765, 1, 1,
0.4059536, -0.1140301, 2.475611, 0, 0.1372549, 1, 1,
0.4062745, -1.687674, 2.800541, 0, 0.1294118, 1, 1,
0.4085301, 1.232251, -0.07390192, 0, 0.1254902, 1, 1,
0.4118257, -1.338008, 2.216812, 0, 0.1176471, 1, 1,
0.4141428, 0.2775236, 1.0406, 0, 0.1137255, 1, 1,
0.4155113, 0.971799, -0.2641613, 0, 0.1058824, 1, 1,
0.4160552, 0.9366367, -0.5153564, 0, 0.09803922, 1, 1,
0.4161504, 0.3777371, -0.3374859, 0, 0.09411765, 1, 1,
0.4173904, 1.593716, -0.828591, 0, 0.08627451, 1, 1,
0.4189387, 0.6168252, 0.7933705, 0, 0.08235294, 1, 1,
0.4197738, 1.267223, 0.2142514, 0, 0.07450981, 1, 1,
0.4217231, -0.2605326, 2.073923, 0, 0.07058824, 1, 1,
0.4228778, 0.04436632, 2.110811, 0, 0.0627451, 1, 1,
0.4309853, -0.2161453, 1.784643, 0, 0.05882353, 1, 1,
0.4328597, 0.05454202, 2.46312, 0, 0.05098039, 1, 1,
0.4338993, -0.1824445, 2.936642, 0, 0.04705882, 1, 1,
0.4362628, 0.2767735, 4.391618, 0, 0.03921569, 1, 1,
0.439725, -0.5405951, 2.37805, 0, 0.03529412, 1, 1,
0.444577, -0.5277334, 1.697748, 0, 0.02745098, 1, 1,
0.4456123, -0.1834002, 1.273578, 0, 0.02352941, 1, 1,
0.4470665, -0.5612515, 3.853001, 0, 0.01568628, 1, 1,
0.449473, -0.4613687, 1.448494, 0, 0.01176471, 1, 1,
0.4511411, -0.3036551, 2.55523, 0, 0.003921569, 1, 1,
0.4522439, 1.69854, 1.287517, 0.003921569, 0, 1, 1,
0.4537565, 0.6487413, -0.7538704, 0.007843138, 0, 1, 1,
0.4537627, 0.05043422, 1.29275, 0.01568628, 0, 1, 1,
0.4543134, 0.5056914, 1.503968, 0.01960784, 0, 1, 1,
0.4583374, -0.8560234, 1.18303, 0.02745098, 0, 1, 1,
0.459474, -1.744132, 2.038728, 0.03137255, 0, 1, 1,
0.4599946, -1.764186, 4.169993, 0.03921569, 0, 1, 1,
0.4629554, 0.304571, 1.525241, 0.04313726, 0, 1, 1,
0.4649125, -0.3453996, 1.009939, 0.05098039, 0, 1, 1,
0.4664909, 0.739073, -0.9542527, 0.05490196, 0, 1, 1,
0.4676009, 1.590221, -0.1650928, 0.0627451, 0, 1, 1,
0.4700447, 0.09473992, 1.396209, 0.06666667, 0, 1, 1,
0.4749486, -0.3641022, 3.00064, 0.07450981, 0, 1, 1,
0.4753389, -0.6128203, 1.687941, 0.07843138, 0, 1, 1,
0.4760579, 0.3700181, 1.014301, 0.08627451, 0, 1, 1,
0.4858021, -1.131342, 3.625573, 0.09019608, 0, 1, 1,
0.4890453, -1.086552, 1.466531, 0.09803922, 0, 1, 1,
0.4908825, 1.143329, -0.5878934, 0.1058824, 0, 1, 1,
0.4988389, -0.4128023, 2.635839, 0.1098039, 0, 1, 1,
0.4991024, -0.4954573, 2.557542, 0.1176471, 0, 1, 1,
0.515026, -0.2751929, 1.968109, 0.1215686, 0, 1, 1,
0.5183729, -0.2030482, 1.774226, 0.1294118, 0, 1, 1,
0.5211321, 1.348996, 0.1737211, 0.1333333, 0, 1, 1,
0.5215688, 1.098015, 0.2461762, 0.1411765, 0, 1, 1,
0.5226739, -0.9226146, 3.48406, 0.145098, 0, 1, 1,
0.5244184, -0.8344607, 3.476888, 0.1529412, 0, 1, 1,
0.5293996, -1.094286, 3.362548, 0.1568628, 0, 1, 1,
0.532909, -1.160146, 3.798879, 0.1647059, 0, 1, 1,
0.5403351, -2.617004, 2.286238, 0.1686275, 0, 1, 1,
0.5419931, 1.069013, 1.570132, 0.1764706, 0, 1, 1,
0.5432297, 0.6863492, 1.748776, 0.1803922, 0, 1, 1,
0.5432821, 0.3511694, 0.1969113, 0.1882353, 0, 1, 1,
0.5436774, -1.265486, 2.572225, 0.1921569, 0, 1, 1,
0.5484912, -0.4970409, 3.268815, 0.2, 0, 1, 1,
0.5532848, 0.1549449, 0.4268353, 0.2078431, 0, 1, 1,
0.5591056, 0.2785518, 0.2745905, 0.2117647, 0, 1, 1,
0.5615561, -0.2287906, 3.191073, 0.2196078, 0, 1, 1,
0.5664555, -0.5935252, 2.46956, 0.2235294, 0, 1, 1,
0.5691676, -0.3187067, 3.320704, 0.2313726, 0, 1, 1,
0.5731301, 2.451544, -1.390946, 0.2352941, 0, 1, 1,
0.5758178, 1.223483, 2.059049, 0.2431373, 0, 1, 1,
0.5764567, 0.6387682, 0.7987145, 0.2470588, 0, 1, 1,
0.5791696, 1.719796, 0.9709874, 0.254902, 0, 1, 1,
0.5883589, -1.748714, 3.39535, 0.2588235, 0, 1, 1,
0.5898487, -0.01325301, 0.2709169, 0.2666667, 0, 1, 1,
0.5916957, 0.2160653, 2.254895, 0.2705882, 0, 1, 1,
0.5920689, 0.03945373, 1.362691, 0.2784314, 0, 1, 1,
0.5934442, -1.194843, 4.312155, 0.282353, 0, 1, 1,
0.5960197, -1.0931, 2.926926, 0.2901961, 0, 1, 1,
0.6017795, -0.3518985, 2.136915, 0.2941177, 0, 1, 1,
0.60181, -0.2656257, 0.07680122, 0.3019608, 0, 1, 1,
0.6027499, -2.220052, 4.135415, 0.3098039, 0, 1, 1,
0.6049286, 0.8384607, -0.1948703, 0.3137255, 0, 1, 1,
0.6051922, 0.1425012, 1.621166, 0.3215686, 0, 1, 1,
0.6058521, 0.1079321, 1.001921, 0.3254902, 0, 1, 1,
0.6065124, -0.1383118, 1.732848, 0.3333333, 0, 1, 1,
0.6174473, -0.951656, 3.478562, 0.3372549, 0, 1, 1,
0.6283461, 0.4281361, 1.813664, 0.345098, 0, 1, 1,
0.6315147, 0.3033386, 2.914234, 0.3490196, 0, 1, 1,
0.6323813, 0.734208, -0.04031897, 0.3568628, 0, 1, 1,
0.6340947, -0.4582016, 2.725009, 0.3607843, 0, 1, 1,
0.6388701, 0.3527977, 0.8463632, 0.3686275, 0, 1, 1,
0.6392061, 1.976783, 1.879714, 0.372549, 0, 1, 1,
0.6398122, 0.6339825, 0.1502486, 0.3803922, 0, 1, 1,
0.6449496, 0.692831, 1.71352, 0.3843137, 0, 1, 1,
0.6466723, 0.7797289, 1.449187, 0.3921569, 0, 1, 1,
0.6478309, 0.2641741, 0.2093784, 0.3960784, 0, 1, 1,
0.6495721, -0.4288333, 1.731396, 0.4039216, 0, 1, 1,
0.6534787, 0.6831209, 1.378336, 0.4117647, 0, 1, 1,
0.6618603, 0.04492599, -0.2064648, 0.4156863, 0, 1, 1,
0.6637136, -0.1613925, 0.9058897, 0.4235294, 0, 1, 1,
0.6641962, 0.7098314, 1.515224, 0.427451, 0, 1, 1,
0.6663024, -1.128795, 4.151912, 0.4352941, 0, 1, 1,
0.6673982, -0.03769913, 0.7499326, 0.4392157, 0, 1, 1,
0.6705509, -2.264163, 2.046961, 0.4470588, 0, 1, 1,
0.6768062, 1.317739, -1.267765, 0.4509804, 0, 1, 1,
0.6787066, -1.188316, 0.03459135, 0.4588235, 0, 1, 1,
0.6848619, 0.9215564, -0.3185229, 0.4627451, 0, 1, 1,
0.689954, 0.7299709, -1.249736, 0.4705882, 0, 1, 1,
0.6900198, 0.3683127, 1.475965, 0.4745098, 0, 1, 1,
0.6929469, 0.4820401, 0.744031, 0.4823529, 0, 1, 1,
0.7079987, 0.03412591, 1.89051, 0.4862745, 0, 1, 1,
0.7129222, -0.4427834, 2.69656, 0.4941176, 0, 1, 1,
0.7214111, 1.080606, 1.236521, 0.5019608, 0, 1, 1,
0.724611, -0.2137083, 1.373417, 0.5058824, 0, 1, 1,
0.727502, 0.1904105, 0.8158532, 0.5137255, 0, 1, 1,
0.732007, -0.07142985, 1.464453, 0.5176471, 0, 1, 1,
0.7339112, -0.04402422, 1.138884, 0.5254902, 0, 1, 1,
0.7385534, 0.7473145, 1.227476, 0.5294118, 0, 1, 1,
0.7387443, 1.651696, -1.369899, 0.5372549, 0, 1, 1,
0.7390489, -0.7838856, 2.150731, 0.5411765, 0, 1, 1,
0.7395947, 2.060112, 0.4627751, 0.5490196, 0, 1, 1,
0.7415355, 0.5103253, 0.5677949, 0.5529412, 0, 1, 1,
0.7427851, 1.754706, 0.6088979, 0.5607843, 0, 1, 1,
0.7456759, 0.1539012, 1.684702, 0.5647059, 0, 1, 1,
0.7465183, 0.5059363, -1.017925, 0.572549, 0, 1, 1,
0.7482652, -0.03273121, 2.224901, 0.5764706, 0, 1, 1,
0.7544646, 0.6767986, 1.281339, 0.5843138, 0, 1, 1,
0.7597399, -0.367501, 0.4170111, 0.5882353, 0, 1, 1,
0.7761555, -0.5711881, 3.171837, 0.5960785, 0, 1, 1,
0.7827812, -1.130923, 2.554268, 0.6039216, 0, 1, 1,
0.7831879, -1.034167, 1.875756, 0.6078432, 0, 1, 1,
0.7845303, -1.25439, 1.912277, 0.6156863, 0, 1, 1,
0.7855942, 0.1157846, 2.482555, 0.6196079, 0, 1, 1,
0.7939617, -1.161746, 1.360877, 0.627451, 0, 1, 1,
0.7947768, -1.039175, 1.200715, 0.6313726, 0, 1, 1,
0.7993011, 0.4682303, 1.177901, 0.6392157, 0, 1, 1,
0.8007163, -0.07333159, 0.4414117, 0.6431373, 0, 1, 1,
0.8018516, -0.4682322, 1.326805, 0.6509804, 0, 1, 1,
0.8043727, 0.9761792, 1.29164, 0.654902, 0, 1, 1,
0.8073867, -0.2518254, 1.332268, 0.6627451, 0, 1, 1,
0.8120986, 1.260232, 0.9993109, 0.6666667, 0, 1, 1,
0.8150724, -0.9063553, 2.403125, 0.6745098, 0, 1, 1,
0.8218527, 1.0947, 2.494215, 0.6784314, 0, 1, 1,
0.8291137, 0.2909627, 1.364292, 0.6862745, 0, 1, 1,
0.8440403, -0.1609006, 1.431955, 0.6901961, 0, 1, 1,
0.8460977, 0.6932645, 1.686514, 0.6980392, 0, 1, 1,
0.8484551, -0.6199663, 4.553731, 0.7058824, 0, 1, 1,
0.8492724, -0.6607971, 1.647586, 0.7098039, 0, 1, 1,
0.8625183, -0.7986594, 0.6772833, 0.7176471, 0, 1, 1,
0.8628893, 0.4934744, 0.5943248, 0.7215686, 0, 1, 1,
0.863535, 0.6884964, 1.130248, 0.7294118, 0, 1, 1,
0.8729486, -1.246333, 3.238654, 0.7333333, 0, 1, 1,
0.8767409, 0.4538793, -1.007275, 0.7411765, 0, 1, 1,
0.8786448, -0.2318456, 2.300322, 0.7450981, 0, 1, 1,
0.8842399, 2.083992, -0.1117798, 0.7529412, 0, 1, 1,
0.8848327, -0.362146, 3.346463, 0.7568628, 0, 1, 1,
0.8865343, -0.9160521, 2.485709, 0.7647059, 0, 1, 1,
0.8924586, -0.6792696, 0.9935725, 0.7686275, 0, 1, 1,
0.8991573, -0.490821, 2.465998, 0.7764706, 0, 1, 1,
0.8994454, -0.5384961, 2.463548, 0.7803922, 0, 1, 1,
0.9000572, 0.3375828, -0.1605877, 0.7882353, 0, 1, 1,
0.9023754, -0.9224831, 3.900882, 0.7921569, 0, 1, 1,
0.9038962, -0.5477152, 1.042441, 0.8, 0, 1, 1,
0.9065014, 0.4364394, 0.184036, 0.8078431, 0, 1, 1,
0.9074659, -0.4923223, 1.79662, 0.8117647, 0, 1, 1,
0.9080085, 0.9304888, 0.6485168, 0.8196079, 0, 1, 1,
0.9105638, -1.405463, 1.565574, 0.8235294, 0, 1, 1,
0.912784, -0.6847885, 3.779094, 0.8313726, 0, 1, 1,
0.9153122, -0.2998433, 3.4111, 0.8352941, 0, 1, 1,
0.9159232, -1.287242, 1.083232, 0.8431373, 0, 1, 1,
0.9182282, -0.1101556, 3.49399, 0.8470588, 0, 1, 1,
0.9187548, -0.6315671, 3.727333, 0.854902, 0, 1, 1,
0.9200187, -0.3199486, 4.029147, 0.8588235, 0, 1, 1,
0.9218085, 0.513668, 3.935222, 0.8666667, 0, 1, 1,
0.9224787, 0.3151994, 1.362861, 0.8705882, 0, 1, 1,
0.9225281, -0.113458, 0.5729598, 0.8784314, 0, 1, 1,
0.9259109, -0.7088727, 1.801117, 0.8823529, 0, 1, 1,
0.9306093, -1.618128, 3.268865, 0.8901961, 0, 1, 1,
0.9368404, -1.001593, 1.60356, 0.8941177, 0, 1, 1,
0.9374741, 0.1934316, 0.1268575, 0.9019608, 0, 1, 1,
0.9381983, -1.224753, 2.268086, 0.9098039, 0, 1, 1,
0.9420887, -1.526483, 1.799516, 0.9137255, 0, 1, 1,
0.9450179, -0.421756, 2.80315, 0.9215686, 0, 1, 1,
0.9535828, 0.5545601, 3.046289, 0.9254902, 0, 1, 1,
0.9557685, 0.5515425, 1.806021, 0.9333333, 0, 1, 1,
0.9567758, 1.086776, 0.8350235, 0.9372549, 0, 1, 1,
0.95708, -0.8638001, 2.192285, 0.945098, 0, 1, 1,
0.9593579, 0.7353886, -0.1756824, 0.9490196, 0, 1, 1,
0.9681622, 0.8270444, 0.4725625, 0.9568627, 0, 1, 1,
0.9693223, 2.118473, 1.55137, 0.9607843, 0, 1, 1,
0.9756636, -0.4378765, 2.47872, 0.9686275, 0, 1, 1,
0.9771463, -0.3342132, 3.35588, 0.972549, 0, 1, 1,
0.9825332, -0.4267507, 3.454252, 0.9803922, 0, 1, 1,
0.9834625, -1.232039, 3.157014, 0.9843137, 0, 1, 1,
0.9865434, -0.7556092, 1.436455, 0.9921569, 0, 1, 1,
0.9922783, -0.6604214, 1.332421, 0.9960784, 0, 1, 1,
0.9928705, 0.4748902, 2.507161, 1, 0, 0.9960784, 1,
0.9929864, 0.04520347, 1.687225, 1, 0, 0.9882353, 1,
0.995221, 0.4191258, 1.821515, 1, 0, 0.9843137, 1,
1.002539, -0.04351815, 0.4877587, 1, 0, 0.9764706, 1,
1.003657, 2.774179, 1.224462, 1, 0, 0.972549, 1,
1.008359, 0.2909005, 1.486, 1, 0, 0.9647059, 1,
1.011867, 1.4082, 1.310715, 1, 0, 0.9607843, 1,
1.014848, -0.9733588, 2.076102, 1, 0, 0.9529412, 1,
1.01608, -0.3897412, 0.07492124, 1, 0, 0.9490196, 1,
1.019935, -0.4128423, 2.494155, 1, 0, 0.9411765, 1,
1.022007, -0.5261717, 1.503768, 1, 0, 0.9372549, 1,
1.024811, 0.2460805, 1.20287, 1, 0, 0.9294118, 1,
1.025858, 0.174245, 3.773789, 1, 0, 0.9254902, 1,
1.027058, -0.258285, 3.007606, 1, 0, 0.9176471, 1,
1.030016, -0.1649437, 1.829314, 1, 0, 0.9137255, 1,
1.031672, -0.0513122, 2.425448, 1, 0, 0.9058824, 1,
1.041498, -0.2275103, 3.122794, 1, 0, 0.9019608, 1,
1.042838, 0.5896199, 1.822818, 1, 0, 0.8941177, 1,
1.043832, -0.2209461, 1.754729, 1, 0, 0.8862745, 1,
1.048761, 0.699401, -0.6986817, 1, 0, 0.8823529, 1,
1.050012, -0.324364, 2.006932, 1, 0, 0.8745098, 1,
1.057239, 0.07166765, 1.612687, 1, 0, 0.8705882, 1,
1.057678, 0.9602265, 0.3979312, 1, 0, 0.8627451, 1,
1.061988, -2.573141, 2.773415, 1, 0, 0.8588235, 1,
1.062224, -0.3803931, 3.137621, 1, 0, 0.8509804, 1,
1.063432, -0.3606363, -0.1216266, 1, 0, 0.8470588, 1,
1.071009, 0.9840012, 1.10462, 1, 0, 0.8392157, 1,
1.073828, -0.9826077, 4.645857, 1, 0, 0.8352941, 1,
1.079077, -0.8036273, 2.08759, 1, 0, 0.827451, 1,
1.086592, 1.71519, 0.3098337, 1, 0, 0.8235294, 1,
1.09823, 0.5522822, 0.3057995, 1, 0, 0.8156863, 1,
1.098765, -0.1243614, 1.098624, 1, 0, 0.8117647, 1,
1.103028, 0.822219, 0.8593343, 1, 0, 0.8039216, 1,
1.104936, -0.0356361, -0.04022209, 1, 0, 0.7960784, 1,
1.108466, -1.249119, 2.252935, 1, 0, 0.7921569, 1,
1.114751, 0.1968058, -0.05569107, 1, 0, 0.7843137, 1,
1.118353, -0.1436641, 0.7502233, 1, 0, 0.7803922, 1,
1.119964, -0.9667077, 1.70623, 1, 0, 0.772549, 1,
1.123237, 0.6471863, -0.1196921, 1, 0, 0.7686275, 1,
1.123265, -1.048237, 2.274703, 1, 0, 0.7607843, 1,
1.131461, -0.5534672, 0.1902047, 1, 0, 0.7568628, 1,
1.142378, 0.6950029, 0.7793654, 1, 0, 0.7490196, 1,
1.155193, 1.152662, 1.048205, 1, 0, 0.7450981, 1,
1.155254, 0.3163925, 1.786978, 1, 0, 0.7372549, 1,
1.157588, -1.894744, 3.484425, 1, 0, 0.7333333, 1,
1.159131, -0.4628671, 0.9367869, 1, 0, 0.7254902, 1,
1.161289, -0.9975245, 3.486414, 1, 0, 0.7215686, 1,
1.163921, 0.05381509, 2.364177, 1, 0, 0.7137255, 1,
1.16741, 0.6150206, 1.800985, 1, 0, 0.7098039, 1,
1.174487, 0.8579569, 0.8072961, 1, 0, 0.7019608, 1,
1.17753, -0.946507, 2.702197, 1, 0, 0.6941177, 1,
1.179593, -0.5827177, 2.253918, 1, 0, 0.6901961, 1,
1.194009, -0.0271209, 1.805226, 1, 0, 0.682353, 1,
1.200379, -0.613964, 2.132971, 1, 0, 0.6784314, 1,
1.216932, 0.7614988, -1.061703, 1, 0, 0.6705883, 1,
1.221089, 0.6885943, 1.21654, 1, 0, 0.6666667, 1,
1.233647, -0.2213415, 2.740674, 1, 0, 0.6588235, 1,
1.235134, 0.7054906, 0.8622664, 1, 0, 0.654902, 1,
1.235178, -1.134759, 2.845355, 1, 0, 0.6470588, 1,
1.254093, -0.4340631, 0.6915188, 1, 0, 0.6431373, 1,
1.25521, -0.851015, 2.510046, 1, 0, 0.6352941, 1,
1.257439, -2.067763, 2.113727, 1, 0, 0.6313726, 1,
1.258584, -0.1471614, 2.476229, 1, 0, 0.6235294, 1,
1.273965, 0.601348, 0.5829476, 1, 0, 0.6196079, 1,
1.277268, 1.247425, 0.3224293, 1, 0, 0.6117647, 1,
1.28171, 0.4192561, 2.641921, 1, 0, 0.6078432, 1,
1.289868, 0.5045698, 1.96322, 1, 0, 0.6, 1,
1.292956, 0.9569377, -0.1708308, 1, 0, 0.5921569, 1,
1.295781, -1.564772, 3.126115, 1, 0, 0.5882353, 1,
1.303224, 0.2137409, 0.1083962, 1, 0, 0.5803922, 1,
1.304754, -0.6146515, 2.132663, 1, 0, 0.5764706, 1,
1.308824, -0.4960513, 2.55899, 1, 0, 0.5686275, 1,
1.327107, 0.6661975, 0.9642138, 1, 0, 0.5647059, 1,
1.332599, 0.6602819, 1.626819, 1, 0, 0.5568628, 1,
1.340325, -0.4102058, 1.147257, 1, 0, 0.5529412, 1,
1.357901, -0.1183508, 0.215601, 1, 0, 0.5450981, 1,
1.359126, -1.378741, 2.641036, 1, 0, 0.5411765, 1,
1.359813, -1.264713, 1.227158, 1, 0, 0.5333334, 1,
1.362616, -1.388138, 1.879112, 1, 0, 0.5294118, 1,
1.366605, 0.1676938, 1.962866, 1, 0, 0.5215687, 1,
1.371023, -0.3485222, 3.138316, 1, 0, 0.5176471, 1,
1.377235, -2.250778, 2.386474, 1, 0, 0.509804, 1,
1.37763, 0.5652681, 0.08452746, 1, 0, 0.5058824, 1,
1.378992, -0.7102226, 3.195677, 1, 0, 0.4980392, 1,
1.384281, 0.5654304, 0.5075955, 1, 0, 0.4901961, 1,
1.3852, -0.1625381, 1.370773, 1, 0, 0.4862745, 1,
1.390302, -0.1152499, 2.495192, 1, 0, 0.4784314, 1,
1.393718, 0.2169599, 1.529258, 1, 0, 0.4745098, 1,
1.4102, 1.921004, 0.4680992, 1, 0, 0.4666667, 1,
1.411459, -0.01035978, 0.5031357, 1, 0, 0.4627451, 1,
1.411945, -0.04767425, -0.6749923, 1, 0, 0.454902, 1,
1.414497, -0.9807482, 1.823163, 1, 0, 0.4509804, 1,
1.416361, 0.06596038, 1.018151, 1, 0, 0.4431373, 1,
1.416885, 1.95978, 1.116798, 1, 0, 0.4392157, 1,
1.418907, -0.03561647, 1.470484, 1, 0, 0.4313726, 1,
1.425269, 0.05688184, 0.4946018, 1, 0, 0.427451, 1,
1.434298, -0.358347, 2.274414, 1, 0, 0.4196078, 1,
1.442495, -1.81053, 2.88137, 1, 0, 0.4156863, 1,
1.442993, 0.6969767, 1.242609, 1, 0, 0.4078431, 1,
1.448265, -0.09789889, 2.744766, 1, 0, 0.4039216, 1,
1.455683, -0.5372745, 1.662581, 1, 0, 0.3960784, 1,
1.461449, -0.169022, 3.157573, 1, 0, 0.3882353, 1,
1.473889, -1.05564, 3.125208, 1, 0, 0.3843137, 1,
1.481495, 0.4679248, 1.644697, 1, 0, 0.3764706, 1,
1.487179, 0.8528544, 2.28767, 1, 0, 0.372549, 1,
1.492042, 0.3117423, 3.671787, 1, 0, 0.3647059, 1,
1.514918, -0.2067763, 2.15513, 1, 0, 0.3607843, 1,
1.520919, 0.5277318, 0.9228362, 1, 0, 0.3529412, 1,
1.539588, -0.420461, 0.319854, 1, 0, 0.3490196, 1,
1.540225, -0.4376352, 2.072236, 1, 0, 0.3411765, 1,
1.553104, -2.046723, 4.61823, 1, 0, 0.3372549, 1,
1.560634, -0.892223, -0.3813062, 1, 0, 0.3294118, 1,
1.587942, -0.7374089, 2.515478, 1, 0, 0.3254902, 1,
1.601463, -0.9867741, 0.9297876, 1, 0, 0.3176471, 1,
1.61161, -0.9599955, 2.205743, 1, 0, 0.3137255, 1,
1.613758, -0.207774, 2.305855, 1, 0, 0.3058824, 1,
1.624158, -0.9828387, 0.6206119, 1, 0, 0.2980392, 1,
1.629865, 0.6152928, 2.209635, 1, 0, 0.2941177, 1,
1.634611, -1.089349, 2.220753, 1, 0, 0.2862745, 1,
1.644883, -2.419803, 4.275363, 1, 0, 0.282353, 1,
1.680574, -0.7162439, 1.084278, 1, 0, 0.2745098, 1,
1.689299, 0.9816385, 1.167106, 1, 0, 0.2705882, 1,
1.709145, -0.7215984, 3.847178, 1, 0, 0.2627451, 1,
1.730257, 0.5208513, 0.6902084, 1, 0, 0.2588235, 1,
1.748839, 0.5354212, 0.8320303, 1, 0, 0.2509804, 1,
1.778127, 1.611091, 0.6540001, 1, 0, 0.2470588, 1,
1.788971, -0.5554834, 2.461662, 1, 0, 0.2392157, 1,
1.79231, -0.5788782, 3.814314, 1, 0, 0.2352941, 1,
1.826349, 0.1561162, 1.19908, 1, 0, 0.227451, 1,
1.829675, 2.240735, 0.7054281, 1, 0, 0.2235294, 1,
1.861652, 0.354322, 2.339057, 1, 0, 0.2156863, 1,
1.86946, -0.9964107, 0.4421612, 1, 0, 0.2117647, 1,
1.904138, 1.490749, 0.4735224, 1, 0, 0.2039216, 1,
1.916068, 0.7580144, 1.776963, 1, 0, 0.1960784, 1,
1.924544, 0.01746199, -0.2480969, 1, 0, 0.1921569, 1,
1.929249, 0.8292115, 2.736368, 1, 0, 0.1843137, 1,
1.947461, 0.1930453, 0.2419005, 1, 0, 0.1803922, 1,
1.958997, -0.8060136, 2.822695, 1, 0, 0.172549, 1,
1.989612, 0.4248914, 0.8982587, 1, 0, 0.1686275, 1,
2.00935, 0.517038, 1.59996, 1, 0, 0.1607843, 1,
2.032267, -0.2269264, 0.113537, 1, 0, 0.1568628, 1,
2.042757, -0.451306, 2.131641, 1, 0, 0.1490196, 1,
2.045391, -1.079226, 2.431989, 1, 0, 0.145098, 1,
2.105009, 1.14178, 0.1719168, 1, 0, 0.1372549, 1,
2.165117, 0.7565536, -0.2431926, 1, 0, 0.1333333, 1,
2.177421, 0.4593101, 0.5260698, 1, 0, 0.1254902, 1,
2.193702, -0.5242061, 1.527277, 1, 0, 0.1215686, 1,
2.249815, 0.274746, 1.725658, 1, 0, 0.1137255, 1,
2.321609, -0.5714689, 1.702162, 1, 0, 0.1098039, 1,
2.386498, 1.163414, 1.599391, 1, 0, 0.1019608, 1,
2.400505, 0.5242789, 2.416188, 1, 0, 0.09411765, 1,
2.429043, 0.6480124, -1.0325, 1, 0, 0.09019608, 1,
2.546807, 0.3701433, 1.254016, 1, 0, 0.08235294, 1,
2.562323, 1.423466, 0.4646709, 1, 0, 0.07843138, 1,
2.576826, -1.15801, 2.584814, 1, 0, 0.07058824, 1,
2.615166, -1.291306, 1.526041, 1, 0, 0.06666667, 1,
2.637315, 1.005031, 2.364764, 1, 0, 0.05882353, 1,
2.692847, 0.1248799, 2.319069, 1, 0, 0.05490196, 1,
2.753271, -0.1099177, 2.480747, 1, 0, 0.04705882, 1,
2.755781, -0.1085996, 0.1794461, 1, 0, 0.04313726, 1,
2.837421, -1.725363, 5.3709, 1, 0, 0.03529412, 1,
2.899319, -0.4954643, 3.052666, 1, 0, 0.03137255, 1,
2.943373, 0.7176923, -0.1990153, 1, 0, 0.02352941, 1,
2.954952, 1.144268, 0.7135426, 1, 0, 0.01960784, 1,
3.099289, 0.4677368, 2.684335, 1, 0, 0.01176471, 1,
3.335556, 0.6961266, 1.447241, 1, 0, 0.007843138, 1
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
-0.07408535, -4.193088, -8.217693, 0, -0.5, 0.5, 0.5,
-0.07408535, -4.193088, -8.217693, 1, -0.5, 0.5, 0.5,
-0.07408535, -4.193088, -8.217693, 1, 1.5, 0.5, 0.5,
-0.07408535, -4.193088, -8.217693, 0, 1.5, 0.5, 0.5
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
-4.639595, -0.1153661, -8.217693, 0, -0.5, 0.5, 0.5,
-4.639595, -0.1153661, -8.217693, 1, -0.5, 0.5, 0.5,
-4.639595, -0.1153661, -8.217693, 1, 1.5, 0.5, 0.5,
-4.639595, -0.1153661, -8.217693, 0, 1.5, 0.5, 0.5
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
-4.639595, -4.193088, -0.3956892, 0, -0.5, 0.5, 0.5,
-4.639595, -4.193088, -0.3956892, 1, -0.5, 0.5, 0.5,
-4.639595, -4.193088, -0.3956892, 1, 1.5, 0.5, 0.5,
-4.639595, -4.193088, -0.3956892, 0, 1.5, 0.5, 0.5
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
-3, -3.252075, -6.412615,
3, -3.252075, -6.412615,
-3, -3.252075, -6.412615,
-3, -3.408911, -6.713462,
-2, -3.252075, -6.412615,
-2, -3.408911, -6.713462,
-1, -3.252075, -6.412615,
-1, -3.408911, -6.713462,
0, -3.252075, -6.412615,
0, -3.408911, -6.713462,
1, -3.252075, -6.412615,
1, -3.408911, -6.713462,
2, -3.252075, -6.412615,
2, -3.408911, -6.713462,
3, -3.252075, -6.412615,
3, -3.408911, -6.713462
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
-3, -3.722582, -7.315155, 0, -0.5, 0.5, 0.5,
-3, -3.722582, -7.315155, 1, -0.5, 0.5, 0.5,
-3, -3.722582, -7.315155, 1, 1.5, 0.5, 0.5,
-3, -3.722582, -7.315155, 0, 1.5, 0.5, 0.5,
-2, -3.722582, -7.315155, 0, -0.5, 0.5, 0.5,
-2, -3.722582, -7.315155, 1, -0.5, 0.5, 0.5,
-2, -3.722582, -7.315155, 1, 1.5, 0.5, 0.5,
-2, -3.722582, -7.315155, 0, 1.5, 0.5, 0.5,
-1, -3.722582, -7.315155, 0, -0.5, 0.5, 0.5,
-1, -3.722582, -7.315155, 1, -0.5, 0.5, 0.5,
-1, -3.722582, -7.315155, 1, 1.5, 0.5, 0.5,
-1, -3.722582, -7.315155, 0, 1.5, 0.5, 0.5,
0, -3.722582, -7.315155, 0, -0.5, 0.5, 0.5,
0, -3.722582, -7.315155, 1, -0.5, 0.5, 0.5,
0, -3.722582, -7.315155, 1, 1.5, 0.5, 0.5,
0, -3.722582, -7.315155, 0, 1.5, 0.5, 0.5,
1, -3.722582, -7.315155, 0, -0.5, 0.5, 0.5,
1, -3.722582, -7.315155, 1, -0.5, 0.5, 0.5,
1, -3.722582, -7.315155, 1, 1.5, 0.5, 0.5,
1, -3.722582, -7.315155, 0, 1.5, 0.5, 0.5,
2, -3.722582, -7.315155, 0, -0.5, 0.5, 0.5,
2, -3.722582, -7.315155, 1, -0.5, 0.5, 0.5,
2, -3.722582, -7.315155, 1, 1.5, 0.5, 0.5,
2, -3.722582, -7.315155, 0, 1.5, 0.5, 0.5,
3, -3.722582, -7.315155, 0, -0.5, 0.5, 0.5,
3, -3.722582, -7.315155, 1, -0.5, 0.5, 0.5,
3, -3.722582, -7.315155, 1, 1.5, 0.5, 0.5,
3, -3.722582, -7.315155, 0, 1.5, 0.5, 0.5
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
-3.586016, -3, -6.412615,
-3.586016, 2, -6.412615,
-3.586016, -3, -6.412615,
-3.761612, -3, -6.713462,
-3.586016, -2, -6.412615,
-3.761612, -2, -6.713462,
-3.586016, -1, -6.412615,
-3.761612, -1, -6.713462,
-3.586016, 0, -6.412615,
-3.761612, 0, -6.713462,
-3.586016, 1, -6.412615,
-3.761612, 1, -6.713462,
-3.586016, 2, -6.412615,
-3.761612, 2, -6.713462
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
-4.112805, -3, -7.315155, 0, -0.5, 0.5, 0.5,
-4.112805, -3, -7.315155, 1, -0.5, 0.5, 0.5,
-4.112805, -3, -7.315155, 1, 1.5, 0.5, 0.5,
-4.112805, -3, -7.315155, 0, 1.5, 0.5, 0.5,
-4.112805, -2, -7.315155, 0, -0.5, 0.5, 0.5,
-4.112805, -2, -7.315155, 1, -0.5, 0.5, 0.5,
-4.112805, -2, -7.315155, 1, 1.5, 0.5, 0.5,
-4.112805, -2, -7.315155, 0, 1.5, 0.5, 0.5,
-4.112805, -1, -7.315155, 0, -0.5, 0.5, 0.5,
-4.112805, -1, -7.315155, 1, -0.5, 0.5, 0.5,
-4.112805, -1, -7.315155, 1, 1.5, 0.5, 0.5,
-4.112805, -1, -7.315155, 0, 1.5, 0.5, 0.5,
-4.112805, 0, -7.315155, 0, -0.5, 0.5, 0.5,
-4.112805, 0, -7.315155, 1, -0.5, 0.5, 0.5,
-4.112805, 0, -7.315155, 1, 1.5, 0.5, 0.5,
-4.112805, 0, -7.315155, 0, 1.5, 0.5, 0.5,
-4.112805, 1, -7.315155, 0, -0.5, 0.5, 0.5,
-4.112805, 1, -7.315155, 1, -0.5, 0.5, 0.5,
-4.112805, 1, -7.315155, 1, 1.5, 0.5, 0.5,
-4.112805, 1, -7.315155, 0, 1.5, 0.5, 0.5,
-4.112805, 2, -7.315155, 0, -0.5, 0.5, 0.5,
-4.112805, 2, -7.315155, 1, -0.5, 0.5, 0.5,
-4.112805, 2, -7.315155, 1, 1.5, 0.5, 0.5,
-4.112805, 2, -7.315155, 0, 1.5, 0.5, 0.5
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
-3.586016, -3.252075, -6,
-3.586016, -3.252075, 4,
-3.586016, -3.252075, -6,
-3.761612, -3.408911, -6,
-3.586016, -3.252075, -4,
-3.761612, -3.408911, -4,
-3.586016, -3.252075, -2,
-3.761612, -3.408911, -2,
-3.586016, -3.252075, 0,
-3.761612, -3.408911, 0,
-3.586016, -3.252075, 2,
-3.761612, -3.408911, 2,
-3.586016, -3.252075, 4,
-3.761612, -3.408911, 4
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
-4.112805, -3.722582, -6, 0, -0.5, 0.5, 0.5,
-4.112805, -3.722582, -6, 1, -0.5, 0.5, 0.5,
-4.112805, -3.722582, -6, 1, 1.5, 0.5, 0.5,
-4.112805, -3.722582, -6, 0, 1.5, 0.5, 0.5,
-4.112805, -3.722582, -4, 0, -0.5, 0.5, 0.5,
-4.112805, -3.722582, -4, 1, -0.5, 0.5, 0.5,
-4.112805, -3.722582, -4, 1, 1.5, 0.5, 0.5,
-4.112805, -3.722582, -4, 0, 1.5, 0.5, 0.5,
-4.112805, -3.722582, -2, 0, -0.5, 0.5, 0.5,
-4.112805, -3.722582, -2, 1, -0.5, 0.5, 0.5,
-4.112805, -3.722582, -2, 1, 1.5, 0.5, 0.5,
-4.112805, -3.722582, -2, 0, 1.5, 0.5, 0.5,
-4.112805, -3.722582, 0, 0, -0.5, 0.5, 0.5,
-4.112805, -3.722582, 0, 1, -0.5, 0.5, 0.5,
-4.112805, -3.722582, 0, 1, 1.5, 0.5, 0.5,
-4.112805, -3.722582, 0, 0, 1.5, 0.5, 0.5,
-4.112805, -3.722582, 2, 0, -0.5, 0.5, 0.5,
-4.112805, -3.722582, 2, 1, -0.5, 0.5, 0.5,
-4.112805, -3.722582, 2, 1, 1.5, 0.5, 0.5,
-4.112805, -3.722582, 2, 0, 1.5, 0.5, 0.5,
-4.112805, -3.722582, 4, 0, -0.5, 0.5, 0.5,
-4.112805, -3.722582, 4, 1, -0.5, 0.5, 0.5,
-4.112805, -3.722582, 4, 1, 1.5, 0.5, 0.5,
-4.112805, -3.722582, 4, 0, 1.5, 0.5, 0.5
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
-3.586016, -3.252075, -6.412615,
-3.586016, 3.021343, -6.412615,
-3.586016, -3.252075, 5.621237,
-3.586016, 3.021343, 5.621237,
-3.586016, -3.252075, -6.412615,
-3.586016, -3.252075, 5.621237,
-3.586016, 3.021343, -6.412615,
-3.586016, 3.021343, 5.621237,
-3.586016, -3.252075, -6.412615,
3.437845, -3.252075, -6.412615,
-3.586016, -3.252075, 5.621237,
3.437845, -3.252075, 5.621237,
-3.586016, 3.021343, -6.412615,
3.437845, 3.021343, -6.412615,
-3.586016, 3.021343, 5.621237,
3.437845, 3.021343, 5.621237,
3.437845, -3.252075, -6.412615,
3.437845, 3.021343, -6.412615,
3.437845, -3.252075, 5.621237,
3.437845, 3.021343, 5.621237,
3.437845, -3.252075, -6.412615,
3.437845, -3.252075, 5.621237,
3.437845, 3.021343, -6.412615,
3.437845, 3.021343, 5.621237
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
var radius = 8.159671;
var distance = 36.3033;
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
mvMatrix.translate( 0.07408535, 0.1153661, 0.3956892 );
mvMatrix.scale( 1.256061, 1.406314, 0.7331315 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.3033);
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
pyriminobac-methyl<-read.table("pyriminobac-methyl.xyz")
```

```
## Error in read.table("pyriminobac-methyl.xyz"): no lines available in input
```

```r
x<-pyriminobac-methyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'pyriminobac' not found
```

```r
y<-pyriminobac-methyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'pyriminobac' not found
```

```r
z<-pyriminobac-methyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'pyriminobac' not found
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
-3.483727, -1.717055, -1.805967, 0, 0, 1, 1, 1,
-2.964748, 0.5756751, -1.666569, 1, 0, 0, 1, 1,
-2.696713, 0.08158597, -2.629104, 1, 0, 0, 1, 1,
-2.605261, 1.006552, 0.3589498, 1, 0, 0, 1, 1,
-2.591094, 2.365445, 0.4982573, 1, 0, 0, 1, 1,
-2.449812, -1.336196, -1.706625, 1, 0, 0, 1, 1,
-2.372336, 0.1471767, -2.509164, 0, 0, 0, 1, 1,
-2.312621, -0.3948761, -1.79413, 0, 0, 0, 1, 1,
-2.275763, -0.01618288, -0.4800871, 0, 0, 0, 1, 1,
-2.265952, 0.2580736, -1.515071, 0, 0, 0, 1, 1,
-2.166411, 0.9250028, -2.00313, 0, 0, 0, 1, 1,
-2.14511, 1.544576, -0.7768093, 0, 0, 0, 1, 1,
-2.087732, -0.5737796, -2.567162, 0, 0, 0, 1, 1,
-2.08474, 0.8712583, -2.51925, 1, 1, 1, 1, 1,
-2.034654, -1.022174, -1.314877, 1, 1, 1, 1, 1,
-2.026082, -1.260677, -0.5721563, 1, 1, 1, 1, 1,
-2.015139, -0.06231089, -0.2842006, 1, 1, 1, 1, 1,
-1.99496, 0.5533699, -1.357621, 1, 1, 1, 1, 1,
-1.979197, 1.150697, -0.1603024, 1, 1, 1, 1, 1,
-1.97295, 1.983206, 0.1163879, 1, 1, 1, 1, 1,
-1.971175, -1.014483, -1.330435, 1, 1, 1, 1, 1,
-1.912408, 1.818953, -0.2864466, 1, 1, 1, 1, 1,
-1.892097, -0.7426872, -1.164254, 1, 1, 1, 1, 1,
-1.877646, 0.1943607, -0.9038689, 1, 1, 1, 1, 1,
-1.867488, 1.790942, 0.08139959, 1, 1, 1, 1, 1,
-1.85642, -1.458743, -1.89585, 1, 1, 1, 1, 1,
-1.851841, -1.556547, -4.005704, 1, 1, 1, 1, 1,
-1.828927, 0.7816244, 0.2886506, 1, 1, 1, 1, 1,
-1.820319, -1.652919, -3.262806, 0, 0, 1, 1, 1,
-1.814588, -1.132302, -3.619797, 1, 0, 0, 1, 1,
-1.798581, -2.984167, -4.313393, 1, 0, 0, 1, 1,
-1.773057, 0.4561347, -2.673716, 1, 0, 0, 1, 1,
-1.763099, -0.03802054, -1.564016, 1, 0, 0, 1, 1,
-1.761231, -1.636651, -2.773941, 1, 0, 0, 1, 1,
-1.730032, 0.3594611, -1.768502, 0, 0, 0, 1, 1,
-1.726461, -1.040025, -3.467786, 0, 0, 0, 1, 1,
-1.720411, 1.090782, -1.535341, 0, 0, 0, 1, 1,
-1.709049, 0.4356304, -2.113587, 0, 0, 0, 1, 1,
-1.708886, -1.042784, -1.041955, 0, 0, 0, 1, 1,
-1.708154, -0.9338908, -1.741555, 0, 0, 0, 1, 1,
-1.693416, -1.068324, -2.096305, 0, 0, 0, 1, 1,
-1.692227, -1.209332, -0.6244857, 1, 1, 1, 1, 1,
-1.689822, -1.750261, -2.036686, 1, 1, 1, 1, 1,
-1.67983, -0.9421188, -3.130494, 1, 1, 1, 1, 1,
-1.66456, -0.2604767, -0.5767004, 1, 1, 1, 1, 1,
-1.660546, -0.09760104, -0.5004865, 1, 1, 1, 1, 1,
-1.651376, -0.2770706, -2.474644, 1, 1, 1, 1, 1,
-1.638683, -0.03567401, -0.6390308, 1, 1, 1, 1, 1,
-1.625794, -1.056682, -1.677389, 1, 1, 1, 1, 1,
-1.619578, -0.1238704, -3.644511, 1, 1, 1, 1, 1,
-1.615421, -0.8663552, -1.86327, 1, 1, 1, 1, 1,
-1.604891, -1.427584, -1.409801, 1, 1, 1, 1, 1,
-1.599957, -1.019523, -2.44756, 1, 1, 1, 1, 1,
-1.56914, -1.020886, -2.824563, 1, 1, 1, 1, 1,
-1.566951, -0.9741062, -2.523606, 1, 1, 1, 1, 1,
-1.550249, 0.03388676, -1.559691, 1, 1, 1, 1, 1,
-1.546138, 0.1167921, -2.835641, 0, 0, 1, 1, 1,
-1.52064, -0.008939913, 0.7370507, 1, 0, 0, 1, 1,
-1.518419, -0.8672797, -0.2499036, 1, 0, 0, 1, 1,
-1.517499, 0.6644235, -0.5721403, 1, 0, 0, 1, 1,
-1.515278, -0.41517, -1.537629, 1, 0, 0, 1, 1,
-1.502921, -0.2419199, -2.789256, 1, 0, 0, 1, 1,
-1.502049, -0.3564949, -0.8524392, 0, 0, 0, 1, 1,
-1.494217, -1.129407, -2.908776, 0, 0, 0, 1, 1,
-1.491446, -0.8581117, -1.562691, 0, 0, 0, 1, 1,
-1.487701, -0.4618587, -1.715568, 0, 0, 0, 1, 1,
-1.460153, -2.104196, -2.923963, 0, 0, 0, 1, 1,
-1.455913, 0.329718, -0.610958, 0, 0, 0, 1, 1,
-1.454538, 0.3076276, -1.68916, 0, 0, 0, 1, 1,
-1.45236, -1.992663, -3.209371, 1, 1, 1, 1, 1,
-1.442325, -1.611527, -2.533972, 1, 1, 1, 1, 1,
-1.422218, -0.1039483, -1.54798, 1, 1, 1, 1, 1,
-1.415258, 1.113253, -1.497316, 1, 1, 1, 1, 1,
-1.391543, -0.1400519, -2.195905, 1, 1, 1, 1, 1,
-1.382165, -1.107579, -1.667492, 1, 1, 1, 1, 1,
-1.368145, 1.176192, -1.275848, 1, 1, 1, 1, 1,
-1.36397, 0.2020613, -1.452892, 1, 1, 1, 1, 1,
-1.355472, 1.270772, -1.041593, 1, 1, 1, 1, 1,
-1.354639, -0.5902286, -2.818125, 1, 1, 1, 1, 1,
-1.34188, 0.502533, 0.6235038, 1, 1, 1, 1, 1,
-1.33862, -0.7977443, -0.35527, 1, 1, 1, 1, 1,
-1.33285, -0.8891183, -1.387227, 1, 1, 1, 1, 1,
-1.330079, -0.7521381, -3.162379, 1, 1, 1, 1, 1,
-1.32717, -1.124555, -2.00129, 1, 1, 1, 1, 1,
-1.319617, -1.075598, -1.467789, 0, 0, 1, 1, 1,
-1.310175, 0.1143978, -2.243467, 1, 0, 0, 1, 1,
-1.300133, -1.45781, -3.109661, 1, 0, 0, 1, 1,
-1.297845, -0.8701308, -1.3173, 1, 0, 0, 1, 1,
-1.289632, 0.09324238, -3.015675, 1, 0, 0, 1, 1,
-1.283597, 0.3121355, -2.364629, 1, 0, 0, 1, 1,
-1.283266, 0.6057407, -1.135816, 0, 0, 0, 1, 1,
-1.282635, 0.3884397, -0.3960794, 0, 0, 0, 1, 1,
-1.282632, -0.5003023, -1.531316, 0, 0, 0, 1, 1,
-1.253249, -0.8309709, -1.1673, 0, 0, 0, 1, 1,
-1.251279, 0.3840441, -0.7057033, 0, 0, 0, 1, 1,
-1.247729, -0.05407499, -1.092547, 0, 0, 0, 1, 1,
-1.2357, -1.234946, -3.400205, 0, 0, 0, 1, 1,
-1.228351, -0.5138166, -2.747675, 1, 1, 1, 1, 1,
-1.223932, -0.726772, -1.531267, 1, 1, 1, 1, 1,
-1.219659, -0.7580918, -1.306876, 1, 1, 1, 1, 1,
-1.213517, -0.7099468, -1.462857, 1, 1, 1, 1, 1,
-1.213402, -0.05537823, -1.19766, 1, 1, 1, 1, 1,
-1.200582, -1.19875, -2.357851, 1, 1, 1, 1, 1,
-1.19891, -0.5304928, -1.951076, 1, 1, 1, 1, 1,
-1.194098, 0.7282704, -0.0320995, 1, 1, 1, 1, 1,
-1.193437, 0.224579, -0.5121837, 1, 1, 1, 1, 1,
-1.174801, 0.7731754, -0.6763815, 1, 1, 1, 1, 1,
-1.169256, 0.3439777, -0.4865771, 1, 1, 1, 1, 1,
-1.168465, 0.3358586, -0.4134672, 1, 1, 1, 1, 1,
-1.157502, -0.2289057, -3.766517, 1, 1, 1, 1, 1,
-1.1516, -1.059611, -2.245177, 1, 1, 1, 1, 1,
-1.150666, 1.174606, -0.7449489, 1, 1, 1, 1, 1,
-1.145921, -0.8274472, -0.5043313, 0, 0, 1, 1, 1,
-1.14212, 0.5166118, -1.032041, 1, 0, 0, 1, 1,
-1.13517, 0.452574, 1.246401, 1, 0, 0, 1, 1,
-1.122112, 0.5024362, 0.3373415, 1, 0, 0, 1, 1,
-1.115646, -0.1241188, -1.35569, 1, 0, 0, 1, 1,
-1.106447, 2.213362, -2.112349, 1, 0, 0, 1, 1,
-1.106079, -0.5734683, -2.970458, 0, 0, 0, 1, 1,
-1.103781, -1.196172, -3.107578, 0, 0, 0, 1, 1,
-1.101256, 0.1199053, -2.76556, 0, 0, 0, 1, 1,
-1.100237, -0.2580985, -1.755709, 0, 0, 0, 1, 1,
-1.097802, -2.336211, -1.469103, 0, 0, 0, 1, 1,
-1.094758, -0.4666979, -2.744633, 0, 0, 0, 1, 1,
-1.092874, -0.9587814, -3.058394, 0, 0, 0, 1, 1,
-1.078492, -0.8456534, -3.391763, 1, 1, 1, 1, 1,
-1.074719, 0.03417035, -0.4542926, 1, 1, 1, 1, 1,
-1.062048, -0.08823231, -2.319416, 1, 1, 1, 1, 1,
-1.05741, 0.2206926, -0.4016588, 1, 1, 1, 1, 1,
-1.038784, 0.2104228, -1.676054, 1, 1, 1, 1, 1,
-1.038406, -1.203575, -3.811479, 1, 1, 1, 1, 1,
-1.036075, 0.349746, -3.213693, 1, 1, 1, 1, 1,
-1.035199, -0.8659502, -2.078523, 1, 1, 1, 1, 1,
-1.033404, 0.3700056, -1.554202, 1, 1, 1, 1, 1,
-1.029096, -1.32273, -2.81499, 1, 1, 1, 1, 1,
-1.016671, 0.1032268, -3.466706, 1, 1, 1, 1, 1,
-1.012361, 1.902403, -1.553414, 1, 1, 1, 1, 1,
-1.009419, -0.8778874, -2.554222, 1, 1, 1, 1, 1,
-1.003463, -0.547281, -1.473532, 1, 1, 1, 1, 1,
-1.000216, -0.7317372, -2.119176, 1, 1, 1, 1, 1,
-0.9985487, 0.5018789, 0.04852184, 0, 0, 1, 1, 1,
-0.9975248, -0.668193, -2.372768, 1, 0, 0, 1, 1,
-0.9962513, 0.8781269, -1.848497, 1, 0, 0, 1, 1,
-0.9912941, 1.226901, 0.6403512, 1, 0, 0, 1, 1,
-0.9908566, 0.7619066, -0.8656835, 1, 0, 0, 1, 1,
-0.9840249, -0.6159601, -2.414829, 1, 0, 0, 1, 1,
-0.9742468, 0.8374959, -1.145001, 0, 0, 0, 1, 1,
-0.9731416, 0.1079696, -1.111796, 0, 0, 0, 1, 1,
-0.9717745, -1.329654, -2.276651, 0, 0, 0, 1, 1,
-0.96849, -1.543302, -2.512287, 0, 0, 0, 1, 1,
-0.9659313, -0.8564729, -3.066977, 0, 0, 0, 1, 1,
-0.9628488, -0.4522998, -3.706701, 0, 0, 0, 1, 1,
-0.9612122, 1.15307, -1.021195, 0, 0, 0, 1, 1,
-0.9572699, 0.2114345, -0.9257267, 1, 1, 1, 1, 1,
-0.956282, 0.3506828, -2.334979, 1, 1, 1, 1, 1,
-0.9522743, 0.384461, -1.521808, 1, 1, 1, 1, 1,
-0.9455716, -0.8072414, -0.8849822, 1, 1, 1, 1, 1,
-0.944748, -0.2640581, -1.868194, 1, 1, 1, 1, 1,
-0.9397448, -1.279495, -1.981987, 1, 1, 1, 1, 1,
-0.9321079, 1.864205, 0.5040758, 1, 1, 1, 1, 1,
-0.9298994, 0.2185485, -1.994959, 1, 1, 1, 1, 1,
-0.9279367, 0.6272183, -0.7364752, 1, 1, 1, 1, 1,
-0.9275376, 1.439901, -0.6633009, 1, 1, 1, 1, 1,
-0.9274215, -1.224345, -1.138873, 1, 1, 1, 1, 1,
-0.9272653, -1.160475, -2.226164, 1, 1, 1, 1, 1,
-0.9184414, -1.539573, -0.5565141, 1, 1, 1, 1, 1,
-0.916337, -1.171702, -3.358439, 1, 1, 1, 1, 1,
-0.914076, 1.011428, -0.8020914, 1, 1, 1, 1, 1,
-0.9083572, 0.6008197, -0.5170958, 0, 0, 1, 1, 1,
-0.9077246, 0.2243456, -1.272675, 1, 0, 0, 1, 1,
-0.9024719, 0.4941172, -0.7748435, 1, 0, 0, 1, 1,
-0.8970631, -0.7666142, -1.200124, 1, 0, 0, 1, 1,
-0.8911806, -0.223125, -0.4541556, 1, 0, 0, 1, 1,
-0.8848428, 2.369827, -2.085414, 1, 0, 0, 1, 1,
-0.8760958, -0.718376, -3.246889, 0, 0, 0, 1, 1,
-0.8759026, 1.078001, -0.5999544, 0, 0, 0, 1, 1,
-0.874281, -1.833783, -3.509712, 0, 0, 0, 1, 1,
-0.8731132, 0.1340023, -0.8368222, 0, 0, 0, 1, 1,
-0.8702571, -0.7574388, -1.135362, 0, 0, 0, 1, 1,
-0.8678429, -2.221177, -1.472264, 0, 0, 0, 1, 1,
-0.8666689, -0.4452458, -1.99584, 0, 0, 0, 1, 1,
-0.8660287, 0.7116785, -1.558423, 1, 1, 1, 1, 1,
-0.8634918, 0.5523678, 0.3973135, 1, 1, 1, 1, 1,
-0.8603737, 2.00707, 1.048836, 1, 1, 1, 1, 1,
-0.8579055, -0.5674928, -1.598777, 1, 1, 1, 1, 1,
-0.8487537, 0.4574094, -2.511395, 1, 1, 1, 1, 1,
-0.8428576, 1.450547, -2.277371, 1, 1, 1, 1, 1,
-0.8407294, 0.5503136, -0.1002032, 1, 1, 1, 1, 1,
-0.8290924, 0.03811997, -4.102217, 1, 1, 1, 1, 1,
-0.8284485, -2.221249, -3.44124, 1, 1, 1, 1, 1,
-0.8260615, 0.7596709, -0.0355589, 1, 1, 1, 1, 1,
-0.8201519, 1.035623, -1.624598, 1, 1, 1, 1, 1,
-0.8181614, -1.454875, -3.933958, 1, 1, 1, 1, 1,
-0.8176043, 2.515755, 0.2985882, 1, 1, 1, 1, 1,
-0.8142733, -0.9256093, -2.618586, 1, 1, 1, 1, 1,
-0.809064, -0.3732891, -1.338709, 1, 1, 1, 1, 1,
-0.8066857, 0.5093265, -0.350331, 0, 0, 1, 1, 1,
-0.8061777, 0.3806857, -1.67253, 1, 0, 0, 1, 1,
-0.8013699, -0.3160745, -2.26056, 1, 0, 0, 1, 1,
-0.7944882, -0.2701893, -0.8956944, 1, 0, 0, 1, 1,
-0.792601, -0.2994229, -2.818111, 1, 0, 0, 1, 1,
-0.791083, 1.440049, -1.166831, 1, 0, 0, 1, 1,
-0.7862329, 0.295864, -1.331809, 0, 0, 0, 1, 1,
-0.7808209, -0.8074165, -2.843487, 0, 0, 0, 1, 1,
-0.7786586, -0.3069042, -0.02884214, 0, 0, 0, 1, 1,
-0.7779154, 0.3295164, -1.605057, 0, 0, 0, 1, 1,
-0.7688941, 0.8721594, -0.7828068, 0, 0, 0, 1, 1,
-0.762259, 0.7924288, 0.2330264, 0, 0, 0, 1, 1,
-0.7620004, 0.8250452, -0.6066884, 0, 0, 0, 1, 1,
-0.7544938, 1.339381, -2.350817, 1, 1, 1, 1, 1,
-0.7505023, -0.7240547, -2.65951, 1, 1, 1, 1, 1,
-0.7500908, -3.160715, -2.6201, 1, 1, 1, 1, 1,
-0.7491757, -0.3927694, -2.005875, 1, 1, 1, 1, 1,
-0.7460149, 1.231098, -1.356477, 1, 1, 1, 1, 1,
-0.7426178, 0.9285303, 2.17107, 1, 1, 1, 1, 1,
-0.7424212, 2.082809, -2.808768, 1, 1, 1, 1, 1,
-0.7392406, 0.499683, -3.047451, 1, 1, 1, 1, 1,
-0.7391939, 0.009803342, 0.6514519, 1, 1, 1, 1, 1,
-0.7335057, -1.243946, -3.049572, 1, 1, 1, 1, 1,
-0.7333706, -0.1425759, -0.5794508, 1, 1, 1, 1, 1,
-0.7327858, 0.3054933, -1.288859, 1, 1, 1, 1, 1,
-0.731064, -0.5177981, -3.354131, 1, 1, 1, 1, 1,
-0.7307293, 0.3784246, -1.549328, 1, 1, 1, 1, 1,
-0.7295182, 0.2176946, 0.1421669, 1, 1, 1, 1, 1,
-0.7282501, -0.09901197, -1.551193, 0, 0, 1, 1, 1,
-0.7243099, 0.1792349, -1.461195, 1, 0, 0, 1, 1,
-0.720633, 0.8267148, -0.4568842, 1, 0, 0, 1, 1,
-0.7201994, 0.7681245, -1.549952, 1, 0, 0, 1, 1,
-0.7124315, -1.640149, -3.277069, 1, 0, 0, 1, 1,
-0.7112964, -0.5080507, -4.057498, 1, 0, 0, 1, 1,
-0.710042, -2.102578, -2.314889, 0, 0, 0, 1, 1,
-0.7098166, 0.5575269, -1.95344, 0, 0, 0, 1, 1,
-0.7095713, 1.835688, 0.5502506, 0, 0, 0, 1, 1,
-0.7074291, -0.9787533, -1.569475, 0, 0, 0, 1, 1,
-0.7050604, 1.307745, -0.3897048, 0, 0, 0, 1, 1,
-0.7027424, -0.2957634, -3.265482, 0, 0, 0, 1, 1,
-0.6965834, -1.309932, -2.086929, 0, 0, 0, 1, 1,
-0.6945655, -0.346442, -1.471641, 1, 1, 1, 1, 1,
-0.6944022, 1.282571, -2.285947, 1, 1, 1, 1, 1,
-0.693186, 1.466993, -2.463701, 1, 1, 1, 1, 1,
-0.689733, 0.0221664, -4.327526, 1, 1, 1, 1, 1,
-0.6886239, -0.6412396, -2.78241, 1, 1, 1, 1, 1,
-0.6878631, 1.221531, 1.185879, 1, 1, 1, 1, 1,
-0.6859903, 0.6352761, -1.045987, 1, 1, 1, 1, 1,
-0.6778108, -0.1110498, -2.356273, 1, 1, 1, 1, 1,
-0.677301, 0.4297905, -1.315677, 1, 1, 1, 1, 1,
-0.6762405, 0.2969222, 0.5983768, 1, 1, 1, 1, 1,
-0.6678914, -0.6999158, -1.294091, 1, 1, 1, 1, 1,
-0.6645926, 0.01696244, -1.13976, 1, 1, 1, 1, 1,
-0.6621903, 2.481923, 1.119165, 1, 1, 1, 1, 1,
-0.6620603, -0.4330414, -2.887328, 1, 1, 1, 1, 1,
-0.6614767, -1.87226, -1.733577, 1, 1, 1, 1, 1,
-0.6591225, -0.5756272, -0.3200961, 0, 0, 1, 1, 1,
-0.6561946, 1.02049, 0.06142341, 1, 0, 0, 1, 1,
-0.6426653, 1.034166, -0.8890574, 1, 0, 0, 1, 1,
-0.6385567, -0.81862, -2.118768, 1, 0, 0, 1, 1,
-0.637306, -0.6924514, -3.359952, 1, 0, 0, 1, 1,
-0.6352549, 1.545815, -0.2431242, 1, 0, 0, 1, 1,
-0.6238877, 0.52848, 0.0926736, 0, 0, 0, 1, 1,
-0.6129156, 0.5564858, -1.393418, 0, 0, 0, 1, 1,
-0.6094812, -0.4640668, -5.167609, 0, 0, 0, 1, 1,
-0.6085514, 1.614252, -0.1762521, 0, 0, 0, 1, 1,
-0.5986562, -1.451446, -1.584654, 0, 0, 0, 1, 1,
-0.5946921, 0.852718, -0.4442481, 0, 0, 0, 1, 1,
-0.5908505, -0.2113392, -2.065087, 0, 0, 0, 1, 1,
-0.5760543, -1.015396, -3.980814, 1, 1, 1, 1, 1,
-0.5723752, -0.24598, 0.01452543, 1, 1, 1, 1, 1,
-0.5676814, -0.3584397, -1.668013, 1, 1, 1, 1, 1,
-0.5643705, 1.049966, -1.323204, 1, 1, 1, 1, 1,
-0.5636541, -0.687529, -3.409084, 1, 1, 1, 1, 1,
-0.5631374, 1.655518, -1.590257, 1, 1, 1, 1, 1,
-0.5491385, -0.4952239, -1.874904, 1, 1, 1, 1, 1,
-0.5449719, -1.360588, -1.508656, 1, 1, 1, 1, 1,
-0.54484, 0.7665085, -1.064317, 1, 1, 1, 1, 1,
-0.5447506, 1.419137, -0.2230273, 1, 1, 1, 1, 1,
-0.541751, -0.958719, -3.366325, 1, 1, 1, 1, 1,
-0.5386592, -0.9025194, -2.128746, 1, 1, 1, 1, 1,
-0.5369101, -1.461598, -2.387288, 1, 1, 1, 1, 1,
-0.5362717, -0.2393158, -1.627879, 1, 1, 1, 1, 1,
-0.5355897, 1.143497, -1.087783, 1, 1, 1, 1, 1,
-0.528769, 0.9278465, -0.63451, 0, 0, 1, 1, 1,
-0.5210584, -2.478418, -3.269567, 1, 0, 0, 1, 1,
-0.5170875, 1.422606, -1.123444, 1, 0, 0, 1, 1,
-0.5125321, -1.515638, -1.971161, 1, 0, 0, 1, 1,
-0.5102409, -0.7368504, -2.796563, 1, 0, 0, 1, 1,
-0.5091938, -0.2492511, -3.440635, 1, 0, 0, 1, 1,
-0.5077893, -0.2596391, -2.109177, 0, 0, 0, 1, 1,
-0.5045442, -0.05635438, -2.180908, 0, 0, 0, 1, 1,
-0.5040485, -0.07636937, -0.3190149, 0, 0, 0, 1, 1,
-0.5034873, 1.087996, -0.03844106, 0, 0, 0, 1, 1,
-0.5030829, 2.333195, -0.008831311, 0, 0, 0, 1, 1,
-0.5024932, -0.3110007, -3.305226, 0, 0, 0, 1, 1,
-0.4963591, -0.5731224, -1.693836, 0, 0, 0, 1, 1,
-0.4925127, 1.375182, -0.1956199, 1, 1, 1, 1, 1,
-0.4909152, 0.01076311, -1.295805, 1, 1, 1, 1, 1,
-0.4903135, -0.6175657, -2.023279, 1, 1, 1, 1, 1,
-0.4892055, -0.797819, -1.558224, 1, 1, 1, 1, 1,
-0.4824076, 0.9036292, -2.06577, 1, 1, 1, 1, 1,
-0.4812032, -0.1206098, -0.4039164, 1, 1, 1, 1, 1,
-0.4708858, 0.1807856, 0.02143596, 1, 1, 1, 1, 1,
-0.4653278, -0.8059071, -1.815176, 1, 1, 1, 1, 1,
-0.4628297, -1.235465, -2.475884, 1, 1, 1, 1, 1,
-0.4591449, -0.6173895, -2.583818, 1, 1, 1, 1, 1,
-0.4551297, -0.951364, -2.238784, 1, 1, 1, 1, 1,
-0.4550379, -0.6783447, -3.230862, 1, 1, 1, 1, 1,
-0.4531385, -0.8778132, -2.169161, 1, 1, 1, 1, 1,
-0.4514883, -0.4334943, -2.454025, 1, 1, 1, 1, 1,
-0.4473066, 1.660702, 2.047786, 1, 1, 1, 1, 1,
-0.4461047, 0.2944439, 0.286341, 0, 0, 1, 1, 1,
-0.4432225, -0.06609352, -3.740881, 1, 0, 0, 1, 1,
-0.4425338, -0.05658277, -1.724553, 1, 0, 0, 1, 1,
-0.434495, -0.3405046, -1.690469, 1, 0, 0, 1, 1,
-0.431715, 0.3235609, -1.555, 1, 0, 0, 1, 1,
-0.4312992, 0.1637275, -1.676877, 1, 0, 0, 1, 1,
-0.4261971, 2.929983, 0.9927446, 0, 0, 0, 1, 1,
-0.4214208, 1.998114, 0.9031739, 0, 0, 0, 1, 1,
-0.4211194, -0.4315352, -2.657859, 0, 0, 0, 1, 1,
-0.4095674, 0.5173738, -0.7380315, 0, 0, 0, 1, 1,
-0.4086534, -0.8177811, -3.146512, 0, 0, 0, 1, 1,
-0.4063269, 1.872778, -1.260075, 0, 0, 0, 1, 1,
-0.4056633, 1.140861, -0.4484907, 0, 0, 0, 1, 1,
-0.404893, -1.28536, -3.043879, 1, 1, 1, 1, 1,
-0.4023593, 1.621683, -0.8271067, 1, 1, 1, 1, 1,
-0.3993599, 0.007604884, -2.014125, 1, 1, 1, 1, 1,
-0.3964417, -0.7967919, -3.188739, 1, 1, 1, 1, 1,
-0.3936659, 0.03594647, -0.3145199, 1, 1, 1, 1, 1,
-0.3902782, -0.2323527, -1.055473, 1, 1, 1, 1, 1,
-0.3901076, 0.5564096, 0.8807364, 1, 1, 1, 1, 1,
-0.3801786, -1.07321, -4.060018, 1, 1, 1, 1, 1,
-0.3781032, -0.4416302, -4.256366, 1, 1, 1, 1, 1,
-0.377462, -1.119026, -2.539044, 1, 1, 1, 1, 1,
-0.3761483, 0.41565, 0.1912482, 1, 1, 1, 1, 1,
-0.3712327, 0.3604265, -1.5785, 1, 1, 1, 1, 1,
-0.368173, 0.7629372, -1.392241, 1, 1, 1, 1, 1,
-0.3649335, 0.6620608, -1.009045, 1, 1, 1, 1, 1,
-0.3642355, 0.3594535, -1.44157, 1, 1, 1, 1, 1,
-0.3638219, -1.617126, -2.956441, 0, 0, 1, 1, 1,
-0.3617077, 0.7178293, -1.561995, 1, 0, 0, 1, 1,
-0.3595875, 1.346787, 0.6955364, 1, 0, 0, 1, 1,
-0.3571626, 0.2943491, 0.1026954, 1, 0, 0, 1, 1,
-0.356766, -1.28166, -3.414153, 1, 0, 0, 1, 1,
-0.3540939, 1.950325, -0.8290307, 1, 0, 0, 1, 1,
-0.3520688, -0.7490751, -2.493465, 0, 0, 0, 1, 1,
-0.3514906, 0.9207451, -1.260431, 0, 0, 0, 1, 1,
-0.3460637, -0.3720562, -2.361159, 0, 0, 0, 1, 1,
-0.340583, 0.9943818, -0.3260216, 0, 0, 0, 1, 1,
-0.3302881, 0.1378063, -0.7604539, 0, 0, 0, 1, 1,
-0.3267308, -1.284377, -3.860639, 0, 0, 0, 1, 1,
-0.3264793, 1.396096, -0.456126, 0, 0, 0, 1, 1,
-0.3234034, 0.9519398, 0.8567345, 1, 1, 1, 1, 1,
-0.3233755, -0.3567451, -1.814462, 1, 1, 1, 1, 1,
-0.3209032, -0.5605345, -3.033094, 1, 1, 1, 1, 1,
-0.3206755, 0.3519063, -1.585847, 1, 1, 1, 1, 1,
-0.320663, -0.1508229, -2.571551, 1, 1, 1, 1, 1,
-0.3173856, 0.8336834, -2.634229, 1, 1, 1, 1, 1,
-0.3141869, 0.4746383, -0.8079975, 1, 1, 1, 1, 1,
-0.3069135, 0.9268779, -2.515371, 1, 1, 1, 1, 1,
-0.2985562, -1.260522, -1.033883, 1, 1, 1, 1, 1,
-0.2950057, -0.01203434, -0.5034179, 1, 1, 1, 1, 1,
-0.2921155, 0.5777861, -0.0839339, 1, 1, 1, 1, 1,
-0.2897578, 0.2206395, -1.445097, 1, 1, 1, 1, 1,
-0.2891988, -0.4170104, -1.894675, 1, 1, 1, 1, 1,
-0.278784, 0.3086336, -1.398134, 1, 1, 1, 1, 1,
-0.2761724, 0.81985, -1.591049, 1, 1, 1, 1, 1,
-0.27349, -0.1106172, -2.478594, 0, 0, 1, 1, 1,
-0.2698358, -1.102243, -3.762589, 1, 0, 0, 1, 1,
-0.2682001, -0.3159018, -1.847305, 1, 0, 0, 1, 1,
-0.2678782, 1.074082, 0.09505352, 1, 0, 0, 1, 1,
-0.267215, 0.3467102, -1.906753, 1, 0, 0, 1, 1,
-0.2615474, 2.211274, -0.2298668, 1, 0, 0, 1, 1,
-0.2466184, 0.09272576, -1.000489, 0, 0, 0, 1, 1,
-0.244067, -0.7278531, -2.948358, 0, 0, 0, 1, 1,
-0.2435856, 1.44706, -0.2249044, 0, 0, 0, 1, 1,
-0.2433044, 0.5728389, -0.8214955, 0, 0, 0, 1, 1,
-0.2302258, 0.1330432, -2.469274, 0, 0, 0, 1, 1,
-0.2184104, -0.1419279, -3.442603, 0, 0, 0, 1, 1,
-0.2147233, -1.784529, -3.886326, 0, 0, 0, 1, 1,
-0.2142254, -1.26938, -1.53052, 1, 1, 1, 1, 1,
-0.2084657, 0.4204237, 0.177673, 1, 1, 1, 1, 1,
-0.2080897, 0.6863864, -0.5855407, 1, 1, 1, 1, 1,
-0.2065089, -1.023651, -3.530218, 1, 1, 1, 1, 1,
-0.2055393, -1.840006, -2.428344, 1, 1, 1, 1, 1,
-0.2044926, -0.0155087, -1.589135, 1, 1, 1, 1, 1,
-0.2020923, -0.5891191, -3.907916, 1, 1, 1, 1, 1,
-0.2005798, 1.06807, -0.5722886, 1, 1, 1, 1, 1,
-0.1953097, 0.1636004, -0.3759531, 1, 1, 1, 1, 1,
-0.1945967, 0.4950001, -1.01672, 1, 1, 1, 1, 1,
-0.1929848, 1.717819, -0.6100308, 1, 1, 1, 1, 1,
-0.1883701, -0.668106, -3.343795, 1, 1, 1, 1, 1,
-0.1882752, 2.096473, 2.04106, 1, 1, 1, 1, 1,
-0.1875534, -0.1753518, -1.998552, 1, 1, 1, 1, 1,
-0.1870088, 0.1162286, 0.5363412, 1, 1, 1, 1, 1,
-0.1771258, -1.177617, -3.527987, 0, 0, 1, 1, 1,
-0.1765036, -0.3011326, -4.995581, 1, 0, 0, 1, 1,
-0.1744371, 0.1133582, -2.203278, 1, 0, 0, 1, 1,
-0.1734069, 0.3151472, -0.3409899, 1, 0, 0, 1, 1,
-0.1732884, -0.3117176, -3.630067, 1, 0, 0, 1, 1,
-0.1698151, 2.431906, -0.6723028, 1, 0, 0, 1, 1,
-0.1657149, -0.8794203, -2.68263, 0, 0, 0, 1, 1,
-0.1569134, 1.149464, -1.031002, 0, 0, 0, 1, 1,
-0.1555472, -0.3501405, -1.401829, 0, 0, 0, 1, 1,
-0.1535146, -0.7669572, -2.824339, 0, 0, 0, 1, 1,
-0.1509679, 1.719461, -0.6913376, 0, 0, 0, 1, 1,
-0.148033, 0.8171923, 0.9023779, 0, 0, 0, 1, 1,
-0.1477214, -2.298672, -3.157053, 0, 0, 0, 1, 1,
-0.1461209, 0.2383411, -1.163782, 1, 1, 1, 1, 1,
-0.138327, -0.7601016, -1.820053, 1, 1, 1, 1, 1,
-0.1358939, 1.021382, -0.2215266, 1, 1, 1, 1, 1,
-0.1338168, 0.05189946, -2.515015, 1, 1, 1, 1, 1,
-0.1246671, -0.8049148, -3.118784, 1, 1, 1, 1, 1,
-0.1239005, -1.021098, -2.401322, 1, 1, 1, 1, 1,
-0.1237054, 1.596737, 0.4027033, 1, 1, 1, 1, 1,
-0.1235289, 1.263419, 0.1588276, 1, 1, 1, 1, 1,
-0.1233446, -0.4689232, -5.092014, 1, 1, 1, 1, 1,
-0.1216887, 0.2417434, 1.250479, 1, 1, 1, 1, 1,
-0.1216315, -0.2671722, -0.9722044, 1, 1, 1, 1, 1,
-0.1208718, -0.1473304, -1.553575, 1, 1, 1, 1, 1,
-0.1181209, 0.1622634, 0.5284238, 1, 1, 1, 1, 1,
-0.1180708, 0.8323314, -0.482504, 1, 1, 1, 1, 1,
-0.1175035, 2.762794, 0.3558758, 1, 1, 1, 1, 1,
-0.1160049, 0.4795905, 0.03562444, 0, 0, 1, 1, 1,
-0.1132349, -2.148883, -4.074371, 1, 0, 0, 1, 1,
-0.1068425, 0.09243711, 1.53626, 1, 0, 0, 1, 1,
-0.1054995, 1.841173, 1.655587, 1, 0, 0, 1, 1,
-0.1048488, -0.2852373, -2.776991, 1, 0, 0, 1, 1,
-0.1037876, 0.1351315, -1.704474, 1, 0, 0, 1, 1,
-0.1023149, -0.3694959, -6.237365, 0, 0, 0, 1, 1,
-0.09921819, -0.004854193, -1.176999, 0, 0, 0, 1, 1,
-0.09723415, 0.1885696, -0.8143505, 0, 0, 0, 1, 1,
-0.09385846, 1.225629, 0.9246139, 0, 0, 0, 1, 1,
-0.09135514, 0.6236603, -1.489398, 0, 0, 0, 1, 1,
-0.08821487, 0.7362819, -1.262366, 0, 0, 0, 1, 1,
-0.08687817, -0.04560113, -2.763924, 0, 0, 0, 1, 1,
-0.0855984, -1.332366, -4.005704, 1, 1, 1, 1, 1,
-0.08510986, 0.3440594, -2.209071, 1, 1, 1, 1, 1,
-0.08114848, -0.4918704, -2.344413, 1, 1, 1, 1, 1,
-0.08074266, 0.07217412, 2.635518, 1, 1, 1, 1, 1,
-0.0791769, -0.5757532, -2.074246, 1, 1, 1, 1, 1,
-0.0788203, -0.2200592, -1.014188, 1, 1, 1, 1, 1,
-0.07745548, 0.4088695, -0.752924, 1, 1, 1, 1, 1,
-0.06860582, 1.66007, -0.510084, 1, 1, 1, 1, 1,
-0.06751858, 0.7748141, 0.7938594, 1, 1, 1, 1, 1,
-0.06745684, -0.637232, -4.536281, 1, 1, 1, 1, 1,
-0.06239042, 1.050155, 0.7331198, 1, 1, 1, 1, 1,
-0.06202778, 0.04724159, -0.8622577, 1, 1, 1, 1, 1,
-0.06020416, 1.362004, -0.3032824, 1, 1, 1, 1, 1,
-0.05960726, 0.0618834, -0.4787002, 1, 1, 1, 1, 1,
-0.05916768, -1.807034, -2.184104, 1, 1, 1, 1, 1,
-0.05894261, -1.319573, -2.945812, 0, 0, 1, 1, 1,
-0.05789289, 1.352024, -0.4382752, 1, 0, 0, 1, 1,
-0.0573854, 0.09314052, -1.92203, 1, 0, 0, 1, 1,
-0.05636556, 0.4348002, 1.240127, 1, 0, 0, 1, 1,
-0.05612354, -0.3996662, -2.548224, 1, 0, 0, 1, 1,
-0.05544462, 0.2315206, 1.092965, 1, 0, 0, 1, 1,
-0.05515585, -1.27852, -2.811398, 0, 0, 0, 1, 1,
-0.05129262, 0.9496694, -0.9500491, 0, 0, 0, 1, 1,
-0.04605476, 0.007118767, -1.085586, 0, 0, 0, 1, 1,
-0.04366231, 0.06771256, -0.5756033, 0, 0, 0, 1, 1,
-0.03391778, 0.09399756, -2.235479, 0, 0, 0, 1, 1,
-0.03225268, 1.179866, 0.687243, 0, 0, 0, 1, 1,
-0.0319955, 1.364751, 0.1023793, 0, 0, 0, 1, 1,
-0.03192746, -0.09819867, -3.034584, 1, 1, 1, 1, 1,
-0.03110093, 0.3545866, -0.4232776, 1, 1, 1, 1, 1,
-0.03006793, -1.555333, -3.007057, 1, 1, 1, 1, 1,
-0.02879746, 0.811517, 1.566468, 1, 1, 1, 1, 1,
-0.028783, -1.351738, -3.548288, 1, 1, 1, 1, 1,
-0.0203557, 1.359782, -0.6675905, 1, 1, 1, 1, 1,
-0.01922854, -0.3636496, -4.48917, 1, 1, 1, 1, 1,
-0.01428228, -0.7749199, -1.684141, 1, 1, 1, 1, 1,
-0.01145691, 0.5510356, -0.8476839, 1, 1, 1, 1, 1,
-0.01135405, 1.133028, 0.05708124, 1, 1, 1, 1, 1,
-0.001686612, 1.499867, -1.175229, 1, 1, 1, 1, 1,
-0.0004934216, 0.3292373, 0.7534881, 1, 1, 1, 1, 1,
0.001472763, 0.331781, -0.5221125, 1, 1, 1, 1, 1,
0.006845968, -1.46776, 3.808451, 1, 1, 1, 1, 1,
0.006981038, -0.3335506, 3.592896, 1, 1, 1, 1, 1,
0.008587741, -1.0584, 3.506646, 0, 0, 1, 1, 1,
0.009859182, -0.4130646, 3.273158, 1, 0, 0, 1, 1,
0.01003085, 0.4376303, 1.324424, 1, 0, 0, 1, 1,
0.01308294, -0.6760812, 3.39484, 1, 0, 0, 1, 1,
0.01310212, -1.225282, 2.256515, 1, 0, 0, 1, 1,
0.01382686, -1.258148, 3.522569, 1, 0, 0, 1, 1,
0.01491573, -0.03095684, 4.805364, 0, 0, 0, 1, 1,
0.01649468, -1.236176, 4.188149, 0, 0, 0, 1, 1,
0.01947958, 1.196581, -0.3928442, 0, 0, 0, 1, 1,
0.02427951, 0.4136576, -0.7915576, 0, 0, 0, 1, 1,
0.02633283, 2.676389, 0.8012077, 0, 0, 0, 1, 1,
0.02911499, 0.6731427, -0.1750633, 0, 0, 0, 1, 1,
0.03094305, -1.379953, 3.7139, 0, 0, 0, 1, 1,
0.03990231, 0.3631849, 1.013684, 1, 1, 1, 1, 1,
0.04733033, 0.2975397, 0.4870993, 1, 1, 1, 1, 1,
0.05045931, -0.3954301, 3.182463, 1, 1, 1, 1, 1,
0.05107951, 2.060165, 0.1551963, 1, 1, 1, 1, 1,
0.05155498, -0.7095192, 4.757288, 1, 1, 1, 1, 1,
0.05174852, -0.605117, 2.02006, 1, 1, 1, 1, 1,
0.05195985, 0.6985239, 0.8915262, 1, 1, 1, 1, 1,
0.05373108, -0.3681047, 3.681996, 1, 1, 1, 1, 1,
0.05428578, 1.614887, 0.3444964, 1, 1, 1, 1, 1,
0.06040094, -0.47251, 3.64043, 1, 1, 1, 1, 1,
0.0613658, -0.7364241, 1.250171, 1, 1, 1, 1, 1,
0.06171373, 0.3851699, -0.4370545, 1, 1, 1, 1, 1,
0.06493402, -0.5889161, 2.692169, 1, 1, 1, 1, 1,
0.06547146, -0.1674704, 1.206365, 1, 1, 1, 1, 1,
0.0707481, -0.8353018, 4.143882, 1, 1, 1, 1, 1,
0.07165918, 0.4069611, -0.8169283, 0, 0, 1, 1, 1,
0.0744087, 0.38763, 0.07346591, 1, 0, 0, 1, 1,
0.07448447, 0.1461294, 2.288583, 1, 0, 0, 1, 1,
0.07580238, -0.6105279, 4.378781, 1, 0, 0, 1, 1,
0.07605863, 1.273754, -0.7175791, 1, 0, 0, 1, 1,
0.08207395, 0.2420412, -1.157515, 1, 0, 0, 1, 1,
0.08550352, 1.439223, -0.0752433, 0, 0, 0, 1, 1,
0.08662273, -0.5976808, 1.729705, 0, 0, 0, 1, 1,
0.0870683, 0.4671915, -0.5070219, 0, 0, 0, 1, 1,
0.09875843, 0.5754585, 1.346834, 0, 0, 0, 1, 1,
0.1020132, -0.922877, 4.669218, 0, 0, 0, 1, 1,
0.1073569, 0.1983218, 1.398264, 0, 0, 0, 1, 1,
0.1081373, 0.7967127, 0.5338541, 0, 0, 0, 1, 1,
0.1107533, -1.257412, 2.60728, 1, 1, 1, 1, 1,
0.1114109, -0.06768531, 0.7514553, 1, 1, 1, 1, 1,
0.1117541, -0.824523, 4.064348, 1, 1, 1, 1, 1,
0.1137951, 0.7505335, 0.2250815, 1, 1, 1, 1, 1,
0.1138959, -2.611455, 3.03555, 1, 1, 1, 1, 1,
0.1139404, 0.191745, 1.788528, 1, 1, 1, 1, 1,
0.1161805, -1.087834, 4.727759, 1, 1, 1, 1, 1,
0.1187939, -0.5890368, 3.417048, 1, 1, 1, 1, 1,
0.1209489, -0.1354456, 3.499732, 1, 1, 1, 1, 1,
0.1291881, 1.113095, 0.2133994, 1, 1, 1, 1, 1,
0.1318206, -0.7105585, 1.971594, 1, 1, 1, 1, 1,
0.137924, -0.8345243, 5.445987, 1, 1, 1, 1, 1,
0.1386168, 0.3322325, -0.1534466, 1, 1, 1, 1, 1,
0.1413043, -0.506501, 3.639924, 1, 1, 1, 1, 1,
0.1433522, -0.739615, 2.732195, 1, 1, 1, 1, 1,
0.1468059, -0.6539518, 2.9963, 0, 0, 1, 1, 1,
0.1471136, 0.3669749, 1.308468, 1, 0, 0, 1, 1,
0.1480386, -0.1414935, 0.218551, 1, 0, 0, 1, 1,
0.1514885, 1.93123, -0.6341614, 1, 0, 0, 1, 1,
0.1521291, 0.1899129, 1.651896, 1, 0, 0, 1, 1,
0.1525852, 1.208334, 0.3811085, 1, 0, 0, 1, 1,
0.1535523, -0.4279372, 3.618715, 0, 0, 0, 1, 1,
0.1555852, 1.725822, -0.2542797, 0, 0, 0, 1, 1,
0.1564696, 1.230535, -0.3232292, 0, 0, 0, 1, 1,
0.1602158, 1.220748, -0.7592905, 0, 0, 0, 1, 1,
0.1635919, 1.933579, -0.3130199, 0, 0, 0, 1, 1,
0.1652503, 0.3752268, 0.994827, 0, 0, 0, 1, 1,
0.1664144, -0.5459075, 2.652439, 0, 0, 0, 1, 1,
0.1721036, 0.4019118, -1.50067, 1, 1, 1, 1, 1,
0.173942, -0.1939479, 2.148709, 1, 1, 1, 1, 1,
0.1741396, -0.1808987, 3.084263, 1, 1, 1, 1, 1,
0.1787517, -0.5504793, 3.723541, 1, 1, 1, 1, 1,
0.1796499, 1.215278, -0.262233, 1, 1, 1, 1, 1,
0.1802978, 0.1404518, 3.006153, 1, 1, 1, 1, 1,
0.1838595, -1.029428, 2.457352, 1, 1, 1, 1, 1,
0.1895843, -0.4401049, 2.432979, 1, 1, 1, 1, 1,
0.1910475, 0.4532812, -0.02475178, 1, 1, 1, 1, 1,
0.192611, 0.09451056, 1.307454, 1, 1, 1, 1, 1,
0.1932447, 0.4297147, 2.031435, 1, 1, 1, 1, 1,
0.1935621, 0.7994801, 1.439093, 1, 1, 1, 1, 1,
0.1977589, 1.19595, 0.2466875, 1, 1, 1, 1, 1,
0.2013644, -1.941631, 4.444261, 1, 1, 1, 1, 1,
0.2107645, 1.077746, -0.0315134, 1, 1, 1, 1, 1,
0.2178115, 1.228277, -0.9804738, 0, 0, 1, 1, 1,
0.2198173, 1.013931, -0.07824218, 1, 0, 0, 1, 1,
0.2210677, -0.1016562, 1.441263, 1, 0, 0, 1, 1,
0.2223246, -1.956878, 2.925768, 1, 0, 0, 1, 1,
0.2259235, 0.3278282, -0.5696631, 1, 0, 0, 1, 1,
0.2275312, -0.1710822, 2.428142, 1, 0, 0, 1, 1,
0.2288871, -1.775661, 3.362165, 0, 0, 0, 1, 1,
0.2328261, -0.4949409, 1.879186, 0, 0, 0, 1, 1,
0.2392432, -0.7256562, 2.692641, 0, 0, 0, 1, 1,
0.2417942, 0.08387413, 0.7291147, 0, 0, 0, 1, 1,
0.2423894, 1.189381, 1.329611, 0, 0, 0, 1, 1,
0.242411, -0.03160876, 1.044139, 0, 0, 0, 1, 1,
0.245387, 0.4011646, 0.6879677, 0, 0, 0, 1, 1,
0.2480368, -1.088424, 2.280248, 1, 1, 1, 1, 1,
0.2530631, 0.7465585, 0.9756228, 1, 1, 1, 1, 1,
0.2569873, 0.5996968, 1.721578, 1, 1, 1, 1, 1,
0.2607929, -0.05777887, 1.954904, 1, 1, 1, 1, 1,
0.2622153, -0.05000441, 2.719592, 1, 1, 1, 1, 1,
0.2635263, -0.36966, 1.995897, 1, 1, 1, 1, 1,
0.2665523, -0.604844, 2.801334, 1, 1, 1, 1, 1,
0.267039, -0.33547, 3.365462, 1, 1, 1, 1, 1,
0.2681036, 0.0741473, -0.5106546, 1, 1, 1, 1, 1,
0.2719508, -0.5894103, 1.418903, 1, 1, 1, 1, 1,
0.2719815, -0.2292332, 2.400291, 1, 1, 1, 1, 1,
0.275138, -0.865901, 3.63853, 1, 1, 1, 1, 1,
0.2785732, 1.640565, 0.3632511, 1, 1, 1, 1, 1,
0.2845317, 0.6183935, -0.124569, 1, 1, 1, 1, 1,
0.2867092, -1.506355, 3.425063, 1, 1, 1, 1, 1,
0.2892418, -0.5716339, 1.30335, 0, 0, 1, 1, 1,
0.2900658, -1.483383, 3.695264, 1, 0, 0, 1, 1,
0.290829, 0.2487148, 1.420652, 1, 0, 0, 1, 1,
0.2926634, 1.174566, 0.5923869, 1, 0, 0, 1, 1,
0.2939985, -0.1001391, 0.168024, 1, 0, 0, 1, 1,
0.2947762, 0.4876276, 0.7435436, 1, 0, 0, 1, 1,
0.2954502, 0.7220551, 0.9807281, 0, 0, 0, 1, 1,
0.2962043, 0.1358559, -0.8207219, 0, 0, 0, 1, 1,
0.2999126, -0.04458912, 1.636671, 0, 0, 0, 1, 1,
0.3002265, 1.872211, 0.4478221, 0, 0, 0, 1, 1,
0.3029515, -0.3925669, 3.432348, 0, 0, 0, 1, 1,
0.3038889, 0.7084599, 0.1421226, 0, 0, 0, 1, 1,
0.3041483, -0.1888075, 2.229878, 0, 0, 0, 1, 1,
0.3080716, -0.07054725, 1.695374, 1, 1, 1, 1, 1,
0.3114647, -0.1772368, 0.7087851, 1, 1, 1, 1, 1,
0.3131273, 0.7306033, 0.7272984, 1, 1, 1, 1, 1,
0.3162461, 0.1243046, 1.44348, 1, 1, 1, 1, 1,
0.3188668, 1.045378, -0.6065146, 1, 1, 1, 1, 1,
0.3196635, -0.8448626, 3.223898, 1, 1, 1, 1, 1,
0.3212029, -0.3553393, 1.199909, 1, 1, 1, 1, 1,
0.3213431, -2.19832, 2.278433, 1, 1, 1, 1, 1,
0.3273251, 1.277205, -2.405906, 1, 1, 1, 1, 1,
0.3298818, -0.3023663, 3.609496, 1, 1, 1, 1, 1,
0.3401934, -1.021879, 2.655076, 1, 1, 1, 1, 1,
0.3407117, -0.1123178, 0.7534615, 1, 1, 1, 1, 1,
0.3417943, 1.499894, -0.0725096, 1, 1, 1, 1, 1,
0.342068, -2.364215, 1.980877, 1, 1, 1, 1, 1,
0.3448643, -0.7364203, 0.9154139, 1, 1, 1, 1, 1,
0.3462217, 0.7907152, 0.5451389, 0, 0, 1, 1, 1,
0.347534, 0.25655, 2.709395, 1, 0, 0, 1, 1,
0.3498247, 0.4580375, 0.5689957, 1, 0, 0, 1, 1,
0.3518047, 0.1581522, -1.061583, 1, 0, 0, 1, 1,
0.3524512, -0.0584185, 2.716019, 1, 0, 0, 1, 1,
0.3526659, -1.076878, 5.19886, 1, 0, 0, 1, 1,
0.3527283, -0.8642119, 2.299355, 0, 0, 0, 1, 1,
0.3628244, 0.06753299, 2.395106, 0, 0, 0, 1, 1,
0.3664783, -0.38848, 2.725261, 0, 0, 0, 1, 1,
0.3688667, -0.2903245, 3.919084, 0, 0, 0, 1, 1,
0.3720602, -0.02983692, 3.177129, 0, 0, 0, 1, 1,
0.3737107, -0.2056956, 2.332101, 0, 0, 0, 1, 1,
0.3756071, 0.1299737, 2.737542, 0, 0, 0, 1, 1,
0.3770363, -1.65268, 3.527483, 1, 1, 1, 1, 1,
0.3808112, -0.4980375, 5.055619, 1, 1, 1, 1, 1,
0.3844345, 0.04615368, 1.466202, 1, 1, 1, 1, 1,
0.3873301, -1.158223, 1.845224, 1, 1, 1, 1, 1,
0.3896122, 0.7503654, 0.3188272, 1, 1, 1, 1, 1,
0.390839, 0.06464458, 0.6369948, 1, 1, 1, 1, 1,
0.3916779, -0.6886472, 2.026544, 1, 1, 1, 1, 1,
0.393439, -1.016143, 3.355462, 1, 1, 1, 1, 1,
0.3939565, 0.8913945, -0.6877642, 1, 1, 1, 1, 1,
0.3944148, -0.3487678, 2.010705, 1, 1, 1, 1, 1,
0.3951311, 2.002762, -0.2218017, 1, 1, 1, 1, 1,
0.3994241, 1.310974, -0.7829046, 1, 1, 1, 1, 1,
0.4007486, -2.355637, 3.974261, 1, 1, 1, 1, 1,
0.4015325, -0.2117991, 1.128885, 1, 1, 1, 1, 1,
0.4041764, 0.4183066, 2.132183, 1, 1, 1, 1, 1,
0.4059536, -0.1140301, 2.475611, 0, 0, 1, 1, 1,
0.4062745, -1.687674, 2.800541, 1, 0, 0, 1, 1,
0.4085301, 1.232251, -0.07390192, 1, 0, 0, 1, 1,
0.4118257, -1.338008, 2.216812, 1, 0, 0, 1, 1,
0.4141428, 0.2775236, 1.0406, 1, 0, 0, 1, 1,
0.4155113, 0.971799, -0.2641613, 1, 0, 0, 1, 1,
0.4160552, 0.9366367, -0.5153564, 0, 0, 0, 1, 1,
0.4161504, 0.3777371, -0.3374859, 0, 0, 0, 1, 1,
0.4173904, 1.593716, -0.828591, 0, 0, 0, 1, 1,
0.4189387, 0.6168252, 0.7933705, 0, 0, 0, 1, 1,
0.4197738, 1.267223, 0.2142514, 0, 0, 0, 1, 1,
0.4217231, -0.2605326, 2.073923, 0, 0, 0, 1, 1,
0.4228778, 0.04436632, 2.110811, 0, 0, 0, 1, 1,
0.4309853, -0.2161453, 1.784643, 1, 1, 1, 1, 1,
0.4328597, 0.05454202, 2.46312, 1, 1, 1, 1, 1,
0.4338993, -0.1824445, 2.936642, 1, 1, 1, 1, 1,
0.4362628, 0.2767735, 4.391618, 1, 1, 1, 1, 1,
0.439725, -0.5405951, 2.37805, 1, 1, 1, 1, 1,
0.444577, -0.5277334, 1.697748, 1, 1, 1, 1, 1,
0.4456123, -0.1834002, 1.273578, 1, 1, 1, 1, 1,
0.4470665, -0.5612515, 3.853001, 1, 1, 1, 1, 1,
0.449473, -0.4613687, 1.448494, 1, 1, 1, 1, 1,
0.4511411, -0.3036551, 2.55523, 1, 1, 1, 1, 1,
0.4522439, 1.69854, 1.287517, 1, 1, 1, 1, 1,
0.4537565, 0.6487413, -0.7538704, 1, 1, 1, 1, 1,
0.4537627, 0.05043422, 1.29275, 1, 1, 1, 1, 1,
0.4543134, 0.5056914, 1.503968, 1, 1, 1, 1, 1,
0.4583374, -0.8560234, 1.18303, 1, 1, 1, 1, 1,
0.459474, -1.744132, 2.038728, 0, 0, 1, 1, 1,
0.4599946, -1.764186, 4.169993, 1, 0, 0, 1, 1,
0.4629554, 0.304571, 1.525241, 1, 0, 0, 1, 1,
0.4649125, -0.3453996, 1.009939, 1, 0, 0, 1, 1,
0.4664909, 0.739073, -0.9542527, 1, 0, 0, 1, 1,
0.4676009, 1.590221, -0.1650928, 1, 0, 0, 1, 1,
0.4700447, 0.09473992, 1.396209, 0, 0, 0, 1, 1,
0.4749486, -0.3641022, 3.00064, 0, 0, 0, 1, 1,
0.4753389, -0.6128203, 1.687941, 0, 0, 0, 1, 1,
0.4760579, 0.3700181, 1.014301, 0, 0, 0, 1, 1,
0.4858021, -1.131342, 3.625573, 0, 0, 0, 1, 1,
0.4890453, -1.086552, 1.466531, 0, 0, 0, 1, 1,
0.4908825, 1.143329, -0.5878934, 0, 0, 0, 1, 1,
0.4988389, -0.4128023, 2.635839, 1, 1, 1, 1, 1,
0.4991024, -0.4954573, 2.557542, 1, 1, 1, 1, 1,
0.515026, -0.2751929, 1.968109, 1, 1, 1, 1, 1,
0.5183729, -0.2030482, 1.774226, 1, 1, 1, 1, 1,
0.5211321, 1.348996, 0.1737211, 1, 1, 1, 1, 1,
0.5215688, 1.098015, 0.2461762, 1, 1, 1, 1, 1,
0.5226739, -0.9226146, 3.48406, 1, 1, 1, 1, 1,
0.5244184, -0.8344607, 3.476888, 1, 1, 1, 1, 1,
0.5293996, -1.094286, 3.362548, 1, 1, 1, 1, 1,
0.532909, -1.160146, 3.798879, 1, 1, 1, 1, 1,
0.5403351, -2.617004, 2.286238, 1, 1, 1, 1, 1,
0.5419931, 1.069013, 1.570132, 1, 1, 1, 1, 1,
0.5432297, 0.6863492, 1.748776, 1, 1, 1, 1, 1,
0.5432821, 0.3511694, 0.1969113, 1, 1, 1, 1, 1,
0.5436774, -1.265486, 2.572225, 1, 1, 1, 1, 1,
0.5484912, -0.4970409, 3.268815, 0, 0, 1, 1, 1,
0.5532848, 0.1549449, 0.4268353, 1, 0, 0, 1, 1,
0.5591056, 0.2785518, 0.2745905, 1, 0, 0, 1, 1,
0.5615561, -0.2287906, 3.191073, 1, 0, 0, 1, 1,
0.5664555, -0.5935252, 2.46956, 1, 0, 0, 1, 1,
0.5691676, -0.3187067, 3.320704, 1, 0, 0, 1, 1,
0.5731301, 2.451544, -1.390946, 0, 0, 0, 1, 1,
0.5758178, 1.223483, 2.059049, 0, 0, 0, 1, 1,
0.5764567, 0.6387682, 0.7987145, 0, 0, 0, 1, 1,
0.5791696, 1.719796, 0.9709874, 0, 0, 0, 1, 1,
0.5883589, -1.748714, 3.39535, 0, 0, 0, 1, 1,
0.5898487, -0.01325301, 0.2709169, 0, 0, 0, 1, 1,
0.5916957, 0.2160653, 2.254895, 0, 0, 0, 1, 1,
0.5920689, 0.03945373, 1.362691, 1, 1, 1, 1, 1,
0.5934442, -1.194843, 4.312155, 1, 1, 1, 1, 1,
0.5960197, -1.0931, 2.926926, 1, 1, 1, 1, 1,
0.6017795, -0.3518985, 2.136915, 1, 1, 1, 1, 1,
0.60181, -0.2656257, 0.07680122, 1, 1, 1, 1, 1,
0.6027499, -2.220052, 4.135415, 1, 1, 1, 1, 1,
0.6049286, 0.8384607, -0.1948703, 1, 1, 1, 1, 1,
0.6051922, 0.1425012, 1.621166, 1, 1, 1, 1, 1,
0.6058521, 0.1079321, 1.001921, 1, 1, 1, 1, 1,
0.6065124, -0.1383118, 1.732848, 1, 1, 1, 1, 1,
0.6174473, -0.951656, 3.478562, 1, 1, 1, 1, 1,
0.6283461, 0.4281361, 1.813664, 1, 1, 1, 1, 1,
0.6315147, 0.3033386, 2.914234, 1, 1, 1, 1, 1,
0.6323813, 0.734208, -0.04031897, 1, 1, 1, 1, 1,
0.6340947, -0.4582016, 2.725009, 1, 1, 1, 1, 1,
0.6388701, 0.3527977, 0.8463632, 0, 0, 1, 1, 1,
0.6392061, 1.976783, 1.879714, 1, 0, 0, 1, 1,
0.6398122, 0.6339825, 0.1502486, 1, 0, 0, 1, 1,
0.6449496, 0.692831, 1.71352, 1, 0, 0, 1, 1,
0.6466723, 0.7797289, 1.449187, 1, 0, 0, 1, 1,
0.6478309, 0.2641741, 0.2093784, 1, 0, 0, 1, 1,
0.6495721, -0.4288333, 1.731396, 0, 0, 0, 1, 1,
0.6534787, 0.6831209, 1.378336, 0, 0, 0, 1, 1,
0.6618603, 0.04492599, -0.2064648, 0, 0, 0, 1, 1,
0.6637136, -0.1613925, 0.9058897, 0, 0, 0, 1, 1,
0.6641962, 0.7098314, 1.515224, 0, 0, 0, 1, 1,
0.6663024, -1.128795, 4.151912, 0, 0, 0, 1, 1,
0.6673982, -0.03769913, 0.7499326, 0, 0, 0, 1, 1,
0.6705509, -2.264163, 2.046961, 1, 1, 1, 1, 1,
0.6768062, 1.317739, -1.267765, 1, 1, 1, 1, 1,
0.6787066, -1.188316, 0.03459135, 1, 1, 1, 1, 1,
0.6848619, 0.9215564, -0.3185229, 1, 1, 1, 1, 1,
0.689954, 0.7299709, -1.249736, 1, 1, 1, 1, 1,
0.6900198, 0.3683127, 1.475965, 1, 1, 1, 1, 1,
0.6929469, 0.4820401, 0.744031, 1, 1, 1, 1, 1,
0.7079987, 0.03412591, 1.89051, 1, 1, 1, 1, 1,
0.7129222, -0.4427834, 2.69656, 1, 1, 1, 1, 1,
0.7214111, 1.080606, 1.236521, 1, 1, 1, 1, 1,
0.724611, -0.2137083, 1.373417, 1, 1, 1, 1, 1,
0.727502, 0.1904105, 0.8158532, 1, 1, 1, 1, 1,
0.732007, -0.07142985, 1.464453, 1, 1, 1, 1, 1,
0.7339112, -0.04402422, 1.138884, 1, 1, 1, 1, 1,
0.7385534, 0.7473145, 1.227476, 1, 1, 1, 1, 1,
0.7387443, 1.651696, -1.369899, 0, 0, 1, 1, 1,
0.7390489, -0.7838856, 2.150731, 1, 0, 0, 1, 1,
0.7395947, 2.060112, 0.4627751, 1, 0, 0, 1, 1,
0.7415355, 0.5103253, 0.5677949, 1, 0, 0, 1, 1,
0.7427851, 1.754706, 0.6088979, 1, 0, 0, 1, 1,
0.7456759, 0.1539012, 1.684702, 1, 0, 0, 1, 1,
0.7465183, 0.5059363, -1.017925, 0, 0, 0, 1, 1,
0.7482652, -0.03273121, 2.224901, 0, 0, 0, 1, 1,
0.7544646, 0.6767986, 1.281339, 0, 0, 0, 1, 1,
0.7597399, -0.367501, 0.4170111, 0, 0, 0, 1, 1,
0.7761555, -0.5711881, 3.171837, 0, 0, 0, 1, 1,
0.7827812, -1.130923, 2.554268, 0, 0, 0, 1, 1,
0.7831879, -1.034167, 1.875756, 0, 0, 0, 1, 1,
0.7845303, -1.25439, 1.912277, 1, 1, 1, 1, 1,
0.7855942, 0.1157846, 2.482555, 1, 1, 1, 1, 1,
0.7939617, -1.161746, 1.360877, 1, 1, 1, 1, 1,
0.7947768, -1.039175, 1.200715, 1, 1, 1, 1, 1,
0.7993011, 0.4682303, 1.177901, 1, 1, 1, 1, 1,
0.8007163, -0.07333159, 0.4414117, 1, 1, 1, 1, 1,
0.8018516, -0.4682322, 1.326805, 1, 1, 1, 1, 1,
0.8043727, 0.9761792, 1.29164, 1, 1, 1, 1, 1,
0.8073867, -0.2518254, 1.332268, 1, 1, 1, 1, 1,
0.8120986, 1.260232, 0.9993109, 1, 1, 1, 1, 1,
0.8150724, -0.9063553, 2.403125, 1, 1, 1, 1, 1,
0.8218527, 1.0947, 2.494215, 1, 1, 1, 1, 1,
0.8291137, 0.2909627, 1.364292, 1, 1, 1, 1, 1,
0.8440403, -0.1609006, 1.431955, 1, 1, 1, 1, 1,
0.8460977, 0.6932645, 1.686514, 1, 1, 1, 1, 1,
0.8484551, -0.6199663, 4.553731, 0, 0, 1, 1, 1,
0.8492724, -0.6607971, 1.647586, 1, 0, 0, 1, 1,
0.8625183, -0.7986594, 0.6772833, 1, 0, 0, 1, 1,
0.8628893, 0.4934744, 0.5943248, 1, 0, 0, 1, 1,
0.863535, 0.6884964, 1.130248, 1, 0, 0, 1, 1,
0.8729486, -1.246333, 3.238654, 1, 0, 0, 1, 1,
0.8767409, 0.4538793, -1.007275, 0, 0, 0, 1, 1,
0.8786448, -0.2318456, 2.300322, 0, 0, 0, 1, 1,
0.8842399, 2.083992, -0.1117798, 0, 0, 0, 1, 1,
0.8848327, -0.362146, 3.346463, 0, 0, 0, 1, 1,
0.8865343, -0.9160521, 2.485709, 0, 0, 0, 1, 1,
0.8924586, -0.6792696, 0.9935725, 0, 0, 0, 1, 1,
0.8991573, -0.490821, 2.465998, 0, 0, 0, 1, 1,
0.8994454, -0.5384961, 2.463548, 1, 1, 1, 1, 1,
0.9000572, 0.3375828, -0.1605877, 1, 1, 1, 1, 1,
0.9023754, -0.9224831, 3.900882, 1, 1, 1, 1, 1,
0.9038962, -0.5477152, 1.042441, 1, 1, 1, 1, 1,
0.9065014, 0.4364394, 0.184036, 1, 1, 1, 1, 1,
0.9074659, -0.4923223, 1.79662, 1, 1, 1, 1, 1,
0.9080085, 0.9304888, 0.6485168, 1, 1, 1, 1, 1,
0.9105638, -1.405463, 1.565574, 1, 1, 1, 1, 1,
0.912784, -0.6847885, 3.779094, 1, 1, 1, 1, 1,
0.9153122, -0.2998433, 3.4111, 1, 1, 1, 1, 1,
0.9159232, -1.287242, 1.083232, 1, 1, 1, 1, 1,
0.9182282, -0.1101556, 3.49399, 1, 1, 1, 1, 1,
0.9187548, -0.6315671, 3.727333, 1, 1, 1, 1, 1,
0.9200187, -0.3199486, 4.029147, 1, 1, 1, 1, 1,
0.9218085, 0.513668, 3.935222, 1, 1, 1, 1, 1,
0.9224787, 0.3151994, 1.362861, 0, 0, 1, 1, 1,
0.9225281, -0.113458, 0.5729598, 1, 0, 0, 1, 1,
0.9259109, -0.7088727, 1.801117, 1, 0, 0, 1, 1,
0.9306093, -1.618128, 3.268865, 1, 0, 0, 1, 1,
0.9368404, -1.001593, 1.60356, 1, 0, 0, 1, 1,
0.9374741, 0.1934316, 0.1268575, 1, 0, 0, 1, 1,
0.9381983, -1.224753, 2.268086, 0, 0, 0, 1, 1,
0.9420887, -1.526483, 1.799516, 0, 0, 0, 1, 1,
0.9450179, -0.421756, 2.80315, 0, 0, 0, 1, 1,
0.9535828, 0.5545601, 3.046289, 0, 0, 0, 1, 1,
0.9557685, 0.5515425, 1.806021, 0, 0, 0, 1, 1,
0.9567758, 1.086776, 0.8350235, 0, 0, 0, 1, 1,
0.95708, -0.8638001, 2.192285, 0, 0, 0, 1, 1,
0.9593579, 0.7353886, -0.1756824, 1, 1, 1, 1, 1,
0.9681622, 0.8270444, 0.4725625, 1, 1, 1, 1, 1,
0.9693223, 2.118473, 1.55137, 1, 1, 1, 1, 1,
0.9756636, -0.4378765, 2.47872, 1, 1, 1, 1, 1,
0.9771463, -0.3342132, 3.35588, 1, 1, 1, 1, 1,
0.9825332, -0.4267507, 3.454252, 1, 1, 1, 1, 1,
0.9834625, -1.232039, 3.157014, 1, 1, 1, 1, 1,
0.9865434, -0.7556092, 1.436455, 1, 1, 1, 1, 1,
0.9922783, -0.6604214, 1.332421, 1, 1, 1, 1, 1,
0.9928705, 0.4748902, 2.507161, 1, 1, 1, 1, 1,
0.9929864, 0.04520347, 1.687225, 1, 1, 1, 1, 1,
0.995221, 0.4191258, 1.821515, 1, 1, 1, 1, 1,
1.002539, -0.04351815, 0.4877587, 1, 1, 1, 1, 1,
1.003657, 2.774179, 1.224462, 1, 1, 1, 1, 1,
1.008359, 0.2909005, 1.486, 1, 1, 1, 1, 1,
1.011867, 1.4082, 1.310715, 0, 0, 1, 1, 1,
1.014848, -0.9733588, 2.076102, 1, 0, 0, 1, 1,
1.01608, -0.3897412, 0.07492124, 1, 0, 0, 1, 1,
1.019935, -0.4128423, 2.494155, 1, 0, 0, 1, 1,
1.022007, -0.5261717, 1.503768, 1, 0, 0, 1, 1,
1.024811, 0.2460805, 1.20287, 1, 0, 0, 1, 1,
1.025858, 0.174245, 3.773789, 0, 0, 0, 1, 1,
1.027058, -0.258285, 3.007606, 0, 0, 0, 1, 1,
1.030016, -0.1649437, 1.829314, 0, 0, 0, 1, 1,
1.031672, -0.0513122, 2.425448, 0, 0, 0, 1, 1,
1.041498, -0.2275103, 3.122794, 0, 0, 0, 1, 1,
1.042838, 0.5896199, 1.822818, 0, 0, 0, 1, 1,
1.043832, -0.2209461, 1.754729, 0, 0, 0, 1, 1,
1.048761, 0.699401, -0.6986817, 1, 1, 1, 1, 1,
1.050012, -0.324364, 2.006932, 1, 1, 1, 1, 1,
1.057239, 0.07166765, 1.612687, 1, 1, 1, 1, 1,
1.057678, 0.9602265, 0.3979312, 1, 1, 1, 1, 1,
1.061988, -2.573141, 2.773415, 1, 1, 1, 1, 1,
1.062224, -0.3803931, 3.137621, 1, 1, 1, 1, 1,
1.063432, -0.3606363, -0.1216266, 1, 1, 1, 1, 1,
1.071009, 0.9840012, 1.10462, 1, 1, 1, 1, 1,
1.073828, -0.9826077, 4.645857, 1, 1, 1, 1, 1,
1.079077, -0.8036273, 2.08759, 1, 1, 1, 1, 1,
1.086592, 1.71519, 0.3098337, 1, 1, 1, 1, 1,
1.09823, 0.5522822, 0.3057995, 1, 1, 1, 1, 1,
1.098765, -0.1243614, 1.098624, 1, 1, 1, 1, 1,
1.103028, 0.822219, 0.8593343, 1, 1, 1, 1, 1,
1.104936, -0.0356361, -0.04022209, 1, 1, 1, 1, 1,
1.108466, -1.249119, 2.252935, 0, 0, 1, 1, 1,
1.114751, 0.1968058, -0.05569107, 1, 0, 0, 1, 1,
1.118353, -0.1436641, 0.7502233, 1, 0, 0, 1, 1,
1.119964, -0.9667077, 1.70623, 1, 0, 0, 1, 1,
1.123237, 0.6471863, -0.1196921, 1, 0, 0, 1, 1,
1.123265, -1.048237, 2.274703, 1, 0, 0, 1, 1,
1.131461, -0.5534672, 0.1902047, 0, 0, 0, 1, 1,
1.142378, 0.6950029, 0.7793654, 0, 0, 0, 1, 1,
1.155193, 1.152662, 1.048205, 0, 0, 0, 1, 1,
1.155254, 0.3163925, 1.786978, 0, 0, 0, 1, 1,
1.157588, -1.894744, 3.484425, 0, 0, 0, 1, 1,
1.159131, -0.4628671, 0.9367869, 0, 0, 0, 1, 1,
1.161289, -0.9975245, 3.486414, 0, 0, 0, 1, 1,
1.163921, 0.05381509, 2.364177, 1, 1, 1, 1, 1,
1.16741, 0.6150206, 1.800985, 1, 1, 1, 1, 1,
1.174487, 0.8579569, 0.8072961, 1, 1, 1, 1, 1,
1.17753, -0.946507, 2.702197, 1, 1, 1, 1, 1,
1.179593, -0.5827177, 2.253918, 1, 1, 1, 1, 1,
1.194009, -0.0271209, 1.805226, 1, 1, 1, 1, 1,
1.200379, -0.613964, 2.132971, 1, 1, 1, 1, 1,
1.216932, 0.7614988, -1.061703, 1, 1, 1, 1, 1,
1.221089, 0.6885943, 1.21654, 1, 1, 1, 1, 1,
1.233647, -0.2213415, 2.740674, 1, 1, 1, 1, 1,
1.235134, 0.7054906, 0.8622664, 1, 1, 1, 1, 1,
1.235178, -1.134759, 2.845355, 1, 1, 1, 1, 1,
1.254093, -0.4340631, 0.6915188, 1, 1, 1, 1, 1,
1.25521, -0.851015, 2.510046, 1, 1, 1, 1, 1,
1.257439, -2.067763, 2.113727, 1, 1, 1, 1, 1,
1.258584, -0.1471614, 2.476229, 0, 0, 1, 1, 1,
1.273965, 0.601348, 0.5829476, 1, 0, 0, 1, 1,
1.277268, 1.247425, 0.3224293, 1, 0, 0, 1, 1,
1.28171, 0.4192561, 2.641921, 1, 0, 0, 1, 1,
1.289868, 0.5045698, 1.96322, 1, 0, 0, 1, 1,
1.292956, 0.9569377, -0.1708308, 1, 0, 0, 1, 1,
1.295781, -1.564772, 3.126115, 0, 0, 0, 1, 1,
1.303224, 0.2137409, 0.1083962, 0, 0, 0, 1, 1,
1.304754, -0.6146515, 2.132663, 0, 0, 0, 1, 1,
1.308824, -0.4960513, 2.55899, 0, 0, 0, 1, 1,
1.327107, 0.6661975, 0.9642138, 0, 0, 0, 1, 1,
1.332599, 0.6602819, 1.626819, 0, 0, 0, 1, 1,
1.340325, -0.4102058, 1.147257, 0, 0, 0, 1, 1,
1.357901, -0.1183508, 0.215601, 1, 1, 1, 1, 1,
1.359126, -1.378741, 2.641036, 1, 1, 1, 1, 1,
1.359813, -1.264713, 1.227158, 1, 1, 1, 1, 1,
1.362616, -1.388138, 1.879112, 1, 1, 1, 1, 1,
1.366605, 0.1676938, 1.962866, 1, 1, 1, 1, 1,
1.371023, -0.3485222, 3.138316, 1, 1, 1, 1, 1,
1.377235, -2.250778, 2.386474, 1, 1, 1, 1, 1,
1.37763, 0.5652681, 0.08452746, 1, 1, 1, 1, 1,
1.378992, -0.7102226, 3.195677, 1, 1, 1, 1, 1,
1.384281, 0.5654304, 0.5075955, 1, 1, 1, 1, 1,
1.3852, -0.1625381, 1.370773, 1, 1, 1, 1, 1,
1.390302, -0.1152499, 2.495192, 1, 1, 1, 1, 1,
1.393718, 0.2169599, 1.529258, 1, 1, 1, 1, 1,
1.4102, 1.921004, 0.4680992, 1, 1, 1, 1, 1,
1.411459, -0.01035978, 0.5031357, 1, 1, 1, 1, 1,
1.411945, -0.04767425, -0.6749923, 0, 0, 1, 1, 1,
1.414497, -0.9807482, 1.823163, 1, 0, 0, 1, 1,
1.416361, 0.06596038, 1.018151, 1, 0, 0, 1, 1,
1.416885, 1.95978, 1.116798, 1, 0, 0, 1, 1,
1.418907, -0.03561647, 1.470484, 1, 0, 0, 1, 1,
1.425269, 0.05688184, 0.4946018, 1, 0, 0, 1, 1,
1.434298, -0.358347, 2.274414, 0, 0, 0, 1, 1,
1.442495, -1.81053, 2.88137, 0, 0, 0, 1, 1,
1.442993, 0.6969767, 1.242609, 0, 0, 0, 1, 1,
1.448265, -0.09789889, 2.744766, 0, 0, 0, 1, 1,
1.455683, -0.5372745, 1.662581, 0, 0, 0, 1, 1,
1.461449, -0.169022, 3.157573, 0, 0, 0, 1, 1,
1.473889, -1.05564, 3.125208, 0, 0, 0, 1, 1,
1.481495, 0.4679248, 1.644697, 1, 1, 1, 1, 1,
1.487179, 0.8528544, 2.28767, 1, 1, 1, 1, 1,
1.492042, 0.3117423, 3.671787, 1, 1, 1, 1, 1,
1.514918, -0.2067763, 2.15513, 1, 1, 1, 1, 1,
1.520919, 0.5277318, 0.9228362, 1, 1, 1, 1, 1,
1.539588, -0.420461, 0.319854, 1, 1, 1, 1, 1,
1.540225, -0.4376352, 2.072236, 1, 1, 1, 1, 1,
1.553104, -2.046723, 4.61823, 1, 1, 1, 1, 1,
1.560634, -0.892223, -0.3813062, 1, 1, 1, 1, 1,
1.587942, -0.7374089, 2.515478, 1, 1, 1, 1, 1,
1.601463, -0.9867741, 0.9297876, 1, 1, 1, 1, 1,
1.61161, -0.9599955, 2.205743, 1, 1, 1, 1, 1,
1.613758, -0.207774, 2.305855, 1, 1, 1, 1, 1,
1.624158, -0.9828387, 0.6206119, 1, 1, 1, 1, 1,
1.629865, 0.6152928, 2.209635, 1, 1, 1, 1, 1,
1.634611, -1.089349, 2.220753, 0, 0, 1, 1, 1,
1.644883, -2.419803, 4.275363, 1, 0, 0, 1, 1,
1.680574, -0.7162439, 1.084278, 1, 0, 0, 1, 1,
1.689299, 0.9816385, 1.167106, 1, 0, 0, 1, 1,
1.709145, -0.7215984, 3.847178, 1, 0, 0, 1, 1,
1.730257, 0.5208513, 0.6902084, 1, 0, 0, 1, 1,
1.748839, 0.5354212, 0.8320303, 0, 0, 0, 1, 1,
1.778127, 1.611091, 0.6540001, 0, 0, 0, 1, 1,
1.788971, -0.5554834, 2.461662, 0, 0, 0, 1, 1,
1.79231, -0.5788782, 3.814314, 0, 0, 0, 1, 1,
1.826349, 0.1561162, 1.19908, 0, 0, 0, 1, 1,
1.829675, 2.240735, 0.7054281, 0, 0, 0, 1, 1,
1.861652, 0.354322, 2.339057, 0, 0, 0, 1, 1,
1.86946, -0.9964107, 0.4421612, 1, 1, 1, 1, 1,
1.904138, 1.490749, 0.4735224, 1, 1, 1, 1, 1,
1.916068, 0.7580144, 1.776963, 1, 1, 1, 1, 1,
1.924544, 0.01746199, -0.2480969, 1, 1, 1, 1, 1,
1.929249, 0.8292115, 2.736368, 1, 1, 1, 1, 1,
1.947461, 0.1930453, 0.2419005, 1, 1, 1, 1, 1,
1.958997, -0.8060136, 2.822695, 1, 1, 1, 1, 1,
1.989612, 0.4248914, 0.8982587, 1, 1, 1, 1, 1,
2.00935, 0.517038, 1.59996, 1, 1, 1, 1, 1,
2.032267, -0.2269264, 0.113537, 1, 1, 1, 1, 1,
2.042757, -0.451306, 2.131641, 1, 1, 1, 1, 1,
2.045391, -1.079226, 2.431989, 1, 1, 1, 1, 1,
2.105009, 1.14178, 0.1719168, 1, 1, 1, 1, 1,
2.165117, 0.7565536, -0.2431926, 1, 1, 1, 1, 1,
2.177421, 0.4593101, 0.5260698, 1, 1, 1, 1, 1,
2.193702, -0.5242061, 1.527277, 0, 0, 1, 1, 1,
2.249815, 0.274746, 1.725658, 1, 0, 0, 1, 1,
2.321609, -0.5714689, 1.702162, 1, 0, 0, 1, 1,
2.386498, 1.163414, 1.599391, 1, 0, 0, 1, 1,
2.400505, 0.5242789, 2.416188, 1, 0, 0, 1, 1,
2.429043, 0.6480124, -1.0325, 1, 0, 0, 1, 1,
2.546807, 0.3701433, 1.254016, 0, 0, 0, 1, 1,
2.562323, 1.423466, 0.4646709, 0, 0, 0, 1, 1,
2.576826, -1.15801, 2.584814, 0, 0, 0, 1, 1,
2.615166, -1.291306, 1.526041, 0, 0, 0, 1, 1,
2.637315, 1.005031, 2.364764, 0, 0, 0, 1, 1,
2.692847, 0.1248799, 2.319069, 0, 0, 0, 1, 1,
2.753271, -0.1099177, 2.480747, 0, 0, 0, 1, 1,
2.755781, -0.1085996, 0.1794461, 1, 1, 1, 1, 1,
2.837421, -1.725363, 5.3709, 1, 1, 1, 1, 1,
2.899319, -0.4954643, 3.052666, 1, 1, 1, 1, 1,
2.943373, 0.7176923, -0.1990153, 1, 1, 1, 1, 1,
2.954952, 1.144268, 0.7135426, 1, 1, 1, 1, 1,
3.099289, 0.4677368, 2.684335, 1, 1, 1, 1, 1,
3.335556, 0.6961266, 1.447241, 1, 1, 1, 1, 1
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
var radius = 9.998408;
var distance = 35.11898;
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
mvMatrix.translate( 0.07408524, 0.1153662, 0.3956892 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.11898);
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
