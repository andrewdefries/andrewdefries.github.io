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
-2.92488, 0.09524272, -1.561433, 1, 0, 0, 1,
-2.784585, 0.5572312, -0.2741469, 1, 0.007843138, 0, 1,
-2.721575, -0.5977632, -1.153122, 1, 0.01176471, 0, 1,
-2.629365, -0.07355893, -2.807599, 1, 0.01960784, 0, 1,
-2.586676, -0.9406296, -1.206549, 1, 0.02352941, 0, 1,
-2.525287, -0.1678281, -1.822064, 1, 0.03137255, 0, 1,
-2.448139, -0.06902149, -1.687128, 1, 0.03529412, 0, 1,
-2.382591, 0.477036, -3.380479, 1, 0.04313726, 0, 1,
-2.279707, 1.980635, -0.4780753, 1, 0.04705882, 0, 1,
-2.213967, 0.646647, -3.200991, 1, 0.05490196, 0, 1,
-2.209819, -1.386419, -1.630113, 1, 0.05882353, 0, 1,
-2.199969, -2.356401, -3.671908, 1, 0.06666667, 0, 1,
-2.199249, -0.5224375, -2.099547, 1, 0.07058824, 0, 1,
-2.153916, 0.4435252, -2.410297, 1, 0.07843138, 0, 1,
-2.131434, -0.7088821, -1.920753, 1, 0.08235294, 0, 1,
-2.04647, 0.3967027, -2.893173, 1, 0.09019608, 0, 1,
-2.02277, -0.02674026, -1.985167, 1, 0.09411765, 0, 1,
-1.99844, -0.06691972, -0.8899292, 1, 0.1019608, 0, 1,
-1.992082, 0.2130175, -1.947916, 1, 0.1098039, 0, 1,
-1.975013, -0.07631207, -0.5103235, 1, 0.1137255, 0, 1,
-1.973, -0.4467533, -1.516157, 1, 0.1215686, 0, 1,
-1.937359, 0.09263437, -1.824031, 1, 0.1254902, 0, 1,
-1.920624, 0.320397, -0.9799473, 1, 0.1333333, 0, 1,
-1.905164, -0.5632967, -1.484338, 1, 0.1372549, 0, 1,
-1.89823, -0.1945681, -0.777586, 1, 0.145098, 0, 1,
-1.894559, 0.2682855, -2.096035, 1, 0.1490196, 0, 1,
-1.86841, -1.650762, -2.45948, 1, 0.1568628, 0, 1,
-1.839462, -0.9275228, -2.110476, 1, 0.1607843, 0, 1,
-1.833029, -0.1041028, -0.9280111, 1, 0.1686275, 0, 1,
-1.830809, 0.4664588, -0.1370124, 1, 0.172549, 0, 1,
-1.818499, 0.2468354, -1.582934, 1, 0.1803922, 0, 1,
-1.795746, -0.9343985, -0.8835844, 1, 0.1843137, 0, 1,
-1.784676, -0.9006522, -1.910971, 1, 0.1921569, 0, 1,
-1.772282, 0.2799217, -1.448809, 1, 0.1960784, 0, 1,
-1.767986, 0.1369868, 0.1778868, 1, 0.2039216, 0, 1,
-1.763183, -0.5930322, -1.659876, 1, 0.2117647, 0, 1,
-1.747032, 0.8377007, -0.8834135, 1, 0.2156863, 0, 1,
-1.737553, 0.7919039, -1.739488, 1, 0.2235294, 0, 1,
-1.73381, 1.330884, -0.4377722, 1, 0.227451, 0, 1,
-1.723696, 1.005166, -2.366635, 1, 0.2352941, 0, 1,
-1.715217, 1.0172, -3.658528, 1, 0.2392157, 0, 1,
-1.705176, 0.3939555, -2.996549, 1, 0.2470588, 0, 1,
-1.703595, 0.1643152, -0.7547328, 1, 0.2509804, 0, 1,
-1.695197, 0.3727769, -2.592537, 1, 0.2588235, 0, 1,
-1.691725, -0.7871825, -0.4829745, 1, 0.2627451, 0, 1,
-1.67893, -0.806007, -0.8020858, 1, 0.2705882, 0, 1,
-1.674389, -0.05827537, -1.356654, 1, 0.2745098, 0, 1,
-1.65168, 0.3047646, -2.033765, 1, 0.282353, 0, 1,
-1.637225, -1.870426, -1.96889, 1, 0.2862745, 0, 1,
-1.634683, -0.4755951, -0.4025473, 1, 0.2941177, 0, 1,
-1.633312, 0.6649555, -0.7984971, 1, 0.3019608, 0, 1,
-1.63024, -0.5767748, -2.336822, 1, 0.3058824, 0, 1,
-1.627274, -1.03847, -2.072505, 1, 0.3137255, 0, 1,
-1.627022, 0.5989993, -1.879794, 1, 0.3176471, 0, 1,
-1.614947, -0.6855307, -2.206826, 1, 0.3254902, 0, 1,
-1.608089, 0.9012677, -1.20432, 1, 0.3294118, 0, 1,
-1.596486, 1.150672, -1.532011, 1, 0.3372549, 0, 1,
-1.580473, 0.5452626, -0.6733921, 1, 0.3411765, 0, 1,
-1.568722, -0.04983574, -1.654593, 1, 0.3490196, 0, 1,
-1.552834, -1.049977, 0.1582552, 1, 0.3529412, 0, 1,
-1.532175, 0.8770989, 1.120553, 1, 0.3607843, 0, 1,
-1.519002, 0.4538483, -1.222761, 1, 0.3647059, 0, 1,
-1.504622, 0.6325054, -0.1880983, 1, 0.372549, 0, 1,
-1.503852, -0.1721829, -2.955242, 1, 0.3764706, 0, 1,
-1.492208, -0.5502315, -2.018872, 1, 0.3843137, 0, 1,
-1.484409, -1.280681, -2.821656, 1, 0.3882353, 0, 1,
-1.481276, -0.0551245, -0.826578, 1, 0.3960784, 0, 1,
-1.452208, 0.06981263, -1.146115, 1, 0.4039216, 0, 1,
-1.44833, -1.012336, -1.186267, 1, 0.4078431, 0, 1,
-1.443253, -2.021313, -3.163842, 1, 0.4156863, 0, 1,
-1.439856, 0.3535461, -0.9757282, 1, 0.4196078, 0, 1,
-1.420764, 1.061814, -1.806675, 1, 0.427451, 0, 1,
-1.418316, -0.5605012, -0.05219301, 1, 0.4313726, 0, 1,
-1.416215, 0.4963518, -1.83647, 1, 0.4392157, 0, 1,
-1.415902, 0.509989, -0.4917246, 1, 0.4431373, 0, 1,
-1.408742, -1.020129, -1.509122, 1, 0.4509804, 0, 1,
-1.406434, 0.7644573, -0.8306499, 1, 0.454902, 0, 1,
-1.396723, -1.768946, 0.1540788, 1, 0.4627451, 0, 1,
-1.39209, 2.195731, -1.631006, 1, 0.4666667, 0, 1,
-1.387526, 0.7514739, -1.482916, 1, 0.4745098, 0, 1,
-1.370443, 0.9114251, 0.8563849, 1, 0.4784314, 0, 1,
-1.361964, -0.3170856, 0.2364389, 1, 0.4862745, 0, 1,
-1.350846, 0.9176743, -0.230142, 1, 0.4901961, 0, 1,
-1.348654, 0.3805291, -1.03438, 1, 0.4980392, 0, 1,
-1.345444, 0.1382326, -0.9565545, 1, 0.5058824, 0, 1,
-1.342782, -0.7613411, -1.44337, 1, 0.509804, 0, 1,
-1.335368, 0.01786258, -2.394306, 1, 0.5176471, 0, 1,
-1.330216, -1.272563, -2.19554, 1, 0.5215687, 0, 1,
-1.328227, 0.9177984, -1.554727, 1, 0.5294118, 0, 1,
-1.321431, -0.9210367, -3.303877, 1, 0.5333334, 0, 1,
-1.314611, 1.230656, 0.1386369, 1, 0.5411765, 0, 1,
-1.313428, 0.4157732, -2.726163, 1, 0.5450981, 0, 1,
-1.304793, -0.6560846, -1.458995, 1, 0.5529412, 0, 1,
-1.297363, 0.07571594, 1.205703, 1, 0.5568628, 0, 1,
-1.290316, -0.04099003, -0.9854612, 1, 0.5647059, 0, 1,
-1.281349, 1.23669, 1.055556, 1, 0.5686275, 0, 1,
-1.279293, -1.058862, -2.02983, 1, 0.5764706, 0, 1,
-1.270684, -0.892417, -2.069637, 1, 0.5803922, 0, 1,
-1.254557, 0.0670042, -2.445648, 1, 0.5882353, 0, 1,
-1.252196, 0.1391184, -1.746684, 1, 0.5921569, 0, 1,
-1.247343, 0.4124273, -0.7702608, 1, 0.6, 0, 1,
-1.232957, -0.9035698, -2.944522, 1, 0.6078432, 0, 1,
-1.230889, 0.2572723, -1.311826, 1, 0.6117647, 0, 1,
-1.230777, -0.5399556, -0.8547834, 1, 0.6196079, 0, 1,
-1.229339, -0.8895122, -2.505295, 1, 0.6235294, 0, 1,
-1.226548, -0.4573436, -1.486526, 1, 0.6313726, 0, 1,
-1.22567, -0.2739308, -2.016618, 1, 0.6352941, 0, 1,
-1.223588, 0.712994, -1.937843, 1, 0.6431373, 0, 1,
-1.221231, -0.2871939, -0.3647607, 1, 0.6470588, 0, 1,
-1.217435, 0.9663144, -1.151403, 1, 0.654902, 0, 1,
-1.212638, -0.9654155, -2.223639, 1, 0.6588235, 0, 1,
-1.204759, -1.263283, -1.53212, 1, 0.6666667, 0, 1,
-1.203472, -0.2159735, -1.836511, 1, 0.6705883, 0, 1,
-1.196503, 0.6525084, 0.1999161, 1, 0.6784314, 0, 1,
-1.19613, -0.2035922, -2.094364, 1, 0.682353, 0, 1,
-1.195143, -1.875511, -2.45037, 1, 0.6901961, 0, 1,
-1.191575, 0.02549569, -1.102773, 1, 0.6941177, 0, 1,
-1.189089, -0.8552781, -2.575438, 1, 0.7019608, 0, 1,
-1.187423, -0.5555103, -1.866857, 1, 0.7098039, 0, 1,
-1.180447, 1.984403, -0.2470892, 1, 0.7137255, 0, 1,
-1.180364, -0.6767061, -0.2496344, 1, 0.7215686, 0, 1,
-1.179892, 0.2186568, -1.864668, 1, 0.7254902, 0, 1,
-1.177495, 0.1982104, -1.235312, 1, 0.7333333, 0, 1,
-1.174435, -0.849657, -2.16697, 1, 0.7372549, 0, 1,
-1.172952, -0.3561061, -2.349822, 1, 0.7450981, 0, 1,
-1.166937, 0.009726889, -0.9008765, 1, 0.7490196, 0, 1,
-1.164843, 0.7424071, -0.03537365, 1, 0.7568628, 0, 1,
-1.155872, -2.108801, -2.336679, 1, 0.7607843, 0, 1,
-1.153606, 0.3800572, -1.680489, 1, 0.7686275, 0, 1,
-1.150988, 0.1265961, -2.049993, 1, 0.772549, 0, 1,
-1.149063, -1.639699, -2.866484, 1, 0.7803922, 0, 1,
-1.135381, 0.4938214, -1.193992, 1, 0.7843137, 0, 1,
-1.123862, 0.3278506, -2.485713, 1, 0.7921569, 0, 1,
-1.11617, 2.214369, -1.563386, 1, 0.7960784, 0, 1,
-1.114294, 0.8563408, -1.11184, 1, 0.8039216, 0, 1,
-1.105811, -0.1072695, -2.100056, 1, 0.8117647, 0, 1,
-1.100449, 0.581392, -1.20929, 1, 0.8156863, 0, 1,
-1.0884, -1.688165, -3.416349, 1, 0.8235294, 0, 1,
-1.085624, 1.623141, -0.4009045, 1, 0.827451, 0, 1,
-1.083881, -0.8202451, -1.841638, 1, 0.8352941, 0, 1,
-1.080014, 0.3654982, -0.7063521, 1, 0.8392157, 0, 1,
-1.07767, -0.1606615, -3.266213, 1, 0.8470588, 0, 1,
-1.075112, -0.4240986, -1.815601, 1, 0.8509804, 0, 1,
-1.07413, 0.4319839, -4.047329, 1, 0.8588235, 0, 1,
-1.071846, -1.044405, -3.069748, 1, 0.8627451, 0, 1,
-1.071753, -1.484187, -0.3410202, 1, 0.8705882, 0, 1,
-1.069844, -0.9699152, -3.282845, 1, 0.8745098, 0, 1,
-1.067122, -0.1221597, -2.332377, 1, 0.8823529, 0, 1,
-1.054712, 0.3589143, -2.785689, 1, 0.8862745, 0, 1,
-1.053304, 1.582075, -0.3347194, 1, 0.8941177, 0, 1,
-1.04982, -0.9617912, -1.502929, 1, 0.8980392, 0, 1,
-1.047433, 0.3870371, -2.516824, 1, 0.9058824, 0, 1,
-1.042785, 0.2959568, -1.049529, 1, 0.9137255, 0, 1,
-1.041838, -1.393382, -3.690811, 1, 0.9176471, 0, 1,
-1.040706, -1.052981, -0.6804557, 1, 0.9254902, 0, 1,
-1.040201, 0.002217305, -2.870301, 1, 0.9294118, 0, 1,
-1.039168, 0.5511094, -0.8627953, 1, 0.9372549, 0, 1,
-1.035927, -0.5654089, -0.05058131, 1, 0.9411765, 0, 1,
-1.03316, -0.2256726, -1.53712, 1, 0.9490196, 0, 1,
-1.032949, -1.264781, -3.372878, 1, 0.9529412, 0, 1,
-1.030073, 0.003190195, -2.476002, 1, 0.9607843, 0, 1,
-1.027629, 2.162701, -1.110045, 1, 0.9647059, 0, 1,
-1.026925, -0.1623829, -0.3723864, 1, 0.972549, 0, 1,
-1.026178, -1.058228, -1.289966, 1, 0.9764706, 0, 1,
-1.025269, 1.011523, 1.068248, 1, 0.9843137, 0, 1,
-1.022377, -2.290078, -3.506629, 1, 0.9882353, 0, 1,
-1.017902, -0.3187764, -2.991815, 1, 0.9960784, 0, 1,
-1.009776, 0.02101169, -1.811259, 0.9960784, 1, 0, 1,
-1.005193, 1.648306, -0.4326413, 0.9921569, 1, 0, 1,
-0.9962094, 0.02506144, -2.274111, 0.9843137, 1, 0, 1,
-0.9871163, 0.6662464, 0.02824418, 0.9803922, 1, 0, 1,
-0.9846666, 0.232799, -2.011633, 0.972549, 1, 0, 1,
-0.9841914, 1.136025, -1.611121, 0.9686275, 1, 0, 1,
-0.9666236, 1.786591, -0.8861393, 0.9607843, 1, 0, 1,
-0.9602794, 0.1764461, -1.743051, 0.9568627, 1, 0, 1,
-0.9579222, -1.314587, -1.277255, 0.9490196, 1, 0, 1,
-0.956154, -0.561481, -2.003455, 0.945098, 1, 0, 1,
-0.9507385, 1.893899, 0.8539223, 0.9372549, 1, 0, 1,
-0.9475726, 0.7488827, -1.305003, 0.9333333, 1, 0, 1,
-0.9420803, -0.5058344, -3.475901, 0.9254902, 1, 0, 1,
-0.9320072, -0.8839441, -3.654042, 0.9215686, 1, 0, 1,
-0.9311963, -0.9242703, -2.906604, 0.9137255, 1, 0, 1,
-0.9225219, 0.4379869, -1.098401, 0.9098039, 1, 0, 1,
-0.921819, 1.246688, -0.8522051, 0.9019608, 1, 0, 1,
-0.9187317, -0.3275217, -0.843255, 0.8941177, 1, 0, 1,
-0.9181986, 0.4611674, 0.1830624, 0.8901961, 1, 0, 1,
-0.9178961, 0.243102, -1.088513, 0.8823529, 1, 0, 1,
-0.9168495, 1.656574, -0.5000972, 0.8784314, 1, 0, 1,
-0.9151756, -0.2456012, -0.7091039, 0.8705882, 1, 0, 1,
-0.9151455, -1.038168, -2.175062, 0.8666667, 1, 0, 1,
-0.9120373, 0.2297871, 0.4852334, 0.8588235, 1, 0, 1,
-0.9113346, -1.120096, -2.13198, 0.854902, 1, 0, 1,
-0.9064198, 0.8023829, 0.2658562, 0.8470588, 1, 0, 1,
-0.9046422, 1.007067, 0.111202, 0.8431373, 1, 0, 1,
-0.9037623, 1.356376, -1.533932, 0.8352941, 1, 0, 1,
-0.8991451, -0.4162578, -0.1090501, 0.8313726, 1, 0, 1,
-0.897144, -1.739965, -4.281264, 0.8235294, 1, 0, 1,
-0.8870328, -2.09136, -1.315373, 0.8196079, 1, 0, 1,
-0.8849069, -2.003986, -3.665151, 0.8117647, 1, 0, 1,
-0.8828833, 0.5818359, -1.626599, 0.8078431, 1, 0, 1,
-0.8773715, -1.034022, -0.810335, 0.8, 1, 0, 1,
-0.8772911, 2.216467, 1.491729, 0.7921569, 1, 0, 1,
-0.8761491, -0.2592412, -4.363484, 0.7882353, 1, 0, 1,
-0.8734284, 0.1661465, -2.540193, 0.7803922, 1, 0, 1,
-0.8732343, 0.4369603, -0.2424155, 0.7764706, 1, 0, 1,
-0.8680099, -1.192021, -3.684551, 0.7686275, 1, 0, 1,
-0.8669624, -1.771007, -0.9570346, 0.7647059, 1, 0, 1,
-0.8638567, -1.966, -3.222056, 0.7568628, 1, 0, 1,
-0.8599492, -0.2024494, -2.525724, 0.7529412, 1, 0, 1,
-0.8540341, -0.677339, -2.68718, 0.7450981, 1, 0, 1,
-0.8500084, 2.388554, -0.93313, 0.7411765, 1, 0, 1,
-0.8436816, -1.093832, -2.432483, 0.7333333, 1, 0, 1,
-0.8407034, 0.7542214, -0.334023, 0.7294118, 1, 0, 1,
-0.8355487, -0.2870328, -1.005101, 0.7215686, 1, 0, 1,
-0.8348594, 0.7292901, -1.228071, 0.7176471, 1, 0, 1,
-0.8323582, -0.4251475, -2.749963, 0.7098039, 1, 0, 1,
-0.829212, -0.6818118, -1.476914, 0.7058824, 1, 0, 1,
-0.8245558, -0.3852761, -2.276988, 0.6980392, 1, 0, 1,
-0.8196148, 0.8123881, -2.591183, 0.6901961, 1, 0, 1,
-0.8161235, 0.5721325, -1.421941, 0.6862745, 1, 0, 1,
-0.8146126, 0.4376627, -2.599978, 0.6784314, 1, 0, 1,
-0.8091773, -1.379815, -3.187425, 0.6745098, 1, 0, 1,
-0.8088356, -1.151956, -3.29003, 0.6666667, 1, 0, 1,
-0.8082856, -0.6499348, -2.148, 0.6627451, 1, 0, 1,
-0.8080276, 1.424693, -0.8804424, 0.654902, 1, 0, 1,
-0.8077536, 0.3892348, -0.8037589, 0.6509804, 1, 0, 1,
-0.8033433, -0.8106742, -1.321142, 0.6431373, 1, 0, 1,
-0.8032913, -0.9537674, -2.799432, 0.6392157, 1, 0, 1,
-0.8007728, -0.7018073, -2.850525, 0.6313726, 1, 0, 1,
-0.7995977, 0.5535322, -0.7234464, 0.627451, 1, 0, 1,
-0.7994146, -2.333189, -4.046219, 0.6196079, 1, 0, 1,
-0.7965698, 1.489966, -2.693656, 0.6156863, 1, 0, 1,
-0.7910652, 0.2305879, -3.047447, 0.6078432, 1, 0, 1,
-0.7843229, -0.7065521, -1.679932, 0.6039216, 1, 0, 1,
-0.7839833, 0.8035467, -0.8623668, 0.5960785, 1, 0, 1,
-0.7837588, 0.4655772, -3.0257, 0.5882353, 1, 0, 1,
-0.7824492, 0.8428609, 0.6864783, 0.5843138, 1, 0, 1,
-0.7813939, 2.187918, -0.1736765, 0.5764706, 1, 0, 1,
-0.780433, -0.933753, -1.713999, 0.572549, 1, 0, 1,
-0.7801956, 0.9800646, 0.4773757, 0.5647059, 1, 0, 1,
-0.7801557, -0.6072378, -1.591648, 0.5607843, 1, 0, 1,
-0.7759159, 0.2132373, -0.6949552, 0.5529412, 1, 0, 1,
-0.7755488, 1.061235, 0.1886214, 0.5490196, 1, 0, 1,
-0.7666989, -0.01635751, -2.245909, 0.5411765, 1, 0, 1,
-0.7661787, 1.466883, -0.5182489, 0.5372549, 1, 0, 1,
-0.7611148, -1.327062, -1.41552, 0.5294118, 1, 0, 1,
-0.7596272, -0.3716027, -2.105332, 0.5254902, 1, 0, 1,
-0.7557119, 1.651327, -1.960484, 0.5176471, 1, 0, 1,
-0.7476909, -0.4503909, -2.730782, 0.5137255, 1, 0, 1,
-0.7450253, 0.3273007, 0.1511237, 0.5058824, 1, 0, 1,
-0.7447245, 1.124157, -0.05923814, 0.5019608, 1, 0, 1,
-0.7392127, 0.9059078, -0.08071846, 0.4941176, 1, 0, 1,
-0.7390223, -0.8300901, -1.74088, 0.4862745, 1, 0, 1,
-0.7323654, 1.532502, 0.7760701, 0.4823529, 1, 0, 1,
-0.730872, 0.4270017, -2.045618, 0.4745098, 1, 0, 1,
-0.7300184, -1.744484, -1.402931, 0.4705882, 1, 0, 1,
-0.7291008, -0.3440307, -1.054251, 0.4627451, 1, 0, 1,
-0.7170584, 0.7243444, 1.032305, 0.4588235, 1, 0, 1,
-0.7162074, 1.561199, -1.928545, 0.4509804, 1, 0, 1,
-0.712758, 0.5277109, -0.5970502, 0.4470588, 1, 0, 1,
-0.7098722, 0.2395461, -0.8316743, 0.4392157, 1, 0, 1,
-0.7063044, 0.6875517, -0.6107602, 0.4352941, 1, 0, 1,
-0.70496, 1.110082, 0.1413098, 0.427451, 1, 0, 1,
-0.7024694, -0.31162, -1.70662, 0.4235294, 1, 0, 1,
-0.7022299, -0.4497667, -2.141449, 0.4156863, 1, 0, 1,
-0.7010252, 0.2894596, 1.097677, 0.4117647, 1, 0, 1,
-0.6979381, 0.7999775, -1.382034, 0.4039216, 1, 0, 1,
-0.6925941, 1.534392, 0.2779092, 0.3960784, 1, 0, 1,
-0.691451, -0.2491615, -2.16928, 0.3921569, 1, 0, 1,
-0.6861796, -1.303214, -3.971001, 0.3843137, 1, 0, 1,
-0.6841889, -2.121656, -1.55801, 0.3803922, 1, 0, 1,
-0.6828672, 0.8474711, 1.238224, 0.372549, 1, 0, 1,
-0.6755689, -1.868513, -3.347128, 0.3686275, 1, 0, 1,
-0.6726108, 0.3266649, -2.230184, 0.3607843, 1, 0, 1,
-0.6713855, -0.01929979, -1.729777, 0.3568628, 1, 0, 1,
-0.6618831, -0.8435457, -3.484018, 0.3490196, 1, 0, 1,
-0.6617633, -0.09250718, -2.092171, 0.345098, 1, 0, 1,
-0.661636, -1.05745, -2.743257, 0.3372549, 1, 0, 1,
-0.6547076, -1.152522, -3.488328, 0.3333333, 1, 0, 1,
-0.65353, -0.6082184, -3.068671, 0.3254902, 1, 0, 1,
-0.6515822, -0.17986, -3.393514, 0.3215686, 1, 0, 1,
-0.6473503, -0.6314961, -3.770929, 0.3137255, 1, 0, 1,
-0.6451226, -1.675459, -2.513396, 0.3098039, 1, 0, 1,
-0.6431746, 0.6133021, -1.382005, 0.3019608, 1, 0, 1,
-0.638702, -1.336428, -3.696817, 0.2941177, 1, 0, 1,
-0.6369544, -0.420402, -1.772909, 0.2901961, 1, 0, 1,
-0.6348185, 1.152398, -0.9404989, 0.282353, 1, 0, 1,
-0.6332236, 0.5453413, -0.3521143, 0.2784314, 1, 0, 1,
-0.6274936, 0.8280781, -1.438213, 0.2705882, 1, 0, 1,
-0.6268274, 0.2931145, -0.8694947, 0.2666667, 1, 0, 1,
-0.6159593, 1.596206, -1.408173, 0.2588235, 1, 0, 1,
-0.6101282, 1.981495, -0.7898021, 0.254902, 1, 0, 1,
-0.6073977, -0.3054948, -1.086574, 0.2470588, 1, 0, 1,
-0.6064001, 0.4725642, -2.528489, 0.2431373, 1, 0, 1,
-0.6063991, -2.390566, -1.647952, 0.2352941, 1, 0, 1,
-0.6046285, -1.098229, -2.176022, 0.2313726, 1, 0, 1,
-0.6035114, 1.939325, 0.2519887, 0.2235294, 1, 0, 1,
-0.5949017, 0.6849412, -0.1082203, 0.2196078, 1, 0, 1,
-0.5907214, -0.4624132, -2.062016, 0.2117647, 1, 0, 1,
-0.5836871, 0.5008821, -1.205803, 0.2078431, 1, 0, 1,
-0.5815395, 0.3377804, -0.4117719, 0.2, 1, 0, 1,
-0.5798763, 1.035642, -0.7919568, 0.1921569, 1, 0, 1,
-0.5776958, -0.4356227, -2.017937, 0.1882353, 1, 0, 1,
-0.5748315, -0.2712252, -0.6600662, 0.1803922, 1, 0, 1,
-0.570308, -0.2079387, -2.51544, 0.1764706, 1, 0, 1,
-0.5687436, 1.059338, -0.7490807, 0.1686275, 1, 0, 1,
-0.5669704, 0.08369268, -1.378722, 0.1647059, 1, 0, 1,
-0.5643154, -0.9966176, -3.143854, 0.1568628, 1, 0, 1,
-0.5602896, 2.52429, 0.9184837, 0.1529412, 1, 0, 1,
-0.5594524, 1.077145, -0.8920987, 0.145098, 1, 0, 1,
-0.5505978, 0.7235816, 0.1867361, 0.1411765, 1, 0, 1,
-0.5483577, 1.206351, -1.087569, 0.1333333, 1, 0, 1,
-0.5470909, 0.2747267, 0.0302532, 0.1294118, 1, 0, 1,
-0.5449921, -0.9395357, -2.539862, 0.1215686, 1, 0, 1,
-0.5413297, 1.158193, -0.1806475, 0.1176471, 1, 0, 1,
-0.5370101, 0.7481752, -1.191596, 0.1098039, 1, 0, 1,
-0.5351135, 1.000416, 0.4995675, 0.1058824, 1, 0, 1,
-0.5276407, -0.2840605, -2.790042, 0.09803922, 1, 0, 1,
-0.5268474, 1.435247, -0.1102642, 0.09019608, 1, 0, 1,
-0.5156657, -1.24877, -2.975675, 0.08627451, 1, 0, 1,
-0.5143834, -1.359372, -2.18701, 0.07843138, 1, 0, 1,
-0.5063764, 0.4365938, -1.56955, 0.07450981, 1, 0, 1,
-0.5035532, -0.6749011, -1.290329, 0.06666667, 1, 0, 1,
-0.5031551, -0.6641017, -2.679596, 0.0627451, 1, 0, 1,
-0.4974065, -1.722166, -2.526076, 0.05490196, 1, 0, 1,
-0.4961984, -0.5766532, -1.99567, 0.05098039, 1, 0, 1,
-0.4943157, 0.02034027, -3.14498, 0.04313726, 1, 0, 1,
-0.4941727, 1.02286, 0.06911273, 0.03921569, 1, 0, 1,
-0.4840919, -0.4912934, -4.188382, 0.03137255, 1, 0, 1,
-0.4831121, -1.188738, -3.097161, 0.02745098, 1, 0, 1,
-0.4819221, -0.6949505, -2.039816, 0.01960784, 1, 0, 1,
-0.4796861, 2.119855, -0.3384983, 0.01568628, 1, 0, 1,
-0.4793718, 2.695202, -0.1459915, 0.007843138, 1, 0, 1,
-0.4775373, -0.7144138, -0.3683039, 0.003921569, 1, 0, 1,
-0.4687959, -0.8938689, -3.859695, 0, 1, 0.003921569, 1,
-0.4631998, -0.4616717, -1.571905, 0, 1, 0.01176471, 1,
-0.460717, 0.4882806, -0.5007958, 0, 1, 0.01568628, 1,
-0.454492, -0.7488409, -2.917908, 0, 1, 0.02352941, 1,
-0.4535995, -1.854779, -3.304691, 0, 1, 0.02745098, 1,
-0.4522186, -0.02706134, -2.312913, 0, 1, 0.03529412, 1,
-0.4461202, 2.59084, 0.009224947, 0, 1, 0.03921569, 1,
-0.4452055, -1.097237, -2.201244, 0, 1, 0.04705882, 1,
-0.4420465, -0.3545806, -3.141079, 0, 1, 0.05098039, 1,
-0.4336719, -0.09070179, -4.181876, 0, 1, 0.05882353, 1,
-0.4243997, -0.5168555, -4.959362, 0, 1, 0.0627451, 1,
-0.4189681, 1.197395, 0.2762427, 0, 1, 0.07058824, 1,
-0.4139659, 0.5870458, -1.238779, 0, 1, 0.07450981, 1,
-0.4138692, -0.2500137, -1.363862, 0, 1, 0.08235294, 1,
-0.4131449, -1.382147, -2.139798, 0, 1, 0.08627451, 1,
-0.4126208, -0.4009041, -2.214953, 0, 1, 0.09411765, 1,
-0.4119209, -1.150568, -3.848681, 0, 1, 0.1019608, 1,
-0.4118609, -0.03844016, 0.07848736, 0, 1, 0.1058824, 1,
-0.4059296, -0.1000174, -1.523212, 0, 1, 0.1137255, 1,
-0.4050116, 1.44694, -3.38303, 0, 1, 0.1176471, 1,
-0.40432, -0.6144486, -1.867275, 0, 1, 0.1254902, 1,
-0.4038122, -0.3818569, -2.617743, 0, 1, 0.1294118, 1,
-0.3993703, -0.318841, -3.424417, 0, 1, 0.1372549, 1,
-0.39873, -0.5972909, -2.514061, 0, 1, 0.1411765, 1,
-0.3984513, 1.580913, -0.1317099, 0, 1, 0.1490196, 1,
-0.3877155, -0.1737734, -0.5762007, 0, 1, 0.1529412, 1,
-0.3845733, -0.1652332, -1.724731, 0, 1, 0.1607843, 1,
-0.3766246, -0.5016568, -1.892259, 0, 1, 0.1647059, 1,
-0.3705827, -0.6429219, -1.730021, 0, 1, 0.172549, 1,
-0.3693019, 0.2688662, -2.491211, 0, 1, 0.1764706, 1,
-0.3686109, -1.212816, -3.111546, 0, 1, 0.1843137, 1,
-0.3678438, 1.31127, 1.476385, 0, 1, 0.1882353, 1,
-0.3670541, -0.7888392, -1.336133, 0, 1, 0.1960784, 1,
-0.3655842, 0.6991312, -0.3809511, 0, 1, 0.2039216, 1,
-0.3591861, -0.7115204, -1.832569, 0, 1, 0.2078431, 1,
-0.35353, 0.1239348, -0.3774486, 0, 1, 0.2156863, 1,
-0.3532542, 0.3333353, -1.787004, 0, 1, 0.2196078, 1,
-0.3523587, 1.605723, 0.05910669, 0, 1, 0.227451, 1,
-0.3502864, -1.409346, -3.420527, 0, 1, 0.2313726, 1,
-0.3429507, -2.814306, -0.8863623, 0, 1, 0.2392157, 1,
-0.3429424, 0.2180181, -1.635043, 0, 1, 0.2431373, 1,
-0.3426313, -0.3377106, -3.518765, 0, 1, 0.2509804, 1,
-0.3408731, -1.279466, -4.081249, 0, 1, 0.254902, 1,
-0.3399355, 0.0508131, -1.312435, 0, 1, 0.2627451, 1,
-0.337022, 0.3050742, -0.3669877, 0, 1, 0.2666667, 1,
-0.3310889, 0.2108022, 0.3969652, 0, 1, 0.2745098, 1,
-0.3237747, 0.9672458, -0.1131381, 0, 1, 0.2784314, 1,
-0.3236491, 0.9450653, 0.152957, 0, 1, 0.2862745, 1,
-0.3195069, 0.5991437, 1.086192, 0, 1, 0.2901961, 1,
-0.3166474, 0.06022472, -1.559642, 0, 1, 0.2980392, 1,
-0.3164545, -0.2736795, -2.157131, 0, 1, 0.3058824, 1,
-0.3162616, 0.2668995, -0.2332758, 0, 1, 0.3098039, 1,
-0.3151374, 0.6214705, -0.2956146, 0, 1, 0.3176471, 1,
-0.3134, -0.904843, -3.624072, 0, 1, 0.3215686, 1,
-0.3090374, 0.1308992, -0.7317215, 0, 1, 0.3294118, 1,
-0.3047324, -2.042904, -3.010627, 0, 1, 0.3333333, 1,
-0.3005848, 0.2855836, 1.086832, 0, 1, 0.3411765, 1,
-0.2986459, 0.3396829, -0.4164694, 0, 1, 0.345098, 1,
-0.2981893, 0.3676173, -0.6049944, 0, 1, 0.3529412, 1,
-0.2938458, 0.09939492, -1.8187, 0, 1, 0.3568628, 1,
-0.2922546, 0.2204312, -0.5941616, 0, 1, 0.3647059, 1,
-0.2914354, -1.019556, -0.9413006, 0, 1, 0.3686275, 1,
-0.2842506, 0.1468208, -0.01216261, 0, 1, 0.3764706, 1,
-0.2827048, -0.4001553, -3.575575, 0, 1, 0.3803922, 1,
-0.2790441, -1.025814, -4.177094, 0, 1, 0.3882353, 1,
-0.2783818, -1.009321, -3.320288, 0, 1, 0.3921569, 1,
-0.2780793, -0.1429745, -2.511293, 0, 1, 0.4, 1,
-0.2767857, -0.1027189, -1.534294, 0, 1, 0.4078431, 1,
-0.2758282, -1.364226, -3.252648, 0, 1, 0.4117647, 1,
-0.26504, -1.012647, -2.264967, 0, 1, 0.4196078, 1,
-0.2598331, 0.7136878, -1.013507, 0, 1, 0.4235294, 1,
-0.2578517, -1.740941, -2.099751, 0, 1, 0.4313726, 1,
-0.2556994, 1.525618, 1.866136, 0, 1, 0.4352941, 1,
-0.2518375, -0.2534728, -1.337313, 0, 1, 0.4431373, 1,
-0.2518239, -0.51499, -2.55264, 0, 1, 0.4470588, 1,
-0.251065, 0.3802138, -0.278841, 0, 1, 0.454902, 1,
-0.2506565, -0.8586712, -4.286495, 0, 1, 0.4588235, 1,
-0.2501377, 1.193637, -1.370278, 0, 1, 0.4666667, 1,
-0.2491002, -0.3321066, -1.109712, 0, 1, 0.4705882, 1,
-0.2447649, 0.1849331, -0.7523221, 0, 1, 0.4784314, 1,
-0.2415735, 2.61017, 0.6418644, 0, 1, 0.4823529, 1,
-0.2372386, -0.3612998, -3.693333, 0, 1, 0.4901961, 1,
-0.2294147, 1.068447, 0.9809033, 0, 1, 0.4941176, 1,
-0.2280456, 1.175487, -1.529607, 0, 1, 0.5019608, 1,
-0.225764, -0.2069404, -2.547257, 0, 1, 0.509804, 1,
-0.2213075, -0.5509174, -2.970708, 0, 1, 0.5137255, 1,
-0.2181512, -0.9028993, -1.916913, 0, 1, 0.5215687, 1,
-0.2163278, -0.9390471, -4.541023, 0, 1, 0.5254902, 1,
-0.2162978, 2.299889, 1.728795, 0, 1, 0.5333334, 1,
-0.2159237, 1.711189, -2.188338, 0, 1, 0.5372549, 1,
-0.2132504, -1.83156, -2.759046, 0, 1, 0.5450981, 1,
-0.205998, 0.2143634, -0.7259639, 0, 1, 0.5490196, 1,
-0.2031289, 1.584801, -0.2989845, 0, 1, 0.5568628, 1,
-0.2022987, -1.401513, -3.119816, 0, 1, 0.5607843, 1,
-0.2015713, -0.8385478, -1.461197, 0, 1, 0.5686275, 1,
-0.2008774, -0.06091867, -2.180582, 0, 1, 0.572549, 1,
-0.2001778, -0.2546434, -2.20018, 0, 1, 0.5803922, 1,
-0.1941053, -1.629095, -2.720939, 0, 1, 0.5843138, 1,
-0.1933493, -0.08722819, -3.262077, 0, 1, 0.5921569, 1,
-0.1905404, -0.8618693, -1.336042, 0, 1, 0.5960785, 1,
-0.1884766, 1.135656, 0.6559503, 0, 1, 0.6039216, 1,
-0.1877372, -0.5289559, -1.435693, 0, 1, 0.6117647, 1,
-0.1751997, 0.4872172, 0.2982475, 0, 1, 0.6156863, 1,
-0.1735277, -1.085199, -4.402803, 0, 1, 0.6235294, 1,
-0.1717096, 0.1328786, -0.3742387, 0, 1, 0.627451, 1,
-0.1699422, -0.6969589, -2.106256, 0, 1, 0.6352941, 1,
-0.1628885, 0.5234045, 0.470637, 0, 1, 0.6392157, 1,
-0.1624066, -0.8056163, -2.794158, 0, 1, 0.6470588, 1,
-0.1623189, -1.224407, -2.032558, 0, 1, 0.6509804, 1,
-0.1618715, 1.33454, 1.260478, 0, 1, 0.6588235, 1,
-0.1557639, 1.932984, -0.8022678, 0, 1, 0.6627451, 1,
-0.1534396, 0.2110097, 0.8892154, 0, 1, 0.6705883, 1,
-0.1532377, 1.854755, 0.4732606, 0, 1, 0.6745098, 1,
-0.1497456, 0.8883717, -1.268497, 0, 1, 0.682353, 1,
-0.1490555, 0.3363712, 0.5079491, 0, 1, 0.6862745, 1,
-0.1478559, -0.4282005, -3.228404, 0, 1, 0.6941177, 1,
-0.1463905, -0.3563384, -2.325389, 0, 1, 0.7019608, 1,
-0.1423933, 0.07016422, -0.1747089, 0, 1, 0.7058824, 1,
-0.1397836, 0.1683693, -0.1210364, 0, 1, 0.7137255, 1,
-0.1378163, 0.354211, -0.4290479, 0, 1, 0.7176471, 1,
-0.1335105, -2.711167, -3.315713, 0, 1, 0.7254902, 1,
-0.1318808, 0.7009405, -0.2039664, 0, 1, 0.7294118, 1,
-0.1262805, -0.1346737, -1.226138, 0, 1, 0.7372549, 1,
-0.1239892, 1.971379, 0.8319443, 0, 1, 0.7411765, 1,
-0.1182707, -0.6455092, -1.091835, 0, 1, 0.7490196, 1,
-0.1178063, 0.5001701, -0.02117521, 0, 1, 0.7529412, 1,
-0.1110711, -0.6394776, -4.074774, 0, 1, 0.7607843, 1,
-0.1109805, 0.5942244, -0.847169, 0, 1, 0.7647059, 1,
-0.1104561, 2.371813, -0.03431004, 0, 1, 0.772549, 1,
-0.1075748, 0.6275752, -1.027605, 0, 1, 0.7764706, 1,
-0.1072065, 0.3304276, -2.624778, 0, 1, 0.7843137, 1,
-0.1056326, -0.2847522, -3.483153, 0, 1, 0.7882353, 1,
-0.1028401, -0.2933008, -1.939636, 0, 1, 0.7960784, 1,
-0.1000012, 0.5056016, -0.4617979, 0, 1, 0.8039216, 1,
-0.09458178, 0.851976, -0.02847847, 0, 1, 0.8078431, 1,
-0.09383766, 0.8518937, 0.5504586, 0, 1, 0.8156863, 1,
-0.09222652, -0.7206412, -3.551369, 0, 1, 0.8196079, 1,
-0.09102038, 0.1359804, 0.0547731, 0, 1, 0.827451, 1,
-0.08916637, 0.2486788, 0.5859859, 0, 1, 0.8313726, 1,
-0.08056775, -1.989822, -4.027907, 0, 1, 0.8392157, 1,
-0.0752855, -0.4997875, -3.340868, 0, 1, 0.8431373, 1,
-0.07457243, -0.5976246, -2.910861, 0, 1, 0.8509804, 1,
-0.0712113, -1.136552, -1.875497, 0, 1, 0.854902, 1,
-0.06737819, -1.212832, -3.713966, 0, 1, 0.8627451, 1,
-0.06710934, -1.239244, -4.542311, 0, 1, 0.8666667, 1,
-0.06632653, -0.3267123, -4.794957, 0, 1, 0.8745098, 1,
-0.06557774, -0.2920639, -1.318705, 0, 1, 0.8784314, 1,
-0.06412724, -0.3137807, -2.119968, 0, 1, 0.8862745, 1,
-0.0637871, 0.2872659, 0.2906264, 0, 1, 0.8901961, 1,
-0.06286547, 0.8991804, -0.7636613, 0, 1, 0.8980392, 1,
-0.06273267, -2.123509, -1.616453, 0, 1, 0.9058824, 1,
-0.06100151, -0.7354085, -3.71407, 0, 1, 0.9098039, 1,
-0.05800922, 0.3828097, 0.2264843, 0, 1, 0.9176471, 1,
-0.05579155, 1.109851, -0.2445956, 0, 1, 0.9215686, 1,
-0.05149674, 1.087494, -0.01720123, 0, 1, 0.9294118, 1,
-0.04445388, 0.243837, 0.4225874, 0, 1, 0.9333333, 1,
-0.04320173, 1.242518, -1.146813, 0, 1, 0.9411765, 1,
-0.0428545, 0.1900685, -0.1027098, 0, 1, 0.945098, 1,
-0.04260634, -0.1348094, -3.359636, 0, 1, 0.9529412, 1,
-0.04255519, 0.0176544, -1.536478, 0, 1, 0.9568627, 1,
-0.04254457, 0.1303203, -2.295499, 0, 1, 0.9647059, 1,
-0.03643714, -1.805396, -4.122221, 0, 1, 0.9686275, 1,
-0.03409737, 1.085497, -0.3458853, 0, 1, 0.9764706, 1,
-0.03125071, -0.07652143, -2.484191, 0, 1, 0.9803922, 1,
-0.03048744, 0.129479, 0.1691283, 0, 1, 0.9882353, 1,
-0.02457094, 0.8244051, -0.9887769, 0, 1, 0.9921569, 1,
-0.01987742, 0.2376662, -0.2720762, 0, 1, 1, 1,
-0.01650009, -0.2076266, -1.394011, 0, 0.9921569, 1, 1,
-0.01293552, -1.152896, -2.140864, 0, 0.9882353, 1, 1,
-0.01126431, -0.3303947, -2.639505, 0, 0.9803922, 1, 1,
-0.008815947, 0.2186169, -0.6441565, 0, 0.9764706, 1, 1,
-0.007732247, 0.0006067259, -0.5154878, 0, 0.9686275, 1, 1,
-0.007510872, 0.2248708, -0.9493935, 0, 0.9647059, 1, 1,
-0.007223359, -1.834009, -1.997751, 0, 0.9568627, 1, 1,
-0.005316025, -0.9269699, -3.167278, 0, 0.9529412, 1, 1,
-0.004745254, -1.14298, -3.475364, 0, 0.945098, 1, 1,
-0.004361762, -0.8730001, -3.079173, 0, 0.9411765, 1, 1,
-0.003609093, -0.2353684, -3.17616, 0, 0.9333333, 1, 1,
-0.0009178473, 0.0693524, 1.137423, 0, 0.9294118, 1, 1,
0.001152344, -0.2633223, 3.728072, 0, 0.9215686, 1, 1,
0.001312612, -0.1239537, 2.053161, 0, 0.9176471, 1, 1,
0.006589484, -0.5281801, 2.628144, 0, 0.9098039, 1, 1,
0.006909428, -1.837512, 2.825059, 0, 0.9058824, 1, 1,
0.007184028, -0.6665969, 2.628258, 0, 0.8980392, 1, 1,
0.007508826, -0.857887, 3.874538, 0, 0.8901961, 1, 1,
0.01094176, -2.325352, 4.188186, 0, 0.8862745, 1, 1,
0.01140693, 0.1600255, 0.6563948, 0, 0.8784314, 1, 1,
0.01223676, -0.6406276, 2.607783, 0, 0.8745098, 1, 1,
0.013311, -1.670313, 3.435508, 0, 0.8666667, 1, 1,
0.01761898, 0.1667496, 2.064263, 0, 0.8627451, 1, 1,
0.01770085, -0.877468, 2.20517, 0, 0.854902, 1, 1,
0.01898047, -2.33496, 3.303828, 0, 0.8509804, 1, 1,
0.02405307, 0.3867033, -0.4754188, 0, 0.8431373, 1, 1,
0.02594784, 1.244094, 1.582067, 0, 0.8392157, 1, 1,
0.0269912, 0.5515466, -0.2871709, 0, 0.8313726, 1, 1,
0.02793073, -0.2069218, 3.031486, 0, 0.827451, 1, 1,
0.02793859, 1.169246, 1.018644, 0, 0.8196079, 1, 1,
0.02832854, 0.2967296, 0.003264383, 0, 0.8156863, 1, 1,
0.03497862, -0.472157, 2.774265, 0, 0.8078431, 1, 1,
0.03786483, -0.03944578, 4.206833, 0, 0.8039216, 1, 1,
0.03886828, 0.3133011, 0.2218377, 0, 0.7960784, 1, 1,
0.0425868, 1.432047, -1.465026, 0, 0.7882353, 1, 1,
0.04288488, -0.6368338, 3.555319, 0, 0.7843137, 1, 1,
0.04433793, 0.004248147, 0.6577788, 0, 0.7764706, 1, 1,
0.04541074, -1.577854, 3.611416, 0, 0.772549, 1, 1,
0.05441733, 0.5692737, -0.09373498, 0, 0.7647059, 1, 1,
0.05470766, 0.613323, 1.714393, 0, 0.7607843, 1, 1,
0.06003975, -0.6968138, 1.597298, 0, 0.7529412, 1, 1,
0.06174804, -1.655997, 3.21821, 0, 0.7490196, 1, 1,
0.06204332, 1.034327, -0.8576926, 0, 0.7411765, 1, 1,
0.06239474, 0.4067427, -1.025484, 0, 0.7372549, 1, 1,
0.06362066, -0.4669939, 3.52618, 0, 0.7294118, 1, 1,
0.06493279, -1.458608, 1.543815, 0, 0.7254902, 1, 1,
0.06526452, -0.4429576, 2.357443, 0, 0.7176471, 1, 1,
0.0692912, 0.7180987, 0.3846528, 0, 0.7137255, 1, 1,
0.06978924, 1.495703, -1.189053, 0, 0.7058824, 1, 1,
0.07030081, -0.4073273, 2.201364, 0, 0.6980392, 1, 1,
0.08085925, 1.871582, 0.3694943, 0, 0.6941177, 1, 1,
0.08433942, -1.271704, 1.932928, 0, 0.6862745, 1, 1,
0.08507321, -0.2748589, 3.167751, 0, 0.682353, 1, 1,
0.08670614, -1.754148, 5.060654, 0, 0.6745098, 1, 1,
0.08992048, 0.4258206, -1.1271, 0, 0.6705883, 1, 1,
0.09257826, 0.2313354, 0.6224668, 0, 0.6627451, 1, 1,
0.09472483, -0.3110624, 4.494368, 0, 0.6588235, 1, 1,
0.1016032, -0.6687785, 1.294439, 0, 0.6509804, 1, 1,
0.1031005, -0.5485513, 3.181121, 0, 0.6470588, 1, 1,
0.1084417, 1.217818, -0.5941701, 0, 0.6392157, 1, 1,
0.1095263, 1.428782, 1.274459, 0, 0.6352941, 1, 1,
0.1099702, 0.1162061, 1.023282, 0, 0.627451, 1, 1,
0.114557, 1.351, 0.4186636, 0, 0.6235294, 1, 1,
0.1163336, 0.06572762, 1.590656, 0, 0.6156863, 1, 1,
0.1223833, 1.185293, -0.3096454, 0, 0.6117647, 1, 1,
0.127115, -0.3520255, 3.074268, 0, 0.6039216, 1, 1,
0.1384122, 0.4126162, 1.883737, 0, 0.5960785, 1, 1,
0.1394368, -0.04588705, 5.066719, 0, 0.5921569, 1, 1,
0.1395138, 0.4402916, 0.3892145, 0, 0.5843138, 1, 1,
0.1400903, 0.5297959, 0.4614087, 0, 0.5803922, 1, 1,
0.1407928, -0.5746673, 3.808868, 0, 0.572549, 1, 1,
0.142798, -1.462685, 2.632361, 0, 0.5686275, 1, 1,
0.146221, -0.4496357, 3.5529, 0, 0.5607843, 1, 1,
0.1466378, 0.4463535, 0.2695512, 0, 0.5568628, 1, 1,
0.1481613, 0.1907893, 0.5754654, 0, 0.5490196, 1, 1,
0.1486718, -0.2432346, 2.189734, 0, 0.5450981, 1, 1,
0.1534363, 0.5505714, 0.1552405, 0, 0.5372549, 1, 1,
0.1584487, 1.514006, 2.019239, 0, 0.5333334, 1, 1,
0.1655915, 0.02846996, 3.17854, 0, 0.5254902, 1, 1,
0.1691161, 0.6688913, 0.7814066, 0, 0.5215687, 1, 1,
0.1700556, 0.1050625, -0.1021077, 0, 0.5137255, 1, 1,
0.1711874, 0.4016358, -0.2134442, 0, 0.509804, 1, 1,
0.1816432, -0.3203347, 3.719381, 0, 0.5019608, 1, 1,
0.1824693, 0.8440743, -0.9205366, 0, 0.4941176, 1, 1,
0.1849561, -0.6102937, 4.357004, 0, 0.4901961, 1, 1,
0.1873561, 1.451038, 0.2153447, 0, 0.4823529, 1, 1,
0.1890492, 0.0804938, 1.437101, 0, 0.4784314, 1, 1,
0.1890661, -2.962546, 2.266146, 0, 0.4705882, 1, 1,
0.1909442, -0.131805, 2.699444, 0, 0.4666667, 1, 1,
0.1912488, 1.870139, 0.5875443, 0, 0.4588235, 1, 1,
0.1949566, 0.6048677, 0.7289017, 0, 0.454902, 1, 1,
0.1960845, 0.5693809, -0.2661901, 0, 0.4470588, 1, 1,
0.1975074, 0.7486164, -0.6170669, 0, 0.4431373, 1, 1,
0.1982372, 0.4240266, 1.740885, 0, 0.4352941, 1, 1,
0.2007965, 0.6362607, -0.4182112, 0, 0.4313726, 1, 1,
0.2016135, -0.9750129, 3.20661, 0, 0.4235294, 1, 1,
0.2026933, 0.872533, -1.903997, 0, 0.4196078, 1, 1,
0.202983, -1.653311, 3.122756, 0, 0.4117647, 1, 1,
0.2044914, -0.37389, 3.802001, 0, 0.4078431, 1, 1,
0.2071161, 0.1896405, 2.276072, 0, 0.4, 1, 1,
0.2074243, -0.8656859, 3.162407, 0, 0.3921569, 1, 1,
0.2083814, 0.9275711, -0.3707238, 0, 0.3882353, 1, 1,
0.2101973, 0.4963466, -0.1598056, 0, 0.3803922, 1, 1,
0.2156081, 1.31742, -0.4534318, 0, 0.3764706, 1, 1,
0.2166656, 1.386507, 0.944861, 0, 0.3686275, 1, 1,
0.2167362, 0.432112, -0.3289143, 0, 0.3647059, 1, 1,
0.2175969, 0.2818094, 0.4457144, 0, 0.3568628, 1, 1,
0.2176541, -0.2017892, 3.409301, 0, 0.3529412, 1, 1,
0.2213019, -0.07607394, 2.553394, 0, 0.345098, 1, 1,
0.2223907, 0.1214506, 1.597104, 0, 0.3411765, 1, 1,
0.2239473, 2.223947, -1.237824, 0, 0.3333333, 1, 1,
0.2245137, 1.373716, 0.669312, 0, 0.3294118, 1, 1,
0.2262767, 1.106098, -0.7741064, 0, 0.3215686, 1, 1,
0.2283315, 0.7187862, 0.03989615, 0, 0.3176471, 1, 1,
0.2295002, 1.131434, 0.05746784, 0, 0.3098039, 1, 1,
0.2300228, -0.6272478, 4.74402, 0, 0.3058824, 1, 1,
0.234189, -0.3418606, 1.962095, 0, 0.2980392, 1, 1,
0.2358625, -0.2928822, 2.492664, 0, 0.2901961, 1, 1,
0.237782, -0.3915148, 3.151197, 0, 0.2862745, 1, 1,
0.2388569, -0.2738135, 2.734659, 0, 0.2784314, 1, 1,
0.2392489, 1.258505, 0.6781, 0, 0.2745098, 1, 1,
0.2406547, -0.7562068, 2.495537, 0, 0.2666667, 1, 1,
0.2434654, -2.038594, 2.246122, 0, 0.2627451, 1, 1,
0.2477713, 0.6171919, 2.029902, 0, 0.254902, 1, 1,
0.2508636, 0.9171323, -0.630601, 0, 0.2509804, 1, 1,
0.2541792, -1.217591, 1.424858, 0, 0.2431373, 1, 1,
0.2569617, -2.516318, 3.642551, 0, 0.2392157, 1, 1,
0.2591161, 1.152283, 0.2021083, 0, 0.2313726, 1, 1,
0.2593201, -0.3484135, 2.587904, 0, 0.227451, 1, 1,
0.263001, -0.02508733, 1.893919, 0, 0.2196078, 1, 1,
0.2664497, 0.3285627, 1.091101, 0, 0.2156863, 1, 1,
0.267114, -1.001661, 3.193023, 0, 0.2078431, 1, 1,
0.2673083, -0.1333952, 3.61294, 0, 0.2039216, 1, 1,
0.2675483, -0.3577405, 1.532432, 0, 0.1960784, 1, 1,
0.2677849, 0.3521848, 1.745021, 0, 0.1882353, 1, 1,
0.2680566, -1.034948, 4.188928, 0, 0.1843137, 1, 1,
0.2732862, 0.8025494, -1.155214, 0, 0.1764706, 1, 1,
0.2734052, 2.258721, 0.5347734, 0, 0.172549, 1, 1,
0.273633, 0.7548797, 0.2050172, 0, 0.1647059, 1, 1,
0.2808589, -0.4266028, 1.359222, 0, 0.1607843, 1, 1,
0.2818771, 0.6209196, 0.2587653, 0, 0.1529412, 1, 1,
0.288624, 1.576122, 0.4396273, 0, 0.1490196, 1, 1,
0.2907824, -0.3319794, 3.280417, 0, 0.1411765, 1, 1,
0.2948855, -2.230146, 1.396747, 0, 0.1372549, 1, 1,
0.2964903, -0.04191305, 2.481322, 0, 0.1294118, 1, 1,
0.3027967, -0.2760453, 1.155518, 0, 0.1254902, 1, 1,
0.3045255, -0.02010503, 2.847749, 0, 0.1176471, 1, 1,
0.3048064, -1.302536, 3.730242, 0, 0.1137255, 1, 1,
0.3076252, -0.8380656, 1.863181, 0, 0.1058824, 1, 1,
0.3109344, -0.5563167, 2.72788, 0, 0.09803922, 1, 1,
0.3109505, -0.2070008, 0.048497, 0, 0.09411765, 1, 1,
0.3134196, 1.068232, 1.35269, 0, 0.08627451, 1, 1,
0.3191412, 0.6763484, 0.2774321, 0, 0.08235294, 1, 1,
0.321286, -0.8934866, 1.738663, 0, 0.07450981, 1, 1,
0.3228962, -1.231942, 1.746934, 0, 0.07058824, 1, 1,
0.3268517, -1.029429, 1.262834, 0, 0.0627451, 1, 1,
0.3279194, -0.8988428, 2.280436, 0, 0.05882353, 1, 1,
0.3284313, -1.027822, 2.626756, 0, 0.05098039, 1, 1,
0.3303747, 0.2317082, 1.593974, 0, 0.04705882, 1, 1,
0.3357549, 1.761953, -0.3593302, 0, 0.03921569, 1, 1,
0.3371654, 1.315013, 1.720362, 0, 0.03529412, 1, 1,
0.339821, 0.9459852, 1.836414, 0, 0.02745098, 1, 1,
0.3447102, -0.04048247, 0.7521245, 0, 0.02352941, 1, 1,
0.345236, -1.364726, 1.723781, 0, 0.01568628, 1, 1,
0.3489107, 0.4213403, 1.265107, 0, 0.01176471, 1, 1,
0.3491998, -0.232456, 0.4549898, 0, 0.003921569, 1, 1,
0.3525999, -0.7523244, 2.896671, 0.003921569, 0, 1, 1,
0.3558625, 1.03678, 2.365909, 0.007843138, 0, 1, 1,
0.3570114, -0.625661, 3.093166, 0.01568628, 0, 1, 1,
0.3626146, 0.3562583, 1.009247, 0.01960784, 0, 1, 1,
0.3658412, 0.07976936, 0.3358059, 0.02745098, 0, 1, 1,
0.3683285, 1.032102, 1.846819, 0.03137255, 0, 1, 1,
0.370036, -1.589755, 2.859646, 0.03921569, 0, 1, 1,
0.3863873, -1.541115, 3.178611, 0.04313726, 0, 1, 1,
0.388103, -0.002799875, 1.834691, 0.05098039, 0, 1, 1,
0.3903622, -0.2724275, 2.347503, 0.05490196, 0, 1, 1,
0.3903625, 1.979809, 1.61488, 0.0627451, 0, 1, 1,
0.3911801, -0.3237983, 4.67353, 0.06666667, 0, 1, 1,
0.3936114, 0.2661553, 4.079124, 0.07450981, 0, 1, 1,
0.3937168, -1.206148, 2.29556, 0.07843138, 0, 1, 1,
0.3942665, 2.023114, 1.431048, 0.08627451, 0, 1, 1,
0.3955971, -1.096053, 2.117643, 0.09019608, 0, 1, 1,
0.4015177, 0.9507445, 0.885603, 0.09803922, 0, 1, 1,
0.4019726, -0.5819947, 1.918582, 0.1058824, 0, 1, 1,
0.4029064, 0.1155185, -0.4437453, 0.1098039, 0, 1, 1,
0.4044033, -0.1032727, 2.004559, 0.1176471, 0, 1, 1,
0.4100133, -1.051482, 2.664911, 0.1215686, 0, 1, 1,
0.4101225, -0.555715, 2.472858, 0.1294118, 0, 1, 1,
0.416294, 0.4076456, 1.761367, 0.1333333, 0, 1, 1,
0.4183015, 0.9245077, -0.3752707, 0.1411765, 0, 1, 1,
0.42013, 1.234962, -1.639346, 0.145098, 0, 1, 1,
0.4205539, -0.5268481, 2.990739, 0.1529412, 0, 1, 1,
0.4219835, -1.703326, 2.472329, 0.1568628, 0, 1, 1,
0.4252258, 1.873786, 0.1923931, 0.1647059, 0, 1, 1,
0.4253933, 0.5317082, 0.1417591, 0.1686275, 0, 1, 1,
0.4301102, 0.3917762, 2.085691, 0.1764706, 0, 1, 1,
0.4319069, -0.3890626, 2.358971, 0.1803922, 0, 1, 1,
0.4344817, -1.455962, 2.047741, 0.1882353, 0, 1, 1,
0.4347168, -0.5051854, 1.392658, 0.1921569, 0, 1, 1,
0.4377328, -1.753802, 1.523785, 0.2, 0, 1, 1,
0.438676, 2.371469, 0.03995653, 0.2078431, 0, 1, 1,
0.4416661, 0.8619334, 1.259355, 0.2117647, 0, 1, 1,
0.4435976, -2.185825, 2.802735, 0.2196078, 0, 1, 1,
0.4445324, 0.6655701, 0.8051742, 0.2235294, 0, 1, 1,
0.4458147, -2.045386, 4.267788, 0.2313726, 0, 1, 1,
0.4459282, -0.0900798, 1.81386, 0.2352941, 0, 1, 1,
0.4468569, 0.1106725, -0.1173519, 0.2431373, 0, 1, 1,
0.4580953, -1.414449, 2.36796, 0.2470588, 0, 1, 1,
0.4595195, 0.1187102, 1.245559, 0.254902, 0, 1, 1,
0.4621863, 1.514689, 0.3252897, 0.2588235, 0, 1, 1,
0.4653732, -0.2842595, 2.577921, 0.2666667, 0, 1, 1,
0.4666789, 0.8093648, 2.372567, 0.2705882, 0, 1, 1,
0.471573, -0.03983068, 1.478066, 0.2784314, 0, 1, 1,
0.4756847, 1.158823, -0.8552307, 0.282353, 0, 1, 1,
0.4779524, 0.2927102, 3.081376, 0.2901961, 0, 1, 1,
0.4799208, -1.242608, 3.494496, 0.2941177, 0, 1, 1,
0.4836479, 1.525905, -0.07438495, 0.3019608, 0, 1, 1,
0.4876352, 0.9326165, 0.9686338, 0.3098039, 0, 1, 1,
0.4889372, -0.09070711, 3.018927, 0.3137255, 0, 1, 1,
0.4927504, -0.6160502, 2.484601, 0.3215686, 0, 1, 1,
0.4947953, 0.1529144, 0.8166835, 0.3254902, 0, 1, 1,
0.4976025, -0.3515372, 0.3967436, 0.3333333, 0, 1, 1,
0.4985372, -0.7157969, 2.760189, 0.3372549, 0, 1, 1,
0.5069345, 1.418108, -0.9064198, 0.345098, 0, 1, 1,
0.5072295, -0.7953409, 3.613319, 0.3490196, 0, 1, 1,
0.508797, 0.49664, 0.6172515, 0.3568628, 0, 1, 1,
0.512024, -0.1039639, 2.103671, 0.3607843, 0, 1, 1,
0.5133911, -0.8024213, 2.309657, 0.3686275, 0, 1, 1,
0.5146499, -0.1793618, 0.07401133, 0.372549, 0, 1, 1,
0.5146932, 0.7539847, 0.8376199, 0.3803922, 0, 1, 1,
0.5165807, 0.1718698, 2.082098, 0.3843137, 0, 1, 1,
0.5214874, -0.4859468, 4.171095, 0.3921569, 0, 1, 1,
0.5215148, -2.112188, 4.12838, 0.3960784, 0, 1, 1,
0.5256636, -2.076865, 2.996476, 0.4039216, 0, 1, 1,
0.5271879, -0.6213362, 2.330605, 0.4117647, 0, 1, 1,
0.5299246, -1.492448, 2.335345, 0.4156863, 0, 1, 1,
0.5330839, 0.01623067, 0.4463364, 0.4235294, 0, 1, 1,
0.5381019, -1.536422, 3.741232, 0.427451, 0, 1, 1,
0.5398968, 0.4964513, 0.3281199, 0.4352941, 0, 1, 1,
0.5422627, 0.2477727, 2.073159, 0.4392157, 0, 1, 1,
0.5457678, -0.9699121, 2.366478, 0.4470588, 0, 1, 1,
0.5494744, 1.183799, -1.354442, 0.4509804, 0, 1, 1,
0.5495644, 0.03180917, 2.183877, 0.4588235, 0, 1, 1,
0.5530534, -1.002156, 0.4545611, 0.4627451, 0, 1, 1,
0.5564234, -0.6779841, 4.198155, 0.4705882, 0, 1, 1,
0.5571811, -1.306968, 2.984573, 0.4745098, 0, 1, 1,
0.5591724, -1.251159, 1.267723, 0.4823529, 0, 1, 1,
0.5663495, -0.6439989, 2.963785, 0.4862745, 0, 1, 1,
0.5728215, -0.3545119, 1.902556, 0.4941176, 0, 1, 1,
0.5769771, -1.439874, 4.560635, 0.5019608, 0, 1, 1,
0.5788046, -0.7084899, 1.849124, 0.5058824, 0, 1, 1,
0.5810509, -1.718493, 2.893713, 0.5137255, 0, 1, 1,
0.5816731, -0.7454239, 2.169082, 0.5176471, 0, 1, 1,
0.5849456, -0.5431284, 1.786931, 0.5254902, 0, 1, 1,
0.5851596, 0.4543073, 1.902701, 0.5294118, 0, 1, 1,
0.5876947, -0.4844105, 0.9186127, 0.5372549, 0, 1, 1,
0.5927477, 0.6629956, 0.8638368, 0.5411765, 0, 1, 1,
0.6016259, -1.553709, 1.501822, 0.5490196, 0, 1, 1,
0.6138629, 0.7884571, 1.969183, 0.5529412, 0, 1, 1,
0.6226856, 0.8488349, 1.167469, 0.5607843, 0, 1, 1,
0.6227598, 0.5806634, 1.759427, 0.5647059, 0, 1, 1,
0.6230154, 1.026166, 0.3858593, 0.572549, 0, 1, 1,
0.6321468, 1.469092, -0.5980043, 0.5764706, 0, 1, 1,
0.6344457, 0.919823, 2.712305, 0.5843138, 0, 1, 1,
0.6412624, -0.1405418, 0.798413, 0.5882353, 0, 1, 1,
0.6461514, 0.2857905, 1.923487, 0.5960785, 0, 1, 1,
0.6540835, 0.0667074, 1.589751, 0.6039216, 0, 1, 1,
0.6554011, 0.1189923, -0.7785961, 0.6078432, 0, 1, 1,
0.6562359, -0.2569471, 1.846836, 0.6156863, 0, 1, 1,
0.6627433, 0.4764985, 1.449651, 0.6196079, 0, 1, 1,
0.6632005, -1.103472, 0.2348445, 0.627451, 0, 1, 1,
0.6664159, 1.352376, 0.68423, 0.6313726, 0, 1, 1,
0.6722412, 0.8261318, 0.02075655, 0.6392157, 0, 1, 1,
0.6756181, -0.6777105, 3.175879, 0.6431373, 0, 1, 1,
0.6757818, 0.6507837, 0.7505463, 0.6509804, 0, 1, 1,
0.6804244, -0.4036409, 3.266292, 0.654902, 0, 1, 1,
0.6814331, 0.3111606, 2.061173, 0.6627451, 0, 1, 1,
0.6815789, 1.108804, 0.3567612, 0.6666667, 0, 1, 1,
0.6839949, -0.1250612, 2.921659, 0.6745098, 0, 1, 1,
0.6904749, 1.025644, 1.136368, 0.6784314, 0, 1, 1,
0.7029383, 0.3131755, 0.8563475, 0.6862745, 0, 1, 1,
0.7072259, -0.5533212, 2.944211, 0.6901961, 0, 1, 1,
0.7077947, -0.24697, 2.266196, 0.6980392, 0, 1, 1,
0.7110031, 0.6740065, -0.6156702, 0.7058824, 0, 1, 1,
0.7125894, -1.509526, 2.35105, 0.7098039, 0, 1, 1,
0.7129862, -1.581195, 1.885319, 0.7176471, 0, 1, 1,
0.7171063, -0.6573584, 3.141189, 0.7215686, 0, 1, 1,
0.7186554, 1.166425, 1.01314, 0.7294118, 0, 1, 1,
0.7227297, -0.465271, 3.876419, 0.7333333, 0, 1, 1,
0.7256487, 0.03419556, 2.623294, 0.7411765, 0, 1, 1,
0.726806, -1.682358, 3.858763, 0.7450981, 0, 1, 1,
0.728232, -0.5830777, 1.900482, 0.7529412, 0, 1, 1,
0.7320744, 1.229927, -0.1902117, 0.7568628, 0, 1, 1,
0.7346383, -0.02831219, 1.003021, 0.7647059, 0, 1, 1,
0.7357808, 1.739603, -1.324303, 0.7686275, 0, 1, 1,
0.7449419, -0.6589466, 1.577059, 0.7764706, 0, 1, 1,
0.7519655, -0.6318185, 3.016191, 0.7803922, 0, 1, 1,
0.753815, 0.7864938, 1.77828, 0.7882353, 0, 1, 1,
0.7583758, -0.3164278, 1.97895, 0.7921569, 0, 1, 1,
0.775031, -0.3930035, 2.459562, 0.8, 0, 1, 1,
0.7783475, 0.001622078, 2.250957, 0.8078431, 0, 1, 1,
0.7832705, 0.300842, 0.932677, 0.8117647, 0, 1, 1,
0.7872158, 0.6027136, 1.626343, 0.8196079, 0, 1, 1,
0.7872617, -2.017844, 3.174992, 0.8235294, 0, 1, 1,
0.7884781, -0.3992586, 3.263257, 0.8313726, 0, 1, 1,
0.7931218, 0.8124821, 0.4834229, 0.8352941, 0, 1, 1,
0.7951787, -1.612846, 1.189654, 0.8431373, 0, 1, 1,
0.7968365, 0.7851158, 1.54576, 0.8470588, 0, 1, 1,
0.7976755, 1.078337, 0.02825624, 0.854902, 0, 1, 1,
0.8026808, -1.274347, 3.333887, 0.8588235, 0, 1, 1,
0.8188966, -0.2426126, 2.445055, 0.8666667, 0, 1, 1,
0.8209639, -1.150944, 2.959947, 0.8705882, 0, 1, 1,
0.8360648, -1.494306, 3.206174, 0.8784314, 0, 1, 1,
0.8459657, -0.1217845, 1.660829, 0.8823529, 0, 1, 1,
0.851467, 1.27075, -0.2322779, 0.8901961, 0, 1, 1,
0.8533595, 0.8992217, 0.6435749, 0.8941177, 0, 1, 1,
0.858565, -0.8811194, 2.711757, 0.9019608, 0, 1, 1,
0.8608046, -0.9742777, 2.887045, 0.9098039, 0, 1, 1,
0.8626076, 0.09671599, 0.4632712, 0.9137255, 0, 1, 1,
0.8758802, -0.3105954, 2.778208, 0.9215686, 0, 1, 1,
0.8784382, 0.5023419, 1.107162, 0.9254902, 0, 1, 1,
0.8815948, -0.1204011, 2.367712, 0.9333333, 0, 1, 1,
0.8851006, -0.2722736, 1.490622, 0.9372549, 0, 1, 1,
0.8875804, 0.09962212, -0.670487, 0.945098, 0, 1, 1,
0.8875892, 0.1795385, 1.142965, 0.9490196, 0, 1, 1,
0.8994164, -0.448355, 1.342602, 0.9568627, 0, 1, 1,
0.9049652, -0.05602241, 2.222638, 0.9607843, 0, 1, 1,
0.9095599, 0.3199006, 1.827374, 0.9686275, 0, 1, 1,
0.9107347, 1.553208, 0.05237867, 0.972549, 0, 1, 1,
0.911108, -0.1726092, 1.255496, 0.9803922, 0, 1, 1,
0.9221238, -1.144616, 2.656724, 0.9843137, 0, 1, 1,
0.9270459, -1.525211, 4.881947, 0.9921569, 0, 1, 1,
0.9285756, 0.4433285, 1.854324, 0.9960784, 0, 1, 1,
0.9328536, -0.6968106, 2.606467, 1, 0, 0.9960784, 1,
0.9335895, -1.937841, 3.379787, 1, 0, 0.9882353, 1,
0.9387089, 0.4144941, 1.165332, 1, 0, 0.9843137, 1,
0.9404719, 1.236341, -1.337647, 1, 0, 0.9764706, 1,
0.9461482, 0.6176538, 0.805833, 1, 0, 0.972549, 1,
0.9483598, 0.06385925, 0.1093412, 1, 0, 0.9647059, 1,
0.956027, 0.3489903, 0.8977715, 1, 0, 0.9607843, 1,
0.9697593, 0.344711, 1.817666, 1, 0, 0.9529412, 1,
0.9711922, -0.3574751, 0.9983802, 1, 0, 0.9490196, 1,
0.973598, -1.683864, 2.772364, 1, 0, 0.9411765, 1,
0.9786257, 1.17082, 0.487222, 1, 0, 0.9372549, 1,
0.9886029, -0.3563821, 0.7071306, 1, 0, 0.9294118, 1,
0.9957582, 1.120483, 2.213198, 1, 0, 0.9254902, 1,
0.9967371, -0.4809919, -0.3673927, 1, 0, 0.9176471, 1,
0.9977577, -0.01717272, 1.494177, 1, 0, 0.9137255, 1,
1.001662, -1.279606, 2.446934, 1, 0, 0.9058824, 1,
1.003774, -0.3887304, 0.5480926, 1, 0, 0.9019608, 1,
1.006571, -0.07118387, 1.425254, 1, 0, 0.8941177, 1,
1.015345, -0.2878837, 0.82243, 1, 0, 0.8862745, 1,
1.021042, -2.541836, 3.296788, 1, 0, 0.8823529, 1,
1.02499, 0.7336134, 0.7837348, 1, 0, 0.8745098, 1,
1.031667, 0.8342795, 0.8431121, 1, 0, 0.8705882, 1,
1.033036, 0.006069986, 2.936634, 1, 0, 0.8627451, 1,
1.03321, 1.262368, -0.6733419, 1, 0, 0.8588235, 1,
1.035949, -0.07018764, 0.4826139, 1, 0, 0.8509804, 1,
1.0369, -1.307938, 1.483579, 1, 0, 0.8470588, 1,
1.043064, -1.391893, 1.95281, 1, 0, 0.8392157, 1,
1.046893, -0.0630789, 3.455213, 1, 0, 0.8352941, 1,
1.054977, 1.582579, -0.1560536, 1, 0, 0.827451, 1,
1.060929, -2.761746, 2.797831, 1, 0, 0.8235294, 1,
1.064118, 2.21881, 0.777063, 1, 0, 0.8156863, 1,
1.068645, 0.909837, 1.273378, 1, 0, 0.8117647, 1,
1.070794, -0.4075468, 0.7906799, 1, 0, 0.8039216, 1,
1.073552, 0.3186371, 0.8805586, 1, 0, 0.7960784, 1,
1.080313, 0.7374198, 2.358393, 1, 0, 0.7921569, 1,
1.103338, 0.9437212, 0.3960285, 1, 0, 0.7843137, 1,
1.10434, -1.247149, 1.866172, 1, 0, 0.7803922, 1,
1.118337, -0.6302392, 1.928912, 1, 0, 0.772549, 1,
1.12408, 0.6688485, 2.007979, 1, 0, 0.7686275, 1,
1.132911, 1.634415, 1.091658, 1, 0, 0.7607843, 1,
1.133326, -0.8401353, 2.218612, 1, 0, 0.7568628, 1,
1.135062, -1.232789, 2.845037, 1, 0, 0.7490196, 1,
1.137571, -0.4919686, 3.065345, 1, 0, 0.7450981, 1,
1.139372, -0.6974036, 3.122065, 1, 0, 0.7372549, 1,
1.146231, -0.7615909, -0.1577698, 1, 0, 0.7333333, 1,
1.15967, -0.5575709, 2.841411, 1, 0, 0.7254902, 1,
1.161543, 0.2760838, 0.3935993, 1, 0, 0.7215686, 1,
1.165962, -0.6945882, 3.709238, 1, 0, 0.7137255, 1,
1.186784, 0.4141572, 0.4158017, 1, 0, 0.7098039, 1,
1.188695, 1.033459, 0.722343, 1, 0, 0.7019608, 1,
1.190753, -0.06259076, 1.154057, 1, 0, 0.6941177, 1,
1.20599, -0.9169351, 0.8961303, 1, 0, 0.6901961, 1,
1.212204, 1.458779, 1.31791, 1, 0, 0.682353, 1,
1.212943, -0.3536474, 4.066551, 1, 0, 0.6784314, 1,
1.223762, 1.104456, 1.810369, 1, 0, 0.6705883, 1,
1.226787, 0.8640664, -0.4703338, 1, 0, 0.6666667, 1,
1.230279, 0.6069915, 2.134111, 1, 0, 0.6588235, 1,
1.231335, 0.3127704, 0.1205441, 1, 0, 0.654902, 1,
1.242482, -1.399582, 3.722772, 1, 0, 0.6470588, 1,
1.247058, 0.2457543, 2.033939, 1, 0, 0.6431373, 1,
1.248103, 0.1431796, 0.4652875, 1, 0, 0.6352941, 1,
1.254081, -0.3890925, 1.597315, 1, 0, 0.6313726, 1,
1.269152, -0.7972649, 0.3505535, 1, 0, 0.6235294, 1,
1.280173, 0.5865355, -0.1392665, 1, 0, 0.6196079, 1,
1.286141, -1.240534, 3.449034, 1, 0, 0.6117647, 1,
1.29968, 0.7500495, 1.332059, 1, 0, 0.6078432, 1,
1.303295, -0.629719, 1.321826, 1, 0, 0.6, 1,
1.305617, 0.9352517, 0.491699, 1, 0, 0.5921569, 1,
1.315072, -1.343454, 2.063989, 1, 0, 0.5882353, 1,
1.316243, 1.010038, 1.564148, 1, 0, 0.5803922, 1,
1.319824, 0.4006821, 0.6067977, 1, 0, 0.5764706, 1,
1.321949, -0.1997955, -0.4197115, 1, 0, 0.5686275, 1,
1.336149, -0.2145709, 1.689992, 1, 0, 0.5647059, 1,
1.344471, 1.328263, 2.609737, 1, 0, 0.5568628, 1,
1.349538, -0.3986785, 2.549409, 1, 0, 0.5529412, 1,
1.357076, 0.9452204, 1.451508, 1, 0, 0.5450981, 1,
1.360352, -1.981526, 1.172467, 1, 0, 0.5411765, 1,
1.363639, -0.6181434, 2.249075, 1, 0, 0.5333334, 1,
1.364202, -1.056856, 4.390497, 1, 0, 0.5294118, 1,
1.366857, -0.3435521, 4.649424, 1, 0, 0.5215687, 1,
1.372718, -0.9756848, 3.395597, 1, 0, 0.5176471, 1,
1.382697, -0.7979428, 0.9461059, 1, 0, 0.509804, 1,
1.383811, 1.21704, -0.5523805, 1, 0, 0.5058824, 1,
1.390657, 0.9438818, 2.401057, 1, 0, 0.4980392, 1,
1.401736, -0.7975962, 2.96511, 1, 0, 0.4901961, 1,
1.408505, -1.317269, 2.180902, 1, 0, 0.4862745, 1,
1.416137, 1.472693, 1.799877, 1, 0, 0.4784314, 1,
1.421994, 0.488261, 0.5513758, 1, 0, 0.4745098, 1,
1.428302, -0.2941026, 1.97591, 1, 0, 0.4666667, 1,
1.429896, 0.1141868, 1.786761, 1, 0, 0.4627451, 1,
1.443515, 1.378544, 1.671449, 1, 0, 0.454902, 1,
1.448428, -0.6973939, 1.061535, 1, 0, 0.4509804, 1,
1.449079, -1.334491, 3.263749, 1, 0, 0.4431373, 1,
1.462464, 1.228056, 0.9929192, 1, 0, 0.4392157, 1,
1.478367, 1.729878, 0.8159516, 1, 0, 0.4313726, 1,
1.478972, 0.8949047, 0.2614281, 1, 0, 0.427451, 1,
1.481015, 1.818181, 0.4839041, 1, 0, 0.4196078, 1,
1.48218, -1.083905, 2.703461, 1, 0, 0.4156863, 1,
1.486442, -0.4117111, 1.937569, 1, 0, 0.4078431, 1,
1.489499, 0.5788552, 0.6090526, 1, 0, 0.4039216, 1,
1.502783, -0.2710443, 1.718976, 1, 0, 0.3960784, 1,
1.519633, 0.03691756, 0.9638801, 1, 0, 0.3882353, 1,
1.537336, 1.041429, 0.8004596, 1, 0, 0.3843137, 1,
1.552769, -3.68481, 1.47144, 1, 0, 0.3764706, 1,
1.56288, 0.1241945, -0.02311007, 1, 0, 0.372549, 1,
1.577809, -0.7298601, 2.81729, 1, 0, 0.3647059, 1,
1.582348, -1.070295, 0.8338965, 1, 0, 0.3607843, 1,
1.595853, 0.5366063, 0.406938, 1, 0, 0.3529412, 1,
1.597602, 0.2822133, 0.8699933, 1, 0, 0.3490196, 1,
1.604399, 1.846769, -0.4811627, 1, 0, 0.3411765, 1,
1.615998, 0.1032917, 2.889514, 1, 0, 0.3372549, 1,
1.618883, 1.575501, 0.5972743, 1, 0, 0.3294118, 1,
1.619677, 0.2069386, 1.494608, 1, 0, 0.3254902, 1,
1.656518, 0.07546635, 1.364795, 1, 0, 0.3176471, 1,
1.67462, 0.4993254, 1.855419, 1, 0, 0.3137255, 1,
1.68501, -0.5041253, 0.4023493, 1, 0, 0.3058824, 1,
1.687235, 0.4658355, 1.519775, 1, 0, 0.2980392, 1,
1.687249, -3.347467, 0.9072617, 1, 0, 0.2941177, 1,
1.699405, -1.497244, -0.5978874, 1, 0, 0.2862745, 1,
1.705698, 2.243718, 1.195605, 1, 0, 0.282353, 1,
1.734603, 0.4082024, 0.6652898, 1, 0, 0.2745098, 1,
1.743782, -1.50825, 2.755282, 1, 0, 0.2705882, 1,
1.746796, -1.270774, 3.286168, 1, 0, 0.2627451, 1,
1.762479, 0.4348422, 0.9155014, 1, 0, 0.2588235, 1,
1.766202, -0.7050334, 3.569057, 1, 0, 0.2509804, 1,
1.802526, -0.4242352, 1.267117, 1, 0, 0.2470588, 1,
1.815165, 0.565161, 1.956586, 1, 0, 0.2392157, 1,
1.815388, -1.116277, 3.406646, 1, 0, 0.2352941, 1,
1.838523, 0.9538935, 1.379103, 1, 0, 0.227451, 1,
1.848373, -0.7811654, 0.4323981, 1, 0, 0.2235294, 1,
1.850876, 0.3560802, -1.414999, 1, 0, 0.2156863, 1,
1.855166, -0.8208853, 2.710586, 1, 0, 0.2117647, 1,
1.859484, -0.5481539, 1.120706, 1, 0, 0.2039216, 1,
1.876906, -0.1503444, 0.5305138, 1, 0, 0.1960784, 1,
1.88709, 0.218936, 1.546857, 1, 0, 0.1921569, 1,
1.887943, 1.556008, 1.480159, 1, 0, 0.1843137, 1,
1.901821, 0.02117142, 2.340928, 1, 0, 0.1803922, 1,
1.91954, -0.1736924, 2.560127, 1, 0, 0.172549, 1,
1.923775, 1.072861, 0.819666, 1, 0, 0.1686275, 1,
1.927811, -0.6962646, 1.224704, 1, 0, 0.1607843, 1,
1.932901, 1.367344, -1.066312, 1, 0, 0.1568628, 1,
1.934163, 0.5187321, 1.041615, 1, 0, 0.1490196, 1,
1.945612, -0.3896612, 0.2857664, 1, 0, 0.145098, 1,
1.963118, -0.4737519, 0.8658273, 1, 0, 0.1372549, 1,
1.983558, -1.770547, 1.434014, 1, 0, 0.1333333, 1,
1.995033, -0.652454, 1.828137, 1, 0, 0.1254902, 1,
2.014999, -0.8197807, 2.942913, 1, 0, 0.1215686, 1,
2.085408, 0.1310653, 2.840742, 1, 0, 0.1137255, 1,
2.097588, 0.4727491, 4.729091, 1, 0, 0.1098039, 1,
2.105358, 1.45632, -0.1930129, 1, 0, 0.1019608, 1,
2.108757, 0.3940803, 1.403668, 1, 0, 0.09411765, 1,
2.138841, -0.8641378, 0.9251381, 1, 0, 0.09019608, 1,
2.173362, -0.5996563, 1.692735, 1, 0, 0.08235294, 1,
2.242709, 0.1262808, 2.529837, 1, 0, 0.07843138, 1,
2.256552, -0.1570961, 0.8015952, 1, 0, 0.07058824, 1,
2.27953, 1.383219, 0.1322936, 1, 0, 0.06666667, 1,
2.285588, 2.567467, -1.011861, 1, 0, 0.05882353, 1,
2.379526, -1.168014, 0.4655453, 1, 0, 0.05490196, 1,
2.400424, -0.3387928, 1.870954, 1, 0, 0.04705882, 1,
2.403157, -1.992636, 0.986381, 1, 0, 0.04313726, 1,
2.416597, 1.229418, 0.6248203, 1, 0, 0.03529412, 1,
2.423388, -0.5449387, 1.076987, 1, 0, 0.03137255, 1,
2.465951, -0.5056201, 2.172676, 1, 0, 0.02352941, 1,
2.818541, -0.8431517, 1.194603, 1, 0, 0.01960784, 1,
2.873139, -0.5170567, 1.499502, 1, 0, 0.01176471, 1,
3.445887, 0.7109731, 1.440186, 1, 0, 0.007843138, 1
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
0.2605036, -4.766222, -6.658783, 0, -0.5, 0.5, 0.5,
0.2605036, -4.766222, -6.658783, 1, -0.5, 0.5, 0.5,
0.2605036, -4.766222, -6.658783, 1, 1.5, 0.5, 0.5,
0.2605036, -4.766222, -6.658783, 0, 1.5, 0.5, 0.5
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
-4.004725, -0.4948039, -6.658783, 0, -0.5, 0.5, 0.5,
-4.004725, -0.4948039, -6.658783, 1, -0.5, 0.5, 0.5,
-4.004725, -0.4948039, -6.658783, 1, 1.5, 0.5, 0.5,
-4.004725, -0.4948039, -6.658783, 0, 1.5, 0.5, 0.5
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
-4.004725, -4.766222, 0.05367851, 0, -0.5, 0.5, 0.5,
-4.004725, -4.766222, 0.05367851, 1, -0.5, 0.5, 0.5,
-4.004725, -4.766222, 0.05367851, 1, 1.5, 0.5, 0.5,
-4.004725, -4.766222, 0.05367851, 0, 1.5, 0.5, 0.5
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
-2, -3.78051, -5.109753,
3, -3.78051, -5.109753,
-2, -3.78051, -5.109753,
-2, -3.944795, -5.367925,
-1, -3.78051, -5.109753,
-1, -3.944795, -5.367925,
0, -3.78051, -5.109753,
0, -3.944795, -5.367925,
1, -3.78051, -5.109753,
1, -3.944795, -5.367925,
2, -3.78051, -5.109753,
2, -3.944795, -5.367925,
3, -3.78051, -5.109753,
3, -3.944795, -5.367925
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
-2, -4.273366, -5.884268, 0, -0.5, 0.5, 0.5,
-2, -4.273366, -5.884268, 1, -0.5, 0.5, 0.5,
-2, -4.273366, -5.884268, 1, 1.5, 0.5, 0.5,
-2, -4.273366, -5.884268, 0, 1.5, 0.5, 0.5,
-1, -4.273366, -5.884268, 0, -0.5, 0.5, 0.5,
-1, -4.273366, -5.884268, 1, -0.5, 0.5, 0.5,
-1, -4.273366, -5.884268, 1, 1.5, 0.5, 0.5,
-1, -4.273366, -5.884268, 0, 1.5, 0.5, 0.5,
0, -4.273366, -5.884268, 0, -0.5, 0.5, 0.5,
0, -4.273366, -5.884268, 1, -0.5, 0.5, 0.5,
0, -4.273366, -5.884268, 1, 1.5, 0.5, 0.5,
0, -4.273366, -5.884268, 0, 1.5, 0.5, 0.5,
1, -4.273366, -5.884268, 0, -0.5, 0.5, 0.5,
1, -4.273366, -5.884268, 1, -0.5, 0.5, 0.5,
1, -4.273366, -5.884268, 1, 1.5, 0.5, 0.5,
1, -4.273366, -5.884268, 0, 1.5, 0.5, 0.5,
2, -4.273366, -5.884268, 0, -0.5, 0.5, 0.5,
2, -4.273366, -5.884268, 1, -0.5, 0.5, 0.5,
2, -4.273366, -5.884268, 1, 1.5, 0.5, 0.5,
2, -4.273366, -5.884268, 0, 1.5, 0.5, 0.5,
3, -4.273366, -5.884268, 0, -0.5, 0.5, 0.5,
3, -4.273366, -5.884268, 1, -0.5, 0.5, 0.5,
3, -4.273366, -5.884268, 1, 1.5, 0.5, 0.5,
3, -4.273366, -5.884268, 0, 1.5, 0.5, 0.5
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
-3.020441, -3, -5.109753,
-3.020441, 2, -5.109753,
-3.020441, -3, -5.109753,
-3.184489, -3, -5.367925,
-3.020441, -2, -5.109753,
-3.184489, -2, -5.367925,
-3.020441, -1, -5.109753,
-3.184489, -1, -5.367925,
-3.020441, 0, -5.109753,
-3.184489, 0, -5.367925,
-3.020441, 1, -5.109753,
-3.184489, 1, -5.367925,
-3.020441, 2, -5.109753,
-3.184489, 2, -5.367925
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
-3.512583, -3, -5.884268, 0, -0.5, 0.5, 0.5,
-3.512583, -3, -5.884268, 1, -0.5, 0.5, 0.5,
-3.512583, -3, -5.884268, 1, 1.5, 0.5, 0.5,
-3.512583, -3, -5.884268, 0, 1.5, 0.5, 0.5,
-3.512583, -2, -5.884268, 0, -0.5, 0.5, 0.5,
-3.512583, -2, -5.884268, 1, -0.5, 0.5, 0.5,
-3.512583, -2, -5.884268, 1, 1.5, 0.5, 0.5,
-3.512583, -2, -5.884268, 0, 1.5, 0.5, 0.5,
-3.512583, -1, -5.884268, 0, -0.5, 0.5, 0.5,
-3.512583, -1, -5.884268, 1, -0.5, 0.5, 0.5,
-3.512583, -1, -5.884268, 1, 1.5, 0.5, 0.5,
-3.512583, -1, -5.884268, 0, 1.5, 0.5, 0.5,
-3.512583, 0, -5.884268, 0, -0.5, 0.5, 0.5,
-3.512583, 0, -5.884268, 1, -0.5, 0.5, 0.5,
-3.512583, 0, -5.884268, 1, 1.5, 0.5, 0.5,
-3.512583, 0, -5.884268, 0, 1.5, 0.5, 0.5,
-3.512583, 1, -5.884268, 0, -0.5, 0.5, 0.5,
-3.512583, 1, -5.884268, 1, -0.5, 0.5, 0.5,
-3.512583, 1, -5.884268, 1, 1.5, 0.5, 0.5,
-3.512583, 1, -5.884268, 0, 1.5, 0.5, 0.5,
-3.512583, 2, -5.884268, 0, -0.5, 0.5, 0.5,
-3.512583, 2, -5.884268, 1, -0.5, 0.5, 0.5,
-3.512583, 2, -5.884268, 1, 1.5, 0.5, 0.5,
-3.512583, 2, -5.884268, 0, 1.5, 0.5, 0.5
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
-3.020441, -3.78051, -4,
-3.020441, -3.78051, 4,
-3.020441, -3.78051, -4,
-3.184489, -3.944795, -4,
-3.020441, -3.78051, -2,
-3.184489, -3.944795, -2,
-3.020441, -3.78051, 0,
-3.184489, -3.944795, 0,
-3.020441, -3.78051, 2,
-3.184489, -3.944795, 2,
-3.020441, -3.78051, 4,
-3.184489, -3.944795, 4
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
-3.512583, -4.273366, -4, 0, -0.5, 0.5, 0.5,
-3.512583, -4.273366, -4, 1, -0.5, 0.5, 0.5,
-3.512583, -4.273366, -4, 1, 1.5, 0.5, 0.5,
-3.512583, -4.273366, -4, 0, 1.5, 0.5, 0.5,
-3.512583, -4.273366, -2, 0, -0.5, 0.5, 0.5,
-3.512583, -4.273366, -2, 1, -0.5, 0.5, 0.5,
-3.512583, -4.273366, -2, 1, 1.5, 0.5, 0.5,
-3.512583, -4.273366, -2, 0, 1.5, 0.5, 0.5,
-3.512583, -4.273366, 0, 0, -0.5, 0.5, 0.5,
-3.512583, -4.273366, 0, 1, -0.5, 0.5, 0.5,
-3.512583, -4.273366, 0, 1, 1.5, 0.5, 0.5,
-3.512583, -4.273366, 0, 0, 1.5, 0.5, 0.5,
-3.512583, -4.273366, 2, 0, -0.5, 0.5, 0.5,
-3.512583, -4.273366, 2, 1, -0.5, 0.5, 0.5,
-3.512583, -4.273366, 2, 1, 1.5, 0.5, 0.5,
-3.512583, -4.273366, 2, 0, 1.5, 0.5, 0.5,
-3.512583, -4.273366, 4, 0, -0.5, 0.5, 0.5,
-3.512583, -4.273366, 4, 1, -0.5, 0.5, 0.5,
-3.512583, -4.273366, 4, 1, 1.5, 0.5, 0.5,
-3.512583, -4.273366, 4, 0, 1.5, 0.5, 0.5
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
-3.020441, -3.78051, -5.109753,
-3.020441, 2.790902, -5.109753,
-3.020441, -3.78051, 5.21711,
-3.020441, 2.790902, 5.21711,
-3.020441, -3.78051, -5.109753,
-3.020441, -3.78051, 5.21711,
-3.020441, 2.790902, -5.109753,
-3.020441, 2.790902, 5.21711,
-3.020441, -3.78051, -5.109753,
3.541449, -3.78051, -5.109753,
-3.020441, -3.78051, 5.21711,
3.541449, -3.78051, 5.21711,
-3.020441, 2.790902, -5.109753,
3.541449, 2.790902, -5.109753,
-3.020441, 2.790902, 5.21711,
3.541449, 2.790902, 5.21711,
3.541449, -3.78051, -5.109753,
3.541449, 2.790902, -5.109753,
3.541449, -3.78051, 5.21711,
3.541449, 2.790902, 5.21711,
3.541449, -3.78051, -5.109753,
3.541449, -3.78051, 5.21711,
3.541449, 2.790902, -5.109753,
3.541449, 2.790902, 5.21711
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
var radius = 7.416103;
var distance = 32.99508;
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
mvMatrix.translate( -0.2605036, 0.4948039, -0.05367851 );
mvMatrix.scale( 1.221971, 1.2202, 0.7764639 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.99508);
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
tolclofos-methyl<-read.table("tolclofos-methyl.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-tolclofos-methyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'tolclofos' not found
```

```r
y<-tolclofos-methyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'tolclofos' not found
```

```r
z<-tolclofos-methyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'tolclofos' not found
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
-2.92488, 0.09524272, -1.561433, 0, 0, 1, 1, 1,
-2.784585, 0.5572312, -0.2741469, 1, 0, 0, 1, 1,
-2.721575, -0.5977632, -1.153122, 1, 0, 0, 1, 1,
-2.629365, -0.07355893, -2.807599, 1, 0, 0, 1, 1,
-2.586676, -0.9406296, -1.206549, 1, 0, 0, 1, 1,
-2.525287, -0.1678281, -1.822064, 1, 0, 0, 1, 1,
-2.448139, -0.06902149, -1.687128, 0, 0, 0, 1, 1,
-2.382591, 0.477036, -3.380479, 0, 0, 0, 1, 1,
-2.279707, 1.980635, -0.4780753, 0, 0, 0, 1, 1,
-2.213967, 0.646647, -3.200991, 0, 0, 0, 1, 1,
-2.209819, -1.386419, -1.630113, 0, 0, 0, 1, 1,
-2.199969, -2.356401, -3.671908, 0, 0, 0, 1, 1,
-2.199249, -0.5224375, -2.099547, 0, 0, 0, 1, 1,
-2.153916, 0.4435252, -2.410297, 1, 1, 1, 1, 1,
-2.131434, -0.7088821, -1.920753, 1, 1, 1, 1, 1,
-2.04647, 0.3967027, -2.893173, 1, 1, 1, 1, 1,
-2.02277, -0.02674026, -1.985167, 1, 1, 1, 1, 1,
-1.99844, -0.06691972, -0.8899292, 1, 1, 1, 1, 1,
-1.992082, 0.2130175, -1.947916, 1, 1, 1, 1, 1,
-1.975013, -0.07631207, -0.5103235, 1, 1, 1, 1, 1,
-1.973, -0.4467533, -1.516157, 1, 1, 1, 1, 1,
-1.937359, 0.09263437, -1.824031, 1, 1, 1, 1, 1,
-1.920624, 0.320397, -0.9799473, 1, 1, 1, 1, 1,
-1.905164, -0.5632967, -1.484338, 1, 1, 1, 1, 1,
-1.89823, -0.1945681, -0.777586, 1, 1, 1, 1, 1,
-1.894559, 0.2682855, -2.096035, 1, 1, 1, 1, 1,
-1.86841, -1.650762, -2.45948, 1, 1, 1, 1, 1,
-1.839462, -0.9275228, -2.110476, 1, 1, 1, 1, 1,
-1.833029, -0.1041028, -0.9280111, 0, 0, 1, 1, 1,
-1.830809, 0.4664588, -0.1370124, 1, 0, 0, 1, 1,
-1.818499, 0.2468354, -1.582934, 1, 0, 0, 1, 1,
-1.795746, -0.9343985, -0.8835844, 1, 0, 0, 1, 1,
-1.784676, -0.9006522, -1.910971, 1, 0, 0, 1, 1,
-1.772282, 0.2799217, -1.448809, 1, 0, 0, 1, 1,
-1.767986, 0.1369868, 0.1778868, 0, 0, 0, 1, 1,
-1.763183, -0.5930322, -1.659876, 0, 0, 0, 1, 1,
-1.747032, 0.8377007, -0.8834135, 0, 0, 0, 1, 1,
-1.737553, 0.7919039, -1.739488, 0, 0, 0, 1, 1,
-1.73381, 1.330884, -0.4377722, 0, 0, 0, 1, 1,
-1.723696, 1.005166, -2.366635, 0, 0, 0, 1, 1,
-1.715217, 1.0172, -3.658528, 0, 0, 0, 1, 1,
-1.705176, 0.3939555, -2.996549, 1, 1, 1, 1, 1,
-1.703595, 0.1643152, -0.7547328, 1, 1, 1, 1, 1,
-1.695197, 0.3727769, -2.592537, 1, 1, 1, 1, 1,
-1.691725, -0.7871825, -0.4829745, 1, 1, 1, 1, 1,
-1.67893, -0.806007, -0.8020858, 1, 1, 1, 1, 1,
-1.674389, -0.05827537, -1.356654, 1, 1, 1, 1, 1,
-1.65168, 0.3047646, -2.033765, 1, 1, 1, 1, 1,
-1.637225, -1.870426, -1.96889, 1, 1, 1, 1, 1,
-1.634683, -0.4755951, -0.4025473, 1, 1, 1, 1, 1,
-1.633312, 0.6649555, -0.7984971, 1, 1, 1, 1, 1,
-1.63024, -0.5767748, -2.336822, 1, 1, 1, 1, 1,
-1.627274, -1.03847, -2.072505, 1, 1, 1, 1, 1,
-1.627022, 0.5989993, -1.879794, 1, 1, 1, 1, 1,
-1.614947, -0.6855307, -2.206826, 1, 1, 1, 1, 1,
-1.608089, 0.9012677, -1.20432, 1, 1, 1, 1, 1,
-1.596486, 1.150672, -1.532011, 0, 0, 1, 1, 1,
-1.580473, 0.5452626, -0.6733921, 1, 0, 0, 1, 1,
-1.568722, -0.04983574, -1.654593, 1, 0, 0, 1, 1,
-1.552834, -1.049977, 0.1582552, 1, 0, 0, 1, 1,
-1.532175, 0.8770989, 1.120553, 1, 0, 0, 1, 1,
-1.519002, 0.4538483, -1.222761, 1, 0, 0, 1, 1,
-1.504622, 0.6325054, -0.1880983, 0, 0, 0, 1, 1,
-1.503852, -0.1721829, -2.955242, 0, 0, 0, 1, 1,
-1.492208, -0.5502315, -2.018872, 0, 0, 0, 1, 1,
-1.484409, -1.280681, -2.821656, 0, 0, 0, 1, 1,
-1.481276, -0.0551245, -0.826578, 0, 0, 0, 1, 1,
-1.452208, 0.06981263, -1.146115, 0, 0, 0, 1, 1,
-1.44833, -1.012336, -1.186267, 0, 0, 0, 1, 1,
-1.443253, -2.021313, -3.163842, 1, 1, 1, 1, 1,
-1.439856, 0.3535461, -0.9757282, 1, 1, 1, 1, 1,
-1.420764, 1.061814, -1.806675, 1, 1, 1, 1, 1,
-1.418316, -0.5605012, -0.05219301, 1, 1, 1, 1, 1,
-1.416215, 0.4963518, -1.83647, 1, 1, 1, 1, 1,
-1.415902, 0.509989, -0.4917246, 1, 1, 1, 1, 1,
-1.408742, -1.020129, -1.509122, 1, 1, 1, 1, 1,
-1.406434, 0.7644573, -0.8306499, 1, 1, 1, 1, 1,
-1.396723, -1.768946, 0.1540788, 1, 1, 1, 1, 1,
-1.39209, 2.195731, -1.631006, 1, 1, 1, 1, 1,
-1.387526, 0.7514739, -1.482916, 1, 1, 1, 1, 1,
-1.370443, 0.9114251, 0.8563849, 1, 1, 1, 1, 1,
-1.361964, -0.3170856, 0.2364389, 1, 1, 1, 1, 1,
-1.350846, 0.9176743, -0.230142, 1, 1, 1, 1, 1,
-1.348654, 0.3805291, -1.03438, 1, 1, 1, 1, 1,
-1.345444, 0.1382326, -0.9565545, 0, 0, 1, 1, 1,
-1.342782, -0.7613411, -1.44337, 1, 0, 0, 1, 1,
-1.335368, 0.01786258, -2.394306, 1, 0, 0, 1, 1,
-1.330216, -1.272563, -2.19554, 1, 0, 0, 1, 1,
-1.328227, 0.9177984, -1.554727, 1, 0, 0, 1, 1,
-1.321431, -0.9210367, -3.303877, 1, 0, 0, 1, 1,
-1.314611, 1.230656, 0.1386369, 0, 0, 0, 1, 1,
-1.313428, 0.4157732, -2.726163, 0, 0, 0, 1, 1,
-1.304793, -0.6560846, -1.458995, 0, 0, 0, 1, 1,
-1.297363, 0.07571594, 1.205703, 0, 0, 0, 1, 1,
-1.290316, -0.04099003, -0.9854612, 0, 0, 0, 1, 1,
-1.281349, 1.23669, 1.055556, 0, 0, 0, 1, 1,
-1.279293, -1.058862, -2.02983, 0, 0, 0, 1, 1,
-1.270684, -0.892417, -2.069637, 1, 1, 1, 1, 1,
-1.254557, 0.0670042, -2.445648, 1, 1, 1, 1, 1,
-1.252196, 0.1391184, -1.746684, 1, 1, 1, 1, 1,
-1.247343, 0.4124273, -0.7702608, 1, 1, 1, 1, 1,
-1.232957, -0.9035698, -2.944522, 1, 1, 1, 1, 1,
-1.230889, 0.2572723, -1.311826, 1, 1, 1, 1, 1,
-1.230777, -0.5399556, -0.8547834, 1, 1, 1, 1, 1,
-1.229339, -0.8895122, -2.505295, 1, 1, 1, 1, 1,
-1.226548, -0.4573436, -1.486526, 1, 1, 1, 1, 1,
-1.22567, -0.2739308, -2.016618, 1, 1, 1, 1, 1,
-1.223588, 0.712994, -1.937843, 1, 1, 1, 1, 1,
-1.221231, -0.2871939, -0.3647607, 1, 1, 1, 1, 1,
-1.217435, 0.9663144, -1.151403, 1, 1, 1, 1, 1,
-1.212638, -0.9654155, -2.223639, 1, 1, 1, 1, 1,
-1.204759, -1.263283, -1.53212, 1, 1, 1, 1, 1,
-1.203472, -0.2159735, -1.836511, 0, 0, 1, 1, 1,
-1.196503, 0.6525084, 0.1999161, 1, 0, 0, 1, 1,
-1.19613, -0.2035922, -2.094364, 1, 0, 0, 1, 1,
-1.195143, -1.875511, -2.45037, 1, 0, 0, 1, 1,
-1.191575, 0.02549569, -1.102773, 1, 0, 0, 1, 1,
-1.189089, -0.8552781, -2.575438, 1, 0, 0, 1, 1,
-1.187423, -0.5555103, -1.866857, 0, 0, 0, 1, 1,
-1.180447, 1.984403, -0.2470892, 0, 0, 0, 1, 1,
-1.180364, -0.6767061, -0.2496344, 0, 0, 0, 1, 1,
-1.179892, 0.2186568, -1.864668, 0, 0, 0, 1, 1,
-1.177495, 0.1982104, -1.235312, 0, 0, 0, 1, 1,
-1.174435, -0.849657, -2.16697, 0, 0, 0, 1, 1,
-1.172952, -0.3561061, -2.349822, 0, 0, 0, 1, 1,
-1.166937, 0.009726889, -0.9008765, 1, 1, 1, 1, 1,
-1.164843, 0.7424071, -0.03537365, 1, 1, 1, 1, 1,
-1.155872, -2.108801, -2.336679, 1, 1, 1, 1, 1,
-1.153606, 0.3800572, -1.680489, 1, 1, 1, 1, 1,
-1.150988, 0.1265961, -2.049993, 1, 1, 1, 1, 1,
-1.149063, -1.639699, -2.866484, 1, 1, 1, 1, 1,
-1.135381, 0.4938214, -1.193992, 1, 1, 1, 1, 1,
-1.123862, 0.3278506, -2.485713, 1, 1, 1, 1, 1,
-1.11617, 2.214369, -1.563386, 1, 1, 1, 1, 1,
-1.114294, 0.8563408, -1.11184, 1, 1, 1, 1, 1,
-1.105811, -0.1072695, -2.100056, 1, 1, 1, 1, 1,
-1.100449, 0.581392, -1.20929, 1, 1, 1, 1, 1,
-1.0884, -1.688165, -3.416349, 1, 1, 1, 1, 1,
-1.085624, 1.623141, -0.4009045, 1, 1, 1, 1, 1,
-1.083881, -0.8202451, -1.841638, 1, 1, 1, 1, 1,
-1.080014, 0.3654982, -0.7063521, 0, 0, 1, 1, 1,
-1.07767, -0.1606615, -3.266213, 1, 0, 0, 1, 1,
-1.075112, -0.4240986, -1.815601, 1, 0, 0, 1, 1,
-1.07413, 0.4319839, -4.047329, 1, 0, 0, 1, 1,
-1.071846, -1.044405, -3.069748, 1, 0, 0, 1, 1,
-1.071753, -1.484187, -0.3410202, 1, 0, 0, 1, 1,
-1.069844, -0.9699152, -3.282845, 0, 0, 0, 1, 1,
-1.067122, -0.1221597, -2.332377, 0, 0, 0, 1, 1,
-1.054712, 0.3589143, -2.785689, 0, 0, 0, 1, 1,
-1.053304, 1.582075, -0.3347194, 0, 0, 0, 1, 1,
-1.04982, -0.9617912, -1.502929, 0, 0, 0, 1, 1,
-1.047433, 0.3870371, -2.516824, 0, 0, 0, 1, 1,
-1.042785, 0.2959568, -1.049529, 0, 0, 0, 1, 1,
-1.041838, -1.393382, -3.690811, 1, 1, 1, 1, 1,
-1.040706, -1.052981, -0.6804557, 1, 1, 1, 1, 1,
-1.040201, 0.002217305, -2.870301, 1, 1, 1, 1, 1,
-1.039168, 0.5511094, -0.8627953, 1, 1, 1, 1, 1,
-1.035927, -0.5654089, -0.05058131, 1, 1, 1, 1, 1,
-1.03316, -0.2256726, -1.53712, 1, 1, 1, 1, 1,
-1.032949, -1.264781, -3.372878, 1, 1, 1, 1, 1,
-1.030073, 0.003190195, -2.476002, 1, 1, 1, 1, 1,
-1.027629, 2.162701, -1.110045, 1, 1, 1, 1, 1,
-1.026925, -0.1623829, -0.3723864, 1, 1, 1, 1, 1,
-1.026178, -1.058228, -1.289966, 1, 1, 1, 1, 1,
-1.025269, 1.011523, 1.068248, 1, 1, 1, 1, 1,
-1.022377, -2.290078, -3.506629, 1, 1, 1, 1, 1,
-1.017902, -0.3187764, -2.991815, 1, 1, 1, 1, 1,
-1.009776, 0.02101169, -1.811259, 1, 1, 1, 1, 1,
-1.005193, 1.648306, -0.4326413, 0, 0, 1, 1, 1,
-0.9962094, 0.02506144, -2.274111, 1, 0, 0, 1, 1,
-0.9871163, 0.6662464, 0.02824418, 1, 0, 0, 1, 1,
-0.9846666, 0.232799, -2.011633, 1, 0, 0, 1, 1,
-0.9841914, 1.136025, -1.611121, 1, 0, 0, 1, 1,
-0.9666236, 1.786591, -0.8861393, 1, 0, 0, 1, 1,
-0.9602794, 0.1764461, -1.743051, 0, 0, 0, 1, 1,
-0.9579222, -1.314587, -1.277255, 0, 0, 0, 1, 1,
-0.956154, -0.561481, -2.003455, 0, 0, 0, 1, 1,
-0.9507385, 1.893899, 0.8539223, 0, 0, 0, 1, 1,
-0.9475726, 0.7488827, -1.305003, 0, 0, 0, 1, 1,
-0.9420803, -0.5058344, -3.475901, 0, 0, 0, 1, 1,
-0.9320072, -0.8839441, -3.654042, 0, 0, 0, 1, 1,
-0.9311963, -0.9242703, -2.906604, 1, 1, 1, 1, 1,
-0.9225219, 0.4379869, -1.098401, 1, 1, 1, 1, 1,
-0.921819, 1.246688, -0.8522051, 1, 1, 1, 1, 1,
-0.9187317, -0.3275217, -0.843255, 1, 1, 1, 1, 1,
-0.9181986, 0.4611674, 0.1830624, 1, 1, 1, 1, 1,
-0.9178961, 0.243102, -1.088513, 1, 1, 1, 1, 1,
-0.9168495, 1.656574, -0.5000972, 1, 1, 1, 1, 1,
-0.9151756, -0.2456012, -0.7091039, 1, 1, 1, 1, 1,
-0.9151455, -1.038168, -2.175062, 1, 1, 1, 1, 1,
-0.9120373, 0.2297871, 0.4852334, 1, 1, 1, 1, 1,
-0.9113346, -1.120096, -2.13198, 1, 1, 1, 1, 1,
-0.9064198, 0.8023829, 0.2658562, 1, 1, 1, 1, 1,
-0.9046422, 1.007067, 0.111202, 1, 1, 1, 1, 1,
-0.9037623, 1.356376, -1.533932, 1, 1, 1, 1, 1,
-0.8991451, -0.4162578, -0.1090501, 1, 1, 1, 1, 1,
-0.897144, -1.739965, -4.281264, 0, 0, 1, 1, 1,
-0.8870328, -2.09136, -1.315373, 1, 0, 0, 1, 1,
-0.8849069, -2.003986, -3.665151, 1, 0, 0, 1, 1,
-0.8828833, 0.5818359, -1.626599, 1, 0, 0, 1, 1,
-0.8773715, -1.034022, -0.810335, 1, 0, 0, 1, 1,
-0.8772911, 2.216467, 1.491729, 1, 0, 0, 1, 1,
-0.8761491, -0.2592412, -4.363484, 0, 0, 0, 1, 1,
-0.8734284, 0.1661465, -2.540193, 0, 0, 0, 1, 1,
-0.8732343, 0.4369603, -0.2424155, 0, 0, 0, 1, 1,
-0.8680099, -1.192021, -3.684551, 0, 0, 0, 1, 1,
-0.8669624, -1.771007, -0.9570346, 0, 0, 0, 1, 1,
-0.8638567, -1.966, -3.222056, 0, 0, 0, 1, 1,
-0.8599492, -0.2024494, -2.525724, 0, 0, 0, 1, 1,
-0.8540341, -0.677339, -2.68718, 1, 1, 1, 1, 1,
-0.8500084, 2.388554, -0.93313, 1, 1, 1, 1, 1,
-0.8436816, -1.093832, -2.432483, 1, 1, 1, 1, 1,
-0.8407034, 0.7542214, -0.334023, 1, 1, 1, 1, 1,
-0.8355487, -0.2870328, -1.005101, 1, 1, 1, 1, 1,
-0.8348594, 0.7292901, -1.228071, 1, 1, 1, 1, 1,
-0.8323582, -0.4251475, -2.749963, 1, 1, 1, 1, 1,
-0.829212, -0.6818118, -1.476914, 1, 1, 1, 1, 1,
-0.8245558, -0.3852761, -2.276988, 1, 1, 1, 1, 1,
-0.8196148, 0.8123881, -2.591183, 1, 1, 1, 1, 1,
-0.8161235, 0.5721325, -1.421941, 1, 1, 1, 1, 1,
-0.8146126, 0.4376627, -2.599978, 1, 1, 1, 1, 1,
-0.8091773, -1.379815, -3.187425, 1, 1, 1, 1, 1,
-0.8088356, -1.151956, -3.29003, 1, 1, 1, 1, 1,
-0.8082856, -0.6499348, -2.148, 1, 1, 1, 1, 1,
-0.8080276, 1.424693, -0.8804424, 0, 0, 1, 1, 1,
-0.8077536, 0.3892348, -0.8037589, 1, 0, 0, 1, 1,
-0.8033433, -0.8106742, -1.321142, 1, 0, 0, 1, 1,
-0.8032913, -0.9537674, -2.799432, 1, 0, 0, 1, 1,
-0.8007728, -0.7018073, -2.850525, 1, 0, 0, 1, 1,
-0.7995977, 0.5535322, -0.7234464, 1, 0, 0, 1, 1,
-0.7994146, -2.333189, -4.046219, 0, 0, 0, 1, 1,
-0.7965698, 1.489966, -2.693656, 0, 0, 0, 1, 1,
-0.7910652, 0.2305879, -3.047447, 0, 0, 0, 1, 1,
-0.7843229, -0.7065521, -1.679932, 0, 0, 0, 1, 1,
-0.7839833, 0.8035467, -0.8623668, 0, 0, 0, 1, 1,
-0.7837588, 0.4655772, -3.0257, 0, 0, 0, 1, 1,
-0.7824492, 0.8428609, 0.6864783, 0, 0, 0, 1, 1,
-0.7813939, 2.187918, -0.1736765, 1, 1, 1, 1, 1,
-0.780433, -0.933753, -1.713999, 1, 1, 1, 1, 1,
-0.7801956, 0.9800646, 0.4773757, 1, 1, 1, 1, 1,
-0.7801557, -0.6072378, -1.591648, 1, 1, 1, 1, 1,
-0.7759159, 0.2132373, -0.6949552, 1, 1, 1, 1, 1,
-0.7755488, 1.061235, 0.1886214, 1, 1, 1, 1, 1,
-0.7666989, -0.01635751, -2.245909, 1, 1, 1, 1, 1,
-0.7661787, 1.466883, -0.5182489, 1, 1, 1, 1, 1,
-0.7611148, -1.327062, -1.41552, 1, 1, 1, 1, 1,
-0.7596272, -0.3716027, -2.105332, 1, 1, 1, 1, 1,
-0.7557119, 1.651327, -1.960484, 1, 1, 1, 1, 1,
-0.7476909, -0.4503909, -2.730782, 1, 1, 1, 1, 1,
-0.7450253, 0.3273007, 0.1511237, 1, 1, 1, 1, 1,
-0.7447245, 1.124157, -0.05923814, 1, 1, 1, 1, 1,
-0.7392127, 0.9059078, -0.08071846, 1, 1, 1, 1, 1,
-0.7390223, -0.8300901, -1.74088, 0, 0, 1, 1, 1,
-0.7323654, 1.532502, 0.7760701, 1, 0, 0, 1, 1,
-0.730872, 0.4270017, -2.045618, 1, 0, 0, 1, 1,
-0.7300184, -1.744484, -1.402931, 1, 0, 0, 1, 1,
-0.7291008, -0.3440307, -1.054251, 1, 0, 0, 1, 1,
-0.7170584, 0.7243444, 1.032305, 1, 0, 0, 1, 1,
-0.7162074, 1.561199, -1.928545, 0, 0, 0, 1, 1,
-0.712758, 0.5277109, -0.5970502, 0, 0, 0, 1, 1,
-0.7098722, 0.2395461, -0.8316743, 0, 0, 0, 1, 1,
-0.7063044, 0.6875517, -0.6107602, 0, 0, 0, 1, 1,
-0.70496, 1.110082, 0.1413098, 0, 0, 0, 1, 1,
-0.7024694, -0.31162, -1.70662, 0, 0, 0, 1, 1,
-0.7022299, -0.4497667, -2.141449, 0, 0, 0, 1, 1,
-0.7010252, 0.2894596, 1.097677, 1, 1, 1, 1, 1,
-0.6979381, 0.7999775, -1.382034, 1, 1, 1, 1, 1,
-0.6925941, 1.534392, 0.2779092, 1, 1, 1, 1, 1,
-0.691451, -0.2491615, -2.16928, 1, 1, 1, 1, 1,
-0.6861796, -1.303214, -3.971001, 1, 1, 1, 1, 1,
-0.6841889, -2.121656, -1.55801, 1, 1, 1, 1, 1,
-0.6828672, 0.8474711, 1.238224, 1, 1, 1, 1, 1,
-0.6755689, -1.868513, -3.347128, 1, 1, 1, 1, 1,
-0.6726108, 0.3266649, -2.230184, 1, 1, 1, 1, 1,
-0.6713855, -0.01929979, -1.729777, 1, 1, 1, 1, 1,
-0.6618831, -0.8435457, -3.484018, 1, 1, 1, 1, 1,
-0.6617633, -0.09250718, -2.092171, 1, 1, 1, 1, 1,
-0.661636, -1.05745, -2.743257, 1, 1, 1, 1, 1,
-0.6547076, -1.152522, -3.488328, 1, 1, 1, 1, 1,
-0.65353, -0.6082184, -3.068671, 1, 1, 1, 1, 1,
-0.6515822, -0.17986, -3.393514, 0, 0, 1, 1, 1,
-0.6473503, -0.6314961, -3.770929, 1, 0, 0, 1, 1,
-0.6451226, -1.675459, -2.513396, 1, 0, 0, 1, 1,
-0.6431746, 0.6133021, -1.382005, 1, 0, 0, 1, 1,
-0.638702, -1.336428, -3.696817, 1, 0, 0, 1, 1,
-0.6369544, -0.420402, -1.772909, 1, 0, 0, 1, 1,
-0.6348185, 1.152398, -0.9404989, 0, 0, 0, 1, 1,
-0.6332236, 0.5453413, -0.3521143, 0, 0, 0, 1, 1,
-0.6274936, 0.8280781, -1.438213, 0, 0, 0, 1, 1,
-0.6268274, 0.2931145, -0.8694947, 0, 0, 0, 1, 1,
-0.6159593, 1.596206, -1.408173, 0, 0, 0, 1, 1,
-0.6101282, 1.981495, -0.7898021, 0, 0, 0, 1, 1,
-0.6073977, -0.3054948, -1.086574, 0, 0, 0, 1, 1,
-0.6064001, 0.4725642, -2.528489, 1, 1, 1, 1, 1,
-0.6063991, -2.390566, -1.647952, 1, 1, 1, 1, 1,
-0.6046285, -1.098229, -2.176022, 1, 1, 1, 1, 1,
-0.6035114, 1.939325, 0.2519887, 1, 1, 1, 1, 1,
-0.5949017, 0.6849412, -0.1082203, 1, 1, 1, 1, 1,
-0.5907214, -0.4624132, -2.062016, 1, 1, 1, 1, 1,
-0.5836871, 0.5008821, -1.205803, 1, 1, 1, 1, 1,
-0.5815395, 0.3377804, -0.4117719, 1, 1, 1, 1, 1,
-0.5798763, 1.035642, -0.7919568, 1, 1, 1, 1, 1,
-0.5776958, -0.4356227, -2.017937, 1, 1, 1, 1, 1,
-0.5748315, -0.2712252, -0.6600662, 1, 1, 1, 1, 1,
-0.570308, -0.2079387, -2.51544, 1, 1, 1, 1, 1,
-0.5687436, 1.059338, -0.7490807, 1, 1, 1, 1, 1,
-0.5669704, 0.08369268, -1.378722, 1, 1, 1, 1, 1,
-0.5643154, -0.9966176, -3.143854, 1, 1, 1, 1, 1,
-0.5602896, 2.52429, 0.9184837, 0, 0, 1, 1, 1,
-0.5594524, 1.077145, -0.8920987, 1, 0, 0, 1, 1,
-0.5505978, 0.7235816, 0.1867361, 1, 0, 0, 1, 1,
-0.5483577, 1.206351, -1.087569, 1, 0, 0, 1, 1,
-0.5470909, 0.2747267, 0.0302532, 1, 0, 0, 1, 1,
-0.5449921, -0.9395357, -2.539862, 1, 0, 0, 1, 1,
-0.5413297, 1.158193, -0.1806475, 0, 0, 0, 1, 1,
-0.5370101, 0.7481752, -1.191596, 0, 0, 0, 1, 1,
-0.5351135, 1.000416, 0.4995675, 0, 0, 0, 1, 1,
-0.5276407, -0.2840605, -2.790042, 0, 0, 0, 1, 1,
-0.5268474, 1.435247, -0.1102642, 0, 0, 0, 1, 1,
-0.5156657, -1.24877, -2.975675, 0, 0, 0, 1, 1,
-0.5143834, -1.359372, -2.18701, 0, 0, 0, 1, 1,
-0.5063764, 0.4365938, -1.56955, 1, 1, 1, 1, 1,
-0.5035532, -0.6749011, -1.290329, 1, 1, 1, 1, 1,
-0.5031551, -0.6641017, -2.679596, 1, 1, 1, 1, 1,
-0.4974065, -1.722166, -2.526076, 1, 1, 1, 1, 1,
-0.4961984, -0.5766532, -1.99567, 1, 1, 1, 1, 1,
-0.4943157, 0.02034027, -3.14498, 1, 1, 1, 1, 1,
-0.4941727, 1.02286, 0.06911273, 1, 1, 1, 1, 1,
-0.4840919, -0.4912934, -4.188382, 1, 1, 1, 1, 1,
-0.4831121, -1.188738, -3.097161, 1, 1, 1, 1, 1,
-0.4819221, -0.6949505, -2.039816, 1, 1, 1, 1, 1,
-0.4796861, 2.119855, -0.3384983, 1, 1, 1, 1, 1,
-0.4793718, 2.695202, -0.1459915, 1, 1, 1, 1, 1,
-0.4775373, -0.7144138, -0.3683039, 1, 1, 1, 1, 1,
-0.4687959, -0.8938689, -3.859695, 1, 1, 1, 1, 1,
-0.4631998, -0.4616717, -1.571905, 1, 1, 1, 1, 1,
-0.460717, 0.4882806, -0.5007958, 0, 0, 1, 1, 1,
-0.454492, -0.7488409, -2.917908, 1, 0, 0, 1, 1,
-0.4535995, -1.854779, -3.304691, 1, 0, 0, 1, 1,
-0.4522186, -0.02706134, -2.312913, 1, 0, 0, 1, 1,
-0.4461202, 2.59084, 0.009224947, 1, 0, 0, 1, 1,
-0.4452055, -1.097237, -2.201244, 1, 0, 0, 1, 1,
-0.4420465, -0.3545806, -3.141079, 0, 0, 0, 1, 1,
-0.4336719, -0.09070179, -4.181876, 0, 0, 0, 1, 1,
-0.4243997, -0.5168555, -4.959362, 0, 0, 0, 1, 1,
-0.4189681, 1.197395, 0.2762427, 0, 0, 0, 1, 1,
-0.4139659, 0.5870458, -1.238779, 0, 0, 0, 1, 1,
-0.4138692, -0.2500137, -1.363862, 0, 0, 0, 1, 1,
-0.4131449, -1.382147, -2.139798, 0, 0, 0, 1, 1,
-0.4126208, -0.4009041, -2.214953, 1, 1, 1, 1, 1,
-0.4119209, -1.150568, -3.848681, 1, 1, 1, 1, 1,
-0.4118609, -0.03844016, 0.07848736, 1, 1, 1, 1, 1,
-0.4059296, -0.1000174, -1.523212, 1, 1, 1, 1, 1,
-0.4050116, 1.44694, -3.38303, 1, 1, 1, 1, 1,
-0.40432, -0.6144486, -1.867275, 1, 1, 1, 1, 1,
-0.4038122, -0.3818569, -2.617743, 1, 1, 1, 1, 1,
-0.3993703, -0.318841, -3.424417, 1, 1, 1, 1, 1,
-0.39873, -0.5972909, -2.514061, 1, 1, 1, 1, 1,
-0.3984513, 1.580913, -0.1317099, 1, 1, 1, 1, 1,
-0.3877155, -0.1737734, -0.5762007, 1, 1, 1, 1, 1,
-0.3845733, -0.1652332, -1.724731, 1, 1, 1, 1, 1,
-0.3766246, -0.5016568, -1.892259, 1, 1, 1, 1, 1,
-0.3705827, -0.6429219, -1.730021, 1, 1, 1, 1, 1,
-0.3693019, 0.2688662, -2.491211, 1, 1, 1, 1, 1,
-0.3686109, -1.212816, -3.111546, 0, 0, 1, 1, 1,
-0.3678438, 1.31127, 1.476385, 1, 0, 0, 1, 1,
-0.3670541, -0.7888392, -1.336133, 1, 0, 0, 1, 1,
-0.3655842, 0.6991312, -0.3809511, 1, 0, 0, 1, 1,
-0.3591861, -0.7115204, -1.832569, 1, 0, 0, 1, 1,
-0.35353, 0.1239348, -0.3774486, 1, 0, 0, 1, 1,
-0.3532542, 0.3333353, -1.787004, 0, 0, 0, 1, 1,
-0.3523587, 1.605723, 0.05910669, 0, 0, 0, 1, 1,
-0.3502864, -1.409346, -3.420527, 0, 0, 0, 1, 1,
-0.3429507, -2.814306, -0.8863623, 0, 0, 0, 1, 1,
-0.3429424, 0.2180181, -1.635043, 0, 0, 0, 1, 1,
-0.3426313, -0.3377106, -3.518765, 0, 0, 0, 1, 1,
-0.3408731, -1.279466, -4.081249, 0, 0, 0, 1, 1,
-0.3399355, 0.0508131, -1.312435, 1, 1, 1, 1, 1,
-0.337022, 0.3050742, -0.3669877, 1, 1, 1, 1, 1,
-0.3310889, 0.2108022, 0.3969652, 1, 1, 1, 1, 1,
-0.3237747, 0.9672458, -0.1131381, 1, 1, 1, 1, 1,
-0.3236491, 0.9450653, 0.152957, 1, 1, 1, 1, 1,
-0.3195069, 0.5991437, 1.086192, 1, 1, 1, 1, 1,
-0.3166474, 0.06022472, -1.559642, 1, 1, 1, 1, 1,
-0.3164545, -0.2736795, -2.157131, 1, 1, 1, 1, 1,
-0.3162616, 0.2668995, -0.2332758, 1, 1, 1, 1, 1,
-0.3151374, 0.6214705, -0.2956146, 1, 1, 1, 1, 1,
-0.3134, -0.904843, -3.624072, 1, 1, 1, 1, 1,
-0.3090374, 0.1308992, -0.7317215, 1, 1, 1, 1, 1,
-0.3047324, -2.042904, -3.010627, 1, 1, 1, 1, 1,
-0.3005848, 0.2855836, 1.086832, 1, 1, 1, 1, 1,
-0.2986459, 0.3396829, -0.4164694, 1, 1, 1, 1, 1,
-0.2981893, 0.3676173, -0.6049944, 0, 0, 1, 1, 1,
-0.2938458, 0.09939492, -1.8187, 1, 0, 0, 1, 1,
-0.2922546, 0.2204312, -0.5941616, 1, 0, 0, 1, 1,
-0.2914354, -1.019556, -0.9413006, 1, 0, 0, 1, 1,
-0.2842506, 0.1468208, -0.01216261, 1, 0, 0, 1, 1,
-0.2827048, -0.4001553, -3.575575, 1, 0, 0, 1, 1,
-0.2790441, -1.025814, -4.177094, 0, 0, 0, 1, 1,
-0.2783818, -1.009321, -3.320288, 0, 0, 0, 1, 1,
-0.2780793, -0.1429745, -2.511293, 0, 0, 0, 1, 1,
-0.2767857, -0.1027189, -1.534294, 0, 0, 0, 1, 1,
-0.2758282, -1.364226, -3.252648, 0, 0, 0, 1, 1,
-0.26504, -1.012647, -2.264967, 0, 0, 0, 1, 1,
-0.2598331, 0.7136878, -1.013507, 0, 0, 0, 1, 1,
-0.2578517, -1.740941, -2.099751, 1, 1, 1, 1, 1,
-0.2556994, 1.525618, 1.866136, 1, 1, 1, 1, 1,
-0.2518375, -0.2534728, -1.337313, 1, 1, 1, 1, 1,
-0.2518239, -0.51499, -2.55264, 1, 1, 1, 1, 1,
-0.251065, 0.3802138, -0.278841, 1, 1, 1, 1, 1,
-0.2506565, -0.8586712, -4.286495, 1, 1, 1, 1, 1,
-0.2501377, 1.193637, -1.370278, 1, 1, 1, 1, 1,
-0.2491002, -0.3321066, -1.109712, 1, 1, 1, 1, 1,
-0.2447649, 0.1849331, -0.7523221, 1, 1, 1, 1, 1,
-0.2415735, 2.61017, 0.6418644, 1, 1, 1, 1, 1,
-0.2372386, -0.3612998, -3.693333, 1, 1, 1, 1, 1,
-0.2294147, 1.068447, 0.9809033, 1, 1, 1, 1, 1,
-0.2280456, 1.175487, -1.529607, 1, 1, 1, 1, 1,
-0.225764, -0.2069404, -2.547257, 1, 1, 1, 1, 1,
-0.2213075, -0.5509174, -2.970708, 1, 1, 1, 1, 1,
-0.2181512, -0.9028993, -1.916913, 0, 0, 1, 1, 1,
-0.2163278, -0.9390471, -4.541023, 1, 0, 0, 1, 1,
-0.2162978, 2.299889, 1.728795, 1, 0, 0, 1, 1,
-0.2159237, 1.711189, -2.188338, 1, 0, 0, 1, 1,
-0.2132504, -1.83156, -2.759046, 1, 0, 0, 1, 1,
-0.205998, 0.2143634, -0.7259639, 1, 0, 0, 1, 1,
-0.2031289, 1.584801, -0.2989845, 0, 0, 0, 1, 1,
-0.2022987, -1.401513, -3.119816, 0, 0, 0, 1, 1,
-0.2015713, -0.8385478, -1.461197, 0, 0, 0, 1, 1,
-0.2008774, -0.06091867, -2.180582, 0, 0, 0, 1, 1,
-0.2001778, -0.2546434, -2.20018, 0, 0, 0, 1, 1,
-0.1941053, -1.629095, -2.720939, 0, 0, 0, 1, 1,
-0.1933493, -0.08722819, -3.262077, 0, 0, 0, 1, 1,
-0.1905404, -0.8618693, -1.336042, 1, 1, 1, 1, 1,
-0.1884766, 1.135656, 0.6559503, 1, 1, 1, 1, 1,
-0.1877372, -0.5289559, -1.435693, 1, 1, 1, 1, 1,
-0.1751997, 0.4872172, 0.2982475, 1, 1, 1, 1, 1,
-0.1735277, -1.085199, -4.402803, 1, 1, 1, 1, 1,
-0.1717096, 0.1328786, -0.3742387, 1, 1, 1, 1, 1,
-0.1699422, -0.6969589, -2.106256, 1, 1, 1, 1, 1,
-0.1628885, 0.5234045, 0.470637, 1, 1, 1, 1, 1,
-0.1624066, -0.8056163, -2.794158, 1, 1, 1, 1, 1,
-0.1623189, -1.224407, -2.032558, 1, 1, 1, 1, 1,
-0.1618715, 1.33454, 1.260478, 1, 1, 1, 1, 1,
-0.1557639, 1.932984, -0.8022678, 1, 1, 1, 1, 1,
-0.1534396, 0.2110097, 0.8892154, 1, 1, 1, 1, 1,
-0.1532377, 1.854755, 0.4732606, 1, 1, 1, 1, 1,
-0.1497456, 0.8883717, -1.268497, 1, 1, 1, 1, 1,
-0.1490555, 0.3363712, 0.5079491, 0, 0, 1, 1, 1,
-0.1478559, -0.4282005, -3.228404, 1, 0, 0, 1, 1,
-0.1463905, -0.3563384, -2.325389, 1, 0, 0, 1, 1,
-0.1423933, 0.07016422, -0.1747089, 1, 0, 0, 1, 1,
-0.1397836, 0.1683693, -0.1210364, 1, 0, 0, 1, 1,
-0.1378163, 0.354211, -0.4290479, 1, 0, 0, 1, 1,
-0.1335105, -2.711167, -3.315713, 0, 0, 0, 1, 1,
-0.1318808, 0.7009405, -0.2039664, 0, 0, 0, 1, 1,
-0.1262805, -0.1346737, -1.226138, 0, 0, 0, 1, 1,
-0.1239892, 1.971379, 0.8319443, 0, 0, 0, 1, 1,
-0.1182707, -0.6455092, -1.091835, 0, 0, 0, 1, 1,
-0.1178063, 0.5001701, -0.02117521, 0, 0, 0, 1, 1,
-0.1110711, -0.6394776, -4.074774, 0, 0, 0, 1, 1,
-0.1109805, 0.5942244, -0.847169, 1, 1, 1, 1, 1,
-0.1104561, 2.371813, -0.03431004, 1, 1, 1, 1, 1,
-0.1075748, 0.6275752, -1.027605, 1, 1, 1, 1, 1,
-0.1072065, 0.3304276, -2.624778, 1, 1, 1, 1, 1,
-0.1056326, -0.2847522, -3.483153, 1, 1, 1, 1, 1,
-0.1028401, -0.2933008, -1.939636, 1, 1, 1, 1, 1,
-0.1000012, 0.5056016, -0.4617979, 1, 1, 1, 1, 1,
-0.09458178, 0.851976, -0.02847847, 1, 1, 1, 1, 1,
-0.09383766, 0.8518937, 0.5504586, 1, 1, 1, 1, 1,
-0.09222652, -0.7206412, -3.551369, 1, 1, 1, 1, 1,
-0.09102038, 0.1359804, 0.0547731, 1, 1, 1, 1, 1,
-0.08916637, 0.2486788, 0.5859859, 1, 1, 1, 1, 1,
-0.08056775, -1.989822, -4.027907, 1, 1, 1, 1, 1,
-0.0752855, -0.4997875, -3.340868, 1, 1, 1, 1, 1,
-0.07457243, -0.5976246, -2.910861, 1, 1, 1, 1, 1,
-0.0712113, -1.136552, -1.875497, 0, 0, 1, 1, 1,
-0.06737819, -1.212832, -3.713966, 1, 0, 0, 1, 1,
-0.06710934, -1.239244, -4.542311, 1, 0, 0, 1, 1,
-0.06632653, -0.3267123, -4.794957, 1, 0, 0, 1, 1,
-0.06557774, -0.2920639, -1.318705, 1, 0, 0, 1, 1,
-0.06412724, -0.3137807, -2.119968, 1, 0, 0, 1, 1,
-0.0637871, 0.2872659, 0.2906264, 0, 0, 0, 1, 1,
-0.06286547, 0.8991804, -0.7636613, 0, 0, 0, 1, 1,
-0.06273267, -2.123509, -1.616453, 0, 0, 0, 1, 1,
-0.06100151, -0.7354085, -3.71407, 0, 0, 0, 1, 1,
-0.05800922, 0.3828097, 0.2264843, 0, 0, 0, 1, 1,
-0.05579155, 1.109851, -0.2445956, 0, 0, 0, 1, 1,
-0.05149674, 1.087494, -0.01720123, 0, 0, 0, 1, 1,
-0.04445388, 0.243837, 0.4225874, 1, 1, 1, 1, 1,
-0.04320173, 1.242518, -1.146813, 1, 1, 1, 1, 1,
-0.0428545, 0.1900685, -0.1027098, 1, 1, 1, 1, 1,
-0.04260634, -0.1348094, -3.359636, 1, 1, 1, 1, 1,
-0.04255519, 0.0176544, -1.536478, 1, 1, 1, 1, 1,
-0.04254457, 0.1303203, -2.295499, 1, 1, 1, 1, 1,
-0.03643714, -1.805396, -4.122221, 1, 1, 1, 1, 1,
-0.03409737, 1.085497, -0.3458853, 1, 1, 1, 1, 1,
-0.03125071, -0.07652143, -2.484191, 1, 1, 1, 1, 1,
-0.03048744, 0.129479, 0.1691283, 1, 1, 1, 1, 1,
-0.02457094, 0.8244051, -0.9887769, 1, 1, 1, 1, 1,
-0.01987742, 0.2376662, -0.2720762, 1, 1, 1, 1, 1,
-0.01650009, -0.2076266, -1.394011, 1, 1, 1, 1, 1,
-0.01293552, -1.152896, -2.140864, 1, 1, 1, 1, 1,
-0.01126431, -0.3303947, -2.639505, 1, 1, 1, 1, 1,
-0.008815947, 0.2186169, -0.6441565, 0, 0, 1, 1, 1,
-0.007732247, 0.0006067259, -0.5154878, 1, 0, 0, 1, 1,
-0.007510872, 0.2248708, -0.9493935, 1, 0, 0, 1, 1,
-0.007223359, -1.834009, -1.997751, 1, 0, 0, 1, 1,
-0.005316025, -0.9269699, -3.167278, 1, 0, 0, 1, 1,
-0.004745254, -1.14298, -3.475364, 1, 0, 0, 1, 1,
-0.004361762, -0.8730001, -3.079173, 0, 0, 0, 1, 1,
-0.003609093, -0.2353684, -3.17616, 0, 0, 0, 1, 1,
-0.0009178473, 0.0693524, 1.137423, 0, 0, 0, 1, 1,
0.001152344, -0.2633223, 3.728072, 0, 0, 0, 1, 1,
0.001312612, -0.1239537, 2.053161, 0, 0, 0, 1, 1,
0.006589484, -0.5281801, 2.628144, 0, 0, 0, 1, 1,
0.006909428, -1.837512, 2.825059, 0, 0, 0, 1, 1,
0.007184028, -0.6665969, 2.628258, 1, 1, 1, 1, 1,
0.007508826, -0.857887, 3.874538, 1, 1, 1, 1, 1,
0.01094176, -2.325352, 4.188186, 1, 1, 1, 1, 1,
0.01140693, 0.1600255, 0.6563948, 1, 1, 1, 1, 1,
0.01223676, -0.6406276, 2.607783, 1, 1, 1, 1, 1,
0.013311, -1.670313, 3.435508, 1, 1, 1, 1, 1,
0.01761898, 0.1667496, 2.064263, 1, 1, 1, 1, 1,
0.01770085, -0.877468, 2.20517, 1, 1, 1, 1, 1,
0.01898047, -2.33496, 3.303828, 1, 1, 1, 1, 1,
0.02405307, 0.3867033, -0.4754188, 1, 1, 1, 1, 1,
0.02594784, 1.244094, 1.582067, 1, 1, 1, 1, 1,
0.0269912, 0.5515466, -0.2871709, 1, 1, 1, 1, 1,
0.02793073, -0.2069218, 3.031486, 1, 1, 1, 1, 1,
0.02793859, 1.169246, 1.018644, 1, 1, 1, 1, 1,
0.02832854, 0.2967296, 0.003264383, 1, 1, 1, 1, 1,
0.03497862, -0.472157, 2.774265, 0, 0, 1, 1, 1,
0.03786483, -0.03944578, 4.206833, 1, 0, 0, 1, 1,
0.03886828, 0.3133011, 0.2218377, 1, 0, 0, 1, 1,
0.0425868, 1.432047, -1.465026, 1, 0, 0, 1, 1,
0.04288488, -0.6368338, 3.555319, 1, 0, 0, 1, 1,
0.04433793, 0.004248147, 0.6577788, 1, 0, 0, 1, 1,
0.04541074, -1.577854, 3.611416, 0, 0, 0, 1, 1,
0.05441733, 0.5692737, -0.09373498, 0, 0, 0, 1, 1,
0.05470766, 0.613323, 1.714393, 0, 0, 0, 1, 1,
0.06003975, -0.6968138, 1.597298, 0, 0, 0, 1, 1,
0.06174804, -1.655997, 3.21821, 0, 0, 0, 1, 1,
0.06204332, 1.034327, -0.8576926, 0, 0, 0, 1, 1,
0.06239474, 0.4067427, -1.025484, 0, 0, 0, 1, 1,
0.06362066, -0.4669939, 3.52618, 1, 1, 1, 1, 1,
0.06493279, -1.458608, 1.543815, 1, 1, 1, 1, 1,
0.06526452, -0.4429576, 2.357443, 1, 1, 1, 1, 1,
0.0692912, 0.7180987, 0.3846528, 1, 1, 1, 1, 1,
0.06978924, 1.495703, -1.189053, 1, 1, 1, 1, 1,
0.07030081, -0.4073273, 2.201364, 1, 1, 1, 1, 1,
0.08085925, 1.871582, 0.3694943, 1, 1, 1, 1, 1,
0.08433942, -1.271704, 1.932928, 1, 1, 1, 1, 1,
0.08507321, -0.2748589, 3.167751, 1, 1, 1, 1, 1,
0.08670614, -1.754148, 5.060654, 1, 1, 1, 1, 1,
0.08992048, 0.4258206, -1.1271, 1, 1, 1, 1, 1,
0.09257826, 0.2313354, 0.6224668, 1, 1, 1, 1, 1,
0.09472483, -0.3110624, 4.494368, 1, 1, 1, 1, 1,
0.1016032, -0.6687785, 1.294439, 1, 1, 1, 1, 1,
0.1031005, -0.5485513, 3.181121, 1, 1, 1, 1, 1,
0.1084417, 1.217818, -0.5941701, 0, 0, 1, 1, 1,
0.1095263, 1.428782, 1.274459, 1, 0, 0, 1, 1,
0.1099702, 0.1162061, 1.023282, 1, 0, 0, 1, 1,
0.114557, 1.351, 0.4186636, 1, 0, 0, 1, 1,
0.1163336, 0.06572762, 1.590656, 1, 0, 0, 1, 1,
0.1223833, 1.185293, -0.3096454, 1, 0, 0, 1, 1,
0.127115, -0.3520255, 3.074268, 0, 0, 0, 1, 1,
0.1384122, 0.4126162, 1.883737, 0, 0, 0, 1, 1,
0.1394368, -0.04588705, 5.066719, 0, 0, 0, 1, 1,
0.1395138, 0.4402916, 0.3892145, 0, 0, 0, 1, 1,
0.1400903, 0.5297959, 0.4614087, 0, 0, 0, 1, 1,
0.1407928, -0.5746673, 3.808868, 0, 0, 0, 1, 1,
0.142798, -1.462685, 2.632361, 0, 0, 0, 1, 1,
0.146221, -0.4496357, 3.5529, 1, 1, 1, 1, 1,
0.1466378, 0.4463535, 0.2695512, 1, 1, 1, 1, 1,
0.1481613, 0.1907893, 0.5754654, 1, 1, 1, 1, 1,
0.1486718, -0.2432346, 2.189734, 1, 1, 1, 1, 1,
0.1534363, 0.5505714, 0.1552405, 1, 1, 1, 1, 1,
0.1584487, 1.514006, 2.019239, 1, 1, 1, 1, 1,
0.1655915, 0.02846996, 3.17854, 1, 1, 1, 1, 1,
0.1691161, 0.6688913, 0.7814066, 1, 1, 1, 1, 1,
0.1700556, 0.1050625, -0.1021077, 1, 1, 1, 1, 1,
0.1711874, 0.4016358, -0.2134442, 1, 1, 1, 1, 1,
0.1816432, -0.3203347, 3.719381, 1, 1, 1, 1, 1,
0.1824693, 0.8440743, -0.9205366, 1, 1, 1, 1, 1,
0.1849561, -0.6102937, 4.357004, 1, 1, 1, 1, 1,
0.1873561, 1.451038, 0.2153447, 1, 1, 1, 1, 1,
0.1890492, 0.0804938, 1.437101, 1, 1, 1, 1, 1,
0.1890661, -2.962546, 2.266146, 0, 0, 1, 1, 1,
0.1909442, -0.131805, 2.699444, 1, 0, 0, 1, 1,
0.1912488, 1.870139, 0.5875443, 1, 0, 0, 1, 1,
0.1949566, 0.6048677, 0.7289017, 1, 0, 0, 1, 1,
0.1960845, 0.5693809, -0.2661901, 1, 0, 0, 1, 1,
0.1975074, 0.7486164, -0.6170669, 1, 0, 0, 1, 1,
0.1982372, 0.4240266, 1.740885, 0, 0, 0, 1, 1,
0.2007965, 0.6362607, -0.4182112, 0, 0, 0, 1, 1,
0.2016135, -0.9750129, 3.20661, 0, 0, 0, 1, 1,
0.2026933, 0.872533, -1.903997, 0, 0, 0, 1, 1,
0.202983, -1.653311, 3.122756, 0, 0, 0, 1, 1,
0.2044914, -0.37389, 3.802001, 0, 0, 0, 1, 1,
0.2071161, 0.1896405, 2.276072, 0, 0, 0, 1, 1,
0.2074243, -0.8656859, 3.162407, 1, 1, 1, 1, 1,
0.2083814, 0.9275711, -0.3707238, 1, 1, 1, 1, 1,
0.2101973, 0.4963466, -0.1598056, 1, 1, 1, 1, 1,
0.2156081, 1.31742, -0.4534318, 1, 1, 1, 1, 1,
0.2166656, 1.386507, 0.944861, 1, 1, 1, 1, 1,
0.2167362, 0.432112, -0.3289143, 1, 1, 1, 1, 1,
0.2175969, 0.2818094, 0.4457144, 1, 1, 1, 1, 1,
0.2176541, -0.2017892, 3.409301, 1, 1, 1, 1, 1,
0.2213019, -0.07607394, 2.553394, 1, 1, 1, 1, 1,
0.2223907, 0.1214506, 1.597104, 1, 1, 1, 1, 1,
0.2239473, 2.223947, -1.237824, 1, 1, 1, 1, 1,
0.2245137, 1.373716, 0.669312, 1, 1, 1, 1, 1,
0.2262767, 1.106098, -0.7741064, 1, 1, 1, 1, 1,
0.2283315, 0.7187862, 0.03989615, 1, 1, 1, 1, 1,
0.2295002, 1.131434, 0.05746784, 1, 1, 1, 1, 1,
0.2300228, -0.6272478, 4.74402, 0, 0, 1, 1, 1,
0.234189, -0.3418606, 1.962095, 1, 0, 0, 1, 1,
0.2358625, -0.2928822, 2.492664, 1, 0, 0, 1, 1,
0.237782, -0.3915148, 3.151197, 1, 0, 0, 1, 1,
0.2388569, -0.2738135, 2.734659, 1, 0, 0, 1, 1,
0.2392489, 1.258505, 0.6781, 1, 0, 0, 1, 1,
0.2406547, -0.7562068, 2.495537, 0, 0, 0, 1, 1,
0.2434654, -2.038594, 2.246122, 0, 0, 0, 1, 1,
0.2477713, 0.6171919, 2.029902, 0, 0, 0, 1, 1,
0.2508636, 0.9171323, -0.630601, 0, 0, 0, 1, 1,
0.2541792, -1.217591, 1.424858, 0, 0, 0, 1, 1,
0.2569617, -2.516318, 3.642551, 0, 0, 0, 1, 1,
0.2591161, 1.152283, 0.2021083, 0, 0, 0, 1, 1,
0.2593201, -0.3484135, 2.587904, 1, 1, 1, 1, 1,
0.263001, -0.02508733, 1.893919, 1, 1, 1, 1, 1,
0.2664497, 0.3285627, 1.091101, 1, 1, 1, 1, 1,
0.267114, -1.001661, 3.193023, 1, 1, 1, 1, 1,
0.2673083, -0.1333952, 3.61294, 1, 1, 1, 1, 1,
0.2675483, -0.3577405, 1.532432, 1, 1, 1, 1, 1,
0.2677849, 0.3521848, 1.745021, 1, 1, 1, 1, 1,
0.2680566, -1.034948, 4.188928, 1, 1, 1, 1, 1,
0.2732862, 0.8025494, -1.155214, 1, 1, 1, 1, 1,
0.2734052, 2.258721, 0.5347734, 1, 1, 1, 1, 1,
0.273633, 0.7548797, 0.2050172, 1, 1, 1, 1, 1,
0.2808589, -0.4266028, 1.359222, 1, 1, 1, 1, 1,
0.2818771, 0.6209196, 0.2587653, 1, 1, 1, 1, 1,
0.288624, 1.576122, 0.4396273, 1, 1, 1, 1, 1,
0.2907824, -0.3319794, 3.280417, 1, 1, 1, 1, 1,
0.2948855, -2.230146, 1.396747, 0, 0, 1, 1, 1,
0.2964903, -0.04191305, 2.481322, 1, 0, 0, 1, 1,
0.3027967, -0.2760453, 1.155518, 1, 0, 0, 1, 1,
0.3045255, -0.02010503, 2.847749, 1, 0, 0, 1, 1,
0.3048064, -1.302536, 3.730242, 1, 0, 0, 1, 1,
0.3076252, -0.8380656, 1.863181, 1, 0, 0, 1, 1,
0.3109344, -0.5563167, 2.72788, 0, 0, 0, 1, 1,
0.3109505, -0.2070008, 0.048497, 0, 0, 0, 1, 1,
0.3134196, 1.068232, 1.35269, 0, 0, 0, 1, 1,
0.3191412, 0.6763484, 0.2774321, 0, 0, 0, 1, 1,
0.321286, -0.8934866, 1.738663, 0, 0, 0, 1, 1,
0.3228962, -1.231942, 1.746934, 0, 0, 0, 1, 1,
0.3268517, -1.029429, 1.262834, 0, 0, 0, 1, 1,
0.3279194, -0.8988428, 2.280436, 1, 1, 1, 1, 1,
0.3284313, -1.027822, 2.626756, 1, 1, 1, 1, 1,
0.3303747, 0.2317082, 1.593974, 1, 1, 1, 1, 1,
0.3357549, 1.761953, -0.3593302, 1, 1, 1, 1, 1,
0.3371654, 1.315013, 1.720362, 1, 1, 1, 1, 1,
0.339821, 0.9459852, 1.836414, 1, 1, 1, 1, 1,
0.3447102, -0.04048247, 0.7521245, 1, 1, 1, 1, 1,
0.345236, -1.364726, 1.723781, 1, 1, 1, 1, 1,
0.3489107, 0.4213403, 1.265107, 1, 1, 1, 1, 1,
0.3491998, -0.232456, 0.4549898, 1, 1, 1, 1, 1,
0.3525999, -0.7523244, 2.896671, 1, 1, 1, 1, 1,
0.3558625, 1.03678, 2.365909, 1, 1, 1, 1, 1,
0.3570114, -0.625661, 3.093166, 1, 1, 1, 1, 1,
0.3626146, 0.3562583, 1.009247, 1, 1, 1, 1, 1,
0.3658412, 0.07976936, 0.3358059, 1, 1, 1, 1, 1,
0.3683285, 1.032102, 1.846819, 0, 0, 1, 1, 1,
0.370036, -1.589755, 2.859646, 1, 0, 0, 1, 1,
0.3863873, -1.541115, 3.178611, 1, 0, 0, 1, 1,
0.388103, -0.002799875, 1.834691, 1, 0, 0, 1, 1,
0.3903622, -0.2724275, 2.347503, 1, 0, 0, 1, 1,
0.3903625, 1.979809, 1.61488, 1, 0, 0, 1, 1,
0.3911801, -0.3237983, 4.67353, 0, 0, 0, 1, 1,
0.3936114, 0.2661553, 4.079124, 0, 0, 0, 1, 1,
0.3937168, -1.206148, 2.29556, 0, 0, 0, 1, 1,
0.3942665, 2.023114, 1.431048, 0, 0, 0, 1, 1,
0.3955971, -1.096053, 2.117643, 0, 0, 0, 1, 1,
0.4015177, 0.9507445, 0.885603, 0, 0, 0, 1, 1,
0.4019726, -0.5819947, 1.918582, 0, 0, 0, 1, 1,
0.4029064, 0.1155185, -0.4437453, 1, 1, 1, 1, 1,
0.4044033, -0.1032727, 2.004559, 1, 1, 1, 1, 1,
0.4100133, -1.051482, 2.664911, 1, 1, 1, 1, 1,
0.4101225, -0.555715, 2.472858, 1, 1, 1, 1, 1,
0.416294, 0.4076456, 1.761367, 1, 1, 1, 1, 1,
0.4183015, 0.9245077, -0.3752707, 1, 1, 1, 1, 1,
0.42013, 1.234962, -1.639346, 1, 1, 1, 1, 1,
0.4205539, -0.5268481, 2.990739, 1, 1, 1, 1, 1,
0.4219835, -1.703326, 2.472329, 1, 1, 1, 1, 1,
0.4252258, 1.873786, 0.1923931, 1, 1, 1, 1, 1,
0.4253933, 0.5317082, 0.1417591, 1, 1, 1, 1, 1,
0.4301102, 0.3917762, 2.085691, 1, 1, 1, 1, 1,
0.4319069, -0.3890626, 2.358971, 1, 1, 1, 1, 1,
0.4344817, -1.455962, 2.047741, 1, 1, 1, 1, 1,
0.4347168, -0.5051854, 1.392658, 1, 1, 1, 1, 1,
0.4377328, -1.753802, 1.523785, 0, 0, 1, 1, 1,
0.438676, 2.371469, 0.03995653, 1, 0, 0, 1, 1,
0.4416661, 0.8619334, 1.259355, 1, 0, 0, 1, 1,
0.4435976, -2.185825, 2.802735, 1, 0, 0, 1, 1,
0.4445324, 0.6655701, 0.8051742, 1, 0, 0, 1, 1,
0.4458147, -2.045386, 4.267788, 1, 0, 0, 1, 1,
0.4459282, -0.0900798, 1.81386, 0, 0, 0, 1, 1,
0.4468569, 0.1106725, -0.1173519, 0, 0, 0, 1, 1,
0.4580953, -1.414449, 2.36796, 0, 0, 0, 1, 1,
0.4595195, 0.1187102, 1.245559, 0, 0, 0, 1, 1,
0.4621863, 1.514689, 0.3252897, 0, 0, 0, 1, 1,
0.4653732, -0.2842595, 2.577921, 0, 0, 0, 1, 1,
0.4666789, 0.8093648, 2.372567, 0, 0, 0, 1, 1,
0.471573, -0.03983068, 1.478066, 1, 1, 1, 1, 1,
0.4756847, 1.158823, -0.8552307, 1, 1, 1, 1, 1,
0.4779524, 0.2927102, 3.081376, 1, 1, 1, 1, 1,
0.4799208, -1.242608, 3.494496, 1, 1, 1, 1, 1,
0.4836479, 1.525905, -0.07438495, 1, 1, 1, 1, 1,
0.4876352, 0.9326165, 0.9686338, 1, 1, 1, 1, 1,
0.4889372, -0.09070711, 3.018927, 1, 1, 1, 1, 1,
0.4927504, -0.6160502, 2.484601, 1, 1, 1, 1, 1,
0.4947953, 0.1529144, 0.8166835, 1, 1, 1, 1, 1,
0.4976025, -0.3515372, 0.3967436, 1, 1, 1, 1, 1,
0.4985372, -0.7157969, 2.760189, 1, 1, 1, 1, 1,
0.5069345, 1.418108, -0.9064198, 1, 1, 1, 1, 1,
0.5072295, -0.7953409, 3.613319, 1, 1, 1, 1, 1,
0.508797, 0.49664, 0.6172515, 1, 1, 1, 1, 1,
0.512024, -0.1039639, 2.103671, 1, 1, 1, 1, 1,
0.5133911, -0.8024213, 2.309657, 0, 0, 1, 1, 1,
0.5146499, -0.1793618, 0.07401133, 1, 0, 0, 1, 1,
0.5146932, 0.7539847, 0.8376199, 1, 0, 0, 1, 1,
0.5165807, 0.1718698, 2.082098, 1, 0, 0, 1, 1,
0.5214874, -0.4859468, 4.171095, 1, 0, 0, 1, 1,
0.5215148, -2.112188, 4.12838, 1, 0, 0, 1, 1,
0.5256636, -2.076865, 2.996476, 0, 0, 0, 1, 1,
0.5271879, -0.6213362, 2.330605, 0, 0, 0, 1, 1,
0.5299246, -1.492448, 2.335345, 0, 0, 0, 1, 1,
0.5330839, 0.01623067, 0.4463364, 0, 0, 0, 1, 1,
0.5381019, -1.536422, 3.741232, 0, 0, 0, 1, 1,
0.5398968, 0.4964513, 0.3281199, 0, 0, 0, 1, 1,
0.5422627, 0.2477727, 2.073159, 0, 0, 0, 1, 1,
0.5457678, -0.9699121, 2.366478, 1, 1, 1, 1, 1,
0.5494744, 1.183799, -1.354442, 1, 1, 1, 1, 1,
0.5495644, 0.03180917, 2.183877, 1, 1, 1, 1, 1,
0.5530534, -1.002156, 0.4545611, 1, 1, 1, 1, 1,
0.5564234, -0.6779841, 4.198155, 1, 1, 1, 1, 1,
0.5571811, -1.306968, 2.984573, 1, 1, 1, 1, 1,
0.5591724, -1.251159, 1.267723, 1, 1, 1, 1, 1,
0.5663495, -0.6439989, 2.963785, 1, 1, 1, 1, 1,
0.5728215, -0.3545119, 1.902556, 1, 1, 1, 1, 1,
0.5769771, -1.439874, 4.560635, 1, 1, 1, 1, 1,
0.5788046, -0.7084899, 1.849124, 1, 1, 1, 1, 1,
0.5810509, -1.718493, 2.893713, 1, 1, 1, 1, 1,
0.5816731, -0.7454239, 2.169082, 1, 1, 1, 1, 1,
0.5849456, -0.5431284, 1.786931, 1, 1, 1, 1, 1,
0.5851596, 0.4543073, 1.902701, 1, 1, 1, 1, 1,
0.5876947, -0.4844105, 0.9186127, 0, 0, 1, 1, 1,
0.5927477, 0.6629956, 0.8638368, 1, 0, 0, 1, 1,
0.6016259, -1.553709, 1.501822, 1, 0, 0, 1, 1,
0.6138629, 0.7884571, 1.969183, 1, 0, 0, 1, 1,
0.6226856, 0.8488349, 1.167469, 1, 0, 0, 1, 1,
0.6227598, 0.5806634, 1.759427, 1, 0, 0, 1, 1,
0.6230154, 1.026166, 0.3858593, 0, 0, 0, 1, 1,
0.6321468, 1.469092, -0.5980043, 0, 0, 0, 1, 1,
0.6344457, 0.919823, 2.712305, 0, 0, 0, 1, 1,
0.6412624, -0.1405418, 0.798413, 0, 0, 0, 1, 1,
0.6461514, 0.2857905, 1.923487, 0, 0, 0, 1, 1,
0.6540835, 0.0667074, 1.589751, 0, 0, 0, 1, 1,
0.6554011, 0.1189923, -0.7785961, 0, 0, 0, 1, 1,
0.6562359, -0.2569471, 1.846836, 1, 1, 1, 1, 1,
0.6627433, 0.4764985, 1.449651, 1, 1, 1, 1, 1,
0.6632005, -1.103472, 0.2348445, 1, 1, 1, 1, 1,
0.6664159, 1.352376, 0.68423, 1, 1, 1, 1, 1,
0.6722412, 0.8261318, 0.02075655, 1, 1, 1, 1, 1,
0.6756181, -0.6777105, 3.175879, 1, 1, 1, 1, 1,
0.6757818, 0.6507837, 0.7505463, 1, 1, 1, 1, 1,
0.6804244, -0.4036409, 3.266292, 1, 1, 1, 1, 1,
0.6814331, 0.3111606, 2.061173, 1, 1, 1, 1, 1,
0.6815789, 1.108804, 0.3567612, 1, 1, 1, 1, 1,
0.6839949, -0.1250612, 2.921659, 1, 1, 1, 1, 1,
0.6904749, 1.025644, 1.136368, 1, 1, 1, 1, 1,
0.7029383, 0.3131755, 0.8563475, 1, 1, 1, 1, 1,
0.7072259, -0.5533212, 2.944211, 1, 1, 1, 1, 1,
0.7077947, -0.24697, 2.266196, 1, 1, 1, 1, 1,
0.7110031, 0.6740065, -0.6156702, 0, 0, 1, 1, 1,
0.7125894, -1.509526, 2.35105, 1, 0, 0, 1, 1,
0.7129862, -1.581195, 1.885319, 1, 0, 0, 1, 1,
0.7171063, -0.6573584, 3.141189, 1, 0, 0, 1, 1,
0.7186554, 1.166425, 1.01314, 1, 0, 0, 1, 1,
0.7227297, -0.465271, 3.876419, 1, 0, 0, 1, 1,
0.7256487, 0.03419556, 2.623294, 0, 0, 0, 1, 1,
0.726806, -1.682358, 3.858763, 0, 0, 0, 1, 1,
0.728232, -0.5830777, 1.900482, 0, 0, 0, 1, 1,
0.7320744, 1.229927, -0.1902117, 0, 0, 0, 1, 1,
0.7346383, -0.02831219, 1.003021, 0, 0, 0, 1, 1,
0.7357808, 1.739603, -1.324303, 0, 0, 0, 1, 1,
0.7449419, -0.6589466, 1.577059, 0, 0, 0, 1, 1,
0.7519655, -0.6318185, 3.016191, 1, 1, 1, 1, 1,
0.753815, 0.7864938, 1.77828, 1, 1, 1, 1, 1,
0.7583758, -0.3164278, 1.97895, 1, 1, 1, 1, 1,
0.775031, -0.3930035, 2.459562, 1, 1, 1, 1, 1,
0.7783475, 0.001622078, 2.250957, 1, 1, 1, 1, 1,
0.7832705, 0.300842, 0.932677, 1, 1, 1, 1, 1,
0.7872158, 0.6027136, 1.626343, 1, 1, 1, 1, 1,
0.7872617, -2.017844, 3.174992, 1, 1, 1, 1, 1,
0.7884781, -0.3992586, 3.263257, 1, 1, 1, 1, 1,
0.7931218, 0.8124821, 0.4834229, 1, 1, 1, 1, 1,
0.7951787, -1.612846, 1.189654, 1, 1, 1, 1, 1,
0.7968365, 0.7851158, 1.54576, 1, 1, 1, 1, 1,
0.7976755, 1.078337, 0.02825624, 1, 1, 1, 1, 1,
0.8026808, -1.274347, 3.333887, 1, 1, 1, 1, 1,
0.8188966, -0.2426126, 2.445055, 1, 1, 1, 1, 1,
0.8209639, -1.150944, 2.959947, 0, 0, 1, 1, 1,
0.8360648, -1.494306, 3.206174, 1, 0, 0, 1, 1,
0.8459657, -0.1217845, 1.660829, 1, 0, 0, 1, 1,
0.851467, 1.27075, -0.2322779, 1, 0, 0, 1, 1,
0.8533595, 0.8992217, 0.6435749, 1, 0, 0, 1, 1,
0.858565, -0.8811194, 2.711757, 1, 0, 0, 1, 1,
0.8608046, -0.9742777, 2.887045, 0, 0, 0, 1, 1,
0.8626076, 0.09671599, 0.4632712, 0, 0, 0, 1, 1,
0.8758802, -0.3105954, 2.778208, 0, 0, 0, 1, 1,
0.8784382, 0.5023419, 1.107162, 0, 0, 0, 1, 1,
0.8815948, -0.1204011, 2.367712, 0, 0, 0, 1, 1,
0.8851006, -0.2722736, 1.490622, 0, 0, 0, 1, 1,
0.8875804, 0.09962212, -0.670487, 0, 0, 0, 1, 1,
0.8875892, 0.1795385, 1.142965, 1, 1, 1, 1, 1,
0.8994164, -0.448355, 1.342602, 1, 1, 1, 1, 1,
0.9049652, -0.05602241, 2.222638, 1, 1, 1, 1, 1,
0.9095599, 0.3199006, 1.827374, 1, 1, 1, 1, 1,
0.9107347, 1.553208, 0.05237867, 1, 1, 1, 1, 1,
0.911108, -0.1726092, 1.255496, 1, 1, 1, 1, 1,
0.9221238, -1.144616, 2.656724, 1, 1, 1, 1, 1,
0.9270459, -1.525211, 4.881947, 1, 1, 1, 1, 1,
0.9285756, 0.4433285, 1.854324, 1, 1, 1, 1, 1,
0.9328536, -0.6968106, 2.606467, 1, 1, 1, 1, 1,
0.9335895, -1.937841, 3.379787, 1, 1, 1, 1, 1,
0.9387089, 0.4144941, 1.165332, 1, 1, 1, 1, 1,
0.9404719, 1.236341, -1.337647, 1, 1, 1, 1, 1,
0.9461482, 0.6176538, 0.805833, 1, 1, 1, 1, 1,
0.9483598, 0.06385925, 0.1093412, 1, 1, 1, 1, 1,
0.956027, 0.3489903, 0.8977715, 0, 0, 1, 1, 1,
0.9697593, 0.344711, 1.817666, 1, 0, 0, 1, 1,
0.9711922, -0.3574751, 0.9983802, 1, 0, 0, 1, 1,
0.973598, -1.683864, 2.772364, 1, 0, 0, 1, 1,
0.9786257, 1.17082, 0.487222, 1, 0, 0, 1, 1,
0.9886029, -0.3563821, 0.7071306, 1, 0, 0, 1, 1,
0.9957582, 1.120483, 2.213198, 0, 0, 0, 1, 1,
0.9967371, -0.4809919, -0.3673927, 0, 0, 0, 1, 1,
0.9977577, -0.01717272, 1.494177, 0, 0, 0, 1, 1,
1.001662, -1.279606, 2.446934, 0, 0, 0, 1, 1,
1.003774, -0.3887304, 0.5480926, 0, 0, 0, 1, 1,
1.006571, -0.07118387, 1.425254, 0, 0, 0, 1, 1,
1.015345, -0.2878837, 0.82243, 0, 0, 0, 1, 1,
1.021042, -2.541836, 3.296788, 1, 1, 1, 1, 1,
1.02499, 0.7336134, 0.7837348, 1, 1, 1, 1, 1,
1.031667, 0.8342795, 0.8431121, 1, 1, 1, 1, 1,
1.033036, 0.006069986, 2.936634, 1, 1, 1, 1, 1,
1.03321, 1.262368, -0.6733419, 1, 1, 1, 1, 1,
1.035949, -0.07018764, 0.4826139, 1, 1, 1, 1, 1,
1.0369, -1.307938, 1.483579, 1, 1, 1, 1, 1,
1.043064, -1.391893, 1.95281, 1, 1, 1, 1, 1,
1.046893, -0.0630789, 3.455213, 1, 1, 1, 1, 1,
1.054977, 1.582579, -0.1560536, 1, 1, 1, 1, 1,
1.060929, -2.761746, 2.797831, 1, 1, 1, 1, 1,
1.064118, 2.21881, 0.777063, 1, 1, 1, 1, 1,
1.068645, 0.909837, 1.273378, 1, 1, 1, 1, 1,
1.070794, -0.4075468, 0.7906799, 1, 1, 1, 1, 1,
1.073552, 0.3186371, 0.8805586, 1, 1, 1, 1, 1,
1.080313, 0.7374198, 2.358393, 0, 0, 1, 1, 1,
1.103338, 0.9437212, 0.3960285, 1, 0, 0, 1, 1,
1.10434, -1.247149, 1.866172, 1, 0, 0, 1, 1,
1.118337, -0.6302392, 1.928912, 1, 0, 0, 1, 1,
1.12408, 0.6688485, 2.007979, 1, 0, 0, 1, 1,
1.132911, 1.634415, 1.091658, 1, 0, 0, 1, 1,
1.133326, -0.8401353, 2.218612, 0, 0, 0, 1, 1,
1.135062, -1.232789, 2.845037, 0, 0, 0, 1, 1,
1.137571, -0.4919686, 3.065345, 0, 0, 0, 1, 1,
1.139372, -0.6974036, 3.122065, 0, 0, 0, 1, 1,
1.146231, -0.7615909, -0.1577698, 0, 0, 0, 1, 1,
1.15967, -0.5575709, 2.841411, 0, 0, 0, 1, 1,
1.161543, 0.2760838, 0.3935993, 0, 0, 0, 1, 1,
1.165962, -0.6945882, 3.709238, 1, 1, 1, 1, 1,
1.186784, 0.4141572, 0.4158017, 1, 1, 1, 1, 1,
1.188695, 1.033459, 0.722343, 1, 1, 1, 1, 1,
1.190753, -0.06259076, 1.154057, 1, 1, 1, 1, 1,
1.20599, -0.9169351, 0.8961303, 1, 1, 1, 1, 1,
1.212204, 1.458779, 1.31791, 1, 1, 1, 1, 1,
1.212943, -0.3536474, 4.066551, 1, 1, 1, 1, 1,
1.223762, 1.104456, 1.810369, 1, 1, 1, 1, 1,
1.226787, 0.8640664, -0.4703338, 1, 1, 1, 1, 1,
1.230279, 0.6069915, 2.134111, 1, 1, 1, 1, 1,
1.231335, 0.3127704, 0.1205441, 1, 1, 1, 1, 1,
1.242482, -1.399582, 3.722772, 1, 1, 1, 1, 1,
1.247058, 0.2457543, 2.033939, 1, 1, 1, 1, 1,
1.248103, 0.1431796, 0.4652875, 1, 1, 1, 1, 1,
1.254081, -0.3890925, 1.597315, 1, 1, 1, 1, 1,
1.269152, -0.7972649, 0.3505535, 0, 0, 1, 1, 1,
1.280173, 0.5865355, -0.1392665, 1, 0, 0, 1, 1,
1.286141, -1.240534, 3.449034, 1, 0, 0, 1, 1,
1.29968, 0.7500495, 1.332059, 1, 0, 0, 1, 1,
1.303295, -0.629719, 1.321826, 1, 0, 0, 1, 1,
1.305617, 0.9352517, 0.491699, 1, 0, 0, 1, 1,
1.315072, -1.343454, 2.063989, 0, 0, 0, 1, 1,
1.316243, 1.010038, 1.564148, 0, 0, 0, 1, 1,
1.319824, 0.4006821, 0.6067977, 0, 0, 0, 1, 1,
1.321949, -0.1997955, -0.4197115, 0, 0, 0, 1, 1,
1.336149, -0.2145709, 1.689992, 0, 0, 0, 1, 1,
1.344471, 1.328263, 2.609737, 0, 0, 0, 1, 1,
1.349538, -0.3986785, 2.549409, 0, 0, 0, 1, 1,
1.357076, 0.9452204, 1.451508, 1, 1, 1, 1, 1,
1.360352, -1.981526, 1.172467, 1, 1, 1, 1, 1,
1.363639, -0.6181434, 2.249075, 1, 1, 1, 1, 1,
1.364202, -1.056856, 4.390497, 1, 1, 1, 1, 1,
1.366857, -0.3435521, 4.649424, 1, 1, 1, 1, 1,
1.372718, -0.9756848, 3.395597, 1, 1, 1, 1, 1,
1.382697, -0.7979428, 0.9461059, 1, 1, 1, 1, 1,
1.383811, 1.21704, -0.5523805, 1, 1, 1, 1, 1,
1.390657, 0.9438818, 2.401057, 1, 1, 1, 1, 1,
1.401736, -0.7975962, 2.96511, 1, 1, 1, 1, 1,
1.408505, -1.317269, 2.180902, 1, 1, 1, 1, 1,
1.416137, 1.472693, 1.799877, 1, 1, 1, 1, 1,
1.421994, 0.488261, 0.5513758, 1, 1, 1, 1, 1,
1.428302, -0.2941026, 1.97591, 1, 1, 1, 1, 1,
1.429896, 0.1141868, 1.786761, 1, 1, 1, 1, 1,
1.443515, 1.378544, 1.671449, 0, 0, 1, 1, 1,
1.448428, -0.6973939, 1.061535, 1, 0, 0, 1, 1,
1.449079, -1.334491, 3.263749, 1, 0, 0, 1, 1,
1.462464, 1.228056, 0.9929192, 1, 0, 0, 1, 1,
1.478367, 1.729878, 0.8159516, 1, 0, 0, 1, 1,
1.478972, 0.8949047, 0.2614281, 1, 0, 0, 1, 1,
1.481015, 1.818181, 0.4839041, 0, 0, 0, 1, 1,
1.48218, -1.083905, 2.703461, 0, 0, 0, 1, 1,
1.486442, -0.4117111, 1.937569, 0, 0, 0, 1, 1,
1.489499, 0.5788552, 0.6090526, 0, 0, 0, 1, 1,
1.502783, -0.2710443, 1.718976, 0, 0, 0, 1, 1,
1.519633, 0.03691756, 0.9638801, 0, 0, 0, 1, 1,
1.537336, 1.041429, 0.8004596, 0, 0, 0, 1, 1,
1.552769, -3.68481, 1.47144, 1, 1, 1, 1, 1,
1.56288, 0.1241945, -0.02311007, 1, 1, 1, 1, 1,
1.577809, -0.7298601, 2.81729, 1, 1, 1, 1, 1,
1.582348, -1.070295, 0.8338965, 1, 1, 1, 1, 1,
1.595853, 0.5366063, 0.406938, 1, 1, 1, 1, 1,
1.597602, 0.2822133, 0.8699933, 1, 1, 1, 1, 1,
1.604399, 1.846769, -0.4811627, 1, 1, 1, 1, 1,
1.615998, 0.1032917, 2.889514, 1, 1, 1, 1, 1,
1.618883, 1.575501, 0.5972743, 1, 1, 1, 1, 1,
1.619677, 0.2069386, 1.494608, 1, 1, 1, 1, 1,
1.656518, 0.07546635, 1.364795, 1, 1, 1, 1, 1,
1.67462, 0.4993254, 1.855419, 1, 1, 1, 1, 1,
1.68501, -0.5041253, 0.4023493, 1, 1, 1, 1, 1,
1.687235, 0.4658355, 1.519775, 1, 1, 1, 1, 1,
1.687249, -3.347467, 0.9072617, 1, 1, 1, 1, 1,
1.699405, -1.497244, -0.5978874, 0, 0, 1, 1, 1,
1.705698, 2.243718, 1.195605, 1, 0, 0, 1, 1,
1.734603, 0.4082024, 0.6652898, 1, 0, 0, 1, 1,
1.743782, -1.50825, 2.755282, 1, 0, 0, 1, 1,
1.746796, -1.270774, 3.286168, 1, 0, 0, 1, 1,
1.762479, 0.4348422, 0.9155014, 1, 0, 0, 1, 1,
1.766202, -0.7050334, 3.569057, 0, 0, 0, 1, 1,
1.802526, -0.4242352, 1.267117, 0, 0, 0, 1, 1,
1.815165, 0.565161, 1.956586, 0, 0, 0, 1, 1,
1.815388, -1.116277, 3.406646, 0, 0, 0, 1, 1,
1.838523, 0.9538935, 1.379103, 0, 0, 0, 1, 1,
1.848373, -0.7811654, 0.4323981, 0, 0, 0, 1, 1,
1.850876, 0.3560802, -1.414999, 0, 0, 0, 1, 1,
1.855166, -0.8208853, 2.710586, 1, 1, 1, 1, 1,
1.859484, -0.5481539, 1.120706, 1, 1, 1, 1, 1,
1.876906, -0.1503444, 0.5305138, 1, 1, 1, 1, 1,
1.88709, 0.218936, 1.546857, 1, 1, 1, 1, 1,
1.887943, 1.556008, 1.480159, 1, 1, 1, 1, 1,
1.901821, 0.02117142, 2.340928, 1, 1, 1, 1, 1,
1.91954, -0.1736924, 2.560127, 1, 1, 1, 1, 1,
1.923775, 1.072861, 0.819666, 1, 1, 1, 1, 1,
1.927811, -0.6962646, 1.224704, 1, 1, 1, 1, 1,
1.932901, 1.367344, -1.066312, 1, 1, 1, 1, 1,
1.934163, 0.5187321, 1.041615, 1, 1, 1, 1, 1,
1.945612, -0.3896612, 0.2857664, 1, 1, 1, 1, 1,
1.963118, -0.4737519, 0.8658273, 1, 1, 1, 1, 1,
1.983558, -1.770547, 1.434014, 1, 1, 1, 1, 1,
1.995033, -0.652454, 1.828137, 1, 1, 1, 1, 1,
2.014999, -0.8197807, 2.942913, 0, 0, 1, 1, 1,
2.085408, 0.1310653, 2.840742, 1, 0, 0, 1, 1,
2.097588, 0.4727491, 4.729091, 1, 0, 0, 1, 1,
2.105358, 1.45632, -0.1930129, 1, 0, 0, 1, 1,
2.108757, 0.3940803, 1.403668, 1, 0, 0, 1, 1,
2.138841, -0.8641378, 0.9251381, 1, 0, 0, 1, 1,
2.173362, -0.5996563, 1.692735, 0, 0, 0, 1, 1,
2.242709, 0.1262808, 2.529837, 0, 0, 0, 1, 1,
2.256552, -0.1570961, 0.8015952, 0, 0, 0, 1, 1,
2.27953, 1.383219, 0.1322936, 0, 0, 0, 1, 1,
2.285588, 2.567467, -1.011861, 0, 0, 0, 1, 1,
2.379526, -1.168014, 0.4655453, 0, 0, 0, 1, 1,
2.400424, -0.3387928, 1.870954, 0, 0, 0, 1, 1,
2.403157, -1.992636, 0.986381, 1, 1, 1, 1, 1,
2.416597, 1.229418, 0.6248203, 1, 1, 1, 1, 1,
2.423388, -0.5449387, 1.076987, 1, 1, 1, 1, 1,
2.465951, -0.5056201, 2.172676, 1, 1, 1, 1, 1,
2.818541, -0.8431517, 1.194603, 1, 1, 1, 1, 1,
2.873139, -0.5170567, 1.499502, 1, 1, 1, 1, 1,
3.445887, 0.7109731, 1.440186, 1, 1, 1, 1, 1
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
var radius = 9.283781;
var distance = 32.60889;
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
mvMatrix.translate( -0.2605036, 0.4948038, -0.05367851 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.60889);
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
