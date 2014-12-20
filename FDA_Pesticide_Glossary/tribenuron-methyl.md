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
-3.650824, 1.328382, -0.4543954, 1, 0, 0, 1,
-2.855828, 1.230652, -1.80214, 1, 0.007843138, 0, 1,
-2.823528, -0.6539498, -1.495839, 1, 0.01176471, 0, 1,
-2.800194, 0.05986376, -0.5497073, 1, 0.01960784, 0, 1,
-2.623951, -0.4364343, -0.2634711, 1, 0.02352941, 0, 1,
-2.546353, 0.2891704, -2.568066, 1, 0.03137255, 0, 1,
-2.459652, -2.318467, -1.80765, 1, 0.03529412, 0, 1,
-2.450701, -3.259799, -1.770522, 1, 0.04313726, 0, 1,
-2.350163, -0.5595561, -1.782309, 1, 0.04705882, 0, 1,
-2.346375, 0.397909, 0.007751612, 1, 0.05490196, 0, 1,
-2.285262, -2.121701, -0.9820802, 1, 0.05882353, 0, 1,
-2.278571, 1.131518, -0.5726123, 1, 0.06666667, 0, 1,
-2.265252, 0.4150296, 0.1287531, 1, 0.07058824, 0, 1,
-2.222627, 0.4193122, -0.7462101, 1, 0.07843138, 0, 1,
-2.20768, 0.2242682, -1.775889, 1, 0.08235294, 0, 1,
-2.150308, 0.1845921, -2.857741, 1, 0.09019608, 0, 1,
-2.129589, 1.823397, -0.686384, 1, 0.09411765, 0, 1,
-2.105192, -1.56385, 0.4929575, 1, 0.1019608, 0, 1,
-2.093776, -0.04024101, -2.316091, 1, 0.1098039, 0, 1,
-2.086626, -1.25699, -2.621438, 1, 0.1137255, 0, 1,
-2.077984, -0.6168479, -1.579477, 1, 0.1215686, 0, 1,
-2.076705, 1.810708, -0.776781, 1, 0.1254902, 0, 1,
-2.052085, 2.245342, -0.1847823, 1, 0.1333333, 0, 1,
-2.043, -0.7858484, -2.55138, 1, 0.1372549, 0, 1,
-1.991416, -0.4908352, -2.510464, 1, 0.145098, 0, 1,
-1.987753, 0.8636286, -0.1606948, 1, 0.1490196, 0, 1,
-1.981124, 0.705166, 0.06155316, 1, 0.1568628, 0, 1,
-1.975061, -0.2809465, -1.465214, 1, 0.1607843, 0, 1,
-1.958574, 1.499122, 0.4231503, 1, 0.1686275, 0, 1,
-1.919853, 1.309664, -1.868008, 1, 0.172549, 0, 1,
-1.885796, -0.3656706, -0.9226754, 1, 0.1803922, 0, 1,
-1.879858, 1.141593, 0.06972271, 1, 0.1843137, 0, 1,
-1.860983, 0.6237853, -0.3610253, 1, 0.1921569, 0, 1,
-1.850352, -0.1838531, -0.6937307, 1, 0.1960784, 0, 1,
-1.848992, -0.3945248, -0.5158609, 1, 0.2039216, 0, 1,
-1.825989, -0.5764196, -0.7444521, 1, 0.2117647, 0, 1,
-1.800578, 1.637392, -3.29398, 1, 0.2156863, 0, 1,
-1.768189, 1.095793, -1.699888, 1, 0.2235294, 0, 1,
-1.766564, -0.16881, -1.932774, 1, 0.227451, 0, 1,
-1.765021, -0.7039407, -0.6689429, 1, 0.2352941, 0, 1,
-1.761027, 2.734705, -1.834914, 1, 0.2392157, 0, 1,
-1.73733, 0.07693882, -4.203376, 1, 0.2470588, 0, 1,
-1.7279, -0.335984, -1.815722, 1, 0.2509804, 0, 1,
-1.725767, -1.57926, -3.195287, 1, 0.2588235, 0, 1,
-1.7181, 0.2534525, -1.788139, 1, 0.2627451, 0, 1,
-1.705106, -0.4508285, -0.8346509, 1, 0.2705882, 0, 1,
-1.692196, 1.294943, -1.180205, 1, 0.2745098, 0, 1,
-1.680328, 1.123211, -0.6810831, 1, 0.282353, 0, 1,
-1.675452, 1.140512, -0.2115632, 1, 0.2862745, 0, 1,
-1.662009, 0.2791558, -2.288605, 1, 0.2941177, 0, 1,
-1.651222, 0.3334533, -1.074549, 1, 0.3019608, 0, 1,
-1.618531, 0.3819211, -0.5128157, 1, 0.3058824, 0, 1,
-1.615335, -0.7886612, -0.5893168, 1, 0.3137255, 0, 1,
-1.613288, 0.447995, -2.897317, 1, 0.3176471, 0, 1,
-1.610237, -1.103329, -1.67254, 1, 0.3254902, 0, 1,
-1.60847, -1.190074, -2.368679, 1, 0.3294118, 0, 1,
-1.605928, -0.6169853, -1.568651, 1, 0.3372549, 0, 1,
-1.584236, 0.343413, -2.227511, 1, 0.3411765, 0, 1,
-1.578444, 1.259905, -1.307301, 1, 0.3490196, 0, 1,
-1.572049, -0.1093746, -3.045826, 1, 0.3529412, 0, 1,
-1.563787, 1.705369, -0.503681, 1, 0.3607843, 0, 1,
-1.549445, -0.2354458, -2.064399, 1, 0.3647059, 0, 1,
-1.54833, 0.667353, -0.4348801, 1, 0.372549, 0, 1,
-1.547119, -0.1981757, -1.515343, 1, 0.3764706, 0, 1,
-1.542286, -0.5296685, -1.587118, 1, 0.3843137, 0, 1,
-1.535111, -1.238056, -1.916052, 1, 0.3882353, 0, 1,
-1.51362, 0.2339841, -2.054523, 1, 0.3960784, 0, 1,
-1.509193, 0.4163999, -1.024809, 1, 0.4039216, 0, 1,
-1.491944, -0.6360083, -0.767978, 1, 0.4078431, 0, 1,
-1.482519, 0.314266, -1.67668, 1, 0.4156863, 0, 1,
-1.460732, 2.429089, -1.805519, 1, 0.4196078, 0, 1,
-1.431532, 1.200378, -1.436641, 1, 0.427451, 0, 1,
-1.427992, 1.73956, -1.250995, 1, 0.4313726, 0, 1,
-1.424378, -1.101039, -3.262429, 1, 0.4392157, 0, 1,
-1.41625, -0.06790811, -1.518018, 1, 0.4431373, 0, 1,
-1.415868, 0.04124529, -1.745871, 1, 0.4509804, 0, 1,
-1.412434, 1.461228, -0.4863494, 1, 0.454902, 0, 1,
-1.401492, 1.81607, -1.765648, 1, 0.4627451, 0, 1,
-1.39024, 0.0954252, -1.975771, 1, 0.4666667, 0, 1,
-1.378528, -1.037822, -1.167263, 1, 0.4745098, 0, 1,
-1.373422, -0.9498623, -3.050518, 1, 0.4784314, 0, 1,
-1.369855, 0.6795042, -1.597057, 1, 0.4862745, 0, 1,
-1.35634, -1.386141, -2.95236, 1, 0.4901961, 0, 1,
-1.355458, -0.320671, -0.4549187, 1, 0.4980392, 0, 1,
-1.338079, -0.04385504, -2.807961, 1, 0.5058824, 0, 1,
-1.337037, 0.7141468, -0.5594859, 1, 0.509804, 0, 1,
-1.324641, -0.9444159, -2.658745, 1, 0.5176471, 0, 1,
-1.321577, -0.6022601, -1.053482, 1, 0.5215687, 0, 1,
-1.321414, -0.5984012, -0.4859934, 1, 0.5294118, 0, 1,
-1.314974, 0.4966891, -0.2719203, 1, 0.5333334, 0, 1,
-1.307629, 0.8199789, -2.189497, 1, 0.5411765, 0, 1,
-1.306213, -1.525336, -2.769435, 1, 0.5450981, 0, 1,
-1.306211, 0.1108508, -0.6726512, 1, 0.5529412, 0, 1,
-1.300681, -2.046492, -2.058124, 1, 0.5568628, 0, 1,
-1.293867, 0.3299269, -1.236421, 1, 0.5647059, 0, 1,
-1.291777, 0.9045339, -1.493806, 1, 0.5686275, 0, 1,
-1.287396, 0.6166714, -1.778349, 1, 0.5764706, 0, 1,
-1.279985, 0.7970433, 0.05924364, 1, 0.5803922, 0, 1,
-1.278545, -0.1232242, -2.35621, 1, 0.5882353, 0, 1,
-1.258505, -0.9572946, -2.813195, 1, 0.5921569, 0, 1,
-1.254114, -0.9697235, -2.81769, 1, 0.6, 0, 1,
-1.248446, -0.6563588, -1.643732, 1, 0.6078432, 0, 1,
-1.247446, -0.09372221, -0.543052, 1, 0.6117647, 0, 1,
-1.240782, -0.8776339, -1.986451, 1, 0.6196079, 0, 1,
-1.239678, -1.713532, -2.089967, 1, 0.6235294, 0, 1,
-1.235612, 2.438654, -0.6033196, 1, 0.6313726, 0, 1,
-1.232383, -0.7325392, -2.181212, 1, 0.6352941, 0, 1,
-1.227376, -0.172444, -1.745776, 1, 0.6431373, 0, 1,
-1.223615, 0.5857671, -1.005558, 1, 0.6470588, 0, 1,
-1.21854, 1.162874, -1.219849, 1, 0.654902, 0, 1,
-1.20613, -1.045377, -2.276984, 1, 0.6588235, 0, 1,
-1.202157, -0.8144585, -3.474831, 1, 0.6666667, 0, 1,
-1.201913, 0.5380951, -0.7668979, 1, 0.6705883, 0, 1,
-1.201467, 0.5836883, 0.7840928, 1, 0.6784314, 0, 1,
-1.198481, -1.044685, -1.389935, 1, 0.682353, 0, 1,
-1.193671, 0.4689901, -0.8531263, 1, 0.6901961, 0, 1,
-1.182644, -1.217359, -1.589102, 1, 0.6941177, 0, 1,
-1.179856, -1.236127, -2.996811, 1, 0.7019608, 0, 1,
-1.178631, 0.8464839, -0.5084826, 1, 0.7098039, 0, 1,
-1.176685, 0.597509, -2.371316, 1, 0.7137255, 0, 1,
-1.17197, -2.000147, -2.739261, 1, 0.7215686, 0, 1,
-1.167748, 0.8140292, -1.659471, 1, 0.7254902, 0, 1,
-1.144659, -1.760217, -3.310776, 1, 0.7333333, 0, 1,
-1.13801, 0.4047008, -1.37007, 1, 0.7372549, 0, 1,
-1.136527, -0.2007457, -1.945074, 1, 0.7450981, 0, 1,
-1.136436, 0.8594821, 0.08956033, 1, 0.7490196, 0, 1,
-1.134033, 0.6511528, -0.1518127, 1, 0.7568628, 0, 1,
-1.130773, -0.3955193, -1.558658, 1, 0.7607843, 0, 1,
-1.121702, -0.6213598, -0.6579361, 1, 0.7686275, 0, 1,
-1.115795, -0.6188644, -1.982115, 1, 0.772549, 0, 1,
-1.115731, 0.6504247, -1.699483, 1, 0.7803922, 0, 1,
-1.098757, 0.3668053, -2.017307, 1, 0.7843137, 0, 1,
-1.077064, -0.7545905, -3.090438, 1, 0.7921569, 0, 1,
-1.075506, 0.1857558, 0.4029344, 1, 0.7960784, 0, 1,
-1.063689, 1.115708, -1.452686, 1, 0.8039216, 0, 1,
-1.057951, -0.4374082, -1.94723, 1, 0.8117647, 0, 1,
-1.052159, -0.5270505, -1.881204, 1, 0.8156863, 0, 1,
-1.051146, -0.6545485, -1.644265, 1, 0.8235294, 0, 1,
-1.050095, 0.4775894, -0.7939028, 1, 0.827451, 0, 1,
-1.049151, -1.95554, -2.319719, 1, 0.8352941, 0, 1,
-1.048333, -0.8029336, -3.089671, 1, 0.8392157, 0, 1,
-1.046342, 0.4382384, -1.031555, 1, 0.8470588, 0, 1,
-1.04601, 0.7790853, -1.923571, 1, 0.8509804, 0, 1,
-1.045712, -0.3404001, -1.509226, 1, 0.8588235, 0, 1,
-1.039003, -0.1287258, -1.229341, 1, 0.8627451, 0, 1,
-1.031765, 0.2839476, -2.09025, 1, 0.8705882, 0, 1,
-1.028991, 1.990485, -0.6659317, 1, 0.8745098, 0, 1,
-1.027917, 0.8150027, -0.2099597, 1, 0.8823529, 0, 1,
-1.01709, -1.243826, -2.596166, 1, 0.8862745, 0, 1,
-1.014659, 0.1610267, -1.675889, 1, 0.8941177, 0, 1,
-1.010505, -0.7286589, -1.985636, 1, 0.8980392, 0, 1,
-1.005181, 0.9339345, 0.3166033, 1, 0.9058824, 0, 1,
-1.002681, -0.2129007, -1.220376, 1, 0.9137255, 0, 1,
-0.9986953, -0.8361966, -1.869712, 1, 0.9176471, 0, 1,
-0.994915, 0.1763667, -1.34265, 1, 0.9254902, 0, 1,
-0.9893983, -1.101218, -1.729643, 1, 0.9294118, 0, 1,
-0.9741673, -0.2963487, -3.193097, 1, 0.9372549, 0, 1,
-0.9736686, -0.2841487, -2.263389, 1, 0.9411765, 0, 1,
-0.9715441, 2.43902, 0.6911417, 1, 0.9490196, 0, 1,
-0.9702492, 0.7782322, 0.891293, 1, 0.9529412, 0, 1,
-0.956119, -0.0610202, -1.72031, 1, 0.9607843, 0, 1,
-0.9513834, 0.9261659, 0.0236999, 1, 0.9647059, 0, 1,
-0.9442995, 0.5345522, -2.463628, 1, 0.972549, 0, 1,
-0.9431976, -0.788752, -3.617847, 1, 0.9764706, 0, 1,
-0.940652, -0.0007805653, -1.894386, 1, 0.9843137, 0, 1,
-0.9302731, 0.04440787, -2.255956, 1, 0.9882353, 0, 1,
-0.9251845, -0.5561336, -2.222753, 1, 0.9960784, 0, 1,
-0.923876, -1.061441, -1.928568, 0.9960784, 1, 0, 1,
-0.9167904, 1.155035, -1.333666, 0.9921569, 1, 0, 1,
-0.9141693, 0.06375851, -0.8490117, 0.9843137, 1, 0, 1,
-0.9129175, -0.3291375, -1.458491, 0.9803922, 1, 0, 1,
-0.9082, 0.9633603, -1.876648, 0.972549, 1, 0, 1,
-0.9058135, -1.236411, -3.95787, 0.9686275, 1, 0, 1,
-0.9049438, 0.5783375, -3.361353, 0.9607843, 1, 0, 1,
-0.8985313, -0.6414213, -1.210346, 0.9568627, 1, 0, 1,
-0.8973849, -0.1653185, -2.459723, 0.9490196, 1, 0, 1,
-0.8898038, 0.2343489, -0.394974, 0.945098, 1, 0, 1,
-0.879979, 0.8834472, 1.346463, 0.9372549, 1, 0, 1,
-0.8763586, -0.5427925, -1.764679, 0.9333333, 1, 0, 1,
-0.8752049, 0.8862703, -0.7124801, 0.9254902, 1, 0, 1,
-0.8709065, 0.3005274, -2.393756, 0.9215686, 1, 0, 1,
-0.8652826, 0.2489162, -0.4084734, 0.9137255, 1, 0, 1,
-0.8649856, -0.005451968, 1.14415, 0.9098039, 1, 0, 1,
-0.8648976, 0.2887887, -2.207071, 0.9019608, 1, 0, 1,
-0.8646461, 0.4547607, -0.9194384, 0.8941177, 1, 0, 1,
-0.8629604, -0.8343413, -1.635728, 0.8901961, 1, 0, 1,
-0.8600115, 1.0142, -1.469188, 0.8823529, 1, 0, 1,
-0.8544248, 0.3202848, -1.545586, 0.8784314, 1, 0, 1,
-0.8541768, 0.4962997, 0.6116849, 0.8705882, 1, 0, 1,
-0.8483891, -0.7457721, -2.702893, 0.8666667, 1, 0, 1,
-0.8452895, 0.04468949, -2.16142, 0.8588235, 1, 0, 1,
-0.8381249, -1.400235, -3.239074, 0.854902, 1, 0, 1,
-0.8255529, 1.784024, -1.31642, 0.8470588, 1, 0, 1,
-0.8253838, 1.345881, 0.5538585, 0.8431373, 1, 0, 1,
-0.8221056, 0.1570469, -0.9457186, 0.8352941, 1, 0, 1,
-0.8203582, 1.512542, 0.5655174, 0.8313726, 1, 0, 1,
-0.8157565, 0.4158147, -1.149102, 0.8235294, 1, 0, 1,
-0.8091494, -0.2763109, -1.714451, 0.8196079, 1, 0, 1,
-0.804024, -0.03625686, -2.423085, 0.8117647, 1, 0, 1,
-0.7963105, -0.2824644, -2.396739, 0.8078431, 1, 0, 1,
-0.7799247, -2.077147, -1.959838, 0.8, 1, 0, 1,
-0.7782778, 0.3205246, -2.272929, 0.7921569, 1, 0, 1,
-0.7774219, -0.1929962, -1.53051, 0.7882353, 1, 0, 1,
-0.7747126, 1.492225, 0.05473716, 0.7803922, 1, 0, 1,
-0.769946, 0.9334487, -0.4322771, 0.7764706, 1, 0, 1,
-0.7598155, -0.5559194, -1.033234, 0.7686275, 1, 0, 1,
-0.7555515, -0.06497163, -2.123261, 0.7647059, 1, 0, 1,
-0.7553244, -0.2192735, -1.952317, 0.7568628, 1, 0, 1,
-0.7534157, -1.427087, -2.303676, 0.7529412, 1, 0, 1,
-0.7506783, 0.3754981, -1.813467, 0.7450981, 1, 0, 1,
-0.7496893, -0.6959795, -2.23822, 0.7411765, 1, 0, 1,
-0.7476768, 0.5139554, -2.095268, 0.7333333, 1, 0, 1,
-0.7469723, 0.1432037, -2.952997, 0.7294118, 1, 0, 1,
-0.7453834, 0.2328985, 1.209369, 0.7215686, 1, 0, 1,
-0.7395121, -0.02050812, -0.6358944, 0.7176471, 1, 0, 1,
-0.7366771, -1.013009, -3.357668, 0.7098039, 1, 0, 1,
-0.7361764, -0.05854901, 1.157182, 0.7058824, 1, 0, 1,
-0.7345931, 0.239822, 0.2245329, 0.6980392, 1, 0, 1,
-0.7222356, -1.108495, -1.641598, 0.6901961, 1, 0, 1,
-0.7107785, -1.150024, -2.252938, 0.6862745, 1, 0, 1,
-0.7101761, -0.5144685, -2.043958, 0.6784314, 1, 0, 1,
-0.7064576, 0.1430926, -1.043598, 0.6745098, 1, 0, 1,
-0.7063281, 0.1447328, -0.8300405, 0.6666667, 1, 0, 1,
-0.7005714, -0.1828758, -1.537193, 0.6627451, 1, 0, 1,
-0.7005146, -3.020941, -3.402927, 0.654902, 1, 0, 1,
-0.6984466, -0.809023, -1.336489, 0.6509804, 1, 0, 1,
-0.6967101, -1.057718, -4.113151, 0.6431373, 1, 0, 1,
-0.6946326, 0.5559004, -0.8819104, 0.6392157, 1, 0, 1,
-0.6943393, 0.8777271, -1.405095, 0.6313726, 1, 0, 1,
-0.6941717, 0.514551, -0.7108758, 0.627451, 1, 0, 1,
-0.693268, 0.6623322, -1.178704, 0.6196079, 1, 0, 1,
-0.689088, -0.6697083, -2.68902, 0.6156863, 1, 0, 1,
-0.6857379, -1.312665, -3.124553, 0.6078432, 1, 0, 1,
-0.6827977, -1.363525, -3.343871, 0.6039216, 1, 0, 1,
-0.6757729, 2.293654, 0.602307, 0.5960785, 1, 0, 1,
-0.6745633, -0.05306323, -1.383559, 0.5882353, 1, 0, 1,
-0.6739216, -0.7694057, -2.360682, 0.5843138, 1, 0, 1,
-0.6704817, 1.033552, -0.5924463, 0.5764706, 1, 0, 1,
-0.658641, 1.862562, -0.628289, 0.572549, 1, 0, 1,
-0.6546652, 1.113923, -0.5157921, 0.5647059, 1, 0, 1,
-0.6453604, 0.455061, -0.4692449, 0.5607843, 1, 0, 1,
-0.6400929, 1.555432, -0.01272083, 0.5529412, 1, 0, 1,
-0.6370789, 0.2915033, -1.429204, 0.5490196, 1, 0, 1,
-0.6334952, -1.017712, -2.981686, 0.5411765, 1, 0, 1,
-0.6325223, 1.684496, -0.8111481, 0.5372549, 1, 0, 1,
-0.6280506, -0.2260825, -1.629533, 0.5294118, 1, 0, 1,
-0.6279665, -0.7121807, -4.430203, 0.5254902, 1, 0, 1,
-0.6269709, 0.4328434, -2.110396, 0.5176471, 1, 0, 1,
-0.6253643, 0.9047408, -0.585259, 0.5137255, 1, 0, 1,
-0.6243395, -0.4486982, -0.8972486, 0.5058824, 1, 0, 1,
-0.623466, 1.244668, -1.596688, 0.5019608, 1, 0, 1,
-0.6210762, -0.2618309, -2.99305, 0.4941176, 1, 0, 1,
-0.6182527, -0.3524988, -2.736749, 0.4862745, 1, 0, 1,
-0.6174957, 0.07791591, -1.671182, 0.4823529, 1, 0, 1,
-0.617282, 0.4835236, -0.8401138, 0.4745098, 1, 0, 1,
-0.6167686, 0.6869032, -0.7006462, 0.4705882, 1, 0, 1,
-0.6111359, -1.674568, -3.044733, 0.4627451, 1, 0, 1,
-0.607006, 0.526131, -0.7470913, 0.4588235, 1, 0, 1,
-0.6029013, -0.817342, -4.259301, 0.4509804, 1, 0, 1,
-0.5908858, 1.166847, 0.4544183, 0.4470588, 1, 0, 1,
-0.5907797, -0.6104915, -3.507617, 0.4392157, 1, 0, 1,
-0.5878919, 0.7827062, 0.2111479, 0.4352941, 1, 0, 1,
-0.5866414, 0.8066668, -0.2442573, 0.427451, 1, 0, 1,
-0.5865526, 0.007637803, -0.3228765, 0.4235294, 1, 0, 1,
-0.5850444, 1.240749, -1.445712, 0.4156863, 1, 0, 1,
-0.5822247, -0.1476198, -3.354598, 0.4117647, 1, 0, 1,
-0.5789911, -1.654888, -3.034164, 0.4039216, 1, 0, 1,
-0.5744029, -1.305181, -2.710458, 0.3960784, 1, 0, 1,
-0.5694515, -1.41581, -3.752058, 0.3921569, 1, 0, 1,
-0.5690261, -0.8154406, -2.367244, 0.3843137, 1, 0, 1,
-0.5676762, -0.268599, -0.5874565, 0.3803922, 1, 0, 1,
-0.5667565, 0.176333, -1.613586, 0.372549, 1, 0, 1,
-0.5552556, 0.5126244, -0.6937853, 0.3686275, 1, 0, 1,
-0.5526657, 0.2385136, 0.5120417, 0.3607843, 1, 0, 1,
-0.5525183, -0.1849733, -1.939082, 0.3568628, 1, 0, 1,
-0.5523072, 0.06658155, -2.184129, 0.3490196, 1, 0, 1,
-0.5441381, -0.7996538, -2.993632, 0.345098, 1, 0, 1,
-0.5421807, -1.430455, -0.5990713, 0.3372549, 1, 0, 1,
-0.5420074, -0.4196878, -0.4995097, 0.3333333, 1, 0, 1,
-0.5391536, 0.1291278, -2.736571, 0.3254902, 1, 0, 1,
-0.5294535, 0.03027834, -2.232196, 0.3215686, 1, 0, 1,
-0.5258476, 1.076316, -1.166331, 0.3137255, 1, 0, 1,
-0.5250357, -1.997881, -4.256621, 0.3098039, 1, 0, 1,
-0.5141925, -0.2319735, -1.749544, 0.3019608, 1, 0, 1,
-0.5128833, -0.02766807, -3.297226, 0.2941177, 1, 0, 1,
-0.5122326, -0.593752, -2.328847, 0.2901961, 1, 0, 1,
-0.5095293, -1.362762, -4.030393, 0.282353, 1, 0, 1,
-0.5087163, 0.8541189, -1.996932, 0.2784314, 1, 0, 1,
-0.5085898, -0.2158166, -3.459193, 0.2705882, 1, 0, 1,
-0.5072807, -1.76639, -2.869939, 0.2666667, 1, 0, 1,
-0.5023686, -0.2815252, -1.962521, 0.2588235, 1, 0, 1,
-0.5003428, 1.522498, -1.180932, 0.254902, 1, 0, 1,
-0.4997002, 0.8406753, -0.9846048, 0.2470588, 1, 0, 1,
-0.4982576, -1.731877, -2.67831, 0.2431373, 1, 0, 1,
-0.4842223, -0.3503367, -1.45111, 0.2352941, 1, 0, 1,
-0.4821444, 1.662405, -1.538818, 0.2313726, 1, 0, 1,
-0.4764899, -0.2301902, -2.807007, 0.2235294, 1, 0, 1,
-0.4755102, 0.8285193, -2.623591, 0.2196078, 1, 0, 1,
-0.4707695, -1.532448, -4.439683, 0.2117647, 1, 0, 1,
-0.4699579, -0.4891789, -0.9499736, 0.2078431, 1, 0, 1,
-0.4695672, 0.5038327, -0.05177657, 0.2, 1, 0, 1,
-0.4673028, 1.080869, -0.4771906, 0.1921569, 1, 0, 1,
-0.4652203, -0.1298657, -0.8242503, 0.1882353, 1, 0, 1,
-0.4602157, -0.2558872, -1.662333, 0.1803922, 1, 0, 1,
-0.4569004, 0.5315287, 0.6474777, 0.1764706, 1, 0, 1,
-0.454892, 1.043242, -1.119772, 0.1686275, 1, 0, 1,
-0.4493503, -0.1407653, -2.929136, 0.1647059, 1, 0, 1,
-0.4457257, 1.351323, -0.5906394, 0.1568628, 1, 0, 1,
-0.4446577, -0.3215067, -2.577414, 0.1529412, 1, 0, 1,
-0.4442686, -1.000471, -2.870894, 0.145098, 1, 0, 1,
-0.4412543, -1.259732, -2.957844, 0.1411765, 1, 0, 1,
-0.439486, -0.3640464, -2.668878, 0.1333333, 1, 0, 1,
-0.4383609, 0.810802, -0.6692098, 0.1294118, 1, 0, 1,
-0.4364288, 1.933689, -0.1998393, 0.1215686, 1, 0, 1,
-0.436267, 0.6195238, 1.006245, 0.1176471, 1, 0, 1,
-0.4338274, -1.453479, -4.649108, 0.1098039, 1, 0, 1,
-0.4300756, 0.7519547, -0.3907048, 0.1058824, 1, 0, 1,
-0.4283734, -1.281929, -2.448676, 0.09803922, 1, 0, 1,
-0.4281799, -0.01120441, -1.661023, 0.09019608, 1, 0, 1,
-0.4258224, 0.931584, -0.8974793, 0.08627451, 1, 0, 1,
-0.4246407, -0.4098531, -1.908006, 0.07843138, 1, 0, 1,
-0.4189266, -0.08835973, -2.903935, 0.07450981, 1, 0, 1,
-0.4125529, 1.096265, -1.899416, 0.06666667, 1, 0, 1,
-0.4111299, 0.2476468, -1.160008, 0.0627451, 1, 0, 1,
-0.4097885, -0.369895, -1.030035, 0.05490196, 1, 0, 1,
-0.4089341, 0.252432, 0.2441972, 0.05098039, 1, 0, 1,
-0.4053416, -1.168792, -3.430256, 0.04313726, 1, 0, 1,
-0.4050308, 0.2584398, 1.383858, 0.03921569, 1, 0, 1,
-0.4036706, 1.121187, -1.329132, 0.03137255, 1, 0, 1,
-0.4003283, 0.07455754, -0.6926386, 0.02745098, 1, 0, 1,
-0.3968012, 1.085618, -0.6971739, 0.01960784, 1, 0, 1,
-0.3959635, 1.503153, -0.9477673, 0.01568628, 1, 0, 1,
-0.3917259, 1.27846, -1.116481, 0.007843138, 1, 0, 1,
-0.3913985, -1.03398, -1.037305, 0.003921569, 1, 0, 1,
-0.3896105, 1.193714, 0.6414852, 0, 1, 0.003921569, 1,
-0.38866, -2.086039, -1.974862, 0, 1, 0.01176471, 1,
-0.3854692, 0.7794628, 0.964688, 0, 1, 0.01568628, 1,
-0.3850226, 1.006683, 0.550198, 0, 1, 0.02352941, 1,
-0.3845728, 1.179531, 1.324042, 0, 1, 0.02745098, 1,
-0.3825561, -0.1183321, -3.936772, 0, 1, 0.03529412, 1,
-0.3824633, -0.7020406, -1.462955, 0, 1, 0.03921569, 1,
-0.3791176, 0.267902, -0.03408392, 0, 1, 0.04705882, 1,
-0.3787064, -0.610894, -3.224312, 0, 1, 0.05098039, 1,
-0.3740175, -0.0606757, -1.146572, 0, 1, 0.05882353, 1,
-0.3690747, -1.064549, -2.29844, 0, 1, 0.0627451, 1,
-0.367126, -0.8296129, -2.500806, 0, 1, 0.07058824, 1,
-0.3664409, -0.6852796, -1.953129, 0, 1, 0.07450981, 1,
-0.3646432, 0.9877601, -0.8771396, 0, 1, 0.08235294, 1,
-0.363989, -0.9689535, -2.146545, 0, 1, 0.08627451, 1,
-0.3608076, 0.009335069, -1.049434, 0, 1, 0.09411765, 1,
-0.360325, -1.307315, -1.828441, 0, 1, 0.1019608, 1,
-0.3596727, -0.9955838, -3.33992, 0, 1, 0.1058824, 1,
-0.3594517, 0.3053201, 0.4485123, 0, 1, 0.1137255, 1,
-0.3580089, 0.561779, -3.276762, 0, 1, 0.1176471, 1,
-0.3572833, -1.824631, -2.054379, 0, 1, 0.1254902, 1,
-0.3549252, -0.06897128, -1.9405, 0, 1, 0.1294118, 1,
-0.3475938, -1.153012, -3.672692, 0, 1, 0.1372549, 1,
-0.3471967, 0.9223737, -0.4488676, 0, 1, 0.1411765, 1,
-0.347111, 1.856692, -0.4196326, 0, 1, 0.1490196, 1,
-0.3461688, 0.673153, 0.2811536, 0, 1, 0.1529412, 1,
-0.3337073, -0.8963447, -4.247676, 0, 1, 0.1607843, 1,
-0.3325872, -0.7255545, -2.712774, 0, 1, 0.1647059, 1,
-0.3306698, 1.459134, -0.1088537, 0, 1, 0.172549, 1,
-0.327292, 0.777626, 1.790694, 0, 1, 0.1764706, 1,
-0.3267618, -0.7610724, -2.930851, 0, 1, 0.1843137, 1,
-0.3231995, 1.603635, -0.3150477, 0, 1, 0.1882353, 1,
-0.3189339, 1.08459, -0.8699231, 0, 1, 0.1960784, 1,
-0.3179733, -2.030974, -2.918178, 0, 1, 0.2039216, 1,
-0.3152401, -0.2119957, -3.832441, 0, 1, 0.2078431, 1,
-0.3131796, 0.792024, 0.9157053, 0, 1, 0.2156863, 1,
-0.3115101, 0.6938726, -2.103669, 0, 1, 0.2196078, 1,
-0.3108653, -0.5837438, -3.576112, 0, 1, 0.227451, 1,
-0.3065447, 1.40972, -1.868861, 0, 1, 0.2313726, 1,
-0.2987148, -0.8050393, -3.288764, 0, 1, 0.2392157, 1,
-0.2977412, 0.6014984, -0.2116057, 0, 1, 0.2431373, 1,
-0.2972556, 0.1491707, -1.312562, 0, 1, 0.2509804, 1,
-0.2955361, 0.5719151, 0.2693921, 0, 1, 0.254902, 1,
-0.2938541, -1.156116, -2.576776, 0, 1, 0.2627451, 1,
-0.2920668, 1.320196, -0.1533654, 0, 1, 0.2666667, 1,
-0.2918671, 0.4433458, -0.08497934, 0, 1, 0.2745098, 1,
-0.2895733, -0.943525, -4.306213, 0, 1, 0.2784314, 1,
-0.2891468, -0.3578196, -1.783903, 0, 1, 0.2862745, 1,
-0.284581, 0.6454723, -2.555954, 0, 1, 0.2901961, 1,
-0.2837613, 1.048432, 1.402304, 0, 1, 0.2980392, 1,
-0.2821666, -1.021265, -4.08634, 0, 1, 0.3058824, 1,
-0.2801418, 1.292585, 0.6916149, 0, 1, 0.3098039, 1,
-0.2792228, 0.727209, -3.472093, 0, 1, 0.3176471, 1,
-0.2784225, -0.1303258, -3.071979, 0, 1, 0.3215686, 1,
-0.2754867, -1.17345, -3.08642, 0, 1, 0.3294118, 1,
-0.2709058, -0.7607231, -2.708918, 0, 1, 0.3333333, 1,
-0.2650553, -0.7248487, -3.903363, 0, 1, 0.3411765, 1,
-0.2629401, -2.598334, -3.200559, 0, 1, 0.345098, 1,
-0.2618707, 1.878894, -1.415727, 0, 1, 0.3529412, 1,
-0.2616706, -2.602272, -3.359069, 0, 1, 0.3568628, 1,
-0.2607487, 1.776529, -2.310735, 0, 1, 0.3647059, 1,
-0.2598835, 1.755137, -0.1679877, 0, 1, 0.3686275, 1,
-0.2581947, 0.6630967, -1.166827, 0, 1, 0.3764706, 1,
-0.2575021, -0.6248275, -1.694509, 0, 1, 0.3803922, 1,
-0.254914, -1.469383, -4.545284, 0, 1, 0.3882353, 1,
-0.2534781, 0.1769225, -2.320482, 0, 1, 0.3921569, 1,
-0.2468385, 1.245189, 0.569085, 0, 1, 0.4, 1,
-0.2447706, 0.2867675, -1.310835, 0, 1, 0.4078431, 1,
-0.2414407, 0.4944002, -0.6443925, 0, 1, 0.4117647, 1,
-0.2338341, 0.6385365, 0.3548389, 0, 1, 0.4196078, 1,
-0.233494, 0.9159007, 0.3382167, 0, 1, 0.4235294, 1,
-0.2322194, -0.3398595, -3.858441, 0, 1, 0.4313726, 1,
-0.2314312, -1.631796, -2.57794, 0, 1, 0.4352941, 1,
-0.2305749, 1.288636, -0.5514144, 0, 1, 0.4431373, 1,
-0.226852, -1.05926, -2.010697, 0, 1, 0.4470588, 1,
-0.2217054, 0.0286334, -1.906906, 0, 1, 0.454902, 1,
-0.2216009, 1.77256, -1.165424, 0, 1, 0.4588235, 1,
-0.2212054, -0.5124376, -2.909144, 0, 1, 0.4666667, 1,
-0.2183729, 0.2333351, -0.1653885, 0, 1, 0.4705882, 1,
-0.2128042, 0.06595574, -1.551316, 0, 1, 0.4784314, 1,
-0.2109548, -1.556169, -3.266785, 0, 1, 0.4823529, 1,
-0.2081642, -0.8448012, -1.041244, 0, 1, 0.4901961, 1,
-0.2036557, -0.4190138, -2.496556, 0, 1, 0.4941176, 1,
-0.1973856, -0.7574954, -3.754771, 0, 1, 0.5019608, 1,
-0.1933001, 0.7821834, -0.13879, 0, 1, 0.509804, 1,
-0.1928808, -0.06417197, -2.002498, 0, 1, 0.5137255, 1,
-0.1918243, 1.514697, 0.5607058, 0, 1, 0.5215687, 1,
-0.1911031, -0.4074909, -5.520682, 0, 1, 0.5254902, 1,
-0.1889501, 0.1410025, -0.5275892, 0, 1, 0.5333334, 1,
-0.1886085, 0.2698382, -1.199036, 0, 1, 0.5372549, 1,
-0.183198, -0.375413, -2.183418, 0, 1, 0.5450981, 1,
-0.1787997, 0.008196597, -0.06418732, 0, 1, 0.5490196, 1,
-0.1770298, -1.949677, -2.32365, 0, 1, 0.5568628, 1,
-0.1744577, -1.922794, -3.678969, 0, 1, 0.5607843, 1,
-0.1728329, -0.3306683, -2.143488, 0, 1, 0.5686275, 1,
-0.1654101, -0.7272632, -4.052556, 0, 1, 0.572549, 1,
-0.1653627, 0.6885638, -2.080347, 0, 1, 0.5803922, 1,
-0.1637142, 0.2319529, -0.09141589, 0, 1, 0.5843138, 1,
-0.160983, -0.4704436, -3.066095, 0, 1, 0.5921569, 1,
-0.160238, -1.056535, -4.320088, 0, 1, 0.5960785, 1,
-0.1586997, -0.8716347, -4.228685, 0, 1, 0.6039216, 1,
-0.1560678, -0.7753863, -0.9186397, 0, 1, 0.6117647, 1,
-0.1553138, 0.3337089, -2.163517, 0, 1, 0.6156863, 1,
-0.1552699, 0.5936381, -1.339513, 0, 1, 0.6235294, 1,
-0.1530561, -1.630457, -3.816899, 0, 1, 0.627451, 1,
-0.152515, 0.2477192, -0.8222886, 0, 1, 0.6352941, 1,
-0.1516283, -0.2717696, -2.95026, 0, 1, 0.6392157, 1,
-0.1492325, 0.553591, -0.9661614, 0, 1, 0.6470588, 1,
-0.1471937, 0.6823896, -0.9011931, 0, 1, 0.6509804, 1,
-0.1465181, -0.749328, -4.086851, 0, 1, 0.6588235, 1,
-0.1461386, -0.8686127, -2.241359, 0, 1, 0.6627451, 1,
-0.1452674, 0.878679, -0.8670474, 0, 1, 0.6705883, 1,
-0.1430468, -0.3207308, -4.574563, 0, 1, 0.6745098, 1,
-0.1408302, -0.4828482, -3.068732, 0, 1, 0.682353, 1,
-0.1389776, -0.8071153, -1.226584, 0, 1, 0.6862745, 1,
-0.1350118, 0.5316414, -1.076961, 0, 1, 0.6941177, 1,
-0.1341726, -1.116107, -3.783849, 0, 1, 0.7019608, 1,
-0.1339203, -0.7139957, -2.623662, 0, 1, 0.7058824, 1,
-0.1323399, -0.8545084, -2.803568, 0, 1, 0.7137255, 1,
-0.1304946, -1.349623, -2.820941, 0, 1, 0.7176471, 1,
-0.1296363, 0.03488386, 0.2879301, 0, 1, 0.7254902, 1,
-0.1268483, 0.2402697, -0.1452728, 0, 1, 0.7294118, 1,
-0.12482, 0.5570256, 1.133574, 0, 1, 0.7372549, 1,
-0.1244249, -0.01442787, -1.589497, 0, 1, 0.7411765, 1,
-0.1216087, -0.9320676, -3.368601, 0, 1, 0.7490196, 1,
-0.1215371, -0.439579, -4.226583, 0, 1, 0.7529412, 1,
-0.1208399, 1.283348, 0.4251528, 0, 1, 0.7607843, 1,
-0.1196682, -0.5105642, -2.735368, 0, 1, 0.7647059, 1,
-0.114646, -0.003151401, 0.1641609, 0, 1, 0.772549, 1,
-0.114078, -0.7974655, -2.668606, 0, 1, 0.7764706, 1,
-0.1073949, -0.1376581, -3.759856, 0, 1, 0.7843137, 1,
-0.1059703, -1.947241, -1.351692, 0, 1, 0.7882353, 1,
-0.1051605, 2.441238, 0.9736277, 0, 1, 0.7960784, 1,
-0.09837592, 0.3273451, -0.4184432, 0, 1, 0.8039216, 1,
-0.09507158, 0.1275683, -0.0352102, 0, 1, 0.8078431, 1,
-0.09502292, -0.07044001, -1.839897, 0, 1, 0.8156863, 1,
-0.08814938, -0.4605449, -2.887278, 0, 1, 0.8196079, 1,
-0.08757676, -0.02970668, -0.7697996, 0, 1, 0.827451, 1,
-0.08594909, 0.3144052, -0.736352, 0, 1, 0.8313726, 1,
-0.08552413, -2.507854, -2.339553, 0, 1, 0.8392157, 1,
-0.08540972, -0.7212015, -5.364962, 0, 1, 0.8431373, 1,
-0.06638333, -1.510864, -3.763312, 0, 1, 0.8509804, 1,
-0.05928765, 0.224767, 0.5535457, 0, 1, 0.854902, 1,
-0.05750945, 0.1155513, -1.742682, 0, 1, 0.8627451, 1,
-0.05037585, -0.4518799, -3.273497, 0, 1, 0.8666667, 1,
-0.04812825, -0.8196526, -3.50461, 0, 1, 0.8745098, 1,
-0.04740585, -0.6383662, -4.150818, 0, 1, 0.8784314, 1,
-0.04686682, -0.1816942, -2.646082, 0, 1, 0.8862745, 1,
-0.04284019, -0.2537406, -3.323743, 0, 1, 0.8901961, 1,
-0.04045462, -0.2717218, -3.347582, 0, 1, 0.8980392, 1,
-0.0388024, 0.03018735, -2.075583, 0, 1, 0.9058824, 1,
-0.03820445, 1.065236, -1.209535, 0, 1, 0.9098039, 1,
-0.0364541, 0.1375652, 0.9804022, 0, 1, 0.9176471, 1,
-0.03620799, 0.7530808, 0.1793038, 0, 1, 0.9215686, 1,
-0.03476562, 1.581502, 1.947359, 0, 1, 0.9294118, 1,
-0.03374752, 1.480031, 0.6902804, 0, 1, 0.9333333, 1,
-0.03327652, 0.3957518, -0.8396524, 0, 1, 0.9411765, 1,
-0.03275347, -0.3132674, -2.810038, 0, 1, 0.945098, 1,
-0.03218431, 1.51982, 1.036981, 0, 1, 0.9529412, 1,
-0.03057616, -1.565258, -3.041575, 0, 1, 0.9568627, 1,
-0.03001526, 2.107377, 2.251115, 0, 1, 0.9647059, 1,
-0.02816998, -0.3371478, -3.189282, 0, 1, 0.9686275, 1,
-0.02749575, -1.738549, -3.606387, 0, 1, 0.9764706, 1,
-0.02626577, -0.7370342, -4.078695, 0, 1, 0.9803922, 1,
-0.01464519, -1.306751, -2.99946, 0, 1, 0.9882353, 1,
-0.01439037, 0.5129954, -0.4448197, 0, 1, 0.9921569, 1,
-0.01074625, 0.606524, 0.05517967, 0, 1, 1, 1,
-0.01038472, 0.02045062, -1.043923, 0, 0.9921569, 1, 1,
-0.01013491, 1.230577, 1.353551, 0, 0.9882353, 1, 1,
-0.002939798, 1.389466, 2.411852, 0, 0.9803922, 1, 1,
0.003448474, 0.6793483, -0.1632727, 0, 0.9764706, 1, 1,
0.003711362, -1.557481, 3.823132, 0, 0.9686275, 1, 1,
0.0125531, 0.8783638, 1.656641, 0, 0.9647059, 1, 1,
0.01272586, 1.234631, -0.853324, 0, 0.9568627, 1, 1,
0.01279023, -0.3831673, 1.006729, 0, 0.9529412, 1, 1,
0.01447683, -0.8378231, 4.291237, 0, 0.945098, 1, 1,
0.01506332, -0.3977384, 2.086207, 0, 0.9411765, 1, 1,
0.01520244, -0.8572931, 2.378515, 0, 0.9333333, 1, 1,
0.01916341, 0.7107777, 0.008092409, 0, 0.9294118, 1, 1,
0.01989137, 3.039365, 0.9385044, 0, 0.9215686, 1, 1,
0.02102435, 1.704033, 1.240234, 0, 0.9176471, 1, 1,
0.02167715, -0.1790871, 2.1315, 0, 0.9098039, 1, 1,
0.02221589, 0.4249801, 0.729892, 0, 0.9058824, 1, 1,
0.02937891, -1.757982, 3.173254, 0, 0.8980392, 1, 1,
0.0337181, 0.4003436, 2.688936, 0, 0.8901961, 1, 1,
0.03483678, 0.6887348, 0.8415133, 0, 0.8862745, 1, 1,
0.03492492, -0.7958963, 3.51628, 0, 0.8784314, 1, 1,
0.03528196, 0.2003943, 0.3799388, 0, 0.8745098, 1, 1,
0.03663316, -1.882423, 2.640297, 0, 0.8666667, 1, 1,
0.03824443, -0.6010684, 2.117329, 0, 0.8627451, 1, 1,
0.03944223, 0.05964963, -0.01572, 0, 0.854902, 1, 1,
0.04017524, -2.033752e-05, 1.566789, 0, 0.8509804, 1, 1,
0.04024709, -0.6548514, 3.160185, 0, 0.8431373, 1, 1,
0.04104256, 0.6050676, -0.2542965, 0, 0.8392157, 1, 1,
0.04206231, -0.01243566, 1.601851, 0, 0.8313726, 1, 1,
0.04387989, -0.01442971, 4.228743, 0, 0.827451, 1, 1,
0.04403911, 1.703912, 0.2720995, 0, 0.8196079, 1, 1,
0.04445706, 0.1416865, -1.006847, 0, 0.8156863, 1, 1,
0.04668595, 0.1389863, 1.333326, 0, 0.8078431, 1, 1,
0.0478586, 0.2155305, 0.757833, 0, 0.8039216, 1, 1,
0.04983243, -1.543697, 4.426883, 0, 0.7960784, 1, 1,
0.05934744, 0.3948329, 1.361916, 0, 0.7882353, 1, 1,
0.06074624, 0.08532277, -0.8509157, 0, 0.7843137, 1, 1,
0.06327333, -0.4572327, 3.007012, 0, 0.7764706, 1, 1,
0.06405867, 0.5203831, 0.5112981, 0, 0.772549, 1, 1,
0.06721, -0.6198172, 3.68941, 0, 0.7647059, 1, 1,
0.06868958, 2.596055, -2.22211, 0, 0.7607843, 1, 1,
0.07551285, 0.307099, 0.2208485, 0, 0.7529412, 1, 1,
0.07669548, 2.099762, 2.041738, 0, 0.7490196, 1, 1,
0.07677891, -0.03785574, 1.629121, 0, 0.7411765, 1, 1,
0.07832589, 0.05617449, -0.8523707, 0, 0.7372549, 1, 1,
0.07955649, -0.8177732, 2.57712, 0, 0.7294118, 1, 1,
0.07972837, -0.4692249, 3.104156, 0, 0.7254902, 1, 1,
0.08127239, -3.807809, 4.236837, 0, 0.7176471, 1, 1,
0.08447237, 1.171834, 2.069816, 0, 0.7137255, 1, 1,
0.0847864, 0.5102873, 1.026307, 0, 0.7058824, 1, 1,
0.09064072, -0.3104162, 2.153931, 0, 0.6980392, 1, 1,
0.09265923, -1.083427, 4.430479, 0, 0.6941177, 1, 1,
0.09627585, -0.9508215, 3.006391, 0, 0.6862745, 1, 1,
0.1019827, 0.8703319, 0.7165622, 0, 0.682353, 1, 1,
0.1033874, -0.1699999, 2.091133, 0, 0.6745098, 1, 1,
0.1038233, -1.050772, 3.333868, 0, 0.6705883, 1, 1,
0.10755, 0.4532768, 1.357351, 0, 0.6627451, 1, 1,
0.108084, -0.2551486, 3.067762, 0, 0.6588235, 1, 1,
0.1134301, 0.08273487, 1.085425, 0, 0.6509804, 1, 1,
0.1177821, -0.6520196, 2.746186, 0, 0.6470588, 1, 1,
0.1192755, -0.6667587, 1.477491, 0, 0.6392157, 1, 1,
0.1217093, -0.6389302, 1.370695, 0, 0.6352941, 1, 1,
0.123065, 0.2813247, 0.0344345, 0, 0.627451, 1, 1,
0.1234461, -0.1542838, 1.972471, 0, 0.6235294, 1, 1,
0.1241902, -1.915358, 3.35115, 0, 0.6156863, 1, 1,
0.124279, -0.3940805, 1.585101, 0, 0.6117647, 1, 1,
0.1246061, -0.2133608, 2.61016, 0, 0.6039216, 1, 1,
0.1250212, -0.2079221, 2.370378, 0, 0.5960785, 1, 1,
0.1258527, 0.4118454, 1.346474, 0, 0.5921569, 1, 1,
0.1303569, -0.4320609, 3.216971, 0, 0.5843138, 1, 1,
0.1330293, 1.163015, 0.3747109, 0, 0.5803922, 1, 1,
0.1413948, -1.602771, 4.203891, 0, 0.572549, 1, 1,
0.1418348, -0.1604548, 1.98331, 0, 0.5686275, 1, 1,
0.1440409, -1.454135, 4.320612, 0, 0.5607843, 1, 1,
0.1492071, -1.246893, 4.748467, 0, 0.5568628, 1, 1,
0.1578885, 0.7967575, -0.9708851, 0, 0.5490196, 1, 1,
0.1581834, -2.582374, 2.341448, 0, 0.5450981, 1, 1,
0.1613087, -1.191448, 2.326582, 0, 0.5372549, 1, 1,
0.1679201, -0.40049, 1.013597, 0, 0.5333334, 1, 1,
0.1774509, -0.05718619, 1.750688, 0, 0.5254902, 1, 1,
0.1778655, 0.1979393, 1.766723, 0, 0.5215687, 1, 1,
0.177956, -0.5918925, 2.224193, 0, 0.5137255, 1, 1,
0.178571, 0.4705114, 0.8514425, 0, 0.509804, 1, 1,
0.1793265, -2.299811, 3.47927, 0, 0.5019608, 1, 1,
0.1930636, -0.3808232, 2.067498, 0, 0.4941176, 1, 1,
0.1950073, -0.2650208, 1.032413, 0, 0.4901961, 1, 1,
0.1968571, 0.4224187, 0.3234274, 0, 0.4823529, 1, 1,
0.1984607, 0.9345441, -0.4695805, 0, 0.4784314, 1, 1,
0.199732, 0.4761256, -0.8325953, 0, 0.4705882, 1, 1,
0.200753, -0.6511266, 2.282347, 0, 0.4666667, 1, 1,
0.2078271, -0.5277182, 3.379198, 0, 0.4588235, 1, 1,
0.215053, 1.005587, -0.709056, 0, 0.454902, 1, 1,
0.221096, 1.236252, 0.3748125, 0, 0.4470588, 1, 1,
0.2213151, 0.05995842, 2.309939, 0, 0.4431373, 1, 1,
0.2233683, 1.775186, 0.4802703, 0, 0.4352941, 1, 1,
0.2268199, -0.501822, 1.614246, 0, 0.4313726, 1, 1,
0.2282064, -1.412394, 4.786132, 0, 0.4235294, 1, 1,
0.2377851, -0.08578653, 2.055119, 0, 0.4196078, 1, 1,
0.2429483, -0.2630166, 1.615156, 0, 0.4117647, 1, 1,
0.2509459, -0.3009132, 1.801305, 0, 0.4078431, 1, 1,
0.2534098, 0.5326903, -0.8705635, 0, 0.4, 1, 1,
0.2570876, 0.1169722, 2.024237, 0, 0.3921569, 1, 1,
0.2581273, -1.094061, 0.1392512, 0, 0.3882353, 1, 1,
0.2602416, -0.4124312, 2.765124, 0, 0.3803922, 1, 1,
0.2609051, 1.961686, 2.084813, 0, 0.3764706, 1, 1,
0.2679594, 1.478284, 1.248973, 0, 0.3686275, 1, 1,
0.2681111, -1.983705, 4.37173, 0, 0.3647059, 1, 1,
0.2694452, -0.4298028, 3.962551, 0, 0.3568628, 1, 1,
0.2738042, -0.9231015, 3.371953, 0, 0.3529412, 1, 1,
0.2776125, 0.5948429, 1.843503, 0, 0.345098, 1, 1,
0.2799688, -1.02572, 3.95285, 0, 0.3411765, 1, 1,
0.2851909, -1.102605, 3.624708, 0, 0.3333333, 1, 1,
0.2857642, 0.1195599, 2.260203, 0, 0.3294118, 1, 1,
0.2905916, -0.4012646, 1.487449, 0, 0.3215686, 1, 1,
0.2907146, -0.3986916, 2.296463, 0, 0.3176471, 1, 1,
0.292926, -1.216692, 2.248761, 0, 0.3098039, 1, 1,
0.2966414, -0.0850817, 2.329572, 0, 0.3058824, 1, 1,
0.2994659, 0.4981266, 1.393821, 0, 0.2980392, 1, 1,
0.2999347, -0.7899112, 2.866761, 0, 0.2901961, 1, 1,
0.3007348, -0.05457281, 3.168269, 0, 0.2862745, 1, 1,
0.3032917, 1.207037, 0.4675625, 0, 0.2784314, 1, 1,
0.3038817, 0.5020599, 0.8762974, 0, 0.2745098, 1, 1,
0.3052362, -1.714128, 2.036084, 0, 0.2666667, 1, 1,
0.3054026, 1.129846, -0.1314847, 0, 0.2627451, 1, 1,
0.3060008, 0.4369082, 3.107442, 0, 0.254902, 1, 1,
0.3063129, 0.8012191, -0.3176979, 0, 0.2509804, 1, 1,
0.3074475, -1.166792, 4.68891, 0, 0.2431373, 1, 1,
0.3157203, 0.6772816, 1.001448, 0, 0.2392157, 1, 1,
0.3189098, -0.8468964, 2.836622, 0, 0.2313726, 1, 1,
0.320233, 1.521347, -0.9130141, 0, 0.227451, 1, 1,
0.3293307, 0.6836004, -0.2872261, 0, 0.2196078, 1, 1,
0.3359045, -1.470265, 2.5327, 0, 0.2156863, 1, 1,
0.3369392, 0.8208032, -0.1339361, 0, 0.2078431, 1, 1,
0.3387377, 0.3495315, 0.2748955, 0, 0.2039216, 1, 1,
0.3409999, 0.9848511, 0.6156116, 0, 0.1960784, 1, 1,
0.3412538, 0.3482516, 1.610694, 0, 0.1882353, 1, 1,
0.3413404, -0.1153401, 0.8471931, 0, 0.1843137, 1, 1,
0.3417887, 1.471136, -1.038359, 0, 0.1764706, 1, 1,
0.3433292, 2.060476, -0.3298511, 0, 0.172549, 1, 1,
0.3524254, 0.1997907, 1.731891, 0, 0.1647059, 1, 1,
0.353132, 0.4078973, 1.178151, 0, 0.1607843, 1, 1,
0.3608021, 0.5940281, 2.497702, 0, 0.1529412, 1, 1,
0.3612406, -0.7001458, 4.794673, 0, 0.1490196, 1, 1,
0.3614223, -0.03936002, 2.204672, 0, 0.1411765, 1, 1,
0.3645789, 1.753123, -1.357469, 0, 0.1372549, 1, 1,
0.3654588, 0.2808892, 0.6919973, 0, 0.1294118, 1, 1,
0.3670083, 0.0009258266, 0.2442814, 0, 0.1254902, 1, 1,
0.3671901, 0.3522245, -0.06113097, 0, 0.1176471, 1, 1,
0.3692094, 1.006642, 0.2312571, 0, 0.1137255, 1, 1,
0.3708157, -0.05564526, 3.391282, 0, 0.1058824, 1, 1,
0.3735023, -1.862463, 2.953848, 0, 0.09803922, 1, 1,
0.3737881, -0.7732188, 3.238513, 0, 0.09411765, 1, 1,
0.3740724, 0.08567417, 0.05310253, 0, 0.08627451, 1, 1,
0.3871292, -1.241554, 2.411417, 0, 0.08235294, 1, 1,
0.3888994, -0.3367183, 1.569589, 0, 0.07450981, 1, 1,
0.3945451, 0.134332, -0.6173241, 0, 0.07058824, 1, 1,
0.3956753, -0.2224444, 1.930469, 0, 0.0627451, 1, 1,
0.3986306, 0.2311317, 0.6425082, 0, 0.05882353, 1, 1,
0.3987492, 0.03035975, 2.369802, 0, 0.05098039, 1, 1,
0.4011854, 0.5148318, 1.333441, 0, 0.04705882, 1, 1,
0.4019356, 0.1843515, 0.6329809, 0, 0.03921569, 1, 1,
0.4020868, 0.3078603, -0.8503124, 0, 0.03529412, 1, 1,
0.4053634, 1.54928, 0.2222705, 0, 0.02745098, 1, 1,
0.4057533, -0.9279752, 1.930953, 0, 0.02352941, 1, 1,
0.4061655, 1.912628, -0.9438737, 0, 0.01568628, 1, 1,
0.4067506, 0.5331635, 1.74973, 0, 0.01176471, 1, 1,
0.4088269, 0.1840274, -0.0851059, 0, 0.003921569, 1, 1,
0.4111066, 0.07581928, 1.133392, 0.003921569, 0, 1, 1,
0.412447, 0.01890268, 1.250305, 0.007843138, 0, 1, 1,
0.4233382, -0.2794131, 2.668675, 0.01568628, 0, 1, 1,
0.4240995, 0.7135889, -0.9554371, 0.01960784, 0, 1, 1,
0.4245492, -0.3145716, 2.46212, 0.02745098, 0, 1, 1,
0.4291251, 0.6396011, 1.074926, 0.03137255, 0, 1, 1,
0.4342412, -1.230633, 3.815217, 0.03921569, 0, 1, 1,
0.4354239, -0.8623026, 2.613957, 0.04313726, 0, 1, 1,
0.4355592, 1.283855, 1.49467, 0.05098039, 0, 1, 1,
0.4375661, -1.200024, 1.417376, 0.05490196, 0, 1, 1,
0.4383615, -0.7507625, 4.268515, 0.0627451, 0, 1, 1,
0.4394476, -0.2223353, 2.51116, 0.06666667, 0, 1, 1,
0.4397418, -1.315459, 2.146188, 0.07450981, 0, 1, 1,
0.4416157, 0.1387894, 1.780563, 0.07843138, 0, 1, 1,
0.4447739, -0.9969962, 3.345204, 0.08627451, 0, 1, 1,
0.4461197, -0.08777443, 1.221948, 0.09019608, 0, 1, 1,
0.4476775, 2.858207, 2.748057, 0.09803922, 0, 1, 1,
0.448808, -0.2310413, 2.496181, 0.1058824, 0, 1, 1,
0.4506868, -0.8293959, 0.9347778, 0.1098039, 0, 1, 1,
0.4540264, -0.2503222, 2.374288, 0.1176471, 0, 1, 1,
0.4589697, 1.274586, 0.1235382, 0.1215686, 0, 1, 1,
0.4595881, -0.923955, 1.478591, 0.1294118, 0, 1, 1,
0.4610631, -0.6814426, 2.821825, 0.1333333, 0, 1, 1,
0.4611063, 0.5841253, 0.5990182, 0.1411765, 0, 1, 1,
0.465405, 0.2491114, 1.392819, 0.145098, 0, 1, 1,
0.4665971, -1.34839, 2.70162, 0.1529412, 0, 1, 1,
0.4669304, 0.06877242, 1.571307, 0.1568628, 0, 1, 1,
0.4676613, 1.126235, 1.518482, 0.1647059, 0, 1, 1,
0.4747261, -0.3635327, 0.8557516, 0.1686275, 0, 1, 1,
0.4759592, -1.4242, 3.83078, 0.1764706, 0, 1, 1,
0.4765177, -0.4515657, 2.675643, 0.1803922, 0, 1, 1,
0.4766935, -1.568631, 2.589258, 0.1882353, 0, 1, 1,
0.4796961, -1.47071, 3.156575, 0.1921569, 0, 1, 1,
0.4857035, -0.2292405, 2.694678, 0.2, 0, 1, 1,
0.4898142, 1.814901, 0.3283955, 0.2078431, 0, 1, 1,
0.4915248, -1.033941, 1.736319, 0.2117647, 0, 1, 1,
0.5138133, 0.8278279, -0.480228, 0.2196078, 0, 1, 1,
0.5140252, -0.4578744, 1.883897, 0.2235294, 0, 1, 1,
0.5155458, 1.385204, 1.233891, 0.2313726, 0, 1, 1,
0.5156659, -0.6404353, 2.835531, 0.2352941, 0, 1, 1,
0.5164641, 0.426246, -0.2202842, 0.2431373, 0, 1, 1,
0.5201247, 0.531574, 0.01334931, 0.2470588, 0, 1, 1,
0.5292695, 1.008904, -0.1328284, 0.254902, 0, 1, 1,
0.5303459, -2.268167, 3.517098, 0.2588235, 0, 1, 1,
0.5309653, 1.257964, -0.4445357, 0.2666667, 0, 1, 1,
0.5314144, 0.008919037, 2.350476, 0.2705882, 0, 1, 1,
0.5315788, 0.8192539, 0.5511658, 0.2784314, 0, 1, 1,
0.5373026, 0.2033295, 2.932443, 0.282353, 0, 1, 1,
0.5426328, -0.2943942, 0.09062257, 0.2901961, 0, 1, 1,
0.5439684, 1.284, 1.295957, 0.2941177, 0, 1, 1,
0.5445932, -1.650431, 1.96519, 0.3019608, 0, 1, 1,
0.5471225, -0.4168366, 3.316513, 0.3098039, 0, 1, 1,
0.547856, 0.7476646, 1.449665, 0.3137255, 0, 1, 1,
0.5543744, -0.4520319, 2.821177, 0.3215686, 0, 1, 1,
0.5563875, -2.414385, 2.908231, 0.3254902, 0, 1, 1,
0.5582664, 1.258431, 0.9711331, 0.3333333, 0, 1, 1,
0.5592028, -0.2849835, 0.5860561, 0.3372549, 0, 1, 1,
0.5632256, -0.5587166, 3.581711, 0.345098, 0, 1, 1,
0.5636781, 0.2514099, 1.086962, 0.3490196, 0, 1, 1,
0.5693684, -0.3012099, 2.923909, 0.3568628, 0, 1, 1,
0.5716466, -0.3183044, 2.030627, 0.3607843, 0, 1, 1,
0.5742813, -0.05144052, 2.031923, 0.3686275, 0, 1, 1,
0.5903635, -0.9912874, 2.433723, 0.372549, 0, 1, 1,
0.5912814, -0.3962771, 2.245018, 0.3803922, 0, 1, 1,
0.5939417, 1.925205, 1.116524, 0.3843137, 0, 1, 1,
0.5989387, -0.0795572, 0.5792549, 0.3921569, 0, 1, 1,
0.6000143, -0.9341158, 1.805378, 0.3960784, 0, 1, 1,
0.6044759, 1.80668, -0.04393737, 0.4039216, 0, 1, 1,
0.6044822, -1.756829, 3.297651, 0.4117647, 0, 1, 1,
0.6082703, -0.3204901, 3.465332, 0.4156863, 0, 1, 1,
0.6116272, -0.04683109, 0.9193406, 0.4235294, 0, 1, 1,
0.6193032, 0.182606, 0.3032537, 0.427451, 0, 1, 1,
0.6274024, 1.302049, -0.09893012, 0.4352941, 0, 1, 1,
0.6355679, 0.3567372, 0.2202448, 0.4392157, 0, 1, 1,
0.6427332, -0.2943397, 1.421119, 0.4470588, 0, 1, 1,
0.6463909, -1.799195, 2.462491, 0.4509804, 0, 1, 1,
0.6485048, 0.5658452, 1.886486, 0.4588235, 0, 1, 1,
0.6558343, -0.7277199, 2.42527, 0.4627451, 0, 1, 1,
0.6565502, 0.9016461, 1.092616, 0.4705882, 0, 1, 1,
0.6576476, 0.3949671, 0.0586386, 0.4745098, 0, 1, 1,
0.6708905, 0.9440836, 2.038542, 0.4823529, 0, 1, 1,
0.6743373, -1.773091, 2.270399, 0.4862745, 0, 1, 1,
0.6756008, 2.910913, 1.347005, 0.4941176, 0, 1, 1,
0.6762627, -0.06219194, 2.853961, 0.5019608, 0, 1, 1,
0.6802859, -1.188234, 1.815407, 0.5058824, 0, 1, 1,
0.6806998, 0.7348565, 1.164144, 0.5137255, 0, 1, 1,
0.680896, 0.8872736, 0.8153969, 0.5176471, 0, 1, 1,
0.6844242, 0.02810693, 3.425392, 0.5254902, 0, 1, 1,
0.6881257, -0.5316019, 2.804073, 0.5294118, 0, 1, 1,
0.6986035, -0.3923872, 2.505543, 0.5372549, 0, 1, 1,
0.6998737, -0.2898409, 1.900618, 0.5411765, 0, 1, 1,
0.7003351, 0.2616987, 0.07627895, 0.5490196, 0, 1, 1,
0.7006851, 1.704653, 0.1018119, 0.5529412, 0, 1, 1,
0.7030266, -0.2002455, 1.654959, 0.5607843, 0, 1, 1,
0.7096961, 1.541347, 1.569098, 0.5647059, 0, 1, 1,
0.7117019, 1.278695, 3.138233, 0.572549, 0, 1, 1,
0.7130994, 0.3662371, 0.4177108, 0.5764706, 0, 1, 1,
0.7146642, 1.376866, -1.120032, 0.5843138, 0, 1, 1,
0.7149843, -1.908801, 3.086002, 0.5882353, 0, 1, 1,
0.7212511, -0.1419911, 0.7840993, 0.5960785, 0, 1, 1,
0.7321036, -2.137444, 0.6036451, 0.6039216, 0, 1, 1,
0.7327272, -1.855675, 2.483371, 0.6078432, 0, 1, 1,
0.733942, 0.6315792, -0.6759219, 0.6156863, 0, 1, 1,
0.7398937, -0.499199, 2.302518, 0.6196079, 0, 1, 1,
0.7425202, 1.456212, 3.416542, 0.627451, 0, 1, 1,
0.7451618, -0.7153392, 1.359057, 0.6313726, 0, 1, 1,
0.7461247, 0.1779807, -0.1350884, 0.6392157, 0, 1, 1,
0.74663, -0.9510658, 2.549089, 0.6431373, 0, 1, 1,
0.7470152, -1.112613, 1.980856, 0.6509804, 0, 1, 1,
0.7476817, 0.3190722, 0.9274186, 0.654902, 0, 1, 1,
0.7506854, -1.217517, 2.2107, 0.6627451, 0, 1, 1,
0.7568014, 0.4065172, 2.019788, 0.6666667, 0, 1, 1,
0.7613801, -0.06557181, 0.9945629, 0.6745098, 0, 1, 1,
0.7636288, 0.4633742, 1.87236, 0.6784314, 0, 1, 1,
0.7636552, 1.354053, 0.5135742, 0.6862745, 0, 1, 1,
0.7638193, -2.462897, 3.061762, 0.6901961, 0, 1, 1,
0.7652356, 0.4648826, 0.864128, 0.6980392, 0, 1, 1,
0.7695869, -0.02389715, 2.16127, 0.7058824, 0, 1, 1,
0.7751282, 0.9719179, 1.545112, 0.7098039, 0, 1, 1,
0.7830899, 0.7913943, -0.8197082, 0.7176471, 0, 1, 1,
0.7865953, 0.1805172, 0.2549703, 0.7215686, 0, 1, 1,
0.7869185, 0.4491356, 1.119761, 0.7294118, 0, 1, 1,
0.7909759, -0.3790939, 2.475859, 0.7333333, 0, 1, 1,
0.7911487, -0.6924419, 1.940631, 0.7411765, 0, 1, 1,
0.7916605, 1.785643, -0.07558993, 0.7450981, 0, 1, 1,
0.799427, -0.06320336, 0.2350451, 0.7529412, 0, 1, 1,
0.8020634, 0.3092036, 0.1117984, 0.7568628, 0, 1, 1,
0.8044171, 0.3744222, 1.149568, 0.7647059, 0, 1, 1,
0.8045984, 1.067594, -0.5159672, 0.7686275, 0, 1, 1,
0.8086397, -0.1850497, 1.226445, 0.7764706, 0, 1, 1,
0.814161, -0.09019492, 0.9501348, 0.7803922, 0, 1, 1,
0.819196, 0.2449808, 1.123758, 0.7882353, 0, 1, 1,
0.8280191, 0.09454254, 2.980045, 0.7921569, 0, 1, 1,
0.8302183, 0.4324383, 0.6427944, 0.8, 0, 1, 1,
0.8329357, -0.1003281, 1.625535, 0.8078431, 0, 1, 1,
0.8340945, -0.4305671, 1.491583, 0.8117647, 0, 1, 1,
0.8555748, 0.1651982, 1.277161, 0.8196079, 0, 1, 1,
0.8584471, 0.9107061, -1.454791, 0.8235294, 0, 1, 1,
0.865469, -0.002785793, 1.283832, 0.8313726, 0, 1, 1,
0.871838, 1.473486, 1.648871, 0.8352941, 0, 1, 1,
0.8821021, 0.2597093, 2.029921, 0.8431373, 0, 1, 1,
0.8859489, 0.6971979, 0.9109742, 0.8470588, 0, 1, 1,
0.8889962, -0.6093391, 1.987055, 0.854902, 0, 1, 1,
0.893256, -1.588749, 2.753202, 0.8588235, 0, 1, 1,
0.8942756, -0.7617537, 0.6440257, 0.8666667, 0, 1, 1,
0.8968596, -0.4248356, 2.088732, 0.8705882, 0, 1, 1,
0.9076372, 0.08455613, 1.376426, 0.8784314, 0, 1, 1,
0.908715, 0.2756607, 2.322312, 0.8823529, 0, 1, 1,
0.9091343, -1.275202, 1.632754, 0.8901961, 0, 1, 1,
0.9104051, 1.570338, 0.6140487, 0.8941177, 0, 1, 1,
0.9106679, 0.9405829, -0.2963609, 0.9019608, 0, 1, 1,
0.9151846, -0.5667224, 1.761827, 0.9098039, 0, 1, 1,
0.9192001, 0.6099155, 2.077287, 0.9137255, 0, 1, 1,
0.9203739, 1.067814, 1.767897, 0.9215686, 0, 1, 1,
0.9236634, 1.286478, 2.42504, 0.9254902, 0, 1, 1,
0.9299378, 0.4121413, 1.090371, 0.9333333, 0, 1, 1,
0.9314266, -1.173316, 4.322397, 0.9372549, 0, 1, 1,
0.9336089, 1.619827, 1.663745, 0.945098, 0, 1, 1,
0.9383575, 0.1889573, -0.4649228, 0.9490196, 0, 1, 1,
0.9393677, -0.7058114, 2.61026, 0.9568627, 0, 1, 1,
0.945392, 0.6748556, 0.6958087, 0.9607843, 0, 1, 1,
0.9489573, -0.2743114, 1.598803, 0.9686275, 0, 1, 1,
0.9584128, 0.6662676, 0.8170443, 0.972549, 0, 1, 1,
0.9655418, 1.075714, -0.05734066, 0.9803922, 0, 1, 1,
0.9671668, 1.748383, 0.4016887, 0.9843137, 0, 1, 1,
0.9690818, 0.3514949, 0.3682299, 0.9921569, 0, 1, 1,
0.9751203, -1.649468, 2.161103, 0.9960784, 0, 1, 1,
0.9800327, -0.03498872, 0.3427286, 1, 0, 0.9960784, 1,
0.9806733, 0.5615594, 1.322544, 1, 0, 0.9882353, 1,
0.9853276, 0.02982474, 2.727122, 1, 0, 0.9843137, 1,
0.9939067, 2.401606, 2.158372, 1, 0, 0.9764706, 1,
0.9955338, 1.838295, 0.9510649, 1, 0, 0.972549, 1,
0.9967953, 0.1999143, 2.034303, 1, 0, 0.9647059, 1,
0.9991145, -0.3079072, 2.14443, 1, 0, 0.9607843, 1,
1.00519, 0.8223386, 0.3767438, 1, 0, 0.9529412, 1,
1.005398, -0.2520941, 1.705311, 1, 0, 0.9490196, 1,
1.006841, 0.9424034, 0.8424652, 1, 0, 0.9411765, 1,
1.011357, 0.4839209, 1.111202, 1, 0, 0.9372549, 1,
1.020216, 0.08954927, 0.6101179, 1, 0, 0.9294118, 1,
1.022848, -0.1188146, 2.556097, 1, 0, 0.9254902, 1,
1.025623, 2.220429, -0.241698, 1, 0, 0.9176471, 1,
1.029502, -1.785295, 2.789856, 1, 0, 0.9137255, 1,
1.029574, -0.05618077, 1.982391, 1, 0, 0.9058824, 1,
1.040571, -0.05653546, 1.456908, 1, 0, 0.9019608, 1,
1.054142, -0.3959562, 3.509683, 1, 0, 0.8941177, 1,
1.062204, 0.2501843, 3.573865, 1, 0, 0.8862745, 1,
1.064701, -0.1443706, 0.2609686, 1, 0, 0.8823529, 1,
1.065514, -2.471942, 2.445763, 1, 0, 0.8745098, 1,
1.088956, -0.2718989, 1.390691, 1, 0, 0.8705882, 1,
1.092023, -0.2260816, 0.7776402, 1, 0, 0.8627451, 1,
1.093812, 0.7237035, 1.269967, 1, 0, 0.8588235, 1,
1.095982, 1.063435, 0.5372, 1, 0, 0.8509804, 1,
1.098539, -0.8453186, 2.442203, 1, 0, 0.8470588, 1,
1.102984, -0.3531654, 2.147022, 1, 0, 0.8392157, 1,
1.10622, 1.038692, 1.786477, 1, 0, 0.8352941, 1,
1.115746, -1.621567, 2.577216, 1, 0, 0.827451, 1,
1.127257, 0.2827582, 2.439143, 1, 0, 0.8235294, 1,
1.144016, 1.653726, 1.264225, 1, 0, 0.8156863, 1,
1.145267, -0.1625544, 0.8328404, 1, 0, 0.8117647, 1,
1.147808, 0.269174, 0.9859958, 1, 0, 0.8039216, 1,
1.149706, -0.2952304, 1.105827, 1, 0, 0.7960784, 1,
1.151322, -0.7357841, 4.060735, 1, 0, 0.7921569, 1,
1.154097, -0.9399576, 2.134253, 1, 0, 0.7843137, 1,
1.154348, -0.7403103, 1.306846, 1, 0, 0.7803922, 1,
1.156732, 0.4388109, 2.785594, 1, 0, 0.772549, 1,
1.166587, -0.8372399, 2.777035, 1, 0, 0.7686275, 1,
1.168217, 1.64338, -1.47623, 1, 0, 0.7607843, 1,
1.168908, -0.1460014, 1.600525, 1, 0, 0.7568628, 1,
1.170372, -0.7231652, 2.90645, 1, 0, 0.7490196, 1,
1.174424, 1.703775, -0.6129246, 1, 0, 0.7450981, 1,
1.179846, 0.2086319, 1.061034, 1, 0, 0.7372549, 1,
1.17988, -0.2914683, 1.202745, 1, 0, 0.7333333, 1,
1.182171, 0.4503852, 1.537939, 1, 0, 0.7254902, 1,
1.187356, 0.5561095, 2.405122, 1, 0, 0.7215686, 1,
1.18807, -2.702819, 3.512321, 1, 0, 0.7137255, 1,
1.194493, 0.7556136, 0.8551572, 1, 0, 0.7098039, 1,
1.203317, -0.3685255, 3.203197, 1, 0, 0.7019608, 1,
1.206951, -1.227277, 3.436286, 1, 0, 0.6941177, 1,
1.214224, 0.9830122, 1.471632, 1, 0, 0.6901961, 1,
1.233522, -0.002427197, 1.666796, 1, 0, 0.682353, 1,
1.241396, 0.6135991, 0.8648512, 1, 0, 0.6784314, 1,
1.285773, -0.9750888, 2.793486, 1, 0, 0.6705883, 1,
1.293208, -0.1657837, 2.567963, 1, 0, 0.6666667, 1,
1.303278, 1.085267, -1.094998, 1, 0, 0.6588235, 1,
1.310377, -0.182485, 1.847924, 1, 0, 0.654902, 1,
1.312959, 0.6870447, -0.2663441, 1, 0, 0.6470588, 1,
1.322547, -0.9003507, 2.386552, 1, 0, 0.6431373, 1,
1.323631, 0.03394023, 1.286288, 1, 0, 0.6352941, 1,
1.327734, -0.5174668, 3.286655, 1, 0, 0.6313726, 1,
1.330698, 1.545585, -0.05965726, 1, 0, 0.6235294, 1,
1.332251, 0.001841518, 1.96761, 1, 0, 0.6196079, 1,
1.332316, -0.8577411, 1.232911, 1, 0, 0.6117647, 1,
1.345901, 0.02339508, 1.601472, 1, 0, 0.6078432, 1,
1.35376, 1.115317, 1.769, 1, 0, 0.6, 1,
1.358105, 1.30595, -0.4486746, 1, 0, 0.5921569, 1,
1.359788, -2.049496, 4.066418, 1, 0, 0.5882353, 1,
1.36289, -0.03232146, 0.6500358, 1, 0, 0.5803922, 1,
1.366689, -0.697849, -0.2331533, 1, 0, 0.5764706, 1,
1.368947, -1.006045, 4.392577, 1, 0, 0.5686275, 1,
1.373197, -2.088955, 2.364044, 1, 0, 0.5647059, 1,
1.376518, 0.006143836, 1.95596, 1, 0, 0.5568628, 1,
1.382088, -2.396234, 1.689259, 1, 0, 0.5529412, 1,
1.383639, -1.182631, 2.44096, 1, 0, 0.5450981, 1,
1.391859, 1.667207, 0.7319232, 1, 0, 0.5411765, 1,
1.393243, 1.399348, 2.227183, 1, 0, 0.5333334, 1,
1.398647, -0.007122914, 2.288542, 1, 0, 0.5294118, 1,
1.405355, 1.149796, -0.5931134, 1, 0, 0.5215687, 1,
1.408527, -0.4817597, 1.840304, 1, 0, 0.5176471, 1,
1.410694, 1.127119, -0.1534956, 1, 0, 0.509804, 1,
1.413417, -1.698959, 2.936262, 1, 0, 0.5058824, 1,
1.417399, -1.561972, 0.2496103, 1, 0, 0.4980392, 1,
1.419798, -0.7476611, 2.266855, 1, 0, 0.4901961, 1,
1.420985, 0.2160911, 0.495228, 1, 0, 0.4862745, 1,
1.443662, 1.036766, 1.669149, 1, 0, 0.4784314, 1,
1.448245, -1.371446, 1.470262, 1, 0, 0.4745098, 1,
1.448443, 1.954802, 0.5813738, 1, 0, 0.4666667, 1,
1.467247, 1.419281, 2.42094, 1, 0, 0.4627451, 1,
1.47701, -0.3302754, 1.326598, 1, 0, 0.454902, 1,
1.481479, -0.6055172, 2.838063, 1, 0, 0.4509804, 1,
1.483618, 1.017927, -0.8955751, 1, 0, 0.4431373, 1,
1.52624, -0.5292444, 2.412619, 1, 0, 0.4392157, 1,
1.533186, 1.348011, -1.212852, 1, 0, 0.4313726, 1,
1.536493, -1.245183, 2.561474, 1, 0, 0.427451, 1,
1.54256, -0.0566103, 1.451927, 1, 0, 0.4196078, 1,
1.543161, 0.237117, 1.860966, 1, 0, 0.4156863, 1,
1.552683, -0.4662213, 3.336368, 1, 0, 0.4078431, 1,
1.56996, 1.686269, 0.7433566, 1, 0, 0.4039216, 1,
1.578489, 0.4404894, 0.7720985, 1, 0, 0.3960784, 1,
1.588163, 0.8207784, 0.894894, 1, 0, 0.3882353, 1,
1.588332, 0.8937841, -1.196823, 1, 0, 0.3843137, 1,
1.591892, 0.4109828, 0.7273477, 1, 0, 0.3764706, 1,
1.599398, 2.047628, 0.2791561, 1, 0, 0.372549, 1,
1.603825, -0.9821165, 1.200521, 1, 0, 0.3647059, 1,
1.605817, -0.385935, 2.751954, 1, 0, 0.3607843, 1,
1.631168, 0.364138, 0.5641311, 1, 0, 0.3529412, 1,
1.631851, 0.06566791, 1.162273, 1, 0, 0.3490196, 1,
1.638448, 0.5959674, 0.214032, 1, 0, 0.3411765, 1,
1.643511, 0.1139983, 0.4850916, 1, 0, 0.3372549, 1,
1.649472, -0.6363469, 1.871456, 1, 0, 0.3294118, 1,
1.650372, 0.082998, 2.393026, 1, 0, 0.3254902, 1,
1.667707, 0.3533508, 2.021874, 1, 0, 0.3176471, 1,
1.672268, 0.6093574, 0.4167739, 1, 0, 0.3137255, 1,
1.695052, 0.702113, 0.7116582, 1, 0, 0.3058824, 1,
1.701415, -1.509747, 2.130548, 1, 0, 0.2980392, 1,
1.70456, -1.27436, 3.481265, 1, 0, 0.2941177, 1,
1.707375, -0.5850542, 1.937798, 1, 0, 0.2862745, 1,
1.730244, 1.342871, 1.169156, 1, 0, 0.282353, 1,
1.731262, -0.6443012, 3.09827, 1, 0, 0.2745098, 1,
1.734124, 0.4546587, 1.257604, 1, 0, 0.2705882, 1,
1.742923, 1.486432, -0.1233732, 1, 0, 0.2627451, 1,
1.750224, -0.07896235, 2.490629, 1, 0, 0.2588235, 1,
1.782204, -1.418699, 1.6805, 1, 0, 0.2509804, 1,
1.787479, 0.2798474, 1.675964, 1, 0, 0.2470588, 1,
1.808875, 0.435627, 2.409546, 1, 0, 0.2392157, 1,
1.809921, -0.5556001, 0.0680142, 1, 0, 0.2352941, 1,
1.829839, -0.8998643, 2.383826, 1, 0, 0.227451, 1,
1.830135, 0.4335995, 1.380617, 1, 0, 0.2235294, 1,
1.830369, -0.8331314, 2.442897, 1, 0, 0.2156863, 1,
1.83452, -1.920281, 1.029568, 1, 0, 0.2117647, 1,
1.858189, 0.5398202, -0.02115484, 1, 0, 0.2039216, 1,
1.875002, -0.1277159, 0.7231302, 1, 0, 0.1960784, 1,
1.896765, 1.156092, 0.976064, 1, 0, 0.1921569, 1,
1.905266, -0.08725926, 2.4873, 1, 0, 0.1843137, 1,
1.915921, -2.181337, 0.8981187, 1, 0, 0.1803922, 1,
1.917756, -0.2651017, 2.193414, 1, 0, 0.172549, 1,
1.955851, -1.719993, 1.168107, 1, 0, 0.1686275, 1,
1.970108, -1.484852, 1.833018, 1, 0, 0.1607843, 1,
1.97384, -0.7187104, 1.299881, 1, 0, 0.1568628, 1,
1.974372, -0.860473, 1.048305, 1, 0, 0.1490196, 1,
1.994082, -0.05161761, 2.489492, 1, 0, 0.145098, 1,
2.016479, 0.9518077, 2.418767, 1, 0, 0.1372549, 1,
2.023773, -0.8741846, 1.39973, 1, 0, 0.1333333, 1,
2.028712, 0.2198579, -0.1178928, 1, 0, 0.1254902, 1,
2.046908, 1.74619, 1.750801, 1, 0, 0.1215686, 1,
2.065589, 0.1661414, 0.1444243, 1, 0, 0.1137255, 1,
2.078083, 0.2976986, 0.9483017, 1, 0, 0.1098039, 1,
2.081856, 0.436823, 0.8444175, 1, 0, 0.1019608, 1,
2.094342, -0.531831, 2.705308, 1, 0, 0.09411765, 1,
2.104791, -1.115225, 2.219941, 1, 0, 0.09019608, 1,
2.112027, 0.009379209, 1.614545, 1, 0, 0.08235294, 1,
2.135983, 0.536811, 1.826328, 1, 0, 0.07843138, 1,
2.150761, 1.532942, 2.652575, 1, 0, 0.07058824, 1,
2.196923, 0.4057009, 0.07714395, 1, 0, 0.06666667, 1,
2.211025, -0.3361267, 2.082509, 1, 0, 0.05882353, 1,
2.216021, 0.6620319, 1.696735, 1, 0, 0.05490196, 1,
2.2225, -0.3480121, 2.263116, 1, 0, 0.04705882, 1,
2.295867, 0.6269078, -1.418178, 1, 0, 0.04313726, 1,
2.31024, -0.6622151, 2.281081, 1, 0, 0.03529412, 1,
2.314603, -1.406307, 1.134092, 1, 0, 0.03137255, 1,
2.341853, -0.6293818, 2.459776, 1, 0, 0.02352941, 1,
2.423206, -0.7397144, 2.02163, 1, 0, 0.01960784, 1,
2.45355, -1.302738, 1.801044, 1, 0, 0.01176471, 1,
2.5179, -0.6815354, 2.219198, 1, 0, 0.007843138, 1
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
-0.5664624, -4.968405, -7.269135, 0, -0.5, 0.5, 0.5,
-0.5664624, -4.968405, -7.269135, 1, -0.5, 0.5, 0.5,
-0.5664624, -4.968405, -7.269135, 1, 1.5, 0.5, 0.5,
-0.5664624, -4.968405, -7.269135, 0, 1.5, 0.5, 0.5
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
-4.696423, -0.3842221, -7.269135, 0, -0.5, 0.5, 0.5,
-4.696423, -0.3842221, -7.269135, 1, -0.5, 0.5, 0.5,
-4.696423, -0.3842221, -7.269135, 1, 1.5, 0.5, 0.5,
-4.696423, -0.3842221, -7.269135, 0, 1.5, 0.5, 0.5
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
-4.696423, -4.968405, -0.3630047, 0, -0.5, 0.5, 0.5,
-4.696423, -4.968405, -0.3630047, 1, -0.5, 0.5, 0.5,
-4.696423, -4.968405, -0.3630047, 1, 1.5, 0.5, 0.5,
-4.696423, -4.968405, -0.3630047, 0, 1.5, 0.5, 0.5
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
-3, -3.910517, -5.675413,
2, -3.910517, -5.675413,
-3, -3.910517, -5.675413,
-3, -4.086832, -5.941033,
-2, -3.910517, -5.675413,
-2, -4.086832, -5.941033,
-1, -3.910517, -5.675413,
-1, -4.086832, -5.941033,
0, -3.910517, -5.675413,
0, -4.086832, -5.941033,
1, -3.910517, -5.675413,
1, -4.086832, -5.941033,
2, -3.910517, -5.675413,
2, -4.086832, -5.941033
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
-3, -4.439461, -6.472274, 0, -0.5, 0.5, 0.5,
-3, -4.439461, -6.472274, 1, -0.5, 0.5, 0.5,
-3, -4.439461, -6.472274, 1, 1.5, 0.5, 0.5,
-3, -4.439461, -6.472274, 0, 1.5, 0.5, 0.5,
-2, -4.439461, -6.472274, 0, -0.5, 0.5, 0.5,
-2, -4.439461, -6.472274, 1, -0.5, 0.5, 0.5,
-2, -4.439461, -6.472274, 1, 1.5, 0.5, 0.5,
-2, -4.439461, -6.472274, 0, 1.5, 0.5, 0.5,
-1, -4.439461, -6.472274, 0, -0.5, 0.5, 0.5,
-1, -4.439461, -6.472274, 1, -0.5, 0.5, 0.5,
-1, -4.439461, -6.472274, 1, 1.5, 0.5, 0.5,
-1, -4.439461, -6.472274, 0, 1.5, 0.5, 0.5,
0, -4.439461, -6.472274, 0, -0.5, 0.5, 0.5,
0, -4.439461, -6.472274, 1, -0.5, 0.5, 0.5,
0, -4.439461, -6.472274, 1, 1.5, 0.5, 0.5,
0, -4.439461, -6.472274, 0, 1.5, 0.5, 0.5,
1, -4.439461, -6.472274, 0, -0.5, 0.5, 0.5,
1, -4.439461, -6.472274, 1, -0.5, 0.5, 0.5,
1, -4.439461, -6.472274, 1, 1.5, 0.5, 0.5,
1, -4.439461, -6.472274, 0, 1.5, 0.5, 0.5,
2, -4.439461, -6.472274, 0, -0.5, 0.5, 0.5,
2, -4.439461, -6.472274, 1, -0.5, 0.5, 0.5,
2, -4.439461, -6.472274, 1, 1.5, 0.5, 0.5,
2, -4.439461, -6.472274, 0, 1.5, 0.5, 0.5
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
-3.743355, -3, -5.675413,
-3.743355, 3, -5.675413,
-3.743355, -3, -5.675413,
-3.9022, -3, -5.941033,
-3.743355, -2, -5.675413,
-3.9022, -2, -5.941033,
-3.743355, -1, -5.675413,
-3.9022, -1, -5.941033,
-3.743355, 0, -5.675413,
-3.9022, 0, -5.941033,
-3.743355, 1, -5.675413,
-3.9022, 1, -5.941033,
-3.743355, 2, -5.675413,
-3.9022, 2, -5.941033,
-3.743355, 3, -5.675413,
-3.9022, 3, -5.941033
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
-4.219889, -3, -6.472274, 0, -0.5, 0.5, 0.5,
-4.219889, -3, -6.472274, 1, -0.5, 0.5, 0.5,
-4.219889, -3, -6.472274, 1, 1.5, 0.5, 0.5,
-4.219889, -3, -6.472274, 0, 1.5, 0.5, 0.5,
-4.219889, -2, -6.472274, 0, -0.5, 0.5, 0.5,
-4.219889, -2, -6.472274, 1, -0.5, 0.5, 0.5,
-4.219889, -2, -6.472274, 1, 1.5, 0.5, 0.5,
-4.219889, -2, -6.472274, 0, 1.5, 0.5, 0.5,
-4.219889, -1, -6.472274, 0, -0.5, 0.5, 0.5,
-4.219889, -1, -6.472274, 1, -0.5, 0.5, 0.5,
-4.219889, -1, -6.472274, 1, 1.5, 0.5, 0.5,
-4.219889, -1, -6.472274, 0, 1.5, 0.5, 0.5,
-4.219889, 0, -6.472274, 0, -0.5, 0.5, 0.5,
-4.219889, 0, -6.472274, 1, -0.5, 0.5, 0.5,
-4.219889, 0, -6.472274, 1, 1.5, 0.5, 0.5,
-4.219889, 0, -6.472274, 0, 1.5, 0.5, 0.5,
-4.219889, 1, -6.472274, 0, -0.5, 0.5, 0.5,
-4.219889, 1, -6.472274, 1, -0.5, 0.5, 0.5,
-4.219889, 1, -6.472274, 1, 1.5, 0.5, 0.5,
-4.219889, 1, -6.472274, 0, 1.5, 0.5, 0.5,
-4.219889, 2, -6.472274, 0, -0.5, 0.5, 0.5,
-4.219889, 2, -6.472274, 1, -0.5, 0.5, 0.5,
-4.219889, 2, -6.472274, 1, 1.5, 0.5, 0.5,
-4.219889, 2, -6.472274, 0, 1.5, 0.5, 0.5,
-4.219889, 3, -6.472274, 0, -0.5, 0.5, 0.5,
-4.219889, 3, -6.472274, 1, -0.5, 0.5, 0.5,
-4.219889, 3, -6.472274, 1, 1.5, 0.5, 0.5,
-4.219889, 3, -6.472274, 0, 1.5, 0.5, 0.5
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
-3.743355, -3.910517, -4,
-3.743355, -3.910517, 4,
-3.743355, -3.910517, -4,
-3.9022, -4.086832, -4,
-3.743355, -3.910517, -2,
-3.9022, -4.086832, -2,
-3.743355, -3.910517, 0,
-3.9022, -4.086832, 0,
-3.743355, -3.910517, 2,
-3.9022, -4.086832, 2,
-3.743355, -3.910517, 4,
-3.9022, -4.086832, 4
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
-4.219889, -4.439461, -4, 0, -0.5, 0.5, 0.5,
-4.219889, -4.439461, -4, 1, -0.5, 0.5, 0.5,
-4.219889, -4.439461, -4, 1, 1.5, 0.5, 0.5,
-4.219889, -4.439461, -4, 0, 1.5, 0.5, 0.5,
-4.219889, -4.439461, -2, 0, -0.5, 0.5, 0.5,
-4.219889, -4.439461, -2, 1, -0.5, 0.5, 0.5,
-4.219889, -4.439461, -2, 1, 1.5, 0.5, 0.5,
-4.219889, -4.439461, -2, 0, 1.5, 0.5, 0.5,
-4.219889, -4.439461, 0, 0, -0.5, 0.5, 0.5,
-4.219889, -4.439461, 0, 1, -0.5, 0.5, 0.5,
-4.219889, -4.439461, 0, 1, 1.5, 0.5, 0.5,
-4.219889, -4.439461, 0, 0, 1.5, 0.5, 0.5,
-4.219889, -4.439461, 2, 0, -0.5, 0.5, 0.5,
-4.219889, -4.439461, 2, 1, -0.5, 0.5, 0.5,
-4.219889, -4.439461, 2, 1, 1.5, 0.5, 0.5,
-4.219889, -4.439461, 2, 0, 1.5, 0.5, 0.5,
-4.219889, -4.439461, 4, 0, -0.5, 0.5, 0.5,
-4.219889, -4.439461, 4, 1, -0.5, 0.5, 0.5,
-4.219889, -4.439461, 4, 1, 1.5, 0.5, 0.5,
-4.219889, -4.439461, 4, 0, 1.5, 0.5, 0.5
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
-3.743355, -3.910517, -5.675413,
-3.743355, 3.142072, -5.675413,
-3.743355, -3.910517, 4.949403,
-3.743355, 3.142072, 4.949403,
-3.743355, -3.910517, -5.675413,
-3.743355, -3.910517, 4.949403,
-3.743355, 3.142072, -5.675413,
-3.743355, 3.142072, 4.949403,
-3.743355, -3.910517, -5.675413,
2.61043, -3.910517, -5.675413,
-3.743355, -3.910517, 4.949403,
2.61043, -3.910517, 4.949403,
-3.743355, 3.142072, -5.675413,
2.61043, 3.142072, -5.675413,
-3.743355, 3.142072, 4.949403,
2.61043, 3.142072, 4.949403,
2.61043, -3.910517, -5.675413,
2.61043, 3.142072, -5.675413,
2.61043, -3.910517, 4.949403,
2.61043, 3.142072, 4.949403,
2.61043, -3.910517, -5.675413,
2.61043, -3.910517, 4.949403,
2.61043, 3.142072, -5.675413,
2.61043, 3.142072, 4.949403
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
var radius = 7.607983;
var distance = 33.84878;
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
mvMatrix.translate( 0.5664624, 0.3842221, 0.3630047 );
mvMatrix.scale( 1.294646, 1.166366, 0.7742158 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.84878);
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
tribenuron-methyl<-read.table("tribenuron-methyl.xyz")
```

```
## Error in read.table("tribenuron-methyl.xyz"): no lines available in input
```

```r
x<-tribenuron-methyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'tribenuron' not found
```

```r
y<-tribenuron-methyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'tribenuron' not found
```

```r
z<-tribenuron-methyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'tribenuron' not found
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
-3.650824, 1.328382, -0.4543954, 0, 0, 1, 1, 1,
-2.855828, 1.230652, -1.80214, 1, 0, 0, 1, 1,
-2.823528, -0.6539498, -1.495839, 1, 0, 0, 1, 1,
-2.800194, 0.05986376, -0.5497073, 1, 0, 0, 1, 1,
-2.623951, -0.4364343, -0.2634711, 1, 0, 0, 1, 1,
-2.546353, 0.2891704, -2.568066, 1, 0, 0, 1, 1,
-2.459652, -2.318467, -1.80765, 0, 0, 0, 1, 1,
-2.450701, -3.259799, -1.770522, 0, 0, 0, 1, 1,
-2.350163, -0.5595561, -1.782309, 0, 0, 0, 1, 1,
-2.346375, 0.397909, 0.007751612, 0, 0, 0, 1, 1,
-2.285262, -2.121701, -0.9820802, 0, 0, 0, 1, 1,
-2.278571, 1.131518, -0.5726123, 0, 0, 0, 1, 1,
-2.265252, 0.4150296, 0.1287531, 0, 0, 0, 1, 1,
-2.222627, 0.4193122, -0.7462101, 1, 1, 1, 1, 1,
-2.20768, 0.2242682, -1.775889, 1, 1, 1, 1, 1,
-2.150308, 0.1845921, -2.857741, 1, 1, 1, 1, 1,
-2.129589, 1.823397, -0.686384, 1, 1, 1, 1, 1,
-2.105192, -1.56385, 0.4929575, 1, 1, 1, 1, 1,
-2.093776, -0.04024101, -2.316091, 1, 1, 1, 1, 1,
-2.086626, -1.25699, -2.621438, 1, 1, 1, 1, 1,
-2.077984, -0.6168479, -1.579477, 1, 1, 1, 1, 1,
-2.076705, 1.810708, -0.776781, 1, 1, 1, 1, 1,
-2.052085, 2.245342, -0.1847823, 1, 1, 1, 1, 1,
-2.043, -0.7858484, -2.55138, 1, 1, 1, 1, 1,
-1.991416, -0.4908352, -2.510464, 1, 1, 1, 1, 1,
-1.987753, 0.8636286, -0.1606948, 1, 1, 1, 1, 1,
-1.981124, 0.705166, 0.06155316, 1, 1, 1, 1, 1,
-1.975061, -0.2809465, -1.465214, 1, 1, 1, 1, 1,
-1.958574, 1.499122, 0.4231503, 0, 0, 1, 1, 1,
-1.919853, 1.309664, -1.868008, 1, 0, 0, 1, 1,
-1.885796, -0.3656706, -0.9226754, 1, 0, 0, 1, 1,
-1.879858, 1.141593, 0.06972271, 1, 0, 0, 1, 1,
-1.860983, 0.6237853, -0.3610253, 1, 0, 0, 1, 1,
-1.850352, -0.1838531, -0.6937307, 1, 0, 0, 1, 1,
-1.848992, -0.3945248, -0.5158609, 0, 0, 0, 1, 1,
-1.825989, -0.5764196, -0.7444521, 0, 0, 0, 1, 1,
-1.800578, 1.637392, -3.29398, 0, 0, 0, 1, 1,
-1.768189, 1.095793, -1.699888, 0, 0, 0, 1, 1,
-1.766564, -0.16881, -1.932774, 0, 0, 0, 1, 1,
-1.765021, -0.7039407, -0.6689429, 0, 0, 0, 1, 1,
-1.761027, 2.734705, -1.834914, 0, 0, 0, 1, 1,
-1.73733, 0.07693882, -4.203376, 1, 1, 1, 1, 1,
-1.7279, -0.335984, -1.815722, 1, 1, 1, 1, 1,
-1.725767, -1.57926, -3.195287, 1, 1, 1, 1, 1,
-1.7181, 0.2534525, -1.788139, 1, 1, 1, 1, 1,
-1.705106, -0.4508285, -0.8346509, 1, 1, 1, 1, 1,
-1.692196, 1.294943, -1.180205, 1, 1, 1, 1, 1,
-1.680328, 1.123211, -0.6810831, 1, 1, 1, 1, 1,
-1.675452, 1.140512, -0.2115632, 1, 1, 1, 1, 1,
-1.662009, 0.2791558, -2.288605, 1, 1, 1, 1, 1,
-1.651222, 0.3334533, -1.074549, 1, 1, 1, 1, 1,
-1.618531, 0.3819211, -0.5128157, 1, 1, 1, 1, 1,
-1.615335, -0.7886612, -0.5893168, 1, 1, 1, 1, 1,
-1.613288, 0.447995, -2.897317, 1, 1, 1, 1, 1,
-1.610237, -1.103329, -1.67254, 1, 1, 1, 1, 1,
-1.60847, -1.190074, -2.368679, 1, 1, 1, 1, 1,
-1.605928, -0.6169853, -1.568651, 0, 0, 1, 1, 1,
-1.584236, 0.343413, -2.227511, 1, 0, 0, 1, 1,
-1.578444, 1.259905, -1.307301, 1, 0, 0, 1, 1,
-1.572049, -0.1093746, -3.045826, 1, 0, 0, 1, 1,
-1.563787, 1.705369, -0.503681, 1, 0, 0, 1, 1,
-1.549445, -0.2354458, -2.064399, 1, 0, 0, 1, 1,
-1.54833, 0.667353, -0.4348801, 0, 0, 0, 1, 1,
-1.547119, -0.1981757, -1.515343, 0, 0, 0, 1, 1,
-1.542286, -0.5296685, -1.587118, 0, 0, 0, 1, 1,
-1.535111, -1.238056, -1.916052, 0, 0, 0, 1, 1,
-1.51362, 0.2339841, -2.054523, 0, 0, 0, 1, 1,
-1.509193, 0.4163999, -1.024809, 0, 0, 0, 1, 1,
-1.491944, -0.6360083, -0.767978, 0, 0, 0, 1, 1,
-1.482519, 0.314266, -1.67668, 1, 1, 1, 1, 1,
-1.460732, 2.429089, -1.805519, 1, 1, 1, 1, 1,
-1.431532, 1.200378, -1.436641, 1, 1, 1, 1, 1,
-1.427992, 1.73956, -1.250995, 1, 1, 1, 1, 1,
-1.424378, -1.101039, -3.262429, 1, 1, 1, 1, 1,
-1.41625, -0.06790811, -1.518018, 1, 1, 1, 1, 1,
-1.415868, 0.04124529, -1.745871, 1, 1, 1, 1, 1,
-1.412434, 1.461228, -0.4863494, 1, 1, 1, 1, 1,
-1.401492, 1.81607, -1.765648, 1, 1, 1, 1, 1,
-1.39024, 0.0954252, -1.975771, 1, 1, 1, 1, 1,
-1.378528, -1.037822, -1.167263, 1, 1, 1, 1, 1,
-1.373422, -0.9498623, -3.050518, 1, 1, 1, 1, 1,
-1.369855, 0.6795042, -1.597057, 1, 1, 1, 1, 1,
-1.35634, -1.386141, -2.95236, 1, 1, 1, 1, 1,
-1.355458, -0.320671, -0.4549187, 1, 1, 1, 1, 1,
-1.338079, -0.04385504, -2.807961, 0, 0, 1, 1, 1,
-1.337037, 0.7141468, -0.5594859, 1, 0, 0, 1, 1,
-1.324641, -0.9444159, -2.658745, 1, 0, 0, 1, 1,
-1.321577, -0.6022601, -1.053482, 1, 0, 0, 1, 1,
-1.321414, -0.5984012, -0.4859934, 1, 0, 0, 1, 1,
-1.314974, 0.4966891, -0.2719203, 1, 0, 0, 1, 1,
-1.307629, 0.8199789, -2.189497, 0, 0, 0, 1, 1,
-1.306213, -1.525336, -2.769435, 0, 0, 0, 1, 1,
-1.306211, 0.1108508, -0.6726512, 0, 0, 0, 1, 1,
-1.300681, -2.046492, -2.058124, 0, 0, 0, 1, 1,
-1.293867, 0.3299269, -1.236421, 0, 0, 0, 1, 1,
-1.291777, 0.9045339, -1.493806, 0, 0, 0, 1, 1,
-1.287396, 0.6166714, -1.778349, 0, 0, 0, 1, 1,
-1.279985, 0.7970433, 0.05924364, 1, 1, 1, 1, 1,
-1.278545, -0.1232242, -2.35621, 1, 1, 1, 1, 1,
-1.258505, -0.9572946, -2.813195, 1, 1, 1, 1, 1,
-1.254114, -0.9697235, -2.81769, 1, 1, 1, 1, 1,
-1.248446, -0.6563588, -1.643732, 1, 1, 1, 1, 1,
-1.247446, -0.09372221, -0.543052, 1, 1, 1, 1, 1,
-1.240782, -0.8776339, -1.986451, 1, 1, 1, 1, 1,
-1.239678, -1.713532, -2.089967, 1, 1, 1, 1, 1,
-1.235612, 2.438654, -0.6033196, 1, 1, 1, 1, 1,
-1.232383, -0.7325392, -2.181212, 1, 1, 1, 1, 1,
-1.227376, -0.172444, -1.745776, 1, 1, 1, 1, 1,
-1.223615, 0.5857671, -1.005558, 1, 1, 1, 1, 1,
-1.21854, 1.162874, -1.219849, 1, 1, 1, 1, 1,
-1.20613, -1.045377, -2.276984, 1, 1, 1, 1, 1,
-1.202157, -0.8144585, -3.474831, 1, 1, 1, 1, 1,
-1.201913, 0.5380951, -0.7668979, 0, 0, 1, 1, 1,
-1.201467, 0.5836883, 0.7840928, 1, 0, 0, 1, 1,
-1.198481, -1.044685, -1.389935, 1, 0, 0, 1, 1,
-1.193671, 0.4689901, -0.8531263, 1, 0, 0, 1, 1,
-1.182644, -1.217359, -1.589102, 1, 0, 0, 1, 1,
-1.179856, -1.236127, -2.996811, 1, 0, 0, 1, 1,
-1.178631, 0.8464839, -0.5084826, 0, 0, 0, 1, 1,
-1.176685, 0.597509, -2.371316, 0, 0, 0, 1, 1,
-1.17197, -2.000147, -2.739261, 0, 0, 0, 1, 1,
-1.167748, 0.8140292, -1.659471, 0, 0, 0, 1, 1,
-1.144659, -1.760217, -3.310776, 0, 0, 0, 1, 1,
-1.13801, 0.4047008, -1.37007, 0, 0, 0, 1, 1,
-1.136527, -0.2007457, -1.945074, 0, 0, 0, 1, 1,
-1.136436, 0.8594821, 0.08956033, 1, 1, 1, 1, 1,
-1.134033, 0.6511528, -0.1518127, 1, 1, 1, 1, 1,
-1.130773, -0.3955193, -1.558658, 1, 1, 1, 1, 1,
-1.121702, -0.6213598, -0.6579361, 1, 1, 1, 1, 1,
-1.115795, -0.6188644, -1.982115, 1, 1, 1, 1, 1,
-1.115731, 0.6504247, -1.699483, 1, 1, 1, 1, 1,
-1.098757, 0.3668053, -2.017307, 1, 1, 1, 1, 1,
-1.077064, -0.7545905, -3.090438, 1, 1, 1, 1, 1,
-1.075506, 0.1857558, 0.4029344, 1, 1, 1, 1, 1,
-1.063689, 1.115708, -1.452686, 1, 1, 1, 1, 1,
-1.057951, -0.4374082, -1.94723, 1, 1, 1, 1, 1,
-1.052159, -0.5270505, -1.881204, 1, 1, 1, 1, 1,
-1.051146, -0.6545485, -1.644265, 1, 1, 1, 1, 1,
-1.050095, 0.4775894, -0.7939028, 1, 1, 1, 1, 1,
-1.049151, -1.95554, -2.319719, 1, 1, 1, 1, 1,
-1.048333, -0.8029336, -3.089671, 0, 0, 1, 1, 1,
-1.046342, 0.4382384, -1.031555, 1, 0, 0, 1, 1,
-1.04601, 0.7790853, -1.923571, 1, 0, 0, 1, 1,
-1.045712, -0.3404001, -1.509226, 1, 0, 0, 1, 1,
-1.039003, -0.1287258, -1.229341, 1, 0, 0, 1, 1,
-1.031765, 0.2839476, -2.09025, 1, 0, 0, 1, 1,
-1.028991, 1.990485, -0.6659317, 0, 0, 0, 1, 1,
-1.027917, 0.8150027, -0.2099597, 0, 0, 0, 1, 1,
-1.01709, -1.243826, -2.596166, 0, 0, 0, 1, 1,
-1.014659, 0.1610267, -1.675889, 0, 0, 0, 1, 1,
-1.010505, -0.7286589, -1.985636, 0, 0, 0, 1, 1,
-1.005181, 0.9339345, 0.3166033, 0, 0, 0, 1, 1,
-1.002681, -0.2129007, -1.220376, 0, 0, 0, 1, 1,
-0.9986953, -0.8361966, -1.869712, 1, 1, 1, 1, 1,
-0.994915, 0.1763667, -1.34265, 1, 1, 1, 1, 1,
-0.9893983, -1.101218, -1.729643, 1, 1, 1, 1, 1,
-0.9741673, -0.2963487, -3.193097, 1, 1, 1, 1, 1,
-0.9736686, -0.2841487, -2.263389, 1, 1, 1, 1, 1,
-0.9715441, 2.43902, 0.6911417, 1, 1, 1, 1, 1,
-0.9702492, 0.7782322, 0.891293, 1, 1, 1, 1, 1,
-0.956119, -0.0610202, -1.72031, 1, 1, 1, 1, 1,
-0.9513834, 0.9261659, 0.0236999, 1, 1, 1, 1, 1,
-0.9442995, 0.5345522, -2.463628, 1, 1, 1, 1, 1,
-0.9431976, -0.788752, -3.617847, 1, 1, 1, 1, 1,
-0.940652, -0.0007805653, -1.894386, 1, 1, 1, 1, 1,
-0.9302731, 0.04440787, -2.255956, 1, 1, 1, 1, 1,
-0.9251845, -0.5561336, -2.222753, 1, 1, 1, 1, 1,
-0.923876, -1.061441, -1.928568, 1, 1, 1, 1, 1,
-0.9167904, 1.155035, -1.333666, 0, 0, 1, 1, 1,
-0.9141693, 0.06375851, -0.8490117, 1, 0, 0, 1, 1,
-0.9129175, -0.3291375, -1.458491, 1, 0, 0, 1, 1,
-0.9082, 0.9633603, -1.876648, 1, 0, 0, 1, 1,
-0.9058135, -1.236411, -3.95787, 1, 0, 0, 1, 1,
-0.9049438, 0.5783375, -3.361353, 1, 0, 0, 1, 1,
-0.8985313, -0.6414213, -1.210346, 0, 0, 0, 1, 1,
-0.8973849, -0.1653185, -2.459723, 0, 0, 0, 1, 1,
-0.8898038, 0.2343489, -0.394974, 0, 0, 0, 1, 1,
-0.879979, 0.8834472, 1.346463, 0, 0, 0, 1, 1,
-0.8763586, -0.5427925, -1.764679, 0, 0, 0, 1, 1,
-0.8752049, 0.8862703, -0.7124801, 0, 0, 0, 1, 1,
-0.8709065, 0.3005274, -2.393756, 0, 0, 0, 1, 1,
-0.8652826, 0.2489162, -0.4084734, 1, 1, 1, 1, 1,
-0.8649856, -0.005451968, 1.14415, 1, 1, 1, 1, 1,
-0.8648976, 0.2887887, -2.207071, 1, 1, 1, 1, 1,
-0.8646461, 0.4547607, -0.9194384, 1, 1, 1, 1, 1,
-0.8629604, -0.8343413, -1.635728, 1, 1, 1, 1, 1,
-0.8600115, 1.0142, -1.469188, 1, 1, 1, 1, 1,
-0.8544248, 0.3202848, -1.545586, 1, 1, 1, 1, 1,
-0.8541768, 0.4962997, 0.6116849, 1, 1, 1, 1, 1,
-0.8483891, -0.7457721, -2.702893, 1, 1, 1, 1, 1,
-0.8452895, 0.04468949, -2.16142, 1, 1, 1, 1, 1,
-0.8381249, -1.400235, -3.239074, 1, 1, 1, 1, 1,
-0.8255529, 1.784024, -1.31642, 1, 1, 1, 1, 1,
-0.8253838, 1.345881, 0.5538585, 1, 1, 1, 1, 1,
-0.8221056, 0.1570469, -0.9457186, 1, 1, 1, 1, 1,
-0.8203582, 1.512542, 0.5655174, 1, 1, 1, 1, 1,
-0.8157565, 0.4158147, -1.149102, 0, 0, 1, 1, 1,
-0.8091494, -0.2763109, -1.714451, 1, 0, 0, 1, 1,
-0.804024, -0.03625686, -2.423085, 1, 0, 0, 1, 1,
-0.7963105, -0.2824644, -2.396739, 1, 0, 0, 1, 1,
-0.7799247, -2.077147, -1.959838, 1, 0, 0, 1, 1,
-0.7782778, 0.3205246, -2.272929, 1, 0, 0, 1, 1,
-0.7774219, -0.1929962, -1.53051, 0, 0, 0, 1, 1,
-0.7747126, 1.492225, 0.05473716, 0, 0, 0, 1, 1,
-0.769946, 0.9334487, -0.4322771, 0, 0, 0, 1, 1,
-0.7598155, -0.5559194, -1.033234, 0, 0, 0, 1, 1,
-0.7555515, -0.06497163, -2.123261, 0, 0, 0, 1, 1,
-0.7553244, -0.2192735, -1.952317, 0, 0, 0, 1, 1,
-0.7534157, -1.427087, -2.303676, 0, 0, 0, 1, 1,
-0.7506783, 0.3754981, -1.813467, 1, 1, 1, 1, 1,
-0.7496893, -0.6959795, -2.23822, 1, 1, 1, 1, 1,
-0.7476768, 0.5139554, -2.095268, 1, 1, 1, 1, 1,
-0.7469723, 0.1432037, -2.952997, 1, 1, 1, 1, 1,
-0.7453834, 0.2328985, 1.209369, 1, 1, 1, 1, 1,
-0.7395121, -0.02050812, -0.6358944, 1, 1, 1, 1, 1,
-0.7366771, -1.013009, -3.357668, 1, 1, 1, 1, 1,
-0.7361764, -0.05854901, 1.157182, 1, 1, 1, 1, 1,
-0.7345931, 0.239822, 0.2245329, 1, 1, 1, 1, 1,
-0.7222356, -1.108495, -1.641598, 1, 1, 1, 1, 1,
-0.7107785, -1.150024, -2.252938, 1, 1, 1, 1, 1,
-0.7101761, -0.5144685, -2.043958, 1, 1, 1, 1, 1,
-0.7064576, 0.1430926, -1.043598, 1, 1, 1, 1, 1,
-0.7063281, 0.1447328, -0.8300405, 1, 1, 1, 1, 1,
-0.7005714, -0.1828758, -1.537193, 1, 1, 1, 1, 1,
-0.7005146, -3.020941, -3.402927, 0, 0, 1, 1, 1,
-0.6984466, -0.809023, -1.336489, 1, 0, 0, 1, 1,
-0.6967101, -1.057718, -4.113151, 1, 0, 0, 1, 1,
-0.6946326, 0.5559004, -0.8819104, 1, 0, 0, 1, 1,
-0.6943393, 0.8777271, -1.405095, 1, 0, 0, 1, 1,
-0.6941717, 0.514551, -0.7108758, 1, 0, 0, 1, 1,
-0.693268, 0.6623322, -1.178704, 0, 0, 0, 1, 1,
-0.689088, -0.6697083, -2.68902, 0, 0, 0, 1, 1,
-0.6857379, -1.312665, -3.124553, 0, 0, 0, 1, 1,
-0.6827977, -1.363525, -3.343871, 0, 0, 0, 1, 1,
-0.6757729, 2.293654, 0.602307, 0, 0, 0, 1, 1,
-0.6745633, -0.05306323, -1.383559, 0, 0, 0, 1, 1,
-0.6739216, -0.7694057, -2.360682, 0, 0, 0, 1, 1,
-0.6704817, 1.033552, -0.5924463, 1, 1, 1, 1, 1,
-0.658641, 1.862562, -0.628289, 1, 1, 1, 1, 1,
-0.6546652, 1.113923, -0.5157921, 1, 1, 1, 1, 1,
-0.6453604, 0.455061, -0.4692449, 1, 1, 1, 1, 1,
-0.6400929, 1.555432, -0.01272083, 1, 1, 1, 1, 1,
-0.6370789, 0.2915033, -1.429204, 1, 1, 1, 1, 1,
-0.6334952, -1.017712, -2.981686, 1, 1, 1, 1, 1,
-0.6325223, 1.684496, -0.8111481, 1, 1, 1, 1, 1,
-0.6280506, -0.2260825, -1.629533, 1, 1, 1, 1, 1,
-0.6279665, -0.7121807, -4.430203, 1, 1, 1, 1, 1,
-0.6269709, 0.4328434, -2.110396, 1, 1, 1, 1, 1,
-0.6253643, 0.9047408, -0.585259, 1, 1, 1, 1, 1,
-0.6243395, -0.4486982, -0.8972486, 1, 1, 1, 1, 1,
-0.623466, 1.244668, -1.596688, 1, 1, 1, 1, 1,
-0.6210762, -0.2618309, -2.99305, 1, 1, 1, 1, 1,
-0.6182527, -0.3524988, -2.736749, 0, 0, 1, 1, 1,
-0.6174957, 0.07791591, -1.671182, 1, 0, 0, 1, 1,
-0.617282, 0.4835236, -0.8401138, 1, 0, 0, 1, 1,
-0.6167686, 0.6869032, -0.7006462, 1, 0, 0, 1, 1,
-0.6111359, -1.674568, -3.044733, 1, 0, 0, 1, 1,
-0.607006, 0.526131, -0.7470913, 1, 0, 0, 1, 1,
-0.6029013, -0.817342, -4.259301, 0, 0, 0, 1, 1,
-0.5908858, 1.166847, 0.4544183, 0, 0, 0, 1, 1,
-0.5907797, -0.6104915, -3.507617, 0, 0, 0, 1, 1,
-0.5878919, 0.7827062, 0.2111479, 0, 0, 0, 1, 1,
-0.5866414, 0.8066668, -0.2442573, 0, 0, 0, 1, 1,
-0.5865526, 0.007637803, -0.3228765, 0, 0, 0, 1, 1,
-0.5850444, 1.240749, -1.445712, 0, 0, 0, 1, 1,
-0.5822247, -0.1476198, -3.354598, 1, 1, 1, 1, 1,
-0.5789911, -1.654888, -3.034164, 1, 1, 1, 1, 1,
-0.5744029, -1.305181, -2.710458, 1, 1, 1, 1, 1,
-0.5694515, -1.41581, -3.752058, 1, 1, 1, 1, 1,
-0.5690261, -0.8154406, -2.367244, 1, 1, 1, 1, 1,
-0.5676762, -0.268599, -0.5874565, 1, 1, 1, 1, 1,
-0.5667565, 0.176333, -1.613586, 1, 1, 1, 1, 1,
-0.5552556, 0.5126244, -0.6937853, 1, 1, 1, 1, 1,
-0.5526657, 0.2385136, 0.5120417, 1, 1, 1, 1, 1,
-0.5525183, -0.1849733, -1.939082, 1, 1, 1, 1, 1,
-0.5523072, 0.06658155, -2.184129, 1, 1, 1, 1, 1,
-0.5441381, -0.7996538, -2.993632, 1, 1, 1, 1, 1,
-0.5421807, -1.430455, -0.5990713, 1, 1, 1, 1, 1,
-0.5420074, -0.4196878, -0.4995097, 1, 1, 1, 1, 1,
-0.5391536, 0.1291278, -2.736571, 1, 1, 1, 1, 1,
-0.5294535, 0.03027834, -2.232196, 0, 0, 1, 1, 1,
-0.5258476, 1.076316, -1.166331, 1, 0, 0, 1, 1,
-0.5250357, -1.997881, -4.256621, 1, 0, 0, 1, 1,
-0.5141925, -0.2319735, -1.749544, 1, 0, 0, 1, 1,
-0.5128833, -0.02766807, -3.297226, 1, 0, 0, 1, 1,
-0.5122326, -0.593752, -2.328847, 1, 0, 0, 1, 1,
-0.5095293, -1.362762, -4.030393, 0, 0, 0, 1, 1,
-0.5087163, 0.8541189, -1.996932, 0, 0, 0, 1, 1,
-0.5085898, -0.2158166, -3.459193, 0, 0, 0, 1, 1,
-0.5072807, -1.76639, -2.869939, 0, 0, 0, 1, 1,
-0.5023686, -0.2815252, -1.962521, 0, 0, 0, 1, 1,
-0.5003428, 1.522498, -1.180932, 0, 0, 0, 1, 1,
-0.4997002, 0.8406753, -0.9846048, 0, 0, 0, 1, 1,
-0.4982576, -1.731877, -2.67831, 1, 1, 1, 1, 1,
-0.4842223, -0.3503367, -1.45111, 1, 1, 1, 1, 1,
-0.4821444, 1.662405, -1.538818, 1, 1, 1, 1, 1,
-0.4764899, -0.2301902, -2.807007, 1, 1, 1, 1, 1,
-0.4755102, 0.8285193, -2.623591, 1, 1, 1, 1, 1,
-0.4707695, -1.532448, -4.439683, 1, 1, 1, 1, 1,
-0.4699579, -0.4891789, -0.9499736, 1, 1, 1, 1, 1,
-0.4695672, 0.5038327, -0.05177657, 1, 1, 1, 1, 1,
-0.4673028, 1.080869, -0.4771906, 1, 1, 1, 1, 1,
-0.4652203, -0.1298657, -0.8242503, 1, 1, 1, 1, 1,
-0.4602157, -0.2558872, -1.662333, 1, 1, 1, 1, 1,
-0.4569004, 0.5315287, 0.6474777, 1, 1, 1, 1, 1,
-0.454892, 1.043242, -1.119772, 1, 1, 1, 1, 1,
-0.4493503, -0.1407653, -2.929136, 1, 1, 1, 1, 1,
-0.4457257, 1.351323, -0.5906394, 1, 1, 1, 1, 1,
-0.4446577, -0.3215067, -2.577414, 0, 0, 1, 1, 1,
-0.4442686, -1.000471, -2.870894, 1, 0, 0, 1, 1,
-0.4412543, -1.259732, -2.957844, 1, 0, 0, 1, 1,
-0.439486, -0.3640464, -2.668878, 1, 0, 0, 1, 1,
-0.4383609, 0.810802, -0.6692098, 1, 0, 0, 1, 1,
-0.4364288, 1.933689, -0.1998393, 1, 0, 0, 1, 1,
-0.436267, 0.6195238, 1.006245, 0, 0, 0, 1, 1,
-0.4338274, -1.453479, -4.649108, 0, 0, 0, 1, 1,
-0.4300756, 0.7519547, -0.3907048, 0, 0, 0, 1, 1,
-0.4283734, -1.281929, -2.448676, 0, 0, 0, 1, 1,
-0.4281799, -0.01120441, -1.661023, 0, 0, 0, 1, 1,
-0.4258224, 0.931584, -0.8974793, 0, 0, 0, 1, 1,
-0.4246407, -0.4098531, -1.908006, 0, 0, 0, 1, 1,
-0.4189266, -0.08835973, -2.903935, 1, 1, 1, 1, 1,
-0.4125529, 1.096265, -1.899416, 1, 1, 1, 1, 1,
-0.4111299, 0.2476468, -1.160008, 1, 1, 1, 1, 1,
-0.4097885, -0.369895, -1.030035, 1, 1, 1, 1, 1,
-0.4089341, 0.252432, 0.2441972, 1, 1, 1, 1, 1,
-0.4053416, -1.168792, -3.430256, 1, 1, 1, 1, 1,
-0.4050308, 0.2584398, 1.383858, 1, 1, 1, 1, 1,
-0.4036706, 1.121187, -1.329132, 1, 1, 1, 1, 1,
-0.4003283, 0.07455754, -0.6926386, 1, 1, 1, 1, 1,
-0.3968012, 1.085618, -0.6971739, 1, 1, 1, 1, 1,
-0.3959635, 1.503153, -0.9477673, 1, 1, 1, 1, 1,
-0.3917259, 1.27846, -1.116481, 1, 1, 1, 1, 1,
-0.3913985, -1.03398, -1.037305, 1, 1, 1, 1, 1,
-0.3896105, 1.193714, 0.6414852, 1, 1, 1, 1, 1,
-0.38866, -2.086039, -1.974862, 1, 1, 1, 1, 1,
-0.3854692, 0.7794628, 0.964688, 0, 0, 1, 1, 1,
-0.3850226, 1.006683, 0.550198, 1, 0, 0, 1, 1,
-0.3845728, 1.179531, 1.324042, 1, 0, 0, 1, 1,
-0.3825561, -0.1183321, -3.936772, 1, 0, 0, 1, 1,
-0.3824633, -0.7020406, -1.462955, 1, 0, 0, 1, 1,
-0.3791176, 0.267902, -0.03408392, 1, 0, 0, 1, 1,
-0.3787064, -0.610894, -3.224312, 0, 0, 0, 1, 1,
-0.3740175, -0.0606757, -1.146572, 0, 0, 0, 1, 1,
-0.3690747, -1.064549, -2.29844, 0, 0, 0, 1, 1,
-0.367126, -0.8296129, -2.500806, 0, 0, 0, 1, 1,
-0.3664409, -0.6852796, -1.953129, 0, 0, 0, 1, 1,
-0.3646432, 0.9877601, -0.8771396, 0, 0, 0, 1, 1,
-0.363989, -0.9689535, -2.146545, 0, 0, 0, 1, 1,
-0.3608076, 0.009335069, -1.049434, 1, 1, 1, 1, 1,
-0.360325, -1.307315, -1.828441, 1, 1, 1, 1, 1,
-0.3596727, -0.9955838, -3.33992, 1, 1, 1, 1, 1,
-0.3594517, 0.3053201, 0.4485123, 1, 1, 1, 1, 1,
-0.3580089, 0.561779, -3.276762, 1, 1, 1, 1, 1,
-0.3572833, -1.824631, -2.054379, 1, 1, 1, 1, 1,
-0.3549252, -0.06897128, -1.9405, 1, 1, 1, 1, 1,
-0.3475938, -1.153012, -3.672692, 1, 1, 1, 1, 1,
-0.3471967, 0.9223737, -0.4488676, 1, 1, 1, 1, 1,
-0.347111, 1.856692, -0.4196326, 1, 1, 1, 1, 1,
-0.3461688, 0.673153, 0.2811536, 1, 1, 1, 1, 1,
-0.3337073, -0.8963447, -4.247676, 1, 1, 1, 1, 1,
-0.3325872, -0.7255545, -2.712774, 1, 1, 1, 1, 1,
-0.3306698, 1.459134, -0.1088537, 1, 1, 1, 1, 1,
-0.327292, 0.777626, 1.790694, 1, 1, 1, 1, 1,
-0.3267618, -0.7610724, -2.930851, 0, 0, 1, 1, 1,
-0.3231995, 1.603635, -0.3150477, 1, 0, 0, 1, 1,
-0.3189339, 1.08459, -0.8699231, 1, 0, 0, 1, 1,
-0.3179733, -2.030974, -2.918178, 1, 0, 0, 1, 1,
-0.3152401, -0.2119957, -3.832441, 1, 0, 0, 1, 1,
-0.3131796, 0.792024, 0.9157053, 1, 0, 0, 1, 1,
-0.3115101, 0.6938726, -2.103669, 0, 0, 0, 1, 1,
-0.3108653, -0.5837438, -3.576112, 0, 0, 0, 1, 1,
-0.3065447, 1.40972, -1.868861, 0, 0, 0, 1, 1,
-0.2987148, -0.8050393, -3.288764, 0, 0, 0, 1, 1,
-0.2977412, 0.6014984, -0.2116057, 0, 0, 0, 1, 1,
-0.2972556, 0.1491707, -1.312562, 0, 0, 0, 1, 1,
-0.2955361, 0.5719151, 0.2693921, 0, 0, 0, 1, 1,
-0.2938541, -1.156116, -2.576776, 1, 1, 1, 1, 1,
-0.2920668, 1.320196, -0.1533654, 1, 1, 1, 1, 1,
-0.2918671, 0.4433458, -0.08497934, 1, 1, 1, 1, 1,
-0.2895733, -0.943525, -4.306213, 1, 1, 1, 1, 1,
-0.2891468, -0.3578196, -1.783903, 1, 1, 1, 1, 1,
-0.284581, 0.6454723, -2.555954, 1, 1, 1, 1, 1,
-0.2837613, 1.048432, 1.402304, 1, 1, 1, 1, 1,
-0.2821666, -1.021265, -4.08634, 1, 1, 1, 1, 1,
-0.2801418, 1.292585, 0.6916149, 1, 1, 1, 1, 1,
-0.2792228, 0.727209, -3.472093, 1, 1, 1, 1, 1,
-0.2784225, -0.1303258, -3.071979, 1, 1, 1, 1, 1,
-0.2754867, -1.17345, -3.08642, 1, 1, 1, 1, 1,
-0.2709058, -0.7607231, -2.708918, 1, 1, 1, 1, 1,
-0.2650553, -0.7248487, -3.903363, 1, 1, 1, 1, 1,
-0.2629401, -2.598334, -3.200559, 1, 1, 1, 1, 1,
-0.2618707, 1.878894, -1.415727, 0, 0, 1, 1, 1,
-0.2616706, -2.602272, -3.359069, 1, 0, 0, 1, 1,
-0.2607487, 1.776529, -2.310735, 1, 0, 0, 1, 1,
-0.2598835, 1.755137, -0.1679877, 1, 0, 0, 1, 1,
-0.2581947, 0.6630967, -1.166827, 1, 0, 0, 1, 1,
-0.2575021, -0.6248275, -1.694509, 1, 0, 0, 1, 1,
-0.254914, -1.469383, -4.545284, 0, 0, 0, 1, 1,
-0.2534781, 0.1769225, -2.320482, 0, 0, 0, 1, 1,
-0.2468385, 1.245189, 0.569085, 0, 0, 0, 1, 1,
-0.2447706, 0.2867675, -1.310835, 0, 0, 0, 1, 1,
-0.2414407, 0.4944002, -0.6443925, 0, 0, 0, 1, 1,
-0.2338341, 0.6385365, 0.3548389, 0, 0, 0, 1, 1,
-0.233494, 0.9159007, 0.3382167, 0, 0, 0, 1, 1,
-0.2322194, -0.3398595, -3.858441, 1, 1, 1, 1, 1,
-0.2314312, -1.631796, -2.57794, 1, 1, 1, 1, 1,
-0.2305749, 1.288636, -0.5514144, 1, 1, 1, 1, 1,
-0.226852, -1.05926, -2.010697, 1, 1, 1, 1, 1,
-0.2217054, 0.0286334, -1.906906, 1, 1, 1, 1, 1,
-0.2216009, 1.77256, -1.165424, 1, 1, 1, 1, 1,
-0.2212054, -0.5124376, -2.909144, 1, 1, 1, 1, 1,
-0.2183729, 0.2333351, -0.1653885, 1, 1, 1, 1, 1,
-0.2128042, 0.06595574, -1.551316, 1, 1, 1, 1, 1,
-0.2109548, -1.556169, -3.266785, 1, 1, 1, 1, 1,
-0.2081642, -0.8448012, -1.041244, 1, 1, 1, 1, 1,
-0.2036557, -0.4190138, -2.496556, 1, 1, 1, 1, 1,
-0.1973856, -0.7574954, -3.754771, 1, 1, 1, 1, 1,
-0.1933001, 0.7821834, -0.13879, 1, 1, 1, 1, 1,
-0.1928808, -0.06417197, -2.002498, 1, 1, 1, 1, 1,
-0.1918243, 1.514697, 0.5607058, 0, 0, 1, 1, 1,
-0.1911031, -0.4074909, -5.520682, 1, 0, 0, 1, 1,
-0.1889501, 0.1410025, -0.5275892, 1, 0, 0, 1, 1,
-0.1886085, 0.2698382, -1.199036, 1, 0, 0, 1, 1,
-0.183198, -0.375413, -2.183418, 1, 0, 0, 1, 1,
-0.1787997, 0.008196597, -0.06418732, 1, 0, 0, 1, 1,
-0.1770298, -1.949677, -2.32365, 0, 0, 0, 1, 1,
-0.1744577, -1.922794, -3.678969, 0, 0, 0, 1, 1,
-0.1728329, -0.3306683, -2.143488, 0, 0, 0, 1, 1,
-0.1654101, -0.7272632, -4.052556, 0, 0, 0, 1, 1,
-0.1653627, 0.6885638, -2.080347, 0, 0, 0, 1, 1,
-0.1637142, 0.2319529, -0.09141589, 0, 0, 0, 1, 1,
-0.160983, -0.4704436, -3.066095, 0, 0, 0, 1, 1,
-0.160238, -1.056535, -4.320088, 1, 1, 1, 1, 1,
-0.1586997, -0.8716347, -4.228685, 1, 1, 1, 1, 1,
-0.1560678, -0.7753863, -0.9186397, 1, 1, 1, 1, 1,
-0.1553138, 0.3337089, -2.163517, 1, 1, 1, 1, 1,
-0.1552699, 0.5936381, -1.339513, 1, 1, 1, 1, 1,
-0.1530561, -1.630457, -3.816899, 1, 1, 1, 1, 1,
-0.152515, 0.2477192, -0.8222886, 1, 1, 1, 1, 1,
-0.1516283, -0.2717696, -2.95026, 1, 1, 1, 1, 1,
-0.1492325, 0.553591, -0.9661614, 1, 1, 1, 1, 1,
-0.1471937, 0.6823896, -0.9011931, 1, 1, 1, 1, 1,
-0.1465181, -0.749328, -4.086851, 1, 1, 1, 1, 1,
-0.1461386, -0.8686127, -2.241359, 1, 1, 1, 1, 1,
-0.1452674, 0.878679, -0.8670474, 1, 1, 1, 1, 1,
-0.1430468, -0.3207308, -4.574563, 1, 1, 1, 1, 1,
-0.1408302, -0.4828482, -3.068732, 1, 1, 1, 1, 1,
-0.1389776, -0.8071153, -1.226584, 0, 0, 1, 1, 1,
-0.1350118, 0.5316414, -1.076961, 1, 0, 0, 1, 1,
-0.1341726, -1.116107, -3.783849, 1, 0, 0, 1, 1,
-0.1339203, -0.7139957, -2.623662, 1, 0, 0, 1, 1,
-0.1323399, -0.8545084, -2.803568, 1, 0, 0, 1, 1,
-0.1304946, -1.349623, -2.820941, 1, 0, 0, 1, 1,
-0.1296363, 0.03488386, 0.2879301, 0, 0, 0, 1, 1,
-0.1268483, 0.2402697, -0.1452728, 0, 0, 0, 1, 1,
-0.12482, 0.5570256, 1.133574, 0, 0, 0, 1, 1,
-0.1244249, -0.01442787, -1.589497, 0, 0, 0, 1, 1,
-0.1216087, -0.9320676, -3.368601, 0, 0, 0, 1, 1,
-0.1215371, -0.439579, -4.226583, 0, 0, 0, 1, 1,
-0.1208399, 1.283348, 0.4251528, 0, 0, 0, 1, 1,
-0.1196682, -0.5105642, -2.735368, 1, 1, 1, 1, 1,
-0.114646, -0.003151401, 0.1641609, 1, 1, 1, 1, 1,
-0.114078, -0.7974655, -2.668606, 1, 1, 1, 1, 1,
-0.1073949, -0.1376581, -3.759856, 1, 1, 1, 1, 1,
-0.1059703, -1.947241, -1.351692, 1, 1, 1, 1, 1,
-0.1051605, 2.441238, 0.9736277, 1, 1, 1, 1, 1,
-0.09837592, 0.3273451, -0.4184432, 1, 1, 1, 1, 1,
-0.09507158, 0.1275683, -0.0352102, 1, 1, 1, 1, 1,
-0.09502292, -0.07044001, -1.839897, 1, 1, 1, 1, 1,
-0.08814938, -0.4605449, -2.887278, 1, 1, 1, 1, 1,
-0.08757676, -0.02970668, -0.7697996, 1, 1, 1, 1, 1,
-0.08594909, 0.3144052, -0.736352, 1, 1, 1, 1, 1,
-0.08552413, -2.507854, -2.339553, 1, 1, 1, 1, 1,
-0.08540972, -0.7212015, -5.364962, 1, 1, 1, 1, 1,
-0.06638333, -1.510864, -3.763312, 1, 1, 1, 1, 1,
-0.05928765, 0.224767, 0.5535457, 0, 0, 1, 1, 1,
-0.05750945, 0.1155513, -1.742682, 1, 0, 0, 1, 1,
-0.05037585, -0.4518799, -3.273497, 1, 0, 0, 1, 1,
-0.04812825, -0.8196526, -3.50461, 1, 0, 0, 1, 1,
-0.04740585, -0.6383662, -4.150818, 1, 0, 0, 1, 1,
-0.04686682, -0.1816942, -2.646082, 1, 0, 0, 1, 1,
-0.04284019, -0.2537406, -3.323743, 0, 0, 0, 1, 1,
-0.04045462, -0.2717218, -3.347582, 0, 0, 0, 1, 1,
-0.0388024, 0.03018735, -2.075583, 0, 0, 0, 1, 1,
-0.03820445, 1.065236, -1.209535, 0, 0, 0, 1, 1,
-0.0364541, 0.1375652, 0.9804022, 0, 0, 0, 1, 1,
-0.03620799, 0.7530808, 0.1793038, 0, 0, 0, 1, 1,
-0.03476562, 1.581502, 1.947359, 0, 0, 0, 1, 1,
-0.03374752, 1.480031, 0.6902804, 1, 1, 1, 1, 1,
-0.03327652, 0.3957518, -0.8396524, 1, 1, 1, 1, 1,
-0.03275347, -0.3132674, -2.810038, 1, 1, 1, 1, 1,
-0.03218431, 1.51982, 1.036981, 1, 1, 1, 1, 1,
-0.03057616, -1.565258, -3.041575, 1, 1, 1, 1, 1,
-0.03001526, 2.107377, 2.251115, 1, 1, 1, 1, 1,
-0.02816998, -0.3371478, -3.189282, 1, 1, 1, 1, 1,
-0.02749575, -1.738549, -3.606387, 1, 1, 1, 1, 1,
-0.02626577, -0.7370342, -4.078695, 1, 1, 1, 1, 1,
-0.01464519, -1.306751, -2.99946, 1, 1, 1, 1, 1,
-0.01439037, 0.5129954, -0.4448197, 1, 1, 1, 1, 1,
-0.01074625, 0.606524, 0.05517967, 1, 1, 1, 1, 1,
-0.01038472, 0.02045062, -1.043923, 1, 1, 1, 1, 1,
-0.01013491, 1.230577, 1.353551, 1, 1, 1, 1, 1,
-0.002939798, 1.389466, 2.411852, 1, 1, 1, 1, 1,
0.003448474, 0.6793483, -0.1632727, 0, 0, 1, 1, 1,
0.003711362, -1.557481, 3.823132, 1, 0, 0, 1, 1,
0.0125531, 0.8783638, 1.656641, 1, 0, 0, 1, 1,
0.01272586, 1.234631, -0.853324, 1, 0, 0, 1, 1,
0.01279023, -0.3831673, 1.006729, 1, 0, 0, 1, 1,
0.01447683, -0.8378231, 4.291237, 1, 0, 0, 1, 1,
0.01506332, -0.3977384, 2.086207, 0, 0, 0, 1, 1,
0.01520244, -0.8572931, 2.378515, 0, 0, 0, 1, 1,
0.01916341, 0.7107777, 0.008092409, 0, 0, 0, 1, 1,
0.01989137, 3.039365, 0.9385044, 0, 0, 0, 1, 1,
0.02102435, 1.704033, 1.240234, 0, 0, 0, 1, 1,
0.02167715, -0.1790871, 2.1315, 0, 0, 0, 1, 1,
0.02221589, 0.4249801, 0.729892, 0, 0, 0, 1, 1,
0.02937891, -1.757982, 3.173254, 1, 1, 1, 1, 1,
0.0337181, 0.4003436, 2.688936, 1, 1, 1, 1, 1,
0.03483678, 0.6887348, 0.8415133, 1, 1, 1, 1, 1,
0.03492492, -0.7958963, 3.51628, 1, 1, 1, 1, 1,
0.03528196, 0.2003943, 0.3799388, 1, 1, 1, 1, 1,
0.03663316, -1.882423, 2.640297, 1, 1, 1, 1, 1,
0.03824443, -0.6010684, 2.117329, 1, 1, 1, 1, 1,
0.03944223, 0.05964963, -0.01572, 1, 1, 1, 1, 1,
0.04017524, -2.033752e-05, 1.566789, 1, 1, 1, 1, 1,
0.04024709, -0.6548514, 3.160185, 1, 1, 1, 1, 1,
0.04104256, 0.6050676, -0.2542965, 1, 1, 1, 1, 1,
0.04206231, -0.01243566, 1.601851, 1, 1, 1, 1, 1,
0.04387989, -0.01442971, 4.228743, 1, 1, 1, 1, 1,
0.04403911, 1.703912, 0.2720995, 1, 1, 1, 1, 1,
0.04445706, 0.1416865, -1.006847, 1, 1, 1, 1, 1,
0.04668595, 0.1389863, 1.333326, 0, 0, 1, 1, 1,
0.0478586, 0.2155305, 0.757833, 1, 0, 0, 1, 1,
0.04983243, -1.543697, 4.426883, 1, 0, 0, 1, 1,
0.05934744, 0.3948329, 1.361916, 1, 0, 0, 1, 1,
0.06074624, 0.08532277, -0.8509157, 1, 0, 0, 1, 1,
0.06327333, -0.4572327, 3.007012, 1, 0, 0, 1, 1,
0.06405867, 0.5203831, 0.5112981, 0, 0, 0, 1, 1,
0.06721, -0.6198172, 3.68941, 0, 0, 0, 1, 1,
0.06868958, 2.596055, -2.22211, 0, 0, 0, 1, 1,
0.07551285, 0.307099, 0.2208485, 0, 0, 0, 1, 1,
0.07669548, 2.099762, 2.041738, 0, 0, 0, 1, 1,
0.07677891, -0.03785574, 1.629121, 0, 0, 0, 1, 1,
0.07832589, 0.05617449, -0.8523707, 0, 0, 0, 1, 1,
0.07955649, -0.8177732, 2.57712, 1, 1, 1, 1, 1,
0.07972837, -0.4692249, 3.104156, 1, 1, 1, 1, 1,
0.08127239, -3.807809, 4.236837, 1, 1, 1, 1, 1,
0.08447237, 1.171834, 2.069816, 1, 1, 1, 1, 1,
0.0847864, 0.5102873, 1.026307, 1, 1, 1, 1, 1,
0.09064072, -0.3104162, 2.153931, 1, 1, 1, 1, 1,
0.09265923, -1.083427, 4.430479, 1, 1, 1, 1, 1,
0.09627585, -0.9508215, 3.006391, 1, 1, 1, 1, 1,
0.1019827, 0.8703319, 0.7165622, 1, 1, 1, 1, 1,
0.1033874, -0.1699999, 2.091133, 1, 1, 1, 1, 1,
0.1038233, -1.050772, 3.333868, 1, 1, 1, 1, 1,
0.10755, 0.4532768, 1.357351, 1, 1, 1, 1, 1,
0.108084, -0.2551486, 3.067762, 1, 1, 1, 1, 1,
0.1134301, 0.08273487, 1.085425, 1, 1, 1, 1, 1,
0.1177821, -0.6520196, 2.746186, 1, 1, 1, 1, 1,
0.1192755, -0.6667587, 1.477491, 0, 0, 1, 1, 1,
0.1217093, -0.6389302, 1.370695, 1, 0, 0, 1, 1,
0.123065, 0.2813247, 0.0344345, 1, 0, 0, 1, 1,
0.1234461, -0.1542838, 1.972471, 1, 0, 0, 1, 1,
0.1241902, -1.915358, 3.35115, 1, 0, 0, 1, 1,
0.124279, -0.3940805, 1.585101, 1, 0, 0, 1, 1,
0.1246061, -0.2133608, 2.61016, 0, 0, 0, 1, 1,
0.1250212, -0.2079221, 2.370378, 0, 0, 0, 1, 1,
0.1258527, 0.4118454, 1.346474, 0, 0, 0, 1, 1,
0.1303569, -0.4320609, 3.216971, 0, 0, 0, 1, 1,
0.1330293, 1.163015, 0.3747109, 0, 0, 0, 1, 1,
0.1413948, -1.602771, 4.203891, 0, 0, 0, 1, 1,
0.1418348, -0.1604548, 1.98331, 0, 0, 0, 1, 1,
0.1440409, -1.454135, 4.320612, 1, 1, 1, 1, 1,
0.1492071, -1.246893, 4.748467, 1, 1, 1, 1, 1,
0.1578885, 0.7967575, -0.9708851, 1, 1, 1, 1, 1,
0.1581834, -2.582374, 2.341448, 1, 1, 1, 1, 1,
0.1613087, -1.191448, 2.326582, 1, 1, 1, 1, 1,
0.1679201, -0.40049, 1.013597, 1, 1, 1, 1, 1,
0.1774509, -0.05718619, 1.750688, 1, 1, 1, 1, 1,
0.1778655, 0.1979393, 1.766723, 1, 1, 1, 1, 1,
0.177956, -0.5918925, 2.224193, 1, 1, 1, 1, 1,
0.178571, 0.4705114, 0.8514425, 1, 1, 1, 1, 1,
0.1793265, -2.299811, 3.47927, 1, 1, 1, 1, 1,
0.1930636, -0.3808232, 2.067498, 1, 1, 1, 1, 1,
0.1950073, -0.2650208, 1.032413, 1, 1, 1, 1, 1,
0.1968571, 0.4224187, 0.3234274, 1, 1, 1, 1, 1,
0.1984607, 0.9345441, -0.4695805, 1, 1, 1, 1, 1,
0.199732, 0.4761256, -0.8325953, 0, 0, 1, 1, 1,
0.200753, -0.6511266, 2.282347, 1, 0, 0, 1, 1,
0.2078271, -0.5277182, 3.379198, 1, 0, 0, 1, 1,
0.215053, 1.005587, -0.709056, 1, 0, 0, 1, 1,
0.221096, 1.236252, 0.3748125, 1, 0, 0, 1, 1,
0.2213151, 0.05995842, 2.309939, 1, 0, 0, 1, 1,
0.2233683, 1.775186, 0.4802703, 0, 0, 0, 1, 1,
0.2268199, -0.501822, 1.614246, 0, 0, 0, 1, 1,
0.2282064, -1.412394, 4.786132, 0, 0, 0, 1, 1,
0.2377851, -0.08578653, 2.055119, 0, 0, 0, 1, 1,
0.2429483, -0.2630166, 1.615156, 0, 0, 0, 1, 1,
0.2509459, -0.3009132, 1.801305, 0, 0, 0, 1, 1,
0.2534098, 0.5326903, -0.8705635, 0, 0, 0, 1, 1,
0.2570876, 0.1169722, 2.024237, 1, 1, 1, 1, 1,
0.2581273, -1.094061, 0.1392512, 1, 1, 1, 1, 1,
0.2602416, -0.4124312, 2.765124, 1, 1, 1, 1, 1,
0.2609051, 1.961686, 2.084813, 1, 1, 1, 1, 1,
0.2679594, 1.478284, 1.248973, 1, 1, 1, 1, 1,
0.2681111, -1.983705, 4.37173, 1, 1, 1, 1, 1,
0.2694452, -0.4298028, 3.962551, 1, 1, 1, 1, 1,
0.2738042, -0.9231015, 3.371953, 1, 1, 1, 1, 1,
0.2776125, 0.5948429, 1.843503, 1, 1, 1, 1, 1,
0.2799688, -1.02572, 3.95285, 1, 1, 1, 1, 1,
0.2851909, -1.102605, 3.624708, 1, 1, 1, 1, 1,
0.2857642, 0.1195599, 2.260203, 1, 1, 1, 1, 1,
0.2905916, -0.4012646, 1.487449, 1, 1, 1, 1, 1,
0.2907146, -0.3986916, 2.296463, 1, 1, 1, 1, 1,
0.292926, -1.216692, 2.248761, 1, 1, 1, 1, 1,
0.2966414, -0.0850817, 2.329572, 0, 0, 1, 1, 1,
0.2994659, 0.4981266, 1.393821, 1, 0, 0, 1, 1,
0.2999347, -0.7899112, 2.866761, 1, 0, 0, 1, 1,
0.3007348, -0.05457281, 3.168269, 1, 0, 0, 1, 1,
0.3032917, 1.207037, 0.4675625, 1, 0, 0, 1, 1,
0.3038817, 0.5020599, 0.8762974, 1, 0, 0, 1, 1,
0.3052362, -1.714128, 2.036084, 0, 0, 0, 1, 1,
0.3054026, 1.129846, -0.1314847, 0, 0, 0, 1, 1,
0.3060008, 0.4369082, 3.107442, 0, 0, 0, 1, 1,
0.3063129, 0.8012191, -0.3176979, 0, 0, 0, 1, 1,
0.3074475, -1.166792, 4.68891, 0, 0, 0, 1, 1,
0.3157203, 0.6772816, 1.001448, 0, 0, 0, 1, 1,
0.3189098, -0.8468964, 2.836622, 0, 0, 0, 1, 1,
0.320233, 1.521347, -0.9130141, 1, 1, 1, 1, 1,
0.3293307, 0.6836004, -0.2872261, 1, 1, 1, 1, 1,
0.3359045, -1.470265, 2.5327, 1, 1, 1, 1, 1,
0.3369392, 0.8208032, -0.1339361, 1, 1, 1, 1, 1,
0.3387377, 0.3495315, 0.2748955, 1, 1, 1, 1, 1,
0.3409999, 0.9848511, 0.6156116, 1, 1, 1, 1, 1,
0.3412538, 0.3482516, 1.610694, 1, 1, 1, 1, 1,
0.3413404, -0.1153401, 0.8471931, 1, 1, 1, 1, 1,
0.3417887, 1.471136, -1.038359, 1, 1, 1, 1, 1,
0.3433292, 2.060476, -0.3298511, 1, 1, 1, 1, 1,
0.3524254, 0.1997907, 1.731891, 1, 1, 1, 1, 1,
0.353132, 0.4078973, 1.178151, 1, 1, 1, 1, 1,
0.3608021, 0.5940281, 2.497702, 1, 1, 1, 1, 1,
0.3612406, -0.7001458, 4.794673, 1, 1, 1, 1, 1,
0.3614223, -0.03936002, 2.204672, 1, 1, 1, 1, 1,
0.3645789, 1.753123, -1.357469, 0, 0, 1, 1, 1,
0.3654588, 0.2808892, 0.6919973, 1, 0, 0, 1, 1,
0.3670083, 0.0009258266, 0.2442814, 1, 0, 0, 1, 1,
0.3671901, 0.3522245, -0.06113097, 1, 0, 0, 1, 1,
0.3692094, 1.006642, 0.2312571, 1, 0, 0, 1, 1,
0.3708157, -0.05564526, 3.391282, 1, 0, 0, 1, 1,
0.3735023, -1.862463, 2.953848, 0, 0, 0, 1, 1,
0.3737881, -0.7732188, 3.238513, 0, 0, 0, 1, 1,
0.3740724, 0.08567417, 0.05310253, 0, 0, 0, 1, 1,
0.3871292, -1.241554, 2.411417, 0, 0, 0, 1, 1,
0.3888994, -0.3367183, 1.569589, 0, 0, 0, 1, 1,
0.3945451, 0.134332, -0.6173241, 0, 0, 0, 1, 1,
0.3956753, -0.2224444, 1.930469, 0, 0, 0, 1, 1,
0.3986306, 0.2311317, 0.6425082, 1, 1, 1, 1, 1,
0.3987492, 0.03035975, 2.369802, 1, 1, 1, 1, 1,
0.4011854, 0.5148318, 1.333441, 1, 1, 1, 1, 1,
0.4019356, 0.1843515, 0.6329809, 1, 1, 1, 1, 1,
0.4020868, 0.3078603, -0.8503124, 1, 1, 1, 1, 1,
0.4053634, 1.54928, 0.2222705, 1, 1, 1, 1, 1,
0.4057533, -0.9279752, 1.930953, 1, 1, 1, 1, 1,
0.4061655, 1.912628, -0.9438737, 1, 1, 1, 1, 1,
0.4067506, 0.5331635, 1.74973, 1, 1, 1, 1, 1,
0.4088269, 0.1840274, -0.0851059, 1, 1, 1, 1, 1,
0.4111066, 0.07581928, 1.133392, 1, 1, 1, 1, 1,
0.412447, 0.01890268, 1.250305, 1, 1, 1, 1, 1,
0.4233382, -0.2794131, 2.668675, 1, 1, 1, 1, 1,
0.4240995, 0.7135889, -0.9554371, 1, 1, 1, 1, 1,
0.4245492, -0.3145716, 2.46212, 1, 1, 1, 1, 1,
0.4291251, 0.6396011, 1.074926, 0, 0, 1, 1, 1,
0.4342412, -1.230633, 3.815217, 1, 0, 0, 1, 1,
0.4354239, -0.8623026, 2.613957, 1, 0, 0, 1, 1,
0.4355592, 1.283855, 1.49467, 1, 0, 0, 1, 1,
0.4375661, -1.200024, 1.417376, 1, 0, 0, 1, 1,
0.4383615, -0.7507625, 4.268515, 1, 0, 0, 1, 1,
0.4394476, -0.2223353, 2.51116, 0, 0, 0, 1, 1,
0.4397418, -1.315459, 2.146188, 0, 0, 0, 1, 1,
0.4416157, 0.1387894, 1.780563, 0, 0, 0, 1, 1,
0.4447739, -0.9969962, 3.345204, 0, 0, 0, 1, 1,
0.4461197, -0.08777443, 1.221948, 0, 0, 0, 1, 1,
0.4476775, 2.858207, 2.748057, 0, 0, 0, 1, 1,
0.448808, -0.2310413, 2.496181, 0, 0, 0, 1, 1,
0.4506868, -0.8293959, 0.9347778, 1, 1, 1, 1, 1,
0.4540264, -0.2503222, 2.374288, 1, 1, 1, 1, 1,
0.4589697, 1.274586, 0.1235382, 1, 1, 1, 1, 1,
0.4595881, -0.923955, 1.478591, 1, 1, 1, 1, 1,
0.4610631, -0.6814426, 2.821825, 1, 1, 1, 1, 1,
0.4611063, 0.5841253, 0.5990182, 1, 1, 1, 1, 1,
0.465405, 0.2491114, 1.392819, 1, 1, 1, 1, 1,
0.4665971, -1.34839, 2.70162, 1, 1, 1, 1, 1,
0.4669304, 0.06877242, 1.571307, 1, 1, 1, 1, 1,
0.4676613, 1.126235, 1.518482, 1, 1, 1, 1, 1,
0.4747261, -0.3635327, 0.8557516, 1, 1, 1, 1, 1,
0.4759592, -1.4242, 3.83078, 1, 1, 1, 1, 1,
0.4765177, -0.4515657, 2.675643, 1, 1, 1, 1, 1,
0.4766935, -1.568631, 2.589258, 1, 1, 1, 1, 1,
0.4796961, -1.47071, 3.156575, 1, 1, 1, 1, 1,
0.4857035, -0.2292405, 2.694678, 0, 0, 1, 1, 1,
0.4898142, 1.814901, 0.3283955, 1, 0, 0, 1, 1,
0.4915248, -1.033941, 1.736319, 1, 0, 0, 1, 1,
0.5138133, 0.8278279, -0.480228, 1, 0, 0, 1, 1,
0.5140252, -0.4578744, 1.883897, 1, 0, 0, 1, 1,
0.5155458, 1.385204, 1.233891, 1, 0, 0, 1, 1,
0.5156659, -0.6404353, 2.835531, 0, 0, 0, 1, 1,
0.5164641, 0.426246, -0.2202842, 0, 0, 0, 1, 1,
0.5201247, 0.531574, 0.01334931, 0, 0, 0, 1, 1,
0.5292695, 1.008904, -0.1328284, 0, 0, 0, 1, 1,
0.5303459, -2.268167, 3.517098, 0, 0, 0, 1, 1,
0.5309653, 1.257964, -0.4445357, 0, 0, 0, 1, 1,
0.5314144, 0.008919037, 2.350476, 0, 0, 0, 1, 1,
0.5315788, 0.8192539, 0.5511658, 1, 1, 1, 1, 1,
0.5373026, 0.2033295, 2.932443, 1, 1, 1, 1, 1,
0.5426328, -0.2943942, 0.09062257, 1, 1, 1, 1, 1,
0.5439684, 1.284, 1.295957, 1, 1, 1, 1, 1,
0.5445932, -1.650431, 1.96519, 1, 1, 1, 1, 1,
0.5471225, -0.4168366, 3.316513, 1, 1, 1, 1, 1,
0.547856, 0.7476646, 1.449665, 1, 1, 1, 1, 1,
0.5543744, -0.4520319, 2.821177, 1, 1, 1, 1, 1,
0.5563875, -2.414385, 2.908231, 1, 1, 1, 1, 1,
0.5582664, 1.258431, 0.9711331, 1, 1, 1, 1, 1,
0.5592028, -0.2849835, 0.5860561, 1, 1, 1, 1, 1,
0.5632256, -0.5587166, 3.581711, 1, 1, 1, 1, 1,
0.5636781, 0.2514099, 1.086962, 1, 1, 1, 1, 1,
0.5693684, -0.3012099, 2.923909, 1, 1, 1, 1, 1,
0.5716466, -0.3183044, 2.030627, 1, 1, 1, 1, 1,
0.5742813, -0.05144052, 2.031923, 0, 0, 1, 1, 1,
0.5903635, -0.9912874, 2.433723, 1, 0, 0, 1, 1,
0.5912814, -0.3962771, 2.245018, 1, 0, 0, 1, 1,
0.5939417, 1.925205, 1.116524, 1, 0, 0, 1, 1,
0.5989387, -0.0795572, 0.5792549, 1, 0, 0, 1, 1,
0.6000143, -0.9341158, 1.805378, 1, 0, 0, 1, 1,
0.6044759, 1.80668, -0.04393737, 0, 0, 0, 1, 1,
0.6044822, -1.756829, 3.297651, 0, 0, 0, 1, 1,
0.6082703, -0.3204901, 3.465332, 0, 0, 0, 1, 1,
0.6116272, -0.04683109, 0.9193406, 0, 0, 0, 1, 1,
0.6193032, 0.182606, 0.3032537, 0, 0, 0, 1, 1,
0.6274024, 1.302049, -0.09893012, 0, 0, 0, 1, 1,
0.6355679, 0.3567372, 0.2202448, 0, 0, 0, 1, 1,
0.6427332, -0.2943397, 1.421119, 1, 1, 1, 1, 1,
0.6463909, -1.799195, 2.462491, 1, 1, 1, 1, 1,
0.6485048, 0.5658452, 1.886486, 1, 1, 1, 1, 1,
0.6558343, -0.7277199, 2.42527, 1, 1, 1, 1, 1,
0.6565502, 0.9016461, 1.092616, 1, 1, 1, 1, 1,
0.6576476, 0.3949671, 0.0586386, 1, 1, 1, 1, 1,
0.6708905, 0.9440836, 2.038542, 1, 1, 1, 1, 1,
0.6743373, -1.773091, 2.270399, 1, 1, 1, 1, 1,
0.6756008, 2.910913, 1.347005, 1, 1, 1, 1, 1,
0.6762627, -0.06219194, 2.853961, 1, 1, 1, 1, 1,
0.6802859, -1.188234, 1.815407, 1, 1, 1, 1, 1,
0.6806998, 0.7348565, 1.164144, 1, 1, 1, 1, 1,
0.680896, 0.8872736, 0.8153969, 1, 1, 1, 1, 1,
0.6844242, 0.02810693, 3.425392, 1, 1, 1, 1, 1,
0.6881257, -0.5316019, 2.804073, 1, 1, 1, 1, 1,
0.6986035, -0.3923872, 2.505543, 0, 0, 1, 1, 1,
0.6998737, -0.2898409, 1.900618, 1, 0, 0, 1, 1,
0.7003351, 0.2616987, 0.07627895, 1, 0, 0, 1, 1,
0.7006851, 1.704653, 0.1018119, 1, 0, 0, 1, 1,
0.7030266, -0.2002455, 1.654959, 1, 0, 0, 1, 1,
0.7096961, 1.541347, 1.569098, 1, 0, 0, 1, 1,
0.7117019, 1.278695, 3.138233, 0, 0, 0, 1, 1,
0.7130994, 0.3662371, 0.4177108, 0, 0, 0, 1, 1,
0.7146642, 1.376866, -1.120032, 0, 0, 0, 1, 1,
0.7149843, -1.908801, 3.086002, 0, 0, 0, 1, 1,
0.7212511, -0.1419911, 0.7840993, 0, 0, 0, 1, 1,
0.7321036, -2.137444, 0.6036451, 0, 0, 0, 1, 1,
0.7327272, -1.855675, 2.483371, 0, 0, 0, 1, 1,
0.733942, 0.6315792, -0.6759219, 1, 1, 1, 1, 1,
0.7398937, -0.499199, 2.302518, 1, 1, 1, 1, 1,
0.7425202, 1.456212, 3.416542, 1, 1, 1, 1, 1,
0.7451618, -0.7153392, 1.359057, 1, 1, 1, 1, 1,
0.7461247, 0.1779807, -0.1350884, 1, 1, 1, 1, 1,
0.74663, -0.9510658, 2.549089, 1, 1, 1, 1, 1,
0.7470152, -1.112613, 1.980856, 1, 1, 1, 1, 1,
0.7476817, 0.3190722, 0.9274186, 1, 1, 1, 1, 1,
0.7506854, -1.217517, 2.2107, 1, 1, 1, 1, 1,
0.7568014, 0.4065172, 2.019788, 1, 1, 1, 1, 1,
0.7613801, -0.06557181, 0.9945629, 1, 1, 1, 1, 1,
0.7636288, 0.4633742, 1.87236, 1, 1, 1, 1, 1,
0.7636552, 1.354053, 0.5135742, 1, 1, 1, 1, 1,
0.7638193, -2.462897, 3.061762, 1, 1, 1, 1, 1,
0.7652356, 0.4648826, 0.864128, 1, 1, 1, 1, 1,
0.7695869, -0.02389715, 2.16127, 0, 0, 1, 1, 1,
0.7751282, 0.9719179, 1.545112, 1, 0, 0, 1, 1,
0.7830899, 0.7913943, -0.8197082, 1, 0, 0, 1, 1,
0.7865953, 0.1805172, 0.2549703, 1, 0, 0, 1, 1,
0.7869185, 0.4491356, 1.119761, 1, 0, 0, 1, 1,
0.7909759, -0.3790939, 2.475859, 1, 0, 0, 1, 1,
0.7911487, -0.6924419, 1.940631, 0, 0, 0, 1, 1,
0.7916605, 1.785643, -0.07558993, 0, 0, 0, 1, 1,
0.799427, -0.06320336, 0.2350451, 0, 0, 0, 1, 1,
0.8020634, 0.3092036, 0.1117984, 0, 0, 0, 1, 1,
0.8044171, 0.3744222, 1.149568, 0, 0, 0, 1, 1,
0.8045984, 1.067594, -0.5159672, 0, 0, 0, 1, 1,
0.8086397, -0.1850497, 1.226445, 0, 0, 0, 1, 1,
0.814161, -0.09019492, 0.9501348, 1, 1, 1, 1, 1,
0.819196, 0.2449808, 1.123758, 1, 1, 1, 1, 1,
0.8280191, 0.09454254, 2.980045, 1, 1, 1, 1, 1,
0.8302183, 0.4324383, 0.6427944, 1, 1, 1, 1, 1,
0.8329357, -0.1003281, 1.625535, 1, 1, 1, 1, 1,
0.8340945, -0.4305671, 1.491583, 1, 1, 1, 1, 1,
0.8555748, 0.1651982, 1.277161, 1, 1, 1, 1, 1,
0.8584471, 0.9107061, -1.454791, 1, 1, 1, 1, 1,
0.865469, -0.002785793, 1.283832, 1, 1, 1, 1, 1,
0.871838, 1.473486, 1.648871, 1, 1, 1, 1, 1,
0.8821021, 0.2597093, 2.029921, 1, 1, 1, 1, 1,
0.8859489, 0.6971979, 0.9109742, 1, 1, 1, 1, 1,
0.8889962, -0.6093391, 1.987055, 1, 1, 1, 1, 1,
0.893256, -1.588749, 2.753202, 1, 1, 1, 1, 1,
0.8942756, -0.7617537, 0.6440257, 1, 1, 1, 1, 1,
0.8968596, -0.4248356, 2.088732, 0, 0, 1, 1, 1,
0.9076372, 0.08455613, 1.376426, 1, 0, 0, 1, 1,
0.908715, 0.2756607, 2.322312, 1, 0, 0, 1, 1,
0.9091343, -1.275202, 1.632754, 1, 0, 0, 1, 1,
0.9104051, 1.570338, 0.6140487, 1, 0, 0, 1, 1,
0.9106679, 0.9405829, -0.2963609, 1, 0, 0, 1, 1,
0.9151846, -0.5667224, 1.761827, 0, 0, 0, 1, 1,
0.9192001, 0.6099155, 2.077287, 0, 0, 0, 1, 1,
0.9203739, 1.067814, 1.767897, 0, 0, 0, 1, 1,
0.9236634, 1.286478, 2.42504, 0, 0, 0, 1, 1,
0.9299378, 0.4121413, 1.090371, 0, 0, 0, 1, 1,
0.9314266, -1.173316, 4.322397, 0, 0, 0, 1, 1,
0.9336089, 1.619827, 1.663745, 0, 0, 0, 1, 1,
0.9383575, 0.1889573, -0.4649228, 1, 1, 1, 1, 1,
0.9393677, -0.7058114, 2.61026, 1, 1, 1, 1, 1,
0.945392, 0.6748556, 0.6958087, 1, 1, 1, 1, 1,
0.9489573, -0.2743114, 1.598803, 1, 1, 1, 1, 1,
0.9584128, 0.6662676, 0.8170443, 1, 1, 1, 1, 1,
0.9655418, 1.075714, -0.05734066, 1, 1, 1, 1, 1,
0.9671668, 1.748383, 0.4016887, 1, 1, 1, 1, 1,
0.9690818, 0.3514949, 0.3682299, 1, 1, 1, 1, 1,
0.9751203, -1.649468, 2.161103, 1, 1, 1, 1, 1,
0.9800327, -0.03498872, 0.3427286, 1, 1, 1, 1, 1,
0.9806733, 0.5615594, 1.322544, 1, 1, 1, 1, 1,
0.9853276, 0.02982474, 2.727122, 1, 1, 1, 1, 1,
0.9939067, 2.401606, 2.158372, 1, 1, 1, 1, 1,
0.9955338, 1.838295, 0.9510649, 1, 1, 1, 1, 1,
0.9967953, 0.1999143, 2.034303, 1, 1, 1, 1, 1,
0.9991145, -0.3079072, 2.14443, 0, 0, 1, 1, 1,
1.00519, 0.8223386, 0.3767438, 1, 0, 0, 1, 1,
1.005398, -0.2520941, 1.705311, 1, 0, 0, 1, 1,
1.006841, 0.9424034, 0.8424652, 1, 0, 0, 1, 1,
1.011357, 0.4839209, 1.111202, 1, 0, 0, 1, 1,
1.020216, 0.08954927, 0.6101179, 1, 0, 0, 1, 1,
1.022848, -0.1188146, 2.556097, 0, 0, 0, 1, 1,
1.025623, 2.220429, -0.241698, 0, 0, 0, 1, 1,
1.029502, -1.785295, 2.789856, 0, 0, 0, 1, 1,
1.029574, -0.05618077, 1.982391, 0, 0, 0, 1, 1,
1.040571, -0.05653546, 1.456908, 0, 0, 0, 1, 1,
1.054142, -0.3959562, 3.509683, 0, 0, 0, 1, 1,
1.062204, 0.2501843, 3.573865, 0, 0, 0, 1, 1,
1.064701, -0.1443706, 0.2609686, 1, 1, 1, 1, 1,
1.065514, -2.471942, 2.445763, 1, 1, 1, 1, 1,
1.088956, -0.2718989, 1.390691, 1, 1, 1, 1, 1,
1.092023, -0.2260816, 0.7776402, 1, 1, 1, 1, 1,
1.093812, 0.7237035, 1.269967, 1, 1, 1, 1, 1,
1.095982, 1.063435, 0.5372, 1, 1, 1, 1, 1,
1.098539, -0.8453186, 2.442203, 1, 1, 1, 1, 1,
1.102984, -0.3531654, 2.147022, 1, 1, 1, 1, 1,
1.10622, 1.038692, 1.786477, 1, 1, 1, 1, 1,
1.115746, -1.621567, 2.577216, 1, 1, 1, 1, 1,
1.127257, 0.2827582, 2.439143, 1, 1, 1, 1, 1,
1.144016, 1.653726, 1.264225, 1, 1, 1, 1, 1,
1.145267, -0.1625544, 0.8328404, 1, 1, 1, 1, 1,
1.147808, 0.269174, 0.9859958, 1, 1, 1, 1, 1,
1.149706, -0.2952304, 1.105827, 1, 1, 1, 1, 1,
1.151322, -0.7357841, 4.060735, 0, 0, 1, 1, 1,
1.154097, -0.9399576, 2.134253, 1, 0, 0, 1, 1,
1.154348, -0.7403103, 1.306846, 1, 0, 0, 1, 1,
1.156732, 0.4388109, 2.785594, 1, 0, 0, 1, 1,
1.166587, -0.8372399, 2.777035, 1, 0, 0, 1, 1,
1.168217, 1.64338, -1.47623, 1, 0, 0, 1, 1,
1.168908, -0.1460014, 1.600525, 0, 0, 0, 1, 1,
1.170372, -0.7231652, 2.90645, 0, 0, 0, 1, 1,
1.174424, 1.703775, -0.6129246, 0, 0, 0, 1, 1,
1.179846, 0.2086319, 1.061034, 0, 0, 0, 1, 1,
1.17988, -0.2914683, 1.202745, 0, 0, 0, 1, 1,
1.182171, 0.4503852, 1.537939, 0, 0, 0, 1, 1,
1.187356, 0.5561095, 2.405122, 0, 0, 0, 1, 1,
1.18807, -2.702819, 3.512321, 1, 1, 1, 1, 1,
1.194493, 0.7556136, 0.8551572, 1, 1, 1, 1, 1,
1.203317, -0.3685255, 3.203197, 1, 1, 1, 1, 1,
1.206951, -1.227277, 3.436286, 1, 1, 1, 1, 1,
1.214224, 0.9830122, 1.471632, 1, 1, 1, 1, 1,
1.233522, -0.002427197, 1.666796, 1, 1, 1, 1, 1,
1.241396, 0.6135991, 0.8648512, 1, 1, 1, 1, 1,
1.285773, -0.9750888, 2.793486, 1, 1, 1, 1, 1,
1.293208, -0.1657837, 2.567963, 1, 1, 1, 1, 1,
1.303278, 1.085267, -1.094998, 1, 1, 1, 1, 1,
1.310377, -0.182485, 1.847924, 1, 1, 1, 1, 1,
1.312959, 0.6870447, -0.2663441, 1, 1, 1, 1, 1,
1.322547, -0.9003507, 2.386552, 1, 1, 1, 1, 1,
1.323631, 0.03394023, 1.286288, 1, 1, 1, 1, 1,
1.327734, -0.5174668, 3.286655, 1, 1, 1, 1, 1,
1.330698, 1.545585, -0.05965726, 0, 0, 1, 1, 1,
1.332251, 0.001841518, 1.96761, 1, 0, 0, 1, 1,
1.332316, -0.8577411, 1.232911, 1, 0, 0, 1, 1,
1.345901, 0.02339508, 1.601472, 1, 0, 0, 1, 1,
1.35376, 1.115317, 1.769, 1, 0, 0, 1, 1,
1.358105, 1.30595, -0.4486746, 1, 0, 0, 1, 1,
1.359788, -2.049496, 4.066418, 0, 0, 0, 1, 1,
1.36289, -0.03232146, 0.6500358, 0, 0, 0, 1, 1,
1.366689, -0.697849, -0.2331533, 0, 0, 0, 1, 1,
1.368947, -1.006045, 4.392577, 0, 0, 0, 1, 1,
1.373197, -2.088955, 2.364044, 0, 0, 0, 1, 1,
1.376518, 0.006143836, 1.95596, 0, 0, 0, 1, 1,
1.382088, -2.396234, 1.689259, 0, 0, 0, 1, 1,
1.383639, -1.182631, 2.44096, 1, 1, 1, 1, 1,
1.391859, 1.667207, 0.7319232, 1, 1, 1, 1, 1,
1.393243, 1.399348, 2.227183, 1, 1, 1, 1, 1,
1.398647, -0.007122914, 2.288542, 1, 1, 1, 1, 1,
1.405355, 1.149796, -0.5931134, 1, 1, 1, 1, 1,
1.408527, -0.4817597, 1.840304, 1, 1, 1, 1, 1,
1.410694, 1.127119, -0.1534956, 1, 1, 1, 1, 1,
1.413417, -1.698959, 2.936262, 1, 1, 1, 1, 1,
1.417399, -1.561972, 0.2496103, 1, 1, 1, 1, 1,
1.419798, -0.7476611, 2.266855, 1, 1, 1, 1, 1,
1.420985, 0.2160911, 0.495228, 1, 1, 1, 1, 1,
1.443662, 1.036766, 1.669149, 1, 1, 1, 1, 1,
1.448245, -1.371446, 1.470262, 1, 1, 1, 1, 1,
1.448443, 1.954802, 0.5813738, 1, 1, 1, 1, 1,
1.467247, 1.419281, 2.42094, 1, 1, 1, 1, 1,
1.47701, -0.3302754, 1.326598, 0, 0, 1, 1, 1,
1.481479, -0.6055172, 2.838063, 1, 0, 0, 1, 1,
1.483618, 1.017927, -0.8955751, 1, 0, 0, 1, 1,
1.52624, -0.5292444, 2.412619, 1, 0, 0, 1, 1,
1.533186, 1.348011, -1.212852, 1, 0, 0, 1, 1,
1.536493, -1.245183, 2.561474, 1, 0, 0, 1, 1,
1.54256, -0.0566103, 1.451927, 0, 0, 0, 1, 1,
1.543161, 0.237117, 1.860966, 0, 0, 0, 1, 1,
1.552683, -0.4662213, 3.336368, 0, 0, 0, 1, 1,
1.56996, 1.686269, 0.7433566, 0, 0, 0, 1, 1,
1.578489, 0.4404894, 0.7720985, 0, 0, 0, 1, 1,
1.588163, 0.8207784, 0.894894, 0, 0, 0, 1, 1,
1.588332, 0.8937841, -1.196823, 0, 0, 0, 1, 1,
1.591892, 0.4109828, 0.7273477, 1, 1, 1, 1, 1,
1.599398, 2.047628, 0.2791561, 1, 1, 1, 1, 1,
1.603825, -0.9821165, 1.200521, 1, 1, 1, 1, 1,
1.605817, -0.385935, 2.751954, 1, 1, 1, 1, 1,
1.631168, 0.364138, 0.5641311, 1, 1, 1, 1, 1,
1.631851, 0.06566791, 1.162273, 1, 1, 1, 1, 1,
1.638448, 0.5959674, 0.214032, 1, 1, 1, 1, 1,
1.643511, 0.1139983, 0.4850916, 1, 1, 1, 1, 1,
1.649472, -0.6363469, 1.871456, 1, 1, 1, 1, 1,
1.650372, 0.082998, 2.393026, 1, 1, 1, 1, 1,
1.667707, 0.3533508, 2.021874, 1, 1, 1, 1, 1,
1.672268, 0.6093574, 0.4167739, 1, 1, 1, 1, 1,
1.695052, 0.702113, 0.7116582, 1, 1, 1, 1, 1,
1.701415, -1.509747, 2.130548, 1, 1, 1, 1, 1,
1.70456, -1.27436, 3.481265, 1, 1, 1, 1, 1,
1.707375, -0.5850542, 1.937798, 0, 0, 1, 1, 1,
1.730244, 1.342871, 1.169156, 1, 0, 0, 1, 1,
1.731262, -0.6443012, 3.09827, 1, 0, 0, 1, 1,
1.734124, 0.4546587, 1.257604, 1, 0, 0, 1, 1,
1.742923, 1.486432, -0.1233732, 1, 0, 0, 1, 1,
1.750224, -0.07896235, 2.490629, 1, 0, 0, 1, 1,
1.782204, -1.418699, 1.6805, 0, 0, 0, 1, 1,
1.787479, 0.2798474, 1.675964, 0, 0, 0, 1, 1,
1.808875, 0.435627, 2.409546, 0, 0, 0, 1, 1,
1.809921, -0.5556001, 0.0680142, 0, 0, 0, 1, 1,
1.829839, -0.8998643, 2.383826, 0, 0, 0, 1, 1,
1.830135, 0.4335995, 1.380617, 0, 0, 0, 1, 1,
1.830369, -0.8331314, 2.442897, 0, 0, 0, 1, 1,
1.83452, -1.920281, 1.029568, 1, 1, 1, 1, 1,
1.858189, 0.5398202, -0.02115484, 1, 1, 1, 1, 1,
1.875002, -0.1277159, 0.7231302, 1, 1, 1, 1, 1,
1.896765, 1.156092, 0.976064, 1, 1, 1, 1, 1,
1.905266, -0.08725926, 2.4873, 1, 1, 1, 1, 1,
1.915921, -2.181337, 0.8981187, 1, 1, 1, 1, 1,
1.917756, -0.2651017, 2.193414, 1, 1, 1, 1, 1,
1.955851, -1.719993, 1.168107, 1, 1, 1, 1, 1,
1.970108, -1.484852, 1.833018, 1, 1, 1, 1, 1,
1.97384, -0.7187104, 1.299881, 1, 1, 1, 1, 1,
1.974372, -0.860473, 1.048305, 1, 1, 1, 1, 1,
1.994082, -0.05161761, 2.489492, 1, 1, 1, 1, 1,
2.016479, 0.9518077, 2.418767, 1, 1, 1, 1, 1,
2.023773, -0.8741846, 1.39973, 1, 1, 1, 1, 1,
2.028712, 0.2198579, -0.1178928, 1, 1, 1, 1, 1,
2.046908, 1.74619, 1.750801, 0, 0, 1, 1, 1,
2.065589, 0.1661414, 0.1444243, 1, 0, 0, 1, 1,
2.078083, 0.2976986, 0.9483017, 1, 0, 0, 1, 1,
2.081856, 0.436823, 0.8444175, 1, 0, 0, 1, 1,
2.094342, -0.531831, 2.705308, 1, 0, 0, 1, 1,
2.104791, -1.115225, 2.219941, 1, 0, 0, 1, 1,
2.112027, 0.009379209, 1.614545, 0, 0, 0, 1, 1,
2.135983, 0.536811, 1.826328, 0, 0, 0, 1, 1,
2.150761, 1.532942, 2.652575, 0, 0, 0, 1, 1,
2.196923, 0.4057009, 0.07714395, 0, 0, 0, 1, 1,
2.211025, -0.3361267, 2.082509, 0, 0, 0, 1, 1,
2.216021, 0.6620319, 1.696735, 0, 0, 0, 1, 1,
2.2225, -0.3480121, 2.263116, 0, 0, 0, 1, 1,
2.295867, 0.6269078, -1.418178, 1, 1, 1, 1, 1,
2.31024, -0.6622151, 2.281081, 1, 1, 1, 1, 1,
2.314603, -1.406307, 1.134092, 1, 1, 1, 1, 1,
2.341853, -0.6293818, 2.459776, 1, 1, 1, 1, 1,
2.423206, -0.7397144, 2.02163, 1, 1, 1, 1, 1,
2.45355, -1.302738, 1.801044, 1, 1, 1, 1, 1,
2.5179, -0.6815354, 2.219198, 1, 1, 1, 1, 1
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
var radius = 9.473237;
var distance = 33.27435;
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
mvMatrix.translate( 0.5664625, 0.384222, 0.3630047 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.27435);
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
