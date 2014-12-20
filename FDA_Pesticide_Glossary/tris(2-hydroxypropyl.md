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
-2.917198, -0.7659059, -1.836701, 1, 0, 0, 1,
-2.898936, -0.2570049, 0.1442318, 1, 0.007843138, 0, 1,
-2.846058, -0.6794409, -2.277115, 1, 0.01176471, 0, 1,
-2.808693, -0.2668651, -2.594893, 1, 0.01960784, 0, 1,
-2.751878, 0.8931519, -2.168702, 1, 0.02352941, 0, 1,
-2.720824, 0.7111343, -1.271399, 1, 0.03137255, 0, 1,
-2.665335, 0.0485296, -2.373825, 1, 0.03529412, 0, 1,
-2.634037, -0.7315482, -1.292294, 1, 0.04313726, 0, 1,
-2.58713, -0.7903753, -2.4944, 1, 0.04705882, 0, 1,
-2.586638, 1.356466, 0.7174621, 1, 0.05490196, 0, 1,
-2.583147, 0.4267359, -1.772666, 1, 0.05882353, 0, 1,
-2.540644, -1.768772, -2.295026, 1, 0.06666667, 0, 1,
-2.453488, 0.5969761, 2.127285, 1, 0.07058824, 0, 1,
-2.427017, 2.714593, -1.873684, 1, 0.07843138, 0, 1,
-2.310591, 0.6530869, -1.538246, 1, 0.08235294, 0, 1,
-2.294298, -0.5410607, -2.237572, 1, 0.09019608, 0, 1,
-2.272762, 0.8374972, -1.04995, 1, 0.09411765, 0, 1,
-2.219581, -0.2232461, -1.72096, 1, 0.1019608, 0, 1,
-2.206848, 1.18324, 1.090214, 1, 0.1098039, 0, 1,
-2.203206, 0.3733552, -0.7479342, 1, 0.1137255, 0, 1,
-2.169347, 0.7568833, -1.62341, 1, 0.1215686, 0, 1,
-2.163438, -0.3434459, 0.3402586, 1, 0.1254902, 0, 1,
-2.124759, -0.8905464, -0.7810656, 1, 0.1333333, 0, 1,
-2.086298, -0.5201599, -1.339415, 1, 0.1372549, 0, 1,
-2.076655, 0.6794162, -0.4639175, 1, 0.145098, 0, 1,
-2.051572, 0.3462399, -0.3260157, 1, 0.1490196, 0, 1,
-2.028037, -1.143626, -3.081673, 1, 0.1568628, 0, 1,
-2.023074, 1.867663, -1.587588, 1, 0.1607843, 0, 1,
-1.995249, 0.6449499, -0.9385052, 1, 0.1686275, 0, 1,
-1.993758, -0.1916959, -1.961868, 1, 0.172549, 0, 1,
-1.988077, -0.04234937, -2.428415, 1, 0.1803922, 0, 1,
-1.958192, 0.6653907, 0.167662, 1, 0.1843137, 0, 1,
-1.937829, 0.1014295, -2.693506, 1, 0.1921569, 0, 1,
-1.927585, 1.643927, -0.2406299, 1, 0.1960784, 0, 1,
-1.914481, 1.141885, 0.468247, 1, 0.2039216, 0, 1,
-1.908529, -0.6236267, -0.8839982, 1, 0.2117647, 0, 1,
-1.864468, -1.005447, -1.515465, 1, 0.2156863, 0, 1,
-1.860878, 0.5207277, -1.075579, 1, 0.2235294, 0, 1,
-1.852661, -0.7488576, -2.357198, 1, 0.227451, 0, 1,
-1.842039, -0.5286852, -1.080175, 1, 0.2352941, 0, 1,
-1.839972, -0.02953728, -1.975338, 1, 0.2392157, 0, 1,
-1.8343, 1.240545, -1.826208, 1, 0.2470588, 0, 1,
-1.820447, 0.2377061, -1.515625, 1, 0.2509804, 0, 1,
-1.812192, 2.293892, -0.6925088, 1, 0.2588235, 0, 1,
-1.796504, 0.0901188, -0.8826671, 1, 0.2627451, 0, 1,
-1.795241, -1.484234, -2.435551, 1, 0.2705882, 0, 1,
-1.79264, 1.297184, -3.350975, 1, 0.2745098, 0, 1,
-1.782062, -2.097801, -3.273493, 1, 0.282353, 0, 1,
-1.762995, -0.7750705, -1.368912, 1, 0.2862745, 0, 1,
-1.729772, 0.5391079, -0.7775309, 1, 0.2941177, 0, 1,
-1.729728, 0.366304, -1.184694, 1, 0.3019608, 0, 1,
-1.726555, -1.128226, -2.527454, 1, 0.3058824, 0, 1,
-1.702964, 2.349611, -1.480972, 1, 0.3137255, 0, 1,
-1.700097, -2.414286, -1.886833, 1, 0.3176471, 0, 1,
-1.669156, -0.6113689, -1.666776, 1, 0.3254902, 0, 1,
-1.661373, 1.262531, -1.498212, 1, 0.3294118, 0, 1,
-1.658184, -0.2877821, -1.186998, 1, 0.3372549, 0, 1,
-1.655844, -0.04551878, -1.742788, 1, 0.3411765, 0, 1,
-1.654444, -0.5465195, -2.476013, 1, 0.3490196, 0, 1,
-1.648873, -0.056121, -1.510084, 1, 0.3529412, 0, 1,
-1.635105, 0.6269819, -2.413391, 1, 0.3607843, 0, 1,
-1.634724, 0.8888587, -0.5394592, 1, 0.3647059, 0, 1,
-1.621904, -1.050857, -3.239059, 1, 0.372549, 0, 1,
-1.619905, 0.7633551, -0.5732337, 1, 0.3764706, 0, 1,
-1.603597, -0.5520661, -1.760204, 1, 0.3843137, 0, 1,
-1.598263, 0.1872134, -0.2227939, 1, 0.3882353, 0, 1,
-1.580933, 0.6803312, -2.719285, 1, 0.3960784, 0, 1,
-1.572153, 0.04456421, 0.5648143, 1, 0.4039216, 0, 1,
-1.518326, -1.179032, -2.202671, 1, 0.4078431, 0, 1,
-1.499798, -1.906053, -2.095883, 1, 0.4156863, 0, 1,
-1.484431, 0.09399814, -0.951533, 1, 0.4196078, 0, 1,
-1.464285, -0.8492008, -0.6108349, 1, 0.427451, 0, 1,
-1.444073, 0.2984394, -0.4268002, 1, 0.4313726, 0, 1,
-1.43566, 0.8020675, -1.537667, 1, 0.4392157, 0, 1,
-1.430663, -2.068376, -2.567742, 1, 0.4431373, 0, 1,
-1.426481, 0.4983373, -0.4192118, 1, 0.4509804, 0, 1,
-1.425066, -0.5917857, -0.9307927, 1, 0.454902, 0, 1,
-1.423544, -0.6856179, -3.456216, 1, 0.4627451, 0, 1,
-1.422896, -0.7370749, -1.087479, 1, 0.4666667, 0, 1,
-1.390357, -1.158096, -1.286389, 1, 0.4745098, 0, 1,
-1.360114, -1.769524, -3.165419, 1, 0.4784314, 0, 1,
-1.359231, -0.09322996, -2.230909, 1, 0.4862745, 0, 1,
-1.353365, 0.2489464, -0.8790587, 1, 0.4901961, 0, 1,
-1.347252, -0.9944941, -2.738977, 1, 0.4980392, 0, 1,
-1.32624, -1.094383, -2.880812, 1, 0.5058824, 0, 1,
-1.316674, -0.9520665, -2.198389, 1, 0.509804, 0, 1,
-1.305689, 0.2163318, -0.9549987, 1, 0.5176471, 0, 1,
-1.279671, -0.2504793, -1.303817, 1, 0.5215687, 0, 1,
-1.276233, -0.8681906, -4.022274, 1, 0.5294118, 0, 1,
-1.275398, 0.7004455, -1.627105, 1, 0.5333334, 0, 1,
-1.261395, -1.143028, -2.696737, 1, 0.5411765, 0, 1,
-1.259707, 1.212302, -1.515318, 1, 0.5450981, 0, 1,
-1.256907, -1.53022, -1.896669, 1, 0.5529412, 0, 1,
-1.256466, 0.7885988, -2.052757, 1, 0.5568628, 0, 1,
-1.245761, -0.2269813, -2.277761, 1, 0.5647059, 0, 1,
-1.241127, 2.64325, -1.5257, 1, 0.5686275, 0, 1,
-1.240045, -0.4925484, -2.49625, 1, 0.5764706, 0, 1,
-1.237213, 1.387848, 0.2510517, 1, 0.5803922, 0, 1,
-1.223959, -0.3557, -1.172022, 1, 0.5882353, 0, 1,
-1.219437, 0.4141444, -1.495909, 1, 0.5921569, 0, 1,
-1.208652, 0.4872382, -2.128116, 1, 0.6, 0, 1,
-1.202838, 2.507642, -0.3178279, 1, 0.6078432, 0, 1,
-1.198559, 1.859581, -1.00665, 1, 0.6117647, 0, 1,
-1.191817, 0.1749985, -1.391845, 1, 0.6196079, 0, 1,
-1.190795, 1.018651, -1.946207, 1, 0.6235294, 0, 1,
-1.181566, -0.3922326, -1.649903, 1, 0.6313726, 0, 1,
-1.175173, 0.3241877, -2.051551, 1, 0.6352941, 0, 1,
-1.172917, 0.2370573, -0.8131831, 1, 0.6431373, 0, 1,
-1.172696, -2.876985, -1.248319, 1, 0.6470588, 0, 1,
-1.170823, -0.9172701, -2.375062, 1, 0.654902, 0, 1,
-1.169106, -0.2737053, -2.454824, 1, 0.6588235, 0, 1,
-1.168814, -0.03706554, -1.978709, 1, 0.6666667, 0, 1,
-1.168316, -1.317625, -1.98803, 1, 0.6705883, 0, 1,
-1.161742, -0.4548141, -1.717433, 1, 0.6784314, 0, 1,
-1.155513, 1.236952, -1.169209, 1, 0.682353, 0, 1,
-1.138523, -0.5599187, -0.4141285, 1, 0.6901961, 0, 1,
-1.133645, 0.715185, 0.2956162, 1, 0.6941177, 0, 1,
-1.127667, -0.981527, -3.361997, 1, 0.7019608, 0, 1,
-1.119976, -0.6851578, -3.520483, 1, 0.7098039, 0, 1,
-1.095996, -1.55638, -1.220265, 1, 0.7137255, 0, 1,
-1.091999, -0.1401781, -0.9179203, 1, 0.7215686, 0, 1,
-1.09062, 1.963909, 0.4515224, 1, 0.7254902, 0, 1,
-1.090567, 0.9936688, -0.1766816, 1, 0.7333333, 0, 1,
-1.088277, -1.92885, -4.281002, 1, 0.7372549, 0, 1,
-1.08558, 0.145725, -2.265848, 1, 0.7450981, 0, 1,
-1.083952, -0.05368347, -2.487061, 1, 0.7490196, 0, 1,
-1.07388, -0.7161086, -1.213811, 1, 0.7568628, 0, 1,
-1.073365, 0.2739145, -2.53713, 1, 0.7607843, 0, 1,
-1.072367, -1.380867, -2.972845, 1, 0.7686275, 0, 1,
-1.066045, 0.7064776, -0.130077, 1, 0.772549, 0, 1,
-1.065217, 2.097047, -1.96315, 1, 0.7803922, 0, 1,
-1.060066, -1.573271, -1.048709, 1, 0.7843137, 0, 1,
-1.05939, 0.1357769, -1.314332, 1, 0.7921569, 0, 1,
-1.057913, -0.0304773, -2.887221, 1, 0.7960784, 0, 1,
-1.057805, -0.58662, -1.026878, 1, 0.8039216, 0, 1,
-1.055466, -1.624019, -1.79434, 1, 0.8117647, 0, 1,
-1.054003, -0.0144518, -0.1509568, 1, 0.8156863, 0, 1,
-1.053437, 0.9514632, -1.267437, 1, 0.8235294, 0, 1,
-1.050621, -0.2043493, -3.017273, 1, 0.827451, 0, 1,
-1.050369, -1.551947, -2.904095, 1, 0.8352941, 0, 1,
-1.045789, 1.077659, -1.487464, 1, 0.8392157, 0, 1,
-1.043939, 0.2954515, -0.01307185, 1, 0.8470588, 0, 1,
-1.038695, -0.4993173, -1.812376, 1, 0.8509804, 0, 1,
-1.030357, 0.8960851, 0.3475799, 1, 0.8588235, 0, 1,
-1.02623, 0.6282614, -2.435302, 1, 0.8627451, 0, 1,
-1.022198, -0.5450976, -2.157492, 1, 0.8705882, 0, 1,
-1.021439, -0.7131865, -3.223266, 1, 0.8745098, 0, 1,
-1.015708, -1.280917, -3.148089, 1, 0.8823529, 0, 1,
-1.013057, 0.2451092, -0.6636266, 1, 0.8862745, 0, 1,
-1.009959, 0.5756494, -0.6831752, 1, 0.8941177, 0, 1,
-1.004136, 0.935202, -1.582174, 1, 0.8980392, 0, 1,
-0.9939639, -0.426473, -1.215034, 1, 0.9058824, 0, 1,
-0.9899957, -0.9841813, -0.3472209, 1, 0.9137255, 0, 1,
-0.9896076, 0.5872093, -0.9582363, 1, 0.9176471, 0, 1,
-0.9886023, 2.170774, -2.06268, 1, 0.9254902, 0, 1,
-0.9778427, -1.126006, -2.178874, 1, 0.9294118, 0, 1,
-0.9727026, 1.054468, -0.2359851, 1, 0.9372549, 0, 1,
-0.9722051, 0.6661554, -1.580822, 1, 0.9411765, 0, 1,
-0.9713801, 0.04028949, -3.694864, 1, 0.9490196, 0, 1,
-0.9697513, 0.8096179, -1.90118, 1, 0.9529412, 0, 1,
-0.9667619, -0.7240008, -4.229784, 1, 0.9607843, 0, 1,
-0.965397, 0.9357558, -1.057041, 1, 0.9647059, 0, 1,
-0.9605275, 0.5699425, -3.314156, 1, 0.972549, 0, 1,
-0.9483867, -0.5386661, -2.642357, 1, 0.9764706, 0, 1,
-0.9414266, 0.863023, 1.740152, 1, 0.9843137, 0, 1,
-0.9337125, -1.545768, -1.767282, 1, 0.9882353, 0, 1,
-0.9287633, 0.8304863, 0.5358596, 1, 0.9960784, 0, 1,
-0.9276583, -0.8803192, -3.297545, 0.9960784, 1, 0, 1,
-0.9240367, 1.337046, -2.323666, 0.9921569, 1, 0, 1,
-0.908569, -1.053074, -1.874215, 0.9843137, 1, 0, 1,
-0.9078869, -0.4114926, -0.9738646, 0.9803922, 1, 0, 1,
-0.9053301, 1.133799, 0.927469, 0.972549, 1, 0, 1,
-0.9034166, -0.8397339, -2.981244, 0.9686275, 1, 0, 1,
-0.9032643, -0.6917549, -2.115542, 0.9607843, 1, 0, 1,
-0.9014888, 1.070122, -0.6496104, 0.9568627, 1, 0, 1,
-0.8985939, 0.03168545, -0.4744802, 0.9490196, 1, 0, 1,
-0.8905743, 0.2833155, -0.9134834, 0.945098, 1, 0, 1,
-0.8767122, -0.6648908, -1.327165, 0.9372549, 1, 0, 1,
-0.8712073, 0.6327611, -1.878157, 0.9333333, 1, 0, 1,
-0.8684454, 1.395358, -1.274736, 0.9254902, 1, 0, 1,
-0.8567574, 1.334899, -0.1879699, 0.9215686, 1, 0, 1,
-0.8300705, 0.1387994, -1.49655, 0.9137255, 1, 0, 1,
-0.8242792, -0.05783247, 0.2630136, 0.9098039, 1, 0, 1,
-0.8213519, 1.255293, 0.2884889, 0.9019608, 1, 0, 1,
-0.8205032, 1.429903, -0.787673, 0.8941177, 1, 0, 1,
-0.8196131, -0.9830359, -4.075809, 0.8901961, 1, 0, 1,
-0.8174756, -0.4949666, -2.52343, 0.8823529, 1, 0, 1,
-0.8130271, 1.076969, -1.665873, 0.8784314, 1, 0, 1,
-0.8124577, 1.233979, -0.4312519, 0.8705882, 1, 0, 1,
-0.8096578, -2.241498, -4.807549, 0.8666667, 1, 0, 1,
-0.80739, 1.567529, -0.3547015, 0.8588235, 1, 0, 1,
-0.7912934, -0.8226022, -1.877286, 0.854902, 1, 0, 1,
-0.7903274, -1.533704, -4.046901, 0.8470588, 1, 0, 1,
-0.7866526, 0.3408321, -0.7992437, 0.8431373, 1, 0, 1,
-0.7864491, -0.3233753, -0.3639294, 0.8352941, 1, 0, 1,
-0.7861077, 0.5707223, 0.2239631, 0.8313726, 1, 0, 1,
-0.7838621, 0.05224094, -1.379172, 0.8235294, 1, 0, 1,
-0.7808169, -0.678553, -0.8929138, 0.8196079, 1, 0, 1,
-0.7793134, -1.570255, -4.177107, 0.8117647, 1, 0, 1,
-0.7777198, -0.2752181, -4.224194, 0.8078431, 1, 0, 1,
-0.7757062, -0.4230398, -2.692234, 0.8, 1, 0, 1,
-0.7752941, 0.003184935, -3.298901, 0.7921569, 1, 0, 1,
-0.7750179, 0.6735814, -0.9431869, 0.7882353, 1, 0, 1,
-0.7748037, 0.2045455, -1.492685, 0.7803922, 1, 0, 1,
-0.7701001, 0.7672926, -1.222246, 0.7764706, 1, 0, 1,
-0.7664648, 1.881306, -0.3275185, 0.7686275, 1, 0, 1,
-0.7602369, -0.7756853, -2.254877, 0.7647059, 1, 0, 1,
-0.7590266, -0.8036016, -1.850151, 0.7568628, 1, 0, 1,
-0.7573553, -0.8284683, -3.38285, 0.7529412, 1, 0, 1,
-0.7571312, -0.5423036, -2.391943, 0.7450981, 1, 0, 1,
-0.751925, 0.5716542, -0.5030543, 0.7411765, 1, 0, 1,
-0.7494332, 0.5381734, -1.473798, 0.7333333, 1, 0, 1,
-0.7437536, 1.80194, -1.341187, 0.7294118, 1, 0, 1,
-0.7369444, -1.88836, -2.929184, 0.7215686, 1, 0, 1,
-0.7351646, -0.3160274, -3.196769, 0.7176471, 1, 0, 1,
-0.7349095, 0.1168412, -1.452786, 0.7098039, 1, 0, 1,
-0.7276929, 0.3665614, -2.259081, 0.7058824, 1, 0, 1,
-0.727038, 0.2936149, -0.9829538, 0.6980392, 1, 0, 1,
-0.726435, -0.9857221, -2.562077, 0.6901961, 1, 0, 1,
-0.7263483, 0.3398009, -0.7926707, 0.6862745, 1, 0, 1,
-0.7175232, 1.255622, -0.8738269, 0.6784314, 1, 0, 1,
-0.717284, -0.2877755, -2.18496, 0.6745098, 1, 0, 1,
-0.7147147, 0.6476942, 0.3221746, 0.6666667, 1, 0, 1,
-0.7120723, -1.94653, -2.666314, 0.6627451, 1, 0, 1,
-0.7051398, -1.511527, -3.072541, 0.654902, 1, 0, 1,
-0.7001995, -1.01004, -1.888402, 0.6509804, 1, 0, 1,
-0.6969181, -1.353639, -1.867374, 0.6431373, 1, 0, 1,
-0.6947986, 1.279078, 0.6488082, 0.6392157, 1, 0, 1,
-0.6940922, -0.9578642, -2.220066, 0.6313726, 1, 0, 1,
-0.6924571, -1.463517, -2.375411, 0.627451, 1, 0, 1,
-0.6877697, 0.2267036, -0.3371715, 0.6196079, 1, 0, 1,
-0.6832618, 1.904706, -0.1720675, 0.6156863, 1, 0, 1,
-0.6826337, -0.2829844, -1.25955, 0.6078432, 1, 0, 1,
-0.6594892, 1.409585, -0.9355417, 0.6039216, 1, 0, 1,
-0.6532919, -0.2970083, -1.601714, 0.5960785, 1, 0, 1,
-0.6508957, 0.9252622, -1.400803, 0.5882353, 1, 0, 1,
-0.6503186, 0.9469856, -2.642843, 0.5843138, 1, 0, 1,
-0.6432103, -0.2049282, -1.276655, 0.5764706, 1, 0, 1,
-0.6424428, 0.2776214, -2.974779, 0.572549, 1, 0, 1,
-0.6412907, 0.9236009, -1.044826, 0.5647059, 1, 0, 1,
-0.6296223, -0.4691277, -3.211314, 0.5607843, 1, 0, 1,
-0.6272612, -0.819325, -1.594132, 0.5529412, 1, 0, 1,
-0.6221558, -0.6163246, -1.824894, 0.5490196, 1, 0, 1,
-0.6218327, -0.3013423, -3.256654, 0.5411765, 1, 0, 1,
-0.6207893, 0.2728322, -1.296083, 0.5372549, 1, 0, 1,
-0.6178498, 0.4310651, 0.8796951, 0.5294118, 1, 0, 1,
-0.6167238, -1.218647, -2.259467, 0.5254902, 1, 0, 1,
-0.6151839, 0.3551638, -2.067414, 0.5176471, 1, 0, 1,
-0.6147887, 0.9779624, -0.4676149, 0.5137255, 1, 0, 1,
-0.6120343, 1.232665, -1.37183, 0.5058824, 1, 0, 1,
-0.6068362, 0.3388226, -1.460754, 0.5019608, 1, 0, 1,
-0.6059775, -0.5724063, -2.709942, 0.4941176, 1, 0, 1,
-0.6025049, -0.6979473, -2.518826, 0.4862745, 1, 0, 1,
-0.6017352, -0.5459081, -4.147292, 0.4823529, 1, 0, 1,
-0.5969558, 2.060056, 0.1720942, 0.4745098, 1, 0, 1,
-0.5962114, 1.427762, 1.292082, 0.4705882, 1, 0, 1,
-0.5903955, 0.9330625, -0.6659866, 0.4627451, 1, 0, 1,
-0.589888, -1.353821, -5.228133, 0.4588235, 1, 0, 1,
-0.5786057, -1.472813, -4.503765, 0.4509804, 1, 0, 1,
-0.57388, 0.8459105, -1.746162, 0.4470588, 1, 0, 1,
-0.573602, -0.5360261, -3.311739, 0.4392157, 1, 0, 1,
-0.5730238, 0.4054779, 0.555132, 0.4352941, 1, 0, 1,
-0.5716227, 0.928969, -0.415519, 0.427451, 1, 0, 1,
-0.5681771, -1.600332, -2.37784, 0.4235294, 1, 0, 1,
-0.5667648, 0.5488682, -0.2657048, 0.4156863, 1, 0, 1,
-0.5616739, -0.3280292, -1.114457, 0.4117647, 1, 0, 1,
-0.5583566, -0.8838933, -1.615168, 0.4039216, 1, 0, 1,
-0.5544696, -0.8229887, 0.09013943, 0.3960784, 1, 0, 1,
-0.5537804, -1.276543, -2.22952, 0.3921569, 1, 0, 1,
-0.5520843, 0.5617456, -0.8319714, 0.3843137, 1, 0, 1,
-0.5456573, -0.7573811, -2.44576, 0.3803922, 1, 0, 1,
-0.545391, -1.218513, -2.504118, 0.372549, 1, 0, 1,
-0.5453741, 1.673707, -0.6968116, 0.3686275, 1, 0, 1,
-0.5448527, -0.2169595, 0.04353664, 0.3607843, 1, 0, 1,
-0.5440283, 0.2961477, 0.03160991, 0.3568628, 1, 0, 1,
-0.5439996, 1.074594, 0.7556555, 0.3490196, 1, 0, 1,
-0.5394138, -0.2975827, -1.546556, 0.345098, 1, 0, 1,
-0.5360352, 1.381215, -1.542591, 0.3372549, 1, 0, 1,
-0.5308031, 0.808755, -0.1959551, 0.3333333, 1, 0, 1,
-0.5286946, -0.04657735, -1.114998, 0.3254902, 1, 0, 1,
-0.5268968, -0.4627872, -1.86542, 0.3215686, 1, 0, 1,
-0.5262065, -1.168223, -2.946994, 0.3137255, 1, 0, 1,
-0.5193714, 0.5867918, -1.379083, 0.3098039, 1, 0, 1,
-0.5172274, 0.3456197, -0.8266401, 0.3019608, 1, 0, 1,
-0.5153002, 1.10637, -1.562223, 0.2941177, 1, 0, 1,
-0.5074153, -0.4937941, -3.670376, 0.2901961, 1, 0, 1,
-0.5018989, -0.1726933, -2.645109, 0.282353, 1, 0, 1,
-0.5014705, 1.466213, 0.4183792, 0.2784314, 1, 0, 1,
-0.5006857, -1.055481, -3.039568, 0.2705882, 1, 0, 1,
-0.498489, 0.4844246, -1.516774, 0.2666667, 1, 0, 1,
-0.4906285, 0.3535856, -2.167666, 0.2588235, 1, 0, 1,
-0.4858302, -0.2109161, -3.967893, 0.254902, 1, 0, 1,
-0.4854462, 0.5542481, -1.820044, 0.2470588, 1, 0, 1,
-0.4840226, 0.1846971, -1.389349, 0.2431373, 1, 0, 1,
-0.4800068, 0.4551498, -1.423418, 0.2352941, 1, 0, 1,
-0.4783216, 1.989385, -0.6835167, 0.2313726, 1, 0, 1,
-0.4780337, -0.7688462, -3.615165, 0.2235294, 1, 0, 1,
-0.4767486, -0.1177265, -3.627164, 0.2196078, 1, 0, 1,
-0.4754184, 0.9748647, -1.423636, 0.2117647, 1, 0, 1,
-0.4697407, 0.2885428, -2.191195, 0.2078431, 1, 0, 1,
-0.4691839, -0.09877786, -2.108727, 0.2, 1, 0, 1,
-0.4685192, 0.7582203, -0.6592069, 0.1921569, 1, 0, 1,
-0.4676239, 0.8596622, -1.080577, 0.1882353, 1, 0, 1,
-0.4646618, 0.4710735, -0.1536788, 0.1803922, 1, 0, 1,
-0.4632376, -0.1408559, -1.01154, 0.1764706, 1, 0, 1,
-0.4576889, -1.494154, -2.306692, 0.1686275, 1, 0, 1,
-0.4566796, 1.095164, 0.260485, 0.1647059, 1, 0, 1,
-0.4534002, 0.4689572, -2.112345, 0.1568628, 1, 0, 1,
-0.4511517, 1.698906, 0.5755827, 0.1529412, 1, 0, 1,
-0.4497649, -0.2439552, -1.953189, 0.145098, 1, 0, 1,
-0.4460869, -1.042645, -2.740313, 0.1411765, 1, 0, 1,
-0.4434162, 0.8775361, 0.2560223, 0.1333333, 1, 0, 1,
-0.4403487, 0.7989303, 0.1913372, 0.1294118, 1, 0, 1,
-0.4356061, 2.334473, -2.330025, 0.1215686, 1, 0, 1,
-0.4321052, -0.2561384, -0.2817335, 0.1176471, 1, 0, 1,
-0.4319333, -0.2434436, -3.528512, 0.1098039, 1, 0, 1,
-0.4284537, 0.04677738, -2.170268, 0.1058824, 1, 0, 1,
-0.4276822, 0.9974307, 0.9602984, 0.09803922, 1, 0, 1,
-0.4256286, -0.5702674, -4.814424, 0.09019608, 1, 0, 1,
-0.4200561, 0.4259542, -0.5209627, 0.08627451, 1, 0, 1,
-0.4151012, 1.234641, -1.966159, 0.07843138, 1, 0, 1,
-0.4035607, -0.8661333, -3.883645, 0.07450981, 1, 0, 1,
-0.3999437, 0.5268909, -0.1951551, 0.06666667, 1, 0, 1,
-0.3995379, -0.3417234, -2.434268, 0.0627451, 1, 0, 1,
-0.3971789, -1.116608, -4.452998, 0.05490196, 1, 0, 1,
-0.3961221, -0.3698755, -4.07887, 0.05098039, 1, 0, 1,
-0.3885059, 0.9172202, 0.6279038, 0.04313726, 1, 0, 1,
-0.3856809, -0.6422861, -3.057352, 0.03921569, 1, 0, 1,
-0.3826528, -1.335736, -4.702843, 0.03137255, 1, 0, 1,
-0.3768933, -0.3778288, -3.306804, 0.02745098, 1, 0, 1,
-0.3767082, 0.1941966, -2.511284, 0.01960784, 1, 0, 1,
-0.3702298, 0.4109672, 0.2112098, 0.01568628, 1, 0, 1,
-0.3664907, 0.434642, -0.7581071, 0.007843138, 1, 0, 1,
-0.3641678, -0.161718, -1.536083, 0.003921569, 1, 0, 1,
-0.3631189, -0.2521318, -1.396471, 0, 1, 0.003921569, 1,
-0.3595453, -0.2467966, -2.818897, 0, 1, 0.01176471, 1,
-0.3549525, 0.9853247, 0.3501157, 0, 1, 0.01568628, 1,
-0.3541433, 0.3899749, 0.512121, 0, 1, 0.02352941, 1,
-0.3487933, -0.1559212, -1.590923, 0, 1, 0.02745098, 1,
-0.3464672, 0.2027918, -0.9885237, 0, 1, 0.03529412, 1,
-0.3454993, -0.9809074, -1.345473, 0, 1, 0.03921569, 1,
-0.3435954, 1.525855, 0.1709744, 0, 1, 0.04705882, 1,
-0.3433154, -0.958648, -2.676303, 0, 1, 0.05098039, 1,
-0.3389911, -1.717054, -2.485177, 0, 1, 0.05882353, 1,
-0.3386952, -0.8769259, -2.237135, 0, 1, 0.0627451, 1,
-0.3364878, -0.8962861, -1.045634, 0, 1, 0.07058824, 1,
-0.3363177, -0.4264843, -2.430246, 0, 1, 0.07450981, 1,
-0.329055, -1.668039, -2.206104, 0, 1, 0.08235294, 1,
-0.3282863, 0.06641366, -1.061436, 0, 1, 0.08627451, 1,
-0.32653, -0.9424887, -3.112499, 0, 1, 0.09411765, 1,
-0.3257342, -0.9107778, -1.766641, 0, 1, 0.1019608, 1,
-0.3250127, 0.03862218, -1.373386, 0, 1, 0.1058824, 1,
-0.3224173, -0.5650768, -2.120975, 0, 1, 0.1137255, 1,
-0.3113845, 0.1773284, -3.223268, 0, 1, 0.1176471, 1,
-0.3111337, -1.758537, -2.996574, 0, 1, 0.1254902, 1,
-0.3055315, 0.4757936, -2.057795, 0, 1, 0.1294118, 1,
-0.2982935, -0.6676837, -3.391672, 0, 1, 0.1372549, 1,
-0.2960445, 0.9343686, -0.853941, 0, 1, 0.1411765, 1,
-0.2946391, 0.5121633, -0.03891915, 0, 1, 0.1490196, 1,
-0.2926496, -0.9048771, -3.223794, 0, 1, 0.1529412, 1,
-0.2894688, 0.5457045, -0.2236629, 0, 1, 0.1607843, 1,
-0.2878465, 2.143351, 0.7044452, 0, 1, 0.1647059, 1,
-0.2878191, -0.1386229, -1.23679, 0, 1, 0.172549, 1,
-0.2808518, -1.285906, -0.5169635, 0, 1, 0.1764706, 1,
-0.2724535, 1.836915, -0.6724238, 0, 1, 0.1843137, 1,
-0.271818, -1.65861, -2.542732, 0, 1, 0.1882353, 1,
-0.2712537, -0.5761588, -3.236193, 0, 1, 0.1960784, 1,
-0.2700345, 1.064743, 0.6856024, 0, 1, 0.2039216, 1,
-0.2696855, -0.2980964, -2.583346, 0, 1, 0.2078431, 1,
-0.2676306, -0.1462424, -3.495867, 0, 1, 0.2156863, 1,
-0.2670695, 1.516364, 0.799393, 0, 1, 0.2196078, 1,
-0.2640699, -0.3837964, -1.842391, 0, 1, 0.227451, 1,
-0.2602443, -0.1678277, -2.474517, 0, 1, 0.2313726, 1,
-0.2602394, -0.6357626, -1.769643, 0, 1, 0.2392157, 1,
-0.2581598, -0.3869207, -0.6011326, 0, 1, 0.2431373, 1,
-0.2574689, 0.2434259, -2.524138, 0, 1, 0.2509804, 1,
-0.2520851, 0.1757612, -1.430866, 0, 1, 0.254902, 1,
-0.2497133, 0.03646548, -1.12921, 0, 1, 0.2627451, 1,
-0.2472578, 1.230855, -0.5159993, 0, 1, 0.2666667, 1,
-0.2443189, -0.1655825, -2.067863, 0, 1, 0.2745098, 1,
-0.2424794, 1.444457, -0.4684325, 0, 1, 0.2784314, 1,
-0.2413318, 0.1072189, -2.830016, 0, 1, 0.2862745, 1,
-0.2382001, 0.6116577, -0.6361982, 0, 1, 0.2901961, 1,
-0.2374701, -0.1246437, -2.059458, 0, 1, 0.2980392, 1,
-0.2283524, 0.3099436, -1.707641, 0, 1, 0.3058824, 1,
-0.2233672, -0.1749257, -2.871163, 0, 1, 0.3098039, 1,
-0.2225959, 1.203139, -0.22105, 0, 1, 0.3176471, 1,
-0.2219829, -0.7437937, -3.766401, 0, 1, 0.3215686, 1,
-0.221945, 0.07183771, -0.6749207, 0, 1, 0.3294118, 1,
-0.2147767, 0.1570757, -0.1490898, 0, 1, 0.3333333, 1,
-0.2137553, -0.6096522, -2.542312, 0, 1, 0.3411765, 1,
-0.2135744, -0.7113034, -4.558516, 0, 1, 0.345098, 1,
-0.2119053, 0.8856183, 0.7828325, 0, 1, 0.3529412, 1,
-0.2117739, -3.254615, -3.042821, 0, 1, 0.3568628, 1,
-0.2114856, 1.633405, -0.829047, 0, 1, 0.3647059, 1,
-0.207355, -0.04278343, -2.778273, 0, 1, 0.3686275, 1,
-0.2069014, -0.6292995, -2.412155, 0, 1, 0.3764706, 1,
-0.2067217, -0.4383231, -2.983006, 0, 1, 0.3803922, 1,
-0.2045633, -0.3086532, -3.41126, 0, 1, 0.3882353, 1,
-0.2016595, 0.4470029, -0.8133868, 0, 1, 0.3921569, 1,
-0.2011634, 0.1221454, -0.1418437, 0, 1, 0.4, 1,
-0.1988376, 1.47944, 0.6372602, 0, 1, 0.4078431, 1,
-0.1964169, -1.933383, -4.521129, 0, 1, 0.4117647, 1,
-0.1945412, -0.3685338, -0.9495437, 0, 1, 0.4196078, 1,
-0.1932796, -1.296868, -3.692481, 0, 1, 0.4235294, 1,
-0.1893991, 0.02587468, -0.5046157, 0, 1, 0.4313726, 1,
-0.1889688, 1.006724, 0.1515134, 0, 1, 0.4352941, 1,
-0.1717432, 0.9628836, -0.1352251, 0, 1, 0.4431373, 1,
-0.1715498, -1.155801, -3.041335, 0, 1, 0.4470588, 1,
-0.1706053, 0.8494984, 0.4266123, 0, 1, 0.454902, 1,
-0.161268, -0.3941755, -3.364528, 0, 1, 0.4588235, 1,
-0.1594812, 0.004609411, -0.9727122, 0, 1, 0.4666667, 1,
-0.1587067, -0.1006921, -3.303106, 0, 1, 0.4705882, 1,
-0.1537256, 1.0473, -0.9117826, 0, 1, 0.4784314, 1,
-0.1522651, -0.4247902, -4.660207, 0, 1, 0.4823529, 1,
-0.1506983, -0.2010888, -4.040722, 0, 1, 0.4901961, 1,
-0.1501914, 0.8194246, -2.030432, 0, 1, 0.4941176, 1,
-0.1453205, -0.3369302, -1.46876, 0, 1, 0.5019608, 1,
-0.1444848, -0.7064425, -1.706379, 0, 1, 0.509804, 1,
-0.1426114, 1.844441, -0.2335898, 0, 1, 0.5137255, 1,
-0.1407964, 0.1440252, -0.08090366, 0, 1, 0.5215687, 1,
-0.1363623, -1.387527, -2.863673, 0, 1, 0.5254902, 1,
-0.1344586, 0.7990417, -0.0508655, 0, 1, 0.5333334, 1,
-0.1317714, 0.04626986, -4.017726, 0, 1, 0.5372549, 1,
-0.1306071, -0.3760938, -1.759396, 0, 1, 0.5450981, 1,
-0.1301103, -0.5125142, -1.312994, 0, 1, 0.5490196, 1,
-0.1195002, 0.1262787, -1.795703, 0, 1, 0.5568628, 1,
-0.1142205, 0.04318557, -1.058081, 0, 1, 0.5607843, 1,
-0.1131748, 0.001226333, -0.6181946, 0, 1, 0.5686275, 1,
-0.1118376, 0.792091, -0.2643887, 0, 1, 0.572549, 1,
-0.1077361, -1.432241, -3.97247, 0, 1, 0.5803922, 1,
-0.1065276, -0.5754785, -3.270638, 0, 1, 0.5843138, 1,
-0.1020553, 0.08538295, -0.4045024, 0, 1, 0.5921569, 1,
-0.1018091, -0.8323835, -4.406588, 0, 1, 0.5960785, 1,
-0.09925577, -0.08245529, -1.546123, 0, 1, 0.6039216, 1,
-0.09801389, 1.150183, 0.756336, 0, 1, 0.6117647, 1,
-0.09540316, -1.376842, -3.048995, 0, 1, 0.6156863, 1,
-0.09484663, -1.346774, -3.288271, 0, 1, 0.6235294, 1,
-0.09417637, 0.7422507, -1.47333, 0, 1, 0.627451, 1,
-0.09398148, -0.2993425, -3.751068, 0, 1, 0.6352941, 1,
-0.09313252, 0.7786941, -1.187137, 0, 1, 0.6392157, 1,
-0.09280967, 1.926607, -1.241575, 0, 1, 0.6470588, 1,
-0.09179837, 1.454169, -1.893203, 0, 1, 0.6509804, 1,
-0.09055194, 0.6088343, 0.7802591, 0, 1, 0.6588235, 1,
-0.09025394, 0.2865557, 1.180724, 0, 1, 0.6627451, 1,
-0.08880521, -0.6109219, -5.155976, 0, 1, 0.6705883, 1,
-0.08745714, -0.2423909, -3.204519, 0, 1, 0.6745098, 1,
-0.08464377, -0.7124276, -3.930564, 0, 1, 0.682353, 1,
-0.07935055, -1.737439, -3.794446, 0, 1, 0.6862745, 1,
-0.07573406, -1.239085, -2.771907, 0, 1, 0.6941177, 1,
-0.07200165, 1.210427, -0.3787361, 0, 1, 0.7019608, 1,
-0.06856827, 0.409314, -1.196901, 0, 1, 0.7058824, 1,
-0.06718282, 0.3154098, -1.454597, 0, 1, 0.7137255, 1,
-0.06521297, -0.1842031, -3.442194, 0, 1, 0.7176471, 1,
-0.06120998, 1.892613, -0.1423366, 0, 1, 0.7254902, 1,
-0.05922999, 0.4283126, -2.051723, 0, 1, 0.7294118, 1,
-0.0571131, -0.2351886, -2.723524, 0, 1, 0.7372549, 1,
-0.04981677, 0.1170895, 0.03143123, 0, 1, 0.7411765, 1,
-0.04809643, -0.2823243, -3.790179, 0, 1, 0.7490196, 1,
-0.04758494, 0.6440223, -2.134497, 0, 1, 0.7529412, 1,
-0.04603401, 0.5121686, -0.02874917, 0, 1, 0.7607843, 1,
-0.04587727, 0.8449948, 0.2147439, 0, 1, 0.7647059, 1,
-0.04050501, 0.7903056, 1.181334, 0, 1, 0.772549, 1,
-0.03470645, -0.2878413, -2.927013, 0, 1, 0.7764706, 1,
-0.02927396, -0.2494459, -2.965479, 0, 1, 0.7843137, 1,
-0.02507012, 1.163575, -1.162899, 0, 1, 0.7882353, 1,
-0.02438082, -1.222474, -1.950092, 0, 1, 0.7960784, 1,
-0.02377752, -1.237128, -1.8474, 0, 1, 0.8039216, 1,
-0.01861208, -0.6984301, -4.747857, 0, 1, 0.8078431, 1,
-0.01831962, -2.101537, -3.92121, 0, 1, 0.8156863, 1,
-0.01446144, -1.463069, -3.109317, 0, 1, 0.8196079, 1,
-0.01299575, 0.4377092, -1.25097, 0, 1, 0.827451, 1,
-0.01075463, 0.6735254, -1.202238, 0, 1, 0.8313726, 1,
-0.009872814, 0.7593273, 0.9090792, 0, 1, 0.8392157, 1,
-0.007765343, 0.1805816, 0.4059805, 0, 1, 0.8431373, 1,
-0.006526839, -0.6816519, -4.420645, 0, 1, 0.8509804, 1,
-0.004886161, 0.2374492, -0.2057551, 0, 1, 0.854902, 1,
-0.002311485, -0.3340517, -3.404114, 0, 1, 0.8627451, 1,
0.0002804791, 0.2158477, 0.5483969, 0, 1, 0.8666667, 1,
0.0007718511, -2.266988, 2.543247, 0, 1, 0.8745098, 1,
0.0009280394, 1.741831, -1.017696, 0, 1, 0.8784314, 1,
0.001343085, 0.5752704, -0.6706434, 0, 1, 0.8862745, 1,
0.002959164, 0.3365666, -0.6122851, 0, 1, 0.8901961, 1,
0.003651432, -0.6698636, 2.872391, 0, 1, 0.8980392, 1,
0.004747805, -0.7726114, 1.90676, 0, 1, 0.9058824, 1,
0.004814524, 1.280199, -0.1628458, 0, 1, 0.9098039, 1,
0.006527695, -1.206256, 4.053805, 0, 1, 0.9176471, 1,
0.01149163, 0.9762784, 0.1247365, 0, 1, 0.9215686, 1,
0.01832548, 0.9376805, 0.1836584, 0, 1, 0.9294118, 1,
0.01932732, -1.093669, 3.007417, 0, 1, 0.9333333, 1,
0.02189201, -0.9098961, 4.311498, 0, 1, 0.9411765, 1,
0.02413837, -0.2911844, 3.887676, 0, 1, 0.945098, 1,
0.02446346, -0.732584, 3.199538, 0, 1, 0.9529412, 1,
0.02479964, 0.4571865, -1.420229, 0, 1, 0.9568627, 1,
0.02679821, 0.3544309, 2.198162, 0, 1, 0.9647059, 1,
0.02692203, -0.1045512, 2.134875, 0, 1, 0.9686275, 1,
0.0269379, -0.2139547, 2.650285, 0, 1, 0.9764706, 1,
0.03133051, -0.8525487, 3.029974, 0, 1, 0.9803922, 1,
0.03586655, -0.2265013, 3.177445, 0, 1, 0.9882353, 1,
0.03609656, -0.5150687, 3.948409, 0, 1, 0.9921569, 1,
0.03813164, -1.32459, 3.306525, 0, 1, 1, 1,
0.03872214, 1.330039, -1.893746, 0, 0.9921569, 1, 1,
0.0409448, 1.286322, 1.156068, 0, 0.9882353, 1, 1,
0.04702416, -0.3318799, 2.138906, 0, 0.9803922, 1, 1,
0.05168803, 0.307455, -0.1789367, 0, 0.9764706, 1, 1,
0.05388117, 0.3678659, 0.6589389, 0, 0.9686275, 1, 1,
0.05496337, 0.8766141, 0.3172699, 0, 0.9647059, 1, 1,
0.05675596, -1.500584, 4.414498, 0, 0.9568627, 1, 1,
0.0601947, -0.8801354, 3.362252, 0, 0.9529412, 1, 1,
0.06025693, -1.172888, 3.833032, 0, 0.945098, 1, 1,
0.06668596, -1.107125, 3.766394, 0, 0.9411765, 1, 1,
0.07570884, 0.5028386, -0.6294729, 0, 0.9333333, 1, 1,
0.07589713, -1.424906, 3.459223, 0, 0.9294118, 1, 1,
0.07671694, -0.390534, 4.401496, 0, 0.9215686, 1, 1,
0.07741328, -0.3583528, 2.774915, 0, 0.9176471, 1, 1,
0.08116549, -1.931575, 3.27726, 0, 0.9098039, 1, 1,
0.08441793, -0.7444214, 4.257228, 0, 0.9058824, 1, 1,
0.08702818, 2.360556, 1.245125, 0, 0.8980392, 1, 1,
0.08928064, -0.4035428, 2.405815, 0, 0.8901961, 1, 1,
0.09460034, -0.07200648, 2.89955, 0, 0.8862745, 1, 1,
0.09606118, -0.04256958, 2.596339, 0, 0.8784314, 1, 1,
0.097285, 1.969177, -0.8007547, 0, 0.8745098, 1, 1,
0.09759451, 1.642765, -0.08912686, 0, 0.8666667, 1, 1,
0.1023707, -2.470364, 4.799877, 0, 0.8627451, 1, 1,
0.1059773, 0.7447003, 0.7559453, 0, 0.854902, 1, 1,
0.1070083, 0.9090922, 0.1746176, 0, 0.8509804, 1, 1,
0.1070934, -1.240567, 3.320254, 0, 0.8431373, 1, 1,
0.1087254, 0.2870954, -1.039571, 0, 0.8392157, 1, 1,
0.1088675, -0.553205, 4.062867, 0, 0.8313726, 1, 1,
0.1094196, 0.0794444, 0.919988, 0, 0.827451, 1, 1,
0.1106189, -0.2213267, 1.455971, 0, 0.8196079, 1, 1,
0.1142406, 0.6806817, 0.8007928, 0, 0.8156863, 1, 1,
0.1220922, -0.08696554, 3.670268, 0, 0.8078431, 1, 1,
0.1229715, 0.1756436, 0.6639689, 0, 0.8039216, 1, 1,
0.1272134, -0.5945302, 2.991318, 0, 0.7960784, 1, 1,
0.1302116, 1.443417, -2.211579, 0, 0.7882353, 1, 1,
0.1309583, -0.6364875, 1.780674, 0, 0.7843137, 1, 1,
0.133967, -1.396357, 4.185351, 0, 0.7764706, 1, 1,
0.1345444, 1.046401, 0.2556209, 0, 0.772549, 1, 1,
0.1391973, -0.07952221, 2.614516, 0, 0.7647059, 1, 1,
0.140959, -1.517029, 2.263568, 0, 0.7607843, 1, 1,
0.1425508, 0.2529266, 0.2180454, 0, 0.7529412, 1, 1,
0.1431937, -0.5082298, 1.502035, 0, 0.7490196, 1, 1,
0.1438418, -0.5684394, 2.628529, 0, 0.7411765, 1, 1,
0.1473132, -0.7879551, 3.218926, 0, 0.7372549, 1, 1,
0.1474808, -0.0236732, 0.8233338, 0, 0.7294118, 1, 1,
0.1493817, 0.02481473, 2.267517, 0, 0.7254902, 1, 1,
0.1536837, -0.1309606, 0.8627124, 0, 0.7176471, 1, 1,
0.1543527, -2.788455, 4.679711, 0, 0.7137255, 1, 1,
0.1647442, -1.327483, 3.249463, 0, 0.7058824, 1, 1,
0.166488, 0.7003102, 0.9281819, 0, 0.6980392, 1, 1,
0.1705165, 0.2115688, -0.2378518, 0, 0.6941177, 1, 1,
0.1721889, -1.22698, 3.341875, 0, 0.6862745, 1, 1,
0.1733154, 1.305932, -1.891925, 0, 0.682353, 1, 1,
0.1761144, 0.212941, 0.7404611, 0, 0.6745098, 1, 1,
0.1868056, -0.744625, 2.294425, 0, 0.6705883, 1, 1,
0.1903736, 0.08036768, 2.947397, 0, 0.6627451, 1, 1,
0.1928812, -0.887512, 4.070322, 0, 0.6588235, 1, 1,
0.1929841, -1.525366, 4.032226, 0, 0.6509804, 1, 1,
0.1942409, -0.3819619, 4.047562, 0, 0.6470588, 1, 1,
0.2047047, -0.4743265, 2.399036, 0, 0.6392157, 1, 1,
0.2068519, -0.3511491, 2.067683, 0, 0.6352941, 1, 1,
0.2070723, -0.4703405, 2.692569, 0, 0.627451, 1, 1,
0.207244, 2.504061, -0.1459887, 0, 0.6235294, 1, 1,
0.207445, -0.8433892, 3.392589, 0, 0.6156863, 1, 1,
0.2160094, 0.4102146, -1.000536, 0, 0.6117647, 1, 1,
0.2167059, -0.1964206, 1.96427, 0, 0.6039216, 1, 1,
0.2172225, 1.633901, 1.511412, 0, 0.5960785, 1, 1,
0.2217185, -1.463006, 3.045457, 0, 0.5921569, 1, 1,
0.2274767, -0.0379499, 1.369966, 0, 0.5843138, 1, 1,
0.230809, -0.526033, 3.154109, 0, 0.5803922, 1, 1,
0.2362, -0.3507386, 1.458289, 0, 0.572549, 1, 1,
0.2379028, 0.07080422, 0.6564065, 0, 0.5686275, 1, 1,
0.238498, -0.7605103, 2.306962, 0, 0.5607843, 1, 1,
0.2418563, -0.1626358, 2.175668, 0, 0.5568628, 1, 1,
0.2420261, -0.9033263, 4.122132, 0, 0.5490196, 1, 1,
0.2435274, -0.7523911, 4.451792, 0, 0.5450981, 1, 1,
0.2456506, -1.048681, 2.1846, 0, 0.5372549, 1, 1,
0.2477435, -1.239716, 0.8840333, 0, 0.5333334, 1, 1,
0.250504, 1.21634, 1.813713, 0, 0.5254902, 1, 1,
0.2514498, -0.1255814, 2.212952, 0, 0.5215687, 1, 1,
0.2526049, -0.2235762, 2.453317, 0, 0.5137255, 1, 1,
0.2563285, 0.7511696, 0.2232898, 0, 0.509804, 1, 1,
0.2586753, 1.837384, 0.08775643, 0, 0.5019608, 1, 1,
0.2588277, 0.1427535, 1.686273, 0, 0.4941176, 1, 1,
0.258871, 0.6618911, 1.561615, 0, 0.4901961, 1, 1,
0.263176, -0.7960581, 2.973184, 0, 0.4823529, 1, 1,
0.2663728, -2.632252, 2.528702, 0, 0.4784314, 1, 1,
0.269402, -0.5778863, 2.279368, 0, 0.4705882, 1, 1,
0.2694049, -0.5452811, 2.999684, 0, 0.4666667, 1, 1,
0.2717316, -0.4788354, 3.721516, 0, 0.4588235, 1, 1,
0.2754661, 1.010985, -0.3893098, 0, 0.454902, 1, 1,
0.2786457, 0.4653381, -1.183936, 0, 0.4470588, 1, 1,
0.2807691, 0.3371599, 1.339867, 0, 0.4431373, 1, 1,
0.2821072, 1.357013, -0.9621204, 0, 0.4352941, 1, 1,
0.2838191, -1.359899, 2.18805, 0, 0.4313726, 1, 1,
0.2848568, -0.5367562, 0.7541062, 0, 0.4235294, 1, 1,
0.2876501, 0.00683663, 1.964408, 0, 0.4196078, 1, 1,
0.2879041, 0.4990361, 0.8900947, 0, 0.4117647, 1, 1,
0.2885351, 1.366303, 0.5029262, 0, 0.4078431, 1, 1,
0.2891608, 0.4836401, 1.079269, 0, 0.4, 1, 1,
0.2893102, -0.3212505, 1.441039, 0, 0.3921569, 1, 1,
0.2933419, 0.8018458, -0.192036, 0, 0.3882353, 1, 1,
0.3000459, 0.02497279, -0.1963513, 0, 0.3803922, 1, 1,
0.3000573, -0.08830457, 3.178106, 0, 0.3764706, 1, 1,
0.3009661, 0.9498169, -0.3103817, 0, 0.3686275, 1, 1,
0.3052244, -0.6712447, 3.197568, 0, 0.3647059, 1, 1,
0.3053527, -0.2671282, 2.878597, 0, 0.3568628, 1, 1,
0.3106623, 0.6803825, 0.2196002, 0, 0.3529412, 1, 1,
0.3141186, -0.7126337, 2.489057, 0, 0.345098, 1, 1,
0.3151667, -0.9338387, 2.157794, 0, 0.3411765, 1, 1,
0.3154999, 0.2633112, -0.08412701, 0, 0.3333333, 1, 1,
0.3197834, 0.1814512, 1.377044, 0, 0.3294118, 1, 1,
0.3202615, 0.07852129, 1.936069, 0, 0.3215686, 1, 1,
0.3277418, -0.0251311, -0.1682219, 0, 0.3176471, 1, 1,
0.3294813, -1.593921, 3.912333, 0, 0.3098039, 1, 1,
0.3299554, 2.134183, -0.8354301, 0, 0.3058824, 1, 1,
0.3340795, 0.6062357, 1.12885, 0, 0.2980392, 1, 1,
0.3342566, -0.8653944, 2.40189, 0, 0.2901961, 1, 1,
0.337497, -0.4169369, 3.576082, 0, 0.2862745, 1, 1,
0.3376143, 1.257119, 0.5004462, 0, 0.2784314, 1, 1,
0.339137, -1.030194, 3.486625, 0, 0.2745098, 1, 1,
0.3404516, 0.9468744, -0.8594403, 0, 0.2666667, 1, 1,
0.3440983, 2.329255, -0.6971405, 0, 0.2627451, 1, 1,
0.3459159, -1.321066, 2.356035, 0, 0.254902, 1, 1,
0.3494066, 1.015258, 1.046133, 0, 0.2509804, 1, 1,
0.3528675, 0.3091462, 1.041718, 0, 0.2431373, 1, 1,
0.3560937, -1.142103, 3.874572, 0, 0.2392157, 1, 1,
0.3576323, 0.5184104, 0.4319089, 0, 0.2313726, 1, 1,
0.3595631, -0.9642773, 5.355374, 0, 0.227451, 1, 1,
0.3648759, 1.067396, 1.997861, 0, 0.2196078, 1, 1,
0.3656042, -2.114759, 2.129138, 0, 0.2156863, 1, 1,
0.3664869, 0.4939959, 0.3642816, 0, 0.2078431, 1, 1,
0.3681829, 2.759252, 1.003334, 0, 0.2039216, 1, 1,
0.3711165, 0.2547241, 2.709005, 0, 0.1960784, 1, 1,
0.3797746, 1.57328, 0.002733146, 0, 0.1882353, 1, 1,
0.3805497, 0.07183021, 2.031026, 0, 0.1843137, 1, 1,
0.3833767, 0.4720189, 1.856987, 0, 0.1764706, 1, 1,
0.3838378, -2.00054, 1.511825, 0, 0.172549, 1, 1,
0.3866044, 0.8622619, -1.173109, 0, 0.1647059, 1, 1,
0.3882609, 0.9559518, 1.44727, 0, 0.1607843, 1, 1,
0.3916735, -1.02295, 2.161839, 0, 0.1529412, 1, 1,
0.3920512, 0.9597362, 0.3065347, 0, 0.1490196, 1, 1,
0.3940616, 0.8877867, 0.1250122, 0, 0.1411765, 1, 1,
0.3976882, -1.301458, 2.203298, 0, 0.1372549, 1, 1,
0.3988283, 0.3708181, 1.615265, 0, 0.1294118, 1, 1,
0.4016472, -0.1150295, 0.5110498, 0, 0.1254902, 1, 1,
0.4106182, -0.2377375, 1.645247, 0, 0.1176471, 1, 1,
0.411626, -0.1010094, -0.2897816, 0, 0.1137255, 1, 1,
0.4158086, 1.608342, 1.283498, 0, 0.1058824, 1, 1,
0.4222574, 0.1149839, -0.1812988, 0, 0.09803922, 1, 1,
0.4230069, 0.460177, 0.1615548, 0, 0.09411765, 1, 1,
0.4235064, 0.7987534, 1.479153, 0, 0.08627451, 1, 1,
0.4236447, -0.1108347, 0.4261665, 0, 0.08235294, 1, 1,
0.4241162, -1.258138, 3.910549, 0, 0.07450981, 1, 1,
0.4258002, 0.2421142, 1.703757, 0, 0.07058824, 1, 1,
0.4304289, 0.3419688, 3.048914, 0, 0.0627451, 1, 1,
0.43066, 0.4874013, 1.981768, 0, 0.05882353, 1, 1,
0.4320615, -0.077471, 0.7181289, 0, 0.05098039, 1, 1,
0.4380986, 0.5474517, 0.7085298, 0, 0.04705882, 1, 1,
0.4414251, 0.9627649, -0.6683912, 0, 0.03921569, 1, 1,
0.4512076, -1.888991, 5.164782, 0, 0.03529412, 1, 1,
0.4531378, -0.7650089, 2.920611, 0, 0.02745098, 1, 1,
0.4571195, -0.7841943, 2.055769, 0, 0.02352941, 1, 1,
0.45721, 0.1282246, 0.8765723, 0, 0.01568628, 1, 1,
0.4581662, -0.7574906, 3.500992, 0, 0.01176471, 1, 1,
0.4586109, 0.5897588, 0.1885411, 0, 0.003921569, 1, 1,
0.4659542, 0.7579187, -0.4919508, 0.003921569, 0, 1, 1,
0.466265, 1.377321, 1.137289, 0.007843138, 0, 1, 1,
0.4686368, -0.6383092, 2.549296, 0.01568628, 0, 1, 1,
0.4690032, 1.26602, 1.921346, 0.01960784, 0, 1, 1,
0.4697244, -0.4160752, 3.67331, 0.02745098, 0, 1, 1,
0.4709438, 0.008332552, 2.185935, 0.03137255, 0, 1, 1,
0.4735874, -1.554574, 2.689693, 0.03921569, 0, 1, 1,
0.4751542, -1.886946, 4.254928, 0.04313726, 0, 1, 1,
0.4760337, -0.5156631, 1.886902, 0.05098039, 0, 1, 1,
0.4773652, 0.1781597, 0.2513468, 0.05490196, 0, 1, 1,
0.4779596, 0.1877478, 0.7874441, 0.0627451, 0, 1, 1,
0.4812163, 0.1810172, 1.322867, 0.06666667, 0, 1, 1,
0.4812486, -1.480753, 2.307848, 0.07450981, 0, 1, 1,
0.4829825, 0.9923277, 0.5720789, 0.07843138, 0, 1, 1,
0.4888953, -1.783173, 1.873993, 0.08627451, 0, 1, 1,
0.4961206, -0.001046544, 2.802088, 0.09019608, 0, 1, 1,
0.5005192, 2.924553, -0.6151375, 0.09803922, 0, 1, 1,
0.5061132, 1.067289, 1.12953, 0.1058824, 0, 1, 1,
0.5080264, 0.2665306, 0.2363594, 0.1098039, 0, 1, 1,
0.5120658, -0.8012857, 2.314998, 0.1176471, 0, 1, 1,
0.5214387, 0.7385267, 0.7876939, 0.1215686, 0, 1, 1,
0.5219743, 1.180985, 2.477957, 0.1294118, 0, 1, 1,
0.5223314, -0.5123081, 1.929642, 0.1333333, 0, 1, 1,
0.5265198, -0.8740474, 3.068968, 0.1411765, 0, 1, 1,
0.5277055, -0.3184393, 2.918203, 0.145098, 0, 1, 1,
0.5288022, -0.7679198, 3.059867, 0.1529412, 0, 1, 1,
0.5311104, -2.465247, 1.50162, 0.1568628, 0, 1, 1,
0.5316367, -0.7717738, 3.335937, 0.1647059, 0, 1, 1,
0.5321293, 0.2100538, 1.37106, 0.1686275, 0, 1, 1,
0.5362567, -0.3946199, 2.496231, 0.1764706, 0, 1, 1,
0.5386776, -0.969741, 1.624934, 0.1803922, 0, 1, 1,
0.5413279, 0.327133, 1.385575, 0.1882353, 0, 1, 1,
0.5422869, -0.0911542, 1.485718, 0.1921569, 0, 1, 1,
0.5438868, 0.3746827, -0.2409732, 0.2, 0, 1, 1,
0.5450385, 0.5625411, 0.1106317, 0.2078431, 0, 1, 1,
0.5471545, -0.3060478, 1.774542, 0.2117647, 0, 1, 1,
0.5478635, 1.037222, 0.4790365, 0.2196078, 0, 1, 1,
0.5532991, -1.792579, 3.015779, 0.2235294, 0, 1, 1,
0.5553018, 0.8856769, -1.308648, 0.2313726, 0, 1, 1,
0.5568846, 0.2348938, 0.9766465, 0.2352941, 0, 1, 1,
0.5583117, -0.6181851, 2.080801, 0.2431373, 0, 1, 1,
0.5630473, -0.8608226, 1.489617, 0.2470588, 0, 1, 1,
0.5645477, -0.8692157, 2.947556, 0.254902, 0, 1, 1,
0.5688207, -0.04026212, 1.496656, 0.2588235, 0, 1, 1,
0.5732557, 0.2211492, 0.8377103, 0.2666667, 0, 1, 1,
0.5770172, -0.601541, 3.803244, 0.2705882, 0, 1, 1,
0.5798932, -0.7535144, 3.343121, 0.2784314, 0, 1, 1,
0.5806988, 1.076058, -0.3031296, 0.282353, 0, 1, 1,
0.5822893, -0.3685874, 1.959226, 0.2901961, 0, 1, 1,
0.5854874, 0.5541635, 2.349683, 0.2941177, 0, 1, 1,
0.5872445, 0.05597468, 0.9987317, 0.3019608, 0, 1, 1,
0.5925181, 0.6607559, 1.818997, 0.3098039, 0, 1, 1,
0.5950412, 1.984398, -1.813662, 0.3137255, 0, 1, 1,
0.6035056, -0.1489343, 2.014578, 0.3215686, 0, 1, 1,
0.6047578, 1.901992, 0.9460553, 0.3254902, 0, 1, 1,
0.6047969, 0.5337638, 1.810843, 0.3333333, 0, 1, 1,
0.6087453, -0.9671216, 1.726974, 0.3372549, 0, 1, 1,
0.6101609, 0.3808242, -0.01527512, 0.345098, 0, 1, 1,
0.6147079, 1.574984, -0.2660257, 0.3490196, 0, 1, 1,
0.6150486, 0.4927251, -0.9242393, 0.3568628, 0, 1, 1,
0.6171483, -0.7765659, 2.782389, 0.3607843, 0, 1, 1,
0.6196272, 0.2019527, -0.3674829, 0.3686275, 0, 1, 1,
0.6202071, 0.4395989, 0.6070926, 0.372549, 0, 1, 1,
0.6203141, 0.6185951, 2.725075, 0.3803922, 0, 1, 1,
0.6204411, 0.02155171, 0.9427608, 0.3843137, 0, 1, 1,
0.6207283, 0.8356058, 1.088865, 0.3921569, 0, 1, 1,
0.6208965, 0.9764093, -1.091796, 0.3960784, 0, 1, 1,
0.623432, -0.376201, 4.019366, 0.4039216, 0, 1, 1,
0.6280826, -0.6975985, 1.589456, 0.4117647, 0, 1, 1,
0.6306845, -0.5240697, 2.030149, 0.4156863, 0, 1, 1,
0.6308591, -0.8525143, 2.891562, 0.4235294, 0, 1, 1,
0.6334216, -0.6677575, 1.843681, 0.427451, 0, 1, 1,
0.6385404, 1.678766, 0.5754452, 0.4352941, 0, 1, 1,
0.6399873, -0.3222341, 2.634237, 0.4392157, 0, 1, 1,
0.6423167, 0.8648887, 0.3938952, 0.4470588, 0, 1, 1,
0.6492999, -0.6508327, 2.762422, 0.4509804, 0, 1, 1,
0.6515843, 0.7517418, -0.4258541, 0.4588235, 0, 1, 1,
0.6539852, -1.5673, 2.695036, 0.4627451, 0, 1, 1,
0.6560269, -1.112627, 2.533465, 0.4705882, 0, 1, 1,
0.6587626, -0.5502961, 2.028527, 0.4745098, 0, 1, 1,
0.6638794, 0.3244723, 0.07183629, 0.4823529, 0, 1, 1,
0.6642788, -0.5517046, 2.125522, 0.4862745, 0, 1, 1,
0.6728616, -0.2843245, 0.9300744, 0.4941176, 0, 1, 1,
0.675321, 0.5374941, -0.04422628, 0.5019608, 0, 1, 1,
0.6768848, -0.7223165, 3.230019, 0.5058824, 0, 1, 1,
0.6812162, 2.009816, 1.21861, 0.5137255, 0, 1, 1,
0.6843467, 0.2931944, 2.238151, 0.5176471, 0, 1, 1,
0.6896461, 1.940018, -0.7463766, 0.5254902, 0, 1, 1,
0.6926777, -1.452227, 2.947876, 0.5294118, 0, 1, 1,
0.6935434, -0.4478949, 3.088388, 0.5372549, 0, 1, 1,
0.6969934, 0.8332155, 0.2493785, 0.5411765, 0, 1, 1,
0.7119731, -0.8652477, 2.320605, 0.5490196, 0, 1, 1,
0.7284368, -0.9777945, 2.31337, 0.5529412, 0, 1, 1,
0.7319534, -0.2106277, 2.104517, 0.5607843, 0, 1, 1,
0.7387837, 0.8445758, -0.5095019, 0.5647059, 0, 1, 1,
0.7401891, 0.105203, 2.244877, 0.572549, 0, 1, 1,
0.7410427, -1.717525, 3.189195, 0.5764706, 0, 1, 1,
0.7413999, -0.878202, 2.372536, 0.5843138, 0, 1, 1,
0.7612314, 0.1421296, 1.537562, 0.5882353, 0, 1, 1,
0.7634426, -0.7874168, 3.201519, 0.5960785, 0, 1, 1,
0.7666266, -0.6486503, 3.017738, 0.6039216, 0, 1, 1,
0.768101, -1.710341, 2.736444, 0.6078432, 0, 1, 1,
0.7713143, 1.459438, 2.112942, 0.6156863, 0, 1, 1,
0.7723513, -1.253207, 2.795572, 0.6196079, 0, 1, 1,
0.7768939, 0.252273, 1.929865, 0.627451, 0, 1, 1,
0.7780418, -0.5413027, 2.662612, 0.6313726, 0, 1, 1,
0.7780582, 0.9343323, 0.3426148, 0.6392157, 0, 1, 1,
0.7784859, 1.1407, 0.9007048, 0.6431373, 0, 1, 1,
0.7792126, 1.548382, 0.8876959, 0.6509804, 0, 1, 1,
0.7851124, 0.9225307, 1.62567, 0.654902, 0, 1, 1,
0.7872939, 0.6841068, 0.5245827, 0.6627451, 0, 1, 1,
0.7880739, 0.5565267, 1.314643, 0.6666667, 0, 1, 1,
0.7891427, 0.09608904, 1.69191, 0.6745098, 0, 1, 1,
0.7905996, 0.08164669, 1.953408, 0.6784314, 0, 1, 1,
0.794266, 0.02511641, 1.324328, 0.6862745, 0, 1, 1,
0.7944736, 0.969435, 1.284525, 0.6901961, 0, 1, 1,
0.8012477, 2.764596, -1.161647, 0.6980392, 0, 1, 1,
0.8041411, -0.2620124, 1.755208, 0.7058824, 0, 1, 1,
0.805033, 0.2375163, 2.044976, 0.7098039, 0, 1, 1,
0.8069872, -1.028586, 1.923616, 0.7176471, 0, 1, 1,
0.8086303, 0.2118006, 0.1095906, 0.7215686, 0, 1, 1,
0.8128507, 2.24632, 1.799633, 0.7294118, 0, 1, 1,
0.8142631, -0.2966719, 2.07062, 0.7333333, 0, 1, 1,
0.8158095, 0.09392592, 0.9535923, 0.7411765, 0, 1, 1,
0.816048, 1.434582, 0.5397376, 0.7450981, 0, 1, 1,
0.8183514, 0.6893146, -0.5098689, 0.7529412, 0, 1, 1,
0.8208788, -2.004742, 1.347099, 0.7568628, 0, 1, 1,
0.8220487, -1.168057, 4.334171, 0.7647059, 0, 1, 1,
0.8232601, 0.3811815, 2.97433, 0.7686275, 0, 1, 1,
0.8380492, -0.3121905, 1.606312, 0.7764706, 0, 1, 1,
0.8456307, 0.4254171, 0.9137018, 0.7803922, 0, 1, 1,
0.8490369, -1.398798, 2.803398, 0.7882353, 0, 1, 1,
0.8540432, -1.807423, 2.386701, 0.7921569, 0, 1, 1,
0.8559756, 0.2050297, 0.230393, 0.8, 0, 1, 1,
0.8644556, 1.16861, 0.4257287, 0.8078431, 0, 1, 1,
0.8694334, 1.838825, 0.3803267, 0.8117647, 0, 1, 1,
0.8699184, 0.5760337, 1.487401, 0.8196079, 0, 1, 1,
0.871759, -0.5522152, 0.5260842, 0.8235294, 0, 1, 1,
0.8726971, 1.331822, 0.9192425, 0.8313726, 0, 1, 1,
0.8732792, 0.5477587, 2.363707, 0.8352941, 0, 1, 1,
0.8751231, 0.0004417578, 2.329731, 0.8431373, 0, 1, 1,
0.875393, -0.5457822, 0.2342827, 0.8470588, 0, 1, 1,
0.8771352, -0.05244824, 1.198286, 0.854902, 0, 1, 1,
0.878624, -0.0827197, 0.9234699, 0.8588235, 0, 1, 1,
0.8800248, -0.3949376, 0.5339054, 0.8666667, 0, 1, 1,
0.8844357, 0.2966818, 1.367414, 0.8705882, 0, 1, 1,
0.8856564, 1.516269, -0.2222014, 0.8784314, 0, 1, 1,
0.8861145, -0.7791517, 2.911855, 0.8823529, 0, 1, 1,
0.8866758, 3.059622, -1.111407, 0.8901961, 0, 1, 1,
0.8872065, -0.1464175, 2.325385, 0.8941177, 0, 1, 1,
0.8966558, 2.49031, 0.5191987, 0.9019608, 0, 1, 1,
0.9020289, 0.5548291, 0.1976823, 0.9098039, 0, 1, 1,
0.9060385, 0.6950795, 0.8597033, 0.9137255, 0, 1, 1,
0.9088435, 0.4879583, 0.7543763, 0.9215686, 0, 1, 1,
0.9203617, -1.900401, 3.849651, 0.9254902, 0, 1, 1,
0.9250883, 0.5146273, 1.748301, 0.9333333, 0, 1, 1,
0.930424, -1.707442, 2.534199, 0.9372549, 0, 1, 1,
0.9345759, 0.7420291, 0.8349486, 0.945098, 0, 1, 1,
0.9409884, 0.1093468, 2.607179, 0.9490196, 0, 1, 1,
0.9473255, -1.402676, 1.345158, 0.9568627, 0, 1, 1,
0.9546415, 1.899884, -0.8532648, 0.9607843, 0, 1, 1,
0.9553455, 0.1193338, 1.321051, 0.9686275, 0, 1, 1,
0.9557907, 1.187854, 1.853337, 0.972549, 0, 1, 1,
0.9677112, -0.158393, 0.8853102, 0.9803922, 0, 1, 1,
0.9771609, -1.021497, 3.329912, 0.9843137, 0, 1, 1,
0.9787479, -0.4716044, 2.116477, 0.9921569, 0, 1, 1,
0.9854059, 0.7769042, 0.1565047, 0.9960784, 0, 1, 1,
0.9863295, -1.847767, 1.604853, 1, 0, 0.9960784, 1,
0.9910156, 0.4557515, 0.8641713, 1, 0, 0.9882353, 1,
0.9996134, -0.3792097, 1.435628, 1, 0, 0.9843137, 1,
1.000746, 0.1621216, -0.5206389, 1, 0, 0.9764706, 1,
1.006168, -0.8683382, 2.187674, 1, 0, 0.972549, 1,
1.007569, -1.399559, 1.3856, 1, 0, 0.9647059, 1,
1.009437, -1.001707, 2.751821, 1, 0, 0.9607843, 1,
1.014348, 0.5509897, 1.820829, 1, 0, 0.9529412, 1,
1.015261, -0.2605032, 3.528481, 1, 0, 0.9490196, 1,
1.018497, -0.1210547, 0.3187379, 1, 0, 0.9411765, 1,
1.029187, -0.6912748, 1.801846, 1, 0, 0.9372549, 1,
1.032593, -0.1669691, 2.197158, 1, 0, 0.9294118, 1,
1.035896, 1.938896, 0.4437433, 1, 0, 0.9254902, 1,
1.041456, -0.1201659, 3.225433, 1, 0, 0.9176471, 1,
1.045332, -0.123125, 2.329289, 1, 0, 0.9137255, 1,
1.055277, 0.05898844, 1.863505, 1, 0, 0.9058824, 1,
1.055369, 0.4838914, 0.8208833, 1, 0, 0.9019608, 1,
1.063279, 0.2251754, -1.07229, 1, 0, 0.8941177, 1,
1.06508, -0.4257134, 2.788121, 1, 0, 0.8862745, 1,
1.067161, -0.9488263, 2.827998, 1, 0, 0.8823529, 1,
1.067925, 1.308835, 1.25149, 1, 0, 0.8745098, 1,
1.071097, 1.141595, 1.268581, 1, 0, 0.8705882, 1,
1.07157, 0.9365282, 1.589887, 1, 0, 0.8627451, 1,
1.072917, 0.164048, -0.3661209, 1, 0, 0.8588235, 1,
1.08241, -0.2733113, 1.804063, 1, 0, 0.8509804, 1,
1.08383, -0.3675553, 0.6009859, 1, 0, 0.8470588, 1,
1.085762, 0.05445337, 1.396355, 1, 0, 0.8392157, 1,
1.085916, -0.6301962, 0.4478102, 1, 0, 0.8352941, 1,
1.087142, -1.095197, 1.777148, 1, 0, 0.827451, 1,
1.093537, 0.3352932, 2.73009, 1, 0, 0.8235294, 1,
1.11325, 0.162025, 1.937906, 1, 0, 0.8156863, 1,
1.115977, -0.3349207, 2.342117, 1, 0, 0.8117647, 1,
1.117381, -1.823922, 1.958122, 1, 0, 0.8039216, 1,
1.118146, -1.988837, 3.488765, 1, 0, 0.7960784, 1,
1.129154, 0.1333494, 0.9496633, 1, 0, 0.7921569, 1,
1.131777, -0.7083088, 2.745051, 1, 0, 0.7843137, 1,
1.142635, -0.1180803, 3.681786, 1, 0, 0.7803922, 1,
1.145176, 0.3170285, 1.918155, 1, 0, 0.772549, 1,
1.15251, -1.023289, 3.877039, 1, 0, 0.7686275, 1,
1.158291, 1.339857, 0.2411527, 1, 0, 0.7607843, 1,
1.162781, 0.3112891, 1.015064, 1, 0, 0.7568628, 1,
1.163494, 1.06445, 0.8144128, 1, 0, 0.7490196, 1,
1.165887, -1.432727, 1.378826, 1, 0, 0.7450981, 1,
1.170194, 0.6883061, 1.05795, 1, 0, 0.7372549, 1,
1.175888, -0.8114922, 2.688076, 1, 0, 0.7333333, 1,
1.176498, -0.07680031, 2.614051, 1, 0, 0.7254902, 1,
1.194406, 1.075407, 2.027146, 1, 0, 0.7215686, 1,
1.194431, 1.357711, -0.3576328, 1, 0, 0.7137255, 1,
1.204108, -0.4960451, 2.855096, 1, 0, 0.7098039, 1,
1.207281, -2.140231, 2.658115, 1, 0, 0.7019608, 1,
1.211259, -0.597751, 1.352652, 1, 0, 0.6941177, 1,
1.212072, -1.353498, 2.088634, 1, 0, 0.6901961, 1,
1.217549, 1.024834, 2.020162, 1, 0, 0.682353, 1,
1.22225, -1.655891, 3.529206, 1, 0, 0.6784314, 1,
1.222307, -1.363068, 3.63509, 1, 0, 0.6705883, 1,
1.224221, -0.1368039, 3.447548, 1, 0, 0.6666667, 1,
1.226158, 0.1696502, 0.7409575, 1, 0, 0.6588235, 1,
1.237701, -1.154755, 2.651329, 1, 0, 0.654902, 1,
1.239486, -1.379706, 0.8579536, 1, 0, 0.6470588, 1,
1.243235, 0.1937791, 1.703375, 1, 0, 0.6431373, 1,
1.249471, -1.776724, 2.666238, 1, 0, 0.6352941, 1,
1.250634, -0.7838271, 2.975018, 1, 0, 0.6313726, 1,
1.25694, 0.3960084, 1.605709, 1, 0, 0.6235294, 1,
1.272038, -0.5602575, 2.56805, 1, 0, 0.6196079, 1,
1.290351, 0.9090291, 0.6727532, 1, 0, 0.6117647, 1,
1.299554, 0.2966629, 2.5754, 1, 0, 0.6078432, 1,
1.305752, 2.765351, -0.4936422, 1, 0, 0.6, 1,
1.308503, 0.8193026, 0.2541503, 1, 0, 0.5921569, 1,
1.310059, -1.699789, 0.453661, 1, 0, 0.5882353, 1,
1.315775, -0.6991895, 3.959917, 1, 0, 0.5803922, 1,
1.327697, -1.147108, 1.21296, 1, 0, 0.5764706, 1,
1.329737, -1.809211, 3.927188, 1, 0, 0.5686275, 1,
1.331834, -0.6113489, 1.333273, 1, 0, 0.5647059, 1,
1.339736, 1.165627, 0.3334194, 1, 0, 0.5568628, 1,
1.339962, 0.7033123, 1.386395, 1, 0, 0.5529412, 1,
1.34048, -0.3750195, 0.4901449, 1, 0, 0.5450981, 1,
1.343635, 0.8297436, 1.467808, 1, 0, 0.5411765, 1,
1.344154, 0.02599396, 3.390545, 1, 0, 0.5333334, 1,
1.356135, 0.6298555, 1.611466, 1, 0, 0.5294118, 1,
1.357837, -0.7742363, 1.829032, 1, 0, 0.5215687, 1,
1.361158, 0.3868128, -0.2332183, 1, 0, 0.5176471, 1,
1.363037, 0.1864787, 0.3864699, 1, 0, 0.509804, 1,
1.364491, 0.5840467, 1.528865, 1, 0, 0.5058824, 1,
1.377654, -0.4213351, 1.283245, 1, 0, 0.4980392, 1,
1.384609, 0.7285776, 0.633756, 1, 0, 0.4901961, 1,
1.387375, -0.416754, 0.7828152, 1, 0, 0.4862745, 1,
1.389429, 0.09575815, 2.039941, 1, 0, 0.4784314, 1,
1.389977, 1.143025, 0.3566353, 1, 0, 0.4745098, 1,
1.409166, -0.02952828, 1.687312, 1, 0, 0.4666667, 1,
1.410725, -0.7919752, 1.553211, 1, 0, 0.4627451, 1,
1.418039, -1.037842, 1.342745, 1, 0, 0.454902, 1,
1.418514, -0.7767711, 1.594864, 1, 0, 0.4509804, 1,
1.437952, -1.309882, 2.070211, 1, 0, 0.4431373, 1,
1.453404, -1.720605, 3.477278, 1, 0, 0.4392157, 1,
1.460968, -0.2534318, 1.261544, 1, 0, 0.4313726, 1,
1.490248, -1.34915, 2.19539, 1, 0, 0.427451, 1,
1.492814, 1.406737, 1.506404, 1, 0, 0.4196078, 1,
1.51233, 0.6072788, 3.487352, 1, 0, 0.4156863, 1,
1.52124, 0.728278, 2.177737, 1, 0, 0.4078431, 1,
1.522693, -1.294485, 2.516427, 1, 0, 0.4039216, 1,
1.530348, 0.2495453, -0.05161841, 1, 0, 0.3960784, 1,
1.533145, 0.1669427, 1.024213, 1, 0, 0.3882353, 1,
1.534845, 1.341318, -1.421, 1, 0, 0.3843137, 1,
1.539976, -0.9985739, 2.829295, 1, 0, 0.3764706, 1,
1.54053, -1.027421, 2.56265, 1, 0, 0.372549, 1,
1.54226, -0.5558628, 1.589113, 1, 0, 0.3647059, 1,
1.576213, 1.539222, -0.3156533, 1, 0, 0.3607843, 1,
1.61397, -0.3688046, 2.680125, 1, 0, 0.3529412, 1,
1.627438, -0.127954, 2.068012, 1, 0, 0.3490196, 1,
1.62824, -0.962387, 1.977933, 1, 0, 0.3411765, 1,
1.63115, -0.7812254, 1.877184, 1, 0, 0.3372549, 1,
1.677987, -0.149735, 2.55596, 1, 0, 0.3294118, 1,
1.692194, -0.1735433, 2.802767, 1, 0, 0.3254902, 1,
1.702766, -0.005291045, 0.8720877, 1, 0, 0.3176471, 1,
1.709523, 1.240351, 1.263957, 1, 0, 0.3137255, 1,
1.749689, -0.3876977, 1.863773, 1, 0, 0.3058824, 1,
1.763876, 0.5822376, 1.859639, 1, 0, 0.2980392, 1,
1.778215, 0.4656022, 0.5897247, 1, 0, 0.2941177, 1,
1.780091, -1.72042, 3.273087, 1, 0, 0.2862745, 1,
1.797015, -0.2399624, 1.698817, 1, 0, 0.282353, 1,
1.800195, 0.5354017, 3.494162, 1, 0, 0.2745098, 1,
1.800883, -1.335265, 2.034751, 1, 0, 0.2705882, 1,
1.825835, 1.191144, 2.100324, 1, 0, 0.2627451, 1,
1.836313, 0.6204249, 0.7708701, 1, 0, 0.2588235, 1,
1.842882, -0.6076253, 0.5630284, 1, 0, 0.2509804, 1,
1.849553, 2.172956, 0.4631133, 1, 0, 0.2470588, 1,
1.861455, -3.122617, 3.322099, 1, 0, 0.2392157, 1,
1.862576, 0.3704987, 1.468132, 1, 0, 0.2352941, 1,
1.869477, 0.440334, -0.1714109, 1, 0, 0.227451, 1,
1.873634, -0.03391233, -1.82845, 1, 0, 0.2235294, 1,
1.878294, 0.3113043, 1.09842, 1, 0, 0.2156863, 1,
1.880876, 0.4465341, 0.9004071, 1, 0, 0.2117647, 1,
1.897651, -0.6536334, 3.360104, 1, 0, 0.2039216, 1,
1.904515, 0.4324453, 0.7749099, 1, 0, 0.1960784, 1,
1.91795, 0.3477614, 0.1260385, 1, 0, 0.1921569, 1,
1.91962, 1.095345, -0.1309312, 1, 0, 0.1843137, 1,
1.937553, -0.06099675, 0.912237, 1, 0, 0.1803922, 1,
1.945762, -0.0006019381, 1.122773, 1, 0, 0.172549, 1,
2.017289, 0.04871813, 0.1615959, 1, 0, 0.1686275, 1,
2.077109, -0.5873094, 2.739538, 1, 0, 0.1607843, 1,
2.080332, 0.7937258, 2.386453, 1, 0, 0.1568628, 1,
2.109332, 0.7847512, -0.02775058, 1, 0, 0.1490196, 1,
2.111078, -2.398406, 1.753571, 1, 0, 0.145098, 1,
2.152976, 0.7145348, 1.241601, 1, 0, 0.1372549, 1,
2.175278, -0.8063649, 1.76156, 1, 0, 0.1333333, 1,
2.177127, -0.4159798, 2.282482, 1, 0, 0.1254902, 1,
2.183838, 0.5161979, 0.675583, 1, 0, 0.1215686, 1,
2.184672, 0.3578024, 0.4208331, 1, 0, 0.1137255, 1,
2.255899, 0.8890263, 1.139092, 1, 0, 0.1098039, 1,
2.29206, -0.2252446, 2.200654, 1, 0, 0.1019608, 1,
2.307599, 0.5545499, 2.642131, 1, 0, 0.09411765, 1,
2.322545, -0.4926895, 2.098931, 1, 0, 0.09019608, 1,
2.34195, 1.154914, 3.376818, 1, 0, 0.08235294, 1,
2.361606, 1.70152, 0.463624, 1, 0, 0.07843138, 1,
2.555989, 1.679931, -0.9984084, 1, 0, 0.07058824, 1,
2.579975, 1.701414, 0.4880497, 1, 0, 0.06666667, 1,
2.589243, 0.5420709, 0.5283355, 1, 0, 0.05882353, 1,
2.66204, -1.126517, 0.8246134, 1, 0, 0.05490196, 1,
2.707207, 1.016193, 0.6831229, 1, 0, 0.04705882, 1,
2.713515, -2.038315, 0.239313, 1, 0, 0.04313726, 1,
2.717929, 0.5881684, 1.726723, 1, 0, 0.03529412, 1,
2.718505, -1.19455, 1.486466, 1, 0, 0.03137255, 1,
2.743435, 0.9447314, 1.707411, 1, 0, 0.02352941, 1,
2.817479, -0.8329348, 0.7304713, 1, 0, 0.01960784, 1,
2.949774, -0.239146, 1.218289, 1, 0, 0.01176471, 1,
3.32116, -0.4264539, 1.105343, 1, 0, 0.007843138, 1
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
0.2019809, -4.324878, -7.022037, 0, -0.5, 0.5, 0.5,
0.2019809, -4.324878, -7.022037, 1, -0.5, 0.5, 0.5,
0.2019809, -4.324878, -7.022037, 1, 1.5, 0.5, 0.5,
0.2019809, -4.324878, -7.022037, 0, 1.5, 0.5, 0.5
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
-3.974599, -0.09749639, -7.022037, 0, -0.5, 0.5, 0.5,
-3.974599, -0.09749639, -7.022037, 1, -0.5, 0.5, 0.5,
-3.974599, -0.09749639, -7.022037, 1, 1.5, 0.5, 0.5,
-3.974599, -0.09749639, -7.022037, 0, 1.5, 0.5, 0.5
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
-3.974599, -4.324878, 0.06362081, 0, -0.5, 0.5, 0.5,
-3.974599, -4.324878, 0.06362081, 1, -0.5, 0.5, 0.5,
-3.974599, -4.324878, 0.06362081, 1, 1.5, 0.5, 0.5,
-3.974599, -4.324878, 0.06362081, 0, 1.5, 0.5, 0.5
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
-2, -3.349328, -5.386885,
3, -3.349328, -5.386885,
-2, -3.349328, -5.386885,
-2, -3.51192, -5.65941,
-1, -3.349328, -5.386885,
-1, -3.51192, -5.65941,
0, -3.349328, -5.386885,
0, -3.51192, -5.65941,
1, -3.349328, -5.386885,
1, -3.51192, -5.65941,
2, -3.349328, -5.386885,
2, -3.51192, -5.65941,
3, -3.349328, -5.386885,
3, -3.51192, -5.65941
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
-2, -3.837103, -6.204461, 0, -0.5, 0.5, 0.5,
-2, -3.837103, -6.204461, 1, -0.5, 0.5, 0.5,
-2, -3.837103, -6.204461, 1, 1.5, 0.5, 0.5,
-2, -3.837103, -6.204461, 0, 1.5, 0.5, 0.5,
-1, -3.837103, -6.204461, 0, -0.5, 0.5, 0.5,
-1, -3.837103, -6.204461, 1, -0.5, 0.5, 0.5,
-1, -3.837103, -6.204461, 1, 1.5, 0.5, 0.5,
-1, -3.837103, -6.204461, 0, 1.5, 0.5, 0.5,
0, -3.837103, -6.204461, 0, -0.5, 0.5, 0.5,
0, -3.837103, -6.204461, 1, -0.5, 0.5, 0.5,
0, -3.837103, -6.204461, 1, 1.5, 0.5, 0.5,
0, -3.837103, -6.204461, 0, 1.5, 0.5, 0.5,
1, -3.837103, -6.204461, 0, -0.5, 0.5, 0.5,
1, -3.837103, -6.204461, 1, -0.5, 0.5, 0.5,
1, -3.837103, -6.204461, 1, 1.5, 0.5, 0.5,
1, -3.837103, -6.204461, 0, 1.5, 0.5, 0.5,
2, -3.837103, -6.204461, 0, -0.5, 0.5, 0.5,
2, -3.837103, -6.204461, 1, -0.5, 0.5, 0.5,
2, -3.837103, -6.204461, 1, 1.5, 0.5, 0.5,
2, -3.837103, -6.204461, 0, 1.5, 0.5, 0.5,
3, -3.837103, -6.204461, 0, -0.5, 0.5, 0.5,
3, -3.837103, -6.204461, 1, -0.5, 0.5, 0.5,
3, -3.837103, -6.204461, 1, 1.5, 0.5, 0.5,
3, -3.837103, -6.204461, 0, 1.5, 0.5, 0.5
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
-3.010773, -3, -5.386885,
-3.010773, 3, -5.386885,
-3.010773, -3, -5.386885,
-3.171411, -3, -5.65941,
-3.010773, -2, -5.386885,
-3.171411, -2, -5.65941,
-3.010773, -1, -5.386885,
-3.171411, -1, -5.65941,
-3.010773, 0, -5.386885,
-3.171411, 0, -5.65941,
-3.010773, 1, -5.386885,
-3.171411, 1, -5.65941,
-3.010773, 2, -5.386885,
-3.171411, 2, -5.65941,
-3.010773, 3, -5.386885,
-3.171411, 3, -5.65941
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
-3.492686, -3, -6.204461, 0, -0.5, 0.5, 0.5,
-3.492686, -3, -6.204461, 1, -0.5, 0.5, 0.5,
-3.492686, -3, -6.204461, 1, 1.5, 0.5, 0.5,
-3.492686, -3, -6.204461, 0, 1.5, 0.5, 0.5,
-3.492686, -2, -6.204461, 0, -0.5, 0.5, 0.5,
-3.492686, -2, -6.204461, 1, -0.5, 0.5, 0.5,
-3.492686, -2, -6.204461, 1, 1.5, 0.5, 0.5,
-3.492686, -2, -6.204461, 0, 1.5, 0.5, 0.5,
-3.492686, -1, -6.204461, 0, -0.5, 0.5, 0.5,
-3.492686, -1, -6.204461, 1, -0.5, 0.5, 0.5,
-3.492686, -1, -6.204461, 1, 1.5, 0.5, 0.5,
-3.492686, -1, -6.204461, 0, 1.5, 0.5, 0.5,
-3.492686, 0, -6.204461, 0, -0.5, 0.5, 0.5,
-3.492686, 0, -6.204461, 1, -0.5, 0.5, 0.5,
-3.492686, 0, -6.204461, 1, 1.5, 0.5, 0.5,
-3.492686, 0, -6.204461, 0, 1.5, 0.5, 0.5,
-3.492686, 1, -6.204461, 0, -0.5, 0.5, 0.5,
-3.492686, 1, -6.204461, 1, -0.5, 0.5, 0.5,
-3.492686, 1, -6.204461, 1, 1.5, 0.5, 0.5,
-3.492686, 1, -6.204461, 0, 1.5, 0.5, 0.5,
-3.492686, 2, -6.204461, 0, -0.5, 0.5, 0.5,
-3.492686, 2, -6.204461, 1, -0.5, 0.5, 0.5,
-3.492686, 2, -6.204461, 1, 1.5, 0.5, 0.5,
-3.492686, 2, -6.204461, 0, 1.5, 0.5, 0.5,
-3.492686, 3, -6.204461, 0, -0.5, 0.5, 0.5,
-3.492686, 3, -6.204461, 1, -0.5, 0.5, 0.5,
-3.492686, 3, -6.204461, 1, 1.5, 0.5, 0.5,
-3.492686, 3, -6.204461, 0, 1.5, 0.5, 0.5
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
-3.010773, -3.349328, -4,
-3.010773, -3.349328, 4,
-3.010773, -3.349328, -4,
-3.171411, -3.51192, -4,
-3.010773, -3.349328, -2,
-3.171411, -3.51192, -2,
-3.010773, -3.349328, 0,
-3.171411, -3.51192, 0,
-3.010773, -3.349328, 2,
-3.171411, -3.51192, 2,
-3.010773, -3.349328, 4,
-3.171411, -3.51192, 4
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
-3.492686, -3.837103, -4, 0, -0.5, 0.5, 0.5,
-3.492686, -3.837103, -4, 1, -0.5, 0.5, 0.5,
-3.492686, -3.837103, -4, 1, 1.5, 0.5, 0.5,
-3.492686, -3.837103, -4, 0, 1.5, 0.5, 0.5,
-3.492686, -3.837103, -2, 0, -0.5, 0.5, 0.5,
-3.492686, -3.837103, -2, 1, -0.5, 0.5, 0.5,
-3.492686, -3.837103, -2, 1, 1.5, 0.5, 0.5,
-3.492686, -3.837103, -2, 0, 1.5, 0.5, 0.5,
-3.492686, -3.837103, 0, 0, -0.5, 0.5, 0.5,
-3.492686, -3.837103, 0, 1, -0.5, 0.5, 0.5,
-3.492686, -3.837103, 0, 1, 1.5, 0.5, 0.5,
-3.492686, -3.837103, 0, 0, 1.5, 0.5, 0.5,
-3.492686, -3.837103, 2, 0, -0.5, 0.5, 0.5,
-3.492686, -3.837103, 2, 1, -0.5, 0.5, 0.5,
-3.492686, -3.837103, 2, 1, 1.5, 0.5, 0.5,
-3.492686, -3.837103, 2, 0, 1.5, 0.5, 0.5,
-3.492686, -3.837103, 4, 0, -0.5, 0.5, 0.5,
-3.492686, -3.837103, 4, 1, -0.5, 0.5, 0.5,
-3.492686, -3.837103, 4, 1, 1.5, 0.5, 0.5,
-3.492686, -3.837103, 4, 0, 1.5, 0.5, 0.5
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
-3.010773, -3.349328, -5.386885,
-3.010773, 3.154335, -5.386885,
-3.010773, -3.349328, 5.514127,
-3.010773, 3.154335, 5.514127,
-3.010773, -3.349328, -5.386885,
-3.010773, -3.349328, 5.514127,
-3.010773, 3.154335, -5.386885,
-3.010773, 3.154335, 5.514127,
-3.010773, -3.349328, -5.386885,
3.414735, -3.349328, -5.386885,
-3.010773, -3.349328, 5.514127,
3.414735, -3.349328, 5.514127,
-3.010773, 3.154335, -5.386885,
3.414735, 3.154335, -5.386885,
-3.010773, 3.154335, 5.514127,
3.414735, 3.154335, 5.514127,
3.414735, -3.349328, -5.386885,
3.414735, 3.154335, -5.386885,
3.414735, -3.349328, 5.514127,
3.414735, 3.154335, 5.514127,
3.414735, -3.349328, -5.386885,
3.414735, -3.349328, 5.514127,
3.414735, 3.154335, -5.386885,
3.414735, 3.154335, 5.514127
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
var radius = 7.597117;
var distance = 33.80043;
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
mvMatrix.translate( -0.2019809, 0.09749639, -0.06362081 );
mvMatrix.scale( 1.278366, 1.263004, 0.7535219 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.80043);
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


