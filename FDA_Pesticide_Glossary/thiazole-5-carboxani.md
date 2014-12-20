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
-2.882602, 0.3649462, -3.629841, 1, 0, 0, 1,
-2.816176, 0.5357192, -1.790624, 1, 0.007843138, 0, 1,
-2.601254, -0.2604566, -1.165473, 1, 0.01176471, 0, 1,
-2.546332, -1.010668, -2.386288, 1, 0.01960784, 0, 1,
-2.545156, 0.02521641, -1.093681, 1, 0.02352941, 0, 1,
-2.519482, -0.8463588, -3.423095, 1, 0.03137255, 0, 1,
-2.509876, -0.06500402, -2.210879, 1, 0.03529412, 0, 1,
-2.506847, -1.652989, -1.346552, 1, 0.04313726, 0, 1,
-2.430386, -0.4674258, -2.159276, 1, 0.04705882, 0, 1,
-2.423099, 0.7253366, -0.6635759, 1, 0.05490196, 0, 1,
-2.385068, -0.7792761, -4.658599, 1, 0.05882353, 0, 1,
-2.324729, 0.6698721, -1.42802, 1, 0.06666667, 0, 1,
-2.247253, 2.032558, -2.232168, 1, 0.07058824, 0, 1,
-2.19778, 1.518571, 0.07317562, 1, 0.07843138, 0, 1,
-2.151825, 0.008151048, -1.823086, 1, 0.08235294, 0, 1,
-2.139038, 0.124698, -1.941099, 1, 0.09019608, 0, 1,
-2.105437, 0.2260974, -0.1371717, 1, 0.09411765, 0, 1,
-2.096171, 0.6592554, 0.1843993, 1, 0.1019608, 0, 1,
-2.089821, 1.155091, -1.934171, 1, 0.1098039, 0, 1,
-2.085538, -1.181087, -3.526799, 1, 0.1137255, 0, 1,
-2.084781, -0.3462532, -1.906514, 1, 0.1215686, 0, 1,
-2.042904, -1.692922, -1.490551, 1, 0.1254902, 0, 1,
-2.034387, 1.868792, -1.672339, 1, 0.1333333, 0, 1,
-1.977466, -2.257314, -1.305169, 1, 0.1372549, 0, 1,
-1.959139, 0.8934228, -2.172814, 1, 0.145098, 0, 1,
-1.940681, 0.5883057, 1.059131, 1, 0.1490196, 0, 1,
-1.915537, -1.328023, -3.562906, 1, 0.1568628, 0, 1,
-1.905243, -0.1637311, -1.011818, 1, 0.1607843, 0, 1,
-1.866774, 0.2913224, -2.126906, 1, 0.1686275, 0, 1,
-1.855591, 1.796508, -0.1529551, 1, 0.172549, 0, 1,
-1.82383, -0.9419225, -2.643281, 1, 0.1803922, 0, 1,
-1.790312, 0.6593133, -1.651807, 1, 0.1843137, 0, 1,
-1.789692, 0.7474093, -0.6011955, 1, 0.1921569, 0, 1,
-1.777338, -1.663425, -2.799807, 1, 0.1960784, 0, 1,
-1.775991, 0.06820434, -2.702687, 1, 0.2039216, 0, 1,
-1.758816, -0.2507676, -1.618784, 1, 0.2117647, 0, 1,
-1.747743, -2.138123, -4.314139, 1, 0.2156863, 0, 1,
-1.737251, -0.835853, -1.512569, 1, 0.2235294, 0, 1,
-1.731633, 0.3603735, -1.555636, 1, 0.227451, 0, 1,
-1.716064, 0.8544596, -1.978945, 1, 0.2352941, 0, 1,
-1.715751, -0.3040652, -1.622923, 1, 0.2392157, 0, 1,
-1.705222, 0.2611817, -1.403291, 1, 0.2470588, 0, 1,
-1.693254, -1.138215, -1.114515, 1, 0.2509804, 0, 1,
-1.688641, 0.9300053, -1.078256, 1, 0.2588235, 0, 1,
-1.682028, 1.299344, 0.9355724, 1, 0.2627451, 0, 1,
-1.674956, -0.4799153, -3.826416, 1, 0.2705882, 0, 1,
-1.664619, 0.396406, -0.1888296, 1, 0.2745098, 0, 1,
-1.649464, 0.5396041, -2.472054, 1, 0.282353, 0, 1,
-1.647749, 0.7446554, -1.510968, 1, 0.2862745, 0, 1,
-1.64729, -0.761311, -1.591806, 1, 0.2941177, 0, 1,
-1.647077, -0.6699774, -3.618923, 1, 0.3019608, 0, 1,
-1.636606, -1.796855, -1.841991, 1, 0.3058824, 0, 1,
-1.626541, -0.02271798, -0.5454257, 1, 0.3137255, 0, 1,
-1.621703, -0.6808217, -2.471609, 1, 0.3176471, 0, 1,
-1.621634, -1.004754, -0.814412, 1, 0.3254902, 0, 1,
-1.603724, -0.941174, -2.569444, 1, 0.3294118, 0, 1,
-1.599595, 0.3583534, -2.026872, 1, 0.3372549, 0, 1,
-1.596657, -0.6355188, -3.649139, 1, 0.3411765, 0, 1,
-1.591362, -1.701712, -2.672865, 1, 0.3490196, 0, 1,
-1.579147, -1.083284, -1.984326, 1, 0.3529412, 0, 1,
-1.574426, 0.5746244, -1.729693, 1, 0.3607843, 0, 1,
-1.554429, 0.1439888, -0.6630965, 1, 0.3647059, 0, 1,
-1.551019, 0.04821749, -3.249046, 1, 0.372549, 0, 1,
-1.541624, -0.1024931, 0.1333207, 1, 0.3764706, 0, 1,
-1.541063, 0.1140373, -1.20793, 1, 0.3843137, 0, 1,
-1.531924, 1.25959, -3.023994, 1, 0.3882353, 0, 1,
-1.524747, 0.9736008, -0.8790194, 1, 0.3960784, 0, 1,
-1.522373, 0.1330955, -1.919433, 1, 0.4039216, 0, 1,
-1.522224, 0.356839, -0.9305723, 1, 0.4078431, 0, 1,
-1.499433, 0.5910075, -0.6579068, 1, 0.4156863, 0, 1,
-1.489489, 0.7127958, -0.3142118, 1, 0.4196078, 0, 1,
-1.482324, 0.9372511, -1.227975, 1, 0.427451, 0, 1,
-1.464784, 0.880806, -1.81798, 1, 0.4313726, 0, 1,
-1.463634, -0.1114657, -0.5716875, 1, 0.4392157, 0, 1,
-1.447023, -0.8230602, -0.98182, 1, 0.4431373, 0, 1,
-1.438498, 0.3874355, -3.30209, 1, 0.4509804, 0, 1,
-1.429491, 1.243842, -2.526708, 1, 0.454902, 0, 1,
-1.421796, -0.3341748, 0.2237467, 1, 0.4627451, 0, 1,
-1.417777, -1.583634, -3.529762, 1, 0.4666667, 0, 1,
-1.404806, -0.4784929, -2.269295, 1, 0.4745098, 0, 1,
-1.402561, 1.060977, -2.592374, 1, 0.4784314, 0, 1,
-1.395578, -0.7095271, -2.168779, 1, 0.4862745, 0, 1,
-1.389752, -0.6376008, -0.8607873, 1, 0.4901961, 0, 1,
-1.389627, -1.062324, -3.170054, 1, 0.4980392, 0, 1,
-1.388227, -0.7265844, -1.188972, 1, 0.5058824, 0, 1,
-1.375142, -1.549194, -1.280879, 1, 0.509804, 0, 1,
-1.364391, 0.1553179, -2.195418, 1, 0.5176471, 0, 1,
-1.363077, 0.09294183, -0.8661334, 1, 0.5215687, 0, 1,
-1.356825, 0.8985678, -2.696466, 1, 0.5294118, 0, 1,
-1.349881, -2.166298, -2.699655, 1, 0.5333334, 0, 1,
-1.344835, 0.2839247, -0.8344511, 1, 0.5411765, 0, 1,
-1.343972, 0.2458479, -1.177853, 1, 0.5450981, 0, 1,
-1.335173, 0.2629651, -1.213095, 1, 0.5529412, 0, 1,
-1.310617, -0.5263844, -2.072925, 1, 0.5568628, 0, 1,
-1.310499, 1.76378, -0.9896742, 1, 0.5647059, 0, 1,
-1.296229, 0.1611151, 0.01104225, 1, 0.5686275, 0, 1,
-1.292762, 0.4557487, -0.6122758, 1, 0.5764706, 0, 1,
-1.281812, 1.256981, 0.00768282, 1, 0.5803922, 0, 1,
-1.280675, 0.2185805, -0.4001748, 1, 0.5882353, 0, 1,
-1.280434, 1.530692, -2.891148, 1, 0.5921569, 0, 1,
-1.276651, -1.957286, -1.568627, 1, 0.6, 0, 1,
-1.250606, 0.7757083, -1.559541, 1, 0.6078432, 0, 1,
-1.231342, 0.3400731, -1.747773, 1, 0.6117647, 0, 1,
-1.230067, 0.454248, -1.985164, 1, 0.6196079, 0, 1,
-1.229244, 1.754304, -1.485874, 1, 0.6235294, 0, 1,
-1.227729, -0.5319091, -1.575347, 1, 0.6313726, 0, 1,
-1.212961, 0.02923731, -1.052705, 1, 0.6352941, 0, 1,
-1.20607, 0.4958197, -0.4379457, 1, 0.6431373, 0, 1,
-1.195612, -0.54, -1.477865, 1, 0.6470588, 0, 1,
-1.187252, 0.3576576, -2.424837, 1, 0.654902, 0, 1,
-1.178464, 0.02481579, -2.390791, 1, 0.6588235, 0, 1,
-1.177889, 0.06372359, -1.684775, 1, 0.6666667, 0, 1,
-1.173302, 2.308049, -0.489519, 1, 0.6705883, 0, 1,
-1.16367, -0.1553406, -2.241634, 1, 0.6784314, 0, 1,
-1.16313, -0.8072188, -1.854232, 1, 0.682353, 0, 1,
-1.155241, 1.492506, -1.699653, 1, 0.6901961, 0, 1,
-1.150925, 0.05389357, -1.444697, 1, 0.6941177, 0, 1,
-1.149206, 2.038554, -2.574258, 1, 0.7019608, 0, 1,
-1.149178, 0.9606445, -0.2066443, 1, 0.7098039, 0, 1,
-1.145571, 0.5594863, -1.325363, 1, 0.7137255, 0, 1,
-1.145295, -1.128445, -1.864214, 1, 0.7215686, 0, 1,
-1.142421, -0.03457228, -2.537775, 1, 0.7254902, 0, 1,
-1.139558, -1.684247, -2.657869, 1, 0.7333333, 0, 1,
-1.133908, -1.186122, -2.438437, 1, 0.7372549, 0, 1,
-1.1325, 1.830349, -0.5181694, 1, 0.7450981, 0, 1,
-1.131409, 0.009383108, -0.7572004, 1, 0.7490196, 0, 1,
-1.128164, 1.436191, -0.8410631, 1, 0.7568628, 0, 1,
-1.119273, 1.284135, -3.009004, 1, 0.7607843, 0, 1,
-1.100699, 1.196163, -1.520002, 1, 0.7686275, 0, 1,
-1.095834, -1.447427, -1.118436, 1, 0.772549, 0, 1,
-1.092494, -0.5037325, -0.2806483, 1, 0.7803922, 0, 1,
-1.089851, 0.9172327, -1.283141, 1, 0.7843137, 0, 1,
-1.079292, -0.4759084, -3.381873, 1, 0.7921569, 0, 1,
-1.076666, 1.386986, -0.6153009, 1, 0.7960784, 0, 1,
-1.076519, -0.698332, -0.9597424, 1, 0.8039216, 0, 1,
-1.075947, 0.8669917, -1.749174, 1, 0.8117647, 0, 1,
-1.071079, 1.098019, -0.9941747, 1, 0.8156863, 0, 1,
-1.061974, 1.474755, -1.897137, 1, 0.8235294, 0, 1,
-1.061043, 0.7378157, -1.874924, 1, 0.827451, 0, 1,
-1.057183, 0.5890679, -2.431873, 1, 0.8352941, 0, 1,
-1.04944, -0.5367684, -0.05744167, 1, 0.8392157, 0, 1,
-1.04573, -1.388683, -4.988335, 1, 0.8470588, 0, 1,
-1.038371, 0.6446735, -3.118555, 1, 0.8509804, 0, 1,
-1.033296, 0.9499163, -2.005454, 1, 0.8588235, 0, 1,
-1.026616, 2.702732, -0.2771375, 1, 0.8627451, 0, 1,
-1.025369, -0.324798, -0.7122089, 1, 0.8705882, 0, 1,
-1.02334, -0.6296843, -3.438602, 1, 0.8745098, 0, 1,
-1.02079, 0.7896479, -1.309106, 1, 0.8823529, 0, 1,
-1.016215, 0.9349362, -1.27588, 1, 0.8862745, 0, 1,
-1.004157, 0.1523581, -1.233465, 1, 0.8941177, 0, 1,
-0.9903625, 0.4549684, -1.791885, 1, 0.8980392, 0, 1,
-0.9824417, 0.2954203, -1.25548, 1, 0.9058824, 0, 1,
-0.9715662, 0.848081, -0.6787551, 1, 0.9137255, 0, 1,
-0.962558, -0.002205947, -3.19003, 1, 0.9176471, 0, 1,
-0.9611692, -1.586319, -2.27468, 1, 0.9254902, 0, 1,
-0.960041, -0.3490259, -1.467492, 1, 0.9294118, 0, 1,
-0.9560626, 1.022779, 1.466018, 1, 0.9372549, 0, 1,
-0.9516863, -0.6298496, -2.084777, 1, 0.9411765, 0, 1,
-0.9479148, -1.25921, -5.00781, 1, 0.9490196, 0, 1,
-0.9365801, 0.2244729, -1.942915, 1, 0.9529412, 0, 1,
-0.9363871, 1.380049, -0.2663303, 1, 0.9607843, 0, 1,
-0.9278461, -0.3667835, -1.517385, 1, 0.9647059, 0, 1,
-0.9238247, -0.806926, -1.94058, 1, 0.972549, 0, 1,
-0.9226425, -0.2963528, -2.15085, 1, 0.9764706, 0, 1,
-0.9199235, 2.312991, -0.856768, 1, 0.9843137, 0, 1,
-0.9195191, 0.03475935, -3.678475, 1, 0.9882353, 0, 1,
-0.9194692, -0.4231335, -1.800918, 1, 0.9960784, 0, 1,
-0.9193308, -0.3961299, -3.179382, 0.9960784, 1, 0, 1,
-0.9155763, -1.153051, -0.9673162, 0.9921569, 1, 0, 1,
-0.912717, -0.09773961, -4.815643, 0.9843137, 1, 0, 1,
-0.9114656, -0.3506639, -2.927277, 0.9803922, 1, 0, 1,
-0.9098117, -0.4256697, -1.842059, 0.972549, 1, 0, 1,
-0.9025489, 1.352734, -1.326963, 0.9686275, 1, 0, 1,
-0.9012356, 1.016313, -0.2441588, 0.9607843, 1, 0, 1,
-0.898914, -2.104075, -3.4371, 0.9568627, 1, 0, 1,
-0.8930299, 1.844099, -1.184227, 0.9490196, 1, 0, 1,
-0.8922454, 0.1163837, -3.719396, 0.945098, 1, 0, 1,
-0.8922351, 1.93571, -1.078907, 0.9372549, 1, 0, 1,
-0.8891692, -1.221522, -2.937868, 0.9333333, 1, 0, 1,
-0.8880911, 1.208031, -0.6117032, 0.9254902, 1, 0, 1,
-0.8848433, 1.312052, 0.1575259, 0.9215686, 1, 0, 1,
-0.8811963, -0.4963466, -2.200546, 0.9137255, 1, 0, 1,
-0.8802615, 0.3831345, -1.692732, 0.9098039, 1, 0, 1,
-0.8797644, -0.2189098, -1.328347, 0.9019608, 1, 0, 1,
-0.8791711, -0.04865699, -0.992388, 0.8941177, 1, 0, 1,
-0.8783482, -0.8207961, -3.519241, 0.8901961, 1, 0, 1,
-0.8697639, 0.7516617, -1.700195, 0.8823529, 1, 0, 1,
-0.8689498, -1.43693, -2.081394, 0.8784314, 1, 0, 1,
-0.8666592, 1.158615, -0.760956, 0.8705882, 1, 0, 1,
-0.8643657, -1.016833, -3.274304, 0.8666667, 1, 0, 1,
-0.8587694, -1.033058, -1.952537, 0.8588235, 1, 0, 1,
-0.8555288, 0.6933245, -0.6177089, 0.854902, 1, 0, 1,
-0.8540705, -0.6558254, -2.92557, 0.8470588, 1, 0, 1,
-0.8534843, -0.742528, -1.935834, 0.8431373, 1, 0, 1,
-0.8517417, -0.6291246, -0.03559354, 0.8352941, 1, 0, 1,
-0.8492041, 0.3814069, -1.835805, 0.8313726, 1, 0, 1,
-0.8430519, -0.6201679, -1.510144, 0.8235294, 1, 0, 1,
-0.8330543, 0.6010315, -2.688336, 0.8196079, 1, 0, 1,
-0.8264471, 0.2287114, -2.261977, 0.8117647, 1, 0, 1,
-0.8152095, 0.2923428, -0.9322588, 0.8078431, 1, 0, 1,
-0.8122597, 0.7223324, 0.6207369, 0.8, 1, 0, 1,
-0.8120002, -0.6044468, -1.788724, 0.7921569, 1, 0, 1,
-0.8111529, 0.8089444, -1.768305, 0.7882353, 1, 0, 1,
-0.8048426, 0.6171554, -1.757249, 0.7803922, 1, 0, 1,
-0.7993866, -0.1086193, -0.5923077, 0.7764706, 1, 0, 1,
-0.792928, -0.2453012, -0.556908, 0.7686275, 1, 0, 1,
-0.7849091, 0.664338, -2.417296, 0.7647059, 1, 0, 1,
-0.782199, -0.2027057, -1.741579, 0.7568628, 1, 0, 1,
-0.7804703, -0.1544229, -2.138317, 0.7529412, 1, 0, 1,
-0.7781341, 0.3498073, -2.043241, 0.7450981, 1, 0, 1,
-0.7772313, 0.08659086, -4.509366, 0.7411765, 1, 0, 1,
-0.7769821, -0.2487407, -0.9115832, 0.7333333, 1, 0, 1,
-0.7761626, 0.5216681, -1.604907, 0.7294118, 1, 0, 1,
-0.7696664, 0.599542, -0.5061629, 0.7215686, 1, 0, 1,
-0.7676387, 1.47123, 0.7510996, 0.7176471, 1, 0, 1,
-0.7634676, -2.138045, -3.716246, 0.7098039, 1, 0, 1,
-0.7625384, -0.8193755, -3.710243, 0.7058824, 1, 0, 1,
-0.7616332, 0.1743692, -0.05344492, 0.6980392, 1, 0, 1,
-0.7588299, 1.318147, -0.4359232, 0.6901961, 1, 0, 1,
-0.7583894, -1.879051, -2.471237, 0.6862745, 1, 0, 1,
-0.7548159, 0.449012, 1.033157, 0.6784314, 1, 0, 1,
-0.7541318, -0.09401622, -2.207373, 0.6745098, 1, 0, 1,
-0.7485465, 0.5611613, 0.1740504, 0.6666667, 1, 0, 1,
-0.7484992, 2.440442, -0.2871585, 0.6627451, 1, 0, 1,
-0.7428547, -0.2392781, -2.38975, 0.654902, 1, 0, 1,
-0.7409291, -0.4119508, -1.62787, 0.6509804, 1, 0, 1,
-0.7393396, -0.6147639, -2.961594, 0.6431373, 1, 0, 1,
-0.7385997, 0.8850201, -0.2310213, 0.6392157, 1, 0, 1,
-0.7364994, 0.9613724, -0.9905267, 0.6313726, 1, 0, 1,
-0.7347506, -0.6224983, -4.012038, 0.627451, 1, 0, 1,
-0.7344946, 1.09393, -0.7054961, 0.6196079, 1, 0, 1,
-0.7338651, -2.058745, 0.6738877, 0.6156863, 1, 0, 1,
-0.7298248, 0.009710426, -3.371069, 0.6078432, 1, 0, 1,
-0.7296971, 1.574448, 0.3084245, 0.6039216, 1, 0, 1,
-0.7274532, 0.6679518, -0.9211537, 0.5960785, 1, 0, 1,
-0.723441, 0.9902905, 1.181102, 0.5882353, 1, 0, 1,
-0.7165671, 1.870793, -0.5995274, 0.5843138, 1, 0, 1,
-0.7137969, 0.003262406, -2.373684, 0.5764706, 1, 0, 1,
-0.7125447, -0.4922989, -0.422039, 0.572549, 1, 0, 1,
-0.7081072, -2.440353, -2.089622, 0.5647059, 1, 0, 1,
-0.708028, 0.6434498, 1.362595, 0.5607843, 1, 0, 1,
-0.7077214, 0.3002512, -0.8883497, 0.5529412, 1, 0, 1,
-0.706274, 1.082857, -0.3588756, 0.5490196, 1, 0, 1,
-0.7059154, -0.579146, -3.170371, 0.5411765, 1, 0, 1,
-0.7044412, -1.119343, -3.243418, 0.5372549, 1, 0, 1,
-0.6979166, 0.9853594, -0.3995792, 0.5294118, 1, 0, 1,
-0.6935945, -0.07598251, -1.313253, 0.5254902, 1, 0, 1,
-0.6894822, 0.03413931, -1.999153, 0.5176471, 1, 0, 1,
-0.6893203, 0.09833445, -0.3663048, 0.5137255, 1, 0, 1,
-0.6850164, -1.24471, -2.051908, 0.5058824, 1, 0, 1,
-0.6846232, 0.613905, -1.343755, 0.5019608, 1, 0, 1,
-0.684246, -1.415847, -4.020608, 0.4941176, 1, 0, 1,
-0.6830892, 1.509427, 0.8243248, 0.4862745, 1, 0, 1,
-0.680587, 0.2670806, -2.292479, 0.4823529, 1, 0, 1,
-0.6757632, -0.1931661, -0.09395131, 0.4745098, 1, 0, 1,
-0.6728911, 0.4438079, -2.029286, 0.4705882, 1, 0, 1,
-0.6715701, 0.8487512, -0.3541068, 0.4627451, 1, 0, 1,
-0.6711629, 1.733101, -0.455401, 0.4588235, 1, 0, 1,
-0.670892, -0.5817124, -2.369283, 0.4509804, 1, 0, 1,
-0.6698867, -0.5675623, 0.9350558, 0.4470588, 1, 0, 1,
-0.6631935, 0.3625657, -1.076468, 0.4392157, 1, 0, 1,
-0.6608869, 0.4661078, -3.228009, 0.4352941, 1, 0, 1,
-0.6594419, 0.09378272, -1.105048, 0.427451, 1, 0, 1,
-0.6575189, -0.004511095, -1.858609, 0.4235294, 1, 0, 1,
-0.6545542, -0.548184, -0.9595816, 0.4156863, 1, 0, 1,
-0.649691, -0.3511744, -3.638424, 0.4117647, 1, 0, 1,
-0.6365389, 0.2082517, -1.027614, 0.4039216, 1, 0, 1,
-0.6339555, -0.545781, -3.686397, 0.3960784, 1, 0, 1,
-0.6315276, 3.365353, 0.4259967, 0.3921569, 1, 0, 1,
-0.625695, 0.4179911, -0.4989326, 0.3843137, 1, 0, 1,
-0.6251787, -0.6670365, -2.264576, 0.3803922, 1, 0, 1,
-0.6224394, 0.3681937, -1.285293, 0.372549, 1, 0, 1,
-0.6174725, -1.04983, -1.359324, 0.3686275, 1, 0, 1,
-0.6158, -1.114024, -5.517515, 0.3607843, 1, 0, 1,
-0.611466, 0.5890008, -1.091587, 0.3568628, 1, 0, 1,
-0.6027309, -0.5510443, -1.602359, 0.3490196, 1, 0, 1,
-0.6018334, -0.5292936, -2.773977, 0.345098, 1, 0, 1,
-0.5972158, -1.001647, -3.202523, 0.3372549, 1, 0, 1,
-0.596068, -0.4222578, -1.591996, 0.3333333, 1, 0, 1,
-0.5842281, -0.5332073, -3.453693, 0.3254902, 1, 0, 1,
-0.5827972, -1.649676, -4.266905, 0.3215686, 1, 0, 1,
-0.5791694, 1.872175, -0.8471292, 0.3137255, 1, 0, 1,
-0.5785441, 0.7042128, -1.19582, 0.3098039, 1, 0, 1,
-0.5776445, 0.1301669, -0.6702708, 0.3019608, 1, 0, 1,
-0.576701, -0.9508838, -2.915731, 0.2941177, 1, 0, 1,
-0.5761278, 0.4693267, -1.787808, 0.2901961, 1, 0, 1,
-0.5718679, 0.06591928, -2.669428, 0.282353, 1, 0, 1,
-0.571824, -0.5964985, -2.323097, 0.2784314, 1, 0, 1,
-0.5681065, -0.3843975, -0.9211604, 0.2705882, 1, 0, 1,
-0.5673174, 1.286592, -0.7524297, 0.2666667, 1, 0, 1,
-0.5628995, 2.312619, -0.7304618, 0.2588235, 1, 0, 1,
-0.560513, 0.8046584, 0.9985951, 0.254902, 1, 0, 1,
-0.5593285, -0.9981944, -2.55798, 0.2470588, 1, 0, 1,
-0.5569543, 1.500676, 1.403042, 0.2431373, 1, 0, 1,
-0.5567784, -1.417658, -3.911382, 0.2352941, 1, 0, 1,
-0.5564404, -0.7334983, -1.989718, 0.2313726, 1, 0, 1,
-0.5534316, 0.1995045, -0.9537444, 0.2235294, 1, 0, 1,
-0.5502713, 0.5634974, -0.2126168, 0.2196078, 1, 0, 1,
-0.549569, -1.711034, -1.276664, 0.2117647, 1, 0, 1,
-0.5490295, 0.5108659, -1.622111, 0.2078431, 1, 0, 1,
-0.5473713, -0.2754529, -0.4434889, 0.2, 1, 0, 1,
-0.5467048, -0.8827785, -2.483244, 0.1921569, 1, 0, 1,
-0.5431548, -0.899215, -4.694512, 0.1882353, 1, 0, 1,
-0.5402379, 0.08513926, -0.4396017, 0.1803922, 1, 0, 1,
-0.5385191, -0.1850457, 0.9236128, 0.1764706, 1, 0, 1,
-0.528502, -0.5665401, -3.506137, 0.1686275, 1, 0, 1,
-0.527103, -0.1825381, -3.721955, 0.1647059, 1, 0, 1,
-0.5251034, 0.5415365, 0.4006662, 0.1568628, 1, 0, 1,
-0.5209364, 3.406476, 0.403044, 0.1529412, 1, 0, 1,
-0.5124573, 0.1957899, -1.571672, 0.145098, 1, 0, 1,
-0.5121999, 0.4116805, 0.5212659, 0.1411765, 1, 0, 1,
-0.5096019, -0.8126854, -2.661065, 0.1333333, 1, 0, 1,
-0.5090373, 2.499411, 0.5794663, 0.1294118, 1, 0, 1,
-0.5041117, 0.1075124, -1.421325, 0.1215686, 1, 0, 1,
-0.4921849, -1.443393, -2.280527, 0.1176471, 1, 0, 1,
-0.4913507, -0.4869864, -1.814792, 0.1098039, 1, 0, 1,
-0.4880912, 0.086735, -3.62769, 0.1058824, 1, 0, 1,
-0.4877648, 1.45832, -0.8568165, 0.09803922, 1, 0, 1,
-0.487364, 0.2602544, -3.459214, 0.09019608, 1, 0, 1,
-0.4849159, -0.9314603, -1.633915, 0.08627451, 1, 0, 1,
-0.4845132, 0.316937, -0.3913561, 0.07843138, 1, 0, 1,
-0.4826203, -0.07339754, -3.110687, 0.07450981, 1, 0, 1,
-0.4807209, -0.05128374, 0.2122501, 0.06666667, 1, 0, 1,
-0.4709167, -0.9541725, -2.30907, 0.0627451, 1, 0, 1,
-0.4665279, 0.9619363, 0.9428828, 0.05490196, 1, 0, 1,
-0.4657451, 1.233516, 1.033439, 0.05098039, 1, 0, 1,
-0.4621392, 0.2554228, -0.4608144, 0.04313726, 1, 0, 1,
-0.4604277, -0.4065794, -2.284589, 0.03921569, 1, 0, 1,
-0.4550163, -0.9356002, -2.435997, 0.03137255, 1, 0, 1,
-0.4537013, 1.177572, 1.339103, 0.02745098, 1, 0, 1,
-0.4461428, -0.1019962, -1.89275, 0.01960784, 1, 0, 1,
-0.4395319, -1.151445, -2.864197, 0.01568628, 1, 0, 1,
-0.4389585, -0.9203193, -1.571255, 0.007843138, 1, 0, 1,
-0.4313224, -1.184186, -1.932652, 0.003921569, 1, 0, 1,
-0.4286774, -0.3163587, -0.7997518, 0, 1, 0.003921569, 1,
-0.4263916, 1.401908, 0.171268, 0, 1, 0.01176471, 1,
-0.4249789, -0.8986748, -3.445857, 0, 1, 0.01568628, 1,
-0.423622, 0.6658927, -0.3328078, 0, 1, 0.02352941, 1,
-0.4196741, 0.1046854, 0.8146071, 0, 1, 0.02745098, 1,
-0.4168035, 0.6688627, -0.9471767, 0, 1, 0.03529412, 1,
-0.4153476, -0.9000115, -3.241749, 0, 1, 0.03921569, 1,
-0.4125698, 0.2398739, -2.187014, 0, 1, 0.04705882, 1,
-0.4124991, -0.1019764, -2.500365, 0, 1, 0.05098039, 1,
-0.4111108, -2.128737, -3.887659, 0, 1, 0.05882353, 1,
-0.4078465, 1.0118, -0.7692664, 0, 1, 0.0627451, 1,
-0.4072393, 1.68965, -0.5602664, 0, 1, 0.07058824, 1,
-0.4049203, -0.8708098, -2.07884, 0, 1, 0.07450981, 1,
-0.4045751, -0.5227972, -4.246221, 0, 1, 0.08235294, 1,
-0.3988606, -1.04298, -2.903782, 0, 1, 0.08627451, 1,
-0.3975294, -0.5311703, -1.100294, 0, 1, 0.09411765, 1,
-0.3954239, 1.115341, -0.9799134, 0, 1, 0.1019608, 1,
-0.3943749, 0.8294315, -0.381874, 0, 1, 0.1058824, 1,
-0.3933743, 0.02683807, -1.914356, 0, 1, 0.1137255, 1,
-0.3926464, -0.6935143, -1.755774, 0, 1, 0.1176471, 1,
-0.3924408, -1.999553, -4.787529, 0, 1, 0.1254902, 1,
-0.3889044, -0.3129534, -2.693942, 0, 1, 0.1294118, 1,
-0.383949, -1.125762, -3.456847, 0, 1, 0.1372549, 1,
-0.3784512, 0.9496105, -2.074493, 0, 1, 0.1411765, 1,
-0.3781619, -0.4841891, -4.029333, 0, 1, 0.1490196, 1,
-0.3731396, -1.529469, -2.837507, 0, 1, 0.1529412, 1,
-0.3730429, 0.5590498, 0.1939792, 0, 1, 0.1607843, 1,
-0.3708726, -1.722426, -2.528502, 0, 1, 0.1647059, 1,
-0.3669128, -0.8394696, -3.496536, 0, 1, 0.172549, 1,
-0.3640058, 0.02784946, -1.718058, 0, 1, 0.1764706, 1,
-0.3549647, 0.1276995, -0.1629768, 0, 1, 0.1843137, 1,
-0.3547272, -0.8609436, -3.028391, 0, 1, 0.1882353, 1,
-0.3534177, -1.508357, -2.238428, 0, 1, 0.1960784, 1,
-0.3502049, 0.2996659, -1.115449, 0, 1, 0.2039216, 1,
-0.3494193, 1.184533, -0.2237178, 0, 1, 0.2078431, 1,
-0.3475514, -0.4882948, -1.102175, 0, 1, 0.2156863, 1,
-0.3461087, 0.619018, 0.8623917, 0, 1, 0.2196078, 1,
-0.3441778, -1.758878, -3.076464, 0, 1, 0.227451, 1,
-0.3337346, -0.009302679, -1.178482, 0, 1, 0.2313726, 1,
-0.3316812, 1.7201, 0.05931057, 0, 1, 0.2392157, 1,
-0.3289469, 0.9460994, -0.6845302, 0, 1, 0.2431373, 1,
-0.3274996, 0.9114723, -2.199134, 0, 1, 0.2509804, 1,
-0.3267505, -0.2725435, -0.5056783, 0, 1, 0.254902, 1,
-0.3181436, -0.6445196, -2.458034, 0, 1, 0.2627451, 1,
-0.3170687, -0.8502677, -2.521605, 0, 1, 0.2666667, 1,
-0.3163788, 1.22037, 0.2471462, 0, 1, 0.2745098, 1,
-0.315055, -0.506947, -2.558091, 0, 1, 0.2784314, 1,
-0.3140461, 0.4978516, -1.699821, 0, 1, 0.2862745, 1,
-0.3083458, 1.767796, -0.6806347, 0, 1, 0.2901961, 1,
-0.3066762, -0.6932677, -1.128473, 0, 1, 0.2980392, 1,
-0.3018712, -0.4571274, -5.903857, 0, 1, 0.3058824, 1,
-0.2995689, -0.8832681, -4.625662, 0, 1, 0.3098039, 1,
-0.2984081, -0.9372956, -2.51896, 0, 1, 0.3176471, 1,
-0.296873, 0.782517, 0.4223322, 0, 1, 0.3215686, 1,
-0.2966594, -0.1368632, -1.829203, 0, 1, 0.3294118, 1,
-0.2949503, 0.3622272, 1.409578, 0, 1, 0.3333333, 1,
-0.291739, 1.468681, -0.7074074, 0, 1, 0.3411765, 1,
-0.2873367, 1.222633, -0.2190288, 0, 1, 0.345098, 1,
-0.2869075, 2.644341, -2.56527, 0, 1, 0.3529412, 1,
-0.2840005, -1.296949, -2.780163, 0, 1, 0.3568628, 1,
-0.2788586, 0.722059, -2.009702, 0, 1, 0.3647059, 1,
-0.2766356, -2.389007, -2.684272, 0, 1, 0.3686275, 1,
-0.2745185, 0.6941635, -1.651803, 0, 1, 0.3764706, 1,
-0.273331, -0.2711162, -1.740618, 0, 1, 0.3803922, 1,
-0.2718378, -1.009894, -3.005335, 0, 1, 0.3882353, 1,
-0.2684104, 1.002491, 1.119502, 0, 1, 0.3921569, 1,
-0.2664054, 1.677426, -1.124231, 0, 1, 0.4, 1,
-0.264858, -0.127741, -2.810596, 0, 1, 0.4078431, 1,
-0.2616136, -0.239227, -2.416698, 0, 1, 0.4117647, 1,
-0.2592651, -0.5727646, -2.187505, 0, 1, 0.4196078, 1,
-0.2583556, 1.392991, 0.5049666, 0, 1, 0.4235294, 1,
-0.2572049, 0.6646818, -0.2724993, 0, 1, 0.4313726, 1,
-0.256351, 1.078731, -0.1239756, 0, 1, 0.4352941, 1,
-0.2556246, -0.3995354, -2.166366, 0, 1, 0.4431373, 1,
-0.2549222, 0.8327036, -0.5780186, 0, 1, 0.4470588, 1,
-0.2520741, 1.205813, 0.5338592, 0, 1, 0.454902, 1,
-0.2516894, 2.344213, 0.6954631, 0, 1, 0.4588235, 1,
-0.247336, -0.3967512, -2.495481, 0, 1, 0.4666667, 1,
-0.246982, -0.4677351, -3.54523, 0, 1, 0.4705882, 1,
-0.2458478, -1.45198, -2.168664, 0, 1, 0.4784314, 1,
-0.2455533, 0.3984509, -0.5137816, 0, 1, 0.4823529, 1,
-0.2423192, 0.4521783, -0.7258867, 0, 1, 0.4901961, 1,
-0.2350624, 0.4105244, -1.057596, 0, 1, 0.4941176, 1,
-0.2307374, 0.2265695, -1.197712, 0, 1, 0.5019608, 1,
-0.2307047, 1.370484, -0.3637348, 0, 1, 0.509804, 1,
-0.2304543, -0.9525192, -1.395175, 0, 1, 0.5137255, 1,
-0.2283458, 3.340155, -1.390399, 0, 1, 0.5215687, 1,
-0.2225685, -0.7614129, -2.034808, 0, 1, 0.5254902, 1,
-0.2212975, 1.805146, -1.26672, 0, 1, 0.5333334, 1,
-0.2194739, -0.770824, -3.013544, 0, 1, 0.5372549, 1,
-0.2174624, 2.376661, 1.494115, 0, 1, 0.5450981, 1,
-0.2103469, 0.07679104, 1.033307, 0, 1, 0.5490196, 1,
-0.2093584, 2.743685, 1.615399, 0, 1, 0.5568628, 1,
-0.2080582, -1.048124, -3.740915, 0, 1, 0.5607843, 1,
-0.2070125, -0.7794694, -2.845489, 0, 1, 0.5686275, 1,
-0.2062909, 0.4506724, 0.2588804, 0, 1, 0.572549, 1,
-0.2048647, 1.987812, -0.7195109, 0, 1, 0.5803922, 1,
-0.2047228, 1.633671, 0.3759574, 0, 1, 0.5843138, 1,
-0.2034263, -0.8871669, -2.451199, 0, 1, 0.5921569, 1,
-0.2000935, 0.5239622, -0.325167, 0, 1, 0.5960785, 1,
-0.1999161, -0.3139993, -3.892706, 0, 1, 0.6039216, 1,
-0.1990196, -0.8020865, -2.396674, 0, 1, 0.6117647, 1,
-0.19303, 0.661733, -0.1554726, 0, 1, 0.6156863, 1,
-0.1907525, 1.355392, -0.6760202, 0, 1, 0.6235294, 1,
-0.1883748, 0.06834856, -1.03265, 0, 1, 0.627451, 1,
-0.1837642, 0.8259865, -0.4874136, 0, 1, 0.6352941, 1,
-0.1827312, 0.6592261, -1.645589, 0, 1, 0.6392157, 1,
-0.1820271, -0.004431119, -2.154301, 0, 1, 0.6470588, 1,
-0.1791025, 0.481895, -3.373696, 0, 1, 0.6509804, 1,
-0.1788131, -0.8328769, -3.219332, 0, 1, 0.6588235, 1,
-0.1787993, -1.528236, -2.801106, 0, 1, 0.6627451, 1,
-0.1774903, -0.3433788, -3.601882, 0, 1, 0.6705883, 1,
-0.1766795, 1.067528, -1.343657, 0, 1, 0.6745098, 1,
-0.1766487, 0.2403146, -1.181927, 0, 1, 0.682353, 1,
-0.1756392, 0.5487166, -2.523472, 0, 1, 0.6862745, 1,
-0.1698269, 0.4261196, -0.6184583, 0, 1, 0.6941177, 1,
-0.16797, -1.90549, -1.85364, 0, 1, 0.7019608, 1,
-0.1643209, 0.9890011, -0.250701, 0, 1, 0.7058824, 1,
-0.1564258, -0.1055495, -2.216676, 0, 1, 0.7137255, 1,
-0.1563904, 1.347321, -0.6054762, 0, 1, 0.7176471, 1,
-0.1562299, -1.003391, -1.191216, 0, 1, 0.7254902, 1,
-0.1557909, -0.416921, -2.939425, 0, 1, 0.7294118, 1,
-0.1529762, -0.9274223, -3.350842, 0, 1, 0.7372549, 1,
-0.1507875, -0.5177378, -2.274141, 0, 1, 0.7411765, 1,
-0.1497215, -1.250263, -3.001753, 0, 1, 0.7490196, 1,
-0.1491452, -0.4943712, -2.202121, 0, 1, 0.7529412, 1,
-0.1447543, -0.2635972, -3.348589, 0, 1, 0.7607843, 1,
-0.1433438, -0.1010102, -1.029462, 0, 1, 0.7647059, 1,
-0.1337711, -0.587359, -3.015525, 0, 1, 0.772549, 1,
-0.1289994, -1.076948, -4.290206, 0, 1, 0.7764706, 1,
-0.1282825, -0.6038815, -3.457247, 0, 1, 0.7843137, 1,
-0.126655, -0.1401222, -4.019023, 0, 1, 0.7882353, 1,
-0.1224425, 0.4011581, 2.12292, 0, 1, 0.7960784, 1,
-0.1189494, 0.3481736, 0.5126081, 0, 1, 0.8039216, 1,
-0.1188892, 0.2462028, 1.431453, 0, 1, 0.8078431, 1,
-0.1169177, -0.5464113, -1.730399, 0, 1, 0.8156863, 1,
-0.11169, -1.684739, -2.941611, 0, 1, 0.8196079, 1,
-0.110134, 1.867462, -0.4110322, 0, 1, 0.827451, 1,
-0.1098695, -0.7408332, -3.536177, 0, 1, 0.8313726, 1,
-0.1011347, 0.2119746, -0.589857, 0, 1, 0.8392157, 1,
-0.09780855, 0.3957187, -1.577794, 0, 1, 0.8431373, 1,
-0.09699091, 0.9364598, 1.056487, 0, 1, 0.8509804, 1,
-0.09457722, -0.1981065, -2.617222, 0, 1, 0.854902, 1,
-0.09438141, 1.409905, 0.846745, 0, 1, 0.8627451, 1,
-0.09239929, -0.07095936, -2.518691, 0, 1, 0.8666667, 1,
-0.09143928, 0.4014811, 0.2603029, 0, 1, 0.8745098, 1,
-0.09135858, -0.1574834, -2.264418, 0, 1, 0.8784314, 1,
-0.09007311, 0.7356584, 0.03901181, 0, 1, 0.8862745, 1,
-0.08899172, -1.551466, -5.046849, 0, 1, 0.8901961, 1,
-0.08578752, -0.2064753, -2.99601, 0, 1, 0.8980392, 1,
-0.06313478, 0.1349162, -0.9191146, 0, 1, 0.9058824, 1,
-0.06150002, 0.01882797, -0.6208059, 0, 1, 0.9098039, 1,
-0.05513996, -0.7982062, -3.30867, 0, 1, 0.9176471, 1,
-0.05430247, 0.3684572, -0.712395, 0, 1, 0.9215686, 1,
-0.05395069, -1.139189, -1.916977, 0, 1, 0.9294118, 1,
-0.05295486, -1.914288, -3.743606, 0, 1, 0.9333333, 1,
-0.0521973, -0.2245176, -4.268891, 0, 1, 0.9411765, 1,
-0.04782131, 0.02200506, -0.29334, 0, 1, 0.945098, 1,
-0.04576788, -0.5981207, -2.944964, 0, 1, 0.9529412, 1,
-0.03735188, 1.656982, 0.5355636, 0, 1, 0.9568627, 1,
-0.03439637, -1.031806, -3.300051, 0, 1, 0.9647059, 1,
-0.03404916, 0.3648479, 0.5938781, 0, 1, 0.9686275, 1,
-0.02700743, 1.178202, -0.4441878, 0, 1, 0.9764706, 1,
-0.02246189, 3.282153, 1.118706, 0, 1, 0.9803922, 1,
-0.01676373, -0.3506638, -3.376975, 0, 1, 0.9882353, 1,
-0.01604097, 1.148737, -0.160195, 0, 1, 0.9921569, 1,
-0.01118148, 0.8400086, -0.8012075, 0, 1, 1, 1,
-0.007305493, 0.627035, -0.3156668, 0, 0.9921569, 1, 1,
-0.0071028, -0.7764938, -3.407617, 0, 0.9882353, 1, 1,
-0.0002567216, 0.4096006, 0.6905708, 0, 0.9803922, 1, 1,
0.003704365, 0.1228782, 2.439068, 0, 0.9764706, 1, 1,
0.004393301, -1.668214, 3.201556, 0, 0.9686275, 1, 1,
0.008339729, 0.8832422, -1.128136, 0, 0.9647059, 1, 1,
0.009665668, 0.879246, -0.2094229, 0, 0.9568627, 1, 1,
0.02207261, -0.9991867, 2.562871, 0, 0.9529412, 1, 1,
0.02624379, 0.4523054, 1.691667, 0, 0.945098, 1, 1,
0.02986766, -0.9929158, 3.032594, 0, 0.9411765, 1, 1,
0.03452607, 0.07036517, -0.4910008, 0, 0.9333333, 1, 1,
0.03811011, -0.6582993, 3.263655, 0, 0.9294118, 1, 1,
0.04036806, 0.02698639, 1.220495, 0, 0.9215686, 1, 1,
0.04148317, 0.04266832, 0.3261032, 0, 0.9176471, 1, 1,
0.04268591, -0.8553048, 4.738892, 0, 0.9098039, 1, 1,
0.04390123, -1.080343, 1.716679, 0, 0.9058824, 1, 1,
0.0452788, 0.2099096, -1.994191, 0, 0.8980392, 1, 1,
0.04563067, 0.8221074, -0.6402401, 0, 0.8901961, 1, 1,
0.046997, -0.8311012, 2.987119, 0, 0.8862745, 1, 1,
0.04791364, 1.901822, 0.6325081, 0, 0.8784314, 1, 1,
0.05170344, -0.2077998, 2.761888, 0, 0.8745098, 1, 1,
0.05338382, 1.048035, -0.0283633, 0, 0.8666667, 1, 1,
0.05339687, 0.3013544, 0.3603097, 0, 0.8627451, 1, 1,
0.05421326, 0.144235, 0.9923615, 0, 0.854902, 1, 1,
0.05469433, -1.072347, 3.272903, 0, 0.8509804, 1, 1,
0.05610856, 1.263882, -1.054725, 0, 0.8431373, 1, 1,
0.05611139, 2.408339, -0.4100419, 0, 0.8392157, 1, 1,
0.06348499, -0.3762982, 2.120543, 0, 0.8313726, 1, 1,
0.06532095, -0.005402368, 1.345083, 0, 0.827451, 1, 1,
0.06880435, -0.4277519, 2.789886, 0, 0.8196079, 1, 1,
0.07026332, 1.939413, 2.078814, 0, 0.8156863, 1, 1,
0.07410235, -0.05225106, 1.417295, 0, 0.8078431, 1, 1,
0.07530662, -1.510427, 3.359226, 0, 0.8039216, 1, 1,
0.07810866, 1.277424, 0.8349466, 0, 0.7960784, 1, 1,
0.07842381, 0.063008, 2.690941, 0, 0.7882353, 1, 1,
0.07928031, 0.2553559, 1.031828, 0, 0.7843137, 1, 1,
0.07936091, -0.9812529, 1.586533, 0, 0.7764706, 1, 1,
0.07944033, 1.126465, 0.2708461, 0, 0.772549, 1, 1,
0.08845468, 0.4370803, 0.6403472, 0, 0.7647059, 1, 1,
0.08960123, 0.5122893, 0.1744918, 0, 0.7607843, 1, 1,
0.09842506, 0.06100565, 1.418237, 0, 0.7529412, 1, 1,
0.09862997, -0.1845298, 2.868144, 0, 0.7490196, 1, 1,
0.09964413, 1.128921, -2.160248, 0, 0.7411765, 1, 1,
0.1032261, 0.04089236, 1.133951, 0, 0.7372549, 1, 1,
0.1037346, -0.7624286, 2.877532, 0, 0.7294118, 1, 1,
0.1065298, -0.9805133, 3.634253, 0, 0.7254902, 1, 1,
0.1081071, 0.3002939, 0.3141773, 0, 0.7176471, 1, 1,
0.1114098, 0.6621804, -0.3420416, 0, 0.7137255, 1, 1,
0.1122451, 0.5653785, 0.3089844, 0, 0.7058824, 1, 1,
0.1146918, 1.210044, 1.315526, 0, 0.6980392, 1, 1,
0.1231862, -0.3863728, 2.60781, 0, 0.6941177, 1, 1,
0.1233239, -0.1215187, 2.658663, 0, 0.6862745, 1, 1,
0.1281729, 1.033293, 0.2330989, 0, 0.682353, 1, 1,
0.1299194, -0.2781692, 1.719046, 0, 0.6745098, 1, 1,
0.1313923, 0.8234634, 0.7061381, 0, 0.6705883, 1, 1,
0.1315098, -0.7779144, 2.854285, 0, 0.6627451, 1, 1,
0.1327488, -0.7734337, 3.168956, 0, 0.6588235, 1, 1,
0.1343435, 0.3605117, 0.6972341, 0, 0.6509804, 1, 1,
0.1347175, 2.211681, 0.7881948, 0, 0.6470588, 1, 1,
0.1359458, -0.3896511, 4.727048, 0, 0.6392157, 1, 1,
0.1390858, 0.3639102, 1.2929, 0, 0.6352941, 1, 1,
0.1391991, -0.4165294, 3.051596, 0, 0.627451, 1, 1,
0.1395396, 0.1486362, 0.04352308, 0, 0.6235294, 1, 1,
0.1442295, 0.8798111, 0.6781371, 0, 0.6156863, 1, 1,
0.1562528, 0.1670391, 1.405842, 0, 0.6117647, 1, 1,
0.1599513, 0.6127713, -1.111206, 0, 0.6039216, 1, 1,
0.1655306, 0.03898557, 1.417409, 0, 0.5960785, 1, 1,
0.1658283, 0.7555435, 1.088451, 0, 0.5921569, 1, 1,
0.1694118, -1.242431, 4.248244, 0, 0.5843138, 1, 1,
0.1722139, -1.385371, 2.509491, 0, 0.5803922, 1, 1,
0.1779203, 0.6924794, 1.510845, 0, 0.572549, 1, 1,
0.1781019, 0.8955271, -0.9686561, 0, 0.5686275, 1, 1,
0.1820476, 1.351743, -1.563684, 0, 0.5607843, 1, 1,
0.1846642, -0.8207802, 3.617305, 0, 0.5568628, 1, 1,
0.1885467, -0.4154359, 2.935347, 0, 0.5490196, 1, 1,
0.1957766, 0.5154735, -0.3675856, 0, 0.5450981, 1, 1,
0.197139, 0.5355143, -1.429949, 0, 0.5372549, 1, 1,
0.202031, 1.121548, -0.5409567, 0, 0.5333334, 1, 1,
0.2021311, -0.4079638, 3.025619, 0, 0.5254902, 1, 1,
0.2029439, 1.879481, -0.03548111, 0, 0.5215687, 1, 1,
0.2048312, 1.019452, -1.877085, 0, 0.5137255, 1, 1,
0.212066, -0.4462764, 1.558948, 0, 0.509804, 1, 1,
0.2127026, -0.4960242, 3.126399, 0, 0.5019608, 1, 1,
0.2145957, 1.417097, -0.8079302, 0, 0.4941176, 1, 1,
0.215427, 0.1052009, 0.7511106, 0, 0.4901961, 1, 1,
0.2172028, -0.5964352, 1.778641, 0, 0.4823529, 1, 1,
0.2178963, 0.1200338, 0.8289192, 0, 0.4784314, 1, 1,
0.222979, -0.6590357, 2.302906, 0, 0.4705882, 1, 1,
0.2257253, 0.06967265, 1.161934, 0, 0.4666667, 1, 1,
0.2261558, 0.04164289, 1.925657, 0, 0.4588235, 1, 1,
0.2311249, 0.1262677, 2.35694, 0, 0.454902, 1, 1,
0.2356125, -0.1000918, 2.740479, 0, 0.4470588, 1, 1,
0.2357971, 0.6764897, 0.07137863, 0, 0.4431373, 1, 1,
0.240408, 1.361755, -0.795825, 0, 0.4352941, 1, 1,
0.2466795, -1.368684, 2.797858, 0, 0.4313726, 1, 1,
0.2469603, 0.009394457, 0.1587206, 0, 0.4235294, 1, 1,
0.248858, 1.360639, -0.8438071, 0, 0.4196078, 1, 1,
0.2535699, -1.486486, 3.425214, 0, 0.4117647, 1, 1,
0.2562117, -0.3887958, 3.305948, 0, 0.4078431, 1, 1,
0.259712, 1.424822, -0.9209094, 0, 0.4, 1, 1,
0.2681298, 0.02871251, 1.730281, 0, 0.3921569, 1, 1,
0.2691975, -0.3448056, 3.376298, 0, 0.3882353, 1, 1,
0.2723344, -1.915989, 3.42689, 0, 0.3803922, 1, 1,
0.2743371, -1.470035, 1.610455, 0, 0.3764706, 1, 1,
0.2794202, -1.040187, 4.19794, 0, 0.3686275, 1, 1,
0.2871204, 0.7693958, 1.154449, 0, 0.3647059, 1, 1,
0.287585, 0.2719806, 0.1819526, 0, 0.3568628, 1, 1,
0.2889739, 1.083902, 0.9128529, 0, 0.3529412, 1, 1,
0.2897514, 0.4603272, 0.1988151, 0, 0.345098, 1, 1,
0.296335, -0.4259661, 0.9796723, 0, 0.3411765, 1, 1,
0.2994763, 0.3509359, 0.7331572, 0, 0.3333333, 1, 1,
0.2995568, -2.48736, 2.872751, 0, 0.3294118, 1, 1,
0.3001594, 2.076796, -1.078095, 0, 0.3215686, 1, 1,
0.3057838, -0.7097875, 3.700803, 0, 0.3176471, 1, 1,
0.3067113, -0.5956104, 2.877138, 0, 0.3098039, 1, 1,
0.3076371, -0.739288, 2.135597, 0, 0.3058824, 1, 1,
0.308905, -1.856284, 3.765548, 0, 0.2980392, 1, 1,
0.3093343, -1.595271, 4.134354, 0, 0.2901961, 1, 1,
0.3146427, 0.3967912, 1.070546, 0, 0.2862745, 1, 1,
0.3154653, 0.5757857, 2.276515, 0, 0.2784314, 1, 1,
0.3161206, -0.4385549, 3.356919, 0, 0.2745098, 1, 1,
0.3171957, -1.118219, 2.699454, 0, 0.2666667, 1, 1,
0.3196528, 0.3620182, 1.03853, 0, 0.2627451, 1, 1,
0.319758, -0.2882369, 2.692768, 0, 0.254902, 1, 1,
0.3201294, 1.486712, 2.510509, 0, 0.2509804, 1, 1,
0.3272747, 0.7770427, -0.6077998, 0, 0.2431373, 1, 1,
0.329084, -1.053703, 3.627135, 0, 0.2392157, 1, 1,
0.3309911, 0.2862273, 1.414878, 0, 0.2313726, 1, 1,
0.3324114, 0.449444, 0.3507132, 0, 0.227451, 1, 1,
0.3346605, -0.3287733, 2.963193, 0, 0.2196078, 1, 1,
0.334898, 0.05740726, 2.945721, 0, 0.2156863, 1, 1,
0.3362122, 1.283859, 0.6498869, 0, 0.2078431, 1, 1,
0.3370483, 0.9219491, 2.357838, 0, 0.2039216, 1, 1,
0.3371083, 0.02581676, 1.954535, 0, 0.1960784, 1, 1,
0.341462, 0.8478479, -0.7346534, 0, 0.1882353, 1, 1,
0.346044, 0.09642377, 2.487807, 0, 0.1843137, 1, 1,
0.3479423, 0.3097242, 1.510994, 0, 0.1764706, 1, 1,
0.3489969, 0.637078, -0.8595122, 0, 0.172549, 1, 1,
0.3508112, -1.539921, 2.154576, 0, 0.1647059, 1, 1,
0.3586781, -1.188963, 1.650947, 0, 0.1607843, 1, 1,
0.3600142, 0.9087226, 0.2417974, 0, 0.1529412, 1, 1,
0.3637074, 0.07574011, 0.7231784, 0, 0.1490196, 1, 1,
0.3646142, -0.1642703, 2.455191, 0, 0.1411765, 1, 1,
0.364953, 0.2561816, 2.04405, 0, 0.1372549, 1, 1,
0.3703745, 0.7346261, 1.212707, 0, 0.1294118, 1, 1,
0.3765362, 1.221919, -0.2336909, 0, 0.1254902, 1, 1,
0.3787144, -1.60388, 3.709397, 0, 0.1176471, 1, 1,
0.379382, 0.8404358, 0.08279248, 0, 0.1137255, 1, 1,
0.3823467, 2.102321, 0.186378, 0, 0.1058824, 1, 1,
0.3839069, 0.6049913, 2.456852, 0, 0.09803922, 1, 1,
0.3840009, 0.8271968, -0.07355473, 0, 0.09411765, 1, 1,
0.3849309, 0.8490495, -1.181273, 0, 0.08627451, 1, 1,
0.391858, -0.04024773, 2.283974, 0, 0.08235294, 1, 1,
0.3940635, -0.3082241, 1.463584, 0, 0.07450981, 1, 1,
0.3952815, 1.419532, 1.630187, 0, 0.07058824, 1, 1,
0.3986947, -0.008292101, 1.300588, 0, 0.0627451, 1, 1,
0.3990372, -0.9109163, 2.971684, 0, 0.05882353, 1, 1,
0.399788, 0.7679619, 0.7820182, 0, 0.05098039, 1, 1,
0.3999266, 1.429949, -1.843564, 0, 0.04705882, 1, 1,
0.4014648, -0.04492747, 2.061621, 0, 0.03921569, 1, 1,
0.4019433, -1.323547, 2.574679, 0, 0.03529412, 1, 1,
0.4029834, -0.0771129, 0.1806375, 0, 0.02745098, 1, 1,
0.4036645, 1.203262, 0.8012821, 0, 0.02352941, 1, 1,
0.4074587, -2.174541, 2.880957, 0, 0.01568628, 1, 1,
0.4100875, -4.304595, 1.616303, 0, 0.01176471, 1, 1,
0.4126955, -0.6864461, 1.99887, 0, 0.003921569, 1, 1,
0.4129547, -1.081339, 2.26035, 0.003921569, 0, 1, 1,
0.4168411, 0.9932233, 0.8191549, 0.007843138, 0, 1, 1,
0.4174831, -0.5182206, 3.840492, 0.01568628, 0, 1, 1,
0.4183109, -0.6528609, 3.607128, 0.01960784, 0, 1, 1,
0.4191438, 1.115212, 0.5970024, 0.02745098, 0, 1, 1,
0.4270751, 0.8485407, 2.77173, 0.03137255, 0, 1, 1,
0.4278013, -0.25623, 1.794722, 0.03921569, 0, 1, 1,
0.428417, 1.432984, -0.186374, 0.04313726, 0, 1, 1,
0.432851, 1.491241, 1.432227, 0.05098039, 0, 1, 1,
0.4367896, 0.4439822, 0.9005755, 0.05490196, 0, 1, 1,
0.4445021, 0.03884562, 1.556625, 0.0627451, 0, 1, 1,
0.4449379, -0.3996316, 2.386523, 0.06666667, 0, 1, 1,
0.447962, 1.686373, -0.360029, 0.07450981, 0, 1, 1,
0.45093, -1.187305, 3.168489, 0.07843138, 0, 1, 1,
0.4593936, -2.596345, 3.805245, 0.08627451, 0, 1, 1,
0.4619112, 0.4122461, 0.8648241, 0.09019608, 0, 1, 1,
0.4626563, -0.2321982, 1.652661, 0.09803922, 0, 1, 1,
0.4631388, 0.6459358, 0.4769133, 0.1058824, 0, 1, 1,
0.4660912, 1.033622, -0.3900341, 0.1098039, 0, 1, 1,
0.4680317, 0.9143647, -0.2514103, 0.1176471, 0, 1, 1,
0.4696821, 0.871958, 0.02643844, 0.1215686, 0, 1, 1,
0.4697761, -0.7312273, 3.820049, 0.1294118, 0, 1, 1,
0.4759594, 0.208847, 1.983513, 0.1333333, 0, 1, 1,
0.4761214, -0.2352991, 1.747428, 0.1411765, 0, 1, 1,
0.4770534, -0.1498857, 1.787919, 0.145098, 0, 1, 1,
0.4783755, 0.9339249, -1.529326, 0.1529412, 0, 1, 1,
0.4789105, -0.0380841, 2.314236, 0.1568628, 0, 1, 1,
0.4853254, 1.066772, -0.9247401, 0.1647059, 0, 1, 1,
0.4855698, 0.2499666, 1.075894, 0.1686275, 0, 1, 1,
0.489369, 0.4866289, -0.2521707, 0.1764706, 0, 1, 1,
0.4896904, 2.069781, 0.50207, 0.1803922, 0, 1, 1,
0.4905658, 0.8767793, 0.4066453, 0.1882353, 0, 1, 1,
0.4917004, 0.930995, 0.1181769, 0.1921569, 0, 1, 1,
0.4951457, 0.6024833, 1.081635, 0.2, 0, 1, 1,
0.4965955, -0.5340265, 3.358062, 0.2078431, 0, 1, 1,
0.5005545, -0.7145431, 2.494332, 0.2117647, 0, 1, 1,
0.5012861, 0.3627215, 2.403763, 0.2196078, 0, 1, 1,
0.505868, -2.678713, 1.410099, 0.2235294, 0, 1, 1,
0.5144195, 0.4025944, 1.368426, 0.2313726, 0, 1, 1,
0.5151271, 0.1783258, 1.766367, 0.2352941, 0, 1, 1,
0.5173464, 1.039652, 1.927686, 0.2431373, 0, 1, 1,
0.5178788, -1.747458, 3.686083, 0.2470588, 0, 1, 1,
0.5181071, 0.3997637, 2.543768, 0.254902, 0, 1, 1,
0.5181608, 0.4009092, 0.6101525, 0.2588235, 0, 1, 1,
0.5221041, 0.70416, -0.5091592, 0.2666667, 0, 1, 1,
0.5247921, 1.008726, -1.298367, 0.2705882, 0, 1, 1,
0.5254433, -0.2588663, 1.317335, 0.2784314, 0, 1, 1,
0.5264029, -0.8636687, 2.572471, 0.282353, 0, 1, 1,
0.5280403, -0.2551536, 0.9078263, 0.2901961, 0, 1, 1,
0.533146, -0.3899335, 1.483695, 0.2941177, 0, 1, 1,
0.547127, -2.061824, 1.465762, 0.3019608, 0, 1, 1,
0.5504235, 1.870932, 1.840794, 0.3098039, 0, 1, 1,
0.5542414, 0.6748649, 0.9240254, 0.3137255, 0, 1, 1,
0.5571033, -0.9071265, 0.8655383, 0.3215686, 0, 1, 1,
0.5574722, -0.2251043, 1.638119, 0.3254902, 0, 1, 1,
0.5582711, -0.3044371, 0.475863, 0.3333333, 0, 1, 1,
0.5655373, -2.555841, 2.929515, 0.3372549, 0, 1, 1,
0.5683013, -0.5311931, 2.041667, 0.345098, 0, 1, 1,
0.5725978, 1.262904, 0.634999, 0.3490196, 0, 1, 1,
0.5730466, -0.2560956, 2.984958, 0.3568628, 0, 1, 1,
0.574301, 0.4598218, 2.482653, 0.3607843, 0, 1, 1,
0.5748087, -0.8982472, 2.677962, 0.3686275, 0, 1, 1,
0.5758181, -0.6308606, 1.241122, 0.372549, 0, 1, 1,
0.5802752, -2.560936, 2.522052, 0.3803922, 0, 1, 1,
0.5812932, 2.358472, 1.17433, 0.3843137, 0, 1, 1,
0.5851364, 0.0733898, -0.5888704, 0.3921569, 0, 1, 1,
0.5877315, -1.411113, 2.852695, 0.3960784, 0, 1, 1,
0.5882406, 0.3054482, 1.504524, 0.4039216, 0, 1, 1,
0.5895674, 1.547439, 0.5385372, 0.4117647, 0, 1, 1,
0.5901342, -0.3204135, 3.14037, 0.4156863, 0, 1, 1,
0.5916243, -0.2337464, 0.1028617, 0.4235294, 0, 1, 1,
0.5928453, 0.4360688, 1.166238, 0.427451, 0, 1, 1,
0.5929484, -0.4103568, 3.655943, 0.4352941, 0, 1, 1,
0.5938295, 0.9620193, 0.1182566, 0.4392157, 0, 1, 1,
0.596848, 0.4936685, 2.31398, 0.4470588, 0, 1, 1,
0.5977125, -2.349876, 2.876676, 0.4509804, 0, 1, 1,
0.6027378, 0.1847152, 0.6392609, 0.4588235, 0, 1, 1,
0.6033133, -0.2918221, 1.062124, 0.4627451, 0, 1, 1,
0.6036224, -0.2067234, 0.7531238, 0.4705882, 0, 1, 1,
0.6039556, -1.53776, 0.7758839, 0.4745098, 0, 1, 1,
0.6049626, 0.7235239, 0.1644598, 0.4823529, 0, 1, 1,
0.6051339, 0.2331352, 1.255929, 0.4862745, 0, 1, 1,
0.6065134, -0.7277203, 1.478933, 0.4941176, 0, 1, 1,
0.609466, 0.0757217, 1.180079, 0.5019608, 0, 1, 1,
0.6113168, 0.3840787, 1.007649, 0.5058824, 0, 1, 1,
0.6124669, -0.1521119, 1.650822, 0.5137255, 0, 1, 1,
0.6173321, -1.345826, -0.1067225, 0.5176471, 0, 1, 1,
0.6176595, -0.8024359, 3.029727, 0.5254902, 0, 1, 1,
0.6177227, 0.7014143, -0.2690808, 0.5294118, 0, 1, 1,
0.6181266, -1.463139, 3.243436, 0.5372549, 0, 1, 1,
0.6250952, -0.06412575, 2.190415, 0.5411765, 0, 1, 1,
0.6363177, -0.3849376, 1.651918, 0.5490196, 0, 1, 1,
0.6363449, 0.09743813, 1.730644, 0.5529412, 0, 1, 1,
0.642724, -1.512223, 2.377723, 0.5607843, 0, 1, 1,
0.6433506, -1.649482, 4.273649, 0.5647059, 0, 1, 1,
0.6434481, 0.2166668, 2.477502, 0.572549, 0, 1, 1,
0.645214, 0.6174828, 1.505524, 0.5764706, 0, 1, 1,
0.6458597, 0.83134, 0.6969419, 0.5843138, 0, 1, 1,
0.6491666, -2.129665, 2.683948, 0.5882353, 0, 1, 1,
0.6499216, 1.37933, 1.01132, 0.5960785, 0, 1, 1,
0.6509674, -0.734507, 2.922197, 0.6039216, 0, 1, 1,
0.6511396, -0.4588158, 0.9624318, 0.6078432, 0, 1, 1,
0.6511855, -0.1108692, 2.302939, 0.6156863, 0, 1, 1,
0.6532508, 0.01858173, 1.45551, 0.6196079, 0, 1, 1,
0.6535723, 1.414003, -0.2767749, 0.627451, 0, 1, 1,
0.6573467, -0.7995825, 2.118782, 0.6313726, 0, 1, 1,
0.6615818, 0.1009401, 0.05413866, 0.6392157, 0, 1, 1,
0.6619387, -1.419601, 3.674527, 0.6431373, 0, 1, 1,
0.6646866, 0.6393097, 2.170425, 0.6509804, 0, 1, 1,
0.6665982, -0.02935947, 0.125094, 0.654902, 0, 1, 1,
0.6724975, 0.1748549, 1.857402, 0.6627451, 0, 1, 1,
0.6772872, -1.438863, 3.48188, 0.6666667, 0, 1, 1,
0.6774092, 0.07659338, 1.797614, 0.6745098, 0, 1, 1,
0.6826259, -0.04526442, 0.5135475, 0.6784314, 0, 1, 1,
0.6954641, 0.4457196, 1.201141, 0.6862745, 0, 1, 1,
0.6956885, -0.8150158, 2.693305, 0.6901961, 0, 1, 1,
0.6987122, 0.5757896, 1.297505, 0.6980392, 0, 1, 1,
0.7014914, 0.247048, -0.1109245, 0.7058824, 0, 1, 1,
0.7053126, -0.6785336, 2.05945, 0.7098039, 0, 1, 1,
0.706027, 0.3512607, 2.383168, 0.7176471, 0, 1, 1,
0.7093651, 1.404803, -1.519601, 0.7215686, 0, 1, 1,
0.7098062, 0.9287736, 0.8112591, 0.7294118, 0, 1, 1,
0.7145292, 0.03730921, 1.516887, 0.7333333, 0, 1, 1,
0.7274401, -1.011629, 2.910361, 0.7411765, 0, 1, 1,
0.7292931, 1.212765, 0.1764443, 0.7450981, 0, 1, 1,
0.7301522, 0.1396944, 2.15105, 0.7529412, 0, 1, 1,
0.7347292, -0.2777383, 2.531043, 0.7568628, 0, 1, 1,
0.7384726, -1.127902, 1.667737, 0.7647059, 0, 1, 1,
0.743747, 1.351562, 0.5575758, 0.7686275, 0, 1, 1,
0.7472114, 1.06733, 0.4795487, 0.7764706, 0, 1, 1,
0.749272, -0.4007491, 2.537274, 0.7803922, 0, 1, 1,
0.7498183, 0.08186506, 2.0591, 0.7882353, 0, 1, 1,
0.7526246, 0.7615076, 0.7644137, 0.7921569, 0, 1, 1,
0.7581758, -3.548499, 2.82207, 0.8, 0, 1, 1,
0.7584177, 0.5981183, 0.6643535, 0.8078431, 0, 1, 1,
0.7646889, 0.41469, 0.9907932, 0.8117647, 0, 1, 1,
0.7671316, 0.9481006, -0.437951, 0.8196079, 0, 1, 1,
0.7695497, 0.619428, 0.1240677, 0.8235294, 0, 1, 1,
0.7736925, -0.0501502, 2.844682, 0.8313726, 0, 1, 1,
0.7752693, -0.4259586, 1.643155, 0.8352941, 0, 1, 1,
0.7809594, -1.513011, 4.198786, 0.8431373, 0, 1, 1,
0.786498, -1.421429, 1.023451, 0.8470588, 0, 1, 1,
0.790252, 0.5753388, 1.696652, 0.854902, 0, 1, 1,
0.7914351, 0.5611149, 1.960627, 0.8588235, 0, 1, 1,
0.7943339, -0.7967959, 1.911765, 0.8666667, 0, 1, 1,
0.8086073, -0.3390093, 1.825286, 0.8705882, 0, 1, 1,
0.8114606, -0.5460111, 1.874851, 0.8784314, 0, 1, 1,
0.8136802, 1.546265, 1.087766, 0.8823529, 0, 1, 1,
0.8206986, -2.084184, 1.200815, 0.8901961, 0, 1, 1,
0.8213522, 0.8098213, 1.673686, 0.8941177, 0, 1, 1,
0.8365039, -0.2599246, 2.506859, 0.9019608, 0, 1, 1,
0.8366829, 0.3493404, -0.5281415, 0.9098039, 0, 1, 1,
0.8408034, -2.264478, 1.134616, 0.9137255, 0, 1, 1,
0.8442733, 1.077687, 0.5240861, 0.9215686, 0, 1, 1,
0.8443803, 0.6739354, 1.567424, 0.9254902, 0, 1, 1,
0.8449141, 1.019917, 0.7966392, 0.9333333, 0, 1, 1,
0.8529221, -0.3077073, 2.902263, 0.9372549, 0, 1, 1,
0.8539689, 2.159791, 1.216731, 0.945098, 0, 1, 1,
0.8617203, -0.5802185, 2.719268, 0.9490196, 0, 1, 1,
0.8620064, -1.378428, 2.504469, 0.9568627, 0, 1, 1,
0.8668848, -0.3121609, 3.861395, 0.9607843, 0, 1, 1,
0.8678598, -0.1192074, 1.810299, 0.9686275, 0, 1, 1,
0.8710437, -0.7549784, 1.633262, 0.972549, 0, 1, 1,
0.8834763, -1.444981, 2.220953, 0.9803922, 0, 1, 1,
0.8881882, 0.06546605, 1.578838, 0.9843137, 0, 1, 1,
0.8978313, 1.453046, 0.1946344, 0.9921569, 0, 1, 1,
0.9022561, 0.2115953, 0.4806278, 0.9960784, 0, 1, 1,
0.9031923, 0.8784221, 1.276767, 1, 0, 0.9960784, 1,
0.9054149, -2.49448, 3.297286, 1, 0, 0.9882353, 1,
0.9115604, -0.05295338, 3.46874, 1, 0, 0.9843137, 1,
0.9125701, 0.1841904, 1.089187, 1, 0, 0.9764706, 1,
0.9174011, 0.8766931, -0.4351985, 1, 0, 0.972549, 1,
0.9219435, 0.1832361, 2.365762, 1, 0, 0.9647059, 1,
0.9231393, 0.2400947, 0.6948254, 1, 0, 0.9607843, 1,
0.9385693, 0.08331705, 1.580792, 1, 0, 0.9529412, 1,
0.9393057, -1.474592, 3.903788, 1, 0, 0.9490196, 1,
0.9430635, 0.2330367, 1.846812, 1, 0, 0.9411765, 1,
0.9547314, -0.2158403, 2.110776, 1, 0, 0.9372549, 1,
0.9548312, -1.686567, 1.864498, 1, 0, 0.9294118, 1,
0.9563562, -0.1015219, 2.175308, 1, 0, 0.9254902, 1,
0.9580271, 0.4788649, 1.051975, 1, 0, 0.9176471, 1,
0.9613681, 2.017961, 1.022792, 1, 0, 0.9137255, 1,
0.9634458, 0.9333936, 0.08285064, 1, 0, 0.9058824, 1,
0.9718332, 1.479306, 0.6552677, 1, 0, 0.9019608, 1,
0.9729654, -0.09469218, 1.739651, 1, 0, 0.8941177, 1,
0.9777514, 0.9625781, 0.2577733, 1, 0, 0.8862745, 1,
0.9804657, 0.8569934, 2.025934, 1, 0, 0.8823529, 1,
0.9808238, -0.8368965, 1.832145, 1, 0, 0.8745098, 1,
0.9814854, -0.939937, 2.225267, 1, 0, 0.8705882, 1,
0.9843859, -1.186918, 2.576497, 1, 0, 0.8627451, 1,
0.9887243, 0.623937, -0.5180916, 1, 0, 0.8588235, 1,
0.9924093, 0.2766825, 0.9147326, 1, 0, 0.8509804, 1,
0.9979111, -1.373345, 0.8745079, 1, 0, 0.8470588, 1,
1.003613, -0.7271242, 3.786569, 1, 0, 0.8392157, 1,
1.003856, 0.6136869, 1.941031, 1, 0, 0.8352941, 1,
1.00509, 0.8265538, 2.219992, 1, 0, 0.827451, 1,
1.005364, -1.366996, 2.359263, 1, 0, 0.8235294, 1,
1.011495, -2.033772, 1.509031, 1, 0, 0.8156863, 1,
1.01894, 0.4118733, 0.8021796, 1, 0, 0.8117647, 1,
1.019474, 0.1149184, 0.8920118, 1, 0, 0.8039216, 1,
1.030892, 0.8600487, 0.482317, 1, 0, 0.7960784, 1,
1.034238, 0.1585442, 2.882087, 1, 0, 0.7921569, 1,
1.044752, 1.413295, -0.2533348, 1, 0, 0.7843137, 1,
1.045263, 1.156958, 1.760195, 1, 0, 0.7803922, 1,
1.047441, 0.0846054, 0.669076, 1, 0, 0.772549, 1,
1.060743, -0.1611189, 2.402103, 1, 0, 0.7686275, 1,
1.061328, -0.2949601, 1.129444, 1, 0, 0.7607843, 1,
1.063104, 0.2376421, 4.095676, 1, 0, 0.7568628, 1,
1.070498, 0.9351169, 1.68734, 1, 0, 0.7490196, 1,
1.076627, -0.4903729, 2.749891, 1, 0, 0.7450981, 1,
1.077608, 0.1767266, 2.056382, 1, 0, 0.7372549, 1,
1.079228, -1.843521, 2.499658, 1, 0, 0.7333333, 1,
1.080417, 0.5226229, 1.641038, 1, 0, 0.7254902, 1,
1.081186, -0.0224068, 3.210226, 1, 0, 0.7215686, 1,
1.084656, 1.219582, 0.2058652, 1, 0, 0.7137255, 1,
1.085604, -0.0543826, 0.5300477, 1, 0, 0.7098039, 1,
1.089939, -2.611589, 0.583711, 1, 0, 0.7019608, 1,
1.095349, 0.4381837, 1.82653, 1, 0, 0.6941177, 1,
1.098254, -0.9817458, 2.889006, 1, 0, 0.6901961, 1,
1.101022, 1.640008, -1.271591, 1, 0, 0.682353, 1,
1.101692, -2.03713, 3.423188, 1, 0, 0.6784314, 1,
1.105407, 1.46873, 1.16228, 1, 0, 0.6705883, 1,
1.106321, -2.528403, 1.11683, 1, 0, 0.6666667, 1,
1.124605, 0.0646362, 2.483462, 1, 0, 0.6588235, 1,
1.125446, -0.2488169, 0.926849, 1, 0, 0.654902, 1,
1.149177, -1.14678, 2.171941, 1, 0, 0.6470588, 1,
1.149419, 0.927356, 1.01263, 1, 0, 0.6431373, 1,
1.15028, 0.5229691, -0.1934955, 1, 0, 0.6352941, 1,
1.1545, 1.433286, 0.09586341, 1, 0, 0.6313726, 1,
1.164102, -2.074973, 3.785175, 1, 0, 0.6235294, 1,
1.166485, 0.614738, 1.805992, 1, 0, 0.6196079, 1,
1.175518, -0.04204545, 1.257473, 1, 0, 0.6117647, 1,
1.178683, -0.5758736, 0.7536098, 1, 0, 0.6078432, 1,
1.185697, -1.430156, 3.310632, 1, 0, 0.6, 1,
1.185941, 0.2230627, -0.7934954, 1, 0, 0.5921569, 1,
1.190007, -0.9315971, 2.310772, 1, 0, 0.5882353, 1,
1.215119, 0.1610198, 3.050326, 1, 0, 0.5803922, 1,
1.216978, -0.8952972, -0.0191178, 1, 0, 0.5764706, 1,
1.219194, 1.52216, -0.07939795, 1, 0, 0.5686275, 1,
1.227586, -0.1123154, 0.8506213, 1, 0, 0.5647059, 1,
1.233069, 1.060812, 1.696831, 1, 0, 0.5568628, 1,
1.241211, -0.7245854, 1.231092, 1, 0, 0.5529412, 1,
1.249679, 0.3265914, 0.0349889, 1, 0, 0.5450981, 1,
1.264031, 0.06871075, -0.1896882, 1, 0, 0.5411765, 1,
1.264821, -1.288107, 2.240705, 1, 0, 0.5333334, 1,
1.272486, 1.352772, 1.97428, 1, 0, 0.5294118, 1,
1.27415, 1.734287, 0.6431524, 1, 0, 0.5215687, 1,
1.277684, 0.006475216, 1.769785, 1, 0, 0.5176471, 1,
1.277691, 0.3713014, -0.2135801, 1, 0, 0.509804, 1,
1.282477, 2.110064, 0.6467797, 1, 0, 0.5058824, 1,
1.282876, 0.3999821, 0.5028419, 1, 0, 0.4980392, 1,
1.28544, 2.094005, 0.9547995, 1, 0, 0.4901961, 1,
1.288087, 0.555144, 1.605696, 1, 0, 0.4862745, 1,
1.297046, 0.7870814, 1.514331, 1, 0, 0.4784314, 1,
1.307305, -0.2680801, 0.0448883, 1, 0, 0.4745098, 1,
1.310058, 0.4431565, 2.111655, 1, 0, 0.4666667, 1,
1.316288, 0.04777015, 0.3056447, 1, 0, 0.4627451, 1,
1.319536, 0.1609253, 2.148843, 1, 0, 0.454902, 1,
1.322369, 0.3406725, 1.669311, 1, 0, 0.4509804, 1,
1.356764, 0.4668758, 1.094309, 1, 0, 0.4431373, 1,
1.361179, 0.05170491, 1.434863, 1, 0, 0.4392157, 1,
1.36291, 0.2163723, 0.8423536, 1, 0, 0.4313726, 1,
1.374785, -0.2134135, 3.011142, 1, 0, 0.427451, 1,
1.379543, -0.714104, 2.961456, 1, 0, 0.4196078, 1,
1.38162, -1.949862, 1.465113, 1, 0, 0.4156863, 1,
1.383751, 1.361019, -0.8949617, 1, 0, 0.4078431, 1,
1.38377, 1.033851, -0.5540367, 1, 0, 0.4039216, 1,
1.387212, 0.3630722, 1.651202, 1, 0, 0.3960784, 1,
1.392276, 0.07357301, 2.385731, 1, 0, 0.3882353, 1,
1.397642, 1.070768, 1.929758, 1, 0, 0.3843137, 1,
1.40732, -1.7493, 2.983593, 1, 0, 0.3764706, 1,
1.411332, -1.740996, 2.200328, 1, 0, 0.372549, 1,
1.414334, 1.14455, 1.380505, 1, 0, 0.3647059, 1,
1.414443, 0.7189115, 3.10077, 1, 0, 0.3607843, 1,
1.422463, -0.4932119, 3.036469, 1, 0, 0.3529412, 1,
1.424362, 1.243118, 1.241492, 1, 0, 0.3490196, 1,
1.435552, 0.7741203, 2.703413, 1, 0, 0.3411765, 1,
1.441456, 0.4631857, 0.008878855, 1, 0, 0.3372549, 1,
1.469245, -0.4472897, 1.172069, 1, 0, 0.3294118, 1,
1.479679, 1.635224, 1.685379, 1, 0, 0.3254902, 1,
1.47972, -0.6852251, 0.5148957, 1, 0, 0.3176471, 1,
1.484343, -0.1005483, 3.206625, 1, 0, 0.3137255, 1,
1.484745, 0.6500024, 1.114206, 1, 0, 0.3058824, 1,
1.502158, 0.8917508, 1.46996, 1, 0, 0.2980392, 1,
1.52653, -0.02551632, 0.7562739, 1, 0, 0.2941177, 1,
1.535631, 0.2216416, 0.5309838, 1, 0, 0.2862745, 1,
1.559103, 1.045305, 0.5021774, 1, 0, 0.282353, 1,
1.567189, 0.3385834, 1.119931, 1, 0, 0.2745098, 1,
1.572532, -1.914863, 1.831974, 1, 0, 0.2705882, 1,
1.573771, 0.07794746, 2.163732, 1, 0, 0.2627451, 1,
1.5779, -0.1431562, 0.9042391, 1, 0, 0.2588235, 1,
1.583831, -0.5592276, 1.002787, 1, 0, 0.2509804, 1,
1.599148, 0.2496104, 0.5790529, 1, 0, 0.2470588, 1,
1.627473, 1.886957, 2.293514, 1, 0, 0.2392157, 1,
1.630237, 0.7326702, 1.511861, 1, 0, 0.2352941, 1,
1.66646, 0.1183438, 2.444695, 1, 0, 0.227451, 1,
1.682616, -1.136859, 3.851839, 1, 0, 0.2235294, 1,
1.68703, -1.307778, 2.871746, 1, 0, 0.2156863, 1,
1.690607, 0.2508173, 0.9348969, 1, 0, 0.2117647, 1,
1.697732, 0.3771391, 1.132705, 1, 0, 0.2039216, 1,
1.699482, 1.169517, 1.357939, 1, 0, 0.1960784, 1,
1.737159, -1.267513, 2.069933, 1, 0, 0.1921569, 1,
1.745666, 1.317438, 0.1868814, 1, 0, 0.1843137, 1,
1.775038, 0.7300257, 2.508724, 1, 0, 0.1803922, 1,
1.784091, -0.9688479, 1.28679, 1, 0, 0.172549, 1,
1.808484, 0.2296358, -0.005488035, 1, 0, 0.1686275, 1,
1.82362, 0.1658925, 0.6729733, 1, 0, 0.1607843, 1,
1.84077, 0.5609113, 1.109251, 1, 0, 0.1568628, 1,
1.841643, 0.465853, 3.552636, 1, 0, 0.1490196, 1,
1.862794, 2.240046, -0.01756971, 1, 0, 0.145098, 1,
1.878112, 0.8379412, 1.021385, 1, 0, 0.1372549, 1,
1.8853, -0.5775362, 1.854684, 1, 0, 0.1333333, 1,
1.892774, -1.508152, 2.183921, 1, 0, 0.1254902, 1,
1.894731, -1.545548, 2.289215, 1, 0, 0.1215686, 1,
1.964318, 0.2312318, 1.974181, 1, 0, 0.1137255, 1,
1.98155, -1.785535, 2.414644, 1, 0, 0.1098039, 1,
1.992999, -1.11054, 2.715313, 1, 0, 0.1019608, 1,
2.001425, -3.672965, 2.376452, 1, 0, 0.09411765, 1,
2.082144, -2.191081, 0.9543281, 1, 0, 0.09019608, 1,
2.093272, 2.566172, -0.6802176, 1, 0, 0.08235294, 1,
2.144519, 0.4742134, 0.1953039, 1, 0, 0.07843138, 1,
2.215358, -0.55349, 2.650811, 1, 0, 0.07058824, 1,
2.216846, -0.2872415, 2.094176, 1, 0, 0.06666667, 1,
2.23882, 0.4742297, 0.9920211, 1, 0, 0.05882353, 1,
2.251173, -1.329386, 1.300862, 1, 0, 0.05490196, 1,
2.288958, 0.7627249, 2.069276, 1, 0, 0.04705882, 1,
2.311174, -0.8814504, 1.231395, 1, 0, 0.04313726, 1,
2.337798, 1.941367, 1.911422, 1, 0, 0.03529412, 1,
2.4692, -0.1933819, 3.370052, 1, 0, 0.03137255, 1,
2.478539, -0.502836, 2.334329, 1, 0, 0.02352941, 1,
2.558197, -1.40974, 1.668684, 1, 0, 0.01960784, 1,
2.719779, 0.3077552, 0.6526513, 1, 0, 0.01176471, 1,
2.88638, 2.892122, 1.958509, 1, 0, 0.007843138, 1
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
0.00188911, -5.611621, -7.707803, 0, -0.5, 0.5, 0.5,
0.00188911, -5.611621, -7.707803, 1, -0.5, 0.5, 0.5,
0.00188911, -5.611621, -7.707803, 1, 1.5, 0.5, 0.5,
0.00188911, -5.611621, -7.707803, 0, 1.5, 0.5, 0.5
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
-3.860445, -0.4490594, -7.707803, 0, -0.5, 0.5, 0.5,
-3.860445, -0.4490594, -7.707803, 1, -0.5, 0.5, 0.5,
-3.860445, -0.4490594, -7.707803, 1, 1.5, 0.5, 0.5,
-3.860445, -0.4490594, -7.707803, 0, 1.5, 0.5, 0.5
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
-3.860445, -5.611621, -0.5824828, 0, -0.5, 0.5, 0.5,
-3.860445, -5.611621, -0.5824828, 1, -0.5, 0.5, 0.5,
-3.860445, -5.611621, -0.5824828, 1, 1.5, 0.5, 0.5,
-3.860445, -5.611621, -0.5824828, 0, 1.5, 0.5, 0.5
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
-2, -4.42026, -6.063498,
2, -4.42026, -6.063498,
-2, -4.42026, -6.063498,
-2, -4.618821, -6.337549,
-1, -4.42026, -6.063498,
-1, -4.618821, -6.337549,
0, -4.42026, -6.063498,
0, -4.618821, -6.337549,
1, -4.42026, -6.063498,
1, -4.618821, -6.337549,
2, -4.42026, -6.063498,
2, -4.618821, -6.337549
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
-2, -5.015941, -6.885651, 0, -0.5, 0.5, 0.5,
-2, -5.015941, -6.885651, 1, -0.5, 0.5, 0.5,
-2, -5.015941, -6.885651, 1, 1.5, 0.5, 0.5,
-2, -5.015941, -6.885651, 0, 1.5, 0.5, 0.5,
-1, -5.015941, -6.885651, 0, -0.5, 0.5, 0.5,
-1, -5.015941, -6.885651, 1, -0.5, 0.5, 0.5,
-1, -5.015941, -6.885651, 1, 1.5, 0.5, 0.5,
-1, -5.015941, -6.885651, 0, 1.5, 0.5, 0.5,
0, -5.015941, -6.885651, 0, -0.5, 0.5, 0.5,
0, -5.015941, -6.885651, 1, -0.5, 0.5, 0.5,
0, -5.015941, -6.885651, 1, 1.5, 0.5, 0.5,
0, -5.015941, -6.885651, 0, 1.5, 0.5, 0.5,
1, -5.015941, -6.885651, 0, -0.5, 0.5, 0.5,
1, -5.015941, -6.885651, 1, -0.5, 0.5, 0.5,
1, -5.015941, -6.885651, 1, 1.5, 0.5, 0.5,
1, -5.015941, -6.885651, 0, 1.5, 0.5, 0.5,
2, -5.015941, -6.885651, 0, -0.5, 0.5, 0.5,
2, -5.015941, -6.885651, 1, -0.5, 0.5, 0.5,
2, -5.015941, -6.885651, 1, 1.5, 0.5, 0.5,
2, -5.015941, -6.885651, 0, 1.5, 0.5, 0.5
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
-2.969137, -4, -6.063498,
-2.969137, 2, -6.063498,
-2.969137, -4, -6.063498,
-3.117688, -4, -6.337549,
-2.969137, -2, -6.063498,
-3.117688, -2, -6.337549,
-2.969137, 0, -6.063498,
-3.117688, 0, -6.337549,
-2.969137, 2, -6.063498,
-3.117688, 2, -6.337549
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
-3.414791, -4, -6.885651, 0, -0.5, 0.5, 0.5,
-3.414791, -4, -6.885651, 1, -0.5, 0.5, 0.5,
-3.414791, -4, -6.885651, 1, 1.5, 0.5, 0.5,
-3.414791, -4, -6.885651, 0, 1.5, 0.5, 0.5,
-3.414791, -2, -6.885651, 0, -0.5, 0.5, 0.5,
-3.414791, -2, -6.885651, 1, -0.5, 0.5, 0.5,
-3.414791, -2, -6.885651, 1, 1.5, 0.5, 0.5,
-3.414791, -2, -6.885651, 0, 1.5, 0.5, 0.5,
-3.414791, 0, -6.885651, 0, -0.5, 0.5, 0.5,
-3.414791, 0, -6.885651, 1, -0.5, 0.5, 0.5,
-3.414791, 0, -6.885651, 1, 1.5, 0.5, 0.5,
-3.414791, 0, -6.885651, 0, 1.5, 0.5, 0.5,
-3.414791, 2, -6.885651, 0, -0.5, 0.5, 0.5,
-3.414791, 2, -6.885651, 1, -0.5, 0.5, 0.5,
-3.414791, 2, -6.885651, 1, 1.5, 0.5, 0.5,
-3.414791, 2, -6.885651, 0, 1.5, 0.5, 0.5
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
-2.969137, -4.42026, -4,
-2.969137, -4.42026, 4,
-2.969137, -4.42026, -4,
-3.117688, -4.618821, -4,
-2.969137, -4.42026, -2,
-3.117688, -4.618821, -2,
-2.969137, -4.42026, 0,
-3.117688, -4.618821, 0,
-2.969137, -4.42026, 2,
-3.117688, -4.618821, 2,
-2.969137, -4.42026, 4,
-3.117688, -4.618821, 4
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
-3.414791, -5.015941, -4, 0, -0.5, 0.5, 0.5,
-3.414791, -5.015941, -4, 1, -0.5, 0.5, 0.5,
-3.414791, -5.015941, -4, 1, 1.5, 0.5, 0.5,
-3.414791, -5.015941, -4, 0, 1.5, 0.5, 0.5,
-3.414791, -5.015941, -2, 0, -0.5, 0.5, 0.5,
-3.414791, -5.015941, -2, 1, -0.5, 0.5, 0.5,
-3.414791, -5.015941, -2, 1, 1.5, 0.5, 0.5,
-3.414791, -5.015941, -2, 0, 1.5, 0.5, 0.5,
-3.414791, -5.015941, 0, 0, -0.5, 0.5, 0.5,
-3.414791, -5.015941, 0, 1, -0.5, 0.5, 0.5,
-3.414791, -5.015941, 0, 1, 1.5, 0.5, 0.5,
-3.414791, -5.015941, 0, 0, 1.5, 0.5, 0.5,
-3.414791, -5.015941, 2, 0, -0.5, 0.5, 0.5,
-3.414791, -5.015941, 2, 1, -0.5, 0.5, 0.5,
-3.414791, -5.015941, 2, 1, 1.5, 0.5, 0.5,
-3.414791, -5.015941, 2, 0, 1.5, 0.5, 0.5,
-3.414791, -5.015941, 4, 0, -0.5, 0.5, 0.5,
-3.414791, -5.015941, 4, 1, -0.5, 0.5, 0.5,
-3.414791, -5.015941, 4, 1, 1.5, 0.5, 0.5,
-3.414791, -5.015941, 4, 0, 1.5, 0.5, 0.5
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
-2.969137, -4.42026, -6.063498,
-2.969137, 3.522142, -6.063498,
-2.969137, -4.42026, 4.898533,
-2.969137, 3.522142, 4.898533,
-2.969137, -4.42026, -6.063498,
-2.969137, -4.42026, 4.898533,
-2.969137, 3.522142, -6.063498,
-2.969137, 3.522142, 4.898533,
-2.969137, -4.42026, -6.063498,
2.972915, -4.42026, -6.063498,
-2.969137, -4.42026, 4.898533,
2.972915, -4.42026, 4.898533,
-2.969137, 3.522142, -6.063498,
2.972915, 3.522142, -6.063498,
-2.969137, 3.522142, 4.898533,
2.972915, 3.522142, 4.898533,
2.972915, -4.42026, -6.063498,
2.972915, 3.522142, -6.063498,
2.972915, -4.42026, 4.898533,
2.972915, 3.522142, 4.898533,
2.972915, -4.42026, -6.063498,
2.972915, -4.42026, 4.898533,
2.972915, 3.522142, -6.063498,
2.972915, 3.522142, 4.898533
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
var radius = 7.894174;
var distance = 35.12207;
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
mvMatrix.translate( -0.00188911, 0.4490594, 0.5824828 );
mvMatrix.scale( 1.436429, 1.074654, 0.7786272 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.12207);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
thiazole-5-carboxani<-read.table("thiazole-5-carboxani.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-thiazole-5-carboxani$V2
```

```
## Error in eval(expr, envir, enclos): object 'thiazole' not found
```

```r
y<-thiazole-5-carboxani$V3
```

```
## Error in eval(expr, envir, enclos): object 'thiazole' not found
```

```r
z<-thiazole-5-carboxani$V4
```

```
## Error in eval(expr, envir, enclos): object 'thiazole' not found
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
-2.882602, 0.3649462, -3.629841, 0, 0, 1, 1, 1,
-2.816176, 0.5357192, -1.790624, 1, 0, 0, 1, 1,
-2.601254, -0.2604566, -1.165473, 1, 0, 0, 1, 1,
-2.546332, -1.010668, -2.386288, 1, 0, 0, 1, 1,
-2.545156, 0.02521641, -1.093681, 1, 0, 0, 1, 1,
-2.519482, -0.8463588, -3.423095, 1, 0, 0, 1, 1,
-2.509876, -0.06500402, -2.210879, 0, 0, 0, 1, 1,
-2.506847, -1.652989, -1.346552, 0, 0, 0, 1, 1,
-2.430386, -0.4674258, -2.159276, 0, 0, 0, 1, 1,
-2.423099, 0.7253366, -0.6635759, 0, 0, 0, 1, 1,
-2.385068, -0.7792761, -4.658599, 0, 0, 0, 1, 1,
-2.324729, 0.6698721, -1.42802, 0, 0, 0, 1, 1,
-2.247253, 2.032558, -2.232168, 0, 0, 0, 1, 1,
-2.19778, 1.518571, 0.07317562, 1, 1, 1, 1, 1,
-2.151825, 0.008151048, -1.823086, 1, 1, 1, 1, 1,
-2.139038, 0.124698, -1.941099, 1, 1, 1, 1, 1,
-2.105437, 0.2260974, -0.1371717, 1, 1, 1, 1, 1,
-2.096171, 0.6592554, 0.1843993, 1, 1, 1, 1, 1,
-2.089821, 1.155091, -1.934171, 1, 1, 1, 1, 1,
-2.085538, -1.181087, -3.526799, 1, 1, 1, 1, 1,
-2.084781, -0.3462532, -1.906514, 1, 1, 1, 1, 1,
-2.042904, -1.692922, -1.490551, 1, 1, 1, 1, 1,
-2.034387, 1.868792, -1.672339, 1, 1, 1, 1, 1,
-1.977466, -2.257314, -1.305169, 1, 1, 1, 1, 1,
-1.959139, 0.8934228, -2.172814, 1, 1, 1, 1, 1,
-1.940681, 0.5883057, 1.059131, 1, 1, 1, 1, 1,
-1.915537, -1.328023, -3.562906, 1, 1, 1, 1, 1,
-1.905243, -0.1637311, -1.011818, 1, 1, 1, 1, 1,
-1.866774, 0.2913224, -2.126906, 0, 0, 1, 1, 1,
-1.855591, 1.796508, -0.1529551, 1, 0, 0, 1, 1,
-1.82383, -0.9419225, -2.643281, 1, 0, 0, 1, 1,
-1.790312, 0.6593133, -1.651807, 1, 0, 0, 1, 1,
-1.789692, 0.7474093, -0.6011955, 1, 0, 0, 1, 1,
-1.777338, -1.663425, -2.799807, 1, 0, 0, 1, 1,
-1.775991, 0.06820434, -2.702687, 0, 0, 0, 1, 1,
-1.758816, -0.2507676, -1.618784, 0, 0, 0, 1, 1,
-1.747743, -2.138123, -4.314139, 0, 0, 0, 1, 1,
-1.737251, -0.835853, -1.512569, 0, 0, 0, 1, 1,
-1.731633, 0.3603735, -1.555636, 0, 0, 0, 1, 1,
-1.716064, 0.8544596, -1.978945, 0, 0, 0, 1, 1,
-1.715751, -0.3040652, -1.622923, 0, 0, 0, 1, 1,
-1.705222, 0.2611817, -1.403291, 1, 1, 1, 1, 1,
-1.693254, -1.138215, -1.114515, 1, 1, 1, 1, 1,
-1.688641, 0.9300053, -1.078256, 1, 1, 1, 1, 1,
-1.682028, 1.299344, 0.9355724, 1, 1, 1, 1, 1,
-1.674956, -0.4799153, -3.826416, 1, 1, 1, 1, 1,
-1.664619, 0.396406, -0.1888296, 1, 1, 1, 1, 1,
-1.649464, 0.5396041, -2.472054, 1, 1, 1, 1, 1,
-1.647749, 0.7446554, -1.510968, 1, 1, 1, 1, 1,
-1.64729, -0.761311, -1.591806, 1, 1, 1, 1, 1,
-1.647077, -0.6699774, -3.618923, 1, 1, 1, 1, 1,
-1.636606, -1.796855, -1.841991, 1, 1, 1, 1, 1,
-1.626541, -0.02271798, -0.5454257, 1, 1, 1, 1, 1,
-1.621703, -0.6808217, -2.471609, 1, 1, 1, 1, 1,
-1.621634, -1.004754, -0.814412, 1, 1, 1, 1, 1,
-1.603724, -0.941174, -2.569444, 1, 1, 1, 1, 1,
-1.599595, 0.3583534, -2.026872, 0, 0, 1, 1, 1,
-1.596657, -0.6355188, -3.649139, 1, 0, 0, 1, 1,
-1.591362, -1.701712, -2.672865, 1, 0, 0, 1, 1,
-1.579147, -1.083284, -1.984326, 1, 0, 0, 1, 1,
-1.574426, 0.5746244, -1.729693, 1, 0, 0, 1, 1,
-1.554429, 0.1439888, -0.6630965, 1, 0, 0, 1, 1,
-1.551019, 0.04821749, -3.249046, 0, 0, 0, 1, 1,
-1.541624, -0.1024931, 0.1333207, 0, 0, 0, 1, 1,
-1.541063, 0.1140373, -1.20793, 0, 0, 0, 1, 1,
-1.531924, 1.25959, -3.023994, 0, 0, 0, 1, 1,
-1.524747, 0.9736008, -0.8790194, 0, 0, 0, 1, 1,
-1.522373, 0.1330955, -1.919433, 0, 0, 0, 1, 1,
-1.522224, 0.356839, -0.9305723, 0, 0, 0, 1, 1,
-1.499433, 0.5910075, -0.6579068, 1, 1, 1, 1, 1,
-1.489489, 0.7127958, -0.3142118, 1, 1, 1, 1, 1,
-1.482324, 0.9372511, -1.227975, 1, 1, 1, 1, 1,
-1.464784, 0.880806, -1.81798, 1, 1, 1, 1, 1,
-1.463634, -0.1114657, -0.5716875, 1, 1, 1, 1, 1,
-1.447023, -0.8230602, -0.98182, 1, 1, 1, 1, 1,
-1.438498, 0.3874355, -3.30209, 1, 1, 1, 1, 1,
-1.429491, 1.243842, -2.526708, 1, 1, 1, 1, 1,
-1.421796, -0.3341748, 0.2237467, 1, 1, 1, 1, 1,
-1.417777, -1.583634, -3.529762, 1, 1, 1, 1, 1,
-1.404806, -0.4784929, -2.269295, 1, 1, 1, 1, 1,
-1.402561, 1.060977, -2.592374, 1, 1, 1, 1, 1,
-1.395578, -0.7095271, -2.168779, 1, 1, 1, 1, 1,
-1.389752, -0.6376008, -0.8607873, 1, 1, 1, 1, 1,
-1.389627, -1.062324, -3.170054, 1, 1, 1, 1, 1,
-1.388227, -0.7265844, -1.188972, 0, 0, 1, 1, 1,
-1.375142, -1.549194, -1.280879, 1, 0, 0, 1, 1,
-1.364391, 0.1553179, -2.195418, 1, 0, 0, 1, 1,
-1.363077, 0.09294183, -0.8661334, 1, 0, 0, 1, 1,
-1.356825, 0.8985678, -2.696466, 1, 0, 0, 1, 1,
-1.349881, -2.166298, -2.699655, 1, 0, 0, 1, 1,
-1.344835, 0.2839247, -0.8344511, 0, 0, 0, 1, 1,
-1.343972, 0.2458479, -1.177853, 0, 0, 0, 1, 1,
-1.335173, 0.2629651, -1.213095, 0, 0, 0, 1, 1,
-1.310617, -0.5263844, -2.072925, 0, 0, 0, 1, 1,
-1.310499, 1.76378, -0.9896742, 0, 0, 0, 1, 1,
-1.296229, 0.1611151, 0.01104225, 0, 0, 0, 1, 1,
-1.292762, 0.4557487, -0.6122758, 0, 0, 0, 1, 1,
-1.281812, 1.256981, 0.00768282, 1, 1, 1, 1, 1,
-1.280675, 0.2185805, -0.4001748, 1, 1, 1, 1, 1,
-1.280434, 1.530692, -2.891148, 1, 1, 1, 1, 1,
-1.276651, -1.957286, -1.568627, 1, 1, 1, 1, 1,
-1.250606, 0.7757083, -1.559541, 1, 1, 1, 1, 1,
-1.231342, 0.3400731, -1.747773, 1, 1, 1, 1, 1,
-1.230067, 0.454248, -1.985164, 1, 1, 1, 1, 1,
-1.229244, 1.754304, -1.485874, 1, 1, 1, 1, 1,
-1.227729, -0.5319091, -1.575347, 1, 1, 1, 1, 1,
-1.212961, 0.02923731, -1.052705, 1, 1, 1, 1, 1,
-1.20607, 0.4958197, -0.4379457, 1, 1, 1, 1, 1,
-1.195612, -0.54, -1.477865, 1, 1, 1, 1, 1,
-1.187252, 0.3576576, -2.424837, 1, 1, 1, 1, 1,
-1.178464, 0.02481579, -2.390791, 1, 1, 1, 1, 1,
-1.177889, 0.06372359, -1.684775, 1, 1, 1, 1, 1,
-1.173302, 2.308049, -0.489519, 0, 0, 1, 1, 1,
-1.16367, -0.1553406, -2.241634, 1, 0, 0, 1, 1,
-1.16313, -0.8072188, -1.854232, 1, 0, 0, 1, 1,
-1.155241, 1.492506, -1.699653, 1, 0, 0, 1, 1,
-1.150925, 0.05389357, -1.444697, 1, 0, 0, 1, 1,
-1.149206, 2.038554, -2.574258, 1, 0, 0, 1, 1,
-1.149178, 0.9606445, -0.2066443, 0, 0, 0, 1, 1,
-1.145571, 0.5594863, -1.325363, 0, 0, 0, 1, 1,
-1.145295, -1.128445, -1.864214, 0, 0, 0, 1, 1,
-1.142421, -0.03457228, -2.537775, 0, 0, 0, 1, 1,
-1.139558, -1.684247, -2.657869, 0, 0, 0, 1, 1,
-1.133908, -1.186122, -2.438437, 0, 0, 0, 1, 1,
-1.1325, 1.830349, -0.5181694, 0, 0, 0, 1, 1,
-1.131409, 0.009383108, -0.7572004, 1, 1, 1, 1, 1,
-1.128164, 1.436191, -0.8410631, 1, 1, 1, 1, 1,
-1.119273, 1.284135, -3.009004, 1, 1, 1, 1, 1,
-1.100699, 1.196163, -1.520002, 1, 1, 1, 1, 1,
-1.095834, -1.447427, -1.118436, 1, 1, 1, 1, 1,
-1.092494, -0.5037325, -0.2806483, 1, 1, 1, 1, 1,
-1.089851, 0.9172327, -1.283141, 1, 1, 1, 1, 1,
-1.079292, -0.4759084, -3.381873, 1, 1, 1, 1, 1,
-1.076666, 1.386986, -0.6153009, 1, 1, 1, 1, 1,
-1.076519, -0.698332, -0.9597424, 1, 1, 1, 1, 1,
-1.075947, 0.8669917, -1.749174, 1, 1, 1, 1, 1,
-1.071079, 1.098019, -0.9941747, 1, 1, 1, 1, 1,
-1.061974, 1.474755, -1.897137, 1, 1, 1, 1, 1,
-1.061043, 0.7378157, -1.874924, 1, 1, 1, 1, 1,
-1.057183, 0.5890679, -2.431873, 1, 1, 1, 1, 1,
-1.04944, -0.5367684, -0.05744167, 0, 0, 1, 1, 1,
-1.04573, -1.388683, -4.988335, 1, 0, 0, 1, 1,
-1.038371, 0.6446735, -3.118555, 1, 0, 0, 1, 1,
-1.033296, 0.9499163, -2.005454, 1, 0, 0, 1, 1,
-1.026616, 2.702732, -0.2771375, 1, 0, 0, 1, 1,
-1.025369, -0.324798, -0.7122089, 1, 0, 0, 1, 1,
-1.02334, -0.6296843, -3.438602, 0, 0, 0, 1, 1,
-1.02079, 0.7896479, -1.309106, 0, 0, 0, 1, 1,
-1.016215, 0.9349362, -1.27588, 0, 0, 0, 1, 1,
-1.004157, 0.1523581, -1.233465, 0, 0, 0, 1, 1,
-0.9903625, 0.4549684, -1.791885, 0, 0, 0, 1, 1,
-0.9824417, 0.2954203, -1.25548, 0, 0, 0, 1, 1,
-0.9715662, 0.848081, -0.6787551, 0, 0, 0, 1, 1,
-0.962558, -0.002205947, -3.19003, 1, 1, 1, 1, 1,
-0.9611692, -1.586319, -2.27468, 1, 1, 1, 1, 1,
-0.960041, -0.3490259, -1.467492, 1, 1, 1, 1, 1,
-0.9560626, 1.022779, 1.466018, 1, 1, 1, 1, 1,
-0.9516863, -0.6298496, -2.084777, 1, 1, 1, 1, 1,
-0.9479148, -1.25921, -5.00781, 1, 1, 1, 1, 1,
-0.9365801, 0.2244729, -1.942915, 1, 1, 1, 1, 1,
-0.9363871, 1.380049, -0.2663303, 1, 1, 1, 1, 1,
-0.9278461, -0.3667835, -1.517385, 1, 1, 1, 1, 1,
-0.9238247, -0.806926, -1.94058, 1, 1, 1, 1, 1,
-0.9226425, -0.2963528, -2.15085, 1, 1, 1, 1, 1,
-0.9199235, 2.312991, -0.856768, 1, 1, 1, 1, 1,
-0.9195191, 0.03475935, -3.678475, 1, 1, 1, 1, 1,
-0.9194692, -0.4231335, -1.800918, 1, 1, 1, 1, 1,
-0.9193308, -0.3961299, -3.179382, 1, 1, 1, 1, 1,
-0.9155763, -1.153051, -0.9673162, 0, 0, 1, 1, 1,
-0.912717, -0.09773961, -4.815643, 1, 0, 0, 1, 1,
-0.9114656, -0.3506639, -2.927277, 1, 0, 0, 1, 1,
-0.9098117, -0.4256697, -1.842059, 1, 0, 0, 1, 1,
-0.9025489, 1.352734, -1.326963, 1, 0, 0, 1, 1,
-0.9012356, 1.016313, -0.2441588, 1, 0, 0, 1, 1,
-0.898914, -2.104075, -3.4371, 0, 0, 0, 1, 1,
-0.8930299, 1.844099, -1.184227, 0, 0, 0, 1, 1,
-0.8922454, 0.1163837, -3.719396, 0, 0, 0, 1, 1,
-0.8922351, 1.93571, -1.078907, 0, 0, 0, 1, 1,
-0.8891692, -1.221522, -2.937868, 0, 0, 0, 1, 1,
-0.8880911, 1.208031, -0.6117032, 0, 0, 0, 1, 1,
-0.8848433, 1.312052, 0.1575259, 0, 0, 0, 1, 1,
-0.8811963, -0.4963466, -2.200546, 1, 1, 1, 1, 1,
-0.8802615, 0.3831345, -1.692732, 1, 1, 1, 1, 1,
-0.8797644, -0.2189098, -1.328347, 1, 1, 1, 1, 1,
-0.8791711, -0.04865699, -0.992388, 1, 1, 1, 1, 1,
-0.8783482, -0.8207961, -3.519241, 1, 1, 1, 1, 1,
-0.8697639, 0.7516617, -1.700195, 1, 1, 1, 1, 1,
-0.8689498, -1.43693, -2.081394, 1, 1, 1, 1, 1,
-0.8666592, 1.158615, -0.760956, 1, 1, 1, 1, 1,
-0.8643657, -1.016833, -3.274304, 1, 1, 1, 1, 1,
-0.8587694, -1.033058, -1.952537, 1, 1, 1, 1, 1,
-0.8555288, 0.6933245, -0.6177089, 1, 1, 1, 1, 1,
-0.8540705, -0.6558254, -2.92557, 1, 1, 1, 1, 1,
-0.8534843, -0.742528, -1.935834, 1, 1, 1, 1, 1,
-0.8517417, -0.6291246, -0.03559354, 1, 1, 1, 1, 1,
-0.8492041, 0.3814069, -1.835805, 1, 1, 1, 1, 1,
-0.8430519, -0.6201679, -1.510144, 0, 0, 1, 1, 1,
-0.8330543, 0.6010315, -2.688336, 1, 0, 0, 1, 1,
-0.8264471, 0.2287114, -2.261977, 1, 0, 0, 1, 1,
-0.8152095, 0.2923428, -0.9322588, 1, 0, 0, 1, 1,
-0.8122597, 0.7223324, 0.6207369, 1, 0, 0, 1, 1,
-0.8120002, -0.6044468, -1.788724, 1, 0, 0, 1, 1,
-0.8111529, 0.8089444, -1.768305, 0, 0, 0, 1, 1,
-0.8048426, 0.6171554, -1.757249, 0, 0, 0, 1, 1,
-0.7993866, -0.1086193, -0.5923077, 0, 0, 0, 1, 1,
-0.792928, -0.2453012, -0.556908, 0, 0, 0, 1, 1,
-0.7849091, 0.664338, -2.417296, 0, 0, 0, 1, 1,
-0.782199, -0.2027057, -1.741579, 0, 0, 0, 1, 1,
-0.7804703, -0.1544229, -2.138317, 0, 0, 0, 1, 1,
-0.7781341, 0.3498073, -2.043241, 1, 1, 1, 1, 1,
-0.7772313, 0.08659086, -4.509366, 1, 1, 1, 1, 1,
-0.7769821, -0.2487407, -0.9115832, 1, 1, 1, 1, 1,
-0.7761626, 0.5216681, -1.604907, 1, 1, 1, 1, 1,
-0.7696664, 0.599542, -0.5061629, 1, 1, 1, 1, 1,
-0.7676387, 1.47123, 0.7510996, 1, 1, 1, 1, 1,
-0.7634676, -2.138045, -3.716246, 1, 1, 1, 1, 1,
-0.7625384, -0.8193755, -3.710243, 1, 1, 1, 1, 1,
-0.7616332, 0.1743692, -0.05344492, 1, 1, 1, 1, 1,
-0.7588299, 1.318147, -0.4359232, 1, 1, 1, 1, 1,
-0.7583894, -1.879051, -2.471237, 1, 1, 1, 1, 1,
-0.7548159, 0.449012, 1.033157, 1, 1, 1, 1, 1,
-0.7541318, -0.09401622, -2.207373, 1, 1, 1, 1, 1,
-0.7485465, 0.5611613, 0.1740504, 1, 1, 1, 1, 1,
-0.7484992, 2.440442, -0.2871585, 1, 1, 1, 1, 1,
-0.7428547, -0.2392781, -2.38975, 0, 0, 1, 1, 1,
-0.7409291, -0.4119508, -1.62787, 1, 0, 0, 1, 1,
-0.7393396, -0.6147639, -2.961594, 1, 0, 0, 1, 1,
-0.7385997, 0.8850201, -0.2310213, 1, 0, 0, 1, 1,
-0.7364994, 0.9613724, -0.9905267, 1, 0, 0, 1, 1,
-0.7347506, -0.6224983, -4.012038, 1, 0, 0, 1, 1,
-0.7344946, 1.09393, -0.7054961, 0, 0, 0, 1, 1,
-0.7338651, -2.058745, 0.6738877, 0, 0, 0, 1, 1,
-0.7298248, 0.009710426, -3.371069, 0, 0, 0, 1, 1,
-0.7296971, 1.574448, 0.3084245, 0, 0, 0, 1, 1,
-0.7274532, 0.6679518, -0.9211537, 0, 0, 0, 1, 1,
-0.723441, 0.9902905, 1.181102, 0, 0, 0, 1, 1,
-0.7165671, 1.870793, -0.5995274, 0, 0, 0, 1, 1,
-0.7137969, 0.003262406, -2.373684, 1, 1, 1, 1, 1,
-0.7125447, -0.4922989, -0.422039, 1, 1, 1, 1, 1,
-0.7081072, -2.440353, -2.089622, 1, 1, 1, 1, 1,
-0.708028, 0.6434498, 1.362595, 1, 1, 1, 1, 1,
-0.7077214, 0.3002512, -0.8883497, 1, 1, 1, 1, 1,
-0.706274, 1.082857, -0.3588756, 1, 1, 1, 1, 1,
-0.7059154, -0.579146, -3.170371, 1, 1, 1, 1, 1,
-0.7044412, -1.119343, -3.243418, 1, 1, 1, 1, 1,
-0.6979166, 0.9853594, -0.3995792, 1, 1, 1, 1, 1,
-0.6935945, -0.07598251, -1.313253, 1, 1, 1, 1, 1,
-0.6894822, 0.03413931, -1.999153, 1, 1, 1, 1, 1,
-0.6893203, 0.09833445, -0.3663048, 1, 1, 1, 1, 1,
-0.6850164, -1.24471, -2.051908, 1, 1, 1, 1, 1,
-0.6846232, 0.613905, -1.343755, 1, 1, 1, 1, 1,
-0.684246, -1.415847, -4.020608, 1, 1, 1, 1, 1,
-0.6830892, 1.509427, 0.8243248, 0, 0, 1, 1, 1,
-0.680587, 0.2670806, -2.292479, 1, 0, 0, 1, 1,
-0.6757632, -0.1931661, -0.09395131, 1, 0, 0, 1, 1,
-0.6728911, 0.4438079, -2.029286, 1, 0, 0, 1, 1,
-0.6715701, 0.8487512, -0.3541068, 1, 0, 0, 1, 1,
-0.6711629, 1.733101, -0.455401, 1, 0, 0, 1, 1,
-0.670892, -0.5817124, -2.369283, 0, 0, 0, 1, 1,
-0.6698867, -0.5675623, 0.9350558, 0, 0, 0, 1, 1,
-0.6631935, 0.3625657, -1.076468, 0, 0, 0, 1, 1,
-0.6608869, 0.4661078, -3.228009, 0, 0, 0, 1, 1,
-0.6594419, 0.09378272, -1.105048, 0, 0, 0, 1, 1,
-0.6575189, -0.004511095, -1.858609, 0, 0, 0, 1, 1,
-0.6545542, -0.548184, -0.9595816, 0, 0, 0, 1, 1,
-0.649691, -0.3511744, -3.638424, 1, 1, 1, 1, 1,
-0.6365389, 0.2082517, -1.027614, 1, 1, 1, 1, 1,
-0.6339555, -0.545781, -3.686397, 1, 1, 1, 1, 1,
-0.6315276, 3.365353, 0.4259967, 1, 1, 1, 1, 1,
-0.625695, 0.4179911, -0.4989326, 1, 1, 1, 1, 1,
-0.6251787, -0.6670365, -2.264576, 1, 1, 1, 1, 1,
-0.6224394, 0.3681937, -1.285293, 1, 1, 1, 1, 1,
-0.6174725, -1.04983, -1.359324, 1, 1, 1, 1, 1,
-0.6158, -1.114024, -5.517515, 1, 1, 1, 1, 1,
-0.611466, 0.5890008, -1.091587, 1, 1, 1, 1, 1,
-0.6027309, -0.5510443, -1.602359, 1, 1, 1, 1, 1,
-0.6018334, -0.5292936, -2.773977, 1, 1, 1, 1, 1,
-0.5972158, -1.001647, -3.202523, 1, 1, 1, 1, 1,
-0.596068, -0.4222578, -1.591996, 1, 1, 1, 1, 1,
-0.5842281, -0.5332073, -3.453693, 1, 1, 1, 1, 1,
-0.5827972, -1.649676, -4.266905, 0, 0, 1, 1, 1,
-0.5791694, 1.872175, -0.8471292, 1, 0, 0, 1, 1,
-0.5785441, 0.7042128, -1.19582, 1, 0, 0, 1, 1,
-0.5776445, 0.1301669, -0.6702708, 1, 0, 0, 1, 1,
-0.576701, -0.9508838, -2.915731, 1, 0, 0, 1, 1,
-0.5761278, 0.4693267, -1.787808, 1, 0, 0, 1, 1,
-0.5718679, 0.06591928, -2.669428, 0, 0, 0, 1, 1,
-0.571824, -0.5964985, -2.323097, 0, 0, 0, 1, 1,
-0.5681065, -0.3843975, -0.9211604, 0, 0, 0, 1, 1,
-0.5673174, 1.286592, -0.7524297, 0, 0, 0, 1, 1,
-0.5628995, 2.312619, -0.7304618, 0, 0, 0, 1, 1,
-0.560513, 0.8046584, 0.9985951, 0, 0, 0, 1, 1,
-0.5593285, -0.9981944, -2.55798, 0, 0, 0, 1, 1,
-0.5569543, 1.500676, 1.403042, 1, 1, 1, 1, 1,
-0.5567784, -1.417658, -3.911382, 1, 1, 1, 1, 1,
-0.5564404, -0.7334983, -1.989718, 1, 1, 1, 1, 1,
-0.5534316, 0.1995045, -0.9537444, 1, 1, 1, 1, 1,
-0.5502713, 0.5634974, -0.2126168, 1, 1, 1, 1, 1,
-0.549569, -1.711034, -1.276664, 1, 1, 1, 1, 1,
-0.5490295, 0.5108659, -1.622111, 1, 1, 1, 1, 1,
-0.5473713, -0.2754529, -0.4434889, 1, 1, 1, 1, 1,
-0.5467048, -0.8827785, -2.483244, 1, 1, 1, 1, 1,
-0.5431548, -0.899215, -4.694512, 1, 1, 1, 1, 1,
-0.5402379, 0.08513926, -0.4396017, 1, 1, 1, 1, 1,
-0.5385191, -0.1850457, 0.9236128, 1, 1, 1, 1, 1,
-0.528502, -0.5665401, -3.506137, 1, 1, 1, 1, 1,
-0.527103, -0.1825381, -3.721955, 1, 1, 1, 1, 1,
-0.5251034, 0.5415365, 0.4006662, 1, 1, 1, 1, 1,
-0.5209364, 3.406476, 0.403044, 0, 0, 1, 1, 1,
-0.5124573, 0.1957899, -1.571672, 1, 0, 0, 1, 1,
-0.5121999, 0.4116805, 0.5212659, 1, 0, 0, 1, 1,
-0.5096019, -0.8126854, -2.661065, 1, 0, 0, 1, 1,
-0.5090373, 2.499411, 0.5794663, 1, 0, 0, 1, 1,
-0.5041117, 0.1075124, -1.421325, 1, 0, 0, 1, 1,
-0.4921849, -1.443393, -2.280527, 0, 0, 0, 1, 1,
-0.4913507, -0.4869864, -1.814792, 0, 0, 0, 1, 1,
-0.4880912, 0.086735, -3.62769, 0, 0, 0, 1, 1,
-0.4877648, 1.45832, -0.8568165, 0, 0, 0, 1, 1,
-0.487364, 0.2602544, -3.459214, 0, 0, 0, 1, 1,
-0.4849159, -0.9314603, -1.633915, 0, 0, 0, 1, 1,
-0.4845132, 0.316937, -0.3913561, 0, 0, 0, 1, 1,
-0.4826203, -0.07339754, -3.110687, 1, 1, 1, 1, 1,
-0.4807209, -0.05128374, 0.2122501, 1, 1, 1, 1, 1,
-0.4709167, -0.9541725, -2.30907, 1, 1, 1, 1, 1,
-0.4665279, 0.9619363, 0.9428828, 1, 1, 1, 1, 1,
-0.4657451, 1.233516, 1.033439, 1, 1, 1, 1, 1,
-0.4621392, 0.2554228, -0.4608144, 1, 1, 1, 1, 1,
-0.4604277, -0.4065794, -2.284589, 1, 1, 1, 1, 1,
-0.4550163, -0.9356002, -2.435997, 1, 1, 1, 1, 1,
-0.4537013, 1.177572, 1.339103, 1, 1, 1, 1, 1,
-0.4461428, -0.1019962, -1.89275, 1, 1, 1, 1, 1,
-0.4395319, -1.151445, -2.864197, 1, 1, 1, 1, 1,
-0.4389585, -0.9203193, -1.571255, 1, 1, 1, 1, 1,
-0.4313224, -1.184186, -1.932652, 1, 1, 1, 1, 1,
-0.4286774, -0.3163587, -0.7997518, 1, 1, 1, 1, 1,
-0.4263916, 1.401908, 0.171268, 1, 1, 1, 1, 1,
-0.4249789, -0.8986748, -3.445857, 0, 0, 1, 1, 1,
-0.423622, 0.6658927, -0.3328078, 1, 0, 0, 1, 1,
-0.4196741, 0.1046854, 0.8146071, 1, 0, 0, 1, 1,
-0.4168035, 0.6688627, -0.9471767, 1, 0, 0, 1, 1,
-0.4153476, -0.9000115, -3.241749, 1, 0, 0, 1, 1,
-0.4125698, 0.2398739, -2.187014, 1, 0, 0, 1, 1,
-0.4124991, -0.1019764, -2.500365, 0, 0, 0, 1, 1,
-0.4111108, -2.128737, -3.887659, 0, 0, 0, 1, 1,
-0.4078465, 1.0118, -0.7692664, 0, 0, 0, 1, 1,
-0.4072393, 1.68965, -0.5602664, 0, 0, 0, 1, 1,
-0.4049203, -0.8708098, -2.07884, 0, 0, 0, 1, 1,
-0.4045751, -0.5227972, -4.246221, 0, 0, 0, 1, 1,
-0.3988606, -1.04298, -2.903782, 0, 0, 0, 1, 1,
-0.3975294, -0.5311703, -1.100294, 1, 1, 1, 1, 1,
-0.3954239, 1.115341, -0.9799134, 1, 1, 1, 1, 1,
-0.3943749, 0.8294315, -0.381874, 1, 1, 1, 1, 1,
-0.3933743, 0.02683807, -1.914356, 1, 1, 1, 1, 1,
-0.3926464, -0.6935143, -1.755774, 1, 1, 1, 1, 1,
-0.3924408, -1.999553, -4.787529, 1, 1, 1, 1, 1,
-0.3889044, -0.3129534, -2.693942, 1, 1, 1, 1, 1,
-0.383949, -1.125762, -3.456847, 1, 1, 1, 1, 1,
-0.3784512, 0.9496105, -2.074493, 1, 1, 1, 1, 1,
-0.3781619, -0.4841891, -4.029333, 1, 1, 1, 1, 1,
-0.3731396, -1.529469, -2.837507, 1, 1, 1, 1, 1,
-0.3730429, 0.5590498, 0.1939792, 1, 1, 1, 1, 1,
-0.3708726, -1.722426, -2.528502, 1, 1, 1, 1, 1,
-0.3669128, -0.8394696, -3.496536, 1, 1, 1, 1, 1,
-0.3640058, 0.02784946, -1.718058, 1, 1, 1, 1, 1,
-0.3549647, 0.1276995, -0.1629768, 0, 0, 1, 1, 1,
-0.3547272, -0.8609436, -3.028391, 1, 0, 0, 1, 1,
-0.3534177, -1.508357, -2.238428, 1, 0, 0, 1, 1,
-0.3502049, 0.2996659, -1.115449, 1, 0, 0, 1, 1,
-0.3494193, 1.184533, -0.2237178, 1, 0, 0, 1, 1,
-0.3475514, -0.4882948, -1.102175, 1, 0, 0, 1, 1,
-0.3461087, 0.619018, 0.8623917, 0, 0, 0, 1, 1,
-0.3441778, -1.758878, -3.076464, 0, 0, 0, 1, 1,
-0.3337346, -0.009302679, -1.178482, 0, 0, 0, 1, 1,
-0.3316812, 1.7201, 0.05931057, 0, 0, 0, 1, 1,
-0.3289469, 0.9460994, -0.6845302, 0, 0, 0, 1, 1,
-0.3274996, 0.9114723, -2.199134, 0, 0, 0, 1, 1,
-0.3267505, -0.2725435, -0.5056783, 0, 0, 0, 1, 1,
-0.3181436, -0.6445196, -2.458034, 1, 1, 1, 1, 1,
-0.3170687, -0.8502677, -2.521605, 1, 1, 1, 1, 1,
-0.3163788, 1.22037, 0.2471462, 1, 1, 1, 1, 1,
-0.315055, -0.506947, -2.558091, 1, 1, 1, 1, 1,
-0.3140461, 0.4978516, -1.699821, 1, 1, 1, 1, 1,
-0.3083458, 1.767796, -0.6806347, 1, 1, 1, 1, 1,
-0.3066762, -0.6932677, -1.128473, 1, 1, 1, 1, 1,
-0.3018712, -0.4571274, -5.903857, 1, 1, 1, 1, 1,
-0.2995689, -0.8832681, -4.625662, 1, 1, 1, 1, 1,
-0.2984081, -0.9372956, -2.51896, 1, 1, 1, 1, 1,
-0.296873, 0.782517, 0.4223322, 1, 1, 1, 1, 1,
-0.2966594, -0.1368632, -1.829203, 1, 1, 1, 1, 1,
-0.2949503, 0.3622272, 1.409578, 1, 1, 1, 1, 1,
-0.291739, 1.468681, -0.7074074, 1, 1, 1, 1, 1,
-0.2873367, 1.222633, -0.2190288, 1, 1, 1, 1, 1,
-0.2869075, 2.644341, -2.56527, 0, 0, 1, 1, 1,
-0.2840005, -1.296949, -2.780163, 1, 0, 0, 1, 1,
-0.2788586, 0.722059, -2.009702, 1, 0, 0, 1, 1,
-0.2766356, -2.389007, -2.684272, 1, 0, 0, 1, 1,
-0.2745185, 0.6941635, -1.651803, 1, 0, 0, 1, 1,
-0.273331, -0.2711162, -1.740618, 1, 0, 0, 1, 1,
-0.2718378, -1.009894, -3.005335, 0, 0, 0, 1, 1,
-0.2684104, 1.002491, 1.119502, 0, 0, 0, 1, 1,
-0.2664054, 1.677426, -1.124231, 0, 0, 0, 1, 1,
-0.264858, -0.127741, -2.810596, 0, 0, 0, 1, 1,
-0.2616136, -0.239227, -2.416698, 0, 0, 0, 1, 1,
-0.2592651, -0.5727646, -2.187505, 0, 0, 0, 1, 1,
-0.2583556, 1.392991, 0.5049666, 0, 0, 0, 1, 1,
-0.2572049, 0.6646818, -0.2724993, 1, 1, 1, 1, 1,
-0.256351, 1.078731, -0.1239756, 1, 1, 1, 1, 1,
-0.2556246, -0.3995354, -2.166366, 1, 1, 1, 1, 1,
-0.2549222, 0.8327036, -0.5780186, 1, 1, 1, 1, 1,
-0.2520741, 1.205813, 0.5338592, 1, 1, 1, 1, 1,
-0.2516894, 2.344213, 0.6954631, 1, 1, 1, 1, 1,
-0.247336, -0.3967512, -2.495481, 1, 1, 1, 1, 1,
-0.246982, -0.4677351, -3.54523, 1, 1, 1, 1, 1,
-0.2458478, -1.45198, -2.168664, 1, 1, 1, 1, 1,
-0.2455533, 0.3984509, -0.5137816, 1, 1, 1, 1, 1,
-0.2423192, 0.4521783, -0.7258867, 1, 1, 1, 1, 1,
-0.2350624, 0.4105244, -1.057596, 1, 1, 1, 1, 1,
-0.2307374, 0.2265695, -1.197712, 1, 1, 1, 1, 1,
-0.2307047, 1.370484, -0.3637348, 1, 1, 1, 1, 1,
-0.2304543, -0.9525192, -1.395175, 1, 1, 1, 1, 1,
-0.2283458, 3.340155, -1.390399, 0, 0, 1, 1, 1,
-0.2225685, -0.7614129, -2.034808, 1, 0, 0, 1, 1,
-0.2212975, 1.805146, -1.26672, 1, 0, 0, 1, 1,
-0.2194739, -0.770824, -3.013544, 1, 0, 0, 1, 1,
-0.2174624, 2.376661, 1.494115, 1, 0, 0, 1, 1,
-0.2103469, 0.07679104, 1.033307, 1, 0, 0, 1, 1,
-0.2093584, 2.743685, 1.615399, 0, 0, 0, 1, 1,
-0.2080582, -1.048124, -3.740915, 0, 0, 0, 1, 1,
-0.2070125, -0.7794694, -2.845489, 0, 0, 0, 1, 1,
-0.2062909, 0.4506724, 0.2588804, 0, 0, 0, 1, 1,
-0.2048647, 1.987812, -0.7195109, 0, 0, 0, 1, 1,
-0.2047228, 1.633671, 0.3759574, 0, 0, 0, 1, 1,
-0.2034263, -0.8871669, -2.451199, 0, 0, 0, 1, 1,
-0.2000935, 0.5239622, -0.325167, 1, 1, 1, 1, 1,
-0.1999161, -0.3139993, -3.892706, 1, 1, 1, 1, 1,
-0.1990196, -0.8020865, -2.396674, 1, 1, 1, 1, 1,
-0.19303, 0.661733, -0.1554726, 1, 1, 1, 1, 1,
-0.1907525, 1.355392, -0.6760202, 1, 1, 1, 1, 1,
-0.1883748, 0.06834856, -1.03265, 1, 1, 1, 1, 1,
-0.1837642, 0.8259865, -0.4874136, 1, 1, 1, 1, 1,
-0.1827312, 0.6592261, -1.645589, 1, 1, 1, 1, 1,
-0.1820271, -0.004431119, -2.154301, 1, 1, 1, 1, 1,
-0.1791025, 0.481895, -3.373696, 1, 1, 1, 1, 1,
-0.1788131, -0.8328769, -3.219332, 1, 1, 1, 1, 1,
-0.1787993, -1.528236, -2.801106, 1, 1, 1, 1, 1,
-0.1774903, -0.3433788, -3.601882, 1, 1, 1, 1, 1,
-0.1766795, 1.067528, -1.343657, 1, 1, 1, 1, 1,
-0.1766487, 0.2403146, -1.181927, 1, 1, 1, 1, 1,
-0.1756392, 0.5487166, -2.523472, 0, 0, 1, 1, 1,
-0.1698269, 0.4261196, -0.6184583, 1, 0, 0, 1, 1,
-0.16797, -1.90549, -1.85364, 1, 0, 0, 1, 1,
-0.1643209, 0.9890011, -0.250701, 1, 0, 0, 1, 1,
-0.1564258, -0.1055495, -2.216676, 1, 0, 0, 1, 1,
-0.1563904, 1.347321, -0.6054762, 1, 0, 0, 1, 1,
-0.1562299, -1.003391, -1.191216, 0, 0, 0, 1, 1,
-0.1557909, -0.416921, -2.939425, 0, 0, 0, 1, 1,
-0.1529762, -0.9274223, -3.350842, 0, 0, 0, 1, 1,
-0.1507875, -0.5177378, -2.274141, 0, 0, 0, 1, 1,
-0.1497215, -1.250263, -3.001753, 0, 0, 0, 1, 1,
-0.1491452, -0.4943712, -2.202121, 0, 0, 0, 1, 1,
-0.1447543, -0.2635972, -3.348589, 0, 0, 0, 1, 1,
-0.1433438, -0.1010102, -1.029462, 1, 1, 1, 1, 1,
-0.1337711, -0.587359, -3.015525, 1, 1, 1, 1, 1,
-0.1289994, -1.076948, -4.290206, 1, 1, 1, 1, 1,
-0.1282825, -0.6038815, -3.457247, 1, 1, 1, 1, 1,
-0.126655, -0.1401222, -4.019023, 1, 1, 1, 1, 1,
-0.1224425, 0.4011581, 2.12292, 1, 1, 1, 1, 1,
-0.1189494, 0.3481736, 0.5126081, 1, 1, 1, 1, 1,
-0.1188892, 0.2462028, 1.431453, 1, 1, 1, 1, 1,
-0.1169177, -0.5464113, -1.730399, 1, 1, 1, 1, 1,
-0.11169, -1.684739, -2.941611, 1, 1, 1, 1, 1,
-0.110134, 1.867462, -0.4110322, 1, 1, 1, 1, 1,
-0.1098695, -0.7408332, -3.536177, 1, 1, 1, 1, 1,
-0.1011347, 0.2119746, -0.589857, 1, 1, 1, 1, 1,
-0.09780855, 0.3957187, -1.577794, 1, 1, 1, 1, 1,
-0.09699091, 0.9364598, 1.056487, 1, 1, 1, 1, 1,
-0.09457722, -0.1981065, -2.617222, 0, 0, 1, 1, 1,
-0.09438141, 1.409905, 0.846745, 1, 0, 0, 1, 1,
-0.09239929, -0.07095936, -2.518691, 1, 0, 0, 1, 1,
-0.09143928, 0.4014811, 0.2603029, 1, 0, 0, 1, 1,
-0.09135858, -0.1574834, -2.264418, 1, 0, 0, 1, 1,
-0.09007311, 0.7356584, 0.03901181, 1, 0, 0, 1, 1,
-0.08899172, -1.551466, -5.046849, 0, 0, 0, 1, 1,
-0.08578752, -0.2064753, -2.99601, 0, 0, 0, 1, 1,
-0.06313478, 0.1349162, -0.9191146, 0, 0, 0, 1, 1,
-0.06150002, 0.01882797, -0.6208059, 0, 0, 0, 1, 1,
-0.05513996, -0.7982062, -3.30867, 0, 0, 0, 1, 1,
-0.05430247, 0.3684572, -0.712395, 0, 0, 0, 1, 1,
-0.05395069, -1.139189, -1.916977, 0, 0, 0, 1, 1,
-0.05295486, -1.914288, -3.743606, 1, 1, 1, 1, 1,
-0.0521973, -0.2245176, -4.268891, 1, 1, 1, 1, 1,
-0.04782131, 0.02200506, -0.29334, 1, 1, 1, 1, 1,
-0.04576788, -0.5981207, -2.944964, 1, 1, 1, 1, 1,
-0.03735188, 1.656982, 0.5355636, 1, 1, 1, 1, 1,
-0.03439637, -1.031806, -3.300051, 1, 1, 1, 1, 1,
-0.03404916, 0.3648479, 0.5938781, 1, 1, 1, 1, 1,
-0.02700743, 1.178202, -0.4441878, 1, 1, 1, 1, 1,
-0.02246189, 3.282153, 1.118706, 1, 1, 1, 1, 1,
-0.01676373, -0.3506638, -3.376975, 1, 1, 1, 1, 1,
-0.01604097, 1.148737, -0.160195, 1, 1, 1, 1, 1,
-0.01118148, 0.8400086, -0.8012075, 1, 1, 1, 1, 1,
-0.007305493, 0.627035, -0.3156668, 1, 1, 1, 1, 1,
-0.0071028, -0.7764938, -3.407617, 1, 1, 1, 1, 1,
-0.0002567216, 0.4096006, 0.6905708, 1, 1, 1, 1, 1,
0.003704365, 0.1228782, 2.439068, 0, 0, 1, 1, 1,
0.004393301, -1.668214, 3.201556, 1, 0, 0, 1, 1,
0.008339729, 0.8832422, -1.128136, 1, 0, 0, 1, 1,
0.009665668, 0.879246, -0.2094229, 1, 0, 0, 1, 1,
0.02207261, -0.9991867, 2.562871, 1, 0, 0, 1, 1,
0.02624379, 0.4523054, 1.691667, 1, 0, 0, 1, 1,
0.02986766, -0.9929158, 3.032594, 0, 0, 0, 1, 1,
0.03452607, 0.07036517, -0.4910008, 0, 0, 0, 1, 1,
0.03811011, -0.6582993, 3.263655, 0, 0, 0, 1, 1,
0.04036806, 0.02698639, 1.220495, 0, 0, 0, 1, 1,
0.04148317, 0.04266832, 0.3261032, 0, 0, 0, 1, 1,
0.04268591, -0.8553048, 4.738892, 0, 0, 0, 1, 1,
0.04390123, -1.080343, 1.716679, 0, 0, 0, 1, 1,
0.0452788, 0.2099096, -1.994191, 1, 1, 1, 1, 1,
0.04563067, 0.8221074, -0.6402401, 1, 1, 1, 1, 1,
0.046997, -0.8311012, 2.987119, 1, 1, 1, 1, 1,
0.04791364, 1.901822, 0.6325081, 1, 1, 1, 1, 1,
0.05170344, -0.2077998, 2.761888, 1, 1, 1, 1, 1,
0.05338382, 1.048035, -0.0283633, 1, 1, 1, 1, 1,
0.05339687, 0.3013544, 0.3603097, 1, 1, 1, 1, 1,
0.05421326, 0.144235, 0.9923615, 1, 1, 1, 1, 1,
0.05469433, -1.072347, 3.272903, 1, 1, 1, 1, 1,
0.05610856, 1.263882, -1.054725, 1, 1, 1, 1, 1,
0.05611139, 2.408339, -0.4100419, 1, 1, 1, 1, 1,
0.06348499, -0.3762982, 2.120543, 1, 1, 1, 1, 1,
0.06532095, -0.005402368, 1.345083, 1, 1, 1, 1, 1,
0.06880435, -0.4277519, 2.789886, 1, 1, 1, 1, 1,
0.07026332, 1.939413, 2.078814, 1, 1, 1, 1, 1,
0.07410235, -0.05225106, 1.417295, 0, 0, 1, 1, 1,
0.07530662, -1.510427, 3.359226, 1, 0, 0, 1, 1,
0.07810866, 1.277424, 0.8349466, 1, 0, 0, 1, 1,
0.07842381, 0.063008, 2.690941, 1, 0, 0, 1, 1,
0.07928031, 0.2553559, 1.031828, 1, 0, 0, 1, 1,
0.07936091, -0.9812529, 1.586533, 1, 0, 0, 1, 1,
0.07944033, 1.126465, 0.2708461, 0, 0, 0, 1, 1,
0.08845468, 0.4370803, 0.6403472, 0, 0, 0, 1, 1,
0.08960123, 0.5122893, 0.1744918, 0, 0, 0, 1, 1,
0.09842506, 0.06100565, 1.418237, 0, 0, 0, 1, 1,
0.09862997, -0.1845298, 2.868144, 0, 0, 0, 1, 1,
0.09964413, 1.128921, -2.160248, 0, 0, 0, 1, 1,
0.1032261, 0.04089236, 1.133951, 0, 0, 0, 1, 1,
0.1037346, -0.7624286, 2.877532, 1, 1, 1, 1, 1,
0.1065298, -0.9805133, 3.634253, 1, 1, 1, 1, 1,
0.1081071, 0.3002939, 0.3141773, 1, 1, 1, 1, 1,
0.1114098, 0.6621804, -0.3420416, 1, 1, 1, 1, 1,
0.1122451, 0.5653785, 0.3089844, 1, 1, 1, 1, 1,
0.1146918, 1.210044, 1.315526, 1, 1, 1, 1, 1,
0.1231862, -0.3863728, 2.60781, 1, 1, 1, 1, 1,
0.1233239, -0.1215187, 2.658663, 1, 1, 1, 1, 1,
0.1281729, 1.033293, 0.2330989, 1, 1, 1, 1, 1,
0.1299194, -0.2781692, 1.719046, 1, 1, 1, 1, 1,
0.1313923, 0.8234634, 0.7061381, 1, 1, 1, 1, 1,
0.1315098, -0.7779144, 2.854285, 1, 1, 1, 1, 1,
0.1327488, -0.7734337, 3.168956, 1, 1, 1, 1, 1,
0.1343435, 0.3605117, 0.6972341, 1, 1, 1, 1, 1,
0.1347175, 2.211681, 0.7881948, 1, 1, 1, 1, 1,
0.1359458, -0.3896511, 4.727048, 0, 0, 1, 1, 1,
0.1390858, 0.3639102, 1.2929, 1, 0, 0, 1, 1,
0.1391991, -0.4165294, 3.051596, 1, 0, 0, 1, 1,
0.1395396, 0.1486362, 0.04352308, 1, 0, 0, 1, 1,
0.1442295, 0.8798111, 0.6781371, 1, 0, 0, 1, 1,
0.1562528, 0.1670391, 1.405842, 1, 0, 0, 1, 1,
0.1599513, 0.6127713, -1.111206, 0, 0, 0, 1, 1,
0.1655306, 0.03898557, 1.417409, 0, 0, 0, 1, 1,
0.1658283, 0.7555435, 1.088451, 0, 0, 0, 1, 1,
0.1694118, -1.242431, 4.248244, 0, 0, 0, 1, 1,
0.1722139, -1.385371, 2.509491, 0, 0, 0, 1, 1,
0.1779203, 0.6924794, 1.510845, 0, 0, 0, 1, 1,
0.1781019, 0.8955271, -0.9686561, 0, 0, 0, 1, 1,
0.1820476, 1.351743, -1.563684, 1, 1, 1, 1, 1,
0.1846642, -0.8207802, 3.617305, 1, 1, 1, 1, 1,
0.1885467, -0.4154359, 2.935347, 1, 1, 1, 1, 1,
0.1957766, 0.5154735, -0.3675856, 1, 1, 1, 1, 1,
0.197139, 0.5355143, -1.429949, 1, 1, 1, 1, 1,
0.202031, 1.121548, -0.5409567, 1, 1, 1, 1, 1,
0.2021311, -0.4079638, 3.025619, 1, 1, 1, 1, 1,
0.2029439, 1.879481, -0.03548111, 1, 1, 1, 1, 1,
0.2048312, 1.019452, -1.877085, 1, 1, 1, 1, 1,
0.212066, -0.4462764, 1.558948, 1, 1, 1, 1, 1,
0.2127026, -0.4960242, 3.126399, 1, 1, 1, 1, 1,
0.2145957, 1.417097, -0.8079302, 1, 1, 1, 1, 1,
0.215427, 0.1052009, 0.7511106, 1, 1, 1, 1, 1,
0.2172028, -0.5964352, 1.778641, 1, 1, 1, 1, 1,
0.2178963, 0.1200338, 0.8289192, 1, 1, 1, 1, 1,
0.222979, -0.6590357, 2.302906, 0, 0, 1, 1, 1,
0.2257253, 0.06967265, 1.161934, 1, 0, 0, 1, 1,
0.2261558, 0.04164289, 1.925657, 1, 0, 0, 1, 1,
0.2311249, 0.1262677, 2.35694, 1, 0, 0, 1, 1,
0.2356125, -0.1000918, 2.740479, 1, 0, 0, 1, 1,
0.2357971, 0.6764897, 0.07137863, 1, 0, 0, 1, 1,
0.240408, 1.361755, -0.795825, 0, 0, 0, 1, 1,
0.2466795, -1.368684, 2.797858, 0, 0, 0, 1, 1,
0.2469603, 0.009394457, 0.1587206, 0, 0, 0, 1, 1,
0.248858, 1.360639, -0.8438071, 0, 0, 0, 1, 1,
0.2535699, -1.486486, 3.425214, 0, 0, 0, 1, 1,
0.2562117, -0.3887958, 3.305948, 0, 0, 0, 1, 1,
0.259712, 1.424822, -0.9209094, 0, 0, 0, 1, 1,
0.2681298, 0.02871251, 1.730281, 1, 1, 1, 1, 1,
0.2691975, -0.3448056, 3.376298, 1, 1, 1, 1, 1,
0.2723344, -1.915989, 3.42689, 1, 1, 1, 1, 1,
0.2743371, -1.470035, 1.610455, 1, 1, 1, 1, 1,
0.2794202, -1.040187, 4.19794, 1, 1, 1, 1, 1,
0.2871204, 0.7693958, 1.154449, 1, 1, 1, 1, 1,
0.287585, 0.2719806, 0.1819526, 1, 1, 1, 1, 1,
0.2889739, 1.083902, 0.9128529, 1, 1, 1, 1, 1,
0.2897514, 0.4603272, 0.1988151, 1, 1, 1, 1, 1,
0.296335, -0.4259661, 0.9796723, 1, 1, 1, 1, 1,
0.2994763, 0.3509359, 0.7331572, 1, 1, 1, 1, 1,
0.2995568, -2.48736, 2.872751, 1, 1, 1, 1, 1,
0.3001594, 2.076796, -1.078095, 1, 1, 1, 1, 1,
0.3057838, -0.7097875, 3.700803, 1, 1, 1, 1, 1,
0.3067113, -0.5956104, 2.877138, 1, 1, 1, 1, 1,
0.3076371, -0.739288, 2.135597, 0, 0, 1, 1, 1,
0.308905, -1.856284, 3.765548, 1, 0, 0, 1, 1,
0.3093343, -1.595271, 4.134354, 1, 0, 0, 1, 1,
0.3146427, 0.3967912, 1.070546, 1, 0, 0, 1, 1,
0.3154653, 0.5757857, 2.276515, 1, 0, 0, 1, 1,
0.3161206, -0.4385549, 3.356919, 1, 0, 0, 1, 1,
0.3171957, -1.118219, 2.699454, 0, 0, 0, 1, 1,
0.3196528, 0.3620182, 1.03853, 0, 0, 0, 1, 1,
0.319758, -0.2882369, 2.692768, 0, 0, 0, 1, 1,
0.3201294, 1.486712, 2.510509, 0, 0, 0, 1, 1,
0.3272747, 0.7770427, -0.6077998, 0, 0, 0, 1, 1,
0.329084, -1.053703, 3.627135, 0, 0, 0, 1, 1,
0.3309911, 0.2862273, 1.414878, 0, 0, 0, 1, 1,
0.3324114, 0.449444, 0.3507132, 1, 1, 1, 1, 1,
0.3346605, -0.3287733, 2.963193, 1, 1, 1, 1, 1,
0.334898, 0.05740726, 2.945721, 1, 1, 1, 1, 1,
0.3362122, 1.283859, 0.6498869, 1, 1, 1, 1, 1,
0.3370483, 0.9219491, 2.357838, 1, 1, 1, 1, 1,
0.3371083, 0.02581676, 1.954535, 1, 1, 1, 1, 1,
0.341462, 0.8478479, -0.7346534, 1, 1, 1, 1, 1,
0.346044, 0.09642377, 2.487807, 1, 1, 1, 1, 1,
0.3479423, 0.3097242, 1.510994, 1, 1, 1, 1, 1,
0.3489969, 0.637078, -0.8595122, 1, 1, 1, 1, 1,
0.3508112, -1.539921, 2.154576, 1, 1, 1, 1, 1,
0.3586781, -1.188963, 1.650947, 1, 1, 1, 1, 1,
0.3600142, 0.9087226, 0.2417974, 1, 1, 1, 1, 1,
0.3637074, 0.07574011, 0.7231784, 1, 1, 1, 1, 1,
0.3646142, -0.1642703, 2.455191, 1, 1, 1, 1, 1,
0.364953, 0.2561816, 2.04405, 0, 0, 1, 1, 1,
0.3703745, 0.7346261, 1.212707, 1, 0, 0, 1, 1,
0.3765362, 1.221919, -0.2336909, 1, 0, 0, 1, 1,
0.3787144, -1.60388, 3.709397, 1, 0, 0, 1, 1,
0.379382, 0.8404358, 0.08279248, 1, 0, 0, 1, 1,
0.3823467, 2.102321, 0.186378, 1, 0, 0, 1, 1,
0.3839069, 0.6049913, 2.456852, 0, 0, 0, 1, 1,
0.3840009, 0.8271968, -0.07355473, 0, 0, 0, 1, 1,
0.3849309, 0.8490495, -1.181273, 0, 0, 0, 1, 1,
0.391858, -0.04024773, 2.283974, 0, 0, 0, 1, 1,
0.3940635, -0.3082241, 1.463584, 0, 0, 0, 1, 1,
0.3952815, 1.419532, 1.630187, 0, 0, 0, 1, 1,
0.3986947, -0.008292101, 1.300588, 0, 0, 0, 1, 1,
0.3990372, -0.9109163, 2.971684, 1, 1, 1, 1, 1,
0.399788, 0.7679619, 0.7820182, 1, 1, 1, 1, 1,
0.3999266, 1.429949, -1.843564, 1, 1, 1, 1, 1,
0.4014648, -0.04492747, 2.061621, 1, 1, 1, 1, 1,
0.4019433, -1.323547, 2.574679, 1, 1, 1, 1, 1,
0.4029834, -0.0771129, 0.1806375, 1, 1, 1, 1, 1,
0.4036645, 1.203262, 0.8012821, 1, 1, 1, 1, 1,
0.4074587, -2.174541, 2.880957, 1, 1, 1, 1, 1,
0.4100875, -4.304595, 1.616303, 1, 1, 1, 1, 1,
0.4126955, -0.6864461, 1.99887, 1, 1, 1, 1, 1,
0.4129547, -1.081339, 2.26035, 1, 1, 1, 1, 1,
0.4168411, 0.9932233, 0.8191549, 1, 1, 1, 1, 1,
0.4174831, -0.5182206, 3.840492, 1, 1, 1, 1, 1,
0.4183109, -0.6528609, 3.607128, 1, 1, 1, 1, 1,
0.4191438, 1.115212, 0.5970024, 1, 1, 1, 1, 1,
0.4270751, 0.8485407, 2.77173, 0, 0, 1, 1, 1,
0.4278013, -0.25623, 1.794722, 1, 0, 0, 1, 1,
0.428417, 1.432984, -0.186374, 1, 0, 0, 1, 1,
0.432851, 1.491241, 1.432227, 1, 0, 0, 1, 1,
0.4367896, 0.4439822, 0.9005755, 1, 0, 0, 1, 1,
0.4445021, 0.03884562, 1.556625, 1, 0, 0, 1, 1,
0.4449379, -0.3996316, 2.386523, 0, 0, 0, 1, 1,
0.447962, 1.686373, -0.360029, 0, 0, 0, 1, 1,
0.45093, -1.187305, 3.168489, 0, 0, 0, 1, 1,
0.4593936, -2.596345, 3.805245, 0, 0, 0, 1, 1,
0.4619112, 0.4122461, 0.8648241, 0, 0, 0, 1, 1,
0.4626563, -0.2321982, 1.652661, 0, 0, 0, 1, 1,
0.4631388, 0.6459358, 0.4769133, 0, 0, 0, 1, 1,
0.4660912, 1.033622, -0.3900341, 1, 1, 1, 1, 1,
0.4680317, 0.9143647, -0.2514103, 1, 1, 1, 1, 1,
0.4696821, 0.871958, 0.02643844, 1, 1, 1, 1, 1,
0.4697761, -0.7312273, 3.820049, 1, 1, 1, 1, 1,
0.4759594, 0.208847, 1.983513, 1, 1, 1, 1, 1,
0.4761214, -0.2352991, 1.747428, 1, 1, 1, 1, 1,
0.4770534, -0.1498857, 1.787919, 1, 1, 1, 1, 1,
0.4783755, 0.9339249, -1.529326, 1, 1, 1, 1, 1,
0.4789105, -0.0380841, 2.314236, 1, 1, 1, 1, 1,
0.4853254, 1.066772, -0.9247401, 1, 1, 1, 1, 1,
0.4855698, 0.2499666, 1.075894, 1, 1, 1, 1, 1,
0.489369, 0.4866289, -0.2521707, 1, 1, 1, 1, 1,
0.4896904, 2.069781, 0.50207, 1, 1, 1, 1, 1,
0.4905658, 0.8767793, 0.4066453, 1, 1, 1, 1, 1,
0.4917004, 0.930995, 0.1181769, 1, 1, 1, 1, 1,
0.4951457, 0.6024833, 1.081635, 0, 0, 1, 1, 1,
0.4965955, -0.5340265, 3.358062, 1, 0, 0, 1, 1,
0.5005545, -0.7145431, 2.494332, 1, 0, 0, 1, 1,
0.5012861, 0.3627215, 2.403763, 1, 0, 0, 1, 1,
0.505868, -2.678713, 1.410099, 1, 0, 0, 1, 1,
0.5144195, 0.4025944, 1.368426, 1, 0, 0, 1, 1,
0.5151271, 0.1783258, 1.766367, 0, 0, 0, 1, 1,
0.5173464, 1.039652, 1.927686, 0, 0, 0, 1, 1,
0.5178788, -1.747458, 3.686083, 0, 0, 0, 1, 1,
0.5181071, 0.3997637, 2.543768, 0, 0, 0, 1, 1,
0.5181608, 0.4009092, 0.6101525, 0, 0, 0, 1, 1,
0.5221041, 0.70416, -0.5091592, 0, 0, 0, 1, 1,
0.5247921, 1.008726, -1.298367, 0, 0, 0, 1, 1,
0.5254433, -0.2588663, 1.317335, 1, 1, 1, 1, 1,
0.5264029, -0.8636687, 2.572471, 1, 1, 1, 1, 1,
0.5280403, -0.2551536, 0.9078263, 1, 1, 1, 1, 1,
0.533146, -0.3899335, 1.483695, 1, 1, 1, 1, 1,
0.547127, -2.061824, 1.465762, 1, 1, 1, 1, 1,
0.5504235, 1.870932, 1.840794, 1, 1, 1, 1, 1,
0.5542414, 0.6748649, 0.9240254, 1, 1, 1, 1, 1,
0.5571033, -0.9071265, 0.8655383, 1, 1, 1, 1, 1,
0.5574722, -0.2251043, 1.638119, 1, 1, 1, 1, 1,
0.5582711, -0.3044371, 0.475863, 1, 1, 1, 1, 1,
0.5655373, -2.555841, 2.929515, 1, 1, 1, 1, 1,
0.5683013, -0.5311931, 2.041667, 1, 1, 1, 1, 1,
0.5725978, 1.262904, 0.634999, 1, 1, 1, 1, 1,
0.5730466, -0.2560956, 2.984958, 1, 1, 1, 1, 1,
0.574301, 0.4598218, 2.482653, 1, 1, 1, 1, 1,
0.5748087, -0.8982472, 2.677962, 0, 0, 1, 1, 1,
0.5758181, -0.6308606, 1.241122, 1, 0, 0, 1, 1,
0.5802752, -2.560936, 2.522052, 1, 0, 0, 1, 1,
0.5812932, 2.358472, 1.17433, 1, 0, 0, 1, 1,
0.5851364, 0.0733898, -0.5888704, 1, 0, 0, 1, 1,
0.5877315, -1.411113, 2.852695, 1, 0, 0, 1, 1,
0.5882406, 0.3054482, 1.504524, 0, 0, 0, 1, 1,
0.5895674, 1.547439, 0.5385372, 0, 0, 0, 1, 1,
0.5901342, -0.3204135, 3.14037, 0, 0, 0, 1, 1,
0.5916243, -0.2337464, 0.1028617, 0, 0, 0, 1, 1,
0.5928453, 0.4360688, 1.166238, 0, 0, 0, 1, 1,
0.5929484, -0.4103568, 3.655943, 0, 0, 0, 1, 1,
0.5938295, 0.9620193, 0.1182566, 0, 0, 0, 1, 1,
0.596848, 0.4936685, 2.31398, 1, 1, 1, 1, 1,
0.5977125, -2.349876, 2.876676, 1, 1, 1, 1, 1,
0.6027378, 0.1847152, 0.6392609, 1, 1, 1, 1, 1,
0.6033133, -0.2918221, 1.062124, 1, 1, 1, 1, 1,
0.6036224, -0.2067234, 0.7531238, 1, 1, 1, 1, 1,
0.6039556, -1.53776, 0.7758839, 1, 1, 1, 1, 1,
0.6049626, 0.7235239, 0.1644598, 1, 1, 1, 1, 1,
0.6051339, 0.2331352, 1.255929, 1, 1, 1, 1, 1,
0.6065134, -0.7277203, 1.478933, 1, 1, 1, 1, 1,
0.609466, 0.0757217, 1.180079, 1, 1, 1, 1, 1,
0.6113168, 0.3840787, 1.007649, 1, 1, 1, 1, 1,
0.6124669, -0.1521119, 1.650822, 1, 1, 1, 1, 1,
0.6173321, -1.345826, -0.1067225, 1, 1, 1, 1, 1,
0.6176595, -0.8024359, 3.029727, 1, 1, 1, 1, 1,
0.6177227, 0.7014143, -0.2690808, 1, 1, 1, 1, 1,
0.6181266, -1.463139, 3.243436, 0, 0, 1, 1, 1,
0.6250952, -0.06412575, 2.190415, 1, 0, 0, 1, 1,
0.6363177, -0.3849376, 1.651918, 1, 0, 0, 1, 1,
0.6363449, 0.09743813, 1.730644, 1, 0, 0, 1, 1,
0.642724, -1.512223, 2.377723, 1, 0, 0, 1, 1,
0.6433506, -1.649482, 4.273649, 1, 0, 0, 1, 1,
0.6434481, 0.2166668, 2.477502, 0, 0, 0, 1, 1,
0.645214, 0.6174828, 1.505524, 0, 0, 0, 1, 1,
0.6458597, 0.83134, 0.6969419, 0, 0, 0, 1, 1,
0.6491666, -2.129665, 2.683948, 0, 0, 0, 1, 1,
0.6499216, 1.37933, 1.01132, 0, 0, 0, 1, 1,
0.6509674, -0.734507, 2.922197, 0, 0, 0, 1, 1,
0.6511396, -0.4588158, 0.9624318, 0, 0, 0, 1, 1,
0.6511855, -0.1108692, 2.302939, 1, 1, 1, 1, 1,
0.6532508, 0.01858173, 1.45551, 1, 1, 1, 1, 1,
0.6535723, 1.414003, -0.2767749, 1, 1, 1, 1, 1,
0.6573467, -0.7995825, 2.118782, 1, 1, 1, 1, 1,
0.6615818, 0.1009401, 0.05413866, 1, 1, 1, 1, 1,
0.6619387, -1.419601, 3.674527, 1, 1, 1, 1, 1,
0.6646866, 0.6393097, 2.170425, 1, 1, 1, 1, 1,
0.6665982, -0.02935947, 0.125094, 1, 1, 1, 1, 1,
0.6724975, 0.1748549, 1.857402, 1, 1, 1, 1, 1,
0.6772872, -1.438863, 3.48188, 1, 1, 1, 1, 1,
0.6774092, 0.07659338, 1.797614, 1, 1, 1, 1, 1,
0.6826259, -0.04526442, 0.5135475, 1, 1, 1, 1, 1,
0.6954641, 0.4457196, 1.201141, 1, 1, 1, 1, 1,
0.6956885, -0.8150158, 2.693305, 1, 1, 1, 1, 1,
0.6987122, 0.5757896, 1.297505, 1, 1, 1, 1, 1,
0.7014914, 0.247048, -0.1109245, 0, 0, 1, 1, 1,
0.7053126, -0.6785336, 2.05945, 1, 0, 0, 1, 1,
0.706027, 0.3512607, 2.383168, 1, 0, 0, 1, 1,
0.7093651, 1.404803, -1.519601, 1, 0, 0, 1, 1,
0.7098062, 0.9287736, 0.8112591, 1, 0, 0, 1, 1,
0.7145292, 0.03730921, 1.516887, 1, 0, 0, 1, 1,
0.7274401, -1.011629, 2.910361, 0, 0, 0, 1, 1,
0.7292931, 1.212765, 0.1764443, 0, 0, 0, 1, 1,
0.7301522, 0.1396944, 2.15105, 0, 0, 0, 1, 1,
0.7347292, -0.2777383, 2.531043, 0, 0, 0, 1, 1,
0.7384726, -1.127902, 1.667737, 0, 0, 0, 1, 1,
0.743747, 1.351562, 0.5575758, 0, 0, 0, 1, 1,
0.7472114, 1.06733, 0.4795487, 0, 0, 0, 1, 1,
0.749272, -0.4007491, 2.537274, 1, 1, 1, 1, 1,
0.7498183, 0.08186506, 2.0591, 1, 1, 1, 1, 1,
0.7526246, 0.7615076, 0.7644137, 1, 1, 1, 1, 1,
0.7581758, -3.548499, 2.82207, 1, 1, 1, 1, 1,
0.7584177, 0.5981183, 0.6643535, 1, 1, 1, 1, 1,
0.7646889, 0.41469, 0.9907932, 1, 1, 1, 1, 1,
0.7671316, 0.9481006, -0.437951, 1, 1, 1, 1, 1,
0.7695497, 0.619428, 0.1240677, 1, 1, 1, 1, 1,
0.7736925, -0.0501502, 2.844682, 1, 1, 1, 1, 1,
0.7752693, -0.4259586, 1.643155, 1, 1, 1, 1, 1,
0.7809594, -1.513011, 4.198786, 1, 1, 1, 1, 1,
0.786498, -1.421429, 1.023451, 1, 1, 1, 1, 1,
0.790252, 0.5753388, 1.696652, 1, 1, 1, 1, 1,
0.7914351, 0.5611149, 1.960627, 1, 1, 1, 1, 1,
0.7943339, -0.7967959, 1.911765, 1, 1, 1, 1, 1,
0.8086073, -0.3390093, 1.825286, 0, 0, 1, 1, 1,
0.8114606, -0.5460111, 1.874851, 1, 0, 0, 1, 1,
0.8136802, 1.546265, 1.087766, 1, 0, 0, 1, 1,
0.8206986, -2.084184, 1.200815, 1, 0, 0, 1, 1,
0.8213522, 0.8098213, 1.673686, 1, 0, 0, 1, 1,
0.8365039, -0.2599246, 2.506859, 1, 0, 0, 1, 1,
0.8366829, 0.3493404, -0.5281415, 0, 0, 0, 1, 1,
0.8408034, -2.264478, 1.134616, 0, 0, 0, 1, 1,
0.8442733, 1.077687, 0.5240861, 0, 0, 0, 1, 1,
0.8443803, 0.6739354, 1.567424, 0, 0, 0, 1, 1,
0.8449141, 1.019917, 0.7966392, 0, 0, 0, 1, 1,
0.8529221, -0.3077073, 2.902263, 0, 0, 0, 1, 1,
0.8539689, 2.159791, 1.216731, 0, 0, 0, 1, 1,
0.8617203, -0.5802185, 2.719268, 1, 1, 1, 1, 1,
0.8620064, -1.378428, 2.504469, 1, 1, 1, 1, 1,
0.8668848, -0.3121609, 3.861395, 1, 1, 1, 1, 1,
0.8678598, -0.1192074, 1.810299, 1, 1, 1, 1, 1,
0.8710437, -0.7549784, 1.633262, 1, 1, 1, 1, 1,
0.8834763, -1.444981, 2.220953, 1, 1, 1, 1, 1,
0.8881882, 0.06546605, 1.578838, 1, 1, 1, 1, 1,
0.8978313, 1.453046, 0.1946344, 1, 1, 1, 1, 1,
0.9022561, 0.2115953, 0.4806278, 1, 1, 1, 1, 1,
0.9031923, 0.8784221, 1.276767, 1, 1, 1, 1, 1,
0.9054149, -2.49448, 3.297286, 1, 1, 1, 1, 1,
0.9115604, -0.05295338, 3.46874, 1, 1, 1, 1, 1,
0.9125701, 0.1841904, 1.089187, 1, 1, 1, 1, 1,
0.9174011, 0.8766931, -0.4351985, 1, 1, 1, 1, 1,
0.9219435, 0.1832361, 2.365762, 1, 1, 1, 1, 1,
0.9231393, 0.2400947, 0.6948254, 0, 0, 1, 1, 1,
0.9385693, 0.08331705, 1.580792, 1, 0, 0, 1, 1,
0.9393057, -1.474592, 3.903788, 1, 0, 0, 1, 1,
0.9430635, 0.2330367, 1.846812, 1, 0, 0, 1, 1,
0.9547314, -0.2158403, 2.110776, 1, 0, 0, 1, 1,
0.9548312, -1.686567, 1.864498, 1, 0, 0, 1, 1,
0.9563562, -0.1015219, 2.175308, 0, 0, 0, 1, 1,
0.9580271, 0.4788649, 1.051975, 0, 0, 0, 1, 1,
0.9613681, 2.017961, 1.022792, 0, 0, 0, 1, 1,
0.9634458, 0.9333936, 0.08285064, 0, 0, 0, 1, 1,
0.9718332, 1.479306, 0.6552677, 0, 0, 0, 1, 1,
0.9729654, -0.09469218, 1.739651, 0, 0, 0, 1, 1,
0.9777514, 0.9625781, 0.2577733, 0, 0, 0, 1, 1,
0.9804657, 0.8569934, 2.025934, 1, 1, 1, 1, 1,
0.9808238, -0.8368965, 1.832145, 1, 1, 1, 1, 1,
0.9814854, -0.939937, 2.225267, 1, 1, 1, 1, 1,
0.9843859, -1.186918, 2.576497, 1, 1, 1, 1, 1,
0.9887243, 0.623937, -0.5180916, 1, 1, 1, 1, 1,
0.9924093, 0.2766825, 0.9147326, 1, 1, 1, 1, 1,
0.9979111, -1.373345, 0.8745079, 1, 1, 1, 1, 1,
1.003613, -0.7271242, 3.786569, 1, 1, 1, 1, 1,
1.003856, 0.6136869, 1.941031, 1, 1, 1, 1, 1,
1.00509, 0.8265538, 2.219992, 1, 1, 1, 1, 1,
1.005364, -1.366996, 2.359263, 1, 1, 1, 1, 1,
1.011495, -2.033772, 1.509031, 1, 1, 1, 1, 1,
1.01894, 0.4118733, 0.8021796, 1, 1, 1, 1, 1,
1.019474, 0.1149184, 0.8920118, 1, 1, 1, 1, 1,
1.030892, 0.8600487, 0.482317, 1, 1, 1, 1, 1,
1.034238, 0.1585442, 2.882087, 0, 0, 1, 1, 1,
1.044752, 1.413295, -0.2533348, 1, 0, 0, 1, 1,
1.045263, 1.156958, 1.760195, 1, 0, 0, 1, 1,
1.047441, 0.0846054, 0.669076, 1, 0, 0, 1, 1,
1.060743, -0.1611189, 2.402103, 1, 0, 0, 1, 1,
1.061328, -0.2949601, 1.129444, 1, 0, 0, 1, 1,
1.063104, 0.2376421, 4.095676, 0, 0, 0, 1, 1,
1.070498, 0.9351169, 1.68734, 0, 0, 0, 1, 1,
1.076627, -0.4903729, 2.749891, 0, 0, 0, 1, 1,
1.077608, 0.1767266, 2.056382, 0, 0, 0, 1, 1,
1.079228, -1.843521, 2.499658, 0, 0, 0, 1, 1,
1.080417, 0.5226229, 1.641038, 0, 0, 0, 1, 1,
1.081186, -0.0224068, 3.210226, 0, 0, 0, 1, 1,
1.084656, 1.219582, 0.2058652, 1, 1, 1, 1, 1,
1.085604, -0.0543826, 0.5300477, 1, 1, 1, 1, 1,
1.089939, -2.611589, 0.583711, 1, 1, 1, 1, 1,
1.095349, 0.4381837, 1.82653, 1, 1, 1, 1, 1,
1.098254, -0.9817458, 2.889006, 1, 1, 1, 1, 1,
1.101022, 1.640008, -1.271591, 1, 1, 1, 1, 1,
1.101692, -2.03713, 3.423188, 1, 1, 1, 1, 1,
1.105407, 1.46873, 1.16228, 1, 1, 1, 1, 1,
1.106321, -2.528403, 1.11683, 1, 1, 1, 1, 1,
1.124605, 0.0646362, 2.483462, 1, 1, 1, 1, 1,
1.125446, -0.2488169, 0.926849, 1, 1, 1, 1, 1,
1.149177, -1.14678, 2.171941, 1, 1, 1, 1, 1,
1.149419, 0.927356, 1.01263, 1, 1, 1, 1, 1,
1.15028, 0.5229691, -0.1934955, 1, 1, 1, 1, 1,
1.1545, 1.433286, 0.09586341, 1, 1, 1, 1, 1,
1.164102, -2.074973, 3.785175, 0, 0, 1, 1, 1,
1.166485, 0.614738, 1.805992, 1, 0, 0, 1, 1,
1.175518, -0.04204545, 1.257473, 1, 0, 0, 1, 1,
1.178683, -0.5758736, 0.7536098, 1, 0, 0, 1, 1,
1.185697, -1.430156, 3.310632, 1, 0, 0, 1, 1,
1.185941, 0.2230627, -0.7934954, 1, 0, 0, 1, 1,
1.190007, -0.9315971, 2.310772, 0, 0, 0, 1, 1,
1.215119, 0.1610198, 3.050326, 0, 0, 0, 1, 1,
1.216978, -0.8952972, -0.0191178, 0, 0, 0, 1, 1,
1.219194, 1.52216, -0.07939795, 0, 0, 0, 1, 1,
1.227586, -0.1123154, 0.8506213, 0, 0, 0, 1, 1,
1.233069, 1.060812, 1.696831, 0, 0, 0, 1, 1,
1.241211, -0.7245854, 1.231092, 0, 0, 0, 1, 1,
1.249679, 0.3265914, 0.0349889, 1, 1, 1, 1, 1,
1.264031, 0.06871075, -0.1896882, 1, 1, 1, 1, 1,
1.264821, -1.288107, 2.240705, 1, 1, 1, 1, 1,
1.272486, 1.352772, 1.97428, 1, 1, 1, 1, 1,
1.27415, 1.734287, 0.6431524, 1, 1, 1, 1, 1,
1.277684, 0.006475216, 1.769785, 1, 1, 1, 1, 1,
1.277691, 0.3713014, -0.2135801, 1, 1, 1, 1, 1,
1.282477, 2.110064, 0.6467797, 1, 1, 1, 1, 1,
1.282876, 0.3999821, 0.5028419, 1, 1, 1, 1, 1,
1.28544, 2.094005, 0.9547995, 1, 1, 1, 1, 1,
1.288087, 0.555144, 1.605696, 1, 1, 1, 1, 1,
1.297046, 0.7870814, 1.514331, 1, 1, 1, 1, 1,
1.307305, -0.2680801, 0.0448883, 1, 1, 1, 1, 1,
1.310058, 0.4431565, 2.111655, 1, 1, 1, 1, 1,
1.316288, 0.04777015, 0.3056447, 1, 1, 1, 1, 1,
1.319536, 0.1609253, 2.148843, 0, 0, 1, 1, 1,
1.322369, 0.3406725, 1.669311, 1, 0, 0, 1, 1,
1.356764, 0.4668758, 1.094309, 1, 0, 0, 1, 1,
1.361179, 0.05170491, 1.434863, 1, 0, 0, 1, 1,
1.36291, 0.2163723, 0.8423536, 1, 0, 0, 1, 1,
1.374785, -0.2134135, 3.011142, 1, 0, 0, 1, 1,
1.379543, -0.714104, 2.961456, 0, 0, 0, 1, 1,
1.38162, -1.949862, 1.465113, 0, 0, 0, 1, 1,
1.383751, 1.361019, -0.8949617, 0, 0, 0, 1, 1,
1.38377, 1.033851, -0.5540367, 0, 0, 0, 1, 1,
1.387212, 0.3630722, 1.651202, 0, 0, 0, 1, 1,
1.392276, 0.07357301, 2.385731, 0, 0, 0, 1, 1,
1.397642, 1.070768, 1.929758, 0, 0, 0, 1, 1,
1.40732, -1.7493, 2.983593, 1, 1, 1, 1, 1,
1.411332, -1.740996, 2.200328, 1, 1, 1, 1, 1,
1.414334, 1.14455, 1.380505, 1, 1, 1, 1, 1,
1.414443, 0.7189115, 3.10077, 1, 1, 1, 1, 1,
1.422463, -0.4932119, 3.036469, 1, 1, 1, 1, 1,
1.424362, 1.243118, 1.241492, 1, 1, 1, 1, 1,
1.435552, 0.7741203, 2.703413, 1, 1, 1, 1, 1,
1.441456, 0.4631857, 0.008878855, 1, 1, 1, 1, 1,
1.469245, -0.4472897, 1.172069, 1, 1, 1, 1, 1,
1.479679, 1.635224, 1.685379, 1, 1, 1, 1, 1,
1.47972, -0.6852251, 0.5148957, 1, 1, 1, 1, 1,
1.484343, -0.1005483, 3.206625, 1, 1, 1, 1, 1,
1.484745, 0.6500024, 1.114206, 1, 1, 1, 1, 1,
1.502158, 0.8917508, 1.46996, 1, 1, 1, 1, 1,
1.52653, -0.02551632, 0.7562739, 1, 1, 1, 1, 1,
1.535631, 0.2216416, 0.5309838, 0, 0, 1, 1, 1,
1.559103, 1.045305, 0.5021774, 1, 0, 0, 1, 1,
1.567189, 0.3385834, 1.119931, 1, 0, 0, 1, 1,
1.572532, -1.914863, 1.831974, 1, 0, 0, 1, 1,
1.573771, 0.07794746, 2.163732, 1, 0, 0, 1, 1,
1.5779, -0.1431562, 0.9042391, 1, 0, 0, 1, 1,
1.583831, -0.5592276, 1.002787, 0, 0, 0, 1, 1,
1.599148, 0.2496104, 0.5790529, 0, 0, 0, 1, 1,
1.627473, 1.886957, 2.293514, 0, 0, 0, 1, 1,
1.630237, 0.7326702, 1.511861, 0, 0, 0, 1, 1,
1.66646, 0.1183438, 2.444695, 0, 0, 0, 1, 1,
1.682616, -1.136859, 3.851839, 0, 0, 0, 1, 1,
1.68703, -1.307778, 2.871746, 0, 0, 0, 1, 1,
1.690607, 0.2508173, 0.9348969, 1, 1, 1, 1, 1,
1.697732, 0.3771391, 1.132705, 1, 1, 1, 1, 1,
1.699482, 1.169517, 1.357939, 1, 1, 1, 1, 1,
1.737159, -1.267513, 2.069933, 1, 1, 1, 1, 1,
1.745666, 1.317438, 0.1868814, 1, 1, 1, 1, 1,
1.775038, 0.7300257, 2.508724, 1, 1, 1, 1, 1,
1.784091, -0.9688479, 1.28679, 1, 1, 1, 1, 1,
1.808484, 0.2296358, -0.005488035, 1, 1, 1, 1, 1,
1.82362, 0.1658925, 0.6729733, 1, 1, 1, 1, 1,
1.84077, 0.5609113, 1.109251, 1, 1, 1, 1, 1,
1.841643, 0.465853, 3.552636, 1, 1, 1, 1, 1,
1.862794, 2.240046, -0.01756971, 1, 1, 1, 1, 1,
1.878112, 0.8379412, 1.021385, 1, 1, 1, 1, 1,
1.8853, -0.5775362, 1.854684, 1, 1, 1, 1, 1,
1.892774, -1.508152, 2.183921, 1, 1, 1, 1, 1,
1.894731, -1.545548, 2.289215, 0, 0, 1, 1, 1,
1.964318, 0.2312318, 1.974181, 1, 0, 0, 1, 1,
1.98155, -1.785535, 2.414644, 1, 0, 0, 1, 1,
1.992999, -1.11054, 2.715313, 1, 0, 0, 1, 1,
2.001425, -3.672965, 2.376452, 1, 0, 0, 1, 1,
2.082144, -2.191081, 0.9543281, 1, 0, 0, 1, 1,
2.093272, 2.566172, -0.6802176, 0, 0, 0, 1, 1,
2.144519, 0.4742134, 0.1953039, 0, 0, 0, 1, 1,
2.215358, -0.55349, 2.650811, 0, 0, 0, 1, 1,
2.216846, -0.2872415, 2.094176, 0, 0, 0, 1, 1,
2.23882, 0.4742297, 0.9920211, 0, 0, 0, 1, 1,
2.251173, -1.329386, 1.300862, 0, 0, 0, 1, 1,
2.288958, 0.7627249, 2.069276, 0, 0, 0, 1, 1,
2.311174, -0.8814504, 1.231395, 1, 1, 1, 1, 1,
2.337798, 1.941367, 1.911422, 1, 1, 1, 1, 1,
2.4692, -0.1933819, 3.370052, 1, 1, 1, 1, 1,
2.478539, -0.502836, 2.334329, 1, 1, 1, 1, 1,
2.558197, -1.40974, 1.668684, 1, 1, 1, 1, 1,
2.719779, 0.3077552, 0.6526513, 1, 1, 1, 1, 1,
2.88638, 2.892122, 1.958509, 1, 1, 1, 1, 1
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
var radius = 9.753798;
var distance = 34.2598;
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
mvMatrix.translate( -0.00188911, 0.4490592, 0.5824828 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.2598);
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
