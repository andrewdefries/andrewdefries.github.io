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
-3.116897, 1.348787, -2.315863, 1, 0, 0, 1,
-2.848997, 0.3053451, 0.04482643, 1, 0.007843138, 0, 1,
-2.752587, -1.083859, -2.224641, 1, 0.01176471, 0, 1,
-2.520326, -1.431148, -1.63935, 1, 0.01960784, 0, 1,
-2.373143, 0.3516365, -2.444131, 1, 0.02352941, 0, 1,
-2.252517, 0.91189, -1.283563, 1, 0.03137255, 0, 1,
-2.247844, 1.372421, -1.692029, 1, 0.03529412, 0, 1,
-2.155082, 0.2845557, -2.110301, 1, 0.04313726, 0, 1,
-2.137802, 1.252827, -1.788755, 1, 0.04705882, 0, 1,
-2.133977, -1.043108, -3.545213, 1, 0.05490196, 0, 1,
-2.112377, -0.7630519, -2.326987, 1, 0.05882353, 0, 1,
-2.084694, 1.065035, -1.83093, 1, 0.06666667, 0, 1,
-2.077278, 0.7950376, -0.820971, 1, 0.07058824, 0, 1,
-2.070346, -1.180459, -3.02318, 1, 0.07843138, 0, 1,
-2.07018, -0.3725283, -1.57532, 1, 0.08235294, 0, 1,
-2.027957, -1.649518, -0.1058214, 1, 0.09019608, 0, 1,
-2.008569, -0.7970236, -1.694715, 1, 0.09411765, 0, 1,
-2.004575, -0.2618551, -2.870668, 1, 0.1019608, 0, 1,
-2.003378, -1.248426, -2.517953, 1, 0.1098039, 0, 1,
-1.966856, -0.7161617, -1.401519, 1, 0.1137255, 0, 1,
-1.951384, 0.4274623, -2.159548, 1, 0.1215686, 0, 1,
-1.946056, 0.6683654, -1.655241, 1, 0.1254902, 0, 1,
-1.945661, 0.7608189, -1.972532, 1, 0.1333333, 0, 1,
-1.938795, 0.4391975, -1.698773, 1, 0.1372549, 0, 1,
-1.914358, -0.8286419, -1.819295, 1, 0.145098, 0, 1,
-1.897996, 0.3657946, -0.2816363, 1, 0.1490196, 0, 1,
-1.890449, -0.1487957, -2.031617, 1, 0.1568628, 0, 1,
-1.877777, -0.03386893, -1.796633, 1, 0.1607843, 0, 1,
-1.8739, 0.1589348, -1.189852, 1, 0.1686275, 0, 1,
-1.862137, -0.3813308, -1.799919, 1, 0.172549, 0, 1,
-1.804072, -0.08006582, -0.2683737, 1, 0.1803922, 0, 1,
-1.802778, 0.8510557, -0.7091988, 1, 0.1843137, 0, 1,
-1.800842, -0.3239965, -0.5611581, 1, 0.1921569, 0, 1,
-1.797522, -0.6643618, -2.039859, 1, 0.1960784, 0, 1,
-1.764941, 1.060282, -0.443938, 1, 0.2039216, 0, 1,
-1.76472, -0.0745889, -0.123728, 1, 0.2117647, 0, 1,
-1.717944, -0.2874276, -1.082717, 1, 0.2156863, 0, 1,
-1.712274, 0.2093144, -0.7653431, 1, 0.2235294, 0, 1,
-1.694251, -0.7836021, -2.695541, 1, 0.227451, 0, 1,
-1.653865, 0.09537727, 0.5181013, 1, 0.2352941, 0, 1,
-1.630554, 0.2973211, -1.096449, 1, 0.2392157, 0, 1,
-1.616116, 0.9747165, -2.117275, 1, 0.2470588, 0, 1,
-1.592634, 0.6060566, -1.747227, 1, 0.2509804, 0, 1,
-1.575978, 0.3696643, -0.2691189, 1, 0.2588235, 0, 1,
-1.570809, 0.2347405, -2.193792, 1, 0.2627451, 0, 1,
-1.554897, 0.5068972, -2.113587, 1, 0.2705882, 0, 1,
-1.545218, 0.2664123, -2.143034, 1, 0.2745098, 0, 1,
-1.544537, 0.7534929, -2.888242, 1, 0.282353, 0, 1,
-1.542406, 2.500418, -1.299387, 1, 0.2862745, 0, 1,
-1.540403, -1.614983, -1.871524, 1, 0.2941177, 0, 1,
-1.520931, 0.6150705, -0.1861187, 1, 0.3019608, 0, 1,
-1.52036, -0.2856986, -2.540239, 1, 0.3058824, 0, 1,
-1.504127, -1.309257, -1.379289, 1, 0.3137255, 0, 1,
-1.498256, -0.3862658, 0.2558306, 1, 0.3176471, 0, 1,
-1.492171, 0.0260215, -3.262233, 1, 0.3254902, 0, 1,
-1.483708, -0.7884632, -2.794046, 1, 0.3294118, 0, 1,
-1.471579, -0.6944124, -1.668226, 1, 0.3372549, 0, 1,
-1.467936, 0.8710105, -0.643671, 1, 0.3411765, 0, 1,
-1.448216, 0.3726632, 0.4399681, 1, 0.3490196, 0, 1,
-1.442892, 0.9922579, -1.004455, 1, 0.3529412, 0, 1,
-1.436824, 0.6504479, -1.802435, 1, 0.3607843, 0, 1,
-1.436139, 0.9370631, 1.14917, 1, 0.3647059, 0, 1,
-1.431535, 0.9853624, -1.654958, 1, 0.372549, 0, 1,
-1.429684, 0.524134, -0.6223406, 1, 0.3764706, 0, 1,
-1.419193, -1.443832, -0.4283526, 1, 0.3843137, 0, 1,
-1.403324, -0.1530768, -2.118762, 1, 0.3882353, 0, 1,
-1.403231, -1.49864, -2.915137, 1, 0.3960784, 0, 1,
-1.400333, -1.07358, -1.197327, 1, 0.4039216, 0, 1,
-1.398762, 0.8903114, -1.192834, 1, 0.4078431, 0, 1,
-1.394931, -1.73806, -2.689806, 1, 0.4156863, 0, 1,
-1.393559, 1.319355, -1.044347, 1, 0.4196078, 0, 1,
-1.391382, 1.121323, -0.2978308, 1, 0.427451, 0, 1,
-1.390469, 0.2256229, -0.3760202, 1, 0.4313726, 0, 1,
-1.386986, 0.2333675, -2.898821, 1, 0.4392157, 0, 1,
-1.384568, -1.189974, -1.16923, 1, 0.4431373, 0, 1,
-1.379598, 0.1354844, -2.503345, 1, 0.4509804, 0, 1,
-1.378715, 2.24998, -1.150679, 1, 0.454902, 0, 1,
-1.371576, 0.5169493, -2.908419, 1, 0.4627451, 0, 1,
-1.347695, -0.1302356, -1.775478, 1, 0.4666667, 0, 1,
-1.342203, -0.9813153, -2.844911, 1, 0.4745098, 0, 1,
-1.339725, 0.1589335, -3.07015, 1, 0.4784314, 0, 1,
-1.337141, -0.5148749, -1.801505, 1, 0.4862745, 0, 1,
-1.334934, 1.057699, -1.358984, 1, 0.4901961, 0, 1,
-1.324761, 1.393602, 0.6947741, 1, 0.4980392, 0, 1,
-1.323167, -1.088186, -1.088667, 1, 0.5058824, 0, 1,
-1.322879, 0.239288, -0.03422356, 1, 0.509804, 0, 1,
-1.31469, -1.147399, -2.389979, 1, 0.5176471, 0, 1,
-1.308332, 0.3859865, -1.109936, 1, 0.5215687, 0, 1,
-1.299399, -1.104972, -2.815345, 1, 0.5294118, 0, 1,
-1.287241, -1.122475, -3.05215, 1, 0.5333334, 0, 1,
-1.286856, 1.414844, -1.444646, 1, 0.5411765, 0, 1,
-1.285953, 0.204093, -0.5744497, 1, 0.5450981, 0, 1,
-1.283524, 1.386093, -0.3255746, 1, 0.5529412, 0, 1,
-1.282891, -0.9038308, -2.616294, 1, 0.5568628, 0, 1,
-1.268439, -0.1022107, -1.583038, 1, 0.5647059, 0, 1,
-1.26323, 1.565527, -3.013232, 1, 0.5686275, 0, 1,
-1.256886, -0.1098315, -2.669934, 1, 0.5764706, 0, 1,
-1.2568, -1.113544, -1.411944, 1, 0.5803922, 0, 1,
-1.256104, -1.111083, -1.535774, 1, 0.5882353, 0, 1,
-1.255558, -0.5262221, -0.1363377, 1, 0.5921569, 0, 1,
-1.231213, -0.8573088, -0.3221477, 1, 0.6, 0, 1,
-1.22735, -0.8982908, -1.482773, 1, 0.6078432, 0, 1,
-1.222036, -0.5335475, -3.587485, 1, 0.6117647, 0, 1,
-1.220572, -0.887043, -1.471749, 1, 0.6196079, 0, 1,
-1.215114, -1.541661, -3.228353, 1, 0.6235294, 0, 1,
-1.204399, 1.784509, -0.7810795, 1, 0.6313726, 0, 1,
-1.197317, 0.2088241, -0.5108614, 1, 0.6352941, 0, 1,
-1.1939, 1.284006, -1.687784, 1, 0.6431373, 0, 1,
-1.192459, 0.8096573, 0.3490064, 1, 0.6470588, 0, 1,
-1.183604, -2.264313, -3.339345, 1, 0.654902, 0, 1,
-1.179332, -0.4041614, -0.7238736, 1, 0.6588235, 0, 1,
-1.179256, -0.5767558, -3.009818, 1, 0.6666667, 0, 1,
-1.174234, 1.24955, 0.6294553, 1, 0.6705883, 0, 1,
-1.169978, -0.8193151, -2.266753, 1, 0.6784314, 0, 1,
-1.169819, 0.04994396, -1.309391, 1, 0.682353, 0, 1,
-1.16931, 1.040799, -0.3256027, 1, 0.6901961, 0, 1,
-1.168768, -0.2292551, -2.227688, 1, 0.6941177, 0, 1,
-1.158392, -0.02396028, -2.127576, 1, 0.7019608, 0, 1,
-1.156361, 0.001187801, -1.318245, 1, 0.7098039, 0, 1,
-1.152638, -0.5399824, -1.221812, 1, 0.7137255, 0, 1,
-1.152422, -0.04680579, -3.028257, 1, 0.7215686, 0, 1,
-1.141323, -0.5854297, -2.273614, 1, 0.7254902, 0, 1,
-1.128384, -0.4311223, -2.176852, 1, 0.7333333, 0, 1,
-1.126065, -0.1957685, -2.917097, 1, 0.7372549, 0, 1,
-1.125602, -0.1025379, -3.169126, 1, 0.7450981, 0, 1,
-1.124901, 0.3390105, -3.38921, 1, 0.7490196, 0, 1,
-1.123693, 0.4345282, -0.5957075, 1, 0.7568628, 0, 1,
-1.117528, 0.1768398, -2.090525, 1, 0.7607843, 0, 1,
-1.114212, 1.494808, -1.512957, 1, 0.7686275, 0, 1,
-1.101582, 1.561556, -1.733818, 1, 0.772549, 0, 1,
-1.101517, 0.8613809, -0.3719187, 1, 0.7803922, 0, 1,
-1.100287, 1.650317, 0.1750102, 1, 0.7843137, 0, 1,
-1.098013, 1.364968, -0.1325068, 1, 0.7921569, 0, 1,
-1.083583, 2.089123, 0.7710437, 1, 0.7960784, 0, 1,
-1.0747, -1.519252, -1.065851, 1, 0.8039216, 0, 1,
-1.072824, -1.018621, -2.719063, 1, 0.8117647, 0, 1,
-1.072513, -0.06108198, -2.747859, 1, 0.8156863, 0, 1,
-1.068853, -0.2906518, -1.076121, 1, 0.8235294, 0, 1,
-1.065507, 1.931578, -1.642219, 1, 0.827451, 0, 1,
-1.063275, -0.195929, 0.3603762, 1, 0.8352941, 0, 1,
-1.062336, 0.5642709, -0.8838528, 1, 0.8392157, 0, 1,
-1.062202, 0.6808943, -0.5640278, 1, 0.8470588, 0, 1,
-1.060196, 1.484135, -1.535034, 1, 0.8509804, 0, 1,
-1.05599, -1.551384, -3.143102, 1, 0.8588235, 0, 1,
-1.055575, 0.5904982, 0.2237336, 1, 0.8627451, 0, 1,
-1.051692, 0.7551408, -0.139786, 1, 0.8705882, 0, 1,
-1.03712, -0.9636751, -1.362705, 1, 0.8745098, 0, 1,
-1.036152, 0.5588659, -2.908865, 1, 0.8823529, 0, 1,
-1.018693, 0.6049451, -1.905596, 1, 0.8862745, 0, 1,
-1.017713, 0.3891894, -1.944785, 1, 0.8941177, 0, 1,
-1.015692, 0.4544554, -1.980186, 1, 0.8980392, 0, 1,
-1.011134, -0.5815124, -4.120887, 1, 0.9058824, 0, 1,
-1.006394, -0.9027832, -2.82032, 1, 0.9137255, 0, 1,
-1.003403, 0.4162543, -0.6698532, 1, 0.9176471, 0, 1,
-1.00329, -0.8073431, -1.91548, 1, 0.9254902, 0, 1,
-1.00235, 1.744975, 1.489254, 1, 0.9294118, 0, 1,
-0.9980779, 1.191752, -0.7266137, 1, 0.9372549, 0, 1,
-0.9890835, -0.6041253, -2.995113, 1, 0.9411765, 0, 1,
-0.9875953, -0.1060906, -1.463476, 1, 0.9490196, 0, 1,
-0.9847766, -0.8300723, -1.572904, 1, 0.9529412, 0, 1,
-0.9784213, -0.3156716, 0.5334635, 1, 0.9607843, 0, 1,
-0.9760001, -1.853713, -2.750871, 1, 0.9647059, 0, 1,
-0.974373, -1.480209, -2.043245, 1, 0.972549, 0, 1,
-0.970436, 0.8353083, 0.3940864, 1, 0.9764706, 0, 1,
-0.9621245, -0.9722372, -1.948924, 1, 0.9843137, 0, 1,
-0.9608164, 0.2157908, -0.934149, 1, 0.9882353, 0, 1,
-0.9545829, 0.2472449, -2.269316, 1, 0.9960784, 0, 1,
-0.9470649, -0.530542, -1.903821, 0.9960784, 1, 0, 1,
-0.9393175, 0.2544663, -1.335694, 0.9921569, 1, 0, 1,
-0.9356924, 0.05517595, -2.364728, 0.9843137, 1, 0, 1,
-0.9312741, -1.250141, -2.608935, 0.9803922, 1, 0, 1,
-0.9247911, 0.2952729, -0.449531, 0.972549, 1, 0, 1,
-0.9239617, 0.9429327, -1.419873, 0.9686275, 1, 0, 1,
-0.9229066, -0.2440857, -2.595178, 0.9607843, 1, 0, 1,
-0.9191298, 0.8062825, -1.314475, 0.9568627, 1, 0, 1,
-0.9077694, -0.7382464, -1.764913, 0.9490196, 1, 0, 1,
-0.9036048, -1.083551, -1.617198, 0.945098, 1, 0, 1,
-0.8878782, -0.4577407, -0.03690925, 0.9372549, 1, 0, 1,
-0.8872504, 0.7645007, 1.229251, 0.9333333, 1, 0, 1,
-0.8867904, 0.9242237, -1.82195, 0.9254902, 1, 0, 1,
-0.8797925, 0.6933364, 0.6765488, 0.9215686, 1, 0, 1,
-0.8773859, -0.497226, -1.905169, 0.9137255, 1, 0, 1,
-0.8734747, 0.5529837, -0.503054, 0.9098039, 1, 0, 1,
-0.8702847, 0.144038, -1.882321, 0.9019608, 1, 0, 1,
-0.8701113, 2.158969, -0.4952753, 0.8941177, 1, 0, 1,
-0.8676644, 1.15241, -1.267106, 0.8901961, 1, 0, 1,
-0.8661763, -0.7672205, -3.048662, 0.8823529, 1, 0, 1,
-0.8542656, -0.03838794, -2.381972, 0.8784314, 1, 0, 1,
-0.8437254, 0.2112297, -1.877204, 0.8705882, 1, 0, 1,
-0.8274702, 0.7301129, 0.1886016, 0.8666667, 1, 0, 1,
-0.824993, -1.395794, -1.610398, 0.8588235, 1, 0, 1,
-0.8197107, 1.134875, 0.1304177, 0.854902, 1, 0, 1,
-0.8111204, -0.5136927, -3.365793, 0.8470588, 1, 0, 1,
-0.8076955, 0.9488433, 0.5059184, 0.8431373, 1, 0, 1,
-0.8063354, 1.138789, 0.6834144, 0.8352941, 1, 0, 1,
-0.8037434, 0.2536906, -2.269109, 0.8313726, 1, 0, 1,
-0.8010223, -2.153316, -4.382277, 0.8235294, 1, 0, 1,
-0.7981614, 1.277117, -2.01567, 0.8196079, 1, 0, 1,
-0.7945902, -1.208529, -2.480725, 0.8117647, 1, 0, 1,
-0.7853483, -0.02063452, -0.04791667, 0.8078431, 1, 0, 1,
-0.7747725, 0.07149259, -1.856994, 0.8, 1, 0, 1,
-0.7747039, 0.2958063, -2.760237, 0.7921569, 1, 0, 1,
-0.76735, -0.4817752, -2.314099, 0.7882353, 1, 0, 1,
-0.7647151, 1.381043, -0.07284465, 0.7803922, 1, 0, 1,
-0.7635915, 1.178673, -0.02766445, 0.7764706, 1, 0, 1,
-0.7616313, 0.05912372, -2.071326, 0.7686275, 1, 0, 1,
-0.7579437, 2.072613, -1.155456, 0.7647059, 1, 0, 1,
-0.7544034, 0.3977362, -1.138238, 0.7568628, 1, 0, 1,
-0.754108, -0.651507, -2.710539, 0.7529412, 1, 0, 1,
-0.7497466, 0.9959073, -0.9943379, 0.7450981, 1, 0, 1,
-0.746126, -1.303329, -2.178325, 0.7411765, 1, 0, 1,
-0.7453436, 0.5251096, -1.596974, 0.7333333, 1, 0, 1,
-0.738826, 0.3224305, -0.3776617, 0.7294118, 1, 0, 1,
-0.7358364, 0.2708831, -2.285746, 0.7215686, 1, 0, 1,
-0.7301312, -0.09274299, -0.7817039, 0.7176471, 1, 0, 1,
-0.7287722, 0.5193598, 1.070154, 0.7098039, 1, 0, 1,
-0.7277305, -0.8966438, -3.297886, 0.7058824, 1, 0, 1,
-0.722981, 0.9013537, -0.9601726, 0.6980392, 1, 0, 1,
-0.7193168, 1.248601, 0.9832304, 0.6901961, 1, 0, 1,
-0.7167771, 0.4356772, 0.353726, 0.6862745, 1, 0, 1,
-0.7149128, 0.7425082, -2.250115, 0.6784314, 1, 0, 1,
-0.7137734, 0.4213959, -2.139888, 0.6745098, 1, 0, 1,
-0.7082783, -0.05902373, -1.159479, 0.6666667, 1, 0, 1,
-0.7007573, -1.048685, -3.457082, 0.6627451, 1, 0, 1,
-0.6989739, -1.433586, -1.771159, 0.654902, 1, 0, 1,
-0.6974856, 1.06392, -0.420741, 0.6509804, 1, 0, 1,
-0.6944901, -1.186973, -3.278118, 0.6431373, 1, 0, 1,
-0.6860109, -0.3589205, -1.689595, 0.6392157, 1, 0, 1,
-0.6843698, -1.740394, -4.280319, 0.6313726, 1, 0, 1,
-0.6806625, -0.169095, -2.063024, 0.627451, 1, 0, 1,
-0.6764056, 0.5398536, 0.3337778, 0.6196079, 1, 0, 1,
-0.6752609, -1.631577, -2.618743, 0.6156863, 1, 0, 1,
-0.6749267, -1.315656, -2.176315, 0.6078432, 1, 0, 1,
-0.6734304, -0.4418665, -2.41366, 0.6039216, 1, 0, 1,
-0.6733203, -0.6420959, -2.997372, 0.5960785, 1, 0, 1,
-0.6692017, -1.424343, -3.474688, 0.5882353, 1, 0, 1,
-0.6687174, 0.2729445, 0.527659, 0.5843138, 1, 0, 1,
-0.6654209, 0.9348047, -2.532345, 0.5764706, 1, 0, 1,
-0.6621197, -0.5629063, -3.917439, 0.572549, 1, 0, 1,
-0.6615029, 0.2901981, -2.883943, 0.5647059, 1, 0, 1,
-0.6500217, -1.443233, -2.193045, 0.5607843, 1, 0, 1,
-0.6494886, 1.06163, -2.105568, 0.5529412, 1, 0, 1,
-0.6471375, -0.3094783, -3.381, 0.5490196, 1, 0, 1,
-0.6436191, 1.981324, 0.9539278, 0.5411765, 1, 0, 1,
-0.6435694, -0.6348107, -2.202075, 0.5372549, 1, 0, 1,
-0.6423413, -1.216229, -1.424242, 0.5294118, 1, 0, 1,
-0.6417385, -0.6940188, -2.652203, 0.5254902, 1, 0, 1,
-0.6407852, -0.9815759, -2.5695, 0.5176471, 1, 0, 1,
-0.6367978, 1.691798, -1.275258, 0.5137255, 1, 0, 1,
-0.6343111, 0.8674732, -0.4762155, 0.5058824, 1, 0, 1,
-0.6330021, -1.85294, -2.085725, 0.5019608, 1, 0, 1,
-0.6306571, 1.766625, -0.5773609, 0.4941176, 1, 0, 1,
-0.6302375, -0.6112857, -3.010209, 0.4862745, 1, 0, 1,
-0.6301519, 1.524961, -1.189052, 0.4823529, 1, 0, 1,
-0.6292208, 1.101907, -1.909347, 0.4745098, 1, 0, 1,
-0.6288879, -1.27681, -2.477657, 0.4705882, 1, 0, 1,
-0.6254664, -0.3421091, -2.509684, 0.4627451, 1, 0, 1,
-0.6247873, -0.5944106, -2.21812, 0.4588235, 1, 0, 1,
-0.6237803, 0.6144496, 0.3806023, 0.4509804, 1, 0, 1,
-0.6202531, -0.8526078, -2.518543, 0.4470588, 1, 0, 1,
-0.6178409, -0.4492797, -1.44609, 0.4392157, 1, 0, 1,
-0.6150587, -1.608656, -2.549707, 0.4352941, 1, 0, 1,
-0.6117291, -1.148337, -2.291725, 0.427451, 1, 0, 1,
-0.60823, 0.5703402, -1.761858, 0.4235294, 1, 0, 1,
-0.6023753, -0.2483888, -0.9364228, 0.4156863, 1, 0, 1,
-0.6021324, -0.6175876, -1.400094, 0.4117647, 1, 0, 1,
-0.6021264, 0.2985861, -1.015187, 0.4039216, 1, 0, 1,
-0.6010614, -0.6736998, -1.998868, 0.3960784, 1, 0, 1,
-0.5994996, 1.136286, -0.6848871, 0.3921569, 1, 0, 1,
-0.5895138, -0.9104592, -3.862622, 0.3843137, 1, 0, 1,
-0.5888659, 0.3085657, -2.43778, 0.3803922, 1, 0, 1,
-0.5881925, 1.270419, -1.596417, 0.372549, 1, 0, 1,
-0.5868771, -0.3861167, -2.324712, 0.3686275, 1, 0, 1,
-0.5805697, -0.8497657, -3.569678, 0.3607843, 1, 0, 1,
-0.5767285, 0.6379749, -0.7875523, 0.3568628, 1, 0, 1,
-0.5758513, -1.946015, -2.352998, 0.3490196, 1, 0, 1,
-0.5729708, -0.9469582, -4.302806, 0.345098, 1, 0, 1,
-0.5717945, 0.6861025, 0.1224309, 0.3372549, 1, 0, 1,
-0.5696974, -0.4085938, -3.315655, 0.3333333, 1, 0, 1,
-0.5668156, 0.8449588, 0.1193554, 0.3254902, 1, 0, 1,
-0.5665991, -0.4716634, -2.917429, 0.3215686, 1, 0, 1,
-0.5653218, -0.2992783, -0.8875601, 0.3137255, 1, 0, 1,
-0.5639366, -0.3964972, -2.080586, 0.3098039, 1, 0, 1,
-0.5610622, 1.404909, 0.2975452, 0.3019608, 1, 0, 1,
-0.5557764, 0.5521153, -0.4954416, 0.2941177, 1, 0, 1,
-0.5422896, 0.5457896, -0.963415, 0.2901961, 1, 0, 1,
-0.5397794, 0.7867718, -1.067307, 0.282353, 1, 0, 1,
-0.5351058, -0.2062627, -1.993259, 0.2784314, 1, 0, 1,
-0.5314788, -0.5396133, -2.578135, 0.2705882, 1, 0, 1,
-0.5303659, -0.1932173, -1.798453, 0.2666667, 1, 0, 1,
-0.5265741, -0.6648497, -3.635839, 0.2588235, 1, 0, 1,
-0.5236672, 3.281934, 0.5484374, 0.254902, 1, 0, 1,
-0.5206842, 1.272929, -0.9769648, 0.2470588, 1, 0, 1,
-0.5154713, -0.644378, -2.962188, 0.2431373, 1, 0, 1,
-0.5138533, -1.923103, -1.725887, 0.2352941, 1, 0, 1,
-0.5088369, 0.3460248, -2.564809, 0.2313726, 1, 0, 1,
-0.5070717, -0.6981989, -3.756445, 0.2235294, 1, 0, 1,
-0.5043938, -0.4225482, -3.164038, 0.2196078, 1, 0, 1,
-0.5030475, 0.02777402, -0.9639978, 0.2117647, 1, 0, 1,
-0.5022473, -0.6038784, -3.293112, 0.2078431, 1, 0, 1,
-0.4963705, -0.7589434, -2.129716, 0.2, 1, 0, 1,
-0.4925652, -0.5360681, -2.474822, 0.1921569, 1, 0, 1,
-0.4906137, -0.4561231, -0.4377084, 0.1882353, 1, 0, 1,
-0.4822245, 0.885617, -1.381771, 0.1803922, 1, 0, 1,
-0.4732525, -0.2016362, -3.52483, 0.1764706, 1, 0, 1,
-0.4719297, -0.2208313, -0.7946121, 0.1686275, 1, 0, 1,
-0.468891, 0.065098, -1.960984, 0.1647059, 1, 0, 1,
-0.466309, -1.473026, -2.192172, 0.1568628, 1, 0, 1,
-0.4660336, -0.4732605, -2.401561, 0.1529412, 1, 0, 1,
-0.4620612, -0.2162687, -1.83927, 0.145098, 1, 0, 1,
-0.4617709, -0.5431675, -1.254248, 0.1411765, 1, 0, 1,
-0.4597273, -0.9475497, -2.10308, 0.1333333, 1, 0, 1,
-0.4582045, -1.346198, -0.811129, 0.1294118, 1, 0, 1,
-0.4575386, 0.1120619, -2.025234, 0.1215686, 1, 0, 1,
-0.4574232, 0.4893371, -0.02556233, 0.1176471, 1, 0, 1,
-0.4552389, -0.03123047, -0.9584802, 0.1098039, 1, 0, 1,
-0.452519, -1.557382, -3.54583, 0.1058824, 1, 0, 1,
-0.4506955, 0.09528781, -1.570215, 0.09803922, 1, 0, 1,
-0.4483838, -0.7800453, -1.407521, 0.09019608, 1, 0, 1,
-0.4463167, -0.2848395, -0.9648113, 0.08627451, 1, 0, 1,
-0.4461035, 1.355826, -1.507677, 0.07843138, 1, 0, 1,
-0.44465, -1.034255, -1.631339, 0.07450981, 1, 0, 1,
-0.4399568, -2.546695, -2.31214, 0.06666667, 1, 0, 1,
-0.4367597, 1.364994, 0.02298393, 0.0627451, 1, 0, 1,
-0.4362964, -0.3889794, -2.733697, 0.05490196, 1, 0, 1,
-0.427061, 0.7285335, -1.080204, 0.05098039, 1, 0, 1,
-0.4263092, 0.6150802, -0.2060663, 0.04313726, 1, 0, 1,
-0.4261992, 0.3109742, -0.1004773, 0.03921569, 1, 0, 1,
-0.4234918, -0.1614, -1.715404, 0.03137255, 1, 0, 1,
-0.4153702, -1.360949, -4.106385, 0.02745098, 1, 0, 1,
-0.413772, -0.48629, -4.960954, 0.01960784, 1, 0, 1,
-0.4133696, -0.8949475, -1.41365, 0.01568628, 1, 0, 1,
-0.4133568, -1.070166, -3.531908, 0.007843138, 1, 0, 1,
-0.4132704, 0.6060302, 0.5056592, 0.003921569, 1, 0, 1,
-0.4073764, -1.271992, -3.36457, 0, 1, 0.003921569, 1,
-0.4068604, 1.395178, -0.01255552, 0, 1, 0.01176471, 1,
-0.4037213, 0.6018735, -2.172576, 0, 1, 0.01568628, 1,
-0.4034013, -2.034613, -3.297035, 0, 1, 0.02352941, 1,
-0.3936238, -0.1416097, -1.029526, 0, 1, 0.02745098, 1,
-0.3912986, -0.06119249, -1.060044, 0, 1, 0.03529412, 1,
-0.3893378, -0.5210471, -3.000304, 0, 1, 0.03921569, 1,
-0.387572, 0.4881342, -1.706332, 0, 1, 0.04705882, 1,
-0.381401, 0.3853647, -0.3391406, 0, 1, 0.05098039, 1,
-0.3808315, -0.5071436, -1.92471, 0, 1, 0.05882353, 1,
-0.3790212, 0.6678671, -0.1176125, 0, 1, 0.0627451, 1,
-0.374204, -0.2675786, -2.305031, 0, 1, 0.07058824, 1,
-0.3738482, 1.685546, -1.774686, 0, 1, 0.07450981, 1,
-0.3719274, -1.509882, -2.72001, 0, 1, 0.08235294, 1,
-0.3705437, 1.115178, 0.6928014, 0, 1, 0.08627451, 1,
-0.3689806, -0.001011315, -0.8448202, 0, 1, 0.09411765, 1,
-0.3688333, -0.3716798, -1.901474, 0, 1, 0.1019608, 1,
-0.366822, -0.97368, -1.291742, 0, 1, 0.1058824, 1,
-0.3657568, 1.443936, -1.725097, 0, 1, 0.1137255, 1,
-0.365366, -0.3526072, -1.716731, 0, 1, 0.1176471, 1,
-0.3638189, -0.04826328, -2.589153, 0, 1, 0.1254902, 1,
-0.3622126, 0.9814511, -0.1596985, 0, 1, 0.1294118, 1,
-0.3591621, 0.3818396, 0.03037392, 0, 1, 0.1372549, 1,
-0.3493561, 0.4801673, -1.49091, 0, 1, 0.1411765, 1,
-0.3456416, 0.5886172, -0.8018614, 0, 1, 0.1490196, 1,
-0.3449698, 0.02711471, -0.9744221, 0, 1, 0.1529412, 1,
-0.3442327, 1.340242, -1.52069, 0, 1, 0.1607843, 1,
-0.3423433, -1.84941, -2.720018, 0, 1, 0.1647059, 1,
-0.3379489, -0.271562, -4.12447, 0, 1, 0.172549, 1,
-0.3290553, -1.099919, -3.240628, 0, 1, 0.1764706, 1,
-0.3248596, -1.387592, -3.416502, 0, 1, 0.1843137, 1,
-0.3194701, 0.4242072, 0.3683773, 0, 1, 0.1882353, 1,
-0.3164678, -0.2401147, -2.084322, 0, 1, 0.1960784, 1,
-0.3140504, -1.528769, -2.260265, 0, 1, 0.2039216, 1,
-0.3132781, 0.5100268, -0.4490552, 0, 1, 0.2078431, 1,
-0.3105445, 0.05564487, -2.657958, 0, 1, 0.2156863, 1,
-0.3025957, 0.5361959, -1.739615, 0, 1, 0.2196078, 1,
-0.3003313, -1.62879, -3.51997, 0, 1, 0.227451, 1,
-0.3002791, -3.216449, -2.737978, 0, 1, 0.2313726, 1,
-0.2997137, -1.341646, -2.876294, 0, 1, 0.2392157, 1,
-0.2962455, -0.1546542, -2.758463, 0, 1, 0.2431373, 1,
-0.294626, 0.4285941, -0.89595, 0, 1, 0.2509804, 1,
-0.2920698, 0.9374719, 0.7547615, 0, 1, 0.254902, 1,
-0.2914029, 0.7818954, -1.798318, 0, 1, 0.2627451, 1,
-0.2821122, -0.2765766, -2.408533, 0, 1, 0.2666667, 1,
-0.2801894, -0.1285668, -2.589889, 0, 1, 0.2745098, 1,
-0.2742095, 0.4802327, 0.7408338, 0, 1, 0.2784314, 1,
-0.272393, 0.6483714, -0.4984741, 0, 1, 0.2862745, 1,
-0.2703803, 0.6185837, -1.567644, 0, 1, 0.2901961, 1,
-0.2699717, 0.2992389, 0.3045686, 0, 1, 0.2980392, 1,
-0.2688358, -0.8374188, -3.571824, 0, 1, 0.3058824, 1,
-0.262267, -0.482332, -3.093444, 0, 1, 0.3098039, 1,
-0.2614871, -2.651768, -3.044361, 0, 1, 0.3176471, 1,
-0.25913, 0.7467149, -1.096015, 0, 1, 0.3215686, 1,
-0.2566783, -0.1366373, -1.856231, 0, 1, 0.3294118, 1,
-0.255626, 0.3719346, -1.414476, 0, 1, 0.3333333, 1,
-0.2550401, -1.322626, -4.286475, 0, 1, 0.3411765, 1,
-0.2549864, -0.7678757, -2.656661, 0, 1, 0.345098, 1,
-0.2535689, 0.9167072, -0.4990794, 0, 1, 0.3529412, 1,
-0.252393, -2.417076, -4.238431, 0, 1, 0.3568628, 1,
-0.2504954, 0.3064019, -2.131442, 0, 1, 0.3647059, 1,
-0.2497014, -1.215679, -3.116589, 0, 1, 0.3686275, 1,
-0.249258, 0.05138791, 0.9786632, 0, 1, 0.3764706, 1,
-0.2408099, -0.9942248, -2.436953, 0, 1, 0.3803922, 1,
-0.2399849, 0.9290607, -0.9983225, 0, 1, 0.3882353, 1,
-0.2388909, 0.3935241, -1.001663, 0, 1, 0.3921569, 1,
-0.2377313, 0.725378, -0.02607562, 0, 1, 0.4, 1,
-0.2279772, 1.333712, 0.3717932, 0, 1, 0.4078431, 1,
-0.2276753, 0.445359, -0.8829696, 0, 1, 0.4117647, 1,
-0.2265951, -0.06648744, -2.755366, 0, 1, 0.4196078, 1,
-0.2236491, -0.7178829, -3.0992, 0, 1, 0.4235294, 1,
-0.2227781, -0.3810424, -1.887914, 0, 1, 0.4313726, 1,
-0.2182451, -1.045331, -3.638039, 0, 1, 0.4352941, 1,
-0.2146473, -1.877675, -2.432462, 0, 1, 0.4431373, 1,
-0.2132819, -0.3680793, -1.889212, 0, 1, 0.4470588, 1,
-0.2130743, -1.167042, -3.655518, 0, 1, 0.454902, 1,
-0.2126577, 0.4498755, -0.9597781, 0, 1, 0.4588235, 1,
-0.2125365, -0.9852412, -2.984732, 0, 1, 0.4666667, 1,
-0.2047125, 0.5464411, -2.097138, 0, 1, 0.4705882, 1,
-0.2009704, -0.3806194, -2.350968, 0, 1, 0.4784314, 1,
-0.2006133, 1.125821, 1.413344, 0, 1, 0.4823529, 1,
-0.1975335, -0.2205636, -1.316254, 0, 1, 0.4901961, 1,
-0.1934729, 1.145268, -1.031769, 0, 1, 0.4941176, 1,
-0.1932187, -0.1047526, -1.298241, 0, 1, 0.5019608, 1,
-0.1931701, -1.100207, -4.101254, 0, 1, 0.509804, 1,
-0.1900484, -0.9290929, -2.455611, 0, 1, 0.5137255, 1,
-0.1885125, 0.451996, 0.420487, 0, 1, 0.5215687, 1,
-0.1866944, -0.7543522, -3.130008, 0, 1, 0.5254902, 1,
-0.1820197, 0.3190911, -0.03055257, 0, 1, 0.5333334, 1,
-0.1813109, 0.603954, 0.02542794, 0, 1, 0.5372549, 1,
-0.1792798, 0.8535708, 0.9730648, 0, 1, 0.5450981, 1,
-0.1757659, -1.504541, -3.200174, 0, 1, 0.5490196, 1,
-0.1755482, -0.1232237, -2.353359, 0, 1, 0.5568628, 1,
-0.1737825, 0.1674263, -1.581886, 0, 1, 0.5607843, 1,
-0.165071, 0.1063255, -0.6330948, 0, 1, 0.5686275, 1,
-0.164153, -2.066128, -4.323899, 0, 1, 0.572549, 1,
-0.1634711, 1.299669, -1.053568, 0, 1, 0.5803922, 1,
-0.1629773, 1.171321, -0.8227761, 0, 1, 0.5843138, 1,
-0.1628019, -0.1919166, -1.378009, 0, 1, 0.5921569, 1,
-0.1604341, 0.2966061, -0.8425807, 0, 1, 0.5960785, 1,
-0.1600583, -0.4500112, -3.943027, 0, 1, 0.6039216, 1,
-0.1591278, 1.609762, -0.6317847, 0, 1, 0.6117647, 1,
-0.1559229, -0.7226263, -3.175803, 0, 1, 0.6156863, 1,
-0.1509418, -0.2978157, -3.680415, 0, 1, 0.6235294, 1,
-0.1500081, -1.872467, -3.676795, 0, 1, 0.627451, 1,
-0.1498521, -1.529523, -2.801782, 0, 1, 0.6352941, 1,
-0.1481528, 0.1379933, 0.8968675, 0, 1, 0.6392157, 1,
-0.1480797, 0.8910661, 1.41839, 0, 1, 0.6470588, 1,
-0.1467686, 0.4895494, 0.9498653, 0, 1, 0.6509804, 1,
-0.1455173, 1.490349, -0.37216, 0, 1, 0.6588235, 1,
-0.1411955, 0.9482942, 0.2720295, 0, 1, 0.6627451, 1,
-0.1398835, 0.4390424, -1.589584, 0, 1, 0.6705883, 1,
-0.1349891, -0.4148487, -2.262223, 0, 1, 0.6745098, 1,
-0.1344654, 0.01999696, -0.6144047, 0, 1, 0.682353, 1,
-0.1335623, -1.070254, -2.343549, 0, 1, 0.6862745, 1,
-0.130676, 0.651139, -0.4311242, 0, 1, 0.6941177, 1,
-0.1295297, -0.4261867, -1.568614, 0, 1, 0.7019608, 1,
-0.124195, 0.3419535, -0.5748414, 0, 1, 0.7058824, 1,
-0.1223532, 0.784774, -0.395839, 0, 1, 0.7137255, 1,
-0.1199443, 2.147397, -0.00504227, 0, 1, 0.7176471, 1,
-0.1185811, 0.239301, -2.872853, 0, 1, 0.7254902, 1,
-0.1138747, 0.5098023, -1.808186, 0, 1, 0.7294118, 1,
-0.1137037, -0.5638836, -2.356881, 0, 1, 0.7372549, 1,
-0.1123845, -2.204419, -2.800449, 0, 1, 0.7411765, 1,
-0.1107628, -0.0129527, -0.3148337, 0, 1, 0.7490196, 1,
-0.1101861, 0.3425519, 0.3064115, 0, 1, 0.7529412, 1,
-0.108891, -0.5911956, -2.526089, 0, 1, 0.7607843, 1,
-0.1080033, 0.2252098, -0.1505291, 0, 1, 0.7647059, 1,
-0.106107, 1.452641, -0.9609087, 0, 1, 0.772549, 1,
-0.1024445, 0.8107202, 1.054949, 0, 1, 0.7764706, 1,
-0.1008139, -1.733525, -2.540983, 0, 1, 0.7843137, 1,
-0.1003504, -1.415939, -4.246448, 0, 1, 0.7882353, 1,
-0.09245622, 1.203954, 0.2607761, 0, 1, 0.7960784, 1,
-0.09032516, 0.7223642, -0.4453932, 0, 1, 0.8039216, 1,
-0.0882346, 0.02656659, -1.229418, 0, 1, 0.8078431, 1,
-0.08570493, -0.2951367, -4.540752, 0, 1, 0.8156863, 1,
-0.08531952, 0.5919238, -0.5484174, 0, 1, 0.8196079, 1,
-0.08351595, -0.8440562, -2.377454, 0, 1, 0.827451, 1,
-0.08128339, -1.420496, -1.01421, 0, 1, 0.8313726, 1,
-0.08076268, -0.1946832, -4.486417, 0, 1, 0.8392157, 1,
-0.07980698, 0.4682954, -1.362243, 0, 1, 0.8431373, 1,
-0.07926142, 0.2294002, 0.2824776, 0, 1, 0.8509804, 1,
-0.06301921, -0.2936307, -2.942175, 0, 1, 0.854902, 1,
-0.06237219, -2.854073, -2.631129, 0, 1, 0.8627451, 1,
-0.05435213, 2.016896, 1.029416, 0, 1, 0.8666667, 1,
-0.05345744, 0.4795914, 0.2934372, 0, 1, 0.8745098, 1,
-0.05295384, -0.9144723, -3.51483, 0, 1, 0.8784314, 1,
-0.05106984, -1.487918, -4.086595, 0, 1, 0.8862745, 1,
-0.04938325, 1.382594, 0.5843194, 0, 1, 0.8901961, 1,
-0.04901807, 1.392537, 1.492272, 0, 1, 0.8980392, 1,
-0.04809562, -1.119325, -2.856473, 0, 1, 0.9058824, 1,
-0.04684288, -0.1907535, -3.728927, 0, 1, 0.9098039, 1,
-0.04607673, 1.173243, -1.089455, 0, 1, 0.9176471, 1,
-0.04539695, -0.277176, -4.3596, 0, 1, 0.9215686, 1,
-0.04213061, 0.340594, -0.3249501, 0, 1, 0.9294118, 1,
-0.04146099, -0.2001416, -3.113755, 0, 1, 0.9333333, 1,
-0.03931538, -0.377577, -4.4098, 0, 1, 0.9411765, 1,
-0.03822801, 1.3548, -0.05683879, 0, 1, 0.945098, 1,
-0.03378027, -1.16862, -3.969399, 0, 1, 0.9529412, 1,
-0.03279481, 0.2777759, -1.090153, 0, 1, 0.9568627, 1,
-0.03164548, -0.5705662, -2.497383, 0, 1, 0.9647059, 1,
-0.03038142, -0.7557772, -4.483477, 0, 1, 0.9686275, 1,
-0.02790362, 0.7963419, 0.0522131, 0, 1, 0.9764706, 1,
-0.02618364, -0.8670271, -3.023101, 0, 1, 0.9803922, 1,
-0.02374071, -0.6160981, -2.600591, 0, 1, 0.9882353, 1,
-0.02120417, -0.5451323, -3.649828, 0, 1, 0.9921569, 1,
-0.01922516, 0.5398445, 0.762137, 0, 1, 1, 1,
-0.0180658, -1.343345, -2.006879, 0, 0.9921569, 1, 1,
-0.01745035, -0.2677639, -3.995506, 0, 0.9882353, 1, 1,
-0.01651072, 0.7816713, 0.03009804, 0, 0.9803922, 1, 1,
-0.01405222, 0.7453066, 0.1224328, 0, 0.9764706, 1, 1,
-0.0138952, -0.2450991, -2.202834, 0, 0.9686275, 1, 1,
-0.01169519, -0.3991142, -4.042727, 0, 0.9647059, 1, 1,
-0.01041767, -1.407123, -3.653169, 0, 0.9568627, 1, 1,
-0.008502833, 0.07592097, 0.8046577, 0, 0.9529412, 1, 1,
-0.007359552, -0.6986478, -1.683315, 0, 0.945098, 1, 1,
-0.004353995, -0.1296905, -3.112592, 0, 0.9411765, 1, 1,
-0.002931687, 2.167112, -1.596039, 0, 0.9333333, 1, 1,
-0.001374358, -0.1451702, -3.385506, 0, 0.9294118, 1, 1,
-0.001169564, 1.619532, -1.735169, 0, 0.9215686, 1, 1,
0.001604833, -1.341517, 2.140213, 0, 0.9176471, 1, 1,
0.002765196, -0.4018965, 4.59726, 0, 0.9098039, 1, 1,
0.002889617, 0.7075061, 1.169479, 0, 0.9058824, 1, 1,
0.00381419, -0.2528893, 4.66318, 0, 0.8980392, 1, 1,
0.006178022, -0.5004768, 4.565892, 0, 0.8901961, 1, 1,
0.01429821, -1.193726, 3.268352, 0, 0.8862745, 1, 1,
0.01659446, -0.9507834, 1.397447, 0, 0.8784314, 1, 1,
0.02385169, 0.1498913, -0.6604552, 0, 0.8745098, 1, 1,
0.02463409, 0.228053, -0.2538381, 0, 0.8666667, 1, 1,
0.03092059, -0.4914137, 2.320354, 0, 0.8627451, 1, 1,
0.03308773, -0.8123655, 3.673948, 0, 0.854902, 1, 1,
0.03411233, 0.3690637, -0.7007142, 0, 0.8509804, 1, 1,
0.04256885, -0.9518581, 2.198542, 0, 0.8431373, 1, 1,
0.04308396, -0.3125116, 4.12512, 0, 0.8392157, 1, 1,
0.04489135, 1.211866, 0.8856086, 0, 0.8313726, 1, 1,
0.04518839, 0.7042177, -0.09220672, 0, 0.827451, 1, 1,
0.04523468, 0.08570069, 0.3995163, 0, 0.8196079, 1, 1,
0.04838024, -1.61577, 4.458317, 0, 0.8156863, 1, 1,
0.05110148, 0.6317625, -0.9470999, 0, 0.8078431, 1, 1,
0.05744366, -0.6603195, 2.222046, 0, 0.8039216, 1, 1,
0.0629039, 0.8394369, -0.4423233, 0, 0.7960784, 1, 1,
0.06598736, -0.003682666, 2.165146, 0, 0.7882353, 1, 1,
0.06860203, 0.1794275, 2.659049, 0, 0.7843137, 1, 1,
0.0692337, 1.035869, 0.3423903, 0, 0.7764706, 1, 1,
0.07188256, 0.4552796, -0.02092863, 0, 0.772549, 1, 1,
0.07561046, 1.352332, 0.4737258, 0, 0.7647059, 1, 1,
0.08024174, -0.3454922, 2.247901, 0, 0.7607843, 1, 1,
0.08450784, 3.938635, 0.7436457, 0, 0.7529412, 1, 1,
0.08664974, -0.09865188, 1.9563, 0, 0.7490196, 1, 1,
0.08671825, 0.3465105, 1.378778, 0, 0.7411765, 1, 1,
0.09062037, -0.4057147, 4.449914, 0, 0.7372549, 1, 1,
0.09303892, 1.322024, -0.96904, 0, 0.7294118, 1, 1,
0.09492289, 2.271441, -0.9469282, 0, 0.7254902, 1, 1,
0.09950846, -0.4728756, 1.172851, 0, 0.7176471, 1, 1,
0.1054032, 1.359819, -0.04773801, 0, 0.7137255, 1, 1,
0.1056052, -0.3058513, 2.221192, 0, 0.7058824, 1, 1,
0.1145963, 0.2957337, 0.5461715, 0, 0.6980392, 1, 1,
0.1183839, -0.4134549, 2.724966, 0, 0.6941177, 1, 1,
0.1215759, 0.5792246, 1.226503, 0, 0.6862745, 1, 1,
0.1245205, 1.052162, 0.974892, 0, 0.682353, 1, 1,
0.1246015, 0.1147893, 0.07924741, 0, 0.6745098, 1, 1,
0.1276814, -0.886789, 3.376003, 0, 0.6705883, 1, 1,
0.1326376, 1.335297, 0.9406157, 0, 0.6627451, 1, 1,
0.1339346, -0.7077517, 1.879404, 0, 0.6588235, 1, 1,
0.1374601, -0.5771881, 2.22589, 0, 0.6509804, 1, 1,
0.1442606, 1.437889, -1.563239, 0, 0.6470588, 1, 1,
0.1457275, 0.5185335, -0.5321035, 0, 0.6392157, 1, 1,
0.149074, 0.4207507, 0.34202, 0, 0.6352941, 1, 1,
0.1504377, 1.679204, -0.7008291, 0, 0.627451, 1, 1,
0.1510347, -0.2675095, 2.93815, 0, 0.6235294, 1, 1,
0.1514841, -1.467128, 3.746746, 0, 0.6156863, 1, 1,
0.1634308, -0.6621144, 3.104645, 0, 0.6117647, 1, 1,
0.1669012, 0.4754729, -0.3561649, 0, 0.6039216, 1, 1,
0.1702245, 1.468893, 0.2007248, 0, 0.5960785, 1, 1,
0.1724555, -0.3620273, 3.855994, 0, 0.5921569, 1, 1,
0.1761185, 0.1322635, 3.181131, 0, 0.5843138, 1, 1,
0.1786096, 0.4414834, 1.493056, 0, 0.5803922, 1, 1,
0.1795936, 1.155702, -0.4378486, 0, 0.572549, 1, 1,
0.1876683, -1.065336, 2.567474, 0, 0.5686275, 1, 1,
0.1956359, -0.5739325, 4.344854, 0, 0.5607843, 1, 1,
0.1972797, -0.6214302, 3.021586, 0, 0.5568628, 1, 1,
0.2006362, -0.6836058, 2.052961, 0, 0.5490196, 1, 1,
0.2028006, 0.1949243, -0.5605046, 0, 0.5450981, 1, 1,
0.2031783, 0.4610612, 2.096578, 0, 0.5372549, 1, 1,
0.2090663, -1.054341, 2.834923, 0, 0.5333334, 1, 1,
0.2103428, 0.5484288, 0.7446238, 0, 0.5254902, 1, 1,
0.2135856, 0.1136898, 0.886295, 0, 0.5215687, 1, 1,
0.2137775, 1.861211, 0.1700298, 0, 0.5137255, 1, 1,
0.2180485, 0.1410161, 2.567781, 0, 0.509804, 1, 1,
0.2216578, 0.07220775, 1.239639, 0, 0.5019608, 1, 1,
0.2266008, 0.3599166, 1.126392, 0, 0.4941176, 1, 1,
0.227201, 0.4461752, -0.38992, 0, 0.4901961, 1, 1,
0.2317784, 1.260907, -1.131961, 0, 0.4823529, 1, 1,
0.2433719, -1.155841, 2.20665, 0, 0.4784314, 1, 1,
0.2434638, 1.559453, -1.422002, 0, 0.4705882, 1, 1,
0.2456444, -0.8143594, 3.260565, 0, 0.4666667, 1, 1,
0.2495763, 1.798498, 0.3597903, 0, 0.4588235, 1, 1,
0.25432, 0.4978668, 0.5952642, 0, 0.454902, 1, 1,
0.2561025, -0.8008153, 3.89867, 0, 0.4470588, 1, 1,
0.2610523, -0.8268933, 1.036149, 0, 0.4431373, 1, 1,
0.2625413, -0.7724335, 3.202508, 0, 0.4352941, 1, 1,
0.2631724, 2.2745, -0.2522313, 0, 0.4313726, 1, 1,
0.2634488, -1.121824, 4.570582, 0, 0.4235294, 1, 1,
0.2652998, 2.10905, -0.3896458, 0, 0.4196078, 1, 1,
0.2666306, -0.7046965, 4.295191, 0, 0.4117647, 1, 1,
0.2677316, 0.6863717, 0.2381657, 0, 0.4078431, 1, 1,
0.2679156, -0.03603498, -0.1050924, 0, 0.4, 1, 1,
0.2679175, -0.237429, 2.399839, 0, 0.3921569, 1, 1,
0.2688278, 1.885604, 0.4946928, 0, 0.3882353, 1, 1,
0.2696577, 0.4959498, 0.5136085, 0, 0.3803922, 1, 1,
0.2705656, 0.08399397, 2.086466, 0, 0.3764706, 1, 1,
0.2716785, -1.710061, 2.128007, 0, 0.3686275, 1, 1,
0.2721179, -0.9527236, 3.642964, 0, 0.3647059, 1, 1,
0.273349, 0.3736967, 1.4773, 0, 0.3568628, 1, 1,
0.2767159, -1.590956, 2.218642, 0, 0.3529412, 1, 1,
0.2796497, 0.234366, 2.077891, 0, 0.345098, 1, 1,
0.2833393, -1.216347, 1.149227, 0, 0.3411765, 1, 1,
0.2845126, 0.9278973, 1.477986, 0, 0.3333333, 1, 1,
0.2854218, 0.759553, -0.3548388, 0, 0.3294118, 1, 1,
0.2921159, -2.410076, 4.009086, 0, 0.3215686, 1, 1,
0.2923489, 0.70138, -0.3810506, 0, 0.3176471, 1, 1,
0.2931133, 1.270139, -0.1481439, 0, 0.3098039, 1, 1,
0.2941478, 2.195876, 1.196974, 0, 0.3058824, 1, 1,
0.2956041, -1.533187, 3.439826, 0, 0.2980392, 1, 1,
0.2965847, 2.02262, 1.394056, 0, 0.2901961, 1, 1,
0.2998125, 0.4495368, 2.413973, 0, 0.2862745, 1, 1,
0.2999251, 1.162464, -1.252078, 0, 0.2784314, 1, 1,
0.3010364, 0.2585311, -0.8404841, 0, 0.2745098, 1, 1,
0.303671, -0.4878796, 1.951204, 0, 0.2666667, 1, 1,
0.3042548, 0.9533921, 1.285023, 0, 0.2627451, 1, 1,
0.3071811, 0.2809215, -0.1975022, 0, 0.254902, 1, 1,
0.3099527, 0.0638364, 1.378501, 0, 0.2509804, 1, 1,
0.3118991, -0.6452909, 3.059444, 0, 0.2431373, 1, 1,
0.3167347, 1.298963, 0.6362776, 0, 0.2392157, 1, 1,
0.3236859, -1.098205, 2.378528, 0, 0.2313726, 1, 1,
0.3277355, 0.9247228, -0.4887376, 0, 0.227451, 1, 1,
0.3295097, -0.5547624, 4.058373, 0, 0.2196078, 1, 1,
0.330646, -0.2420708, 1.61301, 0, 0.2156863, 1, 1,
0.3320242, 0.2798883, 2.329195, 0, 0.2078431, 1, 1,
0.3383439, 0.3719439, 2.183967, 0, 0.2039216, 1, 1,
0.3415038, 1.174392, 0.9922844, 0, 0.1960784, 1, 1,
0.3425039, -0.06057439, 1.489024, 0, 0.1882353, 1, 1,
0.3437097, -0.06959915, 2.371252, 0, 0.1843137, 1, 1,
0.3471681, 1.794268, 0.2588809, 0, 0.1764706, 1, 1,
0.3522202, -0.05697448, 2.507859, 0, 0.172549, 1, 1,
0.3528861, -0.7867827, 2.320565, 0, 0.1647059, 1, 1,
0.3539017, -1.187205, 3.013875, 0, 0.1607843, 1, 1,
0.3553334, -0.5803477, 3.272058, 0, 0.1529412, 1, 1,
0.3560874, 1.07082, -0.1176331, 0, 0.1490196, 1, 1,
0.3565605, -2.535431, 4.557717, 0, 0.1411765, 1, 1,
0.3627819, -1.097297, 3.467107, 0, 0.1372549, 1, 1,
0.3637974, 0.9794379, 0.03575321, 0, 0.1294118, 1, 1,
0.3834307, -1.072693, 1.49747, 0, 0.1254902, 1, 1,
0.3874807, -0.9152997, 1.764038, 0, 0.1176471, 1, 1,
0.388834, 2.16219, -1.213118, 0, 0.1137255, 1, 1,
0.3900784, 2.379154, -1.412413, 0, 0.1058824, 1, 1,
0.3919494, -1.320796, 1.631632, 0, 0.09803922, 1, 1,
0.3928847, -0.4592805, 2.89251, 0, 0.09411765, 1, 1,
0.394351, 0.171737, 2.671164, 0, 0.08627451, 1, 1,
0.3954754, -0.02575022, 1.554157, 0, 0.08235294, 1, 1,
0.3966869, -1.017248, 3.147732, 0, 0.07450981, 1, 1,
0.3971669, 0.04215682, 0.8024043, 0, 0.07058824, 1, 1,
0.398582, -0.3174085, 1.88532, 0, 0.0627451, 1, 1,
0.4038407, 1.258002, -0.02055768, 0, 0.05882353, 1, 1,
0.4066052, -1.416821, 3.621084, 0, 0.05098039, 1, 1,
0.4069113, 2.217212, 0.07331777, 0, 0.04705882, 1, 1,
0.409373, 1.289398, 1.109584, 0, 0.03921569, 1, 1,
0.4159673, 0.9053985, -0.6582901, 0, 0.03529412, 1, 1,
0.4209605, -0.2574096, 2.324418, 0, 0.02745098, 1, 1,
0.4278848, 0.5895225, 1.194241, 0, 0.02352941, 1, 1,
0.4289185, 0.301905, 2.933247, 0, 0.01568628, 1, 1,
0.4291249, -0.4449604, 1.545931, 0, 0.01176471, 1, 1,
0.4363474, -0.03281638, 1.067459, 0, 0.003921569, 1, 1,
0.4369198, -0.5022977, 0.5094573, 0.003921569, 0, 1, 1,
0.4373473, -0.002139434, 0.5517011, 0.007843138, 0, 1, 1,
0.4375123, 1.056718, 0.9329897, 0.01568628, 0, 1, 1,
0.4389412, -1.97511, 3.907217, 0.01960784, 0, 1, 1,
0.4390861, 0.4904049, 0.2516536, 0.02745098, 0, 1, 1,
0.443999, 1.483346, -0.814299, 0.03137255, 0, 1, 1,
0.4479158, 0.1013906, 1.6599, 0.03921569, 0, 1, 1,
0.4567237, -0.4864807, 2.25077, 0.04313726, 0, 1, 1,
0.4658592, 2.326104, 1.280771, 0.05098039, 0, 1, 1,
0.4660419, -1.583997, 3.651422, 0.05490196, 0, 1, 1,
0.4662461, -0.4918414, 1.649556, 0.0627451, 0, 1, 1,
0.4667202, -1.069241, 2.808207, 0.06666667, 0, 1, 1,
0.4694248, -0.6679955, 1.832795, 0.07450981, 0, 1, 1,
0.4713341, -1.299613, 2.897985, 0.07843138, 0, 1, 1,
0.473961, 0.2329796, 2.210171, 0.08627451, 0, 1, 1,
0.4745088, 0.9848053, -1.323867, 0.09019608, 0, 1, 1,
0.475271, 1.65421, -1.340656, 0.09803922, 0, 1, 1,
0.4778951, -0.4798931, 1.635521, 0.1058824, 0, 1, 1,
0.4809415, 0.6990768, 0.7525605, 0.1098039, 0, 1, 1,
0.4818409, 0.3442758, 1.6657, 0.1176471, 0, 1, 1,
0.4831685, -1.469918, 2.119884, 0.1215686, 0, 1, 1,
0.4846679, -0.9483681, 2.898136, 0.1294118, 0, 1, 1,
0.4870665, 1.366471, -0.3842573, 0.1333333, 0, 1, 1,
0.4926688, -1.550905, 1.388005, 0.1411765, 0, 1, 1,
0.4940539, -0.4883173, 1.580838, 0.145098, 0, 1, 1,
0.5015035, -0.1453895, 1.774854, 0.1529412, 0, 1, 1,
0.5032576, -0.8684705, 3.239503, 0.1568628, 0, 1, 1,
0.5042291, -0.4159534, 2.274527, 0.1647059, 0, 1, 1,
0.5056381, 0.9447241, 1.977564, 0.1686275, 0, 1, 1,
0.5161382, -0.6576015, 3.484732, 0.1764706, 0, 1, 1,
0.5197369, -0.1951471, 2.348747, 0.1803922, 0, 1, 1,
0.5272331, -0.3202882, 0.7326342, 0.1882353, 0, 1, 1,
0.5275058, 0.3341292, 2.044211, 0.1921569, 0, 1, 1,
0.5350738, 1.327275, -1.285627, 0.2, 0, 1, 1,
0.5350774, 0.9004235, -0.6509665, 0.2078431, 0, 1, 1,
0.5413895, -1.942808, 2.688648, 0.2117647, 0, 1, 1,
0.5431264, -0.3733739, 2.309483, 0.2196078, 0, 1, 1,
0.5451856, 1.167627, 3.006932, 0.2235294, 0, 1, 1,
0.5455269, -0.9636497, 2.205464, 0.2313726, 0, 1, 1,
0.5520339, 0.7040399, 0.7211452, 0.2352941, 0, 1, 1,
0.5531865, -0.3866136, 1.060065, 0.2431373, 0, 1, 1,
0.5536953, -0.3424484, 2.174156, 0.2470588, 0, 1, 1,
0.5559037, 0.05059577, 0.6476763, 0.254902, 0, 1, 1,
0.5596097, 1.433634, -0.3298488, 0.2588235, 0, 1, 1,
0.560322, -1.263229, 2.708981, 0.2666667, 0, 1, 1,
0.5616835, -2.35204, 5.173899, 0.2705882, 0, 1, 1,
0.5647315, 1.746513, -0.8529896, 0.2784314, 0, 1, 1,
0.5654088, 0.974315, 0.2029736, 0.282353, 0, 1, 1,
0.5717846, -0.4462082, 1.999699, 0.2901961, 0, 1, 1,
0.5734833, -0.8409666, 2.903838, 0.2941177, 0, 1, 1,
0.5740603, 0.6202657, 1.214349, 0.3019608, 0, 1, 1,
0.5776044, -0.9435252, 2.560015, 0.3098039, 0, 1, 1,
0.5982031, -0.5283735, 1.947822, 0.3137255, 0, 1, 1,
0.5992396, -0.5510744, 2.019226, 0.3215686, 0, 1, 1,
0.6011751, -1.109316, 1.809682, 0.3254902, 0, 1, 1,
0.6030304, -0.9926417, 2.883377, 0.3333333, 0, 1, 1,
0.6069692, -1.564909, 3.327898, 0.3372549, 0, 1, 1,
0.6082385, 0.7306917, -0.9947001, 0.345098, 0, 1, 1,
0.6098822, 0.1442737, 0.8238444, 0.3490196, 0, 1, 1,
0.6151435, 0.8957756, 2.826987, 0.3568628, 0, 1, 1,
0.6163192, -0.9769598, 1.557685, 0.3607843, 0, 1, 1,
0.6181942, 0.0560697, 1.0093, 0.3686275, 0, 1, 1,
0.6213467, 0.5810093, 1.220348, 0.372549, 0, 1, 1,
0.6319567, 0.9824542, 0.3207902, 0.3803922, 0, 1, 1,
0.6361032, -1.237368, 3.240334, 0.3843137, 0, 1, 1,
0.6399376, -1.669576, 2.258998, 0.3921569, 0, 1, 1,
0.6415952, -0.05346697, 2.699275, 0.3960784, 0, 1, 1,
0.6420066, -1.290168, 2.412835, 0.4039216, 0, 1, 1,
0.6462767, 1.676388, 1.417025, 0.4117647, 0, 1, 1,
0.6474628, -0.7490066, -0.4025138, 0.4156863, 0, 1, 1,
0.6484745, -0.8665641, 1.865294, 0.4235294, 0, 1, 1,
0.6543386, -0.6521502, 2.099825, 0.427451, 0, 1, 1,
0.6654944, 1.285174, 0.2868772, 0.4352941, 0, 1, 1,
0.6659963, -0.6732066, 2.738965, 0.4392157, 0, 1, 1,
0.6668015, -0.8706915, 1.806941, 0.4470588, 0, 1, 1,
0.6684122, -0.3955053, 1.374005, 0.4509804, 0, 1, 1,
0.6724439, -0.8840548, 3.924952, 0.4588235, 0, 1, 1,
0.674061, -1.149038, 1.8925, 0.4627451, 0, 1, 1,
0.6764252, -1.00042, 3.244395, 0.4705882, 0, 1, 1,
0.6825854, -0.8114052, 4.166143, 0.4745098, 0, 1, 1,
0.6843722, 0.2388193, 1.988407, 0.4823529, 0, 1, 1,
0.6912304, -2.205452, 2.495317, 0.4862745, 0, 1, 1,
0.6936925, 0.5362885, 3.365825, 0.4941176, 0, 1, 1,
0.6938993, 0.1452229, 2.779578, 0.5019608, 0, 1, 1,
0.6953509, -1.656955, 2.535758, 0.5058824, 0, 1, 1,
0.6958495, -0.5959913, 1.052068, 0.5137255, 0, 1, 1,
0.700301, -0.7517748, 2.714838, 0.5176471, 0, 1, 1,
0.7007382, -0.6051227, 1.635862, 0.5254902, 0, 1, 1,
0.7036717, -0.654713, 2.457409, 0.5294118, 0, 1, 1,
0.7057153, -1.44915, 1.582805, 0.5372549, 0, 1, 1,
0.7072607, -0.1176905, 1.231023, 0.5411765, 0, 1, 1,
0.7081049, 1.178962, 1.113287, 0.5490196, 0, 1, 1,
0.7110205, -0.5654788, 0.7163976, 0.5529412, 0, 1, 1,
0.7162755, -1.229248, 3.597554, 0.5607843, 0, 1, 1,
0.7168799, -0.4557883, 2.289559, 0.5647059, 0, 1, 1,
0.7173784, -0.1993824, 2.571351, 0.572549, 0, 1, 1,
0.7188339, -0.9044459, 1.894759, 0.5764706, 0, 1, 1,
0.7226961, -1.458983, 2.704104, 0.5843138, 0, 1, 1,
0.7236451, -1.536683, 1.395088, 0.5882353, 0, 1, 1,
0.7265036, 1.059873, -0.06581043, 0.5960785, 0, 1, 1,
0.7327445, -1.152778, 3.854751, 0.6039216, 0, 1, 1,
0.7346527, -0.844199, 1.743942, 0.6078432, 0, 1, 1,
0.7359885, -0.3188047, 2.088822, 0.6156863, 0, 1, 1,
0.743353, 0.07945532, 0.8533378, 0.6196079, 0, 1, 1,
0.7444322, -0.3019806, 1.239181, 0.627451, 0, 1, 1,
0.7467238, -0.5707155, -0.08746735, 0.6313726, 0, 1, 1,
0.7469355, -1.209589, 4.179327, 0.6392157, 0, 1, 1,
0.747116, -0.07554072, 2.169928, 0.6431373, 0, 1, 1,
0.7488762, 1.452309, -1.442642, 0.6509804, 0, 1, 1,
0.7606289, 0.1000864, -0.1117438, 0.654902, 0, 1, 1,
0.764008, -0.4408442, 1.960159, 0.6627451, 0, 1, 1,
0.7652034, -1.845206, 2.783056, 0.6666667, 0, 1, 1,
0.768714, 1.532887, -1.420345, 0.6745098, 0, 1, 1,
0.7871587, 0.7127274, 1.243355, 0.6784314, 0, 1, 1,
0.7914209, -1.031618, 1.238001, 0.6862745, 0, 1, 1,
0.7937843, 0.3823797, 2.459114, 0.6901961, 0, 1, 1,
0.7944322, 0.6383515, 0.2229866, 0.6980392, 0, 1, 1,
0.7944506, -0.1834825, -0.2706887, 0.7058824, 0, 1, 1,
0.7946401, -0.2968846, 1.733622, 0.7098039, 0, 1, 1,
0.7946841, 0.0298146, 1.986592, 0.7176471, 0, 1, 1,
0.7959046, -0.7817047, 2.929281, 0.7215686, 0, 1, 1,
0.796486, 0.429688, 0.372261, 0.7294118, 0, 1, 1,
0.8015651, -1.288135, 1.982954, 0.7333333, 0, 1, 1,
0.8109717, 0.2210451, 2.881262, 0.7411765, 0, 1, 1,
0.811915, -0.2894236, 2.247897, 0.7450981, 0, 1, 1,
0.812824, -0.0003748458, 2.594558, 0.7529412, 0, 1, 1,
0.8131694, -0.2677278, 1.814735, 0.7568628, 0, 1, 1,
0.8189917, 0.7198464, -0.0188203, 0.7647059, 0, 1, 1,
0.8235186, 1.31588, -0.2290673, 0.7686275, 0, 1, 1,
0.8259254, 0.7334539, 0.9122432, 0.7764706, 0, 1, 1,
0.8296471, 0.0093752, 0.9459754, 0.7803922, 0, 1, 1,
0.829704, 0.48632, 2.725188, 0.7882353, 0, 1, 1,
0.8302229, 0.4527852, 2.773769, 0.7921569, 0, 1, 1,
0.8317603, 0.04778152, 2.078523, 0.8, 0, 1, 1,
0.8324574, -0.7824782, 2.112113, 0.8078431, 0, 1, 1,
0.8362242, 0.8789287, 1.738389, 0.8117647, 0, 1, 1,
0.8376958, 0.1788518, 2.749108, 0.8196079, 0, 1, 1,
0.8511684, -0.1675092, 3.967552, 0.8235294, 0, 1, 1,
0.8559768, -1.135253, 3.072218, 0.8313726, 0, 1, 1,
0.8592113, -1.001278, 0.9004765, 0.8352941, 0, 1, 1,
0.8694995, -0.3595009, 2.295998, 0.8431373, 0, 1, 1,
0.8727493, 0.9280862, -0.4347335, 0.8470588, 0, 1, 1,
0.8727692, 0.9402909, -1.306323, 0.854902, 0, 1, 1,
0.8738819, -0.5534175, 1.877339, 0.8588235, 0, 1, 1,
0.8765696, 0.3900205, 1.408877, 0.8666667, 0, 1, 1,
0.87756, -0.1611947, 1.456416, 0.8705882, 0, 1, 1,
0.8786005, -0.3493828, 1.684012, 0.8784314, 0, 1, 1,
0.8819169, -0.01996074, 0.8357824, 0.8823529, 0, 1, 1,
0.8868387, -1.13065, 2.147057, 0.8901961, 0, 1, 1,
0.8878553, -0.6951376, 3.807865, 0.8941177, 0, 1, 1,
0.8913254, 0.4189155, 1.216733, 0.9019608, 0, 1, 1,
0.8929563, 0.5909738, 1.479524, 0.9098039, 0, 1, 1,
0.8950673, -2.030596, 3.870918, 0.9137255, 0, 1, 1,
0.8990928, -0.2896722, 2.733617, 0.9215686, 0, 1, 1,
0.9023972, 0.9949085, 1.503209, 0.9254902, 0, 1, 1,
0.9060993, -0.3727228, 2.164622, 0.9333333, 0, 1, 1,
0.9213429, 0.08442525, 2.028021, 0.9372549, 0, 1, 1,
0.9325545, 0.671791, 0.3003844, 0.945098, 0, 1, 1,
0.937581, 0.6198987, 1.330169, 0.9490196, 0, 1, 1,
0.9386459, 1.487629, 2.416151, 0.9568627, 0, 1, 1,
0.9395254, -2.495662, 2.624481, 0.9607843, 0, 1, 1,
0.9482815, 0.2516542, 1.869022, 0.9686275, 0, 1, 1,
0.951795, 0.6844934, 0.3025011, 0.972549, 0, 1, 1,
0.9530525, 0.6148161, -0.2244599, 0.9803922, 0, 1, 1,
0.9576036, 1.147535, -1.444289, 0.9843137, 0, 1, 1,
0.9585692, -1.253574, 2.990491, 0.9921569, 0, 1, 1,
0.9592162, -0.1407426, 1.535687, 0.9960784, 0, 1, 1,
0.9625298, 0.00330172, 0.7230533, 1, 0, 0.9960784, 1,
0.963812, 1.520732, 0.01011004, 1, 0, 0.9882353, 1,
0.9701309, 1.065352, 1.233709, 1, 0, 0.9843137, 1,
0.9714624, -0.9474404, 1.581941, 1, 0, 0.9764706, 1,
0.9883819, 0.8856612, 0.1645838, 1, 0, 0.972549, 1,
0.9889802, -0.7602941, 1.868131, 1, 0, 0.9647059, 1,
0.9936333, -0.6022632, 3.623036, 1, 0, 0.9607843, 1,
1.009734, -0.1104831, 1.935733, 1, 0, 0.9529412, 1,
1.013335, 0.1778073, 0.6774328, 1, 0, 0.9490196, 1,
1.01663, 0.9951792, -1.046286, 1, 0, 0.9411765, 1,
1.016725, 1.226656, 1.661345, 1, 0, 0.9372549, 1,
1.024507, 0.3152362, 1.133118, 1, 0, 0.9294118, 1,
1.033925, -0.879564, 2.744054, 1, 0, 0.9254902, 1,
1.034344, -0.7946948, 2.849516, 1, 0, 0.9176471, 1,
1.039148, 0.4125652, 0.79672, 1, 0, 0.9137255, 1,
1.039546, -1.09149, 2.211349, 1, 0, 0.9058824, 1,
1.046348, -0.274538, -0.3686389, 1, 0, 0.9019608, 1,
1.056035, -0.8266257, 1.057773, 1, 0, 0.8941177, 1,
1.056109, -1.754459, 0.6641583, 1, 0, 0.8862745, 1,
1.05704, -0.3912451, -0.2824078, 1, 0, 0.8823529, 1,
1.058987, 0.3056395, 1.541543, 1, 0, 0.8745098, 1,
1.068186, -0.3822036, 0.9975784, 1, 0, 0.8705882, 1,
1.072797, 0.962598, 0.8432307, 1, 0, 0.8627451, 1,
1.087224, -0.2760133, 1.167394, 1, 0, 0.8588235, 1,
1.090154, 0.3709395, 0.9388739, 1, 0, 0.8509804, 1,
1.093267, -1.356223, 2.574797, 1, 0, 0.8470588, 1,
1.097381, 0.243487, -0.07642808, 1, 0, 0.8392157, 1,
1.099188, 0.4832748, 1.225766, 1, 0, 0.8352941, 1,
1.099423, 1.31629, 1.069589, 1, 0, 0.827451, 1,
1.120448, 0.9594662, 0.6186869, 1, 0, 0.8235294, 1,
1.122178, -0.08910604, -0.466874, 1, 0, 0.8156863, 1,
1.124475, -0.519547, 2.497874, 1, 0, 0.8117647, 1,
1.126317, 0.01841344, 0.3499247, 1, 0, 0.8039216, 1,
1.128171, 0.4887416, 0.8152379, 1, 0, 0.7960784, 1,
1.137846, 0.7619606, -0.2801875, 1, 0, 0.7921569, 1,
1.143298, 0.9990788, -0.8809564, 1, 0, 0.7843137, 1,
1.146023, 0.2659719, 2.694342, 1, 0, 0.7803922, 1,
1.146311, 1.726409, 1.490067, 1, 0, 0.772549, 1,
1.146803, -0.3600491, 0.9535311, 1, 0, 0.7686275, 1,
1.147142, 0.5278681, 0.5200484, 1, 0, 0.7607843, 1,
1.15494, 0.4562577, -0.7999281, 1, 0, 0.7568628, 1,
1.156335, 1.707254, 0.1168519, 1, 0, 0.7490196, 1,
1.174005, 0.8026755, 0.08159053, 1, 0, 0.7450981, 1,
1.175608, -1.092883, 2.217956, 1, 0, 0.7372549, 1,
1.189646, -0.08991082, 1.460139, 1, 0, 0.7333333, 1,
1.206071, -0.9992144, 1.08151, 1, 0, 0.7254902, 1,
1.206333, 0.8218675, 2.026101, 1, 0, 0.7215686, 1,
1.211073, -0.5374689, 1.554287, 1, 0, 0.7137255, 1,
1.215209, 0.7196484, 1.551737, 1, 0, 0.7098039, 1,
1.216863, -0.2265304, 1.6025, 1, 0, 0.7019608, 1,
1.218071, -0.9675562, 2.269786, 1, 0, 0.6941177, 1,
1.219746, -0.8482262, -0.0312856, 1, 0, 0.6901961, 1,
1.222874, -1.118078, 3.041307, 1, 0, 0.682353, 1,
1.228391, 0.2232948, 0.02113433, 1, 0, 0.6784314, 1,
1.230191, -1.557914, 1.517298, 1, 0, 0.6705883, 1,
1.233055, -1.264185, 2.233673, 1, 0, 0.6666667, 1,
1.233878, 0.3470135, 2.512544, 1, 0, 0.6588235, 1,
1.237105, 1.717804, -0.4539986, 1, 0, 0.654902, 1,
1.238357, -0.2833127, 0.5830462, 1, 0, 0.6470588, 1,
1.249725, -0.2218717, 1.054848, 1, 0, 0.6431373, 1,
1.257829, 0.09421927, 1.396408, 1, 0, 0.6352941, 1,
1.260086, -0.1561446, 3.191294, 1, 0, 0.6313726, 1,
1.26903, -0.425691, 2.471161, 1, 0, 0.6235294, 1,
1.270181, -0.5674278, 2.512955, 1, 0, 0.6196079, 1,
1.282523, 0.4353093, 1.871839, 1, 0, 0.6117647, 1,
1.282985, 0.480866, 1.514378, 1, 0, 0.6078432, 1,
1.285507, 0.6197317, 1.963617, 1, 0, 0.6, 1,
1.289786, 1.033202, 0.8207949, 1, 0, 0.5921569, 1,
1.292086, -0.1198634, 3.667628, 1, 0, 0.5882353, 1,
1.292448, -1.837313, 2.313915, 1, 0, 0.5803922, 1,
1.29293, -0.1879001, 2.430864, 1, 0, 0.5764706, 1,
1.293849, 2.053596, 1.258106, 1, 0, 0.5686275, 1,
1.296405, 2.304381, 3.452988, 1, 0, 0.5647059, 1,
1.314766, -0.07404665, 3.322986, 1, 0, 0.5568628, 1,
1.318093, -1.874554, 3.158723, 1, 0, 0.5529412, 1,
1.319258, -0.8076571, 1.185518, 1, 0, 0.5450981, 1,
1.322799, 1.230957, 0.1190186, 1, 0, 0.5411765, 1,
1.334864, 0.5507999, 2.111623, 1, 0, 0.5333334, 1,
1.337579, -0.5465626, 2.459383, 1, 0, 0.5294118, 1,
1.352831, 0.4480502, 1.952586, 1, 0, 0.5215687, 1,
1.356609, -0.1813095, -0.3181984, 1, 0, 0.5176471, 1,
1.360403, -0.1925287, 2.409479, 1, 0, 0.509804, 1,
1.360438, -0.5527015, 0.3925256, 1, 0, 0.5058824, 1,
1.36305, -0.8495464, 3.03549, 1, 0, 0.4980392, 1,
1.370698, -0.9101793, 0.9511223, 1, 0, 0.4901961, 1,
1.372549, 2.263641, 0.1866897, 1, 0, 0.4862745, 1,
1.381215, -0.3476993, 0.9758617, 1, 0, 0.4784314, 1,
1.381573, 0.06566516, -0.2911003, 1, 0, 0.4745098, 1,
1.384559, 0.3623949, -0.1770063, 1, 0, 0.4666667, 1,
1.39517, 0.3517799, 0.1618246, 1, 0, 0.4627451, 1,
1.395533, 2.247949, 0.7764803, 1, 0, 0.454902, 1,
1.397662, 0.3307666, 0.5197629, 1, 0, 0.4509804, 1,
1.412275, 0.3177288, -0.03395028, 1, 0, 0.4431373, 1,
1.413643, 1.984167, 3.954815, 1, 0, 0.4392157, 1,
1.426502, 0.01174958, 1.277125, 1, 0, 0.4313726, 1,
1.431055, 1.818515, 1.816084, 1, 0, 0.427451, 1,
1.433152, 1.583853, -0.9468017, 1, 0, 0.4196078, 1,
1.434937, -0.01876197, -0.3551189, 1, 0, 0.4156863, 1,
1.445515, 0.6683518, 2.999475, 1, 0, 0.4078431, 1,
1.445533, 1.013784, 0.7790888, 1, 0, 0.4039216, 1,
1.453078, 1.297638, 2.894578, 1, 0, 0.3960784, 1,
1.455714, 0.3536083, 0.3308679, 1, 0, 0.3882353, 1,
1.461377, 0.7718646, 0.7743182, 1, 0, 0.3843137, 1,
1.48198, -0.7149305, 1.467317, 1, 0, 0.3764706, 1,
1.493964, 0.3565745, 1.980158, 1, 0, 0.372549, 1,
1.494128, -1.109984, 1.907015, 1, 0, 0.3647059, 1,
1.497462, -0.7671365, 5.380854, 1, 0, 0.3607843, 1,
1.523035, -0.9557917, 2.257991, 1, 0, 0.3529412, 1,
1.523542, -0.5077703, 1.190364, 1, 0, 0.3490196, 1,
1.530853, -0.04575802, 0.7942314, 1, 0, 0.3411765, 1,
1.560593, 0.2125884, 0.09184711, 1, 0, 0.3372549, 1,
1.561332, 0.1787371, 3.035325, 1, 0, 0.3294118, 1,
1.567122, 0.2752692, 1.660039, 1, 0, 0.3254902, 1,
1.58421, -0.7751101, 2.15812, 1, 0, 0.3176471, 1,
1.585383, 0.1463964, 0.8008619, 1, 0, 0.3137255, 1,
1.58681, 0.1488694, 3.030039, 1, 0, 0.3058824, 1,
1.600051, -1.200729, 2.272279, 1, 0, 0.2980392, 1,
1.603037, 1.119595, 0.243312, 1, 0, 0.2941177, 1,
1.612048, 0.1291514, 0.9390784, 1, 0, 0.2862745, 1,
1.612832, 0.3937857, 1.438502, 1, 0, 0.282353, 1,
1.613282, 0.1602496, 1.108983, 1, 0, 0.2745098, 1,
1.616076, 0.1826354, 1.569791, 1, 0, 0.2705882, 1,
1.627019, 0.4181064, 2.684917, 1, 0, 0.2627451, 1,
1.63121, -1.593406, 2.299991, 1, 0, 0.2588235, 1,
1.63839, 1.015578, -1.202948, 1, 0, 0.2509804, 1,
1.63892, 1.013225, 1.332953, 1, 0, 0.2470588, 1,
1.647324, -0.2625883, 3.49443, 1, 0, 0.2392157, 1,
1.662639, 0.5344279, 1.678899, 1, 0, 0.2352941, 1,
1.662781, 0.4879128, 0.9031045, 1, 0, 0.227451, 1,
1.665602, -0.3461618, 0.04328027, 1, 0, 0.2235294, 1,
1.678099, 0.08124615, 0.7701862, 1, 0, 0.2156863, 1,
1.753723, 0.5767871, 1.080074, 1, 0, 0.2117647, 1,
1.75437, 1.598618, -0.03939204, 1, 0, 0.2039216, 1,
1.758036, -2.202725, 1.04529, 1, 0, 0.1960784, 1,
1.766396, -0.3810624, 2.649477, 1, 0, 0.1921569, 1,
1.783894, -0.627437, 2.060022, 1, 0, 0.1843137, 1,
1.799842, 1.442082, 1.503401, 1, 0, 0.1803922, 1,
1.799949, -0.5792307, 2.876074, 1, 0, 0.172549, 1,
1.801477, -0.5162653, 0.8981759, 1, 0, 0.1686275, 1,
1.821936, -1.509856, 3.705784, 1, 0, 0.1607843, 1,
1.831858, 0.4680638, -0.1932561, 1, 0, 0.1568628, 1,
1.840084, 1.4082, 0.4134625, 1, 0, 0.1490196, 1,
1.840549, 0.8041939, 0.7707401, 1, 0, 0.145098, 1,
1.868563, 1.688005, -0.1054744, 1, 0, 0.1372549, 1,
1.871298, 0.4126563, 1.225422, 1, 0, 0.1333333, 1,
1.877384, -0.8090941, 1.698531, 1, 0, 0.1254902, 1,
1.916752, 0.176195, 1.559434, 1, 0, 0.1215686, 1,
1.917307, -0.5246186, 2.326103, 1, 0, 0.1137255, 1,
1.930941, -0.728676, -0.1530039, 1, 0, 0.1098039, 1,
1.952408, -0.4843383, 1.045657, 1, 0, 0.1019608, 1,
1.989754, 0.6953045, 2.17585, 1, 0, 0.09411765, 1,
2.002895, -0.7979137, 2.66358, 1, 0, 0.09019608, 1,
2.045752, 1.090382, 0.04567175, 1, 0, 0.08235294, 1,
2.046386, -0.4017258, 1.356522, 1, 0, 0.07843138, 1,
2.112083, -0.6685117, 2.788249, 1, 0, 0.07058824, 1,
2.117064, -1.013625, 1.085414, 1, 0, 0.06666667, 1,
2.17045, -0.3121178, 1.944934, 1, 0, 0.05882353, 1,
2.190245, 0.577527, 1.282243, 1, 0, 0.05490196, 1,
2.196542, -1.891302, 2.188421, 1, 0, 0.04705882, 1,
2.318102, -1.014373, 1.984588, 1, 0, 0.04313726, 1,
2.336383, -0.6621215, 1.690913, 1, 0, 0.03529412, 1,
2.391834, -0.9907477, 2.899987, 1, 0, 0.03137255, 1,
2.46533, -0.7438788, 0.4177381, 1, 0, 0.02352941, 1,
2.538194, 0.2561992, 0.1954123, 1, 0, 0.01960784, 1,
2.837896, 0.3551892, -0.763029, 1, 0, 0.01176471, 1,
3.379611, 2.730566, 3.205957, 1, 0, 0.007843138, 1
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
0.1313571, -4.429235, -6.713891, 0, -0.5, 0.5, 0.5,
0.1313571, -4.429235, -6.713891, 1, -0.5, 0.5, 0.5,
0.1313571, -4.429235, -6.713891, 1, 1.5, 0.5, 0.5,
0.1313571, -4.429235, -6.713891, 0, 1.5, 0.5, 0.5
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
-4.218056, 0.3610933, -6.713891, 0, -0.5, 0.5, 0.5,
-4.218056, 0.3610933, -6.713891, 1, -0.5, 0.5, 0.5,
-4.218056, 0.3610933, -6.713891, 1, 1.5, 0.5, 0.5,
-4.218056, 0.3610933, -6.713891, 0, 1.5, 0.5, 0.5
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
-4.218056, -4.429235, 0.2099497, 0, -0.5, 0.5, 0.5,
-4.218056, -4.429235, 0.2099497, 1, -0.5, 0.5, 0.5,
-4.218056, -4.429235, 0.2099497, 1, 1.5, 0.5, 0.5,
-4.218056, -4.429235, 0.2099497, 0, 1.5, 0.5, 0.5
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
-3, -3.323775, -5.116081,
3, -3.323775, -5.116081,
-3, -3.323775, -5.116081,
-3, -3.508018, -5.382383,
-2, -3.323775, -5.116081,
-2, -3.508018, -5.382383,
-1, -3.323775, -5.116081,
-1, -3.508018, -5.382383,
0, -3.323775, -5.116081,
0, -3.508018, -5.382383,
1, -3.323775, -5.116081,
1, -3.508018, -5.382383,
2, -3.323775, -5.116081,
2, -3.508018, -5.382383,
3, -3.323775, -5.116081,
3, -3.508018, -5.382383
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
-3, -3.876505, -5.914986, 0, -0.5, 0.5, 0.5,
-3, -3.876505, -5.914986, 1, -0.5, 0.5, 0.5,
-3, -3.876505, -5.914986, 1, 1.5, 0.5, 0.5,
-3, -3.876505, -5.914986, 0, 1.5, 0.5, 0.5,
-2, -3.876505, -5.914986, 0, -0.5, 0.5, 0.5,
-2, -3.876505, -5.914986, 1, -0.5, 0.5, 0.5,
-2, -3.876505, -5.914986, 1, 1.5, 0.5, 0.5,
-2, -3.876505, -5.914986, 0, 1.5, 0.5, 0.5,
-1, -3.876505, -5.914986, 0, -0.5, 0.5, 0.5,
-1, -3.876505, -5.914986, 1, -0.5, 0.5, 0.5,
-1, -3.876505, -5.914986, 1, 1.5, 0.5, 0.5,
-1, -3.876505, -5.914986, 0, 1.5, 0.5, 0.5,
0, -3.876505, -5.914986, 0, -0.5, 0.5, 0.5,
0, -3.876505, -5.914986, 1, -0.5, 0.5, 0.5,
0, -3.876505, -5.914986, 1, 1.5, 0.5, 0.5,
0, -3.876505, -5.914986, 0, 1.5, 0.5, 0.5,
1, -3.876505, -5.914986, 0, -0.5, 0.5, 0.5,
1, -3.876505, -5.914986, 1, -0.5, 0.5, 0.5,
1, -3.876505, -5.914986, 1, 1.5, 0.5, 0.5,
1, -3.876505, -5.914986, 0, 1.5, 0.5, 0.5,
2, -3.876505, -5.914986, 0, -0.5, 0.5, 0.5,
2, -3.876505, -5.914986, 1, -0.5, 0.5, 0.5,
2, -3.876505, -5.914986, 1, 1.5, 0.5, 0.5,
2, -3.876505, -5.914986, 0, 1.5, 0.5, 0.5,
3, -3.876505, -5.914986, 0, -0.5, 0.5, 0.5,
3, -3.876505, -5.914986, 1, -0.5, 0.5, 0.5,
3, -3.876505, -5.914986, 1, 1.5, 0.5, 0.5,
3, -3.876505, -5.914986, 0, 1.5, 0.5, 0.5
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
-3.214345, -2, -5.116081,
-3.214345, 2, -5.116081,
-3.214345, -2, -5.116081,
-3.38163, -2, -5.382383,
-3.214345, 0, -5.116081,
-3.38163, 0, -5.382383,
-3.214345, 2, -5.116081,
-3.38163, 2, -5.382383
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
"0",
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
-3.7162, -2, -5.914986, 0, -0.5, 0.5, 0.5,
-3.7162, -2, -5.914986, 1, -0.5, 0.5, 0.5,
-3.7162, -2, -5.914986, 1, 1.5, 0.5, 0.5,
-3.7162, -2, -5.914986, 0, 1.5, 0.5, 0.5,
-3.7162, 0, -5.914986, 0, -0.5, 0.5, 0.5,
-3.7162, 0, -5.914986, 1, -0.5, 0.5, 0.5,
-3.7162, 0, -5.914986, 1, 1.5, 0.5, 0.5,
-3.7162, 0, -5.914986, 0, 1.5, 0.5, 0.5,
-3.7162, 2, -5.914986, 0, -0.5, 0.5, 0.5,
-3.7162, 2, -5.914986, 1, -0.5, 0.5, 0.5,
-3.7162, 2, -5.914986, 1, 1.5, 0.5, 0.5,
-3.7162, 2, -5.914986, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.214345, -3.323775, -4,
-3.214345, -3.323775, 4,
-3.214345, -3.323775, -4,
-3.38163, -3.508018, -4,
-3.214345, -3.323775, -2,
-3.38163, -3.508018, -2,
-3.214345, -3.323775, 0,
-3.38163, -3.508018, 0,
-3.214345, -3.323775, 2,
-3.38163, -3.508018, 2,
-3.214345, -3.323775, 4,
-3.38163, -3.508018, 4
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
-3.7162, -3.876505, -4, 0, -0.5, 0.5, 0.5,
-3.7162, -3.876505, -4, 1, -0.5, 0.5, 0.5,
-3.7162, -3.876505, -4, 1, 1.5, 0.5, 0.5,
-3.7162, -3.876505, -4, 0, 1.5, 0.5, 0.5,
-3.7162, -3.876505, -2, 0, -0.5, 0.5, 0.5,
-3.7162, -3.876505, -2, 1, -0.5, 0.5, 0.5,
-3.7162, -3.876505, -2, 1, 1.5, 0.5, 0.5,
-3.7162, -3.876505, -2, 0, 1.5, 0.5, 0.5,
-3.7162, -3.876505, 0, 0, -0.5, 0.5, 0.5,
-3.7162, -3.876505, 0, 1, -0.5, 0.5, 0.5,
-3.7162, -3.876505, 0, 1, 1.5, 0.5, 0.5,
-3.7162, -3.876505, 0, 0, 1.5, 0.5, 0.5,
-3.7162, -3.876505, 2, 0, -0.5, 0.5, 0.5,
-3.7162, -3.876505, 2, 1, -0.5, 0.5, 0.5,
-3.7162, -3.876505, 2, 1, 1.5, 0.5, 0.5,
-3.7162, -3.876505, 2, 0, 1.5, 0.5, 0.5,
-3.7162, -3.876505, 4, 0, -0.5, 0.5, 0.5,
-3.7162, -3.876505, 4, 1, -0.5, 0.5, 0.5,
-3.7162, -3.876505, 4, 1, 1.5, 0.5, 0.5,
-3.7162, -3.876505, 4, 0, 1.5, 0.5, 0.5
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
-3.214345, -3.323775, -5.116081,
-3.214345, 4.045961, -5.116081,
-3.214345, -3.323775, 5.535981,
-3.214345, 4.045961, 5.535981,
-3.214345, -3.323775, -5.116081,
-3.214345, -3.323775, 5.535981,
-3.214345, 4.045961, -5.116081,
-3.214345, 4.045961, 5.535981,
-3.214345, -3.323775, -5.116081,
3.477059, -3.323775, -5.116081,
-3.214345, -3.323775, 5.535981,
3.477059, -3.323775, 5.535981,
-3.214345, 4.045961, -5.116081,
3.477059, 4.045961, -5.116081,
-3.214345, 4.045961, 5.535981,
3.477059, 4.045961, 5.535981,
3.477059, -3.323775, -5.116081,
3.477059, 4.045961, -5.116081,
3.477059, -3.323775, 5.535981,
3.477059, 4.045961, 5.535981,
3.477059, -3.323775, -5.116081,
3.477059, -3.323775, 5.535981,
3.477059, 4.045961, -5.116081,
3.477059, 4.045961, 5.535981
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
var radius = 7.785033;
var distance = 34.63649;
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
mvMatrix.translate( -0.1313571, -0.3610933, -0.2099497 );
mvMatrix.scale( 1.257932, 1.142148, 0.7902066 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.63649);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
sodium_3-acetyl-6-me<-read.table("sodium_3-acetyl-6-me.xyz", skip=1)
```

```
## Error in read.table("sodium_3-acetyl-6-me.xyz", skip = 1): duplicate 'row.names' are not allowed
```

```r
x<-sodium_3-acetyl-6-me$V2
```

```
## Error in eval(expr, envir, enclos): object 'sodium_3' not found
```

```r
y<-sodium_3-acetyl-6-me$V3
```

```
## Error in eval(expr, envir, enclos): object 'sodium_3' not found
```

```r
z<-sodium_3-acetyl-6-me$V4
```

```
## Error in eval(expr, envir, enclos): object 'sodium_3' not found
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
-3.116897, 1.348787, -2.315863, 0, 0, 1, 1, 1,
-2.848997, 0.3053451, 0.04482643, 1, 0, 0, 1, 1,
-2.752587, -1.083859, -2.224641, 1, 0, 0, 1, 1,
-2.520326, -1.431148, -1.63935, 1, 0, 0, 1, 1,
-2.373143, 0.3516365, -2.444131, 1, 0, 0, 1, 1,
-2.252517, 0.91189, -1.283563, 1, 0, 0, 1, 1,
-2.247844, 1.372421, -1.692029, 0, 0, 0, 1, 1,
-2.155082, 0.2845557, -2.110301, 0, 0, 0, 1, 1,
-2.137802, 1.252827, -1.788755, 0, 0, 0, 1, 1,
-2.133977, -1.043108, -3.545213, 0, 0, 0, 1, 1,
-2.112377, -0.7630519, -2.326987, 0, 0, 0, 1, 1,
-2.084694, 1.065035, -1.83093, 0, 0, 0, 1, 1,
-2.077278, 0.7950376, -0.820971, 0, 0, 0, 1, 1,
-2.070346, -1.180459, -3.02318, 1, 1, 1, 1, 1,
-2.07018, -0.3725283, -1.57532, 1, 1, 1, 1, 1,
-2.027957, -1.649518, -0.1058214, 1, 1, 1, 1, 1,
-2.008569, -0.7970236, -1.694715, 1, 1, 1, 1, 1,
-2.004575, -0.2618551, -2.870668, 1, 1, 1, 1, 1,
-2.003378, -1.248426, -2.517953, 1, 1, 1, 1, 1,
-1.966856, -0.7161617, -1.401519, 1, 1, 1, 1, 1,
-1.951384, 0.4274623, -2.159548, 1, 1, 1, 1, 1,
-1.946056, 0.6683654, -1.655241, 1, 1, 1, 1, 1,
-1.945661, 0.7608189, -1.972532, 1, 1, 1, 1, 1,
-1.938795, 0.4391975, -1.698773, 1, 1, 1, 1, 1,
-1.914358, -0.8286419, -1.819295, 1, 1, 1, 1, 1,
-1.897996, 0.3657946, -0.2816363, 1, 1, 1, 1, 1,
-1.890449, -0.1487957, -2.031617, 1, 1, 1, 1, 1,
-1.877777, -0.03386893, -1.796633, 1, 1, 1, 1, 1,
-1.8739, 0.1589348, -1.189852, 0, 0, 1, 1, 1,
-1.862137, -0.3813308, -1.799919, 1, 0, 0, 1, 1,
-1.804072, -0.08006582, -0.2683737, 1, 0, 0, 1, 1,
-1.802778, 0.8510557, -0.7091988, 1, 0, 0, 1, 1,
-1.800842, -0.3239965, -0.5611581, 1, 0, 0, 1, 1,
-1.797522, -0.6643618, -2.039859, 1, 0, 0, 1, 1,
-1.764941, 1.060282, -0.443938, 0, 0, 0, 1, 1,
-1.76472, -0.0745889, -0.123728, 0, 0, 0, 1, 1,
-1.717944, -0.2874276, -1.082717, 0, 0, 0, 1, 1,
-1.712274, 0.2093144, -0.7653431, 0, 0, 0, 1, 1,
-1.694251, -0.7836021, -2.695541, 0, 0, 0, 1, 1,
-1.653865, 0.09537727, 0.5181013, 0, 0, 0, 1, 1,
-1.630554, 0.2973211, -1.096449, 0, 0, 0, 1, 1,
-1.616116, 0.9747165, -2.117275, 1, 1, 1, 1, 1,
-1.592634, 0.6060566, -1.747227, 1, 1, 1, 1, 1,
-1.575978, 0.3696643, -0.2691189, 1, 1, 1, 1, 1,
-1.570809, 0.2347405, -2.193792, 1, 1, 1, 1, 1,
-1.554897, 0.5068972, -2.113587, 1, 1, 1, 1, 1,
-1.545218, 0.2664123, -2.143034, 1, 1, 1, 1, 1,
-1.544537, 0.7534929, -2.888242, 1, 1, 1, 1, 1,
-1.542406, 2.500418, -1.299387, 1, 1, 1, 1, 1,
-1.540403, -1.614983, -1.871524, 1, 1, 1, 1, 1,
-1.520931, 0.6150705, -0.1861187, 1, 1, 1, 1, 1,
-1.52036, -0.2856986, -2.540239, 1, 1, 1, 1, 1,
-1.504127, -1.309257, -1.379289, 1, 1, 1, 1, 1,
-1.498256, -0.3862658, 0.2558306, 1, 1, 1, 1, 1,
-1.492171, 0.0260215, -3.262233, 1, 1, 1, 1, 1,
-1.483708, -0.7884632, -2.794046, 1, 1, 1, 1, 1,
-1.471579, -0.6944124, -1.668226, 0, 0, 1, 1, 1,
-1.467936, 0.8710105, -0.643671, 1, 0, 0, 1, 1,
-1.448216, 0.3726632, 0.4399681, 1, 0, 0, 1, 1,
-1.442892, 0.9922579, -1.004455, 1, 0, 0, 1, 1,
-1.436824, 0.6504479, -1.802435, 1, 0, 0, 1, 1,
-1.436139, 0.9370631, 1.14917, 1, 0, 0, 1, 1,
-1.431535, 0.9853624, -1.654958, 0, 0, 0, 1, 1,
-1.429684, 0.524134, -0.6223406, 0, 0, 0, 1, 1,
-1.419193, -1.443832, -0.4283526, 0, 0, 0, 1, 1,
-1.403324, -0.1530768, -2.118762, 0, 0, 0, 1, 1,
-1.403231, -1.49864, -2.915137, 0, 0, 0, 1, 1,
-1.400333, -1.07358, -1.197327, 0, 0, 0, 1, 1,
-1.398762, 0.8903114, -1.192834, 0, 0, 0, 1, 1,
-1.394931, -1.73806, -2.689806, 1, 1, 1, 1, 1,
-1.393559, 1.319355, -1.044347, 1, 1, 1, 1, 1,
-1.391382, 1.121323, -0.2978308, 1, 1, 1, 1, 1,
-1.390469, 0.2256229, -0.3760202, 1, 1, 1, 1, 1,
-1.386986, 0.2333675, -2.898821, 1, 1, 1, 1, 1,
-1.384568, -1.189974, -1.16923, 1, 1, 1, 1, 1,
-1.379598, 0.1354844, -2.503345, 1, 1, 1, 1, 1,
-1.378715, 2.24998, -1.150679, 1, 1, 1, 1, 1,
-1.371576, 0.5169493, -2.908419, 1, 1, 1, 1, 1,
-1.347695, -0.1302356, -1.775478, 1, 1, 1, 1, 1,
-1.342203, -0.9813153, -2.844911, 1, 1, 1, 1, 1,
-1.339725, 0.1589335, -3.07015, 1, 1, 1, 1, 1,
-1.337141, -0.5148749, -1.801505, 1, 1, 1, 1, 1,
-1.334934, 1.057699, -1.358984, 1, 1, 1, 1, 1,
-1.324761, 1.393602, 0.6947741, 1, 1, 1, 1, 1,
-1.323167, -1.088186, -1.088667, 0, 0, 1, 1, 1,
-1.322879, 0.239288, -0.03422356, 1, 0, 0, 1, 1,
-1.31469, -1.147399, -2.389979, 1, 0, 0, 1, 1,
-1.308332, 0.3859865, -1.109936, 1, 0, 0, 1, 1,
-1.299399, -1.104972, -2.815345, 1, 0, 0, 1, 1,
-1.287241, -1.122475, -3.05215, 1, 0, 0, 1, 1,
-1.286856, 1.414844, -1.444646, 0, 0, 0, 1, 1,
-1.285953, 0.204093, -0.5744497, 0, 0, 0, 1, 1,
-1.283524, 1.386093, -0.3255746, 0, 0, 0, 1, 1,
-1.282891, -0.9038308, -2.616294, 0, 0, 0, 1, 1,
-1.268439, -0.1022107, -1.583038, 0, 0, 0, 1, 1,
-1.26323, 1.565527, -3.013232, 0, 0, 0, 1, 1,
-1.256886, -0.1098315, -2.669934, 0, 0, 0, 1, 1,
-1.2568, -1.113544, -1.411944, 1, 1, 1, 1, 1,
-1.256104, -1.111083, -1.535774, 1, 1, 1, 1, 1,
-1.255558, -0.5262221, -0.1363377, 1, 1, 1, 1, 1,
-1.231213, -0.8573088, -0.3221477, 1, 1, 1, 1, 1,
-1.22735, -0.8982908, -1.482773, 1, 1, 1, 1, 1,
-1.222036, -0.5335475, -3.587485, 1, 1, 1, 1, 1,
-1.220572, -0.887043, -1.471749, 1, 1, 1, 1, 1,
-1.215114, -1.541661, -3.228353, 1, 1, 1, 1, 1,
-1.204399, 1.784509, -0.7810795, 1, 1, 1, 1, 1,
-1.197317, 0.2088241, -0.5108614, 1, 1, 1, 1, 1,
-1.1939, 1.284006, -1.687784, 1, 1, 1, 1, 1,
-1.192459, 0.8096573, 0.3490064, 1, 1, 1, 1, 1,
-1.183604, -2.264313, -3.339345, 1, 1, 1, 1, 1,
-1.179332, -0.4041614, -0.7238736, 1, 1, 1, 1, 1,
-1.179256, -0.5767558, -3.009818, 1, 1, 1, 1, 1,
-1.174234, 1.24955, 0.6294553, 0, 0, 1, 1, 1,
-1.169978, -0.8193151, -2.266753, 1, 0, 0, 1, 1,
-1.169819, 0.04994396, -1.309391, 1, 0, 0, 1, 1,
-1.16931, 1.040799, -0.3256027, 1, 0, 0, 1, 1,
-1.168768, -0.2292551, -2.227688, 1, 0, 0, 1, 1,
-1.158392, -0.02396028, -2.127576, 1, 0, 0, 1, 1,
-1.156361, 0.001187801, -1.318245, 0, 0, 0, 1, 1,
-1.152638, -0.5399824, -1.221812, 0, 0, 0, 1, 1,
-1.152422, -0.04680579, -3.028257, 0, 0, 0, 1, 1,
-1.141323, -0.5854297, -2.273614, 0, 0, 0, 1, 1,
-1.128384, -0.4311223, -2.176852, 0, 0, 0, 1, 1,
-1.126065, -0.1957685, -2.917097, 0, 0, 0, 1, 1,
-1.125602, -0.1025379, -3.169126, 0, 0, 0, 1, 1,
-1.124901, 0.3390105, -3.38921, 1, 1, 1, 1, 1,
-1.123693, 0.4345282, -0.5957075, 1, 1, 1, 1, 1,
-1.117528, 0.1768398, -2.090525, 1, 1, 1, 1, 1,
-1.114212, 1.494808, -1.512957, 1, 1, 1, 1, 1,
-1.101582, 1.561556, -1.733818, 1, 1, 1, 1, 1,
-1.101517, 0.8613809, -0.3719187, 1, 1, 1, 1, 1,
-1.100287, 1.650317, 0.1750102, 1, 1, 1, 1, 1,
-1.098013, 1.364968, -0.1325068, 1, 1, 1, 1, 1,
-1.083583, 2.089123, 0.7710437, 1, 1, 1, 1, 1,
-1.0747, -1.519252, -1.065851, 1, 1, 1, 1, 1,
-1.072824, -1.018621, -2.719063, 1, 1, 1, 1, 1,
-1.072513, -0.06108198, -2.747859, 1, 1, 1, 1, 1,
-1.068853, -0.2906518, -1.076121, 1, 1, 1, 1, 1,
-1.065507, 1.931578, -1.642219, 1, 1, 1, 1, 1,
-1.063275, -0.195929, 0.3603762, 1, 1, 1, 1, 1,
-1.062336, 0.5642709, -0.8838528, 0, 0, 1, 1, 1,
-1.062202, 0.6808943, -0.5640278, 1, 0, 0, 1, 1,
-1.060196, 1.484135, -1.535034, 1, 0, 0, 1, 1,
-1.05599, -1.551384, -3.143102, 1, 0, 0, 1, 1,
-1.055575, 0.5904982, 0.2237336, 1, 0, 0, 1, 1,
-1.051692, 0.7551408, -0.139786, 1, 0, 0, 1, 1,
-1.03712, -0.9636751, -1.362705, 0, 0, 0, 1, 1,
-1.036152, 0.5588659, -2.908865, 0, 0, 0, 1, 1,
-1.018693, 0.6049451, -1.905596, 0, 0, 0, 1, 1,
-1.017713, 0.3891894, -1.944785, 0, 0, 0, 1, 1,
-1.015692, 0.4544554, -1.980186, 0, 0, 0, 1, 1,
-1.011134, -0.5815124, -4.120887, 0, 0, 0, 1, 1,
-1.006394, -0.9027832, -2.82032, 0, 0, 0, 1, 1,
-1.003403, 0.4162543, -0.6698532, 1, 1, 1, 1, 1,
-1.00329, -0.8073431, -1.91548, 1, 1, 1, 1, 1,
-1.00235, 1.744975, 1.489254, 1, 1, 1, 1, 1,
-0.9980779, 1.191752, -0.7266137, 1, 1, 1, 1, 1,
-0.9890835, -0.6041253, -2.995113, 1, 1, 1, 1, 1,
-0.9875953, -0.1060906, -1.463476, 1, 1, 1, 1, 1,
-0.9847766, -0.8300723, -1.572904, 1, 1, 1, 1, 1,
-0.9784213, -0.3156716, 0.5334635, 1, 1, 1, 1, 1,
-0.9760001, -1.853713, -2.750871, 1, 1, 1, 1, 1,
-0.974373, -1.480209, -2.043245, 1, 1, 1, 1, 1,
-0.970436, 0.8353083, 0.3940864, 1, 1, 1, 1, 1,
-0.9621245, -0.9722372, -1.948924, 1, 1, 1, 1, 1,
-0.9608164, 0.2157908, -0.934149, 1, 1, 1, 1, 1,
-0.9545829, 0.2472449, -2.269316, 1, 1, 1, 1, 1,
-0.9470649, -0.530542, -1.903821, 1, 1, 1, 1, 1,
-0.9393175, 0.2544663, -1.335694, 0, 0, 1, 1, 1,
-0.9356924, 0.05517595, -2.364728, 1, 0, 0, 1, 1,
-0.9312741, -1.250141, -2.608935, 1, 0, 0, 1, 1,
-0.9247911, 0.2952729, -0.449531, 1, 0, 0, 1, 1,
-0.9239617, 0.9429327, -1.419873, 1, 0, 0, 1, 1,
-0.9229066, -0.2440857, -2.595178, 1, 0, 0, 1, 1,
-0.9191298, 0.8062825, -1.314475, 0, 0, 0, 1, 1,
-0.9077694, -0.7382464, -1.764913, 0, 0, 0, 1, 1,
-0.9036048, -1.083551, -1.617198, 0, 0, 0, 1, 1,
-0.8878782, -0.4577407, -0.03690925, 0, 0, 0, 1, 1,
-0.8872504, 0.7645007, 1.229251, 0, 0, 0, 1, 1,
-0.8867904, 0.9242237, -1.82195, 0, 0, 0, 1, 1,
-0.8797925, 0.6933364, 0.6765488, 0, 0, 0, 1, 1,
-0.8773859, -0.497226, -1.905169, 1, 1, 1, 1, 1,
-0.8734747, 0.5529837, -0.503054, 1, 1, 1, 1, 1,
-0.8702847, 0.144038, -1.882321, 1, 1, 1, 1, 1,
-0.8701113, 2.158969, -0.4952753, 1, 1, 1, 1, 1,
-0.8676644, 1.15241, -1.267106, 1, 1, 1, 1, 1,
-0.8661763, -0.7672205, -3.048662, 1, 1, 1, 1, 1,
-0.8542656, -0.03838794, -2.381972, 1, 1, 1, 1, 1,
-0.8437254, 0.2112297, -1.877204, 1, 1, 1, 1, 1,
-0.8274702, 0.7301129, 0.1886016, 1, 1, 1, 1, 1,
-0.824993, -1.395794, -1.610398, 1, 1, 1, 1, 1,
-0.8197107, 1.134875, 0.1304177, 1, 1, 1, 1, 1,
-0.8111204, -0.5136927, -3.365793, 1, 1, 1, 1, 1,
-0.8076955, 0.9488433, 0.5059184, 1, 1, 1, 1, 1,
-0.8063354, 1.138789, 0.6834144, 1, 1, 1, 1, 1,
-0.8037434, 0.2536906, -2.269109, 1, 1, 1, 1, 1,
-0.8010223, -2.153316, -4.382277, 0, 0, 1, 1, 1,
-0.7981614, 1.277117, -2.01567, 1, 0, 0, 1, 1,
-0.7945902, -1.208529, -2.480725, 1, 0, 0, 1, 1,
-0.7853483, -0.02063452, -0.04791667, 1, 0, 0, 1, 1,
-0.7747725, 0.07149259, -1.856994, 1, 0, 0, 1, 1,
-0.7747039, 0.2958063, -2.760237, 1, 0, 0, 1, 1,
-0.76735, -0.4817752, -2.314099, 0, 0, 0, 1, 1,
-0.7647151, 1.381043, -0.07284465, 0, 0, 0, 1, 1,
-0.7635915, 1.178673, -0.02766445, 0, 0, 0, 1, 1,
-0.7616313, 0.05912372, -2.071326, 0, 0, 0, 1, 1,
-0.7579437, 2.072613, -1.155456, 0, 0, 0, 1, 1,
-0.7544034, 0.3977362, -1.138238, 0, 0, 0, 1, 1,
-0.754108, -0.651507, -2.710539, 0, 0, 0, 1, 1,
-0.7497466, 0.9959073, -0.9943379, 1, 1, 1, 1, 1,
-0.746126, -1.303329, -2.178325, 1, 1, 1, 1, 1,
-0.7453436, 0.5251096, -1.596974, 1, 1, 1, 1, 1,
-0.738826, 0.3224305, -0.3776617, 1, 1, 1, 1, 1,
-0.7358364, 0.2708831, -2.285746, 1, 1, 1, 1, 1,
-0.7301312, -0.09274299, -0.7817039, 1, 1, 1, 1, 1,
-0.7287722, 0.5193598, 1.070154, 1, 1, 1, 1, 1,
-0.7277305, -0.8966438, -3.297886, 1, 1, 1, 1, 1,
-0.722981, 0.9013537, -0.9601726, 1, 1, 1, 1, 1,
-0.7193168, 1.248601, 0.9832304, 1, 1, 1, 1, 1,
-0.7167771, 0.4356772, 0.353726, 1, 1, 1, 1, 1,
-0.7149128, 0.7425082, -2.250115, 1, 1, 1, 1, 1,
-0.7137734, 0.4213959, -2.139888, 1, 1, 1, 1, 1,
-0.7082783, -0.05902373, -1.159479, 1, 1, 1, 1, 1,
-0.7007573, -1.048685, -3.457082, 1, 1, 1, 1, 1,
-0.6989739, -1.433586, -1.771159, 0, 0, 1, 1, 1,
-0.6974856, 1.06392, -0.420741, 1, 0, 0, 1, 1,
-0.6944901, -1.186973, -3.278118, 1, 0, 0, 1, 1,
-0.6860109, -0.3589205, -1.689595, 1, 0, 0, 1, 1,
-0.6843698, -1.740394, -4.280319, 1, 0, 0, 1, 1,
-0.6806625, -0.169095, -2.063024, 1, 0, 0, 1, 1,
-0.6764056, 0.5398536, 0.3337778, 0, 0, 0, 1, 1,
-0.6752609, -1.631577, -2.618743, 0, 0, 0, 1, 1,
-0.6749267, -1.315656, -2.176315, 0, 0, 0, 1, 1,
-0.6734304, -0.4418665, -2.41366, 0, 0, 0, 1, 1,
-0.6733203, -0.6420959, -2.997372, 0, 0, 0, 1, 1,
-0.6692017, -1.424343, -3.474688, 0, 0, 0, 1, 1,
-0.6687174, 0.2729445, 0.527659, 0, 0, 0, 1, 1,
-0.6654209, 0.9348047, -2.532345, 1, 1, 1, 1, 1,
-0.6621197, -0.5629063, -3.917439, 1, 1, 1, 1, 1,
-0.6615029, 0.2901981, -2.883943, 1, 1, 1, 1, 1,
-0.6500217, -1.443233, -2.193045, 1, 1, 1, 1, 1,
-0.6494886, 1.06163, -2.105568, 1, 1, 1, 1, 1,
-0.6471375, -0.3094783, -3.381, 1, 1, 1, 1, 1,
-0.6436191, 1.981324, 0.9539278, 1, 1, 1, 1, 1,
-0.6435694, -0.6348107, -2.202075, 1, 1, 1, 1, 1,
-0.6423413, -1.216229, -1.424242, 1, 1, 1, 1, 1,
-0.6417385, -0.6940188, -2.652203, 1, 1, 1, 1, 1,
-0.6407852, -0.9815759, -2.5695, 1, 1, 1, 1, 1,
-0.6367978, 1.691798, -1.275258, 1, 1, 1, 1, 1,
-0.6343111, 0.8674732, -0.4762155, 1, 1, 1, 1, 1,
-0.6330021, -1.85294, -2.085725, 1, 1, 1, 1, 1,
-0.6306571, 1.766625, -0.5773609, 1, 1, 1, 1, 1,
-0.6302375, -0.6112857, -3.010209, 0, 0, 1, 1, 1,
-0.6301519, 1.524961, -1.189052, 1, 0, 0, 1, 1,
-0.6292208, 1.101907, -1.909347, 1, 0, 0, 1, 1,
-0.6288879, -1.27681, -2.477657, 1, 0, 0, 1, 1,
-0.6254664, -0.3421091, -2.509684, 1, 0, 0, 1, 1,
-0.6247873, -0.5944106, -2.21812, 1, 0, 0, 1, 1,
-0.6237803, 0.6144496, 0.3806023, 0, 0, 0, 1, 1,
-0.6202531, -0.8526078, -2.518543, 0, 0, 0, 1, 1,
-0.6178409, -0.4492797, -1.44609, 0, 0, 0, 1, 1,
-0.6150587, -1.608656, -2.549707, 0, 0, 0, 1, 1,
-0.6117291, -1.148337, -2.291725, 0, 0, 0, 1, 1,
-0.60823, 0.5703402, -1.761858, 0, 0, 0, 1, 1,
-0.6023753, -0.2483888, -0.9364228, 0, 0, 0, 1, 1,
-0.6021324, -0.6175876, -1.400094, 1, 1, 1, 1, 1,
-0.6021264, 0.2985861, -1.015187, 1, 1, 1, 1, 1,
-0.6010614, -0.6736998, -1.998868, 1, 1, 1, 1, 1,
-0.5994996, 1.136286, -0.6848871, 1, 1, 1, 1, 1,
-0.5895138, -0.9104592, -3.862622, 1, 1, 1, 1, 1,
-0.5888659, 0.3085657, -2.43778, 1, 1, 1, 1, 1,
-0.5881925, 1.270419, -1.596417, 1, 1, 1, 1, 1,
-0.5868771, -0.3861167, -2.324712, 1, 1, 1, 1, 1,
-0.5805697, -0.8497657, -3.569678, 1, 1, 1, 1, 1,
-0.5767285, 0.6379749, -0.7875523, 1, 1, 1, 1, 1,
-0.5758513, -1.946015, -2.352998, 1, 1, 1, 1, 1,
-0.5729708, -0.9469582, -4.302806, 1, 1, 1, 1, 1,
-0.5717945, 0.6861025, 0.1224309, 1, 1, 1, 1, 1,
-0.5696974, -0.4085938, -3.315655, 1, 1, 1, 1, 1,
-0.5668156, 0.8449588, 0.1193554, 1, 1, 1, 1, 1,
-0.5665991, -0.4716634, -2.917429, 0, 0, 1, 1, 1,
-0.5653218, -0.2992783, -0.8875601, 1, 0, 0, 1, 1,
-0.5639366, -0.3964972, -2.080586, 1, 0, 0, 1, 1,
-0.5610622, 1.404909, 0.2975452, 1, 0, 0, 1, 1,
-0.5557764, 0.5521153, -0.4954416, 1, 0, 0, 1, 1,
-0.5422896, 0.5457896, -0.963415, 1, 0, 0, 1, 1,
-0.5397794, 0.7867718, -1.067307, 0, 0, 0, 1, 1,
-0.5351058, -0.2062627, -1.993259, 0, 0, 0, 1, 1,
-0.5314788, -0.5396133, -2.578135, 0, 0, 0, 1, 1,
-0.5303659, -0.1932173, -1.798453, 0, 0, 0, 1, 1,
-0.5265741, -0.6648497, -3.635839, 0, 0, 0, 1, 1,
-0.5236672, 3.281934, 0.5484374, 0, 0, 0, 1, 1,
-0.5206842, 1.272929, -0.9769648, 0, 0, 0, 1, 1,
-0.5154713, -0.644378, -2.962188, 1, 1, 1, 1, 1,
-0.5138533, -1.923103, -1.725887, 1, 1, 1, 1, 1,
-0.5088369, 0.3460248, -2.564809, 1, 1, 1, 1, 1,
-0.5070717, -0.6981989, -3.756445, 1, 1, 1, 1, 1,
-0.5043938, -0.4225482, -3.164038, 1, 1, 1, 1, 1,
-0.5030475, 0.02777402, -0.9639978, 1, 1, 1, 1, 1,
-0.5022473, -0.6038784, -3.293112, 1, 1, 1, 1, 1,
-0.4963705, -0.7589434, -2.129716, 1, 1, 1, 1, 1,
-0.4925652, -0.5360681, -2.474822, 1, 1, 1, 1, 1,
-0.4906137, -0.4561231, -0.4377084, 1, 1, 1, 1, 1,
-0.4822245, 0.885617, -1.381771, 1, 1, 1, 1, 1,
-0.4732525, -0.2016362, -3.52483, 1, 1, 1, 1, 1,
-0.4719297, -0.2208313, -0.7946121, 1, 1, 1, 1, 1,
-0.468891, 0.065098, -1.960984, 1, 1, 1, 1, 1,
-0.466309, -1.473026, -2.192172, 1, 1, 1, 1, 1,
-0.4660336, -0.4732605, -2.401561, 0, 0, 1, 1, 1,
-0.4620612, -0.2162687, -1.83927, 1, 0, 0, 1, 1,
-0.4617709, -0.5431675, -1.254248, 1, 0, 0, 1, 1,
-0.4597273, -0.9475497, -2.10308, 1, 0, 0, 1, 1,
-0.4582045, -1.346198, -0.811129, 1, 0, 0, 1, 1,
-0.4575386, 0.1120619, -2.025234, 1, 0, 0, 1, 1,
-0.4574232, 0.4893371, -0.02556233, 0, 0, 0, 1, 1,
-0.4552389, -0.03123047, -0.9584802, 0, 0, 0, 1, 1,
-0.452519, -1.557382, -3.54583, 0, 0, 0, 1, 1,
-0.4506955, 0.09528781, -1.570215, 0, 0, 0, 1, 1,
-0.4483838, -0.7800453, -1.407521, 0, 0, 0, 1, 1,
-0.4463167, -0.2848395, -0.9648113, 0, 0, 0, 1, 1,
-0.4461035, 1.355826, -1.507677, 0, 0, 0, 1, 1,
-0.44465, -1.034255, -1.631339, 1, 1, 1, 1, 1,
-0.4399568, -2.546695, -2.31214, 1, 1, 1, 1, 1,
-0.4367597, 1.364994, 0.02298393, 1, 1, 1, 1, 1,
-0.4362964, -0.3889794, -2.733697, 1, 1, 1, 1, 1,
-0.427061, 0.7285335, -1.080204, 1, 1, 1, 1, 1,
-0.4263092, 0.6150802, -0.2060663, 1, 1, 1, 1, 1,
-0.4261992, 0.3109742, -0.1004773, 1, 1, 1, 1, 1,
-0.4234918, -0.1614, -1.715404, 1, 1, 1, 1, 1,
-0.4153702, -1.360949, -4.106385, 1, 1, 1, 1, 1,
-0.413772, -0.48629, -4.960954, 1, 1, 1, 1, 1,
-0.4133696, -0.8949475, -1.41365, 1, 1, 1, 1, 1,
-0.4133568, -1.070166, -3.531908, 1, 1, 1, 1, 1,
-0.4132704, 0.6060302, 0.5056592, 1, 1, 1, 1, 1,
-0.4073764, -1.271992, -3.36457, 1, 1, 1, 1, 1,
-0.4068604, 1.395178, -0.01255552, 1, 1, 1, 1, 1,
-0.4037213, 0.6018735, -2.172576, 0, 0, 1, 1, 1,
-0.4034013, -2.034613, -3.297035, 1, 0, 0, 1, 1,
-0.3936238, -0.1416097, -1.029526, 1, 0, 0, 1, 1,
-0.3912986, -0.06119249, -1.060044, 1, 0, 0, 1, 1,
-0.3893378, -0.5210471, -3.000304, 1, 0, 0, 1, 1,
-0.387572, 0.4881342, -1.706332, 1, 0, 0, 1, 1,
-0.381401, 0.3853647, -0.3391406, 0, 0, 0, 1, 1,
-0.3808315, -0.5071436, -1.92471, 0, 0, 0, 1, 1,
-0.3790212, 0.6678671, -0.1176125, 0, 0, 0, 1, 1,
-0.374204, -0.2675786, -2.305031, 0, 0, 0, 1, 1,
-0.3738482, 1.685546, -1.774686, 0, 0, 0, 1, 1,
-0.3719274, -1.509882, -2.72001, 0, 0, 0, 1, 1,
-0.3705437, 1.115178, 0.6928014, 0, 0, 0, 1, 1,
-0.3689806, -0.001011315, -0.8448202, 1, 1, 1, 1, 1,
-0.3688333, -0.3716798, -1.901474, 1, 1, 1, 1, 1,
-0.366822, -0.97368, -1.291742, 1, 1, 1, 1, 1,
-0.3657568, 1.443936, -1.725097, 1, 1, 1, 1, 1,
-0.365366, -0.3526072, -1.716731, 1, 1, 1, 1, 1,
-0.3638189, -0.04826328, -2.589153, 1, 1, 1, 1, 1,
-0.3622126, 0.9814511, -0.1596985, 1, 1, 1, 1, 1,
-0.3591621, 0.3818396, 0.03037392, 1, 1, 1, 1, 1,
-0.3493561, 0.4801673, -1.49091, 1, 1, 1, 1, 1,
-0.3456416, 0.5886172, -0.8018614, 1, 1, 1, 1, 1,
-0.3449698, 0.02711471, -0.9744221, 1, 1, 1, 1, 1,
-0.3442327, 1.340242, -1.52069, 1, 1, 1, 1, 1,
-0.3423433, -1.84941, -2.720018, 1, 1, 1, 1, 1,
-0.3379489, -0.271562, -4.12447, 1, 1, 1, 1, 1,
-0.3290553, -1.099919, -3.240628, 1, 1, 1, 1, 1,
-0.3248596, -1.387592, -3.416502, 0, 0, 1, 1, 1,
-0.3194701, 0.4242072, 0.3683773, 1, 0, 0, 1, 1,
-0.3164678, -0.2401147, -2.084322, 1, 0, 0, 1, 1,
-0.3140504, -1.528769, -2.260265, 1, 0, 0, 1, 1,
-0.3132781, 0.5100268, -0.4490552, 1, 0, 0, 1, 1,
-0.3105445, 0.05564487, -2.657958, 1, 0, 0, 1, 1,
-0.3025957, 0.5361959, -1.739615, 0, 0, 0, 1, 1,
-0.3003313, -1.62879, -3.51997, 0, 0, 0, 1, 1,
-0.3002791, -3.216449, -2.737978, 0, 0, 0, 1, 1,
-0.2997137, -1.341646, -2.876294, 0, 0, 0, 1, 1,
-0.2962455, -0.1546542, -2.758463, 0, 0, 0, 1, 1,
-0.294626, 0.4285941, -0.89595, 0, 0, 0, 1, 1,
-0.2920698, 0.9374719, 0.7547615, 0, 0, 0, 1, 1,
-0.2914029, 0.7818954, -1.798318, 1, 1, 1, 1, 1,
-0.2821122, -0.2765766, -2.408533, 1, 1, 1, 1, 1,
-0.2801894, -0.1285668, -2.589889, 1, 1, 1, 1, 1,
-0.2742095, 0.4802327, 0.7408338, 1, 1, 1, 1, 1,
-0.272393, 0.6483714, -0.4984741, 1, 1, 1, 1, 1,
-0.2703803, 0.6185837, -1.567644, 1, 1, 1, 1, 1,
-0.2699717, 0.2992389, 0.3045686, 1, 1, 1, 1, 1,
-0.2688358, -0.8374188, -3.571824, 1, 1, 1, 1, 1,
-0.262267, -0.482332, -3.093444, 1, 1, 1, 1, 1,
-0.2614871, -2.651768, -3.044361, 1, 1, 1, 1, 1,
-0.25913, 0.7467149, -1.096015, 1, 1, 1, 1, 1,
-0.2566783, -0.1366373, -1.856231, 1, 1, 1, 1, 1,
-0.255626, 0.3719346, -1.414476, 1, 1, 1, 1, 1,
-0.2550401, -1.322626, -4.286475, 1, 1, 1, 1, 1,
-0.2549864, -0.7678757, -2.656661, 1, 1, 1, 1, 1,
-0.2535689, 0.9167072, -0.4990794, 0, 0, 1, 1, 1,
-0.252393, -2.417076, -4.238431, 1, 0, 0, 1, 1,
-0.2504954, 0.3064019, -2.131442, 1, 0, 0, 1, 1,
-0.2497014, -1.215679, -3.116589, 1, 0, 0, 1, 1,
-0.249258, 0.05138791, 0.9786632, 1, 0, 0, 1, 1,
-0.2408099, -0.9942248, -2.436953, 1, 0, 0, 1, 1,
-0.2399849, 0.9290607, -0.9983225, 0, 0, 0, 1, 1,
-0.2388909, 0.3935241, -1.001663, 0, 0, 0, 1, 1,
-0.2377313, 0.725378, -0.02607562, 0, 0, 0, 1, 1,
-0.2279772, 1.333712, 0.3717932, 0, 0, 0, 1, 1,
-0.2276753, 0.445359, -0.8829696, 0, 0, 0, 1, 1,
-0.2265951, -0.06648744, -2.755366, 0, 0, 0, 1, 1,
-0.2236491, -0.7178829, -3.0992, 0, 0, 0, 1, 1,
-0.2227781, -0.3810424, -1.887914, 1, 1, 1, 1, 1,
-0.2182451, -1.045331, -3.638039, 1, 1, 1, 1, 1,
-0.2146473, -1.877675, -2.432462, 1, 1, 1, 1, 1,
-0.2132819, -0.3680793, -1.889212, 1, 1, 1, 1, 1,
-0.2130743, -1.167042, -3.655518, 1, 1, 1, 1, 1,
-0.2126577, 0.4498755, -0.9597781, 1, 1, 1, 1, 1,
-0.2125365, -0.9852412, -2.984732, 1, 1, 1, 1, 1,
-0.2047125, 0.5464411, -2.097138, 1, 1, 1, 1, 1,
-0.2009704, -0.3806194, -2.350968, 1, 1, 1, 1, 1,
-0.2006133, 1.125821, 1.413344, 1, 1, 1, 1, 1,
-0.1975335, -0.2205636, -1.316254, 1, 1, 1, 1, 1,
-0.1934729, 1.145268, -1.031769, 1, 1, 1, 1, 1,
-0.1932187, -0.1047526, -1.298241, 1, 1, 1, 1, 1,
-0.1931701, -1.100207, -4.101254, 1, 1, 1, 1, 1,
-0.1900484, -0.9290929, -2.455611, 1, 1, 1, 1, 1,
-0.1885125, 0.451996, 0.420487, 0, 0, 1, 1, 1,
-0.1866944, -0.7543522, -3.130008, 1, 0, 0, 1, 1,
-0.1820197, 0.3190911, -0.03055257, 1, 0, 0, 1, 1,
-0.1813109, 0.603954, 0.02542794, 1, 0, 0, 1, 1,
-0.1792798, 0.8535708, 0.9730648, 1, 0, 0, 1, 1,
-0.1757659, -1.504541, -3.200174, 1, 0, 0, 1, 1,
-0.1755482, -0.1232237, -2.353359, 0, 0, 0, 1, 1,
-0.1737825, 0.1674263, -1.581886, 0, 0, 0, 1, 1,
-0.165071, 0.1063255, -0.6330948, 0, 0, 0, 1, 1,
-0.164153, -2.066128, -4.323899, 0, 0, 0, 1, 1,
-0.1634711, 1.299669, -1.053568, 0, 0, 0, 1, 1,
-0.1629773, 1.171321, -0.8227761, 0, 0, 0, 1, 1,
-0.1628019, -0.1919166, -1.378009, 0, 0, 0, 1, 1,
-0.1604341, 0.2966061, -0.8425807, 1, 1, 1, 1, 1,
-0.1600583, -0.4500112, -3.943027, 1, 1, 1, 1, 1,
-0.1591278, 1.609762, -0.6317847, 1, 1, 1, 1, 1,
-0.1559229, -0.7226263, -3.175803, 1, 1, 1, 1, 1,
-0.1509418, -0.2978157, -3.680415, 1, 1, 1, 1, 1,
-0.1500081, -1.872467, -3.676795, 1, 1, 1, 1, 1,
-0.1498521, -1.529523, -2.801782, 1, 1, 1, 1, 1,
-0.1481528, 0.1379933, 0.8968675, 1, 1, 1, 1, 1,
-0.1480797, 0.8910661, 1.41839, 1, 1, 1, 1, 1,
-0.1467686, 0.4895494, 0.9498653, 1, 1, 1, 1, 1,
-0.1455173, 1.490349, -0.37216, 1, 1, 1, 1, 1,
-0.1411955, 0.9482942, 0.2720295, 1, 1, 1, 1, 1,
-0.1398835, 0.4390424, -1.589584, 1, 1, 1, 1, 1,
-0.1349891, -0.4148487, -2.262223, 1, 1, 1, 1, 1,
-0.1344654, 0.01999696, -0.6144047, 1, 1, 1, 1, 1,
-0.1335623, -1.070254, -2.343549, 0, 0, 1, 1, 1,
-0.130676, 0.651139, -0.4311242, 1, 0, 0, 1, 1,
-0.1295297, -0.4261867, -1.568614, 1, 0, 0, 1, 1,
-0.124195, 0.3419535, -0.5748414, 1, 0, 0, 1, 1,
-0.1223532, 0.784774, -0.395839, 1, 0, 0, 1, 1,
-0.1199443, 2.147397, -0.00504227, 1, 0, 0, 1, 1,
-0.1185811, 0.239301, -2.872853, 0, 0, 0, 1, 1,
-0.1138747, 0.5098023, -1.808186, 0, 0, 0, 1, 1,
-0.1137037, -0.5638836, -2.356881, 0, 0, 0, 1, 1,
-0.1123845, -2.204419, -2.800449, 0, 0, 0, 1, 1,
-0.1107628, -0.0129527, -0.3148337, 0, 0, 0, 1, 1,
-0.1101861, 0.3425519, 0.3064115, 0, 0, 0, 1, 1,
-0.108891, -0.5911956, -2.526089, 0, 0, 0, 1, 1,
-0.1080033, 0.2252098, -0.1505291, 1, 1, 1, 1, 1,
-0.106107, 1.452641, -0.9609087, 1, 1, 1, 1, 1,
-0.1024445, 0.8107202, 1.054949, 1, 1, 1, 1, 1,
-0.1008139, -1.733525, -2.540983, 1, 1, 1, 1, 1,
-0.1003504, -1.415939, -4.246448, 1, 1, 1, 1, 1,
-0.09245622, 1.203954, 0.2607761, 1, 1, 1, 1, 1,
-0.09032516, 0.7223642, -0.4453932, 1, 1, 1, 1, 1,
-0.0882346, 0.02656659, -1.229418, 1, 1, 1, 1, 1,
-0.08570493, -0.2951367, -4.540752, 1, 1, 1, 1, 1,
-0.08531952, 0.5919238, -0.5484174, 1, 1, 1, 1, 1,
-0.08351595, -0.8440562, -2.377454, 1, 1, 1, 1, 1,
-0.08128339, -1.420496, -1.01421, 1, 1, 1, 1, 1,
-0.08076268, -0.1946832, -4.486417, 1, 1, 1, 1, 1,
-0.07980698, 0.4682954, -1.362243, 1, 1, 1, 1, 1,
-0.07926142, 0.2294002, 0.2824776, 1, 1, 1, 1, 1,
-0.06301921, -0.2936307, -2.942175, 0, 0, 1, 1, 1,
-0.06237219, -2.854073, -2.631129, 1, 0, 0, 1, 1,
-0.05435213, 2.016896, 1.029416, 1, 0, 0, 1, 1,
-0.05345744, 0.4795914, 0.2934372, 1, 0, 0, 1, 1,
-0.05295384, -0.9144723, -3.51483, 1, 0, 0, 1, 1,
-0.05106984, -1.487918, -4.086595, 1, 0, 0, 1, 1,
-0.04938325, 1.382594, 0.5843194, 0, 0, 0, 1, 1,
-0.04901807, 1.392537, 1.492272, 0, 0, 0, 1, 1,
-0.04809562, -1.119325, -2.856473, 0, 0, 0, 1, 1,
-0.04684288, -0.1907535, -3.728927, 0, 0, 0, 1, 1,
-0.04607673, 1.173243, -1.089455, 0, 0, 0, 1, 1,
-0.04539695, -0.277176, -4.3596, 0, 0, 0, 1, 1,
-0.04213061, 0.340594, -0.3249501, 0, 0, 0, 1, 1,
-0.04146099, -0.2001416, -3.113755, 1, 1, 1, 1, 1,
-0.03931538, -0.377577, -4.4098, 1, 1, 1, 1, 1,
-0.03822801, 1.3548, -0.05683879, 1, 1, 1, 1, 1,
-0.03378027, -1.16862, -3.969399, 1, 1, 1, 1, 1,
-0.03279481, 0.2777759, -1.090153, 1, 1, 1, 1, 1,
-0.03164548, -0.5705662, -2.497383, 1, 1, 1, 1, 1,
-0.03038142, -0.7557772, -4.483477, 1, 1, 1, 1, 1,
-0.02790362, 0.7963419, 0.0522131, 1, 1, 1, 1, 1,
-0.02618364, -0.8670271, -3.023101, 1, 1, 1, 1, 1,
-0.02374071, -0.6160981, -2.600591, 1, 1, 1, 1, 1,
-0.02120417, -0.5451323, -3.649828, 1, 1, 1, 1, 1,
-0.01922516, 0.5398445, 0.762137, 1, 1, 1, 1, 1,
-0.0180658, -1.343345, -2.006879, 1, 1, 1, 1, 1,
-0.01745035, -0.2677639, -3.995506, 1, 1, 1, 1, 1,
-0.01651072, 0.7816713, 0.03009804, 1, 1, 1, 1, 1,
-0.01405222, 0.7453066, 0.1224328, 0, 0, 1, 1, 1,
-0.0138952, -0.2450991, -2.202834, 1, 0, 0, 1, 1,
-0.01169519, -0.3991142, -4.042727, 1, 0, 0, 1, 1,
-0.01041767, -1.407123, -3.653169, 1, 0, 0, 1, 1,
-0.008502833, 0.07592097, 0.8046577, 1, 0, 0, 1, 1,
-0.007359552, -0.6986478, -1.683315, 1, 0, 0, 1, 1,
-0.004353995, -0.1296905, -3.112592, 0, 0, 0, 1, 1,
-0.002931687, 2.167112, -1.596039, 0, 0, 0, 1, 1,
-0.001374358, -0.1451702, -3.385506, 0, 0, 0, 1, 1,
-0.001169564, 1.619532, -1.735169, 0, 0, 0, 1, 1,
0.001604833, -1.341517, 2.140213, 0, 0, 0, 1, 1,
0.002765196, -0.4018965, 4.59726, 0, 0, 0, 1, 1,
0.002889617, 0.7075061, 1.169479, 0, 0, 0, 1, 1,
0.00381419, -0.2528893, 4.66318, 1, 1, 1, 1, 1,
0.006178022, -0.5004768, 4.565892, 1, 1, 1, 1, 1,
0.01429821, -1.193726, 3.268352, 1, 1, 1, 1, 1,
0.01659446, -0.9507834, 1.397447, 1, 1, 1, 1, 1,
0.02385169, 0.1498913, -0.6604552, 1, 1, 1, 1, 1,
0.02463409, 0.228053, -0.2538381, 1, 1, 1, 1, 1,
0.03092059, -0.4914137, 2.320354, 1, 1, 1, 1, 1,
0.03308773, -0.8123655, 3.673948, 1, 1, 1, 1, 1,
0.03411233, 0.3690637, -0.7007142, 1, 1, 1, 1, 1,
0.04256885, -0.9518581, 2.198542, 1, 1, 1, 1, 1,
0.04308396, -0.3125116, 4.12512, 1, 1, 1, 1, 1,
0.04489135, 1.211866, 0.8856086, 1, 1, 1, 1, 1,
0.04518839, 0.7042177, -0.09220672, 1, 1, 1, 1, 1,
0.04523468, 0.08570069, 0.3995163, 1, 1, 1, 1, 1,
0.04838024, -1.61577, 4.458317, 1, 1, 1, 1, 1,
0.05110148, 0.6317625, -0.9470999, 0, 0, 1, 1, 1,
0.05744366, -0.6603195, 2.222046, 1, 0, 0, 1, 1,
0.0629039, 0.8394369, -0.4423233, 1, 0, 0, 1, 1,
0.06598736, -0.003682666, 2.165146, 1, 0, 0, 1, 1,
0.06860203, 0.1794275, 2.659049, 1, 0, 0, 1, 1,
0.0692337, 1.035869, 0.3423903, 1, 0, 0, 1, 1,
0.07188256, 0.4552796, -0.02092863, 0, 0, 0, 1, 1,
0.07561046, 1.352332, 0.4737258, 0, 0, 0, 1, 1,
0.08024174, -0.3454922, 2.247901, 0, 0, 0, 1, 1,
0.08450784, 3.938635, 0.7436457, 0, 0, 0, 1, 1,
0.08664974, -0.09865188, 1.9563, 0, 0, 0, 1, 1,
0.08671825, 0.3465105, 1.378778, 0, 0, 0, 1, 1,
0.09062037, -0.4057147, 4.449914, 0, 0, 0, 1, 1,
0.09303892, 1.322024, -0.96904, 1, 1, 1, 1, 1,
0.09492289, 2.271441, -0.9469282, 1, 1, 1, 1, 1,
0.09950846, -0.4728756, 1.172851, 1, 1, 1, 1, 1,
0.1054032, 1.359819, -0.04773801, 1, 1, 1, 1, 1,
0.1056052, -0.3058513, 2.221192, 1, 1, 1, 1, 1,
0.1145963, 0.2957337, 0.5461715, 1, 1, 1, 1, 1,
0.1183839, -0.4134549, 2.724966, 1, 1, 1, 1, 1,
0.1215759, 0.5792246, 1.226503, 1, 1, 1, 1, 1,
0.1245205, 1.052162, 0.974892, 1, 1, 1, 1, 1,
0.1246015, 0.1147893, 0.07924741, 1, 1, 1, 1, 1,
0.1276814, -0.886789, 3.376003, 1, 1, 1, 1, 1,
0.1326376, 1.335297, 0.9406157, 1, 1, 1, 1, 1,
0.1339346, -0.7077517, 1.879404, 1, 1, 1, 1, 1,
0.1374601, -0.5771881, 2.22589, 1, 1, 1, 1, 1,
0.1442606, 1.437889, -1.563239, 1, 1, 1, 1, 1,
0.1457275, 0.5185335, -0.5321035, 0, 0, 1, 1, 1,
0.149074, 0.4207507, 0.34202, 1, 0, 0, 1, 1,
0.1504377, 1.679204, -0.7008291, 1, 0, 0, 1, 1,
0.1510347, -0.2675095, 2.93815, 1, 0, 0, 1, 1,
0.1514841, -1.467128, 3.746746, 1, 0, 0, 1, 1,
0.1634308, -0.6621144, 3.104645, 1, 0, 0, 1, 1,
0.1669012, 0.4754729, -0.3561649, 0, 0, 0, 1, 1,
0.1702245, 1.468893, 0.2007248, 0, 0, 0, 1, 1,
0.1724555, -0.3620273, 3.855994, 0, 0, 0, 1, 1,
0.1761185, 0.1322635, 3.181131, 0, 0, 0, 1, 1,
0.1786096, 0.4414834, 1.493056, 0, 0, 0, 1, 1,
0.1795936, 1.155702, -0.4378486, 0, 0, 0, 1, 1,
0.1876683, -1.065336, 2.567474, 0, 0, 0, 1, 1,
0.1956359, -0.5739325, 4.344854, 1, 1, 1, 1, 1,
0.1972797, -0.6214302, 3.021586, 1, 1, 1, 1, 1,
0.2006362, -0.6836058, 2.052961, 1, 1, 1, 1, 1,
0.2028006, 0.1949243, -0.5605046, 1, 1, 1, 1, 1,
0.2031783, 0.4610612, 2.096578, 1, 1, 1, 1, 1,
0.2090663, -1.054341, 2.834923, 1, 1, 1, 1, 1,
0.2103428, 0.5484288, 0.7446238, 1, 1, 1, 1, 1,
0.2135856, 0.1136898, 0.886295, 1, 1, 1, 1, 1,
0.2137775, 1.861211, 0.1700298, 1, 1, 1, 1, 1,
0.2180485, 0.1410161, 2.567781, 1, 1, 1, 1, 1,
0.2216578, 0.07220775, 1.239639, 1, 1, 1, 1, 1,
0.2266008, 0.3599166, 1.126392, 1, 1, 1, 1, 1,
0.227201, 0.4461752, -0.38992, 1, 1, 1, 1, 1,
0.2317784, 1.260907, -1.131961, 1, 1, 1, 1, 1,
0.2433719, -1.155841, 2.20665, 1, 1, 1, 1, 1,
0.2434638, 1.559453, -1.422002, 0, 0, 1, 1, 1,
0.2456444, -0.8143594, 3.260565, 1, 0, 0, 1, 1,
0.2495763, 1.798498, 0.3597903, 1, 0, 0, 1, 1,
0.25432, 0.4978668, 0.5952642, 1, 0, 0, 1, 1,
0.2561025, -0.8008153, 3.89867, 1, 0, 0, 1, 1,
0.2610523, -0.8268933, 1.036149, 1, 0, 0, 1, 1,
0.2625413, -0.7724335, 3.202508, 0, 0, 0, 1, 1,
0.2631724, 2.2745, -0.2522313, 0, 0, 0, 1, 1,
0.2634488, -1.121824, 4.570582, 0, 0, 0, 1, 1,
0.2652998, 2.10905, -0.3896458, 0, 0, 0, 1, 1,
0.2666306, -0.7046965, 4.295191, 0, 0, 0, 1, 1,
0.2677316, 0.6863717, 0.2381657, 0, 0, 0, 1, 1,
0.2679156, -0.03603498, -0.1050924, 0, 0, 0, 1, 1,
0.2679175, -0.237429, 2.399839, 1, 1, 1, 1, 1,
0.2688278, 1.885604, 0.4946928, 1, 1, 1, 1, 1,
0.2696577, 0.4959498, 0.5136085, 1, 1, 1, 1, 1,
0.2705656, 0.08399397, 2.086466, 1, 1, 1, 1, 1,
0.2716785, -1.710061, 2.128007, 1, 1, 1, 1, 1,
0.2721179, -0.9527236, 3.642964, 1, 1, 1, 1, 1,
0.273349, 0.3736967, 1.4773, 1, 1, 1, 1, 1,
0.2767159, -1.590956, 2.218642, 1, 1, 1, 1, 1,
0.2796497, 0.234366, 2.077891, 1, 1, 1, 1, 1,
0.2833393, -1.216347, 1.149227, 1, 1, 1, 1, 1,
0.2845126, 0.9278973, 1.477986, 1, 1, 1, 1, 1,
0.2854218, 0.759553, -0.3548388, 1, 1, 1, 1, 1,
0.2921159, -2.410076, 4.009086, 1, 1, 1, 1, 1,
0.2923489, 0.70138, -0.3810506, 1, 1, 1, 1, 1,
0.2931133, 1.270139, -0.1481439, 1, 1, 1, 1, 1,
0.2941478, 2.195876, 1.196974, 0, 0, 1, 1, 1,
0.2956041, -1.533187, 3.439826, 1, 0, 0, 1, 1,
0.2965847, 2.02262, 1.394056, 1, 0, 0, 1, 1,
0.2998125, 0.4495368, 2.413973, 1, 0, 0, 1, 1,
0.2999251, 1.162464, -1.252078, 1, 0, 0, 1, 1,
0.3010364, 0.2585311, -0.8404841, 1, 0, 0, 1, 1,
0.303671, -0.4878796, 1.951204, 0, 0, 0, 1, 1,
0.3042548, 0.9533921, 1.285023, 0, 0, 0, 1, 1,
0.3071811, 0.2809215, -0.1975022, 0, 0, 0, 1, 1,
0.3099527, 0.0638364, 1.378501, 0, 0, 0, 1, 1,
0.3118991, -0.6452909, 3.059444, 0, 0, 0, 1, 1,
0.3167347, 1.298963, 0.6362776, 0, 0, 0, 1, 1,
0.3236859, -1.098205, 2.378528, 0, 0, 0, 1, 1,
0.3277355, 0.9247228, -0.4887376, 1, 1, 1, 1, 1,
0.3295097, -0.5547624, 4.058373, 1, 1, 1, 1, 1,
0.330646, -0.2420708, 1.61301, 1, 1, 1, 1, 1,
0.3320242, 0.2798883, 2.329195, 1, 1, 1, 1, 1,
0.3383439, 0.3719439, 2.183967, 1, 1, 1, 1, 1,
0.3415038, 1.174392, 0.9922844, 1, 1, 1, 1, 1,
0.3425039, -0.06057439, 1.489024, 1, 1, 1, 1, 1,
0.3437097, -0.06959915, 2.371252, 1, 1, 1, 1, 1,
0.3471681, 1.794268, 0.2588809, 1, 1, 1, 1, 1,
0.3522202, -0.05697448, 2.507859, 1, 1, 1, 1, 1,
0.3528861, -0.7867827, 2.320565, 1, 1, 1, 1, 1,
0.3539017, -1.187205, 3.013875, 1, 1, 1, 1, 1,
0.3553334, -0.5803477, 3.272058, 1, 1, 1, 1, 1,
0.3560874, 1.07082, -0.1176331, 1, 1, 1, 1, 1,
0.3565605, -2.535431, 4.557717, 1, 1, 1, 1, 1,
0.3627819, -1.097297, 3.467107, 0, 0, 1, 1, 1,
0.3637974, 0.9794379, 0.03575321, 1, 0, 0, 1, 1,
0.3834307, -1.072693, 1.49747, 1, 0, 0, 1, 1,
0.3874807, -0.9152997, 1.764038, 1, 0, 0, 1, 1,
0.388834, 2.16219, -1.213118, 1, 0, 0, 1, 1,
0.3900784, 2.379154, -1.412413, 1, 0, 0, 1, 1,
0.3919494, -1.320796, 1.631632, 0, 0, 0, 1, 1,
0.3928847, -0.4592805, 2.89251, 0, 0, 0, 1, 1,
0.394351, 0.171737, 2.671164, 0, 0, 0, 1, 1,
0.3954754, -0.02575022, 1.554157, 0, 0, 0, 1, 1,
0.3966869, -1.017248, 3.147732, 0, 0, 0, 1, 1,
0.3971669, 0.04215682, 0.8024043, 0, 0, 0, 1, 1,
0.398582, -0.3174085, 1.88532, 0, 0, 0, 1, 1,
0.4038407, 1.258002, -0.02055768, 1, 1, 1, 1, 1,
0.4066052, -1.416821, 3.621084, 1, 1, 1, 1, 1,
0.4069113, 2.217212, 0.07331777, 1, 1, 1, 1, 1,
0.409373, 1.289398, 1.109584, 1, 1, 1, 1, 1,
0.4159673, 0.9053985, -0.6582901, 1, 1, 1, 1, 1,
0.4209605, -0.2574096, 2.324418, 1, 1, 1, 1, 1,
0.4278848, 0.5895225, 1.194241, 1, 1, 1, 1, 1,
0.4289185, 0.301905, 2.933247, 1, 1, 1, 1, 1,
0.4291249, -0.4449604, 1.545931, 1, 1, 1, 1, 1,
0.4363474, -0.03281638, 1.067459, 1, 1, 1, 1, 1,
0.4369198, -0.5022977, 0.5094573, 1, 1, 1, 1, 1,
0.4373473, -0.002139434, 0.5517011, 1, 1, 1, 1, 1,
0.4375123, 1.056718, 0.9329897, 1, 1, 1, 1, 1,
0.4389412, -1.97511, 3.907217, 1, 1, 1, 1, 1,
0.4390861, 0.4904049, 0.2516536, 1, 1, 1, 1, 1,
0.443999, 1.483346, -0.814299, 0, 0, 1, 1, 1,
0.4479158, 0.1013906, 1.6599, 1, 0, 0, 1, 1,
0.4567237, -0.4864807, 2.25077, 1, 0, 0, 1, 1,
0.4658592, 2.326104, 1.280771, 1, 0, 0, 1, 1,
0.4660419, -1.583997, 3.651422, 1, 0, 0, 1, 1,
0.4662461, -0.4918414, 1.649556, 1, 0, 0, 1, 1,
0.4667202, -1.069241, 2.808207, 0, 0, 0, 1, 1,
0.4694248, -0.6679955, 1.832795, 0, 0, 0, 1, 1,
0.4713341, -1.299613, 2.897985, 0, 0, 0, 1, 1,
0.473961, 0.2329796, 2.210171, 0, 0, 0, 1, 1,
0.4745088, 0.9848053, -1.323867, 0, 0, 0, 1, 1,
0.475271, 1.65421, -1.340656, 0, 0, 0, 1, 1,
0.4778951, -0.4798931, 1.635521, 0, 0, 0, 1, 1,
0.4809415, 0.6990768, 0.7525605, 1, 1, 1, 1, 1,
0.4818409, 0.3442758, 1.6657, 1, 1, 1, 1, 1,
0.4831685, -1.469918, 2.119884, 1, 1, 1, 1, 1,
0.4846679, -0.9483681, 2.898136, 1, 1, 1, 1, 1,
0.4870665, 1.366471, -0.3842573, 1, 1, 1, 1, 1,
0.4926688, -1.550905, 1.388005, 1, 1, 1, 1, 1,
0.4940539, -0.4883173, 1.580838, 1, 1, 1, 1, 1,
0.5015035, -0.1453895, 1.774854, 1, 1, 1, 1, 1,
0.5032576, -0.8684705, 3.239503, 1, 1, 1, 1, 1,
0.5042291, -0.4159534, 2.274527, 1, 1, 1, 1, 1,
0.5056381, 0.9447241, 1.977564, 1, 1, 1, 1, 1,
0.5161382, -0.6576015, 3.484732, 1, 1, 1, 1, 1,
0.5197369, -0.1951471, 2.348747, 1, 1, 1, 1, 1,
0.5272331, -0.3202882, 0.7326342, 1, 1, 1, 1, 1,
0.5275058, 0.3341292, 2.044211, 1, 1, 1, 1, 1,
0.5350738, 1.327275, -1.285627, 0, 0, 1, 1, 1,
0.5350774, 0.9004235, -0.6509665, 1, 0, 0, 1, 1,
0.5413895, -1.942808, 2.688648, 1, 0, 0, 1, 1,
0.5431264, -0.3733739, 2.309483, 1, 0, 0, 1, 1,
0.5451856, 1.167627, 3.006932, 1, 0, 0, 1, 1,
0.5455269, -0.9636497, 2.205464, 1, 0, 0, 1, 1,
0.5520339, 0.7040399, 0.7211452, 0, 0, 0, 1, 1,
0.5531865, -0.3866136, 1.060065, 0, 0, 0, 1, 1,
0.5536953, -0.3424484, 2.174156, 0, 0, 0, 1, 1,
0.5559037, 0.05059577, 0.6476763, 0, 0, 0, 1, 1,
0.5596097, 1.433634, -0.3298488, 0, 0, 0, 1, 1,
0.560322, -1.263229, 2.708981, 0, 0, 0, 1, 1,
0.5616835, -2.35204, 5.173899, 0, 0, 0, 1, 1,
0.5647315, 1.746513, -0.8529896, 1, 1, 1, 1, 1,
0.5654088, 0.974315, 0.2029736, 1, 1, 1, 1, 1,
0.5717846, -0.4462082, 1.999699, 1, 1, 1, 1, 1,
0.5734833, -0.8409666, 2.903838, 1, 1, 1, 1, 1,
0.5740603, 0.6202657, 1.214349, 1, 1, 1, 1, 1,
0.5776044, -0.9435252, 2.560015, 1, 1, 1, 1, 1,
0.5982031, -0.5283735, 1.947822, 1, 1, 1, 1, 1,
0.5992396, -0.5510744, 2.019226, 1, 1, 1, 1, 1,
0.6011751, -1.109316, 1.809682, 1, 1, 1, 1, 1,
0.6030304, -0.9926417, 2.883377, 1, 1, 1, 1, 1,
0.6069692, -1.564909, 3.327898, 1, 1, 1, 1, 1,
0.6082385, 0.7306917, -0.9947001, 1, 1, 1, 1, 1,
0.6098822, 0.1442737, 0.8238444, 1, 1, 1, 1, 1,
0.6151435, 0.8957756, 2.826987, 1, 1, 1, 1, 1,
0.6163192, -0.9769598, 1.557685, 1, 1, 1, 1, 1,
0.6181942, 0.0560697, 1.0093, 0, 0, 1, 1, 1,
0.6213467, 0.5810093, 1.220348, 1, 0, 0, 1, 1,
0.6319567, 0.9824542, 0.3207902, 1, 0, 0, 1, 1,
0.6361032, -1.237368, 3.240334, 1, 0, 0, 1, 1,
0.6399376, -1.669576, 2.258998, 1, 0, 0, 1, 1,
0.6415952, -0.05346697, 2.699275, 1, 0, 0, 1, 1,
0.6420066, -1.290168, 2.412835, 0, 0, 0, 1, 1,
0.6462767, 1.676388, 1.417025, 0, 0, 0, 1, 1,
0.6474628, -0.7490066, -0.4025138, 0, 0, 0, 1, 1,
0.6484745, -0.8665641, 1.865294, 0, 0, 0, 1, 1,
0.6543386, -0.6521502, 2.099825, 0, 0, 0, 1, 1,
0.6654944, 1.285174, 0.2868772, 0, 0, 0, 1, 1,
0.6659963, -0.6732066, 2.738965, 0, 0, 0, 1, 1,
0.6668015, -0.8706915, 1.806941, 1, 1, 1, 1, 1,
0.6684122, -0.3955053, 1.374005, 1, 1, 1, 1, 1,
0.6724439, -0.8840548, 3.924952, 1, 1, 1, 1, 1,
0.674061, -1.149038, 1.8925, 1, 1, 1, 1, 1,
0.6764252, -1.00042, 3.244395, 1, 1, 1, 1, 1,
0.6825854, -0.8114052, 4.166143, 1, 1, 1, 1, 1,
0.6843722, 0.2388193, 1.988407, 1, 1, 1, 1, 1,
0.6912304, -2.205452, 2.495317, 1, 1, 1, 1, 1,
0.6936925, 0.5362885, 3.365825, 1, 1, 1, 1, 1,
0.6938993, 0.1452229, 2.779578, 1, 1, 1, 1, 1,
0.6953509, -1.656955, 2.535758, 1, 1, 1, 1, 1,
0.6958495, -0.5959913, 1.052068, 1, 1, 1, 1, 1,
0.700301, -0.7517748, 2.714838, 1, 1, 1, 1, 1,
0.7007382, -0.6051227, 1.635862, 1, 1, 1, 1, 1,
0.7036717, -0.654713, 2.457409, 1, 1, 1, 1, 1,
0.7057153, -1.44915, 1.582805, 0, 0, 1, 1, 1,
0.7072607, -0.1176905, 1.231023, 1, 0, 0, 1, 1,
0.7081049, 1.178962, 1.113287, 1, 0, 0, 1, 1,
0.7110205, -0.5654788, 0.7163976, 1, 0, 0, 1, 1,
0.7162755, -1.229248, 3.597554, 1, 0, 0, 1, 1,
0.7168799, -0.4557883, 2.289559, 1, 0, 0, 1, 1,
0.7173784, -0.1993824, 2.571351, 0, 0, 0, 1, 1,
0.7188339, -0.9044459, 1.894759, 0, 0, 0, 1, 1,
0.7226961, -1.458983, 2.704104, 0, 0, 0, 1, 1,
0.7236451, -1.536683, 1.395088, 0, 0, 0, 1, 1,
0.7265036, 1.059873, -0.06581043, 0, 0, 0, 1, 1,
0.7327445, -1.152778, 3.854751, 0, 0, 0, 1, 1,
0.7346527, -0.844199, 1.743942, 0, 0, 0, 1, 1,
0.7359885, -0.3188047, 2.088822, 1, 1, 1, 1, 1,
0.743353, 0.07945532, 0.8533378, 1, 1, 1, 1, 1,
0.7444322, -0.3019806, 1.239181, 1, 1, 1, 1, 1,
0.7467238, -0.5707155, -0.08746735, 1, 1, 1, 1, 1,
0.7469355, -1.209589, 4.179327, 1, 1, 1, 1, 1,
0.747116, -0.07554072, 2.169928, 1, 1, 1, 1, 1,
0.7488762, 1.452309, -1.442642, 1, 1, 1, 1, 1,
0.7606289, 0.1000864, -0.1117438, 1, 1, 1, 1, 1,
0.764008, -0.4408442, 1.960159, 1, 1, 1, 1, 1,
0.7652034, -1.845206, 2.783056, 1, 1, 1, 1, 1,
0.768714, 1.532887, -1.420345, 1, 1, 1, 1, 1,
0.7871587, 0.7127274, 1.243355, 1, 1, 1, 1, 1,
0.7914209, -1.031618, 1.238001, 1, 1, 1, 1, 1,
0.7937843, 0.3823797, 2.459114, 1, 1, 1, 1, 1,
0.7944322, 0.6383515, 0.2229866, 1, 1, 1, 1, 1,
0.7944506, -0.1834825, -0.2706887, 0, 0, 1, 1, 1,
0.7946401, -0.2968846, 1.733622, 1, 0, 0, 1, 1,
0.7946841, 0.0298146, 1.986592, 1, 0, 0, 1, 1,
0.7959046, -0.7817047, 2.929281, 1, 0, 0, 1, 1,
0.796486, 0.429688, 0.372261, 1, 0, 0, 1, 1,
0.8015651, -1.288135, 1.982954, 1, 0, 0, 1, 1,
0.8109717, 0.2210451, 2.881262, 0, 0, 0, 1, 1,
0.811915, -0.2894236, 2.247897, 0, 0, 0, 1, 1,
0.812824, -0.0003748458, 2.594558, 0, 0, 0, 1, 1,
0.8131694, -0.2677278, 1.814735, 0, 0, 0, 1, 1,
0.8189917, 0.7198464, -0.0188203, 0, 0, 0, 1, 1,
0.8235186, 1.31588, -0.2290673, 0, 0, 0, 1, 1,
0.8259254, 0.7334539, 0.9122432, 0, 0, 0, 1, 1,
0.8296471, 0.0093752, 0.9459754, 1, 1, 1, 1, 1,
0.829704, 0.48632, 2.725188, 1, 1, 1, 1, 1,
0.8302229, 0.4527852, 2.773769, 1, 1, 1, 1, 1,
0.8317603, 0.04778152, 2.078523, 1, 1, 1, 1, 1,
0.8324574, -0.7824782, 2.112113, 1, 1, 1, 1, 1,
0.8362242, 0.8789287, 1.738389, 1, 1, 1, 1, 1,
0.8376958, 0.1788518, 2.749108, 1, 1, 1, 1, 1,
0.8511684, -0.1675092, 3.967552, 1, 1, 1, 1, 1,
0.8559768, -1.135253, 3.072218, 1, 1, 1, 1, 1,
0.8592113, -1.001278, 0.9004765, 1, 1, 1, 1, 1,
0.8694995, -0.3595009, 2.295998, 1, 1, 1, 1, 1,
0.8727493, 0.9280862, -0.4347335, 1, 1, 1, 1, 1,
0.8727692, 0.9402909, -1.306323, 1, 1, 1, 1, 1,
0.8738819, -0.5534175, 1.877339, 1, 1, 1, 1, 1,
0.8765696, 0.3900205, 1.408877, 1, 1, 1, 1, 1,
0.87756, -0.1611947, 1.456416, 0, 0, 1, 1, 1,
0.8786005, -0.3493828, 1.684012, 1, 0, 0, 1, 1,
0.8819169, -0.01996074, 0.8357824, 1, 0, 0, 1, 1,
0.8868387, -1.13065, 2.147057, 1, 0, 0, 1, 1,
0.8878553, -0.6951376, 3.807865, 1, 0, 0, 1, 1,
0.8913254, 0.4189155, 1.216733, 1, 0, 0, 1, 1,
0.8929563, 0.5909738, 1.479524, 0, 0, 0, 1, 1,
0.8950673, -2.030596, 3.870918, 0, 0, 0, 1, 1,
0.8990928, -0.2896722, 2.733617, 0, 0, 0, 1, 1,
0.9023972, 0.9949085, 1.503209, 0, 0, 0, 1, 1,
0.9060993, -0.3727228, 2.164622, 0, 0, 0, 1, 1,
0.9213429, 0.08442525, 2.028021, 0, 0, 0, 1, 1,
0.9325545, 0.671791, 0.3003844, 0, 0, 0, 1, 1,
0.937581, 0.6198987, 1.330169, 1, 1, 1, 1, 1,
0.9386459, 1.487629, 2.416151, 1, 1, 1, 1, 1,
0.9395254, -2.495662, 2.624481, 1, 1, 1, 1, 1,
0.9482815, 0.2516542, 1.869022, 1, 1, 1, 1, 1,
0.951795, 0.6844934, 0.3025011, 1, 1, 1, 1, 1,
0.9530525, 0.6148161, -0.2244599, 1, 1, 1, 1, 1,
0.9576036, 1.147535, -1.444289, 1, 1, 1, 1, 1,
0.9585692, -1.253574, 2.990491, 1, 1, 1, 1, 1,
0.9592162, -0.1407426, 1.535687, 1, 1, 1, 1, 1,
0.9625298, 0.00330172, 0.7230533, 1, 1, 1, 1, 1,
0.963812, 1.520732, 0.01011004, 1, 1, 1, 1, 1,
0.9701309, 1.065352, 1.233709, 1, 1, 1, 1, 1,
0.9714624, -0.9474404, 1.581941, 1, 1, 1, 1, 1,
0.9883819, 0.8856612, 0.1645838, 1, 1, 1, 1, 1,
0.9889802, -0.7602941, 1.868131, 1, 1, 1, 1, 1,
0.9936333, -0.6022632, 3.623036, 0, 0, 1, 1, 1,
1.009734, -0.1104831, 1.935733, 1, 0, 0, 1, 1,
1.013335, 0.1778073, 0.6774328, 1, 0, 0, 1, 1,
1.01663, 0.9951792, -1.046286, 1, 0, 0, 1, 1,
1.016725, 1.226656, 1.661345, 1, 0, 0, 1, 1,
1.024507, 0.3152362, 1.133118, 1, 0, 0, 1, 1,
1.033925, -0.879564, 2.744054, 0, 0, 0, 1, 1,
1.034344, -0.7946948, 2.849516, 0, 0, 0, 1, 1,
1.039148, 0.4125652, 0.79672, 0, 0, 0, 1, 1,
1.039546, -1.09149, 2.211349, 0, 0, 0, 1, 1,
1.046348, -0.274538, -0.3686389, 0, 0, 0, 1, 1,
1.056035, -0.8266257, 1.057773, 0, 0, 0, 1, 1,
1.056109, -1.754459, 0.6641583, 0, 0, 0, 1, 1,
1.05704, -0.3912451, -0.2824078, 1, 1, 1, 1, 1,
1.058987, 0.3056395, 1.541543, 1, 1, 1, 1, 1,
1.068186, -0.3822036, 0.9975784, 1, 1, 1, 1, 1,
1.072797, 0.962598, 0.8432307, 1, 1, 1, 1, 1,
1.087224, -0.2760133, 1.167394, 1, 1, 1, 1, 1,
1.090154, 0.3709395, 0.9388739, 1, 1, 1, 1, 1,
1.093267, -1.356223, 2.574797, 1, 1, 1, 1, 1,
1.097381, 0.243487, -0.07642808, 1, 1, 1, 1, 1,
1.099188, 0.4832748, 1.225766, 1, 1, 1, 1, 1,
1.099423, 1.31629, 1.069589, 1, 1, 1, 1, 1,
1.120448, 0.9594662, 0.6186869, 1, 1, 1, 1, 1,
1.122178, -0.08910604, -0.466874, 1, 1, 1, 1, 1,
1.124475, -0.519547, 2.497874, 1, 1, 1, 1, 1,
1.126317, 0.01841344, 0.3499247, 1, 1, 1, 1, 1,
1.128171, 0.4887416, 0.8152379, 1, 1, 1, 1, 1,
1.137846, 0.7619606, -0.2801875, 0, 0, 1, 1, 1,
1.143298, 0.9990788, -0.8809564, 1, 0, 0, 1, 1,
1.146023, 0.2659719, 2.694342, 1, 0, 0, 1, 1,
1.146311, 1.726409, 1.490067, 1, 0, 0, 1, 1,
1.146803, -0.3600491, 0.9535311, 1, 0, 0, 1, 1,
1.147142, 0.5278681, 0.5200484, 1, 0, 0, 1, 1,
1.15494, 0.4562577, -0.7999281, 0, 0, 0, 1, 1,
1.156335, 1.707254, 0.1168519, 0, 0, 0, 1, 1,
1.174005, 0.8026755, 0.08159053, 0, 0, 0, 1, 1,
1.175608, -1.092883, 2.217956, 0, 0, 0, 1, 1,
1.189646, -0.08991082, 1.460139, 0, 0, 0, 1, 1,
1.206071, -0.9992144, 1.08151, 0, 0, 0, 1, 1,
1.206333, 0.8218675, 2.026101, 0, 0, 0, 1, 1,
1.211073, -0.5374689, 1.554287, 1, 1, 1, 1, 1,
1.215209, 0.7196484, 1.551737, 1, 1, 1, 1, 1,
1.216863, -0.2265304, 1.6025, 1, 1, 1, 1, 1,
1.218071, -0.9675562, 2.269786, 1, 1, 1, 1, 1,
1.219746, -0.8482262, -0.0312856, 1, 1, 1, 1, 1,
1.222874, -1.118078, 3.041307, 1, 1, 1, 1, 1,
1.228391, 0.2232948, 0.02113433, 1, 1, 1, 1, 1,
1.230191, -1.557914, 1.517298, 1, 1, 1, 1, 1,
1.233055, -1.264185, 2.233673, 1, 1, 1, 1, 1,
1.233878, 0.3470135, 2.512544, 1, 1, 1, 1, 1,
1.237105, 1.717804, -0.4539986, 1, 1, 1, 1, 1,
1.238357, -0.2833127, 0.5830462, 1, 1, 1, 1, 1,
1.249725, -0.2218717, 1.054848, 1, 1, 1, 1, 1,
1.257829, 0.09421927, 1.396408, 1, 1, 1, 1, 1,
1.260086, -0.1561446, 3.191294, 1, 1, 1, 1, 1,
1.26903, -0.425691, 2.471161, 0, 0, 1, 1, 1,
1.270181, -0.5674278, 2.512955, 1, 0, 0, 1, 1,
1.282523, 0.4353093, 1.871839, 1, 0, 0, 1, 1,
1.282985, 0.480866, 1.514378, 1, 0, 0, 1, 1,
1.285507, 0.6197317, 1.963617, 1, 0, 0, 1, 1,
1.289786, 1.033202, 0.8207949, 1, 0, 0, 1, 1,
1.292086, -0.1198634, 3.667628, 0, 0, 0, 1, 1,
1.292448, -1.837313, 2.313915, 0, 0, 0, 1, 1,
1.29293, -0.1879001, 2.430864, 0, 0, 0, 1, 1,
1.293849, 2.053596, 1.258106, 0, 0, 0, 1, 1,
1.296405, 2.304381, 3.452988, 0, 0, 0, 1, 1,
1.314766, -0.07404665, 3.322986, 0, 0, 0, 1, 1,
1.318093, -1.874554, 3.158723, 0, 0, 0, 1, 1,
1.319258, -0.8076571, 1.185518, 1, 1, 1, 1, 1,
1.322799, 1.230957, 0.1190186, 1, 1, 1, 1, 1,
1.334864, 0.5507999, 2.111623, 1, 1, 1, 1, 1,
1.337579, -0.5465626, 2.459383, 1, 1, 1, 1, 1,
1.352831, 0.4480502, 1.952586, 1, 1, 1, 1, 1,
1.356609, -0.1813095, -0.3181984, 1, 1, 1, 1, 1,
1.360403, -0.1925287, 2.409479, 1, 1, 1, 1, 1,
1.360438, -0.5527015, 0.3925256, 1, 1, 1, 1, 1,
1.36305, -0.8495464, 3.03549, 1, 1, 1, 1, 1,
1.370698, -0.9101793, 0.9511223, 1, 1, 1, 1, 1,
1.372549, 2.263641, 0.1866897, 1, 1, 1, 1, 1,
1.381215, -0.3476993, 0.9758617, 1, 1, 1, 1, 1,
1.381573, 0.06566516, -0.2911003, 1, 1, 1, 1, 1,
1.384559, 0.3623949, -0.1770063, 1, 1, 1, 1, 1,
1.39517, 0.3517799, 0.1618246, 1, 1, 1, 1, 1,
1.395533, 2.247949, 0.7764803, 0, 0, 1, 1, 1,
1.397662, 0.3307666, 0.5197629, 1, 0, 0, 1, 1,
1.412275, 0.3177288, -0.03395028, 1, 0, 0, 1, 1,
1.413643, 1.984167, 3.954815, 1, 0, 0, 1, 1,
1.426502, 0.01174958, 1.277125, 1, 0, 0, 1, 1,
1.431055, 1.818515, 1.816084, 1, 0, 0, 1, 1,
1.433152, 1.583853, -0.9468017, 0, 0, 0, 1, 1,
1.434937, -0.01876197, -0.3551189, 0, 0, 0, 1, 1,
1.445515, 0.6683518, 2.999475, 0, 0, 0, 1, 1,
1.445533, 1.013784, 0.7790888, 0, 0, 0, 1, 1,
1.453078, 1.297638, 2.894578, 0, 0, 0, 1, 1,
1.455714, 0.3536083, 0.3308679, 0, 0, 0, 1, 1,
1.461377, 0.7718646, 0.7743182, 0, 0, 0, 1, 1,
1.48198, -0.7149305, 1.467317, 1, 1, 1, 1, 1,
1.493964, 0.3565745, 1.980158, 1, 1, 1, 1, 1,
1.494128, -1.109984, 1.907015, 1, 1, 1, 1, 1,
1.497462, -0.7671365, 5.380854, 1, 1, 1, 1, 1,
1.523035, -0.9557917, 2.257991, 1, 1, 1, 1, 1,
1.523542, -0.5077703, 1.190364, 1, 1, 1, 1, 1,
1.530853, -0.04575802, 0.7942314, 1, 1, 1, 1, 1,
1.560593, 0.2125884, 0.09184711, 1, 1, 1, 1, 1,
1.561332, 0.1787371, 3.035325, 1, 1, 1, 1, 1,
1.567122, 0.2752692, 1.660039, 1, 1, 1, 1, 1,
1.58421, -0.7751101, 2.15812, 1, 1, 1, 1, 1,
1.585383, 0.1463964, 0.8008619, 1, 1, 1, 1, 1,
1.58681, 0.1488694, 3.030039, 1, 1, 1, 1, 1,
1.600051, -1.200729, 2.272279, 1, 1, 1, 1, 1,
1.603037, 1.119595, 0.243312, 1, 1, 1, 1, 1,
1.612048, 0.1291514, 0.9390784, 0, 0, 1, 1, 1,
1.612832, 0.3937857, 1.438502, 1, 0, 0, 1, 1,
1.613282, 0.1602496, 1.108983, 1, 0, 0, 1, 1,
1.616076, 0.1826354, 1.569791, 1, 0, 0, 1, 1,
1.627019, 0.4181064, 2.684917, 1, 0, 0, 1, 1,
1.63121, -1.593406, 2.299991, 1, 0, 0, 1, 1,
1.63839, 1.015578, -1.202948, 0, 0, 0, 1, 1,
1.63892, 1.013225, 1.332953, 0, 0, 0, 1, 1,
1.647324, -0.2625883, 3.49443, 0, 0, 0, 1, 1,
1.662639, 0.5344279, 1.678899, 0, 0, 0, 1, 1,
1.662781, 0.4879128, 0.9031045, 0, 0, 0, 1, 1,
1.665602, -0.3461618, 0.04328027, 0, 0, 0, 1, 1,
1.678099, 0.08124615, 0.7701862, 0, 0, 0, 1, 1,
1.753723, 0.5767871, 1.080074, 1, 1, 1, 1, 1,
1.75437, 1.598618, -0.03939204, 1, 1, 1, 1, 1,
1.758036, -2.202725, 1.04529, 1, 1, 1, 1, 1,
1.766396, -0.3810624, 2.649477, 1, 1, 1, 1, 1,
1.783894, -0.627437, 2.060022, 1, 1, 1, 1, 1,
1.799842, 1.442082, 1.503401, 1, 1, 1, 1, 1,
1.799949, -0.5792307, 2.876074, 1, 1, 1, 1, 1,
1.801477, -0.5162653, 0.8981759, 1, 1, 1, 1, 1,
1.821936, -1.509856, 3.705784, 1, 1, 1, 1, 1,
1.831858, 0.4680638, -0.1932561, 1, 1, 1, 1, 1,
1.840084, 1.4082, 0.4134625, 1, 1, 1, 1, 1,
1.840549, 0.8041939, 0.7707401, 1, 1, 1, 1, 1,
1.868563, 1.688005, -0.1054744, 1, 1, 1, 1, 1,
1.871298, 0.4126563, 1.225422, 1, 1, 1, 1, 1,
1.877384, -0.8090941, 1.698531, 1, 1, 1, 1, 1,
1.916752, 0.176195, 1.559434, 0, 0, 1, 1, 1,
1.917307, -0.5246186, 2.326103, 1, 0, 0, 1, 1,
1.930941, -0.728676, -0.1530039, 1, 0, 0, 1, 1,
1.952408, -0.4843383, 1.045657, 1, 0, 0, 1, 1,
1.989754, 0.6953045, 2.17585, 1, 0, 0, 1, 1,
2.002895, -0.7979137, 2.66358, 1, 0, 0, 1, 1,
2.045752, 1.090382, 0.04567175, 0, 0, 0, 1, 1,
2.046386, -0.4017258, 1.356522, 0, 0, 0, 1, 1,
2.112083, -0.6685117, 2.788249, 0, 0, 0, 1, 1,
2.117064, -1.013625, 1.085414, 0, 0, 0, 1, 1,
2.17045, -0.3121178, 1.944934, 0, 0, 0, 1, 1,
2.190245, 0.577527, 1.282243, 0, 0, 0, 1, 1,
2.196542, -1.891302, 2.188421, 0, 0, 0, 1, 1,
2.318102, -1.014373, 1.984588, 1, 1, 1, 1, 1,
2.336383, -0.6621215, 1.690913, 1, 1, 1, 1, 1,
2.391834, -0.9907477, 2.899987, 1, 1, 1, 1, 1,
2.46533, -0.7438788, 0.4177381, 1, 1, 1, 1, 1,
2.538194, 0.2561992, 0.1954123, 1, 1, 1, 1, 1,
2.837896, 0.3551892, -0.763029, 1, 1, 1, 1, 1,
3.379611, 2.730566, 3.205957, 1, 1, 1, 1, 1
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
var radius = 9.657575;
var distance = 33.92182;
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
mvMatrix.translate( -0.131357, -0.3610933, -0.2099497 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.92182);
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
