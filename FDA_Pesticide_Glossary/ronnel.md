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
-3.275475, 0.9355066, 0.217274, 1, 0, 0, 1,
-3.168893, -0.8608308, -3.209041, 1, 0.007843138, 0, 1,
-2.866904, -1.039388, -1.476001, 1, 0.01176471, 0, 1,
-2.706573, 0.7142456, -1.278611, 1, 0.01960784, 0, 1,
-2.699277, -0.3332475, -1.451015, 1, 0.02352941, 0, 1,
-2.529541, -1.340787, -1.960994, 1, 0.03137255, 0, 1,
-2.517914, -0.4812226, -0.032938, 1, 0.03529412, 0, 1,
-2.44045, -1.871394, -4.258991, 1, 0.04313726, 0, 1,
-2.405131, 0.6771249, -2.303127, 1, 0.04705882, 0, 1,
-2.390758, 0.6691815, -1.496616, 1, 0.05490196, 0, 1,
-2.377578, 0.02916251, -1.5454, 1, 0.05882353, 0, 1,
-2.357547, -1.025409, -2.297682, 1, 0.06666667, 0, 1,
-2.330853, 0.5084739, -1.443424, 1, 0.07058824, 0, 1,
-2.244416, -0.3187055, -0.2898683, 1, 0.07843138, 0, 1,
-2.224791, -0.2542607, -2.799078, 1, 0.08235294, 0, 1,
-2.186376, -0.09493572, -3.343973, 1, 0.09019608, 0, 1,
-2.167106, -1.347648, -1.042206, 1, 0.09411765, 0, 1,
-2.109456, -0.6977913, -1.634372, 1, 0.1019608, 0, 1,
-2.108754, -0.8227474, -1.846629, 1, 0.1098039, 0, 1,
-2.088433, 0.1028827, -0.4664111, 1, 0.1137255, 0, 1,
-2.049576, 0.6642325, -1.968022, 1, 0.1215686, 0, 1,
-2.023744, -0.7055843, -0.9887125, 1, 0.1254902, 0, 1,
-2.023554, 0.3404278, -0.07842553, 1, 0.1333333, 0, 1,
-1.977299, -0.1933788, -0.9262102, 1, 0.1372549, 0, 1,
-1.960526, 2.362215, -0.4191589, 1, 0.145098, 0, 1,
-1.939702, -0.4790908, -2.372725, 1, 0.1490196, 0, 1,
-1.939542, -1.029248, -0.3443125, 1, 0.1568628, 0, 1,
-1.91478, -1.370284, -2.000348, 1, 0.1607843, 0, 1,
-1.911287, -0.6932009, -3.516973, 1, 0.1686275, 0, 1,
-1.899507, -0.5946847, -2.208668, 1, 0.172549, 0, 1,
-1.883949, 0.909065, -0.9305303, 1, 0.1803922, 0, 1,
-1.876729, 1.498564, 0.8707918, 1, 0.1843137, 0, 1,
-1.870477, 1.179435, -2.209529, 1, 0.1921569, 0, 1,
-1.86738, -0.3423352, -1.217194, 1, 0.1960784, 0, 1,
-1.833721, 0.5990338, -1.563891, 1, 0.2039216, 0, 1,
-1.812609, 0.568231, 0.7640954, 1, 0.2117647, 0, 1,
-1.799177, 1.258556, 0.4287056, 1, 0.2156863, 0, 1,
-1.778073, 0.4006678, -1.150336, 1, 0.2235294, 0, 1,
-1.729253, -2.325233, -3.836862, 1, 0.227451, 0, 1,
-1.719719, -0.1386867, -3.419986, 1, 0.2352941, 0, 1,
-1.71397, -0.1656777, -3.277177, 1, 0.2392157, 0, 1,
-1.709857, 2.025818, -0.3301358, 1, 0.2470588, 0, 1,
-1.691242, -0.7148489, -2.874008, 1, 0.2509804, 0, 1,
-1.682498, -0.643757, -3.218287, 1, 0.2588235, 0, 1,
-1.682438, 0.8229029, -1.101677, 1, 0.2627451, 0, 1,
-1.675504, 0.9754168, -0.4674412, 1, 0.2705882, 0, 1,
-1.668329, 0.7750484, -2.098915, 1, 0.2745098, 0, 1,
-1.648968, -0.3316284, -1.140046, 1, 0.282353, 0, 1,
-1.609444, 0.3099743, -1.689691, 1, 0.2862745, 0, 1,
-1.5943, -0.2229806, -1.756085, 1, 0.2941177, 0, 1,
-1.584525, -1.247721, -2.455617, 1, 0.3019608, 0, 1,
-1.573938, -0.7470757, -0.7735238, 1, 0.3058824, 0, 1,
-1.573537, -0.6565065, -0.9790828, 1, 0.3137255, 0, 1,
-1.538528, 1.254504, -0.3110381, 1, 0.3176471, 0, 1,
-1.536586, -1.229047, -0.2695096, 1, 0.3254902, 0, 1,
-1.528387, -1.388538, -2.79109, 1, 0.3294118, 0, 1,
-1.525041, -1.848076, -3.08934, 1, 0.3372549, 0, 1,
-1.521785, -0.7915561, -1.513959, 1, 0.3411765, 0, 1,
-1.518784, 1.011818, -1.657323, 1, 0.3490196, 0, 1,
-1.505107, 0.1817629, -1.422899, 1, 0.3529412, 0, 1,
-1.501307, -1.345687, -2.74676, 1, 0.3607843, 0, 1,
-1.49747, 1.320926, -1.940277, 1, 0.3647059, 0, 1,
-1.472953, 1.573188, 0.2155219, 1, 0.372549, 0, 1,
-1.465586, 0.2284229, -1.934143, 1, 0.3764706, 0, 1,
-1.463907, 0.2383241, 0.4463237, 1, 0.3843137, 0, 1,
-1.455862, -0.3911495, -3.175069, 1, 0.3882353, 0, 1,
-1.452953, 1.398146, -1.497507, 1, 0.3960784, 0, 1,
-1.451487, 1.23075, 0.4279253, 1, 0.4039216, 0, 1,
-1.427256, -0.821252, -1.582134, 1, 0.4078431, 0, 1,
-1.425564, -1.224631, -1.750543, 1, 0.4156863, 0, 1,
-1.425173, -2.195638, -3.115527, 1, 0.4196078, 0, 1,
-1.42168, 0.2118761, -2.106865, 1, 0.427451, 0, 1,
-1.412574, 1.608058, -0.2165943, 1, 0.4313726, 0, 1,
-1.409351, 1.362851, 0.232824, 1, 0.4392157, 0, 1,
-1.406689, -0.7612632, -2.000401, 1, 0.4431373, 0, 1,
-1.401154, -0.1093747, -3.394506, 1, 0.4509804, 0, 1,
-1.39729, -0.03858978, -1.896735, 1, 0.454902, 0, 1,
-1.394181, -0.1986249, -1.669398, 1, 0.4627451, 0, 1,
-1.391023, 0.3330485, -2.407095, 1, 0.4666667, 0, 1,
-1.377751, -1.473066, -2.322882, 1, 0.4745098, 0, 1,
-1.37476, -0.5059516, -1.998212, 1, 0.4784314, 0, 1,
-1.370483, 0.5523951, -0.9906999, 1, 0.4862745, 0, 1,
-1.369164, -0.9661769, -2.86435, 1, 0.4901961, 0, 1,
-1.365831, -0.8245154, -1.858335, 1, 0.4980392, 0, 1,
-1.365685, -0.4286537, -2.955836, 1, 0.5058824, 0, 1,
-1.357958, 1.644236, 0.2874749, 1, 0.509804, 0, 1,
-1.354526, -0.6447045, -1.832672, 1, 0.5176471, 0, 1,
-1.348184, 0.3111044, -1.033914, 1, 0.5215687, 0, 1,
-1.342115, 0.7409683, -1.812854, 1, 0.5294118, 0, 1,
-1.339026, -0.3120566, -1.186483, 1, 0.5333334, 0, 1,
-1.32627, 0.1195286, -0.7036041, 1, 0.5411765, 0, 1,
-1.3246, -0.05510177, -1.584002, 1, 0.5450981, 0, 1,
-1.317943, -0.1905259, -1.371915, 1, 0.5529412, 0, 1,
-1.316113, -0.3576774, -2.309265, 1, 0.5568628, 0, 1,
-1.309462, -0.03837173, -2.25559, 1, 0.5647059, 0, 1,
-1.30666, 0.08467779, -1.038204, 1, 0.5686275, 0, 1,
-1.303496, 0.8451089, -1.536675, 1, 0.5764706, 0, 1,
-1.300447, -1.537041, -3.097707, 1, 0.5803922, 0, 1,
-1.287705, -0.8762999, -1.782914, 1, 0.5882353, 0, 1,
-1.284706, -0.1044596, -2.774031, 1, 0.5921569, 0, 1,
-1.283686, 0.7204754, -1.405119, 1, 0.6, 0, 1,
-1.276958, 0.8697262, -1.043732, 1, 0.6078432, 0, 1,
-1.276144, 0.1059547, -1.485492, 1, 0.6117647, 0, 1,
-1.273941, 0.9854922, -0.4923163, 1, 0.6196079, 0, 1,
-1.265277, 0.1457563, -3.00958, 1, 0.6235294, 0, 1,
-1.257979, 0.3614638, -2.121375, 1, 0.6313726, 0, 1,
-1.255555, -0.234032, -1.920928, 1, 0.6352941, 0, 1,
-1.250453, 1.219779, -1.631289, 1, 0.6431373, 0, 1,
-1.247103, -0.2948869, -2.800384, 1, 0.6470588, 0, 1,
-1.231079, -0.1973628, -1.345519, 1, 0.654902, 0, 1,
-1.229536, -0.5836531, -1.641, 1, 0.6588235, 0, 1,
-1.221815, 0.9505463, -1.934305, 1, 0.6666667, 0, 1,
-1.220194, 1.736672, 0.673215, 1, 0.6705883, 0, 1,
-1.214659, -0.7815354, -1.568049, 1, 0.6784314, 0, 1,
-1.196422, -1.139274, -1.566947, 1, 0.682353, 0, 1,
-1.195954, 0.01308288, 0.1444782, 1, 0.6901961, 0, 1,
-1.193432, -0.9359735, -4.210721, 1, 0.6941177, 0, 1,
-1.182185, 0.04126213, -0.2911163, 1, 0.7019608, 0, 1,
-1.181336, -2.773104e-05, -0.7671233, 1, 0.7098039, 0, 1,
-1.179006, 0.1405612, -2.891092, 1, 0.7137255, 0, 1,
-1.177463, -0.6140084, -1.153951, 1, 0.7215686, 0, 1,
-1.168511, -0.7094899, -2.055972, 1, 0.7254902, 0, 1,
-1.158155, -1.290422, -2.241733, 1, 0.7333333, 0, 1,
-1.156414, 0.437802, 0.6137352, 1, 0.7372549, 0, 1,
-1.154556, 0.4038648, 0.1230553, 1, 0.7450981, 0, 1,
-1.1502, -1.263224, -1.128709, 1, 0.7490196, 0, 1,
-1.147594, -0.7324376, -1.950773, 1, 0.7568628, 0, 1,
-1.14413, 0.8786034, -2.786046, 1, 0.7607843, 0, 1,
-1.140624, -1.073972, -1.377474, 1, 0.7686275, 0, 1,
-1.139865, 1.642675, -4.702823, 1, 0.772549, 0, 1,
-1.130229, 1.196219, -0.6703472, 1, 0.7803922, 0, 1,
-1.124916, -0.3466544, -1.030459, 1, 0.7843137, 0, 1,
-1.120435, 0.6880441, -0.7515309, 1, 0.7921569, 0, 1,
-1.11998, 1.288352, 0.2039885, 1, 0.7960784, 0, 1,
-1.119942, -0.4561254, -1.841203, 1, 0.8039216, 0, 1,
-1.119004, 0.9478117, -1.57526, 1, 0.8117647, 0, 1,
-1.111921, -0.5686219, -4.325616, 1, 0.8156863, 0, 1,
-1.11067, 0.6257507, -2.547286, 1, 0.8235294, 0, 1,
-1.107293, 0.306592, -2.113715, 1, 0.827451, 0, 1,
-1.104608, -0.4446075, -1.844776, 1, 0.8352941, 0, 1,
-1.102452, -0.5421268, -1.953683, 1, 0.8392157, 0, 1,
-1.09529, 0.8996871, 0.3384979, 1, 0.8470588, 0, 1,
-1.09356, 1.012794, -1.210615, 1, 0.8509804, 0, 1,
-1.083413, 2.470886, -0.2791477, 1, 0.8588235, 0, 1,
-1.076876, 0.3072196, -2.753312, 1, 0.8627451, 0, 1,
-1.074741, -0.2849442, -0.7129269, 1, 0.8705882, 0, 1,
-1.074725, 1.147955, -1.359019, 1, 0.8745098, 0, 1,
-1.07446, -0.7131675, -0.6139011, 1, 0.8823529, 0, 1,
-1.073278, -0.1751425, -1.949648, 1, 0.8862745, 0, 1,
-1.072572, -0.8980724, -1.551484, 1, 0.8941177, 0, 1,
-1.07231, 1.186888, 0.8111192, 1, 0.8980392, 0, 1,
-1.071625, -0.2702525, -2.117691, 1, 0.9058824, 0, 1,
-1.071452, 0.5987434, -2.831913, 1, 0.9137255, 0, 1,
-1.069242, -1.576202, -2.170118, 1, 0.9176471, 0, 1,
-1.0539, -1.266974, -2.221059, 1, 0.9254902, 0, 1,
-1.050918, 0.797231, -1.891608, 1, 0.9294118, 0, 1,
-1.038352, -0.2082759, 0.2037734, 1, 0.9372549, 0, 1,
-1.024996, 1.350531, -2.881601, 1, 0.9411765, 0, 1,
-1.019606, 0.2624484, -0.294069, 1, 0.9490196, 0, 1,
-1.017865, 0.7243721, -0.7078741, 1, 0.9529412, 0, 1,
-1.017346, -1.237344, -2.419984, 1, 0.9607843, 0, 1,
-1.007194, -0.6525614, -3.843355, 1, 0.9647059, 0, 1,
-1.000946, -1.775902, -2.88658, 1, 0.972549, 0, 1,
-0.9964578, -1.023342, -1.986081, 1, 0.9764706, 0, 1,
-0.9918412, -0.1243656, -2.435558, 1, 0.9843137, 0, 1,
-0.9909703, 1.157964, 0.08221582, 1, 0.9882353, 0, 1,
-0.9870742, -1.480453, -1.807491, 1, 0.9960784, 0, 1,
-0.985137, 0.2662394, -0.9195001, 0.9960784, 1, 0, 1,
-0.9844839, -0.8788273, -2.400361, 0.9921569, 1, 0, 1,
-0.9807577, 0.9687291, -0.06223897, 0.9843137, 1, 0, 1,
-0.9803622, 0.1717183, -1.814134, 0.9803922, 1, 0, 1,
-0.9751776, -0.567127, -3.401757, 0.972549, 1, 0, 1,
-0.9702613, -0.6355444, -1.429159, 0.9686275, 1, 0, 1,
-0.9693295, -0.05145193, -1.497017, 0.9607843, 1, 0, 1,
-0.9642909, 1.048915, -3.18846, 0.9568627, 1, 0, 1,
-0.9623002, 0.800984, -1.655793, 0.9490196, 1, 0, 1,
-0.956904, -0.4814888, -2.17587, 0.945098, 1, 0, 1,
-0.956384, -1.031035, -3.708062, 0.9372549, 1, 0, 1,
-0.9543138, 2.099616, 1.33176, 0.9333333, 1, 0, 1,
-0.9535512, -0.6664518, -2.22379, 0.9254902, 1, 0, 1,
-0.9526101, -0.9866207, -3.781813, 0.9215686, 1, 0, 1,
-0.9437206, -2.165076, -1.972519, 0.9137255, 1, 0, 1,
-0.9312832, -1.996174, -3.488889, 0.9098039, 1, 0, 1,
-0.9285802, -1.23937, -2.876472, 0.9019608, 1, 0, 1,
-0.9284211, -0.9425221, -1.47883, 0.8941177, 1, 0, 1,
-0.9274526, -2.267628, -2.899091, 0.8901961, 1, 0, 1,
-0.9255055, 0.1347402, -0.655884, 0.8823529, 1, 0, 1,
-0.9253192, -0.1395581, -1.338413, 0.8784314, 1, 0, 1,
-0.9229509, 0.9081597, 0.2722882, 0.8705882, 1, 0, 1,
-0.9202251, -0.7669553, -2.840028, 0.8666667, 1, 0, 1,
-0.9154613, -0.459326, -3.540532, 0.8588235, 1, 0, 1,
-0.9153613, -0.4521904, -2.267029, 0.854902, 1, 0, 1,
-0.9150813, -0.9894354, -3.12708, 0.8470588, 1, 0, 1,
-0.9114628, -0.2863565, -1.928168, 0.8431373, 1, 0, 1,
-0.9069616, 0.3989746, -1.554246, 0.8352941, 1, 0, 1,
-0.9069326, -0.3575696, -0.8988726, 0.8313726, 1, 0, 1,
-0.9068278, -1.240868, -4.617299, 0.8235294, 1, 0, 1,
-0.9038168, 0.8372206, -1.173188, 0.8196079, 1, 0, 1,
-0.9031035, -0.9247068, -1.522163, 0.8117647, 1, 0, 1,
-0.8940152, -0.7191087, -0.8444967, 0.8078431, 1, 0, 1,
-0.8938492, -1.042439, -2.460243, 0.8, 1, 0, 1,
-0.8893311, -0.2229812, 0.09498657, 0.7921569, 1, 0, 1,
-0.8843468, -0.1329238, -2.946243, 0.7882353, 1, 0, 1,
-0.8842147, 0.8710003, -0.382546, 0.7803922, 1, 0, 1,
-0.882835, 0.537302, -0.836129, 0.7764706, 1, 0, 1,
-0.8789906, 1.043964, -0.2873004, 0.7686275, 1, 0, 1,
-0.875217, 0.0445806, 0.6667477, 0.7647059, 1, 0, 1,
-0.8722023, -0.8080917, -3.830401, 0.7568628, 1, 0, 1,
-0.8711323, 0.2967188, 0.4332554, 0.7529412, 1, 0, 1,
-0.8688473, 1.529146, -1.93541, 0.7450981, 1, 0, 1,
-0.8686348, 0.154823, 0.6029199, 0.7411765, 1, 0, 1,
-0.8675752, 0.3514719, -0.1717902, 0.7333333, 1, 0, 1,
-0.8673757, -0.2486052, -1.181527, 0.7294118, 1, 0, 1,
-0.867012, 1.768406, -0.6433415, 0.7215686, 1, 0, 1,
-0.8640178, -0.388663, -3.056348, 0.7176471, 1, 0, 1,
-0.8580288, 0.1981813, -1.174053, 0.7098039, 1, 0, 1,
-0.8520613, -1.569542, -2.371065, 0.7058824, 1, 0, 1,
-0.849752, -1.68855, -3.278157, 0.6980392, 1, 0, 1,
-0.8464673, 1.124519, -0.0004962126, 0.6901961, 1, 0, 1,
-0.8456665, 0.3682012, -0.7675523, 0.6862745, 1, 0, 1,
-0.845062, -0.9668967, -1.733459, 0.6784314, 1, 0, 1,
-0.8428565, -0.3429367, -1.107253, 0.6745098, 1, 0, 1,
-0.8382264, -2.167533, -2.062446, 0.6666667, 1, 0, 1,
-0.8360507, 0.3512208, -2.760614, 0.6627451, 1, 0, 1,
-0.8358754, 0.7990013, -3.087434, 0.654902, 1, 0, 1,
-0.8314917, -0.08729503, -0.07255959, 0.6509804, 1, 0, 1,
-0.829116, -0.2185627, -1.050183, 0.6431373, 1, 0, 1,
-0.8289127, 0.1426522, -1.653184, 0.6392157, 1, 0, 1,
-0.8195451, 0.2969992, -0.7676392, 0.6313726, 1, 0, 1,
-0.8180665, -0.07038826, -0.974831, 0.627451, 1, 0, 1,
-0.8150139, -0.6221742, -2.262874, 0.6196079, 1, 0, 1,
-0.8146769, 0.4637544, -2.824537, 0.6156863, 1, 0, 1,
-0.8145255, -1.685427, -3.389469, 0.6078432, 1, 0, 1,
-0.8123691, -0.8867922, -2.81263, 0.6039216, 1, 0, 1,
-0.8119988, -1.668237, -2.530395, 0.5960785, 1, 0, 1,
-0.8092862, 1.037778, -0.6403341, 0.5882353, 1, 0, 1,
-0.8067905, -0.9892565, -2.619501, 0.5843138, 1, 0, 1,
-0.8030258, -0.7875315, -1.7714, 0.5764706, 1, 0, 1,
-0.8002942, 0.801738, -1.422774, 0.572549, 1, 0, 1,
-0.8001587, 1.53338, 1.743269, 0.5647059, 1, 0, 1,
-0.7963016, -1.132884, -2.706396, 0.5607843, 1, 0, 1,
-0.7928388, -0.7836562, -2.554236, 0.5529412, 1, 0, 1,
-0.7925687, -0.7313113, -3.129024, 0.5490196, 1, 0, 1,
-0.7900952, 0.5113988, -0.8610594, 0.5411765, 1, 0, 1,
-0.7838996, 0.5247717, -1.456052, 0.5372549, 1, 0, 1,
-0.7791879, -0.1918838, -3.688706, 0.5294118, 1, 0, 1,
-0.7699586, 0.008143025, -1.066669, 0.5254902, 1, 0, 1,
-0.7626702, -0.5036529, -3.48585, 0.5176471, 1, 0, 1,
-0.7622086, -2.420238, -2.963549, 0.5137255, 1, 0, 1,
-0.760102, 0.1708803, -2.016361, 0.5058824, 1, 0, 1,
-0.7598439, 1.249609, -1.827284, 0.5019608, 1, 0, 1,
-0.7596001, 0.7123944, -0.9295912, 0.4941176, 1, 0, 1,
-0.7563179, 0.6655178, -0.1201912, 0.4862745, 1, 0, 1,
-0.7560621, -0.0263912, -0.9378537, 0.4823529, 1, 0, 1,
-0.7521214, -1.401325, -1.480794, 0.4745098, 1, 0, 1,
-0.7466736, 0.6693945, -0.6519043, 0.4705882, 1, 0, 1,
-0.7454023, -0.3436687, -0.8960567, 0.4627451, 1, 0, 1,
-0.7410595, 0.7348558, -1.418416, 0.4588235, 1, 0, 1,
-0.738784, -1.096825, -3.465041, 0.4509804, 1, 0, 1,
-0.7387409, -0.1071964, -1.20655, 0.4470588, 1, 0, 1,
-0.7306315, -2.685618, -1.703125, 0.4392157, 1, 0, 1,
-0.7162027, 1.100719, 0.4470825, 0.4352941, 1, 0, 1,
-0.7128625, 0.2828125, -2.26796, 0.427451, 1, 0, 1,
-0.7112052, 0.8065125, -1.597829, 0.4235294, 1, 0, 1,
-0.6994543, -0.109161, -1.746599, 0.4156863, 1, 0, 1,
-0.6991642, -0.5365051, -1.84857, 0.4117647, 1, 0, 1,
-0.6946514, -1.029432, -2.835643, 0.4039216, 1, 0, 1,
-0.6945384, 0.552259, -0.970773, 0.3960784, 1, 0, 1,
-0.6922603, -1.4981, -1.885263, 0.3921569, 1, 0, 1,
-0.6854706, 0.6558372, -1.071, 0.3843137, 1, 0, 1,
-0.6831749, -0.7086231, -2.216458, 0.3803922, 1, 0, 1,
-0.6824135, 1.173636, -2.76009, 0.372549, 1, 0, 1,
-0.6809886, -0.8285429, -0.7112476, 0.3686275, 1, 0, 1,
-0.6706778, 1.560343, -1.870794, 0.3607843, 1, 0, 1,
-0.6633557, -0.3632873, -0.0670763, 0.3568628, 1, 0, 1,
-0.6495032, 0.3260813, -0.9950939, 0.3490196, 1, 0, 1,
-0.6494201, 0.8525087, -0.09443937, 0.345098, 1, 0, 1,
-0.6398478, -1.106433, -1.538794, 0.3372549, 1, 0, 1,
-0.6316822, 0.728306, 0.02606896, 0.3333333, 1, 0, 1,
-0.6312828, -1.88248, -3.855683, 0.3254902, 1, 0, 1,
-0.6310032, -0.7376882, -1.817521, 0.3215686, 1, 0, 1,
-0.6264513, 0.2209753, -1.205217, 0.3137255, 1, 0, 1,
-0.6224483, -0.5341505, -2.556593, 0.3098039, 1, 0, 1,
-0.6205727, 0.1437619, -3.311582, 0.3019608, 1, 0, 1,
-0.6175516, 0.6484676, -1.506752, 0.2941177, 1, 0, 1,
-0.6169981, 1.095314, 0.39902, 0.2901961, 1, 0, 1,
-0.6135625, -1.642155, -3.792163, 0.282353, 1, 0, 1,
-0.6131365, -0.08197998, -1.728327, 0.2784314, 1, 0, 1,
-0.6093816, 1.26811, -0.4038174, 0.2705882, 1, 0, 1,
-0.6091744, 0.6423472, -2.155602, 0.2666667, 1, 0, 1,
-0.5982531, 0.1043455, 0.08234795, 0.2588235, 1, 0, 1,
-0.5941774, 0.06466486, 0.6963778, 0.254902, 1, 0, 1,
-0.5923957, -2.374434, -2.427778, 0.2470588, 1, 0, 1,
-0.588466, -1.962167, -2.452892, 0.2431373, 1, 0, 1,
-0.5867863, -1.23708, -1.752323, 0.2352941, 1, 0, 1,
-0.5823978, 0.8544253, 0.1878652, 0.2313726, 1, 0, 1,
-0.5822195, 0.9140819, -0.346365, 0.2235294, 1, 0, 1,
-0.5753392, 1.162049, -0.916434, 0.2196078, 1, 0, 1,
-0.5750833, -1.70604, -3.626164, 0.2117647, 1, 0, 1,
-0.5706075, 2.97669, -1.015438, 0.2078431, 1, 0, 1,
-0.5705028, 2.501032, -1.807494, 0.2, 1, 0, 1,
-0.5687315, 0.6897564, 2.082839, 0.1921569, 1, 0, 1,
-0.5612198, -1.481367, -3.486589, 0.1882353, 1, 0, 1,
-0.5545444, 0.09780882, -1.383523, 0.1803922, 1, 0, 1,
-0.5504574, 0.3502214, -1.784958, 0.1764706, 1, 0, 1,
-0.5474515, -0.8265437, 0.005906213, 0.1686275, 1, 0, 1,
-0.5464578, 1.01264, -1.625824, 0.1647059, 1, 0, 1,
-0.5458263, 0.1297844, -0.9647071, 0.1568628, 1, 0, 1,
-0.545528, -1.185138, -1.737042, 0.1529412, 1, 0, 1,
-0.5432865, 0.2252237, -1.74176, 0.145098, 1, 0, 1,
-0.537887, 0.1306735, -2.269739, 0.1411765, 1, 0, 1,
-0.5365769, -0.3888957, -1.984979, 0.1333333, 1, 0, 1,
-0.5329459, -0.5838358, -1.469676, 0.1294118, 1, 0, 1,
-0.5243596, -1.317791, -3.898191, 0.1215686, 1, 0, 1,
-0.520562, -0.556586, -1.816453, 0.1176471, 1, 0, 1,
-0.5168751, -2.291363, -2.902537, 0.1098039, 1, 0, 1,
-0.5154445, 0.5820491, -1.470489, 0.1058824, 1, 0, 1,
-0.5117927, 0.1313991, -0.2168292, 0.09803922, 1, 0, 1,
-0.5080566, -1.64337, -2.741482, 0.09019608, 1, 0, 1,
-0.4997711, -1.535661, -0.7343073, 0.08627451, 1, 0, 1,
-0.4991669, -1.39725, -3.309948, 0.07843138, 1, 0, 1,
-0.4989171, -0.01443563, -1.566416, 0.07450981, 1, 0, 1,
-0.4948266, 0.3769647, -0.05286861, 0.06666667, 1, 0, 1,
-0.4937914, 1.073201, -0.808807, 0.0627451, 1, 0, 1,
-0.4924349, 0.9313013, -0.4365361, 0.05490196, 1, 0, 1,
-0.4873332, -0.8764842, -4.056271, 0.05098039, 1, 0, 1,
-0.4843549, -0.06652401, -0.3940616, 0.04313726, 1, 0, 1,
-0.4829133, -0.7713215, -3.573287, 0.03921569, 1, 0, 1,
-0.4799318, 1.150545, -0.5210522, 0.03137255, 1, 0, 1,
-0.470636, -1.024845, -1.095475, 0.02745098, 1, 0, 1,
-0.4700506, -1.09896, -2.2035, 0.01960784, 1, 0, 1,
-0.4688091, 0.2601134, -0.09178099, 0.01568628, 1, 0, 1,
-0.465396, -0.9816132, -2.918269, 0.007843138, 1, 0, 1,
-0.4643114, -1.404555, -2.05008, 0.003921569, 1, 0, 1,
-0.4605169, 0.1239379, -1.785059, 0, 1, 0.003921569, 1,
-0.4598423, -1.247159, -2.008926, 0, 1, 0.01176471, 1,
-0.4590485, -0.1423619, -1.434492, 0, 1, 0.01568628, 1,
-0.4428131, -0.7930729, -3.322305, 0, 1, 0.02352941, 1,
-0.442771, 0.2178717, -0.02693201, 0, 1, 0.02745098, 1,
-0.4412863, -1.169553, -2.921067, 0, 1, 0.03529412, 1,
-0.4412661, -0.2983051, -2.455022, 0, 1, 0.03921569, 1,
-0.4364133, -1.533176, -2.890819, 0, 1, 0.04705882, 1,
-0.4351997, -0.2634288, -2.657434, 0, 1, 0.05098039, 1,
-0.4282816, -0.5791799, -3.209272, 0, 1, 0.05882353, 1,
-0.4274242, 1.131586, 0.3848064, 0, 1, 0.0627451, 1,
-0.4265511, -1.088275, -4.389241, 0, 1, 0.07058824, 1,
-0.4240966, 1.209475, -0.471686, 0, 1, 0.07450981, 1,
-0.4236752, 0.3544719, -1.671902, 0, 1, 0.08235294, 1,
-0.4225674, 0.402832, -1.340349, 0, 1, 0.08627451, 1,
-0.4196598, 0.1670918, -3.076378, 0, 1, 0.09411765, 1,
-0.4180002, -1.263152, -1.127429, 0, 1, 0.1019608, 1,
-0.4160594, 0.8255538, -0.1825501, 0, 1, 0.1058824, 1,
-0.4143729, 0.8138959, -2.118483, 0, 1, 0.1137255, 1,
-0.4137284, 0.1425579, -1.675845, 0, 1, 0.1176471, 1,
-0.4124285, -1.173609, -3.153038, 0, 1, 0.1254902, 1,
-0.4064378, 1.158905, 0.07257911, 0, 1, 0.1294118, 1,
-0.39887, -2.430898, -2.528212, 0, 1, 0.1372549, 1,
-0.3987051, 1.845112, 0.8513368, 0, 1, 0.1411765, 1,
-0.3972079, 0.2046038, -0.7038841, 0, 1, 0.1490196, 1,
-0.3950621, -0.5305033, -4.429031, 0, 1, 0.1529412, 1,
-0.3945913, -0.03511899, -1.507467, 0, 1, 0.1607843, 1,
-0.3893768, -0.8153641, -3.210119, 0, 1, 0.1647059, 1,
-0.3889137, -0.869823, -2.051018, 0, 1, 0.172549, 1,
-0.3820129, 1.445196, -2.149752, 0, 1, 0.1764706, 1,
-0.3807212, 1.694597, 1.779575, 0, 1, 0.1843137, 1,
-0.3798407, 2.196594, -0.391934, 0, 1, 0.1882353, 1,
-0.378114, 0.7217802, -1.012658, 0, 1, 0.1960784, 1,
-0.3775726, -1.194081, -2.368304, 0, 1, 0.2039216, 1,
-0.3774057, 1.877916, -0.4065798, 0, 1, 0.2078431, 1,
-0.3752286, 0.3095504, -1.34548, 0, 1, 0.2156863, 1,
-0.3739868, -0.9738584, -1.679691, 0, 1, 0.2196078, 1,
-0.3667943, 0.4170861, -1.17775, 0, 1, 0.227451, 1,
-0.364541, 0.977995, 0.507667, 0, 1, 0.2313726, 1,
-0.3631208, 0.6483968, -0.204772, 0, 1, 0.2392157, 1,
-0.3604775, 0.6520348, -2.263151, 0, 1, 0.2431373, 1,
-0.3583501, 1.878619, -0.02878247, 0, 1, 0.2509804, 1,
-0.3576211, 0.8708326, 0.1731383, 0, 1, 0.254902, 1,
-0.3458636, -0.2489349, -2.062093, 0, 1, 0.2627451, 1,
-0.3430946, 0.4634905, -0.9206936, 0, 1, 0.2666667, 1,
-0.3410124, -0.07474373, -2.869056, 0, 1, 0.2745098, 1,
-0.3390802, 0.1207294, -1.852652, 0, 1, 0.2784314, 1,
-0.3390269, 0.410014, 0.1818655, 0, 1, 0.2862745, 1,
-0.3350483, -0.5669473, -3.33283, 0, 1, 0.2901961, 1,
-0.3340405, -1.660039, -3.817116, 0, 1, 0.2980392, 1,
-0.3321012, 1.092663, -0.9750493, 0, 1, 0.3058824, 1,
-0.3298285, 0.6143413, 0.332652, 0, 1, 0.3098039, 1,
-0.3296838, 0.5178758, -0.1811158, 0, 1, 0.3176471, 1,
-0.3271745, 1.358466, 1.613476, 0, 1, 0.3215686, 1,
-0.3263435, -1.152513, -2.154452, 0, 1, 0.3294118, 1,
-0.324342, -1.077322, -3.736772, 0, 1, 0.3333333, 1,
-0.3224669, -0.1621255, -4.028096, 0, 1, 0.3411765, 1,
-0.3167876, 1.261549, 0.3427952, 0, 1, 0.345098, 1,
-0.3103262, 0.3100848, -1.464217, 0, 1, 0.3529412, 1,
-0.30605, 0.7566305, -0.9566653, 0, 1, 0.3568628, 1,
-0.3035058, -0.03329314, -1.018801, 0, 1, 0.3647059, 1,
-0.3008384, 0.9917786, 0.2023831, 0, 1, 0.3686275, 1,
-0.2991929, 0.6149163, 0.1490729, 0, 1, 0.3764706, 1,
-0.2973118, 0.6917875, -1.743374, 0, 1, 0.3803922, 1,
-0.2937386, -0.0413597, -0.3776432, 0, 1, 0.3882353, 1,
-0.2930371, 0.5590662, 0.03723381, 0, 1, 0.3921569, 1,
-0.2894368, -1.965504, -2.443023, 0, 1, 0.4, 1,
-0.2888048, -1.996564, -3.322522, 0, 1, 0.4078431, 1,
-0.2829975, -0.7041937, -4.828991, 0, 1, 0.4117647, 1,
-0.2819715, 0.3167694, -2.157619, 0, 1, 0.4196078, 1,
-0.2719002, 0.8180254, -1.123878, 0, 1, 0.4235294, 1,
-0.2702806, 0.3076678, -0.9474794, 0, 1, 0.4313726, 1,
-0.2571755, -1.779446, -2.210441, 0, 1, 0.4352941, 1,
-0.2547492, -0.9957331, -3.929314, 0, 1, 0.4431373, 1,
-0.2535482, -0.4336409, -2.254339, 0, 1, 0.4470588, 1,
-0.2509121, -1.784814, -0.8626198, 0, 1, 0.454902, 1,
-0.2476884, -1.086025, -3.088698, 0, 1, 0.4588235, 1,
-0.2475127, 1.691919, -1.636445, 0, 1, 0.4666667, 1,
-0.245296, -1.55875, -2.507516, 0, 1, 0.4705882, 1,
-0.2430139, 1.080252, -1.203314, 0, 1, 0.4784314, 1,
-0.2423957, 1.856259, 1.567044, 0, 1, 0.4823529, 1,
-0.2412378, 0.4644611, -1.184272, 0, 1, 0.4901961, 1,
-0.2409338, -0.0425167, -1.717267, 0, 1, 0.4941176, 1,
-0.2385745, -1.257041, -3.088071, 0, 1, 0.5019608, 1,
-0.2365191, -0.9652848, -2.83998, 0, 1, 0.509804, 1,
-0.2363427, -0.7863249, -2.066867, 0, 1, 0.5137255, 1,
-0.2282522, 1.351571, 1.748275, 0, 1, 0.5215687, 1,
-0.2241808, -0.0274667, -2.8463, 0, 1, 0.5254902, 1,
-0.2235128, -0.4949377, -3.938026, 0, 1, 0.5333334, 1,
-0.222398, 0.007062763, -1.650617, 0, 1, 0.5372549, 1,
-0.2131186, 1.173843, 0.127461, 0, 1, 0.5450981, 1,
-0.2116775, 0.02038634, -2.774467, 0, 1, 0.5490196, 1,
-0.207157, -0.06833728, 0.3301177, 0, 1, 0.5568628, 1,
-0.2060334, -1.916836, -3.724099, 0, 1, 0.5607843, 1,
-0.203085, 1.439166, 1.518385, 0, 1, 0.5686275, 1,
-0.2013432, -0.08973517, -3.205191, 0, 1, 0.572549, 1,
-0.2009678, 0.2901905, -2.14905, 0, 1, 0.5803922, 1,
-0.1988519, 0.4692966, 0.3102902, 0, 1, 0.5843138, 1,
-0.1975316, 0.5818948, -0.06708577, 0, 1, 0.5921569, 1,
-0.1949951, -0.9857512, -2.542199, 0, 1, 0.5960785, 1,
-0.1938129, -1.61048, -3.812155, 0, 1, 0.6039216, 1,
-0.1924231, 2.227332, -0.3635039, 0, 1, 0.6117647, 1,
-0.190806, -1.635379, -3.970605, 0, 1, 0.6156863, 1,
-0.1850029, -1.535777, -1.496207, 0, 1, 0.6235294, 1,
-0.1840944, -0.8641185, -2.207541, 0, 1, 0.627451, 1,
-0.1822692, -0.02624332, -1.646527, 0, 1, 0.6352941, 1,
-0.1803892, -1.085105, -3.404469, 0, 1, 0.6392157, 1,
-0.1760179, -0.2131262, -2.544767, 0, 1, 0.6470588, 1,
-0.1744033, -0.9422681, -4.068816, 0, 1, 0.6509804, 1,
-0.1715798, -0.5514556, -2.688531, 0, 1, 0.6588235, 1,
-0.1670223, 0.1943765, -0.9069783, 0, 1, 0.6627451, 1,
-0.1550318, -0.6033386, -3.366793, 0, 1, 0.6705883, 1,
-0.152424, 0.4344842, 0.6749009, 0, 1, 0.6745098, 1,
-0.146596, 0.336126, 0.8079857, 0, 1, 0.682353, 1,
-0.145444, -0.2502303, -2.844459, 0, 1, 0.6862745, 1,
-0.1447459, 0.4044515, -0.4922411, 0, 1, 0.6941177, 1,
-0.1431735, -0.7792645, -0.7429569, 0, 1, 0.7019608, 1,
-0.1412014, -0.3374526, -2.220542, 0, 1, 0.7058824, 1,
-0.1409869, -0.3297867, -3.894807, 0, 1, 0.7137255, 1,
-0.1405677, 1.168875, -0.2008613, 0, 1, 0.7176471, 1,
-0.1363309, -0.7353278, -3.42378, 0, 1, 0.7254902, 1,
-0.1357903, 1.13393, 0.1253667, 0, 1, 0.7294118, 1,
-0.1347519, -0.2191182, -1.99855, 0, 1, 0.7372549, 1,
-0.1332052, 0.1492035, -1.222563, 0, 1, 0.7411765, 1,
-0.1329001, -0.8401385, -1.489111, 0, 1, 0.7490196, 1,
-0.1295531, 0.7280804, 0.9185391, 0, 1, 0.7529412, 1,
-0.1267048, 1.438143, 1.344111, 0, 1, 0.7607843, 1,
-0.1255522, -0.4011135, -2.895714, 0, 1, 0.7647059, 1,
-0.1231785, -0.243725, -2.928898, 0, 1, 0.772549, 1,
-0.1190999, -0.02848201, -0.9314594, 0, 1, 0.7764706, 1,
-0.1189562, -1.449873, -3.815836, 0, 1, 0.7843137, 1,
-0.1174759, -0.033521, -1.473985, 0, 1, 0.7882353, 1,
-0.1151048, 0.5163236, 0.3328538, 0, 1, 0.7960784, 1,
-0.1142135, 0.1911942, -0.6745144, 0, 1, 0.8039216, 1,
-0.1111015, 1.088294, 0.6641124, 0, 1, 0.8078431, 1,
-0.1067156, 0.7050285, -1.089726, 0, 1, 0.8156863, 1,
-0.1000756, 1.877308, 0.09044708, 0, 1, 0.8196079, 1,
-0.09928117, -0.7028406, -1.634429, 0, 1, 0.827451, 1,
-0.09770187, -0.5329453, -1.880223, 0, 1, 0.8313726, 1,
-0.08790198, 0.6392866, 0.3271427, 0, 1, 0.8392157, 1,
-0.08564491, 0.4612094, -1.336754, 0, 1, 0.8431373, 1,
-0.08518163, -0.0671633, -3.519119, 0, 1, 0.8509804, 1,
-0.0849629, -1.642255, -3.258515, 0, 1, 0.854902, 1,
-0.07003599, 0.3903712, 0.1528582, 0, 1, 0.8627451, 1,
-0.06979834, 1.563811, 0.6199902, 0, 1, 0.8666667, 1,
-0.06048232, 0.5208418, -0.06620815, 0, 1, 0.8745098, 1,
-0.05987016, -0.1178298, -3.198315, 0, 1, 0.8784314, 1,
-0.05940037, 0.2583974, 0.4871053, 0, 1, 0.8862745, 1,
-0.05896951, 0.5259944, 0.0137204, 0, 1, 0.8901961, 1,
-0.05893872, 0.00309121, -0.2937203, 0, 1, 0.8980392, 1,
-0.0588361, 1.604414, -0.7608131, 0, 1, 0.9058824, 1,
-0.05735029, 1.013342, -0.3425339, 0, 1, 0.9098039, 1,
-0.05693414, 1.206972, -0.9684877, 0, 1, 0.9176471, 1,
-0.05579567, -1.160836, -2.131948, 0, 1, 0.9215686, 1,
-0.05095439, 0.2008424, 1.56991, 0, 1, 0.9294118, 1,
-0.04297324, -0.4117982, -6.191155, 0, 1, 0.9333333, 1,
-0.03751206, -0.5832968, -3.83814, 0, 1, 0.9411765, 1,
-0.02884528, 0.1151037, -0.9773968, 0, 1, 0.945098, 1,
-0.02782023, 1.562985, -0.2768348, 0, 1, 0.9529412, 1,
-0.02511166, 1.280699, 0.2990444, 0, 1, 0.9568627, 1,
-0.02240171, -2.045676, -2.088676, 0, 1, 0.9647059, 1,
-0.0180282, -1.512295, -2.071151, 0, 1, 0.9686275, 1,
-0.01606818, -0.5304815, -2.387626, 0, 1, 0.9764706, 1,
-0.008640201, 1.089969, 0.7697431, 0, 1, 0.9803922, 1,
-0.002306601, -1.541695, -3.289384, 0, 1, 0.9882353, 1,
0.001136554, -0.8694918, 3.48784, 0, 1, 0.9921569, 1,
0.003260353, -0.8372111, 1.329287, 0, 1, 1, 1,
0.003484134, 0.1431412, 1.349193, 0, 0.9921569, 1, 1,
0.007862492, -0.07098905, 3.31194, 0, 0.9882353, 1, 1,
0.00933751, 0.8287126, -1.16714, 0, 0.9803922, 1, 1,
0.01261935, -0.860958, 3.445189, 0, 0.9764706, 1, 1,
0.01319237, 1.837245, 1.228663, 0, 0.9686275, 1, 1,
0.01843632, 0.5076001, 0.05847662, 0, 0.9647059, 1, 1,
0.02328952, 0.1265407, 2.034769, 0, 0.9568627, 1, 1,
0.02332909, 0.3633796, 0.6817428, 0, 0.9529412, 1, 1,
0.02691454, -0.941075, 2.070814, 0, 0.945098, 1, 1,
0.02836657, 0.7042638, -1.446532, 0, 0.9411765, 1, 1,
0.02837435, 0.6297863, -0.4596889, 0, 0.9333333, 1, 1,
0.0309743, 0.327227, 1.36587, 0, 0.9294118, 1, 1,
0.03145516, 1.465344, -1.818726, 0, 0.9215686, 1, 1,
0.03372493, -0.8563289, 2.115536, 0, 0.9176471, 1, 1,
0.03552223, -0.07937694, 2.71792, 0, 0.9098039, 1, 1,
0.03735588, 0.2747563, -0.2823993, 0, 0.9058824, 1, 1,
0.03823613, 2.201643, 0.3285782, 0, 0.8980392, 1, 1,
0.04741891, -0.02190891, 2.49327, 0, 0.8901961, 1, 1,
0.04881774, 0.2332692, 0.4296591, 0, 0.8862745, 1, 1,
0.04906025, 0.6632127, 0.5416789, 0, 0.8784314, 1, 1,
0.04940093, 0.9679862, 0.5666921, 0, 0.8745098, 1, 1,
0.04941522, 0.7299741, -1.133767, 0, 0.8666667, 1, 1,
0.04988984, -0.5049551, 3.350694, 0, 0.8627451, 1, 1,
0.04992384, -1.33863, 3.003619, 0, 0.854902, 1, 1,
0.05168028, -0.1774808, 4.362139, 0, 0.8509804, 1, 1,
0.06069592, 2.261581, 0.1151177, 0, 0.8431373, 1, 1,
0.06135377, -0.6296769, 2.030827, 0, 0.8392157, 1, 1,
0.06265081, -0.009334954, 1.607118, 0, 0.8313726, 1, 1,
0.06733269, -0.3207816, 1.073075, 0, 0.827451, 1, 1,
0.06822263, 1.28856, 0.7414898, 0, 0.8196079, 1, 1,
0.07003015, 0.5075526, 0.412201, 0, 0.8156863, 1, 1,
0.07425755, 0.4878638, 1.793285, 0, 0.8078431, 1, 1,
0.07467691, -1.310645, 2.04886, 0, 0.8039216, 1, 1,
0.07530063, -0.4991021, 2.203512, 0, 0.7960784, 1, 1,
0.08666664, 0.1919725, 0.7640738, 0, 0.7882353, 1, 1,
0.08773527, 0.6092167, -0.8447893, 0, 0.7843137, 1, 1,
0.08840512, -0.02188307, 1.718422, 0, 0.7764706, 1, 1,
0.0895084, -0.1051966, -0.3474705, 0, 0.772549, 1, 1,
0.0925426, -0.7514296, 3.700848, 0, 0.7647059, 1, 1,
0.09550335, -0.3245847, 2.703055, 0, 0.7607843, 1, 1,
0.09871302, 0.04192646, -0.05855361, 0, 0.7529412, 1, 1,
0.1000052, -0.3205021, 2.288378, 0, 0.7490196, 1, 1,
0.1083948, -0.6486374, 3.597581, 0, 0.7411765, 1, 1,
0.1087335, -0.6794134, 4.887817, 0, 0.7372549, 1, 1,
0.1165685, 0.6777364, 0.2584495, 0, 0.7294118, 1, 1,
0.1180128, -0.3305328, 2.836233, 0, 0.7254902, 1, 1,
0.1180564, -0.9953496, 2.070571, 0, 0.7176471, 1, 1,
0.1190475, 1.049689, -0.7621662, 0, 0.7137255, 1, 1,
0.1277687, -0.7664725, 3.094963, 0, 0.7058824, 1, 1,
0.1302092, 0.451538, -1.139498, 0, 0.6980392, 1, 1,
0.1309758, -0.4076163, 1.678234, 0, 0.6941177, 1, 1,
0.1322006, 0.6036333, 2.666668, 0, 0.6862745, 1, 1,
0.1346551, -0.3826577, 1.919201, 0, 0.682353, 1, 1,
0.1369648, 0.6672483, -0.5175841, 0, 0.6745098, 1, 1,
0.1371189, 0.3386838, 0.2121009, 0, 0.6705883, 1, 1,
0.137854, -0.3958192, 3.738176, 0, 0.6627451, 1, 1,
0.1404614, 0.3517436, 0.2432828, 0, 0.6588235, 1, 1,
0.1436772, -0.974298, 2.843755, 0, 0.6509804, 1, 1,
0.1501046, 1.269858, -2.083145, 0, 0.6470588, 1, 1,
0.1507834, 1.36587, -0.4763436, 0, 0.6392157, 1, 1,
0.1540235, -0.05115403, 2.956714, 0, 0.6352941, 1, 1,
0.1543298, 0.2515662, -0.3349572, 0, 0.627451, 1, 1,
0.1557856, 0.9891828, 0.6160747, 0, 0.6235294, 1, 1,
0.1567265, 0.3524626, 1.458938, 0, 0.6156863, 1, 1,
0.1596576, -0.7494596, 2.889539, 0, 0.6117647, 1, 1,
0.16014, 0.07394845, 2.752502, 0, 0.6039216, 1, 1,
0.1629669, -0.2544311, 1.732193, 0, 0.5960785, 1, 1,
0.1647429, 0.2756797, 1.259571, 0, 0.5921569, 1, 1,
0.1653351, 0.3917042, -0.06563523, 0, 0.5843138, 1, 1,
0.1749202, -0.4747453, 2.700552, 0, 0.5803922, 1, 1,
0.1753244, 1.558495, 1.167764, 0, 0.572549, 1, 1,
0.1779648, 0.674185, -0.05086382, 0, 0.5686275, 1, 1,
0.1783104, 0.2468219, -0.552619, 0, 0.5607843, 1, 1,
0.1791511, 0.9535462, 1.302711, 0, 0.5568628, 1, 1,
0.1821252, -0.3425034, 2.590863, 0, 0.5490196, 1, 1,
0.18246, -0.02792912, 1.939723, 0, 0.5450981, 1, 1,
0.1831908, 0.8988605, 1.781805, 0, 0.5372549, 1, 1,
0.1834022, -0.9235442, 2.198296, 0, 0.5333334, 1, 1,
0.184231, -0.5429458, 1.694335, 0, 0.5254902, 1, 1,
0.1863741, -1.813837, 2.864623, 0, 0.5215687, 1, 1,
0.1901903, -1.533869, 4.173023, 0, 0.5137255, 1, 1,
0.1903912, 0.1044728, 1.250327, 0, 0.509804, 1, 1,
0.1920537, 0.5695161, 0.2886233, 0, 0.5019608, 1, 1,
0.1932642, -0.7831047, 0.9589401, 0, 0.4941176, 1, 1,
0.1955905, -0.4011028, 2.211203, 0, 0.4901961, 1, 1,
0.202714, 0.2900971, 1.743866, 0, 0.4823529, 1, 1,
0.2030662, -1.82704, 3.819118, 0, 0.4784314, 1, 1,
0.2070258, 1.176736, -0.9674706, 0, 0.4705882, 1, 1,
0.2116163, -1.026318, 3.42212, 0, 0.4666667, 1, 1,
0.2145685, 0.1854337, 1.009481, 0, 0.4588235, 1, 1,
0.2252778, -1.086631, 3.941937, 0, 0.454902, 1, 1,
0.2256727, 0.447368, 0.2045891, 0, 0.4470588, 1, 1,
0.2261678, 0.2172505, 1.081974, 0, 0.4431373, 1, 1,
0.2299974, -0.05745469, 0.9390628, 0, 0.4352941, 1, 1,
0.2338481, 0.4266241, 2.096502, 0, 0.4313726, 1, 1,
0.2343755, 1.867532, 0.8275044, 0, 0.4235294, 1, 1,
0.2364362, 0.05896121, 0.3107898, 0, 0.4196078, 1, 1,
0.2366996, 0.3337303, 0.6469282, 0, 0.4117647, 1, 1,
0.2382143, 0.1194148, 1.776596, 0, 0.4078431, 1, 1,
0.2486818, 0.7010021, -0.495177, 0, 0.4, 1, 1,
0.2501437, 1.188516, -0.6705161, 0, 0.3921569, 1, 1,
0.2661801, -1.545831, 3.461495, 0, 0.3882353, 1, 1,
0.2668788, 1.009455, 0.9970917, 0, 0.3803922, 1, 1,
0.2681246, 1.795174, 0.07770343, 0, 0.3764706, 1, 1,
0.2714969, 0.4013581, -0.09632912, 0, 0.3686275, 1, 1,
0.2737595, 0.7209323, 1.346086, 0, 0.3647059, 1, 1,
0.2762513, 1.066582, 1.22646, 0, 0.3568628, 1, 1,
0.2789932, -1.991505, 0.6483259, 0, 0.3529412, 1, 1,
0.2805338, -0.3130911, 2.723501, 0, 0.345098, 1, 1,
0.2822765, -0.9583631, 3.06475, 0, 0.3411765, 1, 1,
0.2870754, -0.4206836, 2.10613, 0, 0.3333333, 1, 1,
0.287141, -1.003494, 2.324538, 0, 0.3294118, 1, 1,
0.2895603, 0.6556084, -0.2075496, 0, 0.3215686, 1, 1,
0.2980833, -0.01806778, 2.934838, 0, 0.3176471, 1, 1,
0.3012052, 0.9382414, 0.1290728, 0, 0.3098039, 1, 1,
0.3023908, -0.3904162, 1.844603, 0, 0.3058824, 1, 1,
0.3025232, 2.306832, 0.2891242, 0, 0.2980392, 1, 1,
0.3040102, 0.9561278, 0.3455372, 0, 0.2901961, 1, 1,
0.3054948, -0.5808522, 1.343832, 0, 0.2862745, 1, 1,
0.3067335, -1.3528, 2.085566, 0, 0.2784314, 1, 1,
0.3128135, -0.1080144, 1.530788, 0, 0.2745098, 1, 1,
0.316456, 1.670948, -0.6485616, 0, 0.2666667, 1, 1,
0.32476, -0.5263345, 0.02844063, 0, 0.2627451, 1, 1,
0.3255524, 0.8329724, 0.4192275, 0, 0.254902, 1, 1,
0.3329035, -0.7732615, 3.164952, 0, 0.2509804, 1, 1,
0.3348848, -1.63328, 4.379528, 0, 0.2431373, 1, 1,
0.3368905, -1.285731, 3.046697, 0, 0.2392157, 1, 1,
0.3394904, 2.324776, -0.3559074, 0, 0.2313726, 1, 1,
0.3404841, 0.7266995, 0.06633105, 0, 0.227451, 1, 1,
0.3422605, -0.6216199, 1.918525, 0, 0.2196078, 1, 1,
0.3444017, -0.7472609, 2.186335, 0, 0.2156863, 1, 1,
0.3465691, -0.7874446, 3.501772, 0, 0.2078431, 1, 1,
0.3484405, -0.8228893, 1.92815, 0, 0.2039216, 1, 1,
0.3513048, 0.5647375, 0.6635274, 0, 0.1960784, 1, 1,
0.3538104, 0.3729821, 0.8511583, 0, 0.1882353, 1, 1,
0.3564887, -0.190477, 0.656662, 0, 0.1843137, 1, 1,
0.3593371, 0.6802709, -1.164595, 0, 0.1764706, 1, 1,
0.3602663, 2.425332, -1.324544, 0, 0.172549, 1, 1,
0.3642724, 0.2175096, 1.702768, 0, 0.1647059, 1, 1,
0.3721834, 0.2955276, 0.7057795, 0, 0.1607843, 1, 1,
0.3748848, 0.009791613, 1.234225, 0, 0.1529412, 1, 1,
0.3752476, -0.8692908, 3.636949, 0, 0.1490196, 1, 1,
0.3825267, -0.3238297, 2.722667, 0, 0.1411765, 1, 1,
0.3857161, -0.7757677, 2.220014, 0, 0.1372549, 1, 1,
0.3876772, -2.491963, 1.365779, 0, 0.1294118, 1, 1,
0.3882739, 1.659933, 0.5240031, 0, 0.1254902, 1, 1,
0.3900827, -0.6813469, 3.812654, 0, 0.1176471, 1, 1,
0.3927419, 0.655526, 2.559766, 0, 0.1137255, 1, 1,
0.3929226, -1.979368, 4.964293, 0, 0.1058824, 1, 1,
0.3990648, -1.337092, 3.082478, 0, 0.09803922, 1, 1,
0.4070966, 0.4707856, 1.194683, 0, 0.09411765, 1, 1,
0.4237046, 1.931893, -0.6115023, 0, 0.08627451, 1, 1,
0.4332272, 1.449969, -0.9429252, 0, 0.08235294, 1, 1,
0.4397629, 0.7522771, 1.299521, 0, 0.07450981, 1, 1,
0.4416275, -2.945475, 3.494318, 0, 0.07058824, 1, 1,
0.4442311, 0.2107834, 1.96405, 0, 0.0627451, 1, 1,
0.4451925, -0.9234318, 3.542897, 0, 0.05882353, 1, 1,
0.4466768, -0.0205005, 2.303684, 0, 0.05098039, 1, 1,
0.4503146, -0.1193403, 1.64004, 0, 0.04705882, 1, 1,
0.4530451, 0.1507462, 0.689784, 0, 0.03921569, 1, 1,
0.45851, -1.306554, 2.956528, 0, 0.03529412, 1, 1,
0.4639842, 1.542753, 0.8916074, 0, 0.02745098, 1, 1,
0.4658643, -0.960552, 3.795566, 0, 0.02352941, 1, 1,
0.4680666, 3.028905, 0.7548411, 0, 0.01568628, 1, 1,
0.4709033, -0.3303871, 2.119908, 0, 0.01176471, 1, 1,
0.4717939, 0.4166827, -0.9306855, 0, 0.003921569, 1, 1,
0.4723231, -1.215699, 2.10854, 0.003921569, 0, 1, 1,
0.4781034, -1.999128, 2.746482, 0.007843138, 0, 1, 1,
0.4795651, 0.5343195, 1.253393, 0.01568628, 0, 1, 1,
0.4802017, -0.7765316, 3.394078, 0.01960784, 0, 1, 1,
0.4824532, -0.8324137, 1.99606, 0.02745098, 0, 1, 1,
0.4850658, -1.035715, 1.359037, 0.03137255, 0, 1, 1,
0.4858075, -0.6609285, 2.894522, 0.03921569, 0, 1, 1,
0.4863203, -0.4034014, 3.515479, 0.04313726, 0, 1, 1,
0.4875506, -2.450521, 1.972182, 0.05098039, 0, 1, 1,
0.4917832, -1.058782, 2.82502, 0.05490196, 0, 1, 1,
0.4935324, -0.6513596, 0.5226023, 0.0627451, 0, 1, 1,
0.4955413, -0.199437, 2.553452, 0.06666667, 0, 1, 1,
0.4958916, 0.07063138, 0.7876472, 0.07450981, 0, 1, 1,
0.5042917, 0.5679305, 0.2317352, 0.07843138, 0, 1, 1,
0.5087681, -0.4824697, 3.580634, 0.08627451, 0, 1, 1,
0.5098361, -0.4481907, 2.062252, 0.09019608, 0, 1, 1,
0.5113218, -1.203552, 3.722127, 0.09803922, 0, 1, 1,
0.5138841, 1.806052, 1.090309, 0.1058824, 0, 1, 1,
0.5140405, 0.1083251, 1.29594, 0.1098039, 0, 1, 1,
0.5220923, 0.6617227, -1.403105, 0.1176471, 0, 1, 1,
0.5225987, -0.3935466, 2.412454, 0.1215686, 0, 1, 1,
0.523121, -0.3027746, 2.223354, 0.1294118, 0, 1, 1,
0.5241482, -0.1887779, 1.773126, 0.1333333, 0, 1, 1,
0.524532, -1.316803, 2.260352, 0.1411765, 0, 1, 1,
0.5260476, -1.384403, 3.026384, 0.145098, 0, 1, 1,
0.5275557, -0.9962738, 3.330545, 0.1529412, 0, 1, 1,
0.5308668, -0.1617482, 3.31054, 0.1568628, 0, 1, 1,
0.5365548, 1.273188, 0.01923545, 0.1647059, 0, 1, 1,
0.5404646, -1.541185, 3.023955, 0.1686275, 0, 1, 1,
0.5410216, -0.6362245, 4.82228, 0.1764706, 0, 1, 1,
0.541666, -0.5436119, 2.067318, 0.1803922, 0, 1, 1,
0.5419978, -1.953376, 1.322148, 0.1882353, 0, 1, 1,
0.542683, -1.353134, 2.535518, 0.1921569, 0, 1, 1,
0.5456613, 0.1621943, 2.302027, 0.2, 0, 1, 1,
0.5480015, 0.2790079, 2.421957, 0.2078431, 0, 1, 1,
0.5487567, -0.6755385, 2.653756, 0.2117647, 0, 1, 1,
0.5503496, 0.7602791, -0.2551684, 0.2196078, 0, 1, 1,
0.5548053, 0.2828319, 1.128997, 0.2235294, 0, 1, 1,
0.5556553, -0.2028621, 1.970574, 0.2313726, 0, 1, 1,
0.5575645, 1.033362, 1.720621, 0.2352941, 0, 1, 1,
0.5600175, 1.361301, 0.8530385, 0.2431373, 0, 1, 1,
0.5606655, 0.4264426, 2.251748, 0.2470588, 0, 1, 1,
0.5617553, -0.9033394, 0.4296754, 0.254902, 0, 1, 1,
0.5637839, -0.9122407, 1.58577, 0.2588235, 0, 1, 1,
0.5648381, 0.8466334, -0.0878455, 0.2666667, 0, 1, 1,
0.5659651, 1.152254, 3.281503, 0.2705882, 0, 1, 1,
0.5693392, 0.4500892, 1.495717, 0.2784314, 0, 1, 1,
0.5742323, 0.5759864, 1.943199, 0.282353, 0, 1, 1,
0.5815548, -1.167456, 1.774531, 0.2901961, 0, 1, 1,
0.5836973, 0.7565419, 1.261544, 0.2941177, 0, 1, 1,
0.5840633, 0.1290989, 1.624562, 0.3019608, 0, 1, 1,
0.593779, 0.2721126, -0.07642273, 0.3098039, 0, 1, 1,
0.5961, 0.6346001, -0.02420386, 0.3137255, 0, 1, 1,
0.6008235, -2.380192, 3.635101, 0.3215686, 0, 1, 1,
0.6010466, -0.9092546, 3.445217, 0.3254902, 0, 1, 1,
0.6014104, -0.4791405, 1.859486, 0.3333333, 0, 1, 1,
0.6022021, 1.491945, 0.1379981, 0.3372549, 0, 1, 1,
0.6034071, -0.3079388, 2.637956, 0.345098, 0, 1, 1,
0.6109255, 0.9523313, -0.03137618, 0.3490196, 0, 1, 1,
0.6128751, 0.08104502, 1.647128, 0.3568628, 0, 1, 1,
0.6129177, -1.399885, 3.033458, 0.3607843, 0, 1, 1,
0.6136761, -2.048258, 4.315635, 0.3686275, 0, 1, 1,
0.6166592, 0.4044127, 0.6914743, 0.372549, 0, 1, 1,
0.6183311, -0.1438533, 0.5966296, 0.3803922, 0, 1, 1,
0.6186358, -1.368169, 2.444103, 0.3843137, 0, 1, 1,
0.6196223, 1.399619, 2.458887, 0.3921569, 0, 1, 1,
0.623623, -0.8169225, 2.691343, 0.3960784, 0, 1, 1,
0.6241144, 0.04844761, 2.783372, 0.4039216, 0, 1, 1,
0.6258435, 0.2376851, 1.467634, 0.4117647, 0, 1, 1,
0.63043, -1.753863, 0.3220867, 0.4156863, 0, 1, 1,
0.6325441, -0.003532241, 1.476327, 0.4235294, 0, 1, 1,
0.6359516, -2.236804, 1.639668, 0.427451, 0, 1, 1,
0.6426331, -0.9391811, 3.265407, 0.4352941, 0, 1, 1,
0.6443707, 1.341484, -1.421671, 0.4392157, 0, 1, 1,
0.6460745, 0.09948096, -0.002768005, 0.4470588, 0, 1, 1,
0.6472962, -0.3129626, 2.613355, 0.4509804, 0, 1, 1,
0.6510471, -0.8320542, 2.443783, 0.4588235, 0, 1, 1,
0.6512505, -0.6039198, 3.206672, 0.4627451, 0, 1, 1,
0.6552783, 0.9066249, 1.529204, 0.4705882, 0, 1, 1,
0.6563851, -1.064321, 1.957307, 0.4745098, 0, 1, 1,
0.6626715, 0.222776, 1.163811, 0.4823529, 0, 1, 1,
0.6723029, -0.3386892, 2.021948, 0.4862745, 0, 1, 1,
0.6735536, 0.4255792, 1.58856, 0.4941176, 0, 1, 1,
0.6748739, 0.9179078, 0.5268191, 0.5019608, 0, 1, 1,
0.6757032, -0.5049489, 1.650817, 0.5058824, 0, 1, 1,
0.6788172, -0.3897721, 1.141601, 0.5137255, 0, 1, 1,
0.6832601, 0.7255862, -0.5003849, 0.5176471, 0, 1, 1,
0.6874291, 1.819656, -0.05259122, 0.5254902, 0, 1, 1,
0.6877096, -0.02651814, 2.993217, 0.5294118, 0, 1, 1,
0.6930931, -1.267833, 3.083738, 0.5372549, 0, 1, 1,
0.6987585, 0.5729798, 1.063747, 0.5411765, 0, 1, 1,
0.7016151, -1.917262, 4.123675, 0.5490196, 0, 1, 1,
0.7023354, 3.017824, -0.8163216, 0.5529412, 0, 1, 1,
0.7043001, 2.054745, 0.3019721, 0.5607843, 0, 1, 1,
0.7052567, -0.007800653, -0.2914399, 0.5647059, 0, 1, 1,
0.7077925, 0.9069801, -1.308013, 0.572549, 0, 1, 1,
0.7197773, 0.5324581, 2.097164, 0.5764706, 0, 1, 1,
0.7227582, 0.1417614, 2.047613, 0.5843138, 0, 1, 1,
0.7230445, -0.7670531, 5.175273, 0.5882353, 0, 1, 1,
0.7266568, -1.702216, 2.945985, 0.5960785, 0, 1, 1,
0.7286236, -1.988518, 3.252229, 0.6039216, 0, 1, 1,
0.7343552, 0.3858793, 1.616819, 0.6078432, 0, 1, 1,
0.7394453, -0.3253253, 0.5648516, 0.6156863, 0, 1, 1,
0.7409306, 0.7703349, 3.036704, 0.6196079, 0, 1, 1,
0.7412472, 1.064571, 1.297754, 0.627451, 0, 1, 1,
0.742895, 0.1514005, 1.739691, 0.6313726, 0, 1, 1,
0.7429325, 0.2452779, 0.1572423, 0.6392157, 0, 1, 1,
0.7487802, 0.03839921, 1.609138, 0.6431373, 0, 1, 1,
0.7489188, -0.6837681, 1.162656, 0.6509804, 0, 1, 1,
0.7520229, 0.8452284, 1.199642, 0.654902, 0, 1, 1,
0.7586295, -0.3055433, 2.072609, 0.6627451, 0, 1, 1,
0.763477, 0.01532074, -0.7125496, 0.6666667, 0, 1, 1,
0.7678185, 0.02282237, 1.755879, 0.6745098, 0, 1, 1,
0.768724, -0.2514744, 2.072555, 0.6784314, 0, 1, 1,
0.7701483, 2.056417, -0.2391448, 0.6862745, 0, 1, 1,
0.7720349, -0.6958011, 1.982466, 0.6901961, 0, 1, 1,
0.7753257, -0.4553093, 1.7516, 0.6980392, 0, 1, 1,
0.7767978, 1.481918, 1.075017, 0.7058824, 0, 1, 1,
0.7768908, 0.5069294, 1.433456, 0.7098039, 0, 1, 1,
0.7833813, 0.4014446, 1.523753, 0.7176471, 0, 1, 1,
0.7855724, 0.391633, 0.624676, 0.7215686, 0, 1, 1,
0.7893484, -0.4653334, 1.738415, 0.7294118, 0, 1, 1,
0.7961243, -0.1171369, 0.2998464, 0.7333333, 0, 1, 1,
0.8032014, -2.134337, 2.54956, 0.7411765, 0, 1, 1,
0.8034629, 1.939994, -0.2471957, 0.7450981, 0, 1, 1,
0.8045655, 0.4950203, 3.624102, 0.7529412, 0, 1, 1,
0.8090752, 0.522323, 1.327665, 0.7568628, 0, 1, 1,
0.815717, 0.04817737, 2.013857, 0.7647059, 0, 1, 1,
0.8260227, 2.667419, 1.642757, 0.7686275, 0, 1, 1,
0.8262019, 0.4425522, -0.1236227, 0.7764706, 0, 1, 1,
0.8337244, -0.04560156, 2.128521, 0.7803922, 0, 1, 1,
0.8343278, -1.070564, 3.479409, 0.7882353, 0, 1, 1,
0.8369586, 2.104683, -0.2791685, 0.7921569, 0, 1, 1,
0.8388331, -0.01218243, 1.937515, 0.8, 0, 1, 1,
0.846588, -0.7391059, 1.832507, 0.8078431, 0, 1, 1,
0.8475921, 1.724968, -0.3050497, 0.8117647, 0, 1, 1,
0.8546243, 0.05152542, 2.865022, 0.8196079, 0, 1, 1,
0.8574432, -0.2350581, 1.200447, 0.8235294, 0, 1, 1,
0.8581651, -0.3818668, 2.008532, 0.8313726, 0, 1, 1,
0.8586864, -0.9254894, 2.801359, 0.8352941, 0, 1, 1,
0.8638684, 0.6708316, -0.6085207, 0.8431373, 0, 1, 1,
0.8641145, 1.140819, 0.01376217, 0.8470588, 0, 1, 1,
0.8696973, 0.41047, 0.2860414, 0.854902, 0, 1, 1,
0.8728814, -0.06711208, 1.035082, 0.8588235, 0, 1, 1,
0.8828425, 0.9146502, 2.35962, 0.8666667, 0, 1, 1,
0.8886462, 1.478637, 0.1750463, 0.8705882, 0, 1, 1,
0.8940958, -0.8284338, 0.633293, 0.8784314, 0, 1, 1,
0.9066811, 0.3847716, 1.689357, 0.8823529, 0, 1, 1,
0.914572, -0.3360162, 1.135315, 0.8901961, 0, 1, 1,
0.9195341, -0.3716797, 1.711941, 0.8941177, 0, 1, 1,
0.9269344, 1.676834, -0.9989927, 0.9019608, 0, 1, 1,
0.9308819, 0.9656377, 1.484423, 0.9098039, 0, 1, 1,
0.9312057, -0.486823, -0.08966269, 0.9137255, 0, 1, 1,
0.9352822, -0.3565828, 3.377373, 0.9215686, 0, 1, 1,
0.9398172, 0.4355049, 0.5297589, 0.9254902, 0, 1, 1,
0.9408207, -2.347493, 4.830799, 0.9333333, 0, 1, 1,
0.9408805, -0.3496605, 2.836868, 0.9372549, 0, 1, 1,
0.9430986, -1.808838, 2.490605, 0.945098, 0, 1, 1,
0.954339, -0.379796, 1.681745, 0.9490196, 0, 1, 1,
0.9554629, 1.163524, 0.878737, 0.9568627, 0, 1, 1,
0.9569393, -1.071959, 0.9459028, 0.9607843, 0, 1, 1,
0.9572214, 0.4619151, 2.025937, 0.9686275, 0, 1, 1,
0.9620321, -0.7448552, 3.446517, 0.972549, 0, 1, 1,
0.9662942, -1.978176, 3.248588, 0.9803922, 0, 1, 1,
0.9751783, 0.7272215, 0.1477502, 0.9843137, 0, 1, 1,
0.9791225, -0.6276829, 2.791283, 0.9921569, 0, 1, 1,
0.9842466, -0.2182678, 3.339824, 0.9960784, 0, 1, 1,
0.9890602, -1.644955, 2.216573, 1, 0, 0.9960784, 1,
0.9965901, -2.200622, 2.568551, 1, 0, 0.9882353, 1,
0.9978318, -0.4238365, 0.5312105, 1, 0, 0.9843137, 1,
1.000706, -0.7010172, 1.705181, 1, 0, 0.9764706, 1,
1.005127, 0.01104407, 3.310395, 1, 0, 0.972549, 1,
1.008807, 0.267566, 2.31739, 1, 0, 0.9647059, 1,
1.011044, 1.436782, -0.09664163, 1, 0, 0.9607843, 1,
1.014148, -0.6774616, 0.8150013, 1, 0, 0.9529412, 1,
1.02376, -0.09641255, 0.9447974, 1, 0, 0.9490196, 1,
1.025837, -0.9555532, 2.200626, 1, 0, 0.9411765, 1,
1.034306, 0.3100659, 2.202096, 1, 0, 0.9372549, 1,
1.038126, -0.2715297, 2.198154, 1, 0, 0.9294118, 1,
1.044619, -0.4652477, 1.001914, 1, 0, 0.9254902, 1,
1.049403, -0.640534, 2.892946, 1, 0, 0.9176471, 1,
1.05523, 0.7773374, 1.320864, 1, 0, 0.9137255, 1,
1.058899, 1.85033, 2.308478, 1, 0, 0.9058824, 1,
1.059, 0.8627167, 1.302657, 1, 0, 0.9019608, 1,
1.068828, 0.6973949, 0.159721, 1, 0, 0.8941177, 1,
1.071851, 1.982913, 0.03967813, 1, 0, 0.8862745, 1,
1.072205, -1.293402, 2.221371, 1, 0, 0.8823529, 1,
1.079033, -1.140413, 2.048392, 1, 0, 0.8745098, 1,
1.081689, -0.2883109, 1.073931, 1, 0, 0.8705882, 1,
1.087096, -0.9950508, 2.945579, 1, 0, 0.8627451, 1,
1.087874, 0.1028644, 2.519249, 1, 0, 0.8588235, 1,
1.091006, -0.2404291, 4.041319, 1, 0, 0.8509804, 1,
1.093095, -2.34272, 3.447086, 1, 0, 0.8470588, 1,
1.093716, 1.500083, -1.488225, 1, 0, 0.8392157, 1,
1.101763, 2.345304, -1.11101, 1, 0, 0.8352941, 1,
1.104307, 1.644119, 3.345082, 1, 0, 0.827451, 1,
1.111597, -0.8602359, 1.290048, 1, 0, 0.8235294, 1,
1.1154, -1.135423, 4.58205, 1, 0, 0.8156863, 1,
1.119009, -1.49171, 3.485776, 1, 0, 0.8117647, 1,
1.120474, -0.095955, 0.8610358, 1, 0, 0.8039216, 1,
1.121463, -0.8746149, 1.526931, 1, 0, 0.7960784, 1,
1.128708, 1.89646, 2.160316, 1, 0, 0.7921569, 1,
1.139894, 0.2960693, 2.730456, 1, 0, 0.7843137, 1,
1.141562, -1.187227, 2.077646, 1, 0, 0.7803922, 1,
1.142405, -0.6458253, 2.569826, 1, 0, 0.772549, 1,
1.155474, 1.487339, 2.350574, 1, 0, 0.7686275, 1,
1.167627, 0.3156451, 1.363432, 1, 0, 0.7607843, 1,
1.181231, -0.03555898, 1.965073, 1, 0, 0.7568628, 1,
1.183077, 0.165852, 2.6163, 1, 0, 0.7490196, 1,
1.194397, 0.445848, 0.2197104, 1, 0, 0.7450981, 1,
1.197078, 1.470186, 2.599355, 1, 0, 0.7372549, 1,
1.199406, 1.26436, 2.402842, 1, 0, 0.7333333, 1,
1.212392, 0.8484369, 1.34379, 1, 0, 0.7254902, 1,
1.212999, 1.970463, 0.3408596, 1, 0, 0.7215686, 1,
1.21979, -0.08457876, 2.161552, 1, 0, 0.7137255, 1,
1.228189, -0.2294373, 3.052658, 1, 0, 0.7098039, 1,
1.230669, 1.452993, 0.3398049, 1, 0, 0.7019608, 1,
1.230886, -0.2043564, 1.910817, 1, 0, 0.6941177, 1,
1.239445, 0.8716124, -0.1223794, 1, 0, 0.6901961, 1,
1.241905, 1.422314, -0.4077499, 1, 0, 0.682353, 1,
1.243433, 0.2258677, 1.406337, 1, 0, 0.6784314, 1,
1.244791, 0.6213155, 0.5642717, 1, 0, 0.6705883, 1,
1.251742, -0.5532104, 0.3419397, 1, 0, 0.6666667, 1,
1.251881, 1.53731, 1.415115, 1, 0, 0.6588235, 1,
1.262407, 0.2996752, 1.823991, 1, 0, 0.654902, 1,
1.267039, 0.09077962, 2.436198, 1, 0, 0.6470588, 1,
1.267102, -0.8716601, 1.51696, 1, 0, 0.6431373, 1,
1.27492, 0.4869256, 0.4335006, 1, 0, 0.6352941, 1,
1.281174, -0.5755165, 3.417832, 1, 0, 0.6313726, 1,
1.285311, 0.6677204, 0.9462097, 1, 0, 0.6235294, 1,
1.288556, -1.300355, 3.509507, 1, 0, 0.6196079, 1,
1.291581, 0.6185952, 1.61807, 1, 0, 0.6117647, 1,
1.294502, 1.96177, 1.029927, 1, 0, 0.6078432, 1,
1.303748, -0.3724753, 0.5995986, 1, 0, 0.6, 1,
1.310514, -0.1370906, 0.8378388, 1, 0, 0.5921569, 1,
1.319761, 2.168167, 1.143021, 1, 0, 0.5882353, 1,
1.324354, -0.5083847, 2.857697, 1, 0, 0.5803922, 1,
1.33138, -1.090004, 2.954105, 1, 0, 0.5764706, 1,
1.33206, 0.4144391, 1.445306, 1, 0, 0.5686275, 1,
1.34332, 1.297201, 1.289007, 1, 0, 0.5647059, 1,
1.362228, 0.6923816, 1.129326, 1, 0, 0.5568628, 1,
1.370703, 0.836156, 2.916404, 1, 0, 0.5529412, 1,
1.372472, -0.162957, 1.22993, 1, 0, 0.5450981, 1,
1.38209, 0.2310065, 1.704803, 1, 0, 0.5411765, 1,
1.385128, -0.3494737, 0.8200797, 1, 0, 0.5333334, 1,
1.386801, -0.3265319, 3.039335, 1, 0, 0.5294118, 1,
1.387675, -0.3588545, 2.504154, 1, 0, 0.5215687, 1,
1.389804, 0.1559301, 2.293391, 1, 0, 0.5176471, 1,
1.403001, 1.414138, 2.490374, 1, 0, 0.509804, 1,
1.407874, -0.6946033, 2.388607, 1, 0, 0.5058824, 1,
1.413942, 0.3896751, 1.092362, 1, 0, 0.4980392, 1,
1.416305, -0.9452152, 3.346804, 1, 0, 0.4901961, 1,
1.432879, -0.4409263, 1.794993, 1, 0, 0.4862745, 1,
1.440446, 0.1984037, -0.499548, 1, 0, 0.4784314, 1,
1.451661, -0.009935446, 1.904191, 1, 0, 0.4745098, 1,
1.453242, 0.2569129, 0.5784566, 1, 0, 0.4666667, 1,
1.462332, 1.789357, 0.7060995, 1, 0, 0.4627451, 1,
1.463551, -1.177436, 3.224701, 1, 0, 0.454902, 1,
1.476098, -0.1367246, 0.8912081, 1, 0, 0.4509804, 1,
1.487806, -0.46406, 2.497605, 1, 0, 0.4431373, 1,
1.495644, 0.9821767, 0.6117149, 1, 0, 0.4392157, 1,
1.503941, -1.969976, 3.71544, 1, 0, 0.4313726, 1,
1.504377, 0.1315854, -0.6791849, 1, 0, 0.427451, 1,
1.505868, 1.788261, 0.5488547, 1, 0, 0.4196078, 1,
1.508388, -0.123161, 1.165484, 1, 0, 0.4156863, 1,
1.50886, -1.442385, 2.67128, 1, 0, 0.4078431, 1,
1.519546, -1.392693, 1.931671, 1, 0, 0.4039216, 1,
1.519916, -0.2227821, 1.915483, 1, 0, 0.3960784, 1,
1.528496, -0.7180611, 0.3192706, 1, 0, 0.3882353, 1,
1.538815, -0.1870869, 1.179171, 1, 0, 0.3843137, 1,
1.54301, 0.1465468, 1.338576, 1, 0, 0.3764706, 1,
1.547224, -1.03561, 2.792416, 1, 0, 0.372549, 1,
1.560461, -1.459027, 2.815825, 1, 0, 0.3647059, 1,
1.564102, 1.911604, 1.061391, 1, 0, 0.3607843, 1,
1.587508, 0.0276764, -0.2420849, 1, 0, 0.3529412, 1,
1.590227, 0.3554278, 1.509596, 1, 0, 0.3490196, 1,
1.592688, 0.989077, -0.2491042, 1, 0, 0.3411765, 1,
1.599833, 0.9431517, 1.880629, 1, 0, 0.3372549, 1,
1.615683, 1.022427, -0.04680973, 1, 0, 0.3294118, 1,
1.629987, 0.7738538, 1.394377, 1, 0, 0.3254902, 1,
1.63012, 0.1929612, 1.267073, 1, 0, 0.3176471, 1,
1.631629, 0.7096795, 1.667496, 1, 0, 0.3137255, 1,
1.645138, -1.731342, 2.710351, 1, 0, 0.3058824, 1,
1.67207, -2.075895e-06, 2.009202, 1, 0, 0.2980392, 1,
1.685368, 0.01814997, 3.443456, 1, 0, 0.2941177, 1,
1.704266, -0.9980252, 1.752524, 1, 0, 0.2862745, 1,
1.719214, 0.6949005, -0.06781394, 1, 0, 0.282353, 1,
1.719832, -1.066415, 0.2174036, 1, 0, 0.2745098, 1,
1.721316, 1.518337, 0.7725104, 1, 0, 0.2705882, 1,
1.73516, -0.8580282, 2.059492, 1, 0, 0.2627451, 1,
1.742154, -0.6992225, 2.667934, 1, 0, 0.2588235, 1,
1.751017, -0.6419686, 1.767202, 1, 0, 0.2509804, 1,
1.753603, 0.1444103, 0.9424796, 1, 0, 0.2470588, 1,
1.76168, 0.3106886, 3.508914, 1, 0, 0.2392157, 1,
1.762221, -0.07447417, 0.6501486, 1, 0, 0.2352941, 1,
1.766857, -1.884688, 1.793124, 1, 0, 0.227451, 1,
1.771894, 1.310641, 0.7806619, 1, 0, 0.2235294, 1,
1.775414, 1.152458, 1.038707, 1, 0, 0.2156863, 1,
1.776288, 0.3789943, -0.1680959, 1, 0, 0.2117647, 1,
1.778483, 0.840089, -1.601216, 1, 0, 0.2039216, 1,
1.788727, -0.3579619, 3.567396, 1, 0, 0.1960784, 1,
1.802134, -0.9591267, 2.378379, 1, 0, 0.1921569, 1,
1.807095, -2.380607, 4.128147, 1, 0, 0.1843137, 1,
1.825077, -1.224418, 1.703298, 1, 0, 0.1803922, 1,
1.834123, -1.857791, 4.333958, 1, 0, 0.172549, 1,
1.834722, 0.03859621, 0.9910095, 1, 0, 0.1686275, 1,
1.880841, -0.0172573, 2.036351, 1, 0, 0.1607843, 1,
1.889669, -0.1306888, 2.273759, 1, 0, 0.1568628, 1,
1.91558, -0.5512078, 0.05479941, 1, 0, 0.1490196, 1,
1.917454, -1.376117, 0.5034292, 1, 0, 0.145098, 1,
1.923475, 2.000472, 0.05113108, 1, 0, 0.1372549, 1,
1.923732, 0.07367565, -1.721867, 1, 0, 0.1333333, 1,
1.923892, 0.3457485, 2.023138, 1, 0, 0.1254902, 1,
1.963682, -0.4288062, 0.987034, 1, 0, 0.1215686, 1,
1.966739, -0.1378602, 2.363381, 1, 0, 0.1137255, 1,
2.001257, -0.9671438, 1.199607, 1, 0, 0.1098039, 1,
2.024523, 0.8602565, 1.663022, 1, 0, 0.1019608, 1,
2.032026, -0.04535695, 0.7989235, 1, 0, 0.09411765, 1,
2.035679, -0.1498198, 3.123446, 1, 0, 0.09019608, 1,
2.036079, 0.5751355, 2.132313, 1, 0, 0.08235294, 1,
2.080134, 1.008369, -2.060769, 1, 0, 0.07843138, 1,
2.0903, 0.5432967, 3.066493, 1, 0, 0.07058824, 1,
2.136414, -0.3195041, 1.842284, 1, 0, 0.06666667, 1,
2.137667, -0.4661882, 1.602648, 1, 0, 0.05882353, 1,
2.188846, 1.976436, 1.049845, 1, 0, 0.05490196, 1,
2.366539, -1.68218, 2.212568, 1, 0, 0.04705882, 1,
2.417103, 0.7079554, -0.394606, 1, 0, 0.04313726, 1,
2.481119, 1.625039, -0.5354458, 1, 0, 0.03529412, 1,
2.562609, -1.053881, 0.9352086, 1, 0, 0.03137255, 1,
2.770097, 1.973593, 2.674473, 1, 0, 0.02352941, 1,
2.79799, 2.534742, -0.2327297, 1, 0, 0.01960784, 1,
3.016406, -0.3066409, 0.85685, 1, 0, 0.01176471, 1,
4.353132, 0.3008762, 1.085901, 1, 0, 0.007843138, 1
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
0.5388284, -3.958133, -8.117764, 0, -0.5, 0.5, 0.5,
0.5388284, -3.958133, -8.117764, 1, -0.5, 0.5, 0.5,
0.5388284, -3.958133, -8.117764, 1, 1.5, 0.5, 0.5,
0.5388284, -3.958133, -8.117764, 0, 1.5, 0.5, 0.5
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
-4.568524, 0.04171491, -8.117764, 0, -0.5, 0.5, 0.5,
-4.568524, 0.04171491, -8.117764, 1, -0.5, 0.5, 0.5,
-4.568524, 0.04171491, -8.117764, 1, 1.5, 0.5, 0.5,
-4.568524, 0.04171491, -8.117764, 0, 1.5, 0.5, 0.5
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
-4.568524, -3.958133, -0.5079408, 0, -0.5, 0.5, 0.5,
-4.568524, -3.958133, -0.5079408, 1, -0.5, 0.5, 0.5,
-4.568524, -3.958133, -0.5079408, 1, 1.5, 0.5, 0.5,
-4.568524, -3.958133, -0.5079408, 0, 1.5, 0.5, 0.5
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
-2, -3.035091, -6.361651,
4, -3.035091, -6.361651,
-2, -3.035091, -6.361651,
-2, -3.188931, -6.654337,
0, -3.035091, -6.361651,
0, -3.188931, -6.654337,
2, -3.035091, -6.361651,
2, -3.188931, -6.654337,
4, -3.035091, -6.361651,
4, -3.188931, -6.654337
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
"2",
"4"
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
-2, -3.496612, -7.239708, 0, -0.5, 0.5, 0.5,
-2, -3.496612, -7.239708, 1, -0.5, 0.5, 0.5,
-2, -3.496612, -7.239708, 1, 1.5, 0.5, 0.5,
-2, -3.496612, -7.239708, 0, 1.5, 0.5, 0.5,
0, -3.496612, -7.239708, 0, -0.5, 0.5, 0.5,
0, -3.496612, -7.239708, 1, -0.5, 0.5, 0.5,
0, -3.496612, -7.239708, 1, 1.5, 0.5, 0.5,
0, -3.496612, -7.239708, 0, 1.5, 0.5, 0.5,
2, -3.496612, -7.239708, 0, -0.5, 0.5, 0.5,
2, -3.496612, -7.239708, 1, -0.5, 0.5, 0.5,
2, -3.496612, -7.239708, 1, 1.5, 0.5, 0.5,
2, -3.496612, -7.239708, 0, 1.5, 0.5, 0.5,
4, -3.496612, -7.239708, 0, -0.5, 0.5, 0.5,
4, -3.496612, -7.239708, 1, -0.5, 0.5, 0.5,
4, -3.496612, -7.239708, 1, 1.5, 0.5, 0.5,
4, -3.496612, -7.239708, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-3.389904, -2, -6.361651,
-3.389904, 3, -6.361651,
-3.389904, -2, -6.361651,
-3.586341, -2, -6.654337,
-3.389904, -1, -6.361651,
-3.586341, -1, -6.654337,
-3.389904, 0, -6.361651,
-3.586341, 0, -6.654337,
-3.389904, 1, -6.361651,
-3.586341, 1, -6.654337,
-3.389904, 2, -6.361651,
-3.586341, 2, -6.654337,
-3.389904, 3, -6.361651,
-3.586341, 3, -6.654337
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
-3.979214, -2, -7.239708, 0, -0.5, 0.5, 0.5,
-3.979214, -2, -7.239708, 1, -0.5, 0.5, 0.5,
-3.979214, -2, -7.239708, 1, 1.5, 0.5, 0.5,
-3.979214, -2, -7.239708, 0, 1.5, 0.5, 0.5,
-3.979214, -1, -7.239708, 0, -0.5, 0.5, 0.5,
-3.979214, -1, -7.239708, 1, -0.5, 0.5, 0.5,
-3.979214, -1, -7.239708, 1, 1.5, 0.5, 0.5,
-3.979214, -1, -7.239708, 0, 1.5, 0.5, 0.5,
-3.979214, 0, -7.239708, 0, -0.5, 0.5, 0.5,
-3.979214, 0, -7.239708, 1, -0.5, 0.5, 0.5,
-3.979214, 0, -7.239708, 1, 1.5, 0.5, 0.5,
-3.979214, 0, -7.239708, 0, 1.5, 0.5, 0.5,
-3.979214, 1, -7.239708, 0, -0.5, 0.5, 0.5,
-3.979214, 1, -7.239708, 1, -0.5, 0.5, 0.5,
-3.979214, 1, -7.239708, 1, 1.5, 0.5, 0.5,
-3.979214, 1, -7.239708, 0, 1.5, 0.5, 0.5,
-3.979214, 2, -7.239708, 0, -0.5, 0.5, 0.5,
-3.979214, 2, -7.239708, 1, -0.5, 0.5, 0.5,
-3.979214, 2, -7.239708, 1, 1.5, 0.5, 0.5,
-3.979214, 2, -7.239708, 0, 1.5, 0.5, 0.5,
-3.979214, 3, -7.239708, 0, -0.5, 0.5, 0.5,
-3.979214, 3, -7.239708, 1, -0.5, 0.5, 0.5,
-3.979214, 3, -7.239708, 1, 1.5, 0.5, 0.5,
-3.979214, 3, -7.239708, 0, 1.5, 0.5, 0.5
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
-3.389904, -3.035091, -6,
-3.389904, -3.035091, 4,
-3.389904, -3.035091, -6,
-3.586341, -3.188931, -6,
-3.389904, -3.035091, -4,
-3.586341, -3.188931, -4,
-3.389904, -3.035091, -2,
-3.586341, -3.188931, -2,
-3.389904, -3.035091, 0,
-3.586341, -3.188931, 0,
-3.389904, -3.035091, 2,
-3.586341, -3.188931, 2,
-3.389904, -3.035091, 4,
-3.586341, -3.188931, 4
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
-3.979214, -3.496612, -6, 0, -0.5, 0.5, 0.5,
-3.979214, -3.496612, -6, 1, -0.5, 0.5, 0.5,
-3.979214, -3.496612, -6, 1, 1.5, 0.5, 0.5,
-3.979214, -3.496612, -6, 0, 1.5, 0.5, 0.5,
-3.979214, -3.496612, -4, 0, -0.5, 0.5, 0.5,
-3.979214, -3.496612, -4, 1, -0.5, 0.5, 0.5,
-3.979214, -3.496612, -4, 1, 1.5, 0.5, 0.5,
-3.979214, -3.496612, -4, 0, 1.5, 0.5, 0.5,
-3.979214, -3.496612, -2, 0, -0.5, 0.5, 0.5,
-3.979214, -3.496612, -2, 1, -0.5, 0.5, 0.5,
-3.979214, -3.496612, -2, 1, 1.5, 0.5, 0.5,
-3.979214, -3.496612, -2, 0, 1.5, 0.5, 0.5,
-3.979214, -3.496612, 0, 0, -0.5, 0.5, 0.5,
-3.979214, -3.496612, 0, 1, -0.5, 0.5, 0.5,
-3.979214, -3.496612, 0, 1, 1.5, 0.5, 0.5,
-3.979214, -3.496612, 0, 0, 1.5, 0.5, 0.5,
-3.979214, -3.496612, 2, 0, -0.5, 0.5, 0.5,
-3.979214, -3.496612, 2, 1, -0.5, 0.5, 0.5,
-3.979214, -3.496612, 2, 1, 1.5, 0.5, 0.5,
-3.979214, -3.496612, 2, 0, 1.5, 0.5, 0.5,
-3.979214, -3.496612, 4, 0, -0.5, 0.5, 0.5,
-3.979214, -3.496612, 4, 1, -0.5, 0.5, 0.5,
-3.979214, -3.496612, 4, 1, 1.5, 0.5, 0.5,
-3.979214, -3.496612, 4, 0, 1.5, 0.5, 0.5
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
-3.389904, -3.035091, -6.361651,
-3.389904, 3.118521, -6.361651,
-3.389904, -3.035091, 5.34577,
-3.389904, 3.118521, 5.34577,
-3.389904, -3.035091, -6.361651,
-3.389904, -3.035091, 5.34577,
-3.389904, 3.118521, -6.361651,
-3.389904, 3.118521, 5.34577,
-3.389904, -3.035091, -6.361651,
4.467561, -3.035091, -6.361651,
-3.389904, -3.035091, 5.34577,
4.467561, -3.035091, 5.34577,
-3.389904, 3.118521, -6.361651,
4.467561, 3.118521, -6.361651,
-3.389904, 3.118521, 5.34577,
4.467561, 3.118521, 5.34577,
4.467561, -3.035091, -6.361651,
4.467561, 3.118521, -6.361651,
4.467561, -3.035091, 5.34577,
4.467561, 3.118521, 5.34577,
4.467561, -3.035091, -6.361651,
4.467561, -3.035091, 5.34577,
4.467561, 3.118521, -6.361651,
4.467561, 3.118521, 5.34577
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
var radius = 8.214808;
var distance = 36.54861;
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
mvMatrix.translate( -0.5388284, -0.04171491, 0.5079408 );
mvMatrix.scale( 1.130391, 1.443382, 0.7586651 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.54861);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
ronnel<-read.table("ronnel.xyz")
```

```
## Error in read.table("ronnel.xyz"): no lines available in input
```

```r
x<-ronnel$V2
```

```
## Error in eval(expr, envir, enclos): object 'ronnel' not found
```

```r
y<-ronnel$V3
```

```
## Error in eval(expr, envir, enclos): object 'ronnel' not found
```

```r
z<-ronnel$V4
```

```
## Error in eval(expr, envir, enclos): object 'ronnel' not found
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
-3.275475, 0.9355066, 0.217274, 0, 0, 1, 1, 1,
-3.168893, -0.8608308, -3.209041, 1, 0, 0, 1, 1,
-2.866904, -1.039388, -1.476001, 1, 0, 0, 1, 1,
-2.706573, 0.7142456, -1.278611, 1, 0, 0, 1, 1,
-2.699277, -0.3332475, -1.451015, 1, 0, 0, 1, 1,
-2.529541, -1.340787, -1.960994, 1, 0, 0, 1, 1,
-2.517914, -0.4812226, -0.032938, 0, 0, 0, 1, 1,
-2.44045, -1.871394, -4.258991, 0, 0, 0, 1, 1,
-2.405131, 0.6771249, -2.303127, 0, 0, 0, 1, 1,
-2.390758, 0.6691815, -1.496616, 0, 0, 0, 1, 1,
-2.377578, 0.02916251, -1.5454, 0, 0, 0, 1, 1,
-2.357547, -1.025409, -2.297682, 0, 0, 0, 1, 1,
-2.330853, 0.5084739, -1.443424, 0, 0, 0, 1, 1,
-2.244416, -0.3187055, -0.2898683, 1, 1, 1, 1, 1,
-2.224791, -0.2542607, -2.799078, 1, 1, 1, 1, 1,
-2.186376, -0.09493572, -3.343973, 1, 1, 1, 1, 1,
-2.167106, -1.347648, -1.042206, 1, 1, 1, 1, 1,
-2.109456, -0.6977913, -1.634372, 1, 1, 1, 1, 1,
-2.108754, -0.8227474, -1.846629, 1, 1, 1, 1, 1,
-2.088433, 0.1028827, -0.4664111, 1, 1, 1, 1, 1,
-2.049576, 0.6642325, -1.968022, 1, 1, 1, 1, 1,
-2.023744, -0.7055843, -0.9887125, 1, 1, 1, 1, 1,
-2.023554, 0.3404278, -0.07842553, 1, 1, 1, 1, 1,
-1.977299, -0.1933788, -0.9262102, 1, 1, 1, 1, 1,
-1.960526, 2.362215, -0.4191589, 1, 1, 1, 1, 1,
-1.939702, -0.4790908, -2.372725, 1, 1, 1, 1, 1,
-1.939542, -1.029248, -0.3443125, 1, 1, 1, 1, 1,
-1.91478, -1.370284, -2.000348, 1, 1, 1, 1, 1,
-1.911287, -0.6932009, -3.516973, 0, 0, 1, 1, 1,
-1.899507, -0.5946847, -2.208668, 1, 0, 0, 1, 1,
-1.883949, 0.909065, -0.9305303, 1, 0, 0, 1, 1,
-1.876729, 1.498564, 0.8707918, 1, 0, 0, 1, 1,
-1.870477, 1.179435, -2.209529, 1, 0, 0, 1, 1,
-1.86738, -0.3423352, -1.217194, 1, 0, 0, 1, 1,
-1.833721, 0.5990338, -1.563891, 0, 0, 0, 1, 1,
-1.812609, 0.568231, 0.7640954, 0, 0, 0, 1, 1,
-1.799177, 1.258556, 0.4287056, 0, 0, 0, 1, 1,
-1.778073, 0.4006678, -1.150336, 0, 0, 0, 1, 1,
-1.729253, -2.325233, -3.836862, 0, 0, 0, 1, 1,
-1.719719, -0.1386867, -3.419986, 0, 0, 0, 1, 1,
-1.71397, -0.1656777, -3.277177, 0, 0, 0, 1, 1,
-1.709857, 2.025818, -0.3301358, 1, 1, 1, 1, 1,
-1.691242, -0.7148489, -2.874008, 1, 1, 1, 1, 1,
-1.682498, -0.643757, -3.218287, 1, 1, 1, 1, 1,
-1.682438, 0.8229029, -1.101677, 1, 1, 1, 1, 1,
-1.675504, 0.9754168, -0.4674412, 1, 1, 1, 1, 1,
-1.668329, 0.7750484, -2.098915, 1, 1, 1, 1, 1,
-1.648968, -0.3316284, -1.140046, 1, 1, 1, 1, 1,
-1.609444, 0.3099743, -1.689691, 1, 1, 1, 1, 1,
-1.5943, -0.2229806, -1.756085, 1, 1, 1, 1, 1,
-1.584525, -1.247721, -2.455617, 1, 1, 1, 1, 1,
-1.573938, -0.7470757, -0.7735238, 1, 1, 1, 1, 1,
-1.573537, -0.6565065, -0.9790828, 1, 1, 1, 1, 1,
-1.538528, 1.254504, -0.3110381, 1, 1, 1, 1, 1,
-1.536586, -1.229047, -0.2695096, 1, 1, 1, 1, 1,
-1.528387, -1.388538, -2.79109, 1, 1, 1, 1, 1,
-1.525041, -1.848076, -3.08934, 0, 0, 1, 1, 1,
-1.521785, -0.7915561, -1.513959, 1, 0, 0, 1, 1,
-1.518784, 1.011818, -1.657323, 1, 0, 0, 1, 1,
-1.505107, 0.1817629, -1.422899, 1, 0, 0, 1, 1,
-1.501307, -1.345687, -2.74676, 1, 0, 0, 1, 1,
-1.49747, 1.320926, -1.940277, 1, 0, 0, 1, 1,
-1.472953, 1.573188, 0.2155219, 0, 0, 0, 1, 1,
-1.465586, 0.2284229, -1.934143, 0, 0, 0, 1, 1,
-1.463907, 0.2383241, 0.4463237, 0, 0, 0, 1, 1,
-1.455862, -0.3911495, -3.175069, 0, 0, 0, 1, 1,
-1.452953, 1.398146, -1.497507, 0, 0, 0, 1, 1,
-1.451487, 1.23075, 0.4279253, 0, 0, 0, 1, 1,
-1.427256, -0.821252, -1.582134, 0, 0, 0, 1, 1,
-1.425564, -1.224631, -1.750543, 1, 1, 1, 1, 1,
-1.425173, -2.195638, -3.115527, 1, 1, 1, 1, 1,
-1.42168, 0.2118761, -2.106865, 1, 1, 1, 1, 1,
-1.412574, 1.608058, -0.2165943, 1, 1, 1, 1, 1,
-1.409351, 1.362851, 0.232824, 1, 1, 1, 1, 1,
-1.406689, -0.7612632, -2.000401, 1, 1, 1, 1, 1,
-1.401154, -0.1093747, -3.394506, 1, 1, 1, 1, 1,
-1.39729, -0.03858978, -1.896735, 1, 1, 1, 1, 1,
-1.394181, -0.1986249, -1.669398, 1, 1, 1, 1, 1,
-1.391023, 0.3330485, -2.407095, 1, 1, 1, 1, 1,
-1.377751, -1.473066, -2.322882, 1, 1, 1, 1, 1,
-1.37476, -0.5059516, -1.998212, 1, 1, 1, 1, 1,
-1.370483, 0.5523951, -0.9906999, 1, 1, 1, 1, 1,
-1.369164, -0.9661769, -2.86435, 1, 1, 1, 1, 1,
-1.365831, -0.8245154, -1.858335, 1, 1, 1, 1, 1,
-1.365685, -0.4286537, -2.955836, 0, 0, 1, 1, 1,
-1.357958, 1.644236, 0.2874749, 1, 0, 0, 1, 1,
-1.354526, -0.6447045, -1.832672, 1, 0, 0, 1, 1,
-1.348184, 0.3111044, -1.033914, 1, 0, 0, 1, 1,
-1.342115, 0.7409683, -1.812854, 1, 0, 0, 1, 1,
-1.339026, -0.3120566, -1.186483, 1, 0, 0, 1, 1,
-1.32627, 0.1195286, -0.7036041, 0, 0, 0, 1, 1,
-1.3246, -0.05510177, -1.584002, 0, 0, 0, 1, 1,
-1.317943, -0.1905259, -1.371915, 0, 0, 0, 1, 1,
-1.316113, -0.3576774, -2.309265, 0, 0, 0, 1, 1,
-1.309462, -0.03837173, -2.25559, 0, 0, 0, 1, 1,
-1.30666, 0.08467779, -1.038204, 0, 0, 0, 1, 1,
-1.303496, 0.8451089, -1.536675, 0, 0, 0, 1, 1,
-1.300447, -1.537041, -3.097707, 1, 1, 1, 1, 1,
-1.287705, -0.8762999, -1.782914, 1, 1, 1, 1, 1,
-1.284706, -0.1044596, -2.774031, 1, 1, 1, 1, 1,
-1.283686, 0.7204754, -1.405119, 1, 1, 1, 1, 1,
-1.276958, 0.8697262, -1.043732, 1, 1, 1, 1, 1,
-1.276144, 0.1059547, -1.485492, 1, 1, 1, 1, 1,
-1.273941, 0.9854922, -0.4923163, 1, 1, 1, 1, 1,
-1.265277, 0.1457563, -3.00958, 1, 1, 1, 1, 1,
-1.257979, 0.3614638, -2.121375, 1, 1, 1, 1, 1,
-1.255555, -0.234032, -1.920928, 1, 1, 1, 1, 1,
-1.250453, 1.219779, -1.631289, 1, 1, 1, 1, 1,
-1.247103, -0.2948869, -2.800384, 1, 1, 1, 1, 1,
-1.231079, -0.1973628, -1.345519, 1, 1, 1, 1, 1,
-1.229536, -0.5836531, -1.641, 1, 1, 1, 1, 1,
-1.221815, 0.9505463, -1.934305, 1, 1, 1, 1, 1,
-1.220194, 1.736672, 0.673215, 0, 0, 1, 1, 1,
-1.214659, -0.7815354, -1.568049, 1, 0, 0, 1, 1,
-1.196422, -1.139274, -1.566947, 1, 0, 0, 1, 1,
-1.195954, 0.01308288, 0.1444782, 1, 0, 0, 1, 1,
-1.193432, -0.9359735, -4.210721, 1, 0, 0, 1, 1,
-1.182185, 0.04126213, -0.2911163, 1, 0, 0, 1, 1,
-1.181336, -2.773104e-05, -0.7671233, 0, 0, 0, 1, 1,
-1.179006, 0.1405612, -2.891092, 0, 0, 0, 1, 1,
-1.177463, -0.6140084, -1.153951, 0, 0, 0, 1, 1,
-1.168511, -0.7094899, -2.055972, 0, 0, 0, 1, 1,
-1.158155, -1.290422, -2.241733, 0, 0, 0, 1, 1,
-1.156414, 0.437802, 0.6137352, 0, 0, 0, 1, 1,
-1.154556, 0.4038648, 0.1230553, 0, 0, 0, 1, 1,
-1.1502, -1.263224, -1.128709, 1, 1, 1, 1, 1,
-1.147594, -0.7324376, -1.950773, 1, 1, 1, 1, 1,
-1.14413, 0.8786034, -2.786046, 1, 1, 1, 1, 1,
-1.140624, -1.073972, -1.377474, 1, 1, 1, 1, 1,
-1.139865, 1.642675, -4.702823, 1, 1, 1, 1, 1,
-1.130229, 1.196219, -0.6703472, 1, 1, 1, 1, 1,
-1.124916, -0.3466544, -1.030459, 1, 1, 1, 1, 1,
-1.120435, 0.6880441, -0.7515309, 1, 1, 1, 1, 1,
-1.11998, 1.288352, 0.2039885, 1, 1, 1, 1, 1,
-1.119942, -0.4561254, -1.841203, 1, 1, 1, 1, 1,
-1.119004, 0.9478117, -1.57526, 1, 1, 1, 1, 1,
-1.111921, -0.5686219, -4.325616, 1, 1, 1, 1, 1,
-1.11067, 0.6257507, -2.547286, 1, 1, 1, 1, 1,
-1.107293, 0.306592, -2.113715, 1, 1, 1, 1, 1,
-1.104608, -0.4446075, -1.844776, 1, 1, 1, 1, 1,
-1.102452, -0.5421268, -1.953683, 0, 0, 1, 1, 1,
-1.09529, 0.8996871, 0.3384979, 1, 0, 0, 1, 1,
-1.09356, 1.012794, -1.210615, 1, 0, 0, 1, 1,
-1.083413, 2.470886, -0.2791477, 1, 0, 0, 1, 1,
-1.076876, 0.3072196, -2.753312, 1, 0, 0, 1, 1,
-1.074741, -0.2849442, -0.7129269, 1, 0, 0, 1, 1,
-1.074725, 1.147955, -1.359019, 0, 0, 0, 1, 1,
-1.07446, -0.7131675, -0.6139011, 0, 0, 0, 1, 1,
-1.073278, -0.1751425, -1.949648, 0, 0, 0, 1, 1,
-1.072572, -0.8980724, -1.551484, 0, 0, 0, 1, 1,
-1.07231, 1.186888, 0.8111192, 0, 0, 0, 1, 1,
-1.071625, -0.2702525, -2.117691, 0, 0, 0, 1, 1,
-1.071452, 0.5987434, -2.831913, 0, 0, 0, 1, 1,
-1.069242, -1.576202, -2.170118, 1, 1, 1, 1, 1,
-1.0539, -1.266974, -2.221059, 1, 1, 1, 1, 1,
-1.050918, 0.797231, -1.891608, 1, 1, 1, 1, 1,
-1.038352, -0.2082759, 0.2037734, 1, 1, 1, 1, 1,
-1.024996, 1.350531, -2.881601, 1, 1, 1, 1, 1,
-1.019606, 0.2624484, -0.294069, 1, 1, 1, 1, 1,
-1.017865, 0.7243721, -0.7078741, 1, 1, 1, 1, 1,
-1.017346, -1.237344, -2.419984, 1, 1, 1, 1, 1,
-1.007194, -0.6525614, -3.843355, 1, 1, 1, 1, 1,
-1.000946, -1.775902, -2.88658, 1, 1, 1, 1, 1,
-0.9964578, -1.023342, -1.986081, 1, 1, 1, 1, 1,
-0.9918412, -0.1243656, -2.435558, 1, 1, 1, 1, 1,
-0.9909703, 1.157964, 0.08221582, 1, 1, 1, 1, 1,
-0.9870742, -1.480453, -1.807491, 1, 1, 1, 1, 1,
-0.985137, 0.2662394, -0.9195001, 1, 1, 1, 1, 1,
-0.9844839, -0.8788273, -2.400361, 0, 0, 1, 1, 1,
-0.9807577, 0.9687291, -0.06223897, 1, 0, 0, 1, 1,
-0.9803622, 0.1717183, -1.814134, 1, 0, 0, 1, 1,
-0.9751776, -0.567127, -3.401757, 1, 0, 0, 1, 1,
-0.9702613, -0.6355444, -1.429159, 1, 0, 0, 1, 1,
-0.9693295, -0.05145193, -1.497017, 1, 0, 0, 1, 1,
-0.9642909, 1.048915, -3.18846, 0, 0, 0, 1, 1,
-0.9623002, 0.800984, -1.655793, 0, 0, 0, 1, 1,
-0.956904, -0.4814888, -2.17587, 0, 0, 0, 1, 1,
-0.956384, -1.031035, -3.708062, 0, 0, 0, 1, 1,
-0.9543138, 2.099616, 1.33176, 0, 0, 0, 1, 1,
-0.9535512, -0.6664518, -2.22379, 0, 0, 0, 1, 1,
-0.9526101, -0.9866207, -3.781813, 0, 0, 0, 1, 1,
-0.9437206, -2.165076, -1.972519, 1, 1, 1, 1, 1,
-0.9312832, -1.996174, -3.488889, 1, 1, 1, 1, 1,
-0.9285802, -1.23937, -2.876472, 1, 1, 1, 1, 1,
-0.9284211, -0.9425221, -1.47883, 1, 1, 1, 1, 1,
-0.9274526, -2.267628, -2.899091, 1, 1, 1, 1, 1,
-0.9255055, 0.1347402, -0.655884, 1, 1, 1, 1, 1,
-0.9253192, -0.1395581, -1.338413, 1, 1, 1, 1, 1,
-0.9229509, 0.9081597, 0.2722882, 1, 1, 1, 1, 1,
-0.9202251, -0.7669553, -2.840028, 1, 1, 1, 1, 1,
-0.9154613, -0.459326, -3.540532, 1, 1, 1, 1, 1,
-0.9153613, -0.4521904, -2.267029, 1, 1, 1, 1, 1,
-0.9150813, -0.9894354, -3.12708, 1, 1, 1, 1, 1,
-0.9114628, -0.2863565, -1.928168, 1, 1, 1, 1, 1,
-0.9069616, 0.3989746, -1.554246, 1, 1, 1, 1, 1,
-0.9069326, -0.3575696, -0.8988726, 1, 1, 1, 1, 1,
-0.9068278, -1.240868, -4.617299, 0, 0, 1, 1, 1,
-0.9038168, 0.8372206, -1.173188, 1, 0, 0, 1, 1,
-0.9031035, -0.9247068, -1.522163, 1, 0, 0, 1, 1,
-0.8940152, -0.7191087, -0.8444967, 1, 0, 0, 1, 1,
-0.8938492, -1.042439, -2.460243, 1, 0, 0, 1, 1,
-0.8893311, -0.2229812, 0.09498657, 1, 0, 0, 1, 1,
-0.8843468, -0.1329238, -2.946243, 0, 0, 0, 1, 1,
-0.8842147, 0.8710003, -0.382546, 0, 0, 0, 1, 1,
-0.882835, 0.537302, -0.836129, 0, 0, 0, 1, 1,
-0.8789906, 1.043964, -0.2873004, 0, 0, 0, 1, 1,
-0.875217, 0.0445806, 0.6667477, 0, 0, 0, 1, 1,
-0.8722023, -0.8080917, -3.830401, 0, 0, 0, 1, 1,
-0.8711323, 0.2967188, 0.4332554, 0, 0, 0, 1, 1,
-0.8688473, 1.529146, -1.93541, 1, 1, 1, 1, 1,
-0.8686348, 0.154823, 0.6029199, 1, 1, 1, 1, 1,
-0.8675752, 0.3514719, -0.1717902, 1, 1, 1, 1, 1,
-0.8673757, -0.2486052, -1.181527, 1, 1, 1, 1, 1,
-0.867012, 1.768406, -0.6433415, 1, 1, 1, 1, 1,
-0.8640178, -0.388663, -3.056348, 1, 1, 1, 1, 1,
-0.8580288, 0.1981813, -1.174053, 1, 1, 1, 1, 1,
-0.8520613, -1.569542, -2.371065, 1, 1, 1, 1, 1,
-0.849752, -1.68855, -3.278157, 1, 1, 1, 1, 1,
-0.8464673, 1.124519, -0.0004962126, 1, 1, 1, 1, 1,
-0.8456665, 0.3682012, -0.7675523, 1, 1, 1, 1, 1,
-0.845062, -0.9668967, -1.733459, 1, 1, 1, 1, 1,
-0.8428565, -0.3429367, -1.107253, 1, 1, 1, 1, 1,
-0.8382264, -2.167533, -2.062446, 1, 1, 1, 1, 1,
-0.8360507, 0.3512208, -2.760614, 1, 1, 1, 1, 1,
-0.8358754, 0.7990013, -3.087434, 0, 0, 1, 1, 1,
-0.8314917, -0.08729503, -0.07255959, 1, 0, 0, 1, 1,
-0.829116, -0.2185627, -1.050183, 1, 0, 0, 1, 1,
-0.8289127, 0.1426522, -1.653184, 1, 0, 0, 1, 1,
-0.8195451, 0.2969992, -0.7676392, 1, 0, 0, 1, 1,
-0.8180665, -0.07038826, -0.974831, 1, 0, 0, 1, 1,
-0.8150139, -0.6221742, -2.262874, 0, 0, 0, 1, 1,
-0.8146769, 0.4637544, -2.824537, 0, 0, 0, 1, 1,
-0.8145255, -1.685427, -3.389469, 0, 0, 0, 1, 1,
-0.8123691, -0.8867922, -2.81263, 0, 0, 0, 1, 1,
-0.8119988, -1.668237, -2.530395, 0, 0, 0, 1, 1,
-0.8092862, 1.037778, -0.6403341, 0, 0, 0, 1, 1,
-0.8067905, -0.9892565, -2.619501, 0, 0, 0, 1, 1,
-0.8030258, -0.7875315, -1.7714, 1, 1, 1, 1, 1,
-0.8002942, 0.801738, -1.422774, 1, 1, 1, 1, 1,
-0.8001587, 1.53338, 1.743269, 1, 1, 1, 1, 1,
-0.7963016, -1.132884, -2.706396, 1, 1, 1, 1, 1,
-0.7928388, -0.7836562, -2.554236, 1, 1, 1, 1, 1,
-0.7925687, -0.7313113, -3.129024, 1, 1, 1, 1, 1,
-0.7900952, 0.5113988, -0.8610594, 1, 1, 1, 1, 1,
-0.7838996, 0.5247717, -1.456052, 1, 1, 1, 1, 1,
-0.7791879, -0.1918838, -3.688706, 1, 1, 1, 1, 1,
-0.7699586, 0.008143025, -1.066669, 1, 1, 1, 1, 1,
-0.7626702, -0.5036529, -3.48585, 1, 1, 1, 1, 1,
-0.7622086, -2.420238, -2.963549, 1, 1, 1, 1, 1,
-0.760102, 0.1708803, -2.016361, 1, 1, 1, 1, 1,
-0.7598439, 1.249609, -1.827284, 1, 1, 1, 1, 1,
-0.7596001, 0.7123944, -0.9295912, 1, 1, 1, 1, 1,
-0.7563179, 0.6655178, -0.1201912, 0, 0, 1, 1, 1,
-0.7560621, -0.0263912, -0.9378537, 1, 0, 0, 1, 1,
-0.7521214, -1.401325, -1.480794, 1, 0, 0, 1, 1,
-0.7466736, 0.6693945, -0.6519043, 1, 0, 0, 1, 1,
-0.7454023, -0.3436687, -0.8960567, 1, 0, 0, 1, 1,
-0.7410595, 0.7348558, -1.418416, 1, 0, 0, 1, 1,
-0.738784, -1.096825, -3.465041, 0, 0, 0, 1, 1,
-0.7387409, -0.1071964, -1.20655, 0, 0, 0, 1, 1,
-0.7306315, -2.685618, -1.703125, 0, 0, 0, 1, 1,
-0.7162027, 1.100719, 0.4470825, 0, 0, 0, 1, 1,
-0.7128625, 0.2828125, -2.26796, 0, 0, 0, 1, 1,
-0.7112052, 0.8065125, -1.597829, 0, 0, 0, 1, 1,
-0.6994543, -0.109161, -1.746599, 0, 0, 0, 1, 1,
-0.6991642, -0.5365051, -1.84857, 1, 1, 1, 1, 1,
-0.6946514, -1.029432, -2.835643, 1, 1, 1, 1, 1,
-0.6945384, 0.552259, -0.970773, 1, 1, 1, 1, 1,
-0.6922603, -1.4981, -1.885263, 1, 1, 1, 1, 1,
-0.6854706, 0.6558372, -1.071, 1, 1, 1, 1, 1,
-0.6831749, -0.7086231, -2.216458, 1, 1, 1, 1, 1,
-0.6824135, 1.173636, -2.76009, 1, 1, 1, 1, 1,
-0.6809886, -0.8285429, -0.7112476, 1, 1, 1, 1, 1,
-0.6706778, 1.560343, -1.870794, 1, 1, 1, 1, 1,
-0.6633557, -0.3632873, -0.0670763, 1, 1, 1, 1, 1,
-0.6495032, 0.3260813, -0.9950939, 1, 1, 1, 1, 1,
-0.6494201, 0.8525087, -0.09443937, 1, 1, 1, 1, 1,
-0.6398478, -1.106433, -1.538794, 1, 1, 1, 1, 1,
-0.6316822, 0.728306, 0.02606896, 1, 1, 1, 1, 1,
-0.6312828, -1.88248, -3.855683, 1, 1, 1, 1, 1,
-0.6310032, -0.7376882, -1.817521, 0, 0, 1, 1, 1,
-0.6264513, 0.2209753, -1.205217, 1, 0, 0, 1, 1,
-0.6224483, -0.5341505, -2.556593, 1, 0, 0, 1, 1,
-0.6205727, 0.1437619, -3.311582, 1, 0, 0, 1, 1,
-0.6175516, 0.6484676, -1.506752, 1, 0, 0, 1, 1,
-0.6169981, 1.095314, 0.39902, 1, 0, 0, 1, 1,
-0.6135625, -1.642155, -3.792163, 0, 0, 0, 1, 1,
-0.6131365, -0.08197998, -1.728327, 0, 0, 0, 1, 1,
-0.6093816, 1.26811, -0.4038174, 0, 0, 0, 1, 1,
-0.6091744, 0.6423472, -2.155602, 0, 0, 0, 1, 1,
-0.5982531, 0.1043455, 0.08234795, 0, 0, 0, 1, 1,
-0.5941774, 0.06466486, 0.6963778, 0, 0, 0, 1, 1,
-0.5923957, -2.374434, -2.427778, 0, 0, 0, 1, 1,
-0.588466, -1.962167, -2.452892, 1, 1, 1, 1, 1,
-0.5867863, -1.23708, -1.752323, 1, 1, 1, 1, 1,
-0.5823978, 0.8544253, 0.1878652, 1, 1, 1, 1, 1,
-0.5822195, 0.9140819, -0.346365, 1, 1, 1, 1, 1,
-0.5753392, 1.162049, -0.916434, 1, 1, 1, 1, 1,
-0.5750833, -1.70604, -3.626164, 1, 1, 1, 1, 1,
-0.5706075, 2.97669, -1.015438, 1, 1, 1, 1, 1,
-0.5705028, 2.501032, -1.807494, 1, 1, 1, 1, 1,
-0.5687315, 0.6897564, 2.082839, 1, 1, 1, 1, 1,
-0.5612198, -1.481367, -3.486589, 1, 1, 1, 1, 1,
-0.5545444, 0.09780882, -1.383523, 1, 1, 1, 1, 1,
-0.5504574, 0.3502214, -1.784958, 1, 1, 1, 1, 1,
-0.5474515, -0.8265437, 0.005906213, 1, 1, 1, 1, 1,
-0.5464578, 1.01264, -1.625824, 1, 1, 1, 1, 1,
-0.5458263, 0.1297844, -0.9647071, 1, 1, 1, 1, 1,
-0.545528, -1.185138, -1.737042, 0, 0, 1, 1, 1,
-0.5432865, 0.2252237, -1.74176, 1, 0, 0, 1, 1,
-0.537887, 0.1306735, -2.269739, 1, 0, 0, 1, 1,
-0.5365769, -0.3888957, -1.984979, 1, 0, 0, 1, 1,
-0.5329459, -0.5838358, -1.469676, 1, 0, 0, 1, 1,
-0.5243596, -1.317791, -3.898191, 1, 0, 0, 1, 1,
-0.520562, -0.556586, -1.816453, 0, 0, 0, 1, 1,
-0.5168751, -2.291363, -2.902537, 0, 0, 0, 1, 1,
-0.5154445, 0.5820491, -1.470489, 0, 0, 0, 1, 1,
-0.5117927, 0.1313991, -0.2168292, 0, 0, 0, 1, 1,
-0.5080566, -1.64337, -2.741482, 0, 0, 0, 1, 1,
-0.4997711, -1.535661, -0.7343073, 0, 0, 0, 1, 1,
-0.4991669, -1.39725, -3.309948, 0, 0, 0, 1, 1,
-0.4989171, -0.01443563, -1.566416, 1, 1, 1, 1, 1,
-0.4948266, 0.3769647, -0.05286861, 1, 1, 1, 1, 1,
-0.4937914, 1.073201, -0.808807, 1, 1, 1, 1, 1,
-0.4924349, 0.9313013, -0.4365361, 1, 1, 1, 1, 1,
-0.4873332, -0.8764842, -4.056271, 1, 1, 1, 1, 1,
-0.4843549, -0.06652401, -0.3940616, 1, 1, 1, 1, 1,
-0.4829133, -0.7713215, -3.573287, 1, 1, 1, 1, 1,
-0.4799318, 1.150545, -0.5210522, 1, 1, 1, 1, 1,
-0.470636, -1.024845, -1.095475, 1, 1, 1, 1, 1,
-0.4700506, -1.09896, -2.2035, 1, 1, 1, 1, 1,
-0.4688091, 0.2601134, -0.09178099, 1, 1, 1, 1, 1,
-0.465396, -0.9816132, -2.918269, 1, 1, 1, 1, 1,
-0.4643114, -1.404555, -2.05008, 1, 1, 1, 1, 1,
-0.4605169, 0.1239379, -1.785059, 1, 1, 1, 1, 1,
-0.4598423, -1.247159, -2.008926, 1, 1, 1, 1, 1,
-0.4590485, -0.1423619, -1.434492, 0, 0, 1, 1, 1,
-0.4428131, -0.7930729, -3.322305, 1, 0, 0, 1, 1,
-0.442771, 0.2178717, -0.02693201, 1, 0, 0, 1, 1,
-0.4412863, -1.169553, -2.921067, 1, 0, 0, 1, 1,
-0.4412661, -0.2983051, -2.455022, 1, 0, 0, 1, 1,
-0.4364133, -1.533176, -2.890819, 1, 0, 0, 1, 1,
-0.4351997, -0.2634288, -2.657434, 0, 0, 0, 1, 1,
-0.4282816, -0.5791799, -3.209272, 0, 0, 0, 1, 1,
-0.4274242, 1.131586, 0.3848064, 0, 0, 0, 1, 1,
-0.4265511, -1.088275, -4.389241, 0, 0, 0, 1, 1,
-0.4240966, 1.209475, -0.471686, 0, 0, 0, 1, 1,
-0.4236752, 0.3544719, -1.671902, 0, 0, 0, 1, 1,
-0.4225674, 0.402832, -1.340349, 0, 0, 0, 1, 1,
-0.4196598, 0.1670918, -3.076378, 1, 1, 1, 1, 1,
-0.4180002, -1.263152, -1.127429, 1, 1, 1, 1, 1,
-0.4160594, 0.8255538, -0.1825501, 1, 1, 1, 1, 1,
-0.4143729, 0.8138959, -2.118483, 1, 1, 1, 1, 1,
-0.4137284, 0.1425579, -1.675845, 1, 1, 1, 1, 1,
-0.4124285, -1.173609, -3.153038, 1, 1, 1, 1, 1,
-0.4064378, 1.158905, 0.07257911, 1, 1, 1, 1, 1,
-0.39887, -2.430898, -2.528212, 1, 1, 1, 1, 1,
-0.3987051, 1.845112, 0.8513368, 1, 1, 1, 1, 1,
-0.3972079, 0.2046038, -0.7038841, 1, 1, 1, 1, 1,
-0.3950621, -0.5305033, -4.429031, 1, 1, 1, 1, 1,
-0.3945913, -0.03511899, -1.507467, 1, 1, 1, 1, 1,
-0.3893768, -0.8153641, -3.210119, 1, 1, 1, 1, 1,
-0.3889137, -0.869823, -2.051018, 1, 1, 1, 1, 1,
-0.3820129, 1.445196, -2.149752, 1, 1, 1, 1, 1,
-0.3807212, 1.694597, 1.779575, 0, 0, 1, 1, 1,
-0.3798407, 2.196594, -0.391934, 1, 0, 0, 1, 1,
-0.378114, 0.7217802, -1.012658, 1, 0, 0, 1, 1,
-0.3775726, -1.194081, -2.368304, 1, 0, 0, 1, 1,
-0.3774057, 1.877916, -0.4065798, 1, 0, 0, 1, 1,
-0.3752286, 0.3095504, -1.34548, 1, 0, 0, 1, 1,
-0.3739868, -0.9738584, -1.679691, 0, 0, 0, 1, 1,
-0.3667943, 0.4170861, -1.17775, 0, 0, 0, 1, 1,
-0.364541, 0.977995, 0.507667, 0, 0, 0, 1, 1,
-0.3631208, 0.6483968, -0.204772, 0, 0, 0, 1, 1,
-0.3604775, 0.6520348, -2.263151, 0, 0, 0, 1, 1,
-0.3583501, 1.878619, -0.02878247, 0, 0, 0, 1, 1,
-0.3576211, 0.8708326, 0.1731383, 0, 0, 0, 1, 1,
-0.3458636, -0.2489349, -2.062093, 1, 1, 1, 1, 1,
-0.3430946, 0.4634905, -0.9206936, 1, 1, 1, 1, 1,
-0.3410124, -0.07474373, -2.869056, 1, 1, 1, 1, 1,
-0.3390802, 0.1207294, -1.852652, 1, 1, 1, 1, 1,
-0.3390269, 0.410014, 0.1818655, 1, 1, 1, 1, 1,
-0.3350483, -0.5669473, -3.33283, 1, 1, 1, 1, 1,
-0.3340405, -1.660039, -3.817116, 1, 1, 1, 1, 1,
-0.3321012, 1.092663, -0.9750493, 1, 1, 1, 1, 1,
-0.3298285, 0.6143413, 0.332652, 1, 1, 1, 1, 1,
-0.3296838, 0.5178758, -0.1811158, 1, 1, 1, 1, 1,
-0.3271745, 1.358466, 1.613476, 1, 1, 1, 1, 1,
-0.3263435, -1.152513, -2.154452, 1, 1, 1, 1, 1,
-0.324342, -1.077322, -3.736772, 1, 1, 1, 1, 1,
-0.3224669, -0.1621255, -4.028096, 1, 1, 1, 1, 1,
-0.3167876, 1.261549, 0.3427952, 1, 1, 1, 1, 1,
-0.3103262, 0.3100848, -1.464217, 0, 0, 1, 1, 1,
-0.30605, 0.7566305, -0.9566653, 1, 0, 0, 1, 1,
-0.3035058, -0.03329314, -1.018801, 1, 0, 0, 1, 1,
-0.3008384, 0.9917786, 0.2023831, 1, 0, 0, 1, 1,
-0.2991929, 0.6149163, 0.1490729, 1, 0, 0, 1, 1,
-0.2973118, 0.6917875, -1.743374, 1, 0, 0, 1, 1,
-0.2937386, -0.0413597, -0.3776432, 0, 0, 0, 1, 1,
-0.2930371, 0.5590662, 0.03723381, 0, 0, 0, 1, 1,
-0.2894368, -1.965504, -2.443023, 0, 0, 0, 1, 1,
-0.2888048, -1.996564, -3.322522, 0, 0, 0, 1, 1,
-0.2829975, -0.7041937, -4.828991, 0, 0, 0, 1, 1,
-0.2819715, 0.3167694, -2.157619, 0, 0, 0, 1, 1,
-0.2719002, 0.8180254, -1.123878, 0, 0, 0, 1, 1,
-0.2702806, 0.3076678, -0.9474794, 1, 1, 1, 1, 1,
-0.2571755, -1.779446, -2.210441, 1, 1, 1, 1, 1,
-0.2547492, -0.9957331, -3.929314, 1, 1, 1, 1, 1,
-0.2535482, -0.4336409, -2.254339, 1, 1, 1, 1, 1,
-0.2509121, -1.784814, -0.8626198, 1, 1, 1, 1, 1,
-0.2476884, -1.086025, -3.088698, 1, 1, 1, 1, 1,
-0.2475127, 1.691919, -1.636445, 1, 1, 1, 1, 1,
-0.245296, -1.55875, -2.507516, 1, 1, 1, 1, 1,
-0.2430139, 1.080252, -1.203314, 1, 1, 1, 1, 1,
-0.2423957, 1.856259, 1.567044, 1, 1, 1, 1, 1,
-0.2412378, 0.4644611, -1.184272, 1, 1, 1, 1, 1,
-0.2409338, -0.0425167, -1.717267, 1, 1, 1, 1, 1,
-0.2385745, -1.257041, -3.088071, 1, 1, 1, 1, 1,
-0.2365191, -0.9652848, -2.83998, 1, 1, 1, 1, 1,
-0.2363427, -0.7863249, -2.066867, 1, 1, 1, 1, 1,
-0.2282522, 1.351571, 1.748275, 0, 0, 1, 1, 1,
-0.2241808, -0.0274667, -2.8463, 1, 0, 0, 1, 1,
-0.2235128, -0.4949377, -3.938026, 1, 0, 0, 1, 1,
-0.222398, 0.007062763, -1.650617, 1, 0, 0, 1, 1,
-0.2131186, 1.173843, 0.127461, 1, 0, 0, 1, 1,
-0.2116775, 0.02038634, -2.774467, 1, 0, 0, 1, 1,
-0.207157, -0.06833728, 0.3301177, 0, 0, 0, 1, 1,
-0.2060334, -1.916836, -3.724099, 0, 0, 0, 1, 1,
-0.203085, 1.439166, 1.518385, 0, 0, 0, 1, 1,
-0.2013432, -0.08973517, -3.205191, 0, 0, 0, 1, 1,
-0.2009678, 0.2901905, -2.14905, 0, 0, 0, 1, 1,
-0.1988519, 0.4692966, 0.3102902, 0, 0, 0, 1, 1,
-0.1975316, 0.5818948, -0.06708577, 0, 0, 0, 1, 1,
-0.1949951, -0.9857512, -2.542199, 1, 1, 1, 1, 1,
-0.1938129, -1.61048, -3.812155, 1, 1, 1, 1, 1,
-0.1924231, 2.227332, -0.3635039, 1, 1, 1, 1, 1,
-0.190806, -1.635379, -3.970605, 1, 1, 1, 1, 1,
-0.1850029, -1.535777, -1.496207, 1, 1, 1, 1, 1,
-0.1840944, -0.8641185, -2.207541, 1, 1, 1, 1, 1,
-0.1822692, -0.02624332, -1.646527, 1, 1, 1, 1, 1,
-0.1803892, -1.085105, -3.404469, 1, 1, 1, 1, 1,
-0.1760179, -0.2131262, -2.544767, 1, 1, 1, 1, 1,
-0.1744033, -0.9422681, -4.068816, 1, 1, 1, 1, 1,
-0.1715798, -0.5514556, -2.688531, 1, 1, 1, 1, 1,
-0.1670223, 0.1943765, -0.9069783, 1, 1, 1, 1, 1,
-0.1550318, -0.6033386, -3.366793, 1, 1, 1, 1, 1,
-0.152424, 0.4344842, 0.6749009, 1, 1, 1, 1, 1,
-0.146596, 0.336126, 0.8079857, 1, 1, 1, 1, 1,
-0.145444, -0.2502303, -2.844459, 0, 0, 1, 1, 1,
-0.1447459, 0.4044515, -0.4922411, 1, 0, 0, 1, 1,
-0.1431735, -0.7792645, -0.7429569, 1, 0, 0, 1, 1,
-0.1412014, -0.3374526, -2.220542, 1, 0, 0, 1, 1,
-0.1409869, -0.3297867, -3.894807, 1, 0, 0, 1, 1,
-0.1405677, 1.168875, -0.2008613, 1, 0, 0, 1, 1,
-0.1363309, -0.7353278, -3.42378, 0, 0, 0, 1, 1,
-0.1357903, 1.13393, 0.1253667, 0, 0, 0, 1, 1,
-0.1347519, -0.2191182, -1.99855, 0, 0, 0, 1, 1,
-0.1332052, 0.1492035, -1.222563, 0, 0, 0, 1, 1,
-0.1329001, -0.8401385, -1.489111, 0, 0, 0, 1, 1,
-0.1295531, 0.7280804, 0.9185391, 0, 0, 0, 1, 1,
-0.1267048, 1.438143, 1.344111, 0, 0, 0, 1, 1,
-0.1255522, -0.4011135, -2.895714, 1, 1, 1, 1, 1,
-0.1231785, -0.243725, -2.928898, 1, 1, 1, 1, 1,
-0.1190999, -0.02848201, -0.9314594, 1, 1, 1, 1, 1,
-0.1189562, -1.449873, -3.815836, 1, 1, 1, 1, 1,
-0.1174759, -0.033521, -1.473985, 1, 1, 1, 1, 1,
-0.1151048, 0.5163236, 0.3328538, 1, 1, 1, 1, 1,
-0.1142135, 0.1911942, -0.6745144, 1, 1, 1, 1, 1,
-0.1111015, 1.088294, 0.6641124, 1, 1, 1, 1, 1,
-0.1067156, 0.7050285, -1.089726, 1, 1, 1, 1, 1,
-0.1000756, 1.877308, 0.09044708, 1, 1, 1, 1, 1,
-0.09928117, -0.7028406, -1.634429, 1, 1, 1, 1, 1,
-0.09770187, -0.5329453, -1.880223, 1, 1, 1, 1, 1,
-0.08790198, 0.6392866, 0.3271427, 1, 1, 1, 1, 1,
-0.08564491, 0.4612094, -1.336754, 1, 1, 1, 1, 1,
-0.08518163, -0.0671633, -3.519119, 1, 1, 1, 1, 1,
-0.0849629, -1.642255, -3.258515, 0, 0, 1, 1, 1,
-0.07003599, 0.3903712, 0.1528582, 1, 0, 0, 1, 1,
-0.06979834, 1.563811, 0.6199902, 1, 0, 0, 1, 1,
-0.06048232, 0.5208418, -0.06620815, 1, 0, 0, 1, 1,
-0.05987016, -0.1178298, -3.198315, 1, 0, 0, 1, 1,
-0.05940037, 0.2583974, 0.4871053, 1, 0, 0, 1, 1,
-0.05896951, 0.5259944, 0.0137204, 0, 0, 0, 1, 1,
-0.05893872, 0.00309121, -0.2937203, 0, 0, 0, 1, 1,
-0.0588361, 1.604414, -0.7608131, 0, 0, 0, 1, 1,
-0.05735029, 1.013342, -0.3425339, 0, 0, 0, 1, 1,
-0.05693414, 1.206972, -0.9684877, 0, 0, 0, 1, 1,
-0.05579567, -1.160836, -2.131948, 0, 0, 0, 1, 1,
-0.05095439, 0.2008424, 1.56991, 0, 0, 0, 1, 1,
-0.04297324, -0.4117982, -6.191155, 1, 1, 1, 1, 1,
-0.03751206, -0.5832968, -3.83814, 1, 1, 1, 1, 1,
-0.02884528, 0.1151037, -0.9773968, 1, 1, 1, 1, 1,
-0.02782023, 1.562985, -0.2768348, 1, 1, 1, 1, 1,
-0.02511166, 1.280699, 0.2990444, 1, 1, 1, 1, 1,
-0.02240171, -2.045676, -2.088676, 1, 1, 1, 1, 1,
-0.0180282, -1.512295, -2.071151, 1, 1, 1, 1, 1,
-0.01606818, -0.5304815, -2.387626, 1, 1, 1, 1, 1,
-0.008640201, 1.089969, 0.7697431, 1, 1, 1, 1, 1,
-0.002306601, -1.541695, -3.289384, 1, 1, 1, 1, 1,
0.001136554, -0.8694918, 3.48784, 1, 1, 1, 1, 1,
0.003260353, -0.8372111, 1.329287, 1, 1, 1, 1, 1,
0.003484134, 0.1431412, 1.349193, 1, 1, 1, 1, 1,
0.007862492, -0.07098905, 3.31194, 1, 1, 1, 1, 1,
0.00933751, 0.8287126, -1.16714, 1, 1, 1, 1, 1,
0.01261935, -0.860958, 3.445189, 0, 0, 1, 1, 1,
0.01319237, 1.837245, 1.228663, 1, 0, 0, 1, 1,
0.01843632, 0.5076001, 0.05847662, 1, 0, 0, 1, 1,
0.02328952, 0.1265407, 2.034769, 1, 0, 0, 1, 1,
0.02332909, 0.3633796, 0.6817428, 1, 0, 0, 1, 1,
0.02691454, -0.941075, 2.070814, 1, 0, 0, 1, 1,
0.02836657, 0.7042638, -1.446532, 0, 0, 0, 1, 1,
0.02837435, 0.6297863, -0.4596889, 0, 0, 0, 1, 1,
0.0309743, 0.327227, 1.36587, 0, 0, 0, 1, 1,
0.03145516, 1.465344, -1.818726, 0, 0, 0, 1, 1,
0.03372493, -0.8563289, 2.115536, 0, 0, 0, 1, 1,
0.03552223, -0.07937694, 2.71792, 0, 0, 0, 1, 1,
0.03735588, 0.2747563, -0.2823993, 0, 0, 0, 1, 1,
0.03823613, 2.201643, 0.3285782, 1, 1, 1, 1, 1,
0.04741891, -0.02190891, 2.49327, 1, 1, 1, 1, 1,
0.04881774, 0.2332692, 0.4296591, 1, 1, 1, 1, 1,
0.04906025, 0.6632127, 0.5416789, 1, 1, 1, 1, 1,
0.04940093, 0.9679862, 0.5666921, 1, 1, 1, 1, 1,
0.04941522, 0.7299741, -1.133767, 1, 1, 1, 1, 1,
0.04988984, -0.5049551, 3.350694, 1, 1, 1, 1, 1,
0.04992384, -1.33863, 3.003619, 1, 1, 1, 1, 1,
0.05168028, -0.1774808, 4.362139, 1, 1, 1, 1, 1,
0.06069592, 2.261581, 0.1151177, 1, 1, 1, 1, 1,
0.06135377, -0.6296769, 2.030827, 1, 1, 1, 1, 1,
0.06265081, -0.009334954, 1.607118, 1, 1, 1, 1, 1,
0.06733269, -0.3207816, 1.073075, 1, 1, 1, 1, 1,
0.06822263, 1.28856, 0.7414898, 1, 1, 1, 1, 1,
0.07003015, 0.5075526, 0.412201, 1, 1, 1, 1, 1,
0.07425755, 0.4878638, 1.793285, 0, 0, 1, 1, 1,
0.07467691, -1.310645, 2.04886, 1, 0, 0, 1, 1,
0.07530063, -0.4991021, 2.203512, 1, 0, 0, 1, 1,
0.08666664, 0.1919725, 0.7640738, 1, 0, 0, 1, 1,
0.08773527, 0.6092167, -0.8447893, 1, 0, 0, 1, 1,
0.08840512, -0.02188307, 1.718422, 1, 0, 0, 1, 1,
0.0895084, -0.1051966, -0.3474705, 0, 0, 0, 1, 1,
0.0925426, -0.7514296, 3.700848, 0, 0, 0, 1, 1,
0.09550335, -0.3245847, 2.703055, 0, 0, 0, 1, 1,
0.09871302, 0.04192646, -0.05855361, 0, 0, 0, 1, 1,
0.1000052, -0.3205021, 2.288378, 0, 0, 0, 1, 1,
0.1083948, -0.6486374, 3.597581, 0, 0, 0, 1, 1,
0.1087335, -0.6794134, 4.887817, 0, 0, 0, 1, 1,
0.1165685, 0.6777364, 0.2584495, 1, 1, 1, 1, 1,
0.1180128, -0.3305328, 2.836233, 1, 1, 1, 1, 1,
0.1180564, -0.9953496, 2.070571, 1, 1, 1, 1, 1,
0.1190475, 1.049689, -0.7621662, 1, 1, 1, 1, 1,
0.1277687, -0.7664725, 3.094963, 1, 1, 1, 1, 1,
0.1302092, 0.451538, -1.139498, 1, 1, 1, 1, 1,
0.1309758, -0.4076163, 1.678234, 1, 1, 1, 1, 1,
0.1322006, 0.6036333, 2.666668, 1, 1, 1, 1, 1,
0.1346551, -0.3826577, 1.919201, 1, 1, 1, 1, 1,
0.1369648, 0.6672483, -0.5175841, 1, 1, 1, 1, 1,
0.1371189, 0.3386838, 0.2121009, 1, 1, 1, 1, 1,
0.137854, -0.3958192, 3.738176, 1, 1, 1, 1, 1,
0.1404614, 0.3517436, 0.2432828, 1, 1, 1, 1, 1,
0.1436772, -0.974298, 2.843755, 1, 1, 1, 1, 1,
0.1501046, 1.269858, -2.083145, 1, 1, 1, 1, 1,
0.1507834, 1.36587, -0.4763436, 0, 0, 1, 1, 1,
0.1540235, -0.05115403, 2.956714, 1, 0, 0, 1, 1,
0.1543298, 0.2515662, -0.3349572, 1, 0, 0, 1, 1,
0.1557856, 0.9891828, 0.6160747, 1, 0, 0, 1, 1,
0.1567265, 0.3524626, 1.458938, 1, 0, 0, 1, 1,
0.1596576, -0.7494596, 2.889539, 1, 0, 0, 1, 1,
0.16014, 0.07394845, 2.752502, 0, 0, 0, 1, 1,
0.1629669, -0.2544311, 1.732193, 0, 0, 0, 1, 1,
0.1647429, 0.2756797, 1.259571, 0, 0, 0, 1, 1,
0.1653351, 0.3917042, -0.06563523, 0, 0, 0, 1, 1,
0.1749202, -0.4747453, 2.700552, 0, 0, 0, 1, 1,
0.1753244, 1.558495, 1.167764, 0, 0, 0, 1, 1,
0.1779648, 0.674185, -0.05086382, 0, 0, 0, 1, 1,
0.1783104, 0.2468219, -0.552619, 1, 1, 1, 1, 1,
0.1791511, 0.9535462, 1.302711, 1, 1, 1, 1, 1,
0.1821252, -0.3425034, 2.590863, 1, 1, 1, 1, 1,
0.18246, -0.02792912, 1.939723, 1, 1, 1, 1, 1,
0.1831908, 0.8988605, 1.781805, 1, 1, 1, 1, 1,
0.1834022, -0.9235442, 2.198296, 1, 1, 1, 1, 1,
0.184231, -0.5429458, 1.694335, 1, 1, 1, 1, 1,
0.1863741, -1.813837, 2.864623, 1, 1, 1, 1, 1,
0.1901903, -1.533869, 4.173023, 1, 1, 1, 1, 1,
0.1903912, 0.1044728, 1.250327, 1, 1, 1, 1, 1,
0.1920537, 0.5695161, 0.2886233, 1, 1, 1, 1, 1,
0.1932642, -0.7831047, 0.9589401, 1, 1, 1, 1, 1,
0.1955905, -0.4011028, 2.211203, 1, 1, 1, 1, 1,
0.202714, 0.2900971, 1.743866, 1, 1, 1, 1, 1,
0.2030662, -1.82704, 3.819118, 1, 1, 1, 1, 1,
0.2070258, 1.176736, -0.9674706, 0, 0, 1, 1, 1,
0.2116163, -1.026318, 3.42212, 1, 0, 0, 1, 1,
0.2145685, 0.1854337, 1.009481, 1, 0, 0, 1, 1,
0.2252778, -1.086631, 3.941937, 1, 0, 0, 1, 1,
0.2256727, 0.447368, 0.2045891, 1, 0, 0, 1, 1,
0.2261678, 0.2172505, 1.081974, 1, 0, 0, 1, 1,
0.2299974, -0.05745469, 0.9390628, 0, 0, 0, 1, 1,
0.2338481, 0.4266241, 2.096502, 0, 0, 0, 1, 1,
0.2343755, 1.867532, 0.8275044, 0, 0, 0, 1, 1,
0.2364362, 0.05896121, 0.3107898, 0, 0, 0, 1, 1,
0.2366996, 0.3337303, 0.6469282, 0, 0, 0, 1, 1,
0.2382143, 0.1194148, 1.776596, 0, 0, 0, 1, 1,
0.2486818, 0.7010021, -0.495177, 0, 0, 0, 1, 1,
0.2501437, 1.188516, -0.6705161, 1, 1, 1, 1, 1,
0.2661801, -1.545831, 3.461495, 1, 1, 1, 1, 1,
0.2668788, 1.009455, 0.9970917, 1, 1, 1, 1, 1,
0.2681246, 1.795174, 0.07770343, 1, 1, 1, 1, 1,
0.2714969, 0.4013581, -0.09632912, 1, 1, 1, 1, 1,
0.2737595, 0.7209323, 1.346086, 1, 1, 1, 1, 1,
0.2762513, 1.066582, 1.22646, 1, 1, 1, 1, 1,
0.2789932, -1.991505, 0.6483259, 1, 1, 1, 1, 1,
0.2805338, -0.3130911, 2.723501, 1, 1, 1, 1, 1,
0.2822765, -0.9583631, 3.06475, 1, 1, 1, 1, 1,
0.2870754, -0.4206836, 2.10613, 1, 1, 1, 1, 1,
0.287141, -1.003494, 2.324538, 1, 1, 1, 1, 1,
0.2895603, 0.6556084, -0.2075496, 1, 1, 1, 1, 1,
0.2980833, -0.01806778, 2.934838, 1, 1, 1, 1, 1,
0.3012052, 0.9382414, 0.1290728, 1, 1, 1, 1, 1,
0.3023908, -0.3904162, 1.844603, 0, 0, 1, 1, 1,
0.3025232, 2.306832, 0.2891242, 1, 0, 0, 1, 1,
0.3040102, 0.9561278, 0.3455372, 1, 0, 0, 1, 1,
0.3054948, -0.5808522, 1.343832, 1, 0, 0, 1, 1,
0.3067335, -1.3528, 2.085566, 1, 0, 0, 1, 1,
0.3128135, -0.1080144, 1.530788, 1, 0, 0, 1, 1,
0.316456, 1.670948, -0.6485616, 0, 0, 0, 1, 1,
0.32476, -0.5263345, 0.02844063, 0, 0, 0, 1, 1,
0.3255524, 0.8329724, 0.4192275, 0, 0, 0, 1, 1,
0.3329035, -0.7732615, 3.164952, 0, 0, 0, 1, 1,
0.3348848, -1.63328, 4.379528, 0, 0, 0, 1, 1,
0.3368905, -1.285731, 3.046697, 0, 0, 0, 1, 1,
0.3394904, 2.324776, -0.3559074, 0, 0, 0, 1, 1,
0.3404841, 0.7266995, 0.06633105, 1, 1, 1, 1, 1,
0.3422605, -0.6216199, 1.918525, 1, 1, 1, 1, 1,
0.3444017, -0.7472609, 2.186335, 1, 1, 1, 1, 1,
0.3465691, -0.7874446, 3.501772, 1, 1, 1, 1, 1,
0.3484405, -0.8228893, 1.92815, 1, 1, 1, 1, 1,
0.3513048, 0.5647375, 0.6635274, 1, 1, 1, 1, 1,
0.3538104, 0.3729821, 0.8511583, 1, 1, 1, 1, 1,
0.3564887, -0.190477, 0.656662, 1, 1, 1, 1, 1,
0.3593371, 0.6802709, -1.164595, 1, 1, 1, 1, 1,
0.3602663, 2.425332, -1.324544, 1, 1, 1, 1, 1,
0.3642724, 0.2175096, 1.702768, 1, 1, 1, 1, 1,
0.3721834, 0.2955276, 0.7057795, 1, 1, 1, 1, 1,
0.3748848, 0.009791613, 1.234225, 1, 1, 1, 1, 1,
0.3752476, -0.8692908, 3.636949, 1, 1, 1, 1, 1,
0.3825267, -0.3238297, 2.722667, 1, 1, 1, 1, 1,
0.3857161, -0.7757677, 2.220014, 0, 0, 1, 1, 1,
0.3876772, -2.491963, 1.365779, 1, 0, 0, 1, 1,
0.3882739, 1.659933, 0.5240031, 1, 0, 0, 1, 1,
0.3900827, -0.6813469, 3.812654, 1, 0, 0, 1, 1,
0.3927419, 0.655526, 2.559766, 1, 0, 0, 1, 1,
0.3929226, -1.979368, 4.964293, 1, 0, 0, 1, 1,
0.3990648, -1.337092, 3.082478, 0, 0, 0, 1, 1,
0.4070966, 0.4707856, 1.194683, 0, 0, 0, 1, 1,
0.4237046, 1.931893, -0.6115023, 0, 0, 0, 1, 1,
0.4332272, 1.449969, -0.9429252, 0, 0, 0, 1, 1,
0.4397629, 0.7522771, 1.299521, 0, 0, 0, 1, 1,
0.4416275, -2.945475, 3.494318, 0, 0, 0, 1, 1,
0.4442311, 0.2107834, 1.96405, 0, 0, 0, 1, 1,
0.4451925, -0.9234318, 3.542897, 1, 1, 1, 1, 1,
0.4466768, -0.0205005, 2.303684, 1, 1, 1, 1, 1,
0.4503146, -0.1193403, 1.64004, 1, 1, 1, 1, 1,
0.4530451, 0.1507462, 0.689784, 1, 1, 1, 1, 1,
0.45851, -1.306554, 2.956528, 1, 1, 1, 1, 1,
0.4639842, 1.542753, 0.8916074, 1, 1, 1, 1, 1,
0.4658643, -0.960552, 3.795566, 1, 1, 1, 1, 1,
0.4680666, 3.028905, 0.7548411, 1, 1, 1, 1, 1,
0.4709033, -0.3303871, 2.119908, 1, 1, 1, 1, 1,
0.4717939, 0.4166827, -0.9306855, 1, 1, 1, 1, 1,
0.4723231, -1.215699, 2.10854, 1, 1, 1, 1, 1,
0.4781034, -1.999128, 2.746482, 1, 1, 1, 1, 1,
0.4795651, 0.5343195, 1.253393, 1, 1, 1, 1, 1,
0.4802017, -0.7765316, 3.394078, 1, 1, 1, 1, 1,
0.4824532, -0.8324137, 1.99606, 1, 1, 1, 1, 1,
0.4850658, -1.035715, 1.359037, 0, 0, 1, 1, 1,
0.4858075, -0.6609285, 2.894522, 1, 0, 0, 1, 1,
0.4863203, -0.4034014, 3.515479, 1, 0, 0, 1, 1,
0.4875506, -2.450521, 1.972182, 1, 0, 0, 1, 1,
0.4917832, -1.058782, 2.82502, 1, 0, 0, 1, 1,
0.4935324, -0.6513596, 0.5226023, 1, 0, 0, 1, 1,
0.4955413, -0.199437, 2.553452, 0, 0, 0, 1, 1,
0.4958916, 0.07063138, 0.7876472, 0, 0, 0, 1, 1,
0.5042917, 0.5679305, 0.2317352, 0, 0, 0, 1, 1,
0.5087681, -0.4824697, 3.580634, 0, 0, 0, 1, 1,
0.5098361, -0.4481907, 2.062252, 0, 0, 0, 1, 1,
0.5113218, -1.203552, 3.722127, 0, 0, 0, 1, 1,
0.5138841, 1.806052, 1.090309, 0, 0, 0, 1, 1,
0.5140405, 0.1083251, 1.29594, 1, 1, 1, 1, 1,
0.5220923, 0.6617227, -1.403105, 1, 1, 1, 1, 1,
0.5225987, -0.3935466, 2.412454, 1, 1, 1, 1, 1,
0.523121, -0.3027746, 2.223354, 1, 1, 1, 1, 1,
0.5241482, -0.1887779, 1.773126, 1, 1, 1, 1, 1,
0.524532, -1.316803, 2.260352, 1, 1, 1, 1, 1,
0.5260476, -1.384403, 3.026384, 1, 1, 1, 1, 1,
0.5275557, -0.9962738, 3.330545, 1, 1, 1, 1, 1,
0.5308668, -0.1617482, 3.31054, 1, 1, 1, 1, 1,
0.5365548, 1.273188, 0.01923545, 1, 1, 1, 1, 1,
0.5404646, -1.541185, 3.023955, 1, 1, 1, 1, 1,
0.5410216, -0.6362245, 4.82228, 1, 1, 1, 1, 1,
0.541666, -0.5436119, 2.067318, 1, 1, 1, 1, 1,
0.5419978, -1.953376, 1.322148, 1, 1, 1, 1, 1,
0.542683, -1.353134, 2.535518, 1, 1, 1, 1, 1,
0.5456613, 0.1621943, 2.302027, 0, 0, 1, 1, 1,
0.5480015, 0.2790079, 2.421957, 1, 0, 0, 1, 1,
0.5487567, -0.6755385, 2.653756, 1, 0, 0, 1, 1,
0.5503496, 0.7602791, -0.2551684, 1, 0, 0, 1, 1,
0.5548053, 0.2828319, 1.128997, 1, 0, 0, 1, 1,
0.5556553, -0.2028621, 1.970574, 1, 0, 0, 1, 1,
0.5575645, 1.033362, 1.720621, 0, 0, 0, 1, 1,
0.5600175, 1.361301, 0.8530385, 0, 0, 0, 1, 1,
0.5606655, 0.4264426, 2.251748, 0, 0, 0, 1, 1,
0.5617553, -0.9033394, 0.4296754, 0, 0, 0, 1, 1,
0.5637839, -0.9122407, 1.58577, 0, 0, 0, 1, 1,
0.5648381, 0.8466334, -0.0878455, 0, 0, 0, 1, 1,
0.5659651, 1.152254, 3.281503, 0, 0, 0, 1, 1,
0.5693392, 0.4500892, 1.495717, 1, 1, 1, 1, 1,
0.5742323, 0.5759864, 1.943199, 1, 1, 1, 1, 1,
0.5815548, -1.167456, 1.774531, 1, 1, 1, 1, 1,
0.5836973, 0.7565419, 1.261544, 1, 1, 1, 1, 1,
0.5840633, 0.1290989, 1.624562, 1, 1, 1, 1, 1,
0.593779, 0.2721126, -0.07642273, 1, 1, 1, 1, 1,
0.5961, 0.6346001, -0.02420386, 1, 1, 1, 1, 1,
0.6008235, -2.380192, 3.635101, 1, 1, 1, 1, 1,
0.6010466, -0.9092546, 3.445217, 1, 1, 1, 1, 1,
0.6014104, -0.4791405, 1.859486, 1, 1, 1, 1, 1,
0.6022021, 1.491945, 0.1379981, 1, 1, 1, 1, 1,
0.6034071, -0.3079388, 2.637956, 1, 1, 1, 1, 1,
0.6109255, 0.9523313, -0.03137618, 1, 1, 1, 1, 1,
0.6128751, 0.08104502, 1.647128, 1, 1, 1, 1, 1,
0.6129177, -1.399885, 3.033458, 1, 1, 1, 1, 1,
0.6136761, -2.048258, 4.315635, 0, 0, 1, 1, 1,
0.6166592, 0.4044127, 0.6914743, 1, 0, 0, 1, 1,
0.6183311, -0.1438533, 0.5966296, 1, 0, 0, 1, 1,
0.6186358, -1.368169, 2.444103, 1, 0, 0, 1, 1,
0.6196223, 1.399619, 2.458887, 1, 0, 0, 1, 1,
0.623623, -0.8169225, 2.691343, 1, 0, 0, 1, 1,
0.6241144, 0.04844761, 2.783372, 0, 0, 0, 1, 1,
0.6258435, 0.2376851, 1.467634, 0, 0, 0, 1, 1,
0.63043, -1.753863, 0.3220867, 0, 0, 0, 1, 1,
0.6325441, -0.003532241, 1.476327, 0, 0, 0, 1, 1,
0.6359516, -2.236804, 1.639668, 0, 0, 0, 1, 1,
0.6426331, -0.9391811, 3.265407, 0, 0, 0, 1, 1,
0.6443707, 1.341484, -1.421671, 0, 0, 0, 1, 1,
0.6460745, 0.09948096, -0.002768005, 1, 1, 1, 1, 1,
0.6472962, -0.3129626, 2.613355, 1, 1, 1, 1, 1,
0.6510471, -0.8320542, 2.443783, 1, 1, 1, 1, 1,
0.6512505, -0.6039198, 3.206672, 1, 1, 1, 1, 1,
0.6552783, 0.9066249, 1.529204, 1, 1, 1, 1, 1,
0.6563851, -1.064321, 1.957307, 1, 1, 1, 1, 1,
0.6626715, 0.222776, 1.163811, 1, 1, 1, 1, 1,
0.6723029, -0.3386892, 2.021948, 1, 1, 1, 1, 1,
0.6735536, 0.4255792, 1.58856, 1, 1, 1, 1, 1,
0.6748739, 0.9179078, 0.5268191, 1, 1, 1, 1, 1,
0.6757032, -0.5049489, 1.650817, 1, 1, 1, 1, 1,
0.6788172, -0.3897721, 1.141601, 1, 1, 1, 1, 1,
0.6832601, 0.7255862, -0.5003849, 1, 1, 1, 1, 1,
0.6874291, 1.819656, -0.05259122, 1, 1, 1, 1, 1,
0.6877096, -0.02651814, 2.993217, 1, 1, 1, 1, 1,
0.6930931, -1.267833, 3.083738, 0, 0, 1, 1, 1,
0.6987585, 0.5729798, 1.063747, 1, 0, 0, 1, 1,
0.7016151, -1.917262, 4.123675, 1, 0, 0, 1, 1,
0.7023354, 3.017824, -0.8163216, 1, 0, 0, 1, 1,
0.7043001, 2.054745, 0.3019721, 1, 0, 0, 1, 1,
0.7052567, -0.007800653, -0.2914399, 1, 0, 0, 1, 1,
0.7077925, 0.9069801, -1.308013, 0, 0, 0, 1, 1,
0.7197773, 0.5324581, 2.097164, 0, 0, 0, 1, 1,
0.7227582, 0.1417614, 2.047613, 0, 0, 0, 1, 1,
0.7230445, -0.7670531, 5.175273, 0, 0, 0, 1, 1,
0.7266568, -1.702216, 2.945985, 0, 0, 0, 1, 1,
0.7286236, -1.988518, 3.252229, 0, 0, 0, 1, 1,
0.7343552, 0.3858793, 1.616819, 0, 0, 0, 1, 1,
0.7394453, -0.3253253, 0.5648516, 1, 1, 1, 1, 1,
0.7409306, 0.7703349, 3.036704, 1, 1, 1, 1, 1,
0.7412472, 1.064571, 1.297754, 1, 1, 1, 1, 1,
0.742895, 0.1514005, 1.739691, 1, 1, 1, 1, 1,
0.7429325, 0.2452779, 0.1572423, 1, 1, 1, 1, 1,
0.7487802, 0.03839921, 1.609138, 1, 1, 1, 1, 1,
0.7489188, -0.6837681, 1.162656, 1, 1, 1, 1, 1,
0.7520229, 0.8452284, 1.199642, 1, 1, 1, 1, 1,
0.7586295, -0.3055433, 2.072609, 1, 1, 1, 1, 1,
0.763477, 0.01532074, -0.7125496, 1, 1, 1, 1, 1,
0.7678185, 0.02282237, 1.755879, 1, 1, 1, 1, 1,
0.768724, -0.2514744, 2.072555, 1, 1, 1, 1, 1,
0.7701483, 2.056417, -0.2391448, 1, 1, 1, 1, 1,
0.7720349, -0.6958011, 1.982466, 1, 1, 1, 1, 1,
0.7753257, -0.4553093, 1.7516, 1, 1, 1, 1, 1,
0.7767978, 1.481918, 1.075017, 0, 0, 1, 1, 1,
0.7768908, 0.5069294, 1.433456, 1, 0, 0, 1, 1,
0.7833813, 0.4014446, 1.523753, 1, 0, 0, 1, 1,
0.7855724, 0.391633, 0.624676, 1, 0, 0, 1, 1,
0.7893484, -0.4653334, 1.738415, 1, 0, 0, 1, 1,
0.7961243, -0.1171369, 0.2998464, 1, 0, 0, 1, 1,
0.8032014, -2.134337, 2.54956, 0, 0, 0, 1, 1,
0.8034629, 1.939994, -0.2471957, 0, 0, 0, 1, 1,
0.8045655, 0.4950203, 3.624102, 0, 0, 0, 1, 1,
0.8090752, 0.522323, 1.327665, 0, 0, 0, 1, 1,
0.815717, 0.04817737, 2.013857, 0, 0, 0, 1, 1,
0.8260227, 2.667419, 1.642757, 0, 0, 0, 1, 1,
0.8262019, 0.4425522, -0.1236227, 0, 0, 0, 1, 1,
0.8337244, -0.04560156, 2.128521, 1, 1, 1, 1, 1,
0.8343278, -1.070564, 3.479409, 1, 1, 1, 1, 1,
0.8369586, 2.104683, -0.2791685, 1, 1, 1, 1, 1,
0.8388331, -0.01218243, 1.937515, 1, 1, 1, 1, 1,
0.846588, -0.7391059, 1.832507, 1, 1, 1, 1, 1,
0.8475921, 1.724968, -0.3050497, 1, 1, 1, 1, 1,
0.8546243, 0.05152542, 2.865022, 1, 1, 1, 1, 1,
0.8574432, -0.2350581, 1.200447, 1, 1, 1, 1, 1,
0.8581651, -0.3818668, 2.008532, 1, 1, 1, 1, 1,
0.8586864, -0.9254894, 2.801359, 1, 1, 1, 1, 1,
0.8638684, 0.6708316, -0.6085207, 1, 1, 1, 1, 1,
0.8641145, 1.140819, 0.01376217, 1, 1, 1, 1, 1,
0.8696973, 0.41047, 0.2860414, 1, 1, 1, 1, 1,
0.8728814, -0.06711208, 1.035082, 1, 1, 1, 1, 1,
0.8828425, 0.9146502, 2.35962, 1, 1, 1, 1, 1,
0.8886462, 1.478637, 0.1750463, 0, 0, 1, 1, 1,
0.8940958, -0.8284338, 0.633293, 1, 0, 0, 1, 1,
0.9066811, 0.3847716, 1.689357, 1, 0, 0, 1, 1,
0.914572, -0.3360162, 1.135315, 1, 0, 0, 1, 1,
0.9195341, -0.3716797, 1.711941, 1, 0, 0, 1, 1,
0.9269344, 1.676834, -0.9989927, 1, 0, 0, 1, 1,
0.9308819, 0.9656377, 1.484423, 0, 0, 0, 1, 1,
0.9312057, -0.486823, -0.08966269, 0, 0, 0, 1, 1,
0.9352822, -0.3565828, 3.377373, 0, 0, 0, 1, 1,
0.9398172, 0.4355049, 0.5297589, 0, 0, 0, 1, 1,
0.9408207, -2.347493, 4.830799, 0, 0, 0, 1, 1,
0.9408805, -0.3496605, 2.836868, 0, 0, 0, 1, 1,
0.9430986, -1.808838, 2.490605, 0, 0, 0, 1, 1,
0.954339, -0.379796, 1.681745, 1, 1, 1, 1, 1,
0.9554629, 1.163524, 0.878737, 1, 1, 1, 1, 1,
0.9569393, -1.071959, 0.9459028, 1, 1, 1, 1, 1,
0.9572214, 0.4619151, 2.025937, 1, 1, 1, 1, 1,
0.9620321, -0.7448552, 3.446517, 1, 1, 1, 1, 1,
0.9662942, -1.978176, 3.248588, 1, 1, 1, 1, 1,
0.9751783, 0.7272215, 0.1477502, 1, 1, 1, 1, 1,
0.9791225, -0.6276829, 2.791283, 1, 1, 1, 1, 1,
0.9842466, -0.2182678, 3.339824, 1, 1, 1, 1, 1,
0.9890602, -1.644955, 2.216573, 1, 1, 1, 1, 1,
0.9965901, -2.200622, 2.568551, 1, 1, 1, 1, 1,
0.9978318, -0.4238365, 0.5312105, 1, 1, 1, 1, 1,
1.000706, -0.7010172, 1.705181, 1, 1, 1, 1, 1,
1.005127, 0.01104407, 3.310395, 1, 1, 1, 1, 1,
1.008807, 0.267566, 2.31739, 1, 1, 1, 1, 1,
1.011044, 1.436782, -0.09664163, 0, 0, 1, 1, 1,
1.014148, -0.6774616, 0.8150013, 1, 0, 0, 1, 1,
1.02376, -0.09641255, 0.9447974, 1, 0, 0, 1, 1,
1.025837, -0.9555532, 2.200626, 1, 0, 0, 1, 1,
1.034306, 0.3100659, 2.202096, 1, 0, 0, 1, 1,
1.038126, -0.2715297, 2.198154, 1, 0, 0, 1, 1,
1.044619, -0.4652477, 1.001914, 0, 0, 0, 1, 1,
1.049403, -0.640534, 2.892946, 0, 0, 0, 1, 1,
1.05523, 0.7773374, 1.320864, 0, 0, 0, 1, 1,
1.058899, 1.85033, 2.308478, 0, 0, 0, 1, 1,
1.059, 0.8627167, 1.302657, 0, 0, 0, 1, 1,
1.068828, 0.6973949, 0.159721, 0, 0, 0, 1, 1,
1.071851, 1.982913, 0.03967813, 0, 0, 0, 1, 1,
1.072205, -1.293402, 2.221371, 1, 1, 1, 1, 1,
1.079033, -1.140413, 2.048392, 1, 1, 1, 1, 1,
1.081689, -0.2883109, 1.073931, 1, 1, 1, 1, 1,
1.087096, -0.9950508, 2.945579, 1, 1, 1, 1, 1,
1.087874, 0.1028644, 2.519249, 1, 1, 1, 1, 1,
1.091006, -0.2404291, 4.041319, 1, 1, 1, 1, 1,
1.093095, -2.34272, 3.447086, 1, 1, 1, 1, 1,
1.093716, 1.500083, -1.488225, 1, 1, 1, 1, 1,
1.101763, 2.345304, -1.11101, 1, 1, 1, 1, 1,
1.104307, 1.644119, 3.345082, 1, 1, 1, 1, 1,
1.111597, -0.8602359, 1.290048, 1, 1, 1, 1, 1,
1.1154, -1.135423, 4.58205, 1, 1, 1, 1, 1,
1.119009, -1.49171, 3.485776, 1, 1, 1, 1, 1,
1.120474, -0.095955, 0.8610358, 1, 1, 1, 1, 1,
1.121463, -0.8746149, 1.526931, 1, 1, 1, 1, 1,
1.128708, 1.89646, 2.160316, 0, 0, 1, 1, 1,
1.139894, 0.2960693, 2.730456, 1, 0, 0, 1, 1,
1.141562, -1.187227, 2.077646, 1, 0, 0, 1, 1,
1.142405, -0.6458253, 2.569826, 1, 0, 0, 1, 1,
1.155474, 1.487339, 2.350574, 1, 0, 0, 1, 1,
1.167627, 0.3156451, 1.363432, 1, 0, 0, 1, 1,
1.181231, -0.03555898, 1.965073, 0, 0, 0, 1, 1,
1.183077, 0.165852, 2.6163, 0, 0, 0, 1, 1,
1.194397, 0.445848, 0.2197104, 0, 0, 0, 1, 1,
1.197078, 1.470186, 2.599355, 0, 0, 0, 1, 1,
1.199406, 1.26436, 2.402842, 0, 0, 0, 1, 1,
1.212392, 0.8484369, 1.34379, 0, 0, 0, 1, 1,
1.212999, 1.970463, 0.3408596, 0, 0, 0, 1, 1,
1.21979, -0.08457876, 2.161552, 1, 1, 1, 1, 1,
1.228189, -0.2294373, 3.052658, 1, 1, 1, 1, 1,
1.230669, 1.452993, 0.3398049, 1, 1, 1, 1, 1,
1.230886, -0.2043564, 1.910817, 1, 1, 1, 1, 1,
1.239445, 0.8716124, -0.1223794, 1, 1, 1, 1, 1,
1.241905, 1.422314, -0.4077499, 1, 1, 1, 1, 1,
1.243433, 0.2258677, 1.406337, 1, 1, 1, 1, 1,
1.244791, 0.6213155, 0.5642717, 1, 1, 1, 1, 1,
1.251742, -0.5532104, 0.3419397, 1, 1, 1, 1, 1,
1.251881, 1.53731, 1.415115, 1, 1, 1, 1, 1,
1.262407, 0.2996752, 1.823991, 1, 1, 1, 1, 1,
1.267039, 0.09077962, 2.436198, 1, 1, 1, 1, 1,
1.267102, -0.8716601, 1.51696, 1, 1, 1, 1, 1,
1.27492, 0.4869256, 0.4335006, 1, 1, 1, 1, 1,
1.281174, -0.5755165, 3.417832, 1, 1, 1, 1, 1,
1.285311, 0.6677204, 0.9462097, 0, 0, 1, 1, 1,
1.288556, -1.300355, 3.509507, 1, 0, 0, 1, 1,
1.291581, 0.6185952, 1.61807, 1, 0, 0, 1, 1,
1.294502, 1.96177, 1.029927, 1, 0, 0, 1, 1,
1.303748, -0.3724753, 0.5995986, 1, 0, 0, 1, 1,
1.310514, -0.1370906, 0.8378388, 1, 0, 0, 1, 1,
1.319761, 2.168167, 1.143021, 0, 0, 0, 1, 1,
1.324354, -0.5083847, 2.857697, 0, 0, 0, 1, 1,
1.33138, -1.090004, 2.954105, 0, 0, 0, 1, 1,
1.33206, 0.4144391, 1.445306, 0, 0, 0, 1, 1,
1.34332, 1.297201, 1.289007, 0, 0, 0, 1, 1,
1.362228, 0.6923816, 1.129326, 0, 0, 0, 1, 1,
1.370703, 0.836156, 2.916404, 0, 0, 0, 1, 1,
1.372472, -0.162957, 1.22993, 1, 1, 1, 1, 1,
1.38209, 0.2310065, 1.704803, 1, 1, 1, 1, 1,
1.385128, -0.3494737, 0.8200797, 1, 1, 1, 1, 1,
1.386801, -0.3265319, 3.039335, 1, 1, 1, 1, 1,
1.387675, -0.3588545, 2.504154, 1, 1, 1, 1, 1,
1.389804, 0.1559301, 2.293391, 1, 1, 1, 1, 1,
1.403001, 1.414138, 2.490374, 1, 1, 1, 1, 1,
1.407874, -0.6946033, 2.388607, 1, 1, 1, 1, 1,
1.413942, 0.3896751, 1.092362, 1, 1, 1, 1, 1,
1.416305, -0.9452152, 3.346804, 1, 1, 1, 1, 1,
1.432879, -0.4409263, 1.794993, 1, 1, 1, 1, 1,
1.440446, 0.1984037, -0.499548, 1, 1, 1, 1, 1,
1.451661, -0.009935446, 1.904191, 1, 1, 1, 1, 1,
1.453242, 0.2569129, 0.5784566, 1, 1, 1, 1, 1,
1.462332, 1.789357, 0.7060995, 1, 1, 1, 1, 1,
1.463551, -1.177436, 3.224701, 0, 0, 1, 1, 1,
1.476098, -0.1367246, 0.8912081, 1, 0, 0, 1, 1,
1.487806, -0.46406, 2.497605, 1, 0, 0, 1, 1,
1.495644, 0.9821767, 0.6117149, 1, 0, 0, 1, 1,
1.503941, -1.969976, 3.71544, 1, 0, 0, 1, 1,
1.504377, 0.1315854, -0.6791849, 1, 0, 0, 1, 1,
1.505868, 1.788261, 0.5488547, 0, 0, 0, 1, 1,
1.508388, -0.123161, 1.165484, 0, 0, 0, 1, 1,
1.50886, -1.442385, 2.67128, 0, 0, 0, 1, 1,
1.519546, -1.392693, 1.931671, 0, 0, 0, 1, 1,
1.519916, -0.2227821, 1.915483, 0, 0, 0, 1, 1,
1.528496, -0.7180611, 0.3192706, 0, 0, 0, 1, 1,
1.538815, -0.1870869, 1.179171, 0, 0, 0, 1, 1,
1.54301, 0.1465468, 1.338576, 1, 1, 1, 1, 1,
1.547224, -1.03561, 2.792416, 1, 1, 1, 1, 1,
1.560461, -1.459027, 2.815825, 1, 1, 1, 1, 1,
1.564102, 1.911604, 1.061391, 1, 1, 1, 1, 1,
1.587508, 0.0276764, -0.2420849, 1, 1, 1, 1, 1,
1.590227, 0.3554278, 1.509596, 1, 1, 1, 1, 1,
1.592688, 0.989077, -0.2491042, 1, 1, 1, 1, 1,
1.599833, 0.9431517, 1.880629, 1, 1, 1, 1, 1,
1.615683, 1.022427, -0.04680973, 1, 1, 1, 1, 1,
1.629987, 0.7738538, 1.394377, 1, 1, 1, 1, 1,
1.63012, 0.1929612, 1.267073, 1, 1, 1, 1, 1,
1.631629, 0.7096795, 1.667496, 1, 1, 1, 1, 1,
1.645138, -1.731342, 2.710351, 1, 1, 1, 1, 1,
1.67207, -2.075895e-06, 2.009202, 1, 1, 1, 1, 1,
1.685368, 0.01814997, 3.443456, 1, 1, 1, 1, 1,
1.704266, -0.9980252, 1.752524, 0, 0, 1, 1, 1,
1.719214, 0.6949005, -0.06781394, 1, 0, 0, 1, 1,
1.719832, -1.066415, 0.2174036, 1, 0, 0, 1, 1,
1.721316, 1.518337, 0.7725104, 1, 0, 0, 1, 1,
1.73516, -0.8580282, 2.059492, 1, 0, 0, 1, 1,
1.742154, -0.6992225, 2.667934, 1, 0, 0, 1, 1,
1.751017, -0.6419686, 1.767202, 0, 0, 0, 1, 1,
1.753603, 0.1444103, 0.9424796, 0, 0, 0, 1, 1,
1.76168, 0.3106886, 3.508914, 0, 0, 0, 1, 1,
1.762221, -0.07447417, 0.6501486, 0, 0, 0, 1, 1,
1.766857, -1.884688, 1.793124, 0, 0, 0, 1, 1,
1.771894, 1.310641, 0.7806619, 0, 0, 0, 1, 1,
1.775414, 1.152458, 1.038707, 0, 0, 0, 1, 1,
1.776288, 0.3789943, -0.1680959, 1, 1, 1, 1, 1,
1.778483, 0.840089, -1.601216, 1, 1, 1, 1, 1,
1.788727, -0.3579619, 3.567396, 1, 1, 1, 1, 1,
1.802134, -0.9591267, 2.378379, 1, 1, 1, 1, 1,
1.807095, -2.380607, 4.128147, 1, 1, 1, 1, 1,
1.825077, -1.224418, 1.703298, 1, 1, 1, 1, 1,
1.834123, -1.857791, 4.333958, 1, 1, 1, 1, 1,
1.834722, 0.03859621, 0.9910095, 1, 1, 1, 1, 1,
1.880841, -0.0172573, 2.036351, 1, 1, 1, 1, 1,
1.889669, -0.1306888, 2.273759, 1, 1, 1, 1, 1,
1.91558, -0.5512078, 0.05479941, 1, 1, 1, 1, 1,
1.917454, -1.376117, 0.5034292, 1, 1, 1, 1, 1,
1.923475, 2.000472, 0.05113108, 1, 1, 1, 1, 1,
1.923732, 0.07367565, -1.721867, 1, 1, 1, 1, 1,
1.923892, 0.3457485, 2.023138, 1, 1, 1, 1, 1,
1.963682, -0.4288062, 0.987034, 0, 0, 1, 1, 1,
1.966739, -0.1378602, 2.363381, 1, 0, 0, 1, 1,
2.001257, -0.9671438, 1.199607, 1, 0, 0, 1, 1,
2.024523, 0.8602565, 1.663022, 1, 0, 0, 1, 1,
2.032026, -0.04535695, 0.7989235, 1, 0, 0, 1, 1,
2.035679, -0.1498198, 3.123446, 1, 0, 0, 1, 1,
2.036079, 0.5751355, 2.132313, 0, 0, 0, 1, 1,
2.080134, 1.008369, -2.060769, 0, 0, 0, 1, 1,
2.0903, 0.5432967, 3.066493, 0, 0, 0, 1, 1,
2.136414, -0.3195041, 1.842284, 0, 0, 0, 1, 1,
2.137667, -0.4661882, 1.602648, 0, 0, 0, 1, 1,
2.188846, 1.976436, 1.049845, 0, 0, 0, 1, 1,
2.366539, -1.68218, 2.212568, 0, 0, 0, 1, 1,
2.417103, 0.7079554, -0.394606, 1, 1, 1, 1, 1,
2.481119, 1.625039, -0.5354458, 1, 1, 1, 1, 1,
2.562609, -1.053881, 0.9352086, 1, 1, 1, 1, 1,
2.770097, 1.973593, 2.674473, 1, 1, 1, 1, 1,
2.79799, 2.534742, -0.2327297, 1, 1, 1, 1, 1,
3.016406, -0.3066409, 0.85685, 1, 1, 1, 1, 1,
4.353132, 0.3008762, 1.085901, 1, 1, 1, 1, 1
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
var radius = 10.06609;
var distance = 35.3567;
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
mvMatrix.translate( -0.5388284, -0.04171479, 0.5079408 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.3567);
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
