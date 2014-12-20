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
-3.033285, -0.5553361, -1.772352, 1, 0, 0, 1,
-2.652705, 0.2253174, -0.2276373, 1, 0.007843138, 0, 1,
-2.594555, 0.3096373, -3.392228, 1, 0.01176471, 0, 1,
-2.565048, -0.8786977, -2.914743, 1, 0.01960784, 0, 1,
-2.487275, 0.8312383, -0.5889698, 1, 0.02352941, 0, 1,
-2.423294, 0.2430974, -1.23193, 1, 0.03137255, 0, 1,
-2.375669, -1.234483, -0.780441, 1, 0.03529412, 0, 1,
-2.344716, 0.697802, -1.455297, 1, 0.04313726, 0, 1,
-2.332793, 0.1696779, -1.819464, 1, 0.04705882, 0, 1,
-2.329515, -0.09083643, -3.919709, 1, 0.05490196, 0, 1,
-2.32941, -0.1773511, -2.442168, 1, 0.05882353, 0, 1,
-2.256699, 0.574146, -2.744202, 1, 0.06666667, 0, 1,
-2.241091, -0.9495454, -2.546391, 1, 0.07058824, 0, 1,
-2.239217, 0.1413473, -0.7223201, 1, 0.07843138, 0, 1,
-2.162618, -0.8573556, -2.659216, 1, 0.08235294, 0, 1,
-2.160727, -0.04714624, -2.255847, 1, 0.09019608, 0, 1,
-2.112121, -0.08961007, 0.03013149, 1, 0.09411765, 0, 1,
-2.050175, 0.5832428, -1.16897, 1, 0.1019608, 0, 1,
-2.049741, 0.3094372, -1.98478, 1, 0.1098039, 0, 1,
-2.048623, 0.9304613, -2.062262, 1, 0.1137255, 0, 1,
-2.041308, 1.703705, 1.008805, 1, 0.1215686, 0, 1,
-2.040053, -0.4362296, -2.977454, 1, 0.1254902, 0, 1,
-2.001463, 1.160534, -1.577585, 1, 0.1333333, 0, 1,
-1.973822, 0.5781125, -1.914264, 1, 0.1372549, 0, 1,
-1.953711, 1.274202, -0.8543551, 1, 0.145098, 0, 1,
-1.924196, 0.0291368, -2.912097, 1, 0.1490196, 0, 1,
-1.902371, -0.4741991, -0.8788996, 1, 0.1568628, 0, 1,
-1.896169, 0.07453712, -1.194603, 1, 0.1607843, 0, 1,
-1.875114, -2.099224, -2.398291, 1, 0.1686275, 0, 1,
-1.866655, 1.159564, -1.70645, 1, 0.172549, 0, 1,
-1.865969, 0.9204807, -1.577084, 1, 0.1803922, 0, 1,
-1.853994, -1.262368, -3.479699, 1, 0.1843137, 0, 1,
-1.849978, 0.7336138, -2.394296, 1, 0.1921569, 0, 1,
-1.844127, -0.7346469, -0.5936949, 1, 0.1960784, 0, 1,
-1.80509, 0.859759, -0.9169376, 1, 0.2039216, 0, 1,
-1.794305, -1.66305, -1.522385, 1, 0.2117647, 0, 1,
-1.727545, -0.6117824, -2.491011, 1, 0.2156863, 0, 1,
-1.698356, 0.1843429, -1.105758, 1, 0.2235294, 0, 1,
-1.69591, 0.3256873, -2.137307, 1, 0.227451, 0, 1,
-1.68587, -0.0580742, -2.546788, 1, 0.2352941, 0, 1,
-1.663169, 1.6335, 0.3971326, 1, 0.2392157, 0, 1,
-1.660393, -2.415308, -3.2704, 1, 0.2470588, 0, 1,
-1.660381, -1.682635, 0.1575442, 1, 0.2509804, 0, 1,
-1.636448, -0.7343999, -1.251018, 1, 0.2588235, 0, 1,
-1.6152, 0.6795489, -0.8713663, 1, 0.2627451, 0, 1,
-1.594324, -0.9440011, -2.361221, 1, 0.2705882, 0, 1,
-1.589804, -0.6644492, -3.305966, 1, 0.2745098, 0, 1,
-1.587008, -1.230025, -0.6485018, 1, 0.282353, 0, 1,
-1.586138, -0.5197492, -1.758738, 1, 0.2862745, 0, 1,
-1.564191, -1.398899, -2.176604, 1, 0.2941177, 0, 1,
-1.551467, -1.423191, -3.518138, 1, 0.3019608, 0, 1,
-1.549653, -1.281201, -0.9860043, 1, 0.3058824, 0, 1,
-1.528411, 0.3070596, -2.086597, 1, 0.3137255, 0, 1,
-1.522594, -0.5279838, -2.350162, 1, 0.3176471, 0, 1,
-1.513419, -0.9703516, -1.457452, 1, 0.3254902, 0, 1,
-1.512277, -1.633384, -3.772069, 1, 0.3294118, 0, 1,
-1.50488, -0.6192252, -1.950575, 1, 0.3372549, 0, 1,
-1.503136, 0.929708, 0.1484491, 1, 0.3411765, 0, 1,
-1.48571, 0.1594622, -1.049271, 1, 0.3490196, 0, 1,
-1.475555, 1.125445, -0.9057437, 1, 0.3529412, 0, 1,
-1.472734, 0.769059, 0.3562888, 1, 0.3607843, 0, 1,
-1.46222, 1.768681, -1.7607, 1, 0.3647059, 0, 1,
-1.449066, 0.09998827, -1.839135, 1, 0.372549, 0, 1,
-1.448774, 1.577903, -0.7501077, 1, 0.3764706, 0, 1,
-1.432339, -0.2341017, -3.106272, 1, 0.3843137, 0, 1,
-1.428551, 1.490203, 0.1412778, 1, 0.3882353, 0, 1,
-1.424405, 0.2698593, -2.239047, 1, 0.3960784, 0, 1,
-1.393134, 0.3719762, -1.170134, 1, 0.4039216, 0, 1,
-1.383821, 0.2478505, -0.4556029, 1, 0.4078431, 0, 1,
-1.379102, -0.2537498, -1.120616, 1, 0.4156863, 0, 1,
-1.355993, 0.5751265, -1.913808, 1, 0.4196078, 0, 1,
-1.355965, 0.007965497, -1.596147, 1, 0.427451, 0, 1,
-1.354173, -0.02742232, -1.940775, 1, 0.4313726, 0, 1,
-1.352851, 1.390555, 0.02968966, 1, 0.4392157, 0, 1,
-1.344738, 0.2154532, -2.639417, 1, 0.4431373, 0, 1,
-1.338405, -0.5327682, -1.585334, 1, 0.4509804, 0, 1,
-1.334099, 0.4696188, -3.185378, 1, 0.454902, 0, 1,
-1.326419, 0.3004769, -1.331171, 1, 0.4627451, 0, 1,
-1.323537, 1.495149, -1.952847, 1, 0.4666667, 0, 1,
-1.315909, 0.01018593, -1.543949, 1, 0.4745098, 0, 1,
-1.313938, -0.7011541, -0.9502748, 1, 0.4784314, 0, 1,
-1.303055, 1.910352, -2.254456, 1, 0.4862745, 0, 1,
-1.303015, -0.6532184, -2.945695, 1, 0.4901961, 0, 1,
-1.297324, 0.03891451, -1.154708, 1, 0.4980392, 0, 1,
-1.29291, 1.112776, -2.349088, 1, 0.5058824, 0, 1,
-1.29198, -0.9165135, -1.633503, 1, 0.509804, 0, 1,
-1.281385, -1.250639, -4.934712, 1, 0.5176471, 0, 1,
-1.269563, 0.7621547, -1.666626, 1, 0.5215687, 0, 1,
-1.263633, 0.9213644, -1.172717, 1, 0.5294118, 0, 1,
-1.252304, -0.0859905, -2.111621, 1, 0.5333334, 0, 1,
-1.247173, -1.574305, -1.726455, 1, 0.5411765, 0, 1,
-1.246486, -0.7622555, -0.02932689, 1, 0.5450981, 0, 1,
-1.239458, -0.4517127, -0.5485135, 1, 0.5529412, 0, 1,
-1.232136, -0.8567173, -2.413784, 1, 0.5568628, 0, 1,
-1.230073, -2.071035, -1.901029, 1, 0.5647059, 0, 1,
-1.22712, -0.560116, -2.577322, 1, 0.5686275, 0, 1,
-1.223154, 0.2747537, 0.2854201, 1, 0.5764706, 0, 1,
-1.221034, 0.9319376, 0.2648323, 1, 0.5803922, 0, 1,
-1.218124, 1.908589, 1.220866, 1, 0.5882353, 0, 1,
-1.216493, 1.837355, -0.3291602, 1, 0.5921569, 0, 1,
-1.215714, -0.5771811, -2.862004, 1, 0.6, 0, 1,
-1.21449, -0.354833, -1.56248, 1, 0.6078432, 0, 1,
-1.21445, -1.394273, -1.848515, 1, 0.6117647, 0, 1,
-1.212263, 0.3322068, -1.57298, 1, 0.6196079, 0, 1,
-1.21116, 0.08456553, -2.364238, 1, 0.6235294, 0, 1,
-1.205902, 0.4868263, 0.303642, 1, 0.6313726, 0, 1,
-1.204938, 0.02939454, -1.835456, 1, 0.6352941, 0, 1,
-1.202757, -0.3086326, -2.580176, 1, 0.6431373, 0, 1,
-1.201652, -1.260958, -2.436981, 1, 0.6470588, 0, 1,
-1.199911, -1.071471, -4.236246, 1, 0.654902, 0, 1,
-1.189423, 0.3148806, -1.301988, 1, 0.6588235, 0, 1,
-1.188351, -0.5274429, -2.530388, 1, 0.6666667, 0, 1,
-1.188023, -1.167378, -2.020722, 1, 0.6705883, 0, 1,
-1.186978, 1.069746, -1.298209, 1, 0.6784314, 0, 1,
-1.186282, 0.3493302, -2.597441, 1, 0.682353, 0, 1,
-1.184323, 1.542951, -0.9880974, 1, 0.6901961, 0, 1,
-1.173595, 0.01416622, -2.488476, 1, 0.6941177, 0, 1,
-1.171518, -1.233628, -3.116404, 1, 0.7019608, 0, 1,
-1.170519, -0.1638555, -2.26654, 1, 0.7098039, 0, 1,
-1.168119, -0.977237, -1.626004, 1, 0.7137255, 0, 1,
-1.166109, -1.641383, -2.251757, 1, 0.7215686, 0, 1,
-1.163247, 0.9874504, -0.1842444, 1, 0.7254902, 0, 1,
-1.160427, 0.423437, -1.361322, 1, 0.7333333, 0, 1,
-1.159683, -0.1223789, -1.738095, 1, 0.7372549, 0, 1,
-1.158553, -0.7659739, -1.745882, 1, 0.7450981, 0, 1,
-1.142456, -1.813377, -3.722082, 1, 0.7490196, 0, 1,
-1.140994, 0.3247268, -0.3653686, 1, 0.7568628, 0, 1,
-1.139113, -1.71309, -6.131174, 1, 0.7607843, 0, 1,
-1.137907, 0.8210895, -0.5281733, 1, 0.7686275, 0, 1,
-1.13526, 0.6485808, -1.321762, 1, 0.772549, 0, 1,
-1.133944, 0.02857404, -2.066791, 1, 0.7803922, 0, 1,
-1.130733, 0.4377967, -1.437785, 1, 0.7843137, 0, 1,
-1.123608, -0.7061963, -0.5926812, 1, 0.7921569, 0, 1,
-1.121951, 0.2961778, -0.4592687, 1, 0.7960784, 0, 1,
-1.120075, -0.463639, -1.769659, 1, 0.8039216, 0, 1,
-1.114594, -0.06829323, -0.8736555, 1, 0.8117647, 0, 1,
-1.114494, -0.09404894, -2.915409, 1, 0.8156863, 0, 1,
-1.101718, 0.123035, -1.127043, 1, 0.8235294, 0, 1,
-1.10171, -0.1520581, -0.7048775, 1, 0.827451, 0, 1,
-1.098201, -0.4586168, -1.637155, 1, 0.8352941, 0, 1,
-1.095257, -0.3629866, -1.75095, 1, 0.8392157, 0, 1,
-1.091313, -1.350122, -3.229057, 1, 0.8470588, 0, 1,
-1.08978, -0.6146503, -2.936877, 1, 0.8509804, 0, 1,
-1.078257, -0.339483, -1.867386, 1, 0.8588235, 0, 1,
-1.077683, 2.278829, -0.1314422, 1, 0.8627451, 0, 1,
-1.07445, -0.1986606, -2.541696, 1, 0.8705882, 0, 1,
-1.071937, -0.9255921, -2.584257, 1, 0.8745098, 0, 1,
-1.070745, 0.5370656, -1.44243, 1, 0.8823529, 0, 1,
-1.067125, 0.7432432, -2.860955, 1, 0.8862745, 0, 1,
-1.052464, 1.764373, -0.9566141, 1, 0.8941177, 0, 1,
-1.042587, -0.1820062, -1.442237, 1, 0.8980392, 0, 1,
-1.035243, -2.272186, -1.804724, 1, 0.9058824, 0, 1,
-1.031472, -0.3679604, -1.714561, 1, 0.9137255, 0, 1,
-1.031147, -0.721607, -3.179485, 1, 0.9176471, 0, 1,
-1.026223, -0.9062678, -4.190473, 1, 0.9254902, 0, 1,
-1.025121, 0.1258647, -2.064083, 1, 0.9294118, 0, 1,
-1.015724, -1.725858, -4.438214, 1, 0.9372549, 0, 1,
-1.015707, 1.495551, 0.5486151, 1, 0.9411765, 0, 1,
-1.014904, -0.03002873, -0.8937201, 1, 0.9490196, 0, 1,
-1.012472, 1.445302, -1.215394, 1, 0.9529412, 0, 1,
-1.000562, 1.113982, -0.7608941, 1, 0.9607843, 0, 1,
-1.00006, 0.3534872, -1.268692, 1, 0.9647059, 0, 1,
-0.9962571, -1.626639, -1.705951, 1, 0.972549, 0, 1,
-0.9943874, -0.4955853, -3.211935, 1, 0.9764706, 0, 1,
-0.9851777, -1.94556, -3.890207, 1, 0.9843137, 0, 1,
-0.9787472, -0.1194265, -2.05037, 1, 0.9882353, 0, 1,
-0.9709504, -0.8832963, -2.081881, 1, 0.9960784, 0, 1,
-0.9651868, 0.9586007, 1.311683, 0.9960784, 1, 0, 1,
-0.9647943, -0.5213466, -1.337177, 0.9921569, 1, 0, 1,
-0.9612063, -0.9015365, -1.435228, 0.9843137, 1, 0, 1,
-0.9611557, -0.2359523, -1.425802, 0.9803922, 1, 0, 1,
-0.9571092, -0.003301919, -2.64007, 0.972549, 1, 0, 1,
-0.9556316, 0.7255486, -1.12054, 0.9686275, 1, 0, 1,
-0.9537306, 1.371064, -0.1638387, 0.9607843, 1, 0, 1,
-0.9372923, -0.5145582, -1.648403, 0.9568627, 1, 0, 1,
-0.933519, 0.8784369, -0.3416657, 0.9490196, 1, 0, 1,
-0.9312023, 0.5254862, -2.273986, 0.945098, 1, 0, 1,
-0.9202628, 0.3764914, -2.357045, 0.9372549, 1, 0, 1,
-0.9179327, 1.032659, -1.372266, 0.9333333, 1, 0, 1,
-0.9173587, 1.462404, -0.1441422, 0.9254902, 1, 0, 1,
-0.9027541, 0.3620564, -1.962109, 0.9215686, 1, 0, 1,
-0.9008195, -0.2097389, -0.5806689, 0.9137255, 1, 0, 1,
-0.8881736, 0.1741266, 0.900584, 0.9098039, 1, 0, 1,
-0.8866661, -0.3046166, -1.600885, 0.9019608, 1, 0, 1,
-0.8840257, -1.663898, -3.373334, 0.8941177, 1, 0, 1,
-0.8839093, -0.324991, -3.329418, 0.8901961, 1, 0, 1,
-0.8791838, 0.01046954, -1.639624, 0.8823529, 1, 0, 1,
-0.8776926, -0.3519166, -3.181606, 0.8784314, 1, 0, 1,
-0.8748178, -0.309426, -2.021838, 0.8705882, 1, 0, 1,
-0.8717355, -0.0782829, -1.055316, 0.8666667, 1, 0, 1,
-0.8696018, -1.909354, -0.6632354, 0.8588235, 1, 0, 1,
-0.8639473, -2.186129, -1.976684, 0.854902, 1, 0, 1,
-0.8633934, -0.7999904, -3.490315, 0.8470588, 1, 0, 1,
-0.8626022, 0.05562905, -0.2644624, 0.8431373, 1, 0, 1,
-0.8611214, -0.0269224, 0.3074523, 0.8352941, 1, 0, 1,
-0.8567184, 0.1180313, -2.108804, 0.8313726, 1, 0, 1,
-0.8520668, -0.3434977, -1.079828, 0.8235294, 1, 0, 1,
-0.8502536, -1.101578, -4.267753, 0.8196079, 1, 0, 1,
-0.8488299, 1.820019, -0.6024798, 0.8117647, 1, 0, 1,
-0.8471746, 1.639687, -0.06550457, 0.8078431, 1, 0, 1,
-0.8451327, -0.03067768, -2.203722, 0.8, 1, 0, 1,
-0.8434934, -0.6661959, -2.807379, 0.7921569, 1, 0, 1,
-0.8426216, 0.3193947, -1.536446, 0.7882353, 1, 0, 1,
-0.8387296, 0.487337, -1.025471, 0.7803922, 1, 0, 1,
-0.8381209, -0.9056914, -2.840477, 0.7764706, 1, 0, 1,
-0.833629, 0.3027503, -2.403542, 0.7686275, 1, 0, 1,
-0.8217796, -1.173765, -2.145098, 0.7647059, 1, 0, 1,
-0.8206955, 1.181379, -1.557376, 0.7568628, 1, 0, 1,
-0.8194174, -0.580824, -2.310654, 0.7529412, 1, 0, 1,
-0.8135765, -0.02366277, -2.646406, 0.7450981, 1, 0, 1,
-0.8103703, 0.59645, -1.853683, 0.7411765, 1, 0, 1,
-0.8044506, -1.798849, -4.025042, 0.7333333, 1, 0, 1,
-0.802816, 1.244457, -0.3321158, 0.7294118, 1, 0, 1,
-0.7994368, 0.04409055, -0.7381104, 0.7215686, 1, 0, 1,
-0.7979216, -2.246431, -3.440304, 0.7176471, 1, 0, 1,
-0.7913827, 1.326883, -1.313833, 0.7098039, 1, 0, 1,
-0.7855037, 0.16705, -1.709823, 0.7058824, 1, 0, 1,
-0.7830784, 0.6976934, 0.05974657, 0.6980392, 1, 0, 1,
-0.7759073, 0.6933844, -2.417107, 0.6901961, 1, 0, 1,
-0.7756454, 0.4914141, -0.1413826, 0.6862745, 1, 0, 1,
-0.7674428, 1.345624, -0.7472498, 0.6784314, 1, 0, 1,
-0.7648549, 2.102979, -2.48949, 0.6745098, 1, 0, 1,
-0.7647704, 0.2815566, -0.8523747, 0.6666667, 1, 0, 1,
-0.7591391, 0.1188315, -1.008351, 0.6627451, 1, 0, 1,
-0.7522457, 0.3569834, 0.4844513, 0.654902, 1, 0, 1,
-0.7521049, -0.3451323, -1.646821, 0.6509804, 1, 0, 1,
-0.7500885, -0.04830988, -0.7657229, 0.6431373, 1, 0, 1,
-0.7500124, 1.218638, -3.152828, 0.6392157, 1, 0, 1,
-0.7460221, 0.9916602, -0.4854654, 0.6313726, 1, 0, 1,
-0.7416528, 0.8809676, -0.6834131, 0.627451, 1, 0, 1,
-0.7409328, -0.8277565, -3.36557, 0.6196079, 1, 0, 1,
-0.7353461, -0.8526781, -2.689916, 0.6156863, 1, 0, 1,
-0.7349797, 3.305075, -0.486842, 0.6078432, 1, 0, 1,
-0.7332747, 0.5999627, -0.3885301, 0.6039216, 1, 0, 1,
-0.725995, 0.9061791, -1.233212, 0.5960785, 1, 0, 1,
-0.7229685, -1.712074, -2.368307, 0.5882353, 1, 0, 1,
-0.7189724, -0.5440183, -1.76567, 0.5843138, 1, 0, 1,
-0.7187324, 0.2374524, -0.952145, 0.5764706, 1, 0, 1,
-0.7185236, -1.495948, -2.619643, 0.572549, 1, 0, 1,
-0.7095626, 1.003289, 0.5188025, 0.5647059, 1, 0, 1,
-0.7067258, -0.5018333, -2.029514, 0.5607843, 1, 0, 1,
-0.703476, -0.7622966, -2.926971, 0.5529412, 1, 0, 1,
-0.702132, -0.2530041, -0.6615417, 0.5490196, 1, 0, 1,
-0.6995882, 0.493148, -1.679754, 0.5411765, 1, 0, 1,
-0.6869152, -1.071643, -2.331106, 0.5372549, 1, 0, 1,
-0.6860433, 1.384374, 0.6768075, 0.5294118, 1, 0, 1,
-0.684109, -1.004809, -1.342402, 0.5254902, 1, 0, 1,
-0.6830919, 0.601651, -0.4249625, 0.5176471, 1, 0, 1,
-0.6829038, 1.487372, -0.9431296, 0.5137255, 1, 0, 1,
-0.6825275, -0.5505167, -2.578857, 0.5058824, 1, 0, 1,
-0.6764678, 1.928017, 0.006843172, 0.5019608, 1, 0, 1,
-0.6749838, 0.351649, -2.140621, 0.4941176, 1, 0, 1,
-0.6731952, -0.7068456, -2.9881, 0.4862745, 1, 0, 1,
-0.6708247, -0.204988, -2.013585, 0.4823529, 1, 0, 1,
-0.6701748, 1.020409, 0.1854707, 0.4745098, 1, 0, 1,
-0.6695552, -0.8326691, -2.590062, 0.4705882, 1, 0, 1,
-0.6695187, -1.109688, -2.434666, 0.4627451, 1, 0, 1,
-0.6691208, 0.07785626, -0.9563572, 0.4588235, 1, 0, 1,
-0.6685137, -0.7848247, -1.065663, 0.4509804, 1, 0, 1,
-0.6676382, 2.018434, 0.9742967, 0.4470588, 1, 0, 1,
-0.6672049, -0.3844148, -2.770061, 0.4392157, 1, 0, 1,
-0.6665496, 0.3399849, -0.4398519, 0.4352941, 1, 0, 1,
-0.6663544, -0.1548518, -2.081297, 0.427451, 1, 0, 1,
-0.6663005, -0.1144915, -2.408756, 0.4235294, 1, 0, 1,
-0.664511, 1.568833, -1.579737, 0.4156863, 1, 0, 1,
-0.6595479, 0.7342713, -0.2773515, 0.4117647, 1, 0, 1,
-0.6551686, 1.179989, 1.705569, 0.4039216, 1, 0, 1,
-0.6527717, -1.117088, -0.5403205, 0.3960784, 1, 0, 1,
-0.6505548, 0.1601625, -1.048391, 0.3921569, 1, 0, 1,
-0.6465705, 0.3071134, -1.24468, 0.3843137, 1, 0, 1,
-0.6456126, 0.5842274, -1.710483, 0.3803922, 1, 0, 1,
-0.6362597, 2.664935, -1.663758, 0.372549, 1, 0, 1,
-0.6337363, -0.3333206, -1.542116, 0.3686275, 1, 0, 1,
-0.633732, 0.9829757, -1.590966, 0.3607843, 1, 0, 1,
-0.6291901, 0.9205317, 0.04617622, 0.3568628, 1, 0, 1,
-0.6264582, -1.280676, -3.980222, 0.3490196, 1, 0, 1,
-0.6227215, -0.7431966, -1.047867, 0.345098, 1, 0, 1,
-0.6172402, 0.7579164, -1.595629, 0.3372549, 1, 0, 1,
-0.611454, -0.1436174, -2.875648, 0.3333333, 1, 0, 1,
-0.6091335, -1.169507, -3.264921, 0.3254902, 1, 0, 1,
-0.5896177, 0.9788048, 0.5233039, 0.3215686, 1, 0, 1,
-0.5878954, 0.02165776, 0.3030193, 0.3137255, 1, 0, 1,
-0.5825801, 0.882856, -1.037004, 0.3098039, 1, 0, 1,
-0.5768724, 0.2937259, -0.4860599, 0.3019608, 1, 0, 1,
-0.5744949, 0.8061281, -1.456177, 0.2941177, 1, 0, 1,
-0.5715248, -1.162584, -2.412593, 0.2901961, 1, 0, 1,
-0.5696776, -0.6383447, -1.795513, 0.282353, 1, 0, 1,
-0.5689597, -0.3041391, -2.271772, 0.2784314, 1, 0, 1,
-0.5679833, 0.02390245, -2.356882, 0.2705882, 1, 0, 1,
-0.5672016, 0.4898132, 1.265871, 0.2666667, 1, 0, 1,
-0.5636067, -0.1075746, -1.838319, 0.2588235, 1, 0, 1,
-0.5617638, -0.5945337, -1.8532, 0.254902, 1, 0, 1,
-0.5536366, -1.80786, -3.52616, 0.2470588, 1, 0, 1,
-0.5521211, -0.8531816, -2.581782, 0.2431373, 1, 0, 1,
-0.5471878, -1.905496, -3.060443, 0.2352941, 1, 0, 1,
-0.5442849, 0.7454209, -2.030901, 0.2313726, 1, 0, 1,
-0.5425184, 0.2916652, 0.2820721, 0.2235294, 1, 0, 1,
-0.5398965, 1.77305, -0.6895486, 0.2196078, 1, 0, 1,
-0.538673, 0.3595774, 0.2045805, 0.2117647, 1, 0, 1,
-0.5384147, -0.5128392, -1.302556, 0.2078431, 1, 0, 1,
-0.5343959, -0.2600253, -0.8892261, 0.2, 1, 0, 1,
-0.5329573, 1.055648, -0.2597584, 0.1921569, 1, 0, 1,
-0.5305119, 0.5862265, -1.177593, 0.1882353, 1, 0, 1,
-0.5254841, -1.216783, -3.437128, 0.1803922, 1, 0, 1,
-0.5123488, 0.5033495, -2.083164, 0.1764706, 1, 0, 1,
-0.5067441, -0.2366315, -2.834584, 0.1686275, 1, 0, 1,
-0.5062324, 1.993021, 0.5009426, 0.1647059, 1, 0, 1,
-0.4950461, -1.441182, -2.498924, 0.1568628, 1, 0, 1,
-0.4850299, -1.850169, -3.170527, 0.1529412, 1, 0, 1,
-0.4770373, 0.1932791, -1.170698, 0.145098, 1, 0, 1,
-0.4740867, 0.6779623, -0.4601762, 0.1411765, 1, 0, 1,
-0.4697186, -0.1560833, -2.486839, 0.1333333, 1, 0, 1,
-0.4560612, -2.350233, -4.88844, 0.1294118, 1, 0, 1,
-0.4557529, 0.5452004, 0.1807034, 0.1215686, 1, 0, 1,
-0.451023, 0.0002195551, -2.948592, 0.1176471, 1, 0, 1,
-0.4461959, -0.7654883, -2.597249, 0.1098039, 1, 0, 1,
-0.4457996, -0.3781406, -2.681978, 0.1058824, 1, 0, 1,
-0.4420438, -0.4888675, -2.968948, 0.09803922, 1, 0, 1,
-0.4398154, 1.574741, -0.1336827, 0.09019608, 1, 0, 1,
-0.4387697, -0.1960343, -3.055279, 0.08627451, 1, 0, 1,
-0.4378612, -0.3380375, -4.08218, 0.07843138, 1, 0, 1,
-0.4284932, 1.228617, 0.2045383, 0.07450981, 1, 0, 1,
-0.4281449, 0.8505473, -1.538939, 0.06666667, 1, 0, 1,
-0.4274188, -1.147197, -2.942513, 0.0627451, 1, 0, 1,
-0.4273111, -2.115073, -2.696899, 0.05490196, 1, 0, 1,
-0.4260328, -1.259928, -2.669011, 0.05098039, 1, 0, 1,
-0.4248101, -0.8841818, -2.534607, 0.04313726, 1, 0, 1,
-0.4130679, -0.6437469, -1.921314, 0.03921569, 1, 0, 1,
-0.4070418, 0.1694562, -1.216664, 0.03137255, 1, 0, 1,
-0.4045763, 0.2279524, -0.8242235, 0.02745098, 1, 0, 1,
-0.4013111, -0.4885677, -2.077493, 0.01960784, 1, 0, 1,
-0.3967203, -0.9406293, -1.558633, 0.01568628, 1, 0, 1,
-0.3949831, 0.906678, -1.009307, 0.007843138, 1, 0, 1,
-0.386102, -1.462187, -3.568374, 0.003921569, 1, 0, 1,
-0.370389, 1.182075, 0.5334285, 0, 1, 0.003921569, 1,
-0.3684365, 0.6266409, 0.2428518, 0, 1, 0.01176471, 1,
-0.3671905, 0.4699608, -0.5863528, 0, 1, 0.01568628, 1,
-0.3664721, -0.2199262, -2.032189, 0, 1, 0.02352941, 1,
-0.3579039, 0.1295901, -0.3188245, 0, 1, 0.02745098, 1,
-0.3548459, -1.402403, -3.114788, 0, 1, 0.03529412, 1,
-0.3537367, 0.286779, -0.4342971, 0, 1, 0.03921569, 1,
-0.3535913, 0.4131175, 0.01645412, 0, 1, 0.04705882, 1,
-0.348279, 0.5234166, -1.549423, 0, 1, 0.05098039, 1,
-0.3482787, 1.372092, 0.2953317, 0, 1, 0.05882353, 1,
-0.3465495, -1.361704, -2.647436, 0, 1, 0.0627451, 1,
-0.3450257, 0.7399884, 0.5505674, 0, 1, 0.07058824, 1,
-0.3449655, -1.453938, -2.408542, 0, 1, 0.07450981, 1,
-0.3442931, 0.3599696, -1.156735, 0, 1, 0.08235294, 1,
-0.3415013, 0.2745784, -1.99381, 0, 1, 0.08627451, 1,
-0.339966, 1.450019, -0.6510299, 0, 1, 0.09411765, 1,
-0.3357077, -0.3345078, -1.942508, 0, 1, 0.1019608, 1,
-0.3341538, -0.4256416, -4.313469, 0, 1, 0.1058824, 1,
-0.3313696, -1.172197, -1.417442, 0, 1, 0.1137255, 1,
-0.3301961, -1.140553, -2.431767, 0, 1, 0.1176471, 1,
-0.3296544, -1.638885, -3.199623, 0, 1, 0.1254902, 1,
-0.3294953, -0.226946, -0.7582176, 0, 1, 0.1294118, 1,
-0.3281901, 0.9755102, -0.3624108, 0, 1, 0.1372549, 1,
-0.3273439, 0.2005004, -1.524604, 0, 1, 0.1411765, 1,
-0.3265668, -1.61574, -3.451924, 0, 1, 0.1490196, 1,
-0.3257262, -0.7578933, -4.389375, 0, 1, 0.1529412, 1,
-0.324442, -0.005265743, 0.07877903, 0, 1, 0.1607843, 1,
-0.3211005, -0.9281062, -1.475927, 0, 1, 0.1647059, 1,
-0.3147081, -1.535121, -1.114502, 0, 1, 0.172549, 1,
-0.3092201, -0.2607062, -2.362586, 0, 1, 0.1764706, 1,
-0.3061606, -0.1752223, -2.10094, 0, 1, 0.1843137, 1,
-0.3029082, -0.6994926, -3.234427, 0, 1, 0.1882353, 1,
-0.3016805, 0.990422, -1.08278, 0, 1, 0.1960784, 1,
-0.3015818, -0.601979, -1.522552, 0, 1, 0.2039216, 1,
-0.3007982, 0.2677685, -0.07396577, 0, 1, 0.2078431, 1,
-0.3007659, 0.9915237, 0.1033037, 0, 1, 0.2156863, 1,
-0.3001732, 0.007713111, -1.646931, 0, 1, 0.2196078, 1,
-0.2910141, -2.549925, -3.342855, 0, 1, 0.227451, 1,
-0.2906619, 0.7869881, 0.5982076, 0, 1, 0.2313726, 1,
-0.2888433, -0.4435754, -2.708394, 0, 1, 0.2392157, 1,
-0.2875418, 2.336468, 0.5016609, 0, 1, 0.2431373, 1,
-0.2847916, -0.3025256, -0.3927585, 0, 1, 0.2509804, 1,
-0.2759137, -0.7635804, -3.360588, 0, 1, 0.254902, 1,
-0.2714787, -0.3849487, -2.116412, 0, 1, 0.2627451, 1,
-0.2637484, -1.020595, -4.29424, 0, 1, 0.2666667, 1,
-0.2618608, 0.9957175, 0.5290101, 0, 1, 0.2745098, 1,
-0.2599829, 1.869089, -1.067951, 0, 1, 0.2784314, 1,
-0.255935, 0.4433004, 0.1620411, 0, 1, 0.2862745, 1,
-0.255225, -1.758323, -1.636249, 0, 1, 0.2901961, 1,
-0.2503257, -0.301535, -2.113395, 0, 1, 0.2980392, 1,
-0.2497645, -0.8749231, -3.601292, 0, 1, 0.3058824, 1,
-0.2473929, -0.7666248, -2.766007, 0, 1, 0.3098039, 1,
-0.2468625, 1.073675, 0.7490203, 0, 1, 0.3176471, 1,
-0.2467865, -1.123792, -3.10224, 0, 1, 0.3215686, 1,
-0.2463029, 0.5531279, -1.742782, 0, 1, 0.3294118, 1,
-0.2456218, 0.02186293, -0.7229781, 0, 1, 0.3333333, 1,
-0.2413103, -0.8890959, -3.786643, 0, 1, 0.3411765, 1,
-0.2359636, 2.28855, -0.09742612, 0, 1, 0.345098, 1,
-0.2310755, -0.6572395, -3.061739, 0, 1, 0.3529412, 1,
-0.2300454, 0.6912625, -0.6590664, 0, 1, 0.3568628, 1,
-0.2295202, 0.6653114, -1.124505, 0, 1, 0.3647059, 1,
-0.2279982, -0.99531, -3.011349, 0, 1, 0.3686275, 1,
-0.2248418, 0.7280579, -0.9842828, 0, 1, 0.3764706, 1,
-0.2159941, -0.08201865, -3.129018, 0, 1, 0.3803922, 1,
-0.2153598, -1.572236, -4.21001, 0, 1, 0.3882353, 1,
-0.2144854, -1.20573, -2.615524, 0, 1, 0.3921569, 1,
-0.2136032, -0.6094923, -2.328557, 0, 1, 0.4, 1,
-0.2130787, -0.1451539, -3.254234, 0, 1, 0.4078431, 1,
-0.2070338, -0.797559, -2.274734, 0, 1, 0.4117647, 1,
-0.2037632, -2.803702, -0.771244, 0, 1, 0.4196078, 1,
-0.2034505, -0.7927672, -3.365484, 0, 1, 0.4235294, 1,
-0.2028011, -0.4026093, -3.96808, 0, 1, 0.4313726, 1,
-0.2024918, 0.6517823, 1.024052, 0, 1, 0.4352941, 1,
-0.1911243, 0.3612159, -1.661499, 0, 1, 0.4431373, 1,
-0.1904321, -0.641529, -2.273945, 0, 1, 0.4470588, 1,
-0.1868093, -0.5720792, -3.302788, 0, 1, 0.454902, 1,
-0.1847831, -1.416452, -3.401157, 0, 1, 0.4588235, 1,
-0.1819143, -1.455176, -4.32517, 0, 1, 0.4666667, 1,
-0.1798578, -2.181558, -2.780364, 0, 1, 0.4705882, 1,
-0.179319, -0.09094254, -1.585297, 0, 1, 0.4784314, 1,
-0.1736078, -0.3731496, -3.201462, 0, 1, 0.4823529, 1,
-0.1735766, -0.3667797, -1.969374, 0, 1, 0.4901961, 1,
-0.170618, -0.5358026, -1.774823, 0, 1, 0.4941176, 1,
-0.1683773, -1.602462, -3.148537, 0, 1, 0.5019608, 1,
-0.1624977, 0.5912426, 0.4840333, 0, 1, 0.509804, 1,
-0.1615164, -0.8453726, -2.842123, 0, 1, 0.5137255, 1,
-0.1607824, -0.4131717, -2.564196, 0, 1, 0.5215687, 1,
-0.1584075, 0.2396987, -0.3164168, 0, 1, 0.5254902, 1,
-0.1434899, -1.340337, -2.517988, 0, 1, 0.5333334, 1,
-0.1413264, 0.3080916, -1.057319, 0, 1, 0.5372549, 1,
-0.1407109, 0.4691815, -1.725739, 0, 1, 0.5450981, 1,
-0.1393573, 0.4104586, -0.8896862, 0, 1, 0.5490196, 1,
-0.138759, -1.113145, -4.900968, 0, 1, 0.5568628, 1,
-0.1350766, -0.5350578, -1.331694, 0, 1, 0.5607843, 1,
-0.133215, -1.223225, -2.050732, 0, 1, 0.5686275, 1,
-0.1314426, -1.739737, -3.186249, 0, 1, 0.572549, 1,
-0.1301355, 2.67541, -0.8524472, 0, 1, 0.5803922, 1,
-0.1286884, 0.5314131, -1.695022, 0, 1, 0.5843138, 1,
-0.1278382, -0.01486047, -2.301231, 0, 1, 0.5921569, 1,
-0.1269443, -0.838522, -2.837902, 0, 1, 0.5960785, 1,
-0.1184167, 0.3162437, 1.08348, 0, 1, 0.6039216, 1,
-0.1183378, -0.8707741, -4.288094, 0, 1, 0.6117647, 1,
-0.1157979, 1.196004, -0.7142567, 0, 1, 0.6156863, 1,
-0.1148823, -0.1427309, -2.392562, 0, 1, 0.6235294, 1,
-0.1136745, -0.1833102, -3.141828, 0, 1, 0.627451, 1,
-0.1084735, 0.4494925, -1.532541, 0, 1, 0.6352941, 1,
-0.108043, 0.5321338, 0.5763276, 0, 1, 0.6392157, 1,
-0.1067356, 0.1581754, 0.7987763, 0, 1, 0.6470588, 1,
-0.1062761, 0.1869326, -0.5629706, 0, 1, 0.6509804, 1,
-0.1059396, 2.396019, 0.388079, 0, 1, 0.6588235, 1,
-0.1052326, -0.6208643, -1.574511, 0, 1, 0.6627451, 1,
-0.1051308, 0.2270059, 0.8098429, 0, 1, 0.6705883, 1,
-0.1004807, 0.316479, -1.956505, 0, 1, 0.6745098, 1,
-0.09973848, -0.4246467, -2.480414, 0, 1, 0.682353, 1,
-0.09863688, 0.5374748, -1.086474, 0, 1, 0.6862745, 1,
-0.0932752, -1.699851, -1.895615, 0, 1, 0.6941177, 1,
-0.09146666, -0.435625, -2.568878, 0, 1, 0.7019608, 1,
-0.09105497, 0.2277929, -0.1919007, 0, 1, 0.7058824, 1,
-0.09079313, 0.2944297, -1.020416, 0, 1, 0.7137255, 1,
-0.09038448, -0.6980897, -1.836477, 0, 1, 0.7176471, 1,
-0.0897435, -1.466202, -2.454275, 0, 1, 0.7254902, 1,
-0.08857395, -1.172241, -4.779934, 0, 1, 0.7294118, 1,
-0.08500963, 0.6354966, 0.7126226, 0, 1, 0.7372549, 1,
-0.08437013, 0.6180995, -0.9491594, 0, 1, 0.7411765, 1,
-0.08411429, -0.6304665, -3.04315, 0, 1, 0.7490196, 1,
-0.08305681, 0.5394262, 0.3876831, 0, 1, 0.7529412, 1,
-0.08296681, -1.971825, -2.084974, 0, 1, 0.7607843, 1,
-0.08238991, 1.513975, 0.1364323, 0, 1, 0.7647059, 1,
-0.08216486, -1.117931, -1.286571, 0, 1, 0.772549, 1,
-0.07807337, 1.863326, -1.89095, 0, 1, 0.7764706, 1,
-0.07297453, 0.7742, -0.2232689, 0, 1, 0.7843137, 1,
-0.07050741, -0.03193977, -3.090316, 0, 1, 0.7882353, 1,
-0.0687566, 0.250303, 0.2563172, 0, 1, 0.7960784, 1,
-0.06777564, -0.78126, -2.844087, 0, 1, 0.8039216, 1,
-0.06430445, -0.5857077, -1.849414, 0, 1, 0.8078431, 1,
-0.05725783, -0.4997079, -3.204076, 0, 1, 0.8156863, 1,
-0.05295359, -2.13369, -4.631861, 0, 1, 0.8196079, 1,
-0.05086824, 0.358537, -0.01083527, 0, 1, 0.827451, 1,
-0.02905802, -0.3379969, -1.251868, 0, 1, 0.8313726, 1,
-0.02779204, -1.883875, -2.323073, 0, 1, 0.8392157, 1,
-0.02653251, 0.9811456, -0.5867606, 0, 1, 0.8431373, 1,
-0.02500079, -1.23325, -2.729023, 0, 1, 0.8509804, 1,
-0.01820362, -0.3949105, -2.03007, 0, 1, 0.854902, 1,
-0.01803549, -0.2221523, -1.266813, 0, 1, 0.8627451, 1,
-0.008884218, -0.7052112, -3.012241, 0, 1, 0.8666667, 1,
-0.002816018, 0.3605264, 0.5426285, 0, 1, 0.8745098, 1,
-0.0020665, -0.1359885, -1.518321, 0, 1, 0.8784314, 1,
0.002166701, -2.251295, 2.669442, 0, 1, 0.8862745, 1,
0.003422116, -0.2667849, 1.242759, 0, 1, 0.8901961, 1,
0.006791784, -0.9281057, 2.675975, 0, 1, 0.8980392, 1,
0.01167687, -0.1273473, 1.581217, 0, 1, 0.9058824, 1,
0.01496388, -0.01260035, 2.975987, 0, 1, 0.9098039, 1,
0.01543511, -1.091586, 2.472081, 0, 1, 0.9176471, 1,
0.0173265, 1.724151, -0.2918263, 0, 1, 0.9215686, 1,
0.02211041, -0.2673841, 2.403647, 0, 1, 0.9294118, 1,
0.026756, -1.348123, 5.11147, 0, 1, 0.9333333, 1,
0.02682422, 1.506092, -0.879583, 0, 1, 0.9411765, 1,
0.02691361, -0.7032863, 2.013763, 0, 1, 0.945098, 1,
0.0281005, -0.4022938, 5.590106, 0, 1, 0.9529412, 1,
0.03062118, 0.01883722, 0.06152257, 0, 1, 0.9568627, 1,
0.03134972, 0.3429681, 0.3641554, 0, 1, 0.9647059, 1,
0.03347642, -0.8885083, 1.925835, 0, 1, 0.9686275, 1,
0.03559621, 0.7894985, 1.575616, 0, 1, 0.9764706, 1,
0.03612906, -0.6913191, 4.006028, 0, 1, 0.9803922, 1,
0.03649023, 0.5916568, 0.96025, 0, 1, 0.9882353, 1,
0.03917957, 1.266245, 0.2750906, 0, 1, 0.9921569, 1,
0.04044511, -1.602053, 2.272808, 0, 1, 1, 1,
0.04610311, -1.499976, 5.046551, 0, 0.9921569, 1, 1,
0.04685441, -1.039168, 2.376719, 0, 0.9882353, 1, 1,
0.0486519, -1.229167, 1.902091, 0, 0.9803922, 1, 1,
0.05589718, -0.3107571, 2.371619, 0, 0.9764706, 1, 1,
0.05697548, -0.03109392, 1.40969, 0, 0.9686275, 1, 1,
0.05727677, -0.8828697, 4.994178, 0, 0.9647059, 1, 1,
0.05797354, 0.4751935, 0.9359818, 0, 0.9568627, 1, 1,
0.06268342, 1.594459, 1.31864, 0, 0.9529412, 1, 1,
0.06645539, -0.8050718, 3.228084, 0, 0.945098, 1, 1,
0.06756034, 0.8162081, 0.9771914, 0, 0.9411765, 1, 1,
0.07090848, 1.067694, -0.2265538, 0, 0.9333333, 1, 1,
0.07197954, -0.07753549, 2.421886, 0, 0.9294118, 1, 1,
0.0730166, 0.3487886, 1.107119, 0, 0.9215686, 1, 1,
0.0881025, -1.143038, 2.91937, 0, 0.9176471, 1, 1,
0.09173844, -1.547928, 4.478946, 0, 0.9098039, 1, 1,
0.09669778, 0.5613157, 1.598956, 0, 0.9058824, 1, 1,
0.09922556, -1.465791, 2.631018, 0, 0.8980392, 1, 1,
0.1000343, 0.8555789, -0.5944219, 0, 0.8901961, 1, 1,
0.100378, 1.878113, 1.094682, 0, 0.8862745, 1, 1,
0.1125978, 1.298282, 2.46616, 0, 0.8784314, 1, 1,
0.1168044, -0.4352848, 4.013946, 0, 0.8745098, 1, 1,
0.1168857, -1.200837, 3.087197, 0, 0.8666667, 1, 1,
0.1169325, 0.1582172, -0.1152318, 0, 0.8627451, 1, 1,
0.1174367, 0.1926327, 1.326182, 0, 0.854902, 1, 1,
0.1190665, -0.8501608, 3.864862, 0, 0.8509804, 1, 1,
0.1195315, 0.2820207, 1.367724, 0, 0.8431373, 1, 1,
0.1204539, -0.1759121, 1.409412, 0, 0.8392157, 1, 1,
0.1240972, 1.580844, 0.6842031, 0, 0.8313726, 1, 1,
0.125537, -1.461349, 3.585583, 0, 0.827451, 1, 1,
0.1256617, -0.4041207, 4.263869, 0, 0.8196079, 1, 1,
0.1262051, 0.5432311, 0.2842865, 0, 0.8156863, 1, 1,
0.1262482, 1.326814, -0.4452424, 0, 0.8078431, 1, 1,
0.1282656, -1.220039, 2.449557, 0, 0.8039216, 1, 1,
0.1301215, -0.7985449, 2.94101, 0, 0.7960784, 1, 1,
0.1319406, -2.756203, 2.743431, 0, 0.7882353, 1, 1,
0.133588, -2.282012, 3.858521, 0, 0.7843137, 1, 1,
0.1336831, -1.014781, 2.347575, 0, 0.7764706, 1, 1,
0.1357774, -0.5468383, 1.650077, 0, 0.772549, 1, 1,
0.140667, -0.09358618, 1.651758, 0, 0.7647059, 1, 1,
0.1440418, 1.192067, 1.857358, 0, 0.7607843, 1, 1,
0.1448599, 0.2033588, 0.4003261, 0, 0.7529412, 1, 1,
0.1458033, -0.1671018, 2.368272, 0, 0.7490196, 1, 1,
0.1484063, 0.983731, -1.880485, 0, 0.7411765, 1, 1,
0.1496846, -1.910676, 2.959844, 0, 0.7372549, 1, 1,
0.1502387, 0.387439, -0.07103279, 0, 0.7294118, 1, 1,
0.1540006, 0.01493503, 0.6661063, 0, 0.7254902, 1, 1,
0.1563319, 0.6619369, 1.715267, 0, 0.7176471, 1, 1,
0.1564092, 0.3234184, 0.290552, 0, 0.7137255, 1, 1,
0.1569093, -0.5845141, 3.101495, 0, 0.7058824, 1, 1,
0.1602244, -0.01680798, 0.2030527, 0, 0.6980392, 1, 1,
0.1609112, -1.948413, 2.424577, 0, 0.6941177, 1, 1,
0.1614255, -0.1651037, 2.499818, 0, 0.6862745, 1, 1,
0.1763112, 0.3659817, 0.1418765, 0, 0.682353, 1, 1,
0.1765027, -1.243701, 3.674696, 0, 0.6745098, 1, 1,
0.180506, 0.8990294, 0.5442094, 0, 0.6705883, 1, 1,
0.1855395, -0.2939328, 1.925398, 0, 0.6627451, 1, 1,
0.1859843, 2.130934, -1.681386, 0, 0.6588235, 1, 1,
0.1912314, 0.7721702, -0.1006832, 0, 0.6509804, 1, 1,
0.1925434, -1.20966, 1.747391, 0, 0.6470588, 1, 1,
0.1968434, 0.871437, 1.519373, 0, 0.6392157, 1, 1,
0.1975531, 0.4201202, 0.6890202, 0, 0.6352941, 1, 1,
0.2035998, -0.8363236, 3.750369, 0, 0.627451, 1, 1,
0.2058721, -0.372707, 1.559782, 0, 0.6235294, 1, 1,
0.2088561, 1.063286, 0.1485276, 0, 0.6156863, 1, 1,
0.2114264, 1.53987, -1.994944, 0, 0.6117647, 1, 1,
0.2151573, 1.175779, -0.1957144, 0, 0.6039216, 1, 1,
0.2184647, -0.8023381, 2.795352, 0, 0.5960785, 1, 1,
0.2228089, 1.259232, -0.2962298, 0, 0.5921569, 1, 1,
0.230227, -0.1453038, 2.146063, 0, 0.5843138, 1, 1,
0.2310212, 0.2217125, 2.370992, 0, 0.5803922, 1, 1,
0.2342919, 1.452382, -0.3615052, 0, 0.572549, 1, 1,
0.234494, -0.1657834, 2.888396, 0, 0.5686275, 1, 1,
0.2348415, 0.3935998, 0.7061851, 0, 0.5607843, 1, 1,
0.2429164, -0.8838966, 1.158501, 0, 0.5568628, 1, 1,
0.2434566, 0.8985701, -1.117778, 0, 0.5490196, 1, 1,
0.2439847, 0.4646491, 1.973659, 0, 0.5450981, 1, 1,
0.2467565, -0.0506046, 2.161599, 0, 0.5372549, 1, 1,
0.2468788, 0.5035864, 0.4997276, 0, 0.5333334, 1, 1,
0.2472634, 0.7019135, -0.09182345, 0, 0.5254902, 1, 1,
0.2550331, -0.9386492, 2.72583, 0, 0.5215687, 1, 1,
0.2588486, -1.444151, 2.071602, 0, 0.5137255, 1, 1,
0.262233, -0.4090931, 2.140225, 0, 0.509804, 1, 1,
0.2663983, 0.969972, -1.958194, 0, 0.5019608, 1, 1,
0.2687673, 0.1412079, 4.597886, 0, 0.4941176, 1, 1,
0.2690094, 1.802544, 1.16326, 0, 0.4901961, 1, 1,
0.2712514, -2.6309, 2.621981, 0, 0.4823529, 1, 1,
0.271522, -0.2615685, 2.38228, 0, 0.4784314, 1, 1,
0.276146, -1.856623, 1.218088, 0, 0.4705882, 1, 1,
0.2763826, 0.1882776, 0.7010114, 0, 0.4666667, 1, 1,
0.2787127, -1.044438, 2.408411, 0, 0.4588235, 1, 1,
0.2788268, -0.545059, 2.486925, 0, 0.454902, 1, 1,
0.2807931, 0.2931805, -0.8171183, 0, 0.4470588, 1, 1,
0.285704, 1.351303, 0.3061827, 0, 0.4431373, 1, 1,
0.2857889, 2.263996, -0.316696, 0, 0.4352941, 1, 1,
0.2902316, 0.6743603, 0.445733, 0, 0.4313726, 1, 1,
0.2925583, -0.06084459, 1.712735, 0, 0.4235294, 1, 1,
0.2929049, 1.666139, 0.3374724, 0, 0.4196078, 1, 1,
0.2969168, -0.2371653, 1.727206, 0, 0.4117647, 1, 1,
0.2973047, -0.2612698, 1.786357, 0, 0.4078431, 1, 1,
0.2990978, -2.095858, 3.359646, 0, 0.4, 1, 1,
0.3036258, -0.56862, 3.271492, 0, 0.3921569, 1, 1,
0.3094717, -0.2569453, 0.1048631, 0, 0.3882353, 1, 1,
0.3109702, 0.01798776, 1.69911, 0, 0.3803922, 1, 1,
0.3166907, 0.3029423, 0.3983134, 0, 0.3764706, 1, 1,
0.3202311, -0.6310616, 1.645875, 0, 0.3686275, 1, 1,
0.3213938, 1.570292, 0.4456827, 0, 0.3647059, 1, 1,
0.3307433, 0.5638931, -0.485203, 0, 0.3568628, 1, 1,
0.3349288, 1.008716, 2.224055, 0, 0.3529412, 1, 1,
0.3374671, -0.5300545, 1.272558, 0, 0.345098, 1, 1,
0.3382793, -0.3729527, 2.292228, 0, 0.3411765, 1, 1,
0.3560487, 0.7999672, -1.156732, 0, 0.3333333, 1, 1,
0.3568526, 0.1310529, 1.23793, 0, 0.3294118, 1, 1,
0.3569602, -1.165119, 3.244869, 0, 0.3215686, 1, 1,
0.3621488, -0.5781233, 3.546675, 0, 0.3176471, 1, 1,
0.3621814, 0.0175391, 1.810276, 0, 0.3098039, 1, 1,
0.3645903, 1.344765, 0.08006226, 0, 0.3058824, 1, 1,
0.3647925, -0.2790008, 2.280736, 0, 0.2980392, 1, 1,
0.3655745, -0.5779346, 3.906832, 0, 0.2901961, 1, 1,
0.3665684, 0.359093, -0.4993101, 0, 0.2862745, 1, 1,
0.3807198, 1.073779, 0.281445, 0, 0.2784314, 1, 1,
0.3829093, 1.025692, -1.258911, 0, 0.2745098, 1, 1,
0.3830782, -1.019897, 3.801972, 0, 0.2666667, 1, 1,
0.3884199, 0.9438837, -0.2394742, 0, 0.2627451, 1, 1,
0.3921231, 0.04083875, -1.006523, 0, 0.254902, 1, 1,
0.3930618, -0.8703018, 2.8522, 0, 0.2509804, 1, 1,
0.3936116, 0.1004867, 2.700017, 0, 0.2431373, 1, 1,
0.3946823, -1.13343, 3.192865, 0, 0.2392157, 1, 1,
0.3983086, 0.5039905, -0.2959861, 0, 0.2313726, 1, 1,
0.3993966, 0.4287584, 0.7227876, 0, 0.227451, 1, 1,
0.400557, 0.6196008, -0.2008599, 0, 0.2196078, 1, 1,
0.401677, -0.5016817, 3.066472, 0, 0.2156863, 1, 1,
0.4097963, 1.074695, -0.4090363, 0, 0.2078431, 1, 1,
0.4105955, -0.5157063, 2.179234, 0, 0.2039216, 1, 1,
0.412776, 1.243059, 0.9902564, 0, 0.1960784, 1, 1,
0.4168817, -0.6728204, 1.204025, 0, 0.1882353, 1, 1,
0.4235534, 0.2738496, 0.9247255, 0, 0.1843137, 1, 1,
0.4252655, 0.7017673, 1.405918, 0, 0.1764706, 1, 1,
0.4276123, 0.1514045, -0.5414671, 0, 0.172549, 1, 1,
0.429691, -1.739553, 1.833033, 0, 0.1647059, 1, 1,
0.4297488, -1.472597, 1.905676, 0, 0.1607843, 1, 1,
0.4301127, 0.9891684, -0.2715134, 0, 0.1529412, 1, 1,
0.430711, -0.2712426, 2.160229, 0, 0.1490196, 1, 1,
0.4338726, 1.944492, -0.2971547, 0, 0.1411765, 1, 1,
0.4340162, 1.629384, 1.764456, 0, 0.1372549, 1, 1,
0.4377612, 0.0135467, 1.143901, 0, 0.1294118, 1, 1,
0.4426992, -1.207997, 3.476985, 0, 0.1254902, 1, 1,
0.4430053, 0.1611592, 0.03911785, 0, 0.1176471, 1, 1,
0.4467503, 0.1579215, 1.301985, 0, 0.1137255, 1, 1,
0.4510124, -1.601469, 4.061391, 0, 0.1058824, 1, 1,
0.4534797, 0.2939875, 2.666392, 0, 0.09803922, 1, 1,
0.4551761, -0.4610484, 2.242417, 0, 0.09411765, 1, 1,
0.4571056, -0.5875264, 4.394877, 0, 0.08627451, 1, 1,
0.4577583, 0.3360428, 1.006351, 0, 0.08235294, 1, 1,
0.4579133, 2.231647, 0.4669103, 0, 0.07450981, 1, 1,
0.4595985, -0.9246024, 3.937839, 0, 0.07058824, 1, 1,
0.4624684, -0.4118096, 0.4590187, 0, 0.0627451, 1, 1,
0.4671225, 0.912141, 0.2478265, 0, 0.05882353, 1, 1,
0.4719201, -0.1391296, 0.8713246, 0, 0.05098039, 1, 1,
0.4720915, -0.1115144, 1.471853, 0, 0.04705882, 1, 1,
0.474104, 0.3932829, 1.335966, 0, 0.03921569, 1, 1,
0.4770818, 1.018039, 0.2759511, 0, 0.03529412, 1, 1,
0.4773226, 0.6432694, 2.303809, 0, 0.02745098, 1, 1,
0.4821304, 0.1910955, 2.739844, 0, 0.02352941, 1, 1,
0.4825083, -0.1030418, 1.564202, 0, 0.01568628, 1, 1,
0.4843291, -0.19932, 0.9683914, 0, 0.01176471, 1, 1,
0.4857019, -0.3628482, 3.599469, 0, 0.003921569, 1, 1,
0.4883047, 0.5523916, 1.391093, 0.003921569, 0, 1, 1,
0.4889655, -4.205454, 3.209714, 0.007843138, 0, 1, 1,
0.4893087, 1.200739, -0.2454126, 0.01568628, 0, 1, 1,
0.4913777, 0.2205478, 0.5039597, 0.01960784, 0, 1, 1,
0.493892, 0.8240028, 0.7810488, 0.02745098, 0, 1, 1,
0.4941149, 0.1717251, 0.1169033, 0.03137255, 0, 1, 1,
0.4970737, -0.02392614, 1.496463, 0.03921569, 0, 1, 1,
0.4976975, -0.8565602, 2.486875, 0.04313726, 0, 1, 1,
0.4991572, 0.5147607, -0.2597871, 0.05098039, 0, 1, 1,
0.5029634, 1.285452, 1.460046, 0.05490196, 0, 1, 1,
0.5049455, 0.5701044, 2.364202, 0.0627451, 0, 1, 1,
0.5063962, -0.9914556, 2.440234, 0.06666667, 0, 1, 1,
0.5080304, 0.1906148, 4.330369, 0.07450981, 0, 1, 1,
0.5166765, 1.200032, 3.262564, 0.07843138, 0, 1, 1,
0.5168142, 0.1601172, 0.4711343, 0.08627451, 0, 1, 1,
0.5199997, 1.070781, 2.439463, 0.09019608, 0, 1, 1,
0.5239115, -1.908795, 1.649389, 0.09803922, 0, 1, 1,
0.5282887, 0.7609284, -0.2533804, 0.1058824, 0, 1, 1,
0.5289847, -1.137935, 2.209856, 0.1098039, 0, 1, 1,
0.5317155, 0.6447949, 0.1372296, 0.1176471, 0, 1, 1,
0.5343276, 0.9979271, -1.677123, 0.1215686, 0, 1, 1,
0.5365969, -1.680306, 2.275164, 0.1294118, 0, 1, 1,
0.5385358, -0.579024, 3.533872, 0.1333333, 0, 1, 1,
0.5392509, 0.7040347, 1.284107, 0.1411765, 0, 1, 1,
0.5431986, -1.48471, 2.812317, 0.145098, 0, 1, 1,
0.5457283, -0.5658129, -0.7620617, 0.1529412, 0, 1, 1,
0.5473692, -0.8655658, 2.928028, 0.1568628, 0, 1, 1,
0.5526544, -0.9681932, 2.859615, 0.1647059, 0, 1, 1,
0.560126, 1.005341, -0.3479982, 0.1686275, 0, 1, 1,
0.5601261, 0.1823097, 1.015809, 0.1764706, 0, 1, 1,
0.5660173, 0.1399956, 1.037714, 0.1803922, 0, 1, 1,
0.5691425, 1.923625, -0.7117106, 0.1882353, 0, 1, 1,
0.5691536, 0.142384, 1.309425, 0.1921569, 0, 1, 1,
0.5708227, -0.1224516, 1.71516, 0.2, 0, 1, 1,
0.5718438, 0.2633597, 0.3799284, 0.2078431, 0, 1, 1,
0.5739354, 0.1812444, 1.697724, 0.2117647, 0, 1, 1,
0.5741023, -0.3378383, 1.408705, 0.2196078, 0, 1, 1,
0.576721, -0.3045385, 0.2457892, 0.2235294, 0, 1, 1,
0.5795162, 0.4156516, -1.12215, 0.2313726, 0, 1, 1,
0.5797155, -1.180079, 2.532237, 0.2352941, 0, 1, 1,
0.5816363, -0.480348, 2.255196, 0.2431373, 0, 1, 1,
0.583208, 1.220376, 0.07604339, 0.2470588, 0, 1, 1,
0.5864459, -0.9481735, 4.12897, 0.254902, 0, 1, 1,
0.5925958, 0.4611236, 0.0368315, 0.2588235, 0, 1, 1,
0.6017599, 0.536445, -0.4967602, 0.2666667, 0, 1, 1,
0.6027911, -0.848579, 3.440085, 0.2705882, 0, 1, 1,
0.6062327, 0.6248892, 1.743702, 0.2784314, 0, 1, 1,
0.6068496, 0.7849748, 1.03776, 0.282353, 0, 1, 1,
0.6085054, -2.033415, 2.353808, 0.2901961, 0, 1, 1,
0.6088271, -0.3241434, 1.451904, 0.2941177, 0, 1, 1,
0.6107376, -0.3868184, 3.036545, 0.3019608, 0, 1, 1,
0.6118853, 0.4120459, 0.1729283, 0.3098039, 0, 1, 1,
0.6144671, -0.6249262, 1.624317, 0.3137255, 0, 1, 1,
0.6242872, -1.780203, 3.88569, 0.3215686, 0, 1, 1,
0.6267567, -0.8723393, 3.309377, 0.3254902, 0, 1, 1,
0.6315125, 0.5596126, -0.2002853, 0.3333333, 0, 1, 1,
0.637169, 0.4462741, 1.005597, 0.3372549, 0, 1, 1,
0.6389625, 0.02393086, 1.432157, 0.345098, 0, 1, 1,
0.6393977, 0.4762219, 1.714188, 0.3490196, 0, 1, 1,
0.6425645, -0.7961965, 1.828906, 0.3568628, 0, 1, 1,
0.6428164, 0.8897184, 0.2929186, 0.3607843, 0, 1, 1,
0.6442721, -0.108992, 1.755112, 0.3686275, 0, 1, 1,
0.6454567, -0.2757477, 2.907696, 0.372549, 0, 1, 1,
0.6544249, 1.190045, 0.2375645, 0.3803922, 0, 1, 1,
0.6546482, 0.3489363, 1.356301, 0.3843137, 0, 1, 1,
0.6566477, -0.09711723, 2.254162, 0.3921569, 0, 1, 1,
0.6609874, -1.137661, 2.26324, 0.3960784, 0, 1, 1,
0.661851, -0.1071847, 1.434948, 0.4039216, 0, 1, 1,
0.6647562, -0.6683617, 2.397464, 0.4117647, 0, 1, 1,
0.6653769, 0.01825818, 0.7641312, 0.4156863, 0, 1, 1,
0.6708712, -1.263613, 2.950167, 0.4235294, 0, 1, 1,
0.6735656, 0.04911842, 0.5506248, 0.427451, 0, 1, 1,
0.6766323, -0.7156662, 1.504211, 0.4352941, 0, 1, 1,
0.6776053, -0.4300035, 1.467723, 0.4392157, 0, 1, 1,
0.6847771, 0.5558439, 2.342059, 0.4470588, 0, 1, 1,
0.6850138, 1.253227, 0.7109507, 0.4509804, 0, 1, 1,
0.6866389, 1.599642, 1.507812, 0.4588235, 0, 1, 1,
0.6903089, 0.4231196, 1.365025, 0.4627451, 0, 1, 1,
0.6926561, -0.680882, 5.019948, 0.4705882, 0, 1, 1,
0.694608, 0.4299189, 2.610302, 0.4745098, 0, 1, 1,
0.6953548, -0.4429936, 2.285331, 0.4823529, 0, 1, 1,
0.6973873, -0.8760865, 1.689733, 0.4862745, 0, 1, 1,
0.699967, -0.526738, 3.209652, 0.4941176, 0, 1, 1,
0.7027559, -0.3914096, 2.838844, 0.5019608, 0, 1, 1,
0.7063118, 0.6047683, 1.238769, 0.5058824, 0, 1, 1,
0.7076471, -1.199157, 2.767365, 0.5137255, 0, 1, 1,
0.7097548, 0.2488709, 0.4581932, 0.5176471, 0, 1, 1,
0.7103897, 0.2484402, 1.714643, 0.5254902, 0, 1, 1,
0.7129279, 0.4588205, 1.422439, 0.5294118, 0, 1, 1,
0.7129914, 0.9430122, -0.4977147, 0.5372549, 0, 1, 1,
0.7204022, -1.627451, 0.6110502, 0.5411765, 0, 1, 1,
0.7236992, -0.558118, 2.204596, 0.5490196, 0, 1, 1,
0.7252103, 0.4139265, 0.2396728, 0.5529412, 0, 1, 1,
0.7272368, -1.849437, 2.813136, 0.5607843, 0, 1, 1,
0.7325446, 0.1469725, 1.717215, 0.5647059, 0, 1, 1,
0.7473699, -0.4481208, 1.85212, 0.572549, 0, 1, 1,
0.7530566, -0.4203406, 5.166789, 0.5764706, 0, 1, 1,
0.7541914, -1.548458, 3.628469, 0.5843138, 0, 1, 1,
0.7558383, -1.080907, 1.842426, 0.5882353, 0, 1, 1,
0.7564062, 0.5628335, 1.66173, 0.5960785, 0, 1, 1,
0.7571487, -1.39862, 3.50243, 0.6039216, 0, 1, 1,
0.7579688, 0.06077957, 0.6584293, 0.6078432, 0, 1, 1,
0.7606346, 0.220033, 3.464065, 0.6156863, 0, 1, 1,
0.760663, -0.4555392, 3.232031, 0.6196079, 0, 1, 1,
0.7612261, 0.4124209, 0.6675399, 0.627451, 0, 1, 1,
0.7763766, 0.7091408, 1.778133, 0.6313726, 0, 1, 1,
0.7781676, -0.5672119, 2.151476, 0.6392157, 0, 1, 1,
0.7847423, -0.03580425, 2.722534, 0.6431373, 0, 1, 1,
0.7859285, -0.5088934, 3.397213, 0.6509804, 0, 1, 1,
0.7867435, 1.23685, 1.742705, 0.654902, 0, 1, 1,
0.7886202, -0.005481807, 3.290201, 0.6627451, 0, 1, 1,
0.7894724, -0.3388195, 1.730586, 0.6666667, 0, 1, 1,
0.7956092, 1.02967, 0.861374, 0.6745098, 0, 1, 1,
0.8019068, 0.7259707, 1.504431, 0.6784314, 0, 1, 1,
0.8119282, -0.871537, 3.531589, 0.6862745, 0, 1, 1,
0.818166, -0.2991145, 0.7364547, 0.6901961, 0, 1, 1,
0.8225576, 0.226386, 0.4292291, 0.6980392, 0, 1, 1,
0.8265378, 2.060813, 1.166979, 0.7058824, 0, 1, 1,
0.8284249, -0.459347, 2.071861, 0.7098039, 0, 1, 1,
0.8286397, -0.7087317, 2.720586, 0.7176471, 0, 1, 1,
0.8334596, -0.989656, 2.865389, 0.7215686, 0, 1, 1,
0.8358974, -0.9549382, 2.213732, 0.7294118, 0, 1, 1,
0.8365419, 0.4583209, 1.211706, 0.7333333, 0, 1, 1,
0.8441315, 0.3508973, 1.129648, 0.7411765, 0, 1, 1,
0.8464921, 0.8642583, 0.7233748, 0.7450981, 0, 1, 1,
0.8518582, -0.08245423, 1.444123, 0.7529412, 0, 1, 1,
0.8525923, 0.4556459, 0.687937, 0.7568628, 0, 1, 1,
0.858303, 1.445108, 0.5832628, 0.7647059, 0, 1, 1,
0.8585427, -0.1914364, 1.807603, 0.7686275, 0, 1, 1,
0.8593022, -0.250809, 3.224394, 0.7764706, 0, 1, 1,
0.8651388, -0.2342125, 1.108323, 0.7803922, 0, 1, 1,
0.8688375, 0.8173271, -0.8336985, 0.7882353, 0, 1, 1,
0.8699659, 0.7456269, 0.5611148, 0.7921569, 0, 1, 1,
0.8707949, 1.104159, 2.785882, 0.8, 0, 1, 1,
0.8721392, -0.3008316, 0.6117249, 0.8078431, 0, 1, 1,
0.8763813, 0.9560456, -0.7486172, 0.8117647, 0, 1, 1,
0.8785516, -1.584241, 2.922142, 0.8196079, 0, 1, 1,
0.8794016, -0.1528066, 3.163333, 0.8235294, 0, 1, 1,
0.8794671, 1.045549, 0.4191303, 0.8313726, 0, 1, 1,
0.8823913, -0.3566678, 2.14828, 0.8352941, 0, 1, 1,
0.8887323, -0.1562706, 3.175455, 0.8431373, 0, 1, 1,
0.89946, -1.021398, 2.799422, 0.8470588, 0, 1, 1,
0.9023871, -1.778288, 2.54389, 0.854902, 0, 1, 1,
0.9034203, 0.1580249, -0.8093662, 0.8588235, 0, 1, 1,
0.9065453, 0.3161409, 1.91736, 0.8666667, 0, 1, 1,
0.907062, -0.2363158, 3.027186, 0.8705882, 0, 1, 1,
0.9084901, -0.1454295, 2.634666, 0.8784314, 0, 1, 1,
0.9135908, 0.9733351, 0.4515761, 0.8823529, 0, 1, 1,
0.9138136, -1.449147, 0.9596391, 0.8901961, 0, 1, 1,
0.9147173, 1.001599, -0.6980379, 0.8941177, 0, 1, 1,
0.916272, 0.3492613, 0.6813143, 0.9019608, 0, 1, 1,
0.9216922, 0.1495599, 2.605163, 0.9098039, 0, 1, 1,
0.9218606, -0.3232495, 2.150046, 0.9137255, 0, 1, 1,
0.9247506, 1.73963, 1.108297, 0.9215686, 0, 1, 1,
0.9253622, -2.11831, 3.666345, 0.9254902, 0, 1, 1,
0.9280934, 1.144257, 0.1143626, 0.9333333, 0, 1, 1,
0.9381202, 1.346323, 0.9631116, 0.9372549, 0, 1, 1,
0.9388204, -0.2827266, 3.002975, 0.945098, 0, 1, 1,
0.9409704, -0.01767988, 1.400216, 0.9490196, 0, 1, 1,
0.944194, 0.6106003, 1.62971, 0.9568627, 0, 1, 1,
0.9462101, -0.4889109, 1.473091, 0.9607843, 0, 1, 1,
0.9477315, 0.2516729, 0.5056284, 0.9686275, 0, 1, 1,
0.9477934, 1.706753, 0.5412227, 0.972549, 0, 1, 1,
0.9510117, 0.005452639, 1.358204, 0.9803922, 0, 1, 1,
0.9575052, -1.338316, 2.536552, 0.9843137, 0, 1, 1,
0.9578711, 1.651922, 0.6646235, 0.9921569, 0, 1, 1,
0.9596131, -0.4488749, 1.020045, 0.9960784, 0, 1, 1,
0.9611974, -2.165758, 0.9051099, 1, 0, 0.9960784, 1,
0.9696658, 1.078204, 0.9023693, 1, 0, 0.9882353, 1,
0.97953, -2.428033, 2.929588, 1, 0, 0.9843137, 1,
0.9905895, -1.520128, 2.821416, 1, 0, 0.9764706, 1,
0.9929019, -0.0868955, 1.405361, 1, 0, 0.972549, 1,
1.003937, 0.6838354, 0.9657948, 1, 0, 0.9647059, 1,
1.006229, -0.5682583, 1.301003, 1, 0, 0.9607843, 1,
1.008146, -2.407632, 4.365377, 1, 0, 0.9529412, 1,
1.010913, 1.285814, 0.571272, 1, 0, 0.9490196, 1,
1.012011, 1.090325, -0.8058816, 1, 0, 0.9411765, 1,
1.015154, -1.521314, 3.836402, 1, 0, 0.9372549, 1,
1.021172, -1.160718, 2.915694, 1, 0, 0.9294118, 1,
1.024094, 0.2927939, 1.904818, 1, 0, 0.9254902, 1,
1.025176, 0.5292082, -0.1612114, 1, 0, 0.9176471, 1,
1.029392, -0.3305034, 3.694806, 1, 0, 0.9137255, 1,
1.039279, -1.134681, 0.8649154, 1, 0, 0.9058824, 1,
1.039723, 0.7159759, 3.623253, 1, 0, 0.9019608, 1,
1.040276, -0.4998973, 0.8469409, 1, 0, 0.8941177, 1,
1.043177, -0.5606116, 1.039825, 1, 0, 0.8862745, 1,
1.043321, -0.02080206, 2.028563, 1, 0, 0.8823529, 1,
1.046892, 0.3910206, 3.038498, 1, 0, 0.8745098, 1,
1.047607, -1.465198, 2.874039, 1, 0, 0.8705882, 1,
1.050549, -0.703557, 1.72235, 1, 0, 0.8627451, 1,
1.057501, 0.1064813, 0.9461068, 1, 0, 0.8588235, 1,
1.071715, 1.301711, -0.1945764, 1, 0, 0.8509804, 1,
1.074538, 0.7557619, 0.6288823, 1, 0, 0.8470588, 1,
1.090669, -0.6451577, 1.195175, 1, 0, 0.8392157, 1,
1.100965, -1.959903, 3.989179, 1, 0, 0.8352941, 1,
1.107007, 0.111607, 1.337648, 1, 0, 0.827451, 1,
1.110292, 0.7395436, 1.251064, 1, 0, 0.8235294, 1,
1.111063, -1.268468, 1.288013, 1, 0, 0.8156863, 1,
1.114043, -0.2661759, 2.685007, 1, 0, 0.8117647, 1,
1.114403, 0.3326779, -0.1271978, 1, 0, 0.8039216, 1,
1.114873, -0.2922915, 1.390074, 1, 0, 0.7960784, 1,
1.128419, 0.1481334, 1.752871, 1, 0, 0.7921569, 1,
1.131145, -1.660274, 3.413531, 1, 0, 0.7843137, 1,
1.135682, -0.3845259, 1.848371, 1, 0, 0.7803922, 1,
1.135996, -0.7400655, 3.454091, 1, 0, 0.772549, 1,
1.137982, 0.4473166, 3.038662, 1, 0, 0.7686275, 1,
1.140973, 0.522849, 1.8332, 1, 0, 0.7607843, 1,
1.142014, 0.5953988, 1.774774, 1, 0, 0.7568628, 1,
1.143247, -0.7852523, 2.259994, 1, 0, 0.7490196, 1,
1.144014, -0.6208352, 1.871184, 1, 0, 0.7450981, 1,
1.144386, 0.5980477, 2.588936, 1, 0, 0.7372549, 1,
1.147319, -0.2105384, -0.6927205, 1, 0, 0.7333333, 1,
1.151855, 0.9440421, -1.300912, 1, 0, 0.7254902, 1,
1.156343, 0.3803912, 1.436267, 1, 0, 0.7215686, 1,
1.156537, -0.6940386, 2.348852, 1, 0, 0.7137255, 1,
1.156894, 0.6674588, 0.1033051, 1, 0, 0.7098039, 1,
1.172433, 1.347847, 1.545888, 1, 0, 0.7019608, 1,
1.172583, 1.18443, 0.6958677, 1, 0, 0.6941177, 1,
1.17352, 0.7425206, 0.177542, 1, 0, 0.6901961, 1,
1.174256, 0.6431763, 0.4969172, 1, 0, 0.682353, 1,
1.180315, -1.47493, 3.685802, 1, 0, 0.6784314, 1,
1.185563, -2.439068, 3.215158, 1, 0, 0.6705883, 1,
1.193537, -0.3919155, 4.768553, 1, 0, 0.6666667, 1,
1.193704, 0.5371462, 0.7091542, 1, 0, 0.6588235, 1,
1.195124, 0.3196932, 1.385069, 1, 0, 0.654902, 1,
1.2005, -0.5332094, 0.4170963, 1, 0, 0.6470588, 1,
1.212157, 1.705953, 1.997068, 1, 0, 0.6431373, 1,
1.233064, 0.1667664, 2.97384, 1, 0, 0.6352941, 1,
1.240074, -1.06828, 1.572182, 1, 0, 0.6313726, 1,
1.240736, -0.3249631, 1.86412, 1, 0, 0.6235294, 1,
1.241508, -0.5077915, 1.680963, 1, 0, 0.6196079, 1,
1.2453, -0.1537016, 0.3236208, 1, 0, 0.6117647, 1,
1.245396, -0.2240013, 2.910744, 1, 0, 0.6078432, 1,
1.247147, 2.469859, -0.1397981, 1, 0, 0.6, 1,
1.258361, 0.04521835, 2.25274, 1, 0, 0.5921569, 1,
1.261555, -0.9175898, 2.639294, 1, 0, 0.5882353, 1,
1.265717, 0.4628942, 2.680999, 1, 0, 0.5803922, 1,
1.267881, 0.0908171, 0.7954888, 1, 0, 0.5764706, 1,
1.278978, -1.700401, 2.931623, 1, 0, 0.5686275, 1,
1.283924, -0.4076312, 2.344988, 1, 0, 0.5647059, 1,
1.284231, -0.2738596, 2.134047, 1, 0, 0.5568628, 1,
1.284565, 0.837315, 2.151362, 1, 0, 0.5529412, 1,
1.315047, 0.3824894, 0.1672835, 1, 0, 0.5450981, 1,
1.318036, -0.0577617, 1.150907, 1, 0, 0.5411765, 1,
1.318504, -0.2717218, 2.341211, 1, 0, 0.5333334, 1,
1.329074, -0.3479368, 1.425777, 1, 0, 0.5294118, 1,
1.331935, 0.04552365, 0.1977633, 1, 0, 0.5215687, 1,
1.338784, 1.163378, 0.9802905, 1, 0, 0.5176471, 1,
1.340461, 0.7337552, 0.9613659, 1, 0, 0.509804, 1,
1.348137, 0.1847632, 2.638918, 1, 0, 0.5058824, 1,
1.352546, -2.488809, 2.835836, 1, 0, 0.4980392, 1,
1.35455, -0.4900551, 0.934387, 1, 0, 0.4901961, 1,
1.364927, -0.5839937, 2.687683, 1, 0, 0.4862745, 1,
1.366779, -0.7225493, 3.467804, 1, 0, 0.4784314, 1,
1.368626, 1.626914, 0.5669354, 1, 0, 0.4745098, 1,
1.370656, 1.020275, 1.205912, 1, 0, 0.4666667, 1,
1.379955, -0.3340448, 1.351743, 1, 0, 0.4627451, 1,
1.403812, 0.5911654, 0.7103338, 1, 0, 0.454902, 1,
1.418097, -0.7939897, 2.984378, 1, 0, 0.4509804, 1,
1.421382, 0.3000315, 2.696692, 1, 0, 0.4431373, 1,
1.425987, 0.09596666, -0.2745853, 1, 0, 0.4392157, 1,
1.442112, -0.9271245, 3.849245, 1, 0, 0.4313726, 1,
1.442452, 0.3967351, 0.7151993, 1, 0, 0.427451, 1,
1.450557, 0.9031954, 1.999364, 1, 0, 0.4196078, 1,
1.462512, -0.59679, 2.372913, 1, 0, 0.4156863, 1,
1.463358, -0.2996547, 0.8764035, 1, 0, 0.4078431, 1,
1.467406, -1.267549, 2.371548, 1, 0, 0.4039216, 1,
1.472428, -0.5758753, 1.674207, 1, 0, 0.3960784, 1,
1.487401, 1.662366, 1.799907, 1, 0, 0.3882353, 1,
1.488274, -0.195873, 1.23695, 1, 0, 0.3843137, 1,
1.500672, 0.04201148, 0.5428468, 1, 0, 0.3764706, 1,
1.517181, 0.8105132, 1.13891, 1, 0, 0.372549, 1,
1.517626, -1.007469, 1.922387, 1, 0, 0.3647059, 1,
1.548987, 1.592152, 2.030186, 1, 0, 0.3607843, 1,
1.552064, -0.411348, 1.802028, 1, 0, 0.3529412, 1,
1.562891, -0.4522837, 2.737151, 1, 0, 0.3490196, 1,
1.564144, 0.6571454, 1.386758, 1, 0, 0.3411765, 1,
1.58035, 0.9257439, 2.079055, 1, 0, 0.3372549, 1,
1.587899, -2.120959, 3.747632, 1, 0, 0.3294118, 1,
1.597856, 0.3133099, 2.996836, 1, 0, 0.3254902, 1,
1.598589, -0.9475376, 1.356676, 1, 0, 0.3176471, 1,
1.612803, -0.03093689, 2.37938, 1, 0, 0.3137255, 1,
1.621788, -0.3249232, 0.5188147, 1, 0, 0.3058824, 1,
1.623178, 0.5157486, 0.900487, 1, 0, 0.2980392, 1,
1.631026, -0.8974177, 3.499632, 1, 0, 0.2941177, 1,
1.640681, -1.240396, 1.61973, 1, 0, 0.2862745, 1,
1.679923, -0.4381066, 0.296994, 1, 0, 0.282353, 1,
1.692149, -0.5430379, 2.524843, 1, 0, 0.2745098, 1,
1.716028, -0.06038674, 2.824415, 1, 0, 0.2705882, 1,
1.71926, -1.164556, 2.757737, 1, 0, 0.2627451, 1,
1.724695, -1.221695, 3.156696, 1, 0, 0.2588235, 1,
1.747599, 1.288509, 0.38993, 1, 0, 0.2509804, 1,
1.771457, -0.07039303, 2.195035, 1, 0, 0.2470588, 1,
1.813044, 0.9696836, 0.04219542, 1, 0, 0.2392157, 1,
1.815649, -0.007163362, 0.9156255, 1, 0, 0.2352941, 1,
1.816125, 0.06694265, -0.2190743, 1, 0, 0.227451, 1,
1.838178, -0.5771688, 2.07056, 1, 0, 0.2235294, 1,
1.846746, 0.06775887, 0.9200847, 1, 0, 0.2156863, 1,
1.853681, 1.140994, 0.1618224, 1, 0, 0.2117647, 1,
1.854519, 2.206872, 1.351422, 1, 0, 0.2039216, 1,
1.862694, -0.500529, 1.689295, 1, 0, 0.1960784, 1,
1.864312, -0.2376237, 1.362775, 1, 0, 0.1921569, 1,
1.874623, 0.7661771, -0.0198079, 1, 0, 0.1843137, 1,
1.87847, 1.522238, 0.8840392, 1, 0, 0.1803922, 1,
1.878594, -0.01982916, 0.6107056, 1, 0, 0.172549, 1,
1.890246, -0.3051217, 1.742992, 1, 0, 0.1686275, 1,
1.902938, -0.5207641, 2.19357, 1, 0, 0.1607843, 1,
1.917304, 0.9834683, 1.367629, 1, 0, 0.1568628, 1,
1.951433, 1.072762, -0.6222712, 1, 0, 0.1490196, 1,
1.969247, 0.4994633, 1.767048, 1, 0, 0.145098, 1,
1.978595, 0.1191106, 1.927437, 1, 0, 0.1372549, 1,
1.992698, -1.10695, 2.442655, 1, 0, 0.1333333, 1,
2.012509, 0.3933716, 0.248178, 1, 0, 0.1254902, 1,
2.015244, 0.6627469, 2.14601, 1, 0, 0.1215686, 1,
2.028515, -0.7233734, 0.8211018, 1, 0, 0.1137255, 1,
2.08023, -0.09911431, 1.086197, 1, 0, 0.1098039, 1,
2.101963, 0.3504598, 0.6525942, 1, 0, 0.1019608, 1,
2.118859, -0.4396813, 1.360901, 1, 0, 0.09411765, 1,
2.198568, -0.4568114, 0.9629014, 1, 0, 0.09019608, 1,
2.240899, -0.1919534, 2.027431, 1, 0, 0.08235294, 1,
2.283147, 0.3623411, 2.287902, 1, 0, 0.07843138, 1,
2.341212, -1.327012, 1.012843, 1, 0, 0.07058824, 1,
2.342089, 0.2462288, 1.528582, 1, 0, 0.06666667, 1,
2.366415, 1.000755, -0.4601132, 1, 0, 0.05882353, 1,
2.436451, -0.2451586, 2.231227, 1, 0, 0.05490196, 1,
2.480468, -1.534031, 3.351564, 1, 0, 0.04705882, 1,
2.486451, 1.04418, 0.9508768, 1, 0, 0.04313726, 1,
2.541447, -1.250967, 1.693633, 1, 0, 0.03529412, 1,
2.550169, 0.867696, 1.028741, 1, 0, 0.03137255, 1,
2.743499, 1.539557, 0.9900333, 1, 0, 0.02352941, 1,
2.837321, 1.421774, 1.285891, 1, 0, 0.01960784, 1,
2.916608, 0.9602633, 0.1307053, 1, 0, 0.01176471, 1,
3.019728, -0.2066755, 2.550523, 1, 0, 0.007843138, 1
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
-0.006778121, -5.478488, -8.117931, 0, -0.5, 0.5, 0.5,
-0.006778121, -5.478488, -8.117931, 1, -0.5, 0.5, 0.5,
-0.006778121, -5.478488, -8.117931, 1, 1.5, 0.5, 0.5,
-0.006778121, -5.478488, -8.117931, 0, 1.5, 0.5, 0.5
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
-4.05927, -0.4501896, -8.117931, 0, -0.5, 0.5, 0.5,
-4.05927, -0.4501896, -8.117931, 1, -0.5, 0.5, 0.5,
-4.05927, -0.4501896, -8.117931, 1, 1.5, 0.5, 0.5,
-4.05927, -0.4501896, -8.117931, 0, 1.5, 0.5, 0.5
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
-4.05927, -5.478488, -0.2705338, 0, -0.5, 0.5, 0.5,
-4.05927, -5.478488, -0.2705338, 1, -0.5, 0.5, 0.5,
-4.05927, -5.478488, -0.2705338, 1, 1.5, 0.5, 0.5,
-4.05927, -5.478488, -0.2705338, 0, 1.5, 0.5, 0.5
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
-3, -4.318112, -6.306993,
3, -4.318112, -6.306993,
-3, -4.318112, -6.306993,
-3, -4.511508, -6.608816,
-2, -4.318112, -6.306993,
-2, -4.511508, -6.608816,
-1, -4.318112, -6.306993,
-1, -4.511508, -6.608816,
0, -4.318112, -6.306993,
0, -4.511508, -6.608816,
1, -4.318112, -6.306993,
1, -4.511508, -6.608816,
2, -4.318112, -6.306993,
2, -4.511508, -6.608816,
3, -4.318112, -6.306993,
3, -4.511508, -6.608816
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
-3, -4.8983, -7.212462, 0, -0.5, 0.5, 0.5,
-3, -4.8983, -7.212462, 1, -0.5, 0.5, 0.5,
-3, -4.8983, -7.212462, 1, 1.5, 0.5, 0.5,
-3, -4.8983, -7.212462, 0, 1.5, 0.5, 0.5,
-2, -4.8983, -7.212462, 0, -0.5, 0.5, 0.5,
-2, -4.8983, -7.212462, 1, -0.5, 0.5, 0.5,
-2, -4.8983, -7.212462, 1, 1.5, 0.5, 0.5,
-2, -4.8983, -7.212462, 0, 1.5, 0.5, 0.5,
-1, -4.8983, -7.212462, 0, -0.5, 0.5, 0.5,
-1, -4.8983, -7.212462, 1, -0.5, 0.5, 0.5,
-1, -4.8983, -7.212462, 1, 1.5, 0.5, 0.5,
-1, -4.8983, -7.212462, 0, 1.5, 0.5, 0.5,
0, -4.8983, -7.212462, 0, -0.5, 0.5, 0.5,
0, -4.8983, -7.212462, 1, -0.5, 0.5, 0.5,
0, -4.8983, -7.212462, 1, 1.5, 0.5, 0.5,
0, -4.8983, -7.212462, 0, 1.5, 0.5, 0.5,
1, -4.8983, -7.212462, 0, -0.5, 0.5, 0.5,
1, -4.8983, -7.212462, 1, -0.5, 0.5, 0.5,
1, -4.8983, -7.212462, 1, 1.5, 0.5, 0.5,
1, -4.8983, -7.212462, 0, 1.5, 0.5, 0.5,
2, -4.8983, -7.212462, 0, -0.5, 0.5, 0.5,
2, -4.8983, -7.212462, 1, -0.5, 0.5, 0.5,
2, -4.8983, -7.212462, 1, 1.5, 0.5, 0.5,
2, -4.8983, -7.212462, 0, 1.5, 0.5, 0.5,
3, -4.8983, -7.212462, 0, -0.5, 0.5, 0.5,
3, -4.8983, -7.212462, 1, -0.5, 0.5, 0.5,
3, -4.8983, -7.212462, 1, 1.5, 0.5, 0.5,
3, -4.8983, -7.212462, 0, 1.5, 0.5, 0.5
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
-3.12408, -4, -6.306993,
-3.12408, 2, -6.306993,
-3.12408, -4, -6.306993,
-3.279945, -4, -6.608816,
-3.12408, -2, -6.306993,
-3.279945, -2, -6.608816,
-3.12408, 0, -6.306993,
-3.279945, 0, -6.608816,
-3.12408, 2, -6.306993,
-3.279945, 2, -6.608816
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
"-4",
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
-3.591675, -4, -7.212462, 0, -0.5, 0.5, 0.5,
-3.591675, -4, -7.212462, 1, -0.5, 0.5, 0.5,
-3.591675, -4, -7.212462, 1, 1.5, 0.5, 0.5,
-3.591675, -4, -7.212462, 0, 1.5, 0.5, 0.5,
-3.591675, -2, -7.212462, 0, -0.5, 0.5, 0.5,
-3.591675, -2, -7.212462, 1, -0.5, 0.5, 0.5,
-3.591675, -2, -7.212462, 1, 1.5, 0.5, 0.5,
-3.591675, -2, -7.212462, 0, 1.5, 0.5, 0.5,
-3.591675, 0, -7.212462, 0, -0.5, 0.5, 0.5,
-3.591675, 0, -7.212462, 1, -0.5, 0.5, 0.5,
-3.591675, 0, -7.212462, 1, 1.5, 0.5, 0.5,
-3.591675, 0, -7.212462, 0, 1.5, 0.5, 0.5,
-3.591675, 2, -7.212462, 0, -0.5, 0.5, 0.5,
-3.591675, 2, -7.212462, 1, -0.5, 0.5, 0.5,
-3.591675, 2, -7.212462, 1, 1.5, 0.5, 0.5,
-3.591675, 2, -7.212462, 0, 1.5, 0.5, 0.5
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
-3.12408, -4.318112, -6,
-3.12408, -4.318112, 4,
-3.12408, -4.318112, -6,
-3.279945, -4.511508, -6,
-3.12408, -4.318112, -4,
-3.279945, -4.511508, -4,
-3.12408, -4.318112, -2,
-3.279945, -4.511508, -2,
-3.12408, -4.318112, 0,
-3.279945, -4.511508, 0,
-3.12408, -4.318112, 2,
-3.279945, -4.511508, 2,
-3.12408, -4.318112, 4,
-3.279945, -4.511508, 4
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
-3.591675, -4.8983, -6, 0, -0.5, 0.5, 0.5,
-3.591675, -4.8983, -6, 1, -0.5, 0.5, 0.5,
-3.591675, -4.8983, -6, 1, 1.5, 0.5, 0.5,
-3.591675, -4.8983, -6, 0, 1.5, 0.5, 0.5,
-3.591675, -4.8983, -4, 0, -0.5, 0.5, 0.5,
-3.591675, -4.8983, -4, 1, -0.5, 0.5, 0.5,
-3.591675, -4.8983, -4, 1, 1.5, 0.5, 0.5,
-3.591675, -4.8983, -4, 0, 1.5, 0.5, 0.5,
-3.591675, -4.8983, -2, 0, -0.5, 0.5, 0.5,
-3.591675, -4.8983, -2, 1, -0.5, 0.5, 0.5,
-3.591675, -4.8983, -2, 1, 1.5, 0.5, 0.5,
-3.591675, -4.8983, -2, 0, 1.5, 0.5, 0.5,
-3.591675, -4.8983, 0, 0, -0.5, 0.5, 0.5,
-3.591675, -4.8983, 0, 1, -0.5, 0.5, 0.5,
-3.591675, -4.8983, 0, 1, 1.5, 0.5, 0.5,
-3.591675, -4.8983, 0, 0, 1.5, 0.5, 0.5,
-3.591675, -4.8983, 2, 0, -0.5, 0.5, 0.5,
-3.591675, -4.8983, 2, 1, -0.5, 0.5, 0.5,
-3.591675, -4.8983, 2, 1, 1.5, 0.5, 0.5,
-3.591675, -4.8983, 2, 0, 1.5, 0.5, 0.5,
-3.591675, -4.8983, 4, 0, -0.5, 0.5, 0.5,
-3.591675, -4.8983, 4, 1, -0.5, 0.5, 0.5,
-3.591675, -4.8983, 4, 1, 1.5, 0.5, 0.5,
-3.591675, -4.8983, 4, 0, 1.5, 0.5, 0.5
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
-3.12408, -4.318112, -6.306993,
-3.12408, 3.417733, -6.306993,
-3.12408, -4.318112, 5.765926,
-3.12408, 3.417733, 5.765926,
-3.12408, -4.318112, -6.306993,
-3.12408, -4.318112, 5.765926,
-3.12408, 3.417733, -6.306993,
-3.12408, 3.417733, 5.765926,
-3.12408, -4.318112, -6.306993,
3.110524, -4.318112, -6.306993,
-3.12408, -4.318112, 5.765926,
3.110524, -4.318112, 5.765926,
-3.12408, 3.417733, -6.306993,
3.110524, 3.417733, -6.306993,
-3.12408, 3.417733, 5.765926,
3.110524, 3.417733, 5.765926,
3.110524, -4.318112, -6.306993,
3.110524, 3.417733, -6.306993,
3.110524, -4.318112, 5.765926,
3.110524, 3.417733, 5.765926,
3.110524, -4.318112, -6.306993,
3.110524, -4.318112, 5.765926,
3.110524, 3.417733, -6.306993,
3.110524, 3.417733, 5.765926
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
var radius = 8.349055;
var distance = 37.14589;
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
mvMatrix.translate( 0.006778121, 0.4501896, 0.2705338 );
mvMatrix.scale( 1.447913, 1.166927, 0.7477199 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.14589);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
terbutryn<-read.table("terbutryn.xyz")
```

```
## Error in read.table("terbutryn.xyz"): no lines available in input
```

```r
x<-terbutryn$V2
```

```
## Error in eval(expr, envir, enclos): object 'terbutryn' not found
```

```r
y<-terbutryn$V3
```

```
## Error in eval(expr, envir, enclos): object 'terbutryn' not found
```

```r
z<-terbutryn$V4
```

```
## Error in eval(expr, envir, enclos): object 'terbutryn' not found
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
-3.033285, -0.5553361, -1.772352, 0, 0, 1, 1, 1,
-2.652705, 0.2253174, -0.2276373, 1, 0, 0, 1, 1,
-2.594555, 0.3096373, -3.392228, 1, 0, 0, 1, 1,
-2.565048, -0.8786977, -2.914743, 1, 0, 0, 1, 1,
-2.487275, 0.8312383, -0.5889698, 1, 0, 0, 1, 1,
-2.423294, 0.2430974, -1.23193, 1, 0, 0, 1, 1,
-2.375669, -1.234483, -0.780441, 0, 0, 0, 1, 1,
-2.344716, 0.697802, -1.455297, 0, 0, 0, 1, 1,
-2.332793, 0.1696779, -1.819464, 0, 0, 0, 1, 1,
-2.329515, -0.09083643, -3.919709, 0, 0, 0, 1, 1,
-2.32941, -0.1773511, -2.442168, 0, 0, 0, 1, 1,
-2.256699, 0.574146, -2.744202, 0, 0, 0, 1, 1,
-2.241091, -0.9495454, -2.546391, 0, 0, 0, 1, 1,
-2.239217, 0.1413473, -0.7223201, 1, 1, 1, 1, 1,
-2.162618, -0.8573556, -2.659216, 1, 1, 1, 1, 1,
-2.160727, -0.04714624, -2.255847, 1, 1, 1, 1, 1,
-2.112121, -0.08961007, 0.03013149, 1, 1, 1, 1, 1,
-2.050175, 0.5832428, -1.16897, 1, 1, 1, 1, 1,
-2.049741, 0.3094372, -1.98478, 1, 1, 1, 1, 1,
-2.048623, 0.9304613, -2.062262, 1, 1, 1, 1, 1,
-2.041308, 1.703705, 1.008805, 1, 1, 1, 1, 1,
-2.040053, -0.4362296, -2.977454, 1, 1, 1, 1, 1,
-2.001463, 1.160534, -1.577585, 1, 1, 1, 1, 1,
-1.973822, 0.5781125, -1.914264, 1, 1, 1, 1, 1,
-1.953711, 1.274202, -0.8543551, 1, 1, 1, 1, 1,
-1.924196, 0.0291368, -2.912097, 1, 1, 1, 1, 1,
-1.902371, -0.4741991, -0.8788996, 1, 1, 1, 1, 1,
-1.896169, 0.07453712, -1.194603, 1, 1, 1, 1, 1,
-1.875114, -2.099224, -2.398291, 0, 0, 1, 1, 1,
-1.866655, 1.159564, -1.70645, 1, 0, 0, 1, 1,
-1.865969, 0.9204807, -1.577084, 1, 0, 0, 1, 1,
-1.853994, -1.262368, -3.479699, 1, 0, 0, 1, 1,
-1.849978, 0.7336138, -2.394296, 1, 0, 0, 1, 1,
-1.844127, -0.7346469, -0.5936949, 1, 0, 0, 1, 1,
-1.80509, 0.859759, -0.9169376, 0, 0, 0, 1, 1,
-1.794305, -1.66305, -1.522385, 0, 0, 0, 1, 1,
-1.727545, -0.6117824, -2.491011, 0, 0, 0, 1, 1,
-1.698356, 0.1843429, -1.105758, 0, 0, 0, 1, 1,
-1.69591, 0.3256873, -2.137307, 0, 0, 0, 1, 1,
-1.68587, -0.0580742, -2.546788, 0, 0, 0, 1, 1,
-1.663169, 1.6335, 0.3971326, 0, 0, 0, 1, 1,
-1.660393, -2.415308, -3.2704, 1, 1, 1, 1, 1,
-1.660381, -1.682635, 0.1575442, 1, 1, 1, 1, 1,
-1.636448, -0.7343999, -1.251018, 1, 1, 1, 1, 1,
-1.6152, 0.6795489, -0.8713663, 1, 1, 1, 1, 1,
-1.594324, -0.9440011, -2.361221, 1, 1, 1, 1, 1,
-1.589804, -0.6644492, -3.305966, 1, 1, 1, 1, 1,
-1.587008, -1.230025, -0.6485018, 1, 1, 1, 1, 1,
-1.586138, -0.5197492, -1.758738, 1, 1, 1, 1, 1,
-1.564191, -1.398899, -2.176604, 1, 1, 1, 1, 1,
-1.551467, -1.423191, -3.518138, 1, 1, 1, 1, 1,
-1.549653, -1.281201, -0.9860043, 1, 1, 1, 1, 1,
-1.528411, 0.3070596, -2.086597, 1, 1, 1, 1, 1,
-1.522594, -0.5279838, -2.350162, 1, 1, 1, 1, 1,
-1.513419, -0.9703516, -1.457452, 1, 1, 1, 1, 1,
-1.512277, -1.633384, -3.772069, 1, 1, 1, 1, 1,
-1.50488, -0.6192252, -1.950575, 0, 0, 1, 1, 1,
-1.503136, 0.929708, 0.1484491, 1, 0, 0, 1, 1,
-1.48571, 0.1594622, -1.049271, 1, 0, 0, 1, 1,
-1.475555, 1.125445, -0.9057437, 1, 0, 0, 1, 1,
-1.472734, 0.769059, 0.3562888, 1, 0, 0, 1, 1,
-1.46222, 1.768681, -1.7607, 1, 0, 0, 1, 1,
-1.449066, 0.09998827, -1.839135, 0, 0, 0, 1, 1,
-1.448774, 1.577903, -0.7501077, 0, 0, 0, 1, 1,
-1.432339, -0.2341017, -3.106272, 0, 0, 0, 1, 1,
-1.428551, 1.490203, 0.1412778, 0, 0, 0, 1, 1,
-1.424405, 0.2698593, -2.239047, 0, 0, 0, 1, 1,
-1.393134, 0.3719762, -1.170134, 0, 0, 0, 1, 1,
-1.383821, 0.2478505, -0.4556029, 0, 0, 0, 1, 1,
-1.379102, -0.2537498, -1.120616, 1, 1, 1, 1, 1,
-1.355993, 0.5751265, -1.913808, 1, 1, 1, 1, 1,
-1.355965, 0.007965497, -1.596147, 1, 1, 1, 1, 1,
-1.354173, -0.02742232, -1.940775, 1, 1, 1, 1, 1,
-1.352851, 1.390555, 0.02968966, 1, 1, 1, 1, 1,
-1.344738, 0.2154532, -2.639417, 1, 1, 1, 1, 1,
-1.338405, -0.5327682, -1.585334, 1, 1, 1, 1, 1,
-1.334099, 0.4696188, -3.185378, 1, 1, 1, 1, 1,
-1.326419, 0.3004769, -1.331171, 1, 1, 1, 1, 1,
-1.323537, 1.495149, -1.952847, 1, 1, 1, 1, 1,
-1.315909, 0.01018593, -1.543949, 1, 1, 1, 1, 1,
-1.313938, -0.7011541, -0.9502748, 1, 1, 1, 1, 1,
-1.303055, 1.910352, -2.254456, 1, 1, 1, 1, 1,
-1.303015, -0.6532184, -2.945695, 1, 1, 1, 1, 1,
-1.297324, 0.03891451, -1.154708, 1, 1, 1, 1, 1,
-1.29291, 1.112776, -2.349088, 0, 0, 1, 1, 1,
-1.29198, -0.9165135, -1.633503, 1, 0, 0, 1, 1,
-1.281385, -1.250639, -4.934712, 1, 0, 0, 1, 1,
-1.269563, 0.7621547, -1.666626, 1, 0, 0, 1, 1,
-1.263633, 0.9213644, -1.172717, 1, 0, 0, 1, 1,
-1.252304, -0.0859905, -2.111621, 1, 0, 0, 1, 1,
-1.247173, -1.574305, -1.726455, 0, 0, 0, 1, 1,
-1.246486, -0.7622555, -0.02932689, 0, 0, 0, 1, 1,
-1.239458, -0.4517127, -0.5485135, 0, 0, 0, 1, 1,
-1.232136, -0.8567173, -2.413784, 0, 0, 0, 1, 1,
-1.230073, -2.071035, -1.901029, 0, 0, 0, 1, 1,
-1.22712, -0.560116, -2.577322, 0, 0, 0, 1, 1,
-1.223154, 0.2747537, 0.2854201, 0, 0, 0, 1, 1,
-1.221034, 0.9319376, 0.2648323, 1, 1, 1, 1, 1,
-1.218124, 1.908589, 1.220866, 1, 1, 1, 1, 1,
-1.216493, 1.837355, -0.3291602, 1, 1, 1, 1, 1,
-1.215714, -0.5771811, -2.862004, 1, 1, 1, 1, 1,
-1.21449, -0.354833, -1.56248, 1, 1, 1, 1, 1,
-1.21445, -1.394273, -1.848515, 1, 1, 1, 1, 1,
-1.212263, 0.3322068, -1.57298, 1, 1, 1, 1, 1,
-1.21116, 0.08456553, -2.364238, 1, 1, 1, 1, 1,
-1.205902, 0.4868263, 0.303642, 1, 1, 1, 1, 1,
-1.204938, 0.02939454, -1.835456, 1, 1, 1, 1, 1,
-1.202757, -0.3086326, -2.580176, 1, 1, 1, 1, 1,
-1.201652, -1.260958, -2.436981, 1, 1, 1, 1, 1,
-1.199911, -1.071471, -4.236246, 1, 1, 1, 1, 1,
-1.189423, 0.3148806, -1.301988, 1, 1, 1, 1, 1,
-1.188351, -0.5274429, -2.530388, 1, 1, 1, 1, 1,
-1.188023, -1.167378, -2.020722, 0, 0, 1, 1, 1,
-1.186978, 1.069746, -1.298209, 1, 0, 0, 1, 1,
-1.186282, 0.3493302, -2.597441, 1, 0, 0, 1, 1,
-1.184323, 1.542951, -0.9880974, 1, 0, 0, 1, 1,
-1.173595, 0.01416622, -2.488476, 1, 0, 0, 1, 1,
-1.171518, -1.233628, -3.116404, 1, 0, 0, 1, 1,
-1.170519, -0.1638555, -2.26654, 0, 0, 0, 1, 1,
-1.168119, -0.977237, -1.626004, 0, 0, 0, 1, 1,
-1.166109, -1.641383, -2.251757, 0, 0, 0, 1, 1,
-1.163247, 0.9874504, -0.1842444, 0, 0, 0, 1, 1,
-1.160427, 0.423437, -1.361322, 0, 0, 0, 1, 1,
-1.159683, -0.1223789, -1.738095, 0, 0, 0, 1, 1,
-1.158553, -0.7659739, -1.745882, 0, 0, 0, 1, 1,
-1.142456, -1.813377, -3.722082, 1, 1, 1, 1, 1,
-1.140994, 0.3247268, -0.3653686, 1, 1, 1, 1, 1,
-1.139113, -1.71309, -6.131174, 1, 1, 1, 1, 1,
-1.137907, 0.8210895, -0.5281733, 1, 1, 1, 1, 1,
-1.13526, 0.6485808, -1.321762, 1, 1, 1, 1, 1,
-1.133944, 0.02857404, -2.066791, 1, 1, 1, 1, 1,
-1.130733, 0.4377967, -1.437785, 1, 1, 1, 1, 1,
-1.123608, -0.7061963, -0.5926812, 1, 1, 1, 1, 1,
-1.121951, 0.2961778, -0.4592687, 1, 1, 1, 1, 1,
-1.120075, -0.463639, -1.769659, 1, 1, 1, 1, 1,
-1.114594, -0.06829323, -0.8736555, 1, 1, 1, 1, 1,
-1.114494, -0.09404894, -2.915409, 1, 1, 1, 1, 1,
-1.101718, 0.123035, -1.127043, 1, 1, 1, 1, 1,
-1.10171, -0.1520581, -0.7048775, 1, 1, 1, 1, 1,
-1.098201, -0.4586168, -1.637155, 1, 1, 1, 1, 1,
-1.095257, -0.3629866, -1.75095, 0, 0, 1, 1, 1,
-1.091313, -1.350122, -3.229057, 1, 0, 0, 1, 1,
-1.08978, -0.6146503, -2.936877, 1, 0, 0, 1, 1,
-1.078257, -0.339483, -1.867386, 1, 0, 0, 1, 1,
-1.077683, 2.278829, -0.1314422, 1, 0, 0, 1, 1,
-1.07445, -0.1986606, -2.541696, 1, 0, 0, 1, 1,
-1.071937, -0.9255921, -2.584257, 0, 0, 0, 1, 1,
-1.070745, 0.5370656, -1.44243, 0, 0, 0, 1, 1,
-1.067125, 0.7432432, -2.860955, 0, 0, 0, 1, 1,
-1.052464, 1.764373, -0.9566141, 0, 0, 0, 1, 1,
-1.042587, -0.1820062, -1.442237, 0, 0, 0, 1, 1,
-1.035243, -2.272186, -1.804724, 0, 0, 0, 1, 1,
-1.031472, -0.3679604, -1.714561, 0, 0, 0, 1, 1,
-1.031147, -0.721607, -3.179485, 1, 1, 1, 1, 1,
-1.026223, -0.9062678, -4.190473, 1, 1, 1, 1, 1,
-1.025121, 0.1258647, -2.064083, 1, 1, 1, 1, 1,
-1.015724, -1.725858, -4.438214, 1, 1, 1, 1, 1,
-1.015707, 1.495551, 0.5486151, 1, 1, 1, 1, 1,
-1.014904, -0.03002873, -0.8937201, 1, 1, 1, 1, 1,
-1.012472, 1.445302, -1.215394, 1, 1, 1, 1, 1,
-1.000562, 1.113982, -0.7608941, 1, 1, 1, 1, 1,
-1.00006, 0.3534872, -1.268692, 1, 1, 1, 1, 1,
-0.9962571, -1.626639, -1.705951, 1, 1, 1, 1, 1,
-0.9943874, -0.4955853, -3.211935, 1, 1, 1, 1, 1,
-0.9851777, -1.94556, -3.890207, 1, 1, 1, 1, 1,
-0.9787472, -0.1194265, -2.05037, 1, 1, 1, 1, 1,
-0.9709504, -0.8832963, -2.081881, 1, 1, 1, 1, 1,
-0.9651868, 0.9586007, 1.311683, 1, 1, 1, 1, 1,
-0.9647943, -0.5213466, -1.337177, 0, 0, 1, 1, 1,
-0.9612063, -0.9015365, -1.435228, 1, 0, 0, 1, 1,
-0.9611557, -0.2359523, -1.425802, 1, 0, 0, 1, 1,
-0.9571092, -0.003301919, -2.64007, 1, 0, 0, 1, 1,
-0.9556316, 0.7255486, -1.12054, 1, 0, 0, 1, 1,
-0.9537306, 1.371064, -0.1638387, 1, 0, 0, 1, 1,
-0.9372923, -0.5145582, -1.648403, 0, 0, 0, 1, 1,
-0.933519, 0.8784369, -0.3416657, 0, 0, 0, 1, 1,
-0.9312023, 0.5254862, -2.273986, 0, 0, 0, 1, 1,
-0.9202628, 0.3764914, -2.357045, 0, 0, 0, 1, 1,
-0.9179327, 1.032659, -1.372266, 0, 0, 0, 1, 1,
-0.9173587, 1.462404, -0.1441422, 0, 0, 0, 1, 1,
-0.9027541, 0.3620564, -1.962109, 0, 0, 0, 1, 1,
-0.9008195, -0.2097389, -0.5806689, 1, 1, 1, 1, 1,
-0.8881736, 0.1741266, 0.900584, 1, 1, 1, 1, 1,
-0.8866661, -0.3046166, -1.600885, 1, 1, 1, 1, 1,
-0.8840257, -1.663898, -3.373334, 1, 1, 1, 1, 1,
-0.8839093, -0.324991, -3.329418, 1, 1, 1, 1, 1,
-0.8791838, 0.01046954, -1.639624, 1, 1, 1, 1, 1,
-0.8776926, -0.3519166, -3.181606, 1, 1, 1, 1, 1,
-0.8748178, -0.309426, -2.021838, 1, 1, 1, 1, 1,
-0.8717355, -0.0782829, -1.055316, 1, 1, 1, 1, 1,
-0.8696018, -1.909354, -0.6632354, 1, 1, 1, 1, 1,
-0.8639473, -2.186129, -1.976684, 1, 1, 1, 1, 1,
-0.8633934, -0.7999904, -3.490315, 1, 1, 1, 1, 1,
-0.8626022, 0.05562905, -0.2644624, 1, 1, 1, 1, 1,
-0.8611214, -0.0269224, 0.3074523, 1, 1, 1, 1, 1,
-0.8567184, 0.1180313, -2.108804, 1, 1, 1, 1, 1,
-0.8520668, -0.3434977, -1.079828, 0, 0, 1, 1, 1,
-0.8502536, -1.101578, -4.267753, 1, 0, 0, 1, 1,
-0.8488299, 1.820019, -0.6024798, 1, 0, 0, 1, 1,
-0.8471746, 1.639687, -0.06550457, 1, 0, 0, 1, 1,
-0.8451327, -0.03067768, -2.203722, 1, 0, 0, 1, 1,
-0.8434934, -0.6661959, -2.807379, 1, 0, 0, 1, 1,
-0.8426216, 0.3193947, -1.536446, 0, 0, 0, 1, 1,
-0.8387296, 0.487337, -1.025471, 0, 0, 0, 1, 1,
-0.8381209, -0.9056914, -2.840477, 0, 0, 0, 1, 1,
-0.833629, 0.3027503, -2.403542, 0, 0, 0, 1, 1,
-0.8217796, -1.173765, -2.145098, 0, 0, 0, 1, 1,
-0.8206955, 1.181379, -1.557376, 0, 0, 0, 1, 1,
-0.8194174, -0.580824, -2.310654, 0, 0, 0, 1, 1,
-0.8135765, -0.02366277, -2.646406, 1, 1, 1, 1, 1,
-0.8103703, 0.59645, -1.853683, 1, 1, 1, 1, 1,
-0.8044506, -1.798849, -4.025042, 1, 1, 1, 1, 1,
-0.802816, 1.244457, -0.3321158, 1, 1, 1, 1, 1,
-0.7994368, 0.04409055, -0.7381104, 1, 1, 1, 1, 1,
-0.7979216, -2.246431, -3.440304, 1, 1, 1, 1, 1,
-0.7913827, 1.326883, -1.313833, 1, 1, 1, 1, 1,
-0.7855037, 0.16705, -1.709823, 1, 1, 1, 1, 1,
-0.7830784, 0.6976934, 0.05974657, 1, 1, 1, 1, 1,
-0.7759073, 0.6933844, -2.417107, 1, 1, 1, 1, 1,
-0.7756454, 0.4914141, -0.1413826, 1, 1, 1, 1, 1,
-0.7674428, 1.345624, -0.7472498, 1, 1, 1, 1, 1,
-0.7648549, 2.102979, -2.48949, 1, 1, 1, 1, 1,
-0.7647704, 0.2815566, -0.8523747, 1, 1, 1, 1, 1,
-0.7591391, 0.1188315, -1.008351, 1, 1, 1, 1, 1,
-0.7522457, 0.3569834, 0.4844513, 0, 0, 1, 1, 1,
-0.7521049, -0.3451323, -1.646821, 1, 0, 0, 1, 1,
-0.7500885, -0.04830988, -0.7657229, 1, 0, 0, 1, 1,
-0.7500124, 1.218638, -3.152828, 1, 0, 0, 1, 1,
-0.7460221, 0.9916602, -0.4854654, 1, 0, 0, 1, 1,
-0.7416528, 0.8809676, -0.6834131, 1, 0, 0, 1, 1,
-0.7409328, -0.8277565, -3.36557, 0, 0, 0, 1, 1,
-0.7353461, -0.8526781, -2.689916, 0, 0, 0, 1, 1,
-0.7349797, 3.305075, -0.486842, 0, 0, 0, 1, 1,
-0.7332747, 0.5999627, -0.3885301, 0, 0, 0, 1, 1,
-0.725995, 0.9061791, -1.233212, 0, 0, 0, 1, 1,
-0.7229685, -1.712074, -2.368307, 0, 0, 0, 1, 1,
-0.7189724, -0.5440183, -1.76567, 0, 0, 0, 1, 1,
-0.7187324, 0.2374524, -0.952145, 1, 1, 1, 1, 1,
-0.7185236, -1.495948, -2.619643, 1, 1, 1, 1, 1,
-0.7095626, 1.003289, 0.5188025, 1, 1, 1, 1, 1,
-0.7067258, -0.5018333, -2.029514, 1, 1, 1, 1, 1,
-0.703476, -0.7622966, -2.926971, 1, 1, 1, 1, 1,
-0.702132, -0.2530041, -0.6615417, 1, 1, 1, 1, 1,
-0.6995882, 0.493148, -1.679754, 1, 1, 1, 1, 1,
-0.6869152, -1.071643, -2.331106, 1, 1, 1, 1, 1,
-0.6860433, 1.384374, 0.6768075, 1, 1, 1, 1, 1,
-0.684109, -1.004809, -1.342402, 1, 1, 1, 1, 1,
-0.6830919, 0.601651, -0.4249625, 1, 1, 1, 1, 1,
-0.6829038, 1.487372, -0.9431296, 1, 1, 1, 1, 1,
-0.6825275, -0.5505167, -2.578857, 1, 1, 1, 1, 1,
-0.6764678, 1.928017, 0.006843172, 1, 1, 1, 1, 1,
-0.6749838, 0.351649, -2.140621, 1, 1, 1, 1, 1,
-0.6731952, -0.7068456, -2.9881, 0, 0, 1, 1, 1,
-0.6708247, -0.204988, -2.013585, 1, 0, 0, 1, 1,
-0.6701748, 1.020409, 0.1854707, 1, 0, 0, 1, 1,
-0.6695552, -0.8326691, -2.590062, 1, 0, 0, 1, 1,
-0.6695187, -1.109688, -2.434666, 1, 0, 0, 1, 1,
-0.6691208, 0.07785626, -0.9563572, 1, 0, 0, 1, 1,
-0.6685137, -0.7848247, -1.065663, 0, 0, 0, 1, 1,
-0.6676382, 2.018434, 0.9742967, 0, 0, 0, 1, 1,
-0.6672049, -0.3844148, -2.770061, 0, 0, 0, 1, 1,
-0.6665496, 0.3399849, -0.4398519, 0, 0, 0, 1, 1,
-0.6663544, -0.1548518, -2.081297, 0, 0, 0, 1, 1,
-0.6663005, -0.1144915, -2.408756, 0, 0, 0, 1, 1,
-0.664511, 1.568833, -1.579737, 0, 0, 0, 1, 1,
-0.6595479, 0.7342713, -0.2773515, 1, 1, 1, 1, 1,
-0.6551686, 1.179989, 1.705569, 1, 1, 1, 1, 1,
-0.6527717, -1.117088, -0.5403205, 1, 1, 1, 1, 1,
-0.6505548, 0.1601625, -1.048391, 1, 1, 1, 1, 1,
-0.6465705, 0.3071134, -1.24468, 1, 1, 1, 1, 1,
-0.6456126, 0.5842274, -1.710483, 1, 1, 1, 1, 1,
-0.6362597, 2.664935, -1.663758, 1, 1, 1, 1, 1,
-0.6337363, -0.3333206, -1.542116, 1, 1, 1, 1, 1,
-0.633732, 0.9829757, -1.590966, 1, 1, 1, 1, 1,
-0.6291901, 0.9205317, 0.04617622, 1, 1, 1, 1, 1,
-0.6264582, -1.280676, -3.980222, 1, 1, 1, 1, 1,
-0.6227215, -0.7431966, -1.047867, 1, 1, 1, 1, 1,
-0.6172402, 0.7579164, -1.595629, 1, 1, 1, 1, 1,
-0.611454, -0.1436174, -2.875648, 1, 1, 1, 1, 1,
-0.6091335, -1.169507, -3.264921, 1, 1, 1, 1, 1,
-0.5896177, 0.9788048, 0.5233039, 0, 0, 1, 1, 1,
-0.5878954, 0.02165776, 0.3030193, 1, 0, 0, 1, 1,
-0.5825801, 0.882856, -1.037004, 1, 0, 0, 1, 1,
-0.5768724, 0.2937259, -0.4860599, 1, 0, 0, 1, 1,
-0.5744949, 0.8061281, -1.456177, 1, 0, 0, 1, 1,
-0.5715248, -1.162584, -2.412593, 1, 0, 0, 1, 1,
-0.5696776, -0.6383447, -1.795513, 0, 0, 0, 1, 1,
-0.5689597, -0.3041391, -2.271772, 0, 0, 0, 1, 1,
-0.5679833, 0.02390245, -2.356882, 0, 0, 0, 1, 1,
-0.5672016, 0.4898132, 1.265871, 0, 0, 0, 1, 1,
-0.5636067, -0.1075746, -1.838319, 0, 0, 0, 1, 1,
-0.5617638, -0.5945337, -1.8532, 0, 0, 0, 1, 1,
-0.5536366, -1.80786, -3.52616, 0, 0, 0, 1, 1,
-0.5521211, -0.8531816, -2.581782, 1, 1, 1, 1, 1,
-0.5471878, -1.905496, -3.060443, 1, 1, 1, 1, 1,
-0.5442849, 0.7454209, -2.030901, 1, 1, 1, 1, 1,
-0.5425184, 0.2916652, 0.2820721, 1, 1, 1, 1, 1,
-0.5398965, 1.77305, -0.6895486, 1, 1, 1, 1, 1,
-0.538673, 0.3595774, 0.2045805, 1, 1, 1, 1, 1,
-0.5384147, -0.5128392, -1.302556, 1, 1, 1, 1, 1,
-0.5343959, -0.2600253, -0.8892261, 1, 1, 1, 1, 1,
-0.5329573, 1.055648, -0.2597584, 1, 1, 1, 1, 1,
-0.5305119, 0.5862265, -1.177593, 1, 1, 1, 1, 1,
-0.5254841, -1.216783, -3.437128, 1, 1, 1, 1, 1,
-0.5123488, 0.5033495, -2.083164, 1, 1, 1, 1, 1,
-0.5067441, -0.2366315, -2.834584, 1, 1, 1, 1, 1,
-0.5062324, 1.993021, 0.5009426, 1, 1, 1, 1, 1,
-0.4950461, -1.441182, -2.498924, 1, 1, 1, 1, 1,
-0.4850299, -1.850169, -3.170527, 0, 0, 1, 1, 1,
-0.4770373, 0.1932791, -1.170698, 1, 0, 0, 1, 1,
-0.4740867, 0.6779623, -0.4601762, 1, 0, 0, 1, 1,
-0.4697186, -0.1560833, -2.486839, 1, 0, 0, 1, 1,
-0.4560612, -2.350233, -4.88844, 1, 0, 0, 1, 1,
-0.4557529, 0.5452004, 0.1807034, 1, 0, 0, 1, 1,
-0.451023, 0.0002195551, -2.948592, 0, 0, 0, 1, 1,
-0.4461959, -0.7654883, -2.597249, 0, 0, 0, 1, 1,
-0.4457996, -0.3781406, -2.681978, 0, 0, 0, 1, 1,
-0.4420438, -0.4888675, -2.968948, 0, 0, 0, 1, 1,
-0.4398154, 1.574741, -0.1336827, 0, 0, 0, 1, 1,
-0.4387697, -0.1960343, -3.055279, 0, 0, 0, 1, 1,
-0.4378612, -0.3380375, -4.08218, 0, 0, 0, 1, 1,
-0.4284932, 1.228617, 0.2045383, 1, 1, 1, 1, 1,
-0.4281449, 0.8505473, -1.538939, 1, 1, 1, 1, 1,
-0.4274188, -1.147197, -2.942513, 1, 1, 1, 1, 1,
-0.4273111, -2.115073, -2.696899, 1, 1, 1, 1, 1,
-0.4260328, -1.259928, -2.669011, 1, 1, 1, 1, 1,
-0.4248101, -0.8841818, -2.534607, 1, 1, 1, 1, 1,
-0.4130679, -0.6437469, -1.921314, 1, 1, 1, 1, 1,
-0.4070418, 0.1694562, -1.216664, 1, 1, 1, 1, 1,
-0.4045763, 0.2279524, -0.8242235, 1, 1, 1, 1, 1,
-0.4013111, -0.4885677, -2.077493, 1, 1, 1, 1, 1,
-0.3967203, -0.9406293, -1.558633, 1, 1, 1, 1, 1,
-0.3949831, 0.906678, -1.009307, 1, 1, 1, 1, 1,
-0.386102, -1.462187, -3.568374, 1, 1, 1, 1, 1,
-0.370389, 1.182075, 0.5334285, 1, 1, 1, 1, 1,
-0.3684365, 0.6266409, 0.2428518, 1, 1, 1, 1, 1,
-0.3671905, 0.4699608, -0.5863528, 0, 0, 1, 1, 1,
-0.3664721, -0.2199262, -2.032189, 1, 0, 0, 1, 1,
-0.3579039, 0.1295901, -0.3188245, 1, 0, 0, 1, 1,
-0.3548459, -1.402403, -3.114788, 1, 0, 0, 1, 1,
-0.3537367, 0.286779, -0.4342971, 1, 0, 0, 1, 1,
-0.3535913, 0.4131175, 0.01645412, 1, 0, 0, 1, 1,
-0.348279, 0.5234166, -1.549423, 0, 0, 0, 1, 1,
-0.3482787, 1.372092, 0.2953317, 0, 0, 0, 1, 1,
-0.3465495, -1.361704, -2.647436, 0, 0, 0, 1, 1,
-0.3450257, 0.7399884, 0.5505674, 0, 0, 0, 1, 1,
-0.3449655, -1.453938, -2.408542, 0, 0, 0, 1, 1,
-0.3442931, 0.3599696, -1.156735, 0, 0, 0, 1, 1,
-0.3415013, 0.2745784, -1.99381, 0, 0, 0, 1, 1,
-0.339966, 1.450019, -0.6510299, 1, 1, 1, 1, 1,
-0.3357077, -0.3345078, -1.942508, 1, 1, 1, 1, 1,
-0.3341538, -0.4256416, -4.313469, 1, 1, 1, 1, 1,
-0.3313696, -1.172197, -1.417442, 1, 1, 1, 1, 1,
-0.3301961, -1.140553, -2.431767, 1, 1, 1, 1, 1,
-0.3296544, -1.638885, -3.199623, 1, 1, 1, 1, 1,
-0.3294953, -0.226946, -0.7582176, 1, 1, 1, 1, 1,
-0.3281901, 0.9755102, -0.3624108, 1, 1, 1, 1, 1,
-0.3273439, 0.2005004, -1.524604, 1, 1, 1, 1, 1,
-0.3265668, -1.61574, -3.451924, 1, 1, 1, 1, 1,
-0.3257262, -0.7578933, -4.389375, 1, 1, 1, 1, 1,
-0.324442, -0.005265743, 0.07877903, 1, 1, 1, 1, 1,
-0.3211005, -0.9281062, -1.475927, 1, 1, 1, 1, 1,
-0.3147081, -1.535121, -1.114502, 1, 1, 1, 1, 1,
-0.3092201, -0.2607062, -2.362586, 1, 1, 1, 1, 1,
-0.3061606, -0.1752223, -2.10094, 0, 0, 1, 1, 1,
-0.3029082, -0.6994926, -3.234427, 1, 0, 0, 1, 1,
-0.3016805, 0.990422, -1.08278, 1, 0, 0, 1, 1,
-0.3015818, -0.601979, -1.522552, 1, 0, 0, 1, 1,
-0.3007982, 0.2677685, -0.07396577, 1, 0, 0, 1, 1,
-0.3007659, 0.9915237, 0.1033037, 1, 0, 0, 1, 1,
-0.3001732, 0.007713111, -1.646931, 0, 0, 0, 1, 1,
-0.2910141, -2.549925, -3.342855, 0, 0, 0, 1, 1,
-0.2906619, 0.7869881, 0.5982076, 0, 0, 0, 1, 1,
-0.2888433, -0.4435754, -2.708394, 0, 0, 0, 1, 1,
-0.2875418, 2.336468, 0.5016609, 0, 0, 0, 1, 1,
-0.2847916, -0.3025256, -0.3927585, 0, 0, 0, 1, 1,
-0.2759137, -0.7635804, -3.360588, 0, 0, 0, 1, 1,
-0.2714787, -0.3849487, -2.116412, 1, 1, 1, 1, 1,
-0.2637484, -1.020595, -4.29424, 1, 1, 1, 1, 1,
-0.2618608, 0.9957175, 0.5290101, 1, 1, 1, 1, 1,
-0.2599829, 1.869089, -1.067951, 1, 1, 1, 1, 1,
-0.255935, 0.4433004, 0.1620411, 1, 1, 1, 1, 1,
-0.255225, -1.758323, -1.636249, 1, 1, 1, 1, 1,
-0.2503257, -0.301535, -2.113395, 1, 1, 1, 1, 1,
-0.2497645, -0.8749231, -3.601292, 1, 1, 1, 1, 1,
-0.2473929, -0.7666248, -2.766007, 1, 1, 1, 1, 1,
-0.2468625, 1.073675, 0.7490203, 1, 1, 1, 1, 1,
-0.2467865, -1.123792, -3.10224, 1, 1, 1, 1, 1,
-0.2463029, 0.5531279, -1.742782, 1, 1, 1, 1, 1,
-0.2456218, 0.02186293, -0.7229781, 1, 1, 1, 1, 1,
-0.2413103, -0.8890959, -3.786643, 1, 1, 1, 1, 1,
-0.2359636, 2.28855, -0.09742612, 1, 1, 1, 1, 1,
-0.2310755, -0.6572395, -3.061739, 0, 0, 1, 1, 1,
-0.2300454, 0.6912625, -0.6590664, 1, 0, 0, 1, 1,
-0.2295202, 0.6653114, -1.124505, 1, 0, 0, 1, 1,
-0.2279982, -0.99531, -3.011349, 1, 0, 0, 1, 1,
-0.2248418, 0.7280579, -0.9842828, 1, 0, 0, 1, 1,
-0.2159941, -0.08201865, -3.129018, 1, 0, 0, 1, 1,
-0.2153598, -1.572236, -4.21001, 0, 0, 0, 1, 1,
-0.2144854, -1.20573, -2.615524, 0, 0, 0, 1, 1,
-0.2136032, -0.6094923, -2.328557, 0, 0, 0, 1, 1,
-0.2130787, -0.1451539, -3.254234, 0, 0, 0, 1, 1,
-0.2070338, -0.797559, -2.274734, 0, 0, 0, 1, 1,
-0.2037632, -2.803702, -0.771244, 0, 0, 0, 1, 1,
-0.2034505, -0.7927672, -3.365484, 0, 0, 0, 1, 1,
-0.2028011, -0.4026093, -3.96808, 1, 1, 1, 1, 1,
-0.2024918, 0.6517823, 1.024052, 1, 1, 1, 1, 1,
-0.1911243, 0.3612159, -1.661499, 1, 1, 1, 1, 1,
-0.1904321, -0.641529, -2.273945, 1, 1, 1, 1, 1,
-0.1868093, -0.5720792, -3.302788, 1, 1, 1, 1, 1,
-0.1847831, -1.416452, -3.401157, 1, 1, 1, 1, 1,
-0.1819143, -1.455176, -4.32517, 1, 1, 1, 1, 1,
-0.1798578, -2.181558, -2.780364, 1, 1, 1, 1, 1,
-0.179319, -0.09094254, -1.585297, 1, 1, 1, 1, 1,
-0.1736078, -0.3731496, -3.201462, 1, 1, 1, 1, 1,
-0.1735766, -0.3667797, -1.969374, 1, 1, 1, 1, 1,
-0.170618, -0.5358026, -1.774823, 1, 1, 1, 1, 1,
-0.1683773, -1.602462, -3.148537, 1, 1, 1, 1, 1,
-0.1624977, 0.5912426, 0.4840333, 1, 1, 1, 1, 1,
-0.1615164, -0.8453726, -2.842123, 1, 1, 1, 1, 1,
-0.1607824, -0.4131717, -2.564196, 0, 0, 1, 1, 1,
-0.1584075, 0.2396987, -0.3164168, 1, 0, 0, 1, 1,
-0.1434899, -1.340337, -2.517988, 1, 0, 0, 1, 1,
-0.1413264, 0.3080916, -1.057319, 1, 0, 0, 1, 1,
-0.1407109, 0.4691815, -1.725739, 1, 0, 0, 1, 1,
-0.1393573, 0.4104586, -0.8896862, 1, 0, 0, 1, 1,
-0.138759, -1.113145, -4.900968, 0, 0, 0, 1, 1,
-0.1350766, -0.5350578, -1.331694, 0, 0, 0, 1, 1,
-0.133215, -1.223225, -2.050732, 0, 0, 0, 1, 1,
-0.1314426, -1.739737, -3.186249, 0, 0, 0, 1, 1,
-0.1301355, 2.67541, -0.8524472, 0, 0, 0, 1, 1,
-0.1286884, 0.5314131, -1.695022, 0, 0, 0, 1, 1,
-0.1278382, -0.01486047, -2.301231, 0, 0, 0, 1, 1,
-0.1269443, -0.838522, -2.837902, 1, 1, 1, 1, 1,
-0.1184167, 0.3162437, 1.08348, 1, 1, 1, 1, 1,
-0.1183378, -0.8707741, -4.288094, 1, 1, 1, 1, 1,
-0.1157979, 1.196004, -0.7142567, 1, 1, 1, 1, 1,
-0.1148823, -0.1427309, -2.392562, 1, 1, 1, 1, 1,
-0.1136745, -0.1833102, -3.141828, 1, 1, 1, 1, 1,
-0.1084735, 0.4494925, -1.532541, 1, 1, 1, 1, 1,
-0.108043, 0.5321338, 0.5763276, 1, 1, 1, 1, 1,
-0.1067356, 0.1581754, 0.7987763, 1, 1, 1, 1, 1,
-0.1062761, 0.1869326, -0.5629706, 1, 1, 1, 1, 1,
-0.1059396, 2.396019, 0.388079, 1, 1, 1, 1, 1,
-0.1052326, -0.6208643, -1.574511, 1, 1, 1, 1, 1,
-0.1051308, 0.2270059, 0.8098429, 1, 1, 1, 1, 1,
-0.1004807, 0.316479, -1.956505, 1, 1, 1, 1, 1,
-0.09973848, -0.4246467, -2.480414, 1, 1, 1, 1, 1,
-0.09863688, 0.5374748, -1.086474, 0, 0, 1, 1, 1,
-0.0932752, -1.699851, -1.895615, 1, 0, 0, 1, 1,
-0.09146666, -0.435625, -2.568878, 1, 0, 0, 1, 1,
-0.09105497, 0.2277929, -0.1919007, 1, 0, 0, 1, 1,
-0.09079313, 0.2944297, -1.020416, 1, 0, 0, 1, 1,
-0.09038448, -0.6980897, -1.836477, 1, 0, 0, 1, 1,
-0.0897435, -1.466202, -2.454275, 0, 0, 0, 1, 1,
-0.08857395, -1.172241, -4.779934, 0, 0, 0, 1, 1,
-0.08500963, 0.6354966, 0.7126226, 0, 0, 0, 1, 1,
-0.08437013, 0.6180995, -0.9491594, 0, 0, 0, 1, 1,
-0.08411429, -0.6304665, -3.04315, 0, 0, 0, 1, 1,
-0.08305681, 0.5394262, 0.3876831, 0, 0, 0, 1, 1,
-0.08296681, -1.971825, -2.084974, 0, 0, 0, 1, 1,
-0.08238991, 1.513975, 0.1364323, 1, 1, 1, 1, 1,
-0.08216486, -1.117931, -1.286571, 1, 1, 1, 1, 1,
-0.07807337, 1.863326, -1.89095, 1, 1, 1, 1, 1,
-0.07297453, 0.7742, -0.2232689, 1, 1, 1, 1, 1,
-0.07050741, -0.03193977, -3.090316, 1, 1, 1, 1, 1,
-0.0687566, 0.250303, 0.2563172, 1, 1, 1, 1, 1,
-0.06777564, -0.78126, -2.844087, 1, 1, 1, 1, 1,
-0.06430445, -0.5857077, -1.849414, 1, 1, 1, 1, 1,
-0.05725783, -0.4997079, -3.204076, 1, 1, 1, 1, 1,
-0.05295359, -2.13369, -4.631861, 1, 1, 1, 1, 1,
-0.05086824, 0.358537, -0.01083527, 1, 1, 1, 1, 1,
-0.02905802, -0.3379969, -1.251868, 1, 1, 1, 1, 1,
-0.02779204, -1.883875, -2.323073, 1, 1, 1, 1, 1,
-0.02653251, 0.9811456, -0.5867606, 1, 1, 1, 1, 1,
-0.02500079, -1.23325, -2.729023, 1, 1, 1, 1, 1,
-0.01820362, -0.3949105, -2.03007, 0, 0, 1, 1, 1,
-0.01803549, -0.2221523, -1.266813, 1, 0, 0, 1, 1,
-0.008884218, -0.7052112, -3.012241, 1, 0, 0, 1, 1,
-0.002816018, 0.3605264, 0.5426285, 1, 0, 0, 1, 1,
-0.0020665, -0.1359885, -1.518321, 1, 0, 0, 1, 1,
0.002166701, -2.251295, 2.669442, 1, 0, 0, 1, 1,
0.003422116, -0.2667849, 1.242759, 0, 0, 0, 1, 1,
0.006791784, -0.9281057, 2.675975, 0, 0, 0, 1, 1,
0.01167687, -0.1273473, 1.581217, 0, 0, 0, 1, 1,
0.01496388, -0.01260035, 2.975987, 0, 0, 0, 1, 1,
0.01543511, -1.091586, 2.472081, 0, 0, 0, 1, 1,
0.0173265, 1.724151, -0.2918263, 0, 0, 0, 1, 1,
0.02211041, -0.2673841, 2.403647, 0, 0, 0, 1, 1,
0.026756, -1.348123, 5.11147, 1, 1, 1, 1, 1,
0.02682422, 1.506092, -0.879583, 1, 1, 1, 1, 1,
0.02691361, -0.7032863, 2.013763, 1, 1, 1, 1, 1,
0.0281005, -0.4022938, 5.590106, 1, 1, 1, 1, 1,
0.03062118, 0.01883722, 0.06152257, 1, 1, 1, 1, 1,
0.03134972, 0.3429681, 0.3641554, 1, 1, 1, 1, 1,
0.03347642, -0.8885083, 1.925835, 1, 1, 1, 1, 1,
0.03559621, 0.7894985, 1.575616, 1, 1, 1, 1, 1,
0.03612906, -0.6913191, 4.006028, 1, 1, 1, 1, 1,
0.03649023, 0.5916568, 0.96025, 1, 1, 1, 1, 1,
0.03917957, 1.266245, 0.2750906, 1, 1, 1, 1, 1,
0.04044511, -1.602053, 2.272808, 1, 1, 1, 1, 1,
0.04610311, -1.499976, 5.046551, 1, 1, 1, 1, 1,
0.04685441, -1.039168, 2.376719, 1, 1, 1, 1, 1,
0.0486519, -1.229167, 1.902091, 1, 1, 1, 1, 1,
0.05589718, -0.3107571, 2.371619, 0, 0, 1, 1, 1,
0.05697548, -0.03109392, 1.40969, 1, 0, 0, 1, 1,
0.05727677, -0.8828697, 4.994178, 1, 0, 0, 1, 1,
0.05797354, 0.4751935, 0.9359818, 1, 0, 0, 1, 1,
0.06268342, 1.594459, 1.31864, 1, 0, 0, 1, 1,
0.06645539, -0.8050718, 3.228084, 1, 0, 0, 1, 1,
0.06756034, 0.8162081, 0.9771914, 0, 0, 0, 1, 1,
0.07090848, 1.067694, -0.2265538, 0, 0, 0, 1, 1,
0.07197954, -0.07753549, 2.421886, 0, 0, 0, 1, 1,
0.0730166, 0.3487886, 1.107119, 0, 0, 0, 1, 1,
0.0881025, -1.143038, 2.91937, 0, 0, 0, 1, 1,
0.09173844, -1.547928, 4.478946, 0, 0, 0, 1, 1,
0.09669778, 0.5613157, 1.598956, 0, 0, 0, 1, 1,
0.09922556, -1.465791, 2.631018, 1, 1, 1, 1, 1,
0.1000343, 0.8555789, -0.5944219, 1, 1, 1, 1, 1,
0.100378, 1.878113, 1.094682, 1, 1, 1, 1, 1,
0.1125978, 1.298282, 2.46616, 1, 1, 1, 1, 1,
0.1168044, -0.4352848, 4.013946, 1, 1, 1, 1, 1,
0.1168857, -1.200837, 3.087197, 1, 1, 1, 1, 1,
0.1169325, 0.1582172, -0.1152318, 1, 1, 1, 1, 1,
0.1174367, 0.1926327, 1.326182, 1, 1, 1, 1, 1,
0.1190665, -0.8501608, 3.864862, 1, 1, 1, 1, 1,
0.1195315, 0.2820207, 1.367724, 1, 1, 1, 1, 1,
0.1204539, -0.1759121, 1.409412, 1, 1, 1, 1, 1,
0.1240972, 1.580844, 0.6842031, 1, 1, 1, 1, 1,
0.125537, -1.461349, 3.585583, 1, 1, 1, 1, 1,
0.1256617, -0.4041207, 4.263869, 1, 1, 1, 1, 1,
0.1262051, 0.5432311, 0.2842865, 1, 1, 1, 1, 1,
0.1262482, 1.326814, -0.4452424, 0, 0, 1, 1, 1,
0.1282656, -1.220039, 2.449557, 1, 0, 0, 1, 1,
0.1301215, -0.7985449, 2.94101, 1, 0, 0, 1, 1,
0.1319406, -2.756203, 2.743431, 1, 0, 0, 1, 1,
0.133588, -2.282012, 3.858521, 1, 0, 0, 1, 1,
0.1336831, -1.014781, 2.347575, 1, 0, 0, 1, 1,
0.1357774, -0.5468383, 1.650077, 0, 0, 0, 1, 1,
0.140667, -0.09358618, 1.651758, 0, 0, 0, 1, 1,
0.1440418, 1.192067, 1.857358, 0, 0, 0, 1, 1,
0.1448599, 0.2033588, 0.4003261, 0, 0, 0, 1, 1,
0.1458033, -0.1671018, 2.368272, 0, 0, 0, 1, 1,
0.1484063, 0.983731, -1.880485, 0, 0, 0, 1, 1,
0.1496846, -1.910676, 2.959844, 0, 0, 0, 1, 1,
0.1502387, 0.387439, -0.07103279, 1, 1, 1, 1, 1,
0.1540006, 0.01493503, 0.6661063, 1, 1, 1, 1, 1,
0.1563319, 0.6619369, 1.715267, 1, 1, 1, 1, 1,
0.1564092, 0.3234184, 0.290552, 1, 1, 1, 1, 1,
0.1569093, -0.5845141, 3.101495, 1, 1, 1, 1, 1,
0.1602244, -0.01680798, 0.2030527, 1, 1, 1, 1, 1,
0.1609112, -1.948413, 2.424577, 1, 1, 1, 1, 1,
0.1614255, -0.1651037, 2.499818, 1, 1, 1, 1, 1,
0.1763112, 0.3659817, 0.1418765, 1, 1, 1, 1, 1,
0.1765027, -1.243701, 3.674696, 1, 1, 1, 1, 1,
0.180506, 0.8990294, 0.5442094, 1, 1, 1, 1, 1,
0.1855395, -0.2939328, 1.925398, 1, 1, 1, 1, 1,
0.1859843, 2.130934, -1.681386, 1, 1, 1, 1, 1,
0.1912314, 0.7721702, -0.1006832, 1, 1, 1, 1, 1,
0.1925434, -1.20966, 1.747391, 1, 1, 1, 1, 1,
0.1968434, 0.871437, 1.519373, 0, 0, 1, 1, 1,
0.1975531, 0.4201202, 0.6890202, 1, 0, 0, 1, 1,
0.2035998, -0.8363236, 3.750369, 1, 0, 0, 1, 1,
0.2058721, -0.372707, 1.559782, 1, 0, 0, 1, 1,
0.2088561, 1.063286, 0.1485276, 1, 0, 0, 1, 1,
0.2114264, 1.53987, -1.994944, 1, 0, 0, 1, 1,
0.2151573, 1.175779, -0.1957144, 0, 0, 0, 1, 1,
0.2184647, -0.8023381, 2.795352, 0, 0, 0, 1, 1,
0.2228089, 1.259232, -0.2962298, 0, 0, 0, 1, 1,
0.230227, -0.1453038, 2.146063, 0, 0, 0, 1, 1,
0.2310212, 0.2217125, 2.370992, 0, 0, 0, 1, 1,
0.2342919, 1.452382, -0.3615052, 0, 0, 0, 1, 1,
0.234494, -0.1657834, 2.888396, 0, 0, 0, 1, 1,
0.2348415, 0.3935998, 0.7061851, 1, 1, 1, 1, 1,
0.2429164, -0.8838966, 1.158501, 1, 1, 1, 1, 1,
0.2434566, 0.8985701, -1.117778, 1, 1, 1, 1, 1,
0.2439847, 0.4646491, 1.973659, 1, 1, 1, 1, 1,
0.2467565, -0.0506046, 2.161599, 1, 1, 1, 1, 1,
0.2468788, 0.5035864, 0.4997276, 1, 1, 1, 1, 1,
0.2472634, 0.7019135, -0.09182345, 1, 1, 1, 1, 1,
0.2550331, -0.9386492, 2.72583, 1, 1, 1, 1, 1,
0.2588486, -1.444151, 2.071602, 1, 1, 1, 1, 1,
0.262233, -0.4090931, 2.140225, 1, 1, 1, 1, 1,
0.2663983, 0.969972, -1.958194, 1, 1, 1, 1, 1,
0.2687673, 0.1412079, 4.597886, 1, 1, 1, 1, 1,
0.2690094, 1.802544, 1.16326, 1, 1, 1, 1, 1,
0.2712514, -2.6309, 2.621981, 1, 1, 1, 1, 1,
0.271522, -0.2615685, 2.38228, 1, 1, 1, 1, 1,
0.276146, -1.856623, 1.218088, 0, 0, 1, 1, 1,
0.2763826, 0.1882776, 0.7010114, 1, 0, 0, 1, 1,
0.2787127, -1.044438, 2.408411, 1, 0, 0, 1, 1,
0.2788268, -0.545059, 2.486925, 1, 0, 0, 1, 1,
0.2807931, 0.2931805, -0.8171183, 1, 0, 0, 1, 1,
0.285704, 1.351303, 0.3061827, 1, 0, 0, 1, 1,
0.2857889, 2.263996, -0.316696, 0, 0, 0, 1, 1,
0.2902316, 0.6743603, 0.445733, 0, 0, 0, 1, 1,
0.2925583, -0.06084459, 1.712735, 0, 0, 0, 1, 1,
0.2929049, 1.666139, 0.3374724, 0, 0, 0, 1, 1,
0.2969168, -0.2371653, 1.727206, 0, 0, 0, 1, 1,
0.2973047, -0.2612698, 1.786357, 0, 0, 0, 1, 1,
0.2990978, -2.095858, 3.359646, 0, 0, 0, 1, 1,
0.3036258, -0.56862, 3.271492, 1, 1, 1, 1, 1,
0.3094717, -0.2569453, 0.1048631, 1, 1, 1, 1, 1,
0.3109702, 0.01798776, 1.69911, 1, 1, 1, 1, 1,
0.3166907, 0.3029423, 0.3983134, 1, 1, 1, 1, 1,
0.3202311, -0.6310616, 1.645875, 1, 1, 1, 1, 1,
0.3213938, 1.570292, 0.4456827, 1, 1, 1, 1, 1,
0.3307433, 0.5638931, -0.485203, 1, 1, 1, 1, 1,
0.3349288, 1.008716, 2.224055, 1, 1, 1, 1, 1,
0.3374671, -0.5300545, 1.272558, 1, 1, 1, 1, 1,
0.3382793, -0.3729527, 2.292228, 1, 1, 1, 1, 1,
0.3560487, 0.7999672, -1.156732, 1, 1, 1, 1, 1,
0.3568526, 0.1310529, 1.23793, 1, 1, 1, 1, 1,
0.3569602, -1.165119, 3.244869, 1, 1, 1, 1, 1,
0.3621488, -0.5781233, 3.546675, 1, 1, 1, 1, 1,
0.3621814, 0.0175391, 1.810276, 1, 1, 1, 1, 1,
0.3645903, 1.344765, 0.08006226, 0, 0, 1, 1, 1,
0.3647925, -0.2790008, 2.280736, 1, 0, 0, 1, 1,
0.3655745, -0.5779346, 3.906832, 1, 0, 0, 1, 1,
0.3665684, 0.359093, -0.4993101, 1, 0, 0, 1, 1,
0.3807198, 1.073779, 0.281445, 1, 0, 0, 1, 1,
0.3829093, 1.025692, -1.258911, 1, 0, 0, 1, 1,
0.3830782, -1.019897, 3.801972, 0, 0, 0, 1, 1,
0.3884199, 0.9438837, -0.2394742, 0, 0, 0, 1, 1,
0.3921231, 0.04083875, -1.006523, 0, 0, 0, 1, 1,
0.3930618, -0.8703018, 2.8522, 0, 0, 0, 1, 1,
0.3936116, 0.1004867, 2.700017, 0, 0, 0, 1, 1,
0.3946823, -1.13343, 3.192865, 0, 0, 0, 1, 1,
0.3983086, 0.5039905, -0.2959861, 0, 0, 0, 1, 1,
0.3993966, 0.4287584, 0.7227876, 1, 1, 1, 1, 1,
0.400557, 0.6196008, -0.2008599, 1, 1, 1, 1, 1,
0.401677, -0.5016817, 3.066472, 1, 1, 1, 1, 1,
0.4097963, 1.074695, -0.4090363, 1, 1, 1, 1, 1,
0.4105955, -0.5157063, 2.179234, 1, 1, 1, 1, 1,
0.412776, 1.243059, 0.9902564, 1, 1, 1, 1, 1,
0.4168817, -0.6728204, 1.204025, 1, 1, 1, 1, 1,
0.4235534, 0.2738496, 0.9247255, 1, 1, 1, 1, 1,
0.4252655, 0.7017673, 1.405918, 1, 1, 1, 1, 1,
0.4276123, 0.1514045, -0.5414671, 1, 1, 1, 1, 1,
0.429691, -1.739553, 1.833033, 1, 1, 1, 1, 1,
0.4297488, -1.472597, 1.905676, 1, 1, 1, 1, 1,
0.4301127, 0.9891684, -0.2715134, 1, 1, 1, 1, 1,
0.430711, -0.2712426, 2.160229, 1, 1, 1, 1, 1,
0.4338726, 1.944492, -0.2971547, 1, 1, 1, 1, 1,
0.4340162, 1.629384, 1.764456, 0, 0, 1, 1, 1,
0.4377612, 0.0135467, 1.143901, 1, 0, 0, 1, 1,
0.4426992, -1.207997, 3.476985, 1, 0, 0, 1, 1,
0.4430053, 0.1611592, 0.03911785, 1, 0, 0, 1, 1,
0.4467503, 0.1579215, 1.301985, 1, 0, 0, 1, 1,
0.4510124, -1.601469, 4.061391, 1, 0, 0, 1, 1,
0.4534797, 0.2939875, 2.666392, 0, 0, 0, 1, 1,
0.4551761, -0.4610484, 2.242417, 0, 0, 0, 1, 1,
0.4571056, -0.5875264, 4.394877, 0, 0, 0, 1, 1,
0.4577583, 0.3360428, 1.006351, 0, 0, 0, 1, 1,
0.4579133, 2.231647, 0.4669103, 0, 0, 0, 1, 1,
0.4595985, -0.9246024, 3.937839, 0, 0, 0, 1, 1,
0.4624684, -0.4118096, 0.4590187, 0, 0, 0, 1, 1,
0.4671225, 0.912141, 0.2478265, 1, 1, 1, 1, 1,
0.4719201, -0.1391296, 0.8713246, 1, 1, 1, 1, 1,
0.4720915, -0.1115144, 1.471853, 1, 1, 1, 1, 1,
0.474104, 0.3932829, 1.335966, 1, 1, 1, 1, 1,
0.4770818, 1.018039, 0.2759511, 1, 1, 1, 1, 1,
0.4773226, 0.6432694, 2.303809, 1, 1, 1, 1, 1,
0.4821304, 0.1910955, 2.739844, 1, 1, 1, 1, 1,
0.4825083, -0.1030418, 1.564202, 1, 1, 1, 1, 1,
0.4843291, -0.19932, 0.9683914, 1, 1, 1, 1, 1,
0.4857019, -0.3628482, 3.599469, 1, 1, 1, 1, 1,
0.4883047, 0.5523916, 1.391093, 1, 1, 1, 1, 1,
0.4889655, -4.205454, 3.209714, 1, 1, 1, 1, 1,
0.4893087, 1.200739, -0.2454126, 1, 1, 1, 1, 1,
0.4913777, 0.2205478, 0.5039597, 1, 1, 1, 1, 1,
0.493892, 0.8240028, 0.7810488, 1, 1, 1, 1, 1,
0.4941149, 0.1717251, 0.1169033, 0, 0, 1, 1, 1,
0.4970737, -0.02392614, 1.496463, 1, 0, 0, 1, 1,
0.4976975, -0.8565602, 2.486875, 1, 0, 0, 1, 1,
0.4991572, 0.5147607, -0.2597871, 1, 0, 0, 1, 1,
0.5029634, 1.285452, 1.460046, 1, 0, 0, 1, 1,
0.5049455, 0.5701044, 2.364202, 1, 0, 0, 1, 1,
0.5063962, -0.9914556, 2.440234, 0, 0, 0, 1, 1,
0.5080304, 0.1906148, 4.330369, 0, 0, 0, 1, 1,
0.5166765, 1.200032, 3.262564, 0, 0, 0, 1, 1,
0.5168142, 0.1601172, 0.4711343, 0, 0, 0, 1, 1,
0.5199997, 1.070781, 2.439463, 0, 0, 0, 1, 1,
0.5239115, -1.908795, 1.649389, 0, 0, 0, 1, 1,
0.5282887, 0.7609284, -0.2533804, 0, 0, 0, 1, 1,
0.5289847, -1.137935, 2.209856, 1, 1, 1, 1, 1,
0.5317155, 0.6447949, 0.1372296, 1, 1, 1, 1, 1,
0.5343276, 0.9979271, -1.677123, 1, 1, 1, 1, 1,
0.5365969, -1.680306, 2.275164, 1, 1, 1, 1, 1,
0.5385358, -0.579024, 3.533872, 1, 1, 1, 1, 1,
0.5392509, 0.7040347, 1.284107, 1, 1, 1, 1, 1,
0.5431986, -1.48471, 2.812317, 1, 1, 1, 1, 1,
0.5457283, -0.5658129, -0.7620617, 1, 1, 1, 1, 1,
0.5473692, -0.8655658, 2.928028, 1, 1, 1, 1, 1,
0.5526544, -0.9681932, 2.859615, 1, 1, 1, 1, 1,
0.560126, 1.005341, -0.3479982, 1, 1, 1, 1, 1,
0.5601261, 0.1823097, 1.015809, 1, 1, 1, 1, 1,
0.5660173, 0.1399956, 1.037714, 1, 1, 1, 1, 1,
0.5691425, 1.923625, -0.7117106, 1, 1, 1, 1, 1,
0.5691536, 0.142384, 1.309425, 1, 1, 1, 1, 1,
0.5708227, -0.1224516, 1.71516, 0, 0, 1, 1, 1,
0.5718438, 0.2633597, 0.3799284, 1, 0, 0, 1, 1,
0.5739354, 0.1812444, 1.697724, 1, 0, 0, 1, 1,
0.5741023, -0.3378383, 1.408705, 1, 0, 0, 1, 1,
0.576721, -0.3045385, 0.2457892, 1, 0, 0, 1, 1,
0.5795162, 0.4156516, -1.12215, 1, 0, 0, 1, 1,
0.5797155, -1.180079, 2.532237, 0, 0, 0, 1, 1,
0.5816363, -0.480348, 2.255196, 0, 0, 0, 1, 1,
0.583208, 1.220376, 0.07604339, 0, 0, 0, 1, 1,
0.5864459, -0.9481735, 4.12897, 0, 0, 0, 1, 1,
0.5925958, 0.4611236, 0.0368315, 0, 0, 0, 1, 1,
0.6017599, 0.536445, -0.4967602, 0, 0, 0, 1, 1,
0.6027911, -0.848579, 3.440085, 0, 0, 0, 1, 1,
0.6062327, 0.6248892, 1.743702, 1, 1, 1, 1, 1,
0.6068496, 0.7849748, 1.03776, 1, 1, 1, 1, 1,
0.6085054, -2.033415, 2.353808, 1, 1, 1, 1, 1,
0.6088271, -0.3241434, 1.451904, 1, 1, 1, 1, 1,
0.6107376, -0.3868184, 3.036545, 1, 1, 1, 1, 1,
0.6118853, 0.4120459, 0.1729283, 1, 1, 1, 1, 1,
0.6144671, -0.6249262, 1.624317, 1, 1, 1, 1, 1,
0.6242872, -1.780203, 3.88569, 1, 1, 1, 1, 1,
0.6267567, -0.8723393, 3.309377, 1, 1, 1, 1, 1,
0.6315125, 0.5596126, -0.2002853, 1, 1, 1, 1, 1,
0.637169, 0.4462741, 1.005597, 1, 1, 1, 1, 1,
0.6389625, 0.02393086, 1.432157, 1, 1, 1, 1, 1,
0.6393977, 0.4762219, 1.714188, 1, 1, 1, 1, 1,
0.6425645, -0.7961965, 1.828906, 1, 1, 1, 1, 1,
0.6428164, 0.8897184, 0.2929186, 1, 1, 1, 1, 1,
0.6442721, -0.108992, 1.755112, 0, 0, 1, 1, 1,
0.6454567, -0.2757477, 2.907696, 1, 0, 0, 1, 1,
0.6544249, 1.190045, 0.2375645, 1, 0, 0, 1, 1,
0.6546482, 0.3489363, 1.356301, 1, 0, 0, 1, 1,
0.6566477, -0.09711723, 2.254162, 1, 0, 0, 1, 1,
0.6609874, -1.137661, 2.26324, 1, 0, 0, 1, 1,
0.661851, -0.1071847, 1.434948, 0, 0, 0, 1, 1,
0.6647562, -0.6683617, 2.397464, 0, 0, 0, 1, 1,
0.6653769, 0.01825818, 0.7641312, 0, 0, 0, 1, 1,
0.6708712, -1.263613, 2.950167, 0, 0, 0, 1, 1,
0.6735656, 0.04911842, 0.5506248, 0, 0, 0, 1, 1,
0.6766323, -0.7156662, 1.504211, 0, 0, 0, 1, 1,
0.6776053, -0.4300035, 1.467723, 0, 0, 0, 1, 1,
0.6847771, 0.5558439, 2.342059, 1, 1, 1, 1, 1,
0.6850138, 1.253227, 0.7109507, 1, 1, 1, 1, 1,
0.6866389, 1.599642, 1.507812, 1, 1, 1, 1, 1,
0.6903089, 0.4231196, 1.365025, 1, 1, 1, 1, 1,
0.6926561, -0.680882, 5.019948, 1, 1, 1, 1, 1,
0.694608, 0.4299189, 2.610302, 1, 1, 1, 1, 1,
0.6953548, -0.4429936, 2.285331, 1, 1, 1, 1, 1,
0.6973873, -0.8760865, 1.689733, 1, 1, 1, 1, 1,
0.699967, -0.526738, 3.209652, 1, 1, 1, 1, 1,
0.7027559, -0.3914096, 2.838844, 1, 1, 1, 1, 1,
0.7063118, 0.6047683, 1.238769, 1, 1, 1, 1, 1,
0.7076471, -1.199157, 2.767365, 1, 1, 1, 1, 1,
0.7097548, 0.2488709, 0.4581932, 1, 1, 1, 1, 1,
0.7103897, 0.2484402, 1.714643, 1, 1, 1, 1, 1,
0.7129279, 0.4588205, 1.422439, 1, 1, 1, 1, 1,
0.7129914, 0.9430122, -0.4977147, 0, 0, 1, 1, 1,
0.7204022, -1.627451, 0.6110502, 1, 0, 0, 1, 1,
0.7236992, -0.558118, 2.204596, 1, 0, 0, 1, 1,
0.7252103, 0.4139265, 0.2396728, 1, 0, 0, 1, 1,
0.7272368, -1.849437, 2.813136, 1, 0, 0, 1, 1,
0.7325446, 0.1469725, 1.717215, 1, 0, 0, 1, 1,
0.7473699, -0.4481208, 1.85212, 0, 0, 0, 1, 1,
0.7530566, -0.4203406, 5.166789, 0, 0, 0, 1, 1,
0.7541914, -1.548458, 3.628469, 0, 0, 0, 1, 1,
0.7558383, -1.080907, 1.842426, 0, 0, 0, 1, 1,
0.7564062, 0.5628335, 1.66173, 0, 0, 0, 1, 1,
0.7571487, -1.39862, 3.50243, 0, 0, 0, 1, 1,
0.7579688, 0.06077957, 0.6584293, 0, 0, 0, 1, 1,
0.7606346, 0.220033, 3.464065, 1, 1, 1, 1, 1,
0.760663, -0.4555392, 3.232031, 1, 1, 1, 1, 1,
0.7612261, 0.4124209, 0.6675399, 1, 1, 1, 1, 1,
0.7763766, 0.7091408, 1.778133, 1, 1, 1, 1, 1,
0.7781676, -0.5672119, 2.151476, 1, 1, 1, 1, 1,
0.7847423, -0.03580425, 2.722534, 1, 1, 1, 1, 1,
0.7859285, -0.5088934, 3.397213, 1, 1, 1, 1, 1,
0.7867435, 1.23685, 1.742705, 1, 1, 1, 1, 1,
0.7886202, -0.005481807, 3.290201, 1, 1, 1, 1, 1,
0.7894724, -0.3388195, 1.730586, 1, 1, 1, 1, 1,
0.7956092, 1.02967, 0.861374, 1, 1, 1, 1, 1,
0.8019068, 0.7259707, 1.504431, 1, 1, 1, 1, 1,
0.8119282, -0.871537, 3.531589, 1, 1, 1, 1, 1,
0.818166, -0.2991145, 0.7364547, 1, 1, 1, 1, 1,
0.8225576, 0.226386, 0.4292291, 1, 1, 1, 1, 1,
0.8265378, 2.060813, 1.166979, 0, 0, 1, 1, 1,
0.8284249, -0.459347, 2.071861, 1, 0, 0, 1, 1,
0.8286397, -0.7087317, 2.720586, 1, 0, 0, 1, 1,
0.8334596, -0.989656, 2.865389, 1, 0, 0, 1, 1,
0.8358974, -0.9549382, 2.213732, 1, 0, 0, 1, 1,
0.8365419, 0.4583209, 1.211706, 1, 0, 0, 1, 1,
0.8441315, 0.3508973, 1.129648, 0, 0, 0, 1, 1,
0.8464921, 0.8642583, 0.7233748, 0, 0, 0, 1, 1,
0.8518582, -0.08245423, 1.444123, 0, 0, 0, 1, 1,
0.8525923, 0.4556459, 0.687937, 0, 0, 0, 1, 1,
0.858303, 1.445108, 0.5832628, 0, 0, 0, 1, 1,
0.8585427, -0.1914364, 1.807603, 0, 0, 0, 1, 1,
0.8593022, -0.250809, 3.224394, 0, 0, 0, 1, 1,
0.8651388, -0.2342125, 1.108323, 1, 1, 1, 1, 1,
0.8688375, 0.8173271, -0.8336985, 1, 1, 1, 1, 1,
0.8699659, 0.7456269, 0.5611148, 1, 1, 1, 1, 1,
0.8707949, 1.104159, 2.785882, 1, 1, 1, 1, 1,
0.8721392, -0.3008316, 0.6117249, 1, 1, 1, 1, 1,
0.8763813, 0.9560456, -0.7486172, 1, 1, 1, 1, 1,
0.8785516, -1.584241, 2.922142, 1, 1, 1, 1, 1,
0.8794016, -0.1528066, 3.163333, 1, 1, 1, 1, 1,
0.8794671, 1.045549, 0.4191303, 1, 1, 1, 1, 1,
0.8823913, -0.3566678, 2.14828, 1, 1, 1, 1, 1,
0.8887323, -0.1562706, 3.175455, 1, 1, 1, 1, 1,
0.89946, -1.021398, 2.799422, 1, 1, 1, 1, 1,
0.9023871, -1.778288, 2.54389, 1, 1, 1, 1, 1,
0.9034203, 0.1580249, -0.8093662, 1, 1, 1, 1, 1,
0.9065453, 0.3161409, 1.91736, 1, 1, 1, 1, 1,
0.907062, -0.2363158, 3.027186, 0, 0, 1, 1, 1,
0.9084901, -0.1454295, 2.634666, 1, 0, 0, 1, 1,
0.9135908, 0.9733351, 0.4515761, 1, 0, 0, 1, 1,
0.9138136, -1.449147, 0.9596391, 1, 0, 0, 1, 1,
0.9147173, 1.001599, -0.6980379, 1, 0, 0, 1, 1,
0.916272, 0.3492613, 0.6813143, 1, 0, 0, 1, 1,
0.9216922, 0.1495599, 2.605163, 0, 0, 0, 1, 1,
0.9218606, -0.3232495, 2.150046, 0, 0, 0, 1, 1,
0.9247506, 1.73963, 1.108297, 0, 0, 0, 1, 1,
0.9253622, -2.11831, 3.666345, 0, 0, 0, 1, 1,
0.9280934, 1.144257, 0.1143626, 0, 0, 0, 1, 1,
0.9381202, 1.346323, 0.9631116, 0, 0, 0, 1, 1,
0.9388204, -0.2827266, 3.002975, 0, 0, 0, 1, 1,
0.9409704, -0.01767988, 1.400216, 1, 1, 1, 1, 1,
0.944194, 0.6106003, 1.62971, 1, 1, 1, 1, 1,
0.9462101, -0.4889109, 1.473091, 1, 1, 1, 1, 1,
0.9477315, 0.2516729, 0.5056284, 1, 1, 1, 1, 1,
0.9477934, 1.706753, 0.5412227, 1, 1, 1, 1, 1,
0.9510117, 0.005452639, 1.358204, 1, 1, 1, 1, 1,
0.9575052, -1.338316, 2.536552, 1, 1, 1, 1, 1,
0.9578711, 1.651922, 0.6646235, 1, 1, 1, 1, 1,
0.9596131, -0.4488749, 1.020045, 1, 1, 1, 1, 1,
0.9611974, -2.165758, 0.9051099, 1, 1, 1, 1, 1,
0.9696658, 1.078204, 0.9023693, 1, 1, 1, 1, 1,
0.97953, -2.428033, 2.929588, 1, 1, 1, 1, 1,
0.9905895, -1.520128, 2.821416, 1, 1, 1, 1, 1,
0.9929019, -0.0868955, 1.405361, 1, 1, 1, 1, 1,
1.003937, 0.6838354, 0.9657948, 1, 1, 1, 1, 1,
1.006229, -0.5682583, 1.301003, 0, 0, 1, 1, 1,
1.008146, -2.407632, 4.365377, 1, 0, 0, 1, 1,
1.010913, 1.285814, 0.571272, 1, 0, 0, 1, 1,
1.012011, 1.090325, -0.8058816, 1, 0, 0, 1, 1,
1.015154, -1.521314, 3.836402, 1, 0, 0, 1, 1,
1.021172, -1.160718, 2.915694, 1, 0, 0, 1, 1,
1.024094, 0.2927939, 1.904818, 0, 0, 0, 1, 1,
1.025176, 0.5292082, -0.1612114, 0, 0, 0, 1, 1,
1.029392, -0.3305034, 3.694806, 0, 0, 0, 1, 1,
1.039279, -1.134681, 0.8649154, 0, 0, 0, 1, 1,
1.039723, 0.7159759, 3.623253, 0, 0, 0, 1, 1,
1.040276, -0.4998973, 0.8469409, 0, 0, 0, 1, 1,
1.043177, -0.5606116, 1.039825, 0, 0, 0, 1, 1,
1.043321, -0.02080206, 2.028563, 1, 1, 1, 1, 1,
1.046892, 0.3910206, 3.038498, 1, 1, 1, 1, 1,
1.047607, -1.465198, 2.874039, 1, 1, 1, 1, 1,
1.050549, -0.703557, 1.72235, 1, 1, 1, 1, 1,
1.057501, 0.1064813, 0.9461068, 1, 1, 1, 1, 1,
1.071715, 1.301711, -0.1945764, 1, 1, 1, 1, 1,
1.074538, 0.7557619, 0.6288823, 1, 1, 1, 1, 1,
1.090669, -0.6451577, 1.195175, 1, 1, 1, 1, 1,
1.100965, -1.959903, 3.989179, 1, 1, 1, 1, 1,
1.107007, 0.111607, 1.337648, 1, 1, 1, 1, 1,
1.110292, 0.7395436, 1.251064, 1, 1, 1, 1, 1,
1.111063, -1.268468, 1.288013, 1, 1, 1, 1, 1,
1.114043, -0.2661759, 2.685007, 1, 1, 1, 1, 1,
1.114403, 0.3326779, -0.1271978, 1, 1, 1, 1, 1,
1.114873, -0.2922915, 1.390074, 1, 1, 1, 1, 1,
1.128419, 0.1481334, 1.752871, 0, 0, 1, 1, 1,
1.131145, -1.660274, 3.413531, 1, 0, 0, 1, 1,
1.135682, -0.3845259, 1.848371, 1, 0, 0, 1, 1,
1.135996, -0.7400655, 3.454091, 1, 0, 0, 1, 1,
1.137982, 0.4473166, 3.038662, 1, 0, 0, 1, 1,
1.140973, 0.522849, 1.8332, 1, 0, 0, 1, 1,
1.142014, 0.5953988, 1.774774, 0, 0, 0, 1, 1,
1.143247, -0.7852523, 2.259994, 0, 0, 0, 1, 1,
1.144014, -0.6208352, 1.871184, 0, 0, 0, 1, 1,
1.144386, 0.5980477, 2.588936, 0, 0, 0, 1, 1,
1.147319, -0.2105384, -0.6927205, 0, 0, 0, 1, 1,
1.151855, 0.9440421, -1.300912, 0, 0, 0, 1, 1,
1.156343, 0.3803912, 1.436267, 0, 0, 0, 1, 1,
1.156537, -0.6940386, 2.348852, 1, 1, 1, 1, 1,
1.156894, 0.6674588, 0.1033051, 1, 1, 1, 1, 1,
1.172433, 1.347847, 1.545888, 1, 1, 1, 1, 1,
1.172583, 1.18443, 0.6958677, 1, 1, 1, 1, 1,
1.17352, 0.7425206, 0.177542, 1, 1, 1, 1, 1,
1.174256, 0.6431763, 0.4969172, 1, 1, 1, 1, 1,
1.180315, -1.47493, 3.685802, 1, 1, 1, 1, 1,
1.185563, -2.439068, 3.215158, 1, 1, 1, 1, 1,
1.193537, -0.3919155, 4.768553, 1, 1, 1, 1, 1,
1.193704, 0.5371462, 0.7091542, 1, 1, 1, 1, 1,
1.195124, 0.3196932, 1.385069, 1, 1, 1, 1, 1,
1.2005, -0.5332094, 0.4170963, 1, 1, 1, 1, 1,
1.212157, 1.705953, 1.997068, 1, 1, 1, 1, 1,
1.233064, 0.1667664, 2.97384, 1, 1, 1, 1, 1,
1.240074, -1.06828, 1.572182, 1, 1, 1, 1, 1,
1.240736, -0.3249631, 1.86412, 0, 0, 1, 1, 1,
1.241508, -0.5077915, 1.680963, 1, 0, 0, 1, 1,
1.2453, -0.1537016, 0.3236208, 1, 0, 0, 1, 1,
1.245396, -0.2240013, 2.910744, 1, 0, 0, 1, 1,
1.247147, 2.469859, -0.1397981, 1, 0, 0, 1, 1,
1.258361, 0.04521835, 2.25274, 1, 0, 0, 1, 1,
1.261555, -0.9175898, 2.639294, 0, 0, 0, 1, 1,
1.265717, 0.4628942, 2.680999, 0, 0, 0, 1, 1,
1.267881, 0.0908171, 0.7954888, 0, 0, 0, 1, 1,
1.278978, -1.700401, 2.931623, 0, 0, 0, 1, 1,
1.283924, -0.4076312, 2.344988, 0, 0, 0, 1, 1,
1.284231, -0.2738596, 2.134047, 0, 0, 0, 1, 1,
1.284565, 0.837315, 2.151362, 0, 0, 0, 1, 1,
1.315047, 0.3824894, 0.1672835, 1, 1, 1, 1, 1,
1.318036, -0.0577617, 1.150907, 1, 1, 1, 1, 1,
1.318504, -0.2717218, 2.341211, 1, 1, 1, 1, 1,
1.329074, -0.3479368, 1.425777, 1, 1, 1, 1, 1,
1.331935, 0.04552365, 0.1977633, 1, 1, 1, 1, 1,
1.338784, 1.163378, 0.9802905, 1, 1, 1, 1, 1,
1.340461, 0.7337552, 0.9613659, 1, 1, 1, 1, 1,
1.348137, 0.1847632, 2.638918, 1, 1, 1, 1, 1,
1.352546, -2.488809, 2.835836, 1, 1, 1, 1, 1,
1.35455, -0.4900551, 0.934387, 1, 1, 1, 1, 1,
1.364927, -0.5839937, 2.687683, 1, 1, 1, 1, 1,
1.366779, -0.7225493, 3.467804, 1, 1, 1, 1, 1,
1.368626, 1.626914, 0.5669354, 1, 1, 1, 1, 1,
1.370656, 1.020275, 1.205912, 1, 1, 1, 1, 1,
1.379955, -0.3340448, 1.351743, 1, 1, 1, 1, 1,
1.403812, 0.5911654, 0.7103338, 0, 0, 1, 1, 1,
1.418097, -0.7939897, 2.984378, 1, 0, 0, 1, 1,
1.421382, 0.3000315, 2.696692, 1, 0, 0, 1, 1,
1.425987, 0.09596666, -0.2745853, 1, 0, 0, 1, 1,
1.442112, -0.9271245, 3.849245, 1, 0, 0, 1, 1,
1.442452, 0.3967351, 0.7151993, 1, 0, 0, 1, 1,
1.450557, 0.9031954, 1.999364, 0, 0, 0, 1, 1,
1.462512, -0.59679, 2.372913, 0, 0, 0, 1, 1,
1.463358, -0.2996547, 0.8764035, 0, 0, 0, 1, 1,
1.467406, -1.267549, 2.371548, 0, 0, 0, 1, 1,
1.472428, -0.5758753, 1.674207, 0, 0, 0, 1, 1,
1.487401, 1.662366, 1.799907, 0, 0, 0, 1, 1,
1.488274, -0.195873, 1.23695, 0, 0, 0, 1, 1,
1.500672, 0.04201148, 0.5428468, 1, 1, 1, 1, 1,
1.517181, 0.8105132, 1.13891, 1, 1, 1, 1, 1,
1.517626, -1.007469, 1.922387, 1, 1, 1, 1, 1,
1.548987, 1.592152, 2.030186, 1, 1, 1, 1, 1,
1.552064, -0.411348, 1.802028, 1, 1, 1, 1, 1,
1.562891, -0.4522837, 2.737151, 1, 1, 1, 1, 1,
1.564144, 0.6571454, 1.386758, 1, 1, 1, 1, 1,
1.58035, 0.9257439, 2.079055, 1, 1, 1, 1, 1,
1.587899, -2.120959, 3.747632, 1, 1, 1, 1, 1,
1.597856, 0.3133099, 2.996836, 1, 1, 1, 1, 1,
1.598589, -0.9475376, 1.356676, 1, 1, 1, 1, 1,
1.612803, -0.03093689, 2.37938, 1, 1, 1, 1, 1,
1.621788, -0.3249232, 0.5188147, 1, 1, 1, 1, 1,
1.623178, 0.5157486, 0.900487, 1, 1, 1, 1, 1,
1.631026, -0.8974177, 3.499632, 1, 1, 1, 1, 1,
1.640681, -1.240396, 1.61973, 0, 0, 1, 1, 1,
1.679923, -0.4381066, 0.296994, 1, 0, 0, 1, 1,
1.692149, -0.5430379, 2.524843, 1, 0, 0, 1, 1,
1.716028, -0.06038674, 2.824415, 1, 0, 0, 1, 1,
1.71926, -1.164556, 2.757737, 1, 0, 0, 1, 1,
1.724695, -1.221695, 3.156696, 1, 0, 0, 1, 1,
1.747599, 1.288509, 0.38993, 0, 0, 0, 1, 1,
1.771457, -0.07039303, 2.195035, 0, 0, 0, 1, 1,
1.813044, 0.9696836, 0.04219542, 0, 0, 0, 1, 1,
1.815649, -0.007163362, 0.9156255, 0, 0, 0, 1, 1,
1.816125, 0.06694265, -0.2190743, 0, 0, 0, 1, 1,
1.838178, -0.5771688, 2.07056, 0, 0, 0, 1, 1,
1.846746, 0.06775887, 0.9200847, 0, 0, 0, 1, 1,
1.853681, 1.140994, 0.1618224, 1, 1, 1, 1, 1,
1.854519, 2.206872, 1.351422, 1, 1, 1, 1, 1,
1.862694, -0.500529, 1.689295, 1, 1, 1, 1, 1,
1.864312, -0.2376237, 1.362775, 1, 1, 1, 1, 1,
1.874623, 0.7661771, -0.0198079, 1, 1, 1, 1, 1,
1.87847, 1.522238, 0.8840392, 1, 1, 1, 1, 1,
1.878594, -0.01982916, 0.6107056, 1, 1, 1, 1, 1,
1.890246, -0.3051217, 1.742992, 1, 1, 1, 1, 1,
1.902938, -0.5207641, 2.19357, 1, 1, 1, 1, 1,
1.917304, 0.9834683, 1.367629, 1, 1, 1, 1, 1,
1.951433, 1.072762, -0.6222712, 1, 1, 1, 1, 1,
1.969247, 0.4994633, 1.767048, 1, 1, 1, 1, 1,
1.978595, 0.1191106, 1.927437, 1, 1, 1, 1, 1,
1.992698, -1.10695, 2.442655, 1, 1, 1, 1, 1,
2.012509, 0.3933716, 0.248178, 1, 1, 1, 1, 1,
2.015244, 0.6627469, 2.14601, 0, 0, 1, 1, 1,
2.028515, -0.7233734, 0.8211018, 1, 0, 0, 1, 1,
2.08023, -0.09911431, 1.086197, 1, 0, 0, 1, 1,
2.101963, 0.3504598, 0.6525942, 1, 0, 0, 1, 1,
2.118859, -0.4396813, 1.360901, 1, 0, 0, 1, 1,
2.198568, -0.4568114, 0.9629014, 1, 0, 0, 1, 1,
2.240899, -0.1919534, 2.027431, 0, 0, 0, 1, 1,
2.283147, 0.3623411, 2.287902, 0, 0, 0, 1, 1,
2.341212, -1.327012, 1.012843, 0, 0, 0, 1, 1,
2.342089, 0.2462288, 1.528582, 0, 0, 0, 1, 1,
2.366415, 1.000755, -0.4601132, 0, 0, 0, 1, 1,
2.436451, -0.2451586, 2.231227, 0, 0, 0, 1, 1,
2.480468, -1.534031, 3.351564, 0, 0, 0, 1, 1,
2.486451, 1.04418, 0.9508768, 1, 1, 1, 1, 1,
2.541447, -1.250967, 1.693633, 1, 1, 1, 1, 1,
2.550169, 0.867696, 1.028741, 1, 1, 1, 1, 1,
2.743499, 1.539557, 0.9900333, 1, 1, 1, 1, 1,
2.837321, 1.421774, 1.285891, 1, 1, 1, 1, 1,
2.916608, 0.9602633, 0.1307053, 1, 1, 1, 1, 1,
3.019728, -0.2066755, 2.550523, 1, 1, 1, 1, 1
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
var radius = 10.19467;
var distance = 35.80835;
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
mvMatrix.translate( 0.006778002, 0.4501896, 0.2705338 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.80835);
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
