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
-3.090979, 0.1615718, -2.455828, 1, 0, 0, 1,
-2.936602, -0.09025782, -1.623328, 1, 0.007843138, 0, 1,
-2.757106, -0.6693829, -1.56106, 1, 0.01176471, 0, 1,
-2.673536, 0.1783663, -2.015737, 1, 0.01960784, 0, 1,
-2.575583, -0.08754751, -2.097492, 1, 0.02352941, 0, 1,
-2.552699, -1.198209, -2.531881, 1, 0.03137255, 0, 1,
-2.526962, -0.079221, -1.999467, 1, 0.03529412, 0, 1,
-2.522137, -0.7385355, -2.66272, 1, 0.04313726, 0, 1,
-2.362849, 0.2317925, -0.3977906, 1, 0.04705882, 0, 1,
-2.221505, -0.27958, -2.159371, 1, 0.05490196, 0, 1,
-2.21678, -0.1377624, -3.259935, 1, 0.05882353, 0, 1,
-2.183362, 0.3736008, -2.175466, 1, 0.06666667, 0, 1,
-2.18061, 0.04918437, -3.528227, 1, 0.07058824, 0, 1,
-2.168755, -0.808453, -1.233995, 1, 0.07843138, 0, 1,
-2.090363, 1.477573, -1.975375, 1, 0.08235294, 0, 1,
-2.074892, 1.311203, -1.532151, 1, 0.09019608, 0, 1,
-2.069595, 0.7168273, -1.49823, 1, 0.09411765, 0, 1,
-2.007127, -1.228716, -0.9920164, 1, 0.1019608, 0, 1,
-1.982099, -0.5702701, -1.266532, 1, 0.1098039, 0, 1,
-1.974734, -0.1999927, 0.3969413, 1, 0.1137255, 0, 1,
-1.965796, 1.988031, 1.262998, 1, 0.1215686, 0, 1,
-1.948957, 0.8787167, -1.294993, 1, 0.1254902, 0, 1,
-1.920878, -1.660126, -4.029474, 1, 0.1333333, 0, 1,
-1.920329, 1.045852, -0.8321266, 1, 0.1372549, 0, 1,
-1.910871, -0.2935983, -1.636468, 1, 0.145098, 0, 1,
-1.888824, -1.615243, -1.416036, 1, 0.1490196, 0, 1,
-1.857141, -0.1702237, -3.34003, 1, 0.1568628, 0, 1,
-1.838935, 0.97991, 0.2291393, 1, 0.1607843, 0, 1,
-1.818516, 0.8454735, 0.2287422, 1, 0.1686275, 0, 1,
-1.808124, -1.777988, -3.29748, 1, 0.172549, 0, 1,
-1.798746, -1.213854, -1.796326, 1, 0.1803922, 0, 1,
-1.786549, 0.07127304, -1.938374, 1, 0.1843137, 0, 1,
-1.782498, 0.5256114, -2.692563, 1, 0.1921569, 0, 1,
-1.758937, -2.034528, -2.628898, 1, 0.1960784, 0, 1,
-1.756614, -0.4723055, -1.529794, 1, 0.2039216, 0, 1,
-1.748769, 0.2871792, -1.961009, 1, 0.2117647, 0, 1,
-1.741185, -1.211889, -2.37615, 1, 0.2156863, 0, 1,
-1.719124, 0.0708695, -0.5530541, 1, 0.2235294, 0, 1,
-1.710735, -0.8089542, -1.576251, 1, 0.227451, 0, 1,
-1.679291, 0.02938436, -2.603965, 1, 0.2352941, 0, 1,
-1.672849, -0.02571747, -2.599014, 1, 0.2392157, 0, 1,
-1.664962, 0.5570593, -2.3909, 1, 0.2470588, 0, 1,
-1.659773, 0.5568566, -0.299365, 1, 0.2509804, 0, 1,
-1.640915, -1.211027, -0.7036401, 1, 0.2588235, 0, 1,
-1.635871, 1.069041, -1.079516, 1, 0.2627451, 0, 1,
-1.602565, 0.1892237, -0.9483384, 1, 0.2705882, 0, 1,
-1.583782, -1.296806, -1.920581, 1, 0.2745098, 0, 1,
-1.579206, 0.400111, -2.08739, 1, 0.282353, 0, 1,
-1.571409, 0.6469469, 0.2755353, 1, 0.2862745, 0, 1,
-1.571219, 1.764317, -1.222564, 1, 0.2941177, 0, 1,
-1.570304, 0.969003, -0.8193215, 1, 0.3019608, 0, 1,
-1.55104, 0.1233785, -0.05872274, 1, 0.3058824, 0, 1,
-1.550109, -0.2642263, -1.523149, 1, 0.3137255, 0, 1,
-1.546986, -0.8394089, -1.428862, 1, 0.3176471, 0, 1,
-1.538241, 0.5412797, -1.325015, 1, 0.3254902, 0, 1,
-1.533362, -2.746128, -4.991855, 1, 0.3294118, 0, 1,
-1.52801, -0.1845293, -2.65861, 1, 0.3372549, 0, 1,
-1.526032, 0.05510719, -2.7936, 1, 0.3411765, 0, 1,
-1.510535, -0.357245, -2.131338, 1, 0.3490196, 0, 1,
-1.497289, 1.235472, -0.2244996, 1, 0.3529412, 0, 1,
-1.489823, 0.5206403, 0.3987229, 1, 0.3607843, 0, 1,
-1.482502, -0.2054215, -0.7279499, 1, 0.3647059, 0, 1,
-1.473778, -0.4533372, -2.217294, 1, 0.372549, 0, 1,
-1.467935, -0.8275076, -2.139016, 1, 0.3764706, 0, 1,
-1.46749, -0.3903762, 0.08193175, 1, 0.3843137, 0, 1,
-1.464405, -0.6070173, -2.378918, 1, 0.3882353, 0, 1,
-1.453766, 0.6063788, -3.335, 1, 0.3960784, 0, 1,
-1.450466, -1.010463, -2.004711, 1, 0.4039216, 0, 1,
-1.436224, -0.4697614, -3.044514, 1, 0.4078431, 0, 1,
-1.431793, -0.1971516, -0.9009718, 1, 0.4156863, 0, 1,
-1.421682, 1.028556, -0.4190654, 1, 0.4196078, 0, 1,
-1.412991, -1.197688, -2.201715, 1, 0.427451, 0, 1,
-1.411364, 0.3106108, -0.5060043, 1, 0.4313726, 0, 1,
-1.405303, -0.9932588, -2.938172, 1, 0.4392157, 0, 1,
-1.394907, 1.692962, -1.16768, 1, 0.4431373, 0, 1,
-1.390968, 0.4946253, -1.911223, 1, 0.4509804, 0, 1,
-1.379657, -0.5942158, -0.5437313, 1, 0.454902, 0, 1,
-1.366011, -1.60385, -2.392065, 1, 0.4627451, 0, 1,
-1.366002, -1.093064, -0.5148872, 1, 0.4666667, 0, 1,
-1.365702, 1.362222, -0.8590678, 1, 0.4745098, 0, 1,
-1.353446, -0.3485601, -1.479696, 1, 0.4784314, 0, 1,
-1.349985, -1.327302, -2.375636, 1, 0.4862745, 0, 1,
-1.348968, 0.4307815, -2.321436, 1, 0.4901961, 0, 1,
-1.343621, 1.11352, -0.8436154, 1, 0.4980392, 0, 1,
-1.341833, -0.9321909, -2.346288, 1, 0.5058824, 0, 1,
-1.339895, 0.2756392, -1.240285, 1, 0.509804, 0, 1,
-1.327009, 0.1674815, -1.952587, 1, 0.5176471, 0, 1,
-1.326967, -0.2906792, -0.08195461, 1, 0.5215687, 0, 1,
-1.321124, 0.4557507, 0.6087319, 1, 0.5294118, 0, 1,
-1.319209, -0.32521, -2.625966, 1, 0.5333334, 0, 1,
-1.318772, 0.5681162, -2.328352, 1, 0.5411765, 0, 1,
-1.316715, -2.434168, -2.634156, 1, 0.5450981, 0, 1,
-1.309434, -0.3695079, -1.182844, 1, 0.5529412, 0, 1,
-1.298464, -0.5073176, -0.4163834, 1, 0.5568628, 0, 1,
-1.297628, 0.7135556, -1.70151, 1, 0.5647059, 0, 1,
-1.288793, 0.1374923, -1.014456, 1, 0.5686275, 0, 1,
-1.286386, -0.9813455, -3.24989, 1, 0.5764706, 0, 1,
-1.286087, -0.505499, -1.358504, 1, 0.5803922, 0, 1,
-1.267259, 0.9031352, -0.3342965, 1, 0.5882353, 0, 1,
-1.253481, -0.03644517, -1.503462, 1, 0.5921569, 0, 1,
-1.246669, 1.010268, -0.4305367, 1, 0.6, 0, 1,
-1.244735, -1.110682, -1.582999, 1, 0.6078432, 0, 1,
-1.239457, -0.2744043, 0.2609388, 1, 0.6117647, 0, 1,
-1.23728, 0.412177, -1.433115, 1, 0.6196079, 0, 1,
-1.230947, 0.4784901, -0.6915861, 1, 0.6235294, 0, 1,
-1.223546, 1.98051, -1.615351, 1, 0.6313726, 0, 1,
-1.220587, 0.65965, 0.614934, 1, 0.6352941, 0, 1,
-1.211241, 0.3264382, 0.7404688, 1, 0.6431373, 0, 1,
-1.210796, 1.046506, -1.929032, 1, 0.6470588, 0, 1,
-1.208832, -0.04147241, -1.068868, 1, 0.654902, 0, 1,
-1.202037, 0.4151017, -2.244955, 1, 0.6588235, 0, 1,
-1.198299, -0.8254986, -2.179716, 1, 0.6666667, 0, 1,
-1.193799, 0.08148649, 0.6309712, 1, 0.6705883, 0, 1,
-1.19054, 0.1536375, -1.793095, 1, 0.6784314, 0, 1,
-1.187833, 1.057026, -4.073116, 1, 0.682353, 0, 1,
-1.174343, 1.364146, 0.1895739, 1, 0.6901961, 0, 1,
-1.163658, -0.8795385, -2.403628, 1, 0.6941177, 0, 1,
-1.162888, 0.06763161, -2.983925, 1, 0.7019608, 0, 1,
-1.156386, -1.339615, -4.381084, 1, 0.7098039, 0, 1,
-1.150375, -1.492647, -2.47702, 1, 0.7137255, 0, 1,
-1.149914, 0.1277584, -0.3844256, 1, 0.7215686, 0, 1,
-1.146187, -1.39537, -2.469537, 1, 0.7254902, 0, 1,
-1.141606, 0.9223589, 0.2659115, 1, 0.7333333, 0, 1,
-1.134093, 0.6665067, -1.389854, 1, 0.7372549, 0, 1,
-1.126672, -1.82972, -2.795393, 1, 0.7450981, 0, 1,
-1.125974, -0.2802951, -0.9616791, 1, 0.7490196, 0, 1,
-1.123849, 0.08862697, -1.457534, 1, 0.7568628, 0, 1,
-1.117872, -0.1363588, -4.323105, 1, 0.7607843, 0, 1,
-1.115626, -1.747777, -2.851154, 1, 0.7686275, 0, 1,
-1.112492, 0.02993866, -2.495511, 1, 0.772549, 0, 1,
-1.102269, 0.1079862, -1.374141, 1, 0.7803922, 0, 1,
-1.097356, 0.8997456, 0.4126245, 1, 0.7843137, 0, 1,
-1.091285, -0.5266993, -2.120647, 1, 0.7921569, 0, 1,
-1.087429, 0.0112159, -2.152946, 1, 0.7960784, 0, 1,
-1.085119, -1.110704, -3.213728, 1, 0.8039216, 0, 1,
-1.072377, 0.594534, -1.198031, 1, 0.8117647, 0, 1,
-1.061955, -1.169983, -0.7720631, 1, 0.8156863, 0, 1,
-1.060806, 0.4532212, -1.376785, 1, 0.8235294, 0, 1,
-1.04903, -0.8137976, -1.697169, 1, 0.827451, 0, 1,
-1.048939, 0.2660462, -1.095373, 1, 0.8352941, 0, 1,
-1.047907, 0.4407409, -1.005233, 1, 0.8392157, 0, 1,
-1.040988, -0.6124133, -0.8526624, 1, 0.8470588, 0, 1,
-1.022565, -1.239158, -3.761397, 1, 0.8509804, 0, 1,
-1.016899, 0.9334162, -1.170633, 1, 0.8588235, 0, 1,
-1.013775, 1.209388, -0.1723878, 1, 0.8627451, 0, 1,
-1.011382, 0.5448979, -0.7178959, 1, 0.8705882, 0, 1,
-0.9991186, -0.4889075, -2.89819, 1, 0.8745098, 0, 1,
-0.9932253, 1.653131, -2.300861, 1, 0.8823529, 0, 1,
-0.988022, 0.4851532, -0.2786372, 1, 0.8862745, 0, 1,
-0.9867905, 1.339463, -1.338271, 1, 0.8941177, 0, 1,
-0.9845029, 0.9100351, -2.993711, 1, 0.8980392, 0, 1,
-0.981065, -1.904875, -0.968434, 1, 0.9058824, 0, 1,
-0.9758643, -0.3420672, -2.637088, 1, 0.9137255, 0, 1,
-0.9719095, -1.02681, -1.644971, 1, 0.9176471, 0, 1,
-0.9683471, 0.4581256, -0.6054248, 1, 0.9254902, 0, 1,
-0.9618269, -0.4541877, -1.277525, 1, 0.9294118, 0, 1,
-0.9604705, 0.7315571, -1.302798, 1, 0.9372549, 0, 1,
-0.9559988, -1.44408, -1.313469, 1, 0.9411765, 0, 1,
-0.9531795, 0.7104872, -1.70733, 1, 0.9490196, 0, 1,
-0.9483343, 0.8563985, -1.87959, 1, 0.9529412, 0, 1,
-0.9480275, 0.8477633, -0.2281067, 1, 0.9607843, 0, 1,
-0.941633, -1.442116, -2.443824, 1, 0.9647059, 0, 1,
-0.9342941, -0.5358461, -3.234737, 1, 0.972549, 0, 1,
-0.9326724, -1.779056, -1.110693, 1, 0.9764706, 0, 1,
-0.9246786, 1.796563, -0.1233507, 1, 0.9843137, 0, 1,
-0.9221837, 1.244541, -2.745169, 1, 0.9882353, 0, 1,
-0.9169177, -0.5751872, -2.53663, 1, 0.9960784, 0, 1,
-0.9148453, -0.4417281, -1.504272, 0.9960784, 1, 0, 1,
-0.9135469, -1.275829, -3.78751, 0.9921569, 1, 0, 1,
-0.9064484, 0.2877844, -0.3622433, 0.9843137, 1, 0, 1,
-0.9031781, 0.2226029, -1.305545, 0.9803922, 1, 0, 1,
-0.8917997, -0.7189153, -2.508069, 0.972549, 1, 0, 1,
-0.8891857, -0.5747582, -2.19577, 0.9686275, 1, 0, 1,
-0.8884928, -0.4065819, -4.146499, 0.9607843, 1, 0, 1,
-0.8874041, -0.7245939, -1.824124, 0.9568627, 1, 0, 1,
-0.8851587, 0.09299684, -1.3688, 0.9490196, 1, 0, 1,
-0.8816864, 0.3227756, -0.8517208, 0.945098, 1, 0, 1,
-0.8785746, 1.39153, 0.3388087, 0.9372549, 1, 0, 1,
-0.8768103, 2.126858, -0.8239288, 0.9333333, 1, 0, 1,
-0.8741109, 1.735814, -0.5307955, 0.9254902, 1, 0, 1,
-0.8687088, 1.522367, -0.7678518, 0.9215686, 1, 0, 1,
-0.8645238, 1.354048, -1.050676, 0.9137255, 1, 0, 1,
-0.863807, 0.1403081, -1.975523, 0.9098039, 1, 0, 1,
-0.8625038, 1.197954, 0.5872778, 0.9019608, 1, 0, 1,
-0.8605014, -0.253662, -1.652681, 0.8941177, 1, 0, 1,
-0.8553286, 0.3443511, -0.9247181, 0.8901961, 1, 0, 1,
-0.8510559, 0.6810073, -1.095349, 0.8823529, 1, 0, 1,
-0.8508664, -0.7489507, -2.436471, 0.8784314, 1, 0, 1,
-0.8385417, 0.0812095, -2.359031, 0.8705882, 1, 0, 1,
-0.8384888, -0.2347836, -3.459561, 0.8666667, 1, 0, 1,
-0.8317935, -0.113724, -3.541788, 0.8588235, 1, 0, 1,
-0.8259643, 0.6861316, -2.090871, 0.854902, 1, 0, 1,
-0.8146155, -0.07011314, -0.8733925, 0.8470588, 1, 0, 1,
-0.8133174, 0.2935389, -2.695709, 0.8431373, 1, 0, 1,
-0.7949285, -1.544353, -1.793388, 0.8352941, 1, 0, 1,
-0.791064, 0.2539882, -2.416678, 0.8313726, 1, 0, 1,
-0.7907419, 1.941335, -0.195744, 0.8235294, 1, 0, 1,
-0.7902652, 1.177005, 0.1227935, 0.8196079, 1, 0, 1,
-0.7901032, -1.221429, -2.468072, 0.8117647, 1, 0, 1,
-0.7835718, -0.7949467, -1.70413, 0.8078431, 1, 0, 1,
-0.7828165, 0.7233211, -0.8133698, 0.8, 1, 0, 1,
-0.7827868, -0.636677, -1.15691, 0.7921569, 1, 0, 1,
-0.781054, -0.1270308, -1.542926, 0.7882353, 1, 0, 1,
-0.7653464, -0.04081027, -1.654238, 0.7803922, 1, 0, 1,
-0.7648057, 1.517139, -1.397684, 0.7764706, 1, 0, 1,
-0.7638546, -1.43158, -4.96871, 0.7686275, 1, 0, 1,
-0.7589512, 0.1270204, -2.048412, 0.7647059, 1, 0, 1,
-0.7573618, -0.5072104, -1.599155, 0.7568628, 1, 0, 1,
-0.7521643, -0.2113704, -0.9291678, 0.7529412, 1, 0, 1,
-0.7488791, -0.04177715, -0.7151173, 0.7450981, 1, 0, 1,
-0.7479129, 1.201369, 3.112763, 0.7411765, 1, 0, 1,
-0.7443683, -0.3101868, -0.3524165, 0.7333333, 1, 0, 1,
-0.7406549, -1.165894, -2.20656, 0.7294118, 1, 0, 1,
-0.7405398, -0.4206375, -2.977883, 0.7215686, 1, 0, 1,
-0.7400052, 1.271985, -0.5746132, 0.7176471, 1, 0, 1,
-0.7392259, 0.5309104, -1.715192, 0.7098039, 1, 0, 1,
-0.735149, 2.441951, 0.7273723, 0.7058824, 1, 0, 1,
-0.7329656, 0.5163679, -0.8987585, 0.6980392, 1, 0, 1,
-0.731526, -2.022177, -3.216728, 0.6901961, 1, 0, 1,
-0.7253476, -1.435697, -2.858637, 0.6862745, 1, 0, 1,
-0.7221166, -0.5335261, -1.037716, 0.6784314, 1, 0, 1,
-0.7215786, 0.797798, -1.63086, 0.6745098, 1, 0, 1,
-0.7128468, -0.8324969, -3.242237, 0.6666667, 1, 0, 1,
-0.711646, 1.501427, -0.6088012, 0.6627451, 1, 0, 1,
-0.7112526, -0.6461146, -2.795442, 0.654902, 1, 0, 1,
-0.7076508, 1.649181, -1.429651, 0.6509804, 1, 0, 1,
-0.7069286, 0.1780733, -0.0779487, 0.6431373, 1, 0, 1,
-0.7028542, -0.886383, -2.660094, 0.6392157, 1, 0, 1,
-0.7017208, -0.6348904, -2.387492, 0.6313726, 1, 0, 1,
-0.7004735, 1.239101, -0.5593271, 0.627451, 1, 0, 1,
-0.6909873, -0.4272888, -2.549962, 0.6196079, 1, 0, 1,
-0.6909724, 0.1530359, -1.810753, 0.6156863, 1, 0, 1,
-0.6903872, -0.4115232, -2.468866, 0.6078432, 1, 0, 1,
-0.6889622, -0.3818007, -1.160834, 0.6039216, 1, 0, 1,
-0.6838037, -0.4107094, -3.260065, 0.5960785, 1, 0, 1,
-0.680375, 0.7384061, -0.4131572, 0.5882353, 1, 0, 1,
-0.6801537, -1.089169, -3.744677, 0.5843138, 1, 0, 1,
-0.6768677, 0.5015852, -0.5709786, 0.5764706, 1, 0, 1,
-0.6753979, 0.1875088, 0.07879999, 0.572549, 1, 0, 1,
-0.6749588, -0.01567537, -2.901632, 0.5647059, 1, 0, 1,
-0.667827, 0.477431, 0.2767606, 0.5607843, 1, 0, 1,
-0.6659172, 0.03912673, -0.7938603, 0.5529412, 1, 0, 1,
-0.660745, 0.5837787, -2.376628, 0.5490196, 1, 0, 1,
-0.6506879, -0.6116587, -1.700634, 0.5411765, 1, 0, 1,
-0.6473595, 1.876889, -0.7042268, 0.5372549, 1, 0, 1,
-0.6462001, -1.423254, -4.799563, 0.5294118, 1, 0, 1,
-0.6424051, 1.054691, 0.2966916, 0.5254902, 1, 0, 1,
-0.6387537, -0.8686292, -2.605541, 0.5176471, 1, 0, 1,
-0.635326, 0.03965049, -0.5033069, 0.5137255, 1, 0, 1,
-0.6313276, 1.613598, 0.6378301, 0.5058824, 1, 0, 1,
-0.6290153, 0.05044996, -0.8807761, 0.5019608, 1, 0, 1,
-0.6268134, -0.6663961, -4.379822, 0.4941176, 1, 0, 1,
-0.6183535, -0.3806834, -2.814137, 0.4862745, 1, 0, 1,
-0.6169662, -0.7097639, -1.276186, 0.4823529, 1, 0, 1,
-0.6151286, -0.03428482, -1.468186, 0.4745098, 1, 0, 1,
-0.6140264, -0.3535787, -1.545526, 0.4705882, 1, 0, 1,
-0.6136131, -0.07524646, -2.656519, 0.4627451, 1, 0, 1,
-0.6135631, -0.7266844, -3.212786, 0.4588235, 1, 0, 1,
-0.6045128, 0.05526096, -3.634873, 0.4509804, 1, 0, 1,
-0.6025832, -0.3421768, -1.188606, 0.4470588, 1, 0, 1,
-0.6018879, -0.037233, -1.29314, 0.4392157, 1, 0, 1,
-0.6012675, 0.7581317, -2.351543, 0.4352941, 1, 0, 1,
-0.5951267, -0.5213403, -2.029258, 0.427451, 1, 0, 1,
-0.5939406, 0.3232108, 0.1143544, 0.4235294, 1, 0, 1,
-0.5928819, -0.09310134, -0.3560191, 0.4156863, 1, 0, 1,
-0.5918828, 0.4731963, 1.671319, 0.4117647, 1, 0, 1,
-0.5912934, -0.8392425, -1.990706, 0.4039216, 1, 0, 1,
-0.5668545, 0.842813, -0.2562303, 0.3960784, 1, 0, 1,
-0.5656248, 0.2805552, -0.02467704, 0.3921569, 1, 0, 1,
-0.5595477, -0.5946591, -2.842085, 0.3843137, 1, 0, 1,
-0.5544009, -0.3515271, -4.810194, 0.3803922, 1, 0, 1,
-0.5503324, 0.9931391, -1.707863, 0.372549, 1, 0, 1,
-0.5495157, 0.7384516, -0.8270159, 0.3686275, 1, 0, 1,
-0.5493913, 0.8014356, -0.2330208, 0.3607843, 1, 0, 1,
-0.5458922, 1.018875, -0.5856819, 0.3568628, 1, 0, 1,
-0.5413558, -1.595731, -3.060564, 0.3490196, 1, 0, 1,
-0.5400518, -1.637625, -2.229562, 0.345098, 1, 0, 1,
-0.5262505, -1.003345, -3.637692, 0.3372549, 1, 0, 1,
-0.5247697, -0.1664829, -2.531419, 0.3333333, 1, 0, 1,
-0.5182709, 1.843377, 0.8869289, 0.3254902, 1, 0, 1,
-0.5182687, -0.3197213, -2.371347, 0.3215686, 1, 0, 1,
-0.5166652, -0.2243239, -1.151401, 0.3137255, 1, 0, 1,
-0.5156949, 0.2584251, -1.690139, 0.3098039, 1, 0, 1,
-0.5151223, 0.7933761, -1.337001, 0.3019608, 1, 0, 1,
-0.5129603, 0.4975916, -0.7026753, 0.2941177, 1, 0, 1,
-0.509259, -1.29275, -3.601029, 0.2901961, 1, 0, 1,
-0.5085889, -0.72271, -2.718002, 0.282353, 1, 0, 1,
-0.5055886, -0.06759142, -1.622554, 0.2784314, 1, 0, 1,
-0.4975365, -0.1868169, -1.490717, 0.2705882, 1, 0, 1,
-0.4942839, 1.653173, -3.053173, 0.2666667, 1, 0, 1,
-0.4939297, -0.1900668, -2.648497, 0.2588235, 1, 0, 1,
-0.49093, -0.8014941, -3.650202, 0.254902, 1, 0, 1,
-0.4909068, 1.356702, 0.446503, 0.2470588, 1, 0, 1,
-0.4899446, 0.4952065, -1.691632, 0.2431373, 1, 0, 1,
-0.4882471, -0.2868896, -1.582863, 0.2352941, 1, 0, 1,
-0.4877855, 0.3750606, -2.085227, 0.2313726, 1, 0, 1,
-0.4824131, 0.3950957, -1.821816, 0.2235294, 1, 0, 1,
-0.4749003, -3.161412, -2.165758, 0.2196078, 1, 0, 1,
-0.4705425, -0.3623259, -2.764946, 0.2117647, 1, 0, 1,
-0.468687, 0.9271964, 0.01865377, 0.2078431, 1, 0, 1,
-0.4604456, 0.1082167, -1.034843, 0.2, 1, 0, 1,
-0.4577279, 0.5803737, -1.597097, 0.1921569, 1, 0, 1,
-0.4553787, 0.8307272, -0.05515938, 0.1882353, 1, 0, 1,
-0.4520396, -1.316263, -3.778434, 0.1803922, 1, 0, 1,
-0.4499465, -0.1838516, -1.753781, 0.1764706, 1, 0, 1,
-0.4490242, 0.7200813, 0.1968575, 0.1686275, 1, 0, 1,
-0.4468319, -0.3598578, -2.306998, 0.1647059, 1, 0, 1,
-0.4442452, 0.09634341, -1.276627, 0.1568628, 1, 0, 1,
-0.4418982, -0.03433255, -3.364882, 0.1529412, 1, 0, 1,
-0.4401164, -0.1425752, -1.945515, 0.145098, 1, 0, 1,
-0.4365341, 0.7009072, -1.03899, 0.1411765, 1, 0, 1,
-0.4349286, -1.164831, -3.242459, 0.1333333, 1, 0, 1,
-0.4273046, 0.7291709, 1.073629, 0.1294118, 1, 0, 1,
-0.4271534, 1.423317, -0.5074511, 0.1215686, 1, 0, 1,
-0.4226054, 0.5974647, -2.430312, 0.1176471, 1, 0, 1,
-0.419634, -0.6093848, -3.288385, 0.1098039, 1, 0, 1,
-0.4173163, -0.3298175, -1.981843, 0.1058824, 1, 0, 1,
-0.4170852, 0.4110675, -1.934499, 0.09803922, 1, 0, 1,
-0.4160928, 1.283717, 0.1086664, 0.09019608, 1, 0, 1,
-0.4123557, -0.2335854, -3.139302, 0.08627451, 1, 0, 1,
-0.4111907, -0.115395, -0.9102377, 0.07843138, 1, 0, 1,
-0.408897, 0.7109918, 1.06945, 0.07450981, 1, 0, 1,
-0.4082701, -0.7874956, -2.029604, 0.06666667, 1, 0, 1,
-0.4054618, -0.3918771, -2.742972, 0.0627451, 1, 0, 1,
-0.4020142, -0.4462619, -2.516806, 0.05490196, 1, 0, 1,
-0.400624, -0.4995922, -3.342433, 0.05098039, 1, 0, 1,
-0.3891539, -0.1597767, -1.294016, 0.04313726, 1, 0, 1,
-0.3880876, 0.68246, -0.15973, 0.03921569, 1, 0, 1,
-0.3817683, 0.7401492, -1.068114, 0.03137255, 1, 0, 1,
-0.3781218, 1.034058, -1.006283, 0.02745098, 1, 0, 1,
-0.3749515, -1.123707, -1.917634, 0.01960784, 1, 0, 1,
-0.3712024, -1.09221, -2.5032, 0.01568628, 1, 0, 1,
-0.3670861, -1.229773, -2.327961, 0.007843138, 1, 0, 1,
-0.3637083, -0.8854666, -2.770177, 0.003921569, 1, 0, 1,
-0.3578746, 0.04113656, -1.035005, 0, 1, 0.003921569, 1,
-0.3563258, 1.00564, -0.4709691, 0, 1, 0.01176471, 1,
-0.3545649, -0.2133091, -0.7916219, 0, 1, 0.01568628, 1,
-0.35242, -0.6760604, -1.699037, 0, 1, 0.02352941, 1,
-0.351179, -1.172983, -2.753763, 0, 1, 0.02745098, 1,
-0.3488778, -0.2756423, -2.058396, 0, 1, 0.03529412, 1,
-0.3461955, -0.4253942, -2.426466, 0, 1, 0.03921569, 1,
-0.3433257, -0.7612862, -3.562157, 0, 1, 0.04705882, 1,
-0.3414393, 0.06688444, -4.349452, 0, 1, 0.05098039, 1,
-0.3397118, -1.867804, -1.898293, 0, 1, 0.05882353, 1,
-0.3372949, -1.493849, -4.758636, 0, 1, 0.0627451, 1,
-0.3369727, -0.1575467, -2.110305, 0, 1, 0.07058824, 1,
-0.3341489, 0.5759688, -0.2726433, 0, 1, 0.07450981, 1,
-0.3333792, 0.8250904, 0.1649473, 0, 1, 0.08235294, 1,
-0.3301169, -0.5016198, -3.333908, 0, 1, 0.08627451, 1,
-0.3268408, -1.546198, -2.9685, 0, 1, 0.09411765, 1,
-0.3258877, -0.09406453, -3.513421, 0, 1, 0.1019608, 1,
-0.3258859, -0.1798349, -1.359078, 0, 1, 0.1058824, 1,
-0.325778, -1.008947, -3.942351, 0, 1, 0.1137255, 1,
-0.3256052, -1.240957, -1.780087, 0, 1, 0.1176471, 1,
-0.3251651, -1.13988, -4.103995, 0, 1, 0.1254902, 1,
-0.3242441, 0.6981081, 0.2039286, 0, 1, 0.1294118, 1,
-0.3227993, 1.939385, -0.8353972, 0, 1, 0.1372549, 1,
-0.3183616, -1.195509, -2.726578, 0, 1, 0.1411765, 1,
-0.3145872, -1.207611, -4.260773, 0, 1, 0.1490196, 1,
-0.3145283, -0.1114677, -3.66159, 0, 1, 0.1529412, 1,
-0.314527, 1.070118, -1.259062, 0, 1, 0.1607843, 1,
-0.3092573, -1.22931, -1.486571, 0, 1, 0.1647059, 1,
-0.3086302, 0.1184625, -2.395747, 0, 1, 0.172549, 1,
-0.3058476, -0.2506789, -3.312089, 0, 1, 0.1764706, 1,
-0.3044529, -0.8802062, -4.490611, 0, 1, 0.1843137, 1,
-0.3041504, 3.81325, 0.9692256, 0, 1, 0.1882353, 1,
-0.2989692, -1.010067, -3.994594, 0, 1, 0.1960784, 1,
-0.2957375, -1.454082, -4.302466, 0, 1, 0.2039216, 1,
-0.2937841, -1.698925, -2.642769, 0, 1, 0.2078431, 1,
-0.2917373, 0.2818149, 0.4123464, 0, 1, 0.2156863, 1,
-0.2853058, -0.4543209, -0.7076317, 0, 1, 0.2196078, 1,
-0.283697, 0.5334606, -0.5567983, 0, 1, 0.227451, 1,
-0.2829646, -0.8247274, -2.202901, 0, 1, 0.2313726, 1,
-0.2817135, 1.119282, -0.2997121, 0, 1, 0.2392157, 1,
-0.2726532, -0.2334793, -0.9090611, 0, 1, 0.2431373, 1,
-0.2721171, 0.9531996, 0.7454971, 0, 1, 0.2509804, 1,
-0.2714521, -2.140193, -4.154007, 0, 1, 0.254902, 1,
-0.2691117, -0.7373627, -3.574304, 0, 1, 0.2627451, 1,
-0.2689931, -0.1588768, -1.500891, 0, 1, 0.2666667, 1,
-0.2678358, -0.3701636, 0.1617204, 0, 1, 0.2745098, 1,
-0.2675168, -1.475818, -1.702725, 0, 1, 0.2784314, 1,
-0.2673799, 0.3880524, -0.1433011, 0, 1, 0.2862745, 1,
-0.2647518, 1.89977, 0.7861949, 0, 1, 0.2901961, 1,
-0.262535, 0.06369749, -3.158645, 0, 1, 0.2980392, 1,
-0.2618177, 0.1496074, -1.226798, 0, 1, 0.3058824, 1,
-0.2605212, 0.01708049, -2.64623, 0, 1, 0.3098039, 1,
-0.246441, -0.03246989, -1.192592, 0, 1, 0.3176471, 1,
-0.2438639, 0.5706112, 0.8857615, 0, 1, 0.3215686, 1,
-0.2438226, -1.431537, -3.721686, 0, 1, 0.3294118, 1,
-0.2420823, 0.742133, -0.2905144, 0, 1, 0.3333333, 1,
-0.2393053, -0.1984312, -1.425352, 0, 1, 0.3411765, 1,
-0.2352222, 0.1402993, 0.2196471, 0, 1, 0.345098, 1,
-0.2331355, -1.244029, -1.372299, 0, 1, 0.3529412, 1,
-0.2326865, -0.6461719, -2.552377, 0, 1, 0.3568628, 1,
-0.2322983, -1.089752, -3.183989, 0, 1, 0.3647059, 1,
-0.2291107, 1.589013, 1.929248, 0, 1, 0.3686275, 1,
-0.2224216, 1.217734, -0.2722917, 0, 1, 0.3764706, 1,
-0.2220436, -0.1047014, -0.8909233, 0, 1, 0.3803922, 1,
-0.2201024, 0.2818734, -1.909274, 0, 1, 0.3882353, 1,
-0.2186593, -0.8653751, -1.130528, 0, 1, 0.3921569, 1,
-0.2149671, -0.5069, -3.56584, 0, 1, 0.4, 1,
-0.2120579, -0.7590812, -4.260149, 0, 1, 0.4078431, 1,
-0.2071573, 1.731807, 1.071484, 0, 1, 0.4117647, 1,
-0.2057205, 2.288231, -0.0684016, 0, 1, 0.4196078, 1,
-0.2009287, -0.5259978, -4.781307, 0, 1, 0.4235294, 1,
-0.2008107, -0.7103635, -3.43144, 0, 1, 0.4313726, 1,
-0.1951959, 1.661504, -1.041676, 0, 1, 0.4352941, 1,
-0.1946098, -0.820706, -2.914942, 0, 1, 0.4431373, 1,
-0.1910755, 0.3486307, -0.3859197, 0, 1, 0.4470588, 1,
-0.191054, 0.3973919, -0.193607, 0, 1, 0.454902, 1,
-0.1909267, 0.219258, -1.556887, 0, 1, 0.4588235, 1,
-0.1863302, 1.558489, -0.8497162, 0, 1, 0.4666667, 1,
-0.1828109, 1.95794, 0.9001331, 0, 1, 0.4705882, 1,
-0.1808298, -1.721531, -2.031229, 0, 1, 0.4784314, 1,
-0.1791284, 1.284574, -1.602071, 0, 1, 0.4823529, 1,
-0.1709273, -1.17929, -4.945035, 0, 1, 0.4901961, 1,
-0.16399, -0.6446648, -1.161472, 0, 1, 0.4941176, 1,
-0.1639848, 0.2302455, -1.901669, 0, 1, 0.5019608, 1,
-0.1628168, 1.992216, 1.445846, 0, 1, 0.509804, 1,
-0.1576833, -1.56348, -4.075001, 0, 1, 0.5137255, 1,
-0.1561311, -0.2582978, -3.244479, 0, 1, 0.5215687, 1,
-0.1517273, 0.1588816, -0.1369086, 0, 1, 0.5254902, 1,
-0.1343756, 0.7928221, 0.1375236, 0, 1, 0.5333334, 1,
-0.1293012, -0.4311625, -3.166139, 0, 1, 0.5372549, 1,
-0.1287214, -0.5703114, -2.764277, 0, 1, 0.5450981, 1,
-0.1284694, -1.008853, -2.450293, 0, 1, 0.5490196, 1,
-0.1271941, -0.766519, -2.332799, 0, 1, 0.5568628, 1,
-0.1205386, 0.652245, -0.3189374, 0, 1, 0.5607843, 1,
-0.1203173, 1.226149, 1.019264, 0, 1, 0.5686275, 1,
-0.1188919, 0.209038, -1.57331, 0, 1, 0.572549, 1,
-0.1177043, -0.2973048, -1.605202, 0, 1, 0.5803922, 1,
-0.1144499, -1.246664, -3.57927, 0, 1, 0.5843138, 1,
-0.1130155, 0.2502933, 0.5178305, 0, 1, 0.5921569, 1,
-0.1124512, 0.03006048, -0.8924738, 0, 1, 0.5960785, 1,
-0.1074883, -1.63344, -3.535987, 0, 1, 0.6039216, 1,
-0.1062646, -1.400977, -4.208756, 0, 1, 0.6117647, 1,
-0.1055787, 1.635163, 1.66622, 0, 1, 0.6156863, 1,
-0.1031302, -0.3139345, -3.398805, 0, 1, 0.6235294, 1,
-0.09839953, -1.032652, -3.145101, 0, 1, 0.627451, 1,
-0.09552796, 0.2207603, -1.134306, 0, 1, 0.6352941, 1,
-0.09510227, -1.467381, -3.188287, 0, 1, 0.6392157, 1,
-0.09329746, 0.2629808, -0.6098874, 0, 1, 0.6470588, 1,
-0.09209842, 0.05276267, -2.244372, 0, 1, 0.6509804, 1,
-0.09021913, 0.06361256, -0.9339398, 0, 1, 0.6588235, 1,
-0.08754919, -1.400571, -3.126709, 0, 1, 0.6627451, 1,
-0.08586073, -1.045006, -2.002537, 0, 1, 0.6705883, 1,
-0.08247249, 0.1031585, -0.9745396, 0, 1, 0.6745098, 1,
-0.08209946, 0.1094492, -0.8746681, 0, 1, 0.682353, 1,
-0.07907526, 0.5524551, 0.1913872, 0, 1, 0.6862745, 1,
-0.07792278, -0.4358754, -3.064646, 0, 1, 0.6941177, 1,
-0.07457062, 1.209185, -0.5721042, 0, 1, 0.7019608, 1,
-0.07286665, 0.1602085, -1.291953, 0, 1, 0.7058824, 1,
-0.07028077, 1.493664, 0.318823, 0, 1, 0.7137255, 1,
-0.06748041, -0.3528343, -4.855603, 0, 1, 0.7176471, 1,
-0.06645044, -0.4285124, -4.616539, 0, 1, 0.7254902, 1,
-0.06625649, -0.8343939, -0.6834646, 0, 1, 0.7294118, 1,
-0.06472077, 0.05650679, -1.644054, 0, 1, 0.7372549, 1,
-0.06387845, -0.1840896, -2.36358, 0, 1, 0.7411765, 1,
-0.06366953, -1.866285, -3.495355, 0, 1, 0.7490196, 1,
-0.06275306, 0.8846992, -0.4343756, 0, 1, 0.7529412, 1,
-0.06259701, 1.466459, -1.968416, 0, 1, 0.7607843, 1,
-0.06063573, -0.9079472, -1.928362, 0, 1, 0.7647059, 1,
-0.05666345, 0.3672028, -0.9771969, 0, 1, 0.772549, 1,
-0.05552866, 0.07464345, 0.751478, 0, 1, 0.7764706, 1,
-0.05349321, 1.627745, 0.2513592, 0, 1, 0.7843137, 1,
-0.04722106, 1.176062, -0.2526605, 0, 1, 0.7882353, 1,
-0.04618772, 0.1956694, 0.3649156, 0, 1, 0.7960784, 1,
-0.04041724, 0.584302, -1.401381, 0, 1, 0.8039216, 1,
-0.03908728, -2.008193, -3.191748, 0, 1, 0.8078431, 1,
-0.03534447, -0.7953064, -2.949195, 0, 1, 0.8156863, 1,
-0.03469044, -0.9436438, -3.087715, 0, 1, 0.8196079, 1,
-0.02361028, 0.1675563, -1.947628, 0, 1, 0.827451, 1,
-0.02108712, -1.44289, -3.258413, 0, 1, 0.8313726, 1,
-0.01903688, -1.090974, -2.351768, 0, 1, 0.8392157, 1,
-0.004311019, 0.1928415, -0.02616072, 0, 1, 0.8431373, 1,
-0.003613098, 0.5643079, -0.7273857, 0, 1, 0.8509804, 1,
-0.003570893, 0.4799036, -0.2140649, 0, 1, 0.854902, 1,
0.003873589, -1.044314, 3.203667, 0, 1, 0.8627451, 1,
0.004541645, -1.315692, 3.212172, 0, 1, 0.8666667, 1,
0.004609004, -1.490695, 3.150651, 0, 1, 0.8745098, 1,
0.005552821, -0.4425883, 2.943143, 0, 1, 0.8784314, 1,
0.006332836, -0.286901, 3.758161, 0, 1, 0.8862745, 1,
0.009519334, 1.427281, 0.7835435, 0, 1, 0.8901961, 1,
0.01039172, 0.7232518, 0.735431, 0, 1, 0.8980392, 1,
0.01040361, -0.2832489, 2.841833, 0, 1, 0.9058824, 1,
0.01358435, 0.9175998, -0.801351, 0, 1, 0.9098039, 1,
0.01691127, -0.776322, 3.122365, 0, 1, 0.9176471, 1,
0.01796204, -1.749684, 3.133816, 0, 1, 0.9215686, 1,
0.01954881, 1.000453, 0.6197088, 0, 1, 0.9294118, 1,
0.02126256, -0.880549, 3.02908, 0, 1, 0.9333333, 1,
0.02140774, -0.2913057, 3.239405, 0, 1, 0.9411765, 1,
0.02852467, 1.078435, 0.8589107, 0, 1, 0.945098, 1,
0.02911776, -0.4872678, 1.830109, 0, 1, 0.9529412, 1,
0.02924864, 1.104431, 0.1073312, 0, 1, 0.9568627, 1,
0.03220234, 1.964332, -0.006063067, 0, 1, 0.9647059, 1,
0.03229789, 0.2484441, 0.4881822, 0, 1, 0.9686275, 1,
0.03554637, -0.3217549, 3.374843, 0, 1, 0.9764706, 1,
0.04291022, -1.784997, 3.160304, 0, 1, 0.9803922, 1,
0.04336245, -1.579759, 3.766929, 0, 1, 0.9882353, 1,
0.04410141, -0.442006, 2.5267, 0, 1, 0.9921569, 1,
0.04826169, -0.8296115, 4.062008, 0, 1, 1, 1,
0.05004274, -0.01003257, 1.564274, 0, 0.9921569, 1, 1,
0.05327924, -0.03494507, 3.459736, 0, 0.9882353, 1, 1,
0.05787199, 0.3573702, 0.8545814, 0, 0.9803922, 1, 1,
0.05868475, 1.318193, -0.5557374, 0, 0.9764706, 1, 1,
0.05876342, 0.06733627, -0.3726653, 0, 0.9686275, 1, 1,
0.0600458, 0.6323804, 1.368484, 0, 0.9647059, 1, 1,
0.06536093, -0.559006, 2.09841, 0, 0.9568627, 1, 1,
0.06550844, 0.3038835, 2.495953, 0, 0.9529412, 1, 1,
0.0728428, 0.2096794, -0.2226284, 0, 0.945098, 1, 1,
0.0794412, -1.14719, 2.571289, 0, 0.9411765, 1, 1,
0.08094266, -0.1809472, 2.443368, 0, 0.9333333, 1, 1,
0.08109324, -0.5963996, 3.136006, 0, 0.9294118, 1, 1,
0.08236431, -0.475941, 2.839908, 0, 0.9215686, 1, 1,
0.09433638, 0.8629586, 0.6167983, 0, 0.9176471, 1, 1,
0.09649371, -0.2660274, 1.434572, 0, 0.9098039, 1, 1,
0.09879319, 0.7616382, -0.1351131, 0, 0.9058824, 1, 1,
0.1006781, 0.8046122, -0.04597528, 0, 0.8980392, 1, 1,
0.1007474, -0.8320051, 3.365126, 0, 0.8901961, 1, 1,
0.1032285, -0.2172636, 5.317578, 0, 0.8862745, 1, 1,
0.104896, 0.8848882, 0.7111887, 0, 0.8784314, 1, 1,
0.1141736, 0.5080159, 0.9638166, 0, 0.8745098, 1, 1,
0.1167066, 0.5554259, 0.490476, 0, 0.8666667, 1, 1,
0.1209658, -0.2432036, 4.34109, 0, 0.8627451, 1, 1,
0.1211725, 0.2988828, -1.178698, 0, 0.854902, 1, 1,
0.1226977, -1.034937, 2.036644, 0, 0.8509804, 1, 1,
0.1231515, -0.6696178, 1.849346, 0, 0.8431373, 1, 1,
0.1252692, -0.7719743, 1.970734, 0, 0.8392157, 1, 1,
0.1281189, 0.08273365, 1.053216, 0, 0.8313726, 1, 1,
0.1339841, -0.5950281, 2.456302, 0, 0.827451, 1, 1,
0.1386426, 0.1251594, 0.2457349, 0, 0.8196079, 1, 1,
0.1441397, -1.145561, 0.9852801, 0, 0.8156863, 1, 1,
0.1453825, -0.5023437, 2.196813, 0, 0.8078431, 1, 1,
0.1463928, -0.440899, 1.895406, 0, 0.8039216, 1, 1,
0.1524498, 0.3164802, -1.185726, 0, 0.7960784, 1, 1,
0.1550121, -1.237982, 2.654427, 0, 0.7882353, 1, 1,
0.1554867, 1.7156, -1.385, 0, 0.7843137, 1, 1,
0.1585316, -0.6861511, 5.570018, 0, 0.7764706, 1, 1,
0.1589522, 2.035242, -0.2413599, 0, 0.772549, 1, 1,
0.1592437, -0.7949138, 3.478103, 0, 0.7647059, 1, 1,
0.160922, 1.955388, -0.002452775, 0, 0.7607843, 1, 1,
0.1686792, 0.52324, -0.05520061, 0, 0.7529412, 1, 1,
0.1711279, -1.140884, 3.058555, 0, 0.7490196, 1, 1,
0.1762058, 1.391645, 1.15667, 0, 0.7411765, 1, 1,
0.1792067, -1.951208, 2.608525, 0, 0.7372549, 1, 1,
0.1833361, 0.1385112, 0.3557711, 0, 0.7294118, 1, 1,
0.1860478, 0.1254645, 3.526657, 0, 0.7254902, 1, 1,
0.1865075, -1.580306, 3.597469, 0, 0.7176471, 1, 1,
0.1876564, 1.699457, -0.5988285, 0, 0.7137255, 1, 1,
0.1896394, -0.9519939, 3.762725, 0, 0.7058824, 1, 1,
0.1897153, -0.6075171, 2.027417, 0, 0.6980392, 1, 1,
0.1949077, 0.37008, 0.1623131, 0, 0.6941177, 1, 1,
0.1957609, -0.6271659, 4.299739, 0, 0.6862745, 1, 1,
0.1985465, 0.7831677, -1.529362, 0, 0.682353, 1, 1,
0.2011662, -2.070713, 4.233143, 0, 0.6745098, 1, 1,
0.2023357, -1.792022, 3.285458, 0, 0.6705883, 1, 1,
0.2031113, 2.804864, -0.3091772, 0, 0.6627451, 1, 1,
0.2031487, -0.4452115, 4.895174, 0, 0.6588235, 1, 1,
0.2070006, -1.221039, 0.9088507, 0, 0.6509804, 1, 1,
0.2175544, 0.9810323, 0.5689626, 0, 0.6470588, 1, 1,
0.2177373, -0.6202633, 4.828821, 0, 0.6392157, 1, 1,
0.2188492, 0.2594083, 0.6250491, 0, 0.6352941, 1, 1,
0.2269866, 1.464986, -0.4807378, 0, 0.627451, 1, 1,
0.2276474, 0.1930541, 1.349875, 0, 0.6235294, 1, 1,
0.2291451, -1.971901, 4.111742, 0, 0.6156863, 1, 1,
0.2303323, -0.005024359, 2.346495, 0, 0.6117647, 1, 1,
0.2330347, 0.3730002, 0.176074, 0, 0.6039216, 1, 1,
0.2346009, 0.5364603, -0.2375736, 0, 0.5960785, 1, 1,
0.2405029, -1.171555, 1.657798, 0, 0.5921569, 1, 1,
0.2443685, -0.66751, 2.950637, 0, 0.5843138, 1, 1,
0.2463099, 0.2124384, 0.6370605, 0, 0.5803922, 1, 1,
0.2479565, -0.8630258, 2.56588, 0, 0.572549, 1, 1,
0.2505826, 1.125968, -0.1374378, 0, 0.5686275, 1, 1,
0.2511317, 1.731053, 0.6647482, 0, 0.5607843, 1, 1,
0.2513471, -1.419463, 2.725917, 0, 0.5568628, 1, 1,
0.2513649, -0.03625569, 1.869665, 0, 0.5490196, 1, 1,
0.2554338, -0.1652306, 1.044901, 0, 0.5450981, 1, 1,
0.2563168, -0.466399, 2.905899, 0, 0.5372549, 1, 1,
0.2576184, -0.6937937, 2.639436, 0, 0.5333334, 1, 1,
0.2604727, 1.041482, 0.8367067, 0, 0.5254902, 1, 1,
0.2668502, -2.068241, 3.814765, 0, 0.5215687, 1, 1,
0.2704555, -0.7143486, 5.055578, 0, 0.5137255, 1, 1,
0.2709038, -0.8637252, 2.350054, 0, 0.509804, 1, 1,
0.2710318, 0.1423386, 2.513995, 0, 0.5019608, 1, 1,
0.2752908, -0.7453265, 1.032669, 0, 0.4941176, 1, 1,
0.2821458, 0.2107563, 2.171548, 0, 0.4901961, 1, 1,
0.2865914, 0.4097513, 1.462957, 0, 0.4823529, 1, 1,
0.2895761, 0.841485, -0.2902787, 0, 0.4784314, 1, 1,
0.2897473, -0.3586879, 2.588211, 0, 0.4705882, 1, 1,
0.2936537, 0.1932712, 0.1451584, 0, 0.4666667, 1, 1,
0.2952721, -0.8254027, 0.2739547, 0, 0.4588235, 1, 1,
0.2961424, -0.9791479, 2.148488, 0, 0.454902, 1, 1,
0.2981767, 1.518353, 0.3968283, 0, 0.4470588, 1, 1,
0.3024181, -0.8459465, 4.345699, 0, 0.4431373, 1, 1,
0.3030468, 2.070989, 0.8724, 0, 0.4352941, 1, 1,
0.3069825, -2.170524, 3.586788, 0, 0.4313726, 1, 1,
0.3079896, 1.839534, -1.187816, 0, 0.4235294, 1, 1,
0.3112781, -1.267494, 0.09142119, 0, 0.4196078, 1, 1,
0.3125887, 0.821438, -1.132207, 0, 0.4117647, 1, 1,
0.3135195, 0.1103513, 0.2814152, 0, 0.4078431, 1, 1,
0.3154973, -0.5928554, 1.835901, 0, 0.4, 1, 1,
0.3172975, 0.4322075, 1.036069, 0, 0.3921569, 1, 1,
0.317738, -1.04157, 3.246109, 0, 0.3882353, 1, 1,
0.3183177, 0.6164144, -0.08705741, 0, 0.3803922, 1, 1,
0.3195688, -1.173204, 3.700299, 0, 0.3764706, 1, 1,
0.327751, 0.9142315, 0.1615414, 0, 0.3686275, 1, 1,
0.3339794, 1.059901, 1.317832, 0, 0.3647059, 1, 1,
0.3343741, -0.699708, 4.109176, 0, 0.3568628, 1, 1,
0.3344827, -1.373949, 3.464486, 0, 0.3529412, 1, 1,
0.3357758, 0.175436, 0.676342, 0, 0.345098, 1, 1,
0.3409583, -0.1957307, 1.78, 0, 0.3411765, 1, 1,
0.3429642, -0.5347329, 3.832968, 0, 0.3333333, 1, 1,
0.3472873, 0.3788894, 0.03635903, 0, 0.3294118, 1, 1,
0.3481866, -0.3448738, 1.50686, 0, 0.3215686, 1, 1,
0.3543384, -0.2155146, 2.761283, 0, 0.3176471, 1, 1,
0.3581884, -0.6671053, 1.764223, 0, 0.3098039, 1, 1,
0.358722, 0.4812286, -0.1726728, 0, 0.3058824, 1, 1,
0.3637595, -0.2572598, 2.839437, 0, 0.2980392, 1, 1,
0.3715351, -1.172057, 4.317518, 0, 0.2901961, 1, 1,
0.3773175, -0.9547257, 3.092409, 0, 0.2862745, 1, 1,
0.3849685, 0.3801799, 0.4471017, 0, 0.2784314, 1, 1,
0.3863132, 0.1005617, 0.4555357, 0, 0.2745098, 1, 1,
0.3872178, 1.045114, -0.7168984, 0, 0.2666667, 1, 1,
0.3876401, -0.0629489, 1.85852, 0, 0.2627451, 1, 1,
0.3897719, -0.6110198, 3.265817, 0, 0.254902, 1, 1,
0.3900657, 0.6973966, 1.728064, 0, 0.2509804, 1, 1,
0.3924541, -0.20756, 3.738985, 0, 0.2431373, 1, 1,
0.3948485, -1.181724, 2.596328, 0, 0.2392157, 1, 1,
0.3954701, 0.1710681, 3.378201, 0, 0.2313726, 1, 1,
0.3993568, 0.4409023, 1.224042, 0, 0.227451, 1, 1,
0.4003739, 0.05299948, 2.079452, 0, 0.2196078, 1, 1,
0.4009957, -0.7901315, 2.85681, 0, 0.2156863, 1, 1,
0.4015686, -0.002367826, 1.072322, 0, 0.2078431, 1, 1,
0.4020554, 0.8856072, 0.6035694, 0, 0.2039216, 1, 1,
0.4034951, 2.649283, -0.183756, 0, 0.1960784, 1, 1,
0.4039147, 0.3498219, 0.180075, 0, 0.1882353, 1, 1,
0.407112, -0.2091915, 3.249901, 0, 0.1843137, 1, 1,
0.4078913, -0.6050078, 2.107084, 0, 0.1764706, 1, 1,
0.4089569, 0.6700177, 0.7173891, 0, 0.172549, 1, 1,
0.4091055, -0.03844793, 1.870539, 0, 0.1647059, 1, 1,
0.4106143, -1.204083, 1.166331, 0, 0.1607843, 1, 1,
0.4115655, -0.1103154, 0.1195655, 0, 0.1529412, 1, 1,
0.4125189, -0.1650219, 2.718065, 0, 0.1490196, 1, 1,
0.4153823, 0.4637442, 0.5677527, 0, 0.1411765, 1, 1,
0.4164265, -0.08527919, 2.329244, 0, 0.1372549, 1, 1,
0.4265729, -2.352325, 2.879521, 0, 0.1294118, 1, 1,
0.4297224, -1.563393, 3.85182, 0, 0.1254902, 1, 1,
0.4323798, 1.822423, 0.9511752, 0, 0.1176471, 1, 1,
0.4342479, -0.2494121, 0.4044631, 0, 0.1137255, 1, 1,
0.4345285, -0.1617008, -1.041525, 0, 0.1058824, 1, 1,
0.4407893, -0.465395, 1.536648, 0, 0.09803922, 1, 1,
0.4433859, 0.6428049, 0.4913883, 0, 0.09411765, 1, 1,
0.4460919, 0.8091336, -0.2632022, 0, 0.08627451, 1, 1,
0.4471042, -1.082392, 2.873385, 0, 0.08235294, 1, 1,
0.4477774, 0.5318859, 0.3731691, 0, 0.07450981, 1, 1,
0.4540765, -0.6097456, 1.664181, 0, 0.07058824, 1, 1,
0.4553529, -1.087285, 2.936172, 0, 0.0627451, 1, 1,
0.4556482, -0.1920211, 1.747979, 0, 0.05882353, 1, 1,
0.4564474, -0.162784, 0.9582223, 0, 0.05098039, 1, 1,
0.4579019, 0.7126505, 1.853537, 0, 0.04705882, 1, 1,
0.4613516, -1.512017, 1.736186, 0, 0.03921569, 1, 1,
0.4660889, -0.6990356, 1.958523, 0, 0.03529412, 1, 1,
0.4662117, 1.633441, 0.2798719, 0, 0.02745098, 1, 1,
0.4662775, -0.2916557, 1.52108, 0, 0.02352941, 1, 1,
0.4664689, -0.9155166, 4.450521, 0, 0.01568628, 1, 1,
0.4680469, 1.127767, 0.1578437, 0, 0.01176471, 1, 1,
0.4693022, -0.386066, 3.286963, 0, 0.003921569, 1, 1,
0.4708512, -0.778222, 1.134373, 0.003921569, 0, 1, 1,
0.4720189, -0.8641416, 4.095973, 0.007843138, 0, 1, 1,
0.4726499, -0.01037337, 0.1630444, 0.01568628, 0, 1, 1,
0.4745157, -0.9381407, 2.230142, 0.01960784, 0, 1, 1,
0.4747039, -0.3821088, 5.446955, 0.02745098, 0, 1, 1,
0.4765683, -1.300653, 4.284317, 0.03137255, 0, 1, 1,
0.4771335, -0.5276336, 0.8545603, 0.03921569, 0, 1, 1,
0.4775276, 0.2132803, 0.8624622, 0.04313726, 0, 1, 1,
0.4782221, -0.6879717, 2.983878, 0.05098039, 0, 1, 1,
0.47863, -1.577093, 1.444299, 0.05490196, 0, 1, 1,
0.4810624, 1.403807, -2.177959, 0.0627451, 0, 1, 1,
0.4820909, 2.26014, -0.3165056, 0.06666667, 0, 1, 1,
0.4834708, 1.646908, 1.935016, 0.07450981, 0, 1, 1,
0.4873951, 0.6683441, 1.36122, 0.07843138, 0, 1, 1,
0.4893868, -0.9686812, 1.783917, 0.08627451, 0, 1, 1,
0.4926501, 0.2735641, -0.7296436, 0.09019608, 0, 1, 1,
0.4937119, 0.4439376, 0.7642932, 0.09803922, 0, 1, 1,
0.4941393, -0.8348856, 1.871765, 0.1058824, 0, 1, 1,
0.4947104, -0.6097481, 3.735592, 0.1098039, 0, 1, 1,
0.4951667, -2.086478, 0.4022158, 0.1176471, 0, 1, 1,
0.4962938, 0.6926628, 1.726267, 0.1215686, 0, 1, 1,
0.4977829, 0.4352548, 0.3329722, 0.1294118, 0, 1, 1,
0.502088, 1.392746, -0.3435573, 0.1333333, 0, 1, 1,
0.5023483, 0.07768683, 1.347541, 0.1411765, 0, 1, 1,
0.5030482, -0.4372109, 2.32027, 0.145098, 0, 1, 1,
0.5058385, -0.4473114, 3.337034, 0.1529412, 0, 1, 1,
0.5069518, -0.4416565, 1.777794, 0.1568628, 0, 1, 1,
0.5075938, -1.238157, 1.486818, 0.1647059, 0, 1, 1,
0.5078061, -0.5022274, 1.845545, 0.1686275, 0, 1, 1,
0.5113826, 0.5142757, 1.078867, 0.1764706, 0, 1, 1,
0.5113978, 0.5230285, 3.075159, 0.1803922, 0, 1, 1,
0.5154972, 2.007141, -0.2738203, 0.1882353, 0, 1, 1,
0.515774, -0.0788939, 2.786833, 0.1921569, 0, 1, 1,
0.516985, -1.258842, 3.645833, 0.2, 0, 1, 1,
0.5211008, -1.927086, 2.216154, 0.2078431, 0, 1, 1,
0.5258378, 0.02973867, 1.88769, 0.2117647, 0, 1, 1,
0.5262117, 0.2035751, 2.231775, 0.2196078, 0, 1, 1,
0.5330442, 0.7847145, 2.050576, 0.2235294, 0, 1, 1,
0.5344689, 0.5426228, 0.06029163, 0.2313726, 0, 1, 1,
0.5361028, -2.957996, 2.23689, 0.2352941, 0, 1, 1,
0.536723, -1.300777, 1.475586, 0.2431373, 0, 1, 1,
0.5410455, 0.1377831, -0.6159235, 0.2470588, 0, 1, 1,
0.5437831, 1.335667, 0.3563079, 0.254902, 0, 1, 1,
0.5450094, -0.6120012, 1.762807, 0.2588235, 0, 1, 1,
0.5499986, 1.077316, -0.3967013, 0.2666667, 0, 1, 1,
0.5505269, 0.8607574, 1.244969, 0.2705882, 0, 1, 1,
0.5514899, -0.04080959, 2.487329, 0.2784314, 0, 1, 1,
0.5566705, 0.3310975, 2.042188, 0.282353, 0, 1, 1,
0.5587087, 0.9669579, 1.94476, 0.2901961, 0, 1, 1,
0.5647521, -0.8806696, 0.0003816556, 0.2941177, 0, 1, 1,
0.5649294, -0.809472, 1.660287, 0.3019608, 0, 1, 1,
0.5666298, 0.2128667, 1.792843, 0.3098039, 0, 1, 1,
0.571175, 0.2179251, 0.9768522, 0.3137255, 0, 1, 1,
0.5718411, -2.499914, 4.014372, 0.3215686, 0, 1, 1,
0.58161, -0.5704264, 0.2926717, 0.3254902, 0, 1, 1,
0.5819685, 0.4783894, 0.5638041, 0.3333333, 0, 1, 1,
0.584213, 0.4001224, 0.5880789, 0.3372549, 0, 1, 1,
0.588746, -0.6046647, 3.541182, 0.345098, 0, 1, 1,
0.5996554, -1.201632, 2.672921, 0.3490196, 0, 1, 1,
0.6036143, -1.878846, 3.160742, 0.3568628, 0, 1, 1,
0.6042222, 2.465722, -0.009902919, 0.3607843, 0, 1, 1,
0.6143508, 0.9182565, -0.7601588, 0.3686275, 0, 1, 1,
0.6192418, 0.7268026, 2.407945, 0.372549, 0, 1, 1,
0.6199407, 0.5031582, 0.2827323, 0.3803922, 0, 1, 1,
0.6241885, 1.067531, 2.030472, 0.3843137, 0, 1, 1,
0.6273578, -0.2609507, 3.461534, 0.3921569, 0, 1, 1,
0.6297348, -0.4085199, 2.251884, 0.3960784, 0, 1, 1,
0.6351277, 0.0301719, 3.337201, 0.4039216, 0, 1, 1,
0.6386104, -1.687723, 0.7937318, 0.4117647, 0, 1, 1,
0.6514214, -0.6828287, 0.07349727, 0.4156863, 0, 1, 1,
0.6555105, -2.700245, 2.614175, 0.4235294, 0, 1, 1,
0.6564026, 1.915592, 3.566084, 0.427451, 0, 1, 1,
0.6605136, 0.5303431, -0.2237011, 0.4352941, 0, 1, 1,
0.6648412, 0.1749744, 2.94557, 0.4392157, 0, 1, 1,
0.6664912, -1.31558, 2.646207, 0.4470588, 0, 1, 1,
0.6668451, 0.7151336, 1.207271, 0.4509804, 0, 1, 1,
0.6707354, 0.5977983, -0.4690628, 0.4588235, 0, 1, 1,
0.6720908, -0.8971525, 3.318469, 0.4627451, 0, 1, 1,
0.676139, 0.04172869, 0.3046665, 0.4705882, 0, 1, 1,
0.681234, 0.2932477, 1.275414, 0.4745098, 0, 1, 1,
0.6848795, 2.113579, 0.599979, 0.4823529, 0, 1, 1,
0.6870599, 0.4369863, 0.8817847, 0.4862745, 0, 1, 1,
0.688431, 1.313695, 0.7581233, 0.4941176, 0, 1, 1,
0.6988573, 0.7565297, 1.031212, 0.5019608, 0, 1, 1,
0.6990268, 0.6915106, -0.3257624, 0.5058824, 0, 1, 1,
0.7025375, -1.030949, 2.57069, 0.5137255, 0, 1, 1,
0.7046187, 0.09511819, 2.541967, 0.5176471, 0, 1, 1,
0.7046242, -0.03944104, 1.206243, 0.5254902, 0, 1, 1,
0.7077872, 0.9886815, 0.6610445, 0.5294118, 0, 1, 1,
0.7120889, -1.881487, 3.19775, 0.5372549, 0, 1, 1,
0.7128207, -0.7882399, 2.102981, 0.5411765, 0, 1, 1,
0.7134122, -0.5121248, 2.338793, 0.5490196, 0, 1, 1,
0.7294176, 1.067685, 1.356892, 0.5529412, 0, 1, 1,
0.7316927, 1.698815, 0.4547596, 0.5607843, 0, 1, 1,
0.7322208, 1.070072, 0.4419489, 0.5647059, 0, 1, 1,
0.7324343, 1.882058, 0.4842549, 0.572549, 0, 1, 1,
0.7371302, -2.27608, 3.620652, 0.5764706, 0, 1, 1,
0.7515377, -0.02540856, 1.266672, 0.5843138, 0, 1, 1,
0.7553506, -1.067209, 1.87354, 0.5882353, 0, 1, 1,
0.7581763, -1.96468, 3.23234, 0.5960785, 0, 1, 1,
0.7586138, 0.5334591, 0.3796733, 0.6039216, 0, 1, 1,
0.760685, -0.376309, 3.52386, 0.6078432, 0, 1, 1,
0.7659461, -0.8896111, 4.107014, 0.6156863, 0, 1, 1,
0.7668719, -0.1447909, 1.531578, 0.6196079, 0, 1, 1,
0.7834892, 0.7543259, 1.89397, 0.627451, 0, 1, 1,
0.7853869, -0.5327511, 2.902167, 0.6313726, 0, 1, 1,
0.7902134, 1.618598, 0.279309, 0.6392157, 0, 1, 1,
0.7991567, 1.818296, -0.9714277, 0.6431373, 0, 1, 1,
0.806073, -0.1183124, 1.17213, 0.6509804, 0, 1, 1,
0.8066652, -0.8546671, 3.083041, 0.654902, 0, 1, 1,
0.8076369, 1.115237, 1.071112, 0.6627451, 0, 1, 1,
0.8239023, -0.5912451, 1.517522, 0.6666667, 0, 1, 1,
0.8248981, 0.2135904, 1.340558, 0.6745098, 0, 1, 1,
0.8259585, -0.3426527, 3.543819, 0.6784314, 0, 1, 1,
0.826907, 0.1099918, 0.6701701, 0.6862745, 0, 1, 1,
0.8328678, 0.2632848, -0.1870556, 0.6901961, 0, 1, 1,
0.8417834, 0.1636458, 1.860992, 0.6980392, 0, 1, 1,
0.8439448, -0.3286511, 2.557103, 0.7058824, 0, 1, 1,
0.8502757, 1.082072, 1.770023, 0.7098039, 0, 1, 1,
0.856357, 1.216136, 0.2890975, 0.7176471, 0, 1, 1,
0.8564757, -0.05073921, 1.633752, 0.7215686, 0, 1, 1,
0.8571832, 1.998875, -0.1914867, 0.7294118, 0, 1, 1,
0.8574388, 0.6033867, 0.5503095, 0.7333333, 0, 1, 1,
0.8604556, 0.2842062, 1.802616, 0.7411765, 0, 1, 1,
0.8607112, 0.880813, 1.829038, 0.7450981, 0, 1, 1,
0.8617417, -0.8229458, 2.287596, 0.7529412, 0, 1, 1,
0.8666124, 1.92206, 0.2089944, 0.7568628, 0, 1, 1,
0.8683703, -0.5922266, 1.459133, 0.7647059, 0, 1, 1,
0.8771083, -0.65843, 2.377761, 0.7686275, 0, 1, 1,
0.8791298, -1.072059, 0.9491887, 0.7764706, 0, 1, 1,
0.8855072, -0.008154428, 2.839127, 0.7803922, 0, 1, 1,
0.8940231, -0.6782772, 3.035027, 0.7882353, 0, 1, 1,
0.9003901, 1.229195, -0.09949753, 0.7921569, 0, 1, 1,
0.9018624, -0.3308846, 1.956406, 0.8, 0, 1, 1,
0.9252754, -0.9044746, 1.901097, 0.8078431, 0, 1, 1,
0.9286263, -1.262083, 3.841153, 0.8117647, 0, 1, 1,
0.9304063, -0.5384638, 1.842217, 0.8196079, 0, 1, 1,
0.9316177, 0.1141382, 0.8647386, 0.8235294, 0, 1, 1,
0.939848, 0.1749048, 2.394505, 0.8313726, 0, 1, 1,
0.9448078, -0.6575706, 1.754725, 0.8352941, 0, 1, 1,
0.9456917, 1.000482, 1.22689, 0.8431373, 0, 1, 1,
0.9514046, -0.9473536, 2.12378, 0.8470588, 0, 1, 1,
0.952879, 0.3905427, 0.3020896, 0.854902, 0, 1, 1,
0.9563487, -0.9620882, 3.31119, 0.8588235, 0, 1, 1,
0.9567099, -1.22626, 1.57152, 0.8666667, 0, 1, 1,
0.9609796, -1.253732, 3.925946, 0.8705882, 0, 1, 1,
0.9785679, -0.6613439, 1.334835, 0.8784314, 0, 1, 1,
0.979665, -0.9071667, 1.653292, 0.8823529, 0, 1, 1,
0.9813845, 0.08939628, 0.9051033, 0.8901961, 0, 1, 1,
0.9845462, -0.4965349, 2.915424, 0.8941177, 0, 1, 1,
0.9936258, -1.037174, 3.048251, 0.9019608, 0, 1, 1,
0.9938532, -1.930866, 2.013817, 0.9098039, 0, 1, 1,
0.9946606, 0.4320795, 1.725685, 0.9137255, 0, 1, 1,
0.994996, 1.31504, 0.2781525, 0.9215686, 0, 1, 1,
0.9977068, 0.2469982, 0.9314651, 0.9254902, 0, 1, 1,
1.000146, -0.959251, 1.945083, 0.9333333, 0, 1, 1,
1.002683, -0.5851733, 2.246386, 0.9372549, 0, 1, 1,
1.003606, -0.8368598, 0.6636608, 0.945098, 0, 1, 1,
1.00702, 0.1620835, 1.288306, 0.9490196, 0, 1, 1,
1.008029, -0.8957289, 3.667232, 0.9568627, 0, 1, 1,
1.014889, -0.8142574, 1.364884, 0.9607843, 0, 1, 1,
1.017405, 0.7932952, -0.8347099, 0.9686275, 0, 1, 1,
1.02416, 0.7597885, 0.4276889, 0.972549, 0, 1, 1,
1.026032, -0.4575967, 1.411174, 0.9803922, 0, 1, 1,
1.027857, 0.1728188, 1.505406, 0.9843137, 0, 1, 1,
1.028308, 0.04184004, 1.516168, 0.9921569, 0, 1, 1,
1.028414, 0.3505809, 1.191906, 0.9960784, 0, 1, 1,
1.030216, -0.3837168, 2.425794, 1, 0, 0.9960784, 1,
1.030228, 2.087738, 0.9110872, 1, 0, 0.9882353, 1,
1.033186, -0.941035, 3.164377, 1, 0, 0.9843137, 1,
1.033267, -0.05178421, 1.546356, 1, 0, 0.9764706, 1,
1.037514, -2.567894, 2.99147, 1, 0, 0.972549, 1,
1.039376, -1.872708, 4.192931, 1, 0, 0.9647059, 1,
1.040595, -1.087296, 2.287092, 1, 0, 0.9607843, 1,
1.046902, 0.4797919, -0.7856754, 1, 0, 0.9529412, 1,
1.051074, -0.3006882, 3.006817, 1, 0, 0.9490196, 1,
1.052689, 1.929005, 0.6411225, 1, 0, 0.9411765, 1,
1.057383, -0.1542949, -0.09935004, 1, 0, 0.9372549, 1,
1.059841, 2.452725, 1.61594, 1, 0, 0.9294118, 1,
1.068243, 2.664045, 1.187206, 1, 0, 0.9254902, 1,
1.069438, -2.79418, 2.129366, 1, 0, 0.9176471, 1,
1.070074, -0.1859191, -0.2420853, 1, 0, 0.9137255, 1,
1.078924, 0.3536773, 0.2718539, 1, 0, 0.9058824, 1,
1.081652, 2.493467, 1.631419, 1, 0, 0.9019608, 1,
1.081716, -1.804615, 3.018868, 1, 0, 0.8941177, 1,
1.099137, -0.4100442, 3.298693, 1, 0, 0.8862745, 1,
1.105665, -2.0735, 1.743683, 1, 0, 0.8823529, 1,
1.12007, -0.4736944, 1.678752, 1, 0, 0.8745098, 1,
1.132731, 1.128311, 0.9836838, 1, 0, 0.8705882, 1,
1.135925, -0.8718632, 1.116535, 1, 0, 0.8627451, 1,
1.140011, 0.7878101, -0.2828491, 1, 0, 0.8588235, 1,
1.149277, -0.5617917, 2.009695, 1, 0, 0.8509804, 1,
1.151301, 0.5281078, 2.69146, 1, 0, 0.8470588, 1,
1.15468, -1.701852, 3.206318, 1, 0, 0.8392157, 1,
1.16102, -0.4859042, 2.331382, 1, 0, 0.8352941, 1,
1.163504, -0.2706399, 1.308196, 1, 0, 0.827451, 1,
1.163846, 0.2989378, -0.3216258, 1, 0, 0.8235294, 1,
1.164636, -2.081833, 3.492208, 1, 0, 0.8156863, 1,
1.166893, -0.2872751, 0.1464234, 1, 0, 0.8117647, 1,
1.176363, -0.1283225, 1.326419, 1, 0, 0.8039216, 1,
1.177845, 0.1665293, -0.1482206, 1, 0, 0.7960784, 1,
1.178081, -0.49741, 4.841728, 1, 0, 0.7921569, 1,
1.19745, 0.2661664, 1.150804, 1, 0, 0.7843137, 1,
1.198021, -0.9144724, 2.238573, 1, 0, 0.7803922, 1,
1.206907, -0.5012563, 0.9490916, 1, 0, 0.772549, 1,
1.20927, 0.9068869, -0.2870052, 1, 0, 0.7686275, 1,
1.209328, 0.2916692, 1.357095, 1, 0, 0.7607843, 1,
1.215807, 0.1512128, 1.495154, 1, 0, 0.7568628, 1,
1.218835, 0.1821915, 3.255165, 1, 0, 0.7490196, 1,
1.224355, 0.2560404, 1.996277, 1, 0, 0.7450981, 1,
1.224827, 1.244752, 1.482129, 1, 0, 0.7372549, 1,
1.226814, -0.1767823, 0.7850865, 1, 0, 0.7333333, 1,
1.227967, 0.7768322, 2.044581, 1, 0, 0.7254902, 1,
1.230877, -0.8913891, 2.750648, 1, 0, 0.7215686, 1,
1.239153, -1.29747, 1.466038, 1, 0, 0.7137255, 1,
1.241759, 1.483903, 1.167583, 1, 0, 0.7098039, 1,
1.260638, 0.2964645, 1.02624, 1, 0, 0.7019608, 1,
1.265491, 1.16863, -0.6830845, 1, 0, 0.6941177, 1,
1.265976, 0.08421504, 2.000209, 1, 0, 0.6901961, 1,
1.267091, -0.6590159, 4.179082, 1, 0, 0.682353, 1,
1.273815, 0.1186566, 0.6663208, 1, 0, 0.6784314, 1,
1.276764, -0.6373849, 2.269609, 1, 0, 0.6705883, 1,
1.279555, -0.2428303, 3.677817, 1, 0, 0.6666667, 1,
1.294381, -0.1555157, 1.889062, 1, 0, 0.6588235, 1,
1.305932, -0.6229172, 0.6277246, 1, 0, 0.654902, 1,
1.316659, -2.156955, 3.718917, 1, 0, 0.6470588, 1,
1.321113, -1.691071, 3.481075, 1, 0, 0.6431373, 1,
1.32401, -0.08011327, 1.238382, 1, 0, 0.6352941, 1,
1.326795, -1.481466, 2.468183, 1, 0, 0.6313726, 1,
1.335321, 0.6285319, 1.692185, 1, 0, 0.6235294, 1,
1.339856, -2.101271, 0.8741368, 1, 0, 0.6196079, 1,
1.351256, 1.531853, 1.864414, 1, 0, 0.6117647, 1,
1.352396, -0.1391375, 1.483052, 1, 0, 0.6078432, 1,
1.358625, 0.2324516, 1.73657, 1, 0, 0.6, 1,
1.361099, 0.1409021, 2.414405, 1, 0, 0.5921569, 1,
1.361284, -0.7587761, 1.609949, 1, 0, 0.5882353, 1,
1.363971, 0.6120754, 1.245672, 1, 0, 0.5803922, 1,
1.369905, 0.9195572, 1.458481, 1, 0, 0.5764706, 1,
1.371562, 0.863664, 0.1278979, 1, 0, 0.5686275, 1,
1.376258, -1.472917, 2.178739, 1, 0, 0.5647059, 1,
1.38228, 1.28626, -0.4909207, 1, 0, 0.5568628, 1,
1.385922, 0.9241379, 1.539658, 1, 0, 0.5529412, 1,
1.390659, -0.2069034, 2.649797, 1, 0, 0.5450981, 1,
1.396616, 0.7572578, 0.3532007, 1, 0, 0.5411765, 1,
1.397612, -1.553563, 2.642461, 1, 0, 0.5333334, 1,
1.405591, -1.25824, 1.741896, 1, 0, 0.5294118, 1,
1.42642, -2.407831, 2.77111, 1, 0, 0.5215687, 1,
1.434006, -0.07238289, 1.628659, 1, 0, 0.5176471, 1,
1.434109, -0.2105855, 1.895958, 1, 0, 0.509804, 1,
1.438563, -1.517616, 0.9766515, 1, 0, 0.5058824, 1,
1.443225, -0.06450976, 2.878746, 1, 0, 0.4980392, 1,
1.44608, -0.1958554, 1.828329, 1, 0, 0.4901961, 1,
1.449653, -1.877162, 3.088337, 1, 0, 0.4862745, 1,
1.455036, 0.04875588, 1.955041, 1, 0, 0.4784314, 1,
1.488539, 0.03677609, 1.737558, 1, 0, 0.4745098, 1,
1.493196, 0.7643639, 1.374949, 1, 0, 0.4666667, 1,
1.494264, -0.5179744, 2.591455, 1, 0, 0.4627451, 1,
1.504446, -0.3681198, 0.3194537, 1, 0, 0.454902, 1,
1.504725, 0.4507931, 0.3453128, 1, 0, 0.4509804, 1,
1.511501, 0.5221146, 2.959072, 1, 0, 0.4431373, 1,
1.548486, 0.5606692, 1.523153, 1, 0, 0.4392157, 1,
1.552717, -1.52606, 2.479213, 1, 0, 0.4313726, 1,
1.553738, -1.210141, 3.27586, 1, 0, 0.427451, 1,
1.561711, -0.8619277, 2.255294, 1, 0, 0.4196078, 1,
1.569157, -1.716315, 3.980687, 1, 0, 0.4156863, 1,
1.572228, -0.7172361, 2.860744, 1, 0, 0.4078431, 1,
1.587781, 0.2135366, 2.442258, 1, 0, 0.4039216, 1,
1.592013, 0.5125362, 1.769958, 1, 0, 0.3960784, 1,
1.593949, 0.4425502, 1.600294, 1, 0, 0.3882353, 1,
1.594156, -0.3535185, 1.203269, 1, 0, 0.3843137, 1,
1.594286, 0.9282994, 1.179479, 1, 0, 0.3764706, 1,
1.596412, -0.6438112, 2.415681, 1, 0, 0.372549, 1,
1.604584, 1.348609, 0.899806, 1, 0, 0.3647059, 1,
1.611657, 0.5853134, 2.511302, 1, 0, 0.3607843, 1,
1.611894, 1.969131, 0.145977, 1, 0, 0.3529412, 1,
1.619008, -0.7918093, 1.075111, 1, 0, 0.3490196, 1,
1.63314, -0.2364262, 0.9204898, 1, 0, 0.3411765, 1,
1.641004, 0.8506389, 2.171056, 1, 0, 0.3372549, 1,
1.645388, 0.05804044, 4.956022, 1, 0, 0.3294118, 1,
1.689322, -0.6370878, 1.520836, 1, 0, 0.3254902, 1,
1.715353, -0.3859313, 1.793735, 1, 0, 0.3176471, 1,
1.718427, 0.2305359, 2.411946, 1, 0, 0.3137255, 1,
1.718796, -0.278504, 0.9720041, 1, 0, 0.3058824, 1,
1.723431, 1.323305, -0.2053809, 1, 0, 0.2980392, 1,
1.724916, 0.5506969, 2.079181, 1, 0, 0.2941177, 1,
1.726617, 0.5643048, 1.568619, 1, 0, 0.2862745, 1,
1.728261, 0.835341, 0.4997449, 1, 0, 0.282353, 1,
1.729232, 0.3901207, 0.8042414, 1, 0, 0.2745098, 1,
1.737131, -1.211022, 2.406197, 1, 0, 0.2705882, 1,
1.741319, 0.01216529, 1.355542, 1, 0, 0.2627451, 1,
1.744285, -0.5720325, 0.9157302, 1, 0, 0.2588235, 1,
1.787348, 1.313837, 1.785283, 1, 0, 0.2509804, 1,
1.791645, 0.02032907, 0.3105916, 1, 0, 0.2470588, 1,
1.798488, -0.8516725, 1.947127, 1, 0, 0.2392157, 1,
1.813083, 0.3871811, 0.018394, 1, 0, 0.2352941, 1,
1.824572, -1.860947, 2.264885, 1, 0, 0.227451, 1,
1.829126, 2.947548, 1.754496, 1, 0, 0.2235294, 1,
1.853571, 0.6801865, 0.9955997, 1, 0, 0.2156863, 1,
1.856006, -0.864612, 2.19029, 1, 0, 0.2117647, 1,
1.905305, -0.1803784, 1.209076, 1, 0, 0.2039216, 1,
1.906888, 0.9055867, 1.589054, 1, 0, 0.1960784, 1,
1.917733, 0.1313659, 1.114549, 1, 0, 0.1921569, 1,
1.946417, -0.1965663, 1.741389, 1, 0, 0.1843137, 1,
1.97051, -1.976426, 2.627323, 1, 0, 0.1803922, 1,
1.971006, 0.04427092, 1.487512, 1, 0, 0.172549, 1,
1.984391, 1.332445, 2.38836, 1, 0, 0.1686275, 1,
2.012118, 0.1727346, 1.422642, 1, 0, 0.1607843, 1,
2.015023, 1.956881, 0.5807367, 1, 0, 0.1568628, 1,
2.065736, 0.2514131, 1.432949, 1, 0, 0.1490196, 1,
2.067666, 0.2206903, 1.745164, 1, 0, 0.145098, 1,
2.068757, -1.911043, 4.447243, 1, 0, 0.1372549, 1,
2.091826, 0.7620789, 1.964211, 1, 0, 0.1333333, 1,
2.091967, -0.1138724, 2.149209, 1, 0, 0.1254902, 1,
2.160223, 1.307225, 1.658182, 1, 0, 0.1215686, 1,
2.197801, 0.05158258, 0.9320278, 1, 0, 0.1137255, 1,
2.216408, -0.4796336, 1.85137, 1, 0, 0.1098039, 1,
2.217856, 1.002838, 0.8465688, 1, 0, 0.1019608, 1,
2.222449, 0.9601569, 1.224323, 1, 0, 0.09411765, 1,
2.226088, -0.3417393, 1.422252, 1, 0, 0.09019608, 1,
2.256211, 0.4163317, 2.779825, 1, 0, 0.08235294, 1,
2.274689, 0.45847, 1.004842, 1, 0, 0.07843138, 1,
2.357096, 0.3897916, 0.6876327, 1, 0, 0.07058824, 1,
2.443142, 1.406084, 1.214656, 1, 0, 0.06666667, 1,
2.466172, 0.7541472, 2.850216, 1, 0, 0.05882353, 1,
2.484488, 1.014712, 0.6576981, 1, 0, 0.05490196, 1,
2.494173, 0.9157982, 0.3939277, 1, 0, 0.04705882, 1,
2.629558, 0.7180087, 1.76107, 1, 0, 0.04313726, 1,
2.667364, 0.5020134, 1.511311, 1, 0, 0.03529412, 1,
2.722187, -0.7526895, 1.323609, 1, 0, 0.03137255, 1,
2.755721, -0.870908, 1.662502, 1, 0, 0.02352941, 1,
2.853348, -0.1743583, 1.265888, 1, 0, 0.01960784, 1,
3.201797, 0.28408, 2.291178, 1, 0, 0.01176471, 1,
3.782812, -1.116111, 3.620169, 1, 0, 0.007843138, 1
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
0.3459165, -4.343617, -6.782093, 0, -0.5, 0.5, 0.5,
0.3459165, -4.343617, -6.782093, 1, -0.5, 0.5, 0.5,
0.3459165, -4.343617, -6.782093, 1, 1.5, 0.5, 0.5,
0.3459165, -4.343617, -6.782093, 0, 1.5, 0.5, 0.5
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
-4.256087, 0.325919, -6.782093, 0, -0.5, 0.5, 0.5,
-4.256087, 0.325919, -6.782093, 1, -0.5, 0.5, 0.5,
-4.256087, 0.325919, -6.782093, 1, 1.5, 0.5, 0.5,
-4.256087, 0.325919, -6.782093, 0, 1.5, 0.5, 0.5
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
-4.256087, -4.343617, 0.2890816, 0, -0.5, 0.5, 0.5,
-4.256087, -4.343617, 0.2890816, 1, -0.5, 0.5, 0.5,
-4.256087, -4.343617, 0.2890816, 1, 1.5, 0.5, 0.5,
-4.256087, -4.343617, 0.2890816, 0, 1.5, 0.5, 0.5
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
-3, -3.266032, -5.150283,
3, -3.266032, -5.150283,
-3, -3.266032, -5.150283,
-3, -3.445629, -5.422252,
-2, -3.266032, -5.150283,
-2, -3.445629, -5.422252,
-1, -3.266032, -5.150283,
-1, -3.445629, -5.422252,
0, -3.266032, -5.150283,
0, -3.445629, -5.422252,
1, -3.266032, -5.150283,
1, -3.445629, -5.422252,
2, -3.266032, -5.150283,
2, -3.445629, -5.422252,
3, -3.266032, -5.150283,
3, -3.445629, -5.422252
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
-3, -3.804824, -5.966188, 0, -0.5, 0.5, 0.5,
-3, -3.804824, -5.966188, 1, -0.5, 0.5, 0.5,
-3, -3.804824, -5.966188, 1, 1.5, 0.5, 0.5,
-3, -3.804824, -5.966188, 0, 1.5, 0.5, 0.5,
-2, -3.804824, -5.966188, 0, -0.5, 0.5, 0.5,
-2, -3.804824, -5.966188, 1, -0.5, 0.5, 0.5,
-2, -3.804824, -5.966188, 1, 1.5, 0.5, 0.5,
-2, -3.804824, -5.966188, 0, 1.5, 0.5, 0.5,
-1, -3.804824, -5.966188, 0, -0.5, 0.5, 0.5,
-1, -3.804824, -5.966188, 1, -0.5, 0.5, 0.5,
-1, -3.804824, -5.966188, 1, 1.5, 0.5, 0.5,
-1, -3.804824, -5.966188, 0, 1.5, 0.5, 0.5,
0, -3.804824, -5.966188, 0, -0.5, 0.5, 0.5,
0, -3.804824, -5.966188, 1, -0.5, 0.5, 0.5,
0, -3.804824, -5.966188, 1, 1.5, 0.5, 0.5,
0, -3.804824, -5.966188, 0, 1.5, 0.5, 0.5,
1, -3.804824, -5.966188, 0, -0.5, 0.5, 0.5,
1, -3.804824, -5.966188, 1, -0.5, 0.5, 0.5,
1, -3.804824, -5.966188, 1, 1.5, 0.5, 0.5,
1, -3.804824, -5.966188, 0, 1.5, 0.5, 0.5,
2, -3.804824, -5.966188, 0, -0.5, 0.5, 0.5,
2, -3.804824, -5.966188, 1, -0.5, 0.5, 0.5,
2, -3.804824, -5.966188, 1, 1.5, 0.5, 0.5,
2, -3.804824, -5.966188, 0, 1.5, 0.5, 0.5,
3, -3.804824, -5.966188, 0, -0.5, 0.5, 0.5,
3, -3.804824, -5.966188, 1, -0.5, 0.5, 0.5,
3, -3.804824, -5.966188, 1, 1.5, 0.5, 0.5,
3, -3.804824, -5.966188, 0, 1.5, 0.5, 0.5
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
-3.194086, -3, -5.150283,
-3.194086, 3, -5.150283,
-3.194086, -3, -5.150283,
-3.371086, -3, -5.422252,
-3.194086, -2, -5.150283,
-3.371086, -2, -5.422252,
-3.194086, -1, -5.150283,
-3.371086, -1, -5.422252,
-3.194086, 0, -5.150283,
-3.371086, 0, -5.422252,
-3.194086, 1, -5.150283,
-3.371086, 1, -5.422252,
-3.194086, 2, -5.150283,
-3.371086, 2, -5.422252,
-3.194086, 3, -5.150283,
-3.371086, 3, -5.422252
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
-3.725087, -3, -5.966188, 0, -0.5, 0.5, 0.5,
-3.725087, -3, -5.966188, 1, -0.5, 0.5, 0.5,
-3.725087, -3, -5.966188, 1, 1.5, 0.5, 0.5,
-3.725087, -3, -5.966188, 0, 1.5, 0.5, 0.5,
-3.725087, -2, -5.966188, 0, -0.5, 0.5, 0.5,
-3.725087, -2, -5.966188, 1, -0.5, 0.5, 0.5,
-3.725087, -2, -5.966188, 1, 1.5, 0.5, 0.5,
-3.725087, -2, -5.966188, 0, 1.5, 0.5, 0.5,
-3.725087, -1, -5.966188, 0, -0.5, 0.5, 0.5,
-3.725087, -1, -5.966188, 1, -0.5, 0.5, 0.5,
-3.725087, -1, -5.966188, 1, 1.5, 0.5, 0.5,
-3.725087, -1, -5.966188, 0, 1.5, 0.5, 0.5,
-3.725087, 0, -5.966188, 0, -0.5, 0.5, 0.5,
-3.725087, 0, -5.966188, 1, -0.5, 0.5, 0.5,
-3.725087, 0, -5.966188, 1, 1.5, 0.5, 0.5,
-3.725087, 0, -5.966188, 0, 1.5, 0.5, 0.5,
-3.725087, 1, -5.966188, 0, -0.5, 0.5, 0.5,
-3.725087, 1, -5.966188, 1, -0.5, 0.5, 0.5,
-3.725087, 1, -5.966188, 1, 1.5, 0.5, 0.5,
-3.725087, 1, -5.966188, 0, 1.5, 0.5, 0.5,
-3.725087, 2, -5.966188, 0, -0.5, 0.5, 0.5,
-3.725087, 2, -5.966188, 1, -0.5, 0.5, 0.5,
-3.725087, 2, -5.966188, 1, 1.5, 0.5, 0.5,
-3.725087, 2, -5.966188, 0, 1.5, 0.5, 0.5,
-3.725087, 3, -5.966188, 0, -0.5, 0.5, 0.5,
-3.725087, 3, -5.966188, 1, -0.5, 0.5, 0.5,
-3.725087, 3, -5.966188, 1, 1.5, 0.5, 0.5,
-3.725087, 3, -5.966188, 0, 1.5, 0.5, 0.5
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
-3.194086, -3.266032, -4,
-3.194086, -3.266032, 4,
-3.194086, -3.266032, -4,
-3.371086, -3.445629, -4,
-3.194086, -3.266032, -2,
-3.371086, -3.445629, -2,
-3.194086, -3.266032, 0,
-3.371086, -3.445629, 0,
-3.194086, -3.266032, 2,
-3.371086, -3.445629, 2,
-3.194086, -3.266032, 4,
-3.371086, -3.445629, 4
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
-3.725087, -3.804824, -4, 0, -0.5, 0.5, 0.5,
-3.725087, -3.804824, -4, 1, -0.5, 0.5, 0.5,
-3.725087, -3.804824, -4, 1, 1.5, 0.5, 0.5,
-3.725087, -3.804824, -4, 0, 1.5, 0.5, 0.5,
-3.725087, -3.804824, -2, 0, -0.5, 0.5, 0.5,
-3.725087, -3.804824, -2, 1, -0.5, 0.5, 0.5,
-3.725087, -3.804824, -2, 1, 1.5, 0.5, 0.5,
-3.725087, -3.804824, -2, 0, 1.5, 0.5, 0.5,
-3.725087, -3.804824, 0, 0, -0.5, 0.5, 0.5,
-3.725087, -3.804824, 0, 1, -0.5, 0.5, 0.5,
-3.725087, -3.804824, 0, 1, 1.5, 0.5, 0.5,
-3.725087, -3.804824, 0, 0, 1.5, 0.5, 0.5,
-3.725087, -3.804824, 2, 0, -0.5, 0.5, 0.5,
-3.725087, -3.804824, 2, 1, -0.5, 0.5, 0.5,
-3.725087, -3.804824, 2, 1, 1.5, 0.5, 0.5,
-3.725087, -3.804824, 2, 0, 1.5, 0.5, 0.5,
-3.725087, -3.804824, 4, 0, -0.5, 0.5, 0.5,
-3.725087, -3.804824, 4, 1, -0.5, 0.5, 0.5,
-3.725087, -3.804824, 4, 1, 1.5, 0.5, 0.5,
-3.725087, -3.804824, 4, 0, 1.5, 0.5, 0.5
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
-3.194086, -3.266032, -5.150283,
-3.194086, 3.91787, -5.150283,
-3.194086, -3.266032, 5.728446,
-3.194086, 3.91787, 5.728446,
-3.194086, -3.266032, -5.150283,
-3.194086, -3.266032, 5.728446,
-3.194086, 3.91787, -5.150283,
-3.194086, 3.91787, 5.728446,
-3.194086, -3.266032, -5.150283,
3.885919, -3.266032, -5.150283,
-3.194086, -3.266032, 5.728446,
3.885919, -3.266032, 5.728446,
-3.194086, 3.91787, -5.150283,
3.885919, 3.91787, -5.150283,
-3.194086, 3.91787, 5.728446,
3.885919, 3.91787, 5.728446,
3.885919, -3.266032, -5.150283,
3.885919, 3.91787, -5.150283,
3.885919, -3.266032, 5.728446,
3.885919, 3.91787, 5.728446,
3.885919, -3.266032, -5.150283,
3.885919, -3.266032, 5.728446,
3.885919, 3.91787, -5.150283,
3.885919, 3.91787, 5.728446
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
var radius = 7.921682;
var distance = 35.24446;
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
mvMatrix.translate( -0.3459165, -0.325919, -0.2890816 );
mvMatrix.scale( 1.209756, 1.19226, 0.7873234 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.24446);
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
sulfate_copper_sulfa<-read.table("sulfate_copper_sulfa.xyz", skip=1)
x<-sulfate_copper_sulfa$V2
y<-sulfate_copper_sulfa$V3
z<-sulfate_copper_sulfa$V4
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
9, 8, 2, 0, 0, 1, 1, 1,
1, 1, 1, 1, 0, 0, 1, 1,
1, 2, 1, 1, 0, 0, 1, 1,
1, 3, 1, 1, 0, 0, 1, 1,
3, 1, 1, 1, 0, 0, 1, 1,
2, 1, 1, 1, 0, 0, 1, 1,
6, 1, 1, 0, 0, 0, 1, 1,
8, 1, 1, 0, 0, 0, 1, 1,
1, 4, 1, 0, 0, 0, 1, 1,
4, 4, 1, 0, 0, 0, 1, 1,
7, 4, 1, 0, 0, 0, 1, 1,
1, 6, 1, 0, 0, 0, 1, 1,
1, 7, 1, 0, 0, 0, 1, 1,
1, 5, 1, 1, 1, 1, 1, 1,
3, 6, 1, 1, 1, 1, 1, 1,
2, 6, 1, 1, 1, 1, 1, 1,
5, 6, 1, 1, 1, 1, 1, 1
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
var radius = 7.581227;
var distance = 26.62874;
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
mvMatrix.translate( -5, -4.5, -1.5 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -26.62874);
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
for (var i = 0; i < 17; i++) {
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
